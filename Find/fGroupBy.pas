//
unit fGroupBy; // [26.08.2005]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Menus, ActnList, ImgList, ComCtrls, ToolWin, Db, Grids, DBGridEh, mFindInt,
   adsdata, adsfunc, adstable, IniFiles, TypInfo, mExport, ActiveX, ShlObj, FuncPr,
   ShellApi;

type
   TfmGroupBy=class(TForm)
      dgGroup: TDBGridEh;
      dsoGroup: TDataSource;
      tbaGroup: TToolBar;
      imGroup: TImageList;
      alGroup: TActionList;
      acExit: TAction;
      acPrint: TAction;
      acSaveAs: TAction;
      acChange: TAction;
      acStandart: TAction;
      pmStandart: TPopupMenu;
      tbPrint: TToolButton;
      tbChange: TToolButton;
      tbSaveAs: TToolButton;
      tbExit: TToolButton;
      tbStandart: TToolButton;
      tbSep1: TToolButton;
      quGroup: TAdsQuery;
      acOrderBy: TAction;
      tbOrderBy: TToolButton;
      pmOrderBy: TPopupMenu;
      sdSaveAs: TSaveDialog;
      acCount: TAction;
      tbCount: TToolButton;
    tbGroup: TAdsTable;
      procedure acExitExecute(Sender: TObject);
      procedure acPrintExecute(Sender: TObject);
      procedure acSaveAsExecute(Sender: TObject);
      procedure acChangeExecute(Sender: TObject);
      procedure acStandartExecute(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure acOrderByExecute(Sender: TObject);
      procedure dgGroupTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
      procedure acCountExecute(Sender: TObject);
   private
      FSQL: TStringList;
      FFilterInterface: TFilterInterface;
      FFilter: TFindList;
      FGroupBy: TGroupBy;
      FSortAscend: Boolean;
      FField2Menu: TStringList;
      FOrderMenu: array [Boolean] of TMenuItem;
      FIsFiltered: Boolean;
   private
      procedure SetConnection(Connection: string);
      function SetGroupBy(ChangeOrderBy: Boolean): Boolean;
      procedure SetSQL(SQL: TStringList);
      procedure SetOrderField(FieldName: string);
      procedure ConfigColumn;
      procedure ConfigOrderBy;
      procedure SaveLayout(Section: string; Ini: TCustomIniFile);
      procedure LoadLayout(Section: string; Ini: TCustomIniFile);
      //
      procedure DoExport;
      procedure ConfigExport;
      //
      procedure OnOrderFieldClick(Sender: TObject);
      procedure OnOrderByClick(Sender: TObject);
      procedure OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
   end;

procedure ShowGroupBy(FilterInterface: TFilterInterface; Filter: TFindList; GroupBy: TGroupBy; IsFiltered: Boolean);

implementation
uses
   fGroup,
   //[2010.05.06]
   MetaTask;

{$R *.DFM}

var
  nIndGroup:Integer;

procedure ShowGroupBy(FilterInterface: TFilterInterface; Filter: TFindList; GroupBy: TGroupBy; IsFiltered: Boolean);
begin
   with TfmGroupBy.Create(nil) do begin
      try
         FIsFiltered:=IsFiltered;
         FGroupBy:=GroupBy;
{!!!}    FGroupBy.OrderList.Clear;
         FFilterInterface:=FilterInterface;
         FFilter:=Filter;
         ConfigExport;
         SetConnection(FilterInterface.MainConnect);
         LoadLayout(FilterInterface.Section, FilterInterface.Ini);
         if SetGroupBy(True) then begin
            ShowModal;
         end;
         SaveLayout(FilterInterface.Section, FilterInterface.Ini);
      finally
         Free;
      end;
   end;
end;

procedure TfmGroupBy.acExitExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfmGroupBy.acPrintExecute(Sender: TObject);
begin
//
end;

procedure TfmGroupBy.acSaveAsExecute(Sender: TObject);
begin
   DoExport;
end;

procedure TfmGroupBy.acChangeExecute(Sender: TObject);
begin
   if fGroup.SetGroupBy(FFilterInterface, FFilter, FGroupBy, FIsFiltered) then begin
      SetGroupBy(True);
   end;
end;

procedure TfmGroupBy.acStandartExecute(Sender: TObject);
begin
//
end;

procedure TfmGroupBy.SetConnection(Connection: string);
begin
   quGroup.DatabaseName:=Connection;
   tbGroup.DatabaseName:=Connection;
end;

procedure TfmGroupBy.FormCreate(Sender: TObject);
begin
   FSQL:=TStringList.Create;
   FSortAscend:=False;
   FField2Menu:=TStringList.Create;
   FOrderMenu[False]:=nil;
   FOrderMenu[True]:=nil;
end;

procedure TfmGroupBy.FormDestroy(Sender: TObject);
begin
   FField2Menu.Free;
   FSQL.Free;
end;

procedure TfmGroupBy.SetSQL(SQL: TStringList);
begin
//   try
//     quGroup.SQL.text:='drop table #tmp_group'+inttostr(nIndGroup)+';';
//     quGroup.ExecSQL;
//   except
//   end;
   quGroup.SQL.Assign(SQL);
   MemoWrite('group.sql', quGroup.SQL.Text);
//   quGroup.SQL.text:='select * into #tmp_group'+inttostr(nIndGroup)+'from ('#13#10+quGroup.SQL.Text+#13#10')';
   quGroup.Open;
end;

procedure TfmGroupBy.ConfigColumn;
var
   I: Integer;
   J: Integer;
   Column: TColumnEh;
   GroupItem: TGroupItem;
   ColumnItem: TGroupColumnItem;
   Field: TFindFieldItem;
   SprItem: TSprItem;
begin
   dgGroup.Columns.BeginUpdate;
   try
      dgGroup.Columns.Clear;
      for I:=0 to Pred(FGroupBy.GroupList.Count) do begin
         GroupItem:=FGroupBy.GroupList[I];
         if (GroupItem<>nil) and GroupItem.IsVisible then begin
            Column:=dgGroup.Columns.Add;
            Column.FieldName:=GroupItem.FieldName;
            Column.Title.Caption:=GroupItem.Title;
            Column.Title.TitleButton:=True;
            if GroupItem.Width<>-1 then begin
               Column.Width:=GroupItem.Width
            end;
            Field:=FFilterInterface.FindFieldList.ByPath(GroupItem.FieldPath);
            if (Field<>nil) and (ffkSpr in Field.Kinds) then begin
               SprItem:=FFilterInterface.SprList.ByName(Field.SprName);
               if SprItem<>nil then begin
                  case SprItem.Kind of
                     skDataSet: begin
                        Column.OnGetCellParams:=OnGetCellParams;
                        Column.Tag:=Integer(SprItem);
                        Column.Alignment:=taLeftJustify;
                     end;
                     skStringList: begin
                        Column.KeyList.Assign(SprItem.KeyList);
                        Column.PickList.Assign(SprItem.NameList);
                        Column.Alignment:=taLeftJustify;
                     end;
                  end;
               end;
            end
            else if (Field<>nil) and (ffkBoolean in Field.Kinds) then begin
               Column.Checkboxes:=False;
               Column.KeyList.Add('True');
               Column.KeyList.Add('1');
               Column.KeyList.Add('T');
               Column.KeyList.Add('.T.');
               Column.PickList.Add('Да');
               Column.PickList.Add('Да');
               Column.PickList.Add('Да');
               Column.PickList.Add('Да');
               Column.KeyList.Add('False');
               Column.KeyList.Add('F');
               Column.KeyList.Add('.F.');
               Column.KeyList.Add('0');
               Column.PickList.Add('Нет');
               Column.PickList.Add('Нет');
               Column.PickList.Add('Нет');
               Column.PickList.Add('Нет');
            end
            else if (Field<>nil) and (ffkDate in Field.Kinds) and (GroupItem.DateKind=dkMonth) then begin
               for J:=1 to 12 do begin
                  Column.KeyList.Add(IntToStr(J));
                  Column.PickList.Add(LongMonthNames[J]);
               end;
               Column.Alignment:=taLeftJustify;
            end;
         end;
      end;
      for I:=0 to Pred(FGroupBy.ColumnList.Count) do begin
         ColumnItem:=FGroupBy.ColumnList[I];
         if (ColumnItem<>nil) and ColumnItem.IsVisible then begin
            Column:=dgGroup.Columns.Add;
            Column.FieldName:=ColumnItem.FieldName;
            Column.Title.Caption:=ColumnItem.Title;
            Column.Title.TitleButton:=True;
            if ColumnItem.Width<>-1 then begin
               Column.Width:=ColumnItem.Width
            end;
         end;
      end;
   finally
      dgGroup.Columns.EndUpdate;
   end;
end;

procedure TfmGroupBy.LoadLayout(Section: string; Ini: TCustomIniFile);
begin
   if (Ini<>nil) and (Section<>'') then begin
      Top:=Ini.ReadInteger(Section, 'fGroupBy.Top', Self.Top);
      Left:=Ini.ReadInteger(Section, 'fGroupBy.Left', Self.Left);
      Width:=Ini.ReadInteger(Section, 'fGroupBy.Width', Self.Width);
      Height:=Ini.ReadInteger(Section, 'fGroupBy.Height', Self.Height);
      WindowState:=TWindowState(GetEnumValue(TypeInfo(TWindowState), Ini.ReadString(Section, 'fGroupBy.WindowState', GetEnumName(TypeInfo(TWindowState), Ord(Self.WindowState)))));
   end;
end;

procedure TfmGroupBy.SaveLayout(Section: string; Ini: TCustomIniFile);
begin
   if (Ini<>nil) and (Section<>'') then begin
      if WindowState<>wsMaximized then begin
         Ini.WriteInteger(Section, 'fGroupBy.Top', Self.Top);
         Ini.WriteInteger(Section, 'fGroupBy.Left', Self.Left);
         Ini.WriteInteger(Section, 'fGroupBy.Width', Self.Width);
         Ini.WriteInteger(Section, 'fGroupBy.Height', Self.Height);
      end;
   end;
end;

function TfmGroupBy.SetGroupBy(ChangeOrderBy: Boolean): Boolean;
begin
   Result:=False;
   if FGroupBy.GetSQL(FSQL, FFilterInterface, FFilterInterface.GetSQL2(FFilter, FIsFiltered)) then begin
      Screen.Cursor:=crSQLWait;
      try
         try
            Result:=True;
            if ChangeOrderBy then begin
               ConfigColumn;
               ConfigOrderBy;
            end;
            SetSQL(FSQL);
         except
            on E: Exception do begin
               MessageDlgR(E.Message, mtError, [mbOK], 0);
               Result:=False;
            end;
         end;
      finally
         Screen.Cursor:=crDefault;
      end;
   end;
end;

procedure TfmGroupBy.acOrderByExecute(Sender: TObject);
begin
//
end;

procedure TfmGroupBy.ConfigOrderBy;
var
   I: Integer;
   GroupItem: TGroupItem;
   ColumnItem: TGroupColumnItem;
   MenuItem: TMenuItem;

   function AddMenuItem(S: string): TMenuItem;
   begin
      Result:=TMenuItem.Create(Self);
      Result.Caption:=S;
      Result.RadioItem:=True;
      Result.GroupIndex:=2;
      Result.OnClick:=OnOrderByClick;
      pmOrderBy.Items.Add(Result);
   end;

begin
   FField2Menu.Clear;
   pmOrderBy.Items.Clear;
   for I:=0 to Pred(FGroupBy.GroupList.Count) do begin
      GroupItem:=FGroupBy.GroupList[I];
      if (GroupItem<>nil) and GroupItem.IsVisible then begin
         MenuItem:=TMenuItem.Create(Self);
         MenuItem.Caption:='по '+GroupItem.Title;
         MenuItem.Tag:=Integer(GroupItem);
         MenuItem.RadioItem:=True;
         MenuItem.GroupIndex:=1;
         MenuItem.OnClick:=OnOrderFieldClick;
         pmOrderBy.Items.Add(MenuItem);
         FField2Menu.AddObject(GroupItem.FieldName, MenuItem);
      end;
   end;
   for I:=0 to Pred(FGroupBy.ColumnList.Count) do begin
      ColumnItem:=FGroupBy.ColumnList[I];
      if (ColumnItem<>nil) and ColumnItem.IsVisible then begin
         MenuItem:=TMenuItem.Create(Self);
         MenuItem.Caption:='по '+ColumnItem.Title;
         MenuItem.Tag:=Integer(ColumnItem);
         MenuItem.RadioItem:=True;
         MenuItem.GroupIndex:=1;
         MenuItem.OnClick:=OnOrderFieldClick;
         pmOrderBy.Items.Add(MenuItem);
         FField2Menu.AddObject(ColumnItem.FieldName, MenuItem);
      end;
   end;
   if pmOrderBy.Items.Count>0 then begin
      MenuItem:=TMenuItem.Create(Self);
      MenuItem.Caption:='-';
      pmOrderBy.Items.Add(MenuItem);
      FOrderMenu[True]:=AddMenuItem('по возрастанию');
      FOrderMenu[False]:=AddMenuItem('по убыванию');
      FSortAscend:=False;
      FOrderMenu[FSortAscend].Checked:=True
   end;
end;

procedure TfmGroupBy.OnOrderByClick(Sender: TObject);
var
   MenuItem: TMenuItem;
begin
   MenuItem:=TMenuItem(Sender);
   MenuItem.Checked:=True;
   FSortAscend:=FOrderMenu[True]=MenuItem;
   if FGroupBy.OrderList.Count>0 then begin
      FGroupBy.OrderList[0].Direction:=FSortAscend;
      SetOrderField(FGroupBy.OrderList[0].FieldPath);
   end;
end;

procedure TfmGroupBy.OnOrderFieldClick(Sender: TObject);
var
   MenuItem: TMenuItem;
   O: TObject;
   GroupItem: TGroupItem;
   ColumnItem: TGroupColumnItem;
   FieldName: string;
begin
   MenuItem:=TMenuItem(Sender);
   MenuItem.Checked:=True;
   O:=TObject(MenuItem.Tag);
   FieldName:='';
   if O is TGroupItem then begin
      GroupItem:=O as TGroupItem;
      FieldName:=GroupItem.FieldName;
   end
   else if O is TGroupColumnItem then begin
      ColumnItem:=O as TGroupColumnItem;
      FieldName:=ColumnItem.FieldName;
   end;
   SetOrderField(FieldName);
end;

procedure TfmGroupBy.dgGroupTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
   if Column.Title.SortMarker<>smNoneEh then begin
      FSortAscend:=not FSortAscend;
      if FGroupBy.OrderList.Count>0 then begin
         FGroupBy.OrderList[0].Direction:=FSortAscend;
      end;
   end;
   SetOrderField(Column.FieldName);
end;

procedure TfmGroupBy.SetOrderField(FieldName: string);
const
   CMapDirection: array [Boolean] of TSortMarkerEh=(smDownEh, smUpEh);
var
   Column: TColumnEh;
   MenuItem: TMenuItem;
begin
   if FieldName<>'' then begin
      FGroupBy.OrderList.Clear;
      FGroupBy.OrderList.AddNew(FieldName, FSortAscend, True);
      SetGroupBy(False);
      Column:=dgGroup.FieldColumns[FieldName];
      Column.Title.SortMarker:=CMapDirection[FSortAscend];
      MenuItem:=TMenuItem(FField2Menu.Objects[FField2Menu.IndexOf(FieldName)]);
      MenuItem.Checked:=True;
      FOrderMenu[FSortAscend].Checked:=True;
   end;
end;

procedure TfmGroupBy.OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
   Column: TColumnEh;
   SprItem: TSprItem;
begin
   Column:=TColumnEh(Sender);
   SprItem:=TSprItem(Column.Tag);
   if (Params.Text<>'') and (Column.Field<>nil) then begin
      if SprItem.DataSet.Locate(SprItem.KeyFieldName, Column.Field.AsString, []) then begin
         Params.Text:=SprItem.DataSet.FindField(SprItem.NameFieldName).AsString;
      end;
   end;
end;

function GetFolderMyDocument: string;
var
   ShellMalloc: IMalloc;
   ppidl: PItemIdList;
   S,sPath: string;
   n:Integer;
begin
  ppidl:=nil;
  S:='';
  n:=GlobalTask.ParamAsInteger('FOLDER_MYDOK');
  sPath:=Trim(GlobalTask.ParamAsString('PATH_MYDOK'));
  if (n=0) or (n=1) or (sPath='') then begin
    if n=1 then  begin
      S:=CheckSleshN(ExtractFilePath(Application.ExeName))+'Doc';
      ForceDirectories(S);
    end else begin
      try
        if SHGetMalloc(ShellMalloc)=NOERROR then begin
          SHGetSpecialFolderLocation(0, CSIDL_PERSONAL, ppidl);
          SetLength(S, MAX_PATH);
          if not SHGetPathFromIDList(ppidl, PChar(S)) then begin
            S:='';
          end else begin
            SetLength(S, LStrLen(PChar(S)));
          end;
        end;
      finally
        if ppidl <> nil then begin
          ShellMalloc.Free(ppidl);
        end;
      end;
    end;
  end else begin
    S:=sPath;
    ForceDirectories(S);
  end;
  Result:=S;
end;

procedure TfmGroupBy.ConfigExport;
var
   I: TExportFormat;
   S: string;
   Ind: Integer;
   FilterInd: Integer;
begin
   sdSaveAs.InitialDir:=GetFolderMyDocument;
   sdSaveAs.Filter:='';
   Ind:=0;
   FilterInd:=1;
   for I:=Low(TExportFormat) to High(TExportFormat) do begin
      Inc(Ind);
      if I=efRtf then begin
         FilterInd:=Ind;
      end;
      S:=Format('%s (*.%1:s)|*.%1:s', [FormatName[I], FormatExt[I]]);
      if sdSaveAs.Filter='' then begin
         sdSaveAs.Filter:=S;
      end
      else begin
         sdSaveAs.Filter:=sdSaveAs.Filter+'|'+S;
      end;
   end;
   sdSaveAs.FilterIndex:=FilterInd;
end;

procedure TfmGroupBy.DoExport;
var
   Target: TExportFormat;
   FileName: string;
   I: Integer;
   Field: TField;
   Column: TColumnEh;
   ExportColumn: TExportColumn;
   ExportColumns: TExportColumnList;
   Bookmark: string;
begin
   if sdSaveAs.Execute then begin
      Target:=FormatInd[sdSaveAs.FilterIndex];
      FileName:=ExpandFileName(ChangeFileExt(Trim(sdSaveAs.FileName), '.'+FormatExt[Target]));
      ExportColumns:=TExportColumnList.Create;
      for I:=0 to Pred(dgGroup.Columns.Count) do begin
         Column:=dgGroup.Columns[I];
         Field:=Column.Field;
         if Field<>nil then begin
            ExportColumn:=ExportColumns.AddNew(Column.FieldName, Column.Index);
            ExportColumn.DisplayName:=Column.Title.Caption;
            ExportColumn.Caption:=Column.Title.Caption;
            ExportColumn.Font:=Column.Font;
            ExportColumn.Color:=Column.Color;
            ExportColumn.Width:=Column.Width;
            ExportColumn.Alignment:=Column.Alignment;
            ExportColumn.ColumnEh:=Column;
         end;
      end;
      quGroup.DisableControls;
      Bookmark:=quGroup.Bookmark;
      try
         //[2010.05.06]
         DoExportData(FileName, 'Сохранение результата запроса', '', quGroup, ExportColumns,Target, GlobalTask.ParamAsBoolean('SHOW_WRITE_DOK'), False, True, 1, 0, true, nil);
         //--ExportData(FileName, 'Сохранение результата запроса', '', quGroup, ExportColumns,Target, False, False, True, 1, 0);
         //\\
      finally
         ExportColumns.Free;
         quGroup.Bookmark:=Bookmark;
         quGroup.EnableControls;
      end;
   end;
end;

procedure TfmGroupBy.acCountExecute(Sender: TObject);
begin
   ShowMessageFmt('Количество записе: %d', [quGroup.RecordCount]);
end;

initialization
  nIndGroup:=1;


end.
