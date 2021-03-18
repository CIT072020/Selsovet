unit fGurnZOpeka;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants, uTypes,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uProject, mPermit, fWarning, dbFunc,
  TB2Item, TB2Dock, TB2Toolbar, Menus, MetaTask, FuncPr, ImgList, ComCtrls, FuncEh, uProjectAll,
  {$IFDEF OPEKA } fChVigrOpeka, {$ENDIF}
  ExtCtrls;


type
  TfmGurnZOpeka = class(TfmGurnal)
    TBItemVigr: TTBItem;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;   AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemZaderClick(Sender: TObject);
    procedure TBItemVigrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    arrShab:TCurrentRecord;
    FShablon_Del:Boolean;
    FShablon_Add:Boolean;
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
    procedure CheckPropertyGridColumns; override;
    procedure GridColumnsGetDateR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoG(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure Event_POLE_GRN_3_PRICH(Sender: TObject);
    procedure Event_CheckChild(Sender: TObject);
    procedure Event_FindINOpecun(Sender: TObject);
    procedure Event_CheckDateEdit(Sender: TObject);
    procedure Event_CheckRunToGISRN(Sender: TObject);

{$IFDEF OPEKA }
    procedure Event_CheckRecord(Sender: TObject);
    procedure Event_CopyRecord(Sender: TObject);
{$ENDIF}

//    procedure Event_VigrMinTrud1(Sender: TObject);
//    procedure Event_VigrMinTrud2(Sender: TObject);
    function  SetSysFilter(vPar: Variant): Boolean;  override;
    procedure GridColumnsPodr(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure SetVisibleColumnGrid(sName:String; lVisible:Boolean);
    procedure SetListParEditForm; override;
    procedure LoadFromIni; override;

  end;

var
  fmGurnZOpeka: TfmGurnZOpeka;

implementation

uses dBase, fzapisOpekaSh;

{$R *.DFM}

{ TfmGurnAktZ }

constructor TfmGurnZOpeka.Create(Owner: TComponent);
begin
  TypeEditObj := _TypeObj_Opeka;
  inherited;
//  TBItemGrantSprav.Visible:=true;
  FRegisterNotRequired:=true;
  SetLength(arrShab,0);
  FShablon_Del:=true;
  FShablon_Add:=true;
end;

function TfmGurnZOpeka.LoadQuery: Boolean;
var
  it,itDop:TTbItem;
  pt:TPermitType;
  sep:TTbSeparatorItem;
  l,lAdd:Boolean;
  c:TColumnEh;
begin
  Result := inherited LoadQuery;
  CreateSysFlt_GISUN;
  VisibleItems([TBItemAddDok], true);
//  lAdd:=true;
  {
  if Role.IsCheckSubSystem then begin
    pt:=Role.CheckSubSystem(SS_HOZ_UCHET);
    if ((Role.Status=rsAdmin) or (pt=ptFull)) then begin
      lAdd:=true;
    end else begin
      lAdd:=false;
    end;
  end else begin
    lAdd:=true;
  end;
  }
      
{$IFDEF OPEKA }
  if Role.Status=rsAdmin then begin
    VisibleItem(TBSubItemRun, true); //.Visible:=true;

    itDop := TTbItem.Create(TBSubItemRun);
    itDop.Caption:= 'Ввести шаблон для нового опекуна(попечителя)';
    itDop.OnClick:=Event_CheckRecord;
    TBSubItemRun.Add(itDop);

    TBSubItemRun.Add(TTbSeparatorItem.Create(TBSubItemRun));

    itDop := TTbItem.Create(TBSubItemRun);
    itDop.Caption:= 'Выполнить операцию для шаблона';
    itDop.OnClick:=Event_CopyRecord;
    TBSubItemRun.Add(itDop);
  end else begin
    VisibleItem(TBSubItemRun, false); //.Visible:=false;
  end;
{$ELSE}
  VisibleItem(TBSubItemRun, false); //.Visible:=false;
{$ENDIF}
{
  itDop := TTbItem.Create(TBSubItemRun);
  itDop.Caption:= 'Выгрузка опекунов(попечителей) для Минтруда';
  itDop.OnClick:=Event_VigrMinTrud2;
  TBSubItemRun.Add(itDop);  }

  {if lAdd then begin
    TBSubItemRun.Visible:=true;
    if TBSubItemRun.Count>0 then begin
      sep := TTbSeparatorItem.Create(TBSubItemRun);
      TBSubItemRun.Add(sep);
    end;

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Необходимо прекращение опеки';
    it.OnClick:=Event_CheckChild;
    TBSubItemRun.Add(it);
  end; }

  if TBSubSysFlt.Count>0 then begin
    TBSubSysFlt.Add(TTbSeparatorItem.Create(TBSubSysFlt));
  end;

  itDop := TTbItem.Create(TBSubSysFlt);
  itDop.Caption:= 'Необходима отправка в ГИС РН';
  itDop.OnClick:=Event_CheckRunToGISRN;
  TBSubSysFlt.Add(itDop);

  TBSubSysFlt.Add(TTbSeparatorItem.Create(TBSubSysFlt));

  itDop := TTbItem.Create(TBSubSysFlt);
  itDop.Caption:= 'Запись откорректирована после отправки в ГИС РН';
  itDop.OnClick:=Event_CheckDateEdit;
  TBSubSysFlt.Add(itDop);

  itDop := TTbItem.Create(TBSubSysFlt);
//  itDop.Images:=ImageListGisun;
//  itDop.ImageIndex:=3;
  itDop.Caption:= 'ОТБОР: Необходимо прекращение опеки (попечительства)';
  itDop.OnClick:=Event_CheckChild;
  TBSubSysFlt.Add(itDop);

  itDop := TTbItem.Create(TBSubSysFlt);
//  itDop.Images:=ImageListGisun;
//  itDop.ImageIndex:=3;
  itDop.Caption:= 'ОТБОР: Идентификационный номер опекуна(попечителя)';
  itDop.OnClick:=Event_FindINOpecun;
  TBSubSysFlt.Add(itDop);

  TBSubSysFlt.Add(TTbSeparatorItem.Create(TBSubSysFlt));
end;
{$IFDEF OPEKA }
//-----------------------------------------------------------------------
procedure TfmGurnZOpeka.Event_CheckRecord(Sender: TObject);
var
  slPar:TStringList;
begin
  slPar:=TStringList.Create;
  EditShablonOpeka( arrShab, FShablon_Del, FShablon_Add, slPar);
  slPar.Free;
//  if Query.FieldByName('ID').AsInteger>0 then begin
//    FShablonRec:=Query.FieldByName('ID').AsInteger;
//    Grid.Refresh;
//  end;
end;
//-----------------------------------------------------------------------
procedure TfmGurnZOpeka.Event_CopyRecord(Sender: TObject);
var
  i,j,nClose,nAdd:Integer;
  sID,s,s1,s2,ss:String;
  sl:TStringList;
  arrRec : TCurrentRecord;
  arr,arrC:TArrStrings;
  slProt:TstringList;
  function getInfoOpeka:String;
  begin
    with dmBase do begin
      if tbZapisOpeka.FieldByName('DATE_OTM').IsNull
        then ss:=''
        else ss:=', прекращения:'+QStr(DatePropis(tbZapisOpeka.FieldByName('DATE_OTM').AsDateTime));
      Result:='подопечный:'+CreateFIO(tbZapisOpeka, '')+'; опекун:'+CreateFIO(tbZapisOpeka, 'ON_')+'; '+
              'дата установки:'+QStr(DatePropis(tbZapisOpeka.FieldByName('DATEZ').AsDateTime))+ss;
    end;
  end;
begin   
  if (Length(arrShab)>0) and (FShablon_Del or FShablon_Add) then begin
    sl:=TStringList.Create;
    if GetRecordsForObrab(1, sl, sID) then begin
      if FShablon_Del
        then s1:='1. В отобранные карточки будет записана информация о прекращении (если не заполнена)'#13
        else s1:='';
      if FShablon_Add
        then s2:='2. На основании отобранных карточек будут созданы новые'#13'(с заполнением новых установочных данных и нового опекуна(попечителя))'#13
        else s2:='';
      s:='ВНИМАНИЕ!'#13+
         'Найдено для обработки карточек: '+IntToStr(sl.Count)+#13+s1+s2+
         'Если Вы уверены в необходимости проведения операции,'#13+
         'введите слово ДА в поле ввода'#13;
      slProt:=TStringList.Create;
      if OkWarning(s,self) then begin
        StrToArr('ON_FAMILIA;ON_NAME;ON_OTCH;ON_DATER;ON_POL;ON_IDENTIF;OTNOSH;ON_GRAG;ON_GOSUD;ON_OBL;ON_B_OBL;ON_RAION;ON_GOROD;ON_B_GOROD;ON_GOROD_R;ON_DOM;ON_KORP;ON_KV;ON_WORK',
                  arr,';',false);
        StrToArr('DATE_EDIT_GIS;DATE_OTM;TYPE_SN;NOMER_OTM;DOC_OPEKA_OTM;DATEDOK_SN;OTM_ORG;OTM_ORG_SPR;OTM_ORG_TYPE',
                  arrC,';',false);
        nClose:=0;
        nAdd:=0;
        slProt.Add('>>>>> Обработка записей по шаблону: '+IntToStr(sl.Count));
        for i:=0 to sl.Count-1 do begin
          if dmBase.tbZapisOpeka.Locate('ID', sl.Strings[i], []) then begin
            slProt.Add(IntToStr(i+1)+'. -------');
            GetCurrentRecord(dmBase.tbZapisOpeka,'-ID',arrRec);
            //=== проведение прекращения опеки ==================================================
            if FShablon_Del then begin
              if dmBase.tbZapisOpeka.FieldByName('DATE_OTM').IsNull then begin
                with dmBase.tbZapisOpeka do begin
                  Edit;
                  FieldByName('DATE_EDIT_GIS').AsDateTime:=Now;
                  FieldByName('DATE_OTM').AsDateTime:=GetValueFieldEx(arrShab, 'DATE_OTM', 0);
                  FieldByName('TYPE_SN').AsString:=GetValueFieldEx(arrShab, 'TYPE_SN', '');
                  FieldByName('NOMER_OTM').AsString:=GetValueFieldEx(arrShab, 'NOMER_OTM', '');
                  FieldByName('DOC_OPEKA_OTM').AsString:=GetValueFieldEx(arrShab, 'DOC_OPEKA_OTM', '');
                  FieldByName('DATEDOK_SN').Value:=GetValueField(arrShab, 'DATEDOK_SN');
                  if GetValueFieldEx(arrShab, 'OTM_OTHER', false) then begin
                    FieldByName('OTM_ORG').AsString:=GetValueFieldEx(arrShab, 'OTM_ORG', '');
                    FieldByName('OTM_ORG_SPR').AsString:=GetValueFieldEx(arrShab, 'OTM_ORG_SPR', '');;
                    FieldByName('OTM_ORG_TYPE').AsString:=GetValueFieldEx(arrShab, 'OTM_ORG_TYPE', '');;
                    FieldByName('OTM_OTHER').AsBoolean:=false;
                  end else begin
                    FieldByName('OTM_ORG').AsString:='';
                    FieldByName('OTM_ORG_SPR').AsString:='';
                    FieldByName('OTM_ORG_TYPE').AsString:='';
                    FieldByName('OTM_OTHER').AsBoolean:=false;
                  end;
                  Post;
                  Inc(nClose,1);
                  slProt.Add('Проведение прекращения опеки: '+getInfoOpeka);
                end;
              end else begin
                slProt.Add('Опека уже прекращена: '+getInfoOpeka);
              end;
            end;

            //=== проведение установления опеки с новым опекуном ======================================
            if FShablon_Add  then begin
              AddCurrentRecord(dmBase.tbZapisOpeka, arrRec);
              with dmBase.tbZapisOpeka do begin
                Edit;
  //              'TYPE_SN'  DATE_OTM DOC_OPEKA_OTM NOMER_OTM DATEDOK_SN OTM_ORG OTM_ORG_SPR OTM_ORG_TYPE  ???
                FieldByName('DATE_EDIT_GIS').AsDateTime:=Now;
                FieldByName('DATE_POST_GIS').AsString:='';
                FieldByName('POLE_GRN').AsInteger:=0;
                FieldByName('DATEZ').AsDateTime:=GetValueFieldEx(arrShab, 'DATEZ', 0);
                FieldByName('DOC_OPEKA').AsInteger:=GetValueFieldEx(arrShab, 'DOC_OPEKA', 0);
                FieldByName('NOMER_UST').AsString:=GetValueFieldEx(arrShab, 'NOMER_UST', '');
                FieldByName('DATEDOK_UST').AsDateTime:=GetValueFieldEx(arrShab, 'DATEDOK_UST', 0);
                if GetValueFieldEx(arrShab, 'UST_OTHER', false) then begin
                  FieldByName('UST_ORG_TYPE').AsString:=GetValueFieldEx(arrShab, 'UST_ORG_TYPE', '');
                  FieldByName('UST_ORG_SPR').AsString:=GetValueFieldEx(arrShab, 'UST_ORG_SPR', '');
                  FieldByName('UST_ORG').AsString:=GetValueFieldEx(arrShab, 'UST_ORG', '');
                  FieldByName('UST_OTHER').AsBoolean:=true;
                end else begin
                  FieldByName('UST_ORG_TYPE').AsString:='';
                  FieldByName('UST_ORG_SPR').AsString:='';
                  FieldByName('UST_ORG').AsString:='';
                  FieldByName('UST_OTHER').AsBoolean:=false;
                end;
                for j:=Low(arr)  to High(arr)  do FieldByName(arr[j]).Value:=GetValueField(arrShab, arr[j]);
                for j:=Low(arrC) to High(arrC) do FieldByName(arrC[j]).value:=null;
                FieldByName('OTM_OTHER').AsBoolean:=false;
                Post;
                Inc(nAdd,1);
                slProt.Add('Создана карточка и установлена опека: '+getInfoOpeka);
              end;
            end;
          end;
        end;
        slProt.Add('------');
        slProt.Add('Опека прекращена в количестве '+intToStr(nClose));
        slProt.Add('Создана карточка и установлена опека в количестве '+intToStr(nAdd));
        slProt.Add('>>>>> Обработка завершена');
        for i:=0 to slProt.Count-1 do
          GlobalTask.WriteToLogFile(slProt.Strings[i]);
        ShowMemo(slProt, 'Протокол', '50;200;800;400');
        slProt.Free;
      end;
    end;
    sl.Free;
  end else begin
    PutError('Необходимо ввести шаблон', self);
  end;
end;
{$ENDIF}

//-----------------------------------------------------------------------
procedure TfmGurnZOpeka.SetVisibleColumnGrid(sName:String; lVisible:Boolean);
var
  c:TColumnEh;
begin
  try
    c:=Grid.FieldColumns[sName];
    if (c<>nil) then c.Visible:=lVisible;
  except
  end;
end;
//-----------------------------------------------------------------------
procedure TfmGurnZOpeka.LoadFromIni;
var
//  i : Integer;
//  ini : TSasainiFile;
  l,lv,lz:Boolean;
begin
  inherited LoadFromIni;
//  ini := GlobalTask.iniFile('LOCAL');
  {$IFDEF LAIS}
    l:=false;
    SetVisibleColumnGrid('DATE_VIGR',l);
    SetVisibleColumnGrid('DATE_ZAGR',l);
  {$ELSE}
    l:=true;
    if GlobalTask.ParamAsInteger('PODR')>0 then begin
      lz:=false;
      lv:=true;
    end else begin
      lz:=true;
      lv:=false;
    end;
    SetVisibleColumnGrid('DATE_VIGR',lv);
    SetVisibleColumnGrid('DATE_ZAGR',lz);
  {$ENDIF}
  SetVisibleColumnGrid('UST_ORG',l);
  SetVisibleColumnGrid('OTM_ORG',l);
end;
//-----------------------------------------------------------------------
procedure TfmGurnZOpeka.Event_CheckDateEdit(Sender: TObject);
begin
// ??? function ChangeWhere( strQuery : String; strWhere : String; lAdd : Boolean) : String;
  ClearFilter;
  Query.OnFilterRecord := nil;
//  Query.Filter   := '(date_edit_gis>date_post_gis) or (!Empty(date_edit_gis) and Empty(date_post_gis))';
  Query.Filter   := 'date_edit_gis>date_post_gis';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;
//-----------------------------------------------------------------------
procedure TfmGurnZOpeka.Event_CheckRunToGISRN(Sender: TObject);
begin
//  Query.Filter   := '';
//  Query.Filter   := 'pole_grn>=2000 and pole_grn<3000';
  ClearFilter;
  Query.OnFilterRecord := nil;
//  Query.Filter   := '(date_edit_gis>date_post_gis) or (!Empty(date_edit_gis) and Empty(date_post_gis))';
  // дата корр. больше даты отправки  или  еще не передавалось в регистр
  Query.Filter   := Opeka_RequiredSendToGISRN;  // uProjectAll.pas   'date_edit_gis>date_post_gis or pole_grn<1000 or Empty(pole_grn) or (pole_grn>=2000 and pole_grn<3000)';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;
//-----------------------------------------------------------------------
procedure TfmGurnZOpeka.Event_CheckChild(Sender: TObject);
begin
  ClearFilter;
  FilterInterface.LoadAndRunFilter('Необходимо прекращение опеки или попечительства');
//  Query.OnFilterRecord := nil;
//  Query.Filter   := '(vid='+inttostr(VID_OPEKA_DO14)+' and empty(date_otm)) or '+
//                    '(vid='+inttostr(VID_POPECH_DO18)+' and empty(date_otm))';
//  Query.Filtered := true;
//  TBItemClrFlt.Enabled:=true;
end;
//-----------------------------------------------------------------------
procedure TfmGurnZOpeka.Event_FindINOpecun(Sender: TObject);
begin
  ClearFilter;
  FilterInterface.LoadAndRunFilter('Идентификационный номер опекуна(попечителя)');
end;
//-----------------------------------------------------------------------
function TfmGurnZOpeka.SetSysFilter(vPar: Variant): Boolean;
begin
  result:=Inherited SetSysFilter(vPar);
end;
//-----------------------------------------------------------------------
procedure TfmGurnZOpeka.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
var
  fld : TField;
begin
  if not Query.FieldByName('DATE_POST_GIS').IsNull then begin
    if Query.FieldByName('DATE_EDIT_GIS').AsDateTime>Query.FieldByName('DATE_POST_GIS').AsDateTime
      then AFont.Style := AFont.Style + [fsBold];
  end;
//  if (FShablonRec>0) and (Query.FieldByName('ID').AsInteger=FShablonRec) then begin
//    AFont.Color:=Grid.Color1;
//  end;
  {
  fld := Query.FindField('DATE_ANUL');
  if (fld <> nil) and not fld.IsNull then begin
    AFont.Color := clRed;
  end;
  }
//fld := Query.FindField('LICH_ID');
//if (fld <> nil) and (fld.AsInteger=1) then begin
  if not Query.FieldByName('SEND_DATE').IsNull then begin
    Background:=GetNoTransferColor;
  end;
end;

procedure TfmGurnZOpeka.GridColumnsPodr(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
{
  n:=Query.FieldByName('PODR').AsString='';
  if s<> then begin
    Params.Text := Query.FieldByName('DOLG_NAME').AsString;
  end else begin
    if dmBase.SprDolg.Locate('ID', Query.FieldByName('DOLG_SPR').AsInteger,[]) then begin
      Params.Text := dmBase.SprDolg.FieldByName('NAME').AsString;
    end
  end;
}
end;

procedure TfmGurnZOpeka.TBItemZaderClick(Sender: TObject);
begin
//  if GlobalTask.ParamAsString('ZADER_SMERT')='' then begin
    Query.Filter   := 'datez-dates>7';
//  end else begin
//    Query.Filter   := 'datez-dates>'+GlobalTask.ParamAsString('ZADER_SMERT');
//  end;
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

procedure TfmGurnZOpeka.CheckPropertyGridColumns;
var
  c : TColumnEh;
begin
  inherited CheckPropertyGridColumns;
//  c := Grid.FieldColumns['NOMER2'];
//  c.Visible:=GlobalTask.ParamAsBoolean('ADD_GL_NOMER');

//  c := Grid.FieldColumns['DATES'];
//  c.OnGetCellParams := GridColumnsGetDateS;

//  c := Grid.FieldColumns['MESTOS'];
//  if c<>nil then c.OnGetCellParams := GridColumnsGetMestoS;

  c := Grid.FieldColumns['MESTOG'];
  if c<>nil then c.OnGetCellParams := GridColumnsGetMestoG;
  c := Grid.FieldColumns['MESTOR'];
  if c<>nil then c.OnGetCellParams := GridColumnsGetMestoR;
  {$IFDEF LAIS}
  c := Grid.FieldColumns['PODR'];
  if c<>nil then c.Visible:=false;
  {$ENDIF}

end;

procedure TfmGurnZOpeka.GridColumnsGetDateR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
//    if Query.FieldByName('ONLYGOD_R').AsInteger=3 then begin
//      Params.Text:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZSmert, Query.FieldByName('ID').AsInteger, STOD('1899-12-30',tdAds),
//                              'TEXT_VOZR', ftString);
//    end else begin
//      if Params.Text<>'' then begin
//        Params.Text := DatePropisEx( Query.FieldByName('DATER').AsDateTime,
//                                     3, Query.FieldByName('ONLYGOD_R').AsInteger);
//      end;
//    end;
  end;
end;

procedure TfmGurnZOpeka.GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'RG_GOSUD,FName;RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',1);
end;

procedure TfmGurnZOpeka.GridColumnsGetMestoG(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,';GT_OBL,GT_B_OBL;GT_RAION,GT_B_RN;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1);
end;

procedure TfmGurnZOpeka.Event_POLE_GRN_3_PRICH(Sender: TObject);
begin
end;

procedure TfmGurnZOpeka.SetListParEditForm;
begin
  inherited;
  FListPar.Add('ENABLE_SKIP=1');
end;

procedure TfmGurnZOpeka.TBItemVigrClick(Sender: TObject);
{$IFDEF OPEKA }
var
  sID:String;
  sl:TStringList;
{$ENDIF}
begin              
{$IFDEF OPEKA }
  sl:=TStringList.Create;
  if GetRecordsForObrab(1, sl, sID) then begin    // 1-все отобранные записи
    RunVigrOpeka(0,sl);
  end;
  sl.Free;
{$ENDIF}
end;

procedure TfmGurnZOpeka.FormCreate(Sender: TObject);
begin
  inherited;
{$IFDEF OPEKA }
  TBItemVigr.Visible:=(GlobalTask.ParamAsInteger('PODR')>0);
{$ELSE}
  TBItemVigr.Visible:=false;
{$ENDIF}
end;



end.
