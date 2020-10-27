unit fEdVBook;
interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, mAdsObj, mDRecInt, DBGridEh, DBCtrlsEh, DBLookupEh, fSprEdit,
   ActnList, ImgList, Menus, ComCtrls, ToolWin, StdCtrls, Mask, ExtCtrls,
   Buttons, DB, dDocImg;

type
   TfmEdVBook=class(TForm)
      tbaEditRec: TToolBar;
      tbPreview: TToolButton;
      tbPrint: TToolButton;
      tbWord: TToolButton;
      tbSep2: TToolButton;
      tbOk: TToolButton;
      tbSep1: TToolButton;
      tbCancel: TToolButton;
      pmWord: TPopupMenu;
      alEditRec: TActionList;
      acOk: TAction;
      acWorkAdd: TAction;
      acCancel: TAction;
      acWorkDel: TAction;
      acWorkEdit: TAction;
      acWorkUp: TAction;
      acWorkDown: TAction;
      acPreview: TAction;
      acPrint: TAction;
      acWord: TAction;
      laGroup04: TLabel;
      bv04: TBevel;
      laVisitMan: TLabel;
      dcVisitMan: TDBComboBoxEh;
      laVisitDate: TLabel;
      deVisitDate: TDBDateTimeEditEh;
      laVisitChief: TLabel;
      chbVisitChief: TDBCheckBoxEh;
      laVisitOut: TLabel;
      chbVisitOut: TDBCheckBoxEh;
      laGroup01: TLabel;
      bv01: TBevel;
      laGroup02: TLabel;
      bv02: TBevel;
      laSignGroup: TLabel;
      dcSignGroup: TDBComboBoxEh;
      laSignName: TLabel;
      deSignName: TDBEditEh;
      laAdrText: TLabel;
      deAdrText: TDBEditEh;
      laAdrNote: TLabel;
      deAdrNote: TDBEditEh;
      laAdrPhone: TLabel;
      deAdrPhone: TDBEditEh;
      laSignPlace: TLabel;
      dlSignPlace: TDBLookupComboboxEh;
      laAdrIn: TLabel;
      chbAdrIn: TDBCheckBoxEh;
      laGroup03: TLabel;
      bv03: TBevel;
      laAppKind: TLabel;
      dcAppKind: TDBComboBoxEh;
      laSubjId: TLabel;
      dlSubjId: TDBLookupComboboxEh;
      laContent: TLabel;
      deContent: TDBEditEh;
      laGroup05: TLabel;
      laAnsKind: TLabel;
      dcAnsKind: TDBComboBoxEh;
      laAnsText: TLabel;
      dcAnsText: TDBEditEh;
      bv05: TBevel;
      deVisitNum: TDBNumberEditEh;
      laVisitNum: TLabel;
      laVisitPlan: TLabel;
      deVisitPlan: TDBDateTimeEditEh;
      laGroup06: TLabel;
      bv06: TBevel;
      laRegNum: TLabel;
      deRegNum: TDBNumberEditEh;
      laRegInd: TLabel;
      deRegInd: TDBEditEh;
      laExecMan: TLabel;
      dcExecMan: TDBComboBoxEh;
      btVisit: TBitBtn;
      tbVisit: TToolButton;
      acVisit: TAction;
      deVisitTime: TDBDateTimeEditEh;
      laPlanDate: TLabel;
      dePlanDate: TDBDateTimeEditEh;
      dePlanTime: TDBDateTimeEditEh;
      //  событи€: создать/удалить форму
      procedure FormCreate(Sender: TObject);
      // событи€: действи€
      procedure acOkExecute(Sender: TObject);
      procedure acCancelExecute(Sender: TObject);
      procedure deSignNameEditButtonClick(Sender: TObject; var Handled: Boolean);
      procedure deSignNameClearButtonClick(Sender: TObject; var Handled: Boolean);
      procedure deAdrTextEditButtonClick(Sender: TObject; var Handled: Boolean);
      procedure acVisitExecute(Sender: TObject);
      procedure btVisitClick(Sender: TObject);
      procedure chbAdrInClick(Sender: TObject);
   published
      //—ќЅџ“»я:
      procedure OnButtonClick(Sender: TObject; var Handled: Boolean);
      procedure OnGridButtonClick(Sender: TObject; var Handled: Boolean);
   private
      FDoc: TVisitBook;
      // массивы управл€ющих элемнтов дл€ отдельных групп реквизитов
      FGroup06Control: TControlArray;
   private
      procedure SetControl;
      procedure ResetControl;
      procedure UpdateEnabledAction;
      procedure InvokeControlEvent;
      //
      procedure UpdateAppForm(AppForm: Integer);
      procedure UpdateSignName;
   end;

function EditVisitBook(Doc: TVisitBook): Boolean;

implementation
uses
   mDoc2Sel;

{$R *.dfm}

function EditVisitBook(Doc: TVisitBook): Boolean;
//var
//   Res: Integer;
begin
   //Result:=False;
   with TfmEdVBook.Create(nil) do begin
      try
         FDoc:=Doc;
         SetControl;
         InvokeControlEvent;
         UpdateEnabledAction;
//         Res:=ShowModal;
//         if (Res=mrOk) and FDoc.CanSave then begin
            // NB: ??? а если только список отредактировать
            //DBItem.EditTable.CheckBrowseMode;
            Result:=True;
//         end;
      finally
         ResetControl;
         Free;
      end;
   end;
end;

{ TfmEdVBook }

procedure TfmEdVBook.SetControl;
begin
   // установка режима редактировани€
   if FDoc.ViewMode=vmEdit then begin
      FDoc.DBItem.EditTable.Edit;
   end;
   // св€зь элементом редактирован€ с пол€ми таблицы
   FDoc.DBAware.BuildControlList(FDoc.DBItem, Self);
   FDoc.DBAware.ConfigControlList(FDoc.ViewMode, OnButtonClick, nil, nil);
   FDoc.DBAware.SetFirstEditableFocus(Self);
   // обновление состо€ние кнопок
   UpdateAppForm(FDoc['APP_FORM'].AsInteger);
   UpdateSignName;
end;

procedure TfmEdVBook.FormCreate(Sender: TObject);
begin
   InitControlArray(FGroup06Control, [
      laGroup06, bv06, laRegNum, deRegNum, laRegInd, deRegInd, laExecMan,
      dcExecMan, btVisit
   ]);
end;

procedure TfmEdVBook.OnButtonClick(Sender: TObject; var Handled: Boolean);
var
   DBEdit: TDBEditEh;
   DBLookup: TDBLookupComboboxEh;
   FieldItem: TFieldItem;
   KeyValue: string;
begin
   //NB: что бы не копировать из формы в форму - Ќ”∆≈Ќ стандартный метод
   if ActiveControl is TDBEditEh then begin
      DBEdit:=ActiveControl as TDBEditEh;
      FieldItem:=TFieldItem(DBEdit.Tag);
      if (FieldItem<>nil) and (FieldItem.LinkStyle=lsLinkSpr) and (FieldItem.LinkSpr<>nil) then begin
         KeyValue:=FieldItem.DestField.AsString;
         if SelectSprValue(FieldItem.LinkSpr, KeyValue, FieldItem.LinkSpr.CodeFieldName) then begin
            if FieldItem.CanEdit then begin
               FieldItem.DBItem.EditTable.Edit;
               FieldItem.DestField.AsString:=KeyValue;
            end;
         end;
      end;
   end
   else if ActiveControl is TDBLookupComboboxEh then begin
      DBLookup:=ActiveControl as TDBLookupComboboxEh;
      FieldItem:=FDoc.DBItem.FieldList.ByName(DBLookup.DataField);
      if FieldItem<>nil then begin
         FieldItem:=FDoc.DBItem.FieldList.ByName(FieldItem.LookupFieldName);
         if (FieldItem<>nil) and (FieldItem.LinkStyle=lsLinkSpr) and (FieldItem.LinkSpr<>nil) then begin
            KeyValue:=FieldItem.DestField.AsString;
            if SelectSprValue(FieldItem.LinkSpr, KeyValue, FieldItem.LinkSpr.CodeFieldName) then begin
               if FieldItem.CanEdit then begin
                  FieldItem.DBItem.EditTable.Edit;
                  FieldItem.DestField.AsString:=KeyValue;
               end;
            end;
         end;
      end;
   end;
   Handled:=True;
end;

procedure TfmEdVBook.OnGridButtonClick(Sender: TObject; var Handled: Boolean);
begin

end;

procedure TfmEdVBook.UpdateEnabledAction;
begin

end;

procedure TfmEdVBook.ResetControl;
begin
   FDoc.DBAware.ClearControlList;
end;

procedure TfmEdVBook.acOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfmEdVBook.acCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmEdVBook.deSignNameEditButtonClick(Sender: TObject; var Handled: Boolean);
begin
   //NB: !!! вынести в отдельный модуль (повтор)
   if Doc2Sel.SelectMan then begin
      FDoc['SIGN_ORG'].AsInteger:=-1;
      FDoc['SIGN_MAN'].AsInteger:=Doc2Sel.SignId;
      FDoc['ADR_ID'].AsInteger:=Doc2Sel.SignAdresId;
      FDoc['SIGN_NAME'].AsString:=Doc2Sel.SignName;
      FDoc['SIGN_PLACE'].AsInteger:=Doc2Sel.SignPlaceId;
      FDoc['ADR_TEXT'].AsString:=Doc2Sel.SignAdres;
      FDoc['ADR_PHONE'].AsString:=Doc2Sel.SignTelefon;
      FDoc['ADR_IN'].AsBoolean:=Doc2Sel.SignAdresId>0;
      UpdateSignName;
   end;
end;

procedure TfmEdVBook.deSignNameClearButtonClick(Sender: TObject; var Handled: Boolean);
begin
   //удалить ссылку на за€вител€ (гражданина или организацию)
   FDoc['SIGN_ORG'].AsInteger:=-1;
   FDoc['SIGN_MAN'].AsInteger:=-1;
   FDoc['SIGN_NAME'].AsString:='';
   UpdateSignName;
end;

procedure TfmEdVBook.deAdrTextEditButtonClick(Sender: TObject; var Handled: Boolean);
begin
   //NB: !!! вынести в отдельный модуль (повтор)
   if Doc2Sel.SelectAdres then begin
      FDoc['ADR_ID'].AsInteger:=Doc2Sel.SignAdresId;
      FDoc['ADR_TEXT'].AsString:=Doc2Sel.SignAdres;
      FDoc['ADR_IN'].AsBoolean:=Doc2Sel.SignAdresId>0;
      FDoc['SIGN_PLACE'].AsInteger:=Doc2Sel.SignPlaceId;
   end;
end;

procedure TfmEdVBook.UpdateSignName;
begin
   if FDoc['SIGN_MAN'].AsInteger>0 then begin
      deSignName.Font.Style:=[fsBold];
      deSignName.ReadOnly:=True;
   end
   else begin
      deSignName.ReadOnly:=False;
      deSignName.Font.Style:=[];
   end;
end;

procedure TfmEdVBook.UpdateAppForm(AppForm: Integer);
begin
   {--
   if AppForm=stVisit then begin
      SetControlVisible(FGroup06Control, True);
      tbVisit.Down:=True;
   end
   else begin
      SetControlVisible(FGroup06Control, False);
      tbVisit.Down:=False;
   end;
   --}
end;

procedure TfmEdVBook.acVisitExecute(Sender: TObject);
var
   AppForm: TField;
begin
   AppForm:=FDoc['APP_FORM'];
   // на личном приеме прин€ли за€вление
   {--
   if AppForm.AsInteger=stVisit then begin
      AppForm.AsInteger:=stVerbal;
   end
   else begin
      AppForm.AsInteger:=stVisit;
   end;
   --}
   UpdateAppForm(AppForm.AsInteger);
end;

procedure TfmEdVBook.btVisitClick(Sender: TObject);
var
   KeyValues: string;
   DocItem: TDBItem;
begin
   if not FDoc.DBItem.IsEmpty(skView) then begin
      KeyValues:=FDoc.DBItem.GetKeyValues(skView);
      if KeyValues<>'' then begin
         DocItem:=FDoc.RecInt.DocDBItems.ByName('DOC_MAIN');
         DocItem.EditRecord(KeyValues);
         if DocItem.DoViewRecord(vmEdit) then begin
            DocItem.ApplyEdit(KeyValues);
         end
         else begin
            DocItem.CancelEdit;
         end;
      end;
   end;
end;

procedure TfmEdVBook.chbAdrInClick(Sender: TObject);
begin
   laSignPlace.Enabled:=chbAdrIn.Checked;
   dlSignPlace.Enabled:=chbAdrIn.Checked;
end;

procedure TfmEdVBook.InvokeControlEvent;
begin
   chbAdrInClick(nil);
end;

end.
