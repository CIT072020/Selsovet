unit fEdIn;
interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils, fWarning,
  {$IFDEF SMDO} uSmdo, fSMDODoc, {$ENDIF}
  uProject, MetaTask, OpisEdit, FuncPr, dbFunc, FuncEh, fMultiChoice,
  Menus,ImgList, Dialogs, ActnList, StdCtrls, DBCtrlsEh, DBLookupEh, Mask,
  ComCtrls, Grids, DBGridEh, ExtCtrls, ToolWin, ShellApi, DB, fShablon,
  mAdsObj, mDRecInt, fSprEdit, dDocImg;

type
   TfmEdIn=class(TForm)
      bvTop: TBevel;
      tbaDocFile: TToolBar;
      tbFileAdd: TToolButton;
      tbFileDelete: TToolButton;
      tbFileEdit: TToolButton;
      tbFileView: TToolButton;
      tbFileViewList: TToolButton;
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
      paDocFile: TPanel;
      DOC_FILE: TDBGridEh;
      lvDocFile: TListView;
      tbaEditRec: TToolBar;
      tbOk: TToolButton;
      tbSep1: TToolButton;
      tbCancel: TToolButton;
      laFolderId: TLabel;
      dcFolderId: TDBComboBoxEh;
      laGroupId: TLabel;
      dlGroupId: TDBLookupComboboxEh;
      laRegDate: TLabel;
      deRegDate: TDBDateTimeEditEh;
      laRegInd: TLabel;
      deRegInd: TDBEditEh;
      laRegNum: TLabel;
      deRegNum: TDBNumberEditEh;
      laDelivKind: TLabel;
      dcDelivKind: TDBComboBoxEh;
      laSignOrg: TLabel;
      dlSignOrg: TDBLookupComboboxEh;
      laSignName: TLabel;
      deSignName: TDBEditEh;
      laDocDate: TLabel;
      deDocDate: TDBDateTimeEditEh;
      laDocInd: TLabel;
      deDocInd: TDBEditEh;
      deReqDate: TDBDateTimeEditEh;
      laReqDate: TLabel;
      deReqInd: TDBEditEh;
      laReqInd: TLabel;
      laDocKind: TLabel;
      dcDocKind: TDBComboBoxEh;
      laNumList: TLabel;
      deNumList: TDBEditEh;
      laNumApp: TLabel;
      deNumApp: TDBEditEh;
      laContent: TLabel;
      deContent: TDBEditEh;
      laAdrNote: TLabel;
      deAdrNote: TDBEditEh;
      laAdrPhone: TLabel;
      deAdrPhone: TDBEditEh;
      laSubjId: TLabel;
      dlSubjId: TDBLookupComboboxEh;
      laReqText: TLabel;
      laResText: TLabel;
      deResText: TDBEditEh;
      laResMan: TLabel;
      laResDate: TLabel;
      dcResMan: TDBComboBoxEh;
      deResDate: TDBDateTimeEditEh;
      laExecMan: TLabel;
      dcExecMan: TDBComboBoxEh;
      laExecTerm: TLabel;
      deExecTerm: TDBDateTimeEditEh;
      laExecFact: TLabel;
      deExecFact: TDBDateTimeEditEh;
      laAnsText: TLabel;
      deAnsText: TDBEditEh;
      laAnsInd: TLabel;
      deAnsInd: TDBEditEh;
      laAnsDate: TLabel;
      deAnsDate: TDBDateTimeEditEh;
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
      laDocFile: TLabel;
      deReqText: TDBEditEh;
      dcGroupId: TDBComboBoxEh;
    pmWord: TPopupMenu;
    tbWord: TToolButton;
    tbSep2: TToolButton;
    dePostID: TDBNumberEditEh;
    btSMDO: TToolButton;
    imSMDO: TImage;
    btShablon: TToolButton;
    deExecMens: TDBEditEh;
    deExecMensID: TDBEditEh;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    ToolButton1: TToolButton;
    pmRun: TPopupMenu;
    StrCalcIndex: TMenuItem;
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
      procedure chbInFileClick(Sender: TObject);
      procedure chbCheckOutClick(Sender: TObject);
      procedure dcGroupIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acWordExecute(Sender: TObject);
    procedure btSMDOClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btShablonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure deExecMensEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure dcExecManEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure dcResManEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure btOpenSMDOClick(Sender: TObject);
    procedure dlSignOrgEditButtons1Click(Sender: TObject;     var Handled: Boolean);
    procedure deRegIndEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure deRegIndDblClick(Sender: TObject);
    procedure dcCreateManEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure deCheckManEditButtons0Click(Sender: TObject;      var Handled: Boolean);
   private
      FDoc: TIncomingDoc;
      FIsTableView: Boolean;
      FFormula:String;
   private
      procedure SetFileView(IsTable: Boolean);
      procedure AddFileToListView;
   private
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
      property Doc: TIncomingDoc read FDoc write FDoc;
      function Event_ONViewREcord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
      procedure ActiveControlChanged(Sender: TObject);
      procedure Event_GridSmdoGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);

   end;

implementation

uses dBase;

{$R *.dfm}

procedure TfmEdIn.FormCreate(Sender: TObject);
var
   Column: TListColumn;        
begin
   FFormula:=Trim(GlobalTask.ParamAsString('VXOD_NOMER'));
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
end;

procedure TfmEdIn.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveControlChange:=nil;
end;

procedure TfmEdIn.acOkExecute(Sender: TObject);
var
  lOk:Boolean;
begin
   lOk:=true;
   FDoc.DBItem.EditTable.CheckBrowseMode;
   if FDoc.DBItem.EditTable.FieldByName('POST_ID').AsInteger>0 then begin
     if (FDoc.DBItem.EditTable.FieldByName('REG_IND').AsString='') or
        (FDoc.DBItem.EditTable.FieldByName('REG_DATE').AsString='')  then begin
       PutError('Заполните входящий индекс и дату поступления для регистрации в СМДО',self);
       lOk:=false;
     end;
   end;
   if lOk  
     then ModalResult:=mrOk;
end;
                              
procedure TfmEdIn.acCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmEdIn.acFileAddExecute(Sender: TObject);
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

procedure TfmEdIn.acFileDeleteExecute(Sender: TObject);
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

procedure TfmEdIn.acFileEditExecute(Sender: TObject);
var
   Icon: TIcon;
   old:TViewMode;
begin
   old:=FDoc.DocFile.ViewMode;
   FDoc.DocFile.ViewMode:=vmView;
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
   FDoc.DocFile.ViewMode:=old;
end;

procedure TfmEdIn.acFileViewExecute(Sender: TObject);
begin
   if FIsTableView then begin
      FDoc.DocFile.ViewFile;
   end
   else if lvDocFile.Selected<>nil then begin
      if FDoc.FileItem.EditTable.Locate('FILE_ID', Integer(lvDocFile.Selected.Data), []) then begin
         FDoc.DocFile.ViewFile;
      end;
   end;
end;

procedure TfmEdIn.acFileViewListExecute(Sender: TObject);
begin
   SetFileView(not FIsTableView);
end;

procedure TfmEdIn.lvDocFileChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
   UpdateEnabledAction;
end;

procedure TfmEdIn.lvDocFileDblClick(Sender: TObject);
begin
   acFileViewExecute(nil);
end;

procedure TfmEdIn.AddFileToListView;
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

procedure TfmEdIn.SetFileView(IsTable: Boolean);
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

procedure TfmEdIn.ClearControlEvent;
begin

end;

procedure TfmEdIn.InvokeControlEvent;
begin
   SetFileView(False);
   //вызывать события для установки текущих значений реквизитов:
   // "В дело"
   chbInFileClick(nil);
   // "Снято с контроля или выполнено"
   chbCheckOutClick(nil);
end;

procedure TfmEdIn.OnAfterScroll(DataSet: TDataSet);
begin
   if DataSet.State=dsBrowse then begin
      UpdateEnabledAction;
   end;
end;

procedure TfmEdIn.ResetControl;
begin
   FDoc.FileItem.EditTable.AfterScroll:=nil;
end;

procedure TfmEdIn.SetControl;
begin
   // установка режима просмотр/редактирование/добавление
   if FDoc.ViewMode=vmView then begin
      Caption:=Caption+' [ПРОСМОТР]';
   end;
   acOk.Enabled:=FDoc.ViewMode<>vmView;
   {$IFDEF SMDO}
     btSMDO.Visible:=SMDOEnabled;
     btSMDO.Enabled:=FDoc.ViewMode<>vmView;
   {$ELSE}
     btSMDO.Visible:=false;
   {$ENDIF}
   {--dlGroupId.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;}
   dcGroupId.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;
   //NB: !!! ИСПРАВИТЬ !!! что бы через DBAwareList проходило и не было !!! ПОВТОРА !!!
   FDoc.QueryStringLists(
      'select ID, %s from SprDocGroup '+
      'where KIND=%d and IS_NODE=%d',
      [FDoc.DBItem.FieldList.ByName('GROUP_ID').LinkSpr.NameFieldName, gkIncoming, iLeaf],
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
   deExecMens.Color:=clInfoBk;
   deExecMens.ReadOnly:=true;
   dcExecMan.EditButtons[0].OnClick:=dcExecManEditButtons0Click;
   dcResMan.EditButtons[0].OnClick:=dcResManEditButtons0Click;
   dcCreateMan.EditButtons[0].OnClick:=dcCreateManEditButtons0Click;
   deCheckMan.EditButtons[0].OnClick:=deCheckManEditButtons0Click;

 //??? может назначить свой выбор    dlSignOrg.EditButtons[0].OnClick:=dlSignOrgEditButtons0Click;
   dlSignOrg.EditButtons[0].Visible:=false; // стандартный выбор от Димы

   if FFormula=''
     then deRegInd.EditButtons[0].Visible:=false
     else deRegInd.Hint:=FFormula;

end;

procedure TfmEdIn.SetControlEvent;
begin

end;

procedure TfmEdIn.SetControlPosition;
begin
   tbaDocFile.Top:=paDocFile.Top;
   tbaDocFile.Left:=paDocFile.Left+paDocFile.Width+7;
end;

procedure TfmEdIn.UpdateEnabledAction;
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

procedure TfmEdIn.chbInFileClick(Sender: TObject);
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

procedure TfmEdIn.chbCheckOutClick(Sender: TObject);
begin
   laCheckDate.Enabled:=chbCheckOut.Checked;
   deCheckDate.Enabled:=chbCheckOut.Checked;
   laCheckMan.Enabled:=chbCheckOut.Checked;
   deCheckMan.Enabled:=chbCheckOut.Checked;
end;

procedure TfmEdIn.dcGroupIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
   FDoc.SelectGroup;
end;

procedure TfmEdIn.FormCloseQuery(Sender: TObject; var CanClose: Boolean);       
begin
   CanClose:=FDoc.OnFormCloseQuery(FDoc.DBItem);
end;

procedure TfmEdIn.acWordExecute(Sender: TObject);
begin
//
end;

procedure TfmEdIn.Event_GridSmdoGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  try
    if Column.Field.DataSet.FieldByName('SUBJ_ERROR').AsBoolean=true
      then AFont.color:=clRed;
  except
  end;
end;

procedure TfmEdIn.btOpenSMDOClick(Sender: TObject);
begin
//
end;

procedure TfmEdIn.btSMDOClick(Sender: TObject);
var
//  fld:TField;
  ds,dsFile:TDataSet;
  lErr:Boolean;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  d:TDateTime;
  s,sFile,oldST:String;
  i,nPostID:Integer;
  old:TViewRecordEvent;
  Item:TFieldItem;
  Par : TParamsEditSpr;
  slPar:TStringList;
  nID:Integer;
begin
{$IFDEF SMDO}
  ds:=deRegNum.DataSource.DataSet;
//  fld:=ds.FindField('POST_ID');
  nID:=ds.FieldByName('POST_ID').AsInteger;
  if nID>0 then begin
    if dmBase.SMDOPost.Locate('ID', nID, []) then begin
      slPar:=TStringList.Create;
      EditSMDODoc(nID, slPar);
      FreeAndNil(slPar);
      {
      if dmBase.SMDOPost.FieldByName('MY_REGNUMBER').AsString<>'' then begin
        PutError('К РКК уже подключено сообщение СМДО и введен регистрационный номер.',self);
        exit;
      end;
      }
    end else begin
      ShowMessageCont('Сообщение почты СМДО не найдено. Возможно оно было удалено.',self);
    end;
    exit;
//    if not Problem('К РКК уже подключено сообщение СМДО. Продолжить ?')
//      then exit;
  end;

  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SMDOPOST');
  if Opis <> nil then begin
    v := null;
//  DOC_PRESENT=1;     документ или уведомление: получен или отправлен
//  DOC_DELIVER=2;     документ доставлен (получена или отправлена квит. о доставке)

//    dmBase.SMDOPost.Filter:='SUBJ_TYPE=1 and MSG_TYPE>0 and SUBJ_ERROR=false and ACK_TYPE<>'+inttostr(ACK_REGISTER)+' and Empty(MY_REGNUMBER)';   // входящее сообщение, не уведомление, не зарегистрированное
//  разрешил выбирать для регистрации ошибочные документы

// !!!   oldInd:=dmBase.SMDOPost.IndexName;
//    dmBase.SMDOPost.IndexName:='DATEPOST_KEY';

    dmBase.SMDOPost.Filter:='SUBJ_TYPE=1 and MSG_TYPE>0 and ACK_TYPE<>'+inttostr(ACK_REGISTER)+' and Empty(MY_REGNUMBER)';   // входящее сообщение, не уведомление, не зарегистрированное
//    dmBase.SMDOPost.Filter:='SUBJ_TYPE=1 and MSG_TYPE>0 and SUBJ_ERROR=false';   // входящее сообщение, не уведомление, не зарегистрированное
    dmBase.SMDOPost.Filtered:=true;
    Par:=TParamsEditSpr.Create;
    Par.OnGetCellParams:=Event_GridSmdoGetCellParams;
    Opis.SetParamsEditSpr(Par);
    try
      if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
        if v <> null then begin
          EditDataSet(ds);
          nPostID:=GetValueFieldEx(arrrec, 'ID', 0);
          // !!! если выбираем перый раз !!!
//          if ds.FieldByName('POST_ID').AsInteger=0 then begin
          ds.FieldByName('POST_ID').AsInteger:=nPostID;
//          end;
          d:=GetValueFieldEx(arrrec, 'DATEPOST', 0);
          if d>0  then ds.FieldByName('REG_DATE').AsDateTime:=d;

          d:=GetValueFieldEx(arrrec, 'ADR_REGDATE', 0);
//было          if d>0  then ds.FieldByName('REQ_DATE').AsDateTime:=d;
          if d>0  then ds.FieldByName('DOC_DATE').AsDateTime:=d;
//было          ds.FieldByName('REQ_IND').AsString:=GetValueFieldEx(arrrec, 'ADR_REGNUMBER', '');
          ds.FieldByName('DOC_IND').AsString:=GetValueFieldEx(arrrec, 'ADR_REGNUMBER', '');

          ds.FieldByName('DELIV_KIND').AsInteger:=dkSMDO;
          s:=GetValueFieldEx(arrrec, 'SMDOCODE', '');
          if (s<>'') and dmBase.SprWork.Locate('SMDOCODE', s, []) then begin
            ds.FieldByName('SIGN_ORG').AsString:=dmBase.SprWork.FieldByNAme('ID').AsString;
            // поставим, что является корреспондентом
            if dmBase.SprWork.FieldByName('IS_KORR').IsNull or not dmBase.SprWork.FieldByName('IS_KORR').AsBoolean then begin
              dmBase.SprWork.Edit;
              dmBase.SprWork.FieldByName('IS_KORR').AsBoolean:=true;
              dmBase.SprWork.Post;
            end;
          end else begin
            PutError('Отправитель не найден в справочнике организаций !');
          end;
          ds.FieldByName('CONTENT').AsString:=GetValueFieldEx(arrrec, 'TEXT', '');
//          s:=GetValueFieldEx(arrrec, 'ACK_ADD_TEXT', '');
//          if s<>'' then
//            ds.FieldByName('CONTENT').AsString:=ds.FieldByName('CONTENT').AsString+#13#10+s;

          if dmBase.SMDOMens.Locate('POST_ID;PARENT_ID;TIP', VarArrayOf([nPostID,nPostID,MEN_AUTHOR]),[]) then begin
            ds.FieldByName('SIGN_NAME').AsString:=dmBase.SMDOMens.FieldByName('FIO').AsString;
          end;
          ds.FieldByName('NUM_LIST').AsString:=GetValueFieldEx(arrrec, 'PAGES', '');
          s:=Ansilowercase(Trim(GetValueFieldEx(arrrec, 'KIND', '')));
          ds.FieldByName('DOC_KIND').AsString:='';
          for i:=0 to dcDocKind.Items.Count-1 do begin
            if s=dcDocKind.Items[i] then begin
              ds.FieldByName('DOC_KIND').AsString:=dcDocKind.KeyItems[i];
              break;
            end;
          end;
          if ds.FieldByName('DOC_KIND').AsString='' then ds.FieldByName('DOC_KIND').AsInteger:=dk99;
//ds.FieldByName('DOC_KIND').AsString:=;
//           Item:=FDoc.DocFile.DBItem.FieldList.ByName('DOC_KIND');
//           item.LinkEnum.PickList
//           item.LinkEnum.KeyList
          old:=FDoc.DocFile.DBItem.OnViewRecord;
          oldST:=GlobalTask.ParamAsString('DR_STORE_KIND');
          dmBase.SMDOFile.IndexName:='POST_KEY';  // POST_ID;PARENT_ID
          dmBase.SMDOFile.SetRange([nPostID],[nPostID]);
          FDoc.DocFile.DBItem.OnViewRecord:=Event_ONViewREcord;
          GlobalTask.WriteParamAsString('DR_STORE_KIND','1');  //ссылка на файл
          try
            while not dmBase.SMDOFile.Eof do begin
//              sFile:=NormDir(dmBase.SMDOFile.FieldByName('PATH').AsString)+Trim(dmBase.SMDOFile.FieldByName('NAME').AsString);
              //--- !!! -----------------------------------------
              // $$$ dmBase.getFileSMDO  переделать
              if dmBase.SMDOFile.FieldByName('ADD_FILE').AsInteger=0 then begin  // !!! основной файл !!!
                sFile:=Trim(dmBase.SMDOFile.FieldByName('PATH').AsString)+Trim(dmBase.SMDOFile.FieldByName('NAME').AsString);
                FDoc.DocFile.FileName:=sFile;
                FDoc.DocFile.DetailAdd;
                dsFile:=FDoc.DocFile.DBItem.EditTable;
                dsFile.CheckBrowseMode;
                dsFile.Edit;
                dsFile.FieldByName('SIGNATURE').AsString:=dmBase.SMDOFile.FieldByName('SIGNATURE').AsString;
                dsFile.FieldByName('SIGNINFO').AsString:=dmBase.SMDOFile.FieldByName('SIGNINFO').AsString;
                dsFile.Post;
//              FDoc.DocFile.DBItem.EditTable.FieldByName('').AsString;
//              FDoc.DocFile.DBItem.EditTable.Post;
                AddFileToListView;
              end;
              dmBase.SMDOFile.Next;
{
   Sender.SetDestField([
      DBItem.OrderFieldName,   Succ(LastOrder),              // порядок просмотра записей
      // способ хранения
      'STORE_KIND',            Doc2Sel.ParamAsInteger('DR_STORE_KIND') ,  1=только ссылка на файл  2=в специальной папке
      'NAME',                  ExtractFileName(FFileName),   // имя файла
      'PATH',                  ExtractFilePath(FFileName),   // путь к файлу
      'READ_ONLY',             lYes,                         // только для чтения
      'DIR_YEAR',              FormatDateTime('YYYY', Date), // год
      'DIR_MONTH',             FormatDateTime('MM', Date),   // месяц
      // имя файла в специальной папке
      'DIR_NAME',              FormatDateTime('yyyymmdd_hhnnss_zzz', Now)+'.zip'
   ]);
}
            end;
          finally
            dmBase.SMDOFile.CancelRange;
            FDoc.DocFile.DBItem.OnViewRecord:=old;
            GlobalTask.WriteParamAsString('DR_STORE_KIND',oldST);
          end;
        end;
      end;
    finally
      dmBase.SMDOPost.Filtered:=false;
//      dmBase.SMDOPost.IndexName:=oldInd;
    end;
    imSMDO.Visible:=FDoc['POST_ID'].AsInteger>0;
  end;
{$ENDIF}
end;

function TfmEdIn.Event_ONViewREcord(Sender: TDBItem;  ViewMode: TViewMode): Boolean;
begin
  Result:=true;
end;

procedure TfmEdIn.FormActivate(Sender: TObject);
begin
  imSMDO.Visible:=FDoc['POST_ID'].AsInteger>0;
  Screen.OnActiveControlChange:=ActiveControlChanged;
end;

procedure TfmEdIn.btShablonClick(Sender: TObject);
var
  s,s1,s2:String;
  n:Integer;
  ed:TDBEditEh;
  l:Boolean;
begin
  ed:=nil;
  s:='';
  if btShablon.Enabled and (ActiveControl is TDBEditEh) then begin
    ed:=TDBEditEh(ActiveControl);
    if ed.Field.FieldName='RES_TEXT' then begin
      s:=ChoiceFromShablon(SHABLON_RES);
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
  end else if ActiveControl is TDBComboBoxEh then begin
    s:=TDBComboBoxEh(ActiveControl).DataField;
    if s='EXEC_MAN' then begin
      dcExecManEditButtons0Click(dcExecMan,l);
    end else if s='RES_MAN' then begin
      dcResManEditButtons0Click(dcResMan,l);
    end else if s='VISIT_MAN' then begin
      dcCreateManEditButtons0Click(dcCreateMan,l);
    end else if s='CHECK_MAN' then begin
      deCheckManEditButtons0Click(dcCreateMan,l);
    end;
  end else if ActiveControl is TDBEditEh then begin
    if TDBEditEh(ActiveControl).DataField='IDEN_TEXT' then begin
      deExecMensEditButtons0Click(deExecMens,l);
    end;
  end;
end;

procedure TfmEdIn.ActiveControlChanged(Sender: TObject);
var
  lEnabled : Boolean;
begin
  lEnabled:=false;
  if (ActiveControl is TDBEditEh) then begin //deResText)  then begin
    if TDBEditEh(ActiveControl).Field.FieldName='RES_TEXT'
      then lEnabled:=true;
  end;
  if btShablon.Enabled<>lEnabled
    then btShablon.Enabled:=lEnabled;
end;

procedure TfmEdIn.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
  l:Boolean;
begin
  if (Shift=[]) and (Key=VK_F10)  then begin
    Key:=0;
    btShablonClick(Sender);
  end else if ((Key=VK_ADD) or (Key=187)) and (Shift=[ssCtrl]) then begin
    if FFormula<>'' then begin
      Key:=0;
      deRegIndEditButtons0Click(nil,l);
    end;  
  end;
end;

procedure TfmEdIn.deExecMensEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  f:TfmMultiChoice;
  i:Integer;
  sKey,sSeek:String;
begin
  if dcExecMan.Items.Count>0 then begin
    if dcExecMan.ItemIndex>-1
      then sKey:=dcExecMan.KeyItems[dcExecMan.ItemIndex]
      else sKey:='**';
    f := TfmMultiChoice.Create(Self);
    f.FFieldName:='';
    f.Caption:='Исполнители';
    for i:=0 to dcExecMan.Items.Count-1 do begin
      sSeek:=dcExecMan.KeyItems[i];
      if sSeek<>sKey then begin
        if dmBase.SprDocOfficial.Locate('ID', sSeek, []) and
           (dmBase.SprDocOfficial.FieldByName('IS_ACTUAL').AsBoolean or dmBase.SprDocOfficial.FieldByName('IS_ACTUAL').IsNUll) then begin
          f.AddValue(dcExecMan.KeyItems[i] ,dcExecMan.Items[i] );
        end;
      end;
    end;
    f.SetValues(FDoc['IDEN_DATE'].AsString, ',');
    if f.ShowModal=mrOk then begin
      FDoc['IDEN_DATE'].AsString:=f.GetValues;
      FDoc['IDEN_TEXT'].AsString:=f.GetValuesAsText(',');
    end;
    f.Free;
  end;
end;
//------------------------------------
procedure TfmEdIn.dcExecManEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(dcExecMan);
  if nID>0 then FDoc['EXEC_MAN'].AsInteger:=nID;
end;
//----------------------------------------------
procedure TfmEdIn.dcResManEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(dcResMan);
  if nID>0 then FDoc['RES_MAN'].AsInteger:=nID;
end;
//----------------------------------------------
procedure TfmEdIn.dcCreateManEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(dcCreateMan);
  if nID>0 then FDoc['VISIT_MAN'].AsInteger:=nID;
end;
//----------------------------------------------
procedure TfmEdIn.deCheckManEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(deCheckMan);
  if nID>0 then FDoc['CHECK_MAN'].AsInteger:=nID;
end;

//----------------------------------------------
procedure TfmEdIn.dlSignOrgEditButtons1Click(Sender: TObject;  var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK2');
  if Opis<>nil then begin
    v:=null;
    try
      if Opis.ChoiceFromSprEx( dlSignOrg, v, arrRec, nil) and (v<>null) then begin
        FDoc['SIGN_ORG'].AsString:=GetValueFieldEx(arrRec, 'ID', '');
      end;
    finally

    end;
  end;
end;

procedure TfmEdIn.deRegIndEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  s,sGrup,sInd:string;
begin
// subj_id  =  Spr:=SprList.AddItem('SP_FILELIST', 'SprDocFileList', 'sp', 'Номенклатура дел', 'Номенклатура дел', '', 'CODE', '', 'ID', 'NAME', 'ID', [bsSpr, {тест}bsTree]);
// group_id =  Spr:=SprList.AddItem('SP_DOCGROUP', 'SprDocGroup', 'sp', 'Группы документов', 'Группы документов', '', 'N_ORDER', '', 'ID', 'NAME', 'ID', [bsSpr, bsPickList, bsOrder, bsTree]);
//FDoc.DBItem.FieldList.ByName('GROUP_ID').LinkSpr.FindTable()
  FDoc.DBItem.EditTable.CheckBrowseMode;
  FDoc.DBItem.EditTable.Edit;
  if (FDoc['REG_IND'].AsString='') or Problem('Сформировать индекс повторно ?') then begin
    s:=FDoc.GetRegInd(FDoc.DocType,FDoc['GROUP_ID'].AsInteger,'VXOD_NOMER',false);
    if s<>'' then
      FDoc['REG_IND'].AsString:=s;
  end;
  {
  if FFormula<>'' then begin
    FDoc.DBItem.EditTable.CheckBrowseMode;
    FDoc.DBItem.EditTable.Edit;
    if (FDoc['REG_IND'].AsString='') or Problem('Сформировать индекс повторно ?') then begin
      if (FDoc['GROUP_ID'].AsString<>'') and dmBase.SprDocGroup.Locate('ID', FDoc['GROUP_ID'].AsString, [])
        then sGrup:=dmBase.SprDocGroup.FieldByName('IND').AsString
        else sGrup:='?';
      if (FDoc['FILE_ID'].AsString<>'') and dmBase.SprDocFileList.Locate('ID', FDoc['FILE_ID'].AsString, [])
        then sInd:=dmBase.SprDocFileList.FieldByName('FILE_IND').AsString
        else sInd:='?';
      s:=FFormula;
      s:=StringReplace(s,'%инд',sInd,[rfReplaceAll,rfIgnoreCase]);
      s:=StringReplace(s,'%гр',sGrup,[rfReplaceAll,rfIgnoreCase]);
      s:=StringReplace(s,'%год',IntToStr(YearOf(Date)),[rfReplaceAll,rfIgnoreCase]);
      s:=StringReplace(s,'%кон',GlobalTask.ParamAsString('CONST_IND'),[rfReplaceAll,rfIgnoreCase]);
      s:=StringReplace(s,'%номер',FDoc['REG_NUM'].AsString,[rfReplaceAll,rfIgnoreCase]);
      FDoc['REG_IND'].AsString:=s;
//      FDoc.DBItem.EditTable.Post;
    end;
  end;
  }
end;

procedure TfmEdIn.deRegIndDblClick(Sender: TObject);
var
  l:Boolean;
begin
  deRegIndEditButtons0Click(nil,l);
end;


end.

