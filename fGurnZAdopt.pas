unit fGurnZAdopt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid,
  TB2Item, TB2Dock, TB2Toolbar, dBase, ImgList, Menus, ComCtrls, ExtCtrls;

type
  TfmGurnZAdopt = class(TfmGurnal)
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
  end;

var
  fmGurnZAdopt: TfmGurnZAdopt;

implementation

{$R *.DFM}

{ TfmGurnZBrak }

constructor TfmGurnZAdopt.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_ZAdopt;
  inherited;
end;

function TfmGurnZAdopt.LoadQuery: Boolean;
begin
  Result := inherited LoadQuery;
  TBSubSysFlt.Visible:=false;
end;

procedure TfmGurnZAdopt.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  fld : TField;
begin
  fld := Query.FindField('VOSSTAN');
  if (fld <> nil) and not fld.IsNull and fld.AsBoolean then begin
    AFont.Color := Grid.Color1;
  end;
  fld := Query.FindField('DATE_ANUL');
  if (fld <> nil) and not fld.IsNull then begin
    AFont.Color := clRed;
  end;
end;

end.
