// форма добавления поля в набор условий для поиска
unit fFindAdd; // add find field [14.09.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   mFindInt, StdCtrls, ComCtrls, ExtCtrls, Mask, DBCtrlsEh, CheckLst, DB, TypInfo,
   {$IFDEF VER150} Variants, {$ENDIF}
   DBLookupEh;

const
   MapDatePartIndex: array [TDateKind] of Integer=(1{dkYear}, 2{dkMonth}, 3{dkDayOfMonth}, 0{dkFull}, 4 {dkCurrentAge}, 5 {dkAge}, 6{dkCurrentAgeMonth}, 7{dkAgeMonth});
   MapIndexDatePart: array [-1..7] of TDateKind=(dkFull, dkFull, dkYear, dkMonth, dkDayOfMonth, dkCurrentAge, dkAge, dkCurrentAgeMonth, dkAgeMonth);
   CDatePartName='"Полная дата","Только год","Только месяц","Только день","Текущий возраст","Возраст на дату","Текущий возраст мес.","Возраст на дату мес."';
   CDatePartName2='"Полная дата","Только год","Только месяц","Только день","Количество лет","Кол-во лет на дату","Кол-во мес.","Кол-во мес. на дату"';

type
   // объект для передачи параметров при редактировании или добавлении условия поиска
   TAddFindFieldParam=class(TObject)
   private
      FField: TFindFieldItem;
      FValue1: TFindValue;               
      FValue2: TFindValue;
      FOperVal: TFindValue;
      FOper: TOperItem;
      FAndOr: Boolean;
      FIgnoreCase: Boolean;
      FIsParam: Boolean;
      FNeedValue: Boolean;
      FStart: Boolean;
      FPlace: TAddPlace;
      FDatePart: TDateKind;
   public
//   (Field: TFindFieldItem; Value1, Value2, OperVal: TFindValue; Oper: TOperItem; AndOr, IgnoreCase, IsParam, NeedValue, Start: Boolean; Place: TAddPlace)
      constructor Create(Field: TFindFieldItem);
      destructor Destroy; override;
   public
      property Field: TFindFieldItem read FField write FField;
      property Value1: TFindValue read FValue1 write FValue1;
      property Value2: TFindValue read FValue2 write FValue2;
      property OperVal: TFindValue read FOperVal write FOperVal;
      property Oper: TOperItem read FOper write FOper;
      property AndOr: Boolean read FAndOr write FAndOr;
      property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase;
      property IsParam: Boolean read FIsParam write FIsParam;
      property NeedValue: Boolean read FNeedValue write FNeedValue;
      property Start: Boolean read FStart write FStart;
      property Place: TAddPlace read FPlace write FPlace;
      property DatePart: TDateKind read FDatePart write FDatePart;
   end;

   TfmAddFnd=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      laOper: TLabel;
      cbOper: TComboBox;
      gbText: TGroupBox;
      reText: TRichEdit;
      laFirst: TLabel;
      bvOper: TBevel;
      laSecond: TLabel;
      laValue: TLabel;
      edString: TEdit;
      chbIgnoreCase: TCheckBox;
      cbBoolean: TComboBox;
      edNumber: TDBNumberEditEh;
      edDate: TDBDateTimeEditEh;
      chbSpr: TCheckListBox;
      bvValue: TBevel;
      laThird: TLabel;
      laAndOr: TLabel;
      rbAnd: TRadioButton;
      rbOr: TRadioButton;
      btFind: TButton;
      chbParam: TCheckBox;
      cbCombo: TComboBox;
      edSpr: TDBEditEh;
      edSpr2: TDBEditEh;
      stSpr: TStaticText;
      dsoCombo: TDataSource;
      dbCombo: TDBLookupComboboxEh;
      edDate2: TDBDateTimeEditEh;
      bvPlace: TBevel;
      laForth: TLabel;
      laAddPlace: TLabel;
      cbPlace: TComboBox;
      edNumber2: TDBNumberEditEh;
      chbNeedValue: TCheckBox;
      laDatePart: TLabel;
      bvDatePart: TBevel;
      cbDatePart: TComboBox;
      laZero: TLabel;
      cbMonth: TComboBox;
      cbMonth2: TComboBox;
      laAge1: TLabel;
      edAgeDate: TDBDateTimeEditEh;
      edAgeNumber: TDBNumberEditEh;
      edAgeNumber2: TDBNumberEditEh;
      laAge2: TLabel;
      procedure cbOperChange(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure edStringChange(Sender: TObject);
      procedure chbIgnoreCaseClick(Sender: TObject);
      procedure cbBooleanChange(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure edNumberChange(Sender: TObject);
      procedure edDateChange(Sender: TObject);
      procedure chbSprClickCheck(Sender: TObject);
      procedure btFindClick(Sender: TObject);
      procedure cbComboChange(Sender: TObject);
      procedure DBEditEh1EditButtons0Click(Sender: TObject; var Handled: Boolean);
      procedure edSprChange(Sender: TObject);
      procedure edSprDblClick(Sender: TObject);
      procedure chbParamClick(Sender: TObject);
      procedure chbSprDblClick(Sender: TObject);
      procedure dbComboChange(Sender: TObject);
      procedure cbKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormDestroy(Sender: TObject);
      procedure edSpr2DblClick(Sender: TObject);
      procedure edSpr2EditButtons0Click(Sender: TObject; var Handled: Boolean);
      procedure edSpr2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure cbDatePartChange(Sender: TObject);
      procedure cbMonthChange(Sender: TObject);
   private
      FFilterInterface: TFilterInterface;
      FField: TFindFieldItem;
      FOper: TOperItem;
      FStart: Boolean;
      FValue1: TFindValue;
      FValue2: TFindValue;
      FOperVal: TFindValue;
      FLastCaption: string;
      FLastValue: string;
      FControls: TValueControlList;
      FEditKind: TFieldEditKind;
   private
      // изменилось условие
      procedure ChangeText;
      //
      procedure SetField(Field: TFindFieldItem; DatePart: TDateKind);
      //
      procedure SetOperation(Oper: TOperItem);
      //
      procedure SetOperations(Edit: Boolean; Field: TFindFieldItem; OperList: TOperList);
      //
      procedure InitValueView(Field: TFindFieldItem; FilterInterface: TFilterInterface);
      //
      procedure SetControlValue(EditKind: TFieldEditKind);
      //
      procedure ChangeEnabled;
      // проверяем правильно ли задано условие
      function CheckFind: Boolean;
      // проверяем доступность конопок
      procedure UpdateButton;
      // есть ли введенное значение
      function IsValue(Field: TFindFieldItem; Oper: TOperItem): Boolean;
      // установить высоту формы
      procedure SetNewHeight(LastTop, LastHeight: Integer);
      //
      procedure SelectValue;
      procedure SelectValue2;
      //
      procedure SetPlaces;
      function GetPlace: TAddPlace;
      //
      function GetValueKind: TFindValueKind;
      //
      function GetValueSpr: TSprItem;
      //
      function GetDatePart: TDateKind;
   end;

//--function AddFindField(New: Boolean; Field: TFindFieldItem; FilterInterface: TFilterInterface; Value1, Value2, OperVal: TFindValue; var Oper: TOperItem; Edit: Boolean; var AndOr, IgnoreCase, IsParam, NeedValue, Start: Boolean; var Place: TAddPlace): Boolean;
function AddFindField(New: Boolean; Edit: Boolean; FilterInterface: TFilterInterface; Param: TAddFindFieldParam): Boolean;

implementation

{$R *.DFM}

function AddFindField(New: Boolean; Edit: Boolean; FilterInterface: TFilterInterface; Param: TAddFindFieldParam): Boolean;
//--function AddFindField(New: Boolean; Field: TFindFieldItem; FilterInterface: TFilterInterface; Value1, Value2, OperVal: TFindValue; var Oper: TOperItem; Edit: Boolean; var AndOr, IgnoreCase, IsParam, NeedValue, Start: Boolean; var Place: TAddPlace): Boolean;
var
   EditKind: TFieldEditKind;
begin
   Result:=False;
   with TfmAddFnd.Create(nil) do begin
      try
         if New then begin
            Caption:='Добавить новое условие';
            gbText.Caption:=' Добавляемое условие: ';
         end
         else begin
            Caption:='Изменить условие';
            gbText.Caption:=' Изменяемое уловие: ';
            laForth.Enabled:=False;
            laAddPlace.Enabled:=False;
            cbPlace.Enabled:=False;
         end;
         FFilterInterface:=FilterInterface;
         FValue1:=Param.Value1;
         FValue2:=Param.Value2;    
         FOperVal:=Param.OperVal;
         SetField(Param.Field, Param.DatePart);
         SetOperations(Edit, Param.Field, FilterInterface.OperList);
         SetPlaces;
         InitValueView(Param.Field, FilterInterface);
         if Edit then begin
            if Param.Oper<>nil then begin
               cbOper.ItemIndex:=cbOper.Items.IndexOf(Param.Oper.Caption);
               {
               if (Oper<>nil) and Oper.OwnValue then begin
                  EditKind:=Oper.GetEditKind(FFilterInterface.SprList);
               end
               else begin
                  EditKind:=FField.GetEditKind(FFilterInterface.SprList);
               end;
               }
               EditKind:=FFilterInterface.GetEditKind(Param.Oper, FField, Param.DatePart);
               SetControlValue(EditKind);
               FControls.SetValue(nil, EditKind, FField, Param.Value1, Param.Value2, Param.OperVal, Param.Oper, FLastValue, FLastCaption, GetValueSpr);
               SetOperation(Param.Oper);
            end;
            rbAnd.Checked:=Param.AndOr;
            rbOr.Checked:=not Param.AndOr;
            chbIgnoreCase.Checked:=Param.IgnoreCase;
            chbParam.Checked:=Param.IsParam;
            chbNeedValue.Checked:=not Param.NeedValue;
         end;
         ChangeEnabled;
         if ShowModal=mrOk then begin
            if CheckFind then begin
               Param.Oper:=FOper;
               //--FControls.InternalGetValue(nil, FEditKind, GetValueKind, FField, Value1, Value2, OperVal, FOper, FLastValue, FLastCaption, GetValueSpr);
               FControls.GetValue(FFilterInterface, nil, FField, Param.Value1, Param.Value2, Param.OperVal, FOper, FLastValue, FLastCaption, GetDatePart);
               Param.AndOr:=rbAnd.Checked;
               if Param.Oper.NeedValue then begin
                  Param.IgnoreCase:=chbIgnoreCase.Checked;
                  Param.IsParam:=chbParam.Checked;
                  Param.NeedValue:=not chbNeedValue.Checked;
               end
               else begin
                  Param.IgnoreCase:=False;
                  Param.IsParam:=False;
                  Param.NeedValue:=False;
               end;
               Param.Start:=FStart;
               Param.Place:=GetPlace;
               Param.DatePart:=GetDatePart;
               Result:=True;
            end;
         end;
      finally
         FFilterInterface.SprList.RestoreIndexName;//ind
         Free;
      end;
   end;
end;

{ TfmAddFnd }

procedure TfmAddFnd.SetField(Field: TFindFieldItem; DatePart: TDateKind);
var
   BaseTop: Integer;
   BaseLeft: Integer;
   BaseWidth: Integer;
   //
   DY: Integer;
begin
   FField:=Field;
   FEditKind:=FField.GetEditKind(FFilterInterface.SprList, DatePart);
   FControls.AddNew(edString, [fekString], False, True, FField, nil);
   FControls.AddNew(chbIgnoreCase, [fekString], False, False, FField, nil);
   FControls.AddNew(cbBoolean, [fekBoolean], False, True, FField, nil);
   FControls.AddNew(cbMonth, [fekMonth], False, True, FField, nil);
   FControls.AddNew(cbMonth2, [fekMonth], True, True, FField, nil);
   FControls.AddNew(edNumber, [fekFloat, fekNumber, fekList], False, True, FField, nil);
   FControls.AddNew(edNumber2, [fekFloat, fekNumber, fekList], True, True, FField, nil);
   FControls.AddNew(edDate, [fekDate], False, True, FField, nil);
   FControls.AddNew(edDate2, [fekDate], True, True, FField, nil);
   FControls.AddNew(chbSpr, [fekCheckList], False, True, FField, nil);
   FControls.AddNew(cbCombo, [fekComboBox], False, True, FField, nil);
   FControls.AddNew(dbCombo, [fekLookup], False, True, FField, nil);
   FControls.AddNew(stSpr, [fekGridW], False, False, FField, nil);
   FControls.AddNew(edSpr, [fekGridW], False, True, FField, nil);
   FControls.AddNew(edSpr2, [fekGridW2], False, True, FField, nil);
   FControls.AddNew(laAge1, [fekAge], False, False, FField, nil);
   FControls.AddNew(laAge2, [fekAge], False, False, FField, nil);
   FControls.AddNew(edAgeDate, [fekAge], False, True, FField, nil);
   FControls.AddNew(edAgeNumber, [fekAge], False, True, FField, nil);
   FControls.AddNew(edAgeNumber2, [fekAge], True, True, FField, nil);
   //++ поддержка поиска по части даты (год, месяц, день)
   if ffkDate in FField.Kinds then begin
      laFirst.Caption:='2.';
      laSecond.Caption:='3.';
      laThird.Caption:='4.';      
      laForth.Caption:='5.';
      ActiveControl:=cbDatePart;
      //
      if ffkAge in FField.Kinds 
        then cbDatePart.Items.CommaText:=CDatePartName
        else cbDatePart.Items.CommaText:=CDatePartName2;
      cbDatePart.ItemIndex:=MapDatePartIndex[DatePart];
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
   //
   ChangeText;
end;

procedure TfmAddFnd.SetOperations(Edit: Boolean; Field: TFindFieldItem; OperList: TOperList);
{
var
   I: Integer;
   Oper: TOperItem;
   Ind: Integer;
   Kinds: TFindFieldKinds;
   RelItem: TRelItem;
   W: Integer;
   MaxW: Integer;
   B: Integer;
}
begin
{
   Kinds:=Field.Kinds;
   OperList.FillStrings(cbOper.Items, Kinds, False, FField.GetMultiSel(FFilterInterface.SprList));
   // растягиваем ComboBox до нужной длины
   B:=GetComboBoxNonTextArea;
   MaxW:=cbOper.Width-B;
   for I:=0 to Pred(cbOper.Items.Count) do begin
      W:=GetTextWidth(cbOper.Items[I], cbOper.Font.Height, cbOper.Font.Name, False);
      if W>MaxW then begin
         MaxW:=W;
      end;
   end;
   cbOper.Width:=MaxW+B;
   // проверяем доступность операций group by
   if Field.RelName<>'' then begin
      RelItem:=FFilterInterface.RelList.ByName(Field.RelName);
      if (RelItem<>nil) and (RelItem.GroupBy='') then begin
          I:=0;
          while I<cbOper.Items.Count do begin
             Oper:=TOperItem(cbOper.Items.Objects[I]);
             if (Oper<>nil) and (Pos('GROUP BY', UpperCase(Oper.SQL))<>0) then begin
                cbOper.Items.Delete(I);
             end
             else begin
                Inc(I);
             end;
          end;
      end;
   end;
   // устанавливаем операцию по умолчанию
   if Field.DefaultOp<>'' then begin
      Oper:=OperList.ByName(Field.DefaultOp);
      if Oper<>nil then begin
         Ind:=cbOper.Items.IndexOfObject(Oper);
         if Ind<>-1 then begin
            cbOper.ItemIndex:=Ind;
            SetOperation(Oper);
         end;
      end;
   end;
   // проверяем ситуацию, когда доступна только одна операция
   if cbOper.Items.Count=1 then begin
      cbOper.ItemIndex:=0;
      SetOperation(TOperItem(cbOper.Items.Objects[0]));
   end;
   cbOper.DropDownCount:=cbOper.Items.Count;
}
   OperList.FillComboBox(FFilterInterface, Field, cbOper, GetDatePart);
   if not Edit and (cbOper.ItemIndex<>-1) then begin
      SetOperation(TOperItem(cbOper.Items.Objects[cbOper.ItemIndex]));
   end;
end;

procedure TfmAddFnd.cbOperChange(Sender: TObject);
var
   Oper: TOperItem;
begin
   if cbOper.ItemIndex<>-1 then begin
      Oper:=TOperItem(cbOper.Items.Objects[cbOper.ItemIndex]);
      SetOperation(Oper);
   end
   else begin
      SetOperation(nil);
   end;
end;

procedure TfmAddFnd.FormCreate(Sender: TObject);
begin
   FField:=nil;
   FOper:=nil;
   FStart:=False;
   ActivateKeyboardLayout(RUS_LCID, 0);
   //
   FControls:=TValueControlList.Create;
end;

procedure TfmAddFnd.SetOperation(Oper: TOperItem);
var
   EditKind: TFieldEditKind;
begin
   if FOper<>nil then begin
      //--FControls.InternalGetValue(nil, FEditKind, GetValueKind, FField, FValue1, FValue2, FOperVal, FOper, FLastValue, FLastCaption, GetValueSpr);
      FControls.GetValue(FFilterInterface, nil, FField, FValue1, FValue2, FOperVal, FOper, FLastValue, FLastCaption, GetDatePart);
   end;
   FOper:=Oper;
   EditKind:=FFilterInterface.GetEditKind(Oper, FField, GetDatePart);
   if EditKind<>FEditKind then begin
      FEditKind:=EditKind;
      SetControlValue(FEditKind);
      if FOper<>nil then begin
         FControls.SetValue(nil, FEditKind, FField, FValue1, FValue2, FOperVal, FOper, FLastValue, FLastCaption, GetValueSpr);
      end;
   end;
   if FOper<>nil then begin
      FControls.SetVisible(FEditKind, FOper.TwoValue);
   end;
{
   if (FOper<>nil) and FOper.OwnValue then begin
      if FOper.GetEditKind(FFilterInterface.SprList)<>FEditKind then begin
         FEditKind:=FOper.GetEditKind(FFilterInterface.SprList);
         SetControlValue(FEditKind);
         FControls.SetValue(nil, FEditKind, FField, FValue1, FValue2, FOperVal, FOper, FLastValue, FLastCaption, GetValueSpr);
         FControls.SetVisible(FEditKind, False);
      end;
   end
   else begin
      if FField.GetEditKind(FFilterInterface.SprList)<>FEditKind then begin
         FEditKind:=FField.GetEditKind(FFilterInterface.SprList);
         SetControlValue(FEditKind);
         if FOper<>nil then begin
            FControls.SetValue(nil, FEditKind, FField, FValue1, FValue2, FOperVal, FOper, FLastValue, FLastCaption, GetValueSpr);
         end;
      end;
      if FOper<>nil then begin
         FControls.SetVisible(FEditKind, FOper.TwoValue);
      end;
   end;
}
   ChangeEnabled;
   ChangeText;
end;

procedure TfmAddFnd.ChangeText;
var
   I: Integer;
   Value,s: string;
begin
   //
   reText.Lines.BeginUpdate;
   try
      reText.Lines.Clear;
      reText.SelAttributes.Style:=[fsBold];
      reText.SelAttributes.Color:=clBlack;
      reText.Font.Height:=Font.Height;
      if FField<>nil then begin
         reText.SelText:='"'+FField.AddCaption+'" ';
         //++ поддержка поиска по части даты
         if (ffkDate in FField.Kinds) and (GetDatePart<>dkFull) then begin
           if ffkAge in FField.Kinds  then s:=CDateKindName[GetDatePart] else s:=CDateKindName2[GetDatePart];
           reText.SelText:=reText.SelText+s+' ';
         end;
         //\\
      end;
      reText.SelAttributes.Style:=[];
      reText.SelAttributes.Color:=clBlue;
      if FOper<>nil then begin
         reText.SelText:=FOper.Caption+' ';
      end
      else begin
         if ffkDate in FField.Kinds then begin
            reText.SelText:='<2. выберите операцию> ';
         end
         else begin
            reText.SelText:='<1. выберите операцию> ';
         end;
      end;
      reText.SelAttributes.Style:=[];
      reText.SelAttributes.Color:=clNavy;
      if FOper=nil then begin
         if ffkDate in FField.Kinds then begin
            reText.SelText:='<3. укажите значение>';
         end
         else begin
            reText.SelText:='<2. укажите значение>';
         end;
      end
      else if (FOper<>nil) and (FOper.NeedValue) then begin
         if FField.GetMultiSel(FFilterInterface.SprList) then begin
            Value:='';
            for I:=0 to Pred(chbSpr.Items.Count) do begin
               if chbSpr.Checked[I] then begin
                  if Value='' then begin
                     Value:='"'+chbSpr.Items[I]+'"';
                  end
                  else begin
                     if FOper.MultiOr then begin
                        Value:=Value+'  ИЛИ  '+'"'+chbSpr.Items[I]+'"';
                     end
                     else begin
                        Value:=Value+'  И  '+'"'+chbSpr.Items[I]+'"';
                     end;
                  end;
               end;
            end;
            if Value<>'' then begin
               Value:=#13#10+Value;
            end;
         end
         else begin
            //--FControls.InternalGetValue(nil, FEditKind, GetValueKind, FField, FValue1, FValue2, FOperVal, FOper, FLastValue, FLastCaption, GetValueSpr);
            FControls.GetValue(FFilterInterface, nil, FField, FValue1, FValue2, FOperVal, FOper, FLastValue, FLastCaption, GetDatePart);
            if FOper.OwnValue then begin
               Value:=FOperVal.GetCaption(chbIgnoreCase.Checked);
            end
            else begin
               Value:=FValue1.GetCaption(chbIgnoreCase.Checked);
            end;
            if FOper.TwoValue then begin
               Value:=Value+' и '+FValue2.GetCaption(chbIgnoreCase.Checked);
            end;
            //++ поддержка поиска возраста на текущую дату
            if (ffkDate in FField.Kinds) and (GetDatePart=dkAge) then begin
               Value:=Value+' на дату '+FOperVal.GetCaption(chbIgnoreCase.Checked);
            end;
            //\\
         end;
         if Value='' then begin
            reText.SelText:='<2. укажите значение>';
         end
         else begin
            reText.SelText:=Value;
         end;
      end;
   finally
      reText.Lines.EndUpdate;
   end;
   UpdateButton;
end;

procedure TfmAddFnd.ChangeEnabled;
begin
   if (FOper<>nil) and (FOper.NeedValue) then begin
      laSecond.Enabled:=True;
      laValue.Enabled:=True;
      chbParam.Enabled:=True;
      chbNeedValue.Enabled:=chbParam.Checked;
      FControls.SetEnable(FEditKind, FOper.TwoValue);
      if FEditKind=fekString then begin // !!!!! FOper.CaseSensitive ???
         chbIgnoreCase.Enabled:=not (not FField.CaseSensitive or FField.IsUpper);
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

procedure TfmAddFnd.edStringChange(Sender: TObject);
begin
   ChangeText;
end;

procedure TfmAddFnd.chbIgnoreCaseClick(Sender: TObject);
begin
   ChangeText;
end;

procedure TfmAddFnd.InitValueView(Field: TFindFieldItem; FilterInterface: TFilterInterface);
var
   Control: TControl;
begin
   FControls.Invisible;
   SetControlValue(FEditKind);
   FControls.SetVisible(FEditKind, False);
   Control:=FControls.LastControl(FEditKind, False);
   if Control<>nil then begin
      SetNewHeight(Control.Top, Control.Height);
   end;
end;

procedure TfmAddFnd.cbBooleanChange(Sender: TObject);
begin
   ChangeText;
end;

procedure TfmAddFnd.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   Combo: TComboBox;
   Edit: TDBDateTimeEditEh;
begin
   if ActiveControl is TComboBox then begin
      Combo:=TComboBox(ActiveControl);
      if Combo.DroppedDown then Exit;
   end;
   if ActiveControl is TDBDateTimeEditEh then begin
      Edit:=TDBDateTimeEditEh(ActiveControl);
      if Edit.CalendarVisible then Exit;
   end;
   if Key=VK_ESCAPE then begin
      ModalResult:=mrCancel;
   end;
end;

procedure TfmAddFnd.edNumberChange(Sender: TObject);
begin
   ChangeText;
end;

procedure TfmAddFnd.edDateChange(Sender: TObject);
begin
   ChangeText;
end;

procedure TfmAddFnd.chbSprClickCheck(Sender: TObject);
begin
   ChangeText;
end;

function TfmAddFnd.CheckFind: Boolean;
begin
   Result:=(FOper<>nil) and ((not FOper.NeedValue) or (FOper.NeedValue and (IsValue(FField, FOper) or chbParam.Checked))) ;
end;

procedure TfmAddFnd.UpdateButton;
begin
   btOk.Enabled:=CheckFind;
   btFind.Enabled:=CheckFind;
end;

function TfmAddFnd.IsValue(Field: TFindFieldItem; Oper: TOperItem): Boolean;
begin
   Result:=(Oper<>nil) and not Oper.NeedValue;
   if (Oper<>nil) and Oper.NeedValue then begin
      Result:=FControls.IsValue(nil, FEditKind, GetValueKind, FOper.TwoValue);
   end;
end;

procedure TfmAddFnd.btFindClick(Sender: TObject);
begin
   FStart:=True;
   ModalResult:=mrOk;
end;

procedure TfmAddFnd.SetNewHeight(LastTop, LastHeight: Integer);
begin
   //--ClientHeight:=ClientHeight-(bvValue.Top-(LastTop+LastHeight+(laSecond.Top-bvOper.Top)));
   ClientHeight:=ClientHeight-(chbParam.Top-(LastTop+LastHeight+((laSecond.Top-bvOper.Top) div 2)));
end;

procedure TfmAddFnd.cbComboChange(Sender: TObject);
begin
   ChangeText;
end;

procedure TfmAddFnd.DBEditEh1EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
   SelectValue;
end;
             
procedure TfmAddFnd.edSprChange(Sender: TObject);
var
   NameField: TField;
   SeekValue: Integer;
   fLocate: Boolean;
   Spr: TSprItem;
begin
   Spr:=GetValueSpr;
   if (Spr<>nil) and (Spr.DataSet<>nil) then begin
      stSpr.Hint:='';
      if (edSpr.Value=Null) or (edSpr.Value='') then begin
         FLastCaption:='';
         stSpr.Caption:=FLastCaption;
      end
      else begin
         NameField:=Spr.DataSet.FindField(Spr.NameFieldName);
         fLocate:=False;
         case GetValueKind of
            valString: begin
               fLocate:=Spr.DataSet.Locate(Spr.KeyFieldName, edSpr.Value, [loCaseInsensitive]);
            end;
            valNumber: begin
               SeekValue:=StrToIntDef(edSpr.Value, -1);
               if SeekValue<>-1 then begin
                  fLocate:=Spr.DataSet.Locate(Spr.KeyFieldName, SeekValue, [loCaseInsensitive]);
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
   ChangeText;
end;

procedure TfmAddFnd.edSprDblClick(Sender: TObject);
begin
   SelectValue;
end;

procedure TfmAddFnd.SelectValue;
var
   Val: string;
   ValCaption: string;
   Spr: TSprItem;
begin
   Spr:=GetValueSpr;
   if Spr<>nil then begin
      if (edSpr.Value<>Null) and (edSpr.Value<>'') then begin
         Val:=edSpr.Value;
      end;
      ValCaption:=FLastCaption;
      Spr.SetIndexName; //ind
      if FFilterInterface.SelectFindValue(Spr, Val, ValCaption) then begin
         edSpr.Value:=Val;
         FLastCaption:=ValCaption;
      end;
   end;
end;

procedure TfmAddFnd.chbParamClick(Sender: TObject);
begin
   chbNeedValue.Enabled:=chbParam.Checked;
   ChangeText;
end;

procedure TfmAddFnd.chbSprDblClick(Sender: TObject);
begin
   if chbSpr.ItemIndex<>-1 then begin
      chbSpr.Checked[chbSpr.ItemIndex]:=not chbSpr.Checked[chbSpr.ItemIndex];
   end;
end;

procedure TfmAddFnd.dbComboChange(Sender: TObject);
begin
   ChangeText;
end;

procedure TfmAddFnd.cbKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if Key=VK_DELETE then begin
      TComboBox(Sender).ItemIndex:=-1;
      ChangeText;
   end;
end;

function TfmAddFnd.GetPlace: TAddPlace;
begin
   if cbPlace.ItemIndex<>-1 then begin
      Result:=TAddPlace(cbPlace.Items.Objects[cbPlace.ItemIndex]);
   end
   else begin
      Result:=apAfterCur;
   end;
end;

procedure TfmAddFnd.SetPlaces;
begin
   cbPlace.Clear;
   cbPlace.Items.AddObject('к текущему условию', TObject(apAfterCur));
   cbPlace.Items.AddObject('перед текущим условием', TObject(apBeforeCur));
   cbPlace.Items.AddObject('в конец списка условий', TObject(apEnd));
   cbPlace.Items.AddObject('в начало списка условий', TObject(apBegin));
   cbPlace.ItemIndex:=0;
end;

procedure TfmAddFnd.SetControlValue(EditKind: TFieldEditKind);
var
   I: Integer;
   Spr: TSprItem;
begin           
   Spr:=GetValueSpr;
   case EditKind of
      fekMonth: begin
         cbMonth.Clear;
         cbMonth2.Clear;
         for I:=1 to 12 do begin
            cbMonth.Items.Add(LongMonthNames[I]);
            cbMonth2.Items.Add(LongMonthNames[I]);
         end;
         cbMonth.DropDownCount:=12;
         cbMonth2.DropDownCount:=12;
      end;
      fekBoolean: begin
         cbBoolean.Clear;
         cbBoolean.Items.CommaText:='Да,Нет';
      end;
      fekCheckList: begin
         chbSpr.Clear;
         if Spr<>nil then begin
            Spr.FillStrings(chbSpr.Items);
         end;
      end;
      fekLookup: begin
         if (Spr<>nil) and (Spr.DataSet<>nil) then begin
            dsoCombo.DataSet:=Spr.DataSet;
            if not Spr.DataSet.Active then begin
               Spr.DataSet.Open;
            end;
            Spr.SetIndexName;//ind
            dbCombo.KeyField:=Spr.KeyFieldName;
            dbCombo.ListField:=Spr.NameFieldName;
         end;
      end;
      fekComboBox: begin
         cbCombo.Clear;
         if Spr<>nil then begin
            Spr.FillStrings(cbCombo.Items);
            if cbCombo.Items.Count>CMaxDropDownOper then begin
               cbCombo.DropDownCount:=CMaxDropDownOper;
            end
            else begin
               cbCombo.DropDownCount:=cbCombo.Items.Count;
            end;
         end;
      end;
   end;
end;

function TfmAddFnd.GetValueKind: TFindValueKind;
begin
   Result:=FFilterInterface.GetValueKind(FOper, FField);
end;

function TfmAddFnd.GetValueSpr: TSprItem;
begin
   Result:=FFilterInterface.GetValueSpr(FOper, FField);
end;

procedure TfmAddFnd.FormDestroy(Sender: TObject);
begin
   FControls.Free;
end;

procedure TfmAddFnd.edSpr2DblClick(Sender: TObject);
begin
   SelectValue2;
end;

procedure TfmAddFnd.edSpr2EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
   SelectValue2;
end;

procedure TfmAddFnd.SelectValue2;
var
   Val: string;
   ValCaption: string;
   Spr: TSprItem;        
begin
   Spr:=GetValueSpr;
   if Spr<>nil then begin
      if (edSpr2.Value<>Null) and (edSpr2.Value<>'') then begin
         ValCaption:=edSpr2.Text;
      end;
      Val:=FLastValue;
      Spr.SetIndexName; //ind
      if FFilterInterface.SelectFindValue(Spr, Val, ValCaption) then begin
         edSpr2.Text:=ValCaption;
         FLastValue:=Val;
         FLastCaption:=ValCaption;
      end;
      ChangeText;
   end;
end;

procedure TfmAddFnd.edSpr2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if Key=VK_DELETE then begin
      TDBEditEh(Sender).Text:='';
      FLastValue:='';
      FLastCaption:='';
      ChangeText;
   end;
end;

{ TAddFindField }

constructor TAddFindFieldParam.Create(Field: TFindFieldItem);
begin
   FField:=Field;
   FOper:=nil;
   FAndOr:=False;
   FIgnoreCase:=False;
   FIsParam:=False;
   FNeedValue:=True;
   FStart:=False;
   FValue1:=TFindValue.Create;
   FValue2:=TFindValue.Create;
   FOperVal:=TFindValue.Create;
   FPlace:=apAfterCur;;
   FDatePart:=dkFull;
end;

destructor TAddFindFieldParam.Destroy;
begin
   FValue1.Free;
   FValue2.Free;
   FOperVal.Free;
   inherited;
end;

procedure TfmAddFnd.cbDatePartChange(Sender: TObject);
begin
   FEditKind:=FField.GetEditKind(FFilterInterface.SprList, GetDatePart);
   SetOperations(True, FField, FFilterInterface.OperList);
   InitValueView(FField, FFilterInterface);
   // [!] NB: не знаю точно какие тут вызывать функции
   SetOperation(nil);
   //
   ChangeEnabled;
   ChangeText; 
   if (cbDatePart.ItemIndex=Integer(dkCurrentAgeMonth)) or (cbDatePart.ItemIndex=Integer(dkAgeMonth)) then begin
     laAge1.Caption:='количество месяцев';
   end else begin
     laAge1.Caption:='количество полных лет';
   end;
end;

function TfmAddFnd.GetDatePart: TDateKind;
begin
   Result:=MapIndexDatePart[cbDatePart.ItemIndex];
end;

procedure TfmAddFnd.cbMonthChange(Sender: TObject);
begin
   ChangeText;
end;

end.
