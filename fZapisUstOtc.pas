unit fZapisUstOtc;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject, uTypes,uProjectAll,
  ExtCtrls, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, dBase, funcPr, dbFunc, uPadegFIO,
  MetaTask, OpisEdit, vchDBCtrls, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  Grids, DBGridEh, Buttons, SelLibFR, ImgList, kbmMemCSVStreamFormat,
  ZipForge;

type
  TfmZapisUstOtc = class(TfmSimpleD)
    pn: TPanel;
    pc: TPageControl;
    tsChild: TTabSheet;
    tsFaser: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    edDateR: TDBDateTimeEditEh;
    edPol: TDBComboBoxEh;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edON_Familia: TDBEditEh;
    edON_DATER: TDBDateTimeEditEh;
    edON_GOSUD: TDBLookupComboboxEh;
    edON_GOROD: TDBEditEh;
    edON_NATION: TDBLookupComboboxEh;
    edON_GRAG: TDBLookupComboboxEh;
    edON_B_OBL: TDBCheckBoxEh;
    Label11: TLabel;
    edONA_Familia: TDBEditEh;
    edONA_Name: TDBEditEh;
    edONA_OTCH: TDBEditEh;
    edONA_DATER: TDBDateTimeEditEh;
    edONA_GOSUD: TDBLookupComboboxEh;
    edONA_GOROD: TDBEditEh;
    edONA_NATION: TDBLookupComboboxEh;
    edONA_GRAG: TDBLookupComboboxEh;
    edONA_B_OBL: TDBCheckBoxEh;
    lbNomer: TLabel;
    edNomer: TDBEditEh;
    Label8: TLabel;
    edDateZ: TDBDateTimeEditEh;
    lbSvid: TLabel;
    edSvid_Nomer: TDBEditEh;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentSVID_NOMER: TStringField;
    DokumentFamiliaDo: TStringField;
    DokumentNameDo: TStringField;
    DokumentOtchDo: TStringField;
    DokumentDateR: TDateField;
    DokumentGOSUD: TIntegerField;
    DokumentOBL: TStringField;
    DokumentRAION: TStringField;
    DokumentGOROD: TStringField;
    DokumentPOL: TStringField;
    DokumentON_ID: TIntegerField;
    DokumentON_Familia: TStringField;
    DokumentON_Name: TStringField;
    DokumentON_Otch: TStringField;
    DokumentON_DateR: TDateField;
    DokumentON_NATION: TIntegerField;
    DokumentON_GRAG: TIntegerField;
    DokumentON_SOATO: TStringField;
    DokumentON_GOSUD: TIntegerField;
    DokumentON_OBL: TStringField;
    DokumentON_RAION: TStringField;
    DokumentON_GOROD: TStringField;
    DokumentON_GOROD_R: TStringField;
    DokumentON_DOKUMENT: TMemoField;
    DokumentON_B_RESP: TBooleanField;
    DokumentON_B_OBL: TBooleanField;
    DokumentONA_ID: TIntegerField;
    DokumentONA_Familia: TStringField;
    DokumentONA_Name: TStringField;
    DokumentONA_Otch: TStringField;
    DokumentONA_DateR: TDateField;
    DokumentONA_NATION: TIntegerField;
    DokumentONA_GRAG: TIntegerField;
    DokumentONA_SOATO: TStringField;
    DokumentONA_GOSUD: TIntegerField;
    DokumentONA_OBL: TStringField;
    DokumentONA_RAION: TStringField;
    DokumentONA_GOROD: TStringField;
    DokumentONA_GOROD_R: TStringField;
    DokumentONA_DOKUMENT: TMemoField;
    DokumentONA_B_RESP: TBooleanField;
    DokumentONA_B_OBL: TBooleanField;
    DokumentRUKOV: TStringField;
    DokumentB_RESP: TBooleanField;
    DokumentB_OBL: TBooleanField;
    N_F_1: TDBCheckBoxEh;
    DokumentFirst_Ekz: TBooleanField;
    dsNation: TDataSource;
    dsStran: TDataSource;
    edON_GOROD_R: TDBEditEh;
    Label53: TLabel;
    edONA_GOROD_R: TDBEditEh;
    DokumentLICH_ID: TIntegerField;
    DokumentCHILD_ID: TIntegerField;
    TBItemClearLich: TTBItem;
    DokumentSVID_SERIA: TStringField;
    lbSvid2: TLabel;
    Label6: TLabel;
    edFamiliaDo: TDBEditEh;
    Label24: TLabel;
    edNameDo: TDBEditEh;
    Label25: TLabel;
    edOtchDo: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    edFamiliaPosle: TDBEditEh;
    edNamePosle: TDBEditEh;
    edOtchPosle: TDBEditEh;
    gbMestoReg: TGroupBox;
    Label26: TLabel;
    edMestoNomer: TDBEditEh;
    edMesto: TDBEditEh;
    gbMestoRogd: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edGOSUD: TDBLookupComboboxEh;
    edGOROD: TDBEditEh;
    Label22: TLabel;
    edOsnov: TDBComboBoxEh;
    Label37: TLabel;
    DokumentMesto: TStringField;
    DokumentMestoNomer: TStringField;
    DokumentFamiliaPosle: TStringField;
    DokumentNamePosle: TStringField;
    DokumentOtchPosle: TStringField;
    DokumentReshSud: TStringField;
    DokumentOsnov: TIntegerField;
    Label3: TLabel;
    edMestoDate: TDBDateTimeEditEh;
    DokumentMestoDate: TDateField;
    edB_OBL: TDBCheckBoxEh;
    DokumentDateDecl: TDateField;
    lbOsnov: TLabel;
    edDateDecl: TDBDateTimeEditEh;
    DokumentSPEC: TStringField;
    DokumentID_ZAGS: TIntegerField;
    DokumentFamiliaDo_B: TStringField;
    DokumentNameDo_B: TStringField;
    DokumentOtchDo_B: TStringField;
    DokumentFamiliaPosle_B: TStringField;
    DokumentNamePosle_B: TStringField;
    DokumentOtchPosle_B: TStringField;
    DokumentON_Familia_B: TStringField;
    DokumentON_Name_B: TStringField;
    DokumentON_Otch_B: TStringField;
    DokumentONA_Familia_B: TStringField;
    DokumentONA_Name_B: TStringField;
    DokumentONA_Otch_B: TStringField;
    DokumentRukov_B: TStringField;
    lbSvid3: TLabel;
    DokumentDATESV: TDateField;
    edDateSV: TDBDateTimeEditEh;
    DokumentFamilia_P: TStringField;
    DokumentName_P: TStringField;
    DokumentOtch_P: TStringField;
    DokumentFamilia_B_P: TStringField;
    DokumentName_B_P: TStringField;
    DokumentOtch_B_P: TStringField;
    DokumentONA_Familia_P: TStringField;
    DokumentONA_Name_P: TStringField;
    DokumentONA_Otch_P: TStringField;
    DokumentONA_Familia_B_P: TStringField;
    DokumentONA_Name_B_P: TStringField;
    DokumentONA_Otch_B_P: TStringField;
    DokumentZametka: TMemoField;
    TabSheet1: TTabSheet;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    edIzmen: TDBEditEh;
    Label59: TLabel;
    Label23: TLabel;
    edZametka: TDBEditEh;
    edRukov: TDBEditEh;
    edSPEC: TDBEditEh;
    dsGragd: TDataSource;
    DokumentCOPIA: TBooleanField;
    N_F_edCopy: TDBCheckBoxEh;
    Label32: TLabel;
    DokumentIZV_NOMER: TStringField;
    DokumentIZV_DATE: TDateField;
    edIzvNomer: TDBEditEh;
    edIzvDate: TDBDateTimeEditEh;
    cbProvDvig: TDBCheckBoxEh;
    DokumentPROV: TBooleanField;
    DokumentON_WORK: TStringField;
    DokumentON_OBRAZ: TIntegerField;
    DokumentON_CHERN: TSmallintField;
    Button1: TButton;
    edIzvech: TDBEditEh;
    DokumentAdresIzvech: TMemoField;
    edSVID_SERIA: TDBLookupComboboxEh;
    tsPovtor: TTabSheet;
    btAktRogd: TBitBtn;
    btPadeg: TButton;
    DokumentVOENKOM: TIntegerField;
    DokumentON_M_GOSUD: TIntegerField;
    DokumentON_M_OBL: TStringField;
    DokumentON_M_RAION: TStringField;
    DokumentON_M_B_RESP: TBooleanField;
    DokumentON_M_B_OBL: TBooleanField;
    DokumentON_M_B_GOROD: TIntegerField;
    DokumentON_M_GOROD: TStringField;
    DokumentONA_M_B_RESP: TBooleanField;
    DokumentONA_M_GOSUD: TIntegerField;
    DokumentONA_M_B_OBL: TBooleanField;
    DokumentONA_M_OBL: TStringField;
    DokumentONA_M_RAION: TStringField;
    DokumentONA_M_B_GOROD: TIntegerField;
    DokumentONA_M_GOROD: TStringField;
    DokumentIDENTIF: TStringField;
    DokumentON_IDENTIF: TStringField;
    DokumentONA_IDENTIF: TStringField;
    DokumentPOLE_GRN: TSmallintField;
    DokumentON_STATUS: TStringField;
    DokumentONA_STATUS: TStringField;
    DokumentON_DOK_TYPE: TIntegerField;
    DokumentON_DOK_SERIA: TStringField;
    DokumentON_DOK_NOMER: TStringField;
    DokumentON_DOK_ORGAN: TIntegerField;
    DokumentON_DOK_DATE: TDateField;
    DokumentONA_DOK_TYPE: TIntegerField;
    DokumentONA_DOK_SERIA: TStringField;
    DokumentONA_DOK_NOMER: TStringField;
    DokumentONA_DOK_ORGAN: TIntegerField;
    DokumentONA_DOK_DATE: TDateField;
    DokumentTYPEREG: TSmallintField;
    DokumentTYPEMESSAGE: TStringField;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    ImageGISUN: TImage;
    Label27: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    edON_M_B_OBL: TDBCheckBoxEh;
    edON_M_GOSUD: TDBLookupComboboxEh;
    edON_M_B_GOROD: TDBLookupComboboxEh;
    edON_M_GOROD: TDBEditEh;
    edONA_M_B_OBL: TDBCheckBoxEh;
    edONA_M_GOSUD: TDBLookupComboboxEh;
    edONA_M_B_GOROD: TDBLookupComboboxEh;
    edONA_M_GOROD: TDBEditEh;
    Label35: TLabel;
    Label36: TLabel;
    edON_OBRAZ: TDBComboBoxEh;
    edON_WORK: TDBEditEh;
    Label43: TLabel;
    ENG_edON_IDENTIF: TDBEditEh;
    ENG_edONA_IDENTIF: TDBEditEh;
    edON_B_GOROD: TDBLookupComboboxEh;
    edONA_B_GOROD: TDBLookupComboboxEh;
    DokumentSTATUS: TStringField;
    DokumentGRAG: TIntegerField;
    DokumentB_GOROD: TIntegerField;
    DokumentON_B_GOROD: TIntegerField;
    DokumentONA_B_GOROD: TIntegerField;
    edB_GOROD: TDBLookupComboboxEh;
    N_F_cbBelorus: TDBCheckBoxEh;
    lbIDENTIF: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    edReshSud: TDBEditEh;
    DokumentSPEC_B: TStringField;
    Label44: TLabel;
    edDateVst: TDBDateTimeEditEh;
    DokumentDATE_VST: TDateField;
    edON_M_OBL: TDBEditEh;
    edON_M_RAION: TDBEditEh;
    edONA_M_OBL: TDBEditEh;
    edONA_M_RAION: TDBEditEh;
    edON_OBL: TDBEditEh;
    edON_RAION: TDBEditEh;
    edONA_OBL: TDBEditEh;
    edONA_RAION: TDBEditEh;
    edOBL: TDBEditEh;
    edRaion: TDBEditEh;
    DokumentID_AKT_ROGD: TIntegerField;
    DokumentRN_B_GOROD: TStringField;
    DokumentRN_ON_M_B_GOROD: TStringField;
    DokumentRN_ON_B_GOROD: TStringField;
    DokumentRN_ONA_M_B_GOROD: TStringField;
    DokumentRN_ONA_B_GOROD: TStringField;
    DokumentTWO_SVID: TBooleanField;
    DokumentSVID_SERIA2: TStringField;
    DokumentSVID_NOMER2: TStringField;
    DokumentDATESV2: TDateField;
    N_F_cbTwoSvid: TDBCheckBoxEh;
    pnTwoSvid: TPanel;
    edONA_SVID_SERIA: TDBLookupComboboxEh;
    Label46: TLabel;
    edONA_SVID_NOMER: TDBEditEh;
    edONA_DATESV: TDBDateTimeEditEh;
    edON_SVID_SERIA: TDBLookupComboboxEh;
    Label48: TLabel;
    edON_SVID_NOMER: TDBEditEh;
    edON_DATESV: TDBDateTimeEditEh;
    Label28: TLabel;
    Label40: TLabel;
    tsSvid: TTabSheet;
    lbON_Sv: TLabel;
    edON_Familia_Sv: TDBEditEh;
    edON_Name_Sv: TDBEditEh;
    edON_Otch_Sv: TDBEditEh;
    Label76: TLabel;
    BLR_edON_Familia_B_Sv: TDBEditEh;
    BLR_edON_Name_B_Sv: TDBEditEh;
    BLR_edON_Otch_B_Sv: TDBEditEh;
    lbONA_Sv: TLabel;
    edONA_Familia_Sv: TDBEditEh;
    edONA_Name_Sv: TDBEditEh;
    edONA_Otch_Sv: TDBEditEh;
    Label47: TLabel;
    BLR_edONA_Familia_B_Sv: TDBEditEh;
    BLR_edONA_Name_B_Sv: TDBEditEh;
    BLR_edONA_Otch_B_Sv: TDBEditEh;
    Label64: TLabel;
    edRukov_Sv: TDBEditEh;
    BLR_edRukov_Sv_B: TDBEditEh;
    edFamiliaDo_Sv: TDBEditEh;
    edNameDo_Sv: TDBEditEh;
    edOtchDo_Sv: TDBEditEh;
    Label49: TLabel;
    Label50: TLabel;
    BLR_edFamiliaDo_B_Sv: TDBEditEh;
    BLR_edOtchDo_B_Sv: TDBEditEh;
    BLR_edNameDo_B_Sv: TDBEditEh;
    edDateR_Sv: TDBDateTimeEditEh;
    Label51: TLabel;
    Label52: TLabel;
    edPol_Sv: TDBComboBoxEh;
    Label54: TLabel;
    edFamiliaPosle_Sv: TDBEditEh;
    edNamePosle_Sv: TDBEditEh;
    edOtchPosle_Sv: TDBEditEh;
    Label55: TLabel;
    BLR_edFamiliaPosle_B_Sv: TDBEditEh;
    BLR_edNamePosle_B_Sv: TDBEditEh;
    BLR_edOtchPosle_B_Sv: TDBEditEh;
    Label56: TLabel;
    Label57: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    DokumentON_DOM: TStringField;
    DokumentON_KORP: TStringField;
    DokumentON_KV: TStringField;
    DokumentONA_DOM: TStringField;
    DokumentONA_KORP: TStringField;
    DokumentONA_KV: TStringField;
    DokumentON_RNGOROD: TStringField;
    DokumentONA_RNGOROD: TStringField;
    Label31: TLabel;
    edON_DOK_TYPE: TDBComboBoxEh;
    edON_DOK_SERIA: TDBEditEh;
    edON_DOK_NOMER: TDBEditEh;
    Label69: TLabel;
    edON_DOK_DATE: TDBDateTimeEditEh;
    edON_DOKUMENT: TDBEditEh;
    edONA_DOK_TYPE: TDBComboBoxEh;
    edONA_DOK_SERIA: TDBEditEh;
    edONA_DOK_NOMER: TDBEditEh;
    Label70: TLabel;
    edONA_DOK_DATE: TDBDateTimeEditEh;
    edONA_DOKUMENT: TDBEditEh;
    edON_RNGOROD: TDBLookupComboboxEh;
    edONA_RNGOROD: TDBLookupComboboxEh;
    Label65: TLabel;
    edON_DOM: TDBEditEh;
    Label66: TLabel;
    edON_KORP: TDBEditEh;
    Label67: TLabel;
    edON_KV: TDBEditEh;
    Label74: TLabel;
    edONA_DOM: TDBEditEh;
    Label97: TLabel;
    edONA_KORP: TDBEditEh;
    Label98: TLabel;
    edONA_KV: TDBEditEh;
    DokumentON_B_RN: TBooleanField;
    DokumentONA_B_RN: TBooleanField;
    DokumentARX_ADRESAT: TMemoField;
    DokumentONA_FAMILIA_BRAK: TStringField;
    DokumentCHILD: TBooleanField;
    edON_Name: TDBEditEh;
    edON_OTCH: TDBEditEh;
    BLR_edON_Name: TDBEditEh;
    BLR_edON_Otch: TDBEditEh;
    BLR_edONA_Otch: TDBEditEh;
    BLR_edONA_Name: TDBEditEh;
    BLR_edON_Familia: TDBEditEh;
    BLR_edONA_Familia: TDBEditEh;
    BLR_edNameDo: TDBEditEh;
    BLR_edOtchDo: TDBEditEh;
    BLR_edFamiliaPosle: TDBEditEh;
    BLR_edNamePosle: TDBEditEh;
    BLR_edOtchPosle: TDBEditEh;
    BLR_edFamiliaDo: TDBEditEh;
    DokumentONA_FAMILIA_BRAK_B: TStringField;
    DokumentON_VOENKOM: TIntegerField;
    Label89: TLabel;
    edON_Voenkom: TDBLookupComboboxEh;
    N_F_cbPovtor: TDBCheckBoxEh;
    DokumentON_GRAG_ADD: TMemoField;
    DokumentONA_GRAG_ADD: TMemoField;
    TBItemChoiceAktUstOtc: TTBItem;
    DokumentONA_WORK: TStringField;
    DokumentONA_OBRAZ: TIntegerField;
    edONA_WORK: TDBEditEh;
    edONA_OBRAZ: TDBComboBoxEh;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    N_F_lbONA_Status: TvchDBText;
    N_F_lbON_Status: TvchDBText;
    lbBrak: TLabel;
    edBrak: TDBComboBoxEh;
    rb1: TRadioButton;
    rb2: TRadioButton;
    DokumentZBRAK_NOMER: TStringField;
    DokumentZBRAK_DATE: TDateField;
    DokumentZBRAK_ORGAN: TStringField;
    procedure edON_FamiliaEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edONA_FamiliaEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure lbLichGetText(Sender: TObject; var Text: String);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure TBItemClearLichClick(Sender: TObject);
    procedure edFamilaDoEditButtons0Click(Sender: TObject;        var Handled: Boolean);
    procedure edOsnovChange(Sender: TObject);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edFamiliaDoCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
    procedure edRukovEnter(Sender: TObject);
    procedure btPadegClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edIzvechEnter(Sender: TObject);
    procedure edOBLNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
    procedure edRAIONNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edONA_FamiliaEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure btAktRogdClick(Sender: TObject);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure edON_M_OBLNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure edONA_M_OBLNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure edON_M_RAIONNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure edONA_M_RAIONNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure edSPECEnter(Sender: TObject);
    procedure edON_FamiliaEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure N_F_cbTwoSvidClick(Sender: TObject);
    procedure edONA_FamiliaEditButtons2Click(Sender: TObject; var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edRukov_SvEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edON_VoenkomEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edON_VoenkomEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure edON_VoenkomEditButtons2Click(Sender: TObject;      var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons2Click(Sender: TObject;      var Handled: Boolean);
    procedure TBItemChoiceAktUstOtcClick(Sender: TObject);
    procedure TBItemEditMemoClick(Sender: TObject);
    procedure edSPECEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure N_F_lbON_StatusClick(Sender: TObject);
    procedure N_F_lbON_StatusGetText(Sender: TObject; var Text: String);
    procedure N_F_lbONA_StatusClick(Sender: TObject);
    procedure N_F_lbONA_StatusGetText(Sender: TObject; var Text: String);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    FIDAktRogd : Integer;
    procedure CheckValueSvid;
    function BeforeReport:Boolean; override;
    procedure CheckRnGorod;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
    function BeforeEdit: Boolean; override;

    //    function GetNameReport : String; override;
    procedure UpdateActions; override;
    constructor Create(Owner : TComponent); override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure ChoiceMat;
    function CreateSubMenuRun: Boolean; override;
    procedure CheckTwoSvid(lTwo:Boolean);
    procedure CheckControlSvid;
    procedure WriteVOENKOM(nType:Integer; lCheckVozr:Boolean);
    procedure CheckSOATOAkt(lOn,lOna:Boolean; lCheckVoenkom:Boolean; strParam:String; nAteID:Integer; strSoato:String);
    function CheckFIO: String; override;
    procedure AddUserHist; override;
    procedure SetOnlyPovtorSvid(lOnlyPovtor:Boolean;pc:TPageControl; ts:TWinControl; NonVisibleControls : array of TVarRec; lbSvid,lbNomer:TLabel); override;
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;

  end;

  function EditZapisUstOtc(nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;

var
  fmZapisUstOtc: TfmZapisUstOtc;

implementation

uses fMain, {fPadegUstOtc,} fChoiceNasel, fZapisRogd, {$IFDEF ZAGS} fZapisRogdV,{$ENDIF} fShablon, fParamQuest, fHistory;

{$R *.DFM}
{$I Task.inc}

function EditZapisUstOtc(nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;
begin
//  result := true;
  fmZapisUstOtc := TfmZapisUstOtc.Create(nil);
  fmZapisUstOtc.IsCreateForm:=false;
  fmZapisUstOtc.AssignPar(slPar);
  try
    with fmZapisUstOtc do begin
      SetOnlyPovtorSvid(lOnlyPovtor, pc, tsSvid, [ N_F_1, N_F_edTypeEkz, N_F_cbPovtor, N_F_cbBelorus ], lbSvid,lbNomer);
      {$IFDEF ZAGS}
      if not lOnlyPovtor then begin
        TBItemSprAkt.Visible:=true;      // доступность получения справки о записи акта
        TBItemDeclSvid.Visible:=true;
      end;
      {$ENDIF}
    end;
    fmZapisUstOtc.IsReadDokument:=true;
    if nID=-1 then begin
      fmZapisUstOtc.NewDok(true);
      fmZapisUstOtc.SetIDZags;
      fmZapisUstOtc.CheckEnabledNameOrgan(true);
    end else begin
      fmZapisUstOtc.ReadDok( nID );
      fmZapisUstOtc.TBItemZAGS.Visible:=false;
      fmZapisUstOtc.CheckEnabledNameOrgan(false);
    end;
    fmZapisUstOtc.IsReadDokument:=false;

    {$IFDEF GISUN}
      fmZapisUstOtc.CheckAkt_GISUN(0);
//      Gisun.CheckUstOtc(fmZapisUstOtc);
//      fmZapisUstOtc.CheckImageGisun(fmZapisUstOtc.DokumentPOLE_GRN,fmZapisUstOtc.ImageGISUN);
      fmZapisUstOtc.BeforeEditFormGISUN;
    {$ENDIF}
    result := fmZapisUstOtc.EditModal;
  finally
    fmZapisUstOtc.Free;
    fmZapisUstOtc := nil;
  end;
end;

{ TfmZapisUstOtc }

constructor TfmZapisUstOtc.Create(Owner: TComponent);
var
  n:Integer;
begin
  inherited;
  FIDAktRogd := 0;
  FDokZAGS := true;
  TypeObj := dmBase.TypeObj_ZUstOtc;
  FUpdatingObj:=GetUpdatingObj(TypeObj);

  FCheckLookupField:=false;

  {$IFDEF LAIS}
  edRukov_Sv.EditButtons[0].Visible:=false;
  edRukov.EditButtons[0].Visible:=false;
  edSpec.EditButtons[0].Visible:=false;
  {$ENDIF}

  if FPrintSpecSvid then begin
    edRukov_Sv.DataField:='SPEC';
    BLR_edRukov_Sv_B.DataField:='SPEC_B';
  end;
  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';

  SetLength(FArrChoiceRekv,10);

  FArrChoiceRekv[0].nType:=SHABLON_DOKUMENT;
  FArrChoiceRekv[0].FieldName:='ON_DOKUMENT';

  FArrChoiceRekv[1].nType:=SHABLON_DOKUMENT;
  FArrChoiceRekv[1].FieldName:='ONA_DOKUMENT';

  FArrChoiceRekv[2].nType:=SHABLON_NATION;
  FArrChoiceRekv[2].FieldName:='ZAMETKA';

  FArrChoiceRekv[3].nType:=SHABLON_REG;
  FArrChoiceRekv[3].FieldName:='MESTO';

  FArrChoiceRekv[4].nType:=0;
  FArrChoiceRekv[4].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[4].FieldName:='ON_WORK';

  FArrChoiceRekv[5].nType:=0;
  FArrChoiceRekv[5].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[5].FieldName:='ONA_WORK';

  FArrChoiceRekv[6].nType:=0;
  FArrChoiceRekv[6].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[6].FieldName:='ON_GOROD_R';

  FArrChoiceRekv[7].nType:=0;
  FArrChoiceRekv[7].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[7].FieldName:='ONA_GOROD_R';

  FArrChoiceRekv[8].nType:=SHABLON_SUD;
  FArrChoiceRekv[8].FieldName:='RESHSUD';

  FArrChoiceRekv[9].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[9].FieldName:='IZMEN';

  CheckControlSvid;

  AddButton_LoadIdentif(ENG_edIDENTIF);
  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edONA_IDENTIF);

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisUstOtc;
  Dokument.Open;
  dsGragd.DataSet := dmBase.SprGragd;

  FPageControl := pc;
  pc.ActivePageIndex:=0;
//  fmMain.SetCurrentDokument(Dokument);

  edFamiliaDo.OnExit := OnDestroyHint;
  edNameDo.OnExit := OnDestroyHint;
  edOtchDo.OnExit := OnDestroyHint;
  edFamiliaPosle.OnExit := OnDestroyHint;
  edNamePosle.OnExit := OnDestroyHint;
  edOtchPosle.OnExit := OnDestroyHint;

  edON_Familia.OnExit := OnDestroyHint;
  edON_Name.OnExit := OnDestroyHint;
  edON_Otch.OnExit := OnDestroyHint;
  edONA_Familia.OnExit := OnDestroyHint;
  edONA_Name.OnExit := OnDestroyHint;
  edONA_Otch.OnExit := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;
  edSpec.OnExit   := OnDestroyHint;
  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;

  n:=21;
  SetLength(FArrAddProperty,n);
  // в творительном падеже
  SetAddProperty(0, 'FAMILIA_P', '', ftMemo);
  SetAddProperty(1, 'NAME_P', '', ftString);
  SetAddProperty(2, 'OTCH_P', '', ftString);
  SetAddProperty(3, 'FAMILIA_B_P', '', ftMemo);
  SetAddProperty(4, 'NAME_B_P', '', ftString);
  SetAddProperty(5, 'OTCH_B_P', '', ftString);
  SetAddProperty(6, 'ONA_FAMILIA_P', '', ftMemo);
  SetAddProperty(7, 'ONA_NAME_P', '', ftString);
  SetAddProperty(8, 'ONA_OTCH_P', '', ftString);
  SetAddProperty(9, 'ONA_FAMILIA_B_P', '', ftMemo);
  SetAddProperty(10, 'ONA_NAME_B_P', '', ftString);
  SetAddProperty(11, 'ONA_OTCH_B_P', '', ftString);
  SetAddProperty(12, 'ONA_FAMILIA_BRAK', '', ftMemo);
  SetAddProperty(13, 'ONA_FAMILIA_BRAK_B', '', ftMemo);

  SetAddProperty(14, 'OTHER', '', ftMemo);
  SetAddProperty(15, 'IZMEN', '', ftMemo);
  SetAddProperty(16, 'RESHSUD', '', ftMemo);
  SetAddProperty(17, 'ON_GRAG_ADD', '', ftMemo);    // ОН  дополлнительно к гражданству
  SetAddProperty(18, 'ONA_GRAG_ADD', '', ftMemo);   // ОНА дополлнительно к гражданству
  SetAddProperty(19, 'ONA_WORK', '', ftMemo);   // ОНА место работы
  SetAddProperty(20, 'ONA_OBRAZ', '', ftInteger);   // ОНА образование

  {$IFDEF GISUN}
    // типы нас. пунктов в кодах ГИС РН
    SetLength(FArrAddProperty,n+5);
    SetAddProperty(n+0, 'RN_B_GOROD', '', ftString);
    SetAddProperty(n+1, 'RN_ON_M_B_GOROD', '', ftString);
    SetAddProperty(n+2, 'RN_ON_B_GOROD', '', ftString);
    SetAddProperty(n+3, 'RN_ONA_M_B_GOROD', '', ftString);
    SetAddProperty(n+4, 'RN_ONA_B_GOROD', '', ftString);
  {$ENDIF}

  CreateButtonAddGrag(edON_GRAG);
  CreateButtonAddGrag(edONA_GRAG);

//  tsSvid.TabVisible:=GlobalTask.ParamAsBoolean('TS_SVID');
  SetVisibleNomerEkz(pn, edDateSv, N_F_1);

  {$IFDEF ZAGS}
    n:=IL_BRAK;
  {$ELSE}
    n:=IL_CH_MEN;
  {$ENDIF}

//  edON_Familia.EditButtons[0].Glyph.FreeImage;
//  fmMain.ImageList.GetBitmap(n, edON_Familia.EditButtons[0].Glyph);
//  edON_Familia.EditButtons[0].Glyph.FreeImage;
//  fmMain.ImageList.GetBitmap(n, edONA_Familia.EditButtons[0].Glyph);

  edONA_Familia.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;
  edFamiliaDo.EditButtons[0].Glyph   := edON_Familia.EditButtons[0].Glyph;
  fmMain.ImageList.GetBitmap(IL_ROGD, btAktRogd.Glyph );
  edONA_Familia.EditButtons[1].Glyph := btAktRogd.Glyph;


  {$IFDEF ZAGS}
    edFamiliaDO.EditButtons.Items[0].Visible:=false;
    edON_Familia.EditButtons.Items[0].Visible:=false;
    edONA_Familia.EditButtons.Items[0].Visible:=false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
    N_F_edCopy.Visible := false;
    N_F_cbPovtor.Visible := false;
  {$ENDIF}

  SetControlFIOUpdate([
    edFamiliaDo, edNameDo, edOtchDo, edFamiliaDo_Sv, edNameDo_Sv, edOtchDo_Sv, edFamiliaPosle, edNamePosle, edOtchPosle,
    edFamiliaPosle_Sv, edNamePosle_Sv, edOtchPosle_Sv, BLR_edFamiliaDo, BLR_edNameDo, BLR_edOtchDo,
    BLR_edFamiliaDo_B_Sv, BLR_edNameDo_B_Sv, BLR_edOtchDo_B_Sv, BLR_edFamiliaPosle, BLR_edNamePosle, BLR_edOtchPosle,
    edON_Familia, edON_Name, edON_Otch, edONA_Familia, edONA_Name, edONA_Otch,
    BLR_edON_Familia, BLR_edON_Name, BLR_edON_Otch, BLR_edONA_Familia, BLR_edONA_Name, BLR_edONA_Otch,
    edON_Familia_Sv, edON_Name_Sv, edON_Otch_Sv, edONA_Familia_Sv, edONA_Name_Sv, edONA_Otch_Sv,
    BLR_edFamiliaPosle_B_Sv, BLR_edNamePosle_B_Sv, BLR_edOtchPosle_B_Sv, BLR_edON_Familia_B_Sv, BLR_edON_Name_B_Sv, BLR_edON_Otch_B_Sv,
    BLR_edONA_Familia_B_Sv, BLR_edONA_Name_B_Sv, BLR_edONA_Otch_B_Sv
     ],false);

  SetControlCityUpdate([
    edOBL, edRAION, edGOROD,
    edON_M_OBL, edON_M_RAION, edON_M_GOROD,
    edONA_M_OBL, edONA_M_RAION, edONA_M_GOROD,
    edON_OBL, edON_RAION, edON_GOROD,
    edONA_OBL, edONA_RAION, edONA_GOROD
    ]);

  ENG_edOna_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edOn_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edIdentif.OnUpdateData:=IN_UpdateData;

  SetcbBel(N_F_cbBelorus);
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
    {$IFDEF ZAGS}
      TBItemCreateHist.Visible:=true;
    {$ENDIF}
    {$IFDEF LAIS}
      TBItemCreateHist.Visible:=true;
    {$ENDIF}
  end;
  {$IFDEF ZAGS}
    cbProvDvig.Visible := false;
    cbProvDvig.Checked := false;
  {$ELSE}
    if GlobalTask.ParamAsBoolean('AUTO_USTOTC') then begin
      cbProvDvig.Visible := true;
      cbProvDvig.Checked := true;
    end else begin
      cbProvDvig.Visible := false;
      cbProvDvig.Checked := false;
    end;
  //    edCopy.Visible := false;
  {$ENDIF}

  SetPanelPovtor(tsPovtor, N_F_cbPovtor,nil,nil);

  SetLength(FArrCheckField,8);
  WriteToArrCheck(0,  1, false, 'OBL');
  WriteToArrCheck(1,  2, false, 'RAION');
  WriteToArrCheck(2,  1, false, 'ON_OBL');
  WriteToArrCheck(3,  2, false, 'ON_RAION');
  WriteToArrCheck(4,  1, false, 'ONA_OBL');
  WriteToArrCheck(5,  2, false, 'ONA_RAION');
//  WriteToArrCheck(6,  4, false, 'ON_RNGOROD');
//  WriteToArrCheck(7,  4, false, 'ONA_RNGOROD');

  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := IsActiveGISUN;
    lbIDENTIF.Visible:=IsActiveGISUN;
    ENG_edIDENTIF.Visible:=IsActiveGISUN;
    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN;
    AfterCreateFormGISUN;
  {$ELSE}
    ENG_edIDENTIF.Visible:=false;
    lbIDENTIF.Visible:=false;
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
  TBItemHistCorr.Visible:=FUpdatingObj;

  Globaltask.SetLastValueAsString('CUR_SVID', '1');  // печать даты свидетельсва DATESV

  edON_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;  // utypes.pas
  edONA_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;
  edON_DOK_TYPE.DropDownBox.Width:=TYPEDOK_Width;  // utypes.pas
  edONA_DOK_TYPE.DropDownBox.Width:=TYPEDOK_Width;

end;
{
function TfmZapisUstOtc.GetNameReport: String;
begin
  Result := '&Запись акта об отцовстве.frf';
end;
}
//--------------------------------------------------------------------------------
function TfmZapisUstOtc.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_ZUstOtc); //
end;

//--------------------------------------------------------------------------------
{
procedure TfmZapisUstOtc.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
function TfmZapisUstOtc.NewDok( lAppend : Boolean ): Boolean;
var
  n:Integer;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentCHILD.AsBoolean := true;
  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  DokumentFIRST_EKZ.AsBoolean:=true;
  DokumentPOL.AsString:='М';

  DokumentB_RESP.AsBoolean:=false;  // после отправки в ГИС РН корректировались определенные реквизиты

  DokumentB_OBL.AsBoolean:=true;
  DokumentON_B_OBL.AsBoolean:=true;
  DokumentONA_B_OBL.AsBoolean:=true;
  DokumentON_M_B_OBL.AsBoolean:=true;
  DokumentONA_M_B_OBL.AsBoolean:=true;

  DokumentTWO_SVID.AsBoolean:=false;
  DokumentTYPEREG.AsString:='';

  n:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentB_GOROD.AsInteger:=n;
  DokumentON_B_GOROD.AsInteger:=n;
  DokumentONA_B_GOROD.AsInteger:=n;
  DokumentON_M_B_GOROD.AsInteger:=n;
  DokumentONA_M_B_GOROD.AsInteger:=n;

  DokumentOsnov.AsString:='1';  // заявление родителей
  DokumentPROV.AsBoolean := false;
  N_F_cbBelorus.Checked:=False;

  CheckTwoSvid(DokumentTWO_SVID.AsBoolean);

  if lAppend then begin
    CheckRnGorod;
  end;

  inherited NewDok(lAppend);
  QueryExit:=false;
  Result := true;
end;

//--------------------------------------------------------------------------------
function TfmZapisUstOtc.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
//  arr : TArrStrings;
//  sl  : TStringList;
begin
  Result := inherited ReadDok(nID);
  if not dmBase.tbZapisUstOtc.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbZapisUstOtc.FieldCount-1 do begin
    strField := dmBase.tbZapisUstOtc.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.tbZapisUstOtc.Fields[i]);
    end;
  end;
  SetIDZags;

  FIDAktRogd:=DokumentID_AKT_ROGD.AsInteger;

  ReadDopProperty(dmBase.TypeObj_ZUstOtc, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));

  DokumentCOPIA.AsBoolean:=false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentTWO_SVID.IsNull then DokumentTWO_SVID.AsBoolean:=false;

  if DokumentDATESV.IsNull and not DokumentDATEZ.IsNull
    then DokumentDATESV.AsDateTime:=DokumentDATEZ.AsDateTime;

  if DokumentIDENTIF.AsString='' then begin // ИН ребенка пустой
    DokumentCHILD.AsBoolean:=false;   // при запросе из ГИС РН не запрашивать данные по ребенку
  end else begin
    DokumentCHILD.AsBoolean:=true;
  end;

  //----------------------------------------------------------
  DokumentON_RNGOROD.AsString  := '';
  DokumentONA_RNGOROD.AsString := '';
  if DokumentON_B_RN.IsNull then DokumentON_B_RN.AsBoolean:=true;
  if not DokumentON_B_RN.AsBoolean then begin
    DokumentON_RNGOROD.AsString := DokumentON_RAION.AsString;
    DokumentON_RAION.AsString   := '';
  end;
  if DokumentONA_B_RN.IsNull then DokumentONA_B_RN.AsBoolean:=true;
  if not DokumentONA_B_RN.AsBoolean then begin
    DokumentONA_RNGOROD.AsString := DokumentONA_RAION.AsString;
    DokumentONA_RAION.AsString   := '';
  end;
  //----------------------------------------------------------

  CheckCaretDokument(DokumentON_DOK_NOMER,DokumentON_DOKUMENT);
  CheckCaretDokument(DokumentONA_DOK_NOMER,DokumentONA_DOKUMENT);

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  edON_GRAG.Hint:=DokumentON_GRAG_ADD.AsString;
  edONA_GRAG.Hint:=DokumentONA_GRAG_ADD.AsString;

  CheckRnGorod;

  AdditiveReadDok;

  Dokument.Post;
  ReadHistory(nID, dmBase.TypeObj_ZUstOtc);

  CheckTwoSvid(DokumentTWO_SVID.AsBoolean);

end;

//--------------------------------------------------------------------------------
function TfmZapisUstOtc.BeforeEdit: Boolean;
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
  SetMRUList(edGOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edON_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edON_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edONA_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edONA_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_M_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_M_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_M_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_M_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_RAION,n,2,true,false,false,FAddButtonMRUList);
end;

//--------------------------------------------------------------------------------
function TfmZapisUstOtc.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  sSeria,sNomer,sRukov,sRukovB,sSpec,sSpecB,strField, strErr : String;
  vKeyValues : Variant;
  {$IFNDEF ZAGS}
  dLastSost : TDateTime;
  {$ENDIF}
  dDate : TDateTime;
  nIdChild : Integer;
  s : String;
  lFullWrite : Boolean;
  arr:TArrStrings;
  procedure AddErr(s:String); begin  strErr:=strErr+s+chr(13)+chr(10); end;
begin
  Dokument.CheckBrowseMode;
  AdditiveBeforeWriteDok;

  EditDataSet(Dokument);
  WriteOtherData(Dokument, 'OTHER', 'RUKOV_D;SPEC_D;ZBRAK_NOMER;ZBRAK_DATE;ZBRAK_ORGAN');
  PostDataSet(Dokument);
  
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
    AddErr(' Заполните дату записи акта.');
  end else if DokumentNOMER.AsString='' then begin
    AddErr(' Заполните номер записи акта. ');
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства об установлении отцовства. ';
  end else if DokumentDATER.AsString='' then begin
    AddErr(' Заполните дату рождения. ');
  end else if not FOnlySvid and (DokumentPOL.AsString='') then begin
    AddErr(' Заполните пол. ');
  end else if (DokumentFAMILIAPosle.AsString='') or (DokumentNAMEPosle.AsString='') then begin
    AddErr(' Заполните Фамилию, Имя после установления отцовства. ');
  end;
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
            AddErr('Запись акта не найдена.');
          end;
        end;
        if strErr='' then begin
          // сохраним текущие значения для первичного свидетельства
          sSeria:=FMainTable.FieldByName('SVID_SERIA').AsString;
          sNomer:=FMainTable.FieldByName('SVID_NOMER').AsString;
          dDate:=FMainTable.FieldByName('DATESV').AsDateTime;
          sRukov:=FMainTable.FieldByName('RUKOV').AsString;
          sRukovB:=FMainTable.FieldByName('RUKOV_B').AsString;
          sSpec:=FMainTable.FieldByName('SPEC').AsString;
          sSpecB:=FMainTable.FieldByName('SPEC_B').AsString;
        end;
      end;
    end else begin
      Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZUstOtc, DokumentID_ZAGS.AsInteger,
                                   DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime);
      if not Result then exit;
    end;
  end;
//  if strErr=''
//    then strErr := CheckSvid(dmBase.TypeObj_ZUstOtc, 'DATESV','SVID_SERIA','SVID_NOMER', strBookMark);
  if strErr<>'' then begin
    PutError(strErr, self);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbZapisUstOtc.Append;
    dmBase.tbZapisUstOtc.Post;
    nID := dmBase.tbZapisUstOtc.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.tbZapisUstOtc.Locate('ID', nID, []) then begin
      Result := false;
    end;

    if Result and not lFullWrite and FOnlySvid then begin   // запись нашли и пишем только свидетельство
       with FMainTable do begin
         if not MySameText(FieldByName('FAMILIAPOSLE').AsString,DokumentFamiliaPOSLE.AsString) or
            not MySameText(FieldByName('NAMEPOSLE').AsString,DokumentNamePOSLE.AsString) or
            not MySameText(FieldByName('OTCHPOSLE').AsString,DokumentOtchPOSLE.AsString) or
            (FieldByName('DATER').AsVariant<>DokumentDateR.AsVariant) then begin
            PutError('Данные о ребенке не совпадают с данными из актовой записи.'#13+
                CreateFIO(FMainTable,'POSLE;E')+' '+DatePropis(FieldByName('DATER').AsDateTime,3)+chr(13)+
                CreateFIO(Dokument,'POSLE;E')+ ' '+DatePropis(DokumentDateR.AsDateTime,3),self);
            Result:=false;
         end;
         if Result and (FieldByName('IDENTIF').AsString<>'') and
            not MySameText(FieldByName('IDENTIF').AsString,DokumentIDENTIF.AsString) then begin
            PutError('Идентификационный номер ребенка не совпадает с данными из актовой записи.'#13+
              '"'+FieldByName('IDENTIF').AsString+'"'+chr(13)+'"'+DokumentIDENTIF.AsString+'"',self);
            Result:=false;
         end;
       end;
    end;

  end;
  if Result then  begin
    FCheckEditGIS:=CheckDateEditGIS;  // функция д.б. своя для каждого типа документа !!!
    
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    if DokumentTWO_SVID.AsBoolean=false then begin
       DokumentSVID_SERIA2.AsString:='';
       DokumentSVID_NOMER2.AsString:='';
       DokumentDATESV2.AsString:='';
    end;
    Dokument.Post;
//    AddEditSvid(strBookMark);
    dmBase.tbZapisUstOtc.Edit;

    if lFullWrite then begin
      for i:=1 to dmBase.tbZapisUstOtc.FieldCount-1 do begin
        strField := dmBase.tbZapisUstOtc.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          dmBase.tbZapisUstOtc.Fields[i].Value := fld.Value;
        end;
      end;

      WriteDopProperty(dmBase.TypeObj_ZUstOtc, DokumentID.AsInteger,
                        STOD('1899-12-30',tdAds));

      WriteHistory(nID, dmBase.TypeObj_ZUstOtc);

      if DokumentON_RNGOROD.AsString<>'' then begin
        dmBase.tbZapisUstOtc.FieldByName('ON_B_RN').AsBoolean := false;
        dmBase.tbZapisUstOtc.FieldByName('ON_RAION').AsString := DokumentON_RNGOROD.AsString;
      end else begin
        dmBase.tbZapisUstOtc.FieldByName('ON_B_RN').AsBoolean := true;
      end;
      if DokumentONA_RNGOROD.AsString<>'' then begin
        dmBase.tbZapisUstOtc.FieldByName('ONA_B_RN').AsBoolean := false;
        dmBase.tbZapisUstOtc.FieldByName('ONA_RAION').AsString := DokumentONA_RNGOROD.AsString;
      end else begin
        dmBase.tbZapisUstOtc.FieldByName('ONA_B_RN').AsBoolean := true;
      end;

      {$IFDEF GISUN}
        WriteMessageID;
      {$ENDIF}

      if not FPrintSpecSvid
        then dmBase.tbZapisUstOtc.FieldByName('SPEC_B').AsString:='';
    end;

    WriteDateIzm;
    WriteForAllDok_BeforePost;
    if dmBase.tbZapisUstOtc.FieldByName('B_RESP').AsBoolean=false
      then dmBase.tbZapisUstOtc.FieldByName('B_RESP').AsBoolean:=FCheckEditGIS;
    dmBase.tbZapisUstOtc.Post;

    AdditiveWriteDok;

    if FOnlySvid then begin   // вернем старые данные о первичном свидетельстве, если они были
      FMainTable.Edit;
      FMainTable.FieldByName('SVID_SERIA').AsString:=sSeria;
      FMainTable.FieldByName('SVID_NOMER').AsString:=sNomer;
      FMainTable.FieldByName('RUKOV').AsString:=sRUKOV;
      FMainTable.FieldByName('RUKOV_B').AsString:=sRUKOVB;
      FMainTable.FieldByName('SPEC').AsString:=sSpec;
      FMainTable.FieldByName('SPEC_B').AsString:=sSpecB;
      if dDate=0
        then FMainTable.FieldByName('DATESV').AsString:=''
        else FMainTable.FieldByName('DATESV').AsdateTime:=dDate;
      FMainTable.Post;
    end;

//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);
    QueryExit:=false;
    Result := true;
    if FCheckBelName and FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentFamiliaDo.AsString, DokumentFamiliaDo_B.AsString);
      dmBase.CheckBelFamily( DokumentFamiliaPosle.AsString, DokumentFamiliaPosle_B.AsString);
    end;
    {$IFNDEF ZAGS}
    if cbProvDvig.Visible and cbProvDvig.Checked then begin
    dLastSost := dmBase.LastDateSost;
    if (DokumentLICH_ID.AsString<>'') and
       ((dLastSost = dmBase.GetDateCurrentSost) or
        (DokumentDATEZ.AsDateTime >= dLastSost)) then begin
      vKeyValues := VarArrayCreate( [0, 1], varOleStr );
      vKeyValues[0] := dmBase.GetDateCurrentSost;
      vKeyValues[1] := 0;
      // у ребенка должен быть ID
      if DokumentCHILD_ID.AsString <> '' then begin
        nIdChild := DokumentCHILD_ID.AsInteger;
        vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, nIdChild);
        if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin

          EditDataSet(Dokument);
          DokumentPROV.AsBoolean := true;
          PostDataSet(Dokument);

          dmBase.tbMens.Edit;
          with dmBase.tbMens do begin
            FieldByName('FAMILIA').AsString  := DokumentFamiliaPosle.AsString;
            FieldByName('NAME').AsString     := DokumentNamePosle.AsString;
            FieldByName('OTCH').AsString     := DokumentOtchPosle.AsString;
            Post;
          end;
          if DokumentPOL.AsString='М' then s := 'откорректирован' else s := 'откорректирована';
          ShowMessageCont(DokumentFamiliaPosle.AsString+' '+DokumentNamePosle.AsString+' '+
                      DokumentOtchPosle.AsString+#13+' '+s+' в базе населения.',self);
        end;
      end;
    end;
    end;
    {$ENDIF}
    if Result then QueryExit:=false;
  end;
  if Result then FlushBuffers;

end;

//--------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edFamilaDoEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  strNomer : String;
  d : TDateTime;
  AktRogd : TAktRogd;
begin
  if ChoiceMen( edFamiliaDo, Trim(edFAMILIADO.Text), '', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      v := GetValueField(arrRec, 'ID');

      // место рождения
      if dmBase.tbMensAdd.Locate('ID',v,[]) then begin
        WriteField( DokumentGOSUD, dmBase.tbMensAdd.FieldByName('MR_GOSUD') );
        WriteField( DokumentB_OBL, dmBase.tbMensAdd.FieldByName('MR_B_OBL') );
        WriteField( DokumentOBL, dmBase.tbMensAdd.FieldByName('MR_OBL') );
        WriteField( DokumentRAION, dmBase.tbMensAdd.FieldByName('MR_RAION') );
        WriteField( DokumentB_GOROD, dmBase.tbMensAdd.FieldByName('MR_B_GOROD') );
        WriteField( DokumentGOROD, dmBase.tbMensAdd.FieldByName('MR_GOROD') );
      end;

      DokumentCHILD_ID.AsInteger := v;
      v := GetValueField(arrRec, 'FAMILIA');
      if v = null then DokumentFAMILIADo.AsString := ''
                  else DokumentFAMILIADo.AsString := v;
      v := GetValueField(arrRec, 'NAME');
      if v = null then DokumentNAMEDo.AsString := ''
                  else DokumentNAMEDo.AsString := v;
      v := GetValueField(arrRec, 'OTCH');
      if v = null then DokumentOTCHDo.AsString := ''
                  else DokumentOTCHDo.AsString := v;
      v := GetValueField(arrRec, 'DATER');
      if v = null then DokumentDateR.AsString := ''
                  else DokumentDateR.Value    := v;
      v := GetValueField(arrRec, 'POL');
      if v = null then DokumentPOL.AsString := ''
                  else DokumentPOL.Value    := v;
      // попытаться найти актовую запись
      v := GetValueField(arrRec, 'AKT_ROGD_NOMER');
      if v <> null then begin
        strNomer := VarToStr(v);
        v := GetValueField(arrRec, 'AKT_ROGD_DATE');
        if v <> null then begin
          d := v;
          DokumentMestoNomer.AsString  := strNomer;
          DokumentMestoDate.AsDateTime := d;
          AktRogd := dmBase.AktRogdMen(strNomer, d);
          if AktRogd.Nomer<>'' then begin
            DokumentMesto.AsString := AktRogd.Mesto;
            DokumentGOSUD.AsString := AktRogd.Gosud;
            DokumentOBL.AsString   := AktRogd.Obl;
            DokumentRAION.AsString := AktRogd.Raion;
            DokumentGOROD.AsString := AktRogd.Gorod;
            DokumentB_OBL.AsBoolean := AktRogd.B_OBL;
            DokumentB_GOROD.Asstring := AktRogd.B_GOROD;
            DokumentONA_Familia.AsString := AktRogd.ONA_Familia;
            DokumentONA_Name.AsString := AktRogd.ONA_Name;
            DokumentONA_Otch.AsString := AktRogd.ONA_Otch;

            DokumentONA_SOATO.AsString := AktRogd.ONA_SOATO;
            DokumentONA_GOSUD.AsString := AktRogd.ONA_Gosud;
            DokumentONA_Obl.AsString := AktRogd.ONA_Obl;
            DokumentONA_RAION.AsString := AktRogd.ONA_Raion;
            DokumentONA_GOROD.AsString := AktRogd.ONA_Gorod;
            DokumentONA_GOROD_R.AsString := AktRogd.ONA_Gorod_R;
            DokumentONA_DATER.AsString := AktRogd.ONA_DateR;
            DokumentONA_NATION.AsString := AktRogd.ONA_Nation;
//            DokumentONA_OBRAZ.AsString := AktRogd.ONA_Obraz;
            DokumentONA_GRAG.AsString := AktRogd.ONA_Grag;
            DokumentONA_DOKUMENT.AsString := AktRogd.ONA_Dokument;
            DokumentONA_B_OBL.AsBoolean := AktRogd.ONA_B_OBL;
            DokumentONA_B_GOROD.AsString := AktRogd.ONA_B_Gorod;
          end;
        end;
      end;

      PostDataSet(Dokument);
      Screen.Cursor := old;
  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edON_FamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  nID : Integer;
  adr : TAdres;
  old : TCursor;
  strName : String;
  p : Tpassport;
begin
  if ChoiceMen( edON_Familia, Trim(edON_FAMILIA.Text), 'POL='+QStr('М'), arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      v := GetValueField(arrRec, 'ID');
      DokumentON_ID.AsInteger := v;           

      // место рождения
      if dmBase.tbMensAdd.Locate('ID',v,[]) then begin
        WriteField( DokumentON_M_GOSUD, dmBase.tbMensAdd.FieldByName('MR_GOSUD') );
        WriteField( DokumentON_M_B_OBL, dmBase.tbMensAdd.FieldByName('MR_B_OBL') );
        WriteField( DokumentON_M_OBL, dmBase.tbMensAdd.FieldByName('MR_OBL') );
        WriteField( DokumentON_M_RAION, dmBase.tbMensAdd.FieldByName('MR_RAION') );
        WriteField( DokumentON_M_B_GOROD, dmBase.tbMensAdd.FieldByName('MR_B_GOROD') );
        WriteField( DokumentON_M_GOROD, dmBase.tbMensAdd.FieldByName('MR_GOROD') );
      end;

      v := GetValueField(arrRec, 'FAMILIA');
      if v = null then DokumentON_FAMILIA.AsString := ''
                  else DokumentON_FAMILIA.AsString := v;
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
      nID := DokumentON_ID.AsInteger;
      p := dmBase.GetRecPasport(nID, arrRec);
      DokumentON_IDENTIF.AsString := p.LichNomer;
      if p.Nomer <> '' then begin
        DokumentON_DOK_TYPE.AsInteger := p.UdostKod;
        DokumentON_DOK_SERIA.AsString := p.Seria;
        DokumentON_DOK_NOMER.AsString := p.Nomer;
        DokumentON_DOKUMENT.AsString  := p.Organ;
        DokumentON_DOK_DATE.AsDateTime:= p.Date;
      end;
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      if adr.PunktN<>''    then DokumentON_GOROD.AsString := adr.PunktN;
      if adr.PunktTK>0 then DokumentON_B_GOROD.AsInteger:= adr.PunktTK;
//      if adr.UlicaDom <> '' then DokumentON_GOROD_R.AsString := adr.UlicaDom;
      if adr.Ulica<>'' then DokumentON_GOROD_R.AsString := adr.Ulica;
      if adr.NDom<>'' then DokumentON_DOM.AsString := adr.NDom;
      if adr.Korp<>'' then DokumentON_KORP.AsString := adr.Korp;
      if adr.Kv<>'' then DokumentON_KV.AsString := adr.Kv;
//      DokumentON_OTMETKA.AsString := dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'OTM_NATION', ftMemo);
      PostDataSet(Dokument);
      Screen.Cursor := old;
  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edONA_FamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  adr : TAdres;
  nID : Integer;
  old : TCursor;
  strName : String;
  p : TPassport;
begin
  if ChoiceMen( edONA_Familia, Trim(edONA_FAMILIA.Text), 'POL='+QStr('Ж'), arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      v := GetValueField(arrRec, 'ID');
      DokumentONA_ID.AsInteger := v;

      // место рождения
      if dmBase.tbMensAdd.Locate('ID',v,[]) then begin
        WriteField( DokumentONA_M_GOSUD, dmBase.tbMensAdd.FieldByName('MR_GOSUD') );
        WriteField( DokumentONA_M_B_OBL, dmBase.tbMensAdd.FieldByName('MR_B_OBL') );
        WriteField( DokumentONA_M_OBL, dmBase.tbMensAdd.FieldByName('MR_OBL') );
        WriteField( DokumentONA_M_RAION, dmBase.tbMensAdd.FieldByName('MR_RAION') );
        WriteField( DokumentONA_M_B_GOROD, dmBase.tbMensAdd.FieldByName('MR_B_GOROD') );
        WriteField( DokumentONA_M_GOROD, dmBase.tbMensAdd.FieldByName('MR_GOROD') );
      end;

      v := GetValueField(arrRec, 'FAMILIA');
      if v = null then DokumentONA_FAMILIA.AsString := ''
                  else DokumentONA_FAMILIA.AsString := v;
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
      if v = null then DokumentONA_NATION.AsInteger:= 0
                  else DokumentONA_NATION.Value    := v;
      v := GetValueField(arrRec, 'CITIZEN');
      if v = null then DokumentONA_GRAG.AsInteger:= 0
                  else DokumentONA_GRAG.Value    := v;
      v := GetValueField(arrRec, 'OBRAZ');
      nID := DokumentONA_ID.AsInteger;
      p := dmBase.GetRecPasport(nID, arrRec);
      DokumentONA_IDENTIF.AsString := p.LichNomer;
      if p.Nomer <> '' then begin
        DokumentONA_DOK_TYPE.AsInteger := p.UdostKod;
        DokumentONA_DOK_SERIA.AsString := p.Seria;
        DokumentONA_DOK_NOMER.AsString := p.Nomer;
        DokumentONA_DOKUMENT.AsString  := p.Organ;
        DokumentONA_DOK_DATE.AsDateTime:= p.Date;
      end;
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      if adr.PunktN <> '' then DokumentONA_GOROD.AsString := adr.PunktN;
      if adr.PunktTK>0 then DokumentONA_B_GOROD.AsInteger:= adr.PunktTK;

//      if adr.UlicaDom <> '' then DokumentONA_GOROD_R.AsString := adr.UlicaDom;
      if adr.Ulica<>'' then DokumentONA_GOROD_R.AsString := adr.Ulica;
      if adr.NDom<>'' then DokumentONA_DOM.AsString := adr.NDom;
      if adr.Korp<>'' then DokumentONa_KORP.AsString := adr.Korp;
      if adr.Kv<>'' then DokumentONA_KV.AsString := adr.Kv;

//      DokumentONA_OTMETKA.AsString := dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'OTM_NATION', ftMemo);
      PostDataSet(Dokument);
      Screen.Cursor := old;
  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edON_FamiliaEditButtons1Click(Sender: TObject;  var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  sOnaFamiliaBrak : String;
  f : TfmSimpleD;
  lCheck : Boolean;
  SOATO:TSOATO;
  ParamFlt:TParamFieldFlt;
begin
 // if ExitAsGISUN(true) then exit;

  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_BRAK');
  if Opis<>nil then begin

    ParamFlt:=CreateParamFlt(edON_Familia.Text,'ON_FAMILIAP');
    if ParamFlt<>nil then Opis.AutoFilter:=true;

    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edON_Familia, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      lCheck:=dbDisableControls(Dokument);
      FRun:=true;
      Screen.Cursor := crHourGlass;
      try
        QueryExit:=true;
        EditDataSet(Dokument);
        DokumentZBRAK_NOMER.AsString:=GetValueFieldEx(arrRec, 'NOMER','');
        WriteDateFieldV(DokumentZBRAK_DATE, GetValueFieldEx(arrRec, 'DATEZ', 0));
        DokumentZBRAK_ORGAN.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',-1), '', '', GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

        sOnaFamiliaBrak:=GetValueFieldEx(arrRec, 'ONA_FAMILIAP','');   // фамилия мамы после брака
        DokumentONA_FAMILIA_BRAK.AsString:=sOnaFamiliaBrak;
        DokumentONA_FAMILIA_BRAK_B.AsString:=GetValueFieldEx(arrRec, 'ONA_FAMILIAP_B','');

        DokumentON_IDENTIF.AsString:=GetValueFieldEx(arrRec, 'ON_IDENTIF','');

        DokumentON_FAMILIA.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIAP','');
        DokumentON_NAME.AsString:=GetValueFieldEx(arrRec, 'ON_NAME','');
        DokumentON_OTCH.AsString:=GetValueFieldEx(arrRec, 'ON_OTCH','');

        DokumentON_FAMILIA_B.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIAP_B','');
        DokumentON_NAME_B.AsString:=GetValueFieldEx(arrRec, 'ON_NAME_B','');
        DokumentON_OTCH_B.AsString:=GetValueFieldEx(arrRec, 'ON_OTCH_B','');

        DokumentON_DateR.Value:=GetValueFieldEx(arrRec, 'ON_DATER',0);

        DokumentON_NATION.AsInteger:=GetValueFieldEx(arrRec, 'ON_NATION',0);
        DokumentON_GRAG.AsInteger:=GetValueFieldEx(arrRec, 'ON_GRAG',0);
        DokumentON_OBRAZ.AsInteger:=GetValueFieldEx(arrRec, 'ON_OBRAZ',0);

        DokumentON_DOK_TYPE.AsString := GetValueFieldEx(arrRec, 'ON_DOK_TYPE','888');
        DokumentON_DOK_SERIA.AsString:= GetValueFieldEx(arrRec, 'ON_DOK_SERIA','');
        DokumentON_DOK_NOMER.AsString:= GetValueFieldEx(arrRec, 'ON_DOK_NOMER','');
        DokumentON_DOK_ORGAN.AsString:= GetValueFieldEx(arrRec, 'ON_DOK_ORGAN','');
        v := GetValueField(arrRec, 'ON_DOK_DATE');
        if v = null then DokumentON_DOK_DATE.AsString := ''
                    else DokumentON_DOK_DATE.Value    := v;
        DokumentON_DOKUMENT.AsString := GetValueFieldEx(arrRec, 'ON_DOKUMENT','');
        DokumentON_IDENTIF.AsString := GetValueFieldEx(arrRec, 'ON_IDENTIF','');

        //  в браках: место рождения ON_...   в уст.отцовства: место рождения ON_M_...
        DokumentON_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_GOSUD','');
        v := GetValueField(arrRec, 'ON_B_OBL');
        if v = null then DokumentON_M_B_OBL.AsString := ''
                    else DokumentON_M_B_OBL.Value    := v;
        v := GetValueFieldEx(arrRec, 'ON_OBL','');
        if v = null then DokumentON_M_OBL.AsString := ''
                    else DokumentON_M_OBL.Value    := v;
        DokumentON_M_RAION.AsString := GetValueFieldEx(arrRec, 'ON_RAION','');
        DokumentON_M_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_B_GOROD','');
        DokumentON_M_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_GOROD','');

        //  в браках: место жительства ON_M_...   в уст.отцовства: место рождения ON_...
        DokumentON_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOSUD','');
        v := GetValueField(arrRec, 'ON_M_B_OBL');
        if v = null then DokumentON_B_OBL.AsString := ''
                    else DokumentON_B_OBL.Value    := v;
        v := GetValueFieldEx(arrRec, 'ON_M_OBL','');
        if v = null then DokumentON_OBL.AsString := ''
                    else DokumentON_OBL.Value    := v;

        v := GetValueField(arrRec, 'ON_M_B_RN');
        if (v=null) or (v=true) then begin
          DokumentON_RAION.AsString  := GetValueFieldEx(arrRec, 'ON_M_RAION','');
          DokumentON_RNGOROD.AsString:= '';
        end else begin
          DokumentON_RAION.AsString:='';
          DokumentON_RNGOROD.AsString:=GetValueFieldEx(arrRec, 'ON_M_RAION','');
        end;

        DokumentON_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_M_B_GOROD','');
        DokumentON_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOROD','');
        DokumentON_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ON_M_GOROD_R','');

        DokumentON_DOM.AsString := GetValueFieldEx(arrRec, 'ON_M_DOM','');
        DokumentON_KORP.AsString := GetValueFieldEx(arrRec, 'ON_M_KORP','');
        DokumentON_KV.AsString := GetValueFieldEx(arrRec, 'ON_M_KV','');


        DokumentON_WORK.AsString:=GetValueFieldEx(arrRec, 'ON_WORK', '');

      finally
        FRun:=false;
        Screen.Cursor := old;
        dbEnableControls(Dokument,lCheck);
      end;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.ChoiceMat;
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  ParamFlt:TParamFieldFlt;
begin
//  if ExitAsGISUN(true) then exit;

  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ROGD');
  if Opis<>nil then begin

    ParamFlt:=CreateParamFlt(edONA_Familia.Text,'ONA_FAMILIA');
    if ParamFlt<>nil then Opis.AutoFilter:=true;

    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edONA_Familia, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      if v<>null then begin
        FIDAktRogd := v;
        DokumentID_AKT_ROGD.AsInteger:=FIDAktRogd;
      end else begin
        FIDAktRogd := 0;
        DokumentID_AKT_ROGD.AsInteger:=0;
      end;

      DokumentONA_IDENTIF.AsString:=GetValueFieldEx(arrRec, 'ONA_IDENTIF','');

      DokumentONA_FAMILIA.AsString := GetValueFieldEx(arrRec, 'ONA_FAMILIA','');
      DokumentONA_NAME.AsString := GetValueFieldEx(arrRec, 'ONA_NAME','');
      DokumentONA_OTCH.AsString := GetValueFieldEx(arrRec, 'ONA_OTCH','');
      DokumentONA_FAMILIA_B.AsString := GetValueFieldEx(arrRec, 'ONA_FAMILIA_B','');
      DokumentONA_NAME_B.AsString := GetValueFieldEx(arrRec, 'ONA_NAME_B','');
      DokumentONA_OTCH_B.AsString := GetValueFieldEx(arrRec, 'ONA_OTCH_B','');

      v := GetValueField(arrRec, 'ONA_DATER');
      if v = null then DokumentONA_DateR.AsString := '' else DokumentONA_DateR.Value    := v;

      DokumentONA_NATION.AsInteger := GetValueFieldEx(arrRec, 'ONA_NATION',0);
      DokumentONA_GRAG.AsInteger := GetValueFieldEx(arrRec, 'ONA_GRAG',0);
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

      v := GetValueField(arrRec, 'ONA_GOSUD');
      if v = null then DokumentONA_GOSUD.AsString := '' else DokumentONA_GOSUD.Value    := v;
      v := GetValueField(arrRec, 'ONA_OBL');
      if v = null then DokumentONA_OBL.AsString := ''  else DokumentONA_OBL.Value:=v;

      v := GetValueField(arrRec, 'ONA_B_RN');
      if (v=null) or (v=true) then begin
        DokumentONA_RAION.AsString :=GetValueFieldEx(arrRec, 'ONA_RAION','');
        DokumentONA_RNGOROD.AsString:='';
      end else begin
        DokumentONA_RAION.AsString:='';
        DokumentONA_RNGOROD.AsString:=GetValueFieldEx(arrRec, 'ONA_RAION','');
      end;

      DokumentONA_GOROD.AsString:=GetValueFieldEx(arrRec, 'ONA_GOROD','');
      DokumentONA_GOROD_R.AsString:=GetValueFieldEx(arrRec, 'ONA_GOROD_R','');
      DokumentONA_DOM.AsString:=GetValueFieldEx(arrRec, 'ONA_DOM','');
      DokumentONA_KORP.AsString:=GetValueFieldEx(arrRec, 'ONA_KORP','');
      DokumentONA_KV.AsString:=GetValueFieldEx(arrRec, 'ONA_KV','');

      v := GetValueField(arrRec, 'ONA_B_OBL');
      if v = null then DokumentONA_B_OBL.AsString := '' else DokumentONA_B_OBL.Value    := v;
      v := GetValueField(arrRec, 'ONA_B_GOROD');
      if v = null then DokumentONA_B_GOROD.AsString := '' else DokumentONA_B_GOROD.Value    := v;

      //------------ место рождения ------------------------
      v := GetValueField(arrRec, 'ONA_M_GOSUD');
      if v = null then DokumentONA_M_GOSUD.AsString := '' else DokumentONA_M_GOSUD.Value := v;
      v := GetValueField(arrRec, 'ONA_M_OBL');
      if v = null then DokumentONA_M_OBL.AsString := ''  else DokumentONA_M_OBL.Value    := v;
      v := GetValueField(arrRec, 'ONA_M_RAION');
      if v = null then DokumentONA_M_RAION.AsString := '' else DokumentONA_M_RAION.Value    := v;
      v := GetValueField(arrRec, 'ONA_M_GOROD');
      if v = null then DokumentONA_M_GOROD.AsString := '' else DokumentONA_M_GOROD.Value    := v;

      v := GetValueField(arrRec, 'ONA_M_B_OBL');
      if v = null then DokumentONA_M_B_OBL.AsString := '' else DokumentONA_M_B_OBL.Value    := v;
      v := GetValueField(arrRec, 'ONA_M_B_GOROD');
      if v = null then DokumentONA_M_B_GOROD.AsString := '' else DokumentONA_M_B_GOROD.Value    := v;
      //-----------------------------------------------------
      // ребенок
      DokumentIDENTIF.AsString:=GetValueFieldEx(arrRec, 'IDENTIF','');
      DokumentFamiliaDo.AsString:=GetValueFieldEx(arrRec, 'FAMILIA','');
      DokumentFamiliaDo_B.AsString:=GetValueFieldEx(arrRec, 'FAMILIA_B','');
      DokumentNameDo.AsString:=GetValueFieldEx(arrRec, 'NAME','');
      DokumentNameDo_B.AsString:=GetValueFieldEx(arrRec, 'NAME_B','');
      DokumentOtchDo.AsString:=GetValueFieldEx(arrRec, 'OTCH','');
      DokumentOtchDo_B.AsString:=GetValueFieldEx(arrRec, 'OTCH_B','');
      DokumentNamePosle.AsString:=GetValueFieldEx(arrRec, 'NAME','');
      DokumentNamePosle_B.AsString:=GetValueFieldEx(arrRec, 'NAME_B','');
      DokumentDateR.AsDateTime:=GetValueFieldEx(arrRec, 'DATER',0);
      DokumentPOL.AsString:=GetValueFieldEx(arrRec, 'POL','1');
      DokumentMestoNomer.AsString:=GetValueFieldEx(arrRec, 'NOMER','');
      DokumentMestoDate.AsDateTime:=GetValueFieldEx(arrRec, 'DATEZ',0);
      DokumentMesto.AsString:= GetValueFieldEx(arrRec, 'DATEZ',0);
      //------------ место рождения ------------------------
      DokumentGOSUD.AsInteger:=GetValueFieldEx(arrRec, 'GOSUD',0);
      DokumentB_OBL.AsBoolean:=GetValueFieldEx(arrRec, 'B_OBL',true);
      DokumentOBL.AsString:=GetValueFieldEx(arrRec, 'OBL','');
      DokumentRAION.AsString:=GetValueFieldEx(arrRec, 'RAION','');
      DokumentB_GOROD.AsString:=GetValueFieldEx(arrRec, 'B_GOROD','');
      DokumentGOROD.AsString:=GetValueFieldEx(arrRec, 'GOROD','');
      //-----------------------------------------------------

//  было до 03.11.2015 (убрал склонение)   DokumentMesto.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','П',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));
      DokumentMesto.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

      PostDataSet(Dokument);
      QueryExit:=true;
      Screen.Cursor := old;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edONA_FamiliaEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceMat;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.lbLichGetText(Sender: TObject; var Text: String);
//var
//  vKeyValues : Variant;
begin
  Text := '';
  {
  if DokumentLICH_ID.AsString<>'' then begin
    vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, DokumentLICH_ID.AsInteger);
    if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
      Text := dmBase.tbLich.FieldByName('NOMER').AsString;
    end;
  end;
  }
  {
  if Text<>'' then begin
    gbLich.Font.Color:=clBlue;
    gbLich.Font.Style:=gbLich.Font.Style+[fsBold];
  end else begin
    gbLich.Font.Color:=clBlack;
    gbLich.Font.Style:=gbLich.Font.Style-[fsBold];
  end;
  }
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol : TPol;
  lCheck : Boolean;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    if ANSIUpperCase(Field.FieldName) = 'ONA_FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentLICH_ID.AsString:='';
        DokumentONA_ID.AsString:='';
      end;
    end else if ANSIUpperCase(Field.FieldName) = 'ON_FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentON_ID.AsString:='';
      end;
    end;
    FRun := true;
    if FCheckBelName then begin
      strField := UpperCase(Field.FieldName);
      EditDataSet(Dokument);
      Pol := tpNone;
      lCheck := false;
      if strField='NAMEDO' then begin
          DokumentNameDo_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
          lCheck := true;
      end else if strField='OTCHDO' then begin
          DokumentOtchDo_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
          lCheck := true;
      end else if strField='FAMILIADO' then begin
          DokumentFamiliaDo_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end else if strField='NAMEPOSLE' then begin
        if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentNameDo.AsString)) and (DokumentNameDo_B.AsString<>'')
          then DokumentNamePosle_B.AsString := DokumentNameDo_B.AsString
          else DokumentNamePosle_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
          lCheck := true;
      end else if strField='OTCHPOSLE' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentOtchDo.AsString)) and (DokumentOtchDo_B.AsString<>'')
            then DokumentOtchPosle_B.AsString := DokumentOtchDo_B.AsString
            else DokumentOtchPosle_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
          lCheck := true;
      end else if strField='FAMILIAPOSLE' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentFamiliaDo.AsString)) and (DokumentFamiliaDo_B.AsString<>'')
            then DokumentFamiliaPosle_B.AsString := DokumentFamiliaDo_B.AsString
            else DokumentFamiliaPosle_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end else if strField='ON_NAME' then begin
//        if DokumentON_Name_B.AsString='' then begin
          DokumentON_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
//        end;
      end else if strField='ON_OTCH' then begin
//        if DokumentON_Otch_B.AsString='' then begin
          DokumentON_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
//        end;
      end else if strField='ONA_NAME' then begin
//        if DokumentONA_Name_B.AsString='' then begin
          DokumentONA_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
//        end;
      end else if strField='ONA_OTCH' then begin
//        if DokumentONA_Otch_B.AsString='' then begin
          DokumentONA_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
//        end;
      end else if strField='ON_FAMILIA' then begin
//        if DokumentON_Familia_B.AsString='' then begin
          DokumentON_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
//        end;
      end else if strField='ONA_FAMILIA' then begin
//        if DokumentONA_Familia_B.AsString='' then begin
          DokumentONA_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
//        end;
      end else if (strField='ON_GOROD') or (strField='ON_RNGOROD') then begin
        if (strField='ON_RNGOROD') and (Field.AsString<>'')
          then DokumentON_RAION.AsString:='';
        CheckSOATOAkt(true,false,true,'{SS}',0,'');
      end else if (strField='ON_OBL') or (strField='ON_RAION') then begin
        DokumentON_RNGOROD.AsString:='';
//        CheckSOATOAkt(true,false,true);
      end;
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

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.TBItemClearLichClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentLICH_ID.AsString := '';
  PostDataSet(Dokument);
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.UpdateActions;
begin
  inherited;
  {$IFNDEF ZAGS}
//  TBItemClearLich.Enabled:=DokumentLICH_ID.AsString<>'';
  if cbProvDvig.Visible then begin
    if DokumentCHILD_ID.AsString='' then begin
      cbProvDvig.Enabled := false;
    end else begin
      cbProvDvig.Enabled := true;
    end;
  end;
  {$ENDIF}
  {$IFDEF ZAGS}
    TBItemDolg.Enabled := N_F_edCopy.Checked;
  {$ENDIF}
  btAktRogd.Enabled := (FIDAktRogd>0);
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edOsnovChange(Sender: TObject);
begin
  if edOsnov.ItemIndex>-1 then begin
    if edOsnov.ItemIndex=0 then begin
      lbOsnov.Caption := 'Дата заявления родителей';
      edDateDecl.Enabled := true;
      edReshSud.Enabled  := false;
      edDateVst.Enabled  := false;
      edBrak.Enabled  := true;
      lbBrak.Enabled  := true;
    end else begin
      lbOsnov.Caption := 'Дата решения суда';
      edDateDecl.Enabled := true;
      edReshSud.Enabled  := true;
      edDateVst.Enabled  := true;
      edBrak.Enabled  := false;
      lbBrak.Enabled  := false;
    end;
  end else begin
    lbOsnov.Caption := 'Дата заявления родителей (решения суда)';
    edDateDecl.Enabled := false;
    edReshSud.Enabled  := false;
    edDateVst.Enabled  := false;
    edBrak.Enabled  := false;
    lbBrak.Enabled  := false;
  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;

    edRukov.DataField       := 'RUKOV_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
    edZAGS.DataField := 'NAME_ZAGS_B';
  end else begin
    ActivateRUSKeyboard;

    edRukov.DataField       := 'RUKOV';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
    edZAGS.DataField := 'NAME_ZAGS';

  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

//------------------------------------------------------------------------------------------
{
procedure TfmZapisUstOtc.edFamiliaDoEnter(Sender: TObject);
begin if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaDo,DokumentFamiliaDo.AsString+' '); end;
procedure TfmZapisUstOtc.edNameDoEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edNameDo,DokumentNameDo.AsString+' '); end;
procedure TfmZapisUstOtc.edOtchDoEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edOtchDo,DokumentOtchDo.AsString+' '); end;

procedure TfmZapisUstOtc.edFamiliaPosleEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaPosle,DokumentFamiliaPosle.AsString+' '); end;
procedure TfmZapisUstOtc.edNamePosleEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edNamePosle,DokumentNamePosle.AsString+' '); end;
procedure TfmZapisUstOtc.edOtchPosleEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edOtchPosle,DokumentOtchPosle.AsString+' '); end;

procedure TfmZapisUstOtc.edON_FamiliaEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edON_Familia,DokumentON_Familia.AsString+' '); end;
procedure TfmZapisUstOtc.edON_NameEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edON_Name,DokumentON_Name.AsString+' '); end;
procedure TfmZapisUstOtc.edON_OTCHEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edON_OTCH,DokumentON_OTCH.AsString+' '); end;

procedure TfmZapisUstOtc.edONA_FamiliaEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Familia,DokumentONA_Familia.AsString+' '); end;
procedure TfmZapisUstOtc.edONA_NameEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Name,DokumentONA_Name.AsString+' '); end;
procedure TfmZapisUstOtc.edONA_OTCHEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edONA_OTCH,DokumentONA_OTCH.AsString+' '); end;
}
//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edFamiliaDoCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
//  DrawState := N_F_cbBelorus.Checked;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edRukovEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.btPadegClick(Sender: TObject);
begin
//  if EditPadegUstOtc( Dokument ) then begin
//    QueryExit := true;
//  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.Button1Click(Sender: TObject);
begin
  edZAMETKA.AutoSelect:=false;
  edZAMETKA.Value := edZAMETKA.Value + '#';
  ActiveControl := edZAMETKA;
  edZAMETKA.SelStart := Length(edZAMETKA.Value);
  edZAMETKA.SelLength:= 1;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edIzvechEnter(Sender: TObject);
begin
  if DokumentAdresIzvech.AsString='' then begin
    Dokument.CheckBrowseMode;
    Dokument.Edit;
    DokumentAdresIzvech.AsString := GlobalTask.ParamAsString('ADRES_IZVECH');
  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  AddSvid;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edOBLNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edRAIONNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.btAktRogdClick(Sender: TObject);
var
  i:Integer;
  s:String;
begin
  if FIDAktRogd>0 then begin
    CheckUserName_frxDataSet;
    if dmBase.tbZapisRogd.Locate('ID', FIDAktRogd, []) then begin
      if dmBase.tbZapisRogd.FieldByName('VOSSTAN').IsNUll or not dmBase.tbZapisRogd.FieldByName('VOSSTAN').AsBoolean then begin
        EditZapisRogd( FIDAktRogd, Dokument, false, nil );
      end else begin
        {$IFDEF ZAGS}
          EditZapisRogdV( FIDAktRogd, Dokument, false,nil );
        {$ELSE}
          PutError('Восстановленная запись акта недоступна в ЛАИС.',self)
        {$ENDIF}
      end;
    end else begin
      PutError('Запись акта о рождении не найдена.',self)
    end;

    UnCheckUserName_frxDataSet;
    SetCurDok(Self);
  end;
end;

//------------------------------------------------------------------------------------------
function TfmZapisUstOtc.BeforeReport: Boolean;
begin
  Result:=inherited BeforeReport;
  if Result then begin
    CheckForAll_Bel( nil );
    CheckValueSvid;
  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.pcChange(Sender: TObject);
var
  lNew,lErr:Boolean;
  s:String;
//  arr:TArrStrings;
begin
  inherited;
  if pc.ActivePageIndex>-1 then begin

    if pc.Pages[pc.ActivePageIndex].Name='tsSvid' then begin
      CheckForAll_Bel( nil );
      CheckValueSvid;
    end else begin
      N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
    end;
    
  end;

//  if (pc.ActivePageIndex=1) or (pc.Pages[pc.ActivePageIndex].Name='tsSvid')
//    then cbPovtor.Parent:=pc.Pages[pc.ActivePageIndex];
end;

procedure TfmZapisUstOtc.edON_M_OBLNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisUstOtc.edONA_M_OBLNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisUstOtc.edON_M_RAIONNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisUstOtc.edONA_M_RAIONNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisUstOtc.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetUstOtc(self);
//  Gisun.CheckUstOtc(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisUstOtc.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterUstOtc(Self);
//  Gisun.CheckUstOtc(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

//---------------------------------------------------------------------
procedure TfmZapisUstOtc.edSPECEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edSpec,DokumentSPEC.AsString+' '); end;

//---------------------------------------------------------------------
procedure TfmZapisUstOtc.CheckTwoSvid(lTwo:Boolean);
begin
  if lTwo then begin
    pnTwoSvid.Visible:=true;
    edSvid_Nomer.Visible:=false;
    edSvid_Seria.Visible:=false;
    edDateSV.Visible:=false;
    lbSvid.Visible:=false;
    lbSvid2.Visible:=false;
    lbSvid3.Visible:=false;
    edDateVst.HelpContext:=0;
    edON_DATESV.HelpContext:=999;
    rb1.Visible:=lTwo;
  end else begin
    pnTwoSvid.Visible:=false;
    edSvid_Nomer.Visible:=true;
    edSvid_Seria.Visible:=true;
    edDateSV.Visible:=true;
    lbSvid.Visible:=true;
    lbSvid2.Visible:=true;
    lbSvid3.Visible:=true;
    edDateVst.HelpContext:=999;
    edON_DATESV.HelpContext:=0;
  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.N_F_cbTwoSvidClick(Sender: TObject);
var
  strNomer:String;
begin
  CheckTwoSvid(N_F_cbTwoSvid.Checked);
  if N_F_cbTwoSvid.Checked and (DokumentSVID_NOMER.AsString<>'') and (DokumentSVID_NOMER2.AsString='') then begin
    strNomer := PadLInt(StrToInt(DokumentSVID_NOMER.AsString)+1,SVID_LEN,'0');
    edON_Svid_Nomer.Text:=strNomer;
    edON_Svid_Seria.Value:=DokumentSVID_SERIA.AsString;
    if not DokumentDATESV.IsNull
      then edON_DATESV.Value:=DokumentDATESV.Value;
  end;
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.CheckRnGorod;
var
  nW,nL,nT, nW1 : Integer;
begin
  if EnabledRnGorod or
     (not DokumentON_B_RN.IsNull and not DokumentON_B_RN.AsBoolean) then begin
    nW  := edON_GOROD_R.Width;
    nL  := edON_RAION.Left;
    nT  := edON_GOROD_R.Top;
    nW1 := edON_RNGOROD.Width;
    edON_RNGOROD.Left  := nL;
    edON_RNGOROD.Top   := nT;
    edON_GOROD_R.Width := nW - nW1 - 5;
    edON_GOROD_R.Left  := nL + nW1 + 5;
    edON_RNGOROD.Visible := true;
  end else begin
    edON_RNGOROD.Visible := false;
    edON_GOROD_R.Width := edON_RAION.Width;
  end;

  if EnabledRnGorod or
     (not DokumentONA_B_RN.IsNull and not DokumentONA_B_RN.AsBoolean) then begin
    nW  := edONA_GOROD_R.Width;
    nL  := edONA_RAION.Left;
    nT  := edONA_GOROD_R.Top;
    nW1 := edONA_RNGOROD.Width;
    edONA_RNGOROD.Left  := nL;
    edONA_RNGOROD.Top   := nT;
    edONA_GOROD_R.Width := nW - nW1 - 5;
    edONA_GOROD_R.Left  := nL + nW1 + 5;
    edONA_RNGOROD.Visible := true;
  end else begin
    edONA_RNGOROD.Visible := false;
    edONA_GOROD_R.Width := edONA_RAION.Width;
  end;
end;
                                    
//------------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.edONA_FamiliaEditButtons2Click(Sender: TObject; var Handled: Boolean);
var
  fmParam:TfmParamQuest;
  n:Integer;
begin
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.CheckLang:=true;
  fmParam.FontSize:=edFamiliaDo.Font.Size;
  try
    fmParam.Caption:='Брак';
    fmParam.AddParamEx(DokumentONA_FAMILIA_BRAK.AsString, 'фамилия после брака по-русски', 'FAM' ,'WIDTH=150~LANG=RUS');
    fmParam.AddParamEx(DokumentONA_FAMILIA_BRAK_B.AsString, 'фамилия после брака по-белорусски', 'FAM_B' ,'WIDTH=150~LANG=BLR');
    fmParam.AddParamEx(DokumentZBRAK_NOMER.AsString, 'запись акта №', 'NOMER' ,'WIDTH=120~LANG=RUS');
    fmParam.AddParamEx(DokumentZBRAK_DATE.AsDateTime, 'дата акта', 'DATE' ,'TYPE=DATE~WIDTH=120~LANG=RUS');
    fmParam.AddParamEx(DokumentZBRAK_ORGAN.AsString, 'орган регистрации', 'ORGAN' ,'WIDTH=300~LANG=RUS');
    fmParam.AddButtons('Записать~Отказ',0);
    n:=fmParam.ShowQuest;
    if n=1 then begin
      EditDataSet(Dokument);
      QueryExit:=true;
      DokumentONA_FAMILIA_BRAK.AsString:=fmParam.GetValue('FAM','S');
      DokumentONA_FAMILIA_BRAK_B.AsString:=fmParam.GetValue('FAM_B','S');
      DokumentZBRAK_NOMER.AsString:=fmParam.GetValue('NOMER','S');
      DokumentZBRAK_ORGAN.AsString:=fmParam.GetValue('ORGAN','S');
      try
        WriteDateFieldV(DokumentZBRAK_DATE, fmParam.GetValue('DATE','D'));
//        DokumentZBRAK_DATE.AsDateTime:=fmParam.GetValue('DATE','D')
      except
      end;
    end;
  finally
    fmParam.Free;
  end;
end;

//------------------------------------------------------------------------------------------
function TfmZapisUstOtc.CreateSubMenuRun: Boolean;
var
 it : TTbItem;
// sep : TTbSeparatorItem;
begin
  inherited CreateSubmenuRun;
  Result:=true;

  AddSubmenu_CheckFIO;

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Аннулирование актовой записи';
  it.OnClick:=Event_Annulir;
  TBSubmenuRun.Add(it);

  AddSubmenu_ReadDolg;

end;

procedure TfmZapisUstOtc.CheckValueSvid;
var
  lNewChild,lNewMama,lErr:Boolean;
  cpol,s:String;
  arr:TArrStrings;
  n:Integer;
begin
  if (DokumentFAMILIA_P.AsString='') and (DokumentFAMILIA_B_P.AsString='') then begin
    lNewChild := true;
  end else begin
    lNewChild := false;
  end;
  if (DokumentONA_FAMILIA_P.AsString='') and (DokumentONA_FAMILIA_B_P.AsString='') then begin
    lNewMama := true;
  end else begin
    lNewMama := false;
  end;
  lErr:=false;
  if lNewChild then begin
//    s := DokumentFamiliaDo.AsString + ' ' + DokumentNameDo.AsString + ' ' + DokumentOtchDo.AsString;
    SetLength(arr,3);
    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
      cPol:=ANSILowerCase(DokumentPOL.AsString);
      arr[0]:=GetPadegFIO(DokumentFamiliaDo.AsString,cPol,'Р');
      s:=GetPadegIF(DokumentNameDo.AsString, DokumentOtchDo.AsString, cPol, 'Р');
      n:=LastPos(' ',s);
      arr[1]:=Copy(s,1,n-1);
      arr[2]:=Copy(s,n+1,Length(s));
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end else begin
      arr[0]:=DokumentFamiliaDo.AsString;
      arr[1]:=DokumentNameDo.AsString;
      arr[2]:=DokumentOtchDo.AsString;
    end;
    if not lErr then begin
      SetLength(arr,3);
      DokumentFamilia_P.AsString:=arr[0];
      DokumentName_P.AsString:=arr[1];
      DokumentOtch_P.AsString:=arr[2];
      DokumentFamilia_B_P.AsString:=DokumentFamiliaDo_B.AsString;
      DokumentName_B_P.AsString:=DokumentNameDo_B.AsString;
      DokumentOtch_B_P.AsString:=DokumentOtchDo_B.AsString;
    end;
  end;
  if lNewMama then begin
    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
      s:=GetPadegFIO3(DokumentONA_Familia.AsString, DokumentONA_NAME.AsString, DokumentONA_OTCH.AsString,'ж','Р');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end else begin
      s:=DokumentONA_Familia.AsString + ' ' + DokumentONA_NAME.AsString + ' ' + DokumentONA_OTCH.AsString;
    end;
    StrToArr(s,arr,' ',false);
    if Length(arr)>3 then lErr := true;
    if not lErr then begin
      DokumentONA_Familia_P.AsString := arr[0];
      DokumentONA_Name_P.AsString := arr[1];
      DokumentONA_Otch_P.AsString := arr[2];
    end;
    DokumentONA_Familia_B_P.AsString:=DokumentONA_Familia_B.AsString;
    DokumentONA_Name_B_P.AsString:=DokumentONA_Name_B.AsString;
    DokumentONA_Otch_B_P.AsString:=DokumentONA_Otch_B.AsString;
  end;
end;

//------------------------------------------------------------------------
procedure TfmZapisUstOtc.CheckControlSvid;
var
  n:Integer;
begin
  if GlobalTask.ParamAsBoolean('INVERT_SVID') then begin
    Init_ArrCheckControl(20);
    n:=0;
    FArrCheckControl[n].Cont1:=edFamiliaDo_Sv;
    FArrCheckControl[n].Cont2:=BLR_edFamiliaDo_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edNameDo_Sv;
    FArrCheckControl[n].Cont2:=BLR_edNameDo_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edOtchDo_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOtchDo_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edFamiliaPosle_Sv;
    FArrCheckControl[n].Cont2:=BLR_edFamiliaPosle_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edNamePosle_Sv;
    FArrCheckControl[n].Cont2:=BLR_edNamePosle_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edOtchPosle_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOtchPosle_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=Label76;
    FArrCheckControl[n].Cont2:=lbON_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edRukov_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRukov_Sv_B; Inc(n);  //8

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
    FArrCheckControl[n].Cont2:=BLR_edONA_Otch_B_Sv; Inc(n);  // 14

    FArrCheckControl[n].Cont1:=Label49;
    FArrCheckControl[n].Cont2:=Label50; Inc(n);
    FArrCheckControl[n].Cont1:=lbOna_Sv;
    FArrCheckControl[n].Cont2:=Label47; Inc(n);

    FArrCheckControl[n].Cont1:=Label54;
    FArrCheckControl[n].Cont2:=Label55; Inc(n);
    FArrCheckControl[n].Cont1:=Label56;
    FArrCheckControl[n].Cont2:=Label61; Inc(n);
    FArrCheckControl[n].Cont1:=Label57;
    FArrCheckControl[n].Cont2:=Label62; Inc(n);
    FArrCheckControl[n].Cont1:=Label60;
    FArrCheckControl[n].Cont2:=Label63; Inc(n);   // 20

  end;
end;

procedure TfmZapisUstOtc.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;
procedure TfmZapisUstOtc.edRukov_SvEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov_Sv);
end;
procedure TfmZapisUstOtc.edSPECEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;
//----------------------------------------------------------------------
procedure TfmZapisUstOtc.edON_VoenkomEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edON_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
end;
procedure TfmZapisUstOtc.edON_VoenkomEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  edON_Voenkom.Value:=null;
end;
procedure TfmZapisUstOtc.edON_VoenkomEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  WriteVOENKOM(1,false);
end;
//----------------------------------------------------------------------
procedure TfmZapisUstOtc.edONA_VOENKOMEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
end;

//-----------------------------------------------------------------------------------------
procedure TfmZapisUstOtc.CheckSOATOAkt(lOn,lOna:Boolean; lCheckVoenkom:Boolean; strParam:String; nAteID:Integer; strSoato:String);
var
//  SOATO:TSOATO;
  n:Integer;
  ATE:TATE;
  sSoato:String;
begin
  if lOn then begin
    if nAteID>0 then begin
      sSoato:=strSoato;
    end else begin
      ATE:=dmBase.GetATEAkt(Dokument, 'ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_RNGOROD;ON_GOROD,ON_B_GOROD', strParam);
      if ATE.ATE_ID>0 then begin
        sSoato:=ATE.Kod;
        nAteID:=ATE.ATE_ID;
      end else begin
        sSoato:='9000000000';
        nAteID:=0;
      end;
    end;
//    EditDataSet(Dokument);
//    DokumentON_SOATO.AsString:=sSOATO;
//    DokumentON_ATEID.AsInteger:=nAteID;
//    FOnCheckSOATO:=false;
    if lCheckVoenkom and FAutoVus then begin  // определение военкомата по СОАТО места жительства
      n:=getVoenkomat(sSOATO, DokumentDATEZ, DokumentON_DATER, true, DokumentON_GRAG.AsInteger);
      if n>0 then begin
        EditDataSet(Dokument);
        DokumentON_VOENKOM.AsInteger:=n;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------
procedure TfmZapisUstOtc.WriteVOENKOM(nType:Integer; lCheckVozr:Boolean);
var
  SOATO:TSOATO;
  n:Integer;
  fld:TField;
begin
  if nType=1 then begin
    SOATO:=dmBase.GetSoatoAkt(Dokument,
           'ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_RNGOROD;ON_GOROD,ON_B_GOROD',true,FLenSoato);
  end else begin
    SOATO:=dmBase.GetSoatoAkt(Dokument,
           'ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION,ONA_RNGOROD;ONA_GOROD,ONA_B_GOROD',true,FLenSoato);
  end;
  if nType=1
    then fld:=DokumentON_VOENKOM
    else fld:=nil;
  if fld<>nil then begin
    n:=dmBase.VoenkomFromSOATO(SOATO.Kod);
    if n>0 then begin
      EditDataSet(Dokument);
      fld.AsInteger:=n;
    end else if fld.AsInteger>0 then begin
      EditDataSet(Dokument);
      fld.AsString:='';
    end;
  end;
end;

//------------------------------------------------------------
function TfmZapisUstOtc.CheckFIO: String;
begin
  Result:=CheckOneFIO('До установления: ',DokumentFamiliaDo.AsString, DokumentNameDo.AsString, DokumentOtchDo.AsString);
  if Result='' then begin
    Result:=CheckOneFIO('После установления: ',DokumentFamiliaPosle.AsString, DokumentNamePosle.AsString, DokumentOtchPosle.AsString);
  end;
end;

procedure TfmZapisUstOtc.TBItemChoiceAktUstOtcClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  ParamFlt:TParamFieldFlt;
  sNomer,sSvidSeria,sNomerSvid:String;
  sRuk,sRukB,sSpec,sSpecB:String;        
  dDateAkt,dDateSvid:TDateTime;
  nID,nID_ZAGS:Integer;
  lNew,l:Boolean;
  c:TControl;
begin
//  if ExitAsGISUN(true) then exit;

//  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_USTOTC');
  if Opis<>nil then begin

    ParamFlt:=CreateParamFlt(edON_Familia.Text,'ON_FAMILIA');
    if ParamFlt<>nil then Opis.AutoFilter:=true;

    SetLength(arrRec,1);
    v := null;
    if FOnlySvid then c:=edON_Familia_Sv else c:=edON_Familia;
    if Opis.ChoiceFromSprEx(c, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      FRun:=true;
      l:=dbDisableControls(Dokument);
      try
        IsReadDokument:=true;
        lNew:=FAddNewDok;
        nID:=DokumentID.AsInteger;
        nID_ZAGS:=DokumentID_ZAGS.AsInteger;
        sNomer:=DokumentNOMER.AsString;
        sSvidSeria:=DokumentSVID_SERIA.AsString;
        sNomerSvid:=DokumentSVID_NOMER.AsString;
        dDateAkt:=DokumentDATEZ.AsDateTime;
        dDateSvid:=DokumentDateSv.AsDateTime;
        sRuk:=DokumentRUKOV.AsString;
        sRukB:=DokumentRUKOV_B.AsString;
        sSpec:=DokumentSPEC.AsString;
        sSpecB:=DokumentSPEC_B.AsString;

        ReadDok(GetValueField(arrRec, 'ID'));
        if SvidPovtor.Active then SvidPovtor.EmptyTable;
        if HistZAGS.Active then HistZAGS.EmptyTable;
        FAddNewDok:=lNew;

        EditDataSet(Dokument);
        CheckHistory(true);
        DokumentID_ZAGS.AsInteger := nID_ZAGS;
        DokumentNAME_ZAGS.AsString:='';
        DokumentNAME_ZAGS_B.AsString:='';
        SetIDZags(0);
        DokumentPOLE_GRN.AsInteger:=0;
        DokumentIDENTIF.AsString:='';
        DokumentFamiliaDo.AsString:='';
        DokumentNameDo.AsString:='';
        DokumentOtchDo.AsString:='';
        DokumentFamiliaDo_B.AsString:='';
        DokumentNameDo_B.AsString:='';
        DokumentOtchDo_B.AsString:='';
        DokumentFamiliaPosle.AsString:='';
        DokumentNamePosle.AsString:='';
        DokumentOtchPosle.AsString:='';
        DokumentFamiliaPosle_B.AsString:='';
        DokumentNamePosle_B.AsString:='';
        DokumentOtchPosle_B.AsString:='';

        DokumentDateR.AsString:='';
        DokumentSVID_SERIA2.AsString:='';
        DokumentSVID_NOMER2.AsString:='';
        DokumentDATESV2.AsString:='';
        DokumentReshSud.AsString:='';
        DokumentDATE_VST.AsString:='';
        DokumentMestoNomer.AsString:='';
        DokumentMestoDate.AsString:='';
        DokumentMesto.AsString:='';
        DokumentIZV_NOMER.AsString:='';
        DokumentIZV_DATE.AsString:='';
        DokumentAdresIzvech.AsString:='';

        DokumentID.AsInteger:=nID;
        DokumentCHILD_ID.AsString:='';
        DokumentPOLE_GRN.AsString:='';
        DokumentNOMER.AsString:=sNomer;
        DokumentSVID_SERIA.AsString:=sSvidSeria;
        DokumentSVID_NOMER.AsString:=sNomerSvid;
        DokumentDATEZ.AsDateTime:=dDateAkt;
        DokumentDateSv.AsDateTime:=dDateSvid;

        DokumentRUKOV.AsString:=sRuk;
        DokumentRUKOV_B.AsString:=sRukB;
        DokumentSPEC.AsString:=sSpec;
        DokumentSPEC_B.AsString:=sSpecB;

        PostDataSet(Dokument);
        IsReadDokument:=false;
      finally
        FRun:=false;
        dbEnableControls(Dokument,l);
        Screen.Cursor := old;
      end;
    end;
  end;
end;

procedure TfmZapisUstOtc.AddUserHist;
var
  slPokaz:TStringList;
  nType:Integer;
  lClear:Boolean;
begin
  slPokaz:=TStringList.Create;
  slPokaz.AddObject('ФИО ребёнка до', Pointer(0));
  slPokaz.AddObject('ФИО ребёнка после', Pointer(0));
  slPokaz.AddObject('ФИО отца', Pointer(0));
  slPokaz.AddObject('ФИО матери', Pointer(0));
  if EditAddHistory(slPokaz, nType,lClear) then begin
    if Integer(slPokaz.Objects[0])=1 then begin
      FieldsAddHist([edFamiliaDo, edNameDo, edOtchDo, BLR_edFamiliaDo, BLR_edNameDo, BLR_edOtchDo],lClear);
    end;
    if Integer(slPokaz.Objects[1])=1 then begin
      FieldsAddHist([edFamiliaPosle, edNamePosle, edOtchPosle, BLR_edFamiliaPosle, BLR_edNamePosle, BLR_edOtchPosle],lClear);
    end;
    if Integer(slPokaz.Objects[2])=1 then begin
      FieldsAddHist([edON_Familia, edON_Name, edON_Otch, BLR_edON_Familia, BLR_edON_Name, BLR_edON_Otch],lClear);
    end;
    if Integer(slPokaz.Objects[3])=1 then begin
      FieldsAddHist([edONA_Familia, edONA_Name, edONA_Otch, BLR_edONA_Familia, BLR_edONA_Name, BLR_edONA_Otch],lClear);
    end;
  end;
  slPokaz.Free;
end;

procedure TfmZapisUstOtc.TBItemEditMemoClick(Sender: TObject);
begin
  if ActiveControl=edZametka then TBItemEditMemo.Tag:=3;
  try
    inherited TBItemEditMemoClick(Sender);
  finally
    TBItemEditMemo.Tag:=0;
  end;
end;

procedure TfmZapisUstOtc.SetOnlyPovtorSvid(lOnlyPovtor: Boolean;  pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;  lbSvid, lbNomer: TLabel);
begin
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
  if lOnlyPovtor then begin
    TBItemSeekAkt.Visible:=true;
    TBItemChoiceAktUstOtc.Visible:=false;
//    TBItemArxSpr.Visible:=false;
//  TBSubmenuGISUN.Visible:=false;
    TBItemStep2.Caption:='Зарегистрировать свидетельство';
    lbIdentif.Parent:=tsSvid;
    lbIDENTIF.Top:=Label51.Top;
    lbIDENTIF.Left:=edDateR_Sv.Left+edDateR_Sv.Width+50;
    lbIDENTIF.Caption:='Иден. номер';
    ENG_edIDENTIF.Parent:=tsSvid;
    ENG_edIDENTIF.Top:=edDateR_Sv.Top;
    ENG_edIDENTIF.Left:=lbIDENTIF.Left+lbIDENTIF.Width+50;
    {
    edON_DATER.Parent:=tsSvid;
    edON_DATER.Top:=edON_Familia_Sv.Top-26;
    edON_DATER.Left:=lbON_Sv.Left+lbON_Sv.Width+30;
    edON_DATER.TabOrder:=200;

    ENG_edON_IDENTIF.Parent:=tsSvid;
    ENG_edON_IDENTIF.Top:=BLR_edON_FamiliaB_Sv.Top-26;
    ENG_edON_IDENTIF.Left:=edON_DATER.Left+edON_DATER.Width+30;
    ENG_edON_IDENTIF.TabOrder:=201;

    edONA_DATER.Parent:=tsSvid;
    edONA_DATER.Top:=edONA_Familia_Sv.Top-26;
    edONA_DATER.Left:=lbONA_Sv.Left+lbONA_Sv.Width+30;
    edONA_DATER.TabOrder:=202;

    ENG_edONA_IDENTIF.Parent:=tsSvid;
    ENG_edONA_IDENTIF.Top:=BLR_edONA_FamiliaB_Sv.Top-26;
    ENG_edONA_IDENTIF.Left:=edONA_DATER.Left+edONA_DATER.Width+30;
    ENG_edONA_IDENTIF.TabOrder:=203;
     }
  end;
end;

procedure TfmZapisUstOtc.N_F_lbON_StatusClick(Sender: TObject);
begin  ClearStatus(DokumentON_STATUS); end;

procedure TfmZapisUstOtc.N_F_lbON_StatusGetText(Sender: TObject; var Text: String);
begin Text:=GetStatus(DokumentON_STATUS); end;

procedure TfmZapisUstOtc.N_F_lbONA_StatusClick(Sender: TObject);
begin ClearStatus(DokumentONA_STATUS); end;

procedure TfmZapisUstOtc.N_F_lbONA_StatusGetText(Sender: TObject;  var Text: String);
begin Text:=GetStatus(DokumentONA_STATUS);  end;

procedure TfmZapisUstOtc.rb1Click(Sender: TObject);
begin
  Globaltask.SetLastValueAsString('CUR_SVID', '1');  // печать даты свидетельсва DATESV
end;

procedure TfmZapisUstOtc.rb2Click(Sender: TObject);
begin
  Globaltask.SetLastValueAsString('CUR_SVID', '2');  // печать даты свидетельсва DATESV2
end;
//-----------------------------------------------------------------
function TfmZapisUstOtc.CheckDateEditGIS: Boolean;
begin
  Result:=false;
  if Gisun.GetPoleGrn(DokumentPOLE_GRN)=rPost then begin
  // номер и дата записи, свидетельство, дата рождения ребенка , ФИО ребенка после установления отцовства, ИН отца и матери
  if (DokumentNOMER.AsString<>FMainTable.FieldByName('NOMER').AsString) or
     (DokumentDATEZ.AsString<>FMainTable.FieldByName('DATEZ').AsString) or
     (DokumentSVID_SERIA.AsString<>FMainTable.FieldByName('SVID_SERIA').AsString) or
     (DokumentSVID_NOMER.AsString<>FMainTable.FieldByName('SVID_NOMER').AsString) or
     (DokumentDATESV.AsString<>FMainTable.FieldByName('DATESV').AsString) or
     (DokumentIDENTIF.AsString<>FMainTable.FieldByName('IDENTIF').AsString) or
     (DokumentDATER.AsString<>FMainTable.FieldByName('DATER').AsString) or
     (ce_fio(DokumentFamiliaPosle_B.AsString)<>ce_fio(FMainTable.FieldByName('FamiliaPosle_B').AsString)) or
     (ce_fio(DokumentNamePosle_B.AsString)<>ce_fio(FMainTable.FieldByName('NamePosle_B').AsString)) or
     (ce_fio(DokumentOtchPosle_B.AsString)<>ce_fio(FMainTable.FieldByName('OtchPosle_B').AsString)) or
     (ce_fio(DokumentFamiliaPosle.AsString)<>ce_fio(FMainTable.FieldByName('FamiliaPosle').AsString)) or
     (ce_fio(DokumentNamePosle.AsString)<>ce_fio(FMainTable.FieldByName('NamePosle').AsString)) or
     (ce_fio(DokumentOtchPosle.AsString)<>ce_fio(FMainTable.FieldByName('OtchPosle').AsString)) or
     (DokumentON_IDENTIF.AsString<>FMainTable.FieldByName('ON_IDENTIF').AsString) or
     (DokumentONA_IDENTIF.AsString<>FMainTable.FieldByName('ONA_IDENTIF').AsString)
    then Result:=true
    else Result:=false;
  end;  
    {  ???
  if not Result and DokumentTWO_SVID.AsBoolean then begin
    if (DokumentSVID_SERIA2.AsString<>FMainTable.FieldByName('SVID_SERIA2').AsString) or
       (DokumentSVID_NOMER2.AsString<>FMainTable.FieldByName('SVID_NOMER2').AsString) or
       (DokumentDATESV2.AsString<>FMainTable.FieldByName('DATESV2').AsString)
      then Result:=true
      else Result:=false;
  end;
  }
end;
//-----------------------------------------------------------
procedure TfmZapisUstOtc.WriteAfterRegister_GISUN;
begin
  try
    EditDataSet(Dokument);
    DokumentB_RESP.AsBoolean:=false;
    Dokument.Post;
    FMainTable.FieldByName('B_RESP').AsBoolean:=false;
  except
  end;
end;

end.
