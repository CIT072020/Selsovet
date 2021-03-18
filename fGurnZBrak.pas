unit fGurnZBrak;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid,
  TB2Item, TB2Dock, TB2Toolbar, dBase, Menus, ImgList, ComCtrls, ExtCtrls;

type
  TfmGurnZBrak = class(TfmGurnal)
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridColumnsON_M_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsONA_M_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
    procedure QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure Event_RegistVoskr(Sender: TObject);
    procedure Event_RegistTorg(Sender: TObject);
    procedure SetListParEditForm; override;
  end;

var
  fmGurnZBrak: TfmGurnZBrak;

implementation

{$R *.DFM}

{ TfmGurnZBrak }

constructor TfmGurnZBrak.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_ZBrak;
  inherited;
//  TBItemGrantSprav.Visible:=true;
  VisibleItem(TBItemGrantSprav, true);
end;

function TfmGurnZBrak.LoadQuery: Boolean;
var
  c : TColumnEh;
  itDop : TTbItem;
// sep : TTbSeparatorItem;
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
    c := Grid.FieldColumns['ON_M_ADRES1'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsON_M_ADRES;
    end;
  except
  end;
  try
    c := Grid.FieldColumns['ONA_M_ADRES1'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsONA_M_ADRES;
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

  itDop := TTbItem.Create(TBSubSysFlt);
//  itDop.AutoCheck := true;
  itDop.Caption:='Регистрация в воскресенье';
  itDop.OnClick:=Event_RegistVoskr;
  TBSubSysFlt.Add(itDop);

  itDop := TTbItem.Create(TBSubSysFlt);
  itDop.Caption:='Регистрация в торжественной обстановке';
  itDop.OnClick:=Event_RegistTorg;
  TBSubSysFlt.Add(itDop);

  CreateSysFlt_GISUN;

end;

procedure TfmGurnZBrak.QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := false;
  try
    if DayOfWeek(Query.FieldByName('DATEZ').AsDateTime)=1 then Accept := true;
  except
  end;
end;

procedure TfmGurnZBrak.Event_RegistVoskr(Sender: TObject);
begin
  Query.OnFilterRecord := QueryFilterRecord;
  Query.Filter   := '';
  Query.Filtered := true;
//  TBItemClrFlt.Enabled:=true;
  SetClearFilter(true);
end;

procedure TfmGurnZBrak.Event_RegistTorg(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'vosstan=.f. .and. osnov=.t.';
  Query.Filtered := true;
//  TBItemClrFlt.Enabled:=true;
  SetClearFilter(true);
end;


procedure TfmGurnZBrak.GridColumnsON_M_ADRES(Sender: TObject;
          EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := '';
  if dmBase.tbZapisBrak.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
    Params.Text := dmBase.GetAdresAkt3(dmBase.tbZapisBrak,
    'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_B_RN;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',1);
  end;
end;

procedure TfmGurnZBrak.GridColumnsONA_M_ADRES(Sender: TObject;
          EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := '';
  if dmBase.tbZapisBrak.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
    Params.Text := dmBase.GetAdresAkt3(dmBase.tbZapisBrak,
    'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_B_RN;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',1);
  end;
end;

procedure TfmGurnZBrak.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
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

procedure TfmGurnZBrak.GridColumns0GetCellParams(Sender: TObject;
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

procedure TfmGurnZBrak.GridColumns1GetCellParams(Sender: TObject;
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

procedure TfmGurnZBrak.SetListParEditForm;
begin
  inherited;
  FListPar.Add('ENABLE_SKIP=1');
end;

end.
