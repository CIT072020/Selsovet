unit fGurnalAdres;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uProject, uProjectAll,
  TB2Item, TB2Dock, TB2Toolbar, StdCtrls, vchDBCtrls, TB2ToolWindow, MetaTask, mPermit, uTypes,
  dBase, ImgList, Mask, DBCtrlsEh, DBLookupEh, Buttons, PrnDbgeh, funcPr, sasaIniFile, QStrings,
  Menus, fmChList, fSeekSobstv,Variants, ComCtrls, ExtCtrls;

type
  TfmGurnalAdres = class(TfmGurnal)
    HImageList: TImageList;
    TBToolWindow2: TTBToolWindow;
    edPunkt: TDBLookupComboboxEh;
    dsPunkt: TDataSource;
    edUL: TDBLookupComboboxEh;
    dsUL: TDataSource;
    lbPunkt: TLabel;
    lbUl: TLabel;
    TBItemAdd: TTBItem;
    QueryUL: TAdsQuery;
    QueryULAll: TAdsQuery;
    dsUlAll: TDataSource;
    TBItemCountHouse: TTBItem;
    TBItemLich: TTBItem;
    FtbLich: TAdsTable;
    FtbMens: TAdsTable;
    TBItemEditAdres: TTBItem;
    TBItemCountMens: TTBItem;
    edSobstv: TDBEditEh;
    QueryN: TAdsQuery;
    cbFind: TComboBox;
    TBItemMen: TTBItem;
    procedure DBTextGetText(Sender: TObject; var Text: String);
    procedure edPunktChange(Sender: TObject);
    procedure edULChange(Sender: TObject);
    procedure edPunktEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edULEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure TBItemAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TBItemCountHouseClick(Sender: TObject);
    procedure TBItemLichClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TBItemEditAdresClick(Sender: TObject);
    procedure TBItemCountMensClick(Sender: TObject);
    procedure QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure edSobstvEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure edSobstvEditButtons1Click(Sender: TObject;     var Handled: Boolean);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure cbFindChange(Sender: TObject);
    procedure edSobstvKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure edSobstvEditButtons2Click(Sender: TObject;  var Handled: Boolean);
    procedure TBSubmenuPunktsClick(Sender: TObject);
    procedure TBItemClearPunktsClick(Sender: TObject);
    procedure TBItemMenClick(Sender: TObject);
  private
    { Private declarations }
    FSQLPunkt : String;
    FSQLAll   : String;
    FStrID    : String;
    procedure SetFilter;
  public
    CurSeek : TRecordSeekSobstv;
    FParOwners : TStringList;
    FTypeCountMens    : String;
    FVisibleCountMensNotRegistred : Boolean;
    FVisibleCountMens : Boolean;
    FVisibleListMens  : Boolean;
    FVisibleListOwners:Boolean;
    FAddTail  : Boolean;
    FAddAdres : Boolean;
    FAddDateP  : Boolean;
    FVisibleNameDom   : Boolean;
    FVisibleNamePunkt : Boolean;
    FVisibleRnGor     : Boolean;
//    FAddOtnosh : Boolean;
    procedure CheckCountMens;
    procedure Event_InitFields(Sender: TObject);
    procedure SeekKolvo;

    procedure GridColumnsCountMensNotRegistred(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsCountMens(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsListMens(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsNameDom(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsDom(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsKorp(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetLich(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetOpisLich(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetOwners(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    function  LoadQuery : Boolean; override;

    procedure SaveToIni; override;
    procedure LoadFromIni; override;
    function  getAdditiveWhere: String; override;
    function  getDefaultAddWhere: String; override;
    procedure CheckEnabledPunkts;

    constructor Create( Owner : TComponent); override;
    destructor Destroy; override;

    class function EnableOpen : Boolean; override;
  end;

var
  fmGurnalAdres: TfmGurnalAdres;

implementation

uses fTypeCountMensAdres, fAddAdres, fEditAdres, fMain, fInitField;

{$R *.DFM}

constructor TfmGurnalAdres.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_Adres;
  inherited;
  CurSeek.TypeSeek:=OWNER_NASEL;
  CurSeek.History:=SOBSTV_CUR;
  CurSeek.Value:='';
  QuestDel := '  Удалить текущий адрес ?  ';
  FTypeCountMens    := '';
  FVisibleCountMensNotRegistred := false;
  FVisibleCountMens := false;
  FVisibleListMens  := false;
  FVisibleListOwners:=true;
  FAddTail:=false;
  FAddAdres:=false;

  FAddDateP  := false;
  FVisibleNameDom   := false;
  FVisibleNamePunkt := true;
  FVisibleRnGor := false;
  FParOwners:=TStringList.Create;
  FParOwners.Add('DELIM= '+chr(13)+chr(10));
  FParOwners.Add('TAIL=, ');

//  FAddOtnosh := false;
  {$IFDEF OCHERED}
     TBItemLich.Visible:=false;
  {$ELSE}

  {$ENDIF}
end;

destructor TfmGurnalAdres.Destroy;
begin
  FParOwners.Free;
  inherited;
end;

function TfmGurnalAdres.LoadQuery: Boolean;
var
 it : TTbItem;
 sep : TTbSeparatorItem;
begin
  Result := inherited LoadQuery;
  TBItemSum.Visible:=true;
  if (Role.Status=rsAdmin) then begin
    TBSubItemRun.Visible:=true;
    if TBSubItemRun.Count>0 then begin
      sep := TTbSeparatorItem.Create(TBSubItemRun);
      TBSubItemRun.Add(sep);
    end;

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Изменить значение реквизита в базе';
    it.OnClick:=Event_InitFields;
    TBSubItemRun.Add(it);
  end;
end;

//------------------------------------------------------------------------------
procedure TfmGurnalAdres.Event_InitFields(Sender: TObject);
var
  lFilter : Boolean;
begin
  if TBItemClrFlt.Enabled or Query.Filtered or (FFilter_Punkt<>'') or
    (edPunkt.Text<>'') or (edUL.Text<>'') or (edSobstv.Text<>'') then begin
    lFilter := true;
  end else begin
    lFilter := false;
  end;
  if RunInitRekvisit(Self, Query, dmBase.tbAdres, 'DATE_FIKS;ID', lFilter) then Refresh(true);
end;

procedure TfmGurnalAdres.SaveToIni;
var
  ini : TSasaIniFile;         
begin
  inherited SaveToIni;
  ini := GlobalTask.iniFile('LOCAL');
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_COUNT_MENS_NOT_REGISTRED',FVisibleCountMensNotRegistred);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_COUNT_MENS',FVisibleCountMens);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_LIST_MENS',FVisibleListMens);

  ini.WriteBool(KodGurnal+'.Add','VISIBLE_LIST_OWNERS',FVisibleListOwners);
  ini.WriteBool(KodGurnal+'.Add','ADD_TAIL',FAddTail);
  ini.WriteBool(KodGurnal+'.Add','ADD_ADRES',FAddAdres);

  ini.WriteBool(KodGurnal+'.Add','ADD_DATE_PROP',FAddDateP);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_NAME_DOM',FVisibleNameDom);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_NAME_PUNKT',FVisibleNamePunkt);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_RNGOR',FVisibleRnGor);
//  ini.WriteBool(KodGurnal+'.Add','ADD_OTNOSH_MENS',FAddOtnosh);
  ini.WriteString(KodGurnal+'.Add','TYPE_COUNT_MENS',FTypeCountMens);
end;

procedure TfmGurnalAdres.LoadFromIni;
var
  i : Integer;
  ini : TsasaIniFile;
begin
  inherited LoadFromIni;
  ini := GlobalTask.iniFile('LOCAL');
  FVisibleCountMensNotRegistred := ini.ReadBool(KodGurnal+'.Add','VISIBLE_COUNT_MENS_NOT_REGISTRED',false);
  FVisibleCountMens := ini.ReadBool(KodGurnal+'.Add','VISIBLE_COUNT_MENS',false);
  FVisibleListMens  := ini.ReadBool(KodGurnal+'.Add','VISIBLE_LIST_MENS',false);

  FVisibleListOwners:=ini.ReadBool(KodGurnal+'.Add','VISIBLE_LIST_OWNERS',true);
  FAddTail := ini.ReadBool(KodGurnal+'.Add','ADD_TAIL',false);
  FAddAdres:= ini.ReadBool(KodGurnal+'.Add','ADD_ADRES',false);

  FAddDateP := ini.ReadBool(KodGurnal+'.Add','ADD_DATE_PROP',false);
  FVisibleNameDom   := ini.ReadBool(KodGurnal+'.Add','VISIBLE_NAME_DOM',false);
  {$IFDEF GKH}
    FVisibleNamePunkt := ini.ReadBool(KodGurnal+'.Add','VISIBLE_NAME_PUNKT',true);
    FVisibleRnGor     := ini.ReadBool(KodGurnal+'.Add','VISIBLE_RNGOR',false);
  {$ELSE}
    FVisibleNamePunkt := true;
    FVisibleRnGor     := false;
  {$ENDIF}
//  FAddOtnosh := ini.ReadBool(KodGurnal+'.Add','ADD_OTNOSH_MENS',false);
  FTypeCountMens    := ini.ReadString(KodGurnal+'.Add','TYPE_COUNT_MENS','10');
  for i:=0 to Grid.Columns.Count-1 do begin
    if Grid.Columns[i].FieldName='ISLIFE' then begin
      Grid.Columns[i].ImageList := HImageList;
      Grid.Columns[i].KeyList.Add('1');
      Grid.Columns[i].KeyList.Add('0');
    // псевдополе для вывода домика
    end else if Grid.Columns[i].FieldName='TYPE_ADRES' then begin
      Grid.Columns[i].ImageList := HImageList;
      Grid.Columns[i].OnGetCellParams := GridColumnsGetLich;
    // псевдополе для вывода лицевых счетов в доме
    end else if Grid.Columns[i].FieldName='LICH' then begin
      {$IFDEF OCHERED}
        Grid.Columns[i].Visible:=false;
      {$ELSE}
        Grid.Columns[i].Visible:=true;
        Grid.Columns[i].OnGetCellParams := GridColumnsGetOpisLich;
      {$ENDIF}
    end else if Grid.Columns[i].FieldName='OWNERS' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetOwners;
    end else if Grid.Columns[i].FieldName='COUNT_MENS' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsCountMens;
    end else if Grid.Columns[i].FieldName='COUNT_MENS_NOT_REGISTRED' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsCountMensNotRegistred;
    end else if Grid.Columns[i].FieldName='LIST_MENS' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsListMens;
    end else if UpperCase(Grid.Columns[i].FieldName)='DOM_NAME' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsNameDom;
    end else if UpperCase(Grid.Columns[i].FieldName)='DOM' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsDom;
    end else if UpperCase(Grid.Columns[i].FieldName)='KORP' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsKOrp;
    end;
  end;
  CheckCountMens;

end;

//-----------------------------------------------------------
function TfmGurnalAdres.getAdditiveWhere: String;
var
 s:String;
 procedure AddResult(ss:String);
 begin if s='' then s:=ss else s:=s+' and '+ss;  end;
begin
  Result:='';
  if not AdditiveWhere_for_FilterInterface then begin
    {$IFDEF OCHERED}
      s:='';
    {$ELSE}
      if IsDateFiks
        then s:=''
        else s:='a.date_fiks='+DateToSQL(fmMain.DateFiks);
    {$ENDIF}
  end;
  if FFilter_Punkt<>''    then AddResult(FFilter_Punkt);
  if (edPunkt.Text <> '') then AddResult('punkt='+ VarToStr(edPunkt.Value));
  if (edUl.Text <> '')    then AddResult('ul='+ VarToStr(edUl.Value));
  if edSobstv.Text<>''    then AddResult('a.id in (select id from '+GetNameTmpIdTable+')');
  Result:=s;
//  ShowMessage('"'+Result+'"');
end;

//-----------------------------------------------------------
function TfmGurnalAdres.getDefaultAddWhere: String;
begin
  Result:=getAdditiveWhere;
//  Result:=GetStrSystemFilter(true);
end;

procedure TfmGurnalAdres.GridColumnsGetLich(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
//  vKeyValues : Variant;
//  nTip:Integer;
  old:String;
  lPropis, lPresent:Boolean;
begin
  if not EditMode then begin
//    if Params.Text<>'' then begin
//    nTip:=;
    if Query.FieldByName('tip').AsInteger=TH_UCHASTOK then begin
      Params.ImageIndex:=2;
    end else begin
      old:=FtbMens.IndexFieldNames;
      FtbMens.IndexFieldNames:='DATE_FIKS;ADRES_ID';
      lPropis:=false;
      lPresent:=false;
      try
        FtbMens.SetRange([DateFiks, Query.FieldByName('id').AsInteger],[DateFiks, Query.FieldByName('id').AsInteger]);
        while not FtbMens.Eof do begin
          if not FtbMens.FieldByName('CANDELETE').AsBoolean then begin
            if FtbMens.FieldByName('PROPIS').AsBoolean then begin
              lPropis:=true;
            end else if FtbMens.FieldByName('PRESENT').AsBoolean then begin
              lPresent:=true;
            end;
            if lPropis then break;
          end;
          FtbMens.Next;
        end;
      finally
        FtbMens.CancelRange;
        FtbMens.IndexFieldNames:=old;
      end;
      if lPropis then begin
        Params.ImageIndex:=0;
      end else if lPresent then begin
        Params.ImageIndex:=3;
      end else begin
        Params.ImageIndex:=1;
      end;
      {
      vKeyValues := VarArrayCreate( [0, 1], varOleStr );
      vKeyValues[0] := Query.FieldByName('date_fiks').AsDateTime;
      vKeyValues[1] := Query.FieldByName('id').AsInteger;
      if FtbLich.Locate('DATE_FIKS;ADRES_ID', vKeyValues, []) then begin
        Params.ImageIndex:=0;
      end else begin
        Params.ImageIndex:=1;
      end;
      }
    end;
//    end;
  end;
end;

procedure TfmGurnalAdres.GridColumnsGetOwners(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  nType:Integer;
begin
  if Query.fieldByName('ID').AsString<>'' then begin
//    Params.Text := dmBase.HouseOwners2(Query.FieldByName('date_fiks').AsDateTime,
//                       Query.FieldByName('id').AsString, 1, nil);
  // nType=1 (+часть), nType=3 (+адрес), nType=4 (+часть+адрес)
    if FAddTail and FAddAdres then
      nType:=4
    else if FAddAdres then
      nType:=3
    else if FAddTail then
      nType:=1
    else
      nType:=0;

    Params.Text := dmBase.HouseOwners(Query.FieldByName('date_fiks').AsDateTime,
                       Query.FieldByName('id').AsString,nil, nType, nil, nil, FParOwners);
  end;
end;

procedure TfmGurnalAdres.GridColumnsGetOpisLich(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  vKeyValues : Variant;
  d : TDateTime;
  i : Integer;
  s,ss : String;
begin
//  if not EditMode then begin
    if Params.Text<>'' then begin
      d := Query.FieldByName('date_fiks').AsDateTime;
      i := Query.FieldByName('id').AsInteger;
      FtbLich.CancelRange;
      try
        FtbLich.IndexFieldNames := 'DATE_FIKS;ADRES_ID';
        FtbLich.SetRange([d,i],[d,i]);
        if not FtbLich.Eof then begin
          Params.Text := '';
          while not FtbLich.Eof do begin
            if FtbLich.FieldByName('CANDELETE').IsNull or not FtbLich.FieldByName('CANDELETE').AsBoolean then begin
              Params.Text := Params.Text + FtbLich.FieldByName('NOMER').AsString;
              if FtbLich.FieldByName('FIRST').AsString<>'' then begin
                vKeyValues := VarArrayCreate( [0, 1], varOleStr );
                vKeyValues[0] := d;
                vKeyValues[1] := FtbLich.FieldByName('FIRST').AsInteger;
                s := '';
                if FtbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
                  s := Trim(FtbMens.FieldByName('FAMILIA').AsString);
                  ss := Trim(FtbMens.FieldByName('NAME').AsString);
                  if ss<>'' then s := s + ' ' + ss;
  //                if ss<>'' then s := s + Copy(ss,1,1)+'.';
                  ss := Trim(FtbMens.FieldByName('OTCH').AsString);
                  if ss<>'' then s := s + ' ' + ss;
  //                if ss<>'' then s := s + Copy(ss,1,1)+'.';
                end;
                if s<>'' then Params.Text := Params.Text+' ( '+s+' )    ';
              end;
            end;
            FtbLich.Next;
          end;
        end else begin
          Params.Text := '';
        end;
      finally
        FtbLich.CancelRange;
      end;
    end;
//  end;
end;

procedure TfmGurnalAdres.DBTextGetText(Sender: TObject; var Text: String);
begin
  Text := dmBase.NameSostFromDate( Query.FieldByName('DATE_FIKS').AsDateTime );
end;

procedure TfmGurnalAdres.SetFilter;
begin
  CreateAdditiveWhere2Refresh;
  {
  if (edPunkt.Text='') and  (edUL.Text='') and (edSobstv.Text='') then begin
    Query.Filtered := false;
    Query.OnFilterRecord:=nil;
  end else begin
    lSet:=false;
    Query.Filter := '';
    Query.OnFilterRecord:=nil;
    strFilter := '';
    if (edPunkt.Text <> '') then begin
      strFilter := 'punkt = '+ VarToStr(edPunkt.Value);
    end;
    if (edUL.Text <> '') then begin
      s := 'ul = '+ VarToStr(edUL.Value);
      if strFilter=''
        then strFilter := s
        else strFilter := strFilter + ' and ' + s;
    end;
    if strFilter<>'' then begin
      Query.Filter := strFilter;
      lSet:=true;
    end;
    if edSobstv.Text<>'' then begin
      Query.OnFilterRecord:=QueryFilterRecord;
      lSet:=true;
    end;
    if lSet then begin
      Query.Filtered := true;
    end;
  end;
  }
end;

procedure TfmGurnalAdres.edPunktChange(Sender: TObject);
begin
  if FRun
    then exit;
  if (edPunkt.Text = '') then begin
    QueryUL.Filter   := '';
    QueryUL.Filtered := false;
    edUL.ListSource := dsUlAll;
  end else begin
    edUL.Value:=null;
    QueryUL.Filter   := 'punkt='+VarToStr(edPunkt.Value);
    QueryUL.Filtered := true;
    edUL.ListSource := dsUl;
  end;
  SetFilter;
  CheckEnabledPunkts;
  ActiveControl:=Grid;
end;

procedure TfmGurnalAdres.edULChange(Sender: TObject);
begin
  if FRun
    then exit;
  SetFilter;
  CheckEnabledPunkts;
//  ActiveControl:=Grid;
end;

procedure TfmGurnalAdres.edPunktEditButtons0Click(Sender: TObject;   var Handled: Boolean);
begin
  Handled := true;
  edPunkt.Value:=null;
  ActiveControl:=Grid;
end;

procedure TfmGurnalAdres.edULEditButtons1Click(Sender: TObject;    var Handled: Boolean);
begin
  Handled := true;
  edUL.Value:=null;
  ActiveControl:=Grid;
end;

procedure TfmGurnalAdres.TBItemAddClick(Sender: TObject);
var
  nNewID : Integer;
  ds : TDataSet;
  nPunkt,nUL,nRnGor:Integer;
begin
  try
    nPunkt:=Query.FieldByName('PUNKT').AsInteger;
  except
    nPunkt:=0;
  end;
  {$IFDEF GKH}
    try
      nUL:=Query.FieldByName('UL').AsInteger;
    except
      nUL:=0;
    end;
    if IsAccountRnGor
      then nRnGor:=GlobalTask.ParamAsInteger('RN_GOROD')
      else nRnGor:=0;
  {$ELSE}
      nUL:=0;
      nRnGor:=0;
  {$ENDIF}
  if AddNewAdres(DateFiks, nNewID, ds, nPunkt,nRnGor,nUL) then begin
    fmMain.EditDokument(ds, dmBase.TypeObj_Adres, 'ID', FListPar, false, KodGurnal);
    FullRefresh;
  end;
end;

procedure TfmGurnalAdres.TBItemEditAdresClick(Sender: TObject);
begin
  if EditAdres(Query) then begin
    Refresh;
  end;
end;
//-------------------------------------------------------------------------
procedure TfmGurnalAdres.FormCreate(Sender: TObject);
var
  lErr : Boolean;
//  s : String;
begin
  inherited;
  FStrID:='';
  lErr := false;
  edSobstv.EditButtons[1].Glyph:=imSeek.Picture.Bitmap;
  edSobstv.EditButtons[1].Visible:=false;

  if not dmBase.LoadSQL('СпрУлицДляЖурнала',FSQLAll) then begin
    FSQLAll := 'select 1 punkt, ul id, name name_ul from СпрУлиц';
    PutError('Ошибка загрузки запроса: "СпрУлицДляЖурнала"');
    lErr := true;
  end;
  if dmBase.LoadSQL('УлицыНасПунктов',FSQLPunkt) then begin
    StringReplace(FSQLPunkt, '1899-12-30', DTOS(DateFiks,tdAds), [rfReplaceAll, rfIgnoreCase]);
    StringReplace(FSQLPunkt, '&DATE_FIKS&', QStr(DTOS(DateFiks,tdAds)), [rfReplaceAll, rfIgnoreCase]);
  end else begin
    QueryUL.SQL.Text := 'select 1 punkt, ul id, name name_ul from СпрУлиц';
    PutError('Ошибка загрузки запроса: "УлицыНасПунктов"');
    lErr := true;
  end;
  if not lErr then begin
    QueryULAll.SQL.Text := FSQLAll;
    QueryUL.SQL.Text    := FSQLPunkt;
  end;
  QueryUL.Open;
  QueryULAll.Open;
  FtbLich.Open;
  FtbMens.Open;
end;

procedure TfmGurnalAdres.FormDestroy(Sender: TObject);
begin
//  if QueryUL.Active    then  QueryUL.Close;
//  if QueryULAll.Active then  QueryULAll.Close;
  if FtbLich.Active    then  FtbLich.Close;
  if FtbMens.Active    then  FtbMens.Close;
  inherited;
end;

procedure TfmGurnalAdres.TBItemCountHouseClick(Sender: TObject);
var
  s  : String;
  i,j  : Integer;
  sl : TStringList;
  lFind : Boolean;
  c : TCursor;
begin
  c := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  sl := TStringList.Create;
  try
    Query.DisableControls;
    Query.First;
    j:=0;
    while not Query.Eof do begin
      s := PadLStr(Query.FieldByName('PUNKT').AsString,10,'0')+
           PadLStr(Query.FieldByName('UL').AsString,10,'0')+
           PadLStr(Query.FieldByName('DOM').AsString,10,'0')+
           PadLStr(Query.FieldByName('KORP').AsString,10,'0');
      lFind := false;
      for i:=0 to sl.Count-1 do begin
        if sl.Strings[i]=s then begin
          lFind := true;
          break;
        end;
      end;
      if not lFind then begin
        sl.Add(s);
        j := j + 1;
      end;
      Query.Next;
    end;
  finally
    Query.First;
    Query.EnableControls;
    sl.Free;
    Screen.Cursor := c;
  end;
  ShowMessage('Количество домов: '+IntToStr(j));
end;
//------------------------------------------------------------------------------------------------------
procedure TfmGurnalAdres.TBItemMenClick(Sender: TObject);
var
  vKeyValues : Variant;
  d : TDateTime;
  i,nID : Integer;
  s,ss : String;
  sl : TStringList;
  slID : TStringList;
begin      
  nID := 0;
  d := Query.FieldByName('date_fiks').AsDateTime;
  i := Query.FieldByName('id').AsInteger;
  FtbMens.CancelRange;
  try
    FtbMens.IndexFieldNames := 'DATE_FIKS;ADRES_ID';
    FtbMens.SetRange([d,i],[d,i]);
    if not FtbMens.Eof then begin
      sl   := TStringList.Create;
      slID := TStringList.Create;
      while not FtbMens.Eof do begin
        s:=Trim(FtbMens.FieldByName('FAMILIA').AsString);
        ss:=Trim(FtbMens.FieldByName('NAME').AsString);
        if ss<>'' then s:=s+' '+ss;
        ss:=Trim(FtbMens.FieldByName('OTCH').AsString);
        if ss<>'' then s:=s+' '+ss;
        sl.Add(s);
        slID.Add(FtbMens.FieldByName('ID').AsString);
        FtbMens.Next;
      end;
      if sl.Count=1 then begin
        nID := StrToInt(slID.Strings[0]);
      end else begin
        i:= ChoiceFromList(sl,'Выберите человека');
        if i>-1 then nID := StrToInt(slID.Strings[i]);
      end;
      sl.Free;
      slID.Free;
    end;
  finally
    FtbMens.CancelRange;
  end;
  if nID > 0 then begin
    fmMain.EditDokument(Query, dmBase.TypeObj_Nasel, IntToStr(nID), nil, true, KodGurnal);
  end;
end;
//------------------------------------------------------------------------------------------------------
procedure TfmGurnalAdres.TBItemLichClick(Sender: TObject);
var
  vKeyValues : Variant;
  d : TDateTime;
  i,nID : Integer;
  s,ss : String;
  sl : TStringList;
  slID : TStringList;
begin
  nID := 0;
  d := Query.FieldByName('date_fiks').AsDateTime;
  i := Query.FieldByName('id').AsInteger;
  FtbLich.CancelRange;
  try
    FtbLich.IndexFieldNames := 'DATE_FIKS;ADRES_ID';
    FtbLich.SetRange([d,i],[d,i]);
    if not FtbLich.Eof then begin
      sl   := TStringList.Create;
      slID := TStringList.Create;
      while not FtbLich.Eof do begin
        s:='';
        if FtbLich.FieldByName('FIRST').AsString<>'' then begin
          vKeyValues := VarArrayCreate( [0, 1], varOleStr );
          vKeyValues[0] := d;
          vKeyValues[1] := FtbLich.FieldByName('FIRST').AsInteger;
          if FtbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
            s  := Trim(FtbMens.FieldByName('FAMILIA').AsString);
            ss := Trim(FtbMens.FieldByName('NAME').AsString);
            if ss<>'' then s := s + ' ' + ss;
            ss := Trim(FtbMens.FieldByName('OTCH').AsString);
            if ss<>'' then s := s + ' ' + ss;
          end;
        end;
        sl.Add(FtbLich.FieldByName('NOMER').AsString+' '+s);
        slID.Add(FtbLich.FieldByName('ID').AsString);
        FtbLich.Next;
      end;
      if sl.Count=1 then begin
        nID := StrToInt(slID.Strings[0]);
      end else begin
        i:= ChoiceFromList(sl,'Выберите лиц. счет');
        if i>-1 then nID := StrToInt(slID.Strings[i]);
      end;
      sl.Free;
      slID.Free;
    end;
  finally
    FtbLich.CancelRange;
  end;
  if nID > 0 then begin
    fmMain.EditDokument(Query, dmBase.TypeObj_Lich, IntToStr(nID), nil, true, KodGurnal);
  end;
end;

class function TfmGurnalAdres.EnableOpen: Boolean;
begin
  Result := inherited EnableOpen;
end;

procedure TfmGurnalAdres.GridColumnsCountMens(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
 if FVisibleCountMens then begin
   Params.Text := IntToStr(dmBase.CountMensAdres( DateFiks, Query.FieldByName('ID').AsString, FTypeCountMens, nil));
 end;
end;

procedure TfmGurnalAdres.GridColumnsCountMensNotRegistred(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
 if FVisibleCountMensNotRegistred then begin
   Params.Text := IntToStr(dmBase.CountMensAdresNotRegistred( DateFiks, Query.FieldByName('ID').AsString));
 end;
end;

procedure TfmGurnalAdres.GridColumnsDom(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if Query.FieldByName('NOT_DOM').AsBoolean then Params.Text:='';
end;

procedure TfmGurnalAdres.GridColumnsKorp(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('NOT_DOM').AsBoolean then Params.Text:='';
end;

procedure TfmGurnalAdres.GridColumnsNameDom(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  adr:TAdres;
  s:String;
begin
 if FVisibleNameDom then begin
   Params.Text := Query.FieldByName('DOM').AsString;
   if Query.FieldByName('NOT_DOM').AsBoolean then begin
     Params.Text := 'нет';
   end;
   if Query.FieldByName('ID').AsString<>'' then begin
     adr:=dmBase.AdresForSeek(Query);
     s:=dmBase.NameBigHouse(adr,DateFiks);
     if s<>'' then begin
       Params.Text := s;
     end;
   end;
 end else begin
   Params.Text := Query.FieldByName('DOM').AsString;
 end;
end;

procedure TfmGurnalAdres.GridColumnsListMens(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  c1,c2 : Char;
  lOk1,lOk2 : Boolean;
  strAdresID,s,ss : String;
begin
  s:='';
  if FVisibleListMens then begin
    strAdresID := Query.FieldByName('ID').AsString;
    if strAdresID<>'' then begin
      with dmBase do begin
      tbMens.CancelRange;
      tbMens.IndexName := 'ADRES_KEY';
      try
        c1 := FTypeCountMens[1];
        c2 := FTypeCountMens[2];
        tbMens.SetRange([DateFiks,strAdresID],[DateFiks,strAdresID]);
        while not tbMens.Eof do begin
          if ( tbMens.FieldByName('CANDELETE').IsNull or
               not tbMens.FieldByName('CANDELETE').AsBoolean) then begin
            lOk1 := false;
            lOk2 := false;
            if (c1='0') or ((c1='1') and tbMens.FieldByName('PRESENT').AsBoolean) or
               ((c1='2') and not tbMens.FieldByName('PRESENT').AsBoolean)
              then lOk1 := true;
            if (c2='0') or ((c2='1') and (tbMens.FieldByName('DATEP').AsString<>'')) or
               ((c1='2') and (tbMens.FieldByName('DATEP').AsString=''))
              then lOk2 := true;
            if lOk1 and lOk2 then begin
//              if FAddOtnosh and (tbMens.FieldByName('OTNOSH').AsString<>'') then begin
//                if dmBase.SprOtnosh.Locate('ID', tbMens.FieldByName('OTNOSH').AsString,[])
//                  then ss := ANSILowerCase(dmBase.SprOtnosh.FieldByName('NAME').AsString)+' '
//                  else ss := '';
//              end else begin
                ss := '';
//              end;
              s := s + ss+ tbMens.FieldByName('FAMILIA').AsString+' '+
                       tbMens.FieldByName('NAME').AsString+' '+
                       tbMens.FieldByName('OTCH').AsString;

              if FAddDateP and (tbMens.FieldByName('DATEP').AsString<>'') then begin
                 s := s + ' ' + FormatDateTime('dd.mm.yyyy',tbMens.FieldByName('DATEP').AsDateTime);
              end;
              s:=s+#13#10;
//              if FAddDateR and (tbMens.FieldByName('DATER').AsString<>'') then begin
//                 s := s + ' ' + FormatDateTime('dd.mm.yyyy',tbMens.FieldByName('DATER').AsDateTime)+'г.р.';
//              end;

            end;
          end;
          tbMens.Next;
        end;
      finally
        tbMens.CancelRange;
      end;
      end;
    end;
    if s<>'' then s:=Copy(s,1,Length(s)-2);
  end;
  Params.Text := s;
end;

procedure TfmGurnalAdres.CheckCountMens;
begin
  {$IFDEF GKH}
  {
    Label1.Visible:=FVisibleNamePunkt;
    edPunkt.Visible:=FVisibleNamePunkt;
    if FVisibleNamePunkt then begin
      Label2.Left:=281;
      edUl.Left:=318;
      Label3.Left:=520;
      edSobstv.Left:=598;
    end else begin
      Label2.Left:=8;
      edUl.Left:=60;
      Label3.Left:=281;
      edSobstv.Left:=368;
    end;
    }
  {$ENDIF}
  try
    Grid.FieldColumns['COUNT_MENS_NOT_REGISTRED'].Visible:=FVisibleCountMensNotRegistred;
    Grid.FieldColumns['COUNT_MENS'].Visible:=FVisibleCountMens;
    Grid.FieldColumns['LIST_MENS'].Visible:=FVisibleListMens;
    Grid.FieldColumns['OWNERS'].Visible:=FVisibleListOwners;
    Grid.FieldColumns['DOM_NAME'].Visible:=FVisibleNameDom;
    Grid.FieldColumns['PUNKT'].Visible:=FVisibleNamePunkt;
    Grid.FieldColumns['RNGOR'].Visible:=FVisibleRnGor;
  except
  end
end;

procedure TfmGurnalAdres.TBItemCountMensClick(Sender: TObject);
var
  lCheck:Boolean;
begin
  lCheck:=false;
  fmTypeCountMensAdres := TfmTypeCountMensAdres.Create(nil);
  fmTypeCountMensAdres.cbShow.Checked:=FVisibleCountMens;
  fmTypeCountMensAdres.cbNotRegistred.Checked:=FVisibleCountMensNotRegistred;
  fmTypeCountMensAdres.cbListMens.Checked:=FVisibleListMens;

  fmTypeCountMensAdres.cbOwners.Checked:=FVisibleListOwners;
  fmTypeCountMensAdres.cbAddTail.Checked:=FAddTail;
  fmTypeCountMensAdres.cbAddAdres.Checked:=FAddAdres;

  fmTypeCountMensAdres.cbDateP.Checked:=FAddDateP;
  fmTypeCountMensAdres.cbNameDom.Checked:=FVisibleNameDom;
  fmTypeCountMensAdres.cbNamePunkt.Checked:=FVisibleNamePunkt;
  fmTypeCountMensAdres.cbRnGor.Checked:=FVisibleRnGor;
//  fmTypeCountMensAdres.cbOtnosh.Checked:=FAddOtnosh;
  if FTypeCountMens='' then begin
    fmTypeCountMensAdres.rbPresent.ItemIndex :=1;
    fmTypeCountMensAdres.rbPropis.ItemIndex  :=0;
  end else begin
    fmTypeCountMensAdres.rbPresent.ItemIndex := StrToInt(Copy(FTypeCountMens,1,1));
    fmTypeCountMensAdres.rbPropis.ItemIndex  := StrToInt(Copy(FTypeCountMens,2,1));
  end;
  {$IFNDEF GKH}
    fmTypeCountMensAdres.cbNamePunkt.Visible:=false;
    fmTypeCountMensAdres.cbRnGor.Visible:=false;
    fmTypeCountMensAdres.Height:=fmTypeCountMensAdres.Height-40;
  {$ENDIF}
  if fmTypeCountMensAdres.ShowModal=mrOk then begin
    FTypeCountMens := IntToStr(fmTypeCountMensAdres.rbPresent.ItemIndex)+
                      IntToStr(fmTypeCountMensAdres.rbPropis.ItemIndex);
    FVisibleCountMens := fmTypeCountMensAdres.cbShow.Checked;
    FVisibleCountMensNotRegistred := fmTypeCountMensAdres.cbNotregistred.Checked;
    FVisibleListMens  := fmTypeCountMensAdres.cbListMens.Checked;
    FAddDateP := fmTypeCountMensAdres.cbDateP.Checked;
    FVisibleNameDom   := fmTypeCountMensAdres.cbNameDom.Checked;

    FVisibleListOwners:=fmTypeCountMensAdres.cbOwners.Checked;
    FAddTail:=fmTypeCountMensAdres.cbAddTail.Checked;
    FAddAdres:=fmTypeCountMensAdres.cbAddAdres.Checked;

    {$IFDEF GKH}
      FVisibleNamePunkt := fmTypeCountMensAdres.cbNamePunkt.Checked;
      FVisibleRnGor     := fmTypeCountMensAdres.cbRnGor.Checked;
    {$ELSE}
      FVisibleNamePunkt := true;
      FVisibleRnGor     := false;
    {$ENDIF}
//    FAddOtnosh        := fmTypeCountMensAdres.cbOtnosh.Checked;
    CheckCountMens;
    CheckPropertyGridColumns;
    lCheck:=true;
  end;
  fmTypeCountMensAdres.Free;
  if lCheck then begin
    SetFilter;
  end;
  Application.ProcessMessages;
end;

procedure TfmGurnalAdres.QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if FStrID='' then begin
    Accept:=true;
  end else begin
    if Pos(';'+Query.FieldByName('ID').AsString+';',FStrID)>0
      then Accept:=true
      else Accept:=false;
  end;
end;

procedure TfmGurnalAdres.cbFindChange(Sender: TObject);
begin
  if edSobstv.Text<>'' then begin
    edSobstv.Text:='';
    SetFilter;
  end;
  case cbFind.Itemindex of
   0 : begin
         edSobstv.ReadOnly:=true;
         edSobstv.EditButtons[0].Visible:=true;
         edSobstv.EditButtons[1].Visible:=false;
       end;
   1 : begin
         edSobstv.ReadOnly:=false;
         edSobstv.EditButtons[0].Visible:=false;
         edSobstv.EditButtons[1].Visible:=true;
         ActiveControl:=edSobstv;
       end;
  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmGurnalAdres.SeekKolvo;
var
  sSQL,sWhere,sOper,sValue,sKolvo:String;
//  n:Integer;
begin
  sValue:=Trim(edSobstv.Text);
  if (cbFind.ItemIndex=1) and (sValue<>'') then begin   // количество     
    if GetOperValue(sValue, sOper, sKolvo, true, self) then begin
      sWhere:='adres_id>0 and '+dmBase.CountMens2Where(DateFiks,0,FTypeCountMens,nil);
      sSQL:='DELETE FROM &tmp&;'+chr(13);
      sSQL:=sSQL+'INSERT INTO &tmp& SELECT adres_id id, Count(*) FROM Население WHERE '+sWhere+' GROUP BY adres_id HAVING Count(*)'+sOper+sKolvo+';';
      if (sKolvo='0') and (Pos('=',sOper)>0) then begin  // для пустующих адресов, если ищем "=0"
        sSQL:=sSQL+'INSERT INTO &tmp& (ID) SELECT ID FROM БазаДомов WHERE id not in (SELECT distinct adres_id AS id FROM Население WHERE date_fiks='+QStr(DTOS(DateFiks,tdAds))+');';
        sSQL:=sSQL+'INSERT INTO &tmp& (ID) SELECT ID FROM БазаДомов WHERE id not in (SELECT distinct adres_id AS id FROM Население WHERE '+sWhere+');';
      end;
      OpenMessage('Подождите пожалуйста ...');
      Application.ProcessMessages;
      try
        TmpQuery.SQL.Text:=StringReplace( sSQL, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);
        TmpQuery.ExecSQL;
        CloseMessage;
      except
        on E:Exception do begin
          CloseMessage;
          PutError('Ошибка поиска: '+#13+E.Message,self);
        end;
      end;
      Application.ProcessMessages;
      SetFilter;
    end;
  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmGurnalAdres.edSobstvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_RETURN) and (Shift=[]) then begin
    SeekKolvo;

  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmGurnalAdres.edSobstvEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  s1,s2,s,sOper,sSeek : String;
  arr:TArrStrings;
  slSQL:TStringList;
  function getWhere(sFam,sName,sOtch:String):String;
  begin
    if sOper='*' then Result:='n.FAMILIA LIKE '+QStr(sFam+'%')
                 else Result:='n.FAMILIA='+QStr(sFam);
    if sName<>'' then begin
      if sOper='*' then Result:=Result+' and n.NAME LIKE '+QStr(sName+'%')
                   else Result:=Result+' and n.NAME='+QStr(sName);

    end;
    if sOtch<>'' then begin
      if sOper='*' then Result:=Result+' and n.OTCH LIKE '+QStr(sOtch+'%')
                   else Result:=Result+' and n.OTCH='+QStr(sOtch);

    end;
  end;
begin
  if cbFind.ItemIndex=0 then begin // по ФИО собственника
    slSQL:=TStringList.Create;            
    slSQL.Add('DELETE FROM &tmp&;');
    if SetSeekSobstv(CurSeek,self) and (CurSeek.Value<>'') then begin
      if Copy(CurSeek.Value,1,1)='=' then begin
        sOper:='=';
        sSeek:=Copy(CurSeek.Value,2,Length(CurSeek.Value));
      end else begin
        sOper:='*';
        sSeek:=CurSeek.Value;
      end;
      StrToArr(sSeek,arr,' ',true);
      SetLength(arr,3);
      if CurSeek.TypeSeek=OWNER_NASEL then begin

        s1:= 'SELECT distinct o.ID FROM HouseOwners o '+chr(13)+
             'LEFT JOIN Население n ON o.date_fiks='+QStr(DTOS(DateFiks,tdAds))+' and o.kod=n.id '+chr(13)+
             'WHERE typekod=1 and '+getWhere(arr[0],arr[1],arr[2]);

        if sOper='*' then s:='name like '+QStr(Copy(arr[0],1,Length(arr[0])-1)+'%') else s:='name='+QStr(arr[0]);
        s2:= 'SELECT distinct ID FROM HouseOwnersHist WHERE typekod=1 and '+s;
        if arr[1]<>'' then begin
          if sOper='*'
            then s2:=s2+' and name_men like '+QStr(Copy(arr[1],1,Length(arr[1])-1)+'%')
            else s2:=s2+' and name_men='+QStr(arr[1]);
        end;
        if arr[2]<>'' then begin
          if sOper='*'
            then s2:=s2+' and otch_men like '+QStr(Copy(arr[2],1,Length(arr[2])-1)+'%')
            else s2:=s2+' and otch_men='+QStr(arr[2]);
        end;

      end else begin
        s1:= 'SELECT distinct o.ID FROM HouseOwners o '+chr(13)+
             'LEFT JOIN СпрМестРаботы n ON o.date_fiks='+QStr(DTOS(DateFiks,tdAds))+' and o.kod=n.id '+chr(13)+
             'WHERE typekod=2 and n.name like '+QStr('%'+CurSeek.Value+'%')+Chr(13);
        s2:= 'SELECT distinct ID FROM HouseOwnersHist WHERE typekod=2 and name like '+QStr('%'+CurSeek.Value+'%')+Chr(13);
      end;
      if CurSeek.History=SOBSTV_CUR then begin
        s:=s1;
      end else if CurSeek.History=SOBSTV_HIST then begin
        s:=s2;
      end else begin
        s:='select distinct id from ('+s1+chr(13)+' union all '+chr(13)+s2+') aaa';
      end;
      s:='insert into &tmp& (id) '+s+';';
      slSQL.Add(s);
      OpenMessage('Подождите пожалуйста ...');
      Application.ProcessMessages;
      try
        TmpQuery.SQL.Text:=StringReplace( slSQL.Text, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);
        slSQL.Free;
        TmpQuery.ExecSQL;
        CloseMessage;
      except
        on E:Exception do begin
          CloseMessage;
          PutError('Ошибка поиска: '+#13+E.Message,self);
        end;
      end;
      {
      FStrID:=';';
      while not QuerySobstv.Eof do begin
        FStrID:=FStrID+QuerySobstv.FieldByName('ID').AsString+';';
        QuerySobstv.Next;
      end;
      }
  //    if FStrID<>'' then FStrID:=';'+FStrID;
//      QuerySobstv.Close;
      edSobstv.Text:=CurSeek.Value;
      Application.ProcessMessages;
      SetFilter;
    end;
  end else if cbFind.ItemIndex=1 then begin   // количество
//    PutError('!!!');
  end;
  ActiveControl:=Grid;
end;

procedure TfmGurnalAdres.edSobstvEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  SeekKolvo;
end;
procedure TfmGurnalAdres.edSobstvEditButtons2Click(Sender: TObject;  var Handled: Boolean);
begin
  FStrID:='';
  if edSobstv.Text<>'' then begin
    edSobstv.Text:='';
    SetFilter;
    ActiveControl:=Grid;
  end;
end;

//-------------------------------------------------------------------
procedure TfmGurnalAdres.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not Query.FieldByName('SPEC_UCH').IsNull and Query.FieldByName('SPEC_UCH').AsBoolean then begin
    AFont.Style := AFont.Style + [fsBold];
  end;
end;
//-------------------------------------------------------------------
procedure TfmGurnalAdres.CheckEnabledPunkts;
begin
  if (edPunkt.Text<>'') or (edUL.Text<>'') then begin
    ClearPunkts;
    TBSubmenuPunkts.Enabled:=false;
  end else begin
    TBSubmenuPunkts.Enabled:=true;
  end;
  if FFilter_Punkt='' then begin
    edPunkt.Enabled:=true;
    lbPunkt.Enabled:=true;
    edUL.Enabled:=true;
    lbUL.Enabled:=true;
  end else begin
    edPunkt.Enabled:=false;
    lbPunkt.Enabled:=false;
    edUL.Enabled:=false;
    lbUL.Enabled:=false;
  end;
end;
//-------------------------------------------------------------------
procedure TfmGurnalAdres.TBSubmenuPunktsClick(Sender: TObject);
begin
  inherited;
  CheckEnabledPunkts;
end;

procedure TfmGurnalAdres.TBItemClearPunktsClick(Sender: TObject);
begin          
  inherited;
  CheckEnabledPunkts;
end;

initialization
  fmGurnalAdres := nil;
end.
