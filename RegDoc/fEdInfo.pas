unit fEdInfo;
interface                                                
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ToolWin, ShellApi, ActnList, DBCtrlsEh, StdCtrls, Mask,
   DBLookupEh, ExtCtrls, Grids, DBGridEh, DB, ImgList,
   mAdsObj, mDRecInt, fSprEdit, dDocImg;

type
   TfmEdInfo=class(TForm)
      tbaEditRec: TToolBar;
      tbOk: TToolButton;
      tbSep1: TToolButton;
      tbCancel: TToolButton;
      alEditRec: TActionList;
      acOk: TAction;
      acFileAdd: TAction;
      acCancel: TAction;
      acFileDelete: TAction;
      acFileEdit: TAction;
      acPreview: TAction;
      acPrint: TAction;
      acWord: TAction;
      laRegNum: TLabel;
      deRegNum: TDBNumberEditEh;
      deSignName: TDBEditEh;
      laSignName: TLabel;
      laAdrText: TLabel;
      deAdrText: TDBEditEh;
      laAdrPhone: TLabel;
      deAdrPhone: TDBEditEh;
      laRegDate: TLabel;
      deRegDate: TDBDateTimeEditEh;
      laAppForm: TLabel;
      dcAppForm: TDBComboBoxEh;
      laExecTerm: TLabel;
      deExecTerm: TDBDateTimeEditEh;
      laExecFact: TLabel;
      deExecFact: TDBDateTimeEditEh;
      dePayment: TDBNumberEditEh;
      laPayment: TLabel;
      laAnsInd: TLabel;
      deAnsInd: TDBEditEh;
      bvBottom: TBevel;
      laFolderId: TLabel;
      dcFolderId: TDBComboBoxEh;
      laGroupId: TLabel;
      dlGroupId: TDBLookupComboboxEh;
      laDocFile: TLabel;
      bvDocFile: TBevel;
      tbaDocFile: TToolBar;
      tbFileAdd: TToolButton;
      tbFileDelete: TToolButton;
      tbFileEdit: TToolButton;
      tbFileViewList: TToolButton;
      acFileView: TAction;
      acFileViewList: TAction;
      tbFileView: TToolButton;
      paDocFile: TPanel;
      DOC_FILE: TDBGridEh;
      lvDocFile: TListView;
      odFile: TOpenDialog;
      bvTop: TBevel;
      imDocFile: TImageList;
      laProvDoc: TLabel;
      bvProvDoc: TBevel;
      laProvType: TLabel;
      dcProvType: TDBComboBoxEh;
      deProvSer: TDBEditEh;
      laProvSer: TLabel;
      laProvNum: TLabel;
      deProvNum: TDBEditEh;
      laProvDate: TLabel;
      deProvDate: TDBDateTimeEditEh;
      laProvOrg: TLabel;
      deProvOrg: TDBEditEh;
      deContent: TDBEditEh;
      bvInfoDoc: TBevel;
      laAdrIn: TLabel;
      chbAdrIn: TDBCheckBoxEh;
      laContent: TLabel;
      laPersonId: TLabel;
      dePersonId: TDBEditEh;
      laSign: TLabel;
      bvSign: TBevel;
      laInfoDoc: TLabel;
    dcGroupId: TDBComboBoxEh;
      procedure FormCreate(Sender: TObject);
      procedure acOkExecute(Sender: TObject);
      procedure acCancelExecute(Sender: TObject);
      procedure acFileAddExecute(Sender: TObject);
      procedure acFileDeleteExecute(Sender: TObject);
      procedure acFileEditExecute(Sender: TObject);
      procedure acFileViewExecute(Sender: TObject);
      procedure acFileViewListExecute(Sender: TObject);
      procedure deSignNameEditButtonClick(Sender: TObject; var Handled: Boolean);
      procedure deSignNameClearButtonClick(Sender: TObject; var Handled: Boolean);
      procedure deAdrTextEditButtonClick(Sender: TObject; var Handled: Boolean);
      procedure deAdrTextClearButtonClick(Sender: TObject; var Handled: Boolean);
      procedure lvDocFileChange(Sender: TObject; Item: TListItem;  Change: TItemChange);
      procedure lvDocFileDblClick(Sender: TObject);
    procedure dcGroupIdEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
   private
      FDoc: TInfoBook;
      FIsTableView: Boolean;
   private
      procedure SetFileView(IsTable: Boolean);
      procedure AddFileToListView;
   private
      // изменилось значение поля "Адрес"
      procedure SetAdrId(AdrId: Integer);
      // изменилось значение поля "Идентификатор заявителя"
      procedure SetSignMan(SignMan: Integer);
      //СОБЫТИЯ:
      procedure OnAfterScroll(DataSet: TDataSet);
   public
      // установить/очистить привязку к объектам базы данных
      procedure SetControl;
      procedure ResetControl;
      // устнановить/очистить/вызвать события, привязанные к управляющим элементам
      procedure SetControlEvent;
      procedure ClearControlEvent;
      procedure InvokeControlEvent;
      // изменить доступность операций
      procedure UpdateEnabledAction;
      // изменить позицию управляющих элементов
      procedure SetControlPosition;
   public
      property Doc: TInfoBook read FDoc write FDoc;
   end;

implementation
uses
   mDoc2Sel;

{$R *.dfm}

{ TfmEdInfo }

procedure TfmEdInfo.FormCreate(Sender: TObject);
var
   Column: TListColumn;
begin
   FDoc:=nil;
   DOC_FILE.Align:=alClient;
   lvDocFile.Align:=alClient;
   //настройка lvDocFile
   lvDocFile.ViewStyle:=vsIcon;
   Column:=lvDocFile.Columns.Add;
   Column.Caption:='Имя файла';
   Column:=lvDocFile.Columns.Add;
   Column.Caption:='Примечание (описание)';
end;

procedure TfmEdInfo.acOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfmEdInfo.acCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmEdInfo.deSignNameClearButtonClick(Sender: TObject; var Handled: Boolean);
begin
   FDoc.ClearSign;
   SetSignMan(FDoc['SIGN_MAN'].AsInteger);
end;

procedure TfmEdInfo.deSignNameEditButtonClick(Sender: TObject; var Handled: Boolean);
begin
   if FDoc.SelectSign(skMan, stIndividual) then begin
      SetSignMan(FDoc['SIGN_MAN'].AsInteger);
      SetAdrId(Doc2Sel.SignAdresId);
   end;
end;

procedure TfmEdInfo.deAdrTextClearButtonClick(Sender: TObject; var Handled: Boolean);
begin
   FDoc.ClearAdrId;
   SetAdrId(-1);
end;

procedure TfmEdInfo.deAdrTextEditButtonClick(Sender: TObject; var Handled: Boolean);
begin
   if FDoc.SelectAdres then begin
      SetAdrId(Doc2Sel.SignAdresId);
   end;
end;

procedure TfmEdInfo.acFileAddExecute(Sender: TObject);
begin
   if odFile.Execute and FileExists(odFile.FileName) then begin
      FDoc.DocFile.FileName:=odFile.FileName;
      if FDoc.DocFile.DetailAdd then begin
         if FIsTableView then begin
         end
         else begin
            AddFileToListView;
         end;
         UpdateEnabledAction;
      end
   end;
end;

procedure TfmEdInfo.acFileDeleteExecute(Sender: TObject);
var
   Ind: Integer;
begin
   if FIsTableView then begin
      FDoc.DocFile.DetailDelete;
   end
   else if lvDocFile.Selected<>nil then begin
      if FDoc.FileItem.EditTable.Locate('FILE_ID', Integer(lvDocFile.Selected.Data), []) then begin
         if FDoc.DocFile.DetailDelete then begin
            Ind:=lvDocFile.Items.IndexOf(lvDocFile.Selected);
            lvDocFile.Items.Delete(Ind);
         end;
      end;
   end;
end;

procedure TfmEdInfo.acFileEditExecute(Sender: TObject);
var
   Icon: TIcon;
begin
   if FIsTableView then begin
      FDoc.DocFile.DetailEdit;
   end
   else  if lvDocFile.Selected<>nil then begin
      if FDoc.FileItem.EditTable.Locate('FILE_ID', Integer(lvDocFile.Selected.Data), []) then begin
         if FDoc.DocFile.DetailEdit then begin
            lvDocFile.Selected.Caption:=FDoc.DocFile['NAME'].AsString;
            lvDocFile.Selected.SubItems[0]:=FDoc.DocFile['NOTE'].AsString;
            //
            Icon:=TIcon.Create;
            Icon.Handle:=GetExtIcon(ExtractFileExt(FDoc.DocFile['NAME'].AsString));
            lvDocFile.Selected.ImageIndex:=imDocFile.AddIcon(Icon);
            Icon.Free;
         end;
      end;
   end;
end;

procedure TfmEdInfo.acFileViewExecute(Sender: TObject);
begin
   if FIsTableView then begin
      FDoc.DocFile.ViewFile;
   end
   else  if lvDocFile.Selected<>nil then begin
      if FDoc.FileItem.EditTable.Locate('FILE_ID', Integer(lvDocFile.Selected.Data), []) then begin
         FDoc.DocFile.ViewFile;
      end;
   end;
end;

procedure TfmEdInfo.acFileViewListExecute(Sender: TObject);
begin
   SetFileView(not FIsTableView);
end;

procedure TfmEdInfo.ClearControlEvent;
begin

end;

procedure TfmEdInfo.InvokeControlEvent;
begin
   SetFileView(False);
   //вызывать события для установки текущих значений реквизитов:
   // "Адрес"
   SetAdrId(FDoc['ADR_ID'].AsInteger);
   // "Идентификатор заявителя"
   SetSignMan(FDoc['SIGN_MAN'].AsInteger);
end;

procedure TfmEdInfo.OnAfterScroll(DataSet: TDataSet);
begin
   if DataSet.State=dsBrowse then begin
      UpdateEnabledAction;
   end;
end;

procedure TfmEdInfo.ResetControl;
begin
   FDoc.FileItem.EditTable.AfterScroll:=nil;
end;

procedure TfmEdInfo.SetControl;
begin
   // установка режима просмотр/редактирование/добавление
   if FDoc.ViewMode=vmView then begin
      Caption:=Caption+' [ПРОСМОТР]';
   end;
   acOk.Enabled:=FDoc.ViewMode<>vmView;
   {--dlGroupId.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;}
   dcGroupId.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;
   //NB: !!! ИСПРАВИТЬ !!! что бы через DBAwareList проходило и не было !!! ПОВТОРА !!!
   FDoc.QueryStringLists(
      'select ID, %s from SprDocGroup '+
      'where KIND=%d and IS_NODE=%d',
      [FDoc.DBItem.FieldList.ByName('GROUP_ID').LinkSpr.NameFieldName, gkInfo, iLeaf],
      dcGroupId.KeyItems,
      dcGroupId.Items
   );
   dcGroupId.DataField:='GROUP_ID';
   dcGroupId.DataSource:=FDoc.DBItem.EditSource;
   SetDropDownWidth(dcGroupId);
   // список файлов
   FDoc.FileItem.EditTable.AfterScroll:=OnAfterScroll;
end;

procedure TfmEdInfo.SetControlEvent;
begin

end;

procedure TfmEdInfo.SetControlPosition;
begin
   tbaDocFile.Top:=paDocFile.Top-4;
   tbaDocFile.Left:=paDocFile.Left+paDocFile.Width+7;
end;

procedure TfmEdInfo.UpdateEnabledAction;
begin
   // прикрепленные файлы
   if FIsTableView then begin
      acFileAdd.Enabled:=FDoc.FileItem.CanAdd and (FDoc.ViewMode<>vmView);
      acFileDelete.Enabled:=FDoc.FileItem.CanDelete and (FDoc.ViewMode<>vmView);
      acFileEdit.Enabled:=FDoc.FileItem.CanEdit;
      acFileView.Enabled:=FDoc.FileItem.CanEdit;
   end
   else begin
      acFileAdd.Enabled:=FDoc.FileItem.CanAdd and (FDoc.ViewMode<>vmView);
      acFileDelete.Enabled:=(lvDocFile.Selected<>nil) and (FDoc.ViewMode<>vmView);
      acFileEdit.Enabled:=lvDocFile.Selected<>nil;
      acFileView.Enabled:=lvDocFile.Selected<>nil;
   end;
end;

procedure TfmEdInfo.SetFileView(IsTable: Boolean);
begin
   FIsTableView:=IsTable;
   if FIsTableView then begin
      DOC_FILE.Visible:=True;
      lvDocFile.Visible:=False;
      acFileViewList.ImageIndex:=16;
      acFileViewList.Hint:='Просмотр в виде списка';
   end
   else begin
      lvDocFile.Visible:=True;
      DOC_FILE.Visible:=False;
      acFileViewList.ImageIndex:=17;
      acFileViewList.Hint:='Просмотр в виде таблицы';
      //
      imDocFile.Clear;
      lvDocFile.Items.BeginUpdate;
      try
         lvDocFile.Items.Clear;
         FDoc.FileItem.EditTable.First;
         while not FDoc.FileItem.EditTable.Eof do begin
            AddFileToListView;
            FDoc.FileItem.EditTable.Next;
         end;
      finally
         lvDocFile.Items.EndUpdate;
      end;
   end;
   UpdateEnabledAction;
end;

procedure TfmEdInfo.lvDocFileChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
   UpdateEnabledAction;
end;

procedure TfmEdInfo.AddFileToListView;
var
   ListItem: TListItem;
   Icon: TIcon;
begin
   ListItem:=lvDocFile.Items.Add;
   ListItem.Caption:=FDoc.DocFile['NAME'].AsString;
   ListItem.SubItems.Add(FDoc.DocFile['NOTE'].AsString);
   ListItem.Data:=Pointer(FDoc.DocFile['FILE_ID'].AsInteger);
   //
   Icon:=TIcon.Create;
   Icon.Handle:=GetExtIcon(ExtractFileExt(FDoc.DocFile['NAME'].AsString));
   ListItem.ImageIndex:=imDocFile.AddIcon(Icon);
   Icon.Free;
end;

procedure TfmEdInfo.lvDocFileDblClick(Sender: TObject);
begin
   acFileViewExecute(nil);
end;

procedure TfmEdInfo.SetAdrId(AdrId: Integer);
begin
   //NB: ??? каким образом обновится текст адреса, если его изменить в базе адресов
   //NB: повтор см. SetSignMan
   if AdrId>0 then begin
      deAdrText.ReadOnly:=True;
      deAdrText.Font.Style:=[fsBold];
   end
   else begin
      deAdrText.ReadOnly:=False;
      deAdrText.Font.Style:=[];
   end;
end;

procedure TfmEdInfo.SetSignMan(SignMan: Integer);
begin
   //NB: повтор см. SetAdrId
   if SignMan>0 then begin
      deSignName.Font.Style:=[fsBold];
      deSignName.ReadOnly:=True;
   end
   else begin
      deSignName.ReadOnly:=False;
      deSignName.Font.Style:=[];
   end;
end;

procedure TfmEdInfo.dcGroupIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
   FDoc.SelectGroup;
end;

procedure TfmEdInfo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:=FDoc.OnFormCloseQuery(FDoc.DBItem);
end;

end.
