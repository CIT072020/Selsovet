unit fDeclIzm;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,DateUtils,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,uSaveMemTable,
  uProject,uTypes, uProjectAll, SelLibFR, uPadegFIO,
  ExtCtrls, OpisEdit, dbFunc, MetaTask, DBLookupEh, DBCtrlsEh, StdCtrls, fGetGISUN1,
  Mask, Grids, DBGridEh, FuncPr, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  Buttons, ImgList, kbmMemCSVStreamFormat, vchDBCtrls, ZipForge;

type
  TfmDeclIzm = class(TfmSimpleD)
    TBItemChoiceMen: TTBItem;
    pc: TPageControl;
    tsTail1: TTabSheet;
    Label13: TLabel;
    edNATION: TDBLookupComboboxEh;
    Label14: TLabel;
    Label22: TLabel;
    edGRAG: TDBLookupComboboxEh;
    tsTail2: TTabSheet;
    pnMain: TPanel;
    lbNomer: TLabel;
    edNomer: TDBEditEh;
    Label28: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label31: TLabel;
    edDOKUMENT: TDBEditEh;
    gbDeti: TGroupBox;
    GridDeti: TDBGridEh;
    dsDeti: TDataSource;
    tbDeti: TkbmMemTable;
    tbDetiFAMILIA: TStringField;
    tbDetiNAME: TStringField;
    tbDetiOTCH: TStringField;
    dsNation: TDataSource;
    dsStran: TDataSource;
    N_F_1: TDBCheckBoxEh;
    tbDetiZAGS_NAME: TStringField;
    tbDetiZAGS_NOMER: TStringField;
    tbDetiZAGS_DATE: TDateField;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentSVID_SERIA: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentDATESV: TDateField;
    DokumentMEN_ID: TIntegerField;
    DokumentLICH_ID: TIntegerField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentFamiliaNa: TStringField;
    DokumentNameNa: TStringField;
    DokumentOtchNa: TStringField;
    DokumentPOL: TStringField;
    DokumentDateR: TDateField;
    DokumentGOSUD: TIntegerField;
    DokumentOBL: TStringField;
    DokumentRAION: TStringField;
    DokumentGOROD: TStringField;
    DokumentNATION: TIntegerField;
    DokumentGRAG: TIntegerField;
    DokumentM_GOSUD: TIntegerField;
    DokumentM_OBL: TStringField;
    DokumentM_RAION: TStringField;
    DokumentM_GOROD: TStringField;
    DokumentM_GOROD_R: TStringField;
    DokumentM_B_RESP: TBooleanField;
    DokumentM_B_OBL: TBooleanField;
    DokumentV_OBAZAN: TBooleanField;
    DokumentDOKUMENT: TMemoField;
    DokumentDETI: TMemoField;
    DokumentSPEC: TStringField;
    DokumentVOSSTAN: TBooleanField;
    DokumentID_ZAGS: TIntegerField;
    DokumentID_SOURCE: TIntegerField;
    DokumentB_RESP: TBooleanField;
    DokumentB_OBL: TBooleanField;
    DokumentREG_ZAGS: TMemoField;
    DokumentREG_DATE: TDateField;
    DokumentFirst_Ekz: TBooleanField;
    DokumentOBL_B: TStringField;
    DokumentRAION_B: TStringField;
    DokumentGOROD_B: TStringField;
    DokumentV_WHO: TMemoField;
    DokumentOTHER: TMemoField;
    Label42: TLabel;
    dsGragd: TDataSource;
    DokumentCOPIA: TBooleanField;
    TBItemArxSpr: TTBItem;
    ImageGISUN: TImage;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    DokumentB_GOROD: TSmallintField;
    DokumentM_B_GOROD: TSmallintField;
    DokumentSTATUS: TStringField;
    DokumentPOLE_GRN: TSmallintField;
    DokumentDOK_TYPE: TSmallintField;
    DokumentDOK_SERIA: TStringField;
    DokumentDOK_NOMER: TStringField;
    DokumentDOK_DATE: TDateField;
    DokumentDOK_ORGAN: TIntegerField;
    DokumentVOENKOM: TIntegerField;
    DokumentTYPEMESSAGE: TStringField;
    DokumentIDENTIF: TStringField;
    edDOK_TYPE: TDBComboBoxEh;
    edDOK_SERIA: TDBEditEh;
    edDOK_NOMER: TDBEditEh;
    Label69: TLabel;
    edDOK_DATE: TDBDateTimeEditEh;
    N_F_cbBelorus: TDBCheckBoxEh;
    tbZakl: TkbmMemTable;
    tbZaklID: TIntegerField;
    tbZaklNAME_ZAGS: TStringField;
    tbZaklNAME_ZAGS_B: TStringField;
    tbZaklID_ZAGS: TIntegerField;
    tbZaklDateIzm: TDateField;
    tbZaklPOVTOR: TBooleanField;
    tbZaklIS_GOROD: TBooleanField;
    tbZaklDATE_ANUL: TDateField;
    tbZaklNOMER: TIntegerField;
    tbZaklDATEZ: TDateField;
    tbZaklMEN_ID: TIntegerField;
    tbZaklLICH_ID: TIntegerField;
    tbZaklADRESAT: TMemoField;
    tbZaklFamilia: TStringField;
    tbZaklName: TStringField;
    tbZaklOtch: TStringField;
    tbZaklPOL: TStringField;
    tbZaklGRAG: TIntegerField;
    tbZaklDateR: TDateField;
    tbZaklRG_B_RESP: TBooleanField;
    tbZaklRG_GOSUD: TIntegerField;
    tbZaklRG_B_OBL: TBooleanField;
    tbZaklRG_OBL: TStringField;
    tbZaklRG_RAION: TStringField;
    tbZaklRG_B_GOROD: TSmallintField;
    tbZaklRG_GOROD: TStringField;
    tbZaklGT_B_RESP: TBooleanField;
    tbZaklGT_GOSUD: TIntegerField;
    tbZaklGT_B_OBL: TBooleanField;
    tbZaklGT_OBL: TStringField;
    tbZaklGT_RAION: TStringField;
    tbZaklGT_RNGOROD: TStringField;
    tbZaklGT_B_GOROD: TSmallintField;
    tbZaklGT_GOROD: TStringField;
    tbZaklGT_GOROD_R: TStringField;
    tbZaklRUKOV: TStringField;
    tbZaklDATE1: TDateField;
    tbZaklDATE2: TDateField;
    tbZaklWHO: TStringField;
    tbZaklPRICH: TStringField;
    tbZaklFamilia_Posle: TStringField;
    tbZaklName_Posle: TStringField;
    tbZaklOtch_Posle: TStringField;
    tbZaklR_NOMER: TStringField;
    tbZaklR_DATE: TDateField;
    tbZaklR_ZAGS: TMemoField;
    tbZaklR_RG_B_RESP: TBooleanField;
    tbZaklR_RG_GOSUD: TIntegerField;
    tbZaklR_RG_B_OBL: TBooleanField;
    tbZaklR_RG_OBL: TStringField;
    tbZaklR_RG_RAION: TStringField;
    tbZaklR_RG_B_GOROD: TSmallintField;
    tbZaklR_RG_GOROD: TStringField;
    tbZaklR_MAT: TStringField;
    tbZaklR_OTEC: TStringField;
    tbZaklWORK: TMemoField;
    tbZaklVUS: TMemoField;
    tbZaklSUPRUG: TStringField;
    tbZaklB_NOMER: TStringField;
    tbZaklB_DATE: TDateField;
    tbZaklB_ZAGS: TMemoField;
    tbZaklROVD: TStringField;
    tbZaklROVD_DATE: TDateField;
    tbZaklROVD_ZAKL: TMemoField;
    tbZaklSOOB: TMemoField;
    tbZaklIZMEN: TMemoField;
    tbZaklR_Familia: TStringField;
    tbZaklR_Name: TStringField;
    tbZaklR_OTCH: TStringField;
    tbZaklOTEC: TStringField;
    tbZaklMAT: TStringField;
    tbZaklIS_IZMEN: TBooleanField;
    tbZaklFIO_NEW: TStringField;
    tbZaklDeti: TkbmMemTable;
    tbZaklDetiFIO: TStringField;
    tbZaklDetiMESTO: TStringField;
    tbZaklDetiDATER: TDateField;
    tbZaklDetiMESTOREG: TStringField;
    tbZaklDetiNOMER: TStringField;
    tbZaklDetiDATEA: TDateField;
    TBItemZaklChName: TTBItem;
    DokumentPOSHLINA: TMemoField;
    DokumentSUM_POSHLINA: TFloatField;
    tbDetiGOD_ROG: TStringField;
    Panel1: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    tbDetiDATER: TDateField;
    DokumentDETI_DATER: TBooleanField;
    DokumentM_RNGOROD: TStringField;
    Label9: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    edB_RESP: TDBCheckBoxEh;
    edGOSUD: TDBLookupComboboxEh;
    edB_OBL: TDBCheckBoxEh;
    edGOROD: TDBEditEh;
    BLR_edOBL: TDBEditEh;
    BLR_edRAION: TDBEditEh;
    edB_GOROD: TDBLookupComboboxEh;
    edRAION: TDBEditEh;
    edOBL: TDBEditEh;
    BLR_edGorod: TDBEditEh;
    BLR_edGosud: TDBLookupComboboxEh;
    BLR_edB_GOROD: TDBLookupComboboxEh;
    Label36: TLabel;
    tbDetiMESTOR: TStringField;
    lbSpec: TvchDBText;
    edSpec: TDBEditEh;
    DokumentADD_DOK: TMemoField;
    DokumentWORK: TStringField;
    DokumentADD_SUD: TStringField;
    DokumentPRICH: TStringField;
    DokumentNATION_DOK: TStringField;
    Label18: TLabel;
    Label23: TLabel;
    edM_RNGOROD: TDBLookupComboboxEh;
    Label35: TLabel;
    Label20: TLabel;
    edM_B_RESP: TDBCheckBoxEh;
    edM_GOSUD: TDBLookupComboboxEh;
    edM_RAION: TDBEditEh;
    edM_GOROD_R: TDBEditEh;
    Label19: TLabel;
    Label21: TLabel;
    edM_B_OBL: TDBCheckBoxEh;
    edM_OBL: TDBEditEh;
    edM_B_GOROD: TDBLookupComboboxEh;
    edM_GOROD: TDBEditEh;
    Label24: TLabel;
    edPRICH: TDBEditEh;
    lbPrich: TLabel;
    Label27: TLabel;
    edWORK_PLACE: TDBEditEh;
    DokumentTYPE_BRAK: TIntegerField;
    DokumentB_DATE2: TDateField;
    DokumentB_ZAGS: TStringField;
    DokumentB_NOMER: TStringField;
    edNationDok: TDBEditEh;
    edAddDok: TDBMemo;
    lbZapis: TLabel;
    edZDate: TDBDateTimeEditEh;
    DokumentKOD_PRICH: TIntegerField;
    DokumentB_DATE: TDateField;
    btChoiceChild: TBitBtn;
    DokumentOTMETKA_ISP: TStringField;
    DokumentPRIM: TStringField;
    lbAddSud: TLabel;
    edAddSud: TDBEditEh;
    pnFIO: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lbTypeZapis: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    edOtch: TDBEditEh;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edTypeAkt: TDBComboBoxEh;
    edRegDate: TDBDateTimeEditEh;
    edRegZags: TDBEditEh;
    N_F_cbSklonen: TDBCheckBoxEh;
    Label4: TLabel;
    edPol: TDBComboBoxEh;
    Label26: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    Label7: TLabel;
    edDATER: TDBDateTimeEditEh;
    Label61: TLabel;
    edFamiliaNa: TDBEditEh;
    Label62: TLabel;
    edNameNa: TDBEditEh;
    Label63: TLabel;
    edOtchNa: TDBEditEh;
    Label64: TLabel;
    pnTypeBrak: TPanel;
    edTypeBrak: TDBComboBoxEh;
    pnZags: TPanel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edB_NOMER: TDBEditEh;
    edB_DATE: TDBDateTimeEditEh;
    edB_ZAGS: TDBEditEh;
    pnSud: TPanel;
    Label38: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label37: TLabel;
    edSud: TDBEditEh;
    edSudDateSila: TDBDateTimeEditEh;
    edSudDate: TDBDateTimeEditEh;
    Label5: TLabel;
    edCurValues: TDBMemo;
    Label39: TLabel;
    edNewValues: TDBMemo;
    N_F_cbIzm: TDBCheckBoxEh;
    N_F_cbDopoln: TDBCheckBoxEh;
    N_F_cbIsprav: TDBCheckBoxEh;
    DokumentIS_IZMEN: TBooleanField;
    DokumentIS_DOPOLN: TBooleanField;
    DokumentIS_ISPRAV: TBooleanField;
    DokumentTYPEAKT: TSmallintField;
    DokumentZ_DATE: TDateField;
    DokumentZ_NOMER: TIntegerField;
    DokumentCURVALUES: TMemoField;
    DokumentNEWVALUES: TMemoField;
    Label17: TLabel;
    N_F_cbVUS: TDBCheckBoxEh;
    edVoenkom: TDBLookupComboboxEh;
    tsAdd: TTabSheet;
    tbZapros: TkbmMemTable;
    tbZaprosFLD_ORG: TStringField;
    tbZaprosFLD_TEXT: TStringField;
    tbZaprosFLD_DATEZ: TStringField;
    tbZaprosFLD_DATEO: TStringField;
    GroupBox1: TGroupBox;
    GridZapros: TDBGridEh;
    Panel3: TPanel;
    btAddZapros: TBitBtn;
    btDelZapros: TBitBtn;
    dsZapros: TDataSource;
    lbOtmIsp: TLabel;
    edOtmIsp: TDBEditEh;
    edPrim: TDBEditEh;
    Label40: TLabel;
    DokumentREG_NOMER: TIntegerField;
    edRegNomer: TDBNumberEditEh;
    btAktBrak: TBitBtn;
    DokumentFamiliaNa_B: TStringField;
    DokumentBRAK_ID: TIntegerField;
    DokumentTYPE_FAM: TSmallintField;
    DokumentFAM1: TStringField;
    DokumentFAM2: TStringField;
    DokumentFIO1: TStringField;
    DokumentFIO2: TStringField;
    DokumentST21: TBooleanField;
    pnFAM: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label56: TLabel;
    edFAM1: TDBEditEh;
    edFAM2: TDBEditEh;
    pnSt21: TPanel;
    lbFIO1: TLabel;
    edFIO1: TDBEditEh;
    lbFIO3: TLabel;
    edTypeFam: TDBComboBoxEh;
    lbFIO2: TLabel;
    edFIO2: TDBEditEh;
    Label15: TLabel;
    edFamiliaNa21: TDBEditEh;
    Label16: TLabel;
    BLR_edFamiliaNa21: TDBEditEh;
    TBSubmenuChoiceBrak: TTBSubmenuItem;
    TBItemChoiceBrakON: TTBItem;
    procedure FormResize(Sender: TObject);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edFamiliaPosleEnter(Sender: TObject);
    procedure edNamePosleEnter(Sender: TObject);
    procedure edOtchPosleEnter(Sender: TObject);
    procedure edFamiliaDoCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
    procedure edFamiliaDoEnter(Sender: TObject);
    procedure edNameDoEnter(Sender: TObject);
    procedure edOTCHDOEnter(Sender: TObject);
    procedure N_F_cbVUSClick(Sender: TObject);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edOBL_RNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edRaion_RNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure edDATERUpdateData(Sender: TObject; var Handled: Boolean);
    function EmptyIzm: String; override;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure GridDetiTitleBtnClick(Sender: TObject; ACol: Integer;    Column: TColumnEh);
    procedure TBItemGetDataGISUNClick(Sender: TObject);
    procedure SpeedButtonClick(Sender: TObject);
    procedure edSpecEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edTypeBrakChange(Sender: TObject);
    procedure edVoenkomEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edVoenkomEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure edVoenkomEditButtons2Click(Sender: TObject;      var Handled: Boolean);
    procedure edVoenkomChange(Sender: TObject);
    procedure GridDetiColEnter(Sender: TObject);
    procedure edPRICHEditButtons0Click(Sender: TObject;        var Handled: Boolean);
    procedure edPRICHEditButtons1Click(Sender: TObject;        var Handled: Boolean);
    procedure btChoiceChildClick(Sender: TObject);
    procedure edDateZUpdateData(Sender: TObject; var Handled: Boolean);
    procedure btAddZaprosClick(Sender: TObject);
    procedure btDelZaprosClick(Sender: TObject);
    procedure dsDetiDataChange(Sender: TObject; Field: TField);
    procedure btAktBrakClick(Sender: TObject);
    procedure TBItemChoiceBrakONClick(Sender: TObject);
    procedure TBSubmenuChoiceBrakClick(Sender: TObject);
  private
    FRunSetTypeDecl:Boolean;
    FSt21:Boolean;
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    procedure CheckFont;
    function GetTypeBrak:Integer;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    function BeforeEdit : Boolean; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    procedure UpdateActions; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure CheckDeti_Dater;
    procedure SetOnlyPovtorSvid(lOnlyPovtor: Boolean;  pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;  lbSvid, lbNomer: TLabel);

    procedure SetTypeDecl;
    procedure ChoiceBrak(lOna:Boolean);
    procedure PostDokument; override;

  end;

function EditDeclIzm( nID : Integer; slPar:TStringList) : boolean;

var
  fmDeclIzm: TfmDeclIzm;

implementation

uses dBase, fMain, fShablon, uDataSet2XML, fZapisBrak;

{$R *.DFM}
{$I Task.inc}

{ TfmDeclIzm }

function EditDeclIzm( nID : Integer; slPar:TStringList) : boolean;
begin
//  result := true;
  fmDeclIzm := TfmDeclIzm.Create(nil);
  fmDeclIzm.IsCreateForm:=false;
  if slPar<>nil then begin
    fmDeclIzm.AssignPar(slPar);
//  obj:=ObjectFromParams(slPar,'DATASET_CHNAME');
    if fmDeclIzm.GetParam('ST21','0')='1' then begin
      fmDeclIzm.FSt21:=true;
      fmDeclIzm.Caption:='Заявление об изменении фамилии, избранной при заключении брака';
    end;
  end;
  try
    fmDeclIzm.IsReadDokument:=true;
    if nID=-1 then begin
      fmDeclIzm.NewDok(true);
      fmDeclIzm.SetIDZags;
      fmDeclIzm.CheckEnabledNameOrgan(true);
    end else begin
      fmDeclIzm.ReadDok( nID );
      fmDeclIzm.CheckEnabledNameOrgan(false);
    end;
    fmDeclIzm.IsReadDokument:=false;
    fmDeclIzm.SetTypeDecl;
    {$IFDEF GISUN}
//      fmDeclIzm.CheckAkt_GISUN(0);
//      Gisun.CheckChName(fmZapisChName);
//      fmZapisChName.CheckImageGisun(fmZapisChName.DokumentPOLE_GRN,fmZapisChName.ImageGISUN);
//      fmDeclIzm.BeforeEditFormGISUN;
    {$ENDIF}
    fmDeclIzm.TBItemZAGS.Visible:=false;
    fmDeclIzm.TBSubmenuRun.Visible:=false;
    result := fmDeclIzm.EditModal;
  finally
    fmDeclIzm.Free;
    fmDeclIzm := nil;
  end;
end;

function TfmDeclIzm.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_DIzm); //
end;
//-----------------------------------------------------
procedure TfmDeclIzm.SetTypeDecl;
var
  l:Boolean;
begin
  if not FRunSetTypeDecl and not IsReadDokument and not IsCreateForm then begin
    FRunSetTypeDecl:=true;
    try
      if FSt21
        then l:=true
        else l:=false;
      TBSubmenuChoiceBrak.Enabled:=l and DokumentZ_DATE.IsNull and (FAddNewDok or (DokumentBRAK_ID.AsInteger=0));
      btAktBrak.Visible:=FSt21;
      btAktBrak.Enabled:=l and (DokumentBRAK_ID.AsInteger>0);
      if FSt21 then begin
        lbZapis.Caption:='Внесены изменения в запись акта о браке';
        gbDeti.Caption:=' Сведение об общих несовершеннолетних детях ';    //'Сведение о детях';
        lbTypeZapis.Caption:='Внести изменения в запись акта о браке';
        edTypeAkt.Visible:=false;
      end;

      GridDeti.Columns[6].Visible:=l;
      GridDeti.Columns[7].Visible:=l;
      GridDeti.Columns[8].Visible:=l;

      SetVisibleControls([edFamiliaNa, edNameNa, edOtchNa, lbAddSud, edAddSud, edTypeBrak, pnZags, pnSud], not l);
      SetVisibleControls([Label5, N_F_cbIzm, N_F_cbDopoln, N_F_cbIsprav, edCurValues, edNewValues], not l);

      if FSt21 then begin
        pnFIO.Height:=edFamiliaNa.Top-1;
        pnFAM.Left:=0;
        pnFAM.Top:=lbAddSud.Top;
        pnFAM.Width:=tsTail2.ClientWidth-5;
        pnSt21.Top:=pnFIO.Top+pnFIO.Height+2; // N_F_cbIzm.Top-1;
        pnSt21.Left:=0;
        pnSt21.Width:=pnFIO.Width;
        pnSt21.Height:=edPRICH.Top-pnSt21.Top-10;
      end;
      SetVisibleControls([pnSt21,pnFam], l);
    finally
      FRunSetTypeDecl:=false;
    end;
  end;
end;
//-----------------------------------------------------
function TfmDeclIzm.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

  DokumentMEN_ID.AsString := '';

  DokumentTYPE_BRAK.AsInteger:=1;
  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean := false;
  DokumentB_RESP.AsBoolean     := true;
  DokumentB_OBL.AsBoolean      := true;

  DokumentM_B_RESP.AsBoolean   := true;
  DokumentM_B_OBL.AsBoolean    := true;

  DokumentB_GOROD.AsInteger    := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentM_B_GOROD.AsInteger  := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentDETI_DATER.AsBoolean:=true;

  DokumentFirst_Ekz.AsBoolean := true;
  DokumentVOSSTAN.AsBoolean := false;
  DokumentV_OBAZAN.AsBoolean := false;
  DokumentST21.AsBoolean := FSt21;
  if FSt21 then begin
    DokumentIS_IZMEN.AsBoolean:=true;
    DokumentTYPEAKT.AsInteger:=_TypeObj_ZBrak;
    DokumentTYPE_FAM.AsInteger:=1;
    DokumentTYPE_BRAK.AsInteger:=1;
  end;

  N_F_cbBelorus.Checked:=False;
  inherited NewDok(lAppend);

  CheckDeti_Dater;

  QueryExit:=false;
  Result := true;
end;
{
procedure TfmZapisChName.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
//--------------------------------------------------------------------
function TfmDeclIzm.ReadDok(nID: Integer): Boolean;
var
  i,j : Integer;
  fld : TField;
  strField,strDeti : String;
  arr : TArrStrings;
  sl  : TStringList;
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

  ds2xml.StringToXML(FMainTable.FieldByName('ADD_FIELDS').AsString);
  ds2xml.XMLToData;

  ReadDopProperty(TypeObj, DokumentID.AsInteger, STOD('1899-12-30',tdAds));
  DokumentCOPIA.AsBoolean := false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentDETI_DATER.IsNull then DokumentDETI_DATER.AsBoolean:=true;
  if DokumentST21.IsNull then DokumentST21.AsBoolean:=false;
  FSt21:=DokumentST21.AsBoolean;
  if FSt21 then begin
    DokumentIS_IZMEN.AsBoolean := true;
    DokumentTYPEAKT.AsInteger:=_TypeObj_ZBrak;
    DokumentTYPE_BRAK.AsInteger:=1;
  end;

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;

  ReadHistory(nID, TypeObj);

  strDeti := FMainTable.FieldByName('DETI').AsString;
  StrToArr(strDeti, arr, Chr(13), true);
  sl := TStringList.Create;
  tbDeti.EmptyTable;
  for i:=Low(arr) to High(arr) do begin
    sl.CommaText := arr[i];
    tbDeti.Append;
    for j:=0 to sl.Count-1 do begin

      if Pos('chr(34)', sl.Strings[j])> 0
        then sl.Strings[j]:=StringReplace(sl.Strings[j],'chr(34)','"',[rfReplaceAll]);

      if (sl.Strings[j]<>'') and (j<tbDeti.FieldCount) then begin
        if (tbDeti.Fields[j].DataType = ftDate) and  (sl.Strings[j]<>'') then begin
          try
            tbDeti.Fields[j].AsDateTime := STOD(sl.Strings[j],tdAds);
          except
          end;
        end else begin
          tbDeti.Fields[j].AsString := sl.Strings[j];
        end;
      end;
    end;
    tbDeti.Post;
  end;
  sl.Free;

  // Запросы
  tbZapros.EmptyTable;
  ReadZapros(tbZapros, TypeObj, nID);

  if DokumentPOL.AsString = 'М' then begin
    edNation.ListField:='NAME_M';
  end else begin
    edNation.ListField:='NAME_G';
  end;

  CheckDeti_Dater;
  CheckFont;
  //---------------------------------------
end;

function TfmDeclIzm.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  sSeria,sNomer,sRukov,sRukovB,sSpec,sSpecB : String;
  strField, strErr, strDate,s : String;
  strRec, strDeti : String;
  vKeyValues : Variant;
  dLastSost : TDateTime;
  dDate : TDateTime;
  lFullWrite : Boolean;
  arr:TArrStrings;
  procedure AddErr(s:String); begin  strErr:=strErr+s+chr(13)+chr(10); end;
begin
  FLastError:='';
  PostDataSet(Dokument);
  PostDataSet(tbDeti);
  PostDataSet(tbZapros);
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
    AddErr(' Заполните дату заявления. ');
  end else if DokumentNOMER.AsString='' then begin
    AddErr(' Заполните номер заявления. ');
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
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    FMainTable.Edit;
    if lFullWrite then begin
      for i:=1 to FMainTable.FieldCount-1 do begin
        strField := FMainTable.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          FMainTable.Fields[i].Value := fld.Value;
        end;
      end;

      WriteDopProperty(TypeObj, DokumentID.AsInteger, STOD('1899-12-30',tdAds));

      WriteHistory(nID, TypeObj);

      strDeti := '';
      tbDeti.First;
      while not tbDeti.Eof do begin
        if tbDetiZAGS_DATE.IsNull then begin
          strDate := '';
        end else begin
          strDate := DTOS(tbDetiZAGS_DATE.AsDateTime, tdAds);
        end;

        if tbDetiDATER.IsNull
          then s:=''
          else s:=DTOS(tbDetiDATER.AsDateTime,tdAds);

        strRec := '"'+tbDetiFAMILIA.AsString+'",'+
                  '"'+tbDetiNAME.AsString+'",'+
                  '"'+tbDetiOTCH.AsString+'",'+
                  '"'+tbDetiGOD_ROG.AsString+'",'+
                  '"'+StringReplace(tbDetiZAGS_NAME.AsString,'"','chr(34)',[rfReplaceAll])+'",'+
                  '"'+tbDetiZAGS_NOMER.AsString+'",'+
                  '"'+strDate+'",'+
                  '"'+s+'",'+
                  '"'+StringReplace(tbDetiMESTOR.AsString,'"','chr(34)',[rfReplaceAll])+'"'+
                  Chr(13);
        strDeti := strDeti + strRec;
        tbDeti.Next;
      end;
      FMainTable.FieldByName('DETI').AsString := strDeti;
      FMainTable.FieldByName('VOSSTAN').AsBoolean := false;

    end;

    //----- Запросы ----------------------------
    WriteZapros(tbZapros,TypeObj,nID);

    WriteDateIzm;
    WriteForAllDok_BeforePost;

    if ds2xml.DataToXML then begin
      FMainTable.FieldByName('ADD_FIELDS').AsString:=ds2xml.XMLToString;
    end else begin
      PutError(ds2xml.LastError,self);
    end;

    FMainTable.Post;
//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);

    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    AdditiveWriteDok;

    QueryExit:=false;
    Result := true;
  end;
  if Result then FlushBuffers;
end;

function TfmDeclIzm.EmptyIzm: String;
begin
  Result:=SprChName_EmptyIzm;  // uProject
end;

procedure TfmDeclIzm.FormResize(Sender: TObject);
begin
//  gbDeti.Width := Self.ClientWidth-8;
end;
//------------------------------------------------------------------------
constructor TfmDeclIzm.Create(Owner: TComponent);
var
  n:Integer;
  d2xml:TDataSet2XML;
  Opis:TOpisEdit;
  i:Integer;
begin
  inherited;
  FRunSetTypeDecl:=false;
  FSt21:=false;
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL');
  if Opis<>nil then begin
    for i:=0 to Opis.Items.Count-1 do begin
      edTypeAkt.Items.Add(Opis.Items[i]);
      edTypeAkt.KeyItems.Add(Opis.KeyList[i]);
    end;
  end;
  FCheckLookupField:=false;   // так как все поля (область,район,город) переделаны на DbEditEh.MRUList;
  TBItemSvidIspor.Visible := false;
  TBItemZAGS.Visible := false;
//  Dokument.Active:=true;
  if not Dokument.Active then Dokument.Active:=true;
  if not tbDeti.Active   then tbDeti.Active:=true;
  if not tbZapros.Active then tbZapros.Active:=true;
  FFieldDolgRuk:='';
  FFieldDolgSpec:='SPEC_D';

  d2xml:=ds2xml.DS_Add(Dokument,true);
  d2xml.FClearRecord:=false;
  d2xml.FWriteNull:=false;
  d2xml.SetWriteFields('SPEC_D;ADD_SUD;WORK_PLACE;OTMETKA_ISP;PRIM;');

  FDokZAGS := true;
  TypeObj := _TypeObj_DIzm;
  FCheckKeyGrid:=true;

  edPRICH.EditButtons[1].Glyph:=ImBtClear.Picture.Bitmap;

//  SetLength(FArrChoiceRekv,13);
  InitArrChoiceRekv(12);
  n:=0;
  FArrChoiceRekv[n].nType:=SHABLON_DOKUMENT;
  FArrChoiceRekv[n].FieldName:='DOKUMENT';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=SHABLON_NATION;
  FArrChoiceRekv[n].FieldName:='NATION_DOK';
  Inc(n,1);   // д.б.    FArrChoiceRekv[2]  используется в edTypeBrakChange
  FArrChoiceRekv[2].nType:=SHABLON_REG;
  FArrChoiceRekv[2].FieldName:='B_ZAGS';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[n].FieldName:='M_GOROD_R';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_VUS;
  FArrChoiceRekv[n].FieldName:='VOENKOM';
//  FArrChoiceRekv[n].sPadeg:='Т';
  Inc(n,1);
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[n].FieldName:='GOSUD';
  Inc(n,1);
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[n].FieldName:='M_GOSUD';
  Inc(n,1);
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[n].FieldName:='GRAG';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[n].FieldName:='WORK';
//  Inc(n,1);
//  FArrChoiceRekv[n].nType:=0;
//  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_ZAGS;
//  FArrChoiceRekv[n].FieldName:='ZAGS_NAME';
//  FArrChoiceRekv[n].DataSet:=tbDeti;
  Inc(n,1);
  FArrChoiceRekv[n].nType:=0;
  FArrChoiceRekv[n].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[n].FieldName:='REG_ZAGS';
//  FArrChoiceRekv[n].AddFieldsName:='ID_SOURCE=ID';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=SHABLON_DOCS;
  FArrChoiceRekv[n].FieldName:='ADD_DOK';
  Inc(n,1);
  FArrChoiceRekv[n].nType:=SHABLON_ISP_DECL_BRAK;
  FArrChoiceRekv[n].FieldName:='OTMETKA_ISP';

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_ROGD,btChoiceChild.Glyph);

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddZapros.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelZapros.Glyph);

  AddButton_LoadIdentif(ENG_edIDENTIF);

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbDeclIzm;
  dsGragd.DataSet := dmBase.SprGragd;
  FPageControl := pc;
  pc.ActivePageIndex:=0;
//  edFamiliaPosle.OnExit := OnDestroyHint;
//  edNamePosle.OnExit := OnDestroyHint;
//  edOtchPosle.OnExit := OnDestroyHint;
//  fmMain.SetCurrentDokument(Dokument);
  dmBase.SetDateFormat(tbDeti);
  dmBase.SetDateFormat(tbZapros);

  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;

  {$IFDEF ZAGS}
//    edON_Familia.EditButtons.Items[0].Visible:=false;
//    edONA_Familia.EditButtons.Items[0].Visible:=false;
//    cbProvDvig.Visible := false;
//    cbProvDvig.Checked := false;
//    gbLich.Visible:=false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
    TBItemArxSpr.Visible:=false;
    edCopy.Visible := false;
    cbPovtor.Visible := false;
  {$ENDIF}

  edFamilia.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateData;
  edOtch.OnUpdateData:=FIOUpdateData;

  edFamiliaNa.OnUpdateData:=FIOUpdateData;
  edNameNa.OnUpdateData:=FIOUpdateData;
  edOtchNa.OnUpdateData:=FIOUpdateData;

//  BLR_edFamiliaPosle.OnUpdateData:=FIOUpdateData;
//  BLR_edNamePosle.OnUpdateData:=FIOUpdateData;
//  BLR_edOtchPosle.OnUpdateData:=FIOUpdateData;

  ENG_edIdentif.OnUpdateData:=IN_UpdateData;

//  SetVisibleNomerEkz(pnMain, edDateSv, N_F_1);

  {$IFDEF GISUN}
  if IsActiveGISUN then
    SetControlCharCase(ecUpperCase,
      [
       edFamilia, edName, edOtch, edFamiliaNa, edNameNa, edOtchNa
      ]);
  {$ENDIF}

  edGOROD.OnUpdateData:=CityUpdate;
  edM_GOROD.OnUpdateData:=CityUpdate;

//  n:=2;
//  SetLength(FArrAddProperty,n);
//  SetAddProperty(0, 'OTHER', '', ftMemo);
//  {$IFDEF GISUN}
    // типы нас. пунктов в кодах ГИС РН
//    SetLength(FArrAddProperty,n+2);
//    SetAddProperty(n+0, 'RN_B_GOROD', '', ftString);
//    SetAddProperty(n+1, 'RN_M_B_GOROD', '', ftString);
//  {$ENDIF}

//  SetcbBel(N_F_cbBelorus);
{
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;
}
  SetLength(FArrCheckBelField,3);
  WriteToArrCheck(0,  1, false, 'OBL'      , 'OBL_B');
  WriteToArrCheck(1,  2, false, 'RAION'    , 'RAION_B');
  WriteToArrCheck(2,  3, true, 'GOROD'    , 'GOROD_B');

  SetLength(FArrCheckField,2);
  WriteToArrCheck(0,  1, false, 'M_OBL'   );
  WriteToArrCheck(1,  2, false, 'M_RAION' );


//  SetPanelPovtor(tsPovtor, N_F_cbPovtor,lbRuk,lbSpec);

  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbDeti,'Deti','Дети');
    CreatefrxDBdataSet(self,tbZapros,'Zapros','Запросы');
  {$ENDIF}

  {$IFDEF GISUN}
//    FImageGisun:=ImageGISUN;
//    FPoleGRN:=DokumentPOLE_GRN;
//    ImageGISUN.Visible := IsActiveGISUN;
//    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
//    FSubmenuGISUN:=TBSubmenuGISUN;
//    CheckMenuGISUN;
//    AfterCreateFormGISUN;
    CheckMenuGISUN('ZAPROS');
    AfterCreateFormGISUN;       
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}

end;

destructor TfmDeclIzm.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmDeclIzm.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;
    edZAGS.DataField := 'NAME_ZAGS_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
  end else begin
    ActivateRUSKeyboard;
    edZAGS.DataField := 'NAME_ZAGS';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
  end;
end;

procedure TfmDeclIzm.OnDestroyHint(Sender : TObject);
begin
  DestroyHint(H);
end;

procedure TfmDeclIzm.edFamiliaPosleEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaPosle,DokumentFamiliaPosle.AsString+' ');
end;

procedure TfmDeclIzm.edNamePosleEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edNAMEPosle,DokumentNAMEPosle.AsString+' ');
end;

procedure TfmDeclIzm.edOtchPosleEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edOTCHPosle,DokumentOTCHPosle.AsString+' ');
end;

procedure TfmDeclIzm.edFamiliaDoCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmDeclIzm.edFamiliaDoEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaDo,DokumentFamiliaDo.AsString+' ');
end;

procedure TfmDeclIzm.edNameDoEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edNAMEDo,DokumentNAMEDo.AsString+' ');
end;

procedure TfmDeclIzm.edOTCHDOEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edOTCHDo,DokumentOTCHDo.AsString+' ');
end;

procedure TfmDeclIzm.N_F_cbVUSClick(Sender: TObject);
begin
  if N_F_cbVUS.Checked then begin
    edVoenkom.Enabled:=true;
//    edV_WHO.Enabled := true;
  end else begin
    edVoenkom.Value:=null;
    edVoenkom.Enabled:=false;
//    EditDataSet(Dokument);
//    DokumentV_WHO.AsString := '';
  end;
end;

procedure TfmDeclIzm.UpdateActions;
begin
  inherited;
//  if N_F_cbVUS.Checked then begin
//    edVoenkom.Enabled:=true;
//    edV_WHO.Enabled := true;
//  end else begin
//    edVoenkom.Enabled:=false;
//    edV_WHO.Enabled := false;
//  end;
end;

procedure TfmDeclIzm.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol : TPol;
begin
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    FRun := true;
    if FCheckBelName then begin
      strField := UpperCase(Field.FieldName);
      EditDataSet(Dokument);
      Pol := tpNone;
      if strField='NAME' then begin
      end;
//      CheckForAll_Bel(Field);
      if Pol <> tpNone then begin
        if Pol = tpM then begin
          DokumentPOL.AsString := 'М';
        end else begin
          DokumentPOL.AsString := 'Ж';
        end;
      end;
      if (Pol <> tpNone) or (strField='POL') then begin
        if DokumentPOL.AsString = 'М' then begin
          edNation.ListField:='NAME_M';
        end else begin
          edNation.ListField:='NAME_G';
        end;
      end;
    end;
    FRun := false;
  end;
  inherited;
end;

procedure TfmDeclIzm.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmDeclIzm.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmDeclIzm.edOBL_RNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmDeclIzm.edRaion_RNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmDeclIzm.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetChName(Self);
//  Gisun.CheckChName(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmDeclIzm.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterChName(Self);
//  Gisun.CheckChName(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmDeclIzm.pcChange(Sender: TObject);
begin
  inherited;
  {
  if pc.ActivePageIndex>-1 then begin

    if pc.Pages[pc.ActivePageIndex].Name='tsSvid'
      then CheckForAll_Bel( nil )
      else N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];

//    if (pc.ActivePageIndex=1) or (pc.Pages[pc.ActivePageIndex].Name='tsSvid')
//      then N_F_cbPovtor.Parent:=pc.Pages[pc.ActivePageIndex];

  end;
  }
end;

procedure TfmDeclIzm.edDATERUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 13);
end;

//--------------------------------------------------------------------
function TfmDeclIzm.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result:= inherited BeforeEdit;

// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edGOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edM_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edM_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edM_RAION,n,2,true,false,false,FAddButtonMRUList);

end;

procedure TfmDeclIzm.Button1Click(Sender: TObject);
begin
  SaveDokumentToFile;
end;

procedure TfmDeclIzm.Button2Click(Sender: TObject);
var
  sFile,sErr:String;
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


procedure TfmDeclIzm.btAddChildClick(Sender: TObject);
begin
  QueryExit:=true;
  tbDeti.Append;
  ActiveControl:=GridDeti;
end;

procedure TfmDeclIzm.btDelChildClick(Sender: TObject);
begin
  if tbDeti.RecordCount>0 then begin
    QueryExit:=true;
    tbDeti.Delete;
    ActiveControl:=GridDeti;
  end;
end;

//--------------------------------------------------------------------------------------
procedure TfmDeclIzm.CheckDeti_Dater;
begin
  if DokumentDETI_DATER.AsBoolean then begin
    GridDeti.FieldColumns['GOD_ROG'].Visible:=false;
    GridDeti.FieldColumns['DATER'].Visible:=true;
  end else begin
    GridDeti.FieldColumns['GOD_ROG'].Visible:=true;
    GridDeti.FieldColumns['DATER'].Visible:=false;
  end;
end;
//--------------------------------------------------------------------------------------
procedure TfmDeclIzm.GridDetiTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  EditDataSet(Dokument);
  if Column.FieldName='GOD_ROG' then begin
    DokumentDETI_DATER.AsBoolean:=true;
  end else if Column.FieldName='DATER' then begin
    DokumentDETI_DATER.AsBoolean:=false;
  end;
  CheckDeti_Dater;
end;

procedure TfmDeclIzm.SetOnlyPovtorSvid(lOnlyPovtor: Boolean;  pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;  lbSvid, lbNomer: TLabel);
begin
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
end;

//-------------------------------------------------------------------------------------
procedure TfmDeclIzm.TBItemGetDataGISUNClick(Sender: TObject);
var
//arr:TCurrentRecord;
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
    if GetInfoGISUN1(Self,'IDENTIF', '') then begin
      sl:=TStringList.Create;
      if ENG_edIDENTIF.Text<>'' then begin
        sl.Add('ON='+ENG_edIDENTIF.Text);
      end;
      ds:=Gisun.LoadIdentifData(sl,nil,nil);
      if ds<>nil then begin
        ds.First;
//        Gisun.LoadPersonalData(edON_IDENTIF.Text, arr);
        FRun:=true;
        EditDataSet(Dokument);
        try
        while not ds.Eof do begin
          if ds.FieldByName('IDENTIF').AsString=ENG_edIDENTIF.Text then begin
            DokumentFamilia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
            DokumentNAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
            DokumentOTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
            DokumentFamiliaNa.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
            DokumentNameNa.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
            DokumentOtchNa.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
            try
              WriteField(DokumentDATER,ds.FieldByName('DATER'));
            except
            end;
            DokumentGRAG.AsString:=ds.FieldByName('GRAG').AsString;
            DokumentPOL.AsString:=ds.FieldByName('POL').AsString;

            DokumentDOK_TYPE.AsString:=ds.FieldByName('DOK_TYPE').AsString;
            WriteField(DokumentDOK_DATE,ds.FieldByName('DOK_DATE'));
            DokumentDOK_SERIA.AsString:=ds.FieldByName('DOK_SERIA').AsString;
            DokumentDOK_NOMER.AsString:=ds.FieldByName('DOK_NOMER').AsString;
            DokumentDOKUMENT.AsString:=ds.FieldByName('DOKUMENT').AsString;

            DokumentGOSUD.AsString:=ds.FieldByName('GOSUD_R').AsString;
            DokumentOBL.AsString:=ds.FieldByName('OBL_R').AsString;
            DokumentB_OBL.AsString:=ds.FieldByName('B_OBL_R').AsString; // !!!

            DokumentOBL_B.AsString:=ds.FieldByName('OBL_B_R').AsString;
            DokumentRAION.AsString:=ds.FieldByName('RAION_R').AsString;
            DokumentRAION_B.AsString:=ds.FieldByName('RAION_B_R').AsString;
            DokumentB_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_R').AsString;
            DokumentGOROD.AsString:=ds.FieldByName('GOROD_R').AsString;
            DokumentGOROD_B.AsString:=ds.FieldByName('GOROD_B_R').AsString;


            DokumentM_GOSUD.AsString:=ds.FieldByName('GOSUD_G').AsString;
            DokumentM_OBL.AsString:=ds.FieldByName('OBL_G').AsString;
//              DokumentON_M_B_OBL.AsString:=''; // !!!
            DokumentM_RAION.AsString:=ds.FieldByName('RAION_G').AsString;
            DokumentM_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_G').AsString;
            DokumentM_GOROD.AsString:=ds.FieldByName('GOROD_G').AsString;

            DokumentM_GOROD_R.AsString:=ds.FieldByName('GOROD_R_G').AsString; //GetGorodR(OutPut);

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
//----------------------------------------------------------------------------------------------------
procedure TfmDeclIzm.SpeedButtonClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentFamiliaNa.AsString:=DokumentFamilia.AsString;
  DokumentNameNa.AsString:=DokumentName.AsString;
  DokumentOtchNa.AsString:=DokumentOtch.AsString;
end;
//----------------------------------------------------------------------------------------------------
procedure TfmDeclIzm.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;
//---------------------------------------------------------------
procedure TfmDeclIzm.edTypeBrakChange(Sender: TObject);
var
  nValue:Integer;
begin
  if not FSt21 then begin
    nValue:=GetTypeBrak;
    if (nValue=2) then begin
  //    pcBrak.Visible:=false;
      pnZags.Visible:=false;
      pnSud.Visible:=false;
  //    edTypeBrak.HelpContext:=999;
    end else if (nValue=1) or (nValue=4) or (nValue=5) then begin
  //    pcBrak.Visible:=true;
  //    pcBrak.ActivePage:=tsBrak;
      pnZags.Visible:=true;
      pnSud.Visible:=false;
  //    edTypeBrak.HelpContext:=0;
    end else if (nValue=3) then begin    // решение суда
      pnZags.Visible:=false;
      pnSud.Top:=pnZags.Top;
      pnSud.Left:=pnZags.Left;
      pnSud.Height:=pnZags.Height;
      pnSud.Width:=pnZags.Width;
      pnSud.Align:=alBottom;
      pnSud.Visible:=true;

  //    pcBrak.Visible:=true;
  //    pcBrak.ActivePage:=tsRastSud;
  //    edTypeBrak.HelpContext:=0;
    end;
    if (nValue=3) then begin  // суд
      FArrChoiceRekv[2].nType:=SHABLON_SUD;
      FArrChoiceRekv[2].nTypeSpr:=0;
      FArrChoiceRekv[2].FieldName:='B_ZAGS';
      FArrChoiceRekv[2].sPadeg:='';
    end else begin
      FArrChoiceRekv[2].nType:=0;
      FArrChoiceRekv[2].nTypeSpr:=_SHABLON_ZAGS;
      FArrChoiceRekv[2].FieldName:='B_ZAGS';
      FArrChoiceRekv[2].sPadeg:='';
    end;
  end;
end;
//---------------------------------------------------------------
function TfmDeclIzm.GetTypeBrak: Integer;
begin
  if edTypeBrak.ItemIndex<0 then begin
    Result:=1;
  end else begin
    Result:=StrToInt(edTypeBrak.KeyItems[edTypeBrak.ItemIndex]);
  end;
end;
//----------------------------------------------
procedure TfmDeclIzm.edVoenkomEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  if Globaltask.ParamAsString('ID_VOENKOM')<>'' then begin
    edVoenkom.Value:=Globaltask.ParamAsString('ID_VOENKOM');
    N_F_cbVUS.Checked:=true;
  end;
end;
//----------------------------------------------
procedure TfmDeclIzm.edVoenkomEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  edVoenkom.Value:=null;
  N_F_cbVUS.Checked:=false;
end;
//----------------------------------------------
procedure TfmDeclIzm.edVoenkomEditButtons2Click(Sender: TObject;  var Handled: Boolean);
var
  SOATO:TSOATO;
  n:Integer;
begin
  SOATO:=dmBase.GetSoatoAkt(Dokument, 'M_GOSUD,FName;M_OBL,M_B_OBL;M_RAION,M_RNGOROD;M_GOROD,M_B_GOROD',true,FLenSoato);
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
//----------------------------------------------
procedure TfmDeclIzm.edVoenkomChange(Sender: TObject);
begin
  if edVoenkom.Value<>null
    then N_F_cbVUS.Checked:=true;
end;
//----------------------------------------------
procedure TfmDeclIzm.GridDetiColEnter(Sender: TObject);
begin
  if GridDeti.SelectedField<>nil then
    TBItemShablon.Enabled:=(GridDeti.SelectedField.FieldName='ZAGS_NAME');
end;
//-----------------------------------------------------------------
procedure TfmDeclIzm.CheckFont;
begin
  if DokumentKOD_PRICH.AsInteger>0
    then edPrich.Font.Style:=[fsBold]
    else edPrich.Font.Style:=[];
end;
//-----------------------------------------------------------------
procedure TfmDeclIzm.edPrichEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  EditDataSet(Dokument);
  DokumentKOD_PRICH.AsString:='';
  DokumentPRICH.AsString:='';
  PostDataSet(Dokument);
  CheckFont;
end;
//-----------------------------------------------------------------
procedure TfmDeclIzm.edPrichEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  nKod:Integer;
  sSeek:String;
  Opis : TOpisEdit;
begin
  if Pos(' ', edPrich.Text)=0
    then sSeek:=edPrich.Text
    else sSeek:='';
  nKod:=ChoiceFromShablonEx( edPrich, SHABLON_PRICH_PER, true, sSeek);
  if nKod>0 then begin
    EditDataSet(Dokument);
    DokumentKOD_PRICH.AsInteger:=nKod;
    PostDataSet(Dokument);
  end;
  CheckFont;
  // для обновления списка KEY_FIO_PRICH
  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_FIO_PRICH');
  if Opis<>nil then Opis.KeyListFromDataSet:=true;
end;

procedure TfmDeclIzm.btChoiceChildClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ROGD');
  if Opis<>nil then begin
//    if edFamiliaDo.Text<>'' then begin
//      Opis.DataSet.Filter := 'FAMILIA='+QStr(edFamiliaDo.Text);
//    end;
//    Opis.DataSet.Filtered := true;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(GridDeti, v, arrRec, nil) and (v<>null) then begin
      tbDeti.Append;
      tbDetiFAMILIA.AsString := GetValueFieldEx(arrRec, 'FAMILIA','');
      tbDetiNAME.AsString := GetValueFieldEx(arrRec, 'NAME','');
      tbDetiOTCH.AsString := GetValueFieldEx(arrRec, 'OTCH', '');
      v := GetValueField(arrRec, 'DATER');
      if v = null then tbDetiDateR.AsString:='' else tbDetiDateR.Value := v;
      if dmBase.tbZapisRogd.Locate('ID', GetValueFieldEx(arrRec, 'ID',0),[]) then begin
        tbDetiMESTOR.AsString:=dmBase.GetAdresAkt3(dmBase.tbZapisRogd,
              'GOSUD,FName;OBL,B_OBL;RAION;GOROD,B_GOROD',1);
      end;
      tbDetiZAGS_NOMER.AsString:= GetValueFieldEx(arrRec, 'NOMER','');
      v:=GetValueField(arrRec, 'DATEZ');
      if v<>null then tbDetiZAGS_DATE.Value:=v;
      tbDetiZAGS_NAME.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','Т',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));
      tbDeti.Post;
      QueryExit:=true;
    end;
//    Opis.DataSet.Filter   := '';
//    Opis.DataSet.Filtered := false;
  end;
end;

procedure TfmDeclIzm.edDateZUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 3);
end;

procedure TfmDeclIzm.btAddZaprosClick(Sender: TObject);
begin
  QueryExit:=true;
  tbZapros.Append;
  ActiveControl:=GridZapros;
end;

procedure TfmDeclIzm.btDelZaprosClick(Sender: TObject);
begin
  if (tbZapros.RecordCount>0) and Problem(PadCStr('Удалить запрос ?',40,' ')) then begin
    QueryExit:=true;
    tbZapros.Delete;
    ActiveControl:=GridZapros;
  end;
end;

procedure TfmDeclIzm.dsDetiDataChange(Sender: TObject; Field: TField);
begin
  if not IsReadDokument and (Field<>nil)
    then QueryExit:=true;
end;
//---------------------------------------------------------------------
procedure TfmDeclIzm.PostDokument;
begin
  inherited PostDokument;
  PostDataSet(tbDeti);
end;
//---------------------------------------------------------------------
procedure TfmDeclIzm.btAktBrakClick(Sender: TObject);
var
  nID,i:Integer;
  s:String;
  slPar:TStringList;
begin
  nID:=DokumentBRAK_ID.AsInteger;
  if nID>0 then begin
    CheckUserName_frxDataSet;
    if dmBase.tbZapisBrak.Locate('ID', nID, []) then begin
      slPar:=TStringList.Create;
      slPar.AddObject('DATASET_DECL_IZM', Dokument);
      EditZapisBrak( nID, false, slPar);
      slPar.Free;
    end else begin
      PutError('Запись акта о браке не найдена.',self)
    end;
    UnCheckUserName_frxDataSet;
    SetCurDok(Self);
  end;
end;
//---------------------------------------------------------------------
procedure TfmDeclIzm.ChoiceBrak(lOna:Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
//  adr : TAdres;
  old : TCursor;
  s,ss,sRnGor,sAdd,strName : String;
//  f : TfmSimpleD;
  lCheck, l : Boolean;
  ParamFlt:TParamFieldFlt;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_BRAK');
  if Opis<>nil then begin
    ParamFlt:=nil;
    //CreateParamFlt(edON_Familia.Text,'ON_FAMILIAP');
    //if ParamFlt<>nil then Opis.AutoFilter:=true;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edFamilia, v, arrRec, ParamFlt) and (v<>null) then begin
      if lOna then sAdd:='ONA_' else sAdd:='ON_';
      old := Screen.Cursor;
      lCheck:=dbDisableControls(Dokument);
      Screen.Cursor := crHourGlass;
      FRun:=true;
      try
        btAktBrak.Enabled:=true;
        EditDataSet(Dokument);
        DokumentST21.AsBoolean:=true;
        DokumentBRAK_ID.AsInteger:=GetValueFieldEx(arrRec, 'ID', 0);
        DokumentTYPE_FAM.AsInteger:=1;

        WriteDateFieldV( DokumentB_DATE, GetValueFieldEx(arrRec, 'DATEZ', null) );
        WriteDateFieldV( DokumentREG_DATE, GetValueFieldEx(arrRec, 'DATEZ', null) );
        DokumentB_NOMER.AsString:=GetValueFieldEx(arrRec, 'NOMER', '');
        DokumentREG_NOMER.AsString:=GetValueFieldEx(arrRec, 'NOMER', '');
        DokumentREG_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','П',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

        DokumentFIO1.AsString:=GetPadegFIO3(GetValueFieldEx(arrRec, 'ON_FAMILIA', ''),GetValueFieldEx(arrRec, 'ON_NAME', ''),GetValueFieldEx(arrRec, 'ON_OTCH', ''),'м','И');
        DokumentFIO2.AsString:=GetPadegFIO3(GetValueFieldEx(arrRec, 'ONA_FAMILIA', ''),GetValueFieldEx(arrRec, 'ONA_NAME', ''),GetValueFieldEx(arrRec, 'ONA_OTCH',''),'ж','И');

        DokumentFAMILIA.AsString:=FirstUpper(GetValueFieldEx(arrRec, sAdd+'FAMILIA', ''));
        DokumentNAME.AsString:=FirstUpper(GetValueFieldEx(arrRec, sAdd+'NAME', ''));
        DokumentOTCH.AsString:=FirstUpper(GetValueFieldEx(arrRec, sAdd+'OTCH', ''));
        DokumentFAMILIANA.AsString:=FirstUpper(GetValueFieldEx(arrRec, sAdd+'FAMILIAP', ''));
        DokumentFamiliaNa_B.AsString:=FirstUpper(GetValueFieldEx(arrRec, sAdd+'FAMILIAP_B', ''));
        DokumentNAMENa.AsString:=DokumentNAME.AsString;
        DokumentOTCHNa.AsString:=DokumentOTCH.AsString;
        WriteDateFieldV(DokumentDATER, GetValueFieldEx(arrRec, sAdd+'DATER', null) );
        if lOna then DokumentPOL.AsString:='Ж' else DokumentPOL.AsString:='М';
        DokumentIDENTIF.AsString:=GetValueFieldEx(arrRec, sAdd+'IDENTIF', '');
        DokumentNATION.AsInteger:=GetValueFieldEx(arrRec, sAdd+'NATION', 0);
        DokumentGRAG.AsString:=GetValueFieldEx(arrRec, sAdd+'GRAG', '');
        DokumentWORK.AsString:=GetValueFieldEx(arrRec, sAdd+'WORK', '');
        DokumentV_OBAZAN.AsBoolean:=GetValueFieldEx(arrRec, sAdd+'VUS', false);
        DokumentVOENKOM.AsString:=GetValueFieldEx(arrRec, sAdd+'VOENKOM',0);

        DokumentDOK_TYPE.AsString := GetValueFieldEx(arrRec, sAdd+'DOK_TYPE','888');
        DokumentDOK_SERIA.AsString:= GetValueFieldEx(arrRec, sAdd+'DOK_SERIA','');
        DokumentDOK_NOMER.AsString:= GetValueFieldEx(arrRec, sAdd+'DOK_NOMER','');
        DokumentDOK_ORGAN.AsString:= GetValueFieldEx(arrRec, sAdd+'DOK_ORGAN','');
        WriteDateFieldV(DokumentDOK_DATE, GetValueFieldEx(arrRec, sAdd+'DOK_DATE', null) );
        DokumentDOKUMENT.AsString := GetValueFieldEx(arrRec, sAdd+'DOKUMENT','');

//        DokumentB_RESP.AsBoolean:=GetValueFieldEx(arrRec, sAdd+'B_RESP', true);
        DokumentGOSUD.AsString:=GetValueFieldEx(arrRec, sAdd+'GOSUD','');
        DokumentB_OBL.AsBoolean:=GetValueFieldEx(arrRec, sAdd+'B_OBL',true);
        DokumentOBL.AsString:=GetValueFieldEx(arrRec, sAdd+'OBL','');
        DokumentRAION.AsString:=GetValueFieldEx(arrRec, sAdd+'RAION','');
        DokumentB_GOROD.AsString:=GetValueFieldEx(arrRec, sAdd+'B_GOROD','');
        DokumentGOROD.AsString:=GetValueFieldEx(arrRec, sAdd+'GOROD','');

//        DokumentM_B_RESP.AsString:=GetValueFieldEx(arrRec, sAdd+'M_B_RESP', '');
        DokumentM_GOSUD.AsString:=GetValueFieldEx(arrRec, sAdd+'M_GOSUD','');
        DokumentM_B_OBL.AsBoolean:=GetValueFieldEx(arrRec, sAdd+'M_B_OBL',true);
        DokumentM_OBL.AsString:=GetValueFieldEx(arrRec, sAdd+'M_OBL','');
        DokumentM_RAION.AsString:=GetValueFieldEx(arrRec, sAdd+'M_RAION','');
        DokumentM_B_GOROD.AsString:=GetValueFieldEx(arrRec, sAdd+'M_B_GOROD','');
        DokumentM_GOROD.AsString:=GetValueFieldEx(arrRec, sAdd+'M_GOROD','');
        l:=GetValueFieldEx(arrRec, sAdd+'M_B_RN', false);
        if l then begin
          sRnGor:='';
        end else begin
          sRnGor:=DokumentM_RAION.AsString+' район';
          DokumentM_RAION.AsString:='';
        end;
        s:=GetValueFieldEx(arrRec, sAdd+'M_GOROD_R','');
        if sRnGor<>'' then s:=sRnGor+', '+s;
        ss:=GetValueFieldEx(arrRec, sAdd+'M_DOM','');
        if ss<>'' then s:=s+', дом '+ss;
        ss:=GetValueFieldEx(arrRec, sAdd+'M_KORP','');
        if ss<>'' then s:=s+', корп. '+ss;
        ss:=GetValueFieldEx(arrRec, sAdd+'M_KV','');
        if ss<>'' then s:=s+', кв. '+ss;
        DokumentM_GOROD_R.AsString:=s;

        PostDataSet(Dokument);
      finally
        Screen.Cursor := old;
        FRun:=false;
        dbEnableControls(Dokument,lCheck);
      end;
    end;
//    Opis.DataSet.Filter   := '';
//    Opis.DataSet.Filtered := false;
  end;
end;

procedure TfmDeclIzm.TBItemChoiceBrakONClick(Sender: TObject);
begin
  ChoiceBrak(false);
end;

procedure TfmDeclIzm.TBSubmenuChoiceBrakClick(Sender: TObject);
begin
  ChoiceBrak(true);
end;

end.
