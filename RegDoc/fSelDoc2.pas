unit fSelDoc2; // форма выбора предыдущего зарегистрированного обращения
interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Grids, DBGridEh, DB, AdsTable, adsdata, adsfunc,
   DBCtrlsEh, Mask, DBLookupEh, fSprEdit, mDRecInt,
   mAdsObj;

type
   TfmSelDoc2=class(TForm)
      btCancel: TButton;
      btOk: TButton;
      dsoSelDoc: TDataSource;
      dgSelDoc: TDBGridEh;
      gbFilter: TGroupBox;
      chbShowAllAdmProc: TCheckBox;
      chbShowAllSign: TCheckBox;
      laSignName: TLabel;
      laAdmProc: TLabel;
      dlSignName: TDBLookupComboboxEh;
      dsoSignName: TDataSource;
      dcAdmProc: TDBComboBoxEh;
      laYear: TLabel;
      dcYear: TDBComboBoxEh;
      laGroup: TLabel;
      dcGroup: TDBComboBoxEh;
      procedure dgSelDocDblClick(Sender: TObject);
      procedure OnFilterChange(Sender: TObject);
      procedure OnButtonClick(Sender: TObject; var Handled: Boolean);
      procedure dcAdmProcEditClick(Sender: TObject; var Handled: Boolean);
   private
      quSelDoc: TAdsQuery;
      quSignName: TAdsQuery;
      FDoc: TDBDocument;
      FDBItem: TDBItem;
      FDocId: Integer;
      FSignMan: Integer;
      FSignOrg: Integer;
      FAdmProc: Integer;
      FYear: string;
      FGroupId: string;
      FSignKind: Integer;
      FSignName: string;
      FDatabaseName: string;
   private
      function GetSQL: string;
      procedure SetDBItem(DBItem: TDBItem);
   end;

// NB:!!! SignName не используется
function SelectDocument2(Doc: TDBDocument; var Query: TAdsQuery; Bookmark: TStringList): Boolean;

implementation

{$R *.dfm}

function SelectDocument2(Doc: TDBDocument; var Query: TAdsQuery; Bookmark: TStringList): Boolean;
var
   I: Integer;
begin
   Result:=False;
   Query:=nil;
   with TfmSelDoc2.Create(nil) do begin
      quSelDoc:=TAdsQuery.Create(nil);
      quSignName:=TAdsQuery.Create(nil);
      try
         FDoc:=Doc;
         FDocId:=Doc.GetDocId;
         FSignMan:=Doc.DBItem.EditTable.FieldByName('SIGN_MAN').AsInteger;
         FSignOrg:=Doc.DBItem.EditTable.FieldByName('SIGN_ORG').AsInteger;
         FAdmProc:=Doc.DBItem.EditTable.FieldByName('ADM_PROC').AsInteger;
         //--FSignType:=Doc.DBItem.EditTable.FieldByName('SIGN_TYPE').AsInteger;
         FSignKind:=Doc.DBItem.EditTable.FieldByName('SIGN_KIND').AsInteger;
         FSignName:=Doc.DBItem.EditTable.FieldByName('SIGN_NAME').AsString;
         FDatabaseName:=Doc.DBItem.DatabaseName;
         dsoSelDoc.DataSet:=quSelDoc;
         ConfigGridColumn(dgselDoc, [
            'REG_NUM',     'Регистрация|№ п/п', 40,
            'REG_DATE',    'Регистрация|Дата ', 65,
            'REG_IND',     'Регистрация|Индекс', 50,
            'SIGN_NAME',   'Заявитель', 150,
            'IS_REPEAT',   'Заявление|Повторно', 60,
            'REPEAT_TEXT', 'Заявление|Даты, индексы повторных заявлений', 130,
            'PROC_NAME',   'Заявление|Процедура', 300
         ]);
         quSignName.DatabaseName:=FDatabaseName;
         // заявитель - юридическое лицо
         if FSignKind=skUL then begin
            quSignName.SQL.Text:=Format('select distinct SIGN_NAME as NAME, isnull(SIGN_ORG, -1) as ID from DOCMAIN where DOC_TYPE=%d and SIGN_KIND=%d and SIGN_NAME is not null', [FDoc.DocType, skUL]);
         end
         // заявитель - гражданин
         else begin
            quSignName.SQL.Text:=Format('select distinct SIGN_NAME as NAME, isnull(SIGN_MAN, -1) as ID from DOCMAIN where DOC_TYPE=%d and SIGN_KIND=%d and SIGN_NAME is not null', [FDoc.DocType, skMan]);
         end;
         quSignName.Open;
         dsoSignName.DataSet:=quSignName;
         //
         dlSignName.Value:=FSignName;
         quSelDoc.DatabaseName:=FDatabaseName;
         quSelDoc.SQL.Text:=GetSQL;
         quSelDoc.Open;
         //список годов регистрации
         FYear:='';
         dcYear.Items.Add('<все>');
         dcYear.KeyItems.Add('-1');
         FDoc.QueryStringList(
            'select distinct year(REG_DATE) from DocMain '+
            'where DOC_TYPE=%d '+
            'order by 1 desc',
            [FDoc.DocType],
            dcYear.Items
         );
         dcYear.KeyItems.Assign(dcYear.Items);
         dcYear.ItemIndex:=0;
         dcYear.OnChange:=OnFilterChange;
         //список групп документов
         FGroupId:='';
         dcGroup.Items.Add('<все>');
         dcGroup.KeyItems.Add('-1');
         FDoc.QueryStringLists(
            'select sp.ID, sp.%s from ('+
            '   select distinct GROUP_ID from DocMain where DOC_TYPE=%d '+
            ') d '+
            'left join SprDocGroup sp on sp.ID=d.GROUP_ID '+
            'order by sp.N_ORDER',
            [FDoc.DBItem.FieldList.ByName('GROUP_ID').LinkSpr.NameFieldName, FDoc.DocType],
            dcGroup.KeyItems,
            dcGroup.Items
         );
         dcGroup.ItemIndex:=0;
         dcGroup.OnChange:=OnFilterChange;
         SetDropDownWidth(dcGroup);
         //\\
         SetDBItem(Doc.DBItem);
         dcAdmProc.OnChange:=OnFilterChange;
         dlSignName.OnChange:=OnFilterChange;
         dgSelDoc.Anchors:=dgSelDoc.Anchors+[akRight];
         gbFilter.Anchors:=gbFilter.Anchors+[akRight];
         if ShowModal=mrOk then begin
            Query:=quSelDoc;
            Result:=True;
            if Bookmark<>nil then begin
               Bookmark.Clear;
               if dgSelDoc.SelectedRows.Count>0 then begin
                  for I:=0 to Pred(dgSelDoc.SelectedRows.Count) do begin
                     Bookmark.Add(dgSelDoc.SelectedRows[I]);
                  end;
               end
               else begin
                  Bookmark.Add(quSelDoc.Bookmark);
               end;
            end;
         end;
         dcAdmProc.OnChange:=nil;
         dlSignName.OnChange:=nil;
      finally
         if not Result then begin
            quSelDoc.Free;
         end;
         quSignName.Close;
         quSignName.Free;
         Free;
      end;
   end;
end;

procedure TfmSelDoc2.dgSelDocDblClick(Sender: TObject);
var
   pt: TPoint;
   gc: TGridCoord;
begin
   GetCursorPos(pt);
   pt:=dgSelDoc.ScreenToClient(pt);
   gc:=dgSelDoc.MouseCoord(pt.x, pt.y);
   if (gc.x<>-1) and (gc.y<>-1) then begin
      ModalResult:=mrOk;
   end;
end;

procedure TfmSelDoc2.OnFilterChange(Sender: TObject);
begin
   //ADM_PROC
   if VarIsNull(dcAdmProc.Value) then begin
      FAdmProc:=0;
   end
   else begin
      FAdmProc:=dcAdmProc.Value;
   end;
   //SIGN_NAME
   if FSignKind=skUL then begin
      FSignMan:=-1;
      FSignOrg:=quSignName.FieldByName('ID').AsInteger;
   end
   else begin
      FSignMan:=quSignName.FieldByName('ID').AsInteger;
      FSignOrg:=-1;
   end;
   FSignName:=quSignName.FieldByName('NAME').AsString;
   //REG_DATE.YEAR
   FYear:='';
   if (dcYear.ItemIndex>0) then begin
      FYear:=dcYear.KeyItems[dcYear.ItemIndex];
   end;
   //GROUP_ID
   FGroupId:='';
   if (dcGroup.ItemIndex>0) then begin
      FGroupId:=dcGroup.KeyItems[dcGroup.ItemIndex];
   end;
   //сформировать новый запрос
   quSelDoc.SQL.Text:=GetSQL;
   quSelDoc.Close;
   quSelDoc.Open;
end;

function TfmSelDoc2.GetSQL: string;
begin
   Result:=Format(
      'select '+
      '   d.DOC_ID, d.DOC_TYPE, d.GROUP_ID, d.GROUP_KIND, d.REG_DATE, d.REG_NUM, d.REG_IND, d.SIGN_NAME, d.IS_REPEAT, d.REPEAT_TEXT, d.ADM_PROC, '+
      '   trim(sp.PROC_NO)+'' ''+sp.FULL_NAME as PROC_NAME '+
      'from DOCMAIN d '+
      '   left join SprDocAdmProc sp on sp.ID=d.ADM_PROC '+
      'where d.DOC_TYPE=%d and d.DOC_ID<>%d',
      [FDoc.DocType, FDocId]
   );
   if not chbShowAllSign.Checked then begin
      if FSignMan>0 then begin
         Result:=Result+' and d.SIGN_MAN='+IntToStr(FSignMan);
      end
      else if FSignOrg>0 then begin
         Result:=Result+' and d.SIGN_ORG='+IntToStr(FSignOrg);
      end
      else begin
         Result:=Result+' and d.SIGN_NAME='''+FSignName+'''';
      end;
   end;
   if not chbShowAllAdmProc.Checked then begin
      if FAdmProc>0 then begin
         Result:=Result+' and d.ADM_PROC='+IntToStr(FAdmProc);
      end;
   end;
   //\\
   if FYear<>'' then begin
      Result:=Result+' and year(d.REG_DATE)='+FYear;
   end;
   //\\
   if FGroupId<>'' then begin
      Result:=Result+' and d.GROUP_ID='+FGroupId;
   end;
   Result:=Result+' order by d.REG_DATE desc, d.REG_NUM desc';
end;

procedure TfmSelDoc2.OnButtonClick(Sender: TObject; var Handled: Boolean);
begin
//
end;

procedure TfmSelDoc2.SetDBItem(DBItem: TDBItem);
var
   AdmProc: TFieldItem;
begin
   FDBItem:=DBItem;
   //инициализация ADM_PROC
   AdmProc:=FDBItem.FieldList.ByName('ADM_PROC');
   AdmProc.LinkSpr.GetKeyPickList(dcAdmProc.KeyItems, dcAdmProc.Items, AdmProc.LinkSpr.PickFieldNames);
   dcAdmProc.DropDownBox.Rows:=dcAdmProc.KeyItems.Count;
   dcAdmProc.Value:=FAdmProc;
end;

procedure TfmSelDoc2.dcAdmProcEditClick(Sender: TObject; var Handled: Boolean);
var
   KeyValue: string;
   AdmProc: TFieldItem;
begin
   //инициализация SUBJ_ID
   AdmProc:=FDBItem.FieldList.ByName('ADM_RPOC');
   KeyValue:='';
   if dcAdmProc.Value<>Null then begin
      KeyValue:=dcAdmProc.Value;
   end;
   if SelectSprValue(AdmProc.LinkSpr, KeyValue, AdmProc.LinkSpr.CodeFieldName) then begin
      dcAdmProc.Value:=KeyValue;
   end;
   Handled:=True;
end;

end.
