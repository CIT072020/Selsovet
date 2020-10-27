unit mRTD; // run-time designer [14.10.2004]
interface
uses
   Windows, Classes, Controls, Messages, Forms, SysUtils, Dialogs, Graphics,
   Menus, fDsgnSz, fDsgnAl, StdCtrls, ExtCtrls;

type

   TDesigner=class;

   TDesignState=(dsNone, dsSelect, dsMove);

   TDesignCommand=(dcNone, dcSizeTopLeft, dcSizeTop, dcSizeTopRight, dcSizeBottomLeft,
   dcSizeBottom, dcSizeBottomRight, dcSizeLeft, dcSizeRight, dcMove);

   TDesignWindow=class(TWinControl)
   private
      FControl: TControl;
      FDesigner: TDesigner;
      FState: TDesignState;
      //FPrevState: TDesignState;
      FIsMouseDown: Boolean;
      FStartX: Integer;
      FStartY: Integer;
      FDesignCommand: TDesignCommand;
      FUpdating: Boolean;
      FMultiSelect: Boolean;
   private
      procedure ResizeControl(Sender: TObject);
      procedure DrawRect(DC: HDC);
      procedure DrawSelect(DC: HDC);
      procedure DrawMultiSelect(DC: HDC);
      procedure SetState(const Value: TDesignState);
      procedure SetClipMouse;
      procedure ResetClipMouse;
      procedure CheckScrollWindow(Start: Boolean);
   protected
      procedure PaintWindow(DC: HDC); override;
      procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
      procedure WMLButtonDown(var Msg: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WMEraseBkgnd(var Msg: TMessage); message WM_ERASEBKGND;
      procedure WMGetDlgCode(var Msg: TWMGetDlgCode); message WM_GETDLGCODE;
      procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
      procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
      procedure CreateParams(var Params: TCreateParams ); override;
      procedure KeyDown(var Key: Word; Shift: TShiftState); override;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure ClearControl;
      procedure SetControl(Control: TControl);
      procedure UpdatePos;
   public
      property Control: TControl read FControl write FControl;
      property Designer: TDesigner read FDesigner write FDesigner;
      property State: TDesignState read FState write SetState;
      property IsMouseDown: Boolean read FIsMouseDown write FIsMouseDown;
      property StartX: Integer read FStartX write FStartX;
      property StartY: Integer read FStartY write FStartY;
      property DesignCommand: TDesignCommand read FDesignCommand write FDesignCommand;
      property MultiSelect: Boolean read FMultiSelect write FMultiSelect;
   end;

   TDesignWinList=class(TObject)
   private
      FOwner: TComponent;
      FDesigner: TDesigner;
      FList: TList;
      FMoveInd: Integer;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TDesignWindow;
      function HasParent(Control: TControl): Boolean;
   public
      constructor Create(AOwner: TComponent; Designer: TDesigner);
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TDesignWindow): Integer;
      function AddNew(Control: TControl): TDesignWindow;
      procedure Delete(I: Integer);
      procedure Del(Control: TControl);
      function IsControl(Control: TControl): Boolean;
      function IndexOf(Win: TControl): Integer;
      function IndexOfControl(Control: TControl): Integer;
      //
      procedure StartMove(Ind: Integer);
      procedure Move(DX, DY: Integer);
      procedure StopMove;
      //
      procedure Shift(DX, DY: Integer);
      procedure Grow(DX1, DY1, DX2, DY2: Integer);
      //
      function GetMinWidth: Integer;
      function GetMaxWidth: Integer;
      function GetMaxHeight: Integer;
      function GetMinHeight: Integer;
      //
      procedure SetWidth(NewWidth: Integer);
      procedure SetHeight(NewHeight: Integer);
      //
      function GetMinLeft: Integer;
      function GetMinTop: Integer;
      function GetMaxRight: Integer;
      function GetMaxBottom: Integer;
      //
      procedure SetLeft(NewLeft: Integer);
      procedure SetTop(NewTop: Integer);
      procedure SetRight(NewRight: Integer);
      procedure SetBottom(NewBottom: Integer);
      procedure SetHorzCenter(MinLeft, MaxRight: Integer);
      procedure SetVertCenter(MinTop, MaxBottom: Integer);
      procedure SetHorzEqual(MinLeft, MaxRight: Integer);
      procedure SetVertEqual(MinTop, MaxBottom: Integer);
      //
      procedure RemoveChild;
      //
      function GetFirstParented: TDesignWindow;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TDesignWindow read GetItem; default;
      property Designer: TDesigner read FDesigner;
   end;

   TSelectEvent=procedure(Control: TControl) of object;
   TNewControlEvent=procedure(Control: TControl; Name: string) of object;
   TCanSelectEvent=function(var Control: TControl): Boolean of object;
   TNewControlNameEvent=function(Control: TControl; ClassName: string): string of object;

   TDesigner=class(TInterfacedObject, {$IFDEF VER150} IDesignerHook {$ELSE} IDesigner {$ENDIF})
   private
      FForm: TCustomForm;
      FIsControl: Boolean;
      FGridStep: Integer;
      //FSelControl: TControl;
      FWin: TDesignWindow;
      FWinList: TDesignWinList;
      FMultiSelect: Boolean;
      FPopupMenu: TPopupMenu;
      FAddMode: Boolean;
      FAddClass: TControlClass;
   private
      FOnSelect: TSelectEvent;
      FOnMultiSelect: TNotifyEvent;
      FOnUpdate: TSelectEvent;
      FOnCanSelect: TCanSelectEvent;
      FOnCut: TSelectEvent;
      FOnNewControl: TNewControlEvent;
      FOnNewControlName: TNewControlNameEvent;
   protected
      //
      procedure DoUpdate(Control: TControl);
      procedure DoSelect(Control: TControl);
      procedure DoMultiSelect;
      procedure DoCut(Control: TControl);
      procedure DoNewControl(Control: TControl; Name: string);
      function DoNewControlName(Control: TControl; ClassName: string): string;
      //
      function CanSelect(var Control: TControl): Boolean;
      function GetCustomForm: TCustomForm;
      procedure SetCustomForm(Value: TCustomForm);
      function GetIsControl: Boolean;
      procedure SetIsControl(Value: Boolean);
      //function GetControlLeft: Integer;
      //procedure SetControlLeft(Value: Integer);
      //function GetControlTop: Integer;
      //procedure SetControlTop(Value: Integer);
   public
      constructor Create;
      destructor Destroy; override;
      // IDesignerNotify
      procedure Modified;
      procedure Notification(AnObject: TPersistent; Operation: TOperation);
      // IDesigner
      function IsDesignMsg(Sender: TControl; var Msg: TMessage): Boolean;
      procedure PaintGrid;
      procedure ValidateRename(AComponent: TComponent; const CurName, NewName: string);
      function UniqueName(const BaseName: string): string;
      function GetRoot: TComponent;
      //
      procedure SelectControl(Control: TControl; Capture: Boolean; fShift, fCtrl: Boolean);
      procedure SelectNext(CurControl: TControl);
      procedure SelectPrior(CurControl: TControl);
      procedure SelectLeft(CurControl: TControl);
      procedure SelectRight(CurControl: TControl);
      procedure SelectUp(CurControl: TControl);
      procedure SelectDown(CurControl: TControl);
      //
      procedure ShowAlignDialog;
      procedure ShowSizeDialog;
      //
      procedure Cut;
      //
      procedure StartAddControl(ControlClass: TControlClass);
      procedure StopAddControl;
      function AddControl(X, Y: Integer; AOwner, AParent: TWinControl): Boolean;
   public
      property IsControl: Boolean read GetIsControl write SetIsControl;
      property Form: TCustomForm read GetCustomForm write SetCustomForm;
      property GridStep: Integer read FGridStep write FGridStep;
      property OnSelect: TSelectEvent read FOnSelect write FOnSelect;
      property OnMultiSelect: TNotifyEvent read FOnMultiSelect write FOnMultiSelect;
      property OnUpdate: TSelectEvent read FOnUpdate write FOnUpdate;
      property OnCanSelect: TCanSelectEvent read FOnCanSelect write FOnCanSelect;
      property WinList: TDesignWinList read FWinList;
      property Win: TDesignWindow read FWin;
      property PopupMenu: TPopupMenu read FPopupMenu write FPopupMenu;
      property OnCut: TSelectEvent read FOnCut write FOnCut;
      property OnNewControl: TNewControlEvent read FOnNewControl write FOnNewControl;
      property OnNewControlName: TNewControlNameEvent read FOnNewControlName write FOnNewControlName;
   end;

implementation
uses
   mFindInt;
   
type
   TC=class(TControl);

{ TDesigner }

function TDesigner.AddControl(X, Y: Integer; AOwner, AParent: TWinControl): Boolean;
var
   Value: string;
   NewControl: TControl;
begin
   Result:=False;
   Value:='Новый элемент';
   if InputQueryR('Добавить новый элемент', 'Название:', Value) and (Trim(Value)<>'') then begin
      Result:=True;
      Value:=Trim(Value);
      NewControl:=FAddClass.Create(AOwner);
      NewControl.Top:=Y;
      NewControl.Left:=X;
      NewControl.Name:=DoNewControlName(NewControl, FAddClass.ClassName);
      NewControl.Parent:=AParent;
      NewControl.Visible:=True;
      if NewControl is TLabel then begin
         TLabel(NewControl).Caption:=Value;
      end
      else if NewControl is TRadioGroup then begin
         TRadioGroup(NewControl).Caption:=Value;
      end
      else if NewControl is TGroupBox then begin
         TGroupBox(NewControl).Caption:=Value;
      end;
      DoNewControl(NewControl, Value);
      SelectControl(NewControl, False, False, False);
   end;
end;

function TDesigner.CanSelect(var Control: TControl): Boolean;
begin
   Result:=True;
   if Assigned(FOnCanSelect) then begin
      Result:=FOnCanSelect(Control);
   end;
end;

constructor TDesigner.Create;
begin
   FForm:=nil;
   FWin:=TDesignWindow.Create(nil);
   FWinList:=TDesignWinList.Create(nil, Self);
   FWin.Designer:=Self;
   FIsControl:=False;
   FMultiSelect:=False;
   FGridStep:=10;
   FAddMode:=False;
   //FSelControl:=nil;
end;

function DeleteChild(Controls: TList; WinControl: TWinControl): Boolean;
var
   J: Integer;
   Ind: Integer;
   Control: TControl;
begin
   Result:=False;
   for J:=0 to Pred(WinControl.ControlCount) do begin
      Control:=WinControl.Controls[J];
      if (Control is TWinControl) and not (Control is TDesignWindow) then begin
         Result:=DeleteChild(Controls, TWinControl(Control));
      end;
      Ind:=Controls.IndexOf(Control);
      if Ind<>-1 then begin
         Controls.Delete(Ind);
         Result:=True;
      end;
   end;
end;

procedure TDesigner.Cut;
var
   I: Integer;
   Control: TControl;
   WinControl: TWinControl;
   Controls: TList;
   flDel: Boolean;
begin
   if FWin.Visible then begin
      Control:=FWin.Control;
      SelectControl(nil, False, False, False);
      Control.Parent:=nil;
      DoCut(Control);
   end
   else if FWinList.Count>0 then begin
      Controls:=TList.Create;
      try
         for I:=0 to Pred(FWinList.Count) do begin
            Controls.Add(FWinList[I].Control);
         end;
         SelectControl(nil, False, False, False);
         // из-за того что в списке могут быть parent и их child control
         // надо произвести очистку данного списка от child control
         repeat
            I:=0;
            flDel:=False;
            while I<Controls.Count do begin
               Control:=TControl(Controls[I]);
               if (Control is TWinControl) and not (Control is TDesignWindow) then begin
                  WinControl:=TWinControl(Controls[I]);
                  flDel:=DeleteChild(Controls, WinControl);
                  if not flDel then begin
                     Inc(I);
                  end;
               end
               else begin
                  Inc(I);
               end;
            end;
         until not flDel;
         for I:=0 to Pred(Controls.Count) do begin
            Control:=TControl(Controls[I]);
            Control.Parent:=nil;
            DoCut(Control);
         end;
      finally
         Controls.Free;
      end;
   end;
end;

destructor TDesigner.Destroy;
begin
   FWin.Free;
   FWinList.Free;
   inherited;
end;

{function TDesigner.GetControlLeft: Integer;
begin
   Result:=0;
   if FSelControl<>nil then begin
      Result:=LongRec(FSelControl.DesignInfo).Lo;
   end;
end;}

{function TDesigner.GetControlTop: Integer;
begin
   Result:=0;
   if FSelControl<>nil then begin
      Result:=LongRec(FSelControl.DesignInfo).Hi;
   end;
end;}

procedure TDesigner.DoCut(Control: TControl);
begin
   if Assigned(FOnCut) then begin
      FOnCut(Control);
   end;
end;

procedure TDesigner.DoMultiSelect;
begin
   if Assigned(FOnMultiSelect) then begin
      FOnMultiSelect(Self);
   end;
end;

procedure TDesigner.DoNewControl(Control: TControl; Name: string);
begin
   if Assigned(FOnNewControl) then begin
      FOnNewControl(Control, Name);
   end;
end;

function TDesigner.DoNewControlName(Control: TControl; ClassName: string): string;
begin
   Result:='';
   if Assigned(FOnNewControlName) then begin
      Result:=FOnNewControlName(Control, ClassName);
   end;
end;

procedure TDesigner.DoSelect(Control: TControl);
begin
   if Assigned(FOnSelect) then begin
      FOnSelect(Control);
   end;
end;

procedure TDesigner.DoUpdate(Control: TControl);
begin
   if Assigned(FOnUpdate) then begin
      FOnUpdate(Control);
   end;
end;

function TDesigner.GetCustomForm: TCustomForm;
begin
   Result:=FForm;
end;

function TDesigner.GetIsControl: Boolean;
begin
   Result:=FIsControl;
end;

function TDesigner.GetRoot: TComponent;
begin
   Result:=FForm;
end;

function TDesigner.IsDesignMsg(Sender: TControl; var Msg: TMessage): Boolean;
var
   Pt: TPoint;
   Control: TControl;
   fCtrl: Boolean;
   fShift: Boolean;
   Win: TDesignWindow;
   ShiftState: TShiftState;
   flAdd: Boolean;
begin
   if FAddMode and ((Msg.Msg=WM_LBUTTONDOWN) or (Msg.Msg=WM_LBUTTONDBLCLK)) then begin
      ReleaseCapture;
      Pt.x:=LoWord(Msg.lParam);
      Pt.y:=HiWord(Msg.lParam);
      //pt:=Sender.ScreenToClient(pt);
      flAdd:=True;
      if Sender is TDesignWindow then begin
         Sender:=TDesignWindow(Sender).Control;
      end;
      if (Sender is TWinControl) and (csAcceptsControls in Sender.ControlStyle) then begin
         flAdd:=AddControl(pt.X, pt.Y, FForm, TWinControl(Sender));
      end
      else if (Sender.Parent<>nil) and (csAcceptsControls in Sender.Parent.ControlStyle) then begin
         flAdd:=AddControl(pt.X+Sender.Left, pt.Y+Sender.Top, FForm, Sender.Parent);
      end;
      if flAdd then begin
         StopAddControl;
      end;
      Msg.Result:=0;
      Result:=True;
   end
   else if (Msg.Msg=WM_LBUTTONDOWN) or (Msg.Msg=WM_LBUTTONDBLCLK) then begin
      ReleaseCapture;
      fCtrl:=(Msg.wParam and MK_CONTROL)=MK_CONTROL;
      fShift:=(Msg.wParam and MK_SHIFT)=MK_SHIFT;
      if Sender=FForm then begin
         SelectControl(nil, False, fShift, fCtrl);
      end
      else if (Sender<>nil) and (Sender=FWin) and ((FWin.Control is TWinControl) or (FWin.Control is TGraphicControl))then begin
         Pt.x:=LoWord(Msg.lParam);
         Pt.y:=HiWord(Msg.lParam);
         Windows.ClientToScreen(FWin.Handle, Pt);
         Pt:=FWin.Control.ScreenToClient(Pt);
         if FWin.Control is TWinControl then begin
            Control:=TWinControl(FWin.Control).ControlAtPos(Pt, True, True);
            if Control<>nil then begin
               SelectControl(Control, True, fShift, fCtrl);
               Msg.Result:=0;
               Result:=True;
               Exit;
            end;
         end;
         Result:=False;
         Exit;
      end
      else if (Sender<>nil) and (FWinList.IndexOf(Sender)<>-1) then begin
         Win:=FWinList[FWinList.IndexOf(Sender)];
         Pt.x:=LoWord(Msg.lParam);
         Pt.y:=HiWord(Msg.lParam);
         Windows.ClientToScreen(Win.Handle, Pt);
         Pt:=Win.Control.ScreenToClient(Pt);
         if Win.Control is TWinControl then begin
            Control:=TWinControl(Win.Control).ControlAtPos(Pt, True, True);
            if Control<>nil then begin
               SelectControl(Control, True, fShift, fCtrl);
               Msg.Result:=0;
               Result:=True;
               Exit;
            end;
         end;
         SelectControl(Win.Control, True, fShift, fCtrl);
         Msg.Result:=0;
         Result:=True;
         Exit;
      end
      else begin
         SelectControl(Sender, True, fShift, fCtrl);
      end;
      Msg.Result:=0;
      Result:=True;
   end
   else if (Msg.Msg=WM_KEYDOWN) and (FWin.Visible) then begin
      Result:=False;
      if Msg.wParam in [VK_LEFT, VK_UP, VK_DOWN, VK_RIGHT, VK_TAB] then begin
         PostMessage(FWin.Handle, Msg.Msg, Msg.WParam, Msg.LParam);
         Msg.Result:=0;
         Result:=True;
      end
      else if Msg.wParam=VK_ESCAPE then begin {на ESC должно по другому реагировать}
         SelectControl(nil, False, False, False);
         Msg.Result:=0;
         Result:=True;
      end;
   end
   else if (Msg.Msg=WM_KEYDOWN) and (FWinList.Count>0) then begin
      Result:=False;
      if Msg.wParam in [VK_LEFT, VK_UP, VK_DOWN, VK_RIGHT, VK_TAB] then begin
         ShiftState:=KeyDataToShiftState(Msg.lParam);
         if (Msg.wParam=VK_TAB) and (ssShift in ShiftState) then begin
            SelectPrior(FWinList[0].Control);
         end
         else if not (ssShift in ShiftState) and not (ssCtrl in ShiftState) then begin
            case Msg.wParam of
               VK_TAB: begin
                  SelectNext(FWinList[0].Control);
               end;
               VK_UP: begin
                  SelectUp(FWinList[0].Control);
               end;
               VK_LEFT: begin
                  SelectLeft(FWinList[0].Control);
               end;
               VK_RIGHT: begin
                  SelectRight(FWinList[0].Control);
               end;
               VK_DOWN: begin
                  SelectDown(FWinList[0].Control);
               end;
            end;
         end
         else begin
            Win:=FWinList.GetFirstParented;
            FWinList.RemoveChild;
            if Win<>nil then begin
               PostMessage(Win.Handle, Msg.Msg, Msg.WParam, Msg.LParam);
            end;
         end;
         Msg.Result:=0;
         Result:=True;
      end
      else if Msg.wParam=VK_ESCAPE then begin
         SelectControl(nil, False, False, False);
         Msg.Result:=0;
         Result:=True;
      end;
   end
   else begin
      Result:=False;
   end;
end;

procedure TDesigner.Modified;
begin

end;

procedure TDesigner.Notification(AnObject: TPersistent; Operation: TOperation);
begin

end;

procedure TDesigner.PaintGrid;
var
   I: Integer;
   J: Integer;
   CountW: Integer;
   CountH: Integer;
begin
   if FForm<>nil then begin
      CountW:=FForm.ClientWidth div FGridStep;
      CountH:=FForm.ClientHeight div FGridStep;
      for I:=0 to CountW do begin
         for J:=0 to CountH do begin
            FForm.Canvas.Pixels[I*FGridStep, J*FGridStep]:=clHighlight;
         end;
      end;
   end;
end;

procedure TDesigner.SelectControl(Control: TControl; Capture: Boolean; fShift, fCtrl: Boolean);
var
   Pt: TPoint;
begin
   if CanSelect(Control) then begin
      FMultiSelect:=(fShift or fCtrl or FWinList.IsControl(Control)) and (Control<>nil);
      if FMultiSelect then begin
         if FWin.Control<>nil then begin
            FWinList.AddNew(FWin.Control);
            FWinList.AddNew(Control);
            FWin.ClearControl;
         end
         else if FWinList.IsControl(Control) then begin
            if fShift or fCtrl then begin
               FWinList.Del(Control);
            end
            else begin
               FWinList.StartMove(FWinList.IndexOfControl(Control));
            end;
         end
         else begin
            FWinList.AddNew(Control);
         end;
      end
      else begin
         //FSelControl:=Control;
         FWinList.Clear;
         //if FSelControl=nil then begin
         if Control=nil then begin
            FWin.ClearControl;
         end
         else begin
            FWin.Visible:=False;
            if Capture then begin
               FWin.State:=dsMove;
            end
            else begin
               FWin.State:=dsSelect;
            end;
            //FWin.SetControl(FSelControl);
            FWin.SetControl(Control);
            FWin.Visible:=True;
            if Capture then begin
               Windows.SetCapture(FWin.Handle);
               FWin.IsMouseDown:=True;
               GetCursorPos(Pt);
               FWin.StartX:=Pt.x;
               FWin.StartY:=Pt.y;
               if FWin.Visible and FWin.CanFocus then begin
                  FWin.SetFocus;
               end;
               FWin.DesignCommand:=dcMove;
               FWin.SetClipMouse;
               FWin.CheckScrollWindow(True);
            end;
         end;
         DoSelect(Control);
      end;
   end;
   DoMultiSelect;
end;

{procedure TDesigner.SetControlLeft(Value: Integer);
var
   L: LongInt;
begin
   if FSelControl<>nil then begin
      L:=FSelControl.DesignInfo;
      LongRec(L).Lo:=Value;
      FSelControl.DesignInfo:=L;
   end;
end;}

{procedure TDesigner.SetControlTop(Value: Integer);
var
   L: LongInt;
begin
   if FSelControl<>nil then begin
      L:=FSelControl.DesignInfo;
      LongRec(L).Hi:=Value;
      FSelControl.DesignInfo:=L;
   end;
end;}

procedure TDesigner.SelectDown(CurControl: TControl);
var
   I: Integer;
   Parent: TWinControl;
   Control: TControl;
   NextControl: TControl;
   DX: Integer;
   DY: Integer;
   XY1: Integer;
   XY2: Integer;
   A1: Double;
   A2: Double;
   MinXY: Integer;
begin
   NextControl:=nil;
   if CurControl<>nil then begin
      Parent:=CurControl.Parent;
      MinXY:=9999;
      for I:=0 to Pred(Parent.ControlCount) do begin
         Control:=Parent.Controls[I];
         if (Control<>CurControl) and CanSelect(Control) and (Control<>nil) then begin
            DY:=Control.Top-(CurControl.Top+CurControl.Height);
            //DX:=Abs(Control.Left-(CurControl.Left+(CurControl.Width div 2)));
            DX:=Abs(Control.Left-CurControl.Left);
            XY1:=Round(Sqrt(DX*DX+DY*DY)+0.5);
            A1:=0;
            if XY1<>0 then begin
               A1:=DX/XY1;
            end;
            //DX:=Abs((Control.Left+Control.Width)-(CurControl.Left+(CurControl.Width div 2)));
            DX:=Abs((Control.Left+Control.Width)-(CurControl.Left+CurControl.Width));
            XY2:=Round(Sqrt(DX*DX+DY*DY)+0.5);
            A2:=0;
            if XY2<>0 then begin
               A2:=DX/XY2;
            end;
            if (DY>0) and ((Control.Top+Control.Height)>(CurControl.Top+CurControl.Height)) then begin
               if (A1<1) and (XY1<MinXY) then begin
                  NextControl:=Control;
                  MinXY:=XY1;
               end;
               if (A2<1) and (XY2<MinXY) then begin
                  NextControl:=Control;
                  MinXY:=XY2;
               end;
            end;
         end;
      end;
   end;
   if NextControl<>nil then begin
      FWinList.Clear;
      SelectControl(NextControl, False, False, False);
   end;
end;

procedure TDesigner.SelectLeft(CurControl: TControl);
var
   I: Integer;
   Parent: TWinControl;
   Control: TControl;
   NextControl: TControl;
   DX: Integer;
   DY: Integer;
   XY1: Integer;
   XY2: Integer;
   A1: Double;
   A2: Double;
   MinXY: Integer;
begin
   NextControl:=nil;
   if CurControl<>nil then begin
      Parent:=CurControl.Parent;
      MinXY:=9999;
      for I:=0 to Pred(Parent.ControlCount) do begin
         Control:=Parent.Controls[I];
         if (Control<>CurControl) and CanSelect(Control) and (Control<>nil) then begin
            DX:=CurControl.Left-(Control.Left+Control.Width);
            //DY:=Abs(Control.Top-(CurControl.Top+(CurControl.Height div 2)));
            DY:=Abs(Control.Top-CurControl.Top);
            XY1:=Round(Sqrt(DX*DX+DY*DY)+0.5);
            A1:=0;
            if XY1<>0 then begin
               A1:=DY/XY1;
            end;
            //DY:=Abs((Control.Top+Control.Height)-(CurControl.Top+(CurControl.Height div 2)));
            DY:=Abs((Control.Top+Control.Height)-(CurControl.Top+CurControl.Height));
            XY2:=Round(Sqrt(DX*DX+DY*DY)+0.5);
            A2:=0;
            if XY2<>0 then begin
               A2:=DY/XY2;
            end;
            if (DX>0) and ((Control.Left+Control.Width)<(CurControl.Left+CurControl.Width)) then begin
               if (A1<1) and (XY1<MinXY) then begin
                  NextControl:=Control;
                  MinXY:=XY1;
               end;
               if (A2<1) and (XY2<MinXY) then begin
                  NextControl:=Control;
                  MinXY:=XY2;
               end;
            end;
         end;
      end;
   end;
   if NextControl<>nil then begin
      FWinList.Clear;
      SelectControl(NextControl, False, False, False);
   end;
end;

procedure TDesigner.SelectNext(CurControl: TControl);
var
   I: Integer;
   CurIndex: Integer;
   NextControl: TControl;
   Parent: TWinControl;
begin
   NextControl:=nil;
   CurIndex:=-1;
   I:=0;
   if CurControl<>nil then begin
      Parent:=CurControl.Parent;
      while (I<Parent.ControlCount) and (Parent.Controls[I]<>CurControl) do begin
         CurIndex:=I;
         Inc(I);
      end;
      repeat
         Inc(I);
         if not (I<Parent.ControlCount) then begin
            I:=0;
         end;
         NextControl:=Parent.Controls[I];
      until (I=CurIndex) or (CanSelect(NextControl) and (NextControl<>nil) and not (NextControl is TDesignWindow));
   end;
   FWinList.Clear;
   if (I<>CurIndex) and CanSelect(NextControl) then begin
      SelectControl(NextControl, False, False, False);
   end
   else begin
      SelectControl(nil, False, False, False);
   end;
end;

procedure TDesigner.SelectPrior(CurControl: TControl);
var
   I: Integer;
   CurIndex: Integer;
   NextControl: TControl;
   Parent: TWinControl;
begin
   NextControl:=nil;
   CurIndex:=-1;
   I:=0;
   if CurControl<>nil then begin
      Parent:=CurControl.Parent;
      I:=Pred(Parent.ControlCount);
      while (I>0) and (Parent.Controls[I]<>CurControl) do begin
         CurIndex:=I;
         Dec(I);
      end;
      repeat
         Dec(I);
         if not (I>=0) then begin
            I:=Pred(Parent.ControlCount);
         end;
         NextControl:=Parent.Controls[I];
      until (I=CurIndex) or (CanSelect(NextControl) and (NextControl<>nil) and not (NextControl is TDesignWindow));
   end;
   FWinList.Clear;
   if (I<>CurIndex) and CanSelect(NextControl) then begin
      SelectControl(NextControl, False, False, False);
   end
   else begin
      SelectControl(nil, False, False, False);
   end;
end;

procedure TDesigner.SelectRight(CurControl: TControl);
var
   I: Integer;
   Parent: TWinControl;
   Control: TControl;
   NextControl: TControl;
   DX: Integer;
   DY: Integer;
   XY1: Integer;
   XY2: Integer;
   A1: Double;
   A2: Double;
   MinXY: Integer;
begin
   NextControl:=nil;
   if CurControl<>nil then begin
      Parent:=CurControl.Parent;
      MinXY:=9999;
      for I:=0 to Pred(Parent.ControlCount) do begin
         Control:=Parent.Controls[I];
         if (Control<>CurControl) and CanSelect(Control) and (Control<>nil) then begin
            DX:=Control.Left-(CurControl.Left+CurControl.Width);
            DY:=Abs(Control.Top-(CurControl.Top+(CurControl.Height div 2)));
            XY1:=Round(Sqrt(DX*DX+DY*DY)+0.5);
            A1:=0;
            if XY1<>0 then begin
               A1:=DY/XY1;
            end;
            DY:=Abs((Control.Top+Control.Height)-(CurControl.Top+(CurControl.Height div 2)));
            XY2:=Round(Sqrt(DX*DX+DY*DY)+0.5);
            A2:=0;
            if XY2<>0 then begin
               A2:=DY/XY2;
            end;
            if (DX>0) and ((Control.Left+Control.Width)>(CurControl.Left+CurControl.Width)) then begin
               if (A1<1) and (XY1<MinXY) then begin
                  NextControl:=Control;
                  MinXY:=XY1;
               end;
               if (A2<1) and (XY2<MinXY) then begin
                  NextControl:=Control;
                  MinXY:=XY2;
               end;
            end;
         end;
      end;
   end;
   if NextControl<>nil then begin
      FWinList.Clear;
      SelectControl(NextControl, False, False, False);
   end;
end;

procedure TDesigner.SelectUp(CurControl: TControl);
var
   I: Integer;
   Parent: TWinControl;
   Control: TControl;
   NextControl: TControl;
   DX: Integer;
   DY: Integer;
   XY1: Integer;
   XY2: Integer;
   A1: Double;
   A2: Double;
   MinXY: Integer;
begin
   NextControl:=nil;
   if CurControl<>nil then begin
      Parent:=CurControl.Parent;
      MinXY:=9999;
      for I:=0 to Pred(Parent.ControlCount) do begin
         Control:=Parent.Controls[I];
         if (Control<>CurControl) and CanSelect(Control) and (Control<>nil) then begin
            DY:=CurControl.Top-(Control.Top+Control.Height);
            //DX:=Abs(Control.Left-(CurControl.Left+(CurControl.Width div 2)));
            DX:=Abs(Control.Left-CurControl.Left);
            XY1:=Round(Sqrt(DX*DX+DY*DY)+0.5);
            A1:=0;
            if XY1<>0 then begin
               A1:=DX/XY1;
            end;
            //DX:=Abs((Control.Left+Control.Width)-(CurControl.Left+(CurControl.Width div 2)));
            DX:=Abs((Control.Left+Control.Width)-(CurControl.Left+CurControl.Width));
            XY2:=Round(Sqrt(DX*DX+DY*DY)+0.5);
            A2:=0;
            if XY2<>0 then begin
               A2:=DX/XY2;
            end;
            if (DY>0) and ((Control.Top+Control.Height)<(CurControl.Top+CurControl.Height)) then begin
               if (A1<1) and (XY1<MinXY) then begin
                  NextControl:=Control;
                  MinXY:=XY1;
               end;
               if (A2<1) and (XY2<MinXY) then begin
                  NextControl:=Control;
                  MinXY:=XY2;
               end;
            end;
         end;
      end;
   end;
   if NextControl<>nil then begin
      FWinList.Clear;
      SelectControl(NextControl, False, False, False);
   end;
end;

procedure TDesigner.SetCustomForm(Value: TCustomForm);
begin
   FForm:=Value;
   FWin.Parent:=Value;
end;

procedure TDesigner.SetIsControl(Value: Boolean);
begin
   FIsControl:=Value;
end;

procedure TDesigner.ShowAlignDialog;
var
   Param: TAlignDlgParam;
begin
   Param.HorzAlign:=haNone;
   Param.VertAlign:=vaNone;
   if ShowDesignerAlignDialog(Param) then begin
      case Param.HorzAlign of
         haLeft: FWinList.SetLeft(FWinList.GetMinLeft);
         haRight: FWinList.SetRight(FWinList.GetMaxRight);
         haCenter: FWinList.SetHorzCenter(FWinList.GetMinLeft, FWinList.GetMaxRight);
         haEqual: FWinList.SetHorzEqual(FWinList.GetMinLeft, FWinList.GetMaxRight);
      end;
      case Param.VertAlign of
         vaTop: FWinList.SetTop(FWinList.GetMinTop);
         vaBottom: FWinList.SetBottom(FWinList.GetMaxBottom);
         vaCenter: FWinList.SetVertCenter(FWinList.GetMinTop, FWinList.GetMaxBottom);
         vaEqual: FWinList.SetVertEqual(FWinList.GetMinTop, FWinList.GetMaxBottom);
      end;
   end;
end;

procedure TDesigner.ShowSizeDialog;
var
   Param: TSizeDlgParam;
begin
   Param.NoWidthChange:=True;
   Param.NoHeightChange:=True;
   Param.MaxWidth:=FWinList.GetMaxWidth;
   Param.MinWidth:=FWinList.GetMinWidth;
   Param.MaxHeight:=FWinList.GetMaxHeight;
   Param.MinHeight:=FWinList.GetMinHeight;
   Param.NewWidth:=0;
   Param.NewHeight:=0;
   if ShowDesignerSizeDialog(Param) then begin
      if not Param.NoWidthChange then begin
         FWinList.SetWidth(Param.NewWidth);
      end;
      if not Param.NoHeightChange then begin
         FWinList.SetHeight(Param.NewHeight);
      end;
   end;
end;

procedure TDesigner.StartAddControl(ControlClass: TControlClass);
begin
   FAddMode:=True;
   FAddClass:=ControlClass;
end;

procedure TDesigner.StopAddControl;
begin
   FAddMode:=False;
end;

function TDesigner.UniqueName(const BaseName: string): string;
const
   ID: Integer=0;
begin
   Inc(ID);
   Result:=Format('BaseName%d', [ID]);
end;

procedure TDesigner.ValidateRename(AComponent: TComponent; const CurName, NewName: string);
begin

end;

{ TDesignWindow }

type
   TSW=class(TScrollingWinControl);

procedure TDesignWindow.CheckScrollWindow(Start: Boolean);
begin
   if (Parent is TScrollingWinControl) then begin
      if Start then begin
         //TSW(Parent).AutoScroll:=False;
         TSW(Parent).DisableAutoRange;
      end
      else begin
         //TSW(Parent).AutoScroll:=True;
         TSW(Parent).EnableAutoRange;
      end;
   end;
end;

procedure TDesignWindow.ClearControl;
begin
   FState:=dsNone;
   Visible:=False;
   if FControl<>nil then begin
      TC(FControl).OnResize:=nil;
   end;
   FControl:=nil;
end;

constructor TDesignWindow.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   ControlStyle:=ControlStyle+[csOpaque]; //??
   Visible:=False;
   SetState(dsNone);
   FIsMouseDown:=False;
   FStartX:=0;
   FStartY:=0;
   FDesignCommand:=dcNone;
   FStartX:=0;
   FStartY:=0;
   FUpdating:=False;
   FMultiSelect:=False;
end;

procedure TDesignWindow.CreateParams(var Params: TCreateParams);
begin
   inherited CreateParams(Params);
   Params.Style:=WS_CHILD;
   Params.ExStyle:=Params.ExStyle or WS_EX_TRANSPARENT;
   Params.WindowClass.Style:=Params.WindowClass.Style or CS_SAVEBITS; //??
end;

destructor TDesignWindow.Destroy;
begin
   inherited;
end;

procedure TDesignWindow.DrawMultiSelect(DC: HDC);
var
   ScrDC: HDC;
   MemDC: HDC;
   MemBitmap: HBITMAP;
   OldBitmap: HBITMAP;
   Brush: HBRUSH;
begin
   ScrDC:=GetDC(0);
   MemBitmap:=CreateCompatibleBitmap(DC, 5, 5);
   ReleaseDC(0, ScrDC);
   MemDC:=CreateCompatibleDC(0);
   OldBitmap:=SelectObject(MemDC, MemBitmap);
   try
      Brush:=CreateSolidBrush(ColorToRGB(clBtnShadow));
      FillRect(MemDC, Bounds(0, 0, 5, 5), Brush);
      DeleteObject(Brush);
      //FillRect(MemDC, Bounds(0, 0, 5, 5), GetStockObject(BLACK_BRUSH));
      //BitBlt(DC, 0, 0, 5, 5, MemDC, 0, 0, SRCCOPY{PATINVERT});
      BitBlt(DC, 2, 2, 5, 5, MemDC, 0, 0, SRCCOPY{PATINVERT});
      //BitBlt(DC, (Width div 2)-2, 0, 5, 5, MemDC, 0, 0, SRCCOPY);
      BitBlt(DC, Width-7, 2, 5, 5, MemDC, 0, 0, SRCCOPY);
      //BitBlt(DC, Width-5, 0, 5, 5, MemDC, 0, 0, SRCCOPY);
      BitBlt(DC, 2, Height-7, 5, 5, MemDC, 0, 0, SRCCOPY);
      //BitBlt(DC, 0, Height-5, 5, 5, MemDC, 0, 0, SRCCOPY);
      //BitBlt(DC, (Width div 2)-2, Height-5, 5, 5, MemDC, 0, 0, SRCCOPY);
      BitBlt(DC, Width-7, Height-7, 5, 5, MemDC, 0, 0, SRCCOPY);
      //BitBlt(DC, Width-5, Height-5, 5, 5, MemDC, 0, 0, SRCCOPY);
      //BitBlt(DC, 0, (Height div 2)-2, 5, 5, MemDC, 0, 0, SRCCOPY);
      //BitBlt(DC, Width-5, (Height div 2)-2, 5, 5, MemDC, 0, 0, SRCCOPY);
   finally
      SelectObject(MemDC, OldBitmap);
      DeleteDC(MemDC);
      DeleteObject(MemBitmap);
   end;
end;

procedure TDesignWindow.DrawRect(DC: HDC);
var
   Pen: HPEN;
   OldPen: HPEN;
   OldBrush: HBRUSH;
   Rect: TRect;
begin
   Pen:=CreatePen(PS_SOLID, 2, ColorToRGB(clBtnShadow));
   OldPen:=SelectObject(DC, Pen);
   OldBrush:=SelectObject(DC, GetStockObject(HOLLOW_BRUSH));
   try
      Rect:=Bounds(1, 1, Width-1, Height-1);
      InflateRect(Rect, -2, -2);
      SetROP2(DC, R2_XORPEN);
      Rectangle(DC, Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
   finally
      SelectObject(DC, OldBrush);
      SelectObject(DC, OldPen);
      DeleteObject(Pen);
   end;
end;

procedure TDesignWindow.DrawSelect(DC: HDC);
begin
   PatBlt(dc, 0, 0, 5, 5, BLACKNESS);
   PatBlt(dc, (Width div 2)-2, 0, 5, 5, BLACKNESS);
   PatBlt(DC, Width-5, 0, 5, 5, BLACKNESS);
   PatBlt(DC, 0, Height-5, 5, 5, BLACKNESS);
   PatBlt(DC, (Width div 2)-2, Height-5, 5, 5, BLACKNESS);
   PatBlt(DC, Width-5, Height-5, 5, 5, BLACKNESS);
   PatBlt(DC, 0, (Height div 2)-2, 5, 5, BLACKNESS);
   PatBlt(DC, Width-5, (Height div 2)-2, 5, 5, BLACKNESS);
end;

procedure TDesignWindow.KeyDown(var Key: Word; Shift: TShiftState);
begin
   if ssShift in Shift then begin
      case Key of
         VK_TAB: begin
            FDesigner.SelectPrior(FControl);
         end;
         VK_LEFT: begin
            if FMultiSelect then begin
               FDesigner.WinList.Grow(0, 0, -1, 0);
            end
            else if Width>0 then begin
               SetBounds(Left, Top, Width-1, Height);
               UpdatePos;
            end;
         end;
         VK_RIGHT: begin
            if FMultiSelect then begin
               FDesigner.WinList.Grow(0, 0, 1, 0);
            end
            else begin
               SetBounds(Left, Top, Width+1, Height);
               UpdatePos;
            end;
         end;
         VK_DOWN: begin
            if FMultiSelect then begin
               FDesigner.WinList.Grow(0, 0, 0, 1);
            end
            else begin
               SetBounds(Left, Top, Width, Height+1);
               UpdatePos;
            end;
         end;
         VK_UP: begin
            if FMultiSelect then begin
               FDesigner.WinList.Grow(0, 0, 0, -1);
            end
            else if Height>0 then begin
               SetBounds(Left, Top, Width, Height-1);
               UpdatePos;
            end;
         end;
      end;
   end
   else if ssCtrl in Shift then begin
      case Key of
         VK_LEFT: begin
            if FMultiSelect then begin
               FDesigner.WinList.Shift(-1, 0);
            end
            else begin
               Left:=Left-1;
               UpdatePos;
            end;
         end;
         VK_RIGHT: begin
            if FMultiSelect then begin
               FDesigner.WinList.Shift(1, 0);
            end
            else begin
               Left:=Left+1;
               UpdatePos;
            end;
         end;
         VK_DOWN: begin
            if FMultiSelect then begin
               FDesigner.WinList.Shift(0, 1);
            end
            else begin
               Top:=Top+1;
               UpdatePos;
            end;
         end;
         VK_UP: begin
            if FMultiSelect then begin
               FDesigner.WinList.Shift(0, -1);
            end
            else begin
               Top:=Top-1;
               UpdatePos;
            end;
         end;
      end;
   end
   else begin
      case Key of
         VK_TAB: begin
            FDesigner.SelectNext(FControl);
         end;
         VK_UP: begin
            FDesigner.SelectUp(FControl);
         end;
         VK_LEFT: begin
            FDesigner.SelectLeft(FControl);
         end;
         VK_RIGHT: begin
            FDesigner.SelectRight(FControl);
         end;
         VK_DOWN: begin
            FDesigner.SelectDown(FControl);
         end;
      end;
   end;
end;

procedure TDesignWindow.MouseMove(Shift: TShiftState; X, Y: Integer);
var
   DX: Integer;
   DY: Integer;
   Pt: TPoint;
begin
   if FIsMouseDown then begin
      GetCursorPos(Pt);
      DX:=Pt.x-FStartX;
      DY:=Pt.y-FStartY;
      if (DX=0) and (DY=0) then Exit;
      FStartX:=Pt.x;
      FStartY:=Pt.y;
      if FMultiSelect then begin
         FDesigner.WinList.Move(DX, DY);
      end
      else begin
         Visible:=False;
         case FDesignCommand of
            dcSizeTopLeft: begin
               if ((Width-DX)<0) or ((Height-DY)<0) then begin
                  FDesignCommand:=dcSizeBottomRight;
                  SetBounds(Left, Top, Width+DX, Height+DY);
               end
               else begin
                  SetBounds(Left+DX, Top+DY, Width-DX, Height-DY);
               end;
            end;
            dcSizeTop: begin
               if (Height-DY)<0 then begin
                  FDesignCommand:=dcSizeBottom;
                  SetBounds(Left, Top, Width, Height+DY);
               end
               else begin
                  SetBounds(Left, Top+DY, Width, Height-DY);
               end;
            end;
            dcSizeTopRight: begin
               if ((Width+DX)<0) or ((Height-DY)<0) then begin
                  FDesignCommand:=dcSizeBottomLeft;
                  SetBounds(Left+DX, Top, Width-DX, Height+DY);
               end
               else begin
                  SetBounds(Left, Top+DY, Width+DX, Height-DY);
               end;
            end;
            dcSizeBottomLeft: begin
               if ((Width-DX)<0) or ((Height+DY)<0) then begin
                  FDesignCommand:=dcSizeTopRight;
                  SetBounds(Left, Top+DY, Width+DX, Height-DY);
               end
               else begin
                  SetBounds(Left+DX, Top, Width-DX, Height+DY);
               end;
            end;
            dcSizeBottom: begin
               if (Height+DY)<0 then begin
                  FDesignCommand:=dcSizeTop;
                  SetBounds(Left, Top+DY, Width, Height-DY);
               end
               else begin
                  SetBounds(Left, Top, Width, Height+DY);
               end;
            end;
            dcSizeBottomRight: begin
               if ((Width+DX)<0) or ((Height+DY)<0) then begin
                  FDesignCommand:=dcSizeTopLeft;
                  SetBounds(Left+DX, Top+DY, Width-DX, Height-DY);
               end
               else begin
                  SetBounds(Left, Top, Width+DX, Height+DY);
               end;
            end;
            dcSizeLeft: begin
               if (Width-DX)<0 then begin
                  FDesignCommand:=dcSizeRight;
                  SetBounds(Left, Top, Width+DX, Height);
               end
               else begin
                  SetBounds(Left+DX, Top, Width-DX, Height);
               end;
            end;
            dcSizeRight: begin
               if (Width+DX)<0 then begin
                  FDesignCommand:=dcSizeLeft;
                  SetBounds(Left+DX, Top, Width-DX, Height);
               end
               else begin
                  SetBounds(Left, Top, Width+DX, Height);
               end;
            end;
            dcMove: begin
               SetBounds(Left+DX, Top+DY, Width, Height);
            end;
         end;
         Visible:=True;
      end;
   end
   else if not FMultiSelect then begin
      if (X<5) and (Y<5) then begin
         Cursor:=crSizeNWSE;
         FDesignCommand:=dcSizeTopLeft;
      end
      else if (x>(Width div 2)-2) and (x<(Width div 2)+2) and (y<=5) then begin
         Cursor:=crSizeNS;
         FDesignCommand:=dcSizeTop;
      end
      else if (x>=Width-5) and (y<=5) then begin
         Cursor:=crSizeNESW;
         FDesignCommand:=dcSizeTopRight;
      end
      else if (x<=5) and (y>Height-5) then begin
         Cursor:=crSizeNESW;
         FDesignCommand:=dcSizeBottomLeft;
      end
      else if (x>(Width div 2)-2) and (x<(Width div 2)+2) and (y>Height-5) then begin
         Cursor:=crSizeNS;
         FDesignCommand:=dcSizeBottom;
      end
      else if (x>Width-5) and (y>Height-5) then begin
         Cursor:= crSizeNWSE;
         FDesignCommand:=dcSizeBottomRight;
      end
      else if (x<=5) and (y>(Height div 2)-2) and (y<(Height div 2)+2) then begin
         Cursor:=crSizeWE;
         FDesignCommand:=dcSizeLeft;
      end
      else if (x>Width-5) and (y>(Height div 2)-2) and (y<(Height div 2)+2) then begin
         Cursor:=crSizeWE;
         FDesignCommand:=dcSizeRight;
      end
      else begin
         Cursor:=crDefault;
         FDesignCommand:=dcMove;
      end;
   end;
end;

procedure TDesignWindow.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if FMultiSelect then begin
      if FState=dsMove then begin
         FDesigner.WinList.StopMove;
      end;
   end
   else begin
      UpdatePos;
   end;
   ResetClipMouse;
   CheckScrollWindow(False);
end;

procedure TDesignWindow.PaintWindow(DC: HDC);
begin
   case FState of
      dsSelect: begin
         if FMultiSelect then begin
            DrawMultiSelect(DC);
         end
         else begin
            DrawSelect(DC);
         end;
      end;
      dsMove: begin
         DrawRect(DC);
      end;
   end;
   //FPrevState:=FState;
end;

procedure TDesignWindow.ResetClipMouse;
begin
   ClipCursor(nil);
end;

procedure TDesignWindow.ResizeControl(Sender: TObject);
var
   Rect: TRect;
begin
   if not FUpdating and (FState<>dsMove) then begin
      Rect:=FControl.BoundsRect;
      InflateRect(Rect, 2, 2);
      if (BoundsRect.Left<>Rect.Left) or (BoundsRect.Top<>Rect.Top) or (BoundsRect.Right<>Rect.Right) or (BoundsRect.Bottom<>Rect.Bottom) then begin
         Visible:=False;
         BoundsRect:=Rect;
         Visible:=True;
      end;
   end;
end;

procedure TDesignWindow.SetClipMouse;
var
   Rect: TRect;
begin
   Rect:=Parent.ClientRect;
   OffsetRect(Rect, Parent.ClientOrigin.X, Parent.ClientOrigin.Y);
   ClipCursor(@Rect);
end;

procedure TDesignWindow.SetControl(Control: TControl);
var
   Rect: TRect;
begin
   if FControl<>nil then begin
      TC(FControl).OnResize:=nil;
   end;
   if FControl<>Control then begin
      FControl:=Control;
      Parent:=FControl.Parent;
      Rect:=FControl.BoundsRect;
      InflateRect(Rect, 2, 2);
      BoundsRect:=Rect;
   end;
   if FControl<>nil then begin
      TC(FControl).OnResize:=ResizeControl;
   end;
end;

procedure TDesignWindow.SetState(const Value: TDesignState);
begin
   FState:=Value;
   //FPrevState:=Value;
end;

procedure TDesignWindow.UpdatePos;
var
   Rect: TRect;
begin
   FUpdating:=True;
   Visible:=False;
   FState:=dsSelect;
   FIsMouseDown:=False;
   FStartX:=0;
   FStartY:=0;
   FDesignCommand:=dcNone;
   FControl.SetBounds(Left+2, Top+2, Width-4, Height-4);
   Rect:=FControl.BoundsRect;
   InflateRect(Rect, 2, 2);
   BoundsRect:=Rect;
   Visible:=True;
   FUpdating:=False;
   FDesigner.DoUpdate(FControl);
end;

procedure TDesignWindow.WMEraseBkgnd(var Msg: TMessage);
begin
   Msg.Result:=1;
end;

procedure TDesignWindow.WMGetDlgCode(var Msg: TWMGetDlgCode);
begin
   inherited;
   Msg.Result:=Msg.Result or DLGC_WANTTAB;
end;

procedure TDesignWindow.WMLButtonDown(var Msg: TWMLButtonDown);
var
   Pt: TPoint;
begin
   if not FDesigner.IsDesignMsg(Self, TMessage(Msg)) then begin
      inherited;
      Visible:=False;
      FState:=dsMove;
      FIsMouseDown:=True;
      GetCursorPos(Pt);
      FStartX:=Pt.x;
      FStartY:=Pt.y;
      Visible:=True;
      SetClipMouse;
      CheckScrollWindow(True);
   end
end;

procedure TDesignWindow.WMPaint(var Msg: TWMPaint);
begin
  ControlState:=ControlState+[csCustomPaint];
  inherited;
  ControlState:=ControlState-[csCustomPaint];
end;

{ TDesignWinList }

function TDesignWinList.Add(Item: TDesignWindow): Integer;
begin
   Result:=FList.Add(Item);
end;

function TDesignWinList.AddNew(Control: TControl): TDesignWindow;
begin
   Result:=TDesignWindow.Create(FOwner);
   Result.PopupMenu:=FDesigner.PopupMenu;
   Result.Designer:=FDesigner;
   Result.State:=dsSelect;
   Result.MultiSelect:=True;
   Result.SetControl(Control);
   Result.Visible:=True;
   Add(Result);
end;

procedure TDesignWinList.Clear;
var
   I: Integer;
   Item: TDesignWindow;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.ClearControl;
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TDesignWinList.Create(AOwner: TComponent; Designer: TDesigner);
begin
   FOwner:=AOwner;
   FDesigner:=Designer;
   FList:=TList.Create;
end;

procedure TDesignWinList.Del(Control: TControl);
var
   I: Integer;
   Item: TDesignWindow;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Control=Control) then begin
         Delete(I);
         Break;
      end;
   end;
end;

procedure TDesignWinList.Delete(I: Integer);
var
   Item: TDesignWindow;
begin
   Item:=GetItem(I);
   FList.Delete(I);
   Item.ClearControl;
   Item.Free;
end;

destructor TDesignWinList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TDesignWinList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TDesignWinList.GetFirstParented: TDesignWindow;
var
   I: Integer;
   Item: TDesignWindow;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if not HasParent(Item.Control) then begin
         Result:=Item;
         Break;
      end;
   end;
end;

function TDesignWinList.GetItem(I: Integer): TDesignWindow;
begin
   Result:=TDesignWindow(FList[I]);
end;

function TDesignWinList.GetMaxBottom: Integer;
var
   I : Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   Result:=0;
   if GetCount>0 then begin
      Item:=GetItem(0);
      if (Item<>nil) and (Item.Control<>nil) then begin
         Result:=Item.Control.Top+Item.Control.Height;
         for I:=1 to Pred(GetCount) do begin
            Item:=GetItem(I);
            Control:=Item.Control;
            if (Item<>nil) and (Control<>nil) and ((Control.Top+Control.Height)>Result) then begin
               Result:=Control.Top+Control.Height;
            end;
         end;
      end;
   end;
end;

function TDesignWinList.GetMaxHeight: Integer;
var
   I : Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   Result:=0;
   if GetCount>0 then begin
      Item:=GetItem(0);
      if (Item<>nil) and (Item.Control<>nil) then begin
         Result:=Item.Control.Height;
         for I:=1 to Pred(GetCount) do begin
            Item:=GetItem(I);
            Control:=Item.Control;
            if (Item<>nil) and (Control<>nil) and (Control.Height>Result) then begin
               Result:=Control.Height;
            end;
         end;
      end;
   end;
end;

function TDesignWinList.GetMaxRight: Integer;
var
   I : Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   Result:=0;
   if GetCount>0 then begin
      Item:=GetItem(0);
      if (Item<>nil) and (Item.Control<>nil) then begin
         Result:=Item.Control.Left+Item.Control.Width;
         for I:=1 to Pred(GetCount) do begin
            Item:=GetItem(I);
            Control:=Item.Control;
            if (Item<>nil) and (Control<>nil) and ((Control.Left+Control.Width)>Result) then begin
               Result:=Control.Left+Control.Width;
            end;
         end;
      end;
   end;
end;

function TDesignWinList.GetMaxWidth: Integer;
var
   I : Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   Result:=0;
   if GetCount>0 then begin
      Item:=GetItem(0);
      if (Item<>nil) and (Item.Control<>nil) then begin
         Result:=Item.Control.Width;
         for I:=1 to Pred(GetCount) do begin
            Item:=GetItem(I);
            Control:=Item.Control;
            if (Item<>nil) and (Control<>nil) and (Control.Width>Result) then begin
               Result:=Control.Width;
            end;
         end;
      end;
   end;
end;

function TDesignWinList.GetMinHeight: Integer;
var
   I : Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   Result:=0;
   if GetCount>0 then begin
      Item:=GetItem(0);
      if (Item<>nil) and (Item.Control<>nil) then begin
         Result:=Item.Control.Height;
         for I:=1 to Pred(GetCount) do begin
            Item:=GetItem(I);
            Control:=Item.Control;
            if (Item<>nil) and (Control<>nil) and (Control.Height<Result) then begin
               Result:=Control.Height;
            end;
         end;
      end;
   end;
end;

function TDesignWinList.GetMinLeft: Integer;
var
   I : Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   Result:=0;
   if GetCount>0 then begin
      Item:=GetItem(0);
      if (Item<>nil) and (Item.Control<>nil) then begin
         Result:=Item.Control.Left;
         for I:=1 to Pred(GetCount) do begin
            Item:=GetItem(I);
            Control:=Item.Control;
            if (Item<>nil) and (Control<>nil) and (Control.Left<Result) then begin
               Result:=Control.Left;
            end;
         end;
      end;
   end;
end;

function TDesignWinList.GetMinTop: Integer;
var
   I : Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   Result:=0;
   if GetCount>0 then begin
      Item:=GetItem(0);
      if (Item<>nil) and (Item.Control<>nil) then begin
         Result:=Item.Control.Top;
         for I:=1 to Pred(GetCount) do begin
            Item:=GetItem(I);
            Control:=Item.Control;
            if (Item<>nil) and (Control<>nil) and (Control.Top<Result) then begin
               Result:=Control.Top;
            end;
         end;
      end;
   end;
end;

function TDesignWinList.GetMinWidth: Integer;
var
   I : Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   Result:=0;
   if GetCount>0 then begin
      Item:=GetItem(0);
      if (Item<>nil) and (Item.Control<>nil) then begin
         Result:=Item.Control.Width;
         for I:=1 to Pred(GetCount) do begin
            Item:=GetItem(I);
            Control:=Item.Control;
            if (Item<>nil) and (Control<>nil) and (Control.Width<Result) then begin
               Result:=Control.Width;
            end;
         end;
      end;
   end;
end;

procedure TDesignWinList.Grow(DX1, DY1, DX2, DY2: Integer);
var
   I: Integer;
   Item: TDesignWindow;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.SetBounds(Item.Left+DX1, Item.Top+DY1, Item.Width+DX2, Item.Height+DY2);
         Item.UpdatePos;
      end;
   end;
end;

function IsParent(Control: TControl; AParent: TWinControl): Boolean;
var
   Parent: TWinControl;
begin
   Result:=False;
   if (Control<>nil) and (AParent<>nil) then begin
      Parent:=Control.Parent;
      while (Parent<>AParent) and (Parent<>nil) do begin
         Parent:=Parent.Parent;
      end;
      if Parent=AParent then begin
         Result:=True;
      end;
   end;
end;

function TDesignWinList.HasParent(Control: TControl): Boolean;
var
   I: Integer;
   Item: TDesignWindow;
begin
   Result:=False;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item.Control is TWinControl) and IsParent(Control, TWinControl(Item.Control)) then begin
         Result:=True;
         Break;
      end;
   end;
end;

function TDesignWinList.IndexOf(Win: TControl): Integer;
var
   I: Integer;
   Item: TDesignWindow;
begin
   Result:=-1;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item=Win) then begin
         Result:=I;
         Break;
      end;
   end;
end;

function TDesignWinList.IndexOfControl(Control: TControl): Integer;
var
   I: Integer;
   Item: TDesignWindow;
begin
   Result:=-1;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Control=Control) then begin
         Result:=I;
         Break;
      end;
   end;
end;

function TDesignWinList.IsControl(Control: TControl): Boolean;
var
   I: Integer;
   Item: TDesignWindow;
begin
   Result:=False;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and (Item.Control=Control) then begin
         Result:=True;
         Break;
      end;
   end;
end;

procedure TDesignWinList.Move(DX, DY: Integer);
var
   I: Integer;
   Item: TDesignWindow;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Visible:=False;
         Item.SetBounds(Item.Left+DX, Item.Top+DY, Item.Width, Item.Height);
         Item.Visible:=True;
      end;
   end;
end;

procedure TDesignWinList.RemoveChild;
var
   I: Integer;
   Ind: Integer;
   Item: TDesignWindow;
   List: TList;
begin
   List:=TList.Create;
   try
      for I:=0 to Pred(GetCount) do begin
         Item:=GetItem(I);
         if HasParent(Item.Control) then begin
            List.Add(Item);
         end;
      end;
      for I:=0 to Pred(List.Count) do begin
         Ind:=IndexOf(TControl(List[I]));
         Delete(Ind);
      end;
   finally
      List.Free;
   end;
end;

procedure TDesignWinList.SetBottom(NewBottom: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Control:=Item.Control;
      if (Item<>nil) and (Control<>nil) then begin
         Control.Top:=NewBottom-Control.Height;
         Item.ResizeControl(Control);
         FDesigner.DoUpdate(Control);
      end;
   end;
end;

procedure TDesignWinList.SetHeight(NewHeight: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Control:=Item.Control;
      if (Item<>nil) and (Control<>nil) then begin
         Control.Height:=NewHeight;
         Item.ResizeControl(Control);
         FDesigner.DoUpdate(Control);
      end;
   end;
end;

procedure TDesignWinList.SetHorzCenter(MinLeft, MaxRight: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Control:=Item.Control;
      if (Item<>nil) and (Control<>nil) then begin
         Control.Left:=MinLeft+((MaxRight-MinLeft-Control.Width) div 2);
         Item.ResizeControl(Control);
         FDesigner.DoUpdate(Control);
      end;
   end;
end;

function CompareListLeft(Item1, Item2: Pointer): Integer;
var
   Win1: TDesignWindow;
   Win2: TDesignWindow;
   Control1: TControl;
   Control2: TControl;
begin
   Win1:=TDesignWindow(Item1);
   Win2:=TDesignWindow(Item2);
   Control1:=Win1.Control;
   Control2:=Win2.Control;
   Result:=Control1.Left-Control2.Left;
end;

procedure TDesignWinList.SetHorzEqual(MinLeft, MaxRight: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Control: TControl;
   Step: Integer;
   Left: Integer;
   Items: TList;
begin
   Step:=MaxRight-MinLeft;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Control:=Item.Control;
      if (Item<>nil) and (Control<>nil) then begin
         Step:=Step-Control.Width;
      end;
   end;
   Step:=Step div Pred(GetCount);
   Left:=MinLeft;
   Items:=TList.Create;
   try
      for I:=0 to Pred(GetCount) do begin
         Items.Add(GetItem(I));
      end;
      Items.Sort(CompareListLeft);
      for I:=0 to Pred(GetCount) do begin
         Item:=TDesignWindow(Items[I]);
         Control:=Item.Control;
         if (Item<>nil) and (Control<>nil) then begin
            Control.Left:=Left;
            Item.ResizeControl(Control);
            Left:=Left+Control.Width;
            FDesigner.DoUpdate(Control);
         end;
         Left:=Left+Step;
      end;
   finally
      Items.Free;
   end;
end;

procedure TDesignWinList.SetLeft(NewLeft: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Control:=Item.Control;
      if (Item<>nil) and (Control<>nil) then begin
         Control.Left:=NewLeft;
         Item.ResizeControl(Control);
         FDesigner.DoUpdate(Control);
      end;
   end;
end;

procedure TDesignWinList.SetRight(NewRight: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Control:=Item.Control;
      if (Item<>nil) and (Control<>nil) then begin
         Control.Left:=NewRight-Control.Width;
         Item.ResizeControl(Control);
         FDesigner.DoUpdate(Control);
      end;
   end;
end;

procedure TDesignWinList.SetTop(NewTop: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Control:=Item.Control;
      if (Item<>nil) and (Control<>nil) then begin
         Control.Top:=NewTop;
         Item.ResizeControl(Control);
         FDesigner.DoUpdate(Control);
      end;
   end;
end;

procedure TDesignWinList.SetVertCenter(MinTop, MaxBottom: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Control:=Item.Control;
      if (Item<>nil) and (Control<>nil) then begin
         Control.Top:=MinTop+((MaxBottom-MinTop-Control.Height) div 2);
         Item.ResizeControl(Control);
         FDesigner.DoUpdate(Control);
      end;
   end;
end;

function CompareListTop(Item1, Item2: Pointer): Integer;
var
   Win1: TDesignWindow;
   Win2: TDesignWindow;
   Control1: TControl;
   Control2: TControl;
begin
   Win1:=TDesignWindow(Item1);
   Win2:=TDesignWindow(Item2);
   Control1:=Win1.Control;
   Control2:=Win2.Control;
   Result:=Control1.Top-Control2.Top;
end;

procedure TDesignWinList.SetVertEqual(MinTop, MaxBottom: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Control: TControl;
   Step: Integer;
   Top: Integer;
   Items: TList;
begin
   Step:=MaxBottom-MinTop;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Control:=Item.Control;
      if (Item<>nil) and (Control<>nil) then begin
         Step:=Step-Control.Height;
      end;
   end;
   Step:=Step div Pred(GetCount);
   Top:=MinTop;
   Items:=TList.Create;
   try
      for I:=0 to Pred(GetCount) do begin
         Items.Add(GetItem(I));
      end;
      Items.Sort(CompareListTop);
      for I:=0 to Pred(GetCount) do begin
         Item:=TDesignWindow(Items[I]);
         Control:=Item.Control;
         if (Item<>nil) and (Control<>nil) then begin
            Control.Top:=Top;
            Item.ResizeControl(Control);
            Top:=Top+Control.Height;
            FDesigner.DoUpdate(Control);
         end;
         Top:=Top+Step;
      end;
   finally
      Items.Free;
   end;
end;

procedure TDesignWinList.SetWidth(NewWidth: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Control: TControl;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      Control:=Item.Control;
      if (Item<>nil) and (Control<>nil) then begin
         Control.Width:=NewWidth;
         Item.ResizeControl(Control);
         FDesigner.DoUpdate(Control);
      end;
   end;
end;

procedure TDesignWinList.Shift(DX, DY: Integer);
var
   I: Integer;
   Item: TDesignWindow;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.SetBounds(Item.Left+DX, Item.Top+DY, Item.Width, Item.Height);
         Item.UpdatePos;
      end;
   end;
end;

procedure TDesignWinList.StartMove(Ind: Integer);
var
   I: Integer;
   Item: TDesignWindow;
   Win: TDesignWindow;
   Pt: TPoint;
   MoveControl: TControl;
begin
   MoveControl:=GetItem(Ind).Control;
   RemoveChild;
   //
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Visible:=False;
         Item.State:=dsMove;
         Item.Visible:=True;
         Item.IsMouseDown:=True;
         GetCursorPos(Pt);
         Item.StartX:=Pt.x;
         Item.StartY:=Pt.y;
         Item.DesignCommand:=dcMove;
      end;
   end;
   //
   repeat
      Ind:=IndexOfControl(MoveControl);
      MoveControl:=MoveControl.Parent;
   until (Ind<>-1) or (MoveControl=nil);
   if (MoveControl=nil) or (Ind=-1) then begin
      Ind:=0;
   end;
   FMoveInd:=Ind;
   Win:=GetItem(Ind);
   Windows.SetCapture(Win.Handle);
   if Win.Visible and Win.CanFocus then begin
      Win.SetFocus;
   end;
   Win.SetClipMouse;
   Win.CheckScrollWindow(True);
end;

procedure TDesignWinList.StopMove;
var
   I: Integer;
   Item: TDesignWindow;
   Win: TDesignWindow;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.UpdatePos;
      end;
   end;
   Win:=GetItem(FMoveInd);
   Win.CheckScrollWindow(False);
end;

end.
