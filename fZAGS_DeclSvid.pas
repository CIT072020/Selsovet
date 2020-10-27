unit fZAGS_DeclSvid;

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
  TfmZAGS_DeclSvid = class(TfmSimpleD)
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
    DokumentDATE_AKT: TDateField;
    DokumentNOMER_AKT: TIntegerField;
    DokumentTYPE_AKT: TIntegerField;
    DokumentNOMER: TStringField;
    DokumentDOLG_RUKOV: TStringField;
    TBItem1: TTBItem;
    Label1: TLabel;
    edFamilia: TDBEditEh;
    Label2: TLabel;
    edName: TDBEditEh;
    Label3: TLabel;
    edOtch: TDBEditEh;
    Label5: TLabel;
    edPol: TDBComboBoxEh;
    gbAdres: TGroupBox;
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
    edGT_RN: TDBEditEh;
    edGT_OBL: TDBEditEh;
    lbSvid: TLabel;
    edSVID_SERIA: TDBLookupComboboxEh;
    Label55: TLabel;
    edSvid_Nomer: TDBEditEh;
    Label56: TLabel;
    edDateSv: TDBDateTimeEditEh;
    gbDok: TGroupBox;
    edDOK_TYPE: TDBComboBoxEh;
    edDOK_SERIA: TDBEditEh;
    edDOKUMENT: TDBEditEh;
    Label69: TLabel;
    edDOK_DATE: TDBDateTimeEditEh;
    edDOK_NOMER: TDBEditEh;
    Label4: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label9: TLabel;
    edTypeAkt: TDBComboBoxEh;
    Label10: TLabel;
    edNomerAkt: TDBEditEh;
    Label11: TLabel;
    edDateAkt: TDBDateTimeEditEh;
    Label12: TLabel;
    edNAME_ZAGS: TDBEditEh;
    DokumentSVID_SERIA: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentDATESV: TDateField;
    DokumentDOK_TYPE: TIntegerField;
    DokumentDOK_SERIA: TStringField;
    DokumentDOK_NOMER: TStringField;
    DokumentDOKUMENT: TStringField;
    DokumentGT_GOSUD: TIntegerField;
    DokumentGT_OBL: TStringField;
    DokumentGT_RAION: TStringField;
    DokumentGT_B_GOROD: TIntegerField;
    DokumentGT_GOROD: TStringField;
    DokumentGT_GOROD_R: TStringField;
    pnRukov: TPanel;
    lbRukov: TvchDBText;
    edRukov: TDBEditEh;
    pcAkt: TPageControl;
    tsRogd: TTabSheet;
    tsBrak: TTabSheet;
    tsRast: TTabSheet;
    tsUst: TTabSheet;
    tsSmert: TTabSheet;
    tsChName: TTabSheet;
    DokumentFIO: TStringField;
    DokumentFIO1: TStringField;
    DokumentFIO2: TStringField;
    DokumentMESTO: TStringField;
    DokumentDATE_FOR: TDateField;
    edFIO_Child: TDBEditEh;
    Label13: TLabel;
    Label17: TLabel;
    edMestoR: TDBEditEh;
    Label18: TLabel;
    edOtec: TDBEditEh;
    Label19: TLabel;
    edMat: TDBEditEh;
    edDateR: TDBDateTimeEditEh;
    Label20: TLabel;
    Label21: TLabel;
    edDateBrak: TDBDateTimeEditEh;
    Label22: TLabel;
    Label23: TLabel;
    edMestoB: TDBEditEh;
    edONB: TDBEditEh;
    Label24: TLabel;
    Label28: TLabel;
    edONAB: TDBEditEh;
    Label29: TLabel;
    edUstDo: TDBEditEh;
    edDateUst: TDBDateTimeEditEh;
    Label30: TLabel;
    Label31: TLabel;
    edMestoUst: TDBEditEh;
    edUstPosle: TDBEditEh;
    Label32: TLabel;
    lbUst: TLabel;
    edRoditelUst: TDBEditEh;
    Label34: TLabel;
    edFIOSm: TDBEditEh;
    edDateSm: TDBDateTimeEditEh;
    Label35: TLabel;
    Label36: TLabel;
    edMestoSm: TDBEditEh;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    edOnRast: TDBEditEh;
    edOnaRast: TDBEditEh;
    edDateRast: TDBDateTimeEditEh;
    edMestoRast: TDBEditEh;
    Label49: TLabel;
    Label37: TLabel;
    edFIO1Ch: TDBEditEh;
    edDateChName: TDBDateTimeEditEh;
    Label38: TLabel;
    Label39: TLabel;
    edMestoChName: TDBEditEh;
    edFIO2Ch: TDBEditEh;
    Label40: TLabel;
    Label42: TLabel;
    Label41: TLabel;
    DokumentAKT_ID: TIntegerField;
    DokumentDOK_DATE: TDateField;
    DokumentGT_B_OBL: TBooleanField;
    DokumentAKT_ID_ZAGS: TIntegerField;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure cbOnlyGodChange(Sender: TObject);
    procedure cbOnlyGodRChange(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edTypeAktEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edTypeAktChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
//    H : THintWindow;
    procedure OnDestroyHint( Sender : TObject);
    procedure SetIDZags;
  public
    { Public declarations }
    FDok:TDataSet;
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
    procedure Event_AddNameZags(Sender: TObject);

    procedure LoadSource(nTypeAkt:Integer; nID:Integer; arrRec:TCurrentRecord);
    function GetTypeAkt:Integer;

    procedure CheckLANG(nLang: Integer; lCheckValueField:Boolean); override;

  end;

  function EditZAGS_DeclSvid(nID : Integer; nTypeAkt:Integer; var arrRec : TCurrentRecord; dsDok:TDataSet) : Boolean;


implementation

uses dBase, fMain, fChoiceNasel, fShablon, fEnterDokument, uProject;

{$R *.DFM}

var
  fmZAGS_DeclSvid: TfmZAGS_DeclSvid;

function EditZAGS_DeclSvid(nID : Integer; nTypeAkt:Integer; var arrRec : TCurrentRecord; dsDok:TDataSet) : Boolean;
var
  n:Integer;
  lCheck:Boolean;
begin
//  result := true;
  fmZAGS_DeclSvid:=TfmZAGS_DeclSvid.Create(nil);
  try
    with fmZAGS_DeclSvid do begin
      lCheck:=false;
      FDok:=dsDok;
      IsReadDokument:=true;
      TBItemZAGS.Visible:=false;
      TBToolbarOrgan.Visible:=false;
      if nID=-1 then begin
        NewDok(true);
        SetIDZags;
//        CheckEnabledNameOrgan(true);
        if (nTypeAkt>0) and (Length(arrRec)>0) then begin
          LoadSource(nTypeAkt, GetValueFieldEx(arrRec, 'ID', 0), arrRec);
          edTypeAkt.Enabled:=false;
          edNomerAkt.Enabled:=false;
          edDateAkt.Enabled:=false;
          lCheck:=true;
        end;
      end else begin
        ReadDok( nID );
//        CheckEnabledNameOrgan(false);
      end;
      IsReadDokument:=false;
      QueryExit:=false;
      Result:=EditModal;
      if Result then begin
        if lCheck and (DokumentSVID_NOMER.AsString<>'') and not DokumentDATESV.IsNull then begin
          n:=Length(arrRec);
          SetLength(arrRec,n+3);
          arrRec[n].FieldName:='$SVID_SERIA';
          arrRec[n].Value:=DokumentSVID_SERIA.AsString;
          arrRec[n+1].FieldName:='$SVID_NOMER';
          arrRec[n+1].Value:=DokumentSVID_NOMER.AsString;
          arrRec[n+2].FieldName:='$SVID_DATE';
          arrRec[n+2].Value:=DokumentDATESV.Value;

    //      showmessage(arrRec[n].Value+' '+arrRec[n+1].Value+' '+DTOS(arrRec[n+2].Value,tdAds));
        end;
      end;
    end;
  finally
    FreeAndNil(fmZAGS_DeclSvid);
  end;
end;

{ TfmZAGS_DeclSvid }

constructor TfmZAGS_DeclSvid.Create(Owner: TComponent);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  inherited;
 // FDokZAGS := true;
  FCheckKeyboard:=false;  //!!!
//  SetcbBel(N_F_cbBelorus, lbBel);
  TypeObj := _TypeObj_ZAGS_DeclSvid;

  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL');
  if Opis<>nil then begin
    for i:=0 to Opis.Items.Count-1 do begin
      edTypeAkt.Items.Add(Opis.Items[i]);
      edTypeAkt.KeyItems.Add(Opis.KeyList[i]);
    end;
  end;
  SetControlFIOUpdate([edFamilia, edName, edOtch], false);

  SetLength(FArrChoiceRekv,2);

  FArrChoiceRekv[0].nType:=1;
  FArrChoiceRekv[0].FieldName:='DOKUMENT';

  FArrChoiceRekv[1].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[1].FieldName:='GT_GOROD_R';

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
  FPageControl := pcAkt;

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

destructor TfmZAGS_DeclSvid.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZAGS_DeclSvid.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmZAGS_DeclSvid.GetVid: String;
begin
  Result := 'ZAGS_DeclSvid';
end;

function TfmZAGS_DeclSvid.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentLang.AsInteger:=0;
  DokumentTYPE_AKT.AsInteger:=_TypeObj_ZRogd;
  DokumentGT_B_OBL.AsBoolean:=true;
  DokumentAKT_ID_ZAGS.AsInteger:=0;
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

function TfmZAGS_DeclSvid.ReadDok(nID: Integer): Boolean;
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
  if DokumentAKT_ID_ZAGS.IsNull then DokumentAKT_ID_ZAGS.AsInteger:=0;

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

//  N_F_cbBelorus.Checked:=(DokumentLANG.AsInteger=1);
  if DokumentLANG.AsInteger=1
    then CheckLANG(1,false);
//  N_F_cbBelorus.Enabled:=FAddNewDok;

end;

//------------------------------------------------------------------------
procedure TfmZAGS_DeclSvid.WriteSoato(fld:TField);
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
function TfmZAGS_DeclSvid.WriteDok: Boolean;
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

procedure TfmZAGS_DeclSvid.UpdateActions;
begin
  inherited;
end;

procedure TfmZAGS_DeclSvid.dsDokumentDataChange(Sender: TObject;
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

function TfmZAGS_DeclSvid.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
  n:=LimitMRUList(3);
  SetMRUList(edGT_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  n:=LimitMRUList(1);
  SetMRUList(edGT_OBL,n,1,true,false,false,FAddButtonMRUList);
  n:=LimitMRUList(2);
  SetMRUList(edGT_RN,n,2,true,false,false,FAddButtonMRUList);
  edFamilia.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateData;
  edOtch.OnUpdateData:=FIOUpdateData;
end;

procedure TfmZAGS_DeclSvid.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZAGS_DeclSvid.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmZAGS_DeclSvid.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZAGS_DeclSvid.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZAGS_DeclSvid.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZAGS_DeclSvid.CheckOnlyGod;
begin
end;

procedure TfmZAGS_DeclSvid.CheckOnlyGodR;
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

procedure TfmZAGS_DeclSvid.edGT_RNGORODNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZAGS_DeclSvid.CheckRnGorod;
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

procedure TfmZAGS_DeclSvid.cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZAGS_DeclSvid.cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR;
end;

procedure TfmZAGS_DeclSvid.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmZAGS_DeclSvid.CreateSubMenuRun: Boolean;
var
 it : TTbItem;
 i:Integer;
// sep : TTbSeparatorItem;
begin
  Result:=true;
  NotStdSubmenuRun;
  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Печать органа загс составившего з/а';
  it.OnClick:=Event_AddNameZags;
  TBSubmenuRun.Add(it);
  it.Checked:=Globaltask.GetLastValueAsBoolean('DeclSvid_ADD_ZAGS');
end;
//-------------------------------------------------------------------
procedure TfmZAGS_DeclSvid.Event_AddNameZags(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  Globaltask.SetLastValueAsBoolean('DeclSvid_ADD_ZAGS', TTbItem(Sender).Checked);
end;
//-------------------------------------------------------------------
procedure TfmZAGS_DeclSvid.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov,false);
end;

procedure TfmZAGS_DeclSvid.N_F_cbBelorusClick(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CheckLang(1,true) else CheckLang(0,true);
end;

procedure TfmZAGS_DeclSvid.CheckLANG(nLang: Integer; lCheckValueField:Boolean);
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
procedure TfmZAGS_DeclSvid.LoadSource(nTypeAkt:Integer; nID:Integer; arrRec : TCurrentRecord);
var
  s,ss,sTable,sIzmen : String;
  nIDAkt,n:Integer;
begin
  if (nTypeAkt>0) and (nID>0) then begin
    if Length(arrRec)<2 then begin
      sTable:=dmBase.NameTableFromTypeObj(nTypeAkt);
      dmBase.WorkQuery.SQL.Text:='SELECT * FROM '+sTable+'WHERE id='+IntToStr(nID);
      dmBase.WorkQuery.Open;
      SetLength(arrRec,1);
      GetCurrentRecord(dmBase.WorkQuery, '', arrRec);
      dmBase.WorkQuery.Close;
    end;
    EditDataSet(Dokument);
    n:=GetValueFieldEx(arrRec, 'SET_LANG', -1);
    if n>-1
      then DokumentLang.AsInteger:=n;
    if GetValueFieldEx(arrRec, 'ON_ONA', 'ONA')='ONA'
      then ss:='ONA_' else ss:='ON_';
    if DokumentTYPE_AKT.AsInteger<>nTypeAkt
      then DokumentTYPE_AKT.AsInteger:=nTypeAkt;
    DokumentNOMER_AKT.Value:=GetValueFieldEx(arrRec, 'NOMER', 0);
    DokumentDATE_AKT.Value:=GetValueFieldEx(arrRec, 'DATEZ', 0);
    nIDAkt:=GetValueFieldEx(arrRec, 'ID', 0);
    DokumentAKT_ID.AsInteger:=nIDAkt;
    DokumentAKT_ID_ZAGS.AsInteger:=GetValueFieldEx(arrRec, 'ID_ZAGS', 0);
//    if DokumentLang.AsInteger=1 then s:='_B' else s:='';
    s:='';
//    DokumentNAME_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS', 0), s, 'П');
    if (nTypeAkt=_TypeObj_ZRogd) then begin
      DokumentFIO.AsString:=GetValueFieldEx(arrRec, 'FAMILIA'+s, '')+' '+GetValueFieldEx(arrRec, 'NAME'+s, '')+' '+
                            GetValueFieldEx(arrRec, 'OTCH'+s, '');
      DokumentFIO1.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIA'+s, '')+' '+GetValueFieldEx(arrRec, 'ON_NAME'+s, '')+' '+
                            GetValueFieldEx(arrRec, 'ON_OTCH'+s, '');
      DokumentFIO2.AsString:=GetValueFieldEx(arrRec, 'ONA_FAMILIA'+s, '')+' '+GetValueFieldEx(arrRec, 'ONA_NAME'+s, '')+' '+
                            GetValueFieldEx(arrRec, 'ONA_OTCH'+s, '');
      DokumentDATE_FOR.Value:=GetValueFieldEx(arrRec, 'DATER', null);
      if FDok=nil then begin
        if dmBase.tbZapisRogd.Locate('ID', nIDAkt,[])
          then DokumentMESTO.AsString:=dmBase.GetAdresAkt2('dmBase.tbZapisRogd','GOSUD,FName;+OBL,B_OBL;RAION;GOROD,B_GOROD',2);
      end else begin
        DokumentMESTO.AsString:=dmBase.GetAdresAkt3(FDok,'GOSUD,FName;+OBL,B_OBL;RAION;GOROD,B_GOROD',2);
      end;
//      DokumentPol.AsString:=GetValueFieldEx(arrRec, 'POL', '');
      DokumentNAME_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS', 0), s, '');
    end else if (nTypeAkt=_TypeObj_ZSmert) then begin
      DokumentFIO.AsString:=GetValueFieldEx(arrRec, 'FAMILIA'+s, '')+' '+GetValueFieldEx(arrRec, 'NAME'+s, '')+' '+
                            GetValueFieldEx(arrRec, 'OTCH'+s, '');
      DokumentDATE_FOR.Value:=GetValueFieldEx(arrRec, 'DATES', null);
      if FDok=nil then begin
        if dmBase.tbZapisSmert.Locate('ID', nIDAkt,[])
          then DokumentMESTO.AsString:=dmBase.GetAdresAkt2('dmBase.tbZapisSmert','SM_GOSUD,FName;+SM_OBL,B_OBL;SM_RAION;SM_GOROD,SM_B_GOROD',2);
      end else begin
        DokumentMESTO.AsString:=dmBase.GetAdresAkt3(FDok,'SM_GOSUD,FName;+SM_OBL,B_OBL;SM_RAION;SM_GOROD,SM_B_GOROD',2);
      end;
      DokumentNAME_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS', 0), s, '');
    end else if (nTypeAkt=_TypeObj_ZUstOtc) or (nTypeAkt=_TypeObj_ZUstMat) then begin
      DokumentFIO1.AsString:=GetValueFieldEx(arrRec, 'FAMILIADO'+s, '')+' '+GetValueFieldEx(arrRec, 'NAMEDO'+s, '')+' '+
                             GetValueFieldEx(arrRec, 'OTCHDO'+s, '');
      DokumentFIO2.AsString:=GetValueFieldEx(arrRec, 'FAMILIAPOSLE'+s, '')+' '+GetValueFieldEx(arrRec, 'NAMEPOSLE'+s, '')+' '+
                             GetValueFieldEx(arrRec, 'OTCHPOSLE'+s, '');
      if nTypeAkt=_TypeObj_ZUstOtc then begin
        lbUst.Caption:='Отцом ребенка признан';
        ss:='ON'
      end else begin
        lbUst.Caption:='Матерью ребенка признана';
        ss:='ONA';
      end;
      DokumentFIO.AsString:=GetValueFieldEx(arrRec, ss+'_FAMILIA'+s, '')+' '+GetValueFieldEx(arrRec, ss+'_NAME'+s, '')+' '+
                             GetValueFieldEx(arrRec, ss+'_OTCH'+s, '');
      DokumentDATE_FOR.Value:=GetValueFieldEx(arrRec, 'DATEZ', null);
      DokumentNAME_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS', 0), s, '');
      DokumentMESTO.AsString:=DokumentNAME_ZAGS.AsString;
    end else if (nTypeAkt=_TypeObj_ZChName) then begin
      DokumentFIO1.AsString:=GetValueFieldEx(arrRec, 'FAMILIADO'+s, '')+' '+GetValueFieldEx(arrRec, 'NAMEDO'+s, '')+' '+
                             GetValueFieldEx(arrRec, 'OTCHDO'+s, '');
      DokumentFIO2.AsString:=GetValueFieldEx(arrRec, 'FAMILIAPOSLE'+s, '')+' '+GetValueFieldEx(arrRec, 'NAMEPOSLE'+s, '')+' '+
                             GetValueFieldEx(arrRec, 'OTCHPOSLE'+s, '');
      DokumentDATE_FOR.Value:=GetValueFieldEx(arrRec, 'DATEZ', null);
      DokumentNAME_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS', 0), s, '');
      DokumentMESTO.AsString:=DokumentNAME_ZAGS.AsString;
    end else if (nTypeAkt=_TypeObj_ZBrak) or (nTypeAkt=_TypeObj_ZRast) then begin
      DokumentFIO1.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIA'+s, '')+' '+GetValueFieldEx(arrRec, 'ON_NAME'+s, '')+' '+
                             GetValueFieldEx(arrRec, 'ON_OTCH'+s, '');
      DokumentFIO2.AsString:=GetValueFieldEx(arrRec, 'ONA_FAMILIA'+s, '')+' '+GetValueFieldEx(arrRec, 'ONA_NAME'+s, '')+' '+
                             GetValueFieldEx(arrRec, 'ONA_OTCH'+s, '');
      DokumentDATE_FOR.Value:=GetValueFieldEx(arrRec, 'DATEZ', null);
      DokumentNAME_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS', 0), s, '');
      DokumentMESTO.AsString:=DokumentNAME_ZAGS.AsString;
    end;
    DokumentFIO.AsString:=FirstUpper(DokumentFIO.AsString);
    DokumentFIO1.AsString:=FirstUpper(DokumentFIO1.AsString);
    DokumentFIO2.AsString:=FirstUpper(DokumentFIO2.AsString);

    PostDataSet(Dokument);
    QueryExit:=true;
  end;
end;
//------------------------------------------------------------------------
function TfmZAGS_DeclSvid.GetTypeAkt:Integer;
begin
  if edTypeAkt.ItemIndex>-1 then begin
    Result:=StrToInt(edTypeAkt.KeyItems[edTypeAkt.ItemIndex]);
  end else begin
    Result:=0;
  end;
end;
//------------------------------------------------------------------------
procedure TfmZAGS_DeclSvid.edTypeAktEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  arrRec : TCurrentRecord;
  nTypeAkt : Integer;
begin
  if GetTypeAkt>0 then begin
    SetLength(arrRec,1);
    nTypeAkt:=StrToInt(edTypeAkt.KeyItems[edTypeAkt.ItemIndex]);
    if ChoiceFromAkt(nTypeAkt , arrRec, edTypeAkt) then begin
      LoadSource(nTypeAkt, GetValueFieldEx(arrRec, 'ID', 0), arrRec);
    end;
  end else begin
    PutError('Выберите тип записи акта',self);
  end;
end;
//------------------------------------------------------------------------
procedure TfmZAGS_DeclSvid.edTypeAktChange(Sender: TObject);
var
  nTypeAkt : Integer;
begin
  if GetTypeAkt>0 then begin
    nTypeAkt:=StrToInt(edTypeAkt.KeyItems[edTypeAkt.ItemIndex]);
    pcAkt.Visible:=true;
    case nTypeAkt of
      _TypeObj_ZRogd: pcAkt.ActivePage:=tsRogd;
      _TypeObj_ZBrak: pcAkt.ActivePage:=tsBrak;
      _TypeObj_ZRast: pcAkt.ActivePage:=tsRast;
      _TypeObj_ZUstOtc,_TypeObj_ZUstMat: pcAkt.ActivePage:=tsUst;
      _TypeObj_ZSmert: pcAkt.ActivePage:=tsSmert;
      _TypeObj_ZChName: pcAkt.ActivePage:=tsChName;
    else
      pcAkt.Visible:=false;
    end;
  end else begin
    pcAkt.Visible:=false;
  end;
end;

procedure TfmZAGS_DeclSvid.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  for i:=0 to pcAkt.PageCount-1 do begin
    pcAkt.Pages[i].TabVisible:=false;
  end;
end;

end.
