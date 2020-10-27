unit fCreateFiks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrlsEh, MetaTask;

type
  TfmCreateFiks = class(TForm)
    edYear: TDBNumberEditEh;
    Label1: TLabel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    ckCurSost: TDBCheckBoxEh;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
  end;

var
  fmCreateFiks: TfmCreateFiks;

implementation

{$R *.DFM}

{ TfmCreateFiks }

constructor TfmCreateFiks.Create(Owner: TComponent);
begin
  inherited;
  ActiveControl := edYear;
end;

end.
