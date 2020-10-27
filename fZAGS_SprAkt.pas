unit fZAGS_SprAkt;

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
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat,
  ZipForge;

type
  TfmZAGS_SprAkt = class(TfmSimpleD)
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
    Label4: TLabel;
    edAdresat: TDBEditEh;
    DokumentADRESAT: TMemoField;
    gbIzm: TGroupBox;
    edIzm: TDBMemo;
    pnZag: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    Label9: TLabel;
    edTypeAkt: TDBComboBoxEh;
    Label10: TLabel;
    edNomerAkt: TDBEditEh;
    Label11: TLabel;
    edDateAkt: TDBDateTimeEditEh;
    Label12: TLabel;
    edZAGS2: TDBEditEh;
    Label13: TLabel;
    gbSved: TGroupBox;
    edSved: TDBMemo;
    pnIzm: TPanel;
    DokumentVN_SVED: TMemoField;
    DokumentVN_IZM: TMemoField;
    DokumentIS_VN_IZM: TIntegerField;
    edIsVnIzm: TDBRadioGroup;
    pnRukov: TPanel;
    edRukov: TDBEditEh;
    Label5: TLabel;
    edPol: TDBComboBoxEh;
    DokumentDATE_AKT: TDateField;
    DokumentNOMER_AKT: TIntegerField;
    DokumentTYPEAKT: TIntegerField;
    DokumentNOMER: TStringField;
    lbRukov: TvchDBText;
    DokumentDOLG_RUKOV: TStringField;
    lbBel: TLabel;
    N_F_cbBelorus: TDBCheckBoxEh;
    TBItem1: TTBItem;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure cbOnlyGodChange(Sender: TObject);
    procedure cbOnlyGodRChange(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edIsVnIzmChange(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edTypeAktEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
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
    procedure LoadSource(nTypeAkt:Integer; nID:Integer; arrRec:TCurrentRecord);

    procedure CheckLANG(nLang: Integer; lCheckValueField:Boolean); override;

  end;

  function EditZAGS_SprAkt(nID : Integer; nTypeAkt:Integer; arrRec : TCurrentRecord) : Boolean;


implementation

uses dBase, fMain, fChoiceNasel, fShablon, fEnterDokument, uProject;

{$R *.DFM}

var
  fmZAGS_SprAkt: TfmZAGS_SprAkt;

function EditZAGS_SprAkt(nID : Integer; nTypeAkt:Integer; arrRec : TCurrentRecord) : Boolean;
begin
//  result := true;
  fmZAGS_SprAkt:=TfmZAGS_SprAkt.Create(nil);
  try
    with fmZAGS_SprAkt do begin
      IsReadDokument:=true;
      TBItemZAGS.Visible:=false;
      TBToolbarOrgan.Visible:=false;
      if nID=-1 then begin
        NewDok(true);
        SetIDZags;
//        CheckEnabledNameOrgan(true);
        if (nTypeAkt>0) and (Length(arrRec)>0) then begin
          LoadSource(nTypeAkt, GetValueFieldEx(arrRec, 'ID', 0), arrRec);
        end;
      end else begin
        ReadDok( nID );
//        CheckEnabledNameOrgan(false);
      end;
      IsReadDokument:=false;
      QueryExit:=false;
      Result:=EditModal;
    end;
  finally
    FreeAndNil(fmZAGS_SprAkt);
  end;
end;

{ TfmZAGS_SprAkt }

constructor TfmZAGS_SprAkt.Create(Owner: TComponent);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  inherited;
 // FDokZAGS := true;
  FCheckKeyboard:=false;  //!!!
  SetcbBel(N_F_cbBelorus, lbBel);

  TypeObj := dmBase.TypeObj_ZAGS_SprAkt;

  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL');
  if Opis<>nil then begin
    for i:=0 to Opis.Items.Count-1 do begin
      edTypeAkt.Items.Add(Opis.Items[i]);
      edTypeAkt.KeyItems.Add(Opis.KeyList[i]);
    end;
  end;

  SetLength(FArrChoiceRekv,2);

  FArrChoiceRekv[0].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[0].FieldName:='VN_SVED';

  FArrChoiceRekv[1].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[1].FieldName:='VN_IZM';

//  FArrChoiceRekv[2].nType:=SHABLON_ADRESAT;
//  FArrChoiceRekv[2].FieldName:='ADRESAT';

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

destructor TfmZAGS_SprAkt.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZAGS_SprAkt.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmZAGS_SprAkt.GetVid: String;
begin
  Result := 'ZAGS_SprAkt';
end;

function TfmZAGS_SprAkt.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentIS_VN_IZM.AsInteger:=0;
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

function TfmZAGS_SprAkt.ReadDok(nID: Integer): Boolean;
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
                      ['DOKUMENT', Dokument],dmBase.AddDokZAGS.FieldByName('FIELD_DELIMITER').AsString,nil);
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
procedure TfmZAGS_SprAkt.WriteSoato(fld:TField);
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
function TfmZAGS_SprAkt.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr, strRazd : String;
  vKeyValues : Variant;
  st:TStringStream;
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

procedure TfmZAGS_SprAkt.UpdateActions;
begin
  inherited;
end;

procedure TfmZAGS_SprAkt.dsDokumentDataChange(Sender: TObject;
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

function TfmZAGS_SprAkt.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
end;

procedure TfmZAGS_SprAkt.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZAGS_SprAkt.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmZAGS_SprAkt.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZAGS_SprAkt.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZAGS_SprAkt.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZAGS_SprAkt.CheckOnlyGod;
begin
end;

procedure TfmZAGS_SprAkt.CheckOnlyGodR;
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

procedure TfmZAGS_SprAkt.edGT_RNGORODNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZAGS_SprAkt.CheckRnGorod;
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

procedure TfmZAGS_SprAkt.cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZAGS_SprAkt.cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR;
end;

procedure TfmZAGS_SprAkt.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmZAGS_SprAkt.CreateSubMenuRun: Boolean;
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

procedure TfmZAGS_SprAkt.edIsVnIzmChange(Sender: TObject);
begin
  if edIsVnIzm.ItemIndex=1 then begin
    edIzm.Enabled:=true;
  end else begin
    edIzm.Enabled:=false;
    edIzm.Text:='';
  end;
end;

procedure TfmZAGS_SprAkt.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov,N_F_cbBelorus.Checked);
end;

procedure TfmZAGS_SprAkt.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CheckLang(1,true) else CheckLang(0,true);
end;

procedure TfmZAGS_SprAkt.CheckLANG(nLang: Integer; lCheckValueField:Boolean);
var
  Opis:TOpisEdit;
  i,n:Integer;
  l:Boolean;
  s:String;
begin
  inherited CheckLang(nLang, lCheckValueField);
  if nLang=1 then s:='_B' else s:='';
  n:=edTypeAkt.ItemIndex;
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL'+s);
  if Opis<>nil then for i:=0 to Opis.Items.Count-1 do edTypeAkt.Items[i]:=Opis.Items[i];
  edTypeAkt.ItemIndex:=n;
end;

//------------------------------------------------------------------------
procedure TfmZAGS_SprAkt.LoadSource(nTypeAkt:Integer; nID:Integer; arrRec : TCurrentRecord);
var
  s,ss,sTable,sIzmen : String;
  n:Integer;
begin
  if (nTypeAkt>0) and (nID>0) then begin
    if Length(arrRec)<2 then begin
      sTable:=dmBase.NameTableFromTypeObj(nTypeAkt);
      dmBase.WorkQuery.SQL.Text:='SELECT * FROM '+sTable+'WHERE id='+IntToStr(nID);
      dmBase.WorkQuery.Open;
      SetLength(arrRec,1);
      GetCurrentRecord(dmBase.WorkQuery, '', arrRec);
      dmBase.WorkQuery.Close;
      s:=dmBase.ReadPropSimpleDok(nTypeAkt, nID, STOD('1899-12-30',tdAds), 'IZMEN', ftMemo);
      SetValueFieldEx(arrRec, 'IZMEN', s);
    end;
    EditDataSet(Dokument);
    n:=GetValueFieldEx(arrRec, 'SET_LANG', -1);
    if n>-1
      then DokumentLang.AsInteger:=n;
    if GetValueFieldEx(arrRec, 'ON_ONA', 'ONA')='ONA'
      then ss:='ONA_' else ss:='ON_';
    if DokumentTYPEAKT.AsInteger<>nTypeAkt
      then DokumentTYPEAKT.AsInteger:=nTypeAkt;
    DokumentNOMER_AKT.Value:=GetValueFieldEx(arrRec, 'NOMER', 0);
    DokumentDATE_AKT.Value:=GetValueFieldEx(arrRec, 'DATEZ', 0);
    if DokumentLang.AsInteger=1 then s:='_B' else s:='';
    DokumentNAME_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS', 0), s, 'П');
    DokumentVN_IZM.AsString:=GetValueFieldEx(arrRec, 'IZMEN', '');
    if DokumentVN_IZM.AsString=''
      then DokumentIS_VN_IZM.AsInteger:=0
      else DokumentIS_VN_IZM.AsInteger:=1;
    if (nTypeAkt=_TypeObj_ZRogd) or (nTypeAkt=_TypeObj_ZSmert) then begin
      DokumentFamilia.AsString:=GetValueFieldEx(arrRec, 'FAMILIA'+s, '');
      DokumentName.AsString:=GetValueFieldEx(arrRec, 'NAME'+s, '');
      DokumentOtch.AsString:=GetValueFieldEx(arrRec, 'OTCH'+s, '');
      DokumentPol.AsString:=GetValueFieldEx(arrRec, 'POL', '');
    end else if (nTypeAkt=_TypeObj_ZUstOtc) or (nTypeAkt=_TypeObj_ZUstMat) or (nTypeAkt=_TypeObj_ZAdopt) or (nTypeAkt=_TypeObj_ZChName) then begin
      DokumentFamilia.AsString:=GetValueFieldEx(arrRec, 'FAMILIAPOSLE'+s, '');
      DokumentName.AsString:=GetValueFieldEx(arrRec, 'NAMEPOSLE'+s, '');
      DokumentOtch.AsString:=GetValueFieldEx(arrRec, 'OTCHPOSLE'+s, '');
      DokumentPol.AsString:=GetValueFieldEx(arrRec, 'POL', '');
    end else if (nTypeAkt=_TypeObj_ZBrak) or (nTypeAkt=_TypeObj_ZRast) then begin
      DokumentFamilia.AsString:=GetValueFieldEx(arrRec, ss+'FAMILIAP'+s, '');
      DokumentName.AsString:=GetValueFieldEx(arrRec, ss+'NAME'+s, '');
      DokumentOtch.AsString:=GetValueFieldEx(arrRec, ss+'OTCH'+s, '');
      if ss='ONA_'
        then DokumentPol.AsString:='Ж'
        else DokumentPol.AsString:='М';
    end;
    PostDataSet(Dokument);
    QueryExit:=true;
  end;
end;
//------------------------------------------------------------------------
procedure TfmZAGS_SprAkt.edTypeAktEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  arrRec : TCurrentRecord;
  nTypeAkt : Integer;
begin
  if edTypeAkt.ItemIndex>-1 then begin
    SetLength(arrRec,1);
    nTypeAkt:=StrToInt(edTypeAkt.KeyItems[edTypeAkt.ItemIndex]);
    if ChoiceFromAkt(nTypeAkt , arrRec, edTypeAkt) then begin
      LoadSource(nTypeAkt, GetValueFieldEx(arrRec, 'ID', 0), arrRec);
    end;
  end else begin
    PutError('Выберите тип записи акта',self);
  end;
end;

end.
