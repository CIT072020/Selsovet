unit fZapisChName;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,DateUtils,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,uSaveMemTable, uProject,uProjectAll,uTypes,
  ExtCtrls, OpisEdit, dbFunc, MetaTask, DBLookupEh, DBCtrlsEh, StdCtrls,
  Mask, Grids, DBGridEh, FuncPr, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  Buttons, ImgList, kbmMemCSVStreamFormat, vchDBCtrls, ZipForge;

type
  TfmZapisChName = class(TfmSimpleD)
    TBItemChoiceMen: TTBItem;
    pc: TPageControl;
    tsTail1: TTabSheet;
    Label1: TLabel;                                      
    edFamiliaDo: TDBEditEh;
    edFamiliaPosle: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edNameDo: TDBEditEh;
    edOtchDo: TDBEditEh;
    edNamePosle: TDBEditEh;
    edOtchPosle: TDBEditEh;
    edDATER: TDBDateTimeEditEh;
    Label13: TLabel;
    edNATION: TDBLookupComboboxEh;
    Label14: TLabel;
    Label22: TLabel;
    edGRAG: TDBLookupComboboxEh;
    tsTail2: TTabSheet;
    Label24: TLabel;
    pnMain: TPanel;
    lbNomer: TLabel;
    edNomer: TDBEditEh;
    Label28: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label31: TLabel;
    edDOKUMENT: TDBEditEh;
    Label32: TLabel;
    edOTMETKA: TDBEditEh;
    gbDeti: TGroupBox;
    GridDeti: TDBGridEh;
    edSEM: TDBComboBoxEh;
    dsDeti: TDataSource;
    tbDeti: TkbmMemTable;
    tbDetiFAMILIA: TStringField;
    tbDetiNAME: TStringField;
    tbDetiOTCH: TStringField;
    dsNation: TDataSource;
    dsStran: TDataSource;
    N_F_1: TDBCheckBoxEh;
    lbSvid: TLabel;
    edSvid_Nomer: TDBEditEh;
    Label55: TLabel;
    edRukov: TDBEditEh;
    edDateSV: TDBDateTimeEditEh;
    Label29: TLabel;
    edSpec: TDBEditEh;
    tbDetiZAGS_NAME: TStringField;
    tbDetiZAGS_NOMER: TStringField;
    tbDetiZAGS_DATE: TDateField;
    Label4: TLabel;
    gbReg: TGroupBox;
    Label8: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edREG_ZAGS: TDBEditEh;
    edREG_DATE: TDBDateTimeEditEh;
    edREG_NOMER: TDBEditEh;
    gbMestoGit: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    edM_GOSUD: TDBLookupComboboxEh;
    edM_GOROD: TDBEditEh;
    edM_GOROD_R: TDBEditEh;
    edM_B_OBL: TDBCheckBoxEh;
    Label17: TLabel;
    edV_WHO: TDBEditEh;
    edOSNOV: TDBEditEh;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentSVID_SERIA: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentDATESV: TDateField;
    DokumentMEN_ID: TIntegerField;
    DokumentLICH_ID: TIntegerField;
    DokumentFamiliaDo: TStringField;
    DokumentNameDo: TStringField;
    DokumentOtchDo: TStringField;
    DokumentFamiliaPosle: TStringField;
    DokumentNamePosle: TStringField;
    DokumentOtchPosle: TStringField;
    DokumentFamiliaDo_B: TStringField;
    DokumentNameDo_B: TStringField;
    DokumentOtchDo_B: TStringField;
    DokumentFamiliaPosle_B: TStringField;
    DokumentNamePosle_B: TStringField;
    DokumentOtchPosle_B: TStringField;
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
    DokumentSEM: TIntegerField;
    DokumentV_OBAZAN: TBooleanField;
    DokumentDOKUMENT: TMemoField;
    DokumentDETI: TMemoField;
    DokumentOSNOV: TMemoField;
    DokumentOTMETKA: TMemoField;
    DokumentRUKOV: TStringField;
    DokumentRUKOV_B: TStringField;
    DokumentSPEC: TStringField;
    DokumentISPRAV: TMemoField;
    DokumentVOSSTAN: TBooleanField;
    DokumentID_ZAGS: TIntegerField;
    DokumentID_SOURCE: TIntegerField;
    DokumentB_RESP: TBooleanField;
    DokumentB_OBL: TBooleanField;
    DokumentREG_ZAGS: TMemoField;
    DokumentREG_NOMER: TStringField;
    DokumentREG_DATE: TDateField;
    DokumentFirst_Ekz: TBooleanField;
    edPol: TDBComboBoxEh;
    DokumentOBL_B: TStringField;
    DokumentRAION_B: TStringField;
    DokumentGOROD_B: TStringField;
    DokumentV_WHO: TMemoField;
    cbV_Obazan: TDBCheckBoxEh;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    Label42: TLabel;
    edIzmen: TDBEditEh;
    dsGragd: TDataSource;
    DokumentCOPIA: TBooleanField;
    N_F_edCopy: TDBCheckBoxEh;
    DokumentARX_ADRESAT: TMemoField;
    DokumentARX_NOMER: TStringField;
    DokumentARX_DATE: TDateField;
    DokumentARX_TEXT: TMemoField;
    tsSprav: TTabSheet;
    TBItemArxSpr: TTBItem;
    Label43: TLabel;
    edAdresat: TDBEditEh;
    edNomerArxSpr: TDBEditEh;
    Label44: TLabel;
    Label45: TLabel;
    edDateArxSpr: TDBDateTimeEditEh;
    edAddTextArx: TDBEditEh;
    Label46: TLabel;
    edSVID_SERIA: TDBLookupComboboxEh;
    tsPovtor: TTabSheet;
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
    edM_B_GOROD: TDBLookupComboboxEh;
    DokumentIDENTIF: TStringField;
    Label26: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    edDOK_TYPE: TDBComboBoxEh;
    edDOK_SERIA: TDBEditEh;
    edDOK_NOMER: TDBEditEh;
    Label69: TLabel;
    edDOK_DATE: TDBDateTimeEditEh;
    N_F_cbBelorus: TDBCheckBoxEh;
    DokumentSPEC_B: TStringField;
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
    edM_OBL: TDBEditEh;
    edM_RAION: TDBEditEh;
    DokumentRN_B_GOROD: TStringField;
    DokumentRN_M_B_GOROD: TStringField;
    DokumentPOSHLINA: TMemoField;
    DokumentSUM_POSHLINA: TFloatField;
    Label34: TLabel;
    edSumPoshlina: TDBNumberEditEh;
    edPoshlina: TDBEditEh;
    tbDetiGOD_ROG: TStringField;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    tsSvid: TTabSheet;
    Label76: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label77: TLabel;
    BLR_edFamiliaB_Sv: TDBEditEh;
    BLR_edNameB_Sv: TDBEditEh;
    BLR_edOtchB_Sv: TDBEditEh;
    edDateR_Sv: TDBDateTimeEditEh;
    edPol_Sv: TDBComboBoxEh;
    edGosud_Sv: TDBLookupComboboxEh;
    BLR_edOblB_Sv: TDBEditEh;
    BLR_edGorodB_Sv: TDBEditEh;
    BLR_edRaionB_Sv: TDBEditEh;
    BLR_edTypeGorodB_Sv: TDBLookupComboboxEh;
    edFamilia_Sv: TDBEditEh;
    edName_Sv: TDBEditEh;
    edOtch_Sv: TDBEditEh;
    edGorod_Sv: TDBEditEh;
    edTypeGorod_Sv: TDBLookupComboboxEh;
    BLR_edGosud_Sv_B: TDBLookupComboboxEh;
    edOBL_Sv: TDBEditEh;
    edRAION_Sv: TDBEditEh;
    Label95: TLabel;
    edRukov_Sv: TDBEditEh;
    BLR_edRukovB_Sv: TDBEditEh;
    Label30: TLabel;
    edFamiliaPosle_Sv: TDBEditEh;
    edNamePosle_Sv: TDBEditEh;
    edOtchPosle_Sv: TDBEditEh;
    BLR_edFamiliaBP_Sv: TDBEditEh;
    Label33: TLabel;
    BLR_edNameBP_Sv: TDBEditEh;
    BLR_edOtchBP_Sv: TDBEditEh;
    tbDetiDATER: TDateField;
    DokumentDETI_DATER: TBooleanField;
    DokumentM_RNGOROD: TStringField;
    edM_RNGOROD: TDBLookupComboboxEh;
    Label35: TLabel;
    BLR_edOtchDo: TDBEditEh;
    BLR_edNameDo: TDBEditEh;
    BLR_edFamiliaDo: TDBEditEh;
    BLR_edFamiliaPosle: TDBEditEh;
    BLR_edNamePosle: TDBEditEh;
    BLR_edOtchPosle: TDBEditEh;
    Label9: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label12: TLabel;
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
    N_F_cbPovtor: TDBCheckBoxEh;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    edFIOPrich: TDBComboBoxEh;
    DokumentFIO_PRICH: TIntegerField;
    tbZaklKOD_PRICH: TIntegerField;
    Label25: TLabel;
    Label27: TLabel;
    tbZaklTYPE_BRAK: TIntegerField;
    TBItemDeclChName: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    DokumentDECL_ID: TIntegerField;
    procedure FormResize(Sender: TObject);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edFamiliaPosleEnter(Sender: TObject);
    procedure edNamePosleEnter(Sender: TObject);
    procedure edOtchPosleEnter(Sender: TObject);
    procedure edFamiliaDoCheckDrawRequiredState(Sender: TObject;         var DrawState: Boolean);
    procedure edFamiliaDoEnter(Sender: TObject);
    procedure edNameDoEnter(Sender: TObject);
    procedure edOTCHDOEnter(Sender: TObject);
    procedure cbV_ObazanClick(Sender: TObject);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edRukovEnter(Sender: TObject);
    procedure TBItemArxSprClick(Sender: TObject);
    procedure edOBL_RNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure edRaion_RNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure edDATERUpdateData(Sender: TObject; var Handled: Boolean);
    procedure TBItemZaklChNameClick(Sender: TObject);
    function EmptyIzm: String; override;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure GridDetiTitleBtnClick(Sender: TObject; ACol: Integer;      Column: TColumnEh);
    procedure edRukovEditButtons0Click(Sender: TObject;                  var Handled: Boolean);
    procedure edRukov_SvEditButtons0Click(Sender: TObject;               var Handled: Boolean);
    procedure edSpecEditButtons0Click(Sender: TObject;                   var Handled: Boolean);
    procedure GridDetiColumns5EditButtons0Click(Sender: TObject;         var Handled: Boolean);
    procedure GridDetiKeyDown(Sender: TObject; var Key: Word;            Shift: TShiftState);
    procedure TBItemDeclChNameClick(Sender: TObject);
    procedure dsDetiDataChange(Sender: TObject; Field: TField);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    { Public declarations }
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function ReadDeti(strDeti:String): Boolean;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    function BeforeEdit : Boolean; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    procedure UpdateActions; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure CheckControlSvid;
    procedure CheckDeti_Dater;
    function CheckFIO: String; override;
    function CreateSubMenuRun: Boolean; override;
    procedure SetOnlyPovtorSvid(lOnlyPovtor: Boolean;  pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;  lbSvid, lbNomer: TLabel);
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;

  end;

function EditZapisChName( nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;

var
  fmZapisChName: TfmZapisChName;

implementation

uses dBase, fMain, fShablon, uDataSet2XML;

{$R *.DFM}
{$I Task.inc}

{ TfmZapisBrak }

function EditZapisChName( nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : boolean;
begin
//  result := true;
  fmZapisChName := TfmZapisChName.Create(nil);
  fmZapisChName.IsCreateForm:=false;
  fmZapisChName.AssignPar(slPar);
  try
    with fmZapisChName do begin
      SetOnlyPovtorSvid(lOnlyPovtor, pc, tsSvid, [ N_F_1, N_F_edTypeEkz, N_F_cbPovtor, N_F_cbBelorus ], lbSvid,lbNomer);
      {$IFDEF ZAGS}
      if not lOnlyPovtor then begin
        TBItemSprAkt.Visible:=true;      // доступность получения справки о записи акта
        TBItemDeclSvid.Visible:=true;
      end;  
      {$ENDIF}
    end;
    fmZapisChName.IsReadDokument:=true;
    if nID=-1 then begin
      fmZapisChName.NewDok(true);
      fmZapisChName.SetIDZags;
      fmZapisChName.CheckEnabledNameOrgan(true);
    end else begin
      fmZapisChName.ReadDok( nID );
      fmZapisChName.TBItemZAGS.Visible:=false;
      fmZapisChName.CheckEnabledNameOrgan(false);
    end;
    fmZapisChName.IsReadDokument:=false;
    {$IFDEF GISUN}
      fmZapisChName.CheckAkt_GISUN(0);
//      Gisun.CheckChName(fmZapisChName);
//      fmZapisChName.CheckImageGisun(fmZapisChName.DokumentPOLE_GRN,fmZapisChName.ImageGISUN);
      fmZapisChName.BeforeEditFormGISUN;
    {$ENDIF}
    result := fmZapisChName.EditModal;
  finally
    fmZapisChName.Free;
    fmZapisChName := nil;
  end;
end;

function TfmZapisChName.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_ZChName); //
end;

function TfmZapisChName.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

  DokumentMEN_ID.AsString := '';

  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean := false;

  DokumentB_RESP.AsBoolean     := false;   // после отправки в ГИС РН корректировались определенные реквизиты

  DokumentB_OBL.AsBoolean      := true;
  DokumentM_B_OBL.AsBoolean    := true;

  DokumentB_GOROD.AsInteger    := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentM_B_GOROD.AsInteger  := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentDETI_DATER.AsBoolean:=true;

  DokumentFirst_Ekz.AsBoolean := true;
  DokumentVOSSTAN.AsBoolean := false;
  DokumentV_OBAZAN.AsBoolean := false;

  DokumentDECL_ID.AsInteger:=0;

  N_F_cbBelorus.Checked:=False;
  inherited NewDok(lAppend);

  CheckForAll_Bel(DokumentOBL);
  CheckForAll_Bel(DokumentRAION);

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
function TfmZapisChName.ReadDeti(strDeti:String): Boolean;
var
  i,j : Integer;
  fld : TField;
  strField : String;
  arr : TArrStrings;
  sl  : TStringList;
begin
//  strDeti := sdmBase.tbZapisChName.FieldByName('DETI').AsString;
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
end;
//--------------------------------------------------------------------
function TfmZapisChName.ReadDok(nID: Integer): Boolean;
var
  i,j : Integer;
  fld : TField;
  strField,strDeti : String;
  arr : TArrStrings;
  sl  : TStringList;
begin
  Result := true;
  if not dmBase.tbZapisChName.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbZapisChName.FieldCount-1 do begin
    strField := dmBase.tbZapisChName.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.tbZapisChName.Fields[i]);
    end;
  end;
  SetIDZags;

  ReadDopProperty(dmBase.TypeObj_ZChName, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));
  DokumentCOPIA.AsBoolean := false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentDETI_DATER.IsNull then DokumentDETI_DATER.AsBoolean:=false;

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;

  ReadHistory(nID, dmBase.TypeObj_ZChName);

  ReadDeti(dmBase.tbZapisChName.FieldByName('DETI').AsString);
  {
  strDeti := dmBase.tbZapisChName.FieldByName('DETI').AsString;
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
  }

  if DokumentPOL.AsString = 'М' then begin
    edNation.ListField:='NAME_M';
  end else begin
    edNation.ListField:='NAME_G';
  end;

  CheckDeti_Dater;

  //---------------------------------------
end;

function TfmZapisChName.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  sSeria,sNomer,sRukov,sRukovB,sSpec,sSpecB : String;
  strField, strErr, strDate,s : String;
  strRec, strDeti : String;
  {$IFNDEF ZAGS}
  vKeyValues : Variant;
  dLastSost : TDateTime;
  {$ENDIF}
  dDate : TDateTime;
  lFullWrite : Boolean;
  arr:TArrStrings;
  procedure AddErr(s:String); begin  strErr:=strErr+s+chr(13)+chr(10); end;
begin
  PostDataSet(Dokument);
  PostDataSet(tbDeti);
  AdditiveBeforeWriteDok;
  FLastError:='';

  EditDataSet(Dokument);
  WriteOtherData(Dokument, 'OTHER', 'RUKOV_D;SPEC_D');
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
    AddErr(' Заполните дату записи акта. ');
  end else if DokumentNOMER.AsString='' then begin
    AddErr(' Заполните номер записи акта. ');
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
      Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZChName, DokumentID_ZAGS.AsInteger,
                     DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime);
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
    dmBase.tbZapisChName.Append;
    dmBase.tbZapisChName.Post;
    nID := dmBase.tbZapisChName.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.tbZapisChName.Locate('ID', nID, []) then begin
      Result := false;
    end;
    if Result and not lFullWrite and FOnlySvid then begin   // запись нашли и пишем только свидетельство
       with FMainTable do begin
         if not MySameText(FieldByName('FAMILIAPOSLE').AsString,DokumentFamiliaPOSLE.AsString) or
            not MySameText(FieldByName('NAMEPOSLE').AsString,DokumentNamePOSLE.AsString) or
            not MySameText(FieldByName('OTCHPOSLE').AsString,DokumentOtchPOSLE.AsString) or
            (FieldByName('DateR').AsVariant<>DokumentDateR.AsVariant) then begin
            PutError('Данные не совпадают с данными из актовой записи.'#13+
                CreateFIO(FMainTable,'POSLE;E')+' '+DatePropis(FieldByName('DateR').AsDateTime,3)+chr(13)+
                CreateFIO(Dokument,'POSLE;E')+ ' '+DatePropis(DokumentDateR.AsDateTime,3),self);
            Result:=false;
         end;
         {
         if Result and (FieldByName('IDENTIF').AsString<>'') and
            not MySameText(FieldByName('IDENTIF').AsString,DokumentIDENTIF.AsString) then begin
            PutError('Идентификационный номер ребенка не совпадает с данными из актовой записи.'#13+
              '"'+FieldByName('IDENTIF').AsString+'"'+chr(13)+'"'+DokumentIDENTIF.AsString+'"',self);
            Result:=false;
         end;
         }
       end;
    end;

  end;
  if Result then  begin
    FCheckEditGIS:=CheckDateEditGIS;  // функция д.б. своя для каждого типа документа !!!

    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    dmBase.tbZapisChName.Edit;
    if lFullWrite then begin
      for i:=1 to dmBase.tbZapisChName.FieldCount-1 do begin
        strField := dmBase.tbZapisChName.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          dmBase.tbZapisChName.Fields[i].Value := fld.Value;
        end;
      end;

      WriteDopProperty(dmBase.TypeObj_ZChName, DokumentID.AsInteger,
                     STOD('1899-12-30',tdAds));

      WriteHistory(nID, dmBase.TypeObj_ZChName);

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
                  '"'+s+'"'+
                  Chr(13);
        strDeti := strDeti + strRec;
        tbDeti.Next;
      end;
      dmBase.tbZapisChName.FieldByName('DETI').AsString := strDeti;
      dmBase.tbZapisChName.FieldByName('VOSSTAN').AsBoolean := false;

      if not FPrintSpecSvid
        then dmBase.tbZapisChName.FieldByName('SPEC_B').AsString:='';
    end;

    WriteDateIzm;
    WriteForAllDok_BeforePost;
    if dmBase.tbZapisChName.FieldByName('B_RESP').AsBoolean=false
      then dmBase.tbZapisChName.FieldByName('B_RESP').AsBoolean:=FCheckEditGIS;

    dmBase.tbZapisChName.Post;
//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);

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

    // запишем ссылку на акт в заключение о перемене, если выбирали заключение
    if DokumentMEN_ID.AsString<>'' then begin
      if dmBase.AddDokZAGS.Locate('ID', DokumentMEN_ID.AsInteger, []) then begin
        dmBase.AddDokZAGS.Edit;
        dmBase.AddDokZAGS.FieldByName('AKT_ID').AsInteger:=DokumentID.AsInteger;
        dmBase.AddDokZAGS.Post;
      end;
    end;

    QueryExit:=false;
    Result := true;
    if FCheckBelName and FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentFamiliaDo.AsString, DokumentFamiliaDo_B.AsString);
      dmBase.CheckBelFamily( DokumentFamiliaPosle.AsString, DokumentFamiliaPosle_B.AsString);
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
  if Result then FlushBuffers;
end;

function TfmZapisChName.EmptyIzm: String;
begin
  Result:=SprChName_EmptyIzm;  // uProject
end;

procedure TfmZapisChName.FormResize(Sender: TObject);
begin
//  gbDeti.Width := Self.ClientWidth-8;
end;

//------------------------------------------------------------------------------------------
function TfmZapisChName.CreateSubMenuRun: Boolean;
begin
  inherited CreateSubmenuRun;
  Result:=true;
  AddSubmenu_CheckFIO;
  AddSubmenu_ReadDolg;
end;

constructor TfmZapisChName.Create(Owner: TComponent);
var
  n:Integer;
begin
  inherited;
  FCheckLookupField:=false;   // так как все поля (область,район,город) переделаны на DbEditEh.MRUList;
//  Dokument.Active:=true;
  if not Dokument.Active then Dokument.Active:=true;
  if not tbDeti.Active   then tbDeti.Active:=true;
  FDokZAGS := true;
  TypeObj := dmBase.TypeObj_ZChName;
  FUpdatingObj:=GetUpdatingObj(TypeObj);
  FCheckKeyGrid:=true;

  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';

  if FPrintSpecSvid then begin
    edRukov_Sv.DataField:='SPEC';
    BLR_edRukovB_Sv.DataField:='SPEC_B';
  end;

  SetLength(FArrChoiceRekv,7);

  FArrChoiceRekv[0].nType:=SHABLON_DOKUMENT;
  FArrChoiceRekv[0].FieldName:='DOKUMENT';

  FArrChoiceRekv[1].nType:=SHABLON_NATION;
  FArrChoiceRekv[1].FieldName:='OTMETKA';

  FArrChoiceRekv[2].nType:=SHABLON_REG;
  FArrChoiceRekv[2].FieldName:='REG_ZAGS';

  FArrChoiceRekv[3].nType:=0;
  FArrChoiceRekv[3].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[3].FieldName:='M_GOROD_R';

  FArrChoiceRekv[4].nType:=SHABLON_ADRESAT;
  FArrChoiceRekv[4].FieldName:='ARX_ADRESAT';

  FArrChoiceRekv[5].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[5].FieldName:='ARX_TEXT';

  FArrChoiceRekv[6].nType:=SHABLON_BANK;
  FArrChoiceRekv[6].FieldName:='POSHLINA';

//  FArrChoiceRekv[7].nType:=_SHABLON_ZAGS;
//  FArrChoiceRekv[7].FieldName:='ZAGS_NAME';

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);

  AddButton_LoadIdentif(ENG_edIDENTIF);

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisChName;
  dsGragd.DataSet := dmBase.SprGragd;
  FPageControl := pc;
  pc.ActivePageIndex:=0;
  edFamiliaDo.OnExit := OnDestroyHint;
  edNameDo.OnExit := OnDestroyHint;
  edOtchDo.OnExit := OnDestroyHint;
  edFamiliaPosle.OnExit := OnDestroyHint;
  edNamePosle.OnExit := OnDestroyHint;
  edOtchPosle.OnExit := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;
//  fmMain.SetCurrentDokument(Dokument);
  dmBase.SetDateFormat(tbDeti);

  tsSprav.TabVisible:=false;

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

  SetControlFIOUpdate([
    edFamiliaDo, edNameDo, edOtchDo, BLR_edFamiliaDo, BLR_edNameDo, BLR_edOtchDo,
    edFamilia_Sv, edName_Sv, edOtch_Sv, BLR_edFamiliaB_Sv, BLR_edNameB_Sv, BLR_edOtchB_Sv,
    edFamiliaPosle, edNamePosle, edOtchPosle, BLR_edFamiliaPosle, BLR_edNamePosle, BLR_edOtchPosle,
    edFamiliaPosle_Sv, edNamePosle_Sv, edOtchPosle_Sv, BLR_edFamiliaBP_Sv, BLR_edNameBP_Sv, BLR_edOtchBP_Sv
     ],false);

  SetControlCityUpdate([
    edOBL, edRAION, edGOROD, edM_OBL, edM_RAION, edM_GOROD,
    BLR_edOBL,  BLR_edRAION, BLR_edGorod,
    edOBL_Sv, edRAION_Sv, edGorod_Sv, BLR_edOblB_Sv, BLR_edRaionB_Sv, BLR_edGorodB_Sv
    ]);

  ENG_edIdentif.OnUpdateData:=IN_UpdateData;

  SetVisibleNomerEkz(pnMain, edDateSv, N_F_1);

  n:=2;
  SetLength(FArrAddProperty,n);
  SetAddProperty(0, 'OTHER', '', ftMemo);
  SetAddProperty(1, 'IZMEN', '', ftMemo);
  {$IFDEF GISUN}
    // типы нас. пунктов в кодах ГИС РН
    SetLength(FArrAddProperty,n+2);
    SetAddProperty(n+0, 'RN_B_GOROD', '', ftString);
    SetAddProperty(n+1, 'RN_M_B_GOROD', '', ftString);
  {$ENDIF}

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

  CheckControlSvid;

  SetPanelPovtor(tsPovtor, N_F_cbPovtor,nil,nil);

  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbDeti,'Deti','Дети');
  {$ENDIF}

  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := IsActiveGISUN;
    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN;
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
  TBItemHistCorr.Visible:=FUpdatingObj;

end;

destructor TfmZapisChName.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZapisChName.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;
    edRukov.DataField       := 'RUKOV_B';
    edZAGS.DataField := 'NAME_ZAGS_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
  end else begin
    ActivateRUSKeyboard;
    edRukov.DataField:= 'RUKOV';
    edZAGS.DataField := 'NAME_ZAGS';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
  end;
end;

procedure TfmZapisChName.OnDestroyHint(Sender : TObject);
begin
  DestroyHint(H);
end;

procedure TfmZapisChName.edFamiliaPosleEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaPosle,DokumentFamiliaPosle.AsString+' ');
end;

procedure TfmZapisChName.edNamePosleEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edNAMEPosle,DokumentNAMEPosle.AsString+' ');
end;

procedure TfmZapisChName.edOtchPosleEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edOTCHPosle,DokumentOTCHPosle.AsString+' ');
end;

procedure TfmZapisChName.edFamiliaDoCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmZapisChName.edFamiliaDoEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaDo,DokumentFamiliaDo.AsString+' ');
end;

procedure TfmZapisChName.edNameDoEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edNAMEDo,DokumentNAMEDo.AsString+' ');
end;

procedure TfmZapisChName.edOTCHDOEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edOTCHDo,DokumentOTCHDo.AsString+' ');
end;

procedure TfmZapisChName.cbV_ObazanClick(Sender: TObject);
begin
  if cbV_Obazan.Checked then begin
    edV_WHO.Enabled := true;
  end else begin
    edV_WHO.Enabled := false;
//    EditDataSet(Dokument);
//    DokumentV_WHO.AsString := '';
  end;
end;

procedure TfmZapisChName.UpdateActions;
begin
  inherited;
  if cbV_Obazan.Checked then begin
    edV_WHO.Enabled := true;
  end else begin
    edV_WHO.Enabled := false;
  end;
  {$IFDEF ZAGS}
    TBItemDolg.Enabled := N_F_edCopy.Checked;
  {$ENDIF}
end;

procedure TfmZapisChName.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol : TPol;
begin
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    FRun := true;
    try
      if FCheckBelName then begin
        strField := UpperCase(Field.FieldName);
        EditDataSet(Dokument);
        Pol := tpNone;
        if not Field.IsNull then begin
          if strField='NAMEDO' then begin
            DokumentNameDo_B.AsString := dmBase.CheckNameBel(Pol, Field.AsString);
          end else if strField='OTCHDO' then begin
            DokumentOtchDo_B.AsString := dmBase.CheckOtchBel(Pol, Field.AsString);
          end else if strField='NAMEPOSLE' then begin
            if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentNameDo.AsString)) and (DokumentNameDo_B.AsString<>'')
              then DokumentNamePosle_B.AsString := DokumentNameDo_B.AsString
              else DokumentNamePosle_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
          end else if strField='OTCHPOSLE' then begin
              if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentOtchDo.AsString)) and (DokumentOtchDo_B.AsString<>'')
                then DokumentOtchPosle_B.AsString := DokumentOtchDo_B.AsString
                else DokumentOtchPosle_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
          end else if strField='FAMILIADO' then begin
              DokumentFamiliaDo_B.AsString := dmBase.GetBelFamily( Field.AsString );
          end else if strField='FAMILIAPOSLE' then begin
              if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentFamiliaDo.AsString)) and (DokumentFamiliaDo_B.AsString<>'')
                then DokumentFamiliaPosle_B.AsString := DokumentFamiliaDo_B.AsString
                else DokumentFamiliaPosle_B.AsString := dmBase.GetBelFamily( Field.AsString );
          end;
          CheckForAll_Bel(Field);
        end;
        if Pol<>tpNone then begin
          if Pol = tpM then begin
            DokumentPOL.AsString := 'М';
          end else begin
            DokumentPOL.AsString := 'Ж';
          end;
        end;
        if (Pol<>tpNone) or (strField='POL') then begin
          if DokumentPOL.AsString = 'М' then begin
            edNation.ListField:='NAME_M';
          end else begin
            edNation.ListField:='NAME_G';
          end;
        end;
      end;
    finally
      FRun := false;
    end;
  end;
  inherited;
end;

procedure TfmZapisChName.edRukovEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

procedure TfmZapisChName.TBItemArxSprClick(Sender: TObject);
begin
  tsSprav.TabVisible:=TBItemArxSpr.Checked;
//  edAddTextArx.Text := EmptyIzm+'.';
end;

procedure TfmZapisChName.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  AddSvid;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisChName.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisChName.edOBL_RNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisChName.edRaion_RNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisChName.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetChName(Self);
//  Gisun.CheckChName(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisChName.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterChName(Self);
//  Gisun.CheckChName(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisChName.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then begin

    if pc.Pages[pc.ActivePageIndex].Name='tsSvid'
      then CheckForAll_Bel( nil )
      else N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];

//    if (pc.ActivePageIndex=1) or (pc.Pages[pc.ActivePageIndex].Name='tsSvid')
//      then N_F_cbPovtor.Parent:=pc.Pages[pc.ActivePageIndex];

  end;
end;

procedure TfmZapisChName.edDATERUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 13);
end;
//--------------------------------------------------------------------
procedure TfmZapisChName.TBItemDeclChNameClick(Sender: TObject);
var
  i,nVozr,n : Integer;
  fld : TField;
  strField,s : String;
  sRukov, sRukovB, sSpec, sSpecB:String;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ParamFlt:TParamFieldFlt;
  nID, curID:Integer;
  arr:TArrStrings;
  d2xml:TDataSet2XML;
  ds2xml_Zakl:TDataSets2XML;
  st:TSostTable;
begin
  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_DECL_CHNAME');
  st:=SaveSostDataSet(dmBase.tbDeclChName, false);
  dmBase.tbDeclChName.Filter:='not Empty(st21)';   //!!!
  dmBase.tbDeclChName.Filtered:=true;
  try
  if Opis<>nil then begin
    if edFamiliaDo.Text<>'' then begin
      s:=Trim(edFamiliaDo.Text);
      if (s<>'') and (Pos(' ',s)=0) then begin
        Opis.AutoFilter:=true;
        ParamFlt := TParamFieldFlt.Create;
        with ParamFlt do begin
          TypeSr:=tsBegin;
          Value1:=s;
          CICharacter:=true;
          FieldName:='FAMILIA';
          OnlySet:=true;
        end;
      end;
    end;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edFamiliaDo, v, arrRec, ParamFlt) and (v<>null) then begin
      nID:=v;
      Opis.AutoFilter:=false;
//      NewDok(false);
      //------- читаем карточку -----------
      SaveID;  // !!!
      sRukov:=DokumentRUKOV.AsString;
      sRukovB:=DokumentRUKOV_B.AsString;
      sSpec:=DokumentSPEC.AsString;
      sSpecB:=DokumentSPEC_B.AsString;

      curID:=DokumentID.AsInteger;
      Dokument.Edit;
      for i:=0 to Length(arrRec)-1 do begin // dmBase.tbDeclChName.FieldCount-1 do begin
        v:=arrRec[i].Value;
        strField := arrRec[i].FieldName; //  dmBase.tbDeclChName.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if (fld<>nil) then begin
          if (v<>null) and (VarToStr(v)<>'')
            then fld.Value:=v
            else fld.Value:=null;
//          WriteField(fld, dmBase.tbDeclChName.Fields[i]);
        end;
      end;
      RestID; // !!!
      DokumentRUKOV.AsString:=sRukov;
      DokumentRUKOV_B.AsString:=sRukov;
      DokumentSPEC.AsString:=sSpec;
      DokumentSPEC_B.AsString:=sSpecB;

      ReadDopProperty(_TypeObj_DChName, DokumentID.AsInteger, STOD('1899-12-30',tdAds));

      if GetValueFieldEx(arrRec,'KOD_PRICH', 0)>0 then begin
        DokumentFIO_PRICH.AsInteger:=GetValueFieldEx(arrRec,'KOD_PRICH', 0);
      end else begin
         // переносить или нет по наименованию ?
      end;
      n:=TypeBrakToSem(GetValueFieldEx(arrRec,'TYPE_BRAK', 0));
      if (n>0)
        then DokumentSEM.AsInteger:=n;

      if DokumentV_OBAZAN.AsBoolean and (GetValueFieldEx(arrRec,'VOENKOM', 0)>0) then begin
        DokumentVOENKOM.AsInteger:=GetValueFieldEx(arrRec,'VOENKOM', 0);
        if DokumentVOENKOM.AsInteger>0 then begin
          if dmBase.SprVoenkom.Locate('ID', DokumentVOENKOM.AsInteger,[]) then begin
            DokumentV_WHO.AsString:=dmBase.SprVoenkom.FieldByName('NAME').AsString;
          end;
        end;
      end;
      DokumentDETI_DATER.AsBoolean:=true;
      DokumentDECL_ID.AsInteger:=GetValueFieldEx(arrRec,'ID', 0); // запишем ID заявления
      PostDataSet(Dokument);
      ReadDeti(GetValueFieldEx(arrRec,'DETI', ''));
    end;

    CheckDeti_Dater;

    Opis.DataSet.Filter:='';
    Opis.DataSet.Filtered:=false;
  end;  // end opis<>nil
  finally
    RestSostDataSet(dmBase.tbDeclChName, st);
  end;
end;
//--------------------------------------------------------------------
procedure TfmZapisChName.TBItemZaklChNameClick(Sender: TObject);
var
  i,nVozr,n : Integer;
  fld : TField;
  strField,s : String;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ParamFlt:TParamFieldFlt;
  nID:Integer;
  arr:TArrStrings;
  d2xml:TDataSet2XML;
  ds2xml_Zakl:TDataSets2XML;
begin
  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_ADDDOKZAGS');
  if Opis<>nil then begin
    if edFamiliaDo.Text<>'' then begin
      s:=Trim(edFamiliaDo.Text);
      if (s<>'') and (Pos(' ',s)=0) then begin
        Opis.AutoFilter:=true;
        ParamFlt := TParamFieldFlt.Create;
        with ParamFlt do begin
          TypeSr:=tsBegin;
          Value1:=s;
          CICharacter:=true;
          FieldName:='FAMILIA';
          OnlySet:=true;
        end;
      end;
    end;
    SetLength(arrRec,0);
    v := null;
    Opis.DataSet.Filter:='TYPEDOK='+IntToStr(dmBase.TypeObj_ZAGS_ZaklChName);
    Opis.DataSet.Filtered:=true;
    if Opis.ChoiceFromSprEx(edFamiliaDo, v, arrRec, ParamFlt) and (v<>null) then begin
      nID:=v;
      if dmBase.AddDokZAGS.FieldByname('ID').AsInteger<>nID then begin
        if not dmBase.AddDokZAGS.Locate('ID', nID, []) then begin
          exit;
        end;
      end;
      if not tbZakl.Active then tbZakl.Active:=true;
      if not tbZaklDeti.Active then tbZaklDeti.Active:=true;
      //------- читаем карточку -----------
      if dmBase.AddDokZAGS.FieldByName('VERSION').AsString='1' then begin
        ds2xml_zakl:=TDataSets2XML.Create;

        d2xml:=ds2xml_zakl.DS_Add(tbZakl,true);
        d2xml.NameRoot:='DOKUMENT';
        d2xml.FClearRecord:=false;
        d2xml.ExceptFields:='ID;ID_ZAGS;';

        d2xml:=ds2xml_zakl.DS_Add(tbZaklDeti);
        d2xml.NameRoot:='TBDETI';

        tbZakl.EmptyTable;
        tbZakl.Append;
        tbZakl.Post;
        tbZaklDeti.EmptyTable;
        ds2xml_zakl.StringToXML(dmBase.AddDokZAGS.FieldByName('VALUE').AsString);
        ds2xml_zakl.XMLToData;

        ds2xml_zakl.Free;
      end else begin
        tbZakl.EmptyTable;
        tbZaklDeti.EmptyTable;
        LoadMemTableFromStr(dmBase.AddDokZAGS.FieldByName('VALUE').AsString,
                      ['DOKUMENT', tbZakl, 'DETI', tbZaklDeti],dmBase.AddDokZAGS.FieldByName('FIELD_DELIMITER').AsString,nil);
      end;
      tbZaklDeti.First;
      tbZakl.First;
      tbZakl.Edit;
      for i:=0 to dmBase.AddDokZAGS.FieldCount-1 do begin
        strField := dmBase.AddDokZAGS.Fields[i].FieldName;
        fld := tbZakl.FindField(strField);
        if fld <> nil then begin
          WriteField(fld, dmBase.AddDokZAGS.Fields[i]);
        end;
      end;
      tbZakl.Post;
      Opis.AutoFilter:=false;

      EditDataSet(Dokument);

      DokumentFamiliaDo.AsString := tbZaklFamilia.AsString;
      DokumentNameDo.AsString    := tbZaklName.AsString;
      DokumentOtchDo.AsString    := tbZaklOtch.AsString;
      StrToArr(tbZaklFIO_NEW.AsString,arr,' ',false);
      SetLength(arr,3);
      DokumentFamiliaPosle.AsString := arr[0];
      DokumentNamePosle.AsString    := arr[1];
      if DokumentNamePosle.AsString='' then DokumentNamePosle.AsString:=DokumentNameDo.AsString;
      DokumentOtchPosle.AsString    := arr[2];
      if DokumentOtchPosle.AsString='' then DokumentOtchPosle.AsString:=DokumentNameDo.AsString;

      WriteDateField(DokumentDateR, tbZaklDateR);
      DokumentPOL.AsString:=tbZaklPOL.AsString;

      DokumentGOSUD.AsString:=tbZaklRG_GOSUD.AsString;
      DokumentOBL.AsString:=tbZaklRG_OBL.AsString;
      DokumentB_OBL.AsBoolean:=tbZaklRG_B_OBL.AsBoolean;
      DokumentRAION.AsString:=tbZaklRG_RAION.AsString;
      DokumentB_GOROD.AsString:=tbZaklRG_B_GOROD.AsString;
      DokumentGOROD.AsString:=tbZaklRG_GOROD.AsString;

      DokumentREG_NOMER.AsString:=tbZaklR_NOMER.AsString;
      if not tbZaklR_DATE.IsNull then DokumentREG_DATE.AsDateTime:=tbZaklR_DATE.AsDateTime;
      DokumentREG_ZAGS.AsString:=tbZaklR_ZAGS.AsString;

      DokumentM_GOSUD.AsString:=tbZaklGT_GOSUD.AsString;
      DokumentM_OBL.AsString:=tbZaklGT_OBL.AsString;
      DokumentM_B_OBL.AsBoolean:=tbZaklGT_B_OBL.AsBoolean;
      DokumentM_RAION.AsString:=tbZaklGT_RAION.AsString;
      DokumentM_B_GOROD.AsString:=tbZaklGT_B_GOROD.AsString;
      DokumentM_GOROD.AsString:=tbZaklGT_GOROD.AsString;
      DokumentM_GOROD_R.AsString:=tbZaklGT_GOROD_R.AsString;

      if tbZaklKOD_PRICH.AsInteger>0 then begin
        DokumentFIO_PRICH.AsInteger:=tbZaklKOD_PRICH.AsInteger;
      end else begin
         // переносить или нет по наименованию ?
      end;
      n:=TypeBrakToSem(tbZaklTYPE_BRAK.AsInteger);
      if n>0
        then DokumentSEM.AsInteger:=n;
      DokumentV_WHO.AsString:=tbZaklVUS.AsString;
      DokumentDETI_DATER.AsBoolean:=true;

      // ссылка в акте на заключение
      DokumentMEN_ID.AsInteger := nID;

      PostDataSet(Dokument);

      tbDeti.EmptyTable;
      tbZaklDeti.First;
      while not tbZaklDeti.Eof do begin
        if tbZaklDetiDATER.IsNull
          then nVozr:=0
          else nVozr:=GetCountYear(dmBase.GetCurDate,tbZaklDetiDATER.AsDateTime);
        if (nVozr<18) then begin
          tbDeti.Append;
          StrToArr(tbZaklDetiFIO.AsString,arr,' ',false);
          SetLength(arr,3);
          tbDetiFAMILIA.AsString := arr[0];
          tbDetiName.AsString    := arr[1];
          tbDetiOtch.AsString    := arr[2];

          if not tbZaklDetiDATER.IsNull
            then tbDetiDATER.AsDateTime:=tbZaklDetiDATER.AsDateTime;

          tbDetiZAGS_NAME.AsString:=tbZaklDetiMESTOREG.AsString;
          tbDetiZAGS_NOMER.AsString:=tbZaklDetiNOMER.AsString;
          if not tbZaklDetiDATEA.IsNull
            then tbDetiZAGS_DATE.AsDateTime:=tbZaklDetiDATEA.AsDateTime;
          tbDeti.Post;
        end;
        tbZaklDeti.Next;
      end;

      tbZakl.Active:=false;
      tbZaklDeti.Active:=false;
    end;

    CheckDeti_Dater;

    Opis.DataSet.Filter:='';
    Opis.DataSet.Filtered:=false;
  end;  // end opis<>nil
end;

function TfmZapisChName.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result:= inherited BeforeEdit;

// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edGOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edM_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edGorod_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edM_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edOBL_Sv,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edM_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edRAION_Sv,n,2,true,false,false,FAddButtonMRUList);

end;

procedure TfmZapisChName.Button1Click(Sender: TObject);
begin
  SaveDokumentToFile;
end;

procedure TfmZapisChName.Button2Click(Sender: TObject);
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


procedure TfmZapisChName.btAddChildClick(Sender: TObject);
begin
  QueryExit:=true;
  tbDeti.Append;
  ActiveControl:=GridDeti;
end;

procedure TfmZapisChName.btDelChildClick(Sender: TObject);
begin
  if tbDeti.RecordCount>0 then begin
    QueryExit:=true;
    tbDeti.Delete;
    ActiveControl:=GridDeti;
  end;
end;

//------------------------------------------------------------------------
procedure TfmZapisChName.CheckControlSvid;
var
  n:Integer;
begin
  if GlobalTask.ParamAsBoolean('INVERT_SVID') then begin
    Init_ArrCheckControl(14);
    n:=0;
    FArrCheckControl[n].Cont1:=edFamilia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edFamiliaB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edName_Sv;
    FArrCheckControl[n].Cont2:=BLR_edNameB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edOtch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOtchB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=Label76;
    FArrCheckControl[n].Cont2:=Label77; Inc(n);
    FArrCheckControl[n].Cont1:=Label33;
    FArrCheckControl[n].Cont2:=Label30; Inc(n);

    FArrCheckControl[n].Cont1:=edGosud_Sv;
    FArrCheckControl[n].Cont2:=BLR_edGosud_Sv_B; Inc(n);

    FArrCheckControl[n].Cont1:=edObl_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOblB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edRAION_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRaionB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edGorod_Sv;
    FArrCheckControl[n].Cont2:=BLR_edGorodB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edTypeGorod_Sv;
    FArrCheckControl[n].Cont2:=BLR_edTypeGorodB_Sv; Inc(n);  // 10

    FArrCheckControl[n].Cont1:=edRukov_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRukovB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edFamiliaPosle_Sv;
    FArrCheckControl[n].Cont2:=BLR_edFamiliaBP_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edNamePosle_Sv;
    FArrCheckControl[n].Cont2:=BLR_edNameBP_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edOtchPosle_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOtchBP_Sv; Inc(n);     // 14


  end;
end;
//--------------------------------------------------------------------------------------
procedure TfmZapisChName.CheckDeti_Dater;
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
procedure TfmZapisChName.GridDetiTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  EditDataSet(Dokument);
  if Column.FieldName='GOD_ROG' then begin
    DokumentDETI_DATER.AsBoolean:=true;
  end else if Column.FieldName='DATER' then begin
    DokumentDETI_DATER.AsBoolean:=false;
  end;
  CheckDeti_Dater;
end;
//------------------------------------------------------------
procedure TfmZapisChName.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;
procedure TfmZapisChName.edRukov_SvEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov_Sv);
end;
procedure TfmZapisChName.edSpecEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;
//------------------------------------------------------------
function TfmZapisChName.CheckFIO: String;
begin
  Result:=CheckOneFIO('До перемены: ',DokumentFamiliaDo.AsString, DokumentNameDo.AsString, DokumentOtchDo.AsString);
  if Result='' then begin
    Result:=CheckOneFIO('После перемены: ',DokumentFamiliaPosle.AsString, DokumentNamePosle.AsString, DokumentOtchPosle.AsString);
  end;
end;

procedure TfmZapisChName.SetOnlyPovtorSvid(lOnlyPovtor: Boolean;  pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;  lbSvid, lbNomer: TLabel);
begin
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
  if lOnlyPovtor then begin
    TBItemSeekAkt.Visible:=true;
    TBItemArxSpr.Visible:=false;
    TBItemZaklChName.Visible:=false;
//  TBSubmenuGISUN.Visible:=false;
    TBItemStep2.Caption:='Зарегистрировать свидетельство';
    {
    lbIdentif.Parent:=tsSvid;
    lbIDENTIF.Top:=Label51.Top;
    lbIDENTIF.Left:=edDateR_Sv.Left+edDateR_Sv.Width+50;
    lbIDENTIF.Caption:='Иден. номер';
    ENG_edIDENTIF.Parent:=tsSvid;
    ENG_edIDENTIF.Top:=edDateR_Sv.Top;
    ENG_edIDENTIF.Left:=lbIDENTIF.Left+lbIDENTIF.Width+50;
    }
  end;
end;

procedure TfmZapisChName.GridDetiColumns5EditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceShablonZAGS(TDBGridEh(ActiveControl).DataSource.DataSet,TDBGridEh(ActiveControl).SelectedField.FieldName,'И', '');
end;

procedure TfmZapisChName.GridDetiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Shift=[]) and (Key=VK_F10) and (TDBGridEh(ActiveControl).SelectedField.FieldName='ZAGS_NAME') then begin
   ChoiceShablonZAGS(TDBGridEh(ActiveControl).DataSource.DataSet,TDBGridEh(ActiveControl).SelectedField.FieldName,'И', '');
   Key:=0;
 end;
end;


function TfmZapisChName.CheckDateEditGIS: Boolean;
begin
  Result:=false;
  if Gisun.GetPoleGrn(DokumentPOLE_GRN)=rPost then begin
// номер и дата записи, свидетельство, ИН, ФИО после перемены
  if (DokumentNOMER.AsString<>FMainTable.FieldByName('NOMER').AsString) or
     (DokumentDATEZ.AsString<>FMainTable.FieldByName('DATEZ').AsString) or
     (DokumentSVID_SERIA.AsString<>FMainTable.FieldByName('SVID_SERIA').AsString) or
     (DokumentSVID_NOMER.AsString<>FMainTable.FieldByName('SVID_NOMER').AsString) or
     (DokumentDATESV.AsString<>FMainTable.FieldByName('DATESV').AsString) or
     (ce_fio(DokumentFamiliaPosle_B.AsString)<>ce_fio(FMainTable.FieldByName('FamiliaPosle_B').AsString)) or
     (ce_fio(DokumentNamePosle_B.AsString)<>ce_fio(FMainTable.FieldByName('NamePosle_B').AsString)) or
     (ce_fio(DokumentOtchPosle_B.AsString)<>ce_fio(FMainTable.FieldByName('OtchPosle_B').AsString)) or
     (ce_fio(DokumentFamiliaPosle.AsString)<>ce_fio(FMainTable.FieldByName('FamiliaPosle').AsString)) or
     (ce_fio(DokumentNamePosle.AsString)<>ce_fio(FMainTable.FieldByName('NamePosle').AsString)) or
     (ce_fio(DokumentOtchPosle.AsString)<>ce_fio(FMainTable.FieldByName('OtchPosle').AsString)) or
     (DokumentIDENTIF.AsString<>FMainTable.FieldByName('IDENTIF').AsString)
    then Result:=true
    else Result:=false;
  end;  
end;
//-----------------------------------------------------------
procedure TfmZapisChName.WriteAfterRegister_GISUN;
begin
  try
    EditDataSet(Dokument);
    DokumentB_RESP.AsBoolean:=false;
    Dokument.Post;
    FMainTable.FieldByName('B_RESP').AsBoolean:=false;
  except
  end;
end;

procedure TfmZapisChName.dsDetiDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) and not IsReadDokument then begin
    QueryExit:=true;
  end;
end;

end.
