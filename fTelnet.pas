unit fTelnet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, db, FuncPr, DBCtrlsEh, Mask,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdTelnet;

type
  TfmTelnet = class(TForm)
    Panel1: TPanel;
    btCansel: TBitBtn;
    btSave: TBitBtn;
    edMemo: TMemo;
    IdTelnet: TIdTelnet;
    Label1: TLabel;
    Label2: TLabel;
    edHost: TDBEditEh;
    edPort: TDBNumberEditEh;
    Button1: TButton;
    Button2: TButton;
    procedure btSaveClick(Sender: TObject);
    procedure btCanselClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure edMemoKeyPress(Sender: TObject; var Key: Char);
    procedure IdTelnetConnected(Sender: TObject);
    procedure IdTelnetDataAvailable(Sender: TIdTelnet;
      const Buffer: String);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure EditTelnet(sHost:String; nPort:Integer);


implementation


{$R *.DFM}

procedure EditTelnet(sHost:String; nPort:Integer);
var
  arr:TArrStrings;
  f: TfmTelnet;
begin
  f:=TfmTelnet.Create(nil);
  f.edHost.Text:=sHost;
  f.edPort.Value:=nPort;
  {
  if nWidth>0 then begin
    TfmTelnet.Width:=nWidth;
  end;
  if HostControl<>nil then begin
    UstDropDownForm(TfmTelnet,HostControl);
  end;
  }
  f.ShowModal;
  FreeAndNil(f);
end;

procedure TfmTelnet.btSaveClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmTelnet.btCanselClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmTelnet.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  case Key of
   VK_F2    : Modalresult:=mrOk;
   VK_ESCAPE: Modalresult:=mrCancel;
  end;
end;

procedure TfmTelnet.Button1Click(Sender: TObject);
begin
  IdTelnet.IOHandler:=nil;
  IdTelnet.Terminal:='vt100'; //TerminalCB.Text;
  idTelnet.Host:=edHost.Text;
  idTelnet.Port:=edPort.Value;
  IdTelnet.Connect;
end;

procedure TfmTelnet.Button2Click(Sender: TObject);
begin
  IdTelnet.Disconnect;
end;

procedure TfmTelnet.edMemoKeyPress(Sender: TObject; var Key: Char);
begin
  if IdTelnet.Connected then begin
    IdTelnet.SendCh(Key);
  end;
end;

procedure TfmTelnet.IdTelnetConnected(Sender: TObject);
begin
  edMemo.Lines.Add('Клиент подключен.');
  edMemo.Lines.Add('');
end;

const
  CR = #13;
  LF = #10;

procedure TfmTelnet.IdTelnetDataAvailable(Sender: TIdTelnet;  const Buffer: String);
var
  Start, Stop: Integer;
begin
  edMemo.Lines.Add('');
  Start := 1;
  Stop := Pos(CR, Buffer);
  if Stop = 0 then
    Stop := Length(Buffer) + 1;
  while Start <= Length(Buffer) do begin
    edMemo.Lines.Strings[edMemo.Lines.Count - 1] :=  edMemo.Lines.Strings[edMemo.Lines.Count - 1] +
         Copy(Buffer, Start, Stop - Start);
    if Buffer[Stop] = CR then begin
      edMemo.Lines.Add('');
    end;
    Start := Stop + 1;
    if Start > Length(Buffer) then
      Break;
    if Buffer[Start] = LF then
      Start := Start + 1;
    Stop := Start;
    while (Buffer[Stop] <> CR) and (Stop <= Length(Buffer)) do
      Stop := Stop + 1;
  end;
end;

procedure TfmTelnet.FormDestroy(Sender: TObject);
begin
  if IdTelnet.Connected
    then IdTelnet.Disconnect;
end;

end.
