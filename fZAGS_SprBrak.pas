unit fZAGS_SprBrak;

interface

{$I Task.inc}
                                                              
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,  uSaveMemtable,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc, uProjectAll,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat,
  ZipForge;

type
  TfmZAGS_SprBrak = class(TfmSimpleD)
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
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    Label4: TLabel;
    edAdresat: TDBEditEh;
    DokumentDATE1: TStringField;
    DokumentDATE2: TStringField;
    pcRast: TPageControl;
    tsSmert: TTabSheet;
    lb14: TLabel;
    lb15: TLabel;
    lb13: TLabel;
    lb12: TLabel;
    edS_NOMER: TDBEditEh;
    edS_DATE: TDBDateTimeEditEh;
    edS_ZAGS: TDBEditEh;
    tsRast: TTabSheet;
    lb10: TLabel;
    lb11: TLabel;
    edSudResh: TDBDateTimeEditEh;
    edSudName: TDBEditEh;
    edSudSila: TDBDateTimeEditEh;
    tsAkt: TTabSheet;
    lb6: TLabel;
    lb7: TLabel;
    lb8: TLabel;
    lb9: TLabel;
    edR_NOMER: TDBEditEh;
    edR_DATE: TDBDateTimeEditEh;
    edR_ZAGS: TDBEditEh;
    edRukov: TDBEditEh;
    cbBrak: TDBCheckBoxEh;
    lb1: TLabel;
    edB_NOMER: TDBEditEh;
    lb2: TLabel;
    edB_DATE: TDBDateTimeEditEh;
    TBItemChoiceBrak: TTBItem;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edFamiliaP: TDBEditEh;
    DokumentFamiliaP: TStringField;
    DokumentFamilia2: TStringField;
    DokumentName2: TStringField;
    DokumentOtch2: TStringField;
    DokumentFamiliaP2: TStringField;
    DokumentNATION: TIntegerField;
    DokumentNATION2: TIntegerField;
    DokumentB_NOMER: TIntegerField;
    DokumentB_DATE: TDateField;
    DokumentTYPE_RAST: TIntegerField;
    DokumentS_DATE: TDateField;
    DokumentR_DATE: TDateField;
    DokumentSUDRESH: TDateField;
    DokumentSUDSILA: TDateField;
    edNATION: TDBLookupComboboxEh;
    edNATION2: TDBLookupComboboxEh;
    edFamilia2: TDBEditEh;
    edFamiliaP2: TDBEditEh;
    edName2: TDBEditEh;
    edOtch2: TDBEditEh;
    DokumentBRAK_RAST: TBooleanField;
    DokumentSUDNAME: TStringField;
    DokumentR_ZAGS: TStringField;
    DokumentS_ZAGS: TStringField;
    DokumentADRESAT: TStringField;
    edNameZAGS: TDBEditEh;
    Label1: TLabel;
    DokumentFIRST_BRAK: TBooleanField;
    cbFirstBrak: TDBCheckBoxEh;
    DokumentIZMEN: TMemoField;
    Label11: TLabel;
    edIzmen: TDBEditEh;
    DokumentNOMER: TStringField;
    DokumentDOLG_RUKOV: TStringField;
    lbRukov: TvchDBText;
    DokumentS_NOMER: TStringField;
    DokumentR_NOMER: TStringField;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure cbOnlyGodChange(Sender: TObject);
    procedure cbOnlyGodRChange(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure pcRastChange(Sender: TObject);
    procedure cbBrakClick(Sender: TObject);
    procedure CheckControl;
    procedure TBItemChoiceBrakClick(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
//    H : THintWindow;
//    procedure OnDestroyHint( Sender : TObject);
    procedure SetIDZags;
  public
    { Public declarations }
    function EmptyIzm: String; override;
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

  end;

  function EditZAGS_SprBrak(nID : Integer) : Boolean;


implementation

uses dBase, fMain, fChoiceNasel, fShablon, fEnterDokument, uProject;

{$R *.DFM}

var
  fmZAGS_SprBrak: TfmZAGS_SprBrak;

function EditZAGS_SprBrak(nID : Integer) : Boolean;
begin
//  result := true;
  fmZAGS_SprBrak := TfmZAGS_SprBrak.Create(nil);

  try
    with fmZAGS_SprBrak do begin
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
    fmZAGS_SprBrak.Free;
    fmZAGS_SprBrak := nil;
  end;
end;

{ TfmZAGS_SprBrak }

constructor TfmZAGS_SprBrak.Create(Owner: TComponent);
begin
  inherited;
 // FDokZAGS := true;
  TypeObj := dmBase.TypeObj_ZAGS_SprBrak;

  SetLength(FArrChoiceRekv,6);
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
  FArrChoiceRekv[2].sPadeg:='П';

  FArrChoiceRekv[3].nType:=0;
  FArrChoiceRekv[3].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[3].FieldName:='NAME_ZAGS';
  FArrChoiceRekv[3].sPadeg:='П';

  FArrChoiceRekv[4].nType:=SHABLON_SUD;
  FArrChoiceRekv[4].FieldName:='SUDNAME';

  FArrChoiceRekv[5].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[5].FieldName:='IZMEN';

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
//  edName.OnExit    := OnDestroyHint ;
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
  edFamiliaP.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateData;
  edOtch.OnUpdateData:=FIOUpdateData;
  edFamilia2.OnUpdateData:=FIOUpdateData;
  edFamiliaP2.OnUpdateData:=FIOUpdateData;
  edName2.OnUpdateData:=FIOUpdateData;
  edOtch2.OnUpdateData:=FIOUpdateData;

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
  ImageGISUN.Visible := false;
end;

destructor TfmZAGS_SprBrak.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZAGS_SprBrak.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmZAGS_SprBrak.GetVid: String;
begin
  Result := 'ZAGS_SprBrak';
end;

function TfmZAGS_SprBrak.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

//  DokumentPOVTOR.AsBoolean:=false;
//  DokumentCOPIA.AsBoolean:=false;

  DokumentBRAK_RAST.AsBoolean:=false;
  DokumentFIRST_BRAK.AsBoolean:=false;
  DokumentTYPE_RAST.AsInteger:=0;
  DokumentIZMEN.AsString:=EmptyIzm;

//  cbBelorus.Checked:=false;
//  if lAppend then begin
//    CheckRnGorod;
//  end;
  inherited NewDok(lAppend);
  Dokument.Post;
  Dokument.Edit;

  QueryExit:=false;
  Result := true;
end;

function TfmZAGS_SprBrak.ReadDok(nID: Integer): Boolean;
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
  if DokumentFIRST_BRAK.IsNull then DokumentFIRST_BRAK.AsBoolean:=false;

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

  if DokumentTYPE_RAST.AsInteger>0 then begin
    try
      pcRast.ActivePageIndex:=DokumentTYPE_RAST.AsInteger-1;
    except
    end;
    cbBrak.Checked:=true;
  end else begin
    DokumentTYPE_RAST.AsInteger:=0;
    pcRast.ActivePageIndex:=1;
    cbBrak.Checked:=false;
  end;

  Dokument.Post;

end;

//------------------------------------------------------------------------
procedure TfmZAGS_SprBrak.WriteSoato(fld:TField);
begin
end;

//------------------------------------------------------------------------
function TfmZAGS_SprBrak.WriteDok: Boolean;
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

    if cbBrak.Checked then begin
      DokumentTYPE_RAST.AsInteger:=pcRast.ActivePageIndex+1;
      if pcRast.ActivePageIndex=0 then begin           // смерть
        DokumentSUDNAME.AsString:='';
        DokumentSUDRESH.AsString:='';
        DokumentSUDSILA.AsString:='';

        DokumentR_NOMER.AsString:='';
        DokumentR_DATE.AsString:='';
        DokumentR_ZAGS.AsString:='';
      end else if pcRast.ActivePageIndex=1 then begin  // решение суда
        DokumentS_NOMER.AsString:='';
        DokumentS_DATE.AsString:='';
        DokumentS_ZAGS.AsString:='';

        DokumentR_NOMER.AsString:='';
        DokumentR_DATE.AsString:='';
        DokumentR_ZAGS.AsString:='';
      end else if pcRast.ActivePageIndex=2 then begin  // актовая запись
        DokumentS_NOMER.AsString:='';
        DokumentS_DATE.AsString:='';
        DokumentS_ZAGS.AsString:='';

        DokumentSUDNAME.AsString:='';
        DokumentSUDRESH.AsString:='';
        DokumentSUDSILA.AsString:='';
      end;
    end;
    Dokument.Post;

    SaveDef:=false;

    dmBase.AddDokZAGS.Edit;

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

procedure TfmZAGS_SprBrak.UpdateActions;
begin
  inherited;
end;

procedure TfmZAGS_SprBrak.dsDokumentDataChange(Sender: TObject;
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
      end;
    end;
  end;
end;

function TfmZAGS_SprBrak.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
end;

procedure TfmZAGS_SprBrak.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZAGS_SprBrak.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

//procedure TfmZAGS_SprBrak.OnDestroyHint(Sender: TObject);
//begin
//  DestroyHint(H);
//end;

procedure TfmZAGS_SprBrak.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZAGS_SprBrak.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZAGS_SprBrak.CheckOnlyGod;
begin
end;

procedure TfmZAGS_SprBrak.CheckOnlyGodR;
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

procedure TfmZAGS_SprBrak.edGT_RNGORODNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZAGS_SprBrak.CheckRnGorod;
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

procedure TfmZAGS_SprBrak.cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZAGS_SprBrak.cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR;
end;

procedure TfmZAGS_SprBrak.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmZAGS_SprBrak.CreateSubMenuRun: Boolean;
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

procedure TfmZAGS_SprBrak.pcRastChange(Sender: TObject);
begin
  if Dokument.RecordCount>0 then begin
    EditDataset(Dokument);
    DokumentTYPE_RAST.AsInteger:=pcRast.ActivePageIndex+1;
  end;
end;

procedure TfmZAGS_SprBrak.CheckControl;
var
  l:Boolean;
begin
  if cbBrak.Checked then begin
    l:=true;
  end else begin
    l:=false;
  end;
  pcRast.Enabled:=l;
  edS_NOMER.Enabled:=l;
  edS_DATE.Enabled:=l;
  edS_ZAGS.Enabled:=l;
  edR_NOMER.Enabled:=l;
  edR_DATE.Enabled:=l;
  edR_ZAGS.Enabled:=l;
  edSudName.Enabled:=l;
  edSudResh.Enabled:=l;
  edSudSila.Enabled:=l;
  lb6.Enabled:=l;
  lb7.Enabled:=l;
  lb8.Enabled:=l;
  lb9.Enabled:=l;
  lb10.Enabled:=l;
  lb11.Enabled:=l;
  lb12.Enabled:=l;
  lb13.Enabled:=l;
  lb14.Enabled:=l;
  lb15.Enabled:=l;
end;

procedure TfmZAGS_SprBrak.cbBrakClick(Sender: TObject);
begin
  if Dokument.RecordCount>0 then begin
    EditDataSet(Dokument);
    if cbBrak.Checked then begin
      DokumentTYPE_RAST.AsInteger:=pcRast.ActivePageIndex+1;
    end else begin
      DokumentTYPE_RAST.AsInteger:=0;
    end;
    CheckControl;
  end else begin
    CheckControl;
  end;
end;

procedure TfmZAGS_SprBrak.TBItemChoiceBrakClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  lCheck : Boolean;
  ParamFlt:TParamFieldFlt;
  s,sOther:String;
  nID:Integer;
begin
  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_BRAK');
  if Opis<>nil then begin
    ParamFlt:=CreateParamFlt(edFamilia.Text,'ON_FAMILIA');
    if ParamFlt<>nil then Opis.AutoFilter:=true;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edFamilia, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      lCheck:=dbDisableControls(Dokument);
      Screen.Cursor := crHourGlass;
      try
        nID:=GetValueFieldEx(arrRec, 'ID',0);
        EditDataSet(Dokument);
        DokumentFAMILIA.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIA','');
        DokumentFAMILIAP.AsString:=GetValueFieldEx(arrRec, 'ON_FAMILIAP','');
        DokumentNAME.AsString:=GetValueFieldEx(arrRec, 'ON_NAME','');
        DokumentOTCH.AsString:=GetValueFieldEx(arrRec, 'ON_OTCH','');
        DokumentNATION.AsInteger:=GetValueFieldEx(arrRec, 'ON_NATION',0);

        DokumentFAMILIA2.AsString:=GetValueFieldEx(arrRec, 'ONA_FAMILIA','');
        DokumentFAMILIAP2.AsString:=GetValueFieldEx(arrRec, 'ONA_FAMILIAP','');
        DokumentNAME2.AsString:=GetValueFieldEx(arrRec, 'ONA_NAME','');
        DokumentOTCH2.AsString:=GetValueFieldEx(arrRec, 'ONA_OTCH','');
        DokumentNATION2.AsInteger:=GetValueFieldEx(arrRec, 'ONA_NATION',0);

        DokumentB_NOMER.AsString:=GetValueFieldEx(arrRec, 'NOMER','');
        DokumentB_DATE.AsDateTime:=GetValueFieldEx(arrRec, 'DATEZ', 0);

        DokumentBRAK_RAST.AsBoolean:=GetValueFieldEx(arrRec, 'BRAK_RAST', false);
        if DokumentBRAK_RAST.AsBoolean then begin
          DokumentFIRST_BRAK.AsBoolean:=false;
        end else begin
          if (GetValueFieldEx(arrRec, 'ON_SEM', 0)=2) and (GetValueFieldEx(arrRec, 'ONA_SEM', 0)=2)
            then DokumentFIRST_BRAK.AsBoolean:=true
            else DokumentFIRST_BRAK.AsBoolean:=false;
        end;


        DokumentIZMEN.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZBrak, nID, STOD('1899-12-30',tdAds), 'IZMEN', ftMemo);
        if DokumentIZMEN.AsString=''
          then DokumentIZMEN.AsString:=EmptyIzm;

        DokumentTYPE_RAST.AsInteger:=0;
        if DokumentBRAK_RAST.AsBoolean then begin
          DokumentTYPE_RAST.AsInteger:=GetValueFieldEx(arrRec, 'TYPE_RAST',2);
          try
            pcRast.ActivePageIndex:=DokumentTYPE_RAST.AsInteger-1;
          except
            pcRast.ActivePageIndex:=1;
          end;

          sOther:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZBrak, nID, STOD('1899-12-30',tdAds), 'OTHER', ftMemo);

          s:=getFieldFromSL(sOther, 'S_NOMER', 'C'); // !!! может храниться или в OTHER или в S_NOMER !!!
          if s='' then s:=GetValueFieldEx(arrRec, 'S_NOMER','');
          DokumentS_NOMER.AsString:=s;
          if GetValueField(arrRec, 'S_DATE')<>null then DokumentS_DATE.AsDateTime:=GetValueFieldEx(arrRec, 'S_DATE',0);
          DokumentS_ZAGS.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZBrak, nID, STOD('1899-12-30',tdAds), 'S_ZAGS', ftMemo);

          s:=getFieldFromSL(sOther, 'R_NOMER', 'C'); // !!!
          if s='' then s:=GetValueFieldEx(arrRec, 'R_NOMER','');
          DokumentR_NOMER.AsString:=s;
          if GetValueField(arrRec, 'R_DATE')<>null then DokumentR_DATE.AsDateTime:=GetValueFieldEx(arrRec, 'R_DATE',0);
          DokumentR_ZAGS.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZBrak, nID, STOD('1899-12-30',tdAds), 'R_ZAGS', ftMemo);
          DokumentSUDNAME.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZBrak, nID, STOD('1899-12-30',tdAds), 'SUDNAME', ftMemo);
          if GetValueField(arrRec, 'SUDRESH')<>null then DokumentSUDRESH.AsDateTime:=GetValueFieldEx(arrRec, 'SUDRESH',0);
          if GetValueField(arrRec, 'SUDSILA')<>null then DokumentSUDSILA.AsDateTime:=GetValueFieldEx(arrRec, 'SUDSILA',0);
        end else begin
          DokumentTYPE_RAST.AsInteger:=0;
          pcRast.ActivePageIndex:=1;
          DokumentS_NOMER.AsString:='';
          DokumentS_DATE.AsString:='';
          DokumentS_ZAGS.AsString:='';
          DokumentR_NOMER.AsString:='';
          DokumentS_DATE.AsString:='';
          DokumentR_ZAGS.AsString:='';
          DokumentSUDNAME.AsString:='';
          DokumentSUDRESH.AsString:='';
          DokumentSUDSILA.AsString:='';
        end;


//    dmBase.WritePropSimpleDok(nTypeObj, nKodObj, dDateSave, FArrAddProperty[i].FieldName,
//                Dokument.FieldByName(FArrAddProperty[i].FieldName));

        DokumentNAME_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','П',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

        if dmBase.tbZapisBrak.Locate('ID', GetValueFieldEx(arrRec, 'ID',0),[]) then begin
          s:=GetValueFieldEx(arrRec, '_CURFIELD_','XXX');
          if (Copy(s,1,4)='ONA_') then begin
            DokumentADRESAT.AsString:=FIOForAdresat(DokumentFAMILIAP2.AsString,DokumentNAME2.AsString,DokumentOTCH2.AsString)+
              ' #'+dmBase.GetAdresAkt2('dmBase.tbZapisBrak','ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R',3);
//              ' #'+dmBase.GetAdresAkt3(dmBase.tbZapisBrak,'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R',1);
          end else begin
            DokumentADRESAT.AsString:=FIOForAdresat(DokumentFAMILIAP.AsString,DokumentNAME.AsString,DokumentOTCH.AsString)+
              ' #'+dmBase.GetAdresAkt2('dmBase.tbZapisBrak','ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R',3);
//              ' #'+dmBase.GetAdresAkt3(dmBase.tbZapisBrak,'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R',1);
          end;
        end;

      finally
        Screen.Cursor := old;
        dbEnableControls(Dokument,lCheck);
        CheckControl;
      end;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
end;

function TfmZAGS_SprBrak.EmptyIzm: String;
begin
  Result:=SprBrak_EmptyIzm;  // uProject
end;

procedure TfmZAGS_SprBrak.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;

end.
