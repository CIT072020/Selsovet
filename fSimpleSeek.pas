unit fSimpleSeek;

interface

uses
  Windows, CommCtrl, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dBase, fMain, DateUtils,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrlsEh, TB2Item, TB2Dock, AddEvents, AdsTable, dbFunc, FuncPr, uTypes,
  TB2Toolbar, DB, DBLookupEh, ComCtrls, kbmMemTable, Grids, DBGridEh;

type
  TfmSimpleSeek = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItemSeek: TTBItem;
    TBItemCancel: TTBItem;
    TBItemChoice: TTBItem;
    TBItemRefresh: TTBItem;
    FoundRecord: TDBGridEh;
    dsSeek: TDataSource;
    tbSeek: TkbmMemTable;
    tbSeekID: TIntegerField;
    cbType: TComboBox;
    tbSeekFIO: TStringField;
    tbSeekNOMER: TStringField;
    tbSeekADRES: TStringField;
    edSeek: TDBEditEh;
    tbSeekLIC_ID: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure TBItemCancelClick(Sender: TObject);
    procedure TBItemSeekClick(Sender: TObject);
    procedure TBItemChoiceClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edTypeAktUpdateData(Sender: TObject; var Handled: Boolean);
    procedure FoundRecord_Compare(Sender: TObject; Item1, Item2: TListItem;   Data: Integer; var Compare: Integer);
    procedure FoundRecord_ColumnClick(Sender: TObject; Column: TListColumn);
    procedure FoundRecord_DblClick(Sender: TObject);
    procedure TBItemRefreshClick(Sender: TObject);
    procedure edSeekChange(Sender: TObject);
    procedure edTypeAktChange(Sender: TObject);
    procedure FoundRecordDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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

  function SimpleSeekMen(var arrRec:TCurrentRecord):Integer;

implementation

uses Metatask, OpisEdit;

{$R *.dfm}

function SimpleSeekMen(var arrRec:TCurrentRecord):Integer;
var
  f: TfmSimpleSeek;
  n: Integer;
begin
  f:=TfmSimpleSeek.Create(nil);
  f.ShowModal;
  Result:=f.FResult;
  if (Length(arrRec)>0) and (f.FResult>0) then begin
    f.GetArrRec(arrRec);
  end;
  f.Free;
end;

procedure TfmSimpleSeek.TBItemSeekClick(Sender: TObject);
var
  t:TAdsTable;
  tb:TDataSet;
  s,sSQL,strFilter,strName,strName2:String;
//  st:TSostTable;
begin
  if cbType.ItemIndex=0 then begin
    t:=dmBase.tbMens;
  end else begin
    t:=dmBase.tbLich;
  end;
//  if edTypeAkt.Value=_TypeObj_ZRogd then s:=',VOSSTAN' else s:='';
//  sSQL:='SELECT ID '+s+' FROM '+t.TableName+' WHERE date_fiks='+dmbase. getDate +sSQL;
  tb:=dmBase.WorkQuery;
  dmBase.WorkQuery.SQL.Text:=sSQL;
  OpenMessage('   Поиск записи ...   ');
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
    tbSeekID.AsInteger:=tb.FieldByName('ID').AsInteger;
    tbSeekADRES.AsString:='';
    tbSeekNOMER.AsString:='';
    tbSeekNOMER.AsString:='';
    tbSeek.Post;
    tb.Next;
  end;
  dmBase.WorkQuery.Close;

//  RestSostTable(tb,st);
  tbSeek.First;
  if FCount=0 then begin
    ShowMessage('  Ничего не найдено.  ');
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

    //FoundRecord.ItemIndex:=0;
    ActiveControl:=FoundRecord;
  end;
end;

//-------------------------------------------------------------------
procedure TfmSimpleSeek.FormCreate(Sender: TObject);
var
  Opis : TOpisEdit;
  i:Integer;
begin
//  SetWindowLong(FoundRecord.Handle, GWL_STYLE, GetWindowLong(FoundRecord.Handle, GWL_STYLE) or LVS_NOSCROLL);
  SortedColumn := 1;
  Descending := true;
end;

procedure TfmSimpleSeek.TBItemCancelClick(Sender: TObject);
begin
  FResult:=0;
  ModalResult:=mrCancel;
end;

procedure TfmSimpleSeek.TBItemChoiceClick(Sender: TObject);
var
  slPar:TStringList;
begin
//  if FoundRecord.Selected<>nil then begin
//    FResult:=FArrID[FoundRecord.Selected.Index];
//  if tbSeekID.AsInteger>0 then begin
//    FResult:=tbSeekID.AsInteger;
//    ModalResult:=mrOk;
//  end;
//    slPar:=TStringList.Create;
//    slPar.Add('ENABLE_SKIP=1');
//    slPar.Add('SKIP_POINTER='+IntToStr(Integer(tbSeek)));
//  end else begin
//    slPar:=nil;
//  end;
  fmMain.EditDokument(tbSeek, dmBase.TypeObj_Lich,'LIC_ID',nil,true,'');

//  try
//    if slPar<>nil then FreeAndNil(slPar);
//  except
//  end;
end;
//--------------------------------------------------------------------------
procedure TfmSimpleSeek.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
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
procedure TfmSimpleSeek.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmSimpleSeek.edTypeAktUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  FResult:=0;
  Check;
end;

procedure TfmSimpleSeek.edSeekChange(Sender: TObject);
begin
  Check;
end;

procedure TfmSimpleSeek.Check;
begin
  if (edSeek.Text<>'') then begin
    TBItemSeek.Enabled:=true;
  end else begin
    TBItemSeek.Enabled:=false;
  end;
end;

procedure TfmSimpleSeek.FoundRecord_Compare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else if SortedColumn > 0 then
    Compare := CompareText(Item1.SubItems[SortedColumn-1],
                           Item2.SubItems[SortedColumn-1]);
  if Descending then Compare := -Compare;
end;

procedure TfmSimpleSeek.FoundRecord_ColumnClick(Sender: TObject;  Column: TListColumn);
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

procedure TfmSimpleSeek.FoundRecord_DblClick(Sender: TObject);
begin
  TBItemChoiceClick(Sender);
end;

procedure TfmSimpleSeek.TBItemRefreshClick(Sender: TObject);
begin
  FoundRecord.Visible:=false;
  TBItemChoice.Visible:=false;
  TBItemRefresh.Visible:=false;
  TBItemSeek.Visible:=true;
//  FoundRecord.SortType := stNone;
  ActiveControl:=edSeek;
end;

procedure TfmSimpleSeek.edTypeAktChange(Sender: TObject);
begin
  Check;
end;

procedure TfmSimpleSeek.GetArrRec(var arrRec: TCurrentRecord);
var
  tb:TAdsTable;
  strFilter,strName:String;
  st:TSostTable;
begin
  if FResult>0 then begin
    if cbType.ItemIndex=0
      then tb:=dmBase.tbMens
      else tb:=dmBase.tbLich;
    st:=SaveSostTable(tb,false,false);
    if tb.Locate('ID',FResult,[]) then begin
      GetCurrentRecord(tb,'',arrRec);
    end;
    RestSostTable(tb, st);
  end;
end;

procedure TfmSimpleSeek.FoundRecordDblClick(Sender: TObject);
begin
  TBItemChoiceClick(Sender);
end;

procedure TfmSimpleSeek.FormDestroy(Sender: TObject);
begin
  {  !!!   может потом доделать !!!
  if fmMain<>nil then
    fmMain.DeleteFromListGurnal(Self.Name);
  }
end;


end.
