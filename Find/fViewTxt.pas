unit fViewTxt; // view text form
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls;

type
   TfmViewTxt = class(TForm)
      me: TMemo;
      procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
   protected
      procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
   public
      function ViewTextFile(FileName: string): Integer;
      function ViewText(Lines: TStringList): Integer;
   end;

function ViewTextFile(FileName: string): Integer;
function ViewText(Lines: TStringList): Integer;

implementation
{$R *.DFM}

function ViewText(Lines: TStringList): Integer;
begin
   with TfmViewTxt.Create(nil) do begin
      try
         Result:=ViewText(Lines);
      finally
         Free;
      end;
   end;
end;

function ViewTextFile(FileName: string): Integer;
begin
   with TfmViewTxt.Create(nil) do begin
      try
         Result:=ViewTextFile(FileName);
      finally
         Free;
      end;
   end;
end;

{ TfmViewTxt }

function TfmViewTxt.ViewTextFile(FileName: string): Integer;
begin
   Caption:=Format(Caption, [FileName]);
   if FileExists(FileName) then begin
      me.Lines.LoadFromFile(FileName);
      Result:=ShowModal;
   end
   else begin
      Result:=mrNone;
   end;
end;

procedure TfmViewTxt.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_ESCAPE: begin
         Key:=0;
         ModalResult:=mrCancel;
      end;
   end;
end;

function TfmViewTxt.ViewText(Lines: TStringList): Integer;
begin
   Caption:=Format(Caption, ['']);
   me.Lines.Assign(Lines);
   Result:=ShowModal;
end;

procedure TfmViewTxt.WMSysCommand(var Msg: TWMSysCommand);
begin
   if (Msg.CmdType and $FFF0)=SC_MINIMIZE then begin
      Application.Minimize;
   end
   else begin
      inherited;
   end;
end;

end.
