// форма для настройки полей для поиска
unit fFindFld; // find field setup form [29.09.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   mFindInt, IniFiles, TypInfo, StdCtrls, Grids, DBGridEh, Db, kbmMemTable;

type
   TfmFindFld=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      dsFields: TkbmMemTable;
      dsoFields: TDataSource;
      dgFields: TDBGridEh;
      dsFieldsName: TStringField;
      dsFieldsRealName: TStringField;
      dsFieldsCaption: TStringField;
      dsFieldsAddCaption: TStringField;
      dsFieldsAlias: TStringField;
      dsFieldsKindSpr: TBooleanField;
      dsFieldsVisible: TBooleanField;
      dsFieldsCaseSensitive: TBooleanField;
      dsFieldsIsUpper: TBooleanField;
      dsFieldsSprName: TStringField;
      dsFieldsOwner: TStringField;
      dsFieldsOrder: TIntegerField;
      dsFieldsGroup: TStringField;
      dsFieldsDefaultOp: TStringField;
      dsFieldsRelName: TStringField;
      dsFieldsSprEditKind: TStringField;
      dsFieldsKindRel: TStringField;
      dsFieldsKinds: TStringField;
      dsFieldsPath: TStringField;
      chbUpdate: TCheckBox;
      lbTables: TLabel;
      cbTables: TComboBox;
      cbGroups: TComboBox;
      lbGroup: TLabel;
      btRenameGroup: TButton;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure cbGroupsChange(Sender: TObject);
      procedure dgFieldsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
      procedure dsFieldsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
      procedure btRenameGroupClick(Sender: TObject);
      procedure cbTablesChange(Sender: TObject);
   private
      FFilterInterface: TFilterInterface;
      FGroupColumn: TColumnEh;
      FFilterGroup: string;
      FFilterPath: string;
      FTables: TStringList;
   public
      procedure SaveLayout(Section: string; Ini: TCustomIniFile);
      procedure LoadLayout(Section: string; Ini: TCustomIniFile);
      //
      procedure FieldsToDataSet;
      //
      procedure SetGroups;
      //
      procedure SetTables;
      //
      procedure InitColumns;
      //
      procedure DataSetToFields;
      //
      procedure SetGroupFilter(Group: string; ShowAll: Boolean);
      procedure SetTableFilter(Path: string; ShowAll: Boolean);
      //
      procedure RenameGroup(OldName: string);
   end;

function SetupFindFieldList(FilterInterface: TFilterInterface): Boolean;

implementation

{$R *.DFM}

function SetupFindFieldList(FilterInterface: TFilterInterface): Boolean;
begin
   Result:=False;
   with TfmFindFld.Create(nil) do begin
      try
         FFilterInterface:=FilterInterface;
         FFilterGroup:='';
         FFilterPath:='';
         InitColumns;
         FieldsToDataSet;
         SetTables;
         SetGroups;
         LoadLayout(FilterInterface.Section, FilterInterface.Ini);
         if ShowModal=mrOk then begin
            DataSetToFields;
            if chbUpdate.Checked then begin
               FilterInterface.SaveFieldList(FilterInterface.FindFieldList.FileName);
            end;
            Result:=True;
         end;
         SaveLayout(FilterInterface.Section, FilterInterface.Ini);
      finally
         Free;
      end;
   end;
end;

{ TfmFindFld }

procedure TfmFindFld.FieldsToDataSet;
var
   I: Integer;
   Field: TFindFieldItem;
   S: string;
begin
   dsFields.DisableControls;
   try
      dsFields.EmptyTable;
      for I:=0 to Pred(FFilterInterface.FindFieldList.Count) do begin
         Field:=FFilterInterface.FindFieldList[I];
         if Field<>nil then begin
            dsFields.Append;
            dsFieldsPath.AsString:=Field.Path; 
            dsFieldsName.AsString:=Field.Name;
            dsFieldsRealName.AsString:=Field.RealName;
            dsFieldsCaption.AsString:=Field.Caption;
            if Field.Caption=Field.AddCaption then begin
               dsFieldsAddCaption.AsString:='';
            end
            else begin
               dsFieldsAddCaption.AsString:=Field.AddCaption;
            end;
            dsFieldsAlias.AsString:=Field.Alias;
            S:='';
            if ffkString in Field.Kinds then S:='ffkString'
            else if ffkText in Field.Kinds then S:='ffkText'
            else if ffkBoolean in Field.Kinds then S:='ffkBoolean'
            else if ffkNumber in Field.Kinds then S:='ffkNumber'
            else if ffkFloat in Field.Kinds then S:='ffkFloat'
            else if ffkDate in Field.Kinds then S:='ffkDate'
            else if ffkList in Field.Kinds then S:='ffkList';
            dsFieldsKinds.AsString:=S;
            dsFieldsKindSpr.AsBoolean:=ffkSpr in Field.Kinds;
            dsFieldsVisible.AsBoolean:=Field.Visible;
            dsFieldsCaseSensitive.AsBoolean:=Field.CaseSensitive;
            dsFieldsIsUpper.AsBoolean:=Field.IsUpper;
            dsFieldsSprName.AsString:=Field.SprName;
            dsFieldsOrder.AsInteger:=Field.Order;
            dsFieldsGroup.AsString:=Field.Group;
            dsFieldsDefaultOp.AsString:=Field.DefaultOp;
            dsFieldsRelName.AsString:=Field.RelName;
            dsFieldsSprEditKind.AsString:=GetEnumName(TypeInfo(TSprEditKind), Ord(Field.SprEditKind));
            S:='';
            if ffkProp in Field.Kinds then S:='ffkProp'
            else if ffkRel in Field.Kinds then S:='ffkRel';
            dsFieldsKindRel.AsString:=S;
            if Field.Owner=nil then begin
               dsFieldsOwner.AsString:='-';
            end
            else begin
               dsFieldsOwner.AsString:=Field.Owner.Path;
            end;
            dsFields.Post;
         end;
      end;
   finally
      dsFields.EnableControls;
   end;
end;

procedure TfmFindFld.LoadLayout(Section: string; Ini: TCustomIniFile);
begin
   if (Ini<>nil) and (Section<>'') then begin
      Top:=Ini.ReadInteger(Section, 'fFindFld.Top', Self.Top);
      Left:=Ini.ReadInteger(Section, 'fFindFld.Left', Self.Left);
      Width:=Ini.ReadInteger(Section, 'fFindFld.Width', Self.Width);
      Height:=Ini.ReadInteger(Section, 'fFindFld.Height', Self.Height);
      WindowState:=TWindowState(GetEnumValue(TypeInfo(TWindowState), Ini.ReadString(Section, 'fFindFld.WindowState', GetEnumName(TypeInfo(TWindowState), Ord(Self.WindowState)))));
      dgFields.RestoreColumnsLayout(Ini, Section+'.fFindFld', [crpColIndexEh, crpColWidthsEh]);
   end;
end;

procedure TfmFindFld.SaveLayout(Section: string; Ini: TCustomIniFile);
begin
   if (Ini<>nil) and (Section<>'') then begin
      if WindowState<>wsMaximized then begin
         Ini.WriteInteger(Section, 'fFindFld.Top', Self.Top);
         Ini.WriteInteger(Section, 'fFindFld.Left', Self.Left);
         Ini.WriteInteger(Section, 'fFindFld.Width', Self.Width);
         Ini.WriteInteger(Section, 'fFindFld.Height', Self.Height);
      end;
      Ini.WriteString(Section, 'fFindFld.WindowState', GetEnumName(TypeInfo(TWindowState), Ord(Self.WindowState)));
      dgFields.SaveColumnsLayout(Ini, Section+'.fFindFld');
   end;
end;

procedure TfmFindFld.FormCreate(Sender: TObject);
begin
   dsFields.Open;
   FTables:=TStringList.Create;
end;

procedure TfmFindFld.FormDestroy(Sender: TObject);
begin
   FTables.Free;
   dsFields.Close;
end;

procedure TfmFindFld.InitColumns;
var
   I: Integer;
   Spr: TSprItem;
   Rel: TRelItem;
   Column: TColumnEh;
begin
   FGroupColumn:=dgFields.FieldColumns['Group'];
   Column:=dgFields.FieldColumns['SprName'];
   for I:=0 to Pred(FFilterInterface.SprList.Count) do begin
      Spr:=FFilterInterface.SprList[I];
      if Spr<>nil then begin
         Column.KeyList.Add(Spr.Name);
         Column.PickList.Add(Spr.Caption);
      end;
   end;
   Column:=dgFields.FieldColumns['RelName'];
   for I:=0 to Pred(FFilterInterface.RelList.Count) do begin
      Rel:=FFilterInterface.RelList[I];
      if Rel<>nil then begin
         Column.KeyList.Add(Rel.Name);
         Column.PickList.Add(Rel.TableName);
      end;
   end;
end;

procedure TfmFindFld.DataSetToFields;
var
   Field: TFindFieldItem;
   RealName: string;
   Caption: string;
   AddCaption: string;
   Alias: string;
   Kinds: TFindFieldKinds;
   Order: Integer;
   Group: string;
   DefaultOp: string;
   RelName: string;
   SprEditKind: TSprEditKind;
   Visible: Boolean;
   CaseSensitive: Boolean;
   IsUpper: Boolean;
   SprName: string;
begin
   dsFields.DisableControls;
   try
      dsFields.First;
      while not dsFields.Eof do begin
         Field:=FFilterInterface.FindFieldList.ByPath(dsFieldsPath.AsString);
         if Field<>nil then begin
            RealName:=dsFieldsRealName.AsString;
            Caption:=dsFieldsCaption.AsString;
            AddCaption:=dsFieldsAddCaption.AsString;
            Alias:=dsFieldsAlias.AsString;
            Kinds:=[TFindFieldKind(GetEnumValue(TypeInfo(TFindFieldKind), dsFieldsKinds.AsString))];
            if dsFieldsKindSpr.AsBoolean then begin
               Include(Kinds, ffkSpr);
            end;
            if dsFieldsKindRel.AsString<>'' then begin
               Include(Kinds, TFindFieldKind(GetEnumValue(TypeInfo(TFindFieldKind), dsFieldsKindRel.AsString)));
            end;
            Order:=dsFieldsOrder.AsInteger;
            Group:=dsFieldsGroup.AsString;
            DefaultOp:=dsFieldsDefaultOp.AsString;
            RelName:=dsFieldsRelName.AsString;
            SprEditKind:=TSprEditKind(GetEnumValue(TypeInfo(TSprEditKind), dsFieldsSprEditKind.AsString));
            Visible:=dsFieldsVisible.AsBoolean;
            CaseSensitive:=dsFieldsCaseSensitive.AsBoolean;
            IsUpper:=dsFieldsIsUpper.AsBoolean;
            SprName:=dsFieldsSprName.AsString;
            Field.Change(Caption, AddCaption, Alias, RealName, Group, DefaultOp, RelName, SprName, Kinds, SprEditKind, Visible, CaseSensitive, IsUpper, Order);
         end;
         dsFields.Next;
      end;
   finally
      dsFields.EnableControls;
   end;
end;

procedure TfmFindFld.SetGroups;
var
   Group: string;
   Bookmark: string;
   Filtered: Boolean;
begin
   // заполнение списка групп
   dsFields.DisableControls;
   try
      FGroupColumn.KeyList.Clear;
      FGroupColumn.PickList.Clear;
      FGroupColumn.KeyList.Add('');
      FGroupColumn.PickList.Add('');
      cbGroups.Clear;
      cbGroups.Items.Add('<все>');
      cbGroups.Items.Add('<только пустые>');
      Bookmark:=dsFields.Bookmark;
      Filtered:=dsFields.Filtered;
      dsFields.Filtered:=False;
      dsFields.First;
      while not dsFields.Eof do begin
         Group:=dsFieldsGroup.AsString;
         if (Group<>'') and (cbGroups.Items.IndexOf(Group)=-1) then begin
            cbGroups.Items.Add(Group);
            // заполнение списка групп для колонки
            if FGroupColumn<>nil then begin
               FGroupColumn.KeyList.Add(Group);
               FGroupColumn.PickList.Add(Group);
            end;
         end;
         dsFields.Next;
      end;
      cbGroups.ItemIndex:=0;
      cbGroups.DropDownCount:=cbGroups.Items.Count;
      dsFields.Filtered:=Filtered;
      dsFields.Bookmark:=Bookmark;
   finally
      dsFields.EnableControls;
   end;
   btRenameGroup.Enabled:=False;
   // установить фильтр по группе
   SetGroupFilter('', True);
end;

procedure TfmFindFld.cbGroupsChange(Sender: TObject);
begin
   if cbGroups.ItemIndex=0 then begin
      SetGroupFilter('', True);
      btRenameGroup.Enabled:=False;
   end
   else if cbGroups.ItemIndex=1 then begin
      SetGroupFilter('', False);
      btRenameGroup.Enabled:=False;
   end
   else if cbGroups.ItemIndex<>-1 then begin
      SetGroupFilter(cbGroups.Items[cbGroups.ItemIndex], False);
      btRenameGroup.Enabled:=True;
   end
   else begin
      SetGroupFilter('', True);
      btRenameGroup.Enabled:=False;
   end;
end;

procedure TfmFindFld.SetGroupFilter(Group: string; ShowAll: Boolean);
begin
   if ShowAll then begin
      dsFields.Filtered:=False;
      FFilterGroup:='~';
      dsFields.Filtered:=True;
   end
   else begin
      dsFields.Filtered:=False;
      FFilterGroup:=Group;
      dsFields.Filtered:=True;
   end;
end;

procedure TfmFindFld.dgFieldsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
   if not dsFieldsVisible.AsBoolean and (State=[]) then begin
      Background:=clInfoBk;
   end
   else if dsFieldsKinds.AsString='ffkList' then begin
      if (Column.FieldName<>'Owner') and (Column.FieldName<>'Name') then begin
         Background:=clAqua;
      end;
   end;
end;

procedure TfmFindFld.dsFieldsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
   fGroup: Boolean;
   fPath: Boolean;
begin
   if FFilterGroup='~' then begin
      fGroup:=True;
   end
   else begin
      fGroup:=AnsiCompareText(dsFieldsGroup.AsString, FFilterGroup)=0;
   end;
   if FFilterPath='' then begin
      fPath:=True;
   end
   else begin
      fPath:=AnsiCompareText(dsFieldsPath.AsString, FFilterPath+dsFieldsName.AsString)=0;
   end;
   Accept:=fGroup and fPath;
end;

procedure TfmFindFld.btRenameGroupClick(Sender: TObject);
begin
   if cbGroups.ItemIndex>1 then begin
      RenameGroup(cbGroups.Items[cbGroups.ItemIndex]);
   end;
end;

procedure TfmFindFld.RenameGroup(OldName: string);
var
   I: Integer;
   DelGroup: Integer;
   ItemIndex: Integer;
   NewName: string;
   Filtered: Boolean;
   Bookmark: string;
begin
   NewName:=OldName;
   if InputQueryR('Переименование группы', 'Введите новое название группы', NewName) then begin
      if AnsiCompareText(NewName, OldName)<>0 then begin
         // заменяем старое имя группы на новой в таблице
         dsFields.DisableControls;
         try
            if dsFields.State=dsEdit then begin
               dsFields.CheckBrowseMode;
            end;
            Bookmark:=dsFields.Bookmark;
            Filtered:=dsFields.Filtered;
            dsFields.Filtered:=False;
            dsFields.First;
            while not dsFields.Eof do begin
               if AnsiCompareText(dsFieldsGroup.AsString, OldName)=0 then begin
                  dsFields.Edit;
                  dsFieldsGroup.AsString:=NewName;
                  dsFields.Post;
               end;
               dsFields.Next;
            end;
            if Filtered and (AnsiCompareText(FFilterGroup, OldName)=0) then begin
               FFilterGroup:=NewName;
            end;
            dsFields.Filtered:=Filtered;
            dsFields.Bookmark:=Bookmark;
            // заменяем старое имя группы на новой в списке групп
            DelGroup:=-1;
            ItemIndex:=cbGroups.ItemIndex;
            for I:=2 to Pred(cbGroups.Items.Count) do begin
               if AnsiCompareText(cbGroups.Items[I], OldName)=0 then begin
                  cbGroups.Items[I]:=NewName;
               end
               else if AnsiCompareText(cbGroups.Items[I], NewName)=0 then  begin
                  DelGroup:=I;
               end;
            end;
            cbGroups.ItemIndex:=ItemIndex;
            if DelGroup<>-1 then begin
               cbGroups.Items.Delete(DelGroup);
            end;
            // заменяем старое имя группы на новой в колонке таблицы
            if FGroupColumn<>nil then begin
               DelGroup:=-1;
               for I:=1 to Pred(FGroupColumn.KeyList.Count) do begin
                  if AnsiCompareText(FGroupColumn.KeyList[I], OldName)=0 then begin
                     FGroupColumn.KeyList[I]:=NewName;
                     FGroupColumn.PickList[I]:=NewName;
                  end
                  else if AnsiCompareText(FGroupColumn.KeyList[I], NewName)=0 then  begin
                     DelGroup:=I;
                  end;
               end;
               if DelGroup<>-1 then begin
                  FGroupColumn.KeyList.Delete(DelGroup);
                  FGroupColumn.PickList.Delete(DelGroup);
               end;
            end;
         finally
            dsFields.EnableControls;
         end;
      end;
   end;
end;

procedure TfmFindFld.SetTables;
var
   I: Integer;
   Field: TFindFieldItem;
begin
   // заполнение списка таблиц используемых при поиске
   FTables.Clear;
   cbTables.Clear;
   cbTables.Items.AddObject(FFilterInterface.RootCaption, nil);
   FTables.AddObject('', nil);
   for I:=0 to Pred(FFilterInterface.FindFieldList.Count) do begin
      Field:=FFilterInterface.FindFieldList[I];
      if (Field<>nil) and (ffkList in Field.Kinds) then begin
         FTables.AddObject(Field.Path+'.', Field);
         cbTables.Items.Add(Field.Indent+Field.Caption);
      end;
   end;
   cbTables.ItemIndex:=0;
   cbTables.DropDownCount:=cbTables.Items.Count;
end;

procedure TfmFindFld.cbTablesChange(Sender: TObject);
begin
   if cbTables.ItemIndex=-1 then begin
      SetTableFilter('', True);
   end
   else if cbTables.ItemIndex=0 then begin
      SetTableFilter('', True);
   end
   else begin
      SetTableFilter(FTables[cbTables.ItemIndex], False);
   end;
end;

procedure TfmFindFld.SetTableFilter(Path: string; ShowAll: Boolean);
begin
   if ShowAll then begin
      dsFields.Filtered:=False;
      FFilterPath:='';
      dsFields.Filtered:=True;
   end
   else begin
      dsFields.Filtered:=False;
      FFilterPath:=Path;
      dsFields.Filtered:=True;
   end;
end;

end.
