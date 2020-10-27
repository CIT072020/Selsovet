unit fZapisRogdV;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject, uTypes, uProjectAll,
  ExtCtrls, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, dBase, funcPr, dbFunc,
  MetaTAsk, OpisEdit, vchDBCtrls, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  Grids, DBGridEh, Buttons, ImgList, kbmMemCSVStreamFormat, ZipForge;

type
  TfmZapisRogdV = class(TfmSimpleD)
    pn: TPanel;
    pc: TPageControl;
    tsChild: TTabSheet;
    tsFaser: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    Label5: TLabel;
    edDateR: TDBDateTimeEditEh;
    edPol: TDBComboBoxEh;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbDateR_Rodit: TLabel;
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
    Label28: TLabel;
    Label29: TLabel;
    edGOSUD: TDBLookupComboboxEh;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edGOROD: TDBEditEh;
    Label35: TLabel;
    tsAdd: TTabSheet;
    Label7: TLabel;
    edNomer: TDBEditEh;
    Label8: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label40: TLabel;
    edSvid_Nomer: TDBEditEh;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentSVID_NOMER: TStringField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentDateR: TDateField;
    DokumentGOSUD: TIntegerField;
    DokumentOBL: TStringField;
    DokumentRAION: TStringField;
    DokumentGOROD: TStringField;
    DokumentPOL: TStringField;
    DokumentTYPEROD: TSmallintField;
    DokumentGIVOROGD: TBooleanField;
    DokumentSCHET: TSmallintField;
    DokumentOSTAT: TSmallintField;
    DokumentMASSA: TSmallintField;
    DokumentSP_A: TSmallintField;
    DokumentSP_B: TSmallintField;
    DokumentSP_C: TDateField;
    DokumentSP_D: TSmallintField;
    DokumentSP_E: TSmallintField;
    DokumentSP_F: TSmallintField;
    DokumentSP_G: TSmallintField;
    DokumentSP_H: TSmallintField;
    DokumentSP_I: TSmallintField;
    DokumentSP_J: TDateField;
    DokumentSP_K: TSmallintField;
    DokumentDOKUMENT: TMemoField;
    DokumentON_ID: TIntegerField;
    DokumentON_Familia: TStringField;
    DokumentON_Name: TStringField;
    DokumentON_Otch: TStringField;
    DokumentON_DateR: TDateField;
    DokumentON_NATION: TIntegerField;
    DokumentON_GRAG: TIntegerField;
    DokumentON_SOATO: TStringField;
    DokumentON_M_GOSUD: TIntegerField;
    DokumentON_M_OBL: TStringField;
    DokumentON_M_RAION: TStringField;
    DokumentON_M_GOROD: TStringField;
    DokumentON_WORK: TStringField;
    DokumentON_OBRAZ: TIntegerField;
    DokumentON_DOKUMENT: TMemoField;
    DokumentOTMETKA: TMemoField;
    DokumentON_M_B_RESP: TBooleanField;
    DokumentON_M_B_OBL: TBooleanField;
    DokumentONA_ID: TIntegerField;
    DokumentONA_Familia: TStringField;
    DokumentONA_Name: TStringField;
    DokumentONA_Otch: TStringField;
    DokumentONA_DateR: TDateField;
    DokumentONA_NATION: TIntegerField;
    DokumentONA_GRAG: TIntegerField;
    DokumentONA_SOATO: TStringField;
    DokumentONA_M_GOSUD: TIntegerField;
    DokumentONA_M_OBL: TStringField;
    DokumentONA_M_RAION: TStringField;
    DokumentONA_M_GOROD: TStringField;
    DokumentONA_WORK: TStringField;
    DokumentONA_OBRAZ: TIntegerField;
    DokumentONA_DOKUMENT: TMemoField;
    DokumentONA_M_B_RESP: TBooleanField;
    DokumentONA_M_B_OBL: TBooleanField;
    DokumentSVED: TSmallintField;
    DokumentSVED_SVID: TMemoField;
    DokumentON_SVID: TStringField;
    DokumentONA_SVID: TStringField;
    DokumentRUKOV: TStringField;
    DokumentDECL: TStringField;
    DokumentB_RESP: TBooleanField;
    DokumentB_OBL: TBooleanField;
    N_F_1: TDBCheckBoxEh;
    DokumentFirst_Ekz: TBooleanField;
    edSUD_NAME: TDBEditEh;
    dsNation: TDataSource;
    dsStran: TDataSource;
    DokumentTimeR: TTimeField;
    DokumentLICH_ID: TIntegerField;
    gbLich: TGroupBox;
    lbLich: TvchDBText;
    DokumentCHILD_ID: TIntegerField;
    TBItemClearLich: TTBItem;
    DokumentSVID_SERIA: TStringField;
    Label55: TLabel;
    edRukov: TDBEditEh;
    DokumentPROV: TBooleanField;
    cbProvDvig: TDBCheckBoxEh;
    DokumentName_B: TStringField;
    DokumentOtch_B: TStringField;
    DokumentOBL_B: TStringField;
    DokumentRAION_B: TStringField;
    DokumentGOROD_B: TStringField;
    DokumentON_Familia_B: TStringField;
    DokumentON_Name_B: TStringField;
    DokumentON_Otch_B: TStringField;
    DokumentONA_Familia_B: TStringField;
    DokumentONA_Name_B: TStringField;
    DokumentONA_Otch_B: TStringField;
    DokumentRukov_B: TStringField;
    DokumentFamilia_B: TStringField;
    edDateSv: TDBDateTimeEditEh;
    Label56: TLabel;
    DokumentDateSV: TDateField;
    DokumentVOSSTAN: TBooleanField;
    DokumentISPRAV: TMemoField;
    DokumentSPEC: TStringField;
    DokumentSUD_NAME: TMemoField;
    DokumentSUD_DATE: TDateField;
    DokumentM_GOSUD: TIntegerField;
    DokumentM_OBL: TStringField;
    DokumentM_RAION: TStringField;
    DokumentM_GOROD: TStringField;
    DokumentM_GOROD_R: TStringField;
    Label6: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label42: TLabel;
    edM_GOSUD: TDBLookupComboboxEh;
    edM_GOROD: TDBEditEh;
    edB_M_OBL: TDBCheckBoxEh;
    edM_GOROD_R: TDBEditEh;
    Label15: TLabel;
    edSpec: TDBEditEh;
    Label17: TLabel;
    edOtmet: TDBEditEh;
    Label19: TLabel;
    edSUD_DATE: TDBDateTimeEditEh;
    DokumentB_M_RESP: TBooleanField;
    DokumentB_M_OBL: TBooleanField;
    DokumentID_ZAGS: TIntegerField;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    Label58: TLabel;
    Label59: TLabel;
    edOther: TDBEditEh;
    edIzmen: TDBEditEh;
    dsGragd: TDataSource;
    DokumentON_ONLYGOD: TBooleanField;
    DokumentONA_ONLYGOD: TBooleanField;
    cbOnlyGodON: TDBCheckBoxEh;
    cbOnlyGodONA: TDBCheckBoxEh;
    DokumentCOPIA: TBooleanField;
    N_F_edCopy: TDBCheckBoxEh;
    N_F_cbPovtor: TDBCheckBoxEh;
    DokumentONA_CHERN: TSmallintField;
    DokumentON_CHERN: TSmallintField;
    DokumentCHERN: TSmallintField;
    edSVID_SERIA: TDBLookupComboboxEh;
    tsPovtor: TTabSheet;
    TBItemVozrast: TTBItem;
    DokumentON_VOZR: TSmallintField;
    DokumentONA_VOZR: TSmallintField;
    edON_VOZR: TDBNumberEditEh;
    edONA_VOZR: TDBNumberEditEh;
    BLR_edOBL: TDBEditEh;
    BLR_edRAION: TDBEditEh;
    DokumentDLINA: TFloatField;
    edB_GOROD: TDBLookupComboboxEh;
    edB_M_GOROD: TDBLookupComboboxEh;
    DokumentB_M_GOROD: TSmallintField;
    DokumentB_GOROD: TSmallintField;
    DokumentPOLE_GRN: TSmallintField;
    DokumentTYPEMESSAGE: TStringField;
    DokumentIDENTIF: TStringField;
    DokumentON_M_B_GOROD: TSmallintField;
    DokumentONA_M_B_GOROD: TSmallintField;
    DokumentON_STATUS: TStringField;
    DokumentONA_STATUS: TStringField;
    DokumentGRAG: TIntegerField;
    DokumentSTATUS: TStringField;
    Label60: TLabel;
    Label61: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    edON_M_B_OBL: TDBCheckBoxEh;
    edON_M_GOSUD: TDBLookupComboboxEh;
    edON_M_B_GOROD: TDBLookupComboboxEh;
    edON_M_GOROD: TDBEditEh;
    edONA_M_B_OBL: TDBCheckBoxEh;
    edONA_M_GOSUD: TDBLookupComboboxEh;
    edONA_M_B_GOROD: TDBLookupComboboxEh;
    edONA_M_GOROD: TDBEditEh;
    DokumentON_IDENTIF: TStringField;
    DokumentONA_IDENTIF: TStringField;
    Label14: TLabel;
    ENG_edON_IDENTIF: TDBEditEh;
    ENG_edONA_IDENTIF: TDBEditEh;
    DokumentON_GOSUD: TIntegerField;
    DokumentONA_GOSUD: TIntegerField;
    DokumentTYPEREG: TSmallintField;
    N_F_cbBelorus: TDBCheckBoxEh;
    ImageGISUN: TImage;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    lbIDENTIF: TLabel;
    DokumentSPEC_B: TStringField;
    edOBL: TDBEditEh;
    edRaion: TDBEditEh;
    edM_OBL: TDBEditEh;
    edM_RAION: TDBEditEh;
    edON_M_OBL: TDBEditEh;
    edON_M_RAION: TDBEditEh;
    edONA_M_OBL: TDBEditEh;
    edONA_M_RAION: TDBEditEh;
    DokumentRN_B_GOROD: TStringField;
    DokumentRN_ON_M_B_GOROD: TStringField;
    DokumentRN_ONA_M_B_GOROD: TStringField;
    DokumentRN_B_M_GOROD: TStringField;
    DokumentSUD_DATEV: TDateField;
    Label80: TLabel;
    edSUD_DATEV: TDBDateTimeEditEh;
    Label16: TLabel;
    edAdopt_ORGAN: TDBEditEh;
    Label18: TLabel;
    edAdopt_DATE: TDBDateTimeEditEh;
    Label22: TLabel;
    DokumentADOPT_NOMER: TIntegerField;
    DokumentADOPT_DATE: TDateField;
    DokumentADOPT_ORGAN: TStringField;
    edADOPT_NOMER: TDBNumberEditEh;
    DokumentARX_ADRESAT: TMemoField;
    TBItemChAdopt: TTBItem;
    N_F_Print_Vosstan: TDBCheckBoxEh;
    cbObl: TDBCheckBoxEh;
    Label108: TLabel;
    BLR_edFamilia: TDBEditEh;
    Label109: TLabel;
    BLR_edName: TDBEditEh;
    Label110: TLabel;
    BLR_edOtch: TDBEditEh;
    BLR_edB_GOROD: TDBLookupComboboxEh;
    BLR_edGorod: TDBEditEh;
    BLR_edGosud: TDBLookupComboboxEh;
    BLR_edON_Familia: TDBEditEh;
    BLR_edON_Name: TDBEditEh;
    BLR_edON_Otch: TDBEditEh;
    BLR_edONA_Familia: TDBEditEh;
    BLR_edONA_Name: TDBEditEh;
    BLR_edONA_Otch: TDBEditEh;
    ENG_edIDENTIF: TDBEditEh;
    TBItemUstOtc: TTBItem;
    DokumentONLYGOD: TBooleanField;
    cbOnlyGod: TDBCheckBoxEh;
    DokumentIS_WRITE: TBooleanField;
    N_F_DBCheckBoxEh1: TDBCheckBoxEh;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    TBItemGetChild: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    procedure edON_FamiliaEditButtons0Click(Sender: TObject;            var Handled: Boolean);
    procedure edONA_FamiliaEditButtons0Click(Sender: TObject;           var Handled: Boolean);
    procedure lbLichGetText(Sender: TObject; var Text: String);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure TBItemClearLichClick(Sender: TObject);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edFamiliaUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edFamiliaEnter(Sender: TObject);
    procedure edNameEnter(Sender: TObject);
    procedure edOtchEnter(Sender: TObject);
    procedure edON_FamiliaEnter(Sender: TObject);
    procedure edON_NameEnter(Sender: TObject);
    procedure edON_OTCHEnter(Sender: TObject);
    procedure edONA_FamiliaEnter(Sender: TObject);
    procedure edONA_NameEnter(Sender: TObject);
    procedure edONA_OTCHEnter(Sender: TObject);
    procedure edFamiliaCheckDrawRequiredState(Sender: TObject;          var DrawState: Boolean);
    procedure edRukovEnter(Sender: TObject);
    procedure cbOnlyGodONClick(Sender: TObject);
    procedure TBItemVozrastClick(Sender: TObject);
    procedure edOBL_RNotInList(Sender: TObject; NewText: String;        var RecheckInList: Boolean);
    procedure edRaion_RNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure pcChange(Sender: TObject);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure edON_M_OBLNotInList(Sender: TObject; NewText: String;         var RecheckInList: Boolean);
    procedure edONA_M_OBLNotInList(Sender: TObject; NewText: String;        var RecheckInList: Boolean);
    procedure edON_M_RAIONNotInList(Sender: TObject; NewText: String;       var RecheckInList: Boolean);
    procedure edONA_M_RAIONNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure TBItemChAdoptClick(Sender: TObject);
    procedure ENG_edIDENTIFEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure TBItemUstOtcClick(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;           var Handled: Boolean);
    procedure edSpecEditButtons0Click(Sender: TObject;            var Handled: Boolean);
    procedure edON_FamiliaEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure TBItemGetChildClick(Sender: TObject);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    procedure Event_ClearOtec(Sender: TObject);
    function CreateSubMenuRun: Boolean; override;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure UpdateActions; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    function BeforeEdit : Boolean; override;
    procedure CheckOnlyGod;
    procedure CheckOnlyVozrast(lClear : Boolean);
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;
    procedure AfterReadDok; override;
    procedure SetColorChild(c:TColor);

  end;

  function EditZapisRogdV( nID : Integer; dsUstOtc : TDataSet; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;

var
  fmZapisRogdV: TfmZapisRogdV;

implementation

uses fMain, fShablon, fGetGISUN1;

{$R *.DFM}
{$I Task.inc}

function EditZapisRogdV( nID : Integer; dsUstOtc : TDataSet; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;
begin
//  Result := true;
  fmZapisRogdV := TfmZapisRogdV.Create(nil);
  fmZapisRogdV.IsCreateForm:=false;
  fmZapisRogdV.AssignPar(slPar);
  if dsUstOtc=nil then begin
    fmZapisRogdV.TBItemUstOtc.Visible:=false
  end else begin
    fmZapisRogdV.TBItemUstOtc.Visible:=true;
    fmZapisRogdV.pc.ActivePageIndex:=1;
  end;
  fmZapisRogdV.FNewDataSet := dsUstOtc;

  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
    fmZapisRogdV.cbOnlyGodON.Visible:=true;
    fmZapisRogdV.cbOnlyGodONA.Visible:=true;
  end else begin
    fmZapisRogdV.cbOnlyGodON.Visible:=false;
    fmZapisRogdV.cbOnlyGodONA.Visible:=false;
  end;
  try
    fmZapisRogdV.IsReadDokument:=true;
    if nID=-1 then begin
      fmZapisRogdV.NewDok(true);
      fmZapisRogdV.SetIDZags;
      fmZapisRogdV.CheckEnabledNameOrgan(true);
    end else begin
      fmZapisRogdV.ReadDok( nID );
      fmZapisRogdV.TBItemZAGS.Visible:=false;
      fmZapisRogdV.CheckEnabledNameOrgan(false);
    end;
    fmZapisRogdV.IsReadDokument:=false;
    {$IFDEF GISUN}
      fmZapisRogdV.CheckAkt_GISUN(0);
//      Gisun.CheckAktV(fmZapisRogdV);
//      fmZapisRogdV.CheckImageGisun(fmZapisRogdV.DokumentPOLE_GRN,fmZapisRogdV.ImageGISUN);
      fmZapisRogdV.BeforeEditFormGISUN;
    {$ENDIF}
    result := fmZapisRogdV.EditModal;
  finally
    fmZapisRogdV.Free;
    fmZapisRogdV := nil;
  end;
end;

{ TfmZapisRogd }

constructor TfmZapisRogdV.Create(Owner: TComponent);
var
  aw : TAddControl;
  n:Integer;
begin
  inherited;
  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';
  FCheckLookupField:=false;
  // ребенок
  aw := TAddControl.Create(cbObl);
  edOBL.Tag:=Integer(aw);
  RelationControl.Add(aw);
  aw := TAddControl.Create(edB_GOROD);
  aw.FirstWord:=true;
  edGOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);
  aw := TAddControl.Create(cbONLYGOD);
  aw.FirstWord:=true;
  edDATER.Tag:=Integer(aw);
  RelationControl.Add(aw);
  // папа
  aw := TAddControl.Create(edON_M_B_OBL);
  edON_M_OBL.Tag:=Integer(aw);
  RelationControl.Add(aw);
  aw := TAddControl.Create(edON_M_B_GOROD);
  aw.FirstWord:=true;
  edON_M_GOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);
  aw := TAddControl.Create(cbOnlyGodON);
  aw.FirstWord:=true;
  edON_DATER.Tag:=Integer(aw);
  RelationControl.Add(aw);

  // мама
  aw := TAddControl.Create(edONA_M_B_OBL);
  edONA_M_OBL.Tag:=Integer(aw);
  RelationControl.Add(aw);
  aw := TAddControl.Create(edONA_M_B_GOROD);
  aw.FirstWord:=true;
  edONA_M_GOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);
  aw := TAddControl.Create(cbOnlyGodONA);
  aw.FirstWord:=true;
  edONA_DATER.Tag:=Integer(aw);
  RelationControl.Add(aw);

  FDokZAGS := true;
  TypeObj := dmBase.TypeObj_ZRogd;
  FUpdatingObj:=GetUpdatingObj(TypeObj);
  
  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisRogd;
  dsGragd.DataSet := dmBase.SprGragd;
  edONA_Familia.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;
  FPageControl := pc;
  pc.ActivePageIndex:=0;
  if GlobalTask.ParamAsBoolean('AUTO_ROGD') then begin
    cbProvDvig.Visible := true;
    cbProvDvig.Checked := true;
  end else begin
    cbProvDvig.Visible := false;
    cbProvDvig.Checked := false;
  end;
  edFamilia.OnExit := OnDestroyHint;
  edName.OnExit := OnDestroyHint;
  edOtch.OnExit := OnDestroyHint;
  edON_Familia.OnExit := OnDestroyHint;
  edON_Name.OnExit := OnDestroyHint;
  edON_Otch.OnExit := OnDestroyHint;
  edONA_Familia.OnExit := OnDestroyHint;
  edONA_Name.OnExit := OnDestroyHint;
  edONA_Otch.OnExit := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;
//  fmMain.SetCurrentDokument(Dokument);
  {$IFDEF ZAGS}
    edON_Familia.EditButtons.Items[0].Visible:=false;
    edONA_Familia.EditButtons.Items[0].Visible:=false;
    cbProvDvig.Visible := false;
    cbProvDvig.Checked := false;
    gbLich.Visible:=false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
    TBItemVozrast.Visible := false;
    N_F_edCopy.Visible := false;
    N_F_cbPovtor.Visible := false;
  {$ENDIF}


  SetControlFIOUpdate([
    edFamilia, edName, edOtch, edON_Familia, edON_Name, edON_Otch, edONA_Familia, edONA_Name, edONA_Otch,
    BLR_edFamilia, BLR_edName, BLR_edOtch, BLR_edON_Familia, BLR_edON_Name, BLR_edON_Otch, BLR_edONA_Familia, BLR_edONA_Name, BLR_edONA_Otch
     ],false);

  SetControlCityUpdate([
    edOBL, edRaion, edGOROD, BLR_edOBL, BLR_edRaion, BLR_edGOROD,
    edM_OBL, edM_Raion, edM_GOROD,
    edON_M_OBL, edON_M_Raion, edON_M_GOROD,
    edONA_M_OBL, edONA_M_Raion, edONA_M_GOROD
    ]);


  ENG_edOna_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edOn_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edIdentif.OnUpdateData:=IN_UpdateData;


  SetLength(FArrChoiceRekv,2);

  FArrChoiceRekv[0].nType:=SHABLON_SUD;
  FArrChoiceRekv[0].FieldName:='SUD_NAME';

  FArrChoiceRekv[1].nType:=SHABLON_NATION;  //2;
  FArrChoiceRekv[1].FieldName:='OTMETKA';


  n:=3;
  SetLength(FArrAddProperty,n);
  SetAddProperty(0, 'OTHER', '', ftMemo);
  SetAddProperty(1, 'IZMEN', '', ftMemo);
  SetAddProperty(2, 'ADOPT_ORGAN', '', ftMemo);
  {$IFDEF GISUN}
    // типы нас. пунктов в кодах ГИС РН
    SetLength(FArrAddProperty,n+4);
    SetAddProperty(n,   'RN_B_GOROD', '', ftString);
    SetAddProperty(n+1, 'RN_B_M_GOROD', '', ftString);
    SetAddProperty(n+2, 'RN_ON_M_B_GOROD', '', ftString);
    SetAddProperty(n+3, 'RN_ONA_M_B_GOROD', '', ftString);
  {$ENDIF}

  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;

  SetcbBel(N_F_cbBelorus);
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;
  SetLength(FArrCheckBelField,3);
  WriteToArrCheck(0,  1, false, 'OBL'      , 'OBL_B');
  WriteToArrCheck(1,  2, false, 'RAION'    , 'RAION_B');
  WriteToArrCheck(2,  3, true, 'GOROD'    , 'GOROD_B');

  SetLength(FArrCheckField,2);
  WriteToArrCheck(0,  1, false, 'M_OBL'   );
  WriteToArrCheck(1,  2, false, 'M_RAION' );

  AddButton_LoadIdentif(ENG_edIDENTIF);
  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edONA_IDENTIF);

  SetPanelPovtor(tsPovtor, N_F_cbPovtor, Label30, Label35);

  SetVisibleNomerEkz(pn, edDateSv, N_F_1);

  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := IsActiveGISUN;
    lbIDENTIF.Visible:=IsActiveGISUN;
    ENG_edIDENTIF.Visible:=IsActiveGISUN;
    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN('1');
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
    lbIDENTIF.Visible:=false;
    ENG_edIDENTIF.Visible:=false;
  {$ENDIF}
  TBItemHistCorr.Visible:=FUpdatingObj;

end;

destructor TfmZapisRogdV.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

{
function TfmZapisRogd.GetNameReport: String;
begin
  Result := '&Свидетельство о рождении.frf';
//  Result := '&Запись акта о рождении.frf';
end;
}
function TfmZapisRogdV.GetVid: String;
begin
  Result:='ZRogd';
end;

{
procedure TfmZapisRogdV.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
function TfmZapisRogdV.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

  DokumentPOVTOR.AsBoolean:=false;
  DokumentPRINT_VOSSTAN.AsBoolean:=true;
  DokumentCOPIA.AsBoolean := false;
  DokumentON_ONLYGOD.AsBoolean:=false;
  DokumentONA_ONLYGOD.AsBoolean:=false;
  DokumentONLYGOD.AsBoolean:=false;

  DokumentIS_WRITE.AsBoolean:=false;
  DokumentGIVOROGD.AsBoolean:=true;
  DokumentFIRST_EKZ.AsBoolean:=true;
  DokumentPOL.AsString:='М';

  DokumentB_RESP.AsBoolean:=false;    // после отправки в ГИС РН корректировались определенные реквизиты

  DokumentB_OBL.AsBoolean:=true;

  DokumentB_M_OBL.AsBoolean:=true;

  DokumentON_M_B_OBL.AsBoolean:=true;
  DokumentONA_M_B_OBL.AsBoolean:=true;

  DokumentB_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_M_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_M_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentB_M_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');

  DokumentPROV.AsBoolean := false;
  DokumentVOSSTAN.AsBoolean := true;
  inherited NewDok(lAppend);

  CheckForAll_Bel(DokumentOBL);
  CheckForAll_Bel(DokumentRAION);
  
  QueryExit:=false;
  Result := true;
end;

function TfmZapisRogdV.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
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

  ReadDopProperty(dmBase.TypeObj_ZRogd, DokumentID.AsInteger, STOD('1899-12-30',tdAds));

  if DokumentIS_WRITE.IsNull then DokumentIS_WRITE.AsBoolean:=false;
  if DokumentON_ONLYGOD.IsNull then DokumentON_ONLYGOD.AsBoolean:=false;
  if DokumentONA_ONLYGOD.IsNull then DokumentONA_ONLYGOD.AsBoolean:=false;
  if DokumentONLYGOD.IsNull then DokumentONLYGOD.AsBoolean:=false;
  DokumentCOPIA.AsBoolean := false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  DokumentPRINT_VOSSTAN.AsBoolean:=true;

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;
  ReadHistory(nID, dmBase.TypeObj_ZRogd);

  {$IFDEF ZAGS}
  TBItemVozrast.Checked := ((DokumentON_DateR.AsString='') and (DokumentON_VOZR.AsString<>''));
  if TBItemVozrast.Checked then CheckOnlyVozrast(false);
  {$ENDIF}
  CheckOnlyGod;

end;

function TfmZapisRogdV.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  sAdd,strField, strErr : String;
  {$IFNDEF ZAGS}
  dLastSost : TDateTime;
  {$ENDIF}
begin
  Dokument.CheckBrowseMode;
  AdditiveBeforeWriteDok;

  EditDataSet(Dokument);
  sAdd:='';
  if Length(DokumentM_GOROD_R.AsString)>50  then sAdd:=sAdd+'M_GOROD_R;';
  WriteOtherData(Dokument, 'OTHER', sAdd+'RUKOV_D;SPEC_D');
  PostDataSet(Dokument);

  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
  if DokumentDATEZ.IsNull then begin
    strErr := ' Заполните дату акта о рождении. ';
  end else if DokumentNOMER.AsString='' then begin
    strErr := ' Заполните номер акта о рождении. ';
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства о рождении. ';
  end else if DokumentDATER.AsString='' then begin
    strErr := ' Заполните дату рождения. ';
  end else if DokumentPOL.AsString='' then begin
    strErr := ' Заполните пол. ';
  end else if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then begin
    strErr := ' Заполните Фамилия, Имя. ';
  end;
  if (strErr='') then begin
     Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZRogd, DokumentID_ZAGS.AsInteger,
                    DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime, true);
     if not Result then exit;
  end;
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
  end else begin
    nID := DokumentID.AsInteger;
    if not FMainTable.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    FCheckEditGIS:=CheckDateEditGIS;  // функция д.б. своя для каждого типа документа !!!

    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    FMainTable.Edit;
    for i:=1 to FMainTable.FieldCount-1 do begin
      strField := FMainTable.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        FMainTable.Fields[i].Value := fld.Value;
      end;
    end;

    if not FPrintSpecSvid
      then FMainTable.FieldByName('SPEC_B').AsString:='';

    WriteDateIzm;
    WriteForAllDok_BeforePost;
    if FMainTable.FieldByName('B_RESP').AsBoolean=false
      then FMainTable.FieldByName('B_RESP').AsBoolean:=FCheckEditGIS;
    FMainTable.Post;

    WriteDopProperty(dmBase.TypeObj_ZRogd, DokumentID.AsInteger,
                   STOD('1899-12-30',tdAds));

    WriteHistory(nID, dmBase.TypeObj_ZRogd);
//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);

    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    AdditiveWriteDok;


    QueryExit:=false;
    Result := true;
    if FCheckBelName and FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentFamilia.AsString, DokumentFamilia_B.AsString);
      WriteForAll_Bel;
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
        lAdd   := false;
        lBeAdd := false;
        // если у ребенка еще нет ид.
        if DokumentCHILD_ID.AsString='' then begin
          nIdChild := dmBase.GetNewID(dmBase.TypeObj_Nasel);
          if nIdChild > 0 then begin
            EditdataSet(Dokument);
            DokumentCHILD_ID.AsInteger := nIdChild;
            DokumentPROV.AsBoolean := true;
            PostDataSet(Dokument);
            lAdd := true;
          end;
        end else begin
          lBeAdd := true;  // ребенок уже был когда-то записан и у него есть ID
        end;
        lErr := false;
        if DokumentCHILD_ID.AsString <> '' then begin
          nIdChild := DokumentCHILD_ID.AsInteger;
          vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, nIdChild);
          if not dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
            if lBeAdd then begin
              //  ошибка значит человека уже удалили из базы
              lErr := true;
            end else begin
              dmBase.tbMens.Append;
              dmBase.tbMens.FieldByName('DATE_FIKS').AsDateTime := dmBase.GetDateCurrentSost;
              dmBase.tbMens.FieldByName('ID').AsInteger := nIdChild;
            end;
          end else begin
            dmBase.tbMens.Edit;
          end;
          if not lErr then begin
            with dmBase.tbMens do begin
              FieldByName('LIC_ID').AsString   := DokumentLICH_ID.AsString;
              FieldByName('AKT_ROGD_NOMER').AsString := DokumentNOMER.AsString;
              FieldByName('AKT_ROGD_DATE').AsDateTime:= DokumentDateZ.AsDateTime;
              FieldByName('DATER').AsDateTime        := DokumentDateR.AsDateTime;
              FieldByName('POL').AsString            := DokumentPOL.AsString;
              FieldByName('FAMILIA').AsString        := DokumentFamilia.AsString;
              FieldByName('NAME').AsString           := DokumentName.AsString;
              FieldByName('OTCH').AsString           := DokumentOtch.AsString;
              Post;
            end;
            //--------- запишем ID ребенка в базу актов о рождении -------------
            if FMainTable.FieldByName('ID').AsInteger = DokumentID.AsInteger then begin
              FMainTable.Edit;
              FMainTable.FieldByName('CHILD_ID').AsInteger := nIdChild;
              FMainTable.Post;
            end else begin
              PutError(' Ошибка записи акта рождений! ',self);
            end;
            //-------------------------------------------------------------------
            vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, DokumentLICH_ID.AsInteger);
            strLich := '';
            if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
              strLich := dmBase.tbLich.FieldByName('NOMER').AsString;
            end;
            if lAdd then begin
              if DokumentPOL.AsString='М' then s := 'добавлен' else s := 'добавлена';
              ShowMessage(DokumentFamilia.AsString+' '+DokumentName.AsString+' '+
                          DokumentOtch.AsString+#13+' '+s+' на лицевой счет <'+strLich+'>');
            end else begin
              if DokumentPOL.AsString='М' then s := 'откорректирован' else s := 'откорректирована';
              ShowMessage(DokumentFamilia.AsString+' '+DokumentName.AsString+' '+
                          DokumentOtch.AsString+#13+' '+s+' на лицевом счете <'+strLich+'>');
            end;
          end;
        end;
      end;
    end;
    {$ENDIF}
    if Result then QueryExit:=false;
  end;
end;

procedure TfmZapisRogdV.edON_FamiliaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
//      v := GetValueField(arrRec, 'FAMILIA');
//      if v = null then DokumentON_FAMILIA.AsString := ''
//                  else DokumentON_FAMILIA.AsString := v;
end;

procedure TfmZapisRogdV.edONA_FamiliaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
//      DokumentONA_ID.AsInteger := v;
//      v := GetValueField(arrRec, 'FAMILIA');
//      if v = null then DokumentONA_FAMILIA.AsString := ''
//                  else DokumentONA_FAMILIA.AsString := v;
end;

procedure TfmZapisRogdV.lbLichGetText(Sender: TObject; var Text: String);
begin
  Text := '';
  {$IFNDEF ZAGS}
  if DokumentLICH_ID.AsString<>'' then begin
    vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, DokumentLICH_ID.AsInteger);
    if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
      Text := dmBase.tbLich.FieldByName('NOMER').AsString;
    end;
  end;
  if Text<>'' then begin
    gbLich.Font.Color:=clBlue;
    gbLich.Font.Style:=gbLich.Font.Style+[fsBold];
  end else begin
    gbLich.Font.Color:=clBlack;
    gbLich.Font.Style:=gbLich.Font.Style-[fsBold];
  end;
  {$ENDIF}
end;

procedure TfmZapisRogdV.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol : TPol;
  lCheck : Boolean;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    FRun := true;
    if ANSIUpperCase(Field.FieldName) = 'FAMILIA' then begin
      if (Field.AsString<>'') then begin
        if DokumentON_Familia.AsString=''  then begin
          DokumentON_Familia.AsString:=Field.AsString;
          DokumentON_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;
        if DokumentONA_Familia.AsString='' then begin
          DokumentONA_Familia.AsString:=Field.AsString;
          DokumentONA_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;
      end;
    end else if ANSIUpperCase(Field.FieldName) = 'ONA_FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentLICH_ID.AsString:='';
        DokumentONA_ID.AsString:='';
      end;
    end else if ANSIUpperCase(Field.FieldName) = 'ON_FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentON_ID.AsString:='';
      end;
    end;
    if FCheckBelName then begin
      strField := UpperCase(Field.FieldName);
      EditDataSet(Dokument);
      Pol := tpNone;
      lCheck := false;
      if strField='NAME' then begin
        if DokumentName_B.AsString='' then begin
          DokumentName_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
          lCheck := true;
        end;
      end else if strField='OTCH' then begin
        if DokumentOtch_B.AsString='' then begin
          DokumentOtch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
          lCheck := true;
        end;
      end else if strField='ON_NAME' then begin
        if DokumentON_Name_B.AsString='' then begin
          DokumentON_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
        end;
      end else if strField='ON_OTCH' then begin
        if DokumentON_Otch_B.AsString='' then begin
          DokumentON_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
        end;
      end else if strField='ONA_NAME' then begin
        if DokumentONA_Name_B.AsString='' then begin
          DokumentONA_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
        end;
      end else if strField='ONA_OTCH' then begin
        if DokumentONA_Otch_B.AsString='' then begin
          DokumentONA_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
        end;
      end else if strField='FAMILIA' then begin
        if DokumentFamilia_B.AsString='' then begin
          DokumentFamilia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;
      end else if strField='ON_FAMILIA' then begin
        if DokumentON_Familia_B.AsString='' then begin
          DokumentON_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;
      end else if strField='ONA_FAMILIA' then begin
        if DokumentONA_Familia_B.AsString='' then begin
          DokumentONA_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;
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

procedure TfmZapisRogdV.TBItemClearLichClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentLICH_ID.AsString := '';
  PostDataSet(Dokument);
end;

procedure TfmZapisRogdV.UpdateActions;
begin
  inherited;
  TBItemClearLich.Enabled:=DokumentLICH_ID.AsString<>'';
  {$IFNDEF ZAGS}
  if cbProvDvig.Visible then begin
    if DokumentLICH_ID.AsString='' then begin
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

function TfmZapisRogdV.BeforeEdit: Boolean;
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
  SetMRUList(edM_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edON_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edONA_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edM_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_M_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_M_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edM_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_M_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_M_RAION,n,2,true,false,false,FAddButtonMRUList);

end;

procedure TfmZapisRogdV.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked  then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;
    edRukov.DataField   := 'RUKOV_B';
    edZAGS.DataField := 'NAME_ZAGS_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
  end else begin
    ActivateRUSKeyboard;
    edRukov.DataField   := 'RUKOV';
    edZAGS.DataField := 'NAME_ZAGS';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
  end;
end;

procedure TfmZapisRogdV.edFamiliaUpdateData(Sender: TObject;
  var Handled: Boolean);
begin
//  ShowMessage(TComponent(Sender).Name);
end;

procedure TfmZapisRogdV.edFamiliaEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edFamilia,DokumentFamilia.AsString+' ');
end;

procedure TfmZapisRogdV.edNameEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edName,DokumentName.AsString+' ');
end;

procedure TfmZapisRogdV.edOtchEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edOtch,DokumentOtch.AsString+' ');
end;

procedure TfmZapisRogdV.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZapisRogdV.edON_FamiliaEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edON_Familia,DokumentON_Familia.AsString+' ');
end;

procedure TfmZapisRogdV.edON_NameEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edON_Name,DokumentON_Name.AsString+' ');
end;

procedure TfmZapisRogdV.edON_OTCHEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edON_Otch,DokumentON_Otch.AsString+' ');
end;

procedure TfmZapisRogdV.edONA_FamiliaEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Familia,DokumentONA_Familia.AsString+' ');
end;

procedure TfmZapisRogdV.edONA_NameEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Name,DokumentONA_Name.AsString+' ');
end;

procedure TfmZapisRogdV.edONA_OTCHEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Otch,DokumentONA_Otch.AsString+' ');
end;

procedure TfmZapisRogdV.edFamiliaCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmZapisRogdV.edRukovEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;
//--------------------------------------------------------------------
procedure TfmZapisRogdV.CheckOnlyGod;
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
  if cbOnlyGod.Checked then begin
    edDATER.EditButton.Visible:=false;
    edDATER.EditFormat:='YYYY';
  end else begin
    edDATER.EditButton.Visible:=true;
    edDATER.EditFormat:='DD.MM.YYYY';
  end;
end;

procedure TfmZapisRogdV.cbOnlyGodONClick(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZapisRogdV.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  AddSvid;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisRogdV.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisRogdV.TBItemVozrastClick(Sender: TObject);
begin
  CheckOnlyVozrast(true);
end;

procedure TfmZapisRogdV.CheckOnlyVozrast(lClear: Boolean);
begin
  if TBItemVozrast.Checked then begin
    lbDateR_Rodit.Caption := 'Возраст';
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
    lbDateR_Rodit.Caption := 'Дата рождения';
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

procedure TfmZapisRogdV.edOBL_RNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisRogdV.edRaion_RNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisRogdV.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then
    N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
end;

procedure TfmZapisRogdV.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetIdentifChildV(Self);
//  Gisun.CheckAktV(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisRogdV.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterChildV( Self);
//  Gisun.CheckAktV(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisRogdV.edON_M_OBLNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisRogdV.edONA_M_OBLNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisRogdV.edON_M_RAIONNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisRogdV.edONA_M_RAIONNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisRogdV.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmZapisRogdV.CreateSubMenuRun: Boolean;
var
 it : TTbItem;
// sep : TTbSeparatorItem;
begin
  Result:=true;

  AddSubmenu_CheckFIO;

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Удалить данные об отце';
  it.OnClick:=Event_ClearOtec;
  TBSubmenuRun.Add(it);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Аннулирование актовой записи';
  it.OnClick:=Event_Annulir;
  TBSubmenuRun.Add(it);
  AddSubmenu_ReadDolg;

end;

procedure TfmZapisRogdV.TBItemChAdoptClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  old : TCursor;
  lCheck : Boolean;
  ParamFlt:TParamFieldFlt;
begin
//  if ExitAsGISUN(true) then exit;

  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ADOPT');
  if Opis<>nil then begin

    ParamFlt:=CreateParamFlt(edFamilia.Text,'FAMILIAPOSLE');
    if ParamFlt<>nil then Opis.AutoFilter:=true;

    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edFamilia, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      lCheck:=dbDisableControls(Dokument);
      Screen.Cursor := crHourGlass;
      try
        EditDataSet(Dokument);
        s := GetValueField(arrRec, 'NAME_ZAGS');
        if s= '' then begin
          v := GetValueField(arrRec, 'ID_ZAGS');
          if dmBase.SprNames.Locate('ID', v, []) then begin
            s := dmBase.SprNames.FieldByName('NAME').AsString;
          end;
        end;

        DokumentFAMILIA.AsString := GetValueFieldEx(arrRec, 'FAMILIAPOSLE','');
        DokumentNAME.AsString := GetValueFieldEx(arrRec, 'NAMEPOSLE','');
        DokumentOTCH.AsString := GetValueFieldEx(arrRec, 'OTCHPOSLE','');
        DokumentFAMILIA_B.AsString := GetValueFieldEx(arrRec, 'FAMILIAPOSLE_B','');
        DokumentNAME_B.AsString := GetValueFieldEx(arrRec, 'NAMEPOSLE_B','');
        DokumentOTCH_B.AsString := GetValueFieldEx(arrRec, 'OTCHPOSLE_B','');
        DokumentPOL.AsString := GetValueFieldEx(arrRec, 'POL','М');
        v := GetValueField(arrRec, 'DATER_POSLE');
        if v=null then DokumentDATER.AsString:='' else DokumentDATER.AsDateTime:=v;
        DokumentIDENTIF.AsString := GetValueFieldEx(arrRec, 'IDENTIF_POSLE','');

        //--- место рождения -------------------------------------------------------------------------
        DokumentGOSUD.AsString := GetValueFieldEx(arrRec, 'GOSUD_POSLE','');

        v := GetValueField(arrRec, 'B_OBL_POSLE');
        if v = null then DokumentB_OBL.AsString := '' else DokumentB_OBL.Value := v;
        DokumentOBL.AsString := GetValueFieldEx(arrRec, 'OBL_POSLE','');
        DokumentRAION.AsString := GetValueFieldEx(arrRec, 'RAION_POSLE','');
        DokumentB_GOROD.AsString := GetValueFieldEx(arrRec, 'B_GOROD_POSLE','');
        DokumentGOROD.AsString := GetValueFieldEx(arrRec, 'GOROD_POSLE','');

        DokumentOBL_B.AsString := GetValueFieldEx(arrRec, 'OBL_POSLE_B','');
        DokumentRAION_B.AsString := GetValueFieldEx(arrRec, 'RAION_POSLE_B','');
        DokumentGOROD_B.AsString := GetValueFieldEx(arrRec, 'GOROD_POSLE_B','');
        //----------------------------------------------------------------------------
        DokumentON_FAMILIA.AsString := GetValueFieldEx(arrRec, 'ON_FAMILIA', '');
        DokumentON_NAME.AsString := GetValueFieldEx(arrRec, 'ON_NAME', '');
        DokumentON_OTCH.AsString := GetValueFieldEx(arrRec, 'ON_OTCH', '');
        DokumentON_FAMILIA_B.AsString := GetValueFieldEx(arrRec, 'ON_FAMILIA_B', '');
        DokumentON_NAME_B.AsString := GetValueFieldEx(arrRec, 'ON_NAME_B', '');
        DokumentON_OTCH_B.AsString := GetValueFieldEx(arrRec, 'ON_OTCH_B', '');
        DokumentON_IDENTIF.AsString := GetValueFieldEx(arrRec, 'ON_IDENTIF','');
        v := GetValueField(arrRec, 'ON_DATER');
        if v = null then DokumentON_DateR.AsString := ''  else DokumentON_DateR.Value   := v;
        v := GetValueField(arrRec, 'ON_NATION');
        if v = null then DokumentON_NATION.AsInteger:= 0  else DokumentON_NATION.Value  := v;
        v := GetValueField(arrRec, 'ON_GRAG');
        if v = null then DokumentON_GRAG.AsInteger:= 0    else DokumentON_GRAG.Value    := v;
        DokumentON_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOSUD','');
        v := GetValueField(arrRec, 'ON_M_B_OBL');
        if v = null then DokumentON_M_B_OBL.AsString := '' else DokumentON_M_B_OBL.Value    := v;
        DokumentON_M_OBL.AsString := GetValueFieldEx(arrRec, 'ON_M_OBL','');
        DokumentON_M_RAION.AsString := GetValueFieldEx(arrRec, 'ON_M_RAION','');
        DokumentON_M_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_M_B_GOROD','');
        DokumentON_M_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOROD','');
        //----------------------------------------------------------------------------
        DokumentONA_FAMILIA.AsString := GetValueFieldEx(arrRec, 'ONA_FAMILIA', '');
        DokumentONA_NAME.AsString := GetValueFieldEx(arrRec, 'ONA_NAME', '');
        DokumentONA_OTCH.AsString := GetValueFieldEx(arrRec, 'ONA_OTCH', '');
        DokumentONA_FAMILIA_B.AsString := GetValueFieldEx(arrRec, 'ONA_FAMILIA_B', '');
        DokumentONA_NAME_B.AsString := GetValueFieldEx(arrRec, 'ONA_NAME_B', '');
        DokumentONA_OTCH_B.AsString := GetValueFieldEx(arrRec, 'ONA_OTCH_B', '');
        DokumentONA_IDENTIF.AsString := GetValueFieldEx(arrRec, 'ONA_IDENTIF','');
        v := GetValueField(arrRec, 'ONA_DATER');
        if v = null then DokumentONA_DateR.AsString := ''  else DokumentONA_DateR.Value   := v;
        v := GetValueField(arrRec, 'ONA_NATION');
        if v = null then DokumentONA_NATION.AsInteger:= 0  else DokumentONA_NATION.Value  := v;
        v := GetValueField(arrRec, 'ONA_GRAG');
        if v = null then DokumentONA_GRAG.AsInteger:= 0    else DokumentONA_GRAG.Value    := v;

        DokumentONA_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOSUD','');
        v := GetValueField(arrRec, 'ONA_M_B_OBL');
        if v = null then DokumentONA_M_B_OBL.AsString := '' else DokumentONA_M_B_OBL.Value    := v;
        DokumentONA_M_OBL.AsString := GetValueFieldEx(arrRec, 'ONA_M_OBL','');
        DokumentONA_M_RAION.AsString := GetValueFieldEx(arrRec, 'ONA_M_RAION','');
        DokumentONA_M_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_M_B_GOROD','');
        DokumentONA_M_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOROD','');

        PostDataSet(Dokument);
      finally
        Screen.Cursor := old;
        dbEnableControls(Dokument,lCheck);
      end;
    end;
//    Opis.DataSet.Filter   := '';
//    Opis.DataSet.Filtered := false;
  end;
end;

procedure TfmZapisRogdV.ENG_edIDENTIFEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if (Gisun.GetPoleGrn(FPoleGrn)=rPost) then begin
    PutError('Взаимодействие с ГИС РН завершено.',self)
  end else begin
    if (ENG_edIDENTIF.Text='') then begin
      if LockOperation(_TypeOper_ChoiceIN,'') then begin
        try
          if ChoiceFromLookupSpr('LOOKUP_LIST_IN', 'IDENTIF', true,ENG_edIDENTIF) then begin
            dmBase.AdsConnection.Execute('DELETE FROM BaseProp WHERE typeobj='+IntToStr(_TypeObj_IN)+' and pokaz='+QStr('IN')+' and value='+QStr(ENG_edIDENTIF.Text));
          end;
        finally
          UnLockOperation(_TypeOper_ChoiceIN);
        end;
      end;
    end else begin
      PutError('ИН должен быть пуст.',self)
    end;
  end;
end;

procedure TfmZapisRogdV.TBItemUstOtcClick(Sender: TObject);
var
  strErr : String;
  l:Boolean;
begin
  FRun:=true;
  l:=dbDisableControls(Dokument);
  try
  EditDataSet(Dokument);
  FieldAddHist(DokumentON_Familia, edON_Familia, strErr);
  FieldAddHist(DokumentON_Name, edON_Name, strErr);
  FieldAddHist(DokumentON_Otch, edON_OTCH, strErr);
  FieldAddHist(DokumentON_Familia_B, BLR_edON_Familia, strErr);
  FieldAddHist(DokumentON_Name_B, BLR_edON_Name, strErr);
  FieldAddHist(DokumentON_Otch_B, BLR_edON_OTCH, strErr);
  FieldAddHist(DokumentON_NATION, edON_NATION, strErr);

  if (FNewDataSet.FieldByName('ON_IDENTIF').AsString<>'') and (DokumentON_IDENTIF.AsString<>'') then begin
    FieldAddHist(DokumentON_IDENTIF, ENG_edON_IDENTIF, strErr);
    DokumentON_IDENTIF.AsString := FNewDataSet.FieldByName('ON_IDENTIF').AsString;
  end;

  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIADO').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIAPOSLE').AsString)) then begin
    FieldAddHist(DokumentFamilia, edFamilia, strErr);
    DokumentFamilia.AsString := FNewDataSet.FieldByName('FAMILIAPOSLE').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEDO').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEPOSLE').AsString)) then begin
    FieldAddHist(DokumentName, edName, strErr);
    DokumentName.AsString := FNewDataSet.FieldByName('NAMEPOSLE').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHDO').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHPOSLE').AsString)) then begin
    FieldAddHist(DokumentOtch, edOtch, strErr);
    DokumentOtch.AsString := FNewDataSet.FieldByName('OTCHPOSLE').AsString;
  end;

  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIADO_B').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIAPOSLE_B').AsString)) then begin
    FieldAddHist(DokumentFamilia_B, BLR_edFamilia, strErr);
    DokumentFamilia_B.AsString := FNewDataSet.FieldByName('FAMILIAPOSLE_B').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEDO_B').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEPOSLE_B').AsString)) then begin
    FieldAddHist(DokumentName_B, BLR_edName, strErr);
    DokumentName_B.AsString := FNewDataSet.FieldByName('NAMEPOSLE_B').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHDO_B').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHPOSLE_B').AsString)) then begin
    FieldAddHist(DokumentOtch_B, BLR_edOtch, strErr);
    DokumentOtch_B.AsString := FNewDataSet.FieldByName('OTCHPOSLE_B').AsString;
  end;


  //-------- если фамилия мамы после брака не пустая и она не та что в актовой записи о рождении ------
  if (FNewDataSet.FieldByName('ONA_FAMILIA_BRAK').AsString<>'') and
     (ANSIUpperCase(Trim(DokumentONA_Familia.AsString))<>ANSIUpperCase(Trim(FNewDataSet.FieldByName('ONA_FAMILIA_BRAK').AsString))) then begin
    FieldAddHist(DokumentONA_Familia, edONA_Familia, strErr);
    DokumentONA_Familia.AsString := FNewDataSet.FieldByName('ONA_FAMILIA_BRAK').AsString;
  end;
  //-------------------------------------------------------------------------------------

  DokumentON_Familia.AsString := FNewDataSet.FieldByName('ON_FAMILIA').AsString;
  DokumentON_Name.AsString := FNewDataSet.FieldByName('ON_NAME').AsString;
  DokumentON_Otch.AsString := FNewDataSet.FieldByName('ON_OTCH').AsString;
  DokumentON_Familia_B.AsString := FNewDataSet.FieldByName('ON_FAMILIA_B').AsString;
  DokumentON_Name_B.AsString := FNewDataSet.FieldByName('ON_NAME_B').AsString;
  DokumentON_Otch_B.AsString := FNewDataSet.FieldByName('ON_OTCH_B').AsString;
  WriteDateField(DokumentON_DateR, FNewDataSet.FieldByName('ON_DATER'));
  DokumentON_NATION.AsString := FNewDataSet.FieldByName('ON_NATION').AsString;
  DokumentON_GRAG.AsString := FNewDataSet.FieldByName('ON_GRAG').AsString;
  DokumentON_IDENTIF.AsString  :=  FNewDataSet.FieldByName('ON_IDENTIF').AsString;

  //------ место рождения ---------------------
  DokumentON_M_GOSUD.AsString  := FNewDataSet.FieldByName('ON_M_GOSUD').AsString;
  DokumentON_M_B_OBL.AsVariant := FNewDataSet.FieldByName('ON_M_B_OBL').AsVariant;
  DokumentON_M_OBL.AsString    := FNewDataSet.FieldByName('ON_M_OBL').AsString;
  DokumentON_M_RAION.AsString  := FNewDataSet.FieldByName('ON_M_RAION').AsString;
  DokumentON_M_GOROD.AsString  := FNewDataSet.FieldByName('ON_M_GOROD').AsString;
  DokumentON_M_B_GOROD.AsString:= FNewDataSet.FieldByName('ON_M_B_GOROD').AsString;

  if DokumentIZMEN.AsString<>''
    then DokumentIZMEN.AsString:=DokumentIZMEN.AsString+#13;
  DokumentIZMEN.AsString := DokumentIZMEN.AsString+'з/а об установлении отцовства № '+FNewDataSet.FieldByName('NOMER').AsString+' от '+
                            FormatDateTime('dd.mm.yyyy', FNewDataSet.FieldByName('DATEZ').AsDateTime)+' г.';

//  if FNewDataSet.FieldByName('ZAMETKA').AsString<>'' then
//    WriteOTMETKA('OTMETKA', FNewDataSet.FieldByName('ZAMETKA').AsString, '');

  PostDataSet(Dokument);
  finally
    FRun:=false;
    dbEnableControls(Dokument,l);
  end;
end;

procedure TfmZapisRogdV.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;

procedure TfmZapisRogdV.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

procedure TfmZapisRogdV.edON_FamiliaEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Event_ClearOtec(Sender);
end;

procedure TfmZapisRogdV.Event_ClearOtec(Sender: TObject);
begin
  if DokumentON_Familia.AsString<>'' then begin
    if not Problem(' Удалить данные об отце ? ',mtConfirmation,self) then begin
      exit;
    end;
  end;
  EditdataSet(Dokument);
  Dokument.DisableControls;
  try
//  DokumentON_Familia.AsString := '';
//  DokumentON_Name.AsString  := '';
//  DokumentON_Otch.AsString  := '';
  DokumentON_DateR.AsString := '';;
  DokumentON_VOZR.AsString := '';;
//  DokumentON_CHERN.AsString := '';;
//  DokumentON_NATION.AsString := '';
  DokumentON_GRAG.AsString := '';
//  DokumentON_NATION.AsString := '';
//  DokumentON_OBRAZ.AsString := '';
  DokumentON_IDENTIF.AsString := '';

  DokumentON_M_GOSUD.AsString := '';
  DokumentON_M_RAION.AsString := '';
  DokumentON_M_OBL.AsString := '';
  DokumentON_M_B_GOROD.AsString := '';
  DokumentON_M_GOROD.AsString := '';
{
  DokumentON_GOSUD.AsString := '';
  DokumentON_RAION.AsString := '';
  DokumentON_OBL.AsString := '';
  DokumentON_B_GOROD.AsString := '';
  DokumentON_GOROD.AsString := '';
  DokumentON_RNGOROD.AsString := '';
  DokumentON_GOROD_R.AsString := '';
  DokumentON_DOM.AsString := '';
  DokumentON_KORP.AsString := '';
  DokumentON_KV.AsString := '';
  DokumentON_SOATO.AsString := '';
}
  {
  DokumentON_DOKUMENT.AsString := '';
  DokumentON_DOK_TYPE.AsString := '';
  DokumentON_DOK_SERIA.AsString := '';
  DokumentON_DOK_NOMER.AsString := '';
  DokumentON_DOK_ORGAN.AsString := '';
  DokumentON_DOK_DATE.AsString := '';
  DokumentON_ID.AsString := '';
  DokumentON_STATUS.AsString := '';
  }
  finally
  Dokument.EnableControls;
  end;
end;

function TfmZapisRogdV.CheckDateEditGIS: Boolean;
begin
  Result:=false;
  if Gisun.GetPoleGrn(DokumentPOLE_GRN)=rPost then begin
  if (DokumentNOMER.AsString<>FMainTable.FieldByName('NOMER').AsString) or
     (DokumentDATEZ.AsString<>FMainTable.FieldByName('DATEZ').AsString) or
     (DokumentSVID_SERIA.AsString<>FMainTable.FieldByName('SVID_SERIA').AsString) or
     (DokumentSVID_NOMER.AsString<>FMainTable.FieldByName('SVID_NOMER').AsString) or
     (DokumentDATESV.AsString<>FMainTable.FieldByName('DATESV').AsString) or
     (DokumentIDENTIF.AsString<>FMainTable.FieldByName('IDENTIF').AsString) or
     (DokumentDATER.AsString<>FMainTable.FieldByName('DATER').AsString) or
     (ce_fio(DokumentFamilia_B.AsString)<>ce_fio(FMainTable.FieldByName('Familia_B').AsString)) or
     (ce_fio(DokumentName_B.AsString)<>ce_fio(FMainTable.FieldByName('Name_B').AsString)) or
     (ce_fio(DokumentOtch_B.AsString)<>ce_fio(FMainTable.FieldByName('Otch_B').AsString)) or
     (ce_fio(DokumentFamilia.AsString)<>ce_fio(FMainTable.FieldByName('Familia').AsString)) or
     (ce_fio(DokumentName.AsString)<>ce_fio(FMainTable.FieldByName('Name').AsString)) or
     (ce_fio(DokumentOtch.AsString)<>ce_fio(FMainTable.FieldByName('Otch').AsString)) or
     (DokumentGOSUD.AsString<>FMainTable.FieldByName('GOSUD').AsString) or
     (DokumentOBL.AsString<>FMainTable.FieldByName('OBL').AsString) or
     (DokumentRAION.AsString<>FMainTable.FieldByName('RAION').AsString) or
     (DokumentGOROD.AsString<>FMainTable.FieldByName('GOROD').AsString) or
     (DokumentB_GOROD.AsString<>FMainTable.FieldByName('B_GOROD').AsString) or
     (DokumentOBL_B.AsString<>FMainTable.FieldByName('OBL_B').AsString) or
     (DokumentRAION_B.AsString<>FMainTable.FieldByName('RAION_B').AsString) or
     (DokumentGOROD_B.AsString<>FMainTable.FieldByName('GOROD_B').AsString) or
     (DokumentON_IDENTIF.AsString<>FMainTable.FieldByName('ON_IDENTIF').AsString) or
     (DokumentONA_IDENTIF.AsString<>FMainTable.FieldByName('ONA_IDENTIF').AsString)
    then Result:=true
    else Result:=false;
  end;
end;
//-----------------------------------------------------------
procedure TfmZapisRogdV.WriteAfterRegister_GISUN;
begin
  try
    EditDataSet(Dokument);
    DokumentB_RESP.AsBoolean:=false;
    Dokument.Post;
    FMainTable.FieldByName('B_RESP').AsBoolean:=false;
  except
  end;
end;
//-----------------------------------------------------------
procedure TfmZapisRogdV.AfterReadDok;
begin
  inherited;
  SetColorChild(GetControlColor);
end;
//-----------------------------------------------------------
procedure TfmZapisRogdV.SetColorChild(c:TColor);
begin
  SetColorControls([edFamilia,edName,edOtch,BLR_edFamilia,BLR_edName,BLR_edOtch,edDateR,edPol,
      edGOSUD,edOBL,edRaion,edGOROD,edB_GOROD,BLR_edOBL,BLR_edRaion,BLR_edGOROD,
      edM_GOSUD,edM_OBL,edM_Raion,edM_GOROD,edB_M_GOROD, edM_GOROD_R], c);
end;
//-----------------------------------------------------------
procedure TfmZapisRogdV.TBItemGetChildClick(Sender: TObject);
var
  cur:TCursor;
  sl:TStringList;
  ds:TDataSet;
  n:Integer;
begin
{$IFDEF GISUN}
  n:=Gisun.GetPoleGrn(Dokument);
  if (n=rPost) then begin
    PutError(ERR_REG_GIS,self);
    exit;
  end;
  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  Gisun.CurAkt:=Self;    // !!! важно
  try
    if GetInfoGISUN1(Self,'IDENTIF', '') then begin
      sl:=TStringList.Create;
      sl.Add('CHILD='+ENG_edIDENTIF.Text);
      Gisun.RegInt.FObrPersonalData:=nil;  // дополнительная обработка при запросе данных для каждого лица
      ds:=Gisun.LoadIdentifData(sl,Dokument,nil);
      if ds<>nil then begin
        ds.First;
        FRun:=true;
        EditDataSet(Dokument);
        try
          if ds.FieldByName('IDENTIF').AsString=ENG_edIDENTIF.Text then begin
            DokumentFamilia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
            DokumentNAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
            DokumentOTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
            DokumentFamilia_B.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA_B').AsString);
            DokumentNAME_B.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME_B').AsString);
            DokumentOTCH_B.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH_B').AsString);
            WriteField(DokumentDATER,ds.FieldByName('DATER'));
            DokumentPOL.AsString:=Gisun.CaseFIO(ds.FieldByName('POL').AsString);
//      ???      DokumentGRAG.AsString:=ds.FieldByName('GRAG').AsString;

            DokumentGOSUD.AsString:=ds.FieldByName('GOSUD_R').AsString;
//            DokumentB_OBL.AsBoolean:=ds.FieldByName('B_OBL_R').AsString; // !!!
            DokumentOBL.AsString:=ds.FieldByName('OBL_R').AsString;
            DokumentOBL_B.AsString:=ds.FieldByName('OBL_B_R').AsString;
            DokumentRAION.AsString:=ds.FieldByName('RAION_R').AsString;
            DokumentRAION_B.AsString:=ds.FieldByName('RAION_B_R').AsString;
            DokumentB_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_R').AsString;
            DokumentGOROD.AsString:=ds.FieldByName('GOROD_R').AsString;
            DokumentGOROD_B.AsString:=ds.FieldByName('GOROD_B_R').AsString;

            DokumentM_GOSUD.AsString:=ds.FieldByName('GOSUD_G').AsString;
//            DokumentB_M_OBL.AsString:=ds.FieldByName('B_OBL_G').AsString; // !!!
            DokumentM_OBL.AsString:=ds.FieldByName('OBL_G').AsString;
            DokumentM_RAION.AsString:=ds.FieldByName('RAION_G').AsString;
            DokumentB_M_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_G').AsString;
            DokumentM_GOROD.AsString:=ds.FieldByName('GOROD_G').AsString;
            DokumentM_GOROD_R.AsString:=ds.FieldByName('GOROD_R_G').AsString;
          end;
          PostDataSet(Dokument);
          SetColorChild(GetDisableColorGIS);
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
