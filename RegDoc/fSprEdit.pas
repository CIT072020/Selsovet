unit fSprEdit; // [11.04.2005]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ImgList, DBGrids, Grids, ExtCtrls, ComCtrls, ToolWin, ActnList, StdCtrls, DB,
   ElTree, ElXPThemedControl,
   DBGridEh,
   AdsTable,
   mFindInt, {<<MessageDlgR}
   mExport,
   fExpDs,
   mAdsObj, PrnDbgeh;

type
   TfmSprEdit=class(TForm)
      alSprEdit: TActionList;
      acExit: TAction;
      acDelete: TAction;
      acView: TAction;
      acAddFolder: TAction;
      acAdd: TAction;
      acUp: TAction;
      acDown: TAction;
      tbaSprEdit: TToolBar;
      tbAddFolder: TToolButton;
      tbAdd: TToolButton;
      tbDelete: TToolButton;
      tbUp: TToolButton;
      tbDown: TToolButton;
      tbSep2: TToolButton;
      tbColView: TToolButton;
      tbSep1: TToolButton;
      tbExit: TToolButton;
      paAll: TPanel;
      spLeft: TSplitter;
      dgTable: TDBGridEh;
      tvTree: TElTree;
      imSprEdit: TImageList;
      acLeftPanel: TAction;
      tbLeftPanel: TToolButton;
      paBottom: TPanel;
      paTop: TPanel;
      btOk: TButton;
      btCancel: TButton;
      laCaption: TLabel;
      acToggleEdit: TAction;
      tbToggleEdit: TToolButton;
      acExport: TAction;
      tbExport: TToolButton;
      acPreview: TAction;
      pdgTable: TPrintDBGridEh;
      tbPreview: TToolButton;
      acEdit: TAction;
      tbEdit: TToolButton;
      acFind: TAction;
      acFindClear: TAction;
      tbFind: TToolButton;
      tbFindClear: TToolButton;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure acExitExecute(Sender: TObject);
      procedure acDeleteExecute(Sender: TObject);
      procedure acAddExecute(Sender: TObject);
      procedure acUpExecute(Sender: TObject);
      procedure acDownExecute(Sender: TObject);
      procedure acViewExecute(Sender: TObject);
      procedure acAddFolderExecute(Sender: TObject);
      procedure acToggleEditExecute(Sender: TObject);
      procedure acExportExecute(Sender: TObject);
      procedure acLeftPanelExecute(Sender: TObject);
      procedure dgTableKeyPress(Sender: TObject; var Key: Char);
      procedure dgTableDblClick(Sender: TObject);
      procedure tvTreeAfterSelectionChange(Sender: TObject);
      procedure tvTreeItemCollapse(Sender: TObject; Item: TElTreeItem);
      procedure tvTreeItemExpand(Sender: TObject; Item: TElTreeItem);
      procedure tvTreeDblClick(Sender: TObject);
      procedure acPreviewExecute(Sender: TObject);
      procedure acEditExecute(Sender: TObject);
      procedure acFindExecute(Sender: TObject);
      procedure acFindClearExecute(Sender: TObject);
   private
      FDBItem: TDBItem;
      FTableView: TTableView;
      FFormLayout: TFormLayout;
      FDataSet: TAdsTable;
      FId: TField;
      FParentId: TField;
      FIsNode: TField;
      FName: TField;
      // признак справочника имеющего древовидную структуру
      FIsTree: Boolean;
      // признак видимости левой панели (с деревом)
      FIsTreePanel: Boolean;
      // признак режима редактирования/просмотра
      FIsEdit: Boolean;
      FGoDown: Boolean;
      FCurId: Integer;
      FOrder: TField;
      // признак справочника имеющего поле задающее порядок записей
      FIsOrder: Boolean;
      FNameColumn: TColumnEh;
      // признак работы в режиме выбора значения из справочника
      FSelectValue: Boolean;
      // настройки для выгрузки таблицы в файл
      FExportColumns: TExportColumnList;
      // признак работы в режиме "только для чтения"
      FAdmOnlyRead: Boolean;
      // выполняется печать таблицы
      FIsPrinting: Boolean;
      // флаг: установлено условие отбора
      FIsFilter: Boolean;
      // если, установлено условие отбора, до в данном свойстве хранится старый фильтр
      FOldFilter: string;
   private
      procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
      procedure WMActivateApp(var Msg: TWMActivateApp); message WM_ACTIVATEAPP;
   private
      procedure SetDBItem(DBItem: TDBItem; KeyValue: string; SelectValue: Boolean);
      procedure OnUpdateName(Sender: TObject; var Text: String; var Value: Variant; var UseText, Handled: Boolean);
      procedure OnSetColView(ColView: TColView; Column: TColumnEh);
      procedure OnDrawCell(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
      procedure OnGridButtonClick(Sender: TObject; var Handled: Boolean);
      procedure BuildTree(RootNode: TElTreeItem; RootId: Integer);
      procedure SetTreeFilter(Id: Integer);
      procedure DeleteRecord;
      {procedure DeleteTreeNode;}
      procedure AddRecord;
      procedure AddFolder;
      procedure RecordUp;
      procedure RecordDown;
      procedure EditRecord;
      function InitLayout(LayoutList: TLayoutList; LayoutName: string): TFormLayout;
      procedure LoadLayout(FormLayout: TFormLayout);
      procedure SaveLayout(FormLayout: TFormLayout);
      procedure ToggleTreePanel(Show: Boolean);
      function InitTableView(ViewList: TViewList; TableViewName: string): TTableView;
      procedure ClearTableView(TableView: TTableView);
      procedure DoSelectRow;
      procedure ToggleEdit(Edit: Boolean);
      procedure ChangeCaption;
      procedure UpdateButtons;
      function FindIdNode(Id: Integer): TElTreeItem;
      procedure AdjustPosition;
      procedure DoFind(Column: TColumnEh);
   end;

procedure EditSpr(DBItem: TDBItem; AdmOnlyRead: Boolean);
function SelectSprValue(DBItem: TDBItem; var KeyValue: string; KeyFieldName: string): Boolean;

implementation
uses
   mDoc2Sel;
   
{$R *.DFM}

const
   // используемые картинки
   II_Exit            = 0;  // выход
   II_Blank           = 1;  // чистый лист
   II_FolderClose     = 2;  // закрытая папка
   II_FolderOpen      = 3;  // открытая папка
   II_FolderClosePlus = 4;  // закрытая папка с плюсом
   II_FolderUp        = 5;  // папка на уровень вверх
   II_Plus            = 6;  // плюс
   II_Minus           = 7;  // минус
   II_ArrowUp         = 8;  // стрелка вверх
   II_ArrowDown       = 9;  // стрелка вниз
   II_Edit            =10;  // редактировать
   II_Options         =11;  // настройки
   II_LeftPanel       =12;  // переключатель видимости левой панели

procedure EditSpr(DBItem: TDBItem; AdmOnlyRead: Boolean);
begin
   with TfmSprEdit.Create(nil) do begin
      try
         FAdmOnlyRead:=AdmOnlyRead;
         AdjustPosition;
         SetDBItem(DBItem, '', False);
         FTableView:=InitTableView(DBItem.ViewList, CSprEditTableView);
         UpdateButtons;
         FFormLayout:=InitLayout(DBItem.LayoutList, 'TfmSprEdit_EDIT');
         LoadLayout(FFormLayout);
         ShowModal;
         SaveLayout(FFormLayout);
         ClearTableView(FTableView);
         {**}FDataSet.Filter:=DBItem.TableFilter;
         {**}FDataSet.Filtered:=DBItem.TableFilter<>'';
         //--FDataSet.IndexName:='';
      finally
         Free;
      end;
   end;
end;

function SelectSprValue(DBItem: TDBItem; var KeyValue: string; KeyFieldName: string): Boolean;
var
   GetField: TField;
begin
   Result:=False;
   with TfmSprEdit.Create(nil) do begin
      try
         AdjustPosition;
         SetDBItem(DBItem, KeyValue, True);
         FTableView:=InitTableView(DBItem.ViewList, CSprSelectTableView);
         FFormLayout:=InitLayout(DBItem.LayoutList, 'TfmSprEdit_SELECT');
         LoadLayout(FFormLayout);
         // всегда показываем боковую панель
         ToggleTreePanel(FIsTree);
         if ShowModal=mrOk then begin
            if (not FIsTree) or (FIsNode.AsInteger=iLeaf) or FDBItem.HaveStyle(bsAllSelable) then begin
               // NB: может не стоит каждый раз искать это поле
               GetField:=FDBItem.Table.FindField(KeyFieldName);
               if GetField<>nil then begin
                  KeyValue:=GetField.AsString;
                  Result:=True;
               end;
            end;
         end;
         SaveLayout(FFormLayout);
         ClearTableView(FTableView);
         {**}FDataSet.Filter:=DBItem.TableFilter;
         {**}FDataSet.Filtered:=DBItem.TableFilter<>'';
         //--FDataSet.IndexName:='';
      finally
         Free;
      end;
   end;
end;

{ TfmSprEdit }

procedure TfmSprEdit.OnDrawCell(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
   Column: TColumnEh;
begin
   Column:=TColumnEh(Sender);
   if (FTableView<>nil) then begin
      FTableView.DefaultDrawCell(Sender, EditMode, Params);
   end;
   if (Column<>nil) and (Column=FNameColumn) then begin
      if (FDataSet.IsEmpty) or FId.IsNull then begin
         Params.ImageIndex:=-1;
      end
      else begin
         if FIsNode.AsInteger=iNode then begin
            if FId.AsInteger=FCurId then begin
               Params.ImageIndex:=II_FolderUp;
            end
            else begin
               Params.ImageIndex:=II_FolderClosePlus;
            end;
         end
         else begin
            Params.ImageIndex:=II_Blank;
         end;
      end;
   end;
   // если выполняется печать, то надо сбросить цвет и картинку
   if FIsPrinting and (Column<>nil) then begin
      Params.ImageIndex:=-1;
      Params.Background:=clWindow;
   end;
end;

procedure TfmSprEdit.OnGridButtonClick(Sender: TObject; var Handled: Boolean);
var
   ColView: TColView;
   KeyValue: string;                      
   FieldItem: TFieldItem;
begin
   ColView:=TColView(dgTable.Columns[dgTable.SelectedIndex].Tag);
   FieldItem:=ColView.FieldItem;
   if (ColView.LinkStyle=lsLinkSpr) and (ColView.LinkSpr<>nil) and (FieldItem<>nil) then begin
      KeyValue:=FieldItem.SrcField.AsString;
      if SelectSprValue(ColView.LinkSpr, KeyValue, ColView.LinkSpr.CodeFieldName) then begin
         // NB: и что тут дальше должно быть
      end;
   end;
   Handled:=True;
end;

procedure TfmSprEdit.SetDBItem(DBItem: TDBItem; KeyValue: string; SelectValue: Boolean);
var
   Root: TElTreeItem;
   //--OrderIndex: TTableIndex;
begin
   FDBItem:=DBItem;
   FSelectValue:=SelectValue;
   FDataSet:=DBItem.Table;
   // инициализация полей, если справочник имеет древовидную структуру
   if bsTree in DBItem.Style then begin
      FId:=DBItem.CodeField;
      FParentId:=DBItem.ParentIdField;
      FIsNode:=DBItem.IsNodeField;
   end
   else begin
      FId:=nil;
      FParentId:=nil;
      FIsNode:=nil;
      FName:=nil;
   end;
   FName:=DBItem.NameField;
   FIsTree:=(FId<>nil) and (FParentId<>nil) and (FIsNode<>nil) and (FName<>nil);
   // инициализация внешнего вида формы, если справочник имеет древовидную структуру
   ToggleTreePanel(FIsTree);
   if FIsTree then begin
      Root:=tvTree.Items.AddChild(nil, DBItem.Caption);
      Root.Tag:=0;
      Root.ImageIndex:=II_FolderClose;
      BuildTree(Root, 0);
      Root.Expand(False);
   end
   else begin
      // изменение вида меню
      tbAddFolder.Visible:=False;
      tbLeftPanel.Visible:=False;
      // изменение доступности вставки
      //--dgTable.AllowedOperations:=dgTable.AllowedOperations+[alopInsertEh, alopAppendEh];
   end;
   // инициализация полей, если справочник имеет порядок записей
   if bsOrder in DBItem.Style then begin
      FOrder:=DBItem.OrderField;
      //--OrderIndex:=FDBItem.IndexList.ByName('ORDER');
   end
   else begin
      FOrder:=nil;
      //--OrderIndex:=nil;
   end;
   FIsOrder:=(FOrder<>nil){-- and (OrderIndex<>nil)};
   // инициализация внешнего вида формы, если справочник имеет порядок записей
   // изменение вида меню
   if not FIsOrder then begin
      tbUp.Visible:=False;
      tbDown.Visible:=False;
   end;
   //--// устанавливаем сортировку
   //--if FIsOrder then begin
   //--   FDataSet.IndexName:=OrderIndex.IndexName;
   //--end;
   dgTable.DataSource:=DBItem.TableSource;
   // инициализация внешнего вида если:
   //  - форма предназначена только для выбора значения
   //  - форма находится в режиме "только для чтения"
   if SelectValue then begin
      // форма только для выбора значений
      tbaSprEdit.Visible:=False;
      tbToggleEdit.Visible:=False;
      laCaption.Caption:=DBItem.Caption;
      ToggleEdit(False);
   end
   else begin
      paBottom.Visible:=False;
      paTop.Visible:=False;
      btOk.Enabled:=False;
      btCancel.Enabled:=False;
      ToggleEdit(not (FDBItem.HaveStyle(bsReadOnly) or FAdmOnlyRead));
      if FDBItem.HaveStyle(bsReadOnly) or FAdmOnlyRead then begin
         tbToggleEdit.Enabled:=False;
      end;
   end;
   ChangeCaption;
   //--UpdateButtons;
end;

procedure TfmSprEdit.WMActivateApp(var Msg: TWMActivateApp);
begin
{--
   if IsIconic(Application.Handle) then begin
      ShowWindow(Application.Handle, SW_RESTORE);
   end
   else begin
      inherited;
   end;
--}
   if IsIconic(Application.Handle) then begin
      ShowWindow(Application.Handle, SW_RESTORE);
      BringToFront;
   end;
   inherited;
end;

procedure TfmSprEdit.WMSysCommand(var Msg: TWMSysCommand);
begin
   if Msg.CmdType=SC_MINIMIZE then begin
      ShowWindow(Application.Handle, SW_MINIMIZE)
   end
   else begin
      inherited;
   end;
end;

procedure TfmSprEdit.BuildTree(RootNode: TElTreeItem; RootId: Integer);
var
   Node: TElTreeItem;
begin
   if not FGoDown then begin
      FDataSet.DisableControls;
      tvTree.Items.BeginUpdate;
      try
         if RootNode<>nil then begin
            RootNode.Clear;
         end;
         SetTreeFilter(RootId);
         FDataSet.First;
         while not FDataSet.Eof do begin
            if (FIsNode.AsInteger=iNode) and (FId.AsInteger<>RootId) then begin
               Node:=tvTree.Items.AddChild(RootNode, FName.AsString);
               Node.Tag:=FId.AsInteger;
               Node.ImageIndex:=II_FolderClose;
               tvTree.Items.AddChild(Node, '');
            end;
            FDataSet.Next;
         end;
         FDataSet.First;
      finally
         tvTree.Items.EndUpdate;
         FDataSet.EnableControls;
      end;
   end;
end;

procedure TfmSprEdit.FormCreate(Sender: TObject);
begin
   FIsTree:=False;
   FIsOrder:=False;
   FGoDown:=False;
   FIsTreePanel:=False;
   FIsEdit:=True;
   FCurId:=-1;
   FAdmOnlyRead:=False;
   FExportColumns:=TExportColumnList.Create;
   FIsPrinting:=False;
   FIsFilter:=False;
   FOldFilter:='';
end;

procedure TfmSprEdit.SetTreeFilter(Id: Integer);
var
   S: string;
begin
   if Id<>-1 then FCurId:=Id;
   FDataSet.Filtered:=False;
   S:=Format('%s=%d OR %s=%d', [FDBItem.ParentIdFieldName, Id, FDBItem.CodeFieldName, Id]);
   if (FDBItem.TableFilter<>'') and (not FDBItem.HaveStyle(bsClearFilter) or FSelectValue) then begin
      if Id<>-1 then FDataSet.Filter:=Format('%s AND (%s)', [FDBItem.TableFilter, S])
      else FDataSet.Filter:=FDBItem.TableFilter;
   end
   else begin
      if Id<>-1 then FDataSet.Filter:=S
      else FDataSet.Filter:='';
   end;
   FDataSet.Filtered:=FDataSet.Filter<>'';
end;

procedure TfmSprEdit.acExitExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmSprEdit.acDeleteExecute(Sender: TObject);
begin
   DeleteRecord;
end;

procedure TfmSprEdit.DeleteRecord;
var
   RootNode: TElTreeItem;
begin
   if (not FDBItem.HaveStyle(bsConfirmDelete)) or (MessageDlgR('Удалить текущую запись?', mtConfirmation, [mbYes, mbNo], 0)=mrYes) then begin
      if FIsTree then begin
         FDBItem.Control.IsNode:=FIsNode.AsInteger;
         FDBItem.Control.ParentId:=FCurId;
      end;
      if FIsTree and (FIsNode.AsInteger=iNode) then begin
         FDataSet.DisableControls;
         try
            RootNode:=FindIdNode(FId.AsInteger);
            {--if not FDBItem.HaveStyle(bsClearFilter) then begin
               FDataSet.Filter:=FDBItem.TableFilter;
               FDataSet.Filtered:=FDBItem.TableFilter<>'';
            end;}
            FDBItem.DeleteCurrentRecord(skTable);
            if RootNode.GetPrevSibling<>nil then begin
               FCurId:=RootNode.GetPrevSibling.Tag;
            end
            else begin
               FCurId:=RootNode.Parent.Tag;
            end;
            RootNode.Delete;
            SetTreeFilter(FCurId);
            BuildTree(FindIdNode(FCurId), FCurId);
         finally
            FDataSet.EnableControls;
         end;
      end
      else begin    
         FDBItem.DeleteCurrentRecord(skTable);
      end;
      UpdateButtons;
   end;
end;

procedure TfmSprEdit.acAddExecute(Sender: TObject);
begin
   AddRecord;
end;

procedure TfmSprEdit.AddRecord;
(*
var
   LastOrder: Integer;
   S: string;
*)
begin
   if FIsTree then begin
      FDBItem.Control.IsNode:=iLeaf;
      FDBItem.Control.ParentId:=FCurId;
   end;
   if FDBItem.NewRecord then begin
      // NB: связь между формой и записью должна быть независимая
      if FDBItem.DoViewRecord(vmAdd) then begin
         FDBItem.AddRecord;
         UpdateButtons;
      end
      else begin
         FDBItem.CancelEdit;
      end;
   end;
   (*
   // NB: !!! заплатка
   S:='';
   if InputQuery('Добавить запись', 'Наименование:', S) then begin
      {-- 2010.02.10
      LastOrder:=0;
      if FIsOrder then begin
         FDataSet.Last;
         if (not FDataSet.IsEmpty) and (not FOrder.IsNull) then begin
            LastOrder:=FOrder.AsInteger;
         end;
      end;
      --}
      LastOrder:=FDBItem.GetLastOrder(FDataSet, FOrder);
      FDataSet.Append;
      if FIsTree then begin
         FParentId.AsInteger:=FCurId;
         FIsNode.AsInteger:=iLeaf;
      end
      else begin
         //-- 2010.02.10
         //FDataSet.Append;
      end;
      FName.AsString:=S;
      if FIsOrder then begin
         FOrder.AsInteger:=Succ(LastOrder);
      end;
      FDataSet.Post;
      UpdateButtons;
   end;
   *)
end;

procedure TfmSprEdit.RecordDown;
begin
   if FIsOrder and (not FDataSet.Eof) then begin
//      FDBItem.RecordDown(FDataSet, FOrder);   было  до 2020.01.14
      if (FId=nil) or (FId.AsInteger<>FCurId) then begin
         FDBItem.RecordDown(FDataSet, FOrder);
      end;
   end;
end;

procedure TfmSprEdit.RecordUp;
begin
   if FIsOrder and (not FDataSet.Bof) then begin
//      FDBItem.RecordUp(FDataSet, FOrder);     было  до 2020.01.14
      if FParentId<>nil then begin
         FDBItem.RecordUpEx(FDataSet, FOrder, FParentId);
      end
      else begin
         FDBItem.RecordUp(FDataSet, FOrder);
      end;
   end;
end;

procedure TfmSprEdit.acUpExecute(Sender: TObject);
begin
   RecordUp;
end;

procedure TfmSprEdit.acDownExecute(Sender: TObject);
begin
   RecordDown;
end;

procedure TfmSprEdit.acViewExecute(Sender: TObject);
begin
//
end;

procedure TfmSprEdit.acAddFolderExecute(Sender: TObject);
begin
   AddFolder;
end;

procedure TfmSprEdit.AddFolder;
var
   Bookmark: string;
(*
var
   S: string;
   Bookmark: string;
   LastOrder: Integer;
*)
begin
   if FIsTree then begin
      FDBItem.Control.IsNode:=iNode;
      FDBItem.Control.ParentId:=FCurId;
      if FDBItem.NewRecord then begin
         // NB: связь между формой и записью должна быть независимая
         if FDBItem.DoViewRecord(vmAdd) then begin
            FDBItem.AddRecord;
            Bookmark:=FDataSet.Bookmark;
            BuildTree(FindIdNode(FCurId), FCurId);
            SetBookmark(FDataSet, Bookmark);
            UpdateButtons;
         end
         else begin
            FDBItem.CancelEdit;
         end;
      end;
   end;
   (*
   // NB: !!! заплатка
   S:='';
   if InputQuery('Добавить папку', 'Наименование:', S) then begin
      if FIsTree then begin
         LastOrder:=0;
         if FIsOrder then begin
            FDataSet.Last;
            if (not FDataSet.IsEmpty) and (not FOrder.IsNull) then begin
               LastOrder:=FOrder.AsInteger;
            end;
         end;
         FDataSet.Append;
         FParentId.AsInteger:=FCurId;
         FIsNode.AsInteger:=iNode;
         FName.AsString:=S;
         if FIsOrder then begin
            FOrder.AsInteger:=LastOrder+1;
         end;
         FDataSet.Post;
         Bookmark:=FDataSet.Bookmark;
         BuildTree(FindIdNode(FCurId), FCurId);
         //FDataSet.Bookmark:=Bookmark;
         SetBookmark(FDataSet, Bookmark);
      end;
      UpdateButtons;
   end;
   *)
end;

procedure TfmSprEdit.tvTreeAfterSelectionChange(Sender: TObject);
var
   Node: TElTreeItem;
begin
   Node:=tvTree.ItemFocused;
   if Node<>nil then begin
      FDataSet.DisableControls;
      try
         SetTreeFilter(Node.Tag);
      finally
         FDataSet.EnableControls;
      end;
   end;
end;

procedure TfmSprEdit.tvTreeItemCollapse(Sender: TObject; Item: TElTreeItem);
begin
   tvTree.Items.BeginUpdate;
   try
      Item.ImageIndex:=II_FolderClose;
   finally
      tvTree.Items.EndUpdate;
   end;
end;

procedure TfmSprEdit.tvTreeItemExpand(Sender: TObject; Item: TElTreeItem);
begin
   BuildTree(Item, Item.Tag);
   Item.ImageIndex:=II_FolderOpen;
end;

procedure TfmSprEdit.dgTableDblClick(Sender: TObject);
begin
   DoSelectRow;
end;

procedure TfmSprEdit.OnSetColView(ColView: TColView; Column: TColumnEh);
begin
   if FIsTree and (AnsiCompareText(ColView.FieldName, FDBItem.NameFieldName)=0) then begin
      Column.ImageList:=imSprEdit;
      Column.ShowImageAndText:=True;
      Column.OnUpdateData:=OnUpdateName;
      FNameColumn:=Column;
   end;
end;

procedure TfmSprEdit.LoadLayout(FormLayout: TFormLayout);
begin
   if FormLayout<>nil then begin
      FormLayout.GetForm(Self);
      tvTree.Width:=FormLayout.GetInteger('tvTree.Width', tvTree.Width);
      if FIsTree then begin
         ToggleTreePanel(FormLayout.GetBoolean('tvTree.Visible', FIsTreePanel));
      end;
   end;
end;

procedure TfmSprEdit.SaveLayout(FormLayout: TFormLayout);
begin
   if FormLayout<>nil then begin
      FormLayout.SetForm(Self);
      FormLayout.SetInteger('tvTree.Width', tvTree.Width);
      if FIsTree then begin
         FormLayout.SetBoolean('tvTree.Visible', FIsTreePanel);
      end;
   end;
end;

function TfmSprEdit.InitLayout(LayoutList: TLayoutList; LayoutName: string): TFormLayout;
begin
   if LayoutList<>nil then begin
      Result:=LayoutList.ByName(LayoutName);
      if Result=nil then begin
         Result:=LayoutList.AddItem(LayoutName);
         Result.SetForm(Self);
         Result.SetInteger('tvTree.Width', tvTree.Width);
         if FIsTree then begin
            Result.SetBoolean('tvTree.Visible', FIsTreePanel);
         end;
      end;
   end
   else begin
      Result:=nil;
   end;
end;

procedure TfmSprEdit.acLeftPanelExecute(Sender: TObject);
begin
   ToggleTreePanel(not FIsTreePanel);
end;

procedure TfmSprEdit.ToggleTreePanel(Show: Boolean);
begin
   if Show then begin
      spLeft.Visible:=True;
      tvTree.Visible:=True;
      tbLeftPanel.Down:=True;
      FIsTreePanel:=True;
   end
   else begin
      tvTree.Visible:=False;
      spLeft.Visible:=False;
      tbLeftPanel.Down:=False;
      FIsTreePanel:=False;
   end;
end;

function TfmSprEdit.InitTableView(ViewList: TViewList; TableViewName: string): TTableView;
var
   DefaultTableView: TTableView;
begin
   // инициализация внешнего вида колонок таблицы
   Result:=ViewList.ByName(TableViewName);
   DefaultTableView:=ViewList.ByName(CDefaultTableViewName);
   if (Result=nil) and (DefaultTableView<>nil) then begin
      Result:=DefaultTableView.Clone;
      Result.Name:=TableViewName;
      ViewList.Add(Result);
   end;
   if Result<>nil then begin
      Result.OnSetColView:=OnSetColView;
      Result.SetColView(dgTable, OnDrawCell, OnGridButtonClick, True);
   end;
end;

procedure TfmSprEdit.ClearTableView(TableView: TTableView);
begin
   {--
   if TableView<>nil then begin
      TableView.UpdateColView;
      TableView.SetColView(nil, nil, nil, False);
   end;
   --}
   UpdateAndClearTableView(TableView)
end;

procedure TfmSprEdit.dgTableKeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then begin
      DoSelectRow;
   end;
end;

procedure TfmSprEdit.DoSelectRow;
var
   Node: TElTreeItem;
   LastId: Integer;
   Id: Integer;

   procedure Edit;
   var
      pt: TPoint;
      gc: TGridCoord;
   begin
      if FIsEdit then begin
         GetCursorPos(pt);
         pt:=dgTable.ScreenToClient(pt);
         gc:=dgTable.MouseCoord(pt.x, pt.y);
         if (gc.x<>-1) and (gc.y<>-1) then begin
            EditRecord;
         end;
      end;
   end;

begin
   if FIsTree then begin
      if ((dgTable.Col=Succ(FNameColumn.Index)) or (dgRowSelect in dgTable.Options)) and (FIsNode.AsInteger=iNode) then begin
         tvTree.Items.BeginUpdate;
         try
            Id:=FId.AsInteger;
            Node:=FindIdNode(Id);
            if Node=nil then begin
               Node:=FindIdNode(FCurId);
               if Node<>nil then begin
                  Node.Expand(False);
               end;
            end;
            Node:=FindIdNode(Id);
            if Node<>nil then begin
               if Id=FCurId then begin
                  if Node.Parent<>nil then begin
                     LastId:=FCurId;
                     Node.Parent.Expand(False);
                     FDataSet.Locate(FId.FieldName, LastId, []);
                  end;
               end
               else begin
                  tvTree.ItemFocused:=Node;
                  if (Node.Parent<>nil) and not Node.Parent.Expanded then begin
                      FGoDown:=True;
                      try
                         Node.Parent.Expand(False);
                      finally
                         FGoDown:=False;
                      end;
                  end;
                  Node.Expand(False);
               end;
            end;
         finally
            tvTree.Items.EndUpdate;
            tvTree.Invalidate;
            tvTree.Update;
         end;
      end
      // NB: здесь не совсем корректное условие
      else if FSelectValue and ((FIsNode.AsInteger=iLeaf) or FDBItem.HaveStyle(bsAllSelable)) then begin
         ModalResult:=mrOk;
      end
      else begin
         Edit;
      end;
   end
   else if FSelectValue then begin
      ModalResult:=mrOk;
   end
   else begin
      Edit;
   end;
end;

procedure TfmSprEdit.acToggleEditExecute(Sender: TObject);
begin
   ToggleEdit(not FIsEdit);
   ChangeCaption;
   UpdateButtons;
end;

procedure TfmSprEdit.ToggleEdit(Edit: Boolean);
begin
   if Edit then begin
      FIsEdit:=True;
      tbToggleEdit.Down:=True;
      dgTable.AllowedOperations:=[alopUpdateEh];
      dgTable.Options:=dgTable.Options-[dgRowSelect]+[dgEditing];
      //dgTable.Options:=dgTable.Options+[dgAlwaysShowSelection];
      //dgTable.OptionsEh:=dgTable.OptionsEh+[dghRowHighlight];
      dgTable.ReadOnly:=False;
   end
   else begin
      FIsEdit:=False;
      tbToggleEdit.Down:=False;
      dgTable.AllowedOperations:=[];
      dgTable.Options:=dgTable.Options+[dgRowSelect];
      //dgTable.Options:=dgTable.Options-[dgAlwaysShowSelection];
      //dgTable.OptionsEh:=dgTable.OptionsEh-[dghRowHighlight];
      dgTable.ReadOnly:=True;
   end;
   //dgTable.Invalidate;
   //dgTable.Update;
end;

procedure TfmSprEdit.ChangeCaption;
const
   MapIsEdit: array [Boolean] of string=('Просмотр', 'Редактирование');
begin
   if FSelectValue then begin
      Caption:='Выбор значения';
   end
   else begin
      Caption:=Format('%s: %s', [MapIsEdit[FIsEdit], FDBItem.Caption]);
   end;
end;

procedure TfmSprEdit.UpdateButtons;
begin
   acDelete.Enabled:=FIsEdit and not FDBItem.IsEmpty(skTable);
   acAdd.Enabled:=FIsEdit;
   acUp.Enabled:=FIsEdit and not FDBItem.IsEmpty(skTable);
   acDown.Enabled:=FIsEdit and not FDBItem.IsEmpty(skTable);
   acAddFolder.Enabled:=FIsEdit and FIsTree;
   acEdit.Enabled:=FIsEdit and not FDBItem.IsEmpty(skTable);
   // проверяем доступность операций
   if FTableView<>nil then begin
      acDelete.Enabled:=acDelete.Enabled and FTableView.HaveOper(toDelete);
      acAdd.Enabled:=acAdd.Enabled and FTableView.HaveOper(toAdd);
      acUp.Enabled:=acUp.Enabled and FTableView.HaveOper(toRecordUp);
      acDown.Enabled:=acDown.Enabled and FTableView.HaveOper(toRecordDown);
      acAddFolder.Enabled:=acAddFolder.Enabled and FTableView.HaveOper(toAddFolder);
      acEdit.Enabled:=acEdit.Enabled and FTableView.HaveOper(toEdit);
   end;
   //
   acFindClear.Enabled:=FIsFilter;
end;

(*procedure TfmSprEdit.DeleteTreeNode;
var
   RootId: Integer;
   RootNode: TElTreeItem;
   DeleteIdList: TStringList;
   I: Integer;

   procedure DeleteId(RootId: Integer);
   var
      Bookmark: string;
   begin
      // NB: !!! самый не оптимальный способ обхода дерева
      FDataSet.First;
      while not FDataSet.Eof do begin
         if FParentId.AsInteger=RootId then begin
            DeleteIdList.Add(FId.AsString);
            if FIsNode.AsInteger=iNode then begin
               Bookmark:=FDataSet.Bookmark;
               DeleteId(FId.AsInteger);
               SetBookmark(FDataSet, Bookmark);
            end;
         end;
         FDataSet.Next;
      end;
   end;

begin
   // NB: - это временная заплатка
   //     - удаление узла дерева (предполагаем, что ключ состоит из одного поля)
   FDataSet.DisableControls;
   DeleteIdList:=TStringList.Create;
   try
      RootId:=FId.AsInteger;
      RootNode:=FindIdNode(RootId);
      if not FDBItem.HaveStyle(bsClearFilter) then begin
         {**}FDataSet.Filter:=FDBItem.TableFilter;
         {**}FDataSet.Filtered:=FDBItem.TableFilter<>'';
      end;
      DeleteIdList.Add(IntToStr(RootId));
      DeleteId(RootId);
      for I:=0 to Pred(DeleteIdList.Count) do begin
         if FDataSet.Locate(FId.FieldName, DeleteIdList[I], []) then begin
            FDataSet.Delete;
         end;
      end;
      if RootNode.GetPrevSibling<>nil then begin
         FCurId:=RootNode.GetPrevSibling.Tag;
      end
      else begin
         FCurId:=RootNode.Parent.Tag;
      end;
      RootNode.Delete;
      SetTreeFilter(FCurId);
      BuildTree(FindIdNode(FCurId), FCurId);
   finally
      DeleteIdList.Free;
      FDataSet.EnableControls;
   end;
end;*)

function TfmSprEdit.FindIdNode(Id: Integer): TElTreeItem;
var
   I: Integer;
begin
   Result:=nil;
   for I:=0 to Pred(tvTree.Items.Count) do begin
      if tvTree.Items[I].Tag=Id then begin
         Result:=tvTree.Items[I];
         Break;
      end;
   end;
end;

procedure TfmSprEdit.OnUpdateName(Sender: TObject; var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
   Node: TElTreeItem;
begin
   if FIsNode.AsInteger=iNode then begin
      Node:=FindIdNode(FId.AsInteger);
      if Node<>nil then begin
         Node.Text:=Text;
      end;
   end;
   Handled:=False;
end;

procedure TfmSprEdit.tvTreeDblClick(Sender: TObject);
begin
   if FSelectValue and ((FIsNode.AsInteger=iLeaf) or FDBItem.HaveStyle(bsAllSelable)) then begin
      ModalResult:=mrOk;
   end;
end;
                                        
procedure TfmSprEdit.AdjustPosition;
begin
   btCancel.Left:=paBottom.ClientWidth-btCancel.Width-(btCancel.Width div 7);
   btOk.Left:=btCancel.Left-btOk.Width-(btOk.Width div 7);
end;

procedure TfmSprEdit.acExportExecute(Sender: TObject);
var
   I: Integer;
   Item: TExportColumn;
   Field: TField;
   Bookmark: string;
begin
   Bookmark:=FDBItem.Table.Bookmark;
   FDBItem.Table.DisableControls;
   try
      FillColumnList2(dgTable, FExportColumns);
      for I:=0 to Pred(FExportColumns.Count) do begin
         Item:=FExportColumns[I];
         if Item<>nil then begin
            Item.Color:=clWhite;
            Field:=FDBItem.Table.FindField(Item.FieldName);
            if (Field<>nil) and (Field.DataType=ftBoolean) then begin
               Item.ColumnEh:=nil;
            end;
         end;
      end;
      try
         DefBooleanName[True]:='Да';
         DefBooleanName[False]:='Нет';
         //снять фильтр для иерархического справочника
         if FIsTree then begin
            SetTreeFilter(-1);
         end;
         ExportDataSet('Выгрузка', FDBItem.Table, efRtf, [], Doc2Sel.GetExportDirName, False, False, FExportColumns);
      finally
         DefBooleanName[True]:='T';
         DefBooleanName[False]:='F';
         //вернуть фильтр для иерархического справочника
         if FIsTree then begin
            SetTreeFilter(FCurId);
         end;
      end;
   finally
      SetBookmark(FDBItem.Table, Bookmark);
      FDBItem.Table.EnableControls;
   end;
end;

procedure TfmSprEdit.FormDestroy(Sender: TObject);
begin
   FExportColumns.Free;
end;

procedure TfmSprEdit.acPreviewExecute(Sender: TObject);
var
   Bookmark: string;
begin
   Bookmark:=FDBItem.Table.Bookmark;
   FDBItem.Table.DisableControls;
   try
      FIsPrinting:=True;
      //снять фильтр для иерархического справочника
      if FIsTree then begin
         dgTable.FieldColumns[FDBItem.NameFieldName].ShowImageAndText:=False;
         dgTable.FieldColumns[FDBItem.NameFieldName].ImageList:=nil;
         SetTreeFilter(-1);
      end;
      pdgTable.BeforeGridText.Clear;
      pdgTable.BeforeGridText.Add(FDBItem.Caption);
      pdgTable.Preview;
   finally
      FIsPrinting:=False;
      //вернуть фильтр для иерархического справочника
      if FIsTree then begin
         dgTable.FieldColumns[FDBItem.NameFieldName].ShowImageAndText:=True;
         dgTable.FieldColumns[FDBItem.NameFieldName].ImageList:=imSprEdit;
         SetTreeFilter(FCurId);
      end;
      SetBookmark(FDBItem.Table, Bookmark);
      FDBItem.Table.EnableControls;
   end;
end;

procedure TfmSprEdit.acEditExecute(Sender: TObject);
begin
   EditRecord;
end;

procedure TfmSprEdit.EditRecord;
var
   KeyValues: string;
   ViewMode: TViewMode;
begin
   if not FDBItem.IsEmpty(skTable) then begin
      KeyValues:=FDBItem.GetKeyValues(skTable);
      if KeyValues<>'' then begin
         if FIsTree then begin
            FDBItem.Control.IsNode:=FIsNode.AsInteger;
            FDBItem.Control.ParentId:=FCurId;
         end;
         ViewMode:=vmEdit;
         if FAdmOnlyRead then begin
            ViewMode:=vmView;
         end;
         FDBItem.EditRecord(KeyValues);
         if ViewMode<>vmView then begin
            FDBItem.EditTable.Edit; //NB: ???
         end;
         if FDBItem.DoViewRecord(ViewMode) then begin
            FDBItem.ApplyEdit(KeyValues);
            //NB: ??? обновить просмотр
            //UpdateTopInfo;
         end
         else begin
            FDBItem.CancelEdit;
         end;
      end;
   end;
end;

procedure TfmSprEdit.acFindExecute(Sender: TObject);
begin
   if dgTable.SelectedIndex<>-1 then begin
      DoFind(dgTable.Columns[dgTable.SelectedIndex]);
   end;
end;

procedure TfmSprEdit.acFindClearExecute(Sender: TObject);
begin
   if FIsFilter then begin
      FDataSet.Filter:=FOldFilter;
      FDataSet.Filtered:=FDataSet.Filter<>'';
      FOldFilter:='';
      FIsFilter:=False;
      UpdateButtons;
   end;
end;

procedure TfmSprEdit.DoFind(Column: TColumnEh);
begin
   if FDBItem.FieldList.ByName(Column.FieldName).HaveStyle(fsFindVisible) then begin
      if not FIsFilter then begin
         FOldFilter:=FDataSet.Filter;
      end;
      {try}
         if Doc2Sel.SetFilter(Column, FOldFilter) then begin
            FIsFilter:=True;
            UpdateButtons;
         end
         else begin
            if not FDataSet.Filtered and (FOldFilter<>'') then begin
               FDataSet.Filter:=FOldFilter;
               FDataSet.Filtered:=True;
            end;
            if not FIsFilter then begin
               FOldFilter:='';
            end;
         end;
      {--except
         on E: Exception do begin
            FDataSet.Filter:=FOldFilter;
            FDataSet.Filtered:=FDataSet.Filter<>'';
            FIsFilter:=False;
            FOldFilter:='';
            UpdateButtons;
            raise E;
         end;
      end;}
   end;
end;

end.
