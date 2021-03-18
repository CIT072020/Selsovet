unit fEdOut;

interface
{$I Task.inc}

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, Grids, DBGridEh, ExtCtrls, ImgList, ActnList, ToolWin,
   ShellApi, DB, DBCtrlsEh, DBLookupEh, StdCtrls, Mask,
   OpisEdit, MetaTask, dbFunc, FuncPr, uProject,
   {$IFDEF REGDOC_SIGN}
   uAvest,
   {$ENDIF}
   uProjectAll,
   AdsTable, adsdata, adsfunc,
   mAdsObj, mDRecInt, fSprEdit, dDocImg, Menus, ZipForge, Buttons,
  vchDBCtrls;

type
   TfmEdOut=class(TForm)
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
      deSignName: TDBEditEh;
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
      laResMan: TLabel;
      laExecMan: TLabel;
      laSubjId: TLabel;
      dlSubjId: TDBLookupComboboxEh;
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
      dcResMan: TDBComboBoxEh;
      dcExecMan: TDBComboBoxEh;
      laExecDate: TLabel;
      deExecDate: TDBDateTimeEditEh;
      laSignName: TLabel;
      dcGroupId: TDBComboBoxEh;
      pmWord: TPopupMenu;
      tbWord: TToolButton;
      tbSep2: TToolButton;
    imSMDO: TImage;
    deSignOrgs: TDBEditEh;
    DBEditEh1: TDBEditEh;
    tbSignOrgs: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    acEditSignOrgs: TAction;
    acClearSignOrgs: TAction;
    tbAddSignAll: TToolButton;
    acAddSign: TAction;
    laDeloDate: TLabel;
    deDeloDate: TDBDateTimeEditEh;
    Label1: TLabel;
    dcCreateMan: TDBComboBoxEh;
    Zip: TZipForge;
    pnFileID: TPanel;
    lbFileID: TvchDBText;
    sbFileID: TSpeedButton;
    sbFileID2: TSpeedButton;
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
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure acEditSignOrgsExecute(Sender: TObject);
    procedure acClearSignOrgsExecute(Sender: TObject);
    procedure deReqIndEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure deReqIndEditButtons1Click(Sender: TObject;     var Handled: Boolean);
    procedure dlSignOrgEditButtons1Click(Sender: TObject;     var Handled: Boolean);
    procedure acAddSignExecute(Sender: TObject);
    procedure deRegIndEditButtons0Click(Sender: TObject;       var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;      Shift: TShiftState);
    procedure deRegIndDblClick(Sender: TObject);
    procedure dcCreateManEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure deCheckManEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure dcExecManEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure dcResManEditButtons0Click(Sender: TObject;       var Handled: Boolean);
    procedure lbFileIDClick(Sender: TObject);
    procedure lbFileIDGetText(Sender: TObject; var Text: String);
    procedure sbFileIDClick(Sender: TObject);
    procedure sbFileID2Click(Sender: TObject);
   private
      FDoc: TOutgoingDoc;
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
      procedure CheckReadOnlyReq;
      procedure SignAllFiles;

      procedure ResetControl;
      // устнановить/очистить/вызвать события, привязанные к управляющим элементам
      procedure SetControlEvent;
      procedure ClearControlEvent;
      procedure InvokeControlEvent;
      // изменить доступность операций
      procedure UpdateEnabledAction;
      // изменить позицию управляющих элементов
      procedure SetControlPosition;
      // добавить файлы из входящего
      procedure AddFileFromIn(nDocID : Integer);
      function Event_ONViewREcord(Sender: TDBItem;  ViewMode: TViewMode): Boolean;


   public
      property Doc: TOutgoingDoc read FDoc write FDoc;
   end;

implementation

uses dBase, fChoiceNomen;

{$R *.dfm}

procedure TfmEdOut.FormCreate(Sender: TObject);
var
   Column: TListColumn;
begin
   {$IFDEF REGDOC_SIGN}
     acAddSign.Visible:=true;
   {$ELSE}
     acAddSign.Visible:=false;
   {$ENDIF}
   FDoc:=nil;

   FFormula:=Trim(GlobalTask.ParamAsString('ISXOD_NOMER'));

   DOC_FILE.Align:=alClient;
   lvDocFile.Align:=alClient;
   //настройка lvDocFile
   lvDocFile.ViewStyle:=vsIcon;
   Column:=lvDocFile.Columns.Add;
   Column.Caption:='Имя файла';
   Column:=lvDocFile.Columns.Add;
   Column.Caption:='Примечание (описание)';
end;

procedure TfmEdOut.acOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfmEdOut.acCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmEdOut.acFileAddExecute(Sender: TObject);
var
//  ds:TDataSet;
//  sB:String;
  lOk:Boolean;
begin
   if odFile.Execute and FileExists(odFile.FileName) then begin
     lOk:=true;
     {
     ds:=DOC_FILE.DataSource.DataSet;
     sB:=ds.Bookmark;
     ds.First;
     ds.DisableControls;
     lOk:=true;
     try
       while not ds.Eof do begin
         if SameText(ds.FieldByName('NAME').AsString, ExtractFileName(odFile.FileName)) then begin
           PutError('Файл с именем "'+ExtractFileName(odFile.FileName)+'" уже существует в списке!');
           lOk:=false;
         end;
         ds.Next;
       end;
     finally
       ds.Bookmark:=sB;
       ds.EnableControls;
     end;
     }
     if lOk then begin
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
end;

procedure TfmEdOut.acFileDeleteExecute(Sender: TObject);
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

procedure TfmEdOut.acFileEditExecute(Sender: TObject);
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

procedure TfmEdOut.acFileViewExecute(Sender: TObject);
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

//---------------------------------------------------------------
procedure TfmEdOut.SignAllFiles;
{$IFDEF REGDOC_SIGN}
var
  sBook, sDolg, sFile, sErr, sFIO, sOrg, sDate, sSign,sInfo:String;
  dSign:TDateTime;
  res:DWORD;
  i:Integer;
  CurKeyBoard:LongWord;
  slFiles,slSign,sl:TStringList;
  tbFiles:TDataSet;
begin
  sSign:='';
  sInfo:='';
  sFio:='';
  sDolg:='';
  Avest.FDeleteCRLF:=true;      // в ЭЦП будем удалять CRLF
  CurKeyBoard:=GetTypeKeyBoard;
  ActivateENGKeyboard;

  slSign:=TStringList.Create;
  slFiles:=TStringList.Create;

  tbFiles:=FDoc.DocFile.DBItem.EditTable;
  sBook:=tbFiles.Bookmark;
  tbFiles.First;
  while not tbFiles.Eof do begin
    sFile:=FDoc.DocFile.ExtractFile(sErr);
    if (sFile<>'') then begin
      slFiles.Add(sFile);
    end;
    tbFiles.Next;
  end;
//  tbFiles.First;
  if slFiles.Count>0 then begin
    res:=Avest.SMDOSign(slFiles,slSign);
    if res=0 then begin
      sl:=TStringList.Create;
      sl.Add(slSign.Strings[0]);
      sFile:=ReadFileToString(slFiles.Strings[0], sErr);
      res:=Avest.SMDOVerify(sFile, sl, false, CHECK_CERT_DEFAULT);
      if res=0 then begin
        sDolg:=Avest.GetAttrSign(0,'dolg');
        sFIO:=Avest.GetAttrSign(0,'fio');
        sDate:=Avest.GetAttrSign(0,'signdate');
        sOrg:=Avest.GetAttrSign(0,'org');
        sInfo:=Trim(sDolg+' '+sFIO)+', '+sDate+', '+sOrg;
      end;
      sl.Clear;
      if (sInfo<>'') then begin
        tbFiles.First;
        i:=0;
        if Pos(sFIO, tbFiles.FieldByName('SIGNINFO').AsString)=0 then begin
          while not tbFiles.Eof do begin
            if (tbFiles.FieldByName('NAME').AsString<>'') then begin
              EditDataSet(tbFiles);
              tbFiles.FieldByName('SIGNATURE').AsString:=tbFiles.FieldByName('SIGNATURE').AsString+slSign.Strings[i]+chr(13)+chr(10);
              tbFiles.FieldByName('SIGNINFO').AsString:=tbFiles.FieldByName('SIGNINFO').AsString+sInfo+chr(13)+chr(10);
              PostDataSet(tbFiles);
              Inc(i,1);
            end;
            tbFiles.Next;
          end;
          tbFiles.First;
        end else begin
          PutError(sFIO+' уже подписал файл',self);
        end;
      end;
      sl.Free;
    end else begin
      PutError(Avest.ErrorInfo(res));
    end;
  end;
  tbFiles.Bookmark:=sBook;
  FDoc.DocFile.deleteTempPath;
  slSign.Free;
  slFiles.Free;
  if CurKeyBoard>0 then
    ActivateKeyboardLayout(CurKeyBoard,KLF_ACTIVATE);
end;
{$ELSE}
begin
end;
{$ENDIF}

procedure TfmEdOut.acFileViewListExecute(Sender: TObject);
begin
   SetFileView(not FIsTableView);
end;

procedure TfmEdOut.lvDocFileChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
   UpdateEnabledAction;
end;

procedure TfmEdOut.lvDocFileDblClick(Sender: TObject);
begin
   acFileViewExecute(nil);
end;

procedure TfmEdOut.AddFileToListView;
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

procedure TfmEdOut.SetFileView(IsTable: Boolean);
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

procedure TfmEdOut.ClearControlEvent;
begin

end;

procedure TfmEdOut.InvokeControlEvent;
begin
   SetFileView(False);
   //вызывать события для установки текущих значений реквизитов:
   // "В дело"
   chbInFileClick(nil);
   // "Снято с контроля или выполнено"
   chbCheckOutClick(nil);
end;

procedure TfmEdOut.OnAfterScroll(DataSet: TDataSet);
begin
   if DataSet.State=dsBrowse then begin
      UpdateEnabledAction;
   end;
end;

procedure TfmEdOut.ResetControl;
begin
   FDoc.FileItem.EditTable.AfterScroll:=nil;
end;

procedure TfmEdOut.CheckReadOnlyReq;
var
  c:TColor;
  l:Boolean;
begin
  if FDoc['POST_ID'].AsInteger>0 then begin
    l:=true;
    c:=clInfoBk;
  end else begin
    l:=false;
    c:=clWindow;
  end;
  deReqInd.Color:=c;
  deReqInd.ReadOnly:=l;
  deReqDate.Color:=c;
  deReqDate.ReadOnly:=l;
  imSMDO.Visible:=FDoc['POST_ID'].AsInteger>0;
end;

procedure TfmEdOut.SetControl;
begin
   // установка режима просмотр/редактирование/добавление
   if FDoc.ViewMode=vmView then begin
      Caption:=Caption+' [ПРОСМОТР]';
   end;
   acOk.Enabled:=FDoc.ViewMode<>vmView;
   {--dlGroupId.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;}
   dcGroupId.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;
   //настройка списка групп документов
   //NB: !!! ИСПРАВИТЬ !!! что бы через DBAwareList проходило и не было !!! ПОВТОРА !!!
   FDoc.QueryStringLists(
      'select ID, %s from SprDocGroup '+
      'where KIND=%d and IS_NODE=%d',
      [FDoc.DBItem.FieldList.ByName('GROUP_ID').LinkSpr.NameFieldName, gkOutgoing, iLeaf],
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


   CheckReadOnlyReq;

   deSignOrgs.Color:=clInfoBk;
   deSignOrgs.ReadOnly:=true;
 //??? может назначить свой выбор    dlSignOrg.EditButtons[0].OnClick:=dlSignOrgEditButtons0Click;

   dcResMan.EditButtons[0].OnClick:=dcResManEditButtons0Click;
   dcExecMan.EditButtons[0].OnClick:=dcExecManEditButtons0Click;
   deCheckMan.EditButtons[0].OnClick:=deCheckManEditButtons0Click;
   dcCreateMan.EditButtons[0].OnClick:=dcCreateManEditButtons0Click;

   dlSignOrg.EditButtons[0].Visible:=false; // стандартный выбор от Димы
   if FFormula=''
     then deRegInd.EditButtons[0].Visible:=false
     else deRegInd.Hint:=FFormula;

   lbFileID.DataSource:=dlFileId.DataSource;
   lbFileID.DataField:='FILE_ID';
end;

procedure TfmEdOut.SetControlEvent;
begin

end;

procedure TfmEdOut.SetControlPosition;
begin
   tbaDocFile.Top:=paDocFile.Top;
   tbaDocFile.Left:=paDocFile.Left+paDocFile.Width+7;
   tbSignOrgs.Top:=deSignOrgs.Top;
   tbSignOrgs.Left:=deSignOrgs.Left+deSignOrgs.Width+7;
end;

procedure TfmEdOut.UpdateEnabledAction;
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
   acAddSign.Enabled:=((FDoc.DocFile.DBItem.EditTable.RecordCount>0) and (FDoc.ViewMode<>vmView));  //  vadim 09.07.2019
end;

procedure TfmEdOut.chbInFileClick(Sender: TObject);
begin
   laFileId.Enabled:=chbInFile.Checked;
   dlFileId.Enabled:=chbInFile.Checked;
   laDeloDate.Enabled:=chbInFile.Checked;
   deDeloDate.Enabled:=chbInFile.Checked;

   sbFileID.Enabled:=chbInFile.Checked;
   sbFileID2.Enabled:=chbInFile.Checked;
   pnFileID.Enabled:=chbInFile.Checked;
   lbFileID.Enabled:=chbInFile.Checked;
   //laFileVol.Enabled:=chbInFile.Checked;
   //deFileVol.Enabled:=chbInFile.Checked;
   //laFileList.Enabled:=chbInFile.Checked;
   //deFileList.Enabled:=chbInFile.Checked;
end;

procedure TfmEdOut.chbCheckOutClick(Sender: TObject);
begin
   laCheckDate.Enabled:=chbCheckOut.Checked;
   deCheckDate.Enabled:=chbCheckOut.Checked;
   laCheckMan.Enabled:=chbCheckOut.Checked;
   deCheckMan.Enabled:=chbCheckOut.Checked;
end;

procedure TfmEdOut.dcGroupIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
   FDoc.SelectGroup;
end;

procedure TfmEdOut.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:=FDoc.OnFormCloseQuery(FDoc.DBItem);
end;

procedure TfmEdOut.acWordExecute(Sender: TObject);
begin
//
end;

procedure TfmEdOut.FormActivate(Sender: TObject);
begin
  imSMDO.Visible:=FDoc['POST_ID'].AsInteger>0;
end;

//--------------------------------------------------------------------
procedure TfmEdOut.Button1Click(Sender: TObject);
begin
end;
//--------------------------------------------------------------------
procedure TfmEdOut.dlSignOrgEditButtons1Click(Sender: TObject;  var Handled: Boolean);
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
//--------------------------------------------------------------------
procedure TfmEdOut.acEditSignOrgsExecute(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  sl:TstringList;
  s,sOrg,sName:String;
  i,n:Integer;
begin
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRWORK_MULTI');
  if Opis<>nil then begin
//    v:=null;
    if FDoc['IDEN_DATE'].AsString=''
      then v:=null
      else v:=FDoc['IDEN_DATE'].AsString;
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      if (v<>null) and (VartoStr(v)<>'') then begin
        s:=VarToStr(v);
        if s<>'' then begin
          sl:=TStringList.Create;
          StrToStrings(s,sl,#13#10,true);
          n:=100;  // максимальный размер
          if sl.Count>n then begin
            while sl.Count>n do sl.Delete(n);
          end;
          sOrg:='';
          sName:='';
          for i:=0 to sl.Count-1 do begin
            if dmBase.SprWork.Locate('ID',sl.Strings[i],[]) then begin
              s:=dmBase.SprWork.FieldByName('NAME').AsString;
              if s='' then dmBase.SprWork.FieldByName('FNAME').AsString;
              sOrg:=sOrg+sl.Strings[i]+',';
              sName:=sName+s+',';
            end;
          end;
          FDoc['IDEN_DATE'].AsString:=Copy(sOrg,1,Length(sOrg)-1);
          FDoc['IDEN_TEXT'].AsString:=Copy(sName,1,Length(sName)-1);
          sl.Free;
        end;
      end;
    end;
  end;
end;
//----------------------------------------------------------------
procedure TfmEdOut.acClearSignOrgsExecute(Sender: TObject);
begin
  if (FDoc['IDEN_TEXT'].AsString<>'') and Problem('Очистить список корреспондентов ?') then begin
    FDoc['IDEN_DATE'].AsString:='';
    FDoc['IDEN_TEXT'].AsString:='';
  end;
end;

procedure TfmEdOut.deReqIndEditButtons0Click(Sender: TObject; var Handled: Boolean);
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
            if Bookmark.Count=1 then begin
               Query.Bookmark:=Bookmark[0];
               FDoc['POST_ID'].AsInteger:=Query.FieldByName('POST_ID').AsInteger;
               FDoc['REQ_IND'].AsString:=Query.FieldByName('DOC_IND').AsString;
               WriteDateFieldV(FDoc['REQ_DATE'],Query.FieldByName('DOC_DATE').Value);
               if FDoc['SIGN_ORG'].AsInteger=0
                 then FDoc['SIGN_ORG'].AsString:=Query.FieldByName('SIGN_ORG').AsString;
               AddFileFromIn(Query.FieldByName('DOC_ID').AsInteger);
               CheckReadOnlyReq;
            end;
         finally
            Query.Free;
         end;
      end;
   finally
      Bookmark.Free;
   end;
end;
//-----------------------------------------------------------------------
procedure TfmEdOut.AddFileFromIn(nDocID : Integer);
var
  oldST, sErr, sTmpDir, sFileName, sFileArx:String;
  old:TViewRecordEvent;
  dsFile:TDataSet;
  lCopy:Boolean;
begin
  sTmpDir:=CheckSleshN(CreateTmpPath(0));
  with dmBase.DocFile do begin
    try
      old:=FDoc.DocFile.DBItem.OnViewRecord;
      oldST:=GlobalTask.ParamAsString('DR_STORE_KIND');
      FDoc.DocFile.DBItem.OnViewRecord:=Event_ONViewRecord;
      GlobalTask.WriteParamAsString('DR_STORE_KIND',IntToStr(stInFolder));  //в специальной папке

      IndexName:='PR_KEY';
      SetRange([nDocID],[nDocID]);
      lCopy:=false;
      if not Eof then begin
        if Problem('Скопировать прикрепленные файлы ?') then begin
          lCopy:=true;
        end;
      end;
      if lCopy then begin
        while not Eof do begin
          sFileName:='';
          if FieldByName('STORE_KIND').AsInteger=stInFolder then begin
            sFileArx:=GetDocArxivFolder(sErr,0)+FieldByName('DIR_YEAR').AsString+'\'+FieldByName('DIR_MONTH').AsString+'\'+FieldByName('DIR_NAME').AsString;
            if FileExists(sFileArx) then begin
              try
                Zip.FileName:=sFileArx;
                Zip.BaseDir:=sTmpDir;
                Zip.OpenArchive;
                Zip.ExtractFiles(FieldByName('NAME').AsString);
                sFileName:=sTmpDir+FieldByName('NAME').AsString;
              finally
                Zip.CloseArchive;
              end;
            end else begin
              PutError('Файл '+FieldByName('NAME').AsString+'('+sFileArx+') не найден в специальной папаке.',Self);
            end;
          end else begin
            sFileName:=NormDir(ChecksleshN(FieldByName('PATH').AsString)+FieldByName('NAME').AsString);
          end;                               
          if sFileName<>'' then begin
            if FileExists(sFileName) then begin
              //-- ADD FILE --------------------
              FDoc.DocFile.FileName:=sFileName;
              FDoc.DocFile.DetailAdd;
              dsFile:=FDoc.DocFile.DBItem.EditTable;
              dsFile.CheckBrowseMode;
              dsFile.Edit;
              dsFile.FieldByName('SIGNATURE').AsString:=FieldByName('SIGNATURE').AsString;
              dsFile.FieldByName('SIGNINFO').AsString:=FieldByName('SIGNINFO').AsString;
              dsFile.Post;
              AddFileToListView;
              //--------------------------------
            end else begin
              PutError('Файл '+sFileName+' не найден в исходящих документах.',Self);
            end;
          end;
          Next;
        end;
      end;
    finally
      CancelRange;
      FDoc.DocFile.DBItem.OnViewRecord:=old;
      GlobalTask.WriteParamAsString('DR_STORE_KIND',oldST);
    end;
  end;
end;
function TfmEdOut.Event_ONViewRecord(Sender: TDBItem;  ViewMode: TViewMode): Boolean;
begin
  Result:=true;
end;
//--------------------------------------------------------------------------------------
procedure TfmEdOut.deReqIndEditButtons1Click(Sender: TObject;  var Handled: Boolean);
var
  lOk:Boolean;
begin
  if FDoc['POST_ID'].AsInteger>0
    then lOk:=Problem('К реквизиту "Ответ на" прикреплено сообщение СМДО. Вы уверены ?')
    else lOk:=true;
  if lOk then begin
    FDoc['POST_ID'].AsInteger:=0;
    FDoc['REQ_IND'].AsString:='';
    FDoc['REQ_DATE'].AsString:='';
    CheckReadOnlyReq;
  end;
end;

procedure TfmEdOut.acAddSignExecute(Sender: TObject);
begin
  SignAllFiles;
end;

procedure TfmEdOut.deRegIndEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  s,sGrup,sInd:string;
begin
  if FFormula<>'' then begin
    FDoc.DBItem.EditTable.CheckBrowseMode;
    FDoc.DBItem.EditTable.Edit;
    if (FDoc['REG_IND'].AsString='') or Problem('Сформировать индекс повторно ?') then begin
      s:=FDoc.GetRegInd(FDoc.DocType,FDoc['GROUP_ID'].AsInteger,'ISXOD_NOMER',false);
      if s<>'' then
        FDoc['REG_IND'].AsString:=s;
    end;
  end;
end;

procedure TfmEdOut.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
  l:Boolean;
begin
  if ((Key=VK_ADD) or (Key=187)) and (Shift=[ssCtrl]) then begin
    if FFormula<>'' then begin
      Key:=0;
      deRegIndEditButtons0Click(nil,l);
    end;
  end;
end;

procedure TfmEdOut.deRegIndDblClick(Sender: TObject);
var
  l:Boolean;
begin
  deRegIndEditButtons0Click(nil,l);
end;

procedure TfmEdOut.dcCreateManEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(dcCreateMan);
  if nID>0 then FDoc['VISIT_MAN'].AsInteger:=nID;
end;

procedure TfmEdOut.deCheckManEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(deCheckMan);
  if nID>0 then FDoc['CHECK_MAN'].AsInteger:=nID;
end;

procedure TfmEdOut.dcExecManEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(dcExecMan);
  if nID>0 then FDoc['Exec_MAN'].AsInteger:=nID;
end;

procedure TfmEdOut.dcResManEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  nID:Integer;
begin
  nID:=ChoiceSpecID(dcResMan);
  if nID>0 then FDoc['Res_MAN'].AsInteger:=nID;
end;

procedure TfmEdOut.lbFileIDGetText(Sender: TObject; var Text: String);
var
  n:Integer;
  d1,d2:TDateTime;
  s:String;
  c:TColor;
begin
  c:=clWindowText;
  if dmBase.SprDocFileList.Locate('ID', FDoc['FILE_ID'].AsInteger, []) then begin
    Text:=dmBase.SprDocFileList.FieldByName('FILE_IND').AsString;
    lbFileID.Hint:=dmBase.SprDocFileList.FieldByName('NAME').AsString;
    n:=dmBase.GetDateDelo(1, dmBase.SprDocFileList.FieldByName('ID').AsInteger, d1, d2, s);
    if (n>0) and (d2>0) then begin
      Text:=Text+s;
      c:=clRed;
      lbFileID.Font.Color:=clRed;
    end;
  end else begin
    Text:='';
  end;
  if lbFileID.Font.Color<>c
    then lbFileID.Font.Color:=c;
end;

procedure TfmEdOut.sbFileIDClick(Sender: TObject);
var
  fi:TFieldItem;
  KeyValue:String;
begin
   fi:=FDoc.DBItem.FieldList.ByName('FILE_ID');
   if fi<>nil then begin
     KeyValue:=FDoc['FILE_ID'].AsString;
     if SelectSprValue(fi.LinkSpr, KeyValue, fi.LinkSpr.CodeFieldName) then begin
       FDoc.DBItem.EditTable.CheckBrowseMode;
       FDoc.DBItem.EditTable.Edit;
       FDoc['FILE_ID'].AsString:=KeyValue;
     end;
   end;
end;

procedure TfmEdOut.sbFileID2Click(Sender: TObject);
var
  n:Integer;
begin
  n:=ChoiceNomen(1,true,false,'');
  if n>0 then begin
    FDoc.DBItem.EditTable.CheckBrowseMode;
    FDoc.DBItem.EditTable.Edit;
    FDoc['FILE_ID'].AsInteger:=n;
  end;
end;

procedure TfmEdOut.lbFileIDClick(Sender: TObject);
begin
  sbFileID2Click(nil);
end;


end.
