unit fTypeCountMens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh;

type
  TfmTypeCountMens = class(TForm)
    rbPresent: TRadioGroup;
    rbPropis: TRadioGroup;
    cbShow: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    cbListMens: TCheckBox;
    rbZareg: TRadioGroup;
    gbVozr: TGroupBox;
    Label1: TLabel;
    edVozr1: TDBNumberEditEh;
    Label2: TLabel;
    edVozr2: TDBNumberEditEh;
    cbNotVozr1: TCheckBox;
    cbOwners: TCheckBox;
    cbUnionFIO: TCheckBox;
    GroupBox1: TGroupBox;
    cbOtnosh: TCheckBox;
    cbDateR: TCheckBox;
    cbLgot: TCheckBox;
    cbAddFirst: TCheckBox;
    cbDateP: TCheckBox;
    cbIN: TCheckBox;
    cbUnionAdres: TCheckBox;
    cbPasp: TCheckBox;
    cbAllMens: TCheckBox;
    cbVozr: TComboBox;
    cbPrizn: TCheckBox;
    cbWork: TCheckBox;
    procedure rbPresentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateActions; override;
  end;

//var
//  fmTypeCountMens: TfmTypeCountMens;

implementation

{$R *.DFM}

procedure TfmTypeCountMens.UpdateActions;
begin
  inherited;
  if (cbVozr.ItemIndex<>1) or not cbVozr.Enabled then begin
    Label1.Enabled:=false;
    Label2.Enabled:=false;
    edVozr1.Enabled:=false;
    edVozr2.Enabled:=false;
  end else begin
    Label1.Enabled:=true;
    Label2.Enabled:=true;
    edVozr1.Enabled:=true;
    edVozr2.Enabled:=true;
  end;
  cbAllMens.Enabled:=cbVozr.ItemIndex<>0;
end;

procedure TfmTypeCountMens.rbPresentClick(Sender: TObject);
begin
  if rbPresent.ItemIndex<>1 then rbPropis.ItemIndex:=0;
end;

end.
