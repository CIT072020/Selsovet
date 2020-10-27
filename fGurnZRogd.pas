unit fGurnZRogd;

{$I Task.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uProject, FuncPr, dbFunc,
  TB2Item, TB2Dock, TB2Toolbar, dBase, Menus, ImgList, ComCtrls,
  ExtCtrls;

type
  TfmGurnZRogd = class(TfmGurnal)
    TBItemZader: TTBItem;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridColumns0GetCellParams(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
    procedure GridColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumns2GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TBItemZaderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridColumnsON_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsONA_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
    procedure Event_RegistTorg(Sender: TObject);
    procedure Event_ManyChildren(Sender: TObject);
    procedure SetListParEditForm; override;
    function IsRegisterGisun : Boolean; override;
  end;

var
  fmGurnZRogd: TfmGurnZRogd;

implementation

{$R *.DFM}

{ TfmGurnZRogd }

constructor TfmGurnZRogd.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_ZRogd;
  inherited;
  TBItemGrantSprav.Visible:=true;
end;

function TfmGurnZRogd.LoadQuery: Boolean;
var
  c : TColumnEh;
  itDop : TTbItem;
begin
  Result := inherited LoadQuery;
  try
    c := Grid.FieldColumns['DATER'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumns2GetCellParams;
    end;
  except
  end;
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
    c := Grid.FieldColumns['ON_ADRES1'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsON_ADRES;
    end;
  except
  end;
  try
    c := Grid.FieldColumns['ONA_ADRES1'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsONA_ADRES;
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

  {
  itDop := TTbItem.Create(TBSubSysFlt);
  itDop.Caption:='Многоплодные роды';
  itDop.OnClick:=Event_ManyChildren;
  TBSubSysFlt.Add(itDop);
  }
  
  itDop := TTbItem.Create(TBSubSysFlt);
  itDop.Caption:='Регистрация в торжественной обстановке';
  itDop.OnClick:=Event_RegistTorg;
  TBSubSysFlt.Add(itDop);

  CreateSysFlt_GISUN;

  itDop := TTbItem.Create(TBSubItemRun);
  itDop.Caption:= 'Очистить поле взаимодействия с ГИС РН';
  itDop.OnClick:=Event_ClearPoleGRN;
  TBSubItemRun.Add(itDop);
  TBSubItemRun.Visible:=true;

end;

procedure TfmGurnZRogd.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  fld : TField;
begin
  try
    fld := Query.FindField('VOSSTAN');
    if (fld <> nil) and not fld.IsNull and fld.AsBoolean then begin
      AFont.Color := COLOR_VOSSTAN;
    end;
    fld := Query.FindField('DATE_ANUL');
    if (fld <> nil) and not fld.IsNull then begin
      AFont.Color := clRed;
    end;
    if not Query.FieldByName('DATES').IsNull or (Query.FieldByName('GIVOROGD').AsBoolean=false)
      then AFont.Color := clRed;
  except
  end;
end;

procedure TfmGurnZRogd.GridColumns2GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not Query.FieldByName('ONLYGOD').IsNull and Query.FieldByName('ONLYGOD').AsBoolean then begin
    Params.Text := FormatDateTime('YYYY',Query.FieldByName('DATER').AsDateTime)
  end else begin

  end;
end;

procedure TfmGurnZRogd.GridColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
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

procedure TfmGurnZRogd.GridColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
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

procedure TfmGurnZRogd.GridColumnsON_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := '';
  if dmBase.tbZapisRogd.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
    Params.Text := dmBase.GetAdresAkt3(dmBase.tbZapisRogd,
    'ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_B_RN;ON_GOROD,ON_B_GOROD;ON_GOROD_R,ON_*',1);
  end;
end;

procedure TfmGurnZRogd.GridColumnsONA_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := '';
  if dmBase.tbZapisRogd.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
    Params.Text := dmBase.GetAdresAkt3(dmBase.tbZapisRogd,
    'ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION,ONA_B_RN;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',1);
  end;
end;

procedure TfmGurnZRogd.QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  nYear,nMonth,nDay : Integer;
begin
  Accept := false;
  SubDate(Query.FieldByName('DATEZ').AsDateTime, Query.FieldByName('DATER').AsDateTime,
          nYear,nMonth,nDay);
  if (nYear>1) or (nMonth>3) or ((nMonth=3) and (nDay>0)) then begin
    Accept := true;
  end;
end;

procedure TfmGurnZRogd.Event_RegistTorg(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'vosstan=.f. .and. sud_date=stod('+QStr('19000101')+')';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

procedure TfmGurnZRogd.Event_ManyChildren(Sender: TObject);
//var
//  sWhere:String;
begin
//  sWhere:=GetWhereQuery(Query.SQL.Text);
//  if sWhere<>'' then sWhere:=' WHERE '+sWhere;
//  sSQL:='SELECT id FROM АктыРождений '+sWhere+' GROUP BY'
//  if sWhere<>'' then sWhere:=sWhere+' and ';
{
SELECT ID, ar.DATEZ, NOMER FROM АктыРождений ar
LEFT JOIN
   ( SELECT DATEZ,ONA_FAMILIA,ONA_NAME,ONA_DATER,DATER,count(*)
     FROM АктыРождений
     WHERE datez>='1900-11-11' and datez<='2100-01-01'
     group by DATEZ,ONA_FAMILIA,ONA_NAME,ONA_DATER,DATER
     having count(*)=2 ) aaa ON ar.datez=aaa.DATEZ and ar.ONA_FAMILIA=aaa.ONA_FAMILIA and ar.ONA_NAME=aaa.ONA_NAME and ar.ONA_DATER=aaa.ONA_DATER and ar.DATER=aaa.DATER
WHERE aaa.DATEZ is not null
order by ar.DATEZ DESC,ar.ONA_FAMILIA,ar.ONA_NAME,ar.ONA_DATER,ar.DATER
}
{
  Query.OnFilterRecord := nil;
  Query.Filter   := 'at(id vosstan=.f. .and. sud_date=stod('+QStr('19000101')+')';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
  }
end;


procedure TfmGurnZRogd.TBItemZaderClick(Sender: TObject);
begin
  Query.OnFilterRecord := QueryFilterRecord;
  Query.Filter   := '';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

procedure TfmGurnZRogd.SetListParEditForm;
begin
  inherited;
  if not Query.FieldByName('VOSSTAN').AsBoolean
    then FListPar.Add('ENABLE_SKIP=1');
end;

function TfmGurnZRogd.IsRegisterGisun: Boolean;
begin
  if Query.FieldByName('GIVOROGD').IsNUll or (Query.FieldByName('GIVOROGD').AsBoolean=true)
    then Result:=true
    else Result:=false;
end;

end.
