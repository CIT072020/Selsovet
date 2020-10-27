// форма дл€ редактировани€ свойств визуальных элементов управлени€
unit fFindPrp; // property edit form [11.10.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, Grids, TypInfo, Mask, DBCtrlsEh, ImgList, IniFiles,
   mFindPrp, mFindInt, mRTD;

type
   TfmFindPrp=class(TForm)
      dgProp: TDrawGrid;
      paTop: TPanel;
      cbFields: TComboBox;
      lbControl: TListBox;
      spTop: TSplitter;
      imCheck: TImageList;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
      procedure FormResize(Sender: TObject);
      procedure OnExit(Sender: TObject);
      procedure dgPropDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
      procedure dgPropKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure dgPropSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
      procedure dgPropMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure dgPropMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure dgPropMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure dgPropDblClick(Sender: TObject);
      procedure dgPropMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
      procedure dgPropMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
      procedure dgPropClick(Sender: TObject);
      procedure cbFieldsChange(Sender: TObject);
      procedure lbControlClick(Sender: TObject);
      procedure cbFieldsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
      procedure lbControlDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
      procedure spTopCanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
      procedure paTopResize(Sender: TObject);
      procedure OnSelect(Control: TControl);
      procedure OnUpdate(Control: TControl);
      procedure dgPropTopLeftChanged(Sender: TObject) ;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure lbControlDblClick(Sender: TObject);
   private
      FFields: TFieldCtrlList;
      FComponent: TComponent;
      FCtrl: TCtrlItem;
      FNames: TStringList;
      FProps: TStringList;
      FTranslate: TStringList;
      //
      FRowHeight: Integer;
      FVisibleRow: Integer;
      FEdit: TEdit;
      FCombo: TDBComboBoxEh;
      FColSizing: Boolean;
      FSelRow: Integer;
      FMouseDown: Boolean;
      FCurRow: Integer;
      FMouseWheel: Boolean;
      FSizePanel: Boolean;
      FSection: string;
      FIni: TCustomIniFile;
      FDesigner: TDesigner;
      //
      //FOldOnSelect: TSelectEvent;
      //
      FCloseHandle: HWND;
      FDefParent: TWinControl;
      FInSetControl: Boolean;
   private
      procedure TreeNodeClick;
      //
      procedure SelectRow;
      procedure UpdatePropValue(Sender: TObject);
      procedure UpdateCurrentPropValue;
      //
      function CalcFormHeight(Rows: Integer): Integer;
      function GetPropText(Name: string): string;
      function GetEnumPropText(Name: string): string;
      procedure SetPropText(Name: string; Value: string);
      procedure SetEnumPropText(Name: string; Value: string);
      function GetPropKind(Name: string): TTypeKind;
      procedure SetNewWidth(X: Integer);
      procedure SetBoolean;
      //
      procedure Init(Designer: TDesigner; Translate, Props: TStringList);
      procedure AddNewField(Field: TFieldCtrl);
      procedure SetFields(Fields: TFieldCtrlList);
      procedure SetField(Field: TFieldCtrl; Select: Boolean);
      procedure SetControl(Ctrl: TCtrlItem; Select: Boolean);
   public
      procedure LoadLayout(Section: string; Ini: TCustomIniFile);
      procedure SaveLayout;
      procedure UpdateCurrent;
      procedure UpdateCtrl(Ctrl: TCtrlItem);
      procedure UnDeleteCtrl(Ctrl: TCtrlItem);
      procedure DeleteCtrl(Ctrl: TCtrlItem);
      procedure RemoveCtrl(Ctrl: TCtrlItem);
      procedure MultiSelect;
   public
      property Designer: TDesigner read FDesigner write FDesigner;
      property CloseHandle: HWND read FCloseHandle write FCloseHandle;
      property DefParent: TWinControl read FDefParent write FDefParent;
      //property OldOnSelect: TSelectEvent read FOldOnSelect write FOldOnSelect;
   end;

procedure ShowPropertyEdit(Designer: TDesigner; Fields: TFieldCtrlList; Props, Translate: TStringList; Section: string; Ini: TCustomIniFile; CloseHandle: HWND; DefParent: TWinControl);
procedure HidePropertyEdit;

var
   PropertyEdit: TfmFindPrp;

const
   CMaxDropDown=20;

implementation

{$R *.DFM}

procedure ShowPropertyEdit(Designer: TDesigner; Fields: TFieldCtrlList; Props, Translate: TStringList; Section: string; Ini: TCustomIniFile; CloseHandle: HWND; DefParent: TWinControl);
begin
   if PropertyEdit=nil then begin
      PropertyEdit:=TfmFindPrp.Create(Application);
      PropertyEdit.Init(Designer, Translate, Props);
      PropertyEdit.SetFields(Fields);
      PropertyEdit.LoadLayout(Section, Ini);
      PropertyEdit.CloseHandle:=CloseHandle;
      PropertyEdit.DefParent:=DefParent;
   end;
   PropertyEdit.Show;
end;

procedure HidePropertyEdit;
begin
   if PropertyEdit<>nil then begin
      PropertyEdit.Designer.OnSelect:=nil;
      PropertyEdit.Designer.OnUpdate:=nil;
      PropertyEdit.SaveLayout;
      PropertyEdit.Hide;
      PropertyEdit.Free;
      PropertyEdit:=nil;
   end;
end;

function GetItemCaption(Strings: TStrings; Ind: Integer; var AddWidth: Integer; var IsBold: Boolean): string;
begin
   AddWidth:=2+2+16;
   IsBold:=False;
   Result:=Strings[Ind];
end;

procedure TfmFindPrp.dgPropDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   S: string;
   Prop: string;
   P: Integer;
   Ind: Integer;
begin
   // очищаем область рисовани€
   if (ARow=dgProp.Row) and (ACol=1) then begin
      dgProp.Canvas.Brush.Color:=clWindow;
   end
   else begin
      dgProp.Canvas.Brush.Color:=clBtnFace;
   end;
   dgProp.Canvas.FillRect(Rect);
   // рисуем линии
   dgProp.Canvas.Pen.Width:=1;
   if ARow=dgProp.Row then begin
      Dec(Rect.Top, 1);
      if ACol=0 then begin
         DrawEdge(dgProp.Canvas.Handle, Rect, EDGE_SUNKEN, BF_LEFT or BF_TOP or BF_BOTTOM);
      end
      else begin
         DrawEdge(dgProp.Canvas.Handle, Rect, EDGE_SUNKEN, BF_RIGHT or BF_TOP or BF_BOTTOM);
      end;
      Inc(Rect.Top, 1);
   end
   else begin
      if ACol=1 then begin
         dgProp.Canvas.Pen.Color:=clBtnHighlight;
         dgProp.Canvas.MoveTo(Rect.Left, Pred(Rect.Top));
         dgProp.Canvas.LineTo(Rect.Left, Rect.Bottom);
         dgProp.Canvas.Pen.Color:=clBtnShadow;
      end
      else begin
         dgProp.Canvas.Pen.Color:=clBtnShadow;
         dgProp.Canvas.MoveTo(Rect.Left, Rect.Bottom);
      end;
      dgProp.Canvas.LineTo(Rect.Right, Rect.Bottom);
      dgProp.Canvas.LineTo(Rect.Right, Pred(Rect.Top));
   end;
   if FNames.Count>0 then begin
      Prop:=FNames.Names[ARow];
      // выводим названи€ и свойтсва
      if (FNames.Count>0) and (ARow<FNames.Count) then begin
         Inc(Rect.Top, 1);
         Dec(Rect.Bottom, 1);
         Dec(Rect.Right, 2);
         S:=FNames.Values[Prop];
         P:=Pos('.', Prop);
         if ACol=1 then begin
            if P<>0 then begin
               S:=GetEnumPropText(Prop);
            end
            else begin
               S:=GetPropText(Prop);
            end;
            dgProp.Canvas.Font.Color:=clNavy;
            Inc(Rect.Left, 2);
         end
         else begin
            Inc(Rect.Left, 14);
            dgProp.Canvas.Font.Color:=clBlack;
            if P<>0 then begin
               Ind:=FTranslate.IndexOfName(Prop);
               if Ind<>-1 then begin
                  S:=FTranslate.Values[Prop];
               end;
               S:='    '+S;
            end;
         end;
         DrawText(dgProp.Canvas.Handle, PChar(S), Length(S), Rect, DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
      end;
      // рисуем плюсик дл€ множеств
      if (ACol=0) and (GetPropKind(Prop)=tkSet) then begin
         Dec(Rect.Left, 11);
         Inc(Rect.Top, 3);
         dgProp.Canvas.Brush.Color:=clWindow;
         dgProp.Canvas.FillRect(Bounds(Rect.Left, Rect.Top, 8, 8));
         dgProp.Canvas.Pen.Color:=clWindowText;
         dgProp.Canvas.MoveTo(Rect.Left, Rect.Top);
         dgProp.Canvas.LineTo(Rect.Left, Rect.Top+8);
         dgProp.Canvas.LineTo(Rect.Left+8, Rect.Top+8);
         dgProp.Canvas.LineTo(Rect.Left+8, Rect.Top);
         dgProp.Canvas.LineTo(Rect.Left, Rect.Top);
         if FNames.Objects[ARow]=nil then begin
            dgProp.Canvas.MoveTo(Rect.Left+4, Rect.Top+2);
            dgProp.Canvas.LineTo(Rect.Left+4, Rect.Top+7);
            dgProp.Canvas.MoveTo(Rect.Left+2, Rect.Top+4);
            dgProp.Canvas.LineTo(Rect.Left+7, Rect.Top+4);
         end
         else begin
            dgProp.Canvas.MoveTo(Rect.Left+2, Rect.Top+4);
            dgProp.Canvas.LineTo(Rect.Left+7, Rect.Top+4);
         end;
      end;
   end;
end;

procedure TfmFindPrp.FormCreate(Sender: TObject);
begin
   //FOldOnSelect:=nil;
   dgProp.DoubleBuffered:=True;
   cbFields.DoubleBuffered:=True;
   FSizePanel:=False;
   FSelRow:=-1;
   FCurRow:=-1;
   FMouseDown:=False;
   FColSizing:=False;
   FMouseWheel:=False;
   FNames:=TStringList.Create;
   FProps:=TStringList.Create;
   FTranslate:=TStringList.Create;
   OnCanResize:=nil;
   FVisibleRow:=10;
   FRowHeight:=GetFontHeight(dgProp.Font.Height, dgProp.Font.Name)+4; {17}
   dgProp.RowCount:=FVisibleRow;
   dgProp.DefaultRowHeight:=FRowHeight;
   Height:=CalcFormHeight(FVisibleRow);
   FEdit:=TEdit.Create(Self);
   FEdit.Visible:=False;
   FEdit.BorderStyle:=bsNone;
   FEdit.Height:=FRowHeight-4;
   FEdit.Parent:=dgProp;
   FEdit.OnExit:=OnExit;
   FEdit.OnKeyDown:=dgPropKeyDown;
   FCombo:=TDBComboBoxEh.Create(Self);
   FCombo.Visible:=False;
   FCombo.BorderStyle:=bsNone;
   FCombo.Height:=FRowHeight-3;
   FCombo.Parent:=dgProp;
   FCombo.OnExit:=OnExit;
   FCombo.OnKeyDown:=dgPropKeyDown;
   OnCanResize:=FormCanResize;
   FInSetControl:=False;
end;

procedure TfmFindPrp.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
var
   R: Integer;
begin
   R:=(NewHeight-Height) div (FRowHeight+dgProp.GridLineWidth);
   NewHeight:=Height+(R*(dgProp.GridLineWidth+FRowHeight));
   Resize:=True;
end;

function TfmFindPrp.CalcFormHeight(Rows: Integer): Integer;
var
   H: Integer;
begin
   H:=(Height-ClientHeight)+paTop.Height+(dgProp.Height-dgProp.ClientHeight);
   Result:=H+FRowHeight*Rows+(dgProp.GridLineWidth*Rows);
end;

procedure TfmFindPrp.FormResize(Sender: TObject);
begin
   if (dgProp.ColWidths[0]+dgProp.ColWidths[1]+2)<>dgProp.ClientWidth then begin
      SetNewWidth(dgProp.ColWidths[0]);
   end;
   SetComboBoxDropDownWidth(cbFields, GetSystemMetrics(SM_CXFULLSCREEN)-ClientWidth, GetItemCaption);
   SetListBoxMaxWidth(lbControl, 12+4, True);
   SelectRow;
end;

procedure TfmFindPrp.FormDestroy(Sender: TObject);
begin
   FNames.Free;
   FProps.Free;
   FTranslate.Free;
end;

function TfmFindPrp.GetPropText(Name: string): string;
begin
   Result:='';
   if FCtrl<>nil then begin
      Result:=FCtrl.GetProp(Name);
   end;
end;

procedure TfmFindPrp.dgPropKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_DOWN, VK_UP, VK_PRIOR, VK_NEXT: begin
         if not (ssAlt in Shift) then begin
            UpdatePropValue(Sender);
            dgProp.Perform(WM_KEYDOWN, Key, 0);
            SelectRow;
            Key:=0;
         end;
      end;
      VK_ESCAPE: begin
         if FEdit.Visible then begin
            FEdit.Text:=GetPropText(FNames.Names[dgProp.Row]);
            FEdit.SelectAll;
         end;
      end;
   end;
end;

procedure TfmFindPrp.dgPropSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
   P: TPoint;
begin
   GetCursorPos(P);
   P:=dgProp.ScreenToClient(P);
   if ARow>=FNames.Count then begin
      CanSelect:=False;
   end
   else if (FColSizing) or (P.X>=(dgProp.ColWidths[0]-1)) and (P.X<=(dgProp.ColWidths[0]+1)) then begin
      CanSelect:=False;
   end;
end;

function TfmFindPrp.GetPropKind(Name: string): TTypeKind;
var
   PropInfo: PPropInfo;
   PropType: PPTypeInfo;
   TypeData: PTypeData;
   I: Integer;
   S: string;
begin
   Result:=tkUnknown;
   if FComponent=nil then begin
      Exit;
   end;
   PropInfo:=GetPropInfo(FComponent.ClassInfo, Name);
   if PropInfo<>nil then begin
      PropType:=PropInfo.PropType;
      Result:=PropType^.Kind;
      if Result=tkEnumeration then begin
         FCombo.Items.Clear;
         FCombo.KeyItems.Clear;
         TypeData:=GetTypeData(PropType^);
         if PropType^=TypeInfo(Boolean) then begin
            SetBoolean;
         end
         else begin
            FCombo.Clear;
            FCombo.OnChange:=nil;
            for I:=TypeData.MinValue to TypeData.MaxValue do begin
               S:=GetEnumName(PropType^, I);
               FCombo.Items.Add(S);
               FCombo.KeyItems.Add(S);
            end;
         end;
      end;
   end;
end;

procedure TfmFindPrp.OnExit(Sender: TObject);
begin
   UpdatePropValue(Sender);
end;

type
   TC=class(TControl);

procedure TfmFindPrp.SetPropText(Name, Value: string);
begin
   if FCtrl<>nil then begin
      try
         if FCtrl.SetProp(Name, Value) then begin
            if (FComponent is TControl) and Assigned(TC(FComponent).OnResize) then begin
               TC(FComponent).OnResize(FComponent);
            end;
         end;
      except
         ShowMessageFmt('ќшибка установки значени€ "%s"', [Value]);
         if FEdit.Visible and FEdit.CanFocus then begin
            FEdit.SetFocus;
         end;
         if FCombo.Visible and FCombo.CanFocus then begin
            FCombo.SetFocus;
         end;
      end;
   end;
end;

procedure TfmFindPrp.dgPropMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   if ((X>=(dgProp.ColWidths[0]-1)) and (X<=(dgProp.ColWidths[0]+1))) or FColSizing then begin
      dgProp.Cursor:=crHSplit;
      if FColSizing then begin
         SetNewWidth(X);
      end;
   end
   else begin
      dgProp.Cursor:=crDefault;
      if FMouseDown and (dgProp.Row<>FSelRow) then begin
         FSelRow:=dgProp.Row;
         SelectRow;
         dgProp.Invalidate;
         dgProp.Update;
      end;
   end;
end;

procedure TfmFindPrp.dgPropMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (X>=(dgProp.ColWidths[0]-1)) and (X<=(dgProp.ColWidths[0]+1)) and (Button=mbLeft) then begin
      FColSizing:=True;
      Exit;
   end;
   if (X>2) and (X<14) then begin
      TreeNodeClick;
      Exit;
   end;
   if Button=mbLeft then begin
      FSelRow:=dgProp.Row;
      FMouseDown:=True;
      SelectRow;
   end;
end;

procedure TfmFindPrp.dgPropMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FSelRow:=-1;
   FMouseDown:=False;
   if FColSizing then begin
      SetNewWidth(X);
   end;
   FColSizing:=False;
end;

procedure TfmFindPrp.SetNewWidth(X: Integer);
begin
   dgProp.ColWidths[0]:=X;
   dgProp.ColWidths[1]:=dgProp.ClientWidth-X-2;
   SelectRow;
end;

procedure TfmFindPrp.dgPropDblClick(Sender: TObject);
var
   pt: TPoint;
begin
   GetCursorPos(pt);
   pt:=dgProp.ScreenToClient(pt);
   if not ((pt.x>2) and (pt.x<14)) then begin
      TreeNodeClick;
   end;
end;

procedure TfmFindPrp.SetBoolean;
begin
   FCombo.Clear;
   FCombo.Items.Add('Ќет');
   FCombo.KeyItems.Add('Ќет');
   FCombo.Items.Add('ƒа');
   FCombo.KeyItems.Add('ƒа');
end;

function TfmFindPrp.GetEnumPropText(Name: string): string;
var
   P: Integer;
   Prop: string;
   EnumName: string;
   Value: string;
begin
   P:=Pos('.', Name);
   EnumName:=Copy(Name, Succ(P), Length(Name)-P);
   Prop:=Copy(Name, 1, Pred(P));
   Value:=GetPropText(Prop);
   if Pos(EnumName, Value)<>0 then begin
      Result:='ƒа';
   end
   else begin
      Result:='Ќет';
   end;
end;

procedure TfmFindPrp.SetEnumPropText(Name, Value: string);
var
   P: Integer;
   Prop: string;
   EnumName: string;
   NewValue: string;
   S: string;
begin
   P:=Pos('.', Name);
   EnumName:=Copy(Name, Succ(P), Length(Name)-P);
   Prop:=Copy(Name, 1, Pred(P));
   NewValue:=GetPropText(Prop);
   if Value='ƒа' then begin
      if Pos(EnumName, NewValue)=0 then begin
         Delete(NewValue, 1, 1);
         if NewValue=']' then begin
            NewValue:='['+EnumName+NewValue;
         end
         else begin
            NewValue:='['+EnumName+','+NewValue;
         end;
      end;
   end
   else begin
      S:=NewValue;
      if Pos(EnumName, NewValue)<>0 then begin
         NewValue:=StringReplace(S, ','+EnumName, '', [rfReplaceAll, rfIgnoreCase]);
         if S=NewValue then begin
            NewValue:=StringReplace(S, EnumName+',', '', [rfReplaceAll, rfIgnoreCase]);
            if S=NewValue then begin
               NewValue:='['+StringReplace(S, '['+EnumName, '', [rfReplaceAll, rfIgnoreCase]);
            end;
         end;
      end;
   end;
   SetPropText(Prop, NewValue);
   dgProp.Invalidate;
   dgProp.Update;
end;

procedure TfmFindPrp.SelectRow;
var
   P: Integer;
   Prop: string;
begin
   if dgProp.Row<FNames.Count then begin
      FCurRow:=dgProp.Row;
      Prop:=FNames.Names[dgProp.Row];
      P:=Pos('.', Prop);
      if GetPropKind(Prop)=tkEnumeration then begin
         FEdit.Visible:=False;
         FCombo.Top:=dgProp.Row*(dgProp.DefaultRowHeight+dgProp.GridLineWidth)+1-(dgProp.TopRow*(dgProp.DefaultRowHeight+dgProp.GridLineWidth));
         FCombo.Left:=dgProp.ColWidths[0]+3;
         FCombo.Width:=dgProp.ColWidths[1]-4;
         FCombo.Text:=GetPropText(Prop);
         FCombo.Visible:=True;
         if Visible and FCombo.Visible and FCombo.CanFocus then begin
            FCombo.SetFocus;
         end;
      end
      else if P<>0 then begin
         FEdit.Visible:=False;
         FCombo.Top:=dgProp.Row*(dgProp.DefaultRowHeight+dgProp.GridLineWidth)+1-(dgProp.TopRow*(dgProp.DefaultRowHeight+dgProp.GridLineWidth));
         FCombo.Left:=dgProp.ColWidths[0]+3;
         FCombo.Width:=dgProp.ColWidths[1]-4;
         SetBoolean;
         FCombo.Text:=GetEnumPropText(Prop);
         FCombo.Visible:=True;
         if Visible and FCombo.Visible and FCombo.CanFocus then begin
            FCombo.SetFocus;
         end;
      end
      else begin
         FCombo.Visible:=False;
         FEdit.Top:=dgProp.Row*(dgProp.DefaultRowHeight+dgProp.GridLineWidth)+2-(dgProp.TopRow*(dgProp.DefaultRowHeight+dgProp.GridLineWidth));
         FEdit.Left:=dgProp.ColWidths[0]+3;
         FEdit.Width:=dgProp.ColWidths[1]-4;
         FEdit.Text:=GetPropText(FNames.Names[dgProp.Row]);
         FEdit.Visible:=True;
         if Visible and FEdit.Visible and FEdit.CanFocus then begin
            FEdit.SetFocus;
         end;
         if GetPropKind(Prop)=tkSet then begin
            FEdit.ReadOnly:=True;
         end
         else begin
            FEdit.ReadOnly:=False;
         end;
      end;
   end;
end;

procedure TfmFindPrp.UpdatePropValue(Sender: TObject);
var
   Prop: string;
   P: Integer;                   
begin
   if (Sender is TEdit) and (FEdit.Visible) then begin
      Prop:=FNames.Names[FCurRow];
      SetPropText(Prop, FEdit.Text);
   end
   else if (Sender is TDBComboBoxEh) and (FCombo.Visible) then begin
      Prop:=FNames.Names[FCurRow];
      P:=Pos('.', Prop);
      if P<>0 then begin
         SetEnumPropText(Prop, FCombo.Text);
      end
      else begin
         SetPropText(Prop, FCombo.Text);
      end;
   end;
end;

procedure TfmFindPrp.dgPropMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
   FMouseWheel:=True;
end;

procedure TfmFindPrp.dgPropMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
   FMouseWheel:=True;
end;

procedure TfmFindPrp.dgPropClick(Sender: TObject);
begin
   if FMouseWheel then begin
      UpdateCurrentPropValue;
      SelectRow;
   end;
   FMouseWheel:=False;
end;

procedure TfmFindPrp.Init(Designer: TDesigner; Translate, Props: TStringList);
begin
   FDesigner:=Designer;
   //FOldOnSelect:=FDesigner.OnSelect;
   FDesigner.OnSelect:=OnSelect;
   FDesigner.OnUpdate:=OnUpdate;
   if FTranslate<>Translate then begin
      FTranslate.Assign(Translate);
   end;
   if Props<>FProps then begin
      FProps.Assign(Props);
   end;
end;

procedure TfmFindPrp.LoadLayout(Section: string; Ini: TCustomIniFile);
begin
   FSection:=Section;
   FIni:=Ini;
   SetComboBoxHeight(cbFields, 1);
   SetListBoxHeight(lbControl);
   if (FIni<>nil) and (FSection<>'') then begin
      Top:=FIni.ReadInteger(FSection, 'fFindPrp.Top', Top);
      Left:=FIni.ReadInteger(FSection, 'fFindPrp.Left', Left);
      Width:=FIni.ReadInteger(FSection, 'fFindPrp.Width', Width);
      Height:=FIni.ReadInteger(FSection, 'fFindPrp.Height', Height);
      paTop.Height:=FIni.ReadInteger(FSection, 'fFindPrp.paTop.Height', paTop.Height);
      dgProp.ColWidths[0]:=FIni.ReadInteger(FSection, 'fFindPrp.dgProp.ColWidths0', dgProp.ColWidths[0]);
   end;
   paTop.Width:=ClientWidth;
   cbFields.Width:=ClientWidth;
   lbControl.Width:=ClientWidth;
   //lbControl.Top:=???
   lbControl.Height:=paTop.ClientHeight-lbControl.Top;
end;

procedure TfmFindPrp.SaveLayout;
begin
   if (FIni<>nil) and (FSection<>'') then begin
      FIni.WriteInteger(FSection, 'fFindPrp.Top', Top);
      FIni.WriteInteger(FSection, 'fFindPrp.Left', Left);
      FIni.WriteInteger(FSection, 'fFindPrp.Width', Width);
      FIni.WriteInteger(FSection, 'fFindPrp.Height', Height);
      FIni.WriteInteger(FSection, 'fFindPrp.paTop.Height', paTop.Height);
      FIni.WriteInteger(FSection, 'fFindPrp.dgProp.ColWidths0', dgProp.ColWidths[0]);
   end;
end;

procedure TfmFindPrp.SetFields(Fields: TFieldCtrlList);
var
   I: Integer;
   Field: TFieldCtrl;
begin
   FFields:=Fields;
   // инициализаци€ ComboBox
   cbFields.Items.BeginUpdate;
   try
      cbFields.Items.Clear;
      for I:=0 to Pred(FFields.Count) do begin
         Field:=FFields[I];
         if Field<>nil then begin
            cbFields.Items.AddObject(Field.Caption, Field);
         end;
      end;
   finally
      cbFields.Items.EndUpdate;
   end;
   // инициализаци€ первого выбранного пол€
   if cbFields.Items.Count>0 then begin
      cbFields.ItemIndex:=0;
      SetField(FFields[0], True);
      // инициализаци€ высоты выпадающего списка
      if cbFields.Items.Count>CMaxDropDown then begin
         cbFields.DropDownCount:=CMaxDropDown;
      end
      else begin
         cbFields.DropDownCount:=cbFields.Items.Count;
      end;
      // инициализаци€ ширины выпадающего списка
      SetComboBoxDropDownWidth(cbFields, GetSystemMetrics(SM_CXFULLSCREEN)-ClientWidth, GetItemCaption);
   end
   else begin
      SetField(nil, True);
   end;
end;

procedure TfmFindPrp.SetField(Field: TFieldCtrl; Select: Boolean);
var
   I: Integer;
   Ctrl: TCtrlItem;
begin
   // устанавливаем подсказку
   if Field=nil then begin
      Hint:='';
   end
   else begin
      Hint:=GetComboBoxHint(Field.Caption, cbFields, False);
   end;
   // провер€м, что такое полей есть в списке полей
   if (Field<>nil) and (cbFields.Items.IndexOfObject(Field)=-1) then begin
      AddNewField(Field);
   end;
   // инициализщируем список элементов управлени€ относ€щихс€ к данному полю
   lbControl.Items.BeginUpdate;
   try
      lbControl.Items.Clear;
      if Field<>nil then begin
         for I:=0 to Pred(Field.ControlCount) do begin
            Ctrl:=Field.Controls[I];
            if Ctrl<>nil then begin
               lbControl.Items.AddObject(Ctrl.Caption, Ctrl);
            end;
         end;
      end;
      // устанавливаем максимальную ширину
      SetListBoxMaxWidth(lbControl, 0, True);
   finally
      lbControl.Items.EndUpdate;
   end;
   // выбираем активным первый элемент
   if Select then begin
      if lbControl.Items.Count>0 then begin
         lbControl.ItemIndex:=0;
         SetControl(Field.Controls[0], True);
      end
      else begin
         SetControl(nil, True);
      end;
   end;
end;

procedure TfmFindPrp.SetControl(Ctrl: TCtrlItem; Select: Boolean);
var
   I: Integer;
   Ind: Integer;
   PropCount: Integer;
   PropList: PPropList;
   PropInfo: PPropInfo;
   S: string;
   RowCount: Integer;
begin
   UpdateCurrentPropValue;
   FCombo.Visible:=False;
   FEdit.Visible:=False;
   FCtrl:=Ctrl;
   FInSetControl:=True;
   try
      if Ctrl=nil then begin
         FComponent:=nil;
         FNames.Clear;
         dgProp.RowCount:=1;
         if Select then begin
            FDesigner.SelectControl(nil, False, False, False);
         end;
      end
      else begin
         FComponent:=Ctrl.Control;
         if Select then begin
            FDesigner.WinList.Clear;
            FDesigner.SelectControl(Ctrl.Control, False, False, False);
         end;
         PropCount:=GetPropList(FComponent.ClassInfo, [tkInteger, tkEnumeration, tkString, tkWChar, tkLString, tkWString, tkSet], nil);
         GetMem(PropList, PropCount*SizeOf(PPropInfo));
         try
            GetPropList(FComponent.ClassInfo, [tkInteger, tkEnumeration, tkString, tkWChar, tkLString, tkWString, tkSet], PropList);
            RowCount:=0;
            FNames.Clear;
            for I:=0 to Pred(PropCount) do begin
               PropInfo:=PropList[I];
               S:=PropInfo.Name;
               Ind:=FProps.IndexOfName(S);
               if Ind<>-1 then begin
                  S:=FProps[Ind];
                  FNames.Add(S);
                  Inc(RowCount);
               end;
            end;
            if RowCount>0 then begin
               dgProp.RowCount:=RowCount;
            end
            else begin
               dgProp.RowCount:=1;
            end;
            dgProp.Invalidate;
            dgProp.Update;
         finally
            FreeMem(PropList, PropCount*SizeOf(PPropInfo));
         end;
      end;
   finally
      FInSetControl:=False;
   end;
end;

procedure TfmFindPrp.cbFieldsChange(Sender: TObject);
var
   Field: TFieldCtrl;
begin
   if cbFields.ItemIndex<>-1 then begin
      Field:=TFieldCtrl(cbFields.Items.Objects[cbFields.ItemIndex]);
      SetField(Field, True);
   end
   else begin
      SetField(nil, True);
   end;
end;

procedure TfmFindPrp.lbControlClick(Sender: TObject);
var
   Ctrl: TCtrlItem;
   pt: TPoint;
begin
   if lbControl.ItemIndex<>-1 then begin
      Ctrl:=TCtrlItem(lbControl.Items.Objects[lbControl.ItemIndex]);
      SetControl(Ctrl, True);
   end
   else begin
      SetControl(nil, True);
   end;
   GetCursorPos(pt);
   pt:=lbControl.ScreenToClient(pt);
   if (FCtrl<>nil) and ((pt.X>=2) and (pt.X<=14)) then begin
      if FCtrl.IsDeleted then begin
         UnDeleteCtrl(FCtrl);
      end
      else begin
         DeleteCtrl(FCtrl);
      end;
   end;
end;

procedure TfmFindPrp.cbFieldsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
   S: string;
   Field: TFieldCtrl;
begin
   S:=cbFields.Items[Index];
   Field:=TFieldCtrl(cbFields.Items.Objects[Index]);
   cbFields.Canvas.Brush.Color:=cbFields.Color;
   cbFields.Canvas.FillRect(Rect);
   cbFields.Canvas.Font.Color:=cbFields.Font.Color;
   FFields.Images.Draw(cbFields.Canvas, Rect.Left+2, Rect.Top, Field.ImageIndex, True);
   Inc(Rect.Left, 2+2+16);
   DrawText(cbFields.Canvas.Handle, PChar(S), Length(S), Rect, DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
end;

procedure TfmFindPrp.lbControlDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
   S: string;
   Ctrl: TCtrlItem;
   ImageIndex: Integer;
begin
   S:=lbControl.Items[Index];
   Ctrl:=TCtrlItem(lbControl.Items.Objects[Index]);
   lbControl.Canvas.Brush.Color:=lbControl.Color;
   lbControl.Canvas.FillRect(Rect);
   if odSelected in State then begin
      if Ctrl.Visible then begin
         lbControl.Canvas.Font.Style:=[fsBold];
      end
      else begin
         lbControl.Canvas.Font.Style:=[fsBold, fsStrikeOut];
      end;
      //lbControl.Canvas.Font.Color:=clHighlightText;
      //lbControl.Canvas.Brush.Color:=clHighlight;
      lbControl.Canvas.Font.Color:=lbControl.Font.Color;
      lbControl.Canvas.Brush.Color:=lbControl.Color;
   end
   else begin
      if Ctrl.Visible then begin
         lbControl.Canvas.Font.Style:=[];
      end
      else begin
         lbControl.Canvas.Font.Style:=[fsStrikeOut];
      end;
      lbControl.Canvas.Font.Color:=lbControl.Font.Color;
      if Ctrl.Visible then begin
      end
      else begin
      end;
      lbControl.Canvas.Brush.Color:=lbControl.Color;
   end;
   if Ctrl.IsDeleted then begin
      ImageIndex:=1;
   end
   else begin
      ImageIndex:=0;
   end;
   imCheck.Draw(lbControl.Canvas, Rect.Left+2, Rect.Top+((lbControl.ItemHeight-11) div 2)-1, ImageIndex, True);
   Inc(Rect.Left, 12+4);
   DrawText(lbControl.Canvas.Handle, PChar(S), Length(S), Rect, DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
   if odSelected in State then begin
      Dec(Rect.Left, 12+4);
      DrawFocusRect(lbControl.Canvas.Handle, Rect);
      Inc(Rect.Left, 12+4);
   end;
   Dec(Rect.Left, 12+4);
   ExcludeClipRect(lbControl.Canvas.Handle, Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
end;

procedure TfmFindPrp.UpdateCurrentPropValue;
begin
   if FEdit.Visible then begin
      UpdatePropValue(FEdit);
   end
   else if FCombo.Visible then begin
      UpdatePropValue(FCombo);
   end;
end;

procedure TfmFindPrp.spTopCanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
var
   R: Integer;
begin
   R:=(NewSize-paTop.Height) div (FRowHeight+dgProp.GridLineWidth);
   NewSize:=paTop.Height+(R*(dgProp.GridLineWidth+FRowHeight));
   Accept:=True;
   FSizePanel:=True;
end;

procedure TfmFindPrp.paTopResize(Sender: TObject);
begin
   if FSizePanel then begin
      if (dgProp.ColWidths[0]+dgProp.ColWidths[1]+2)<>dgProp.ClientWidth then begin
         SetNewWidth(dgProp.ColWidths[0]);
      end;
      SelectRow;
   end;
   FSizePanel:=False;
end;

procedure TfmFindPrp.OnSelect(Control: TControl);
var
   Field: TFieldCtrl;
   Ctrl: TCtrlItem;
begin
   //if Assigned(FOldOnSelect) then begin
   //   FOldOnSelect(Control);
   //end;
   if (Control<>nil) and not FInSetControl then begin
      Field:=nil;
      Ctrl:=nil;
      UpdateCurrentPropValue;
      if FFields.FindControl(Control, Field, Ctrl) then begin
         SetField(Field, False);
         cbFields.ItemIndex:=cbFields.Items.IndexOfObject(Field);
         if FCtrl<>Ctrl then begin
            SetControl(Ctrl, False);
         end;
         lbControl.ItemIndex:=lbControl.Items.IndexOfObject(Ctrl);
      end;
   end;
end;

procedure TfmFindPrp.OnUpdate(Control: TControl);
var
   Field: TFieldCtrl;
   Ctrl: TCtrlItem;
begin
   Field:=nil;
   Ctrl:=nil;
   if Control<>nil then begin
      if FDesigner.WinList.Count=0 then begin
         UpdateCurrentPropValue;
         if FFields.FindControl(Control, Field, Ctrl) then begin
            SetControl(Ctrl, False);
            lbControl.ItemIndex:=lbControl.Items.IndexOfObject(Ctrl);
            Ctrl.UpdatePos;
         end;
      end
      else begin
         if FFields.FindControl(Control, Field, Ctrl) then begin
            Ctrl.UpdatePos;
         end;
      end;
   end;
end;

procedure TfmFindPrp.dgPropTopLeftChanged(Sender: TObject);
begin
   SelectRow;
end;

procedure TfmFindPrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SendMessage(FCloseHandle, WM_USER+1234, 0, 0);
end;

procedure TfmFindPrp.TreeNodeClick;
var
   Prop: string;
   I: LongInt;
   Ind: Integer;
   PropInfo: PPropInfo;
   PropType: PPTypeInfo;
   TypeData: PTypeData;
   S: string;
   AddCount: Integer;
begin
   if FComponent=nil then begin
      Exit;
   end;
   Prop:=FNames.Names[dgProp.Row];
   if GetPropKind(Prop)=tkSet then begin
      Ind:=FNames.IndexOfName(Prop);
      if Ind<>-1 then begin
         if FNames.Objects[Ind]=nil then begin
            PropInfo:=GetPropInfo(FComponent.ClassInfo, Prop);
            PropType:=PropInfo.PropType;
            TypeData:=GetTypeData(PropType^);
            PropType:=TypeData^.CompType;
            TypeData:=GetTypeData(PropType^);
            AddCount:=0;
            for I:=TypeData^.MinValue to TypeData^.MaxValue do begin
               Inc(AddCount);
               S:=GetEnumName(PropType^, I);
               FNames.InsertObject(Succ(Ind), Format('%s.%s=%s', [Prop, S, S]), TObject(I));
            end;
            FNames.Objects[Ind]:=TObject(AddCount);
            dgProp.RowCount:=dgProp.RowCount+AddCount;
            FormResize(nil);
            dgProp.Invalidate;
            dgProp.Update;
         end
         else begin
            AddCount:=Integer(FNames.Objects[Ind]);
            for I:=0 to Pred(AddCount) do begin
               FNames.Delete(Succ(Ind));
            end;
            FNames.Objects[Ind]:=nil;
            dgProp.RowCount:=dgProp.RowCount-AddCount;
            FormResize(nil);
            dgProp.Invalidate;
            dgProp.Update;
         end;
      end;
   end;
end;

procedure TfmFindPrp.UpdateCurrent;
begin
   SetControl(FCtrl, False);
end;

procedure TfmFindPrp.lbControlDblClick(Sender: TObject);
var
   pt: TPoint;
begin
   GetCursorPos(pt);
   pt:=lbControl.ScreenToClient(pt);
   if (FCtrl<>nil) and FCtrl.IsDeleted and (pt.X>14) then begin
      UnDeleteCtrl(FCtrl);
   end;
end;

procedure TfmFindPrp.DeleteCtrl(Ctrl: TCtrlItem);
begin
   if (Ctrl<>nil) and not Ctrl.IsDeleted then begin
      Ctrl.IsDeleted:=True;
      if Ctrl.Control<>nil then begin
         Ctrl.Control.Parent:=nil;
         FDesigner.SelectControl(nil, False, False, False);
      end;
      lbControl.Invalidate;
      lbControl.Update;
   end;
end;

procedure TfmFindPrp.UnDeleteCtrl(Ctrl: TCtrlItem);
begin
   if (Ctrl<>nil) and Ctrl.IsDeleted then begin
      Ctrl.IsDeleted:=False;
      if Ctrl.Control<>nil then begin
         Ctrl.Control.Parent:=DefParent;
         FDesigner.SelectControl(Ctrl.Control, False, False, False);
      end;
      lbControl.Invalidate;
      lbControl.Update;
   end;
end;

procedure TfmFindPrp.UpdateCtrl(Ctrl: TCtrlItem);
var
   Ind: Integer;
   Rect: TRect;
begin
   Ind:=lbControl.Items.IndexOfObject(Ctrl);
   if Ind<>-1 then begin
      Rect:=lbControl.ItemRect(Ind);
      InvalidateRect(lbControl.Handle, @Rect, False);
      lbControl.Update;
   end;
end;

procedure TfmFindPrp.AddNewField(Field: TFieldCtrl);
begin
   if Field<>nil then begin
      cbFields.Items.AddObject(Field.Caption, Field);
   end;
   // инициализаци€ высоты выпадающего списка
   if cbFields.Items.Count>CMaxDropDown then begin
      cbFields.DropDownCount:=CMaxDropDown;
   end
   else begin
      cbFields.DropDownCount:=cbFields.Items.Count;
   end;
   SetComboBoxDropDownWidth(cbFields, GetSystemMetrics(SM_CXFULLSCREEN)-ClientWidth, GetItemCaption);
end;

procedure TfmFindPrp.RemoveCtrl(Ctrl: TCtrlItem);
var
   Ind: Integer;
begin
   Ind:=lbControl.Items.IndexOfObject(Ctrl);
   if Ind<>-1 then begin
      SetControl(nil, False);
      lbControl.Items.Delete(Ind);
      // тут можно делать выбранным другой элемент
   end;
end;

procedure TfmFindPrp.MultiSelect;
begin
   SetField(nil, False);
   SetControl(nil, False);
   cbFields.ItemIndex:=-1;
end;

end.
