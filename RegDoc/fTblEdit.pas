unit fTblEdit; // [12.05.2005]
{$I Task.inc}
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FuncPr, FuncEh,
   ImgList, StdCtrls, ActnList, ComCtrls, ToolWin, ExtCtrls, Grids, Menus, DB, mPermit,
   Buttons, iniFiles, Variants,
   ElTree, ElXPThemedControl,
   DBGridEh,
   mExport,
   fExpDs,
   mFindInt, {<<MessageDlgR}
   fSprEdit,
   mAdsObj,
   mDoc2Sel;

const
   WM_USER_UPD_PARAM= WM_USER+117;

type
   TfmTblEdit=class(TForm)
      imTblEdit: TImageList;
      paTable: TPanel;
      alTblEdit: TActionList;
      dgTable: TDBGridEh;
      acExit: TAction;
      acDelete: TAction;
      acAdd: TAction;
      paTop: TPanel;
      tbaTblEdit: TToolBar;
      tbAdd: TToolButton;
      tbDelete: TToolButton;
      tbSep2: TToolButton;
      tbExit: TToolButton;
      acEditFind: TAction;
      acClearFind: TAction;
      tbExecFind: TToolButton;
      tbEditFind: TToolButton;
      tbSep1: TToolButton;
      tbClearFind: TToolButton;
      tbLastFind: TToolButton;
      acExecFind: TAction;
      acLastFind: TAction;
      acOrderBy: TAction;
      tbOrderBy: TToolButton;
      tbEdit: TToolButton;
      acEdit: TAction;
      pmFilter: TPopupMenu;
      tvLook: TElTree;
      spLeft: TSplitter;
      tbTogglePanel: TToolButton;
      acTogglePanel: TAction;
      tbSep3: TToolButton;
      acLookTree: TAction;
      pmLookTree: TPopupMenu;
      tbLookTree: TToolButton;
      pmColumnVisible: TPopupMenu;
      acColumnVisible: TAction;
      tbColumnVisible: TToolButton;
      acRefresh: TAction;
      tbRefreshView: TToolButton;
      tbSelect: TToolButton;
      paComm: TPanel;
      stComm: TStaticText;
      tbExport: TToolButton;
      tbSep4: TToolButton;
      acExport: TAction;
      paInfo: TPanel;
      stInfo: TStaticText;
      acPreview: TAction;
      acPrint: TAction;
      tbPrint: TToolButton;
      tbPreview: TToolButton;
      acGetCount: TAction;
      pmSysFilter: TPopupMenu;
      tbSysFilter: TToolButton;
      acSysFilter: TAction;
      tbGetCount: TToolButton;
      acShowInfoWin: TAction;
      tbShowInfoWin: TToolButton;
    tbsDesignReport: TToolButton;
      procedure acExitExecute(Sender: TObject);
      procedure acDeleteExecute(Sender: TObject);
      procedure acAddExecute(Sender: TObject);
      procedure acEditFindExecute(Sender: TObject);
      procedure acClearFindExecute(Sender: TObject);
      procedure acLastFindExecute(Sender: TObject);
      procedure acOrderByExecute(Sender: TObject);
      procedure acEditExecute(Sender: TObject);
      procedure acExecFindExecute(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure acTogglePanelExecute(Sender: TObject);
      procedure acLookTreeExecute(Sender: TObject);
      procedure tvLookAfterSelectionChange(Sender: TObject);
      procedure tvLookItemCollapse(Sender: TObject; Item: TElTreeItem);
      procedure tvLookItemExpand(Sender: TObject; Item: TElTreeItem);
      procedure acColumnVisibleExecute(Sender: TObject);
      procedure dgTableDblClick(Sender: TObject);
      procedure acRefreshExecute(Sender: TObject);
      procedure tbSelectClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormDestroy(Sender: TObject);
      procedure acExportExecute(Sender: TObject);
      procedure acPreviewExecute(Sender: TObject);
      procedure acPrintExecute(Sender: TObject);
      procedure acGetCountExecute(Sender: TObject);
      procedure acSysFilterExecute(Sender: TObject);
      procedure acShowInfoWinExecute(Sender: TObject);
    procedure tbsDesignReportClick(Sender: TObject);
    procedure tvLookDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvLookDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
   private
      procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
      procedure WMActivateApp(var Msg: TWMActivateApp); message WM_ACTIVATEAPP;
      procedure UpdateParamMsg(var Msg: TMsg); message WM_USER_UPD_PARAM;
   private
      FGurnalName: string;
      FDBItem: TDBItem;
      FTableView: TTableView;
      FFormLayout: TFormLayout;
      FIsLookPanel: Boolean;
      FIsLook: Boolean;
      FLookTree: TLookTree;
      FLastMenuItem: TMenuItem;
      //форма работает в режиме MDI
      FIsMDI: Boolean;
      //настройки для выгрузки таблицы в файл
      FExportColumns: TExportColumnList;
      // признак работы в режиме "только для чтения"
      FAdmOnlyRead: Boolean;
      sExportColumns:String;
   private
      procedure SetDBItem(DBItem: TDBItem; SelectValue: Boolean);
      function InitLayout(LayoutList: TLayoutList): TFormLayout;
      procedure LoadLayout(FormLayout: TFormLayout);
      procedure SaveLayout(FormLayout: TFormLayout);
      procedure OnDrawCell(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
      procedure OnGridButtonClick(Sender: TObject; var Handled: Boolean);
      procedure OnFilterMenuClick(Sender: TObject; Filter: TFindList);
      procedure OnSysFilterMenuClick(Sender: TObject);
      procedure OnAddFilterMenu(Menu: TObject; IsFolder: Boolean; Filter: TFindList);
      procedure OnLookTreeClick(Sender: TObject);
      procedure OnColumnVisibleMenuClick(Sender: TObject);
      procedure DoUpdates;
      procedure UpdateButtons;
      procedure UpdateTopInfo;
      procedure DeleteRecord;
      procedure AddRecord;
      procedure EditRecord;
      procedure EditFind;
      procedure LastFind;
      procedure ClearFind;
      procedure SetOrderBy;
      procedure RefreshView;
      procedure SetLookTree(LookTree: TLookTree);
      procedure SetLookItem(LookItem: TLookItem);
      procedure ToggleLookPanel(Show: Boolean);
      procedure SetTableView(TableViewName: string);
      procedure ChangeCaption;
      procedure SetColumnVisible(TableView: TTableView);
      function  GetBookmark(sl:TStringList):Boolean;

   public
      //создание формы в режиме MDI
      constructor CreateMDI;
      //действия после создания формы и до показа (должны вызываться один раз)
      procedure AfterCreate(DBItem: TDBItem; SelectValue: Boolean);
      //действия после показа и перед уничтожением формы (должны вызываться один раз)
      procedure BeforeDestroy;
   public
      property GurnalName: string read FGurnalName write FGurnalName;
      property AdmOnlyRead: Boolean read FAdmOnlyRead write FAdmOnlyRead;
   end;

function EditTable(DBItem: TDBItem; IsMDI, SelectValue: Boolean; var KeyValues: string; AdmOnlyRead: Boolean): Boolean;

implementation
{$IFDEF in_sel}
uses
   MetaTask, mDRecInt, StrUtils;
{$ELSE}
uses
   t_fTest, mDRecInt;
{$ENDIF}

{$R *.DFM}
 
const
   // используемые картинки
   II_Exit         = 0; // выход (закрыть)
   II_Plus         = 1; // плюс (добавить)
   II_Minus        = 2; // минус (удалить)
   II_EditFind     = 3; // редактировать универсальный поиск (отбор/фильтр)
   II_ClearFind    = 4; // снять условие поиска (отбора/фильтра)
   II_LastFind     = 5; // повторить последний поиск
   II_ExecFind     = 6; // выполнить поиск
   II_OrderBy      = 7; // задать сортировку
   II_Add          = 8; // добавить новую запись
   II_Edit         = 9; // просмотр/редактирование записи
   II_Delete       =10; // удалить запись
   II_TogglePanel  =11; // переключение видимости боковой панели
   II_ViewMode     =12; // режим боковой панели
   II_FolderClose  =13; // закрытая папка
   II_FolderOpen   =14; // открытая папка
   II_CoumnVisible =15; // быстрое переключение видимости колонок
   II_RefreshView  =16; // обновить (перечитать) данные

//NB: !!! не отработан вариант работы в режиме MDI !!!
function EditTable(DBItem: TDBItem; IsMDI, SelectValue: Boolean; var KeyValues: string; AdmOnlyRead: Boolean): Boolean;
begin
   Result:=False;
   if DBItem<>nil then begin
      // работа в режиме MDI организуется из главного модуля
      if IsMDI then begin
      end
      // работа в режиме ShowModal
      else begin
         with TfmTblEdit.Create(nil) do begin
            try
               FAdmOnlyRead:=AdmOnlyRead;
               AfterCreate(DBItem, SelectValue);
               if ShowModal=mrOk then begin
                  KeyValues:=DBItem.GetKeyValues(skView);
                  Result:=True;
               end;
            finally
               Free;
            end;
         end;
      end;
   end;
end;

{ TfmTblEdit }

function TfmTblEdit.InitLayout(LayoutList: TLayoutList): TFormLayout;
begin
   if LayoutList<>nil then begin
      Result:=LayoutList.ByName('TfmTblEdit');
      if Result=nil then begin
         Result:=LayoutList.AddItem('TfmTblEdit');
         Result.SetForm(Self);
         Result.SetInteger('tvLook.Width', tvLook.Width);
         if FIsLook then begin
            Result.SetBoolean('tvLook.Visible', FIsLookPanel);
         end;
      end;
   end
   else begin
      Result:=nil;
   end;
end;
//--------------------------------------------------------
procedure TfmTblEdit.LoadLayout(FormLayout: TFormLayout);
var
  i:Integer;
  ColView:TColView;
  MenuItem:TMenuItem;
  s,ss:String;
  ini : TMemIniFile;
  sl:TStringList;
begin
   if FormLayout<>nil then begin
      FormLayout.GetForm(Self);
      tvLook.Width:=FormLayout.GetInteger('tvLook.Width', tvLook.Width);
      sExportColumns:=FormLayout.GetString('ExportColumns', '');
      s:=FormLayout.GetString('NonVisibleColumns', '');
      if s<>'' then begin
        s:=','+s+',';
        for i:=0 to pmColumnVisible.Items.Count-1 do begin
          MenuItem:=pmColumnVisible.Items[i];
          ColView:=TColView(MenuItem.Tag);
          if Pos(','+ColView.FieldName+',', s)=0 then begin   // поля нет среди невидимых
            MenuItem.Checked:=True;
            ColView.IncludeStyle(csVisible);
            ColView.Column.Visible:=True;
          end else begin
            MenuItem.Checked:=False;
            ColView.ExcludeStyle(csVisible);
            ColView.Column.Visible:=False;
          end;
        end;
      end;                                    
      ini:=TMemIniFile.Create('temp.ini');
      sl:=TStringList.Create;
      for i:=0 to dgTable.Columns.Count-1 do begin
        ss:='dgTable.'+dgTable.Columns[i].FieldName;
        s:=FormLayout.GetString(ss, '');
        if s<>''
          then ini.WriteString('tmp', ss, s);
      end;
      dgTable.RestoreColumnsLayout(ini,'tmp', [crpColIndexEh,crpColWidthsEh]);
      ini.Free;
      sl.Free;

      if FIsLook then begin
         ToggleLookPanel(FormLayout.GetBoolean('tvLook.Visible', FIsLookPanel));
      end;
   end;
end;
//--------------------------------------------------------
procedure TfmTblEdit.SaveLayout(FormLayout: TFormLayout);
var
  I: Integer;
  MenuItem: TMenuItem;
  ColView: TColView;
  s:String;
  ini : TMemIniFile;
  sl:TStringList;
begin
   if FormLayout<>nil then begin
      FormLayout.SetForm(Self);
      FormLayout.SetInteger('tvLook.Width', tvLook.Width);
      FormLayout.SetString('ExportColumns', sExportColumns);
      s:='';
      for i:=0 to pmColumnVisible.Items.Count-1 do begin
        MenuItem:=pmColumnVisible.Items[i];
        ColView:=TColView(MenuItem.Tag);
        if not ColView.HaveStyle(csVisible) then begin
          s:=s+','+ColView.FieldName;
        end;
      end;
      s:=Copy(s,2,Length(s));
      FormLayout.SetString('NonVisibleColumns', s);

      ini:=TMemIniFile.Create('temp.ini');
      dgTable.SaveColumnsLayout(ini, 'tmp');
      sl:=TStringList.Create;
      ini.ReadSectionValues('tmp',sl);
      for i:=0 to sl.Count-1 do begin
        FormLayout.SetString(sl.Names[i], sl.ValueFromIndex[i]);
      end;
      ini.Free;
      sl.Free;

      if FIsLook then begin
         FormLayout.SetBoolean('tvLook.Visible', FIsLookPanel);
      end;
   end;
end;
//--------------------------------------------------------
procedure TfmTblEdit.OnDrawCell(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
   if (FTableView<>nil) then begin
      FTableView.DefaultDrawCell(Sender, EditMode, Params);
   end;
end;

procedure TfmTblEdit.OnGridButtonClick(Sender: TObject; var Handled: Boolean);
var
   KeyValue: string;
   ColView: TColView;
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

procedure TfmTblEdit.SetDBItem(DBItem: TDBItem; SelectValue: Boolean);
var
   I: Integer;
   MenuItem: TMenuItem;
   LookTree: TLookTree;
begin
   FDBItem:=DBItem;
   ChangeCaption;
   stComm.Caption:=DBItem.Caption;
   // инициализация внешнего вида колонок таблицы
   SetTableView('EDIT');
   // если не в режиме выбора значения, то
   if not SelectValue then begin
      tbSelect.Visible:=False;
   end;
   // проверяем надо ли строить меню фильтров
   if FDBItem.HaveFilter then begin
      FDBItem.FilterInterface.OnFilterEvent:=OnFilterMenuClick;
      FDBItem.FilterInterface.OnAddFilterMenu:=OnAddFilterMenu;
      FLastMenuItem:=nil;
      FDBItem.FilterInterface.BuildFilterMenu(pmFilter, nil);
   end;
   // конфигурируем всё что связано с показом панели фильтров
   FDBItem.LookFilter:='';
   if FDBItem.Look.Count<>0 then begin
      pmLookTree.Items.Clear;
      for I:=0 to Pred(FDBItem.Look.Count) do begin
         LookTree:=FDBItem.Look[I];
         MenuItem:=TMenuItem.Create(pmLookTree);
         MenuItem.Caption:=LookTree.Caption;
         MenuItem.OnClick:=OnLookTreeClick;
         MenuItem.Tag:=Integer(LookTree);
         MenuItem.GroupIndex:=1;
         MenuItem.Checked:=I=0;
         MenuItem.RadioItem:=True;
         pmLookTree.Items.Add(MenuItem);
      end;
      FIsLook:=True;
      ToggleLookPanel(True);
      SetLookTree(FDBItem.Look[0]);
   end
   else begin
      FIsLook:=False;
      ToggleLookPanel(False);
      //tbSep3.Visible:=False;
      tbTogglePanel.Visible:=False;
      tbLookTree.Visible:=False;
   end;

FDBItem.OpenView;

   // настройка системных фильтров
   if FTableView.HaveStyle(tsSysFilter) then begin
      FDBItem.BuildMenu(pmSysFilter, mkSysFilter, OnSysFilterMenuClick);
   end
   else begin
      tbSysFilter.Visible:=False;
      tbSep3.Visible:=False;
   end;
   // конфигурируем меню редактирования
   if FDBItem.HaveStyle(bsReadOnly) or FAdmOnlyRead then begin
      tbDelete.Visible:=False;
//      tbEdit.Visible:=False;
      tbAdd.Visible:=False;
      // поставил Free, потому что присваивание Visible:=False ничего не даёт
//      tbSep1.Free;
   end;
   // дополнительные действия
   if not FTableView.HaveStyle(tsShowInfoWin) then begin
      acShowInfoWin.Visible:=False;
   end;
   DoUpdates;
end;

procedure TfmTblEdit.WMActivateApp(var Msg: TWMActivateApp);
begin
   if IsIconic(Application.Handle) then begin
      ShowWindow(Application.Handle, SW_RESTORE);
   end
   else begin
      inherited;
   end;
end;

procedure TfmTblEdit.WMSysCommand(var Msg: TWMSysCommand);
begin
{--
   if IsIconic(Application.Handle) then begin
      ShowWindow(Application.Handle, SW_RESTORE);
      BringToFront;
   end;
   inherited;
--}
   if Msg.CmdType=SC_MINIMIZE then begin
      ShowWindow(Application.Handle, SW_MINIMIZE)
   end
   else begin
      inherited;
   end;
end;

procedure TfmTblEdit.acExitExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
   if FIsMDI then begin
      Close;
   end;
end;

procedure TfmTblEdit.acDeleteExecute(Sender: TObject);
begin
   DeleteRecord;
end;

procedure TfmTblEdit.acAddExecute(Sender: TObject);
begin
   AddRecord;
end;

procedure TfmTblEdit.AddRecord;
begin
   if FDBItem.NewRecord then begin
      // NB: связь между формой и записью должна быть независимая
      if FDBItem.DoViewRecord(vmAdd) then begin
         FDBItem.AddRecord;
      end
      else begin
         FDBItem.CancelEdit;
      end;
      DoUpdates;
   end;
end;

procedure TfmTblEdit.DeleteRecord;
begin
   if (not FDBItem.HaveStyle(bsConfirmDelete)) or (MessageDlgR('Удалить текущую запись?', mtConfirmation, [mbYes, mbNo], 0)=mrYes) then begin
      FDBItem.DeleteCurrentRecord(skView);
      DoUpdates;
   end;
end;

procedure TfmTblEdit.acEditFindExecute(Sender: TObject);
begin
   EditFind;
end;

procedure TfmTblEdit.EditFind;
begin
   if FDBItem.HaveFilter then begin
      if FDBItem.FilterInterface.Edit then begin
         FDBItem.SetFilter(True);
         ChangeCaption;
      end;
      FLastMenuItem:=nil;
      FDBItem.FilterInterface.BuildFilterMenu(pmFilter, nil);
      UpdateButtons;
   end;
end;

procedure TfmTblEdit.UpdateButtons;
var
   HaveNotEmptyFilter: Boolean;
begin
   // NB: !!! должно меняться при изменении состояния DataSource
   acEditFind.Enabled:=FDBItem.HaveFilter;
   acClearFind.Enabled:=FDBItem.IsFiltered;
   HaveNotEmptyFilter:=FDBItem.HaveNotEmptyFilter;
   acLastFind.Enabled:=HaveNotEmptyFilter;
   //--acOrderBy.Enabled:=HaveNotEmptyFilter and FDBItem.HaveFilterOrderBy;
   acOrderBy.Enabled:=FDBItem.HaveFilterOrderBy;
   acDelete.Enabled:=not FDBItem.IsEmpty(skView);
   // NB: надо ещё продумать как их лучше подсвечивать
   //--acEdit.Enabled:=FDBItem.CanViewRecord and (not FDBItem.IsEmpty);
   //--acAdd.Enabled:=FDBItem.CanViewRecord;
   acEdit.Enabled:=(not FDBItem.IsEmpty(skView));
   acAdd.Enabled:=True;
   acExecFind.Enabled:=pmFilter.Items.Count<>0;
end;

procedure TfmTblEdit.acClearFindExecute(Sender: TObject);
begin
   ClearFind;
end;

procedure TfmTblEdit.ClearFind;
begin
   if FLastMenuItem<>nil then begin
      FLastMenuItem.Checked:=False;
      FLastMenuItem:=nil;
   end;
   if FDBItem.IsFiltered then begin
      FDBItem.ClearFilter;
      ChangeCaption;
      UpdateButtons;
   end;
end;

procedure TfmTblEdit.acLastFindExecute(Sender: TObject);
begin
   LastFind;
end;

procedure TfmTblEdit.acOrderByExecute(Sender: TObject);
begin
   SetOrderBy;
end;

procedure TfmTblEdit.EditRecord;
var
   ViewMode: TViewMode;
   KeyValues: string;
begin
   if not FDBItem.IsEmpty(skView) then begin
      KeyValues:=FDBItem.GetKeyValues(skView);
      if KeyValues<>'' then begin
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
            UpdateTopInfo;
         end
         else begin
            FDBItem.CancelEdit;
         end;
      end;
   end;
end;

procedure TfmTblEdit.acEditExecute(Sender: TObject);
begin
   EditRecord;
end;

procedure TfmTblEdit.SetOrderBy;
begin
   // NB: !!! недостаток, что нельзя установить сортировку без фильтра
   // меняем order by только при наличии установленного фильтра
   if FDBItem.HaveFilterOrderBy then begin
      if FDBItem.FilterInterface.EditCurrentOrderBy then begin
         FDBItem.SetFilterOrderBy;
      end;
      UpdateButtons;
   end;
end;

procedure TfmTblEdit.acExecFindExecute(Sender: TObject);
begin
//
end;

procedure TfmTblEdit.OnFilterMenuClick(Sender: TObject; Filter: TFindList);
begin
   if Sender is TMenuItem then begin
      if FLastMenuItem<>nil then begin
         FLastMenuItem.Checked:=False;
      end;
      FLastMenuItem:=TMenuItem(Sender);
      FLastMenuItem.Checked:=True;
   end;
   FDBItem.SetFilter(True);
   ChangeCaption;
   UpdateButtons;
end;

procedure TfmTblEdit.LastFind;
begin
   if FDBItem.HaveNotEmptyFilter then begin
      FDBItem.SetFilter(True);
      ChangeCaption;
      UpdateButtons;
   end;
end;

procedure TfmTblEdit.OnLookTreeClick(Sender: TObject);
var
   MenuItem: TMenuItem;
   LookTree: TLookTree;
begin
   if Sender is TMenuItem then begin
      MenuItem:=TMenuItem(Sender);
      LookTree:=TLookTree(MenuItem.Tag);
      MenuItem.Checked:=True;
      SetLookTree(LookTree);
   end;
end;

procedure TfmTblEdit.SetLookTree(LookTree: TLookTree);
var
   RootNode: TElTreeItem;

   procedure AddToTree(Root: TElTreeItem; LookList: TLookList);
   var
      I: Integer;
      LookItem: TLookItem;
      Node: TElTreeItem;
   begin
      for I:=0 to Pred(LookList.Count) do begin
         LookItem:=LookList[I];
         Node:=tvLook.Items.AddChild(Root, LookItem.Caption);
         Node.Data:=Pointer(LookItem);
         if LookItem.IsFolder then begin
            if LookItem.CloseIndex=-1 then begin
               Node.ImageIndex:=II_FolderClose;
            end
            else begin
               Node.ImageIndex:=LookItem.CloseIndex;
            end;
         end
         else if LookItem.ImageIndex<>-1 then begin
            Node.ImageIndex:=LookItem.ImageIndex;
         end;
         AddToTree(Node, LookItem.Child);
      end;
   end;

begin
   if FLookTree<>LookTree then begin
      FLookTree:=LookTree;
      if (LookTree.Root.Count=0) or (LookTree.Rebuild) then begin
         LookTree.DoGetLookTree;
      end;
      tvLook.Items.BeginUpdate;
      try
         tvLook.Items.Clear;
         if LookTree.Images<>nil then begin
            tvLook.Images:=LookTree.Images;
         end
         else begin
            tvLook.Images:=imTblEdit;
         end;
         AddToTree(nil, LookTree.Root);
      finally
         tvLook.Items.EndUpdate;
      end;
      SetTableView(FLookTree.TableViewName);
      if tvLook.Items.Count>0 then begin
         RootNode:=tvLook.Items[0];
         RootNode.Expand(LookTree.DoExpand);
         tvLook.ItemFocused:=RootNode;
         SetLookItem(TLookItem(RootNode.Data));
      end;
      ChangeCaption;
   end;
end;

procedure TfmTblEdit.FormCreate(Sender: TObject);
begin
   FIsLookPanel:=True;
   FLookTree:=nil;
   FExportColumns:=TExportColumnList.Create;
   FAdmOnlyRead:=False;
   tbsDesignReport.Visible:=Role.SystemAdmin;
end;

procedure TfmTblEdit.ToggleLookPanel(Show: Boolean);
begin
   if Show then begin
      spLeft.Visible:=True;
      tvLook.Visible:=True;
      tbTogglePanel.Down:=True;
      FIsLookPanel:=True;
   end
   else begin
      tvLook.Visible:=False;
      spLeft.Visible:=False;
      tbTogglePanel.Down:=False;
      FIsLookPanel:=False;
   end;
end;

procedure TfmTblEdit.acTogglePanelExecute(Sender: TObject);
begin
   ToggleLookPanel(not FIsLookPanel);
end;

procedure TfmTblEdit.acLookTreeExecute(Sender: TObject);
begin
//
end;

procedure TfmTblEdit.tvLookAfterSelectionChange(Sender: TObject);
var
   Node: TElTreeItem;
   LookItem: TLookItem;
begin
   Node:=tvLook.ItemFocused;
   if Node<>nil then begin
      LookItem:=TLookItem(Node.Data);
      SetLookItem(LookItem);
   end;
end;

procedure TfmTblEdit.tvLookItemCollapse(Sender: TObject; Item: TElTreeItem);
var
   LookItem: TLookItem;
begin
   LookItem:=TLookItem(Item.Data);
   if LookItem.IsFolder then begin
      tvLook.Items.BeginUpdate;
      try
         if LookItem.CloseIndex=-1 then begin
            Item.ImageIndex:=II_FolderClose;
         end
         else begin
            Item.ImageIndex:=LookItem.CloseIndex;
         end;
      finally
         tvLook.Items.EndUpdate;
      end;
   end;
end;

procedure TfmTblEdit.tvLookItemExpand(Sender: TObject; Item: TElTreeItem);
var
   LookItem: TLookItem;
begin
   LookItem:=TLookItem(Item.Data);
   if LookItem.IsFolder then begin
      tvLook.Items.BeginUpdate;
      try
         if LookItem.OpenIndex=-1 then begin
            Item.ImageIndex:=II_FolderOpen;
         end
         else begin
            Item.ImageIndex:=LookItem.OpenIndex;
         end;
      finally
         tvLook.Items.EndUpdate;
      end;
   end;
end;

procedure TfmTblEdit.SetLookItem(LookItem: TLookItem);
begin
   if (FLookTree<>nil) and (LookItem<>nil) and LookItem.CanApplyFilter then begin
      if FLookTree.ApplyFilter(LookItem) then begin
         if FDBItem.IsViewOpen then begin
            FDBItem.RefreshView;
            UpdateButtons;
         end;
      end;
   end;
end;

procedure TfmTblEdit.acColumnVisibleExecute(Sender: TObject);
begin
//
end;

procedure TfmTblEdit.OnColumnVisibleMenuClick(Sender: TObject);
var
   MenuItem: TMenuItem;
   ColView: TColView;
begin
   if Sender is TMenuItem then begin
      MenuItem:=TMenuItem(Sender);
      ColView:=TColView(MenuItem.Tag);
      if ColView.HaveStyle(csVisible) then begin
         MenuItem.Checked:=False;
         ColView.ExcludeStyle(csVisible);
         ColView.Column.Visible:=False;
      end
      else begin
         MenuItem.Checked:=True;
         ColView.IncludeStyle(csVisible);
         ColView.Column.Visible:=True;
      end;
   end;
end;

procedure TfmTblEdit.SetTableView(TableViewName: string);
begin
   if (FTableView<>nil) and (AnsiCompareText(FTableView.Name, TableViewName)<>0) then begin
      if FTableView.HaveStyle(tsAutoSaveColView) then begin
         FTableView.UpdateColView;
      end;
   end;
   if (FTableView=nil) or (AnsiCompareText(FTableView.Name, TableViewName)<>0) then begin
      FTableView:=FDBItem.ViewList.ByName(TableViewName);
      if (FTableView=nil) and (FDBItem.TableView<>nil) then begin
         FTableView:=FDBItem.TableView.Clone;
         FTableView.Name:=TableViewName;
         FDBItem.ViewList.Add(FTableView);
      end;
      if FTableView<>nil then begin
         FTableView.SetColView(dgTable, OnDrawCell, OnGridButtonClick, True);
      end;
      SetColumnVisible(FTableView);
      dgTable.DataSource:=FDBItem.ViewSource;
   end;
end;

procedure TfmTblEdit.dgTableDblClick(Sender: TObject);
var
   pt: TPoint;
   gc: TGridCoord;
begin
   GetCursorPos(pt);
   pt:=dgTable.ScreenToClient(pt);
   gc:=dgTable.MouseCoord(pt.x, pt.y);
   if (gc.x<>-1) and (gc.y<>-1) then begin
      EditRecord;
   end;
end;

procedure TfmTblEdit.ChangeCaption;
var
   S: string;
   FilterName: string;
begin
   S:=FDBItem.Caption;
   if FLookTree<>nil then begin
      S:=Format('%s - %s', [S, FLookTree.Caption]);
   end;
   if FDBItem.IsFiltered then begin
      FilterName:='';
      if FDBItem.FilterInterface<>nil then begin
         FilterName:=FDBItem.FilterInterface.Filter.Caption;
      end;
      if FilterName='' then begin
         FilterName:='Фильтр';
      end;
      S:=Format('%s [%s]', [S, FilterName]);
   end;
   Caption:=S;
end;

procedure TfmTblEdit.acRefreshExecute(Sender: TObject);
begin
   RefreshView;
end;

procedure TfmTblEdit.RefreshView;
var
   LookTree: TLookTree;
begin
   if FLookTree<>nil then begin
      LookTree:=FLookTree;
      LookTree.Root.Clear;
      FLookTree:=nil;
      SetLookTree(LookTree);
   end
   else begin
      FDBItem.RefreshView;
   end;
   DoUpdates;
end;

procedure TfmTblEdit.SetColumnVisible(TableView: TTableView);
var
   I: Integer;
   MenuItem: TMenuItem;
   ColView: TColView;
begin
   // создание списка колонок для быстрого переключения их видимости
   pmColumnVisible.Items.Clear;
   if TableView<>nil then begin
      for I:=0 to Pred(TableView.Count) do begin
         ColView:=TableView[I];
         if (not ColView.HaveStyle(csNameColumn)) and (not ColView.HaveStyle(csInternal)) then begin
            MenuItem:=TMenuItem.Create(pmColumnVisible);
            MenuItem.Caption:=ColView.Title;
            MenuItem.Checked:=ColView.HaveStyle(csVisible);
            MenuItem.Tag:=Integer(ColView);
            MenuItem.OnClick:=OnColumnVisibleMenuClick;
            pmColumnVisible.Items.Add(MenuItem);
         end;
      end;
   end;
   tbColumnVisible.Visible:=pmColumnVisible.Items.Count<>0;
end;

procedure TfmTblEdit.tbSelectClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfmTblEdit.OnAddFilterMenu(Menu: TObject; IsFolder: Boolean; Filter: TFindList);
var
   MenuItem: TMenuItem;
begin
   if Menu is TMenuItem then begin
      MenuItem:=TMenuItem(Menu);
      MenuItem.GroupIndex:=1;
      MenuItem.RadioItem:=True;
   end;
end;

constructor TfmTblEdit.CreateMDI;
begin
   inherited Create(Application);
   FIsMDI:=True;
   FormStyle:=fsMDIChild;
end;

procedure TfmTblEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //NB: !!! если не для MDI ???
   Action:=caFree;
end;

procedure TfmTblEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   //NB: !!! если не для MDI ???
   CanClose:=True;
end;

procedure TfmTblEdit.FormDestroy(Sender: TObject);
begin
   BeforeDestroy;
   if FIsMDI then begin
      if FMDIList.IndexOf(FGurnalName)<>-1 then begin
         FMDIList.Delete(FMDIList.IndexOf(FGurnalName));
      end;
      {$IFDEF in_sel}
      Doc2Sel.DeleteGurnal(FGurnalName);
      {$ENDIF}
      // NB: !!!!! в это время интерфейс уже закрыт
      FDBItem.CloseView;
      //fmTblEdit:=nil;
   end;
   FExportColumns.Free;
end;

procedure TfmTblEdit.AfterCreate(DBItem: TDBItem; SelectValue: Boolean);
begin
   SetDBItem(DBItem, SelectValue);
   FFormLayout:=InitLayout(DBItem.LayoutList);
   LoadLayout(FFormLayout);
end;

procedure TfmTblEdit.BeforeDestroy;
begin
   SaveLayout(FFormLayout);
   {--
   if FTableView<>nil then begin
      if FTableView.HaveStyle(tsAutoSaveColView) then begin
         FTableView.UpdateColView;
      end;
      FTableView.SetColView(nil, nil, nil, False);
   end;
   --}
   UpdateAndClearTableView(FTableView);
   if FDBItem.HaveFilter then begin
      FDBItem.FilterInterface.OnFilterEvent:=nil;
   end;
end;

procedure TfmTblEdit.acExportExecute(Sender: TObject);
var
   I: Integer;
   Item: TExportColumn;
   Field: TField;
begin
   FillColumnList2(dgTable, FExportColumns);
   for I:=0 to Pred(FExportColumns.Count) do begin
      Item:=FExportColumns[I];
      if Item<>nil then begin
         Item.Color:=clWhite;
         Field:=FDBItem.ViewQuery.FindField(Item.FieldName);
         if (Field<>nil) and (Field.DataType=ftBoolean) then begin
            Item.ColumnEh:=nil;
         end;
      end;
   end;
   if sExportColumns<>'' then begin
     if RightStr(sExportColumns,1)<>','
       then sExportColumns:=sExportColumns+',';
     for I:=0 to Pred(FExportColumns.Count) do begin
       Item:=FExportColumns[I];
       if Item<>nil then begin
         if Pos(Item.FieldName+',',sExportColumns)=0
           then Item.Hide
           else Item.Show;
       end;
     end;
   end;
   try
      DefBooleanName[True]:='Да';
      DefBooleanName[False]:='Нет';
      if ExportDataSet('Выгрузка', FDBItem.ViewQuery, efRtf, [], Doc2Sel.GetExportDirName, False, False, FExportColumns) then begin
        sExportColumns:='';
        for I:=0 to Pred(FExportColumns.Count) do begin
          Item:=FExportColumns[I];
          if (Item<>nil) and Item.Visible then begin
            sExportColumns:=sExportColumns+Item.FieldName+',';
          end;
        end;
      end;
   finally
      DefBooleanName[True]:='T';
      DefBooleanName[False]:='F';
   end;
end;

//--------------------------------------------------------------------
function TfmTblEdit.GetBookmark(sl:TStringList):Boolean;
var
  arrB:TArrStrings;
  i:Integer;
begin
  SelectionToArr(dgTable, arrB);
  sl.Clear;
  if Length(arrB)>0 then begin
    for i:=0 to Length(arrB)-1 do begin
//      Query.Bookmark:=;
      sl.Add(arrB[i]);
    end;
  end;
  Result:=sl.Count>0;
end;

procedure TfmTblEdit.UpdateTopInfo;
var
   TopInfo: string;
   ShowTopInfo: Boolean;
begin
   ShowTopInfo:=False;
   if (FTableView<>nil) and FTableView.HaveStyle(tsTopInfo) then begin
      TopInfo:='';
      if FDBItem.UpdateTopInfo(nil, TopInfo) then begin
         ShowTopInfo:=True;
         stInfo.Caption:=TopInfo;
      end;
   end;
   // настраиваем панель информации
   if ShowTopInfo then begin
      if not paInfo.Visible then begin
         paTop.Height:=paTop.Height+paInfo.Height;
         paInfo.Visible:=True;
      end;
   end
   else if paInfo.Visible then begin
      paTop.Height:=paTop.Height-paInfo.Height;
      paInfo.Visible:=False;
   end;
end;

procedure TfmTblEdit.DoUpdates;
begin
   UpdateTopInfo;
   UpdateButtons;
end;

procedure TfmTblEdit.acPreviewExecute(Sender: TObject);
begin
   {$IFDEF in_sel}
//\\[2010.11.25]
   GlobalTask.PreViewReport(FDBItem.Name);
//   GlobalTask.PreViewReport('DOC_MAIN');
//\\
   {$ENDIF}
end;

procedure TfmTblEdit.acPrintExecute(Sender: TObject);
begin
   {$IFDEF in_sel}
//\\[2010.11.25]
   GlobalTask.PrintReport(FDBItem.Name);
//   GlobalTask.PrintReport('DOC_MAIN');
//\\
   {$ENDIF}
end;
procedure TfmTblEdit.tbsDesignReportClick(Sender: TObject);
begin
  {$IFDEF in_sel}
    GlobalTask.DesignTailReport(FDBItem.Name);
  {$ENDIF}
end;

procedure TfmTblEdit.acGetCountExecute(Sender: TObject);
var
   Count: Integer;
begin
   Count:=FDBItem.CountViewRecord;
   ShowMessageFmt('Количество записей - %d', [Count]);
end;

procedure TfmTblEdit.acSysFilterExecute(Sender: TObject);
begin
//
end;

procedure TfmTblEdit.OnSysFilterMenuClick(Sender: TObject);
var
   MenuItem: TMenuItem;
begin
   if (Sender<>nil) and (Sender is TMenuItem) then begin
      MenuItem:=Sender as TMenuItem;
      MenuItem.Checked:=not MenuItem.Checked;
      FDBItem.SysFilter.Objects[MenuItem.Tag]:=TObject(MenuItem.Checked);
      FDBItem.RefreshView;
      UpdateButtons;
   end;
end;

procedure TfmTblEdit.UpdateParamMsg(var Msg: TMsg);
begin
   UpdateTopInfo;
end;

procedure TfmTblEdit.acShowInfoWinExecute(Sender: TObject);
begin
   FDBItem.ExecAction;
end;

//----------------------------------------------------------------------------------------
procedure TfmTblEdit.tvLookDragDrop(Sender, Source: TObject; X, Y: Integer);
//var
//  T1,T2 : TTreeNode;
//  HT: THitTests;
begin
{
  T1:=TV.Selected;
  if T1 = nil then Exit;
  HT := TV.GetHitTestInfoAt(X, Y);
  T2 := TV.GetNodeAt(X, Y);
  if (htNowhere in HT) then T2:=Nil;
  if (T2<>Nil) and (T2.ImageIndex in [imCloseFolder,imOpenFolder]) and (not (htOnLabel in HT)) then begin
     T1.MoveTo(T2,naAddChildFirst);
  end else MoveTo(T1,T2);
}
end;

procedure TfmTblEdit.tvLookDragOver(Sender, Source: TObject; X, Y: Integer;  State: TDragState; var Accept: Boolean);
//Var
//  Node : TElTreeItem;
//  LookItem: TLookItem;
begin
// Node:=tvLook.ItemFocused;
// if Node<>nil then begin
//   LookItem:=TLookItem(Node.Data);
//   if LookItem.IsFolder then begin
//     Accept:=true;
//     stComm.Caption:=IntToStr(LookItem.Id)+'  '+VarToStr(LookItem.Value);
//   end;
// end;

{
  with tvLook do begin
    Accept:=(Sender=Source) and (DropTarget<>Nil);
    TN:=DropTarget;
    while Accept and (TN<>Nil) do begin
       Accept:=TN<>Selected;
       TN:=TN.Parent;
    end;
  end;
  if Accept then begin
     with tvLook.DropTarget do
     if HasChildren and not Expanded and (htOnIcon in tvLook.GetHitTestInfoAt(X, Y))
     then Expanded:=True;
  end;
  }
end;

end.
