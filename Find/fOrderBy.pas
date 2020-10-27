// форма для указания порядка сортировки результатов запроса
unit fOrderBy; // edit order by form [05.10.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, mFindInt, ActnList, ImgList, Buttons, ComCtrls, ToolWin,
   ExtCtrls, mDrag;

type

   TfmOrderBy=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      gbFields: TGroupBox;
      gbOrder: TGroupBox;
      lbFields: TListBox;
      lbOrder: TListBox;
      imOrder: TImageList;
      alOrder: TActionList;
      acDown: TAction;
      acUp: TAction;
      acRight: TAction;
      acLeft: TAction;
      paButton1: TPanel;
      tbaButton1: TToolBar;
      tbUp: TToolButton;
      tbDown: TToolButton;
      paButton2: TPanel;
      tbaButton2: TToolBar;
      tbRight: TToolButton;
      tbLeft: TToolButton;
      paButton3: TPanel;
      tbaButton3: TToolBar;
      tbSortAsc: TToolButton;
      tbSortDesc: TToolButton;
      acSortAsc: TAction;
      acSortDesc: TAction;
      procedure acDownExecute(Sender: TObject);
      procedure acUpExecute(Sender: TObject);
      procedure acRightExecute(Sender: TObject);
      procedure acLeftExecute(Sender: TObject);
      procedure lbFieldsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
      procedure lbOrderDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure lbFieldsClick(Sender: TObject);
      procedure lbOrderClick(Sender: TObject);
      procedure lbFieldsDblClick(Sender: TObject);
      procedure lbOrderDblClick(Sender: TObject);
      procedure lbOrderDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
      procedure lbOrderDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
      procedure lbFieldsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
      procedure lbFieldsDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure lbOrderMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure lbOrderMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure acSortAscExecute(Sender: TObject);
      procedure acSortDescExecute(Sender: TObject);
      procedure lbFieldsStartDrag(Sender: TObject; var DragObject: TDragObject);
      procedure lbFieldsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure lbFieldsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure lbFieldsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure lbFieldsEndDrag(Sender, Target: TObject; X, Y: Integer);
      procedure lbOrderStartDrag(Sender: TObject; var DragObject: TDragObject);
      procedure lbOrderMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
      procedure lbOrderEndDrag(Sender, Target: TObject; X, Y: Integer);
   private
      FFields: TFindFieldList;
      FOrderFields: TStringList;
      FOrderList: TOrderList;
      FDragStarted: Boolean;
      FStartDragPos: TPoint;
      FDragField: TDragField;
      FFilterInterface: TFilterInterface;
   private
      procedure UpdateButton;
      procedure SetFields(Fields: TFindFieldList; OrderFields: TStringList; OrderList: TOrderList);
      procedure SetOrderFields(OrderFields: TStringList; OrderList: TOrderList);
      procedure AddField(Ind: Integer);
      procedure DelField(Ind: Integer);
      procedure UpField(Ind: Integer);
      procedure DownField(Ind: Integer);
      procedure SortAsc(Ind: Integer);
      procedure SortDesc(Ind: Integer);
   end;

function SetOrderBy(FilterInterface: TFilterInterface; OrderList: TOrderList): Boolean;

implementation
uses
   fFindAdd, dFindImg;

{$R *.DFM}

function SetOrderBy(FilterInterface: TFilterInterface; OrderList: TOrderList): Boolean;
begin
   Result:=False;
   with TfmOrderBy.Create(nil) do begin
      try
         FFilterInterface:=FilterInterface;
         SetFields(FilterInterface.FindFieldList, FilterInterface.OrderFields, OrderList);
         SetOrderFields(FilterInterface.OrderFields, OrderList);
         UpdateButton;
         if ShowModal=mrOk then begin
            OrderList.Assign(FOrderList);
            Result:=True;
         end;
      finally
         Free;
      end;
   end;
end;

{ TfmOrderBy }

procedure TfmOrderBy.AddField(Ind: Integer);
var
   InsInd: Integer;
   DelInd: Integer;
   Field: TFindFieldItem;
   Item: TOrderItem;
begin
   if Ind<>-1 then begin
      Field:=TFindFieldItem(FOrderFields.Objects[Integer(lbFields.Items.Objects[Ind])]);
      if (lbOrder.ItemIndex<>-1) and (lbOrder.ItemIndex<Pred(lbOrder.Items.Count)) then begin
         InsInd:=Succ(lbOrder.ItemIndex);
         Item:=FOrderList.InsertNew(InsInd, Field.Path, True, False);
         lbOrder.Items.InsertObject(InsInd, lbFields.Items[Ind], Item);
         lbOrder.ItemIndex:=InsInd;
      end
      else begin
         Item:=FOrderList.AddNew(Field.Path, True, False);
         lbOrder.ItemIndex:=lbOrder.Items.AddObject(lbFields.Items[Ind], Item);
      end;
      DelInd:=lbFields.Items.IndexOfObject(TObject(FOrderFields.IndexOfObject(Field)));
      lbFields.Items.Delete(DelInd);
      if DelInd<lbFields.Items.Count then begin
         lbFields.ItemIndex:=DelInd;
      end
      else begin
         lbFields.ItemIndex:=Pred(lbFields.Items.Count);
      end;
   end;
end;

procedure TfmOrderBy.DelField(Ind: Integer);
var
   I: Integer;
   InsInd: Integer;
   DelInd: Integer;
   Item: TOrderItem;
   Field: TFindFieldItem;
   FieldInd: Integer;
begin
   if Ind<>-1 then begin
      Item:=TOrderItem(lbOrder.Items.Objects[Ind]);
      Field:=FFields.ByPath(Item.FieldPath);
      FieldInd:=FOrderFields.IndexOfObject(Field);
      InsInd:=-1;
      for I:=0 to Pred(lbFields.Items.Count) do begin
         if Integer(lbFields.Items.Objects[I])>FieldInd then begin
            InsInd:=I;
            Break;
         end;
      end;
      if InsInd<>-1 then begin
         lbFields.Items.InsertObject(InsInd, lbOrder.Items[Ind], TObject(FieldInd));
         lbFields.ItemIndex:=InsInd;
      end
      else begin
         lbFields.ItemIndex:=lbFields.Items.AddObject(lbOrder.Items[Ind], TObject(FieldInd));
      end;
      DelInd:=lbOrder.Items.IndexOfObject(Item);
      lbOrder.Items.Delete(DelInd);
      FOrderList.Delete(DelInd);
      if DelInd<lbOrder.Items.Count then begin
         lbOrder.ItemIndex:=DelInd;
      end
      else begin
         lbOrder.ItemIndex:=Pred(lbOrder.Items.Count);
      end;
   end;
end;

procedure TfmOrderBy.DownField(Ind: Integer);
begin
   if (Ind<>-1) and (Ind<Pred(lbOrder.Items.Count)) then begin
      lbOrder.Items.Exchange(Succ(Ind), Ind);
      FOrderList.Exchange(Succ(Ind), Ind);
   end;
end;

procedure TfmOrderBy.SetFields(Fields: TFindFieldList; OrderFields: TStringList; OrderList: TOrderList);
var
   I: Integer;
   Path: string;
   Field: TFindFieldItem;
   //-B: Integer;
   //-MaxW: Integer;
   //-W: Integer;
begin
   FFields:=Fields;
   FOrderFields.Assign(OrderFields);
   FOrderList.Assign(OrderList);
   //-lbFields.DoubleBuffered:=True;
   SetListBoxHeight(lbFields);
   lbFields.Items.BeginUpdate;
   try
      lbFields.Clear;
      //-B:=GetComboBoxNonTextArea+4+16;
      //-MaxW:=lbFields.ClientWidth-B;
      for I:=0 to Pred(FOrderFields.Count) do begin
         Path:=FOrderFields[I];
         Field:=FFields.ByPath(Path);
         FOrderFields.Objects[I]:=Field;
         if FOrderList.IndexOfPath(Path)=-1 then begin
            if Field<>nil then begin
               lbFields.Items.AddObject(Field.AddCaption, TObject(I));
               //-W:=GetTextWidth(Field.AddCaption, lbFields.Font.Height, lbFields.Font.Name, True);
               //-if MaxW<W then begin
               //-   MaxW:=W;
               //-end;
            end;
         end;
      end;
      //-MaxW:=MaxW+B;
      //-lbFields.Perform(LB_SETHORIZONTALEXTENT, MaxW, 0);
      SetListBoxMaxWidth(lbFields, 4+16, True);
      if lbFields.Items.Count>0 then begin
         lbFields.ItemIndex:=0;
      end;
   finally
      lbFields.Items.EndUpdate;
   end;
end;

procedure TfmOrderBy.SetOrderFields(OrderFields: TStringList; OrderList: TOrderList);
var
   I: Integer;
   Path: string;
   Field: TFindFieldItem;
   //-B: Integer;
   //-MaxW: Integer;
   //-W: Integer;
begin
   //-lbOrder.DoubleBuffered:=True;
   SetListBoxHeight(lbOrder);
   lbOrder.Items.BeginUpdate;
   try
      lbOrder.Clear;
      //-B:=16+GetComboBoxNonTextArea+4+16;
      //-MaxW:=lbOrder.ClientWidth-B;
      for I:=0 to Pred(FOrderList.Count) do begin
         Path:=FOrderList[I].FieldPath;
         if FOrderFields.IndexOf(Path)<>-1 then begin
            Field:=FFields.ByPath(Path);
            if Field<>nil then begin
               lbOrder.Items.AddObject(Field.AddCaption, FOrderList[I]);
               //-W:=GetTextWidth(Field.AddCaption, lbOrder.Font.Height, lbOrder.Font.Name, True);
               //-if MaxW<W then begin
               //-   MaxW:=W;
               //-end;
            end;
         end;
      end;
      //-MaxW:=MaxW+B;
      //-lbOrder.Perform(LB_SETHORIZONTALEXTENT, MaxW, 0);
      SetListBoxMaxWidth(lbOrder, 4+16+16, True);
      if lbOrder.Items.Count>0 then begin
         lbOrder.ItemIndex:=0;
      end;
   finally
      lbOrder.Items.EndUpdate;
   end;
end;

procedure TfmOrderBy.UpdateButton;
var
   Item: TOrderItem;
begin
   acUp.Enabled:=(lbOrder.ItemIndex<>-1) and (lbOrder.ItemIndex>0);
   acDown.Enabled:=(lbOrder.ItemIndex<>-1) and (lbOrder.ItemIndex<Pred(lbOrder.Items.Count));
   acLeft.Enabled:=lbOrder.ItemIndex<>-1;
   acRight.Enabled:=lbFields.ItemIndex<>-1;
   acSortAsc.Enabled:=lbOrder.ItemIndex<>-1;
   acSortDesc.Enabled:=lbOrder.ItemIndex<>-1;
   if lbOrder.ItemIndex<>-1 then begin
      Item:=TOrderItem(lbOrder.Items.Objects[lbOrder.ItemIndex]);
      if Item.Direction then begin
         tbSortAsc.ImageIndex:=6;
         tbSortAsc.Hint:='Сортировать по возрастанию';
      end
      else begin
         tbSortAsc.ImageIndex:=7;
         tbSortAsc.Hint:='Сортировать по убыванию';
      end;
   end
   else begin
      tbSortAsc.ImageIndex:=6;
   end;
end;

procedure TfmOrderBy.UpField(Ind: Integer);
begin
   if (Ind<>-1) and (Ind>0) then begin
      lbOrder.Items.Exchange(Pred(Ind), Ind);
      FOrderList.Exchange(Pred(Ind), Ind);
   end;
end;

procedure TfmOrderBy.acDownExecute(Sender: TObject);
begin
   DownField(lbOrder.ItemIndex);
   UpdateButton;
end;

procedure TfmOrderBy.acUpExecute(Sender: TObject);
begin
   UpField(lbOrder.ItemIndex);
   UpdateButton;
end;

procedure TfmOrderBy.acRightExecute(Sender: TObject);
begin
   AddField(lbFields.ItemIndex);
   UpdateButton;
end;

procedure TfmOrderBy.acLeftExecute(Sender: TObject);
begin
   DelField(lbOrder.ItemIndex);
   UpdateButton;
end;

procedure TfmOrderBy.lbFieldsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
   ImageIndex: Integer;
   Flags: Longint;
begin
   lbFields.Canvas.Brush.Color:=lbFields.Color;
   lbFields.Canvas.FillRect(Rect);
   ImageIndex:=FFilterInterface.GetImageIndex(TFindFieldItem(FOrderFields.Objects[Integer(lbFields.Items.Objects[Index])]));
   FFilterInterface.Images.imFields.Draw(lbFields.Canvas, Rect.Left+2, Rect.Top, ImageIndex, True);
   if odSelected in State then begin
      lbFields.Canvas.Font.Style:=[fsBold];
      lbFields.Canvas.Font.Color:=clHighlightText;
      lbFields.Canvas.Brush.Color:=clHighlight;
   end
   else begin
      lbFields.Canvas.Font.Style:=[];
      lbFields.Canvas.Font.Color:=lbFields.Font.Color;
      lbFields.Canvas.Brush.Color:=lbFields.Color;
   end;
   lbFields.Canvas.FillRect(Classes.Rect(Rect.Left+4+16, Rect.Top, Rect.Right-1, Rect.Bottom));
   Flags:=lbFields.DrawTextBiDiModeFlags(DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
   Inc(Rect.Left, 16+4+2);
   DrawText(lbFields.Canvas.Handle, PChar(lbFields.Items[Index]), Length(lbFields.Items[Index]), Rect, Flags);
   if odFocused in State then begin
      Dec(Rect.Left, 2);
      DrawFocusRect(lbFields.Canvas.Handle, Rect);
      Inc(Rect.Left, 2);
   end;
   Dec(Rect.Left, 16+4+2);
   ExcludeClipRect(lbFields.Canvas.Handle, Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
end;

procedure TfmOrderBy.lbOrderDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
   Item: TOrderItem;
   Field: TFindFieldItem;
   ImageIndex0: Integer;
   ImageIndex1: Integer;
   Flags: Longint;
begin
   if FDragField<>nil then begin
      FDragField.HideDragImage
   end;
   lbOrder.Canvas.Brush.Color:=lbOrder.Color;
   lbOrder.Canvas.FillRect(Rect);
   Item:=TOrderItem(lbOrder.Items.Objects[Index]);
   Field:=FFields.ByPath(Item.FieldPath);
   ImageIndex1:=FFilterInterface.GetImageIndex(Field);
   if Item.Direction then begin
      ImageIndex0:=II_Asc;
   end
   else begin
      ImageIndex0:=II_Desc;
   end;
   FFilterInterface.Images.imFields.Draw(lbOrder.Canvas, 16+Rect.Left+2, Rect.Top, ImageIndex1, True);
   imOrder.Draw(lbOrder.Canvas, Rect.Left, Rect.Top, ImageIndex0, True);
   if odSelected in State then begin
      lbOrder.Canvas.Font.Style:=[fsBold];
      if FDragField=nil then begin
         lbOrder.Canvas.Font.Color:=clHighlightText;
         lbOrder.Canvas.Brush.Color:=clHighlight;
      end
      else begin
         lbOrder.Canvas.Font.Color:=lbOrder.Font.Color;
         lbOrder.Canvas.Brush.Color:=lbOrder.Color;
      end;
   end
   else begin
      lbOrder.Canvas.Font.Style:=[];
      lbOrder.Canvas.Font.Color:=lbOrder.Font.Color;
      lbOrder.Canvas.Brush.Color:=lbOrder.Color;
   end;
   lbOrder.Canvas.FillRect(Classes.Rect(16+Rect.Left+4+16, Rect.Top, Rect.Right-1, Rect.Bottom));
   Flags:=lbOrder.DrawTextBiDiModeFlags(DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
   Inc(Rect.Left, 16+4+16+2);
   DrawText(lbOrder.Canvas.Handle, PChar(lbOrder.Items[Index]), Length(lbOrder.Items[Index]), Rect, Flags);
   if odFocused in State then begin
      Dec(Rect.Left, 2);
      DrawFocusRect(lbOrder.Canvas.Handle, Rect);
      Inc(Rect.Left, 2);
   end;
   if FDragField<>nil then begin
      FDragField.ShowDragImage
   end;
   Dec(Rect.Left, 16+4+16+2);
   ExcludeClipRect(lbOrder.Canvas.Handle, Rect.Left, Rect.Top, Rect.Right, Rect.Bottom);
end;

procedure TfmOrderBy.FormCreate(Sender: TObject);
begin
   FOrderFields:=TStringList.Create;
   FOrderList:=TOrderList.Create;
   FDragStarted:=False;
   FDragField:=nil;
   // устанавливаем стиль для отображение drag image
   AddControlStyle(Self, [csDisplayDragImage]);
end;

procedure TfmOrderBy.FormDestroy(Sender: TObject);
begin
   FOrderFields.Free;
   FOrderList.Free;
end;

procedure TfmOrderBy.lbFieldsClick(Sender: TObject);
begin
   UpdateButton;
end;

procedure TfmOrderBy.lbOrderClick(Sender: TObject);
begin
   UpdateButton;
end;

procedure TfmOrderBy.lbFieldsDblClick(Sender: TObject);
begin
   AddField(lbFields.ItemIndex);
   UpdateButton;
end;

procedure TfmOrderBy.lbOrderDblClick(Sender: TObject);
var
   P: TPoint;
begin
   GetCursorPos(P);
   P:=lbOrder.ScreenToClient(P);
   if P.x>16 then begin
      DelField(lbOrder.ItemIndex);
      UpdateButton;
   end;
end;

procedure TfmOrderBy.lbOrderDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
   Ind: Integer;
begin
   if Source is TDragField then begin
      if FDragField.Control=lbFields then begin
         if lbOrder.Visible and lbOrder.CanFocus then begin
            lbOrder.SetFocus;
         end;
         Accept:=True;
         Ind:=lbOrder.ItemAtPos(Point(X, Y), True);
         if Ind<>-1 then begin
            lbOrder.ItemIndex:=Ind;
         end;
      end;
      if FDragField.Control=lbOrder then begin
         Ind:=lbOrder.ItemAtPos(Point(X, Y), True);
         Accept:=(Ind<>-1) and (Ind<>lbOrder.ItemIndex);
      end;
   end
   else begin
      Accept:=False;
   end;
end;

procedure TfmOrderBy.lbOrderDragDrop(Sender, Source: TObject; X, Y: Integer);
var
   Ind: Integer;
   Item: TOrderItem;
   S: string;
begin
   if Source is TDragField then begin
      if FDragField.Control=lbFields then begin
         AddField(lbFields.ItemIndex);
         UpdateButton;
      end
      else if FDragField.Control=lbOrder then begin
         Ind:=lbOrder.ItemAtPos(Point(X, Y), True);
         if (Ind<>-1) and (lbOrder.ItemIndex<>-1) and (Ind<>lbOrder.ItemIndex) then begin
            Item:=FOrderList[lbOrder.ItemIndex].Clone;
            S:=lbOrder.Items[lbOrder.ItemIndex];
            FOrderList.Delete(lbOrder.ItemIndex);
            lbOrder.Items.Delete(lbOrder.ItemIndex);
            lbOrder.Items.InsertObject(Ind, S, Item);
            FOrderList.Insert(Ind, Item);
            lbOrder.ItemIndex:=Ind;
            UpdateButton;
         end;
      end;
   end;
end;

procedure TfmOrderBy.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   Resize:=False;
end;

procedure TfmOrderBy.lbFieldsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
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

procedure TfmOrderBy.lbFieldsDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
   if Source is TDragField then begin
      if FDragField.Control=lbOrder then begin
         DelField(lbOrder.ItemIndex);
         UpdateButton;
      end;
   end;
end;

procedure TfmOrderBy.lbOrderMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   Ind: Integer;
   Item: TOrderItem;
begin
   if (Button=mbLeft) and ((X>=2) and (X<=16)) and (lbOrder.ItemIndex<>-1) then begin
      lbOrder.DragMode:=dmManual;
      Ind:=lbOrder.ItemAtPos(Point(X, Y), True);
      if Ind<>-1 then begin
         Item:=TOrderItem(lbOrder.Items.Objects[Ind]);
         Item.Direction:=not Item.Direction;
         lbOrder.Invalidate;
         lbOrder.Update; 
      end;
   end
   else if (Button=mbLeft) and not FDragStarted then begin
      GetCursorPos(FStartDragPos);
      FDragStarted:=True;
   end;
end;

procedure TfmOrderBy.lbOrderMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FDragStarted:=False;
   //lbOrder.DragMode:=dmAutomatic;
end;

procedure TfmOrderBy.SortAsc(Ind: Integer);
var
   Item: TOrderItem;
begin
   if Ind<>-1 then begin
      Item:=TOrderItem(lbOrder.Items.Objects[lbOrder.ItemIndex]);
      Item.Direction:=True;
      {if Ind<Pred(lbOrder.Items.Count) then begin
         lbOrder.ItemIndex:=Succ(Ind);
      end;}
   end;
end;

procedure TfmOrderBy.SortDesc(Ind: Integer);
var
   Item: TOrderItem;
begin
   if Ind<>-1 then begin
      Item:=TOrderItem(lbOrder.Items.Objects[lbOrder.ItemIndex]);
      Item.Direction:=False;
      {if Ind>0 then begin
         lbOrder.ItemIndex:=Pred(Ind);
      end;}
   end;
end;

procedure TfmOrderBy.acSortAscExecute(Sender: TObject);
var
   Item: TOrderItem;
begin
   if lbOrder.ItemIndex<>-1 then begin
      Item:=TOrderItem(lbOrder.Items.Objects[lbOrder.ItemIndex]);
      if Item.Direction then begin
         SortDesc(lbOrder.ItemIndex);
      end
      else begin
         SortAsc(lbOrder.ItemIndex);
      end;
      lbOrder.Invalidate;
      lbOrder.Update;
      UpdateButton;
   end;
end;

procedure TfmOrderBy.acSortDescExecute(Sender: TObject);
begin
   SortDesc(lbOrder.ItemIndex);
   lbOrder.Invalidate;
   lbOrder.Update;
end;

procedure TfmOrderBy.lbFieldsStartDrag(Sender: TObject; var DragObject: TDragObject);
var
   Ind: Integer;
begin
   if lbFields.ItemIndex<>-1 then begin
      FStartDragPos:=lbFields.ScreenToClient(FStartDragPos);
      Ind:=lbFields.ItemAtPos(FStartDragPos, True);
      if Ind<>-1 then begin
         FDragField:=TDragField.Create(TControl(Sender));
         FDragField.Images:=FFilterInterface.Images.imFields;
         FDragField.ImageIndex:=FFilterInterface.GetImageIndex(TFindFieldItem(FOrderFields.Objects[Integer(lbFields.Items.Objects[Ind])]));
         FDragField.Text:=lbFields.Items[Ind];
         DragObject:=FDragField;
      end;
   end;
end;

procedure TfmOrderBy.lbFieldsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (Button=mbLeft) and not FDragStarted then begin
      GetCursorPos(FStartDragPos);
      FDragStarted:=True;
   end;
end;

procedure TfmOrderBy.lbFieldsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
   P: TPoint;
begin
   if FDragStarted then begin
      GetCursorPos(P);
      if (Abs(P.X-FStartDragPos.X)>3) or (Abs(P.Y-FStartDragPos.Y)>=1) then begin
         FDragStarted:=False;
         lbFields.BeginDrag(False);
      end;
   end;
end;

procedure TfmOrderBy.lbFieldsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FDragStarted:=False;
end;

procedure TfmOrderBy.lbFieldsEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
   FDragField:=nil;
end;

procedure TfmOrderBy.lbOrderStartDrag(Sender: TObject; var DragObject: TDragObject);
var
   Ind: Integer;
begin
   if lbOrder.ItemIndex<>-1 then begin
      FStartDragPos:=lbOrder.ScreenToClient(FStartDragPos);
      Ind:=lbOrder.ItemAtPos(FStartDragPos, True);
      if Ind<>-1 then begin
         FDragField:=TDragField.Create(TControl(Sender));
         FDragField.Images:=FFilterInterface.Images.imFields;
         FDragField.ImageIndex:=FFilterInterface.GetImageIndex(FFields.ByPath(TOrderItem(lbOrder.Items.Objects[Ind]).FieldPath));
         FDragField.Text:=lbOrder.Items[Ind];
         DragObject:=FDragField;
      end;                                
   end;
end;

procedure TfmOrderBy.lbOrderMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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

procedure TfmOrderBy.lbOrderEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
   FDragField:=nil;
end;

end.
