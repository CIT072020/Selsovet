unit fZAGS_ZaklIzmAkt;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uSaveMemTable, uDataSet2XML,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat,
  HunSpellDBMemo, ZipForge;

type
  TfmZAGS_ZaklIzmAkt = class(TfmSimpleD)
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentMEN_ID: TIntegerField;
    DokumentLICH_ID: TIntegerField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentPOL: TStringField;
    dsStran: TDataSource;
    dsNation: TDataSource;
    DokumentID_ZAGS: TIntegerField;
    dsGragd: TDataSource;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    ApplicationEvents1: TApplicationEvents;
    DokumentADRESAT: TMemoField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edOtch: TDBEditEh;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    ScrollBox2: TScrollBox;
    DokumentB_NOMER: TStringField;
    DokumentB_DATE: TDateField;
    DokumentB_ZAGS: TMemoField;
    Panel2: TPanel;
    dsDeti: TDataSource;
    tbDeti: TkbmMemTable;
    tbDetiDATER: TDateField;
    tbDetiMESTO: TStringField;
    tbDetiMESTOREG: TStringField;
    tbDetiNOMER: TStringField;
    tbDetiDATEA: TDateField;
    Panel9: TPanel;
    gbROVD: TGroupBox;
    Panel10: TPanel;
    GroupBox2: TGroupBox;
    Panel11: TPanel;
    edRukov: TDBEditEh;
    edDateZ: TDBDateTimeEditEh;
    Panel12: TPanel;
    GroupBox3: TGroupBox;
    DokumentROVD_ZAKL: TMemoField;
    DokumentIZMEN: TMemoField;
    TBItemAktRogd: TTBItem;
    TBItemAktBrak: TTBItem;
    DokumentIS_IZMEN: TBooleanField;
    tbDetiFIO: TStringField;
    DokumentTYPEAKT: TIntegerField;
    cbIzm: TDBCheckBoxEh;
    cbDopoln: TDBCheckBoxEh;
    cbIsprav: TDBCheckBoxEh;
    Label4: TLabel;
    Label5: TLabel;
    edTypeAkt: TDBComboBoxEh;
    Label32: TLabel;
    edB_NOMER: TDBEditEh;
    Label33: TLabel;
    edB_DATE: TDBDateTimeEditEh;
    Label34: TLabel;
    edB_ZAGS: TDBEditEh;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    pnCopy: TPanel;
    Label6: TLabel;
    edCopy1: TDBEditEh;
    edCopy2: TDBEditEh;
    edCopy3: TDBEditEh;
    Label7: TLabel;
    DokumentRUKOV: TStringField;
    DokumentIS_ISPRAV: TBooleanField;
    DokumentIS_DOPOLN: TBooleanField;
    DokumentPROSIT: TMemoField;
    DokumentDOKUMENTS: TMemoField;
    DokumentUSTANOVIL: TMemoField;
    DokumentIS_SKLONEN: TBooleanField;
    DokumentSOOB: TMemoField;
    DokumentCOPY2: TStringField;
    DokumentCOPY1: TStringField;
    DokumentCOPY3: TStringField;
    N_F_cbSklonen: TDBCheckBoxEh;
    DokumentDOLG_RUKOV: TStringField;
    lbRukov: TvchDBText;
    DokumentSPEC: TStringField;
    DokumentDOLG_SPEC: TStringField;
    lbSpec: TvchDBText;
    edSpec: TDBEditEh;
    N_F_DeleteCRLF: TDBCheckBoxEh;
    edROVD_ZAKL: THunSpellDBMemo;
    edSOOB: THunSpellDBMemo;
    edIZMEN: THunSpellDBMemo;
    edPROSIT: THunSpellDBMemo;
    edDOKUMENTS: THunSpellDBMemo;
    edUSTANOVIL: THunSpellDBMemo;
    TBItemDeclIzm: TTBItem;
    DokumentOK: TBooleanField;
    N_F_cbIsIzmen: TDBCheckBoxEh;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure cbOnlyGodChange(Sender: TObject);
    procedure cbOnlyGodRChange(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure btDelChildClick(Sender: TObject);
    procedure btChoiceChildClick(Sender: TObject);
    procedure TBItemAktRogdClick(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edSpecEditButtons0Click(Sender: TObject;       var Handled: Boolean);
    procedure TBItemDeclIzmClick(Sender: TObject);
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
    function AddParEnterAdresat(slPar: TStringList;  strFieldName: String=''): Boolean; override;
  end;

  function EditZAGS_ZaklIzmAkt(nID : Integer) : Boolean;


implementation

uses dBase, fMain, fChoiceNasel, fShablon, fEnterDokument, uProject;

{$R *.DFM}

var
  fmZAGS_ZaklIzmAkt: TfmZAGS_ZaklIzmAkt;

function EditZAGS_ZaklIzmAkt(nID : Integer) : Boolean;
begin
//  result := true;
  fmZAGS_ZaklIzmAkt := TfmZAGS_ZaklIzmAkt.Create(nil);
  try
    with fmZAGS_ZaklIzmAkt do begin
      SetHunSpell(edPROSIT);
      SetHunSpell(edDOKUMENTS);
      SetHunSpell(edUSTANOVIL);
      SetHunSpell(edROVD_ZAKL);
      SetHunSpell(edSOOB);
      SetHunSpell(edIZMEN);

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
//        TBToolbarOrgan.Visible:=false;
      end;
      IsReadDokument:=false;
      QueryExit:=false;
      Result:=EditModal;
    end;
//    fmZAGS_ZaklIzmAkt.ShowModal;
//    Result:=true;
  finally
    fmZAGS_ZaklIzmAkt.Free;
    fmZAGS_ZaklIzmAkt:=nil;
  end;
end;

{ TfmZAGS_ZaklIzmAkt }

constructor TfmZAGS_ZaklIzmAkt.Create(Owner: TComponent);
var
  n,i:Integer;
  Opis:TOpisEdit;
  d2xml:TDataSet2XML;
begin
  inherited;
 // FDokZAGS := true;

  d2xml:=ds2xml.DS_Add(Dokument,true);
  d2xml.FClearRecord:=false;
  d2xml.ExceptFields:='ID;ID_ZAGS;';

  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL');
  if Opis<>nil then begin
    for i:=0 to Opis.Items.Count-1 do begin
      edTypeAkt.Items.Add(Opis.Items[i]);
      edTypeAkt.KeyItems.Add(Opis.KeyList[i]);
    end;
  end;

  FCheckLookupField:=false;
//  dmBase.SetDateFormat(tbDeti);
//  if not tbDeti.Active then tbDeti.Active:=true;
  if not Dokument.Active then Dokument.Active:=true;

  TypeObj := dmBase.TypeObj_ZAGS_ZaklIzmAkt;

// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(1);
{
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
}

  SetLength(FArrChoiceRekv,6);
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
  FArrChoiceRekv[4].FieldName:='PROSIT';
  FArrChoiceRekv[4].TypeEdit:=emShablon;

  FArrChoiceRekv[5].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[5].FieldName:='IZMEN';
  FArrChoiceRekv[5].TypeEdit:=emShablon;

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

//  edRFamilia.OnUpdateData:=FIOUpdateData;
//  edRName.OnUpdateData:=FIOUpdateData;
//  edROtch.OnUpdateData:=FIOUpdateData;

//  edRG_GOROD.OnUpdateData:=CityUpdate;
//  edGT_GOROD.OnUpdateData:=CityUpdate;

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

destructor TfmZAGS_ZaklIzmAkt.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZAGS_ZaklIzmAkt.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmZAGS_ZaklIzmAkt.GetVid: String;
begin
  Result := 'ZAGS_ZaklIzmAkt';
end;

function TfmZAGS_ZaklIzmAkt.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
//  DokumentPOVTOR.AsBoolean:=false;
  DokumentOk.AsBoolean:=false;

//  cbBelorus.Checked:=false;
//  if lAppend then begin
//    CheckRnGorod;
//  end;

  DokumentSPEC.AsString:=GlobalTask.GetLastValueAsString( 'ZAKLIZMAKT_SPEC');
  if DokumentSPEC.AsString<>''
    then DokumentDOLG_SPEC.AsString:=GlobalTask.GetLastValueAsString('ZAKLIZMAKT_SPEC_DOLG');

  inherited NewDok(lAppend);

  QueryExit:=false;
  Result := true;
end;

function TfmZAGS_ZaklIzmAkt.ReadDok(nID: Integer): Boolean;
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
                       
    ds2xml.StringToXML(dmBase.AddDokZAGS.FieldByName('VALUE').AsString);
    ds2xml.XMLToData;

  end else begin

    Dokument.EmptyTable;
    LoadMemTableFromStr(dmBase.AddDokZAGS.FieldByName('VALUE').AsString,
                        ['DOKUMENT', Dokument],dmBase.AddDokZAGS.FieldByName('FIELD_DELIMITER').AsString,nil);
  end;


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

end;

//------------------------------------------------------------------------
procedure TfmZAGS_ZaklIzmAkt.WriteSoato(fld:TField);
//var
//  SOATO:TSOATO;
begin
//  SOATO:=dmBase.GetSoatoAkt(Dokument,
//        'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD',true,7);
//  if (SOATO.Kod='9000000') and (DokumentGT_GOSUD.IsNull or (DokumentGT_GOSUD.AsInteger=MY_GRAG)) then begin
//    SOATO:=dmBase.GetSoatoAkt(Dokument,
//          'SM_GOSUD,FName;SM_OBL;SM_RAION;SM_GOROD,SM_B_GOROD',true,7);
//
//  end;
//  fld.AsString:=SOATO.Kod;
end;
//------------------------------------------------------------------------
function TfmZAGS_ZaklIzmAkt.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr, strRazd : String;
begin
  AdditiveBeforeWriteDok;
  PostDataSet(Dokument);
//  PostDataSet(tbDeti);
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
      dmBase.AddDokZAGS.FieldByName('VALUE').AsString:=SaveMemTableToStr(['DOKUMENT', dokument], strRazd, nil);
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

    dmBase.AddDokZAGS.FieldByName('TYPEDOK').AsInteger:=TypeObj;
    dmBase.AddDokZAGS.Post;
//    dmBase.AddDokZAGS.AdsFlushFileBuffers;
//    WriteDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger,
//                   STOD('1899-12-30',tdAds));

    if FAddNewDok then begin
      GlobalTask.SetLastValueAsString('ZAKLIZMAKT_SPEC',DokumentSPEC.AsString);
      if DokumentSPEC.AsString=''
        then GlobalTask.SetLastValueAsString('ZAKLIZMAKT_SPEC_DOLG','')
        else GlobalTask.SetLastValueAsString('ZAKLIZMAKT_SPEC_DOLG',DokumentDOLG_SPEC.AsString);
    end;

    AdditiveWriteDok;
//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);
    QueryExit:=false;
    Result := true;
    if Result then QueryExit:=false;
  end;
end;

procedure TfmZAGS_ZaklIzmAkt.UpdateActions;
begin
  inherited;
end;

procedure TfmZAGS_ZaklIzmAkt.dsDokumentDataChange(Sender: TObject;  Field: TField);
var
  strField : String;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
//    strField:=ANSIUpperCase(Field.FieldName);
  end;
end;

function TfmZAGS_ZaklIzmAkt.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
end;

procedure TfmZAGS_ZaklIzmAkt.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZAGS_ZaklIzmAkt.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmZAGS_ZaklIzmAkt.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZAGS_ZaklIzmAkt.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZAGS_ZaklIzmAkt.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZAGS_ZaklIzmAkt.CheckOnlyGod;
begin
end;

procedure TfmZAGS_ZaklIzmAkt.CheckOnlyGodR;
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

procedure TfmZAGS_ZaklIzmAkt.edGT_RNGORODNotInList(Sender: TObject;  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZAGS_ZaklIzmAkt.CheckRnGorod;
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

procedure TfmZAGS_ZaklIzmAkt.cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZAGS_ZaklIzmAkt.cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR;
end;

procedure TfmZAGS_ZaklIzmAkt.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;
              
function TfmZAGS_ZaklIzmAkt.CreateSubMenuRun: Boolean;
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

procedure TfmZAGS_ZaklIzmAkt.btDelChildClick(Sender: TObject);
begin
end;

//--------------------------------------------------------------------------
// выбор актовой записи о рождении ребенка
procedure TfmZAGS_ZaklIzmAkt.btChoiceChildClick(Sender: TObject);
begin
end;
//--------------------------------------------------------------------------
procedure TfmZAGS_ZaklIzmAkt.TBItemDeclIzmClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ParamFlt:TParamFieldFlt;
  s:String;
begin
  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_DECL_IZM');
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
      EditDataSet(Dokument);
      DokumentFamilia.AsString:=GetValueFieldEx(arrRec,'FAMILIA','');
      DokumentName.AsString:=GetValueFieldEx(arrRec,'NAME','');
      DokumentOtch.AsString:=GetValueFieldEx(arrRec,'OTCH','');
      DokumentTYPEAKT.AsString:=GetValueFieldEx(arrRec,'TYPEAKT','');
      DokumentB_NOMER.AsString:=GetValueFieldEx(arrRec,'REG_NOMER','');
      WriteDateFieldV(DokumentB_DATE, GetValueFieldEx(arrRec,'REG_DATE',null));
      DokumentB_ZAGS.AsString:=GetValueFieldEx(arrRec,'REG_ZAGS','');
      DokumentIS_IZMEN.AsBoolean:=GetValueFieldEx(arrRec,'IS_IZMEN',false);
      DokumentIS_DOPOLN.AsBoolean:=GetValueFieldEx(arrRec,'IS_DOPOLN',false);
      DokumentIS_ISPRAV.AsBoolean:=GetValueFieldEx(arrRec,'IS_ISPRAV',false);
      DokumentPROSIT.AsString:=GetValueFieldEx(arrRec,'NEWVALUES','');
      DokumentDOKUMENTS.AsString:=GetValueFieldEx(arrRec,'ADD_DOK','');

      PostDataSet(Dokument);
      QueryExit:=true;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
end;
//--------------------------------------------------------------------------
procedure TfmZAGS_ZaklIzmAkt.TBItemAktRogdClick(Sender: TObject);
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
      EditDataSet(Dokument);
      PostDataSet(Dokument);
      QueryExit:=true;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
//  Opis.DataSet.Filter   := '';
//  Opis.DataSet.Filtered := false;
end;

procedure TfmZAGS_ZaklIzmAkt.PostDokument;
begin
  inherited;
//  PostDataSet(tbDeti);
end;

procedure TfmZAGS_ZaklIzmAkt.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;

procedure TfmZAGS_ZaklIzmAkt.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

procedure TfmZAGS_ZaklIzmAkt.FormCreate(Sender: TObject);
begin
  inherited;
  TBItemAdresat.Visible:=false;
end;

function TfmZAGS_ZaklIzmAkt.AddParEnterAdresat(slPar: TStringList;  strFieldName: String): Boolean;
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


end.
