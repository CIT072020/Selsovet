unit fTypeMensOchered;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfmTypeMensOchered = class(TForm)
    Button1: TButton;
    Button2: TButton;
    cbListMens: TCheckBox;
    cbOtnosh: TCheckBox;
    cbDateR: TCheckBox;           
    cbPasp: TCheckBox;
    cbAddBTI: TCheckBox;
    cbLgot: TCheckBox;
    cbSobstv: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateActions; override;
  end;

var
  fmTypeMensOchered: TfmTypeMensOchered;

implementation

{$R *.DFM}

procedure TfmTypeMensOchered.UpdateActions;
begin
  inherited;
  cbOtnosh.Enabled  := cbListMens.Checked;
  cbDateR.Enabled   := cbListMens.Checked;
  cbPasp.Enabled    := cbListMens.Checked;
  cbAddBTI.Enabled  := cbListMens.Checked;
end;

end.
