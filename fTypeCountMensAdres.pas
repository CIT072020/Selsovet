unit fTypeCountMensAdres;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, Mask;

type
  TfmTypeCountMensAdres = class(TForm)
    cbShow: TCheckBox;
    cbListMens: TCheckBox;
    cbNotRegistred: TCheckBox;
    cbNameDom: TCheckBox;
    cbNamePunkt: TCheckBox;
    cbRnGor: TCheckBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    cbOwners: TCheckBox;
    cbAddTail: TCheckBox;
    cbAddAdres: TCheckBox;
    gbVozr: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edVozr1: TDBNumberEditEh;
    edVozr2: TDBNumberEditEh;
    cbNotVozrC1: TCheckBox;
    cbAllMens: TCheckBox;
    cbVozr: TComboBox;
    GroupBox1: TGroupBox;
    cbLicNomer: TCheckBox;
    cbDateR: TCheckBox;
    cbLgot: TCheckBox;
    cbDateP: TCheckBox;
    cbIN: TCheckBox;
    cbPasp: TCheckBox;
    cbPrizn: TCheckBox;
    rbPresent: TRadioGroup;
    rbZareg: TRadioGroup;
    rbPropis: TRadioGroup;
    cbUnionAdres: TCheckBox;
    cbWork: TCheckBox;
    procedure rbPresentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateActions; override;
  end;

//var
//  fmTypeCountMensAdres: TfmTypeCountMensAdres;

implementation

{$R *.DFM}

procedure TfmTypeCountMensAdres.UpdateActions;
begin
  inherited;
  if (cbVozr.ItemIndex<>1) or not cbVozr.Enabled then begin
    Label5.Enabled:=false;
    Label6.Enabled:=false;
    edVozr1.Enabled:=false;
    edVozr2.Enabled:=false;
  end else begin
    Label5.Enabled:=true;
    Label6.Enabled:=true;
    edVozr1.Enabled:=true;
    edVozr2.Enabled:=true;
  end;
end;

procedure TfmTypeCountMensAdres.rbPresentClick(Sender: TObject);
begin
  if rbPresent.ItemIndex<>1 then rbPropis.ItemIndex:=0;
end;

end.
