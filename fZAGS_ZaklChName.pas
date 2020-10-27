unit fZAGS_ZaklChName;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uSaveMemTable,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc, uDataSet2XML,uTypes,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat,
  HunSpellDBMemo, ZipForge;

type
  TfmZAGS_ZaklChName = class(TfmSimpleD)
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentMEN_ID: TIntegerField;
    DokumentLICH_ID: TIntegerField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentPOL: TStringField;
    DokumentGRAG: TIntegerField;
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
    DokumentRUKOV: TStringField;
    DokumentRG_B_RESP: TBooleanField;
    DokumentRG_B_OBL: TBooleanField;
    DokumentGT_B_RESP: TBooleanField;
    DokumentGT_B_OBL: TBooleanField;
    dsStran: TDataSource;
    dsNation: TDataSource;
    DokumentID_ZAGS: TIntegerField;
    dsGragd: TDataSource;
    DokumentGT_RNGOROD: TStringField;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    DokumentRG_B_GOROD: TSmallintField;
    DokumentGT_B_GOROD: TSmallintField;
    ApplicationEvents1: TApplicationEvents;
    DokumentADRESAT: TMemoField;
    DokumentDATE1: TDateField;
    DokumentDATE2: TDateField;
    DokumentWHO: TStringField;
    DokumentPRICH: TStringField;
    DokumentR_NOMER: TStringField;
    DokumentR_DATE: TDateField;
    DokumentR_ZAGS: TMemoField;
    DokumentR_RG_B_RESP: TBooleanField;
    DokumentR_RG_GOSUD: TIntegerField;
    DokumentR_RG_B_OBL: TBooleanField;
    DokumentR_RG_OBL: TStringField;
    DokumentR_RG_RAION: TStringField;
    DokumentR_RG_B_GOROD: TSmallintField;
    DokumentR_RG_GOROD: TStringField;
    DokumentR_MAT: TStringField;
    DokumentR_OTEC: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Label3: TLabel;
    lbDateR: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edOtch: TDBEditEh;
    edDateR: TDBDateTimeEditEh;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    Panel2: TPanel;
    gbRogd: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edRG_B_RESP: TDBCheckBoxEh;
    edRG_GOSUD: TDBLookupComboboxEh;
    edRG_B_OBL: TDBCheckBoxEh;
    edRG_GOROD: TDBEditEh;
    edRG_B_GOROD: TDBLookupComboboxEh;
    edRG_RN: TDBEditEh;
    edRG_OBL: TDBEditEh;
    Panel3: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    edWho: TDBEditEh;
    edPrich: TDBEditEh;
    Panel4: TPanel;
    gbAktRogd: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    edR_RG_B_RESP: TDBCheckBoxEh;
    edR_RG_GOSUD: TDBLookupComboboxEh;
    edR_RG_B_OBL: TDBCheckBoxEh;
    edR_RG_GOROD: TDBEditEh;
    edR_RG_B_GOROD: TDBLookupComboboxEh;
    edR_RG_RN: TDBEditEh;
    edR_RG_OBL: TDBEditEh;
    edRNomer: TDBEditEh;
    edRDate: TDBDateTimeEditEh;
    edRZAGS: TDBEditEh;
    edOtec: TDBEditEh;
    edMat: TDBEditEh;
    edRFamilia: TDBEditEh;
    edRName: TDBEditEh;
    edROtch: TDBEditEh;
    Panel5: TPanel;
    ScrollBox2: TScrollBox;
    Label7: TLabel;
    edFIO_NEW: TDBEditEh;
    DokumentFamilia_Posle: TStringField;
    DokumentName_Posle: TStringField;
    DokumentOtch_Posle: TStringField;
    DokumentWORK: TMemoField;
    DokumentVUS: TMemoField;
    DokumentSUPRUG: TStringField;
    DokumentB_NOMER: TStringField;
    DokumentB_DATE: TDateField;
    DokumentB_ZAGS: TMemoField;
    Panel7: TPanel;
    dsDeti: TDataSource;
    tbDeti: TkbmMemTable;
    tbDetiDATER: TDateField;
    tbDetiMESTO: TStringField;
    tbDetiMESTOREG: TStringField;
    tbDetiNOMER: TStringField;
    tbDetiDATEA: TDateField;
    gbDeti: TGroupBox;
    GridDeti: TDBGridEh;
    Panel8: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    Panel6: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    gbGit: TGroupBox;
    Label15: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label53: TLabel;
    edGT_B_RESP: TDBCheckBoxEh;
    edGT_GOSUD: TDBLookupComboboxEh;
    edGT_B_OBL: TDBCheckBoxEh;
    edGT_GOROD: TDBEditEh;
    edGT_GOROD_R: TDBEditEh;
    edGT_B_GOROD: TDBLookupComboboxEh;
    edGT_RN: TDBEditEh;
    edGT_OBL: TDBEditEh;
    edWork: TDBEditEh;
    edVUS: TDBEditEh;
    Panel9: TPanel;
    gbROVD: TGroupBox;
    Panel10: TPanel;
    GroupBox2: TGroupBox;
    Label36: TLabel;
    edROVD: TDBEditEh;
    edROVD_DATE: TDBDateTimeEditEh;
    Panel11: TPanel;
    edRukov: TDBEditEh;
    edDateZ: TDBDateTimeEditEh;
    Panel12: TPanel;
    GroupBox3: TGroupBox;
    DokumentROVD: TStringField;
    DokumentROVD_DATE: TDateField;
    DokumentROVD_ZAKL: TMemoField;
    DokumentSOOB: TMemoField;
    DokumentIZMEN: TMemoField;
    DokumentR_Familia: TStringField;
    DokumentR_Name: TStringField;
    DokumentOTEC: TStringField;
    DokumentMAT: TStringField;
    DokumentR_OTCH: TStringField;
    btChoiceChild: TBitBtn;
    TBItemAktRogd: TTBItem;
    TBItemAktBrak: TTBItem;
    DokumentIS_IZMEN: TBooleanField;
    N_F_cbIsIzmen: TDBCheckBoxEh;
    DokumentFIO_NEW: TStringField;
    tbDetiFIO: TStringField;
    DokumentDOLG_RUKOV: TStringField;
    lbRukov: TvchDBText;
    pcBrak: TPageControl;
    tsBrak: TTabSheet;
    tsRastSud: TTabSheet;
    Label30: TLabel;
    Label31: TLabel;
    edSudDate: TDBDateTimeEditEh;
    Label35: TLabel;
    edSud: TDBEditEh;
    edSuprug2: TDBEditEh;
    Label38: TLabel;
    DokumentB_DATE2: TDateField;
    edSudDateSila: TDBDateTimeEditEh;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    edB_NOMER: TDBEditEh;
    edB_DATE: TDBDateTimeEditEh;
    edB_ZAGS: TDBEditEh;
    edSuprug: TDBEditEh;
    DokumentTYPE_BRAK: TIntegerField;
    edTypeBrak: TDBComboBoxEh;
    lbSpec: TvchDBText;
    edSpec: TDBEditEh;
    DokumentSPEC: TStringField;
    DokumentDOLG_SPEC: TStringField;
    DokumentPRINT_RAZR: TBooleanField;
    cbRazr: TDBCheckBoxEh;
    edROVD_ZAKL: THunSpellDBMemo;
    edSOOB: THunSpellDBMemo;
    edIZMEN: THunSpellDBMemo;
    DokumentKOD_PRICH: TIntegerField;
    TBItemDeclare: TTBItem;
    Label39: TLabel;
    edPol: TDBComboBoxEh;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure cbOnlyGodChange(Sender: TObject);
    procedure cbOnlyGodRChange(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure btChoiceChildClick(Sender: TObject);
    procedure TBItemAktRogdClick(Sender: TObject);
    procedure TBItemAktBrakClick(Sender: TObject);
    procedure edROVDEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure N_F_cbIsIzmenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edNameUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edTypeBrakChange(Sender: TObject);
    procedure edSpecEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edPrichEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure edPrichEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure TBItemDeclareClick(Sender: TObject);
    procedure GridDetiColumns3EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure GridDetiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edOtchUpdateData(Sender: TObject; var Handled: Boolean);
  private
//    H : THintWindow;
    procedure OnDestroyHint( Sender : TObject);
    procedure SetIDZags;
  public
    { Public declarations }
    function CreateSubMenuRun: Boolean; override;
    procedure WriteSoato(fld:TField);
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    function GetTypeBrak:Integer;
    procedure UpdateActions; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    function BeforeEdit : Boolean; override;
    function SaveToIni : Boolean; override;
    procedure LoadFromIni; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure CheckOnlyGod;
    procedure CheckOnlyGodR;
    procedure CheckRnGorod;
    procedure PostDokument; override;
    function AddParEnterAdresat(slPar: TStringList; strFieldName:String=''): Boolean;  override;
    procedure CheckFont;
  end;

  function EditZAGS_ZaklChName(nID : Integer) : Boolean;


implementation

uses dBase, fMain, fChoiceNasel, fShablon, fEnterDokument, uProject;

{$R *.DFM}

var
  fmZAGS_ZaklChName: TfmZAGS_ZaklChName;

function EditZAGS_ZaklChName(nID : Integer) : Boolean;
begin
//  result := true;
  fmZAGS_ZaklChName := TfmZAGS_ZaklChName.Create(nil);

  with fmZAGS_ZaklChName do begin
    SetHunSpell(edROVD_ZAKL);
    SetHunSpell(edSOOB);
    SetHunSpell(edIZMEN);
  end;

  try
    with fmZAGS_ZaklChName do begin
      IsReadDokument:=true;
      TBItemZAGS.Visible:=false;
      TBToolbarOrgan.Visible:=false;
      if nID=-1 then begin
        NewDok(true);
        SetIDZags;
//      CheckEnabledNameOrgan(true);
      end else begin
        ReadDok( nID );
//      CheckEnabledNameOrgan(false);
        TBToolbarOrgan.Visible:=false;
      end;
      IsReadDokument:=false;
      QueryExit:=false;
      Result:=EditModal;
    end;
  finally
    fmZAGS_ZaklChName.Free;
    fmZAGS_ZaklChName:=nil;
  end;
end;

{ TfmZAGS_ZaklChName }

constructor TfmZAGS_ZaklChName.Create(Owner: TComponent);
var
  n:Integer;
  d2xml:TDataSet2XML;
begin
  inherited;
  d2xml:=ds2xml.DS_Add(Dokument,true);
  d2xml.FClearRecord:=false;
  d2xml.ExceptFields:='ID;ID_ZAGS;';
  ds2xml.DS_Add(tbDeti);

  FCheckPol:=true;  // !!! для автоматического опрелеления пола в FIOUpdateDataP  (edName.OnUpdateData:=FIOUpdateDataP)

 // FDokZAGS := true;
  FCheckLookupField:=false;
  dmBase.SetDateFormat(tbDeti);
  if not tbDeti.Active then tbDeti.Active:=true;
  if not Dokument.Active then Dokument.Active:=true;

  TypeObj := dmBase.TypeObj_ZAGS_ZaklChName;

  edPRICH.EditButtons[1].Glyph:=ImBtClear.Picture.Bitmap;

// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(1);
  SetMRUList(edR_RG_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edRG_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edGT_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edR_RG_RN,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edRG_RN,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edGT_RN,n,2,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(3);
  SetMRUList(edR_RG_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edRG_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edGT_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_ROGD,btChoiceChild.Glyph);

  SetLength(FArrChoiceRekv,7);
  FArrChoiceRekv[0].nType:=SHABLON_ADRESAT;
  FArrChoiceRekv[0].FieldName:='ADRESAT';

  FArrChoiceRekv[1].nType:=0;
  FArrChoiceRekv[1].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[1].FieldName:='R_ZAGS';
  FArrChoiceRekv[1].sPadeg:='Т';

  FArrChoiceRekv[2].nType:=0;
  FArrChoiceRekv[2].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[2].FieldName:='B_ZAGS';
  FArrChoiceRekv[2].sPadeg:='Т';

  FArrChoiceRekv[3].nType:=SHABLON_ROVD;
  FArrChoiceRekv[3].FieldName:='ROVD';

  FArrChoiceRekv[4].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[4].FieldName:='IZMEN';
  FArrChoiceRekv[4].TypeEdit:=emShablon;

  FArrChoiceRekv[5].nType:=SHABLON_ZAKL_ROVD;
  FArrChoiceRekv[5].FieldName:='ROVD_ZAKL';
  FArrChoiceRekv[5].TypeEdit:=emShablon;

  FArrChoiceRekv[6].nType:=SHABLON_POLAG;
  FArrChoiceRekv[6].FieldName:='SOOB';
  FArrChoiceRekv[6].TypeEdit:=emShablon;

//  FArrChoiceRekv[7].nType:=SHABLON_PRICH_PER;
//  FArrChoiceRekv[7].FieldName:='PRICH';


  {
  SetLength(FArrChoiceRekv,7);
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
  }
  FAutoNum := false; //IsAutoNumZAGS;
  FMainTable := dmBase.AddDokZAGS;
  dsGragd.DataSet := dmBase.SprGragd;
//  edFamilia.EditButtons[0].Glyph := edDecl.EditButtons[0].Glyph;

  PageControl1.ActivePageIndex:=0;
  FPageControl := PageControl1;

//  edFamilia.OnExit := OnDestroyHint;
//  edName.OnExit    := OnDestroyHint;
//  edOtch.OnExit    := OnDestroyHint;
//  edRukov.OnExit   := OnDestroyHint;

//  fmMain.SetCurrentDokument(Dokument);

//  edFamilia.EditButtons.Items[0].Visible:=false;

//  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
//    cbOnlyGodR.ClientWidth := GetTextWidth(cbOnlyGodR.Items[2],cbOnlyGodR.Font.Height,cbOnlyGodR.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE); //+5;
//    cbOnlyGodR.Left  := lbDateR.Left+lbDateR.Width+5;
//    edDateR.Left := cbOnlyGodR.Left+cbOnlyGodR.Width+5;
//  end else begin
//    cbOnlyGodR.Visible:=false;
//  end;

  edFamilia.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateDataP;
  edOtch.OnUpdateData:=FIOUpdateDataP;

  edRFamilia.OnUpdateData:=FIOUpdateData;
  edRName.OnUpdateData:=FIOUpdateData;
  edROtch.OnUpdateData:=FIOUpdateData;

  edOtec.OnUpdateData:=FIOUpdateData;
  edMat.OnUpdateData:=FIOUpdateData;
  edSuprug.OnUpdateData:=FIOUpdateData;
//  edFIO_NEW.OnUpdateData:=FIOUpdateData;

  edRG_GOROD.OnUpdateData:=CityUpdate;
  edGT_GOROD.OnUpdateData:=CityUpdate;

  SetcbBel(nil);
{
  SetLength(FArrCheckField,5);
  WriteToArrCheck(0,  1, false, 'GT_OBL'    );
  WriteToArrCheck(1,  2, false, 'GT_RAION'  );
  WriteToArrCheck(2,  1, false, 'RG_OBL'    );
  WriteToArrCheck(3,  2, false, 'RG_RAION'  );
  WriteToArrCheck(4,  3, false, 'GT_RNGOROD');
}
  //SetPanelPovtor(tsPovtor, cbPovtor, Label41, Label42);
  TBSubmenuGISUN.Visible:=false;
//  ImageGISUN.Visible := false;
end;

destructor TfmZAGS_ZaklChName.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZAGS_ZaklChName.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmZAGS_ZaklChName.GetVid: String;
begin
  Result := 'ZAGS_ZaklChName';
end;

function TfmZAGS_ZaklChName.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

//  DokumentPOVTOR.AsBoolean:=false;
//  DokumentCOPIA.AsBoolean:=false;

  DokumentRG_B_RESP.AsBoolean:=true;
  DokumentRG_B_OBL.AsBoolean:=true;

  DokumentGT_B_RESP.AsBoolean:=true;
  DokumentRG_B_OBL.AsBoolean:=true;

  DokumentR_RG_B_RESP.AsBoolean:=true;
  DokumentR_RG_B_OBL.AsBoolean:=true;
  DokumentIS_IZMEN.AsBoolean:=true;

  DokumentRG_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentGT_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');

  DokumentSPEC.AsString:=GlobalTask.GetLastValueAsString( 'ZAKLCHNAME_SPEC');
  if DokumentSPEC.AsString<>''
    then DokumentDOLG_SPEC.AsString:=GlobalTask.GetLastValueAsString('ZAKLCHNAME_SPEC_DOLG');

  if GlobalTask.GetLastValueAsString('ZAKLCHNAME_UTV')='0'
    then DokumentPRINT_RAZR.AsBoolean:=false
    else DokumentPRINT_RAZR.AsBoolean:=true;

//  cbBelorus.Checked:=false;
//  if lAppend then begin
//    CheckRnGorod;
//  end;
  inherited NewDok(lAppend);

  QueryExit:=false;
  Result := true;
end;

function TfmZAGS_ZaklChName.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
begin
  Result := true;
  if not dmBase.AddDokZAGS.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
//  NewDok(false);

  //------- читаем карточку -----------

  if dmBase.AddDokZAGS.FieldByName('VERSION').AsString='1' then begin
    Dokument.EmptyTable;
    Dokument.Append;
    Dokument.Post;
    tbDeti.EmptyTable;

    ds2xml.StringToXML(dmBase.AddDokZAGS.FieldByName('VALUE').AsString);
    ds2xml.XMLToData;

  end else begin
    Dokument.EmptyTable;
    tbDeti.EmptyTable;
    LoadMemTableFromStr(dmBase.AddDokZAGS.FieldByName('VALUE').AsString,
                        ['DOKUMENT', Dokument, 'DETI', tbDeti],dmBase.AddDokZAGS.FieldByName('FIELD_DELIMITER').AsString,nil);
  end;

  tbDeti.First;
  Dokument.First;
  Dokument.Edit;
  for i:=0 to dmBase.AddDokZAGS.FieldCount-1 do begin
    strField := dmBase.AddDokZAGS.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.AddDokZAGS.Fields[i]);
    end;
  end;

  SetIDZags;

  if DokumentTYPE_BRAK.IsNull then DokumentTYPE_BRAK.AsInteger:=1;
  DokumentPRINT_RAZR.AsBoolean:=true;

//  ReadDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger,
//          STOD('1899-12-30',tdAds));

//  DokumentCOPIA.AsBoolean:=false;

//  DokumentGT_RNGOROD.AsString  := '';
//  if DokumentGT_B_RN.IsNull then DokumentGT_B_RN.AsBoolean:=true;
//  if not DokumentGT_B_RN.AsBoolean then begin
//    DokumentGT_RNGOROD.AsString := DokumentGT_RAION.AsString;
//    DokumentGT_RAION.AsString   := '';
//  end;

  AdditiveReadDok;

//  CheckRnGorod;

  Dokument.Post;
  CheckFont;

end;

//------------------------------------------------------------------------
procedure TfmZAGS_ZaklChName.WriteSoato(fld:TField);
var
  SOATO:TSOATO;
begin
  SOATO:=dmBase.GetSoatoAkt(Dokument,
        'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD',true,FLenSoato);
  if (SOATO.Kod='9000000') and (DokumentGT_GOSUD.IsNull or (DokumentGT_GOSUD.AsInteger=MY_GRAG)) then begin
    SOATO:=dmBase.GetSoatoAkt(Dokument,
          'SM_GOSUD,FName;SM_OBL;SM_RAION;SM_GOROD,SM_B_GOROD',true,FLenSoato);

  end;
  fld.AsString:=SOATO.Kod;
end;
//------------------------------------------------------------------------
function TfmZAGS_ZaklChName.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr, strRazd : String;
begin
  AdditiveBeforeWriteDok;
  PostDataSet(Dokument);
  PostDataSet(tbDeti);
  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
//  if DokumentDATEZ.IsNull then begin
//    strErr := ' Заполните дату. ';
//  end else if DokumentNOMER.AsString='' then begin
//    strErr := ' Заполните номер. ';
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства о смерти. ';
  if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then begin
    strErr := ' Заполните Фамилия, Имя. ';
  end;

  if strErr<>'' then begin
    PutError(strErr);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.AddDokZAGS.Append;
    dmBase.AddDokZAGS.Post;
    nID := dmBase.AddDokZAGS.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.AddDokZAGS.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    if DokumentTYPE_BRAK.AsString='' then DokumentTYPE_BRAK.AsInteger:=1;
    Dokument.Post;

    dmBase.AddDokZAGS.Edit;
    SaveDef:=false;

    if FWriteAsXML then begin
      if ds2xml.DataToXML then begin
        dmBase.AddDokZAGS.FieldByName('VALUE').AsString:=ds2xml.XMLToString;
        dmBase.AddDokZAGS.FieldByName('VERSION').AsString:='1';
      end else begin
        PutError(ds2xml.LastError,self);
      end;
    end else begin
      dmBase.AddDokZAGS.FieldByName('VALUE').AsString:=SaveMemTableToStr(['DOKUMENT', dokument, 'DETI', tbDeti], strRazd, nil);
      dmBase.AddDokZAGS.FieldByName('FIELD_DELIMITER').AsString:=strRazd;
      dmBase.AddDokZAGS.FieldByName('VERSION').AsString:='0';
    end;

    for i:=1 to dmBase.AddDokZAGS.FieldCount-1 do begin
      strField := dmBase.AddDokZAGS.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.AddDokZAGS.Fields[i].Value := fld.Value;
      end;
    end;
    dmBase.AddDokZAGS.FieldByName('OK').AsBoolean:=DokumentIS_IZMEN.AsBoolean;
    dmBase.AddDokZAGS.FieldByName('TYPEDOK').AsInteger:=TypeObj;
    dmBase.AddDokZAGS.Post;

    if FAddNewDok then begin
      GlobalTask.SetLastValueAsString('ZAKLCHNAME_SPEC',DokumentSPEC.AsString);
      if DokumentSPEC.AsString=''
        then GlobalTask.SetLastValueAsString('ZAKLCHNAME_SPEC_DOLG','')
        else GlobalTask.SetLastValueAsString('ZAKLCHNAME_SPEC_DOLG',DokumentDOLG_SPEC.AsString);
    end;

//    WriteDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger,
//                   STOD('1899-12-30',tdAds));


    AdditiveWriteDok;
//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);
    QueryExit:=false;
    Result := true;
    if Result then QueryExit:=false;
  end;
end;

procedure TfmZAGS_ZaklChName.UpdateActions;
begin
  inherited;
end;

procedure TfmZAGS_ZaklChName.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    strField:=ANSIUpperCase(Field.FieldName);
    if strField = 'FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentMEN_ID.AsString:='';
      end else begin
        edRFamilia.Text:=Field.AsString;
      end;
    end else if strField = 'NAME' then begin
      if Field.AsString<>'' then begin
        edRName.Text:=Field.AsString;
      end;
    end else if strField = 'OTCH' then begin
      if Field.AsString<>'' then begin
        edROtch.Text:=Field.AsString;
      end;
    end;
  end;
end;

function TfmZAGS_ZaklChName.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
end;

procedure TfmZAGS_ZaklChName.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZAGS_ZaklChName.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmZAGS_ZaklChName.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZAGS_ZaklChName.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZAGS_ZaklChName.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZAGS_ZaklChName.CheckOnlyGod;
begin
end;

procedure TfmZAGS_ZaklChName.CheckOnlyGodR;
begin
//  if cbOnlyGodR.ItemIndex=2 then begin          // год и месяц
//    edDATER.EditButton.Visible:=false;
//    edDATER.EditFormat:='MM.YYYY';
//  end else if cbOnlyGodR.ItemIndex=1 then begin // год
//    edDATER.EditButton.Visible:=false;
//    edDATER.EditFormat:='YYYY';
//  end else begin      // полная дата
//    edDATER.EditButton.Visible:=true;
//    edDATER.EditFormat:='DD.MM.YYYY';
//  end;
end;

procedure TfmZAGS_ZaklChName.edGT_RNGORODNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZAGS_ZaklChName.CheckRnGorod;
//var
//  nW,nL,nT, nW1 : Integer;
begin
{
  if EnabledRnGorod or
     (not DokumentGT_B_RN.IsNull and not DokumentGT_B_RN.AsBoolean) then begin
    nW  := edGT_GOROD_R.Width;
    nL  := edGT_RAION.Left;
    nT  := edGT_GOROD_R.Top;
    nW1 := edGT_RNGOROD.Width;
    edGT_RNGOROD.Left  := nL;
    edGT_RNGOROD.Top   := nT;
    edGT_GOROD_R.Width := nW - nW1 - 5;
    edGT_GOROD_R.Left  := nL + nW1 + 5;
    edGT_RNGOROD.Visible := true;
  end else begin
    edGT_RNGOROD.Visible := false;
  end;
}
end;

procedure TfmZAGS_ZaklChName.cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZAGS_ZaklChName.cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR;
end;

procedure TfmZAGS_ZaklChName.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmZAGS_ZaklChName.CreateSubMenuRun: Boolean;
//var
// it : TTbItem;
// sep : TTbSeparatorItem;
begin
  Result:=false;

//  it := TTbItem.Create(TBSubmenuRun);
//  it.Caption:='Аннулирование актовой записи';
//  it.OnClick:=Event_Annulir;
//  TBSubmenuRun.Add(it);
end;

procedure TfmZAGS_ZaklChName.btAddChildClick(Sender: TObject);
begin
  tbDeti.Append;
  ActiveControl:=GridDeti;
end;

procedure TfmZAGS_ZaklChName.btDelChildClick(Sender: TObject);
begin
  if tbDeti.RecordCount>0 then begin
    tbDeti.Delete;
    ActiveControl:=GridDeti;
  end;
end;

//--------------------------------------------------------------------------
// выбор актовой записи о рождении ребенка
procedure TfmZAGS_ZaklChName.btChoiceChildClick(Sender: TObject);
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
      tbDetiFIO.AsString := GetValueFieldEx(arrRec, 'FAMILIA','')+' '+GetValueFieldEx(arrRec, 'NAME','')+' '+
                            GetValueFieldEx(arrRec, 'OTCH', '');
      v := GetValueField(arrRec, 'DATER');
      if v = null then tbDetiDateR.AsString:='' else tbDetiDateR.Value := v;
      if dmBase.tbZapisRogd.Locate('ID', GetValueFieldEx(arrRec, 'ID',0),[]) then begin
        tbDetiMESTO.AsString:=dmBase.GetAdresAkt3(dmBase.tbZapisRogd,
              'GOSUD,FName;OBL,B_OBL;RAION;GOROD,B_GOROD',1);
      end;
      tbDetiNOMER.AsString:= GetValueFieldEx(arrRec, 'NOMER','');
      v:=GetValueField(arrRec, 'DATEZ');
      if v<>null then tbDetiDATEA.Value:=v;
      tbDetiMESTOREG.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','Т',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

      tbDeti.Post;
      QueryExit:=true;
    end;
//    Opis.DataSet.Filter   := '';
//    Opis.DataSet.Filtered := false;
  end;
end;
//--------------------------------------------------------------------------
procedure TfmZAGS_ZaklChName.TBItemDeclareClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ParamFlt:TParamFieldFlt;
  s:String;
  sl:TStringList;
  arr:TArrStrings;
  i:Integer;
begin
  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_DECL_CHNAME');
  if Opis<>nil then begin
    if edFamilia.Text<>'' then begin
      s:=Trim(edFamilia.Text);
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
    if Opis.ChoiceFromSprEx(edFamilia, v, arrRec, ParamFlt) and (v<>null) then begin
      FRun:=true;
      try
        EditDataSet(Dokument);
        DokumentFAMILIA.AsString := GetValueFieldEx(arrRec, 'FAMILIADO','');
        DokumentNAME.AsString    := GetValueFieldEx(arrRec, 'NAMEDO','');
        DokumentOTCH.AsString    := GetValueFieldEx(arrRec, 'OTCHDO', '');
        DokumentPOL.AsString     := GetValueFieldEx(arrRec, 'POL', '');
        v := GetValueField(arrRec, 'DATER');
        if v = null then DokumentDateR.AsString:='' else DokumentDateR.Value := v;
        DokumentFIO_NEW.AsString:=Trim(GetValueFieldEx(arrRec, 'FamiliaPosle',''))+' '+Trim(GetValueFieldEx(arrRec, 'NamePosle',''))+' '+
                                  Trim(GetValueFieldEx(arrRec, 'OtchPosle',''));
        DokumentPRICH.AsString:=GetValueFieldEx(arrRec, 'PRICH','');
        DokumentKOD_PRICH.AsString:=GetValueFieldEx(arrRec, 'KOD_PRICH','');

        DokumentRG_B_RESP.AsBoolean := GetValueFieldEx(arrRec, 'B_RESP',true);
        DokumentRG_GOSUD.AsString   := GetValueFieldEx(arrRec, 'GOSUD','');
        DokumentRG_B_OBL.AsBoolean  := true;
        DokumentRG_OBL.AsString     := GetValueFieldEx(arrRec, 'OBL', '');
        DokumentRG_RAION.AsString   := GetValueFieldEx(arrRec, 'RAION','');
        DokumentRG_GOROD.AsString   := GetValueFieldEx(arrRec, 'GOROD','');
        DokumentRG_B_GOROD.AsString := GetValueFieldEx(arrRec, 'B_GOROD','');

        DokumentGT_B_RESP.AsBoolean := true;
        DokumentGT_GOSUD.AsString   := GetValueFieldEx(arrRec, 'M_GOSUD','');
        DokumentGT_B_OBL.AsBoolean  := GetValueFieldEx(arrRec, 'M_B_OBL',true);;
        DokumentGT_OBL.AsString     := GetValueFieldEx(arrRec, 'M_OBL', '');
        DokumentGT_RAION.AsString   := GetValueFieldEx(arrRec, 'M_RAION','');
        DokumentGT_GOROD.AsString   := GetValueFieldEx(arrRec, 'M_GOROD','');
        DokumentGT_B_GOROD.AsString := GetValueFieldEx(arrRec, 'M_B_GOROD','');
        DokumentGT_GOROD_R.AsString := GetValueFieldEx(arrRec, 'M_GOROD_R','');

        DokumentTYPE_BRAK.AsString := GetValueFieldEx(arrRec, 'TYPE_BRAK','');
        DokumentB_ZAGS.AsString := GetValueFieldEx(arrRec, 'B_ZAGS','');
        DokumentB_NOMER.AsString := GetValueFieldEx(arrRec, 'B_NOMER','');
        v := GetValueField(arrRec, 'B_DATE');
        if v=null then DokumentB_DATE.AsString:='' else DokumentB_DATE.Value := v;
        v := GetValueField(arrRec, 'B_DATE2');
        if v=null then DokumentB_DATE2.AsString:='' else DokumentB_DATE2.Value := v;

        if DokumentR_FAMILIA.AsString='' then begin
          DokumentR_FAMILIA.AsString := GetValueFieldEx(arrRec, 'FAMILIADO','');
          DokumentR_NAME.AsString    := GetValueFieldEx(arrRec, 'NAMEDO','');
          DokumentR_OTCH.AsString    := GetValueFieldEx(arrRec, 'OTCHDO', '');
        end;
        DokumentR_RG_B_RESP.AsBoolean := GetValueFieldEx(arrRec, 'B_RESP',true);
        DokumentR_RG_GOSUD.AsString   := GetValueFieldEx(arrRec, 'GOSUD','');
        DokumentR_RG_B_OBL.AsBoolean  := true;
        DokumentR_RG_OBL.AsString     := GetValueFieldEx(arrRec, 'OBL', '');
        DokumentR_RG_RAION.AsString   := GetValueFieldEx(arrRec, 'RAION','');
        DokumentR_RG_GOROD.AsString   := GetValueFieldEx(arrRec, 'GOROD','');
        DokumentR_RG_B_GOROD.AsString := GetValueFieldEx(arrRec, 'B_GOROD','');

        DokumentWORK.AsString:=GetValueFieldEx(arrRec, 'WORK_PLACE','');
        s:=GetValueFieldEx(arrRec, 'VOENKOM','');
        if s<>'' then begin
          if dmBase.SprVoenkom.Locate('ID', s, []) then begin
            DokumentVUS.AsString:=dmBase.SprVoenkom.FieldByName('NAME').AsString;
          end;
        end;
        PostDataSet(Dokument);
        {
        strRec :=0 '"'+tbDetiFAMILIA.AsString+'",'+
                 1 '"'+tbDetiNAME.AsString+'",'+
                 2 '"'+tbDetiOTCH.AsString+'",'+
                 3 '"'+tbDetiGOD_ROG.AsString+'",'+
                 4 '"'+StringReplace(tbDetiZAGS_NAME.AsString,'"','chr(34)',[rfReplaceAll])+'",'+
                 5 '"'+tbDetiZAGS_NOMER.AsString+'",'+
                 6 '"'+strDate+'",'+   дата записи
                 7 '"'+strDateR+'",'+  дата рождения
                 8 '"'+StringReplace(tbDetiMESTOR.AsString,'"','chr(34)',[rfReplaceAll])+'"'          }

        s:=GetValueFieldEx(arrRec, 'DETI','');
        if s<>'' then begin
          StrToArr(s, arr, Chr(13), true);
          sl:=TStringList.Create;
          tbDeti.EmptyTable;
          for i:=Low(arr) to High(arr) do begin
            sl.CommaText := arr[i];
            if sl.Count>7 then begin
              tbDeti.Append;
              tbDetiFIO.AsString:=sl.Strings[0]+' '+sl.Strings[1]+' '+sl.Strings[2];
              tbDetiMESTO.AsString:=StringReplace(sl.Strings[8],'chr(34)','"',[rfReplaceAll]);
              try
                tbDetiDATER.AsDateTime := STOD(sl.Strings[7],tdAds);
              except
              end;
              if sl.Strings[5]<>'' then begin
                tbDetiMESTOREG.AsString:=StringReplace(sl.Strings[4],'chr(34)','"',[rfReplaceAll]);
                tbDetiNOMER.AsString:=sl.Strings[5];
                try
                  tbDetiDATEA.AsDateTime := STOD(sl.Strings[6],tdAds);
                except
                end;
              end;
              tbDeti.Post;
            end;
          end;
          sl.Free;
        end;

      finally
        FRun:=false;
        QueryExit:=true;
      end;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
//  Opis.DataSet.Filter   := '';
//  Opis.DataSet.Filtered := false;
end;
//--------------------------------------------------------------------------
procedure TfmZAGS_ZaklChName.TBItemAktRogdClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ParamFlt:TParamFieldFlt;
  s:String;
begin
  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ROGD');
  if Opis<>nil then begin
    if edFamilia.Text<>'' then begin
      s:=Trim(edFamilia.Text);
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
    if Opis.ChoiceFromSprEx(edFamilia, v, arrRec, ParamFlt) and (v<>null) then begin
      FRun:=true;
      try
        EditDataSet(Dokument);
        DokumentFAMILIA.AsString := GetValueFieldEx(arrRec, 'FAMILIA','');
        DokumentNAME.AsString    := GetValueFieldEx(arrRec, 'NAME','');
        DokumentOTCH.AsString    := GetValueFieldEx(arrRec, 'OTCH', '');
        DokumentPOL.AsString     := GetValueFieldEx(arrRec, 'POL', '');
        v := GetValueField(arrRec, 'DATER');
        if v = null then DokumentDateR.AsString:='' else DokumentDateR.Value := v;
        DokumentRG_B_RESP.AsBoolean := GetValueFieldEx(arrRec, 'B_RESP',true);
        DokumentRG_GOSUD.AsString   := GetValueFieldEx(arrRec, 'GOSUD','');
        DokumentRG_B_OBL.AsBoolean  := true;
        DokumentRG_OBL.AsString     := GetValueFieldEx(arrRec, 'OBL', '');
        DokumentRG_RAION.AsString   := GetValueFieldEx(arrRec, 'RAION','');
        DokumentRG_GOROD.AsString   := GetValueFieldEx(arrRec, 'GOROD','');
        DokumentRG_B_GOROD.AsString := GetValueFieldEx(arrRec, 'B_GOROD','');

        DokumentR_NOMER.AsString  := GetValueFieldEx(arrRec, 'NOMER','');
        DokumentR_DATE.AsDateTime := GetValueFieldEx(arrRec, 'DATEZ',0);

        DokumentR_FAMILIA.AsString := GetValueFieldEx(arrRec, 'FAMILIA','');
        DokumentR_NAME.AsString    := GetValueFieldEx(arrRec, 'NAME','');
        DokumentR_OTCH.AsString    := GetValueFieldEx(arrRec, 'OTCH', '');

        DokumentR_RG_B_RESP.AsBoolean := GetValueFieldEx(arrRec, 'B_RESP',true);
        DokumentR_RG_GOSUD.AsString   := GetValueFieldEx(arrRec, 'GOSUD','');
        DokumentR_RG_B_OBL.AsBoolean  := true;
        DokumentR_RG_OBL.AsString     := GetValueFieldEx(arrRec, 'OBL', '');
        DokumentR_RG_RAION.AsString   := GetValueFieldEx(arrRec, 'RAION','');
        DokumentR_RG_GOROD.AsString   := GetValueFieldEx(arrRec, 'GOROD','');
        DokumentR_RG_B_GOROD.AsString := GetValueFieldEx(arrRec, 'B_GOROD','');

        DokumentOTEC.AsString := GetValueFieldEx(arrRec, 'ON_FAMILIA','')+' '+GetValueFieldEx(arrRec, 'ON_NAME','')+' '+
                                 GetValueFieldEx(arrRec, 'ON_OTCH','');
        DokumentMAT.AsString  := GetValueFieldEx(arrRec, 'ONA_FAMILIA','')+' '+GetValueFieldEx(arrRec, 'ONA_NAME','')+' '+
                                 GetValueFieldEx(arrRec, 'ONA_OTCH','');

        DokumentR_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','Т',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

        PostDataSet(Dokument);
      finally
        FRun:=false;
        QueryExit:=true;
      end;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
//  Opis.DataSet.Filter   := '';
//  Opis.DataSet.Filtered := false;
end;
//-----------------------------------------------------------------------------------------------------
procedure TfmZAGS_ZaklChName.TBItemAktBrakClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  sName,ss,s : String;
  Pol:TPol;
  lCheck:Boolean;
  old:TCursor;
  ParamFlt:TParamFieldFlt;
begin
  ParamFlt := nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_BRAK');
  if Opis<>nil then begin
    sName:='';
    if (sName='') and (edName.Text<>'') then sName:=edName.Text;
    if (sName='') and (edRName.Text<>'') then sName:=edRName.Text;
    Pol:=tpNone;
    if sName<>'' then begin
      dmBase.CheckNameBel(Pol,sName,'');
    end;
    if Pol=tpNone then begin
      if Problem('   Ищем мужчину ?   ') then begin
        Pol := tpM;
      end else begin
        Pol := tpG;
      end;
    end;
    if Pol=tpM
      then ss:='ON_'
      else ss:='ONA_';
    if edFamilia.Text<>'' then begin
      s:=Trim(edFamilia.Text);
      if (s<>'') and (Pos(' ',s)=0) then begin
        Opis.AutoFilter:=true;
        ParamFlt := TParamFieldFlt.Create;
        with ParamFlt do begin
          TypeSr:=tsBegin;
          Value1:=s;
          CICharacter:=true;
          FieldName:=ss+'FAMILIAP';
          OnlySet:=true;
        end;
      end;
    end;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edFamilia, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      lCheck:=dbDisableControls(Dokument);
      Screen.Cursor := crHourGlass;
      FRun:=true;
      try
        EditDataSet(Dokument);
        if Pol=tpM then DokumentPOL.AsString:='М'
                   else DokumentPOL.AsString:='Ж';
        DokumentB_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','Т',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

        DokumentB_NOMER.AsString  := GetValueFieldEx(arrRec, 'NOMER','');
        DokumentB_DATE.AsDateTime := GetValueFieldEx(arrRec, 'DATEZ',0);
        if Pol=tpM
          then DokumentSUPRUG.AsString := GetValueField(arrRec, 'ONA_FAMILIAP')+' '+GetValueField(arrRec, 'ONA_NAME')+' '+GetValueField(arrRec, 'ONA_OTCH')
          else DokumentSUPRUG.AsString := GetValueField(arrRec, 'ON_FAMILIAP')+' '+GetValueField(arrRec, 'ON_NAME')+' '+GetValueField(arrRec, 'ON_OTCH');

        //  в браках: место жительства ON_M_...   в рождениях: место рождения ON_...
        DokumentGT_B_RESP.Value:=GetValueFieldEx(arrRec, ss+'M_B_RESP',true);
        DokumentGT_GOSUD.AsString:=GetValueFieldEx(arrRec, ss+'M_GOSUD','');
        DokumentGT_B_OBL.Value:=GetValueFieldEx(arrRec, ss+'M_B_OBL',true);
        DokumentGT_OBL.Value:=GetValueFieldEx(arrRec, ss+'M_OBL','');
        DokumentGT_RAION.AsString:=GetValueFieldEx(arrRec, ss+'M_RAION','');
        DokumentGT_B_GOROD.AsString:=GetValueFieldEx(arrRec, ss+'M_B_GOROD','');
        DokumentGT_GOROD.AsString:=GetValueFieldEx(arrRec, ss+'M_GOROD','');
        DokumentGT_GOROD_R.AsString:=GetValueFieldEx(arrRec, ss+'M_GOROD_R','');

        DokumentWORK.AsString:=GetValueFieldEx(arrRec, ss+'WORK','');
//      if GetValueFieldEx(arrRec, ss+'VUS',false)=true then begin
//        if pol=tpM then DokumentVUS.AsString:='ВОЕННООБЯЗАННЫЙ' else
//      end else begin
//      end;
// ???       DokumentVUS.AsString:=GetValueFieldEx(arrRec, ss+'VUS','');

        PostDataSet(Dokument);
        QueryExit:=true;
      finally
        FRun:=false;
        Screen.Cursor := old;
        dbEnableControls(Dokument,lCheck);
      end;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
end;

procedure TfmZAGS_ZaklChName.edROVDEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD,Trim(edROVD.Text));
 if s<>'' then begin
   edROVD.Text:=s;
 end;
end;

procedure TfmZAGS_ZaklChName.PostDokument;
begin
  inherited;
  PostDataSet(tbDeti);
end;

procedure TfmZAGS_ZaklChName.N_F_cbIsIzmenClick(Sender: TObject);
begin
  if N_F_cbIsIzmen.Checked
    then edIzmen.Enabled:=true
    else edIzmen.Enabled:=false;
end;

procedure TfmZAGS_ZaklChName.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbDeti,'Deti','Дети');
  {$ENDIF}
  TBItemAdresat.Visible:=false;
end;

procedure TfmZAGS_ZaklChName.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;

procedure TfmZAGS_ZaklChName.edNameUpdateData(Sender: TObject;  var Handled: Boolean);
var
  s:String;
begin
  if not FRun and not IsReadDokument then begin
//    s:=PolFromName( edName.Text);
    s:=PolFrom(edName.Text, edOtch.Text);
    if s<>'' then begin
      EditDataSet(Dokument);
      DokumentPOL.AsString:=s;
    end;
  end;
end;
procedure TfmZAGS_ZaklChName.edOtchUpdateData(Sender: TObject; var Handled: Boolean);
var
  s:String;
begin
  if not FRun and not IsReadDokument then begin
    s:=PolFrom(edName.Text, edOtch.Text);
    if s<>'' then begin
      EditDataSet(Dokument);
      DokumentPOL.AsString:=s;
    end;
  end;
end;
//----------------------------------------------------------------------
function TfmZAGS_ZaklChName.GetTypeBrak:Integer;
begin
  if edTypeBrak.ItemIndex<0 then begin
    Result:=1;
  end else begin
    Result:=StrToInt(edTypeBrak.KeyItems[edTypeBrak.ItemIndex]);
  end;
end;
//----------------------------------------------------------------------
{
1=состоит в браке (з/а о браке)
2=в браке не состоит
3=разведен (решение суда)
4=разведен (з/а о раст. брака)
5=вдова (вдовец) (з/а о браке)
}
procedure TfmZAGS_ZaklChName.edTypeBrakChange(Sender: TObject);
var
  nValue:Integer;
begin
  nValue:=GetTypeBrak;
  if (nValue=2) then begin
    pcBrak.Visible:=false;
    edTypeBrak.HelpContext:=999;
  end else if (nValue=1) or (nValue=4) or (nValue=5) then begin
    pcBrak.Visible:=true;
    pcBrak.ActivePage:=tsBrak;
    edTypeBrak.HelpContext:=0;
  end else if (nValue=3) then begin    // решение суда
    pcBrak.Visible:=true;
    pcBrak.ActivePage:=tsRastSud;
    edTypeBrak.HelpContext:=0;
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
    FArrChoiceRekv[2].sPadeg:='Т';
  end;
end;

procedure TfmZAGS_ZaklChName.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

function TfmZAGS_ZaklChName.AddParEnterAdresat(slPar: TStringList;  strFieldName: String): Boolean;
var
  n:Integer;
begin
  Result:=true;
  slPar.Add('CAPTION=Значение');
  slPar.Add('ONLY_SHABLON=1');
  n:=FindChoiceRekv(strFieldName);
  if n=-1 then begin
    Result:=false;
  end else begin
    slPar.Add('SHABLON='+IntToStr(FArrChoiceRekv[n].nType));
  end;
//  s:=slPar.Values['CAPTION_SHABLON'];
end;
//-----------------------------------------------------------------
procedure TfmZAGS_ZaklChName.CheckFont;
begin
  if DokumentKOD_PRICH.AsInteger>0
    then edPrich.Font.Style:=[fsBold]
    else edPrich.Font.Style:=[];
end;
//-----------------------------------------------------------------
procedure TfmZAGS_ZaklChName.edPrichEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  EditDataSet(Dokument);
  DokumentKOD_PRICH.AsString:='';
  DokumentPRICH.AsString:='';
  PostDataSet(Dokument);
  CheckFont;
end;
//-----------------------------------------------------------------
procedure TfmZAGS_ZaklChName.edPrichEditButtons0Click(Sender: TObject; var Handled: Boolean);
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

procedure TfmZAGS_ZaklChName.GridDetiColumns3EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceShablonZAGS(TDBGridEh(ActiveControl).DataSource.DataSet,TDBGridEh(ActiveControl).SelectedField.FieldName,'И', '');
end;

procedure TfmZAGS_ZaklChName.GridDetiKeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
  if (Shift=[]) and (Key=VK_F10) and (TDBGridEh(ActiveControl).SelectedField.FieldName='MESTOREG') then begin
    ChoiceShablonZAGS(TDBGridEh(ActiveControl).DataSource.DataSet,TDBGridEh(ActiveControl).SelectedField.FieldName,'И', '');
    Key:=0;
  end;
end;


end.
