unit fGurnUZAdopt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils, uProject,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, fParamQuest, Variants,
  TB2Item, TB2Dock, TB2Toolbar, Menus, MetaTask, FuncPr, ImgList, ComCtrls,uTypes,
  ExtCtrls;

type
  TfmGurnUZAdopt = class(TfmGurnal)
    TBItemZader: TTBItem;
    TBItemOpenZAdopt: TTBItem;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemZaderClick(Sender: TObject);
    procedure TBItemOpenZAdoptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;

    procedure Event_Renumber(Sender: TObject);
    procedure Event_LoadAdopt(Sender: TObject);

    function  getDefaultAddWhere : String; override;
    function  getAdditiveWhere   : String; override;

    procedure CheckPropertyGridColumns; override;
    procedure GridColumnsGetDateS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetDateR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoG(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

  end;

var
  fmGurnUZAdopt: TfmGurnUZAdopt;

implementation

uses dBase, fMain;

{$R *.DFM}

{ TfmGurnZSmert }

constructor TfmGurnUZAdopt.Create(Owner: TComponent);
begin
  TypeEditObj:=_TypeObj_UZAdopt;
  inherited;
  TBItemQuery.Visible:=false;
  TBItemGrupOne.Visible:=false;
  TBSubmenuGroup.Visible:=false;
  TBItemClrFlt.Visible:=false;
end;

function TfmGurnUZAdopt.LoadQuery: Boolean;
var
  it : TTbItem;
 sep : TTbSeparatorItem;
begin
  Result := inherited LoadQuery;

  TBSubItemRun.Visible:=true;
  it := TTbItem.Create(TBSubItemRun);
  it.Caption:='��������� ������ �����';
  it.OnClick:=Event_LoadAdopt;
  TBSubItemRun.Add(it);

  sep := TTbSeparatorItem.Create(TBSubItemRun);
  TBSubItemRun.Add(sep);

  it := TTbItem.Create(TBSubItemRun);
  it.Caption:='�������������� ������';
  it.OnClick:=Event_Renumber;
  TBSubItemRun.Add(it);

//  CreateSysFlt_GISUN;
end;

procedure TfmGurnUZAdopt.GridGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
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
  fld := Query.FindField('HANDLED');
  if (fld <> nil) and not fld.IsNull and fld.AsBoolean then begin
    Background:=clInfoBk;
  end;
end;

procedure TfmGurnUZAdopt.TBItemZaderClick(Sender: TObject);
begin
//  if GlobalTask.ParamAsString('ZADER_SMERT')='' then begin
    Query.Filter   := 'datez-dates>7';
//  end else begin
//    Query.Filter   := 'datez-dates>'+GlobalTask.ParamAsString('ZADER_SMERT');
//  end;
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

procedure TfmGurnUZAdopt.CheckPropertyGridColumns;
var
  c : TColumnEh;
begin
  inherited CheckPropertyGridColumns;
  {
  c := Grid.FieldColumns['DATES'];
  c.OnGetCellParams := GridColumnsGetDateS;
  c := Grid.FieldColumns['DATER'];
  c.OnGetCellParams := GridColumnsGetDateR;
  c := Grid.FieldColumns['MESTOS'];
  if c<>nil then c.OnGetCellParams := GridColumnsGetMestoS;
  c := Grid.FieldColumns['MESTOG'];
  if c<>nil then c.OnGetCellParams := GridColumnsGetMestoG;
  c := Grid.FieldColumns['MESTOR'];
  if c<>nil then c.OnGetCellParams := GridColumnsGetMestoR;
  }
end;

procedure TfmGurnUZAdopt.GridColumnsGetDateS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      Params.Text := DatePropisEx( Query.FieldByName('DATES').AsDateTime,
                                   3, Query.FieldByName('ONLYGOD').AsInteger);
    end;
  end;
end;

procedure TfmGurnUZAdopt.GridColumnsGetDateR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      Params.Text := DatePropisEx( Query.FieldByName('DATER').AsDateTime,
                                   3, Query.FieldByName('ONLYGOD_R').AsInteger);
    end;
  end;
end;

procedure TfmGurnUZAdopt.GridColumnsGetMestoS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'SM_GOSUD,FName;SM_OBL;SM_RAION;SM_GOROD,SM_B_GOROD;',1);
end;

procedure TfmGurnUZAdopt.GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'RG_GOSUD,FName;RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',1);
end;

procedure TfmGurnUZAdopt.GridColumnsGetMestoG(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1);
end;

function TfmGurnUZAdopt.getAdditiveWhere: String;
var
 s : String;
 procedure AddResult(ss:String);
 begin if Result='' then Result:=ss else Result:=Result+' and '+ss;  end;
begin
  Result:='TYPEOBJ='+IntToStr(TypeEditObj);
  s:=getYearWhere;
  if s<>'' then AddResult(s);
end;

function TfmGurnUZAdopt.getDefaultAddWhere: String;
begin
//  Result:='';
  Result:=getYearWhere;
end;

procedure TfmGurnUZAdopt.Event_Renumber(Sender: TObject);
begin
  Renumber_GurnalUZ;
end;

procedure TfmGurnUZAdopt.Event_LoadAdopt(Sender: TObject);
begin
  LoadAkt_GurnalUZ(_TypeObj_ZAdopt);
end;

procedure TfmGurnUZAdopt.TBItemOpenZAdoptClick(Sender: TObject);
begin
  EditAktFromGurnalUZ(_TypeObj_ZAdopt);
end;

procedure TfmGurnUZAdopt.FormCreate(Sender: TObject);
begin
  inherited;
  TBItemAddDok.Hint:='�������� ����� ���������';
end;


end.
