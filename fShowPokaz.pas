unit fShowPokaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfmShowPokaz = class(TForm)
    ListPokaz: TListView;
    Panel1: TPanel;
    btOk: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmShowPokaz: TfmShowPokaz;

implementation

{$R *.dfm}

end.
