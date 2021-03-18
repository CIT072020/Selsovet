unit fGurnUZRogd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils, uProject,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, fParamQuest, Variants,
  TB2Item, TB2Dock, TB2Toolbar, Menus, MetaTask, FuncPr, ImgList, ComCtrls,uTypes,
  ExtCtrls;

type
  TfmGurnUZRogd = class(TfmGurnal)
    TBItemZader: TTBItem;
    TBItemOpenZRogd: TTBItem;
    TBItemOpenZRogd24: TTBItem;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;   AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemZaderClick(Sender: TObject);
    procedure TBItemOpenZRogdClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;

    procedure Event_Renumber(Sender: TObject);
    procedure Event_LoadRogd(Sender: TObject);

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
  fmGurnUZRogd: TfmGurnUZRogd;

implementation

uses dBase, fMain;

{$R *.DFM}

{ TfmGurnZSmert }

constructor TfmGurnUZRogd.Create(Owner: TComponent);
begin
  TypeEditObj:=_TypeObj_UZRogd;
  inherited;
  VisibleItems([TBItemQuery, TBItemGrupOne, TBSubmenuGroup, TBItemClrFlt], false);
  VisibleItems([TBItemAddDok], true);


  {
  TBItemQuery.Visible:=false;
  TBItemGrupOne.Visible:=false;
  TBSubmenuGroup.Visible:=false;
  TBItemClrFlt.Visible:=false;
  }
end;

function TfmGurnUZRogd.LoadQuery: Boolean;
var
  it : TTbItem;
 sep : TTbSeparatorItem;
begin
  Result := inherited LoadQuery;

//  TBSubItemRun.Visible:=true;
  VisibleItem(TBSubItemRun, true);
  it := TTbItem.Create(TBSubItemRun);
  it.Caption:='Загрузить записи актов';
  it.OnClick:=Event_LoadRogd;
  TBSubItemRun.Add(it);

  sep := TTbSeparatorItem.Create(TBSubItemRun);
  TBSubItemRun.Add(sep);

  it := TTbItem.Create(TBSubItemRun);
  it.Caption:='Перенумеровать журнал';
  it.OnClick:=Event_Renumber;
  TBSubItemRun.Add(it);

//  CreateSysFlt_GISUN;
end;

procedure TfmGurnUZRogd.GridGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
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

procedure TfmGurnUZRogd.TBItemZaderClick(Sender: TObject);
begin
//  if GlobalTask.ParamAsString('ZADER_SMERT')='' then begin
    Query.Filter   := 'datez-dates>7';
//  end else begin
//    Query.Filter   := 'datez-dates>'+GlobalTask.ParamAsString('ZADER_SMERT');
//  end;
  Query.Filtered := true;
//  TBItemClrFlt.Enabled:=true;
  SetClearFilter(true);
end;

procedure TfmGurnUZRogd.CheckPropertyGridColumns;
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

procedure TfmGurnUZRogd.GridColumnsGetDateS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      Params.Text := DatePropisEx( Query.FieldByName('DATES').AsDateTime,
                                   3, Query.FieldByName('ONLYGOD').AsInteger);
    end;
  end;
end;

procedure TfmGurnUZRogd.GridColumnsGetDateR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      Params.Text := DatePropisEx( Query.FieldByName('DATER').AsDateTime,
                                   3, Query.FieldByName('ONLYGOD_R').AsInteger);
    end;
  end;
end;

procedure TfmGurnUZRogd.GridColumnsGetMestoS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'SM_GOSUD,FName;SM_OBL;SM_RAION;SM_GOROD,SM_B_GOROD;',1);
end;

procedure TfmGurnUZRogd.GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'RG_GOSUD,FName;RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',1);
end;

procedure TfmGurnUZRogd.GridColumnsGetMestoG(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1);
end;

function TfmGurnUZRogd.getAdditiveWhere: String;
var
 s : String;
 procedure AddResult(ss:String);
 begin if Result='' then Result:=ss else Result:=Result+' and '+ss;  end;
begin
  Result:='TYPEOBJ='+IntToStr(TypeEditObj);
  s:=getYearWhere;
  if s<>'' then AddResult(s);
end;

function TfmGurnUZRogd.getDefaultAddWhere: String;
begin
  Result:=getYearWhere;
end;

procedure TfmGurnUZRogd.Event_Renumber(Sender: TObject);
begin
  Renumber_GurnalUZ;
end;

procedure TfmGurnUZRogd.Event_LoadRogd(Sender: TObject);
begin
  LoadAkt_GurnalUZ(_TypeObj_ZRogd);
end;

procedure TfmGurnUZRogd.TBItemOpenZRogdClick(Sender: TObject);
begin
  EditAktFromGurnalUZ(_TypeObj_ZRogd);
end;

procedure TfmGurnUZRogd.FormCreate(Sender: TObject);
begin
  inherited;
  TBItemAddDok.Hint:='Добавить новое заявление';
end;


end.
