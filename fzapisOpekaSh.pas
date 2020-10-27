unit fZapisOpekaSh;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, DateUtils, Graphics, Controls, Forms, Dialogs,uPadegFIO,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject,uTypes, FuncEh,
  ExtCtrls, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, dBase, funcPr, dbFunc, uDataSet2XML, fChoiceGIS_Class,
  MetaTAsk, OpisEdit, vchDBCtrls, FR_DSet, FR_DBSet, DBCtrls, Grids, uProjectAll,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, fGetGISUN1, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  DBGridEh, TB2ExtItems, Buttons, ImgList, kbmMemCSVStreamFormat, ZipForge;

type

  TfmZapisOpekaSh = class(TfmSimpleD)
    pn: TPanel;
    dsNation: TDataSource;
    dsStran: TDataSource;
    TBItemClearLich: TTBItem;
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
    DokumentIDENTIF: TStringField;
    DokumentRN_B_GOROD_DO: TStringField;
    DokumentRN_ON_B_GOROD: TStringField;
    DokumentRN_MAT_B_GOROD: TStringField;
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
    DokumentOTEC_WORK: TStringField;
    DokumentMAT_WORK: TStringField;
    DokumentON_POL: TStringField;
    DokumentSTUDENT: TSmallintField;
    DokumentSTUDENT_TYPE: TSmallintField;
    DokumentSTUDENT_SPR: TIntegerField;
    DokumentKURS: TSmallintField;
    DokumentGT_RNGOROD: TStringField;
    DokumentGT_B_OBL: TBooleanField;
    dsStudentSpr: TDataSource;
    DokumentPRICH_UST: TMemoField;
    DokumentRN_GT_B_GOROD: TStringField;
    edDateUst: TDBDateTimeEditEh;
    Label69: TLabel;
    edNomerUst: TDBEditEh;
    edDateOtm: TDBDateTimeEditEh;
    Label71: TLabel;
    edNomerOtm: TDBEditEh;
    Label74: TLabel;
    DokumentDATE_OTST: TDateField;
    DokumentOTMETKA: TMemoField;
    DokumentPLACE_WORK: TStringField;
    DokumentNOMER_PR: TStringField;
    DokumentPRICH_OTST: TMemoField;
    DokumentNOMER_OTST: TStringField;
    TBSeparatorItem1: TTBSeparatorItem;
    DokumentREG_UST: TBooleanField;
    DokumentREG_OTM: TBooleanField;
    DokumentREG_OTST: TBooleanField;
    DokumentINTERNAT: TIntegerField;
    DokumentINTERNAT_DATE: TDateField;
    DokumentLONELY: TBooleanField;
    dsInternat: TDataSource;
    DokumentTWO: TBooleanField;
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
    DokumentREG_OSV: TBooleanField;
    TBItemStep2: TTBItem;
    DokumentKOMM: TMemoField;
    TBItemChOpeka: TTBItem;
    dsReshSud: TDataSource;
    dsSprChildPrich: TDataSource;
    Bevel2: TBevel;
    DokumentUST_ORG: TStringField;
    DokumentUST_OTHER: TBooleanField;
    DokumentDOC_OPEKA: TIntegerField;
    N_F_edDocOpeka: TDBComboBoxEh;
    DokumentUST_ORG_SPR: TStringField;
    edUstOrg: TDBEditEh;
    DokumentUST_ORG_TYPE: TIntegerField;
    DokumentIS_MINTRUD: TBooleanField;
    DokumentIS_CONTROL: TBooleanField;
    TBItemCreatePopech18: TTBItem;
    edOtmOrg: TDBEditEh;
    N_F_edDocOpekaO: TDBComboBoxEh;
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
    DokumentVERNO: TBooleanField;
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
    lbOtnosh: TLabel;
    Label10: TLabel;
    edON_Familia: TDBEditEh;
    edON_Name: TDBEditEh;
    edON_OTCH: TDBEditEh;
    edON_DATER: TDBDateTimeEditEh;
    edON_GOSUD: TDBLookupComboboxEh;
    edON_GOROD: TDBEditEh;
    edON_GRAG: TDBLookupComboboxEh;
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
    edOtnosh: TDBEditEh;
    edON_POL: TDBComboBoxEh;
    N_F_cbDel: TDBCheckBoxEh;
    N_F_cbAdd: TDBCheckBoxEh;
    Label1: TLabel;
    N_F__LabelClose: TLabel;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edOBL_RNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edRaion_RNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2ustClick(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edMAT_FAMILIAEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edStudentSprEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edTipChange(Sender: TObject);
    procedure edVidChange(Sender: TObject);
    procedure TBItemStep2otmClick(Sender: TObject);
    procedure TBItemStep2otstClick(Sender: TObject);
    procedure cbTwoClick(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
    procedure GridRSGetCellParams(Sender: TObject; Column: TColumnEh;   AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure lbDateEditGISGetText(Sender: TObject; var Text: String);
    procedure lbDatePostGISGetText(Sender: TObject; var Text: String);
    procedure edUstOrgEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edUstOrgEditButtons1Click(Sender: TObject;    var Handled: Boolean);
    procedure edUstOrgEditButtons2Click(Sender: TObject;    var Handled: Boolean);
    procedure edUstOrgEditButtons3Click(Sender: TObject;    var Handled: Boolean);
    procedure TBItemCreatePopech18Click(Sender: TObject);
    procedure GisunCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
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
    procedure lbDokToTextGetText(Sender: TObject; var Text: String);
    procedure N_F_cbDelClick(Sender: TObject);
    procedure N_F_cbAddClick(Sender: TObject);
    procedure TBItemGetDataGISUNClick(Sender: TObject);
    procedure N_F_edTypeSnCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
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
    procedure LoadFromIni;  override;
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
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет пол€ отправл€емые в регистр
    procedure CheckControl;
    function FieldForNomerDok(var fldDate:TField):TField;

    procedure InvalidateAllNomer;
    procedure CheckControlDok(nTypeSn:Integer);
    procedure ClearOrgOtm;
    procedure Event_InfoTrue(Sender: TObject);

    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;

  end;

  function EditShablonOpeka( var arrRec:TCurrentRecord; var lDel:Boolean; var lAdd:Boolean; slPar:TStringList) : Boolean;

var
  fmZapisOpekaSh: TfmZapisOpekaSh;

implementation

uses fMain, fChoiceNasel,
     {$IFDEF OPEKA} fChSS_Opeka, {$ENDIF}
     fShablon;

{$R *.DFM}
{$I Task.inc}

const
  MAX_REC=20;

function EditShablonOpeka( var arrRec:TCurrentRecord; var lDel:Boolean; var lAdd:Boolean; slPar:TStringList) : Boolean;
begin
//  Result := true;
  fmZapisOpekaSh := TfmZapisOpekaSh.Create(nil);
  fmZapisOpekaSh.AssignPar(slPar);
  try
    fmZapisOpekaSh.IsReadDokument:=true;
    fmZapisOpekaSh.NewDok(true);
    fmZapisOpekaSh.SetIDZags;
    fmZapisOpekaSh.IsReadDokument:=false;
    fmZapisOpekaSh.CheckCaption;
    fmZapisOpekaSh.N_F_cbDel.Checked:=true; // !!! всегда должно выполн€тьс€ прекращение !!!    lDel;
    fmZapisOpekaSh.N_F_cbAdd.Checked:=lAdd;
    fmZapisOpekaSh.N_F_cbDelClick(nil);
    fmZapisOpekaSh.N_F_cbAddClick(nil);
    if Length(arrRec)>0 then begin
      WriteCurrentRecord(fmZapisOpekaSh.Dokument, arrRec);
    end;
    Result:=fmZapisOpekaSh.EditModal;
    if Result then begin
      lDel:=true; // !!! всегда должно выполн€тьс€ прекращение !!!  fmZapisOpekaSh.N_F_cbDel.Checked;
      lAdd:=fmZapisOpekaSh.N_F_cbAdd.Checked;
      GetCurrentRecord(fmZapisOpekaSh.Dokument,'', arrRec);
    end;
  finally
    fmZapisOpekaSh.Free;
    fmZapisOpekaSh := nil;
  end;
end;

{ TfmZapisOpekaSh }

constructor TfmZapisOpekaSh.Create(Owner: TComponent);
var
  n:Integer;
  d2xml:TDataSet2XML;
begin
  inherited;
  if not Dokument.Active   then Dokument.Active:=true;
  if not tbReshSud.Active  then tbReshSud.Active:=true;
//  colorResh:=$00FEF9E7;
  colorResh:=clWindow;

  edUstOrg.EditButtons[edUstOrg.EditButtons.Count-1].Glyph:=ImBtClear.Picture.Bitmap;
  edOtmOrg.EditButtons[edUstOrg.EditButtons.Count-1].Glyph:=ImBtClear.Picture.Bitmap;

  FShowRequired:=true;  //Globaltask.ParamAsBoolean('SHOW_REQ');

  TypeRegistr:=0;
  edDateUst.Color:=colorResh;
  edDateOtm.Color:=colorResh;
  FShowOrgCaption:=false;
  FCheckLookupField:=false;   // так как все пол€ (область,район,город) переделаны на DbEditEh.MRUList;
  FDokZAGS:=false;
  FDokRegister:=true;
  TypeObj := _TypeObj_Opeka;

//  d2xml:=ds2xml.DS_Add(Dokument,true);
//  d2xml.FClearRecord:=false;
//  d2xml.FWriteNull:=false;
//  d2xml.SetWriteFields('VERNO');
  ds2xml.DS_Add(tbReshSud,false);

  SetLength(FArrChoiceRekv,2);
  n:=0;
  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_WORK;
  FArrChoiceRekv[n].FieldName:='ON_WORK';
  Inc(n,1);

  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[n].FieldName:='ON_GOROD_R';
//  SetLength(FArrChoiceRekv,n+1);

//  AddButton_LoadIdentif(ENG_edON_IDENTIF);

  FAutoNum := false; //IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisOpeka;
  Dokument.Open;
  dsGragd.DataSet := dmBase.SprGragd;
  FPageControl := nil;

  edON_Familia.OnUpdateData:=FIOUpdateData;
  edON_Name.OnUpdateData:=FIOUpdateData;
  edON_Otch.OnUpdateData:=FIOUpdateData;

  ENG_edOn_Identif.OnUpdateData:=IN_UpdateData;

  {$IFDEF GISUN}
//  if IsActiveGISUN then
//    SetControlCharCase(ecUpperCase,
//      [ edON_Familia, edON_Name, edON_Otch ]);
  {$ENDIF}

  edON_GOROD.OnUpdateData:=CityUpdate;

  SetLength(FArrAddProperty,0);
  SetLength(FArrCheckBelField,0);
  SetLength(FArrCheckField,0);
  FRegisterNotRequired:=true;  // доступно "взаимодействие с √»— –Ќ не требуетс€"
  AddSubmenu_NotRequired;

  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := false; //IsActiveGISUN;
    // з/а об усыновлении не проводитьс€ в регистре
    TBSubmenuGISUN.Visible:=false; //IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
//    CheckMenuGISUN;
    TBItemGetDataGISUN.Visible:=IsActiveGISUN;   // дл€ доступности запроса данных

    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
    TBItemGetDataGISUN.Visible:=false;
  {$ENDIF}
end;

procedure TfmZapisOpekaSh.LoadFromIni;
begin
  inherited;
  SetStrHelp('<F1> запросить <F2> сохранить шаблон');
end;

function TfmZapisOpekaSh.CreateSubMenuRun: Boolean;
begin
  Result:=false; //inherited;
end;

procedure TfmZapisOpekaSh.Event_InfoTrue(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  DokumentVERNO.AsBoolean:=TTbItem(Sender).Checked;
end;

function TfmZapisOpekaSh.GetVid: String;
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

function TfmZapisOpekaSh.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentPOVTOR.AsBoolean:=false;
  DokumentTWO.AsBoolean :=false;
  DokumentFIRST_EKZ.AsBoolean:=true;
  DokumentPOL.AsString:='ћ';
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

//  inherited NewDok(lAppend);

  CheckControl;
  QueryExit:=false;
  Result := true;
end;

function TfmZapisOpekaSh.ReadDok(nID: Integer): Boolean;
var
  i,nType : Integer;
  fld : TField;
  strField : String;
  rSpr:TRecSprGISUN;
//  arr : TArrStrings;
//  sl  : TStringList;
begin
  Result := true;
end;

//----------------------------------------------
procedure TfmZapisOpekaSh.WriteReg;
begin
end;
//----------------------------------------------
function TfmZapisOpekaSh.CheckDateEditGIS:Boolean;
begin
  Result:=false;
end;
//----------------------------------------------
function TfmZapisOpekaSh.WriteDok: Boolean;
var
  strErr:String;
  procedure AddErr(s:String); begin  strErr:=strErr+s+chr(13)+chr(10); end;
begin
  PostDataSet(Dokument);
  Result := true;
  strErr:='';
  if not N_F_cbDel.Checked and not N_F_cbAdd.Checked then begin
    AddErr('’от€ бы одно действие должно быть активно');
  end;
  if N_F_cbDel.Checked then begin
    if DokumentTYPE_SN.IsNull or DokumentDATE_OTM.IsNull or DokumentDOC_OPEKA_OTM.IsNull
      then AddErr('«аполните об€зательные реквизиты прекращени€');
  end;
  if N_F_cbAdd.Checked then begin
    if DokumentDATEZ.IsNull or DokumentDOC_OPEKA.IsNull or (DokumentON_Familia.AsString='') or
       (DokumentON_Name.AsString='') or (DokumentON_Otch.AsString='') or (DokumentON_IDENTIF.AsString='')
      then AddErr('«аполните об€зательные реквизиты установки опеки');
  end;
  if strErr<>'' then begin
    Result:=false;
    PutError(strErr,self);
  end else begin
    QueryExit:=false;
  end;
end;

procedure TfmZapisOpekaSh.WriteAfterRegister_GISUN;
begin
end;

procedure TfmZapisOpekaSh.dsDokumentDataChange(Sender: TObject;  Field: TField);
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
procedure TfmZapisOpekaSh.UpdateActions;
begin
  inherited;
end;

procedure TfmZapisOpekaSh.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

destructor TfmZapisOpekaSh.Destroy;
begin
  try
    dmBase.AllSprGISUN.CancelRange;
  except
  end;
  DestroyHint(H);
  inherited;
end;

procedure TfmZapisOpekaSh.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZapisOpekaSh.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZapisOpekaSh.edOBL_RNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisOpekaSh.edRaion_RNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisOpekaSh.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
{$ENDIF}
end;

procedure TfmZapisOpekaSh.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  Dokument.CheckBrowseMode;
//  if DokumentDATEZ.IsNull щк then begin
//    PutError('«аполните дату установлени€',self);
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

procedure TfmZapisOpekaSh.TBItemStep2ustClick(Sender: TObject);
begin
{$IFDEF GISUN}
  Dokument.CheckBrowseMode;
  if DokumentDATEZ.IsNull then begin
    PutError('«аполните дату установлени€',self);
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

procedure TfmZapisOpekaSh.TBItemStep2otmClick(Sender: TObject);
begin
{$IFDEF GISUN}
  Dokument.CheckBrowseMode;
  if DokumentDATE_OTM.IsNull then begin
    PutError('«аполните дату прекращени€',self);
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

procedure TfmZapisOpekaSh.TBItemStep2otstClick(Sender: TObject);
begin
{$IFDEF GISUN}
  Dokument.CheckBrowseMode;
  if DokumentDATE_OTST.IsNull then begin
    PutError('«аполните дату отстранени€',self);
  end else begin
    TypeRegistr:=3;   // !!!
    try
      RegisterAkt_GISUN(0);
    finally
      TypeRegistr:=0;
    end;
  end;
{$ENDIF}
end;

procedure TfmZapisOpekaSh.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 13);
end;

procedure TfmZapisOpekaSh.edMAT_FAMILIAEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
//
end;


//----------------------------------------------------------------------------------
procedure TfmZapisOpekaSh.CheckValueSvid;
begin
end;

function TfmZapisOpekaSh.BeforeReport: Boolean;
begin
  Result:=inherited BeforeReport;
  if Result then begin
    CheckForAll_Bel( nil );
    CheckValueSvid;
  end;
end;

//------------------------------------------------------------------------
procedure TfmZapisOpekaSh.CheckControl;
begin
  pnAdd.Visible:=false; // CheckAddPanel('');
end;

procedure TfmZapisOpekaSh.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
//  ChoiceSpecD(edSpec);
end;

procedure TfmZapisOpekaSh.edStudentSprEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
end;

//-----------------------------------------------------
procedure TfmZapisOpekaSh.edVidChange(Sender: TObject);
begin
end;
//----------------------------------------------------------
procedure TfmZapisOpekaSh.edTipChange(Sender: TObject);
begin
end;
//-----------------------------------------------------
function TfmZapisOpekaSh.GetAddPROP(sProp: String): Variant;
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
function TfmZapisOpekaSh.GetTypeOpeka(var lNotD:Boolean; var lChild:Boolean): Integer;
//var
//  n:Integer;
begin
//  lNotD:=false;
//  lChild:=true;
  Result:=0;
  {
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
  }
end;
//-----------------------------------------------------
function TfmZapisOpekaSh.GetTypeDate:Integer;
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
        1: Result:=Result+2;     // дата прекращени€
        2: Result:=Result+4;     // дата освобождени€
        3: Result:=Result+8;     // дата отстранени€
      end;
    end else begin
      if not DokumentUST_OTHER.AsBoolean and
         not DokumentDATEZ.IsNull
        then Result:=Result+1;   // дата установлени€
    end;
  end else begin
    Result:=TypeRegistr;
  end;
end;

const
  s1='«арегистрировать установление';
  s2='«арегистрировать прекращение';
  s3='«арегистрировать отстранение';

  //-----------------------------------------------------
procedure TfmZapisOpekaSh.CheckCaption;
begin
end;

function TfmZapisOpekaSh.BeforeEdit: Boolean;
var
  n:Integer;
  s:String;
begin
  Result := inherited BeforeEdit;
// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edON_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edON_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edON_RAION,n,2,true,false,false,FAddButtonMRUList);

  TBToolbar.BeginUpdate;
  for n:=0 to TBToolbar.Items.Count-1 do begin
    TBToolbar.Items.Visible:=false;
  end;                         
  TBItemWrite.Visible:=true;
  TBItemCancel.Visible:=true;
  TBToolbar.EndUpdate;
end;

procedure TfmZapisOpekaSh.cbTwoClick(Sender: TObject);
begin
end;

//----------------------------------------------------------------
{
procedure TfmZapisOpekaSh.TBItemChOpekaClick(Sender: TObject);
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
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_OPEKA');
  if Opis<>nil then begin
    ParamFlt:=CreateParamFlt(edFamilia.Text,'FAMILIA');
    if ParamFlt<>nil then Opis.AutoFilter:=true;

    Params:=TParamsEditSpr.Create;
    Params.FreeOnExitSpr:=true;
    Params.GetCellParams_Col1:=Event_GridColumnsGetPoleGrn;
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
        PostDataSet(Dokument);

        FAddNewDok:=true;
        CheckControl;

        try
          EditDataSet(Dokument);
          for i:=Low(arrFld) to High(arrFld) do
            Dokument.FieldByName(arrFld[i]).AsString:=arrVal[i];
          PostDataSet(Dokument);
        except
        end;

        Dokument.CheckBrowseMode;
        IsReadDokument:=false;
      finally
        Screen.Cursor := old;
        FRun:=false;
        dbEnableControls(Dokument,lCheck);
      end;
    end;
  end;
end;
}
procedure TfmZapisOpekaSh.cbTypeChange(Sender: TObject);
begin
end;
//---------------------------------------------------
procedure TfmZapisOpekaSh.GridRSGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not tbReshSudCANCEL.IsNull and (tbReshSudCANCEL.AsBoolean=false)
    then AFont.Color:=clRed;
end;
//---------------------------------------------------
procedure TfmZapisOpekaSh.lbDateEditGISGetText(Sender: TObject;  var Text: String);
begin
  Text:='';
  if not DokumentDATE_EDIT_GIS.IsNull and not DokumentDATE_POST_GIS.IsNull and
     (DokumentDATE_EDIT_GIS.AsDateTime > DokumentDATE_POST_GIS.AsDateTime) then begin
    Text:='ƒата корректировки: '+FormatDateTime('dd.mm.yyyy hh:nn',DokumentDATE_EDIT_GIS.AsDateTime)+',  '+
          'дата регистрации: '+FormatDateTime('dd.mm.yyyy hh:nn',DokumentDATE_POST_GIS.AsDateTime);
  end;
end;
//---------------------------------------------------
procedure TfmZapisOpekaSh.lbDatePostGISGetText(Sender: TObject; var Text: String);
begin
  if DokumentDATE_POST_GIS.IsNull
    then Text:=''
    else Text:=FormatDateTime('dd.mm.yyyy hh:nn',DokumentDATE_POST_GIS.AsDateTime);
end;
//-----------------------------------------------------
function TfmZapisOpekaSh.DokumentToText:String;
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
    Result:=N_F_edDocOpeka.Text+' об установлении опеки є'+s1+' от '+s2+' '+s3;
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
    Result:=N_F_edDocOpekaO.Text+' '+s0+' опеки є'+s1+' от '+s2+' '+s3;
  end;
end;
procedure TfmZapisOpekaSh.lbDokToTextGetText(Sender: TObject;  var Text: String);
begin
end;

//============== CheckDrawRequired ==============
procedure TfmZapisOpekaSh.edDateOtmCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
begin
end;

//----------------------------------------------
procedure TfmZapisOpekaSh.GisunCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
  if FShowRequired
    then DrawState:=true;
end;

//---------------------------------
procedure TfmZapisOpekaSh.edOtmOrgCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
end;
//-----------------------------------
procedure TfmZapisOpekaSh.edUstOrgCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
end;
//-----------------------------------------------------
procedure TfmZapisOpekaSh.N_F_edDocOpekaCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
  if FShowRequired and (Sender<>nil) then begin
    if N_F_cbAdd.Checked then
      DrawState:=true;
  end;
end;
//-------------------------------------------------
procedure TfmZapisOpekaSh.N_F_edTypeSnCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
  if FShowRequired and (Sender<>nil) then begin
    if N_F_cbDel.Checked then
      DrawState:=true;
  end;
end;
                 
//-----------------------------------------------------
procedure TfmZapisOpekaSh.N_F_edDocOpekaOCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
end;
//-----------------------------------------------------
//====== OTM_ORG ========
procedure TfmZapisOpekaSh.edOtmOrgEditButtons0Click(Sender: TObject;  var Handled: Boolean);
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

procedure TfmZapisOpekaSh.edOtmOrgEditButtons1Click(Sender: TObject;  var Handled: Boolean);
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

procedure TfmZapisOpekaSh.edOtmOrgEditButtons2Click(Sender: TObject;  var Handled: Boolean);
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
      PutError('«начение не найдено в справочнике',self);
    end;
  end else begin
    ShowMessageCont('«начение ранее не выбиралось',self);
  end;
end;

procedure TfmZapisOpekaSh.ClearOrgOtm;
begin
  EditDataSet(Dokument);
  edOtmOrg.Text:='';
  DokumentOTM_ORG.AsString:='';
  DokumentOTM_ORG_SPR.AsString:='';
  DokumentOTM_ORG_TYPE.AsString:='';
  DokumentOTM_OTHER.AsBoolean:=false;
end;
procedure TfmZapisOpekaSh.edOtmOrgEditButtons3Click(Sender: TObject;  var Handled: Boolean);
begin
  ClearOrgOtm;
end;
//-----------------------------------------------------
//====== UST_ORG ========
procedure TfmZapisOpekaSh.edUstOrgEditButtons0Click(Sender: TObject;  var Handled: Boolean);
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

procedure TfmZapisOpekaSh.edUstOrgEditButtons1Click(Sender: TObject;  var Handled: Boolean);
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

procedure TfmZapisOpekaSh.edUstOrgEditButtons2Click(Sender: TObject;  var Handled: Boolean);
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
      PutError('«начение не найдено в справочнике',self);
    end;
  end else begin
    ShowMessageCont('«начение ранее не выбиралось',self);
  end;
end;

procedure TfmZapisOpekaSh.edUstOrgEditButtons3Click(Sender: TObject;  var Handled: Boolean);
begin
  EditDataSet(Dokument);
  edUstOrg.Text:='';
  DokumentUST_ORG.AsString:='';
  DokumentUST_ORG_SPR.AsString:='';
  DokumentUST_ORG_TYPE.AsString:='';
  DokumentUST_OTHER.AsBoolean:=false;
end;
//----------------------------------------------------------------------------------
procedure TfmZapisOpekaSh.TBItemCreatePopech18Click(Sender: TObject);
var
  lOk:Boolean;
begin
  if (DokumentID.AsInteger=-1) or FAddNewDok then  begin
    PutError('ќпераци€ доступна только дл€ сохраненной записи');
  end else begin
    if (DokumentVID.AsInteger=VID_OPEKA_DO14) then begin
      if DokumentDATE_OTM.IsNull then begin
        lOk:=Problem(PADCStr('«аполнить дату прекращени€ ?',40,' '),mtConfirmation,self);
        if lOk then begin
          EditDataSet(Dokument);
          DokumentDATE_OTM.AsDateTime:=Date;
          PostDataSet(Dokument);
        end;
      end else begin
        lOk:=true;
      end;
      if lOk and Problem('—оздать запись "попечительство над несовершеннолетним от 14 до 18" ?',mtConfirmation,self) then begin
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
          ShowMessage(PADCStr('ƒокумент не создан',40,' '));
        end;
      end;
    end else begin
      PutError('—оздать запись возможно только дл€: "опека над ребенком до 14" и заполнена дл€ прекращени€');
    end;
  end;
end;
//----------------------------------------------
function TfmZapisOpekaSh.FieldForNomerDok(var fldDate:TField):TField;
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
procedure TfmZapisOpekaSh.InvalidateAllNomer;
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
end;

procedure TfmZapisOpekaSh.N_F_edTypeSnChange(Sender: TObject);
var
  n:Integer;
begin
  if not FRun and not IsReadDokument then begin
    if N_F_edTypeSn.ItemIndex>-1
      then n:=StrToInt(N_F_edTypeSn.KeyItems[N_F_edTypeSn.ItemIndex]) else n:=0;
    CheckControlDok(n);
  end;
end;

procedure TfmZapisOpekaSh.CheckControlDok(nTypeSn:Integer);
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

procedure TfmZapisOpekaSh.N_F_cbDelClick(Sender: TObject);
begin
  SetEnabledControls( [
    N_F_edTypeSn, edDateOtm, N_F_edDocOpekaO, edNomerOtm, edDateDokSn, edOtmOrg
    ], N_F_cbDel.Checked);
end;

procedure TfmZapisOpekaSh.N_F_cbAddClick(Sender: TObject);
begin
  SetEnabledControls( [
    edDateUst, N_F_edDocOpeka, edNomerUst, edDateDokUst, edUstOrg,
    edON_WORK, edON_GRAG, edON_FAMILIA, edON_NAME, edON_OTCH, edON_DATER, ENG_edON_IDENTIF, edON_POL, edOTNOSH,
    edON_GOSUD, edON_OBL, edON_RAION, edON_GOROD, edON_GOROD_R, edON_DOM, edON_KORP, edON_KV, edON_B_OBL, edON_B_GOROD
    ], N_F_cbAdd.Checked);
end;

procedure TfmZapisOpekaSh.TBItemGetDataGISUNClick(Sender: TObject);
var
  cur:TCursor;
  sl:TStringList;
  ds:TDataSet;
  s:String;
begin
{$IFDEF GISUN}
  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  Gisun.CurAkt:=Self;    // !!! важно
  try
    if GetInfoGISUN1(Self,'ON_IDENTIF', '') then begin
      sl:=TStringList.Create;
      if DokumentON_IDENTIF.AsString<>'' then begin
        sl.Add('ON='+DokumentON_IDENTIF.AsString);
      end;
      ds:=Gisun.LoadIdentifData(sl,nil,nil);
      if ds<>nil then begin
        ds.First;
        FRun:=true;
        EditDataSet(Dokument);
        try
        while not ds.Eof do begin
          if ds.FieldByName('IDENTIF').AsString=DokumentON_IDENTIF.AsString then begin

            DokumentON_Familia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
            DokumentON_NAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
            DokumentON_OTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
            DokumentON_GRAG.AsString:=ds.FieldByName('GRAG').AsString;
            DokumentON_POL.AsString:=ds.FieldByName('POL').AsString;
            try
              WriteField(DokumentON_DATER,ds.FieldByName('DATER'));
            except
            end;

            DokumentON_GOSUD.AsString:=ds.FieldByName('GOSUD_G').AsString;
            DokumentON_B_OBL.AsBoolean:=true; // !!!
            DokumentON_OBL.AsString:=ds.FieldByName('OBL_G').AsString; // !!!
            DokumentON_RAION.AsString:=ds.FieldByName('RAION_G').AsString; // !!!

            DokumentON_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_G').AsString;
            DokumentON_GOROD.AsString:=ds.FieldByName('GOROD_G').AsString;
            s:=ds.FieldByName('RNGOROD_G').AsString;
            if s=''
              then DokumentON_GOROD_R.AsString:=ds.FieldByName('ULICA_G').AsString
              else DokumentON_GOROD_R.AsString:=s+', '+ds.FieldByName('ULICA_G').AsString;
            DokumentON_DOM.AsString:=ds.FieldByName('DOM_G').AsString;
            DokumentON_KORP.AsString:=ds.FieldByName('KORP_G').AsString;
            DokumentON_KV.AsString:=ds.FieldByName('KV_G').AsString;
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

end.

