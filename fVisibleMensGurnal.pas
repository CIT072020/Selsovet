unit fVisibleMensGurnal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleDialog, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, Mask, RXCtrls;

type
  TfmVisibleMensGurnal = class(TfmSimpleDialog)
    cbCanDelete: TDBCheckBoxEh;
    cbTmpUbit: TDBCheckBoxEh;
    edType: TComboBox;
    cbGreenNotMy: TDBCheckBoxEh;
    cbGreenMy: TDBCheckBoxEh;
    cbZaregSrok: TDBCheckBoxEh;
    RxLabel1: TRxLabel;
    cbOldCopyMen: TDBCheckBoxEh;
    Image1: TImage;
    cbRiap_: TDBCheckBoxEh;
    procedure RxLabel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}


procedure TfmVisibleMensGurnal.RxLabel1Click(Sender: TObject);
begin
  cbGreenNotMy.Checked:=not cbGreenNotMy.Checked;
end;

end.
