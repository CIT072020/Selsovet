unit fChoiceAdres;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, TypInfo, Controls, Forms, Dialogs, uProject,uProjectAll,
  TB2Dock, TB2Toolbar, dBase, TB2Item, ComCtrls, contnrs, db, adsdata, fAddAdres, MetaTask,
  adsfunc, adstable, FuncPr, fChoiceUL, fmChList, ImgList, uCheckTreeView,
  adscnnct;

type

  TTypeItem = (toPunkt, toUL, toBigDom, toDom );

  TSmallAdres=record
    Punkt:Integer;
    Ulica:Integer;
    Dom:String;
    Korp:String;
  end;
  TArrSmallAdres=array of TSmallAdres;

  TfmChoiceAdres = class;

  TTreeItem = class(TObject)
  private
  public
    Owner : TfmChoiceAdres;
    Tip : TTypeItem;
    ID  : Integer;   // id в базе адресов
    Name : String;
    KrName:String;
    ArrLich : TArrLich;
    EnableChoice:Boolean;
    SpecUch:Boolean;
    Punkt:Integer;
    Ulica:Integer;
    Dom:String;
    Korp:String;
    function GetDateFiks : TDateTime;
    constructor Create;
    destructor Destroy; override;
  end;

  TfmChoiceAdres = class(TForm)
    TBDock1: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemOk: TTBItem;
    TBItemCancel: TTBItem;
    TBItemNewHouse: TTBItem;
    TBItemNewUL: TTBItem;
    Query: TAdsQuery;
    TBItemRefresh: TTBItem;
    TBItemDel: TTBItem;
    ImageList: TImageList;
    stb: TStatusBar;
    TBItemCheckKv: TTBItem;
    tbSubMenuProp: TTBSubmenuItem;
    TBItemReloadLic: TTBItem;
    Tr: TGSCheckedTreeView;
    tbAdres: TAdsTable;
    TBItemClear: TTBItem;
    QSprUL: TAdsQuery;
    QSprTypeUL: TAdsQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TrExpanding(Sender: TObject; Node: TTreeNode;  var AllowExpansion: Boolean);
    procedure TBItemNewULClick(Sender: TObject);
    procedure TBItemNewHouseClick(Sender: TObject);
    procedure TBItemDelClick(Sender: TObject);
    procedure TBItemRefreshClick(Sender: TObject);
    procedure TBItemOkClick(Sender: TObject);
    procedure TBItemCancelClick(Sender: TObject);
    procedure TrChange(Sender: TObject; Node: TTreeNode);
    procedure TBItemCheckKvClick(Sender: TObject);
    procedure TBItemReloadLicClick(Sender: TObject);
    procedure TrMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TBItemClearClick(Sender: TObject);
  private
    { Private declarations }
    FList : TObjectList;
    function ChoiceLichFromArr( it : TTreeItem ) : Integer;
  public
    tbCurAdres:TAdsTable;
    TypeChoiceAdres:Integer;
    DateFiks : TDateTime;
    SeekLichSchet : Boolean;
    SeekKv:Boolean;
    ReloadLic:Boolean;
    IDAdres   : Integer;
    IDLich    : Integer;
    NomerLich : String;
    ChoiceLich : Boolean;
    EmptyChoice:Boolean;
    Al:String;
    Al2:String;
    ConnectBase:TAdsConnection;
    OnePunkt:Boolean;
    function CheckUL(Node : TTreeNode; nKodUL : Integer ) : Boolean;
    function SeekNodeBigDom(Node : TTreeNode; sDom,sKorp:String): TTreeNode;
    procedure ClearTree;
    procedure CreatePunkt;
    procedure ExpandLevel( Node : TTreeNode );
    procedure UpdateActions; override;
    procedure AddLichSchet( Node : TTreeNode );
    procedure ClearChecked(Node: TTreeNode);
    function SetArrChoice(var arr:TArrSmallAdres; var sPunkt:String):String;
    function HasChecked(Node: TTreeNode):Boolean;
    function getUL( nKod: Integer): String;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

  procedure RefreshChoiceAdres;
  function ChoiceLoadedAdres(var sWhere : String; var sPunkt:String; Connect:TAdsConnection; formCh:TfmChoiceAdres):Boolean;
  function CreateFormChoiceAdres(nTypeChoice:Integer; Connect:TAdsConnection; lOpenQuery:Boolean):TfmChoiceAdres;
//  function ArrSmallAdresToWhere(arr : TArrSmallAdres; sAlias:String):String;

var
  fmChoiceAdres: TfmChoiceAdres;

const
  TYPE_CHOICE_SIMPLE=1;
  TYPE_CHOICE_CHECKBOX=2;

implementation

uses fMain, Types, Variants, DataTask;

{$R *.DFM}

const
{
  IND_PUNKT_S   = 1;
  IND_PUNKT     = 1;
  IND_UL_S      = 68;
  IND_UL        = 68;
  IND_DOM_S     = 67;
  IND_DOM       = 67;
  IND_BIG_DOM_S = 46;
  IND_BIG_DOM   = 46;
  IND_KV_S      = 3;
  IND_KV        = 3;
}
  IND_PUNKT_S   = 0;
  IND_PUNKT     = 0;
  IND_UL_S      = 4;
  IND_UL        = 4;
  IND_DOM_S     = 1;
  IND_DOM       = 1;
  IND_BIG_DOM_S = 2;
  IND_BIG_DOM   = 2;
  IND_KV_S      = 1;
  IND_KV        = 1;
  IND_EMPTY_DOM_S = 3;
  IND_EMPTY_DOM   = 3;
  IND_SPEC_DOM_S = 11;
  IND_SPEC_DOM   = 11;


procedure RefreshChoiceAdres;
begin
  if fmChoiceAdres<>nil then begin
    fmChoiceAdres.TR.Items.BeginUpdate;
    fmChoiceAdres.CreatePunkt;
    fmChoiceAdres.TR.Items.EndUpdate;
  end;
end;
{
//--------------------------------------------------------------------------
function ArrSmallAdresToWhere(arr : TArrSmallAdres; sAlias:String):String;
var
  i:Integer;
  sPunkt,sUl:String;
begin
  Result:='';
  if sAlias<>'' then sAlias:=sAlias+'.';
  for i:=0 to Length(arr)-1 do begin
    sPunkt:=IntToStr(arr[i].Punkt);
    sUl:=IntToStr(arr[i].Ulica);
    if arr[i].Ulica=-1 then begin
      Result:=Result+' or ('+sAlias+'punkt='+sPunkt+')';
    end else begin
      if (arr[i].Dom='') and (arr[i].Korp='') then begin
        if arr[i].Ulica>0
          then Result:=Result+' or ('+sAlias+'punkt='+sPunkt+' and '+sAlias+'ul='+sUl;
      end else begin
      end;
    end;
  end;
end;
}
function CreateFormChoiceAdres(nTypeChoice:Integer; Connect:TAdsConnection; lOpenQuery:Boolean):TfmChoiceAdres;
var
  f:TfmChoiceAdres;
begin
  GlobalTask.SetWorkParam('TYPE_CHOICE_ADRES',nTypeChoice);  // !!!
  f:=TfmChoiceAdres.Create(nil);
  GlobalTask.SetWorkParam('TYPE_CHOICE_ADRES',TYPE_CHOICE_SIMPLE);  // !!!
  if nTypeChoice=TYPE_CHOICE_CHECKBOX then begin
    f.TBItemNewHouse.Visible:=false;
    f.TBItemNewUL.Visible:=false;
    f.TBItemRefresh.Visible:=false;       
    f.TBItemDel.Visible:=false;
    f.tbSubMenuProp.Visible:=false;
    f.Tr.CheckBox:=true;
    f.Caption:='¬ыберите адреса';
    f.DateFiks := dmBase.GetDateCurrentSost;
    f.TBItemClear.Visible:=true;
    f.TBItemOk.Caption:='¬ыбрать (F2)';
    if Connect<>nil then begin
      f.ConnectBase:=Connect;
      f.tbAdres.AdsConnection:=Connect;
      f.tbAdres.Open;
      f.tbCurAdres:=f.tbAdres;
      f.Query.DatabaseName:='';
      f.Query.AdsConnection:=Connect;
    end else begin
      f.ConnectBase:=dmBase.AdsConnection;
    end;
    if lOpenQuery then begin
      f.QSprUL.SQL.Text:='select * from спр”лиц order by name';
      f.QSprUL.AdsConnection:=f.ConnectBase;
      f.QSprUL.Open;
      f.QSprTypeUL.SQL.Text:='select * from спр“ип”лиц';
      f.QSprTypeUL.AdsConnection:=f.ConnectBase;
      f.QSprTypeUL.Open;
    end;
    f.CreatePunkt;
  end;
  Result:=f;
end;

//-------------------------------------------------------------
function ChoiceLoadedAdres(var sWhere: String; var sPunkt:String; Connect:TAdsConnection; formCh:TfmChoiceAdres):Boolean;
var
 f:TfmChoiceAdres;
 i:Integer;
 lFree:Boolean;
// sl:TStringlist;
 s,ss:String;
 arr:TArrSmallAdres;
begin
  sWhere:='';
  Result:=false;
  lFree:=false;
  if formCh=nil then begin
    f:=CreateFormChoiceAdres(TYPE_CHOICE_CHECKBOX, Connect,true);
    lFree:=true;
  end else begin
    f:=formCh;
  end;
  if (f.ShowModal = mrOk) and (f.IDAdres>0) then begin
    sWhere:=f.SetArrChoice(arr,sPunkt);
    if f.Al='' then s:=''
               else s:=Copy(f.Al,1,Length(f.Al)-1);  // уберем точку
    dmBase.WorkQuery.SQL.Text:='select id from базадомов '+s+' where '+sWhere;
    try
      dmbase.WorkQuery.VerifySQL;
//      showmessage(sWhere);
      MemoWrite('test.sql',swhere);
      Result:=true;
    except
      on E: Exception do begin
        PutError(sWhere+#13#10+E.Message);
      end;
    end;
  end;
  if lFree then f.Free;
  {
  sl:=TstringList.Create;
  for i:=0 to length(arr)-1 do begin
    if dmbase.SprPunkt.Locate('ID',arr[i].punkt,[])
      then s:=dmbase.SprPunkt.FieldByName('name').Asstring
      else s:=IntToStr(arr[i].punkt);
    if dmbase.SprUL.Locate('ID',arr[i].ulica,[])
      then ss:=dmbase.SprUl.FieldByName('name').Asstring
      else ss:=IntToStr(arr[i].ulica);
    sl.Add('"'+s+'", "'+ss+'", "'+arr[i].dom+'", "'+arr[i].korp+'"');
  end;
  ShowStrings(sl,'');
  sl.Free;
  }
end;

//-------------------------------------------------------------
{ TTreeItem }

constructor TTreeItem.Create;
begin
  SetLength(ArrLich,0);
  EnableChoice:=false;
  SpecUch:=false;
end;

destructor TTreeItem.Destroy;
begin
  SetLength(ArrLich,0);
  inherited;
end;

function TTreeItem.GetDateFiks: TDateTime;
begin
  Result := Owner.DateFiks;
end;

{ TfmChoiceAdres }

function TfmChoiceAdres.SetArrChoice(var arr:TArrSmallAdres; var sPunkt:String):String;
var
  i,j,n,m:Integer;
  sDom,sWhereUl,sWhereDom:String;
  nodePunkt,nodeUl,node:TTreeNode;
  nPunkt,nUl:Integer;
  trPunkt,trUl,trDom:TTreeItem;
  procedure AddArr(n1,n2:Integer;s1,s2:String);
  begin
    SetLength(arr, Length(arr)+1);
    n:=Length(arr)-1;
    arr[n].Punkt:=n1; arr[n].Ulica:=n2; arr[n].Dom:=s1; arr[n].Korp:=s2;
  end;
begin
//  if StrToInt(strUL)<1
//    then strUL:='ul is null'
//    else strUL:='ul='+strUL;
  sPunkt:='';
  Result:='';
  for i:=0 to Tr.Items.Count-1 do begin
    nodePunkt:=Tr.Items.Item[i];
    if (nodePunkt.Level=0) and tr.GetChecked(nodePunkt) then begin
      trPunkt:=TTreeItem(nodePunkt.Data);
      sPunkt:=sPunkt+ ' or '+Al+'punkt='+IntToStr(trPunkt.Punkt);
      if HasChecked(nodePunkt) then begin    // если есть отмеченные внутри нас. пункта
        Result:=Result+' or ( '+Al+'punkt='+IntToStr(trPunkt.Punkt)+' and ( ';
        sWhereUl:='';
        for j:=0 to nodePunkt.Count-1 do begin
          nodeUl:=nodePunkt.Item[j];
          if tr.GetChecked(nodeUl) then begin
            trUl:=TTreeItem(nodeUl.Data);
            if HasChecked(nodeUl) then begin    // если есть отмеченные дома внутри улицы
              sWhereUl:=sWhereUl+' or ('+Al+'ul='+IntToStr(trUl.Ulica)+' and ( ';
              sWhereDom:='';
              for m:=0 to nodeUl.Count-1 do begin
                node:=nodeUl.Item[m];
                if tr.GetChecked(node) then begin    // если дом отмечен
                  trDom:=TTreeItem(node.Data);
                  if Trim(trDom.Dom)=''
                    then sDom := '('+Al+'dom='''' or '+Al+'dom is null)'
                    else sDom := Al+'dom='+''''+dmBase.GetNomerDom(trDom.Dom)+'''';
//                  if Trim(trDom.Korp)=''
//                    then sDom := sDom + ' and (korp='''' or korp is null)'
//                    else sDom := sDom + ' and korp='+''''+dmBase.GetNomerDom(trDom.Korp)+'''';
                  sWhereDom:=sWhereDom+' or ('+sDom+')';
                  AddArr(trDom.Punkt, trDom.Ulica, trDom.Dom, trDom.Korp);
                end;
              end;
              sWhereDom:=Copy(sWhereDom,5,Length(sWhereDom));
              sWhereUl:=sWhereUl+sWhereDom+'))';
            end else begin
              sWhereUl:=sWhereUl+' or ('+Al+'ul='+IntToStr(trUl.Ulica)+')';
              AddArr(TTreeItem(nodeUl.Data).Punkt, TTreeItem(nodeUl.Data).Ulica, '', '');
            end;
          end;
        end;
        sWhereUl:=Copy(sWhereUl,5,Length(sWhereUl));
        Result:=Result+sWhereUl+' ) and '+Al+'ul is not null)'+#13#10;
      end else begin
        Result:=Result+' or ('+Al+'punkt='+IntToStr(trPunkt.Punkt)+')'+#13#10;
        AddArr(TTreeItem(nodePunkt.Data).Punkt, -1, '', '');
      end;
    end;
  end;
  Result:=Copy(Result,5,Length(Result));
  sPunkt:=Copy(sPunkt,5,Length(sPunkt));
end;

procedure TfmChoiceAdres.TBItemCheckKvClick(Sender: TObject);
begin
  SeekKv:=not SeekKv;
  RefreshChoiceAdres;
//  if TBItemCheckKv.
end;

procedure TfmChoiceAdres.TBItemReloadLicClick(Sender: TObject);
begin
  ReloadLic:=not Reloadlic;
end;

procedure TfmChoiceAdres.UpdateActions;
begin
  inherited;
  if TR.Selected<>nil then begin
    if TObject(tr.Selected.Data) is TTreeItem then begin
      if TTreeItem(tr.Selected.Data).Tip = toPunkt then begin
        TBItemNewHouse.Enabled := true;
        TBItemNewUL.Enabled := true;
        TBItemDel.Enabled := false;
      end else if TTreeItem(tr.Selected.Data).Tip = toUL then begin
        TBItemNewHouse.Enabled := true;
        TBItemNewUL.Enabled := false;
        TBItemDel.Enabled := false;
      end else  if TTreeItem(tr.Selected.Data).Tip=toBigDom then begin
        TBItemNewHouse.Enabled := true;
        TBItemNewUL.Enabled := false;
        TBItemDel.Enabled := false;
      end else begin
        TBItemNewHouse.Enabled := true;
        TBItemNewUL.Enabled := false;
        TBItemDel.Enabled := true;
      end;
    end else begin
      TBItemNewHouse.Enabled := false;
      TBItemNewUL.Enabled := false;
      TBItemDel.Enabled := false;
    end;
  end else begin
    TBItemNewHouse.Enabled := false;
    TBItemNewUL.Enabled    := false;
    TBItemDel.Enabled      := false;
  end;
end;
//------------------------------------------------------------------------------------
procedure TfmChoiceAdres.ClearTree;
begin
  FList.Clear;
  tr.Items.Clear;
end;
//------------------------------------------------------------------------------------
procedure TfmChoiceAdres.CreatePunkt;
var
  Node : TTreeNode;
  fldDeath, fldBirth : TField;
  It : TTreeItem;
  lOk : Boolean;
  s:String;
begin
  tr.Items.BeginUpdate;
  ClearTree;
  Node:=nil;
  OnePunkt:=false;
  Query.Close;
  Query.SQL.Text:='select * from —прЌасѕунктов order by ';
  if GlobalTask.ParamAsInteger('CH_ADRES')=1
    then Query.SQL.Text:=Query.SQL.Text+'nomer'
    else Query.SQL.Text:=Query.SQL.Text+'id';
  Query.Open;
  with Query do begin
    fldDeath := FieldByName('DATE_DEATH');
    fldBirth := FieldByName('DATE_BIRTH');
    while not Eof do begin
      lOk:=false;
      // в текущем состо€нии видим все населенные пункты за исключением ликвидированных
      if DateFiks = dmBase.GetDateCurrentSost then begin
        if fldDeath.IsNull then begin
          lOk:=true;
        end;
      end else begin
        if (fldDeath.IsNull or (fldDeath.AsDateTime >= DateFiks)) and
           (fldBirth.IsNull or (fldBirth.AsDateTime <= DateFiks)) then begin
          lOk:=true;
        end;
      end;
      if lOk then begin
        It := TTreeItem.Create;
        It.Tip  := toPunkt;
        It.ID   := FieldByName('ID').AsInteger;
        It.Punkt:= FieldByName('ID').AsInteger;
        It.Ulica:= -1;
        It.Dom:='';
        It.Korp:='';
        s:='';
        dmBase.GetTypePunkt( FieldByName('TYPEPUNKT').AsString, '', s);
        It.Name := s+' '+FieldByName('NAME').AsString;
        FList.Add(It);
        Node := tr.Items.AddChildObject( nil, It.Name, Pointer(It) );
        Node.ImageIndex    := IND_PUNKT;
        Node.SelectedIndex := IND_PUNKT_S;
        tr.Items.AddChildObject(Node, '', nil);
      end;
      Next;
    end;
  end;
  Query.Close;
  if FList.Count=1 then begin
    OnePunkt:=true;
//    tr.Items[0].Expand(true);
    if (Node<>nil) and (TypeChoiceAdres=TYPE_CHOICE_CHECKBOX) then begin
      tr.SetChecked(Node, true);
    end;
    tr.Items[0].Expand(false);
  end;
  tr.Items.EndUpdate;
end;
//-----------------------------------------------------------------------------------------------
procedure TfmChoiceAdres.FormCreate(Sender: TObject);
var
  v:Variant;
begin
  ChoiceLich    := false;
  SeekLichSchet := true;
  EmptyChoice   := false;

  tbCurAdres:=dmBase.tbAdres;

  v:=GlobalTask.GetWorkParam('TYPE_CHOICE_ADRES');  // !!!
  if (v=null) or VarIsEmpty(v) then v:=TYPE_CHOICE_SIMPLE;
  TypeChoiceAdres:=v;
  if TypeChoiceAdres=TYPE_CHOICE_CHECKBOX then begin
    Tr.CheckBox:=true;
    ChoiceLich := false;
    SeekKv:=true;
  end;

  FList := TObjectList.Create;
  IDAdres := 0;
  IDLich  := 0;
  NomerLich := '';
  if TypeChoiceAdres=TYPE_CHOICE_SIMPLE then begin
    CreatePunkt;
    if GlobalTask.GetLastValueAsString('ADRES_SEEKKV')='' then begin
      {$IFDEF GKH}
        SeekKv:=true;
      {$ELSE}
        SeekKv:=false;
      {$ENDIF}
    end else begin
      if GlobalTask.GetLastValueAsString('ADRES_SEEKKV')='1'
        then SeekKv:=true
        else SeekKv:=false;
    end;
    TBItemCheckKv.Checked:=SeekKv;
    if GlobalTask.GetLastValueAsString('ADRES_RELOADLIC')='1'
      then ReloadLic:=true
      else ReloadLic:=false;
    TBItemReloadLic.Checked:=ReloadLic;
  end;
end;
//----------------------------------------------------------------------------------------------------
procedure TfmChoiceAdres.FormDestroy(Sender: TObject);
begin
  ClearTree;
  FList.Free;
end;
//----------------------------------------------------------------------------------------------------
procedure TfmChoiceAdres.TrExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
begin
  if TypeChoiceAdres=TYPE_CHOICE_CHECKBOX then begin
    AllowExpansion:=tr.GetChecked(node);
    if AllowExpansion and (Node.Count>0) and (Node.getFirstChild.Data=nil) then begin
      Node.DeleteChildren;
      ExpandLevel(Node);
    end;
  end else begin
    if (Node.Count>0) and (Node.getFirstChild.Data=nil) then begin
      Node.DeleteChildren;
      ExpandLevel(Node);
    end;
  end;
end;
//----------------------------------------------------------------------------------------------------
procedure TfmChoiceAdres.AddLichSchet( Node : TTreeNode );
var
//  ds : TDataSet;
  dsMen : TDataSet;
  strFIO,ss : String;
  it : TTreeItem;
  arr : TArrLich;
  i : Integer;
begin
  if TypeChoiceAdres=TYPE_CHOICE_CHECKBOX then exit;
  ss:='';
  it:=nil;
  if SeekLichSchet then begin
    it := TTreeItem(Node.Data);
    SetLength(arr,0);
    arr := dmBase.GetLichSchetFromAdres2(DateFiks, IntToStr(it.ID), false);
    setLength(it.ArrLich,Length(arr));
    for i:=0 to Length(arr)-1 do begin
      it.ArrLich[i].ID := arr[i].ID;
      it.ArrLich[i].FirstID := arr[i].FirstID;
      it.ArrLich[i].AdresID := arr[i].AdresID;
      it.ArrLich[i].Nomer := arr[i].Nomer;
    end;
    for i:=0 to Length(it.arrLich)-1 do begin
      dsMen := dmBase.GetMen( DateFiks, IntToStr(it.arrLich[i].FirstID) );
      if dsMen <> nil then begin
        strFIO := dsMen.FieldByName('FAMILIA').AsString + ' ' +
                  Copy(dsMen.FieldByName('NAME').AsString,1,1) + '. ' +
                  Copy(dsMen.FieldByName('OTCH').AsString,1,1)+'.';
      end else begin
        strFio := '---';
      end;
      it.ArrLich[i].FirstFIO:=strFIO;
      ss := ss + it.ArrLich[i].Nomer+' - '+strFIO + ', ';
    end;
    if ss<>'' then  ss := Copy(ss,1,Length(ss)-2);
    if ss<>'' then  ss := '  ( '+ss+' )';
    i:=Pos('  (',Node.Text);
    if i=0 then begin
      Node.Text := Node.Text + ss;
    end else begin
      Node.Text := Copy(Node.Text,1,i-1) + ss;
    end;
  end;

  if (it<>nil) and it.SpecUch then begin
    Node.ImageIndex    := IND_SPEC_DOM;
    Node.SelectedIndex := IND_SPEC_DOM_S;
  end else begin
  {$IFDEF OCHERED}
    Node.ImageIndex    := IND_DOM;
    Node.SelectedIndex := IND_DOM_S;
  {$ELSE}
    if ss='' then begin  // если нет лицевых счетов
      Node.ImageIndex    := IND_EMPTY_DOM;
      Node.SelectedIndex := IND_EMPTY_DOM_S;
    end else begin
      Node.ImageIndex    := IND_DOM;
      Node.SelectedIndex := IND_DOM_S;
    end;
  {$ENDIF}
  end;
end;

//------------------------------------------------------------------------------------
function TfmChoiceAdres.getUL( nKod: Integer): String;
var
  strTip : String;
  sprUL,sprTypeUL:TDataSet;
begin
  Result := '';
  if QSprUL.Active then begin
    sprUL:=QSprUL;
    sprTypeUL:=QSprTypeUL;
  end else begin
    sprUL:=dmBase.SprUl;
    sprTypeUL:=dmBase.SprTypeUL;
  end;
  if nKod > 0 then begin
    if SprUL.Locate('ID', nKod, []) then begin
      Result := SprUL.FieldByName('NAME').AsString;
      strTip := SprUL.FieldByName('TIP').AsString;
      if strTip<>'' then begin
        if SprTypeUL.Locate('ID', strTip, []) then begin
          Result := SprTypeUL.FieldByName('NAME').AsString+' '+Result;
        end;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------------
procedure TfmChoiceAdres.ExpandLevel( Node : TTreeNode );
var
  ti, it : TTreeItem;
  ParentNode : TTreeNode;
  strPunkt,sUL,sDom,sKorp,sName,sKv : String;
  NewNode : TTreeNode;
  nCount,nPunkt,nUl:Integer;
begin
  if TObject(Node.Data) is TTreeItem then begin
    TR.Items.BeginUpdate;
    ti := TTreeItem(Node.Data);
    if ti.Tip = toPunkt then begin
      Query.Close;
      // соберем все улицы населенного пункта без отдельно сто€щих домов
      Query.SQL.Text := 'SELECT UL FROM (SELECT DISTINCT(UL) UL FROM Ѕазаƒомов WHERE PUNKT='+InttoStr(ti.ID)+
       ' and DATE_FIKS='+''''+DTOS(DateFiks,tdAds)+'''' +
       ' and UL is not null) u '+
       ' LEFT JOIN —пр”лиц s ON u.ul=s.id ORDER BY name';
//   если показывать улицы в алфавитном пор€дке
//      Query.SQL.Text := 'SELECT UL,NAME FROM '+
//          '(SELECT DISTINCT(UL) UL FROM Ѕазаƒомов WHERE PUNKT='+InttoStr(ti.ID)+
//          ' and DATE_FIKS='+''''+DTOS(DateFiks,tdAds)+'''' +' and UL is not null) ddd '+
//          ' LEFT OUTER JOIN спрулиц s ON ddd.ul=s.id '+
//          ' ORDER BY name ';
      Query.Open;
      while not Query.Eof do begin
        It := TTreeItem.Create;
        It.Tip  := toUL;
        It.ID   := Query.FieldByName('UL').AsInteger;
        It.Name := getUL( It.ID );
        It.Punkt:= ti.Punkt;
        It.Ulica:= Query.FieldByName('UL').AsInteger;
        It.Dom  := '';
        It.Korp := '';
        FList.Add(It);
        NewNode := tr.Items.AddChildObject( Node, It.Name, Pointer(It) );
        NewNode.ImageIndex    := IND_UL;
        NewNode.SelectedIndex := IND_UL_S;
        // добавим пустую дл€ распахивани€ домов
        tr.Items.AddChildObject( NewNode, '', nil );
        Query.Next;
      end;
      Query.Close;
      if TypeChoiceAdres=TYPE_CHOICE_SIMPLE then begin
        // соберем все отдельно сто€щие дома или населенный пункт без улиц
        Query.SQL.Text := 'SELECT * FROM Ѕазаƒомов WHERE PUNKT='+InttoStr(ti.ID)+
         ' and DATE_FIKS='+''''+DTOS(DateFiks,tdAds)+'''' + ' and UL is null'+
         ' ORDER BY dom1,dom2,korp,kv';
        Query.Open;
        while not Query.Eof do begin
          It := TTreeItem.Create;
          It.Tip  := toDom;
          It.ID   := Query.FieldByName('ID').AsInteger;
          It.Punkt:= ti.Punkt;
          It.Ulica:= 0;
          It.Dom  := Query.FieldByName('DOM').AsString;
          It.Korp := Query.FieldByName('KORP').AsString;
          It.Name := dmBase.getDom( Query, true );
          if not Query.FieldByName('SPEC_UCH').IsNull and Query.FieldByName('SPEC_UCH').AsBoolean
            then It.SpecUch:=true;
          FList.Add(It);
          NewNode := tr.Items.AddChildObject( Node, It.Name, Pointer(It) );
          if it.SpecUch then begin
            NewNode.ImageIndex    := IND_SPEC_DOM;
            NewNode.SelectedIndex := IND_SPEC_DOM_S;
          end else begin
            NewNode.ImageIndex    := IND_DOM;
            NewNode.SelectedIndex := IND_DOM_S;
          end;
          AddLichSchet(NewNode);
          Query.Next;
        end;
        Query.Close;
      end;
//------------------------------------------------------------------------------------------
    end else if ti.Tip = toUL then begin
      if SeekKv then begin        // <<<<<<<<<<<<<<<<<<<<<<<
        ParentNode := Node.Parent;
        strPunkt := IntToStr(TTreeItem(ParentNode.Data).ID);
        nPunkt:=TTreeItem(ParentNode.Data).Punkt;
        nUl:=ti.Ulica;
        Query.Close;
        Query.SQL.Text := 'SELECT distinct dom,korp FROM Ѕазаƒомов WHERE PUNKT='+strPunkt+
                 ' and UL=' + InttoStr(ti.ID) +
                 ' and DATE_FIKS='+''''+DTOS(DateFiks,tdAds)+''''; //+
               //  ' ORDER BY dom1,dom2,korp,kv';
        It:=nil;
        Query.Open;
        while not Query.Eof do begin
          tbCurAdres.AdsTableOptions.AdsScopeOptions:=RESPECT_SCOPES_WHEN_COUNTING;
          tbCurAdres.IndexFieldNames:='DATE_FIKS;PUNKT;UL;DOM;KORP;KV';
          // SETRANGE
          tbCurAdres.SetRange([DateFiks,strPunkt,ti.ID,Query.FieldByName('DOM').AsString,Query.FieldByName('KORP').AsString],
            [DateFiks,strPunkt,ti.ID,Query.FieldByName('DOM').AsString,Query.FieldByName('KORP').AsString]);
          nCount:=tbCurAdres.RecordCount;
          sDom:=Trim(Query.FieldByName('DOM').AsString);
          sKorp:=Trim(Query.FieldByName('KORP').AsString);
          sName:='';
          if sDom<>'' then sName:='дом '+sDom;
          if sKorp<>'' then if sName='' then sName:=sKorp else sName:=sName+', '+sKorp;
          if nCount=1 then begin
            tbCurAdres.First;
            It := TTreeItem.Create;
            It.Tip  := toDom;
            It.Punkt:= nPunkt;
            It.Ulica:= nUl;
            It.Dom:=sDom;
            It.Korp:=sKorp;
            It.EnableChoice:=true;
            if not tbCurAdres.FieldByName('SPEC_UCH').IsNull and tbCurAdres.FieldByName('SPEC_UCH').AsBoolean
              then It.SpecUch:=true
              else It.SpecUch:=false;
            It.ID   := tbCurAdres.FieldByName('ID').AsInteger;
            if not tbCurAdres.FieldByName('SPEC_UCH').IsNull and tbCurAdres.FieldByName('SPEC_UCH').AsBoolean
              then It.SpecUch:=true;
            It.Name := dmBase.getDom( tbCurAdres, true );
            // CANCELRANGE
            tbCurAdres.CancelRange;
            FList.Add(It);
            NewNode := tr.Items.AddChildObject( Node, It.Name, Pointer(It) );
            if it.SpecUch then begin
              NewNode.ImageIndex    := IND_SPEC_DOM;
              NewNode.SelectedIndex := IND_SPEC_DOM_S;
            end else begin
              NewNode.ImageIndex    := IND_DOM;
              NewNode.SelectedIndex := IND_DOM_S;
            end;
            AddLichSchet(NewNode);
          end else begin
            // CANCELRANGE
            tbCurAdres.CancelRange;
            It := TTreeItem.Create;
            It.Tip  := toBigDom;
            It.ID   := 0; //Query.FieldByName('ID').AsInteger;
            It.Punkt:= nPunkt;
            It.Ulica:= nUl;
            It.Dom:=sDom;
            It.Korp:=sKorp;
            It.Name := sName+' ( '+IntToStr(nCount)+' кв. )';
            It.KrName := sName;
            FList.Add(It);
            NewNode := tr.Items.AddChildObject( Node, It.Name, Pointer(It) );
            NewNode.ImageIndex    := IND_BIG_DOM;
            NewNode.SelectedIndex := IND_BIG_DOM_S;
            //AddLichSchet(NewNode);
            // добавим пустую дл€ распахивани€ домов
            if TypeChoiceAdres=TYPE_CHOICE_SIMPLE
              then tr.Items.AddChildObject( NewNode, '', nil );
          end;
          Query.Next;
        end;
        Query.Close;
      end else begin
        ParentNode := Node.Parent;
        strPunkt := IntToStr(TTreeItem(ParentNode.Data).ID);
        Query.Close;
        Query.SQL.Text := 'SELECT * FROM Ѕазаƒомов WHERE PUNKT='+strPunkt+
                 ' and UL=' + InttoStr(ti.ID) +
                 ' and DATE_FIKS='+''''+DTOS(DateFiks,tdAds)+''''+
                 ' ORDER BY dom1,dom2,korp,kv';
        Query.Open;
        while not Query.Eof do begin
          It := TTreeItem.Create;
          It.Tip  := toDom;
          It.ID   := Query.FieldByName('ID').AsInteger;
          It.Name := dmBase.getDom( Query, true );
          It.EnableChoice:=true;
          if not Query.FieldByName('SPEC_UCH').IsNull and Query.FieldByName('SPEC_UCH').AsBoolean
            then It.SpecUch:=true
            else It.SpecUch:=false;
          FList.Add(It);
          NewNode := tr.Items.AddChildObject( Node, It.Name, Pointer(It) );
          NewNode.ImageIndex    := IND_DOM;
          NewNode.SelectedIndex := IND_DOM_S;
          AddLichSchet(NewNode);
          Query.Next;
        end;
        Query.Close;
      end;
    end else if (ti.Tip = toBigDom) and SeekKv then begin
      sDom:=dmBase.GetNomerDom(TTreeItem(Node.Data).Dom);
      sKorp:=dmBase.GetNomerDom(TTreeItem(Node.Data).Korp);

      ParentNode := Node.Parent;
      sUL := IntToStr(TTreeItem(ParentNode.Data).ID);
      nUL := TTreeItem(ParentNode.Data).Ulica;
      ParentNode := ParentNode.Parent;
      strPunkt := IntToStr(TTreeItem(ParentNode.Data).ID);
      nPunkt := TTreeItem(ParentNode.Data).Punkt;

      tbCurAdres.IndexFieldNames:='DATE_FIKS;PUNKT;UL;DOM;KORP;KV';
       // SETRANGE
      tbCurAdres.SetRange([DateFiks,strPunkt,sUL,sDom],      // sKorp !!!
            [DateFiks,strPunkt,sUL,sDom]);
      while not tbCurAdres.Eof do begin
        It := TTreeItem.Create;
        It.Tip  := toDom;
        It.ID   := tbCurAdres.FieldByName('ID').AsInteger;
        It.Punkt:= nPunkt;
        It.Ulica:= nUl;
        It.Dom:=sDom;
        It.Korp:='';

        sKv:=Trim(tbCurAdres.FieldByName('KV').AsString);
        if sKv=''
          then It.Name := ''
          else It.Name := 'кв. '+sKv;
        It.EnableChoice:=true;
        if not tbCurAdres.FieldByName('SPEC_UCH').IsNull and tbCurAdres.FieldByName('SPEC_UCH').AsBoolean
          then It.SpecUch:=true
          else It.SpecUch:=false;
        FList.Add(It);
        NewNode := tr.Items.AddChildObject( Node, It.Name, Pointer(It) );

        if it.SpecUch then begin
          NewNode.ImageIndex    := IND_SPEC_DOM;
          NewNode.SelectedIndex := IND_SPEC_DOM_S;
        end else begin
          NewNode.ImageIndex    := IND_DOM;
          NewNode.SelectedIndex := IND_DOM_S;
        end;

        AddLichSchet(NewNode);
        tbCurAdres.Next;
      end;
      tbCurAdres.CancelRange;
    end;
    TR.Items.EndUpdate;
  end;
end;


procedure TfmChoiceAdres.TBItemNewULClick(Sender: TObject);
var
  f : TfmChoiceUL;
//  nId : Integer;
//  nPunkt : Integer;
  NewNode,Node: TTreeNode;
  CurItem,It : TTreeItem;
  strCaption : String;
begin
  CurItem := TTreeItem(TR.Selected.Data);
  // текущий Node должен быть toPunkt или toUL
  if CurItem.Tip = toPunkt then begin
    Node := TR.Selected;
//    nPunkt := CurItem.ID;
    strCaption := TR.Selected.Text;
  end else if TTreeItem(TR.Selected.Data).Tip = toUL then begin
//    nPunkt := TTreeItem(TR.Selected.Parent.Data).ID; //  населенный пункт
    strCaption := TR.Selected.Parent.Text;
    Node := TR.Selected.Parent;
  end else begin  // toDom   из дома поднимаемс€ на улицу и насел. пункт
    Node := TR.Selected.Parent; //  Node улицы пункта
//    nPunkt := TTreeItem(Node.Parent.Data).ID; //  Node населенного пункта
    strCaption := Node.Parent.Text;
  end;
  f := TfmChoiceUL.Create(nil);
  f.Caption := 'ƒобавить улицу в '+ strCaption;
  try
    if f.ShowModal = mrOk then begin
      // при добавлении улицы в базу ничего не пишем
      // запишетс€ после добавлени€ дома
      if (Node.Count>0) and (Node.getFirstChild.Data=nil) then begin
        Node.DeleteChildren;
      end;
      if CheckUL(Node, f.KodUL) then begin
        It := TTreeItem.Create;
        It.Tip  := toUL;
        It.ID   := f.KodUL;
        It.Name := dmBase.getUL( f.KodUL );
        FList.Add(It);
        NewNode := tr.Items.AddChildObject( Node, It.Name, Pointer(It) );
        NewNode.ImageIndex    := IND_UL;
        NewNode.SelectedIndex := IND_UL_S;
        TR.Selected := NewNode;
      end;
      {
      nId := dmBase.GetNewID( dmBase.TypeObj_Adres );
      Query.Close;
      Query.SQL.Text := 'INSERT INTO Ѕазаƒомов (DATE_FIKS,ID,PUNKT,TIP_UL,UL,DOM,KORP,KV)'+
        ' VALUES ( '+
           ''''+DTOS(DateFiks,tdAds)+''''+','+    // Date_Fiks
           IntToStr(nId)+','+                     // Id
           IntToStr(TTreeItem(TR.Selected.Data).ID)+','+ // Punkt
           f.
        ')';
      }
    end;
  finally
    f.Free;
  end;
end;

//-------------------------------------------------------
// может уже улица есть в дереве
function TfmChoiceAdres.CheckUL(Node : TTreeNode; nKodUL: Integer): Boolean;
var
  i : Integer;
begin
  Result := true;
  if Node.Count > 0 then begin
    for i:=0 to Node.Count-1 do begin
      if (TTreeItem(Node.Item[i].Data).Tip=toUL) and
         (TTreeItem(Node.Item[i].Data).ID=nKodUL) then begin
        Result := false;
        TR.Selected := Node.Item[i];
        PutError(' ”лица уже существует. ');
      end;
    end;
  end;
end;

//-------------------------------------------------------
//
function TfmChoiceAdres.SeekNodeBigDom(Node : TTreeNode; sDom,sKorp:String): TTreeNode;
var
  i : Integer;
  ti:TTreeItem;
begin
  //Node.AlphaSort(false);
  Result := nil;
  if Node.Count > 0 then begin
    for i:=0 to Node.Count-1 do begin
      if (Node.Item[i].Data<>nil) and (TObject(Node.Item[i].Data) is TTreeItem) then begin
        ti:=TTreeItem(Node.Item[i].Data);
        if (ti.Tip=toBigDom) then begin
          if (Trim(ti.Dom)=Trim(sDom)) and (Trim(ti.Korp)=Trim(sKorp)) then begin
             Result := Node.Item[i];
             //TR.Selected := Node.Item[i];
          end;
        end;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------------
procedure TfmChoiceAdres.TBItemNewHouseClick(Sender: TObject);
var
  nPunkt : Integer;
  NewNode,Node,NodeAdd,Node2: TTreeNode;
  CurItem,It,pi : TTreeItem;
  strCaption,strErr : String;
  nUL,n : Integer;
  lExit : Boolean;
  adr:TAdres;
  sDom,sKorp:String;
begin
  lExit := false;
  if (TR=nil) or (TR.Selected=nil) or (TR.Selected.Data=nil) then exit;
  CurItem := TTreeItem(TR.Selected.Data);
  nPunkt:=0;
  nUL:=0;
  sDom:='';
  sKorp:='';
  // текущий Node должен быть toPunkt или toUL
  if CurItem.Tip = toPunkt then begin
    Node := TR.Selected;
    nPunkt := CurItem.ID;
  end else if CurItem.Tip = toUL then begin
    nPunkt := TTreeItem(TR.Selected.Parent.Data).ID; //  населенный пункт
    nUL := TTreeItem(TR.Selected.Data).ID;
    Node := TR.Selected;
  end else  if CurItem.Tip = toBigDom then begin
    sDom:=CurItem.Dom;
    sKorp:=CurItem.Korp;
    Node := TR.Selected.Parent; //  Node улицы пункта
    nPunkt := TTreeItem(Node.Parent.Data).ID; //  Node населенного пункта
    nUL := TTreeItem(Node.Data).ID; //  улица
    Node := TR.Selected; //  Node дома с кватирами
  end else begin  // toDom   из дома поднимаемс€ на улицу и насел. пункт
    Node := TR.Selected.Parent; //
    pi:=TTreeItem(Node.Data);
    if pi.Tip=toPunkt then begin
      nPunkt:=TTreeItem(Node.Data).ID;
    end else if pi.Tip=toUl then begin
      nPunkt := TTreeItem(Node.Parent.Data).ID;    //  населенный пункт
      nUL:=TTreeItem(Node.Data).ID; //  улица
    end else if pi.Tip=toBigDom then begin
      sDom:=pi.Dom;
      sKorp:=pi.Korp;
      if TTreeItem(Node.Parent.Data).Tip=toPunkt then begin
        nPunkt:=TTreeItem(Node.Parent.Data).ID;
      end else begin
        nUL:=TTreeItem(Node.Parent.Data).ID;    // улица
        nPunkt:=TTreeItem(Node.Parent.Parent.Data).ID;    // населенный пункт
      end;
    end;
  end;
  strCaption := 'Ќовый адрес';
  if nUL=0 then nUL:=-1;
  adr.PunktKod:=nPunkt;
  adr.UlicaInt:=nUL;
  adr.NDom:=sDom;
  adr.Korp:=sKorp;
  adr.Kv:='';
  adr.NotDom:=false;
  adr.NameHouse:='';
  adr.SpecUch:=false;
  {$IFDEF GKH}
    if IsAccountRnGor
      then adr.RnGor:=GlobalTask.ParamAsInteger('RN_GOROD')
      else adr.RnGor:=0;
  {$ELSE}
    adr.RnGor:=0;
  {$ENDIF}
  n:=AddNewAdres2(dateFiks,adr,strErr);
  case n of
    // ошибка
    -1 : begin
           Beep;
           PutError(strErr);
         end;
    // все ok!
    0  : begin
           if SeekKv
             then NodeAdd:=SeekNodeBigDom(Node,adr.NDom,adr.Korp)
             else NodeAdd:=nil;
           if NodeAdd=nil then NodeAdd:=Node;
           if (NodeAdd.Count>0) and (NodeAdd.getFirstChild.Data=nil) then begin
             NodeAdd.DeleteChildren;
           end;
           It := TTreeItem.Create;
           It.Tip  := toDOM;
           It.ID   := adr.AdresID;
           It.SpecUch:=false;
           if TTreeItem(NodeAdd.Data).Tip=toBigDom then begin
             It.Name := 'кв. '+adr.kv;
           end else begin
             It.Name := dmBase.getDOM( adr.NDom, adr.Korp, adr.Kv, adr.NameHouse, adr.NotDom);
           end;
           FList.Add(It);
           NewNode := tr.Items.AddChildObject( NodeAdd, It.Name, Pointer(It) );
           if it.SpecUch then begin
             Node.ImageIndex    := IND_SPEC_DOM;
             Node.SelectedIndex := IND_SPEC_DOM_S;
           end else begin
             {$IFDEF OCHERED}
               NewNode.ImageIndex    := IND_DOM;
               NewNode.SelectedIndex := IND_DOM_S;
             {$ELSE}
               NewNode.ImageIndex    := IND_EMPTY_DOM;
               NewNode.SelectedIndex := IND_EMPTY_DOM_S;
             {$ENDIF}
           end;
           TR.Selected := NewNode;
          //NodeAdd.AlphaSort(false);
         end;
    // адрес уже существует
    1  : begin
           lExit := true;
           IDAdres:=adr.AdresID;
           IDLich  := 0;
         end;
    // отказ от добавлени€
    2  : begin end;
  end;
  if lExit then begin
    ModalResult := mrOk;
  end;
end;

procedure TfmChoiceAdres.TBItemDelClick(Sender: TObject);
var
  NewNode : TTreeNode;
  nID : Integer;
begin
  if TR.Selected<>nil then begin
    nID := TTreeItem(TR.Selected.Data).ID;
    if Problem('   ”далить адрес ?   ') then begin
      if dmBase.DeleteAdres(DateFiks, IntToStr(nID)) then begin
        NewNode := nil;
        if TR.Selected.getPrevSibling<>nil then begin
          NewNode := TR.Selected.getPrevSibling;
        end else if TR.Selected.getNextSibling<>nil then begin
          NewNode := TR.Selected.getNextSibling;
        end;
        TR.Selected.Free;
        if NewNode <> nil then begin
          TR.Selected := NewNode;
        end;
      end;
    end;
  end;
end;

procedure TfmChoiceAdres.TBItemRefreshClick(Sender: TObject);
begin
  TR.Items.BeginUpdate;
  CreatePunkt;
  TR.Items.EndUpdate;
end;

function TfmChoiceAdres.ChoiceLichFromArr( it : TTreeItem ) : Integer;
var
  i,y,x : Integer;
  List : TStringList;
  Rect:TRect;
begin
  List := TStringList.Create;
  for i:=0 to Length(it.ArrLich)-1 do begin
    List.Add(' '+it.ArrLich[i].Nomer+'  '+it.ArrLich[i].FirstFIO+'   ');
  end;
  Rect:=Tr.Selected.DisplayRect(true);
  y:=Top+(Self.Height-Self.ClientHeight)+TBDock1.Height+Rect.Bottom-1;
  x:=Left+(Self.Width-Self.ClientWidth)+Rect.Left;
  Result := ChoiceFromListInPos(List,'¬ыберите лицевой счет', x,y);
  List.Free;
end;

procedure TfmChoiceAdres.TBItemOkClick(Sender: TObject);
var
  it  : TTreeItem;
  i   : Integer;
  lOk : Boolean;
  nodePunkt:TTreeNode;
begin
  if TypeChoiceAdres=TYPE_CHOICE_SIMPLE then begin
    if SeekKv
      then GlobalTask.SetLastValueAsString('ADRES_SEEKKV','1')
      else GlobalTask.SetLastValueAsString('ADRES_SEEKKV','0');
    if ReloadLic
      then GlobalTask.SetLastValueAsString('ADRES_RELOADLIC','1')
      else GlobalTask.SetLastValueAsString('ADRES_RELOADLIC','0');
  end;

  if TypeChoiceAdres=TYPE_CHOICE_CHECKBOX then begin
//    if EmptyChoice then begin
//      ModalResult := mrOk;
//    end else begin
      for i:=0 to Tr.Items.Count-1 do begin
        if (Tr.Items.Item[i].Level=0) then begin
          nodePunkt:=Tr.Items.Item[i];
          if OnePunkt then begin
            if tr.GetChecked(nodePunkt) and HasChecked(nodePunkt) then begin
              IDAdres:=1;
              ModalResult := mrOk;
            end;
          end else begin
            if tr.GetChecked(nodePunkt) then begin
              IDAdres:=1;
              ModalResult := mrOk;
            end;
          end;
        end;
      end;
//    end;
  end else begin
    if TR.Selected<>nil then begin
      it := TTreeItem(TR.Selected.Data);
      if it.SpecUch then begin
        PutError('јдрес на специальном учете!',self);
      end;
      if (it.Tip = toDom) and not it.SpecUch then begin
        lOk := true;
        if ChoiceLich then begin
          i := Length(it.ArrLich);
          if i=0 then begin
            IDAdres := it.ID;
            IDLich  := 0;
          end else if i=1 then begin
            IDAdres := it.ArrLich[0].AdresID;
            IDLich  := it.ArrLich[0].ID;
            NomerLich := it.ArrLich[0].Nomer;
          end else begin
            i := ChoiceLichFromArr( it );
            if i > -1 then begin
              IDAdres := it.ArrLich[i].AdresID;
              IDLich  := it.ArrLich[i].ID;
              NomerLich := it.ArrLich[i].Nomer;
            end;
          end;
        end else begin
          IDAdres := it.ID;
          IDLich  := 0;
        end;
        if lOk then begin
          TR.Selected.ImageIndex := IND_DOM;
          TR.Selected.SelectedIndex := IND_DOM_S;
          ModalResult := mrOk;
        end;
      end;
    end;
  end;
end;

procedure TfmChoiceAdres.TBItemCancelClick(Sender: TObject);
begin
  IDAdres := 0;
  IDLich  := 0;
  NomerLich := '';
  ModalResult := mrCancel;
end;

constructor TfmChoiceAdres.Create(Owner: TComponent);
begin
  inherited;
end;

destructor TfmChoiceAdres.Destroy;
begin
  inherited;
end;

//----------------------------------------------------------------------------------------
procedure TfmChoiceAdres.TrChange(Sender: TObject; Node: TTreeNode);
var
  ti : TTreeItem;
  s,sName : String;
  ParentNode:TTreeNode;
begin
  s:='  ';
  if TObject(Node.Data) is TTreeItem then begin
    ti := TTreeItem(Node.Data);
    sName:=ti.Name;
    if ti.Tip = toPunkt then begin
      s:=sName;
    end else if ti.Tip = toUl then begin
      ParentNode:=Node.Parent;
      s:=TTreeItem(ParentNode.Data).Name+', '+sName;
    end else if ti.Tip = toBigDom then begin
      ParentNode:=Node.Parent;
      ti := TTreeItem(ParentNode.Data);
      s:=ti.Name+', '+sName;
      s:=TTreeItem(ParentNode.Parent.Data).Name+', '+s;
    end else if ti.Tip = toDom then begin
      if ReloadLic
        then AddLichSchet(Node);
      ParentNode:=Node.Parent;
      ti:=TTreeItem(ParentNode.Data);
      if ti.Tip=toPunkt then begin
        s:=ti.Name+', '+sName;
      end else if ti.Tip=toUl then begin
        s:=ti.Name+', '+sName;  // улица+дом
        ParentNode:=ParentNode.Parent;
        ti:=TTreeItem(ParentNode.Data);
        s:=ti.Name+', '+s;     // +нас.пункт
      end else if ti.Tip=toBigDom then begin
        s:=ti.KrName+', '+sName;  // дом+кв.
        ParentNode:=ParentNode.Parent;
        ti:=TTreeItem(ParentNode.Data);
        s:=ti.Name+', '+s;
        ParentNode:=ParentNode.Parent;
        ti:=TTreeItem(ParentNode.Data);
        s:=ti.Name+', '+s;
      end;
    end;
  end;
//  stb.SimpleText:=s;
  stb.Panels[0].Text:=s;
end;
//----------------------------------------------------------------------------------------------------------
function TfmChoiceAdres.HasChecked(Node: TTreeNode):Boolean;
var
  i:Integer;
  cur_node:TTreeNode;
begin
  Result:=false;
  for i:=0 to Node.Count-1 do begin
    cur_node:=node.Item[i];
    if tr.GetChecked(cur_node) then begin
      Result:=true;
      exit;
    end;
  end;
end;
//----------------------------------------------------------------------------------------------------------
procedure TfmChoiceAdres.ClearChecked(Node: TTreeNode);
var
  i:Integer;
  cur_node:TTreeNode;
begin
  for i:=0 to Node.Count-1 do begin
    cur_node:=node.Item[i];
    if tr.GetChecked(cur_node) then begin
      tr.SetChecked(cur_node,false);
      if cur_node.HasChildren  then begin
        ClearChecked(cur_node);
      end;
    end;
  end;
end;
//----------------------------------------------------------------------------------------------------------
procedure TfmChoiceAdres.TrMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  h:THitTests;
//  d:THitTest;
//  s,ss:String;
  node:TTreeNode;
begin
  if TypeChoiceAdres=TYPE_CHOICE_CHECKBOX then begin
    if Button=mbLeft then begin
      h:=tr.GetHitTestInfoAt(x,y);
      node:=tr.GetNodeAt(x,y);
      if htOnStateIcon in h then begin
        tr.Selected:=node;
//        if tr.GetChecked(node)
//          then ss:='Checked'
//          else ss:='Not Checked';
//        stb.Panels[0].Text:=TTreeItem(node.Data).Name+'     '+ss;
        if not tr.GetChecked(node) then begin
          TR.Items.BeginUpdate;
          node.Collapse(true);
          ClearChecked(Node);
          TR.Items.EndUpdate;
        end;
      end;
    end;
    {
    s:='';
    for d:=Low(THitTest) to High(THitTest) do begin
      if d in h then
        s:=s+GetEnumName(TypeInfo(THitTest),Integer(d))+',';
    end;
    if tr.GetChecked(tr.Selected) then begin
      ss:='Checked'
    end else begin
      ss:='Not Checked';
      tr.Selected.Collapse(true);
    end;
    }
  end;
//  stb.Panels[0].Text:=ss+'->  '+s;
end;

procedure TfmChoiceAdres.TrKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
//  s,ss:String;
  node:TTreeNode;
begin
//     stb.Panels[0].Text:='';
  if TypeChoiceAdres=TYPE_CHOICE_CHECKBOX then begin
    if (Key = VK_SPACE) then begin
        node:=tr.Selected;
  //      s:=TTreeItem(node.Data).Name;
  //      if tr.GetChecked(node)
  //        then ss:='Checked'
  //        else ss:='Not Checked';
        if not tr.GetChecked(node) then begin
          TR.Items.BeginUpdate;
          node.Collapse(true);
          ClearChecked(Node);
          TR.Items.EndUpdate;
        end;
  //      stb.Panels[0].Text:=s+'     '+ss+'  '+inttostr(tr.SelectionCount);
    end;
  end;
end;
//------------------------------------------------------------------------
procedure TfmChoiceAdres.TBItemClearClick(Sender: TObject);
var
  i:Integer;
  node:TTreeNode;
begin
  TR.Items.BeginUpdate;
  for i:=0 to tr.Items.Count-1 do begin
    node:=tr.Items.Item[i];
    if (node.Level=0) and tr.GetChecked(node) then begin
      tr.SetChecked(node,false);
      node.Collapse(true);
      ClearChecked(node);
    end;
  end;
  TR.Items.EndUpdate;
end;

initialization
  fmChoiceAdres := nil;
finalization
  FreeAndNil(fmChoiceAdres);
end.
