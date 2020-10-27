unit fMensDvig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dBase,
  Dialogs, StdCtrls, DBCtrlsEh, Mask, DBLookupEh, DB;

type
  TfmMenDvig = class(TForm)
    dsRN: TDataSource;
    dsObl: TDataSource;
    dsStran: TDataSource;
    dsTypeGorod: TDataSource;
    dsMigr: TDataSource;
    gbOtkudaPrib: TGroupBox;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    edOP_B_GOROD: TDBLookupComboboxEh;
    edOP_GOROD: TDBEditEh;
    edOP_RAION: TDBLookupComboboxEh;
    edOP_OBL: TDBLookupComboboxEh;
    cbOP_B_OBL: TDBCheckBoxEh;
    cbOP_B_RESP: TDBCheckBoxEh;
    edOP_GOSUD: TDBLookupComboboxEh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMenDvig: TfmMenDvig;

implementation

{$R *.dfm}

end.
