unit fZapisSmert;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, QStrings, Menus,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject, DateUtils, uTypes, ifpii_dbfunc,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc, sndKey32,ToolCtrlsEh,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat,
  ZipForge;

type

  EPrSmertInvalid = class(Exception);

  TfmZapisSmert = class(TfmSimpleD)
    pn: TPanel;
    lbNomer: TLabel;
    Label8: TLabel;
    edNomer: TDBEditEh;
    edDateZ: TDBDateTimeEditEh;
    N_F_1: TDBCheckBoxEh;
    lbSvid: TLabel;
    Label55: TLabel;
    edSvid_Nomer: TDBEditEh;
    pc: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbDateR: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    lbDateS: TLabel;
    Label24: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    edDateR: TDBDateTimeEditEh;
    edPol: TDBComboBoxEh;
    edNATION: TDBLookupComboboxEh;
    edGRAG: TDBLookupComboboxEh;
    edDateS: TDBDateTimeEditEh;
    gbRogd: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edRG_GOSUD: TDBLookupComboboxEh;
    edRG_B_OBL: TDBCheckBoxEh;
    edRG_GOROD: TDBEditEh;
    edSmertPosl: TDBComboBoxEh;
    gbGit: TGroupBox;
    Label15: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label53: TLabel;
    edGT_GOSUD: TDBLookupComboboxEh;
    edGT_B_OBL: TDBCheckBoxEh;
    edGT_GOROD: TDBEditEh;
    gbPrichin: TGroupBox;
    Label28: TLabel;
    Label31: TLabel;
    ENG_edPrNep: TDBEditEh;
    ENG_edPrOsn: TDBEditEh;
    ENG_edPrMesto: TDBEditEh;
    edPrNep_Name: TDBEditEh;
    edPrOsn_Name: TDBEditEh;
    edPrMesto_Name: TDBEditEh;
    Label35: TLabel;
    edFact: TDBEditEh;
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
    edDateSV: TDBDateTimeEditEh;
    Label39: TLabel;
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
    tsSprav: TTabSheet;
    TBItemArxSpr: TTBItem;
    Label47: TLabel;
    edAdresat: TDBEditEh;
    edNomerArxSpr: TDBEditEh;
    Label48: TLabel;
    Label49: TLabel;
    edDateArxSpr: TDBDateTimeEditEh;
    edAddTextArx: TDBEditEh;
    Label50: TLabel;
    edSVID_SERIA: TDBLookupComboboxEh;
    tsPovtor: TTabSheet;
    edGT_RNGOROD: TDBLookupComboboxEh;
    DokumentGT_B_RN: TBooleanField;
    DokumentGT_RNGOROD: TStringField;
    N_F_cbOnlyGod: TDBComboBoxEh;
    DokumentONLYGOD: TSmallintField;
    DokumentONLYGOD_R: TSmallintField;
    N_F_cbOnlyGodR: TDBComboBoxEh;
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
    lbIDENTIF: TLabel;
    ENG_edIDENTIF: TDBEditEh;
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
    N_F_cbBelorus: TDBCheckBoxEh;
    DokumentSPEC_B: TStringField;
    TBItemTalonUbit: TTBItem;
    edSOATO: TDBEditEh;
    DokumentDOK_KOD: TSmallintField;
    edDokKod: TDBComboBoxEh;
    ApplicationEvents1: TApplicationEvents;
    lbSOATO: TvchDBText;
    Label33: TLabel;
    edRG_OBL: TDBEditEh;
    edRG_RAION: TDBEditEh;
    edGT_OBL: TDBEditEh;
    edGT_RAION: TDBEditEh;
    DokumentRN_SM_B_GOROD: TStringField;
    DokumentRN_RG_B_GOROD: TStringField;
    DokumentRN_GT_B_GOROD: TStringField;
    tsSvid: TTabSheet;
    Label77: TLabel;
    edName_Sv: TDBEditEh;
    edFamilia_Sv: TDBEditEh;
    edOtch_Sv: TDBEditEh;
    Label76: TLabel;
    BLR_edFamiliaB_Sv: TDBEditEh;
    BLR_edNameB_Sv: TDBEditEh;
    BLR_edOtchB_Sv: TDBEditEh;
    edPol_Sv: TDBComboBoxEh;
    Label79: TLabel;
    lbDateS_Sv: TLabel;
    edDateS_Sv: TDBDateTimeEditEh;
    N_F_cbOnlyGod_Sv: TDBComboBoxEh;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    edGosud_Sv: TDBLookupComboboxEh;
    BLR_edOblB_Sv: TDBEditEh;
    BLR_edGorodB_Sv: TDBEditEh;
    BLR_edRaionB_Sv: TDBEditEh;
    BLR_edTypeGorodB_Sv: TDBLookupComboboxEh;
    edGorod_Sv: TDBEditEh;
    edTypeGorod_Sv: TDBLookupComboboxEh;
    BLR_edGosudB_Sv: TDBLookupComboboxEh;
    edOBL_Sv: TDBEditEh;
    edRAION_Sv: TDBEditEh;
    Label52: TLabel;
    ENG_edPrOsn_Sv: TDBEditEh;
    edPrOsn_Name_Sv: TDBEditEh;
    BLR_edPrOsn_Name_B_Sv: TDBEditEh;
    Label95: TLabel;
    edRukov_Sv: TDBEditEh;
    BLR_edRukovB_Sv: TDBEditEh;
    lbDateR_Sv: TLabel;
    edDateR_Sv: TDBDateTimeEditEh;
    N_F_cbOnlyGodR_Sv: TDBComboBoxEh;
    DokumentGT_DOM: TStringField;
    DokumentGT_KORP: TStringField;
    DokumentGT_KV: TStringField;
    DokumentDUBL_SPR: TBooleanField;
    DokumentIS_SDAN_DOK: TBooleanField;
    DokumentBOMG: TBooleanField;
    N_F_edBOMG: TDBCheckBoxEh;
    lbVozr: TvchDBText;
    DokumentSUD_SILA: TDateField;
    DokumentEMPTY_PRICH: TBooleanField;
    pnTs2: TPanel;
    Label30: TLabel;
    Label29: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    edRukov: TDBEditEh;
    edSem: TDBComboBoxEh;
    edWork: TDBEditEh;
    edObraz: TDBComboBoxEh;
    edDecl: TDBEditEh;
    edSdanDok: TDBEditEh;
    edSdanVB: TDBEditEh;
    edZametka: TDBEditEh;
    edSprav_Nomer: TDBEditEh;
    edSprav_Date: TDBDateTimeEditEh;
    edIzmen: TDBEditEh;
    N_F_edCopy: TDBCheckBoxEh;
    gbMat: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    edMatDateR: TDBDateTimeEditEh;
    edMatSchet: TDBNumberEditEh;
    N_F_cbVUS: TDBCheckBoxEh;
    N_F_edVB: TDBCheckBoxEh;
    edVoenkom: TDBLookupComboboxEh;
    N_F_cbDublSpr: TDBCheckBoxEh;
    Button1: TButton;
    Button2: TButton;
    edIsSdanDok: TDBComboBoxEh;
    N_F_edResh_Suda: TDBCheckBoxEh;
    Label108: TLabel;
    BLR_edFamilia: TDBEditEh;
    Label109: TLabel;
    BLR_edName: TDBEditEh;
    Label110: TLabel;
    BLR_edOtch: TDBEditEh;
    BLR_edPrNep_Name: TDBEditEh;
    BLR_edPrOsn_Name: TDBEditEh;
    Label9: TLabel;
    lbSM_OBL: TLabel;
    Label11: TLabel;
    lbSM_Gorod: TLabel;
    edSM_GOSUD: TDBLookupComboboxEh;
    BLR_edSM_OBL: TDBEditEh;
    edSM_GOROD: TDBEditEh;
    BLR_edSM_RAION: TDBEditEh;
    edSM_B_GOROD: TDBLookupComboboxEh;
    edSM_OBL: TDBEditEh;
    edSM_RAION: TDBEditEh;
    cbSM_OBL: TDBCheckBoxEh;
    BLR_edSM_Gorod: TDBEditEh;
    edGosud_B: TDBLookupComboboxEh;
    Label7: TLabel;
    N_F_cbPovtor: TDBCheckBoxEh;
    TBItemRegPrSmert: TTBItem;
    DokumentDECL_DOK: TStringField;
    edDeclDok: TDBEditEh;
    Label32: TLabel;
    edTextVozr: TDBEditEh;
    DokumentTEXT_VOZR: TStringField;
    edTextVozr_Sv: TDBEditEh;
    edTextDateS: TDBEditEh;
    DokumentTEXT_DATES: TStringField;
    edTextDateS_Sv: TDBEditEh;
    DokumentMESTO_Z: TMemoField;
    lbMestoZ: TLabel;
    edMestoZ: TDBEditEh;
    Button3: TButton;
    edGT_GOROD_R: TDBEditEh;
    Label45: TLabel;
    edGT_DOM: TDBEditEh;
    Label46: TLabel;
    edGT_KORP: TDBEditEh;
    Label51: TLabel;
    edGT_KV: TDBEditEh;
    DokumentTYPE_SPRAV: TSmallintField;
    N_F_cbTypeSprav: TDBComboBoxEh;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    edSpec: TDBEditEh;
    N_F_cbTextPr: TDBCheckBoxEh;
    ENG_edIDENTIF_Sv: TDBEditEh;
    Label34: TLabel;
    BLR_edSM_B_GOROD: TDBLookupComboboxEh;
    DokumentDECL_IN: TStringField;
    edWriteDecl: TDBComboBoxEh;
    Label5: TLabel;
    lbPrichNotDok: TLabel;
    edPrichNotDok: TDBEditEh;
    DokumentPRICH_NOT_DOK: TStringField;
    ImCondIN: TImage;
    DokumentLICH_NOMER_GIS: TStringField;
    Button4: TButton;
    btATE: TBitBtn;
    DokumentATEID: TIntegerField;
    Label10: TLabel;
    DokumentSM_TEXT: TStringField;
    DokumentSM_TEXT_B: TStringField;
    edSM_TEXT: TDBEditEh;
    BLR_edSM_TEXT: TDBEditEh;
    procedure edDeclEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edFamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edPolChange(Sender: TObject);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edFamiliaEnter(Sender: TObject);
    procedure edNameEnter(Sender: TObject);
    procedure edOtchEnter(Sender: TObject);
    procedure edFamiliaCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
    procedure edRukovEnter(Sender: TObject);
    procedure Label45Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure TBItemArxSprClick(Sender: TObject);
    procedure edSM_OBL_RNotInList(Sender: TObject; NewText: String;     var RecheckInList: Boolean);
    procedure edSM_RAION_RNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure N_F_cbOnlyGodChange(Sender: TObject);
    procedure N_F_cbOnlyGodRChange(Sender: TObject);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure edVoenkomEditButtons0Click(Sender: TObject;    var Handled: Boolean);                                         
   procedure edVoenkomEditButtons1Click(Sender: TObject;     var Handled: Boolean);
    procedure edVoenkomChange(Sender: TObject);
    procedure edSdanDokEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edSpecEnter(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edDateSUpdateData(Sender: TObject; var Handled: Boolean);
    procedure TBItemTalonUbitClick(Sender: TObject);
    procedure edSOATOClick(Sender: TObject);
    procedure lbSOATOGetText(Sender: TObject; var Text: String);
    procedure edIDENTIFUpdateData(Sender: TObject; var Handled: Boolean);
    procedure N_F_cbOnlyGodR_SvChange(Sender: TObject);
    procedure N_F_cbOnlyGod_SvChange(Sender: TObject);
    procedure edOBL_SvChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edVoenkomEditButtons2Click(Sender: TObject;   var Handled: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure lbVozrGetText(Sender: TObject; var Text: String);
    procedure edFactEnter(Sender: TObject);
    procedure ENG_edPrOsnUpdateData(Sender: TObject; var Handled: Boolean);
    procedure CheckPanelMestoGit;
    procedure TBItemRegPrSmertClick(Sender: TObject);
    procedure edDeclDokEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edRukov_SvEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edSprav_NomerEnter(Sender: TObject);
    procedure N_F_cbTypeSpravChange(Sender: TObject);
    procedure edSpecEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edIsSdanDokChange(Sender: TObject);
    procedure cbSM_OBLClick(Sender: TObject);
    procedure edWriteDeclEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure Button4Click(Sender: TObject);
  private
//    H : THintWindow;
    procedure OnDestroyHint( Sender : TObject);
//    procedure SetIDZags;
  public
    { Public declarations }
    FRunTalonUbit : Boolean;
    FCheckSOATO:Boolean;
    TbItemEmptyPrich: TTbItem;
    TbItemVerno: TTbItem;
    TbItemCondIN: TTbItem;
    TbItemMesto: TTbItem;
    procedure Event_EmptyPrich(Sender: TObject);
    procedure Event_TrueAkt(Sender: TObject);
    procedure Event_CondIN(Sender: TObject);
    procedure Event_TextVozr(Sender: TObject);
//    procedure Event_MestoNotPunkt(Sender: TObject);

    procedure AfterCheckAkt_GISUN(nType:Integer); override;

    procedure WM_CloseMRUList(var rec:TMsg); message WM_CLOSE_MRULIST;

    function EmptyIzm: String; override;
    function CreateSubMenuRun: Boolean; override;

    procedure CheckSoatoAkt(lVoenkom:Boolean; strParam:String; nAteID:Integer; strSoato:String);
    function WriteDok : Boolean; override;
    procedure WriteDvigMen(nIdMen:Integer);

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
    procedure CheckOnlyGod(lSv:Boolean);
    function CheckDokumentSimple(nType:Integer; lWriteDok:Boolean):Boolean; override;
    procedure SetOnlyPovtorSvid(lOnlyPovtor:Boolean;pc:TPageControl; ts:TWinControl; NonVisibleControls : array of TVarRec; lbSvid,lbNomer:TLabel); override;
    procedure CheckTsSvidPovtor; override;

    function EnableHistoryControl(ActControl:TWinControl):Boolean; override;
    procedure FieldAddHistDop(fld : TField; ActControl:TWinControl); override;

    function SpravEnabled:Boolean;
    procedure SetSimpleVvod(sName:String); override;

    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;

    procedure CheckOnlyGodR(lSv:Boolean);
    procedure CheckRnGorod;
    procedure CheckMestoNotPunkt(nType:Integer);
    procedure CheckControlPrSmert;
    procedure CheckControlSvid;
  end;

  function EditZapisSmert( var nID : Integer; var lRunUbit:Boolean; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;

var
  fmZapisSmert: TfmZapisSmert;
  FCreateAkt:Boolean;

implementation

uses dBase, fMain, fChoiceNasel, fVvodDecl, fShablon, fEnterDokument, uCheckKod, fEnterAdresat, uProjectAll;

{$R *.DFM}

function EditZapisSmert( var nID : Integer; var lRunUbit:Boolean; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;
begin
//  result := true;
  lRunUbit:=false;
  Result:=true;
  try
    if FCreateAkt and (nID=-1) then begin   // уже находимся в режиме создания з/а
      exit;
    end;
    FCreateAkt:=true;
    fmZapisSmert := TfmZapisSmert.Create(nil);
    fmZapisSmert.AssignPar(slPar);
    with fmZapisSmert do begin
      IsCreateForm:=false;
      SetOnlyPovtorSvid(lOnlyPovtor, pc, tsSvid, [ N_F_1, N_F_edTypeEkz, N_F_cbPovtor, N_F_cbBelorus ], lbSvid,lbNomer);
      {$IFDEF ZAGS}
      if not lOnlyPovtor then begin
        TBItemSprAkt.Visible:=true;      // доступность получения справки о записи акта
        TBItemDeclSvid.Visible:=true;
      end;  
      {$ENDIF}
    end;
    try
      fmZapisSmert.IsReadDokument:=true;
      if nID=-1 then begin
        fmZapisSmert.NewDok(true);
        fmZapisSmert.SetIDZags;
        fmZapisSmert.CheckEnabledNameOrgan(true);
      end else begin
        fmZapisSmert.ReadDok( nID );
        fmZapisSmert.TBItemZAGS.Visible:=false;
        fmZapisSmert.CheckEnabledNameOrgan(false);
      end;
      fmZapisSmert.IsReadDokument:=false;
      {$IFDEF GISUN}
        fmZapisSmert.CheckAkt_GISUN(0);
  //      Gisun.CheckSmert(fmZapisSmert);
  //      fmZapisSmert.CheckImageGisun(fmZapisSmert.DokumentPOLE_GRN,fmZapisSmert.ImageGISUN);
        fmZapisSmert.edSdanDok.EditButtons[0].Visible:=true;
        fmZapisSmert.BeforeEditFormGISUN;
      {$ELSE}
        fmZapisSmert.edSdanDok.EditButtons[0].Visible:=false;
      {$ENDIF}
      Result   := fmZapisSmert.EditModal;
      lRunUbit := fmZapisSmert.FRunTalonUbit;
      nID := fmZapisSmert.DokumentID.AsInteger;
    finally
      fmZapisSmert.Free;
      fmZapisSmert := nil;
    end;
  finally
    FCreateAkt:=false;
  end;
end;

{ TfmZapisSmert }

constructor TfmZapisSmert.Create(Owner: TComponent);
var
  n:Integer;
  aw:TAddControl;
begin
  inherited;
  //FCharCase:=1;     // 0-ecNormal, 1-ecUpperCase, 2-ecLowerCase
  {$IFDEF LAIS}
  edRukov_Sv.EditButtons[0].Visible:=false;
  edRukov.EditButtons[0].Visible:=false;
  edSpec.EditButtons[0].Visible:=false;
  {$ENDIF}


  aw := TAddControl.Create(cbSM_Obl); // ('область');
  edSM_OBL.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(cbSM_Obl); // ('область');
  aw.ValueTrue:='вобласць';
  BLR_edSM_OBL.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(edSM_B_GOROD);
  aw.FirstWord:=true;
  edSM_GOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(BLR_edSM_B_GOROD);
  aw.FirstWord:=true;
  BLR_edSM_GOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(edRG_B_GOROD);
  aw.FirstWord:=true;
  edRG_GOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(edGT_B_GOROD);
  aw.FirstWord:=true;
  edGT_GOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);

  slGo:=TStringList.Create;
  slGo.Add('down->BLR_edSM_Gorod=edSmertPosl');
  slGo.Add('up->BLR_edSM_OBL=edGRAG');

  if FPrintSpecSvid then begin
    edRukov_Sv.DataField:='SPEC';
    BLR_edRukovB_Sv.DataField:='SPEC_B';
  end;

  FReportIN:=true;
  FFirstControl:=edNomer;
  FCheckSVIDControl:=true;
  CheckPanelMestoGit;

  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';

  FCheckLookupField:=false;
  FRunTalonUbit:=false;
  FDokZAGS := true;

  TypeObj := dmBase.TypeObj_ZSmert;
  FUpdatingObj:=GetUpdatingObj(TypeObj);

  SetLength(FArrChoiceRekv,12);
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

  FArrChoiceRekv[7].nType:=0;
  FArrChoiceRekv[7].nTypeSpr:=_SHABLON_MKB10;
  FArrChoiceRekv[7].FieldName:='PR_OSN';

  FArrChoiceRekv[8].nType:=0;
  FArrChoiceRekv[8].nTypeSpr:=_SHABLON_MKB10;
  FArrChoiceRekv[8].FieldName:='PR_NEP';

  FArrChoiceRekv[9].nType:=SHABLON_ADRESAT;
  FArrChoiceRekv[9].FieldName:='ARX_ADRESAT';

  FArrChoiceRekv[10].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[10].FieldName:='ARX_TEXT';

  FArrChoiceRekv[11].nType:=SHABLON_NOT_DOK;
  FArrChoiceRekv[11].FieldName:='PRICH_NOT_DOK';

  //  FArrChoiceRekv[11].nType:=SHABLON_MESTO_Z;
//  FArrChoiceRekv[11].FieldName:='MESTO_Z';

  CheckControlSvid;

  AddButton_LoadIdentif(ENG_edIDENTIF);
  AddButton_LoadIdentif(ENG_edIDENTIF_Sv);

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisSmert;
  dsGragd.DataSet := dmBase.SprGragd;
  {$IFDEF ZAGS}
    edDecl.EditButtons[0].Style := ebsEllipsisEh;
    edDecl.EditButtons[0].Width := 0;
//    lbMestoZ.Visible:=false;
//    edMestoZ.Visible:=false;
  {$ELSE}
    edFamilia.EditButtons[0].Glyph := edDecl.EditButtons[0].Glyph;
  {$ENDIF}
  FPageControl := pc;
//  pc.OwnerDraw:=true;
//  pc.OnDrawTab:=PageControlDrawTab;

  pc.ActivePageIndex:=0;

//  CheckPageControl(pc);
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
  edSpec.OnExit    := OnDestroyHint;
  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;
//  fmMain.SetCurrentDokument(Dokument);

  tsSprav.TabVisible := false;

  edDateS.Tag:=Integer(Pointer(N_F_cbOnlyGod));
  edDateR.Tag:=Integer(Pointer(N_F_cbOnlyGodR));

  {$IFDEF ZAGS}
    edFamilia.EditButtons.Items[0].Visible:=false;
//    edDecl.EditButtons.Items[0].Visible:=false;
    cbProvDvig.Visible := false;
    cbProvDvig.Checked := false;
    TBItemTalonUbit.Visible:=false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
    TBItemTalonUbit.Visible:=true;
    TBItemArxSpr.Visible:=false;
//    if GlobalTask.ParamAsBoolean('PLUS_GOROD') then begin
//      edCopy.Visible := true;
//    end else begin
//      edCopy.Visible := false;
//    end;
    N_F_cbPovtor.Visible := false;
//    N_F_cbTextPr.Visible := false;
  {$ENDIF}

  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
    n:=25;
//      cbOnlyGod.Width := GetTextWidth(cbOnlyGod.Items[2],cbOnlyGod.Font.Height,cbOnlyGod.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE); //+5;
    N_F_cbOnlyGod.ClientWidth := GetTextWidth(N_F_cbOnlyGod.Items[2],N_F_cbOnlyGod.Font.Height,N_F_cbOnlyGod.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE)+n; //+5;
    lbDateS.Caption := '8.';
    N_F_cbOnlyGod.Left  := lbDateS.Left+lbDateS.Width+5;
    edDateS.Left := N_F_cbOnlyGod.Left+N_F_cbOnlyGod.Width+5;

    N_F_cbOnlyGodR.ClientWidth := GetTextWidth(N_F_cbOnlyGodR.Items[2],N_F_cbOnlyGodR.Font.Height,N_F_cbOnlyGodR.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE)+n; //+5;
    lbDateR.Caption := '13.';
    N_F_cbOnlyGodR.Left  := lbDateR.Left+lbDateR.Width+5;
    edDateR.Left := N_F_cbOnlyGodR.Left+N_F_cbOnlyGodR.Width+5;
    lbVozr.Left:=edDateR.Left+edDateR.Width+15;

    if tsSvid.TabVisible then begin
//      cbOnlyGod_Sv.ClientWidth := GetTextWidth(cbOnlyGod_Sv.Items[2],cbOnlyGod_Sv.Font.Height,cbOnlyGod_Sv.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE)+n; //+5;
      N_F_cbOnlyGod_Sv.ClientWidth := GetTextWidth(N_F_cbOnlyGod_Sv.Items[2],N_F_cbOnlyGod_Sv.Font.Size,N_F_cbOnlyGod_Sv.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE)+n; //+5;
      lbDateS_Sv.Caption := '';
//    cbOnlyGod_Sv.Left  := lbDateS_Sv.Left+lbDateS_Sv.Width+5;
      N_F_cbOnlyGod_Sv.Left  := lbDateS_Sv.Left;
      edDateS_Sv.Left := N_F_cbOnlyGod_Sv.Left+N_F_cbOnlyGod_Sv.Width+5;

      N_F_cbOnlyGodR_Sv.ClientWidth := GetTextWidth(N_F_cbOnlyGodR.Items[2],N_F_cbOnlyGodR.Font.Size,N_F_cbOnlyGodR.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE)+n; //+5;
      lbDateR_Sv.Caption := '';
      N_F_cbOnlyGodR_Sv.Left  := lbDateR_Sv.Left;
      edDateR_Sv.Left := N_F_cbOnlyGodR_Sv.Left+N_F_cbOnlyGodR_Sv.Width+5;
    end;


  end else begin
    N_F_cbOnlyGod.Visible:=false;
    N_F_cbOnlyGod_Sv.Visible:=false;
    N_F_cbOnlyGodR.Visible:=false;
    N_F_cbOnlyGodR_Sv.Visible:=false;
  end;

  edTextVozr.Left := lbVozr.Left+lbVozr.Width+100;


  SetControlFIOUpdate([
    edFamilia, edName, edOtch, BLR_edFamilia, BLR_edName, BLR_edOtch,
    edFamilia_Sv, edName_Sv, edOtch_Sv, BLR_edFamiliaB_Sv, BLR_edNameB_Sv, BLR_edOtchB_Sv
  ],false);

  SetControlCityUpdate([
    edSM_GOROD, BLR_edSM_GOROD, edRG_GOROD, edGT_GOROD, edSM_RAION, edRG_RAION, edGT_RAION,
    edSM_OBL, edRG_OBL, edGT_OBL, BLR_edSM_RAION, BLR_edSM_OBL
  ]);

  ENG_edIdentif.OnUpdateData:=IN_UpdateData;

  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;

//  tsSvid.TabVisible:=GlobalTask.ParamAsBoolean('TS_SVID');
  SetVisibleNomerEkz(pn, edDateSv, N_F_1);

//  для ввода только свидетельства
//  SetOnlyPovtorSvid(pc, tsSvid, [ N_F_1, N_F_edTypeEkz, N_F_cbPovtor, N_F_cbBelorus ], lbSvid);

  n:=6;
  SetLength(FArrAddProperty,n);
  SetAddProperty(0, 'OTHER', '', ftMemo);
  SetAddProperty(1, 'IZMEN', '', ftMemo);
  SetAddProperty(2, 'DECL_DOK', '', ftMemo);
  SetAddProperty(3, 'TEXT_VOZR', '', ftString);
  SetAddProperty(4, 'TEXT_DATES', '', ftString);
  SetAddProperty(5, 'ATEID', '', ftInteger);
//  SetAddProperty(6, 'SM_TEXT', '', ftMemo);
//  SetAddProperty(7, 'SM_TEXT_B', '', ftMemo);
  {$IFDEF GISUN}
    // типы нас. пунктов в кодах ГИС РН
    {
    SetLength(FArrAddProperty,n+3);
    SetAddProperty(n,   'RN_SM_B_GOROD', '', ftString);
    SetAddProperty(n+1, 'RN_RG_B_GOROD', '', ftString);
    SetAddProperty(n+2, 'RN_GT_B_GOROD', '', ftString);
    }
  {$ENDIF}

  SetcbBel(N_F_cbBelorus);

  SetLength(FArrCheckBelField,3);
  WriteToArrCheck(0,  1, false, 'SM_OBL'      , 'SM_OBL_B');
  WriteToArrCheck(1,  2, false, 'SM_RAION'    , 'SM_RAION_B');
  WriteToArrCheck(2,  3, true,  'SM_GOROD'    , 'SM_GOROD_B');

  SetLength(FArrCheckField,6);
  WriteToArrCheck(0,  1, false, 'GT_OBL'    );
  WriteToArrCheck(1,  2, false, 'GT_RAION'  );
  WriteToArrCheck(4,  3, true,  'GT_GOROD'  );
  WriteToArrCheck(5,  4, false, 'GT_RNGOROD');
  WriteToArrCheck(2,  1, false, 'RG_OBL'    );
  WriteToArrCheck(3,  2, false, 'RG_RAION'  );


  SetPanelPovtor(tsPovtor, N_F_cbPovtor, nil, nil);

  //-------- доступен код причины смерти ---------------------------------------
  ENG_edPrNep.Enabled   := true; //GlobalTask.ParamAsBoolean('SMERT_KOD');
  ENG_edPrOsn.Enabled   := edPrOsn_Name.Enabled; // and GlobalTask.ParamAsBoolean('SMERT_KOD');
//  ENG_edPrMesto.Enabled := edPrMesto_Name.Enabled and GlobalTask.ParamAsBoolean('SMERT_KOD');


  //-------- доступна непосредств. причина ---------------------------------------
  if GlobalTask.ParamAsBoolean('SMERT_NEP_PR') then begin
    edPrNep_Name.Enabled:=true;
  end else begin
    edPrNep_Name.Enabled:=false;
    ENG_edPrNep.Enabled:=false;
  end;
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
    if TBSubmenuGISUN.Visible then TBItemStep2.ShortCut:=TextToShortCut('Ctrl+F1');
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN;
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
  TBItemHistCorr.Visible:=FUpdatingObj;
end;

destructor TfmZapisSmert.Destroy;
begin
  slGo.Free;
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
function TfmZapisSmert.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_ZSmert); //
end;

//-------------------------------------------------------------
function TfmZapisSmert.EnableHistoryControl(ActControl:TWinControl):Boolean;
begin
  if ActControl=edGosud_B
    then Result:=false
    else Result:=true;
end;
//-------------------------------------------------------------
procedure TfmZapisSmert.FieldAddHistDop(fld : TField; ActControl:TWinControl);
//var
//  s:String;
begin
{
  if fld.FieldName='SM_OBL' then begin
    FieldAddHist(DokumentSM_OBL_B, BLR_edSM_OBL, s);
  end else if fld.FieldName='SM_RAION' then begin
    FieldAddHist(DokumentSM_RAION_B, BLR_edSM_Raion, s);
  end else if fld.FieldName='SM_GOROD' then begin
    FieldAddHist(DokumentSM_GOROD_B, BLR_edSM_Gorod, s);
  end;
 }
end;

function TfmZapisSmert.NewDok( lAppend : Boolean ): Boolean;
//var
//  SOATO : TSOATO;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

  DokumentTYPE_SPRAV.AsInteger:=1;     // !!! нет реального реквизита     1-выдается 2-не выдавалась
  DokumentDUBL_SPR.AsBoolean:=false;

  DokumentPOVTOR.AsBoolean:=false;
  DokumentPRINT_VOSSTAN.AsBoolean:=false;   // печать в свидетельстве текст причины смерти

  DokumentCOPIA.AsBoolean:=false;
  DokumentRESH_SUDA.AsBoolean:=false;

  DokumentSM_B_RESP.AsBoolean:=false;  // после отправки в ГИС РН корректировались определенные реквизиты

  DokumentSM_B_OBL.AsBoolean:=true;
  DokumentRG_B_OBL.AsBoolean:=true;
  DokumentGT_B_OBL.AsBoolean:=true;
  DokumentONLYGOD.AsInteger:=0;
  DokumentONLYGOD_R.AsInteger:=0;

  DokumentBOMG.AsBoolean:=false;

  DokumentSM_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentRG_B_GOROD.AsInteger:=DokumentSM_B_GOROD.AsInteger;
  DokumentGT_B_GOROD.AsInteger:=DokumentSM_B_GOROD.AsInteger;

  if GlobalTask.ParamAsBoolean('SM_SPR_A5')
    then DokumentREPORT_SIZE.AsString:='A5'
    else DokumentREPORT_SIZE.AsString:='';

  DokumentFirst_Ekz.AsBoolean:=true;
  DokumentPROV.AsBoolean := false;
  DokumentVOSSTAN.AsBoolean := false;
  DokumentVUS.AsBoolean := false;
  DokumentVB.AsBoolean := false;
  N_F_cbBelorus.Checked:=false;

  DokumentEMPTY_PRICH.AsBoolean:=false;
  DokumentDECL_ID.AsInteger:=0;   // полный контроль записи акта

  if lAppend then begin
    CheckRnGorod;
    CheckControlPrSmert;
  end;
  inherited NewDok(lAppend);

  CheckForAll_Bel(DokumentSM_OBL);
  CheckForAll_Bel(DokumentSM_RAION);
  if lAppend
    then CheckSoatoAkt(true,'{SS}', 0, '');

  FCheckSOATO:=false;

  QueryExit:=false;
  Result := true;
end;

function TfmZapisSmert.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField,s : String;
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

  if DokumentDECL_ID.IsNUll or (DokumentDECL_ID.AsInteger>1) then DokumentDECL_ID.AsInteger:=0;

  DokumentEMPTY_PRICH.AsBoolean:=false;
  if DokumentLICH_ID.AsInteger>0 then begin
    DokumentEMPTY_PRICH.AsBoolean:=true;
  end;
  SetIDZags;

  ReadDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));

  DokumentCOPIA.AsBoolean:=false;

  if DokumentSPRAV_NOMER.AsString<>'' then begin
    DokumentTYPE_SPRAV.AsInteger:=1;
  end else if DokumentSPRAV_NOMER.AsString='' then begin
    DokumentDUBL_SPR.AsBoolean:=false;
    DokumentTYPE_SPRAV.AsInteger:=2;
    DokumentSPRAV_DATE.AsString:='';
  end;
  if DokumentDUBL_SPR.IsNull then DokumentDUBL_SPR.AsBoolean:=false;
  if DokumentPOVTOR.IsNull    then DokumentPOVTOR.AsBoolean:=false;
  if DokumentVUS.IsNull       then DokumentVUS.AsBoolean:=false;
  if DokumentVB.IsNull        then DokumentVB.AsBoolean:=false;
  if DokumentRESH_SUDA.IsNull then DokumentRESH_SUDA.AsBoolean:=false;
  if DokumentONLYGOD.IsNull   then DokumentONLYGOD.AsInteger:=0;
  if DokumentONLYGOD_R.IsNull then DokumentONLYGOD_R.AsInteger:=0;
  if DokumentBOMG.IsNull      then DokumentBOMG.AsBoolean:=false;

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

  CheckControlPrSmert;

  TbItemVerno.Checked:=DokumentDECL_ID.AsInteger=1;
  CheckRnGorod;
//  CheckMestoNotPunkt(-1);
  {$IFDEF ZAGS}
    s:=DokumentLICH_NOMER_GIS.AsString;
    TbItemCondIN.Checked:=(s='1');
    CheckImageCondIN_(ENG_edIDENTIF, s, ImCondIN);
  {$ELSE}
    ImCondIN.Visible:=false;
  {$ENDIF}

  Dokument.Post;
  ReadHistory(nID, dmBase.TypeObj_ZSmert);
  N_F_cbTypeSpravChange(nil);

end;

//------------------------------------------------------------------------
procedure TfmZapisSmert.CheckSoatoAkt(lVoenkom:Boolean; strParam:String; nAteID:Integer; strSoato:String);
var
  ATE:TATE;
  SOATO:TSoato;
  n,nAte:Integer;
  sSOATO:String;
begin
  nAte:=nAteID;
  if nAte>0 then begin
    sSoato:=strSoato;
  end else begin
    sSoato:='9000000000';
    nAte:=0;
    ATE:=dmBase.GetATEAkt(Dokument, 'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD', strParam);
    if ATE.ATE_ID>0 then begin
      sSoato:=ATE.Kod;
      nAte:=ATE.ATE_ID;
    end;
//    SOATO:=dmBase.GetSoatoAkt(Dokument,
//          'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD',true,FLenSoato);
//    sSoato:=Soato.Kod;
  end;
  if (Copy(sSOATO,1,1)='9') and N_F_edBOMG.Checked and
     (DokumentGT_GOSUD.IsNull or (DokumentGT_GOSUD.AsInteger=MY_GRAG)) then begin
    ATE:=dmBase.GetATEAkt(Dokument, 'SM_GOSUD,FName;SM_OBL,SM_B_OBL;SM_RAION;SM_GOROD,SM_B_GOROD', strParam);
    if ATE.ATE_ID>0 then begin
      sSoato:=ATE.Kod;
      nAte:=ATE.ATE_ID;
    end;

//    SOATO:=dmBase.GetSoatoAkt(Dokument,
//          'SM_GOSUD,FName;SM_OBL;SM_RAION;SM_GOROD,SM_B_GOROD',true,FLenSoato);
//    sSoato:=SOATO.Kod;
  end;
  EditDataSet(Dokument);
  DokumentSOATO.AsString:=sSOATO;
  DokumentATEID.AsInteger:=nAte;
  if lVoenkom and (DokumentPOL.AsString='М') and FAutoVus then begin  // определение военкомата по СОАТО места жительства
    n:=getVoenkomat(sSOATO, DokumentDateS, DokumentDateR, true);
    if n>0 then begin
      EditDataSet(Dokument);
      DokumentVOENKOM.AsInteger:=n;
    end;
  end;
end;

procedure TfmZapisSmert.lbSOATOGetText(Sender: TObject; var Text: String);
var
  ATE:TAte;
begin
//  Text:=dmBase.GetNameTerr(DokumentSOATO.AsString,false,true);
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
  ATE.Kod:=DokumentSOATO.AsString;
  Text:=FullNameFromATE(ATE, 0, ', ');
end;

procedure TfmZapisSmert.Button4Click(Sender: TObject);
var
//  slATE:TStringList;
  nAteID:Integer;
  strSoato,strName,s:String;
  ATE:TATE;
  ds:TDataSet;
begin
  Gisun.CheckAteGis:=true;
  s:='K_GOROD,Char,20;K_RN_GOROD,Char,20;'+
     'N_OBL,Char,200;N_RAION,Char,200;N_GOROD,Char,200;N_TIP_GOROD,Char,200;N_RN_GOROD,Char,200';
  ds:=dbCreateMemTable(s,'');
  ds.Open;
  ds.Append;
  ds.FieldByName('K_GOROD').AsString:='2458'; //'17030';
  ds.FieldByName('K_RN_GOROD').AsString:='2460';
  ds.Post;
  if Gisun.getSoato(ds, nAteID, strSoato, strName) then begin
    CheckSoatoAkt(true, '{SS}', nAteID, strSoato);
  end else begin
    CheckSoatoAkt(true, '{SS}', 0, '');  // без выбора если несколько значений
  end;
  ds.Close;
  ds.Free;

//  ATE:=dmBase.GetATEAkt(Dokument, 'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD', '{SS}');
//  ShowMessage(ATE.Kod+' '+InttoStr(Ate.ATE_ID)+'  '+Ate.FullName+#13#10+FullNameFromATE(ate, 0, ', '));

//  slATE:=TStringList.Create;
//  n:=dmBase.getATE(slATE, DokumentGT_OBL.AsString, DokumentGT_RAION.AsString, '', DokumentGT_GOROD.AsString, '');
//  slATE.Add('result='+inttostr(n));

//  ShowStrings(slATE,'');
//  slATE.Free;
end;

//------------------------------------------------------------------------
function TfmZapisSmert.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr : String;
//  lWrite:Boolean;
  arr:TArrStrings;
//  SOATO:TSOATO;
  lFullWrite:Boolean;   // полная запись актовой записи
  sSeria,sNomer,sRukov,sRukovB,sSpec,sSpecB:String;
  dDate:TDateTime;
  {$IFNDEF ZAGS}
  nIdFirst,nIDLic : Integer;
  sSoob,sAkt : String;
  vKeyValues : Variant;
  strLich : String;
  lCheckEn : Boolean;
  dLastSost : TDateTime;
  recID:TID;
  {$ENDIF}
begin
  Dokument.CheckBrowseMode;
  AdditiveBeforeWriteDok;

  EditDataSet(Dokument);
  {
  if (DokumentSM_TEXT.AsString<>'') then begin
    DokumentSM_B_GOROD.AsInteger:=100;
    DokumentSM_GOROD.AsString:='';
    DokumentSM_GOROD_B.AsString:='';
  end;
  }
  WriteOtherData(Dokument, 'OTHER', 'RUKOV_D;SPEC_D;COVER_MESSAGE_ID;COVER_MESSAGE_TIME;REQUEST_IN;DECL_IN;PRICH_NOT_DOK;LICH_NOMER_GIS');
  PostDataSet(Dokument);

  Result:=CheckDokument(0,false,true,true);
  strErr:=FLastError;

  lFullWrite:=true;   // полная запись актовой записи
  sSeria:='';
  sNomer:='';
  sRukov:='';
  sRukovB:='';
  sSpec:='';
  sSpecB:='';
  dDate:=0;
  {$IFNDEF ZAGS}
    lCheckEn:=false;
  {$ENDIF}
  if (strErr='') then begin
    if FOnlySvid then begin
      if DokumentID.AsInteger=-1 then  begin  // запись не выбирали
        arr:=dmBase.SeekAkt(TypeObj, DokumentID_ZAGS.AsInteger,
                            DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime, DokumentVOSSTAN.AsBoolean);
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
      Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZSmert, DokumentID_ZAGS.AsInteger,
                     DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime, False, self);
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
    dmBase.tbZapisSmert.Append;
    dmBase.tbZapisSmert.Post;
    nID := dmBase.tbZapisSmert.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if dmBase.tbZapisSmert.FieldByName('ID').AsInteger<>nID then begin
      if not dmBase.tbZapisSmert.Locate('ID', nID, []) then begin
        Result := false;
      end;
    end;
    if Result and not lFullWrite and FOnlySvid then begin   // запись нашли и пишем только свидетельство
       with dmBase.tbZapisSmert do begin
         if not MySameText(FieldByName('FAMILIA').AsString,DokumentFamilia.AsString) or
            not MySameText(FieldByName('NAME').AsString,DokumentName.AsString) or
            not MySameText(FieldByName('OTCH').AsString,DokumentOtch.AsString) or
            (FieldByName('DATER').AsVariant<>DokumentDateR.AsVariant) then begin
            PutError('Данные ФИО и дата рождения не совпадают с данными из актовой записи.',self);
            Result:=false;
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
    if DokumentIS_SDAN_DOK.IsNull then DokumentIS_SDAN_DOK.AsBoolean:=false;

    {$IFNDEF ZAGS}
    // перенесено из (см. ниже приблизительно 70 строк)
    dLastSost := dmBase.LastDateSost;
    if cbProvDvig.Visible and cbProvDvig.Checked then begin
      if (DokumentMEN_ID.AsString<>'') and ((dLastSost = dmBase.GetDateCurrentSost) or (DokumentDATEZ.AsDateTime >= dLastSost)) then begin
        DokumentPROV.AsBoolean := true;
      end;
    end;
    {$ENDIF}

    if FCheckSOATO and not FOnlySvid then
      CheckSoatoAkt(false,'{SS}',0,'');

    Dokument.Post;
//    AddEditSvid(strBookMark);

    dmBase.tbZapisSmert.Edit;
    if lFullWrite then begin
      for i:=1 to dmBase.tbZapisSmert.FieldCount-1 do begin
        strField := dmBase.tbZapisSmert.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          dmBase.tbZapisSmert.Fields[i].Value := fld.Value;
        end;
      end;
      if DokumentEMPTY_PRICH.AsBoolean
        then dmBase.tbZapisSmert.FieldByName('LICH_ID').AsInteger:=1   // в регистр передана пустая причина смерти
        else dmBase.tbZapisSmert.FieldByName('LICH_ID').AsInteger:=0;

      if DokumentTYPE_SPRAV.AsInteger=2 then begin // справка не выдавалась
        dmBase.tbZapisSmert.FieldByName('DUBL_SPR').Value:=null;
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

      if not FPrintSpecSvid
        then dmBase.tbZapisSmert.FieldByName('SPEC_B').AsString:='';

    end;   // <<<< lFullWrite

    WriteDateIzm;
    WriteForAllDok_BeforePost;
    if dmBase.tbZapisSmert.FieldByName('SM_B_RESP').AsBoolean=false
      then dmBase.tbZapisSmert.FieldByName('SM_B_RESP').AsBoolean:=FCheckEditGIS;
    dmBase.tbZapisSmert.Post;

    if lFullWrite then begin
      WriteDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger, STOD('1899-12-30',tdAds));
      WriteHistory(nID, dmBase.TypeObj_ZSmert);
    end;
    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

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
      dmBase.CheckBelFamily( DokumentFamilia.AsString, DokumentFamilia_B.AsString);
      WriteForAll_Bel;
    end;
    {$IFNDEF ZAGS}
// см. выше
//    dLastSost := dmBase.LastDateSost;
    if cbProvDvig.Visible and cbProvDvig.Checked then begin
      // если человека не выбирали, но получили из ГИС РН его ИН попробуем его найти
      if (DokumentLICH_NOMER.AsString<>'') and (DokumentMEN_ID.AsString='') and ((dLastSost = dmBase.GetDateCurrentSost) or (DokumentDATEZ.AsDateTime >= dLastSost)) then begin
        if dmBase.tbMens.Locate('DATE_FIKS;LICH_NOMER', VarArrayOf([dmBase.GetDateCurrentSost,DokumentLICH_NOMER.AsString]), []) then begin
          EditDataSet(Dokument);
          DokumentMEN_ID.AsString:=dmBase.tbMens.FieldByName('ID').AsString;
          PostDataSet(Dokument);
          try
            FMainTable.Edit;
            FMainTable.FieldByName('LICH_NOMER').AsString:=DokumentLICH_NOMER.AsString;
            FMainTable.Post;
          except
          end;
        end;
      end;
      if (DokumentMEN_ID.AsString<>'') and ((dLastSost = dmBase.GetDateCurrentSost) or (DokumentDATEZ.AsDateTime >= dLastSost)) then begin
// см. выше
//        EditDataSet(Dokument);
//        DokumentPROV.AsBoolean := true;
//        PostDataSet(Dokument);

        vKeyValues := VarArrayCreate( [0, 1], varOleStr );
        vKeyValues[0] := dmBase.GetDateCurrentSost;
        vKeyValues[1] := DokumentMEN_ID.AsInteger;
  //      vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, nIdChild);
        if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin

          //------------------------------------------------------
          lCheckEn:=dmBase.CheckRunMen(_TypeObj_ZSmert,CHECK_EN,DokumentMEN_ID.AsInteger,recID);
          //-------------------------------------------------------

          dmBase.tbMens.Edit;
          dmBase.tbMens.FieldByName('PRESENT').AsBoolean  := false;
          dmBase.tbMens.FieldByName('PROPIS').AsBoolean   := false;
          dmBase.tbMens.FieldByName('CANDELETE').AsBoolean := true;
          dmBase.tbMens.FieldByName('AKT_SMER_NOMER').AsString := DokumentNOMER.AsString;
          dmBase.tbMens.FieldByName('AKT_SMER_DATE').AsDateTime:= DokumentDATEZ.AsDateTime;
          dmBase.tbMens.FieldByName('DATES').AsDateTime := DokumentDATES.AsDateTime;
          dmBase.tbMens.FieldByName('DATEV').AsDateTime := DokumentDATES.AsDateTime;
          dmBase.tbMens.FieldByName('LICH_NOMER').AsString := DokumentLICH_NOMER.AsString;
          dmBase.tbMens.Post;
          nIDLic:=dmBase.tbMens.FieldByName('LIC_ID').AsInteger;

          //----------------- запишем место регистрации смерти -------------------
          with dmBase.tbMensAdd do begin
            if not Locate('ID', DokumentMEN_ID.AsInteger, []) then begin
              Append;
              FieldByName('ID').AsInteger := DokumentMEN_ID.AsInteger;
            end else begin
              Edit;
            end;
            FieldByName('AKT_SMER_ORGAN').AsString := fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','');
            Post;
          end;
          if GlobalTask.ParamAsBoolean('AUTO_SMERT_DV') then begin
            WriteDvigMen(DokumentMEN_ID.AsInteger);
          end;
          //------ ВУС ------------------------------------
          if GlobalTask.ParamAsBoolean('AUTO_SN_VUS') then begin
            if dmBase.tbVUS.Locate('ID', DokumentMEN_ID.AsInteger,[]) then begin
              dmBase.tbVUS.Edit;
              WriteDateField(dmBase.tbVUS.FindField('UBIT_DATE'),DokumentDATEZ);

              if DokumentPOL.AsString='М' then sAkt:='Умер' else sAkt:='Умерла';
              sAkt:=sAkt+' '+FormatDateTime('dd.mm.yyyy',DokumentDATES.AsDateTime)+
              ', з/а о смерти №'+DokumentNOMER.AsString+' от '+FormatDateTime('dd.mm.yyyy',DokumentDATEZ.AsDateTime);
              sAkt:=sAkt+' '+GlobalTask.ParamAsString('KNAME');

              dmBase.tbVUS.FieldByName('UBIT_TEXT').AsString:=sAkt;
              dmBase.tbVUS.Post;
            end;
          end;
          sSoob:='*';
          dmBase.CheckCloseLic(nIDLic, DokumentMEN_ID.AsInteger, DokumentDateS.AsDateTime, sSoob);
        end;
      end;
    end;
    if lCheckEn then begin
      SystemProg.SetRunMenReport(recID, 2{'SprMGS'});
    end;
    {$ENDIF}
    if Result then QueryExit:=false;
  end;
  if Result then FlushBuffers;

end;

//-----------------------------------------------------------
// записать движение
procedure TfmZapisSmert.WriteDvigMen(nIdMen:Integer);
{$IFDEF ZAGS}
begin
end;
{$ELSE}
var
  s:String;
  d:TDateTime;
begin
  d:=DokumentDateS.AsDateTime;
  if (d>0) and not dmBase.tbMensDvig.Locate('DATE_FIKS;ID;DATE', VarArrayOf([dmBase.GetDateCurrentSost,nIdMen,d]),[]) then begin
    s:=Globaltask.ParamAsString('PRICH_SMERT');
    dmBase.tbMensDvig.Append;
    dmBase.tbMensDvig.FieldByName('DATE_FIKS').AsDateTime := dmBase.GetDateCurrentSost;
    dmBase.tbMensDvig.FieldByName('ID').AsInteger         := nIdMen;
    dmBase.tbMensDvig.FieldByName('DATE').AsDateTime      := DokumentDateS.AsDateTime;

    dmBase.tbMensDvig.FieldByName('TIP').AsString     := MIGR_UBIL;  // убыл
    dmBase.tbMensDvig.FieldByName('CONTANT').AsString :='1';
    dmBase.tbMensDvig.FieldByName('PRICH').AsString   := s;
    dmBase.tbMensDvig.FieldByName('TALON').AsString   := '';
    dmBase.tbMensDvig.FieldByName('ORGAN').AsString   := fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','');
    dmBase.tbMensDvig.FieldByName('DATE_SROK').AsString:='';
    dmBase.tbMensDvig.Post;
  end;
end;
{$ENDIF}

procedure TfmZapisSmert.edDeclEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  adr : TAdres;
  s : String;
{$IFDEF ZAGS}
  sFIO:String;
{$ELSE}
  v : Variant;
  arrRec : TCurrentRecord;
  nID : Integer;
  strName,sObl : String;
  lCheck : Boolean;
{$ENDIF}
begin
{$IFDEF ZAGS}
  sFIO:='';
  s:=VvodDecl(true,true,sFIO,adr);
  if s<>'' then begin
    EditDataSet(Dokument);
    DokumentDECL.AsString := s;
    PostDataSet(Dokument);
  end;
{$ELSE}
  if ChoiceMen( edDecl, '', '', arrRec) then begin
      lCheck:=dbDisableControls(Dokument);
      try
        EditDataSet(Dokument);
        v := GetValueField(arrRec, 'ID');
//        DokumentDECL_ID.AsInteger := v;
//        nID := DokumentDECL_ID.AsInteger;
        nID := v;
        v := GetValueField(arrRec, 'FAMILIA');
        s := '';
        if v <> null then s := s + v + ' ';
        v := GetValueField(arrRec, 'NAME');
        if v <> null then s := s + v + ' ';
        v := GetValueField(arrRec, 'OTCH');
        if v <> null then s := s + v + ' ';
        adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
        sObl:=fmMain.NameObl('');
        if (sObl<>'') and dmBase.IsAddTypeObl(sObl)
          then sObl:=sObl+' обл.';
        if (sObl<>'') then sObl:=sObl+' ';
        s:=Trim(s)+', '+MY_STRANA+' '+sObl+fmMain.NameRaion('');
        if adr.Punkt<>'' then s:=s+' '+adr.Punkt;
        if adr.Ulica<>'' then s:=s+' '+adr.Ulica;
        if adr.NDom<>''  then s:=s+' '+SokrDOM+adr.NDom;
        if adr.Kv<>''    then s:=s+' '+SokrKV+adr.Kv;
        DokumentDECL.AsString := s;
        s := dmBase.GetPasport(nID, arrRec,', ');
        if s <> ''
          then DokumentDECL_DOK.AsString:=s;
        PostDataSet(Dokument);
      finally
        dbEnableControls(Dokument,lCheck);
      end;
  end;
{$ENDIF}
end;

procedure TfmZapisSmert.edFamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
{$IFNDEF ZAGS}
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
{$IFNDEF ZAGS}
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
      DokumentLICH_NOMER.AsString := CheckRus2(Pasport.LichNomer);
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      DokumentGT_GOROD.AsString := '';
      if adr.Punkt <> '' then DokumentGT_GOROD.AsString := adr.PunktN;
      if adr.PunktTK>0 then DokumentGT_B_GOROD.AsInteger:= adr.PunktTK;
      if adr.UlicaDom <> '' then begin
//        DokumentGT_GOROD_R.AsString:=adr.UlicaDom
        DokumentGT_GOROD_R.AsString:=adr.Ulica;

        DokumentGT_GOROD_R.AsString:=adr.Ulica;
        DokumentGT_DOM.AsString:=adr.NDom;
        DokumentGT_KORP.AsString:=adr.Korp;
        DokumentGT_KV.AsString:=adr.Kv;
      end else begin
        DokumentGT_GOROD_R.AsString:='';
      end;
      CheckSoatoAkt(false,'{SS}{CHOICE}',0,'');
      PostDataSet(Dokument);
      finally
        dbEnableControls(Dokument,lCheck);
        Screen.Cursor := old;
      end;
  end;
{$ENDIF}
end;

procedure TfmZapisSmert.edPolChange(Sender: TObject);
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

procedure TfmZapisSmert.UpdateActions;
begin
  inherited;
  {$IFNDEF ZAGS}
  if (DokumentMEN_ID.AsString='') or (DokumentMEN_ID.AsString='0') then begin
    edFamilia.Font.Color := clBlack;
    TBItemTalonUbit.Enabled:=false;
  end else begin
    edFamilia.Font.Color := clRed;
    TBItemTalonUbit.Enabled:=true;
  end;
  {
  if (DokumentDECL_ID.AsString='') or (DokumentDECL_ID.AsString='0') then begin
    edDecl.Font.Color := clBlack;
  end else begin
    edDecl.Font.Color := clBlue;
  end;
  }
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

procedure TfmZapisSmert.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField,s : String;
  Pol : TPol;
  lCheck : Boolean;
  p:TPassport;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    strField:=ANSIUpperCase(Field.FieldName);
    if strField = 'FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentMEN_ID.AsString:='';
      end;
    end else if strField = 'DECL' then begin
//      if Field.AsString = '' then begin
//        DokumentDECL_ID.AsString:='';
//      end;
    end else if strField = 'IS_SDAN_DOK' then begin
      if (DokumentDOK_NOMER.AsString<>'') and (DokumentSDAN_DOK.AsString='') then begin
        p := dmBase.PasportFromValues(DokumentDOK_TYPE.AsInteger, DokumentDOK_SERIA.AsString, DokumentDOK_NOMER.AsString,
                                      DokumentDOK_NAME.AsString, '', DokumentDOK_DATE.Value);
        s := dmBase.PasportToText(p,0);
        if s<>'' then DokumentSDAN_DOK.AsString:=s;
      end;
    end else if (strField='DATER') or (strField='DATES') then begin
      if not DokumentDateR.IsNull and not DokumentDateS.IsNull then begin
        try
          DokumentVOZR.AsInteger:=GetCountYear( DokumentDateS.AsDateTime, DokumentDateR.AsDateTime);
        except
          DokumentVOZR.AsString:='';
        end;
        if (DokumentWORK_NAME.AsString='') and (Trud(DokumentDATES.AsDateTime, DokumentDATER.AsDateTime, DokumentPOL.AsString)=2) then begin
          if DokumentPOL.AsString='М'
            then DokumentWORK_NAME.AsString:='Пенсионер'
            else DokumentWORK_NAME.AsString:='Пенсионерка';
          DokumentWORK_NAME.AsString:=DokumentWORK_NAME.AsString+', пенсия';
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
    end else if (strField = 'GT_GOROD') or (strField = 'GT_RNGOROD') then begin
      if (strField='GT_RNGOROD') and (Field.AsString<>'')
        then DokumentGT_RAION.AsString:='';
      {$IFDEF LAIS}
        CheckSoatoAkt(true,'{SS}',0,'');
      {$ELSE}
        CheckSoatoAkt(true,'{CHOICE}',0,'');
      {$ENDIF}
    end else if (strField = 'GT_RAION') then begin
      if (Field.AsString<>'')
        then DokumentGT_RNGOROD.AsString:='';
    end;
    FRun := true;
    if FCheckBelName then begin
      EditDataSet(Dokument);
      Pol := tpNone;
      lCheck := false;
      if strField='NAME' then begin
        DokumentName_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
        lCheck := true;
      end else if strField='OTCH' then begin
        DokumentOtch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
        lCheck := true;
      end else if strField='FAMILIA' then begin
        DokumentFamilia_B.AsString := dmBase.GetBelFamily( Field.AsString );
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

function TfmZapisSmert.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
  {$IFNDEF ZAGS}
  if Result then begin
    cbProvDvig.Checked := not DokumentPROV.AsBoolean;
  end;
  {$ENDIF}

  if GlobalTask.ParamAsBoolean('SMERT_KOD') then begin
    SetMRUList(ENG_edPrNep,20999,4,true,false,false,false); //FAddButtonMRUList);
    SetMRUList(ENG_edPrOsn,20999,4,true,false,false,false); //FAddButtonMRUList);
    SetMRUList(ENG_edPrOsn_Sv,20999,4,true,false,false,false); //FAddButtonMRUList);
  end;

// в методе Create отключена проверка FCheckLookupField:=false
  if FOnlySvid then begin
    n:=LimitMRUList(3);
    SetMRUList(edGorod_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);
    n:=LimitMRUList(1);
    SetMRUList(edOBL_Sv,n,1,true,false,false,FAddButtonMRUList);
    n:=LimitMRUList(2);
    SetMRUList(edRAION_Sv,n,2,true,false,false,FAddButtonMRUList);
  end else begin
    n:=LimitMRUList(3);
    SetMRUList(edSM_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edRG_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edGT_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    if tsSvid.TabVisible
      then SetMRUList(edGOROD_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);

    n:=LimitMRUList(1);
    SetMRUList(edSM_OBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edRG_OBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edGT_OBL,n,1,true,false,false,FAddButtonMRUList);
    if tsSvid.TabVisible
      then SetMRUList(edOBL_Sv,n,1,true,false,false,FAddButtonMRUList);

    n:=LimitMRUList(2);
    SetMRUList(edSM_RAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edRG_RAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edGT_RAION,n,2,true,false,false,FAddButtonMRUList);
    if tsSvid.TabVisible
      then SetMRUList(edRAION_Sv,n,2,true,false,false,FAddButtonMRUList);
  end;
//  SetFlat(GlobalFlat);

end;

procedure TfmZapisSmert.N_F_cbBelorusClick(Sender: TObject);
begin
  DestroyHint(H);
  if N_F_cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;

    edRukov.DataField   := 'RUKOV_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
    edZAGS.DataField := 'NAME_ZAGS_B';
  end else begin
    ActivateRUSKeyboard;
    edRukov.DataField   := 'RUKOV';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
    edZAGS.DataField := 'NAME_ZAGS';
  end;
end;

procedure TfmZapisSmert.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZapisSmert.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmZapisSmert.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZapisSmert.edFamiliaEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edFamilia,DokumentFamilia.AsString+' ');
end;

procedure TfmZapisSmert.edNameEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edName,DokumentName.AsString+' ');
end;

procedure TfmZapisSmert.edOtchEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edOtch,DokumentOtch.AsString+' ');
end;

procedure TfmZapisSmert.edFamiliaCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmZapisSmert.edRukovEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

procedure TfmZapisSmert.Label45Click(Sender: TObject);
//var
//  nYear,nMonth,nDay : Integer;
begin
//  Dokument.CheckBrowseMode;
//  SubDate(DokumentSPRAV_DATE.AsDateTime, DokumentMAT_DATER.AsDateTime,
//   nYear,nMonth,nDay);
//  Label45.Caption := IntToStr(nYear)+'   '+IntToStr(nMonth)+'    '+IntToStr(nDay);
end;

procedure TfmZapisSmert.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex=1 then begin
//    if (DokumentNOMER.AsString<>'') and (DokumentSPRAV_NOMER.AsString='') then begin
//      Dokument.CheckBrowseMode;
//      Dokument.Edit;
//      DokumentSPRAV_NOMER.AsString := DokumentNOMER.AsString;
//    end;
    if SpravEnabled and (DokumentDATEZ.AsString<>'') and (DokumentSPRAV_DATE.AsString='') and (DokumentSPRAV_NOMER.AsString='') then begin
//      if (DokumentID.AsInteger<=0) or (DokumentFAMILIA.AsString='') and (DokumentSPRAV_DATE.AsString='') and (DokumentSPRAV_NOMER.AsString='') then begin
        Dokument.CheckBrowseMode;
        Dokument.Edit;
        DokumentSPRAV_DATE.AsDateTime := DokumentDATEZ.AsDateTime;
        DokumentSPRAV_NOMER.AsString  := DokumentNOMER.AsString;
//      end;
    end;
    if not DokumentDATES.IsNull and not DokumentDATER.IsNull then begin
      if (DokumentWORK_NAME.AsString='') and (Trud(DokumentDATES.AsDateTime, DokumentDATER.AsDateTime, DokumentPOL.AsString)=2) then begin
        Dokument.CheckBrowseMode;
        Dokument.Edit;
        if DokumentPOL.AsString='М'
          then DokumentWORK_NAME.AsString:='Пенсионер'
          else DokumentWORK_NAME.AsString:='Пенсионерка';
        DokumentWORK_NAME.AsString:=DokumentWORK_NAME.AsString+', пенсия';
      end;
    end;
  end;

  if pc.ActivePageIndex>-1 then begin
    if pc.Pages[pc.ActivePageIndex].Name='tsSvid'
      then CheckForAll_Bel( nil )
      else N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];

//    if (pc.ActivePageIndex=1) or (pc.Pages[pc.ActivePageIndex].Name='tsSvid')
//      then N_F_cbPovtor.Parent:=pc.Pages[pc.ActivePageIndex];
  end;

end;

procedure TfmZapisSmert.TBItemArxSprClick(Sender: TObject);
begin
  tsSprav.TabVisible := TBItemArxSpr.Checked;
//  edAddTextArx.Text := EmptyIzm+'.';// 'Изменения, исправления, дополнения в запись акта о смерти не вносились.';
end;

procedure TfmZapisSmert.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  AddSvid;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisSmert.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisSmert.CheckOnlyGod(lSv:Boolean);
var
  n:Integer;
begin
  if lSv then begin
    n:=N_F_cbOnlyGod_Sv.ItemIndex;
    N_F_cbOnlyGod.ItemIndex:=n;
  end else begin
    n:=N_F_cbOnlyGod.ItemIndex;
    N_F_cbOnlyGod_Sv.ItemIndex:=n;
  end;
  if n=3 then begin
    edDATES.Visible:=false;
    edDATES_Sv.Visible:=false;
    edTextDateS.Visible:=true;
    edTextDateS_Sv.Visible:=true;
  end else begin
    edDATES.Visible:=true;
    edDATES_Sv.Visible:=true;
    edTextDateS.Visible:=false;
    edTextDateS_Sv.Visible:=false;
  end;
  if n=3 then begin          // дата смерти неизвестна точно
    edTextDateS.Left:=edDATES.Left;
    edTextDateS_Sv.Left:=edDATES_Sv.Left;
    edTextDateS_Sv.Top:=edDATES_Sv.Top;
  end else if n=2 then begin // год и месяц
    edDATES.EditButton.Visible:=false;
    edDATES.EditFormat:='MM.YYYY';
    edDATES_SV.EditButton.Visible:=false;
    edDATES_SV.EditFormat:='MM.YYYY';
  end else if n=1 then begin // год
    edDATES.EditButton.Visible:=false;
    edDATES.EditFormat:='YYYY';
    edDATES_SV.EditButton.Visible:=false;
    edDATES_SV.EditFormat:='YYYY';
  end else begin      // полная дата
    edDATES.EditButton.Visible:=true;
    edDATES.EditFormat:='DD.MM.YYYY';
    edDATES_SV.EditButton.Visible:=true;
    edDATES_SV.EditFormat:='DD.MM.YYYY';
  end;
end;

procedure TfmZapisSmert.CheckOnlyGodR(lSv:Boolean);
var
  n:Integer;
begin
  if lSv then begin
    n:=N_F_cbOnlyGodR_Sv.ItemIndex;
    N_F_cbOnlyGodR.ItemIndex:=n;
  end else begin
    n:=N_F_cbOnlyGodR.ItemIndex;
    N_F_cbOnlyGodR_Sv.ItemIndex:=n;
  end;
  if n=3 then begin
    edDATER.Visible:=false;
    edDATER_Sv.Visible:=false;
    edTextVozr.Visible:=true;
    edTextVozr_Sv.Visible:=true;
  end else begin
    edDATER.Visible:=true;
    edDATER_Sv.Visible:=true;
    edTextVozr.Visible:=false;
    edTextVozr_Sv.Visible:=false;
  end;
  if n=3 then begin          // дата рождения неизвестна
    edTextVozr.Left:=edDATER.Left;
    edTextVozr_Sv.Left:=edDATER_Sv.Left;
    edTextVozr_Sv.Top:=edDATER_Sv.Top;
  end else if n=2 then begin          // год и месяц
    edDATER.EditButton.Visible:=false;
    edDATER.EditFormat:='MM.YYYY';
    edDATER_SV.EditButton.Visible:=false;
    edDATER_SV.EditFormat:='MM.YYYY';
  end else if n=1 then begin // год
    edDATER.EditButton.Visible:=false;
    edDATER.EditFormat:='YYYY';
    edDATER_SV.EditButton.Visible:=false;
    edDATER_SV.EditFormat:='YYYY';
  end else begin      // полная дата
    edDATER.EditButton.Visible:=true;
    edDATER.EditFormat:='DD.MM.YYYY';
    edDATER_SV.EditButton.Visible:=true;
    edDATER_SV.EditFormat:='DD.MM.YYYY';
  end;
end;

procedure TfmZapisSmert.edSM_OBL_RNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisSmert.edSM_RAION_RNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisSmert.edGT_RNGORODNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

//--------------------------------------------------------------------------
procedure TfmZapisSmert.CheckControlPrSmert;
begin
  TbItemEmptyPrich.Checked := DokumentEMPTY_PRICH.AsBoolean;
  if DokumentEMPTY_PRICH.AsBoolean then begin
    ENG_edPrNep.Color:=GetNoTransferColor;
    ENG_edPrOsn.Color:=GetNoTransferColor;
    ENG_edPrNep.Hint:='Без передачи кода причины смерти';
    ENG_edPrOsn.Hint:=ENG_edPrNep.Hint;
    if Gisun.GetPoleGrn(Dokument)=rPost
      then TBItemRegPrSmert.Visible:=true
      else TBItemRegPrSmert.Visible:=false;
  end else begin
    ENG_edPrNep.Color:=GetControlColor;
    ENG_edPrOsn.Color:=GetControlColor;
    ENG_edPrNep.Hint:='';
    ENG_edPrOsn.Hint:='';
    TBItemRegPrSmert.Visible:=false;
  end;
  if (Gisun.GetPoleGrn(Dokument)=rPost) and TbItemEmptyPrich.Checked then begin
    TbItemEmptyPrich.Enabled:=false;
  end else begin
    TbItemEmptyPrich.Enabled:=true;
  end;
end;

//--------------------------------------------------------------------------
procedure TfmZapisSmert.CheckRnGorod;
//var
//  nW,nL,nT, nW1 : Integer;
begin
{
  if EnabledRnGorod or
     (not DokumentGT_B_RN.IsNull and not DokumentGT_B_RN.AsBoolean) then begin
    edGT_RNGOROD.Visible := true;
    pnGT_ADRES.Left:=edGT_RNGOROD.Left+edGT_RNGOROD.Width+5;
  end else begin
    edGT_RNGOROD.Visible := false;
    pnGT_ADRES.Left:=edGT_RNGOROD.Left;
  end;
}
{
  if EnabledRnGorod or
     (not DokumentGT_B_RN.IsNull and not DokumentGT_B_RN.AsBoolean) then begin
    nW  := edGT_GOROD_R.Width;
    nL  := edGT_RAION.Left;
    nT  := edGT_GOROD_R.Top;
    nW1 := edGT_RNGOROD.Width;
    edGT_RNGOROD.Left  := nL;
    edGT_RNGOROD.Top   := nT;
//    edGT_GOROD_R.Width := nW - nW1 - 5;
    edGT_GOROD_R.Left  := nL + nW1 + 5;
    edGT_RNGOROD.Visible := true;
  end else begin
    edGT_RNGOROD.Visible := false;
  end;
}
end;

//--------------------------------------------------------------------------
procedure TfmZapisSmert.CheckMestoNotPunkt(nType:Integer);
var
  l:Boolean;
begin
  if nType=-1 then begin
    if (DokumentSM_TEXT.AsString<>'')
      then nType:=1
      else nType:=0;
  end;
  if nType=1 then begin
    TBItemMesto.Checked:=true;
    DokumentSM_B_GOROD.AsInteger:=100;
    DokumentSM_GOROD.AsString:='';
    DokumentSM_GOROD_B.AsString:='';
    TbItemMesto.Checked:=true;
    l:=false;
    edSM_TEXT.Left:=edSM_RAION.Left;
    edSM_TEXT.Width:=edSM_RAION.Width;
    BLR_edSM_TEXT.Left:=BLR_edSM_RAION.Left;
    BLR_edSM_TEXT.Width:=BLR_edSM_RAION.Width;
  end else begin
    DokumentSM_TEXT.AsString:='';
    DokumentSM_TEXT_B.AsString:='';
    TbItemMesto.Checked:=false;
    l:=true;
  end;
  edSM_GOROD.Visible:=l;
  edSM_B_GOROD.Visible:=l;
  BLR_edSM_B_GOROD.Visible:=l;
  BLR_edSM_GOROD.Visible:=l;
  edSM_TEXT.Visible:=not l;
  BLR_edSM_TEXT.Visible:=not l;
end;

procedure TfmZapisSmert.N_F_cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod(false);
end;

procedure TfmZapisSmert.N_F_cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR(false);
end;

procedure TfmZapisSmert.N_F_cbOnlyGod_SvChange(Sender: TObject);
begin
  CheckOnlyGod(true);
end;

procedure TfmZapisSmert.N_F_cbOnlyGodR_SvChange(Sender: TObject);
begin
  CheckOnlyGodR(true);
end;


procedure TfmZapisSmert.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetSmert(Self);
//  Gisun.CheckSmert(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisSmert.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterSmert(Self);
//  Gisun.CheckSmert(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisSmert.TBItemRegPrSmertClick(Sender: TObject);
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
//------------------------------------------------------------
procedure TfmZapisSmert.edVoenkomEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  if Globaltask.ParamAsString('ID_VOENKOM')<>''
    then edVoenkom.Value:=Globaltask.ParamAsString('ID_VOENKOM');
  N_F_cbVUS.Checked:=true;
end;
//------------------------------------------------------------
procedure TfmZapisSmert.edVoenkomEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  edVoenkom.Value:=null;
  N_F_cbVUS.Checked:=false;
end;
//------------------------------------------------------------
procedure TfmZapisSmert.edVoenkomEditButtons2Click(Sender: TObject;  var Handled: Boolean);
var
  SOATO:TSOATO;
  n:Integer;
begin
  SOATO:=dmBase.GetSoatoAkt(Dokument, 'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD',true,FLenSoato);
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
//---------------------------------------------------------------------
procedure TfmZapisSmert.edVoenkomChange(Sender: TObject);
begin
  if edVoenkom.Value<>null
    then N_F_cbVUS.Checked:=true;
end;

procedure TfmZapisSmert.edSdanDokEditButtons0Click(Sender: TObject;  var Handled: Boolean);
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
      EditDataSet(Dokument);
      DokumentDOK_TYPE.AsString:=tbDOK_TYPE.AsString;
      DokumentDOK_SERIA.AsString:=tbDOK_SERIA.AsString;
      DokumentDOK_NOMER.AsString:=tbDOK_NOMER.AsString;
      DokumentDOK_ORGAN.AsString:=tbDOK_ORGAN.AsString;
      DokumentDOK_NAME.AsString:=tbDOK_NAME.AsString;
      WriteDateField(DokumentDOK_DATE,tbDOK_DATE);
      p := dmBase.PasportFromValues(tbDOK_TYPE.AsInteger, tbDOK_SERIA.AsString, tbDOK_NOMER.AsString,
                           tbDOK_NAME.AsString, '', tbDOK_DATE.Value);
      s := dmBase.PasportToText(p,0);
      if s<>'' then begin
        DokumentSDAN_DOK.AsString:=s;
        DokumentIS_SDAN_DOK.AsBoolean:=true;
      end;
      PostDataSet(Dokument);
    end;
  end;
end;

//------------------------------------------------------------------------------------------------
procedure TfmZapisSmert.edDeclDokEditButtons0Click(Sender: TObject;  var Handled: Boolean);
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
procedure TfmZapisSmert.edSpecEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edSpec,DokumentSPEC.AsString+' '); end;

procedure TfmZapisSmert.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 13);
  CheckValueDateZAGS(edDateS.Value,edDateS, 2);
end;

procedure TfmZapisSmert.edDateSUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(edDateR.Value,edDateR, 13);
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 2);
end;

procedure TfmZapisSmert.TBItemTalonUbitClick(Sender: TObject);
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

procedure TfmZapisSmert.edSOATOClick(Sender: TObject);
begin
  if IsEmptySOATO(DokumentSOATO.AsString) or QuerySoato(FQuerySOATO)
    then CheckSoatoAkt(true,'{CHOICE}',0,'');
end;

function TfmZapisSmert.CreateSubMenuRun: Boolean;
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

  TbItemEmptyPrich := TTbItem.Create(TBSubmenuRun);
  TbItemEmptyPrich.Caption:='Передать в регистр с пустой причиной';
  TbItemEmptyPrich.OnClick:=Event_EmptyPrich;
  TBSubmenuRun.Add(TbItemEmptyPrich);

  TbItemVerno := TTbItem.Create(TBSubmenuRun);
  TbItemVerno.Caption:='Запись акта верна';
  TbItemVerno.OnClick:=Event_TrueAkt;
  TBSubmenuRun.Add(TbItemVerno);

  AddSubmenu_ReadDolg;
  AddSubmenu_ParCopy;

  {$IFDEF ZAGS}
  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);
  TbItemCondIN := TTbItem.Create(TBSubmenuRun);
  TbItemCondIN.Caption:='Идентификационный номер не подлежит печати';
  TbItemCondIN.OnClick:=Event_CondIN;
  TBSubmenuRun.Add(TbItemCondIN);
  {$ENDIF}

  {
  TBItemMesto:=TTbItem.Create(TBSubmenuRun);
  TBItemMesto.Caption:='Смерть наступила вне населенного пункта';
  TBItemMesto.OnClick:=Event_MestoNotPunkt;
  TBSubmenuRun.Add(TBItemMesto);
  }


{  it := TTbItem.Create(TBSubmenuPar);
  it.Caption:='Размер оперативной справки А5';
  it.OnClick:=Event_ReportSize;
  TBSubmenuRun.Add(it);}
end;

function TfmZapisSmert.EmptyIzm: String;
begin
  Result:=SprSmert_EmptyIzm;  // uProject
end;

procedure TfmZapisSmert.edIDENTIFUpdateData(Sender: TObject; var Handled: Boolean);
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

procedure TfmZapisSmert.edOBL_SvChange(Sender: TObject);
var
  s:String;
  sl:TStringList;
begin
  if not FRun and edObl_Sv.MRUList.DroppedDown then begin
    s:=edObl_Sv.Text;
    sl:=TStringList.Create;
    edObl_Sv.MRUList.FilterItemsTo(sl,s);
//    label34.Caption:=sl.Text;
    if sl.count=1 then begin
      FRun := true;
      edObl_Sv.Text:=sl.Strings[0];
//      MRUListOpen(Sender,Handled);
      PostMessage(edOBL_Sv.Handle, WM_CHAR, VK_ESCAPE, 0);

//      edObl_Sv.MRUList.DropDown;
//      edObl_Sv.MRUList.CloseUp(true);
    end;
    sl.Free;
    FRun:=false;
  end;
end;

procedure TfmZapisSmert.WM_CloseMRUList(var rec: TMsg);
begin
//  SendKeys('{DOWN}{ENTER}', false);
//  edObl_Sv.MRUList.CloseUp(true);
end;


procedure TfmZapisSmert.FormResize(Sender: TObject);
begin
  inherited;
//  imBE.Left:=cbBel.Left+20;
end;

procedure TfmZapisSmert.Button1Click(Sender: TObject);
begin
  SaveDokumentToFile;
end;

procedure TfmZapisSmert.Button2Click(Sender: TObject);
var
  sFile:String;
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
procedure TfmZapisSmert.lbVozrGetText(Sender: TObject; var Text: String);
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

procedure TfmZapisSmert.edFactEnter(Sender: TObject);
begin
  SendKeys('{END}', false);
end;

//---------------------------------------------------------------------------------------
procedure TfmZapisSmert.ENG_edPrOsnUpdateData(Sender: TObject;  var Handled: Boolean);
var
  ed,edN : TDbEditEh;
  s,ss,sAdd : String;
begin
  ed := TDbEditEh(Sender);
  s  := ANSIUpperCase(Trim(ed.Text));
  if s<>'' then begin
    CharDel(s,' ');
    s:=CheckRUS2(s);
    s:=CheckEngI(s);   // замена бел. І на английскую I

    if ed.DataField='PR_NEP' then begin
      edN:=edPrNep_Name;
      sAdd:='Непосредственная причина смерти:';
    end else if ed.DataField='PR_OSN' then begin
      edN:=edPrOsn_Name;
      sAdd:='Основная причина смерти:';
    end else begin
      edN:=edPrMesto_Name;
      sAdd:='Место и обстоятельства смерти:';
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
  end;
end;

//------------------------------------------------------------------------
procedure TfmZapisSmert.CheckControlSvid;
var
  n:Integer;
  c : TColumnEh;
begin
  c := DbGridEh1.FieldColumns['FIRST'];
  c.Visible:=true;

  if GlobalTask.ParamAsBoolean('INVERT_SVID') then begin
    Init_ArrCheckControl(11);
    n:=0;
    FArrCheckControl[n].Cont1:=edFamilia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edFamiliaB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edName_Sv;
    FArrCheckControl[n].Cont2:=BLR_edNameB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edOtch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOtchB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=Label76;
    FArrCheckControl[n].Cont2:=Label77; Inc(n);

    FArrCheckControl[n].Cont1:=edPrOsn_Name_Sv;
    FArrCheckControl[n].Cont2:=BLR_edPrOsn_Name_B_Sv; Inc(n);  //5

    FArrCheckControl[n].Cont1:=edGosud_Sv;
    FArrCheckControl[n].Cont2:=BLR_edGosudB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edObl_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOblB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edRAION_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRaionB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edGorod_Sv;
    FArrCheckControl[n].Cont2:=BLR_edGorodB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edTypeGorod_Sv;
    FArrCheckControl[n].Cont2:=BLR_edTypeGorodB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edRukov_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRukovB_Sv; Inc(n);     // 11
  end;
end;

function TfmZapisSmert.CheckDokumentSimple(nType: Integer; lWriteDok:Boolean): Boolean;
var
  strErr,s:String;
  i:Integer;
  procedure AddErr(s:String);
  begin
    strErr:=strErr+s+chr(13)+chr(10);
  end;
begin
  Result:=inherited CheckDokumentSimple(nType, lWriteDok);
  if Result then begin
    strErr := '';
    if DokumentDATEZ.IsNull      then AddErr(' Заполните дату акта о смерти. ');
    if DokumentNOMER.AsString='' then AddErr(' Заполните номер акта о смерти. ');
    if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then AddErr(' Заполните Фамилия, Имя. ');
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

    if FWriteBeforeGisun and (Trim(DokumentSVID_NOMER.AsString)<>'') then begin
      s:=CheckFieldDate(DokumentDATESV,-1,YearOf(dmBase.GetCurDate),false,'<',DokumentDATEZ);
      if s<>'' then  AddErr('Дата выдачи свидетельства '+s);
    end;

    if FAddNewDok {DokumentID.AsInteger=-1} then begin // запись акта еще не сохранялась
      if (DokumentDECL_ID.AsInteger=0) and (DokumentDateZ.AsDateTime>IncDay(dmBase.GetCurDate,-31)) then begin  // если не прошло 31 дней
        if not FOnlySvid and (DokumentPOVTOR.AsBoolean=false) and (DokumentVOSSTAN.AsBoolean=false) then begin
          if DokumentDateR.IsNull and (DokumentTEXT_VOZR.AsString='') then AddErr('Заполните дату рождения.');
          if DokumentDateS.IsNull and (DokumentTEXT_DATES.AsString='') then AddErr('Заполните дату смерти.');
          // если мой гражданин, не бомж и сдан документ
          if (DokumentGRAG.AsInteger=MY_GRAG) and (DokumentGT_GOSUD.AsInteger=MY_GRAG) and
             not DokumentBOMG.AsBoolean and DokumentIS_SDAN_DOK.AsBoolean then begin

            s:=CheckRnBigGorod(DokumentGT_GOROD, DokumentGT_RAION, DokumentGT_RNGOROD);
            if s<>'' then AddErr(FirstCharUpper(s));
            if (Copy(DokumentSOATO.AsString,2,6)='000000') or
               ( (Pos( Copy(DokumentSOATO.AsString,1,4)+',',GOROD_WITH_RN)>0) and (Copy(DokumentSOATO.AsString,5,3)='000'))
              then AddErr('Не определен код территории места жительства.')
          end;
        end;
      end;
    end;
    FLastError:=strErr;
    if FLastError<>'' then Result:=false;
  end;
end;

//-------------------------------------------------------------------
procedure TfmZapisSmert.AfterCheckAkt_GISUN(nType:Integer);
begin
  CheckControlPrSmert;
end;

//-------------------------------------------------------------------
procedure TfmZapisSmert.Event_EmptyPrich(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentEMPTY_PRICH.AsBoolean:=not DokumentEMPTY_PRICH.AsBoolean;
  CheckControlPrSmert;
end;

//-------------------------------------------------------------------
procedure TfmZapisSmert.Event_TrueAkt(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  if TTbItem(Sender).Checked
    then DokumentDECL_ID.AsInteger:=1
    else DokumentDECL_ID.AsInteger:=0;
end;
//-------------------------------------------------------------------
procedure TfmZapisSmert.Event_CondIN(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  if TTbItem(Sender).Checked
    then DokumentLICH_NOMER_GIS.AsString:='1'
    else DokumentLICH_NOMER_GIS.AsString:='0';
  CheckImageCondIN_(ENG_edIDENTIF, DokumentLICH_NOMER_GIS.AsString, ImCondIN);
end;
//-------------------------------------------------------------------
{
procedure TfmZapisSmert.Event_MestoNotPunkt(Sender: TObject);
begin
  EditDataSet(Dokument);
  if TTbItem(Sender).Checked
    then CheckMestoNotPunkt(0)
    else CheckMestoNotPunkt(1);
end;
}
//-------------------------------------------------------------------
procedure TfmZapisSmert.Event_TextVozr(Sender: TObject);
begin
end;
//-------------------------------------------------------------------------------
procedure TfmZapisSmert.CheckPanelMestoGit;
begin
  if GlobalTask.ParamAsBoolean('ZSMERT_GIT') then begin   // на второй части
    gbGit.Parent:=ts2;
    gbGit.Top:=3;
    pnTs2.Top:=gbGit.Top+gbGit.Height+4;
    pnTs2.Align:=alNone;
    edRG_GOROD.HelpContext:=999;
    edSem.HelpContext:=0;
    edGT_KV.HelpContext:=0;
    edGT_GOSUD.HelpContext:=888;
    gbGit.TabOrder:=0;
    pnTs2.TabOrder:=1;
  end else begin
    pnTs2.Height:=Ts2.Height;
    pnTs2.Align:=alClient;
//    edIzmen.Height:=edIzmen.Height+100;
  end;
  if not GlobalTask.ParamAsBoolean('BLR_PRSM') then begin   // не покаывать причину смерти на бел. языке
    BLR_edPrNep_Name.Visible:=false;
    BLR_edPrOsn_Name.Visible:=false;
    edPrNep_Name.Width:=edPrNep_Name.Width+BLR_edPrNep_Name.Width+5;
    edPrOsn_Name.Width:=edPrOsn_Name.Width+BLR_edPrOsn_Name.Width+5;
    edPrNep_Name.Anchors:=[akTop, akLeft, akRight];
    edPrOsn_Name.Anchors:=[akTop, akLeft, akRight];
  end;
end;
//-------------------------------------------------------------------------------
procedure TfmZapisSmert.SetOnlyPovtorSvid(lOnlyPovtor: Boolean; pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;
                                          lbSvid, lbNomer: TLabel);
begin
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
  if lOnlyPovtor then begin
//  TBSubmenuGISUN.Visible:=false;
    TBItemSeekAkt.Visible:=true;
    TBItemStep2.Caption:='Зарегистрировать свидетельство';
    TBItemArxSpr.Visible:=false;
//    TBItemChoiceBrak.Visible:=false;
//    TBItemChoiceRogd.Visible:=false;
//    TBItemVozrast.Visible:=false;

  end;
end;
//-------------------------------------------------------------------------------
procedure TfmZapisSmert.CheckTsSvidPovtor;
begin
  inherited CheckTsSvidPovtor;
//  if not N_F_cbPovtor.Checked
//    then N_F_cbTextPr.Checked:=false;
//  N_F_cbTextPr.Enabled:=N_F_cbPovtor.Checked;
end;
//-------------------------------------------------------------------------------
procedure TfmZapisSmert.edRukov_SvEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov_Sv);
end;
procedure TfmZapisSmert.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;
procedure TfmZapisSmert.edSpecEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;
//-------------------------------------------------------------------------------
procedure TfmZapisSmert.FormCreate(Sender: TObject);
begin
  inherited;
//  ListBox1.Items.Assign(Screen.Fonts);   см.ниже
end;
//-------------------------------------------------------------------------------
procedure TfmZapisSmert.Button3Click(Sender: TObject);
begin
  inherited;
//  GlobalFontNameE:=listbox1.Items.Strings[listbox1.ItemINdex];
//  SetFlatEhComp(Self,GlobalFlat,FCharCase,FCheckSVIDControl);
end;
//-------------------------------------------------------------------------------
function TfmZapisSmert.SpravEnabled:Boolean;
begin
  if (N_F_cbTypeSprav.ItemIndex=-1) or (N_F_cbTypeSprav.ItemIndex=0) then  begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;
//-------------------------------------------------------------------------------
procedure TfmZapisSmert.edSprav_NomerEnter(Sender: TObject);
begin
  if SpravEnabled and (DokumentDATEZ.AsString<>'') and (DokumentSPRAV_DATE.AsString='') then begin
    if Dokument.State<>dsEdit then Dokument.Edit;
    DokumentSPRAV_DATE.AsDateTime := DokumentDATEZ.AsDateTime;
    DokumentSPRAV_NOMER.AsString  := DokumentNOMER.AsString;
  end;
end;
//-------------------------------------------------------------------------------
procedure TfmZapisSmert.N_F_cbTypeSpravChange(Sender: TObject);
begin
  if SpravEnabled then begin
    N_F_cbDublSpr.Enabled:=true;
    edSprav_Nomer.Enabled:=true;
    edSprav_Date.Enabled:=true;
  end else begin
    EditDataSet(Dokument);
    DokumentSprav_Nomer.AsString:='';
    DokumentSprav_Date.AsString:='';
    DokumentDUBL_SPR.AsBoolean:=false;
    edSprav_Nomer.Enabled:=false;
    edSprav_Date.Enabled:=false;
    N_F_cbDublSpr.Enabled:=false;
  end;
end;
//-------------------------------------------------------------------------------
procedure TfmZapisSmert.edIsSdanDokChange(Sender: TObject);
begin
  if not FRun and not IsReadDokument then begin
    if (edIsSdanDok.ItemIndex>-1) and (edIsSdanDok.ItemIndex=1) then begin
      edSdanDok.Text:='Документ, удостоверяющий личность, не сдан';
    end;
  end;
end;
//-----------------------------------------------------------
procedure TfmZapisSmert.SetSimpleVvod(sName:String);
var
  lSetEnabled:Boolean;
begin
  inherited;
  lSetEnabled:=(sName='');
  if sName='DEFAULT' then begin
    SetEnabledControls( [
    label108, BLR_edFamilia, label109, BLR_edName, label110, BLR_edOtch, lbIDENTIF, ENG_edIDENTIF,
    label24, edSmertPosl, edDokKod, label16, edSem, label17, edWork, label18, edObraz, N_F_cbTypeSprav, edSprav_Nomer, label38, edSprav_Date
    ], lSetEnabled);
  end;
  if lSetEnabled then begin

  end else begin

    TbItemVerno.Checked:=true;
    EditDataSet(Dokument);
    DokumentDECL_ID.AsInteger:=1;
    PostDataSet(Dokument);
  end;

end;

procedure TfmZapisSmert.cbSM_OBLClick(Sender: TObject);
begin
  case cbSM_OBL.State of
    cbChecked  : lbSM_OBL.Caption:='область';
    cbUnchecked: lbSM_OBL.Caption:='край';
    cbGrayed   : lbSM_OBL.Caption:='';
  end;           
end;

procedure TfmZapisSmert.edWriteDeclEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  nKod:Integer;
  sSeek:String;
  Opis:TOpisEdit;
  l:Boolean;
begin
  sSeek:='';
  nKod:=ChoiceFromShablonEx( nil, SHABLON_SM_PIS_PRICH, true, sSeek);
  l:=dbDisableControls(Dokument);
  try
    if ModifyShablon then begin  // fShablon.pas
      Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_SM_PIS_PRICH');
      if Opis<>nil then Opis.KeyListFromDataSet:=true;
      GlobalTask.CurrentOpisEdit.GetListOpis('KEY_SM_PIS_PRICH', edWriteDecl.Items, edWriteDecl.KeyItems);
    end;
    if nKod>0 then begin
      EditDataSet(Dokument);
      DokumentTYPEREG.AsInteger:=nKod;
      PostDataSet(Dokument);
    end;
  finally
    dbEnableControls(Dokument,l);
  end;
//  CheckFont;
  // для обновления списка
end;

function TfmZapisSmert.CheckDateEditGIS: Boolean;
begin
  Result:=false;
  if Gisun.GetPoleGrn(DokumentPOLE_GRN)=rPost then begin
// номер и дата записи, свидетельство, ИН, причина смерти, место смерти, документ подтверждающий факт смерти, смерть последовала
  if (DokumentNOMER.AsString<>FMainTable.FieldByName('NOMER').AsString) or
     (DokumentDATEZ.AsString<>FMainTable.FieldByName('DATEZ').AsString) or
     (DokumentSM_GOSUD.AsString<>FMainTable.FieldByName('SM_GOSUD').AsString) or
     (DokumentSM_RAION.AsString<>FMainTable.FieldByName('SM_RAION').AsString) or
     (DokumentSM_GOROD.AsString<>FMainTable.FieldByName('SM_GOROD').AsString) or
     (DokumentSM_B_GOROD.AsString<>FMainTable.FieldByName('SM_B_GOROD').AsString) or
     (DokumentSVID_SERIA.AsString<>FMainTable.FieldByName('SVID_SERIA').AsString) or
     (DokumentSVID_NOMER.AsString<>FMainTable.FieldByName('SVID_NOMER').AsString) or
     (DokumentDATESV.AsString<>FMainTable.FieldByName('DATESV').AsString) or
     (DokumentDATES.AsString<>FMainTable.FieldByName('DATES').AsString) or
     (DokumentDOKUMENT.AsString<>FMainTable.FieldByName('DOKUMENT').AsString) or
     (DokumentSMERT_POSL.AsString<>FMainTable.FieldByName('SMERT_POSL').AsString) or
     (DokumentLICH_NOMER.AsString<>FMainTable.FieldByName('LICH_NOMER').AsString)
    then Result:=true
    else Result:=false;
  if not Result and not FMainTable.FieldByName('LICH_ID').IsNull then begin
    if ( ((FMainTable.FieldByName('LICH_ID').AsInteger=1) and not DokumentEMPTY_PRICH.AsBoolean) or
         ((FMainTable.FieldByName('LICH_ID').AsInteger=0) and DokumentEMPTY_PRICH.AsBoolean) )
      then Result:=true;
  end;
  if not Result and not DokumentEMPTY_PRICH.AsBoolean then begin
    if DokumentPR_OSN.AsString<>''
      then Result:=(DokumentPR_OSN.AsString<>FMainTable.FieldByName('PR_OSN').AsString)
      else Result:=(DokumentPR_NEP.AsString<>FMainTable.FieldByName('PR_NEP').AsString);
  end;
  end;
end;
//-----------------------------------------------------------
procedure TfmZapisSmert.WriteAfterRegister_GISUN;
begin
  try
    EditDataSet(Dokument);
    DokumentSM_B_RESP.AsBoolean:=false;
    Dokument.Post;
    FMainTable.FieldByName('SM_B_RESP').AsBoolean:=false;
  except
  end;
end;


initialization
  FCreateAkt:=false;
end.



