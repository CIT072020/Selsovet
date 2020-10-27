unit fAktZ;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, QStrings, SasaIniFile, mPermit,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject, DateUtils, uTypes, uProjectAll,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc, sndKey32,ToolCtrlsEh, uDataSet2XML, ifpii_dbfunc,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat,
  ZipForge, Menus;
//  , IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
//  IdIcmpClient;

const
  COL_MOG=9;  // колонка номер могилы

type

  TfmAktZ = class(TfmSimpleD)
    pn: TPanel;
    lbNomer: TLabel;
    lbDateZ: TLabel;
    edNomer: TDBEditEh;
    edDateZ: TDBDateTimeEditEh;
    pc: TPageControl;
    tsAkt: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbDateR_Akt: TLabel;
    lbDateS_Akt: TLabel;
    Label24: TLabel;
    edFamilia_Akt: TDBEditEh;
    edName_Akt: TDBEditEh;
    edOtch_Akt: TDBEditEh;
    edDateR_Akt: TDBDateTimeEditEh;
    edPol_Akt: TDBComboBoxEh;
    edDateS_Akt: TDBDateTimeEditEh;
    gbRogd: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edRG_B_RESP: TDBCheckBoxEh;
    edRG_GOSUD: TDBLookupComboboxEh;
    edRG_B_OBL: TDBCheckBoxEh;
    edRG_GOROD: TDBEditEh;
    gbMestoZH: TGroupBox;
    Label15: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edGT_B_RESP: TDBCheckBoxEh;
    edZH_GOSUD: TDBLookupComboboxEh;
    cbZH_B_OBL: TDBCheckBoxEh;
    edZH_GOROD_Akt: TDBEditEh;
    Label35: TLabel;
    edFact: TDBEditEh;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentSVID_SERIA: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentPOL: TStringField;
    DokumentDateS: TDateField;
    DokumentSMERT_POSL: TIntegerField;
    DokumentSM_GOSUD: TIntegerField;
    DokumentSM_OBL: TStringField;
    DokumentSM_RAION: TStringField;
    DokumentSM_GOROD: TStringField;
    DokumentPR_OSN: TStringField;
    DokumentPR_OSN_NAME: TMemoField;
    DokumentDOKUMENT: TMemoField;
    DokumentDateR: TDateField;
    DokumentRG_GOSUD: TIntegerField;
    DokumentRG_OBL: TStringField;
    DokumentRG_RAION: TStringField;
    DokumentRG_GOROD: TStringField;
    DokumentZH_GOSUD: TIntegerField;
    DokumentZH_OBL: TStringField;
    DokumentZH_RAION: TStringField;
    DokumentZH_GOROD: TStringField;
    DokumentRUKOV: TStringField;
    DokumentSOATO: TStringField;
    DokumentSM_B_RESP: TBooleanField;
    DokumentSM_B_OBL: TBooleanField;
    DokumentRG_B_RESP: TBooleanField;
    DokumentRG_B_OBL: TBooleanField;
    DokumentZH_B_RESP: TBooleanField;
    DokumentZH_B_OBL: TBooleanField;
    DokumentFirst_Ekz: TBooleanField;
    dsStran: TDataSource;
    dsNation: TDataSource;
    DokumentPROV: TBooleanField;
    DokumentDATESV: TDateField;
    DokumentSPEC: TStringField;
    DokumentSUD_NAME: TMemoField;
    DokumentSUD_DATE: TDateField;
    DokumentID_SOURCE: TIntegerField;
    dsGragd: TDataSource;
    DokumentRESH_SUDA: TBooleanField;
    DokumentLICH_NOMER: TStringField;
    N_F_cbOnlyGod_Akt: TDBComboBoxEh;
    DokumentONLYGOD: TSmallintField;
    DokumentONLYGOD_R: TSmallintField;
    N_F_cbOnlyGodR_Akt: TDBComboBoxEh;
    DokumentVOZR: TSmallintField;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    ImageGISUN: TImage;
    DokumentSM_B_GOROD: TSmallintField;
    DokumentRG_B_GOROD: TSmallintField;
    DokumentZH_B_GOROD: TSmallintField;
    edRG_B_GOROD: TDBLookupComboboxEh;
    edZH_B_GOROD_Akt: TDBLookupComboboxEh;
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
    N_F_cbBelorus: TDBCheckBoxEh;
    DokumentDOK_KOD: TSmallintField;
    ApplicationEvents1: TApplicationEvents;
    edRG_OBL: TDBEditEh;
    edRG_RAION: TDBEditEh;
    edZH_OBL: TDBEditEh;
    edZH_RAION: TDBEditEh;
    DokumentRN_SM_B_GOROD: TStringField;
    DokumentRN_RG_B_GOROD: TStringField;
    DokumentRN_ZH_B_GOROD: TStringField;
    DokumentDUBL_SPR: TBooleanField;
    DokumentBOMG: TBooleanField;
    DokumentSUD_SILA: TDateField;
    DokumentEMPTY_PRICH: TBooleanField;
    edTextVozr_Akt: TDBEditEh;
    DokumentTEXT_VOZR: TStringField;
    edTextDateS_Akt: TDBEditEh;
    DokumentTEXT_DATES: TStringField;
    DokumentZH_KLAD: TIntegerField;
    DokumentZH_UCH: TStringField;
    DokumentZH_RAD: TStringField;
    DokumentZH_MOG: TStringField;
    DokumentZH_PRICH: TMemoField;
    DokumentAKT_NOMER: TIntegerField;
    DokumentAKT_DATE: TDateField;
    DokumentGRAG: TIntegerField;
    gbMestoSm: TGroupBox;
    Label9: TLabel;
    edSM_B_RESP: TDBCheckBoxEh;
    edSM_GOSUD: TDBLookupComboboxEh;
    Label10: TLabel;
    cbSM_OBL: TDBCheckBoxEh;
    edSM_OBL: TDBEditEh;
    Label11: TLabel;
    edSM_RAION: TDBEditEh;
    Label12: TLabel;
    edSM_B_GOROD: TDBLookupComboboxEh;
    edSM_GOROD: TDBEditEh;
    Label45: TLabel;
    edSM_DOM: TDBEditEh;
    Label46: TLabel;
    edSM_KORP: TDBEditEh;
    Label51: TLabel;
    edSM_KV: TDBEditEh;
    N_F_edBOMG: TDBCheckBoxEh;
    edRukov_Akt: TDBEditEh;
    DokumentSM_DOM: TStringField;
    DokumentSM_KORP: TStringField;
    DokumentSM_KV: TStringField;
    DokumentSM_TEXT: TStringField;
    edSM_TEXT: TDBEditEh;
    dsKlad: TDataSource;
    Label7: TLabel;
    edZH_UCH_Akt: TDBEditEh;
    Label16: TLabel;
    edZH_RAD_Akt: TDBEditEh;
    Label17: TLabel;
    edZH_MOG_Akt: TDBEditEh;
    DokumentDATEZH: TDateField;
    edZH_PRICH: TDBEditEh;
    Label55: TLabel;
    edZA_NOMER: TDBEditEh;
    Label39: TLabel;
    edZA_DATE: TDBDateTimeEditEh;
    ts1: TTabSheet;
    DokumentRAZR_ORGAN: TStringField;
    DokumentRAZR_DATE: TDateField;
    DokumentRAZR_FIO: TStringField;
    DokumentDECL_ID: TIntegerField;
    DokumentDECL: TStringField;
    DokumentPRIL_LIST: TSmallintField;
    DokumentDECL_TEL: TStringField;
    DokumentDECL_MOB: TStringField;
    edPrOsn_Name: TDBEditEh;
    Label20: TLabel;
    gbOrgan: TGroupBox;
    edRAZR_ORGAN: TDBEditEh;
    edRAZR_DATE: TDBDateTimeEditEh;
    edRAZR_FIO: TDBEditEh;
    DokumentGT_GOSUD: TIntegerField;
    DokumentGT_B_OBL: TBooleanField;
    DokumentGT_OBL: TStringField;
    DokumentGT_RAION: TStringField;
    DokumentGT_B_GOROD: TSmallintField;
    DokumentGT_GOROD: TStringField;
    DokumentGT_GOROD_R: TStringField;
    DokumentGT_DOM: TStringField;
    DokumentGT_KORP: TStringField;
    DokumentGT_KV: TStringField;
    DokumentMOG_TYPE: TSmallintField;
    DokumentMOG_L: TFloatField;
    DokumentMOG_W: TFloatField;
    tbAddMen: TkbmMemTable;
    tbAddMenFAMILIA: TStringField;
    tbAddMenNAME: TStringField;
    tbAddMenOTCH: TStringField;
    dsAddMen: TDataSource;
    tbAddMenNOMER: TAutoIncField;
    tbAddMenOTNOSHS: TStringField;
    DokumentGT_RNGOROD: TStringField;
    DokumentKVIT: TStringField;
    DokumentTRAN_VID: TStringField;
    DokumentTRAN_TIME: TTimeField;
    DokumentBRON_COUNT: TSmallintField;
    DokumentPRIM: TMemoField;
    DokumentNOMER2: TIntegerField;
    edNOMER2: TDBEditEh;
    lbNomer2: TLabel;
    DokumentDOLG_RUKOV: TStringField;
    lbRukov_Akt: TvchDBText;
    DokumentSVID_ZAGS: TStringField;
    DokumentID_ZAGS: TIntegerField;
    DokumentUSLUG: TStringField;
    DokumentAKT_NOMER2: TIntegerField;
    Label5: TLabel;
    edAktNomer: TDBEditEh;
    edSM_GOROD_R: TDBEditEh;
    DokumentSM_GOROD_R: TStringField;
    Label68: TLabel;
    DokumentMEN_ID: TIntegerField;
    DokumentAKT_SOST: TStringField;
    Label28: TLabel;
    edAktSost: TDBEditEh;
    DokumentDOLG_SPEC: TStringField;
    lbSpec_Akt: TvchDBText;
    edSpec_Akt: TDBEditEh;
    Label18: TLabel;
    edSPR_ZAGS: TDBEditEh;
    Label66: TLabel;
    ENG_edIDENTIF_Akt: TDBEditEh;
    DokumentUSLUG_UNP: TStringField;
    edOrg: TDBEditEh;
    edOrgUNP: TDBEditEh;
    Label6: TLabel;
    DokumentORG: TStringField;
    Label33: TLabel;
    DokumentZH_KLUM: TStringField;
    DokumentZH_SKLEP: TStringField;
    DokumentIS_AKT: TBooleanField;
    DokumentZH_SS: TStringField;
    dsNameZah: TDataSource;
    DokumentZH_VID: TSmallintField;
    DokumentIS_ORG: TBooleanField;
    edBook: TDBNumberEditEh;
    Label70: TLabel;
    tsAdd: TTabSheet;
    GroupBox1: TGroupBox;
    Label73: TLabel;
    Label85: TLabel;
    edINST_MN_NAME: TDBEditEh;
    DBCheckBoxEh2: TDBCheckBoxEh;
    GroupBox2: TGroupBox;
    edZH_PRIM: TDBMemo;
    GroupBox3: TGroupBox;
    edZH_WORK: TDBMemo;
    DokumentINST_MN_NAME: TStringField;
    DokumentINST_MN_ADRES: TStringField;
    DokumentINST_MN_ORG: TBooleanField;
    edINST_MN_ADRES: TDBEditEh;
    DokumentZH_WORK: TMemoField;
    DokumentZH_PRIM: TMemoField;
    Label71: TLabel;
    edZH_KLAD: TDBLookupComboboxEh;
    DokumentZH_ST_KLUM: TStringField;
    DokumentZH_BRON: TBooleanField;
    DokumentGT_TEXT: TStringField;
    DokumentGT_IS_TEXT: TBooleanField;
    DokumentINST_MN_ID: TIntegerField;
    DokumentPR_GOSUD: TIntegerField;
    DokumentPR_B_OBL: TBooleanField;
    DokumentPR_OBL: TStringField;
    DokumentPR_RAION: TStringField;
    DokumentPR_B_GOROD: TSmallintField;
    DokumentPR_GOROD: TStringField;
    DokumentPR_GOROD_R: TStringField;
    DokumentPR_DOM: TStringField;
    DokumentPR_KORP: TStringField;
    DokumentPR_KV: TStringField;
    gbPR: TGroupBox;
    Label8: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    edPR_GOSUD: TDBLookupComboboxEh;
    DBCheckBoxEh3: TDBCheckBoxEh;
    edPR_OBL: TDBEditEh;
    edPR_RAION: TDBEditEh;
    edPR_B_GOROD: TDBLookupComboboxEh;
    edPR_GOROD: TDBEditEh;
    edPR_DOM: TDBEditEh;
    edPR_KORP: TDBEditEh;
    edPR_KV: TDBEditEh;
    DBCheckBoxEh4: TDBCheckBoxEh;
    edPR_TEXT: TDBEditEh;
    edPR_GOROD_R: TDBEditEh;
    DokumentPR_TEXT: TStringField;
    DokumentUNOMER: TStringField;
    DokumentZH_UCH2: TStringField;
    DokumentZH_STAKAN: TStringField;
    pnTop: TPanel;
    Label19: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    lbDateS: TLabel;
    lbDateR: TLabel;
    lbVozr: TvchDBText;
    Label29: TLabel;
    lbSector: TLabel;
    lbRow: TLabel;
    lbMogila: TLabel;
    Label72: TLabel;
    Label59: TLabel;
    lbPlace: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    ENG_edIDENTIF: TDBEditEh;
    edDateS: TDBDateTimeEditEh;
    N_F_cbOnlyGod: TDBComboBoxEh;
    edTextDateS: TDBEditEh;
    edDateR: TDBDateTimeEditEh;
    N_F_cbOnlyGodR: TDBComboBoxEh;
    edTextVozr: TDBEditEh;
    edPol: TDBComboBoxEh;
    edSector: TDBEditEh;
    edRow: TDBEditEh;
    edMogila: TDBEditEh;
    edZH_Vid: TDBComboBoxEh;
    edDateZAH: TDBDateTimeEditEh;
    edPlace: TDBEditEh;
    pnKlum: TPanel;
    lbSklep: TLabel;
    lbKlum: TLabel;
    lbKlum2: TLabel;
    edSklep: TDBEditEh;
    edKlum: TDBEditEh;
    edStenaKlum: TDBEditEh;
    pnBotton: TPanel;
    gbDecl: TGroupBox;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    lbGT: TLabel;
    lbGT_OBL: TLabel;
    lbGT_RN: TLabel;
    lbGT_GOR: TLabel;
    lbGT_RNG: TLabel;
    Label48: TLabel;
    lbGT_DOM: TLabel;
    lbGT_KORP: TLabel;
    lbGT_KV: TLabel;
    Label67: TLabel;
    lbGT_UL: TLabel;
    Label74: TLabel;
    edDecl: TDBEditEh;
    edDECL_TEL: TDBEditEh;
    edDECL_MOB: TDBEditEh;
    edGT_GOSUD: TDBLookupComboboxEh;
    cbGT_B_OBL: TDBCheckBoxEh;
    edGT_GOROD: TDBEditEh;
    edGT_RNGOROD: TDBLookupComboboxEh;
    edGT_B_GOROD: TDBLookupComboboxEh;
    edGT_OBL: TDBEditEh;
    edGT_RAION: TDBEditEh;
    edGT_GOROD_R: TDBEditEh;
    edGT_DOM: TDBEditEh;
    edGT_KORP: TDBEditEh;
    edGT_KV: TDBEditEh;
    N_F_IsOrg: TDBCheckBoxEh;
    edUdost: TDBEditEh;
    edGT_TEXT: TDBEditEh;
    N_F_cbGT_IS_TEXT: TDBCheckBoxEh;
    lbKlumStakan: TLabel;
    edKlumStakan: TDBEditEh;
    DokumentBRON: TBooleanField;
    pcZah: TPageControl;
    tsBron: TTabSheet;
    tsAllZah: TTabSheet;
    Panel1: TPanel;
    btAdd: TBitBtn;
    btDel: TBitBtn;
    GridAddMen: TDBGridEh;
    tbAllZah: TkbmMemTable;
    tbAllZahFAMILIA: TStringField;
    tbAllZahNAME: TStringField;
    tbAllZahOTCH: TStringField;
    tbAllZahZH_MOG: TStringField;
    tbAllZahDATER: TDateField;
    tbAllZahDATES: TDateField;
    tbAllZahBOOK: TSmallintField;
    tbAllZahID: TIntegerField;
    tbAllZahDATEZ: TDateField;
    dsAllZah: TDataSource;
    GridAllMen: TDBGridEh;
    pnEnd: TPanel;
    Label58: TLabel;
    edUslug1: TDBEditEh;
    Label63: TLabel;
    edTRAN_VID: TDBEditEh;
    Label65: TLabel;
    edTRAN_TIME: TDBDateTimeEditEh;
    Label64: TLabel;
    edKVIT: TDBEditEh;
    edRukov: TDBEditEh;
    edSpec: TDBEditEh;
    lbRukov: TvchDBText;
    lbSpec: TvchDBText;
    pnSvid: TPanel;
    Label53: TLabel;
    Label60: TLabel;
    edSVID_NOMER: TDBEditEh;
    Label61: TLabel;
    edSVID_DATE: TDBDateTimeEditEh;
    Label62: TLabel;
    edSVID_ZAGS: TDBEditEh;
    tbAllZahNOMER: TStringField;
    tbAllZahPOLE_GRN: TSmallintField;
    DokumentUDOST: TStringField;
    pm: TPopupMenu;
    pmEnableEdit: TMenuItem;
    DokumentDECL_IN: TStringField;
    edUslug: TDBEditEh;
    DokumentUSLUG_SPR: TIntegerField;
    FIO_GISRN: TvchDBText;
    DokumentFAMILIA_GIS: TStringField;
    DokumentNAME_GIS: TStringField;
    DokumentOTCH_GIS: TStringField;
    DokumentZH_TYPE: TSmallintField;
    DokumentLOAD_CHECK: TIntegerField;
    edZH_TYPE: TDBComboBoxEh;
    lbZh_Type: TLabel;
    DokumentID_LOAD: TIntegerField;
    N_F_cbLoadCheck: TComboBox;
    N_F_lbStatus: TvchDBText;
    btLoadFIO: TBitBtn;
    DokumentLOAD_FIO: TBooleanField;
    pnZahRazm: TPanel;
    lbMogType: TLabel;
    edMOG_TYPE: TDBLookupComboboxEh;
    lbRazmer1: TLabel;
    edMOG_L: TDBNumberEditEh;
    lbRazmer2: TLabel;
    edMOG_W: TDBNumberEditEh;
    N_F_Rez: TDBCheckBoxEh;
    N_F_cbBron: TDBCheckBoxEh;
    TBItemNomerBook: TTBItem;
    DBGridEh2: TDBGridEh;
    DataSource1: TDataSource;
    DokumentBOOK: TIntegerField;
    Label21: TLabel;
    edSprNomer: TDBEditEh;
    DokumentZAPAKT_NOMER: TStringField;
    DokumentZAPAKT_DATE: TDateField;
    edSprDate: TDBDateTimeEditEh;
    Label32: TLabel;
    pnZapAkt: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    edZapAktNomer: TDBEditEh;
    Label54: TLabel;
    edZapAktDate: TDBDateTimeEditEh;
    Label56: TLabel;
    edZapAktZags: TDBEditEh;
    DokumentSPR_NOMER: TStringField;
    DokumentSPR_DATE: TDateField;
    DokumentZAPAKT_ZAGS: TStringField;
    DokumentDECL_DOK: TStringField;
    Label57: TLabel;
    edDeclDok: TDBEditEh;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edFamiliaEnter(Sender: TObject);
    procedure edNameEnter(Sender: TObject);
    procedure edOtchEnter(Sender: TObject);
    procedure edFamiliaCheckDrawRequiredState(Sender: TObject;   var DrawState: Boolean);
    procedure edRukov_AktEnter(Sender: TObject);
    procedure Label45Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure edSM_OBL_RNotInList(Sender: TObject; NewText: String;    var RecheckInList: Boolean);
    procedure edSM_RAION_RNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure N_F_cbOnlyGod_AktChange(Sender: TObject);
    procedure N_F_cbOnlyGodR_AktChange(Sender: TObject);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure edSdanDokEditButtons0Click(Sender: TObject;              var Handled: Boolean);
    procedure edDateR_AktUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edDateS_AktUpdateData(Sender: TObject; var Handled: Boolean);
    procedure TBItemTalonUbitClick(Sender: TObject);
    procedure edSOATOClick(Sender: TObject);
    procedure edIDENTIFUpdateData(Sender: TObject; var Handled: Boolean);
    procedure N_F_cbOnlyGodR_SvChange(Sender: TObject);
    procedure N_F_cbOnlyGod_SvChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lbVozr_AktGetText(Sender: TObject; var Text: String);
    procedure edFactEnter(Sender: TObject);
    procedure ENG_edPrOsnUpdateData(Sender: TObject; var Handled: Boolean);
    procedure TBItemRegPrSmertClick(Sender: TObject);
    procedure edDeclDokEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure edDeclEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edDecl_AdresEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure btAddClick(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure edDeclUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edPrOsn_NameEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edZH_KLADChange(Sender: TObject);
    procedure edMOG_TYPE1Change(Sender: TObject);
    procedure edFamiliaEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edFamiliaEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure edDateZAHUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edAktSostEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edSpecEditButtons0Click(Sender: TObject;         var Handled: Boolean);
    procedure Edit1Enter(Sender: TObject);
    procedure edMOG_TYPEChange(Sender: TObject);
    procedure N_F_cbGT_IS_TEXTClick(Sender: TObject);
    procedure edDateZUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edINST_MN_NAMEEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure GridAllMenGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure edPlaceKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure edMogilaEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edPlaceEditButtons0Click(Sender: TObject;       var Handled: Boolean);
    procedure edSectorCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
    procedure edRowCheckDrawRequiredState(Sender: TObject;     var DrawState: Boolean);
    procedure edPlaceCheckDrawRequiredState(Sender: TObject;   var DrawState: Boolean);
    procedure edMogilaCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
    procedure edSectorUpdateData(Sender: TObject; var Handled: Boolean);
    procedure tbAllZahAfterScroll(DataSet: TDataSet);
    procedure GridAllMenColumns0GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
    procedure pmEnableEditClick(Sender: TObject);
    procedure edUslugEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure edZH_TYPEChange(Sender: TObject);
    procedure N_F_cbLoadCheckChange(Sender: TObject);
    procedure N_F_lbStatusGetText(Sender: TObject; var Text: String);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btLoadFIOClick(Sender: TObject);
    procedure FIO_GISRNGetText(Sender: TObject; var Text: String);
    procedure TBItemNomerBookClick(Sender: TObject);
    procedure dsAddMenDataChange(Sender: TObject; Field: TField);
    procedure dsAllZahDataChange(Sender: TObject; Field: TField);
  private
//    H : THintWindow;
    procedure OnDestroyHint( Sender : TObject);
//    procedure SetIDZags;
  public
    { Public declarations }
//  FControlFIOGIS:Boolean;
    mtBooks:TDataSet;
    FLoadGisunZAH:Boolean;
    FLoadCSV:Boolean;
    FKontNomer:Integer;
    arrCont: array [0..5] of Integer;
    FGlobalKlad:Boolean;
    FTypeGlobal:Integer;
    FTypeNewNum:Integer;
    FNewDate:TDateTime;
    FSecUch:Boolean;
    FCheckSector:Boolean;
    FCheckMog:Boolean;
    FCheckUch:Boolean;
    FCheckRad:Boolean;
    FEmptyKlad:Boolean;
    FGisrnKlad:Integer;
    FRunTalonUbit : Boolean;
    FCheckSOATO:Boolean;
    TbItemEmptyPrich: TTbItem;
    TbItemVerno: TTbItem;
    TbItemEnableEdit: TTbItem;

    function ReadAllMenUch(vKlad:Variant; sPlace:String):Boolean;
    function WriteAllMenUch:Boolean;

    procedure Event_LastNomerMog(Sender: TObject; var Handled:Boolean);
    procedure Event_EmptyPrich(Sender: TObject);
    procedure Event_TrueAkt(Sender: TObject);
    procedure Event_Check(Sender: TObject);
    procedure Event_TextVozr(Sender: TObject);
    procedure AfterCheckAkt_GISUN(nType:Integer); override;
    procedure KLADChange(Value:Variant);
    procedure CheckSectorUch(lVkl:Boolean);

    procedure WM_CloseMRUList(var rec:TMsg); message WM_CLOSE_MRULIST;

    function EmptyIzm: String; override;
    function CreateSubMenuRun: Boolean; override;

    procedure CheckSoatoAkt(lVoenkom:Boolean);
    procedure WriteSoato(fld:TField; lVoenkom:Boolean);
    function WriteDok : Boolean; override;
    procedure WriteDvigMen(nIdMen:Integer);

    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure UpdateActions; override;
    procedure SetValuesFromKlad(nID:Integer; lOnlyCheck:Boolean);
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    function BeforeEdit : Boolean; override;
    function SaveToIni : Boolean; override;
    procedure LoadFromIni; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure CheckOnlyGod(lSv:Boolean);
    function CheckDokumentSimple(nType:Integer; lWriteDok:Boolean):Boolean; override;
    procedure SetOnlyPovtorSvid(lOnlyPovtor:Boolean;pc:TPageControl; ts:TWinControl; NonVisibleControls : array of TVarRec; lbSvid,lbNomer:TLabel); override;

    function SetNewNomerDok(lSetDate:Boolean=false):Integer; override;   // новый номер
    procedure CheckOnlyGodR(lSv:Boolean);
    procedure CheckControlZAH(lAdd:Boolean; lGisun:Boolean);
    procedure CheckControlGT(lString:Boolean);
    procedure CheckControlType(nType:Integer);
    procedure CheckUslug;
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;
    function IsRegisterGisun : Boolean; override;
    procedure Run_GetNumberBook;
    procedure Run_ReadListBooks(nKlad:Integer);

  end;

  function EditAktZ( var nID : Integer; slPar:TStringList) : Boolean;

var
  fmAktZ: TfmAktZ;

implementation

uses dBase, fMain, fChoiceNasel, fVvodDecl, fShablon, fEnterDokument, uCheckKod, fEnterAdresat;

{$R *.DFM}

function EditAktZ( var nID : Integer; slPar:TStringList) : Boolean;
begin
//  result := true;
  fmAktZ:=TfmAktZ.Create(nil);
  fmAktZ.AssignPar(slPar);
  try
    fmAktZ.IsReadDokument:=true;
    if nID=-1 then begin
      fmAktZ.NewDok(true);
      fmAktZ.SetIDZags;
      fmAktZ.CheckEnabledNameOrgan(true);
    end else begin
      fmAktZ.ReadDok( nID );
      fmAktZ.TBItemZAGS.Visible:=false;
      fmAktZ.CheckEnabledNameOrgan(false);
    end;
    fmAktZ.IsReadDokument:=false;
    {$IFDEF GISUN}
      fmAktZ.CheckAkt_GISUN(0);
//      Gisun.CheckSmert(fmZapisSmert);
//      fmZapisSmert.CheckImageGisun(fmZapisSmert.DokumentPOLE_GRN,fmZapisSmert.ImageGISUN);
      fmAktZ.BeforeEditFormGISUN;
    {$ELSE}

    {$ENDIF}
    Result   := fmAktZ.EditModal;
    nID := fmAktZ.DokumentID.AsInteger;
  finally
    fmAktZ.Free;
    fmAktZ := nil;
  end;
end;

{ TfmAktZ }

constructor TfmAktZ.Create(Owner: TComponent);
var
  n:Integer;
  d2xml:TDataSet2XML;
  i,n1,n2:Integer;
  iniSpr : TSasaIniFile;
  s:String;
begin
  inherited;
  if not Dokument.Active   then Dokument.Active:=true;
  if not tbAddMen.Active   then tbAddMen.Active:=true;
  if not tbAllZah.Active   then tbAllZah.Active:=true;

  GridAllMen.Columns[COL_MOG].Visible:=IsActiveGISUN;

  arrCont[0]:=lbRow.Left;
  arrCont[1]:=edRow.Left;
  arrCont[2]:=lbPlace.Left;
  arrCont[3]:=edPlace.Left;
  arrCont[4]:=lbMogila.Left;
  arrCont[5]:=edMogila.Left;

  FLoadCSV:=GlobalTask.ParamAsBoolean('ENABLE_LOAD_CSV');
  FLoadGisunZAH:=GlobalTask.ParamAsBoolean('LOAD_GISUN_ZAH');

  dsKlad.DataSet:=dmBase.SprZAH;
  pnKlum.Visible:=GlobalTask.ParamAsBoolean('ENABLE_KLUM');

  edZH_TYPE.Visible:=pnKlum.Visible;
  lbZH_TYPE.Visible:=pnKlum.Visible;
  mtBooks:=CreateTableBooks;
  mtBooks.Open;
  DataSource1.DataSet:=mtBooks;

  N_F_Rez.Visible:=GlobalTask.ParamAsBoolean('VISIBLE_REZ');
  // переключим на текущую сортировку
  iniSpr:=GlobalTask.iniFile('SPR');
  if iniSpr<>nil then begin
    s:=iniSpr.ReadString('FormSpr.SprZAH.Form','INDEXNAME','');
    if (s<>'') then begin
      try
        if dmBase.SprZAH.IndexName<>s
          then dmBase.SprZAH.IndexName:=s;
      except
      end;
    end;
  end;

//  FControlFIOGIS:=GlobalTask.ParamAsBoolean('CONT_FIO_GIS');
  FRegisterNotRequired:=true;  // доступно "взаимодействие с ГИС РН не требуется"
  FSecUch:=false;
  FCheckSector:=false;
  FCheckRad:=false;
  FCheckMog:=true;
  FCheckUch:=true;

  FEmptyKlad:=true;
  FGisRnKlad:=0;
  
  AddSubmenu_NotRequired;

  n:=GlobalTask.ParamAsInteger('ZAH_TYPENUM');
  if n=0
    then FTypeNewNum:=NUM_KLAD_BOOK
    else FTypeNewNum:=n;
  FNewDate:=-1;

  d2xml:=ds2xml.DS_Add(Dokument,true);
  d2xml.FClearRecord:=false;
  d2xml.FWriteNull:=false;
  d2xml.SetWriteFields(
     'SM_GOSUD;SM_B_OBL;SM_OBL;SM_RAION;SM_GOROD_R;SM_B_GOROD;SM_GOROD;SM_DOM;SM_KORP;SM_KV;SM_TEXT;'+
     'PR_GOSUD;PR_B_OBL;PR_OBL;PR_RAION;PR_GOROD_R;PR_B_GOROD;PR_GOROD;PR_DOM;PR_KORP;PR_KV;PR_TEXT;'+
     'PR_OSN;PR_OSN_NAME;RG_B_RESP;RG_GOSUD;RG_B_OBL;RG_OBL;RG_RAION;RG_B_GOROD;RG_GOROD;'+
     'ZH_PRICH;RAZR_DATE;RAZR_ORGAN;RAZR_FIO;PR_OSN_NAME;PR_OSN;DOKUMENT;PRIL_LIST;TEXT_VOZR;TEXT_DATES;DOLG_RUKOV;'+
     'DOLG_SPEC;AKT_SOST;ORG;ORG_UNP;ZH_SS;ZH_WORK;ZH_PRIM;INST_MN_ADRES;SPR_NOMER;SPR_DATE;ZAPAKT_NOMER;ZAPAKT_DATE;ZAPAKT_ZAGS;DECL_DOK'
     );
  d2xml:=ds2xml.DS_Add(tbAddMen,false);

  //FCharCase:=1;     // 0-ecNormal, 1-ecUpperCase, 2-ecLowerCase
//  ts1.TabVisible:=false;
  slGo:=TStringList.Create;
//  slGo.Add('down->BLR_edSM_Gorod=edSmertPosl');
//  slGo.Add('up->BLR_edSM_OBL=edGRAG');

  FFirstControl:=edFamilia;
  FCheckSVIDControl:=true;
//  CheckPanelMestoGit;
  dsNameZah.DataSet:=dmBase.SprRazmer;
  FCheckLookupField:=false;
  FRunTalonUbit:=false;

  FDokZAGS := false;
  FDokRegister := true; // !!!

  TypeObj := _TypeObj_AktZAH;
  FUpdatingObj:=GetUpdatingObj(TypeObj);

  {$IFDEF LAIS}
    FAutoNum:=true; //IsAutoNumZAGS;
  {$ELSE}
    FAutoNum:=GlobalTask.ParamAsBoolean('AUTO_NUM_ZAH'); //IsAutoNumZAGS;
  {$ENDIF}
  FKontNomer:=Globaltask.ParamAsInteger('KONT_NOMERAKT');   // 0-не контролировать  1-жесткий контроль  2-контроль с запросом

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAdd.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDel.Glyph);


  {$IFDEF ZAH}
    tsBron.TabVisible:=GlobalTask.ParamAsBoolean('ENABLE_BRON');
    tsAllZah.TabVisible:=GlobalTask.ParamAsBoolean('ENABLE_ALLMEN');
    pcZah.Visible:=(tsBron.TabVisible or tsAllZah.TabVisible);
    if not GlobalTask.ParamAsBoolean('ENABLE_AKT') then begin
      tsAkt.TabVisible:=false;
    end;
    n:=11;
  {$ELSE}
    tsBron.TabVisible:=GlobalTask.ParamAsBoolean('ENABLE_BRON');
    tsAllZah.TabVisible:=false;
    pcZah.Visible:=(tsBron.TabVisible or tsAllZah.TabVisible);
    tsAkt.TabVisible:=false;
    n:=7;
//    for n:=0 to pc.PageCount-1 do begin
//      pc.Pages[n].TabVisible:=false;
//    end;
  {$ENDIF}
  if Role.SystemAdmin then begin
    tsBron.TabVisible:=true;
    tsAllZah.TabVisible:=true;
    pcZah.Visible:=true;
    pcZah.ActivePage:=tsAllZah;
  end;
  edPlace.EditButtons[0].Visible:=tsAllZah.TabVisible;

  pc.ActivePage:=ts1;

  SetLength(FArrChoiceRekv,n);
  {
  FArrChoiceRekv[0].nType:=0;
  FArrChoiceRekv[0].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[0].FieldName:='WORK_NAME';
  }
  i:=0;
  FArrChoiceRekv[i].nType:=SHABLON_NAME_ZAGS;
  FArrChoiceRekv[i].FieldName:='SVID_ZAGS';
  Inc(i,1);
  FArrChoiceRekv[i].nType:=SHABLON_TRAN;
  FArrChoiceRekv[i].FieldName:='TRAN_VID';
  { 
  Inc(i,1);
  FArrChoiceRekv[i].nType:=SHABLON_USLUG;
  FArrChoiceRekv[i].FieldName:='USLUG';
  }
  Inc(i,1);
  FArrChoiceRekv[i].nType:=0;
  FArrChoiceRekv[i].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[i].FieldName:='GT_GOROD_R';
  Inc(i,1);
  FArrChoiceRekv[i].nType:=0;
  FArrChoiceRekv[i].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[i].FieldName:='SM_GOROD_R';
  Inc(i,1);
  FArrChoiceRekv[i].nType:=0;
  FArrChoiceRekv[i].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[i].FieldName:='PR_GOROD_R';

  Inc(i,1);
  {$IFDEF ZAH}
    FArrChoiceRekv[i].nType:=SHABLON_DOK_SMERT;
  {$ELSE}
    FArrChoiceRekv[i].nType:=SHABLON_SP_SM;
  {$ENDIF}
  FArrChoiceRekv[i].FieldName:='DOKUMENT';

  {$IFDEF ZAH}
    Inc(i,1);
    FArrChoiceRekv[i].nType:=SHABLON_RAZR_ORGAN;
    FArrChoiceRekv[i].FieldName:='RAZR_ORGAN';
    Inc(i,1);
    FArrChoiceRekv[i].nType:=SHABLON_ZH_PRICH;
    FArrChoiceRekv[i].FieldName:='ZH_PRICH';
    Inc(i,1);
    FArrChoiceRekv[i].nType:=SHABLON_SM_PRICH;
    FArrChoiceRekv[i].FieldName:='PR_OSN_NAME';
    Inc(i,1);
    FArrChoiceRekv[i].nType:=SHABLON_USLUG;
    FArrChoiceRekv[i].FieldName:='DECL';
  {$ENDIF}

//  CheckControl;

  AddButton_LoadIdentif(ENG_edIDENTIF);
//  AddButton_Plus(edMogila, Event_LastNomerMog, 'Определить номер могилы');

  FMainTable := dmBase.AktZ;
  dsGragd.DataSet := dmBase.SprGragd;

  FPageControl := pc;
//  pc.OwnerDraw:=true;
//  pc.OnDrawTab:=PageControlDrawTab;

  pc.ActivePageIndex:=0;

//  CheckPageControl(pc);
  edFamilia.OnExit := OnDestroyHint;
  edName.OnExit    := OnDestroyHint;
  edOtch.OnExit    := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;
//  fmMain.SetCurrentDokument(Dokument);

  edDateS.Tag:=Integer(Pointer(N_F_cbOnlyGod));
  edDateR.Tag:=Integer(Pointer(N_F_cbOnlyGodR));

  FGlobalKlad:=GlobalTask.ParamAsBoolean('GLOBAL_KLAD');  // глобальный номер в разрезе кладбищ
  FTypeGlobal:=GlobalTask.ParamAsInteger('ADD_GL_NOMER');  // 0-нет  1-числовой  2-текстовый

  if FTypeGlobal>0 then begin
    if FTypeGlobal=2 //GL_TEXT
      then edNomer2.DataField:='UNOMER'
      else edNomer2.DataField:='NOMER2';
    lbNomer2.Visible:=true;
    edNomer2.Visible:=true;
  end else begin
    lbDateZ.Left:=lbNomer2.Left+20;
    edDateZ.Left:=lbDateZ.Left+lbDateZ.Width+15;
  end;

  {$IFDEF LAIS}
    edFamilia.EditButtons[1].Glyph := edDecl.EditButtons[0].Glyph;
    edFamilia.EditButtons[1].Visible:=true;
    edFamilia.EditButtons[0].Visible:=true;
    edDecl.EditButtons[0].Visible:=true;
    edINST_MN_NAME.EditButtons[0].Glyph := edDecl.EditButtons[0].Glyph;
    edINST_MN_NAME.EditButtons[0].Visible:=true;
  {$ELSE}
    edFamilia.EditButtons[0].Visible:=false;
    edFamilia.EditButtons[1].Visible:=false;
    edDecl.EditButtons[0].Visible:=false;
    edINST_MN_NAME.EditButtons[0].Visible:=false;
  {$ENDIF}

  edUslug.EditButtons[1].Glyph:=ImBtClear.Picture.Bitmap;

//  edUslug.EditButtons[0].Hint := edStud_Place.EditButtons[0].Hint;


  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
    n:=15;
//      cbOnlyGod.Width := GetTextWidth(cbOnlyGod.Items[2],cbOnlyGod.Font.Height,cbOnlyGod.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE); //+5;
    // смерть
    N_F_cbOnlyGod.ClientWidth := GetTextWidth(N_F_cbOnlyGod.Items[2],N_F_cbOnlyGod.Font.Height,N_F_cbOnlyGod.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE)+n; //+5;
    lbDateS.Caption := '';
    N_F_cbOnlyGod.Left  := lbDateS.Left+lbDateS.Width+5;
    edDateS.Left := N_F_cbOnlyGod.Left+N_F_cbOnlyGod.Width+5;
      // акт
    N_F_cbOnlyGod_Akt.ClientWidth := GetTextWidth(N_F_cbOnlyGod.Items[2],N_F_cbOnlyGod.Font.Height,N_F_cbOnlyGod.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE)+n; //+5;
    lbDateS_Akt.Caption := '';
    N_F_cbOnlyGod_Akt.Left  := lbDateS.Left+lbDateS.Width+5;
    edDateS_Akt.Left := N_F_cbOnlyGod.Left+N_F_cbOnlyGod.Width+5;

    // рождения
    N_F_cbOnlyGodR.ClientWidth := GetTextWidth(N_F_cbOnlyGodR.Items[2],N_F_cbOnlyGodR.Font.Height,N_F_cbOnlyGodR.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE)+n; //+5;
    lbDateR.Caption := '';  // '13.'
    N_F_cbOnlyGodR.Left  := lbDateR.Left+lbDateR.Width+5;
    edDateR.Left := N_F_cbOnlyGodR.Left+N_F_cbOnlyGodR.Width+5;

//!!!    lbVozr.Left:=edDateR.Left+edDateR.Width+12;
    lbVozr.Left:=edDateS.Left+edDateS.Width+12;

    N_F_cbOnlyGodR_Akt.ClientWidth := GetTextWidth(N_F_cbOnlyGodR.Items[2],N_F_cbOnlyGodR.Font.Height,N_F_cbOnlyGodR.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE)+n; //+5;
    lbDateR_Akt.Caption := '';  // '13.'
    N_F_cbOnlyGodR_Akt.Left  := lbDateR.Left+lbDateR.Width+5;
    edDateR_Akt.Left := N_F_cbOnlyGodR.Left+N_F_cbOnlyGodR.Width+5;

  end else begin
    N_F_cbOnlyGod.Visible:=false;
    N_F_cbOnlyGodR.Visible:=false;
  end;

//  edTextVozr.Left:=lbVozr.Left+lbVozr.Width+100;

  edFamilia.OnUpdateData:=FIOUpdateDataP;
  edName.OnUpdateData:=FIOUpdateDataP;
  edOtch.OnUpdateData:=FIOUpdateDataP;
  edFamilia_Akt.OnUpdateData:=FIOUpdateDataP;
  edName_Akt.OnUpdateData:=FIOUpdateDataP;
  edOtch_Akt.OnUpdateData:=FIOUpdateDataP;

  ENG_edIdentif.OnUpdateData:=IN_UpdateData;
   {
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end; }

//  SetVisibleNomerEkz(pn, edDateSv, N_F_1);

  {$IFDEF GISUN}
  if IsActiveGISUN then
    SetControlCharCase(ecUpperCase,
      [  edFamilia, edName, edOtch ]);
  {$ENDIF}

  edGT_RNGOROD.OnUpdateData:=CityUpdate;

  edSM_GOROD.OnUpdateData:=CityUpdate;
  edPR_GOROD.OnUpdateData:=CityUpdate;
  edRG_GOROD.OnUpdateData:=CityUpdate;
//  edZH_GOROD.OnUpdateData:=CityUpdate;
  edGT_GOROD.OnUpdateData:=CityUpdate;
  edZH_GOROD_AKT.OnUpdateData:=CityUpdate;

  edGT_RAION.OnUpdateData:=CityUpdate;
  edSM_RAION.OnUpdateData:=CityUpdate;
  edPR_RAION.OnUpdateData:=CityUpdate;
  edRG_RAION.OnUpdateData:=CityUpdate;
  edZH_RAION.OnUpdateData:=CityUpdate;

  edGT_OBL.OnUpdateData:=CityUpdate;
  edSM_OBL.OnUpdateData:=CityUpdate;
  edPR_OBL.OnUpdateData:=CityUpdate;
  edRG_OBL.OnUpdateData:=CityUpdate;
  edZH_OBL.OnUpdateData:=CityUpdate;


  n:=0;
  SetLength(FArrAddProperty,n);
//  SetAddProperty(0, 'OTHER', '', ftMemo);
//  SetAddProperty(1, 'IZMEN', '', ftMemo);
//  SetAddProperty(1, 'DECL_DOK', '', ftMemo);
//  SetAddProperty(1, 'TEXT_VOZR', '', ftString);
//  SetAddProperty(2, 'TEXT_DATES', '', ftString);

  SetcbBel(N_F_cbBelorus);

  SetLength(FArrCheckBelField,0);
  {
  SetLength(FArrCheckBelField,3);
  WriteToArrCheck(0,  1, false, 'SM_OBL'      , 'SM_OBL_B');
  WriteToArrCheck(1,  2, false, 'SM_RAION'    , 'SM_RAION_B');
  WriteToArrCheck(2,  3, true,  'SM_GOROD'    , 'SM_GOROD_B');}

  SetLength(FArrCheckField,4);
  WriteToArrCheck(0,  1, false, 'GT_OBL'    );
  WriteToArrCheck(1,  2, false, 'GT_RAION'  );
  WriteToArrCheck(2,  3, true,  'GT_GOROD'  );
  WriteToArrCheck(3,  4, false, 'GT_RNGOROD');
//  WriteToArrCheck(2,  1, false, 'RG_OBL'    );
//  WriteToArrCheck(3,  2, false, 'RG_RAION'  );

//  SetPanelPovtor(tsPovtor, N_F_cbPovtor, Label41, Label42);

  //-------- доступен код причины смерти ---------------------------------------
//  ENG_edPrNep.Enabled   := true; //GlobalTask.ParamAsBoolean('SMERT_KOD');
//  ENG_edPrOsn.Enabled   := edPrOsn_Name.Enabled; // and GlobalTask.ParamAsBoolean('SMERT_KOD');
//  ENG_edPrMesto.Enabled := edPrMesto_Name.Enabled and GlobalTask.ParamAsBoolean('SMERT_KOD');


  //-------- доступна непосредств. причина ---------------------------------------
{  if GlobalTask.ParamAsBoolean('SMERT_NEP_PR') then begin
    edPrNep_Name.Enabled:=true;
  end else begin
    edPrNep_Name.Enabled:=false;
    ENG_edPrNep.Enabled:=false;
  end;  }
  //-------- доступно место и обстоятельство ---------------------------------------
  {
  if GlobalTask.ParamAsBoolean('SMERT_MESTO') then begin
    edPrMesto_Name.Enabled:=true;
  end else begin
    edPrMesto_Name.Enabled:=false;
    ENG_edPrMesto.Enabled:=false;
  end;
  }
            
  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := IsActiveGISUN;
    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN;
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
  TBItemHistCorr.Visible:=FUpdatingObj;

  if not GlobalTask.ParamAsBoolean('EDIT_ZH') then begin
    edZH_GOSUD.ReadOnly:=true;
    edZH_OBL.ReadOnly:=true;
    cbZH_B_OBL.ReadOnly:=true;
    edZH_Raion.ReadOnly:=true;
//    edZH_B_GOROD.ReadOnly:=true;
//    edZH_GOROD.ReadOnly:=true;
    edZH_B_GOROD_Akt.ReadOnly:=true;
    edZH_GOROD_Akt.ReadOnly:=true;
    edZH_GOSUD.Color:=GetDisableColor;
    edZH_OBL.Color:=edZH_GOSUD.Color;
    edZH_Raion.Color:=edZH_GOSUD.Color;
//    edZH_B_GOROD.Color:=edZH_GOSUD.Color;
//    edZH_GOROD.Color:=edZH_GOSUD.Color;
    edZH_B_GOROD_Akt.Color:=edZH_GOSUD.Color;
    edZH_GOROD_Akt.Color:=edZH_GOSUD.Color;
//    edBOOK.ReadOnly:=true;
//    edBOOK.Color:=edZH_GOSUD.Color;
  end;

  FCountPodpis:=Podpis_Init('SPR_ZAH');
  if FCountPodpis<2 then begin
    edSpec.Visible:=false;
    lbSpec.Visible:=false;
    edSpec_Akt.Visible:=false;
    lbSpec_Akt.Visible:=false;
  end;

end;

destructor TfmAktZ.Destroy;
begin
  slGo.Free;
  dbClose(mtBooks);
  DestroyHint(H);
  inherited;
end;
{
procedure TfmZapisSmert.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
function TfmAktZ.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_AktZAH); //
end;
//-------------------------------------------------------------------
function TfmAktZ.SetNewNomerDok(lSetDate: Boolean): Integer;
var
  s,sAdd:String;
  n:Integer;
  d:TDateTime;
begin
  Result:=0;
  if FAutoNum and ((DokumentID.AsInteger<=0) or FEmptyKlad or (FNewDate>-1)) and (DokumentBOOK.AsString<>'') then begin
    if lSetDate
      then s:='корректирует'
      else s:='создает';     // вызов из NewDok
    if dmBase._LockTypeObj(_TypeObj_AktZah, 'Другой пользователь '+s+' запись ...', true) then begin
      if DokumentID.AsInteger<=0
        then sAdd:=''
        else sAdd:=' and  id<>'+DokumentID.AsString;
      try
        EditDataSet(Dokument);
        try
          dmBase.WorkQuery.SQL.Text:='select max(nomer) from AktZ where ';
          case FTypeNewNum of
            NUM_KLAD_BOOK: s:='zh_klad='+DokumentZH_KLAD.AsString+' and book='+DokumentBOOK.AsString+sAdd;   // кладбище+книга
            NUM_KLAD     : s:='zh_klad='+DokumentZH_KLAD.AsString+sAdd;                                      // кладбище
            NUM_KLAD_YEAR: begin
                             d:=0;
                             if FNewDate>-1 then begin
                               d:=FNewDate;
                             end else begin
                               if not DokumentDATEZ.IsNull then d:=DokumentDATEZ.AsDateTime;
                             end;
                             if d>0
                               then s:='zh_klad='+DokumentZH_KLAD.AsString+' and Year(datez)='+IntToStr(YearOf(d))+sAdd;   // кладбище+год
                           end;
          else
            s:='zh_klad='+DokumentZH_KLAD.AsString+sAdd;   // кладбище
          end;
          dmBase.WorkQuery.SQL.Text:='select max(nomer) from AktZ where '+s;

          dmBase.WorkQuery.Open;
          n:=dmBase.WorkQuery.Fields[0].AsInteger;
          dmBase.WorkQuery.Close;
          DokumentNOMER.AsInteger:=n+1;
        except
          DokumentNOMER.AsString:='';
        end;
        if (not lSetDate or FGlobalKlad) and edNOMER2.Visible and (FTypeGlobal=1) then begin // если числовой глобальный номер
          try
            dmBase.WorkQuery.SQL.Text:='select max(nomer2) from AktZ';
            if FGlobalKlad then begin
              dmBase.WorkQuery.SQL.Text:=dmBase.WorkQuery.SQL.Text+' where zh_klad='+DokumentZH_KLAD.AsString+sAdd;
            end;
            dmBase.WorkQuery.Open;
            n:=dmBase.WorkQuery.Fields[0].AsInteger;
            dmBase.WorkQuery.Close;
            DokumentNOMER2.AsInteger:=n+1;
          except
          end;
        end;
      finally
        dmBase._UnLockTypeObj(_TypeObj_AktZah);
      end;
    end;
  end;
end;
//-------------------------------------------------------------------
function TfmAktZ.NewDok( lAppend : Boolean ): Boolean;
var
  n:Integer;
//  SOATO : TSOATO;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  FEmptyKlad:=true;
  FGisRnKlad:=0;

  // см. Podpis_Init();
  if lAppend then begin
    DokumentDOLG_RUKOV.AsString := Podpis_Dolg(1);
    DokumentRUKOV.AsString := Podpis_FIO(1);
    if FCountPodpis>1 then begin
      DokumentDOLG_SPEC.AsString := Podpis_Dolg(2);
      DokumentSPEC.AsString := Podpis_FIO(2);
    end;
  end;
  DokumentIS_ORG.AsBoolean:=false;
  DokumentGT_IS_TEXT.AsBoolean:=false;
  DokumentSM_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentRG_B_GOROD.AsInteger:=DokumentSM_B_GOROD.AsInteger;
  DokumentZH_B_GOROD.AsInteger:=DokumentSM_B_GOROD.AsInteger;
  DokumentBRON.AsBoolean:=false;
  DokumentZH_BRON.AsBoolean:=false;
  if edZH_TYPE.Visible
    then DokumentZH_TYPE.AsInteger:=1
    else DokumentZH_TYPE.AsInteger:=0;
  DokumentZH_VID.AsInteger:=1;
//  DokumentID_LOAD.AsInteger:=0;

  DokumentBOOK.AsString:=''; //AsInteger:=1;

  DokumentSVID_ZAGS.AsString:=Globaltask.GetLastValueAsString('LAST_ZAGS');

  DokumentDUBL_SPR.AsBoolean:=false;
  DokumentPOVTOR.AsBoolean:=false;
  DokumentRESH_SUDA.AsBoolean:=false;

  DokumentSM_B_RESP.AsBoolean:=true;
  DokumentSM_B_OBL.AsBoolean:=true;
  DokumentRG_B_RESP.AsBoolean:=true;
  DokumentRG_B_OBL.AsBoolean:=true;
  DokumentZH_B_RESP.AsBoolean:=true;
  DokumentZH_B_OBL.AsBoolean:=true;

  DokumentONLYGOD.AsInteger:=0;
  DokumentONLYGOD_R.AsInteger:=0;

  DokumentBOMG.AsBoolean:=false;

  if lAppend then begin
    n:=Globaltask.GetLastValueAsInteger('CUR_KLAD');
    if (n>0) then begin
      DokumentZH_KLAD.AsInteger:=n;
      SetValuesFromKlad(n,false);
    end;
  end;

  if GlobalTask.ParamAsBoolean('SM_SPR_A5')
    then DokumentREPORT_SIZE.AsString:='A5'
    else DokumentREPORT_SIZE.AsString:='';

  DokumentFirst_Ekz.AsBoolean:=true;
  DokumentPROV.AsBoolean := false;
  N_F_cbBelorus.Checked:=false;

  DokumentEMPTY_PRICH.AsBoolean:=false;

  inherited NewDok(lAppend);

  CheckControlZAH(lAppend,false);
  CheckControlGT(DokumentGT_IS_TEXT.AsBoolean);
  CheckUslug;
  CheckControlType(DokumentZH_TYPE.AsInteger);

  CheckForAll_Bel(DokumentSM_OBL);
  CheckForAll_Bel(DokumentSM_RAION);

  WriteSoato(DokumentSOATO,true);
  FCheckSOATO:=false;

  QueryExit:=false;
  Result := true;
end;
//----------------------------------------------
function TfmAktZ.CheckDateEditGIS:Boolean;
begin
  if (DokumentZH_KLAD.AsString<>FMainTable.FieldByName('ZH_KLAD').AsString) or
     (DokumentBOOK.AsString<>FMainTable.FieldByName('BOOK').AsString) or
     (DokumentZH_UCH.AsString<>FMainTable.FieldByName('ZH_UCH').AsString) or
     (DokumentZH_RAD.AsString<>FMainTable.FieldByName('ZH_RAD').AsString) or
     (DokumentZH_UCH2.AsString<>FMainTable.FieldByName('ZH_UCH2').AsString) or
     (DokumentZH_MOG.AsString<>FMainTable.FieldByName('ZH_MOG').AsString) or
     (DokumentZH_ST_KLUM.AsString<>FMainTable.FieldByName('ZH_ST_KLUM').AsString) or
     (DokumentZH_KLUM.AsString<>FMainTable.FieldByName('ZH_KLUM').AsString) or
     (DokumentZH_STAKAN.AsString<>FMainTable.FieldByName('ZH_STAKAN').AsString) or
     (DokumentZH_SKLEP.AsString<>FMainTable.FieldByName('ZH_SKLEP').AsString) or
     (DokumentLICH_NOMER.AsString<>FMainTable.FieldByName('LICH_NOMER').AsString)
   then Result:=true
   else Result:=false;
end;

//---------------------------------------------------------------------------------
function TfmAktZ.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField,s,ss : String;
begin
  Result := true;
  if not dmBase.AktZ.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  DokumentDOLG_RUKOV.AsString:='';
  DokumentRUKOV.AsString:='';
  DokumentDOLG_SPEC.AsString:='';
  DokumentSPEC.AsString:='';

  for i:=0 to dmBase.AktZ.FieldCount-1 do begin
    strField := dmBase.AktZ.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.AktZ.Fields[i]);
    end;
  end;
  if DokumentZH_KLAD.IsNull or (DokumentZH_KLAD.AsInteger=0) then begin
    FEmptyKlad:=true;
  end else begin
    FEmptyKlad:=false;
    SetValuesFromKlad(DokumentZH_KLAD.AsInteger,true);
  end;

  DokumentEMPTY_PRICH.AsBoolean:=false;
  SetIDZags;

  ReadDopProperty(_TypeObj_AktZAH, DokumentID.AsInteger, STOD('1899-12-30',tdAds));

  tbAddMen.EmptyTable;
  tbAddMen.ResetAutoInc;

  s:=DokumentSVID_ZAGS.AsString;   // !!! есть и в XML и в базе
  ss:=DokumentUSLUG.AsString;      // !!! есть и в XML и в базе
  ds2xml.StringToXML(dmBase.AktZ.FieldByName('ADD_FIELDS').AsString);
  ds2xml.XMLToData;
  tbAddMen.First;
  EditDataSet(Dokument);
  if s<>''  then DokumentSVID_ZAGS.AsString:=s;   // !!! есть и в XML и в базе
  if ss<>'' then DokumentUSLUG.AsString:=ss;      // !!! есть и в XML и в базе

  if DokumentIS_AKT.IsNull
    then DokumentIS_AKT.AsBoolean:=false;
  if (DokumentAKT_NOMER.AsString<>'') then begin
    DokumentIS_AKT.AsBoolean:=true;
  end;

//  if DokumentDUBL_SPR.IsNull then DokumentDUBL_SPR.AsBoolean:=false;
  if DokumentRESH_SUDA.IsNull then DokumentRESH_SUDA.AsBoolean:=false;
  if DokumentONLYGOD.IsNull   then DokumentONLYGOD.AsInteger:=0;
  if DokumentONLYGOD_R.IsNull then DokumentONLYGOD_R.AsInteger:=0;
//  if DokumentBOMG.IsNull      then DokumentBOMG.AsBoolean:=false;
  if DokumentBRON.IsNull      then DokumentBRON.AsBoolean:=false;
  if DokumentZH_BRON.IsNull   then DokumentZH_BRON.AsBoolean:=false;
  if DokumentIS_ORG.IsNull    then DokumentIS_ORG.AsBoolean:=false;
  if DokumentGT_IS_TEXT.IsNull then DokumentGT_IS_TEXT.AsBoolean:=false;
  if DokumentMEN_ID.IsNull    then DokumentMEN_ID.AsInteger:=0;
  if DokumentMEN_ID.IsNull    then DokumentMEN_ID.AsInteger:=0;
  if DokumentZH_TYPE.IsNull    then DokumentZH_TYPE.AsInteger:=1;
//  if DokumentLOAD_CHECK.IsNull then DokumentLOAD_CHECK:=1;

  if DokumentUSLUG_SPR.AsString<>'' then begin
    if dmBase.SprWork.Locate('ID', DokumentUSLUG_SPR.AsInteger, []) then begin
      DokumentUSLUG.AsString:=dmBase.SprWork.FieldByName('NAME').AsString;
    end else begin
      DokumentUSLUG.AsString:='';
    end;
  end;

  ReadAllMenUch(DokumentZH_KLAD.Value, DokumentZH_UCH2.AsString);

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  CheckControlZAH(false,false);
  CheckControlGT(DokumentGT_IS_TEXT.AsBoolean);
  CheckControlType(DokumentZH_TYPE.AsInteger);
  CheckUslug;
  edMogila.EditButtons[0].Visible:=FAddNewDok;

  Dokument.Post;
  ReadHistory(nID, _TypeObj_AktZAH);

  if not FEmptyKlad and dmBase.SprZAH.Locate('ID',DokumentZH_KLAD.AsInteger,[]) then begin
    FGisRnKlad:=dmBase.SprZAH.FieldByName('ID_GIS').AsInteger;

    FCheckSector:=dmBase.SprZAH.FieldByName('IS_SECTOR').AsBoolean;
    FCheckRad:=dmBase.SprZAH.FieldByName('IS_RAD').AsBoolean;
    FCheckMog:=true;
    fld:=dmBase.SprZAH.FindField('IS_MOG');
    if (fld<>nil) then begin
      if not fld.IsNUll and (fld.AsBoolean=false)
        then FCheckMog:=false
    end;
    FCheckUch:=true;
    fld:=dmBase.SprZAH.FindField('IS_UCH');
    if (fld<>nil) then begin
      if not fld.IsNUll and (fld.AsBoolean=false)
        then FCheckUch:=false
    end;
  end;

end;

//------------------------------------------------------------------------
procedure TfmAktZ.CheckSoatoAkt(lVoenkom:Boolean);
begin
  WriteSoato(DokumentSOATO, lVoenkom);
end;
//------------------------------------------------------------------------
procedure TfmAktZ.WriteSoato(fld:TField; lVoenkom:Boolean);
var
  SOATO:TSOATO;
  n,nVozr:Integer;
begin
  
  SOATO:=dmBase.GetSoatoAkt(Dokument,
        'ZH_GOSUD,FName;ZH_OBL,ZH_B_OBL;ZH_RAION;ZH_GOROD,ZH_B_GOROD',true,FLenSoato);

  if (Copy(SOATO.Kod,2,6)='000000') and N_F_edBOMG.Checked
   then SOATO.Kod:='9000000';

  if (SOATO.Kod='9000000') and (DokumentZH_GOSUD.IsNull or (DokumentZH_GOSUD.AsInteger=MY_GRAG)) then begin
    SOATO:=dmBase.GetSoatoAkt(Dokument,
          'ZH_GOSUD,FName;ZH_OBL,ZH_B_OBL;ZH_RAION;ZH_GOROD,ZH_B_GOROD',true,FLenSoato);
  end;
  EditDataSet(fld.DataSet);
  fld.AsString:=SOATO.Kod;
end;
const
  MAX_REC=100;

//------------------------------------------------------------------------
function TfmAktZ.WriteDok: Boolean;
var
  i, nID, nIDSource : Integer;
  fld : TField;
  strField, strErr : String;
  lWrite:Boolean;
  arr:TArrStrings;
//  SOATO:TSOATO;
  lErr, lCheckEn, lFullWrite:Boolean;   // полная запись актовой записи
  sRukov,sRukovB:String;
  dDate:TDateTime;
  recID:TID;
begin
  Dokument.CheckBrowseMode;
  tbAddMen.CheckBrowseMode;
  AdditiveBeforeWriteDok;

  nIDSource:=MyID;

  Result:=CheckDokument(0,false,true,true);
  strErr:=FLastError;

  if Result and (DokumentBOOK.AsInteger=0) then begin
    Run_GetNumberBook;
  end;

  lFullWrite:=true;   // полная запись актовой записи
  sRukov:='';
  sRukovB:='';
  dDate:=0;
  {$IFDEF LAIS}
    lCheckEn:=false;
  {$ENDIF}

  {$IFNDEF LAIS}
  if (strErr='') then begin
//    n:=Globaltask.ParamAsInteger('KONT_NOMERAKT');   // 0-не контролировать  1-жесткий контроль  2-контроль с запросом
    if (FKontNomer>0) and (DokumentBOOK.AsInteger>0) then begin
      lErr:=false;
      dmBase.WorkQuery.SQL.Text:='SELECT ID, NOMER FROM AktZ WHERE zh_klad='+DokumentZH_KLAD.AsString+' and '+
                                 'book='+DokumentBOOK.AsString+' and nomer='+DokumentNOMER.AsString;
      dmBase.WorkQuery.Open;
      if DokumentID.AsInteger>0 then begin
        while not dmBase.WorkQuery.Eof do begin
          if dmBase.WorkQuery.FieldByName('ID').AsInteger<>DokumentID.AsInteger then begin
            lErr:=true;
            break;
          end;
          dmBase.WorkQuery.Next;
        end;
      end else begin
        if dmBase.WorkQuery.Fields[0].AsInteger>0
          then lErr:=true;
      end;
      dmBase.WorkQuery.Close;
      if lErr then begin
        strErr:='Информация с номером: '+DokumentNOMER.AsString+' уже существует.';
        if FKontNomer=2 then begin
          if Problem(strErr+#13+'Продолжить запись?')
            then Result:=true
            else Result:=false;
          strErr:='';
        end else begin  // n=1
          PutError(strErr);
          Result:=false;
        end;
      end;
    end;
  end;
  {$ENDIF}

  {$IFDEF ZAH}
  if Result and GlobalTask.DemoVersion then begin
    if (dmBase.AktZ.RecordCount >= MAX_REC)  then begin
      strErr := 'В демо-версии невозможно создать более '+IntToStr(MAX_REC)+' записей !';
      Result := false;
    end;
  end;
  {$ENDIF}

  if strErr<>'' then begin
    PutError(strErr,self);
    Result := false;
    exit;
  end;

  if Result then begin
    //-------------------------------------------------------
    // пропускаем поле ID
    if DokumentID.AsInteger = -1 then  begin
      Globaltask.SetLastValueAsInteger('CUR_KLAD', DokumentZH_KLAD.Asinteger);
      Globaltask.SetLastValueAsString('LAST_ZAGS', DokumentSVID_ZAGS.AsString);

      dmBase.AktZ.Append;
      dmBase.AktZ.FieldByName('ZH_KLAD').AsString:='0';     // в базе стоит NOT NULL
      dmBase.AktZ.Post;
      nID := dmBase.AktZ.FieldByName('ID').AsInteger;
    end else begin
      nID := DokumentID.AsInteger;
      if dmBase.AktZ.FieldByName('ID').AsInteger<>nID then begin
        if not dmBase.AktZ.Locate('ID', nID, []) then begin
          Result := false;
        end;
      end;
    end;
  end;

  if Result then  begin
    FCheckEditGIS:=CheckDateEditGIS;  // функция д.б. своя для каждого типа документа !!!

    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    if DokumentONLYGOD.IsNull   then DokumentONLYGOD.AsInteger:=0;
    if DokumentONLYGOD_R.IsNull then DokumentONLYGOD_R.AsInteger:=0;
    DokumentBRON_COUNT.AsInteger:=tbAddMen.RecordCount;
    if (DokumentAKT_NOMER.AsString<>'') then DokumentIS_AKT.AsBoolean:=true;

    if DokumentGT_IS_TEXT.AsBoolean then begin
      DokumentGT_OBL.AsString:='';
      DokumentGT_RNGOROD.AsString:='';
      DokumentGT_RAION.AsString:='';
      DokumentGT_GOROD.AsString:='';
      DokumentGT_GOROD_R.AsString:='';
      DokumentGT_DOM.AsString:='';
      DokumentGT_KORP.AsString:='';
      DokumentGT_KV.AsString:='';
      DokumentGT_B_GOROD.AsString:='';
    end else begin
      DokumentGT_TEXT.AsString:='';
    end;

    Dokument.Post;
//    AddEditSvid(strBookMark);


    dmBase.AktZ.Edit;
    if lFullWrite then begin
      for i:=1 to dmBase.AktZ.FieldCount-1 do begin
        strField := dmBase.AktZ.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          dmBase.AktZ.Fields[i].Value := fld.Value;
        end;
      end;
      dmBase.AktZ.FieldByName('ID_ZAGS').AsInteger:=nIDSource;
      dmBase.AktZ.FieldByName('ID_SOURCE').AsInteger:=nIDSource;

      //----- запишем возраст ----------
      if not DokumentDateR.IsNull and not DokumentDateS.IsNull then begin
        try
          dmBase.AktZ.FieldByName('VOZR').AsInteger:=GetCountYear( DokumentDateS.AsDateTime, DokumentDateR.AsDateTime);
        except
          dmBase.AktZ.FieldByName('VOZR').AsString:='';
        end;
      end else begin
        // может возраст ввели вручную
        dmBase.AktZ.FieldByName('VOZR').AsString:=DokumentVOZR.AsString;
      end;

      //--------------------------------
      if FCheckSOATO and not FOnlySvid then
        WriteSoato(dmBase.AktZ.FieldByName('SOATO'),false);
    end;   // <<<< lFullWrite

    if ds2xml.DataToXML then begin
      dmBase.AktZ.FieldByName('ADD_FIELDS').AsString:=ds2xml.XMLToString;
    end else begin
      PutError(ds2xml.LastError,self);
    end;

    WriteForAllDok_BeforePost;
    if FCheckEditGIS
      then dmBase.AktZ.FieldByName('DATE_EDIT_GIS').AsDateTime:=Now;

    dmBase.AktZ.Post;
    WriteAllMenUch;

    if lFullWrite then begin
      WriteDopProperty(_TypeObj_AktZAH, DokumentID.AsInteger, STOD('1899-12-30',tdAds));
      WriteHistory(nID, _TypeObj_AktZAH);
    end;
    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    AdditiveWriteDok;

//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);
    QueryExit:=false;
    Result := true;
//    if FCheckBelName and FCheckFamily then begin
//      dmBase.CheckBelFamily( DokumentFamilia.AsString, DokumentFamilia_B.AsString);
    WriteForAll_Bel;
//    end;
    {$IFDEF LAIS}
    if lCheckEn then begin
      SystemProg.SetRunMenReport(recID, 2{'SprMGS'});
    end;
    {$ENDIF}
    if Result then QueryExit:=false;
  end;
  if Result then FlushBuffers;

end;
//---------------------------------------------------
{
procedure TfmAktZ.lbDateEditGISGetText(Sender: TObject;  var Text: String);
begin
  Text:='';
  if not DokumentDATE_EDIT_GIS.IsNull and not DokumentDATE_POST_GIS.IsNull and
     (DokumentDATE_EDIT_GIS.AsDateTime > DokumentDATE_POST_GIS.AsDateTime) then begin
    Text:='Дата корректировки: '+FormatDateTime('dd.mm.yyyy hh:nn',DokumentDATE_EDIT_GIS.AsDateTime)+',  '+
          'дата регистрации: '+FormatDateTime('dd.mm.yyyy hh:nn',DokumentDATE_POST_GIS.AsDateTime);
  end;
end;
}
//-------------------------------------------------------------------------
// для текущей записи регистрация разрешена
function TfmAktZ.IsRegisterGisun : Boolean;
begin
  if DokumentLOAD_CHECK.IsNull or (DokumentLOAD_CHECK.AsInteger>0)
    then Result:=true
    else Result:=false;
end;

//-----------------------------------------------------------
procedure TfmAktZ.WriteAfterRegister_GISUN;
begin
  try
    EditDataSet(Dokument);
    DokumentDATE_POST_GIS.AsDateTime:=Now;
    Dokument.Post;
    FMainTable.FieldByName('DATE_POST_GIS').AsDateTime:=DokumentDATE_POST_GIS.AsDateTime;
  except
  end;
  {
  if DokumentDATE_EDIT_GIS.AsDateTime>DokumentDATE_POST_GIS.AsDateTime
    then lbDateEditGIS.Font.Color:=clRed
    else lbDateEditGIS.Font.Color:=clWindowText;
  }
end;

//-----------------------------------------------------------
// записать движение
procedure TfmAktZ.WriteDvigMen(nIdMen:Integer);
begin
end;

procedure TfmAktZ.edFamiliaEditButtons1Click(Sender: TObject;  var Handled: Boolean);
{$IFNDEF ZAH}
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
{$ENDIF}
begin
{$IFNDEF ZAH}
  if ChoiceMen( edFamilia, Trim(edFAMILIA.Text), '', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      lCheck:=dbDisableControls(Dokument);
      try
      EditDataSet(Dokument);
      v := GetValueField(arrRec, 'ID');
      DokumentMEN_ID.AsInteger := v;

      // место рождения
      {
      if dmBase.tbMensAdd.Locate('ID',v,[]) then begin
        WriteField( DokumentRG_B_RESP, dmBase.tbMensAdd.FieldByName('MR_B_RESP') );
        WriteField( DokumentRG_GOSUD, dmBase.tbMensAdd.FieldByName('MR_GOSUD') );
        WriteField( DokumentRG_B_OBL, dmBase.tbMensAdd.FieldByName('MR_B_OBL') );
        WriteField( DokumentRG_OBL, dmBase.tbMensAdd.FieldByName('MR_OBL') );
        WriteField( DokumentRG_RAION, dmBase.tbMensAdd.FieldByName('MR_RAION') );
        WriteField( DokumentRG_B_GOROD, dmBase.tbMensAdd.FieldByName('MR_B_GOROD') );
        WriteField( DokumentRG_GOROD, dmBase.tbMensAdd.FieldByName('MR_GOROD') );
      end;
      }
      nID := DokumentMEN_ID.AsInteger;

      DokumentFAMILIA.AsString:=GetValueFieldEx(arrRec, 'FAMILIA','');
      DokumentNAME.AsString:=GetValueFieldEx(arrRec, 'NAME','');
      DokumentOTCH.AsString:=GetValueFieldEx(arrRec, 'OTCH','');
      GetValueFieldEx2(arrRec, 'DATES', DokumentDATES);
      GetValueFieldEx2(arrRec, 'DATER', DokumentDATER);
      Pol:=tpNone;
      v := GetValueField(arrRec, 'POL');
      if v = null then DokumentPOL.AsString := ''
                  else DokumentPOL.Value    := v;
      DokumentGRAG.AsInteger := GetValueFieldEx(arrRec, 'CITIZEN',0);

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
      DokumentLICH_NOMER.AsString := CheckRus2(Pasport.LichNomer);

      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      DokumentPR_GOSUD.AsInteger:=MY_GRAG;
      DokumentPR_OBL.AsString:=Trim(Globaltask.ParamAsString('OBL'));
      DokumentPR_RAION.AsString:=Trim(Globaltask.ParamAsString('RAION'));
      DokumentPR_GOROD.AsString := '';
      if adr.Punkt <> '' then DokumentPR_GOROD.AsString := adr.PunktN;
      if adr.PunktTK>0 then DokumentPR_B_GOROD.AsInteger:= adr.PunktTK;
      if adr.UlicaDom <> '' then begin
//        DokumentGT_GOROD_R.AsString:=adr.UlicaDom
        DokumentPR_GOROD_R.AsString:=adr.Ulica;
        DokumentPR_DOM.AsString:=adr.NDom;
        DokumentPR_KORP.AsString:=adr.Korp;
        DokumentPR_KV.AsString:=adr.Kv;
      end else begin
        DokumentPR_GOROD_R.AsString:='';
      end;

      PostDataSet(Dokument);
      finally
        dbEnableControls(Dokument,lCheck);
        Screen.Cursor := old;
      end;
  end;
{$ENDIF}
end;

procedure TfmAktZ.edFamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
//  old : TCursor;
  ParamFlt:TParamFieldFlt;
  s:String;
  i:Integer;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_SMERT');
  if Opis<>nil then begin
    ParamFlt:=CreateParamFlt(edFamilia.Text,'FAMILIA');
    if ParamFlt<>nil then  Opis.AutoFilter:=true;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edFamilia, v, arrRec, ParamFlt) and (v<>null) then begin
//      old := Screen.Cursor;
//      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      DokumentFAMILIA.AsString := GetValueFieldEx(arrRec, 'FAMILIA','');
      DokumentNAME.AsString    := GetValueFieldEx(arrRec, 'NAME','');
      DokumentOTCH.AsString    := GetValueFieldEx(arrRec, 'OTCH', '');
      DokumentPOL.AsString     := GetValueFieldEx(arrRec, 'POL', '');

      DokumentSTATUS.AsString  := GetValueFieldEx(arrRec, 'STATUS', '');

      GetValueFieldEx2(arrRec, 'DATES', DokumentDATES);
      DokumentONLYGOD.AsString:=GetValueFieldEx(arrRec, 'ONLYGOD', '');
      GetValueFieldEx2(arrRec, 'DATER', DokumentDATER);
      DokumentONLYGOD_R.AsString:=GetValueFieldEx(arrRec, 'ONLYGOD_R', '');
      DokumentLICH_NOMER.AsString:=GetValueFieldEx(arrRec, 'LICH_NOMER', '');
      DokumentSVID_SERIA.AsString:=GetValueFieldEx(arrRec, 'SVID_SERIA', '');
      DokumentSVID_NOMER.AsString:=GetValueFieldEx(arrRec, 'SVID_NOMER', '');
      DokumentDATESV.AsString:=GetValueFieldEx(arrRec, 'DATESV', '');
      DokumentSVID_ZAGS.AsString:=GlobalTask.ParamAsString('NAME');
      s:=GetValueFieldEx(arrRec, 'DECL', '');
      if (s<>'') then begin
        i:=Pos(',', s);
        if i>0 then begin
          DokumentDECL.AsString:=Copy(s,1,i-1);
          DokumentGT_IS_TEXT.AsBoolean:=true;
          DokumentGT_TEXT.AsString:=Copy(s,i+1, Length(s));
          DokumentDECL_DOK.AsString:=dmBase.ReadPropSimpleDok(_TypeObj_ZSmert, GetValueFieldEx(arrRec, 'ID', '0'), STOD('1899-12-30',tdAds),
                                     'DECL_DOK', ftMemo);
        end;
      end;
      DokumentPR_GOSUD.AsString:=GetValueFieldEx(arrRec, 'GT_GOSUD', '');
      DokumentPR_B_OBL.AsBoolean:=GetValueFieldEx(arrRec, 'GT_B_OBL', '');
      DokumentPR_OBL.AsString:=GetValueFieldEx(arrRec, 'GT_OBL', '');
      DokumentPR_RAION.AsString:=GetValueFieldEx(arrRec, 'GT_RAION', '');
      DokumentPR_B_GOROD.AsString:=GetValueFieldEx(arrRec, 'GT_B_GOROD', '');
      DokumentPR_GOROD.AsString:=GetValueFieldEx(arrRec, 'GT_GOROD', '');
      DokumentPR_GOROD_R.AsString:=GetValueFieldEx(arrRec, 'GT_GOROD_R', '');
      DokumentPR_DOM.AsString:=GetValueFieldEx(arrRec, 'GT_DOM', '');
      DokumentPR_KORP.AsString:=GetValueFieldEx(arrRec, 'GT_KORP', '');
      DokumentPR_KV.AsString:=GetValueFieldEx(arrRec, 'GT_KV', '');
//      DokumentZAPAKT_ZAGS.AsString
      DokumentZAPAKT_DATE.AsDateTime:=GetValueFieldEx(arrRec, 'DATEZ', 0);
      DokumentZAPAKT_NOMER.AsString:=GetValueFieldEx(arrRec, 'NOMER', '');

      PostDataSet(Dokument);
    end;
  end;
end;

procedure TfmAktZ.UpdateActions;
begin
  inherited;
end;
//-----------------------------------------------------
procedure TfmAktZ.CheckUslug;
begin
  if DokumentUSLUG_SPR.AsString='' then begin
    edUslug.ReadOnly:=false;
    if edUslug.Font.Style <> [] then begin
      edUslug.Font.Style := [];
    end;
  end else begin
    edUslug.ReadOnly:=true;
    if edUslug.Font.Style <> [fsBold] then begin
      edUslug.Font.Style := [fsBold];
    end;
  end;
end;
//-----------------------------------------------------
procedure TfmAktZ.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField,s : String;
  Pol : TPol;
  lCheck : Boolean;
  SOATO:TSoato;
  p:TPassport;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    strField:=ANSIUpperCase(Field.FieldName);
    if (strField='USLUG') or (strField='USLUG_SPR') then begin
      CheckUslug;
    end else if (strField='DATER') or (strField='DATES') then begin
      if not DokumentDateR.IsNull and not DokumentDateS.IsNull then begin
        try
          DokumentVOZR.AsInteger:=GetCountYear( DokumentDateS.AsDateTime, DokumentDateR.AsDateTime);
        except
          DokumentVOZR.AsString:='';
        end;
      end else begin
        DokumentVOZR.AsString:='';
      end;
      if not DokumentDateR.IsNull and (DokumentTEXT_VOZR.AsString<>'')  then DokumentTEXT_VOZR.AsString:='';
      if not DokumentDateS.IsNull and (DokumentTEXT_DATES.AsString<>'') then DokumentTEXT_DATES.AsString:='';
    end else if (strField='TEXT_VOZR') then begin
      if DokumentTEXT_VOZR.AsString<>'' then begin
        DokumentDATER.AsString:='';
        DokumentVOZR.AsString:='';
      end;
    end else if (strField='ONLYGOD_R') then begin
      if DokumentONLYGOD_R.AsInteger=3 then begin
        DokumentDATER.AsString:='';
        DokumentVOZR.AsString:='';
      end;
    end else if (strField='TEXT_DATES') then begin
      if DokumentTEXT_DATES.AsString<>'' then begin
        DokumentDATES.AsString:='';
      end;
    end else if (strField = 'ZH_GOROD')  then begin
//      WriteSoato(DokumentSOATO,true);
    end else if (strField = 'ZH_RAION') then begin

    end;
    FRun := true;
    if FCheckBelName then begin
      EditDataSet(Dokument);
      Pol := tpNone;
      lCheck := false;
      if strField='NAME' then begin
      end else if strField='OTCH' then begin
      end else if strField='FAMILIA' then begin
      end;
//      CheckForAll_Bel(Field);
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

function TfmAktZ.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;

//  if GlobalTask.ParamAsBoolean('SMERT_KOD') then begin
//    SetMRUList(ENG_edPrNep,20999,4,true,false,false,false); //FAddButtonMRUList);
//    SetMRUList(ENG_edPrOsn,20999,4,true,false,false,false); //FAddButtonMRUList);
//   end;

// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edSM_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edPR_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edRG_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
//  SetMRUList(edZH_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edZH_GOROD_Akt,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edGT_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edSM_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edPR_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edRG_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edZH_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edGT_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edSM_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edPR_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edRG_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edZH_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edGT_RAION,n,2,true,false,false,FAddButtonMRUList);

//  SetFlat(GlobalFlat);

end;

procedure TfmAktZ.N_F_cbBelorusClick(Sender: TObject);
begin
  DestroyHint(H);
  if N_F_cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;

    edRukov.DataField   := 'RUKOV_B';
  end else begin
    ActivateRUSKeyboard;
    edRukov.DataField   := 'RUKOV';
  end;
end;

procedure TfmAktZ.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmAktZ.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmAktZ.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmAktZ.edFamiliaEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edFamilia,DokumentFamilia.AsString+' ');
end;

procedure TfmAktZ.edNameEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edName,DokumentName.AsString+' ');
end;

procedure TfmAktZ.edOtchEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edOtch,DokumentOtch.AsString+' ');
end;

procedure TfmAktZ.edFamiliaCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmAktZ.edRukov_AktEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

procedure TfmAktZ.Label45Click(Sender: TObject);
//var
//  nYear,nMonth,nDay : Integer;
begin
//  Dokument.CheckBrowseMode;
//  SubDate(DokumentSPRAV_DATE.AsDateTime, DokumentMAT_DATER.AsDateTime,
//   nYear,nMonth,nDay);
//  Label45.Caption := IntToStr(nYear)+'   '+IntToStr(nMonth)+'    '+IntToStr(nDay);
end;

procedure TfmAktZ.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex=1 then begin

  end;

//    if (pc.ActivePageIndex=1) or (pc.Pages[pc.ActivePageIndex].Name='tsSvid')
//      then N_F_cbPovtor.Parent:=pc.Pages[pc.ActivePageIndex];
end;

procedure TfmAktZ.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  Run_ReadListBooks(DokumentZH_KLAD.AsInteger);
end;

procedure TfmAktZ.AdditiveReadDok;
begin
  inherited;
  Run_ReadListBooks(DokumentZH_KLAD.AsInteger);
end;

procedure TfmAktZ.CheckOnlyGod(lSv:Boolean);
var
  n:Integer;
begin
  n:=0;
  if lSv then begin
    N_F_cbOnlyGod.ItemIndex:=n;
    N_F_cbOnlyGod_Akt.ItemIndex:=n;
  end else begin
    n:=N_F_cbOnlyGod.ItemIndex;
  end;
  if n=3 then begin
    edDATES.Visible:=false;
    edTextDateS.Visible:=true;
    edDATES_Akt.Visible:=false;
    edTextDateS_Akt.Visible:=true;
  end else begin
    edDATES.Visible:=true;
    edTextDateS.Visible:=false;
    edDATES_Akt.Visible:=true;
    edTextDateS_Akt.Visible:=false;
  end;
  if n=3 then begin          // дата смерти неизвестна точно
    edTextDateS.Left:=edDATES.Left;
    edTextDateS.Width:=130;
    edTextDateS_Akt.Left:=edDATES.Left;
  end else if n=2 then begin // год и месяц
    edDATES.EditButton.Visible:=false;
    edDATES.EditFormat:='MM.YYYY';
    edDATES_Akt.EditButton.Visible:=false;
    edDATES_Akt.EditFormat:='MM.YYYY';
  end else if n=1 then begin // год
    edDATES.EditButton.Visible:=false;
    edDATES.EditFormat:='YYYY';
    edDATES_Akt.EditButton.Visible:=false;
    edDATES_Akt.EditFormat:='YYYY';
  end else begin      // полная дата
    edDATES.EditButton.Visible:=true;
    edDATES.EditFormat:='DD.MM.YYYY';
    edDATES_Akt.EditButton.Visible:=true;
    edDATES_Akt.EditFormat:='DD.MM.YYYY';
  end;
end;

procedure TfmAktZ.CheckOnlyGodR(lSv:Boolean);
var
  n:Integer;
begin
  n:=0;
  if lSv then begin
    N_F_cbOnlyGodR.ItemIndex:=n;
    N_F_cbOnlyGodR_Akt.ItemIndex:=n;
  end else begin
    n:=N_F_cbOnlyGodR.ItemIndex;
  end;
  if n=3 then begin
    edDATER.Visible:=false;
    edTextVozr.Visible:=true;
    edDATER_Akt.Visible:=false;
    edTextVozr_Akt.Visible:=true;
  end else begin
    edDATER.Visible:=true;
    edTextVozr.Visible:=false;
    edDATER_Akt.Visible:=true;
    edTextVozr_Akt.Visible:=false;
  end;
  if n=3 then begin          // дата рождения неизвестна
    edTextVozr.Left:=edDATER.Left;
    edTextVozr_Akt.Left:=edDATER.Left;
    edTextVozr.Width:=130;
    edTextVozr_Akt.Width:=130;
  end else if n=2 then begin          // год и месяц
    edDATER.EditButton.Visible:=false;
    edDATER.EditFormat:='MM.YYYY';
    edDATER_Akt.EditButton.Visible:=false;
    edDATER_Akt.EditFormat:='MM.YYYY';
  end else if n=1 then begin // год
    edDATER.EditButton.Visible:=false;
    edDATER.EditFormat:='YYYY';
    edDATER_Akt.EditButton.Visible:=false;
    edDATER_Akt.EditFormat:='YYYY';
  end else begin      // полная дата
    edDATER.EditButton.Visible:=true;
    edDATER.EditFormat:='DD.MM.YYYY';
    edDATER_Akt.EditButton.Visible:=true;
    edDATER_Akt.EditFormat:='DD.MM.YYYY';
  end;
end;

procedure TfmAktZ.edSM_OBL_RNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmAktZ.edSM_RAION_RNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmAktZ.edGT_RNGORODNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

//--------------------------------------------------------------------------
procedure TfmAktZ.CheckControlZAH(lAdd:Boolean; lGisun:Boolean);
{$IFNDEF LAIS}
var
  l:Boolean;
{$ENDIF}
begin
  if not lGisun then begin
    if not lAdd and not FEmptyKlad then begin
      if (DokumentBOOK.AsInteger=0) or (edBook.Text='') then begin // DokumentZH_KLAD.AsInteger=0) then begin  если номер книги или кладбища не заполнен
        edBook.ReadOnly:=false;
        edZH_KLAD.ReadOnly:=false;
        edBook.Color:=GetControlColor;
        edZH_KLAD.Color:=GetControlColor;
        edZH_KLAD.EditButton.Visible:=true;
      end else begin
        edBook.ReadOnly:=true;
        edBook.Color:=GetDisableColor;
        if (DokumentID.AsInteger>0) and (DokumentZH_KLAD.AsInteger>0) then begin
          edZH_KLAD.ReadOnly:=true;
          edZH_KLAD.Color:=GetDisableColor;
          edZH_KLAD.EditButton.Visible:=false;
        end else begin
          edZH_KLAD.ReadOnly:=false;
          edZH_KLAD.Color:=GetControlColor;
          edZH_KLAD.EditButton.Visible:=true;
        end;
      end;
    end else begin
      edBook.ReadOnly:=false;
      edZH_KLAD.ReadOnly:=false;
      edBook.Color:=GetControlColor;
      edZH_KLAD.Color:=GetControlColor;
      edZH_KLAD.EditButton.Visible:=true;
    end;
  end;
  TbItemEnableEdit.Visible:=edZH_KLAD.ReadOnly;
  TBItemNomerBook.Enabled:=not edZH_KLAD.ReadOnly;
  {$IFDEF LAIS}
    btLoadFIO.Visible:=false;
    FIO_GISRN.Visible:=false;
    N_F_cbLoadCheck.Visible:=false;
    N_F_cbLoadCheck.ItemIndex:=-1;
  {$ELSE}
    if DokumentID_LOAD.IsNull then begin
      btLoadFIO.Visible:=false;
      FIO_GISRN.Visible:=false;
      N_F_cbLoadCheck.Visible:=false;
      N_F_cbLoadCheck.ItemIndex:=-1;
    end else begin
      N_F_cbLoadCheck.Visible:=true;
      N_F_cbLoadCheck.ItemIndex:=DokumentLOAD_CHECK.AsInteger;
      l:=(DokumentFAMILIA_GIS.AsString<>'') and (AnsiUpperCase(CreateFIO(Dokument,''))<>AnsiUpperCase(CreateFIO(Dokument,'_GIS;E')));
      btLoadFIO.Visible:=l;
      FIO_GISRN.Visible:=l;
    end;
  {$ENDIF}
end;
//--------------------------------------------------------------------------
procedure TfmAktZ.CheckControlType(nType:Integer);
begin
  if edZH_TYPE.Visible and pnKlum.Visible then begin
    case nType of
      2: begin   // в колум. нишу
           edSector.Enabled:=false;
           edRow.Enabled:=true;
           edPlace.Enabled:=false;
           edMogila.Enabled:=false;
           edStenaKlum.Enabled:=true;
           edKlum.Enabled:=true;
           edKlumStakan.Enabled:=false;
           edSklep.Enabled:=false;
         end;
      3: begin   // в колул. стакан
           edSector.Enabled:=true;
           edRow.Enabled:=true;
           edPlace.Enabled:=false;
           edMogila.Enabled:=false;
           edStenaKlum.Enabled:=false;
           edKlum.Enabled:=false;
           edKlumStakan.Enabled:=true;
           edSklep.Enabled:=false;
         end;
      4: begin   // в склеп
           edSector.Enabled:=false;
           edRow.Enabled:=false;
           edPlace.Enabled:=false;
           edMogila.Enabled:=false;
           edStenaKlum.Enabled:=false;
           edKlum.Enabled:=false;
           edKlumStakan.Enabled:=false;
           edSklep.Enabled:=true;
         end;
    else         // в могилу
      edSector.Enabled:=true;
      edRow.Enabled:=true;
      edPlace.Enabled:=true;
      edMogila.Enabled:=true;
      edStenaKlum.Enabled:=false;
      edKlum.Enabled:=false;
      edKlumStakan.Enabled:=false;
      edSklep.Enabled:=false;
    end;
    lbSector.Enabled:=edSector.Enabled;
    lbRow.Enabled:=edRow.Enabled;
    lbPlace.Enabled:=edPlace.Enabled;
    lbMogila.Enabled:=edMogila.Enabled;
    lbKlum.Enabled:=edKlum.Enabled;
    lbKlumStakan.Enabled:=edKlumStakan.Enabled;
    lbSklep.Enabled:=edSklep.Enabled;
  end;
end;
//--------------------------------------------------------------------------
procedure TfmAktZ.N_F_cbOnlyGod_AktChange(Sender: TObject);
begin
  CheckOnlyGod(false);
end;

procedure TfmAktZ.N_F_cbOnlyGodR_AktChange(Sender: TObject);
begin
  CheckOnlyGodR(false);
end;

procedure TfmAktZ.N_F_cbOnlyGod_SvChange(Sender: TObject);
begin
  CheckOnlyGod(true);
end;

procedure TfmAktZ.N_F_cbOnlyGodR_SvChange(Sender: TObject);
begin
  CheckOnlyGodR(true);
end;


procedure TfmAktZ.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetSmert(Self);
//  Gisun.CheckSmert(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmAktZ.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterSmert(Self);
//  Gisun.CheckSmert(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmAktZ.TBItemRegPrSmertClick(Sender: TObject);
{$IFDEF GISUN}
var
  Par:TParRegGISUN;
{$ENDIF}
begin
{$IFDEF GISUN}
  Par:=TParRegGISUN.Create;
  Par.SetPar('EMPTY_PRICH',false);
  RegisterAkt_GISUN(0,Par);
  Par.Free;
{$ENDIF}
end;

procedure TfmAktZ.edSdanDokEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
 p : TPassport;
 s : String;
begin
  fmEnterDokument:=TfmEnterDokument.Create(nil);
  with fmEnterDokument do begin
    tb.Edit;
    tbDOK_TYPE.AsString:=DokumentDOK_TYPE.AsString;
    tbDOK_SERIA.AsString:=DokumentDOK_SERIA.AsString;
    tbDOK_NOMER.AsString:=DokumentDOK_NOMER.AsString;
    tbDOK_ORGAN.AsString:=DokumentDOK_ORGAN.AsString;
    tbDOK_NAME.AsString:=DokumentDOK_NAME.AsString;
    WriteDateField(tbDOK_DATE,DokumentDOK_DATE);
    {$IFDEF GISUN}
    if IsActiveGISUN and ((GISUN.GetPoleGrnSub( DokumentPOLE_GRN.AsInteger) and bPerson)=bPerson) then begin
      SetEnableEdit(false);
    end else begin
      SetEnableEdit(true);
    end;
    {$ENDIF}
    if EditDokument then begin
      Application.ProcessMessages;
    end;
  end;
end;

//------------------------------------------------------------------------------------------------
procedure TfmAktZ.edDeclDokEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
 p : TPassport;
 s : String;
begin
  fmEnterDokument:=TfmEnterDokument.Create(nil);
  with fmEnterDokument do begin
    tb.Edit;
    {
    tbDOK_TYPE.AsString:=DokumentDOK_TYPE.AsString;
    tbDOK_SERIA.AsString:=DokumentDOK_SERIA.AsString;
    tbDOK_NOMER.AsString:=DokumentDOK_NOMER.AsString;
    tbDOK_ORGAN.AsString:=DokumentDOK_ORGAN.AsString;
    tbDOK_NAME.AsString:=DokumentDOK_NAME.AsString;
    WriteDateField(tbDOK_DATE,DokumentDOK_DATE);
    }
    if EditDokument then begin
      Application.ProcessMessages;
      EditDataSet(Dokument);
      p := dmBase.PasportFromValues(tbDOK_TYPE.AsInteger, tbDOK_SERIA.AsString, tbDOK_NOMER.AsString,
                           tbDOK_NAME.AsString, '', tbDOK_DATE.Value);
      s := dmBase.PasportToText(p,0);
      if s<>'' then begin
        DokumentDECL_DOK.AsString:=s;
      end;
      PostDataSet(Dokument);
    end;
  end;
end;
//---------------------------------------------------------------------------
procedure TfmAktZ.edDateR_AktUpdateData(Sender: TObject; var Handled: Boolean);
begin
{
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 13);
  if not DokumentDATES.IsNull
    then CheckValueDateZAGS(edDateS.Value,edDateS, 2);
}
end;

procedure TfmAktZ.edDateS_AktUpdateData(Sender: TObject; var Handled: Boolean);
begin
{
  CheckValueDateZAGS(edDateR.Value,edDateR, 13);
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 2);
}
end;

procedure TfmAktZ.edDateZAHUpdateData(Sender: TObject; var Handled: Boolean);
begin
  {
  if DokumentDATES.IsNull
    then CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 22, 0, 0)
    else CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 22, DokumentDATES.AsDateTime, 0);
  }
end;

procedure TfmAktZ.edDateZUpdateData(Sender: TObject; var Handled: Boolean);
begin
  {
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 22, 0, 0);
  if not DokumentDATES.IsNull
    then CheckValueDateZAGS(edDateS.Value,edDateS, 2);
  }
  if FAutoNum and not FRun and (FTypeNewNum=NUM_KLAD_YEAR) and (TDbDateTimeEditEh(Sender).Value<>null) then begin
    FNewDate:=TDbDateTimeEditEh(Sender).Value;
    try
      SetNewNomerDok(true);
    finally
      FNewDate:=-1;
    end;
  end;
end;

procedure TfmAktZ.TBItemTalonUbitClick(Sender: TObject);
begin
  DestroyHint(H);
  if not FEnableWrite then begin
    beep;
    exit;
  end;
  if WriteDok then begin
    FRunTalonUbit := true;
    ModalResult   := mrOk;
  end;
end;

procedure TfmAktZ.edSOATOClick(Sender: TObject);
begin
//  EditDataSet(Dokument);
//  if Copy(DokumentGT_GOROD.AsString,1,1)='г'
//    then DokumentRN_GT_B_GOROD.AsString:='112'
//    else DokumentRN_GT_B_GOROD.AsString:='231';
  WriteSoato(DokumentSOATO,true);
end;

function TfmAktZ.CreateSubMenuRun: Boolean;
var
 it : TTbItem;
// sep : TTbSeparatorItem;
begin
  inherited CreateSubmenuRun;
  Result:=true;
  {
  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Аннулирование актовой записи';
  it.OnClick:=Event_Annulir;
  TBSubmenuRun.Add(it);
  TbItemEmptyPrich := TTbItem.Create(TBSubmenuRun);
  TbItemEmptyPrich.Caption:='Передать в регистр с пустой причиной';
  TbItemEmptyPrich.OnClick:=Event_EmptyPrich;
  TBSubmenuRun.Add(TbItemEmptyPrich);
  }

  TbItemVerno := TTbItem.Create(TBSubmenuRun);
  TbItemVerno.Caption:='Запись верна';
  TbItemVerno.OnClick:=Event_TrueAkt;
  TBSubmenuRun.Add(TbItemVerno);

  it:=TTbItem.Create(TBSubmenuRun);
  it.Checked:=PrintDeclDok(_TypeObj_AktZAH);
  it.Caption:='Печать документа заявителя';
  it.OnClick:=Event_Check;

  TBSubmenuRun.Add(it);

  TbItemEnableEdit:=TTbItem.Create(TBSubmenuPar);
  TbItemEnableEdit.Caption:='Разрешить корректировку';
  TbItemEnableEdit.OnClick:=pmEnableEditClick;
  TbItemEnableEdit.ShortCut:=TextToShortCut('Ctrl+E');
  TBSubmenuRun.Add(TbItemEnableEdit);

end;

function TfmAktZ.EmptyIzm: String;
begin
  Result:=SprSmert_EmptyIzm;  // uProject
end;

procedure TfmAktZ.edIDENTIFUpdateData(Sender: TObject; var Handled: Boolean);
var
  s:String;
begin
  s  := Trim(ENG_edIDENTIF.Text);              
  if s<>'' then begin
    if CheckRUS(s) then ENG_edIDENTIF.Text:=s;
    if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
      ENG_edIDENTIF.Text := CheckLichNom(true, ENG_edIDENTIF.Text);
      s:=GetErrorCheck;
      if s<>'' then begin
        PutError(s,self);
      end;
    end;
  end;
end;

procedure TfmAktZ.WM_CloseMRUList(var rec: TMsg);
begin
//  SendKeys('{DOWN}{ENTER}', false);
//  edObl_Sv.MRUList.CloseUp(true);
end;


procedure TfmAktZ.FormResize(Sender: TObject);
begin
  inherited;
//  imBE.Left:=cbBel.Left+20;
end;

procedure TfmAktZ.Button1Click(Sender: TObject);
begin
//  SaveDokumentToFile;
end;

procedure TfmAktZ.Button2Click(Sender: TObject);
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
//------------------------------------------------------------------------
procedure TfmAktZ.lbVozr_AktGetText(Sender: TObject; var Text: String);
begin
  if DokumentVOZR.AsString='' then begin
    Text:='';
  end else begin
    try
      Text:=GetVozrast(DokumentVOZR.AsInteger,false);
    except
      Text:='Ошибка в возрасте';
    end;
  end;
end;

procedure TfmAktZ.edFactEnter(Sender: TObject);
begin
  SendKeys('{END}', false);
end;

//---------------------------------------------------------------------------------------
procedure TfmAktZ.ENG_edPrOsnUpdateData(Sender: TObject;  var Handled: Boolean);
var
  ed,edN : TDbEditEh;
  s,ss,sAdd : String;
  fld:TField;
begin
  ed := TDbEditEh(Sender);
  s  := ANSIUpperCase(Trim(ed.Text));
  if s<>'' then begin
  {
    CharDel(s,' ');
    s:=CheckRUS2(s);
    s:=CheckEngI(s);   // замена бел. І на английскую I

    if ed.DataField='PR_NEP' then begin
      edN:=edPrNep_Name;
      sAdd:='Непосредственная причина смерти:';
    end else begin //if ed.DataField='PR_OSN' then begin
      edN:=edPrOsn_Name;
      sAdd:='Основная причина смерти:';
    end;

    if GlobalTask.ParamAsBoolean('CHECK_V_PRSM') then begin


      ss:=Copy(s,1,1);
      Q_DelChars(ss,'QWERTYIOPASDFGHJKLZXCVBNMU');
      if ss<>'' then raise EPrSmertInvalid.Create(sAdd+chr(13)+'в первой позиции должна быть латинская буква.');

      ss:=Copy(s,2,2);
      Q_DelChars(ss,'1234567890');
      if ss<>'' then raise EPrSmertInvalid.Create(sAdd+chr(13)+'во второй и третьей позиции должна быть цифра.');

      if Length(s)>3 then begin
        ss:=Copy(s,4,1);
        Q_DelChars(ss,'.A');
        if ss<>'' then raise EPrSmertInvalid.Create(sAdd+chr(13)+'в четвертой позиции должна быть точка или буква A.');
      end;

      if Length(s)>4 then begin
        ss:=Copy(s,5,1);
        Q_DelChars(ss,'1234567890');
        if (Copy(s,5,1)='') or (ss<>'') then raise EPrSmertInvalid.Create(sAdd+chr(13)+'в пятой позиции должна быть цифра.');
      end;

      if Length(s)>5 then begin
        ss:=Copy(s,6,1);
        Q_DelChars(ss,'QWERTYIOPASDFGHJKLZXCVBNMU1234567890');
        if ss<>'' then raise EPrSmertInvalid.Create(sAdd+chr(13)+'в шестой позиции должна быть латинская буква или цифра.');
      end;

    end;

    // если включена подсказка при вводе кода причины смерти
    if GlobalTask.ParamAsBoolean('SMERT_KOD') then begin
      if (ed.Field.AsString<>s) or (edN.Field.AsString='') then begin
        if dmBase.SprMKB10.Locate('KOD',s,[]) then begin
          edN.Value:=dmBase.SprMKB10.FieldByName('NAME').AsString;
        end;
      end;
    end;

    ed.Text:=s;
    }
  end;
end;

function TfmAktZ.CheckDokumentSimple(nType: Integer; lWriteDok:Boolean): Boolean;
var
  strErr,s,ss:String;
  d:TDateTime;
  i:Integer;
  lOk:Boolean;
  procedure AddErr(s:String);
  begin
    strErr:=strErr+s+chr(13)+chr(10);
  end;
begin
  Result:=inherited CheckDokumentSimple(nType, lWriteDok);
  if Result then begin
    strErr := '';
    if DokumentDATEZ.IsNull        then AddErr(' Заполните дату записи ');
    if FAutoNum or (FKontNomer>0)  then begin
      if DokumentNOMER.AsString='' then AddErr(' Заполните номер записи ');
    end;
// !!!   if DokumentBOOK.AsString='' then AddErr(' Заполните номер книги. ');
    if (DokumentZH_KLAD.AsString='') or (DokumentZH_KLAD.AsInteger=0) then AddErr(' Заполните место захоронения ');
    if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then AddErr(' Заполните Фамилия, Имя ');
    lOk:=false;
    if pnKlum.Visible then begin
      if (DokumentZH_ST_KLUM.AsString<>'') then lOk:=true;
      if (DokumentZH_STAKAN.AsString<>'')  then lOk:=true;
      if (DokumentZH_SKLEP.AsString<>'')   then lOk:=true;
      if (DokumentZH_KLUM.AsString<>'') and (DokumentZH_ST_KLUM.AsString='') then AddErr(' Заполните номер клумбарной стены ');
    end;
    if lOk and (DokumentZH_MOG.AsString<>'') then AddErr(' Несовместимость клумбария(склепа) и номера могилы ');
    if not lOk then begin
      if FCheckMog and (DokumentZH_MOG.AsString='')  then AddErr(' Заполните номер могилы ');
      if FCheckUch and (DokumentZH_UCH2.AsString='') then AddErr(' Заполните номер участка(ограды) ');
      if FCheckSector and (DokumentZH_UCH.AsString='') then AddErr(' Заполните номер сектора ');
      if FCheckRad and (DokumentZH_RAD.AsString='') then AddErr(' Заполните номер ряда ');
      if FSecUch and (DokumentZH_UCH.AsString<>'') and (Pos('/', DokumentZH_UCH.AsString)=0) then begin
        AddErr('Номер сектора должен быть разделен символм "/"');
      end;
    end;

    //---------------------
    if not DokumentDateR.IsNull and not DokumentDateS.IsNull then begin
      try
        i:=GetCountYear( DokumentDateS.AsDateTime, DokumentDateR.AsDateTime);
      except
        i:=50;
      end;
      if (i<0) or (i>150) then begin
        AddErr(' Ошибка в возрасте: '+IntToStr(i));
      end;
    end;
    //---------------------
    if not DokumentDATEZH.IsNull and not DokumentDateS.IsNull then begin
      if DokumentDateS.AsDateTime > DokumentDateZH.AsDateTime then begin
        AddErr(' Дата смерти больше даты захоронения');
      end;
    end;

    {
    if FWriteBeforeGisun and (Trim(DokumentSVID_NOMER.AsString)<>'') then begin
      s:=CheckFieldDate(DokumentDATESV,-1,YearOf(dmBase.GetCurDate),false,'<',DokumentDATEZ);
      if s<>'' then  AddErr('Дата выдачи свидетельства '+s);
    end;
    }
//    if DokumentID.AsInteger=-1 then begin // запись акта еще не сохранялась
//      if (DokumentDateZ.AsDateTime>IncDay(dmBase.GetCurDate,-31)) then begin  // если не прошло 31 дней
//        if DokumentDateR.IsNull and (DokumentTEXT_VOZR.AsString='')  then AddErr('Заполните дату рождения.');
//        if DokumentDateS.IsNull and (DokumentTEXT_DATES.AsString='') then AddErr('Заполните дату смерти.');
//        if DokumentDateZH.IsNull then AddErr('Заполните дату захоронения.');
//      end;
//    end;
    FLastError:=strErr;
    if FLastError<>'' then Result:=false;
  end;
end;

//-------------------------------------------------------------------
procedure TfmAktZ.AfterCheckAkt_GISUN(nType:Integer);
begin
//  CheckControlPrSmert;
  CheckControlZAH(false,true);
end;

//-------------------------------------------------------------------
procedure TfmAktZ.Event_EmptyPrich(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentEMPTY_PRICH.AsBoolean:=not DokumentEMPTY_PRICH.AsBoolean;
//  CheckControlPrSmert;
end;
//-----------------------------------------------------------------------------
procedure TfmAktZ.edMogilaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  if FAddNewDok then begin
    Event_LastNomerMog(Sender, Handled);
  end;
end;
//-----------------------------------------------------------------------------
procedure TfmAktZ.edPlaceEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  if tsAllZah.TabVisible then begin
    if (edZH_KLAD.Value=null) or (edZH_KLAD.Text='') then begin
      PutError('Заполните место захоронения', self);
    end else if Trim(edPlace.Text)='' then begin
      PutError('Заполните участок', self);
    end else if FCheckSector and (Trim(edSector.Text)='') then begin
      PutError('Заполните сектор', self);
    end else if FCheckRad and (Trim(edRow.Text)='') then begin
      PutError('Заполните ряд', self);
    end else begin
      ReadAllMenUch(edZH_KLAD.Value, edPlace.Text);
    end;
  end;
end;
//-----------------------------------------------------------------------------
procedure TfmAktZ.Event_LastNomerMog(Sender: TObject; var Handled:Boolean);
var
  sSQL,s,sErr:String;
  nMax,n:Integer;
begin
  if edZH_KLAD.Value<>null then begin
    if Trim(edPlace.Text)='' then begin
      sErr:='Заполните участок';
    end else if FCheckSector and (Trim(edSector.Text)='') then begin
      sErr:='Заполните сектор';
    end else if FCheckRad and (Trim(edRow.Text)='') then begin
      sErr:='Заполните ряд';
    end;
    if sErr<>'' then begin
      PutError(sErr, self);
      exit;
    end;
    nMax:=0;
    sSQL:='SELECT ZH_MOG, ID FROM AktZ WHERE ZH_KLAD='+VarToStr(edZH_KLAD.Value);
    if (edSector.Text<>'') then sSQL:=sSQL+' and ZH_UCH='+QStr(edSector.Text);
    if (edRow.Text<>'')    then sSQL:=sSQL+' and ZH_RAD='+QStr(edRow.Text);
    if (edPlace.Text<>'')  then sSQL:=sSQL+' and ZH_UCH2='+QStr(edPlace.Text);
    with dmBase.WorkQuery do begin
      SQL.Text:=sSQL;
      Open;
      if Eof then begin
        edMogila.Text:='1';
      end else begin
        while not Eof do begin
          s:=KeepCharsR(Fields[0].AsString,'0123456789');   // оставить только цифры
          n:=StrToIntDef(s,0);
          if (n>0) and (n>nMax)
            then nMax:=n;
          Next;
        end;
      end;
      Close;
      if nMax>0 then begin
        edMogila.Text:=IntToStr(nMax+1);
      end else begin
        Beep;
      end;
    end;
  end;
end;
//-----------------------------------------------------------------------------
procedure TfmAktZ.edPlaceKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
//  if (Shift=[]) and (Key=VK_INSERT) then begin
//    Key:=0;
//    ReadAllMenUch(edZH_KLAD.Value, edPlace.Text);
//  end;
end;
//-----------------------------------------------------------------------------
function TfmAktZ.ReadAllMenUch(vKlad:Variant; sPlace:String):Boolean;
var
  sSQL:String;
  cur:TCursor;
begin
  Result:=false;
  if tsAllZah.TabVisible and (vKLAD<>null) and (Trim(sPlace)<>'') then begin
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    pcZah.ActivePage:=tsAllZah;
    tbAllZah.DisableControls;
    tbAllZah.EmptyTable;
    try
      sSQL:='SELECT * FROM AktZ WHERE ZH_KLAD='+VarToStr(vKLAD);
      if (DokumentZH_UCH.AsString<>'') then sSQL:=sSQL+' and ZH_UCH='+QStr(DokumentZH_UCH.AsString);
      if (DokumentZH_RAD.AsString<>'')    then sSQL:=sSQL+' and ZH_RAD='+QStr(DokumentZH_RAD.AsString);
      sSQL:=sSQL+' and ZH_UCH2='+QStr(sPlace);
      with dmBase.WorkQuery do begin
        SQL.Text:=sSQL;
        Open;
        while not Eof do begin
          if FieldByName('ID').AsInteger<>DokumentID.AsInteger then begin
            Result:=true;
            tbAllZah.Append;
            tbAllZahID.AsInteger:=FieldByName('ID').AsInteger;
            tbAllZahFAMILIA.AsString:=FieldByName('FAMILIA').AsString;
            tbAllZahNAME.AsString:=FieldByName('NAME').AsString;
            tbAllZahOTCH.AsString:=FieldByName('OTCH').AsString;
            tbAllZahBOOK.AsString:=FieldByName('BOOK').AsString;
            WriteDateField(tbAllZahDATER, FieldByName('DATER'));
            WriteDateField(tbAllZahDATES, FieldByName('DATES'));
            WriteDateField(tbAllZahDATEZ, FieldByName('DATEZ'));
            tbAllZahNOMER.AsString:=FieldByName('NOMER').AsString;
            tbAllZahZH_MOG.AsString:=FieldByName('ZH_MOG').AsString;
            tbAllZahPOLE_GRN.AsInteger:=FieldByName('POLE_GRN').AsInteger;
            tbAllZah.Post;
          end;
          Next;
        end;                                
        Close;
      end;
    finally
      tbAllZah.First;
      tbAllZah.EnableControls;
      Screen.Cursor:=cur;
    end;
  end;
end;
//-----------------------------------------------------------------------------
function TfmAktZ.WriteAllMenUch:Boolean;
var
  sSQL:String;
begin
  Result:=false;
  if tsAllZah.TabVisible and (tbAllZah.RecordCount>0) then begin
    tbAllZah.DisableControls;
    tbAllZah.First;
    sSQL:='';
    try
      while not tbAllZah.Eof do begin
        if Gisun.GetPoleGrn(tbAllZahPOLE_GRN)<>rPost then begin
          Result:=true;
          sSQL:=sSQL+'UPDATE AktZ SET ZH_MOG='+QStr(Trim(tbAllZahZH_MOG.AsString))+' WHERE ID='+tbAllZahID.AsString+';'#13#10;
        end;
        tbAllZah.Next;
      end;
      if sSQL<>''
        then dmBase.AdsConnection.Execute(sSQL);
    finally
      tbAllZah.First;
      tbAllZah.EnableControls;
    end;
  end;
end;

//-------------------------------------------------------------------
procedure TfmAktZ.Event_TrueAkt(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
//  EditDataSet(Dokument);
//  if TTbItem(Sender).Checked
//    then DokumentDECL_ID.AsInteger:=1
//    else DokumentDECL_ID.AsInteger:=0;
end;
//-------------------------------------------------------------------
procedure TfmAktZ.Event_Check(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  SetPrintDeclDok(_TypeObj_AktZAH, TTbItem(Sender).Checked);
end;

//-------------------------------------------------------------------
procedure TfmAktZ.Event_TextVozr(Sender: TObject);
begin
end;

procedure TfmAktZ.SetOnlyPovtorSvid(lOnlyPovtor: Boolean; pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;
                                          lbSvid, lbNomer: TLabel);
begin
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
  if lOnlyPovtor then begin
//  TBSubmenuGISUN.Visible:=false;
    TBItemSeekAkt.Visible:=true;
    TBItemStep2.Caption:='Зарегистрировать свидетельство';
//    TBItemChoiceBrak.Visible:=false;
//    TBItemChoiceRogd.Visible:=false;
//    TBItemVozrast.Visible:=false;

  end;
end;

procedure TfmAktZ.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;

procedure TfmAktZ.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

procedure TfmAktZ.Button3Click(Sender: TObject);
begin
  inherited;
//  GlobalFontNameE:=listbox1.Items.Strings[listbox1.ItemINdex];
//  SetFlatEhComp(Self,GlobalFlat,FCharCase,FCheckSVIDControl);
end;

procedure TfmAktZ.edINST_MN_NAMEEditButtons0Click(Sender: TObject;  var Handled: Boolean);
{$IFDEF LAIS}
var
  adr : TAdres;
  s : String;
  v : Variant;
  arrRec : TCurrentRecord;
  nID : Integer;
  strName : String;
  lCheck : Boolean;
begin
  if ChoiceMen( edINST_MN_NAME, '', '', arrRec) then begin
      lCheck:=dbDisableControls(Dokument);
      try
        EditDataSet(Dokument);
        nID:=GetValueField(arrRec, 'ID');
        DokumentINST_MN_ID.AsInteger:=nID;
        DokumentINST_MN_NAME.AsString:=FirstUpper(Trim(GetValueFieldEx(arrRec, 'FAMILIA','')+' '+GetValueFieldEx(arrRec, 'NAME','')+' '+GetValueFieldEx(arrRec, 'OTCH','')));
        adr:=dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
        if adr.AdresID>0
          then DokumentINST_MN_ADRES.AsString:=adr.Raion+GetWordRAION(adr.Raion,',')+adr.AdresPropis
          else DokumentINST_MN_ADRES.AsString:=adr.AdresPropis;
        PostDataSet(Dokument);
      finally
        dbEnableControls(Dokument,lCheck);
      end;
  end;
end;
{$ELSE}
begin
//
end;
{$ENDIF}

procedure TfmAktZ.edDeclEditButtons0Click(Sender: TObject;  var Handled: Boolean);
{$IFDEF LAIS}
var
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  adr : TAdres;
  nID,n : Integer;
  strName : String;
  lCheck : Boolean;
  p:TPassport;
{$ENDIF}
begin
{$IFDEF LAIS}
  s:=Trim(edDecl.Text);
  n:=Pos(' ',s);
  if n>0
    then s:=Copy(s,1,n-1);
  if ChoiceMen( edDecl, s, '', arrRec) then begin
      lCheck:=dbDisableControls(Dokument);
      try
        EditDataSet(Dokument);
        v := GetValueField(arrRec, 'ID');
        nID := StrToInt(VarToStr(v));
        edDecl.Text:=Trim(GetValueFieldEx(arrRec, 'FAMILIA','')+' '+GetValueFieldEx(arrRec, 'NAME','')+' '+GetValueFieldEx(arrRec, 'OTCH',''));
        edDECL_TEL.Text:=GetValueFieldEx(arrRec, 'TELEFON','');
        edDECL_MOB.Text:=GetValueFieldEx(arrRec, 'TELEFON_M','');
        adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
        DokumentGT_IS_TEXT.AsBoolean:=false;
        DokumentGT_GOSUD.AsInteger:=MY_GRAG;
        DokumentGT_B_OBL.AsBoolean:=true;
        DokumentGT_OBL.AsString:=adr.Obl;
        DokumentGT_RAION.AsString:=adr.Raion;
        DokumentGT_B_GOROD.AsInteger:=adr.PunktTK;
        DokumentGT_GOROD.AsString:=adr.PunktN;
        DokumentGT_GOROD_R.AsString:=adr.Ulica;
        DokumentGT_DOM.AsString:=adr.NDom;
        DokumentGT_KORP.AsString:=adr.Korp;
        DokumentGT_KV.AsString:=adr.Kv;
        p:=dmBase.PasportMen( dmBase.GetDateCurrentSost,v);
        DokumentDECL_DOK.AsString:=dmBase.PasportToText(p,0);
      finally
        dbEnableControls(Dokument,lCheck);
      end;
  end;
{$ENDIF}
end;
//--------------------------------------------------------------------------------
procedure TfmAktZ.edDecl_AdresEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  adr : TAdres;
  s : String;
  sFIO:String;
begin
  sFIO:='';
  s:=VvodDecl(false,false,sFIO,adr);
  if s<>'' then begin
//    EditDataSet(Dokument);
//    DokumentDECL_ADRES.AsString := s;
//    PostDataSet(Dokument);
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmAktZ.btAddClick(Sender: TObject);
begin
  QueryExit:=true;
  tbAddMen.Append;
  ActiveControl:=GridAddMen;
end;
//--------------------------------------------------------------------------------
procedure TfmAktZ.btDelClick(Sender: TObject);
begin
  if tbAddMen.RecordCount>0 then begin
    QueryExit:=true;
    tbAddMen.Delete;
    ActiveControl:=GridAddMen;
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmAktZ.edDeclUpdateData(Sender: TObject; var Handled: Boolean);
var
  ed : TDbEditEh;
begin
  ed := TDbEditEh(Sender);
  ed.Text:=FirstUpper(ed.text);
end;
//--------------------------------------------------------------------------------
procedure TfmAktZ.edPrOsn_NameEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_PRICHSM_', 'PR_OSN_NAME', true);
  Handled := true;
end;
//--------------------------------------------------------------------------------
procedure TfmAktZ.edZH_KLADChange(Sender: TObject);
begin
  KLADChange(edZH_KLAD.Value);
end;
//--------------------------------------------------------------------------------
procedure TfmAktZ.KLADChange(Value:Variant);
var
  n:Integer;
begin
  if not FRun and not IsReadDokument then begin
    FRun:=true;
    try
      if Value=null
        then n:=-1
        else n:=Value;
      EditDataSet(Dokument);
      if dmBase.SprZAH.Locate('ID',n,[]) then begin

        Run_ReadListBooks(n);

        with dmBase.SprZAH do begin
          FGisRnKlad:=dmBase.SprZAH.FieldByName('ID_GIS').AsInteger;
          try
            if FieldByName('SECTOR').AsString='1'
              then CheckSectorUch(true)
              else CheckSectorUch(false);
          except
            CheckSectorUch(false);
          end;
          FCheckSector:=FieldByName('IS_SECTOR').AsBoolean;
          FCheckRad:=FieldByName('IS_RAD').AsBoolean;
          DokumentZH_GOSUD.AsInteger:=MY_GRAG;
          DokumentZH_OBL.AsString:=FieldByName('OBL').AsString;
          DokumentZH_B_OBL.AsBoolean:=true;
          DokumentZH_RAION.AsString:=FieldByName('RAION').AsString;
          DokumentZH_B_GOROD.AsString:=FieldByName('B_GOROD').AsString;
          DokumentZH_GOROD.AsString:=FieldByName('GOROD').AsString;
          DokumentZH_SS.AsString:=FieldByName('SS').AsString;
          if FieldByName('BOOK').AsInteger>0
            then DokumentBOOK.AsInteger:=FieldByName('BOOK').AsInteger
            else DokumentBOOK.AsString:='';
//          if DokumentBOOK.AsInteger=0 then DokumentBOOK.AsInteger:=1;
          DokumentZH_KLAD.AsInteger:=Value;
          SetNewNomerDok(true);   //         ZH_KLAD !!!        !!!!!
        end;
      end;
    finally
      FRun:=false;
    end;
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmAktZ.SetValuesFromKlad(nID:Integer; lOnlyCheck:Boolean);
begin
  if (nID>0) and dmBase.SprZAH.Locate('ID',nID,[]) then begin
    with dmBase.SprZAH do begin
      try
        if FieldByName('SECTOR').AsString='1'
          then CheckSectorUch(true)
          else CheckSectorUch(false);
      except
        CheckSectorUch(false);
      end;
      FCheckSector:=FieldByName('IS_SECTOR').AsBoolean;
      FCheckRad:=FieldByName('IS_RAD').AsBoolean;
      if not lOnlyCheck then begin
        DokumentZH_GOSUD.AsInteger:=MY_GRAG;
        DokumentZH_OBL.AsString:=FieldByName('OBL').AsString;
        DokumentZH_B_OBL.AsBoolean:=true;
        DokumentZH_RAION.AsString:=FieldByName('RAION').AsString;
        DokumentZH_B_GOROD.AsString:=FieldByName('B_GOROD').AsString;
        DokumentZH_GOROD.AsString:=FieldByName('GOROD').AsString;
        DokumentZH_SS.AsString:=FieldByName('SS').AsString;
        if FieldByName('BOOK').AsInteger>0
          then DokumentBOOK.AsInteger:=FieldByName('BOOK').AsInteger
          else DokumentBOOK.AsString:='';
      end;
//      if DokumentBOOK.AsInteger=0 then DokumentBOOK.AsInteger:=1;
    end;
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmAktZ.CheckSectorUch(lVkl:Boolean);
const
  smesh=104;
var
  n:Integer;
  lCheck:Boolean;
//  s:String;
begin
  lCheck:=false;
  n:=0;
//  if lVkl then s:='VKL=1' else s:='VKL=0';
//  Showmessage(s);
//  WriteToDebug([s]);
  if lVkl then begin
    if not FSecUch then begin
      FSecUch:=true;
      lbSector.Caption:='Сектор/участок сектора';
      edSector.Width:=100;
      edSector.Left:=62+smesh;
      n:=100;
      lCheck:=true;
    end;
  end else begin
    if FSecUch then begin
      FSecUch:=false;
      lbSector.Caption:='Сектор';
      edSector.Width:=80;
      edSector.Left:=62;
      lCheck:=true;
    end;
  end;
  if lCheck then begin
    lbRow.Left:=arrCont[0]+n;
    edRow.Left:=arrCont[1]+n;
    lbPlace.Left:=arrCont[2]+n;
    edPlace.Left:=arrCont[3]+n;
    lbMogila.Left:=arrCont[4]+n;
    edMogila.Left:=arrCont[5]+n;
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmAktZ.edMOG_TYPE1Change(Sender: TObject);
begin
//  if not FRun and not IsReadDokument then begin
//    EditDataSet(Dokument);
//    if edMOG_TYPE.ItemIndex=0 then DokumentMOG_W.AsFloat:=1.4;
//    if edMOG_TYPE.ItemIndex=1 then DokumentMOG_W.AsFloat:=2.0;
//  end;
end;

procedure TfmAktZ.edMOG_TYPEChange(Sender: TObject);
begin
  if not FRun and not IsReadDokument then begin
    if edMOG_TYPE.Value<>null then begin
      EditDataSet(Dokument);
      if dmBase.SprRazmer.Locate('ID', edMOG_TYPE.Value, [] ) then begin
        DokumentMOG_W.AsFloat:=dmBase.SprRazmer.FieldByName('MOG_W').AsFloat;
        DokumentMOG_L.AsFloat:=dmBase.SprRazmer.FieldByName('MOG_L').AsFloat;
      end;
    end;  
  end;
end;

procedure TfmAktZ.edAktSostEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edAktSost);
end;

procedure TfmAktZ.Edit1Enter(Sender: TObject);
//var
//  tz:TTimeZoneInformation;
//  st:TSystemTime;
//  t:TTime;
begin
//  d:=GetSystemTime();
//  GetTimeZoneInformation(tz);
//  tz.Bias;
//  edit1.Text:=tz.StandardName;
//  GetSystemTime(st); //  возвращает UTC время
//  t:=EncodeTime(st.wHour,st.wMinute,st.wSecond,st.wMilliseconds);
//  edit1.Text:=TimeToStr(t); // inttostr(integer(st.wHour))+':'+inttostr(integer(st.wMinute))+':'+inttostr(integer(st.wSecond));
//  tz.StandardBias;
//  edit2.Text:=inttostr(tz.Bias)+':'+inttostr(tz.StandardBias);
//  tz.DaylightDate;
//  tz.DaylightBias;
end;

procedure TfmAktZ.CheckControlGT(lString:Boolean);
begin
  lbGT.Visible:=not lString;
  lbGT_OBL.Visible:=not lString;
  lbGT_RN.Visible:=not lString;
//  lbGT_RNG.Visible:=not lString;
  lbGT_DOM.Visible:=not lString;
  lbGT_KORP.Visible:=not lString;
  lbGT_KV.Visible:=not lString;
  lbGT_UL.Visible:=not lString;
  lbGT_GOR.Visible:=not lString;
  edGT_B_RESP.Visible:=not lString;
  edGT_GOSUD.Visible:=not lString;
  edGT_GOROD.Visible:=not lString;
  edGT_B_GOROD.Visible:=not lString;
//  edGT_RNGOROD.Visible:=not lString;
  edGT_OBL.Visible:=not lString;
  edGT_RAION.Visible:=not lString;
  edGT_GOROD_R.Visible:=not lString;
  edGT_DOM.Visible:=not lString;
  edGT_KORP.Visible:=not lString;
  edGT_KV.Visible:=not lString;
  cbGT_B_OBL.Visible:=not lString;

  edGT_TEXT.Visible:=lString;
  edGT_TEXT.Left:=lbGT.Left;
  edGT_TEXT.Width:=edGT_OBL.Left+edGT_OBL.Width-edGT_TEXT.Left;

//  if lString then begin

//  end else begin

//  end;

end;
//----------------------------------------------------------
procedure TfmAktZ.N_F_cbGT_IS_TEXTClick(Sender: TObject);
begin
  CheckControlGT(N_F_cbGT_IS_TEXT.Checked);
end;
//-------------------------------------------------
procedure TfmAktZ.GridAllMenGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (Column.FieldName<>'ZH_MOG') or (Gisun.GetPoleGrn(tbAllZahPOLE_GRN)=rPost)
    then Background:=clInfoBk;
end;
//-------------------------------------
procedure TfmAktZ.tbAllZahAfterScroll(DataSet: TDataSet);
begin
  GridAllMen.Columns[COL_MOG].ReadOnly:=(Gisun.GetPoleGrn(tbAllZahPOLE_GRN)=rPost);
end;
//-------------------------------------
procedure TfmAktZ.edSectorCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
begin
//DrawState:=FCheckSector;
end;

procedure TfmAktZ.edRowCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
//DrawState:=FCheckRad;
end;

procedure TfmAktZ.edPlaceCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
begin
//DrawState:=true;
end;

procedure TfmAktZ.edMogilaCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
//DrawState:=true;
end;
//-----------------------------------
procedure TfmAktZ.edSectorUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if (edSector.Text<>'') and FSecUch and (Pos('/', edSector.Text)=0) then begin
    raise EMyError.Create('Номер сектора должен быть разделен символм "/"');
  end;
end;
//-----------------------------------
procedure TfmAktZ.GridAllMenColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  n:Integer;
begin
{$IFDEF GISUN}
  if not EditMode then begin
    try
      if Params.Text='' then n:=0 else n:=StrToInt(Params.Text);
      if Params.Text='' then n:=0 else n:=StrToInt(Params.Text);
    except
      n:=0;
    end;
    n:=Gisun.GetPoleGrn(tbAllZahPOLE_GRN);
    Params.ImageIndex:=n;
  end;
{$ENDIF}
end;

procedure TfmAktZ.pmEnableEditClick(Sender: TObject);
begin
  CheckControlZAH(true,false);
end;

procedure TfmAktZ.edUslugEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  Handled := true;
  EditDataSet(Dokument);
  DokumentUSLUG_SPR.AsString:= '';
  DokumentUSLUG.AsString:= '';
  CheckUslug;
end;
//-----------------------------
procedure TfmAktZ.edZH_TYPEChange(Sender: TObject);
var
  n:Integer;
begin
  n:=edZH_TYPE.ItemIndex;
  if n<0 then n:=1 else n:=n+1;
  CheckControlType(n);
end;
//-----------------------------
procedure TfmAktZ.N_F_lbStatusGetText(Sender: TObject; var Text: String);
begin
  Text:=GlobalTask.CurrentOpisEdit.SeekValue('KEY_GIS_STATUS', DokumentSTATUS.AsString, false);
end;
//-----------------------------
procedure TfmAktZ.N_F_cbLoadCheckChange(Sender: TObject);
begin
  EditDataSet(Dokument);  
  if N_F_cbLoadCheck.ItemIndex<0
    then DokumentLOAD_CHECK.AsString:=''
    else DokumentLOAD_CHECK.AsInteger:=N_F_cbLoadCheck.ItemIndex;
end;
//-----------------------------
procedure TfmAktZ.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if N_F_cbLoadCheck.Visible then begin
    if (Shift=[ssCtrl]) and (Key=VK_F1) and N_F_cbLoadCheck.Visible then begin
      Key:=0;
      if not DokumentLOAD_CHECK.IsNull then begin
        if N_F_cbLoadCheck.ItemIndex=0      // не проверено
          then N_F_cbLoadCheck.ItemIndex:=1
          else N_F_cbLoadCheck.ItemIndex:=0;
        N_F_cbLoadCheckChange(nil);
      end;
    end;
  end;
  inherited;
end;

procedure TfmAktZ.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//
end;

procedure TfmAktZ.btLoadFIOClick(Sender: TObject);
begin
  if btLoadFIO.Visible then begin
    EditDataSet(Dokument);
    if DokumentFAMILIA_GIS.AsString<>'' then begin
      DokumentFamilia.AsString:=DokumentFAMILIA_GIS.AsString;
      DokumentName.AsString:=DokumentNAME_GIS.AsString;
      DokumentOtch.AsString:=DokumentOTCH_GIS.AsString;
      Dokument.Post;
      CheckControlZAH(false,false);
    end;
  end;
end;

procedure TfmAktZ.FIO_GISRNGetText(Sender: TObject; var Text: String);
begin
  Text:='ГИС РН: '+CreateFIO(Dokument,'_GIS;E');
end;

procedure TfmAktZ.TBItemNomerBookClick(Sender: TObject);
begin
  if not edBook.ReadOnly then begin
    Dokument.CheckBrowseMode;
    Run_GetNumberBook;
  end;
end;
//--------------------------------------------------------------
procedure TfmAktZ.Run_ReadListBooks(nKlad:Integer);
begin
  if nKlad>0 then begin
    mtBooks.First;
    if not mtBooks.FieldByName('KLAD').IsNull and (mtBooks.FieldByName('KLAD').AsInteger<>nKlad)
      then TkbmMemTable(mtBooks).EmptyTable;
    if (mtBooks.RecordCount=0)                      
      then ReadListAllBooks(mtBooks, nKlad);
  end;    
end;
//--------------------------------------------------------------
procedure TfmAktZ.Run_GetNumberBook;
var
  info:TOneRecZah;
  d:TDateTime;
  sErr,s:String;
  m,nKlad:Integer;
begin            
  sErr:='';
  d:=0;
  if FLoadCSV then begin
    if not DokumentDATEZH.IsNull then d:=DokumentDATEZH.AsDateTime else if not DokumentDATEZ.IsNull  then d:=DokumentDATEZ.AsDateTime;
  end else begin
    if not DokumentDATEZ.IsNull  then d:=DokumentDATEZ.AsDateTime  else if not DokumentDATEZH.IsNull then d:=DokumentDATEZH.AsDateTime;
  end;
  nKlad:=DokumentZH_KLAD.AsInteger;
  if nKlad=0 then begin
    sErr:='Заполните место захоронения';
  end else if d=0 then begin
    sErr:='Заполните дату захоронения или дату записи';
  end else begin
    if edZH_TYPE.Visible and (DokumentZH_TYPE.AsInteger=0)
      then sErr:='Заполните тип захоронения';
    if sErr='' then begin
      Run_ReadListBooks(nKlad);

      info.Klad:=DokumentZH_KLAD.AsString;
      info.Tip:=DokumentZH_TYPE.AsInteger;
      info.DateZah:=d;
      m:=GetNumberBook(mtBooks, info, s);
      if m>0 then begin
        EditDataSet(Dokument);
        DokumentBOOK.AsInteger:=m;
        FNewDate:=d;
        try
          SetNewNomerDok(true);
        finally
          FNewDate:=-1;
        end;
      end else begin
        ShowMessageCont(s,self);
      end;
    end;
  end;
  if sErr<>''
    then PutError(sErr,self);
end;

procedure TfmAktZ.dsAddMenDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) and not IsReadDokument then begin
    QueryExit:=true;
  end;
end;

procedure TfmAktZ.dsAllZahDataChange(Sender: TObject; Field: TField);
begin
//
end;

end.





