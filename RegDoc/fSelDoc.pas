unit fSelDoc; // форма выбора предыдущего зарегистрированного обращения
interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Grids, DBGridEh, DB, AdsTable, adsdata, adsfunc,
   DBCtrlsEh, Mask, DBLookupEh, fSprEdit, mDRecInt,
   mAdsObj;

type
   TfmSelDoc=class(TForm)
      btCancel: TButton;
      btOk: TButton;
      dsoSelDoc: TDataSource;
      dgSelDoc: TDBGridEh;
      gbFilter: TGroupBox;
      chbShowAllSubj: TCheckBox;
      chbShowAllDoc: TCheckBox;
      laSignName: TLabel;
      laSubjId: TLabel;
      dlSubjId: TDBLookupComboboxEh;
      dlSignName: TDBLookupComboboxEh;
      dsoSignName: TDataSource;
      laYear: TLabel;
      dcYear: TDBComboBoxEh;
      laGroup: TLabel;
      dcGroup: TDBComboBoxEh;
      procedure dgSelDocDblClick(Sender: TObject);
      procedure OnFilterChange(Sender: TObject);
      procedure OnButtonClick(Sender: TObject; var Handled: Boolean);
      procedure dlSubjIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
   private
      quSelDoc: TAdsQuery;
      quSignName: TAdsQuery;
      FDoc: TDBDocument;
      FDBItem: TDBItem;
      FDocId: Integer;
      FSignMan: Integer;
      FSignOrg: Integer;
      FSubjId: Integer;
      FYear: string;
      FGroupId: string;
      FSignType: Integer;
      FSignKind: Integer;
      FSignName: string;
      FDatabaseName: string;
   private
      function GetSQL: string;
      procedure SetDBItem(DBItem: TDBItem);
   end;

// NB:!!! SignName не используется
function SelectDocument(Doc: TDBDocument; var Query: TAdsQuery; Bookmark: TStringList): Boolean;

implementation

{$R *.dfm}

function SelectDocument(Doc: TDBDocument; var Query: TAdsQuery; Bookmark: TStringList): Boolean;
var
   I: Integer;
begin
   Result:=False;
   Query:=nil;
   with TfmSelDoc.Create(nil) do begin
      quSelDoc:=TAdsQuery.Create(nil);
      quSignName:=TAdsQuery.Create(nil);
      try
         FDoc:=Doc;
         FDocId:=Doc.GetDocId;
         FSignMan:=Doc.DBItem.EditTable.FieldByName('SIGN_MAN').AsInteger;
         FSignOrg:=Doc.DBItem.EditTable.FieldByName('SIGN_ORG').AsInteger;
         FSubjId:=Doc.DBItem.EditTable.FieldByName('SUBJ_ID').AsInteger;
         FSignType:=Doc.DBItem.EditTable.FieldByName('SIGN_TYPE').AsInteger;
         FSignKind:=Doc.DBItem.EditTable.FieldByName('SIGN_KIND').AsInteger;
         FSignName:=Doc.DBItem.EditTable.FieldByName('SIGN_NAME').AsString;
         FDatabaseName:=Doc.DBItem.DatabaseName;
         dsoSelDoc.DataSet:=quSelDoc;
         ConfigGridColumn(dgSelDoc, [
            'REG_NUM',     'Регистрация|№ п/п', 40,
            'REG_DATE',    'Регистрация|Дата ', 65,
            'REG_IND',     'Регистрация|Индекс', 50,
            'SIGN_NAME',   'Заявитель', 150,
            'IS_REPEAT',   'Обращение|Повторно', 60,
            'REPEAT_TEXT', 'Обращение|Даты, индексы повторных обращений', 130,
            'SUBJ_NAME',   'Обращение|Тематика', 155,
            'CONTENT',     'Обращение|Краткое содержание', 155
         ]);
         quSignName.DatabaseName:=FDatabaseName;
         if FSignKind=skUL then begin
            quSignName.SQL.Text:=Format('select distinct SIGN_NAME as NAME, isnull(SIGN_ORG, -1) as ID from DOCMAIN where DOC_TYPE=%d and SIGN_KIND=%d and SIGN_NAME is not null', [FDoc.DocType, skUL]);
         end
         else if FSignType=stIndividual then begin
            quSignName.SQL.Text:=Format('select distinct SIGN_NAME as NAME, isnull(SIGN_MAN, -1) as ID from DOCMAIN where DOC_TYPE=%d and SIGN_TYPE=%d and SIGN_KIND in (%d, %d) and SIGN_NAME is not null', [FDoc.DocType, stIndividual, skMan, skIP]);
         end
         {--
         if FSignType in [stIndividual, skIP] then begin
            quSignName.SQL.Text:=Format('select distinct SIGN_NAME as NAME, isnull(SIGN_MAN, -1) as ID from DocMain where DOC_TYPE=%d and SIGN_TYPE in (%d, %d) and SIGN_NAME is not null', [FDoc.DocType, stIndividual, skIP]);
         end
         else if FSignType in [skUL] then begin
            quSignName.SQL.Text:=Format('select distinct SIGN_NAME as NAME, isnull(SIGN_ORG, -1) as ID from DocMain where DOC_TYPE=%d and SIGN_TYPE in (%d) and SIGN_NAME is not null', [FDoc.DocType, skUL]);
         end
         --}
         else begin
            quSignName.SQL.Text:=Format('select distinct SIGN_NAME as NAME, -1 as ID from DOCMAIN where DOC_TYPE=%d and SIGN_NAME is not null', [FDoc.DocType]);
         end;
         quSignName.Open;
         dsoSignName.DataSet:=quSignName;
         //
         dlSignName.Value:=FSignName;
         {--
         if FSignMan>0 then begin
            quSignName.Locate('ID', FSignMan, []);
         end
         else if FSignOrg>0 then begin
            quSignName.Locate('ID', FSignOrg, []);
         end
         else begin
            quSignName.Locate('NAME', FSignName, []);
         end;
         --}
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
         dlSubjId.OnChange:=OnFilterChange;
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
         dlSubjId.OnChange:=nil;
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

procedure TfmSelDoc.dgSelDocDblClick(Sender: TObject);
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

procedure TfmSelDoc.OnFilterChange(Sender: TObject);
begin
   //SUBJ_ID
   if VarIsNull(dlSubjId.Value) then begin
      FSubjId:=0;
   end
   else begin
      FSubjId:=dlSubjId.Value;
   end;
   //SIGN_NAME
   if FSignKind=skUL then begin
      FSignMan:=-1;
      FSignOrg:=quSignName.FieldByName('ID').AsInteger;
   end
   else if FSignType=stIndividual then begin
      FSignMan:=quSignName.FieldByName('ID').AsInteger;
      FSignOrg:=-1;
   end
   else begin
      FSignMan:=-1;
      FSignOrg:=-1;
   end;
   {--
   case FSignType of
      //индивидуальное
      stIndividual,
      //индивидуальное: ИП
      skIP: begin
         FSignMan:=quSignName.FieldByName('ID').AsInteger;
         FSignOrg:=-1;
      end;
      //индивидуальное: ЮЛ
      skUL: begin
         FSignMan:=-1;
         FSignOrg:=quSignName.FieldByName('ID').AsInteger;
      end;
   else
      FSignMan:=-1;
      FSignOrg:=-1;
   end;
   --}
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

function TfmSelDoc.GetSQL: string;
begin
   Result:=Format(
      'select '+
      '   d.DOC_ID, d.DOC_TYPE, d.GROUP_ID, d.GROUP_KIND, d.REG_DATE, d.REG_NUM, d.REG_IND, d.SIGN_NAME, d.IS_REPEAT, d.REPEAT_TEXT, d.SUBJ_ID, d.CONTENT, '+
      '   sp.NAME as SUBJ_NAME '+
      'from DOCMAIN d '+
      '   left join SprDocSubj sp on sp.ID=d.SUBJ_ID '+
      'where d.DOC_TYPE=%d and d.DOC_ID<>%d',
      [FDoc.DocType, FDocId]
   );
   //\\
   if not chbShowAllDoc.Checked then begin
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
   //\\
   if not chbShowAllSubj.Checked then begin
      if FSubjId>0 then begin
         Result:=Result+' and d.SUBJ_ID='+IntToStr(FSubjId);
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

procedure TfmSelDoc.OnButtonClick(Sender: TObject; var Handled: Boolean);
begin
//
end;

procedure TfmSelDoc.SetDBItem(DBItem: TDBItem);
var
   SubjId: TFieldItem;
begin
   FDBItem:=DBItem;
   //инициализация SUBJ_ID
   SubjId:=FDBItem.FieldList.ByName('SUBJ_ID');
   dlSubjId.ListSource:=SubjId.LinkSpr.TableSource;
   dlSubjId.KeyField:=SubjId.LinkSpr.CodeFieldName;
   dlSubjId.ListField:=SubjId.LinkSpr.NameFieldName;
   dlSubjId.Value:=FSubjId;
end;

procedure TfmSelDoc.dlSubjIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
   KeyValue: string;
   SubjId: TFieldItem;
begin
   //инициализация SUBJ_ID
   SubjId:=FDBItem.FieldList.ByName('SUBJ_ID');
   KeyValue:='';
   if dlSubjId.Value<>Null then begin
      KeyValue:=dlSubjId.Value;
   end;
   if SelectSprValue(SubjId.LinkSpr, KeyValue, SubjId.LinkSpr.CodeFieldName) then begin
      dlSubjId.Value:=KeyValue;
   end;
   Handled:=True;
end;

end.
