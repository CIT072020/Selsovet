unit fOperFind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB2Dock, TB2Toolbar, fMain, Grids, DBGridEh, SasaDBGrid, Db, TB2Item, uFilter;

type
  TfmOperFind = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItemSave: TTBItem;
    DataSource: TDataSource;
    SasaDBGrid1: TSasaDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure TBItemSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOperFind: TfmOperFind;

implementation

{$R *.DFM}

procedure TfmOperFind.FormCreate(Sender: TObject);
begin
  DataSource.DataSet := fmMain.GetTable_FindOper;
end;

procedure TfmOperFind.TBItemSaveClick(Sender: TObject);
begin
  fmMain.SaveTable_FindOper;
  CreateOpList( fmMain.FltOpList);
end;

end.
