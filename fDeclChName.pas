unit fDeclChName;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,DateUtils,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,uSaveMemTable, uProject,uTypes, uProjectAll,
  ExtCtrls, OpisEdit, dbFunc, MetaTask, DBLookupEh, DBCtrlsEh, StdCtrls, fGetGISUN1, uPadegFIO,
  Mask, Grids, DBGridEh, FuncPr, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  Buttons, ImgList, kbmMemCSVStreamFormat, vchDBCtrls, ZipForge;

type
  TfmDeclChName = class(TfmSimpleD)
    TBItemChoiceMen: TTBItem;
    pc: TPageControl;
    tsTail1: TTabSheet;
    Label1: TLabel;                                      
    edFamiliaDo: TDBEditEh;
    edFamiliaPosle: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edNameDo: TDBEditEh;
    edOTCHDO: TDBEditEh;
    edNamePosle: TDBEditEh;
    edOtchPosle: TDBEditEh;
    edDATER: TDBDateTimeEditEh;
    Label13: TLabel;
    edNATION: TDBLookupComboboxEh;
    Label14: TLabel;
    Label22: TLabel;
    edGRAG: TDBLookupComboboxEh;
    tsTail2: TTabSheet;
    pnMain: TPanel;
    lbNomer: TLabel;
    edNomer: TDBEditEh;
    Label28: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label31: TLabel;
    edDOKUMENT: TDBEditEh;
    gbDeti: TGroupBox;
    GridDeti: TDBGridEh;
    dsDeti: TDataSource;
    tbDeti: TkbmMemTable;
    tbDetiFAMILIA: TStringField;
    tbDetiNAME: TStringField;
    tbDetiOTCH: TStringField;
    dsNation: TDataSource;
    dsStran: TDataSource;
    N_F_1: TDBCheckBoxEh;
    tbDetiZAGS_NAME: TStringField;
    tbDetiZAGS_NOMER: TStringField;
    tbDetiZAGS_DATE: TDateField;
    Label4: TLabel;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentSVID_SERIA: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentDATESV: TDateField;
    DokumentMEN_ID: TIntegerField;
    DokumentLICH_ID: TIntegerField;
    DokumentFamiliaDo: TStringField;
    DokumentNameDo: TStringField;
    DokumentOtchDo: TStringField;
    DokumentFamiliaPosle: TStringField;
    DokumentNamePosle: TStringField;
    DokumentOtchPosle: TStringField;
    DokumentFamiliaDo_B: TStringField;
    DokumentNameDo_B: TStringField;
    DokumentOtchDo_B: TStringField;
    DokumentFamiliaPosle_B: TStringField;
    DokumentNamePosle_B: TStringField;
    DokumentOtchPosle_B: TStringField;
    DokumentPOL: TStringField;
    DokumentDateR: TDateField;
    DokumentGOSUD: TIntegerField;
    DokumentOBL: TStringField;
    DokumentRAION: TStringField;
    DokumentGOROD: TStringField;
    DokumentNATION: TIntegerField;
    DokumentGRAG: TIntegerField;
    DokumentM_GOSUD: TIntegerField;
    DokumentM_OBL: TStringField;
    DokumentM_RAION: TStringField;
    DokumentM_GOROD: TStringField;
    DokumentM_GOROD_R: TStringField;
    DokumentM_B_RESP: TBooleanField;
    DokumentM_B_OBL: TBooleanField;
    DokumentV_OBAZAN: TBooleanField;
    DokumentDOKUMENT: TMemoField;
    DokumentDETI: TMemoField;
    DokumentSPEC: TStringField;
    DokumentVOSSTAN: TBooleanField;
    DokumentID_ZAGS: TIntegerField;
    DokumentID_SOURCE: TIntegerField;
    DokumentB_RESP: TBooleanField;
    DokumentB_OBL: TBooleanField;
    DokumentREG_ZAGS: TMemoField;
    DokumentREG_NOMER: TStringField;
    DokumentREG_DATE: TDateField;
    DokumentFirst_Ekz: TBooleanField;
    edPol: TDBComboBoxEh;
    DokumentOBL_B: TStringField;
    DokumentRAION_B: TStringField;
    DokumentGOROD_B: TStringField;
    DokumentV_WHO: TMemoField;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    Label42: TLabel;
    dsGragd: TDataSource;
    DokumentCOPIA: TBooleanField;
    TBItemArxSpr: TTBItem;
    ImageGISUN: TImage;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    DokumentB_GOROD: TSmallintField;
    DokumentM_B_GOROD: TSmallintField;
    DokumentSTATUS: TStringField;
    DokumentPOLE_GRN: TSmallintField;
    DokumentDOK_TYPE: TSmallintField;
    DokumentDOK_SERIA: TStringField;
    DokumentDOK_NOMER: TStringField;
    DokumentDOK_DATE: TDateField;
    DokumentDOK_ORGAN: TIntegerField;
    DokumentVOENKOM: TIntegerField;
    DokumentTYPEMESSAGE: TStringField;
    DokumentIDENTIF: TStringField;
    Label26: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    edDOK_TYPE: TDBComboBoxEh;
    edDOK_SERIA: TDBEditEh;
    edDOK_NOMER: TDBEditEh;
    Label69: TLabel;
    edDOK_DATE: TDBDateTimeEditEh;
    N_F_cbBelorus: TDBCheckBoxEh;
    tbZakl: TkbmMemTable;
    tbZaklID: TIntegerField;
    tbZaklNAME_ZAGS: TStringField;
    tbZaklNAME_ZAGS_B: TStringField;
    tbZaklID_ZAGS: TIntegerField;
    tbZaklDateIzm: TDateField;
    tbZaklPOVTOR: TBooleanField;
    tbZaklIS_GOROD: TBooleanField;
    tbZaklDATE_ANUL: TDateField;
    tbZaklNOMER: TIntegerField;
    tbZaklDATEZ: TDateField;
    tbZaklMEN_ID: TIntegerField;
    tbZaklLICH_ID: TIntegerField;
    tbZaklADRESAT: TMemoField;
    tbZaklFamilia: TStringField;
    tbZaklName: TStringField;
    tbZaklOtch: TStringField;
    tbZaklPOL: TStringField;
    tbZaklGRAG: TIntegerField;
    tbZaklDateR: TDateField;
    tbZaklRG_B_RESP: TBooleanField;
    tbZaklRG_GOSUD: TIntegerField;
    tbZaklRG_B_OBL: TBooleanField;
    tbZaklRG_OBL: TStringField;
    tbZaklRG_RAION: TStringField;
    tbZaklRG_B_GOROD: TSmallintField;
    tbZaklRG_GOROD: TStringField;
    tbZaklGT_B_RESP: TBooleanField;
    tbZaklGT_GOSUD: TIntegerField;
    tbZaklGT_B_OBL: TBooleanField;
    tbZaklGT_OBL: TStringField;
    tbZaklGT_RAION: TStringField;
    tbZaklGT_RNGOROD: TStringField;
    tbZaklGT_B_GOROD: TSmallintField;
    tbZaklGT_GOROD: TStringField;
    tbZaklGT_GOROD_R: TStringField;
    tbZaklRUKOV: TStringField;
    tbZaklDATE1: TDateField;
    tbZaklDATE2: TDateField;
    tbZaklWHO: TStringField;
    tbZaklPRICH: TStringField;
    tbZaklFamilia_Posle: TStringField;
    tbZaklName_Posle: TStringField;
    tbZaklOtch_Posle: TStringField;
    tbZaklR_NOMER: TStringField;
    tbZaklR_DATE: TDateField;
    tbZaklR_ZAGS: TMemoField;
    tbZaklR_RG_B_RESP: TBooleanField;
    tbZaklR_RG_GOSUD: TIntegerField;
    tbZaklR_RG_B_OBL: TBooleanField;
    tbZaklR_RG_OBL: TStringField;
    tbZaklR_RG_RAION: TStringField;
    tbZaklR_RG_B_GOROD: TSmallintField;
    tbZaklR_RG_GOROD: TStringField;
    tbZaklR_MAT: TStringField;
    tbZaklR_OTEC: TStringField;
    tbZaklWORK: TMemoField;
    tbZaklVUS: TMemoField;
    tbZaklSUPRUG: TStringField;
    tbZaklB_NOMER: TStringField;
    tbZaklB_DATE: TDateField;
    tbZaklB_ZAGS: TMemoField;
    tbZaklROVD: TStringField;
    tbZaklROVD_DATE: TDateField;
    tbZaklROVD_ZAKL: TMemoField;
    tbZaklSOOB: TMemoField;
    tbZaklIZMEN: TMemoField;
    tbZaklR_Familia: TStringField;
    tbZaklR_Name: TStringField;
    tbZaklR_OTCH: TStringField;
    tbZaklOTEC: TStringField;
    tbZaklMAT: TStringField;
    tbZaklIS_IZMEN: TBooleanField;
    tbZaklFIO_NEW: TStringField;
    tbZaklDeti: TkbmMemTable;
    tbZaklDetiFIO: TStringField;
    tbZaklDetiMESTO: TStringField;
    tbZaklDetiDATER: TDateField;
    tbZaklDetiMESTOREG: TStringField;
    tbZaklDetiNOMER: TStringField;
    tbZaklDetiDATEA: TDateField;
    TBItemZaklChName: TTBItem;
    DokumentRN_B_GOROD: TStringField;
    DokumentRN_M_B_GOROD: TStringField;
    DokumentPOSHLINA: TMemoField;
    DokumentSUM_POSHLINA: TFloatField;
    tbDetiGOD_ROG: TStringField;
    Panel1: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    tbDetiDATER: TDateField;
    DokumentDETI_DATER: TBooleanField;
    DokumentM_RNGOROD: TStringField;
    BLR_edOtchDo: TDBEditEh;
    BLR_edNameDo: TDBEditEh;
    BLR_edFamiliaDo: TDBEditEh;
    BLR_edFamiliaPosle: TDBEditEh;
    BLR_edNamePosle: TDBEditEh;
    BLR_edOtchPosle: TDBEditEh;
    Label9: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    edB_RESP: TDBCheckBoxEh;
    edGOSUD: TDBLookupComboboxEh;
    edB_OBL: TDBCheckBoxEh;
    edGOROD: TDBEditEh;
    BLR_edOBL: TDBEditEh;
    BLR_edRAION: TDBEditEh;
    edB_GOROD: TDBLookupComboboxEh;
    edRAION: TDBEditEh;
    edOBL: TDBEditEh;
    BLR_edGorod: TDBEditEh;
    BLR_edGosud: TDBLookupComboboxEh;
    BLR_edB_GOROD: TDBLookupComboboxEh;
    Label36: TLabel;
    SpeedButton: TSpeedButton;
    tbDetiMESTOR: TStringField;
    lbSpec: TvchDBText;
    edSpec: TDBEditEh;
    DokumentADD_DOK: TMemoField;
    DokumentWORK_PLACE: TStringField;
    DokumentADD_SUD: TStringField;
    DokumentPRICH: TStringField;
    DokumentNATION_DOK: TStringField;
    gbReg: TGroupBox;
    Label8: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edREG_ZAGS: TDBEditEh;
    edREG_DATE: TDBDateTimeEditEh;
    edREG_NOMER: TDBEditEh;
    Label18: TLabel;
    Label23: TLabel;
    edM_RNGOROD: TDBLookupComboboxEh;
    Label35: TLabel;
    Label20: TLabel;
    edM_B_RESP: TDBCheckBoxEh;
    edM_GOSUD: TDBLookupComboboxEh;
    edM_RAION: TDBEditEh;
    edM_GOROD_R: TDBEditEh;
    Label19: TLabel;
    Label21: TLabel;
    edM_B_OBL: TDBCheckBoxEh;
    edM_OBL: TDBEditEh;
    edM_B_GOROD: TDBLookupComboboxEh;
    edM_GOROD: TDBEditEh;
    Label24: TLabel;
    edPRICH: TDBEditEh;
    Label25: TLabel;
    Label27: TLabel;
    edWORK_PLACE: TDBEditEh;
    Label17: TLabel;
    N_F_cbVUS: TDBCheckBoxEh;
    edV_WHO: TDBEditEh;
    DokumentTYPE_BRAK: TIntegerField;
    DokumentB_DATE2: TDateField;
    DokumentB_ZAGS: TStringField;
    DokumentB_NOMER: TStringField;
    Panel5: TPanel;
    edTypeBrak: TDBComboBoxEh;
    pnZags: TPanel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edB_NOMER: TDBEditEh;
    edB_DATE: TDBDateTimeEditEh;
    edB_ZAGS: TDBEditEh;
    pnSud: TPanel;
    Label38: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label37: TLabel;
    edSud: TDBEditEh;
    edSudDateSila: TDBDateTimeEditEh;
    edSudDate: TDBDateTimeEditEh;
    edNationDok: TDBEditEh;
    edVoenkom: TDBLookupComboboxEh;
    DokumentADD_CHNAME: TStringField;
    edAddDok: TDBMemo;
    lbZapis1: TLabel;
    edZNomer: TDBEditEh;
    lbZapis2: TLabel;
    edZDate: TDBDateTimeEditEh;
    DokumentZ_NOMER: TIntegerField;
    DokumentZ_DATE: TDateField;
    DokumentKOD_PRICH: TIntegerField;
    DokumentB_DATE: TDateField;
    btChoiceChild: TBitBtn;
    tsAdd: TTabSheet;
    edMVD_DATE1: TDBDateTimeEditEh;
    Label44: TLabel;
    Label45: TLabel;
    edMVD_DATE2: TDBDateTimeEditEh;
    Label46: TLabel;
    edMU_DATE1: TDBDateTimeEditEh;
    Label47: TLabel;
    Label48: TLabel;
    edMU_DATE2: TDBDateTimeEditEh;
    Label49: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label50: TLabel;
    Bevel3: TBevel;
    Label51: TLabel;
    Bevel4: TBevel;
    edOtmetkaIsp: TDBEditEh;
    edPrim: TDBEditEh;
    DokumentMVD_DATE1: TDateField;
    DokumentMVD_DATE2: TDateField;
    DokumentMU_DATE1: TDateField;
    DokumentMU_DATE2: TDateField;
    DokumentOTMETKA_ISP: TStringField;
    DokumentPRIM: TStringField;
    Bevel5: TBevel;
    Label52: TLabel;
    Label53: TLabel;
    edDateZap: TDBDateTimeEditEh;
    Label54: TLabel;
    edDateOtv: TDBDateTimeEditEh;
    edSved: TDBEditEh;
    edOrg: TDBEditEh;
    Label55: TLabel;
    DokumentZAPROS_DATE: TDateField;
    DokumentOTVET_DATE: TDateField;
    DokumentSVED_ORG: TMemoField;
    DokumentORG: TMemoField;
    DokumentADD_SUD2: TStringField;
    N_F_cbSt21: TDBCheckBoxEh;
    lbFIO1: TLabel;
    edFIO1: TDBEditEh;
    lbFIO2: TLabel;
    edFIO2: TDBEditEh;
    lbFIO3: TLabel;
    edTypeFam: TDBComboBoxEh;
    DokumentST21: TBooleanField;
    DokumentTYPE_FAM: TSmallintField;
    DokumentFIO1: TStringField;
    DokumentFIO2: TStringField;
    DokumentFAM1: TStringField;
    DokumentFAM2: TStringField;
    pnAddSud: TPanel;
    lbAddSud2: TLabel;
    edAddSud2: TDBEditEh;
    lbAddSud: TLabel;
    edAddSud: TDBEditEh;
    lbAddChName: TLabel;
    edAddChName: TDBEditEh;
    pnFAM: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Label56: TLabel;
    edFAM1: TDBEditEh;
    edFAM2: TDBEditEh;
    TBSubmenuChoiceBrak: TTBSubmenuItem;
    TBItemChoiceBrakON: TTBItem;
    DokumentBRAK_ID: TIntegerField;
    btAktBrak: TBitBtn;
    lbBLR: TLabel;
    procedure FormResize(Sender: TObject);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edFamiliaPosleEnter(Sender: TObject);
    procedure edNamePosleEnter(Sender: TObject);
    procedure edOtchPosleEnter(Sender: TObject);
    procedure edFamiliaDoCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
    procedure edFamiliaDoEnter(Sender: TObject);
    procedure edNameDoEnter(Sender: TObject);
    procedure edOTCHDOEnter(Sender: TObject);
    procedure N_F_cbVUSClick(Sender: TObject);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edOBL_RNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edRaion_RNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure edDATERUpdateData(Sender: TObject; var Handled: Boolean);
    function EmptyIzm: String; override;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure GridDetiTitleBtnClick(Sender: TObject; ACol: Integer;    Column: TColumnEh);
    procedure edRukov_SvEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure TBItemGetDataGISUNClick(Sender: TObject);
    procedure SpeedButtonClick(Sender: TObject);
    procedure edSpecEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edTypeBrakChange(Sender: TObject);
    procedure edVoenkomEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edVoenkomEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure edVoenkomEditButtons2Click(Sender: TObject;      var Handled: Boolean);
    procedure edVoenkomChange(Sender: TObject);
    procedure GridDetiColEnter(Sender: TObject);
    procedure edPRICHEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edPRICHEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure btChoiceChildClick(Sender: TObject);
    procedure edDateZUpdateData(Sender: TObject; var Handled: Boolean);
    procedure N_F_cbSt21Click(Sender: TObject);
    procedure TBSubmenuChoiceBrakClick(Sender: TObject);
    procedure TBItemChoiceBrakONClick(Sender: TObject);
    procedure btAktBrakClick(Sender: TObject);
  private
    FRunSetTypeBrak:Boolean;
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    procedure CheckFont;
    function GetTypeBrak:Integer;
    procedure SetControlTypeBrak(nValue:Integer; lSt21:Boolean);
    procedure SetControlClick(lSet:Boolean);

    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    function BeforeEdit : Boolean; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    procedure UpdateActions; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure CheckDeti_Dater;
    function CheckFIO: String; override;
    procedure SetOnlyPovtorSvid(lOnlyPovtor: Boolean;  pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;  lbSvid, lbNomer: TLabel);
    procedure ChoiceBrak(lOna:Boolean);
    procedure PostDokument; override;

  end;

function EditDeclChName( nID : Integer; slPar:TStringList) : boolean;

var
  fmDeclChName: TfmDeclChName;

implementation

uses dBase, fMain, fShablon, fZapisBrak, uDataSet2XML, SelLibFR;

{$R *.DFM}
{$I Task.inc}

{ TfmDeclChName }

function EditDeclChName( nID : Integer; slPar:TStringList) : boolean;
begin
//  result := true;
  fmDeclChName := TfmDeclChName.Create(nil);
  fmDeclChName.IsCreateForm:=false;
  try
    fmDeclChName.IsReadDokument:=true;
    fmDeclChName.SetControlClick(true);
    if nID=-1 then begin
      fmDeclChName.NewDok(true);
      fmDeclChName.SetIDZags;
      fmDeclChName.CheckEnabledNameOrgan(true);
    end else begin
      fmDeclChName.ReadDok( nID );
      fmDeclChName.CheckEnabledNameOrgan(false);
    end;
    fmDeclChName.IsReadDokument:=false;
    fmDeclChName.SetControlTypeBrak( -99, false);
    {$IFDEF GISUN}
//      fmDeclChName.CheckAkt_GISUN(0);
//      Gisun.CheckChName(fmZapisChName);
//      fmZapisChName.CheckImageGisun(fmZapisChName.DokumentPOLE_GRN,fmZapisChName.ImageGISUN);
//      fmDeclChName.BeforeEditFormGISUN;
    {$ENDIF}
    fmDeclChName.TBItemZAGS.Visible:=false;
    fmDeclChName.TBSubmenuRun.Visible:=false;
    result := fmDeclChName.EditModal;
  finally
    fmDeclChName.Free;
    fmDeclChName := nil;
  end;
end;

function TfmDeclChName.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_DChName); //
end;

function TfmDeclChName.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

  DokumentMEN_ID.AsString := '';

  DokumentTYPE_BRAK.AsInteger:=1;
  DokumentTYPE_FAM.AsInteger:=1;
  DokumentST21.AsBoolean:=false;

  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean := false;
  DokumentB_RESP.AsBoolean     := true;
  DokumentB_OBL.AsBoolean      := true;

  DokumentM_B_RESP.AsBoolean   := true;
  DokumentM_B_OBL.AsBoolean    := true;

  DokumentB_GOROD.AsInteger    := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentM_B_GOROD.AsInteger  := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentDETI_DATER.AsBoolean:=true;

  DokumentFirst_Ekz.AsBoolean := true;
  DokumentVOSSTAN.AsBoolean := false;
  DokumentV_OBAZAN.AsBoolean := false;
  N_F_cbBelorus.Checked:=False;
  inherited NewDok(lAppend);

  CheckForAll_Bel(DokumentOBL);
  CheckForAll_Bel(DokumentRAION);

  CheckDeti_Dater;

  QueryExit:=false;
  Result := true;
end;
{
procedure TfmZapisChName.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
//--------------------------------------------------------------------
function TfmDeclChName.ReadDok(nID: Integer): Boolean;
var
  i,j : Integer;
  fld : TField;
  strField,strDeti : String;
  arr : TArrStrings;
  sl  : TStringList;
begin
  Result := true;
  if not FMainTable.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to FMainTable.FieldCount-1 do begin
    strField := FMainTable.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, FMainTable.Fields[i]);
    end;
  end;
  SetIDZags;

  ds2xml.StringToXML(FMainTable.FieldByName('ADD_FIELDS').AsString);
  ds2xml.XMLToData;

  ReadDopProperty(_TypeObj_DChName, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));
  DokumentCOPIA.AsBoolean := false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentDETI_DATER.IsNull then DokumentDETI_DATER.AsBoolean:=true;
  if DokumentTYPE_BRAK.IsNull then DokumentTYPE_BRAK.AsInteger:=1;
  if DokumentST21.IsNull then DokumentST21.AsBoolean:=false;

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;

  ReadHistory(nID, _TypeObj_DChName);

  strDeti := FMainTable.FieldByName('DETI').AsString;
  StrToArr(strDeti, arr, Chr(13), true);
  sl := TStringList.Create;
  tbDeti.EmptyTable;
  for i:=Low(arr) to High(arr) do begin
    sl.CommaText := arr[i];
    tbDeti.Append;
    for j:=0 to sl.Count-1 do begin

      if Pos('chr(34)', sl.Strings[j])> 0
        then sl.Strings[j]:=StringReplace(sl.Strings[j],'chr(34)','"',[rfReplaceAll]);

      if (sl.Strings[j]<>'') and (j<tbDeti.FieldCount) then begin
        if (tbDeti.Fields[j].DataType = ftDate) and  (sl.Strings[j]<>'') then begin
          try
            tbDeti.Fields[j].AsDateTime := STOD(sl.Strings[j],tdAds);
          except
          end;
        end else begin
          tbDeti.Fields[j].AsString := sl.Strings[j];
        end;
      end;
    end;
    tbDeti.Post;
  end;
  sl.Free;

  if DokumentPOL.AsString = 'М' then begin
    edNation.ListField:='NAME_M';
  end else begin
    edNation.ListField:='NAME_G';
  end;

  CheckDeti_Dater;
  CheckFont;
  //---------------------------------------
end;

function TfmDeclChName.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  sSeria,sNomer,sRukov,sRukovB,sSpec,sSpecB : String;
  strField, strErr, strDate,s : String;
  strRec, strDeti : String;
  vKeyValues : Variant;
  dLastSost : TDateTime;
  dDate : TDateTime;
  lFullWrite : Boolean;
  arr:TArrStrings;
  procedure AddErr(s:String); begin  strErr:=strErr+s+chr(13)+chr(10); end;
begin
  AdditiveBeforeWriteDok;
  FLastError:='';
  PostDataSet(Dokument);
  PostDataSet(tbDeti);
  Result := true;
  lFullWrite:=true;   // полная запись актовой записи
  sSeria:='';
  sNomer:='';
  sRukov:='';
  sRukovB:='';
  sSpec:='';
  sSpecB:='';
  dDate:=0;
  //--------------- проверка на ошибки ввода -------------
  Result:=inherited CheckDokumentSimple(0, true);
  strErr:=FLastError;
//  strErr := '';
  if DokumentDATEZ.IsNull then begin
    AddErr(' Заполните дату заявления. ');
  end else if DokumentNOMER.AsString='' then begin
    AddErr(' Заполните номер заявления. ');
  end;

  if strErr<>'' then begin
    PutError(strErr,self);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    FMainTable.Append;
    FMainTable.Post;
    nID := FMainTable.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not FMainTable.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    FMainTable.Edit;
    if lFullWrite then begin
      for i:=1 to FMainTable.FieldCount-1 do begin
        strField := FMainTable.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          FMainTable.Fields[i].Value := fld.Value;
        end;
      end;

      WriteDopProperty(_TypeObj_DChName, DokumentID.AsInteger,
                     STOD('1899-12-30',tdAds));

      WriteHistory(nID, _TypeObj_DChName);

      strDeti := '';
      tbDeti.First;
      while not tbDeti.Eof do begin
        if tbDetiZAGS_DATE.IsNull then begin
          strDate := '';
        end else begin
          strDate := DTOS(tbDetiZAGS_DATE.AsDateTime, tdAds);
        end;

        if tbDetiDATER.IsNull
          then s:=''
          else s:=DTOS(tbDetiDATER.AsDateTime,tdAds);

        strRec := '"'+tbDetiFAMILIA.AsString+'",'+
                  '"'+tbDetiNAME.AsString+'",'+
                  '"'+tbDetiOTCH.AsString+'",'+
                  '"'+tbDetiGOD_ROG.AsString+'",'+
                  '"'+StringReplace(tbDetiZAGS_NAME.AsString,'"','chr(34)',[rfReplaceAll])+'",'+
                  '"'+tbDetiZAGS_NOMER.AsString+'",'+
                  '"'+strDate+'",'+
                  '"'+s+'",'+
                  '"'+StringReplace(tbDetiMESTOR.AsString,'"','chr(34)',[rfReplaceAll])+'"'+
                  Chr(13);
        strDeti := strDeti + strRec;
        tbDeti.Next;
      end;
      FMainTable.FieldByName('DETI').AsString := strDeti;
      FMainTable.FieldByName('VOSSTAN').AsBoolean := false;

    end;

    WriteDateIzm;
    WriteForAllDok_BeforePost;

    if ds2xml.DataToXML then begin
      FMainTable.FieldByName('ADD_FIELDS').AsString:=ds2xml.XMLToString;
    end else begin
      PutError(ds2xml.LastError,self);
    end;

    FMainTable.Post;
//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);

    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    AdditiveWriteDok;

    QueryExit:=false;
    Result := true;
    if FCheckBelName and FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentFamiliaDo.AsString, DokumentFamiliaDo_B.AsString);
      dmBase.CheckBelFamily( DokumentFamiliaPosle.AsString, DokumentFamiliaPosle_B.AsString);
      WriteForAll_Bel;
    end;
  end;
  if Result then FlushBuffers;
end;

function TfmDeclChName.EmptyIzm: String;
begin
  Result:=SprChName_EmptyIzm;  // uProject
end;

procedure TfmDeclChName.FormResize(Sender: TObject);
begin
//  gbDeti.Width := Self.ClientWidth-8;
end;
//------------------------------------------------------------------------
constructor TfmDeclChName.Create(Owner: TComponent);
var
  n:Integer;
  d2xml:TDataSet2XML;
begin
  inherited;
  SetControlClick(false);

  FRunSetTypeBrak:=false;
  FCheckLookupField:=false;   // так как все поля (область,район,город) переделаны на DbEditEh.MRUList;
  TBItemSvidIspor.Visible := false;
  TBItemZAGS.Visible := false;
//  Dokument.Active:=true;
  if not Dokument.Active then Dokument.Active:=true;
  if not tbDeti.Active   then tbDeti.Active:=true;
  FFieldDolgRuk:='';
  FFieldDolgSpec:='SPEC_D';

  d2xml:=ds2xml.DS_Add(Dokument,true);
  d2xml.FClearRecord:=false;
  d2xml.FWriteNull:=false;
  d2xml.SetWriteFields('SPEC_D;ADD_SUD;ADD_CHNAME;ADD_DOK;ADD_SUD2;FIO1;FIO2;FAM1;FAM2');

  FDokZAGS := true;
  TypeObj := _TypeObj_DChName;
  FCheckKeyGrid:=true;

  edPRICH.EditButtons[1].Glyph:=ImBtClear.Picture.Bitmap;

  SetLength(FArrChoiceRekv,11);
  n:=0;
  FArrChoiceRekv[n].nType:=SHABLON_DOKUMENT;
  FArrChoiceRekv[n].FieldName:='DOKUMENT';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=SHABLON_NATION;
  FArrChoiceRekv[n].FieldName:='NATION_DOK';
  Inc(n,1);   // д.б.    FArrChoiceRekv[2]  используется в edTypeBrakChange
  FArrChoiceRekv[2].nType:=SHABLON_REG;
  FArrChoiceRekv[2].FieldName:='REG_ZAGS';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[n].FieldName:='M_GOROD_R';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_VUS;
  FArrChoiceRekv[n].FieldName:='VOENKOM';
//  FArrChoiceRekv[n].sPadeg:='Т';
  Inc(n,1);
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[n].FieldName:='GOSUD';
  Inc(n,1);
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[n].FieldName:='M_GOSUD';
  Inc(n,1);
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[n].FieldName:='GRAG';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[n].FieldName:='WORK_PLACE';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[n].FieldName:='ZAGS_NAME';
  FArrChoiceRekv[n].sPadeg:='';
  FArrChoiceRekv[n].DataSet:=tbDeti;
  Inc(n,1);
  FArrChoiceRekv[n].nType:=SHABLON_DOCS;
  FArrChoiceRekv[n].FieldName:='ADD_DOK';


  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_ROGD,btChoiceChild.Glyph);

  AddButton_LoadIdentif(ENG_edIDENTIF);

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbDeclChName;
  dsGragd.DataSet := dmBase.SprGragd;
  FPageControl := pc;
  pc.ActivePageIndex:=0;
  edFamiliaDo.OnExit := OnDestroyHint;
  edNameDo.OnExit := OnDestroyHint;
  edOtchDo.OnExit := OnDestroyHint;
  edFamiliaPosle.OnExit := OnDestroyHint;
  edNamePosle.OnExit := OnDestroyHint;
  edOtchPosle.OnExit := OnDestroyHint;
//  fmMain.SetCurrentDokument(Dokument);
  dmBase.SetDateFormat(tbDeti);

  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;

  {$IFDEF ZAGS}
//    edON_Familia.EditButtons.Items[0].Visible:=false;
//    edONA_Familia.EditButtons.Items[0].Visible:=false;
//    cbProvDvig.Visible := false;
//    cbProvDvig.Checked := false;
//    gbLich.Visible:=false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
    TBItemArxSpr.Visible:=false;
    edCopy.Visible := false;
    cbPovtor.Visible := false;
  {$ENDIF}

  edFamiliaDo.OnUpdateData:=FIOUpdateData;
  edNameDo.OnUpdateData:=FIOUpdateData;
  edOtchDo.OnUpdateData:=FIOUpdateData;

  BLR_edFamiliaDo.OnUpdateData:=FIOUpdateData;
  BLR_edNameDo.OnUpdateData:=FIOUpdateData;
  BLR_edOtchDo.OnUpdateData:=FIOUpdateData;

  edFamiliaPosle.OnUpdateData:=FIOUpdateData;
  edNamePosle.OnUpdateData:=FIOUpdateData;
  edOtchPosle.OnUpdateData:=FIOUpdateData;

  BLR_edFamiliaPosle.OnUpdateData:=FIOUpdateData;
  BLR_edNamePosle.OnUpdateData:=FIOUpdateData;
  BLR_edOtchPosle.OnUpdateData:=FIOUpdateData;

  ENG_edIdentif.OnUpdateData:=IN_UpdateData;

//  SetVisibleNomerEkz(pnMain, edDateSv, N_F_1);

  {$IFDEF GISUN}
  if IsActiveGISUN then
    SetControlCharCase(ecUpperCase,
      [
       edFamiliaDo, edNameDo, edOtchDo, edFamiliaPosle, edNamePosle, edOtchPosle
      ]);
  {$ENDIF}

  edGOROD.OnUpdateData:=CityUpdate;
  edM_GOROD.OnUpdateData:=CityUpdate;
  {
  n:=2;
  SetLength(FArrAddProperty,n);
  SetAddProperty(0, 'OTHER', '', ftMemo);
  SetAddProperty(1, 'IZMEN', '', ftMemo);
    // типы нас. пунктов в кодах ГИС РН
    SetLength(FArrAddProperty,n+2);
    SetAddProperty(n+0, 'RN_B_GOROD', '', ftString);
    SetAddProperty(n+1, 'RN_M_B_GOROD', '', ftString);
  }
  SetcbBel(N_F_cbBelorus);
{
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;
}
  SetLength(FArrCheckBelField,3);
  WriteToArrCheck(0,  1, false, 'OBL'      , 'OBL_B');
  WriteToArrCheck(1,  2, false, 'RAION'    , 'RAION_B');
  WriteToArrCheck(2,  3, true, 'GOROD'    , 'GOROD_B');

  SetLength(FArrCheckField,2);
  WriteToArrCheck(0,  1, false, 'M_OBL'   );
  WriteToArrCheck(1,  2, false, 'M_RAION' );


//  SetPanelPovtor(tsPovtor, N_F_cbPovtor,lbRuk,lbSpec);

  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbDeti,'Deti','Дети');
  {$ENDIF}

  {$IFDEF GISUN}
//    FImageGisun:=ImageGISUN;
//    FPoleGRN:=DokumentPOLE_GRN;
//    ImageGISUN.Visible := IsActiveGISUN;
//    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
//    FSubmenuGISUN:=TBSubmenuGISUN;
//    CheckMenuGISUN;
//    AfterCreateFormGISUN;
    CheckMenuGISUN('ZAPROS');
    AfterCreateFormGISUN;       
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
  if GlobalTask.ParamAsBoolean('DECL_CHNAME_SH') then begin  // доступен только выбор из шаблона
    edPRICH.ReadOnly:=true;
    edPRICH.Color:=clInfoBk;
  end else begin
    edPRICH.ReadOnly:=false;
    edPRICH.Color:=clWindow;
  end;

  edDOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;  // utypes.pas
  edDOK_TYPE.DropDownBox.Width:=TYPEDOK_WIDTH;  // utypes.pas

end;

destructor TfmDeclChName.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmDeclChName.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;
    edZAGS.DataField := 'NAME_ZAGS_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
  end else begin
    ActivateRUSKeyboard;
    edZAGS.DataField := 'NAME_ZAGS';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
  end;
end;

procedure TfmDeclChName.OnDestroyHint(Sender : TObject);
begin
  DestroyHint(H);
end;

procedure TfmDeclChName.edFamiliaPosleEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaPosle,DokumentFamiliaPosle.AsString+' ');
end;

procedure TfmDeclChName.edNamePosleEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edNAMEPosle,DokumentNAMEPosle.AsString+' ');
end;

procedure TfmDeclChName.edOtchPosleEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edOTCHPosle,DokumentOTCHPosle.AsString+' ');
end;

procedure TfmDeclChName.edFamiliaDoCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmDeclChName.edFamiliaDoEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaDo,DokumentFamiliaDo.AsString+' ');
end;

procedure TfmDeclChName.edNameDoEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edNAMEDo,DokumentNAMEDo.AsString+' ');
end;

procedure TfmDeclChName.edOTCHDOEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edOTCHDo,DokumentOTCHDo.AsString+' ');
end;

procedure TfmDeclChName.N_F_cbVUSClick(Sender: TObject);
begin
  if N_F_cbVUS.Checked then begin
    edVoenkom.Enabled:=true;
//    edV_WHO.Enabled := true;
  end else begin
    edVoenkom.Value:=null;
    edVoenkom.Enabled:=false;
//    EditDataSet(Dokument);
//    DokumentV_WHO.AsString := '';
  end;
end;

procedure TfmDeclChName.UpdateActions;
begin
  inherited;
//  if N_F_cbVUS.Checked then begin
//    edVoenkom.Enabled:=true;
//    edV_WHO.Enabled := true;
//  end else begin
//    edVoenkom.Enabled:=false;
//    edV_WHO.Enabled := false;
//  end;
end;

procedure TfmDeclChName.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol : TPol;
begin
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    FRun := true;
    if FCheckBelName then begin
      strField := UpperCase(Field.FieldName);
      EditDataSet(Dokument);
      Pol := tpNone;
      if strField='NAMEDO' then begin
        DokumentNameDo_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
      end else if strField='OTCHDO' then begin
        DokumentOtchDo_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
      end;
      if strField='NAMEPOSLE' then begin
        if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentNameDo.AsString)) and (DokumentNameDo_B.AsString<>'')
          then DokumentNamePosle_B.AsString := DokumentNameDo_B.AsString
          else DokumentNamePosle_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
      end else if strField='OTCHPOSLE' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentOtchDo.AsString)) and (DokumentOtchDo_B.AsString<>'')
            then DokumentOtchPosle_B.AsString := DokumentOtchDo_B.AsString
            else DokumentOtchPosle_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
      end else if strField='FAMILIADO' then begin
          DokumentFamiliaDo_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end else if strField='FAMILIAPOSLE' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentFamiliaDo.AsString)) and (DokumentFamiliaDo_B.AsString<>'')
            then DokumentFamiliaPosle_B.AsString := DokumentFamiliaDo_B.AsString
            else DokumentFamiliaPosle_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end;
      CheckForAll_Bel(Field);
      if Pol <> tpNone then begin
        if Pol = tpM then begin
          DokumentPOL.AsString := 'М';
        end else begin
          DokumentPOL.AsString := 'Ж';
        end;
      end;
      if (Pol <> tpNone) or (strField='POL') then begin
        if DokumentPOL.AsString = 'М' then begin
          edNation.ListField:='NAME_M';
        end else begin
          edNation.ListField:='NAME_G';
        end;
      end;
    end;
    FRun := false;
  end;
  inherited;
end;

procedure TfmDeclChName.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmDeclChName.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmDeclChName.edOBL_RNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmDeclChName.edRaion_RNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmDeclChName.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetChName(Self);
//  Gisun.CheckChName(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmDeclChName.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterChName(Self);
//  Gisun.CheckChName(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmDeclChName.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then begin

    if pc.Pages[pc.ActivePageIndex].Name='tsSvid'
      then CheckForAll_Bel( nil )
      else N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];

//    if (pc.ActivePageIndex=1) or (pc.Pages[pc.ActivePageIndex].Name='tsSvid')
//      then N_F_cbPovtor.Parent:=pc.Pages[pc.ActivePageIndex];

  end;
end;

procedure TfmDeclChName.edDATERUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 13);
end;

//--------------------------------------------------------------------
function TfmDeclChName.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result:= inherited BeforeEdit;

// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edGOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edM_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edM_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edM_RAION,n,2,true,false,false,FAddButtonMRUList);

end;

procedure TfmDeclChName.Button1Click(Sender: TObject);
begin
  SaveDokumentToFile;
end;

procedure TfmDeclChName.Button2Click(Sender: TObject);
var
  sFile,sErr:String;
begin
//  function PromptForFileName(var AFileName: string; const AFilter: string = ''; const ADefaultExt: string = '';
//                            const ATitle: string = ''; const AInitialDir: string = ''; SaveDialog: Boolean = False): Boolean;
  if PromptForFileName(sFile, '*.sav', '*.sav', 'Choice File SAV', ExtractFilePath(Application.ExeName)+'SaveDok', False) then begin
     IsReadDokument:=true;
     FRun:=true;
     LoadDokumentFromFile(sFile);
     IsReadDokument:=false;
     FRun:=false;
  end;
end;


procedure TfmDeclChName.btAddChildClick(Sender: TObject);
begin
  QueryExit:=true;
  tbDeti.Append;
  ActiveControl:=GridDeti;
end;

procedure TfmDeclChName.btDelChildClick(Sender: TObject);
begin
  if tbDeti.RecordCount>0 then begin
    QueryExit:=true;
    tbDeti.Delete;
    ActiveControl:=GridDeti;
  end;
end;

//--------------------------------------------------------------------------------------
procedure TfmDeclChName.CheckDeti_Dater;
begin
  if DokumentDETI_DATER.AsBoolean then begin
    GridDeti.FieldColumns['GOD_ROG'].Visible:=false;
    GridDeti.FieldColumns['DATER'].Visible:=true;
  end else begin
    GridDeti.FieldColumns['GOD_ROG'].Visible:=true;
    GridDeti.FieldColumns['DATER'].Visible:=false;
  end;
end;
//--------------------------------------------------------------------------------------
procedure TfmDeclChName.GridDetiTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  EditDataSet(Dokument);
  if Column.FieldName='GOD_ROG' then begin
    DokumentDETI_DATER.AsBoolean:=true;
  end else if Column.FieldName='DATER' then begin
    DokumentDETI_DATER.AsBoolean:=false;
  end;
  CheckDeti_Dater;
end;

procedure TfmDeclChName.edRukov_SvEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
end;

//------------------------------------------------------------
function TfmDeclChName.CheckFIO: String;
begin
  Result:=CheckOneFIO('До перемены: ',DokumentFamiliaDo.AsString, DokumentNameDo.AsString, DokumentOtchDo.AsString);
  if Result='' then begin
    Result:=CheckOneFIO('После перемены: ',DokumentFamiliaPosle.AsString, DokumentNamePosle.AsString, DokumentOtchPosle.AsString);
  end;
end;

procedure TfmDeclChName.SetOnlyPovtorSvid(lOnlyPovtor: Boolean;  pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;  lbSvid, lbNomer: TLabel);
begin
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
  if lOnlyPovtor then begin
    TBItemSeekAkt.Visible:=true;
    TBItemArxSpr.Visible:=false;
    TBItemZaklChName.Visible:=false;
//  TBSubmenuGISUN.Visible:=false;
    TBItemStep2.Caption:='Зарегистрировать свидетельство';
    {
    lbIdentif.Parent:=tsSvid;
    lbIDENTIF.Top:=Label51.Top;
    lbIDENTIF.Left:=edDateR_Sv.Left+edDateR_Sv.Width+50;
    lbIDENTIF.Caption:='Иден. номер';
    ENG_edIDENTIF.Parent:=tsSvid;
    ENG_edIDENTIF.Top:=edDateR_Sv.Top;
    ENG_edIDENTIF.Left:=lbIDENTIF.Left+lbIDENTIF.Width+50;
    }
  end;  
end;

//-------------------------------------------------------------------------------------
procedure TfmDeclChName.TBItemGetDataGISUNClick(Sender: TObject);
var
//arr:TCurrentRecord;
//  sl:TStringList;
//  i:Integer;
  cur:TCursor;
  sl:TStringList;
  ds:TDataSet;
begin
{$IFDEF GISUN}
  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  Gisun.CurAkt:=Self;    // !!! важно
  try
    if GetInfoGISUN1(Self,'IDENTIF', '') then begin
      sl:=TStringList.Create;
      if ENG_edIDENTIF.Text<>'' then begin
        sl.Add('ON='+ENG_edIDENTIF.Text);
      end;
      ds:=Gisun.LoadIdentifData(sl,nil,nil);
      if ds<>nil then begin
        ds.First;
//        Gisun.LoadPersonalData(edON_IDENTIF.Text, arr);
        FRun:=true;
        EditDataSet(Dokument);
        try
        while not ds.Eof do begin
          if ds.FieldByName('IDENTIF').AsString=ENG_edIDENTIF.Text then begin
            DokumentFamiliaDo.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
            DokumentNAMEDo.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
            DokumentOTCHDo.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
            DokumentFamiliaDo_B.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA_B').AsString);
//            dmBase.CheckBelFamily(DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);  // занесем в справочник правильные значения перевода
            DokumentNAMEDo_B.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME_B').AsString);
            DokumentOTCHDo_B.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH_B').AsString);
            try
              WriteField(DokumentDATER,ds.FieldByName('DATER'));
            except
            end;
            DokumentGRAG.AsString:=ds.FieldByName('GRAG').AsString;
            DokumentPOL.AsString:=ds.FieldByName('POL').AsString;

            DokumentDOK_TYPE.AsString:=ds.FieldByName('DOK_TYPE').AsString;
            WriteField(DokumentDOK_DATE,ds.FieldByName('DOK_DATE'));
            DokumentDOK_SERIA.AsString:=ds.FieldByName('DOK_SERIA').AsString;
            DokumentDOK_NOMER.AsString:=ds.FieldByName('DOK_NOMER').AsString;
            DokumentDOKUMENT.AsString:=ds.FieldByName('DOKUMENT').AsString;

            DokumentGOSUD.AsString:=ds.FieldByName('GOSUD_R').AsString;
            DokumentOBL.AsString:=ds.FieldByName('OBL_R').AsString;
            DokumentB_OBL.AsString:=ds.FieldByName('B_OBL_R').AsString; // !!!

            DokumentOBL_B.AsString:=ds.FieldByName('OBL_B_R').AsString;
            DokumentRAION.AsString:=ds.FieldByName('RAION_R').AsString;
            DokumentRAION_B.AsString:=ds.FieldByName('RAION_B_R').AsString;
            DokumentB_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_R').AsString;
            DokumentGOROD.AsString:=ds.FieldByName('GOROD_R').AsString;
            DokumentGOROD_B.AsString:=ds.FieldByName('GOROD_B_R').AsString;


            DokumentM_GOSUD.AsString:=ds.FieldByName('GOSUD_G').AsString;
            DokumentM_OBL.AsString:=ds.FieldByName('OBL_G').AsString;
//              DokumentON_M_B_OBL.AsString:=''; // !!!
            DokumentM_RAION.AsString:=ds.FieldByName('RAION_G').AsString;
            DokumentM_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_G').AsString;
            DokumentM_GOROD.AsString:=ds.FieldByName('GOROD_G').AsString;

            DokumentM_GOROD_R.AsString:=ds.FieldByName('GOROD_R_G').AsString; //GetGorodR(OutPut);

          end;
          ds.Next;
        end;

        PostDataSet(Dokument);
        finally
          FRun:=false;
        end;
        ds.Free;
      end;
      sl.Free;
    end;
  finally
    Gisun.CurAkt:=nil;
    Screen.Cursor:=cur;
  end;
{$ENDIF}
//
end;
//----------------------------------------------------------------------------------------------------
procedure TfmDeclChName.SpeedButtonClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentFamiliaPosle.AsString:=DokumentFamiliaDo.AsString;
  DokumentNamePosle.AsString:=DokumentNameDo.AsString;
  DokumentOtchPosle.AsString:=DokumentOtchDo.AsString;
  DokumentFamiliaPosle_B.AsString:=DokumentFamiliaDo_B.AsString;
  DokumentNamePosle_B.AsString:=DokumentNameDo_B.AsString;
  DokumentOtchPosle_B.AsString:=DokumentOtchDo_B.AsString;
end;
//----------------------------------------------------------------------------------------------------
procedure TfmDeclChName.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;
//---------------------------------------------------------------
procedure TfmDeclChName.edTypeBrakChange(Sender: TObject);
begin
  SetControlTypeBrak( GetTypeBrak, DokumentST21.AsBoolean );
end;
procedure TfmDeclChName.N_F_cbSt21Click(Sender: TObject);
begin
  SetControlTypeBrak( GetTypeBrak, N_F_cbSt21.Checked );
end;
//---------------------------------------------------------------
function TfmDeclChName.GetTypeBrak: Integer;
begin
  if (edTypeBrak.KeyItems.Count>0) and (edTypeBrak.ItemIndex>-1)
    then Result:=StrToInt(edTypeBrak.KeyItems[edTypeBrak.ItemIndex])
    else Result:=1;
end;
//---------------------------------------------------------------
// так как при TfmDeclChName.Create  срабатывают события
// edTypeBrakChange и N_F_cbSt21Click
procedure TfmDeclChName.SetControlClick(lSet:Boolean);
begin
  if lSet then begin
    edTypeBrak.OnClick:=edTypeBrakChange;  // !!!
    N_F_cbSt21.OnClick:=N_F_cbSt21Click;  // !!!
  end else begin
    edTypeBrak.OnClick:=nil;  // !!!
    N_F_cbSt21.OnClick:=nil;  // !!!
  end;
end;
//---------------------------------------------------------------
procedure TfmDeclChName.SetControlTypeBrak(nValue:Integer; lSt21:Boolean);
var
  l,lBrak:Boolean;
begin
  if not FRunSetTypeBrak and not IsReadDokument and not IsCreateForm then begin
    if nValue=-99 then begin
      nValue:=DokumentTYPE_BRAK.AsInteger;
      lSt21:=DokumentST21.AsBoolean;
    end;
    FRunSetTypeBrak:=true;
    try
      if nValue=1 then lBrak:=true else lBrak:=false;
      if lBrak and lSt21 // состоит в браке  + статья 21
        then l:=true
        else l:=false;
    lSt21:=false;  // !!!!!!!!!!!!!!!!!!!
//      TBSubmenuChoiceBrak.Enabled:=l and DokumentZ_DATE.IsNull and (FAddNewDok or (DokumentBRAK_ID.AsInteger=0));
      TBSubmenuChoiceBrak.Visible:=false;
      btAktBrak.Visible:=false;
      SetVisibleControls([lbFIO1,lbFIO2,lbFIO3,edFIO1,edFIO2,edTypeFam], false );
      {
      btAktBrak.Visible:=lBrak;
      btAktBrak.Enabled:=l and (DokumentBRAK_ID.AsInteger>0);
      SetEnabledControls([lbFIO1,lbFIO2,lbFIO3,edFIO1,edFIO2,edTypeFam], l);
      SetVisibleControls([lbFIO1,lbFIO2,lbFIO3,edFIO1,edFIO2,edTypeFam], lBrak );
      SetVisibleControls([lbZapis2,edZNomer], not l);
      SetVisibleControls([BLR_edFamiliaPosle, lbBLR], l);
      if l
        then lbZapis1.Caption:='Внесены изменения в запись акта о браке'
        else lbZapis1.Caption:='Составлена запись акта';
      }
      if (nValue=1) then begin  // состоит в браке
        pnZags.Visible:=true;
        pnSud.Visible:=false;
//        N_F_cbSt21.Visible:=true;
      end else begin
//        if N_F_cbSt21.Checked then begin
//          EditDataSet(Dokument);
//          DokumentST21.AsBoolean:=false;
//        end;
//        N_F_cbSt21.Visible:=false;
        if (nValue=2) then begin
          pnZags.Visible:=false;
          pnSud.Visible:=false;
        end else if (nValue=4) or (nValue=5) then begin
          pnZags.Visible:=true;
          pnSud.Visible:=false;
        end else if (nValue=3) then begin    // решение суда
          pnZags.Visible:=false;
          pnSud.Top:=pnZags.Top;
          pnSud.Left:=pnZags.Left;
          pnSud.Height:=pnZags.Height;
          pnSud.Width:=pnZags.Width;
          pnSud.Align:=alBottom;
          pnSud.Visible:=true;
        end;
      end;
      {
      pnAddSud.Visible:=not l;
      pnFAM.Visible:=l;
      pnFAM.Left:=pnAddSud.Left;
      pnFAM.Top:=pnAddSud.Top;
      pnFAM.Width:=pnAddSud.Width;
      GridDeti.Columns[6].Visible:=l;
      GridDeti.Columns[7].Visible:=l;
      GridDeti.Columns[8].Visible:=l;
       }
      pnFAM.Visible:=false;
      if (nValue=3) then begin  // суд
        FArrChoiceRekv[2].nType:=SHABLON_SUD;
        FArrChoiceRekv[2].nTypeSpr:=0;
        FArrChoiceRekv[2].FieldName:='B_ZAGS';
        FArrChoiceRekv[2].sPadeg:='';
      end else begin
        FArrChoiceRekv[2].nType:=0;
        FArrChoiceRekv[2].nTypeSpr:=_SHABLON_ZAGS;
        FArrChoiceRekv[2].FieldName:='B_ZAGS';
        FArrChoiceRekv[2].sPadeg:='';
      end;
    finally
      FRunSetTypeBrak:=false;
    end;
  end;
end;
//----------------------------------------------
procedure TfmDeclChName.edVoenkomEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  if Globaltask.ParamAsString('ID_VOENKOM')<>''
    then edVoenkom.Value:=Globaltask.ParamAsString('ID_VOENKOM');
  N_F_cbVUS.Checked:=true;
end;
//----------------------------------------------
procedure TfmDeclChName.edVoenkomEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  edVoenkom.Value:=null;
  N_F_cbVUS.Checked:=false;
end;
//----------------------------------------------
procedure TfmDeclChName.edVoenkomEditButtons2Click(Sender: TObject;  var Handled: Boolean);
var
  SOATO:TSOATO;
  n:Integer;
begin
  SOATO:=dmBase.GetSoatoAkt(Dokument, 'M_GOSUD,FName;M_OBL,M_B_OBL;M_RAION,M_RNGOROD;M_GOROD,M_B_GOROD',true,FLenSoato);
  n:=0;
  if SOATO.Kod<>'' then begin
    n:=dmBase.VoenkomFromSOATO(SOATO.Kod);
  end;
  if n>0 then begin
    EditDataSet(Dokument);
    DokumentVOENKOM.AsInteger:=n;
  end else if DokumentVOENKOM.AsInteger>0 then begin
    EditDataSet(Dokument);
    DokumentVOENKOM.AsString:='';
  end;
end;
//----------------------------------------------
procedure TfmDeclChName.edVoenkomChange(Sender: TObject);
begin
  if edVoenkom.Value<>null
    then N_F_cbVUS.Checked:=true;
end;
//----------------------------------------------
procedure TfmDeclChName.GridDetiColEnter(Sender: TObject);
begin
  if GridDeti.SelectedField<>nil then
    TBItemShablon.Enabled:=(GridDeti.SelectedField.FieldName='ZAGS_NAME');
end;
//-----------------------------------------------------------------
procedure TfmDeclChName.CheckFont;
begin
  if DokumentKOD_PRICH.AsInteger>0
    then edPrich.Font.Style:=[fsBold]
    else edPrich.Font.Style:=[];
end;
//-----------------------------------------------------------------
procedure TfmDeclChName.edPrichEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  EditDataSet(Dokument);
  DokumentKOD_PRICH.AsString:='';
  DokumentPRICH.AsString:='';
  PostDataSet(Dokument);
  CheckFont;
end;
//-----------------------------------------------------------------
procedure TfmDeclChName.edPrichEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  nKod:Integer;
  sSeek:String;
  Opis : TOpisEdit;
begin
  if Pos(' ', edPrich.Text)=0
    then sSeek:=edPrich.Text
    else sSeek:='';
  nKod:=ChoiceFromShablonEx( edPrich, SHABLON_PRICH_PER, true, sSeek);
  if nKod>0 then begin
    EditDataSet(Dokument);
    DokumentKOD_PRICH.AsInteger:=nKod;
    PostDataSet(Dokument);
  end;
  CheckFont;
  // для обновления списка KEY_FIO_PRICH
  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_FIO_PRICH');
  if Opis<>nil then Opis.KeyListFromDataSet:=true;
end;

procedure TfmDeclChName.btChoiceChildClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ROGD');
  if Opis<>nil then begin
//    if edFamiliaDo.Text<>'' then begin
//      Opis.DataSet.Filter := 'FAMILIA='+QStr(edFamiliaDo.Text);
//    end;
//    Opis.DataSet.Filtered := true;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(GridDeti, v, arrRec, nil) and (v<>null) then begin
      tbDeti.Append;
      tbDetiFAMILIA.AsString := GetValueFieldEx(arrRec, 'FAMILIA','');
      tbDetiNAME.AsString := GetValueFieldEx(arrRec, 'NAME','');
      tbDetiOTCH.AsString := GetValueFieldEx(arrRec, 'OTCH', '');
      v := GetValueField(arrRec, 'DATER');
      if v = null then tbDetiDateR.AsString:='' else tbDetiDateR.Value := v;
      if dmBase.tbZapisRogd.Locate('ID', GetValueFieldEx(arrRec, 'ID',0),[]) then begin
        tbDetiMESTOR.AsString:=dmBase.GetAdresAkt3(dmBase.tbZapisRogd,
              'GOSUD,FName;OBL,B_OBL;RAION;GOROD,B_GOROD',1);
      end;
      tbDetiZAGS_NOMER.AsString:= GetValueFieldEx(arrRec, 'NOMER','');
      v:=GetValueField(arrRec, 'DATEZ');
      if v<>null then tbDetiZAGS_DATE.Value:=v;
      tbDetiZAGS_NAME.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','Т',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));
      tbDeti.Post;
      QueryExit:=true;
    end;
//    Opis.DataSet.Filter   := '';
//    Opis.DataSet.Filtered := false;
  end;
end;
//---------------------------------------------------------------------
procedure TfmDeclChName.edDateZUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 3);
end;
//---------------------------------------------------------------------
procedure TfmDeclChName.ChoiceBrak(lOna:Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
//  adr : TAdres;
  old : TCursor;
  s,ss,sRnGor,sAdd,strName : String;
//  f : TfmSimpleD;
  lCheck, l : Boolean;
  ParamFlt:TParamFieldFlt;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_BRAK');
  if Opis<>nil then begin
    ParamFlt:=nil;
    //CreateParamFlt(edON_Familia.Text,'ON_FAMILIAP');
    //if ParamFlt<>nil then Opis.AutoFilter:=true;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edFamiliaDo, v, arrRec, ParamFlt) and (v<>null) then begin
      if lOna then sAdd:='ONA_' else sAdd:='ON_';
      old := Screen.Cursor;
      lCheck:=dbDisableControls(Dokument);
      Screen.Cursor := crHourGlass;
      FRun:=true;
      try
        btAktBrak.Enabled:=true;
        EditDataSet(Dokument);
        DokumentST21.AsBoolean:=true;
        DokumentBRAK_ID.AsInteger:=GetValueFieldEx(arrRec, 'ID', 0);
        DokumentTYPE_FAM.AsInteger:=1;
        WriteDateFieldV( DokumentB_DATE, GetValueFieldEx(arrRec, 'DATEZ', null) );
        DokumentB_NOMER.AsString:=GetValueFieldEx(arrRec, 'NOMER', '');
//        s:=GetValueField(arrRec, 'NAME_ZAGS');
//        if s='' then begin
//          v := GetValueField(arrRec, 'ID_ZAGS');
//          if dmBase.SprNames.Locate('ID', v, [])
//            then s:=dmBase.SprNames.FieldByName('NAME').AsString;
//        end;
//        DokumentB_ZAGS.AsString:=s;
        DokumentB_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','П',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));
        DokumentFIO1.AsString:=GetPadegFIO3(GetValueFieldEx(arrRec, 'ON_FAMILIA', ''),GetValueFieldEx(arrRec, 'ON_NAME', ''),GetValueFieldEx(arrRec, 'ON_OTCH', ''),'м','И');
        DokumentFIO2.AsString:=GetPadegFIO3(GetValueFieldEx(arrRec, 'ONA_FAMILIA', ''),GetValueFieldEx(arrRec, 'ONA_NAME', ''),GetValueFieldEx(arrRec, 'ONA_OTCH',''),'ж','И');

        DokumentFAMILIADO.AsString:=FirstUpper(GetValueFieldEx(arrRec, sAdd+'FAMILIA', ''));
        DokumentNAMEDO.AsString:=FirstUpper(GetValueFieldEx(arrRec, sAdd+'NAME', ''));
        DokumentOTCHDO.AsString:=FirstUpper(GetValueFieldEx(arrRec, sAdd+'OTCH', ''));
        DokumentFAMILIAPOSLE.AsString:=FirstUpper(GetValueFieldEx(arrRec, sAdd+'FAMILIAP', ''));
        DokumentFamiliaPosle_B.AsString:=FirstUpper(GetValueFieldEx(arrRec, sAdd+'FAMILIAP_B', ''));
        DokumentNAMEPOSLE.AsString:=DokumentNAMEDO.AsString;
        DokumentOTCHPOSLE.AsString:=DokumentOTCHDO.AsString;
        WriteDateFieldV(DokumentDATER, GetValueFieldEx(arrRec, sAdd+'DATER', null) );
        if lOna then DokumentPOL.AsString:='Ж' else DokumentPOL.AsString:='М';
        DokumentIDENTIF.AsString:=GetValueFieldEx(arrRec, sAdd+'IDENTIF', '');
        DokumentNATION.AsInteger:=GetValueFieldEx(arrRec, sAdd+'NATION', 0);
        DokumentGRAG.AsString:=GetValueFieldEx(arrRec, sAdd+'GRAG', '');
        DokumentWORK_PLACE.AsString:=GetValueFieldEx(arrRec, sAdd+'WORK', '');
        DokumentV_OBAZAN.AsBoolean:=GetValueFieldEx(arrRec, sAdd+'VUS', false);
        DokumentVOENKOM.AsString:=GetValueFieldEx(arrRec, sAdd+'VOENKOM',0);

        DokumentDOK_TYPE.AsString := GetValueFieldEx(arrRec, sAdd+'DOK_TYPE','888');
        DokumentDOK_SERIA.AsString:= GetValueFieldEx(arrRec, sAdd+'DOK_SERIA','');
        DokumentDOK_NOMER.AsString:= GetValueFieldEx(arrRec, sAdd+'DOK_NOMER','');
        DokumentDOK_ORGAN.AsString:= GetValueFieldEx(arrRec, sAdd+'DOK_ORGAN','');
        WriteDateFieldV(DokumentDOK_DATE, GetValueFieldEx(arrRec, sAdd+'DOK_DATE', null) );
        DokumentDOKUMENT.AsString := GetValueFieldEx(arrRec, sAdd+'DOKUMENT','');

//        DokumentB_RESP.AsBoolean:=GetValueFieldEx(arrRec, sAdd+'B_RESP', true);
        DokumentGOSUD.AsString:=GetValueFieldEx(arrRec, sAdd+'GOSUD','');
        DokumentB_OBL.AsBoolean:=GetValueFieldEx(arrRec, sAdd+'B_OBL',true);
        DokumentOBL.AsString:=GetValueFieldEx(arrRec, sAdd+'OBL','');
        DokumentRAION.AsString:=GetValueFieldEx(arrRec, sAdd+'RAION','');
        DokumentB_GOROD.AsString:=GetValueFieldEx(arrRec, sAdd+'B_GOROD','');
        DokumentGOROD.AsString:=GetValueFieldEx(arrRec, sAdd+'GOROD','');

//        DokumentM_B_RESP.AsString:=GetValueFieldEx(arrRec, sAdd+'M_B_RESP', '');
        DokumentM_GOSUD.AsString:=GetValueFieldEx(arrRec, sAdd+'M_GOSUD','');
        DokumentM_B_OBL.AsBoolean:=GetValueFieldEx(arrRec, sAdd+'M_B_OBL',true);
        DokumentM_OBL.AsString:=GetValueFieldEx(arrRec, sAdd+'M_OBL','');
        DokumentM_RAION.AsString:=GetValueFieldEx(arrRec, sAdd+'M_RAION','');
        DokumentM_B_GOROD.AsString:=GetValueFieldEx(arrRec, sAdd+'M_B_GOROD','');
        DokumentM_GOROD.AsString:=GetValueFieldEx(arrRec, sAdd+'M_GOROD','');
        l:=GetValueFieldEx(arrRec, sAdd+'M_B_RN', false);
        if l then begin
          sRnGor:='';
        end else begin
          sRnGor:=DokumentM_RAION.AsString+' район';
          DokumentM_RAION.AsString:='';
        end;
        s:=GetValueFieldEx(arrRec, sAdd+'M_GOROD_R','');
        if sRnGor<>'' then s:=sRnGor+', '+s;
        ss:=GetValueFieldEx(arrRec, sAdd+'M_DOM','');
        if ss<>'' then s:=s+', дом '+ss;
        ss:=GetValueFieldEx(arrRec, sAdd+'M_KORP','');
        if ss<>'' then s:=s+', корп. '+ss;
        ss:=GetValueFieldEx(arrRec, sAdd+'M_KV','');
        if ss<>'' then s:=s+', кв. '+ss;
        DokumentM_GOROD_R.AsString:=s;

        PostDataSet(Dokument);
      finally
        Screen.Cursor := old;
        FRun:=false;
        dbEnableControls(Dokument,lCheck);
      end;
    end;
//    Opis.DataSet.Filter   := '';
//    Opis.DataSet.Filtered := false;
  end;
end;

procedure TfmDeclChName.TBSubmenuChoiceBrakClick(Sender: TObject);
begin
  ChoiceBrak(true);
end;

procedure TfmDeclChName.TBItemChoiceBrakONClick(Sender: TObject);
begin
  ChoiceBrak(false);
end;

procedure TfmDeclChName.btAktBrakClick(Sender: TObject);
var
  nID,i:Integer;
  s:String;
  slPar:TStringList;
begin
  nID:=DokumentBRAK_ID.AsInteger;
  if nID>0 then begin
    CheckUserName_frxDataSet;
    if dmBase.tbZapisBrak.Locate('ID', nID, []) then begin
      slPar:=TStringList.Create;
      slPar.AddObject('DATASET_CHNAME', Dokument);
      EditZapisBrak( nID, false, slPar);
      slPar.Free;
    end else begin
      PutError('Запись акта о браке не найдена.',self)
    end;
    UnCheckUserName_frxDataSet;
    SetCurDok(Self);
  end;
end;

procedure TfmDeclChName.PostDokument;
begin
  inherited PostDokument;
  PostDataSet(tbDeti);
end;

end.
