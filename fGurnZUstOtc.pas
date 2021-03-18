unit fGurnZUstOtc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid,
  TB2Item, TB2Dock, TB2Toolbar, ImgList, Menus, ComCtrls, ExtCtrls;

type
  TfmGurnZUstOtc = class(TfmGurnal)
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
  end;

var
  fmGurnZUstOtc: TfmGurnZUstOtc;

implementation

uses dBase;

{$R *.DFM}

{ TfmGurnZUstOtc }

constructor TfmGurnZUstOtc.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_ZUstOtc;
  inherited;
  VisibleItems([TBItemGrantSprav], false);
end;

function TfmGurnZUstOtc.LoadQuery: Boolean;
var
  c : TColumnEh;
//  itDop : TTbItem;
begin
  Result := inherited LoadQuery;
  try
    c := Grid.FieldColumns['ON_DOKUMENT'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsDOKUMENT;
    end;
  except
  end;
  try
    c := Grid.FieldColumns['ONA_DOKUMENT'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsDOKUMENT;
    end;
  except
  end;
  CreateSysFlt_GISUN;
end;

procedure TfmGurnZUstOtc.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  fld : TField;
begin
  fld := Query.FindField('DATE_ANUL');
  if (fld <> nil) and not fld.IsNull then begin
    AFont.Color := clRed;
  end;
end;

end.
