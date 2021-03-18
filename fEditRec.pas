unit fEditRec; //форма просмотра и редактирования РКК обращений граждан

interface

{$I Task.inc}

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Menus,
   Dialogs, mAdsObj, StdCtrls, Mask, DBCtrlsEh, ComCtrls, ToolWin, ImgList, DB,
   ActnList, ExtCtrls, Grids, DBGridEh, fSprEdit, DBLookupEh, mDoc2Sel, mDRecInt,
   fEdRept, AdsTable, mFindInt, ToolCtrlsEh, dDocImg, Buttons, vchDBCtrls;

type
   // Редактирование реквизитов РКК
   TfmEditRec=class(TForm)
      tbaEditRec: TToolBar;
      tbCancel: TToolButton;
      tbOk: TToolButton;
      tbSep1: TToolButton;
      pcDoc: TPageControl;
      tsPage1: TTabSheet;
      tsPage2: TTabSheet;
      laRegDate: TLabel;
      bv01: TBevel;
      laGroup01: TLabel;
      laRegNum: TLabel;
      laRegInd: TLabel;
      laAppForm: TLabel;
      bv02: TBevel;
      laGroup02: TLabel;
      laSignType: TLabel;
      laSignName: TLabel;
      laAdrText: TLabel;
      laSignGroup: TLabel;
      laAdrPhone: TLabel;
      laAdrNote: TLabel;
      bv03: TBevel;
      laGroup03: TLabel;
      laAppKind: TLabel;
      laNumList: TLabel;
      laContent: TLabel;
      laNumApp: TLabel;
      laSubjId: TLabel;
      laIsRepeat: TLabel;
      laRepeatText: TLabel;
      laGroup04: TLabel;
      deRegDate: TDBDateTimeEditEh;
      deRegNum: TDBNumberEditEh;
      deRegInd: TDBEditEh;
      dcAppForm: TDBComboBoxEh;
      dcSignType: TDBComboBoxEh;
      deSignName: TDBEditEh;
      dcSignGroup: TDBComboBoxEh;
      deAdrText: TDBEditEh;
      deAdrPhone: TDBEditEh;
      deAdrNote: TDBEditEh;
      dcAppKind: TDBComboBoxEh;
      deContent: TDBEditEh;
      chbIsRepeat: TDBCheckBoxEh;
      deRepeatText: TDBEditEh;
      alEditRec: TActionList;
      acOk: TAction;
      acCancel: TAction;
      bv04: TBevel;
      laCoverCorr: TLabel;
      laCoverType: TLabel;
      laCoverText: TLabel;
      laCoverDate: TLabel;
      laCoverInd: TLabel;
      laReqAns: TLabel;
      laReqTerm: TLabel;
      laReqDate: TLabel;
      laReqInd: TLabel;
      laReqText: TLabel;
      dcCoverType: TDBComboBoxEh;
      deCoverText: TDBEditEh;
      deCoverInd: TDBEditEh;
      deCoverDate: TDBDateTimeEditEh;
      chbReqAns: TDBCheckBoxEh;
      deReqTerm: TDBDateTimeEditEh;
      deReqDate: TDBDateTimeEditEh;
      deReqInd: TDBEditEh;
      deReqText: TDBEditEh;
      bv05: TBevel;
      laGroup05: TLabel;
      laResText: TLabel;
      laResMan: TLabel;
      laResDate: TLabel;
      laExecMan: TLabel;
      laExecOrg: TLabel;
      laExecDate: TLabel;
      laExecTerm: TLabel;
      laExecFact: TLabel;
      bv07: TBevel;
      laGroup07: TLabel;
      laAnsKind: TLabel;
      laAnsDate: TLabel;
      laAnsText: TLabel;
      laAnsInd: TLabel;
      deResText: TDBEditEh;
      deResDate: TDBDateTimeEditEh;
      dcResMan: TDBComboBoxEh;
      dcExecMan: TDBComboBoxEh;
      deExecDate: TDBDateTimeEditEh;
      deExecTerm: TDBDateTimeEditEh;
      deExecFact: TDBDateTimeEditEh;
      dcAnsKind: TDBComboBoxEh;
      deAnsText: TDBEditEh;
      deAnsInd: TDBEditEh;
      deAnsDate: TDBDateTimeEditEh;
    bv04_1: TBevel;
      laGroup04_1: TLabel;
      laVisitOut: TLabel;
      laVisitChief: TLabel;
      laVisit: TLabel;
      laVisitMan: TLabel;
      dcVisitMan: TDBComboBoxEh;
      deRegDate2: TDBDateTimeEditEh;
      chbVisitChief: TDBCheckBoxEh;
      chbVisitOut: TDBCheckBoxEh;
      bv06: TBevel;
      laGroup06: TLabel;
      DOC_WORK: TDBGridEh;
      laGroup08: TLabel;
      laCheckOut: TLabel;
      laCheckDate: TLabel;
      laCheckMan: TLabel;
      chbCheckOut: TDBCheckBoxEh;
      deCheckDate: TDBDateTimeEditEh;
      deCheckMan: TDBComboBoxEh;
      bv09: TBevel;
      laGroup09: TLabel;
      laInFile: TLabel;
      laFileId: TLabel;
      laFileVol: TLabel;
      laFileList: TLabel;
      chbInFile: TDBCheckBoxEh;
      deFileList: TDBNumberEditEh;
      deFileVol: TDBNumberEditEh;
      dlFileId: TDBLookupComboboxEh;
      dlExecOrg: TDBLookupComboboxEh;
      dlCoverCorr: TDBLookupComboboxEh;
      dlSignPlace: TDBLookupComboboxEh;
      laSignPlace: TLabel;
      tbaDocWork: TToolBar;
      tbWorkAdd: TToolButton;
      tbWorkDel: TToolButton;
      tbWorkEdit: TToolButton;
      tbWorkUp: TToolButton;
      tbWorkDown: TToolButton;
      acWorkAdd: TAction;
      acWorkDel: TAction;
      acWorkEdit: TAction;
      acWorkUp: TAction;
      acWorkDown: TAction;
      dlSubjId: TDBLookupComboboxEh;
      bv08: TBevel;
      tbPreview: TToolButton;
      tbSep2: TToolButton;
      tbPrint: TToolButton;
      tbWord: TToolButton;
      acPreview: TAction;
      acPrint: TAction;
      acWord: TAction;
      pmWord: TPopupMenu;
      laOrderText: TLabel;
      deOrderText: TDBEditEh;
      laOrderOrg: TLabel;
      dlOrderOrg: TDBLookupComboboxEh;
      laOrderDate: TLabel;
      deOrderDate: TDBDateTimeEditEh;
      laOrderTerm: TLabel;
      deOrderTerm: TDBDateTimeEditEh;
      laOrderFact: TLabel;
      deOrderFact: TDBDateTimeEditEh;
      laSignCount: TLabel;
      laSubjCount: TLabel;
      deNumApp: TDBEditEh;
      deNumList: TDBEditEh;
      deVisitTime: TDBDateTimeEditEh;
      laFromVisit: TLabel;
      chbFromVisit: TDBCheckBoxEh;
      tsWork: TTabSheet;
      dcFolderId: TDBComboBoxEh;
      laFolderId: TLabel;
      bvBottom: TBevel;
      deSignNum: TDBNumberEditEh;
      laSignNum: TLabel;
      laSignKind: TLabel;
      dcSignKind: TDBComboBoxEh;
      laReqCheck: TLabel;
      laGroupId: TLabel;
      dlGroupId: TDBLookupComboboxEh;
      dcReqCheck: TDBComboBoxEh;
      chbAdrIn: TDBCheckBoxEh;
      tbaSignType: TToolBar;
      tbSignType: TToolButton;
      deAdrPlace: TDBEditEh;
      dcGroupId: TDBComboBoxEh;
      laRepeatCount: TLabel;
    Label1: TLabel;
    deExecTerm2: TDBDateTimeEditEh;
    Label2: TLabel;
    deAnsVisit: TDBEditEh;
    laGroup04_2: TLabel;
    bv04_2: TBevel;
    dcVisitManE: TDBComboBoxEh;
    laVisitManE: TLabel;
    laVisitE: TLabel;
    deRegDate2E: TDBDateTimeEditEh;
    deVisitTimeE: TDBDateTimeEditEh;
    Label3: TLabel;
    edIdenDate: TDBEditEh;
    Label4: TLabel;
    Label5: TLabel;
    edIdenText: TDBEditEh;
    acFileAdd: TAction;
    acFileDelete: TAction;
    acFileEdit: TAction;
    acFileView: TAction;
    acFileViewList: TAction;
    odFile: TOpenDialog;
    paDocFile: TPanel;
    DOC_FILE: TDBGridEh;
    lvDocFile: TListView;
    tbaDocFile: TToolBar;
    tbFileAdd: TToolButton;
    tbFileDelete: TToolButton;
    tbFileEdit: TToolButton;
    tbFileView: TToolButton;
    tbFileViewList: TToolButton;
    imDocFile: TImageList;
    Label6: TLabel;
    Bevel1: TBevel;
    laTelLine: TLabel;
    chbTelLine: TDBCheckBoxEh;
    dlSubjIdG: TDBLookupComboboxEh;
    laDeloDate: TLabel;
    deDeloDate: TDBDateTimeEditEh;
    pnFileID: TPanel;
    lbFileID: TvchDBText;
    sbFileID: TSpeedButton;
    sbFileID2: TSpeedButton;
      //  события: создать/удалить форму
      procedure FormCreate(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      // события: изменение значение реквизитов
      procedure dcSignTypeUpdateData(Sender: TObject; var Handled: Boolean);
      procedure dlSubjIdUpdateData(Sender: TObject; var Handled: Boolean);
      procedure chbIsRepeatClick(Sender: TObject);
      procedure chbReqAnsClick(Sender: TObject);
      procedure chbCheckOutClick(Sender: TObject);
      procedure chbInFileClick(Sender: TObject);
      procedure dcAppFormChange(Sender: TObject);
      procedure dcSignTypeChange(Sender: TObject);
      procedure dlSignPlaceChange(Sender: TObject);
      // события: нажатия кнопок
      procedure deSignNameEditButtonClick(Sender: TObject; var Handled: Boolean);
      procedure deSignNameClearButtonClick(Sender: TObject; var Handled: Boolean);
      procedure deAdrTextEditButtonClick(Sender: TObject; var Handled: Boolean);
      procedure deAdrTextClearButtonClick(Sender: TObject; var Handled: Boolean);
      procedure deRepeatAddClick(Sender: TObject; var Handled: Boolean);
      procedure deRepeatEditClick(Sender: TObject; var Handled: Boolean);
      // события: действия
      procedure acOkExecute(Sender: TObject);
      procedure acCancelExecute(Sender: TObject);
      // события: кнопки "Ход рассмотрения"
      procedure acWorkAddExecute(Sender: TObject);
      procedure acWorkDelExecute(Sender: TObject);
      procedure acWorkEditExecute(Sender: TObject);
      procedure acWorkUpExecute(Sender: TObject);
      procedure acWorkDownExecute(Sender: TObject);
      procedure acWordExecute(Sender: TObject);
      procedure chbAdrInClick(Sender: TObject);
      procedure dcGroupIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
      procedure FormActivate(Sender: TObject);
    procedure acFileAddExecute(Sender: TObject);
    procedure acFileDeleteExecute(Sender: TObject);
    procedure acFileEditExecute(Sender: TObject);
    procedure acFileViewExecute(Sender: TObject);
    procedure acFileViewListExecute(Sender: TObject);
    procedure lvDocFileChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvDocFileDblClick(Sender: TObject);
    procedure lbFileIDClick(Sender: TObject);
    procedure sbFileIDClick(Sender: TObject);
    procedure lbFileIDGetText(Sender: TObject; var Text: String);
    procedure sbFileID2Click(Sender: TObject);
   private
      FDoc: TDocMain;
      FIsTableView: Boolean;
      // последнее значение реквизита "Вид подписи обращения"
      // в зависимости от значения этого реквизита определяется кого выбирать -
      // человека или организацию
      FSignType: Integer;
      FSignKind: Integer;
      // массивы управляющих элемнтов для отдельных групп реквизитов
      FGroup04Control: TControlArray;
      FGroup04_1Control: TControlArray;
      FGroup04_2Control: TControlArray;
   private
      procedure SetFileView(IsTable: Boolean);
      procedure AddFileToListView;
   private
      // изменить текущее значение реквизита "Вид подписи обращения"
      procedure SetSignType(SignType, SignKind: Integer);
      // изменить видимость полей при изменении значения реквизита "Форма поступления обращения"
      procedure SetAppForm(AppForm: Integer; FromVisit: Boolean; TelLine: Boolean);
      // изменилось значение поля "Адрес"
      procedure SetAdrId(AdrId: Integer);
      // изменилось значение поля "На территории исполкома"
      procedure SetAdrIn(AdrIn: Boolean);
      // автоматический поиск предыдущих обращений данного человека
      procedure SetSignCount(SignCount: Integer);
      procedure SetSubjCount(SubjCount: Integer);
      //--function AutoFindMan(DocId, SignMan: Integer; SignName: string; SubjId: Integer): Boolean;
      // автоматический поиск предыдущих обращений по данной организации
      //--function AutoFindOrg(DocId, SignOrg: Integer; SignName: string; SubjId: Integer): Boolean;
      // проверка: доступен список повторных (предыдущих) обращений
      function CheckRepeatList: Boolean;
      // установить количество повторных обращений
      procedure SetRepeatCount(SetText: Boolean=True);
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
      procedure SetTableSprDocSubj;
      // изменить доступность операций
      procedure UpdateEnabledAction;
      // изменить позицию управляющих элементов
      procedure SetControlPosition;
   public
      property Doc: TDocMain read FDoc write FDoc;
   end;

implementation
uses
   TypInfo, fEdWork, dBase, uProjectAll, fChoiceNomen;

{$R *.dfm}

procedure TfmEditRec.SetControl;
var
   Count: Integer;
begin
   // установка режима просмотр/редактирование/добавление
   if FDoc.ViewMode=vmView then begin
      Caption:=Caption+' [ПРОСМОТР]';
   end;
   acOk.Enabled:=FDoc.ViewMode<>vmView;
   deRepeatText.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;
   {--dlGroupId.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;}
   dcGroupId.EditButtons[0].Visible:=FDoc.ViewMode<>vmView;
   deRepeatText.EditButtons[1].Visible:=True;
   // построение пунктов меню
   FDoc.DBItem.BuildMenu(pmWord, mkWordTemplate, nil);
   // ход рассмотрения
   {--
   dgWork.DataSource:=FDoc.WorkItem.EditSource;
   if FDoc.WorkItem.TableView<>nil then begin
      //NB: !!!!!!!!!!!!!!!!!!!!!!! надо переделать !!!!!!!!!!!!!!!!!!!!!!!
      //    что бы клонировалось описание, но не надо было бы его сохранять
      if FDoc.ViewMode=vmView then begin
         FDoc.WorkItem.TableView.IncludeStyle(tsReadOnly);
      end
      else begin
         FDoc.WorkItem.TableView.ExcludeStyle(tsReadOnly);
      end;
      FDoc.WorkItem.TableView.SetColView(dgWork, FDoc.WorkItem.TableView.DefaultDrawCell, FDoc.OnGridButtonClick, True);
   end;
   --}
   FDoc.WorkItem.EditTable.AfterScroll:=OnAfterScroll;
   //обработка параметров
   //NB: ??? возможно в любом случае могут указываться индексы
   //        если предыдущее обращения было в предыдущем календарном году
   {--
   if not FDoc.RecInt.GetParPrintInd then begin
      laRepeatText.Caption:='Даты повторных обращений';
      laRepeatText.Left:=laRepeatText.Left+Canvas.TextWidth('индексы')
   end;
   --}
   //???
   deRegDate2.ReadOnly:=True;
   deRegDate2.Color:=FDoc.DBAware.ReadOnlyBg;
   //настройка списка групп документов
   //NB: !!! ИСПРАВИТЬ !!! что бы через DBAwareList проходило
   FDoc.QueryStringLists(
      'select ID, %s from SprDocGroup '+
      'where KIND=%d and IS_NODE=%d',
      [FDoc.DBItem.FieldList.ByName('GROUP_ID').LinkSpr.NameFieldName, gkPetition, iLeaf],
      dcGroupId.KeyItems,
      dcGroupId.Items
   );
   dcGroupId.DataField:='GROUP_ID';
   dcGroupId.DataSource:=FDoc.DBItem.EditSource;
   SetDropDownWidth(dcGroupId);
   //настройка списка наименований населенных пунктов
   deAdrPlace.MRUList.Active:=True;
   deAdrPlace.MRUList.Rows:=CMaxRow;
   FDoc.QueryStringList(
      'select distinct ADR_PLACE from DOCMAIN '+
      'where DOC_TYPE=%d and (SIGN_PLACE is null or SIGN_PLACE<0) and trim(ADR_PLACE)<>''''',
      [FDoc.DocType],
      deAdrPlace.MRUList.Items
   );
   //
   Count:=FDoc.RecInt.SprDBItems.ByName('SP_PLACE').Table.RecordCount;
   if Count<>0 then begin
      if Count>CMaxRow
         then dlSignPlace.DropDownBox.Rows:=CMaxRow
         else dlSignPlace.DropDownBox.Rows:=Count;
   end;
   
   lbFileID.DataSource:=dlFileId.DataSource;
   lbFileID.DataField:='FILE_ID';
end;

procedure TfmEditRec.ResetControl;
begin
   FDoc.WorkItem.EditTable.AfterScroll:=nil;
   //UpdateAndClearTableView(FDoc.WorkItem);
end;

procedure TfmEditRec.FormCreate(Sender: TObject);
var
   Column: TListColumn;
begin
   {$IFDEF POST}
     chbAdrIn.Visible:=false;
     laVisitChief.Caption:='Руководитель';
   {$ELSE}

   {$ENDIF}
   FDoc:=nil;
   FSignType:=0;
   FSignKind:=0;
   // Сопроводительное письмо/Поручение
   InitControlArray(FGroup04Control, [
      laGroup04, bv04, laCoverCorr, dlCoverCorr{--, laCorrType, dcCorrType}, laCoverDate,
      deCoverDate, laCoverInd, deCoverInd, laCoverText, deCoverText, laCoverType,
      dcCoverType, laReqAns, chbReqAns, laReqTerm, deReqTerm, laReqDate, deReqDate,
      laReqInd, deReqInd, laReqText, deReqText{--, laReqCheck, chbReqCheck}
   ]);
   SetControlVisible(FGroup04Control, False);
   // Отметка о личном приеме
   InitControlArray(FGroup04_1Control, [laGroup04_1, bv04_1, laVisitMan, dcVisitMan,
      {--laVisitDate, deVisitDate,} laVisitChief, chbVisitChief, laVisitOut, chbVisitOut,
      {--laVisitTime,} deVisitTime, laVisit, deRegDate2
   ]);
   SetControlVisible(FGroup04_1Control, False);
   // Отметка о приеме электронном     vadim 20.10.2016
   InitControlArray(FGroup04_2Control, [laGroup04_2, bv04_2, laVisitManE, dcVisitManE,
        deVisitTimeE, laVisitE, deRegDate2E
   ]);
   SetControlVisible(FGroup04_2Control, False);
   //
   tsWork.TabVisible:=False;
   bvBottom.Parent:=tsPage1;
   laFolderId.Parent:=tsPage1;
   dcFolderId.Parent:=tsPage1;
   laGroupId.Parent:=tsPage1;
   {--dlGroupId.Parent:=tsPage1;}
   dcGroupId.Parent:=tsPage1;
   //
   deAdrPlace.Left:=dlSignPlace.Left;
   deAdrPlace.Width:=dlSignPlace.Width;
   //
   pcDoc.ActivePage:=tsPage1;

//   Screen.OnActiveControlChange:=ActiveControlChanged;
   DOC_FILE.Align:=alClient;
   lvDocFile.Align:=alClient;
   //настройка lvDocFile
   lvDocFile.ViewStyle:=vsIcon;
   Column:=lvDocFile.Columns.Add;
   Column.Caption:='Имя файла';
   Column:=lvDocFile.Columns.Add;
   Column.Caption:='Примечание (описание)';
end;

procedure TfmEditRec.UpdateEnabledAction;
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

procedure TfmEditRec.acOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfmEditRec.acCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmEditRec.dcSignTypeUpdateData(Sender: TObject; var Handled: Boolean);
begin
   {--
   if dcSignType.ItemIndex<>-1 then begin
      SetSignType(StrToInt(dcSignType.KeyItems[dcSignType.ItemIndex]));
   end
   else begin
      SetSignType(-1);
   end;
   --}
end;

const
   DI_Citizen      =13; //гражданин
   DI_Organization =14; //организация

procedure TfmEditRec.SetSignType(SignType, SignKind: Integer);
var
   //--DBAware: TDBAware;
   SignMan: Integer;
   SignOrg: Integer;
   fChangeSign: Boolean;
begin
   fChangeSign:=((FSignType<>SignType) and (FSignType<>0)) or ((FSignKind<>SignKind) and (FSignKind<>0));
   FSignType:=SignType;    
   FSignKind:=SignKind;                    
   //
   laSignNum.Enabled:=SignType=stGroup;
   deSignNum.Enabled:=SignType=stGroup;
   //--DBAware:=FDoc.DBAware.ByControl(deSignName);
   SignMan:=FDoc['SIGN_MAN'].AsInteger;
   SignOrg:=FDoc['SIGN_ORG'].AsInteger;
   //NB: !!! переделать этот код !!!
   if (SignType<>0) and (SignKind<>0) then begin
      case SignType of
         // индивидуальное
         stIndividual,
         // коллективное
         stGroup{--,
         // индивидуальное: ИП
         skIP}: begin
            if SignKind=skUL then begin
               //--DBAware.SetReadOnly(False);
               tbSignType.ImageIndex:=DI_Organization;
//               tbaSignType.Visible:=SignOrg>0;
               deSignName.Enabled:=True;
               deSignName.Font.Style:=[fsBold];
               //deSignName.Font.Color:=clNavy;
               deSignName.EditButtons[0].Hint:='Выбрать заявителя из списка корреспондентов...';
               if SignOrg>0 then begin
                  deSignName.Font.Style:=[fsBold];
                  deSignName.ReadOnly:=True;
                  //deSignName.Font.Color:=clNavy;
                  //автоматический поиск предыдущих обращений по данной организации
                  //--AutoFindOrg(FDoc.GetDocId, SignOrg, '', FDoc['SUBJ_ID'].AsInteger);
               end
               else begin
                  deSignName.ReadOnly:=False;
                  deSignName.Font.Style:=[];
                  //--laSignCount.Visible:=False;
                  //--laSubjCount.Visible:=False;
               end;
               SetSignCount(FDoc.AutoCountSign(FSignType, FSignKind));
               SetSubjCount(FDoc.AutoCountSubj(FSignType, FSignKind));
               if fChangeSign and (SignMan>0) then begin
                  FDoc['SIGN_MAN'].AsInteger:=-1;
               end;
            end
            else begin
               //--DBAware.SetReadOnly(False);
             {$IFDEF OBR_GRAG_WITH_NASEL}
               tbSignType.ImageIndex:=DI_Citizen;
//               tbaSignType.Visible:=SignMan>0;
               deSignName.Enabled:=True;
               deSignName.EditButtons[0].Hint:='Выбрать заявителя из реестра населения...';
               if SignMan>0 then begin
                  deSignName.Font.Style:=[fsBold];
                  deSignName.ReadOnly:=True;
                  //deSignName.Font.Color:=clNavy;
                  //автоматический поиск предыдущих обращений данного человека
                  //--AutoFindMan(FDoc.GetDocId, SignMan, '', FDoc['SUBJ_ID'].AsInteger)
               end
               else begin
                  deSignName.ReadOnly:=False;
                  deSignName.Font.Style:=[];
                  //--laSignCount.Visible:=False;
                  //--laSubjCount.Visible:=False;
               end;
               SetSignCount(FDoc.AutoCountSign(FSignType, FSignKind));
               SetSubjCount(FDoc.AutoCountSubj(FSignType, FSignKind));
               if fChangeSign and (SignOrg>0) then begin
                  FDoc['SIGN_ORG'].AsInteger:=-1;
               end;
             {$ELSE}
               tbSignType.ImageIndex:=DI_Citizen;
               deSignName.EditButtons[0].Hint:='';
               SetSignCount(FDoc.AutoCountSign(FSignType, FSignKind));
               SetSubjCount(FDoc.AutoCountSubj(FSignType, FSignKind));
               deSignName.ReadOnly:=False;
               deSignName.Enabled:=true;
               deSignName.Font.Style:=[];
               if fChangeSign and (SignOrg>0) then begin
                  FDoc['SIGN_ORG'].AsInteger:=-1;
               end;
             {$ENDIF}
               if SignType=stGroup then begin
                  if (deSignName.Text='') or (deSignName.Text='анонимное') then begin
                     deSignName.Text:='коллективное';
                  end;
                  //--laSignCount.Visible:=False;
                  //--laSubjCount.Visible:=False;
               end;
            end;
         end;
(*--
         // коллективное
         stGroup{--,
         // коллективное: 30 и более граждан
         stGroup30}: begin
            if deSignName.Text='' then begin
               deSignName.Text:='коллективное';
            end;
            //--DBAware.SetReadOnly(True);
//            tbaSignType.Visible:=False;
            deSignName.Font.Style:=[];
            deSignName.ReadOnly:=False;
//            deSignName.Enabled:=False;
            if fChangeSign then begin
               FDoc['SIGN_MAN'].AsInteger:=-1;
               FDoc['SIGN_ORG'].AsInteger:=-1;
            end;
            laSignCount.Visible:=False;
            laSubjCount.Visible:=False;
         end;
--*)
         // анонимное
         stAnonym: begin
            deSignName.Text:='анонимное';
            //--DBAware.SetReadOnly(True);
//            tbaSignType.Visible:=False;
            deSignName.Font.Style:=[];
            deSignName.ReadOnly:=False;
            deSignName.Enabled:=False;
            if fChangeSign then begin
               FDoc['SIGN_MAN'].AsInteger:=-1;
               FDoc['SIGN_ORG'].AsInteger:=-1;
            end;
            laSignCount.Visible:=False;
            laSubjCount.Visible:=False;
         end;
      end;
   end
   else begin
      // NB: !!!
      // пусто
//      tbaSignType.Visible:=False;
      deSignName.Font.Style:=[];
      deSignName.ReadOnly:=False;
      deSignName.Enabled:=False;
      if fChangeSign then begin
         FDoc['SIGN_MAN'].AsInteger:=-1;
         FDoc['SIGN_ORG'].AsInteger:=-1;
      end;
      laSignCount.Visible:=False;
      laSubjCount.Visible:=False;
   end;
end;

procedure TfmEditRec.deSignNameEditButtonClick(Sender: TObject; var Handled: Boolean);
var
  nSel:Integer;
begin         
   nSel:=FSignKind;
   {$IFNDEF OBR_GRAG_WITH_NASEL}
     if nSel=skMan
       then nSel:=-1;
   {$ENDIF}
   if nSel>-1 then begin                             
     dlSignPlace.OnChange:=nil;
     try        
        if FDoc.SelectSign(nSel, FSignType) then begin
           SetAdrId(Doc2Sel.SignAdresId);
           SetAdrIn(Doc2Sel.AdrIn);
           SetSignType(FSignType, FSignKind);
        end;
     finally
        dlSignPlace.OnChange:=dlSignPlaceChange;
     end;
   end;
end;

procedure TfmEditRec.deSignNameClearButtonClick(Sender: TObject; var Handled: Boolean);
begin
   FDoc.ClearSign;
   SetSignType(FSignType, FSignKind);
end;

procedure TfmEditRec.deAdrTextEditButtonClick(Sender: TObject; var Handled: Boolean);
begin
   dlSignPlace.OnChange:=nil;
   try
      if FDoc.SelectAdres then begin
         SetAdrId(Doc2Sel.SignAdresId);
         SetAdrIn(Doc2Sel.AdrIn);
      end;
   finally
      dlSignPlace.OnChange:=dlSignPlaceChange;
   end;
end;

procedure TfmEditRec.acWorkAddExecute(Sender: TObject);
begin
   if FDoc.DocWork.DetailAdd then begin
      UpdateEnabledAction;
   end;
end;

procedure TfmEditRec.acWorkDelExecute(Sender: TObject);
begin
   FDoc.DocWork.DetailDelete;
end;

procedure TfmEditRec.acWorkEditExecute(Sender: TObject);
begin
   FDoc.DocWork.DetailEdit;
end;

procedure TfmEditRec.acWorkUpExecute(Sender: TObject);
begin
   FDoc.DocWork.DetailUp;
end;

procedure TfmEditRec.acWorkDownExecute(Sender: TObject);
begin
   FDoc.DocWork.DetailDown;
end;

procedure TfmEditRec.OnAfterScroll(DataSet: TDataSet);
begin
   if DataSet.State=dsBrowse then begin
      UpdateEnabledAction;
   end;
end;

procedure TfmEditRec.deRepeatAddClick(Sender: TObject; var Handled: Boolean);
var
   Query: TAdsQuery;
   LastOrder: Integer;
   Bookmark: TStringList;
   I: Integer;
   //--RepeatCount: Integer;
begin
   Bookmark:=TStringList.Create;
   try
      if CheckRepeatList and FDoc.SelectDocument(Query, Bookmark) then begin
         try
            LastOrder:=FDoc.LinkItem.GetLastOrder(skEdit);
            for I:=0 to Pred(Bookmark.Count) do begin
               Query.Bookmark:=Bookmark[I];
               if Query.FieldByName('DOC_ID').AsInteger>0 then begin
                  Inc(LastOrder);
                  CopyDocLink(Query, FDoc.LinkItem.EditTable, LastOrder);
               end;
            end;
            //--FDoc['REPEAT_TEXT'].AsString:=FDoc.GetRepeatText(FDoc.LinkItem.EditTable, RepeatCount);
            //--laRepeatCount.Visible:=RepeatCount<>0;
            //--laRepeatCount.Caption:=IntToStr(RepeatCount);
            SetRepeatCount;
            {--
            if not Query.Eof and (Query.FieldByName('DOC_ID').AsInteger>0) then begin
               CopyDocLink(Query, FDoc.LinkItem.EditTable, Succ(FDoc.LinkItem.GetLastEditOrder));
               //ActiveControl:=deRepeatText;
               FDoc['REPEAT_TEXT'].AsString:=FDoc.GetRepeatText(FDoc.LinkItem.EditTable);
            end;
            }
         finally
            Query.Free;
         end;
      end;
   finally
      Bookmark.Free;
   end;
end;

procedure TfmEditRec.deRepeatEditClick(Sender: TObject; var Handled: Boolean);
begin
   if CheckRepeatList and EditLinkList(FDoc) then begin
      //--FDoc['REPEAT_TEXT'].AsString:=FDoc.GetRepeatText(FDoc.LinkItem.EditTable, RepeatCount);
      SetRepeatCount;
   end;
end;

procedure TfmEditRec.acWordExecute(Sender: TObject);
begin
//
end;

procedure TfmEditRec.SetAppForm(AppForm: Integer; FromVisit: Boolean; TelLine: Boolean);

   procedure AddTop(Arr: TControlArray; AddTop: Integer);
   var
      I: Integer;
   begin
      for I:=Low(Arr) to High(Arr) do begin
         Arr[I].Top:=Arr[I].Top+AddTop;
      end;
   end;

begin
   // письменно
   if (AppForm=stWriting) and not FromVisit then begin
      // 4. Отметка о личном приеме
      SetControlVisible(FGroup04_1Control, False);
      SetControlVisible(FGroup04_2Control, False);
      // 4. Сопроводительное письмо/Поручение
      SetControlVisible(FGroup04Control, True);
      laAdrNote.Caption:='Другие сведения';
   end
   else if (AppForm=stVerbal) or FromVisit then begin
      // 4. Сопроводительное письмо/Поручение
      SetControlVisible(FGroup04Control, False);
      SetControlVisible(FGroup04_2Control, False);
      // 4. Отметка о личном приеме
      if laGroup04.Top<>laGroup04_1.Top then begin
         AddTop(FGroup04_1Control, -(laGroup04_1.Top-laGroup04.Top));
      end;
      SetControlVisible(FGroup04_1Control, True);
      laAdrNote.Caption:='Другие сведения';
   end
   else if (AppForm=stElect)  and not FromVisit then begin   // vadim 20.10.2016
      // 4. Отметка о приеме
      SetControlVisible(FGroup04Control, False);
      SetControlVisible(FGroup04_1Control, False);
      // 4. Отметка о приеме
      if laGroup04.Top<>laGroup04_2.Top then begin
         AddTop(FGroup04_2Control, -(laGroup04_2.Top-laGroup04.Top));
      end;
      SetControlVisible(FGroup04_2Control, True);
      laAdrNote.Caption:='E-mail';
   end
   else begin
      // 4. Отметка о личном приеме
      SetControlVisible(FGroup04_1Control, False);
      // 4. Сопроводительное письмо/Поручение
      SetControlVisible(FGroup04Control, False);
   end;
end;

(*--
function TfmEditRec.AutoFindMan(DocId, SignMan: Integer; SignName: string; SubjId: Integer): Boolean;
var
   SignCount: Integer;
   SubjCount: Integer;
begin
   //NB: ??? SIGN_NAME ??? за последние два года
   //поиск обращений одного и того же гражданина
   SignCount:=0;
   if SignMan>0 then begin
      SignCount:=FDoc.QueryIntegerValue(
         'select count( * ) from DOCMAIN '+
         //--'where DOC_TYPE=%d and SIGN_TYPE in (%d, %d) and SIGN_MAN=%d and DOC_ID<>%d',
         'where DOC_TYPE=%d and SIGN_TYPE=%d and SIGN_MAN=%d and DOC_ID<>%d',
         [FDoc.DocType, stIndividual{--, skIP}, SignMan, DocId], 0
      );
   end;
   Result:=SignCount<>0;
   laSignCount.Visible:=Result;
   laSignCount.Caption:=Format('(+%d)', [SignCount]);
   //поиск обращений одного и того же гражданина по одной и той же тематике
   SubjCount:=0;
   if SubjId>0 then begin
      SubjCount:=FDoc.QueryIntegerValue(
         'select count( * ) from DOCMAIN '+
         //--'where DOC_TYPE=%d and SIGN_TYPE in (%d, %d) and SIGN_MAN=%d and DOC_ID<>%d AND SUBJ_ID=%d',
         'where DOC_TYPE=%d and SIGN_TYPE=%d and SIGN_MAN=%d and DOC_ID<>%d AND SUBJ_ID=%d',
         [FDoc.DocType, stIndividual{--, skIP}, SignMan, DocId, SubjId], 0
      );
   end;
   laSubjCount.Visible:=SubjCount<>0;
   laSubjCount.Caption:=Format('(+%d)', [SubjCount]);
end;
--*)

(*--
function TfmEditRec.AutoFindOrg(DocId, SignOrg: Integer; SignName: string; SubjId: Integer): Boolean;
var
   SignCount: Integer;
   SubjCount: Integer;
begin
   //NB: ??? SIGN_NAME ??? за последние два года
   //поиск обращений одной и той же организации
   SignCount:=0;
   if SignOrg>0 then begin
      SignCount:=FDoc.QueryIntegerValue(
         'select count( * ) from DOCMAIN '+
         //--'where DOC_TYPE=%d and SIGN_TYPE=%d and SIGN_ORG=%d and DOC_ID<>%d',
         'where DOC_TYPE=%d and SIGN_KIND=%d and SIGN_ORG=%d and DOC_ID<>%d',
         [FDoc.DocType, skUL, SignOrg, DocId], 0
      );
   end;
   Result:=SignCount<>0;
   laSignCount.Visible:=Result;
   laSignCount.Caption:=Format('(+%d)', [SignCount]);
   //поиск обращений одной и той же организации по одной и той же тематике
   SubjCount:=0;
   if SubjId>0 then begin
      SubjCount:=FDoc.QueryIntegerValue(
         'select count( * ) from DOCMAIN '+
         //--'where DOC_TYPE=%d and SIGN_TYPE=%d and SIGN_ORG=%d and DOC_ID<>%d and SUBJ_ID=%d',
         'where DOC_TYPE=%d and SIGN_KIND=%d and SIGN_ORG=%d and DOC_ID<>%d and SUBJ_ID=%d',
         [FDoc.DocType, skUL, SignOrg, DocId, SubjId], 0
      );
   end;
   laSubjCount.Visible:=SubjCount<>0;
   laSubjCount.Caption:=Format('(+%d)', [SubjCount]);
end;
--*)

procedure TfmEditRec.dlSubjIdUpdateData(Sender: TObject; var Handled: Boolean);
var
   //--SignMan: Integer;
   //--SignOrg: Integer;
   SubjId: Integer;
begin
   //--SignMan:=FDoc['SIGN_MAN'].AsInteger;
   //--SignOrg:=FDoc['SIGN_ORG'].AsInteger;
   SubjId:=0;
   if dlSubjId.Value<>Null then begin
      SubjId:=dlSubjId.Value;
   end;
   SetSignCount(FDoc.AutoCountSign(FSignType, FSignKind));
   SetSubjCount(FDoc.AutoCountSubj(FSignType, FSignKind, SubjId));
   {--
   if SignMan>0 then begin
      //автоматический поиск предыдущих обращений данного человека
      AutoFindMan(FDoc.GetDocId, SignMan, '', SubjId)
   end
   else if SignOrg>0 then begin
      //автоматический поиск предыдущих обращений по данной организации
      AutoFindOrg(FDoc.GetDocId, SignOrg, '', SubjId);
   end;
   --}
end;

procedure TfmEditRec.chbIsRepeatClick(Sender: TObject);
begin
   laRepeatText.Enabled:=chbIsRepeat.Checked;
   deRepeatText.Enabled:=chbIsRepeat.Checked;
end;

procedure TfmEditRec.SetControlPosition;
begin
   tbaSignType.Top:=deSignName.Top;
   tbaSignType.Left:=deSignName.Left+deSignName.Width+4;
   tbaDocWork.Top:=DOC_WORK.Top;
   tbaDocWork.Left:=DOC_WORK.Left+DOC_WORK.Width+7;
   tbaDocFile.Top:=paDocFile.Top;
   tbaDocFile.Left:=paDocFile.Left+paDocFile.Width+7;
end;

function TfmEditRec.CheckRepeatList: Boolean;
var
   SignType: Integer;
begin
   Result:=False;
   if not FDoc['SIGN_TYPE'].IsNull then begin
      SignType:=FDoc['SIGN_TYPE'].AsInteger;
      if not SignType in [stIndividual{--, skUL, skIP}] then begin
         MessageDlgR('Выбор повторных (предыдущих) обращений доступен только для индивидуальных обращений', mtWarning, [mbOk], 0);
      end
      else begin
         Result:=True;
      end;
   end
   else begin
      MessageDlgR('Для выбора повторных (предыдущих) обращений необходимо указать "Вид подписи"', mtWarning, [mbOk], 0);
   end
end;

procedure TfmEditRec.chbReqAnsClick(Sender: TObject);
begin
   laReqTerm.Enabled:=chbReqAns.Checked;
   deReqTerm.Enabled:=chbReqAns.Checked;
end;

procedure TfmEditRec.chbCheckOutClick(Sender: TObject);
begin
   laCheckDate.Enabled:=chbCheckOut.Checked;
   deCheckDate.Enabled:=chbCheckOut.Checked;
   laCheckMan.Enabled:=chbCheckOut.Checked;
   deCheckMan.Enabled:=chbCheckOut.Checked;
end;

procedure TfmEditRec.chbInFileClick(Sender: TObject);
begin
   laFileId.Enabled:=chbInFile.Checked;
   dlFileId.Enabled:=chbInFile.Checked;
   laDeloDate.Enabled:=chbInFile.Checked;
   deDeloDate.Enabled:=chbInFile.Checked;
   laFileVol.Enabled:=chbInFile.Checked;
   deFileVol.Enabled:=chbInFile.Checked;
   laFileList.Enabled:=chbInFile.Checked;
   deFileList.Enabled:=chbInFile.Checked;

   sbFileID.Enabled:=chbInFile.Checked;
   sbFileID2.Enabled:=chbInFile.Checked;
   pnFileID.Enabled:=chbInFile.Checked;
   lbFileID.Enabled:=chbInFile.Checked;
end;

procedure TfmEditRec.dcAppFormChange(Sender: TObject);
var
  l:Boolean;
begin
   if (Sender<>nil) and (Sender is TDBCheckBoxEh) then begin
     l:=TDBCheckBoxEh(Sender).Checked;
     if TDBCheckBoxEh(Sender).DataField='FROM_VISIT' then begin
       if l then FDoc['TEL_LINE'].AsBoolean:=false;
     end else if TDBCheckBoxEh(Sender).DataField='TEL_LINE' then begin
       if l then FDoc['FROM_VISIT'].AsBoolean:=false;
     end;
   end;
   if dcAppForm.ItemIndex<>-1 then begin
      SetAppForm(StrToInt(dcAppForm.KeyItems[dcAppForm.ItemIndex]), chbFromVisit.Checked, chbTelLine.Checked);
   end
   else begin
      SetAppForm(-1, chbFromVisit.Checked, chbTelLine.Checked);
   end;
end;

procedure TfmEditRec.ClearControlEvent;
begin
   dcAppForm.OnChange:=nil;
   chbFromVisit.OnClick:=nil;
   chbTelLine.OnClick:=nil;
   dcSignType.OnChange:=nil;
   dcSignKind.OnChange:=nil;
   dlSignPlace.OnChange:=nil;
end;

procedure TfmEditRec.SetControlEvent;
begin
   dcAppForm.OnChange:=dcAppFormChange;
   chbFromVisit.OnClick:=dcAppFormChange;
   chbTelLine.OnClick:=dcAppFormChange;
   dcSignType.OnChange:=dcSignTypeChange;
   dcSignKind.OnChange:=dcSignTypeChange;
   dlSignPlace.OnChange:=dlSignPlaceChange;
end;

procedure TfmEditRec.dcSignTypeChange(Sender: TObject);
var
   SignType: Integer;
   SignKind: Integer;
begin
   SignType:=0;
   SignKind:=0;
   if dcSignType.ItemIndex<>-1 then begin
      SignType:=StrToInt(dcSignType.KeyItems[dcSignType.ItemIndex]);
      if dcSignKind.ItemIndex=-1 then begin
         dcSignKind.OnChange:=nil;
         dcSignKind.ItemIndex:=dcSignKind.KeyItems.IndexOf(IntToStr(skMan));
         dcSignKind.OnChange:=dcSignTypeChange;
      end;
   end;
   if dcSignKind.ItemIndex<>-1 then begin
      SignKind:=StrToInt(dcSignKind.KeyItems[dcSignKind.ItemIndex]);
   end;
   SetSignType(SignType, SignKind);
end;

procedure TfmEditRec.SetAdrId(AdrId: Integer);
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

procedure TfmEditRec.deAdrTextClearButtonClick(Sender: TObject; var Handled: Boolean);
begin
   dlSignPlace.OnChange:=nil;
   try
      FDoc.ClearAdrId;
      SetAdrId(-1);
      SetAdrIn(False);
   finally
      dlSignPlace.OnChange:=dlSignPlaceChange;
   end;
end;

procedure TfmEditRec.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:=FDoc.OnFormCloseQuery(FDoc.DBItem);
   {--
   //если были изменения данных, то запрашиваем подтверждение для закрытия документа
   if FDoc.DBItem.HaveStyle(bsConfirmSave) and
      not FDoc.DBItem.HaveStyle(bsReadOnly) and
      (FDoc.ViewMode<>vmView) and
      (ModalResult<>mrOk)
   then begin
      // вместо вызова CheckEditMode
      Perform(WM_NEXTDLGCTL, 0, 0); //--FDoc.DBItem.CheckEditMode;
      if FDoc.DBItem.IsDataModified then begin
         case MessageDlgR('Сохранить изменения в документе?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
            mrYes: ModalResult:=mrOk;
            mrNo:;
            mrCancel: CanClose:=False;
         end;
      end;
   end;
   --}
end;
//---------------------------------------------
procedure TfmEditRec.SetTableSprDocSubj;
var
   s: string;
   LinkSpr: TDBItem;
   n:Integer;
begin
  n:=FDoc['SUBJ_ID'].AsInteger;
  if n=0 then begin
    s:='SP_SUBJ'+Def_SprDocSubj;
  end else begin
    if n<10000
      then s:='SP_SUBJ'
      else s:='SP_SUBJG';
  end;
  LinkSpr:=Doc.RecInt.SprDBItems.ByName(s);
  dlSubjIdG.ListSource:=LinkSpr.TableSource;
end;

//---------------------------------------------
procedure TfmEditRec.InvokeControlEvent;
begin
   SetFileView(False);
   //вызывать события для установки текущих значений реквизитов:
   // "Требуется ответ"
   chbReqAnsClick(nil);
   // "Повторное обращение"
   chbIsRepeatClick(nil);
   // "Снято с контроля или выполнено"
   chbCheckOutClick(nil);
   // "В дело"
   chbInFileClick(nil);
   // "На территории исполкома"
   chbAdrInClick(nil);
   // "Вид подписи обращения"
   SetSignType(FDoc['SIGN_TYPE'].AsInteger, FDoc['SIGN_KIND'].AsInteger);
   // "Форма поступления обращения"
   SetAppForm(FDoc['APP_FORM'].AsInteger, FDoc['FROM_VISIT'].AsBoolean, FDoc['TEL_LINE'].AsBoolean);
   // "Адрес"
   SetAdrId(FDoc['ADR_ID'].AsInteger);
   // "На территории исполкома"
   SetAdrIn(FDoc['ADR_IN'].AsBoolean);
   // "Повторно"
   SetRepeatCount(False);
   SetTableSprDocSubj;
end;

procedure TfmEditRec.chbAdrInClick(Sender: TObject);
begin
   if not chbAdrIn.Checked then begin
      dlSignPlace.OnChange:=nil;
      try
         if FDoc['SIGN_PLACE'].AsInteger<>-1 then begin
            FDoc['ADR_PLACE'].AsString:='';
         end;
         FDoc['SIGN_PLACE'].AsInteger:=-1;
      finally
         dlSignPlace.OnChange:=dlSignPlaceChange;
      end;
   end;
   SetAdrIn(chbAdrIn.Checked);
end;

procedure TfmEditRec.SetAdrIn(AdrIn: Boolean);
const
   MapHint: array [Boolean] of string=(
      'вне территории исполкома',  //false
      'на территории исполкома'    //true
   );
begin
   chbAdrIn.Hint:=MapHint[chbAdrIn.Checked];
   if AdrIn then begin
      dlSignPlace.Visible:=True;
      deAdrPlace.Visible:=False;
   end
   else begin
      deAdrPlace.Visible:=True;
      dlSignPlace.Visible:=False;
   end;
end;

procedure TfmEditRec.dlSignPlaceChange(Sender: TObject);
var
   SignPlaceId: Integer;
   AdrPlace: string;
begin
    AdrPlace:='';
    if dlSignPlace.Value<>Null then begin
       SignPlaceId:=dlSignPlace.Value;
       AdrPlace:=Doc2Sel.GetAdresPunkt(SignPlaceId);
    end;
    FDoc['ADR_PLACE'].AsString:=AdrPlace;
end;

procedure TfmEditRec.dcGroupIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
   FDoc.SelectGroup;
end;

procedure TfmEditRec.SetSignCount(SignCount: Integer);
begin
   laSignCount.Visible:=SignCount<>0;
   laSignCount.Caption:=Format('(+%d)', [SignCount]);
end;
                                                
procedure TfmEditRec.SetSubjCount(SubjCount: Integer);
begin
   laSubjCount.Visible:=SubjCount<>0;
   laSubjCount.Caption:=Format('(+%d)', [SubjCount]);
end;

procedure TfmEditRec.SetRepeatCount(SetText: Boolean=True);
var
   RepeatText: string;
   RepeatCount: Integer;
begin
   RepeatText:=FDoc.GetRepeatText(FDoc.LinkItem.EditTable, RepeatCount);
   if SetText then begin
      FDoc['REPEAT_TEXT'].AsString:=RepeatText;
   end;
   laRepeatCount.Visible:=RepeatCount<>0;
   laRepeatCount.Caption:=Format('(+%d)', [RepeatCount]);
end;

procedure TfmEditRec.FormActivate(Sender: TObject);
begin
 {$IFNDEF OBR_GRAG_WITH_NASEL}
   deAdrText.EditButtons[0].Visible:=false;
   deAdrText.EditButtons[1].Visible:=false;
//   deSignName.EditButtons[0].Visible:=false;
//   deSignName.EditButtons[1].Visible:=false;
 {$ENDIF}
end;

procedure TfmEditRec.AddFileToListView;
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

procedure TfmEditRec.SetFileView(IsTable: Boolean);
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

procedure TfmEditRec.acFileAddExecute(Sender: TObject);
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

procedure TfmEditRec.acFileDeleteExecute(Sender: TObject);
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

procedure TfmEditRec.acFileEditExecute(Sender: TObject);
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

procedure TfmEditRec.acFileViewExecute(Sender: TObject);
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

procedure TfmEditRec.acFileViewListExecute(Sender: TObject);
begin
   SetFileView(not FIsTableView);
end;

procedure TfmEditRec.lvDocFileChange(Sender: TObject; Item: TListItem;  Change: TItemChange);
begin
   UpdateEnabledAction;
end;

procedure TfmEditRec.lvDocFileDblClick(Sender: TObject);
begin
   acFileViewExecute(nil);
end;

procedure TfmEditRec.lbFileIDGetText(Sender: TObject; var Text: String);
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

procedure TfmEditRec.sbFileIDClick(Sender: TObject);
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

procedure TfmEditRec.sbFileID2Click(Sender: TObject);
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

procedure TfmEditRec.lbFileIDClick(Sender: TObject);
begin
  sbFileID2Click(nil);
end;


end.


