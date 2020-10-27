unit fEdAProc;

interface

{$I Task.inc}

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, ExtCtrls, ComCtrls, Grids, DBGridEh, DBLookupEh, StdCtrls, Mask,
   DBCtrlsEh, ToolWin, ImgList, ActnList, AdsTable, Menus, fShablon, uProject,
   OpisEdit, MetaTask, dbFunc, FuncPr, uProjectAll,
   mAdsObj, mDRecInt, fSprEdit, dDocImg, mDoc2Sel;

type
   TfmEdAProc=class(TForm)
      alEditRec: TActionList;
      acOk: TAction;
      acFileAdd: TAction;
      acCancel: TAction;
      acFileDelete: TAction;
      acFileEdit: TAction;
      acPreview: TAction;
      acPrint: TAction;
      acWord: TAction;
      acFileView: TAction;
      acFileViewList: TAction;
      odFile: TOpenDialog;
      imDocFile: TImageList;
      tbaEditRec: TToolBar;
      tbOk: TToolButton;
      tbSep1: TToolButton;
      tbCancel: TToolButton;
      bvTop: TBevel;
      laDocFile: TLabel;
      laFolderId: TLabel;
      dcFolderId: TDBComboBoxEh;
      laGroupId: TLabel;
      dlGroupId: TDBLookupComboboxEh;
      paDocFile: TPanel;
      DOC_FILE: TDBGridEh;
      lvDocFile: TListView;
      tbaDocFile: TToolBar;
      tbFileAdd: TToolButton;
      tbFileDelete: TToolButton;
      tbFileEdit: TToolButton;
      tbFileView: TToolButton;
      tbFileViewList: TToolButton;
      laReqCheck: TLabel;
      dcReqCheck: TDBComboBoxEh;
      laCheckOut: TLabel;
      chbCheckOut: TDBCheckBoxEh;
      laCheckDate: TLabel;
      deCheckDate: TDBDateTimeEditEh;
      laCheckMan: TLabel;
      deCheckMan: TDBComboBoxEh;
      laInFile: TLabel;
      chbInFile: TDBCheckBoxEh;
      laFileId: TLabel;
      dlFileId: TDBLookupComboboxEh;
      laRegNum: TLabel;
      deRegNum: TDBNumberEditEh;
      laRegInd: TLabel;
      deRegInd: TDBEditEh;
      laRegDate: TLabel;
      deRegDate: TDBDateTimeEditEh;
      dcAppForm: TDBComboBoxEh;
      laAppForm: TLabel;
      laSignKind: TLabel;
      dcSignKind: TDBComboBoxEh;
      laSignName: TLabel;
      deSignName: TDBEditEh;
      laAdrText: TLabel;
      deAdrText: TDBEditEh;
      laAdrPhone: TLabel;
      deAdrPhone: TDBEditEh;
      laAppKind: TLabel;
      dcAppKind: TDBComboBoxEh;
      laNumList: TLabel;
      deNumList: TDBEditEh;
      laNumApp: TLabel;
      deNumApp: TDBEditEh;
      laIsRepeat: TLabel;
      chbIsRepeat: TDBCheckBoxEh;
      deRepeatText: TDBEditEh;
      laExecMan: TLabel;
      dcExecMan: TDBComboBoxEh;
      laExecTerm: TLabel;
      deExecTerm: TDBDateTimeEditEh;
      laExecOrg: TLabel;
      dlExecOrg: TDBLookupComboboxEh;
      laExecDate: TLabel;
      deExecDate: TDBDateTimeEditEh;
      laAnsKind: TLabel;
      dcAnsKind: TDBComboBoxEh;
      laAnsInd: TLabel;
      deAnsInd: TDBEditEh;
      laAnsDate: TLabel;
      deAnsDate: TDBDateTimeEditEh;
      deAnsText: TDBEditEh;
      laAnsText: TLabel;
      laDelivKind: TLabel;
      dcDelivKind: TDBComboBoxEh;
      laResDate: TLabel;
      deResDate: TDBDateTimeEditEh;
      DOC_WORK: TDBGridEh;
      laDocWork: TLabel;
      acWorkAdd: TAction;
      acWorkDel: TAction;
      acWorkEdit: TAction;
      acWorkUp: TAction;
      acWorkDown: TAction;
      tbaDocWork: TToolBar;
      tbWorkAdd: TToolButton;
      tbWorkDel: TToolButton;
      tbWorkEdit: TToolButton;
      tbWorkUp: TToolButton;
      tbWorkDown: TToolButton;
      dcAdmProc: TDBComboBoxEh;
      dcGroupId: TDBComboBoxEh;
      pmWord: TPopupMenu;
      tbWord: TToolButton;
      tbSep2: TToolButton;
      laSignCount: TLabel;
      laProcCount: TLabel;
      laAdmProc: TLabel;
    deProvOrg: TDBEditEh;
    dcProvType: TDBComboBoxEh;
    laProvDoc: TLabel;
    laProvSer: TLabel;
    laProvNum: TLabel;
    laProvDate: TLabel;
    laPersonId: TLabel;
    deProvSer: TDBEditEh;
    deProvNum: TDBEditEh;
    deProvDate: TDBDateTimeEditEh;
    dePersonId: TDBEditEh;
    Bevel1: TBevel;
    laProvOrg: TLabel;
    btShablon: TToolButton;
    btChoiceMen: TToolButton;
    pmChoiceMen: TPopupMenu;
    miZSmert: TMenuItem;
    miZRogd: TMenuItem;
    laDeloDate: TLabel;
    deDeloDate: TDBDateTimeEditEh;
    Label1: TLabel;
    dcCreateMan: TDBComboBoxEh;
      procedure FormCreate(Sender: TObject);
      procedure acOkExecute(Sender: TObject);
      procedure acCancelExecute(Sender: TObject);
      procedure acFileAddExecute(Sender: TObject);
      procedure acFileDeleteExecute(Sender: TObject);
      procedure acFileEditExecute(Sender: TObject);
      procedure acFileViewExecute(Sender: TObject);
      procedure acFileViewListExecute(Sender: TObject);
      procedure lvDocFileChange(Sender: TObject; Item: TListItem; Change: TItemChange);
      procedure lvDocFileDblClick(Sender: TObject);
      procedure chbCheckOutClick(Sender: TObject);
      procedure chbInFileClick(Sender: TObject);
      procedure acWorkAddExecute(Sender: TObject);
      procedure acWorkDelExecute(Sender: TObject);
      procedure acWorkEditExecute(Sender: TObject);
      procedure acWorkUpExecute(Sender: TObject);
      procedure acWorkDownExecute(Sender: TObject);
      procedure deSignNameEditClick(Sender: TObject; var Handled: Boolean);
      procedure deSignNameClearClick(Sender: TObject; var Handled: Boolean);
      procedure deAdrTextEditClick(Sender: TObject; var Handled: Boolean);
      procedure deAdrTextClearClick(Sender: TObject; var Handled: Boolean);
      procedure dcSignKindChange(Sender: TObject);
      procedure chbIsRepeatClick(Sender: TObject);
      procedure dcGroupIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
      procedure acWordExecute(Sender: TObject);
      procedure deRepeatAddClick(Sender: TObject; var Handled: Boolean);
      procedure deRepeatEditClick(Sender: TObject; var Handled: Boolean);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure dcAdmProcChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btShablonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure miZSmertClick(Sender: TObject);
    procedure miZRogdClick(Sender: TObject);
    procedure dcCreateManEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dcExecManEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure deCheckManEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
   private
      FDoc: TAdmProcDoc;
      FIsTableView: Boolean;
   private
      procedure SetFileView(IsTable: Boolean);
      procedure AddFileToListView;
   private
      // изменилось значение поля "Адрес заявителя"
      procedure SetAdrId(AdrId: Integer);
      // изменить значение поля "Вид заявителя"
      procedure SetSignKind(SignKind: Integer);
      // установить доступность ввода документа
      procedure SetEnabledProvDoc(lSet:Boolean);
      // автоматический поиск предыдущих обращений данного человека
      procedure SetSignCount(SignCount: Integer);
      procedure SetProcCount(ProcCount: Integer);
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
      // установить количество повторных обращений
      procedure SetRepeatCount(SetText: Boolean=True);
      procedure ActiveControlChanged(Sender: TObject);
   public
      property Doc: TAdmProcDoc read FDoc write FDoc;
   end;


implementation
uses
   dBase, fEdRept;

{$R *.dfm}

procedure TfmEdAProc.FormCreate(Sender: TObject);
var
   Column: TListColumn;
begin
   FDoc:=nil;
   Screen.OnActiveControlChange:=ActiveControlChanged;
   DOC_FILE.Align:=alClient;
   lvDocFile.Align:=alClient;
   //настройка lvDocFile
   lvDocFile.ViewStyle:=vsIcon;
   Column:=lvDocFile.Columns.Add;
   Column.Caption:='Имя файла';
   Column:=lvDocFile.Columns.Add;
   Column.Caption:='Примечание (описание)';
  {$IF Defined(ZAGS) or Defined(LAIS) }
    btChoiceMen.Visible:=true;
  {$ELSE}
    btChoiceMen.Visible:=false;
  {$IFEND}
end;
procedure TfmEdAProc.FormDestroy(Sender: TObject);
begin
   Screen.OnActiveControlChange:=nil;
end;

procedure TfmEdAProc.FormActivate(Sender: TObject);
begin
  Screen.OnActiveControlChange:=ActiveControlChanged;
   {$IFNDEF OBR_GRAG_WITH_NASEL}
     deAdrText.EditButtons[0].Visible:=false;
     deAdrText.EditButtons[1].Visible:=false;
//     deSignName.EditButtons[0].Visible:=false;
//     deSignName.EditButtons[1].Visible:=false;
   {$ENDIF}
end;
procedure TfmEdAProc.ActiveControlChanged(Sender: TObject);
var
  lEnabled : Boolean;
begin
  lEnabled:=false;
  if (ActiveControl is TDBEditEh) then begin //deResText)  then begin
    if TDBEditEh(ActiveControl).Field.FieldName='PROV_ORG'
      then lEnabled:=true;
  end;
  if btShablon.Enabled<>lEnabled
    then btShablon.Enabled:=lEnabled;
end;
procedure TfmEdAProc.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Shift=[]) and (Key=VK_F10)  then begin
    Key:=0;
    btShablonClick(nil);
  end;
end;

procedure TfmEdAProc.acOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfmEdAProc.acCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmEdAProc.acFileAddExecute(Sender: TObject);
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
      end;
   end;
end;

procedure TfmEdAProc.acFileDeleteExecute(Sender: TObject);
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

procedure TfmEdAProc.acFileEditExecute(Sender: TObject);
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

procedure TfmEdAProc.acFileViewExecute(Sender: TObject);
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

procedure TfmEdAProc.acFileViewListExecute(Sender: TObject);
begin
   SetFileView(not FIsTableView);
end;

procedure TfmEdAProc.lvDocFileChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
   UpdateEnabledAction;
end;

procedure TfmEdAProc.lvDocFileDblClick(Sender: TObject);
begin
   acFileViewExecute(nil);
end;

procedure TfmEdAProc.AddFileToListView;
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

procedure TfmEdAProc.SetFileView(IsTable: Boolean);
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

procedure TfmEdAProc.ClearControlEvent;
begin
//   dcAppForm.OnChange:=nil;
   dcAdmProc.OnChange:=nil;
   dcSignKind.OnChange:=nil;
end;

procedure TfmEdAProc.InvokeControlEvent;
begin
   SetFileView(False);
   //вызывать события для установки текущих значений реквизитов:
   // "Повторное заявление"
   chbIsRepeatClick(nil);
   // "В дело"
   chbInFileClick(nil);
   // "Снято с контроля или выполнено"
   chbCheckOutClick(nil);
   // "Адрес заявителя"
   SetAdrId(FDoc['ADR_ID'].AsInteger);
   // "Вид заявителя"
   SetSignKind(FDoc['SIGN_KIND'].AsInteger);
   // "Повторно"
   SetRepeatCount(False);
end;

procedure TfmEdAProc.OnAfterScroll(DataSet: TDataSet);
begin
   if DataSet.State=dsBrowse then begin
      UpdateEnabledAction;
   end;
end;

procedure TfmEdAProc.ResetControl;
begin
   FDoc.FileItem.EditTable.AfterScroll:=nil;
   FDoc.WorkItem.EditTable.AfterScroll:=nil;
end;

procedure TfmEdAProc.SetControl;
begin
   // установка режима просмотр/редактирование/добавление
   if FDoc.ViewMode=vmView then begin
      Caption:=Caption+' [ПРОСМОТР]';
   end;
   acOk.Enabled:=FDoc.ViewMode<>vmView;
   {--dlGroupId.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;}
   dcGroupId.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;
   deRepeatText.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;
   deRepeatText.EditButtons[1].Visible:=True;
   //NB: !!! ИСПРАВИТЬ !!! что бы через DBAwareList проходило и не было !!! ПОВТОРА !!!
   FDoc.QueryStringLists(
      'select ID, %s from SprDocGroup '+
      'where KIND=%d and IS_NODE=%d',
      [FDoc.DBItem.FieldList.ByName('GROUP_ID').LinkSpr.NameFieldName, gkAdmProc, iLeaf],
      dcGroupId.KeyItems,
      dcGroupId.Items
   );
   dcGroupId.DataField:='GROUP_ID';
   dcGroupId.DataSource:=FDoc.DBItem.EditSource;
   SetDropDownWidth(dcGroupId);
   // построение пунктов меню
   FDoc.DBItem.BuildMenu(pmWord, mkWordTemplate, nil);
   // список файлов
   FDoc.FileItem.EditTable.AfterScroll:=OnAfterScroll;
   FDoc.WorkItem.EditTable.AfterScroll:=OnAfterScroll;

   dcExecMan.EditButtons[0].OnClick:=dcExecManEditButtons0Click;
   deCheckMan.EditButtons[0].OnClick:=deCheckManEditButtons0Click;
   dcCreateMan.EditButtons[0].OnClick:=dcCreateManEditButtons0Click;
end;

procedure TfmEdAProc.SetControlEvent;
begin
//   dcAppForm.OnChange:=dcAppFormChange;
   dcAdmProc.OnChange:=dcAdmProcChange;
   dcSignKind.OnChange:=dcSignKindChange;
end;

procedure TfmEdAProc.SetControlPosition;
begin
   //прикрепленные файлы
   tbaDocFile.Top:=paDocFile.Top;
   tbaDocFile.Left:=paDocFile.Left+paDocFile.Width+7;
   //ход рассмотрения
   tbaDocWork.Top:=DOC_WORK.Top;
   tbaDocWork.Left:=DOC_WORK.Left+DOC_WORK.Width+7;
end;

procedure TfmEdAProc.UpdateEnabledAction;
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
   // ход рассмотрения
   acWorkAdd.Enabled:=FDoc.WorkItem.CanAdd and (FDoc.ViewMode<>vmView);
   acWorkDel.Enabled:=FDoc.WorkItem.CanDelete and (FDoc.ViewMode<>vmView);
   acWorkEdit.Enabled:=FDoc.WorkItem.CanEdit;
   acWorkUp.Enabled:=FDoc.WorkItem.CanPrev and (FDoc.ViewMode<>vmView);
   acWorkDown.Enabled:=FDoc.WorkItem.CanNext and (FDoc.ViewMode<>vmView);
end;

procedure TfmEdAProc.chbCheckOutClick(Sender: TObject);
begin
   laCheckDate.Enabled:=chbCheckOut.Checked;
   deCheckDate.Enabled:=chbCheckOut.Checked;
   laCheckMan.Enabled:=chbCheckOut.Checked;
   deCheckMan.Enabled:=chbCheckOut.Checked;
end;

procedure TfmEdAProc.chbInFileClick(Sender: TObject);
begin
   laFileId.Enabled:=chbInFile.Checked;
   dlFileId.Enabled:=chbInFile.Checked;
   laDeloDate.Enabled:=chbInFile.Checked;
   deDeloDate.Enabled:=chbInFile.Checked;
   //laFileVol.Enabled:=chbInFile.Checked;
   //deFileVol.Enabled:=chbInFile.Checked;
   //laFileList.Enabled:=chbInFile.Checked;
   //deFileList.Enabled:=chbInFile.Checked;
end;

procedure TfmEdAProc.acWorkAddExecute(Sender: TObject);
begin
   if FDoc.DocWork.DetailAdd then begin
      UpdateEnabledAction;
   end;
end;

procedure TfmEdAProc.acWorkDelExecute(Sender: TObject);
begin
   FDoc.DocWork.DetailDelete;
end;

procedure TfmEdAProc.acWorkEditExecute(Sender: TObject);
begin
   FDoc.DocWork.DetailEdit;
end;

procedure TfmEdAProc.acWorkUpExecute(Sender: TObject);
begin
   FDoc.DocWork.DetailUp;
end;

procedure TfmEdAProc.acWorkDownExecute(Sender: TObject);
begin
   FDoc.DocWork.DetailDown;
end;

procedure TfmEdAProc.deSignNameEditClick(Sender: TObject; var Handled: Boolean);
var
  nSel:Integer;
begin
   nSel:=FDoc['SIGN_KIND'].AsInteger;
   {$IFNDEF OBR_GRAG_WITH_NASEL}
     if nSel=skMan
       then nSel:=-1;
   {$ENDIF}
   if nSel>-1 then begin
     if FDoc.SelectSign(nSel, stIndividual) then begin
        SetAdrId(Doc2Sel.SignAdresId);
        SetSignKind(FDoc['SIGN_KIND'].AsInteger);
     end;
   end;
end;

procedure TfmEdAProc.deSignNameClearClick(Sender: TObject; var Handled: Boolean);
begin
   FDoc.ClearSign;
   SetSignKind(FDoc['SIGN_KIND'].AsInteger);
end;

procedure TfmEdAProc.deAdrTextEditClick(Sender: TObject; var Handled: Boolean);
begin
   if FDoc.SelectAdres then begin
      SetAdrId(Doc2Sel.SignAdresId);
   end;
end;

procedure TfmEdAProc.deAdrTextClearClick(Sender: TObject; var Handled: Boolean);
begin
   FDoc.ClearAdrId;
   SetAdrId(-1);
end;

procedure TfmEdAProc.SetAdrId(AdrId: Integer);
begin
   //NB: ??? каким образом обновится текст адреса, если его изменить в базе адресов
   if AdrId>0 then begin
      deAdrText.ReadOnly:=True;
      deAdrText.Font.Style:=[fsBold];
   end
   else begin
      deAdrText.ReadOnly:=False;
      deAdrText.Font.Style:=[];
   end;
end;

procedure TfmEdAProc.SetEnabledProvDoc(lSet:Boolean);
begin
  laProvDoc.Enabled:=lSet;
  laProvSer.Enabled:=lSet;
  laProvNum.Enabled:=lSet;
  laProvDate.Enabled:=lSet;
  laProvOrg.Enabled:=lSet;
  laPersonId.Enabled:=lSet;
  dcProvType.Enabled:=lSet;
  deProvSer.Enabled:=lSet;
  deProvNum.Enabled:=lSet;
  deProvDate.Enabled:=lSet;
  deProvOrg.Enabled:=lSet;
  dePersonId.Enabled:=lSet;
end;

procedure TfmEdAProc.SetSignKind(SignKind: Integer);
var
   SprName: string;{+}
   LinkSpr: TDBItem;{+}
begin
   //юридические лица
   if SignKind=skUL then begin
      SetEnabledProvDoc(false);
      deSignName.Enabled:=True;
      deSignName.EditButtons[0].Hint:='Выбрать заявителя из списка корреспондентов...';
      if FDoc['SIGN_ORG'].AsInteger>0 then begin
         deSignName.Font.Style:=[fsBold];
         deSignName.ReadOnly:=True;
      end
      else begin
         deSignName.ReadOnly:=False;
         deSignName.Font.Style:=[];
      end;
      SetSignCount(FDoc.AutoCountSign(stIndividual, SignKind));
      SetProcCount(FDoc.AutoCountSubj(stIndividual, SignKind));
   end
   //граждане
   else if SignKind=skMan then begin
      {$IFDEF OBR_GRAG_WITH_NASEL}
      SetEnabledProvDoc(true);
      deSignName.Enabled:=True;
      deSignName.EditButtons[0].Hint:='Выбрать заявителя из реестра населения...';
      if FDoc['SIGN_MAN'].AsInteger>0 then begin
         deSignName.Font.Style:=[fsBold];
         deSignName.ReadOnly:=True;
      end
      else begin
         deSignName.ReadOnly:=False;
         deSignName.Font.Style:=[];
      end;
      SetSignCount(FDoc.AutoCountSign(stIndividual, SignKind));
      SetProcCount(FDoc.AutoCountSubj(stIndividual, SignKind));
      {$ELSE}
      SetEnabledProvDoc(true);
      deSignName.Enabled:=True;
      deSignName.ReadOnly:=false;
      deSignName.Font.Style:=[];
      deSignName.EditButtons[0].Hint:='';
      SetSignCount(FDoc.AutoCountSign(stIndividual, SignKind));
      SetProcCount(FDoc.AutoCountSubj(stIndividual, SignKind));
      {$ENDIF}
   end
   else begin
      deSignName.Font.Style:=[];
      deSignName.ReadOnly:=False;
      deSignName.Enabled:=False;
      SetEnabledProvDoc(false);
   end;
   {+}
   //настроить выпадающий список для выбора административной процедуры
   SprName:='SP_ADMPROC2';
   if (dcAdmProc.Value=Null) or (dcAdmProc.Value='') then begin
      if SignKind=skUL then SprName:='SP_ADMPROC_U2';
   end
   else if dcAdmProc.Value>10000 then SprName:='SP_ADMPROC_U2';
   LinkSpr:=Doc.RecInt.SprDBItems.ByName(SprName);
   LinkSpr.GetKeyPickList(dcAdmProc.KeyItems, dcAdmProc.Items, LinkSpr.PickFieldNames);
   {+}
end;

procedure TfmEdAProc.dcSignKindChange(Sender: TObject);
var
   SignKind: Integer;
begin
   SignKind:=-1;
   if dcSignKind.ItemIndex<>-1 then begin
      SignKind:=StrToInt(dcSignKind.KeyItems[dcSignKind.ItemIndex]);
   end;
   FDoc.ClearSign;
   SetSignKind(SignKind);
end;

procedure TfmEdAProc.chbIsRepeatClick(Sender: TObject);
begin
   //laRepeatText.Enabled:=chbIsRepeat.Checked;
   deRepeatText.Enabled:=chbIsRepeat.Checked;
end;

procedure TfmEdAProc.dcGroupIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
   FDoc.SelectGroup;
end;

procedure TfmEdAProc.acWordExecute(Sender: TObject);
begin
//
end;

procedure TfmEdAProc.deRepeatAddClick(Sender: TObject; var Handled: Boolean);
var
   Query: TAdsQuery;
   LastOrder: Integer;
   Bookmark: TStringList;
   I: Integer;
begin
   Bookmark:=TStringList.Create;
   try
      if FDoc.SelectDocument(Query, Bookmark) then begin
         try
            LastOrder:=FDoc.LinkItem.GetLastOrder(skEdit);
            for I:=0 to Pred(Bookmark.Count) do begin
               Query.Bookmark:=Bookmark[I];
               if Query.FieldByName('DOC_ID').AsInteger>0 then begin
                  Inc(LastOrder);
                  CopyDocLink(Query, FDoc.LinkItem.EditTable, LastOrder);
               end;
            end;
            //--FDoc['REPEAT_TEXT'].AsString:=FDoc.GetRepeatText(FDoc.LinkItem.EditTable);
            SetRepeatCount;
         finally
            Query.Free;
         end;
      end;
   finally
      Bookmark.Free;
   end;
end;

procedure TfmEdAProc.deRepeatEditClick(Sender: TObject; var Handled: Boolean);
begin
   if EditLinkList(FDoc) then begin
      //--FDoc['REPEAT_TEXT'].AsString:=FDoc.GetRepeatText(FDoc.LinkItem.EditTable);
      SetRepeatCount;
   end;                                         
end;

procedure TfmEdAProc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:=FDoc.OnFormCloseQuery(FDoc.DBItem);
end;

procedure TfmEdAProc.SetProcCount(ProcCount: Integer);
begin
   laProcCount.Visible:=ProcCount<>0;
   laProcCount.Caption:=Format('(+%d)', [ProcCount]);
end;

procedure TfmEdAProc.SetSignCount(SignCount: Integer);
begin
   laSignCount.Visible:=SignCount<>0;
   laSignCount.Caption:=Format('(+%d)', [SignCount]);
end;

procedure TfmEdAProc.dcAdmProcChange(Sender: TObject);
var
   ProcId: Integer;
begin
   ProcId:=0;
   if dcAdmProc.Value<>Null then begin
      ProcId:=dcAdmProc.Value;
   end;
   SetSignCount(FDoc.AutoCountSign(stIndividual, FDoc['SIGN_KIND'].AsInteger));
   SetProcCount(FDoc.AutoCountSubj(stIndividual, FDoc['SIGN_KIND'].AsInteger, ProcId));
end;

procedure TfmEdAProc.SetRepeatCount(SetText: Boolean=True);
var
   RepeatText: string;
   RepeatCount: Integer;
begin
   RepeatText:=FDoc.GetRepeatText(FDoc.LinkItem.EditTable, RepeatCount);
   if SetText then begin
      FDoc['REPEAT_TEXT'].AsString:=RepeatText;
   end;
   //laRepeatCount.Visible:=RepeatCount<>0;
   //laRepeatCount.Caption:=Format('(+%d)', [RepeatCount]);
end;

procedure TfmEdAProc.btShablonClick(Sender: TObject);
var
  s,s1,s2:String;
  n:Integer;
  ed:TDBEditEh;
begin
  ed:=nil;
  s:='';
  if btShablon.Enabled and (ActiveControl is TDBEditEh) then begin
    ed:=TDBEditEh(ActiveControl);
    if ed.Field.FieldName='PROV_ORG' then begin
      s:=ChoiceFromShablon(SHABLON_ROVD);
    end;
  end;
  if (ed<>nil) and (s<>'') then begin
    n:=ed.SelStart;
    ed.SelStart:=0;
    ed.SelLength:=0;
    s1:=Copy(ed.Text,1,n);
    s2:=Copy(ed.Text,n+1,Length(ed.Text));
    ed.Text := s1+s+s2;
    ed.SelStart:=Length(s1+s);
  end;
end;

{$IF Defined(ZAGS) or Defined(LAIS) }
procedure TfmEdAProc.miZSmertClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  s,ss:String;
  n:INteger;
begin
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_SMERT');
  if Opis<>nil then begin
    v:=null;
    try
      if Opis.ChoiceFromSprEx( btChoiceMen, v, arrRec, nil) and (v<>null) then begin
        FDoc.ClearSign;
        FDoc['SIGN_KIND'].AsInteger:=skMan;
        SetSignKind(FDoc['SIGN_KIND'].AsInteger);
        s:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZSmert, GetValueFieldEx(arrRec, 'ID', '0'), STOD('1899-12-30',tdAds),'DECL_DOK', ftMemo);
        if s<>'' then FDoc['PROV_ORG'].AsString:=s;
        s:=GetValueFieldEx(arrRec, 'DECL', '');
        n:=Pos(',',s);
        if n>0 then begin
          ss:=Trim(Copy(s,n+1,Length(s)));
          s:=Copy(s,1,n-1);
        end else begin
          ss:='';
        end;
        if ss<>'' then FDoc['ADR_TEXT'].AsString:=ss;
        if s<>''  then FDoc['SIGN_NAME'].AsString:=s;
        s:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZSmert, GetValueFieldEx(arrRec, 'ID', '0'), STOD('1899-12-30',tdAds),'OTHER', ftMemo);
        s:=getFieldFromSL(s, 'DECL_IN', 'C');
        if s<>''  then FDoc['PERSON_ID'].AsString:=s;
      end;
    finally

    end;
  end;
end;

procedure TfmEdAProc.miZRogdClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old:String;
  arr:TArrStrings;
begin
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ROGD');
  if Opis<>nil then begin
    old:=Opis.NameSort;
    Opis.NameSort:='KEY_VIEW';
    v:=null;
    try
      if Opis.ChoiceFromSprEx( btChoiceMen, v, arrRec, nil) and (v<>null) then begin
        FDoc.ClearSign;
        FDoc['SIGN_KIND'].AsInteger:=skMan;
        SetSignKind(FDoc['SIGN_KIND'].AsInteger);

        StrToArr(GetValueFieldEx(arrRec, 'DECL', ''),arr,chr(13)+chr(10),false);
        SetLength(arr,3);
        if arr[0]<>'' then FDoc['SIGN_NAME'].AsString:=arr[0];
        if arr[1]<>'' then FDoc['ADR_TEXT'].AsString:=arr[1];
        if arr[2]<>'' then FDoc['PROV_ORG'].AsString:=arr[2];
//        if s<>''  then FDoc['PERSON_ID'].AsString:=s;
      end;
    finally
      Opis.NameSort:=old;
    end;
  end;
end;

{$ELSE}

procedure TfmEdAProc.miZSmertClick(Sender: TObject);
begin
//
end;
procedure TfmEdAProc.miZRogdClick(Sender: TObject);
begin
//
end;

{$IFEND}

procedure TfmEdAProc.dcCreateManEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(dcCreateMan);
  if nID>0 then FDoc['VISIT_MAN'].AsInteger:=nID;
end;

procedure TfmEdAProc.dcExecManEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(dcExecMan);
  if nID>0 then FDoc['Exec_MAN'].AsInteger:=nID;
end;

procedure TfmEdAProc.deCheckManEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(deCheckMan);
  if nID>0 then FDoc['CHECK_MAN'].AsInteger:=nID;
end;

end.
