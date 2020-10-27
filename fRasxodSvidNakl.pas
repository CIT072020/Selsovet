unit fRasxodSvidNakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, funcPr, dbFunc,
  Dialogs, fSimpleD, kbmMemTable, kbmMemCSVStreamFormat, ImgList, FR_DSet, uProject, uTypes,
  FR_DBSet, DB, vchDBCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGridEh,
  ExtCtrls, DBCtrlsEh, Mask, TB2Item, TB2Dock, TB2Toolbar, DBLookupEh,
  ZipForge;

type
  TfmRasxodSvidNakl = class(TfmSimpleD)
    DokumentID_ZAGS: TIntegerField;
    DokumentNOMER: TStringField;
    DokumentDATE_DOK: TDateField;
    DokumentKOMU: TStringField;
    DokumentKOGO: TStringField;
    DokumentDOVER_NOMER: TStringField;
    DokumentDOVER_DATE: TDateField;
    DokumentOTP_RAZR: TStringField;
    DokumentOTP_PROIZV: TStringField;
    DokumentPOLUCH: TStringField;
    tbList: TkbmMemTable;
    tbListNPP: TAutoIncField;
    tbListTYPE_BLANK: TIntegerField;
    tbListV_KOLKN: TIntegerField;
    tbListV_SERIA: TStringField;
    tbListV_NOMER1: TStringField;
    tbListV_NOMER2: TStringField;
    tbListP_KOLKN: TIntegerField;
    tbListP_SERIA: TStringField;
    tbListP_NOMER1: TStringField;
    tbListP_NOMER2: TStringField;
    edDateDok: TDBDateTimeEditEh;
    edKomu: TDBEditEh;
    edKogo: TDBEditEh;
    edDoverNomer: TDBEditEh;
    edDoverDate: TDBDateTimeEditEh;
    DokumentOTP_RAZR_DOLG: TStringField;
    DokumentOTP_PROIZV_DOLG: TStringField;
    DokumentPOLUCH_DOLG: TStringField;
    gbOtpRazr: TGroupBox;
    edOtpRazr: TDBEditEh;
    Label7: TLabel;
    edOtpRazrDolg: TDBEditEh;
    Label10: TLabel;
    gbOtpProizv: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edOtpProizv: TDBEditEh;
    edOtpProizvDolg: TDBEditEh;
    gbPoluch: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    edPoluch: TDBEditEh;
    edPoluchDolg: TDBEditEh;
    edNomer: TDBEditEh;
    GridList: TDBGridEh;
    DataSource: TDataSource;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText1: TStaticText;
    edOrg: TDBComboBoxEh;
    Panel1: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    gbOtpRazr2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edOtpRazr2: TDBEditEh;
    edOtpRazrDolg2: TDBEditEh;
    DokumentOTP_RAZR2: TStringField;
    DokumentOTP_RAZR_DOLG2: TStringField;
    procedure edKogoEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edOtpProizvEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edOtpRazrEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure edKomuUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edPoluchUpdateData(Sender: TObject; var Handled: Boolean);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure GridListColumns2EditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edOtpRazr2EditButtons0Click(Sender: TObject;          var Handled: Boolean);
    procedure edOrgUpdateData(Sender: TObject; var Handled: Boolean);
  private
  public
    FDate     : TDateTime;
    FTypeSvid : Integer;
    FSeria    : String;
    FNomer1   : String;
    FNomer2   : String;
    FIDZAGS   : Integer;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
    function GetNomers(var n1,n2 : Integer) : Boolean;
    procedure LoadFromIni; override;
    function Transact_Rasxod(nID:Integer):Boolean;
    procedure UpdateActions; override;
  end;


  function EditRasxodSvidNakl(nID : Integer) : Boolean;

var
  fmRasxodSvidNakl: TfmRasxodSvidNakl;

implementation

uses dBase, fMain, fShablon, uSaveMemTable, MetaTask, OpisEdit, NewDialogs;

{$R *.dfm}

function EditRasxodSvidNakl(nID : Integer) : Boolean;
var
  lRefresh:Boolean;
begin
//  result := true;
  lRefresh:=nID<0;
  fmRasxodSvidNakl:=TfmRasxodSvidNakl.Create(nil);
  try
    with fmRasxodSvidNakl do begin
      IsReadDokument:=true;
      TBItemZAGS.Visible:=false;
      TBToolbarOrgan.Visible:=false;
      if nID=-1 then begin
        NewDok(true);
//      CheckEnabledNameOrgan(true);
      end else begin
        ReadDok( nID );
//      CheckEnabledNameOrgan(false);
        TBToolbarOrgan.Visible:=false;
      end;
      IsReadDokument:=false;
      QueryExit:=false;
      Result:=EditModal;
      if lRefresh then
        RefreshGurnal('fmGurnNakl');
    end;
  finally
    fmRasxodSvidNakl.Free;
    fmRasxodSvidNakl:=nil;
  end;
end;

{ TfmRasxodSvidNakl }

constructor TfmRasxodSvidNakl.Create(Owner: TComponent);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  inherited;
 // FDokZAGS := true;
  FCheckLookupField:=false;
  dmBase.SetDateFormat(tbList);
  if not tbList.Active then tbList.Active:=true;
  if not Dokument.Active then Dokument.Active:=true;
  TypeObj := dmBase.TypeObj_RasxNaklSvid;
  FAutoNum := false; //IsAutoNumZAGS;
  FMainTable := dmBase.tbDokuments;
  FPageControl := nil;
  SetcbBel(nil);
  CreatefrxDBdataSet(self,tbList,'tbList','Список');
//  TBSubmenuGISUN.Visible:=false;
  dmBase.SetDateFormat(tbList);

  dmBase.GetListOrganZAGS(edOrg.Items, edOrg.KeyItems,1);

  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS');
  for i:=0 to Opis.Items.Count-1 do begin
    GridList.FieldColumns['TYPE_BLANK'].PickList.Add(Opis.Items[i]);
    GridList.FieldColumns['TYPE_BLANK'].KeyList.Add(Opis.KeyList[i]);
  end;

  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_SERIA_SVID');
  for i:=0 to Opis.Items.Count-1 do begin
    GridList.FieldColumns['V_SERIA'].PickList.Add(Opis.Items[i]);
    GridList.FieldColumns['P_SERIA'].PickList.Add(Opis.Items[i]);
    GridList.FieldColumns['V_SERIA'].KeyList.Add(Opis.KeyList[i]);
    GridList.FieldColumns['P_SERIA'].KeyList.Add(Opis.KeyList[i]);
  end;

  GridList.FieldColumns['V_NOMER1'].EditMask:=EM_NomerSvid;
  GridList.FieldColumns['V_NOMER2'].EditMask:=EM_NomerSvid;
  GridList.FieldColumns['P_NOMER1'].EditMask:=EM_NomerSvid;
  GridList.FieldColumns['P_NOMER2'].EditMask:=EM_NomerSvid;

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);


  SetLength(FArrChoiceRekv,3);

  FArrChoiceRekv[0].nType:=SHABLON_SPEC;
  FArrChoiceRekv[0].FieldName:='KOGO';
  FArrChoiceRekv[1].nType:=SHABLON_SPEC;
  FArrChoiceRekv[1].FieldName:='POLUCH';
  FArrChoiceRekv[2].nType:=SHABLON_SPEC_DOLG;
  FArrChoiceRekv[2].FieldName:='POLUCH_DOLG';

end;

destructor TfmRasxodSvidNakl.Destroy;
begin
//
  inherited;
end;

function TfmRasxodSvidNakl.GetVid: String;
begin
  Result := 'RasxodSvidNakl';
end;

procedure TfmRasxodSvidNakl.UpdateActions;
begin
  inherited;
  //
end;

function TfmRasxodSvidNakl.NewDok(lAppend: Boolean): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  tbList.EmptyTable;

  DokumentDATE_DOK.AsDateTime:=dmBase.getCurDate;

//  DokumentPOVTOR.AsBoolean:=false;
//  DokumentCOPIA.AsBoolean:=false;

  inherited NewDok(lAppend);

  QueryExit:=false;
  Result := true;
end;

function TfmRasxodSvidNakl.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
begin
  Result := true;
  FRun:=true;
  FRead:=true;
  if not FMainTable.Locate('ID_AUTO', nID, []) then begin
    Result := false;
    FRun:=false;
    exit;
  end;
//  NewDok(false);

  //------- читаем карточку -----------
  Dokument.EmptyTable;
  tbList.EmptyTable;
  LoadMemTableFromStr(FMainTable.FieldByName('SUBJECT').AsString,
                      ['DOKUMENT', Dokument, 'LIST', tbList],FMainTable.FieldByName('FIELD_DELIMITER').AsString,nil);


  tbList.First;
  Dokument.First;
  Dokument.Edit;

  for i:=0 to FMainTable.FieldCount-1 do begin
    strField := FMainTable.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, FMainTable.Fields[i]);
    end;
  end;
  DokumentID.AsInteger:=FMainTable.FieldByName('ID_AUTO').AsInteger;
//  SetIDZags;

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
  FRun:=false;
  FRead:=false;

end;

function TfmRasxodSvidNakl.WriteDok: Boolean;
var
  i, nID, n1,n2 : Integer;
  fld : TField;
  strField, strErr, strRazd,old : String;
  lNew:Boolean;
begin
  AdditiveBeforeWriteDok;
  Dokument.CheckBrowseMode;
  tbList.CheckBrowseMode;
  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
//  if DokumentDATEZ.IsNull then begin
//    strErr := ' Заполните дату. ';
//  end else if DokumentNOMER.AsString='' then begin
//    strErr := ' Заполните номер. ';
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства о смерти. ';
  if DokumentID_ZAGS.AsInteger=0 then begin
    strErr := ' Выберите орган ЗАГС. ';
  end else if (DokumentNOMER.AsString='') or (DokumentDATE_DOK.AsString='') then begin
    strErr := ' Заполните номер и дату накладной. ';
  end;

  if strErr<>'' then begin
    PutError(strErr, self);
    Result := false;
    exit;
  end;

  tbList.First;
  while not tbList.Eof do begin
    if tbListTYPE_BLANK.AsInteger=0 then begin
      strErr := strErr+#13+' Заполните тип бланка. ';
    end;
    if tbListV_SERIA.AsString='' then begin
      strErr := strErr+#13+' Заполните серию бланка. ';
    end;
    try
      FNomer1   := tbListV_NOMER1.AsString;
      FNomer2   := tbListV_NOMER2.AsString;
      GetNomers(n1,n2);
    except
      strErr := strErr+#13+' Ошибка заполнения номеров бланков. ';
    end;
    if strErr<>'' then begin
      PutError(strErr);
      Result := false;
      exit;
    end;
    tbList.Next;
  end;
  tbList.First;

  FRun:=true;
  nID:=0;
  lNew:=false;
  //-------------------------------------------------------
  if Result then begin
    if DokumentID.AsInteger = -1 then  begin
      lNew:=true;
      dmBase.WorkQuery.SQL.Text:='SELECT Max(ID_AUTO) FROM Dokuments';
      dmBase.WorkQuery.Open;
      nID:=dmBase.WorkQuery.Fields[0].AsInteger+1;
      dmBase.WorkQuery.Close;
      FMainTable.Append;
      FMainTable.FieldByName('ID').AsInteger:=nID;
      FMainTable.FieldByName('TYPEDOK').AsInteger:=TypeObj;
      FMainTable.FieldByName('TYPEOBJ').AsInteger:=TypeObj;
      FMainTable.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
      FMainTable.FieldByName('DATE_DOK').AsDateTime:=Date;
      FMainTable.Post;
      nID := FMainTable.FieldByName('ID_AUTO').AsInteger;
    end else begin
      lNew:=false;
      nID := DokumentID.AsInteger;
      if not FMainTable.Locate('ID_AUTO', nID, []) then begin
        Result := false;
      end;
    end;
  end;

  // запишем в базу свидетельств
  if DokumentID_ZAGS.AsInteger<>GlobalTask.ParamAsInteger('ID') then begin  // если не мой
    if Result  then begin
      if not lNew then dmBase.AdsConnection.Execute('UPDATE ListSvid SET ID_NAKL=null WHERE ID_NAKL='+IntToStr(nID));
      tbList.First;
      while not tbList.Eof do begin
        FIDZAGS   := DokumentID_ZAGS.AsInteger;
        FDate:=DokumentDATE_DOK.AsDateTime;
        FTypeSvid := tbListTYPE_BLANK.AsInteger;
        FSeria    := tbListV_SERIA.AsString;
        FNomer1   := tbListV_NOMER1.AsString;
        FNomer2   := tbListV_NOMER2.AsString;
        Result:=Transact_Rasxod(nID);
        if not Result then begin
          dmBase.AdsConnection.Execute('UPDATE ListSvid SET ID_NAKL=null WHERE ID_NAKL='+IntToStr(nID));
          if lNew then FMainTable.Delete;
          break;
        end;
        tbList.Next;
      end;
      tbList.First;
    end;
  end;

  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;

    FMainTable.Edit;
    SaveDef:=false;
    FMainTable.FieldByName('SUBJECT').AsString:=SaveMemTableToStr(['DOKUMENT', dokument, 'LIST', tbList], strRazd, nil);
    FMainTable.FieldByName('FIELD_DELIMITER').AsString:=strRazd;

    for i:=1 to FMainTable.FieldCount-1 do begin
      strField := FMainTable.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        FMainTable.Fields[i].Value := fld.Value;
      end;
    end;

    FMainTable.FieldByName('ID').AsInteger:=nID;
    FMainTable.FieldByName('TYPEDOK').AsInteger:=TypeObj;
    FMainTable.FieldByName('TYPEOBJ').AsInteger:=TypeObj;
    FMainTable.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
    if not DokumentDATE_DOK.IsNull
      then FMainTable.FieldByName('DATE_DOK').AsDateTime:=DokumentDATE_DOK.AsDateTime;
    //!!! FMainTable.FieldByName('NOMER').AsString:=IntToStr(nID); !!!  27.09.2016
    FMainTable.Post;

//    WriteDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger,
//                   STOD('1899-12-30',tdAds));


    AdditiveWriteDok;
//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);

    if Result then QueryExit:=false;
  end;

  FRun:=false;
end;
//-----------------------------------------------------------------------------------------------
function TfmRasxodSvidNakl.Transact_Rasxod(nID:Integer):Boolean;
var
  n1,n2,i,j : Integer;
  vKeyValues : Variant;
  st:TSostTable;
begin
  GetNomers(n1,n2);
  vKeyValues := VarArrayCreate( [0, 2], varOleStr );
  Result:=true;
  j:=1;
  for i:=n1 to n2 do begin
    with dmBase.ListSvid do begin
      vKeyValues[0] := FTypeSvid;
      vKeyValues[1] := FSeria;
      vKeyValues[2] := PadLInt(i,SVID_LEN,'0');;
      if Locate('SVID_TYPE;SVID_SERIA;SVID_NOMER', vKeyValues, []) then begin
        try
          Edit;
          FieldByName('DATER').AsDateTime   := FDate;
          FieldByName('AKT_NOMER').AsString := '';
          FieldByName('AKT_DATE').AsString  := '';
          FieldByName('SOST').AsInteger     := 6;        // передано в сельисполком
          FieldByName('ID_ZAGS').AsInteger  := FIdZAGS;  // ID ЗАГС куда передано
          FieldByName('ID_NAKL').AsInteger  := nID;  // ID ЗАГС куда передано
          Post;
        except
          break;
        end;
      end else begin
        if j<>2 then begin
          j:=QuestionPos('Запись в реестре свидетельств со значением: '+FSeria+' '+PadLInt(i,SVID_LEN,'0')+' не найдена',
                      '  Продолжить  ;Продолжить для всех;  Прервать  ','Ошибка проведения',1,3,qtConfirmation, self);
        end;
      end;
    end;
    if j=3 then begin
      Result:=false;
      break;
    end;
  end;
end;
//-----------------------------------------------------------------------------------------------
procedure TfmRasxodSvidNakl.edKogoEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  sDolg,sFIO,sFIO_B:String;
begin
  if ChoiceSpec(sDolg,sFIO,sFIO_B,TWinControl(Sender).Parent) then begin
    EditDataset(Dokument);
    DokumentKOGO.AsString:=sFIO;
    if DokumentOTP_PROIZV.AsString='' then begin
      DokumentOTP_PROIZV.AsString:=sFIO;
      DokumentOTP_PROIZV_DOLG.AsString:=sDolg;
    end;
  end;
end;
//-------------------------------------------------------------------------
procedure TfmRasxodSvidNakl.edOtpProizvEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  sDolg,sFIO,sFIO_B:String;
begin
  if ChoiceSpec(sDolg,sFIO,sFIO_B,TWinControl(Sender).Parent) then begin
    EditDataset(Dokument);
    DokumentOTP_PROIZV.AsString:=sFIO;
    DokumentOTP_PROIZV_DOLG.AsString:=sDolg;
    if DokumentKOGO.AsString='' then begin
      DokumentKOGO.AsString:=sFIO;
    end;
  end;
end;
//-------------------------------------------------------------------------
procedure TfmRasxodSvidNakl.edOtpRazrEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  sDolg,sFIO,sFIO_B:String;
begin
  if ChoiceSpec(sDolg,sFIO,sFIO_B,TWinControl(Sender).Parent) then begin
    EditDataset(Dokument);
    DokumentOTP_RAZR.AsString:=sFIO;
    DokumentOTP_RAZR_DOLG.AsString:=sDolg;
  end;
end;

procedure TfmRasxodSvidNakl.edOtpRazr2EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  sDolg,sFIO,sFIO_B:String;
begin
  if ChoiceSpec(sDolg,sFIO,sFIO_B,TWinControl(Sender).Parent) then begin
    EditDataset(Dokument);
    DokumentOTP_RAZR2.AsString:=sFIO;
    DokumentOTP_RAZR_DOLG2.AsString:=sDolg;
  end;
end;
//-------------------------------------------------------------------------
procedure TfmRasxodSvidNakl.edKomuUpdateData(Sender: TObject;  var Handled: Boolean);
//var
//  ed : TDbEditEh;
begin
//  if edPoluch.Text='' then begin
//    edPoluch.Text:=TDbEditEh(Sender).Text;
//  end;
end;
//-------------------------------------------------------------------------
procedure TfmRasxodSvidNakl.edPoluchUpdateData(Sender: TObject;  var Handled: Boolean);
//var
//  ed : TDbEditEh;
begin
//  if edKomu.Text='' then begin
//    edKomu.Text:=TDbEditEh(Sender).Text;
//  end;
end;

//-------------------------------------------------------------------------
function TfmRasxodSvidNakl.GetNomers(var n1, n2: Integer): Boolean;
var
  s : String;
begin
  Result := true;
  s := Trim(FNomer1);
  while Copy(s,1,1)='0' do s:=Copy(s,2,SVID_LEN);
  n1 := StrToInt(s);
  s := Trim(FNomer2);
  while Copy(s,1,1)='0' do s:=Copy(s,2,SVID_LEN);
  n2 := StrToInt(s);
end;

procedure TfmRasxodSvidNakl.DataSourceDataChange(Sender: TObject;  Field: TField);
var
  n1,n2:Integer;
  sNomer:String;
begin
  if (Field<>nil) and not FRun then begin
    FRun:=true;
    QueryExit:=true;
    n1:=0;
    n2:=0;
    if Field.FieldName='V_NOMER1' then begin
      sNomer:=PadLStr(Trim(Field.AsString),SVID_LEN,'0');
      tbListV_NOMER1.AsString:=sNomer;
      n1:=GetNomerSvid(sNomer);
      n2:=GetNomerSvid(tbListV_NOMER2.AsString);
      tbListP_NOMER1.AsString:=sNomer;
    end else if Field.FieldName='V_NOMER2' then begin
      sNomer:=PadLStr(Trim(Field.AsString),SVID_LEN,'0');
      tbListV_NOMER2.AsString:=sNomer;
      n2:=GetNomerSvid(sNomer);
      n1:=GetNomerSvid(tbListV_NOMER1.AsString);
      tbListP_NOMER2.AsString:=sNomer;
    end else if Field.FieldName='V_SERIA' then begin
      tbListP_SERIA.AsString:=Field.AsString;
    end;
    if (n1>0) and (n2>0) and (n2>=n1) then begin
      tbListV_KOLKN.AsInteger:=n2-n1+1;
      tbListP_KOLKN.AsInteger:=n2-n1+1;
    end;
    FRun:=false;
  end;
end;

procedure TfmRasxodSvidNakl.LoadFromIni;
begin
  inherited;
  if (gbPoluch.Top+gbPoluch.Height+2)>sb.Height then begin
    sb.Height:=gbPoluch.Top+gbPoluch.Height+2;
  end;
end;

procedure TfmRasxodSvidNakl.btAddChildClick(Sender: TObject);
begin
  QueryExit:=true;
  tbList.Append;
  ActiveControl:=GridList;
end;

procedure TfmRasxodSvidNakl.btDelChildClick(Sender: TObject);
begin
  if tbList.RecordCount>0 then begin
    QueryExit:=true;
    tbList.Delete;
    ActiveControl:=GridList;
  end;
end;

procedure TfmRasxodSvidNakl.GridListColumns2EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  sNomer:String;
begin
//  tbList.CheckBrowseMode;
  if (tbListTYPE_BLANK.AsString<>'') and (tbListV_SERIA.AsString<>'') then begin
    dmBase.ListSvid.IndexName:='PR_KEY';
    dmBase.ListSvid.SetRange([tbListTYPE_BLANK.AsString, tbListV_SERIA.AsString],[tbListTYPE_BLANK.AsString, tbListV_SERIA.AsString]);
    dmBase.ListSvid.Filter:='Empty(sost) or sost=0';
    dmBase.ListSvid.Filtered:=true;
    try
      sNomer:=dmBase.ListSvid.FieldByName('SVID_NOMER').AsString;
      if sNomer<>'' then begin
        EditDataSet(tbList);
        tbListV_NOMER1.AsString:=sNomer;
      end else begin
        ShowMessage('Невозможно определить.');
      end;
    finally
      dmBase.ListSvid.Filtered:=false;
      dmBase.ListSvid.Filter:='';
      dmBase.ListSvid.CancelRange;
    end;
  end else begin
    PutError('Заполните тип и серию свидетельства.')
  end;
end;


procedure TfmRasxodSvidNakl.edOrgUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if not FRun and not FRead then begin
    edKomu.Text:=edOrg.Text;
  end;
end;

end.
