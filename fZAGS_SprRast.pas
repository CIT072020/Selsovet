unit fZAGS_SprRast;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,  uSaveMemtable, uTypes,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat,
  ZipForge;

type
  TfmZAGS_SprRast = class(TfmSimpleD)
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
    edRukov: TDBEditEh;
    lb1: TLabel;
    edZAP_NOMER: TDBEditEh;
    lb2: TLabel;
    edZAP_DATE: TDBDateTimeEditEh;
    TBItemChoiceRast: TTBItem;
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
    DokumentZAP_NOMER: TIntegerField;
    DokumentZAP_DATE: TDateField;
    edNATION: TDBLookupComboboxEh;
    edNATION2: TDBLookupComboboxEh;
    edFamilia2: TDBEditEh;
    edFamiliaP2: TDBEditEh;
    edName2: TDBEditEh;
    edOtch2: TDBEditEh;
    DokumentADRESAT: TStringField;
    edNameZAGS: TDBEditEh;
    Label1: TLabel;
    DokumentIZMEN: TMemoField;
    Label11: TLabel;
    edIzmen: TDBEditEh;
    DokumentNOMER: TStringField;
    DokumentDOLG_RUKOV: TStringField;
    lbRukov: TvchDBText;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure cbOnlyGodChange(Sender: TObject);
    procedure cbOnlyGodRChange(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure cbBrakClick(Sender: TObject);
    procedure CheckControl;
    procedure TBItemChoiceRastClick(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
//    H : THintWindow;
    procedure OnDestroyHint( Sender : TObject);
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

  function EditZAGS_SprRast(nID : Integer) : Boolean;


implementation

uses dBase, fMain, fChoiceNasel, fShablon, fEnterDokument, uProject;

{$R *.DFM}

function EditZAGS_SprRast(nID : Integer) : Boolean;
var
  f : TfmZAGS_SprRast;
begin
//  result := true;
  f := TfmZAGS_SprRast.Create(nil);

  try
    with f do begin
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
    f.Free;
    f := nil;
  end;
end;

{ TfmZAGS_SprRast }

constructor TfmZAGS_SprRast.Create(Owner: TComponent);
begin
  inherited;
 // FDokZAGS := true;
  TypeObj := dmBase.TypeObj_ZAGS_SprRast;

  SetLength(FArrChoiceRekv,2);
//  FArrChoiceRekv[0].nType:=SHABLON_ADRESAT;
//  FArrChoiceRekv[0].FieldName:='ADRESAT';

  FArrChoiceRekv[0].nType:=0;
  FArrChoiceRekv[0].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[0].FieldName:='NAME_ZAGS';
  FArrChoiceRekv[0].sPadeg:='П';

  FArrChoiceRekv[1].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[1].FieldName:='IZMEN';

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

destructor TfmZAGS_SprRast.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZAGS_SprRast.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmZAGS_SprRast.GetVid: String;
begin
  Result := 'ZAGS_SprRast';
end;

function TfmZAGS_SprRast.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentIZMEN.AsString:=EmptyIzm;

//  cbBelorus.Checked:=false;
//  if lAppend then begin
//    CheckRnGorod;
//  end;
  inherited NewDok(lAppend);

  QueryExit:=false;
  Result := true;
end;

function TfmZAGS_SprRast.ReadDok(nID: Integer): Boolean;
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
procedure TfmZAGS_SprRast.WriteSoato(fld:TField);
begin
end;

//------------------------------------------------------------------------
function TfmZAGS_SprRast.WriteDok: Boolean;
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

procedure TfmZAGS_SprRast.UpdateActions;
begin
  inherited;
end;

procedure TfmZAGS_SprRast.dsDokumentDataChange(Sender: TObject;
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

function TfmZAGS_SprRast.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
end;

procedure TfmZAGS_SprRast.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmZAGS_SprRast.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmZAGS_SprRast.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZAGS_SprRast.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZAGS_SprRast.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZAGS_SprRast.CheckOnlyGod;
begin
end;

procedure TfmZAGS_SprRast.CheckOnlyGodR;
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

procedure TfmZAGS_SprRast.edGT_RNGORODNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZAGS_SprRast.CheckRnGorod;
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

procedure TfmZAGS_SprRast.cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZAGS_SprRast.cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR;
end;

procedure TfmZAGS_SprRast.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmZAGS_SprRast.CreateSubMenuRun: Boolean;
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

procedure TfmZAGS_SprRast.CheckControl;
begin
//
end;

procedure TfmZAGS_SprRast.cbBrakClick(Sender: TObject);
begin
  CheckControl;
end;

procedure TfmZAGS_SprRast.TBItemChoiceRastClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  lCheck : Boolean;
  ParamFlt:TParamFieldFlt;
  nID:Integer;
begin
  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_RAST');
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

        DokumentZAP_NOMER.AsString:=GetValueFieldEx(arrRec, 'NOMER','');
        DokumentZAP_DATE.AsDateTime:=GetValueFieldEx(arrRec, 'DATEZ', 0);

        DokumentIZMEN.AsString:=dmBase.ReadPropSimpleDok(_TypeObj_ZRast, nID, STOD('1899-12-30',tdAds), 'IZMEN', ftMemo);
        if DokumentIZMEN.AsString=''
          then DokumentIZMEN.AsString:=EmptyIzm;

//        DokumentIZMEN.AsString:=GetValueFieldEx(arrRec, 'IZMEN','');
//        if DokumentIZMEN.AsString=''
//          then DokumentIZMEN.AsString:=EmptyIzm;

        DokumentNAME_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','П',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

//        if dmBase.tbZapisRast.Locate('ID', GetValueFieldEx(arrRec, 'ID',0),[]) then begin
//           DokumentADRESAT.AsString := DokumentFAMILIA.AsString+' '+DokumentNAME.AsString+' '+DokumentOTCH.AsString+' #'+
//                           dmBase.GetAdresAkt3(dmBase.tbZapisRast,
//                          'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_B_RN;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R',1);
//        end;

      finally
        Screen.Cursor := old;
        dbEnableControls(Dokument,lCheck);
      end;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
end;

function TfmZAGS_SprRast.EmptyIzm: String;
begin
  Result:=SprRast_EmptyIzm;  // uProject
end;

procedure TfmZAGS_SprRast.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;

end.
