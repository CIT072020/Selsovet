unit fEdLink; //форма просмотра и редактирования связей с документами
interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, mAdsObj, StdCtrls, ExtCtrls, DB, DBCtrlsEh, Mask, mDRecInt,
   adsdata, adsfunc, adstable;

type
   TfmEdLink=class(TForm)
      bvBottom: TBevel;
      btOk: TButton;
      btCancel: TButton;
      laLinkType: TLabel;
      laGroup01: TLabel;
      bv01: TBevel;
      laInBase: TLabel;
      laRegDate: TLabel;
      laRegInd: TLabel;
      laDocNote: TLabel;
      laIsPrint: TLabel;
      deRegDate: TDBDateTimeEditEh;
      deRegInd: TDBEditEh;
      deDocNote: TDBEditEh;
      dcLinkType: TDBComboBoxEh;
      dcInBase: TDBComboBoxEh;
      dcIsPrint: TDBComboBoxEh;
      laGroup02: TLabel;
      bv02: TBevel;
      deSignName: TDBEditEh;
      deSubjId: TDBEditEh;
      deContent: TDBEditEh;
      dcAnsKind: TDBComboBoxEh;
      deAnsDate: TDBDateTimeEditEh;
      deAnsInd: TDBEditEh;
      deAnsText: TDBEditEh;
      laSignName: TLabel;
      laSubjId: TLabel;
      laContent: TLabel;
      laAnsKind: TLabel;
      laAnsDate: TLabel;
      laAnsInd: TLabel;
      laAnsText: TLabel;
      bv03: TBevel;
      laGroup03: TLabel;
      dsoSelDoc: TDataSource;
      quSelDoc: TAdsQuery;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure dcInBaseChange(Sender: TObject);
   private
      FDocType: Integer;
      FDBAware: TDBAwareList;
      FLinkItem: TDBItem;
      FDataSet: TDataSet;
      FDataSource: TDataSource;
      FViewMode: TViewMode;
   private
      procedure SetDBItem(DBItem: TDBItem; DataSet: TDataSet; DataSource: TDataSource);
      procedure OnButtonClick(Sender: TObject; var Handled: Boolean);
      procedure UpdateLinkDoc(DocId: Integer);
   end;

function EditDocLink(DBItem: TDBItem; DataSet: TDataSet; DataSource: TDataSource; ViewMode: TViewMode; DocType: Integer): Boolean;

implementation

{$R *.dfm}

function EditDocLink(DBItem: TDBItem; DataSet: TDataSet; DataSource: TDataSource; ViewMode: TViewMode; DocType: Integer): Boolean;
var
   EditSource: TDataSource;
begin
   Result:=False;
   with TfmEdLink.Create(nil) do begin
      EditSource:=DBItem.EditSource;
      try
         FViewMode:=ViewMode;
         FDocType:=DocType;
         SetDBItem(DBItem, DataSet, DataSource);
         //
         dcInBase.OnChange:=dcInBaseChange;
         dcInBaseChange(nil);
         //обновить информацию о предыдущем обращении
         UpdateLinkDoc(FDataSet.FieldByName('LINK_DOC').AsInteger);
         if ShowModal=mrOk then begin
            if not DBItem.HaveStyle(bsReadOnly) and (FViewMode<>vmView) then begin
               Result:=True;
               //если обращения нет в базе, то надо обнулить ссылку на обращение
               if FDataSet.FieldByName('IN_BASE').AsInteger=lNo then begin
                  FDataSet.FieldByName('LINK_DOC').AsInteger:=0;
               end;
               FDataSet.Post;
               //NB: ??? CheckBrowseMode
            end;
         end
         else begin
            FDataSet.Cancel;
         end;
      finally
         DBItem.EditSource:=EditSource;
         Free;
      end;
   end;
end;

{ TfmEdLink }

procedure TfmEdLink.SetDBItem(DBItem: TDBItem; DataSet: TDataSet; DataSource: TDataSource);
var
   FieldItem: TFieldItem;
begin
   FLinkItem:=DBItem;
   FDataSet:=DataSet;
   FDataSource:=DataSource;
   DBItem.EditSource:=DataSource;
   //связь элементом редактированя с полями таблицы
   FDBAware.BuildControlList(DBItem, Self);
   FDBAware.ConfigControlList(FViewMode, OnButtonClick, nil, nil);
   FDBAware.SetFirstEditableFocus(Self);
   //
   quSelDoc.DatabaseName:=FLinkItem.DatabaseName;
   if FLinkItem.MasterItem<>nil then begin
      FieldItem:=FLinkItem.MasterItem.FieldList.ByName('ANS_KIND');
      //NB: надо использовать стандартные методы (вдруг будет подкоючен обычный справочник)
      if (FieldItem.LinkEnum<>nil) then begin
         dcAnsKind.Items.Assign(FieldItem.LinkEnum.PickList);
         dcAnsKind.KeyItems.Assign(FieldItem.LinkEnum.KeyList);
         dcAnsKind.DropDownBox.Rows:=dcAnsKind.KeyItems.Count;
      end;
   end;
   // установка режима редактирования
   if FViewMode=vmView then begin
      btOk.Enabled:=FViewMode<>vmView;
      Caption:=Caption+' [ПРОСМОТР]';
      FDBAware.SetReadOnly(FViewMode=vmView, nil);
   end
   else begin
      FDataSet.Edit;
   end;
end;

procedure TfmEdLink.FormCreate(Sender: TObject);
begin
   FDBAware:=TDBAwareList.Create;
end;

procedure TfmEdLink.FormDestroy(Sender: TObject);
begin
   FDBAware.Free;
end;

procedure TfmEdLink.OnButtonClick(Sender: TObject; var Handled: Boolean);
begin
//
end;

procedure TfmEdLink.dcInBaseChange(Sender: TObject);
var
   IN_BASE: Integer;
begin
   //NB: !!! надо использовать другое событие - это слишком часто вызывается !!!
   IN_BASE:=-1;
   if (dcInBase.ItemIndex<>-1) then begin
      IN_BASE:=StrToInt(dcInBase.KeyItems[dcInBase.ItemIndex]);
   end;
   if FViewMode<>vmView then begin
      if (IN_BASE=-1) or (IN_BASE=lYes) then begin
         FDBAware.ByControl(deRegDate).SetReadOnly(True);
         FDBAware.ByControl(deRegInd).SetReadOnly(True);
      end
      else begin
         FDBAware.ByControl(deRegDate).SetReadOnly(False);
         FDBAware.ByControl(deRegInd).SetReadOnly(False);
      end;
   end;
end;

procedure TfmEdLink.UpdateLinkDoc(DocId: Integer);
begin
   quSelDoc.SQL.Text:=Format(
      'select d.SIGN_NAME as Q_SIGN_NAME, trim(sp1.CODE)+''  ''+sp1.NAME as Q_SUBJ_ID, d.CONTENT as Q_CONTENT, d.ANS_KIND as Q_ANS_KIND, d.ANS_DATE as Q_ANS_DATE, d.ANS_IND as Q_ANS_IND, d.ANS_TEXT as Q_ANS_TEXT from DOCMAIN d '+
      'left join SPRDOCSUBJ sp1 on sp1.ID=d.SUBJ_ID '+
      'where d.DOC_TYPE=%d and d.DOC_ID=%d', [FDocType, DocId]);;
   quSelDoc.Close;
   quSelDoc.Open;
end;

end.
