unit fFieldsFind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB2Dock, TB2Toolbar, TB2Item, Db, Grids, DBGridEh, SasaDBGrid, StdCtrls,
  Mask, DBCtrlsEh, ExtCtrls, ComCtrls;

type
  TfmFieldsFind = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItemSave: TTBItem;
    dsFields: TDataSource;
    pc: TPageControl;
    tsFields: TTabSheet;
    tsRel: TTabSheet;
    Panel1: TPanel;
    GridFields: TSasaDBGrid;
    dsRel: TDataSource;
    edBase: TDBComboBoxEh;
    Label1: TLabel;
    SasaDBGrid2: TSasaDBGrid;
    procedure TBItemSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edBaseChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dsFieldsDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFieldsFind: TfmFieldsFind;

implementation

uses fMain, dBase;

{$R *.DFM}

procedure TfmFieldsFind.TBItemSaveClick(Sender: TObject);
begin
  fmMain.SaveTable_FindFields;
end;

procedure TfmFieldsFind.FormCreate(Sender: TObject);
begin
  GridFields.DataSource.Dataset := fmMain.GetTable_FindFields;
//  GridFields.DataSource.Dataset.OnNewRecord
  edBase.Items.Add('Лицевые счета');
  edBase.KeyItems.Add(IntToStr(dmBase.TypeObj_Lich ));
  edBase.Items.Add('Люди');
  edBase.KeyItems.Add(IntToStr(dmBase.TypeObj_Nasel ));
  edBase.Items.Add('Дома');
  edBase.KeyItems.Add(IntToStr(dmBase.TypeObj_Adres ));
  edBase.ItemIndex := 0;
end;

procedure TfmFieldsFind.edBaseChange(Sender: TObject);
begin
  if edBase.ItemIndex>-1 then begin
    fmMain.GetTable_FindFields.SetRange([edBase.KeyItems[edBase.ItemIndex]] ,[edBase.KeyItems[edBase.ItemIndex]]);
    fmMain.GetTable_FindFields.ApplyRange;
  end else begin
    edBase.ItemIndex:=0;
  end;
end;

procedure TfmFieldsFind.FormDestroy(Sender: TObject);
begin
  fmMain.GetTable_FindFields.CancelRange;
end;

procedure TfmFieldsFind.dsFieldsDataChange(Sender: TObject; Field: TField);
begin
  if (Field <> nil) and dsFields.DataSet.FieldByName('TypeObj').IsNull then begin
    dsFields.DataSet.FieldByName('TypeObj').AsString := edBase.KeyItems[edBase.ItemIndex];
  end;
end;

end.
