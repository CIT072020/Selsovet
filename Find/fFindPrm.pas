// форма редактирования параметрезированных условий для поиска
unit fFindPrm; // find parameters edit form [22.09.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   mFindInt, StdCtrls, ExtCtrls, DBCtrlsEh, Mask, ToolCtrlsEh, DB,
   CheckLst, DBLookupEh, fFindPrp, mFindPrp, mRTD, Menus, ImgList, ComCtrls, TypInfo,
  {$IFDEF VER150} Variants, {$ENDIF} 
   fDsgnTl, mMD5, fDsgnTb, fDsgnCl;

type

   TfmParamFnd=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      laFilter: TLabel;
      sbParam: TScrollBox;
      pmDesign: TPopupMenu;
      imDesign: TImageList;
      miAlign: TMenuItem;
      miSize: TMenuItem;
      miOrder: TMenuItem;
      btClear: TButton;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btCancelClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure OnChangeValue(Sender: TObject);
      procedure OnSprButton(Sender: TObject; var Handled: Boolean);
      procedure OnSprChange(Sender: TObject);
      procedure OnSprClick(Sender: TObject);
      procedure OnSpr2Button(Sender: TObject; var Handled: Boolean);
      procedure OnSpr2Change(Sender: TObject);
      procedure OnSpr2Click(Sender: TObject);
      procedure OnCheckListClick(Sender: TObject);
      procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
      procedure OnNeedCheckChange(Sender: TObject);
      procedure cbKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure edKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      function OnCanSelect(var Control: TControl): Boolean;
      procedure OnControlCut(Control: TControl);
      procedure miAlignClick(Sender: TObject);
      procedure miSizeClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormHide(Sender: TObject);
      procedure FormResize(Sender: TObject);
      procedure OnMultiSelect(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure miOrderClick(Sender: TObject);
      procedure OnSelectExtraCtrl(Sender: TObject);
      procedure OnNewExtraCtrl(Control: TControl; Name: string);
      function OnNewExtraCtrlName(Control: TControl; ClassName: string): string;
      procedure btClearClick(Sender: TObject);
   private
      FFilterInterface: TFilterInterface;
      FFilter: TFindList;
      FParams: TParamList;
      FControls: TValueControlList;
      FIsTest: Boolean;
      FSprList: TList;
      FStaticList: TList;
      FLastCaptions: TStringList;
      FLastValues: TStringList;
      FCanResize: Boolean;
      FNeedValue: TList;
      FNeedItem: TList;
      //
      FCtrlProp: TStringList;
      FCtrlTranslate: TStringList;
      FFieldCtrl: TFieldCtrlList;
      FDsgn: TDesigner;
      FDesign: Boolean;
      FToolForm: TfmDesignTool;
      FCtrlForm: TfmDesignCtrl;
   private
      //
      procedure Init;
      procedure Init2;
      //
      function CheckValue: Boolean;
      function CheckOneValue: Boolean;
      //
      procedure UpdateButton;
      //
      procedure UpdateValue;
      //
      procedure SelectSpr(Edit: TDBEditEh; Tag: Integer);
      procedure SelectSpr2(Edit: TDBEditEh; Tag: Integer);
      //
      procedure ShowPropertyEditor;
      procedure HidePropertyEditor;
      procedure InitPropertyEditor;
      //
      procedure ReInit;
      procedure ShowPropEdit;
      procedure UpdateToolWindow;
      procedure UpdateCtrlWindow;
      procedure UpdateToolCommand;
      //
      procedure OnToolCommand(Command: TToolCommand);
      //
      procedure SetDesignState(Value: Boolean);
      //
      procedure ChangeTabOrder;
      //
      function DeleteControl(Control: TControl): Boolean;
      //
      procedure ClearValue;
      //
      function GetFindFieldCaption(FindItem: TFindItem): string;
   protected
      procedure WMWindowPosChanged(var Msg: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
      procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
   end;

function EditFindParams(FilterInterface: TFilterInterface; Filter: TFindList; Params: TParamList; IsTest: Boolean): Boolean;

implementation
{$R *.DFM}

type
   TSW=class(TScrollingWinControl);

function EditFindParams(FilterInterface: TFilterInterface; Filter: TFindList; Params: TParamList; IsTest: Boolean): Boolean;
var
   Ind: Integer;
begin
   Result:=False;
   with TfmParamFnd.Create(nil) do begin
      try
         FIsTest:=IsTest;
         FCanResize:=True;
         FFilterInterface:=FilterInterface;
         FFilter:=Filter;
         FParams:=Params;
         laFilter.Caption:=FParams.Caption;
         if laFilter.Caption='' then begin
            laFilter.Caption:=FFilter.Caption;
         end;
         TSW(sbParam).DisableAutoRange;
         try
            Init;
            Ind:=0;
            FFieldCtrl.LoadFromStrings(FFilter.ParamCtrl, Ind);
            FFieldCtrl.AdjustSize(FParams.PixelsPerInch);
            FFieldCtrl.ApplyTabOrderList;
            FFieldCtrl.ApplyDeleted;
            FFieldCtrl.SetParentToExtraCtrl(sbParam);
            Init2;
         finally
            TSW(sbParam).EnableAutoRange;
         end;
         UpdateButton;
         FCanResize:=FIsTest;
         if ShowModal=mrOk then begin
            if FIsTest then begin
               Params.FormWidth:=Width;
               Params.FormHeight:=Height;
               Params.PixelsPerInch:=Screen.PixelsPerInch;
               FFilter.ParamCtrl.Clear;
               FFieldCtrl.SaveToStrings(FFilter.ParamCtrl);
            end;
            UpdateValue;
            Result:=True;
         end;
      finally
         FilterInterface.SprList.RestoreIndexName;//ind
         Free;
      end;
   end;
end;

procedure TfmParamFnd.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
   if (Key=VK_ESCAPE) and not FDesign then begin
      ModalResult:=mrCancel;
   end;
   if (Key=VK_F11) and FDesign then begin
      if FDesign then begin
         {if PropertyEdit.Visible then begin
            PropertyEdit.Hide;
         end
         else begin
            PropertyEdit.Show;
         end;}
      end;
   end;
   if (Key=VK_F12) and FIsTest and (urDesigner in FFilterInterface.UserRights) then begin
      {if FDesign then begin
         HidePropertyEditor;
      end
      else begin
         ShowPropertyEditor;
      end;
      UpdateToolCommand;}
   end;
end;

procedure TfmParamFnd.Init;
const
   MapBool: array [Boolean] of string=('Нет', 'Да');
var
   I: Integer;
   FindItem: TFindItem;
   FindField: TFindFieldItem;
   DatePart: TDateKind;
   Oper: TOperItem;
   EditKind: TFieldEditKind;
   Spr: TSprItem;
   S: string;
   S2: string;
   M: Integer;
   //
//--------------------------------------------------
//   laName: TLabel;
//   laOp: TLabel;
//   laAge: TLabel;        vadim   25.08.2012
   laName: TStaticText;
   laOp: TStaticText;
   laAge: TStaticText; //  vadim   25.08.2012
//--------------------------------------------------
   edText: TEdit;
   edDate: TDBDateTimeEditEh;
   edNumber: TDBNumberEditEh;
   cbBool: TComboBox;
   cbMonth: TComboBox;
   cbCombo: TComboBox;
   dbCombo: TDBLookupComboboxEh;
   dsCombo: TDataSource;
   edSpr: TDBEditEh;
   stSpr: TStaticText;
   chbSpr: TCheckListBox;
   btSpr: TEditButtonEh;
   chbNeedValue: TCheckBox;
   //
   BaseLeft: Integer;
   BaseTop: Integer;
   CurTop: Integer;
   NameHeight: Integer;
   ValueHeight: Integer;
   WidthAdd: Integer;
   HeightAdd: Integer;
   MinusHeight: Integer;
   MaxOpWidth: Integer;
   DefWidth: Integer;
   DefHeight: Integer;
   ParamHeight: Integer;
   //
   {FirstControl: TWinControl;}
   FieldCtrl: TFieldCtrl;               
   //
   FieldImageIndex: Integer;

   function GetName(Prefix: string): string;
   var
      N: Integer;
      Hash: string;
   begin
      N:=1;
      Hash:=MD5Print(MD5String(FindField.Path));
      repeat
         Result:=Format('%s%d_%s_%d', [Prefix, N, Hash, FindItem.Id]);
         Inc(N);
      until not FFieldCtrl.IsControlName(Result);
   end;

   function AddDate(NamePrefix: string; Top, Left, Width: Integer; NextTop, Two: Boolean; Kinds: TFieldEditKinds): TDBDateTimeEditEh;
   var
      AddS: string;
   begin
      Result:=TDBDateTimeEditEh.Create(Self);
      Result.Name:=GetName(NamePrefix);
      AddS:='';
      if Two then begin
         AddS:=' 2';
      end;
      FieldCtrl.Controls.AddNew('Ввод значения'+AddS, Result, True);
      FControls.AddNew(Result, Kinds, Two, True, FindField, FindItem);
      Result.Parent:=sbParam;
      Result.Left:=Left;
      Result.Width:=Width;
      Result.Top:=Top;
      Result.OnChange:=OnChangeValue;
      if NextTop then begin
         CurTop:=CurTop+ValueHeight+HeightAdd;
      end;
   end;

   function AddNumber(NamePrefix: string; Top, Left, Width: Integer; NextTop, Two: Boolean): TDBNumberEditEh;
   var
      AddS: string;
   begin
      Result:=TDBNumberEditEh.Create(Self);
      Result.Name:=GetName(NamePrefix);
      AddS:='';
      if Two then begin
         AddS:=' 2';
      end;
      FieldCtrl.Controls.AddNew('Ввод значения'+AddS, Result, True);
      FControls.AddNew(Result, [EditKind], Two, True, FindField, FindItem);
      Result.Parent:=sbParam;
      Result.Left:=Left;
      Result.Top:=Top;
      Result.Width:=Width;
      Result.OnChange:=OnChangeValue;
      if NextTop then begin
         CurTop:=CurTop+ValueHeight+HeightAdd;
      end;
   end;

begin
{
   NameHeight:=MulDiv(18, Screen.PixelsPerInch, 96);
   ValueHeight:=MulDiv(22, Screen.PixelsPerInch, 96);
   WidthAdd:=MulDiv(10, Screen.PixelsPerInch, 96);
   HeightAdd:=MulDiv(6, Screen.PixelsPerInch, 96);
   DefWidth:=MulDiv(100, Screen.PixelsPerInch, 96);A
   DefHeight:=MulDiv(100, Screen.PixelsPerInch, 96);
   BaseTop:=MulDiv(2, Screen.PixelsPerInch, 96);
}
   NameHeight:=18;
   ValueHeight:=22;
   WidthAdd:=10;
   HeightAdd:=6;
   DefWidth:=100;
   DefHeight:=100;
   BaseTop:=2;
   BaseLeft:=WidthAdd;
   CurTop:=BaseTop;
   MaxOpWidth:=FParams.GetMaxOpWidth(Canvas);
   if FParams.FormWidth<>0 then begin
      Width:=FParams.GetRealWidth
   end;
   if FParams.FormHeight<>0 then begin
      Height:=FParams.GetRealHeight
   end;
   {FirstControl:=nil;}
   FControls.Clear;
   FSprList.Clear;
   FStaticList.Clear;
   FFieldCtrl.Clear;
   FLastCaptions.Clear;
   FLastValues.Clear;
   FNeedValue.Clear;
   FNeedItem.Clear;
   for I:=0 to Pred(FParams.Count) do begin
      FindItem:=FParams[I];
      FindField:=FindItem.Field;
      Oper:=FindItem.Oper;
      DatePart:=FindItem.DatePart;
      FLastCaptions.Add('');
      FLastValues.Add('');
      FSprList.Add(nil);
      FStaticList.Add(nil);
      if (FindField<>nil) and (FindField<>nil) and (Oper<>nil) then begin
         if FIsTest then begin
            FieldImageIndex:=FFilterInterface.GetImageIndex(FindField)
         end
         else begin
            FieldImageIndex:=-1;
         end;
         FieldCtrl:=FFieldCtrl.AddNew(FindItem, FindField.AddCaption, FindItem.Id, FieldImageIndex);
         //
         Spr:=FFilterInterface.GetValueSpr(Oper, FindField);
         EditKind:=FFilterInterface.GetEditKind(Oper, FindField, DatePart);
         if EditKind in [fekString, fekMonth, fekAge, fekBoolean, fekDate, fekNumber, fekList, fekComboBox, fekGridW, fekGridW2, fekCheckList, fekLookup, fekFloat] then begin
//            laName:=TLabel.Create(Self);   
            laName:=TStaticText.Create(Self);   
            laName.Name:=GetName('laName');
            FieldCtrl.Controls.AddNew('Название поля', laName, False);
            laName.Parent:=sbParam;
            if FIsTest then begin
               chbNeedValue:=TCheckBox.Create(Self);
               chbNeedValue.TabStop:=False;
               chbNeedValue.Parent:=sbParam;
               chbNeedValue.Left:=MulDiv(BaseLeft, Screen.PixelsPerInch, 96);
               chbNeedValue.Top:=MulDiv(CurTop-1, Screen.PixelsPerInch, 96);
               chbNeedValue.Width:=GetSystemMetrics(SM_CXVSCROLL);
               chbNeedValue.ShowHint:=True;
               chbNeedValue.Hint:='Обязательное значение при вводе параметров';
               chbNeedValue.Checked:=FindItem.NeedValue;
               FNeedValue.Add(chbNeedValue);
               FNeedItem.Add(FindItem);
               chbNeedValue.Tag:=Integer(laName);
               chbNeedValue.OnClick:=OnNeedCheckChange;
               laName.Left:=chbNeedValue.Left+chbNeedValue.Width{+WidthAdd};
            end
            else begin
               laName.Left:=MulDiv(BaseLeft, Screen.PixelsPerInch, 96);
            end;
            laName.Top:=MulDiv(CurTop, Screen.PixelsPerInch, 96);
            laName.Caption:=GetFindFieldCaption(FindItem);
            laName.Font.Style:=[fsBold];
            if not FindItem.NeedValue then begin
               laName.Font.Color:=clNavy;
               laName.Font.Style:=[];
            end;
            CurTop:=CurTop+NameHeight;
//            laOp:=TLabel.Create(Self);  
            laOp:=TStaticText.Create(Self);   
            laOp.Name:=GetName('laOp');
            FieldCtrl.Controls.AddNew('Название операции', laOp, False);
            laOp.Parent:=sbParam;
            laOp.Left:=MulDiv(BaseLeft, Screen.PixelsPerInch, 96);
            laOp.Top:=MulDiv(CurTop+2, Screen.PixelsPerInch, 96);
            laOp.Caption:=Oper.Caption;
         end;
         case EditKind of
            fekCheckList: begin
               chbSpr:=TCheckListBox.Create(Self);
               chbSpr.Name:=GetName('chbSpr');
               FieldCtrl.Controls.AddNew('Ввод значения', chbSpr, True);
               FControls.AddNew(chbSpr, [fekCheckList], False, True, FindField, FindItem);
               chbSpr.Parent:=sbParam;
               chbSpr.Left:=MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96);
               chbSpr.Top:=MulDiv(CurTop, Screen.PixelsPerInch, 96);
               chbSpr.Width:=ClientWidth-chbSpr.Left-GetSystemMetrics(SM_CXVSCROLL)-MulDiv(WidthAdd, Screen.PixelsPerInch, 96);
               chbSpr.Anchors:=chbSpr.Anchors+[akRight];
               if Spr<>nil then begin
                  Spr.FillStrings(chbSpr.Items);
               end;
               chbSpr.Height:=MulDiv(DefHeight, Screen.PixelsPerInch, 96);
               chbSpr.OnDblClick:=OnCheckListClick;
               chbSpr.OnClickCheck:=OnChangeValue;
               CurTop:=CurTop+chbSpr.Height;
               CurTop:=CurTop+HeightAdd;
               {FirstControl:=chbSpr;}
            end;
            fekGridW: begin
               edSpr:=TDBEditEh.Create(Self);
               edSpr.Name:=GetName('edSpr');
               FieldCtrl.Controls.AddNew('Ввод значения', edSpr, True);
               FControls.AddNew(edSpr, [fekGridW], False, True, FindField, FindItem);
               edSpr.Parent:=sbParam;
               edSpr.Left:=MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96);
               edSpr.Top:=MulDiv(CurTop, Screen.PixelsPerInch, 96);
               edSpr.Width:=MulDiv(DefWidth, Screen.PixelsPerInch, 96);
               edSpr.ShowHint:=True;
               btSpr:=edSpr.EditButtons.Add;
               btSpr.Style:=ebsEllipsisEh;
               btSpr.Hint:='Выберите значение из справочника';
               btSpr.OnClick:=OnSprButton;
               stSpr:=TStaticText.Create(Self);
               stSpr.Name:=GetName('stSpr');
               stSpr.TabStop:=False;
               FieldCtrl.Controls.AddNew('Показ значения', stSpr, False);
               stSpr.Parent:=sbParam;
               stSpr.Caption:=' ';
               stSpr.AutoSize:=False;
               stSpr.Top:=MulDiv(CurTop+2, Screen.PixelsPerInch, 96);
               stSpr.Left:=edSpr.Left+edSpr.Width+MulDiv(WidthAdd, Screen.PixelsPerInch, 96);
               stSpr.Width:=ClientWidth-stSpr.Left-GetSystemMetrics(SM_CXVSCROLL)-MulDiv(WidthAdd, Screen.PixelsPerInch, 96);
               stSpr.Anchors:=stSpr.Anchors+[akRight];
               stSpr.ShowHint:=True;
               stSpr.Font.Color:=clNavy;
               stSpr.BorderStyle:=sbsSunken;
               stSpr.Tag:=I;
               edSpr.Tag:=I;
               FSprList[I]:=Spr;
               FStaticList[I]:=stSpr;
               if not FindItem.Value1.IsNull then begin
                  stSpr.Caption:=FindItem.Value1.ValCaption;
                  stSpr.Hint:=stSpr.Caption;
               end;
               edSpr.OnChange:=OnSprChange;
               edSpr.OnDblClick:=OnSprClick;
               CurTop:=CurTop+ValueHeight;
               CurTop:=CurTop+HeightAdd;
               {FirstControl:=edSpr;}
            end;
            fekGridW2: begin
               edSpr:=TDBEditEh.Create(Self);
               edSpr.Name:=GetName('edSpr');
               edSpr.ReadOnly:=True;
               FieldCtrl.Controls.AddNew('Ввод значения', edSpr, True);
               FControls.AddNew(edSpr, [fekGridW2], False, True, FindField, FindItem);
               edSpr.Parent:=sbParam;
               edSpr.Left:=MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96);
               edSpr.Top:=MulDiv(CurTop, Screen.PixelsPerInch, 96);
               edSpr.Width:=ClientWidth-edSpr.Left-GetSystemMetrics(SM_CXVSCROLL)-MulDiv(WidthAdd, Screen.PixelsPerInch, 96);
               edSpr.ShowHint:=True;
               edSpr.OnKeyDown:=edKeyDown;
               btSpr:=edSpr.EditButtons.Add;
               btSpr.Style:=ebsEllipsisEh;
               btSpr.Hint:='Выберите значение из справочника';
               btSpr.OnClick:=OnSpr2Button;
               edSpr.Tag:=I;
               FSprList[I]:=Spr;
               if not FindItem.Value1.IsNull then begin
                  edSpr.Text:=FindItem.Value1.ValCaption;
                  edSpr.Hint:=edSpr.Text;
               end
               else begin
                  edSpr.Text:='';
               end;
               edSpr.OnChange:=OnSpr2Change;
               edSpr.OnDblClick:=OnSpr2Click;
               CurTop:=CurTop+ValueHeight;
               CurTop:=CurTop+HeightAdd;
               {FirstControl:=edSpr;}
            end;
            fekLookup: begin
               dbCombo:=TDBLookupComboboxEh.Create(Self);
               dbCombo.Name:=GetName('dbCombo');
               FieldCtrl.Controls.AddNew('Ввод значения', dbCombo, True);
               FControls.AddNew(dbCombo, [fekLookup], False, True, FindField, FindItem);
               dbCombo.Parent:=sbParam;
               dbCombo.Left:=MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96);
               dbCombo.Top:=MulDiv(CurTop, Screen.PixelsPerInch, 96);
               dbCombo.Width:=ClientWidth-dbCombo.Left-GetSystemMetrics(SM_CXVSCROLL)-MulDiv(WidthAdd, Screen.PixelsPerInch, 96);
               dbCombo.Anchors:=dbCombo.Anchors+[akRight];
               dsCombo:=TDataSource.Create(Self);
               dbCombo.ListSource:=dsCombo;
               dbCombo.DropDownBox.ListSource:=dsCombo;
               if (Spr<>nil) and (Spr.DataSet<>nil) then begin
                  if not Spr.DataSet.Active then begin
                     Spr.DataSet.Open;
                  end;
                  Spr.SetIndexName; //ind
                  dsCombo.DataSet:=Spr.DataSet;
                  dbCombo.KeyField:=Spr.KeyFieldName;
                  dbCombo.ListField:=Spr.NameFieldName;
               end;
               dbCombo.OnChange:=OnChangeValue;
               CurTop:=CurTop+ValueHeight;
               CurTop:=CurTop+HeightAdd;                             
               {FirstControl:=dbCombo;}
            end;
            fekComboBox: begin
               cbCombo:=TComboBox.Create(Self);
               cbCombo.Name:=GetName('cbCombo');
               FieldCtrl.Controls.AddNew('Ввод значения', cbCombo, True);
               FControls.AddNew(cbCombo, [fekComboBox], False, True, FindField, FindItem);
               cbCombo.OnKeyDown:=cbKeyDown;
               cbCombo.Parent:=sbParam;
               cbCombo.Left:=MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96);
               cbCombo.Top:=MulDiv(CurTop, Screen.PixelsPerInch, 96);
               cbCombo.Width:=ClientWidth-cbCombo.Left-GetSystemMetrics(SM_CXVSCROLL)-MulDiv(WidthAdd, Screen.PixelsPerInch, 96);
               cbCombo.Anchors:=cbCombo.Anchors+[akRight];
               cbCombo.Style:=csDropDownList;
               if Spr<>nil then begin
                  Spr.FillStrings(cbCombo.Items);
               end;
               cbCombo.OnChange:=OnChangeValue;
               CurTop:=CurTop+ValueHeight;
               CurTop:=CurTop+HeightAdd;
               {FirstControl:=cbCombo;}
            end;
            fekString: begin
               edText:=TEdit.Create(Self);
               edText.Name:=GetName('edText');
               FieldCtrl.Controls.AddNew('Ввод значения', edText, True);
               FControls.AddNew(edText, [fekString], False, True, FindField, FindItem);
               edText.Parent:=sbParam;
               edText.Left:=MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96); 
               edText.Top:=MulDiv(CurTop, Screen.PixelsPerInch, 96);
               edText.Width:=ClientWidth-edText.Left-GetSystemMetrics(SM_CXVSCROLL)-MulDiv(WidthAdd, Screen.PixelsPerInch, 96);
               edText.Anchors:=edText.Anchors+[akRight];
               edText.OnChange:=OnChangeValue;
               CurTop:=CurTop+ValueHeight;
               CurTop:=CurTop+HeightAdd;
               {FirstControl:=edText;}
            end;
            fekAge: begin
               edNumber:=AddNumber('edNumber', MulDiv(CurTop, Screen.PixelsPerInch, 96), MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96), MulDiv(DefWidth div 3, Screen.PixelsPerInch, 96), False, False);
               if Oper.TwoValue then begin
                  edNumber:=AddNumber('edNumber', MulDiv(CurTop, Screen.PixelsPerInch, 96), edNumber.Left+edNumber.Width+MulDiv(WidthAdd, Screen.PixelsPerInch, 96), MulDiv(DefWidth div 3, Screen.PixelsPerInch, 96), False, True);
               end;
//               laAge:=TLabel.Create(Self); 
               laAge:=TStaticText.Create(Self); 
               laAge.Name:=GetName('laAge');
               FieldCtrl.Controls.AddNew('На дату', laAge, False);
               laAge.Parent:=sbParam;
               laAge.Left:=edNumber.Left+edNumber.Width+MulDiv(WidthAdd, Screen.PixelsPerInch, 96);
               laAge.Top:=MulDiv(CurTop+2, Screen.PixelsPerInch, 96);
               laAge.Caption:='на дату';
               AddDate('edDate', MulDiv(CurTop, Screen.PixelsPerInch, 96), laAge.Left+laAge.Width+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96), MulDiv(DefWidth, Screen.PixelsPerInch, 96), True, False, [fekAge]);
            end;
            fekMonth: begin
               cbMonth:=TComboBox.Create(Self);
               cbMonth.Name:=GetName('cbMonth');
               FieldCtrl.Controls.AddNew('Ввод значения', cbMonth, True);
               FControls.AddNew(cbMonth, [fekMonth], False, True, FindField, FindItem);
               cbMonth.OnKeyDown:=cbKeyDown;
               cbMonth.Parent:=sbParam;
               for M:=1 to 12 do begin
                  cbMonth.Items.Add(LongMonthNames[M]);
               end;
               cbMonth.DropDownCount:=12;
               cbMonth.Style:=csDropDownList;
               cbMonth.Left:=MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96);
               cbMonth.Top:=MulDiv(CurTop, Screen.PixelsPerInch, 96);
               cbMonth.Width:=MulDiv(DefWidth, Screen.PixelsPerInch, 96);
               cbMonth.OnChange:=OnChangeValue;
               CurTop:=CurTop+ValueHeight;
               CurTop:=CurTop+HeightAdd;
               {FirstControl:=cbMonth;}
            end;
            fekBoolean: begin
               cbBool:=TComboBox.Create(Self);
               cbBool.Name:=GetName('cbBool');
               FieldCtrl.Controls.AddNew('Ввод значения', cbBool, True);
               FControls.AddNew(cbBool, [fekBoolean], False, True, FindField, FindItem);
               cbBool.OnKeyDown:=cbKeyDown;
               cbBool.Parent:=sbParam;
               cbBool.Items.CommaText:='Да,Нет';
               cbBool.Style:=csDropDownList;
               cbBool.Left:=MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96);
               cbBool.Top:=MulDiv(CurTop, Screen.PixelsPerInch, 96);
               cbBool.Width:=MulDiv(DefWidth, Screen.PixelsPerInch, 96);
               cbBool.OnChange:=OnChangeValue;
               CurTop:=CurTop+ValueHeight;
               CurTop:=CurTop+HeightAdd;
               {FirstControl:=cbBool;}
            end;
            fekDate: begin
               edDate:=AddDate('edDate', MulDiv(CurTop, Screen.PixelsPerInch, 96), MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96), MulDiv(DefWidth, Screen.PixelsPerInch, 96), not Oper.TwoValue, False, [fekDate]);
               if Oper.TwoValue then begin
                  AddDate('edDate', MulDiv(CurTop, Screen.PixelsPerInch, 96), edDate.Left+edDate.Width+MulDiv(WidthAdd, Screen.PixelsPerInch, 96), MulDiv(DefWidth, Screen.PixelsPerInch, 96), True, True, [fekDate]);
               end;
               {FirstControl:=edDate;}
            end;
            fekNumber, fekList, fekFloat: begin
               edNumber:=AddNumber('edNumber', MulDiv(CurTop, Screen.PixelsPerInch, 96), MaxOpWidth+MulDiv(WidthAdd+BaseLeft, Screen.PixelsPerInch, 96), MulDiv(DefWidth, Screen.PixelsPerInch, 96), not Oper.TwoValue, False);
               if Oper.TwoValue then begin
                  AddNumber('edNumber', MulDiv(CurTop, Screen.PixelsPerInch, 96), edNumber.Left+edNumber.Width+MulDiv(WidthAdd, Screen.PixelsPerInch, 96), MulDiv(DefWidth, Screen.PixelsPerInch, 96), True, True);
               end;
               {FirstControl:=edNumber;}
            end;
         end;
         FControls.SetValue(FindItem, EditKind, FindField, FindItem.Value1, FindItem.Value2, FindItem.OperVal, Oper, S2, S, Spr);
         FLastCaptions[I]:=S;
         FLastValues[I]:=S2;
         {if (ActiveControl=nil) and (FirstControl<>nil) then begin
            ActiveControl:=FirstControl;
         end;}
      end;
   end;
   {ParamHeight:=CurTop;
   if ParamHeight<sbParam.Height then begin
      MinusHeight:=ParamHeight-sbParam.Height;
      ClientHeight:=ClientHeight+MinusHeight;
   end;}
end;

procedure TfmParamFnd.btCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

function TfmParamFnd.CheckValue: Boolean;
var
   I: Integer;
   FindItem: TFindItem;
   FindField: TFindFieldItem;
   EditKind: TFieldEditKind;
   ValueKind: TFindValueKind;
   DatePart: TDateKind;
   Oper: TOperItem;
   fNotValue: Boolean;
   fYesValue: Boolean;
   fNeedValue: Boolean;
begin
   Result:=True;
   if not FIsTest then begin
      fNeedValue:=True;
      fYesValue:=False;
      for I:=0 to Pred(FParams.Count) do begin
         FindItem:=FParams[I];
         FindField:=FindItem.Field;
         Oper:=FindItem.Oper;
         DatePart:=FindItem.DatePart;
         if (FindItem<>nil) and (FindField<>nil) and (Oper<>nil) then begin
            ValueKind:=FFilterInterface.GetValueKind(Oper, FindField);
            EditKind:=FFilterInterface.GetEditKind(Oper, FindField, DatePart);
            fNotValue:=not FControls.IsValue(FindItem, EditKind, ValueKind, Oper.TwoValue);
            fNeedValue:=fNeedValue and (not fNotValue or not FindItem.NeedValue);
            fYesValue:=fYesValue or FindItem.NeedValue or (not fNotValue and not FindItem.NeedValue)
         end;
      end;
      Result:=fNeedValue and fYesValue;
   end;
end;

procedure TfmParamFnd.UpdateButton;
begin
   btOk.Enabled:=CheckValue;
   btClear.Enabled:=CheckOneValue;
end;

procedure TfmParamFnd.FormCreate(Sender: TObject);
begin
   FToolForm:=TfmDesignTool.Create(nil);
   FCtrlForm:=TfmDesignCtrl.Create(nil);
   FToolForm.OnToolCommand:=OnToolCommand;
   FCtrlForm.OnSelectCtrl:=OnSelectExtraCtrl;
   //
   FControls:=TValueControlList.Create;
   //
   FCtrlProp:=TStringList.Create;
   FCtrlTranslate:=TStringList.Create;
   InitPropertyEditor;
   FFieldCtrl:=TFieldCtrlList.Create(Self, nil);
   FDsgn:=TDesigner.Create;
   FDsgn.PopupMenu:=pmDesign;
   FDesign:=False;
   //
   FSprList:=TList.Create;
   FStaticList:=TList.Create;
   FLastCaptions:=TStringList.Create;
   FLastValues:=TStringList.Create;
   FNeedValue:=TList.Create;
   FNeedItem:=TList.Create;
end;

procedure TfmParamFnd.FormDestroy(Sender: TObject);
begin
   HidePropertyEditor;
   //
   FDsgn.Form:=nil;
   FCtrlProp.Free;
   FCtrlTranslate.Free;
   FFieldCtrl.Free;
   //
   FControls.Free;
   //
   FNeedValue.Free;
   FNeedItem.Free;
   FSprList.Free;
   FStaticList.Free;
   FLastCaptions.Free;
   FLastValues.Free;
   //
   FToolForm.OnToolCommand:=nil;
   FCtrlForm.OnSelectCtrl:=nil;
   FToolForm.Free;
   FCtrlForm.Free;
end;

procedure TfmParamFnd.OnChangeValue(Sender: TObject);
begin
   UpdateButton;
end;

procedure TfmParamFnd.UpdateValue;
var
   I: Integer;
   FindItem: TFindItem;
   FindField: TFindFieldItem;
   EditKind: TFieldEditKind;
   ValueKind: TFindValueKind;
   Oper: TOperItem;
   DatePart: TDateKind;
   Spr: TSprItem;
begin
   for I:=0 to Pred(FNeedValue.Count) do begin
      TFindItem(FNeedItem[I]).NeedValue:=TCheckBox(FNeedValue[I]).Checked;
   end;
   for I:=0 to Pred(FParams.Count) do begin
      FindItem:=FParams[I];
      FindField:=FindItem.Field;
      Oper:=FindItem.Oper;
      DatePart:=FindItem.DatePart;
      if (FindItem<>nil) and (FindField<>nil) and (Oper<>nil) then begin
         ValueKind:=FFilterInterface.GetValueKind(Oper, FindField);
         EditKind:=FFilterInterface.GetEditKind(Oper, FindField, DatePart);
         Spr:=FFilterInterface.GetValueSpr(Oper, FindField);
         FControls.InternalGetValue(FindItem, EditKind, ValueKind, FindField, FindItem.Value1, FindItem.Value2, FindItem.OperVal, Oper, FLastValues[I], FLastCaptions[I], Spr);
      end;
   end;
end;

procedure TfmParamFnd.OnSprButton(Sender: TObject; var Handled: Boolean);
var
   Edit: TDBEditEh;
begin
   Edit:=TDBEditEh(ActiveControl);
   SelectSpr(Edit, Edit.Tag);
end;

procedure TfmParamFnd.OnSprChange(Sender: TObject);
var
   NameField: TField;
   Spr: TSprItem;
   Text: TStaticText;
   Edit: TDBEditEh;
   SeekValue: Integer;
   fLocate: Boolean;
   FindItem: TFindItem;
begin
   Edit:=TDBEditEh(Sender);
   Spr:=FSprList[Edit.Tag];
   Text:=FStaticList[Edit.Tag];
   FindItem:=FParams[Text.Tag];
   if (Spr<>nil) and (Spr.DataSet<>nil) then begin
      Text.Hint:='';
      if (Edit.Value=Null) or (Edit.Value='') then begin
         FLastCaptions[Text.Tag]:='';
         Text.Caption:='';
      end
      else begin
         NameField:=Spr.DataSet.FindField(Spr.NameFieldName);
         fLocate:=False;
         if ffkNumber in FindItem.Field.Kinds then begin
            SeekValue:=StrToIntDef(Edit.Value, -1);
            if SeekValue<>-1 then begin
               fLocate:=Spr.DataSet.Locate(Spr.KeyFieldName, SeekValue, [loCaseInsensitive]);
            end;
         end
         else if ffkString in FindItem.Field.Kinds then begin
            fLocate:=Spr.DataSet.Locate(Spr.KeyFieldName, Edit.Value, [loCaseInsensitive]);
         end;
         if (NameField<>nil) and fLocate then begin
            FLastCaptions[Text.Tag]:=NameField.AsString;
            Text.Caption:=NameField.AsString;
            Text.Hint:=Text.Caption;
            Text.Font.Style:=[];
         end
         else begin
            FLastCaptions[Text.Tag]:=Edit.Value;
            Text.Caption:='<нет в справочнике>';
            Text.Font.Style:=[fsBold];
         end;
      end;
   end;
   UpdateButton;
end;

procedure TfmParamFnd.OnSprClick(Sender: TObject);
var
   Edit: TDBEditEh;
begin
   Edit:=TDBEditEh(Sender);
   SelectSpr(Edit, Edit.Tag);
end;

procedure TfmParamFnd.SelectSpr(Edit: TDBEditEh; Tag: Integer);
var
   Spr: TSprItem;
   Text: TStaticText;
   Val: string;
   ValCaption: string;
begin
   Spr:=FSprList[Tag];
   Text:=FStaticList[Edit.Tag];
   if Spr<>nil then begin
      if (Edit.Value<>Null) and (Edit.Value<>'') then begin
         Val:=Edit.Value;
      end;
      ValCaption:=FLastCaptions[Text.Tag];
      Spr.SetIndexName; //ind
      if FFilterInterface.SelectFindValue(Spr, Val, ValCaption) then begin
         Edit.Value:=Val;
         FLastCaptions[Text.Tag]:=ValCaption;
      end;
   end;
end;

procedure TfmParamFnd.OnCheckListClick(Sender: TObject);
var
   chbSpr: TCheckListBox;
begin
   chbSpr:=TCheckListBox(Sender);
   if chbSpr.ItemIndex<>-1 then begin
      chbSpr.Checked[chbSpr.ItemIndex]:=not chbSpr.Checked[chbSpr.ItemIndex];
   end;
end;

procedure TfmParamFnd.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   Resize:=FCanResize;
end;

procedure TfmParamFnd.OnNeedCheckChange(Sender: TObject);
var
   chb: TCheckBox;
   la: TLabel;
   Field: TFieldCtrl;
   Ctrl: TCtrlItem;
begin
   chb:=TCheckBox(Sender);
   la:=TLabel(chb.Tag);
   if chb.Checked then begin
      la.Font.Color:=clBlack;
      la.Font.Style:=[fsBold];
   end
   else begin
      la.Font.Color:=clNavy;
      la.Font.Style:=[];
   end;
   if FFieldCtrl.FindControl(la, Field, Ctrl) then begin
      Ctrl.UpdatePos;
   end;
end;

procedure TfmParamFnd.cbKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if Key=VK_DELETE then begin
      TComboBox(Sender).ItemIndex:=-1;
      OnChangeValue(Sender);
   end;
end;


procedure TfmParamFnd.HidePropertyEditor;
var
   I: Integer;
   {WidthAdd: Integer;}
   laName: TLabel;
   chbNeedValue: TCheckBox;
begin
   //FDsgn.OnSelect:=nil;
   FDsgn.SelectControl(nil, False, False, False);
   FDesign:=False;
   Designer:=FDsgn;
   SetDesignState(False);
   FDsgn.Form:=nil;
   FDsgn.OnNewControl:=nil;
   FDsgn.OnNewControlName:=nil;
   FDsgn.OnCanSelect:=nil;
   FDsgn.OnCut:=nil;
   FDsgn.OnMultiSelect:=nil;
   Invalidate;
   Update;
   // скрыть CheckBox
   {WidthAdd:=10;}
   for I:=0 to Pred(FNeedValue.Count) do begin
      chbNeedValue:=TCheckBox(FNeedValue[I]);
      laName:=TLabel(chbNeedValue.Tag);
      chbNeedValue.Visible:=True;
      chbNeedValue.Top:=laName.Top-1;
      chbNeedValue.Left:=laName.Left-chbNeedValue.Width{-WidthAdd};
   end;
   //
   HidePropertyEdit;
   //
   btOk.Enabled:=True;
   btCancel.Enabled:=True;
end;

type
   TCB=class(TCheckBox);

procedure TfmParamFnd.ShowPropertyEditor;
var
   I: Integer;
   chbNeedValue: TCheckBox;
begin
   ActiveControl:=nil;
   FDesign:=True;
   btOk.Enabled:=False;
   btCancel.Enabled:=False;
   FDsgn.Form:=Self;
   Designer:=FDsgn;
   SetDesignState(True);
   FDsgn.OnNewControl:=OnNewExtraCtrl;
   FDsgn.OnNewControlName:=OnNewExtraCtrlName;
   FDsgn.OnCanSelect:=OnCanSelect;
   FDsgn.OnCut:=OnControlCut;
   FDsgn.OnMultiSelect:=OnMultiSelect;
   Invalidate;
   Update;
   FFieldCtrl.Images:=FFilterInterface.Images.imFields;
   // скрыть CheckBox
   for I:=0 to Pred(FNeedValue.Count) do begin
      chbNeedValue:=TCheckBox(FNeedValue[I]);
      TCB(chbNeedValue).SetDesigning(False, True);
      chbNeedValue.Visible:=False;
   end;
   //
   ShowPropEdit;
   if Visible and CanFocus then begin
      SetFocus;
   end;
end;

procedure TfmParamFnd.InitPropertyEditor;
const
   CProps: array [1..10] of string=(
      'Caption=Название',
      'Visible=Показывать',
      'Top=Верх',
      'Left=Лево',
      'Height=Высота',
      'Width=Ширина',
      'Anchors=Якоря',
      'Hint=Текст подсказки',
      'ShowHint=Подсказки',
      'TabOrder=Порядок обхода');
   CTranslate: array [1..4] of string=(
      'Anchors.akTop=Вверх',
      'Anchors.akLeft=Влево',
      'Anchors.akRight=Вправо',
      'Anchors.akBottom=Вниз');
var
   I: Integer;
begin
   FCtrlProp.Clear;
   FCtrlTranslate.Clear;
   for I:=Low(CProps) to High(CProps) do begin
      FCtrlProp.Add(CProps[I]);
   end;
   for I:=Low(CTranslate) to High(CTranslate) do begin
      FCtrlTranslate.Add(CTranslate[I]);
   end;
   UpdateToolCommand;
end;

function TfmParamFnd.OnCanSelect(var Control: TControl): Boolean;
begin
   Result:=True;
   if (Control<>nil) and (Control.Parent<>nil) then begin
      if (Control=sbParam) or (Control is TButton) or (Control is TCheckBox) then begin
         Control:=nil;
      end
      else begin
         Result:=FFieldCtrl.IsControl(Control);
      end;
   end
   else begin
      Control:=nil;
   end;
end;

procedure TfmParamFnd.miAlignClick(Sender: TObject);
begin
   FDsgn.ShowAlignDialog;
end;

procedure TfmParamFnd.miSizeClick(Sender: TObject);
begin
   FDsgn.ShowSizeDialog;
end;

procedure TfmParamFnd.Init2;
var
   I: Integer;
   chbNeedValue: TCheckBox;
   laName: TLabel;
   {WidthAdd: Integer;}
   ParamHeight: Integer;
   MinusHeight: Integer;
   FirstControl: TWinControl;
begin
   //
   if FIsTest then begin
      {WidthAdd:=10;}
      for I:=0 to Pred(FNeedValue.Count) do begin
        chbNeedValue:=TCheckBox(FNeedValue[I]);
        laName:=TLabel(chbNeedValue.Tag);
        chbNeedValue.Top:=laName.Top-1;
        chbNeedValue.Left:=laName.Left-chbNeedValue.Width{-WidthAdd};
      end;
   end;
   // подстраиваем высоту
   ParamHeight:=FFieldCtrl.GetMaxBottom;
   if ParamHeight<sbParam.Height then begin
      MinusHeight:=ParamHeight-sbParam.Height;
      ClientHeight:=ClientHeight+MinusHeight+5{высота квадратика для rtd};
   end;
   // устанавливаем фокус на первый элемент
   FirstControl:=FFieldCtrl.GetFirstControl;
   if FirstControl<>nil then begin
      ActiveControl:=FirstControl;
   end;
   // обрабатываем настройки параметров
   if not (poShowClearButton in FParams.Option) then begin
      btClear.Visible:=False;
   end;
   if not (poShowCaption in FParams.Option) then begin
      laFilter.Visible:=False;
      sbParam.Top:=sbParam.Top-laFilter.Height;
      sbParam.Height:=sbParam.Height+laFilter.Height;
      ClientHeight:=ClientHeight-laFilter.Height;
   end;
end;

procedure TfmParamFnd.ReInit;
begin
   // удаляем все элементы
   while sbParam.ControlCount>0 do begin
      sbParam.Controls[0].Free;
   end;
   // заново строим диалог ввода параметров
   FParams.FormWidth:=0;
   FParams.FormHeight:=0;
   TSW(sbParam).DisableAutoRange;
   try
      Init;
      Init2;
   finally
      TSW(sbParam).EnableAutoRange;
   end;
end;

procedure TfmParamFnd.FormShow(Sender: TObject);
begin
   if FIsTest then begin
      UpdateToolWindow;
      UpdateCtrlWindow;
   end;
end;

procedure TfmParamFnd.WMWindowPosChanged(var Msg: TWMWindowPosChanged);
begin
   inherited;
   if FIsTest and not ((Msg.WindowPos.flags and SWP_NOMOVE)=SWP_NOMOVE) then begin
      UpdateToolWindow;
      UpdateCtrlWindow;
   end;
end;

procedure TfmParamFnd.UpdateToolWindow;
begin
   if urDesigner in FFilterInterface.UserRights then begin
      FToolForm.Left:=Left;
      FToolForm.Top:=Top-FToolForm.Height;
      FToolForm.Width:=Width;
      if not FToolForm.Visible then begin
         FToolForm.Show;
      end;
   end;
end;

procedure TfmParamFnd.FormHide(Sender: TObject);
begin
   if FIsTest then begin
      FToolForm.Hide;
      FCtrlForm.Hide;
   end;
end;

procedure TfmParamFnd.FormResize(Sender: TObject);
begin
   if FIsTest and FToolForm.Visible then begin
      UpdateToolWindow;
      UpdateCtrlWindow;
   end;
end;

procedure TfmParamFnd.WMSysCommand(var Msg: TWMSysCommand);
begin
   inherited;
   if FIsTest and ((Msg.CmdType=SC_MINIMIZE) or (Msg.CmdType=SC_ICON)) then begin
      FToolForm.Hide;
      FCtrlForm.Hide;
   end;
   if FIsTest and ((Msg.CmdType=SC_MAXIMIZE) or (Msg.CmdType=SC_ZOOM)) then begin
      UpdateToolWindow;
      UpdateCtrlWindow;
   end;
end;

procedure TfmParamFnd.OnToolCommand(Command: TToolCommand);
begin
   case Command of
      tcDefault: begin
         if not FDesign then begin
            ReInit;
         end;
      end;
      tcInspector: begin
         if FDesign then begin
            if PropertyEdit.Visible then begin
               PropertyEdit.Hide;
            end
            else begin
               PropertyEdit.Show;
            end;
         end;
      end;
      tcDesigner: begin
         if FDesign then begin
            HidePropertyEditor;
         end
         else begin
            ShowPropertyEditor;
         end;
      end;
      tcAlign: begin
         FDsgn.ShowAlignDialog;
      end;
      tcSize: begin
         FDsgn.ShowSizeDialog;
      end;
      tcOrder: begin
         ChangeTabOrder;
      end;
      tcExit: begin
         ModalResult:=mrCancel;
      end;
      tcCut: begin
         FDsgn.Cut;
      end;
   end;
   UpdateToolCommand;
end;

procedure TfmParamFnd.ShowPropEdit;
begin
   ShowPropertyEdit(FDsgn, FFieldCtrl, FCtrlProp, FCtrlTranslate, FFilterInterface.Section, FFilterInterface.Ini, FToolForm.Handle, sbParam);
end;

procedure TfmParamFnd.UpdateToolCommand;
begin
   FToolForm.EnableCommand(tcDefault, not FDesign);
   FToolForm.EnableCommand(tcInspector, FDesign);
   FToolForm.EnableCommand(tcDesigner, True);
   FToolForm.EnableCommand(tcSize, FDesign and (FDsgn.WinList.Count>0));
   FToolForm.EnableCommand(tcAlign, FDesign and (FDsgn.WinList.Count>0));
   FToolForm.EnableCommand(tcOrder, FDesign);
   FToolForm.EnableCommand(tcExit, FDesign);
   FToolForm.EnableCommand(tcCut, FDesign and ((FDsgn.WinList.Count>0) or (FDsgn.Win.Visible)));
   FCtrlForm.EnableControls(FDesign);
end;

procedure TfmParamFnd.OnMultiSelect(Sender: TObject);
begin
   UpdateToolCommand;
   if FDsgn.WinList.Count>0 then begin
      PropertyEdit.MultiSelect;
   end;
end;

procedure TfmParamFnd.FormActivate(Sender: TObject);
begin
   if FIsTest then begin
      if urDesigner in FFilterInterface.UserRights then begin
         SetWindowPos(FToolForm.Handle, Handle, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
         SetWindowPos(FCtrlForm.Handle, Handle, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
      end;
   end;
end;

type
   TC=class(TComponent);

procedure TfmParamFnd.SetDesignState(Value: Boolean);
var
   I: Integer;
begin
   TC(Self).SetDesigning(Value, False);
   TC(sbParam).SetDesigning(Value, False);
   TC(btOk).SetDesigning(Value, False);
   TC(btCancel).SetDesigning(Value, False);
   TC(btClear).SetDesigning(Value, False);
   for I:=0 to Pred(sbParam.ControlCount) do begin
      TC(sbParam.Controls[I]).SetDesigning(Value, False);
   end;
   sbParam.Invalidate;
   sbParam.Update;
end;

procedure TfmParamFnd.miOrderClick(Sender: TObject);
begin
   ChangeTabOrder;
end;

procedure TfmParamFnd.ChangeTabOrder;
var
   List: TStringList;
begin
   List:=TStringList.Create;
   try
      FFieldCtrl.GetTabOrderList(List);
      if ShowTabOrder(FFilterInterface, List) then begin
         FFieldCtrl.UpdateTabOrderList(List);
         PropertyEdit.UpdateCurrent;
      end;
   finally
      List.Free;
   end;
end;

procedure TfmParamFnd.OnControlCut(Control: TControl);
begin
   DeleteControl(Control);
end;

procedure TfmParamFnd.UpdateCtrlWindow;
begin
   if urDesigner in FFilterInterface.UserRights then begin
      FCtrlForm.Left:=Left;
      FCtrlForm.Top:=Top+Height;
      FCtrlForm.Width:=Width;
      if not FCtrlForm.Visible then begin
         FCtrlForm.Show;
      end;
   end;
end;

procedure TfmParamFnd.OnSelectExtraCtrl(Sender: TObject);
var
   NewCtrl: TExtraControl;
begin
   NewCtrl:=TfmDesignCtrl(Sender).CurCtrl;
   case NewCtrl of
      ecNone: begin
         FDsgn.StopAddControl;
      end;
      ecLabel: begin
         FDsgn.StartAddControl(TLabel);
      end;
      ecRadioGroup: begin
         FDsgn.StartAddControl(TRadioGroup);
      end;
      ecGroupBox: begin
         FDsgn.StartAddControl(TGroupBox);
      end;
   end;
end;

procedure TfmParamFnd.OnNewExtraCtrl(Control: TControl; Name: string);
var
   Ctrl: TCtrlItem;
begin
   if Control is TLabel then begin
      Ctrl:=FFieldCtrl.AddExtraControl(Control, Name, False);
      Ctrl.UpdateProp('Caption', TLabel(Control).Caption);
   end
   else if Control is TRadioGroup then begin
      Ctrl:=FFieldCtrl.AddExtraControl(Control, Name, True);
      Ctrl.UpdateProp('Caption', TRadioGroup(Control).Caption);
   end
   else if Control is TGroupBox then begin
      Ctrl:=FFieldCtrl.AddExtraControl(Control, Name, False);
      Ctrl.UpdateProp('Caption', TGroupBox(Control).Caption);
   end;
end;

function TfmParamFnd.OnNewExtraCtrlName(Control: TControl; ClassName: string): string;
begin
   Result:='';
   if (Control<>nil) and (ClassName<>'') then begin
      Result:=FFieldCtrl.GetNewExtraName(Control, ClassName);
   end;
end;

function TfmParamFnd.DeleteControl(Control: TControl): Boolean;
var
   I: Integer;
   Field: TFieldCtrl;
   Ctrl: TCtrlItem;
   WinControl: TWinControl;
begin
   Field:=nil;
   Ctrl:=nil;
   Result:=False;
   if Control is TWinControl then begin
      WinControl:=TWinControl(Control);
      I:=0;
      while I<WinControl.ControlCount do begin
         if not (WinControl.Controls[I] is TDesignWindow) then begin
            if not DeleteControl(WinControl.Controls[I]) then begin
               Inc(I);
            end;
         end
         else begin
            Inc(I);
         end;
      end;
   end;
   if FFieldCtrl.FindControl(Control, Field, Ctrl) then begin
      if Field=FFieldCtrl.ExtraField then begin
         PropertyEdit.RemoveCtrl(Ctrl);
         Field.Controls.DelControl(Control);
         Control.Free;
         Result:=True;
      end
      else if Ctrl<>nil then begin
         Ctrl.IsDeleted:=True;
         PropertyEdit.UpdateCtrl(Ctrl);
      end;
   end;
end;

procedure TfmParamFnd.OnSpr2Button(Sender: TObject; var Handled: Boolean);
var
   Edit: TDBEditEh;
begin
   Edit:=TDBEditEh(ActiveControl);
   SelectSpr2(Edit, Edit.Tag);
end;

procedure TfmParamFnd.OnSpr2Change(Sender: TObject);
begin
//
end;

procedure TfmParamFnd.OnSpr2Click(Sender: TObject);
var
   Edit: TDBEditEh;
begin
   Edit:=TDBEditEh(Sender);
   SelectSpr2(Edit, Edit.Tag);
end;

procedure TfmParamFnd.SelectSpr2(Edit: TDBEditEh; Tag: Integer);
var
   Spr: TSprItem;
   Val: string;
   ValCaption: string;
begin
   Spr:=FSprList[Tag];
   if Spr<>nil then begin
      if (Edit.Value<>Null) and (Edit.Value<>'') then begin
         ValCaption:=Edit.Text;
      end;
      Val:=FLastValues[Tag];
      Spr.SetIndexName; //ind
      if FFilterInterface.SelectFindValue(Spr, Val, ValCaption) then begin
         Edit.Text:=ValCaption;
         Edit.Hint:=ValCaption;
         FLastValues[Tag]:=Val;
         FLastCaptions[Tag]:=ValCaption;
      end;
      OnChangeValue(nil);
   end;
end;

procedure TfmParamFnd.edKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   Edit: TDBEditEh;
begin
   if Key=VK_DELETE then begin
      Edit:=TDBEditEh(Sender);
      Edit.Text:='';
      Edit.Hint:='';
      FLastValues[Edit.Tag]:='';
      FLastCaptions[Edit.Tag]:='';
      OnChangeValue(nil);
   end;
end;

procedure TfmParamFnd.btClearClick(Sender: TObject);
begin
   ClearValue;
end;

procedure TfmParamFnd.ClearValue;
var
   I: Integer;
   FindItem: TFindItem;
   FindField: TFindFieldItem;
   EditKind: TFieldEditKind;
   ValueKind: TFindValueKind;
   Oper: TOperItem;
   DatePart: TDateKind;
begin
   if not FIsTest then begin
      for I:=0 to Pred(FParams.Count) do begin
         FindItem:=FParams[I];
         FindField:=FindItem.Field;
         Oper:=FindItem.Oper;
         DatePart:=FindItem.DatePart;
         if (FindItem<>nil) and (FindField<>nil) and (Oper<>nil) then begin
            ValueKind:=FFilterInterface.GetValueKind(Oper, FindField);
            EditKind:=FFilterInterface.GetEditKind(Oper, FindField, DatePart);
            FControls.ClearValue(FindItem, EditKind, ValueKind);
         end;
         FLastCaptions[I]:='';
         FLastValues[I]:='';
      end;
      UpdateButton;
   end;
end;

function TfmParamFnd.CheckOneValue: Boolean;
var
   I: Integer;
   FindItem: TFindItem;
   FindField: TFindFieldItem;
   EditKind: TFieldEditKind;
   ValueKind: TFindValueKind;
   Oper: TOperItem;
   DatePart: TDateKind;
begin
   Result:=False;
   if not FIsTest then begin
      for I:=0 to Pred(FParams.Count) do begin
         FindItem:=FParams[I];
         FindField:=FindItem.Field;
         Oper:=FindItem.Oper;
         DatePart:=FindItem.DatePart;
         if (FindItem<>nil) and (FindField<>nil) and (Oper<>nil) then begin
            ValueKind:=FFilterInterface.GetValueKind(Oper, FindField);
            EditKind:=FFilterInterface.GetEditKind(Oper, FindField, DatePart);
            Result:=FControls.IsValue(FindItem, EditKind, ValueKind, Oper.TwoValue);
            if Result then begin
               Break;
            end;
         end;
      end;
   end;
end;

function TfmParamFnd.GetFindFieldCaption(FindItem: TFindItem): string;
var
  s:String;
begin
   Result:=FindItem.Field.AddCaption;
   if (ffkDate in FindItem.Field.Kinds) and (FindItem.DatePart<>dkFull) then begin
      if ffkAge in FindItem.Field.Kinds  then s:=CDateKindName[FindItem.DatePart] else s:=CDateKindName2[FindItem.DatePart];
      Result:=Result+' '+s;
   end;
end;

end.
