unit fDsgnTb; // tab order form [02.11.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ImgList, ComCtrls, ToolWin, mFindInt, mFindPrp, mDrag;

type
   TfmDsgnOrder=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      gbList: TGroupBox;
      lbOrder: TListBox;
      tbaOrder: TToolBar;
      tbUp: TToolButton;
      tbDown: TToolButton;
      imOrder: TImageList;
      procedure tbUpClick(Sender: TObject);
      procedure tbDownClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure lbOrderClick(Sender: TObject);
      procedure lbOrderDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
      procedure lbOrderDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure lbOrderDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
      procedure lbOrderEndDrag(Sender, Target: TObject; X, Y: Integer);
      procedure lbOrderMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure lbOrderMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure lbOrderMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure lbOrderStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure FormResize(Sender: TObject);
   private
      FFields: TStringList;
      FFilterInterface: TFilterInterface;
      FDragField: TDragField;
      FDragStarted: Boolean;
      FStartDragPos: TPoint;
   public
      procedure SetFields(Fields: TStringList);
      procedure GetFields(Fields: TStringList);
      procedure MoveUp(Ind: Integer);
      procedure MoveDown(Ind: Integer);
      procedure UpdateButton;
      procedure ResizeControl;
   end;

function ShowTabOrder(FilterInterface: TFilterInterface; Fields: TStringList): Boolean;

implementation

{$R *.DFM}

function ShowTabOrder(FilterInterface: TFilterInterface; Fields: TStringList): Boolean;
begin
   Result:=False;
   with TfmDsgnOrder.Create(nil) do begin
      try
         ResizeControl;
         FFilterInterface:=FilterInterface;
         SetFields(Fields);
         UpdateButton;
         if ShowModal=mrOk then begin
            GetFields(Fields);
            Result:=True;
         end;
      finally
         Free;
      end;
   end;
end;

{ TfmDsgnOrder }

procedure TfmDsgnOrder.GetFields(Fields: TStringList);
begin
   FFields.Assign(lbOrder.Items);
   Fields.Assign(FFields);
end;

procedure TfmDsgnOrder.SetFields(Fields: TStringList);
begin
   FFields.Assign(Fields);
   lbOrder.Items.BeginUpdate;
   try
      lbOrder.Items.Clear;
      lbOrder.Items.Assign(FFields);
      SetListBoxMaxWidth(lbOrder, 4+16, True);
      SetListBoxHeight(lbOrder);
      if lbOrder.Items.Count>0 then begin
         lbOrder.ItemIndex:=0;
      end;
   finally
      lbOrder.Items.EndUpdate;
   end;
end;

procedure TfmDsgnOrder.tbUpClick(Sender: TObject);
begin
   MoveUp(lbOrder.ItemIndex);
   UpdateButton;
end;

procedure TfmDsgnOrder.tbDownClick(Sender: TObject);
begin
   MoveDown(lbOrder.ItemIndex);
   UpdateButton;
end;

procedure TfmDsgnOrder.MoveDown(Ind: Integer);
begin
   if (Ind<>-1) and (Ind<Pred(lbOrder.Items.Count)) then begin
      lbOrder.Items.Exchange(Succ(Ind), Ind);
      lbOrder.ItemIndex:=Succ(Ind);
   end;
end;

procedure TfmDsgnOrder.MoveUp(Ind: Integer);
begin
   if Ind>0 then begin
      lbOrder.Items.Exchange(Pred(Ind), Ind);
      lbOrder.ItemIndex:=Pred(Ind);
   end;
end;

procedure TfmDsgnOrder.UpdateButton;
begin
   tbUp.Enabled:=(lbOrder.ItemIndex<>-1) and (lbOrder.ItemIndex>0);
   tbDown.Enabled:=(lbOrder.ItemIndex<>-1) and (lbOrder.ItemIndex<Pred(lbOrder.Items.Count));
end;

procedure TfmDsgnOrder.FormCreate(Sender: TObject);
begin
   FFields:=TStringList.Create;
   FDragStarted:=False;
   FDragField:=nil;
   AddControlStyle(Self, [csDisplayDragImage]);
end;

procedure TfmDsgnOrder.FormDestroy(Sender: TObject);
begin
   FFields.Free;
end;

procedure TfmDsgnOrder.lbOrderClick(Sender: TObject);
begin
   UpdateButton;
end;

procedure TfmDsgnOrder.lbOrderDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
   ImageIndex: Integer;
   Flags: Longint;
   S: string;
   Ctrl: TCtrlItem;
   Field: TFieldCtrl;
begin
   lbOrder.Canvas.Brush.Color:=lbOrder.Color;
   lbOrder.Canvas.FillRect(Rect);
   Ctrl:=TCtrlItem(lbOrder.Items.Objects[Index]);
   Field:=Ctrl.Field;
   if Field.FindItem<>nil then begin
      ImageIndex:=FFilterInterface.GetImageIndex(Field.FindItem.Field);
      FFilterInterface.Images.imFields.Draw(lbOrder.Canvas, Rect.Left+2, Rect.Top, ImageIndex, True);
   end;
   if odSelected in State then begin
      lbOrder.Canvas.Font.Style:=[fsBold];
      lbOrder.Canvas.Font.Color:=clHighlightText;
      lbOrder.Canvas.Brush.Color:=clHighlight;
   end
   else begin
      lbOrder.Canvas.Font.Style:=[];
      lbOrder.Canvas.Font.Color:=lbOrder.Font.Color;
      lbOrder.Canvas.Brush.Color:=lbOrder.Color;
   end;
   lbOrder.Canvas.FillRect(Classes.Rect(Rect.Left+4+16, Rect.Top, Rect.Right-1, Rect.Bottom));
   Flags:=lbOrder.DrawTextBiDiModeFlags(DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
   Inc(Rect.Left, 16+4+2);
   S:=lbOrder.Items[Index];
   DrawText(lbOrder.Canvas.Handle, PChar(S), Length(S), Rect, Flags);
   if odSelected in State then begin
      Dec(Rect.Left, 2);
      DrawFocusRect(lbOrder.Canvas.Handle, Rect);
      Inc(Rect.Left, 2);
   end;
   Dec(Rect.Left, 16+4+2);
   ExcludeClipRect(lbOrder.Canvas.Handle, Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
end;

procedure TfmDsgnOrder.lbOrderDragDrop(Sender, Source: TObject; X, Y: Integer);
var
   Ind: Integer;
   DelInd: Integer;
   Data: TObject;
begin
   if Source is TDragField then begin
      if FDragField.Control=lbOrder then begin
         Ind:=lbOrder.ItemAtPos(Point(X, Y), True);
         if (Ind<>-1) and (lbOrder.ItemIndex<>-1) and (Ind<>lbOrder.ItemIndex) then begin
            Data:=TDragField(Source).Data;
            DelInd:=lbOrder.Items.IndexOfObject(Data);
            lbOrder.Items.Delete(DelInd);
            lbOrder.Items.InsertObject(Ind, TDragField(Source).Text, Data);
            lbOrder.ItemIndex:=lbOrder.Items.IndexOfObject(Data);
            UpdateButton;
         end;
      end;
   end;
end;

procedure TfmDsgnOrder.lbOrderDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   if Source is TDragField then begin
      if FDragField.Control=lbOrder then begin
         Accept:=True;
      end
      else begin
         Accept:=False;
      end;
   end
   else begin
      Accept:=False;
   end;
end;

procedure TfmDsgnOrder.lbOrderEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
   FDragField:=nil;
end;

procedure TfmDsgnOrder.lbOrderMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (Button=mbLeft) and not FDragStarted then begin
      GetCursorPos(FStartDragPos);
      FDragStarted:=True;
   end;
end;

procedure TfmDsgnOrder.lbOrderMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
   P: TPoint;
begin
   if FDragStarted then begin
      GetCursorPos(P);
      if (Abs(P.X-FStartDragPos.X)>3) or (Abs(P.Y-FStartDragPos.Y)>=1) then begin
         FDragStarted:=False;
         lbOrder.BeginDrag(False);
      end;
   end;
end;

procedure TfmDsgnOrder.lbOrderMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FDragStarted:=False;
end;

procedure TfmDsgnOrder.lbOrderStartDrag(Sender: TObject; var DragObject: TDragObject);
var
   Ind: Integer;
   Ctrl: TCtrlItem;
   Field: TFieldCtrl;
begin
   if lbOrder.ItemIndex<>-1 then begin
      FStartDragPos:=lbOrder.ScreenToClient(FStartDragPos);
      Ind:=lbOrder.ItemAtPos(FStartDragPos, True);
      if Ind<>-1 then begin
         FDragField:=TDragField.Create(TControl(Sender));
         FDragField.Images:=FFilterInterface.Images.imFields;
         Ctrl:=TCtrlItem(lbOrder.Items.Objects[Ind]);
         Field:=Ctrl.Field;
         if Field.FindItem<>nil then begin
            FDragField.ImageIndex:=FFilterInterface.GetImageIndex(Field.FindItem.Field);
         end
         else begin
            FDragField.ImageIndex:=-1;
         end;
         FDragField.Text:=lbOrder.Items[Ind];
         FDragField.Data:=lbOrder.Items.Objects[Ind];
         DragObject:=FDragField;
      end;
   end;
end;

procedure TfmDsgnOrder.ResizeControl;
begin
   gbList.Width:=ClientWidth-2*gbList.Left;
   lbOrder.Width:=gbList.ClientWidth-lbOrder.Left*3-tbaOrder.Width;
   tbaOrder.Left:=2*lbOrder.Left+lbOrder.Width;
end;

procedure TfmDsgnOrder.FormResize(Sender: TObject);
begin
   tbaOrder.Top:=(gbList.ClientHeight-tbaOrder.Height) div 2;
end;

end.
