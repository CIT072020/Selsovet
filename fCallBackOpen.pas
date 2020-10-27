unit fCallBackOpen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TfmCallBackOpen = class(TForm)
    Button1: TButton;
    pb: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FCancel : Boolean;
  end;

var
  fmCallBackOpen: TfmCallBackOpen;

implementation

{$R *.DFM}

procedure TfmCallBackOpen.Button1Click(Sender: TObject);
begin
  FCancel := true;
//
end;

procedure TfmCallBackOpen.FormCreate(Sender: TObject);
begin
  FCancel := false;
end;

end.
