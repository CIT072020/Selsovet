unit fGurnAktZ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uTypes, fParamQuest, Variants,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uProject, uProjectAll, mPermit, fWarning, dbFunc, fEditMemo,
  TB2Item, TB2Dock, TB2Toolbar, Menus, MetaTask, FuncEh, FuncPr, ImgList, ComCtrls, fMultiChoice, SasaIniFile, QStrings,
  ExtCtrls, StdCtrls, Mask, DBCtrlsEh, TB2ToolWindow, DBLookupEh,
  uGisun, kbmMemTable;

{$I Task.inc}

type
  TfmGurnAktZ = class(TfmGurnal)
    TBToolWindow1: TTBToolWindow;
    edSeek: TDBEditEh;
    edTypeSeek: TComboBox;
    Label1: TLabel;
    edKlad: TDBLookupComboboxEh;
    dsSprZah: TDataSource;
    edBook: TDBNumberEditEh;
    Label2: TLabel;
    TBItemAddGraf: TTBItem;
    TBItem1: TTBItem;
    mtBooks: TkbmMemTable;
    mtBooksKLAD: TIntegerField;
    mtBooksBOOK: TIntegerField;
    mtBooksBOOK_DATE: TDateField;
    mtBooksBOOK_DATE_END: TDateField;
    mtBooksZH_TYPE: TSmallintField;
    mtAdres: TkbmMemTable;
    mtAdresAR_GOSUD: TIntegerField;
    mtAdresAR_OBL: TStringField;
    mtAdresAR_B_OBL: TBooleanField;
    mtAdresAR_RAION: TStringField;
    mtAdresAR_B_GOROD: TIntegerField;
    mtAdresAR_GOROD: TStringField;
    mtAdresAR_GOROD_R: TStringField;
    mtAdresAR_DOM: TStringField;
    mtAdresAR_KORP: TStringField;
    mtAdresAR_KV: TStringField;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemZaderClick(Sender: TObject);
    procedure edSeekEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure edSeekEditButtons1Click(Sender: TObject;     var Handled: Boolean);
    procedure edSeekKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure edSeekEnter(Sender: TObject);
    procedure edSeekExit(Sender: TObject);
    procedure edSeekChange(Sender: TObject);
    procedure edTypeSeekChange(Sender: TObject);
    procedure edKladChange(Sender: TObject);
    procedure edBookEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edKladEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edBookChange(Sender: TObject);
    procedure TBItemAddGrafClick(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FTypeGlobal:Integer;
    FKlad:Integer;
    FBook:Integer;
    FValues_AddGraf:String;
    FLoadCSV:Boolean;
    constructor Create(Owner : TComponent); override;
//    function  LoadQuery : Boolean; override;
    procedure CheckPropertyGridColumns; override;
    procedure GridColumnsGetDateS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetDokument(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetDateR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoSM(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoPR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoGT(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoZ(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure Event_POLE_GRN_3_PRICH(Sender: TObject);
    procedure Event_CheckZah(Sender: TObject);
    {$IFDEF ZAH}
    procedure Event_SetProv(Sender: TObject);
    {$ENDIF}
    procedure Event_SetNomerBook(Sender: TObject);
    procedure Event_LoadCheck0(Sender: TObject);
    procedure Event_LoadRecordCSV(Sender: TObject);
    procedure Event_WriteDateZ(Sender: TObject);
    procedure Event_SetGlobalNomer(Sender: TObject);
    procedure Event_InitFields(Sender: TObject);
    procedure Event_Renumber(Sender: TObject);
    procedure Event_CheckDateEdit(Sender: TObject);

    function IsRecordOkObrab(nType:Integer):Boolean; override;

    procedure RenumberGurnal(sKey:String);
    procedure SetListParEditForm; override;
    function InitGurnal: Boolean; override;

    procedure setUserFilter;
    function getAdditiveWhere : String; override;
    function getDefaultAddWhere: String; override;

    function IsSetUserFilter: Boolean; override;
    function IsRegisterGisun : Boolean; override;

    function setAdditiveFilter: Boolean; override;
    function  getAdditiveFilter:String; override;
    procedure ClearSeek;
    function getIDForTmpTable(nType:Integer;strFilter:String):Boolean;
    function GetHintSeek(n:Integer):String;
    procedure SetAddGraf;

  end;

var
  fmGurnAktZ: TfmGurnAktZ;
  TYPESEEK_GLNOMER:Integer;

const
  TYPESEEK_FIO=0;
  TYPESEEK_IN=1;
  TYPESEEK_BRON=2;
  TYPESEEK_DUBL=3;
  TYPESEEK_CH_POST=4;

implementation

uses dBase, fInitField, fmChList;

{$R *.DFM}

{ TfmGurnAktZ }

constructor TfmGurnAktZ.Create(Owner: TComponent);
var
  iniSpr:TSasaIniFile;
  s:String;
begin
  TypeEditObj := _TypeObj_AktZah;
  inherited;
  if not mtBooks.Active  then mtBooks.Open;
  if not mtAdres.Active  then mtAdres.Open;
  mtAdres.Append;
  mtAdres.Post;

  FRegisterNotRequired:=true;  // доступно "взаимодействие с ГИС РН не требуется"
  TBItemGrantSprav.Visible:=true;
  FBookmarkDel:=true; // доступно удаление отмеченных записей
  QuestDel := '  Удалить информацию о зохоронении ?  ';
  QuestDelFlt := '  Удалить отобранную информацию ?  ';
  TYPESEEK_GLNOMER:=999;
  FTypeGlobal:=GlobalTask.ParamAsInteger('ADD_GL_NOMER');

  if FTypeGlobal>0 then begin
    edTypeSeek.Items.Add('Глобальный номер');
    TYPESEEK_GLNOMER:=edTypeSeek.Items.Count-1;
    edTypeSeek.ItemIndex:=0;
  end;

  // переключим на текущую сортировку
  iniSpr:=GlobalTask.iniFile('SPR');
  if (iniSpr<>nil) and dmBase.SprZAH.Active then begin
    s:=iniSpr.ReadString('FormSpr.SprZAH.Form','INDEXNAME','');
    if (s<>'') then begin
      try
        if dmBase.SprZAH.IndexName<>s
          then dmBase.SprZAH.IndexName:=s;
      except
      end;
    end;
  end;

end;
//--------------------------------------------------------------------------------
function TfmGurnAktZ.InitGurnal: Boolean;
var
  it:TTbItem;
  pt:TPermitType;
  sep:TTbSeparatorItem;
  lAdd:Boolean;
begin
  Result:=inherited InitGurnal;
  if not Result then exit;
  FSeekAsQuery:=true;   // !!!
  FKlad:=0;
  FBook:=0;
  dsSprZah.DataSet:=dmBase.SprZAH;
  edBook.EditButtons[0].Glyph:=ImBtClear.Picture.Bitmap;
  edKlad.EditButtons[0].Glyph:=ImBtClear.Picture.Bitmap;

//  FSeekAsQuery:=false;

  CreateAdditiveWhere(getAdditiveWhere);
  CreateSysFlt_GISUN;
  {$IFDEF ZAH}
    if GlobalTask.ParamAsBoolean('ENABLE_LOAD_CSV') then begin

      it:=TTbItem.Create(TBSubSysFlt);
      it.Images:=ImageListGisun;
      it.ImageIndex:=6;
      it.Caption:= 'Статус "не проверено"';
      it.OnClick:=Event_LoadCheck0;
      TBSubSysFlt.Add(it);

      sep := TTbSeparatorItem.Create(TBSubSysFlt);
      TBSubSysFlt.Add(sep);

      it:=TTbItem.Create(TBSubSysFlt);
      it.Images:=ImageListGisun;
//      it.ImageIndex:=6;
      it.Caption:= 'Загруженные записи за ...';
      it.OnClick:=Event_LoadRecordCSV;
      TBSubSysFlt.Add(it);
    end;

  {$ENDIF}

  {
  if TBSubSysFlt.Count>0 then begin
    TBSubSysFlt.Add(TTbSeparatorItem.Create(TBSubSysFlt));
  end;

  it := TTbItem.Create(TBSubSysFlt);
  it.Caption:= 'Запись откорректирована после отправки в ГИС РН';
  it.OnClick:=Event_CheckDateEdit;
  TBSubSysFlt.Add(it);
  }

  if Role.IsCheckSubSystem then begin
    pt:=Role.CheckSubSystem(SS_ZAH);
    if ((Role.Status=rsAdmin) or (pt=ptFull)) then begin
      lAdd:=true;
    end else begin
      lAdd:=false;
    end;
  end else begin
    lAdd:=true;
  end;
  FLoadCSV:=GlobalTask.ParamAsBoolean('ENABLE_LOAD_CSV');

  if lAdd then begin
    TBSubItemRun.Visible:=true;
    if TBSubItemRun.Count>0 then begin
      sep := TTbSeparatorItem.Create(TBSubItemRun);
      TBSubItemRun.Add(sep);
    end;

    if (Role.Status=rsAdmin) then begin
      it := TTbItem.Create(TBSubItemRun);
      it.Caption:='Установить номер книги';
      it.OnClick:=Event_SetNomerBook;
      TBSubItemRun.Add(it);
    end;
    {$IFDEF ZAH}
      if FLoadCSV and (Role.Status=rsAdmin) then begin
        it := TTbItem.Create(TBSubItemRun);
        it.Caption:='Установить статус "проверено"';
        it.OnClick:=Event_SetProv;
        TBSubItemRun.Add(it);
      end;
    {$ENDIF}
    {
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Контроль места захоронения со справочником';
    it.OnClick:=Event_CheckZah;
    TBSubItemRun.Add(it);
    }

//    if not GlobalTask.ParamAsBoolean('ADD_GL_NOMER') then begin // !!!  NOMER2  !!!
      it := TTbItem.Create(TBSubItemRun);
      it.Caption:='Перенумеровать журнал';
      it.OnClick:=Event_Renumber;
      TBSubItemRun.Add(it);
//    end;

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Заполнить дату записи в журнале';
    it.OnClick:=Event_WriteDateZ;
    TBSubItemRun.Add(it);

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Изменить значение реквизита в базе';
    it.OnClick:=Event_InitFields;
    TBSubItemRun.Add(it);

    {
    if (FTypeGlobal>0) and (Role.Status=rsAdmin) then begin
      it := TTbItem.Create(TBSubItemRun);
      it.Caption:='Переписать глобальный номер';
      it.OnClick:=Event_SetGlobalNomer;
      TBSubItemRun.Add(it);
    end;
    }

  end;
{
  if TBSubSysFlt.Count>0 then begin
    TBSubSysFlt.Add(TTbSeparatorItem.Create(TBSubSysFlt));
  end;}
{
  itDop := TTbItem.Create(TBSubSysFlt);
//  itDop.Images:=ImageListGisun;
//  itDop.ImageIndex:=3;
  itDop.Caption:= 'Взаимодействие с ГИС РН завершено (с пустой причиной)';
  itDop.OnClick:=Event_POLE_GRN_3_PRICH;
  TBSubSysFlt.Add(itDop);
}
end;

//-----------------------------------------------------------------------------------------
function TfmGurnAktZ.IsSetUserFilter:Boolean;
begin
  if (FKlad>0) or (FBook>0) or (FSeekAsQuery and FSeekAsQuery_Active) then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

//-----------------------------------------------------------------------
procedure TfmGurnAktZ.Event_CheckDateEdit(Sender: TObject);
begin
// ??? function ChangeWhere( strQuery : String; strWhere : String; lAdd : Boolean) : String;
  Query.OnFilterRecord := nil;
//  Query.Filter   := '(date_edit_gis>date_post_gis) or (!Empty(date_edit_gis) and Empty(date_post_gis))';
  Query.Filter   := 'date_edit_gis>date_post_gis';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnAktZ.Event_InitFields(Sender: TObject);
var
  lFilter : Boolean;
begin
  if TBItemClrFlt.Enabled or Query.Filtered or IsSetUserFilter then begin
    lFilter := true;
  end else begin
    lFilter := false;
  end;
  if RunInitRekvisit(Self, Query, dmBase.AktZ, 'ID', lFilter, 'ZAH') then Refresh(true);
end;
//=============================================================
procedure TfmGurnAktZ.setUserFilter;
var
  s:String;
begin
  s:=CreateAdditiveWhere(getAdditiveWhere);
  FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
  FullRefresh;
end;
//----------------------------------------------------
procedure TfmGurnAktZ.edKladChange(Sender: TObject);
var
  s:String;
begin
  if not FRun then begin
    FRun:=true;
    try
      if edKlad.Value=null then FKlad:=0  else FKlad:=edKlad.Value;
      if FKlad=0 then begin
        FBook:=0;
      end else begin
        if dmBase.SprZAH.Locate('ID', FKlad, []) then begin
          FBook:=dmBase.SprZAH.FieldByName('BOOK').AsInteger;
          if FBook<=0 then FBook:=0;
        end;
      end;
      if FBook>0
        then edBook.Value:=FBook
        else edBook.Value:=null;
      setUserFilter;
    finally
      FRun:=false;
    end;
  end;
end;
procedure TfmGurnAktZ.edKladEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  FRun:=true;
  FKlad:=0;
  edKlad.Value:=0;
  FBook:=0;
  edBook.Value:=null;
  FRun:=false;
  setUserFilter;
end;
//----------------------------------------------------------------
procedure TfmGurnAktZ.edBookChange(Sender: TObject);
var
  s:String;
begin
  if not FRun then begin
    FRun:=true;
    try
      if edBook.Value=null then FBook:=0  else FBook:=edBook.Value;
      setUserFilter;
    finally
      FRun:=false;
    end;
  end;
end;
procedure TfmGurnAktZ.edBookEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  FRun:=true;
  FBook:=0;
  edBook.Value:=null;
  FRun:=false;
  setUserFilter;
end;
//----------------------------------------------------------------
function TfmGurnAktZ.getDefaultAddWhere: String;
begin
  Result:=inherited getDefaultAddWhere;
end;
//-----------------------------------------------------------------------------------------
function TfmGurnAktZ.getAdditiveWhere : String;
var
 s : String;
 procedure AddResult(sAdd:String);
 begin  if Result='' then Result:=sAdd else Result:=Result+' and '+sAdd; end;
begin
  Result:=inherited getAdditiveWhere;
  if FKlad>0 then begin
    AddResult('zh.zh_klad='+inttostr(FKlad));
  end;
  if FBook>0 then begin
    AddResult('zh.book='+inttostr(FBook));
  end;
  if FSeekAsQuery and FSeekAsQuery_Active then begin
    AddResult('zh.id in (select id from '+GetNameTmpIdTable+')');
  end;
end;
//--------------------------------------------------------------------------
function TfmGurnAktZ.getAdditiveFilter:String;
var
  strFilter,sAdd,s : String;
  nLen,n : Integer;
//  st:TSostTable;
begin
  strFilter:=Trim(edSeek.Text);
  nLen:=Length(strFilter);
  if FSeekAsQuery then begin
    if nLen=0 then begin
      Result:='';
      FSeekAsQuery_Active:=false;
    end else begin
      Result:='';
      if getIDForTmpTable(edTypeSeek.ItemIndex,strFilter) then begin

      end;
      FSeekAsQuery_Active:=true;
    end;
    s:=CreateAdditiveWhere(getAdditiveWhere);
//    if s<>'' then begin
    FNewSQL:=ChangeWhere(Query.SQL.Text, s, false);
    if (edTypeSeek.ItemIndex=TYPESEEK_DUBL) then begin        // дублирование личных номеров
      FNewSQL:=ChangeOrderBy(FNewSQL, 'LICH_NOMER');
    end;
//    end;
  end;
end;
//--------------------------------------------------------------------------
function TfmGurnAktZ.setAdditiveFilter: Boolean;
var
  strFilter : String;
//  n:Integer;
  l:Boolean;
  cur:TCursor;
begin
  result:=true;
  if FSeekAsQuery then begin
    getAdditiveFilter;
    FullRefresh(false);
  end else begin
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    strFilter:=getAdditiveFilter;
    l:=dbDisableControls(Query);
    try
      if strFilter='' then begin
        Query.Filter:='';
        Query.Filtered:=false;
        Query.OnFilterRecord:=nil;
      end else begin
        if strFilter='EVENT1' then begin
        {
          Query.Filter := '';
          strFilter:=Trim(edSeek.Text);
          n:=Pos(' ',strFilter);
          if n>0 then begin
            FSeekFamMen:=Copy(strFilter,1,n-1);
            FSeekNameMen:=Copy(strFilter,n+1,20);
          end else begin
            FSeekFamMen:=strFilter;
            FSeekNameMen:='';
          end;
          Query.OnFilterRecord:=QueryFilterRecord;
          Query.Filtered := true;
          }
        end else begin
          Query.Filter := strFilter;
          Query.OnFilterRecord:=nil;
          Query.Filtered := true;
        end;
      end;
    finally
      dbEnableControls(Query,l);
      Screen.Cursor:=cur;
    end;
  end;
  if not Query.Eof then begin
    ActiveControl := Grid;
  end;
end;

//--------------------------------------------------------------------------
procedure TfmGurnAktZ.Event_Renumber(Sender: TObject);
begin
  RenumberGurnal('KEY_SORT_ZAH');
end;
//------------------------------------------------------------
procedure TfmGurnAktZ.RenumberGurnal(sKey:String);
var
  d1:TDateTime;
  f:TfmParamQuest;
  n,m,k:Integer;
  s,ss,sWhere,sDate:String;
  sFields:String;
  lWriteObrab:Boolean;
begin
//  if GlobalTask.ParamAsBoolean('ADD_GL_NOMER') then exit;  // !!!  NOMER2  !!!

  f:=TfmParamQuest.Create(Self);
  f.Caption:='Перенумеровать журнал';
  f.AddParamEx(dmBase.getCurDate, 'С какой даты' , 'DATE1' ,'TYPE=DATE');
  if sKey<>''
    then f.AddParamEx('DATEZ', 'Тип ' , 'FIELDS' ,'TYPE=LIST~DESC='+sKey+'~WIDTH=250');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  d1:=0;
  lWriteObrab:=GlobalTask.ParamAsBoolean('WRITE_OBRAB');
  if n=1 then begin
    d1:=f.GetValue('DATE1', 'D');
    if sKey=''
      then sFields:='DATEZ'
      else sFields:=f.GetValue('FIELDS', 'C');
    if sFields=''
      then sFields:='DATEZ';
  end;
  f.Free;
  if (d1>0) and (sFields<>'') then begin //and (d2>0) then begin
    if sKey=''
      then ss:='за период с '
      else ss:='по реквизиту '+GlobalTask.CurrentOpisEdit.SeekValue(sKey,sFields,false)+' с ';

//    sDate:=QStr(DTOS(d1,tdADS)+' 00:00:00');
    sDate:=QStr(DTOS(d1,tdADS));
    //---------------------------------------------------------------------
//    s:='SELECT MIN(NOMER) FROM '+FSourceTable+' WHERE '+sFields+'<'+sDate+' and Year('+sFields+')='+sYear+' ';
    sWhere:=GetWhereQuery(Query.SQL.Text);
    if sWhere<>'' then sWhere:=sWhere+' and ';
    s:='SELECT MAX(NOMER) FROM AktZ zh WHERE '+sWhere+sFields+'<'+sDate;
    dmBase.WorkQuery.SQL.Text:=s;
    dmBase.WorkQuery.Open;
    m:=dmBase.WorkQuery.Fields[0].AsInteger+1;
    dmBase.WorkQuery.Close;
    s:='SELECT count(*) FROM AktZ zh WHERE '+sWhere+sFields+'>='+sDate;
    dmBase.WorkQuery.SQL.Text:=s;
    dmBase.WorkQuery.Open;
    n:=dmBase.WorkQuery.Fields[0].AsInteger;
    dmBase.WorkQuery.Close;
    if n=0 then begin
      ShowMessage('Записи для перенумерации не найдены');
    end else begin
    //---------------------------------------------------------------------
      f:=TfmParamQuest.Create(Self);
      f.Caption:='Найлено записей  - '+IntToStr(n);
      f.AddParamEx(m, '  Начальный номер  ' , 'FIRSTN' ,'TYPE=NUMERIC');
      f.AddButtons('Выполнить~Отказ',0);
      k:=f.ShowQuest;
      if k=1 then begin
        m:=f.GetValue('FIRSTN', 'N');
      end else begin
        m:=0;
      end;
      f.Free;
      if (m>0) then begin //   and Problem('Найдено записей: '+IntToStr(n)+' '#13'Начальный номер: '+IntToStr(m)+' '#13+       'Перенумеровать '+ss+DatePropis(d1,3)+' ? ', mtConfirmation, self) then begin
//      if dmBase._LockTypeObj(_TypeObj_AktZah,'') then begin
        try
          OpenMessage('Перенумерация ...', '', 0);
          dmBase.WorkQuery.SQL.Text:='SELECT ROWID, ID, POLE_GRN FROM AktZ zh WHERE '+sWhere+sFields+'>='+sDate+
                                     ' ORDER BY '+sFields+', NOMER';
          dmBase.WorkQuery.Open;
          dmBase.WorkQuery.First;
          while not dmBase.WorkQuery.Eof do begin
            dmBase.AdsConnection.Execute('UPDATE AktZ SET nomer='+IntToStr(m)+' WHERE rowid='+QStr(dmBase.WorkQuery.Fields[0].AsString));

            if lWriteObrab then begin
              dmBase.WriteUpdateObj(UPDATEOBJ_OBRAB, TypeEditObj, dmBase.WorkQuery.FieldByName('ID').AsInteger, 0, 'изменение номера записи на '+IntToStr(m));
            end;

            dmBase.WorkQuery.Next;
            Inc(m,1);
          end;
          dmBase.WorkQuery.Close;
        finally
          CloseMessage;
//          dmBase._UnLockTypeObj(_TypeObj_PredZapis_);
//        end;
        end;
        Refresh(false,'');
      end;
    end;
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnAktZ.Event_WriteDateZ(Sender: TObject);
var
  old : TCursor;
  s,ss : String;
  lOk: Boolean;
  n,m,k : Integer;
  lCheck:Boolean;
  f:TfmParamQuest;
  lWriteObrab:Boolean;
begin
  f:=TfmParamQuest.Create(Self);
  f.Caption:='Дата записи в журнал';
  f.AddParamEx(1, 'Добавить к дате смерти (дней)' , 'KOLVO' ,'TYPE=INTEGER~MIN=0~MAX=10~WIDTH=50');
  f.AddButtons('Выполнить~Отказ',0);
  k:=f.ShowQuest;
  n:=f.GetValue('KOLVO', 'N');
  lWriteObrab:=GlobalTask.ParamAsBoolean('WRITE_OBRAB');
  if k<>1 then exit;
  f.Free;
  s := '';
  if TBItemClrFlt.Enabled or Query.Filtered then begin
    s := s + 'ВНИМАНИЕ! с учетом установленного отбора '#13; // + Chr(13)+
  end else begin
    s := s + 'ВНИМАНИЕ! для всей базы '#13; // + Chr(13)+
  end;
  if n>0 then ss:='увеличенной на '+inttostr(n)
         else ss:='';
  s:=s+'будет заполнена дата записи в журнал.'#13;
  s:=s+'Дата записи в журнале будет равна дате смерти '+ss;
  if OkWarning(s) then begin
    m:=0;
    k:=0;
    lCheck := dbDisableControls(Query);
    Query.First;
    old := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    OpenMessage(' Подождите пожалуйста ... ','Выпонение',10);
    GlobalTask.WriteToLogFile('Начало заполнения даты записи в журнале');
    try
      while not Query.Eof do begin
        Inc(k,1);
        if Query.FieldByName('DATEZ').IsNull and not Query.FieldByName('DATES').IsNull then begin
          if dmBase.AktZ.Locate('ID',Query.FieldByName('ID').AsInteger,[]) then begin
            dmBase.AktZ.Edit;
            dmBase.AktZ.FieldByName('DATEZ').AsDateTime:=dmBase.AktZ.FieldByName('DATES').AsDateTime+n;
            dmBase.AktZ.Post;

            if lWriteObrab then begin
              dmBase.WriteUpdateObj(UPDATEOBJ_OBRAB, TypeEditObj, dmBase.AktZ.FieldByName('ID').AsInteger, 0, 'изменение даты записи на '+DatePropis(dmBase.AktZ.FieldByName('DATEZ').AsDateTime,3));
            end;

            Inc(m,1);
          end;
        end;
        Query.Next;
      end;
    finally
      CloseMessage;
      Screen.Cursor := old;
      Query.First;
      dbEnableControls(Query,lCheck);
      Refresh(true);
    end;
    GlobalTask.WriteToLogFile('Окончание заполнения даты записи в журнале, записано: '+IntToStr(m));
    ShowMessage('Просмотрено записей: '+IntToStr(k)+#13+'Заполнено '+IntToStr(m));
  end;
end;
//----------------------------------------------------------------
procedure TfmGurnAktZ.Event_SetGlobalNomer(Sender: TObject);
var
  old : TCursor;
  s,ss : String;
  lOk: Boolean;
  n,m,k : Integer;
  lCheck:Boolean;
  lWriteObrab:Boolean;
begin
  lWriteObrab:=GlobalTask.ParamAsBoolean('WRITE_OBRAB');
  if TBItemClrFlt.Enabled or Query.Filtered then begin
    s := s + 'ВНИМАНИЕ! с учетом установленного отбора '#13; // + Chr(13)+
  end else begin
    s := s + 'ВНИМАНИЕ! для всей базы '#13; // + Chr(13)+
  end;
  if FTypeGlobal=1 then begin // текущий числовой глоб. номер
    ss:='(текст->число)';
    s:=s+'будет произведена запись текстового глобального номера '#13;
    s:=s+'в числовой глобальный номер '+ss;
  end else begin              // текущий текстовый глоб. номер
    ss:='(число->текст)';
    s:=s+'будет произведена запись числового глобального номера '#13;
    s:=s+'в текстовый глобальный номер '+ss;
  end;
  if OkWarning(s+'+ДА') then begin
    m:=0;
    k:=0;
    lCheck := dbDisableControls(Query);
    Query.First;
    old := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    OpenMessage(' Подождите пожалуйста ... ','Выпонение',10);
    GlobalTask.WriteToLogFile('Начало перезаписи глобального номера '+ss);
    try
      while not Query.Eof do begin
        Inc(k,1);
        if dmBase.AktZ.Locate('ID',Query.FieldByName('ID').AsInteger,[]) then begin
          // из текстового в числовой
          if FTypeGlobal=1 then begin // текущий числовой глоб. номер NOMER2
            if not dmBase.AktZ.FieldByName('UNOMER').IsNull then begin
              dmBase.AktZ.Edit;
              ss:=dmBase.AktZ.FieldByName('UNOMER').AsString;
              Q_KeepChars(ss,'0123456789');
              try
                dmBase.AktZ.FieldByName('NOMER2').AsString:=ss;
                dmBase.AktZ.Post;
                Inc(m,1);
              except
                dmBase.AktZ.Cancel;
              end;
            end;
          end else begin
            // из числового в текстовый
            if not dmBase.AktZ.FieldByName('NOMER2').IsNull and (dmBase.AktZ.FieldByName('NOMER2').AsInteger>0) then begin
              dmBase.AktZ.Edit;
              try
                dmBase.AktZ.FieldByName('UNOMER').AsString:=dmBase.AktZ.FieldByName('NOMER2').AsString;
                dmBase.AktZ.Post;
                Inc(m,1);
              except
                dmBase.AktZ.Cancel;
              end;
            end;
          end;
//          if lWriteObrab then begin
//            dmBase.WriteUpdateObj(UPDATEOBJ_OBRAB, TypeEditObj, dmBase.AktZ.FieldByName('ID').AsInteger, 0, 'изменение глобального номера записи на '+IntToStr(m));
//          end;
        end;
        Query.Next;
      end;
    finally
      CloseMessage;
      Screen.Cursor := old;
      Query.First;
      dbEnableControls(Query,lCheck);
      Refresh(true);
    end;
    ShowMessage('Просмотрено записей: '+IntToStr(k)+#13+'Изменено '+IntToStr(m));
  end;
end;
//---------------------------------------------------------------------------------------
procedure TfmGurnAktZ.Event_LoadCheck0(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'load_check=0';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;
//---------------------------------------------------------------------------------------
procedure TfmGurnAktZ.Event_LoadRecordCSV(Sender: TObject);
var
  nCount,i,nID : Integer;
  List : TStringList;
  s:String;
begin
  List := TStringList.Create;
  OpenMessage('Сбор информации ...','');
  with dmBase.WorkQuery do begin
    SQL.Text:='SELECT TOP 100 ID,DATES,VALUE FROM BaseProp WHERE typeObj='+IntToStr(_TypeObj_LoadZah)+' ORDER BY ID DESC';
    Open;
    while not Eof do begin
      if FieldByName('ID').AsInteger>0 then begin
        List.AddObject(FieldByName('VALUE').AsString, Pointer(FieldByName('ID').AsInteger));
      end;
      Next;
    end;
    Close;
  end;
  CloseMessage;
  i:=ChoiceFromList(List,'Выберите дату', edKlad);
  if (i>-1)  then begin
    nID:=Integer(List.Objects[i]);
    Query.OnFilterRecord := nil;
    Query.Filter   := 'id_load='+IntToStr(nID);
    Query.Filtered := true;
    TBItemClrFlt.Enabled:=true;
  end;
  List.Free;
end;
//---------------------------------------------------------------------------------------
// запись подходит для групповой обработки
function TfmGurnAktZ.IsRecordOkObrab(nType:Integer):Boolean;
begin
  Result:=true;
  if nType=0 then begin
    Result:=inherited IsRecordOkObrab(nType);
  end else if nType=1 then begin
    if Query.FieldByName('LOAD_CHECK').AsString='0'    // только со статусом не проверено
      then Result:=true
      else Result:=false;
  end else if nType=2 then begin
    // true безусловно
  end;
end;
{$IFDEF ZAH}
//-------------------------------------------------------------------------
// установить статус проверено
procedure TfmGurnAktZ.Event_SetProv(Sender: TObject);
var
  nID,i,n:Integer;
  fld:TField;
  s,ss,sss,sID:String;
  sl:TStringList;
  lOk:Boolean;
begin
  sl:=TStringList.Create;
  if GetRecordsForObrab(1,sl,sID) then begin
    if Problem(' Установить статус "проверено" для записей в количестве: '+IntToStr(sl.Count), mtConfirmation, self)  then begin
      for i:=0 to sl.Count-1 do begin
        nID:=StrToInt(sl.Strings[i]);
        if dmBase.AktZ.Locate('ID', nID, []) then begin
          dmBase.AktZ.Edit;
          dmBase.AktZ.FieldByName('LOAD_CHECK').AsInteger:=1;
          dmBase.AktZ.Post;
        end;
      end;
      if sID=''
        then FullRefresh
        else Refresh(true, sID);
    end;
  end;
  sl.Free;
end;
{$ENDIF}
//-------------------------------------------------------------------------
// установить новый книги
procedure TfmGurnAktZ.Event_SetNomerBook(Sender: TObject);
var
  nOper,nGrn,nID,i,n,nCount,nBookCur,nBookNew:Integer;
  sSoob,sInfo,ss,sss,sID:String;
  Info:TOneRecZah;
  sl:TStringList;
  dNow,d:TDateTime;
  lWriteObrab:Boolean;
begin
  sl:=TStringList.Create;
  sSoob:='';
  if GetRecordsForObrab(2,sl,sID) then begin
    if Problem(' Установить номер книги для записей в количестве: '+IntToStr(sl.Count), mtConfirmation, self)  then begin
      nCount:=0;
      mtBooks.EmptyTable;
      ReadListAllBooks(mtBooks,0);  // uProjectAll.pas
      lWriteObrab:=GlobalTask.ParamAsBoolean('WRITE_OBRAB');
      dNow:=Now;
      for i:=0 to sl.Count-1 do begin
        nID:=StrToInt(sl.Strings[i]);
        if dmBase.AktZ.Locate('ID', nID, []) then begin
          with dmBase.AktZ do begin
            nBookCur:=FieldByName('BOOK').AsInteger;
            Info.Full:=FieldByName('FAMILIA').AsString+' '+FieldByName('NAME').AsString+' '+FieldByName('OTCH').AsString+' '+
                       FieldByName('LICH_NOMER').AsString+': ';
            Info.Klad:=FieldByName('ZH_KLAD').AsString;
            Info.Tip:=FieldByName('ZH_TYPE').AsInteger;
            d:=0;
            if FLoadCSV then begin
              if not FieldByName('DATEZH').IsNull then d:=FieldByName('DATEZH').AsDateTime else if not FieldByName('DATEZ').IsNull  then d:=FieldByName('DATEZ').AsDateTime;
            end else begin
              if not FieldByName('DATEZ').IsNull  then d:=FieldByName('DATEZ').AsDateTime  else if not FieldByName('DATEZH').IsNull then d:=FieldByName('DATEZH').AsDateTime;
            end;
            Info.DateZah:=d;
            nBookNew:=0;
            if Info.Klad='' then begin
              ss:='заполните место захоронения';
            end else if d=0 then begin
              ss:='заполните дату захоронения или дату записи';
            end else begin
              nBookNew:=GetNumberBook(mtBooks, Info, ss);
            end;
            if nBookNew>0 then begin
              sss:=IntToStr(nBookNew);
              if nBookCur=nBookNew then begin
                //sSoob:=sSoob+CRLF+Info.Full+' номер книги не изменился '+sss;
              end else begin
                Edit;
                FieldByName('BOOK').AsInteger:=nBookNew;
                FieldByName('DATE_EDIT_GIS').AsDateTime:=dNow;

                if lWriteObrab then begin
                  nGrn:=Gisun.GetPoleGRN(FindField('POLE_GRN'));
                  if (nGrn=rPost) then nOper:=UPDATEOBJ_OBRAB_GRN else nOper:=UPDATEOBJ_OBRAB;
                  dmBase.WriteUpdateObj(nOper, TypeEditObj, nID, nGrn, 'изменение номера книги c '+IntToStr(nBookCur)+' на '+sss);
                end;

                Post;
                if nBookCur=0
                  then ss:=' ' else ss:=' НОВЫЙ ';
                sSoob:=sSoob+CRLF+Info.Full+ss+'номер книги '+sss;
                nCount:=nCount+1;
              end;
            end else begin
              sSoob:=sSoob+CRLF+Info.Full+ss;
            end;
          end;
        end;
      end;
      if sSoob<>'' then begin
        if sID=''
          then FullRefresh
          else Refresh(true, sID);
        sSoob:='Количество измененных записей: '+IntToStr(nCount)+CRLF+StringOfChar('-',80)+sSoob;
        EditMemo(sSoob, 'Отчет;;Выход', nil, 800);
      end else begin
        ShowMessageCont('Номера книг соответствуют справочнику "Места захоронений"', Self);
      end;
    end;
  end;
  sl.Free;
end;
//---------------------------------------------------------------------------------------
procedure TfmGurnAktZ.Event_CheckZah(Sender: TObject);
var
  old : TCursor;
  s : String;
  lOk: Boolean;
  n : Integer;
  dsLich:TDataSet;
  lCheck:Boolean;
begin
  s := '';
  if TBItemClrFlt.Enabled or Query.Filtered then begin
    s := s + 'ВНИМАНИЕ! с учетом установленного отбора '#13; // + Chr(13)+
  end else begin
    s := s + 'ВНИМАНИЕ! для всей базы '#13; // + Chr(13)+
  end;
  s:=s+'будет произведена сверка со справочником мест захоронений.'#13;
  s:=s+'Для каждого места захоронения будет перезаписано:'#13;
  s:=s+'область,район,нас.пункт места захоронения.+ДА';
  if OkWarning(s) then begin
    lCheck := dbDisableControls(Query);
    Query.First;
    old := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    OpenMessage(' Подождите пожалуйста ... ','Сверка',10);
    GlobalTask.WriteToLogFile('Начало сверки базы захоронений со справочником');
    try
      while not Query.Eof do begin
        if dmBase.AktZ.Locate('ID',Query.FieldByName('ID').AsInteger,[]) then begin
          if dmBase.SprZAH.Locate('ID',dmBase.AktZ.FieldByName('ZH_KLAD').AsInteger,[]) then begin
            with dmBase.SprZAH do begin
              dmBase.AktZ.Edit;
              dmBase.AktZ.FieldByName('ZH_OBL').AsString:=FieldByName('OBL').AsString;
              dmBase.AktZ.FieldByName('ZH_RAION').AsString:=FieldByName('RAION').AsString;
              dmBase.AktZ.FieldByName('ZH_B_GOROD').AsString:=FieldByName('B_GOROD').AsString;
              dmBase.AktZ.FieldByName('ZH_GOROD').AsString:=FieldByName('GOROD').AsString;
              dmBase.AktZ.Post;

//              if lWriteObrab then begin
//                nGrn:=Gisun.GetPoleGRN(dmBase.AktZ.FindField('POLE_GRN'));
//                if (nGrn=rPost) then nOper:=UPDATEOBJ_OBRAB_GRN else nOper:=UPDATEOBJ_OBRAB;
//                dmBase.WriteUpdateObj(nOper, TypeEditObj, nID, nGrn, 'изменение номера книги c '+IntToStr(nBookCur)+' на '+sss);
//              end;

              // !!! DokumentZH_SS.AsString:=FieldByName('SS').AsString;  храниться xml-memo !!!
            end;
          end;
        end;
        Query.Next;
      end;
    finally
      CloseMessage;
      Screen.Cursor := old;
      Query.First;
      dbEnableControls(Query,lCheck);
      Refresh(true);
    end;
    GlobalTask.WriteToLogFile('Окончание сверки базы захоронений со справочником');
  end;
end;

procedure TfmGurnAktZ.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
var
  fld : TField;
begin
  try
    if not Query.FieldByName('DATE_POST_GIS').IsNull then begin
      if Query.FieldByName('DATE_EDIT_GIS').AsDateTime>Query.FieldByName('DATE_POST_GIS').AsDateTime
        then AFont.Style := AFont.Style + [fsBold];
    end;
    fld := Query.FindField('ZH_BRON');
    if (fld <> nil) and not fld.IsNull and fld.AsBoolean then begin
      AFont.Color := clBlue;
    end;
//    if Query.FieldByName('LOAD_CHECK').AsString='0'
//      then Background:=$00C4C4FF;   // светло-красный
  except
  end;
end;

procedure TfmGurnAktZ.TBItemZaderClick(Sender: TObject);
begin
//  if GlobalTask.ParamAsString('ZADER_SMERT')='' then begin
    Query.Filter   := 'datez-dates>7';
//  end else begin
//    Query.Filter   := 'datez-dates>'+GlobalTask.ParamAsString('ZADER_SMERT');
//  end;
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

procedure TfmGurnAktZ.CheckPropertyGridColumns;
var
  c : TColumnEh;
begin
  inherited CheckPropertyGridColumns;
  c := Grid.FieldColumns['NOMER2'];
  c.Visible:=GlobalTask.ParamAsInteger('ADD_GL_NOMER')=1;

  c := Grid.FieldColumns['UNOMER'];
  c.Visible:=GlobalTask.ParamAsInteger('ADD_GL_NOMER')=2;

  c := Grid.FieldColumns['DATES'];
  c.OnGetCellParams := GridColumnsGetDateS;
  c := Grid.FieldColumns['DATER'];
  c.OnGetCellParams := GridColumnsGetDateR;

  c := Grid.FieldColumns['DOKUMENT_SM'];
  c.OnGetCellParams := GridColumnsGetDokument;

  c:=Grid.FieldColumns['LOAD_CHECK'];
  if c<>nil then begin
    {$IFDEF ZAH}
      c.Visible:=GlobalTask.ParamAsBoolean('ENABLE_LOAD_CSV');
    {$ELSE}
      c.Visible:=false;
    {$ENDIF}
  end;
//    c:=Grid.FieldColumns['ID_LOAD'];
//    if col<>nil then begin
//    end;

  c := Grid.FieldColumns['DECL_ADRES'];
  if c<>nil then c.OnGetCellParams := GridColumnsGetMestoGT;

  c := Grid.FieldColumns['MESTO_PR'];
  if c<>nil then c.OnGetCellParams := GridColumnsGetMestoPR;

//  c := Grid.FieldColumns['MESTOG'];
//  if c<>nil then c.OnGetCellParams := GridColumnsGetMestoG;

//  if Pos(';GT_;' ,FValues_AddGraf)>0 then begin
//    c := Grid.FieldColumns['MESTO_GT'];
//    if c<>nil then c.OnGetCellParams := GridColumnsGetMestoGT;
//  end;
//  if Pos(';SM_;' ,FValues_AddGraf)>0 then begin
//    c := Grid.FieldColumns['MESTO_SM'];
//    if c<>nil then c.OnGetCellParams := GridColumnsGetMestoSM;
//  end;
//  if Pos(';PR_;' ,FValues_AddGraf)>0 then begin
//    c := Grid.FieldColumns['MESTO_PR'];
//    if c<>nil then c.OnGetCellParams := GridColumnsGetMestoPR;
//  end;

  c := Grid.FieldColumns['MESTOZ'];
  if c<>nil then c.OnGetCellParams:=GridColumnsGetMestoZ;

  {$IFDEF LAIS}
    c := Grid.FieldColumns['PODR'];
    if c<>nil then c.Visible:=false;
  {$ENDIF}

end;
//--------------------------------------------------------------------------
procedure TfmGurnAktZ.GridColumnsGetDokument(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  s,ss:String;
begin
  if not EditMode then begin
    s:='';
    if Query.FieldByName('SVID_DOK').AsInteger<=1 then begin
      s:='свид. о смерти ';
    end else begin
      // !!!  обработка  если другой тип документа
    end;
    if Query.FieldByName('DATESV').IsNull
      then ss:=''
      else ss:=' от '+DatePropis( Query.FieldByName('DATESV').AsDateTime, 3);
    Params.Text := s+'№'+ Query.FieldByName('SVID_NOMER').AsString+ss+' '+Query.FieldByName('SVID_ZAGS').AsString;
  end;
end;
//--------------------------------------------------------------------------
procedure TfmGurnAktZ.GridColumnsGetDateS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
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

procedure TfmGurnAktZ.GridColumnsGetDateR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
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

procedure TfmGurnAktZ.GridColumnsGetMestoGT(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('GT_IS_TEXT').AsBoolean
    then Params.Text:=Query.FieldByName('GT_TEXT').AsString
    else Params.Text:=dmBase.GetAdresAkt3(Query,'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1);
end;
procedure TfmGurnAktZ.GridColumnsGetMestoSM(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'SM_GOSUD,FName;SM_OBL,SM_B_OBL;SM_RAION;SM_GOROD,SM_B_GOROD;',1);
end;
procedure TfmGurnAktZ.GridColumnsGetMestoPR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  s:String;
  nID:Integer;
begin
  try
    nID:=Query.FieldByName('ID').AsInteger;
  except
    nID:=0;
  end;
  if (nID>0) and dmBase.AktZ.Locate('ID', nID, []) then begin
    s:=dmBase.AktZ.FieldByName('ADD_FIELDS').AsString;
    if s<>'' then begin
      mtAdres.Edit;
      mtAdresAR_GOSUD.AsString:=getFieldXML('PR_GOSUD', s);
      mtAdresAR_OBL.AsString:=getFieldXML('PR_OBL', s);
      mtAdresAR_B_OBL.AsString:=getFieldXML('PR_B_OBL', s);
      mtAdresAR_RAION.AsString:=getFieldXML('PR_RAION', s);
      mtAdresAR_B_GOROD.AsString:=getFieldXML('PR_B_GOROD', s);
      mtAdresAR_GOROD.AsString:=getFieldXML('PR_GOROD', s);
      mtAdresAR_GOROD_R.AsString:=getFieldXML('PR_GOROD_R', s);
      mtAdresAR_DOM.AsString:=getFieldXML('PR_DOM', s);
      mtAdresAR_KORP.AsString:=getFieldXML('PR_KORP', s);
      mtAdresAR_KV.AsString:=getFieldXML('PR_KV', s);
      mtAdres.Post;
      Params.Text:=dmBase.GetAdresAkt3(mtAdres,'AR_GOSUD,FName;AR_OBL,AR_B_OBL;AR_RAION;AR_GOROD,AR_B_GOROD;AR_GOROD_R,AR_*',1);
    end else begin
      Params.Text:='';
    end;
  end;
end;

procedure TfmGurnAktZ.GridColumnsGetMestoZ(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
//var
//  s:String;
begin
//  s := dmBase.GetAdresAkt3(Query,'ZH_GOSUD,FName;ZH_OBL,ZH_B_OBL;ZH_RAION;ZH_GOROD,ZH_B_GOROD;',1);
  Params.Text:=GetMestoZAH(Query, 'ZH_KLAD;ZH_UCH;ZH_RAD;ZH_MOG',1);
end;

//procedure TfmGurnAktZ.GridColumnsGetMestoG(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
//begin
//  Params.Text := dmBase.GetAdresAkt3(Query,'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_B_RN;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1);
//end;

procedure TfmGurnAktZ.Event_POLE_GRN_3_PRICH(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'pole_grn>=3000 and pole_grn<4000 and lich_id=1';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;
//-------------------------------------------------------
procedure TfmGurnAktZ.SetListParEditForm;
begin
  inherited;
  FListPar.Add('ENABLE_SKIP=1');
end;
//-------------------------------------------------------
procedure TfmGurnAktZ.edSeekEditButtons0Click(Sender: TObject;   var Handled: Boolean);
begin
  SetAdditiveFilter;
end;
//-------------------------------------------------------
procedure TfmGurnAktZ.edSeekEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  ClearSeek;
end;
//----------------------------------------------------------------------------------
procedure TfmGurnAktZ.ClearSeek;
begin
  FRun:=true;
  edTypeSeek.ItemIndex:=0;
  edSeek.Text:='';
  FRun:=false;
  setAdditiveFilter;
end;

//-------------------------------------------------------
procedure TfmGurnAktZ.edSeekKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Key=VK_RETURN) and (Shift=[]) then begin
    SetAdditiveFilter;
  end else if (Key=VK_TAB) and (Shift=[]) then begin
    ActiveControl := Grid;
    Key:=0;
  end;
end;
//-------------------------------------------------------
procedure TfmGurnAktZ.edSeekEnter(Sender: TObject);
begin
  if (edTypeSeek.ItemIndex=TYPESEEK_IN) then begin
    ActivateENGKeyboard;
  end else begin
    ActivateRUSKeyboard;
  end;
end;
//-------------------------------------------------------
procedure TfmGurnAktZ.edSeekExit(Sender: TObject);
begin
  ActivateRUSKeyboard;
end;
//-------------------------------------------------------
procedure TfmGurnAktZ.edSeekChange(Sender: TObject);
begin
  if (Trim(edSeek.Text)='') and not FRun then begin
    SetAdditiveFilter;
    ActiveControl:=edSeek;
  end;
end;
//------------------------------------------------------------------------------
function TfmGurnAktZ.getIDForTmpTable(nType: Integer;  strFilter: String): Boolean;
var
  slSQL:TStringList;
  sFam,sName,sOper,sOp,s1,s2:String;
  sMonth, sYear:String;
  n:Integer;
  function getWhere(sFam,sName:String):String;
  begin
    if sOper='*' then Result:='FAMILIA LIKE '+QStr(sFam+'%')
                 else Result:='FAMILIA='+QStr(sFam);

    if sName<>'' then begin
      if sOper='*' then Result:=Result+' and NAME LIKE '+QStr(sName+'%')
                   else Result:=Result+' and NAME='+QStr(sName);

    end;
  end;
begin
  Result:=false;
  OpenMessage('    Поиск ...     ','',10);
  try
    slSQL:=TStringList.Create;
    slSQL.Add('DELETE FROM &tmp&;');
    sOper:=Copy(strFilter,1,1);
//    if (sOper='=') or (sOper='<') or (sOper='>') or (sOper='*')
    if (sOper='=') or (sOper='*') or (sOper='<') or (sOper='>') or (sOper='-')
      then strFilter:=Copy(strFilter,2,Length(strFilter))
      else sOper:='*';

    n:=Pos(' ',strFilter);

    if n>0 then begin
      sFam:=Copy(strFilter,1,n-1);
      sName:=Copy(strFilter,n+1,30);
    end else begin
      sFam:=strFilter;
      sName:='';
    end;
    if (nType=TYPESEEK_FIO) then begin
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM AktZ WHERE '+getWhere(sFam,sName)+';');
      {
      if GlobalTask.ParamAsBoolean('SEEK_WITH_HIST') then begin
        if sOper='*' then s1:='VALUE LIKE '+QStr(sFam+'%')
                     else s1:='VALUE='+QStr(sFam);
        slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM HistoryZags WHERE '+
                  'typeobj='+IntToStr(_TypeObj_Nasel)+' and fieldname='+QStr('FAMILIA')+' and '+s1+';');
      end;
      }
    end else if (nType=TYPESEEK_IN) then begin        // личный номер
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM AktZ WHERE LICH_NOMER='+QStr(strFilter)+';');
    end else if (nType=TYPESEEK_BRON) then begin        // личный номер + состав семьи
      sFam:=ANSIUpperCase(sFam);
      sName:=ANSIUpperCase(sName);
      if sOper='*' then s1:='Upper(add_fields) LIKE '+QStr('%<FAMILIA>'+sFam+'%')
                   else s1:='Upper(add_fields) LIKE '+QStr('%<FAMILIA>'+sFam+'</FAMILIA>%');
      if sName<>'' then begin
        if sOper='*' then s1:=s1+' and Upper(add_fields) LIKE '+QStr('%<NAME>'+sName+'%')
                     else s1:=s1+' and Upper(add_fields) LIKE '+QStr('%<NANE>'+sName+'</NAME>%');
      end;
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM AktZ WHERE '+s1+';');
    end else if (nType=TYPESEEK_DUBL) then begin        // дублирование личных номеров
      if Length(strFilter)=14
        then s1:='and lich_nomer='+QStr(strFilter) else s1:='';
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM AktZ WHERE '+
      'lich_nomer in (select lich_nomer from AktZ where lich_nomer is not null and length(lich_nomer)=14 '+s1+' group by 1 having count(*)>1)');
    end else if (nType=TYPESEEK_CH_POST) then begin        // откорректировано после отправки в регистр
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM AktZ WHERE date_edit_gis>date_post_gis and date_post_gis is not null');
    end else if (nType=TYPESEEK_GLNOMER) then begin
      if FTypeGlobal=1
        then slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM AktZ WHERE NOMER2='+strFilter+';')
        else slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM AktZ WHERE UNOMER='+QStr(strFilter)+';');
     {
    end else if (nType=TYPESEEK_VOZR) then begin
      if sOper='*' then  sOper:='=';
      if IsAllDigitEx(strFilter,0) and (strFilter<>'') and (sOper<>'-') then begin
        if FVozrast2=FVozrast1 then begin
          s1:='GetVozrast(curdate(),dater)='+InttoStr(FVozrast1);
        end else if FVozrast1<=0 then begin
          s1:='GetVozrast(curdate(),dater)<='+InttoStr(FVozrast2);
        end else if (FVozrast2=0) and (FVozrast1>0) then begin
          s1:='GetVozrast(curdate(),dater)>='+InttoStr(FVozrast1);
        end else begin
          s1:='GetVozrast(curdate(),dater)>='+InttoStr(FVozrast1)+' and GetVozrast(curdate(),dater)<='+InttoStr(FVozrast2);
        end;
        slSQL.Add('INSERT INTO &tmp& (ID) SELECT id from sostavsem s'#13+
                  '  WHERE (iskl is null or iskl=false)'#13+
                  '  GROUP BY 1 '#13+
                  '  HAVING sum(IIF('+s1+',1,0))'+sOper+strFilter);
      end;   }
    end;

    TmpQuery.SQL.Text:=StringReplace( slSQL.Text, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);
    slSQL.Free;
//    memowrite('last_tmp.sql',TmpQuery.SQL.Text);
    s1:=KodGurnal+' create find: '+TmpQuery.SQL.Text;
    TmpQuery.ExecSQL;
    TmpQuery.SQL.Text:='SELECT COUNT(*) FROM '+GetNameTmpIdTable;
    TmpQuery.Open;
    GlobalTask.WriteToLogFile(s1+', recordcount='+TmpQuery.Fields[0].AsString, nil, LOG_SQL);
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
//--------------------------------------------------------------
function TfmGurnAktZ.GetHintSeek(n: Integer): String;
begin
  case n of
    TYPESEEK_FIO      : Result:='Фамилия Имя';
    TYPESEEK_IN       : Result:='Идентификационный номер';
    TYPESEEK_BRON     : Result:='Фамилия Имя человека из брони';
    TYPESEEK_DUBL     : Result:='* - найди все дубликаты';
    TYPESEEK_CH_POST  : Result:='* - дата корректировки больше даты отправки в регистр';
  else
    if n=TYPESEEK_GLNOMER then begin
      Result:='Глобальный номер';
    end else begin
      Result:='';
    end;
  end;
end;
//--------------------------------------------------------------
procedure TfmGurnAktZ.edTypeSeekChange(Sender: TObject);
begin
  FRun:=true;
  try
    edSeek.Hint:=GetHintSeek(edTypeSeek.ItemIndex);
    if (edTypeSeek.ItemIndex=TYPESEEK_DUBL) or (edTypeSeek.ItemIndex=TYPESEEK_CH_POST) then begin
      edSeek.Text:='*';
      setAdditiveFilter;
      ActiveControl:=Grid;
    end else begin
      edSeek.Text:='';
      if FSeekAsQuery_Active then begin
        setAdditiveFilter;
      end;
      ActiveControl:=edSeek;
    end;
  finally
    FRun:=false;
  end;
end;
//---------------------------------------------------
procedure TfmGurnAktZ.SetAddGraf;
var
  f:TfmMultiChoice;
begin
  f := TfmMultiChoice.Create(Self);
  f.FFieldName:='';
  f.Caption:='Настроить графы';
  f.AddValue('GT_','Место жительства заявителя');
  f.AddValue('SM_','Место смерти');
  f.AddValue('PR_','Последнее место жительства');
  f.SetValues(FValues_AddGraf);
  if f.ShowModal=mrOk then begin
    FValues_AddGraf:=f.GetValues;
    CheckPropertyGridColumns;
  end;
  f.Free;
  Application.ProcessMessages;
end;
//---------------------------------------------------
procedure TfmGurnAktZ.TBItemAddGrafClick(Sender: TObject);
begin
  SetAddGraf;
end;
//---------------------------------------------------
function TfmGurnAktZ.IsRegisterGisun : Boolean;
begin
  if Query.FieldByName('LOAD_CHECK').AsString='0'
    then Result:=false
    else Result:=true;
end;


procedure TfmGurnAktZ.TBItem1Click(Sender: TObject);
begin
  if problem('на существующую ?')
    then Refresh(true, Query.FieldByName('ID').AsString)
    else Refresh(true, '99999999');
end;

end.
