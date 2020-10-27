unit fZAGS_SprOtsut;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,  uSaveMemtable,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc,uTypes,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat,
  ZipForge;

type
  TfmZAGS_SprOtsut = class(TfmSimpleD)
    pn: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edNomer: TDBEditEh;
    edDateZ: TDBDateTimeEditEh;
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
    ImageGISUN: TImage;
    DokumentRG_B_GOROD: TSmallintField;
    DokumentGT_B_GOROD: TSmallintField;
    ApplicationEvents1: TApplicationEvents;
    pnMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbDateR: TLabel;
    Label21: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    edDateR: TDBDateTimeEditEh;
    edGRAG: TDBLookupComboboxEh;
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
    edGT_RNGOROD: TDBLookupComboboxEh;
    edGT_B_GOROD: TDBLookupComboboxEh;
    Label4: TLabel;
    edAdresat: TDBEditEh;
    DokumentADRESAT: TMemoField;
    gbDate: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edRG_RN: TDBEditEh;
    edRG_OBL: TDBEditEh;
    edGT_RN: TDBEditEh;
    edGT_OBL: TDBEditEh;
    edDate1: TDBEditEh;
    edDate2: TDBEditEh;
    DokumentDATE1: TStringField;
    DokumentDATE2: TStringField;
    Label9: TLabel;
    edPol: TDBComboBoxEh;
    pnPodp: TPanel;
    edRukov: TDBEditEh;
    pnRast: TPanel;
    tbRast: TkbmMemTable;
    tbRastB_DATE: TDateField;
    tbRastB_ZAGS: TMemoField;
    tbRastSUPRUG: TStringField;
    dsRast: TDataSource;
    N_F_cbBrak: TDBCheckBoxEh;
    tbRastLICO: TStringField;
    edB_NOMER: TDBEditEh;
    lb2: TLabel;
    edB_DATE: TDBDateTimeEditEh;
    lb3: TLabel;
    edB_ZAGS: TDBEditEh;
    lb5: TLabel;
    edSuprug: TDBEditEh;
    lb4: TLabel;
    edLico: TDBEditEh;
    pcRast: TPageControl;
    tsSmert: TTabSheet;
    tsRast: TTabSheet;
    tsAkt: TTabSheet;
    edS_NOMER: TDBEditEh;
    lb14: TLabel;
    edS_DATE: TDBDateTimeEditEh;
    lb15: TLabel;
    edS_ZAGS: TDBEditEh;
    lb13: TLabel;
    lb12: TLabel;
    edSudResh: TDBDateTimeEditEh;
    lb10: TLabel;
    lb11: TLabel;
    edSudName: TDBEditEh;
    edSudSila: TDBDateTimeEditEh;
    lb7: TLabel;
    edR_NOMER: TDBEditEh;
    lb8: TLabel;
    edR_DATE: TDBDateTimeEditEh;
    lb9: TLabel;
    edR_ZAGS: TDBEditEh;
    tbRastS_DATE: TDateField;
    tbRastS_ZAGS: TMemoField;
    tbRastR_DATE: TDateField;
    tbRastR_ZAGS: TMemoField;
    tbRastSUDNAME: TMemoField;
    tbRastSUDRESH: TDateField;
    tbRastSUDSILA: TDateField;
    tbRastTYPE_RAST: TIntegerField;
    DokumentNOMER: TStringField;
    DokumentDOLG_RUKOV: TStringField;
    lbRukov: TvchDBText;
    lb16: TLabel;
    N_F_cbBelorus: TDBCheckBoxEh;
    lbBel: TLabel;
    DokumentDOLG_RUKOV_B: TStringField;
    DokumentRUKOV_B: TStringField;
    lbRukov_B: TvchDBText;
    edRukov_B: TDBEditEh;
    DokumentIDENTIF: TStringField;
    Label10: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    tbRastB_NOMER: TStringField;
    tbRastS_NOMER: TStringField;
    tbRastR_NOMER: TStringField;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure cbOnlyGodChange(Sender: TObject);
    procedure cbOnlyGodRChange(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure pcRastChange(Sender: TObject);
    procedure N_F_cbBrakClick(Sender: TObject);
    procedure edLicoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsRastDataChange(Sender: TObject; Field: TField);
    procedure edRukovEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure TBItemGetDataGISUNClick(Sender: TObject);
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
    procedure CheckLANG(nLang: Integer; lCheckValueField:Boolean); override;
    procedure CheckMRUList(lBel:Boolean);

  end;

  function EditZAGS_SprOtsut(nID : Integer) : Boolean;


implementation

uses dBase, fMain, fChoiceNasel, fShablon, fEnterDokument, uProject, fGetGISUN1;

{$R *.DFM}

var
  fmZAGS_SprOtsut: TfmZAGS_SprOtsut;

function EditZAGS_SprOtsut(nID : Integer) : Boolean;
begin
//  result := true;
  fmZAGS_SprOtsut := TfmZAGS_SprOtsut.Create(nil);

  try
    with fmZAGS_SprOtsut do begin
      IsReadDokument:=true;
      TBItemZAGS.Visible:=false;
      TBToolbarOrgan.Visible:=false;
      if nID=-1 then begin
        NewDok(true);
        SetIDZags;
        //CheckEnabledNameOrgan(true);
      end else begin
        ReadDok( nID );
        CheckEnabledNameOrgan(false);
      end;
      IsReadDokument:=false;
      QueryExit:=false;
      Result:=EditModal;
    end;
  finally
    fmZAGS_SprOtsut.Free;
    fmZAGS_SprOtsut := nil;
  end;
end;

{ TfmZAGS_SprOtsut }

constructor TfmZAGS_SprOtsut.Create(Owner: TComponent);
var
  n:Integer;
begin
  inherited;
  if not tbRast.Active
    then tbRast.Active:=true;
 // FDokZAGS := true;

//  FCheckKeyboard:=false;  //!!!
  SetcbBel(N_F_cbBelorus, lbBel);

  TypeObj := dmBase.TypeObj_ZAGS_SprOtsut;

  CheckMRUList(false);

//  n:=LimitMRUList(4);
//  SetMRUList(edGT_RNGOROD,n,4,true,false,false,FAddButtonMRUList_Punkt);

  SetLength(FArrChoiceRekv,4);
//  FArrChoiceRekv[0].nType:=SHABLON_ADRESAT;
//  FArrChoiceRekv[0].FieldName:='ADRESAT';

  FArrChoiceRekv[0].nType:=0;
  FArrChoiceRekv[0].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[0].FieldName:='R_ZAGS';
  FArrChoiceRekv[0].sPadeg:='П';

  FArrChoiceRekv[1].nType:=0;
  FArrChoiceRekv[1].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[1].FieldName:='S_ZAGS';
  FArrChoiceRekv[1].sPadeg:='П';

  FArrChoiceRekv[2].nType:=0;
  FArrChoiceRekv[2].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[2].FieldName:='B_ZAGS';
  FArrChoiceRekv[2].sPadeg:='Р';

  FArrChoiceRekv[3].nType:=SHABLON_SUD;
  FArrChoiceRekv[3].FieldName:='SUDNAME';

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
//  pc.ActivePageIndex:=0;
  FPageControl := nil;
  FCheckPol:=true;

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
  edRG_GOROD.OnUpdateData:=CityUpdate;
  edGT_GOROD.OnUpdateData:=CityUpdate;

{
  SetLength(FArrCheckField,5);
  WriteToArrCheck(0,  1, false, 'GT_OBL'    );
  WriteToArrCheck(1,  2, false, 'GT_RAION'  );
  WriteToArrCheck(2,  1, false, 'RG_OBL'    );
  WriteToArrCheck(3,  2, false, 'RG_RAION'  );
  WriteToArrCheck(4,  3, false, 'GT_RNGOROD');
}
  //SetPanelPovtor(tsPovtor, cbPovtor, Label41, Label42);
  {$IFDEF GISUN}
    CheckMenuGISUN('ZAPROS');
    AfterCreateFormGISUN;
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}

  AddButton_LoadIdentif(ENG_edIDENTIF);
  ENG_edIdentif.OnUpdateData:=IN_UpdateData;

end;

destructor TfmZAGS_SprOtsut.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZAGS_SprOtsut.CheckMRUList(lBel:Boolean);
var
  n:Integer;
begin
  n:=LimitMRUList(1);
  SetMRUList(edRG_OBL,n,1,true,false,lBel,FAddButtonMRUList);
  SetMRUList(edGT_OBL,n,1,true,false,lBel,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRG_RN,n,2,true,false,lBel,FAddButtonMRUList);
  SetMRUList(edGT_RN,n,2,true,false,lBel,FAddButtonMRUList);

  n:=LimitMRUList(3);
  SetMRUList(edRG_GOROD,n,3,true,false,lBel,FAddButtonMRUList_Punkt);
  SetMRUList(edGT_GOROD,n,3,true,false,lBel,FAddButtonMRUList_Punkt);
end;

procedure TfmZAGS_SprOtsut.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmZAGS_SprOtsut.GetVid: String;
begin
  Result := 'ZAGS_SprOtsut';
end;

function TfmZAGS_SprOtsut.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentLang.AsInteger:=0;

//  DokumentPOVTOR.AsBoolean:=false;
//  DokumentCOPIA.AsBoolean:=false;

  DokumentRG_B_RESP.AsBoolean:=true;
  DokumentRG_B_OBL.AsBoolean:=true;
  DokumentGT_B_RESP.AsBoolean:=true;
  DokumentGT_B_OBL.AsBoolean:=true;
  DokumentRG_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentGT_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');

//  cbBelorus.Checked:=false;
//  if lAppend then begin
//    CheckRnGorod;
//  end;
  tbRast.EmptyTable;
  tbRast.Append;
  tbRastTYPE_RAST.AsInteger:=0;
  tbRast.Post;
  inherited NewDok(lAppend);

  QueryExit:=false;
  Result := true;
  N_F_cbBrakClick(nil);
end;

function TfmZAGS_SprOtsut.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField,sFam,sName : String;
begin
  Result := true;
  if not dmBase.AddDokZAGS.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
//  NewDok(false);

  //------- читаем карточку -----------
  Dokument.EmptyTable;
  tbRast.EmptyTable;
  LoadMemTableFromStr(dmBase.AddDokZAGS.FieldByName('VALUE').AsString,
                      ['DOKUMENT', Dokument,'RAST', tbRast],dmBase.AddDokZAGS.FieldByName('FIELD_DELIMITER').AsString,nil);

  Dokument.First;
  Dokument.Edit;
  sFam:=DokumentFamilia.AsString;
  sName:=DokumentName.AsString;
  for i:=0 to dmBase.AddDokZAGS.FieldCount-1 do begin
    strField := dmBase.AddDokZAGS.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.AddDokZAGS.Fields[i]);
    end;
  end;
  if sFam<>''  then DokumentFamilia.AsString:=sFam;
  if sName<>'' then DokumentName.AsString:=sName;

  tbRast.First;
  if tbRast.RecordCount>0 then begin
    try
      pcRast.ActivePageIndex:=tbRastTYPE_RAST.AsInteger-1;
    except
    end;
    N_F_cbBrak.Checked:=true;
  end else begin
    tbRast.Append;
    tbRastTYPE_RAST.AsInteger:=0;
    tbRast.Post;
    pcRast.ActivePageIndex:=1;
    N_F_cbBrak.Checked:=false;
  end;
//  N_F_cbBrakClick(nil);
  if DokumentLANG.isNull then DokumentLANG.AsInteger:=0;
  SetIDZags;

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

  N_F_cbBelorus.Checked:=(DokumentLANG.AsInteger=1);
  if DokumentLANG.AsInteger=1
    then CheckLANG(1,false);
  N_F_cbBelorus.Enabled:=FAddNewDok;
end;

//------------------------------------------------------------------------
procedure TfmZAGS_SprOtsut.WriteSoato(fld:TField);
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
function TfmZAGS_SprOtsut.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr, strRazd : String;
  vKeyValues : Variant;
  st:TStringStream;
begin
  AdditiveBeforeWriteDok;
  PostDataSet(Dokument);
  PostDataSet(tbRast);
  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
  if DokumentDATEZ.IsNull then begin
    strErr := ' Заполните дату. ';
  end else if DokumentNOMER.AsString='' then begin
    strErr := ' Заполните номер. ';
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства о смерти. ';
  end else if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then begin
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
    Dokument.Post;

    dmBase.AddDokZAGS.Edit;

    SaveDef:=false;
    if N_F_cbBrak.Checked then begin
      tbRast.First;
      tbRast.Edit;
      tbRastTYPE_RAST.AsInteger:=pcRast.ActivePageIndex+1;
      if pcRast.ActivePageIndex=0 then begin           // смерть
        tbRastSUDNAME.AsString:='';
        tbRastSUDRESH.AsString:='';
        tbRastSUDSILA.AsString:='';

        tbRastR_NOMER.AsString:='';
        tbRastR_DATE.AsString:='';
        tbRastR_ZAGS.AsString:='';
      end else if pcRast.ActivePageIndex=1 then begin  // решение суда
        tbRastS_NOMER.AsString:='';
        tbRastS_DATE.AsString:='';
        tbRastS_ZAGS.AsString:='';

        tbRastR_NOMER.AsString:='';
        tbRastR_DATE.AsString:='';
        tbRastR_ZAGS.AsString:='';
      end else if pcRast.ActivePageIndex=2 then begin  // актовая запись
        tbRastS_NOMER.AsString:='';
        tbRastS_DATE.AsString:='';
        tbRastS_ZAGS.AsString:='';

        tbRastSUDNAME.AsString:='';
        tbRastSUDRESH.AsString:='';
        tbRastSUDSILA.AsString:='';
      end;
      tbRast.Post;
    end else begin
      tbRast.EmptyTable;
    end;

    dmBase.AddDokZAGS.FieldByName('VALUE').AsString:=SaveMemTableToStr(['DOKUMENT', Dokument, 'RAST', tbRast], strRazd, nil);
    dmBase.AddDokZAGS.FieldByName('FIELD_DELIMITER').AsString:=strRazd;

    for i:=1 to dmBase.AddDokZAGS.FieldCount-1 do begin
      strField := dmBase.AddDokZAGS.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.AddDokZAGS.Fields[i].Value := fld.Value;
      end;
    end;

    dmBase.AddDokZAGS.FieldByName('TYPEDOK').AsInteger:=TypeObj;
    dmBase.AddDokZAGS.Post;

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

procedure TfmZAGS_SprOtsut.UpdateActions;
begin
  inherited;
end;

procedure TfmZAGS_SprOtsut.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol : TPol;
  lCheck : Boolean;
  SOATO:TSoato;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    strField:=ANSIUpperCase(Field.FieldName);
    if strField = 'FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentMEN_ID.AsString:='';
      end;
    end;
  end;
end;

function TfmZAGS_SprOtsut.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
end;

procedure TfmZAGS_SprOtsut.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZAGS_SprOtsut.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmZAGS_SprOtsut.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZAGS_SprOtsut.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZAGS_SprOtsut.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZAGS_SprOtsut.CheckOnlyGod;
begin
end;

procedure TfmZAGS_SprOtsut.CheckOnlyGodR;
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

procedure TfmZAGS_SprOtsut.edGT_RNGORODNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZAGS_SprOtsut.CheckRnGorod;
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

procedure TfmZAGS_SprOtsut.cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZAGS_SprOtsut.cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR;
end;

procedure TfmZAGS_SprOtsut.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
//  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmZAGS_SprOtsut.CreateSubMenuRun: Boolean;
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

procedure TfmZAGS_SprOtsut.pcRastChange(Sender: TObject);
begin
  EditDataSet(tbRast);
  tbRastTYPE_RAST.AsInteger:=pcRast.ActivePageIndex+1;
end;

procedure TfmZAGS_SprOtsut.N_F_cbBrakClick(Sender: TObject);
var
  l:Boolean;
begin
  PostDataSet(tbRast);
  EditDataSet(tbRast);
  if N_F_cbBrak.Checked then begin
    l:=true;
    tbRastTYPE_RAST.AsInteger:=pcRast.ActivePageIndex+1;
  end else begin
    l:=false;
    tbRastTYPE_RAST.AsInteger:=0;
  end;
  pcRast.Enabled:=l;
  edLico.Enabled:=l;
  edSUPRUG.Enabled:=l;
  edS_NOMER.Enabled:=l;
  edS_DATE.Enabled:=l;
  edS_ZAGS.Enabled:=l;
  edB_NOMER.Enabled:=l;
  edB_DATE.Enabled:=l;
  edB_ZAGS.Enabled:=l;
  edR_NOMER.Enabled:=l;
  edR_DATE.Enabled:=l;
  edR_ZAGS.Enabled:=l;
  edSudName.Enabled:=l;
  edSudResh.Enabled:=l;
  edSudSila.Enabled:=l;
//  lb1.Enabled:=l;
  lb2.Enabled:=l;
  lb3.Enabled:=l;
  lb4.Enabled:=l;
  lb5.Enabled:=l;
//  lb6.Enabled:=l;
  lb7.Enabled:=l;
  lb8.Enabled:=l;
  lb9.Enabled:=l;
  lb10.Enabled:=l;
  lb11.Enabled:=l;
  lb12.Enabled:=l;
  lb13.Enabled:=l;
  lb14.Enabled:=l;
  lb15.Enabled:=l;
  lb16.Enabled:=l;
end;

procedure TfmZAGS_SprOtsut.edLicoEnter(Sender: TObject);
begin
  if edLico.text=''
    then edLico.text:=edFamilia.Text+' '+edName.Text+' '+edOtch.Text;
end;

procedure TfmZAGS_SprOtsut.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbRast,'Rast','БракПрекращен');
  {$ENDIF}
end;

procedure TfmZAGS_SprOtsut.dsRastDataChange(Sender: TObject; Field: TField);
begin
  if Field<>nil then begin
    QueryExit:=true;
  end;
end;

procedure TfmZAGS_SprOtsut.PostDokument;
begin
  inherited;
  tbRast.CheckBrowseMode;
end;

procedure TfmZAGS_SprOtsut.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
//  ChoiceSpecD(edRukov,N_F_cbBelorus.Checked);
  ChoiceSpecD(edRukov,false);
end;

procedure TfmZAGS_SprOtsut.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CheckLang(1,true) else CheckLang(0,true);
end;

procedure TfmZAGS_SprOtsut.CheckLANG(nLang: Integer; lCheckValueField:Boolean);
var
  Opis:TOpisEdit;
  i,n:Integer;
  l:Boolean;
  s,ss:String;
begin
  inherited CheckLang(nLang, false);
  if nLang=1 then begin
    s:='_B';
    ss:='';
    l:=true;
    edGRAG.ListField:='FNAME_B';
    FArrChoiceRekv[0].nTypeSpr:=_SHABLON_ZAGS+100;
    FArrChoiceRekv[1].nTypeSpr:=_SHABLON_ZAGS+100;
    FArrChoiceRekv[2].nTypeSpr:=_SHABLON_ZAGS+100;
  end else begin
    s:='';
    ss:='B';
    l:=false;
    edGRAG.ListField:='GNAME';
    FArrChoiceRekv[0].nTypeSpr:=_SHABLON_ZAGS;
    FArrChoiceRekv[1].nTypeSpr:=_SHABLON_ZAGS;
    FArrChoiceRekv[2].nTypeSpr:=_SHABLON_ZAGS;
  end;
  edRG_GOSUD.ListField:='NAME'+s;
  edRG_B_GOROD.ListField:='NAME'+s;
  edGT_GOSUD.ListField:='NAME'+s;
  edGT_B_GOROD.ListField:='NAME'+s;

  edRG_OBL.MRUList.Active:=l;
  edGT_OBL.MRUList.Active:=l;
  edRG_RN.MRUList.Active:=l;
  edGT_RN.MRUList.Active:=l;
  edRG_GOROD.MRUList.Active:=l;
  edGT_GOROD.MRUList.Active:=l;
  if lCheckValueField then begin
    edRG_OBL.Text:=dmBase.GetLangNazv(1,false,edRG_OBL.Text,ss,true);
    edGT_OBL.Text:=dmBase.GetLangNazv(1,false,edGT_OBL.Text,ss,true);
    edRG_RN.Text:=dmBase.GetLangNazv(2,false,edRG_RN.Text,ss,true);
    edGT_RN.Text:=dmBase.GetLangNazv(2,false,edGT_RN.Text,ss,true);
    edRG_GOROD.Text:=dmBase.GetLangNazv(3,false,edRG_GOROD.Text,ss,true);
    edGT_GOROD.Text:=dmBase.GetLangNazv(3,false,edGT_GOROD.Text,ss,true);
  end;
  CheckMRUList(l);
  lbRukov_B.Visible:=l;
  edRukov_B.Visible:=l;
//  showmessage(inttostr(pnPodp.Top+edRukov_B.Top+edRukov_B.Height+5)+'   '+inttostr(self.ClientHeight));
end;

procedure TfmZAGS_SprOtsut.TBItemGetDataGISUNClick(Sender: TObject);
var
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
      if DokumentIDENTIF.AsString<>'' then begin
        sl.Add('ON='+DokumentIDENTIF.AsString);
      end;
      ds:=Gisun.LoadIdentifData(sl,nil,nil);
      if ds<>nil then begin
        ds.First;
//        Gisun.LoadPersonalData(edON_IDENTIF.Text, arr);
        FRun:=true;
        EditDataSet(Dokument);
        try
        while not ds.Eof do begin
          if ds.FieldByName('IDENTIF').AsString=DokumentIDENTIF.AsString then begin
            try
              WriteField(DokumentDATER,ds.FieldByName('DATER'));
            except
            end;
            DokumentGRAG.AsString:=ds.FieldByName('GRAG').AsString;
            DokumentPOL.AsString:=ds.FieldByName('POL').AsString;

            DokumentGT_GOSUD.AsString:=ds.FieldByName('GOSUD_G').AsString;
            DokumentGT_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_G').AsString;

            DokumentRG_GOSUD.AsString:=ds.FieldByName('GOSUD_R').AsString;
            DokumentRG_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_R').AsString;
            DokumentRG_B_OBL.AsString:=ds.FieldByName('B_OBL_R').AsString; // !!!
            DokumentGT_GOROD_R.AsString:='';
            {
            DokumentDOK_TYPE.AsString:=ds.FieldByName('DOK_TYPE').AsString;
            WriteField(DokumentDOK_DATE,ds.FieldByName('DOK_DATE'));
            DokumentDOK_SERIA.AsString:=ds.FieldByName('DOK_SERIA').AsString;
            DokumentDOK_NOMER.AsString:=ds.FieldByName('DOK_NOMER').AsString;
            DokumentDOKUMENT.AsString:=ds.FieldByName('DOKUMENT').AsString;  }
            if N_F_cbBelorus.Checked then begin
              DokumentFamilia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA_B').AsString);
              DokumentNAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME_B').AsString);
              DokumentOTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH_B').AsString);

              DokumentGT_OBL.AsString:=ds.FieldByName('OBL_B_G').AsString;
              DokumentGT_RAION.AsString:=ds.FieldByName('RAION_B_G').AsString;
              DokumentGT_GOROD.AsString:=ds.FieldByName('GOROD_B_G').AsString;
              DokumentGT_GOROD_R.AsString:=ds.FieldByName('GOROD_R_B_G').AsString; //GetGorodR(OutPut);

              DokumentRG_OBL.AsString:=ds.FieldByName('OBL_B_R').AsString;
              DokumentRG_RAION.AsString:=ds.FieldByName('RAION_B_R').AsString;
              DokumentRG_GOROD.AsString:=ds.FieldByName('GOROD_B_R').AsString;
            end else begin
              DokumentFamilia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
              DokumentNAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
              DokumentOTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);

              DokumentGT_OBL.AsString:=ds.FieldByName('OBL_G').AsString;
              DokumentGT_RAION.AsString:=ds.FieldByName('RAION_G').AsString;
              DokumentGT_GOROD.AsString:=ds.FieldByName('GOROD_G').AsString;
              DokumentGT_GOROD_R.AsString:=ds.FieldByName('GOROD_R_G').AsString; //GetGorodR(OutPut);

              DokumentRG_OBL.AsString:=ds.FieldByName('OBL_R').AsString;
              DokumentRG_RAION.AsString:=ds.FieldByName('RAION_R').AsString;
              DokumentRG_GOROD.AsString:=ds.FieldByName('GOROD_R').AsString;
            end;
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
