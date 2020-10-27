unit fArxivZAGS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, adsdata, adsfunc, adstable, StdCtrls, Mask, DBCtrlsEh, TB2ToolWindow,
  TB2Dock, TB2Toolbar, Grids, DBGridEh, SasaDBGrid;

type
  TfmArxivZAGS = class(TForm)
    Grid: TSasaDBGrid;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBToolWindow1: TTBToolWindow;
    edType: TDBComboBoxEh;
    tbAlfavit: TAdsTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmArxivZAGS: TfmArxivZAGS;

implementation

{$R *.DFM}

end.
