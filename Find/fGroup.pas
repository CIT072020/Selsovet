//
unit fGroup; // [26.08.2005]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, mFindInt, ActnList, ImgList, Db, kbmMemTable, ComCtrls, FuncPr,
   ToolWin, ElTree, Grids, DBGridEh, ExtCtrls, ElXPThemedControl;

type
   TfmGroup=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      gbFields: TGroupBox;
      gbGroupFields: TGroupBox;
      dgGroupField: TDBGridEh;
      tvFields: TElTree;
      dsField: TkbmMemTable;
      dsoField: TDataSource;
      dsFieldOrder: TIntegerField;
      dsFieldCaption: TStringField;
      dsFieldTitle: TStringField;
      imGroup: TImageList;
      alGroup: TActionList;
      gbColumns: TGroupBox;
      dsFieldVisible: TBooleanField;
      dgColumn: TDBGridEh;
      dsoColumn: TDataSource;
      dsColumn: TkbmMemTable;
      dsColumnOrder: TIntegerField;
      dsColumnTitle: TStringField;
      dsColumnCondition: TStringField;
      dsColumnVisible: TBooleanField;
      acAddField: TAction;
      acDeleteField: TAction;
      acFieldUp: TAction;
      acFieldDown: TAction;
      acAddColumn: TAction;
      acDeleteColumn: TAction;
      acColumnUp: TAction;
      acColumnDown: TAction;
      acAddColumnField: TAction;
      dsFieldInd: TIntegerField;
      dsColumnInd: TIntegerField;
      dsColumnTotal: TBooleanField;
      btTestSQL: TButton;
      acTestSQL: TAction;
      dsColumnFind: TMemoField;
      dsColumnId: TAutoIncField;
      dsFieldDateKind: TIntegerField;
      acAddTotalColumn: TAction;
      tbaTool: TToolBar;
      tbSave: TToolButton;
      tbOpen: TToolButton;
      tbFind: TToolButton;
      acSave: TAction;
      acOpen: TAction;
      acFind: TAction;
      odGroupBy: TOpenDialog;
      sdGroupBy: TSaveDialog;
      dsFieldId: TAutoIncField;
      paFields: TPanel;
      tbaFields: TToolBar;
      tbAddField: TToolButton;
      paField2: TPanel;
      tbaField2: TToolBar;
      tbAddField2: TToolButton;
      paField: TPanel;
      tbaField: TToolBar;
      tbDeleteField: TToolButton;
      tbFieldUp: TToolButton;
      tbFieldDown: TToolButton;
      paColumn: TPanel;
      tbaColumn: TToolBar;
      tbAddColumn: TToolButton;
      tbAddTotalColumn: TToolButton;
      tbDeleteColumn: TToolButton;
      tbColumnUp: TToolButton;
      tbColumnDown: TToolButton;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure acAddFieldExecute(Sender: TObject);
      procedure acDeleteFieldExecute(Sender: TObject);
      procedure tvFieldsAfterSelectionChange(Sender: TObject);
      procedure acFieldUpExecute(Sender: TObject);
      procedure acFieldDownExecute(Sender: TObject);
      procedure dsoFieldDataChange(Sender: TObject; Field: TField);
      procedure dsoColumnDataChange(Sender: TObject; Field: TField);
      procedure acTestSQLExecute(Sender: TObject);
      procedure acAddColumnFieldExecute(Sender: TObject);
      procedure acDeleteColumnExecute(Sender: TObject);
      procedure acColumnDownExecute(Sender: TObject);
      procedure acColumnUpExecute(Sender: TObject);
      procedure dgColumnColumns1EditButtons0Click(Sender: TObject; var Handled: Boolean);
      procedure acAddTotalColumnExecute(Sender: TObject);
      procedure acOpenExecute(Sender: TObject);
      procedure acFindExecute(Sender: TObject);
      procedure acSaveExecute(Sender: TObject);
      procedure tvFieldsItemCollapse(Sender: TObject; Item: TElTreeItem);
      procedure tvFieldsItemExpand(Sender: TObject; Item: TElTreeItem);
   private
      FFilterInterface: TFilterInterface;
      FFilter: TFindList;
      FGroupBy: TGroupBy;
      FIsFiltered: Boolean;
   private
      procedure BuildFieldTree(Tree: TElTree; Fields: TFindFieldList);
      procedure Init(Fields: TFindFieldList);
      procedure AddField(Node: TElTreeItem; Field: TFindFieldItem);
      procedure Reorder(DataSet: TDataSet; IdField, OrderField: TField; Up: Boolean);
      procedure DeleteField;
      procedure AddColumnField(Node: TElTreeItem; Field: TFindFieldItem);
      procedure AddTotalColumn;
      procedure DeleteColumn;
      procedure EditColumn;
      procedure GetGroup;
      procedure SetGroup;
      procedure ConfigView;
      procedure UpdateButton;
      function LoadGroupBy(sName:String; var sErr:String):Boolean;

      procedure OpenGroupBy;
      procedure SaveGroupBy;
      procedure Scale;
      //
      function GetGroupFieldCaption(Field: TFindFieldItem; DateKind: TDateKind): string;
      function GetFieldMultiCaption(FindItem: TFindItem): string;
   end;

function SetGroupBy(FilterInterface: TFilterInterface; Filter: TFindList; GroupBy: TGroupBy; var IsFiltered: Boolean; sName:String=''): Boolean;

implementation
uses
   dFindImg, fFindTxt, fGrpAdd, fGrpDK;

{$R *.DFM}

function SetGroupBy(FilterInterface: TFilterInterface; Filter: TFindList; GroupBy: TGroupBy; var IsFiltered: Boolean; sName:String): Boolean;
var
  sErr:String;
begin
   Result:=False;
   with TfmGroup.Create(nil) do begin
      try
         FIsFiltered:=IsFiltered;
         FFilterInterface:=FilterInterface;
         FFilter:=Filter;
         FGroupBy.Assign(GroupBy);
         dsField.Open;
         dsColumn.Open;
         Init(FilterInterface.FindFieldList);
         ConfigView;
         UpdateButton;
         Scale;

         if sName<>'' then begin
           if LoadGroupBy(sName, sErr) then begin
             IsFiltered:=FIsFiltered;
             GetGroup;
             GroupBy.Assign(FGroupBy);
             Result:=True;
           end else begin

           end;
         end else begin
           if ShowModal=mrOk then begin
              IsFiltered:=FIsFiltered;
              GetGroup;
              GroupBy.Assign(FGroupBy);
              Result:=True;
           end;
         end;
         dsColumn.Open;
         dsField.Close;
      finally
         Free;
      end;
   end;
end;

{ TfmGroup }

procedure TfmGroup.BuildFieldTree(Tree: TElTree; Fields: TFindFieldList);
{var
   I: Integer;
   Field: TFindFieldItem;
   FieldNode: TElTreeItem;}
begin
{   // строим список полей, участвующих в группировке
   Tree.Items.BeginUpdate;
   try
      Tree.ShowRootButtons:=False;
      Tree.Images:=FFilterInterface.Images.imFields;
      for I:=0 to Pred(Fields.Count) do begin
         Field:=Fields[I];
         if (Field<>nil) and Field.Visible and not Field.NotGroupBy and ([ffkList, ffkProp, ffkRel, ffkText]*Field.Kinds=[]) and (Field.Owner=nil) then begin
            //-- проверяем что бы поле не было уже в группировке
            //--if FGroupBy.GroupList.IndexOfPath(Field.Path)=-1 then begin
               // добавляем простое поле в список доступных полей
               FieldNode:=Tree.Items.AddChildObject(nil, Field.Caption, Field);
               FieldNode.ParentStyle:=False;
               FieldNode.ParentColors:=False;
               FieldNode.UseBkColor:=False;
               FieldNode.ImageIndex:=FFilterInterface.GetImageIndex(Field);
               FieldNode.Tag:=CFieldTag;
            //--end;
         end;
      end;
      if Tree.Items.Count<>0 then begin
         Tree.ItemFocused:=Tree.Items[0];
      end;
   finally
      Tree.Items.EndUpdate;
   end;
}
   if FFilterInterface.DoFieldSort and FFilterInterface.FirstRun then begin
      FFilterInterface.FindFieldList.Sort;
   end;
   Fields.BuildFieldTree(FFilterInterface, Tree, nil, False, True);
   Tree.ShowRootButtons:=True;
   Tree.FullExpand;
end;

procedure TfmGroup.Init(Fields: TFindFieldList);
begin
   BuildFieldTree(tvFields, Fields);
   SetGroup;
end;

procedure TfmGroup.FormCreate(Sender: TObject);
begin
   FGroupBy:=TGroupBy.Create('');
end;

procedure TfmGroup.FormDestroy(Sender: TObject);
begin
   FGroupBy.Free;
end;

procedure TfmGroup.acAddFieldExecute(Sender: TObject);
var
   Node: TElTreeItem;
   Field: TFindFieldItem;
begin
   Node:=tvFields.ItemFocused;
   if (Node<>nil) and (Node.Tag=CFieldTag) then begin
      Field:=TFindFieldItem(Node.Data);
      AddField(Node, Field);
   end;
end;

procedure TfmGroup.acDeleteFieldExecute(Sender: TObject);
begin
   DeleteField;
end;

procedure TfmGroup.AddField(Node: TElTreeItem; Field: TFindFieldItem);
var
   Bookmark: string;
   Order: Integer;
   Ind: Integer;
   DateKind: TDateKind;
begin
   DateKind:=dkFull;
   if (Field<>nil) and ((not (ffkDate in Field.Kinds)) or GetDateKind(DateKind)) then begin
      Ind:=FFilterInterface.FindFieldList.IndexOf(Field);
      dsField.DisableControls;
      try
         Bookmark:=dsField.Bookmark;
         //if dsField.Locate('IND', Ind, []) then begin
         //   dsField.Bookmark:=Bookmark;
         //end
         //else begin
            if dsField.IsEmpty then begin
               Order:=1;
            end
            else begin
               Order:=dsFieldOrder.AsInteger;
               Inc(Order);
            end;
            dsField.Next;
            while not dsField.Eof do begin
               dsField.Edit;
               dsFieldOrder.AsInteger:=dsFieldOrder.AsInteger+1;
               dsField.Post;
               dsField.Next;
            end;
            dsField.Append;
            dsFieldInd.AsInteger:=Ind;
            dsFieldOrder.AsInteger:=Order;
            dsFieldDateKind.AsInteger:=Integer(DateKind);
            dsFieldCaption.AsString:=GetGroupFieldCaption(Field, DateKind);
            dsFieldTitle.AsString:=Field.Caption;
            dsFieldVisible.AsBoolean:=True;
            dsField.Post;
            dsField.Locate('ORDER', Order, []);
            UpdateButton;
         //end;
      finally
         dsField.EnableControls;
      end;
   end;
end;

procedure TfmGroup.UpdateButton;
begin
   btOk.Enabled:=(not dsField.IsEmpty) and (not dsColumn.IsEmpty);
   acAddField.Enabled:=(tvFields.ItemFocused<>nil) and (tvFields.ItemFocused.Tag=CFieldTag);
   acDeleteField.Enabled:=not dsField.IsEmpty;
   acFieldUp.Enabled:=not dsField.IsEmpty and (dsFieldOrder.AsInteger<>1);
   acFieldDown.Enabled:=not dsField.IsEmpty and (dsFieldOrder.AsInteger<>dsField.RecordCount);
   acAddColumnField.Enabled:=(tvFields.ItemFocused<>nil) and (tvFields.ItemFocused.Tag=CFieldTag);
   acDeleteColumn.Enabled:=not dsColumn.IsEmpty;
   acColumnUp.Enabled:=not dsColumn.IsEmpty and (dsColumnOrder.AsInteger<>1);
   acColumnDown.Enabled:=not dsColumn.IsEmpty and (dsColumnOrder.AsInteger<>dsColumn.RecordCount);
   acSave.Enabled:=(not dsField.IsEmpty) and (not dsColumn.IsEmpty);
end;

procedure TfmGroup.tvFieldsAfterSelectionChange(Sender: TObject);
begin
   UpdateButton;
end;

procedure TfmGroup.DeleteField;
begin
   if not dsField.IsEmpty then begin
      dsField.Delete;
      UpdateButton;
   end;
end;

procedure TfmGroup.acFieldUpExecute(Sender: TObject);
begin
   Reorder(dsField, dsFieldId, dsFieldOrder, True);
end;

procedure TfmGroup.acFieldDownExecute(Sender: TObject);
begin
   Reorder(dsField, dsFieldId, dsFieldOrder, False);
end;

procedure TfmGroup.dsoFieldDataChange(Sender: TObject; Field: TField);
begin
   if Field=nil then begin
      UpdateButton;
   end;
end;

procedure TfmGroup.GetGroup;
var
   Field: TFindFieldItem;
   FieldPath: string;
   BookmarkField: string;
   BookmarkColumn: string;
   GroupItem: TGroupItem;
   ColumnItem: TGroupColumnItem;
   sl: TStringList;
begin
   dsField.DisableControls;
   dsColumn.DisableControls;
   BookmarkField:=dsField.Bookmark;
   BookmarkColumn:=dsColumn.Bookmark;
   sl:=TStringList.Create;
   try
      // список полей по которым осуществляется группировка
      FGroupBy.GroupList.Clear;
      dsField.First;
      while not dsField.Eof do begin
         Field:=FFilterInterface.FindFieldList[dsFieldInd.AsInteger];
         GroupItem:=FGroupBy.GroupList.AddNew(dsFieldTitle.AsString, Field.Path, dsFieldVisible.AsBoolean, -1);
         GroupItem.DateKind:=TDateKind(dsFieldDateKind.AsInteger);
         dsField.Next;
      end;
      // список колонок
      FGroupBy.ColumnList.Clear;
      dsColumn.First;
      while not dsColumn.Eof do begin
         if dsColumnInd.AsInteger<>-1 then begin
            Field:=FFilterInterface.FindFieldList[dsColumnInd.AsInteger];
            FieldPath:=Field.Path;
            ColumnItem:=FGroupBy.ColumnList.AddNew(dsColumnTitle.AsString, dsColumnTotal.AsBoolean, dsColumnVisible.AsBoolean, FieldPath, -1);
            sl.Text:=dsColumnFind.AsString;
            ColumnItem.Condition.LoadFromStrings(sl, FFilterInterface.FindFieldList, FFilterInterface.OperList);
         end
         else begin
            FGroupBy.ColumnList.AddNew(dsColumnTitle.AsString, dsColumnTotal.AsBoolean, dsColumnVisible.AsBoolean, '', -1);
         end;
         dsColumn.Next;
      end;
   finally
      dsField.Bookmark:=BookmarkField;
      dsColumn.Bookmark:=BookmarkColumn;
      dsField.EnableControls;
      dsColumn.EnableControls;
      sl.Free;
   end;
   FGroupBy.OrderList.Clear;
end;

procedure TfmGroup.SetGroup;
var
   I: Integer;
   GroupItem: TGroupItem;
   ColumnItem: TGroupColumnItem;
   Field: TFindFieldItem;
   sl: TStringList;
begin
   // заполнение списка полей по которым осуществляется группировка
   dsField.DisableControls;
   try
      dsField.EmptyTable;
      for I:=0 to Pred(FGroupBy.GroupList.Count) do begin
         GroupItem:=FGroupBy.GroupList[I];
         if GroupItem<>nil then begin
            Field:=FFilterInterface.FindFieldList.ByPath(GroupItem.FieldPath);
            if Field<>nil then begin
               dsField.Append;
               dsFieldTitle.AsString:=GroupItem.Title;
               dsFieldDateKind.AsInteger:=Integer(GroupItem.DateKind);
               dsFieldCaption.AsString:=GetGroupFieldCaption(Field, GroupItem.DateKind);
               dsFieldOrder.AsInteger:=Succ(I);
               dsFieldInd.AsInteger:=FFilterInterface.FindFieldList.IndexOf(Field);
               dsFieldVisible.AsBoolean:=GroupItem.IsVisible;
               dsField.Post;
            end;
         end;
      end;
   finally
      dsField.EnableControls;
   end;
   // заполнение списка колонок
   sl:=TStringList.Create;
   dsColumn.DisableControls;
   try
      dsColumn.EmptyTable;
      for I:=0 to Pred(FGroupBy.ColumnList.Count) do begin
         ColumnItem:=FGroupBy.ColumnList[I];
         if ColumnItem<>nil then begin
            dsColumn.Append;
            dsColumnTitle.AsString:=ColumnItem.Title;
            dsColumnOrder.AsInteger:=Succ(I);
            dsColumnVisible.AsBoolean:=ColumnItem.IsVisible;
            dsColumnTotal.AsBoolean:=ColumnItem.IsTotal;
            sl.Clear;
            ColumnItem.Condition.SaveToStrings(sl);
            dsColumnFind.AsString:=sl.Text;
            dsColumnCondition.AsString:='';
            if ColumnItem.IsTotal then begin
               dsColumnCondition.AsString:='<всего>';
            end
            else if (ColumnItem.FieldPath<>'') and (ColumnItem.Condition.Count>0) then begin
               dsColumnCondition.AsString:=ColumnItem.Condition[0].GetCaption(FFilterInterface);
            end;
            dsColumnInd.AsInteger:=-1;
            if ColumnItem.FieldPath<>'' then begin
               Field:=FFilterInterface.FindFieldList.ByPath(ColumnItem.FieldPath);
               if Field<>nil then begin
                  dsColumnInd.AsInteger:=FFilterInterface.FindFieldList.IndexOf(Field);
               end
            end;
            dsColumn.Post;
         end;
      end;
   finally
      dsColumn.EnableControls;
      sl.Free;
   end;
end;

procedure TfmGroup.dsoColumnDataChange(Sender: TObject; Field: TField);
begin
   if Field=nil then begin
      UpdateButton;
   end;
end;

procedure TfmGroup.acTestSQLExecute(Sender: TObject);
var
   sl: TStringList;    
begin
   GetGroup;
//   if Assigned(FFilterInterface.OnTestSQL) then begin
//      FFilterInterface.OnTestSQL(FFilter);
//   end
//   else begin
      sl:=TStringList.Create;
      try
         if FGroupBy.GetSQL(sl, FFilterInterface, FFilterInterface.GetSQL2(FFilter, FIsFiltered)) then begin
            ShowStrings(sl, 'Запрос', FFilterInterface.Section, 'fFindTxt2', FFilterInterface.Ini);
         end;
      finally
         sl.Free;
      end;
//   end;
end;

procedure TfmGroup.ConfigView;
begin
   acTestSQL.Visible:=urTestSQL in FFilterInterface.UserRights;
end;

procedure TfmGroup.AddColumnField(Node: TElTreeItem; Field: TFindFieldItem);
var
   FindList: TFindList;
   FindItem: TFindItem;
   Order: Integer;
   sl: TStringList;
begin
   FindItem:=nil;
   if fGrpAdd.AddColumnField(FFilterInterface, Field, dmNew, FindItem) then begin
      FindList:=TFindList.Create('', '', '', False);
      FindList.Add(FindItem);
      sl:=TStringList.Create;
      dsColumn.DisableControls;
      try
         if dsColumn.IsEmpty then begin
            Order:=1;
         end
         else begin
            Order:=dsColumnOrder.AsInteger;
            Inc(Order);
         end;
         dsColumn.Next;
         while not dsColumn.Eof do begin
            dsColumn.Edit;
            dsColumnOrder.AsInteger:=dsColumnOrder.AsInteger+1;
            dsColumn.Post;
            dsColumn.Next;
         end;
         dsColumn.Append;
         dsColumnTitle.AsString:=Field.Caption;
         dsColumnVisible.AsBoolean:=True;
         dsColumnTotal.AsBoolean:=False;
         dsColumnCondition.AsString:=FindItem.GetCaption(FFilterInterface)+GetFieldMultiCaption(FindItem);
         dsColumnInd.AsInteger:=FFilterInterface.FindFieldList.IndexOf(Field);
         dsColumnOrder.AsInteger:=Order;
         sl.Clear;
         FindList.SaveToStrings(sl);
         dsColumnFind.AsString:=sl.Text;
         dsColumn.Post;
         dsColumn.Locate('ORDER', Order, []);
      finally
         dsColumn.EnableControls;
         FindList.Free;
         sl.Free;
      end;
      UpdateButton;
   end;
end;

procedure TfmGroup.acAddColumnFieldExecute(Sender: TObject);
var
   Node: TElTreeItem;
   Field: TFindFieldItem;
begin
   Node:=tvFields.ItemFocused;
   if (Node<>nil) and (Node.Tag=CFieldTag) then begin
      Field:=TFindFieldItem(Node.Data);
      AddColumnField(Node, Field);
   end;
end;

procedure TfmGroup.acDeleteColumnExecute(Sender: TObject);
begin
   DeleteColumn;
end;

procedure TfmGroup.DeleteColumn;
begin
   if not dsColumn.IsEmpty then begin
      dsColumn.Delete;
      UpdateButton;
   end;
end;

procedure TfmGroup.acColumnDownExecute(Sender: TObject);
begin
   Reorder(dsColumn, dsColumnId, dsColumnOrder, False);
end;

procedure TfmGroup.acColumnUpExecute(Sender: TObject);
begin
   Reorder(dsColumn, dsColumnId, dsColumnOrder, True);
end;

procedure TfmGroup.dgColumnColumns1EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
   EditColumn;
end;

procedure TfmGroup.EditColumn;
var
   sl: TStringList;
   Field: TFindFieldItem;
   FindList: TFindList;
   FindItem: TFindItem;
begin
   if not dsColumn.IsEmpty then begin
      if not dsColumnTotal.AsBoolean then begin
         sl:=TStringList.Create;
         FindList:=TFindList.Create('', '', '', False);
         try
            sl.Text:=dsColumnFind.AsString;
            FindList.LoadFromStrings(sl, FFilterInterface.FindFieldList, FFilterInterface.OperList);
            if (dsColumnInd.AsInteger<>-1) and (FindList.Count=1) then begin
               FindItem:=FindList[0];
               Field:=FFilterInterface.FindFieldList[dsColumnInd.AsInteger];
               if fGrpAdd.AddColumnField(FFilterInterface, Field, dmEdit, FindItem) then begin
                  dsColumn.Edit;
                  dsColumnCondition.AsString:=FindItem.GetCaption(FFilterInterface)+GetFieldMultiCaption(FindItem);
                  sl.Clear;
                  FindList.SaveToStrings(sl);
                  dsColumnFind.AsString:=sl.Text;
                  dsColumn.Post;
               end;
            end; 
         finally
            FindList.Free;
            sl.Free;
         end;
      end;
   end;
end;

function TfmGroup.GetGroupFieldCaption(Field: TFindFieldItem; DateKind: TDateKind): string;
var
  s:String;
begin
   Result:='';
   if Field<>nil then begin
      Result:=Field.Caption;
      if (ffkDate in Field.Kinds) and (DateKind<>dkFull) then begin
         if ffkAge in Field.Kinds  then s:=CDateKindName[DateKind] else s:=CDateKindName2[DateKind];
         Result:=Result+' '+s;
      end;
   end;
end;

procedure TfmGroup.AddTotalColumn;
var
   Order: Integer;
begin
   dsColumn.DisableControls;
   try
      if dsColumn.IsEmpty then begin
         Order:=1;
      end
      else begin
         Order:=dsColumnOrder.AsInteger;
         Inc(Order);
      end;
      dsColumn.Next;
      while not dsColumn.Eof do begin
         dsColumn.Edit;
         dsColumnOrder.AsInteger:=dsColumnOrder.AsInteger+1;
         dsColumn.Post;
         dsColumn.Next;
      end;
      dsColumn.Append;
      dsColumnTitle.AsString:='Всего';
      dsColumnVisible.AsBoolean:=True;
      dsColumnTotal.AsBoolean:=True;
      dsColumnCondition.AsString:='<всего>';
      dsColumnInd.AsInteger:=-1;
      dsColumnOrder.AsInteger:=Order;
      dsColumnFind.AsString:='';
      dsColumn.Post;
      dsColumn.Locate('ORDER', Order, []);
   finally
      dsColumn.EnableControls;
   end;
   UpdateButton;
end;

procedure TfmGroup.acAddTotalColumnExecute(Sender: TObject);
begin
   AddTotalColumn;
end;

procedure TfmGroup.acOpenExecute(Sender: TObject);
begin
   OpenGroupBy;
end;

procedure TfmGroup.acFindExecute(Sender: TObject);
begin
   if FFilterInterface.Edit then begin
      FIsFiltered:=True;
   end;
end;

procedure TfmGroup.acSaveExecute(Sender: TObject);
begin
   SaveGroupBy;
end;

function TfmGroup.LoadGroupBy(sName:String; var sErr:String):Boolean;
var
   FileName: string;
   sDir, Err: string;
begin
   Result:=false;
   sErr:='';
   if (Pos('.gfl', sName)=0) then begin
     sDir:=CheckSleshN( FFilterInterface.GroupDir );
     FileName:=sDir+sName+'.gfl';
   end else begin
     FileName:=sName;
   end;
   if FileExists(FileName) then begin
     if FGroupBy.LoadFromFile(FFilterInterface, FileName, sErr) then begin
       SetGroup;
       Result:=true;
     end;
   end else begin
     sErr:='Файл '+FileName+' не найден';
   end;
end;

procedure TfmGroup.OpenGroupBy;
var
   FileName: string;
   sDir, Err: string;
begin
   sDir:=CheckSleshN(FFilterInterface.GroupDir);
   ForceDirectories(sDir);
   odGroupBy.InitialDir:=sDir;
   odGroupBy.DefaultExt:='.gfl';
   odGroupBy.Filter:='Запросы (*.gfl)|*.gfl';
   if odGroupBy.Execute then begin
      FileName:=ExpandFileName(ChangeFileExt(odGroupBy.FileName, '.gfl'));
      Err:='';
      if FGroupBy.LoadFromFile(FFilterInterface, FileName, Err) then begin
         SetGroup;
      end
      else begin
         MessageDlgR(Format('Ошибка чтения запроса из файла "%s"'#13#10'%s', [FileName, Err]), mtError, [mbOk], 0);
      end;
   end;
end;

procedure TfmGroup.SaveGroupBy;
var
   FileName: string;
   sDir, Err: string;
begin
   sDir:=CheckSleshN(FFilterInterface.GroupDir);
   ForceDirectories(sDir);
   GetGroup;
   sdGroupBy.InitialDir:=sDir;
   sdGroupBy.DefaultExt:='.gfl';
   sdGroupBy.Filter:='Запросы (*.gfl)|*.gfl';
   if sdGroupBy.Execute then begin
      FileName:=ExpandFileName(ChangeFileExt(sdGroupBy.FileName, '.gfl'));
      Err:='';
      if not FGroupBy.SaveToFile(FileName, Err) then begin
         MessageDlgR(Format('Ошибка сохранения запроса в файла "%s"'#13#10'%s', [FileName, Err]), mtError, [mbOk], 0);
      end;
   end;
end;

procedure TfmGroup.tvFieldsItemCollapse(Sender: TObject; Item: TElTreeItem);
begin
   if (Item.Data=nil) and (Item.Tag=CGroupTag) then begin
      Item.ImageIndex:=II_CloseGroup;
   end;
end;

procedure TfmGroup.tvFieldsItemExpand(Sender: TObject; Item: TElTreeItem);
begin
   if (Item.Data=nil) and (Item.Tag=CGroupTag) then begin
      Item.ImageIndex:=II_OpenGroup;
   end;
end;

procedure TfmGroup.Reorder(DataSet: TDataSet; IdField, OrderField: TField; Up: Boolean);
var
   Id: Integer;
begin
   if not DataSet.IsEmpty and ((Up and (OrderField.AsInteger<>1)) or (not Up and (OrderField.AsInteger<>DataSet.RecordCount))) then begin
      DataSet.DisableControls;
      try
         Id:=IdField.AsInteger;
         if Up then DataSet.Prior else DataSet.Next;
         DataSet.Edit;
         if Up then OrderField.AsInteger:=OrderField.AsInteger+1
         else OrderField.AsInteger:=OrderField.AsInteger-1;
         DataSet.Post;
         DataSet.Locate(IdField.FieldName, Id, []);
         DataSet.Edit;
         if Up then OrderField.AsInteger:=OrderField.AsInteger-1
         else OrderField.AsInteger:=OrderField.AsInteger+1;
         DataSet.Post;
         DataSet.Locate(IdField.FieldName, Id, []);
      finally
         DataSet.EnableControls;
      end;
      UpdateButton;
   end;
end;

function TfmGroup.GetFieldMultiCaption(FindItem: TFindItem): string;
var
   I: Integer;
   Ind: Integer;
   S: string;
   Field: TFindFieldItem;
   SprItem: TSprItem;
   Values: TStringList;
begin
   Result:='';
   Field:=FindItem.Field;
   if (FindItem.Oper<>nil) and (FindItem.Oper.NeedValue) and (Field<>nil) and (Field.IsSpr) and (FindItem.Value1.Values.Count>0) then begin
      SprItem:=FFilterInterface.SprList.ByName(Field.SprName);
      if SprItem<>nil then begin
         Values:=FindItem.Value1.Values;
         SprItem.FillStrings(nil);
         for I:=0 to Pred(Values.Count) do begin
            Ind:=SprItem.KeyList.IndexOf(Values[I]);
            if Ind<>-1 then begin
               S:=Format('"%s"', [SprItem.NameList[Ind]]);
            end
            else begin
               S:=Format('%s', [Values[I]]);
            end;
            //FindItem.Oper.MultiSel
            if Result='' then begin
               Result:=S;
            end
            else if FindItem.Oper.MultiOr then begin
               Result:=Result+' или '+S;
            end
            else begin
               Result:=Result+' и '+S;
            end;
         end;
      end;
   end;
end;

procedure TfmGroup.Scale;
begin                              
//   tbaField2
//   tbaFields
//   tbaField
//   tbaColumn
end;

end.
