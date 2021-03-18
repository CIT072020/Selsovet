unit fAlfavitZAGS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fTableGurnal, DBLookupEh, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, Db,fWarning,uTypes,
  adsdata, Menus, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, DBCtrls, uProject,
  MetaTask, OpisEdit, FuncPr, DbFunc,
  TB2Item, TB2Dock, TB2Toolbar, ImgList
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

{$I Task.inc}

type

  TLoadRecordEvent = procedure( tb : TAdsTable) of object;

  TfmAlfavitZAGS = class(TfmTableGurnal)
    TableNOMER: TIntegerField;
    TableFAMILIA: TAdsStringField;
    TableNAME: TAdsStringField;
    TableOTCH: TAdsStringField;
    TableAKT_TYPE: TSmallintField;
    TableAKT_ID: TIntegerField;
    pnFilter: TPanel;
    lbFamilia: TLabel;
    TableNAME_ZAGS: TMemoField;
    TBItemParams: TTBItem;
    edFamilia: TDBEditEh;
    TableID_ZAGS: TIntegerField;
    TableID_SOURCE: TIntegerField;
    TBItemLoad: TTBItem;
    lbType: TLabel;
    edType: TDBComboBoxEh;
    ImageList: TImageList;
    TableVOSSTAN: TBooleanField;
    TablePOL: TAdsStringField;
    TableAKT_DATEIZM: TDateField;
    TableDATEIZM: TDateTimeField;
    TableID: TAutoIncField;
    TableHANDLED: TBooleanField;
    TBItemEdit: TTBItem;
    TablePODR: TSmallintField;
    TableDAYZ: TSmallintField;
    TableMONTHZ: TSmallintField;
    TableYEARZ: TSmallintField;
    TBItemDateError: TTBItem;
    TBItemDeleteGrup: TTBItem;
    TableDATELOAD: TDateField;
    TBItemParams24: TTBItem;
    TBItemLoad24: TTBItem;
    TBItemDateError24: TTBItem;
    TBItemDeleteGrup24: TTBItem;
    TBItemEdit24: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure TBItemParamsClick(Sender: TObject);
    procedure edFamiliaChange(Sender: TObject);
    procedure TableBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edFamiliaEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure TBItemLoadClick(Sender: TObject);
    procedure edTypeEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edTypeChange(Sender: TObject);
    procedure TBItemEditClick(Sender: TObject);
    procedure TBItemDateErrorClick(Sender: TObject);
    procedure GridColumns6GetCellParams(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
    procedure GridColumns7GetCellParams(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
    procedure TBItemDeleteGrupClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBNavigator1BeforeAction(Sender: TObject;  Button: TNavigateBtn);
  private
    { Private declarations }
//    n1,n2,n3,n4 : Integer;
//    m1,m2 : Integer;
    procedure GetCellParams_AKT_ID(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GetCellParams_ZAGS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure EditButtons0Click_ZAGS(Sender: TObject; var Handled: Boolean);
  public
    FNomerCur : Boolean;
    FAutoAdd  : Boolean;
    FOnlyYear : Boolean;
    FIdZags : Integer;
    FNameZags : String;
    FTypeAkt : Integer;
    FVosstan : Integer;
    FYear : Integer;
    FLoadAll : Boolean;
    FLoadDateBegin : TDateTime;
    FLoadDateEnd   : TDateTime;
    FLoadArrTypeAkt : TArrInteger;
    FLoadAktCount   : TArrInteger;
    FSystemFilter : Boolean;
    FDelHandled:Boolean;
    FLoadRecord : TLoadRecordEvent;
    procedure CheckSystemFilter;
    procedure AddRecord;
    procedure RunLoadAlfavitZags(lAdd:Boolean);
    procedure LoadFromIni; override;
    procedure SaveToIni; override;

    procedure BeforeClearFilter; override;
    function BeforeChangeOrder : Boolean; override;
    procedure AfterChangeOrder; override;
    function EnableSeekColumn(Column : TColumnEh) : Boolean; override;
    function UserSeekColumn( Column : TColumnEh; var strSeek:String) : Boolean; override;

    procedure EditRecordForAll( tb : TAdsTable; nType : Integer);
    procedure AppendRecordForAll( tb : TAdsTable; nType : Integer; lAppend : Boolean=true );
    procedure LoadRecord_ZBrak( tb : TAdsTable );
    procedure LoadRecord_RBrak( tb : TAdsTable );
    procedure LoadRecord_ZRogd( tb : TAdsTable );
    procedure LoadRecord_ZSmert( tb : TAdsTable );
    procedure LoadRecord_ZUstOtc( tb : TAdsTable );
    procedure LoadRecord_ZUstMat( tb : TAdsTable );
    procedure LoadRecord_ZChName( tb : TAdsTable );
    procedure LoadRecord_ZAdopt( tb : TAdsTable );
    function  CheckParams : Boolean;
    procedure PrepareMenu; override;
    procedure LoadParams;
    procedure SaveParams;
    procedure TableFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure BeforeReport; override;
    procedure UpdateActions; override;
  end;

const
  COLUMN_AKT_ID  = 0;
  COLUMN_ID_ZAGS = 9;
  COLUMN_TYPEAKT = 4;

var
  fmAlfavitZAGS: TfmAlfavitZAGS;

implementation

uses fParamsAlfavit, fAddAkt, fMain, dBase, fLoadAlfavitZags, mExport;

{$R *.DFM}

function TfmAlfavitZAGS.CheckParams : Boolean;
begin
  result := true;
  if (FIdZags=0) and (FNameZags='') then begin
    PutError('Неизвестен орган ЗАГС.');
    result := false;
  end;
  if result then begin
    if FTypeAkt=0 then begin
      PutError('Неизвестен тип актовой записи.');
      result := false;
    end;
  end;
  if result then begin
    if FYear=0 then begin
      PutError('Неизвестен год актовой записи.');
      result := false;
    end;
  end;
end;

procedure TfmAlfavitZAGS.LoadParams;
var
  s : String;
begin
  FNameZAGS := '';
  FIDZags   := 0;
  FTypeAkt  := 1;
  FVosstan  := 2;
  FNomerCur := GlobalTask.GetLastValueAsBoolean('ALF_ZAGS_PAR_NOMERCUR');
  FAutoAdd  := GlobalTask.GetLastValueAsBoolean('ALF_ZAGS_PAR_AUTOADD');
  FOnlyYear := GlobalTask.GetLastValueAsBoolean('ALF_ZAGS_PAR_ONLYYEAR');

  FYear := GlobalTask.GetLastValueAsInteger('ALF_ZAGS_PAR_YEAR');
  if (FYear<1900) or (FYear>2500) then FYear:=0;

  s := GlobalTask.GetLastValueAsString('ALF_ZAGS_PAR_VOSSTAN');
  if s<>'' then begin
    try
      FVosstan := StrToInt(s);
    except
      FVosstan := 2;
    end;
  end;
  s := GlobalTask.GetLastValueAsString('ALF_ZAGS_PAR_TYPESVID');
  if s<>'' then begin
    try
      FTypeAkt := StrToInt(s);
    except
      FTypeAkt := 1;
    end;
  end;
  s := GlobalTask.GetLastValueAsString('ALF_ZAGS_PAR_ID');
  if s<>'' then begin
    if dmBase.SprNames.Locate('ID',s,[]) then begin
      FIDZags := dmBase.SprNames.FieldByName('ID').Value;
    end;
  end;
  if FIDZags=0 then begin
    s := GlobalTask.GetLastValueAsString('ALF_ZAGS_PAR_NAME');
    if s<>'' then FNameZAGS := s;
  end;
end;

procedure TfmAlfavitZAGS.SaveParams;
begin
  GlobalTask.SetLastValueAsInteger('ALF_ZAGS_PAR_TYPESVID', FTypeAkt);
  GlobalTask.SetLastValueAsInteger('ALF_ZAGS_PAR_VOSSTAN', FVosstan);
  GlobalTask.SetLastValueAsInteger('ALF_ZAGS_PAR_YEAR',FYear);
  if FIDZags=0 then begin
    GlobalTask.SetLastValueAsString('ALF_ZAGS_PAR_ID','');
    GlobalTask.SetLastValueAsString('ALF_ZAGS_PAR_NAME',FNameZags);
  end else begin
    GlobalTask.SetLastValueAsInteger('ALF_ZAGS_PAR_ID',FIDZags);
    GlobalTask.SetLastValueAsString('ALF_ZAGS_PAR_NAME','')
  end;
  GlobalTask.SetLastValueAsInteger('ALF_ZAGS_PAR_YEAR',FYear);
  GlobalTask.SetLastValueAsBoolean('ALF_ZAGS_PAR_NOMERCUR',FNomerCur);
  GlobalTask.SetLastValueAsBoolean('ALF_ZAGS_PAR_AUTOADD',FAutoAdd);
  GlobalTask.SetLastValueAsBoolean('ALF_ZAGS_PAR_ONLYYEAR',FOnlyYear);
end;

procedure TfmAlfavitZAGS.FormCreate(Sender: TObject);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  inherited;
  LoadParams;
  Grid.Columns[COLUMN_AKT_ID].OnGetCellParams:=GetCellParams_AKT_ID;
  {$IFDEF ZAGS}
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS');
    Grid.Columns[COLUMN_ID_ZAGS].Visible:=true;
    Grid.Columns[COLUMN_ID_ZAGS].OnGetCellParams:=GetCellParams_ZAGS;
    Grid.Columns[COLUMN_ID_ZAGS].EditButtons[0].OnClick:=EditButtons0Click_ZAGS;
  {$ELSE}
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_S');
    Grid.Columns[COLUMN_ID_ZAGS].Visible:=false;
  {$ENDIF}
  for i:=0 to Opis.Items.Count-1 do begin
    Grid.Columns[COLUMN_TYPEAKT].PickList.Add(Opis.Items[i]);
    Grid.Columns[COLUMN_TYPEAKT].KeyList.Add(Opis.KeyList[i]);
    edType.Items.Add(Opis.Items[i]);
    edType.KeyItems.Add(Opis.KeyList[i]);
  end;
end;

procedure TfmAlfavitZAGS.TBItemParamsClick(Sender: TObject);
var
  f : TfmParamsAlfavit;
  i : Integer;
begin
  Table.CheckBrowseMode;
  f := TfmParamsAlfavit.Create(nil);
  if FTypeAkt>0 then begin
    i:=f.edTypeSvid.KeyItems.IndexOf(IntToStr(FTypeAkt));
    if i>-1 then f.edTypeSvid.ItemIndex:=i;
  end;
  f.SetVosstan(FVosstan);
  if FIdZAGS<>0 then begin
    if dmBase.SprNames.Locate('ID', FIdZAGS, []) then begin
      f.edZAGS.Value:=FIdZAGS;
    end else begin
      f.edZAGS.Value:=null;
    end;
  end else if FNameZAGS<>'' then begin
    f.edZAGS.Value:=null;
    f.edZAGS.Text:=FNameZAGS;
  end;
  f.edYear.Value := FYear;
  f.cbOnlyYear.Checked := FOnlyYear;
  f.cbNomerCur.Checked := FNomerCur;
  f.cbAutoAdd.Checked  := FAutoAdd;
  if f.ShowModal=mrOk then begin
     FIdZags   := f.ZAGS_ID;
     FNameZags := f.ZAGS_NAME;
     FTypeAkt  := f.TypeSvid;
     FVosstan  := f.GetVosstan;
     FYear     := f.Year;
     FNomerCur := f.cbNomerCur.Checked;
     FAutoAdd  := f.cbAutoAdd.Checked;
     FOnlyYear := f.cbOnlyYear.Checked;
  end;
  f.Free;
end;

procedure TfmAlfavitZAGS.edFamiliaChange(Sender: TObject);
begin
// ???       CurrentFilter:='';

  if not FRunChange then begin
    FRunChange := true;
    if (Table.IndexName='TYPE_FIO') and (edType.Value<>null) then begin
      if edFamilia.Text='' then begin
        Table.Filter := '';
        Table.Filtered := false;
      end else begin
        Table.Filter:=AddFilter_FAMILIA_NAME('',edFamilia.Text);
        Table.Filtered := true;
      end;
    end else begin
      if edFamilia.Text='' then begin
        Table.Filter := '';
        Table.Filtered := false;
      end else begin
        Table.Filter:=AddFilter_FAMILIA_NAME('',edFamilia.Text);
        Table.Filtered:=true;
      end;
      {
      if edFamilia.Text='' then begin
        Table.Scoped := false;
      end else begin
        s:=Trim(edFamilia.Text);
        n:=Pos(' ',s);
        if n=0 then begin
          sSeek:=s;
        end else begin
          sSeek:=StringReplace(s, ' ','',[rfReplaceAll]);
        end;
        TBItemClrFlt.Enabled:=true;
        Table.Scoped     := false;
        Table.ScopeBegin := sSeek;
        Table.ScopeEnd   := sSeek;
        Table.Scoped     := true;
      end;
      }
    end;
    Table.First;
    CheckSystemFilter;
    FRunChange := false;
  end;
end;

procedure TfmAlfavitZAGS.edTypeChange(Sender: TObject);
begin
  if not FRunChange then begin
    FRunChange := true;
    if (edType.Value<>null) and (edType.ItemIndex>-1) then begin
      FClearFilterControl:=false;
      ClearFilter;
      FClearFilterControl:=true;
      Table.SetRange([edType.KeyItems[edType.ItemIndex]],[edType.KeyItems[edType.ItemIndex]]);
      EnableItem(TBItemClrFlt, true);
    end else begin
      ClearFilter;
      EnableItem(TBItemClrFlt, false);
    end;
    SetCaptionGurnal(true,'');
    CheckSystemFilter;
    FRunChange := false;
  end;
end;

procedure TfmAlfavitZAGS.edFamiliaEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edFamilia.Text:='';
  CheckSystemFilter;
end;

procedure TfmAlfavitZAGS.edTypeEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edFamilia.Text:='';
  edType.Value:='';
  edType.ItemIndex := -1;
  CheckSystemFilter;
end;

procedure TfmAlfavitZAGS.CheckSystemFilter;
begin
  if (edType.ItemIndex=-1) and (edFamilia.Text='')
    then FSystemFilter:=false
    else FSystemFilter:=true;
end;

procedure TfmAlfavitZAGS.EditButtons0Click_ZAGS(Sender: TObject;  var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_NAMEORG');
  if Opis<>nil then begin
    v := TableID_ZAGS.Value;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      EditDataSet(Table);
      TableID_ZAGS.Value := v;
    end;
  end;
end;

procedure TfmAlfavitZAGS.TableBeforePost(DataSet: TDataSet);
var
  strErr : String;
  d:TDateTime;
begin
  if TableAKT_TYPE.IsNull then begin
    strErr := 'Заполните тип актовой записи.';
  end;
  if TableDAYZ.AsInteger>0 then begin  // вводим полную дату
    try
      d:=Encodedate(TableYEARZ.AsInteger, TableMONTHZ.AsInteger, TableDAYZ.AsInteger);
    except
      d:=0;
    end;
    if d=0 then begin
      strErr:='Ошибка ввода даты.';
    end;
  end;
  if strErr<>'' then begin
    PutError(strErr,self);
    abort;
  end else begin
    TableDATEIZM.AsDateTime:=Now;
    if TableNAME_ZAGS.AsString<>'' then begin
      TableID_ZAGS.AsString:='0';
    end;
  end;
end;

procedure TfmAlfavitZAGS.AddRecord;
var
  lOk : Boolean;
begin
  if not CheckParams then exit;
  fmAddAkt := TfmAddAkt.Create(Self);
  fmAddAkt.edYear.Value:=FYear;
  if FOnlyYear then begin
    fmAddAkt.edMonth.Enabled := false;
    fmAddAkt.edDay.Enabled   := false;
    fmAddAkt.lbMonth.Enabled := false;
    fmAddAkt.lbDay.Enabled   := false;
  end;
  fmAddAkt.CheckDefault;
  if FTypeAkt=_TypeObj_ZRogd then begin
    if FVosstan=2 then begin
      fmAddAkt.lbVosstan.Visible:=false;
      fmAddAkt.cbVosstan.Visible:=true;
      fmAddAkt.cbVosstan.Enabled:=true;
//      fmAddAkt.cbVosstan.Checked:=false;
      fmAddAkt.cbVosstan.Checked:=GlobalTask.GetLastValueAsBoolean('ALF_ZAGS_PAR_LAST_VOSSTAN');
    end else begin
      fmAddAkt.cbVosstan.Visible:=false;
      fmAddAkt.cbVosstan.Enabled:=false;
      if FVosstan=1 then begin
        fmAddAkt.cbVosstan.Checked:=true;
        fmAddAkt.lbVosstan.Top:=fmAddAkt.cbVosstan.Top;
        fmAddAkt.lbVosstan.Visible:=true;
      end else begin
        fmAddAkt.lbVosstan.Visible:=false;
        fmAddAkt.cbVosstan.Checked:=false;
      end;
    end;
  end else begin
    fmAddAkt.lbVosstan.Visible:=false;
    fmAddAkt.cbVosstan.Visible:=false;
    fmAddAkt.cbVosstan.Checked:=false;
  end;
  lOk := true;
  while lOk do begin
    if TableFAMILIA.AsString<>'' then fmAddAkt.edFamilia.Text:=TableFAMILIA.AsString;
    fmAddAkt.edName.Text:='';
    fmAddAkt.edOtch.Text:='';
    fmAddAkt.edNomer.Text:='';
    fmAddAkt.edDay.Value:=null;
    fmAddAkt.edMonth.Value:=null;
    fmAddAkt.edYear.Value:=FYear;
    if FNomerCur then begin
      if TableNOMER.AsString<>''   then fmAddAkt.edNomer.Text:=TableNOMER.AsString;
      if not FOnlyYear then begin
        if TableMONTHZ.AsString<>''  then fmAddAkt.edMonth.Text:=TableMONTHZ.AsString;
        if TableDAYZ.AsString<>''    then fmAddAkt.edDay.Text:=TableDAYZ.AsString;
      end;
    end;           
    if fmAddAkt.ShowModal=mrOk then begin
      Table.Append;
      with fmAddAkt do begin
        TableFAMILIA.AsString := fmAddAkt.edFamilia.Text;
        TableNAME.AsString    := fmAddAkt.edName.Text;
        TableOTCH.AsString    := fmAddAkt.edOtch.Text;
        TableAKT_TYPE.AsInteger := FTypeAkt;
        TableNOMER.AsString   := fmAddAkt.edNomer.Text;
        TableYEARZ.AsInteger  := FYear;
        TableDATEIZM.AsDateTime:=Now;
        TableDATELOAD.AsString:='';
        if fmAddAkt.edMonth.Text<>'' then TableMONTHZ.AsString := fmAddAkt.edMonth.Text;
        if fmAddAkt.edDay.Text<>''   then TableDAYZ.AsString   := fmAddAkt.edDay.Text;
        if FIdZags>0 then begin
          TableID_ZAGS.AsInteger  := FIdZags;
        end else begin
          TableNAME_ZAGS.AsString := FNameZags;
        end;
        TableAKT_ID.AsInteger   := 0;
        TableID_SOURCE.AsInteger:= 0;
        TableVOSSTAN.AsBoolean := fmAddAkt.cbVosstan.Checked;
      end;
      Table.Post;
      lOk := FAutoAdd;
    end else begin
      lOk := false;
    end;
  end;
  GlobalTask.SetLastValueAsBoolean('ALF_ZAGS_PAR_LAST_VOSSTAN', fmAddAkt.cbVosstan.Checked);
  fmAddAkt.Free;
end;

procedure TfmAlfavitZAGS.DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then begin
    AddRecord;
    abort;
  end;
end;

procedure TfmAlfavitZAGS.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key=VK_INSERT then begin
    AddRecord;
    Key:=0;
  end;
//
end;

procedure TfmAlfavitZAGS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//
end;


procedure TfmAlfavitZAGS.TBItemLoadClick(Sender: TObject);
var
  lRun : Boolean;
begin
  lRun := false;
  fmLoadAlfavitZags:=TfmLoadAlfavitZags.Create(Self);
  if fmLoadAlfavitZags.ShowModal = mrOk then begin
    FLoadAll        := fmLoadAlfavitZags.rbAll.Checked;
    FLoadDateBegin  := fmLoadAlfavitZags.edDateBegin.Value;
    FLoadDateEnd    := fmLoadAlfavitZags.edDateEnd.Value;
    FLoadArrTypeAkt := Copy(fmLoadAlfavitZags.arrType); //,0,Length(fmLoadAlfavitZags.arrType));
    FDelHandled     := fmLoadAlfavitZags.cbHand.Checked;
    lRun := true;
  end;
  fmLoadAlfavitZags.Free;
  if lRun then begin
    RunLoadAlfavitZags(true);
  end;
end;

procedure TfmAlfavitZAGS.EditRecordForAll( tb : TAdsTable; nType : Integer );
begin
  AppendRecordForAll(tb, nType, false);
end;

//--------------------------------------------------------------------------------
procedure TfmAlfavitZAGS.AppendRecordForAll( tb : TAdsTable; nType : Integer; lAppend : Boolean);
var
  fld : TField;
begin
  if lAppend
    then Table.Append
    else Table.Edit;
  TableHANDLED.AsBoolean  := false;
  TableAKT_TYPE.AsInteger := nType;
  TableDATEIZM.AsDateTime := Now;  //!!!
  TableDATELOAD.AsString  := '';   //!!!
  TableAKT_ID.AsInteger   := tb.FieldByName('ID').AsInteger;
  TableAKT_DATEIZM.AsDateTime := tb.FieldByName('DATEIZM').AsDateTime;
  TableID_SOURCE.AsInteger:= tb.FieldByName('ID_SOURCE').AsInteger;
  TableNOMER.AsString     := tb.FieldByName('NOMER').AsString;

  TableYEARZ.AsString    := FormatDateTime('YYYY',tb.FieldByName('DATEZ').AsDateTime);
  TableMONTHZ.AsString   := FormatDateTime('MM',tb.FieldByName('DATEZ').AsDateTime);
  TableDAYZ.AsString     := FormatDateTime('DD',tb.FieldByName('DATEZ').AsDateTime);

  TableID_ZAGS.AsInteger  := tb.FieldByName('ID_ZAGS').AsInteger;
  TableNAME_ZAGS.AsString := tb.FieldByName('NAME_ZAGS').AsString;
  TablePODR.AsString := tb.FieldByName('PODR').AsString;
  fld := tb.FindField('VOSSTAN');
  if fld=nil then begin
    TableVOSSTAN.AsBoolean := false;
  end else begin
    TableVOSSTAN.AsBoolean := fld.AsBoolean;
  end;
end;

procedure TfmAlfavitZAGS.LoadRecord_ZAdopt(tb: TAdsTable);
begin
  AppendRecordForAll(tb, dmBase.TypeObj_ZAdopt);
  TableFAMILIA.AsString   := tb.FieldByName('FAMILIADO').AsString;
  TableNAME.AsString      := tb.FieldByName('NAMEDO').AsString;
  TableOTCH.AsString      := tb.FieldByName('OTCHDO').AsString;
  TablePOL.AsString       := tb.FieldByName('POL').AsString;
  Table.Post;
  if (tb.FieldByName('FAMILIADO').AsString<>tb.FieldByName('FAMILIAPOSLE').AsString) or
     (tb.FieldByName('NAMEDO').AsString<>tb.FieldByName('NAMEPOSLE').AsString) or
     (tb.FieldByName('OTCHDO').AsString<>tb.FieldByName('OTCHPOSLE').AsString) then begin
    AppendRecordForAll(tb, dmBase.TypeObj_ZAdopt);
    TableFAMILIA.AsString   := tb.FieldByName('FAMILIAPOSLE').AsString;
    TableNAME.AsString      := tb.FieldByName('NAMEPOSLE').AsString;
    TableOTCH.AsString      := tb.FieldByName('OTCHPOSLE').AsString;
    TablePOL.AsString       := tb.FieldByName('POL').AsString;
    Table.Post;
  end;
end;

procedure TfmAlfavitZAGS.LoadRecord_ZChName(tb: TAdsTable);
begin
  AppendRecordForAll(tb, dmBase.TypeObj_ZChName);
  TableFAMILIA.AsString   := Trim(tb.FieldByName('FAMILIADO').AsString);
  TableNAME.AsString      := tb.FieldByName('NAMEDO').AsString;
  TableOTCH.AsString      := tb.FieldByName('OTCHDO').AsString;
  TablePOL.AsString       := tb.FieldByName('POL').AsString;
  Table.Post;
  if (tb.FieldByName('FAMILIADO').AsString<>tb.FieldByName('FAMILIAPOSLE').AsString) or
     (tb.FieldByName('NAMEDO').AsString<>tb.FieldByName('NAMEPOSLE').AsString) or
     (tb.FieldByName('OTCHDO').AsString<>tb.FieldByName('OTCHPOSLE').AsString) then begin
    AppendRecordForAll(tb, dmBase.TypeObj_ZChName);
    TableFAMILIA.AsString   := Trim(tb.FieldByName('FAMILIAPOSLE').AsString);
    TableNAME.AsString      := tb.FieldByName('NAMEPOSLE').AsString;
    TableOTCH.AsString      := tb.FieldByName('OTCHPOSLE').AsString;
    TablePOL.AsString       := tb.FieldByName('POL').AsString;
    Table.Post;
  end;
end;

procedure TfmAlfavitZAGS.LoadRecord_ZUstOtc(tb: TAdsTable);
begin
  AppendRecordForAll(tb, dmBase.TypeObj_ZUstOtc);
  TableFAMILIA.AsString   := Trim(tb.FieldByName('FAMILIADO').AsString);
  TableNAME.AsString      := tb.FieldByName('NAMEDO').AsString;
  TableOTCH.AsString      := tb.FieldByName('OTCHDO').AsString;
  TablePOL.AsString       := tb.FieldByName('POL').AsString;
  Table.Post;
  if (AnsiUpperCase(tb.FieldByName('FAMILIADO').AsString)<>AnsiUpperCase(tb.FieldByName('FAMILIAPOSLE').AsString)) or
     (AnsiUpperCase(tb.FieldByName('NAMEDO').AsString)<>AnsiUpperCase(tb.FieldByName('NAMEPOSLE').AsString)) or
     (AnsiUpperCase(tb.FieldByName('OTCHDO').AsString)<>AnsiUpperCase(tb.FieldByName('OTCHPOSLE').AsString)) then begin
    AppendRecordForAll(tb, dmBase.TypeObj_ZUstOtc);
    TableFAMILIA.AsString   := Trim(tb.FieldByName('FAMILIAPOSLE').AsString);
    TableNAME.AsString      := tb.FieldByName('NAMEPOSLE').AsString;
    TableOTCH.AsString      := tb.FieldByName('OTCHPOSLE').AsString;
    TablePOL.AsString       := tb.FieldByName('POL').AsString;
    Table.Post;
  end;
end;

procedure TfmAlfavitZAGS.LoadRecord_ZUstMat(tb: TAdsTable);
begin
  AppendRecordForAll(tb, dmBase.TypeObj_ZUstMat);
  TableFAMILIA.AsString   := Trim(tb.FieldByName('FAMILIADO').AsString);
  TableNAME.AsString      := tb.FieldByName('NAMEDO').AsString;
  TableOTCH.AsString      := tb.FieldByName('OTCHDO').AsString;
  TablePOL.AsString       := tb.FieldByName('POL').AsString;
  Table.Post;
  if (tb.FieldByName('FAMILIADO').AsString<>tb.FieldByName('FAMILIAPOSLE').AsString) or
     (tb.FieldByName('NAMEDO').AsString<>tb.FieldByName('NAMEPOSLE').AsString) or
     (tb.FieldByName('OTCHDO').AsString<>tb.FieldByName('OTCHPOSLE').AsString) then begin
    AppendRecordForAll(tb, dmBase.TypeObj_ZUstMat);
    TableFAMILIA.AsString   := Trim(tb.FieldByName('FAMILIAPOSLE').AsString);
    TableNAME.AsString      := tb.FieldByName('NAMEPOSLE').AsString;
    TableOTCH.AsString      := tb.FieldByName('OTCHPOSLE').AsString;
    TablePOL.AsString       := tb.FieldByName('POL').AsString;
    Table.Post;
  end;
end;

procedure TfmAlfavitZAGS.LoadRecord_ZRogd(tb: TAdsTable);
begin
  AppendRecordForAll(tb, dmBase.TypeObj_ZRogd);
  TableFAMILIA.AsString   := Trim(tb.FieldByName('FAMILIA').AsString);
  TableNAME.AsString      := tb.FieldByName('NAME').AsString;
  TableOTCH.AsString      := tb.FieldByName('OTCH').AsString;
  TablePOL.AsString       := tb.FieldByName('POL').AsString;
  Table.Post;
end;

procedure TfmAlfavitZAGS.LoadRecord_ZSmert(tb: TAdsTable);
begin
  AppendRecordForAll(tb, dmBase.TypeObj_ZSmert);
  TableFAMILIA.AsString   := Trim(tb.FieldByName('FAMILIA').AsString);
  TableNAME.AsString      := tb.FieldByName('NAME').AsString;
  TableOTCH.AsString      := tb.FieldByName('OTCH').AsString;
  TablePOL.AsString       := tb.FieldByName('POL').AsString;
  Table.Post;
end;

procedure TfmAlfavitZAGS.LoadRecord_ZBrak( tb : TAdsTable );
begin
  AppendRecordForAll(tb, dmBase.TypeObj_ZBrak);
  TableFAMILIA.AsString   := Trim(tb.FieldByName('ON_FAMILIA').AsString);
  TableNAME.AsString      := tb.FieldByName('ON_NAME').AsString;
  TableOTCH.AsString      := tb.FieldByName('ON_OTCH').AsString;
  TablePOL.AsString       := 'М';
  Table.Post;
  if AnsiUpperCase(tb.FieldByName('ON_FAMILIA').AsString)<>AnsiUpperCase(tb.FieldByName('ON_FAMILIAP').AsString) then begin
    AppendRecordForAll(tb, dmBase.TypeObj_ZBrak);
    TableFAMILIA.AsString   := Trim(tb.FieldByName('ON_FAMILIAP').AsString);
    TableNAME.AsString      := tb.FieldByName('ON_NAME').AsString;
    TableOTCH.AsString      := tb.FieldByName('ON_OTCH').AsString;
    TablePOL.AsString       := 'М';
    Table.Post;
  end;
  AppendRecordForAll(tb, dmBase.TypeObj_ZBrak);
  TableFAMILIA.AsString   := Trim(tb.FieldByName('ONA_FAMILIA').AsString);
  TableNAME.AsString      := tb.FieldByName('ONA_NAME').AsString;
  TableOTCH.AsString      := tb.FieldByName('ONA_OTCH').AsString;
  TablePOL.AsString       := 'Ж';
  Table.Post;
  if AnsiUpperCase(tb.FieldByName('ONA_FAMILIA').AsString)<>AnsiUpperCase(tb.FieldByName('ONA_FAMILIAP').AsString) then begin
    AppendRecordForAll(tb, dmBase.TypeObj_ZBrak);
    TableFAMILIA.AsString   := Trim(tb.FieldByName('ONA_FAMILIAP').AsString);
    TableNAME.AsString      := tb.FieldByName('ONA_NAME').AsString;
    TableOTCH.AsString      := tb.FieldByName('ONA_OTCH').AsString;
    TablePOL.AsString       := 'Ж';
    Table.Post;
  end;
end;

procedure TfmAlfavitZAGS.LoadRecord_RBrak( tb : TAdsTable );
begin
  AppendRecordForAll(tb, dmBase.TypeObj_ZRast);
  TableFAMILIA.AsString   := Trim(tb.FieldByName('ON_FAMILIA').AsString);
  TableNAME.AsString      := tb.FieldByName('ON_NAME').AsString;
  TableOTCH.AsString      := tb.FieldByName('ON_OTCH').AsString;
  TablePOL.AsString       := 'М';
  Table.Post;
  if AnsiUpperCase(tb.FieldByName('ON_FAMILIA').AsString)<>AnsiUpperCase(tb.FieldByName('ON_FAMILIAP').AsString) then begin
    AppendRecordForAll(tb, dmBase.TypeObj_ZRast);
    TableFAMILIA.AsString   := Trim(tb.FieldByName('ON_FAMILIAP').AsString);
    TableNAME.AsString      := tb.FieldByName('ON_NAME').AsString;
    TableOTCH.AsString      := tb.FieldByName('ON_OTCH').AsString;
    TablePOL.AsString       := 'М';
    Table.Post;
  end;
  AppendRecordForAll(tb, dmBase.TypeObj_ZRast);
  TableFAMILIA.AsString   := Trim(tb.FieldByName('ONA_FAMILIA').AsString);
  TableNAME.AsString      := tb.FieldByName('ONA_NAME').AsString;
  TableOTCH.AsString      := tb.FieldByName('ONA_OTCH').AsString;
  TablePOL.AsString       := 'Ж';
  Table.Post;
  if AnsiUpperCase(tb.FieldByName('ONA_FAMILIA').AsString)<>AnsiUpperCase(tb.FieldByName('ONA_FAMILIAP').AsString) then begin
    AppendRecordForAll(tb, dmBase.TypeObj_ZRast);
    TableFAMILIA.AsString   := Trim(tb.FieldByName('ONA_FAMILIAP').AsString);
    TableNAME.AsString      := tb.FieldByName('ONA_NAME').AsString;
    TableOTCH.AsString      := tb.FieldByName('ONA_OTCH').AsString;
    TablePOL.AsString       := 'Ж';
    Table.Post;
  end;
end;

{$IFDEF ADD_ZAGS}
//---------------------------------------------------------------------
procedure TfmAlfavitZAGS.RunLoadAlfavitZags(lAdd:Boolean);
var
  i,n,m : Integer;
  s,ss,old,sItog : String;
  tb : TAdsTable;
  fldID_ZAGS : TField;
  myID_ZAGS : Integer;
  nYearB,nMonthB,nDayB,nYearE,nMonthE,nDayE : Word;
begin
  TBItemClrFltClick(nil);
  if lAdd
    then ss := 'Загрузка актовых записей '
    else ss := 'Удаление актовых записей ';
  s  := 'об установлении отцовства';
  sItog:='';
  OpenMessage(ss+' '+s+' ...','',10);
  ChangeMessage(ss);
  Application.ProcessMessages;
  old := Table.IndexName;
  Table.DisableControls;
  SetLength(FLoadAktCount,Length(FLoadArrTypeAkt));
  m:=0;
  fldID_ZAGS:=nil;
  tb:=nil;
  try
    for i:=0 to Length(FLoadArrTypeAkt)-1 do begin
      FLoadAktCount[i]:=0;
      if FLoadArrTypeAkt[i]=dmBase.TypeObj_ZBrak then begin
        tb := dmBase.tbZapisBrak;
        FLoadRecord := LoadRecord_ZBrak;
        s := 'о браке';
      end else if FLoadArrTypeAkt[i]=dmBase.TypeObj_ZRast then begin
        tb := dmBase.tbZapisRast;
        FLoadRecord := LoadRecord_RBrak;
        s := 'о разводе';
      end else if FLoadArrTypeAkt[i]=dmBase.TypeObj_ZRogd then begin
        tb := dmBase.tbZapisRogd;
        FLoadRecord := LoadRecord_ZRogd;
        s := 'о рождении';
      end else if FLoadArrTypeAkt[i]=dmBase.TypeObj_ZSmert then begin
        tb := dmBase.tbZapisSmert;
        FLoadRecord := LoadRecord_ZSmert;
        s := 'о смерти';
      end else if FLoadArrTypeAkt[i]=dmBase.TypeObj_ZUstOtc then begin
        tb := dmBase.tbZapisUstOtc;
        FLoadRecord := LoadRecord_ZUstOtc;
        s := 'об установлении отцовства';
      end else if FLoadArrTypeAkt[i]=dmBase.TypeObj_ZUstMat then begin
        tb := dmBase.tbZapisUstMat;
        FLoadRecord := LoadRecord_ZUstMat;
        s := 'об установлении материнства';
      end else if FLoadArrTypeAkt[i]=dmBase.TypeObj_ZChName then begin
        tb := dmBase.tbZapisChName;
        FLoadRecord := LoadRecord_ZChName;
        s := 'о перемене имени';
      end else if FLoadArrTypeAkt[i]=dmBase.TypeObj_ZAdopt then begin
        tb := dmBase.tbZapisAdopt;
        FLoadRecord := LoadRecord_ZAdopt;
        s := 'об усыновлении';
      end;
      DecodeDate(FLoadDateBegin,nYearB,nMonthB,nDayB);
      DecodeDate(FLoadDateEnd,nYearE,nMonthE,nDayE);
      FLoadDateBegin := EncodeDate(nYearB,nMonthB,1);
      FLoadDateEnd   := EncodeDate(nYearE,nMonthE,CountDays(nYearE,nMonthE));
      ChangeMessage(ss+' '+s+' ...');
      Application.ProcessMessages;
      //-----------------------------------------------
      if lAdd then begin
        tb.IndexName := 'DATEZ';
//      tb.IndexFieldNames := 'DATEZ';
        tb.AdsTableOptions.AdsScopeOptions:=RESPECT_SCOPES_WHEN_COUNTING;
        tb.SetRange([FLoadDateBegin],[FLoadDateEnd]);
//      ShowMessage(tb.TableName+'  '+IntToStr(tb.recordCount));
        tb.AdsTableOptions.AdsScopeOptions:=IGNORE_SCOPES_WHEN_COUNTING;
        fldID_ZAGS := tb.FieldByName('ID_ZAGS');
      end;
      //-----------------------------------------------
      myID_ZAGS  := GlobalTask.ParamAsInteger('ID');
      //--------- удалим ранее загруженные записи -----
      try
        Table.IndexName:='FOR_DELETE';     // HANDLED;AKT_TYPE;YEARZ;MONTHZ
//        Table.IndexFieldNames:='HANDLED;AKT_TYPE;YEARZ;MONTHZ';

        Table.SetRange([false,FLoadArrTypeAkt[i],nYearB,nMonthB],[false,FLoadArrTypeAkt[i],nYearE,nMonthE]);
        if FLoadAll then begin
          while not Table.Eof do begin
            Table.Delete;
            m:=m+1;
          end;
        end else begin
          while not Table.Eof do begin
            if TableID_ZAGS.AsInteger=myID_ZAGS then begin
              Table.Delete;
              m:=m+1;
            end else begin
              Table.Next;
            end;
          end;
        end;

        if FDelHandled then begin  // удалять введенные вручную
          Table.SetRange([true,FLoadArrTypeAkt[i],nYearB,nMonthB],[true,FLoadArrTypeAkt[i],nYearE,nMonthE]);
          if FLoadAll then begin
            while not Table.Eof do begin
              Table.Delete;
              m:=m+1;
            end;
          end else begin
            while not Table.Eof do begin
              if TableID_ZAGS.AsInteger=myID_ZAGS then begin
                Table.Delete;
                m:=m+1;
              end else begin
                Table.Next;
              end;
            end;
          end;
          //---------------------------------------------------------
          //  !!! если введен только год !!!   (MONTHZ=0 and DAYZ=0)
          if (nMonthB=1) and (nMonthE=12) then begin   // если в параметрах удаления с 1 по 12 месяц
            Table.SetRange([true,FLoadArrTypeAkt[i],nYearB,0],[true,FLoadArrTypeAkt[i],nYearE,0]);
            if FLoadAll then begin
              while not Table.Eof do begin
                Table.Delete;
                m:=m+1;
              end;
            end else begin
              while not Table.Eof do begin
                if TableID_ZAGS.AsInteger=myID_ZAGS then begin
                  Table.Delete;
                  m:=m+1;
                end else begin
                  Table.Next;
                end;
              end;
            end;
          end;
          //---------------------------------------------------------

        end;

      finally
        Table.CancelRange;
        Table.First;
      end;
      //-----------------------------------------------
      if lAdd then begin
        Table.BeforePost:=nil;
        try
          n:=0;
          while not tb.Eof do begin
            if FLoadAll or (fldID_ZAGS.AsInteger=myID_ZAGS) then begin
              FLoadRecord(tb);
            end;
            Inc(n,1);
            tb.Next;
          end;
          sItog:=sItog+'  '+s+'  '+IntToStr(n)+chr(13)+chr(10);
        finally
          tb.CancelRange;
          Table.BeforePost:=TableBeforePost;
        end;
      end;
      //-----------------------------------------------
    end;
  finally
    CloseMessage;
    Table.IndexName:=old;
    Table.First;
    Table.EnableControls;
    if lAdd
      then  ShowMessage('Загружено записей актов'+chr(13)+chr(10)+sItog)
      else  ShowMessage('Удалено строк: '+IntToStr(m));
  end;
end;
{$ELSE}
procedure TfmAlfavitZAGS.RunLoadAlfavitZags(lAdd:Boolean);
begin end;
{$ENDIF}

procedure TfmAlfavitZAGS.GetCellParams_AKT_ID(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if TableHANDLED.AsBoolean
    then Params.ImageIndex:=0
    else Params.ImageIndex:=1;
end;

procedure TfmAlfavitZAGS.GetCellParams_ZAGS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if EditMode then begin

  end else begin
    if TableID_ZAGS.IsNull or (TableID_ZAGS.AsString='0') then begin
      Params.Text := TableNAME_ZAGS.AsString;
    end else begin
      if TableNAME_ZAGS.AsString='' then begin
        if dmBase.SprNames.Locate('ID', TableID_ZAGS.AsInteger, []) then begin
          Params.Text := dmBase.SprNames.FieldByName('NAME').AsString;
        end else begin
          Params.Text := TableID_ZAGS.AsString;
        end;
      end else begin
        Params.Text := TableNAME_ZAGS.AsString;
      end;
    end;
  end;
end;

procedure TfmAlfavitZAGS.LoadFromIni;
begin
  inherited LoadFromIni;
  Grid.Columns[COLUMN_AKT_ID].Title.Caption:='';
end;

procedure TfmAlfavitZAGS.SaveToIni;
begin
  SaveParams;
  inherited SaveToIni;
end;


procedure TfmAlfavitZAGS.TBItemEditClick(Sender: TObject);
var
  slPar:TStringList;
//  fld:TField;
  dsAkt:TDataSet;
begin
  if TableAKT_ID.AsInteger=0 then begin
    PutError(' Запись введена вручную. ',self);
  end else begin
    dsAkt:=dmBase.MainTableFromTypeObj(TableAKT_TYPE.AsInteger);
    if (dsAkt<>nil) and dsAkt.Locate('ID', TableAKT_ID.AsInteger, []) then begin
//      fld:=dsAkt.FindField('VOSSTAN');
      slPar:=nil;
//      if (fld<>nil) and (fld.AsBoolean=true) then begin
//        slPar:=TStringList.Create;
//        slPar.Add('VOSSTAN=1');
//      end;
      fmMain.EditDokument( Table, TableAKT_TYPE.AsInteger, 'AKT_ID', slPar, false, KodGurnal);
    end else begin
      PutError(' Запись акта не найдена. ',self);
    end;
  end;
end;

//--------------------------------------------
function TfmAlfavitZAGS.BeforeChangeOrder: Boolean;
begin
  edFamilia.Text:='';
  edType.Value  :='';
  edType.ItemIndex := -1;
  CheckSystemFilter;
  Result := true;
end;

procedure TfmAlfavitZAGS.AfterChangeOrder;
begin
  if Table.IndexName='FIO' then begin
    pnFilter.Visible := true;
    edFamilia.Visible:=true;
    lbFamilia.Visible:=true;
    edType.Visible:=false;
    lbType.Visible:=false;
    lbFamilia.Left := 11;
    edFamilia.Left := lbFamilia.Left+lbFamilia.Width+11;
  end else if Table.IndexName='TYPE_FIO' then begin
    pnFilter.Visible := true;
    edFamilia.Visible:=true;
    lbFamilia.Visible:=true;
    edType.Visible:=true;
    lbType.Visible:=true;
    lbType.Left := 11;
    edType.Left := 160;
    lbFamilia.Left := 450;
    edFamilia.Left := 520;
  end else begin
    pnFilter.Visible := false;
  end;
end;

function TfmAlfavitZAGS.EnableSeekColumn(Column: TColumnEh): Boolean;
var
  strName : String;
begin
  Result := true;
  strName := UpperCase(Column.FieldName);
  if (strName='NAME_ZAGS') or (strName='FAMILIA') or (strName='AKT_TYPE')
    then Result:=false;
end;

function TfmAlfavitZAGS.UserSeekColumn(Column: TColumnEh; var strSeek:String): Boolean;
begin
  Result := inherited UserSeekColumn(Column,strSeek);
end;

procedure TfmAlfavitZAGS.BeforeClearFilter;
begin
  edFamilia.Text:='';
  if FClearFilterControl then begin
    edType.Value:=null;
    edType.ItemIndex:=-1;
  end;
  Table.Scoped:=false;
  Table.ScopeBegin:='';
  Table.ScopeEnd:='';
  Table.CancelRange;
  CurrentFilter:='';
  Table.OnFilterRecord:=nil;
  FSysFltCaption:='';
end;

procedure TfmAlfavitZAGS.UpdateActions;
begin
  inherited UpdateActions;
end;

procedure TfmAlfavitZAGS.TBItemDateErrorClick(Sender: TObject);
begin
  Table.OnFilterRecord:=TableFilterRecord;
  Table.Filtered := true;
//  TBItemClrFlt.Enabled:=true;
  EnableItem(TBItemClrFlt, true);
  FSysFltCaption:='[ВКЛ.СИСТЕМ.ОТБОР]';
  SetCaptionGurnal(false,'');
end;        

procedure TfmAlfavitZAGS.TableFilterRecord(DataSet: TDataSet;  var Accept: Boolean);
var
  nDay,nMonth:Integer;
begin
  nDay:=TableDAYZ.AsInteger;
  if nDay=0 then nDay:=1;
  nMonth:=TableMONTHZ.AsInteger;
  if nMonth=0 then nMonth:=1;
  Accept:=false;
  try
    EncodeDate(TableYEARZ.AsInteger,nMonth,nDay);
  except
    Accept:=true;
  end;
end;

procedure TfmAlfavitZAGS.GridColumns6GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text='0' then Params.Text:='';
  end;
end;

procedure TfmAlfavitZAGS.GridColumns7GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text='0' then Params.Text:='';
  end;
end;

procedure TfmAlfavitZAGS.TBItemDeleteGrupClick(Sender: TObject);
var
  lRun : Boolean;
  s:String;
begin
  lRun := false;
  fmLoadAlfavitZags:=TfmLoadAlfavitZags.Create(nil);
  fmLoadAlfavitZags.Caption:='Введеите параметры УДАЛЕНИЯ';
  if fmLoadAlfavitZags.ShowModal = mrOk then begin
    FLoadAll        := fmLoadAlfavitZags.rbAll.Checked;
    FLoadDateBegin  := fmLoadAlfavitZags.edDateBegin.Value;
    FLoadDateEnd    := fmLoadAlfavitZags.edDateEnd.Value;
    FLoadArrTypeAkt := Copy(fmLoadAlfavitZags.arrType); //,0,Length(fmLoadAlfavitZags.arrType));
    FDelHandled     := fmLoadAlfavitZags.cbHand.Checked;
    lRun := true;
  end;
  fmLoadAlfavitZags.Free;
  if lRun then begin
    s := '';
    s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
    s := s + 'Будет выполнено групповое удаление из '#13;
    s := s + 'алфавитной киги.'#13;
    s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
    s := s + 'введите слово ДА в поле ввода'#13;
    if  OkWarning(s) then begin
      RunLoadAlfavitZags(false);
    end;
  end;
end;

procedure TfmAlfavitZAGS.BeforeReport;
begin
  if pnFilter.Visible and (edType.ItemIndex>-1)
    then Globaltask.SetLastValueAsString('ALFAVIT_TYPE_AKT',edType.KeyItems[edType.ItemIndex])
    else Globaltask.SetLastValueAsString('ALFAVIT_TYPE_AKT','');
end;

procedure TfmAlfavitZAGS.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if TableVOSSTAN.AsBoolean then AFont.Color := COLOR_VOSSTAN;
end;

procedure TfmAlfavitZAGS.PrepareMenu;
begin
  CheckTbItems;
  pnFilter.Visible:=true;
end;

end.
