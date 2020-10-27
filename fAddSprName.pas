unit fAddSprName;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh;

type
  TfmAddSprName = class(TForm)
    edNew: TDBEditEh;
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddSprName: TfmAddSprName;

implementation

{$R *.DFM}

end.
