unit fSelDoc3; // ����� ������ �� ������� ����������� �������� ����������
interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Grids, DBGridEh, DB, AdsTable, adsdata, adsfunc,
   DBCtrlsEh, Mask, DBLookupEh, fSprEdit, mDRecInt,
   mAdsObj;

type
   TfmSelDoc3=class(TForm)
      btCancel: TButton;
      btOk: TButton;
      dsoSelDoc: TDataSource;
      dgSelDoc: TDBGridEh;
      gbFilter: TGroupBox;
      chbShowAllSubj: TCheckBox;
      chbShowAllSign: TCheckBox;
      laSignName: TLabel;
      laSubjId: TLabel;
      dlSignName: TDBLookupComboboxEh;
      dsoSignName: TDataSource;
      laYear: TLabel;
      dcYear: TDBComboBoxEh;
      laGroup: TLabel;
      dcGroup: TDBComboBoxEh;
      dlSubjId: TDBLookupComboboxEh;
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
      FDatabaseName: string;
      FSignOrg: Integer;
      FSubjId: Integer;
      FYear: string;
      FGroupId: string;
   private
      function GetSQL: string;
      procedure SetDBItem(DBItem: TDBItem);
   end;

function SelectDocument3(Doc: TDBDocument; var Query: TAdsQuery; Bookmark: TStringList): Boolean;

implementation

{$R *.dfm}

function SelectDocument3(Doc: TDBDocument; var Query: TAdsQuery; Bookmark: TStringList): Boolean;
var
   I: Integer;
begin
   Result:=False;
   Query:=nil;
   with TfmSelDoc3.Create(nil) do begin
      quSelDoc:=TAdsQuery.Create(nil);
      quSignName:=TAdsQuery.Create(nil);
      try
         FDoc:=Doc;
         FDocId:=Doc.GetDocId;
         FDatabaseName:=Doc.DBItem.DatabaseName;
         //�������������
         FSignOrg:=Doc.DBItem.EditTable.FieldByName('SIGN_ORG').AsInteger;
         quSignName.DatabaseName:=FDatabaseName;
         quSignName.SQL.Text:=Format(
            'select NAME, ID from ������������� where ID in ( '+
            '   select distinct SIGN_ORG from DOCMAIN where DOC_TYPE=%d and SIGN_ORG is not null '+
            ') order by NAME ', [gtIncoming]
         );
         quSignName.Open;
         dsoSignName.DataSet:=quSignName;
         dlSignName.Value:=FSignOrg;
         //��������
         FSubjId:=0;
         //������ ����� �����������
         FYear:='';
         dcYear.Items.Add('<���>');
         dcYear.KeyItems.Add('-1');
         FDoc.QueryStringList(
            'select distinct year(REG_DATE) from DocMain '+
            'where DOC_TYPE=%d '+
            'order by 1 desc',
            [gtIncoming],
            dcYear.Items
         );
         dcYear.KeyItems.Assign(dcYear.Items);
         dcYear.ItemIndex:=0;
         dcYear.OnChange:=OnFilterChange;
         //������ ����� ����������
         FGroupId:='';
         dcGroup.Items.Add('<���>');
         dcGroup.KeyItems.Add('-1');
         FDoc.QueryStringLists(
            'select sp.ID, sp.%s from ('+
            '   select distinct GROUP_ID from DocMain where DOC_TYPE=%d '+
            ') d '+
            'left join SprDocGroup sp on sp.ID=d.GROUP_ID '+
            'order by sp.N_ORDER',
            [FDoc.DBItem.FieldList.ByName('GROUP_ID').LinkSpr.NameFieldName, gtIncoming],
            dcGroup.KeyItems,
            dcGroup.Items
         );
         dcGroup.ItemIndex:=0;
         dcGroup.OnChange:=OnFilterChange;
         SetDropDownWidth(dcGroup);
         //�������� ���������
         dsoSelDoc.DataSet:=quSelDoc;
         ConfigGridColumn(dgselDoc, [
            'REG_NUM',     '�����������|� �/�', 40,
            'REG_DATE',    '�����������|���� ', 65,
            'REG_IND',     '�����������|������', 50,
            'SIGN_NAME',   '�������������', 150,
            'DOC_DATE',    '���� ���������', 65,
            'DOC_IND',     '������ ���������������', 50,
            'CONTENT',     '������� ���������� ��� ���������', 150,
            'SUBJ_NAME',   '��������', 155
         ]);
         quSelDoc.DatabaseName:=FDatabaseName;
         quSelDoc.SQL.Text:=GetSQL;
         quSelDoc.Open;
         //
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

procedure TfmSelDoc3.dgSelDocDblClick(Sender: TObject);
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

procedure TfmSelDoc3.OnFilterChange(Sender: TObject);
begin
   //SUBJ_ID
   if VarIsNull(dlSubjId.Value) then begin
      FSubjId:=0;
   end
   else begin
      FSubjId:=dlSubjId.Value;
   end;
   //SIGN_ORG
   FSignOrg:=quSignName.FieldByName('ID').AsInteger;
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
   //������������ ����� ������
   quSelDoc.SQL.Text:=GetSQL;
   quSelDoc.Close;
   quSelDoc.Open;
end;

function TfmSelDoc3.GetSQL: string;
begin
   //������ ��� ��������� �������� ����������
   Result:=Format(
      'select '+
      '   d.DOC_ID, d.DOC_TYPE, d.DOC_DATE, d.DOC_IND, d.GROUP_ID, d.GROUP_KIND, d.REG_DATE, d.REG_NUM, d.REG_IND, '+
      '   d.SIGN_ORG, sp2.NAME AS SIGN_NAME, d.CONTENT, d.SUBJ_ID, sp1.NAME as SUBJ_NAME, d.POST_ID '+
      'from DOCMAIN d '+
      '   left join SprDocSubj sp1 on sp1.ID=d.SUBJ_ID '+
      '   left join ������������� sp2 on sp2.ID=d.SIGN_ORG '+
      'where d.DOC_TYPE=%d ',
      [gtIncoming]
   );                                               
   //�� ���� ���������������
   if not chbShowAllSign.Checked then begin
      if FSignOrg>0 then begin
         Result:=Result+' and d.SIGN_ORG='+IntToStr(FSignOrg);
      end;
   end;
   //�� ���� ���������
   if not chbShowAllSubj.Checked then begin
      if FSubjId>0 then begin
         Result:=Result+' and d.SUBJ_ID='+IntToStr(FSubjId);
      end;
   end;
   //�� ����
   if FYear<>'' then begin
      Result:=Result+' and year(d.REG_DATE)='+FYear;
   end;
   //�� ������
   if FGroupId<>'' then begin
      Result:=Result+' and d.GROUP_ID='+FGroupId;
   end;
   //������� ���������
   Result:=Result+' order by d.REG_DATE desc, d.REG_NUM desc';
end;

procedure TfmSelDoc3.OnButtonClick(Sender: TObject; var Handled: Boolean);
begin
//
end;

procedure TfmSelDoc3.SetDBItem(DBItem: TDBItem);
var
   SubjId: TFieldItem;
begin
   FDBItem:=DBItem;
   //������������� SUBJ_ID
   SubjId:=FDBItem.FieldList.ByName('SUBJ_ID');
   dlSubjId.ListSource:=SubjId.LinkSpr.TableSource;
   dlSubjId.KeyField:=SubjId.LinkSpr.CodeFieldName;
   dlSubjId.ListField:=SubjId.LinkSpr.NameFieldName;
   dlSubjId.Value:=FSubjId;
end;

procedure TfmSelDoc3.dlSubjIdEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
   KeyValue: string;
   SubjId: TFieldItem;
begin
   //������������� SUBJ_ID
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
