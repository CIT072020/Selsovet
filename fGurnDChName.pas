unit fGurnDChName;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uTypes,
  TB2Item, TB2Dock, TB2Toolbar, dBase, ImgList, Menus, ComCtrls, ExtCtrls;

type
  TfmGurnDChName = class(TfmGurnal)
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
  end;

var
  fmGurnDChName: TfmGurnDChName;

implementation

{$R *.DFM}

{ fmGurnDChName }

constructor TfmGurnDChName.Create(Owner: TComponent);
begin
  TypeEditObj := _TypeObj_DChName;
  inherited;
end;

function TfmGurnDChName.LoadQuery: Boolean;
var
  c : TColumnEh;
begin
  Result := inherited LoadQuery;
  try
    c := Grid.FieldColumns['DOKUMENT'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsDOKUMENT;
    end;
  except
  end;
  CreateSysFlt_GISUN;
end;

procedure TfmGurnDChName.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
//var
//  fld : TField;
begin
{
  fld := Query.FindField('VOSSTAN');
  if (fld <> nil) and not fld.IsNull and fld.AsBoolean then begin
    AFont.Color := Grid.Color1;
  end;
  fld := Query.FindField('DATE_ANUL');
  if (fld <> nil) and not fld.IsNull then begin
    AFont.Color := clRed;
  end;
}  
end;

end.
