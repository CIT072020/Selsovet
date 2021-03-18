unit fWait; // wait form
// данная форма предназначена для показа во время выполнения длительных операций
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, Math;

type
   TfmWait=class(TForm)
      paButton: TPanel;
      btCancel: TButton;
      btMinimize: TButton;
      paText: TPanel;
      laText: TLabel;
      procedure btCancelClick(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure btMinimizeClick(Sender: TObject);
   private
      FIsStart: Boolean;
      FCancel: Boolean;
      FStartTime: LongWord;
      FMsg: string;
      FButton: Boolean;
   private
      procedure SetLabel(Msg: string);
      procedure UpdateLabel(Msg: string);
      function GetCancel: Boolean;
      procedure Calc;
      procedure SetButton(ShowButton: Boolean);
   public
      procedure Start;
      procedure Stop;
      procedure SetMsg(Msg: string);
      procedure Upd;
      procedure UpdateMsg(Msg: string);
      procedure UpdateMsg2(Msg: string);
   public
      property Cancel: Boolean read GetCancel;
   end;

function ShowWait(Caption, Msg: string; ShowButton: Boolean): TfmWait;

implementation

{$R *.DFM}

function ShowWait(Caption, Msg: string; ShowButton: Boolean): TfmWait;
begin
   Result:=TfmWait.Create(nil);
   Result.SetButton(ShowButton);
   Result.Caption:=Caption;
   Result.SetMsg(Msg);
   Result.Start;
end;

procedure TfmWait.btCancelClick(Sender: TObject);
begin
   FCancel:=True;
   Close;
end;

function TfmWait.GetCancel: Boolean;
begin
   //Application.ProcessMessages;
   Upd;
   Result:=FCancel;
end;

procedure TfmWait.Start;
var
   I: Integer;
begin
   FIsStart:=True;
   FCancel:=False;
   Show;
   BringToFront;
   //Application.ProcessMessages;
   if FButton then begin
     for I:=Pred(Screen.FormCount) downto 0 do begin
        if (Screen.Forms[I]<>Self) and (Screen.Forms[I].Visible) then begin
           Screen.Forms[I].Enabled:=False;
        end;
     end;
   end;
   Upd;
   FStartTime:=GetTickCount;
end;

procedure TfmWait.Stop;
var
   I: Integer;
   //--Msg: TMsg;
begin
   FIsStart:=False;
   {--while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
   end;}
   Hide;
   if FButton then begin
     for I:=Pred(Screen.FormCount) downto 0 do begin
        if (Screen.Forms[I]<>Self) and (Screen.Forms[I].Visible) then begin
           Screen.Forms[I].Enabled:=True;
        end;
     end;
   end;
   //--Application.ProcessMessages;
   Upd;
end;

procedure TfmWait.FormDestroy(Sender: TObject);
begin
   Stop;
end;

procedure TfmWait.UpdateMsg(Msg: string);
begin
   UpdateLabel(FMsg+Msg);
end;

procedure TfmWait.SetMsg(Msg: string);
begin
   FMsg:=Msg;
   SetLabel(Msg);
end;

procedure TfmWait.UpdateMsg2(Msg: string);
begin
   UpdateLabel(Msg);
end;

procedure TfmWait.FormCreate(Sender: TObject);
begin
   FMsg:='';
   FIsStart:=False;
   paText.DoubleBuffered:=True; {#ToDo3 Протестировать по скорости}
end;

procedure TfmWait.SetLabel(Msg: string);
begin
   laText.Caption:=Msg;
   Calc;
end;

procedure TfmWait.UpdateLabel(Msg: string);
begin
   SetLabel(Msg);
   BringToFront;
   //Application.ProcessMessages;
   Upd;
end;

procedure TfmWait.Calc;
var
   R: TRect;
   sz: TSize;
   S: string;
   W: Integer;
   NewWidth: Integer;
   NewHeight: Integer;
   Msg: string;
begin
   S:=Caption;             
   Msg:=laText.Caption;
   R:=Bounds(0, 0, 150, laText.Height);
   DrawText(Canvas.Handle, PChar(Msg), Length(Msg), R, DT_CALCRECT or DT_CENTER or{ DT_WORDBREAK or }DT_VCENTER);
   GetTextExtentPoint32(Canvas.Handle, PChar(S), Length(S), sz);
   W:=Max(R.Right, Max(sz.cx, 150));
   NewWidth:=W+paText.Width-laText.Width;
   NewHeight:=R.Bottom+Integer(FButton)*paButton.Height+paText.Height-laText.Height;
   if not FIsStart or (ClientWidth<NewWidth) or (ClientHeight<NewHeight) then begin
      if NewWidth>ClientWidth then begin
         ClientWidth:=NewWidth;
      end;
      ClientHeight:=NewHeight;
      //--if FButton then begin
      //--   btCancel.Left:=(ClientWidth-btCancel.Width) div 2;
      //--end;
   end;
end;

procedure TfmWait.SetButton(ShowButton: Boolean);
begin
   FButton:=ShowButton;
   if not ShowButton then begin
      paButton.Visible:=False;
      ClientHeight:=ClientHeight-paButton.Height;
   end;
end;

procedure TfmWait.Upd;
//var
//   Msg: TMsg;
begin
   Application.ProcessMessages;
   //PeekMessage(Msg, 0, WM_SYSCOMMAND, WM_SYSCOMMAND, PM_REMOVE);
   {if PeekMessage(Msg, 0, WM_PAINT, WM_PAINT, PM_REMOVE) then begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
   end;
   if PeekMessage(Msg, Handle, WM_MOUSEFIRST, WM_MOUSELAST, PM_REMOVE) then begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
   end;}
end;

procedure TfmWait.btMinimizeClick(Sender: TObject);
begin
   Application.Minimize;
   Upd;
end;

end.
