unit fZapisAkt;

interface

{$I Task.inc}
                                                  
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls;

type
  TfmZapisAkt = class(TfmSimpleD)
    pn: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edNomer: TDBEditEh;
    edDateZ: TDBDateTimeEditEh;
    pc: TPageControl;
    ts1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbDateR: TLabel;
    Label21: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    edDateR: TDBDateTimeEditEh;
    edGRAG: TDBLookupComboboxEh;
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
    DokumentRUKOV_B: TStringField;
    DokumentSPEC: TStringField;
    DokumentVOSSTAN: TBooleanField;
    DokumentZAVIT: TMemoField;
    DokumentSUD_NAME: TMemoField;
    DokumentSUD_DATE: TDateField;
    DokumentID_ZAGS: TIntegerField;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    dsGragd: TDataSource;
    DokumentCOPIA: TBooleanField;
    DokumentMAT_SCHET: TSmallintField;
    DokumentMAT_DATER: TDateField;
    DokumentVUS: TBooleanField;
    DokumentRESH_SUDA: TBooleanField;
    DokumentSPRAV_NOMER: TStringField;
    DokumentVb: TBooleanField;
    DokumentLICH_NOMER: TStringField;
    DokumentARX_ADRESAT: TMemoField;
    DokumentARX_NOMER: TStringField;
    DokumentARX_DATE: TDateField;
    DokumentARX_TEXT: TMemoField;
    edRG_OBL: TDBLookupComboboxEh;
    edRG_RAION: TDBLookupComboboxEh;
    edGT_OBL: TDBLookupComboboxEh;
    edGT_RAION: TDBLookupComboboxEh;
    edGT_RNGOROD: TDBLookupComboboxEh;
    DokumentGT_B_RN: TBooleanField;
    DokumentGT_RNGOROD: TStringField;
    DokumentONLYGOD: TSmallintField;
    DokumentONLYGOD_R: TSmallintField;
    DokumentVOZR: TSmallintField;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    ImageGISUN: TImage;
    DokumentSM_B_GOROD: TSmallintField;
    DokumentRG_B_GOROD: TSmallintField;
    DokumentGT_B_GOROD: TSmallintField;
    edRG_B_GOROD: TDBLookupComboboxEh;
    edGT_B_GOROD: TDBLookupComboboxEh;
    DokumentVOENKOM: TIntegerField;
    DokumentPOLE_GRN: TIntegerField;
    DokumentTYPEMESSAGE: TStringField;
    DokumentTYPEREG: TSmallintField;
    DokumentSTATUS: TStringField;
    DokumentDOK_TYPE: TSmallintField;
    DokumentDOK_SERIA: TStringField;
    DokumentDOK_NOMER: TStringField;
    DokumentDOK_DATE: TDateField;
    DokumentDOK_ORGAN: TIntegerField;
    DokumentDOK_NAME: TMemoField;
    DokumentMESTO: TMemoField;
    cbBelorus: TDBCheckBoxEh;
    DokumentSPEC_B: TStringField;
    DokumentDOK_KOD: TSmallintField;
    ApplicationEvents1: TApplicationEvents;
    lbSOATO: TvchDBText;
    Label47: TLabel;
    edAdresat: TDBEditEh;
    Label50: TLabel;
    edAddTextArx: TDBEditEh;
    Label59: TLabel;
    edIzmen: TDBEditEh;
    Label41: TLabel;
    edRukov: TDBEditEh;
    procedure edFamiliaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edFamiliaEnter(Sender: TObject);
    procedure edNameEnter(Sender: TObject);
    procedure edOtchEnter(Sender: TObject);
    procedure edFamiliaCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure edRukovEnter(Sender: TObject);
    procedure Label45Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure cbOnlyGodChange(Sender: TObject);
    procedure cbOnlyGodRChange(Sender: TObject);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edDateSUpdateData(Sender: TObject; var Handled: Boolean);
  private
//    H : THintWindow;
    procedure OnDestroyHint( Sender : TObject);
    procedure SetIDZags;
  public
    { Public declarations }
    function CreateSubMenuRun: Boolean; override;
    procedure WriteSoato(fld:TField);
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
    procedure CheckOnlyGod;
    procedure CheckOnlyGodR;
    procedure CheckRnGorod;

  end;

var
  fmZapisAkt: TfmZapisAkt;

implementation

uses dBase, fMain, fChoiceNasel, fShablon, fEnterDokument, uProject;

{$R *.DFM}


{ TfmZapisAkt }

constructor TfmZapisAkt.Create(Owner: TComponent);
begin
  inherited;
  FDokZAGS := true;
  FTypeObj := dmBase.TypeObj_ZSmert;
  SetLength(FArrChoiceRekv,7);
  FArrChoiceRekv[0].nType:=0;
  FArrChoiceRekv[0].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[0].FieldName:='WORK_NAME';
  FArrChoiceRekv[1].nType:=SHABLON_SP_SM;
  FArrChoiceRekv[1].FieldName:='DOKUMENT';
  FArrChoiceRekv[2].nType:=SHABLON_DOKUMENT;
  FArrChoiceRekv[2].FieldName:='SDAN_DOK';

  FArrChoiceRekv[3].nType:=0;
  FArrChoiceRekv[3].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[3].FieldName:='GT_GOROD_R';

  FArrChoiceRekv[4].nType:=SHABLON_NATION;
  FArrChoiceRekv[4].FieldName:='ZAMETKA';

  FArrChoiceRekv[5].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[5].FieldName:='IZMEN';

  FArrChoiceRekv[6].nType:=SHABLON_ZAJAVIT;
  FArrChoiceRekv[6].FieldName:='DECL';

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisSmert;
  dsGragd.DataSet := dmBase.SprGragd;
//  edFamilia.EditButtons[0].Glyph := edDecl.EditButtons[0].Glyph;
  pc.ActivePageIndex:=0;
  FPageControl := pc;

  edFamilia.OnExit := OnDestroyHint;
  edName.OnExit    := OnDestroyHint;
  edOtch.OnExit    := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;

//  fmMain.SetCurrentDokument(Dokument);

//  edFamilia.EditButtons.Items[0].Visible:=false;

//  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
//    cbOnlyGodR.ClientWidth := GetTextWidth(cbOnlyGodR.Items[2],cbOnlyGodR.Font.Height,cbOnlyGodR.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE); //+5;
//    cbOnlyGodR.Left  := lbDateR.Left+lbDateR.Width+5;
//    edDateR.Left := cbOnlyGodR.Left+cbOnlyGodR.Width+5;
//  end else begin
//    cbOnlyGodR.Visible:=false;
//  end;

  edFamilia.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateData;
  edOtch.OnUpdateData:=FIOUpdateData;
  edRG_GOROD.OnUpdateData:=CityUpdate;
  edGT_GOROD.OnUpdateData:=CityUpdate;

  SetLength(FArrAddProperty,2);
  SetAddProperty(0, 'OTHER', '', ftMemo);
  SetAddProperty(1, 'IZMEN', '', ftMemo);
  cbBel := cbBelorus;

  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;
  SetLength(FArrCheckBelField,3);
  WriteToArrCheck(0,  1, false, 'SM_OBL'      , 'SM_OBL_B');
  WriteToArrCheck(1,  2, false, 'SM_RAION'    , 'SM_RAION_B');
  WriteToArrCheck(2,  3, false, 'SM_GOROD'    , 'SM_GOROD_B');

  SetLength(FArrCheckField,5);
  WriteToArrCheck(0,  1, false, 'GT_OBL'    );
  WriteToArrCheck(1,  2, false, 'GT_RAION'  );
  WriteToArrCheck(2,  1, false, 'RG_OBL'    );
  WriteToArrCheck(3,  2, false, 'RG_RAION'  );
  WriteToArrCheck(4,  3, false, 'GT_RNGOROD');

  //SetPanelPovtor(tsPovtor, cbPovtor, Label41, Label42);
  TBSubmenuGISUN.Visible:=false;
  ImageGISUN.Visible := false;
end;

destructor TfmZapisAkt.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZapisAkt.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmZapisAkt.GetVid: String;
begin
  Result := 'ZSmert';
end;

function TfmZapisAkt.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  DokumentRESH_SUDA.AsBoolean:=false;

  DokumentRG_B_RESP.AsBoolean:=true;
  DokumentRG_B_OBL.AsBoolean:=true;
  DokumentGT_B_RESP.AsBoolean:=true;
  DokumentGT_B_OBL.AsBoolean:=true;
  DokumentONLYGOD_R.AsInteger:=0;

  DokumentRG_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentGT_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');

  DokumentPROV.AsBoolean := false;
  cbBelorus.Checked:=false;
  if lAppend then begin
    CheckRnGorod;
  end;
  inherited NewDok(lAppend);

  QueryExit:=false;
  Result := true;
end;

function TfmZapisAkt.ReadDok(nID: Integer): Boolean;
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
  SetIDZags;

  ReadDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));

  DokumentCOPIA.AsBoolean:=false;
  if DokumentPOVTOR.IsNull    then DokumentPOVTOR.AsBoolean:=false;
  if DokumentVUS.IsNull       then DokumentVUS.AsBoolean:=false;
  if DokumentVB.IsNull        then DokumentVB.AsBoolean:=false;
  if DokumentRESH_SUDA.IsNull then DokumentRESH_SUDA.AsBoolean:=false;
  if DokumentONLYGOD.IsNull   then DokumentONLYGOD.AsInteger:=0;
  if DokumentONLYGOD_R.IsNull then DokumentONLYGOD_R.AsInteger:=0;

  DokumentGT_RNGOROD.AsString  := '';
  if DokumentGT_B_RN.IsNull then DokumentGT_B_RN.AsBoolean:=true;
  if not DokumentGT_B_RN.AsBoolean then begin
    DokumentGT_RNGOROD.AsString := DokumentGT_RAION.AsString;
    DokumentGT_RAION.AsString   := '';
  end;

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  CheckRnGorod;

  Dokument.Post;
  ReadHistory(nID, dmBase.TypeObj_ZSmert);

end;

//------------------------------------------------------------------------
procedure TfmZapisAkt.WriteSoato(fld:TField);
var
  SOATO:TSOATO;
begin
  SOATO:=dmBase.GetSoatoAkt(Dokument,
        'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD',true,FLenSoato);
  if (SOATO.Kod='9000000') and (DokumentGT_GOSUD.IsNull or (DokumentGT_GOSUD.AsInteger=MY_GRAG)) then begin
    SOATO:=dmBase.GetSoatoAkt(Dokument,
          'SM_GOSUD,FName;SM_OBL;SM_RAION;SM_GOROD,SM_B_GOROD',true,FLenSoato);

  end;
  fld.AsString:=SOATO.Kod;
end;
//------------------------------------------------------------------------
function TfmZapisAkt.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr : String;
  vKeyValues : Variant;
  dLastSost : TDateTime;
  nIdFirst : Integer;
  strLich : String;
  lCloseLic : Boolean;
  SOATO:TSOATO;
begin
{
var
  st:TStringStream;
begin
  st:=TStringStream.Create('');
  tb.SaveToStream(st);
  Memo1.Text:=st.DataString;
  st.Free;
end;
}
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
//    strErr := ' Заполните дату смерти. ';
  end else if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then begin
    strErr := ' Заполните Фамилия, Имя. ';
  end;

  if (strErr='') and not DokumentDateR.IsNull and not DokumentDateS.IsNull then begin
    try
      i:=GetCountYear( DokumentDateS.AsDateTime, DokumentDateR.AsDateTime);
    except
      i:=50;
    end;
    if (i<0) or (i>150) then begin
      strErr := ' Ошибка в возрасте: '+IntToStr(i);
    end;
  end;
//  if strErr=''
//    then strErr := CheckSvid(dmBase.TypeObj_ZSmert, 'DATESV','SVID_SERIA','SVID_NOMER', strBookMark);
  if strErr<>'' then begin
    PutError(strErr);
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
    if DokumentONLYGOD.IsNull   then DokumentONLYGOD.AsInteger:=0;
    if DokumentONLYGOD_R.IsNull then DokumentONLYGOD_R.AsInteger:=0;
    Dokument.Post;
//    AddEditSvid(strBookMark);
    dmBase.tbZapisSmert.Edit;
    for i:=1 to dmBase.tbZapisSmert.FieldCount-1 do begin
      strField := dmBase.tbZapisSmert.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.tbZapisSmert.Fields[i].Value := fld.Value;
      end;
    end;
    //----- запишем возраст ----------
    if not DokumentDateR.IsNull and not DokumentDateS.IsNull then begin
      try
        dmBase.tbZapisSmert.FieldByName('VOZR').AsInteger:=GetCountYear( DokumentDateS.AsDateTime, DokumentDateR.AsDateTime);
      except
        dmBase.tbZapisSmert.FieldByName('VOZR').AsString:='';
      end;
    end else begin
      // может возраст ввели вручную
      dmBase.tbZapisSmert.FieldByName('VOZR').AsString:=DokumentVOZR.AsString;
    end;
    //--------------------------------
    if DokumentGT_RNGOROD.AsString<>'' then begin
      dmBase.tbZapisSmert.FieldByName('GT_B_RN').AsBoolean := false;
      dmBase.tbZapisSmert.FieldByName('GT_RAION').AsString := DokumentGT_RNGOROD.AsString;
    end else begin
      dmBase.tbZapisSmert.FieldByName('GT_B_RN').AsBoolean := true;
    end;

    if not FPrintSpecSvid or (Trim(GlobalTask.ParamAsString('СПЕЦ_ЗАГС_Б'))='')
      then dmBase.tbZapisSmert.FieldByName('SPEC_B').AsString:='';

    WriteSoato(dmBase.tbZapisSmert.FieldByName('SOATO'));

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
          //-------- умер последний член хозяйства --------
          if dmBase.CountMens(dmBase.GetDateCurrentSost, dmBase.tbMens.FieldByName('LIC_ID').AsString)=0
            then lCloseLic := true
            else lCloseLic := false;
          //------------------------------------------------
          if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
            strLich := dmBase.tbLich.FieldByName('NOMER').AsString;
            if lCloseLic then begin
              dmBase.tbLich.Edit;
              dmBase.tbLich.FieldByName('CANDELETE').AsBoolean  := true;
              dmBase.tbLich.FieldByName('DATE_LIKV').AsDateTime := DokumentDateS.AsDateTime;
              dmBase.tbLich.Post;
              ShowMessage(' На лицевом счете <'+strLich+'> умер последний человек ! '#13'Лицевой счет ликвидирован.');
            end else begin
              nIdFirst := -1;
              if dmBase.tbLich.FieldByName('FIRST').AsString <> '' then begin
                nIdFirst := dmBase.tbLich.FieldByName('FIRST').AsInteger;
              end;
              if nIdFirst = DokumentMEN_ID.AsInteger then begin
                nIDFirst := dmBase.IDNewFirstMen( dmBase.GetDateCurrentSost, dmBase.tbMens.FieldByName('LIC_ID').AsString);
                if nIDFirst>0 then begin
                  dmBase.tbLich.Edit;
                  dmBase.tbLich.FieldByName('FIRST').AsInteger  := nIDFirst;
                  dmBase.tbLich.Post;
                  ShowMessage(' На лицевом счете <'+strLich+'> умер глава хозяйства ! '#13'Глава хозяйства изменен.');
                end else begin
                  ShowMessage(' На лицевом счете <'+strLich+'> умер глава хозяйства ! ');
                end;
              end;
            end;
          end;
        end;
      end;
    end;
    {$ENDIF}
    if Result then QueryExit:=false;
  end;
end;

procedure TfmZapisAkt.edFamiliaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  adr : TAdres;
  nID : Integer;
  old : TCursor;
  strName,s : String;
  Pasport : TPassport;
  Pol:TPol;
  lCheck:Boolean;
begin
  if ChoiceMen( edFamilia, Trim(edFAMILIA.Text), '', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      lCheck:=dbDisableControls(Dokument);
      try
      EditDataSet(Dokument);
      v := GetValueField(arrRec, 'ID');
      DokumentMEN_ID.AsInteger := v;

      // место рождения
      if dmBase.tbMensAdd.Locate('ID',v,[]) then begin
        WriteField( DokumentRG_B_RESP, dmBase.tbMensAdd.FieldByName('MR_B_RESP') );
        WriteField( DokumentRG_GOSUD, dmBase.tbMensAdd.FieldByName('MR_GOSUD') );
        WriteField( DokumentRG_B_OBL, dmBase.tbMensAdd.FieldByName('MR_B_OBL') );
        WriteField( DokumentRG_OBL, dmBase.tbMensAdd.FieldByName('MR_OBL') );
        WriteField( DokumentRG_RAION, dmBase.tbMensAdd.FieldByName('MR_RAION') );
        WriteField( DokumentRG_B_GOROD, dmBase.tbMensAdd.FieldByName('MR_B_GOROD') );
        WriteField( DokumentRG_GOROD, dmBase.tbMensAdd.FieldByName('MR_GOROD') );
      end;

      nID := DokumentMEN_ID.AsInteger;

      DokumentFAMILIA.AsString:=GetValueFieldEx(arrRec, 'FAMILIA','');
      DokumentNAME.AsString:=GetValueFieldEx(arrRec, 'NAME','');
      DokumentOTCH.AsString:=GetValueFieldEx(arrRec, 'OTCH','');
      Pol:=tpNone;
      DokumentName_B.AsString:=dmBase.CheckNameBel(Pol, DokumentName.Value);
      DokumentOtch_B.AsString:=dmBase.CheckOtchBel(Pol, DokumentOtch.AsString);
      DokumentFamilia_B.AsString:=dmBase.GetBelFamily(DokumentFamilia.AsString);

      v := GetValueField(arrRec, 'DATER');
      if v = null then DokumentDateR.AsString := ''
                  else DokumentDateR.Value    := v;
      v := GetValueField(arrRec, 'POL');
      if v = null then DokumentPOL.AsString := ''
                  else DokumentPOL.Value    := v;
      v := GetValueField(arrRec, 'NATION');
      if v = null then DokumentNATION.AsInteger:= 0
                  else DokumentNATION.Value    := v;
      DokumentGRAG.AsInteger := GetValueFieldEx(arrRec, 'CITIZEN',0);
      DokumentOBRAZ.AsInteger := GetValueFieldEx(arrRec, 'OBRAZ',0);
      DokumentVUS.AsBoolean := GetValueFieldEx(arrRec, 'VUS', false);
      DokumentSEM.AsInteger := GetValueFieldEx(arrRec, 'SEM',0);

      s := dmBase.GetWork(nID, arrRec);
      if s <> '' then s:=s+', ';
      DokumentWORK_NAME.AsString := s + dmBase.GetDolg(nID, arrRec);

      Pasport := dmBase.GetRecPasport(nID, arrRec);
      s := '';
      if Pasport.Nomer<> '' then begin
        s := s + Pasport.Udost+' ' + Pasport.Seria+' '+Pasport.Nomer
      end;
      if Pasport.Date<>0 then begin
        s := s+ ' выдан ' + FormatDateTime('dd.mm.yyyy',Pasport.Date)+' '+Pasport.Organ;
      end;
      if Pasport.Nomer <> '' then begin
        DokumentDOK_TYPE.AsInteger := Pasport.UdostKod;
        DokumentDOK_SERIA.AsString := Pasport.Seria;
        DokumentDOK_NOMER.AsString := Pasport.Nomer;
        DokumentDOK_NAME.AsString  := Pasport.Organ;
        DokumentDOK_DATE.AsDateTime:= Pasport.Date;
      end;
      DokumentSDAN_DOK.AsString   := s;
      DokumentLICH_NOMER.AsString := Pasport.LichNomer;
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      DokumentGT_GOROD.AsString := '';
      if adr.Punkt <> '' then DokumentGT_GOROD.AsString := adr.PunktN;
      if adr.PunktTK>0 then DokumentGT_B_GOROD.AsInteger:= adr.PunktTK;
      if adr.UlicaDom <> ''
         then DokumentGT_GOROD_R.AsString := adr.UlicaDom
         else DokumentGT_GOROD_R.AsString   := '';
      PostDataSet(Dokument);
      finally
        dbEnableControls(Dokument,lCheck);
        Screen.Cursor := old;
      end;
  end;
end;

procedure TfmZapisAkt.UpdateActions;
begin
  inherited;
end;

procedure TfmZapisAkt.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol : TPol;
  lCheck : Boolean;
  SOATO:TSoato;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    strField:=ANSIUpperCase(Field.FieldName);
    if strField = 'FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentMEN_ID.AsString:='';
      end;
    end else if strField = 'DECL' then begin
      if Field.AsString = '' then begin
        DokumentDECL_ID.AsString:='';
      end;
    end;
    FRun := true;
    if FCheckBelName then begin
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
      end else if (strField = 'GT_GOROD') or (strField = 'GT_RNGOROD') then begin
        WriteSoato(DokumentSOATO);
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

function TfmZapisAkt.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
  {$IFNDEF ZAGS}
  if Result then begin
    cbProvDvig.Checked := not DokumentPROV.AsBoolean;
  end;
  {$ENDIF}
end;

procedure TfmZapisAkt.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZapisAkt.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmZapisAkt.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZapisAkt.edFamiliaEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edFamilia,DokumentFamilia.AsString+' ');
end;

procedure TfmZapisAkt.edNameEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edName,DokumentName.AsString+' ');
end;

procedure TfmZapisAkt.edOtchEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edOtch,DokumentOtch.AsString+' ');
end;

procedure TfmZapisAkt.edFamiliaCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := cbBelorus.Checked;
end;

procedure TfmZapisAkt.edRukovEnter(Sender: TObject);
begin  if cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

procedure TfmZapisAkt.Label45Click(Sender: TObject);
//var
//  nYear,nMonth,nDay : Integer;
begin
//  Dokument.CheckBrowseMode;
//  SubDate(DokumentSPRAV_DATE.AsDateTime, DokumentMAT_DATER.AsDateTime,
//   nYear,nMonth,nDay);
//  Label45.Caption := IntToStr(nYear)+'   '+IntToStr(nMonth)+'    '+IntToStr(nDay);
end;

procedure TfmZapisAkt.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then
    cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
  if pc.ActivePageIndex=1 then begin
    if (DokumentNOMER.AsString<>'') and (DokumentSPRAV_NOMER.AsString='') then begin
//      Dokument.CheckBrowseMode;
//      Dokument.Edit;
//      DokumentSPRAV_NOMER.AsString := DokumentNOMER.AsString;
    end;
    if (DokumentDATEZ.AsString<>'') and (DokumentSPRAV_DATE.AsString='') then begin
      Dokument.CheckBrowseMode;
      Dokument.Edit;
      DokumentSPRAV_DATE.AsDateTime := DokumentDATEZ.AsDateTime;
    end;
  end;
end;

procedure TfmZapisAkt.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZapisAkt.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZapisAkt.CheckOnlyGod;
begin
end;

procedure TfmZapisAkt.CheckOnlyGodR;
begin
//  if cbOnlyGodR.ItemIndex=2 then begin          // год и месяц
//    edDATER.EditButton.Visible:=false;
//    edDATER.EditFormat:='MM.YYYY';
//  end else if cbOnlyGodR.ItemIndex=1 then begin // год
//    edDATER.EditButton.Visible:=false;
//    edDATER.EditFormat:='YYYY';
//  end else begin      // полная дата
//    edDATER.EditButton.Visible:=true;
//    edDATER.EditFormat:='DD.MM.YYYY';
//  end;
end;

procedure TfmZapisAkt.edGT_RNGORODNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZapisAkt.CheckRnGorod;
var
  nW,nL,nT, nW1 : Integer;
begin
  if EnabledRnGorod or
     (not DokumentGT_B_RN.IsNull and not DokumentGT_B_RN.AsBoolean) then begin
    nW  := edGT_GOROD_R.Width;
    nL  := edGT_RAION.Left;
    nT  := edGT_GOROD_R.Top;
    nW1 := edGT_RNGOROD.Width;
    edGT_RNGOROD.Left  := nL;
    edGT_RNGOROD.Top   := nT;
    edGT_GOROD_R.Width := nW - nW1 - 5;
    edGT_GOROD_R.Left  := nL + nW1 + 5;
    edGT_RNGOROD.Visible := true;
  end else begin
    edGT_RNGOROD.Visible := false;
  end;
end;

procedure TfmZapisAkt.cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZapisAkt.cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR;
end;

procedure TfmZapisAkt.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  Gisun.GetSmert(Self);
  Gisun.CheckSmert(Self);
  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisAkt.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  Gisun.RegisterSmert(Self);
  Gisun.CheckSmert(Self);
  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisAkt.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

procedure TfmZapisAkt.edDateSUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 2);
end;

function TfmZapisAkt.CreateSubMenuRun: Boolean;
//var
// it : TTbItem;
// sep : TTbSeparatorItem;
begin
  Result:=false;

//  it := TTbItem.Create(TBSubmenuRun);
//  it.Caption:='Аннулирование актовой записи';
//  it.OnClick:=Event_Annulir;
//  TBSubmenuRun.Add(it);
end;

end.
