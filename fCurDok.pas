unit fCurDok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FR_DSet, FR_DBSet;

type
  TfmCurDok = class(TForm)
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    frDBDataSet3: TfrDBDataSet;
    frDBDataSet4: TfrDBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCurDok: TfmCurDok;

implementation

{$R *.dfm}

end.
