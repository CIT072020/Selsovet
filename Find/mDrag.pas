unit mDrag; // [02.11.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ImgList, Buttons, ComCtrls, ToolWin, ExtCtrls;

type
   TDragField=class(TDragControlObject)
   private
      FImage: TDragImageList;
      FImages: TImageList;
      FImageIndex: Integer;
      FText: string;
      FData: TObject;
   protected
      function GetDragImages: TDragImageList; override;
      function GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor; override;
   public
      constructor Create(AControl: TControl); override;
      destructor Destroy; override;
      procedure HideDragImage; override;
      procedure ShowDragImage; override;
   public
      property Text: string read FText write FText;
      property Data: TObject read FData write FData;
      property Images: TImageList read FImages write FImages;
      property ImageIndex: Integer read FImageIndex write FImageIndex;
   end;

const
   II_Asc=4;
   II_Desc=5;
   //
   Drag_cursor=111;
   Drag_plus_cursor=112;

implementation

{$R *.RES}

{ TDragField }

constructor TDragField.Create(AControl: TControl);
begin
   inherited Create(AControl);
   FImage:=TDragImageList.Create(nil);
   FText:='';
   FImages:=nil;
end;

destructor TDragField.Destroy;
begin
   FImage.Free;
   inherited;
end;

function TDragField.GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor;
begin
   //if Accepted then begin
   //   Result:=Drag_plus_cursor;
   //end
   //else begin
      if Screen.Cursors[Drag_cursor]=Screen.Cursors[crDefault] then begin
         Result:=crDrag;
      end
      else begin
         Result:=Drag_cursor;
      end;
   //end;
end;

function TDragField.GetDragImages: TDragImageList;
var
   bmp: TBitmap;
   R: TRect;
   W: Integer;
   H: Integer;
begin
   Result:=FImage;
   bmp:=TBitmap.Create;
   try
      FImage.Clear;
      W:=FImages.Width;
      H:=FImages.Height;
      bmp.Width:=W;
      bmp.Height:=H;
      H:=bmp.Canvas.TextHeight(FText);
      bmp.Width:=W+4+bmp.Canvas.TextWidth(FText);
      if bmp.Height<H then begin
         bmp.Height:=H;
      end;
      bmp.Canvas.Brush.Color:=clWindow;
      bmp.Canvas.FillRect(Bounds(0, 0, bmp.Width, bmp.Height));
      FImages.Draw(bmp.Canvas, 0, 0, FImageIndex);
      R:=Bounds(W+4, 0, bmp.Width-W-4, bmp.Height);
      bmp.Canvas.Font.Color:=clWindowText;
      DrawText(bmp.Canvas.Handle, PChar(FText), Length(FText), R, DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
      FImage.Width:=bmp.Width;
      FImage.Height:=bmp.Height;
      FImage.AddMasked(bmp, clWindow);
      FImage.SetDragImage(0, W+1, W-(W div 2));
   finally
      bmp.Free;
   end;
end;

procedure TDragField.HideDragImage;
begin
   FImage.HideDragImage;
end;

procedure TDragField.ShowDragImage;
begin
   FImage.ShowDragImage;
end;

initialization

   Screen.Cursors[Drag_cursor]:=LoadCursor(HInstance, 'DRAG_ARROW');
   //Screen.Cursors[Drag_plus_cursor]:=LoadCursor(HInstance, 'DRAG_ARROW_PLUS');
   
end.
