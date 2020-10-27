unit fGurnZSmert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uProject, uTypes,
  TB2Item, TB2Dock, TB2Toolbar, Menus, MetaTask, FuncPr, dbFunc, ImgList, ComCtrls,
  ExtCtrls;

{$I Task.inc}


type
  TfmGurnZSmert = class(TfmGurnal)
    TBItemZader: TTBItem;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemZaderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
    procedure CheckPropertyGridColumns; override;
    procedure GridColumnsGetDateS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetDateR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoG(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoZ(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure Event_POLE_GRN_3_PRICH(Sender: TObject);
    procedure Event_LichNomerNotPrint(Sender: TObject);
    procedure SetListParEditForm; override;

    procedure BeforeClearFilter; override;
    function  getAdditiveWhere: String; override;
    function  getDefaultAddWhere: String; override;
    function  getIDForTmpTable(nType:Integer;strFilter:String):Boolean;
    function  setAdditiveFilter:Boolean; override;
    function  getAdditiveFilter: String; override;

  end;

var
  fmGurnZSmert: TfmGurnZSmert;

const
 TYPESEEK_NOTGIS=1;

implementation

uses dBase;

{$R *.DFM}

{ TfmGurnZSmert }

constructor TfmGurnZSmert.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_ZSmert;
  inherited;
  TBItemGrantSprav.Visible:=true;
  FSeekAsQuery:=true;
end;

function TfmGurnZSmert.LoadQuery: Boolean;
var
  itDop:TTbItem;
begin
  Result := inherited LoadQuery;
  CreateSysFlt_GISUN;

  if TBSubSysFlt.Count>0 then begin
    TBSubSysFlt.Add(TTbSeparatorItem.Create(TBSubSysFlt));
  end;

  itDop := TTbItem.Create(TBSubSysFlt);
//  itDop.Images:=ImageListGisun;
//  itDop.ImageIndex:=3;
  itDop.Caption:= 'Взаимодействие с ГИС РН завершено (с пустой причиной)';
  itDop.OnClick:=Event_POLE_GRN_3_PRICH;
  TBSubSysFlt.Add(itDop);

  {$IFDEF ZAGS}
  itDop := TTbItem.Create(TBSubSysFlt);
  itDop.Images:=ImageListGisun;
  itDop.ImageIndex:=10;
  itDop.Caption:= 'Идентификационный номер не подлежит печати';
  itDop.OnClick:=Event_LichNomerNotPrint;
  TBSubSysFlt.Add(itDop);
  {$ENDIF}

end;

procedure TfmGurnZSmert.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
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
  fld := Query.FindField('LICH_ID');
  if (fld <> nil) and (fld.AsInteger=1) then begin
    Background:=GetNoTransferColor;
  end;
end;

procedure TfmGurnZSmert.TBItemZaderClick(Sender: TObject);
begin
//  if GlobalTask.ParamAsString('ZADER_SMERT')='' then begin
    Query.Filter   := 'datez-dates>7';
//  end else begin
//    Query.Filter   := 'datez-dates>'+GlobalTask.ParamAsString('ZADER_SMERT');
//  end;
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

procedure TfmGurnZSmert.CheckPropertyGridColumns;
var
  c : TColumnEh;
begin
  inherited CheckPropertyGridColumns;
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
  {$IFDEF ZAGS}
    c := Grid.FieldColumns['MESTO_Z'];
    if c<>nil then c.Visible:=false;
  {$ELSE}
    c := Grid.FieldColumns['MESTO_Z'];
    if c<>nil then c.OnGetCellParams := GridColumnsGetMestoZ;
    c := Grid.FieldColumns['PODR'];
    if c<>nil then c.Visible:=false;
  {$ENDIF}
end;

procedure TfmGurnZSmert.GridColumnsGetDateS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Query.FieldByName('ONLYGOD').AsInteger=3 then begin
      Params.Text:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZSmert, Query.FieldByName('ID').AsInteger, STOD('1899-12-30',tdAds),
                              'TEXT_DATES', ftString);
    end else begin
      if Params.Text<>'' then begin
        Params.Text := DatePropisEx( Query.FieldByName('DATES').AsDateTime,
                                   3, Query.FieldByName('ONLYGOD').AsInteger);
      end;
    end;
  end;
end;

procedure TfmGurnZSmert.GridColumnsGetDateR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Query.FieldByName('ONLYGOD_R').AsInteger=3 then begin
      Params.Text:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZSmert, Query.FieldByName('ID').AsInteger, STOD('1899-12-30',tdAds),
                              'TEXT_VOZR', ftString);
    end else begin
      if Params.Text<>'' then begin
        Params.Text := DatePropisEx( Query.FieldByName('DATER').AsDateTime,
                                     3, Query.FieldByName('ONLYGOD_R').AsInteger);
      end;
    end;
  end;
end;

procedure TfmGurnZSmert.GridColumnsGetMestoZ(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.ReadPropSimpleDok(_TypeObj_ZSmert, Query.fieldbyName('ID').AsInteger, STOD('1899-12-30',tdAds), 'MESTO_Z', ftMemo);
end;

procedure TfmGurnZSmert.GridColumnsGetMestoS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'SM_GOSUD,FName;SM_OBL;SM_RAION;SM_GOROD,SM_B_GOROD;',1);
end;

procedure TfmGurnZSmert.GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'RG_GOSUD,FName;RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',1);
end;

procedure TfmGurnZSmert.GridColumnsGetMestoG(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_B_RN;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1);
end;

procedure TfmGurnZSmert.SetListParEditForm;
begin
  inherited;
  FListPar.Add('ENABLE_SKIP=1');
end;

procedure TfmGurnZSmert.Event_POLE_GRN_3_PRICH(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'pole_grn>=3000 and pole_grn<4000 and lich_id=1';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

procedure TfmGurnZSmert.Event_LichNomerNotPrint(Sender: TObject);
begin
  setAdditiveFilter;
  TBItemClrFlt.Enabled:=true;
end;

//----------------------------------------------------------------
function TfmGurnZSmert.getAdditiveWhere: String;
var
 s1:String;
 procedure AddResult(ss:String);
 begin if Result='' then Result:=ss else Result:=Result+' and '+ss;  end;
begin
  s1:=getYearWhere;
  if s1<>'' then AddResult(s1);
  if FSeekAsQuery_Active
    then AddResult(' sm.id in (select id from '+GetNameTmpIdTable+')');
end;
//----------------------------------------------------------------
function TfmGurnZSmert.getDefaultAddWhere: String;
begin
  Result:=getAdditiveWhere;
end;
//----------------------------------------------------------------
function TfmGurnZSmert.setAdditiveFilter: Boolean;
var
  s : String;
//  n:Integer;
//  l:Boolean;
//  cur:TCursor;
begin
  Result:=true;
  Query.Filtered := false;
  Query.OnFilterRecord:=nil;
  Query.Filter := '';
  if not TBItemClrFlt.Enabled then begin
    FilterInterface.Filter.ClearFilter;     // !!!    гарантированно очистим фильтр
  end;
  s:=getAdditiveFilter;
  FullRefresh(true); //, strOrderBy);
end;
//----------------------------------------------------------------
procedure TfmGurnZSmert.BeforeClearFilter;
begin
  FSeekAsQuery_Active:=false;
end;
//----------------------------------------------------------------
function TfmGurnZSmert.getAdditiveFilter: String;
begin
  FSeekAsQuery_Active:=true;
  if getIDForTmpTable(TYPESEEK_NOTGIS,'') then begin

  end;
  Result:=CreateAdditiveWhere(getAdditiveWhere);
  if Result<>'' then begin
    FNewSQL:=ChangeWhere( Query.SQL.Text, Result, false);
  end;
  if not TBItemClrFlt.Enabled
    then TBItemClrFlt.Enabled:=FSeekAsQuery_Active;
end;

//----------------------------------------------------------------
function TfmGurnZSmert.getIDForTmpTable(nType:Integer;strFilter:String):Boolean;
var
  sOper:String;
  slSQL:TStringList;
begin
  Result:=false;
  OpenMessage('    Поиск ...     ','',10);
  try
    slSQL:=TStringList.Create;
    slSQL.Add('DELETE FROM &tmp&;');
    CheckOper(strFilter);
    sOper:=Copy(strFilter,1,1);
    if (sOper='=') or (sOper='*') or (sOper='<') or (sOper='>') or (sOper='-')
      then strFilter:=Copy(strFilter,2,Length(strFilter))
      else sOper:='*';
//    n:=Pos(' ',strFilter);
    if (nType=TYPESEEK_NOTGIS) then begin
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT a.ID FROM АктыСмертей a '+CRLF+
                  'Left Join BaseTextProp b on a.id=b.id and b.typeobj='+IntToStr(_TypeObj_ZSmert)+' and pokaz=''OTHER'' '+CRLF+
                  'WHERE substring(getFieldSL(''LICH_NOMER_GIS'', b.value),1,1)=''1''; ');
    end;
    TmpQuery.SQL.Text:=StringReplace( slSQL.Text, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);
    TmpQuery.SQL.Text:=dmBase.CheckParamsSQL(TmpQuery.SQL.Text);
    slSQL.Free;
    memowrite('last_tmp.sql',TmpQuery.SQL.Text);
    TmpQuery.ExecSQL;
    TmpQuery.SQL.Text:='SELECT COUNT(*) FROM '+GetNameTmpIdTable;
    TmpQuery.Open;
    if TmpQuery.Fields[0].AsInteger>0 then  begin
      Result:=true;
    end;
    TmpQuery.Close;
    CloseMessage;
//    TmpQuery.Sql.Text:='select count(*) from '+GetNameTmpIdTable;
//    TmpQuery.Open;
//    ShowMessage(TmpQuery.Fields[0].AsString);
//    TmpQuery.Close;
  except
    on E:Exception do begin
      CloseMessage;
      PutError('Ошибка поиска: '+#13+E.Message,self);
      Result:=false;
    end;
  end;
end;

end.
