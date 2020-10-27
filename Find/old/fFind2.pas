// форма для редактирования фильтра
unit fFind2; // find form [13.09.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Menus, Controls, Forms, Dialogs,
   TypInfo, IniFiles, mFindInt, ExtCtrls, ElTree, StdCtrls, Buttons,
   ComCtrls, ActnList, ImgList, ToolWin, fFindSav, fFindTxt, fFindFld, fFindAdd,
   fOrderBy, ElList, ElXPThemedControl;

const
   //
   II_Save=0;
   II_Edit=1;
   II_Close=2;
   II_Find=3;
   II_Minus=4;
   II_Open=5;
   II_Plus=6;
   II_Clear=7;
   II_Par=8;
   II_Undo=9;
   II_Redo=10;
   II_SaveAs=11;
   II_Form=12;
   II_And=13;
   II_Or=14;
   II_ParIn=15;
   II_Blank=16;
   //
   BII_And=0;
   BII_Or=1;
   BII_Par=2;
   BII_ParList=3;

type
   TfmFind2=class(TForm)
      paLeft: TPanel;
      spLeftPanel: TSplitter;
      paClient: TPanel;
      gbFields: TGroupBox;
      cbGroups: TComboBox;
      tvFields: TElTree;
      gbFind: TGroupBox;
      tvFind: TElTree;
      alFind: TActionList;
      imFind: TImageList;
      acSave: TAction;
      acEdit: TAction;
      acExit: TAction;
      acFind: TAction;
      acDelete: TAction;
      acOpen: TAction;
      acAdd: TAction;
      acClear: TAction;
      tbaFind: TToolBar;
      tbAdd: TToolButton;
      tbDelete: TToolButton;
      tbEdit: TToolButton;
      tbClear: TToolButton;
      tbOpen: TToolButton;
      tbSave: TToolButton;
      tbExit: TToolButton;
      ilBig: TImageList;
      acUndo: TAction;
      acRedo: TAction;
      tbUndo: TToolButton;
      tbRedo: TToolButton;
      tbSaveAs: TToolButton;
      acSaveAs: TAction;
      acParams: TAction;
      tbParams: TToolButton;
      gbYear: TGroupBox;
      rbCurrent: TRadioButton;
      bvYear1: TBevel;
      rbAllYear: TRadioButton;
      bvYear2: TBevel;
      rbYear: TRadioButton;
      edYear: TEdit;
      udYear: TUpDown;
      tbPar: TToolButton;
      pmPar: TPopupMenu;
      miAddAndPar: TMenuItem;
      miAddOrPar: TMenuItem;
      acAddAndPar: TAction;
      acAddOrPar: TAction;
      acAddParPar: TAction;
      miAddParPar: TMenuItem;
      acParIn: TAction;
      miParIn: TMenuItem;
      pmOpen: TPopupMenu;
      tbFind: TToolButton;
      pmFields: TPopupMenu;
      miAddField: TMenuItem;
      pmFind: TPopupMenu;
      miDelFind: TMenuItem;
      miEditFind: TMenuItem;
      miClearFind: TMenuItem;
      miBlank1: TMenuItem;
      miExpandField: TMenuItem;
      miCollapseField: TMenuItem;
      miPar: TMenuItem;
      miAddParOr: TMenuItem;
      miAddParAnd: TMenuItem;
      miAddPar: TMenuItem;
      miParParIn: TMenuItem;
      miBlank2: TMenuItem;
      miUndo: TMenuItem;
      miRedo: TMenuItem;
      miBlank3: TMenuItem;
      miOpen: TMenuItem;
      miSave: TMenuItem;
      miSaveAs: TMenuItem;
      miBlank4: TMenuItem;
      miFind: TMenuItem;
      acNew: TAction;
      tbNew: TToolButton;
      tbBlank2: TToolButton;
      tbBlank1: TToolButton;
      tbBlank3: TToolButton;
      miNew: TMenuItem;
      tbaFields: TToolBar;
      tbExpandAll: TToolButton;
      tbCollapseAll: TToolButton;
      acExpandAll: TAction;
      acCollapseAll: TAction;
      paMiddle: TPanel;
      tbaFind2: TToolBar;
      tbDel2: TToolButton;
      tbAdd2: TToolButton;
      tbBlank5: TToolButton;
      btFind: TBitBtn;
      laCond: TLabel;
      btTest: TButton;
      acTest: TAction;
      acTestSQL: TAction;
      btTestSQL: TButton;
      tbFindField: TToolButton;
      tbBlank6: TToolButton;
      acFindField: TAction;
      btFieldProp: TButton;
      acFieldProp: TAction;
      bvYearBetwen: TBevel;
      edFirstYear: TEdit;
      edLastYear: TEdit;
      rbYearBetwen: TRadioButton;
      laLastYear: TLabel;
      udLastYear: TUpDown;
      udFirstYear: TUpDown;
      tbSaveExit: TToolButton;
      acSaveExit: TAction;
      acParDel: TAction;
      miParDel: TMenuItem;
      miParDel2: TMenuItem;
      tbOrderBy: TToolButton;
      acOrderBy: TAction;
      acAndOr: TAction;
      tbAndOr: TToolButton;
      miAndOr: TMenuItem;
      pmParams: TPopupMenu;
      miParamOption: TMenuItem;
      acParamOption: TAction;
      procedure acSaveExecute(Sender: TObject);
      procedure acEditExecute(Sender: TObject);
      procedure acExitExecute(Sender: TObject);
      procedure acFindExecute(Sender: TObject);
      procedure acDeleteExecute(Sender: TObject);
      procedure acOpenExecute(Sender: TObject);
      procedure acAddExecute(Sender: TObject);
      procedure acClearExecute(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure paLeftCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
      procedure tvFieldsAfterSelectionChange(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure tvFieldsDblClick(Sender: TObject);
      procedure cbGroupsChange(Sender: TObject);
      procedure tvFindAfterSelectionChange(Sender: TObject);
      procedure tvFindDblClick(Sender: TObject);
      procedure rbYearClick(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure acUndoExecute(Sender: TObject);
      procedure acRedoExecute(Sender: TObject);
      procedure acSaveAsExecute(Sender: TObject);
      procedure acParamsExecute(Sender: TObject);
      procedure acAddAndParExecute(Sender: TObject);
      procedure acAddOrParExecute(Sender: TObject);
      procedure acAddParParExecute(Sender: TObject);
      procedure tvFieldsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure OnMenuClick(Sender: TObject);
      procedure acNewExecute(Sender: TObject);
      procedure acExpandAllExecute(Sender: TObject);
      procedure acCollapseAllExecute(Sender: TObject);
      procedure acTestExecute(Sender: TObject);
      procedure acTestSQLExecute(Sender: TObject);
      procedure cbGroupsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
      procedure tvFieldsItemExpand(Sender: TObject; Item: TElTreeItem);
      procedure tvFieldsItemCollapse(Sender: TObject; Item: TElTreeItem);
      procedure acFindFieldExecute(Sender: TObject);
      procedure acFieldPropExecute(Sender: TObject);
      procedure acSaveExitExecute(Sender: TObject);
      procedure acParDelExecute(Sender: TObject);
      procedure paClientResize(Sender: TObject);
      procedure acOrderByExecute(Sender: TObject);
      procedure acParInExecute(Sender: TObject);
      procedure acAndOrExecute(Sender: TObject);
      procedure acParamOptionExecute(Sender: TObject);
   private
      {FAddImageIndex: Integer;}
      // текущий редактируемый фильтр
      FFilter: TFindList;
      // текущее выбранное поле в дереве выбора полей
      FField: TFindFieldItem;
      // узел в дереве для выбора текущего поля
      FFieldNode: TElTreeItem;
      // интерфейс фильтра
      FFilterInterface: TFilterInterface;
      // текущее выбранное условие в дереве условий
      FFind: TFindItem;
      // узел в дереве условий текущего условия
      FFindNode: TElTreeItem;
      // надо ли сохранять фильтр
      FIsSaved: Boolean;
      // список отмены действий по изменению условия
      FUndo: TFilterUndoList;
      // список повтора отмененных действий по изменению условия
      FRedo: TFilterUndoList;
      // максимальный размер списка отмены
      FMaxUndoRedo: Integer;
   private
      procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
      procedure WMActivateApp(var Msg: TWMActivateApp); message WM_ACTIVATEAPP;
      //
      function CanDelPar: Boolean;
      //
      procedure GotoField;
      //
      procedure SetComboBoxWidth;
      //
      procedure ChangeYear;
      procedure ChangeYear2;
      // функция проверяет можно ли выполнить операцию добавления для текущего поля и условия
      function CanAdd: Boolean;
      //
      function CanDelete: Boolean;
      //
      function CanFind: Boolean;
      //
      function CanEdit: Boolean;
      // функция проверяет можно ли выполнить операцию добавления для заданного поля и текущего условия
      function InternalCanAdd(Field: TFindFieldItem; Find: TFindItem; Node: TElTreeItem): Boolean;
      // добавить список условий поиска в дерево
      procedure AddFindList(Tree: TElTree; Node: TElTreeItem; FindList: TFindList);
      // добавить условие в дерево условий
      function AddFindNode(Tree: TElTree; Node: TElTreeItem; Child, AddUp: Boolean; Caption: string; ImageIndex, StateIndex: Integer): TElTreeItem;
      // добавить список значений в дерево условий
      procedure AddFindValues(Tree: TElTree; Owner: TElTreeItem; FindItem: TFindItem);
      // построить дерево полей для поиска
      procedure BuildFieldTree(Tree: TElTree; cbGroups: TComboBox; Fields: TFindFieldList; FilterInterface: TFilterInterface);
      // инициализация диапазона поиска
      procedure InitSearchRange(FilterInterface: TFilterInterface);
      // обновить доступность кнопок
      procedure UpdateButtons;
      // обновить заголовок
      procedure UpdateCaption;
      // обновить доступность полей для вставки в условие
      procedure UpdateCanAdd;
      // изменилось выделенное поле в дереве для выбора полей
      procedure FieldNodeChange;
      // изменилось выделенной условие в дереве условий
      procedure FindNodeChange;
      // получить условие поиска по его узлу
      function GetFindItem(Node: TElTreeItem): TFindItem;
      // измениоась группа (список) в быстром подводе
      procedure GroupChange;
      // установить текущее поле и узел в дереве выбора полей
      procedure SetField(Field: TFindFieldItem; Node: TElTreeItem);
      // установить текущее условие поиск и узел в дереве условий
      procedure SetFind(Find: TFindItem; Node: TElTreeItem);
      // добавить условие
      procedure Add;
      // добавить условие
      procedure InternalAdd(var Node: TElTreeItem; var FindItem: TFindItem; Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue;  AndOr, IgnoreCase, IsParam, NeedValue: Boolean; Undo, AddUp: Boolean; DatePart: TDateKind);
      // добавить скобки
      function InternalAddPar(Node: TElTreeItem; FindItem: TFindItem; AndOr, ParPar, AddUp, Undo: Boolean): TElTreeItem;
      // удалить условие
      procedure InternalDelete(Node: TElTreeItem; FindItem: TFindItem; Undo, OnlyPar: Boolean);
      //
      procedure InternalDeleteValue(ValueNode: TElTreeItem; FindNode: TElTreeItem; Undo: Boolean);
      //
      procedure Edit;
      // редактировать условие
      procedure InternalEdit(FindItem: TFindItem; Node: TElTreeItem);
      // изменить текущее условие
      procedure InternalChange(Node: TElTreeItem; FindItem: TFindItem; Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue;  AndOr, IgnoreCase, IsParam, NeedValue: Boolean; DatePart: TDateKind);
      // очистить полностью дерево условий
      procedure Clear;
      // сохранить фильтр в файл
      function SaveToFile(Filter: TFindList; SaveAs: Boolean): Boolean;
      // открыть фильтр
      procedure LoadFromFile(Filter: TFindList);
      // выполнить отмену последнего действия
      procedure DoUndo;
      // повторить отменное действие
      procedure DoRedo;
      // добавить фильтр в список отмены
      procedure AddUndo(Filter: TFindList; ActionKind: TUndoActionKind);
      // добавить фильтр в список повтора
      procedure AddRedo(Filter: TFindList; ActionKind: TUndoActionKind);
      // тестирование формы с параметрами
      procedure TestParams;
      // возвращает первое поле в условие (не скобки) поднимая вверх по дереву
      function GetFieldUp(Node: TElTreeItem): TFindFieldItem;
      //
      procedure InternalOpen(Filter: TFindList);
      //
      procedure UpdateFilterList;
      //
      procedure ConfigView;
      //
      procedure InternalNew;
      //
      procedure SaveView;
      //
      procedure RestoreView;
      //
      procedure UpdateFilter;
      procedure UpdateSearchDate;
      //
      procedure SaveLayout(Section: string; Ini: TCustomIniFile);
      procedure LoadLayout(Section: string; Ini: TCustomIniFile);
      //
      procedure SetFocusedNode(Tree: TElTree; Node: TElTreeItem);
      //
      procedure InternalParIn(List: TElList);
      //
      procedure UpdateGroupHint;
   public
      // построить дерево условий для поиска
      procedure BuildFindTree(Tree: TElTree; FindList: TFindList);
      //
      {function GetImageIndex(Field: TFindFieldItem): Integer;}
   end;

function EditFind2(FilterInterface: TFilterInterface; Section: string; Ini: TCustomIniFile; AutoSave: Boolean): Boolean;

const
   CFindCaption: string='Создать условие отбора';
   CFindAction: string='Установить';

var
   FindForm: TfmFind2;

implementation
uses
   dFindImg, fFindOpt;

{$R *.DFM}

function EditFind2(FilterInterface: TFilterInterface; Section: string; Ini: TCustomIniFile; AutoSave: Boolean): Boolean;
begin
   Result:=False;
   FindForm:=TfmFind2.Create(nil);
   with FindForm do begin
      try
         FFilterInterface:=FilterInterface;
         FFilter.Assign(FFilterInterface.Filter);
         FIsSaved:=FFilterInterface.FilterIsSaved;
         ConfigView;
         if FilterInterface.DoFieldSort and FilterInterface.FirstRun then begin
            FilterInterface.FindFieldList.Sort;
         end;
         BuildFieldTree(tvFields, cbGroups, FilterInterface.FindFieldList, FilterInterface);
         BuildFindTree(tvFind, FFilter);
         InitSearchRange(FFilterInterface);
         UpdateFilterList;
         LoadLayout(Section, Ini);
         RestoreView;
         FieldNodeChange;
         SetComboBoxWidth; // эта строчка должна идти строго после FieldNodeChange
         FindNodeChange;
         UpdateButtons;
         if ShowModal=mrOk then begin
            UpdateFilter;
            Result:=True;
         end;
         if AutoSave then begin
            SaveLayout(Section, Ini);
         end;
      finally
         Free;
         FindForm:=nil;
      end;
   end;
end;

{ TfmFind2 }

procedure TfmFind2.LoadLayout(Section: string; Ini: TCustomIniFile);
begin
   SetComboBoxHeight(cbGroups, 0);
   if (Ini<>nil) and (Section<>'') then begin
      Top:=Ini.ReadInteger(Section, 'Top', Self.Top);
      Left:=Ini.ReadInteger(Section, 'Left', Self.Left);
      Width:=Ini.ReadInteger(Section, 'Width', Self.Width);
      Height:=Ini.ReadInteger(Section, 'Height', Self.Height);
      WindowState:=TWindowState(GetEnumValue(TypeInfo(TWindowState), Ini.ReadString(Section, 'WindowState', GetEnumName(TypeInfo(TWindowState), Ord(Self.WindowState)))));
      paLeft.Width:=Ini.ReadInteger(Section, 'paLeft.Width', paLeft.Width);
      tvFind.FocusedSelectColor:=Ini.ReadInteger(Section, 'FocusedSelectColor', $00C2D6E0);
   end;
end;

procedure TfmFind2.SaveLayout(Section: string; Ini: TCustomIniFile);
begin
   if (Ini<>nil) and (Section<>'') then begin
      if WindowState<>wsMaximized then begin
         Ini.WriteInteger(Section, 'Top', Self.Top);
         Ini.WriteInteger(Section, 'Left', Self.Left);
         Ini.WriteInteger(Section, 'Width', Self.Width);
         Ini.WriteInteger(Section, 'Height', Self.Height);
      end;
      Ini.WriteString(Section, 'WindowState', GetEnumName(TypeInfo(TWindowState), Ord(Self.WindowState)));
      Ini.WriteInteger(Section, 'paLeft.Width', paLeft.Width);
      Ini.WriteInteger(Section, 'FocusedSelectColor', tvFind.FocusedSelectColor);
   end;
end;

procedure TfmFind2.acSaveExecute(Sender: TObject);
begin
   SaveToFile(FFilter, False);
end;

procedure TfmFind2.acEditExecute(Sender: TObject);
begin
   Edit;
end;

procedure TfmFind2.acExitExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmFind2.acFindExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfmFind2.acDeleteExecute(Sender: TObject);
begin
   if (FFindNode=nil) and (FFind=nil) then begin
      if tvFind.ItemFocused<>nil then begin
         InternalDeleteValue(tvFind.ItemFocused, tvFind.ItemFocused.Parent, True);
      end;
   end
   else begin
      InternalDelete(FFindNode, FFind, True, False);
   end;
   FindNodeChange;
   UpdateButtons;
end;

procedure TfmFind2.acOpenExecute(Sender: TObject);
begin
   LoadFromFile(FFilter);
end;

procedure TfmFind2.acAddExecute(Sender: TObject);
begin
   Add;
end;

procedure TfmFind2.acClearExecute(Sender: TObject);
begin
   Clear;
end;

procedure TfmFind2.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   Combo: TComboBox;
begin
   if ActiveControl is TComboBox then begin
      Combo:=TComboBox(ActiveControl);
      if Combo.DroppedDown then Exit;
   end;
   if Key=VK_ESCAPE then begin
      ModalResult:=mrCancel;
   end;
end;

procedure TfmFind2.paLeftCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   if NewWidth>(ClientWidth-paClient.Constraints.MinWidth) then begin
      NewWidth:=ClientWidth-paClient.Constraints.MinWidth-spLeftPanel.Width;
      Resize:=True;
   end;
end;

procedure TfmFind2.BuildFieldTree(Tree: TElTree; cbGroups: TComboBox; Fields: TFindFieldList; FilterInterface: TFilterInterface);
begin
   Fields.BuildFieldTree(FilterInterface, Tree, cbGroups, True, False);
   SetComboBoxWidth;
   // раскрыть все дерево
   Tree.Items[0].Expand(FilterInterface.FirstRun and not FilterInterface.CollapseAll);
end;
(*
var
   Owners: TStringList;
   Groups: TStringList;
   I: Integer;
   J: Integer;
   P: Integer;
   Field: TFindFieldItem;
   RootNode: TElTreeItem;
   OwnerFolder: TElTreeItem;
   OwnerIndex: Integer;
   GroupIndex: Integer;
   GroupFolder: TElTreeItem;
   LastGroup: string;
   GroupName: string;
   RootGroup: string;
   FieldNode: TElTreeItem;

   procedure InitNode(Node: TElTreeItem; Color: TColor; Bold: Boolean; Tag: Integer);
   begin
      Node.ParentStyle:=False;
      Node.ParentColors:=False;
      Node.UseBkColor:=False;
      Node.Color:=Color;
      Node.Bold:=Bold;
      Node.Tag:=Tag;
   end;

   function CountIndent(Field: TFindFieldItem): string;
   var
      P: Integer;
      Group: string;
   begin
      Result:='';
      while Field<>nil do begin
         Group:=Field.Group;
         if Group<>'' then begin
            Result:=Result+CMinIndent;
            repeat
               P:=Pos('\', Group);
               if P<>0 then begin
                  Group[P]:=' ';
                  Result:=Result+CMinIndent;
               end;
            until P=0;
         end;
         Field:=Field.Owner;
      end;
   end;

   function AddGroup(Name: string): TElTreeItem;
   var
      Ind: Integer;
      AddName: string;
      PP: Integer;
   begin
      AddName:=Name;
      Name:=CMinIndent+Name;
      if Field.Owner<>nil then begin
         Name:=CountIndent(Field.Owner)+Field.Indent+AddName+'~'+Field.Owner.Path;
      end;
      Ind:=Groups.IndexOf(Name);
      if Ind=-1 then begin
         // удаляем вложенные группы, оставляя последнюю
         PP:=Pos('\', AddName);
         while PP<>0 do begin
            Delete(AddName, 1, PP);
            PP:=Pos('\', AddName);
         end;
         Result:=Tree.Items.AddChildObject(OwnerFolder, AddName, nil);
         InitNode(Result, clMaroon, True, CGroupTag);
         Groups.AddObject(Name, Result);
         if FilterInterface.GroupImageIndex<>-1 then begin
            Result.ImageIndex:=FilterInterface.AddImageIndex+FilterInterface.GroupImageIndex;
         end
         else begin
            Result.ImageIndex:=II_CloseGroup;
         end;
      end
      else begin
         Result:=TElTreeItem(Groups.Objects[Ind]);
      end;
   end;

begin
   Groups:=TStringList.Create;
   Owners:=TStringList.Create;
   cbGroups.Items.BeginUpdate;
   Tree.Items.BeginUpdate;
   try
      Tree.ShowButtons:=FilterInterface.ShowButtons;
      Tree.ShowRootButtons:=False;
      Tree.Images:=FilterInterface.Images.imFields;
      {FAddImageIndex:=0;
      // устанавливаем список картинок пользователя (если есть)
      if (FilterInterface.FieldImages<>nil) and (Tree.Images<>nil) then begin
         FAddImageIndex:=Tree.Images.Count;
         Tree.Images.AddImages(FilterInterface.FieldImages);
      end;}
      //
      cbGroups.Clear;
      Tree.Items.Clear;
      // корень дерева
      RootNode:=Tree.Items.Add(nil, FilterInterface.RootCaption);
      InitNode(RootNode, clMaroon, True, CRootTag);
      if FilterInterface.RootImageIndex<>-1 then begin
         RootNode.ImageIndex:=FilterInterface.AddImageIndex+FilterInterface.RootImageIndex;
      end
      else begin
         RootNode.ImageIndex:=II_Tables;
      end;
      // цикл по списку полей, в котором строим дерево полей
      for I:=0 to Pred(Fields.Count) do begin
         Field:=Fields[I];
         OwnerFolder:=RootNode;
         GroupName:=Field.Group;
         GroupFolder:=nil;
         if (Field<>nil) and Field.Visible then begin
            // если поле имеет хозяина, то ищем этого хозяина в списке хозяев
            // (здесь неявно подразумевается, что хозяин уже добавлен в дерево)
            if Field.Owner<>nil then begin
               OwnerIndex:=Owners.IndexOf(Field.Owner.Path);
               if OwnerIndex<>-1 then begin
                  OwnerFolder:=TElTreeItem(Owners.Objects[OwnerIndex]);
               end;
            end;
            // если у поля есть группа, то ищем узел этой группы или создаем
            if GroupName<>'' then begin
               // обрабатываем вложенные группы (например, имея группу
               // "X\YY\ZZZ" добавим "X" и "X\YY")
               LastGroup:=GroupName;
               RootGroup:='';
               P:=Pos('\', LastGroup);
               while P<>0 do begin
                  if RootGroup='' then begin
                     RootGroup:=Copy(LastGroup, 1, Pred(P));
                  end
                  else begin
                     RootGroup:=RootGroup+'\'+Copy(LastGroup, 1, Pred(P));
                  end;
                  OwnerFolder:=AddGroup(RootGroup);
                  Delete(LastGroup, 1, P);
                  P:=Pos('\', LastGroup);
               end;
               //
               GroupFolder:=AddGroup(GroupName);
            end;
            // добавляем поле в дерево
            if GroupFolder<>nil then begin
               OwnerFolder:=GroupFolder;
            end;
            FieldNode:=Tree.Items.AddChildObject(OwnerFolder, Field.Caption, Field);
            // устанавливаем свойства добавленого в дерево узла
            FieldNode.ParentStyle:=False;
            FieldNode.ParentColors:=False;
            FieldNode.UseBkColor:=False;
            // устанавливаем иконку
            FieldNode.ImageIndex:=FilterInterface.GetImageIndex(Field);
            // для полей-списков делаем специальные действия
            if ffkList in Field.Kinds then begin
               FieldNode.Color:=clNavy;
               // добавляем поле-список в список хозяев
               Owners.AddObject(Field.Path, FieldNode);
               // добавляем поле-список в список групп
               if OwnerFolder=RootNode then begin
                  Groups.AddObject(CountIndent(Field)+Field.Indent+Field.Caption, FieldNode);
               end
               else begin
                  GroupIndex:=Pred(Groups.Count);
                  while GroupIndex>=0 do begin
                     GroupFolder:=TElTreeItem(Groups.Objects[GroupIndex]);
                     if (GroupFolder=OwnerFolder) or (GroupFolder.Parent=OwnerFolder) then begin
                        Groups.InsertObject(Succ(GroupIndex), CountIndent(Field)+Field.Indent+Field.Caption, FieldNode);
                        Break;
                     end;
                     Dec(GroupIndex);
                  end;
               end;
            end;
         end;
      end;
      // добавить группы и хозяев в быстрый подвод
      for I:=0 to Pred(Groups.Count) do begin
         GroupName:=Groups[I];
         P:=Pos('\', GroupName);
         if P<>0 then begin
            LastGroup:=GroupName;
            J:=1;
            GroupName:='';
            while (J<Length(LastGroup)) and (LastGroup[J]=' ') do begin
               GroupName:=GroupName+' ';
               Inc(J);
            end;
            Delete(LastGroup, 1, Pred(J));
            P:=Pos('\', LastGroup);
            while P<>0 do begin
               GroupName:=GroupName+CMinIndent;
               Delete(LastGroup, 1, P);
               P:=Pos('\', LastGroup);
            end;
            GroupName:=GroupName+LastGroup;
         end;
         P:=Pos('~', GroupName);
         if P<>0 then begin
            Delete(GroupName, P, Succ(Length(GroupName)-P));
         end;
         cbGroups.Items.AddObject(GroupName, Groups.Objects[I]);
      end;
      cbGroups.Items.InsertObject(0, FilterInterface.RootCaption, RootNode);
      if cbGroups.Items.Count<CMaxDropDownGroup then begin
         cbGroups.DropDownCount:=cbGroups.Items.Count;
      end
      else begin
         cbGroups.DropDownCount:=CMaxDropDownGroup;
      end;
      //
      SetComboBoxWidth;
      // раскрыть все дерево
      RootNode.Expand(FilterInterface.FirstRun and not FilterInterface.CollapseAll);
   finally
      Tree.Items.EndUpdate;
      cbGroups.Items.EndUpdate;
      Groups.Free;
      Owners.Free;
   end;
end;
*)

procedure TfmFind2.FieldNodeChange;
var
   O: TObject;
   Ind: Integer;
   Field: TFindFieldItem;
   Node: TElTreeItem;
begin
   Node:=tvFields.ItemFocused;
   Field:=nil;
   if (Node<>nil) and (Node.Data<>nil) then begin
      O:=TObject(Node.Data);
      if O is TFindFieldItem then begin
         Field:=TFindFieldItem(O);
      end;
   end;
   SetField(Field, Node);
   // устанавливаем такой же узел в быстром подводе
   if Node<>nil then begin
      Ind:=-1;
      while (Ind=-1) and (Node<>nil) do begin
         Ind:=cbGroups.Items.IndexOfObject(Node);
         Node:=Node.Parent;
      end;
      if Ind<>-1 then begin
         cbGroups.OnChange:=nil;
         cbGroups.ItemIndex:=Ind;
         UpdateGroupHint;
         cbGroups.OnChange:=cbGroupsChange;
      end;
   end;
end;

procedure TfmFind2.InitSearchRange(FilterInterface: TFilterInterface);

   function GetYear(D: TDateTime): Integer;
   var
      Year: Word;
      Month: Word;
      Day: Word;
   begin
      DecodeDate(D, Year, Month, Day);
      if Year=1899 then begin
         Result:=StrToInt(FormatDateTime('YYYY', Now));
      end
      else begin
         Result:=Year;
      end;
   end;

begin
   rbCurrent.Checked:=FilterInterface.CurrentSearchRange=srCurrent;
   rbAllYear.Checked:=FilterInterface.CurrentSearchRange=srAllYear;
   rbYear.Checked:=FilterInterface.CurrentSearchRange=srYear;
   rbYearBetwen.Checked:=FilterInterface.CurrentSearchRange=srYearBetween;
   ChangeYear;
   ChangeYear2;
   udYear.Position:=GetYear(FFilterInterface.CurrentSearchDate);
   udFirstYear.Position:=GetYear(FFilterInterface.FirstDate);
   udLastYear.Position:=GetYear(FFilterInterface.LastDate);
end;

procedure TfmFind2.tvFieldsAfterSelectionChange(Sender: TObject);
begin
   FieldNodeChange;
   UpdateButtons;
end;

procedure TfmFind2.UpdateButtons;
begin
   acAdd.Enabled:=CanAdd;
   acDelete.Enabled:=CanDelete;
   acEdit.Enabled:=CanEdit;
   acClear.Enabled:=FFilter.Count<>0;
   acSave.Enabled:=(not FIsSaved) and (FFilter.Count>0);
   acSaveAs.Enabled:=FFilter.Count>0;
   acFind.Enabled:=FFilter.HaveParams or (FFilterInterface.GetSQL(FFilter,false)<>'');
   acTestSQL.Enabled:=acFind.Enabled;
   acUndo.Enabled:=FUndo.Count>0;
   acRedo.Enabled:=FRedo.Count>0;
   acParams.Enabled:=FFilter.HaveParams;
   acAddParPar.Enabled:=(FFind<>nil) and (fikPar in FFind.Kinds);
   acFindField.Enabled:=CanFind;
   acParDel.Enabled:=CanDelPar;
   acParIn.Enabled:=tvFind.SelectedCount<>0;
   acAndOr.Enabled:=(FFind<>nil) and (FFindNode<>nil) and (FFindNode.GetPrevSibling<>nil);
   UpdateCaption;
   UpdateCanAdd;
end;

procedure TfmFind2.FormCreate(Sender: TObject);
begin
   FField:=nil;
   FFieldNode:=nil;
   FFind:=nil;
   FFindNode:=nil;
   FFilter:=TFindList.Create('', '', '', False);
   FMaxUndoRedo:=1000;
   FUndo:=TFilterUndoList.Create(FMaxUndoRedo);
   FRedo:=TFilterUndoList.Create(FMaxUndoRedo);
   {FAddImageIndex:=0;}
   //
   paClient.Constraints.MinWidth:=Pred(paClient.ClientWidth);
   //
   acFind.Caption:=CFindAction;
end;

procedure TfmFind2.SetField(Field: TFindFieldItem; Node: TElTreeItem);
begin
   FField:=Field;
   if Field=nil then begin
      FFieldNode:=nil;
   end
   else begin
      FFieldNode:=Node;
   end;
end;

procedure TfmFind2.tvFieldsDblClick(Sender: TObject);
var
   Node: TElTreeItem;
begin
   Node:=tvFields.ItemFocused;
   if (Node<>nil) and (Node.Tag=CGroupTag) then begin
      if Node.Expanded then begin
         Node.Collapse(False);
      end
      else begin
         Node.Expand(False);
      end;
   end
   else begin
      Add;
   end;
end;

procedure TfmFind2.Add;
var
   //--Oper: TOperItem;
   //--AndOr: Boolean;
   //--IgnoreCase: Boolean;
   //--Start: Boolean;
   //--Value1: TFindValue;
   //--Value2: TFindValue;
   //--OperVal: TFindValue;
   //--IsParam: Boolean;
   //--Place: TAddPlace;
   //--NeedValue: Boolean;
   AddUp: Boolean;
   Param: TAddFindFieldParam;
begin
   if CanAdd then begin
      //--Oper:=nil;
      //--AndOr:=False;
      //--IgnoreCase:=False;
      //--IsParam:=False;
      //--NeedValue:=True;
      //--Start:=False;
      //--Value1:=TFindValue.Create;
      //--Value2:=TFindValue.Create;
      //--OperVal:=TFindValue.Create;
      Param:=TAddFindFieldParam.Create(FField);
      try
         //--if AddFindField(True, FField, FFilterInterface, Value1, Value2, OperVal, Oper, False, AndOr, IgnoreCase, IsParam, NeedValue, Start, Place) then begin
         if AddFindField(True, False, FFilterInterface, Param) then begin
            // определяем место в дереве условий куда добавить новое условие
            AddUp:=Param.Place=apBegin;
            case Param.Place of
               apAfterCur: begin
                  // обработка для множественного выбора
                  if (FFindNode=nil) and (FFind=nil) and (tvFind.ItemFocused<>nil) then begin
                     FFindNode:=tvFind.ItemFocused.Parent;
                     FFind:=GetFindItem(FFindNode);
                  end;
               end;
               apBeforeCur: begin
                  // обработка для множественного выбора
                  if (FFindNode=nil) and (FFind=nil) and (tvFind.ItemFocused<>nil) then begin
                     FFindNode:=tvFind.ItemFocused.Parent;
                     FFind:=GetFindItem(FFindNode);
                  end;
                  //
                  if FFindNode<>nil then begin
                     if FFindNode.GetPrevSibling<>nil then begin
                        FFindNode:=FFindNode.GetPrevSibling;
                        FFind:=GetFindItem(FFindNode);
                     end
                     else if FFindNode.Parent<>nil then begin
                        FFindNode:=FFindNode.Parent;
                        FFind:=GetFindItem(FFindNode);
                        AddUp:=True;
                     end
                     else begin
                        FFindNode:=nil;
                        FFind:=nil;
                        AddUp:=True;
                     end;
                  end;
               end;
               apEnd: begin
                  FFindNode:=nil;
                  FFind:=nil;
               end;
               apBegin: begin
                  FFindNode:=nil;
                  FFind:=nil;
               end;
            end;
            // добавление
            InternalAdd(FFindNode, FFind, FField, Param.Oper, Param.Value1, Param.Value2, Param.OperVal, Param.AndOr, Param.IgnoreCase, Param.IsParam, Param.NeedValue, True, AddUp, Param.DatePart);
         end;
         FindNodeChange;
         UpdateButtons;
         if Param.Start then begin
            ModalResult:=mrOk;
         end;
      finally
         //--Value1.Free;
         //--Value2.Free;
         //--OperVal.Free;
         Param.Free;
      end;
   end;
end;

procedure TfmFind2.cbGroupsChange(Sender: TObject);
begin
   GroupChange;
end;

procedure TfmFind2.GroupChange;
const
   InChange: Boolean=False;
var
   Node: TElTreeItem;
   Parent: TElTreeItem;
begin
   if InChange then Exit;
   InChange:=True;
   try
      if cbGroups.ItemIndex<>-1 then begin
         Node:=TElTreeItem(cbGroups.Items.Objects[cbGroups.ItemIndex]);
         UpdateGroupHint;
         if Node<>nil then begin
            Parent:=Node.Parent;
            while Parent<>nil do begin
               Parent.Expand(False);
               Parent:=Parent.Parent;
            end;
            Node.Expand(False);
            tvFields.TopItem:=Node;
            tvFields.ItemFocused:=Node;
            FieldNodeChange;
            UpdateButtons;
         end;
      end
      else begin
         cbGroups.Hint:='';
      end;
   finally
      InChange:=False;
   end;
end;

procedure TfmFind2.BuildFindTree(Tree: TElTree; FindList: TFindList);
begin
   Tree.Items.BeginUpdate;
   try
      Tree.Items.Clear;
      AddFindList(Tree, nil, FindList);
   finally
      Tree.Items.EndUpdate;
   end;
   if Tree.Items.Count>0 then begin
      SetFocusedNode(Tree, Tree.Items[0]);
   end;
end;

procedure TfmFind2.AddFindList(Tree: TElTree; Node: TElTreeItem; FindList: TFindList);
var
   I: Integer;
   FindItem: TFindItem;
   NewNode: TElTreeItem;
   ImageIndex: Integer;
   ImageIndex2: Integer;
begin
   for I:=0 to Pred(FindList.Count) do begin
      FindItem:=FindList[I];
      if FindItem<>nil then begin
         // определяем первую иконку для условия
         ImageIndex:=-1;
         if fikAnd in FindItem.Kinds then begin
            ImageIndex:=BII_And;
         end
         else if fikOr in FindItem.Kinds then begin
            ImageIndex:=BII_Or;
         end;
         // определяем вторую иконку для условия
         ImageIndex2:=-1;
         if fikPar in FindItem.Kinds then begin
            ImageIndex2:=ImageIndex;
            if (FindItem.Field<>nil) and (ffkList in FindItem.Field.Kinds) then begin
               ImageIndex:=BII_ParList;
            end
            else begin
               ImageIndex:=BII_Par;
            end;
         end;
         // добавляем условие
         if fikPar in FindItem.Kinds then begin
            NewNode:=AddFindNode(Tree, Node, True, False, FindItem.GetCaption(FFilterInterface), ImageIndex, ImageIndex2);
            AddFindList(Tree, NewNode, FindItem.Par);
         end
         else begin
            NewNode:=AddFindNode(Tree, Node, True, False, FindItem.GetCaption(FFilterInterface), ImageIndex, ImageIndex2);
            AddFindValues(Tree, NewNode, FindItem);
         end;
         NewNode.ParentStyle:=False;
         NewNode.ParentColors:=False;
         NewNode.UseBkColor:=False;
         NewNode.Data:=FindItem;
      end;
   end;
end;

function TfmFind2.AddFindNode(Tree: TElTree; Node: TElTreeItem; Child, AddUp: Boolean; Caption: string; ImageIndex, StateIndex: Integer): TElTreeItem;
var
   NextNode: TElTreeItem;
   FindItem: TFindItem;
   Index1: Integer;
begin
   if Child then begin
      if AddUp then begin
         Result:=Tree.Items.AddChildFirst(Node, Caption);
      end
      else begin
         Result:=Tree.Items.AddChild(Node, Caption);
      end;
   end
   else begin
      if (Node=nil) or AddUp then begin
         if AddUp then begin
            Result:=Tree.Items.AddFirst(Node, Caption);
         end
         else begin
            Result:=Tree.Items.Add(Node, Caption);
         end;
      end
      else begin
         NextNode:=Node.GetNextSibling;
         if NextNode<>nil then begin
            Result:=Tree.Items.Insert(NextNode, Caption);
         end
         else begin
            Result:=Tree.Items.Add(Node, Caption);
         end;
      end;
   end;
   if (Result.GetPrevSibling=nil) then begin
      if StateIndex=-1 then begin
        ImageIndex:=-1;
      end;
      StateIndex:=-1;
   end;
   NextNode:=Result.GetNextSibling;
   if AddUp and (NextNode<>nil) then begin
      FindItem:=GetFindItem(NextNode);
      if FindItem<>nil then begin
         FindItem.Kinds:=FindItem.Kinds-[fikFirst];
         if fikAnd in FindItem.Kinds then begin
            Index1:=BII_And;
         end
         else begin
            Index1:=BII_Or;
         end;
         if fikPar in FindItem.Kinds then begin
            NextNode.ImageIndex2:=Index1;
         end
         else begin
            NextNode.ImageIndex:=Index1;
         end;
      end;
      FindItem:=GetFindItem(Result);
      if FindItem<>nil then begin
         FindItem.Kinds:=FindItem.Kinds+[fikFirst];
      end;
   end;
   Result.ImageIndex:=ImageIndex;
   Result.ImageIndex2:=StateIndex;
   SetFocusedNode(Tree, Result);
   if Node<>nil then begin
      Node.Expand(True);
   end;
end;

procedure TfmFind2.InternalAdd(var Node: TElTreeItem; var FindItem: TFindItem; Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; AndOr, IgnoreCase, IsParam, NeedValue: Boolean; Undo, AddUp: Boolean; DatePart: TDateKind);
var
   Kinds: TFindItemKinds;
   ImageIndex: Integer;
   ImageIndex2: Integer;
   NewNode: TElTreeItem;
   NewItem: TFindItem;
   Caption: string;
   OperExists: TOperItem;
   TagNode: TElTreeItem;
   TagItem: TFindItem;
begin
   if Oper<>nil then begin
      if Undo then begin
         AddUndo(FFilter, akAdd);
      end;
      // строим заголовок
      Caption:=TFindItem.BuildCaption(Field, Oper, FFilterInterface.RelList.ByName(Field.RelName), Value1, Value2, OperVal, IgnoreCase, IsParam, NeedValue, DatePart);
      // смотрим через какую операцию добавить условие
      if AndOr then begin
         Kinds:=[fikAnd];
         ImageIndex:=BII_And;
      end
      else begin
         Kinds:=[fikOr];
         ImageIndex:=BII_Or;
      end;
      ImageIndex2:=-1;
      // проверяем список
      if ffkList in Field.Kinds then begin
         Kinds:=Kinds+[fikPar];
         ImageIndex2:=ImageIndex;
         ImageIndex:=BII_ParList;
      end;
      // обрабатываем режим упрощенного добавления
      if FFilterInterface.SimpleAddMode then begin
         // 1. поднимаемся вверх и ищем куда добавить
         TagNode:=Node;
         TagItem:=FindItem;
         while not InternalCanAdd(Field, TagItem, TagNode) and (TagItem<>nil) do begin
            TagNode:=TagNode.Parent;
            TagItem:=GetFindItem(TagNode);
         end;
         // 2. смотрим надо ли добавлять списки
         OperExists:=FFilterInterface.OperList.ByName(CExistsOp);
         if (Field.Owner<>nil) and not InternalCanAdd(Field, TagItem, TagNode) then begin
            // [!] NB: последний параметр имеет здесь значение или нет ?
            InternalAdd(Node, FindItem, Field.Owner, OperExists, nil, nil, nil, AndOr, IgnoreCase, False, True, False, AddUp, dkFull);
         end
         else begin
            Node:=TagNode;
            FindItem:=TagItem;
         end;
      end;
      // добавляем новое условие
      if (Node<>nil) and (Field<>nil) and (fikPar in FindItem.Kinds) and (Field.Owner=GetFieldUp(Node)) then begin
          if AddUp then begin
             NewItem:=FindItem.Par.InsertFirst(Field, Oper, Value1, Value2, OperVal, Kinds, IgnoreCase, IsParam, NeedValue, DatePart);
          end
          else begin
             NewItem:=FindItem.Par.AddNew(Field, Oper, Value1, Value2, OperVal, Kinds, IgnoreCase, IsParam, NeedValue, DatePart);
          end;
          NewNode:=AddFindNode(tvFind, Node, True, AddUp, Caption, ImageIndex, ImageIndex2);
          AddFindValues(tvFind, NewNode, NewItem);
      end
      else if (FindItem<>nil) and (FindItem.Owner<>nil) then begin
          NewNode:=AddFindNode(tvFind, Node, False, False, Caption, ImageIndex, ImageIndex2);
          NewItem:=FindItem.Owner.InsertNew(FindItem, Field, Oper, Value1, Value2, OperVal, Kinds, IgnoreCase, IsParam, NeedValue, DatePart);
          AddFindValues(tvFind, NewNode, NewItem);
      end
      else begin
          NewNode:=AddFindNode(tvFind, Node, False, AddUp, Caption, ImageIndex, ImageIndex2);
          if AddUp then begin
             NewItem:=FFilter.InsertFirst(Field, Oper, Value1, Value2, OperVal, Kinds, IgnoreCase, IsParam, NeedValue, DatePart);
          end
          else begin
             NewItem:=FFilter.InsertNew(FindItem, Field, Oper, Value1, Value2, OperVal, Kinds, IgnoreCase, IsParam, NeedValue, DatePart);
          end;
          AddFindValues(tvFind, NewNode, NewItem);
      end;
      //
      NewNode.Data:=NewItem;
      if NewNode.GetPrevSibling=nil then begin
         NewItem.Kinds:=NewItem.Kinds+[fikFirst];
      end;
      Node:=NewNode;
      FindItem:=NewItem;
      FIsSaved:=False;
   end;
end;

procedure TfmFind2.FindNodeChange;
var
   Node: TElTreeItem;
   FindItem: TFindItem;
begin
   Node:=tvFind.ItemFocused;
   FindItem:=GetFindItem(Node);
   SetFind(FindItem, Node);
end;

procedure TfmFind2.tvFindAfterSelectionChange(Sender: TObject);
begin
   FindNodeChange;
   UpdateButtons;
end;

procedure TfmFind2.SetFind(Find: TFindItem; Node: TElTreeItem);
begin
   FFind:=Find;
   if Find=nil then begin
      FFindNode:=nil;
   end
   else begin
      FFindNode:=Node;
   end;
end;

function GetItemIndex(Node: TElTreeItem): Integer;
begin
   if Node<>nil then begin
      Result:=Node.AbsoluteIndex;
   end
   else begin
      Result:=-1;
   end;
end;

procedure TfmFind2.InternalDelete(Node: TElTreeItem; FindItem: TFindItem; Undo, OnlyPar: Boolean);
var
   Prev: TElTreeItem;
   Next: TElTreeItem;
   NextItem: TFindItem;
   SelIndex: Integer;
   TopIndex: Integer;
begin
   if (Node<>nil) and (FindItem<>nil) then begin
      if Undo then begin
         AddUndo(FFilter, akDelete);
      end;
      Prev:=Node.GetPrevSibling;
      if OnlyPar and (FindItem.Par.Count>0) then begin
         if Prev<>nil then begin
            FindItem.Par[0].Kinds:=FindItem.Par[0].Kinds-[fikFirst];
         end;
         FindItem.DeletePar;
         TopIndex:=GetItemIndex(tvFind.TopItem);
         SelIndex:=GetItemIndex(tvFind.ItemFocused);
         BuildFindTree(tvFind, FFilter);
         tvFind.TopItem:=tvFind.Items[TopIndex];
         SetFocusedNode(tvFind, tvFind.Items[SelIndex]);
      end
      else begin
         Next:=Node.GetNextSibling;
         if (Prev=nil) and (Next<>nil) then begin
            NextItem:=GetFindItem(Next);
            if NextItem<>nil then begin
               NextItem.Kinds:=NextItem.Kinds+[fikFirst];
            end;
            if fikPar in NextItem.Kinds then begin
               Next.ImageIndex2:=-1;
            end
            else begin
               Next.ImageIndex:=-1;
            end;
         end;
         Node.Delete;
         FindItem.Delete;
         if Prev<>nil then begin
            SetFocusedNode(tvFind, Prev);
         end
         else if Next<>nil then begin
            SetFocusedNode(tvFind, Next);
         end
         else begin
            SetFocusedNode(tvFind, tvFind.ItemFocused);
         end;
      end;
      FIsSaved:=False;
   end;
end;

function TfmFind2.GetFindItem(Node: TElTreeItem): TFindItem;
var
   O: TObject;
begin
   Result:=nil;
   if (Node<>nil) and (Node.Data<>nil) then begin
      O:=TObject(Node.Data);
      if O is TFindItem then begin
         Result:=TFindItem(O);
      end;
   end;
end;

procedure TfmFind2.InternalEdit(FindItem: TFindItem; Node: TElTreeItem);
var
   //--Oper: TOperItem;
   //--AndOr: Boolean;
   //--IgnoreCase: Boolean;
   //--Start: Boolean;
   //--Value1: TFindValue;
   //--Value2: TFindValue;
   //--OperVal: TFindValue;
   //--IsParam: Boolean;
   //--NeedValue: Boolean;
   //--Place: TAddPlace;
   Param: TAddFindFieldParam;
begin
   if (FindItem<>nil) and (FindItem.Field<>nil) then begin
      Param:=TAddFindFieldParam.Create(FindItem.Field);
      Param.Oper:=FindItem.Oper;
      Param.AndOr:=fikAnd in FindItem.Kinds;
      Param.IgnoreCase:=FindItem.IgnoreCase;
      Param.IsParam:=FindItem.IsParam;
      Param.NeedValue:=FindItem.NeedValue;
      Param.Start:=False;
      //--Value1:=TFindValue.Create;
      //--Value2:=TFindValue.Create;
      //--OperVal:=TFindValue.Create;
      Param.Value1.Assign(FindItem.Value1);
      Param.Value2.Assign(FindItem.Value2);
      Param.OperVal.Assign(FindItem.OperVal);
      Param.DatePart:=FindItem.DatePart;
      try
         //if AddFindField(False, FindItem.Field, FFilterInterface, Value1, Value2, OperVal, Oper, True, AndOr, IgnoreCase, IsParam, NeedValue, Start, Place) then begin
         if AddFindField(False, True, FFilterInterface, Param) then begin
            InternalChange(Node, FindItem, FindItem.Field, Param.Oper, Param.Value1, Param.Value2, Param.OperVal, Param.AndOr, Param.IgnoreCase, Param.IsParam, Param.NeedValue, Param.DatePart);
         end;
         UpdateButtons;
         if Param.Start then begin
            ModalResult:=mrOk;
         end;
      finally
         //--Value1.Free;
         //--Value2.Free;
         //--OperVal.Free;
         Param.Free;
      end;
   end;
end;

procedure TfmFind2.Clear;
begin
   AddUndo(FFilter, akClear);
   FFilter.Clear;
   FFilter.OrderList.Clear;
   tvFind.Items.BeginUpdate;
   tvFind.Items.Clear;
   tvFind.Items.EndUpdate;
   FIsSaved:=False;
   FindNodeChange;
   UpdateButtons;
end;

procedure TfmFind2.tvFindDblClick(Sender: TObject);
begin
   FindNodeChange;
   UpdateButtons;
   Edit;
end;

function TfmFind2.InternalAddPar(Node: TElTreeItem; FindItem: TFindItem; AndOr, ParPar, AddUp, Undo: Boolean): TElTreeItem;
var
   Kinds: TFindItemKinds;
var
   NewNode: TElTreeItem;
   NewItem: TFindItem;
   ImageIndex: Integer;
begin
   if AndOr then begin
      Kinds:=[fikAnd, fikPar];
      ImageIndex:=BII_And;
   end
   else begin
      ImageIndex:=BII_Or;
      Kinds:=[fikOr, fikPar];
   end;
   if Undo then begin
      AddUndo(FFilter, akAddPar);
   end;
   // обработка множественного выбора
   if (Node=nil) and (FindItem=nil) and (tvFind.ItemFocused<>nil) and (GetFindItem(tvFind.ItemFocused)=nil) then begin
      Node:=tvFind.ItemFocused.Parent;
      FindItem:=GetFindItem(Node);
   end;
   //
   if ParPar and (FindItem<>nil) and (fikPar in FindItem.Kinds) then begin
      if AddUp then begin
         NewItem:=FindItem.Par.InsertFirst(nil, nil, nil, nil, nil, Kinds, False, False, False, dkFull);
      end
      else begin
         NewItem:=FindItem.Par.AddNew(nil, nil, nil, nil, nil, Kinds, False, False, False, dkFull);
      end;
      NewNode:=AddFindNode(tvFind, Node, True, AddUp, '', BII_Par, ImageIndex);
   end
   else if (FindItem<>nil) and (FindItem.Owner<>nil) then begin
      NewNode:=AddFindNode(tvFind, Node, False, AddUp, '', BII_Par, ImageIndex);
      NewItem:=FindItem.Owner.InsertNew(FindItem, nil, nil, nil, nil, nil, Kinds, False, False, False, dkFull);
   end
   else begin
      NewNode:=AddFindNode(tvFind, Node, False, AddUp, '', BII_Par, ImageIndex);
      if AddUp then begin
         NewItem:=FFilter.InsertFirst(nil, nil, nil, nil, nil, Kinds, False, False, False, dkFull);
      end
      else begin
         NewItem:=FFilter.InsertNew(FindItem, nil, nil, nil, nil, nil, Kinds, False, False, False, dkFull);
      end;
   end;
   NewNode.Data:=NewItem;
   if NewNode.GetPrevSibling=nil then begin
      NewItem.Kinds:=NewItem.Kinds+[fikFirst];
   end;
   FIsSaved:=False;
   Result:=NewNode;
end;

procedure TfmFind2.InternalChange(Node: TElTreeItem; FindItem: TFindItem; Field: TFindFieldItem; Oper: TOperItem; Value1, Value2, OperVal: TFindValue; AndOr, IgnoreCase, IsParam, NeedValue: Boolean; DatePart: TDateKind);
var
   Kind: TFindItemKind;
begin
   if (Node<>nil) and (FindItem<>nil) then begin
      AddUndo(FFilter, akChange);
      if AndOr then begin
         Kind:=fikAnd;
      end
      else begin
         Kind:=fikOr;
      end;
      FindItem.Change(Field, Oper, Value1, Value2, OperVal, Kind, IgnoreCase, IsParam, NeedValue, DatePart);
      if not (fikFirst in FindItem.Kinds) then begin
         if fikPar in FindItem.Kinds then begin
            case Kind of
               fikAnd: Node.ImageIndex2:=BII_And;
               fikOr: Node.ImageIndex2:=BII_Or;
            end;
         end
         else begin
            case Kind of
               fikAnd: Node.ImageIndex:=BII_And;
               fikOr: Node.ImageIndex:=BII_Or;
            end;
         end;
      end;
      if (fikPar in FindItem.Kinds) and (Field=nil) then begin
      end
      else begin
         tvFind.Items.BeginUpdate;
         try
            Node.Text:=FindItem.BuildCaption(Field, Oper, FFilterInterface.RelList.ByName(Field.RelName), Value1, Value2, OperVal, IgnoreCase, IsParam, NeedValue, DatePart);
            // надо изменить список значений (если он есть)
            if Field.GetMultiSel(FFilterInterface.SprList) then begin
                while Node.ChildrenCount>0 do begin
                   Node.Children[0].Delete;
                end;
                AddFindValues(tvFind, Node, FindItem);
            end;
         finally
            tvFind.Items.EndUpdate;
         end;
      end;
      FIsSaved:=False;
   end;
end;

procedure TfmFind2.rbYearClick(Sender: TObject);
begin
   ChangeYear;
   ChangeYear2;
end;

procedure TfmFind2.FormDestroy(Sender: TObject);
begin
   SaveView;
   FFilter.Free;
   FUndo.Free;
   FRedo.Free;
end;

procedure TfmFind2.ChangeYear;
begin
   edYear.Enabled:=rbYear.Checked;
   udYear.Enabled:=rbYear.Checked;
end;

function TfmFind2.SaveToFile(Filter: TFindList; SaveAs: Boolean): Boolean;
var
   FileName: string;
   Err: string;
begin
   Result:=False;
   if Filter.Count>0 then begin
      if not SaveAs then begin
         if (Filter.Folder<>'') and (Filter.Caption<>'') then begin
            FileName:=Filter.Folder+'\'+Filter.Caption+'.flt';
            if not Filter.SaveToFile(FileName, Err) then begin
               if Err='' then begin
                  MessageDlgR('Ошибка сохранения', mtError, [mbCancel], 0);
               end
               else begin
                  MessageDlgR(Format('Ошибка сохранения: %s', [Err]), mtError, [mbCancel], 0);
               end;
            end
            else begin
               // проверяем: является ли только что сохраненный фильтр текущим
               if (AnsiCompareText(FFilterInterface.Filter.Caption, Filter.Caption)=0) and (AnsiCompareText(FFilterInterface.Filter.Folder, Filter.Folder)=0) then begin
                  FFilterInterface.Filter.Assign(Filter);
               end;
               FUndo.Clear;
               FRedo.Clear;
               FIsSaved:=True;
               UpdateButtons;
               Result:=True;
            end;
            Exit;                     
         end;
      end;
      if SaveFilter(FFilterInterface, Filter, True) then begin
         FUndo.Clear;
         FRedo.Clear;
         FIsSaved:=True;
         UpdateButtons;
         Result:=True;
      end;
      UpdateFilterList;
   end
   else begin
      MessageDlgR('Нельзя сохранить пустой список условий.', mtWarning, [mbOK], 0)
   end;
end;

procedure TfmFind2.LoadFromFile(Filter: TFindList);
begin
   if LoadFilter(FFilterInterface, Filter) then begin
      InternalOpen(Filter);
   end;
   UpdateFilterList;
end;

procedure TfmFind2.AddRedo(Filter: TFindList; ActionKind: TUndoActionKind);
begin
   FRedo.AddNew(Filter, GetItemIndex(tvFind.TopItem), GetItemIndex(tvFind.ItemFocused), ActionKind);
end;

procedure TfmFind2.AddUndo(Filter: TFindList; ActionKind: TUndoActionKind);
begin
   FUndo.AddNew(Filter, GetItemIndex(tvFind.TopItem), GetItemIndex(tvFind.ItemFocused), ActionKind);
end;

procedure TfmFind2.DoRedo;
var
   Redo: TFilterUndoItem;
begin
   if FRedo.Count>0 then begin
      Redo:=FRedo.Last;
      AddUndo(FFilter, Redo.ActionKind);
      FFilter.Assign(Redo.Filter);
      BuildFindTree(tvFind, FFilter);
      if Redo.TopIndex<>-1 then begin
         tvFind.TopItem:=tvFind.Items[Redo.TopIndex];
      end;
      if Redo.SelIndex<>-1 then begin
         SetFocusedNode(tvFind, tvFind.Items[Redo.SelIndex]);
      end;
      FRedo.DeleteLast;
      FindNodeChange;
      UpdateButtons;
   end;
end;

procedure TfmFind2.DoUndo;
var
   Undo: TFilterUndoItem;
begin
   if FUndo.Count>0 then begin
      Undo:=FUndo.Last;
      AddRedo(FFilter, Undo.ActionKind);
      FFilter.Assign(Undo.Filter);
      BuildFindTree(tvFind, FFilter);
      if Undo.TopIndex<>-1 then begin
         tvFind.TopItem:=tvFind.Items[Undo.TopIndex];
      end;
      if Undo.SelIndex<>-1 then begin
         SetFocusedNode(tvFind, tvFind.Items[Undo.SelIndex]);
      end;
      FUndo.DeleteLast;
      FindNodeChange;
      UpdateButtons;
   end;
end;

procedure TfmFind2.acUndoExecute(Sender: TObject);
begin
   DoUndo;
end;

procedure TfmFind2.acRedoExecute(Sender: TObject);
begin
   DoRedo;
end;

procedure TfmFind2.UpdateCaption;
var
   S: string;
begin
   S:='';
   if not FIsSaved then begin
      S:=' [изменен]';
   end;
   if FFilter.Caption<>'' then begin
      Caption:=Format('%s: %s - "%s"%s', [CFindCaption, FFilterInterface.RootCaption, FFilter.Caption, S]);
      gbFind.Caption:=Format(' Список условий для поиска "%s" ', [FFilter.Caption]);
   end
   else begin
      Caption:=Format('%s: %s', [CFindCaption, FFilterInterface.RootCaption]);
      gbFind.Caption:=' Список условий для поиска ';
   end;
end;

procedure TfmFind2.acSaveAsExecute(Sender: TObject);
begin
   SaveToFile(FFilter, True);
end;

procedure TfmFind2.acParamsExecute(Sender: TObject);
begin
   TestParams;
end;

procedure TfmFind2.TestParams;
var
   TopIndex: Integer;
   SelIndex: Integer;
begin
   if FFilterInterface.EditParams(FFilter, True) then begin
      FIsSaved:=False;
      TopIndex:=GetItemIndex(tvFind.TopItem);
      SelIndex:=GetItemIndex(tvFind.ItemFocused);
      BuildFindTree(tvFind, FFilter);
      if TopIndex<>-1 then begin
         tvFind.TopItem:=tvFind.Items[TopIndex];
      end;
      if SelIndex<>-1 then begin
         SetFocusedNode(tvFind, tvFind.Items[SelIndex]);
      end;
      FindNodeChange;
      UpdateButtons;
   end;
end;

procedure TfmFind2.acAddAndParExecute(Sender: TObject);
begin
   InternalAddPar(FFindNode, FFind, True, False, False, True);
   FindNodeChange;
   UpdateButtons;
end;

procedure TfmFind2.acAddOrParExecute(Sender: TObject);
begin
   InternalAddPar(FFindNode, FFind, False, False, False, True);
   FindNodeChange;
   UpdateButtons;
end;

procedure TfmFind2.acAddParParExecute(Sender: TObject);
begin
   InternalAddPar(FFindNode, FFind, False, True, False, True);
   FindNodeChange;
   UpdateButtons;
end;

function TfmFind2.GetFieldUp(Node: TElTreeItem): TFindFieldItem;
var
   FindItem: TFindItem;
begin
   if Node=nil then begin
      Result:=nil
   end
   else if Node.Data<>nil then begin
      FindItem:=TFindItem(Node.Data);
      if FindItem.Field<>nil then begin
         Result:=FindItem.Field;
      end
      else begin
         Result:=GetFieldUp(Node.Parent);
      end;
   end
   else begin
      Result:=GetFieldUp(Node.Parent);
   end;
end;

function TfmFind2.CanAdd: Boolean;
begin
   Result:=(FField<>nil) and (FFilterInterface.SimpleAddMode or InternalCanAdd(FField, FFind, FFindNode));
end;

procedure TfmFind2.UpdateCanAdd;
var
   I: Integer;
   Node: TElTreeItem;
   Field: TFindFieldItem;
   TagNode: TElTreeItem;
   TagItem: TFindItem;
begin
   if not FFilterInterface.SimpleAddMode then begin
      tvFields.Items.BeginUpdate;
      try
         TagNode:=FFindNode;
         TagItem:=FFind;
         for I:=0 to Pred(tvFields.Items.Count) do begin
            Node:=tvFields.Items[I];
            if (Node.Data<>nil) then begin
               Field:=TFindFieldItem(Node.Data);
               Node.Bold:=InternalCanAdd(Field, TagItem, TagNode);
            end;
         end;
      finally
         tvFields.Items.EndUpdate;
      end;
   end;
end;

function TfmFind2.InternalCanAdd(Field: TFindFieldItem; Find: TFindItem; Node: TElTreeItem): Boolean;
var
   FieldUp: TFindFieldItem;
begin
   Result:=False;
   if Field<>nil then begin
      // обработка множественного выбора
      if (Node=nil) and (Find=nil) and (tvFind.ItemFocused<>nil) and (GetFindItem(tvFind.ItemFocused)=nil) then begin
         Node:=tvFind.ItemFocused.Parent;
         Find:=GetFindItem(Node);
      end;
      FieldUp:=GetFieldUp(Node);
      if (Find=nil) and (Field.Owner=nil) then begin
         Result:=True;
      end
      else if (Field.Owner=nil) and (Find<>nil) and ((FieldUp=nil) or ((Find.Field<>nil) and (Find.Field.Owner=nil))) then begin
         Result:=True;
      end
      else if (Field.Owner<>nil) and (Find<>nil) and (FieldUp<>nil) and ((FieldUp=Field.Owner) or (FieldUp.Owner=Field.Owner)) then begin
         Result:=True;
      end;
   end;
end;

procedure TfmFind2.AddFindValues(Tree: TElTree; Owner: TElTreeItem; FindItem: TFindItem);
var
   Spr: TSprItem;
   Field: TFindFieldItem;
   I: Integer;
   Ind: Integer;
   S: string;
   Values: TStringList;
   Node: TElTreeItem;
begin
   Field:=FindItem.Field;
   if (FindItem.Oper<>nil) and (FindItem.Oper.NeedValue) and (Field<>nil) and (Field.IsSpr) and (FindItem.Value1.Values.Count>0) then begin
      Spr:=FFilterInterface.SprList.ByName(Field.SprName);
      if Spr<>nil then begin
         Values:=FindItem.Value1.Values;
         Spr.FillStrings(nil);
         for I:=0 to Pred(Values.Count) do begin
            Ind:=Spr.KeyList.IndexOf(Values[I]);
            if Ind<>-1 then begin
               S:=Format('"%s" (%s)', [Spr.NameList[Ind], Values[I]]);
            end
            else begin
               S:=Format('<нет в справочнике> (%s)', [Values[I]]);
            end;
            Node:=Tree.Items.AddChild(Owner, S);
            Node.Tag:=I;
            if (I<>0) and FindItem.Oper.MultiSel then begin
               if FindItem.Oper.MultiOr then begin
                  Node.ImageIndex:=BII_Or;
               end
               else begin
                  Node.ImageIndex:=BII_And;
               end;
            end;
         end;
         Owner.Expand(True);
      end;
   end;
end;

procedure TfmFind2.tvFieldsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_LEFT: Key:=VK_UP;
      VK_RIGHT: Key:=VK_DOWN;
   end;
end;

procedure TfmFind2.OnMenuClick(Sender: TObject);
var
   FilterName: TFilterName;
   Err: string;
begin
   if (Sender<>nil) and (Sender is TMenuItem) then begin
      FilterName:=FFilterInterface.FilterNameList[TMenuItem(Sender).Tag];
      if not FilterName.IsFolder then begin
         if FilterName.EqualFileName(FFilter) then begin
            if MessageDlgR('Список условий для поиска с таким названием уже открыт, переоткрыть?', mtConfirmation, [mbYes, mbNo], 0)<>mrYes then begin
               Exit;
            end;
         end;
         if FFilter.LoadFromFile(FilterName.FullFileName, Err, FFilterInterface.FindFieldList, FFilterInterface.OperList) then begin
            InternalOpen(FFilter);
         end
         else begin
            if Err='' then begin
               MessageDlgR('Ошибка открытия', mtError, [mbCancel], 0);
            end
            else begin
               MessageDlgR(Format('Ошибка открытия: %s', [Err]), mtError, [mbCancel], 0);
            end;
         end;
      end;
   end;                                            
end;

procedure TfmFind2.InternalOpen(Filter: TFindList);
begin
   FIsSaved:=True;
   BuildFindTree(tvFind, Filter);
   FUndo.Clear;
   FRedo.Clear;
   FindNodeChange;
   UpdateButtons;
end;

procedure TfmFind2.UpdateFilterList;
begin
   FFilterInterface.BuildFilterMenu(pmOpen, OnMenuClick);
end;

procedure TfmFind2.ConfigView;
begin
   // доступность кнопок "плюс"/"минус" в дереве полей
   miBlank1.Visible:=FFilterInterface.ShowButtons;
   miExpandField.Visible:=FFilterInterface.ShowButtons;
   miCollapseField.Visible:=FFilterInterface.ShowButtons;
   if not FFilterInterface.ShowButtons then begin
      tbaFields.Visible:=False;
      cbGroups.Left:=tvFields.Left;
      cbGroups.Width:=tvFields.Width;
   end;
   // не показывать выпадающий список групп полей
   if not FFilterInterface.ShowGroups then begin
      cbGroups.Visible:=False;
      tvFields.Height:=tvFields.Height+(tvFields.Top-cbGroups.Top);
      tvFields.Top:=cbGroups.Top;
   end;
   // не показывать пространство между деревом полей и деревом условий
   if not FFilterInterface.ShowMiddleSpace then begin
      paMiddle.Visible:=False;
   end;
   // заголовок для условий
   if FFilterInterface.RootCaption<>'' then begin
      laCond.Caption:=Format(laCond.Caption, [FFilterInterface.RootCaption]);
   end;
   // проверка прав пользователя
   acTestSQL.Visible:=urTestSQL in FFilterInterface.UserRights;
   acTest.Visible:=urTestError in FFilterInterface.UserRights;
   acFieldProp.Visible:=urFieldTree in FFilterInterface.UserRights;
   // надо ли показывать "За какой год искать"
   if not FFilterInterface.UseYear then begin
      gbYear.Visible:=False;
      gbFind.Height:=gbFind.Height+(gbYear.Top-gbFind.Top-gbFind.Height)+gbYear.Height;
   end;
   // надо ли показывать "Порядок сортировки"
   if FFilterInterface.OrderFields.Count=0 then begin
      acOrderBy.Visible:=False;
   end;
end;

procedure TfmFind2.acNewExecute(Sender: TObject);
var
   mr: Integer;
begin
   mr:=mrNo;
   if not FIsSaved then begin
      mr:=MessageDlgR('Текущий список условий не сохранен. Сохранить перед созданием нового?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
   end;
   if mr=mrYes then begin
      if SaveToFile(FFilter, False) then begin
         mr:=mrNo;
      end;
   end;
   if mr=mrNo then begin
      InternalNew;
   end;
end;

procedure TfmFind2.InternalNew;
begin
   FFilter.ClearFilter;
   FIsSaved:=False;
   BuildFindTree(tvFind, FFilter);
   FUndo.Clear;
   FRedo.Clear;
   FindNodeChange;
   UpdateButtons;
end;

procedure TfmFind2.acExpandAllExecute(Sender: TObject);
var
   I: Integer;
   Root: TElTreeItem;
begin
   if tvFields.Items.Count>0 then begin
      Root:=tvFields.Items[0];
      for I:=0 to Pred(Root.Count) do begin
         Root.Item[I].Expand(True);
      end;
   end;
end;

procedure TfmFind2.acCollapseAllExecute(Sender: TObject);
var
   I: Integer;
   Root: TElTreeItem;
begin
   if tvFields.Items.Count>0 then begin
      Root:=tvFields.Items[0];
      for I:=0 to Pred(Root.Count) do begin
         Root.Item[I].Collapse(True);
      end;
   end;
end;

procedure TfmFind2.acTestExecute(Sender: TObject);
var
   sl: TstringList;
begin
   sl:=TStringList.Create;
   try
      if FFilterInterface.TestErrors(sl) then begin
         ShowStrings(sl, 'Найдены следующие ошибки', FFilterInterface.Section, 'fFindTxtErr', FFilterInterface.Ini);
      end
      else begin
         ShowMessage('Ошибок не обнаружено');
      end;
   finally
      sl.Free;
   end;
end;

procedure TfmFind2.acTestSQLExecute(Sender: TObject);
var
   sl: TStringList;
   S: string;
   CurrentSearchRange: TSearchRange;
   CurrentSearchDate: TDateTime;
   FirstDate: TDateTime;
   LastDate: TDateTime;
begin
   CurrentSearchRange:=FFilterInterface.CurrentSearchRange;
   CurrentSearchDate:=FFilterInterface.CurrentSearchDate;
   FirstDate:=FFilterInterface.FirstDate;
   LastDate:=FFilterInterface.LastDate;
   try           
      UpdateSearchDate;
      //
      if Assigned(FFilterInterface.OnTestSQL) then begin
         FFilterInterface.OnTestSQL(FFilter);
      end
      else begin
         sl:=TStringList.Create;
         try
            sl.Add('УСЛОВИЕ:');
            sl.Add('');
            if FFilter.GetSQL(sl, FFilterInterface) then begin
               S:=FFilterInterface.GetOrderBy(FFilter);
               sl.Add('');
               sl.Add('СОРТИРОВКА:');
               sl.Add('');
               sl.Add(S);
               ShowStrings(sl, 'Запрос', FFilterInterface.Section, 'fFindTxt', FFilterInterface.Ini);
            end;
         finally
            sl.Free;
         end;
      end;
   finally
      FFilterInterface.CurrentSearchRange:=CurrentSearchRange;
      FFilterInterface.CurrentSearchDate:=CurrentSearchDate;
      FFilterInterface.FirstDate:=FirstDate;
      FFilterInterface.LastDate:=LastDate;
   end;
end;

procedure TfmFind2.cbGroupsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
   I: Integer;
   S: string;
   B: Integer;
   Blank: string;
   Node: TElTreeItem;
begin
   S:=cbGroups.Items[Index];
   I:=1;
   Blank:='';
   while I<Length(S) do begin
      if S[I]=' ' then begin
         Blank:=Blank+' ';
         Delete(S, 1, 1);
      end
      else begin
         Break;
      end;
   end;
   if odComboBoxEdit in State then Blank:='';
   cbGroups.Canvas.Brush.Color:=cbGroups.Color;
   cbGroups.Canvas.FillRect(Rect);
   Node:=TElTreeItem(cbGroups.Items.Objects[Index]);
   if Node<>nil then begin
      cbGroups.Canvas.Font.Color:=Node.Color;
      B:=(Length(Blank) div Length(CMinIndent))*16;
      if Node.Bold then begin
         cbGroups.Canvas.Font.Style:=[fsBold];
      end
      else begin
         cbGroups.Canvas.Font.Style:=[];
      end;
      tvFields.Images.Draw(cbGroups.Canvas, Rect.Left+2+B, Rect.Top, Node.ImageIndex, True);
      cbGroups.Canvas.TextOut(Rect.Left+B+4+16+2, Rect.Top+1, S);
   end;
end;

{function TfmFind2.GetImageIndex(Field: TFindFieldItem): Integer;
begin
   Result:=-1;
   // определяем иконку для поля
   if (Field.ImageIndex<>-1) and (FFilterInterface.FieldImages<>nil) then begin
      Result:=FAddImageIndex+Field.ImageIndex;
   end
   else begin
      if ffkSpr in Field.Kinds then begin
         if FFilterInterface.SprImageIndex<>-1 then begin
            Result:=FAddImageIndex+FFilterInterface.SprImageIndex;
         end
         else begin
            Result:=II_Spr;
         end;
      end
      else if ffkString in Field.Kinds then Result:=II_String
      else if ffkNumber in Field.Kinds then Result:=II_Number
      else if ffkFloat in Field.Kinds then Result:=II_Float
      else if ffkBoolean in Field.Kinds then Result:=II_Bool
      else if ffkDate in Field.Kinds then Result:=II_Date
      else if ffkList in Field.Kinds then Result:=II_Table;
   end;
end;}

function GetGroupsCaption(Strings: TStrings; Ind: Integer; var AddWidth: Integer; var IsBold: Boolean): string;
var
   I: Integer;
   S: string;
   Blank: string;
   Node: TElTreeItem;
begin
   Node:=TElTreeItem(Strings.Objects[Ind]);
   S:=Strings[Ind];
   I:=1;
   Blank:='';
   while I<Length(S) do begin
      if S[I]=' ' then begin
         Blank:=Blank+' ';
         Delete(S, 1, 1);
      end
      else begin
         Break;
      end;
   end;
   AddWidth:=((Length(Blank) div Length(CMinIndent))*16)+24;
   IsBold:=Node.Bold;
   Result:=S;
end;

procedure TfmFind2.SetComboBoxWidth;
begin
   SetComboBoxDropDownWidth(cbGroups, ClientWidth-cbGroups.Left, GetGroupsCaption);
end;

{procedure TfmFind2.SetComboBoxWidth;
var
   I: Integer;
   J: Integer;
   B: Integer;
   W: Integer;
   MaxW: Integer;
   Node: TElTreeItem;
   S: string;
   Blank: string;
begin
   // поиск максимальной по длине строки в cbGroups
   MaxW:=cbGroups.ClientWidth;
   for I:=0 to Pred(cbGroups.Items.Count) do begin
      Node:=TElTreeItem(cbGroups.Items.Objects[I]);
      S:=cbGroups.Items[I];
      J:=1;
      Blank:='';
      while J<Length(S) do begin
         if S[J]=' ' then begin                  
            Blank:=Blank+' ';
            Delete(S, 1, 1);
         end
         else begin
            Break;
         end;
      end;
      B:=(Length(Blank) div Length(CMinIndent))*16;
      W:=GetTextWidth(S, cbGroups.Font.Height, cbGroups.Font.Name, Node.Bold)+24+B+GetSystemMetrics(SM_CXVSCROLL);
      if W>MaxW then begin
         MaxW:=W;
      end;
   end;
   // проверяем, что выпадающий списко по ширине не выходил за пределы формы
   if MaxW>(ClientWidth-cbGroups.Left) then begin
      MaxW:=(ClientWidth-cbGroups.Left);
   end;
   cbGroups.Perform(CB_SETDROPPEDWIDTH, MaxW, 0);
end;}

function TfmFind2.CanDelete: Boolean;
begin
   Result:=tvFind.ItemFocused<>nil;
end;

procedure TfmFind2.InternalDeleteValue(ValueNode, FindNode: TElTreeItem; Undo: Boolean);
var
   I: Integer;
   T: Integer;
   FindItem: TFindItem;
begin
   if (ValueNode<>nil) and (FindNode<>nil) then begin
      if Undo then begin
         AddUndo(FFilter, akDelValue);
      end;
      FindItem:=GetFindItem(FindNode);
      FindItem.Value1.Values.Delete(ValueNode.Tag);
      T:=ValueNode.Tag;
      if FindItem.Value1.Values.Count=0 then begin
         InternalDelete(FindNode, FindItem, False, False);
      end
      else begin
         tvFind.Items.BeginUpdate;
         try
            while FindNode.ChildrenCount>0 do begin
               FindNode.Children[0].Delete;
            end;
            AddFindValues(tvFind, FindNode, FindItem);
            for I:=Pred(FindNode.Count) downto 0  do begin
               if FindNode.Item[I].Tag<T then begin
                  SetFocusedNode(tvFind, FindNode.Item[I]);
                  Break;
               end;
            end;
         finally
            tvFind.Items.EndUpdate;
         end;
      end;
      FIsSaved:=False;
   end;
end;

function TfmFind2.CanEdit: Boolean;
var
   Cur: TElTreeItem;                
begin
   Cur:=tvFind.ItemFocused;
   Result:=((FFind<>nil) and (FFind.Field<>nil)) or ((Cur<>nil) and (GetFindItem(Cur.Parent)<>nil) and (GetFindItem(Cur.Parent).Field<>nil));
end;

procedure TfmFind2.Edit;
var
   CurNode: TElTreeItem;
   CurFind: TFindItem;
begin
   CurNode:=tvFind.ItemFocused;
   if (FFind<>nil) and (FFind.Field<>nil) then begin
      InternalEdit(FFind, FFindNode);
   end
   else if (CurNode<>nil) then begin
      CurFind:=GetFindItem(CurNode.Parent);
      if (CurFind<>nil) and (CurFind.Field<>nil) then begin
         InternalEdit(CurFind, CurNode.Parent);
      end;
   end;
end;

procedure TfmFind2.tvFieldsItemExpand(Sender: TObject; Item: TElTreeItem);
var
   Field: TFindFieldItem; 
begin
   if (Item.Data=nil) and (Item.Tag=CGroupTag) then begin
      Item.ImageIndex:=II_OpenGroup;
      cbGroups.Invalidate;
      cbGroups.Update;
   end;
   if (Item.Data<>nil) then begin
      Field:=Item.Data;
      Field.Expanded:=True;
   end; 
end;

procedure TfmFind2.tvFieldsItemCollapse(Sender: TObject; Item: TElTreeItem);
var
   Field: TFindFieldItem; 
begin
   if (Item.Data=nil) and (Item.Tag=CGroupTag) then begin
      Item.ImageIndex:=II_CloseGroup;
      cbGroups.Invalidate;
      cbGroups.Update;
   end;
   if (Item.Data<>nil) then begin
      Field:=Item.Data;
      Field.Expanded:=False;
   end;
end;

procedure TfmFind2.acFindFieldExecute(Sender: TObject);
begin
   GotoField;
end;

procedure TfmFind2.GotoField;
var
   I: Integer;
   Find: TFindItem;
   Node: TElTreeItem;
   Parent: TElTreeItem;
begin
   Find:=FFind;
   if (FFind=nil) and (FFindNode=nil) and (tvFind.ItemFocused<>nil) then begin
      Find:=GetFindItem(tvFind.ItemFocused.Parent);
   end;
   if (Find<>nil) and (Find.Field<>nil) then begin
      if (tvFields.ItemFocused<>nil) and (tvFields.ItemFocused.Data=Find.Field) then begin
         Exit;
      end;
      for I:=0 to Pred(tvFields.Items.Count) do begin
         Node:=tvFields.Items[I];
         if (Node.Data<>nil) and (Node.Data=Find.Field) then begin
            Parent:=Node.Parent;
            while Parent<>nil do begin
               Parent.Expand(False);
               Parent:=Parent.Parent;
            end;
            Node.Expand(False);
            tvFields.TopItem:=Node;
            tvFields.ItemFocused:=Node;
            FieldNodeChange;
            UpdateButtons;
         end;
      end;
   end;
end;

function TfmFind2.CanFind: Boolean;
var
   Find: TFindItem;
begin
   Result:=False;
   Find:=FFind;
   if (FFind=nil) and (FFindNode=nil) and (tvFind.ItemFocused<>nil) then begin
      Find:=GetFindItem(tvFind.ItemFocused.Parent);
   end;
   if (Find<>nil) and (Find.Field<>nil) then begin
      Result:=True;
   end;
end;

procedure TfmFind2.acFieldPropExecute(Sender: TObject);
begin
   if SetupFindFieldList(FFilterInterface) then begin
      BuildFieldTree(tvFields, cbGroups, FFilterInterface.FindFieldList, FFilterInterface);
      FieldNodeChange;
      UpdateButtons;
   end;
end;

procedure TfmFind2.SaveView;
var
   I: Integer;
   Node: TElTreeItem;
   Groups: TStringList;
begin
   FFilterInterface.FindFieldList.TopIndex:=GetItemIndex(tvFields.TopItem);
   FFilterInterface.FindFieldList.SelIndex:=GetItemIndex(tvFields.ItemFocused);
   Groups:=FFilterInterface.FindFieldList.LastGroups;
   Groups.Clear;
   for I:=0 to Pred(cbGroups.Items.Count) do begin
      Node:=TElTreeItem(cbGroups.Items.Objects[I]);
      if (Node<>nil) and (Node.Tag=CGroupTag) then begin
         Groups.AddObject(Format('%d=%s', [I, Trim(cbGroups.Items[I])]), TObject(Node.Expanded));
      end;
   end;
end;

procedure TfmFind2.RestoreView;
var
   I: Integer;
   Field: TFindFieldItem;
   Groups: TStringList;
   Node: TElTreeItem;
   Ind: Integer;
begin
   for I:=0 to Pred(tvFields.Items.Count) do begin
      if tvFields.Items[I].Data<>nil then begin
         Field:=TFindFieldItem(tvFields.Items[I].Data);
         if Field.Expanded then begin
            tvFields.Items[I].Expand(False);
         end;
      end;
   end;
   //
   Groups:=FFilterInterface.FindFieldList.LastGroups;
   for I:=0 to Pred(Groups.Count) do begin
      Ind:=StrToIntDef(Groups.Names[I], -1);
      if (Ind<>-1) and (Ind<cbGroups.Items.Count) then begin
         Node:=TElTreeItem(cbGroups.Items.Objects[Ind]);
         if (Node<>nil) and (Node.Tag=CGroupTag) and Boolean(Groups.Objects[I]) then begin
            Node.Expand(False);
         end;
      end;
   end;
   //
   if FFilterInterface.FindFieldList.TopIndex<>-1 then begin
      tvFields.TopItem:=tvFields.Items[FFilterInterface.FindFieldList.TopIndex];
   end;
   if FFilterInterface.FindFieldList.SelIndex<>-1 then begin
      tvFields.ItemFocused:=tvFields.Items[FFilterInterface.FindFieldList.SelIndex];
   end;
end;

procedure TfmFind2.ChangeYear2;
begin
   edFirstYear.Enabled:=rbYearBetwen.Checked;
   udFirstYear.Enabled:=rbYearBetwen.Checked;
   edLastYear.Enabled:=rbYearBetwen.Checked;
   udLastYear.Enabled:=rbYearBetwen.Checked;
end;

procedure TfmFind2.acSaveExitExecute(Sender: TObject);
begin
   UpdateFilter;
   ModalResult:=mrCancel;                          
end;

procedure TfmFind2.UpdateFilter;
begin
   FFilterInterface.Filter.Assign(FFilter);
   FFilterInterface.FilterIsSaved:=FIsSaved;
   UpdateSearchDate;
end;

procedure TfmFind2.acParDelExecute(Sender: TObject);
begin
   if CanDelPar then begin
      InternalDelete(FFindNode, FFind, True, True);
      FindNodeChange;
      UpdateButtons;
   end;
end;

function TfmFind2.CanDelPar: Boolean;
begin
   Result:=(FFindNode<>nil) and (FFind<>nil) and (fikPar in FFind.Kinds) and (FFind.Field=nil);
end;

procedure TfmFind2.paClientResize(Sender: TObject);
begin
   gbFind.Width:=paClient.ClientWidth-2*gbFind.Left;
   gbYear.Width:=paClient.ClientWidth-2*gbYear.Left;
end;

procedure TfmFind2.acOrderByExecute(Sender: TObject);
begin
   if SetOrderBy(FFilterInterface, FFilter.OrderList) then begin
      FIsSaved:=False;
      UpdateButtons;
   end;
end;

procedure TfmFind2.SetFocusedNode(Tree: TElTree; Node: TElTreeItem);
begin
   Tree.DeselectAll;
   if Node<>nil then begin
      Tree.ItemFocused:=Node;
      Node.Selected:=True;
   end;
end;

procedure TfmFind2.acParInExecute(Sender: TObject);
var
   List: TElList;
begin
   List:=TElList.Create;
   try
      tvFind.AllSelected(List);
      InternalParIn(List);
      FindNodeChange;
      UpdateButtons;
   finally
      List.Free;
   end;
end;

function SortCompareNode(Item1, Item2: Pointer; Cargo: Pointer): Integer;
var
   Node1: TElTreeItem;
   Node2: TElTreeItem;
begin
   Node1:=TElTreeItem(Item1);
   Node2:=TElTreeItem(Item2);
   Result:=Node1.AbsoluteIndex-Node2.AbsoluteIndex
end;

procedure TfmFind2.InternalParIn(List: TElList);
var
   I: Integer;
   Nodes: TList;
   First: TElTreeItem;
   Last: TElTreeItem;
   Next: TElTreeItem;
   Prev: TElTreeItem;
   Item: TElTreeItem;
   FindItem: TFindItem;
   ParNode: TElTreeItem;
   ParItem: TFindItem;
   TopIndex: Integer;
   SelIndex: Integer;
begin
   if (List<>nil) and (List.Count<>0) then begin
      List.Sort(SortCompareNode, nil);
      First:=TElTreeItem(List[0]);
      // "защита" от множественного выбора 
      if GetFindItem(First)=nil then begin
         Exit;
      end;
      AddUndo(FFilter, akParIn);
      Nodes:=TList.Create;
      tvFind.Items.BeginUpdate;
      try
         Last:=First;
         while (Last<>nil) and (List.IndexOf(Last)<>-1) do begin
            Nodes.Add(Last);
            Last:=Last.GetNextSibling;
         end;
         Last:=TElTreeItem(Nodes[Pred(Nodes.Count)]);
         Prev:=First.GetPrevSibling;
         Next:=Last.GetNextSibling;
         for I:=0 to Pred(Nodes.Count) do begin
            Item:=TElTreeItem(Nodes[I]);
            FindItem:=GetFindItem(Item);
            Item.Delete;
            if FindItem<>nil then begin
               FindItem.Remove;
               Nodes[I]:=FindItem;
            end
            else begin
               Nodes[I]:=nil;
            end;
         end;
         if Prev<>nil then begin
            ParNode:=InternalAddPar(Prev, GetFindItem(Prev), True, False, False, False);
         end
         else if Next<>nil then begin
            ParNode:=InternalAddPar(Next.Parent, GetFindItem(Next.Parent), True, True, True, False);
         end
         else begin
            ParNode:=InternalAddPar(First.Parent, GetFindItem(First.Parent), True, True, False, False);
         end;
         ParItem:=GetFindItem(ParNode);
         for I:=0 to Pred(Nodes.Count) do begin
            FindItem:=TFindItem(Nodes[I]);
            if FindItem<>nil then begin
               ParItem.Par.Add(FindItem);
            end;
         end;
         TopIndex:=GetItemIndex(tvFind.TopItem);
         SelIndex:=GetItemIndex(tvFind.ItemFocused);
         BuildFindTree(tvFind, FFilter);
         if (TopIndex<>-1) and (TopIndex<tvFind.Items.Count) then begin
            tvFind.TopItem:=tvFind.Items[TopIndex];
         end;
         if SelIndex<>-1 then begin
            SetFocusedNode(tvFind, tvFind.Items[SelIndex]);
         end;
         FIsSaved:=False;
      finally
         tvFind.Items.EndUpdate;
         Nodes.Free;
      end;
   end;
end;

procedure TfmFind2.acAndOrExecute(Sender: TObject);
var
   AndOr: Boolean;                          
begin
   if (FFind<>nil) and (FFindNode<>nil) then begin
      if fikAnd in FFind.Kinds then begin
         AndOr:=False;
      end
      else begin
         AndOr:=True;
      end;
      InternalChange(FFindNode, FFind, FFind.Field, FFind.Oper, FFind.Value1, FFind.Value2, FFind.OperVal, AndOr, FFind.IgnoreCase, FFind.IsParam, FFind.NeedValue, FFind.DatePart);
      FIsSaved:=False;
      UpdateButtons;
   end;
end;

procedure TfmFind2.UpdateGroupHint;
var
   Node: TElTreeItem;
   IsBold: Boolean;
   S: string;
begin
   if cbGroups.ItemIndex<>-1 then begin
      Node:=TElTreeItem(cbGroups.Items.Objects[cbGroups.ItemIndex]);
      S:=Trim(cbGroups.Items[cbGroups.ItemIndex]);
      IsBold:=(Node<>nil) and Node.Bold;
      cbGroups.Hint:=GetComboBoxHint(S, cbGroups, IsBold);
   end
   else begin
      cbGroups.Hint:='';
   end;
end;

procedure TfmFind2.WMActivateApp(var Msg: TWMActivateApp);
begin
   if IsIconic(Application.Handle) then begin
      ShowWindow(Application.Handle, SW_RESTORE);
      BringToFront;
   end;
   inherited;
end;

procedure TfmFind2.WMSysCommand(var Msg: TWMSysCommand);
begin
   if Msg.CmdType=SC_MINIMIZE then begin
      ShowWindow(Application.Handle, SW_MINIMIZE);
   end
   else begin
      inherited;
   end;
end;

procedure TfmFind2.acParamOptionExecute(Sender: TObject);
begin
   if ShowParamOption(FFilter) then begin
      FIsSaved:=False;
      UpdateButtons;
   end;
end;

procedure TfmFind2.UpdateSearchDate;
begin
   if rbCurrent.Checked then FFilterInterface.CurrentSearchRange:=srCurrent
   else if rbAllYear.Checked then FFilterInterface.CurrentSearchRange:=srAllYear
   else if rbYear.Checked then begin
      FFilterInterface.CurrentSearchRange:=srYear;
      FFilterInterface.CurrentSearchDate:=EncodeDate(udYear.Position, FFilterInterface.DefMonth, FFilterInterface.DefDay);
   end
   else if rbYearBetwen.Checked then begin
      FFilterInterface.CurrentSearchRange:=srYearBetween;
      FFilterInterface.FirstDate:=EncodeDate(udFirstYear.Position, FFilterInterface.DefMonth, FFilterInterface.DefDay);
      FFilterInterface.LastDate:=EncodeDate(udLastYear.Position, FFilterInterface.DefMonth, FFilterInterface.DefDay);
   end;
end;

end.
