unit fDeclRast;

interface
{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uPadegFIO,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject, DateUtils,uTypes,
  ExtCtrls, OpisEdit, dbFunc, MetaTask, DBLookupEh, DBCtrlsEh, StdCtrls,
  Mask, Grids, DBGridEh, FuncPr, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  {$IFDEF GISUN} uGisun, {$ENDIF}
  ImgList,Buttons, vchDBCtrls, kbmMemCSVStreamFormat, ZipForge;

type
  TfmDeclRast = class(TfmSimpleD)
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
    Label27: TLabel;
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
    edON_M_B_RESP: TDBCheckBoxEh;
    edON_M_B_OBL: TDBCheckBoxEh;
    edONA_M_B_RESP: TDBCheckBoxEh;
    edONA_M_B_OBL: TDBCheckBoxEh;
    dsNation: TDataSource;
    dsStran: TDataSource;
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
    Label33: TLabel;
    Label36: TLabel;
    edON_SEM: TDBNumberEditEh;
    edONA_SEM: TDBNumberEditEh;
    edBrak: TDBEditEh;
    edON_POSHLINA: TDBEditEh;
    edONA_POSHLINA: TDBEditEh;
    DokumentONA_SVID_DATE: TDateField;
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
    dsGragd: TDataSource;
    DokumentCOPIA: TBooleanField;
    TBItemArxSpr: TTBItem;
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
    cbBelorus: TDBCheckBoxEh;
    edON_B_RESP: TDBCheckBoxEh;
    edON_B_OBL: TDBCheckBoxEh;
    edONA_B_RESP: TDBCheckBoxEh;
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
    DokumentBRAK_ID: TIntegerField;
    DokumentBRAK_DATE: TDateField;
    edBrakDate: TDBDateTimeEditEh;
    Label30: TLabel;
    Label52: TLabel;
    btSeek: TBitBtn;
    TBItemChoiceBrak: TTBItem;
    DokumentON_SOATO: TStringField;
    DokumentONA_SOATO: TStringField;
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
    DokumentDATEB: TDateField;
    DokumentTIMEB: TTimeField;
    lbDateRast: TLabel;
    edDateRast: TDBDateTimeEditEh;
    edTimeRast: TDBDateTimeEditEh;
    DokumentON_SVID: TBooleanField;
    DokumentONA_SVID: TBooleanField;
    cbON_SVID: TDBCheckBoxEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    DokumentON_NATION_DOK: TMemoField;
    DokumentONA_NATION_DOK: TMemoField;
    Label15: TLabel;
    edON_WORK: TDBEditEh;
    edONA_WORK: TDBEditEh;
    edON_NATION_DOK: TDBEditEh;
    edONA_NATION_DOK: TDBEditEh;
    DokumentDOLG_RUKOV: TStringField;
    lbRukov: TvchDBText;
    edRukov: TDBEditEh;
    DokumentBRAK_NOMER: TStringField;
    edBrakNomer: TDBEditEh;
    DokumentRAST_ID: TIntegerField;
    DokumentOTMETKA_ISP: TMemoField;
    lbOtmIsp: TLabel;
    edOtmIsp: TDBEditEh;
    Label34: TLabel;
    edPrim: TDBEditEh;
    Label35: TLabel;
    DokumentPRIM: TMemoField;
    DokumentON_GRAG_ADD: TMemoField;
    DokumentONA_GRAG_ADD: TMemoField;
    BLR_edON_Familia: TDBEditEh;
    BLR_edON_FamiliaP: TDBEditEh;
    BLR_edON_Name: TDBEditEh;
    BLR_edON_Otch: TDBEditEh;
    BLR_edONA_Familia: TDBEditEh;
    BLR_edONA_FamiliaP: TDBEditEh;
    BLR_edONA_Name: TDBEditEh;
    BLR_edONA_Otch: TDBEditEh;
    DokumentON_TELEFON: TStringField;
    DokumentONA_TELEFON: TStringField;
    Label42: TLabel;
    edON_TELEFON: TDBEditEh;
    edONA_TELEFON: TDBEditEh;
    Label38: TLabel;
    edOtkaz: TDBComboBoxEh;
    DokumentOTKAZ: TSmallintField;
    tsSud: TTabSheet;
    lbSud_Date: TLabel;
    lbSudSila: TLabel;
    edSUD_NAME: TDBEditEh;
    edSUD_DATE: TDBDateTimeEditEh;
    edSudSila: TDBDateTimeEditEh;
    DokumentTYPE_RAST: TSmallintField;
    DokumentSUD_SILA: TDateField;
    pnDeti: TPanel;
    gbDeti: TGroupBox;
    GridDeti: TDBGridEh;
    Panel2: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    ImageSUD: TImage;
    Label29: TLabel;
    edTypeRast: TDBComboBoxEh;
    DokumentON_ATEID: TIntegerField;
    DokumentONA_ATEID: TIntegerField;
    procedure FormResize(Sender: TObject);
    procedure cbBelorusClick(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
    procedure cbOnlyGodONClick(Sender: TObject);
    procedure TBItemVozrastClick(Sender: TObject);
    procedure edON_OBLNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure edON_RAIONNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
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
    procedure edON_VoenkomEditButtons0Click(Sender: TObject;             var Handled: Boolean);
    procedure edON_VoenkomEditButtons1Click(Sender: TObject;             var Handled: Boolean);
    procedure edON_VoenkomChange(Sender: TObject);
    procedure edONA_VOENKOMEditButtons0Click(Sender: TObject;            var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons1Click(Sender: TObject;            var Handled: Boolean);
    procedure edONA_VOENKOMChange(Sender: TObject);
    procedure TBItemGetDataGISUNClick(Sender: TObject);
    procedure edDolgFIOEditButtons0Click(Sender: TObject;                var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;                  var Handled: Boolean);
    procedure edON_VoenkomEditButtons2Click(Sender: TObject;             var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons2Click(Sender: TObject;            var Handled: Boolean);
    procedure edDateZUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edTypeRastChange(Sender: TObject);
  private
//  itSud : TTbItem;

//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    { Public declarations }
    FOpisKey_Otkaz:TOpisEdit;
    function BeforeEdit : Boolean; override;
    function BeforeReport:Boolean; override;
    procedure CheckValueSvid;
    procedure CheckRnGorod;
    function EmptyIzm: String; override;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure UpdateActions; override;
    procedure WriteVOENKOM(nType:Integer);
    procedure CheckOnlyGod;
    procedure CheckOnlyVozrast(lClear : Boolean);
    procedure CheckControlSvid;
    procedure CheckControl;
    function CheckAddPanel(var Text : String):Boolean; override;
    function CreateSubMenuRun: Boolean; override;
    procedure SetTypeRast(l:Boolean);


//    procedure Event_ReshSud(Sender:TObject);

    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

  function EditDeclRast( nID : Integer; slPar:TStringList=nil) : Boolean;

var
  fmDeclRast: TfmDeclRast;

implementation

uses dBase, fMain, fShablon, fGetgisun2, fSimpleSeekAkt;

{$R *.DFM}
{$I Task.inc}

{ TfmDeclRast }

function EditDeclRast( nID : Integer; slPar:TStringList) : Boolean;
begin
//  Result := true;
  fmDeclRast:=TfmDeclRast.Create(nil);
  if slPar<>nil
    then fmDeclRast.AssignPar(slPar);
  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
    fmDeclRast.cbOnlyGodON.Visible:=true;
    fmDeclRast.cbOnlyGodONA.Visible:=true;
  end else begin
    fmDeclRast.cbOnlyGodON.Visible:=false;
    fmDeclRast.cbOnlyGodONA.Visible:=false;
  end;
  try
    fmDeclRast.IsReadDokument:=true;
    if nID=-1 then begin
      fmDeclRast.NewDok(true);
      fmDeclRast.SetIDZags;
      fmDeclRast.CheckEnabledNameOrgan(true);
    end else begin
      fmDeclRast.ReadDok( nID );
      fmDeclRast.TBItemZAGS.Visible:=false;
      fmDeclRast.CheckEnabledNameOrgan(false);
    end;
    fmDeclRast.IsReadDokument:=false;
//    fmDeclRast.N_F_edTypeRastChange(nil);

    {$IFDEF GISUN}
//    Gisun.CheckRastBrak(fmRastBrak);
//    fmRastBrak.CheckImageGisun(fmRastBrak.DokumentPOLE_GRN,fmRastBrak.ImageGISUN);
//    fmRastBrak.BeforeEditFormGISUN;
    {$ENDIF}
    Result := fmDeclRast.EditModal;
  finally
    fmDeclRast.Free;
    fmDeclRast := nil;
  end;
end;

function TfmDeclRast.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_DRast); //
end;

function TfmDeclRast.NewDok( lAppend : Boolean ): Boolean;
//var
//  s:String;
begin
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    if not HistZAGS.Active then HistZAGS.Active:=true;
  end;
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

  DokumentON_VUS.AsBoolean:=true;
  DokumentONA_VUS.AsBoolean:=false;

  DokumentON_ONLYGOD.AsBoolean:=false;
  DokumentONA_ONLYGOD.AsBoolean:=false;

  DokumentON_SVID.AsBoolean:=true;
  DokumentONA_SVID.AsBoolean:=true;

  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean  := false;
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
  DokumentOTKAZ.AsInteger:=0;

  DokumentTYPE_RAST.AsInteger:=1;

//  DokumentBRAK_ZAKL.AsString := fmMain.SprNameOrg(GlobalTask.ParamAsInteger('ID'),'Т','');
  DokumentBRAK_ZAKL.AsString := fmMain.NameOrg('','П');

  {
  DokumentDOLG_RUKOV.AsString:=GlobalTask.GetLastValueAsString('LAST_DOLG_ZAJVL');
      ds.Fld('DOLG_FIO').AsString := Parameters('DOLG_SPEC')+' '+Parameters('СПЕЦ_ЗАГС');

  if DokumentDOLG_RUKOV.AsString='' then DokumentDOLG_RUKOV.AsString:=Rukovzags_Dolg;
  DokumentRUKOV.AsString:=GlobalTask.GetLastValueAsString('LAST_FIO_ZAJVL');
  if DokumentRUKOV.AsString='' then DokumentRUKOV.AsString:=RukovZags_FIO;
  }
  DokumentFirst_Ekz.AsBoolean := true;
  DokumentVOSSTAN.AsBoolean := false;
  if lAppend then begin
    CheckRnGorod;
  end;
  inherited NewDok(lAppend);
  QueryExit:=false;
  CheckControl;

  Result := true;
end;
{
procedure TfmDeclRast.SetIDZags;
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
function TfmDeclRast.ReadDok(nID: Integer): Boolean;
var
  i,j : Integer;
  fld : TField;
  strField,strDeti : String;
  arr : TArrStrings;
  sl  : TStringList;
begin
  Result := true;
  if not dmBase.DeclareTermMarriage.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.DeclareTermMarriage.FieldCount-1 do begin
    strField := dmBase.DeclareTermMarriage.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.DeclareTermMarriage.Fields[i]);
    end;
  end;
  SetIDZags;

  ReadDopProperty(_TypeObj_DRast, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));

  DokumentCOPIA.AsBoolean  := false;
  if DokumentON_ONLYGOD.IsNull then DokumentON_ONLYGOD.AsBoolean:=false;
  if DokumentONA_ONLYGOD.IsNull then DokumentONA_ONLYGOD.AsBoolean:=false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentON_VUS.IsNull  then DokumentON_VUS.AsBoolean:=true;
  if DokumentONA_VUS.IsNull then DokumentONA_VUS.AsBoolean:=false;
  if DokumentOTKAZ.IsNull then DokumentOTKAZ.AsInteger:=0;
  if DokumentTYPE_RAST.IsNull then DokumentTYPE_RAST.AsInteger:=1;

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
  ReadHistory(nID, _TypeObj_DRast);

  CheckRnGorod;

  edON_GRAG.Hint:=DokumentON_GRAG_ADD.AsString;
  edONA_GRAG.Hint:=DokumentONA_GRAG_ADD.AsString;

  strDeti := dmBase.DeclareTermMarriage.FieldByName('DETI').AsString;
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

  {$IFDEF ZAGS}
  TBItemVozrast.Checked := ((DokumentON_DateR.AsString='') and (DokumentON_VOZR.AsString<>''));
  if TBItemVozrast.Checked then CheckOnlyVozrast(false);
  {$ENDIF}
  //---------------------------------------
  CheckControl;

end;

function TfmDeclRast.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr : String;
  strRec, strDeti : String;
  {$IFNDEF ZAGS}
  vKeyValues : Variant;
  dLastSost : TDateTime;
  {$ENDIF}
begin
  AdditiveBeforeWriteDok;
  FLastError:='';
  PostDataSet(Dokument);
  PostDataSet(tbDeti);
  //--------------- проверка на ошибки ввода -------------
  Result:=inherited CheckDokumentSimple(0, true);
  strErr:=FLastError;
  if DokumentDATEZ.IsNull then begin
    strErr := ' Заполните дату заявления. ';
  end else if DokumentNOMER.AsString='' then begin
    strErr := ' Заполните номер заявления. ';
  end else if (DokumentON_FAMILIA.AsString='') or (DokumentONA_FAMILIA.AsString='') then begin
    strErr := ' Заполните фамилию. ';
  end;
  {
  if (strErr='') then begin
     Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_DRast, DokumentID_ZAGS.AsInteger,
                    DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime);
     if not Result then exit;
  end;
  }
  if strErr<>'' then begin
    PutError(strErr,self);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.DeclareTermMarriage.Append;
    dmBase.DeclareTermMarriage.Post;
    nID := dmBase.DeclareTermMarriage.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if dmBase.DeclareTermMarriage.FieldByName('ID').AsInteger<>nID then begin
      if not dmBase.DeclareTermMarriage.Locate('ID', nID, []) then begin
        Result := false;
      end;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    if DokumentTYPE_RAST.AsInteger=0  //  !!! по решению суда !!!
      then DokumentDATEB.AsString:='';
    Dokument.Post;
    dmBase.DeclareTermMarriage.Edit;
    for i:=1 to dmBase.DeclareTermMarriage.FieldCount-1 do begin
      strField := dmBase.DeclareTermMarriage.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.DeclareTermMarriage.Fields[i].Value := fld.Value;
      end;
    end;
    WriteDopProperty(dmBase.TypeObj_DRast, DokumentID.AsInteger,
                      STOD('1899-12-30',tdAds));

    WriteHistory(nID, _TypeObj_DRast);

    strDeti := '';
    tbDeti.First;
    i:=0;
    while not tbDeti.Eof do begin
      Inc(i,1);
      strRec := '"'+tbDetiFAMILIA.AsString+'",'+
                '"'+tbDetiNAME.AsString+'",'+
                '"'+tbDetiOTCH.AsString+'",'+
                '"'+tbDetiGOD_ROG.AsString+'"'+Chr(13);
      strDeti := strDeti + strRec;
      tbDeti.Next;
    end;
    dmBase.DeclareTermMarriage.FieldByName('DETI').AsString := strDeti;
    dmBase.DeclareTermMarriage.FieldByName('DETI_COUNT').AsInteger := i;
//    dmBase.DeclareTermMarriage.FieldByName('VOSSTAN').AsBoolean := false;

    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    if DokumentON_M_RNGOROD.AsString<>'' then begin
      dmBase.DeclareTermMarriage.FieldByName('ON_M_B_RN').AsBoolean := false;
      dmBase.DeclareTermMarriage.FieldByName('ON_M_RAION').AsString := DokumentON_M_RNGOROD.AsString;
    end else begin
      dmBase.DeclareTermMarriage.FieldByName('ON_M_B_RN').AsBoolean := true;
    end;
    if DokumentONA_M_RNGOROD.AsString<>'' then begin
      dmBase.DeclareTermMarriage.FieldByName('ONA_M_B_RN').AsBoolean := false;
      dmBase.DeclareTermMarriage.FieldByName('ONA_M_RAION').AsString := DokumentONA_M_RNGOROD.AsString;
    end else begin
      dmBase.DeclareTermMarriage.FieldByName('ONA_M_B_RN').AsBoolean := true;
    end;

    if not FPrintSpecSvid
      then dmBase.DeclareTermMarriage.FieldByName('SPEC_B').AsString:='';

    WriteDateIzm;
    WriteForAllDok_BeforePost;

    if FAddNewDok and (DokumentDATEB.AsDateTime>=dmBase.GetCurDate)
      then GlobalTask.SetLastValueAsDate('LAST_DATEB_DRAST',DokumentDATEB.AsDateTime);

    dmBase.DeclareTermMarriage.Post;

    AdditiveWriteDok;
    {$IFDEF ZAGS}
      if dmBase.PredZapis.Active and dmBase.PredZapis.Locate('TYPEOBJ;DECL_ID', VarArrayOf([_TypeObj_ZRast, DokumentID.AsInteger]), []) then begin
        if DokumentOTKAZ.AsInteger>0 then begin
          if not dmBase.PredZapis.FieldByName('OTKAZ').AsBoolean then begin
            dmBase.PredZapis.Delete;
            ShowMessage('В графике предварительной записи время освобождено.');
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
  end;
end;

procedure TfmDeclRast.FormResize(Sender: TObject);
begin
  gbDeti.Width := Self.ClientWidth-8;
end;

constructor TfmDeclRast.Create(Owner: TComponent);
var
 n:Integer;
begin
  inherited;
  FOpisKey_Otkaz:=nil;

  SetFieldAddPanel('OTKAZ');

  FDokZAGS := false;
  FAutoNum := IsAutoNumZAGS;
  FCheckKeyGrid:=true;
  FCheckLookupField:=false;

//  Dokument.Active:=true;
//  tbDeti.Active:=true;
  TypeObj := _TypeObj_DRast;

  SetLength(FArrChoiceRekv,16);
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

  FArrChoiceRekv[13].nType:=2;
  FArrChoiceRekv[13].FieldName:='ON_NATION_DOK';

  FArrChoiceRekv[14].nType:=2;
  FArrChoiceRekv[14].FieldName:='ONA_NATION_DOK';

  FArrChoiceRekv[15].nType:=SHABLON_ISPOLN;
  FArrChoiceRekv[15].FieldName:='OTMETKA_ISP';

  CheckControlSvid;

  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edONA_IDENTIF);

//  tsSvid.TabVisible:=GlobalTask.ParamAsBoolean('TS_SVID');
//  SetVisibleNomerEkz(pnMain, nil, N_F_1);

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_RESH_SUD,ImageSUD.Picture.Bitmap);

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.DeclareTermMarriage;
  dsGragd.DataSet := dmBase.SprGragd;
//  edONA_Familia.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;
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
//  edRukov.OnExit   := OnDestroyHint;
//  fmMain.SetCurrentDokument(Dokument);

//  if not FEnabledSpecBel then begin
//    edSpec.OnCheckDrawRequiredState:=nil;
//    edSpec.OnEnter:=nil;
//  end;

//  SetVisibleNomerEkz(pnMain, nil, N_F_1);

  cbBelorus.Checked:=False;

  n:=4;
  SetLength(FArrAddProperty,n);
  SetAddProperty(0, 'ON_GRAG_ADD', '', ftMemo);    // ОН  дополлнительно к гражданству
  SetAddProperty(1, 'ONA_GRAG_ADD', '', ftMemo);   // ОНА дополлнительно к гражданству
  SetAddProperty(2, 'ON_ATEID', '', ftInteger);
  SetAddProperty(3, 'ONA_ATEID', '', ftInteger);

  {
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
  }
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


  {$IFDEF ZAGS}
  {$ELSE}
    TBItemArxSpr.Visible:=false;
    TBItemVozrast.Visible:=false;
    N_F_edCopy.Visible := false;
    N_F_cbPovtor.Visible := false;
  {$ENDIF}

  SetControlFIOUpdate([
     edON_Familia, edON_FamiliaP, edON_Name, edON_Otch, edONA_Familia, edONA_FamiliaP, edONA_Name, edONA_Otch,
     BLR_edON_Familia, BLR_edON_FamiliaP, BLR_edON_Name, BLR_edON_Otch, BLR_edONA_Familia, BLR_edONA_FamiliaP, BLR_edONA_Name, BLR_edONA_Otch
     ],false);

  SetControlCityUpdate([
    edON_M_GOROD, edONA_M_GOROD, edON_M_RNGOROD, edONA_M_RNGOROD, edON_GOROD, edONA_GOROD, edON_RAION_R, edONA_RAION_R,
    edON_M_RAION, edONA_M_RAION, edON_OBL_R, edONA_OBL_R, edON_M_OBL, edONA_M_OBL
    ]);

//  GridDeti.FieldColumns['FAMILIA'].OnUpdateData:=GridFIOUpdateData;
//  GridDeti.FieldColumns['NAME'].OnUpdateData:=GridFIOUpdateData;
//  GridDeti.FieldColumns['OTCH'].OnUpdateData:=GridFIOUpdateData;

  ENG_edOna_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edOn_Identif.OnUpdateData:=IN_UpdateData;

  SetcbBel(cbBelorus);
//  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
//    TBItemAddHist.Visible:=true;
//    TBItemHist.Visible:=true;
//  end;

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

  SetLength(FArrCheckField,8);
  WriteToArrCheck(0,  1, false, 'ON_OBL');
  WriteToArrCheck(1,  1, false, 'ONA_OBL');
  WriteToArrCheck(2,  2, false, 'ON_RAION');
  WriteToArrCheck(3,  2, false, 'ONA_RAION');
  WriteToArrCheck(4,  1, false, 'ON_M_OBL');
  WriteToArrCheck(5,  1, false, 'ONA_M_OBL');
  WriteToArrCheck(6,  2, false, 'ON_M_RAION');
  WriteToArrCheck(7,  2, false, 'ONA_M_RAION');

  CreateButtonAddGrag(edON_GRAG);
  CreateButtonAddGrag(edONA_GRAG);

//  SetPanelPovtor(tsPovtor, N_F_cbPovtor,lbRuk,lbSpec);

  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbDeti,'Deti','Общие дети');
  {$ENDIF}

  edON_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;  // utypes.pas
  edONA_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;
  edON_DOK_TYPE.DropDownBox.Width:=TYPEDOK_Width;  // utypes.pas
  edONA_DOK_TYPE.DropDownBox.Width:=TYPEDOK_Width;

end;

destructor TfmDeclRast.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmDeclRast.cbBelorusClick(Sender: TObject);
begin
    if cbBelorus.Checked then begin
      CheckForAll_Bel( nil );
      ActivateBLRKeyboard;
      edON_FamiliaP.DataField := 'ON_FAMILIAP_B';
      edON_Familia.DataField  := 'ON_FAMILIA_B';
      edON_Name.DataField     := 'ON_NAME_B';
      edON_Otch.DataField     := 'ON_OTCH_B';
      edONA_FamiliaP.DataField := 'ONA_FAMILIAP_B';
      edONA_Familia.DataField  := 'ONA_FAMILIA_B';
      edONA_Name.DataField     := 'ONA_NAME_B';
      edONA_Otch.DataField     := 'ONA_OTCH_B';
//      edRukov.DataField        := 'RUKOV_B';
      edZAGS.DataField := 'NAME_ZAGS_B';
//      if FEnabledSpecBel then begin
//        edSpec.DataField   := 'SPEC_B';
//      end;
    end else begin
      ActivateRUSKeyboard;
      edON_Familia.DataField  := 'ON_FAMILIA';
      edON_FamiliaP.DataField := 'ON_FAMILIAP';
      edON_Name.DataField     := 'ON_NAME';
      edON_Otch.DataField     := 'ON_OTCH';
      edONA_Familia.DataField  := 'ONA_FAMILIA';
      edONA_FamiliaP.DataField := 'ONA_FAMILIAP';
      edONA_Name.DataField     := 'ONA_NAME';
      edONA_Otch.DataField     := 'ONA_OTCH';
//      edRukov.DataField        := 'RUKOV';
      edZAGS.DataField := 'NAME_ZAGS';
//      if FEnabledSpecBel then begin
//        edSpec.DataField   := 'SPEC';
//      end;
    end;
end;

procedure TfmDeclRast.OnDestroyHint(Sender : TObject);
begin
  DestroyHint(H);
end;

procedure TfmDeclRast.edON_FamiliaEnter(Sender: TObject);
begin
  if (cbBelorus.Checked)
    then CreateHint(H,edON_Familia,DokumentON_Familia.AsString+' ');
end;

procedure TfmDeclRast.edON_FamiliaPEnter(Sender: TObject);
begin
  if (cbBelorus.Checked) then CreateHint(H,edON_FamiliaP,DokumentON_FamiliaP.AsString+' ');
end;

procedure TfmDeclRast.edON_OTCHEnter(Sender: TObject);
begin
  if (cbBelorus.Checked) then CreateHint(H,edON_OTCH,DokumentON_OTCH.AsString+' ');
end;

procedure TfmDeclRast.edON_NameEnter(Sender: TObject);
begin
  if (cbBelorus.Checked) then CreateHint(H,edON_Name,DokumentON_Name.AsString+' ');
end;

procedure TfmDeclRast.edONA_FamiliaEnter(Sender: TObject);
begin
  if (cbBelorus.Checked) then CreateHint(H,edONA_Familia,DokumentONA_Familia.AsString+' ');
end;

procedure TfmDeclRast.edONA_FamiliaPEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edONA_FamiliaP,DokumentONA_FamiliaP.AsString+' ');
end;

procedure TfmDeclRast.edONA_NameEnter(Sender: TObject);
begin
  if (cbBelorus.Checked) then CreateHint(H,edONA_NAME,DokumentONA_NAME.AsString+' ');
end;

procedure TfmDeclRast.edONA_OTCHEnter(Sender: TObject);
begin
  if (cbBelorus.Checked) then CreateHint(H,edONA_OTCH,DokumentONA_OTCH.AsString+' ');
end;

procedure TfmDeclRast.edON_FamiliaCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := cbBelorus.Checked;
end;


procedure TfmDeclRast.dsDokumentDataChange(Sender: TObject; Field: TField);
var
  strField : String;
  Pol : TPol;
begin
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    strField := UpperCase(Field.FieldName);
    FRun := true;
    if (strField = 'ON_SVID_SERIA') and not Field.IsNull then begin
       if not DokumentDATEZ.IsNull then begin
         DokumentON_SVID_DATE.AsDateTime := DokumentDATEZ.AsDateTime;
       end;
    end;
    if (strField = 'ONA_SVID_SERIA') and not Field.IsNull then begin
       if not DokumentDATEZ.IsNull then begin
         DokumentONA_SVID_DATE.AsDateTime := DokumentDATEZ.AsDateTime;
       end;
    end;
    if FCheckBelName then begin
      EditDataSet(Dokument);
      if strField='ON_NAME' then begin
        Pol := tpM;
//        if DokumentON_Name_B.AsString='' then begin
        DokumentON_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.AsString);

        DokumentON_Name_P.AsString :='';
        DokumentON_Name_PD.AsString :='';
        DokumentON_Name_B_P.AsString :='';
        DokumentON_Name_B_PD.AsString :='';
//        end;
      end else if strField='ON_FAMILIA' then begin

        DokumentON_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );

        DokumentON_Familia_P.AsString :='';
        DokumentON_Familia_PD.AsString :='';
        DokumentON_Familia_B_P.AsString :='';
        DokumentON_Familia_B_PD.AsString :='';
      end else if strField='ONA_FAMILIA' then begin
        DokumentONA_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );

        DokumentONA_Familia_P.AsString :='';
        DokumentONA_Familia_PD.AsString :='';
        DokumentONA_Familia_B_P.AsString :='';
        DokumentONA_Familia_B_PD.AsString :='';
      end else if strField='ON_FAMILIAP' then begin
        if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentON_Familia.AsString)) and (DokumentON_Familia_B.AsString<>'')
          then DokumentON_FamiliaP_B.AsString := DokumentON_Familia_B.AsString
          else DokumentON_FamiliaP_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end else if strField='ONA_FAMILIAP' then begin
        if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentONA_Familia.AsString)) and (DokumentONA_Familia_B.AsString<>'')
          then DokumentONA_FamiliaP_B.AsString := DokumentONA_Familia_B.AsString
          else DokumentONA_FamiliaP_B.AsString := dmBase.GetBelFamily( Field.AsString );
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
    FRun := false;
  end;
  inherited;
end;

procedure TfmDeclRast.FormCreate(Sender: TObject);
begin
  inherited;
//  RunAutoScale(Self);
end;

procedure TfmDeclRast.AdditiveNewDok;
var
  so,s1,s2,sON,sONA:String;
  arr:TArrStrings;
  Pol:TPol;
begin
  inherited AdditiveNewDok;
  so:=GetParam('FLD_ONLY','');
  s1:=GetParam('FLD_DATE','');
  s2:=GetParam('FLD_TIME','');
//  s3:=GetParam('FLD_MESTO','');
  sON:=GetParam('FLD_ON','');
  sONA:=GetParam('FLD_ONA','');
  if (s1<>'') or (s2<>'') then begin
    EditDataSet(Dokument);
    try
      if s1<>'' then DokumentDATEB.AsDateTime:=STOD(s1,tdAds);
      if s2<>'' then DokumentTIMEB.AsDateTime:=STOT(s2);
      if so='1' then begin
        edTypeRast.Enabled:=false;
        edTimeRast.Enabled:=false;
        edDateRast.Enabled:=false;
      end;
      { if s3<>'' then begin
        DokumentMESTO.AsString:=s3;
        if (DokumentTARIF.AsString='') and (DokumentMESTO.AsString<>'') then begin
          if dmBase.SprKomiss.Locate('ID', DokumentMESTO.AsString, []) then begin
            if dmBase.SprKomiss.FieldByName('TARIF').AsString<>'' then begin
              DokumentTARIF.AsFloat:=dmBase.SprKomiss.FieldByName('TARIF').AsFloat;
            end;
          end;
        end;
      end;  }
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
//---------------------------------------------
procedure TfmDeclRast.AdditiveReadDok;
var
  so:String;
begin
  inherited AdditiveReadDok;
  so:=GetParam('FLD_ONLY','');
  if so='' then
    if dmBase.PredZapis.Active and dmBase.PredZapis.Locate('TYPEOBJ;DECL_ID', VarArrayOf([_TypeObj_ZRast, DokumentID.AsInteger]), [])
      then so:='1';
  if so='1' then begin
    edTypeRast.Enabled:=false;
    edTimeRast.Enabled:=false;
    edDateRast.Enabled:=false;
  end;
end;

procedure TfmDeclRast.UpdateActions;
begin
  inherited;
end;

procedure TfmDeclRast.cbOnlyGodONClick(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmDeclRast.CheckOnlyGod;
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

procedure TfmDeclRast.CheckOnlyVozrast(lClear: Boolean);
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

procedure TfmDeclRast.TBItemVozrastClick(Sender: TObject);
begin
  CheckOnlyVozrast(true);
end;

procedure TfmDeclRast.edON_OBLNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmDeclRast.edON_RAIONNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;


procedure TfmDeclRast.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetRastBrak(Self);
//  Gisun.CheckRastBrak(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmDeclRast.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterRastBrak(Self);
//  Gisun.CheckRastBrak(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmDeclRast.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then begin
    if pc.Pages[pc.ActivePageIndex].Name='tsSvid' then begin
      CheckForAll_Bel( nil );
      CheckValueSvid;
    end else begin
      cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
    end;
  end;
end;
//----------------------------------------------------------------------
procedure TfmDeclRast.CheckValueSvid;
var
  s:String;
  arr:TArrStrings;
begin
  // в творительном падеже по русски
  if DokumentON_Familia_P.AsString='' then begin
    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
      s := GetPadegFIO3(DokumentON_Familia.AsString, DokumentON_NAME.AsString, DokumentON_OTCH.AsString,'м','Т');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end else begin
      s := DokumentON_Familia.AsString+' '+DokumentON_NAME.AsString+' '+DokumentON_OTCH.AsString;
    end;

    StrToArr(s,arr,' ',false);
    SetLength(arr,3);
    DokumentON_Familia_P.AsString:=arr[0];
    DokumentON_NAME_P.AsString:=arr[1];
    DokumentON_OTCH_P.AsString:=arr[2];
  end;
  if DokumentONA_Familia_P.AsString='' then begin
    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
      s:=GetPadegFIO3(DokumentONA_Familia.AsString, DokumentONA_NAME.AsString, DokumentONA_OTCH.AsString,'ж','Т');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end else begin
      s:=DokumentONA_Familia.AsString+' '+DokumentONA_NAME.AsString+' '+DokumentONA_OTCH.AsString;
    end;
    StrToArr(s,arr,' ',false);
    SetLength(arr,3);
    DokumentONA_Familia_P.AsString:=arr[0];
    DokumentONA_NAME_P.AsString:=arr[1];
    DokumentONA_OTCH_P.AsString:=arr[2];
  end;
  // в дательном падеже по русски
  if DokumentON_Familia_PD.AsString='' then begin
    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
      s := GetPadegFIO3(DokumentON_Familia.AsString, DokumentON_NAME.AsString, DokumentON_OTCH.AsString,'м','Д');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end else begin
      s := DokumentON_Familia.AsString+' '+DokumentON_NAME.AsString+' '+DokumentON_OTCH.AsString;
    end;
    StrToArr(s,arr,' ',false);
    SetLength(arr,3);
    DokumentON_Familia_PD.AsString:=arr[0];
    DokumentON_NAME_PD.AsString:=arr[1];
    DokumentON_OTCH_PD.AsString:=arr[2];
  end;
  if DokumentONA_Familia_PD.AsString='' then begin
    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
      s:=GetPadegFIO3(DokumentONA_Familia.AsString, DokumentONA_NAME.AsString, DokumentONA_OTCH.AsString,'ж','Д');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end else begin
      s:=DokumentONA_Familia.AsString+' '+DokumentONA_NAME.AsString+' '+DokumentONA_OTCH.AsString;
    end;
    StrToArr(s,arr,' ',false);
    SetLength(arr,3);
    DokumentONA_Familia_PD.AsString:=arr[0];
    DokumentONA_NAME_PD.AsString:=arr[1];
    DokumentONA_OTCH_PD.AsString:=arr[2];
  end;
  // по-бел в родительном падеже
  if DokumentON_Familia_B_P.AsString='' then begin
    DokumentON_Familia_B_P.AsString:=DokumentON_Familia_B.AsString;
    DokumentON_NAME_B_P.AsString:=DokumentON_NAME_B.AsString;
    DokumentON_OTCH_B_P.AsString:=DokumentON_OTCH_B.AsString;
  end;
  if DokumentONA_Familia_B_P.AsString='' then begin
    DokumentONA_Familia_B_P.AsString:=DokumentONA_Familia_B.AsString;
    DokumentONA_NAME_B_P.AsString:=DokumentONA_NAME_B.AsString;
    DokumentONA_OTCH_B_P.AsString:=DokumentONA_OTCH_B.AsString;
  end;
  // по-бел в дательном падеже
  if DokumentON_Familia_B_PD.AsString='' then begin
    DokumentON_Familia_B_PD.AsString:=DokumentON_Familia_B.AsString;
    DokumentON_NAME_B_PD.AsString:=DokumentON_NAME_B.AsString;
    DokumentON_OTCH_B_PD.AsString:=DokumentON_OTCH_B.AsString;
  end;
  if DokumentONA_Familia_B_PD.AsString='' then begin
    DokumentONA_Familia_B_PD.AsString:=DokumentONA_Familia_B.AsString;
    DokumentONA_NAME_B_PD.AsString:=DokumentONA_NAME_B.AsString;
    DokumentONA_OTCH_B_PD.AsString:=DokumentONA_OTCH_B.AsString;
  end;

end;
//---------------------------------------------------------------------------------
procedure TfmDeclRast.edON_DATERUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 12);
end;

function TfmDeclRast.EmptyIzm: String;
begin
  Result:=SprRast_EmptyIzm;  // uProject
end;

procedure TfmDeclRast.CheckRnGorod;
var
  nW,nL,nT, nW1 : Integer;
begin
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
end;
//--------------------------------------------------------------------
procedure TfmDeclRast.edSpecEnter(Sender: TObject);
begin
end;
//--------------------------------------------------------------------
procedure TfmDeclRast.N_F_cbPovtorClick(Sender: TObject);
begin
  inherited;
end;
//--------------------------------------------------------------------
function TfmDeclRast.WriteBrak(ArrRec:TCurrentRecord):Boolean;
var
  v : Variant;
  s : String;
  SOATO:TSOATO;
  lCheck,lOk:Boolean;
begin
  Result:=true;
  lCheck:=dbDisableControls(Dokument);
  try

    EditDataSet(Dokument);
    s := GetValueField(arrRec, 'NAME_ZAGS');
    if s= '' then begin
      v := GetValueField(arrRec, 'ID_ZAGS');
      if dmBase.SprNames.Locate('ID', v, []) then begin
        s := dmBase.SprNames.FieldByName('NAME').AsString;
      end;
    end;
    QueryExit:=true;
    DokumentSUD_DATE.AsDateTime:=dmBase.getCurDate;
    DokumentBRAK_ZAKL.AsString:=fmMain.GetPadeg(s,'П');
    v := GetValueFieldEx(arrRec, 'DATEZ',0);
    if v>0 then DokumentBRAK_DATE.AsDateTime:=v else DokumentBRAK_DATE.AsString:='';
    DokumentBRAK_NOMER.AsString:=GetValueFieldEx(arrRec, 'NOMER','');
    DokumentBRAK_ID.AsInteger:=GetValueFieldEx(arrRec, 'ID', 0);
    DokumentON_IDENTIF.AsString := GetValueFieldEx(arrRec, 'ON_IDENTIF','');
    DokumentONA_IDENTIF.AsString := GetValueFieldEx(arrRec, 'ONA_IDENTIF','');

    {$IFDEF GISUN}
      lOk:=true;
//      if IsActiveGISUN and Gisun.IsEnabled then begin
//        lOk:=false;
//      end;
    {$ELSE}
       lOk:=true;
    {$ENDIF}

    if lOk then begin
      DokumentON_FAMILIA.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIAP','');
      DokumentON_FAMILIA_B.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIAP_B','');
      DokumentON_FAMILIAP.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIAP','');
      DokumentON_FAMILIAP_B.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIAP_B','');
      DokumentON_NAME.AsString:=GetValueFieldEx(arrRec, 'ON_NAME','');
      DokumentON_NAME_B.AsString:=GetValueFieldEx(arrRec, 'ON_NAME_B','');
      DokumentON_OTCH.AsString:=GetValueFieldEx(arrRec, 'ON_OTCH','');
      DokumentON_OTCH_B.AsString:=GetValueFieldEx(arrRec, 'ON_OTCH_B','');
      v := GetValueFieldEx(arrRec, 'ON_DATER',0);
      if v>0 then DokumentON_DATER.AsDateTime:=v else DokumentON_DATER.AsString:='';
      DokumentON_GRAG.AsInteger:=GetValueFieldEx(arrRec, 'ON_GRAG',0);
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
      v := GetValueField(arrRec, 'ON_B_RESP');
      if v = null then DokumentON_B_RESP.AsString := '' else DokumentON_B_RESP.Value    := v;
      DokumentON_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_GOSUD','');
      v := GetValueField(arrRec, 'ON_B_OBL');
      if v = null then DokumentON_B_OBL.AsString := ''  else DokumentON_B_OBL.Value    := v;
      DokumentON_OBL.AsString:=GetValueFieldEx(arrRec, 'ON_OBL','');
      DokumentON_RAION.AsString := GetValueFieldEx(arrRec, 'ON_RAION','');
      DokumentON_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_B_GOROD','');
      DokumentON_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_GOROD','');
      // место жительства
      v := GetValueField(arrRec, 'ON_M_B_RESP');
      if v = null then DokumentON_M_B_RESP.AsString := ''  else DokumentON_M_B_RESP.Value    := v;
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
      v := GetValueField(arrRec, 'ONA_B_RESP');
      if v = null then DokumentONA_B_RESP.AsString := '' else DokumentONA_B_RESP.Value    := v;
      DokumentONA_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_GOSUD','');
      v := GetValueField(arrRec, 'ONA_B_OBL');
      if v = null then DokumentONA_B_OBL.AsString := ''  else DokumentONA_B_OBL.Value    := v;
      DokumentONA_OBL.AsString:=GetValueFieldEx(arrRec, 'ONA_OBL','');
      DokumentONA_RAION.AsString := GetValueFieldEx(arrRec, 'ONA_RAION','');
      DokumentONA_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_B_GOROD','');
      DokumentONA_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_GOROD','');
      // место жительства
      v := GetValueField(arrRec, 'ONA_M_B_RESP');
      if v = null then DokumentONA_M_B_RESP.AsString := ''  else DokumentONA_M_B_RESP.Value    := v;
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
    dbEnableControls(Dokument,lCheck);
  end;

end;
//--------------------------------------------------------------------
procedure TfmDeclRast.btSeekClick(Sender: TObject);
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
procedure TfmDeclRast.TBItemChoiceBrakClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ParamFlt:TParamFieldFlt;
begin
  if ExitAsGISUN(true) then exit;

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

function TfmDeclRast.BeforeReport:Boolean;
begin
  Result:=inherited BeforeReport;
  if Result then begin
    CheckForAll_Bel( nil );
    CheckValueSvid;
  end;
end;

procedure TfmDeclRast.btAddChildClick(Sender: TObject);
begin
  QueryExit:=true;
  tbDeti.Append;
  ActiveControl:=GridDeti;
end;

procedure TfmDeclRast.btDelChildClick(Sender: TObject);
begin
  if tbDeti.RecordCount>0 then begin
    QueryExit:=true;
    tbDeti.Delete;
    ActiveControl:=GridDeti;
  end;
end;

procedure TfmDeclRast.btRazdelClick(Sender: TObject);
begin
  edOTMETKA.AutoSelect:=false;
  edOTMETKA.Value := edOTMETKA.Value + '#';
  ActiveControl := edOTMETKA;
  edOTMETKA.SelStart := Length(edOTMETKA.Value);
  edOTMETKA.SelLength:= 1;
end;

function TfmDeclRast.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;        
  {$IFNDEF ZAGS}
//  if Result then begin
//    cbProvDvig.Checked := not DokumentPROV.AsBoolean;
//  end;
  {$ENDIF}

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

//------------------------------------------------------------------------
procedure TfmDeclRast.CheckControlSvid;
begin
end;

procedure TfmDeclRast.edON_VoenkomEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edON_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
  cbON_VUS.Checked:=true;
end;

procedure TfmDeclRast.edON_VoenkomEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  edON_Voenkom.Value:=null;
  cbON_VUS.Checked:=false;
end;

procedure TfmDeclRast.edON_VoenkomChange(Sender: TObject);
begin
  if edON_Voenkom.Value<>null
    then cbON_VUS.Checked:=true;
end;

procedure TfmDeclRast.edONA_VOENKOMEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edONA_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
  cbONA_VUS.Checked:=true;
end;

procedure TfmDeclRast.edONA_VOENKOMEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  edONA_Voenkom.Value:=null;
  cbONA_VUS.Checked:=false;
end;

procedure TfmDeclRast.edONA_VOENKOMChange(Sender: TObject);
begin
  if edONA_Voenkom.Value<>null
    then cbONA_VUS.Checked:=true;
end;

procedure TfmDeclRast.TBItemGetDataGISUNClick(Sender: TObject);
var
//  arr:TCurrentRecord;
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
    if GetInfoGISUN2(Self) then begin
      sl:=TStringList.Create;
      if ENG_edON_IDENTIF.Text<>'' then begin
        sl.Add('ON='+ENG_edON_IDENTIF.Text);
      end;
      if ENG_edONA_IDENTIF.Text<>'' then begin
        sl.Add('ONA='+ENG_edONA_IDENTIF.Text);
      end;
      ds:=Gisun.LoadIdentifData(sl,nil,nil);
      if ds<>nil then begin
        ds.First;
//        Gisun.LoadPersonalData(edON_IDENTIF.Text, arr);
        EditDataSet(Dokument);
        while not ds.Eof do begin
          if ds.FieldByName('IDENTIF').AsString=ENG_edON_IDENTIF.Text then begin
            if ds.FieldByName('POL').AsString='Ж' then begin
              PutError('В качестве идентификатора жениха введен идентификатор женщины.',self);
            end else begin
              DokumentON_Familia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
              DokumentON_NAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
              DokumentON_OTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
              DokumentON_Familia_B.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA_B').AsString);
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

              DokumentON_RAION.AsString:=ds.FieldByName('RAION_R').AsString;
              DokumentON_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_R').AsString;
              DokumentON_GOROD.AsString:=ds.FieldByName('GOROD_R').AsString;


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
            end;
          end else begin
            if ds.FieldByName('POL').AsString='М' then begin
              PutError('В качестве идентификатора невесты введен идентификатор мужчины.',self);
            end else begin
              EditDataSet(Dokument);
              DokumentONA_Familia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
              DokumentONA_NAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
              DokumentONA_OTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
              DokumentONA_Familia_B.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA_B').AsString);
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

              DokumentONA_RAION.AsString:=ds.FieldByName('RAION_R').AsString;
              DokumentONA_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_R').AsString;
              DokumentONA_GOROD.AsString:=ds.FieldByName('GOROD_R').AsString;


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
            end;
          end;
          ds.Next;
        end;
        PostDataSet(Dokument);
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

procedure TfmDeclRast.edDolgFIOEditButtons0Click(Sender: TObject; var Handled: Boolean);
//var
//  sDolg,sFIO,sFIO_B,sField:String;
begin
//  if ChoiceSpec(sDolg,sFIO,sFIO_B,edDolgFIO) then begin
//    edDolgFIO.Text:=sDolg+' '+sFIO;
//  end;
end;

procedure TfmDeclRast.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  if ChoiceSpecD(edRukov) then begin
{
    GlobalTask.SetLastValueAsString('LAST_DOLG_ZAJVL',DokumentDOLG_RUKOV.AsString);
    GlobalTask.SetLastValueAsString('LAST_FIO_ZAJVL',DokumentRUKOV.AsString);
}
  end;
end;

//-------------------------------------------------------------------------
procedure TfmDeclRast.WriteVOENKOM(nType:Integer);
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

procedure TfmDeclRast.edON_VoenkomEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  WriteVOENKOM(1);
end;

procedure TfmDeclRast.edONA_VOENKOMEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  WriteVOENKOM(2);
end;

procedure TfmDeclRast.edDateZUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 3);
end;

function TfmDeclRast.CheckAddPanel(var Text: String): Boolean;
begin
  Result:=false;
  if not DokumentOTKAZ.IsNull and (DokumentOTKAZ.AsInteger>0) then begin
    if FOpisKey_Otkaz=nil then begin
      FOpisKey_Otkaz:=GlobalTask.CurrentOpisEdit.FindOpis('KEY_OTKAZ_REG');
    end;
    if FOpisKey_Otkaz<>nil then begin
      Text:=FOpisKey_Otkaz.Naim(DokumentOTKAZ.AsInteger);
      Result:=true;
    end;
  end;
end;

procedure TfmDeclRast.edTypeRastChange(Sender: TObject);
var
  l:Boolean;
begin
  if edTypeRast.ItemIndex=1 // по взаимному согласию
    then l:=true
    else l:=false;
  SetTypeRast(l);
end;
//---------------------------------------------------
// l=true   по взаимному согласию
procedure TfmDeclRast.SetTypeRast(l:Boolean);
begin
  if edTypeRast.Enabled then begin
    tsSud.TabVisible:=not l;
    ImageSUD.Visible:=not l;
    {
    lbSudSila.Enabled:=not l;
    edSudSila.Enabled:=not l;
    edSUD_NAME.Enabled:=not l;
    lbSud_Date.Enabled:=not l;
    edSUD_DATE.Enabled:=not l;
    SetEnabledControls([pnDeti, btAddChild, btDelChild, gbDeti, GridDeti], not l);
    }
    lbDateRast.Enabled:=l;
    edDateRast.Enabled:=l;
    edTimeRast.Enabled:=l;
    EditDataSet(Dokument);
    if l then begin
      DokumentSUD_NAME.AsString:='';
      DokumentSUD_DATE.AsString:='';
      DokumentSUD_SILA.AsString:='';
      tbDeti.EmptyTable;
    end else begin
      DokumentDATEB.AsString:='';
      DokumentTIMEB.AsString:='';
    end;
  end;
end;

function TfmDeclRast.CreateSubMenuRun: Boolean;
//var
// it : TTbItem;
// sep : TTbSeparatorItem;
begin
  Result:=true;
  AddSubmenu_CheckFIO;
  {
  itSud := TTbItem.Create(TBSubmenuRun);
  itSud.Caption:='По решению суда';
  itSud.OnClick:=Event_ReshSud;
  TBSubmenuRun.Add(itSud);
  }
end;

{
procedure TfmDeclRast.Event_ReshSud(Sender: TObject);
begin
  EditDataSet(Dokument);
  if DokumentTYPE_RAST.AsInteger=0 then begin
    DokumentTYPE_RAST.AsInteger:=1;
  end else begin
    DokumentTYPE_RAST.AsInteger:=0;
  end;
  CheckControl;
end;
}
procedure TfmDeclRast.CheckControl;
begin
//  itSud.Checked:=(DokumentTYPE_RAST.AsInteger=0);
  tsSud.TabVisible:=(DokumentTYPE_RAST.AsInteger=0);
  SetTypeRast(not tsSud.TabVisible);
end;

end.
