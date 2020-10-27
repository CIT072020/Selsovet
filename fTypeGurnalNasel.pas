unit fTypeGurnalNasel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh;

type
  TfmTypeGurnalNasel = class(TForm)
    cbPrib: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    cbParent: TCheckBox;
    cbMR: TCheckBox;
    cbDeti: TCheckBox;
    gbDeti: TGroupBox;
    Label1: TLabel;
    edVozr1: TDBNumberEditEh;
    Label2: TLabel;
    edVozr2: TDBNumberEditEh;
    cbDetiOtnosh: TCheckBox;
    edDetiGod: TComboBox;
    cbOnlyMama: TCheckBox;
    Label3: TLabel;
    edKolvo111: TDBNumberEditEh;
    Label4: TLabel;
    edKolvo222: TDBNumberEditEh;
    cbUnionFIO: TCheckBox;
    cbUnionAdres: TCheckBox;
    cbUnionPasp: TCheckBox;
    cbUL: TCheckBox;
    cbParentDATER: TCheckBox;
    cbParentWORK: TCheckBox;
    cbParentPASP: TCheckBox;
    cbParentIN: TCheckBox;
    procedure cbDetiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbParentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateActions; override;
  end;


implementation

{$R *.DFM}

procedure TfmTypeGurnalNasel.UpdateActions;
begin
  inherited;
end;

procedure TfmTypeGurnalNasel.cbDetiClick(Sender: TObject);
begin
  gbDeti.Enabled:=cbDeti.Checked;
  Label1.Enabled:=cbDeti.Checked;
  Label2.Enabled:=cbDeti.Checked;
  Label3.Enabled:=cbDeti.Checked;
//  edKolvo.Enabled:=cbDeti.Checked;
  edVozr1.Enabled:=cbDeti.Checked;
  edVozr2.Enabled:=cbDeti.Checked;
  cbDetiOtnosh.Enabled:=cbDeti.Checked;
  edDetiGod.Enabled:=cbDeti.Checked;
  cbOnlyMama.Enabled:=cbDeti.Checked;
end;

procedure TfmTypeGurnalNasel.cbParentClick(Sender: TObject);
begin
  cbParentDATER.Enabled:=cbParent.Checked;
  cbParentWORK.Enabled:=cbParent.Checked;
  cbParentPASP.Enabled:=cbParent.Checked;
  cbParentIN.Enabled:=cbParent.Checked;
end;

procedure TfmTypeGurnalNasel.FormCreate(Sender: TObject);
begin
  cbDetiClick(nil);
  cbParentClick(nil);
end;


end.
