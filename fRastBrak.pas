unit fRastBrak;

interface
{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uPadegFIO,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject, uProjectAll, DateUtils,
  ExtCtrls, OpisEdit, dbFunc, MetaTask, DBLookupEh, DBCtrlsEh, StdCtrls,uTypes,
  Mask, Grids, DBGridEh, FuncPr, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  {$IFDEF GISUN} uGisun, {$ENDIF}
  ImgList,Buttons, vchDBCtrls, kbmMemCSVStreamFormat, ZipForge;

type
  TfmRastBrak = class(TfmSimpleD)
    TBItemChoiceMen: TTBItem;
    pc: TPageControl;
    tsTail1: TTabSheet;
    Label1: TLabel;
    edON_Familia: TDBEditEh;
    edONA_Familia: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edON_FamiliaP: TDBEditEh;
    edONA_FamiliaP: TDBEditEh;
    Label5: TLabel;
    Label6: TLabel;
    lbDateR_Rodit: TLabel;
    edON_Name: TDBEditEh;
    edON_OTCH: TDBEditEh;
    edONA_Name: TDBEditEh;
    edONA_OTCH: TDBEditEh;
    edON_DATER: TDBDateTimeEditEh;
    edONA_DATER: TDBDateTimeEditEh;
    Label8: TLabel;
    Label13: TLabel;
    edON_NATION: TDBLookupComboboxEh;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edON_M_GOSUD: TDBLookupComboboxEh;
    edON_M_GOROD: TDBEditEh;
    edON_GOROD: TDBEditEh;
    edONA_GOROD: TDBEditEh;
    Label22: TLabel;
    edON_GRAG: TDBLookupComboboxEh;
    Label23: TLabel;
    edON_M_GOROD_R: TDBEditEh;
    edONA_NATION: TDBLookupComboboxEh;
    edONA_M_GOSUD: TDBLookupComboboxEh;
    edONA_M_GOROD: TDBEditEh;
    edONA_GRAG: TDBLookupComboboxEh;
    edONA_M_GOROD_R: TDBEditEh;
    tsTail2: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    pnMain: TPanel;
    lbNomer: TLabel;
    edNomer: TDBEditEh;
    Label28: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label31: TLabel;
    Label32: TLabel;
    edOTMETKA: TDBEditEh;
    dsDeti: TDataSource;
    tbDeti: TkbmMemTable;
    tbDetiFAMILIA: TStringField;
    tbDetiNAME: TStringField;
    tbDetiOTCH: TStringField;
    tbDetiGOD_ROG: TIntegerField;
    edON_M_B_OBL: TDBCheckBoxEh;
    edONA_M_B_OBL: TDBCheckBoxEh;
    dsNation: TDataSource;
    dsStran: TDataSource;
    N_F_1: TDBCheckBoxEh;
    edRukov: TDBEditEh;
    edSpec: TDBEditEh;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentON_SVID_SERIA: TStringField;
    DokumentON_SVID_NOMER: TStringField;
    DokumentONA_SVID_SERIA: TStringField;
    DokumentONA_SVID_NOMER: TStringField;
    DokumentON_SVID_DATE: TDateField;
    DokumentON_Familia: TStringField;
    DokumentON_FamiliaP: TStringField;
    DokumentON_Name: TStringField;
    DokumentON_Otch: TStringField;
    DokumentON_DateR: TDateField;
    DokumentON_GOSUD: TIntegerField;
    DokumentON_OBL: TStringField;
    DokumentON_RAION: TStringField;
    DokumentON_GOROD: TStringField;
    DokumentON_NATION: TIntegerField;
    DokumentON_GRAG: TIntegerField;
    DokumentON_WORK: TStringField;
    DokumentON_OBRAZ: TIntegerField;
    DokumentON_M_GOSUD: TIntegerField;
    DokumentON_M_OBL: TStringField;
    DokumentON_M_RAION: TStringField;
    DokumentON_M_GOROD: TStringField;
    DokumentON_M_GOROD_R: TStringField;
    DokumentON_POSHLINA: TStringField;
    DokumentON_SEM: TIntegerField;
    DokumentON_DOKUMENT: TMemoField;
    DokumentOTMETKA: TMemoField;
    DokumentONA_Familia: TStringField;
    DokumentONA_FamiliaP: TStringField;
    DokumentONA_Name: TStringField;
    DokumentONA_Otch: TStringField;
    DokumentONA_DateR: TDateField;
    DokumentONA_GOSUD: TIntegerField;
    DokumentONA_OBL: TStringField;
    DokumentONA_RAION: TStringField;
    DokumentONA_GOROD: TStringField;
    DokumentONA_NATION: TIntegerField;
    DokumentONA_GRAG: TIntegerField;
    DokumentONA_WORK: TStringField;
    DokumentONA_OBRAZ: TIntegerField;
    DokumentONA_M_GOSUD: TIntegerField;
    DokumentONA_M_OBL: TStringField;
    DokumentONA_M_RAION: TStringField;
    DokumentONA_M_GOROD: TStringField;
    DokumentONA_M_GOROD_R: TStringField;
    DokumentONA_SEM: TIntegerField;
    DokumentONA_DOKUMENT: TMemoField;
    DokumentDETI: TMemoField;
    DokumentON_B_RESP: TBooleanField;
    DokumentON_B_OBL: TBooleanField;
    DokumentON_M_B_RESP: TBooleanField;
    DokumentON_M_B_OBL: TBooleanField;
    DokumentONA_B_RESP: TBooleanField;
    DokumentONA_B_OBL: TBooleanField;
    DokumentONA_M_B_RESP: TBooleanField;
    DokumentONA_M_B_OBL: TBooleanField;
    DokumentONA_POSHLINA: TStringField;
    DokumentON_ID: TIntegerField;
    DokumentONA_ID: TIntegerField;
    DokumentRUKOV: TStringField;
    DokumentSPEC: TStringField;
    DokumentPROV: TBooleanField;
    DokumentON_Familia_B: TStringField;
    DokumentON_FamiliaP_B: TStringField;
    DokumentON_Name_B: TStringField;
    DokumentON_Otch_B: TStringField;
    DokumentONA_Familia_B: TStringField;
    DokumentONA_FamiliaP_B: TStringField;
    DokumentONA_Name_B: TStringField;
    DokumentONA_Otch_B: TStringField;
    DokumentRUKOV_B: TStringField;
    DokumentSUD_NAME: TMemoField;
    DokumentSUD_DATE: TDateField;
    DokumentBRAK_ZAKL: TMemoField;
    DokumentVOSSTAN: TBooleanField;
    DokumentISPRAV: TMemoField;
    DokumentID_ZAGS: TIntegerField;
    DokumentID_SOURCE: TIntegerField;
    DokumentFirst_Ekz: TBooleanField;
    Label40: TLabel;
    Label55: TLabel;
    edON_Svid_Nomer: TDBEditEh;
    edONA_SVID_DATE: TDBDateTimeEditEh;
    Label15: TLabel;
    edON_WORK: TDBEditEh;
    edONA_WORK: TDBEditEh;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    edON_SEM: TDBNumberEditEh;
    edONA_SEM: TDBNumberEditEh;
    edBrak: TDBEditEh;
    edSUD_NAME: TDBEditEh;
    edSUD_DATE: TDBDateTimeEditEh;
    edON_POSHLINA: TDBEditEh;
    edONA_POSHLINA: TDBEditEh;
    Label38: TLabel;
    edONA_SVID_NOMER: TDBEditEh;
    Label39: TLabel;
    DokumentONA_SVID_DATE: TDateField;
    edON_SVID_DATE: TDBDateTimeEditEh;
    Label29: TLabel;
    DokumentON_Familia_P: TStringField;
    DokumentON_Name_P: TStringField;
    DokumentON_Otch_P: TStringField;
    DokumentON_Familia_B_P: TStringField;
    DokumentON_Name_B_P: TStringField;
    DokumentON_Otch_B_P: TStringField;
    DokumentONA_Familia_P: TStringField;
    DokumentONA_Name_P: TStringField;
    DokumentONA_Otch_P: TStringField;
    DokumentONA_Familia_B_P: TStringField;
    DokumentONA_Name_B_P: TStringField;
    DokumentONA_Otch_B_P: TStringField;
    DokumentON_Familia_PD: TStringField;
    DokumentON_Name_PD: TStringField;
    DokumentON_Otch_PD: TStringField;
    DokumentON_Familia_B_PD: TStringField;
    DokumentON_Name_B_PD: TStringField;
    DokumentON_Otch_B_PD: TStringField;
    DokumentONA_Familia_PD: TStringField;
    DokumentONA_Name_PD: TStringField;
    DokumentONA_Otch_PD: TStringField;
    DokumentONA_Familia_B_PD: TStringField;
    DokumentONA_Name_B_PD: TStringField;
    DokumentONA_Otch_B_PD: TStringField;
    btPadeg: TButton;
    Label42: TLabel;
    edIzmen: TDBEditEh;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    dsGragd: TDataSource;
    DokumentCOPIA: TBooleanField;
    N_F_edCopy: TDBCheckBoxEh;
    DokumentARX_ADRESAT: TMemoField;
    DokumentARX_TEXT: TMemoField;
    DokumentARX_NOMER: TStringField;
    DokumentARX_DATE: TDateField;
    TBItemArxSpr: TTBItem;
    tsSprav: TTabSheet;
    Label43: TLabel;
    edAdresat: TDBEditEh;
    edNomerArxSpr: TDBEditEh;
    Label44: TLabel;
    Label45: TLabel;
    edDateArxSpr: TDBDateTimeEditEh;
    edAddTextArx: TDBEditEh;
    Label46: TLabel;
    edON_SVID_SERIA: TDBLookupComboboxEh;
    edONA_SVID_SERIA: TDBLookupComboboxEh;
    tsPovtor: TTabSheet;
    DokumentON_ONLYGOD: TBooleanField;
    DokumentONA_ONLYGOD: TBooleanField;
    cbOnlyGodON: TDBCheckBoxEh;
    cbOnlyGodONA: TDBCheckBoxEh;
    TBItemVozrast: TTBItem;
    DokumentON_VOZR: TSmallintField;
    DokumentONA_VOZR: TSmallintField;
    edON_VOZR: TDBNumberEditEh;
    edONA_VOZR: TDBNumberEditEh;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edON_B_GOROD: TDBLookupComboboxEh;
    edONA_B_GOROD: TDBLookupComboboxEh;
    edON_M_B_GOROD: TDBLookupComboboxEh;
    edONA_M_B_GOROD: TDBLookupComboboxEh;
    DokumentON_B_GOROD: TSmallintField;
    DokumentON_M_B_GOROD: TSmallintField;
    DokumentONA_B_GOROD: TSmallintField;
    DokumentONA_M_B_GOROD: TSmallintField;
    DokumentON_STATUS: TStringField;
    DokumentONA_STATUS: TStringField;
    DokumentON_IDENTIF: TStringField;
    DokumentONA_IDENTIF: TStringField;
    DokumentPOLE_GRN: TSmallintField;
    DokumentTYPEMESSAGE: TStringField;
    DokumentON_DOK_TYPE: TSmallintField;
    DokumentON_DOK_SERIA: TStringField;
    DokumentON_DOK_NOMER: TStringField;
    DokumentON_DOK_DATE: TDateField;
    DokumentON_DOK_ORGAN: TIntegerField;
    DokumentONA_DOK_TYPE: TSmallintField;
    DokumentONA_DOK_SERIA: TStringField;
    DokumentONA_DOK_NOMER: TStringField;
    DokumentONA_DOK_DATE: TDateField;
    DokumentONA_DOK_ORGAN: TIntegerField;
    ENG_edONA_IDENTIF: TDBEditEh;
    ENG_edON_IDENTIF: TDBEditEh;
    Label7: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    edON_DOKUMENT: TDBEditEh;
    edONA_DOKUMENT: TDBEditEh;
    edON_DOK_TYPE: TDBComboBoxEh;
    edON_DOK_SERIA: TDBEditEh;
    edON_DOK_NOMER: TDBEditEh;
    edON_DOK_DATE: TDBDateTimeEditEh;
    edONA_DOK_SERIA: TDBEditEh;
    edONA_DOK_TYPE: TDBComboBoxEh;
    edONA_DOK_NOMER: TDBEditEh;
    edONA_DOK_DATE: TDBDateTimeEditEh;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    ImageGISUN: TImage;
    N_F_cbBelorus: TDBCheckBoxEh;
    lbSud_Date: TLabel;
    edON_B_OBL: TDBCheckBoxEh;
    edONA_B_OBL: TDBCheckBoxEh;
    DokumentSPEC_B: TStringField;
    DokumentDETI_COUNT: TSmallintField;
    DokumentRN_ON_M_B_GOROD: TStringField;
    DokumentRN_ON_B_GOROD: TStringField;
    DokumentRN_ONA_M_B_GOROD: TStringField;
    DokumentRN_ONA_B_GOROD: TStringField;
    DokumentON_M_DOM: TStringField;
    DokumentON_M_KORP: TStringField;
    DokumentON_M_KV: TStringField;
    DokumentONA_M_DOM: TStringField;
    DokumentONA_M_KORP: TStringField;
    DokumentONA_M_KV: TStringField;
    DokumentON_M_RNGOROD: TStringField;
    DokumentONA_M_RNGOROD: TStringField;
    DokumentON_M_B_RN: TBooleanField;
    DokumentONA_M_B_RN: TBooleanField;
    Label16: TLabel;
    edON_OBRAZ: TDBComboBoxEh;
    edONA_OBRAZ: TDBComboBoxEh;
    edON_M_RNGOROD: TDBLookupComboboxEh;
    edONA_M_RNGOROD: TDBLookupComboboxEh;
    Label66: TLabel;
    edON_M_DOM: TDBEditEh;
    Label67: TLabel;
    edON_M_KORP: TDBEditEh;
    Label68: TLabel;
    edON_M_KV: TDBEditEh;
    Label71: TLabel;
    edONA_M_DOM: TDBEditEh;
    Label72: TLabel;
    edONA_M_KORP: TDBEditEh;
    Label73: TLabel;
    edONA_M_KV: TDBEditEh;
    DokumentON_SUM_POSHLINA: TFloatField;
    DokumentONA_SUM_POSHLINA: TFloatField;
    edON_SumPoshlina: TDBNumberEditEh;
    edONA_SumPoshlina: TDBNumberEditEh;
    tsSvid: TTabSheet;
    Label77: TLabel;
    Label76: TLabel;
    lbVidON: TLabel;
    lbVidON_B: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    edON_Familia_Sv: TDBEditEh;
    edON_Name_Sv: TDBEditEh;
    edON_Otch_Sv: TDBEditEh;
    edON_FamiliaPD_Sv: TDBEditEh;
    edON_NamePD_Sv: TDBEditEh;
    edON_OtchPD_Sv: TDBEditEh;
    edRukov_Sv: TDBEditEh;
    edON_FamiliaP_Sv: TDBEditEh;
    edONA_FamiliaP_Sv: TDBEditEh;
    BLR_edON_Familia_B_Sv: TDBEditEh;
    BLR_edON_Name_B_Sv: TDBEditEh;
    BLR_edON_Otch_B_Sv: TDBEditEh;
    BLR_edON_FamiliaPD_B_Sv: TDBEditEh;
    BLR_edON_NamePD_B_Sv: TDBEditEh;
    BLR_edON_OtchPD_B_Sv: TDBEditEh;
    BLR_edON_FamiliaP_B_Sv: TDBEditEh;
    BLR_edONA_FamiliaP_B_Sv: TDBEditEh;
    BLR_edRukov_Sv_B: TDBEditEh;
    lbVidONA: TLabel;
    lbVidONA_B: TLabel;
    edONA_FamiliaPD_Sv: TDBEditEh;
    edONA_NamePD_Sv: TDBEditEh;
    edONA_OtchPD_Sv: TDBEditEh;
    BLR_edONA_NamePD_B_Sv: TDBEditEh;
    BLR_edONA_FamiliaPD_B_Sv: TDBEditEh;
    BLR_edONA_OtchPD_B_Sv: TDBEditEh;
    edONA_Familia_Sv: TDBEditEh;
    edONA_Name_Sv: TDBEditEh;
    edONA_Otch_Sv: TDBEditEh;
    BLR_edONA_Familia_B_Sv: TDBEditEh;
    BLR_edONA_Name_B_Sv: TDBEditEh;
    BLR_edONA_Otch_B_Sv: TDBEditEh;
    Label50: TLabel;
    Label51: TLabel;
    DokumentTYPE_RAST: TSmallintField;
    N_F_edTypeRast: TDBComboBoxEh;
    DokumentBRAK_ID: TIntegerField;
    DokumentBRAK_DATE: TDateField;
    edBrakDate: TDBDateTimeEditEh;
    Label30: TLabel;
    Label52: TLabel;
    btSeek: TBitBtn;
    TBItemChoiceBrak: TTBItem;
    DokumentON_SOATO: TStringField;
    DokumentONA_SOATO: TStringField;
    pnDeti: TPanel;
    gbDeti: TGroupBox;
    GridDeti: TDBGridEh;
    Panel2: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    TBItemSpeedChoice: TTBItem;
    btRazdel: TButton;
    Label53: TLabel;
    edOnPodpis: TDBEditEh;
    edOnaPodpis: TDBEditEh;
    DokumentON_PODPIS: TStringField;
    DokumentONA_PODPIS: TStringField;
    edON_OBL_R: TDBEditEh;
    edON_RAION_R: TDBEditEh;
    edONA_OBL_R: TDBEditEh;
    edONA_RAION_R: TDBEditEh;
    edON_M_OBL: TDBEditEh;
    edON_M_RAION: TDBEditEh;
    edONA_M_OBL: TDBEditEh;
    edONA_M_RAION: TDBEditEh;
    Label37: TLabel;
    cbON_VUS: TDBCheckBoxEh;
    edON_Voenkom: TDBLookupComboboxEh;
    cbONA_VUS: TDBCheckBoxEh;
    edONA_VOENKOM: TDBLookupComboboxEh;
    DokumentON_VUS: TBooleanField;
    DokumentONA_VUS: TBooleanField;
    DokumentON_VOENKOM: TIntegerField;
    DokumentONA_VOENKOM: TIntegerField;
    TBItemPrintSvFIO: TTBItem;
    DokumentSUD_SILA: TDateField;
    lbSudSila: TLabel;
    edSudSila: TDBDateTimeEditEh;
    TBItemChoiceDeclRast: TTBItem;
    BLR_edON_FamiliaP: TDBEditEh;
    BLR_edON_Name: TDBEditEh;
    BLR_edON_Otch: TDBEditEh;
    BLR_edON_Familia: TDBEditEh;
    BLR_edONA_FamiliaP: TDBEditEh;
    BLR_edONA_Name: TDBEditEh;
    BLR_edONA_Otch: TDBEditEh;
    BLR_edONA_Familia: TDBEditEh;
    edBrakNomer: TDBEditEh;
    DokumentBRAK_NOMER: TStringField;
    Label96: TLabel;
    edON_SOATO: TDBEditEh;
    lbON_SOATO: TvchDBText;
    edONA_SOATO: TDBEditEh;
    lbONA_SOATO: TvchDBText;
    DokumentDECL_ID: TSmallintField;
    DokumentDECLARE_ID: TIntegerField;
    DokumentSVID_SERIA: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentDATESV: TDateField;
    lbSvid: TLabel;
    edSVID_SERIA: TDBLookupComboboxEh;
    lbSvid2: TLabel;
    edSvid_Nomer: TDBEditEh;
    lbSvid3: TLabel;
    edDateSV: TDBDateTimeEditEh;
    DokumentWHO_SVID: TStringField;
    N_F_cbPovtor: TDBCheckBoxEh;
    lbINON: TLabel;
    lbDateRON: TLabel;
    lbINONA: TLabel;
    lbDateRONA: TLabel;
    DokumentON_GRAG_ADD: TMemoField;
    DokumentONA_GRAG_ADD: TMemoField;
    DokumentBRAK_ZAKL_B: TStringField;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    N_F_lbON_Status: TvchDBText;
    N_F_lbONA_Status: TvchDBText;
    ImCondIN_ON: TImage;
    ImCondIN_ONA: TImage;
    DokumentON_IDENTIF_GIS: TStringField;
    DokumentONA_IDENTIF_GIS: TStringField;
    DokumentON_ATEID: TIntegerField;
    DokumentONA_ATEID: TIntegerField;
    procedure FormResize(Sender: TObject);
    procedure edON_FamiliaEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edONA_FamiliaEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edON_FamiliaEnter(Sender: TObject);
    procedure edON_FamiliaPEnter(Sender: TObject);
    procedure edON_OTCHEnter(Sender: TObject);
    procedure edON_NameEnter(Sender: TObject);
    procedure edONA_FamiliaEnter(Sender: TObject);
    procedure edONA_FamiliaPEnter(Sender: TObject);
    procedure edONA_NameEnter(Sender: TObject);
    procedure edONA_OTCHEnter(Sender: TObject);
    procedure edON_FamiliaCheckDrawRequiredState(Sender: TObject;      var DrawState: Boolean);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure btPadegClick(Sender: TObject);
    procedure edRukovEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TBItemArxSprClick(Sender: TObject);
    procedure TBItemAddSvidClick(Sender: TObject);
    procedure cbOnlyGodONClick(Sender: TObject);
    procedure TBItemVozrastClick(Sender: TObject);
    procedure edON_OBLNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edON_RAIONNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure edON_DATERUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSpecEnter(Sender: TObject);
    procedure N_F_cbPovtorClick(Sender: TObject);
    procedure btSeekClick(Sender: TObject);
    function WriteBrak(ArrRec:TCurrentRecord):Boolean;
    procedure TBItemChoiceBrakClick(Sender: TObject);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure btRazdelClick(Sender: TObject);
    procedure edON_VoenkomEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure edON_VoenkomEditButtons1Click(Sender: TObject;     var Handled: Boolean);
    procedure edON_VoenkomChange(Sender: TObject);
    procedure edONA_VOENKOMEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons1Click(Sender: TObject;    var Handled: Boolean);
    procedure edONA_VOENKOMChange(Sender: TObject);
    procedure TBItemPrintSvFIOClick(Sender: TObject);
    procedure N_F_edTypeRastChange(Sender: TObject);
    procedure TBItemChoiceDeclRastClick(Sender: TObject);
    procedure lbON_SOATOGetText(Sender: TObject; var Text: String);
    procedure lbONA_SOATOGetText(Sender: TObject; var Text: String);
    procedure edON_M_GOSUDUpdateData(Sender: TObject;       var Handled: Boolean);
    procedure edONA_M_GOSUDUpdateData(Sender: TObject;      var Handled: Boolean);
    procedure edON_SOATOClick(Sender: TObject);
    procedure edONA_SOATOClick(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edRukov_SvEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edON_SVID_DATEEnter(Sender: TObject);
    procedure edONA_SVID_DATEEnter(Sender: TObject);
    procedure edON_VoenkomEditButtons2Click(Sender: TObject;    var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons2Click(Sender: TObject;    var Handled: Boolean);
    procedure ENG_edON_IDENTIFCheckDrawRequiredState(Sender: TObject;   var DrawState: Boolean);
    procedure edON_DATERCheckDrawRequiredState(Sender: TObject;         var DrawState: Boolean);
    procedure ENG_edONA_IDENTIFCheckDrawRequiredState(Sender: TObject;   var DrawState: Boolean);
    procedure edONA_DATERCheckDrawRequiredState(Sender: TObject;       var DrawState: Boolean);
    procedure TBItemEditMemoClick(Sender: TObject);
    procedure edSpecEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure N_F_lbON_StatusClick(Sender: TObject);
    procedure N_F_lbON_StatusGetText(Sender: TObject; var Text: String);
    procedure N_F_lbONA_StatusClick(Sender: TObject);
    procedure N_F_lbONA_StatusGetText(Sender: TObject; var Text: String);
    procedure dsDetiDataChange(Sender: TObject; Field: TField);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    TbItemCondIN_ON: TTbItem;
    TbItemCondIN_ONA: TTbItem;

    TbItemVerno: TTbItem;
    FOnCheckSOATO:Boolean;
    FOnaCheckSOATO:Boolean;
    FPrintSvidPosle:Boolean;
    FWhoSvid:String;
    procedure AfterCheckAkt_GISUN(nType:Integer); override;
    function CreateSubMenuRun: Boolean; override;
    function BeforeEdit : Boolean; override;
    function BeforeReport:Boolean; override;
    procedure CheckValueSvid(lAll:Boolean);
    procedure CheckRnGorod;
    procedure CheckWhoSvid;

    function AddSvid(lAllRun:Boolean=false):String; override;

    procedure FIOUpdatePadegBLR(Sender: TObject; var Handled: Boolean);
    procedure FIOUpdatePadeg(Sender: TObject; var Handled: Boolean);
    function EmptyIzm: String; override;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure UpdateActions; override;
    procedure CheckOnlyGod;
    procedure CheckOnlyVozrast(lClear : Boolean);
    procedure WriteVOENKOM(nType:Integer);
    constructor Create(Owner : TComponent); override;
    procedure CheckControlSvid;
    procedure CheckSOATOAkt(lOn,lOna:Boolean; lCheckVoenkom:Boolean; strParam:String; nAteID:Integer; strSoato:String);

    function CheckDokumentSimple(nType:Integer; lWriteDok:Boolean):Boolean; override;
    procedure SetOnlyPovtorSvid(lOnlyPovtor:Boolean;pc:TPageControl; ts:TWinControl; NonVisibleControls : array of TVarRec; lbSvid,lbNomer:TLabel); override;
    function  CheckFIO: String; override;
    procedure SetSimpleVvod(sName:String);  override;
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;

    procedure Event_TrueAkt(Sender: TObject);
    procedure Event_CondIN_ON(Sender: TObject);
    procedure Event_CondIN_ONA(Sender: TObject);

    destructor Destroy; override;
  end;

  function EditRastBrak( nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;

var
  fmRastBrak: TfmRastBrak;

implementation

uses dBase, fMain, {fPadegRastBrak,} fChoiceNasel, fShablon, fSimpleSeekAkt;

{$R *.DFM}
{$I Task.inc}

{ TfmRastBrak }

function EditRastBrak( nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;
var
  n:Integer;
begin
//  Result := true;
  fmRastBrak := TfmRastBrak.Create(nil);
  fmRastBrak.IsCreateForm:=false;
  fmRastBrak.AssignPar(slPar);
  with fmRastBrak do begin
    SetOnlyPovtorSvid(lOnlyPovtor, pc, tsSvid, [ N_F_1, N_F_edTypeEkz, N_F_cbPovtor, N_F_cbBelorus ], lbSvid,lbNomer);
    {$IFDEF ZAGS}
    if not lOnlyPovtor then begin
      TBItemSprAkt.Visible:=true;      // доступность получения справки о записи акта
      TBItemDeclSvid.Visible:=true;
    end;
    {$ENDIF}
    if lOnlyPovtor and (slPar<>nil) then begin
      n:=slPar.IndexOfName('WHO_SVID');
      if n>-1 then FWhoSvid:=slPar.ValueFromIndex[n];
    end;
  end;
  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
    fmRastBrak.cbOnlyGodON.Visible:=true;
    fmRastBrak.cbOnlyGodONA.Visible:=true;
  end else begin
    fmRastBrak.cbOnlyGodON.Visible:=false;
    fmRastBrak.cbOnlyGodONA.Visible:=false;
  end;
  try
    fmRastBrak.IsReadDokument:=true;
    if nID=-1 then begin
      fmRastBrak.NewDok(true);
      fmRastBrak.SetIDZags;
      fmRastBrak.CheckEnabledNameOrgan(true);
    end else begin
      fmRastBrak.ReadDok( nID );
      fmRastBrak.TBItemZAGS.Visible:=false;
      fmRastBrak.CheckEnabledNameOrgan(false);
    end;
    fmRastBrak.IsReadDokument:=false;
    {$IFDEF GISUN}
    fmRastBrak.CheckAkt_GISUN(0);
//    Gisun.CheckRastBrak(fmRastBrak);
//    fmRastBrak.CheckImageGisun(fmRastBrak.DokumentPOLE_GRN,fmRastBrak.ImageGISUN);
    fmRastBrak.BeforeEditFormGISUN;
    {$ENDIF}
    Result := fmRastBrak.EditModal;
  finally
    fmRastBrak.Free;
    fmRastBrak := nil;
  end;
end;

function TfmRastBrak.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_ZRast); //
end;

//------------------------------------------------------------------------------------------
function TfmRastBrak.CreateSubMenuRun: Boolean;
var
 it : TTbItem;
 sep : TTbSeparatorItem;
begin
  inherited CreateSubmenuRun;
  Result:=true;

  AddSubmenu_CheckFIO;

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Аннулирование актовой записи';
  it.OnClick:=Event_Annulir;
  TBSubmenuRun.Add(it);

  TbItemVerno := TTbItem.Create(TBSubmenuRun);
  TbItemVerno.Caption:='Запись акта верна';
  TbItemVerno.OnClick:=Event_TrueAkt;
  TBSubmenuRun.Add(TbItemVerno);

  AddSubmenu_ReadDolg;

  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);
  TbItemCondIN_ON := TTbItem.Create(TBSubmenuRun);
  TbItemCondIN_ON.Caption:='Идентификационный номер мужчины не подлежит печати';
  TbItemCondIN_ON.OnClick:=Event_CondIN_ON;
  TBSubmenuRun.Add(TbItemCondIN_ON);

  TbItemCondIN_ONA := TTbItem.Create(TBSubmenuRun);
  TbItemCondIN_ONA.Caption:='Идентификационный номер женщины не подлежит печати';
  TbItemCondIN_ONA.OnClick:=Event_CondIN_ONA;
  TBSubmenuRun.Add(TbItemCondIN_ONA);

end;
//-------------------------------------------------------------------
procedure TfmRastBrak.Event_TrueAkt(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  if TTbItem(Sender).Checked
    then DokumentDECL_ID.AsInteger:=1
    else DokumentDECL_ID.AsInteger:=0;
end;
//-------------------------------------------------------------------
procedure TfmRastBrak.Event_CondIN_ON(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  if TTbItem(Sender).Checked
    then DokumentON_IDENTIF_GIS.AsString:='1'
    else DokumentON_IDENTIF_GIS.AsString:='0';
  CheckImageCondIN_(ENG_edON_IDENTIF, DokumentON_IDENTIF_GIS.AsString, ImCondIN_ON);
end;
//-------------------------------------------------------------------
procedure TfmRastBrak.Event_CondIN_ONA(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  if TTbItem(Sender).Checked
    then DokumentONA_IDENTIF_GIS.AsString:='1'
    else DokumentONA_IDENTIF_GIS.AsString:='0';
  CheckImageCondIN_(ENG_edONA_IDENTIF, DokumentONA_IDENTIF_GIS.AsString, ImCondIN_ONA);
end;
//-------------------------------------------------------------------
function TfmRastBrak.NewDok( lAppend : Boolean ): Boolean;
//var
// / s:String;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

  DokumentDECL_ID.AsInteger:=0;
  DokumentDECLARE_ID.AsInteger:=0;  // ссылка на заявление о браке

  DokumentON_VUS.AsBoolean:=true;
  DokumentONA_VUS.AsBoolean:=false;

  DokumentON_ONLYGOD.AsBoolean:=false;
  DokumentONA_ONLYGOD.AsBoolean:=false;

  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean  := false;

  DokumentON_B_RESP.AsBoolean     := false;    // после отправки в ГИС РН корректировались определенные реквизиты
  
  DokumentON_B_OBL.AsBoolean      := true;
  DokumentTYPE_RAST.AsInteger:=1;

  DokumentON_M_B_OBL.AsBoolean    := true;

  DokumentONA_B_OBL.AsBoolean     := true;

  DokumentONA_M_B_OBL.AsBoolean   := true;

  DokumentON_B_GOROD.AsInteger    := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_M_B_GOROD.AsInteger  := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_B_GOROD.AsInteger   := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_M_B_GOROD.AsInteger := GlobalTask.ParamAsInteger('TYPEPUNKT');

  DokumentON_NATION.AsInteger := NATION_NOT_SVED;
  DokumentONA_NATION.AsInteger := NATION_NOT_SVED;

//  DokumentBRAK_ZAKL.AsString := fmMain.SprNameOrg(GlobalTask.ParamAsInteger('ID'),'Т','');
  DokumentBRAK_ZAKL.AsString := fmMain.NameOrg('','Т');
  DokumentBRAK_ZAKL_B.AsString := fmMain.NameOrg('Б','');

    DokumentFirst_Ekz.AsBoolean := true;
  DokumentVOSSTAN.AsBoolean := false;
  if lAppend then begin
    CheckRnGorod;
  end;

  if (FWhoSvid='М') or (FWhoSvid='Ж') then DokumentWHO_SVID.AsString:=FWhoSvid;
  CheckWhoSvid;

  N_F_edTypeRastChange(nil);
  inherited NewDok(lAppend);

  if lAppend then begin
    CheckSOATOAkt(true,false,true,'',0,'');
    DokumentONA_SOATO.AsString:=DokumentON_SOATO.AsString;
  end;

  QueryExit:=false;
  Result := true;
end;
{
procedure TfmRastBrak.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
//----------------------------------------------------------------------------------
function TfmRastBrak.ReadDok(nID: Integer): Boolean;
var
  i,j,m : Integer;
  fld : TField;
  s, strField,strDeti,ss : String;
  arr,arr1 : TArrStrings;
  sl  : TStringList;
  lErrDeti:Boolean;
begin
  Result := true;
  if not dmBase.tbZapisRast.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  IsReadDokument := true;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbZapisRast.FieldCount-1 do begin
    strField := dmBase.tbZapisRast.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.tbZapisRast.Fields[i]);
    end;
  end;
  SetIDZags;

  ReadDopProperty(dmBase.TypeObj_ZRast, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));

  DokumentCOPIA.AsBoolean  := false;
  if DokumentON_ONLYGOD.IsNull then DokumentON_ONLYGOD.AsBoolean:=false;
  if DokumentONA_ONLYGOD.IsNull then DokumentONA_ONLYGOD.AsBoolean:=false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentTYPE_RAST.IsNull then DokumentTYPE_RAST.AsInteger:=1;
  if DokumentON_VUS.IsNull  then DokumentON_VUS.AsBoolean:=true;
  if DokumentONA_VUS.IsNull then DokumentONA_VUS.AsBoolean:=false;

  DokumentON_M_RNGOROD.AsString  := '';
  DokumentONA_M_RNGOROD.AsString := '';
  if DokumentON_M_B_RN.IsNull then DokumentON_M_B_RN.AsBoolean:=true;
  if not DokumentON_M_B_RN.AsBoolean then begin
    DokumentON_M_RNGOROD.AsString := DokumentON_M_RAION.AsString;
    DokumentON_M_RAION.AsString   := '';
  end;
  if DokumentONA_M_B_RN.IsNull then DokumentONA_M_B_RN.AsBoolean:=true;
  if not DokumentONA_M_B_RN.AsBoolean then begin
    DokumentONA_M_RNGOROD.AsString := DokumentONA_M_RAION.AsString;
    DokumentONA_M_RAION.AsString   := '';
  end;

  CheckCaretDokument(DokumentON_DOK_NOMER,DokumentON_DOKUMENT);
  CheckCaretDokument(DokumentONA_DOK_NOMER,DokumentONA_DOKUMENT);

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;
  ReadHistory(nID, dmBase.TypeObj_ZRast);

  edON_GRAG.Hint:=DokumentON_GRAG_ADD.AsString;
  edONA_GRAG.Hint:=DokumentONA_GRAG_ADD.AsString;

  CheckRnGorod;

  strDeti := dmBase.tbZapisRast.FieldByName('DETI').AsString;
  StrToArr(strDeti, arr, Chr(13), true);
  sl := TStringList.Create;
  tbDeti.EmptyTable;
  lErrDeti:=false;
  try
    for i:=Low(arr) to High(arr) do begin
      sl.CommaText := arr[i];         
      if sl.Count>4 then begin  // !!!  неправильно было сохранено (перегружено)
        m:=1;
        for j:=0 to sl.Count-1 do begin
          if m=1 then begin
            ss:=DelAllChar(sl.Strings[j],'"');
            if ss<>'' then begin
              StrToArr(ss, arr1, ' ', true);
              SetLength(arr1,4);
              tbDeti.Append;
              tbDetiFAMILIA.AsString:=arr1[0];
              tbDetiNAME.AsString:=arr1[1];
              tbDetiOTCH.AsString:=arr1[2];
              if (Trim(arr1[3])<>'') and (Trim(arr1[3])<>'0') and IsAllDigit(arr1[3])
                then tbDetiGOD_ROG.AsInteger:=StrToIntDef(arr1[3],0);
              tbDeti.Post;
            end;
          end;
          m:=m+1;
          if m=7 then begin
            m:=1;
            if sl.Count=7
              then break;
          end;
        end;
      end else begin
        tbDeti.Append;
        for j:=0 to sl.Count-1 do begin
          tbDeti.Fields[j].AsString := sl.Strings[j];
        end;
        tbDeti.Post;
      end;
    end;
  except
    lErrDeti:=true;
  end;
  sl.Free;
  if lErrDeti then begin
    tbDeti.EmptyTable;
    tbDeti.Append;
    tbDetiFAMILIA.AsString:='ошибка чтения';
    tbDeti.Post;
  end;

  TbItemVerno.Checked := DokumentDECL_ID.AsInteger=1;

  {$IFDEF ZAGS}
  TBItemVozrast.Checked := ((DokumentON_DateR.AsString='') and (DokumentON_VOZR.AsString<>''));
  if TBItemVozrast.Checked then CheckOnlyVozrast(false);
  {$ENDIF}
  N_F_edTypeRastChange(nil);

  {$IFDEF ZAGS}
    s:=DokumentON_IDENTIF_GIS.AsString;
    TbItemCondIN_ON.Checked:=(s='1');
    CheckImageCondIN_(ENG_edON_IDENTIF, s, ImCondIN_ON);
    s:=DokumentONA_IDENTIF_GIS.AsString;
    TbItemCondIN_ONA.Checked:=(s='1');
    CheckImageCondIN_(ENG_edONA_IDENTIF, s, ImCondIN_ONA);
  {$ELSE}
    ImCondIN_ON.Visible:=false;
    ImCondIN_ONA.Visible:=false;
  {$ENDIF}

  IsReadDokument := false;
  //---------------------------------------
end;

function TfmRastBrak.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr,s : String;
  strRec, strDeti : String;
  sRukov,sRukovB,sSpec,sSpecB:String;
  lFullWrite:Boolean;
  arr:TArrStrings;
  {$IFNDEF ZAGS}
  vKeyValues : Variant;
  dLastSost : TDateTime;
  {$ENDIF}
begin
  PostDataSet(Dokument);
  PostDataSet(tbDeti);
  AdditiveBeforeWriteDok;

  EditDataSet(Dokument);
  WriteOtherData(Dokument, 'OTHER', 'RUKOV_D;SPEC_D;ON_IDENTIF_GIS;ONA_IDENTIF_GIS');
  PostDataSet(Dokument);

  Result:=CheckDokument(0,false,true,true);
  strErr:=FLastError;
  lFullWrite:=true;
//  sSeria:='';
//  sNomer:='';
  sRukov:='';
  sRukovB:='';
  sSpec:='';
  sSpecB:='';
//  dDate:=0;

  if (strErr='') then begin
    if FOnlySvid then begin
      if DokumentID.AsInteger=-1 then  begin  // запись не выбирали
        arr:=dmBase.SeekAkt(TypeObj, DokumentID_ZAGS.AsInteger,
                            DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime, false);
        if Length(arr)=0 then begin
//         DokumentID.AsInteger = -1  будем добавлять запсиь в базу
        end else begin
        // SeekAkt уже установил на нужную запись
          EditDataSet(Dokument);
          DokumentID.AsInteger:=FMainTable.FieldByName('ID').AsInteger;
          PostDataSet(Dokument);
        end;
      end;
      if DokumentID.AsInteger>0 then begin  // выбирали по кнопке или нашли актовую запись
        if not FCheckNewNomerAkt then begin
          FAddNewDok:=false;
          lFullWrite:=false;  // будем писать только свидетельство
        end;
        if FMainTable.FieldByName('ID').AsInteger<>DokumentID.AsInteger then begin
          if not FMainTable.Locate('ID', DokumentID.AsInteger, []) then begin
            strErr:='Запись акта не найдена.';
          end;
        end;
        if strErr='' then begin
          // сохраним текущие значения для первичного свидетельства
//          sSeria:=FMainTable.FieldByName('SVID_SERIA').AsString;
//          sNomer:=FMainTable.FieldByName('SVID_NOMER').AsString;
//          dDate:=FMainTable.FieldByName('DATESV').AsDateTime;
          sRukov:=FMainTable.FieldByName('RUKOV').AsString;
          sRukovB:=FMainTable.FieldByName('RUKOV_B').AsString;
          sSpec:=FMainTable.FieldByName('SPEC').AsString;
          sSpecB:=FMainTable.FieldByName('SPEC_B').AsString;
        end;
      end;
    end else begin
      Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZRast, DokumentID_ZAGS.AsInteger,
                     DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime);
      if not Result then exit;
    end;
  end;
  if strErr<>'' then begin
    PutError(strErr,self);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbZapisRast.Append;
    dmBase.tbZapisRast.Post;
    nID := dmBase.tbZapisRast.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if dmBase.tbZapisRast.FieldByName('ID').AsInteger<>nID then begin
      if not dmBase.tbZapisRast.Locate('ID', nID, []) then begin
        Result := false;
      end;
    end;
    if Result and not lFullWrite and FOnlySvid then begin   // запись нашли и пишем только свидетельство
       with dmBase.tbZapisRast do begin
         if not MySameText(FieldByName('ON_FAMILIA').AsString,DokumentON_Familia.AsString) or
            not MySameText(FieldByName('ON_NAME').AsString,DokumentON_Name.AsString) or
            not MySameText(FieldByName('ON_OTCH').AsString,DokumentON_Otch.AsString) or
            not MySameText(FieldByName('ON_FAMILIAP').AsString,DokumentON_FAMILIAP.AsString) then begin
            PutError('ФИО мужчины не совпадают с данными из актовой записи.',self);
            Result:=false;
         end;
         if not MySameText(FieldByName('ONA_FAMILIA').AsString,DokumentONA_Familia.AsString) or
            not MySameText(FieldByName('ONA_NAME').AsString,DokumentONA_Name.AsString) or
            not MySameText(FieldByName('ONA_OTCH').AsString,DokumentONA_Otch.AsString) or
            not MySameText(FieldByName('ONA_FAMILIAP').AsString,DokumentONA_FAMILIAP.AsString) then begin
            PutError('ФИО женщины не совпадают с данными из актовой записи.',self);
            Result:=false;
         end;
       end;
    end;
  end;
  if Result then  begin
    FCheckEditGIS:=CheckDateEditGIS;  // функция д.б. своя для каждого типа документа !!!

    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    dmBase.tbZapisRast.Edit;

    if lFullWrite then begin
      for i:=1 to dmBase.tbZapisRast.FieldCount-1 do begin
        strField := dmBase.tbZapisRast.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          dmBase.tbZapisRast.Fields[i].Value := fld.Value;
        end;
      end;
      WriteDopProperty(dmBase.TypeObj_ZRast, DokumentID.AsInteger,
                        STOD('1899-12-30',tdAds));

      WriteHistory(nID, dmBase.TypeObj_ZRast);

      strDeti := '';
      tbDeti.First;
      i:=0;
      while not tbDeti.Eof do begin
        s:=ANSIUpperCase(Trim(tbDetiFAMILIA.AsString+tbDetiNAME.AsString+tbDetiOTCH.AsString));
        if (s<>'') then begin
          if (s<>'НЕТ') and (s<>'НЕ ИМЕЮТ') then begin
            Inc(i,1);
          end;
          strRec := '"'+tbDetiFAMILIA.AsString+'",'+
                    '"'+tbDetiNAME.AsString+'",'+
                    '"'+tbDetiOTCH.AsString+'",'+
                    '"'+tbDetiGOD_ROG.AsString+'"'+Chr(13);
          strDeti := strDeti + strRec;
        end;
        tbDeti.Next;
      end;
      dmBase.tbZapisRast.FieldByName('DETI').AsString := strDeti;
      dmBase.tbZapisRast.FieldByName('DETI_COUNT').AsInteger := i;
      dmBase.tbZapisRast.FieldByName('VOSSTAN').AsBoolean := false;
    end;  // lFullWrite

    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    if lFullWrite then begin
      if DokumentON_M_RNGOROD.AsString<>'' then begin
        dmBase.tbZapisRast.FieldByName('ON_M_B_RN').AsBoolean := false;
        dmBase.tbZapisRast.FieldByName('ON_M_RAION').AsString := DokumentON_M_RNGOROD.AsString;
      end else begin
        dmBase.tbZapisRast.FieldByName('ON_M_B_RN').AsBoolean := true;
      end;
      if DokumentONA_M_RNGOROD.AsString<>'' then begin
        dmBase.tbZapisRast.FieldByName('ONA_M_B_RN').AsBoolean := false;
        dmBase.tbZapisRast.FieldByName('ONA_M_RAION').AsString := DokumentONA_M_RNGOROD.AsString;
      end else begin
        dmBase.tbZapisRast.FieldByName('ONA_M_B_RN').AsBoolean := true;
      end;

      if not FPrintSpecSvid
        then dmBase.tbZapisRast.FieldByName('SPEC_B').AsString:='';
    end;

    WriteDateIzm;
    WriteForAllDok_BeforePost;
    if dmBase.tbZapisRast.FieldByName('ON_B_RESP').AsBoolean=false
      then dmBase.tbZapisRast.FieldByName('ON_B_RESP').AsBoolean:=FCheckEditGIS;

    if FAddNewDok and (DokumentDATEZ.AsDateTime>=dmBase.GetCurDate) then  GlobalTask.SetLastValueAsDate('LAST_DATEZ_ZRAST',DokumentDATEZ.AsDateTime);

    dmBase.tbZapisRast.Post;

    AdditiveWriteDok;

    if FOnlySvid then begin   // вернем старые данные о первичном свидетельстве, если они были
      FMainTable.Edit;
//      dmBase.tbZapisRast.FieldByName('SVID_SERIA').AsString:=sSeria;
//      dmBase.tbZapisRast.FieldByName('SVID_NOMER').AsString:=sNomer;
      FMainTable.FieldByName('RUKOV').AsString:=sRUKOV;
      FMainTable.FieldByName('RUKOV_B').AsString:=sRUKOVB;
      FMainTable.FieldByName('SPEC').AsString:=sSpec;
      FMainTable.FieldByName('SPEC_B').AsString:=sSpecB;
//      if dDate=0
//        then dmBase.tbZapisRast.FieldByName('DATESV').AsString:=''
//        else dmBase.tbZapisRast.FieldByName('DATESV').AsdateTime:=dDate;
      FMainTable.Post;
    end else begin
      //------ запись в базу заявлений --------------------------
      if DokumentDECLARE_ID.AsInteger>0 then begin
        if dmBase.DeclareTermMarriage.FieldByName('ID').AsInteger<>DokumentDECLARE_ID.AsInteger then begin
          dmBase.DeclareTermMarriage.Locate('ID',DokumentDECLARE_ID.AsInteger,[]);
        end;
        if dmBase.DeclareTermMarriage.FieldByName('ID').AsInteger=DokumentDECLARE_ID.AsInteger then begin
          try
            dmBase.DeclareTermMarriage.Edit;
            dmBase.DeclareTermMarriage.FieldByName('RAST_ID').AsInteger:=DokumentDECLARE_ID.AsInteger;
            dmBase.DeclareTermMarriage.FieldByName('OTMETKA_ISP').AsString:=AktToOtm(DokumentNOMER.AsString,DokumentDATEZ.AsDateTime);
            dmBase.DeclareTermMarriage.Post;
          except
            PutError('Ошибка записи отметки в заявлении.',self);
          end;
        end;
      end;

      if DokumentBRAK_ID.AsInteger>0 then begin
        if dmBase.tbZapisBrak.Locate('ID', DokumentBRAK_ID.AsInteger, []) then begin
          if dmBase.tbZapisBrak.FieldByName('TYPE_RAST').AsInteger<>3 then begin   // по взаимному согласию
            if Problem('Внести изменения в актовую запись о браке ?',mtConfirmation,self) then begin
              try
                dmBase.tbZapisBrak.Edit;
                dmBase.tbZapisBrak.FieldByName('BRAK_RAST').AsBoolean:=true;
                dmBase.tbZapisBrak.FieldByName('TYPE_RAST').AsInteger:=3;  // на основании з/а о раст. брака
                dmBase.tbZapisBrak.FieldByName('R_NOMER').AsInteger:=DokumentNOMER.AsInteger;
                dmBase.tbZapisBrak.FieldByName('R_DATE').AsDateTime:=DokumentDATEZ.AsDateTime;
                dmBase.tbZapisBrak.FieldByName('DATE_OTM_RAST').AsDateTime:=DokumentDATEZ.AsDateTime;

                dmBase.WritePropSimpleDok(dmBase.TypeObj_ZBrak, DokumentBRAK_ID.AsInteger, STOD('1899-12-30',tdAds), 'ON_FAM_R',  DokumentON_FamiliaP );
                dmBase.WritePropSimpleDok(dmBase.TypeObj_ZBrak, DokumentBRAK_ID.AsInteger, STOD('1899-12-30',tdAds), 'ONA_FAM_R', DokumentONA_FamiliaP );
                dmBase.WritePropSimpleDok(dmBase.TypeObj_ZBrak, DokumentBRAK_ID.AsInteger, STOD('1899-12-30',tdAds), 'OTM_RAST', DokumentSPEC );
                dmBase.WritePropSimpleDok(dmBase.TypeObj_ZBrak, DokumentBRAK_ID.AsInteger, STOD('1899-12-30',tdAds), 'R_ZAGS', nil, fmMain.NameOrg('','П') );

                dmBase.tbZapisBrak.Post;
              except
                on E: Exception do begin
                  PutError('ОШИБКА внесения изменений: '+E.Message,self);
                  dmBase.tbZapisBrak.Cancel;
                end;
              end;
            end;
          end;
        end;
      end;

    end;
//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);
    QueryExit:=false;
    Result := true;

    if FCheckBelName and FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentON_FamiliaP.AsString, DokumentON_FamiliaP_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_FamiliaP.AsString, DokumentONA_FamiliaP_B.AsString);

      WriteForAll_Bel;
    end;
  {$IFNDEF ZAGS}
  {
    dLastSost := dmBase.LastDateSost;
    if (dLastSost = dmBase.GetDateCurrentSost) or
       (DokumentDATEZ.AsDateTime >= dLastSost) then begin
      vKeyValues := VarArrayCreate( [0, 1], varOleStr );
      vKeyValues[0] := dmBase.GetDateCurrentSost;
      vKeyValues[1] := 0;
      if DokumentON_ID.AsString<>'' then begin
        // проставим у мужчины семейное положение
        vKeyValues[1] := DokumentON_ID.AsInteger;
        if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
          dmBase.tbMens.Edit;
          dmBase.tbMens.FieldByName('SEM').AsInteger := 1;
          dmBase.tbMens.Post;
        end;
      end;
      if DokumentONA_ID.AsString<>'' then begin
        // проставим у мужчины семейное положение
        vKeyValues[1] := DokumentONA_ID.AsInteger;
        if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
          dmBase.tbMens.Edit;
          dmBase.tbMens.FieldByName('SEM').AsInteger := 1;
          dmBase.tbMens.Post;
        end;
      end;
    end;
    }
  {$ENDIF}
  end;
  if Result then FlushBuffers;
end;

procedure TfmRastBrak.FormResize(Sender: TObject);
begin
  gbDeti.Width := Self.ClientWidth-8;
end;

constructor TfmRastBrak.Create(Owner: TComponent);
var
 n:Integer;
begin
  inherited;
//  Dokument.Active:=true;
//  tbDeti.Active:=true;

  FPrintSvidPosle:=true;
  if GlobalTask.GetLastValueAsString('PRINT_SVID_FIO_POSLE')='0' then begin
    FPrintSvidPosle:=false;
  end;
  TBItemPrintSvFIO.Checked:=FPrintSvidPosle;

  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';

  if FPrintSpecSvid then begin
    edRukov_Sv.DataField:='SPEC';
    BLR_edRukov_Sv_B.DataField:='SPEC_B';
  end;

  FCheckLookupField:=false;
  FCheckKeyGrid:=true;
  FDokZAGS := true;
  TypeObj := dmBase.TypeObj_ZRast;
  FUpdatingObj:=GetUpdatingObj(TypeObj);
  SetLength(FArrChoiceRekv,20);
  FArrChoiceRekv[0].nType:=1;
  FArrChoiceRekv[0].FieldName:='ON_DOKUMENT';
  FArrChoiceRekv[1].nType:=1;
  FArrChoiceRekv[1].FieldName:='ONA_DOKUMENT';
  FArrChoiceRekv[2].nType:=2;
  FArrChoiceRekv[2].FieldName:='OTMETKA';
  FArrChoiceRekv[3].nType:=0;
  FArrChoiceRekv[3].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[3].FieldName:='ON_WORK';
  FArrChoiceRekv[4].nType:=0;
  FArrChoiceRekv[4].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[4].FieldName:='ONA_WORK';

  FArrChoiceRekv[5].nType:=0;
  FArrChoiceRekv[5].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[5].FieldName:='ON_M_GOROD_R';

  FArrChoiceRekv[6].nType:=0;
  FArrChoiceRekv[6].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[6].FieldName:='ONA_M_GOROD_R';

  FArrChoiceRekv[7].nType:=SHABLON_SUD;
  FArrChoiceRekv[7].FieldName:='SUD_NAME';

  FArrChoiceRekv[8].nType:=SHABLON_ADRESAT;
  FArrChoiceRekv[8].FieldName:='ARX_ADRESAT';

  FArrChoiceRekv[9].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[9].FieldName:='ARX_TEXT';

  FArrChoiceRekv[10].nType:=0;
  FArrChoiceRekv[10].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[10].FieldName:='BRAK_ZAKL';
  FArrChoiceRekv[10].sPadeg:='Т';

  FArrChoiceRekv[11].nType:=SHABLON_BANK;
  FArrChoiceRekv[11].FieldName:='ON_POSHLINA';

  FArrChoiceRekv[12].nType:=SHABLON_BANK;
  FArrChoiceRekv[12].FieldName:='ONA_POSHLINA';

  FArrChoiceRekv[13].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[13].FieldName:='ON_GOSUD';
  FArrChoiceRekv[14].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[14].FieldName:='ONA_GOSUD';
  FArrChoiceRekv[15].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[15].FieldName:='ON_GRAG';
  FArrChoiceRekv[16].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[16].FieldName:='ONA_GRAG';

  FArrChoiceRekv[17].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[17].FieldName:='ON_M_GOSUD';
  FArrChoiceRekv[18].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[18].FieldName:='ONA_M_GOSUD';

  FArrChoiceRekv[19].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[19].FieldName:='IZMEN';

  CheckControlSvid;

  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edONA_IDENTIF);

//  tsSvid.TabVisible:=GlobalTask.ParamAsBoolean('TS_SVID');

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisRast;
  dsGragd.DataSet := dmBase.SprGragd;
  edONA_Familia.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;
  FPageControl := pc;
  pc.ActivePageIndex:=0;
  edON_Familia.OnExit := OnDestroyHint;
  edON_FamiliaP.OnExit := OnDestroyHint;
  edON_Name.OnExit := OnDestroyHint;
  edON_Otch.OnExit := OnDestroyHint;
  edONA_Familia.OnExit := OnDestroyHint;
  edONA_FamiliaP.OnExit := OnDestroyHint;
  edONA_Name.OnExit := OnDestroyHint;
  edONA_Otch.OnExit := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;
//  fmMain.SetCurrentDokument(Dokument);

  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;

  SetVisibleNomerEkz(pnMain, nil, N_F_1);

  N_F_cbBelorus.Checked:=False;

  n:=31;
  SetLength(FArrAddProperty,n);
  // в творительном падеже
  SetAddProperty(0, 'ON_FAMILIA_P', '', ftMemo);
  SetAddProperty(1, 'ON_NAME_P', '', ftString);
  SetAddProperty(2, 'ON_OTCH_P', '', ftString);
  SetAddProperty(3, 'ON_FAMILIA_B_P', '', ftMemo);
  SetAddProperty(4, 'ON_NAME_B_P', '', ftString);
  SetAddProperty(5, 'ON_OTCH_B_P', '', ftString);
  SetAddProperty(6, 'ONA_FAMILIA_P', '', ftMemo);
  SetAddProperty(7, 'ONA_NAME_P', '', ftString);
  SetAddProperty(8, 'ONA_OTCH_P', '', ftString);
  SetAddProperty(9, 'ONA_FAMILIA_B_P', '', ftMemo);
  SetAddProperty(10, 'ONA_NAME_B_P', '', ftString);
  SetAddProperty(11, 'ONA_OTCH_B_P', '', ftString);

  // в дательном падеже
  SetAddProperty(12, 'ON_FAMILIA_PD', '', ftMemo);
  SetAddProperty(13, 'ON_NAME_PD', '', ftString);
  SetAddProperty(14, 'ON_OTCH_PD', '', ftString);
  SetAddProperty(15, 'ON_FAMILIA_B_PD', '', ftMemo);
  SetAddProperty(16, 'ON_NAME_B_PD', '', ftString);
  SetAddProperty(17, 'ON_OTCH_B_PD', '', ftString);
  SetAddProperty(18, 'ONA_FAMILIA_PD', '', ftMemo);
  SetAddProperty(19, 'ONA_NAME_PD', '', ftString);
  SetAddProperty(20, 'ONA_OTCH_PD', '', ftString);
  SetAddProperty(21, 'ONA_FAMILIA_B_PD', '', ftMemo);
  SetAddProperty(22, 'ONA_NAME_B_PD', '', ftString);
  SetAddProperty(23, 'ONA_OTCH_B_PD', '', ftString);

  SetAddProperty(24, 'OTHER', '', ftMemo);
  SetAddProperty(25, 'IZMEN', '', ftMemo);

  SetAddProperty(26, 'ON_GRAG_ADD', '', ftMemo);    // ОН  дополлнительно к гражданству
  SetAddProperty(27, 'ONA_GRAG_ADD', '', ftMemo);   // ОНА дополлнительно к гражданству
  SetAddProperty(28, 'BRAK_ZAKL_B', '', ftMemo);

  SetAddProperty(29, 'ON_ATEID', '', ftInteger);
  SetAddProperty(30, 'ONA_ATEID', '', ftInteger);

  {$IFDEF GISUN}
    // типы нас. пунктов в кодах ГИС РН
    {
    SetLength(FArrAddProperty,n+4);
    SetAddProperty(n,   'RN_ON_M_B_GOROD', '', ftString);
    SetAddProperty(n+1, 'RN_ON_B_GOROD', '', ftString);
    SetAddProperty(n+2, 'RN_ONA_M_B_GOROD', '', ftString);
    SetAddProperty(n+3, 'RN_ONA_B_GOROD', '', ftString);
    }
  {$ENDIF}

  tsSprav.TabVisible := false;

  {$IFDEF ZAGS}
    edON_Familia.EditButtons.Items[0].Visible:=false;
    edONA_Familia.EditButtons.Items[0].Visible:=false;
//    cbProvDvig.Visible := false;
//    cbProvDvig.Checked := false;
//    gbLich.Visible:=false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
    TBItemArxSpr.Visible:=false;
    TBItemVozrast.Visible:=false;
    N_F_edCopy.Visible := false;
    N_F_cbPovtor.Visible := false;
  {$ENDIF}

  GridDeti.FieldColumns['FAMILIA'].OnUpdateData:=GridFIOUpdateData;
  GridDeti.FieldColumns['NAME'].OnUpdateData:=GridFIOUpdateData;
  GridDeti.FieldColumns['OTCH'].OnUpdateData:=GridFIOUpdateData;

  ENG_edOna_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edOn_Identif.OnUpdateData:=IN_UpdateData;

  SetControlFIOUpdate([
     edON_Familia, edON_FamiliaP, edON_Name, edON_Otch, edONA_Familia, edONA_FamiliaP, edONA_Name, edONA_Otch,
     BLR_edON_Familia, BLR_edON_FamiliaP, BLR_edON_Name, BLR_edON_Otch, BLR_edONA_Familia, BLR_edONA_FamiliaP, BLR_edONA_Name, BLR_edONA_Otch,
     edON_Familia_Sv, edON_Name_Sv, edON_Otch_Sv, edONA_Familia_Sv, edONA_Name_Sv, edONA_Otch_Sv,
     BLR_edON_Familia_B_Sv, BLR_edON_Name_B_Sv, BLR_edON_Otch_B_Sv, BLR_edONA_Familia_B_Sv, BLR_edONA_Name_B_Sv, BLR_edONA_Otch_B_Sv,
     edON_FamiliaP_Sv, edONA_FamiliaP_Sv, BLR_edON_FamiliaP_B_Sv, BLR_edONA_FamiliaP_B_Sv,
     edON_FamiliaPD_Sv, edON_NamePD_Sv, edON_OtchPD_Sv, edONA_FamiliaPD_Sv, edONA_NamePD_Sv, edONA_OtchPD_Sv,
     BLR_edON_FamiliaPD_B_Sv, BLR_edON_NamePD_B_Sv, BLR_edON_OtchPD_B_Sv, BLR_edONA_FamiliaPD_B_Sv, BLR_edONA_NamePD_B_Sv, BLR_edONA_OtchPD_B_Sv,
     edRukov_Sv, BLR_edRukov_Sv_B
     ],false);

  SetControlCityUpdate([
    edON_M_GOROD, edONA_M_GOROD, edON_GOROD, edONA_GOROD, edON_RAION_R, edONA_RAION_R,
    edON_M_RAION, edONA_M_RAION, edON_OBL_R, edONA_OBL_R, edON_M_OBL, edONA_M_OBL
    ]);

  SetcbBel(N_F_cbBelorus);
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;

  SetLength(FArrCheckField,8);
  WriteToArrCheck(0,  1, false, 'ON_OBL');
  WriteToArrCheck(1,  1, false, 'ONA_OBL');
  WriteToArrCheck(2,  2, false, 'ON_RAION');
  WriteToArrCheck(3,  2, false, 'ONA_RAION');
  WriteToArrCheck(4,  1, false, 'ON_M_OBL');
  WriteToArrCheck(5,  1, false, 'ONA_M_OBL');
  WriteToArrCheck(6,  2, false, 'ON_M_RAION');
  WriteToArrCheck(7,  2, false, 'ONA_M_RAION');

  SetPanelPovtor(tsPovtor, N_F_cbPovtor,nil,nil);

  CreateButtonAddGrag(edON_GRAG);
  CreateButtonAddGrag(edONA_GRAG);

  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbDeti,'Deti','Общие дети');
  {$ENDIF}

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

  edON_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;  // utypes.pas
  edONA_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;
  edON_DOK_TYPE.DropDownBox.Width:=TYPEDOK_Width;  // utypes.pas
  edONA_DOK_TYPE.DropDownBox.Width:=TYPEDOK_Width;
end;

destructor TfmRastBrak.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmRastBrak.FIOUpdatePadeg(Sender: TObject; var Handled: Boolean);
var
  ed : TDbEditEh;
//  i : Integer;
  sName,s,ss,sVal:String; //,s1,s2 : String;
  sF,sN,sO,sPol:String;
  Pol:TPol;
//  fld:TField;
  arr:TArrStrings;
begin
  // работает только если набираем через выписку свидетельства   !!!
  if FRun or not FOnlySvid then exit;

  ed := TDbEditEh(Sender);
  s:=DeleteAllSpace(ed.Text);
  if FCheckRegistr then begin  // контролировать регистр букв
    ed.Text:=CheckRegisterText(FTypeCheckRegistr,s);
  end;
  sVal:=ed.Text;
  sName:=UpperCase(ed.Field.FieldName);
  if Copy(sName,1,3)='ON_' then begin
    sF:='Ивановым'; sN:='Иваном'; sO:='Ивановичем';
    s:='ON_';
    ss:=Copy(sName,4,Length(sName));
    Pol := tpM;
    sPol:= 'М';
  end else begin
    sF:='Ивановой'; sN:='Марией'; sO:='Ивановной';
    s:='ONA_';
    ss:=Copy(sName,5,Length(sName));
    Pol := tpG;
    sPol:= 'Ж';
  end;
  if SvidInPadeg(TypeObj) then begin       // свидетельство в падеже
    if ss='FAMILIA_P' then begin
      sVal:=GetPadegNominative(sVal+' '+sN+' '+sO);
      StrToArr(sVal,arr,' ',false);
      Dokument.FieldByName(s+'Familia').AsString:=arr[0];
      Dokument.FieldByName(s+'Familia_B').AsString:=dmBase.GetBelFamily(arr[0]);
      if not FPrintSvidPosle then begin    // печать в свид. фамилии до раст брака
        sVal:=GetPadegFIO(sVal, sPol,'Д');
        StrToArr(sVal,arr,' ',false);
        Dokument.FieldByName(s+'Familia_PD').AsString:=arr[0];
        Dokument.FieldByName(s+'Familia_B_PD').AsString:='';
      end;
    end else if ss='NAME_P' then begin
      sVal:=GetPadegNominative(sF+' '+sVal+' '+sO);
      StrToArr(sVal,arr,' ',false);
      Dokument.FieldByName(s+'Name').AsString:=arr[1];
      Dokument.FieldByName(s+'Name_B').AsString:=dmBase.CheckNameBel(Pol, arr[1]);
      sVal:=GetPadegFIO(sVal,sPol,'Д');
      StrToArr(sVal,arr,' ',false);
      Dokument.FieldByName(s+'Name_PD').AsString:=arr[1];
    end else if ss='OTCH_P' then begin
      sVal:=GetPadegNominative(sF+' '+sN+' '+sVal);
      StrToArr(sVal,arr,' ',false);
      Dokument.FieldByName(s+'Otch').AsString:=arr[2];
      Dokument.FieldByName(s+'Otch_B').AsString:=arr[2];
      sVal:=GetPadegFIO(sVal,sPol,'Д');
      StrToArr(sVal,arr,' ',false);
      Dokument.FieldByName(s+'OTCH_PD').AsString:=arr[2];
    end else if ss='FAMILIAP' then begin
      Dokument.FieldByName(s+'FamiliaP_B').AsString:=dmBase.GetBelFamily(sVal);
      if FPrintSvidPosle then begin    // печать в свид. фамилии после раст. брака
        sVal:=GetPadegFIO(sVal, sPol,'Д');
        Dokument.FieldByName(s+'Familia_PD').AsString:=sVal;
        Dokument.FieldByName(s+'Familia_B_PD').AsString:='';
      end;
    end;
  end else begin                           // свидетельство НЕ в падеже
    if ss='FAMILIA_P' then begin
      Dokument.FieldByName(s+'Familia_B_P').AsString:=dmBase.GetBelFamily(sVal);
      if not FPrintSvidPosle then begin    // печать в свид. фамилии до раст. брака
        Dokument.FieldByName(s+'Familia_PD').AsString:=sVal;
        Dokument.FieldByName(s+'Familia_B_PD').AsString:=dmBase.GetBelFamily(sVal);
      end;
      Dokument.FieldByName(s+'Familia').AsString:=sVal;
      Dokument.FieldByName(s+'Familia_B').AsString:=dmBase.GetBelFamily(sVal);
    end else if ss='NAME_P' then begin
      Dokument.FieldByName(s+'NAME_B_P').AsString:=dmBase.CheckNameBel(Pol, sVal);
      Dokument.FieldByName(s+'Name_PD').AsString:=sVal;
      Dokument.FieldByName(s+'Name_B_PD').AsString:=dmBase.CheckNameBel(Pol, sVal);
      Dokument.FieldByName(s+'Name').AsString:=sVal;
      Dokument.FieldByName(s+'Name_B').AsString:=dmBase.CheckNameBel(Pol, sVal);
    end else if ss='OTCH_P' then begin
      Dokument.FieldByName(s+'OTCH_B_P').AsString:=dmBase.CheckOtchBel(Pol, sVal);
      Dokument.FieldByName(s+'OTCH_PD').AsString:=sVal;
      Dokument.FieldByName(s+'OTCH_B_PD').AsString:=dmBase.CheckOtchBel(Pol, sVal);
      Dokument.FieldByName(s+'OTCH').AsString:=sVal;
      Dokument.FieldByName(s+'OTCH_B').AsString:=dmBase.CheckOtchBel(Pol, sVal);
    end else if ss='FAMILIAP' then begin
      Dokument.FieldByName(s+'FamiliaP_B').AsString:=dmBase.GetBelFamily(sVal);
      if FPrintSvidPosle then begin    // печать в свид. фамилии после раст. брака
        Dokument.FieldByName(s+'Familia_PD').AsString:=sVal;
        Dokument.FieldByName(s+'Familia_B_PD').AsString:=dmBase.GetBelFamily(sVal);
      end;
    end;
  end;
end;
//----------------------------------------------------------------------------------
procedure TfmRastBrak.FIOUpdatePadegBLR(Sender: TObject; var Handled: Boolean);
var
  ed : TDbEditEh;
//  i : Integer;
  s:String; //,s1,s2 : String;
//  sPol:String;
//  Pol:TPol;
//  fld:TField;
//  arr:TArrStrings;
begin

  // работает только если набираем через выписку свидетельства   !!!
  if FRun or not FOnlySvid then exit;

  ed := TDbEditEh(Sender);
  s:=DeleteAllSpace(ed.Text);
  if FCheckRegistr then begin  // контролировать регистр букв
    ed.Text:=CheckRegisterText(FTypeCheckRegistr,s);
  end;
  {
  sVal:=ed.Text;
  sName:=UpperCase(ed.Field.FieldName);
  if Copy(sName,1,3)='ON_' then begin
    sF:='Ивановым'; sN:='Иваном'; sO:='Ивановичем';
    s:='ON_';
    ss:=Copy(sName,4,Length(sName));
    Pol := tpM;
    sPol:= 'М';
  end else begin
    sF:='Ивановой'; sN:='Марией'; sO:='Ивановной';
    s:='ONA_';
    ss:=Copy(sName,5,Length(sName));
    Pol := tpG;
    sPol:= 'Ж';
  end;
  if not SvidInPadeg(TypeObj) then begin       // свидетельство не в падеже
    if ss='FAMILIA_B_P' then begin
      Dokument.FieldByName(s+'Familia_B').AsString:=sVal;
    end else if ss='NAME_B_P' then begin
      Dokument.FieldByName(s+'Name_B').AsString:=sVal;
    end else if ss='OTCH_B_P' then begin
      Dokument.FieldByName(s+'Otch_B').AsString:=sVal;
    end;
  end;
  }
end;

procedure TfmRastBrak.edON_FamiliaEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  adr : TAdres;
  nID : Integer;
  old : TCursor;
  strName : String;
begin
  if ChoiceMen( edON_FAMILIA, trim(edON_FAMILIA.Text), 'POL='+QStr('М')+' .and. (SEM<>1 .or. Empty(SEM))', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      v := GetValueField(arrRec, 'ID');
      DokumentON_ID.AsInteger := v;
      v := GetValueField(arrRec, 'FAMILIA');
      if v = null then DokumentON_FAMILIA.AsString := ''
                  else DokumentON_FAMILIA.AsString := v;
      DokumentON_FAMILIAP.AsString := DokumentON_FAMILIA.AsString;
      v := GetValueField(arrRec, 'NAME');
      if v = null then DokumentON_NAME.AsString := ''
                  else DokumentON_NAME.AsString := v;
      v := GetValueField(arrRec, 'OTCH');
      if v = null then DokumentON_OTCH.AsString := ''
                  else DokumentON_OTCH.AsString := v;
      v := GetValueField(arrRec, 'DATER');
      if v = null then DokumentON_DateR.AsString := ''
                  else DokumentON_DateR.Value    := v;
      v := GetValueField(arrRec, 'NATION');
      if v = null then DokumentON_NATION.AsInteger:= 0
                  else DokumentON_NATION.Value    := v;
      v := GetValueField(arrRec, 'CITIZEN');
      if v = null then DokumentON_GRAG.AsInteger:= 0
                  else DokumentON_GRAG.Value    := v;
      v := GetValueField(arrRec, 'OBRAZ');
      if v = null then DokumentON_OBRAZ.AsString := ''
                  else DokumentON_OBRAZ.Value    := v;
      s := dmBase.GetWork(DokumentON_ID.AsInteger, arrRec);
      if s <> '' then s:=s+', ';
      nID := DokumentON_ID.AsInteger;
      DokumentON_WORK.AsString := s + dmBase.GetDolg(nID, arrRec);
      DokumentON_DOKUMENT.AsString := dmBase.GetPasport(nID, arrRec);
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      if adr.Punkt <> '' then DokumentON_M_GOROD.AsString := adr.Punkt;
      if adr.UlicaDom <> '' then DokumentON_M_GOROD_R.AsString := adr.UlicaDom;
      DokumentOTMETKA.AsString := DokumentOTMETKA.AsString+#13+dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'OTM_NATION', ftMemo);
      PostDataSet(Dokument);
      Screen.Cursor := old;
  end;
end;

procedure TfmRastBrak.edONA_FamiliaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  adr : TAdres;
  nID : Integer;
  old : TCursor;
  strName : String;
begin
  if ChoiceMen( edONA_FAMILIA, trim(edONA_FAMILIA.Text), 'POL='+QStr('Ж')+' .and. (SEM<>1 .or. Empty(SEM))', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      v := GetValueField(arrRec, 'ID');
      DokumentONA_ID.AsInteger := v;
      v := GetValueField(arrRec, 'FAMILIA');
      if v = null then DokumentONA_FAMILIA.AsString := ''
                  else DokumentONA_FAMILIA.AsString := v;
// неправильное добавление окончания  DokumentONA_FAMILIAP.AsString := DokumentON_FAMILIA.AsString;
      v := GetValueField(arrRec, 'NAME');
      if v = null then DokumentONA_NAME.AsString := ''
                  else DokumentONA_NAME.AsString := v;
      v := GetValueField(arrRec, 'OTCH');
      if v = null then DokumentONA_OTCH.AsString := ''
                  else DokumentONA_OTCH.AsString := v;
      v := GetValueField(arrRec, 'DATER');
      if v = null then DokumentONA_DateR.AsString := ''
                  else DokumentONA_DateR.Value    := v;
      v := GetValueField(arrRec, 'NATION');
      if v = null then DokumentONA_NATION.AsString := ''
                  else DokumentONA_NATION.Value    := v;
      v := GetValueField(arrRec, 'CITIZEN');
      if v = null then DokumentONA_GRAG.AsString := ''
                  else DokumentONA_GRAG.Value    := v;
      v := GetValueField(arrRec, 'OBRAZ');
      if v = null then DokumentONA_OBRAZ.AsString := ''
                  else DokumentONA_OBRAZ.Value    := v;
      s := dmBase.GetWork(DokumentONA_ID.AsInteger, arrRec);
      if s <> '' then s:=s+', ';
      nID := DokumentONA_ID.AsInteger;
      DokumentONA_WORK.AsString := s + dmBase.GetDolg(nID, arrRec);
      DokumentONA_DOKUMENT.AsString := dmBase.GetPasport(nID, arrRec);
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      if adr.Punkt <> '' then DokumentONA_M_GOROD.AsString := adr.Punkt;
      if adr.UlicaDom <> '' then DokumentONA_M_GOROD_R.AsString := adr.UlicaDom;
      DokumentOTMETKA.AsString := DokumentOTMETKA.AsString+#13+dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'OTM_NATION', ftMemo);
      PostDataSet(Dokument);
      Screen.Cursor := old;
  end;
end;

procedure TfmRastBrak.N_F_cbBelorusClick(Sender: TObject);
begin
    if N_F_cbBelorus.Checked then begin
      CheckForAll_Bel( nil );
      ActivateBLRKeyboard;
      edRukov.DataField        := 'RUKOV_B';
      edZAGS.DataField := 'NAME_ZAGS_B';
      edBrak.DataField := 'BRAK_ZAKL_B';
      if FEnabledSpecBel then begin
        edSpec.DataField   := 'SPEC_B';
      end;
    end else begin
      ActivateRUSKeyboard;
      edRukov.DataField        := 'RUKOV';
      edZAGS.DataField := 'NAME_ZAGS';
      edBrak.DataField := 'BRAK_ZAKL';
      if FEnabledSpecBel then begin
        edSpec.DataField   := 'SPEC';
      end;
    end;
end;

procedure TfmRastBrak.OnDestroyHint(Sender : TObject);
begin
  DestroyHint(H);
end;

procedure TfmRastBrak.edON_FamiliaEnter(Sender: TObject);
begin
  if (N_F_cbBelorus.Checked)
    then CreateHint(H,edON_Familia,DokumentON_Familia.AsString+' ');
end;

procedure TfmRastBrak.edON_FamiliaPEnter(Sender: TObject);
begin
  if (N_F_cbBelorus.Checked) then CreateHint(H,edON_FamiliaP,DokumentON_FamiliaP.AsString+' ');
end;

procedure TfmRastBrak.edON_OTCHEnter(Sender: TObject);
begin
  if (N_F_cbBelorus.Checked) then CreateHint(H,edON_OTCH,DokumentON_OTCH.AsString+' ');
end;

procedure TfmRastBrak.edON_NameEnter(Sender: TObject);
begin
  if (N_F_cbBelorus.Checked) then CreateHint(H,edON_Name,DokumentON_Name.AsString+' ');
end;

procedure TfmRastBrak.edONA_FamiliaEnter(Sender: TObject);
begin
  if (N_F_cbBelorus.Checked) then CreateHint(H,edONA_Familia,DokumentONA_Familia.AsString+' ');
end;

procedure TfmRastBrak.edONA_FamiliaPEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edONA_FamiliaP,DokumentONA_FamiliaP.AsString+' ');
end;

procedure TfmRastBrak.edONA_NameEnter(Sender: TObject);
begin
  if (N_F_cbBelorus.Checked) then CreateHint(H,edONA_NAME,DokumentONA_NAME.AsString+' ');
end;

procedure TfmRastBrak.edONA_OTCHEnter(Sender: TObject);
begin
  if (N_F_cbBelorus.Checked) then CreateHint(H,edONA_OTCH,DokumentONA_OTCH.AsString+' ');
end;

procedure TfmRastBrak.edON_FamiliaCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;


procedure TfmRastBrak.dsDokumentDataChange(Sender: TObject; Field: TField);
var
  strField : String;
  Pol : TPol;
begin
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    strField := UpperCase(Field.FieldName);
    FRun := true;
    if (strField = 'ON_SVID_SERIA') then begin
      if not Field.IsNull and not DokumentDATEZ.IsNull then begin
        DokumentON_SVID_DATE.AsDateTime := DokumentDATEZ.AsDateTime;
      end;
    end else if (strField = 'ONA_SVID_SERIA') then begin
      if not Field.IsNull and not DokumentDATEZ.IsNull then begin
        DokumentONA_SVID_DATE.AsDateTime := DokumentDATEZ.AsDateTime;
      end;
    end else if (strField='ON_M_GOROD') or (strField='ON_M_RNGOROD') then begin
      if (strField='ON_M_RNGOROD') and (Field.AsString<>'')
        then DokumentON_M_RAION.AsString:='';
      CheckSOATOAkt(true,false,true,'{CHOICE}',0,'');
    end else if (strField='ONA_M_GOROD') or (strField='ONA_M_RNGOROD') then begin
      if (strField='ONA_M_RNGOROD') and (Field.AsString<>'')
        then DokumentONA_M_RAION.AsString:='';
      CheckSOATOAkt(false,true,false,'{CHOICE}',0,'');
    end else if (strField='ON_M_RAION') then begin
      if (Field.AsString<>'')
        then DokumentON_M_RNGOROD.AsString:='';
    end else if (strField='ONA_M_RAION') then begin
      if (Field.AsString<>'')
        then DokumentONA_M_RNGOROD.AsString:='';
    end;
    CheckSOATOAkt(FOnCheckSOATO,FOnaCheckSOATO,true,'',0,'');
    if FOnlySvid then begin

    end else begin
      if FCheckBelName then begin
        EditDataSet(Dokument);
        if strField='ON_NAME' then begin
          Pol := tpM;
          DokumentON_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.AsString);
          DokumentON_Name_P.AsString :='';
          DokumentON_Name_PD.AsString :='';
          DokumentON_Name_B_P.AsString :='';
          DokumentON_Name_B_PD.AsString :='';
        end else if strField='ON_FAMILIA' then begin
          DokumentON_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
          if not FPrintSvidPosle then begin
            DokumentON_Familia_P.AsString :='';
            DokumentON_Familia_PD.AsString :='';
            DokumentON_Familia_B_P.AsString :='';
            DokumentON_Familia_B_PD.AsString :='';
          end;
          if (DokumentON_FamiliaP.AsString='')  then begin
            DokumentON_FamiliaP.AsString:=DokumentON_Familia.AsString;
            DokumentON_FamiliaP_B.AsString:=DokumentON_Familia_B.AsString;
          end;
        end else if strField='ONA_FAMILIA' then begin
          DokumentONA_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
          if not FPrintSvidPosle then begin
            DokumentONA_Familia_P.AsString :='';
            DokumentONA_Familia_PD.AsString :='';
            DokumentONA_Familia_B_P.AsString :='';
            DokumentONA_Familia_B_PD.AsString :='';
          end;
        end else if strField='ON_FAMILIAP' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentON_Familia.AsString)) and (DokumentON_Familia_B.AsString<>'')
            then DokumentON_FamiliaP_B.AsString := DokumentON_Familia_B.AsString
            else DokumentON_FamiliaP_B.AsString := dmBase.GetBelFamily( Field.AsString );
          if FPrintSvidPosle then begin
            DokumentON_Familia_P.AsString :='';
            DokumentON_Familia_PD.AsString :='';
            DokumentON_Familia_B_P.AsString :='';
            DokumentON_Familia_B_PD.AsString :='';
          end;
        end else if strField='ONA_FAMILIAP' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentONA_Familia.AsString)) and (DokumentONA_Familia_B.AsString<>'')
            then DokumentONA_FamiliaP_B.AsString := DokumentONA_Familia_B.AsString
            else DokumentONA_FamiliaP_B.AsString := dmBase.GetBelFamily( Field.AsString );
          if FPrintSvidPosle then begin
            DokumentONA_Familia_P.AsString :='';
            DokumentONA_Familia_PD.AsString :='';
            DokumentONA_Familia_B_P.AsString :='';
            DokumentONA_Familia_B_PD.AsString :='';
          end;
        end else if strField='ON_OTCH' then begin
          Pol := tpM;
  //        if DokumentON_Otch_B.AsString='' then begin
          DokumentON_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);

          DokumentON_Otch_P.AsString :='';
          DokumentON_Otch_PD.AsString :='';
          DokumentON_Otch_B_P.AsString :='';
          DokumentON_Otch_B_PD.AsString :='';

          //        end;
        end else if strField='ONA_NAME' then begin
          Pol := tpG;
  //        if DokumentONA_Name_B.AsString='' then begin
          DokumentONA_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);

          DokumentONA_Name_P.AsString :='';
          DokumentONA_Name_PD.AsString :='';
          DokumentONA_Name_B_P.AsString :='';
          DokumentONA_Name_B_PD.AsString :='';
  //        end;
        end else if strField='ONA_OTCH' then begin
          Pol := tpG;
  //        if DokumentONA_Otch_B.AsString='' then begin
          DokumentONA_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);

          DokumentONA_Otch_P.AsString :='';
          DokumentONA_Otch_PD.AsString :='';
          DokumentONA_Otch_B_P.AsString :='';
          DokumentONA_Otch_B_PD.AsString :='';
  //        end;
        end;
      end;
    end;
    FRun := false;
  end;
  inherited;
end;

procedure TfmRastBrak.btPadegClick(Sender: TObject);
begin
//  if EditPadegRastBrak( Dokument ) then begin
//    QueryExit := true;
//  end;
end;

procedure TfmRastBrak.edRukovEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

procedure TfmRastBrak.FormCreate(Sender: TObject);
begin
  inherited;
//  RunAutoScale(Self);
end;

procedure TfmRastBrak.TBItemArxSprClick(Sender: TObject);
begin
  tsSprav.TabVisible:=TBItemArxSpr.Checked;
//  edAddTextArx.Text := EmptyIzm+'.';
end;
//-------------------------------------------------------
function TfmRastBrak.AddSvid(lAllRun:Boolean):String;
var
  fld : TField;
  d : TDateTime;
  strNewNomerON, strNewSeriaON : String;
  strNewNomerONA, strNewSeriaONA : String;
begin
  Result:='';
  fld := Dokument.FindField('DATEZ');
  if fld=nil then begin
    d := Date;
  end else begin
    if fld.IsNull then d := Date
                  else d := fld.AsDateTime;
  end;
  if not dmBase.OblArxivZAGS then begin
    Dokument.CheckBrowseMode;
    Dokument.Edit;
    Result := dmBase.GetNewNomerSvidR(strNewNomerON, strNewSeriaON, strNewNomerONA, strNewSeriaONA);
    if (Result='') then begin
      if FOnlySvid then begin
        DokumentSVID_SERIA.AsString := strNewSeriaON;
        DokumentSVID_NOMER.AsString := strNewNomerON;
        DokumentDATESV.AsDateTime := d;
      end else begin
        if (Dokument.FieldByName('ON_SVID_NOMER').AsString='') or lAllRun then begin
          Dokument.FieldByName('ON_SVID_NOMER').AsString   := strNewNomerON;
          Dokument.FieldByName('ON_SVID_SERIA').AsString   := strNewSeriaON;
  //        Dokument.FieldByName('ON_SVID_DATE').AsDateTime  := d;
        end else begin
          Result:='Номер свидетельства у мужчины уже заполнен !';
        end;
        if (Dokument.FieldByName('ONA_SVID_NOMER').AsString='') or lAllRun then begin
          Dokument.FieldByName('ONA_SVID_NOMER').AsString  := strNewNomerONA;
          Dokument.FieldByName('ONA_SVID_SERIA').AsString  := strNewSeriaONA;
  //        Dokument.FieldByName('ONA_SVID_DATE').AsDateTime := d;
        end else begin
          Result:='Номер свидетельства у женщины уже заполнен !';
        end;
      end;
    end;
  end;
end;

procedure TfmRastBrak.TBItemAddSvidClick(Sender: TObject);
var
  strErr : String;
begin
  strErr:=AddSvid;
  if strErr<>'' then begin
    PutError(strErr,self);
  end;
end;

procedure TfmRastBrak.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  TBItemAddSvidClick(nil);
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmRastBrak.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmRastBrak.UpdateActions;
begin
  inherited;
  {$IFDEF ZAGS}
    TBItemDolg.Enabled := N_F_edCopy.Checked;
  {$ENDIF}
end;

procedure TfmRastBrak.cbOnlyGodONClick(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmRastBrak.CheckOnlyGod;
begin
  if cbOnlyGodON.Checked then begin
    edON_DATER.EditButton.Visible:=false;
    edON_DATER.EditFormat:='YYYY';
  end else begin
    edON_DATER.EditButton.Visible:=true;
    edON_DATER.EditFormat:='DD.MM.YYYY';
  end;
  if cbOnlyGodONA.Checked then begin
    edONA_DATER.EditButton.Visible:=false;
    edONA_DATER.EditFormat:='YYYY';
  end else begin
    edONA_DATER.EditButton.Visible:=true;
    edONA_DATER.EditFormat:='DD.MM.YYYY';
  end;
end;

procedure TfmRastBrak.CheckOnlyVozrast(lClear: Boolean);
begin
  if TBItemVozrast.Checked then begin
    lbDateR_Rodit.Caption := '5. Возраст';
    edON_VOZR.Left      := edON_DATER.Left;
    edONA_VOZR.Left     := edONA_DATER.Left;
    cbOnlyGodON.Visible := false;
    cbOnlyGodONA.Visible:= false;
    edON_DATER.Visible  := false;
    edONA_DATER.Visible := false;
    edON_VOZR.Visible   := true;
    edONA_VOZR.Visible  := true;
    if lClear then begin
      edON_DATER.Value  := null;
      edONA_DATER.Value := null;
    end;
  end else begin
    lbDateR_Rodit.Caption := '5. Дата рождения';
    edON_DATER.Visible  := true;
    edONA_DATER.Visible := true;
    cbOnlyGodON.Visible := true;
    cbOnlyGodONA.Visible:= true;
    edON_VOZR.Visible   := false;
    edONA_VOZR.Visible  := false;
    if lClear then begin
      edON_VOZR.Value   := null;
      edONA_VOZR.Value  := null;
    end;
  end;
end;

procedure TfmRastBrak.TBItemVozrastClick(Sender: TObject);
begin
  CheckOnlyVozrast(true);
end;

procedure TfmRastBrak.edON_OBLNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmRastBrak.edON_RAIONNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;


procedure TfmRastBrak.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetRastBrak(Self);
//  Gisun.CheckRastBrak(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmRastBrak.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterRastBrak(Self);
//  Gisun.CheckRastBrak(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmRastBrak.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then begin
    if pc.Pages[pc.ActivePageIndex].Name='tsSvid' then begin
      CheckForAll_Bel( nil );
      CheckValueSvid(false);
    end else begin
      N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
    end;
  end;
end;
//----------------------------------------------------------------------
procedure TfmRastBrak.CheckValueSvid(lAll:Boolean);
var
  s:String;
  arr:TArrStrings;
begin
  // в творительном падеже по русски
  if (DokumentON_Familia_P.AsString='') or lAll then begin
    s := DokumentON_Familia.AsString+' '+DokumentON_NAME.AsString+' '+DokumentON_OTCH.AsString;

    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
      s := GetPadegFIO3(DokumentON_Familia.AsString,DokumentON_NAME.AsString,DokumentON_OTCH.AsString,'м','Т');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end;

    StrToArr(s,arr,' ',false);
    SetLength(arr,3);
    DokumentON_Familia_P.AsString:=arr[0];
    DokumentON_NAME_P.AsString:=arr[1];
    DokumentON_OTCH_P.AsString:=arr[2];
  end;
  if (DokumentONA_Familia_P.AsString='') or lAll then begin
    s := DokumentONA_Familia.AsString+' '+DokumentONA_NAME.AsString+' '+DokumentONA_OTCH.AsString;
    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
      s := GetPadegFIO3(DokumentONA_Familia.AsString,DokumentONA_NAME.AsString,DokumentONA_OTCH.AsString,'ж','Т');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end;
    StrToArr(s,arr,' ',false);
    SetLength(arr,3);
    DokumentONA_Familia_P.AsString:=arr[0];
    DokumentONA_NAME_P.AsString:=arr[1];
    DokumentONA_OTCH_P.AsString:=arr[2];
  end;
  // в дательном падеже по русски
  if (DokumentON_Familia_PD.AsString='') or lAll then begin
    if FPrintSvidPosle
      then s := DokumentON_FamiliaP.AsString
      else s := DokumentON_Familia.AsString;
    if s='' then s:='-';
//    s := s+' '+DokumentON_NAME.AsString+' '+DokumentON_OTCH.AsString;
    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
//      s := GetPadegFIO(s,'м','Д');   // подвисало для
      s := GetPadegFIO3(s, DokumentON_NAME.AsString, DokumentON_OTCH.AsString,'м','Д');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end else begin
      s:=s+' '+DokumentON_NAME.AsString+' '+DokumentON_OTCH.AsString;
    end;
    StrToArr(s,arr,' ',false);
    SetLength(arr,3);
      if arr[0]='-'
      then DokumentON_Familia_PD.AsString:=''
      else DokumentON_Familia_PD.AsString:=arr[0];
    DokumentON_NAME_PD.AsString:=arr[1];
    DokumentON_OTCH_PD.AsString:=arr[2];
  end;
  if (DokumentONA_Familia_PD.AsString='') or lAll then begin
    if FPrintSvidPosle
      then s := DokumentONA_FamiliaP.AsString
      else s := DokumentONA_Familia.AsString;
    if s='' then s:='-';
//    s := s+' '+DokumentONA_NAME.AsString+' '+DokumentONA_OTCH.AsString;
    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
//      s := GetPadegFIO(s,'ж','Д');
      s := GetPadegFIO3(s, DokumentON_NAME.AsString, DokumentON_OTCH.AsString,'ж','Д');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end else begin
      s:=s+' '+DokumentONA_NAME.AsString+' '+DokumentONA_OTCH.AsString;
    end;
    StrToArr(s,arr,' ',false);
    SetLength(arr,3);
    if arr[0]='-'
      then DokumentONA_Familia_PD.AsString:=''
      else DokumentONA_Familia_PD.AsString:=arr[0];
    DokumentONA_NAME_PD.AsString:=arr[1];
    DokumentONA_OTCH_PD.AsString:=arr[2];
  end;
  // по-бел в творительном падеже
  if (DokumentON_Familia_B_P.AsString='') or lAll then begin
    DokumentON_Familia_B_P.AsString:=DokumentON_Familia_B.AsString;
    DokumentON_NAME_B_P.AsString:=DokumentON_NAME_B.AsString;
    DokumentON_OTCH_B_P.AsString:=DokumentON_OTCH_B.AsString;
  end;
  if (DokumentONA_Familia_B_P.AsString='') or lAll then begin
    DokumentONA_Familia_B_P.AsString:=DokumentONA_Familia_B.AsString;
    DokumentONA_NAME_B_P.AsString:=DokumentONA_NAME_B.AsString;
    DokumentONA_OTCH_B_P.AsString:=DokumentONA_OTCH_B.AsString;
  end;
  // по-бел в дательном падеже
  if (DokumentON_Familia_B_PD.AsString='') or lAll then begin
    if FPrintSvidPosle
      then DokumentON_Familia_B_PD.AsString:=DokumentON_FamiliaP_B.AsString
      else DokumentON_Familia_B_PD.AsString:=DokumentON_Familia_B.AsString;
    DokumentON_NAME_B_PD.AsString:=DokumentON_NAME_B.AsString;
    DokumentON_OTCH_B_PD.AsString:=DokumentON_OTCH_B.AsString;
  end;
  if (DokumentONA_Familia_B_PD.AsString='') or lAll then begin
    if FPrintSvidPosle
      then DokumentONA_Familia_B_PD.AsString:=DokumentONA_FamiliaP_B.AsString
      else DokumentONA_Familia_B_PD.AsString:=DokumentONA_Familia_B.AsString;
    DokumentONA_NAME_B_PD.AsString:=DokumentONA_NAME_B.AsString;
    DokumentONA_OTCH_B_PD.AsString:=DokumentONA_OTCH_B.AsString;
  end;

end;
//---------------------------------------------------------------------------------
procedure TfmRastBrak.edON_DATERUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 14);
end;

function TfmRastBrak.EmptyIzm: String;
begin
  Result:=SprRast_EmptyIzm;  // uProject
end;
//---------------------------------------------
procedure TfmRastBrak.CheckWhoSvid;
begin
  if FWhoSvid<>'' then begin
    lbVidONA.Visible:=false;
    lbVidONA_B.Visible:=false;
    if FWhoSvid='М' then begin
      edONA_FamiliaPD_Sv.Visible:=false;
      edONA_NamePD_Sv.Visible:=false;
      edONA_OtchPD_Sv.Visible:=false;
      BLR_edONA_FamiliaPD_B_Sv.Visible:=false;
      BLR_edONA_NamePD_B_Sv.Visible:=false;
      BLR_edONA_OtchPD_B_Sv.Visible:=false;
    end else begin
      lbVidON.Caption:='Свидетельство выдано гражданке';
      lbVidON_B.Caption:='Пасведчанне выдадзена грамадзянцы';
      edON_FamiliaPD_Sv.Visible:=false;        edONA_FamiliaPD_Sv.Top:=edON_FamiliaPD_Sv.Top;
      edON_NamePD_Sv.Visible:=false;           edONA_NamePD_Sv.Top:=edON_NamePD_Sv.Top;
      edON_OtchPD_Sv.Visible:=false;           edONA_OtchPD_Sv.Top:=edON_OtchPD_Sv.Top;
      BLR_edON_FamiliaPD_B_Sv.Visible:=false;  BLR_edONA_FamiliaPD_B_Sv.Top:=BLR_edON_FamiliaPD_B_Sv.Top;
      BLR_edON_NamePD_B_Sv.Visible:=false;     BLR_edONA_NamePD_B_Sv.Top:=BLR_edON_NamePD_B_Sv.Top;
      BLR_edON_OtchPD_B_Sv.Visible:=false;     BLR_edONA_OtchPD_B_Sv.Top:=BLR_edON_OtchPD_B_Sv.Top;
    end;
  end;
end;
//---------------------------------------------
procedure TfmRastBrak.CheckRnGorod;
//var
//  nW,nL,nT, nW1 : Integer;
begin
{
  if EnabledRnGorod or
     (not DokumentON_M_B_RN.IsNull and not DokumentON_M_B_RN.AsBoolean) then begin
    nW  := edON_M_GOROD_R.Width;
    nL  := edON_M_RAION.Left;
    nT  := edON_M_GOROD_R.Top;
    nW1 := edON_M_RNGOROD.Width;
    edON_M_RNGOROD.Left  := nL;
    edON_M_RNGOROD.Top   := nT;
    edON_M_GOROD_R.Width := nW - nW1 - 5;
    edON_M_GOROD_R.Left  := nL + nW1 + 5;
    edON_M_RNGOROD.Visible := true;
  end else begin
    edON_M_RNGOROD.Visible := false;
    edON_M_GOROD_R.Width := edON_M_RAION.Width;
  end;

  if EnabledRnGorod or
     (not DokumentONA_M_B_RN.IsNull and not DokumentONA_M_B_RN.AsBoolean) then begin
    nW  := edONA_M_GOROD_R.Width;
    nL  := edONA_M_RAION.Left;
    nT  := edONA_M_GOROD_R.Top;
    nW1 := edONA_M_RNGOROD.Width;
    edONA_M_RNGOROD.Left  := nL;
    edONA_M_RNGOROD.Top   := nT;
    edONA_M_GOROD_R.Width := nW - nW1 - 5;
    edONA_M_GOROD_R.Left  := nL + nW1 + 5;
    edONA_M_RNGOROD.Visible := true;
  end else begin
    edONA_M_RNGOROD.Visible := false;
    edONA_M_GOROD_R.Width := edONA_M_RAION.Width;
  end;
}
end;
//--------------------------------------------------------------------
procedure TfmRastBrak.edSpecEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edSpec,DokumentSPEC.AsString+' '); end;
//--------------------------------------------------------------------
procedure TfmRastBrak.N_F_cbPovtorClick(Sender: TObject);
begin
  inherited;
//  lbPovtor.Visible:=N_F_cbPovtor.Checked;
end;
//--------------------------------------------------------------------
function TfmRastBrak.WriteBrak(ArrRec:TCurrentRecord):Boolean;
var
  v : Variant;
  s,sBel : String;
  SOATO:TSOATO;
  lCheck,lOk:Boolean;
begin
  Result:=true;
  lCheck:=dbDisableControls(Dokument);
  FRun:=true;
  try
    QueryExit:=true;

    EditDataSet(Dokument);
    s := GetValueField(arrRec, 'NAME_ZAGS');
    sBel:='';
    if s='' then begin
      v := GetValueField(arrRec, 'ID_ZAGS');
      if dmBase.SprNames.Locate('ID', v, []) then begin
        s := dmBase.SprNames.FieldByName('NAME').AsString;
        sBel := dmBase.SprNames.FieldByName('NAME_B').AsString;
      end;
    end else begin
      sBel:=GetValueField(arrRec, 'NAME_ZAGS_B');
    end;
    QueryExit:=true;
    DokumentTYPE_RAST.AsInteger:=1;
    DokumentSUD_DATE.AsDateTime:=dmBase.getCurDate;
    DokumentBRAK_ZAKL.AsString:=fmMain.GetPadeg(s,'Т');
    DokumentBRAK_ZAKL_B.AsString:=sBel;
    v := GetValueFieldEx(arrRec, 'DATEZ',0);
    if v>0 then DokumentBRAK_DATE.AsDateTime:=v else DokumentBRAK_DATE.AsString:='';
    DokumentBRAK_NOMER.AsString:=GetValueFieldEx(arrRec, 'NOMER','');
    DokumentBRAK_ID.AsInteger:=GetValueFieldEx(arrRec, 'ID', 0);
    DokumentON_IDENTIF.AsString := GetValueFieldEx(arrRec, 'ON_IDENTIF','');
    DokumentONA_IDENTIF.AsString := GetValueFieldEx(arrRec, 'ONA_IDENTIF','');

    {$IFDEF GISUN}
      lOk:=true;
      {
      if IsActiveGISUN and Gisun.IsEnabled then begin
        lOk:=false;
      end;
    }
    {$ELSE}
       lOk:=true;
    {$ENDIF}

    if lOk then begin
      DokumentON_FAMILIA.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIAP','');
      DokumentON_FAMILIA_B.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIAP_B','');
      DokumentON_FAMILIAP.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIA','');
      DokumentON_FAMILIAP_B.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIA_B','');
      DokumentON_NAME.AsString:=GetValueFieldEx(arrRec, 'ON_NAME','');
      DokumentON_NAME_B.AsString:=GetValueFieldEx(arrRec, 'ON_NAME_B','');
      DokumentON_OTCH.AsString:=GetValueFieldEx(arrRec, 'ON_OTCH','');
      DokumentON_OTCH_B.AsString:=GetValueFieldEx(arrRec, 'ON_OTCH_B','');
      v := GetValueFieldEx(arrRec, 'ON_DATER',0);
      if v>0 then DokumentON_DATER.AsDateTime:=v else DokumentON_DATER.AsString:='';
      DokumentON_GRAG.AsInteger:=GetValueFieldEx(arrRec, 'ON_GRAG',0);
      DokumentON_GRAG_ADD.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZBrak, GetValueFieldEx(arrRec, 'ID', 0), STOD('1899-12-30',tdAds),
                                      'ON_GRAG_ADD', ftMemo);
      edON_GRAG.Hint:=DokumentON_GRAG_ADD.AsString;

      DokumentON_NATION.AsInteger:=GetValueFieldEx(arrRec, 'ON_NATION',0);
      DokumentON_OBRAZ.AsInteger:=GetValueFieldEx(arrRec, 'ON_OBRAZ',0);

      DokumentON_DOK_TYPE.AsString := GetValueFieldEx(arrRec, 'ON_DOK_TYPE','888');
      DokumentON_DOK_SERIA.AsString:= GetValueFieldEx(arrRec, 'ON_DOK_SERIA','');
      DokumentON_DOK_NOMER.AsString:= GetValueFieldEx(arrRec, 'ON_DOK_NOMER','');
      DokumentON_DOK_ORGAN.AsString:= GetValueFieldEx(arrRec, 'ON_DOK_ORGAN','');
      v := GetValueField(arrRec, 'ON_DOK_DATE');
      if v=null then DokumentON_DOK_DATE.AsString := '' else DokumentON_DOK_DATE.Value:=v;
      DokumentON_DOKUMENT.AsString := GetValueFieldEx(arrRec, 'ON_DOKUMENT','');
//      DokumentON_IDENTIF.AsString := GetValueFieldEx(arrRec, 'ON_IDENTIF','');
      // место рождения
      DokumentON_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_GOSUD','');
      v := GetValueField(arrRec, 'ON_B_OBL');
      if v = null then DokumentON_B_OBL.AsString := ''  else DokumentON_B_OBL.Value    := v;
      DokumentON_OBL.AsString:=GetValueFieldEx(arrRec, 'ON_OBL','');
      DokumentON_RAION.AsString := GetValueFieldEx(arrRec, 'ON_RAION','');
      DokumentON_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_B_GOROD','');
      DokumentON_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_GOROD','');
      // место жительства
      DokumentON_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOSUD','');
      v := GetValueField(arrRec, 'ON_M_B_OBL');
      if v = null then DokumentON_M_B_OBL.AsString := ''   else DokumentON_M_B_OBL.Value    := v;
      DokumentON_M_OBL.AsString := GetValueFieldEx(arrRec, 'ON_M_OBL','');
      DokumentON_M_RAION.AsString := GetValueFieldEx(arrRec, 'ON_M_RAION','');
      v:=GetValueFieldEx(arrRec, 'ON_M_B_RN',false);
      if v=true then begin
        DokumentON_M_RNGOROD.AsString := '';
      end else begin
        DokumentON_M_RNGOROD.AsString := DokumentON_M_RAION.AsString;
        DokumentON_M_RAION.AsString := '';
      end;
      DokumentON_M_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_M_B_GOROD','');
      DokumentON_M_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOROD','');
      DokumentON_M_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ON_M_GOROD_R','');
      DokumentON_M_DOM.AsString := GetValueFieldEx(arrRec, 'ON_M_DOM','');
      DokumentON_M_KORP.AsString := GetValueFieldEx(arrRec, 'ON_M_KORP','');
      DokumentON_M_KV.AsString := GetValueFieldEx(arrRec, 'ON_M_KV','');

      DokumentON_WORK.AsString:=GetValueFieldEx(arrRec, 'ON_WORK','');

  //--------------- ОНА ---------------------
      DokumentONA_FAMILIA.AsString:=GetValueFieldEx(arrRec, 'ONA_FAMILIAP','');
      DokumentONA_FAMILIA_B.AsString:=GetValueFieldEx(arrRec, 'ONA_FAMILIAP_B','');
      DokumentONA_FAMILIAP.AsString:=GetValueFieldEx(arrRec, 'ONA_FAMILIA','');
      DokumentONA_FAMILIAP_B.AsString:=GetValueFieldEx(arrRec, 'ONA_FAMILIA_B','');
      DokumentONA_NAME.AsString:=GetValueFieldEx(arrRec, 'ONA_NAME','');
      DokumentONA_NAME_B.AsString:=GetValueFieldEx(arrRec, 'ONA_NAME_B','');
      DokumentONA_OTCH.AsString:=GetValueFieldEx(arrRec, 'ONA_OTCH','');
      DokumentONA_OTCH_B.AsString:=GetValueFieldEx(arrRec, 'ONA_OTCH_B','');
      v := GetValueFieldEx(arrRec, 'ONA_DATER',0);
      if v>0 then DokumentONA_DATER.AsDateTime:=v else DokumentONA_DATER.AsString:='';
      DokumentONA_GRAG.AsInteger:=GetValueFieldEx(arrRec, 'ONA_GRAG',0);
      DokumentONA_GRAG_ADD.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZBrak, GetValueFieldEx(arrRec, 'ID', 0), STOD('1899-12-30',tdAds),
                                      'ONA_GRAG_ADD', ftMemo);
      edONA_GRAG.Hint:=DokumentONA_GRAG_ADD.AsString;

      DokumentONA_NATION.AsInteger:=GetValueFieldEx(arrRec, 'ONA_NATION',0);
      DokumentONA_OBRAZ.AsInteger:=GetValueFieldEx(arrRec, 'ONA_OBRAZ',0);

      DokumentONA_DOK_TYPE.AsString := GetValueFieldEx(arrRec, 'ONA_DOK_TYPE','888');
      DokumentONA_DOK_SERIA.AsString:= GetValueFieldEx(arrRec, 'ONA_DOK_SERIA','');
      DokumentONA_DOK_NOMER.AsString:= GetValueFieldEx(arrRec, 'ONA_DOK_NOMER','');
      DokumentONA_DOK_ORGAN.AsString:= GetValueFieldEx(arrRec, 'ONA_DOK_ORGAN','');
      v := GetValueField(arrRec, 'ONA_DOK_DATE');
      if v=null then DokumentONA_DOK_DATE.AsString := '' else DokumentONA_DOK_DATE.Value:=v;
      DokumentONA_DOKUMENT.AsString := GetValueFieldEx(arrRec, 'ONA_DOKUMENT','');
//      DokumentONA_IDENTIF.AsString := GetValueFieldEx(arrRec, 'ONA_IDENTIF','');
      // место рождения
      DokumentONA_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_GOSUD','');
      v := GetValueField(arrRec, 'ONA_B_OBL');
      if v = null then DokumentONA_B_OBL.AsString := ''  else DokumentONA_B_OBL.Value    := v;
      DokumentONA_OBL.AsString:=GetValueFieldEx(arrRec, 'ONA_OBL','');
      DokumentONA_RAION.AsString := GetValueFieldEx(arrRec, 'ONA_RAION','');
      DokumentONA_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_B_GOROD','');
      DokumentONA_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_GOROD','');
      // место жительства
      DokumentONA_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOSUD','');
      v := GetValueField(arrRec, 'ONA_M_B_OBL');
      if v = null then DokumentONA_M_B_OBL.AsString := ''   else DokumentONA_M_B_OBL.Value    := v;
      DokumentONA_M_OBL.AsString := GetValueFieldEx(arrRec, 'ONA_M_OBL','');
      DokumentONA_M_RAION.AsString := GetValueFieldEx(arrRec, 'ONA_M_RAION','');
      v:=GetValueFieldEx(arrRec, 'ONA_M_B_RN',false);
      if v=true then begin
        DokumentONA_M_RNGOROD.AsString := '';
      end else begin
        DokumentONA_M_RNGOROD.AsString := DokumentONA_M_RAION.AsString;
        DokumentONA_M_RAION.AsString := '';
      end;
      DokumentONA_M_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_M_B_GOROD','');
      DokumentONA_M_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOROD','');
      DokumentONA_M_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOROD_R','');
      DokumentONA_M_DOM.AsString := GetValueFieldEx(arrRec, 'ONA_M_DOM','');
      DokumentONA_M_KORP.AsString := GetValueFieldEx(arrRec, 'ONA_M_KORP','');
      DokumentONA_M_KV.AsString := GetValueFieldEx(arrRec, 'ONA_M_KV','');

      DokumentONA_WORK.AsString:=GetValueFieldEx(arrRec, 'ONA_WORK','');

      v := GetValueField(arrRec, 'OTMETKA');
      if v=null then begin    // если отметка в з/а о браке пустая, не затирать текущее значение
        //DokumentOTMETKA.AsString := ''
      end else if (Trim(DokumentOTMETKA.AsString)='') or (Trim(DokumentOTMETKA.AsString)='#') then begin  //
        DokumentOTMETKA.AsString:=VarToStr(v);
      end;

  //-----------------------------------------
      SOATO:=dmBase.GetSoatoAkt(Dokument,
              'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD',true,FLenSoato);
      DokumentON_SOATO.AsString:=SOATO.Kod;

      SOATO:=dmBase.GetSoatoAkt(Dokument,
              'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD',true,FLenSoato);
      DokumentONA_SOATO.AsString:=SOATO.Kod;

    end;

    PostDataSet(Dokument);
  finally
    FRun:=false;
    dbEnableControls(Dokument,lCheck);
  end;

end;
//--------------------------------------------------------------------
procedure TfmRastBrak.btSeekClick(Sender: TObject);
var
  nID,nGod,nNomer:Integer;
  arrRec:TCurrentRecord;
  nTypeObj:Integer;
begin
 SetLength(arrRec,1);
 if (edBrakNomer.Value=null) or (VarToStr(edBrakNomer.Value)='')
   then nNomer:=0
   else nNomer:=edBrakNomer.Value;
 if (edBrakDate.Value=null) or (Trim(edBrakDate.Text)='') or (Trim(edBrakDate.Text)='.  .')
   then nGod:=0
   else nGod:=YearOf(edBrakDate.Value);
 nTypeObj:=_TypeObj_ZBrak;
 nID:=SimpleSeekAkt(nTypeObj, 0, nGod, nNomer, arrRec);
 if nID>0 then begin
   WriteBrak(arrRec);
 end;
end;
//---------------------------------------------------------------------------
procedure TfmRastBrak.TBItemChoiceBrakClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ParamFlt:TParamFieldFlt;
begin
//  if ExitAsGISUN(true) then exit;

  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_BRAK');
  if Opis<>nil then begin
    ParamFlt:=CreateParamFlt(edON_Familia.Text,'ON_FAMILIAP');
    if ParamFlt<>nil then Opis.AutoFilter:=true;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edON_Familia, v, arrRec, ParamFlt) and (v<>null) then begin
      WriteBrak(arrRec);
    end;
  end;
end;

function TfmRastBrak.BeforeReport:Boolean;
begin
  Result:=inherited BeforeReport;
  if Result then begin
    CheckForAll_Bel( nil );
    CheckValueSvid(false);
  end;
end;

procedure TfmRastBrak.btAddChildClick(Sender: TObject);
begin
  QueryExit:=true;
  tbDeti.Append;
  ActiveControl:=GridDeti;
end;

procedure TfmRastBrak.btDelChildClick(Sender: TObject);
begin
  if tbDeti.RecordCount>0 then begin
    QueryExit:=true;
    tbDeti.Delete;
    ActiveControl:=GridDeti;
  end;
end;

procedure TfmRastBrak.btRazdelClick(Sender: TObject);
begin
  edOTMETKA.AutoSelect:=false;
  edOTMETKA.Value := edOTMETKA.Value + '#';
  ActiveControl := edOTMETKA;
  edOTMETKA.SelStart := Length(edOTMETKA.Value);
  edOTMETKA.SelLength:= 1;
end;

function TfmRastBrak.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
  {$IFNDEF ZAGS}
//  if Result then begin
//    cbProvDvig.Checked := not DokumentPROV.AsBoolean;
//  end;
  {$ENDIF}
  if not FOnlySvid then begin
  // в методе Create отключена проверка FCheckLookupField:=false
    n:=LimitMRUList(3);
    SetMRUList(edON_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edON_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edONA_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edONA_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

    n:=LimitMRUList(1);
    SetMRUList(edON_M_OBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edON_OBL_R,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_M_OBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_OBL_R,n,1,true,false,false,FAddButtonMRUList);

    n:=LimitMRUList(2);
    SetMRUList(edON_M_RAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edON_RAION_R,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_M_RAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_RAION_R,n,2,true,false,false,FAddButtonMRUList);
  end;
end;

//------------------------------------------------------------------------
procedure TfmRastBrak.CheckControlSvid;
var
  n:Integer;
  c : TColumnEh;
begin
  c := DbGridEh1.FieldColumns['WHO_SVID'];
  if c<>nil
    then c.Visible:=true;

  if GlobalTask.ParamAsBoolean('INVERT_SVID') then begin
    Init_ArrCheckControl(19);
    n:=0;

    FArrCheckControl[n].Cont1:=Label76;
    FArrCheckControl[n].Cont2:=Label77; Inc(n);

    FArrCheckControl[n].Cont1:=edRukov_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRukov_Sv_B; Inc(n);

    FArrCheckControl[n].Cont1:=edON_Familia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_Familia_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_Name_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_Name_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_Otch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_Otch_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edONA_Familia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_Familia_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_Name_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_Name_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_Otch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_Otch_B_Sv; Inc(n);  // 8

    FArrCheckControl[n].Cont1:=edON_FamiliaP_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_FamiliaP_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_FamiliaP_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_FamiliaP_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edON_FamiliaPD_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_FamiliaPD_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_NamePD_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_NamePD_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_OtchPD_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_OtchPD_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edONA_FamiliaPD_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_FamiliaPD_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_NamePD_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_NamePD_B_Sv; Inc(n);    // 15
    FArrCheckControl[n].Cont1:=edONA_OtchPD_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_OtchPD_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=Label50;
    FArrCheckControl[n].Cont2:=Label51; Inc(n);
    FArrCheckControl[n].Cont1:=lbVidON;
    FArrCheckControl[n].Cont2:=lbVidON_B; Inc(n);
    FArrCheckControl[n].Cont1:=lbVidONA;
    FArrCheckControl[n].Cont2:=lbVidONA_B; //Inc(n);    // 19


  end;
end;
//-------------------------------------------------------------------------
procedure TfmRastBrak.WriteVOENKOM(nType:Integer);
var
  SOATO:TSOATO;
  n:Integer;
  fld:TField;
begin
  if nType=1 then begin
    SOATO:=dmBase.GetSoatoAkt(Dokument,
           'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD',true,FLenSoato);
  end else begin
    SOATO:=dmBase.GetSoatoAkt(Dokument,
           'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD',true,FLenSoato);
  end;
  if nType=1
    then fld:=DokumentON_VOENKOM
    else fld:=DokumentONA_VOENKOM;
  n:=dmBase.VoenkomFromSOATO(SOATO.Kod);
  if n>0 then begin
    EditDataSet(Dokument);
    fld.AsInteger:=n;
  end else if fld.AsInteger>0 then begin
    EditDataSet(Dokument);
    fld.AsString:='';
  end;
end;
//-------------------------------------------------------------------------
procedure TfmRastBrak.edON_VoenkomEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edON_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
  cbON_VUS.Checked:=true;
end;
//--------------------------------------------------------------------------------
procedure TfmRastBrak.edON_VoenkomEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  edON_Voenkom.Value:=null;
  cbON_VUS.Checked:=false;
end;
//--------------------------------------------------------------------------------
procedure TfmRastBrak.edON_VoenkomChange(Sender: TObject);
begin
  if edON_Voenkom.Value<>null
    then cbON_VUS.Checked:=true;
end;
//--------------------------------------------------------------------------------
procedure TfmRastBrak.edONA_VOENKOMEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edONA_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
  cbONA_VUS.Checked:=true;
end;
//--------------------------------------------------------------------------------
procedure TfmRastBrak.edONA_VOENKOMEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  edONA_Voenkom.Value:=null;
  cbONA_VUS.Checked:=false;
end;
//--------------------------------------------------------------------------------
procedure TfmRastBrak.edONA_VOENKOMChange(Sender: TObject);
begin
  if edONA_Voenkom.Value<>null
    then cbONA_VUS.Checked:=true;
end;
//--------------------------------------------------------------------------------
procedure TfmRastBrak.TBItemPrintSvFIOClick(Sender: TObject);
begin
  TBItemPrintSvFIO.Checked:=not TBItemPrintSvFIO.Checked;
  FPrintSvidPosle:=TBItemPrintSvFIO.Checked;
  if FPrintSvidPosle
    then GlobalTask.SetLastValueAsString('PRINT_SVID_FIO_POSLE', '1')
    else GlobalTask.SetLastValueAsString('PRINT_SVID_FIO_POSLE', '0');
{
  EditDataSet(Dokument);
  DokumentON_FAMILIA_P.ASSTRING :='';
  DokumentON_FAMILIA_PD.ASSTRING :='';
  DokumentON_FAMILIA_B_P.ASSTRING :='';
  DokumentON_FAMILIA_B_PD.ASSTRING :='';
}
end;

procedure TfmRastBrak.N_F_edTypeRastChange(Sender: TObject);
begin
  if N_F_edTypeRast.ItemIndex=1 then begin  // по взаимному согласию
    lbSudSila.Enabled:=false;
    edSudSila.Enabled:=false;
  end else begin
    lbSudSila.Enabled:=true;
    edSudSila.Enabled:=true;
  end;
end;

procedure TfmRastBrak.TBItemChoiceDeclRastClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  arr:TArrStrings;
  strDeti, sON,sONA : String;
  old : TCursor;
  lCheck,lWrONA,lWrON:Boolean;
  nSum:Extended;
  ParamFlt:TParamFieldFlt;
  sl : TStringList;
  i,j:Integer;
begin
//  if ExitAsGISUN(true) then exit;
  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_DECL_RAST');
  if Opis<>nil then begin
    ParamFlt:=CreateParamFlt(edON_Familia.Text,'ON_FAMILIA');
    if ParamFlt<>nil then Opis.AutoFilter:=true;
    Opis.DataSet.Filter := 'OTKAZ=0 or Empty(OTKAZ)';

//    if edON_Familia.Text<>'' then begin
//      Opis.DataSet.Filter := 'ON_FAMILIA='+QStr(edON_Familia.Text);
//    end;
    Opis.DataSet.Filtered := true;
    try
    SetLength(arrRec,1);
    v := null;

    if Opis.ChoiceFromSprEx(nil, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      lCheck:=dbDisableControls(Dokument);
      FRun:=true;
      try
        EditDataSet(Dokument);
        DokumentDeclare_ID.AsInteger:=GetValueFieldEx(arrRec,'ID',0);

        DokumentON_FAMILIA.AsString  := GetValueFieldEx(arrRec, 'ON_FAMILIA','');
        DokumentON_FAMILIAP.AsString := GetValueFieldEx(arrRec, 'ON_FAMILIAP','');
        DokumentON_NAME.AsString     := GetValueFieldEx(arrRec, 'ON_NAME','');
        DokumentON_OTCH.AsString     := GetValueFieldEx(arrRec, 'ON_OTCH','');

        DokumentON_Familia_B.AsString  := GetValueFieldEx(arrRec, 'ON_FAMILIA_B','');
        DokumentON_FamiliaP_B.AsString := GetValueFieldEx(arrRec, 'ON_FAMILIAP_B','');
        DokumentON_NAME_B.AsString     := GetValueFieldEx(arrRec, 'ON_NAME_B','');
        DokumentON_OTCH_B.AsString     := GetValueFieldEx(arrRec, 'ON_OTCH_B','');

        v := GetValueField(arrRec, 'ON_DATER');
        if v = null then DokumentON_DateR.AsString := ''
                    else DokumentON_DateR.Value    := v;
        DokumentON_NATION.AsString := GetValueFieldEx(arrRec, 'ON_NATION', '0');
        DokumentON_GRAG.AsString   := GetValueFieldEx(arrRec, 'ON_GRAG', '0');

        DokumentON_GRAG_ADD.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_DRast, GetValueFieldEx(arrRec, 'ID', 0), STOD('1899-12-30',tdAds),
                                      'ON_GRAG_ADD', ftMemo);
        edON_GRAG.Hint:=DokumentON_GRAG_ADD.AsString;

        DokumentON_OBRAZ.AsString  := GetValueFieldEx(arrRec, 'ON_OBRAZ', '0');
        DokumentON_IDENTIF.AsString  := GetValueFieldEx(arrRec, 'ON_IDENTIF', '');

        DokumentON_DOK_TYPE.AsString := GetValueFieldEx(arrRec,'ON_DOK_TYPE','0');
        DokumentON_DOK_SERIA.AsString := GetValueFieldEx(arrRec,'ON_DOK_SERIA','');
        DokumentON_DOK_NOMER.AsString := GetValueFieldEx(arrRec,'ON_DOK_NOMER','');
        try
          if DokumentON_DOK_NOMER.AsString<>'' then
            DokumentON_DOK_DATE.AsDateTime := GetValueFieldEx(arrRec,'ON_DOK_DATE',0);
        except
          DokumentON_DOK_DATE.AsString := '';
        end;
        DokumentON_DOKUMENT.AsString := GetValueFieldEx(arrRec,'ON_DOKUMENT','');

        DokumentON_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_GOSUD', '');
        DokumentON_OBL.AsString   := GetValueFieldEx(arrRec, 'ON_OBL', '');
        DokumentON_RAION.AsString   := GetValueFieldEx(arrRec, 'ON_RAION', '');
        DokumentON_B_GOROD.AsString   := GetValueFieldEx(arrRec, 'ON_B_GOROD', '');
        DokumentON_GOROD.AsString   := GetValueFieldEx(arrRec, 'ON_GOROD', '');
        GetValueFieldEx2(arrRec, 'ON_B_OBL', DokumentON_B_OBL);

//        DokumentON_B_OBL.AsBoolean := GetValueFieldEx(arrRec, 'ON_B_OBL', true);

        DokumentON_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOSUD', '');
        DokumentON_M_OBL.AsString   := GetValueFieldEx(arrRec, 'ON_M_OBL', '');

        DokumentON_M_RNGOROD.AsString := '';
        DokumentON_M_RAION.AsString   := GetValueFieldEx(arrRec, 'ON_M_RAION', '');
        if DokumentON_M_RAION.AsString<>'' then begin
          DokumentON_M_B_RN.AsBoolean := GetValueFieldEx(arrRec, 'ON_M_B_RN', true);
          if not DokumentON_M_B_RN.AsBoolean then begin
             DokumentON_M_RNGOROD.AsString := DokumentON_M_RAION.AsString;
             DokumentON_M_RAION.AsString   := '';
          end;
        end;

        DokumentON_M_B_GOROD.AsString   := GetValueFieldEx(arrRec, 'ON_M_B_GOROD', '');
        DokumentON_M_GOROD.AsString   := GetValueFieldEx(arrRec, 'ON_M_GOROD', '');
        DokumentON_M_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ON_M_GOROD_R', '');

        DokumentON_M_DOM.AsString := GetValueFieldEx(arrRec, 'ON_M_DOM', '');
        DokumentON_M_KORP.AsString := GetValueFieldEx(arrRec, 'ON_M_KORP', '');
        DokumentON_M_KV.AsString := GetValueFieldEx(arrRec, 'ON_M_KV', '');

        GetValueFieldEx2(arrRec, 'ON_M_B_OBL', DokumentON_M_B_OBL);

        DokumentON_WORK.AsString := GetValueFieldEx(arrRec, 'ON_WORK', '');
        DokumentON_SEM.AsString := GetValueFieldEx(arrRec, 'ON_SEM', '');

        //--------- ОНА -------------------
        DokumentONA_ID.AsString := GetValueFieldEx(arrRec, 'ONA_ID','');

        DokumentONA_FAMILIA.AsString  := GetValueFieldEx(arrRec, 'ONA_FAMILIA','');
        DokumentONA_FAMILIAP.AsString := GetValueFieldEx(arrRec, 'ONA_FAMILIAP','');
        DokumentONA_NAME.AsString     := GetValueFieldEx(arrRec, 'ONA_NAME','');
        DokumentONA_OTCH.AsString     := GetValueFieldEx(arrRec, 'ONA_OTCH','');

        DokumentONA_Familia_B.AsString  := GetValueFieldEx(arrRec, 'ONA_FAMILIA_B','');
        DokumentONA_FamiliaP_B.AsString := GetValueFieldEx(arrRec, 'ONA_FAMILIAP_B','');
        DokumentONA_NAME_B.AsString     := GetValueFieldEx(arrRec, 'ONA_NAME_B','');
        DokumentONA_OTCH_B.AsString     := GetValueFieldEx(arrRec, 'ONA_OTCH_B','');

        v := GetValueField(arrRec, 'ONA_DATER');
        if v = null then DokumentONA_DateR.AsString := ''
                    else DokumentONA_DateR.Value    := v;
        DokumentONA_NATION.AsString := GetValueFieldEx(arrRec, 'ONA_NATION', '0');
        DokumentONA_GRAG.AsString   := GetValueFieldEx(arrRec, 'ONA_GRAG', '0');

        DokumentONA_GRAG_ADD.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_DRast, GetValueFieldEx(arrRec, 'ID', 0), STOD('1899-12-30',tdAds),
                                      'ONA_GRAG_ADD', ftMemo);
        edONA_GRAG.Hint:=DokumentONA_GRAG_ADD.AsString;

        DokumentONA_OBRAZ.AsString  := GetValueFieldEx(arrRec, 'ONA_OBRAZ', '0');
        DokumentONA_IDENTIF.AsString  := GetValueFieldEx(arrRec, 'ONA_IDENTIF', '');

        DokumentONA_DOK_TYPE.AsString := GetValueFieldEx(arrRec,'ONA_DOK_TYPE','0');
        DokumentONA_DOK_SERIA.AsString := GetValueFieldEx(arrRec,'ONA_DOK_SERIA','');
        DokumentONA_DOK_NOMER.AsString := GetValueFieldEx(arrRec,'ONA_DOK_NOMER','');
        try
          if DokumentONA_DOK_NOMER.AsString<>'' then
            DokumentONA_DOK_DATE.AsDateTime := GetValueFieldEx(arrRec,'ONA_DOK_DATE',0);
        except
          DokumentONA_DOK_DATE.AsString := '';
        end;
        DokumentONA_DOKUMENT.AsString := GetValueFieldEx(arrRec,'ONA_DOKUMENT','');

        DokumentONA_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_GOSUD', '');
        DokumentONA_OBL.AsString   := GetValueFieldEx(arrRec, 'ONA_OBL', '');
        DokumentONA_RAION.AsString   := GetValueFieldEx(arrRec, 'ONA_RAION', '');
        DokumentONA_B_GOROD.AsString   := GetValueFieldEx(arrRec, 'ONA_B_GOROD', '');
        DokumentONA_GOROD.AsString   := GetValueFieldEx(arrRec, 'ONA_GOROD', '');
        GetValueFieldEx2(arrRec, 'ONA_B_OBL', DokumentONA_B_OBL);

//        DokumentONA_B_OBL.AsString   := GetValueFieldEx(arrRec, 'ONA_B_OBL', '');

        DokumentONA_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOSUD', '');
        DokumentONA_M_OBL.AsString   := GetValueFieldEx(arrRec, 'ONA_M_OBL', '');

        DokumentONA_M_RNGOROD.AsString := '';
        DokumentONA_M_RAION.AsString   := GetValueFieldEx(arrRec, 'ONA_M_RAION', '');
        if DokumentONA_M_RAION.AsString<>'' then begin
          DokumentONA_M_B_RN.AsBoolean := GetValueFieldEx(arrRec, 'ONA_M_B_RN', true);
          if not DokumentONA_M_B_RN.AsBoolean then begin
             DokumentONA_M_RNGOROD.AsString := DokumentONA_M_RAION.AsString;
             DokumentONA_M_RAION.AsString   := '';
          end;
        end;

        DokumentONA_M_B_GOROD.AsString   := GetValueFieldEx(arrRec, 'ONA_M_B_GOROD', '');
        DokumentONA_M_GOROD.AsString   := GetValueFieldEx(arrRec, 'ONA_M_GOROD', '');
        DokumentONA_M_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOROD_R', '');

        DokumentONA_M_DOM.AsString := GetValueFieldEx(arrRec, 'ONA_M_DOM', '');
        DokumentONA_M_KORP.AsString := GetValueFieldEx(arrRec, 'ONA_M_KORP', '');
        DokumentONA_M_KV.AsString := GetValueFieldEx(arrRec, 'ONA_M_KV', '');

        GetValueFieldEx2(arrRec, 'ONA_M_B_OBL', DokumentONA_M_B_OBL);

        DokumentONA_WORK.AsString := GetValueFieldEx(arrRec, 'ONA_WORK', '');
        DokumentONA_SEM.AsString  := GetValueFieldEx(arrRec, 'ONA_SEM', '');

        DokumentON_VUS.AsBoolean   := GetValueFieldEx(arrRec, 'ON_VUS', false);
        DokumentON_VOENKOM.AsString:= GetValueFieldEx(arrRec, 'ON_VOENKOM', '');
        DokumentONA_VUS.AsBoolean  := GetValueFieldEx(arrRec, 'ONA_VUS', false);
        DokumentONA_VOENKOM.AsString:=GetValueFieldEx(arrRec, 'ONA_VOENKOM', '');

        DokumentON_PODPIS.AsString:=GetValueFieldEx(arrRec, 'ON_PODPIS', '');
        DokumentONA_PODPIS.AsString:=GetValueFieldEx(arrRec, 'ONA_PODPIS', '');

        v := GetValueField(arrRec, 'BRAK_DATE');
        if v = null then DokumentBRAK_Date.AsString := '' else DokumentBRAK_Date.Value := v;
        DokumentBRAK_ZAKL.AsString:=GetValueFieldEx(arrRec, 'BRAK_ZAKL', '');
        DokumentBRAK_NOMER.AsString:=GetValueFieldEx(arrRec, 'BRAK_NOMER', '');
        DokumentBRAK_ID.AsInteger:=GetValueFieldEx(arrRec, 'BRAK_ID', 0);
        lWrON:=false;
        lWrONA:=false;
        nSum:=GetValueFieldEx(arrRec, 'ON_SUM_POSHLINA', 0);
        if nSum>0 then begin
          DokumentON_SUM_POSHLINA.AsFloat := nSum;
          DokumentON_POSHLINA.AsString := GetValueFieldEx(arrRec, 'ON_POSHLINA', '');
          lWrON:=true;
        end;
        nSum:=GetValueFieldEx(arrRec, 'ONA_SUM_POSHLINA', 0);
        if nSum>0 then begin
          DokumentONA_SUM_POSHLINA.AsFloat := nSum;
          DokumentONA_POSHLINA.AsString := GetValueFieldEx(arrRec, 'ONA_POSHLINA', '');
          lWrONA:=true;
        end;
        if lWrON and not lWrONA then begin
          DokumentONA_SUM_POSHLINA.AsString:='';
          DokumentONA_POSHLINA.AsString:='';
        end;
        if not lWrON and lWrONA then begin
          DokumentON_SUM_POSHLINA.AsString:='';
          DokumentON_POSHLINA.AsString:='';
        end;

        CheckSOATOAkt(true,true,true,'',0,'');

        v := GetValueField(arrRec, 'DATEB');
        if v<>null then DokumentDATEZ.Value:=v;

        DokumentTYPE_RAST.AsString:=GetValueFieldEx(arrRec, 'TYPE_RAST', '1'); // по взаимному согласию
        if DokumentTYPE_RAST.AsString='1' then begin  // по взаимному согласию
          WriteDateFieldV(DokumentSUD_DATE, GetValueFieldEx(arrRec,'DATEZ',null));
          DokumentSUD_NAME.AsString:='';
          DokumentSUD_SILA.AsString:='';
        end else begin
          DokumentSUD_NAME.AsString:=GetValueFieldEx(arrRec,'SUD_NAME','');
          WriteDateFieldV(DokumentSUD_DATE, GetValueFieldEx(arrRec,'SUD_DATE',null));
          WriteDateFieldV(DokumentSUD_SILA, GetValueFieldEx(arrRec,'SUD_SILA',null));
        end;

        //----------- для заполнения пункта 18.Отметка -----------------
        sON:=GetValueFieldEx(arrRec,'ON_NATION_DOK','');
        sONA:=GetValueFieldEx(arrRec,'ONA_NATION_DOK','');
        if sONA=''
          then DokumentOTMETKA.AsString:=sON
          else DokumentOTMETKA.AsString:=sON+Chr(13)+Chr(10)+'#'+sONA;
        //----------------------------------------------------------------

        PostDataSet(Dokument);
        QueryExit:=true;

        strDeti := GetValueFieldEx(arrRec,'DETI', '');
        if strDeti<>'' then begin
          StrToArr(strDeti, arr, Chr(13), true);
          sl := TStringList.Create;
          try
            try
              tbDeti.EmptyTable;
              for i:=Low(arr) to High(arr) do begin
                sl.CommaText := arr[i];
                tbDeti.Append;
                for j:=0 to sl.Count-1 do begin
                  tbDeti.Fields[j].AsString := sl.Strings[j];
                end;
                tbDeti.Post;
              end;
            finally
              sl.Free;
            end;
          except

          end;
        end;
      finally
        FRun:=false;
        dbEnableControls(Dokument,lCheck);
        Screen.Cursor := old;
      end;
    end;
    finally
    Opis.DataSet.Filter   := '';
    Opis.DataSet.Filtered := false;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
end;

//-----------------------------------------------------------------------------
procedure TfmRastBrak.CheckSOATOAkt(lOn,lOna:Boolean; lCheckVoenkom:Boolean; strParam:String; nAteID:Integer; strSoato:String);
var
//  SOATO:TSOATO;
  sSoato:String;
  n:Integer;
  ATE:TATE;
begin
  if lOn then begin
    if nAteID>0 then begin
      sSoato:=strSoato;
    end else begin
      ATE:=dmBase.GetATEAkt(Dokument, 'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD', strParam);
      if ATE.ATE_ID>0 then begin
        sSoato:=ATE.Kod;
        nAteID:=ATE.ATE_ID;
      end else begin
        sSoato:='9000000000';
        nAteID:=0;
      end;
    end;
//    SOATO:=dmBase.GetSoatoAkt(Dokument,
//           'ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_RNGOROD;ON_GOROD,ON_B_GOROD',true,FLenSoato);
    EditDataSet(Dokument);
    DokumentON_SOATO.AsString:=sSOATO;
    DokumentON_ATEID.AsInteger:=nAteID;
//    edON_SOATO.Hint:=ATE.FullName; // dmBase.GetNameTerr(DokumentON_SOATO.AsString,false,true);
    FOnCheckSOATO:=false;
    if lCheckVoenkom and FAutoVus then begin  // определение военкомата по СОАТО места жительства
      n:=getVoenkomat(sSOATO, DokumentDATEZ, DokumentON_DATER, true, DokumentON_GRAG.AsInteger);
      if n>0 then begin
        EditDataSet(Dokument);
        DokumentON_VOENKOM.AsInteger:=n;
      end;
    end;
    nAteID:=0;     // !!! что-бы не влияло на женщину, если lOn=true и lOna=true
    sSoato:='';
  end;
  if lOna then begin
    if nAteID>0 then begin
      sSoato:=strSoato;
    end else begin
      ATE:=dmBase.GetATEAkt(Dokument, 'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD', strParam);
      if ATE.ATE_ID>0 then begin
        sSoato:=ATE.Kod;
        nAteID:=ATE.ATE_ID;
      end else begin
        sSoato:='9000000000';
        nAteID:=0;
      end;
    end;
//    SOATO:=dmBase.GetSoatoAkt(Dokument,
//           'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD',true,FLenSoato);
    EditDataSet(Dokument);
    DokumentONA_SOATO.AsString:=sSOATO;
    DokumentONA_ATEID.AsInteger:=nAteID;
//    edONA_SOATO.Hint:=ATE.FullName; // dmBase.GetNameTerr(DokumentONA_SOATO.AsString,false,true);
    FOnaCheckSOATO:=false;
  end;
end;
//----------
procedure TfmRastBrak.lbON_SOATOGetText(Sender: TObject; var Text: String);
var
  ATE:TAte;
begin
//  Text:=dmBase.GetNameTerr(DokumentON_SOATO.AsString,false,true);
{
    if nType>0 then begin
      if ate.obl='-' then lObl:=false;
      if ate.raion='-'  then lRn:=false;
      if ate.ss='-'  then lSS:=false;
      if ate.category=1 then lPost:=true;
    end;
}
//???  DokumentAteID
  ATE.ATE_ID:=0;
  ATE.Kod:=DokumentON_SOATO.AsString;
  ATE.Obl:='-';
  ATE.Category:=1;
  Text:=FullNameFromATE(ATE, 1, ', ');
end;
//----------
procedure TfmRastBrak.lbONA_SOATOGetText(Sender: TObject; var Text: String);
var
  ATE:TAte;
begin
//  Text:=dmBase.GetNameTerr(DokumentONA_SOATO.AsString,false,true);
  ATE.ATE_ID:=0;
  ATE.Kod:=DokumentONA_SOATO.AsString;
  ATE.Obl:='-';
  ATE.Category:=1;
  Text:=FullNameFromATE(ATE, 1, ', ');
end;
//-------------------------------------------------------------------------------------
function TfmRastBrak.CheckDokumentSimple(nType: Integer; lWriteDok:Boolean): Boolean;
var
  strErr,s:String;
//  d:TDateTime;
  n,obr:Integer;
  procedure AddErr(s:String); begin  strErr:=strErr+s+chr(13)+chr(10); end;
begin
  Result:=inherited CheckDokumentSimple(nType,lWriteDok);
  if Result then begin
    strErr := '';
    if DokumentDATEZ.IsNull then AddErr('Заполните дату акта о расторжении брака.');
    if DokumentNOMER.AsString='' then AddErr('Заполните номер акта о расторжении брака.');
    if DokumentTYPE_RAST.AsString='' then AddErr(' Заполните 15 графу.');

    if not FOnlySvid then begin

      if FWriteBeforeGisun then begin
        if (Trim(DokumentON_SVID_NOMER.AsString)<>'') then begin
          s:=CheckFieldDate(DokumentON_SVID_DATE,-1,YearOf(dmBase.GetCurDate),false,'<',DokumentDATEZ);
          if s<>'' then  AddErr('ОН: дата выдачи свидетельства '+s);
        end;
        if (Trim(DokumentONA_SVID_NOMER.AsString)<>'') then begin
          s:=CheckFieldDate(DokumentONA_SVID_DATE,-1,YearOf(dmBase.GetCurDate),false,'<',DokumentDATEZ);
          if s<>'' then  AddErr('ОНA: дата выдачи свидетельства '+s);
        end;
      end;

      if DokumentID.AsInteger=-1 then begin // запись акта еще не сохранялась
        if DokumentBRAK_DATE.IsNull and (DokumentPOVTOR.AsBoolean=false) then begin
          if YearOf(DokumentDATEZ.AsDateTime)>=YearOf(dmBase.GetCurDate)-1
            then AddErr(' Заполните дату актовой записи о браке.');
        end;

        if (DokumentDECL_ID.AsInteger=0) then begin
          n:=0;
          if not DokumentON_DateR.IsNull and not DokumentDATEZ.IsNull then begin
            n:=GetCountYear(DokumentDATEZ.AsDateTime,DokumentON_DateR.AsDateTime);
            if (n<16) or (n>100) then AddErr('Возраст мужчины: '+IntToStr(n));
          end;
          obr:=DokumentON_OBRAZ.AsInteger;
          if (obr>0) and (obr<9) and (n>0) then begin
            if ((n<16) and (obr<5)) or ((n<20) and (obr<2))
              then AddErr('Несоответствие возраст-образование мужчины');
          end;
          n:=0;
          if not DokumentONA_DateR.IsNull and not DokumentDATEZ.IsNull then begin
            n:=GetCountYear(DokumentDATEZ.AsDateTime,DokumentONA_DateR.AsDateTime);
            if (n<16) or (n>100) then AddErr('Возраст женщины: '+IntToStr(n));
          end;
          obr:=DokumentONA_OBRAZ.AsInteger;
          if (obr>0) and (obr<9) and (n>0) then begin
            if ((n<16) and (obr<5)) or ((n<20) and (obr<2))
              then AddErr('Несоответствие возраст-образование женщины');
          end;

          s:=CheckRnBigGorod(DokumentON_M_GOROD, DokumentON_M_RAION, DokumentON_M_RNGOROD);
          if s<>'' then AddErr('Он, '+s);
          s:=CheckRnBigGorod(DokumentONA_M_GOROD, DokumentONA_M_RAION, DokumentONA_M_RNGOROD);
          if s<>'' then AddErr('Она, '+s);

          if (DokumentON_M_GOSUD.AsInteger=MY_GRAG) then begin
            if (DokumentON_SOATO.AsString='') or (Copy(DokumentON_SOATO.AsString,2,6)='000000') or
               ( (Pos( Copy(DokumentON_SOATO.AsString,1,4)+',',GOROD_WITH_RN)>0) and (Copy(DokumentON_SOATO.AsString,5,3)='000'))
              then AddErr('Не определен код территории места жительства мужчины.')
          end;
          if (DokumentONA_M_GOSUD.AsInteger=MY_GRAG)  then begin
            if (DokumentONA_SOATO.AsString='') or (Copy(DokumentONA_SOATO.AsString,2,6)='000000') or
               ( (Pos( Copy(DokumentONA_SOATO.AsString,1,4)+',',GOROD_WITH_RN)>0) and (Copy(DokumentONA_SOATO.AsString,5,3)='000'))
              then AddErr('Не определен код территории места жительства женщины.')
          end;
        end;
      end;
    end else begin
      if (Trim(DokumentSVID_NOMER.AsString)<>'') then begin
        s:=CheckFieldDate(DokumentDATESV,-1,YearOf(dmBase.GetCurDate),false,'<',DokumentDATEZ);
        if s<>'' then  AddErr('Дата выдачи свидетельства '+s);
      end;
    end;

    if not DokumentDATEZ.IsNull then begin
      n:=YearOf(DokumentDATEZ.AsDateTime);
      if (n<GetMinYear) or (n>GetMaxYear)
        then AddErr('Год записи акта: '+IntToStr(n));
    end;

    if not FOnlySvid then begin
      if not DokumentBRAK_DATE.IsNull then begin
        n:=YearOf(DokumentBRAK_DATE.AsDateTime);
        if (n<GetMinYear) or (n>GetMaxYear)
          then AddErr('Год заключения брака: '+IntToStr(n));
        if DokumentBRAK_DATE.AsDateTime>DokumentDATEZ.AsDateTime
          then AddErr('Дата заключения брака больше даты актовой записи.');
      end;
    end;

    FLastError:=strErr;
    if FLastError<>'' then Result:=false;
  end;
end;
//-------------------------------------------------
procedure TfmRastBrak.SetOnlyPovtorSvid(lOnlyPovtor: Boolean; pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;
              lbSvid, lbNomer: TLabel);
var
  i:Integer;
begin
//    SetOnlyPovtorSvid(lOnlyPovtor, pc, tsSvid, [ N_F_1, N_F_edTypeEkz, N_F_cbPovtor, N_F_cbBelorus ], lbSvid,lbNomer);
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
  if lOnlyPovtor then begin

    for i:=0 to TBSubmenuRun.Count-1 do begin
      TBSubmenuRun.Items[i].Visible:=false;
    end;
    TBSubmenuRun.Visible:=true;
    TBItemPrintSvFIO.Visible:=true;

    lbSvid.Visible:=true;
    lbSvid2.Visible:=true;
    lbSvid3.Visible:=true;
    edSVID_SERIA.Visible:=true;
    edSVID_NOMER.Visible:=true;
    edDateSV.Visible:=true;
    TBItemSeekAkt.Visible:=true;
//  TBSubmenuGISUN.Visible:=false;
    TBItemStep2.Caption:='Зарегистрировать свидетельство';
    TBItemArxSpr.Visible:=false;
    TBItemChoiceDeclRast.Visible:=false;
    TBItemSpeedChoice.Visible:=false;
    TBItemChoiceBrak.Visible:=false;

    lbINON.Visible:=true;
    lbDaterON.Visible:=true;
    ENG_edON_IDENTIF.Parent:=tsSvid;
    ENG_edON_IDENTIF.Top:=edON_Name_Sv.Top+27;
    ENG_edON_IDENTIF.Left:=lbINON.Left+lbINON.Width+10;

    edON_DATER.Parent:=tsSvid;
    edON_DATER.Top:=ENG_edON_IDENTIF.Top;
    edON_DATER.Left:=lbDateRON.Left+lbDateRON.Width+10;

    ENG_edON_IDENTIF.TabOrder:=201;

    lbINONA.Visible:=true;
    lbDaterONA.Visible:=true;
    ENG_edONA_IDENTIF.Parent:=tsSvid;
    ENG_edONA_IDENTIF.Top:=edONA_Name_Sv.Top+27;
    ENG_edONA_IDENTIF.Left:=lbINONA.Left+lbINONA.Width+10;

    edONA_DATER.Parent:=tsSvid;
    edONA_DATER.Top:=ENG_edONA_IDENTIF.Top;
    edONA_DATER.Left:=lbDateRONA.Left+lbDateRONA.Width+10;

    ENG_edONA_IDENTIF.TabOrder:=203;

    edON_Familia_Sv.OnUpdateData:=FIOUpdatePadeg;
    edON_Name_Sv.OnUpdateData:=FIOUpdatePadeg;
    edON_Otch_Sv.OnUpdateData:=FIOUpdatePadeg;
    edONA_Familia_Sv.OnUpdateData:=FIOUpdatePadeg;
    edONA_Name_Sv.OnUpdateData:=FIOUpdatePadeg;
    edONA_Otch_Sv.OnUpdateData:=FIOUpdatePadeg;

    edON_FamiliaP_Sv.OnUpdateData:=FIOUpdatePadeg;
    edONA_FamiliaP_Sv.OnUpdateData:=FIOUpdatePadeg;

    BLR_edON_Familia_B_Sv.OnUpdateData:=FIOUpdatePadegBLR;
    BLR_edON_Name_B_Sv.OnUpdateData:=FIOUpdatePadegBLR;
    BLR_edON_Otch_B_Sv.OnUpdateData:=FIOUpdatePadegBLR;
    BLR_edONA_Familia_B_Sv.OnUpdateData:=FIOUpdatePadegBLR;
    BLR_edONA_Name_B_Sv.OnUpdateData:=FIOUpdatePadegBLR;
    BLR_edONA_Otch_B_Sv.OnUpdateData:=FIOUpdatePadegBLR;

//    edON_FamiliaP_Sv.OnUpdateData:=FIOUpdateData;
//    edONA_FamiliaP_Sv.OnUpdateData:=FIOUpdateData;

  end;
end;

procedure TfmRastBrak.edON_M_GOSUDUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if not FRun then begin
    FOnCheckSOATO:=true;
  end;
end;

procedure TfmRastBrak.edONA_M_GOSUDUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if not FRun then begin
    FOnaCheckSOATO:=true;
  end;
end;

procedure TfmRastBrak.edON_SOATOClick(Sender: TObject);
begin
  if IsEmptySOATO(DokumentON_SOATO.AsString) or QuerySoato(FQuerySOATO)
    then CheckSOATOAkt(true,false,true,'{CHOICE}',0,'');
end;

procedure TfmRastBrak.edONA_SOATOClick(Sender: TObject);
begin
  if IsEmptySOATO(DokumentONA_SOATO.AsString) or QuerySoato(FQuerySOATO)
    then CheckSOATOAkt(false,true,true,'{CHOICE}',0,'');
end;

procedure TfmRastBrak.AfterCheckAkt_GISUN(nType:Integer);
begin
  dmBase.CheckBelFamily(DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);  // занесем в справочник правильные значения перевода
  dmBase.CheckBelFamily(DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);  // занесем в справочник правильные значения перевода
  EditDataSet(Dokument);
  if (DokumentON_FamiliaP.AsString='')  then begin
    DokumentON_FamiliaP.AsString:=DokumentON_Familia.AsString;
    DokumentON_FamiliaP_B.AsString:=DokumentON_Familia_B.AsString;
  end;
  if (DokumentONA_FamiliaP.AsString='')  then begin
    DokumentONA_FamiliaP.AsString:=DokumentONA_Familia.AsString;
    DokumentONA_FamiliaP_B.AsString:=DokumentONA_Familia_B.AsString;
  end;
  if nType=GISUN_GET then begin  // только если запросили данные из регистра
    CheckValueSvid(true);
  end else begin
    CheckValueSvid(false);
  end;
end;
       
procedure TfmRastBrak.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;
procedure TfmRastBrak.edRukov_SvEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov_Sv);
end;
procedure TfmRastBrak.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

procedure TfmRastBrak.edON_SVID_DATEEnter(Sender: TObject);
begin
  if (edON_SVID_DATE.Value=null) and (edDateZ.Value<>null) and (Trim(edON_Svid_Nomer.Text)<>'')
    then edON_SVID_DATE.Value:=edDateZ.Value;
end;

procedure TfmRastBrak.edONA_SVID_DATEEnter(Sender: TObject);
begin
  if (edONA_SVID_DATE.Value=null) and (edDateZ.Value<>null) and (Trim(edONA_Svid_Nomer.Text)<>'')
    then edONA_SVID_DATE.Value:=edDateZ.Value;
end;

procedure TfmRastBrak.edON_VoenkomEditButtons2Click(Sender: TObject;  var Handled: Boolean);
begin
  WriteVOENKOM(1);
end;

procedure TfmRastBrak.edONA_VOENKOMEditButtons2Click(Sender: TObject;  var Handled: Boolean);
begin
  WriteVOENKOM(2);
end;

procedure TfmRastBrak.ENG_edON_IDENTIFCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin DrawState:=FOnlySvid; end;

procedure TfmRastBrak.edON_DATERCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin DrawState:=FOnlySvid; end;

procedure TfmRastBrak.ENG_edONA_IDENTIFCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin DrawState:=FOnlySvid; end;

procedure TfmRastBrak.edONA_DATERCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin DrawState:=FOnlySvid; end;

//------------------------------------------------------------
function TfmRastBrak.CheckFIO: String;
begin
  Result:=CheckOneFIO('Жених: ',DokumentON_Familia.AsString, DokumentON_Name.AsString, DokumentON_Otch.AsString);
  if Result='' then begin
    Result:=CheckOneFIO('Жених после брака: ',DokumentON_FamiliaP.AsString, '', '');
  end;
  if Result='' then begin
    Result:=CheckOneFIO('Невеста: ',DokumentONA_Familia.AsString, DokumentONA_Name.AsString, DokumentONA_Otch.AsString);
    if Result='' then begin
      Result:=CheckOneFIO('Невеста после брака: ',DokumentONA_FamiliaP.AsString, '', '');
    end;
  end;
end;

procedure TfmRastBrak.TBItemEditMemoClick(Sender: TObject);
begin
  if ActiveControl=edOtmetka then TBItemEditMemo.Tag:=3;
  try
    inherited TBItemEditMemoClick(Sender);
  finally
    TBItemEditMemo.Tag:=0;
  end;
end;

//-----------------------------------------------------------
procedure TfmRastBrak.SetSimpleVvod(sName:String);
var
  lSetEnabled:Boolean;
begin
  inherited;
  lSetEnabled:=(sName='');
  if sName='DEFAULT' then begin
    SetEnabledControls( [
    label7, ENG_edON_IDENTIF, ENG_edONA_IDENTIF,
    label15, edON_WORK, edONA_WORK, label16, edON_OBRAZ, edONA_OBRAZ, label24, edON_SEM, edONA_SEM,
    label36, edON_SumPoshlina, edON_POSHLINA, edONA_SumPoshlina, edONA_POSHLINA,
    label31, edON_DOK_TYPE, edON_DOK_SERIA, edON_DOK_NOMER, edON_DOK_DATE, label69, edON_DOKUMENT,
             edONA_DOK_TYPE, edONA_DOK_SERIA, edONA_DOK_NOMER, edONA_DOK_DATE, label70, edONA_DOKUMENT,
    edSUD_NAME, lbSud_Date, edSUD_DATE, lbSudSila, edSudSila, gbDeti,
    label53, edOnPodpis, edOnaPodpis
    ], lSetEnabled);
//    N_F_edTypeRast
  end;
  if lSetEnabled then begin
    edONA_M_KV.HelpContext:=0;
  end else begin
    edONA_M_KV.HelpContext:=999;

    TbItemVerno.Checked:=true;
    EditDataSet(Dokument);
    DokumentDECL_ID.AsInteger:=1;
    PostDataSet(Dokument);
  end;

end;

procedure TfmRastBrak.N_F_lbON_StatusClick(Sender: TObject);
begin  ClearStatus(DokumentON_STATUS); end;

procedure TfmRastBrak.N_F_lbON_StatusGetText(Sender: TObject; var Text: String);
begin Text:=GetStatus(DokumentON_STATUS); end;

procedure TfmRastBrak.N_F_lbONA_StatusClick(Sender: TObject);
begin ClearStatus(DokumentONA_STATUS); end;

procedure TfmRastBrak.N_F_lbONA_StatusGetText(Sender: TObject;  var Text: String);
begin Text:=GetStatus(DokumentONA_STATUS);  end;

function TfmRastBrak.CheckDateEditGIS: Boolean;
begin   
  Result:=false;
  if Gisun.GetPoleGrn(DokumentPOLE_GRN)=rPost then begin
// номер и дата записи, свидетельство, ИН, фамилия после брака
  if (DokumentNOMER.AsString<>FMainTable.FieldByName('NOMER').AsString) or
     (DokumentDATEZ.AsString<>FMainTable.FieldByName('DATEZ').AsString) or
     (DokumentON_SVID_SERIA.AsString<>FMainTable.FieldByName('ON_SVID_SERIA').AsString) or
     (DokumentON_SVID_NOMER.AsString<>FMainTable.FieldByName('ON_SVID_NOMER').AsString) or
     (DokumentON_SVID_DATE.AsString<>FMainTable.FieldByName('ON_SVID_DATE').AsString) or
     (DokumentONA_SVID_SERIA.AsString<>FMainTable.FieldByName('ONA_SVID_SERIA').AsString) or
     (DokumentONA_SVID_NOMER.AsString<>FMainTable.FieldByName('ONA_SVID_NOMER').AsString) or
     (DokumentONA_SVID_DATE.AsString<>FMainTable.FieldByName('ONA_SVID_DATE').AsString) or
     (ce_fio(DokumentON_FamiliaP.AsString)<>ce_fio(FMainTable.FieldByName('ON_FamiliaP').AsString)) or
     (ce_fio(DokumentON_FamiliaP_B.AsString)<>ce_fio(FMainTable.FieldByName('ON_FamiliaP_B').AsString)) or
     (ce_fio(DokumentONA_FamiliaP.AsString)<>ce_fio(FMainTable.FieldByName('ONA_FamiliaP').AsString)) or
     (ce_fio(DokumentONA_FamiliaP_B.AsString)<>ce_fio(FMainTable.FieldByName('ONA_FamiliaP_B').AsString)) or
     (DokumentON_IDENTIF.AsString<>FMainTable.FieldByName('ON_IDENTIF').AsString) or
     (DokumentONA_IDENTIF.AsString<>FMainTable.FieldByName('ONA_IDENTIF').AsString)
    then Result:=true
    else Result:=false;
  end;
end;
//-----------------------------------------------------------
procedure TfmRastBrak.WriteAfterRegister_GISUN;
begin
  try
    EditDataSet(Dokument);
    DokumentON_B_RESP.AsBoolean:=false;
    Dokument.Post;
    FMainTable.FieldByName('ON_B_RESP').AsBoolean:=false;
  except
  end;
end;

procedure TfmRastBrak.dsDetiDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) and not IsReadDokument then begin
    QueryExit:=true;
  end;
end;

end.
