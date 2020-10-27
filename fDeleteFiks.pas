unit fDeleteFiks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, Buttons;

type
  TfmDeleteFiks = class(TForm)
    Label1: TLabel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    edYear: TDBComboBoxEh;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDeleteFiks: TfmDeleteFiks;

implementation

{$R *.DFM}

end.
