unit fDeclBrak;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uTypes, uDataSet2XML, mPermit,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, DateUtils, fEditMemo, uProjectAll,
  ExtCtrls, OpisEdit, dbFunc, MetaTask, DBLookupEh, DBCtrlsEh, StdCtrls,
  {$IFDEF GISUN}  uGisun, mRegInt, {$ENDIF}
  Mask, Grids, DBGridEh, FuncPr, FR_DSet, FR_DBSet, TB2ExtItems, uPadegFIO,
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  {$IFDEF VER150} Variants, {$ENDIF}
  ImgList, DBCtrls, Buttons, vchDBCtrls, kbmMemCSVStreamFormat, ZipForge;
type
  TfmDeclBrak = class(TfmSimpleD)
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentON_Familia: TStringField;
    DokumentON_Otch: TStringField;
    DokumentON_Name: TStringField;
    DokumentON_DateR: TDateField;
    DokumentON_GOSUD: TIntegerField;
    DokumentON_OBL: TStringField;
    DokumentON_RAION: TStringField;
    DokumentON_GOROD: TStringField;
    DokumentON_WORK: TStringField;
    DokumentON_OBRAZ: TIntegerField;
    DokumentON_M_GOSUD: TIntegerField;
    DokumentON_M_OBL: TStringField;
    DokumentON_M_RAION: TStringField;
    DokumentON_M_GOROD: TStringField;
    DokumentON_M_GOROD_R: TStringField;
    DokumentON_SEM: TIntegerField;
    DokumentON_DOKUMENT: TStringField;
    DokumentON_SVID: TStringField;
    DokumentOTMETKA: TMemoField;
    DokumentONA_Familia: TStringField;
    DokumentONA_Otch: TStringField;
    DokumentONA_Name: TStringField;
    DokumentONA_DateR: TDateField;
    DokumentONA_GOSUD: TIntegerField;
    DokumentONA_OBL: TStringField;
    DokumentONA_RAION: TStringField;
    DokumentONA_GOROD: TStringField;
    DokumentONA_WORK: TStringField;
    DokumentONA_OBRAZ: TIntegerField;
    DokumentONA_M_GOSUD: TIntegerField;
    DokumentONA_M_OBL: TStringField;
    DokumentONA_M_RAION: TStringField;
    DokumentONA_M_GOROD: TStringField;
    DokumentONA_M_GOROD_R: TStringField;
    DokumentONA_SEM: TIntegerField;
    DokumentONA_DOKUMENT: TStringField;
    DokumentONA_SVID: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentDETI: TMemoField;
    TBItemChoiceMen: TTBItem;
    DokumentON_FamiliaP: TStringField;
    DokumentONA_FamiliaP: TStringField;
    pc: TPageControl;
    Label22: TLabel;
    tsTail2: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    pnMain: TPanel;
    Label27: TLabel;
    edNomer: TDBEditEh;
    Label28: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label31: TLabel;
    edON_DOKUMENT: TDBEditEh;
    edONA_DOKUMENT: TDBEditEh;
    edON_SEM: TDBComboBoxEh;
    edONA_SEM: TDBComboBoxEh;
    dsDeti: TDataSource;
    tbDeti: TkbmMemTable;
    tbDetiFAMILIA: TStringField;
    tbDetiNAME: TStringField;
    tbDetiOTCH: TStringField;
    tbDetiGOD_ROG: TIntegerField;
    DokumentON_B_RESP: TBooleanField;
    DokumentON_B_OBL: TBooleanField;
    DokumentON_M_B_RESP: TBooleanField;
    DokumentON_M_B_OBL: TBooleanField;
    DokumentONA_B_RESP: TBooleanField;
    DokumentONA_B_OBL: TBooleanField;
    DokumentONA_M_B_RESP: TBooleanField;
    DokumentONA_M_B_OBL: TBooleanField;
    dsNation: TDataSource;
    dsStran: TDataSource;
    DokumentON_ID: TIntegerField;
    DokumentONA_ID: TIntegerField;
    DokumentSVID_SERIA: TStringField;
    DokumentDATESV: TDateField;
    DokumentON_Familia_B: TStringField;
    DokumentON_FamiliaP_B: TStringField;
    DokumentON_Name_B: TStringField;
    DokumentON_Otch_B: TStringField;
    DokumentON_OBL_B: TStringField;
    DokumentON_RAION_B: TStringField;
    DokumentON_GOROD_B: TStringField;
    DokumentONA_Familia_B: TStringField;
    DokumentONA_FamiliaP_B: TStringField;
    DokumentONA_Name_B: TStringField;
    DokumentONA_Otch_B: TStringField;
    DokumentONA_OBL_B: TStringField;
    DokumentONA_RAION_B: TStringField;
    DokumentONA_GOROD_B: TStringField;
    DokumentOSNOV: TBooleanField;
    DokumentSUD_NAME: TMemoField;
    DokumentSUD_DATE: TDateField;
    DokumentSUD_BRAK: TMemoField;
    DokumentVOSSTAN: TBooleanField;
    DokumentID_ZAGS: TIntegerField;
    DokumentDATEB: TDateField;
    dsGragd: TDataSource;
    DokumentON_ONLYGOD: TBooleanField;
    DokumentONA_ONLYGOD: TBooleanField;
    DokumentCOPIA: TBooleanField;
    TBItemArxSpr: TTBItem;
    DokumentON_GODPR: TSmallintField;
    DokumentONA_GODPR: TSmallintField;
    DokumentON_VOZR: TSmallintField;
    DokumentONA_VOZR: TSmallintField;
    TBItemVozrast: TTBItem;
    DokumentON_M_RNGOROD: TStringField;
    DokumentONA_M_RNGOROD: TStringField;
    DokumentON_M_B_RN: TBooleanField;
    DokumentONA_M_B_RN: TBooleanField;
    Label36: TLabel;
    edDateBrak: TDBDateTimeEditEh;
    Label7: TLabel;
    DokumentONA_DOK_TYPE: TSmallintField;
    DokumentONA_DOK_SERIA: TStringField;
    DokumentONA_DOK_NOMER: TStringField;
    DokumentONA_DOK_DATE: TDateField;
    DokumentON_DOK_TYPE: TSmallintField;
    DokumentON_DOK_SERIA: TStringField;
    DokumentON_DOK_NOMER: TStringField;
    DokumentON_DOK_DATE: TDateField;
    DokumentON_INOMER: TStringField;
    DokumentONA_INOMER: TStringField;
    DokumentROD_M_OBL: TStringField;
    DokumentROD_M_RAION: TStringField;
    DokumentROD_M_GOROD: TStringField;
    DokumentROD_M_GOROD_R: TStringField;
    DokumentROD_DOK_TYPE: TSmallintField;
    DokumentROD_DOK_SERIA: TStringField;
    DokumentROD_DOK_NOMER: TStringField;
    DokumentROD_DOK_DATE: TDateField;
    DokumentROD_DOK_ORGAN: TMemoField;
    DokumentON_NATION_DOK: TMemoField;
    DokumentONA_NATION_DOK: TMemoField;
    edON_VUS: TDBComboBoxEh;
    edONA_VUS: TDBComboBoxEh;
    DokumentON_VUS: TBooleanField;
    DokumentONA_VUS: TBooleanField;
    DokumentON_VUS_KOMISS: TMemoField;
    DokumentONA_VUS_KOMISS: TMemoField;
    edON_VUS_KOMISS: TDBEditEh;
    edONA_VUS_KOMISS: TDBEditEh;
    edON_DOK_SERIA: TDBEditEh;
    edON_DOK_NOMER: TDBEditEh;
    edON_DOK_DATE: TDBDateTimeEditEh;
    edONA_DOK_DATE: TDBDateTimeEditEh;
    edONA_DOK_SERIA: TDBEditEh;
    edONA_DOK_NOMER: TDBEditEh;
    Label29: TLabel;
    Label32: TLabel;
    edON_DOK_TYPE: TDBComboBoxEh;
    edONA_DOK_TYPE: TDBComboBoxEh;
    edON_SEM_DOK: TDBEditEh;
    edONA_SEM_DOK: TDBEditEh;
    Label35: TLabel;
    DokumentON_SEM_DOK: TMemoField;
    DokumentONA_SEM_DOK: TMemoField;
    N_F_cbTorgest: TDBCheckBoxEh;
    N_F_Bel: TDBCheckBoxEh;
    DokumentBELORUS: TBooleanField;
    DokumentTIMEB: TTimeField;
    edTimeR: TDBDateTimeEditEh;
    DokumentROD_FIO: TStringField;
    DokumentON_TELEFON: TStringField;
    DokumentONA_TELEFON: TStringField;
    Label44: TLabel;
    edON_SVID: TDBEditEh;
    edONA_SVID: TDBEditEh;
    DokumentON_B_GOROD: TSmallintField;
    DokumentONA_B_GOROD: TSmallintField;
    DokumentON_M_B_GOROD: TSmallintField;
    DokumentONA_M_B_GOROD: TSmallintField;
    DokumentON_IDENTIF: TStringField;
    DokumentONA_IDENTIF: TStringField;
    Label47: TLabel;
    DokumentVOENKOM: TIntegerField;
    DokumentON_M_DOM: TStringField;
    DokumentON_M_KORP: TStringField;
    DokumentON_M_KV: TStringField;
    DokumentONA_M_DOM: TStringField;
    DokumentONA_M_KORP: TStringField;
    DokumentONA_M_KV: TStringField;
    Label48: TLabel;
    edON_DOK_OTM: TDBEditEh;
    edONA_DOK_OTM: TDBEditEh;
    DokumentON_DOK_OTM: TMemoField;
    DokumentONA_DOK_OTM: TMemoField;
    ENG_edON_IDENTIF: TDBEditEh;
    ENG_edONA_IDENTIF: TDBEditEh;
    N_F_ZA_PREDEL: TDBCheckBoxEh;
    DokumentZA_PREDEL: TBooleanField;
    DokumentNAME_MESTOREG: TMemoField;
    pnDeti: TPanel;
    gbDeti: TGroupBox;
    GridDeti: TDBGridEh;
    Panel2: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    DokumentSUM_POSHLINA: TFloatField;
    DokumentPOSHLINA: TStringField;
    Label34: TLabel;
    edSumPoshlina: TDBNumberEditEh;
    edPoshlina: TDBEditEh;
    DokumentBRAK_ID: TIntegerField;
    DokumentON_VOENKOM: TIntegerField;
    DokumentONA_VOENKOM: TIntegerField;
    edON_Voenkom: TDBLookupComboboxEh;
    edONA_VOENKOM: TDBLookupComboboxEh;
    DokumentARX_ADRESAT: TMemoField;
    DokumentMESTO: TIntegerField;
    DokumentTARIF: TFloatField;
    gbMesto: TGroupBox;
    edNameMestoReg: TDBEditEh;
    edMestoRegistr: TDBLookupComboboxEh;
    edTarif: TDBNumberEditEh;
    Label80: TLabel;
    dsMesto: TDataSource;
    DokumentON_GRAG_ADD: TMemoField;
    DokumentONA_GRAG_ADD: TMemoField;
    DokumentON_GRAG: TIntegerField;
    DokumentON_NATION: TIntegerField;
    DokumentONA_GRAG: TIntegerField;
    DokumentONA_NATION: TIntegerField;
    DokumentDOLG_RUKOV: TStringField;
    DokumentRUKOV: TStringField;
    lbRukov: TvchDBText;
    edRukov: TDBEditEh;
    DokumentOTMETKA_ISP: TMemoField;
    DokumentPRIM: TMemoField;
    N_F_cbOtkaz: TDBCheckBoxEh;
    DokumentOTKAZ: TBooleanField;
    tsTail1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbDateR_Rodit: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
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
    Label23: TLabel;
    Label45: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label4: TLabel;
    Label33: TLabel;
    edON_Familia: TDBEditEh;
    edONA_Familia: TDBEditEh;
    edON_Name: TDBEditEh;
    edON_OTCH: TDBEditEh;
    edONA_Name: TDBEditEh;
    edONA_OTCH: TDBEditEh;
    edON_DATER: TDBDateTimeEditEh;
    edONA_DATER: TDBDateTimeEditEh;
    edON_GOSUD: TDBLookupComboboxEh;
    edONA_GOSUD: TDBLookupComboboxEh;
    edON_GOROD: TDBEditEh;
    edONA_GOROD: TDBEditEh;
    edON_NATION: TDBLookupComboboxEh;
    edON_M_GOSUD: TDBLookupComboboxEh;
    edON_M_GOROD: TDBEditEh;
    edON_GRAG: TDBLookupComboboxEh;
    edON_WORK: TDBEditEh;
    edON_OBRAZ: TDBComboBoxEh;
    edON_M_GOROD_R: TDBEditEh;
    edONA_NATION: TDBLookupComboboxEh;
    edONA_M_GOSUD: TDBLookupComboboxEh;
    edONA_M_GOROD: TDBEditEh;
    edONA_GRAG: TDBLookupComboboxEh;
    edONA_WORK: TDBEditEh;
    edONA_OBRAZ: TDBComboBoxEh;
    edONA_M_GOROD_R: TDBEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    DBCheckBoxEh2: TDBCheckBoxEh;
    DBCheckBoxEh4: TDBCheckBoxEh;
    DBCheckBoxEh5: TDBCheckBoxEh;
    DBCheckBoxEh7: TDBCheckBoxEh;
    DBCheckBoxEh8: TDBCheckBoxEh;
    DBCheckBoxEh10: TDBCheckBoxEh;
    DBCheckBoxEh11: TDBCheckBoxEh;
    cbOnlyGodON: TDBCheckBoxEh;
    cbOnlyGodONA: TDBCheckBoxEh;
    edON_GODPR: TDBNumberEditEh;
    edONA_GODPR: TDBNumberEditEh;
    edON_VOZR: TDBNumberEditEh;
    edONA_VOZR: TDBNumberEditEh;
    edON_M_RNGOROD: TDBLookupComboboxEh;
    edONA_M_RNGOROD: TDBLookupComboboxEh;
    edON_NATION_DOK: TDBEditEh;
    edONA_NATION_DOK: TDBEditEh;
    edON_TELEFON: TDBEditEh;
    edONA_TELEFON: TDBEditEh;
    edON_B_GOROD: TDBLookupComboboxEh;
    edONA_B_GOROD: TDBLookupComboboxEh;
    edON_M_B_GOROD: TDBLookupComboboxEh;
    edONA_M_B_GOROD: TDBLookupComboboxEh;
    N_F_cbBelorus: TDBCheckBoxEh;
    edON_M_DOM: TDBEditEh;
    edON_M_KORP: TDBEditEh;
    edON_M_KV: TDBEditEh;
    edONA_M_DOM: TDBEditEh;
    edONA_M_KORP: TDBEditEh;
    edONA_M_KV: TDBEditEh;
    edON_OBL_R: TDBEditEh;
    edON_RAION_R: TDBEditEh;
    edONA_OBL_R: TDBEditEh;
    edONA_RAION_R: TDBEditEh;
    edON_M_OBL: TDBEditEh;
    edON_M_RAION: TDBEditEh;
    edONA_M_OBL: TDBEditEh;
    edONA_M_RAION: TDBEditEh;
    edON_FamiliaP: TDBEditEh;
    BLR_edON_FamiliaP: TDBEditEh;
    BLR_edON_Familia: TDBEditEh;
    BLR_edON_Name: TDBEditEh;
    BLR_edON_Otch: TDBEditEh;
    edONA_FamiliaP: TDBEditEh;
    BLR_edONA_Familia: TDBEditEh;
    BLR_edONA_FamiliaP: TDBEditEh;
    BLR_edONA_Name: TDBEditEh;
    BLR_edONA_Otch: TDBEditEh;
    BLR_edON_GOSUD: TDBLookupComboboxEh;
    BLR_edON_OBL: TDBEditEh;
    BLR_edON_RAION: TDBEditEh;
    BLR_edON_Gorod: TDBEditEh;
    BLR_edONA_Gosud: TDBLookupComboboxEh;
    BLR_edONA_OBL: TDBEditEh;
    BLR_edONA_RAION: TDBEditEh;
    BLR_edONA_Gorod: TDBEditEh;
    tsReshSud: TTabSheet;
    DokumentON_REG_DATE: TDateField;
    DokumentON_REG_DATE_TILL: TDateField;
    DokumentONA_REG_DATE: TDateField;
    DokumentONA_REG_DATE_TILL: TDateField;
    lbON_REG_DATE_TILL: TvchDBText;
    lbONA_REG_DATE_TILL: TvchDBText;
    GridRS: TDBGridEh;
    dsReshSud: TDataSource;
    mDebug: TMemo;
    N_F_lbON_SEM: TvchDBText;
    N_F_lbONA_SEM: TvchDBText;
    tbZapros: TkbmMemTable;
    tbZaprosFLD_ORG: TStringField;
    tbZaprosFLD_TEXT: TStringField;
    tsAdd: TTabSheet;
    GroupBox1: TGroupBox;
    GridZapros: TDBGridEh;
    dsZapros: TDataSource;
    Panel1: TPanel;
    btAddZapros: TBitBtn;
    btDelZapros: TBitBtn;
    tbZaprosFLD_DATEZ: TStringField;
    tbZaprosFLD_DATEO: TStringField;
    lbOtmIsp: TLabel;
    edOtmIsp: TDBEditEh;
    Label30: TLabel;
    edPrim: TDBEditEh;
    DokumentONA_ATEID: TIntegerField;
    DokumentON_ATEID: TIntegerField;
    procedure FormResize(Sender: TObject);
    procedure edON_FamiliaEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edONA_FamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edON_FamiliaEnter(Sender: TObject);
    procedure edON_FamiliaPEnter(Sender: TObject);
    procedure edON_OTCHEnter(Sender: TObject);
    procedure edON_NameEnter(Sender: TObject);
    procedure edONA_FamiliaEnter(Sender: TObject);
    procedure edONA_FamiliaPEnter(Sender: TObject);
    procedure edONA_NameEnter(Sender: TObject);
    procedure edONA_OTCHEnter(Sender: TObject);
    procedure edON_FamiliaCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edRukovEnter(Sender: TObject);
    procedure cbOnlyGodONClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edTypeSprChange(Sender: TObject);
    procedure TBItemArxSprClick(Sender: TObject);
    procedure TBItemVozrastClick(Sender: TObject);
    procedure edON_OBL_RNotInList(Sender: TObject; NewText: String;        var RecheckInList: Boolean);
    procedure edON_RAION_RNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure edON_M_RNGORODNotInList(Sender: TObject; NewText: String;    var RecheckInList: Boolean);
    procedure pcChange(Sender: TObject);
    procedure edON_DATERUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edONA_DATERUpdateData(Sender: TObject; var Handled: Boolean);
    procedure ENG_edON_IDENTIFUpdateData(Sender: TObject;       var Handled: Boolean);
    procedure ENG_edONA_IDENTIFUpdateData(Sender: TObject;      var Handled: Boolean);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure TBItemGetDataGISUNClick(Sender: TObject);
    procedure edON_VoenkomChange(Sender: TObject);
    procedure edON_VoenkomEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edON_VoenkomEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure edON_VoenkomEditButtons2Click(Sender: TObject;      var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons2Click(Sender: TObject;      var Handled: Boolean);
    procedure edONA_VOENKOMChange(Sender: TObject);
    procedure edMestoRegistrEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure edON_GRAGEditButtons0Click(Sender: TObject;          var Handled: Boolean);
    procedure edONA_GRAGEditButtons0Click(Sender: TObject;        var Handled: Boolean);
    procedure edDateZUpdateData(Sender: TObject; var Handled: Boolean);
    procedure lbONA_REG_DATE_TILLGetText(Sender: TObject;   var Text: String);
    procedure lbON_REG_DATE_TILLGetText(Sender: TObject; var Text: String);
    procedure GridRSGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure N_F_lbON_SEMGetText(Sender: TObject; var Text: String);
    procedure N_F_lbONA_SEMGetText(Sender: TObject; var Text: String);
    procedure btAddZaprosClick(Sender: TObject);
    procedure btDelZaprosClick(Sender: TObject);
    procedure dsDetiDataChange(Sender: TObject; Field: TField);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    { Public declarations }
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
    procedure CheckOnlyGod;
    procedure CheckOnlyVozrast(lClear : Boolean);
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure CheckRnGorod;
    procedure WriteSOATO(nType:Integer);
    function BeforeEdit : Boolean; override;
    function  BeforeReport : Boolean; override;
    procedure DeclBrakAddObrab(data: TPersonalData_; dsOutPut:TDataSet; dsDokument:TDataSet; slPar:TStringList);
    function CreateSubmenuRun:Boolean; override;

//    function GetNameReport : String; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

function EditDeclBrak( nID : Integer; slPar:TStringList=nil) : Boolean;

var
  fmDeclBrak: TfmDeclBrak;

implementation

uses dBase, fMain, fChoiceNasel, uProject, uCheckKod, fGetGISUN2, fShablon, fEnterAdresat;

{$R *.DFM}
{$I Task.inc}

{ TfmDeclBrak }

function EditDeclBrak( nID : Integer; slPar:TStringList) : Boolean;
begin
  Result := false;
  fmDeclBrak := TfmDeclBrak.Create(nil);
  if slPar<>nil
    then fmDeclBrak.AssignPar(slPar);
  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
    fmDeclBrak.cbOnlyGodON.Visible:=true;
    fmDeclBrak.cbOnlyGodONA.Visible:=true;
  end else begin
    fmDeclBrak.cbOnlyGodON.Visible:=false;
    fmDeclBrak.cbOnlyGodONA.Visible:=false;
  end;
  try
    fmDeclBrak.IsReadDokument:=true;
    if nID=-1 then begin
      fmDeclBrak.NewDok(true);
      fmDeclBrak.SetIDZags;
      fmDeclBrak.TBItemZAGS.Visible:=false;
      fmDeclBrak.CheckEnabledNameOrgan(true);
    end else begin
      fmDeclBrak.ReadDok( nID );
      fmDeclBrak.TBItemZAGS.Visible:=false;
      fmDeclBrak.CheckEnabledNameOrgan(false);
    end;
    fmDeclBrak.IsReadDokument:=false;
    Result := fmDeclBrak.EditModal;
  finally
    fmDeclBrak.Free;
    fmDeclBrak := nil;
  end;
end;

function TfmDeclBrak.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_DBrak); //
end;

function TfmDeclBrak.NewDok( lAppend : Boolean ): Boolean;
begin
  tsReshSud.TabVisible:=false;

  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    if not HistZAGS.Active then HistZAGS.Active:=true;
  end;
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

  DokumentZA_PREDEL.AsBoolean := false;

  DokumentON_ONLYGOD.AsBoolean:=false;
  DokumentONA_ONLYGOD.AsBoolean:=false;

  DokumentON_B_RESP.AsBoolean     := true;
  DokumentON_B_OBL.AsBoolean      := true;

  DokumentON_M_B_RESP.AsBoolean   := true;
  DokumentON_M_B_OBL.AsBoolean    := true;

  DokumentONA_B_RESP.AsBoolean    := true;
  DokumentONA_B_OBL.AsBoolean     := true;

  DokumentONA_M_B_RESP.AsBoolean  := true;
  DokumentONA_M_B_OBL.AsBoolean   := true;

  DokumentON_B_GOROD.AsInteger    := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_M_B_GOROD.AsInteger  := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_B_GOROD.AsInteger   := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_M_B_GOROD.AsInteger := GlobalTask.ParamAsInteger('TYPEPUNKT');

  DokumentON_NATION.AsInteger := NATION_NOT_SVED;
  DokumentONA_NATION.AsInteger := NATION_NOT_SVED;
  DokumentOTKAZ.AsBoolean:=false;
  {
  DokumentDOLG_RUKOV.AsString:=GlobalTask.GetLastValueAsString('LAST_DOLG_ZAJVL');
  if DokumentDOLG_RUKOV.AsString='' then DokumentDOLG_RUKOV.AsString:=Rukovzags_Dolg;
  DokumentRUKOV.AsString:=GlobalTask.GetLastValueAsString('LAST_FIO_ZAJVL');
  if DokumentRUKOV.AsString='' then DokumentRUKOV.AsString:=RukovZags_FIO;
  }

//  cbBelorus.Checked:=False;
//  if dmBase.GetNewNomerSvid(dmBase.tbDeclBrak, strNewNomer) then begin
//    DokumentSVID_NOMER.AsString := strNewNomer;
//  end;
  if lAppend then begin
    CheckRnGorod;
  end;
  inherited NewDok( lAppend );
  QueryExit:=false;
  Result := true;
end;
{
procedure TfmDeclBrak.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
function TfmDeclBrak.ReadDok(nID: Integer): Boolean;
var
  i,j : Integer;
  fld : TField;
  s,strField,strDeti : String;
  arr : TArrStrings;
  sl  : TStringList;
begin
  IsReadDokument := true;
  Result := true;
  if not dmBase.tbDeclBrak.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbDeclBrak.FieldCount-1 do begin
    strField := dmBase.tbDeclBrak.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.tbDeclBrak.Fields[i]);
    end;
  end;

  SetIDZags;

  ds2xml.StringToXML(dmBase.tbDeclBrak.FieldByName('SUD_BRAK').AsString); // ZAVIT  SUD_BRAK  SUD_NAME
  ds2xml.XMLToData;
  tbReshSud.First;

  ReadDopProperty(dmBase.TypeObj_DBrak, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));

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

  if DokumentON_ONLYGOD.IsNull then DokumentON_ONLYGOD.AsBoolean:=false;
  if DokumentONA_ONLYGOD.IsNull then DokumentONA_ONLYGOD.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentOSNOV.IsNull  then DokumentOSNOV.AsBoolean:=false;
  if DokumentZA_PREDEL.IsNull then DokumentZA_PREDEL.AsBoolean:=false;
  if DokumentOTKAZ.IsNull then DokumentOTKAZ.AsBoolean:=false;

  AdditiveReadDok;
  Dokument.Post;

  CheckRnGorod;

  ReadHistory(nID, dmBase.TypeObj_DBrak);
  // Дети
  strDeti := dmBase.tbDeclBrak.FieldByName('DETI').AsString;
  StrToArr(strDeti, arr, Chr(13), true);
  sl := TStringList.Create;
  tbDeti.EmptyTable;
  for i:=Low(arr) to High(arr) do begin
    sl.CommaText := arr[i];
    tbDeti.Append;
    for j:=0 to sl.Count-1 do begin
      tbDeti.Fields[j].AsString := sl.Strings[j];
    end;
    tbDeti.Post;
  end;
  sl.Free;
  // Запросы
  tbZapros.EmptyTable;
  ReadZapros(tbZapros, _TypeObj_DBrak, nID);

  //------
  edON_GRAG.Hint:=DokumentON_GRAG_ADD.AsString;
  edONA_GRAG.Hint:=DokumentONA_GRAG_ADD.AsString;

  {$IFDEF ZAGS}
  TBItemVozrast.Checked := ((DokumentON_DateR.AsString='') and (DokumentON_VOZR.AsString<>''));
  if TBItemVozrast.Checked then CheckOnlyVozrast(false);
  {$ENDIF}

  IsReadDokument := false;
  tsReshSud.TabVisible:=(tbReshSud.RecordCount>0);
  //---------------------------------------
end;

function TfmDeclBrak.WriteDok: Boolean;
var
  i, j, nID : Integer;
  fld : TField;
  s,strField, strErr : String;
  strRec, strDeti : String;
  d:TDateTime;
  {$IFNDEF ZAGS}
  vKeyValues : Variant;
  dLastSost : TDateTime;
  {$ENDIF}
begin
  AdditiveBeforeWriteDok;
  FLastError:='';
  PostDataSet(Dokument);
  PostDataSet(tbDeti);
  PostDataSet(tbZapros);
  //--------------- проверка на ошибки ввода -------------
  Result:=inherited CheckDokumentSimple(0, true);
  strErr:=FLastError;
  if DokumentDATEZ.IsNull then begin
    strErr := ' Заполните дату заявления. ';
  end else if DokumentNOMER.AsString='' then begin
    strErr := ' Заполните номер заявления. ';
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства о браке. ';
  end;
//  if strErr=''
//    then strErr := CheckSvid(dmBase.TypeObj_DBrak, 'DATESV','SVID_SERIA','SVID_NOMER', strBookMark);
  if strErr<>'' then begin
    PutError(strErr,self);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbDeclBrak.Append;
    dmBase.tbDeclBrak.Post;
    nID := dmBase.tbDeclBrak.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.tbDeclBrak.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;

//    AddEditSvid(strBookMark);

    dmBase.tbDeclBrak.Edit;
    for i:=1 to dmBase.tbDeclBrak.FieldCount-1 do begin
      strField := dmBase.tbDeclBrak.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        if fld.IsNull or (fld.AsString='')
          then dmBase.tbDeclBrak.Fields[i].AsString := ''
          else dmBase.tbDeclBrak.Fields[i].Value := fld.Value;
      end;
    end;
    //----- Дети ----------------------------
    strDeti := '';
    tbDeti.First;
    while not tbDeti.Eof do begin
      strRec := '"'+tbDetiFAMILIA.AsString+'",'+
                '"'+tbDetiNAME.AsString+'",'+
                '"'+tbDetiOTCH.AsString+'",'+
                '"'+tbDetiGOD_ROG.AsString+'"'+Chr(13);
      strDeti := strDeti + strRec;
      tbDeti.Next;
    end;
    dmBase.tbDeclBrak.FieldByName('DETI').AsString := strDeti;

    //----- Запросы ----------------------------
    WriteZapros(tbZapros,_TypeObj_DBrak,nID);

    dmBase.tbDeclBrak.FieldByName('VOSSTAN').AsBoolean := false;

    dmBase.tbDeclBrak.FieldByName('OSNOV').AsBoolean := DokumentOSNOV.AsBoolean;  // в торжественной обстановке

    if DokumentON_M_RNGOROD.AsString<>'' then begin
      dmBase.tbDeclBrak.FieldByName('ON_M_B_RN').AsBoolean := false;
      dmBase.tbDeclBrak.FieldByName('ON_M_RAION').AsString := DokumentON_M_RNGOROD.AsString;
    end else begin
      dmBase.tbDeclBrak.FieldByName('ON_M_B_RN').AsBoolean := true;
    end;
    if DokumentONA_M_RNGOROD.AsString<>'' then begin
      dmBase.tbDeclBrak.FieldByName('ONA_M_B_RN').AsBoolean := false;
      dmBase.tbDeclBrak.FieldByName('ONA_M_RAION').AsString := DokumentONA_M_RNGOROD.AsString;
    end else begin
      dmBase.tbDeclBrak.FieldByName('ONA_M_B_RN').AsBoolean := true;
    end;

    if ds2xml.DataToXML then begin
      dmBase.tbDeclBrak.FieldByName('SUD_BRAK').AsString:=ds2xml.XMLToString;
    end else begin
      PutError(ds2xml.LastError,self);
    end;

    WriteDateIzm;
    WriteForAllDok_BeforePost;

    dmBase.tbDeclBrak.Post;

    // если новое заявление
    if FAddNewDok and not DokumentDATEB.IsNull and (DokumentDATEB.AsDateTime>=dmBase.GetCurDate(true))
      then  GlobalTask.SetLastValueAsDate('LAST_DATEB_DBRAK',DokumentDATEB.AsDateTime);

    WriteDopProperty(dmBase.TypeObj_DBrak, DokumentID.AsInteger,
                     STOD('1899-12-30',tdAds));

//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);

    WriteHistory(nID, dmBase.TypeObj_DBrak);
    AdditiveWriteDok;
    {$IFDEF ZAGS}
      if dmBase.PredZapis.Active and dmBase.PredZapis.Locate('TYPEOBJ;DECL_ID', VarArrayOf([_TypeObj_ZBrak, DokumentID.AsInteger]), []) then begin
        if DokumentOTKAZ.AsBoolean then begin
          if not dmBase.PredZapis.FieldByName('OTKAZ').AsBoolean then begin
//            dmBase.PredZapis.Delete;
            ShowMessage('В графике предварительной записи время освобождено.');
            dmBase.PredZapis.Edit;
            dmBase.PredZapis.FieldByName('OTKAZ').AsBoolean:=true;
            dmBase.PredZapis.FieldByName('DECL_ID').AsString:='';
            dmBase.PredZapis.Post;
          end;
        end else begin
          d:=dmBase.GetDatePredZapis;
          if (d>0) then begin
            strErr:='';
            if not DokumentDATEB.ISNull and (d<>DokumentDATEB.AsDateTime) then begin
              strErr:='Дата брака не соответствует дате из графика: '+DatePropis(d)+chr(13);
            end;
            if not DokumentTIMEB.ISNull and (dmbase.PredZapis.FieldByName('BEGINR').AsDateTime<>DokumentTIMEB.AsDateTime) then begin
              strErr:=strErr+'Время брака не соответствует времени из графика: '+formatdatetime('HH:NN', dmbase.PredZapis.FieldByName('BEGINR').AsDateTime);
            end;
            if not DokumentMESTO.ISNull and (dmbase.PredZapis.FieldByName('MESTO').AsString<>DokumentMESTO.AsString) then begin
              strErr:=strErr+'Место заключения брака не соответствует месту из графика.';
            end;
            if strErr<>'' then PutError(strErr,self);
          end;
        end;
      end;
    {$ENDIF}
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
end;

procedure TfmDeclBrak.FormResize(Sender: TObject);
begin
  gbDeti.Width := Self.ClientWidth;
end;

constructor TfmDeclBrak.Create(Owner: TComponent);
var
  aw : TAddControl;
  n:Integer;
  d2xml:TDataSet2XML;
begin
  inherited;
  if not tbReshSud.Active then tbReshSud.Active:=true;
  if not Dokument.Active  then Dokument.Active:=true;
  if not tbDeti.Active    then tbDeti.Active:=true;
  if not tbZapros.Active    then tbZapros.Active:=true;

  GridRS.Color:=clInfoBk;

  aw := TAddControl.Create(edTimeR);
  aw.ConstStr:='H:MM';
  edDateBrak.Tag:=Integer(aw);
  RelationControl.Add(aw);

  SetFieldAddPanel('OTKAZ');

  FDokZAGS := false;
  TypeObj := dmBase.TypeObj_DBrak;
  FAutoNum := IsAutoNumZAGS;
  FCheckKeyGrid:=true;

  FCheckLookupField:=false;

  dsMesto.DataSet:=dmBase.SprKomiss;

  d2xml:=ds2xml.DS_Add(Dokument,true);
  d2xml.FClearRecord:=false;
  d2xml.FWriteNull:=false;
  d2xml.SetWriteFields('ON_REG_DATE_TILL;ON_REG_DATE;ONA_REG_DATE_TILL;ONA_REG_DATE');
  ds2xml.DS_Add(tbReshSud,false);

  {$IFDEF ZAGS}
    SetLength(FArrChoiceRekv,24);
  {$ELSE}
    SetLength(FArrChoiceRekv,22);
  {$ENDIF}

  FArrChoiceRekv[0].nType:=1;
  FArrChoiceRekv[0].FieldName:='ON_DOKUMENT';
  FArrChoiceRekv[1].nType:=1;
  FArrChoiceRekv[1].FieldName:='ONA_DOKUMENT';
  FArrChoiceRekv[2].nType:=2;
  FArrChoiceRekv[2].FieldName:='ON_NATION_DOK';
  FArrChoiceRekv[3].nType:=0;
  FArrChoiceRekv[3].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[3].FieldName:='ON_WORK';
  FArrChoiceRekv[4].nType:=0;
  FArrChoiceRekv[4].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[4].FieldName:='ONA_WORK';

  FArrChoiceRekv[5].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[5].FieldName:='ONA_M_GOROD_R';
  FArrChoiceRekv[6].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[6].FieldName:='ON_M_GOROD_R';

  FArrChoiceRekv[7].nType:=2;
  FArrChoiceRekv[7].FieldName:='ONA_NATION_DOK';

  FArrChoiceRekv[8].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[8].FieldName:='1ONA_M_GOROD_R';
  FArrChoiceRekv[9].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[9].FieldName:='1ON_M_GOROD_R';

  FArrChoiceRekv[10].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[10].FieldName:='ON_GOSUD';
  FArrChoiceRekv[11].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[11].FieldName:='ONA_GOSUD';
  FArrChoiceRekv[12].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[12].FieldName:='ON_GRAG';
  FArrChoiceRekv[13].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[13].FieldName:='ONA_GRAG';

  FArrChoiceRekv[14].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[14].FieldName:='ON_M_GOSUD';
  FArrChoiceRekv[15].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[15].FieldName:='ONA_M_GOSUD';

  FArrChoiceRekv[16].nType:=SHABLON_BANK;
  FArrChoiceRekv[16].FieldName:='POSHLINA';

  FArrChoiceRekv[17].nType:=SHABLON_DOK_SEMPOL;
  FArrChoiceRekv[17].FieldName:='ON_SEM_DOK';

  FArrChoiceRekv[18].nType:=SHABLON_DOK_SEMPOL;
  FArrChoiceRekv[18].FieldName:='ONA_SEM_DOK';

  FArrChoiceRekv[19].nType:=1;
  FArrChoiceRekv[19].FieldName:='ON_DOK_OTM';

  FArrChoiceRekv[20].nType:=1;
  FArrChoiceRekv[20].FieldName:='ONA_DOK_OTM';
  n:=21;

  {$IFDEF ZAGS}
  FArrChoiceRekv[n].nType:=SHABLON_SVID_Z;
  FArrChoiceRekv[n].FieldName:='ON_SVID';
  n:=n+1;
  FArrChoiceRekv[n].nType:=SHABLON_SVID_Z;
  FArrChoiceRekv[n].FieldName:='ONA_SVID';
  n:=n+1;
  FArrChoiceRekv[n].nType:=SHABLON_ISP_DECL_BRAK;
  FArrChoiceRekv[n].FieldName:='OTMETKA_ISP';
  n:=n+1;
  {$ELSE}
  FArrChoiceRekv[n].nType:=SHABLON_ISP_DECL_BRAK;
  FArrChoiceRekv[n].FieldName:='OTMETKA_ISP';
  {$ENDIF}


  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edONA_IDENTIF);

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddZapros.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelZapros.Glyph);

  FMainTable := dmBase.tbDeclBrak;
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
//  tsSprav.TabVisible := false;
  {$IFDEF ZAGS}
//    TBItemAddSvid.Visible := true;
    edON_Familia.EditButtons.Items[0].Visible:=false;
    edONA_Familia.EditButtons.Items[0].Visible:=false;
//    cbProvDvig.Visible := false;
//    cbProvDvig.Checked := false;
//    gbLich.Visible:=false;
  {$ELSE}
     TBItemArxSpr.Visible:=false;
     TBItemVozrast.Visible:=false;
//     edCopy.Visible     := false;
//     cbPovtor.Visible   := false;
  {$ENDIF}

  SetControlFIOUpdate([
    edON_Familia, edON_FamiliaP, edON_Name, edON_Otch,  edONA_Familia, edONA_FamiliaP, edONA_Name, edONA_Otch,
    BLR_edONA_Familia, BLR_edONA_FamiliaP, BLR_edONA_Name, BLR_edONA_Otch, BLR_edON_Familia, BLR_edON_FamiliaP,  BLR_edON_Name, BLR_edON_Otch
  ],false);

  GridDeti.FieldColumns['FAMILIA'].OnUpdateData:=GridFIOUpdateData;
  GridDeti.FieldColumns['NAME'].OnUpdateData:=GridFIOUpdateData;
  GridDeti.FieldColumns['OTCH'].OnUpdateData:=GridFIOUpdateData;

  SetControlCityUpdate([
    edON_RAION_R, edONA_RAION_R, edON_OBL_R, edONA_OBL_R, edON_GOROD, edONA_GOROD,
    BLR_edON_RAION, BLR_edONA_RAION, BLR_edON_OBL, BLR_edONA_OBL, BLR_edON_GOROD, BLR_edONA_GOROD,
    edON_M_RAION, edONA_M_RAION, edON_M_OBL, edONA_M_OBL, edON_M_GOROD, edONA_M_GOROD
//    edON_M_RNGOROD, edONA_M_RNGOROD  TDbCombobox !!!
  ]);

  SetLength(FArrAddProperty,10);
//  SetAddProperty(0, 'ON_VUS_KOMISS', '', ftMemo);
//  SetAddProperty(1, 'ONA_VUS_KOMISS', '', ftMemo);

//  SetAddProperty(3, 'ON_NATION_DOK', '', ftMemo);
//  SetAddProperty(4, 'ONA_NATION_DOK', '', ftMemo);
  SetAddProperty(0, 'ON_SEM_DOK', '', ftMemo);
  SetAddProperty(1, 'ONA_SEM_DOK', '', ftMemo);
  SetAddProperty(2, 'ROD_DOK_ORGAN', '', ftMemo);
  SetAddProperty(3, 'ON_DOK_OTM', '', ftMemo);
  SetAddProperty(4, 'ONA_DOK_OTM', '', ftMemo);
  SetAddProperty(5, 'NAME_MESTOREG', '', ftMemo);

  SetAddProperty(6, 'ON_GRAG_ADD', '', ftMemo);    // ОН  дополлнительно к гражданству
  SetAddProperty(7, 'ONA_GRAG_ADD', '', ftMemo);   // ОНА дополлнительно к гражданству

  SetAddProperty(8, 'ON_ATEID', '', ftInteger);
  SetAddProperty(9, 'ONA_ATEID', '', ftInteger);

  SetcbBel(N_F_cbBelorus);
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;

  dmBase.SetDateFormat(tbDeti);
  dmBase.SetDateFormat(tbZapros);

//  SetLength(FArrCheckBelField,0);
//  SetLength(FArrCheckField,0);

  {$IFDEF GISUN}
//    FImageGisun:=ImageGISUN;
//    FPoleGRN:=DokumentPOLE_GRN;
//    ImageGISUN.Visible := IsActiveGISUN;
//    lbIDENTIF.Visible:=IsActiveGISUN;
//    edIDENTIF.Visible:=IsActiveGISUN;
//    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
//    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN('ZAPROS');
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
    lbIDENTIF.Visible:=false;
    edIDENTIF.Visible:=false;
  {$ENDIF}

  SetLength(FArrCheckBelField,6);
  WriteToArrCheck(0,  1, false, 'ON_OBL'      , 'ON_OBL_B');
  WriteToArrCheck(1,  1, false, 'ONA_OBL'     , 'ONA_OBL_B');
  WriteToArrCheck(2,  2, false, 'ON_RAION'    , 'ON_RAION_B');
  WriteToArrCheck(3,  2, false, 'ONA_RAION'   , 'ONA_RAION_B');
  WriteToArrCheck(4,  3, false, 'ON_GOROD'    , 'ON_GOROD_B');
  WriteToArrCheck(5,  3, false, 'ONA_GOROD'   , 'ONA_GOROD_B');

  SetLength(FArrCheckField,6);
  WriteToArrCheck(0,  1, false, 'ON_M_OBL');
  WriteToArrCheck(1,  1, false, 'ONA_M_OBL');
  WriteToArrCheck(2,  2, false, 'ON_M_RAION');
  WriteToArrCheck(3,  2, false, 'ONA_M_RAION');
  WriteToArrCheck(4,  3, false, 'ON_M_RNGOROD');
  WriteToArrCheck(5,  3, false, 'ONA_M_RNGOROD');

//  SetPanelPovtor(nil, nil, nil, nil);

//  edON_OBL_B.Left  := edON_OBL_R.Left;
//  edON_OBL_B.Width := edON_OBL_R.Width;
//  edON_OBL_B.Visible := false;

//  edON_RAION_B.Left := edON_RAION_R.Left;
//  edON_RAION_B.Width := edON_RAION_R.Width;
//  edON_RAION_B.Visible := false;

//  edONA_OBL_B.Left := edONA_OBL_R.Left;
//  edONA_OBL_B.Width := edONA_OBL_R.Width;
//  edONA_OBL_B.Visible := false;

//  edONA_RAION_B.Left := edONA_RAION_R.Left;
//  edONA_RAION_B.Width := edONA_RAION_R.Width;
//  edONA_RAION_B.Visible := false;

  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbDeti,'Deti','Общие дети');
    CreatefrxDBdataSet(self,tbZapros,'Zapros','запросы');
  {$ENDIF}

  edON_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;  // utypes.pas
  edONA_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;
  edON_DOK_TYPE.DropDownBox.Width:=TYPEDOK_WIDTH;  // utypes.pas
  edONA_DOK_TYPE.DropDownBox.Width:=TYPEDOK_WIDTH;

end;
//-----------------------------------------------
destructor TfmDeclBrak.Destroy;
begin
  DestroyHint(H);
  inherited;
end;
//-----------------------------------------------
function TfmDeclBrak.CreateSubmenuRun: Boolean;
begin
  Result:=true;
  inherited CreateSubmenuRun;
  AddSubmenu_CheckFIO;
end;
//-----------------------------------------------
procedure TfmDeclBrak.edON_FamiliaEditButtons0Click(Sender: TObject; var Handled: Boolean);
{$IFDEF ZAGS}
begin
end;
{$ELSE}
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  adr : TAdres;
  nID : Integer;
  old : TCursor;
  strName : String;
  p : TPassport;
begin
  if ChoiceMen( edOn_Familia, Trim(edON_FAMILIA.Text), 'POL='+QStr('М')+' .and. (SEM<>1 .or. Empty(SEM))', arrRec) then begin
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
      p := dmBase.GetRecPasport(nID, arrRec);
      DokumentON_IDENTIF.AsString    := p.LichNomer;
      if p.Nomer <> '' then begin
        DokumentON_DOK_TYPE.AsInteger := p.UdostKod;
        DokumentON_DOK_SERIA.AsString := p.Seria;
        DokumentON_DOK_NOMER.AsString := p.Nomer;
        DokumentON_DOKUMENT.AsString  := p.Organ;
        DokumentON_INOMER.AsString    := p.LichNomer;
        DokumentON_DOK_DATE.AsDateTime:= p.Date;
      end;
      DokumentON_VUS.AsBoolean := GetValueFieldEx(arrRec, 'VUS', false);
      DokumentON_VOENKOM.AsString := GetValueFieldEx(arrRec, 'VOENKOM', '');
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      if adr.Punkt <> '' then DokumentON_M_GOROD.AsString := adr.Punkt;
//      if adr.UlicaDom <> '' then DokumentON_M_GOROD_R.AsString := adr.UlicaDom;
      if adr.Ulica<>'' then DokumentON_M_GOROD_R.AsString := adr.Ulica;
      if adr.NDom<>'' then DokumentON_M_DOM.AsString := adr.NDom;
      if adr.Korp<>'' then DokumentON_M_KORP.AsString := adr.Korp;
      if adr.Kv<>'' then DokumentON_M_KV.AsString := adr.Kv;
      DokumentOTMETKA.AsString := DokumentOTMETKA.AsString+#13+dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'OTM_NATION', ftMemo);
      PostDataSet(Dokument);
      Screen.Cursor := old;
  end;
end;
{$ENDIF}

procedure TfmDeclBrak.edONA_FamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
{$IFDEF ZAGS}
begin
end;
{$ELSE}
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  adr : TAdres;
  nID : Integer;
  old : TCursor;
  strName : String;
  p : TPassport;
begin
  if ChoiceMen( edOna_Familia, Trim(edONA_FAMILIA.Text), 'POL='+QStr('Ж')+' .and. (SEM<>1 .or. Empty(SEM))', arrRec) then begin
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
      if v = null then DokumentONA_NATION.AsInteger := 0
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
//      DokumentONA_DOKUMENT.AsString := dmBase.GetPasport(nID, arrRec);
      p := dmBase.GetRecPasport(nID, arrRec);
      DokumentONA_IDENTIF.AsString    := p.LichNomer;
      if p.Nomer <> '' then begin
        DokumentONA_DOK_TYPE.AsInteger := p.UdostKod;
        DokumentONA_DOK_SERIA.AsString := p.Seria;
        DokumentONA_DOK_NOMER.AsString := p.Nomer;
        DokumentONA_DOKUMENT.AsString  := p.Organ;
        DokumentONA_INOMER.AsString    := p.LichNomer;
        DokumentONA_DOK_DATE.AsDateTime:= p.Date;
      end;
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      if adr.Punkt <> '' then DokumentONA_M_GOROD.AsString := adr.Punkt;
//      if adr.UlicaDom <> '' then DokumentONA_M_GOROD_R.AsString := adr.UlicaDom;
      if adr.Ulica<>'' then DokumentONA_M_GOROD_R.AsString := adr.Ulica;
      if adr.NDom<>'' then DokumentONA_M_DOM.AsString := adr.NDom;
      if adr.Korp<>'' then DokumentONA_M_KORP.AsString := adr.Korp;
      if adr.Kv<>'' then DokumentONA_M_KV.AsString := adr.Kv;
      DokumentOTMETKA.AsString := DokumentOTMETKA.AsString+#13+dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'OTM_NATION', ftMemo);
      PostDataSet(Dokument);
      Screen.Cursor := old;
  end;
end;
{$ENDIF}

procedure TfmDeclBrak.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;
//    edRukov.DataField       := 'RUKOV_B';
//    if FEnabledSpecBel then begin
//      edSpec.DataField   := 'SPEC_B';
//    end;
    edZAGS.DataField := 'NAME_ZAGS_B';

  end else begin
    ActivateRUSKeyboard;
//    edRukov.DataField := 'RUKOV';
//    if FEnabledSpecBel then begin
//      edSpec.DataField   := 'SPEC';
//    end;
    edZAGS.DataField := 'NAME_ZAGS';
  end;

end;

procedure TfmDeclBrak.OnDestroyHint(Sender : TObject);
begin
  DestroyHint(H);
end;

procedure TfmDeclBrak.edON_FamiliaEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edON_Familia,DokumentON_Familia.AsString+' ');
end;

procedure TfmDeclBrak.edON_FamiliaPEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CreateHint(H,edON_FamiliaP,DokumentON_FamiliaP.AsString+' ');
    if edON_Familia.Text<>'' then edON_FamiliaP.Text:=edON_Familia.Text;
  end;
end;

procedure TfmDeclBrak.edON_OTCHEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edON_OTCH,DokumentON_OTCH.AsString+' ');
end;

procedure TfmDeclBrak.edON_NameEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edON_Name,DokumentON_Name.AsString+' ');
end;

procedure TfmDeclBrak.edONA_FamiliaEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CreateHint(H,edONA_Familia,DokumentONA_Familia.AsString+' ');
  end;
end;

procedure TfmDeclBrak.edONA_FamiliaPEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CreateHint(H,edONA_FamiliaP,DokumentONA_FamiliaP.AsString+' ');
    if (edON_FamiliaP.Text<>'') and  (edONA_FamiliaP.Text='') then begin
      if DokumentONA_Familia.AsString <> DokumentONA_FamiliaP.AsString then begin
        edONA_FamiliaP.Text:=edONA_Familia.Text;
      end;
    end;
  end;
end;

procedure TfmDeclBrak.edONA_NameEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edONA_NAME,DokumentONA_NAME.AsString+' ');
end;

procedure TfmDeclBrak.edONA_OTCHEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edONA_OTCH,DokumentONA_OTCH.AsString+' ');
end;

procedure TfmDeclBrak.edON_FamiliaCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmDeclBrak.dsDokumentDataChange(Sender: TObject; Field: TField);
var
  strField : String;
  Pol : TPol;
begin
  if (Field<>nil) and not FRun and not IsReadDokument  then begin
    strField := UpperCase(Field.FieldName);
    if FCheckBelName then begin
      FRun := true;
      EditDataSet(Dokument);
      if strField='ON_NAME' then begin
        Pol := tpM;
//        if DokumentON_Name_B.AsString='' then begin
          DokumentON_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
//        end;
      end else if strField='ON_OTCH' then begin
        Pol := tpM;
//        if DokumentON_Otch_B.AsString='' then begin
          DokumentON_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
//        end;
      end else if strField='ON_FAMILIA' then begin

        if (DokumentON_FamiliaP.AsString='')  then DokumentON_FamiliaP.AsString:=DokumentON_Familia.AsString;
        if (DokumentONA_FamiliaP.AsString='') then DokumentONA_FamiliaP.AsString:=DokumentONA_Familia.AsString;

        DokumentON_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        if MySameText(DokumentON_Familia.AsString,DokumentON_FamiliaP.AsString) then begin
          DokumentON_FamiliaP_B.AsString := DokumentON_Familia_B.AsString;
        end;
      end else if strField='ONA_FAMILIA' then begin
        DokumentONA_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end else if strField='ON_FAMILIAP' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentON_Familia.AsString)) and (DokumentON_Familia_B.AsString<>'')
            then DokumentON_FamiliaP_B.AsString := DokumentON_Familia_B.AsString
            else DokumentON_FamiliaP_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end else if strField='ONA_FAMILIAP' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentONA_Familia.AsString)) and (DokumentONA_Familia_B.AsString<>'')
            then DokumentONA_FamiliaP_B.AsString := DokumentONA_Familia_B.AsString
            else DokumentONA_FamiliaP_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end;
      CheckForAll_Bel(Field);
      if strField='ONA_NAME' then begin
        Pol := tpG;
//        if DokumentONA_Name_B.AsString='' then begin
          DokumentONA_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
//        end;
      end else if strField='ONA_OTCH' then begin
        Pol := tpG;
//        if DokumentONA_Otch_B.AsString='' then begin
          DokumentONA_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
//        end;
      end else if strField='MESTO' then begin
        if (DokumentTARIF.AsString='') and (DokumentMESTO.AsString<>'') then begin
          if dmBase.SprKomiss.Locate('ID', DokumentMESTO.AsString, []) then begin
            if dmBase.SprKomiss.FieldByName('TARIF').AsString<>'' then begin
              DokumentTARIF.AsFloat:=dmBase.SprKomiss.FieldByName('TARIF').AsFloat;
            end;
          end;
        end;
      end;
      FRun := false;
    end;
  end;
  inherited;
end;

procedure TfmDeclBrak.edRukovEnter(Sender: TObject);
begin
// if cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' ');
end;

procedure TfmDeclBrak.CheckOnlyVozrast(lClear : Boolean);
begin
  if TBItemVozrast.Checked then begin
    lbDateR_Rodit.Caption := '4. Возраст';
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
    lbDateR_Rodit.Caption := '4. Дата рождения';
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

procedure TfmDeclBrak.CheckOnlyGod;
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

procedure TfmDeclBrak.cbOnlyGodONClick(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmDeclBrak.Button1Click(Sender: TObject);
begin
//  edOTMETKA.AutoSelect:=false;
//  edOTMETKA.Value := edOTMETKA.Value + '#';
//  ActiveControl := edOTMETKA;
//  edOTMETKA.SelStart := Length(edOTMETKA.Value);
//  edOTMETKA.SelLength:= 1;
end;

procedure TfmDeclBrak.edTypeSprChange(Sender: TObject);
//var
//  s1,s2 : string;
begin
{
  if (edTypeSpr.ItemIndex > -1) and not IsReadDokument then begin
    if edTypeSpr.ItemIndex=0 then begin   // на основании решения суда
      edAddTextArx.Text := ' Брак между ' +s1+' и '+s2+ ' расторгнут на основании решения суда    '+
      'от      , вступившего в законную силу    ';
      edNomerArxSpr.Text := '';
    end else if edTypeSpr.ItemIndex=1 then begin   // на основании записи акта о раст. брака
      edAddTextArx.Text := ' Брак между ' +s1+' и '+s2+ ' расторгнут на основании записи акта о расторжении брака №  ,'+
      ' совершенной      в отделе загс  ';
      edNomerArxSpr.Text := '';
    end else if edTypeSpr.ItemIndex=2 then begin   // прекращен в связи со смертью супруга
      edAddTextArx.Text := ' Брак между ' +s1+' и '+s2+ ' прекращен в связи со смертью супруга  '+
      ' запись акта о смерти №   совершена     в отделе загс    ';
      edNomerArxSpr.Text := '';
    end else if edTypeSpr.ItemIndex=3 then begin   // для постановки на учет нужд. в жилье
      if (DokumentON_SEM.AsString='2') and (DokumentONA_SEM.AsString='2') then begin
        edAddTextArx.Text := '   В записи акта о заключении брака супруги значатся как вступившие в брак впервые.'+Chr(13)+Chr(10)+
        '  Справка выдана для постановки на учет граждан, нуждающихся в улучшении жилищных условий.'+
        ' Изменения в запись акта не вносились.';
        edAdresat.Text := edON_FamiliaP.Text+' '+edON_Name.Text+' '+edON_Otch.Text+Chr(13)+Chr(10)+
        dmBase.GetAdresAkt('fmDeclBrak.Dokument', ';ON_M_OBL,ON_M_B_OBL;ON_M_RAION;;',1)+Chr(13)+Chr(10)+
        dmBase.GetAdresAkt('fmDeclBrak.Dokument', ';;;ON_M_GOROD;ON_M_GOROD_R',1);
        edNomerArxSpr.Text := edNomer.Text;
      end else begin
        edTypeSpr.ItemIndex:=-1;
        Application.ProcessMessages;
        PutError(' Брак заключен не впервые. ');
      end;
    end;
  end;
}
end;

procedure TfmDeclBrak.TBItemArxSprClick(Sender: TObject);
begin
//  tsSprav.TabVisible := TBItemArxSpr.Checked;
end;

procedure TfmDeclBrak.AdditiveNewDok;
var
  s1,s2,s3,sON,sONA:String;
  arr:TArrStrings;
  Pol:TPol;
begin
  inherited AdditiveNewDok;
  s1:=GetParam('FLD_DATE','');
  s2:=GetParam('FLD_TIME','');
  s3:=GetParam('FLD_MESTO','');
  sON:=GetParam('FLD_ON','');
  sONA:=GetParam('FLD_ONA','');
  if (s1<>'') or (s2<>'') or (s3<>'') then begin
    EditDataSet(Dokument);
    try
      if s1<>'' then DokumentDATEB.AsDateTime:=STOD(s1,tdAds);
      if s2<>'' then DokumentTIMEB.AsDateTime:=STOT(s2);
      if s3<>'' then begin
        DokumentMESTO.AsString:=s3;
        if (DokumentTARIF.AsString='') and (DokumentMESTO.AsString<>'') then begin
          if dmBase.SprKomiss.Locate('ID', DokumentMESTO.AsString, []) then begin
            if dmBase.SprKomiss.FieldByName('TARIF').AsString<>'' then begin
              DokumentTARIF.AsFloat:=dmBase.SprKomiss.FieldByName('TARIF').AsFloat;
            end;
          end;
        end;
      end;
      if sON<>'' then begin
        StrToArr(sON,arr,' ',false);
        if Length(arr)>0 then begin
          DokumentON_FAMILIA.AsString:=arr[0];
          DokumentON_Familia_B.AsString:=dmBase.GetBelFamily(DokumentON_Familia.AsString);
        end;
        if Length(arr)>1 then begin
          DokumentON_NAME.AsString:=arr[1];
          Pol:=tpM;
          DokumentON_Name_B.AsString:=dmBase.CheckNameBel(Pol, DokumentON_Name.Value);
        end;
        if Length(arr)>2 then begin
          DokumentON_OTCH.AsString:=arr[2];
          Pol:=tpM;
          DokumentON_Otch_B.AsString:=dmBase.CheckOtchBel(Pol, DokumentON_Otch.AsString);
        end;
      end;
      if sONA<>'' then begin
        StrToArr(sONA,arr,' ',false);
        if Length(arr)>0 then begin
          DokumentONA_FAMILIA.AsString:=arr[0];
          DokumentONA_Familia_B.AsString:=dmBase.GetBelFamily(DokumentONA_Familia.AsString);
        end;
        if Length(arr)>1 then begin
          DokumentONA_NAME.AsString:=arr[1];
          Pol:=tpG;
          DokumentONA_Name_B.AsString:=dmBase.CheckNameBel(Pol, DokumentONA_Name.Value);
        end;
        if Length(arr)>2 then begin
          DokumentONA_OTCH.AsString:=arr[2];
          Pol:=tpG;
          DokumentONA_Otch_B.AsString:=dmBase.CheckOtchBel(Pol, DokumentONA_Otch.AsString);
        end;
      end;
    except
    end;
  end;
end;

procedure TfmDeclBrak.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmDeclBrak.TBItemVozrastClick(Sender: TObject);
begin  CheckOnlyVozrast(true); end;

procedure TfmDeclBrak.edON_OBL_RNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
begin CheckListObl(Sender,NewText,RecheckInList); end;

procedure TfmDeclBrak.edON_RAION_RNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
begin  CheckListRaion(Sender,NewText,RecheckInList); end;

procedure TfmDeclBrak.edON_M_RNGORODNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
begin CheckListRnGor(Sender,NewText,RecheckInList); end;

procedure TfmDeclBrak.CheckRnGorod;
var
  nW,nL,nT, nW1, nSmesh : Integer;
begin
  nSmesh:=0;
  if EnabledRnGorod or
     (not DokumentON_M_B_RN.IsNull and not DokumentON_M_B_RN.AsBoolean) then begin
    nW  := edON_M_GOROD_R.Width;
    nL  := edON_M_RAION.Left-nSmesh;
    nT  := edON_M_GOROD_R.Top;
    nW1 := edON_M_RNGOROD.Width;
    edON_M_RNGOROD.Left  := nL;
    edON_M_RNGOROD.Top   := nT;
    edON_M_GOROD_R.Width := nW - nW1 - 5;
    edON_M_GOROD_R.Left  := nL + nW1 + 5;
    edON_M_RNGOROD.Visible := true;
  end else begin
    edON_M_RNGOROD.Visible := false;
  end;

  if EnabledRnGorod or
     (not DokumentONA_M_B_RN.IsNull and not DokumentONA_M_B_RN.AsBoolean) then begin
    nW  := edONA_M_GOROD_R.Width;
    nL  := edONA_M_RAION.Left-nSmesh;
    nT  := edONA_M_GOROD_R.Top;
    nW1 := edONA_M_RNGOROD.Width;
    edONA_M_RNGOROD.Left  := nL;
    edONA_M_RNGOROD.Top   := nT;
    edONA_M_GOROD_R.Width := nW - nW1 - 5;
    edONA_M_GOROD_R.Left  := nL + nW1 + 5;
    edONA_M_RNGOROD.Visible := true;
  end else begin
    edONA_M_RNGOROD.Visible := false;
  end;

end;

procedure TfmDeclBrak.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then
    if pc.Pages[pc.ActivePageIndex]<>tsReshSud then
      N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
end;

procedure TfmDeclBrak.edON_DATERUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 12);
end;

procedure TfmDeclBrak.edONA_DATERUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 12);
end;

procedure TfmDeclBrak.ENG_edON_IDENTIFUpdateData(Sender: TObject; var Handled: Boolean);
var
  s:String;
begin
  if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
    if IsLichNomer(edON_DOK_TYPE.Field.AsString,edON_GRAG.Field.AsString) then begin
      ENG_edON_IDENTIF.Text := CheckLichNom(true, ENG_edON_IDENTIF.Text);
      s:=GetErrorCheck;
      if s<>'' then begin
        PutError(s,self);
      end;
    end;
  end;
end;

procedure TfmDeclBrak.ENG_edONA_IDENTIFUpdateData(Sender: TObject;  var Handled: Boolean);
var
  s:String;
begin
  if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
    if IsLichNomer(edONA_DOK_TYPE.Field.AsString,edONA_GRAG.Field.AsString) then begin
      ENG_edONA_IDENTIF.Text := CheckLichNom(true, ENG_edONA_IDENTIF.Text);
      s:=GetErrorCheck;
      if s<>'' then begin
        PutError(s,self);
      end;
    end;
  end;
end;

procedure TfmDeclBrak.btAddChildClick(Sender: TObject);
begin
  QueryExit:=true;
  tbDeti.Append;
  ActiveControl:=GridDeti;
end;
//-------------------------------------------------------------------------------------
procedure TfmDeclBrak.btDelChildClick(Sender: TObject);
begin
  if tbDeti.RecordCount>0 then begin
    QueryExit:=true;
    tbDeti.Delete;
    ActiveControl:=GridDeti;
  end;
end;
//-------------------------------------------------------------------------------------
procedure TfmDeclBrak.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  if ChoiceSpecD(edRukov) then begin
  {
    GlobalTask.SetLastValueAsString('LAST_DOLG_ZAJVL',DokumentDOLG_RUKOV.AsString);
    GlobalTask.SetLastValueAsString('LAST_FIO_ZAJVL',DokumentRUKOV.AsString);
    }
  end;
end;

//--------------------------------------------------------------------
procedure TfmDeclBrak.DeclBrakAddObrab(data: TPersonalData_; dsOutPut:TDataSet; dsDokument:TDataSet; slPar:TStringList);
var
  setResh:TListReshSud;
  dsResh:TDataSet;
  s,sPar:String;
  fld,fld2:TField;
  sem:Integer;
  ed:TDbComboboxEh;
  edText:TDbEditEh;
  ms:TMartialStatus;
begin     
  dsResh:=TDataSet(ObjectFromParams(slPar,'RESH_SUD'));
  setResh:=Gisun.RegInt.GetCoursList(data, dsOutPut, dsResh, '', slPar);
  if Gisun.LoadSemStatus then begin  // загружать семейный статус
    s:=dsOutPut.FieldByName('PREFIX').AsString; // ON ONA
    fld:=dsDokument.FindField(s+'_SEM_DOK');
    fld2:=dsDokument.FindField(s+'_SEM');
    if (fld<>nil) and (fld2<>nil) then begin
      if s='ON' then begin
        ed:=edON_SEM;
        edText:=edON_SEM_DOK;
      end else begin
        ed:=edONA_SEM;
        edText:=edONA_SEM_DOK;
      end;
      sPar:=''; //<FIO><NAME>';
      ms:=Gisun.RegInt.GetMartialStatus(data, sPar);
      mDebug.Text:=mDebug.Text+'Status='+IntToStr(ms.Status)+': '+ms.Text+#13#10+
                               'NameStatus='+ms.NameStatus+'  Doc='+ms.Doc+#13#10;
      if ms.Status>0 then begin
        sem:=Gisun.RegInt.MartialStatus2Sem(ms.Status);
        EditDataSet(dsDokument);
        fld.Tag:=ms.Status;
//      if ms.Status=10
//        then fld.AsString:='СОСТОИТ В БРАКЕ! '+ms.Text
        fld.AsString:=ms.Text;
        fld2.AsInteger:=sem;
        ed.Hint:=ms.NameStatus;
        edText.Hint:=ms.Doc;
        if ms.Status=10
          then ed.Color:=clRed  // состоит в браке !!!
          else ed.Color:=GetDisableColorGIS;
      end else begin
        ed.Color:=clWindow;
        edText.Color:=clWindow;
        ed.Hint:='';
        edText.Hint:='';
      end;
    end;
  end;
end;
//-------------------------------------------------------------------------------------
procedure TfmDeclBrak.TBItemGetDataGISUNClick(Sender: TObject);
var
//arr:TCurrentRecord;
//  sl:TStringList;
//  i:Integer;
  cur:TCursor;
  sl,slPar:TStringList;
  ds:TDataSet;
begin
{$IFDEF GISUN}
  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  Gisun.CurAkt:=Self;    // !!! важно
  try
    if GetInfoGISUN2(Self) then begin
      mDebug.Text:='';
      sl:=TStringList.Create;
      if ENG_edON_IDENTIF.Text<>'' then begin
        sl.Add('ON='+ENG_edON_IDENTIF.Text);
      end;
      if ENG_edONA_IDENTIF.Text<>'' then begin
        sl.Add('ONA='+ENG_edONA_IDENTIF.Text);
      end;

      Gisun.RegInt.FObrPersonalData:=DeclBrakAddObrab;  // дополнительная обработка при запросе данных для каждого лица
      slPar:=TStringList.Create;
      slPar.AddObject('RESH_SUD', tbReshSud);
      tbReshSud.EmptyTable;
      if PrepareFamilyGets(slPar) then begin
        tbFamily.EmptyTable;
      end;
      try
        ds:=Gisun.LoadIdentifData(sl,Dokument,slPar);
      finally
        slPar.Free;
        Gisun.RegInt.FObrPersonalData:=nil
      end;

      if ds<>nil then begin
        ds.First;
//        Gisun.LoadPersonalData(edON_IDENTIF.Text, arr);
        FRun:=true;
        EditDataSet(Dokument);
        try
        while not ds.Eof do begin
          if (ds.FieldByName('PREFIX').AsString='ON') then begin
//          if (ds.FieldByName('IDENTIF').AsString=ENG_edON_IDENTIF.Text) then begin
            if ds.FieldByName('POL').AsString='Ж' then begin
              PutError('В качестве идентификатора жениха введен идентификатор женщины.',self);
            end else begin
              DokumentON_Familia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
              DokumentON_NAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
              DokumentON_OTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
              DokumentON_Familia_B.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA_B').AsString);

              dmBase.CheckBelFamily(DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);  // занесем в справочник правильные значения перевода

              DokumentON_NAME_B.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME_B').AsString);
              DokumentON_OTCH_B.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH_B').AsString);
              WriteField(DokumentON_DATER,ds.FieldByName('DATER'));
              DokumentON_GRAG.AsString:=ds.FieldByName('GRAG').AsString;

              DokumentON_DOK_TYPE.AsString:=ds.FieldByName('DOK_TYPE').AsString;
              WriteField(DokumentON_DOK_DATE,ds.FieldByName('DOK_DATE'));
              DokumentON_DOK_SERIA.AsString:=ds.FieldByName('DOK_SERIA').AsString;
              DokumentON_DOK_NOMER.AsString:=ds.FieldByName('DOK_NOMER').AsString;
              DokumentON_DOKUMENT.AsString:=ds.FieldByName('DOKUMENT').AsString;

              DokumentON_GOSUD.AsString:=ds.FieldByName('GOSUD_R').AsString;
              DokumentON_OBL.AsString:=ds.FieldByName('OBL_R').AsString;
              DokumentON_B_OBL.AsString:=ds.FieldByName('B_OBL_R').AsString; // !!!

              DokumentON_OBL_B.AsString:=ds.FieldByName('OBL_B_R').AsString;
              DokumentON_RAION.AsString:=ds.FieldByName('RAION_R').AsString;
              DokumentON_RAION_B.AsString:=ds.FieldByName('RAION_B_R').AsString;
              DokumentON_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_R').AsString;
              DokumentON_GOROD.AsString:=ds.FieldByName('GOROD_R').AsString;
              DokumentON_GOROD_B.AsString:=ds.FieldByName('GOROD_B_R').AsString;


              DokumentON_M_GOSUD.AsString:=ds.FieldByName('GOSUD_G').AsString;
              DokumentON_M_OBL.AsString:=ds.FieldByName('OBL_G').AsString;
//              DokumentON_M_B_OBL.AsString:=''; // !!!
              DokumentON_M_RAION.AsString:=ds.FieldByName('RAION_G').AsString;
              DokumentON_M_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_G').AsString;
              DokumentON_M_GOROD.AsString:=ds.FieldByName('GOROD_G').AsString;
              DokumentON_M_RNGOROD.AsString:=ds.FieldByName('RNGOROD_G').AsString;
              DokumentON_M_GOROD_R.AsString:=ds.FieldByName('ULICA_G').AsString;
              DokumentON_M_DOM.AsString:=ds.FieldByName('DOM_G').AsString;
              DokumentON_M_KORP.AsString:=ds.FieldByName('KORP_G').AsString;
              DokumentON_M_KV.AsString:=ds.FieldByName('KV_G').AsString;

              try
                if not ds.FieldByName('REG_DATE').IsNull
                  then DokumentON_GODPR.AsInteger:=YearOf(ds.FieldByName('REG_DATE').AsDateTime);
                WriteDateField(DokumentON_REG_DATE, ds.FieldByName('REG_DATE'));
                WriteDateField(DokumentON_REG_DATE_TILL, ds.FieldByName('REG_DATE_TILL'));
//                DokumentON_REG_DATE_TILL.AsDateTime:=STOD('20180101',tdClipper);  // test
              except
              end;
            end;
          end else if (ds.FieldByName('PREFIX').AsString='ONA') then begin
//          if (ds.FieldByName('IDENTIF').AsString=ENG_edONA_IDENTIF.Text) then begin
            if ds.FieldByName('POL').AsString='М' then begin
              PutError('В качестве идентификатора невесты введен идентификатор мужчины.',self);
            end else begin
              EditDataSet(Dokument);
              DokumentONA_Familia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
              DokumentONA_NAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
              DokumentONA_OTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
              DokumentONA_Familia_B.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA_B').AsString);

              dmBase.CheckBelFamily(DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);  // занесем в справочник правильные значения перевода

              DokumentONA_NAME_B.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME_B').AsString);
              DokumentONA_OTCH_B.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH_B').AsString);
              WriteField(DokumentONA_DATER,ds.FieldByName('DATER'));
              DokumentONA_GRAG.AsString:=ds.FieldByName('GRAG').AsString;

              DokumentONA_DOK_TYPE.AsString:=ds.FieldByName('DOK_TYPE').AsString;
              WriteField(DokumentONA_DOK_DATE,ds.FieldByName('DOK_DATE'));
              DokumentONA_DOK_SERIA.AsString:=ds.FieldByName('DOK_SERIA').AsString;
              DokumentONA_DOK_NOMER.AsString:=ds.FieldByName('DOK_NOMER').AsString;
              DokumentONA_DOKUMENT.AsString:=ds.FieldByName('DOKUMENT').AsString;

              DokumentONA_GOSUD.AsString:=ds.FieldByName('GOSUD_R').AsString;
              DokumentONA_OBL.AsString:=ds.FieldByName('OBL_R').AsString;
              DokumentONA_B_OBL.AsString:=ds.FieldByName('B_OBL_R').AsString; // !!!

              DokumentONA_OBL_B.AsString:=ds.FieldByName('OBL_B_R').AsString;
              DokumentONA_RAION.AsString:=ds.FieldByName('RAION_R').AsString;
              DokumentONA_RAION_B.AsString:=ds.FieldByName('RAION_B_R').AsString;
              DokumentONA_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_R').AsString;
              DokumentONA_GOROD.AsString:=ds.FieldByName('GOROD_R').AsString;
              DokumentONA_GOROD_B.AsString:=ds.FieldByName('GOROD_B_R').AsString;


              DokumentONA_M_GOSUD.AsString:=ds.FieldByName('GOSUD_G').AsString;
              DokumentONA_M_OBL.AsString:=ds.FieldByName('OBL_G').AsString;
//              DokumentONA_M_B_OBL.AsString:=''; // !!!
              DokumentONA_M_RAION.AsString:=ds.FieldByName('RAION_G').AsString;
              DokumentONA_M_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_G').AsString;
              DokumentONA_M_GOROD.AsString:=ds.FieldByName('GOROD_G').AsString;
              DokumentONA_M_RNGOROD.AsString:=ds.FieldByName('RNGOROD_G').AsString;
              DokumentONA_M_GOROD_R.AsString:=ds.FieldByName('ULICA_G').AsString;
              DokumentONA_M_DOM.AsString:=ds.FieldByName('DOM_G').AsString;
              DokumentONA_M_KORP.AsString:=ds.FieldByName('KORP_G').AsString;
              DokumentONA_M_KV.AsString:=ds.FieldByName('KV_G').AsString;

              try
                if not ds.FieldByName('REG_DATE').IsNull
                  then DokumentONA_GODPR.AsInteger:=YearOf(ds.FieldByName('REG_DATE').AsDateTime);
                WriteDateField(DokumentONA_REG_DATE, ds.FieldByName('REG_DATE'));
                WriteDateField(DokumentONA_REG_DATE_TILL, ds.FieldByName('REG_DATE_TILL'));
//                DokumentONA_REG_DATE_TILL.AsDateTime:=STOD('20171121',tdClipper);  // test
              except
              end;
            end;
          end;
          ds.Next;
        end;

        if (DokumentON_FamiliaP.AsString='')
          then DokumentON_FamiliaP.AsString:=DokumentON_Familia.AsString;

        if (DokumentONA_FamiliaP.AsString='')
          then DokumentONA_FamiliaP.AsString:=DokumentONA_Familia.AsString;

        if MySameText(DokumentON_Familia.AsString,DokumentON_FamiliaP.AsString) then begin
          DokumentON_FamiliaP_B.AsString := DokumentON_Familia_B.AsString;
        end;
        if MySameText(DokumentONA_Familia.AsString,DokumentONA_FamiliaP.AsString) then begin
          DokumentONA_FamiliaP_B.AsString := DokumentONA_Familia_B.AsString;
        end;
        PostDataSet(Dokument);
        finally
          FRun:=false;
        end;
        ds.Free;
      end;
      sl.Free;
      tsReshSud.TabVisible:=(tbReshSud.RecordCount>0);
    end;
  finally
    Gisun.CurAkt:=nil;
    Screen.Cursor:=cur;
  end;
{$ENDIF}
//
end;

procedure TfmDeclBrak.edON_VoenkomChange(Sender: TObject);
begin
  if edON_Voenkom.Value<>null
    then edON_VUS.ItemIndex:=0;
end;

//--------------------------------------------------------------------
procedure TfmDeclBrak.WriteSOATO(nType:Integer);
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

// default
procedure TfmDeclBrak.edON_VoenkomEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edON_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
  edON_VUS.ItemIndex:=0;;
end;                                                                                  

// clear
procedure TfmDeclBrak.edON_VoenkomEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  edON_Voenkom.Value:=null;
  edON_VUS.ItemIndex:=1;
end;

// определить по месту жительства
procedure TfmDeclBrak.edON_VoenkomEditButtons2Click(Sender: TObject;  var Handled: Boolean);
begin
  WriteSoato(1);
end;

// default
procedure TfmDeclBrak.edONA_VOENKOMEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edONA_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
  edONA_VUS.ItemIndex:=0;
end;

// clear
procedure TfmDeclBrak.edONA_VOENKOMEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  edONA_Voenkom.Value:=null;
  edONA_VUS.ItemIndex:=1;
end;

// определить по месту жительства
procedure TfmDeclBrak.edONA_VOENKOMEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  WriteSoato(2);
end;

procedure TfmDeclBrak.edONA_VOENKOMChange(Sender: TObject);
begin
  if edONA_Voenkom.Value<>null
    then edONA_VUS.ItemIndex:=0;
end;
//------------------------------------------------------------------
function TfmDeclBrak.BeforeReport: Boolean;
var
  fldDateB : TField;
begin
  Result:=inherited BeforeReport;
  if Result then begin
    FVozrastPropisON:='возраст не известен';
    FVozrastPropisONA:='возраст не известен';
    Fdo18ON:='';
    Fdo18ONA:='';
    if DokumentDATEB.IsNull then fldDateB:=DokumentDATESV else fldDateB:=DokumentDATEB;
    if not fldDateB.IsNull then begin
      if not DokumentON_DateR.IsNull then begin
        FVozrastPropisON:=SubDatePropis(fldDateB.AsDateTime,DokumentON_DateR.AsDateTime,0);
        Fdo18ON:=SubDatePropisEx(18,fldDateB.AsDateTime,DokumentON_DateR.AsDateTime,0);
      end;
      if not DokumentONA_DateR.IsNull then begin
        FVozrastPropisONA:=SubDatePropis(fldDateB.AsDateTime,DokumentONA_DateR.AsDateTime,0);
        Fdo18ONA:=SubDatePropisEx(18,fldDateB.AsDateTime,DokumentONA_DateR.AsDateTime,0);
      end;
    end;
  end;
end;
//------------------------------------------------------------------
function TfmDeclBrak.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;

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

//-----------------------------------------------------------------------------------------------
procedure TfmDeclBrak.edMestoRegistrEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_SPRMESTREGISTR', 'MESTO', false);
  Handled := true;
end;

procedure TfmDeclBrak.edON_GRAGEditButtons0Click(Sender: TObject;  var Handled: Boolean);
//var
//  sValue:String;
//  slPar:TStringList;
begin
  EditAddGrag(edON_GRAG);
{
  slPar:=TStringList.Create;
  slPar.Add('CAPTION=Дополнительное гражданство');
  slPar.Add('ONLY_SHABLON=1');
  slPar.Add('SHABLON='+IntToStr(SHABLON_ADD_GRAG));
  sValue:=DokumentON_GRAG_ADD.AsString;
  sValue:= EnterAdresat(edON_GRAG.Left,edON_GRAG.Top+20, sValue,slPar);
  slPar.Free;
//  sValue := Trim(InputBox('ОНА', 'Дополнительное гражданство', DokumentONA_GRAG_ADD.AsString));
  EditDataSet(Dokument);
  DokumentON_GRAG_ADD.AsString:=sValue;
  edON_GRAG.Hint:=sValue;
  }
end;

procedure TfmDeclBrak.edONA_GRAGEditButtons0Click(Sender: TObject;  var Handled: Boolean);
//var
//  sValue:String;
//  slPar:TStringList;
begin
  EditAddGrag(edONA_GRAG);
{
  slPar:=TStringList.Create;
  slPar.Add('CAPTION=Дополнительное гражданство');
  slPar.Add('ONLY_SHABLON=1');
  slPar.Add('SHABLON='+IntToStr(SHABLON_ADD_GRAG));
  sValue:=DokumentONA_GRAG_ADD.AsString;
  sValue:= EnterAdresat(edONA_GRAG.Left,edONA_GRAG.Top+20, sValue,slPar);
  slPar.Free;
//  sValue := Trim(InputBox('ОНА', 'Дополнительное гражданство', DokumentONA_GRAG_ADD.AsString));
  EditDataSet(Dokument);
  DokumentONA_GRAG_ADD.AsString:=sValue;
  edONA_GRAG.Hint:=sValue;
  }
end;

procedure TfmDeclBrak.edDateZUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 3);
end;

procedure TfmDeclBrak.GridRSGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not tbReshSudCANCEL.IsNull and (tbReshSudCANCEL.AsBoolean=false)
    then AFont.Color:=clRed;
end;

procedure TfmDeclBrak.lbONA_REG_DATE_TILLGetText(Sender: TObject; var Text: String);
begin
  if DokumentONA_REG_DATE_TILL.IsNull
    then Text:=''
    else Text:='убыла '+DatePropis(DokumentONA_REG_DATE_TILL.AsDateTime,3)+'г.';
end;
//------------------------------------------------------
procedure TfmDeclBrak.lbON_REG_DATE_TILLGetText(Sender: TObject; var Text: String);
begin
  if DokumentON_REG_DATE_TILL.IsNull
    then Text:=''
    else Text:='убыл '+DatePropis(DokumentON_REG_DATE_TILL.AsDateTime,3)+'г.';
end;
//------------------------------------------------------
procedure TfmDeclBrak.N_F_lbON_SEMGetText(Sender: TObject; var Text: String);
begin
  if DokumentON_SEM.AsInteger=SEM_BRAK  // состоит в браке
    then Text:='СОСТОИТ В БРАКЕ!'
    else Text:='';
end;
//------------------------------------------------------
procedure TfmDeclBrak.N_F_lbONA_SEMGetText(Sender: TObject;  var Text: String);
begin
  if DokumentONA_SEM.AsInteger=SEM_BRAK  // состоит в браке
    then Text:='СОСТОИТ В БРАКЕ!'
    else Text:='';
end;
//------------------------------------------------------
procedure TfmDeclBrak.FormCreate(Sender: TObject);
begin
  inherited;
  if not Role.SystemAdmin then begin
    mDebug.Visible:=false;
  end;
end;
//------------------------------------------------------
procedure TfmDeclBrak.btAddZaprosClick(Sender: TObject);
begin
  QueryExit:=true;
  tbZapros.Append;
  ActiveControl:=GridZapros;
end;
//------------------------------------------------------
procedure TfmDeclBrak.btDelZaprosClick(Sender: TObject);
begin
  if (tbZapros.RecordCount>0) and Problem(PadCStr('Удалить запрос ?',40,' ')) then begin
    QueryExit:=true;
    tbZapros.Delete;
    ActiveControl:=GridZapros;
  end;
end;
//------------------------------------------------------
procedure TfmDeclBrak.dsDetiDataChange(Sender: TObject; Field: TField);
begin
  if not IsReadDokument and (Field<>nil)
    then QueryExit:=true;
end;

end.

