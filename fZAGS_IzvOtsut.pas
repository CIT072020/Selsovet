unit fZAGS_IzvOtsut;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uSaveMemtable,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc,uTypes,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat;

type
  TfmZAGS_IzvOtsut = class(TfmSimpleD)
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
    DokumentRUKOV: TStringField;
    dsStran: TDataSource;
    dsNation: TDataSource;
    DokumentID_ZAGS: TIntegerField;
    dsGragd: TDataSource;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    ImageGISUN: TImage;
    ApplicationEvents1: TApplicationEvents;
    pnMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    edRukov: TDBEditEh;
    Label4: TLabel;
    edAdresat: TDBEditEh;
    DokumentADRESAT: TMemoField;
    Label9: TLabel;
    edTypeAkt: TDBComboBoxEh;
    Label10: TLabel;
    Label11: TLabel;
    edArxivFond: TDBEditEh;
    Label6: TLabel;
    DokumentARX_FOND: TStringField;
    DokumentTYPEAKT: TIntegerField;
    DokumentDATE1: TStringField;
    DokumentDATE2: TStringField;
    edDate1: TDBEditEh;
    edDate2: TDBEditEh;
    Label5: TLabel;
    edPol: TDBComboBoxEh;
    DokumentNOMER: TStringField;
    DokumentDOLG_RUKOV: TStringField;
    lbRukov: TvchDBText;
    N_F_cbBelorus: TDBCheckBoxEh;
    lbBel: TLabel;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure cbOnlyGodChange(Sender: TObject);
    procedure cbOnlyGodRChange(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure N_F_cbBelorusClick(Sender: TObject);
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

    procedure CheckLANG(nLang: Integer; lCheckValueField:Boolean); override;

  end;

  function EditZAGS_IzvOtsut(nID : Integer) : Boolean;


implementation

uses dBase, fMain, fChoiceNasel, fShablon, fEnterDokument, uProject;

{$R *.DFM}

var
  fmZAGS_IzvOtsut: TfmZAGS_IzvOtsut;

function EditZAGS_IzvOtsut(nID : Integer) : Boolean;
begin
//  result := true;
  fmZAGS_IzvOtsut := TfmZAGS_IzvOtsut.Create(nil);
  try
    with fmZags_IzvOtsut do begin
      IsReadDokument:=true;
      TBItemZAGS.Visible:=false;
      TBToolbarOrgan.Visible:=false;
      if nID=-1 then begin
        NewDok(true);
        SetIDZags;
//        CheckEnabledNameOrgan(true);
      end else begin
        ReadDok( nID );
//        CheckEnabledNameOrgan(false);
      end;
      IsReadDokument:=false;
      QueryExit:=false;
      Result:=EditModal;
    end;
  finally
    FreeAndNil(fmZAGS_IzvOtsut);
  end;
end;

{ TfmZAGS_IzvOtsut }

constructor TfmZAGS_IzvOtsut.Create(Owner: TComponent);
var
  Opis:TOpisEdit;
  i:Integer;
begin
  inherited;
 // FDokZAGS := true;
  FCheckKeyboard:=false;  //!!!
  SetcbBel(N_F_cbBelorus, lbBel);

  TypeObj := dmBase.TypeObj_ZAGS_IzvOtsut;

  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL');
  if Opis<>nil then begin
    for i:=0 to Opis.Items.Count-1 do begin
      edTypeAkt.Items.Add(Opis.Items[i]);
      edTypeAkt.KeyItems.Add(Opis.KeyList[i]);
    end;
  end;
//  SetLength(FArrChoiceRekv,1);
//  FArrChoiceRekv[0].nType:=SHABLON_ADRESAT;
//  FArrChoiceRekv[0].FieldName:='ADRESAT';

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
  ImageGISUN.Visible := false;
end;

destructor TfmZAGS_IzvOtsut.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZAGS_IzvOtsut.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmZAGS_IzvOtsut.GetVid: String;
begin
  Result := 'ZAGS_IzvOtsut';
end;

function TfmZAGS_IzvOtsut.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentLang.AsInteger:=0;

//  DokumentPOVTOR.AsBoolean:=false;
//  DokumentCOPIA.AsBoolean:=false;


//  cbBelorus.Checked:=false;
//  if lAppend then begin
//    CheckRnGorod;
//  end;
  inherited NewDok(lAppend);

  QueryExit:=false;
  Result := true;
end;

function TfmZAGS_IzvOtsut.ReadDok(nID: Integer): Boolean;
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
  Dokument.EmptyTable;
  LoadMemTableFromStr(dmBase.AddDokZAGS.FieldByName('VALUE').AsString,
                      ['DOKUMENT', Dokument],dmBase.AddDokZAGS.FieldByName('FIELD_DELIMITER').AsString, nil);
  Dokument.First;
  Dokument.Edit;
  for i:=0 to dmBase.AddDokZAGS.FieldCount-1 do begin
    strField := dmBase.AddDokZAGS.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.AddDokZAGS.Fields[i]);
    end;
  end;
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
procedure TfmZAGS_IzvOtsut.WriteSoato(fld:TField);
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
function TfmZAGS_IzvOtsut.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr, strRazd : String;
begin
  AdditiveBeforeWriteDok;
  PostDataSet(Dokument);
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
    dmBase.AddDokZAGS.FieldByName('VALUE').AsString:=SaveMemTableToStr(['DOKUMENT', Dokument], strRazd, nil);
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

procedure TfmZAGS_IzvOtsut.UpdateActions;
begin
  inherited;
end;

procedure TfmZAGS_IzvOtsut.dsDokumentDataChange(Sender: TObject;
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

function TfmZAGS_IzvOtsut.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
end;

procedure TfmZAGS_IzvOtsut.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZAGS_IzvOtsut.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmZAGS_IzvOtsut.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZAGS_IzvOtsut.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZAGS_IzvOtsut.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZAGS_IzvOtsut.CheckOnlyGod;
begin
end;

procedure TfmZAGS_IzvOtsut.CheckOnlyGodR;
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

procedure TfmZAGS_IzvOtsut.edGT_RNGORODNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZAGS_IzvOtsut.CheckRnGorod;
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

procedure TfmZAGS_IzvOtsut.cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZAGS_IzvOtsut.cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR;
end;

procedure TfmZAGS_IzvOtsut.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmZAGS_IzvOtsut.CreateSubMenuRun: Boolean;
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

procedure TfmZAGS_IzvOtsut.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov,N_F_cbBelorus.Checked);
end;

procedure TfmZAGS_IzvOtsut.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CheckLang(1,true) else CheckLang(0,true);
end;

procedure TfmZAGS_IzvOtsut.CheckLANG(nLang: Integer; lCheckValueField:Boolean);
var
  Opis:TOpisEdit;
  i,n:Integer;
  l:Boolean;
  s:String;
begin
  inherited CheckLang(nLang, lCheckValueField);
  if nLang=1 then begin
    s:='_B';
  end else begin
    s:='';
  end;
  n:=edTypeAkt.ItemIndex;
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL'+s);
  if Opis<>nil then for i:=0 to Opis.Items.Count-1 do edTypeAkt.Items[i]:=Opis.Items[i];
  edTypeAkt.ItemIndex:=n;
end;


end.
