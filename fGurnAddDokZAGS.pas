unit fGurnAddDokZAGS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, SasaIniFile,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uProject,
  TB2Item, TB2Dock, TB2Toolbar, dBase, Menus, ImgList, DBCtrlsEh, StdCtrls, MetaTask, OpisEdit, FuncPr,
  Mask, TB2ToolWindow, ComCtrls, ExtCtrls;

type
  TfmGurnAddDokZAGS = class(TfmGurnal)
    TBToolWindow1: TTBToolWindow;
    Label3: TLabel;
    edFamilia: TDBEditEh;
    Label4: TLabel;
    edTip: TDBComboBoxEh;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure edTipEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edTipChange(Sender: TObject);
    procedure edFamiliaChange(Sender: TObject);
    procedure edFamiliaEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure TBItemClrFltClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    TBItemOpenFull:TTbItem;
    procedure CheckPropertyGridColumns; override;
    procedure GridColumnsAdresat(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure GridColumnsGT_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsRG_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
    procedure QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure SetFilter;
    function getAdditiveWhere : String; override;
    function  getDefaultAddWhere: String; override;
    procedure SaveToIni; override;
    procedure LoadFromIni; override;
    procedure Event_OpenFull(Sender: TObject);

  end;

var
  fmGurnAddDokZAGS: TfmGurnAddDokZAGS;

implementation

{$R *.DFM}

{ TfmGurnAddDokZAGS }

constructor TfmGurnAddDokZAGS.Create(Owner: TComponent);
var
  Opis:TOpisEdit;
  i:Integer;
begin
  TypeEditObj := dmBase.TypeObj_ZAGS_AddDok;
  inherited;
  TBSubItemRun.Visible:=true;
  FInterObj:=true;
  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_ADDDOK_ZAGS');
  if Opis.Items.Count=0 then begin
    edTip.Visible:=false;
  end else begin
    for i:=0 to Opis.Items.Count-1 do begin
      edTip.Items.Add(Opis.Items[i]);
      edTip.KeyItems.Add(Opis.KeyList[i]);
    end;
  end;
end;

//---------------------------------------------------------------
procedure TfmGurnAddDokZAGS.LoadFromIni;
begin
  inherited LoadFromIni;
end;
//---------------------------------------------------------------
function TfmGurnAddDokZAGS.LoadQuery: Boolean;
var
  i : Integer;
  lOpenFull:Boolean;
  s:String;
  c : TColumnEh;
  ini : TSasaIniFile;
  itDop : TTbItem;
begin
  ini := GlobalTask.iniFile('LOCAL');
  i:=ini.ReadInteger(KodGurnal+'.Add','CURRENT',-1);
  FRun:=true;
  lOpenFull:=ini.ReadBool(KodGurnal+'.Add','OPEN_FULL',true);
  if not lOpenFull and (i>-1) and (i<edTip.Items.Count) then begin
    edTip.ItemIndex:=i;
    TBItemClrFlt.Enabled:=true;   // !!!
  end else begin
    edTip.ItemIndex:=-1;
    TBItemClrFlt.Enabled:=false;  // !!!
//    SetFilter;
  end;
  FRun:=false;

//  CreateAdditiveWhere(getAdditiveWhere);
  Result := inherited LoadQuery;

  itDop := TTbItem.Create(TBSubItemRun);
  itDop.Caption:='Открывать полный реестр';
  itDop.OnClick:=Event_OpenFull;
  TBSubItemRun.Add(itDop);
  TBItemOpenFull:=itDop;
  TBItemOpenFull.Checked:=lOpenFull;
  
  TBSubItemRun.Visible:=true;

  {
  try
    c := Grid.FieldColumns['GT_ADRES'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsGT_ADRES;
    end;
  except
  end;
  try
    c := Grid.FieldColumns['RG_ADRES'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsRG_ADRES;
    end;
  except
  end;
  }
end;
//-------------------------------------------------------
procedure TfmGurnAddDokZAGS.Event_OpenFull(Sender: TObject);
begin
  TBItemOpenFull.Checked:= not TBItemOpenFull.Checked;
end;
//-------------------------------------------------------
procedure TfmGurnAddDokZAGS.QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
end;
//-------------------------------------------------------
procedure TfmGurnAddDokZAGS.GridColumnsGT_ADRES(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := '';
//  if dmBase.tbDeclBrak.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
//    Params.Text := dmBase.GetAdresAkt3(dmBase.tbDeclBrak,
//    'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',1);
//  end;
end;

procedure TfmGurnAddDokZAGS.GridColumnsRG_ADRES(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := '';
//  if dmBase.tbDeclBrak.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
//    Params.Text := dmBase.GetAdresAkt3(dmBase.tbDeclBrak,
//    'RG_GOSUD,FName;RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;RG_GOROD_R',1);
//  end;
end;

procedure TfmGurnAddDokZAGS.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
begin
  if Query.FieldByName('LANG').AsInteger=1 then begin
    Background:=clInfoBk;
  end;
end;              

procedure TfmGurnAddDokZAGS.CheckPropertyGridColumns;
var
  c : TColumnEh;
begin
  try
    c := Grid.FieldColumns['ADRESAT'];
    if c<>nil then c.OnGetCellParams := GridColumnsAdresat;
  except
  end;
  inherited;
end;

//--------------------------------------------------------------------
procedure TfmGurnAddDokZAGS.SetFilter;
var
  s, strFilter : String;
  nLen,n : Integer;
begin

  if (edTip.ItemIndex = -1) and (edFamilia.Text = '')  then begin
    Query.Filtered := false;
  end else begin
    strFilter := '';

    if (edTip.ItemIndex > -1) then begin
      s:='typedok='+edTip.KeyItems[edTip.ItemIndex];
      if strFilter=''
        then strFilter := s
        else strFilter := strFilter + ' and ' + s;
    end;

    strFilter:=AddFilter_FAMILIA_NAME(strFilter,edFamilia.Text);
 {
    if (Trim(edFamilia.Text) <> '') then begin
      s:=Trim(edFamilia.Text);
      nLen:=Length(s);
      n:=Pos(' ',s);
      if n>0 then begin
        s := 'FAMILIA='+QStr(Copy(s,1,n-1)+'*')+
                        'and NAME='+QStr(Copy(s,n+1,20)+'*');
      end else begin
        s := 'FAMILIA='+QStr(s+'*');
      end;
      if strFilter=''
        then strFilter := s
        else strFilter := strFilter + ' and ' + s;
    end;
 }
    if strFilter='' then begin
      Query.Filtered := false
    end else begin
      Query.Filter   := strFilter;
      Query.Filtered := true;
    end;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnAddDokZAGS.edTipEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edTip.ItemIndex:=-1;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnAddDokZAGS.edTipChange(Sender: TObject);
begin
//  SetFilter;
  if not FRun then begin
    CreateAdditiveWhere(getAdditiveWhere);
    TBItemClrFlt.Enabled:=true;
    FullRefresh(true);
  end; 
end;      
//-----------------------------------------------------------------------------------------
function TfmGurnAddDokZAGS.getDefaultAddWhere: String;
begin
  Result:=getAdditiveWhere;
end;

//-----------------------------------------------------------------------------------------
function TfmGurnAddDokZAGS.getAdditiveWhere : String;
var
 s : String;
 procedure AddResult(ss:String);
 begin if Result='' then Result:=ss else Result:=Result+' and '+ss;  end;
begin
  if (edTip.ItemIndex>-1) and (edTip.Text<>'') then begin
    Result:='ad.typedok='+edTip.KeyItems[edTip.ItemIndex];
  end else begin
    Result:='';
  end;
  s:=getYearWhere;
  if s<>'' then AddResult(s);
{
  s:=Trim(edFamilia.Text);
  if s<>'' then begin
    s:='substring(ad.familia,1,'+IntToStr(Length(s))+')='+QStr(s);
    if Result=''
      then Result:=s
      else Result:=Result +' and '+s;
  end;
}
end;

procedure TfmGurnAddDokZAGS.edFamiliaChange(Sender: TObject);
var
  strFilter:String;
  n:Integer;
begin
//  SetFilter;
  strFilter:=Trim(edFamilia.Text);
  if strFilter<>'' then begin
    n:=Pos(' ',strFilter);
    if n>0 then begin
      Query.Filter := 'FAMILIA='+QStr(Copy(strFilter,1,n-1)+'*')+
                      'and NAME='+QStr(Copy(strFilter,n+1,20)+'*');
    end else begin
      Query.Filter := 'FAMILIA='+QStr(strFilter+'*');
    end;
    Query.Filtered := true;
  end else begin
    Query.Filtered := false;
    Query.Filter := '';
  end;
end;

procedure TfmGurnAddDokZAGS.edFamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edFamilia.Text:='';
end;

procedure TfmGurnAddDokZAGS.GridColumnsAdresat(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=StringReplace(Params.Text,'#',' ',[rfReplaceAll]);
  Params.Text:=StringReplace(Params.Text,chr(13),' ',[rfReplaceAll]);
end;

procedure TfmGurnAddDokZAGS.SaveToIni;
var
  ini : TSasaIniFile;
begin
  inherited SaveToIni;
  ini := GlobalTask.iniFile('LOCAL');
  ini.WriteInteger(KodGurnal+'.Add','CURRENT',edTip.ItemIndex);
  ini.WriteBool(KodGurnal+'.Add','OPEN_FULL',TBItemOpenFull.Checked);
end;

procedure TfmGurnAddDokZAGS.TBItemClrFltClick(Sender: TObject);
begin
  edFamilia.Text:='';
  edTip.ItemIndex:=-1;
  inherited;
end;

end.
