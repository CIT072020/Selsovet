unit fActions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  TB2Item, TB2Dock, TB2Toolbar, ExtCtrls, funcPr, dbFunc, mPermit,
  fMain, dBase, uProject, ActnList,fmStringSeek,kbmMemTable,OpisEdit,Metatask,
  DB, Grids, DBGridEh;

type
  TfmActions = class(TForm)
    pnActions: TPanel;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItemSave: TTBItem;
    TBItemExit: TTBItem;
    Grid: TDBGridEh;
    DataSource: TDataSource;
    tbClr: TTBItem;
    TBSubmenuIndex: TTBSubmenuItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItemCopy: TTBItem;
    TBItemAdd: TTBItem;
    procedure TBItemExitClick(Sender: TObject);
    procedure TBItemSaveClick(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure GridTitleBtnClick(Sender: TObject; ACol: Integer;  Column: TColumnEh);
    procedure tbClrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItemCopyClick(Sender: TObject);
    procedure GridColumnMoved(Sender: TObject; FromIndex,  ToIndex: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure TBItemAddClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreateTmpIndex(lDel:Boolean);
    procedure ChoiceTableName;
  public
    FQueryExit:Boolean;
    procedure Init(al : TActionList; ds : TDataSet);
  end;

var
  fmActions: TfmActions;

implementation

{$R *.dfm}

procedure TfmActions.Init(al:TActionList; ds:TDataSet);
var
  c:TColumnEh;
begin
  DataSource.DataSet:=ds;
  c:=Grid.FieldColumns['SUBSYSTEM'];

  c.KeyList.Add(IntToStr(SS_HOZ_UCHET));
  c.PickList.Add('Хозяйственный учет');

  c.KeyList.Add(IntToStr(SS_VUS));
  c.PickList.Add('ВУС');

  c.KeyList.Add(IntToStr(SS_PASP));
  c.PickList.Add('Паспортный стол');

  c.KeyList.Add(IntToStr(SS_ZAGS));
  c.PickList.Add('ЗАГС');

  c.KeyList.Add(IntToStr(SS_OBRACH));
  c.PickList.Add('Учет документов');

  c.KeyList.Add(IntToStr(SS_SMDO));
  c.PickList.Add('СМДО');

  c.KeyList.Add(IntToStr(SS_SMDO_RUN));
  c.PickList.Add('Отправить,получить');

  c.KeyList.Add(IntToStr(SS_ZAH));
  c.PickList.Add('Учет захоронений');

  c.KeyList.Add(IntToStr(SS_OCHERED));
  c.PickList.Add('Учет очередников');

  c.KeyList.Add(IntToStr(SS_ZAH));
  c.PickList.Add('Учет захоронений');

  c.KeyList.Add(IntToStr(SS_SPR));
  c.PickList.Add('Справочники');

// !!! пока SS_HOZ_UCHET !!!
// c.KeyList.Add(IntToStr(SS_OPEKA));
//  c.PickList.Add('Опека и попечительство');

  c.KeyList.Add(IntToStr(SS_PAR));
  c.PickList.Add('Параметры');

  c.KeyList.Add(IntToStr(SS_LOCALPAR));
  c.PickList.Add('Локальные параметры');

  c.KeyList.Add(IntToStr(SS_OTCHET));
  c.PickList.Add('Отчеты');

  c.KeyList.Add(IntToStr(SS_ADMIN));
  c.PickList.Add('Администратор');

  c.KeyList.Add(IntToStr(SS_SYSDBA));
  c.PickList.Add('ВЦ');

  c:=Grid.FieldColumns['TYPEOBJ'];
  c.KeyList.Add(SST_ACTION);
  c.PickList.Add('Акции');
  c.KeyList.Add(SST_MENU);
  c.PickList.Add('Меню');
  c.KeyList.Add(SST_TABLE);
  c.PickList.Add('Таблица');
  c.KeyList.Add(SST_FORM);
  c.PickList.Add('Форма');
{
  c:=Grid.FieldColumns['TABLENAME'];
  dmBase.WorkQuery.SQL.Text:='SELECT name FROM system.tables';
  dmBase.WorkQuery.Open;
  while not dmBase.WorkQuery.Eof do begin
    c.PickList.Add(dmBase.WorkQuery.Fields[0].AsString);
    dmBase.WorkQuery.Next;
  end;
  dmBase.WorkQuery.Close;
}
  FQueryExit:=false;
  CreateTmpIndex(false);
  TkbmMemTable(ds).IndexFieldNames:='SUBSYSTEM;NOMER;TYPEOBJ';
  ds.First;
end;

procedure TfmActions.TBItemExitClick(Sender: TObject);
begin
  if FQueryExit then begin
    if Problem(' Сохранить изменения ? ') then begin
      ModalResult:=mrOk;
    end else begin
      ModalResult:=mrCancel;
    end;
  end else begin
    ModalResult:=mrCancel;
  end;
end;

procedure TfmActions.TBItemSaveClick(Sender: TObject);
begin
  DataSource.DataSet.Filter:='';
  DataSource.DataSet.Filtered:=false;
  Application.ProcessMessages;
  ModalResult:=mrOk;
end;

procedure TfmActions.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  if Field<>nil then begin
    FQueryExit:=true;
  end;
end;

procedure TfmActions.GridTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
var
  lReopen : Boolean;
begin
  DataSource.DataSet.DisableControls;
  if SetGridSeekColumn(Column, true, '', lReopen, nil) then begin
//    strNameFilter:='ФИЛЬТР';
    tbClr.Visible := true;
    DataSource.DataSet.EnableControls;
  end else begin
    DataSource.DataSet.EnableControls;
  end;
end;

procedure TfmActions.tbClrClick(Sender: TObject);
begin
  DataSource.DataSet.Filter:='';
  DataSource.DataSet.Filtered:=false;
end;

procedure TfmActions.FormCreate(Sender: TObject);
begin
  tbClr.Visible := false;
end;

procedure TfmActions.FormDestroy(Sender: TObject);
begin
  TkbmMemtable(DataSource.DataSet).DeleteIndex('mtActionsTmpIndex');
end;


procedure TfmActions.TBItem1Click(Sender: TObject);
begin
 TkbmMemtable(DataSource.DataSet).IndexName:='mtActionsIndex1';
 TBItem1.Checked:=true;
 TBItem2.Checked:=false;
 Grid.FieldColumns['SUBSYSTEM'].Index:=0;
 Grid.FieldColumns['NOMER'].Index:=1;
 Grid.FieldColumns['TYPEOBJ'].Index:=2;
 Grid.FieldColumns['KOD'].Index:=3;
 Grid.FieldColumns['NAME'].Index:=4;
end;

procedure TfmActions.TBItem2Click(Sender: TObject);
begin
  TkbmMemtable(DataSource.DataSet).IndexName:='mtActionsIndex2';
  TBItem1.Checked:=false;
  TBItem2.Checked:=true;
  Grid.FieldColumns['TYPEOBJ'].Index:=0;
  Grid.FieldColumns['KOD'].Index:=1;
  Grid.FieldColumns['NAME'].Index:=2;
  Grid.FieldColumns['SUBSYSTEM'].Index:=3;
  Grid.FieldColumns['NOMER'].Index:=4;
end;

procedure TfmActions.TBItemCopyClick(Sender: TObject);
var
  arrRec : TCurrentRecord;
  strBookmark:String;
begin
  if ActiveControl is TDbGridEh then begin
    if not Grid.DataSource.DataSet.IsEmpty then begin
      if not Grid.EditorMode then begin
        strBookmark:=Grid.DataSource.DataSet.Bookmark;
        GetCurrentRecord(Grid.DataSource.DataSet, '', arrRec);
        AddCurrentRecord(Grid.DataSource.DataSet, arrRec);
        Grid.DataSource.DataSet.Bookmark:=strBookmark;
//        Grid.SelectedIndex:=Grid.VisibleColumns.Items[0].Index;
      end;
    end;
  end;
end;

procedure TfmActions.GridColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
begin
  CreateTmpIndex(true);
end;

procedure TfmActions.CreateTmpIndex(lDel:Boolean);
var
  i:Integer;
  strIndex:String;
begin
  strIndex:='';
  for i:=0 to Grid.Columns.Count-1 do begin
    if (Grid.Columns[i].Field.FieldName<>'NAME') and (Grid.Columns[i].Field.FieldName<>'NEW') then begin
      strIndex:=strIndex+Grid.Columns[i].Field.FieldName+';';
    end;
  end;
  if lDel then begin
    TkbmMemtable(DataSource.DataSet).DeleteIndex('mtActionsTmpIndex');
  end;
  TkbmMemtable(DataSource.DataSet).AddIndex('mtActionsTmpIndex',strIndex,[]);
  TkbmMemtable(DataSource.DataSet).IndexName:='mtActionsTmpIndex';
  TkbmMemtable(DataSource.DataSet).First;
end;

procedure TfmActions.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=VK_SPACE then begin
    if not Grid.EditorMode and (UpperCase(Grid.SelectedField.FieldName)='KOD') then begin
//      ChoiceTableName;
    end;
  end;
end;

procedure TfmActions.ChoiceTableName;
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  SetLength(arrRec,1);
  v := null;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_NAMETABLES');
  if Opis <> nil then begin
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      if v <> null then begin
        if not ( (DataSource.DataSet.State=dsEdit) or (DataSource.DataSet.State=dsInsert)) then begin
          DataSource.DataSet.Edit;
        end;
        DataSource.DataSet.FieldByName('KOD').AsString:=VarToStr(v);
        DataSource.DataSet.FieldByName('NAME').AsString:=GetValueField(arrRec,'NAME');
      end;
    end;
  end;
end;

procedure TfmActions.TBItemAddClick(Sender: TObject);
begin
  if not Grid.EditorMode and (UpperCase(Grid.SelectedField.FieldName)='KOD') then begin
    ChoiceTableName;
  end;
end;

end.
