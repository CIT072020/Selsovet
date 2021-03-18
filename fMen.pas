//ЛАИС
unit fMen;
 
interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils, uUtilFiles, ShellApi, uTypes,uProjectAll,
  fSimple, Db, ComCtrls, ExtCtrls, TB2Item, TB2Dock, TB2Toolbar, StdCtrls, fChoiceNasel, uCheckKod,
  {$IFDEF GISUN}
    fChoiceMenGISUN, uGisun,
  {$ENDIF}
  Mask, DBCtrlsEh, dLichSchet, DBLookupEh, CheckLst, Grids, DBGridEh, fmChList,
  {$IFDEF USE_TEMPLATE}
    mTplInt,mTempl,
  {$ENDIF}
 {$IFDEF VER150} Variants, {$ENDIF}
  SasaDBGrid, kbmMemTable, MetaTask, dbFunc, Buttons, FuncPr, uPadegFIO, dMen, OpisEdit, mPermit,
  vchDBCtrls, DBCtrls, ROPasScript;

type
  TfmMen = class(TfmSimple)
    pc: TPageControl;
    tsMain: TTabSheet;
    gbObraz: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edStud_Place: TDBEditEh;
    gbWork: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edIsWork: TDBComboBoxEh;
    edWorkSelo: TDBComboBoxEh;
    edDolg_Name: TDBEditEh;
    edWork_Name: TDBEditEh;
    tsAdd: TTabSheet;
    Label19: TLabel;
    edKurs: TDBEditEh;
    pnZag: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edFam: TDBEditEh;
    edPol: TDBComboBoxEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    Label7: TLabel;
    edDateR: TDBDateTimeEditEh;
    gbZek: TGroupBox;
    Label27: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label28: TLabel;
    edCOUNT_ZEK: TDBNumberEditEh;
    tsMigr: TTabSheet;
    dsMigr: TDataSource;
    gbAktSmert: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    edAKT_SMER_NOMER: TDBEditEh;
    edAKT_SMER_DATE: TDBDateTimeEditEh;
    Panel1: TPanel;
    gbLgot: TGroupBox;
    dsPrizn: TDataSource;
    dsLgot: TDataSource;
    gbActRogd: TGroupBox;
    Label20: TLabel;
    Label22: TLabel;
    edAKT_ROGD_NOMER: TDBEditEh;
    edAKT_ROGD_DATE: TDBDateTimeEditEh;
    edObraz: TDBComboBoxEh;
    edDateR1: TDBDateTimeEditEh;
    edDateS: TDBDateTimeEditEh;
    Label31: TLabel;
    Label32: TLabel;
    gbOtm: TGroupBox;
    edOTM_NATION: TDBEditEh;
    gbAddInfo: TGroupBox;
    edAdd_Info: TDBEditEh;
    Label18: TLabel;
    edCitizen: TDBLookupComboboxEh;
    tsVUS: TTabSheet;
    Label34: TLabel;
    edGruppa: TDBComboBoxEh;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edGodnost: TDBComboBoxEh;
    edZvan: TDBComboBoxEh;
    edGragdSpec: TDBEditEh;
    Label41: TLabel;
    edKomanda: TDBEditEh;
    edJavka: TDBNumberEditEh;
    edMarshrut: TDBNumberEditEh;
    edObrazVUS: TDBComboBoxEh;
    Label46: TLabel;
    Label47: TLabel;
    edWorkTelefon: TDBEditEh;
    gbWorkVUS: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    edIsWorkVUS: TDBComboBoxEh;
    edDolgNameVUS: TDBEditEh;
    edWorkNameVUS: TDBEditEh;
    Label48: TLabel;
    gbKomiss: TGroupBox;
    edDateKomiss: TDBDateTimeEditEh;
    edKomiss: TDBLookupComboboxEh;
    Label45: TLabel;
    edPriznan: TDBComboBoxEh;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    edStat: TDBEditEh;
    edGraf: TDBEditEh;
    edPrikaz: TDBEditEh;
    edDatePereosv: TDBDateTimeEditEh;
    Label56: TLabel;
    edSostSem: TDBEditEh;
    pnOsn: TPanel;
    Label29: TLabel;
    edSem: TDBComboBoxEh;
    lbOtnosh: TLabel;
    edOTNOSH: TDBLookupComboboxEh;
    Label5: TLabel;
    edTelefon: TDBEditEh;
    gbUchet: TGroupBox;
    Label58: TLabel;
    edPrib: TDBEditEh;
    Label60: TLabel;
    edDatePrVK: TDBDateTimeEditEh;
    Label62: TLabel;
    edDateUbVK: TDBDateTimeEditEh;
    Label63: TLabel;
    edDateSost: TDBDateTimeEditEh;
    Label64: TLabel;
    edVBSeria: TDBEditEh;
    Label65: TLabel;
    edVBNomer: TDBEditEh;
    Label66: TLabel;
    edVBDate: TDBDateTimeEditEh;
    Label67: TLabel;
    edSpec: TDBLookupComboboxEh;
    edSpecText: TDBEditEh;
    dsOsobOtm: TDataSource;
    dsKomiss: TDataSource;
    lbUchastokVUS: TLabel;
    gbPasp: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ENG_edLichNomer: TDBEditEh;
    edPasp_Seria: TDBEditEh;
    edPasp_Nomer: TDBEditEh;
    edPasp_Date: TDBDateTimeEditEh;
    edPasp_Organ: TDBEditEh;
    Label68: TLabel;
    edDateProp2: TDBDateTimeEditEh;
    ImageSpec: TImage;
    N_F_cbSpec: TDBCheckBoxEh;
    edUdost: TDBComboBoxEh;
    N_F_edTypeComanda: TDBComboBoxEh;
    Label38: TLabel;
    TextAdres: TvchDBText;
    btAdres: TBitBtn;
    Label71: TLabel;
    edSostav: TDBComboBoxEh;
    edPredn: TDBEditEh;
    edMarka: TDBEditEh;
    gbMestoRogd: TGroupBox;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    edMR_B_GOROD: TDBLookupComboboxEh;
    edMR_GOROD: TDBEditEh;
    edMR_B_OBL: TDBCheckBoxEh;
    edMR_B_RESP: TDBCheckBoxEh;
    edMR_GOSUD: TDBLookupComboboxEh;
    tsOchered: TTabSheet;
    dsSprPostOch: TDataSource;
    dsSprSnOch: TDataSource;
    pnSostavOchered: TPanel;
    Panel4: TPanel;
    btAddMen: TBitBtn;
    btDelMen: TBitBtn;
    pcOchered: TPageControl;
    tsOchSostav: TTabSheet;
    GridSostav: TDBGridEh;
    tsOchLgot: TTabSheet;
    pnOcheredMain: TPanel;
    Label86: TLabel;
    Label87: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    tsPrim: TTabSheet;
    Panel3: TPanel;
    Label88: TLabel;
    edKolvoSostav: TDBNumberEditEh;
    edTypeHouse: TDBLookupComboboxEh;
    edPloshAll: TDBNumberEditEh;
    edKolvoKomn: TDBNumberEditEh;
    edKolvoPropis: TDBNumberEditEh;
    dsSprTypeHouse: TDataSource;
    dsSostavSem: TDataSource;
    dsOcheredLgot: TDataSource;
    lbDelo: TLabel;
    edDelo: TDBEditEh;
    edResidence: TDBComboBoxEh;
    edPropis: TDBCheckBoxEh;
    btEdit: TBitBtn;
    tsDoks: TTabSheet;
    edDoks: TDBEditEh;
    edPresentEx: TDBCheckBox;
    N_F_cbNewSem: TDBCheckBoxEh;
    pnReg: TPanel;
    gbMigr: TGroupBox;
    GridMigr: TSasaDBGrid;
    Panel6: TPanel;
    btAddMigr: TBitBtn;
    btDelMigr: TBitBtn;
    pnPropiski: TPanel;
    Label30: TLabel;
    Label33: TLabel;
    Label70: TLabel;
    edDateProp: TDBDateTimeEditEh;
    edDateVip: TDBDateTimeEditEh;
    edDateSrok: TDBDateTimeEditEh;
    N_F_edCanSelect: TDBCheckBoxEh;
    N_F_cbNotDelete: TDBCheckBoxEh;
    pnNotReg: TPanel;
    edAdresProp: TDBEditEh;
    lbAdresProp: TLabel;
    Label80: TLabel;
    edUNP: TDBEditEh;
    N_F_edFirstNotMy: TDBCheckBoxEh;
    N_F_cbBezAdresa: TDBCheckBoxEh;
    edStudent: TDBComboBoxEh;
    edStudent_Type: TDBComboBoxEh;
    edAdresGit: TDBEditEh;
    N_F_cbPriz: TDBCheckBoxEh;
    gbUluch: TGroupBox;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    edNewPloshAll: TDBNumberEditEh;
    edNewKolKomn: TDBNumberEditEh;
    edNew_Date: TDBDateTimeEditEh;
    vchDBText2: TvchDBText;
    BitBtn1: TBitBtn;
    Label98: TLabel;
    edNewDogovor: TDBEditEh;
    pnKredit: TPanel;
    Label99: TLabel;
    edSubsidDate: TDBDateTimeEditEh;
    edSubsidSumma: TDBNumberEditEh;
    Label92: TLabel;
    edKreditDate: TDBDateTimeEditEh;
    edKreditSumma: TDBNumberEditEh;
    Panel5: TPanel;
    edPrim: TDBMemo;
    gbPrizn: TGroupBox;
    gbOtkudaPrib: TGroupBox;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    edOP_B_GOROD: TDBLookupComboboxEh;
    edOP_GOROD: TDBEditEh;
    cbOP_B_OBL: TDBCheckBoxEh;
    cbOP_B_RESP: TDBCheckBoxEh;
    edOP_GOSUD: TDBLookupComboboxEh;
    btEditMigr: TBitBtn;
    TBItemTalonPrib: TTBItem;
    dsVoenkom: TDataSource;
    edVoenkom: TDBLookupComboboxEh;
    Label107: TLabel;
    Panel2: TPanel;
    edSocial: TDBComboBoxEh;
    Label108: TLabel;
    edKolvoKomnPr: TDBNumberEditEh;
    Label109: TLabel;
    edGSK: TDBEditEh;
    Label110: TLabel;
    edAktRogdOrgan: TDBEditEh;
    Label111: TLabel;
    edAktSmerOrgan: TDBEditEh;
    edOP_OBL: TDBEditEh;
    edOP_RAION: TDBEditEh;
    edMR_RAION: TDBEditEh;
    edMR_OBL: TDBEditEh;
    Label112: TLabel;
    edOP_DATE: TDBDateTimeEditEh;
    Label113: TLabel;
    edPasp_Srok: TDBDateTimeEditEh;
    N_F_cbKvartirant: TDBCheckBoxEh;
    Label114: TLabel;
    edDopOchered: TDBEditEh;
    Label116: TLabel;
    edSlugeb: TDBEditEh;
    Label115: TLabel;
    edDopDate: TDBDateTimeEditEh;
    edDateSrokDN: TDBDateTimeEditEh;
    Label117: TLabel;
    Label118: TLabel;
    edDateV2: TDBDateTimeEditEh;
    Label119: TLabel;
    edDateSrok2: TDBDateTimeEditEh;
    BitBtn2: TBitBtn;
    Label94: TLabel;
    vchDBText3: TvchDBText;
    btAdresGit_Vib: TBitBtn;
    btClear_AdresGit_Vib: TBitBtn;
    TabSheet1: TTabSheet;
    dsOcheredResh: TDataSource;
    GridResh: TDBGridEh;
    N_F_cbSirota: TDBCheckBoxEh;
    GridOchered: TDBGridEh;
    Label78: TLabel;
    Label79: TLabel;
    Label81: TLabel;
    Label83: TLabel;
    edKreditNomer: TDBEditEh;
    Label84: TLabel;
    edResidenceDate: TDBDateTimeEditEh;
    Label85: TLabel;
    edKreditResh: TDBEditEh;
    edSubsidResh: TDBEditEh;
    Label93: TLabel;
    btIsk2Vkl: TButton;
    tsSobst: TTabSheet;
    dsSobst: TDataSource;
    GridSobstv: TDBGridEh;
    Label100: TLabel;
    edTail: TDBEditEh;
    Label101: TLabel;
    edDoxod: TDBNumberEditEh;
    ImageEl: TImage;
    gbAddLgot: TGroupBox;
    Label102: TLabel;
    edDateLgotEl: TDBDateTimeEditEh;
    vchDBText1: TvchDBText;
    cbVUS: TDBCheckBoxEh;
    LgotAdres: TvchDBText;
    ImageElClr: TImage;
    Label82: TLabel;
    Label91: TLabel;
    edDecDate: TDBDateTimeEditEh;
    edDecDateReal: TDBDateTimeEditEh;
    edDecTime: TDBDateTimeEditEh;
    Label120: TLabel;
    edDatePerereg: TDBDateTimeEditEh;
    lbRegNomer: TLabel;
    edRegNomer: TDBEditEh;
    lbNomer: TLabel;
    edNomer: TDBNumberEditEh;
    N_F_cbIsUchastok: TDBCheckBoxEh;
    edIsUchastokDate: TDBDateTimeEditEh;
    N_F_cbPredUchastok: TDBCheckBoxEh;
    edUchastokDate: TDBDateTimeEditEh;
    Panel7: TPanel;
    cbOnly: TDBCheckBoxEh;
    edZvan2: TDBComboBoxEh;
    lbDateSost: TvchDBText;
    Label51: TLabel;
    edWorkTelefonVUS: TDBEditEh;
    Label121: TLabel;
    edAGitTel: TDBEditEh;
    pnAdd: TPanel;
    Label122: TLabel;
    edUdostLgot: TDBEditEh;
    N_F_cbMnogo4: TDBCheckBoxEh;
    N_F_cbMnogoI: TDBCheckBoxEh;
    Label123: TLabel;
    edSuprug: TDBEditEh;
    edPodr: TDBEditEh;
    Label125: TLabel;
    Label69: TLabel;
    edNation: TDBLookupComboboxEh;
    Label124: TLabel;
    edTelefonM: TDBEditEh;
    Label126: TLabel;
    edGitRodstv: TDBEditEh;
    Label57: TLabel;
    edDatePr: TDBDateTimeEditEh;
    Label59: TLabel;
    edDateUb: TDBDateTimeEditEh;
    Label61: TLabel;
    edUbit: TDBEditEh;
    edSuprugDateR: TDBDateTimeEditEh;
    edKvalif: TDBEditEh;
    Label127: TLabel;
    Label128: TLabel;
    edUchObrAll: TDBEditEh;
    Label72: TLabel;
    edPodrVUS: TDBEditEh;
    gbNomerVUS: TGroupBox;
    edNomerVUS: TDBEditEh;
    gbMobTel: TGroupBox;
    TELEFON_MVus: TDBEditEh;
    pnGrid: TPanel;
    gbDeti: TGroupBox;
    GridSverki: TDBGridEh;
    Panel8: TPanel;
    btAddSv: TBitBtn;
    btDelSv: TBitBtn;
    dsSverki: TDataSource;
    Label73: TLabel;
    edSuprug2: TDBEditEh;
    Label21: TLabel;
    edPENS_TIP: TDBLookupComboboxEh;
    Label23: TLabel;
    edPENS_KNIGA: TDBEditEh;
    Label24: TLabel;
    edPENS_DATE: TDBDateTimeEditEh;
    lbpapa: TLabel;
    edPapa: TDBEditEh;
    lbMama: TLabel;
    edMama: TDBEditEh;
    cbIskl: TDBCheckBoxEh;
    procedure FormShow(Sender: TObject);
    procedure dsMigrDataChange(Sender: TObject; Field: TField);
    procedure edPolChange(Sender: TObject);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edStud_PlaceEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure edWork_NameEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure edDolg_NameEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure cbVUSClick(Sender: TObject);
    procedure edNationEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edOTNOSHEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edPENS_TIPEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure N_F_cbSpecClick(Sender: TObject);
    procedure LgotAdresGetText(Sender: TObject; var Text: String);
    procedure btAdresClick(Sender: TObject);
    procedure edMR_OBLNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure edMR_RAIONNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
    procedure edTypeHouseEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edRegReshEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure pcOcheredChange(Sender: TObject);
    procedure btAddMenClick(Sender: TObject);
    procedure dsSostavSemDataChange(Sender: TObject; Field: TField);
    procedure dsOcheredLgotDataChange(Sender: TObject; Field: TField);
    procedure btDelMenClick(Sender: TObject);
    procedure edPropisClick(Sender: TObject);
    procedure edPresentExClick(Sender: TObject);
    procedure GridOcheredDblClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure edPasp_OrganEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edAdresPropEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure btAddMigrClick(Sender: TObject);
    procedure btDelMigrClick(Sender: TObject);
    procedure vchDBText1GetText(Sender: TObject; var Text: String);
    procedure edAdresPropEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure dsMigrStateChange(Sender: TObject);
    procedure GridMigrExit(Sender: TObject);
    procedure ENG_edLichNomerUpdateData(Sender: TObject; var Handled: Boolean);
    procedure N_F_cbBezAdresaClick(Sender: TObject);
    procedure GridOcheredColumns4GetCellParams(Sender: TObject;   EditMode: Boolean; Params: TColCellParamsEh);
    procedure edAdresGitEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edAdresGitEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure pcChange(Sender: TObject);
    procedure GridMigrGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure vchDBText2GetText(Sender: TObject; var Text: String);
    procedure edPapaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edMamaEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edMamaEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure edPapaEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure btEditMigrClick(Sender: TObject);
    procedure TBItemTalonPribClick(Sender: TObject);
    procedure edPapaEditButtons2Click(Sender: TObject;  var Handled: Boolean);
    procedure edMamaEditButtons2Click(Sender: TObject;  var Handled: Boolean);
    procedure GridMigrColumns1GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
    procedure edNameUpdateData(Sender: TObject; var Handled: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure edOTNOSHEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure GridSostavColumns7UpdateData(Sender: TObject;   var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure btClear_AdresGit_VibClick(Sender: TObject);
    procedure btAdresGit_VibClick(Sender: TObject);
    procedure vchDBText3GetText(Sender: TObject; var Text: String);
    procedure edAktRogdOrganEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edAktSmerOrganEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure GridSostavGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridReshColumns3GetCellParams(Sender: TObject;    EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridReshDblClick(Sender: TObject);
    procedure GridSostavDblClick(Sender: TObject);
    procedure GridReshGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dsOcheredReshDataChange(Sender: TObject; Field: TField);
    procedure btIsk2VklClick(Sender: TObject);
    procedure GridSobstvColumns0GetCellParams(Sender: TObject;     EditMode: Boolean; Params: TColCellParamsEh);
    procedure TextAdresGetText(Sender: TObject; var Text: String);
    procedure edDateLgotElEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edDateLgotElEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure edNomerEditButtons0Click(Sender: TObject;       var Handled: Boolean);
    procedure N_F_cbSirotaClick(Sender: TObject);
    procedure N_F_cbNewSemClick(Sender: TObject);
    procedure TextAdresClick(Sender: TObject);
    procedure cbOnlyClick(Sender: TObject);
    procedure GridReshColumns0GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
    procedure ENG_edLichNomerEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure lbDateSostGetText(Sender: TObject; var Text: String);
    procedure edSostSemEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edSuprugEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edSuprugEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure edSuprugEditButtons2Click(Sender: TObject;      var Handled: Boolean);
    procedure btDelSvClick(Sender: TObject);
    procedure btAddSvClick(Sender: TObject);
    procedure dsSverkiDataChange(Sender: TObject; Field: TField);
    procedure GridSverkiColumns2EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    FEnableVUS_Form: Boolean;
    FEnableOchered_Form: Boolean;
//    procedure AddLabelPlus(Owner: TComponent; Parent : TWinControl; Edit : TDBLookupComboboxEh);
    procedure LookUpNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
    procedure SetEnableOchered_Form(const Value: Boolean);
    procedure SetEnableVUS_Form(const Value: Boolean);
  public
    dmMen : TdmMen;
    property EnableOchered_Form : Boolean read FEnableOchered_Form write SetEnableOchered_Form;
    property EnableVUS_Form : Boolean read FEnableVUS_Form write SetEnableVUS_Form;
    {$IFDEF USE_TEMPLATE}
    procedure OnTemplateClick(Sender: TObject);
    {$ENDIF}
    procedure btAdresSimpleClick(Sender: TObject);
    procedure btAdresVvodClick(Sender: TObject);
    procedure CheckImageLgotEl;

    procedure CheckOnlyOtdelno;
    procedure CheckDecDate;

    function CheckOchered(nType:Integer): Boolean;
    function CheckVUS(nType:Integer): Boolean;
    // корректировка из лицевого счета
    function EditForm(slPar:TStringList; strGurnal:String) : Boolean; override;
    function CreateRunTimeProperty : Boolean; override;
    procedure SetLookUp;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    procedure UpdateActions; override;
    function GetdsDopProp : TDataSource; override;
    procedure UserAfterSkip; override;
    procedure CheckControl;
    procedure CheckImageAndFont;
    procedure CheckContFont(cb:TDBCheckBoxEh);
    procedure CheckContSuprug;

    function BeforeReport : Boolean; override;

    procedure Event_SetDokument(Sender : TObject);

    procedure Event_ZaprosBankMain(Sender : TObject);
    procedure Event_ZaprosBankSostav(Sender : TObject);
    procedure Event_OpenTmpDir(Sender : TObject);
    procedure Event_ClearTmpDir(Sender : TObject);

  end;

//var
//  fmMen: TfmMen;

implementation

uses fMain, dBase, fTalonPrib, fAddSprName, fChoiceAdres, fChoiceAdresS, uProject, fCheckMens, fParamQuest,
      {$IFNDEF ZAGS}
       fLgotOchered, fOcheredOper, fMultiChoice,
      {$ENDIF}
      fShablon, fAddAdres, fVvodAdres, fMenDvig;

{$R *.DFM}

{ TfmMen }

constructor TfmMen.Create(Owner: TComponent);
var
  i:Integer;
  it:TTbItem;
  sep:TTbSeparatorItem;
begin
  inherited;
  ActionForClose    := caHide;

  FEnableVUS_Form:=false;          // доступность закладки ВУС по умолчанию
  FEnableOchered_Form:=false;      // доступность закладки очередь по умолчанию

  edDateLgotEl.EditButtons[0].Glyph:=ImBtRun.Picture.Bitmap;
  edDateLgotEl.EditButtons[1].Glyph:=ImBtClear.Picture.Bitmap;
  edUdost.DropDownBox.Rows:=TYPEDOK_ROWS;  // utypes.pas
  edUdost.DropDownBox.Width:=TYPEDOK_Width;  // utypes.pas

  FSubType:='LIC';

  CheckExit := false;

  CreateEditPriznak(gbLgot, dsLgot, 'LOOKUP_LGOT','NAME');
  CreateEditPriznak(gbPrizn, dsPrizn, 'LOOKUP_PR_MENS','NAME');

  fmMain.ImageList.GetBitmap(IL_EDIT,btEdit.Glyph);
  fmMain.ImageList.GetBitmap(IL_ADD,btAddMen.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL,btDelMen.Glyph);

  fmMain.ImageList.GetBitmap(IL_EDIT,btEditMigr.Glyph);
  fmMain.ImageList.GetBitmap(IL_ADD,btAddMigr.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL,btDelMigr.Glyph);

  fmMain.ImageList.GetBitmap(IL_ADD,btAddSv.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL,btDelSv.Glyph);

  dsKomiss.DataSet  := dmBase.SprKomiss;
  dsOsobOtm.DataSet := dmBase.SprOsobOtm;

  GlobalTask.CurrentOpisEdit.SetKeyForm(Self,nil);
//  GlobalTask.SetMRUListForm(Self);

//  GlobalTask.SetMRUListForm(Self);
  SetLookUp;
//  AddLabelPlus(Self, pnOsn, edOtnosh);
//  AddLabelPlus(Self, gbPens, edPENS_TIP);
//  AddLabelPlus(Self, gbObraz, edStudent_Spr);
//  AddLabelPlus(Self, gbWork, edDolg_Spr);
//  AddLabelPlus(Self, gbWork, edWork_Spr);
  edPapa.EditButtons[2].Glyph := edStud_Place.EditButtons[1].Glyph;
  edPapa.EditButtons[2].Hint  := edStud_Place.EditButtons[1].Hint;
  edMama.EditButtons[2].Glyph := edStud_Place.EditButtons[1].Glyph;
  edMama.EditButtons[2].Hint  := edStud_Place.EditButtons[1].Hint;
  edSuprug.EditButtons[2].Glyph := edStud_Place.EditButtons[1].Glyph;
  edSuprug.EditButtons[2].Hint  := edStud_Place.EditButtons[1].Hint;
  edSuprug2.EditButtons[2].Glyph := edStud_Place.EditButtons[1].Glyph;
  edSuprug2.EditButtons[2].Hint  := edStud_Place.EditButtons[1].Hint;

  edWork_Name.EditButtons[1].Glyph   := edStud_Place.EditButtons[1].Glyph;
  edDolg_Name.EditButtons[1].Glyph   := edStud_Place.EditButtons[1].Glyph;
  edWorkNameVUS.EditButtons[1].Glyph := edStud_Place.EditButtons[1].Glyph;
  edDolgNameVUS.EditButtons[1].Glyph := edStud_Place.EditButtons[1].Glyph;
  edResidence.EditButtons[0].Glyph   := edStud_Place.EditButtons[1].Glyph;

  edWork_Name.EditButtons[0].Hint := edStud_Place.EditButtons[0].Hint;
  edWork_Name.EditButtons[1].Hint := edStud_Place.EditButtons[1].Hint;
  edDolg_Name.EditButtons[0].Hint := edStud_Place.EditButtons[0].Hint;
  edDolg_Name.EditButtons[1].Hint := edStud_Place.EditButtons[1].Hint;
  edResidence.EditButtons[0].Hint := edStud_Place.EditButtons[1].Hint;

//  lbAdres.Color := edSostSem.Color;
  lbUchastokVUS.Color := edSostSem.Color;
  pc.ActivePageIndex:=0;
  TBSubmenuTmp.Visible:=LoadTemplate('fmMen');
  OnSetDokument := Event_SetDokument;

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Сформировать запрос в банк';
  it.OnClick:=Event_ZaprosBankMain;
  TBSubmenuRun.Add(it);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Сформировать запрос в банк для члена семьи';
  it.OnClick:=Event_ZaprosBankSostav;
  TBSubmenuRun.Add(it);

  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Открыть папку для временных файлов';
  it.OnClick:=Event_OpenTmpDir;
  TBSubmenuRun.Add(it);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Очистить папку для временных файлов';
  it.OnClick:=Event_ClearTmpDir;
  TBSubmenuRun.Add(it);

//  n:=LimitMRUList(3);
//  SetMRUList(edGOROD_R,n,3,true,false,false,FAddButtonMRUList_Punkt);
//  SetMRUList(edGOROD_O,n,3,true,false,false,FAddButtonMRUList_Punkt);

  i:=LimitMRUList(1);
  SetMRUList(edOP_OBL,i,1,true,false,false,true); //FAddButtonMRUList);
  SetMRUList(edMR_OBL,i,1,true,false,false,true); //FAddButtonMRUList);

  i:=LimitMRUList(2);
  SetMRUList(edOP_RAION,i,2,true,false,false,true); //FAddButtonMRUList);
  SetMRUList(edMR_RAION,i,2,true,false,false,true); //FAddButtonMRUList);

  i:=LimitMRUList(3);
  SetMRUList(edOP_GOROD,i,3,true,false,false,true);
  SetMRUList(edMR_GOROD,i,3,true,false,false,true);

  //------  устанавливаем событие OnUpdateDate
  SetLength(FArrErrorDate,11);
  SetErrorDateControl(0, 'DATER', _TypeObj_ZRogd, 0, 0);
  SetErrorDateControl(1, 'DATES', _TypeObj_ZSmert, 0, 0);
  SetErrorDateControl(2, 'DATEP', _TypeObj_TalonPrib, 0, 0);
  SetErrorDateControl(3, 'DATE_SROK_DN', -1, 0, 0);

  SetErrorDateControl(4, 'PASP_DATE', -1, 0, 0);
  SetErrorDateControl(5, 'PASP_SROK', -1, 0, 0);
  SetErrorDateControl(6, 'PENS_DATE', -1, 0, 0);
  SetErrorDateControl(7, 'VB_DATE'  , -1, 0, 0);
  SetErrorDateControl(8, 'DEC_DATE'  , -1, 0, 0);
  SetErrorDateControl(9, 'REG_DATE'  , -1, 0, 0);
  SetErrorDateControl(10,'ISK_DATE'  , -1, 0, 0);
  SetUpdateDate;
  //------
  if Role.SystemAdmin then begin
    GridSobstv.ReadOnly:=false;
  end;

end;

{$IFDEF USE_TEMPLATE}
procedure TfmMen.OnTemplateClick(Sender: TObject);
var
  Template: TTemplate;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      Template:=TTemplate(TComponent(Sender).Tag);
      if Template<>nil then begin
        fmMain.TemplateInterface.SetParams(TdmMen(Dokument).DateFiks,
          TdmMen(Dokument).mtDokumentID_INTERNAL.AsInteger,0);
        fmMain.TemplateInterface.SetTemplate(
          fmMain.TemplateInterface.DefaultParameterIniFile,
          fmMain.TemplateInterface.DefaultDatabaseName,
          fmMain.TemplateInterface.DefaultScript,
          Template);
      end;
   end;
end;
{$ENDIF}

{
procedure TfmMen.AddLabelPlus(Owner: TComponent; Parent : TWinControl; Edit : TDBLookupComboboxEh);
var
  lb : TLabel;
begin
  lb :=TLabel.Create(self);
  lb.Name := 'lb_'+Edit.Name;
  lb.Parent := Parent;
  lb.Left := Edit.Left + Edit.Width + 2;
  lb.Top  := Edit.Top+2;
  lb.Font.Style := [];
  lb.Caption := '(+)';
  Edit.OnNotInList := LookUpNotInList;
  Edit.Style := csDropDownEh;
end;
}
function TfmMen.CreateRunTimeProperty: Boolean;
begin
  Result := true;
//
end;

procedure TfmMen.SetLookUp;
var
  ds : TDataSource;
begin
  // национальность
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_Nation';
  ds.DataSet := dmBase.SprNac;
  edNation.ListSource := ds;
  edNation.ListField  := 'NAME';
  edNation.KeyField   := 'ID';
  // отношение к главе хозяйства
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_Otnosh';
  ds.DataSet := dmBase.SprOtnosh;
  edOTNOSH.ListSource := ds;
  edOTNOSH.ListField  := 'NAME';
  edOTNOSH.KeyField   := 'ID';

  {
  // где учиться
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_StudType';
  ds.DataSet := dmBase.SprMestOb;
  edStudent.ListSource := ds;
  edStudent.ListField  := 'NAME';
  edStudent.KeyField   := 'ID';
  // тип обучения
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_TypeObuch';
  ds.DataSet := dmBase.SprFormOb;
  edStudent_Type.ListSource := ds;
  edStudent_Type.ListField  := 'NAME';
  edStudent_Type.KeyField   := 'ID';
  }

  // учебное заведение
  {
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_UchZaved';
  ds.DataSet := dmBase.SprUchZaved;
  edStudent_Spr.ListSource := ds;
  edStudent_Spr.ListField  := 'NAME';
  edStudent_Spr.KeyField   := 'ID';
  }
  // места работы
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_Work';
  ds.DataSet := dmBase.SprWork;
//  edWork_Spr.ListSource := ds;
//  edWork_Spr.ListField  := 'NAME';
//  edWork_Spr.KeyField   := 'ID';
  // Должности
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_Dolg';
  ds.DataSet := dmBase.SprDolg;
//  edDolg_Spr.ListSource := ds;
//  edDolg_Spr.ListField  := 'NAME';
//  edDolg_Spr.KeyField   := 'ID';
  // Тип пенсии
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_TypePens';
  ds.DataSet := dmBase.SprTypePens;
  edPENS_TIP.ListSource := ds;
  edPENS_TIP.ListField  := 'NAME';
  edPENS_TIP.KeyField   := 'ID';
  // Гражданство
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_Strana';
  ds.DataSet := dmBase.SprStran;
  edCitizen.ListSource := ds;
  edCitizen.ListField  := 'NAME';
  edCitizen.KeyField   := 'ID';
end;

procedure TfmMen.UpdateActions;
begin
  inherited;
//  if dmMen.EditFromLichSchet then begin
//    TBItemCancel.Enabled := false;
//  end else begin
//    TBItemCancel.Enabled := true;
//  end;
  if dmMen.mtDokumentSTUDENT_SPR.AsString='' then begin // .FieldByName('STUDENT_SPR').AsString='' then begin
    if edStud_Place.Font.Style <> []
      then edStud_Place.Font.Style := [];
  end else begin
    if edStud_Place.Font.Style <> [fsBold]
      then edStud_Place.Font.Style := [fsBold];
  end;
  if dmMen.mtDokumentWORK_SPR.AsString='' then begin
    if edWork_Name.Font.Style <> [] then begin
      edWork_Name.Font.Style := [];
      edWorkNameVUS.Font.Style := [];
    end;
  end else begin
    if edWork_Name.Font.Style <> [fsBold] then begin
      edWork_Name.Font.Style := [fsBold];
      edWorkNameVUS.Font.Style := [fsBold];
    end;
  end;
  if dmMen.mtDokumentDOLG_SPR.AsString='' then begin
    if edDolg_Name.Font.Style <> [] then begin
      edDolg_Name.Font.Style := [];
      edDolgNameVUS.Font.Style := [];
    end;
  end else begin
    if edDolg_Name.Font.Style <> [fsBold] then begin
      edDolg_Name.Font.Style := [fsBold];
      edDolgNameVUS.Font.Style := [fsBold];
    end;
  end;
  cbIskl.Enabled:=(edDateUb.Value<>null);
end;

procedure TfmMen.FormShow(Sender: TObject);
begin
//  pc.ActivePageIndex:=0;
//  ActiveControl := edFam;
  {$IFDEF GISUN}
    ENG_edLichNomer.EditButtons[0].Visible:=IsActiveGISUN
  {$ELSE}
    ENG_edLichNomer.EditButtons[0].Visible:=false;
  {$ENDIF}
end;

//-----------------------------------------------------------------
procedure TfmMen.dsMigrDataChange(Sender: TObject; Field: TField);
begin
  if field<>nil then begin
    QueryExit := true;
  end;
end;

procedure TfmMen.GridMigrExit(Sender: TObject);
begin
  dsMigr.DataSet.CheckBrowseMode;
  if dmMen.mtDokument.State<>dsEdit then dmMen.mtDokument.Edit;
//  dmMen.mtDokumentTYPEREG.AsString:=dmMen.CheckTypeReg;
end;

procedure TfmMen.dsMigrStateChange(Sender: TObject);
//var
//  s:String;
begin
{
  case dsMigr.DataSet.State of
    dsInactive : s:='dsInactive';
    dsBrowse   : s:='dsBrowse';   //	Data can be viewed, but not changed. This is the default state of an open dataset.
    dsEdit     : s:='dsEdit'; //	Active record can be modified.
    dsInsert   : s:='dsInsert';//	The active record is a newly inserted buffer that has not been posted. This record can be modified and then either posted or discarded.
    dsSetKey   : s:='dsSetKey';//	TTable and TClientDataSet only. Record searching is enabled, or a SetRange operation is under way. A restricted set of data can be viewed, and no data can be edited or inserted.
    dsCalcFields: s:='dsCalcFields';//	An OnCalcFields event is in progress. Noncalculated fields cannot be edited, and new records cannot be inserted.
    dsFilter	: s:='dsFilter';//An OnFilterRecord event is in progress. A restricted set of data can be viewed. No data can edited or inserted.
    dsNewValue: s:='dsNewValue'; //	Temporary state used internally when a field component’s NewValue property is accessed.
    dsOldValue: s:='dsOldValue';//	Temporary state used internally when a field component’s OldValue property is accessed.
    dsCurValue: s:='dsCurValue'; //	Temporary state used internally when a field component’s CurValue property is accessed.
    dsBlockRead: s:='dsBlockRead'; //	Data-aware controls are not updated and events are not triggered when moving to the next record.
    dsInternalCalc: s:='dsInterCalc';//	Temporary state used internally when values need to be calculated for a field that has a FieldKind of fkInternalCalc.
    dsOpening : s:='dsOpening';//	DataSet is in the process of opening but has not finished. This state occurs when the dataset is opened for asynchronous fetching.
 else
   s:='None state';
 end;
 showmessage(s);
}
end;

//----------------------------------------------------------------
function TfmMen.CheckOchered(nType:Integer): Boolean;
var
  pt:TPermitType;
  s:String;
begin
  pt:=Role.CheckSubSystem(SS_OCHERED);
  if (pt<>ptDeniedAccess) and EnableOchered_Form then begin
    TBSubmenuRun.Enabled:=true;
    if GlobalTask.ParamAsBoolean('OCH_NOMER') then begin
      lbNomer.Visible:=true;
      edNomer.Visible:=true;
    end else begin
      lbNomer.Visible:=false;
      edNomer.Visible:=false;
    end;
    s:=GlobalTask.ParamAsString('NAME_DELO');
    if s='' then s:='Номер дела';
    lbDelo.Caption:=s;
    edDelo.Left:=lbDelo.Left+lbDelo.Width+10;

   if GlobalTask.ParamAsBoolean('OCH_REGNOMER') then begin
     lbRegNomer.Visible:=true;
     edRegNomer.Visible:=true;
   end else begin
     lbRegNomer.Visible:=false;
     edRegNomer.Visible:=false;
   end;

//    if not lbRegNomer.Visible and not lbDelo.Visible
//      then pnOcheredMain.Height:=edPloshAll.Top+edPloshAll.Height+5;
    //---------- ??? ---------------
    if not TdmMen(Dokument).mtDokumentOchered.AsBoolean then begin
      tsOchered.TabVisible := false;
    end else begin
      tsOchered.TabVisible := true;
    end;
    //------------------------------
  end else begin
    TBSubmenuRun.Enabled:=false;
    tsOCHERED.TabVisible := false;
  end;
  Result:=true;
end;

//---------------------------------------------------------------
function TfmMen.CheckVUS(nType: Integer): Boolean;
begin
  if (Role.CheckSubSystem(SS_VUS)<>ptDeniedAccess) and EnableVUS_Form then begin
    if not TdmMen(Dokument).mtDokumentVUS.AsBoolean then begin
      tsVUS.TabVisible := false;
    end else begin
      tsVUS.TabVisible := true;
    end;
  end else begin
    tsVUS.TabVisible := false;
  end;
  if tsVUS.TabVisible then begin
    CheckContSuprug;
  end;
  Result:=true;
end;

//-----------------------------------------------------------------
function TfmMen.EditForm(slPar:TStringList; strGurnal:String): Boolean;
var
  i,nAdresID,n : Integer;
  sValue,sName,s : String;
  lOchered, lVus, lPrint, lBezAdresa : Boolean;
begin

  AssignPar(slPar);

  Result := false;
  FGurnal:=strGurnal;  // журнал из которого открыли форму
  nAdresID:=-1;

  case GlobalTask.ParamAsInteger('SIMPLE_ADRES') of
    0: btAdres.OnClick:=btAdresClick;
    1: btAdres.OnClick:=btAdresSimpleClick;
    2: btAdres.OnClick:=btAdresVvodClick;
  else
    btAdres.OnClick:=btAdresClick;
  end;

  NameCurGurnal:=FGurnal;   // для того что-бы в скрипте можно было обратиться из какого журнала открыта форма
  lOchered:=false;
  lVus:=true;
  lBezAdresa:=false;
  lPrint:=true;
  if (slPar<>nil) and (slPar.Count>0) then begin
    for i:=0 to slPar.Count-1 do begin
      sValue := UpperCase(slPar.ValueFromIndex[i]);
      sName  := UpperCase(slPar.Names[i]);
      if sName='ENABLEOCHERED' then begin
        if sValue='1'
          then lOchered:=true
          else lOchered:=false;
      end else if sName='ENABLEVUS' then begin
        if sValue='1'
          then lVUS:=true
          else lVUS:=false;
      end else if sName='PAGEINDEX' then begin
        if IsAllDigit(sValue) then begin
          pc.ActivePageIndex := StrToInt(sValue);
        end else begin
          if sValue='TSMAIN' then begin
            pc.ActivePageIndex:=0;
          end else if sValue='TSVUS' then begin
            pc.ActivePageIndex:=3;
          end else if sValue='TSOCHERED' then begin
            pc.ActivePageIndex:=4;
          end;
        end;
      end else if sName='MEN_NOTPROPIS' then begin
        TdmMen(Dokument).LicID:=0;
      end else if sName='NEW_NOMER_OCH' then begin
        EditDataSet(dmMen.mtDokument);
        dmMen.mtDokumentNOMER_OCH.AsInteger:=dmBase.NewNomerOchered(0);
        n:=0;
        if GlobalTask.ParamAsBoolean('AUTO_DELO')
          then n:=dmBase.Och_GetNextNDELO;
        if n>0
          then dmMen.mtDokumentDELO.AsString:=intToStr(n);
        dmMen.mtDokument.Post;
      end else if sName='PRINT' then begin
        if sValue='0'
          then lPrint:=false;
      end else if sName='BEZADRESA' then begin
        if sValue='1'
          then lBezAdresa:=true;
      end else if sName='ADRES_ID' then begin
        nAdresID:=StrToInt(sValue);
      end;
    end;
  end;
  EnableVus_Form:=lVus;
  EnableOchered_Form:=lOchered;

//  if Dokument.mtDokument.FieldbyName('VUS').AsBoolean then begin
//    EnableVus_Form:=lVus;
//  end;
             
  Dokument.mtDokument.CheckBrowseMode;
  Dokument.mtDokument.Edit;
  if lBezAdresa then begin
    dmMen.IsReadDokument:=true;
    dmMen.mtDokumentBEZADRESA.AsBoolean:=true;
    dmMen.mtDokumentKATEG.AsInteger:=BEZ_ADRESA;
    dmMen.mtDokumentADRES_ID.AsInteger:=0;
    lbOtnosh.Visible:=false;
    edOTNOSH.Visible:=false;
    dmMen.IsReadDokument:=false;
    tsMigr.TabVisible := false;
  end else begin
    lbOtnosh.Visible:=true;
    edOTNOSH.Visible:=true;
    tsMigr.TabVisible := true;
  end;
  // когда заводим нового человека из нового лицевого счета у людей еще ADRES_ID не заполнен
  if nAdresID>-1 then begin
    dmMen.mtDokumentADRES_ID.AsInteger:=nAdresID;
  end;

  CheckControl;
  CheckOchered(0);
  CheckVUS(0);
  N_F_cbNotDelete.Visible:=GlobalTask.ParamAsBoolean('ENABLE_NOTDEL');

  SetLength(FArrZakl,0);
  if tsVUS.TabVisible then begin
    SetLength(FArrZakl,Length(FArrZakl)+1);
    FArrZakl[Length(FArrZakl)-1]:='VUS';
   end;
  if tsOchered.TabVisible then begin
    SetLength(FArrZakl,Length(FArrZakl)+1);
    FArrZakl[Length(FArrZakl)-1]:='OCH';
   end;
  if dmMen.EditFromLichSchet then FSubType:='LIC'
                             else FSubType:='OTD';

  if not lPrint or (GetNameReport='') then begin
    TBItemPreView.Visible:=false;
    TBItemPrint.Visible:=false;
  end else begin
    TBItemPreView.Visible:=true;
    TBItemPrint.Visible:=true;
  end;
  if lPrint then begin
    if Globaltask.ParamAsBoolean('MEN_TO_PRIB') and ( (ANSIUpperCase(FGurnal)='FMGURNALFKN') or (ANSIUpperCase(FGurnal)='FMGURNNASEL')) then begin
      TBItemTalonPrib.Visible:=true;
    end else begin
      TBItemTalonPrib.Visible:=false;
    end;
    TBSubmenuTmp.Visible:=LoadTemplate('fmMen');
  end else begin
    TBItemTalonPrib.Visible:=false;
    TBSubmenuTmp.Visible:=false;
  end;

  if Role.SystemAdmin then begin
    Label70.Visible:=true;
    edDateSrok.Visible:=true;
  end;

  QueryExit:=false;

  if GetParam('RUN_REPORT','0')='1' then begin
    RunReport;
  end;

  if IsShowEdit then begin
    CheckOnlyOtdelno;
    Screen.OnActiveControlChange:=ActiveControlChanged;
    CheckImageAndFont;
    CheckDecDate;
    EditDataSet(dmMen.mtDokument);
    if ShowModal = mrOk then begin
      Result := true;
    end;
    Screen.OnActiveControlChange:=nil;
  end;

end;

procedure TfmMen.LookUpNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
var
  ed : TDBLookupComboboxEh;
  f  : TfmAddSprName;
begin
  if NewText <> '' then begin
  ed := TDBLookupComboboxEh(Sender);
  f := TfmAddSprName.Create(nil);
  f.edNew.Text := NewText;
  if f.ShowModal = mrOk then begin
    NewText := Trim(f.edNew.Text);
  end else begin
    NewText := '';
  end;
  try
    if NewText <> '' then begin
      ed.ListSource.DataSet.Append;
      ed.ListSource.DataSet.FieldByName('NAME').AsString := NewText;
      ed.ListSource.DataSet.Post;
      RecheckInList := true;
    end;
  finally
    f.Free;
  end;
  end;
end;

procedure TfmMen.edPolChange(Sender: TObject);
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

function TfmMen.GetdsDopProp: TDataSource;
begin
  Result := nil;
end;

procedure TfmMen.dsDokumentDataChange(Sender: TObject; Field: TField);
var
  vResult : Variant;
begin
  inherited;
  if Dokument<>nil then begin
    if not FRun and not Dokument.IsReadDokument then begin
      FRun:=true;
      if (Field=nil) then begin
  //      lbAdres.Caption       :=  TdmMen(Dokument).AdresAndTelefon;
        lbUchastokVUS.Caption :=  Globaltask.ParamAsString('UCHASTOK');
        CheckImageLgotEl;
        if TdmMen(Dokument).mtDokumentSPEC_UCH.AsBoolean then begin
          ImageSpec.Visible:=true;
          ImageSpec.Hint := 'Специальный контингент';
        end else begin
          ImageSpec.Visible:=false;
          ImageSpec.Hint := '';
        end;
      end;
      if Field<>nil then begin
        vResult := null;
        if (Field.FieldName='NEWSEM') or (Field.FieldName='SIROTA') or (Field.FieldName='MNOGO_4') or (Field.FieldName='MNOGO_I') or
           (Field.FieldName='GSK_ID') or (Field.FieldName='GSK') or (Field.FieldName='UCHASTOK') then begin
          CheckImageAndFont;
          CheckDecDate;
        end else if (Field.FieldName='DEC_DATE_REAL') then begin
          if edDecDate.ReadOnly then begin
            dmMen.mtDokumentDEC_DATE.AsVariant:=Field.Value;
          end else begin
            if dmMen.mtDokumentDEC_DATE.IsNull and not Field.IsNull
              then dmMen.mtDokumentDEC_DATE.AsVariant:=Field.Value;
          end;
        end;
        RunFuncScript('MEN_ANYCORR', [Field.FieldName], vResult);
      end;
      FRun:=false;
    end;
  end;
end;

procedure TfmMen.edStud_PlaceEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
  EditDataSet(Dokument.mtDokument);
  Dokument.mtDokument.FieldByName('STUDENT_SPR').AsString := '';
  Dokument.mtDokument.FieldByName('STUD_PLACE').AsString  := '';
end;
procedure TfmMen.edWork_NameEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
  EditDataSet(Dokument.mtDokument);
  Dokument.mtDokument.FieldByName('WORK_SPR').AsString := '';
  Dokument.mtDokument.FieldByName('WORK_NAME').AsString  := '';
end;
procedure TfmMen.edDolg_NameEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
  EditDataSet(Dokument.mtDokument);
  Dokument.mtDokument.FieldByName('DOLG_SPR').AsString := '';
  Dokument.mtDokument.FieldByName('DOLG_NAME').AsString  := '';
end;

procedure TfmMen.cbVUSClick(Sender: TObject);
begin
//  if SystemProg.EnableVUS then begin
//    tsVUS.TabVisible := cbVUS.Checked;
//  end;
end;

procedure TfmMen.edNationEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edNation.Value := '3';
end;

//---------------------------------------------------------------------------------------
procedure TfmMen.edOTNOSHEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_OTNOSH', 'OTNOSH', false);
  Handled := true;
end;
procedure TfmMen.edOTNOSHEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  edOTNOSH.Value:=null;
  Handled := true;
end;

//---------------------------------------------------------------------------------------
procedure TfmMen.edPENS_TIPEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_TYPEPENS', 'PENS_TIP', false);
  Handled := true;
end;

procedure TfmMen.N_F_cbSpecClick(Sender: TObject);
begin
  if N_F_cbSpec.Checked then begin
    ImageSpec.Visible:=true;
    ImageSpec.Hint := 'Специальный контингент';
  end else begin
    ImageSpec.Visible:=false;
    ImageSpec.Hint := '';
  end;
end;
//--------------------------------------------------------------------------------------------------------
procedure TfmMen.TextAdresGetText(Sender: TObject; var Text: String);
var
 s,sBookmark : String;
begin
  if not dmMen.IsReadDokument then begin
    if dmMen.mtDokumentADRES_ID.AsInteger>0 then begin
      TextAdres.Font.Color:=clBlack;
      if dmMen.EditFromLichSchet  // если корректируем из лицевого счета, то вызываем только для формирования строки адреса
        then Text:=dmBase.AdresFromIDEx( Dokument.DateFiks, dmMen.mtDokumentADRES_ID.AsString,true,true)
        else Text:=dmBase.AdresFromID( Dokument.DateFiks, dmMen.mtDokumentADRES_ID.AsString); // дополнительно заполняются переменные Adres_ ...
    end else begin  // для тех кто проживает не в сельском совет
      TextAdres.Font.Color:=clBlue;
      Text := dmMen.GetAddAdresProp;
    end;
    if not dmMen.EditFromLichSchet and (dmMen.LicID>0) then begin
      sBookmark:=dmBase.tbLich.Bookmark;
      if dmBase.tbLich.Locate('DATE_FIKS;ID',VarArrayOf([dmMen.DateFiks,dmMen.LicID]),[]) then begin
        s:=dmBase.tbLich.FieldbyName('NOMER').AsString;
      end else begin
        s:='неизв.';
      end;
      dmBase.tbLich.Bookmark:=sBookmark;
      Text:='Лиц.счет:'+s+', '+Text;
    end;
  end;
end;
//--------------------------------------------------------------------------------------------------------
procedure TfmMen.LgotAdresGetText(Sender: TObject; var Text: String);
var
 s,sBookmark : String;
begin
//  EN_LGOT_DATA
  Text:='';
  if not dmMen.IsReadDokument then begin
    if not dmMen.mtDokumentEN_LGOT_DATA.IsNull then begin
      if dmMen.mtDokumentEN_ADRES_ID.AsInteger>0 then begin
        TextAdres.Font.Color:=clBlack;
        sBookmark:=dmBase.tbLich.Bookmark;
        Text := dmBase.AdresFromIDEx( Dokument.DateFiks, dmMen.mtDokumentEN_ADRES_ID.AsString, true, true );
        if dmMen.mtDokumentEN_LIC_ID.AsInteger>0 then begin
          if dmBase.tbLich.Locate('DATE_FIKS;ID',VarArrayOf([dmMen.DateFiks,dmMen.mtDokumentEN_LIC_ID.AsInteger]),[]) then begin
            s:=dmBase.tbLich.FieldbyName('NOMER').AsString;
          end else begin
            s:='неизв.';
          end;
          Text:='Лиц.счет:'+s+', '+Text;
        end;
        dmBase.tbLich.Bookmark:=sBookmark;
      end;
    end;
  end;
end;
//--------------------------------------------------------------------------------------------------------
procedure TfmMen.edDateLgotElEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  f : TfmParamQuest;
  n:Integer;
  dDate:TDateTime;
begin
  if dmMen.mtDokumentADRES_ID.AsInteger>0 then begin
    f:=TfmParamQuest.Create(nil);
    f.Caption := 'Введите значения';
    f.AddParamEx(Now    , 'Дата назначения' , 'DATEN' ,'TYPE=DATE');
    f.AddButtons('Установить~Отказ',0);
    n:=f.ShowQuest;
    dDate:=f.GetValue('DATEN','D');
    f.Free;
    if (n=1) and (dDate>0) then begin
      EditDataSet(dmMen.mtDokument);
      dmMen.mtDokumentEN_LGOT_DATA.AsDateTime:=dDate;
      dmMen.mtDokumentEN_ADRES_ID.AsInteger:=dmMen.mtDokumentADRES_ID.AsInteger;
      dmMen.mtDokumentEN_LIC_ID.AsInteger:=dmMen.LicID;
      PostDataSet(dmMen.mtDokument);
      CheckImageLgotEl;
    end;
  end else begin
    PutError('Неизвестен адрес проживания.',self);
  end;
end;
//--------------------------------------------------------------------------------------------------------
procedure TfmMen.edDateLgotElEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  EditDataSet(dmMen.mtDokument);
  dmMen.mtDokumentEN_LGOT_DATA.AsString:='';
  dmMen.mtDokumentEN_ADRES_ID.AsInteger:=0;
  dmMen.mtDokumentEN_LIC_ID.AsInteger:=0;
  PostDataSet(dmMen.mtDokument);
  CheckImageLgotEl;
end;
//--------------------------------------------------------------------------------------------------------
procedure TfmMen.CheckImageLgotEl;
begin
  if (dmMen.mtDokumentEN_ADRES_ID.AsInteger>0) then begin
    if (dmMen.mtDokumentEN_ADRES_ID.AsInteger=dmMen.mtDokumentADRES_ID.AsInteger) then begin
      ImageEl.Visible:=true;
      ImageElClr.Visible:=false;
    end else begin
      ImageEl.Visible:=false;
      ImageElClr.Visible:=true;
    end;
  end else begin
    ImageEl.Visible:=false;
    ImageElClr.Visible:=false;
  end;
end;

//--------------------------------------------------------------------------------------------------------
//  choice adres
//--------------------------------------------------------------------------------------------------------
//---- 1
procedure TfmMen.btAdresSimpleClick(Sender: TObject);
var
  lErr : Boolean;
begin
  if fmChoiceAdresS= nil then begin
    fmChoiceAdresS := TfmChoiceAdresS.Create(nil);
  end;
  fmChoiceAdresS.DateFiks := Dokument.DateFiks;
  dsDokument.DataSet.CheckBrowseMode;
  if fmChoiceAdresS.EditAdres then begin
    dmMen.mtDokument.Edit;
    dmMen.mtDokumentADRES_ID.AsInteger:=fmChoiceAdresS.IDAdres;
    dmMen.mtDokument.Post;
    dmBase.AdresFromID(Dokument.DateFiks, dmMen.mtDokumentADRES_ID.AsString, false); // заполним переменные Adres_ ...
    if dmMen.EditFromLichSchet then begin
      TdmLichSchet(Dokument).ReadPropAdres(lErr);
    end;
    CheckControl;
  end;
end;
//---- 2
procedure TfmMen.btAdresVvodClick(Sender: TObject);
var
  adr : TAdres;
  strErr : String;
  nUL,n : Integer;
  lErr:Boolean;
begin
  dsDokument.DataSet.CheckBrowseMode;
  dmBase.AdresFromID(Dokument.DateFiks, dmMen.mtDokumentADRES_ID.AsString, false);    // заполним переменные Adres_ ...
  adr.PunktKod:=dmBase.Adres_PunktKod;
  if dmMen.mtDokumentADRES_ID.AsInteger<=0
    then adr.UlicaInt:=-1
    else adr.UlicaInt:=dmBase.Adres_UlKod;
  adr.UlicaInt:=dmBase.Adres_UlKod;
  adr.NDom:=dmBase.Adres_NDom;
  adr.Korp:=dmBase.Adres_Korp;
  adr.Kv:=dmBase.Adres_Kv;
  adr.NotDom:=false;
  adr.SpecUch:=dmBase.Adres_SpecUch;
  adr.NameHouse:='';
  {$IFDEF GKH}
    if IsAccountRnGor
      then adr.RnGor:=GlobalTask.ParamAsInteger('RN_GOROD');
      else adr.RnGor:=0;
  {$ELSE}
    adr.RnGor:=0;
  {$ENDIF}
  n:=AddNewAdres2(Dokument.DateFiks,adr,strErr,false,'Адрес;Выбрать',self);
  if (n=0) or (n=1) then begin
    dmMen.mtDokument.Edit;
    dmMen.mtDokumentADRES_ID.AsInteger:=adr.AdresID;
    dmMen.mtDokument.Post;
    dmBase.AdresFromID(Dokument.DateFiks, dmMen.mtDokumentADRES_ID.AsString, false);  // заполним переменные Adres_ ...
    if dmMen.EditFromLichSchet then begin
      TdmLichSchet(Dokument).ReadPropAdres(lErr);
    end;
    CheckControl;
  end;
end;
//---- 3
procedure TfmMen.btAdresClick(Sender: TObject);
var
  lErr : Boolean;
begin
  if fmChoiceAdres= nil then begin
    fmChoiceAdres := TfmChoiceAdres.Create(nil);
  end;
  fmChoiceAdres.DateFiks := Dokument.DateFiks;
  fmChoiceAdres.ChoiceLich := false;
  dmMen.mtDokument.CheckBrowseMode;
  if (fmChoiceAdres.ShowModal = mrOk) and (fmChoiceAdres.IDAdres>0) then begin
    dmMen.mtDokument.Edit;
    dmMen.mtDokumentADRES_ID.AsInteger:=fmChoiceAdres.IDAdres;
    dmMen.mtDokument.Post;
    dmBase.AdresFromID(Dokument.DateFiks, dmMen.mtDokumentADRES_ID.AsString, false);  // заполним переменные Adres_ ...
    if dmMen.EditFromLichSchet then begin
      TdmLichSchet(Dokument).ReadPropAdres(lErr);
    end;
    CheckControl;
  end;
end;
//--------------------------------------------------------------------------------------------------------
//  end choice adres
//--------------------------------------------------------------------------------------------------------

procedure TfmMen.btAdresGit_VibClick(Sender: TObject);
var
  adr : TAdres;
  strErr,sAdr : String;
  nUL,n : Integer;
  lErr:Boolean;
begin
  n:=GlobalTask.ParamAsInteger('SIMPLE_ADRES');
  if n=0 then begin
    if fmChoiceAdres= nil then fmChoiceAdres := TfmChoiceAdres.Create(nil);
    fmChoiceAdres.DateFiks := dmBase.GetDateCurrentSost;
    fmChoiceAdres.ChoiceLich := false;
    if fmChoiceAdres.ShowModal = mrOk then begin
      EditDataSet(dmMen.mtDokument);
      if fmChoiceAdres.IDAdres<>dmMen.mtDokumentADRES_ID.AsInteger
        then dmMen.mtDokumentADRES_ID_GIT.AsInteger := fmChoiceAdres.IDAdres
        else PutError('Адрес совпадает с местом регистрации.');
    end;
  end else if n=1 then begin
    if fmChoiceAdresS= nil then begin
      fmChoiceAdresS := TfmChoiceAdresS.Create(nil);
    end;
    fmChoiceAdresS.DateFiks := Dokument.DateFiks;
    dsDokument.DataSet.CheckBrowseMode;
    if fmChoiceAdresS.EditAdres then begin
      dmMen.mtDokument.Edit;
      dmMen.mtDokumentADRES_ID_GIT.AsInteger:=fmChoiceAdresS.IDAdres;
      dmMen.mtDokument.Post;
    end;
  end else begin
    dsDokument.DataSet.CheckBrowseMode;
    if dmMen.mtDokumentADRES_ID_GIT.AsString=''
      then sAdr:=dmMen.mtDokumentADRES_ID.AsString
      else sAdr:=dmMen.mtDokumentADRES_ID_GIT.AsString;
    dmBase.SaveGlobalAdres; // сохраним переменные Adres_ ...
    dmBase.AdresFromID(Dokument.DateFiks, sAdr, false);
    adr.PunktKod:=dmBase.Adres_PunktKod;
    adr.UlicaInt:=dmBase.Adres_UlKod;
    adr.NDom:=dmBase.Adres_NDom;
    adr.Korp:=dmBase.Adres_Korp;
    adr.Kv:=dmBase.Adres_Kv;
    adr.NotDom:=false;
    adr.NameHouse:='';
    {$IFDEF GKH}
      if IsAccountRnGor
        then adr.RnGor:=GlobalTask.ParamAsInteger('RN_GOROD');
        else adr.RnGor:=0;
    {$ELSE}
      adr.RnGor:=0;
    {$ENDIF}
    n:=AddNewAdres2(Dokument.DateFiks,adr,strErr,false,'Адрес;Выбрать');
    if (n=0) or (n=1) then begin
      dmMen.mtDokument.Edit;
      dmMen.mtDokumentADRES_ID_GIT.AsInteger:=adr.AdresID;
      dmMen.mtDokument.Post;
    end;
    dmBase.RestGlobalAdres;  // восстановим переменные Adres_ ...
  end;
end;
//--------------------------------------------------------------------------------------------------------
procedure TfmMen.CheckControl;
var
  l:Boolean;
begin
  if dmMen.EditFromLichSchet or (dmMen.LicID >0) then begin  // если корректируем из лицевого счета или человека на лицевом счете
//    edCanSelect.Visible:=true;
    if GlobalTask.ParamAsBoolean('FIRST_NOTMY') then begin
      N_F_edFirstNotMy.Visible:=true;
      if dmMen.mtDokumentFIRST.AsBoolean
        then N_F_edFirstNotMy.Enabled:=true
        else N_F_edFirstNotMy.Enabled:=false;
    end else begin
      N_F_edFirstNotMy.Visible:=false;
    end;
    btAdres.Visible     := false;
    N_F_cbBezAdresa.Visible := false;
//    edCanSelect.Visible := true;
    N_F_cbKvartirant.Visible := true;
    N_F_cbKvartirant.Enabled := not dmMen.mtDokumentFIRST.AsBoolean;
    edAdresprop.Parent:=pnNotReg;
    edAdresprop.Left:=lbAdresProp.Left+lbAdresProp.Width+10;
    edAdresprop.Top:=lbAdresProp.Top-4;
    edAdresprop.Width:=TextAdres.Width;
    lbAdresProp.Visible:=true;

//    if dmMen.GetAddAdresProp=''
//      then pnReg.Enabled:=true
//      else pnReg.Enabled:=false;

  end else begin   // человек не на лицевом счете
//    edCanSelect.Visible:=false;
    N_F_edFirstNotMy.Visible:=false;
    N_F_cbBezAdresa.Visible :=true;
//    pnReg.Enabled:=false;
    if dmMen.mtDokumentKATEG.AsInteger=BEZ_ADRESA then begin
      edAdresprop.Parent:=pnZag;
      edAdresprop.Left:=TextAdres.Left;
      edAdresprop.Top:=TextAdres.Top;
      edAdresprop.Width:=TextAdres.Width;
      btAdres.Visible := false;
      lbAdresProp.Visible:=false;
      N_F_cbKvartirant.Visible:= false;
    end else begin
      edAdresprop.Parent:=pnNotReg;
      edAdresprop.Left:=lbAdresProp.Left+lbAdresProp.Width+10;
      edAdresprop.Top:=lbAdresProp.Top-4;
      edAdresprop.Width:=TextAdres.Width;
      btAdres.Visible := true;
      lbAdresProp.Visible:=true;
      N_F_cbKvartirant.Visible := true;
      N_F_cbKvartirant.Enabled := true;
    end;
  end;
  if dmMen.EditFromLichSchet or (dmMen.LicID >0) then begin  // если корректируем из лицевого счета или человека на лицевом счете
    pnReg.Enabled:=true;
  end else begin
    // человек без адреса на территории совета
    if dmMen.mtDokumentADRES_ID.AsInteger<=0 then begin
      pnReg.Enabled:=false;
    end else begin
      pnReg.Enabled:=true;
    end;
  end;
  if dmMen.EditFromLichSchet  // если корректируем из лицевого счета
    then l:=true
    else l:=false;
  edPapa.EditButtons[1].Visible:=l;
  edMama.EditButtons[1].Visible:=l;
  edSuprug.EditButtons[1].Visible:=l;
  edSuprug2.EditButtons[1].Visible:=l;

  CheckControlHist;

end;

procedure TfmMen.edPropisClick(Sender: TObject);
begin
  CheckControl;
end;

procedure TfmMen.edPresentExClick(Sender: TObject);
begin
  CheckControl;
end;

procedure TfmMen.UserAfterSkip;
begin
//  EditDataSet(Dokument.mtDokument);
  CheckControl;
  CheckOchered(0);
  CheckVUS(0);
  CheckOnlyOtdelno;
  if GetNameReport='' then begin
    TBItemPreView.Visible:=false;
    TBItemPrint.Visible:=false;
  end else begin
    TBItemPreView.Visible:=true;
    TBItemPrint.Visible:=true;
  end;
  SetLength(FArrZakl,0);
  if tsVUS.TabVisible then begin
    SetLength(FArrZakl,Length(FArrZakl)+1);
    FArrZakl[Length(FArrZakl)-1]:='VUS';
  end;
  if tsOchered.TabVisible then begin
    SetLength(FArrZakl,Length(FArrZakl)+1);
    FArrZakl[Length(FArrZakl)-1]:='OCH';
  end;
  if Globaltask.ParamAsBoolean('MEN_TO_PRIB') and ( (ANSIUpperCase(FGurnal)='FMGURNALFKN') or (ANSIUpperCase(FGurnal)='FMGURNNASEL')) then begin
    TBItemTalonPrib.Visible:=true;
  end else begin
    TBItemTalonPrib.Visible:=false;
  end;
  TBSubmenuTmp.Visible:=LoadTemplate('fmMen');
  CheckImageAndFont;
  CheckDecDate;
//  QueryExit := false;
end;

procedure TfmMen.edMR_OBLNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmMen.edMR_RAIONNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

//----------------------------------------------------------
procedure TfmMen.Event_ZaprosBankMain(Sender : TObject);
begin
  dmMen.ZaprosBank(true,self);
end;
procedure TfmMen.Event_ZaprosBankSostav(Sender : TObject);
begin
  dmMen.ZaprosBank(false,self);
end;
procedure TfmMen.Event_ClearTmpDir(Sender : TObject);
var
  sPath:String;
begin
  sPath:=ExtractFilePath(Application.ExeName)+'Export';
  ForceDirectories(sPath);
  ClearDir(sPath,false);
end;
procedure TfmMen.Event_OpenTmpDir(Sender : TObject);
var
  sPath:String;
begin
  sPath:=ExtractFilePath(Application.ExeName)+'Export';
  ForceDirectories(sPath);
  ShellExecute(Application.Handle, PChar('explore'), PChar(sPath), nil, nil, SW_SHOWNORMAL);
end;

//----------------------------------------------------------
procedure TfmMen.Event_SetDokument(Sender: TObject);
begin
  dmMen := TdmMen(Sender);
  LoadHistFields;
end;

procedure TfmMen.edTypeHouseEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_TYPEHOUSE', 'TYPEHOUSE', false);
  Handled := true;
end;

procedure TfmMen.edRegReshEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
//
end;

const
  PC_OCH_RESH=0;
  PC_OCH_SOST=1;
  PC_OCH_OTD=2;
  PC_OCH_DOCS=3;
  PC_OCH_PRIM=4;

procedure TfmMen.pcOcheredChange(Sender: TObject);
begin
  case pcOchered.ActivePageIndex of
    PC_OCH_RESH : begin     // решения
                    btAddMen.Enabled:=true;
                    btDelMen.Enabled:=true;
                    btEdit.Enabled:=true;
                  end;
    PC_OCH_SOST : begin     // состав семьи
                    btAddMen.Enabled:=true;
                    btDelMen.Enabled:=true;
                    btEdit.Enabled:=true;
                  end;
    PC_OCH_OTD  : begin     // отдельная очередь
                    btAddMen.Enabled:=true;
                    btDelMen.Enabled:=true;
                    btEdit.Enabled:=true;
                  end;
    PC_OCH_DOCS : begin     // документы
                    btAddMen.Enabled:=true;
                    btDelMen.Enabled:=false;
                    btEdit.Enabled:=false;
                  end;
  else
    btAddMen.Enabled:=false;
    btDelMen.Enabled:=false;
    btEdit.Enabled:=false;
  end;
end;

procedure TfmMen.SetEnableOchered_Form(const Value: Boolean);
begin
  FEnableOchered_Form := Value;
end;

procedure TfmMen.SetEnableVUS_Form(const Value: Boolean);
begin
  FEnableVUS_Form := Value;
end;

procedure TfmMen.btIsk2VklClick(Sender: TObject);
var
  s:String;
begin
  if (dmMen.tbSostavSem.RecordCount>0) then begin
//    if dmMen.tbSostavSemOCH.AsBoolean
//      then s:='Исключить из сосва семьи  ?'
//      else s:='Включить в состав семьи ?';
//    if Problem(s) then begin
      s:=dmMen.tbSostavSem.Bookmark;
      EditDataSet(dmMen.tbSostavSem);
      dmMen.tbSostavSemISKL.AsBoolean:=not dmMen.tbSostavSemISKL.AsBoolean;
      if dmMen.tbSostavSemISKL.AsBoolean
        then dmMen.tbSostavSemNOMER.AsString:='';
      PostDataSet(dmMen.tbSostavSem);
      dmMen.CheckCountSostav;
      dmMen.tbSostavSem.Bookmark:=s;
{
      EditDataSet(dmMen.mtDokument);
      if dmMen.tbSostavSemOCH.AsBoolean
        then dmMen.mtDokumentKOLVO_SOSTAV.AsInteger:=dmMen.mtDokumentKOLVO_SOSTAV.AsInteger+1
        else dmMen.mtDokumentKOLVO_SOSTAV.AsInteger:=dmMen.mtDokumentKOLVO_SOSTAV.AsInteger-1;
      }
//    end;
      dmMen.OchSostavMod:=true;
      QueryExit:=true;
    ActiveControl:=GridSostav;
  end;
end;

//----------------------------------------------------------------------------------
procedure TfmMen.btDelMenClick(Sender: TObject);
var
  s:String;
  l:Boolean;
  n:Integer;
begin
  if pcOchered.ActivePageIndex=PC_OCH_RESH then begin
    dmMen.tbOcheredResh.CheckBrowseMode;
    if dmMen.tbOcheredResh.RecordCount>0 then begin
      if Problem('Удалить решение ?',mtConfirmation,self) then begin
        dmMen.tbOcheredResh.Delete;
        dmMen.OchReshMod:=true;
        QueryExit:=true;
        CheckDecDate;
      end;
    end;
  //---- состав семьи --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_SOST then begin
    dmMen.tbSostavSem.CheckBrowseMode;
    if dmMen.tbSostavSem.RecordCount>0 then begin
      if Problem('Удалить члена семьи ?',mtConfirmation,self) then begin
        dmMen.OchSostavMod:=true;
        dmMen.tbSostavSem.Delete;
        EditDataSet(dmMen.mtDokument);
        dmMen.mtDokumentKOLVO_SOSTAV.AsInteger:=dmMen.tbSostavSem.RecordCount+1;
        QueryExit:=true;
      end;
    end;
    dmMen.CheckCountSostav;
  //---- дополнительные очереди --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_OTD then begin
    dmMen.tbOcheredLgot.CheckBrowseMode;
    if dmMen.tbOcheredLgot.RecordCount>0 then begin
      if (dmMen.tbOcheredLgotOCHERED_ID.AsInteger=OCH_TYPE_SOCIAL) and cbOnly.Checked then begin
        PutError('Отключите "Только отдельная очередь" ',self);
      end else begin
        if Problem('Удалить отдельную очередь ?',mtConfirmation,self) then begin
          dmMen.DeleteReshOch(dmMen.tbOcheredLgotOCHERED_ID.AsInteger);
          dmMen.OchReshMod:=true;
          dmMen.tbOcheredLgot.Delete;
          QueryExit:=true;
          CheckOnlyOtdelno;
        end;
      end;
    end;
  //---- документы --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_DOCS then begin

  //---- примечание --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_PRIM then begin

  end;

end;

procedure TfmMen.btAddMenClick(Sender: TObject);
var
  nID,n,nChoiceLic : Integer;
  l : Boolean;
  s,s1,s2,ss : String;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  lFilterTemp,lSeek:Boolean;
  strSeek,strFilter,old:String;
  lClear:Boolean;
begin
  //---- решения --------------------
  if pcOchered.ActivePageIndex=PC_OCH_RESH then begin
    {$IFNDEF ZAGS}
    EditOchResh(dmMen, true, 0, nil, dmMen.mtDokument);
    CheckDecDate;
    // dmMen.OchReshMod:=true;   внутри функции
    {$ENDIF}

  //---- состав семьи --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_SOST then begin
    l:=dbDisableControls(dmMen.tbSostavSem);
    s:=dmMen.mtDokumentID.AsString+';';
    dmMen.tbSostavSem.First;
    while not dmMen.tbSostavSem.Eof do begin
      s:=s+dmMen.tbSostavSemMEMBER_ID.AsString+';';
      dmMen.tbSostavSem.Next;
    end;
    dmMen.tbSostavSem.First;
    nID:=0;
    nChoiceLic:=-1;
    if dmMen.LicID>0 then begin
      lFilterTemp:=true;
      strFilter:='LIC_ID='+IntToStr(dmMen.LicID);
      strSeek:='';
    end else begin
      lFilterTemp:=false;
      strSeek:=Trim(edFam.Text);
      strFilter:='';
    end;
    if ChoiceMen( nil, strSeek, strFilter, arrRec, lFilterTemp) then begin
      nID := GetValueField(arrRec, 'ID');
      nChoiceLic:=GetValueField(arrRec, 'LIC_ID');
      lSeek:=dmBase.tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([0,nID]),[]);
      if lSeek then begin
        if dmBase.tbOchered.FieldByName('ISKL').AsBoolean then begin
          lSeek:=false;
        end;
      end;
      if not lSeek then begin
        //--- контроль присутствия в составе семьи стоящих на учете --------------
        if not dmBase.Check_AddMenToOchered_Sostav(nID) then begin
          nID:=0;
        end;
      end else begin
        PutError(GetValueField(arrRec, 'FAMILIA')+' '+
                 GetValueField(arrRec, 'NAME')+' '+
                 GetValueField(arrRec, 'OTCH')+' уже присутствует в очереди.');
        nID:=0;
      end;
    end;
//    nID:=dmBase.ChoiceMenLic(dmBase.GetDateCurrentSost, IntToStr(dmMen.LicID), cmNotCanDelete,s, 'Выберите члена семьи');
    if nID > 0 then begin
      dmMen.OchSostavMod:=true;
      dmMen.tbSostavSem.Append;
      dmMen.tbSostavSemMEMBER_ID.AsInteger:=nID;
      dmMen.tbSostavSemISKL.AsBoolean:=false;
      if dmBase.tbMens.Locate('DATE_FIKS;ID', VarArrayOf([dmBase.GetDateCurrentSost,nID]), []) then begin
        //---- ключ -----
        dmMen.tbSostavSemID_INTERNAL.AsInteger := dmMen.mtDokumentID_INTERNAL.AsInteger;
        dmMen.tbSostavSemNOMER.AsInteger := dmMen.tbSostavSem.RecordCount+1;
        //--- запишем из таблицы "Население" -----
        dmMen.tbSostavSemFAMILIA.AsString := dmBase.tbMens.FieldByName('FAMILIA').AsString;
        dmMen.tbSostavSemNAME.AsString := dmBase.tbMens.FieldByName('NAME').AsString;
        dmMen.tbSostavSemOTCH.AsString := dmBase.tbMens.FieldByName('OTCH').AsString;
        dmMen.tbSostavSemPOL.AsString := dmBase.tbMens.FieldByName('POL').AsString;
        dmMen.tbSostavSemLICH_NOMER.AsString := dmBase.tbMens.FieldByName('LICH_NOMER').AsString;
        WriteDateField(dmMen.tbSostavSemDATER, dmBase.tbMens.FieldByName('DATER'));
        // если глава хозяйства и лицевые счета совпадают то перенесем и отношение, иначе надо выбрать
        if (dmMen.LicID=nChoiceLic) and (dmMen.LicID>0) and (dmMen.mtDokumentFIRST.AsBoolean=true) then begin
          dmMen.tbSostavSemOTNOSH.AsString := dmBase.tbMens.FieldByName('OTNOSH').AsString;
        end else begin
          Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_OTNOSH_EX');
          if Opis <> nil then begin
            if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
              dmMen.tbSostavSemOTNOSH.AsString:=v;
            end else begin
              dmMen.tbSostavSemOTNOSH.AsString:=dmBase.tbMens.FieldByName('OTNOSH').AsString;
            end;
          end;
        end;
        //----------------------------------------
        dmMen.tbSostavSem.Post;
        QueryExit:=true;
        EditDataSet(dmMen.mtDokument);
        dmMen.CheckCountSostav;
      end else begin
        dmMen.tbSostavSem.Cancel;
      end;
    end;
    dbEnableControls(dmMen.tbSostavSem,l);
  //---- дополнительные очереди --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_OTD then begin
    {$IFNDEF ZAGS}
    EditLgotOchered( true, dmMen, Self);
    CheckOnlyOtdelno;
    {$ENDIF}
  //---- документы --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_DOCS then begin
    s:=ChoiceFromShablon(SHABLON_OCH);
    n:=edDoks.SelStart;
    edDoks.SelStart:=0;
    edDoks.SelLength:=0;
    s1:=Copy(edDoks.Text,1,n);
    s2:=Copy(edDoks.Text,n+1,Length(edDoks.Text));
    edDoks.Text := s1+s+s2;
    edDoks.SelStart:=Length(s1+s);
//            eTDBEditEh(ActiveControl).Text := TDBEditEh(ActiveControl).Text + s;
//            SendMessage(TDBEditEh(ActiveControl).Handle,  WM_SETTEXT,  0,  LParam(PChar(s)));
//            if TDBEditEh(ActiveControl).WantReturns then begin
//              SendKeys('{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{END}', false);
//            end else begin
//              SendKeys('{END}', false);
//            end;
  //---- примечание --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_PRIM then begin

  end;
end;
//--------------------------------------------------------------------------------------------------
procedure TfmMen.btEditClick(Sender: TObject);
var
  Opis:TOpisEdit;
  arrRec:TCurrentRecord;
  v:Variant;
begin
  //---- решения --------------------
  if pcOchered.ActivePageIndex=PC_OCH_RESH then begin
    {$IFNDEF ZAGS}
     if dmMen.tbOcheredReshTIP.AsInteger>0 then begin
       if EditOchResh(dmMen, false, 0, nil, dmMen.mtDokument) then begin
        // dmMen.OchReshMod:=true;   внутри функции
         QueryExit:=true;
        CheckDecDate;
       end;
     end;
    {$ENDIF}
  //---- состав семьи --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_SOST then begin
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_OTNOSH_EX');
    if Opis <> nil then begin
      v:=null;
      if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
        dmMen.OchSostavMod:=true;
        dmMen.tbSostavSem.CheckBrowseMode;
        dmMen.tbSostavSem.Edit;
        dmMen.tbSostavSemOTNOSH.AsString:=v;
        dmMen.tbSostavSem.Post;
      end;
    end;
  //---- дополнительные очереди --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_OTD then begin
    {$IFNDEF ZAGS}
    if dmMen.tbOcheredLgot.RecordCount>0  then EditLgotOchered( false, dmMen, Self);
    {$ENDIF}
  //---- примечание --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_PRIM then begin

  end;
end;


procedure TfmMen.GridOcheredDblClick(Sender: TObject);
begin
  btEditClick(nil);
end;

procedure TfmMen.dsSostavSemDataChange(Sender: TObject; Field: TField);
begin
  if dmMen.tbSostavSemISKL.AsBoolean then begin
    btIsk2Vkl.Caption:='Включить';
    btIsk2Vkl.Hint:='Включить человека в состав семьи';
  end else begin
    btIsk2Vkl.Caption:='Исключить';
    btIsk2Vkl.Hint:='Исключить человека из состава семьи';
  end;
  if (Field<>nil) then begin
    QueryExit := true;
  end;
end;

procedure TfmMen.dsOcheredLgotDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) then begin
    QueryExit := true;
  end;
end;

destructor TfmMen.Destroy;
begin
//  GlobalTask.SaveMRUListForm(Self);
  inherited;
end;

procedure TfmMen.edPasp_OrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD,Trim(edPasp_Organ.Text));
 if s<>'' then begin
   edPasp_Organ.Text:=s;
 end;
end;

procedure TfmMen.edAdresPropEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  adr : TAdres;
  lOk : Boolean;
  s : String;
begin
  adr.AdresPropis:=dmMen.mtDokumentADRES_PROP.AsString;
  adr.Obl:=dmMen.mtDokumentAPROP_OBL.AsString;
  adr.Raion:=dmMen.mtDokumentAPROP_RN.AsString;
  adr.Punkt:=dmMen.mtDokumentAPROP_PN.AsString;
  adr.Ulica:=dmMen.mtDokumentAPROP_UL.AsString;
  adr.NDom:=dmMen.mtDokumentAPROP_DOM.AsString;
  adr.Korp:=dmMen.mtDokumentAPROP_KORP.AsString;
  adr.Kv:=dmMen.mtDokumentAPROP_KV.AsString;
  if VvodAdres(adr) then begin
    dmMen.mtDokument.CheckBrowseMode;
    dmMen.mtDokument.Edit;
    lOk:=true;
    try
      dmMen.mtDokumentAPROP_OBL.AsString:=adr.Obl;
      dmMen.mtDokumentAPROP_RN.AsString:=adr.Raion;
      dmMen.mtDokumentAPROP_PN.AsString:=adr.Punkt;
      dmMen.mtDokumentAPROP_UL.AsString:=adr.Ulica;
      dmMen.mtDokumentAPROP_DOM.AsString:=adr.NDom;
      dmMen.mtDokumentAPROP_KORP.AsString:=adr.Korp;
      dmMen.mtDokumentAPROP_KV.AsString:=adr.Kv;
      dmMen.mtDokument.Post;
    except
      lOk:=false;
      dmMen.mtDokument.Cancel;
      PutError('Ошибка записи адреса.');
    end;
    if lOk then begin
      if adr.AdresPropis='не известен' then begin
        s:=adr.AdresPropis;
      end else begin
        s:='';
        if adr.Obl<>'' then s:=s+adr.Obl+' обл., ';
  //    if adr.Obl<>'' then s:=s+adr.Obl+', ';
        if adr.Raion<>'' then s:=s+adr.Raion+' р-н, ';
  //      if adr.Raion<>'' then s:=s+adr.Raion+', ';
  //      n:=dmBase.GetTypePunkt( IntToStr(adr.PunktTK),'', ss);
  //      if n=0 then ss:='' else ss:=ss+' ';
        if adr.Punkt<>'' then s:=s+adr.Punkt+', ';
  //      if dmBase.SprTypeUL.Locate('ID', adr.UlicaType, []) then begin
  //        ss:=dmBase.SprTypeUL.FieldByName('NAME').AsString+' ';
  //      end else begin
  //        ss:='';
  //      end;
        if adr.Ulica<>'' then s:=s+adr.Ulica+', ';
        if adr.NDom<>'' then s:=s+sokrDom+' '+adr.NDom+', ';
        if adr.Korp<>'' then s:=s+sokrKorp+' '+adr.Korp+', ';
        if adr.Kv<>'' then s:=s+sokrKv+' '+adr.Kv+', ';
        s:=Trim(Copy(s,1,Length(s)-2));
      end;
      dmMen.mtDokument.CheckBrowseMode;
      dmMen.mtDokument.Edit;
      dmMen.mtDokumentADRES_PROP.AsString:=s;
      dmMen.mtDokument.Post;
    end;
    CheckControl;
  end;
end;

procedure TfmMen.edAdresPropEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  dmMen.mtDokument.CheckBrowseMode;
  dmMen.mtDokument.Edit;
  dmMen.mtDokumentADRES_PROP.AsString:='';
  dmMen.mtDokumentAPROP_OBL.AsString:='';
  dmMen.mtDokumentAPROP_RN.AsString:='';
//      dmMen.mtDokumentAPROP_TP.AsInteger:=0;
  dmMen.mtDokumentAPROP_PN.AsString:='';
//      dmMen.mtDokumentAPROP_TU.AsInteger:=0;
  dmMen.mtDokumentAPROP_UL.AsString:='';
  dmMen.mtDokumentAPROP_DOM.AsString:='';
  dmMen.mtDokumentAPROP_KORP.AsString:='';
  dmMen.mtDokumentAPROP_KV.AsString:='';
  dmMen.mtDokument.Post;
  CheckControl;
end;

procedure TfmMen.btAddMigrClick(Sender: TObject);
var
  lDubl:Boolean;
begin
//  GridMigr.datasource.dataset.Append;
//  ActiveControl:=GridMigr;
//  GridMigr.SelectedIndex:=0;
  fmMenDvig:=TfmMenDvig.Create(nil);
  dmMen.tbMigr.Append;
  dmMen.tbMigrOP_B_RESP.AsBoolean:=true;
  dmMen.tbMigrOP_B_OBL.AsBoolean:=true;
  dmMen.tbMigrORGAN.AsString:=GlobalTask.ParamAsString('PROP_ORGAN');
  if fmMenDvig.ShowModal=mrOk then begin
    dmMen.tbMigrKOMM.AsString:=dmBase.GetMestoMen(0,'',false,0,dmMen.tbMigr);
    lDubl:=false;
    try
      dmMen.DvigMod:=true;
      dmMen.tbMigr.Post;
    except
      on E:Exception do begin
        if E is EMemTableDupKey then begin
          lDubl:=true;
        end;
        if lDubl
          then PutError(' Дублирование даты прибытия/убытия. ')
          else PutError(E.Message);
        dmMen.tbMigr.Cancel;
      end;
    end;
  end else begin
    dmMen.tbMigr.Cancel;
  end;
  fmMenDvig.Free;
end;

procedure TfmMen.btEditMigrClick(Sender: TObject);
var
  lDubl:Boolean;
begin
  if dmMen.tbMigr.RecordCount>0 then begin
    fmMenDvig:=TfmMenDvig.Create(nil);
    EditDataSet(dmMen.tbMigr);
    if dmMen.tbMigrOP_B_RESP.IsNull or (dmMen.tbMigrOP_GOSUD.AsString='') then dmMen.tbMigrOP_B_RESP.AsBoolean:=true;
    if dmMen.tbMigrOP_B_OBL.IsNull or (dmMen.tbMigrOP_OBL.AsString='')    then dmMen.tbMigrOP_B_OBL.AsBoolean:=true;
    if fmMenDvig.ShowModal=mrOk then begin
      dmMen.tbMigrKOMM.AsString:=dmBase.GetMestoMen(0,'',false,0,dmMen.tbMigr);
      lDubl:=false;
      try
        dmMen.DvigMod:=true;
        dmMen.tbMigr.Post;
      except
        on E:Exception do begin
          if E is EMemTableDupKey then begin
            lDubl:=true;
          end;
          if lDubl
            then PutError(' Дублирование даты прибытия/убытия. ')
            else PutError(E.Message);
          dmMen.tbMigr.Cancel;
        end;
      end;
    end else begin
      dmMen.tbMigr.Cancel;
    end;
    fmMenDvig.Free;
  end;
end;

procedure TfmMen.btDelMigrClick(Sender: TObject);
begin
  if not (GridMigr.DataSource.DataSet.Eof and GridMigr.DataSource.DataSet.Bof) then begin
    if Problem(' Удалить запись ? ',mtConfirmation,self) then begin
      dmMen.DvigMod:=true;
      GridMigr.DataSource.DataSet.Delete;
      CheckQueryExit:=true;
      QueryExit := true;
      ActiveControl:=GridMigr;
    end;
  end;
end;

procedure TfmMen.vchDBText1GetText(Sender: TObject; var Text: String);
begin
  Text := IntToStr(TdmMen(Dokument).LicID)+'   '+FGurnal;
end;

procedure TfmMen.ENG_edLichNomerUpdateData(Sender: TObject; var Handled: Boolean);
var
  s:String;
begin
//  if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
    if (edUdost.Field.AsInteger=PASP_GR_RB) and (edCitizen.Field.Value=MY_GRAG) or edCitizen.Field.IsNull then begin
      ENG_edLichNomer.text := CheckLichNom(true, ENG_edLichNomer.Text);
      s:=GetErrorCheck;
      if s<>'' then begin
        PutError(s,self);
      end;
    end;
//  end;
end;

procedure TfmMen.GridSostavColumns7UpdateData(Sender: TObject; var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  s:String;
begin
  if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
    Value:=CheckLichNom(true, Value);
    s:=GetErrorCheck;
    if s<>'' then begin
      PutError(s);
    end;
  end;
end;

procedure TfmMen.N_F_cbBezAdresaClick(Sender: TObject);
begin
  if not dmMen.IsReadDokument then begin
    if dmMen.EditFromLichSchet or (dmMen.LicID>0) then begin

    end else begin
      if dmMen.mtDokument.State<>dsEdit then dmMen.mtDokument.Edit;
      if N_F_cbBezAdresa.Checked then begin
        dmMen.mtDokumentADRES_ID.AsInteger:=0;
        dmMen.mtDokumentKATEG.AsInteger:=BEZ_ADRESA;
      end else begin
        dmMen.mtDokumentKATEG.AsInteger:=ADRES_NOTREG;
      end;
    end;
    CheckControl;
  end;
end;

procedure TfmMen.GridOcheredColumns4GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  //
end;

procedure TfmMen.edAdresGitEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  adr : TAdres;
  lOk : Boolean;
  s,strTelefon : String;
begin
  adr.AdresPropis:=dmMen.mtDokumentADRES_GIT.AsString;
  adr.Obl:=dmMen.mtDokumentAGIT_OBL.AsString;
  adr.Raion:=dmMen.mtDokumentAGIT_RN.AsString;
  adr.Punkt:=dmMen.mtDokumentAGIT_PN.AsString;
  adr.Ulica:=dmMen.mtDokumentAGIT_UL.AsString;
  adr.NDom:=dmMen.mtDokumentAGIT_DOM.AsString;
  adr.Korp:=dmMen.mtDokumentAGIT_KORP.AsString;
  adr.Kv:=dmMen.mtDokumentAGIT_KV.AsString;
  strTelefon:='not visible';
  if VvodAdresTel(adr,strTelefon) then begin
    dmMen.mtDokument.CheckBrowseMode;
    dmMen.mtDokument.Edit;
    lOk:=true;
    try
      dmMen.mtDokumentAGIT_OBL.AsString:=adr.Obl;
      dmMen.mtDokumentAGIT_RN.AsString:=adr.Raion;
      dmMen.mtDokumentAGIT_PN.AsString:=adr.Punkt;
      dmMen.mtDokumentAGIT_UL.AsString:=adr.Ulica;
      dmMen.mtDokumentAGIT_DOM.AsString:=adr.NDom;
      dmMen.mtDokumentAGIT_KORP.AsString:=adr.Korp;
      dmMen.mtDokumentAGIT_KV.AsString:=adr.Kv;
      dmMen.mtDokument.Post;
    except
      lOk:=false;
      dmMen.mtDokument.Cancel;
      PutError('Ошибка записи адреса.');
    end;
    if lOk then begin
      s:='';
      if adr.Obl<>'' then s:=s+adr.Obl+' обл., ';
      if adr.Raion<>'' then s:=s+adr.Raion+' р-н, ';
      if adr.Punkt<>'' then s:=s+adr.Punkt+', ';
      if adr.Ulica<>'' then s:=s+adr.Ulica+', ';
      if adr.NDom<>'' then s:=s+sokrDom+' '+Trim(adr.NDom)+', ';
      if adr.Korp<>'' then s:=s+sokrKorp+' '+Trim(adr.Korp)+', ';
      if adr.Kv<>'' then s:=s+sokrKv+' '+Trim(adr.Kv)+', ';
//      if strTelefon<>'' then s:=s+'телефон '+strTelefon+', ';

      s:=Trim(Copy(s,1,Length(s)-2));

      dmMen.mtDokument.CheckBrowseMode;
      dmMen.mtDokument.Edit;
      dmMen.mtDokumentADRES_GIT.AsString:=s;
      dmMen.mtDokumentADD_ADRES_GIT.AsBoolean:=true;
      dmMen.mtDokument.Post;
    end;

    CheckControl;
  end;
end;

procedure TfmMen.edAdresGitEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  if dmMen.mtDokumentADRES_ID.AsInteger>0 then begin
    dmMen.mtDokument.CheckBrowseMode;
    dmMen.mtDokument.Edit;
    dmMen.mtDokumentADRES_GIT.AsString:='';
    dmMen.mtDokumentAGIT_OBL.AsString:='';
    dmMen.mtDokumentAGIT_RN.AsString:='';
    dmMen.mtDokumentAGIT_PN.AsString:='';
    dmMen.mtDokumentAGIT_UL.AsString:='';
    dmMen.mtDokumentAGIT_DOM.AsString:='';
    dmMen.mtDokumentAGIT_KORP.AsString:='';
    dmMen.mtDokumentAGIT_KV.AsString:='';

    dmMen.mtDokumentADD_ADRES_GIT.AsBoolean:=false;
    dmMen.mtDokumentADRES_GIT.AsString:=dmBase.AdresFromIDEx(fmMain.DateFiks , dmMen.mtDokumentADRES_ID.AsString, true, true);

    dmMen.mtDokument.Post;
  end;
end;

procedure TfmMen.pcChange(Sender: TObject);
begin
  if pc.ActivePageIndex=4
    then pcOcheredChange(Sender);
end;

procedure TfmMen.GridMigrGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (dmMen.tbMigrCONTANT.AsString='0') and (dmMen.tbMigrTIP.AsString=MIGR_UBIL) then begin
    AFont.Color:=ColorMenTempUbil;
  end else if (dmMen.tbMigrCONTANT.AsString='1') and (dmMen.tbMigrTIP.AsString=MIGR_UBIL) then begin
    AFont.Color:=ColorMenContantUbil;
  end else if (dmMen.tbMigrCONTANT.AsString='0') and (dmMen.tbMigrTIP.AsString=MIGR_PRIB) then begin
    AFont.Color:=ColorMenTempPrib;

//  end else begin
//    AFont.Color:=DefaultFontColor;
  end;
end;

procedure TfmMen.GridMigrColumns1GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  s:String;
begin
  if dmMen.mtDokumentPOL.AsString='Ж'
    then s:='убыла'
    else s:='убыл';
  if (dmMen.tbMigrCONTANT.AsString='0') and (dmMen.tbMigrTIP.AsString=MIGR_UBIL) then begin
    Params.Text:='временно '+s;
  end else if (dmMen.tbMigrCONTANT.AsString='1') and (dmMen.tbMigrTIP.AsString=MIGR_UBIL) then begin
    Params.Text:=s+' на постоянно'
//    if dmMen.mtDokumentDATES.IsNull
//      else Params.Text:='Умер';
  end else if (dmMen.tbMigrCONTANT.AsString='1') and (dmMen.tbMigrTIP.AsString=MIGR_PRIB) then begin
    Params.Text:='зарег. по месту жительства';
  end else if (dmMen.tbMigrCONTANT.AsString='0') and (dmMen.tbMigrTIP.AsString=MIGR_PRIB) then begin
    Params.Text:='зарег. по месту пребывания';
  end;
  Params.Alignment:=taLeftJustify;
end;

procedure TfmMen.BitBtn1Click(Sender: TObject);
begin
  if fmChoiceAdres= nil then fmChoiceAdres := TfmChoiceAdres.Create(nil);
  fmChoiceAdres.DateFiks := dmBase.GetDateCurrentSost;
  fmChoiceAdres.ChoiceLich := false;
  if fmChoiceAdres.ShowModal = mrOk then begin
    EditDataSet(dmMen.mtDokument);
    dmMen.mtDokumentNEW_ADRES_ID.AsInteger := fmChoiceAdres.IDAdres;
  end;
end;

procedure TfmMen.vchDBText2GetText(Sender: TObject; var Text: String);
begin
  Text:='';
  if dmMen.mtDokumentNEW_ADRES_ID.AsInteger>0 then begin
    TextAdres.Font.Color:=clBlack;
    Text := dmBase.AdresFromIDEx( Dokument.DateFiks, dmMen.mtDokumentNEW_ADRES_ID.AsString, true, true );
  end;
end;

procedure TfmMen.TBItemTalonPribClick(Sender: TObject);
begin
  TalonPribFromMen(dmMen,false);
end;

// выбор папы
procedure TfmMen.edPapaEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  lFilterTemp:Boolean;
  strFilter,strSeek,strConst:String;
  arrRec : TCurrentRecord;
  nID:Integer;
begin
  strConst:='POL='+QStr('М')+' and ID<>'+IntToStr(dmMen.mtDokumentID.AsInteger);
  if dmMen.LicID>0 then begin
    lFilterTemp:=true;
    strFilter:='LIC_ID='+IntToStr(dmMen.LicID)+' and '+strConst+'@'+strConst;
    strSeek:='';
  end else begin
    lFilterTemp:=true;
    strSeek:=Trim(edFam.Text);
    strFilter:=strConst+'@'+strConst;
  end;
  if ChoiceMen( nil, strSeek, strFilter, arrRec, lFilterTemp) then begin
    nID := GetValueFieldEx(arrRec, 'ID', 0);
    if nID>0 then begin
      edPapa.Text:=GetValueFieldEx(arrRec, 'FAMILIA','')+' '+GetValueFieldEx(arrRec, 'NAME','')+' '+
                   GetValueFieldEx(arrRec, 'OTCH','');
      EditDataSet(Dokument.mtDokument);
      Dokument.mtDokument.FieldByName('PA_ID').AsInteger:=nID;
      QueryExit:=true;
      Handled:=true;
    end;
  end;
end;

// выбор мамы
procedure TfmMen.edMamaEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  lFilterTemp:Boolean;
  strFilter,strSeek,strConst:String;
  arrRec : TCurrentRecord;
  nID:Integer;
begin
  strConst:='POL='+QStr('Ж')+' and ID<>'+IntToStr(dmMen.mtDokumentID.AsInteger);
  if dmMen.LicID>0 then begin
    lFilterTemp:=true;
    strFilter:='LIC_ID='+IntToStr(dmMen.LicID)+' and '+strConst+'@'+strConst;
    strSeek:='';
  end else begin
    lFilterTemp:=true;
    strSeek:=Trim(edFam.Text);
    strFilter:=strConst+'@'+strConst;
  end;
  if ChoiceMen( nil, strSeek, strFilter, arrRec, lFilterTemp) then begin
    nID := GetValueField(arrRec, 'ID');
    edMama.Text:=GetValueField(arrRec, 'FAMILIA')+' '+GetValueField(arrRec, 'NAME')+' '+
                 GetValueField(arrRec, 'OTCH');
    EditDataSet(Dokument.mtDokument);
    Dokument.mtDokument.FieldByName('MA_ID').AsInteger:=nID;
    QueryExit:=true;
    Handled:=true;
  end;
end;

procedure TfmMen.edPapaEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  i,nID,nCurID,nVozr : Integer;
  List : TStringList;
  s:String;
  l:Boolean;
begin
  List := TStringList.Create;
  dmMen.mtDokument.CheckBrowseMode;
  nCurID:=dmMen.mtDokumentID.AsInteger;
  l:=dbDisableControls(dmMen.mtDokument);
  s:=dmMen.mtDokument.Bookmark;
  dmMen.mtDokument.First;
  while not dmMen.mtDokument.Eof do begin
    nVozr:=dbGetCountYear(dmMen.mtDokumentDATER,dmBase.GetCurDate);
    if (nCurID<>dmMen.mtDokumentID.AsInteger) and (dmMen.mtDokumentID.AsInteger>0) and (dmMen.mtDokumentPOL.AsString='М')
       and (nVozr>12)
    then begin
      List.AddObject(dmMen.mtDokumentFAMILIA.AsString+' '+dmMen.mtDokumentNAME.AsString+' '+
               dmMen.mtDokumentOTCH.AsString, Pointer(dmMen.mtDokumentID.AsInteger));
    end;
    dmMen.mtDokument.Next;
  end;
  dmMen.mtDokument.Bookmark:=s;
  dbEnableControls(dmMen.mtDokument,l);

  i := ChoiceFromList(List,'Выберите отца',edPapa);
  if (i>-1)  then begin
    nID := Integer(List.Objects[i]);
    edPapa.Text:=List.Strings[i];
    EditDataSet(Dokument.mtDokument);
    Dokument.mtDokument.FieldByName('PA_ID').AsInteger:=nID;
    QueryExit:=true;
    Handled:=true;
  end;
  List.Free;
end;

procedure TfmMen.edMamaEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  i,nID,nCurID,nVozr : Integer;
  List : TStringList;
  s:String;
  l:Boolean;
begin
  List := TStringList.Create;
  dmMen.mtDokument.CheckBrowseMode;
  nCurID:=dmMen.mtDokumentID.AsInteger;
  l:=dbDisableControls(dmMen.mtDokument);
  s:=dmMen.mtDokument.Bookmark;
  dmMen.mtDokument.First;
  while not dmMen.mtDokument.Eof do begin
    nVozr:=dbGetCountYear(dmMen.mtDokumentDATER,dmBase.GetCurDate);
    if (nCurID<>dmMen.mtDokumentID.AsInteger) and (dmMen.mtDokumentID.AsInteger>0) and (dmMen.mtDokumentPOL.AsString='Ж')
       and (nVozr>12)
    then begin
      List.AddObject(dmMen.mtDokumentFAMILIA.AsString+' '+dmMen.mtDokumentNAME.AsString+' '+
               dmMen.mtDokumentOTCH.AsString, Pointer(dmMen.mtDokumentID.AsInteger));
    end;
    dmMen.mtDokument.Next;
  end;
  dmMen.mtDokument.Bookmark:=s;
  dbEnableControls(dmMen.mtDokument,l);

  i := ChoiceFromList(List,'Выберите мать',edMama);
  if (i>-1)  then begin
    nID := Integer(List.Objects[i]);
    edMama.Text:=List.Strings[i];
    EditDataSet(Dokument.mtDokument);
    Dokument.mtDokument.FieldByName('MA_ID').AsInteger:=nID;
    QueryExit:=true;
    Handled:=true;
  end;
  List.Free;
end;

procedure TfmMen.edPapaEditButtons2Click(Sender: TObject;  var Handled: Boolean);
begin
  edPapa.Text:='';
  EditDataSet(Dokument.mtDokument);
  Dokument.mtDokument.FieldByName('PA_ID').AsString:='';
  Handled:=true;
end;

procedure TfmMen.edMamaEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  edMama.Text:='';
  EditDataSet(Dokument.mtDokument);
  Dokument.mtDokument.FieldByName('MA_ID').AsString:='';
  Handled:=true;
end;

procedure TfmMen.edNameUpdateData(Sender: TObject; var Handled: Boolean);
var
  s:String;
begin
  s:=PolFromName(edName.Text);
  if s<>'' then dmMen.mtDokumentPOL.AsString:=s;
end;

procedure TfmMen.BitBtn2Click(Sender: TObject);
begin
  if Problem(' Очистить улучшение жилищных условий ? ',mtConfirmation,self) then begin
    EditDataSet(TdmMen(Dokument).mtDokument);
    TdmMen(Dokument).mtDokumentNEW_ADRES_ID.AsString:='';
    TdmMen(Dokument).mtDokumentNEW_KOLVO_KOMN.AsString:='';
    TdmMen(Dokument).mtDokumentNEW_PLOSH_ALL.AsString:='';
    TdmMen(Dokument).mtDokumentNEW_DATE.AsString:='';
    TdmMen(Dokument).mtDokumentNEW_DOGOVOR.AsString:='';
  end;
end;


procedure TfmMen.btClear_AdresGit_VibClick(Sender: TObject);
begin
  EditDataSet(TdmMen(Dokument).mtDokument);
  TdmMen(Dokument).mtDokumentADRES_ID_GIT.AsString:='';
end;

procedure TfmMen.vchDBText3GetText(Sender: TObject; var Text: String);
begin
  Text:='';
  if (dmMen.mtDokumentADRES_ID_GIT.AsInteger>0) then begin
    TextAdres.Font.Color:=clBlack;
    Text := dmBase.AdresFromIDEx( Dokument.DateFiks, dmMen.mtDokumentADRES_ID_GIT.AsString, true, true );
  end;
end;
//-----------------------------------------------------------------------
procedure TfmMen.edAktRogdOrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_NAME_ZAGS,Trim(edAktRogdOrgan.Text));
 if s<>'' then begin
   edAktRogdOrgan.Text:=s;
 end;
end;
//-----------------------------------------------------------------------
procedure TfmMen.edAktSmerOrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_NAME_ZAGS,Trim(edAktSmerOrgan.Text));
 if s<>'' then begin
   edAktSmerOrgan.Text:=s;
 end;
end;

procedure TfmMen.GridSostavGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
                                         State: TGridDrawState);
begin
  if dmMen.tbSostavSemMEMBER_ID.AsInteger=0
    then AFont.Style:=AFont.Style+[fsUnderline];
  if dmMen.tbSostavSemISKL.AsBoolean
    then Background:=clInfoBk;
end;

procedure TfmMen.GridReshColumns3GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  s,ss:String;
  ds:TDataSet;
begin
  s:='';
  case dmMen.tbOcheredResh.FieldByName('TIP').AsInteger of
   OCH_RESH_PERE,
   OCH_RESH_UNION,
   OCH_RESH_RAZD : begin
                     if dmMen.tbOcheredReshID2.AsString=dmMen.mtDokumentID.AsString
                       then Params.Text:=dmMen.GetFIO
                       else Params.Text:=dmBase.FIOMen(0,dmMen.tbOcheredReshID2.AsString,' ');
                     if s<>'' then Params.Text:=s+chr(13)+Params.Text;
                   end;
  else
    s:=GetNameOsnOch(dmMen.tbOcheredReshOSNOV.AsString,dmMen.tbOcheredReshOSNOV_TEXT.AsString,dmMen.tbOcheredResh.FieldByName('TIP').AsInteger,OCH_OSN_KRAT);
    ss:=GetNameOsnOch(dmMen.tbOcheredReshOSNOV2.AsString,dmMen.tbOcheredReshOSNOV_TEXT2.AsString,dmMen.tbOcheredResh.FieldByName('TIP').AsInteger,OCH_OSN_KRAT);
    if ss<>''
      then Params.Text:='1. '+s+chr(13)+'2. '+ss
      else Params.Text:=s;
  end;          
end;

procedure TfmMen.GridReshDblClick(Sender: TObject);
begin
  btEditClick(nil);
end;

procedure TfmMen.GridSostavDblClick(Sender: TObject);
begin
  btEditClick(nil);
end;

procedure TfmMen.GridReshGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dmMen.tbOcheredReshOTKAZ.AsBoolean or (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_SN) then begin
    AFont.Color:=clRed;
  end else if (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_RAZD) or (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_UNION) or
              (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_PERE) then begin
    AFont.Color:=clBlue;
  end;
  if dmMen.tbOcheredReshPLAN.AsBoolean  then begin
    Background:=clInfoBk;
  end;
end;

procedure TfmMen.dsOcheredReshDataChange(Sender: TObject; Field: TField);
begin
  if field<>nil then begin
    QueryExit := true;
  end;
end;

procedure TfmMen.GridSobstvColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  l:Boolean;
begin
  if Params.Text<>'' then begin
    if Params.Text=dmMen.mtDokumentID.AsString then begin
      Params.Text:=dmMen.GetFIO;
    end else begin
      l:=dbDisableControls(dmMen.tbSostavSem);
      if dmMen.tbSostavSem.Locate('MEMBER_ID', Params.Text, []) then begin
        Params.Text:=dmMen.tbSostavSemFAMILIA.AsString+' '+dmMen.tbSostavSemNAME.AsString+' '+dmMen.tbSostavSemOTCH.AsString;
      end;
      dbEnableControls(dmMen.tbSostavSem,l);
    end;
  end;
end;

procedure TfmMen.edNomerEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  n:Integer;
//  lOk,l1,l2:Boolean;
  cur:TCursor;
begin
//  lOk:=false;
  if dmMen.mtDokumentDEC_DATE.IsNull or dmMen.mtDokumentONLY.AsBoolean then exit;

  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
    n:=dmBase.GetRealNomerOchEx(dmMen.mtDokumentID_BASE.AsInteger, 0, dmMen.mtDokumentID.AsInteger,
           dmMen.mtDokumentDEC_DATE.AsDateTime, dmMen.mtDokumentDEC_TIME.AsDateTime,1,dmMen.mtDokumentOLD_NOMER.AsInteger);

    if n>0 then begin
      EditDataSet(edNomer.Field.DataSet);
      edNomer.Text:=IntToStr(n);
    end;
  finally
    Screen.Cursor:=cur;
  end;
end;

//-------------------------------------------------------------
procedure TfmMen.CheckOnlyOtdelno;
var
  s:String;
begin
  if dmMen.tbOcheredLgot.RecordCount>0 then begin
    s:=dmMen.tbOcheredLgot.BookMark;
    if dmMen.tbOcheredLgot.Locate('OCHERED_ID', OCHERED_SOCIAL, []) then begin
      cbOnly.Enabled:=true;
    end else begin
      cbOnly.Enabled:=false;
    end;
    dmMen.tbOcheredLgot.BookMark:=s;
  end else begin
    cbOnly.Enabled:=false;
  end;
  if (cbOnly.Enabled=false) and (dmMen.mtDokumentONLY.AsBoolean=true) then begin
    EditDataSet(dmMen.mtDokument);
    dmMen.mtDokumentONLY.AsBoolean:=false;
  end;
end;
//-------------------------------------------------------------
procedure TfmMen.CheckContFont(cb:TDBCheckBoxEh);
begin
  if cb.Checked  then begin
    if cb.Font.Color<>clRed then cb.Font.Color:=clRed;
  end else begin
    if cb.Font.Color<>clWindowText then cb.Font.Color:=clWindowText;
  end;
end;
//-------------------------------------------------------------
procedure TfmMen.CheckImageAndFont;
//var
//  lGsk,lUch:Boolean;
begin
//  lGsk:=(dmMen.mtDokumentGSK_ID.Asinteger>0) or (edGSK.Text<>'');
  CheckContFont(N_F_cbNewSem);
//  if N_F_cbNewSem.Checked  then begin
//    if N_F_cbNewSem.Font.Color<>clRed        then N_F_cbNewSem.Font.Color:=clRed;
//  end else begin
//    if N_F_cbNewSem.Font.Color<>clWindowText then N_F_cbNewSem.Font.Color:=clWindowText;
//  end;
  CheckContFont(N_F_cbSirota);
  if N_F_cbSirota.Checked  then begin
//    if N_F_cbSirota.Font.Color<>clRed        then N_F_cbSirota.Font.Color:=clRed;
    edDecDate.Color:=clWindow;
    edDecDate.ReadOnly:=false;
  end else begin
//    if N_F_cbSirota.Font.Color<>clWindowText then N_F_cbSirota.Font.Color:=clWindowText;
    edDecDate.Color:=clInfoBk;
    edDecDate.ReadOnly:=true;
  end;
  CheckContFont(N_F_cbMnogo4);
  CheckContFont(N_F_cbMnogoI);
end;
//-------------------------------------------------------------
procedure TfmMen.CheckDecDate;
var
  s:TBookmarkStr;
  l,lOk:Boolean;
begin
  lOk:=false;
  l:=dbDisableControls(dmMen.tbOcheredResh);
  s:=dmMen.tbOcheredResh.Bookmark;
  dmMen.tbOcheredResh.First;
  while not dmMen.tbOcheredResh.Eof do begin
    if (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_PERENOS) or
       ( (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_POST) and dmMen.tbOcheredReshRAZD.AsBoolean ) then begin
      lOk:=true;
    end;
    dmMen.tbOcheredResh.Next;
  end;
  dmMen.tbOcheredResh.Bookmark:=s;
  dbEnableControls(dmMen.tbOcheredResh,l);

  if N_F_cbSirota.Checked or lOk then begin
    edDecDate.Color:=clWindow;
    edDecDate.ReadOnly:=false;
  end else begin
    edDecDate.Color:=clInfoBk;
    edDecDate.ReadOnly:=true;
  end;
end;

procedure TfmMen.N_F_cbSirotaClick(Sender: TObject);
begin
  CheckImageAndFont;
  CheckDecDate;
end;

procedure TfmMen.N_F_cbNewSemClick(Sender: TObject);
begin
  CheckImageAndFont;
end;

procedure TfmMen.TextAdresClick(Sender: TObject);
begin
//  dmmen.mtDokumentA.Active:=true;
//  dmmen.mtDokumentA.First;
//  showmessage(inttostr(dmmen.mtDokumentA.RecordCount));
end;

procedure TfmMen.cbOnlyClick(Sender: TObject);
begin
//
end;

procedure TfmMen.GridReshColumns0GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if GridResh.DataSource.DataSet.FieldByName('RAZD').AsBoolean
    then Params.Text:=Params.Text+#13+'(при разделении)';
end;

procedure TfmMen.ENG_edLichNomerEditButtons0Click(Sender: TObject;  var Handled: Boolean);
{$IFDEF GISUN}
var
  sField:String;
  nTypeDate:Integer;
  sl:TStringList;
  cur:TCursor;
  ds:TDataSet;
  f:TfmChoiceMenGISUN;
  p : TPassport;
{$ENDIF}
begin
{$IFDEF GISUN}
  if not IsActiveGISUN then exit;
  if (dmMen.mtDokumentFAMILIA.AsString='') or (dmMen.mtDokumentNAME.AsString='') or (dmMen.mtDokumentOTCH.AsString='') or dmMen.mtDokumentDATER.IsNull then begin
    PutError('Заполните Фамилию, Имя, Отчество, дату рождения.',self);
    exit;
  end;
  if ENG_edLichNomer.Text<>'' then begin
    PutError('Очистите идентификационный номер.',self);
    exit;
  end;
  nTypeDate:=DATE_FULL;
  sl:=TStringList.Create;
  sField:=ENG_edLichNomer.DataField;
  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  Gisun.CurAkt:=nil; //Self;   ???  как используется ???
  try
    if Gisun.LoadPersonalIdentif(sl,dmMen.mtDokumentFAMILIA.AsString,dmMen.mtDokumentNAME.AsString,dmMen.mtDokumentOTCH.AsString,
                                 dmMen.mtDokumentDATER.AsDateTime, nTypeDate) then begin
      Screen.Cursor:=cur;
      if sl.Count=0 then begin
        ShowMessageCont('Данные по лицу не найдены.',self);
      end else if sl.Count=1 then begin
        ENG_edLichNomer.Text:=sl.Strings[0];
      end else if sl.Count>1 then begin
        if Problem('Количество найденных людей: '+IntToStr(sl.Count)+'. Загрузить данные ? ',mtConfirmation,Self) then begin
          Screen.Cursor:=crHourGlass;
          try
            ds:=Gisun.LoadIdentifData(sl,nil,nil);
          finally
            Screen.Cursor:=cur;
          end;
          if ds<>nil then begin
            while not ds.Eof do begin
              ds.Edit;
              ds.FieldByName('ADRES_G').AsString:=dmBase.GetAdresAkt3(ds, '<UPPER>GOSUD_G,FName;OBL_G;RAION_G,RNGOROD_G;GOROD_G,TYPE_GOROG_G;ULICA_G,*_G',1,false);
              ds.FieldByName('ADRES_R').AsString:=dmBase.GetAdresAkt3(ds, '<UPPER>GOSUD_R,FName;OBL_R;RAION_R;GOROD_R,TYPE_GOROD_R',1,true);
              p:=dmBase.GetPasportAkt('','DOC=DOKUMENT;TYPE=DOK_TYPE;SERIA=DOK_SERIA;NOMER=DOK_NOMER;DATE=DOK_DATE',0,ds);
              ds.FieldByName('DOC_NAME').AsString:=ANSIUpperCase(dmBase.PasportToText(p,0));
              ds.Post;
              ds.Next;
            end;
            ds.First;
            f:=TfmChoiceMenGISUN.Create(nil);
            f.DataSource.DataSet:=ds;
            if f.ShowModal=mrOk then begin
              ENG_edLichNomer.Text:=ds.FieldByName('IDENTIF').AsString;
            end;
            f.Free;
            ds.Free;
          end;
        end;
      end;
    end;
  finally
    Screen.Cursor:=cur;
    sl.Free;
    Gisun.CurAkt:=nil;
  end;
{$ENDIF}
end;

function TfmMen.BeforeReport: Boolean;
begin
  Result:=true;
  dmMen.mtDokument.CheckBrowseMode;
end;

procedure TfmMen.lbDateSostGetText(Sender: TObject; var Text: String);
begin
  if dmMen.mtDokumentDATE_FIKS.AsDateTime>0
    then Text:=' на '+FormatDateTime('dd.mm.yyyy', dmMen.mtDokumentDATE_FIKS.AsDateTime)
    else Text:='';
end;

procedure TfmMen.edSostSemEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  lFilterTemp:Boolean;
  s,strFilter,strSeek,strConst:String;
  arrRec : TCurrentRecord;
  nID:Integer;
begin
  nID:=dmMen.mtDokumentID.AsInteger;
//  if dmMen.EditFromLichSchet then begin
{
    with fmMain.dmLichSchet do begin
      dmMens.mtDokument.First;
      while not dmMens.mtDokument.Eof do begin
        if (dmMens.mtDokumentID.AsInteger>0) and
           (dLich.mtDokumentFIRST.AsInteger<>dLich.dmMens.mtDokumentID_INTERNAL.AsInteger) then begin
      List.AddObject(dLich.dmMens.GetFIO, Pointer(dLich.dmMens.mtDokumentID_INTERNAL.AsInteger));
    end;
    dLich.dmMens.mtDokument.Next;
  end;

    ShowMessage('EditFromLichSchet');
  end else begin
  }
  strConst:='ID<>'+IntToStr(nID);
  if dmMen.LicID>0 then begin
    lFilterTemp:=true;
    strFilter:='LIC_ID='+IntToStr(dmMen.LicID)+' and '+strConst+'@'+strConst;
    strSeek:='';
  end else begin
    lFilterTemp:=true;
    strSeek:=Trim(edFam.Text);
    strFilter:=strConst+'@'+strConst;
  end;
  if ChoiceMen( nil, strSeek, strFilter, arrRec, lFilterTemp) then begin
    nID:=GetValueFieldEx(arrRec, 'ID', 0);
    if nID>0 then begin
      if edSostSem.Text='' then s:='' else s:=', ';
      edSostSem.Text:=Trim(edSostSem.Text+s+GetValueFieldEx(arrRec, 'FAMILIA','')+' '+GetValueFieldEx(arrRec, 'NAME','')+' '+
                                         GetValueFieldEx(arrRec, 'OTCH','')+' '+DatePropis(GetValueFieldEx(arrRec, 'DATER',0),3));
      Handled:=true;
    end;
  end;
end;
//--------------------------------------
procedure TfmMen.CheckContSuprug;
begin
  if  dmMen.mtDokumentSUPRUG_ID.AsString='' then begin
    if edSuprug.ReadOnly then begin
      edSuprug.Font.Style:=[];
      edSuprugDateR.Font.Style:=[];
      edSuprug.ReadOnly:=false;
      edSuprugDateR.ReadOnly:=false;
    end;
  end else begin
    if not edSuprug.ReadOnly then begin
      edSuprug.Font.Style:=[fsBold];
      edSuprugDateR.Font.Style:=[fsBold];
      edSuprug.ReadOnly:=true;
      edSuprugDateR.ReadOnly:=true;
    end;
  end;
end;

// выбор супруга  (супруги)
procedure TfmMen.edSuprugEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  lFilterTemp:Boolean;
  strFilter,strSeek,strConst,sPol:String;
  arrRec : TCurrentRecord;
  nID:Integer;
begin
  if dmMen.mtDokumentPOL.AsString='М' then sPol:='Ж' else sPol:='М';
  strConst:='POL='+QStr(sPol)+' and ID<>'+IntToStr(dmMen.mtDokumentID.AsInteger);
  if dmMen.LicID>0 then begin
    lFilterTemp:=true;
    strFilter:='LIC_ID='+IntToStr(dmMen.LicID)+' and '+strConst+'@'+strConst;
    strSeek:='';
  end else begin
    lFilterTemp:=true;
    strSeek:=Trim(edFam.Text);
    strFilter:=strConst+'@'+strConst;
  end;
  if ChoiceMen( nil, strSeek, strFilter, arrRec, lFilterTemp) then begin
    nID := GetValueField(arrRec, 'ID');
//    edSuprug.Text:=GetValueField(arrRec, 'FAMILIA')+' '+GetValueField(arrRec, 'NAME')+' '+GetValueField(arrRec, 'OTCH');
    EditDataSet(Dokument.mtDokument);
    dmMen.mtDokumentSuprug_ID.AsInteger:=nID;
    dmMen.mtDokumentSuprug.AsString:=GetValueFieldEx(arrRec, 'FIO', '');
    WriteDateFieldV(dmMen.mtDokumentSuprug_DateR, GetValueFieldEx(arrRec, 'DATER', null));
    QueryExit:=true;
    Handled:=true;
    CheckContSuprug;
  end;
end;

procedure TfmMen.edSuprugEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  i,nID,nCurID,nVozr : Integer;
  List : TStringList;
  s,sPol:String;
  l:Boolean;
  slDate:TStringList;
begin
  List:=TStringList.Create;
  slDate:=TStringList.Create;
  dmMen.mtDokument.CheckBrowseMode;
  nCurID:=dmMen.mtDokumentID.AsInteger;
  if dmMen.mtDokumentPOL.AsString='М' then sPol:='Ж' else sPol:='М';
  l:=dbDisableControls(dmMen.mtDokument);
  s:=dmMen.mtDokument.Bookmark;
  dmMen.mtDokument.First;
  while not dmMen.mtDokument.Eof do begin
    nVozr:=dbGetCountYear(dmMen.mtDokumentDATER,dmBase.GetCurDate);
    if (nCurID<>dmMen.mtDokumentID.AsInteger) and (dmMen.mtDokumentID.AsInteger>0) and (dmMen.mtDokumentPOL.AsString=sPol)
       and (nVozr>12)
    then begin
      List.AddObject(dmMen.mtDokumentFAMILIA.AsString+' '+dmMen.mtDokumentNAME.AsString+' '+
               dmMen.mtDokumentOTCH.AsString, Pointer(dmMen.mtDokumentID.AsInteger));
      slDate.Add(DTOSDef(dmMen.mtDokumentDATER.AsDateTime,tdClipper,''));
    end;
    dmMen.mtDokument.Next;
  end;
  dmMen.mtDokument.Bookmark:=s;
  dbEnableControls(dmMen.mtDokument,l);
  i:=ChoiceFromList(List,'Выберите супругу',edSuprug);
  if (i>-1)  then begin
    nID := Integer(List.Objects[i]);
    EditDataSet(Dokument.mtDokument);
    dmMen.mtDokumentSuprug_ID.AsInteger:=nID;
    dmMen.mtDokumentSuprug.AsString:=List.Strings[i];
    if slDate.Strings[i]<>''
      then dmMen.mtDokumentSuprug_DateR.AsDateTime:=STOD(slDate.Strings[i],tdClipper) else dmMen.mtDokumentSuprug_DateR.AsString:='';
    QueryExit:=true;
    Handled:=true;
    CheckContSuprug;
  end;
  List.Free;
  slDate.Free;
end;


procedure TfmMen.edSuprugEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  EditDataSet(Dokument.mtDokument);
  Dokument.mtDokument.FieldByName('Suprug_ID').AsString:='';
  Dokument.mtDokument.FieldByName('Suprug_DateR').AsString:='';
  Dokument.mtDokument.FieldByName('Suprug').AsString:='';
  Handled:=true;
  CheckContSuprug;
end;

procedure TfmMen.btDelSvClick(Sender: TObject);
begin
  if (dmMen.tbSverki.RecordCount>0) and Problem('Удалить сверку ?',mtConfirmation,self) then begin
    dmMen.tbSverki.Delete;
    QueryExit := true;
  end;
end;

procedure TfmMen.btAddSvClick(Sender: TObject);
begin
  dmMen.tbSverki.Append;
  QueryExit := true;
  ActiveControl:=GridSverki;
  GridSverki.SelectedField:=dmMen.tbSverkiDATE_SV;
end;

procedure TfmMen.dsSverkiDataChange(Sender: TObject; Field: TField);
begin
  if field<>nil then begin
    QueryExit := true;
  end;
end;

procedure TfmMen.GridSverkiColumns2EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  EditDataSet(dmMen.tbSverki);
  dmMen.tbSverkiFIO.AsString:=GlobalTask.ParamAsString('FIO_VUS');
end;

end.
