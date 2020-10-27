// диалог добавлени€ графы
unit fGrpAdd; // group field column add [30.08.2005]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   {$IFDEF VER150} Variants, {$ENDIF} 
   StdCtrls, mFindInt, Db, DBLookupEh, DBCtrlsEh, Mask, CheckLst, ExtCtrls;

type
   TfmGrpAdd = class(TForm)
      btOk: TButton;
      btCancel: TButton;
      laOper: TLabel;
      laFirst: TLabel;
      bvOper: TBevel;
      laSecond: TLabel;
      laValue: TLabel;
      chbSpr: TCheckListBox;
      cbOper: TComboBox;
      edString: TEdit;
      chbIgnoreCase: TCheckBox;
      cbBoolean: TComboBox;
      edNumber: TDBNumberEditEh;
      edDate: TDBDateTimeEditEh;
      chbParam: TCheckBox;
      cbCombo: TComboBox;
      edSpr: TDBEditEh;
      stSpr: TStaticText;
      dbCombo: TDBLookupComboboxEh;
      edDate2: TDBDateTimeEditEh;
      edNumber2: TDBNumberEditEh;
      edSpr2: TDBEditEh;
      chbNeedValue: TCheckBox;
      dsoCombo: TDataSource;
      laField: TLabel;
      laCaption: TLabel;
      bvField: TBevel;
      cbMonth: TComboBox;
      cbMonth2: TComboBox;
      laDatePart: TLabel;
      bvDatePart: TBevel;
      laZero: TLabel;
      laAge1: TLabel;
      laAge2: TLabel;
      cbDatePart: TComboBox;
      edAgeDate: TDBDateTimeEditEh;
      edAgeNumber: TDBNumberEditEh;
      edAgeNumber2: TDBNumberEditEh;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure cbOperChange(Sender: TObject);
      procedure edStringChange(Sender: TObject);
      procedure cbBooleanChange(Sender: TObject);
      procedure cbKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure edDateChange(Sender: TObject);
      procedure edSprChange(Sender: TObject);
      procedure edSprDblClick(Sender: TObject);
      procedure edSpr2DblClick(Sender: TObject);
      procedure edSpr2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure chbSprClickCheck(Sender: TObject);
      procedure chbSprDblClick(Sender: TObject);
      procedure cbComboChange(Sender: TObject);
      procedure edNumberChange(Sender: TObject);
      procedure dbComboChange(Sender: TObject);
      procedure chbParamClick(Sender: TObject);
      procedure chbIgnoreCaseClick(Sender: TObject);
      procedure edSprEditButtons0Click(Sender: TObject; var Handled: Boolean);
      procedure edSpr2EditButtons0Click(Sender: TObject; var Handled: Boolean);
      procedure cbMonthChange(Sender: TObject);
      procedure cbDatePartChange(Sender: TObject);
   private
      FField: TFindFieldItem;
      FFilterInterface: TFilterInterface;
      FFindItem: TFindItem;
      FControls: TValueControlList;
      FLastValue: string;
      FLastCaption: string;
   private
      procedure SetOperation(Oper: TOperItem);
      procedure InitControls(Field: TFindFieldItem);
      procedure ChangeOper;
      procedure ChangeValue;
      procedure ChangeSprValue;
      procedure ChangeEnabled;
      procedure UpdateButton;
      function CheckFind: Boolean;
      procedure SelectSprValue;
      procedure SelectSprValue2;
      function GetDatePart: TDateKind;
   end;

function AddColumnField(FilterInterface: TFilterInterface; Field: TFindFieldItem; Mode: TDialogMode; var FindItem: TFindItem): Boolean;

implementation
uses
   fFindAdd;
   
{$R *.DFM}

function AddColumnField(FilterInterface: TFilterInterface; Field: TFindFieldItem; Mode: TDialogMode; var FindItem: TFindItem): Boolean;
begin
   Result:=False;
   if (FilterInterface<>nil) and (Field<>nil) then begin
      with TfmGrpAdd.Create(nil) do begin
         try
            FField:=Field;
            FFilterInterface:=FilterInterface;
            if Mode in [dmEdit, dmView] then begin
               if (FindItem<>nil) and (Field=FindItem.Field) then begin
                  FFindItem:=FindItem.Clone;
               end;
            end
            else begin
               FFindItem:=TFindItem.Create(Field, nil, nil, nil, nil, [], False, False, False, dkFull);
            end;
            if FFindItem<>nil then begin
               InitControls(Field);
               FFilterInterface.OperList.FillComboBox(FFilterInterface, Field, cbOper, FFindItem.DatePart);
               if Mode<>dmNew then begin
                  cbOper.ItemIndex:=cbOper.Items.IndexOf(FindItem.Oper.Caption);
                  chbIgnoreCase.Checked:=FFindItem.IgnoreCase;
                  chbParam.Checked:=FFindItem.IsParam;
                  chbNeedValue.Checked:=not FFindItem.NeedValue;
                  FFindItem.Oper:=nil;
               end;
               ChangeOper;
               if ShowModal=mrOk then begin
                  if CheckFind then begin
                     FFindItem.IgnoreCase:=chbIgnoreCase.Checked;
                     FFindItem.IsParam:=chbParam.Checked;
                     FFindItem.NeedValue:=not chbNeedValue.Checked;
                     FFindItem.DatePart:=GetDatePart;
                     FControls.GetFindItemValue(FFilterInterface, FFindItem, FLastValue, FLastCaption);
                     case Mode of
                        dmNew: FindItem:=FFindItem.Clone;
                        dmEdit: FindItem.Assign(FFindItem);
                     end;
                     Result:=True;
                  end;
               end;
            end;
         finally
            FilterInterface.SprList.RestoreIndexName;//ind
            FFindItem.Free;
            Free;
         end;
      end;
   end;
end;

{ TfmGrpAdd }

procedure TfmGrpAdd.InitControls(Field: TFindFieldItem);
var
   BaseTop: Integer;
   BaseLeft: Integer;
   BaseWidth: Integer;
   DY: Integer;   
begin
   laCaption.Caption:=Format('"%s"', [Field.Caption]);
   FControls.AddNew(edString, [fekString], False, True, Field, FFindItem);
   FControls.AddNew(chbIgnoreCase, [fekString], False, False, Field, FFindItem);
   FControls.AddNew(cbBoolean, [fekBoolean], False, True, Field, FFindItem);
   FControls.AddNew(cbMonth, [fekMonth], False, True, Field, FFindItem);
   FControls.AddNew(cbMonth2, [fekMonth], True, True, Field, FFindItem);
   FControls.AddNew(edNumber, [fekFloat, fekNumber, fekList], False, True, Field, FFindItem);
   FControls.AddNew(edNumber2, [fekFloat, fekNumber, fekList], True, True, Field, FFindItem);
   FControls.AddNew(edDate, [fekDate], False, True, Field, FFindItem);
   FControls.AddNew(edDate2, [fekDate], True, True, Field, FFindItem);
   FControls.AddNew(chbSpr, [fekCheckList], False, True, Field, FFindItem);
   FControls.AddNew(cbCombo, [fekComboBox], False, True, Field, FFindItem);
   FControls.AddNew(dbCombo, [fekLookup], False, True, Field, FFindItem);
   FControls.AddNew(stSpr, [fekGridW], False, False, Field, FFindItem);
   FControls.AddNew(edSpr, [fekGridW], False, True, Field, FFindItem);
   FControls.AddNew(edSpr2, [fekGridW2], False, True, Field, FFindItem);
   FControls.AddNew(laAge1, [fekAge], False, False, Field, FFindItem);
   FControls.AddNew(laAge2, [fekAge], False, False, Field, FFindItem);
   FControls.AddNew(edAgeDate, [fekAge], False, True, Field, FFindItem);
   FControls.AddNew(edAgeNumber, [fekAge], False, True, Field, FFindItem);
   FControls.AddNew(edAgeNumber2, [fekAge], True, True, Field, FFindItem);
   FControls.Invisible;
   //++ поддержка поиска по части даты (год, мес€ц, день) 
   if ffkDate in Field.Kinds then begin
      laFirst.Caption:='2.';
      laSecond.Caption:='3.';
      ActiveControl:=cbDatePart;
      //
      if ffkAge in FField.Kinds 
        then cbDatePart.Items.CommaText:=CDatePartName
        else cbDatePart.Items.CommaText:=CDatePartName2;
      cbDatePart.ItemIndex:=MapDatePartIndex[FFindItem.DatePart];
      //
   end
   else begin
      laZero.Visible:=False;
      laDatePart.Visible:=False;
      cbDatePart.Visible:=False;
      bvDatePart.Visible:=False;
      DY:=laFirst.Top-laZero.Top;
      laFirst.Top:=laFirst.Top-DY;
      laOper.Top:=laOper.Top-DY;
      cbOper.Top:=cbOper.Top-DY;
      bvOper.Top:=bvOper.Top-DY;
      laSecond.Top:=laSecond.Top-DY;
      laValue.Top:=laValue.Top-DY;
      edString.Top:=edString.Top-DY;
      chbIgnoreCase.Top:=chbIgnoreCase.Top-DY;
      chbSpr.Top:=chbSpr.Top-DY;
   end;
   //\\
   BaseTop:=edString.Top;
   BaseLeft:=edString.Left;
   BaseWidth:=edString.Width;
   // fekAge
   laAge1.Left:=BaseLeft;
   laAge1.Top:=BaseTop+2;
   edAgeNumber.Left:=laAge1.Left+laAge1.Width+(edAgeDate.Width div 4);
   edAgeNumber.Top:=BaseTop;
   edAgeNumber2.Left:=edAgeNumber.Left+edAgeNumber.Width+(edAgeNumber.Width div 4);
   edAgeNumber2.Top:=BaseTop;
   laAge2.Left:=edAgeNumber2.Left+edAgeNumber.Width+(edAgeDate.Width div 4);
   laAge2.Top:=BaseTop+2;
   edAgeDate.Left:=laAge2.Left+laAge2.Width+(edAgeDate.Width div 4);
   edAgeDate.Top:=BaseTop;
   // fekBoolean
   cbBoolean.Left:=BaseLeft;
   cbBoolean.Top:=BaseTop;
   // fekMonth
   cbMonth.Left:=BaseLeft;
   cbMonth.Top:=BaseTop;
   cbMonth2.Left:=BaseLeft+cbMonth.Width+(cbMonth.Width div 4);
   cbMonth2.Top:=BaseTop;
   //
   edNumber.Left:=BaseLeft;
   edNumber.Top:=BaseTop;
   edNumber2.Left:=BaseLeft+edNumber.Width+(edNumber.Width div 4);
   edNumber2.Top:=BaseTop;
   //
   edDate.Top:=BaseTop;
   edDate.Left:=BaseLeft;
   edDate2.Top:=BaseTop;
   edDate2.Left:=BaseLeft+edDate.Width+(edDate.Width div 4);
   //
   chbSpr.Height:=(chbSpr.Top-BaseTop)+chbSpr.Height;
   chbSpr.Top:=BaseTop;
   //
   cbCombo.Top:=BaseTop;
   cbCombo.Left:=BaseLeft;
   cbCombo.Width:=BaseWidth;
   //
   edSpr.Top:=BaseTop;
   edSpr.Left:=BaseLeft;
   stSpr.Top:=BaseTop+2;
   stSpr.Left:=BaseLeft+edSpr.Width+10;
   //
   edSpr2.Top:=BaseTop;
   edSpr2.Left:=BaseLeft;
   edSpr2.Width:=BaseWidth;
   //
   dbCombo.Top:=BaseTop;
   dbCombo.Left:=BaseLeft;
   dbCombo.Width:=BaseWidth;
end;

procedure TfmGrpAdd.FormCreate(Sender: TObject);
begin
   FControls:=TValueControlList.Create;
   FFindItem:=nil;
   FLastValue:='';
   FLastCaption:='';
   ActivateKeyboardLayout(RUS_LCID, 0);
end;

procedure TfmGrpAdd.FormDestroy(Sender: TObject);
begin
   FControls.Free;
end;

procedure TfmGrpAdd.SetOperation(Oper: TOperItem);
var
   EditKindNew: TFieldEditKind;
   EditKindOld: TFieldEditKind;
   Control: TControl;
   TwoValue: Boolean;
begin
   if FFindItem.Oper<>nil then begin
      FControls.GetFindItemValue(FFilterInterface, FFindItem, FLastValue, FLastCaption);
      EditKindOld:=FFilterInterface.GetEditKind(FFindItem.Oper, FFindItem.Field, GetDatePart);
   end
   else begin
      EditKindOld:=fekNone;
   end;
   if Oper<>nil then begin
      TwoValue:=Oper.TwoValue;
   end
   else begin
      TwoValue:=False;
   end;
   FFindItem.Oper:=Oper;
   EditKindNew:=FFilterInterface.GetEditKind(FFindItem.Oper, FFindItem.Field, GetDatePart);
   if EditKindNew<>EditKindOld then begin
      FControls.InitControl(FFindItem, EditKindNew, FFilterInterface.GetValueSpr(FFindItem.Oper, FFindItem.Field));
      if Oper<>nil then begin
         FControls.SetFindItemValue(FFilterInterface, FFindItem, FLastValue, FLastCaption);
      end;
      Control:=FControls.LastControl(EditKindNew, TwoValue);
      if Control<>nil then begin
         ClientHeight:=ClientHeight-(chbParam.Top-(Control.Top+Control.Height+((laSecond.Top-bvOper.Top) div 2)));
      end;
   end;
   FControls.SetVisible(EditKindNew, TwoValue);
   ChangeEnabled;
   UpdateButton;
end;

procedure TfmGrpAdd.ChangeEnabled;
var
   EditKind: TFieldEditKind;
begin
   if (FFindItem.Oper<>nil) and (FFindItem.Oper.NeedValue) then begin
      EditKind:=FFilterInterface.GetEditKind(FFindItem.Oper, FFindItem.Field, GetDatePart);
      laSecond.Enabled:=True;
      laValue.Enabled:=True;
      chbParam.Enabled:=True;
      chbNeedValue.Enabled:=chbParam.Checked;
      FControls.SetEnable(EditKind, FFindItem.Oper.TwoValue);
      if EditKind=fekString then begin /// !!!! FOper.CaseSensitive
         chbIgnoreCase.Enabled:=not (not FFindItem.Field.CaseSensitive or FFindItem.Field.IsUpper);
      end;
   end
   else begin
      FControls.Disable;
      laSecond.Enabled:=False;
      laValue.Enabled:=False;
      chbParam.Enabled:=False;
      chbNeedValue.Enabled:=False;
   end;
end;

procedure TfmGrpAdd.UpdateButton;
begin
   btOk.Enabled:=CheckFind;
end;

function TfmGrpAdd.CheckFind: Boolean;
begin
   Result:=(FFindItem.Oper<>nil) and (
           (not FFindItem.Oper.NeedValue) or (
           FFindItem.Oper.NeedValue and (
           chbParam.Checked or FControls.IsFindItemValue(FFilterInterface, FFindItem, GetDatePart))));
end;

procedure TfmGrpAdd.ChangeOper;
var
   Oper: TOperItem;
begin
   if cbOper.ItemIndex<>-1 then begin
      Oper:=TOperItem(cbOper.Items.Objects[cbOper.ItemIndex]);
   end
   else begin
      Oper:=nil;
   end;
   SetOperation(Oper);
end;

procedure TfmGrpAdd.cbOperChange(Sender: TObject);
begin
   ChangeOper;
end;

procedure TfmGrpAdd.ChangeValue;
begin
   UpdateButton;
end;

procedure TfmGrpAdd.edStringChange(Sender: TObject);
begin
   ChangeValue;
end;

procedure TfmGrpAdd.cbBooleanChange(Sender: TObject);
begin
   ChangeValue;
end;

procedure TfmGrpAdd.cbKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if Key=VK_DELETE then begin
      TComboBox(Sender).ItemIndex:=-1;
      ChangeValue;
   end;
end;

procedure TfmGrpAdd.edDateChange(Sender: TObject);
begin
   ChangeValue;
end;

procedure TfmGrpAdd.edSprChange(Sender: TObject);
begin
   ChangeSprValue;
end;

procedure TfmGrpAdd.edSprDblClick(Sender: TObject);
begin
   SelectSprValue;
end;

procedure TfmGrpAdd.edSpr2DblClick(Sender: TObject);
begin
   SelectSprValue2;
end;

procedure TfmGrpAdd.edSpr2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if Key=VK_DELETE then begin
      TDBEditEh(Sender).Text:='';
      FLastValue:='';
      FLastCaption:='';
      ChangeValue;
   end;
end;

procedure TfmGrpAdd.chbSprClickCheck(Sender: TObject);
begin
   ChangeValue;
end;

procedure TfmGrpAdd.chbSprDblClick(Sender: TObject);
begin
   if chbSpr.ItemIndex<>-1 then begin
      chbSpr.Checked[chbSpr.ItemIndex]:=not chbSpr.Checked[chbSpr.ItemIndex];
   end;
end;

procedure TfmGrpAdd.cbComboChange(Sender: TObject);
begin
   ChangeValue;
end;

procedure TfmGrpAdd.edNumberChange(Sender: TObject);
begin
   ChangeValue;
end;

procedure TfmGrpAdd.dbComboChange(Sender: TObject);
begin
   ChangeValue;
end;

procedure TfmGrpAdd.chbParamClick(Sender: TObject);
begin
   chbNeedValue.Enabled:=chbParam.Checked;
   ChangeValue;
end;

procedure TfmGrpAdd.chbIgnoreCaseClick(Sender: TObject);
begin
   ChangeValue;
end;

procedure TfmGrpAdd.edSprEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
   SelectSprValue;
end;

procedure TfmGrpAdd.edSpr2EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
   SelectSprValue2;
end;

procedure TfmGrpAdd.ChangeSprValue;
var
   NameField: TField;
   SeekValue: Integer;
   fLocate: Boolean;
   SprItem: TSprItem;
begin
   SprItem:=FFilterInterface.GetValueSpr(FFindItem.Oper, FFindItem.Field);
   if (SprItem<>nil) and (SprItem.DataSet<>nil) then begin
      stSpr.Hint:='';
      if (edSpr.Value=Null) or (edSpr.Value='') then begin
         FLastCaption:='';
         stSpr.Caption:=FLastCaption;
      end
      else begin
         NameField:=SprItem.DataSet.FindField(SprItem.NameFieldName);
         fLocate:=False;
         case FFilterInterface.GetValueKind(FFindItem.Oper, FFindItem.Field) of
            valString: begin
               fLocate:=SprItem.DataSet.Locate(SprItem.KeyFieldName, edSpr.Value, [loCaseInsensitive]);
            end;
            valNumber: begin
               SeekValue:=StrToIntDef(edSpr.Value, -1);
               if SeekValue<>-1 then begin
                  fLocate:=SprItem.DataSet.Locate(SprItem.KeyFieldName, SeekValue, [loCaseInsensitive]);
               end;
            end;
         end;
         if (NameField<>nil) and fLocate then begin
            FLastCaption:=NameField.AsString;
            stSpr.Caption:=FLastCaption;
            stSpr.Hint:=stSpr.Caption;
            stSpr.Font.Style:=[];
         end
         else begin
            FLastCaption:=edSpr.Value;
            stSpr.Caption:='<нет в справочнике>';
            stSpr.Font.Style:=[fsBold];
         end;
      end;
   end;
   ChangeValue;
end;

procedure TfmGrpAdd.SelectSprValue;
var
   Val: string;
   ValCaption: string;
   SprItem: TSprItem;
begin
   SprItem:=FFilterInterface.GetValueSpr(FFindItem.Oper, FFindItem.Field);
   if SprItem<>nil then begin
      if (edSpr.Value<>Null) and (edSpr.Value<>'') then begin
         Val:=edSpr.Value;
      end;
      ValCaption:=FLastCaption;
      SprItem.SetIndexName; //ind
      if FFilterInterface.SelectFindValue(SprItem, Val, ValCaption) then begin
         edSpr.Value:=Val;
         FLastCaption:=ValCaption;
      end;
   end;
end;

procedure TfmGrpAdd.SelectSprValue2;
var
   Val: string;
   ValCaption: string;
   SprItem: TSprItem;
begin
   SprItem:=FFilterInterface.GetValueSpr(FFindItem.Oper, FFindItem.Field);
   if SprItem<>nil then begin
      if (edSpr2.Value<>Null) and (edSpr2.Value<>'') then begin
         ValCaption:=edSpr2.Text;
      end;
      Val:=FLastValue;
      SprItem.SetIndexName; //ind
      if FFilterInterface.SelectFindValue(SprItem, Val, ValCaption) then begin
         edSpr2.Text:=ValCaption;
         FLastValue:=Val;
         FLastCaption:=ValCaption;
      end;
      ChangeValue;
   end;
end;

procedure TfmGrpAdd.cbMonthChange(Sender: TObject);
begin
   ChangeValue;
end;

procedure TfmGrpAdd.cbDatePartChange(Sender: TObject);
begin
//--   InitValueView(FField, FFilterInterface);
   FFilterInterface.OperList.FillComboBox(FFilterInterface, FField, cbOper, GetDatePart);
   FControls.Invisible;
   // [!] NB: не знаю точно какие тут вызывать функции
   SetOperation(nil);
   //
//--   ChangeEnabled;
//--   ChangeText;
end;

function TfmGrpAdd.GetDatePart: TDateKind;
begin
   Result:=MapIndexDatePart[cbDatePart.ItemIndex];
end;

end.
