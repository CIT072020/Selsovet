unit fTypeCountMensAdres;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrlsEh;

type
  TfmTypeCountMensAdres = class(TForm)
    rbPresent: TRadioGroup;
    rbPropis: TRadioGroup;
    cbShow: TCheckBox;
    cbListMens: TCheckBox;
    cbNotRegistred: TCheckBox;
    cbNameDom: TCheckBox;
    cbDateP: TDBCheckBoxEh;
    cbNamePunkt: TCheckBox;
    cbRnGor: TCheckBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    cbOwners: TCheckBox;
    cbAddTail: TCheckBox;
    cbAddAdres: TCheckBox;
    procedure rbPresentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateActions; override;
  end;

var
  fmTypeCountMensAdres: TfmTypeCountMensAdres;

implementation

{$R *.DFM}

procedure TfmTypeCountMensAdres.UpdateActions;
begin
  inherited;
  rbPresent.Enabled := cbShow.Checked or cbListMens.Checked;
  rbPropis.Enabled  := (cbShow.Checked or cbListMens.Checked) and (rbPresent.ItemIndex=1);
//  cbOtnosh.Enabled := cbListMens.Checked;
end;

procedure TfmTypeCountMensAdres.rbPresentClick(Sender: TObject);
begin
  if rbPresent.ItemIndex<>1 then rbPropis.ItemIndex:=0;
end;

end.
