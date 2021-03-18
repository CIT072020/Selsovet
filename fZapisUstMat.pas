unit fZapisUstMat;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject, uProjectAll,
  ExtCtrls, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, dBase, funcPr, dbFunc,uTypes,
  MetaTAsk, OpisEdit, vchDBCtrls, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  Grids, DBGridEh, Buttons, SelLibFR, ImgList, kbmMemCSVStreamFormat,
  ZipForge;

type
  TfmZapisUstMat = class(TfmSimpleD)
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
    Label20: TLabel;
    Label21: TLabel;
    edON_Familia: TDBEditEh;
    edON_Name: TDBEditEh;
    edON_OTCH: TDBEditEh;
    edON_DATER: TDBDateTimeEditEh;
    edON_NATION: TDBLookupComboboxEh;
    edON_GRAG: TDBLookupComboboxEh;
    Label11: TLabel;
    edONA_Familia: TDBEditEh;
    edONA_Name: TDBEditEh;
    edONA_OTCH: TDBEditEh;
    edONA_DATER: TDBDateTimeEditEh;
    edONA_NATION: TDBLookupComboboxEh;
    edONA_GRAG: TDBLookupComboboxEh;
    Label7: TLabel;
    edNomer: TDBEditEh;
    Label8: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label40: TLabel;
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
    DokumentLICH_ID: TIntegerField;
    DokumentCHILD_ID: TIntegerField;
    TBItemClearLich: TTBItem;
    DokumentSVID_SERIA: TStringField;
    Label55: TLabel;
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
    edReshSud: TDBEditEh;
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
    Label28: TLabel;
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
    Label58: TLabel;
    edOther: TDBEditEh;
    edIzmen: TDBEditEh;
    Label59: TLabel;
    Label23: TLabel;
    edZametka: TDBEditEh;
    edRukov: TDBEditEh;
    edSPEC: TDBEditEh;
    dsGragd: TDataSource;
    DokumentCOPIA: TBooleanField;
    edCopy: TDBCheckBoxEh;
    cbPovtor: TDBCheckBoxEh;
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
    DokumentSTATUS: TStringField;
    DokumentGRAG: TIntegerField;
    DokumentB_GOROD: TIntegerField;
    DokumentON_B_GOROD: TIntegerField;
    DokumentONA_B_GOROD: TIntegerField;
    edB_GOROD: TDBLookupComboboxEh;
    N_F_cbBelorus: TDBCheckBoxEh;
    lbIDENTIF: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    gbGit: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label53: TLabel;
    edONA_GOSUD: TDBLookupComboboxEh;
    edONA_GOROD: TDBEditEh;
    edONA_B_OBL: TDBCheckBoxEh;
    edONA_GOROD_R: TDBEditEh;
    edONA_B_GOROD: TDBLookupComboboxEh;
    gbDok: TGroupBox;
    Label69: TLabel;
    edON_DOKUMENT: TDBEditEh;
    edON_DOK_TYPE: TDBComboBoxEh;
    edON_DOK_SERIA: TDBEditEh;
    edON_DOK_NOMER: TDBEditEh;
    edON_DOK_DATE: TDBDateTimeEditEh;
    Label15: TLabel;
    DokumentSPEC_B: TStringField;
    edRaion: TDBEditEh;
    edOBL: TDBEditEh;
    edON_M_OBL: TDBEditEh;
    edON_M_RAION: TDBEditEh;
    edONA_M_OBL: TDBEditEh;
    edONA_M_RAION: TDBEditEh;
    edONA_OBL: TDBEditEh;
    edONA_RAION: TDBEditEh;
    DokumentRN_B_GOROD: TStringField;
    DokumentRN_ONA_M_B_GOROD: TStringField;
    DokumentRN_ONA_B_GOROD: TStringField;
    DokumentRN_ON_M_B_GOROD: TStringField;
    BLR_edFamiliaDo: TDBEditEh;
    BLR_edNameDo: TDBEditEh;
    BLR_edOtchDo: TDBEditEh;
    BLR_edFamiliaPosle: TDBEditEh;
    BLR_edNamePosle: TDBEditEh;
    BLR_edOtchPosle: TDBEditEh;
    BLR_edON_Familia: TDBEditEh;
    BLR_edON_Name: TDBEditEh;
    BLR_edON_Otch: TDBEditEh;
    BLR_edONA_Familia: TDBEditEh;
    BLR_edONA_Name: TDBEditEh;
    BLR_edONA_Otch: TDBEditEh;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    procedure lbLichGetText(Sender: TObject; var Text: String);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure TBItemClearLichClick(Sender: TObject);
    procedure edOsnovChange(Sender: TObject);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edFamiliaDoCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
    procedure edRukovEnter(Sender: TObject);
    procedure btPadegClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edIzvechEnter(Sender: TObject);
    procedure edOBLNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
    procedure edRAIONNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edONA_FamiliaEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure btAktRogdClick(Sender: TObject);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure edON_M_OBLNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edONA_M_OBLNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edON_M_RAIONNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edONA_M_RAIONNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edSPECEnter(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSPECEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    FIDAktRogd : Integer;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
    function BeforeEdit: Boolean; override;
    function CreateSubMenuRun: Boolean; override;

    //    function GetNameReport : String; override;
    procedure UpdateActions; override;
    constructor Create(Owner : TComponent); override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure ChoiceOtec;
    function CheckFIO: String; override;
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;

  end;

  function EditZapisUstMat( nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;

var
  fmZapisUstMat: TfmZapisUstMat;

implementation

uses fMain, fChoiceNasel, fZapisRogd, fShablon;

{$R *.DFM}
{$I Task.inc}

function EditZapisUstMat( nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;
begin
//  result := true;
  fmZapisUstMat := TfmZapisUstMat.Create(nil);
  fmZapisUstMat.IsCreateForm:=false;
  fmZapisUstMat.AssignPar(slPar);
  try
    fmZapisUstMat.IsReadDokument:=true;
    {$IFDEF ZAGS}
    if not lOnlyPovtor
      then fmZapisUstMat.TBItemSprAkt.Visible:=true;      // доступность получения справки о записи акта
    {$ENDIF}
    if nID=-1 then begin
      fmZapisUstMat.NewDok(true);
      fmZapisUstMat.SetIDZags;
      fmZapisUstMat.CheckEnabledNameOrgan(true);
    end else begin
      fmZapisUstMat.ReadDok( nID );
      fmZapisUstMat.TBItemZAGS.Visible:=false;
      fmZapisUstMat.CheckEnabledNameOrgan(false);
    end;
    fmZapisUstMat.IsReadDokument:=false;
    {$IFDEF GISUN}
      fmZapisUstMat.CheckAkt_GISUN(0);
//      Gisun.CheckUstMat(fmZapisUstMat);
//      fmZapisUstMat.CheckImageGisun(fmZapisUstMat.DokumentPOLE_GRN,fmZapisUstMat.ImageGISUN);
      fmZapisUstMat.BeforeEditFormGISUN;
    {$ENDIF}
    result := fmZapisUstMat.EditModal;
  finally
    fmZapisUstMat.Free;
    fmZapisUstMat := nil;
  end;
end;

{ TfmZapisUstMat }

constructor TfmZapisUstMat.Create(Owner: TComponent);
var
  n:Integer;
begin
  inherited;
  FIDAktRogd := 0;
  FDokZAGS := true;
  TypeObj := dmBase.TypeObj_ZUstMat;
  FUpdatingObj:=GetUpdatingObj(TypeObj);
  FCheckLookupField:=false;

//  if FPrintSpecSvid then begin
//    edRukov_Sv.DataField:='SPEC';
//    BLR_edRukov_Sv_B.DataField:='SPEC_B';
//  end;
  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';

  SetLength(FArrChoiceRekv,9);

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

  AddButton_LoadIdentif(ENG_edIDENTIF);
  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edONA_IDENTIF);

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisUstMat;
  Dokument.Open;
  dsGragd.DataSet := dmBase.SprGragd;
  edONA_Familia.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;
  edFamiliaDo.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;
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
  SetLength(FArrAddProperty,15);
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

  SetAddProperty(12, 'OTHER', '', ftMemo);
  SetAddProperty(13, 'IZMEN', '', ftMemo);
  SetAddProperty(14, 'RESHSUD', '', ftMemo);
  n:=15;
  {$IFDEF GISUN}
    // типы нас. пунктов в кодах ГИС РН
    SetLength(FArrAddProperty,n+4);
    SetAddProperty(n+0, 'RN_B_GOROD', '', ftString);
    SetAddProperty(n+1, 'RN_ONA_M_B_GOROD', '', ftString);
    SetAddProperty(n+2, 'RN_ONA_B_GOROD', '', ftString);
    SetAddProperty(n+3, 'RN_ON_M_B_GOROD', '', ftString);
//    SetAddProperty(n+4, 'RN_ON_B_GOROD', '', ftString);
  {$ENDIF}

  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;

  {$IFDEF ZAGS}
    edFamiliaDO.EditButtons.Items[0].Visible:=false;
    edON_Familia.EditButtons.Items[0].Visible:=false;
    edONA_Familia.EditButtons.Items[0].Visible:=false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
    edCopy.Visible := false;
    cbPovtor.Visible := false;
  {$ENDIF}

  edFamiliaDo.OnUpdateData:=FIOUpdateData;
  edNameDo.OnUpdateData:=FIOUpdateData;
  edOtchDo.OnUpdateData:=FIOUpdateData;

  edFamiliaPosle.OnUpdateData:=FIOUpdateData;
  edNamePosle.OnUpdateData:=FIOUpdateData;
  edOtchPosle.OnUpdateData:=FIOUpdateData;

  BLR_edFamiliaDo.OnUpdateData:=FIOUpdateData;
  BLR_edNameDo.OnUpdateData:=FIOUpdateData;
  BLR_edOtchDo.OnUpdateData:=FIOUpdateData;

  BLR_edFamiliaPosle.OnUpdateData:=FIOUpdateData;
  BLR_edNamePosle.OnUpdateData:=FIOUpdateData;
  BLR_edOtchPosle.OnUpdateData:=FIOUpdateData;

  edON_Familia.OnUpdateData:=FIOUpdateData;
  edON_Name.OnUpdateData:=FIOUpdateData;
  edON_Otch.OnUpdateData:=FIOUpdateData;

  edONA_Familia.OnUpdateData:=FIOUpdateData;
  edONA_Name.OnUpdateData:=FIOUpdateData;
  edONA_Otch.OnUpdateData:=FIOUpdateData;

  BLR_edON_Familia.OnUpdateData:=FIOUpdateData;
  BLR_edON_Name.OnUpdateData:=FIOUpdateData;
  BLR_edON_Otch.OnUpdateData:=FIOUpdateData;

  BLR_edONA_Familia.OnUpdateData:=FIOUpdateData;
  BLR_edONA_Name.OnUpdateData:=FIOUpdateData;
  BLR_edONA_Otch.OnUpdateData:=FIOUpdateData;

  SetcbBel(N_F_cbBelorus);


  edGOROD.OnUpdateData:=CityUpdate;
  edON_M_GOROD.OnUpdateData:=CityUpdate;
  edONA_M_GOROD.OnUpdateData:=CityUpdate;
  edONA_GOROD.OnUpdateData:=CityUpdate;

  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;
  {$IFDEF ZAGS}
    cbProvDvig.Visible := false;
    cbProvDvig.Checked := false;
  {$ELSE}
    if GlobalTask.ParamAsBoolean('AUTO_USTMAT') then begin
      cbProvDvig.Visible := true;
      cbProvDvig.Checked := true;
    end else begin
      cbProvDvig.Visible := false;
      cbProvDvig.Checked := false;
    end;
  //    edCopy.Visible := false;
  {$ENDIF}

  SetPanelPovtor(tsPovtor, cbPovtor,nil,nil);
  SetVisibleNomerEkz(pn, edDateSv, N_F_1);

  SetLength(FArrCheckField,6);
  WriteToArrCheck(0,  1, false, 'OBL');
  WriteToArrCheck(1,  2, false, 'RAION');
  WriteToArrCheck(2,  1, false, 'ON_OBL');
  WriteToArrCheck(3,  2, false, 'ON_RAION');
  WriteToArrCheck(4,  1, false, 'ONA_OBL');
  WriteToArrCheck(5,  2, false, 'ONA_RAION');

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

  edON_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;  // utypes.pas
  edON_DOK_TYPE.DropDownBox.Width:=TYPEDOK_WIDTH;  // utypes.pas

end;
{
function TfmZapisUstMat.GetNameReport: String;
begin
  Result := '&Запись акта о материнстве.frf';
end;
}
function TfmZapisUstMat.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_ZUstMat); //
end;
{
procedure TfmZapisUstMat.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
function TfmZapisUstMat.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  DokumentFIRST_EKZ.AsBoolean:=true;
  DokumentPOL.AsString:='М';

  DokumentB_RESP.AsBoolean:=false;   // после отправки в ГИС РН корректировались определенные реквизиты

  DokumentB_OBL.AsBoolean:=true;
  DokumentON_B_OBL.AsBoolean:=true;
  DokumentONA_B_OBL.AsBoolean:=true;
  DokumentON_M_B_OBL.AsBoolean:=true;
  DokumentONA_M_B_OBL.AsBoolean:=true;

  DokumentB_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_M_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_M_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');

  //--------- т.к. в основании уст. материнства пока только решение суда ----------
  DokumentOsnov.AsString:='2';  // решение суда
  lbOsnov.Caption := 'Дата решения суда';
  edOsnov.Enabled:=false;
  //-------------------------------------------------------------------------------

  DokumentPROV.AsBoolean := false;
  N_F_cbBelorus.Checked:=False;
  inherited NewDok(lAppend);
  QueryExit:=false;
  Result := true;
end;

function TfmZapisUstMat.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
//  arr : TArrStrings;
//  sl  : TStringList;
begin
  Result := inherited ReadDok(nID);
  if not dmBase.tbZapisUstMat.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbZapisUstMat.FieldCount-1 do begin
    strField := dmBase.tbZapisUstMat.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.tbZapisUstMat.Fields[i]);
    end;
  end;
  SetIDZags;

  ReadDopProperty(dmBase.TypeObj_ZUstMat, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));

  DokumentCOPIA.AsBoolean:=false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;

  CheckCaretDokument(DokumentON_DOK_NOMER,DokumentON_DOKUMENT);
  CheckCaretDokument(DokumentONA_DOK_NOMER,DokumentONA_DOKUMENT);

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;
  ReadHistory(nID, dmBase.TypeObj_ZUstMat);

end;

function TfmZapisUstMat.BeforeEdit: Boolean;
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
  SetMRUList(edON_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edONA_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edONA_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_M_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_M_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_M_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_M_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_RAION,n,2,true,false,false,FAddButtonMRUList);

end;

function TfmZapisUstMat.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr : String;
  {$IFNDEF ZAGS}
  vKeyValues : Variant;
  dLastSost : TDateTime;
  nIdChild : Integer;
  s : String;
  {$ENDIF}
begin
  PostDataSet(Dokument);
  AdditiveBeforeWriteDok;

  EditDataSet(Dokument);
  WriteOtherData(Dokument, 'OTHER', 'RUKOV_D;SPEC_D');
  PostDataSet(Dokument);

  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
  if DokumentDATEZ.IsNull then begin
    strErr := ' Заполните дату акта об установлении отцовства. ';
  end else if DokumentNOMER.AsString='' then begin
    strErr := ' Заполните номер акта об установлении отцовства. ';
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства об установлении отцовства. ';
  end else if DokumentDATER.AsString='' then begin
    strErr := ' Заполните дату рождения. ';
  end else if DokumentPOL.AsString='' then begin
    strErr := ' Заполните пол. ';
  end else if (DokumentFAMILIAPosle.AsString='') or (DokumentNAMEPosle.AsString='') or
              (DokumentOTCHPosle.AsString='')then begin
    strErr := ' Заполните Фамилию, Имя, Отчество после установления отцовства. ';
  end;
  if (strErr='') then begin
     Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZUstMat, DokumentID_ZAGS.AsInteger,
                    DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime);
     if not Result then exit;
  end;
//  if strErr=''
//    then strErr := CheckSvid(dmBase.TypeObj_ZUstMat, 'DATESV','SVID_SERIA','SVID_NOMER', strBookMark);
  if strErr<>'' then begin
    PutError(strErr);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbZapisUstMat.Append;
    dmBase.tbZapisUstMat.Post;
    nID := dmBase.tbZapisUstMat.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.tbZapisUstMat.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    FCheckEditGIS:=CheckDateEditGIS;  // функция д.б. своя для каждого типа документа !!!

    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
//    AddEditSvid(strBookMark);
    dmBase.tbZapisUstMat.Edit;
    for i:=1 to dmBase.tbZapisUstMat.FieldCount-1 do begin
      strField := dmBase.tbZapisUstMat.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.tbZapisUstMat.Fields[i].Value := fld.Value;
      end;
    end;

    WriteDopProperty(dmBase.TypeObj_ZUstMat, DokumentID.AsInteger,
                      STOD('1899-12-30',tdAds));

    WriteHistory(nID, dmBase.TypeObj_ZUstMat);

    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    if not FPrintSpecSvid
      then dmBase.tbZapisUstMat.FieldByName('SPEC_B').AsString:='';

    WriteDateIzm;
    WriteForAllDok_BeforePost;
    if dmBase.tbZapisUstMat.FieldByName('B_RESP').AsBoolean=false
      then dmBase.tbZapisUstMat.FieldByName('B_RESP').AsBoolean:=FCheckEditGIS;

    dmBase.tbZapisUstMat.Post;

    AdditiveWriteDok;

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

procedure TfmZapisUstMat.lbLichGetText(Sender: TObject; var Text: String);
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

procedure TfmZapisUstMat.dsDokumentDataChange(Sender: TObject;
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
//        if DokumentNameDo_B.AsString='' then begin
          DokumentNameDo_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
          lCheck := true;
//        end;
      end else if strField='OTCHDO' then begin
//        if DokumentOtchDo_B.AsString='' then begin
          DokumentOtchDo_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
          lCheck := true;
//        end;
      end else if strField='NAMEPOSLE' then begin
//        if DokumentNamePosle_B.AsString='' then begin
          DokumentNamePosle_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
          lCheck := true;
//        end;
      end else if strField='OTCHPOSLE' then begin
//        if DokumentOtchPosle_B.AsString='' then begin
          DokumentOtchPosle_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
          lCheck := true;
//        end;
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
      end else if strField='FAMILIADO' then begin
//        if DokumentFamiliaDo_B.AsString='' then begin
          DokumentFamiliaDo_B.AsString := dmBase.GetBelFamily( Field.AsString );
//        end;
      end else if strField='FAMILIAPOSLE' then begin
//        if DokumentFamiliaPosle_B.AsString='' then begin
          DokumentFamiliaPosle_B.AsString := dmBase.GetBelFamily( Field.AsString );
//        end;
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

procedure TfmZapisUstMat.TBItemClearLichClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentLICH_ID.AsString := '';
  PostDataSet(Dokument);
end;

procedure TfmZapisUstMat.UpdateActions;
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
    TBItemDolg.Enabled := edCopy.Checked;
  {$ENDIF}
  btAktRogd.Enabled := (FIDAktRogd>0);
end;


procedure TfmZapisUstMat.edOsnovChange(Sender: TObject);
begin
{
  if edOsnov.ItemIndex>-1 then begin
    if edOsnov.ItemIndex=0 then begin
      lbOsnov.Caption := 'Дата заявления родителей';
      edDateDecl.Enabled := true;
      edReshSud.Enabled  := false;
    end else begin
    lbOsnov.Caption := 'Дата решения суда';
      edDateDecl.Enabled := true;
      edReshSud.Enabled  := true;
    end;
  end else begin
    lbOsnov.Caption := 'Дата заявления родителей (решения суда)';
    edDateDecl.Enabled := false;
    edReshSud.Enabled  := false;
  end;
}
end;

procedure TfmZapisUstMat.N_F_cbBelorusClick(Sender: TObject);
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

procedure TfmZapisUstMat.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

{
procedure TfmZapisUstMat.edFamiliaDoEnter(Sender: TObject);
begin if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaDo,DokumentFamiliaDo.AsString+' '); end;
procedure TfmZapisUstMat.edNameDoEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edNameDo,DokumentNameDo.AsString+' '); end;
procedure TfmZapisUstMat.edOtchDoEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edOtchDo,DokumentOtchDo.AsString+' '); end;

procedure TfmZapisUstMat.edFamiliaPosleEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaPosle,DokumentFamiliaPosle.AsString+' '); end;
procedure TfmZapisUstMat.edNamePosleEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edNamePosle,DokumentNamePosle.AsString+' '); end;
procedure TfmZapisUstMat.edOtchPosleEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edOtchPosle,DokumentOtchPosle.AsString+' '); end;

procedure TfmZapisUstMat.edON_FamiliaEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edON_Familia,DokumentON_Familia.AsString+' '); end;
procedure TfmZapisUstMat.edON_NameEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edON_Name,DokumentON_Name.AsString+' '); end;
procedure TfmZapisUstMat.edON_OTCHEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edON_OTCH,DokumentON_OTCH.AsString+' '); end;

procedure TfmZapisUstMat.edONA_FamiliaEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Familia,DokumentONA_Familia.AsString+' '); end;
procedure TfmZapisUstMat.edONA_NameEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Name,DokumentONA_Name.AsString+' '); end;
procedure TfmZapisUstMat.edONA_OTCHEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edONA_OTCH,DokumentONA_OTCH.AsString+' '); end;
}
procedure TfmZapisUstMat.edFamiliaDoCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
//  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmZapisUstMat.edRukovEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

procedure TfmZapisUstMat.btPadegClick(Sender: TObject);
begin
//  if EditPadegUstMat( Dokument ) then begin
//    QueryExit := true;
//  end;
end;

procedure TfmZapisUstMat.Button1Click(Sender: TObject);
begin
  edZAMETKA.AutoSelect:=false;
  edZAMETKA.Value := edZAMETKA.Value + '#';
  ActiveControl := edZAMETKA;
  edZAMETKA.SelStart := Length(edZAMETKA.Value);
  edZAMETKA.SelLength:= 1;
end;

procedure TfmZapisUstMat.edIzvechEnter(Sender: TObject);
begin
  if DokumentAdresIzvech.AsString='' then begin
    Dokument.CheckBrowseMode;
    Dokument.Edit;
    DokumentAdresIzvech.AsString := GlobalTask.ParamAsString('ADRES_IZVECH');
  end;
end;

procedure TfmZapisUstMat.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  AddSvid;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisUstMat.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisUstMat.edOBLNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisUstMat.edRAIONNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;


procedure TfmZapisUstMat.ChoiceOtec;
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ROGD');
  if Opis<>nil then begin
    if edONA_Familia.Text<>'' then begin
      Opis.DataSet.Filter := 'ONA_FAMILIA='+QStr(edONA_Familia.Text);
    end;
    Opis.DataSet.Filtered := true;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edONA_Familia, v, arrRec, nil) and (v<>null) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      FIDAktRogd := v;
      {
      v := GetValueField(arrRec, 'ON_FAMILIA');
      if v = null then DokumentON_FAMILIA.AsString := '' else DokumentON_FAMILIA.AsString := v;
      v := GetValueField(arrRec, 'ON_NAME');
      if v = null then DokumentON_NAME.AsString := '' else DokumentON_NAME.AsString := v;
      v := GetValueField(arrRec, 'ON_OTCH');
      if v = null then DokumentON_OTCH.AsString := '' else DokumentON_OTCH.AsString := v;
      v := GetValueField(arrRec, 'ON_DATER');
      if v = null then DokumentON_DateR.AsString := '' else DokumentON_DateR.Value    := v;
      v := GetValueField(arrRec, 'ON_NATION');
      if v = null then DokumentON_NATION.AsInteger:= 0 else DokumentON_NATION.Value    := v;
      v := GetValueField(arrRec, 'ON_GRAG');
      if v = null then DokumentON_GRAG.AsInteger:= 0 else DokumentON_GRAG.Value    := v;
      v := GetValueField(arrRec, 'ON_OBRAZ');
      if v = null then DokumentON_OBRAZ.AsString := '' else DokumentON_OBRAZ.Value    := v;
      v := GetValueField(arrRec, 'ON_DOKUMENT');
      if v = null then DokumentON_DOKUMENT.AsString := '' else DokumentON_DOKUMENT.Value    := v;
      v := GetValueField(arrRec, 'ON_GOSUD');
      if v = null then DokumentON_GOSUD.AsString := '' else DokumentON_GOSUD.Value    := v;
      v := GetValueField(arrRec, 'ON_OBL');
      if v = null then DokumentON_OBL.AsString := ''  else DokumentON_OBL.Value    := v;
      v := GetValueField(arrRec, 'ON_RAION');
      if v = null then DokumentON_RAION.AsString := '' else DokumentON_RAION.Value    := v;
      v := GetValueField(arrRec, 'ON_GOROD');
      if v = null then DokumentON_GOROD.AsString := '' else DokumentON_GOROD.Value    := v;
      v := GetValueField(arrRec, 'ON_GOROD_R');
      if v = null then DokumentON_GOROD_R.AsString := '' else DokumentON_GOROD_R.Value    := v;
      v := GetValueField(arrRec, 'ON_WORK');
      if v = null then DokumentON_WORK.AsString := '' else DokumentON_WORK.Value    := v;
      v := GetValueField(arrRec, 'ON_B_OBL');
      if v = null then DokumentON_B_OBL.AsString := '' else DokumentON_B_OBL.Value    := v;
      v := GetValueField(arrRec, 'ON_B_GOROD');
      if v = null then DokumentON_B_GOROD.AsString := '' else DokumentON_B_GOROD.Value    := v;
      }
      v := GetValueField(arrRec, 'ONA_FAMILIA');
      if v = null then DokumentONA_FAMILIA.AsString := '' else DokumentONA_FAMILIA.AsString := v;
      v := GetValueField(arrRec, 'ONA_NAME');
      if v = null then DokumentONA_NAME.AsString := '' else DokumentONA_NAME.AsString := v;
      v := GetValueField(arrRec, 'ONA_OTCH');
      if v = null then DokumentONA_OTCH.AsString := '' else DokumentONA_OTCH.AsString := v;
      v := GetValueField(arrRec, 'ONA_DATER');
      if v = null then DokumentONA_DateR.AsString := '' else DokumentONA_DateR.Value    := v;
      v := GetValueField(arrRec, 'ONA_NATION');
      if v = null then DokumentONA_NATION.AsInteger:= 0 else DokumentONA_NATION.Value    := v;
      v := GetValueField(arrRec, 'ONA_GRAG');
      if v = null then DokumentONA_GRAG.AsInteger:= 0 else DokumentONA_GRAG.Value    := v;
      v := GetValueField(arrRec, 'ONA_DOKUMENT');
      if v = null then DokumentONA_DOKUMENT.AsString := '' else DokumentONA_DOKUMENT.Value    := v;
      v := GetValueField(arrRec, 'ONA_GOSUD');
      if v = null then DokumentONA_GOSUD.AsString := '' else DokumentONA_GOSUD.Value    := v;
      v := GetValueField(arrRec, 'ONA_OBL');
      if v = null then DokumentONA_OBL.AsString := ''  else DokumentONA_OBL.Value    := v;

      v := GetValueField(arrRec, 'ONA_B_RN');
      if (v=null) or (v=true) then begin
        v := GetValueField(arrRec, 'ONA_RAION');
        if v = null then DokumentONA_RAION.AsString := '' else DokumentONA_RAION.Value    := v;
      end;

      v := GetValueField(arrRec, 'ONA_GOROD');
      if v = null then DokumentONA_GOROD.AsString := '' else DokumentONA_GOROD.Value    := v;
      v := GetValueField(arrRec, 'ONA_GOROD_R');
      if v = null then DokumentONA_GOROD_R.AsString := '' else DokumentONA_GOROD_R.Value    := v;
      v := GetValueField(arrRec, 'ONA_B_OBL');
      if v = null then DokumentONA_B_OBL.AsString := '' else DokumentONA_B_OBL.Value    := v;
      v := GetValueField(arrRec, 'ONA_B_GOROD');
      if v = null then DokumentONA_B_GOROD.AsString := '' else DokumentONA_B_GOROD.Value    := v;


      PostDataSet(Dokument);
      Screen.Cursor := old;
    end;
    Opis.DataSet.Filter   := '';
    Opis.DataSet.Filtered := false;
  end;
end;

procedure TfmZapisUstMat.edONA_FamiliaEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
  ChoiceOtec;
end;

procedure TfmZapisUstMat.btAktRogdClick(Sender: TObject);
begin
  if FIDAktRogd>0 then begin
    EditZapisRogd( FIDAktRogd, Dokument, false, nil );
    SetCurDok(Self);
  end;
end;

procedure TfmZapisUstMat.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then
    N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
end;

procedure TfmZapisUstMat.edON_M_OBLNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisUstMat.edONA_M_OBLNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisUstMat.edON_M_RAIONNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisUstMat.edONA_M_RAIONNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisUstMat.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
{$ENDIF}
end;

procedure TfmZapisUstMat.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
{$ENDIF}
end;

procedure TfmZapisUstMat.edSPECEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edSpec,DokumentSPEC.AsString+' '); end;

procedure TfmZapisUstMat.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;
procedure TfmZapisUstMat.edSPECEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

//------------------------------------------------------------
function TfmZapisUstMat.CheckFIO: String;
begin
  Result:=CheckOneFIO('До установления: ',DokumentFamiliaDo.AsString, DokumentNameDo.AsString, DokumentOtchDo.AsString);
  if Result='' then begin
    Result:=CheckOneFIO('После установления: ',DokumentFamiliaPosle.AsString, DokumentNamePosle.AsString, DokumentOtchPosle.AsString);
  end;
end;

function TfmZapisUstMat.CreateSubMenuRun: Boolean;
begin
  inherited CreateSubmenuRun;
  Result:=true;
  AddSubmenu_ReadDolg;
end;

function TfmZapisUstMat.CheckDateEditGIS: Boolean;
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
     (DokumentFamiliaPosle_B.AsString<>FMainTable.FieldByName('FamiliaPosle_B').AsString) or
     (DokumentNamePosle_B.AsString<>FMainTable.FieldByName('NamePosle_B').AsString) or
     (DokumentOtchPosle_B.AsString<>FMainTable.FieldByName('OtchPosle_B').AsString) or
     (DokumentFamiliaPosle.AsString<>FMainTable.FieldByName('FamiliaPosle').AsString) or
     (DokumentNamePosle.AsString<>FMainTable.FieldByName('NamePosle').AsString) or
     (DokumentOtchPosle.AsString<>FMainTable.FieldByName('OtchPosle').AsString) or
     (DokumentON_IDENTIF.AsString<>FMainTable.FieldByName('ON_IDENTIF').AsString) or
     (DokumentONA_IDENTIF.AsString<>FMainTable.FieldByName('ONA_IDENTIF').AsString)
    then Result:=true
    else Result:=false;
  end;  
end;
//-----------------------------------------------------------
procedure TfmZapisUstMat.WriteAfterRegister_GISUN;
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
