unit fGurnTalonUbit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid,
  TB2Item, TB2Dock, TB2Toolbar, FR_PTabl, ImgList, Menus, ComCtrls,
  ExtCtrls;

type
  TfmGurnTalonUbit = class(TfmGurnal)
  private
    { Private declarations }
  public
    procedure CheckPropertyGridColumns; override;
    procedure GridColumnsGetKuda(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetOtkuda(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsDeti(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
  end;

var
  fmGurnTalonUbit: TfmGurnTalonUbit;

implementation

uses dBase;

{$R *.DFM}

{ TfmGurnTalonPrib }

constructor TfmGurnTalonUbit.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_TalonUbit;
  inherited;
end;

function TfmGurnTalonUbit.LoadQuery: Boolean;
begin
  Result := inherited LoadQuery;
end;
//-------------------------------------------------------------
procedure TfmGurnTalonUbit.CheckPropertyGridColumns;
var
  c : TColumnEh;
begin
  try
    c := Grid.FieldColumns['KUDA'];
    if c<>nil then c.OnGetCellParams := GridColumnsGetKuda;
  except
  end;
  try
    c := Grid.FieldColumns['OTKUDA'];
    if c<>nil then c.OnGetCellParams := GridColumnsGetOtkuda;
  except
  end;
  try
    c := Grid.FieldColumns['MESTOR'];
    if c<>nil then c.OnGetCellParams := GridColumnsGetMestoR;
  except
  end;
  try
    c := Grid.FieldColumns['TALON_DOK'];
    if c<>nil then c.OnGetCellParams := GridColumnsDOKUMENT;
  except
  end;
  try
    c := Grid.FieldColumns['SPIS_DETI'];
    if c<>nil then c.OnGetCellParams := GridColumnsDeti;
  except
  end;
  inherited;
end;

procedure TfmGurnTalonUbit.GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'GOSUD_R,FName;OBL_R,B_OBL_R;RAION_R;GOROD_R,GOROD_R_B;',1);
end;

procedure TfmGurnTalonUbit.GridColumnsGetKuda(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('SMERT').IsNull or (Query.FieldByName('SMERT').AsBoolean=false) then begin
    Params.Text := dmBase.GetAdresAkt3(Query,'GOSUD_V,FName;OBL_V,B_OBL_V;RAION_V;GOROD_V,GOROD_V_B;',1);
  end else begin
    Params.Text := Query.FieldByName('AKT_SMERT').AsString;
  end;
end;

procedure TfmGurnTalonUbit.GridColumnsGetOtkuda(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'GOSUD_O,FName;OBL_O,B_OBL_O;RAION_O;GOROD_O,GOROD_O_B;',1);
//  Params.Text := '';
//  if dmBase.tbTalonPrib.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
//    Params.Text := dmBase.GetAdresAkt3(dmBase.tbTalonPrib,'GOSUD_O,FName;OBL_O,B_OBL_O;RAION_O;GOROD_O,GOROD_O_B;',1);
//  end;
end;

procedure TfmGurnTalonUbit.GridColumnsDeti(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:='';
  with dmBase.tbTalonUbitDeti do begin
    try
      SetRange([Query.FieldByName('ID').AsInteger],[Query.FieldByName('ID').AsInteger]);
      while not Eof do begin
        Params.Text:=Params.Text+FieldByName('FAMILIA').AsString+' '+FieldByName('NAME').AsString+' '+
                     FieldByName('OTCH').AsString+#13#10;
        Next;
      end;
    finally
      CancelRange;
    end;
    if Params.Text<>'' then begin
      Params.Text:=Copy(Params.Text,1,Length(Params.Text)-2);
    end;
  end;
end;

end.
