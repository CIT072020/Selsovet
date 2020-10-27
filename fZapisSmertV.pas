unit fZapisSmertV;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uTypes,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  DBGridEh, Buttons, ImgList, vchDBCtrls, kbmMemCSVStreamFormat, ZipForge;

type
  TfmZapisSmertV = class(TfmSimpleD)
    pn: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edNomer: TDBEditEh;
    edDateZ: TDBDateTimeEditEh;
    N_F_1: TDBCheckBoxEh;
    Label40: TLabel;
    Label55: TLabel;
    edSvid_Nomer: TDBEditEh;
    pc: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label6: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    edDateR: TDBDateTimeEditEh;
    edPol: TDBComboBoxEh;
    edNATION: TDBLookupComboboxEh;
    edGRAG: TDBLookupComboboxEh;
    edDateS: TDBDateTimeEditEh;
    gbSmert: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edSM_B_RESP: TDBCheckBoxEh;
    edSM_GOSUD: TDBLookupComboboxEh;
    edSM_GOROD: TDBEditEh;
    gbRogd: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edRG_B_RESP: TDBCheckBoxEh;
    edRG_GOSUD: TDBLookupComboboxEh;
    edRG_B_OBL: TDBCheckBoxEh;
    edRG_GOROD: TDBEditEh;
    gbGit: TGroupBox;
    Label15: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label53: TLabel;
    edGT_B_RESP: TDBCheckBoxEh;
    edGT_GOSUD: TDBLookupComboboxEh;
    edGT_B_OBL: TDBCheckBoxEh;
    edGT_GOROD: TDBEditEh;
    edGT_GOROD_R: TDBEditEh;
    Label19: TLabel;
    edRukov: TDBEditEh;
    gbPrichin: TGroupBox;
    Label28: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edPrNep: TDBEditEh;
    edPrOsn: TDBEditEh;
    edPrMesto: TDBEditEh;
    edPrNep_Name: TDBEditEh;
    edPrOsn_Name: TDBEditEh;
    edPrMesto_Name: TDBEditEh;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    edDecl: TDBEditEh;
    edZametka: TDBEditEh;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentSVID_SERIA: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentMEN_ID: TIntegerField;
    DokumentLICH_ID: TIntegerField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentPOL: TStringField;
    DokumentNATION: TIntegerField;
    DokumentGRAG: TIntegerField;
    DokumentCHERN: TSmallintField;
    DokumentDateS: TDateField;
    DokumentSMERT_POSL: TIntegerField;
    DokumentSM_GOSUD: TIntegerField;
    DokumentSM_OBL: TStringField;
    DokumentSM_RAION: TStringField;
    DokumentSM_GOROD: TStringField;
    DokumentPR_NEP: TStringField;
    DokumentPR_OSN: TStringField;
    DokumentPR_MEST: TStringField;
    DokumentPR_NEP_NAME: TMemoField;
    DokumentPR_OSN_NAME: TMemoField;
    DokumentPR_MEST_NAME: TMemoField;
    DokumentDOKUMENT: TMemoField;
    DokumentDateR: TDateField;
    DokumentRG_GOSUD: TIntegerField;
    DokumentRG_OBL: TStringField;
    DokumentRG_RAION: TStringField;
    DokumentRG_GOROD: TStringField;
    DokumentGT_GOSUD: TIntegerField;
    DokumentGT_OBL: TStringField;
    DokumentGT_RAION: TStringField;
    DokumentGT_GOROD: TStringField;
    DokumentGT_GOROD_R: TStringField;
    DokumentSEM: TIntegerField;
    DokumentWORK_NAME: TStringField;
    DokumentOBRAZ: TIntegerField;
    DokumentDECL_ID: TIntegerField;
    DokumentDECL: TStringField;
    DokumentSPRAV_NOMER: TIntegerField;
    DokumentSPRAV_DATE: TDateField;
    DokumentSDAN_DOK: TMemoField;
    DokumentSDAN_VB: TMemoField;
    DokumentZAMETKA: TMemoField;
    DokumentRUKOV: TStringField;
    DokumentSOATO: TStringField;
    DokumentSM_B_RESP: TBooleanField;
    DokumentSM_B_OBL: TBooleanField;
    DokumentRG_B_RESP: TBooleanField;
    DokumentRG_B_OBL: TBooleanField;
    DokumentGT_B_RESP: TBooleanField;
    DokumentGT_B_OBL: TBooleanField;
    DokumentGT_B_GOROD_R: TBooleanField;
    DokumentFirst_Ekz: TBooleanField;
    dsStran: TDataSource;
    dsNation: TDataSource;
    cbProvDvig: TDBCheckBoxEh;
    DokumentPROV: TBooleanField;
    DokumentPR_NEP_NAME_B: TMemoField;
    DokumentPR_OSN_NAME_B: TMemoField;
    DokumentPR_MEST_NAME_B: TMemoField;
    DokumentFamilia_B: TStringField;
    DokumentName_B: TStringField;
    DokumentOtch_B: TStringField;
    DokumentSM_OBL_B: TStringField;
    DokumentSM_RAION_B: TStringField;
    DokumentSM_GOROD_B: TStringField;
    DokumentDATESV: TDateField;
    edDateSV: TDBDateTimeEditEh;
    Label39: TLabel;
    DokumentRUKOV_B: TStringField;
    edSpec: TDBEditEh;
    DokumentSPEC: TStringField;
    DokumentVOSSTAN: TBooleanField;
    DokumentZAVIT: TMemoField;
    DokumentSUD_NAME: TMemoField;
    DokumentSUD_DATE: TDateField;
    Label16: TLabel;
    Label18: TLabel;
    edSUD_NAME: TDBEditEh;
    edSUD_DATE: TDBDateTimeEditEh;
    DokumentID_ZAGS: TIntegerField;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    edIzmen: TDBEditEh;
    Label59: TLabel;
    dsGragd: TDataSource;
    DokumentCOPIA: TBooleanField;
    N_F_edCopy: TDBCheckBoxEh;
    DokumentMAT_DATER: TDateField;
    DokumentMAT_SCHET: TSmallintField;
    gbMat: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    edMatDateR: TDBDateTimeEditEh;
    edMatSchet: TDBNumberEditEh;
    N_F_cbPovtor: TDBCheckBoxEh;
    DokumentVUS: TBooleanField;
    edSVID_SERIA: TDBLookupComboboxEh;
    tsPovtor: TTabSheet;
    edSM_OBL_B: TDBEditEh;
    edSM_RAION_B: TDBEditEh;
    DokumentSM_B_GOROD: TSmallintField;
    DokumentRG_B_GOROD: TSmallintField;
    DokumentGT_B_GOROD: TSmallintField;
    DokumentLICH_NOMER: TStringField;
    DokumentSTATUS: TStringField;
    DokumentPOLE_GRN: TSmallintField;
    DokumentTYPEMESSAGE: TStringField;
    DokumentTYPEREG: TSmallintField;
    DokumentMESTO: TMemoField;
    Label17: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    edSM_B_GOROD: TDBLookupComboboxEh;
    edRG_B_GOROD: TDBLookupComboboxEh;
    edGT_B_GOROD: TDBLookupComboboxEh;
    cbBelorus: TDBCheckBoxEh;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    ImageGISUN: TImage;
    DokumentSPEC_B: TStringField;
    edSM_OBL_R: TDBEditEh;
    edSM_RAION_R: TDBEditEh;
    edRG_OBL: TDBEditEh;
    edRG_RAION: TDBEditEh;
    edGT_OBL: TDBEditEh;
    edGT_RAION: TDBEditEh;
    DokumentARX_ADRESAT: TMemoField;
    Label24: TLabel;
    edSudSila: TDBDateTimeEditEh;
    DokumentSUD_SILA: TDateField;
    DBCheckBoxEh1: TDBCheckBoxEh;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    procedure edDeclEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edFamiliaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edPolChange(Sender: TObject);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure cbBelorusClick(Sender: TObject);
    procedure edFamiliaEnter(Sender: TObject);
    procedure edNameEnter(Sender: TObject);
    procedure edOtchEnter(Sender: TObject);
    procedure edFamiliaCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure edRukovEnter(Sender: TObject);
    procedure edSM_OBL_RNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure edSM_RAION_RNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure pcChange(Sender: TObject);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure edDateSUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSpecEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
//    H : THintWindow;
    procedure OnDestroyHint( Sender : TObject);
//    procedure SetIDZags;
  public
    { Public declarations }
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure UpdateActions; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    function BeforeEdit : Boolean; override;

    function SaveToIni : Boolean; override;
    procedure LoadFromIni; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    function CreateSubMenuRun: Boolean; override;

  end;

  function EditZapisSmertV( nID : Integer; slPar:TStringList) : Boolean;

var
  fmZapisSmertV: TfmZapisSmertV;

implementation

uses dBase, fMain;

{$R *.DFM}

function EditZapisSmertV( nID : Integer; slPar:TStringList) : Boolean;
begin
//  result := true;
  fmZapisSmertV := TfmZapisSmertV.Create(nil);
  fmZapisSmertV.AssignPar(slPar);

  try
    fmZapisSmertV.IsReadDokument:=true;
    if nID=-1 then begin
      fmZapisSmertV.NewDok(true);
      fmZapisSmertV.SetIDZags;
      fmZapisSmertV.CheckEnabledNameOrgan(true);
    end else begin
      fmZapisSmertV.ReadDok( nID );
      fmZapisSmertV.TBItemZAGS.Visible:=false;
      fmZapisSmertV.CheckEnabledNameOrgan(false);
    end;
    fmZapisSmertV.IsReadDokument:=false;
    {$IFDEF GISUN}
      fmZapisSmertV.CheckAkt_GISUN(0);
//      Gisun.CheckSmertV(fmZapisSmertV);
//      fmZapisSmertV.CheckImageGisun(fmZapisSmertV.DokumentPOLE_GRN,fmZapisSmertV.ImageGISUN);
      fmZapisSmertV.BeforeEditFormGISUN;
    {$ENDIF}
    result := fmZapisSmertV.EditModal;
  finally
    fmZapisSmertV.Free;
    fmZapisSmertV := nil;
  end;
end;

{ TfmZapisSmert }

constructor TfmZapisSmertV.Create(Owner: TComponent);
begin
  inherited;
  FCheckLookupField:=false;
  FDokZAGS := true;
  TypeObj := dmBase.TypeObj_ZSmert;
  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisSmert;
  dsGragd.DataSet := dmBase.SprGragd;
  edFamilia.EditButtons[0].Glyph := edDecl.EditButtons[0].Glyph;
  pc.ActivePageIndex:=0;
  FPageControl := pc;
  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';
  if GlobalTask.ParamAsBoolean('AUTO_SMERT') then begin
    cbProvDvig.Visible := true;
    cbProvDvig.Checked := true;
  end else begin
    cbProvDvig.Visible := false;
    cbProvDvig.Checked := false;
  end;
  edFamilia.OnExit := OnDestroyHint;
  edName.OnExit    := OnDestroyHint;
  edOtch.OnExit    := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;
//  fmMain.SetCurrentDokument(Dokument);
  {$IFDEF ZAGS}
    edFamilia.EditButtons.Items[0].Visible:=false;
    edDecl.EditButtons.Items[0].Visible:=false;
    cbProvDvig.Visible := false;
    cbProvDvig.Checked := false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
    N_F_edCopy.Visible := false;
    N_F_cbPovtor.Visible := false;
  {$ENDIF}
  edFamilia.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateData;
  edOtch.OnUpdateData:=FIOUpdateData;
  edSM_GOROD.OnUpdateData:=CityUpdate;
  edRG_GOROD.OnUpdateData:=CityUpdate;
  edGT_GOROD.OnUpdateData:=CityUpdate;

  ENG_edIdentif.OnUpdateData:=IN_UpdateData;

  SetLength(FArrAddProperty,2);
  SetAddProperty(0, 'OTHER', '', ftMemo);
  SetAddProperty(1, 'IZMEN', '', ftMemo);
  SetcbBel(cbBelorus);
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;
  SetLength(FArrCheckBelField,3);
  WriteToArrCheck(0,  1, false, 'SM_OBL'      , 'SM_OBL_B');
  WriteToArrCheck(1,  2, false, 'SM_RAION'    , 'SM_RAION_B');
  WriteToArrCheck(2,  3, false, 'SM_GOROD'    , 'SM_GOROD_B');

  SetLength(FArrCheckField,4);
  WriteToArrCheck(0,  1, false, 'GT_OBL'    );
  WriteToArrCheck(1,  2, false, 'GT_RAION'  );
  WriteToArrCheck(2,  1, false, 'RG_OBL'    );
  WriteToArrCheck(3,  2, false, 'RG_RAION'  );

  AddButton_LoadIdentif(ENG_edIDENTIF);

  SetLength(FArrChoiceRekv,3);

  FArrChoiceRekv[0].nType:=0;
  FArrChoiceRekv[0].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[0].FieldName:='GT_GOROD_R';

  FArrChoiceRekv[1].nType:=0;
  FArrChoiceRekv[1].nTypeSpr:=_SHABLON_MKB10;
  FArrChoiceRekv[1].FieldName:='PR_OSN';

  FArrChoiceRekv[2].nType:=0;
  FArrChoiceRekv[2].nTypeSpr:=_SHABLON_MKB10;
  FArrChoiceRekv[2].FieldName:='PR_NEP';


  SetPanelPovtor(tsPovtor, N_F_cbPovtor, nil, nil);

  edSM_OBL_B.Left  := edSM_OBL_R.Left;
  edSM_OBL_B.Width := edSM_OBL_R.Width;
  edSM_OBL_B.Visible := false;
  edSM_RAION_B.Left  := edSM_RAION_R.Left;
  edSM_RAION_B.Width := edSM_RAION_R.Width;
  edSM_RAION_B.Visible := false;

  //-------- доступен код причины смерти ---------------------------------------
  edPrNep.Enabled   := true; //GlobalTask.ParamAsBoolean('SMERT_KOD');
  edPrOsn.Enabled   := edPrOsn_Name.Enabled; // and GlobalTask.ParamAsBoolean('SMERT_KOD');
//  edPrMesto.Enabled := edPrMesto_Name.Enabled and GlobalTask.ParamAsBoolean('SMERT_KOD');

  //-------- доступна непосредств. причина ---------------------------------------
  if GlobalTask.ParamAsBoolean('SMERT_NEP_PR') then begin
    edPrNep_Name.Enabled:=true;
  end else begin
    edPrNep_Name.Enabled:=false;
    edPrNep.Enabled:=false;
  end;
  {
  //-------- доступно место и обстоятельство ---------------------------------------
  if GlobalTask.ParamAsBoolean('SMERT_MESTO') then begin
    edPrMesto_Name.Enabled:=true;
  end else begin
    edPrMesto_Name.Enabled:=false;
    edPrMesto.Enabled:=false;
  end;
  }

  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;

  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := IsActiveGISUN;
    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN('1');
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
end;

destructor TfmZapisSmertV.Destroy;
begin
  DestroyHint(H);
  inherited;
end;
{
procedure TfmZapisSmertV.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
function TfmZapisSmertV.GetVid: String;
begin
  Result := 'ZSmert';
end;

function TfmZapisSmertV.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  DokumentSM_B_RESP.AsBoolean:=false;
  DokumentSM_B_OBL.AsBoolean:=true;
  DokumentRG_B_RESP.AsBoolean:=false;
  DokumentRG_B_OBL.AsBoolean:=true;
  DokumentGT_B_RESP.AsBoolean:=false;
  DokumentGT_B_OBL.AsBoolean:=true;

  DokumentSM_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentRG_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentGT_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');

  DokumentFirst_Ekz.AsBoolean:=true;
  DokumentPROV.AsBoolean := false;
  DokumentVOSSTAN.AsBoolean := true;
  cbBelorus.Checked:=false;
  inherited NewDok(lAppend);
  QueryExit:=false;
  Result := true;
end;

function TfmZapisSmertV.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
begin
  Result := true;
  if not dmBase.tbZapisSmert.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbZapisSmert.FieldCount-1 do begin
    strField := dmBase.tbZapisSmert.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.tbZapisSmert.Fields[i]);
    end;
  end;
  DokumentSM_B_RESP.AsBoolean:=false;  // после отправки в ГИС РН корректировались определенные реквизиты
  SetIDZags;

  ReadDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));
  DokumentCOPIA.AsBoolean:=false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;
  ReadHistory(nID, dmBase.TypeObj_ZSmert);

end;

function TfmZapisSmertV.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr : String;
begin
  AdditiveBeforeWriteDok;
  EditDataSet(Dokument);
  WriteOtherData(Dokument, 'OTHER', 'RUKOV_D;SPEC_D');
  PostDataSet(Dokument);
  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
  if DokumentDATEZ.IsNull then begin
    strErr := ' Заполните дату акта о смерти. ';
  end else if DokumentNOMER.AsString='' then begin
    strErr := ' Заполните номер акта о смерти. ';
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства о смерти. ';
  end else if DokumentDATES.AsString='' then begin
    strErr := ' Заполните дату смерти. ';
  end else if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then begin
    strErr := ' Заполните Фамилия, Имя. ';
  end;
  if (strErr='') then begin
     Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZSmert, DokumentID_ZAGS.AsInteger,
                    DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime, true);
     if not Result then exit;
  end;
  if strErr<>'' then begin
    PutError(strErr,self);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbZapisSmert.Append;
    dmBase.tbZapisSmert.Post;
    nID := dmBase.tbZapisSmert.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.tbZapisSmert.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    dmBase.tbZapisSmert.Edit;
    for i:=1 to dmBase.tbZapisSmert.FieldCount-1 do begin
      strField := dmBase.tbZapisSmert.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.tbZapisSmert.Fields[i].Value := fld.Value;
      end;
    end;

    if not FPrintSpecSvid
      then dmBase.tbZapisSmert.FieldByName('SPEC_B').AsString:='';

    WriteDateIzm;
    WriteForAllDok_BeforePost;

    dmBase.tbZapisSmert.Post;

    WriteDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger,
                   STOD('1899-12-30',tdAds));

    WriteHistory(nID, dmBase.TypeObj_ZSmert);

    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    AdditiveWriteDok;


//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);
    QueryExit:=false;
    Result := true;
    if FCheckBelName and FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentFamilia.AsString, DokumentFamilia_B.AsString);
      WriteForAll_Bel;
    end;
    {$IFNDEF ZAGS}
    {
    dLastSost := dmBase.LastDateSost;
    if cbProvDvig.Visible and cbProvDvig.Checked then begin
      if (DokumentMEN_ID.AsString<>'') and
         ((dLastSost = dmBase.GetDateCurrentSost) or
          (DokumentDATEZ.AsDateTime >= dLastSost)) then begin
        EditDataSet(Dokument);
        DokumentPROV.AsBoolean := true;
        PostDataSet(Dokument);
        vKeyValues := VarArrayCreate( [0, 1], varOleStr );
        vKeyValues[0] := dmBase.GetDateCurrentSost;
        vKeyValues[1] := DokumentMEN_ID.AsInteger;
  //      vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, nIdChild);
        if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
          dmBase.tbMens.Edit;
          dmBase.tbMens.FieldByName('PRESENT').AsBoolean   := false;
          dmBase.tbMens.FieldByName('CANDELETE').AsBoolean := true;
          dmBase.tbMens.FieldByName('AKT_SMER_NOMER').AsString := DokumentNOMER.AsString;
          dmBase.tbMens.FieldByName('AKT_SMER_DATE').AsDateTime:= DokumentDATEZ.AsDateTime;
          dmBase.tbMens.FieldByName('DATES').AsDateTime := DokumentDATES.AsDateTime;
          dmBase.tbMens.Post;
          vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost,
                            dmBase.tbMens.FieldByName('LIC_ID').AsInteger);
          if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
            nIdFirst := -1;
            strLich := dmBase.tbLich.FieldByName('NOMER').AsString;
            if dmBase.tbLich.FieldByName('FIRST').AsString <> '' then begin
              nIdFirst := dmBase.tbLich.FieldByName('FIRST').AsInteger;
            end;
            if nIdFirst = DokumentMEN_ID.AsInteger then begin
              ShowMessage(' На лицевом счете <'+strLich+'> умер глава хозяйства ! ');
            end;
          end;
        end;
      end;
    end;
    }
    {$ENDIF}
    if Result then QueryExit:=false;
  end;
end;

procedure TfmZapisSmertV.edDeclEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
//      DokumentDECL_ID.AsInteger := v;
//      nID := DokumentDECL_ID.AsInteger;
//      v := GetValueField(arrRec, 'FAMILIA');
end;

procedure TfmZapisSmertV.edFamiliaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
//      DokumentMEN_ID.AsInteger := v;
//      nID := DokumentMEN_ID.AsInteger;
//      v := GetValueField(arrRec, 'FAMILIA');
end;

procedure TfmZapisSmertV.edPolChange(Sender: TObject);
begin
  if edPol.Value<>null then begin
    if edPol.Value='М' then begin
      edNATION.ListField:='NAME_M'
    end else if edPol.Value='Ж' then begin
      edNATION.ListField:='NAME_G'
    end else begin
    edNATION.ListField:='NAME'
    end;
  end else begin
    edNATION.ListField:='NAME'
  end;
end;

procedure TfmZapisSmertV.UpdateActions;
begin
  inherited;
  if DokumentMEN_ID.AsString='' then begin
    edFamilia.Font.Color := clBlack;
  end else begin
    edFamilia.Font.Color := clRed;
  end;
  if DokumentDECL_ID.AsString='' then begin
    edDecl.Font.Color := clBlack;
  end else begin
    edDecl.Font.Color := clRed;
  end;
  {$IFNDEF ZAGS}
  if cbProvDvig.Visible then begin
    if DokumentMEN_ID.AsString='' then begin
      cbProvDvig.Enabled := false;
    end else begin
      cbProvDvig.Enabled := true;
    end;
  end;
  {$ENDIF}
  {$IFDEF ZAGS}
    TBItemDolg.Enabled := N_F_edCopy.Checked;
  {$ENDIF}
end;

procedure TfmZapisSmertV.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol : TPol;
  lCheck : Boolean;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    if ANSIUpperCase(Field.FieldName) = 'FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentMEN_ID.AsString:='';
      end;
    end else if ANSIUpperCase(Field.FieldName) = 'DECL' then begin
      if Field.AsString = '' then begin
        DokumentDECL_ID.AsString:='';
      end;
    end;
    FRun := true;
    if FCheckBelName then begin
      strField := UpperCase(Field.FieldName);
      EditDataSet(Dokument);
      Pol := tpNone;
      lCheck := false;
      if strField='NAME' then begin
        if DokumentName_B.AsString='' then begin
          DokumentName_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
          lCheck := true;
        end;
      end else if strField='OTCH' then begin
        if DokumentOtch_B.AsString='' then begin
          DokumentOtch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
          lCheck := true;
        end;
      end else if strField='FAMILIA' then begin
        if DokumentFamilia_B.AsString='' then begin
          DokumentFamilia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;
      end;
      CheckForAll_Bel(Field);
      if lCheck and (Pol <> tpNone) then begin
        if Pol = tpM then begin
          DokumentPOL.AsString := 'М';
        end else begin
          DokumentPOL.AsString := 'Ж';
        end;
      end;
    end;
    FRun := false;
  end;
end;

function TfmZapisSmertV.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
  {$IFNDEF ZAGS}
  if Result then begin
    cbProvDvig.Checked := not DokumentPROV.AsBoolean;
  end;
  {$ENDIF}
// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edSM_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edRG_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edGT_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edSM_OBL_R,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edRG_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edGT_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edSM_RAION_R,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edRG_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edGT_RAION,n,2,true,false,false,FAddButtonMRUList);

end;

procedure TfmZapisSmertV.cbBelorusClick(Sender: TObject);
begin
  DestroyHint(H);
  if cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;
    edFamilia.EditButtons.Items[0].Visible:=false;
    edPrNep_Name.EditButtons.Items[0].Visible:=false;
    edPrOsn_Name.EditButtons.Items[0].Visible:=false;
    edPrMesto_Name.EditButtons.Items[0].Visible:=false;
    edFamilia.DataField := 'FAMILIA_B';
    edName.DataField    := 'NAME_B';
    edOtch.DataField    := 'OTCH_B';

    edSM_OBL_B.Visible := true;
    edSM_OBL_R.Visible := false;
    edSM_RAION_B.Visible := true;
    edSM_RAION_R.Visible := false;

    edSM_Gorod.DataField   := 'SM_GOROD_B';
    edSM_Gorod.MRUList.Active:=false;
    edRukov.DataField   := 'RUKOV_B';
    edSM_GOSUD.ListField   := 'NAME_B';
    edPrNep_Name.DataField := 'PR_NEP_NAME_B';
    edPrOsn_Name.DataField := 'PR_OSN_NAME_B';
    edPrMesto_Name.DataField := 'PR_MEST_NAME_B';
    edZAGS.DataField := 'NAME_ZAGS_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
  end else begin
    ActivateRUSKeyboard;
    {$IFNDEF ZAGS}
      edFamilia.EditButtons.Items[0].Visible:=true;
    {$ENDIF}
    edPrNep_Name.EditButtons.Items[0].Visible:=true;
    edPrOsn_Name.EditButtons.Items[0].Visible:=true;
    edPrMesto_Name.EditButtons.Items[0].Visible:=true;
    edFamilia.DataField := 'FAMILIA';
    edName.DataField    := 'NAME';
    edOtch.DataField    := 'OTCH';

    edSM_OBL_B.Visible := false;
    edSM_OBL_R.Visible := true;
    edSM_RAION_B.Visible := false;
    edSM_RAION_R.Visible := true;

    edSM_Gorod.DataField   := 'SM_GOROD';
    edSM_Gorod.MRUList.Active:=true;
    edRukov.DataField   := 'RUKOV';
    edSM_GOSUD.ListField   := 'NAME';
    edPrNep_Name.DataField := 'PR_NEP_NAME';
    edPrOsn_Name.DataField := 'PR_OSN_NAME';
    edPrMesto_Name.DataField := 'PR_MEST_NAME';
    edZAGS.DataField := 'NAME_ZAGS';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
  end;
end;

procedure TfmZapisSmertV.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZapisSmertV.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmZapisSmertV.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZapisSmertV.edFamiliaEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edFamilia,DokumentFamilia.AsString+' ');
end;

procedure TfmZapisSmertV.edNameEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edName,DokumentName.AsString+' ');
end;

procedure TfmZapisSmertV.edOtchEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edOtch,DokumentOtch.AsString+' ');
end;

procedure TfmZapisSmertV.edFamiliaCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := cbBelorus.Checked;
end;

procedure TfmZapisSmertV.edRukovEnter(Sender: TObject);
begin  if cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

procedure TfmZapisSmertV.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  AddSvid;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisSmertV.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisSmertV.edSM_OBL_RNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisSmertV.edSM_RAION_RNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisSmertV.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then
    cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
end;

procedure TfmZapisSmertV.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetSmertV(Self);
//  Gisun.CheckSmertV(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisSmertV.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterSmertV(Self);
//  Gisun.CheckSmertV(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisSmertV.edDateSUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 2);
end;

procedure TfmZapisSmertV.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

procedure TfmZapisSmertV.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;

procedure TfmZapisSmertV.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

function TfmZapisSmertV.CreateSubMenuRun: Boolean;
begin
  inherited CreateSubmenuRun;
  Result:=true;
  AddSubmenu_ReadDolg;
end;

end.
