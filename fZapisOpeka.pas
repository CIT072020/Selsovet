unit fZapisOpeka;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, DateUtils, Graphics, Controls, Forms, Dialogs,uPadegFIO,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject,uTypes, FuncEh,
  ExtCtrls, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, dBase, funcPr, dbFunc, uDataSet2XML, fChoiceGIS_Class,
  MetaTAsk, OpisEdit, vchDBCtrls, FR_DSet, FR_DBSet, DBCtrls, Grids, uProjectAll,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  DBGridEh, TB2ExtItems, Buttons, ImgList, kbmMemCSVStreamFormat, ZipForge;

type

  TfmZapisOpeka = class(TfmSimpleD)
    pn: TPanel;
    pc: TPageControl;
    tsChild: TTabSheet;
    tsOpekun: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    edDateR: TDBDateTimeEditEh;
    edPol: TDBComboBoxEh;
    edNomer: TDBEditEh;
    N_F_1: TDBCheckBoxEh;
    dsNation: TDataSource;
    dsStran: TDataSource;
    TBItemClearLich: TTBItem;
    Label6: TLabel;
    edFamilia: TDBEditEh;
    Label24: TLabel;
    edName: TDBEditEh;
    Label25: TLabel;
    edOtch: TDBEditEh;
    tsFaser: TTabSheet;
    Label28: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    edOTEC_Familia: TDBEditEh;
    Label47: TLabel;
    edOTEC_Name: TDBEditEh;
    edOTEC_Otch: TDBEditEh;
    edOTEC_DateR: TDBDateTimeEditEh;
    edOTEC_GRAG: TDBLookupComboboxEh;
    edOTEC_GOSUD: TDBLookupComboboxEh;
    edOTEC_GOROD: TDBEditEh;
    edOTEC_GOROD_R: TDBEditEh;
    edOTEC_B_OBL: TDBCheckBoxEh;
    edOTEC_B_RESP: TDBCheckBoxEh;
    Label48: TLabel;
    edMAT_FAMILIA: TDBEditEh;
    edMAT_Name: TDBEditEh;
    edMAT_Otch: TDBEditEh;
    edMAT_DateR: TDBDateTimeEditEh;
    edMAT_GRAG: TDBLookupComboboxEh;
    edMAT_GOSUD: TDBLookupComboboxEh;
    edMAT_GOROD: TDBEditEh;
    edMAT_GOROD_R: TDBEditEh;
    edMAT_B_OBL: TDBCheckBoxEh;
    edMAT_B_RESP: TDBCheckBoxEh;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentSVID_SERIA: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentPOL: TStringField;
    DokumentOTEC_Familia: TStringField;
    DokumentOTEC_Name: TStringField;
    DokumentOTEC_Otch: TStringField;
    DokumentOTEC_DateR: TDateField;
    DokumentOTEC_NATION: TIntegerField;
    DokumentOTEC_GRAG: TIntegerField;
    DokumentOTEC_SOATO: TStringField;
    DokumentOTEC_GOSUD: TIntegerField;
    DokumentOTEC_OBL: TStringField;
    DokumentOTEC_RAION: TStringField;
    DokumentOTEC_GOROD: TStringField;
    DokumentOTEC_GOROD_R: TStringField;
    DokumentOTEC_B_RESP: TBooleanField;
    DokumentOTEC_B_OBL: TBooleanField;
    DokumentMAT_Familia: TStringField;
    DokumentMAT_Name: TStringField;
    DokumentMAT_Otch: TStringField;
    DokumentMAT_DateR: TDateField;
    DokumentMAT_GRAG: TIntegerField;
    DokumentMAT_GOSUD: TIntegerField;
    DokumentMAT_OBL: TStringField;
    DokumentMAT_RAION: TStringField;
    DokumentMAT_GOROD: TStringField;
    DokumentMAT_GOROD_R: TStringField;
    DokumentMAT_B_RESP: TBooleanField;
    DokumentMAT_B_OBL: TBooleanField;
    DokumentON_Familia: TStringField;
    DokumentON_Name: TStringField;
    DokumentON_Otch: TStringField;
    DokumentON_DateR: TDateField;
    DokumentON_GRAG: TIntegerField;
    DokumentON_GOSUD: TIntegerField;
    DokumentON_OBL: TStringField;
    DokumentON_RAION: TStringField;
    DokumentON_GOROD: TStringField;
    DokumentON_GOROD_R: TStringField;
    DokumentON_B_RESP: TBooleanField;
    DokumentON_B_OBL: TBooleanField;
    DokumentRUKOV: TStringField;
    DokumentSPEC: TStringField;
    DokumentID_ZAGS: TIntegerField;
    DokumentID_SOURCE: TIntegerField;
    DokumentFirst_Ekz: TBooleanField;
    dsGragd: TDataSource;
    DokumentON_WORK: TStringField;
    ImageGISUN: TImage;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2ust: TTBItem;
    N_F_cbBelorus: TDBCheckBoxEh;
    DokumentOTEC_B_GOROD: TSmallintField;
    DokumentMAT_B_GOROD: TSmallintField;
    DokumentON_B_GOROD: TSmallintField;
    DokumentRG_B_GOROD: TSmallintField;
    DokumentOTEC_STATUS: TStringField;
    DokumentOTEC_IDENTIF: TStringField;
    DokumentSTATUS: TStringField;
    DokumentTYPEMESSAGE: TStringField;
    DokumentPOLE_GRN: TSmallintField;
    DokumentMAT_STATUS: TStringField;
    DokumentMAT_IDENTIF: TStringField;
    DokumentON_STATUS: TStringField;
    DokumentON_IDENTIF: TStringField;
    Label73: TLabel;
    ENG_edOTEC_IDENTIF: TDBEditEh;
    ENG_edMAT_IDENTIF: TDBEditEh;
    edOTEC_B_GOROD: TDBLookupComboboxEh;
    edMAT_B_GOROD: TDBLookupComboboxEh;
    lbIdentif: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    DokumentIDENTIF: TStringField;
    edOTEC_OBL: TDBEditEh;
    edOTEC_RAION: TDBEditEh;
    edMAT_OBL: TDBEditEh;
    edMAT_RAION: TDBEditEh;
    DokumentRN_B_GOROD_DO: TStringField;
    DokumentRN_ON_B_GOROD: TStringField;
    DokumentRN_MAT_B_GOROD: TStringField;
    gbMestoGit: TGroupBox;
    Label7: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label37: TLabel;
    Label40: TLabel;
    edGT_GOROD: TDBEditEh;
    edGT_GOROD_R: TDBEditEh;
    edGT_B_OBL: TDBCheckBoxEh;
    edGT_B_GOROD: TDBLookupComboboxEh;
    edGT_OBL: TDBEditEh;
    edGT_RAION: TDBEditEh;
    edGT_RNGOROD: TDBLookupComboboxEh;
    Label1: TLabel;
    edSpec: TDBEditEh;
    gbMestoRogd: TGroupBox;
    Label33: TLabel;
    Label30: TLabel;
    Label34: TLabel;
    Label29: TLabel;
    edRG_B_RESP: TDBCheckBoxEh;
    edRG_GOSUD: TDBLookupComboboxEh;
    edRG_B_OBL: TDBCheckBoxEh;
    edRG_GOROD: TDBEditEh;
    edRG_B_GOROD: TDBLookupComboboxEh;
    edRG_RAION: TDBEditEh;
    edRG_OBL: TDBEditEh;
    Label2: TLabel;
    edGT_DOM: TDBEditEh;
    Label3: TLabel;
    edGT_KORP: TDBEditEh;
    Label68: TLabel;
    edGT_KV: TDBEditEh;
    gbObraz: TGroupBox;
    Label11: TLabel;
    Label20: TLabel;
    Label26: TLabel;
    Label36: TLabel;
    edKurs: TDBEditEh;
    edStudent: TDBComboBoxEh;
    edStudent_Type: TDBComboBoxEh;
    DokumentDateR: TDateField;
    DokumentRG_GOSUD: TIntegerField;
    DokumentRG_B_RESP: TBooleanField;
    DokumentRG_OBL: TStringField;
    DokumentRG_RAION: TStringField;
    DokumentRG_B_OBL: TBooleanField;
    DokumentRG_GOROD: TStringField;
    DokumentGT_OBL: TStringField;
    DokumentGT_RAION: TStringField;
    DokumentGT_B_GOROD: TSmallintField;
    DokumentGT_GOROD: TStringField;
    DokumentGT_DOM: TStringField;
    DokumentGT_KORP: TStringField;
    DokumentGT_KV: TStringField;
    DokumentGT_GOROD_R: TStringField;
    DokumentOTNOSH: TStringField;
    DokumentSTUD_PLACE: TIntegerField;
    DokumentVID: TSmallintField;
    DokumentDATE_PR: TDateField;
    DokumentDATE_OTM: TDateField;
    DokumentNOMER_UST: TStringField;
    DokumentNOMER_OTM: TStringField;
    DokumentFORMA: TSmallintField;
    edOTEC_KORP: TDBEditEh;
    Label51: TLabel;
    edOTEC_DOM: TDBEditEh;
    Label52: TLabel;
    Label54: TLabel;
    edOTEC_KV: TDBEditEh;
    Label55: TLabel;
    edMAT_DOM: TDBEditEh;
    Label56: TLabel;
    edMAT_KORP: TDBEditEh;
    Label57: TLabel;
    edMAT_KV: TDBEditEh;
    Label58: TLabel;
    edOTEC_WORK: TDBEditEh;
    edMAT_WORK: TDBEditEh;
    DokumentGRAG: TIntegerField;
    DokumentON_DOM: TStringField;
    DokumentON_KORP: TStringField;
    DokumentON_KV: TStringField;
    DokumentOTEC_DOM: TStringField;
    DokumentOTEC_KORP: TStringField;
    DokumentOTEC_KV: TStringField;
    DokumentMAT_DOM: TStringField;
    DokumentMAT_KORP: TStringField;
    DokumentMAT_KV: TStringField;
    DokumentRN_OTEC_B_GOROD: TStringField;
    DokumentPRICH_OTM: TMemoField;
    DokumentKEM: TMemoField;
    DokumentTIP: TSmallintField;
    DokumentPRICH_CHILD: TSmallintField;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label53: TLabel;
    Label67: TLabel;
    Label27: TLabel;
    Label41: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    edON_Familia: TDBEditEh;
    edON_Name: TDBEditEh;
    edON_OTCH: TDBEditEh;
    edON_DATER: TDBDateTimeEditEh;
    edON_GOSUD: TDBLookupComboboxEh;
    edON_GOROD: TDBEditEh;
    edON_GRAG: TDBLookupComboboxEh;
    edON_B_RESP: TDBCheckBoxEh;
    edON_B_OBL: TDBCheckBoxEh;
    edON_GOROD_R: TDBEditEh;
    edON_WORK: TDBEditEh;
    edON_B_GOROD: TDBLookupComboboxEh;
    ENG_edON_IDENTIF: TDBEditEh;
    edON_OBL: TDBEditEh;
    edON_RAION: TDBEditEh;
    edON_DOM: TDBEditEh;
    edON_KORP: TDBEditEh;
    edON_KV: TDBEditEh;
    lbOtnosh: TLabel;
    edOtnosh: TDBEditEh;
    edForma: TDBComboBoxEh;
    lbForma: TLabel;
    lbTip: TLabel;
    edTip: TDBComboBoxEh;
    lbPrichChild: TLabel;
    edPrichChildLais: TDBComboBoxEh;
    DokumentOTEC_WORK: TStringField;
    DokumentMAT_WORK: TStringField;
    Label10: TLabel;
    edON_POL: TDBComboBoxEh;
    DokumentON_POL: TStringField;
    DokumentSTUDENT: TSmallintField;
    DokumentSTUDENT_TYPE: TSmallintField;
    DokumentSTUDENT_SPR: TIntegerField;
    DokumentKURS: TSmallintField;
    edStudentSpr: TDBLookupComboboxEh;
    DokumentGT_RNGOROD: TStringField;
    DokumentGT_B_OBL: TBooleanField;
    dsStudentSpr: TDataSource;
    edAddDok: TDBEditEh;
    Label62: TLabel;
    Label63: TLabel;
    edGrag: TDBLookupComboboxEh;
    DokumentPRICH_UST: TMemoField;
    DokumentRN_GT_B_GOROD: TStringField;
    edDateUst: TDBDateTimeEditEh;
    Label69: TLabel;
    edNomerUst: TDBEditEh;
    Label72: TLabel;
    edDateOtm: TDBDateTimeEditEh;
    Label71: TLabel;
    edNomerOtm: TDBEditEh;
    Label74: TLabel;
    DokumentDATE_OTST: TDateField;
    DokumentOTMETKA: TMemoField;
    DokumentPLACE_WORK: TStringField;
    edPlaceWork: TDBEditEh;
    Label65: TLabel;
    DokumentNOMER_PR: TStringField;
    DokumentPRICH_OTST: TMemoField;
    DokumentNOMER_OTST: TStringField;
    TBSeparatorItem1: TTBSeparatorItem;
    edVid: TDBComboBoxEh;
    DokumentREG_UST: TBooleanField;
    DokumentREG_OTM: TBooleanField;
    DokumentREG_OTST: TBooleanField;
    DokumentINTERNAT: TIntegerField;
    DokumentINTERNAT_DATE: TDateField;
    DokumentLONELY: TBooleanField;
    Label59: TLabel;
    edInternatDate: TDBDateTimeEditEh;
    Label60: TLabel;
    edInternat: TDBLookupComboboxEh;
    dsInternat: TDataSource;
    cbLONELY: TDBCheckBoxEh;
    DokumentTWO: TBooleanField;
    cbTwo: TDBCheckBoxEh;
    gbSuprug: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label84: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label92: TLabel;
    edONA_Familia: TDBEditEh;
    edONA_Name: TDBEditEh;
    edONA_Otch: TDBEditEh;
    edONA_DateR: TDBDateTimeEditEh;
    edONA_GRAG: TDBLookupComboboxEh;
    edONA_WORK: TDBEditEh;
    edONA_IDENTIF: TDBEditEh;
    edONA_POL: TDBComboBoxEh;
    DokumentONA_STATUS: TStringField;
    DokumentONA_IDENTIF: TStringField;
    DokumentONA_Familia: TStringField;
    DokumentONA_POL: TStringField;
    DokumentONA_Name: TStringField;
    DokumentONA_Otch: TStringField;
    DokumentONA_DateR: TDateField;
    DokumentONA_GRAG: TIntegerField;
    DokumentONA_B_RESP: TBooleanField;
    DokumentONA_GOSUD: TIntegerField;
    DokumentONA_B_OBL: TBooleanField;
    DokumentONA_OBL: TStringField;
    DokumentONA_RAION: TStringField;
    DokumentONA_B_GOROD: TSmallintField;
    DokumentRN_ONA_B_GOROD: TStringField;
    DokumentONA_GOROD: TStringField;
    DokumentONA_GOROD_R: TStringField;
    DokumentONA_DOM: TStringField;
    DokumentONA_KORP: TStringField;
    DokumentONA_KV: TStringField;
    DokumentONA_WORK: TStringField;
    DokumentDATE_OSV: TDateField;
    DokumentNOMER_OSV: TStringField;
    DokumentADD_DOK: TMemoField;
    edPrich: TDBEditEh;
    DokumentREG_OSV: TBooleanField;
    TBItemStep2: TTBItem;
    DokumentKOMM: TMemoField;
    Label79: TLabel;
    edKomm: TDBEditEh;
    TBItemChOpeka: TTBItem;
    Bevel1: TBevel;
    tsSud: TTabSheet;
    GridRS: TDBGridEh;
    dsReshSud: TDataSource;
    cbType: TComboBox;
    edPrichChild: TDBLookupComboboxEh;
    dsSprChildPrich: TDataSource;
    lbDateEditGIS: TvchDBText;
    lbDatePostGIS: TvchDBText;
    Bevel2: TBevel;
    DokumentUST_ORG: TStringField;
    N_F_cbOtheOrg: TDBCheckBoxEh;
    DokumentUST_OTHER: TBooleanField;
    DokumentDOC_OPEKA: TIntegerField;
    N_F_edDocOpeka: TDBComboBoxEh;
    StaticText1: TStaticText;
    DokumentUST_ORG_SPR: TStringField;
    edUstOrg: TDBEditEh;
    DokumentUST_ORG_TYPE: TIntegerField;
    N_F_cbMinTrud: TDBCheckBoxEh;
    DokumentIS_MINTRUD: TBooleanField;
    N_F_cbIsControl: TDBCheckBoxEh;
    DokumentIS_CONTROL: TBooleanField;
    TBItemCreatePopech18: TTBItem;
    edOtmOrg: TDBEditEh;
    N_F_edDocOpekaO: TDBComboBoxEh;
    Bevel3: TBevel;
    Label64: TLabel;
    DokumentOTM_ORG: TStringField;
    DokumentOTM_ORG_SPR: TIntegerField;
    DokumentOTM_ORG_TYPE: TIntegerField;
    DokumentOTM_OTHER: TBooleanField;
    DokumentDOC_OPEKA_OTM: TIntegerField;
    DokumentDATEDOK_UST: TDateField;
    DokumentDATEDOK_SN: TDateField;
    DokumentTYPE_SN: TSmallintField;
    N_F_edTypeSn: TDBComboBoxEh;
    edDateDokUst: TDBDateTimeEditEh;
    Label8: TLabel;
    Label61: TLabel;
    edDateDokSn: TDBDateTimeEditEh;
    lbDokToText: TLabel;
    DokumentVERNO: TBooleanField;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edFamiliaDoCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
    procedure edOBL_RNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edRaion_RNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2ustClick(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edMAT_FAMILIAEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edStudentSprEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edTipChange(Sender: TObject);
    procedure edVidChange(Sender: TObject);
    procedure TBItemStep2otmClick(Sender: TObject);
    procedure TBItemStep2otstClick(Sender: TObject);
    procedure edInternatEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cbTwoClick(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure TBItemChOpekaClick(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
    procedure GridRSGetCellParams(Sender: TObject; Column: TColumnEh;   AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure edPrichChildEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure lbDateEditGISGetText(Sender: TObject; var Text: String);
    procedure lbDatePostGISGetText(Sender: TObject; var Text: String);
    procedure edUstOrgEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edUstOrgEditButtons1Click(Sender: TObject;    var Handled: Boolean);
    procedure edUstOrgEditButtons2Click(Sender: TObject;    var Handled: Boolean);
    procedure edUstOrgEditButtons3Click(Sender: TObject;    var Handled: Boolean);
    procedure TBItemCreatePopech18Click(Sender: TObject);
    procedure GisunCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
    procedure NomerCheckDrawRequiredState(Sender: TObject;   var DrawState: Boolean);
    procedure edUstOrgCheckDrawRequiredState(Sender: TObject;      var DrawState: Boolean);
    procedure edOtmOrgEditButtons0Click(Sender: TObject;           var Handled: Boolean);
    procedure edOtmOrgCheckDrawRequiredState(Sender: TObject;      var DrawState: Boolean);
    procedure edOtmOrgEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure edOtmOrgEditButtons2Click(Sender: TObject;      var Handled: Boolean);
    procedure edOtmOrgEditButtons3Click(Sender: TObject;      var Handled: Boolean);
    procedure N_F_edDocOpekaOCheckDrawRequiredState(Sender: TObject;     var DrawState: Boolean);
    procedure N_F_edDocOpekaCheckDrawRequiredState(Sender: TObject;      var DrawState: Boolean);
    procedure N_F_edTypeSnChange(Sender: TObject);
    procedure edDateOtmCheckDrawRequiredState(Sender: TObject;      var DrawState: Boolean);
    procedure edDateDokUstCheckDrawRequiredState(Sender: TObject;   var DrawState: Boolean);
    procedure edDateDokSnCheckDrawRequiredState(Sender: TObject;    var DrawState: Boolean);
    procedure lbDokToTextGetText(Sender: TObject; var Text: String);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    FShowRequired:Boolean;
    TbItemVerno : TTbItem;
    colorResh:TColor;
    TypeRegistr:Integer;
    procedure CheckValueSvid;
    function BeforeReport:Boolean; override;
    function CreateSubMenuRun: Boolean; override;
    function WriteDok : Boolean; override;
    procedure WriteReg;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
    function DokumentToText:String;
//    function GetNameReport : String; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure UpdateActions; override;
    function BeforeEdit : Boolean; override;
    function GetTypeOpeka(var lNotD:Boolean; var lChild:Boolean): Integer;
    function GetTypeDate:Integer;
    procedure CheckCaption;
    procedure WriteAfterRegister_GISUN; override;
    function GetAddPROP(sProp:String):Variant; override;
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure CheckControl;
    function FieldForNomerDok(var fldDate:TField):TField;

    procedure InvalidateAllNomer;
    procedure CheckControlDok(nTypeSn:Integer);
    procedure ClearOrgOtm;
    procedure Event_InfoTrue(Sender: TObject);

    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;

  end;

  function EditZapisOpeka( nID : Integer; slPar:TStringList) : Boolean;

var
  fmZapisOpeka: TfmZapisOpeka;

implementation

uses fMain, fChoiceNasel,
     {$IFDEF OPEKA} fChSS_Opeka, {$ENDIF}
     fShablon;

{$R *.DFM}
{$I Task.inc}

const
  MAX_REC=20;

function EditZapisOpeka( nID : Integer; slPar:TStringList) : Boolean;
begin
//  Result := true;
  fmZapisOpeka := TfmZapisOpeka.Create(nil);
  fmZapisOpeka.AssignPar(slPar);
  try
    fmZapisOpeka.IsReadDokument:=true;
    if nID=-1 then begin
      fmZapisOpeka.NewDok(true);
      fmZapisOpeka.SetIDZags;
      fmZapisOpeka.TBItemChOpeka.Enabled:=true;
//      fmZapisOpeka.CheckEnabledNameOrgan(true);
    end else begin
      fmZapisOpeka.ReadDok( nID );
      fmZapisOpeka.TBItemZAGS.Visible:=false;
      fmZapisOpeka.TBItemChOpeka.Enabled:=false;
//      fmZapisOpeka.CheckEnabledNameOrgan(false);
    end;
    fmZapisOpeka.IsReadDokument:=false;
    {$IFDEF GISUN}
      fmZapisOpeka.CheckAkt_GISUN(0);
//      Gisun.CheckAdopt(fmZapisAdopt);
//      fmZapisAdopt.CheckImageGisun(fmZapisAdopt.DokumentPOLE_GRN,fmZapisAdopt.ImageGISUN);
      fmZapisOpeka.BeforeEditFormGISUN;
    {$ENDIF}
    fmZapisOpeka.CheckCaption;
    Result := fmZapisOpeka.EditModal;
  finally
    fmZapisOpeka.Free;
    fmZapisOpeka := nil;
  end;
end;

{ TfmZapisOpeka }

constructor TfmZapisOpeka.Create(Owner: TComponent);
var
  n:Integer;
  d2xml:TDataSet2XML;
begin
  inherited;
  if not Dokument.Active   then Dokument.Active:=true;
  if not tbReshSud.Active  then tbReshSud.Active:=true;
//  colorResh:=$00FEF9E7;
  colorResh:=clWindow;
  GridRS.Color:=clInfoBk;

  edUstOrg.EditButtons[edUstOrg.EditButtons.Count-1].Glyph:=ImBtClear.Picture.Bitmap;
  edOtmOrg.EditButtons[edUstOrg.EditButtons.Count-1].Glyph:=ImBtClear.Picture.Bitmap;

  {$IFDEF LAIS}
    FShowRequired:=true;
    edPrichChild.Visible:=false;
    edPrichChildLais.Left:=edPrichChild.Left;
    edPrichChildLais.Width:=edAddDok.Width;
    N_F_cbMinTrud.Visible:=false;
  {$ELSE}
    FShowRequired:=Globaltask.ParamAsBoolean('SHOW_REQ');
    edPrichChildLais.Visible:=false;
    edPrichChild.Width:=edAddDok.Width;
    dsSprChildPrich.DataSet:=dmBase.SprChildPrich;
    dsStudentSpr.DataSet:=dmBase.SprUchZaved;
    N_F_cbMinTrud.Visible:=true;
  {$ENDIF}
  TypeRegistr:=0;
  edDateUst.Color:=colorResh;
  edDateOtm.Color:=colorResh;
  FShowOrgCaption:=false;
  FCheckLookupField:=false;   // так как все поля (область,район,город) переделаны на DbEditEh.MRUList;
  FDokZAGS:=false;
  FDokRegister:=true;
  TypeObj := _TypeObj_Opeka;
  FUpdatingObj:=GetUpdatingObj(TypeObj);

//  d2xml:=ds2xml.DS_Add(Dokument,true);
//  d2xml.FClearRecord:=false;
//  d2xml.FWriteNull:=false;
//  d2xml.SetWriteFields('VERNO');
  ds2xml.DS_Add(tbReshSud,false);

  SetLength(FArrChoiceRekv,30);
  n:=0;
  {$IFNDEF LAIS}
  FArrChoiceRekv[n].nType:=SHABLON_PRICH_DOK;
  FArrChoiceRekv[n].nTypeSpr:=0;
  FArrChoiceRekv[n].FieldName:='ADD_DOK';
  Inc(n,1);

  FArrChoiceRekv[n].nType:=SHABLON_PRICH_OTM;
  FArrChoiceRekv[n].nTypeSpr:=0;
  FArrChoiceRekv[n].FieldName:='PRICH_OTM';
  Inc(n,1);
  {$ENDIF}
  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_WORK;
  FArrChoiceRekv[n].FieldName:='ON_WORK';
  Inc(n,1);

  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_WORK;
  FArrChoiceRekv[n].FieldName:='PLACE_WORK';
  Inc(n,1);

  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_WORK;
  FArrChoiceRekv[n].FieldName:='MAT_WORK';
  Inc(n,1);

  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_WORK;
  FArrChoiceRekv[n].FieldName:='OTEC_WORK';
  Inc(n,1);

  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[n].FieldName:='GT_GOROD_R';
  Inc(n,1);

  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[n].FieldName:='OTEC_GOROD_R';
  Inc(n,1);

  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[n].FieldName:='MAT_GOROD_R';
  Inc(n,1);

  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[n].FieldName:='ON_GOROD_R';
  SetLength(FArrChoiceRekv,n+1);

  AddButton_LoadIdentif(ENG_edIDENTIF);
  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edMAT_IDENTIF);
  AddButton_LoadIdentif(ENG_edOTEC_IDENTIF);

  FAutoNum := false; //IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisOpeka;
  Dokument.Open;
  dsGragd.DataSet := dmBase.SprGragd;
  FPageControl := pc;
  pc.ActivePageIndex:=0;
//  fmMain.SetCurrentDokument(Dokument);

//  edONA_Familia.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;
//  edFamiliaDo.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;

//  edFamilia.EditButtons.Items[0].Visible:=true;
//  edCopy.Visible := false;
//  N_F_cbPovtor.Visible := false;

  edFamilia.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateData;
  edOtch.OnUpdateData:=FIOUpdateData;

  edOTEC_Familia.OnUpdateData:=FIOUpdateData;
  edOTEC_Name.OnUpdateData:=FIOUpdateData;
  edOTEC_Otch.OnUpdateData:=FIOUpdateData;

  edMAT_Familia.OnUpdateData:=FIOUpdateData;
  edMAT_Name.OnUpdateData:=FIOUpdateData;
  edMAT_Otch.OnUpdateData:=FIOUpdateData;

  edON_Familia.OnUpdateData:=FIOUpdateData;
  edON_Name.OnUpdateData:=FIOUpdateData;
  edON_Otch.OnUpdateData:=FIOUpdateData;

  ENG_edOn_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edOtec_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edMat_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edIdentif.OnUpdateData:=IN_UpdateData;

  {$IFDEF GISUN}
  if IsActiveGISUN then
    SetControlCharCase(ecUpperCase,
      [
        edFamilia, edName, edOtch,
        edOTEC_Familia, edOTEC_Name, edOTEC_Otch, edMAT_Familia, edMAT_Name, edMAT_Otch,
        edON_Familia, edON_Name, edON_Otch
      ]);
  {$ENDIF}

  edRG_GOROD.OnUpdateData:=CityUpdate;
  edGT_GOROD.OnUpdateData:=CityUpdate;
  edOTEC_GOROD.OnUpdateData:=CityUpdate;
  edMAT_GOROD.OnUpdateData:=CityUpdate;
  edON_GOROD.OnUpdateData:=CityUpdate;

  n:=0;
  SetLength(FArrAddProperty,n);
  // в творительном падеже
//  SetAddProperty(0, 'OTHER', '', ftMemo);
//  SetAddProperty(1, 'IZMEN', '', ftMemo);

  SetcbBel(N_F_cbBelorus);

//  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
//    TBItemAddHist.Visible:=true;
//    TBItemHist.Visible:=true;
//  end;

  SetLength(FArrCheckBelField,0);
//  WriteToArrCheck(0,  1, false, 'OBL_DO'      , 'OBL_DO_B');
//  WriteToArrCheck(1,  2, false, 'RAION_DO'    , 'RAION_DO_B');
//  WriteToArrCheck(2,  3, true, 'GOROD_DO'    , 'GOROD_DO_B');

  SetLength(FArrCheckField,0);
  {
  WriteToArrCheck(0,  1, false, 'OBL_POSLE'   );
  WriteToArrCheck(1,  2, false, 'RAION_POSLE' );
  }

  FRegisterNotRequired:=true;  // доступно "взаимодействие с ГИС РН не требуется"
  AddSubmenu_NotRequired;

  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := IsActiveGISUN;
    // з/а об усыновлении не проводиться в регистре
    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN;
    TBItemGetDataGISUN.Visible:=IsActiveGISUN;   // для доступности запроса данных
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
  TBItemHistCorr.Visible:=FUpdatingObj;
end;

function TfmZapisOpeka.CreateSubMenuRun: Boolean;
var
 it : TTbItem;
// sep : TTbSeparatorItem;
begin
//  inherited CreateSubmenuRun;
  NotStdSubmenuRun;
  Result:=true;
  TbItemVerno := TTbItem.Create(TBSubmenuRun);
  TbItemVerno.Caption:='Информация верна';
  TbItemVerno.OnClick:=Event_InfoTrue;
  TBSubmenuRun.Add(TbItemVerno);
end;

procedure TfmZapisOpeka.Event_InfoTrue(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  DokumentVERNO.AsBoolean:=TTbItem(Sender).Checked;
end;

function TfmZapisOpeka.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_Opeka); //
end;
{
procedure TfmZapisAdopt.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
end;
}

function TfmZapisOpeka.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentPOVTOR.AsBoolean:=false;
  DokumentTWO.AsBoolean :=false;
  DokumentFIRST_EKZ.AsBoolean:=true;
  DokumentPOL.AsString:='М';
  DokumentRG_B_RESP.AsBoolean:=true;
  DokumentRG_B_OBL.AsBoolean:=true;
  DokumentON_B_RESP.AsBoolean:=true;
  DokumentON_B_OBL.AsBoolean:=true;
  DokumentOTEC_B_RESP.AsBoolean:=true;
  DokumentOTEC_B_OBL.AsBoolean:=true;
  DokumentMAT_B_RESP.AsBoolean:=true;
  DokumentMAT_B_OBL.AsBoolean:=true;
  DokumentREG_UST.AsBoolean:=false;
  DokumentREG_OTM.AsBoolean:=false;
  DokumentREG_OTST.AsBoolean:=false;
  DokumentREG_OSV.AsBoolean:=false;
  DokumentUST_OTHER.AsBoolean:=false;
  DokumentDOC_OPEKA.AsInteger:=DOC_OPEKA_RESH;
  DokumentDOC_OPEKA_OTM.AsInteger:=DOC_OPEKA_RESH;
  DokumentIS_CONTROL.AsBoolean:=true;
  DokumentTYPE_SN.AsInteger:=1;
  DokumentVERNO.AsBoolean:=false;   // true=запись акта верна

  inherited NewDok(lAppend);

  CheckControl;
  lbDokToText.Caption:='Документ ГИС РН: '+DokumentToText;
  QueryExit:=false;
  Result := true;
end;

function TfmZapisOpeka.ReadDok(nID: Integer): Boolean;
var
  i,nType : Integer;
  fld : TField;
  strField : String;
  rSpr:TRecSprGISUN;
//  arr : TArrStrings;
//  sl  : TStringList;
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
  ReadDopProperty(_TypeObj_Opeka, DokumentID.AsInteger,   STOD('1899-12-30',tdAds));
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentLONELY.IsNull then DokumentLONELY.AsBoolean:=false;
  if DokumentTWO.IsNull then DokumentTWO.AsBoolean:=false;
  if DokumentUST_OTHER.IsNull then DokumentUST_OTHER.AsBoolean:=false;
  if DokumentDOC_OPEKA.IsNull then DokumentDOC_OPEKA.AsInteger:=DOC_OPEKA_RESH;
  if DokumentDOC_OPEKA_OTM.IsNull then DokumentDOC_OPEKA_OTM.AsInteger:=DOC_OPEKA_RESH;
  if DokumentVERNO.IsNUll then DokumentVERNO.AsBoolean:=false;

  if DokumentTYPE_SN.AsInteger=0 then begin
    if not DokumentDATE_OTM.IsNull then begin
      DokumentTYPE_SN.AsInteger:=1;   // прекращение
    end else if not DokumentDATE_OSV.IsNull then begin
      DokumentTYPE_SN.AsInteger:=2;   // освобождение
      DokumentDATE_OTM.AsDateTime:=DokumentDATE_OSV.AsDateTime;
    end else if not DokumentDATE_OTST.IsNull then begin
      DokumentTYPE_SN.AsInteger:=3;  // отстранение
      DokumentDATE_OTM.AsDateTime:=DokumentDATE_OTST.AsDateTime;
    end else begin
      DokumentTYPE_SN.AsInteger:=1;
    end;
  end;
  if DokumentIS_MINTRUD.IsNull then DokumentIS_MINTRUD.AsBoolean:=false;
  if DokumentIS_CONTROL.IsNull then
    if (DokumentVID.AsInteger=VID_OPEKA_DO14) or (DokumentVID.AsInteger=VID_POPECH_DO18)
       then DokumentIS_CONTROL.AsBoolean:=true
       else DokumentIS_CONTROL.AsBoolean:=false;

  ds2xml.StringToXML(FMainTable.FieldByName('ADD_FIELDS').AsString);
  ds2xml.XMLToData;
  tbReshSud.First;

  {$IFDEF OPEKA}
  if (DokumentUST_ORG_SPR.AsString<>'') and (DokumentUST_ORG_TYPE.AsInteger<>0) then begin
    rSpr:=Locate_AllSprGISUN(DokumentUST_ORG_TYPE.AsInteger, DokumentUST_ORG_SPR.AsString);
    if rSpr.Ok then begin
      DokumentUST_ORG.AsString:=rSpr.Lex1;
    end else begin
      DokumentUST_ORG.AsString:='организация с кодом '+DokumentUST_ORG_SPR.AsString+'('+DokumentUST_ORG_TYPE.AsString+') не найдена';
    end;
  end;
  if (DokumentOTM_ORG_SPR.AsString<>'') and (DokumentOTM_ORG_TYPE.AsInteger<>0) then begin
    rSpr:=Locate_AllSprGISUN(DokumentOTM_ORG_TYPE.AsInteger, DokumentOTM_ORG_SPR.AsString);
    if rSpr.Ok then begin
      DokumentOTM_ORG.AsString:=rSpr.Lex1;
    end else begin
      DokumentOTM_ORG.AsString:='организация с кодом '+DokumentOTM_ORG_SPR.AsString+'('+DokumentOTM_ORG_TYPE.AsString+') не найдена';
    end;
  end;
  {$ENDIF}

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}


  AdditiveReadDok;

  Dokument.Post;
  ReadHistory(nID, _TypeObj_Opeka);
  CheckControl;
  TbItemVerno.Checked := DokumentVERNO.AsBoolean;
  InvalidateAllNomer;

  //  {$IFDEF ZAGS}
//  ReadListRepeat( dmBase.TypeObj_ZAdopt, DokumentID.AsInteger);
//  {$ENDIF}
end;

//----------------------------------------------
procedure TfmZapisOpeka.WriteReg;
var
  nID:Integer;
  lOk:Boolean;
begin
  if DokumentID.AsInteger>-1 then begin
    nID := DokumentID.AsInteger;
    lOk:=false;
    if nID=FMainTable.FieldByName('ID').AsInteger then begin
      lOk:=true;
    end else begin
      if FMainTable.Locate('ID', nID, []) then begin
        lOk:=true;
      end;
    end;
    if lOk then begin
      FMainTable.Edit;
      FMainTable.FieldByName('REG_UST').AsBoolean:=DokumentREG_UST.AsBoolean;
      FMainTable.FieldByName('REG_OTM').AsBoolean:=DokumentREG_OTM.AsBoolean;
      FMainTable.FieldByName('REG_OTST').AsBoolean:=DokumentREG_OTST.AsBoolean;
      FMainTable.FieldByName('REG_OSV').AsBoolean:=DokumentREG_OSV.AsBoolean;
      FMainTable.Post;
    end;
  end;
end;
//----------------------------------------------
function TfmZapisOpeka.CheckDateEditGIS:Boolean;
var
  fldNomer,fldDate:TField;
begin
  if (DokumentDATEZ.AsString<>FMainTable.FieldByName('DATEZ').AsString) or
     (DokumentNOMER_UST.AsString<>FMainTable.FieldByName('NOMER_UST').AsString) or
     (DokumentDATE_OTM.AsString<>FMainTable.FieldByName('DATE_OTM').AsString) or
     (DokumentNOMER_OTM.AsString<>FMainTable.FieldByName('NOMER_OTM').AsString) or
     (DokumentTYPE_SN.AsInteger<>FMainTable.FieldByName('TYPE_SN').AsInteger) or
//     (DokumentDATE_OSV.AsString<>FMainTable.FieldByName('DATE_OSV').AsString) or
//     (DokumentDATE_OTST.AsString<>FMainTable.FieldByName('DATE_OTST').AsString) or
     (DokumentVID.AsString<>FMainTable.FieldByName('VID').AsString) or
     (DokumentIDENTIF.AsString<>FMainTable.FieldByName('IDENTIF').AsString) or
     (DokumentON_IDENTIF.AsString<>FMainTable.FieldByName('ON_IDENTIF').AsString) or
     (DokumentDOC_OPEKA.AsString<>FMainTable.FieldByName('DOC_OPEKA').AsString) or
     (DokumentDATEDOK_UST.AsString<>FMainTable.FieldByName('DATEDOK_UST').AsString) or
     (DokumentDATEDOK_SN.AsString<>FMainTable.FieldByName('DATEDOK_SN').AsString) or
     (DokumentUST_ORG_TYPE.AsString<>FMainTable.FieldByName('UST_ORG_TYPE').AsString) or
     (DokumentUST_ORG_SPR.AsString<>FMainTable.FieldByName('UST_ORG_SPR').AsString) or
     (DokumentDOC_OPEKA_OTM.AsString<>FMainTable.FieldByName('DOC_OPEKA_OTM').AsString) or
     (DokumentOTM_ORG_TYPE.AsString<>FMainTable.FieldByName('OTM_ORG_TYPE').AsString) or
     (DokumentOTM_ORG_SPR.AsString<>FMainTable.FieldByName('OTM_ORG_SPR').AsString)
   then Result:=true
   else Result:=false;
  if not Result then begin
    fldNomer:=FieldForNomerDok(fldDate);
    if (fldNomer.AsString<>FMainTable.FieldByName(fldNomer.FieldName).AsString)
      then Result:=true;
  end;
end;
//----------------------------------------------
function TfmZapisOpeka.WriteDok: Boolean;
var
  i, nID, n : Integer;
  fld : TField;
  sSeria,sNomer,sRukov,sRukovB,strField, strErr : String;
  vKeyValues : Variant;
  {$IFNDEF ZAGS}
  dLastSost : TDateTime;
  {$ENDIF}
  nIdChild, nNomer : Integer;
  s : String;
  dUst,dDate : TDateTime;
  lVerno, lFullWrite : Boolean;
  arr:TArrStrings;
  procedure AddErr(s:String); begin  strErr:=strErr+s+chr(13)+chr(10); end;
begin
  Dokument.CheckBrowseMode;
  AdditiveBeforeWriteDok;
  
  lVerno:=DokumentVERNO.AsBoolean;
  Result := true;
  lFullWrite:=true;   // полная запись актовой записи
  sSeria:='';
  sNomer:='';
  sRukov:='';
  sRukovB:='';
  //--------------- проверка на ошибки ввода -------------
  Result:=inherited CheckDokumentSimple(0, true);
  strErr:=FLastError;
  if (DokumentDATER.AsString='') then  AddErr(' Заполните дату рождения. ');
  if DokumentPOL.AsString=''     then  AddErr(' Заполните пол. ');
  if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then  AddErr(' Заполните Фамилию, Имя. ');
  if (DokumentVID.AsString='') then    AddErr(' Вид опеки. ');
//???  if (DokumentTIP.AsString='') then    AddErr(' Сирота или без попечения. ');
  if DokumentDATEZ.IsNull
    then dUst:=0
    else dUst:=DokumentDATEZ.AsDateTime;
  if (DokumentVID.AsString<>'') and  not DokumentDATER.IsNull and not lVerno then begin
    dDate:=DokumentDATER.AsDateTime;
    if not DokumentDATEZ.IsNull then begin
      n:=GetCountYear( DokumentDATEZ.AsDateTime, dDate);
      if (DokumentVID.AsInteger=VID_OPEKA_DO14)  and (n>14) then AddErr(' На день установления больше 14 лет. ');
      if (DokumentVID.AsInteger=VID_POPECH_DO18) and (n>18) then AddErr(' На день установления больше 18 лет. ');
// !!! опека до 14 переходит в попечительство до 18 без принятия решения !!!
//    if (DokumentVID.AsInteger=VID_POPECH_DO18) and (n<14) then AddErr(' На день установления меньше 14 лет. ');
      if dDate>DokumentDATEZ.AsDateTime then AddErr(' Дата рождения больше даты установления. ');
    end;
    if not DokumentDATE_OTM.IsNull and (dDate>DokumentDATE_OTM.AsDateTime) then AddErr(' Дата рождения больше даты прекращения. ');
//    if not DokumentDATE_OTST.IsNull and (dDate>DokumentDATE_OTST.AsDateTime) then AddErr(' Дата рождения больше даты отстранения. ');
  end;
  if not lVerno and not DokumentDATE_OTM.IsNull  and (dUst>0) and (dUst>DokumentDATE_OTM.AsDateTime) then AddErr(' Дата установления больше даты прекращения. ');
//  if not DokumentDATE_OSV.IsNull  and (dUst>0) and (dUst>DokumentDATE_OSV.AsDateTime) then AddErr(' Дата установления больше даты освобождения. ');
//  if not DokumentDATE_OTST.IsNull and (dUst>0) and (dUst>DokumentDATE_OTST.AsDateTime) then AddErr(' Дата установления больше даты отстранения. ');
  if not DokumentDATE_OTM.IsNull and (DokumentTYPE_SN.AsInteger=0) then AddErr(' Тип прекращения опеки. ');

//  if DokumentDOC_OPEKA.IsNull then AddErr(' Выберите приказ или решение. ');
  if (DokumentTIP.AsString<>'') and (DokumentFORMA.AsString='') then  AddErr(' Форма опеки (попечительства). ');

  {$IFDEF OPEKA}
    n:=GlobalTask.ParamAsInteger('CHECK_DOC_OPEKA');   // Контроль ввода организации установившей опеку
//  [KEY_GIS_SPR133]   4=решение   8=приказ
    if (((n=1) and (DokumentDOC_OPEKA.AsInteger=8)) or (n=2)) and (DokumentUST_ORG_SPR.AsString='') then begin
      AddErr(' Выберите организацию установившую опеку. ');
    end;
  {$ENDIF}

  if (strErr='') then begin
  {  Result:=dmBase.CheckNomerAkt(_TypeObj_Opeka, DokumentID_ZAGS.AsInteger,
                   DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime);
    if not Result then exit;}
  end;
  nNomer:=-1;

  {$IFDEF OPEKA}
  if (strErr='') and GlobalTask.DemoVersion then begin
    if (FMainTable.RecordCount >= MAX_REC)  then begin
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
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    FMainTable.Append;
    FMainTable.Post;
    nID := FMainTable.FieldByName('ID').AsInteger;
    nNomer := FMainTable.FieldByName('ID').AsInteger;
    GlobalTask.SetLastValueAsInteger('DEF_OPEKA', DokumentVID.AsInteger);
  end else begin
    nID := DokumentID.AsInteger;
    nNomer := DokumentID.AsInteger;
    if not FMainTable.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    FMainTable.Edit;

    FCheckEditGIS:=CheckDateEditGIS;  // функция д.б. своя для каждого типа документа !!!

    if lFullWrite then begin
      for i:=1 to FMainTable.FieldCount-1 do begin
        strField := FMainTable.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          FMainTable.Fields[i].Value := fld.Value;
        end;
      end;
      if FMainTable.FieldByName('TYPE_SN').IsNull
        then FMainTable.FieldByName('TYPE_SN').AsInteger:=0;
      FMainTable.FieldByName('NOMER').AsInteger:=nNomer;
      WriteDopProperty(_TypeObj_Opeka, DokumentID.AsInteger, STOD('1899-12-30',tdAds));

      WriteHistory(nID, _TypeObj_Opeka);

      {$IFDEF GISUN}
        WriteMessageID;
      {$ENDIF}

    end;

    if ds2xml.DataToXML then begin
      FMainTable.FieldByName('ADD_FIELDS').AsString:=ds2xml.XMLToString;
    end else begin
      PutError(ds2xml.LastError,self);
    end;

    WriteForAllDok_BeforePost;

    if FCheckEditGIS
      then FMainTable.FieldByName('DATE_EDIT_GIS').AsDateTime:=Now;

    FMainTable.Post;

    AdditiveWriteDok;


//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);
    QueryExit:=false;
    Result := true;
    {
    if FCheckBelName and FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentFamiliaDo.AsString, DokumentFamiliaDo_B.AsString);
      dmBase.CheckBelFamily( DokumentFamiliaPosle.AsString, DokumentFamiliaPosle_B.AsString);
      WriteForAll_Bel;
    end;
    }

    if Result then QueryExit:=false;
  end;
  if Result then FlushBuffers;
end;

procedure TfmZapisOpeka.WriteAfterRegister_GISUN;
begin
  FMainTable.FieldByName('REG_UST').AsBoolean:=DokumentREG_UST.AsBoolean;
  FMainTable.FieldByName('REG_OTM').AsBoolean:=DokumentREG_OTM.AsBoolean;
  FMainTable.FieldByName('REG_OTST').AsBoolean:=DokumentREG_OTST.AsBoolean;
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

procedure TfmZapisOpeka.dsDokumentDataChange(Sender: TObject;  Field: TField);
var
  l:Boolean;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    FRun := true;
//    strField:=UpperCase(Field.FieldName);
    if Pos(Field.FieldName, 'TYPE_SN;DATEDOK_UST;DATEDOK_SN;DATEZ;DATE_OTM;NOMER_UST;NOMER_OTM;UST_ORG;OTM_ORG;UST_ORG_SPR;OTM_ORG_SPR;')>0 then begin
      if (Field.FieldName='DATE_OTM') then begin
        if (Field.AsString='') then begin
          DokumentNOMER_OTM.AsString:='';
          DokumentDATEDOK_SN.AsString:='';
          ClearOrgOtm;
        end;
      end;
      InvaliDateAllNomer;
    end;
    FRun := false;
  end;
end;
procedure TfmZapisOpeka.UpdateActions;
begin
  inherited;
end;

procedure TfmZapisOpeka.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

destructor TfmZapisOpeka.Destroy;
begin
  try
    dmBase.AllSprGISUN.CancelRange;
  except
  end;
  DestroyHint(H);
  inherited;
end;

procedure TfmZapisOpeka.edFamiliaDoCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmZapisOpeka.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
 // AddSvid;
end;

procedure TfmZapisOpeka.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZapisOpeka.edOBL_RNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisOpeka.edRaion_RNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisOpeka.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
{$ENDIF}
end;

procedure TfmZapisOpeka.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  Dokument.CheckBrowseMode;
//  if DokumentDATEZ.IsNull щк then begin
//    PutError('Заполните дату установления',self);
//  end else begin
    TypeRegistr:=0;   // !!!
    try
      RegisterAkt_GISUN(0);
    finally
      TypeRegistr:=0;
    end;
//  end;
{$ENDIF}
end;

procedure TfmZapisOpeka.TBItemStep2ustClick(Sender: TObject);
begin
{$IFDEF GISUN}
  Dokument.CheckBrowseMode;
  if DokumentDATEZ.IsNull then begin
    PutError('Заполните дату установления',self);
  end else begin
    TypeRegistr:=1;   // !!!
    try
      RegisterAkt_GISUN(0);
    finally
      TypeRegistr:=0;
    end;
  end;
{$ENDIF}
end;

procedure TfmZapisOpeka.TBItemStep2otmClick(Sender: TObject);
begin
{$IFDEF GISUN}
  Dokument.CheckBrowseMode;
  if DokumentDATE_OTM.IsNull then begin
    PutError('Заполните дату прекращения',self);
  end else begin
    TypeRegistr:=2;   // !!!
    try
      RegisterAkt_GISUN(0);
    finally
      TypeRegistr:=0;
    end;
  end;
{$ENDIF}
end;

procedure TfmZapisOpeka.TBItemStep2otstClick(Sender: TObject);
begin
{$IFDEF GISUN}
{
  Dokument.CheckBrowseMode;
  if DokumentDATE_OTST.IsNull then begin
    PutError('Заполните дату отстранения',self);
  end else begin
    TypeRegistr:=3;   // !!!
    try
      RegisterAkt_GISUN(0);
    finally
      TypeRegistr:=0;
    end;
  end;
  }
{$ENDIF}
end;

procedure TfmZapisOpeka.pcChange(Sender: TObject);
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
end;

procedure TfmZapisOpeka.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 13);
end;

procedure TfmZapisOpeka.edMAT_FAMILIAEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
//
end;

function TfmZapisOpeka.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edRG_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edGT_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edOTEC_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edMAT_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edON_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edRG_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edGT_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edOTEC_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edMAT_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRG_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edGT_RAION,n,2,true,false,false,FAddButtonMRUList);

  SetMRUList(edOTEC_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edMAT_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_RAION,n,2,true,false,false,FAddButtonMRUList);

end;

//----------------------------------------------------------------------------------
procedure TfmZapisOpeka.CheckValueSvid;
begin
end;

function TfmZapisOpeka.BeforeReport: Boolean;
begin
  Result:=inherited BeforeReport;
  if Result then begin
    CheckForAll_Bel( nil );
    CheckValueSvid;
  end;
end;

//------------------------------------------------------------------------
procedure TfmZapisOpeka.CheckControl;
var
 s:String;
begin
  {$IFDEF GISUN}
    if GisunOk(FPoleGRN) then begin // если зарегистрировали
      edVid.ReadOnly:=true;
      edVid.Color:=GetDisableColor;
    end else begin
      edVid.ReadOnly:=false;
      edVid.Color:=GetControlColor;
    end;
  {$ELSE}
//    edVid.ReadOnly:=false;
//    edVid.Color:=GetControlColor;
  {$ENDIF}
  pnAdd.Visible:=CheckAddPanel(s);
  {$IFDEF LAIS}
    TBItemCreatePopech18.Visible:=false;
  {$ELSE}
    TBItemCreatePopech18.Enabled:=((DokumentID.AsInteger>0) and not FAddNewDok and (DokumentVID.AsInteger=VID_OPEKA_DO14));
  {$ENDIF}
  {
  edNomerOtm.Enabled:=not (DokumentDATE_OTM.AsString='');
  edNomerOsv.Enabled:=not (DokumentDATE_OSV.AsString='');
  edNomerOtst.Enabled:=not (DokumentDATE_OTST.AsString='');
  }
  {
  if DokumentDATE_EDIT_GIS.AsDateTime>DokumentDATE_POST_GIS.AsDateTime then begin
    lbDateEditGIS.Visible:=true;
  end else begin
    lbDateEditGIS.Visible:=false;
  end;
  }
end;

procedure TfmZapisOpeka.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

procedure TfmZapisOpeka.edStudentSprEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_UCHZAVED', 'STUDENT_SPR', false, edStudentSpr);
  Handled := true;
end;

//-----------------------------------------------------
procedure TfmZapisOpeka.edVidChange(Sender: TObject);
var
  n:Integer;
  lNotD,lChild:Boolean;
begin
  n:=GetTypeOpeka(lNotD,lChild);
  if n=0 then begin
    tsOpekun.Caption:='Опекун (Попечитель)';
  end else begin
    if n=1
      then tsOpekun.Caption:='Опекун'
      else tsOpekun.Caption:='Попечитель';
  end;
  CheckCaption;
  if lNotD then begin
    edTip.ItemIndex:=-1;
    edForma.ItemIndex:=-1;
    {$IFDEF LAIS}
      edPrichChildLais.ItemIndex:=-1;
    {$ELSE}
      edPrichChild.Value:=null;
    {$ENDIF}
  end;
  lbTip.Enabled:=not lNotD;
  edTip.Enabled:=not lNotD;
  lbForma.Enabled:=not lNotD;
  edForma.Enabled:=not lNotD;
  lbPrichChild.Enabled:=not lNotD;
  {$IFDEF LAIS}
    edPrichChildLais.Enabled:=not lNotD;
  {$ELSE}
    edPrichChild.Enabled:=not lNotD;
  {$ENDIF}
  N_F_cbIsControl.Enabled:=lChild;
end;
//----------------------------------------------------------
procedure TfmZapisOpeka.edTipChange(Sender: TObject);
begin
  if edTip.Enabled then begin
    if edTip.ItemIndex>-1 then begin
      if edTip.KeyItems[edTip.ItemIndex]=inttostr(CHILD_SIROTA) then begin
        {$IFDEF LAIS}
          edPrichChildLAIS.ItemIndex:=-1;
          edPrichChildLAIS.Enabled:=false;
        {$ELSE}
          edPrichChild.Value:=null;
          edPrichChild.Enabled:=false;
        {$ENDIF}
      end else begin
        {$IFDEF LAIS}
          edPrichChildLais.Enabled:=true;
        {$ELSE}
          edPrichChild.Enabled:=true;
        {$ENDIF}
      end;
    end else begin
      {$IFDEF LAIS}
        edPrichChildLais.Enabled:=true;
      {$ELSE}
        edPrichChild.Enabled:=true;
      {$ENDIF}
    end;
    {$IFDEF LAIS}
       lbPrichChild.Enabled:=edPrichChildLais.Enabled;
    {$ELSE}
       lbPrichChild.Enabled:=edPrichChild.Enabled;
     {$ENDIF}
  end;
end;
//-----------------------------------------------------
function TfmZapisOpeka.GetAddPROP(sProp: String): Variant;
var
  l1,l2:Boolean;
begin
  sProp:=UpperCase(sProp);
  if sProp='TYPEOPEKA' then begin
    Result:=GetTypeOpeka(l1,l2);
  end else begin
    Result:='';
  end;
end;
//-----------------------------------------------------
function TfmZapisOpeka.GetTypeOpeka(var lNotD:Boolean; var lChild:Boolean): Integer;
var
  n:Integer;
begin
  lNotD:=false;
  lChild:=true;
  if edVid.ItemIndex=-1 then begin
    Result:=0;
  end else begin
    n:=StrToInt(edVid.KeyItems[edVid.ItemIndex]);
    if (n=VID_OPEKA_DO14) or (n=VID_OPEKA_NOT)
      then Result:=1
      else Result:=2;
    if (n=VID_OPEKA_NOT) or (n=VID_POPECH_NOT)
      then lNotD:=true;
    if (n=VID_OPEKA_DO14) or (n=VID_POPECH_DO18)
      then lChild:=true
      else lChild:=false;
  end;
end;
//-----------------------------------------------------
function TfmZapisOpeka.GetTypeDate:Integer;
var
  d:TDateTime;
begin
  if TypeRegistr=0 then begin   // вручную не указали что хотим делать
    Result:=0;
    if DokumentDATE_OTM.IsNull
      then d:=0
      else d:=DokumentDATE_OTM.AsDateTime;
    if (d>0) and (DokumentTYPE_SN.AsInteger>0) then begin
      case DokumentTYPE_SN.AsInteger of
        1: Result:=Result+2;     // дата прекращения
        2: Result:=Result+4;     // дата освобождения
        3: Result:=Result+8;     // дата отстранения
      end;
    end else begin
      if not DokumentUST_OTHER.AsBoolean and
         not DokumentDATEZ.IsNull
        then Result:=Result+1;   // дата установления
    end;
  end else begin
    Result:=TypeRegistr;
  end;
end;

const
  s1='Зарегистрировать установление';
  s2='Зарегистрировать прекращение';
  s3='Зарегистрировать отстранение';
//-----------------------------------------------------
procedure TfmZapisOpeka.CheckCaption;
var
  nVid:Integer;
  s:String;
  lNotD,lChild:Boolean;
begin
  nVid:=GetTypeOpeka(lNotD,lChild);
  s:='';
  if (nVid>0) then begin
    if nVid=1
      then s:=' опеку'
      else s:=' попечительство';
  end;
  TBItemStep2.Caption:='Зарегистрировать '+s;

//  TBItemStep2ust.Caption:=s1+s;
//  TBItemStep2otm.Caption:=s2+s;
//  if s<>'' then s:=' от '+s;
//  TBItemStep2otst.Caption:=s3+s;
end;

procedure TfmZapisOpeka.edInternatEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
//  {$IFDEF LAIS}
//    ChoiceFromLookupSpr( 'LOOKUP_UCHZAVED', 'INTERNAT', false, edInternat);
//  {$ELSE}
    ChoiceFromLookupSpr( 'LOOKUP_INTERNAT', 'INTERNAT', false, edInternat);
//  {$ENDIF}
  Handled := true;
end;

procedure TfmZapisOpeka.edPrichChildEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_PRICH_OPEKA', 'PRICH_CHILD', false, edPrichChild);
  Handled := true;
end;

procedure TfmZapisOpeka.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF LAIS}
    dsInternat.DataSet:=dmbase.SprUchZaved;
    edUstOrg.Visible:=false;
    edOtmOrg.Visible:=false;
  {$ELSE}
    dsInternat.DataSet:=dmbase.SprInternat;
  {$ENDIF}
//  edDateOsv.Hint:=lbDateOsv.Hint;
end;

procedure TfmZapisOpeka.cbTwoClick(Sender: TObject);
var
  i:integer;
begin
  gbSuprug.Enabled:=cbTwo.Checked;
  for i:=0 to gbSuprug.ControlCount-1 do
    gbSuprug.Controls[i].Enabled:=cbTwo.Checked;
end;

//----------------------------------------------------------------
procedure TfmZapisOpeka.TBItemChOpekaClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  i, nID, nVid : Integer;
  old : TCursor;
  sNomer1,sNomer2,sNomer3,sNomer4 : String;
  sd1,sd2,sd3,sd4,s5 : String;
  lCheck : Boolean;
  ParamFlt:TParamFieldFlt;
  arrVal : TArrStrings;
  Params:TParamsEditSpr;
const
  arrFld: array[0..16] of String=('DATE_EDIT_GIS', 'DATE_POST_GIS', 'DOC_OPEKA', 'NOMER_UST','NOMER_OTM','NOMER_OTST','NOMER_OSV','DATEZ','DATE_OTM','POLE_GRN','UST_ORG','UST_ORG_SPR','UST_ORG_TYPE', 'PRICH_OTM','OTM_ORG','OTM_ORG_SPR','OTM_ORG_TYPE');
begin
//  if ExitAsGISUN(true) then exit;

  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_OPEKA');
  if Opis<>nil then begin
//    if edON_Familia.Text<>'' then begin
//      Opis.DataSet.Filter := 'ON_FAMILIAP='+QStr(edON_Familia.Text);
//    end;
//    Opis.DataSet.Filtered := true;
    ParamFlt:=CreateParamFlt(edFamilia.Text,'FAMILIA');
    if ParamFlt<>nil then Opis.AutoFilter:=true;

    Params:=TParamsEditSpr.Create;
    Params.FreeOnExitSpr:=true;
    Params.Col1:='POLE_GRN{IMAGEG}';
    Params.GetCellParams_Col1:=Event_GridColumnsGetPoleGrn;
//    Params.ModalWin:=true;
    Opis.SetParamsEditSpr(Params);

    SetLength(arrRec,1);
    v := null;
    Dokument.CheckBrowseMode;
    if Opis.ChoiceFromSprEx(edFamilia, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      lCheck:=dbDisableControls(Dokument);
      Screen.Cursor := crHourGlass;
      FRun:=true;
      try
        IsReadDokument:=true;
        nID:=DokumentID.AsInteger;
        nVid:=DokumentVID.AsInteger;

        SetLEngth(arrVal, Length(arrFld));
        for i:=Low(arrFld) to High(arrFld) do
          arrVal[i]:=Dokument.FieldByName(arrFld[i]).AsString;

        ReadDok(GetValueField(arrRec, 'ID'));
        QueryExit:=true;

        EditDataSet(Dokument);
        DokumentID.AsInteger:=nID;
        DokumentVID.AsInteger:=nVid;

        try
          for i:=Low(arrFld) to High(arrFld) do
            Dokument.FieldByName(arrFld[i]).AsString:=arrVal[i];
        except
        end;

        Dokument.CheckBrowseMode;
        FAddNewDok:=true;
        IsReadDokument:=false;
      finally
        Screen.Cursor := old;
        FRun:=false;
        dbEnableControls(Dokument,lCheck);
        CheckControl;
      end;
    end;

//    Opis.DataSet.Filter   := '';
//    Opis.DataSet.Filtered := false;
  end;
end;

procedure TfmZapisOpeka.cbTypeChange(Sender: TObject);
var
  n:Integer;
begin
//  все  подопечный  опекун(попечитель)  супруг(опекуна)   отец   мать
  n:=cbType.ItemIndex;
  case n of
    1: tbReshSud.Filter:='ID=''CHILD''';
    2: tbReshSud.Filter:='ID=''ON''';
    3: tbReshSud.Filter:='ID=''ONA''';
    4: tbReshSud.Filter:='ID=''OTEC''';
    5: tbReshSud.Filter:='ID=''MAT''';
  else
    tbReshSud.Filter:='';
  end;
  tbReshSud.Filtered:=(n>0);
end;
//---------------------------------------------------
procedure TfmZapisOpeka.GridRSGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not tbReshSudCANCEL.IsNull and (tbReshSudCANCEL.AsBoolean=false)
    then AFont.Color:=clRed;
end;
//---------------------------------------------------
procedure TfmZapisOpeka.lbDateEditGISGetText(Sender: TObject;  var Text: String);
begin
  Text:='';
  if not DokumentDATE_EDIT_GIS.IsNull and not DokumentDATE_POST_GIS.IsNull and
     (DokumentDATE_EDIT_GIS.AsDateTime > DokumentDATE_POST_GIS.AsDateTime) then begin
    Text:='Дата корректировки: '+FormatDateTime('dd.mm.yyyy hh:nn',DokumentDATE_EDIT_GIS.AsDateTime)+',  '+
          'дата регистрации: '+FormatDateTime('dd.mm.yyyy hh:nn',DokumentDATE_POST_GIS.AsDateTime);
  end;
end;
//---------------------------------------------------
procedure TfmZapisOpeka.lbDatePostGISGetText(Sender: TObject; var Text: String);
begin
  if DokumentDATE_POST_GIS.IsNull
    then Text:=''
    else Text:=FormatDateTime('dd.mm.yyyy hh:nn',DokumentDATE_POST_GIS.AsDateTime);
end;
//-----------------------------------------------------
function TfmZapisOpeka.DokumentToText:String;
var
  fldDate,fldNomer:TField;
  s0,s1,s2,s3:String;
  n:Integer;
begin
  fldNomer:=FieldForNomerDok(fldDate);
  s1:=fldNomer.AsString;
  if s1='' then s1:='???';
  if fldDate.IsNull then s2:='??.??.????' else s2:=DatePropis(fldDate.AsDateTime, 3);
  if fldNomer.FieldName='NOMER_UST' then begin
    {$IFDEF LAIS}
      s3:='';
    {$ELSE}
      s3:=DokumentUST_ORG.AsString;
    {$ENDIF}
    Result:=N_F_edDocOpeka.Text+' об установлении опеки №'+s1+' от '+s2+' '+s3;
  end else begin
    {$IFDEF LAIS}
      s3:='';
    {$ELSE}
      s3:=DokumentOTM_ORG.AsString;
    {$ENDIF}
    n:=DokumentTYPE_SN.AsInteger;
    case n of
     0: s0:='о ???????';
     1: s0:='о прекращении';
     2: s0:='об освобождении от';
     3: s0:='об отстранении от';
    end;
    Result:=N_F_edDocOpekaO.Text+' '+s0+' опеки №'+s1+' от '+s2+' '+s3;
  end;
end;
procedure TfmZapisOpeka.lbDokToTextGetText(Sender: TObject;  var Text: String);
begin
end;

//============== CheckDrawRequired ==============
procedure TfmZapisOpeka.edDateDokUstCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
var
  fld:TField;
begin
  if FShowRequired and (Sender<>nil) then begin
    if (FieldForNomerDok(fld).FieldName='NOMER_UST') and not TDbEditEh(Sender).Field.IsNull then
      DrawState:=true;
  end;
end;
procedure TfmZapisOpeka.edDateDokSnCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
var
  fld:TField;
begin
  if FShowRequired and (Sender<>nil) then begin
    if (FieldForNomerDok(fld).FieldName<>'NOMER_UST') and not TDbEditEh(Sender).Field.IsNull then
      DrawState:=true;
  end;
end;

procedure TfmZapisOpeka.NomerCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
var
  sCurFld:String;
  fld:TField;
begin
  if FShowRequired and (Sender<>nil) then begin
    if TDbEditEh(Sender).Field.FieldName=FieldForNomerDok(fld).FieldName then
      DrawState:=true;
  end;
end;
procedure TfmZapisOpeka.edDateOtmCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
var
  sCurFld:String;
  fld:TField;
begin
  if FShowRequired and (Sender<>nil) then begin
    if (FieldForNomerDok(fld).FieldName<>'NOMER_UST') then
      DrawState:=true;
  end;
end;

//----------------------------------------------
procedure TfmZapisOpeka.GisunCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
  if FShowRequired
    then DrawState:=true;
end;

//---------------------------------
procedure TfmZapisOpeka.edOtmOrgCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
var
  sCurFld:String;
  fld:TField;
begin
  if FShowRequired and (Sender<>nil) then begin
    if (FieldForNomerDok(fld).FieldName<>'NOMER_UST') and (edOtmOrg.Text<>'') then
      DrawState:=true;
  end;
end;
//-----------------------------------
procedure TfmZapisOpeka.edUstOrgCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
var
  sCurFld:String;
  fld:TField;
begin
  if FShowRequired and (Sender<>nil) then begin
    if (FieldForNomerDok(fld).FieldName='NOMER_UST') and (edUstOrg.Text<>'') then
      DrawState:=true;
  end;
end;
//-----------------------------------------------------
procedure TfmZapisOpeka.N_F_edDocOpekaCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
var
  sCurFld:String;
  fld:TField;
begin
  if FShowRequired and (Sender<>nil) then begin
    if (FieldForNomerDok(fld).FieldName='NOMER_UST') then
      DrawState:=true;
  end;
end;
//-----------------------------------------------------
procedure TfmZapisOpeka.N_F_edDocOpekaOCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
var
  sCurFld:String;
  fld:TField;
begin
  if FShowRequired and (Sender<>nil) then begin
    if (FieldForNomerDok(fld).FieldName<>'NOMER_UST') then
      DrawState:=true;
  end;
end;
//-----------------------------------------------------
//====== OTM_ORG ========
procedure TfmZapisOpeka.edOtmOrgEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  arrRec:TCurrentRecord;
  slPar:TStringList;
begin
  slPar:=TStringList.Create;
  slPar.Add('CLASS='+IntToStr(ctOpeka));
//  EXTCODE_KEY -> TYPESPR;PADL(TRIM(EXTCODE),10,' ')
//  LEX3_KEY    -> TYPESPR;LEX3 )
  slPar.Add('INDEX=EXTCODE_KEY');
  if ChoiceGIS_Class( edOtmOrg, DokumentOTM_ORG_SPR.AsString, 'VAL(EXTCODE)>0', arrRec, slPar) then begin
    EditDataSet(Dokument);
    DokumentOTM_ORG.AsString:=GetValueField(arrRec,'LEX1');
    DokumentOTM_ORG_SPR.AsString:=GetValueField(arrRec,'EXTCODE');
    DokumentOTM_ORG_TYPE.AsInteger:=ctOpeka;
    DokumentOTM_OTHER.AsBoolean:=true;
    GlobalTask.SetLastValueAsString('LAST_ORG_OPEKA', DokumentOTM_ORG_SPR.AsString);
    GlobalTask.SetLastValueAsInteger('LAST_TYPEORG_OPEKA', ctOpeka);
  end;
end;

procedure TfmZapisOpeka.edOtmOrgEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  {$IFDEF OPEKA}
  fmChSS_Opeka:=TfmChSS_Opeka.Create(nil);
  if DokumentOTM_ORG_SPR.AsString<>''
    then fmChSS_Opeka.ValueCC:=DokumentOTM_ORG_SPR.AsString; // !!!
  if fmChSS_Opeka.ShowModal=mrOk then begin
    EditDataSet(Dokument);
    DokumentOTM_ORG.AsString:=fmChSS_Opeka.ValueNAME;
    DokumentOTM_ORG_SPR.AsString:=fmChSS_Opeka.ValueCC;
    DokumentOTM_ORG_TYPE.AsInteger:=ctZags;
    DokumentOTM_OTHER.AsBoolean:=true;
    GlobalTask.SetLastValueAsString('LAST_ORG_OPEKA', DokumentOTM_ORG_SPR.AsString);
    GlobalTask.SetLastValueAsInteger('LAST_TYPEORG_OPEKA', ctZags);
  end;
  fmChSS_Opeka.Free;
  {$ENDIF}
end;

procedure TfmZapisOpeka.edOtmOrgEditButtons2Click(Sender: TObject;  var Handled: Boolean);
var
  s:String;
  n:Integer;
  r:TRecSprGISUN;
begin
  s:=GlobalTask.GetLastValueAsString('LAST_ORG_OPEKA');
  n:=GlobalTask.GetLastValueAsInteger('LAST_TYPEORG_OPEKA');
  if (s<>'') and (n<>0) then begin
    r:=Locate_AllSprGISUN(n,s);
    if r.Ok then begin
      EditDataSet(Dokument);
      edUstOrg.Text:='';
      DokumentOTM_ORG.AsString:=r.Lex1;
      DokumentOTM_ORG_SPR.AsString:=s;
      DokumentOTM_ORG_TYPE.AsInteger:=n;
      DokumentOTM_OTHER.AsBoolean:=true;
    end else begin
      PutError('Значение не найдено в справочнике',self);
    end;
  end else begin
    ShowMessageCont('Значение ранее не выбиралось',self);
  end;
end;

procedure TfmZapisOpeka.ClearOrgOtm;
begin
  EditDataSet(Dokument);
  edOtmOrg.Text:='';
  DokumentOTM_ORG.AsString:='';
  DokumentOTM_ORG_SPR.AsString:='';
  DokumentOTM_ORG_TYPE.AsString:='';
  DokumentOTM_OTHER.AsBoolean:=false;
end;
procedure TfmZapisOpeka.edOtmOrgEditButtons3Click(Sender: TObject;  var Handled: Boolean);
begin
  ClearOrgOtm;
end;
//-----------------------------------------------------
//====== UST_ORG ========
procedure TfmZapisOpeka.edUstOrgEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  arrRec:TCurrentRecord;
  slPar:TStringList;
begin
  slPar:=TStringList.Create;
  slPar.Add('CLASS='+IntToStr(ctOpeka));
//  EXTCODE_KEY -> TYPESPR;PADL(TRIM(EXTCODE),10,' ')
//  LEX3_KEY    -> TYPESPR;LEX3 )
  slPar.Add('INDEX=EXTCODE_KEY');
  if ChoiceGIS_Class( edUstOrg, DokumentUST_ORG_SPR.AsString, 'VAL(EXTCODE)>0', arrRec, slPar) then begin
    EditDataSet(Dokument);
    DokumentUST_ORG.AsString:=GetValueField(arrRec,'LEX1');
    DokumentUST_ORG_SPR.AsString:=GetValueField(arrRec,'EXTCODE');
    DokumentUST_ORG_TYPE.AsInteger:=ctOpeka;
    DokumentUST_OTHER.AsBoolean:=true;
    GlobalTask.SetLastValueAsString('LAST_ORG_OPEKA', DokumentUST_ORG_SPR.AsString);
    GlobalTask.SetLastValueAsInteger('LAST_TYPEORG_OPEKA', ctOpeka);
  end;
end;

procedure TfmZapisOpeka.edUstOrgEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  {$IFDEF OPEKA}
  fmChSS_Opeka:=TfmChSS_Opeka.Create(nil);
  if DokumentUST_ORG_SPR.AsString<>''
    then fmChSS_Opeka.ValueCC:=DokumentUST_ORG_SPR.AsString; // !!!
  if fmChSS_Opeka.ShowModal=mrOk then begin
//    ShowMessage(fmChSS_Opeka.ValueCC);
    EditDataSet(Dokument);
    DokumentUST_ORG.AsString:=fmChSS_Opeka.ValueNAME;
    DokumentUST_ORG_SPR.AsString:=fmChSS_Opeka.ValueCC;
    DokumentUST_ORG_TYPE.AsInteger:=ctZags;
    DokumentUST_OTHER.AsBoolean:=true;
    GlobalTask.SetLastValueAsString('LAST_ORG_OPEKA', DokumentUST_ORG_SPR.AsString);
    GlobalTask.SetLastValueAsInteger('LAST_TYPEORG_OPEKA', ctZags);
  end;
  fmChSS_Opeka.Free;
  {$ENDIF}
end;

procedure TfmZapisOpeka.edUstOrgEditButtons2Click(Sender: TObject;  var Handled: Boolean);
var
  s:String;
  n:Integer;
  r:TRecSprGISUN;
begin
  s:=GlobalTask.GetLastValueAsString('LAST_ORG_OPEKA');
  n:=GlobalTask.GetLastValueAsInteger('LAST_TYPEORG_OPEKA');
  if (s<>'') and (n<>0) then begin
    r:=Locate_AllSprGISUN(n,s);
    if r.Ok then begin
      EditDataSet(Dokument);
      edUstOrg.Text:='';
      DokumentUST_ORG.AsString:=r.Lex1;
      DokumentUST_ORG_SPR.AsString:=s;
      DokumentUST_ORG_TYPE.AsInteger:=n;
      DokumentUST_OTHER.AsBoolean:=true;
    end else begin
      PutError('Значение не найдено в справочнике',self);
    end;
  end else begin
    ShowMessageCont('Значение ранее не выбиралось',self);
  end;
end;

procedure TfmZapisOpeka.edUstOrgEditButtons3Click(Sender: TObject;  var Handled: Boolean);
begin
  EditDataSet(Dokument);
  edUstOrg.Text:='';
  DokumentUST_ORG.AsString:='';
  DokumentUST_ORG_SPR.AsString:='';
  DokumentUST_ORG_TYPE.AsString:='';
  DokumentUST_OTHER.AsBoolean:=false;
end;
//----------------------------------------------------------------------------------
procedure TfmZapisOpeka.TBItemCreatePopech18Click(Sender: TObject);
var
  lOk:Boolean;
begin
  if (DokumentID.AsInteger=-1) or FAddNewDok then  begin
    PutError('Операция доступна только для сохраненной записи');
  end else begin
    if (DokumentVID.AsInteger=VID_OPEKA_DO14) then begin
      if DokumentDATE_OTM.IsNull then begin
        lOk:=Problem(PADCStr('Заполнить дату прекращения ?',40,' '),mtConfirmation,self);
        if lOk then begin
          EditDataSet(Dokument);
          DokumentDATE_OTM.AsDateTime:=Date;
          PostDataSet(Dokument);
        end;
      end else begin
        lOk:=true;
      end;
      if lOk and Problem('Создать запись "попечительство над несовершеннолетним от 14 до 18" ?',mtConfirmation,self) then begin
        if WriteDok then begin
          EditDataSet(Dokument);
          DokumentID.AsInteger:=-1;
          DokumentVID.AsInteger:=VID_POPECH_DO18;
          DokumentDATE_OTM.AsString:='';
//          DokumentDATE_OTST.AsString:='';
//          DokumentDATE_OSV.AsString:='';
//          DokumentDATEZ.AsDateTime:=IncYear(DokumentDATER.AsDateTime,18);
//          DokumentNOMER_UST.AsString:='бн';
//          DokumentDATEDOK_UST.AsString:='';
//          DokumentDATEDOK_SN.AsString:='';
          Dokument.Post;
          FAddNewDok:=true;
          QueryExit:=true;
          WriteDok;
          TBItemCreatePopech18.Enabled:=false;
        end else begin
          ShowMessage(PADCStr('Документ не создан',40,' '));
        end;
      end;
    end else begin
      PutError('Создать запись возможно только для: "опека над ребенком до 14" и заполнена для прекращения');
    end;
  end;
end;
//----------------------------------------------
function TfmZapisOpeka.FieldForNomerDok(var fldDate:TField):TField;
begin
  if (DokumentDATE_OTM.AsString<>'') and (DokumentNOMER_OTM.AsString<>'') then begin
    Result:=DokumentNOMER_OTM;
    if DokumentDATEDOK_SN.IsNull
      then fldDate:=DokumentDATE_OTM
      else fldDate:=DokumentDATEDOK_SN;
//  end else if (DokumentDATE_OSV.AsString<>'') and (DokumentNOMER_OSV.AsString<>'') then begin
//    Result:=DokumentNOMER_OSV;
//    fldDate:=DokumentDATE_OSV;
//  end else if (DokumentDATE_OTST.AsString<>'')  and (DokumentNOMER_OTST.AsString<>'') then begin
//    Result:=DokumentNOMER_OTST;
//    fldDate:=DokumentDATE_OTST;
  end else begin
    Result:=DokumentNOMER_UST;
    if DokumentDATEDOK_UST.IsNull
      then fldDate:=DokumentDATEZ
      else fldDate:=DokumentDATEDOK_UST;
  end;
end;
//----------------------------------------------
procedure TfmZapisOpeka.InvalidateAllNomer;
begin
  edNomerUst.Invalidate;
  edNomerUst.Update;
  edDateOtm.Invalidate;
  edDateOtm.Update;
  edNomerOtm.Invalidate;
  edNomerOtm.Update;
//  edNomerOsv.Invalidate;
//  edNomerOsv.Update;
//  edNomerOtst.Invalidate;
//  edNomerOtst.Update;
  edUstOrg.Invalidate;
  edUstOrg.Update;
  edOtmOrg.Invalidate;
  edOtmOrg.Update;
  N_F_edDocOpeka.Invalidate;
  N_F_edDocOpeka.Update;
  N_F_edDocOpekaO.Invalidate;
  N_F_edDocOpekaO.Update;

  edDateDokUst.Invalidate;
  edDateDokUst.Update;
  edDateDokSn.Invalidate;
  edDateDokSn.Update;
  lbDokToText.Caption:='Документ ГИС РН: '+DokumentToText;
end;

procedure TfmZapisOpeka.N_F_edTypeSnChange(Sender: TObject);
var
  n:Integer;
begin
  if not FRun and not IsReadDokument then begin
    if N_F_edTypeSn.ItemIndex>-1
      then n:=StrToInt(N_F_edTypeSn.KeyItems[N_F_edTypeSn.ItemIndex]) else n:=0;
    CheckControlDok(n);
  end;
end;

procedure TfmZapisOpeka.CheckControlDok(nTypeSn:Integer);
//var
//  sFldDate,sFldNomer:String;
begin
{
  if nTypeSn<=1 then begin
    sFldDate:='DATE_OTM';
    sFldNomer:='NOMER_OTM';
  end else if nTypeSn=2 then begin
    sFldDate:='DATE_OSV';
    sFldNomer:='NOMER_OSV';
  end else if nTypeSn=3 then begin
    sFldDate:='DATE_OTST';
    sFldNomer:='NOMER_OTST';
  end;
  edDateOtm.DataField:=sFldDate;
  edNomerOtm.DataField:=sFldNomer;
}
end;


end.

