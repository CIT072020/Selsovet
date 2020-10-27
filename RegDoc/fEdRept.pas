unit fEdRept; // форма просмотра и редактирования списка связанных документов
interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Grids, DBGridEh, mAdsObj, DB, kbmMemTable, AdsTable,
   ActnList, ImgList, ComCtrls, ToolWin, mFindInt, DBCtrlsEh, fEdLink, mDRecInt;

type
   TfmEdRept=class(TForm)
      dgLink: TDBGridEh;
      btOk: TButton;
      btCancel: TButton;
      dsLink: TkbmMemTable;
      dsoLink: TDataSource;
      tbaDocLink: TToolBar;
      tbLinkAdd: TToolButton;
      tbLinkDel: TToolButton;
      tbLinkEdit: TToolButton;
      tbLinkUp: TToolButton;
      tbLinkDown: TToolButton;
      imEdRept: TImageList;
      alEdRept: TActionList;
      acLinkAdd: TAction;
      acLinkDel: TAction;
      acLinkEdit: TAction;
      acDocFind: TAction;
      acLinkUp: TAction;
      acLinkDown: TAction;
      tbDocFind: TToolButton;
      procedure OnGridButtonClick(Sender: TObject; var Handled: Boolean);
      procedure acDocFindExecute(Sender: TObject);
      procedure acLinkAddExecute(Sender: TObject);
      procedure acLinkDelExecute(Sender: TObject);
      procedure acLinkEditExecute(Sender: TObject);
      procedure acLinkUpExecute(Sender: TObject);
      procedure acLinkDownExecute(Sender: TObject);
      procedure dgLinkDblClick(Sender: TObject);
   private
      FDoc: TDBDocument;
      FDocItem: TDBItem;
      FLinkItem: TDBItem;
      FDocId: Integer;
      FViewMode: TViewMode;
   private
      procedure OnAfterScroll(DataSet: TDataSet);
      procedure UpdateButtons;
      procedure AdjustPosition;
      procedure DoFindDoc;
      procedure DoLinkAdd;
      procedure DoLinkDel;
      procedure DoLinkEdit;
      procedure DoLinkUp;
      procedure DoLinkDown;
   end;

function EditLinkList(Doc: TDBDocument): Boolean;

implementation

{$R *.dfm}

function EditLinkList(Doc: TDBDocument): Boolean;
begin
   Result:=False;
   with TfmEdRept.Create(nil) do begin
      try
         FDoc:=Doc;
         FViewMode:=Doc.ViewMode;
         btOk.Enabled:=FViewMode<>vmView;
         acDocFind.Enabled:=FViewMode<>vmView;
         if FViewMode=vmView then begin
            Caption:=Caption+' [ПРОСМОТР]';
         end;
         //
         AdjustPosition;
         FDocItem:=Doc.DBItem;
         FLinkItem:=Doc.DBItem.DetailList.ByName('DOC_LINK');
         FDocId:=Doc.GetDocId;
         FLinkItem.FieldList.CreateEditTable2(dsLink);
         dsLink.Open;
         CopyDataSetToDataSet(FLinkItem.EditTable, dsLink);
         dsLink.MasterFields:=FLinkItem.EditTable.MasterFields;
         dsLink.MasterSource:=FLinkItem.EditTable.MasterSource;
         //EditTable.AutoIncMinValue:=1;
         //EditTable.ResetAutoInc;
         //---
         //dgLink.DataSource:=FLinkItem.EditSource;
         if FLinkItem.TableView<>nil then begin
            FLinkItem.TableView.SetColView(dgLink, FLinkItem.TableView.DefaultDrawCell, OnGridButtonClick, True);
         end;
         dsLink.AfterScroll:=OnAfterScroll;
         UpdateButtons;
         dgLink.Anchors:=dgLink.Anchors+[akRight];
         if ShowModal=mrOk then begin
            dsLink.AfterScroll:=nil;
            if not FLinkItem.HaveStyle(bsReadOnly) and (FViewMode<>vmView) then begin
               FLinkItem.EditTable.EmptyTable;
               CopyDataSetToDataSet(dsLink, FLinkItem.EditTable);
               Result:=True;
            end;
         end;
         UpdateAndClearTableView(FLinkItem.TableView);
      finally
         Free;
      end;
   end;
end;

{ TfmEdRept }

procedure TfmEdRept.OnGridButtonClick(Sender: TObject; var Handled: Boolean);
begin
//
end;

procedure TfmEdRept.AdjustPosition;
begin
   tbaDocLink.Top:=dgLink.Top;
   tbaDocLink.Left:=dgLink.Left+dgLink.Width+7;
end;

procedure TfmEdRept.DoFindDoc;
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
            LastOrder:=FLinkItem.GetLastDataSetOrder(dsLink, dsLink.FieldByName(FLinkItem.OrderFieldName));
            for I:=0 to Pred(Bookmark.Count) do begin
               Query.Bookmark:=Bookmark[I];
               if Query.FieldByName('DOC_ID').AsInteger>0 then begin
                  Inc(LastOrder);
                  CopyDocLink(Query, dsLink, LastOrder);
               end;
            end;
            ActiveControl:=dgLink;
            {--
            if not Query.Eof and (Query.FieldByName('DOC_ID').AsInteger>0) then begin
               LastOrder:=FLinkItem.GetLastOrder(dsLink, dsLink.FieldByName(FLinkItem.OrderFieldName));
               CopyDocLink(Query, dsLink, Succ(LastOrder));
               ActiveControl:=dgLink;
            end;
            --}
         finally
            Query.Free;
         end;
         UpdateButtons;
      end;
   finally
      Bookmark.Free;
   end;
end;

procedure TfmEdRept.acDocFindExecute(Sender: TObject);
begin
   DoFindDoc;
end;

procedure TfmEdRept.DoLinkAdd;
var
   LastOrder: Integer;
begin
   if FLinkItem<>nil then begin
      LastOrder:=FLinkItem.GetLastDataSetOrder(dsLink, dsLink.FieldByName(FLinkItem.OrderFieldName));
      dsLink.Append;
      //NB: это должно быть вынесено в OnSetDefaultValue
      //порядок просмотра связей
      dsLink.FieldByName(FLinkItem.OrderFieldName).AsInteger:=Succ(LastOrder);
      //тип связи
      dsLink.FieldByName('LINK_TYPE').AsInteger:=ltRepeat;
      //вид связи
      dsLink.FieldByName('LINK_KIND').AsInteger:=lkDirect;
      //идентификатор связанного документа - LINK_DOC
      //дата регистрации связанного документа - REG_DATE
      //регистрационный индекс связанного документа - REG_IND
      //примечание - DOC_NOTE
      //тип связанного документа
      dsLink.FieldByName('DOC_TYPE').AsInteger:=dtPetition;
      //группа документов - GROUP_ID
      //NB: !!! !!! !!! какая группа и базовая группа если ссылка на несуществующий документ
      //--dsLink.FieldByName('GROUP_ID').AsInteger:=0;
      //вид документа
      dsLink.FieldByName('GROUP_KIND').AsInteger:=gkPetition;
      //связанный документ в базе
      dsLink.FieldByName('IN_BASE').AsInteger:=lNo;
      //печатать в РКК
      dsLink.FieldByName('IS_PRINT').AsInteger:=lYes;
      DoLinkEdit;
   end;
end;

procedure TfmEdRept.DoLinkDel;
begin
   if FLinkItem<>nil then begin
      if not FLinkItem.HaveStyle(bsConfirmDelete) or
         (MessageDlgR('Удалить текущую запись?', mtConfirmation, [mbYes, mbNo], 0)=mrYes)
      then begin
         dsLink.Delete;
      end;
   end;
end;

procedure TfmEdRept.DoLinkDown;
begin
   if FLinkItem<>nil then begin
      FLinkItem.RecordDown(dsLink, dsLink.FieldByName(FLinkItem.OrderFieldName));
   end;
end;

procedure TfmEdRept.DoLinkEdit;
begin
   if FLinkItem<>nil then begin
      FDoc.EditDocLink(FLinkItem, dsLink, dsoLink, FViewMode);
      UpdateButtons
   end;
end;

procedure TfmEdRept.DoLinkUp;
begin
   if FLinkItem<>nil then begin
      FLinkItem.RecordUp(dsLink, dsLink.FieldByName(FLinkItem.OrderFieldName));
   end;
end;

procedure TfmEdRept.acLinkAddExecute(Sender: TObject);
begin
   DoLinkAdd;
end;

procedure TfmEdRept.acLinkDelExecute(Sender: TObject);
begin
   DoLinkDel;
end;

procedure TfmEdRept.acLinkEditExecute(Sender: TObject);
begin
   DoLinkEdit;
end;

procedure TfmEdRept.acLinkUpExecute(Sender: TObject);
begin
   DoLinkUp;
end;

procedure TfmEdRept.acLinkDownExecute(Sender: TObject);
begin
   DoLinkDown;
end;

procedure TfmEdRept.dgLinkDblClick(Sender: TObject);
var
   pt: TPoint;
   gc: TGridCoord;
begin
   GetCursorPos(pt);
   pt:=dgLink.ScreenToClient(pt);
   gc:=dgLink.MouseCoord(pt.x, pt.y);
   if (gc.x<>-1) and (gc.y<>-1) then begin
      DoLinkEdit;
   end;
end;

procedure TfmEdRept.OnAfterScroll(DataSet: TDataSet);
begin
   if DataSet.State=dsBrowse then begin
      UpdateButtons;
   end;
end;

procedure TfmEdRept.UpdateButtons;
var
   fl: Boolean;
begin
   fl:=(FLinkItem<>nil) and (not dsLink.IsEmpty) and (not FLinkItem.HaveStyle(bsReadOnly));
   acLinkAdd.Enabled:=(FLinkItem<>nil) and not (FLinkItem.HaveStyle(bsReadOnly) or (FViewMode=vmView));
   acLinkDel.Enabled:=fl and (FViewMode<>vmView);
   acLinkEdit.Enabled:=fl;
   acLinkUp.Enabled:=fl and (dsLink.RecNo<>1) and (FViewMode<>vmView);
   acLinkDown.Enabled:=fl and (dsLink.RecNo<>dsLink.RecordCount) and (FViewMode<>vmView);
end;

end.
