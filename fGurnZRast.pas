unit fGurnZRast;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid,
  TB2Item, TB2Dock, TB2Toolbar, dBase, Menus, ImgList, ComCtrls, ExtCtrls;

type
  TfmGurnZRast = class(TfmGurnal)
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridColumns0GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    procedure GridColumns1GetCellParams(Sender: TObject;
          EditMode: Boolean; Params: TColCellParamsEh);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
    procedure SetListParEditForm; override;
  end;

var
  fmGurnZRast: TfmGurnZRast;

implementation

{$R *.DFM}

{ TfmGurnZBrak }

constructor TfmGurnZRast.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_ZRast;
  inherited;
end;

function TfmGurnZRast.LoadQuery: Boolean;
var
  c : TColumnEh;
begin
  Result := inherited LoadQuery;
  try
    c := Grid.FieldColumns['ON_DATER'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumns0GetCellParams;
    end;
  except
  end;
  try
    c := Grid.FieldColumns['ONA_DATER'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumns1GetCellParams;
    end;
  except
  end;
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

procedure TfmGurnZRast.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  fld : TField;
begin
//  fld := Query.FindField('VOSSTAN');
//  if (fld <> nil) and not fld.IsNull and fld.AsBoolean then begin
//    AFont.Color := Grid.Color1;
//  end;
  fld:=Query.FindField('DATE_ANUL');
  if (fld <> nil) and not fld.IsNull then begin
    AFont.Color := clRed;
  end;
end;

procedure TfmGurnZRast.GridColumns0GetCellParams(Sender: TObject;
          EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('ON_DATER').IsNull and not Query.FieldByName('ON_VOZR').IsNull then begin
    Params.Text := 'возр.'+Query.FieldByName('ON_VOZR').AsString;
  end else begin
    if not Query.FieldByName('ON_ONLYGOD').IsNull and
           Query.FieldByName('ON_ONLYGOD').AsBoolean then begin
      Params.Text := FormatDateTime('YYYY',Query.FieldByName('ON_DATER').AsDateTime)
    end else begin

    end;
  end;
end;

procedure TfmGurnZRast.GridColumns1GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('ONA_DATER').IsNull and not Query.FieldByName('ONA_VOZR').IsNull then begin
    Params.Text := 'возр.'+Query.FieldByName('ONA_VOZR').AsString;
  end else begin
    if not Query.FieldByName('ONA_ONLYGOD').IsNull and
           Query.FieldByName('ONA_ONLYGOD').AsBoolean then begin
      Params.Text := FormatDateTime('YYYY',Query.FieldByName('ONA_DATER').AsDateTime)
    end else begin

    end;
  end;
end;

procedure TfmGurnZRast.SetListParEditForm;
begin
  inherited;
  FListPar.Add('ENABLE_SKIP=1');
end;

end.
