unit fChoiceAktFromNomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TB2Item, TB2Dock, TB2Toolbar, ImgList;

type
  TfmChoiceAktFromNomer = class(TForm)
    ImageList1: TImageList;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    LoadButton: TTBItem;
    FindButton: TTBItem;
    InfoButton: TTBItem;
    ExitButton: TTBItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmChoiceAktFromNomer: TfmChoiceAktFromNomer;

implementation

{$R *.dfm}

end.
