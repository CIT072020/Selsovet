unit fGurnDBrak;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants, FuncEh, DateUtils, uProject,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, FuncPr, fParamQuest,
  TB2Item, TB2Dock, TB2Toolbar, dBase, Menus, ImgList, ComCtrls, ExtCtrls;

type
  TfmGurnDBrak = class(TfmGurnal)
    TBItemToAkt: TTBItem;
    TBItemChoiceRuk: TTBItem;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;   AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridColumns0GetCellParams(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
    procedure GridColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure TBItemToAktClick(Sender: TObject);
    procedure TBItemChoiceRukClick(Sender: TObject);

  private
    { Private declarations }
    FRukov:Integer;
    FSpec:Integer;
  public
    { Public declarations }
    procedure Event_CreateAkt(Sender: TObject);
    procedure GridColumnsON_M_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsONA_M_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
    procedure QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  end;

var
  fmGurnDBrak: TfmGurnDBrak;

implementation

{$R *.DFM}

{ TfmGurnDBrak }

constructor TfmGurnDBrak.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_DBrak;
  inherited;
//  StBar.Panels[0].Text:=' <F3> отметить/снять отметку  <Ctrl-F3> снять все отметки';
  StBar.Visible:=true;
  FRukov:=0;
  FSpec:=0;
end;

function TfmGurnDBrak.LoadQuery: Boolean;
var
  c : TColumnEh;
//  it : TTbItem;
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
  {
  TBSubItemRun.Visible:=true;
  it := TTbItem.Create(TBSubItemRun);
  it.Caption:='Создать актовую запись о браке';
  it.OnClick:=Event_CreateAkt;
  TBSubItemRun.Add(it);
  }
end;

procedure TfmGurnDBrak.QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := false;
  try
    if DayOfWeek(Query.FieldByName('DATEZ').AsDateTime)=1 then Accept := true;
  except
  end;
end;

procedure TfmGurnDBrak.GridColumnsON_M_ADRES(Sender: TObject;
          EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := '';
  if dmBase.tbDeclBrak.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
    Params.Text := dmBase.GetAdresAkt3(dmBase.tbDeclBrak,
    'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_B_RN;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',1);
  end;
end;

procedure TfmGurnDBrak.GridColumnsONA_M_ADRES(Sender: TObject;
          EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := '';
  if dmBase.tbDeclBrak.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
    Params.Text := dmBase.GetAdresAkt3(dmBase.tbDeclBrak,
    'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_B_RN;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',1);
  end;
end;

procedure TfmGurnDBrak.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not Query.FieldByName('OTKAZ').IsNull and (Query.FieldByName('OTKAZ').AsBoolean=true) then begin
    AFont.Color:=clRed;
  end;
end;

procedure TfmGurnDBrak.GridColumns0GetCellParams(Sender: TObject;
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

procedure TfmGurnDBrak.GridColumns1GetCellParams(Sender: TObject;
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

//-----------------------------------------------------------------------------------
procedure TfmGurnDBrak.Event_CreateAkt(Sender: TObject);
var
  sl:TStringList;
  arrB:TArrStrings;
  f:TfmParamQuest;
  n,nNomer,i,j:Integer;
  strNewNomer, strNewSeria, s, sSvSeria, sSvNomer : String;
begin
  OpenMessage(' Соберем информацию о заявлениях ...','',0);
  Query.DisableControls;
  s:=Query.Bookmark;
  sl:=TStringList.Create;

  Query.First;
  //------------ соберем все ID --------------
  while not Query.Eof do begin
    if (Query.FieldByName('OTKAZ').IsNull or (Query.FieldByName('OTKAZ').AsBoolean=false)) and
       (Query.FieldByName('OTMETKA_ISP').AsString='')  then begin
      sl.Add(Query.FieldByName('ID').AsString);
    end;
    Query.Next;
  end;
  //------------ есть отмеченные --------------
  SelectionToArr(Grid, arrB);
  if Length(arrB)>0 then begin
    for i:=0 to Length(arrB)-1 do begin
       Query.Bookmark:=arrB[i];
       j:=sl.IndexOf(Query.FieldByName('ID').AsString);
       if j>-1 then begin
         sl.Delete(j);
       end;
    end;
  end;
  CloseMessage;
  Query.Bookmark:=s;
  Query.EnableControls;

  if  (sl.Count>0) and Problem(' Вы хотите создать актовые записи о браке в количестве: '+IntToStr(sl.Count), mtConfirmation, self)  then begin
    nNomer:=dmBase.GetNewNomerDok(dmBase.TypeObj_ZBrak,YearOf(dmBase.getCurDate));
    if nNomer<=0 then begin
      nNomer:=1;
    end;
    s:=dmBase.GetNewNomerSvid(dmBase.TypeObj_ZBrak, dmBase.tbZapisBrak, strNewNomer, strNewSeria);  // !!!

    f:=TfmParamQuest.Create(Self);
    f.Caption:='Создать записи актов';
    f.AddParamEx(nNomer, 'Первый номер записи', 'AKT_NOMER' ,'TYPE=INTEGER~MIN='+IntToStr(nNomer)+'~WIDTH=80');
    f.AddParamEx(strNewSeria, 'Серия свидетельства', 'SV_SERIA' ,'TYPE=LOOKUP~DESC=LOOKUP_SERIASVID~WIDTH=80');
    f.AddParamEx(strNewNomer, 'Первый номер свидетельства', 'SV_NOMER' ,'EDITMASK='+EM_NomerSvid+'~WIDTH=80');

    f.AddParamEx(FRukov, 'Руководитель', 'RUKOV' ,'TYPE=LOOKUP~DESC=LOOKUP_PERSONAL~WIDTH=200');
    f.AddParamEx(FSpec, 'Специалист', 'SPEC' ,'TYPE=LOOKUP~DESC=LOOKUP_PERSONAL~WIDTH=200');

    f.AddButtons('Выполнить~Отказ',0);
    n:=f.ShowQuest;
    if n=1 then begin
      nNomer:=f.GetValue('AKT_NOMER', 'N');
      sSvSeria:=f.GetValue('SV_SERIA','S');
      sSvNomer:=Trim(f.GetValue('SV_NOMER','S'));
      FRukov:=StrToIntDef(f.GetValue('RUKOV', 'C'),0);
      FSpec:=StrToIntDef(f.GetValue('SPEC', 'C'),0);
    end;
    f.Free;
    Application.ProcessMessages;
    if n=1 then begin
      if nNomer<=0 then begin
        PutError('Не введен первый номер актовой записи.');
      end else begin
        dmBase.DeclareBrakToAkt(sl, sSvSeria, sSvNomer, nNomer, 0, FLenSoato, FRukov, FSpec);
      end;
    end;
  end;
end;

procedure TfmGurnDBrak.TBItemToAktClick(Sender: TObject);
begin
  Event_CreateAkt(nil);
end;

procedure TfmGurnDBrak.TBItemChoiceRukClick(Sender: TObject);
//var
//  sDolg,sDolg_B,sFIO,sFIO_B:String;
//  TBDock:TTBDock;
begin
{
  if ChoiceSpec4(FDolg,FDolg_B,FFIO,FFIO_B, 400, TBToolbarMain.Height+TBDock24.Height+50, false) then begin
    GlobalTask.WriteParamAsString('DOLG_RUK_ZAGS', sDolg);
    GlobalTask.WriteParamAsString('РУК_ЗАГС', sFIO);
    if (sFIO_B='') or (sDolg_B='') then begin
      PutError('Не заполнено ФИО и должность по-белорусски');
    end;
    GlobalTask.WriteParamAsString('DOLG_RUK_ZAGS_B', sDolg_B);
    GlobalTask.WriteParamAsString('РУК_ЗАГС_Б', sFIO_B);
    GlobalTask.SaveParameters;
  end;
}
end;

end.
