unit fMyNotify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, FuncPr, Math,
  Dialogs, StdCtrls, ExtCtrls;

type

  TMyMemo = class(TMemo)
//  private

  public
    procedure WMPaint(var Msg: TMessage); message WM_Paint;
    procedure WMSetFocus(var Msg: TMessage); message WM_SetFocus;
    procedure WMNCHitTest(var Msg: TMessage); message WM_NCHitTest;
  end;


  TfmMyNotify = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Memo: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MemoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    Memo: TMyMemo;
    procedure AddNotify(sSoob:String; lClear:Boolean; lShow:Boolean);
  end;

  procedure CreateNotifyProg(sCaption: String);
  procedure FreeNotifyProg;
  procedure AddNotifyProg(Win:TWinControl; sSoob: String; lClear, lShow: Boolean; nWidth,nHeight:Integer);
  procedure ShowNotifyProg;

var
  fmMyNotify: TfmMyNotify;
const
  MIN_WIDTH_NOTIFY=500;
  MIN_HEIGHT_NOTIFY=200;

implementation

{$R *.dfm}

procedure CreateNotifyProg(sCaption: String);
begin
  if fmMyNotify=nil
    then fmMyNotify:=TfmMyNotify.Create(nil);
  fmMyNotify.Memo.Clear;
  fmMyNotify.Caption:=sCaption;
end;

procedure FreeNotifyProg;
begin
  if fmMyNotify<>nil
    then FreeAndNil(fmMyNotify)
end;

procedure AddNotifyProg(Win:TWinControl; sSoob: String; lClear, lShow: Boolean; nWidth,nHeight:Integer);
begin
  if fmMyNotify=nil then begin
    if Win=nil
      then ShowMessage(sSoob)
      else ShowMessageCont(sSoob,Win);
  end else begin
    if nWidth>0 then
      fmMyNotify.Width:=Max(fmMyNotify.Width, nWidth);
    if nHeight>0 then
      fmMyNotify.Height:=Max(fmMyNotify.Height, nHeight);
    fmMyNotify.AddNotify(sSoob,lClear,lShow);
    try
//      if Win<>nil then Win.BringToFront;
      fmMyNotify.BringToFront;
    except
    end;
  end;
end;
//-------------------------------------------------------------------
procedure ShowNotifyProg;
begin
  if fmMyNotify<>nil then begin
    fmMyNotify.Show;
    fmMyNotify.BringToFront;
  end;
end;
//-------------------------------------------------------------------
procedure TfmMyNotify.AddNotify(sSoob: String; lClear, lShow: Boolean);
var
  i, fline : Integer;
  sl:TStringList;
begin

  if lClear
    then Memo.Clear;
  if sSoob<>'' then begin
    sl:=TStringList.Create;
    if Pos('#13#10', sSoob)>0
      then StrToStrings(sSoob,sl,'#13#10',false)
      else StrToStrings(sSoob,sl,';',false);
    for i:=0 to sl.Count-1 do begin
      if i=0
        then Memo.Lines.Add('>'+sl.Strings[i])
        else Memo.Lines.Add(sl.Strings[i]);
    end;
  end;
  fline := Memo.Perform(EM_GETFIRSTVISIBLELINE, 0, 0);
//  lline := (Memo.Perform(EM_CHARFROMPOS, 0, MakeLParam(2, Memo.ClientHeight - 2))) shr 16;
// Caption := IntToStr(lline - fline)+'    '+IntToStr(lline)+'-'+IntToStr(fline);
  if fline>0
    then memo.ScrollBars:=ssVertical
    else memo.ScrollBars:=ssNone;
  if lShow
   then Show;
end;
//-------------------------------------------------------------------
procedure TfmMyNotify.FormShow(Sender: TObject);
begin
  Left:=Screen.Width-Width;
  Top:=Screen.Height-Height-40;
  AnimateWindow(Handle,100,AW_CENTER or AW_SLIDE);
end;
//-------------------------------------------------------------------
procedure TfmMyNotify.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  AnimateWindow(handle, 500, AW_BLEND or AW_HIDE);
  Memo.Clear;
end;
//-------------------------------------------------------------------
procedure TfmMyNotify.Timer1Timer(Sender: TObject);
begin
  Top:=Top-1;
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE); //Не перемещать мышкой.
  if Top=Screen.Height-Height-30 then
    Timer1.Enabled:=False;
end;

{
Прошу прощения за коммент в строке:
SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE); //Не перемещать мышкой.
Правильный :
SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE); //Поверх всех окон.
Чтобы окно не перемещалось необходимо установить свойство BorderStyle в bsNone или в bsSingle.
}


procedure TfmMyNotify.MemoDblClick(Sender: TObject);
begin
  Memo.Clear;
  Close;
end;

procedure TfmMyNotify.FormCreate(Sender: TObject);
begin
{
  Memo:=TMyMemo.Create(self);
  Memo.Parent:=self;
  Memo.Align:=alClient;
  Memo.Color:=Memo1.Color;
  Memo.Font:=Memo1.Font;
  Memo.ScrollBars:=ssVertical;
}
end;

{ TMyMemo }

procedure TMyMemo.WMNCHitTest(var Msg: TMessage);
begin
//  HideCaret(Handle);
end;

procedure TMyMemo.WMPaint(var Msg: TMessage);
begin
//  HideCaret(Handle);
end;

procedure TMyMemo.WMSetFocus(var Msg: TMessage);
begin
//  HideCaret(Handle);
end;

initialization
  fmMyNotify:=nil;
finalization
  FreeAndNil(fmMyNotify);

end.
