unit fSimpleSeekAkt;

interface

uses
  Windows, CommCtrl, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dBase, fMain, DateUtils,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrlsEh, TB2Item, TB2Dock, AddEvents, AdsTable, dbFunc, FuncPr, uTypes,
  TB2Toolbar, DB, DBLookupEh, ComCtrls, kbmMemTable, Grids, DBGridEh;

type
  TfmSimpleSeekAkt = class(TForm)
    Label1: TLabel;
    edNomer: TDBNumberEditEh;
    Label2: TLabel;
    edYear: TDBNumberEditEh;
    Label3: TLabel;
    Label4: TLabel;
    edTypeAkt: TDBComboBoxEh;
    edOrgan: TDBLookupComboboxEh;
    dsOrgan: TDataSource;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItemSeek: TTBItem;
    TBItemCancel: TTBItem;
    TBItemChoice: TTBItem;
    TBItemRefresh: TTBItem;
    FoundRecord_: TListView;
    FoundRecord: TDBGridEh;
    dsSeek: TDataSource;
    tbSeek: TkbmMemTable;
    tbSeekGOD: TIntegerField;
    tbSeekNAME_ZAGS: TStringField;
    tbSeekNAME_ZAGS_2: TStringField;
    tbSeekID: TIntegerField;
    tbSeekDATEZ: TDateField;
    tbSeekVOSSTAN: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure TBItemCancelClick(Sender: TObject);
    procedure TBItemSeekClick(Sender: TObject);
    procedure TBItemChoiceClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edTypeAktUpdateData(Sender: TObject; var Handled: Boolean);
    procedure FoundRecord_Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure FoundRecord_ColumnClick(Sender: TObject; Column: TListColumn);
    procedure FoundRecord_DblClick(Sender: TObject);
    procedure TBItemRefreshClick(Sender: TObject);
    procedure edNomerChange(Sender: TObject);
    procedure edTypeAktChange(Sender: TObject);
    procedure FoundRecordDblClick(Sender: TObject);
    procedure FoundRecordGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure edOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edYearEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edOrganEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    SortedColumn: Integer;
    Descending: Boolean;
    FResult:Integer;
    FCount:Integer;
    FClearKey:Boolean;
//    FArrID:TArrInteger;
    procedure Check;
    procedure GetArrRec(var arrRec:TCurrentRecord);
  end;

  function SimpleSeekAkt(var nTypeAkt:Integer; nOrgan:Integer; nGod:Integer; nNomer:Integer; var arrRec:TCurrentRecord):Integer;

implementation

uses Metatask, OpisEdit;

{$R *.dfm}

function SimpleSeekAkt(var nTypeAkt:Integer; nOrgan:Integer; nGod:Integer; nNomer:Integer; var arrRec:TCurrentRecord):Integer;
var
  f: TfmSimpleSeekAkt;
  n: Integer;
begin
  f:=TfmSimpleSeekAkt.Create(nil);
  f.TBItemChoice.Visible:=false;
  f.TBItemRefresh.Visible:=false;
  if nTypeAkt>0 then begin  // передали по какому типу искать
    f.edTypeAkt.Value:=nTypeAkt;
    f.edTypeAkt.Enabled:=false;
  end else begin
    n:=GlobalTask.GetLastValueAsInteger('SIMPLESEEK_TYPEAKT');
    if n=0 then n:=dmBase.TypeObj_ZRogd;
    f.edTypeAkt.Value:=n;
    f.ActiveControl:=f.edTypeAkt;
  end;
  if nOrgan>0 then begin   // передали орган регистрации
    f.edOrgan.Value:=nOrgan;
    f.edOrgan.Enabled:=false;
  end else begin
    f.edOrgan.Value:=GlobalTask.ParamAsInteger('ID');
  end;
  if f.edOrgan.Text='' then f.edOrgan.Value:=null;
  if nGod>0 then begin   // передали год
    f.edYear.Value:=nGod;
    f.edYear.Enabled:=false;
  end;
  if nGod<-1 then begin   // передали год отрицательный
    f.edYear.Value:=-1*nGod;
    f.edYear.Enabled:=true;
  end;
  if nNomer>0 then begin   // передали
    f.edNomer.Value:=nNomer;
  end;
  f.ShowModal;
  Result:=f.FResult;
  if nTypeAkt=0 then begin  // не передавали по какому типу будем искать
    nTypeAkt:=StrToInt(f.edTypeAkt.KeyItems[f.edTypeAkt.ItemIndex]);
    GlobalTask.SetLastValueAsInteger('SIMPLESEEK_TYPEAKT',nTypeAkt);
  end;
  if (Length(arrRec)>0) and (f.FResult>0) then begin
    f.GetArrRec(arrRec);
  end;
  f.Free;
end;

procedure TfmSimpleSeekAkt.TBItemSeekClick(Sender: TObject);
var
  t:TAdsTable;
  tb:TDataSet;
  s,sSQL,strFilter,strName,strName2:String;
//  st:TSostTable;
begin
  t:=dmBase.MainTableFromTypeObj(edTypeAkt.Value);
  sSQL:='nomer='+VarToStr(edNomer.Value);
  if edYear.Value<>null then begin
    sSQL:=sSQL+' and Year(datez)='+VarToStr(edYear.Value);
  end;
  if edOrgan.Value<>null then begin
    sSQL:=sSQL+' and id_zags='+VarToStr(edOrgan.Value);
  end;
  if edTypeAkt.Value=_TypeObj_ZRogd then s:=',VOSSTAN' else s:='';
  sSQL:='SELECT ID, NOMER, DATEZ, ID_ZAGS, NAME_ZAGS '+s+' FROM '+t.TableName+' WHERE '+sSQL;
  tb:=dmBase.WorkQuery;
  dmBase.WorkQuery.SQL.Text:=sSQL;
  OpenMessage('   ѕоиск записи ...   ');
  try                            
    dmBase.WorkQuery.Open;
  finally
    CloseMessage;
  end;
  //  st:=SaveSostTable(tb,false,false);
// KEY_VIEW Year(DATEZ);NOMER
// NOMER    NOMER;DATEZ
{
  if edYear.Value<>null then begin
    tb.IndexName:='KEY_VIEW';
    nYear:=edYear.Value;
    showmessage(tb.IndexFieldNames);
    tb.SetRange([nYear,edNomer.Value],[nYear,edNomer.Value]);
  end else begin
    tb.IndexName:='NOMER';
    tb.SetRange([edNomer.Value],[edNomer.Value]);
  end;
  if edOrgan.Value<>null then begin
    strFilter:=strFilter+' and ID_ZAGS='+VarToStr(edOrgan.Value);
  end;
  if strFilter<>'' then strFilter:=Copy(strFilter,6,Length(strFilter));
  if strFilter<>'' then begin
    tb.Filter:=strFilter;
    tb.Filtered:=true;
  end;
  tb.First;
  }
  FCount:=0;
//  FoundRecord.Items.Clear;
  tbSeek.EmptyTable;
//  SetLength(FArrID,0);
  while not tb.Eof do begin
    FCount:=FCount+1;
    tbSeek.Append;
    strName:=dmBase.SeekValueTable2(dmBase.SprNames,'ID',tb.FieldByName('ID_ZAGS').AsString,'NAME');
    strName2:=tb.FieldByName('NAME_ZAGS').AsString;
    tbSeekNAME_ZAGS.AsString:=strName;
    if CompareText(strName,strName2)<>0 then begin
      tbSeekNAME_ZAGS_2.AsString:=strName2;
    end;
    tbSeekDATEZ.AsDateTime:=tb.FieldByName('DATEZ').AsDateTime;
    tbSeekGOD.AsInteger:=YearOf(tb.FieldByName('DATEZ').AsDateTime);
    tbSeekID.AsInteger:=tb.FieldByName('ID').AsInteger;
    if tb.FindField('VOSSTAN')<>nil
      then tbSeekVOSSTAN.AsBoolean:=tb.FieldByName('VOSSTAN').AsBoolean
      else tbSeekVOSSTAN.AsBoolean:=false;
    tbSeek.Post;
{
    with FoundRecord.Items.Add do begin
      strName:=dmBase.SeekValueTable2(dmBase.SprNames,'ID',tb.FieldByName('ID_ZAGS').AsString,'NAME');
      Caption:=strName;
      SubItems.Add(IntToStr(YearOf(tb.FieldByName('DATEZ').AsDateTime)));
    end;
    SetLength(FArrID,FCount);
    FArrID[FCount-1]:=tb.FieldByName('ID').AsInteger;
}
    tb.Next;
  end;
  dmBase.WorkQuery.Close;

//  RestSostTable(tb,st);
  tbSeek.First;
  if FCount=0 then begin
    ShowMessage('  Ќичего не найдено.  ');
  end else if FCount=1 then begin
    FResult:=tbSeekID.AsInteger;
    ModalResult:=mrOk;
  end else begin
    FoundRecord.Align:=alClient;
    FoundRecord.Visible:=true;
    {
    FoundRecord.Align:=alClient;
    FoundRecord.Visible:=true;
    FoundRecord.SortType := stText;
    }
    TBItemChoice.Visible:=true;
    TBItemRefresh.Visible:=true;
    TBItemSeek.Visible:=false;
    Caption:='«апись акта '+edTypeAkt.Items[edTypeAkt.ItemIndex]+' є'+edNomer.Text;
    //FoundRecord.ItemIndex:=0;
    ActiveControl:=FoundRecord;
  end;
end;

//-------------------------------------------------------------------
procedure TfmSimpleSeekAkt.FormCreate(Sender: TObject);
var
  Opis : TOpisEdit;
  i:Integer;
begin
//  SetWindowLong(FoundRecord.Handle, GWL_STYLE, GetWindowLong(FoundRecord.Handle, GWL_STYLE) or LVS_NOSCROLL);
  SortedColumn := 1;
  Descending := true;
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL');
  if Opis<>nil then begin
    for i:=0 to Opis.Items.Count-1 do begin
      edTypeAkt.Items.Add(Opis.Items[i]);
      edTypeAkt.KeyItems.Add(Opis.KeyList[i]);
    end;
  end;
  edYear.Value:=YearOf(dmBase.getCurDate);
end;

procedure TfmSimpleSeekAkt.TBItemCancelClick(Sender: TObject);
begin
  FResult:=0;
  ModalResult:=mrCancel;
end;

procedure TfmSimpleSeekAkt.TBItemChoiceClick(Sender: TObject);
begin
//  if FoundRecord.Selected<>nil then begin
//    FResult:=FArrID[FoundRecord.Selected.Index];
  if tbSeekID.AsInteger>0 then begin
    FResult:=tbSeekID.AsInteger;
    ModalResult:=mrOk;
  end;
end;
//--------------------------------------------------------------------------
procedure TfmSimpleSeekAkt.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Shift=[]) and (Key=VK_RETURN) and FoundRecord.Visible and (tbSeekID.AsString<>'') then begin
//    Key:=0;
//    FClearKey:=true;
    TBItemChoiceClick(Sender);
  end else begin
    if not  FoundRecord.Visible
      then Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
  end;
end;
//--------------------------------------------------------------------------
procedure TfmSimpleSeekAkt.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmSimpleSeekAkt.edTypeAktUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  FResult:=0;
  Check;
end;

procedure TfmSimpleSeekAkt.edNomerChange(Sender: TObject);
begin
  Check;
end;

procedure TfmSimpleSeekAkt.Check;
begin
  if (edTypeAkt.ItemIndex>-1) and (edNomer.Text<>'') then begin
    TBItemSeek.Enabled:=true;
  end else begin
    TBItemSeek.Enabled:=false;
  end;
end;

procedure TfmSimpleSeekAkt.FoundRecord_Compare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else if SortedColumn > 0 then
    Compare := CompareText(Item1.SubItems[SortedColumn-1],
                           Item2.SubItems[SortedColumn-1]);
  if Descending then Compare := -Compare;
end;

procedure TfmSimpleSeekAkt.FoundRecord_ColumnClick(Sender: TObject;  Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> SortedColumn then
  begin
    SortedColumn := Column.Index;
    Descending := False;
  end
  else
    Descending := not Descending;
  TListView(Sender).SortType := stText;
end;

procedure TfmSimpleSeekAkt.FoundRecord_DblClick(Sender: TObject);
begin
  TBItemChoiceClick(Sender);
end;

procedure TfmSimpleSeekAkt.TBItemRefreshClick(Sender: TObject);
begin
  FoundRecord.Visible:=false;
  TBItemChoice.Visible:=false;
  TBItemRefresh.Visible:=false;
  TBItemSeek.Visible:=true;
//  FoundRecord.SortType := stNone;
  Caption:='Ќайти актовую запись';
  ActiveControl:=edNomer;
end;

procedure TfmSimpleSeekAkt.edTypeAktChange(Sender: TObject);
begin
  Check;
end;

procedure TfmSimpleSeekAkt.GetArrRec(var arrRec: TCurrentRecord);
var
  tb:TAdsTable;
  strFilter,strName:String;
  st:TSostTable;
begin
  if FResult>0 then begin
    tb:=dmBase.MainTableFromTypeObj(edTypeAkt.Value);
    st:=SaveSostTable(tb,false,false);
    if tb.Locate('ID',FResult,[]) then begin
      GetCurrentRecord(tb,'',arrRec);
    end;
    RestSostTable(tb, st);
  end;
end;

procedure TfmSimpleSeekAkt.FoundRecordDblClick(Sender: TObject);
begin
  TBItemChoiceClick(Sender);
end;

procedure TfmSimpleSeekAkt.FoundRecordGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
                                                    State: TGridDrawState);
begin
  if tbSeekVOSSTAN.AsBoolean
    then AFont.Color:=clBlue;
end;

procedure TfmSimpleSeekAkt.edOrganEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_NAMEORG');
  if Opis<>nil then begin
    v := edOrgan.Value;
    SetLength(arrRec,0);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      edOrgan.Value:=v;
    end;
  end;
end;

procedure TfmSimpleSeekAkt.edOrganEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  edOrgan.Value:=null;
end;

procedure TfmSimpleSeekAkt.edYearEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edYear.Text:='';
end;


end.
