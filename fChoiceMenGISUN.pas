unit fChoiceMenGISUN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh;

type
  TfmChoiceMenGISUN = class(TForm)
    Grid: TDBGridEh;
    Panel1: TPanel;
    btOk: TBitBtn;
    DataSource: TDataSource;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmChoiceMenGISUN: TfmChoiceMenGISUN;

implementation

{$R *.dfm}

procedure TfmChoiceMenGISUN.FormActivate(Sender: TObject);
begin
   SetWindowPos(Handle,
                          HWND_TOPMOST,
                          Left,
                          Top,
                          Width,
                          Height,
                          SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TfmChoiceMenGISUN.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then begin
    Close;
  end;
end;

end.
