unit fGurnAlfKn;
 
interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, fMultiChoice,
  TB2Item, TB2Dock, TB2Toolbar, dBase, StdCtrls, Mask, DBCtrlsEh, ifpii_dbfunc, uTypes,
  TB2ToolWindow, FuncPr, dbFunc, uProjectAll, vchDBCtrls, PrnDbgeh, Menus, SasaIniFile, MetaTask, mPermit,
  kbmMemTable, fmProgress, ImgList, ComCtrls, ExtCtrls;

type
  TfmGurnAlfKn = class(TfmGurnal)
    TBToolWindow1: TTBToolWindow;
    edSeek: TDBEditEh;
    lbSost: TLabel;
    TBItemEmptyAdres: TTBItem;
    TBItemCountMens: TTBItem;
    tbProp: TkbmMemTable;
    edFind: TComboBox;
    procedure edSeekChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GridColumnsGetLgot(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsCountMens(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsListMens(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetPassport(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure edSeekKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure edSeekEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure TBItemEmptyAdresClick(Sender: TObject);
    procedure TBItemCountMensClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure TBItemPunktsClick(Sender: TObject);
    procedure TBSubmenuPunktsClick(Sender: TObject);
    procedure TBItemClearPunktsClick(Sender: TObject);
    procedure edSeekEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure edFindChange(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateParAddMen;
  public
    FSeekCountMens  : Integer;
    FSeekOper:String;
    FTypeCountMens    : String;
    FVisibleCountMens : Boolean;
    FVisibleListMens  : Boolean;
    FVisibleOwners    : Boolean;
    FParAdd:String;
    FAddOtnosh : Boolean;
    FAddDateR  : Boolean;
    FAddDateP  : Boolean;
    FAddLgot   : Boolean;
    FAddIN     : Boolean;
    FAddPasp   : Boolean;
    FAddFirst  : Boolean;
    FAddAllMens:Boolean;

    procedure Event_InitFields(Sender: TObject);
    procedure SaveToIni; override;
    procedure CheckCountMens;
    procedure LoadFromIni; override;
    function  LoadQuery : Boolean; override;
    procedure QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure Event_NewNomerLic(Sender: TObject);
    procedure Event_ClearZakl(Sender: TObject);
    procedure Event_RaschetZakl(Sender: TObject);
    procedure Event_AutoSumVSEGO(Sender: TObject);

    procedure EditSeekChange;

    function  getIDForTmpTable(nType:Integer; strFilter:String; sOper:String):Boolean;
    function  getAdditiveWhere: String; override;
    function  getDefaultAddWhere: String; override;
    procedure GridColumnsGetOwners(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure SetFilter;
    procedure RunEnterSeek;

    //    procedure GridColumnsGetAdres(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    constructor Create(Owner : TComponent); override;
  end;

const
  MENS_1_ALL        = 1;
  MENS_1_PRESENT    = 2;
  MENS_1_NOTPRESENT = 3;
  MENS_2_ALL        = 1;
  MENS_2_PROPIS     = 2;
  MENS_2_NOTPROPIS  = 3;

var
  fmGurnAlfKn: TfmGurnAlfKn;

implementation

uses fMain, fTypeCountMens, fClearZakl, fWarning, fInitField, StrUtils;

{$R *.DFM}

{ TfmGurnAlfKn }

constructor TfmGurnAlfKn.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_Lich;
  FTypeCountMens:= '';
  FSeekCountMens:=0;
  FSeekOper:='';
  FVisibleCountMens := false;
  FVisibleListMens  := false;
  FVisibleOwners    := false;
  FAddOtnosh := false;
  FAddDateR  := false;
  FAddLgot   := false;
  FAddIN     := false;
  FAddPasp   := false;
  FAddDateP  := false;
  FAddFirst  := false;
  FAddAllMens:= false;
  FParAdd:='';
  //  edFind.ItemIndex:=0;
  inherited;
//  CreateChild;
  FSeekAsQuery:=true;
  FFirstID:=true;
  QuestDel := '  Удалить текущий лицевой счет ?  ';
  FEnabledUnionFIO:=true;
  FEnabledUnionAdres:=true;
  edSeek.EditButtons[0].Visible:=FSeekEnter;
end;

//--------------------------------------------------------------
function TfmGurnAlfKn.LoadQuery: Boolean;
var
 it  : TTbItem;
 sep : TTbSeparatorItem;
begin
  Result := inherited LoadQuery;
  if Result then begin
    lbSost.Caption := dmBase.NameSostFromDate( Query.FieldByName('DATE_FIKS').AsDateTime );
  end;                       
  TBItemSum.Visible:=true;
  if (Role.Status = rsAdmin) then begin //and (DateFiks=dmBase.GetDateCurrentSost) then begin
    TBSubItemRun.Visible:=true;

    if TBSubItemRun.Count>0 then begin
      sep := TTbSeparatorItem.Create(TBSubItemRun);
      TBSubItemRun.Add(sep);
    end;
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Изменить значение реквизита в базе';
    it.OnClick:=Event_InitFields;
    TBSubItemRun.Add(it);

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Перенумеровать лицевые счета';
    it.OnClick:=Event_NewNomerLic;
    TBSubItemRun.Add(it);

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Очистить закладку "Показатели" ';
    it.OnClick:=Event_ClearZakl;
    TBSubItemRun.Add(it);

    TBSubItemRun.Add( TTbSeparatorItem.Create(TBSubItemRun) );
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Рассчитать всего земли';
    it.OnClick:=Event_AutoSumVSEGO;
    TBSubItemRun.Add(it);

  end;
end;

//--------------------------------------------------------------
procedure TfmGurnAlfKn.Event_NewNomerLic(Sender: TObject);
var
  old : TCursor;
  s : String;
  lOk: Boolean;
  n : Integer;
  dsLich:TDataSet;
  lCheck:Boolean;
begin
  s := '';
  if TBItemClrFlt.Enabled or Query.Filtered or (FFilter_Punkt<>'') or (FSysFltCaption<>'') then begin
    s := s + 'ВНИМАНИЕ! с учетом установленного отбора '#13; // + Chr(13)+
  end else begin
    s := s + 'ВНИМАНИЕ! для всей базы '#13; // + Chr(13)+
  end;
  s:=s+'будет произведена перенумерация лицевых счетов.'#13;
  s := s + 'Введите начальный номер в поле ввода'#13;
  if OkWarningEx(s,1) then begin
    n:=1;
    CharDel(s,' ');
    lOK:=true;
    try
      n:=StrToInt(s);
    except
      lOK:=false;
      PutError('Ошибка начального номера.');
    end;
    if n>5000000 then begin
      lOK:=false;
      PutError('Слишком большой начальный номер.');
    end;
    if lOk then begin
      lCheck := dbDisableControls(Query);
      Query.First;
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      OpenMessage(' Подождите пожалуйста ... ','Перенумерация',10);
      GlobalTask.LogFile.WriteToLogFile('Начало перенумерании базы лицевых счетов');
      try
        while not Query.Eof do begin
          dsLich:=dmBase.GetLichSchet( DateFiks, Query.FieldByName('ID').AsString);
          if dsLich<>nil then begin
            dsLich.Edit;
            dsLich.FieldByName('NOMER').AsInteger:=n;
            n:=n+1;
            dsLich.Post;
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
      GlobalTask.LogFile.WriteToLogFile('Окончание перенумерании базы лицевых счетов');
    end;
  end;
end;

//--------------------------------------------------------------
procedure TfmGurnAlfKn.Event_AutoSumVSEGO(Sender: TObject);
var
  old : TCursor;
  s,sSQL,sFld,s1,s2,sPokaz : String;
  lOk: Boolean;
  n,i,nID : Integer;
  dsLich:TDataSet;
  lCheck:Boolean;
  slFields:TStringList;
  nValue:Extended;
begin
  sPokaz:='VSEGO';
  slFields:=TStringList.Create;
  StrToStrings(GlobalTask.ParamAsString('AUTOSUM_VSEGO'),slFields,';',true);
  if slFields.Count=0 then begin
    ShowMessageCont('Нет отмеченных реквизитов для суммирования',self);
    slFields.Free;
    exit;
  end;
  s1:='';
  s2:='';
  for i:=1 to slFields.Count do begin
    sFld:=slFields.Strings[i-1];
    s:=IntToStr(i);
    s1:=s1+'IsNull(p'+s+'.nvalue,0)+';
    s2:=s2+StringReplace('left join базаСвойствОбъектов pXX on pXX.date_fiks=l.date_fiks and pXX.id=l.id and pXX.typeobj=2 and pXX.pokaz=','XX',s,[rfReplaceAll])+QStr(sFld)+#13#10;
  end;
  sSQL:='SELECT l.id, l.nomer, '+Copy(s1,1,Length(s1)-1)+' as Summa from ЛицевыеСчета l'#13#10+
        s2+#13#10+
        'where l.date_fiks='+DateToSQL(DateFiks)+' and l.id=:par';
  s := '';
  MemoWrite('run.sql',sSQL);
  if TBItemClrFlt.Enabled or Query.Filtered or (FFilter_Punkt<>'') or (FSysFltCaption<>'') then begin
    s := s + 'ВНИМАНИЕ! с учетом установленного отбора '#13; // + Chr(13)+
  end else begin
    s := s + 'ВНИМАНИЕ! для всей базы '#13; // + Chr(13)+
  end;
  s:=s+'будет произведен расчет реквизита "всего земли".'#13;
  if OkWarning(s) then begin
    n:=0;
    lOK:=true;
    if lOk then begin
      lCheck := dbDisableControls(Query);
      Query.First;
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      OpenMessage(' Подождите пожалуйста ... ','Расчет',10);
      GlobalTask.LogFile.WriteToLogFile('Начало расчета реквизита "всего земли"');
      dmBase.WorkQuery.SQL.Text:=sSQL;
      dmBase.WorkQuery.ParamByName('par').DataType:=ftInteger;
      //showmessage(inttostr(dmBase.WorkQuery.ParamCount));
      try
        while not Query.Eof do begin
          nID:=Query.FieldByName('ID').AsInteger;
          dmBase.WorkQuery.ParamByName('par').AsInteger:=nID;
          dmBase.WorkQuery.Prepare;
          dmBase.WorkQuery.Open;
          if dmBase.WorkQuery.FieldByName('SUMMA').AsFloat>0
            then dmBase.WriteValueProp(sPokaz, dmBase.WorkQuery.FieldByName('SUMMA').AsFloat, DateFiks, nID, _TypeObj_Lich, ftFloat)
            else dmBase.DeleteProp(DateFiks, nID, sPokaz, ftFloat);
          dmBase.WorkQuery.Close;
          n:=n+1;
          Query.Next;
          Application.ProcessMessages;
        end;
      finally
        CloseMessage;
        Screen.Cursor := old;
        Query.First;
        dbEnableControls(Query,lCheck);
        Refresh(true);
      end;
      GlobalTask.LogFile.WriteToLogFile('Окончание расчета реквизита "всего земли", рассчитано '+IntToStr(n)+' лицевых счетов');
    end;
  end;
  slFields.Free;
end;
//--------------------------------------------------------------
procedure TfmGurnAlfKn.Event_ClearZakl(Sender: TObject);
var
  f : TfmClearZakl;
//  arrClear : array[0..4] of Boolean;
  strSQL : String;
  old : TCursor;
  s,ss,sss,sErr : String;
  lAll,lOk,l : Boolean;
  i:Integer;
begin
  sErr:='';
  lOk:=false;
  f := TfmClearZakl.Create(nil);
  {
  !!! dmLichSchet может быть еще не создан !!!
  s:='';
  for i:=0 to fmMain.dmLichSchet.ListDopRazdel.Count-1 do begin
    s:=s+fmMain.dmLichSchet.ListDopRazdel.Strings[i]+',';
  end;
  f.FRazdel:=s;
  }
  f.FRazdel:='11';
  f.FTypeObj:=_TypeObj_Lich;
  f.CreateListProp;
  if f.EditModal then begin
    lOk := true;
  end;
  if lOk then begin
    s := '';
    if TBItemClrFlt.Enabled or Query.Filtered  or (FFilter_Punkt<>'') or (FSysFltCaption<>'') then begin
      s := s + 'ВНИМАНИЕ! с учетом установленного отбора '; // + Chr(13)+
      lAll:=false;
    end else begin
      s := s + 'ВНИМАНИЕ! для всей базы'; // + Chr(13)+
      lAll:=true;
    end;

    s:=s+#13'будет очищена закладка "Показатели":'#13;
    {
    if arrClear[0] then s := s + 'Животноводство  А. Наличие основных видов скота и птицы'#13;
    if arrClear[1] then s := s + 'Животноводство  Б. Производство продукции за год'#13;
    if arrClear[2] then s := s + 'Земля  А. Земля'#13;
    if arrClear[3] then s := s + 'Земля  Б. Посевная площадь'#13;
    if arrClear[4] then s := s + 'Земля  В. Производство продукции'#13;
    }
    s := s + 'Если Вы уверены введите слово ДА в поле ввода'#13;
    if OkWarning(s) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      OpenMessage(' Подождите пожалуйста ... ','Удаление',10);
      sss:='';
      //---------------------
      if not lAll then begin
        l:=dbDisableControls(Query);
        Query.First;
        ss:='';
        while not Query.Eof do begin
          ss:=ss+Query.FieldByName('ID').AsString+',';
          Query.Next;
        end;
        ss:=ss+'-1';
        Query.First;
        dbEnableControls(Query,l);
        sss:=' and id in ('+ss+')';
      end;
      //---------------------
      GlobalTask.LogFile.WriteToLogFile('Удаление закладки "Показатели" базы лицевых счетов');
      try
        strSQL:='DELETE FROM БазаСвойствОбъектов WHERE date_fiks=''1899-12-30'' and ';
        s:='';
        for i:=0 to f.clProp.Count-1 do begin
          if f.clProp.Checked[i] and not f.clProp.Header[i] then begin
            s:=s+' or POKAZ='+QStr(f.slProp.Strings[i]);
          end;
        end;
        strSQL:=dmBase.CheckDateFiksSQL(strSQL, DateFiks);
        strSQL:=strSQL+'('+Copy(s,5,Length(s))+') '+sss;
        GlobalTask.LogFile.WriteToLogFile(strSQL);
//        showmessage(strSQL);
        try
          dmBase.AdsConnection.Execute(strSQL);
        except
          on E:Exception do begin
            sErr:=E.Message;
          end;
        end;
        {
        if arrClear[0] then begin
          if dmBase.LoadSQL('УдЗакл_Животноводство_А',strSQL) then begin
            strSQL := dmBase.CheckDateFiksSQL(strSQL, DateFiks);
            dmBase.AdsConnection.Execute(strSQL);
          end;
        end;
        }
      finally
        CloseMessage;
        Screen.Cursor := old;
      end;
      if sErr<>'' then begin
        GlobalTask.LogFile.WriteToLogFile(sErr);
        PutError(sErr);
      end;
//      GlobalTask.LogFile.WriteToLogFile('Окончание удаления закладки "Показатели" базы лицевых счетов');
    end;
  end;
  f.Free;
end;

procedure TfmGurnAlfKn.Event_RaschetZakl(Sender: TObject);
{var
  f : TfmClearZakl;
  arrRaschet : array[0..2] of Boolean;
  old : TCursor;
  s : String;
  lOk, lCheck, lErr : Boolean;
  nPos, nID : Integer;
  vResult : Variant;
}
begin
{
  lOk := false;
  f := TfmClearZakl.Create(nil);
  f.Caption:='Расчет закладки "Животноводство" и "Земля"';
  f.cbG1.Enabled:=false;
  f.cbZ1.Enabled:=false;
//  f.cbZ2.Enabled:=false;
  if f.EditModal then begin
    arrRaschet[0] := f.cbG2.Checked;
    arrRaschet[1] := f.cbZ3.Checked;
    arrRaschet[2] := f.cbZ2.Checked;   // посевная площадь
    lOk := true;
  end;
  f.Free;
  if lOk then begin
    s := '';
    if TBItemClrFlt.Enabled or Query.Filtered  or (FFilter_Punkt<>'') then begin
      s := s + 'ВНИМАНИЕ! с учетом установленного отбора '#13'будут расчитаны закладки:'#13; // + Chr(13)+
    end else begin
      s := s + 'ВНИМАНИЕ! для всей базы будут расчитаны закладки:'#13; // + Chr(13)+
    end;
    if arrRaschet[0] then s := s + 'Животноводство  Б. Производство продукции за год'#13;
    if arrRaschet[2] then s := s + 'Земля  Б. Посевная площадь'#13;
    if arrRaschet[1] then s := s + 'Земля  В. Производство продукции'#13;
    s := s + 'Если Вы уверены введите слово ДА в поле ввода'#13;
    if OkWarning(s) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      tbProp.Active := false;
      if tbProp.FieldDefs.Count=0 then begin
        if dmBase.CreateTableDopProps(tbProp,dmBase.TypeObj_Lich, '1,2' ) then begin
          tbProp.Active:=true;
        end;
      end else begin
        tbProp.Active := true;
      end;
      GlobalTask.LogFile.WriteToLogFile('Расчет закладок базы лицевых счетов');
      CreateProgress('Подождите пожалуйста ...','Расчет',Query.RecordCount);
      lCheck := dbDisableControls(Query);
      Query.First;
      nPos:=1;
      vResult:=true;
      // найдем DataSet  tbProp
      GlobalTask.Script.RunEx('SETTMPDATASET1',['fmGurnAlfKn.tbProp'],vResult);
      try
        while not Query.Eof do begin
          tbProp.Append;
          nID := Query.FieldByName('ID').AsInteger;
          if arrRaschet[0] then
            dmBase.ReadPropFields(dmBase.TypeObj_Lich,'1',DateFiks,nID,tbProp,lErr);
          if arrRaschet[1] or arrRaschet[2] and not lErr then
            dmBase.ReadPropFields(dmBase.TypeObj_Lich,'2',DateFiks,nID,tbProp,lErr);
          ChangeProgress(nPos,'Расчет лиц.счета: '+Query.FieldByName('NOMER').AsString);
          //---- расчет ------------
          GlobalTask.Script.Run('RASCHET_LICH_ZAKL',[arrRaschet[0],arrRaschet[1],arrRaschet[2]],vResult);
          //------------------------
          dmBase.WriteProp(DateFiks,nID,tbProp,'',dmBase.TypeObj_Lich);
          tbProp.Cancel;
          Query.Next;
          Inc(nPos,1);
        end;
      finally
        CloseProgress;
        Screen.Cursor := old;
        Query.First;
        dbEnableControls(Query,lCheck);
      end;
      GlobalTask.LogFile.WriteToLogFile('Окончание расчета закладок базы лицевых счетов');
    end;
  end;
}
end;

procedure TfmGurnAlfKn.GridKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  inherited;
  Grid.MyUserKeyDown(Sender,Key,Shift);   // !!!   чтобы срабатывали стандартные клавиши из SasaDbGrid

  if (Key=VK_TAB) and (Shift=[]) then begin
    ActiveControl := edSeek;
    Key:=0;
  end;
end;

//------------------------------------------------------------------------------
procedure TfmGurnAlfKn.edSeekChange(Sender: TObject);
begin
  if not FSeekEnter then EditSeekChange;
end;

//------------------------------------------------------------------------------
procedure TfmGurnAlfKn.EditSeekChange;
var
  strFilter : String;
  nLen,n : Integer;

begin
  strFilter:=Trim(edSeek.Text);
  if (strFilter<>'') then begin
    CheckOper(strFilter);
    if ((Copy(strFilter,1,1)='=') or (Copy(strFilter,1,1)='>') or (Copy(strFilter,1,1)='<')) then begin
      if (edFind.ItemIndex=0) then begin
        edFind.ItemIndex:=2;
      end;
    end else if IsAllDigit(strFilter) and (edFind.ItemIndex<>1) then begin
      edFind.ItemIndex:=1;
    end else if (DropAllChar(strFilter)='') and (edFind.ItemIndex<>0) then begin
      edFind.ItemIndex:=0;
    end;
  end;
    {
  if (edSeek.Text<>'') then begin
    if IsAllDigit(Trim(edSeek.Text)) then begin
      edFind.ItemIndex:=0;
    end else begin
    if IsAllDigit(RightStr(Trim(edSeek.Text),1)) then begin
      if edFind.ItemIndex=0 then begin
        edFind.ItemIndex:=1;
      end;
    end else begin
      edFind.ItemIndex:=0;
    end;
  end;
  }
  if edFind.ItemIndex=0 then begin
    strFilter := Trim(edSeek.Text);
    nLen := Length(strFilter);
    Query.DisableControls;
    Query.Filtered := false;
    Query.OnFilterRecord:=nil;
    FSeekCountMens:=0;
    FSeekOper:='';
    if nLen = 0 then begin
      Query.Filter := '';
    end else begin
      n:=Pos(' ',strFilter);
      if n>0 then begin
        Query.Filter := 'FAMILIA='+QStr(Trim(Copy(strFilter,1,n-1))+'*')+
                        ' and NAME='+QStr(Trim(Copy(strFilter,n+1,20))+'*');
      end else begin
        Query.Filter := 'FAMILIA='+QStr(strFilter+'*');
      end;

      Query.Filtered := true;
    end;
    Query.EnableControls;
  end;
end;
//----------------------------------------------------------------------------------------------
procedure TfmGurnAlfKn.RunEnterSeek;
var
  strFilter,sOper,sKolvo : String;
  nLen : Integer;
  old:TCursor;
  l:Boolean;
begin
  nLen:=0;
  l:=dbDisableControls(Query);
  try
  if (edFind.ItemIndex=1) or (edFind.ItemIndex=2) then begin
    sOper:='=';
    strFilter:=StringReplace(Trim(edSeek.Text),' ','',[rfReplaceAll]);
    nLen := Length(strFilter);
    if edFind.ItemIndex=2 then begin  // количество
      if not GetOperValue(strFilter,sOper,sKolvo,true,self) then begin
        sOper:='';
        sKolvo:='9999';
      end;
      strFilter:=sKolvo;
      nLen:=Length(strFilter);
    end;
    Query.Filter := '';
    Query.Filtered := false;
    Query.OnFilterRecord:=nil;
    FSeekCountMens:=0;
    FSeekOper:='';
  end;
  // поиск по номеру лиц. счета
  if (edFind.ItemIndex=1) then begin
    if nLen=0 then begin
      Beep;
    end else begin
      if IsAllDigit(strFilter) then begin
        Query.Filter := 'NOMER'+sOper+strFilter;
        old:=Screen.Cursor;
        Screen.Cursor:=crHourGlass;
        try
          Query.Filtered := true;
        finally
          Screen.Cursor:=old;
        end;
      end else begin
        Beep;
      end;
    end;
    if not Query.Eof then begin
      ActiveControl := Grid;
    end;
  end else if (edFind.ItemIndex=2) then begin
    if (nLen=0) or (sOper='') then begin
      Beep;
    end else begin
      if IsAllDigit(strFilter) then begin
        FSeekCountMens:=StrToInt(strFilter);
        FSeekOper:=sOper;              
        if FSeekAsQuery then begin
          getIDForTmpTable(0,strFilter,sOper);
        end else begin
          Query.OnFilterRecord:=QueryFilterRecord;
          old:=Screen.Cursor;
          Screen.Cursor:=crHourGlass;
          try
            Query.Filtered := true;
          finally
            Screen.Cursor:=old;
          end;
        end;
      end else begin
        Beep;
      end;
    end;
    if not Query.Eof then begin
      ActiveControl := Grid;
    end;
  end else begin   // по Фамилии
    EditSeekChange;
    if not Query.Eof then begin
      ActiveControl := Grid;
    end;
  end;
  finally
    dbEnableControls(Query,l);
  end;
end;

procedure TfmGurnAlfKn.edSeekKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
  strFilter,sOper,sKolvo : String;
  nLen : Integer;
  old:TCursor;
  l:Boolean;
begin
  inherited;
  if (Key=VK_RETURN) and (Shift=[]) then begin
    RunEnterSeek;
  end else if (Key=VK_TAB) and (Shift=[]) then begin
    ActiveControl := Grid;
  end;
end;

//--------------------------------------------------------------------------------------------
function TfmGurnAlfKn.getIDForTmpTable(nType:Integer; strFilter:String; sOper:String):Boolean;
var
  sNol,s,sType,sSQL,sWhere:String;
  n:Integer;
  slPar:TStringList;
begin
  Result:=true;
  OpenMessage('    Поиск ...     ','',10);
  try
    sSQL:='DELETE FROM &tmp&;'+chr(13);
    if (nType=0) then begin             // количество
      slPar:=TStringList.Create;
      n:=Pos(';',FTypeCountMens);
      if n>0 then begin
        s:=Copy(FTypeCountMens,n+1,Length(FTypeCountMens));
        sType:=Copy(FTypeCountMens,1,n-1);
        s:=StringReplace(s,'#','-',[]);
        slPar.Add('VOZR='+s);
      end else begin
        sType:=FTypeCountMens;
      end;
      sWhere:='lic_id>0 and '+dmBase.CountMens2Where(DateFiks,1,sType,slPar);
      slPar.Free;
      FSeekCountMens:=StrToInt(strFilter);
      FSeekOper:=sOper;                       
      sSQL:=sSQL+'INSERT INTO &tmp& SELECT lic_id id, Count(*) FROM Население WHERE '+sWhere+
                 ' GROUP BY lic_id HAVING Count(*)'+sOper+strFilter;
      if (Pos('<',sOper)>0) then begin  // если выбрали операцию меньше отсечем нулевые значения
         sSQL:=sSQL+ ' and Count(*)>0'
      end;
      sSQL:=sSQL+ ';';
      if (strFilter='0') and (Pos('=',sOper)>0) then begin  // для пустующих лицевых, если ищем "=0"
        sSQL:=sSQL+'INSERT INTO &tmp& (ID) SELECT ID FROM ЛицевыеСчета WHERE id not in (SELECT distinct lic_id AS id FROM Население WHERE '+sWhere+');';
      end;
    end else if (nType=1) then begin // ФИО
{
      if sOper='*' then Result:='FAMILIA LIKE '+QStr(sFam+'%')
                   else Result:='FAMILIA='+QStr(sFam);

      if sName<>'' then begin
        if sOper='*' then Result:=Result+' and NAME LIKE '+QStr(sName+'%')
                     else Result:=Result+' and NAME='+QStr(sName);

      end;
 }
    end;
    TmpQuery.SQL.Text:=StringReplace( sSQL, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);
    TmpQuery.ExecSQL;
    SetFilter;            
    CloseMessage;
  except
    on E:Exception do begin
      CloseMessage;
      FSeekCountMens:=0;
      FSeekOper:='';
      PutError('Ошибка поиска: '+#13+E.Message,self);
      Result:=false;
    end;
  end;
end;
//----------------------------------------------------------------------
procedure TfmGurnAlfKn.edSeekEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  RunEnterSeek;
end;
//----------------------------------------------------------------------
procedure TfmGurnAlfKn.edSeekEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  if (edSeek.Text<>'') then begin
    Query.Filtered := false;
    edSeek.Text    := '';
    Query.Filter   := '';
    Query.OnFilterRecord:=nil;
    FSeekCountMens:=0;
    FSeekOper:='';
    edFind.ItemIndex:=0;
    SetFilter;
  end;
end;
//----------------------------------------------------------------------
procedure TfmGurnAlfKn.edFindChange(Sender: TObject);
begin
  if edFind.ItemIndex=0 then begin
    edSeek.EditButtons[0].Visible:=FSeekEnter;
  end else begin
    edSeek.EditButtons[0].Visible:=true;
  end;
end;
//----------------------------------------------------------------------
procedure TfmGurnAlfKn.SetFilter;
begin
  CreateAdditiveWhere2Refresh;
end;

procedure TfmGurnAlfKn.QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  n:Integer;
begin
  Accept := false;
  n:=dmBase.CountMensEx( DateFiks, Query.FieldByName('ID').AsString, FTypeCountMens, nil);
  if FSeekOper='=' then begin
    if n=FSeekCountMens then begin
      Accept := true;
    end;
  end else if FSeekOper='>' then begin
    if n>FSeekCountMens then begin
      Accept := true;
    end;
  end else if FSeekOper='<' then begin
    if (n<FSeekCountMens) and (n>0) then begin
      Accept := true;
    end;
  end else begin
    if n=FSeekCountMens then begin
      Accept := true;
    end;
  end;
end;

procedure TfmGurnAlfKn.FormResize(Sender: TObject);
begin
  TBToolWindow1.DockPos:=1300;
end;

procedure TfmGurnAlfKn.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if Query.Active then begin
    inherited;
    // лицевой счет ликвидирован
    if not Query.FieldByName('CANDELETE').IsNull and Query.FieldByName('CANDELETE').AsBoolean then begin
      AFont.Color := Grid.Color1; //  clRed;
    end else begin
      // глава хоз-ва умер или уехал насовсем
      if (Query.FieldByName('CANDELETE_FIRST').AsInteger=0) then begin

      end else begin
        // глава хоз-ва не прописан на территории совета
        if not Query.FieldByName('PROPIS').IsNull and (Query.FieldByName('PROPIS').AsBoolean=false) then begin
          AFont.Color := $00319D31; //clGreen; //Grid.NewRowColor;
        // глава хоз-ва отсутствует на территории совета
        end else if not Query.FieldByName('PRESENT').IsNull and (Query.FieldByName('PRESENT').AsBoolean=false) then begin
          AFont.Color := clBlue; // Grid.Color2;
        end;
      end;
    end;
  end;
end;

procedure TfmGurnAlfKn.FormCreate(Sender: TObject);
begin
  inherited;
  edFind.ItemIndex:=0;
end;

procedure TfmGurnAlfKn.TBItemEmptyAdresClick(Sender: TObject);
var
  strSQL  : String;
begin
  FFltCaption:='[Лицевые счета без адресов]';
  SetCaptionGurnal;
  strSQL  := ChangeWhere( Query.SQL.Text, FFilterJurnal.DefaultWhere+' and punkt is null', false);
  FNewSQL := strSQL;
  Refresh;
  FNewSQL:='';
  TBItemClrFlt.Enabled:=true;
end;                                 

procedure TfmGurnAlfKn.GridColumnsGetLgot(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
//var
//  d : TDateTime;
//  i : Integer;
begin
  if Query.FieldByName('FIRST').AsString<>'' then begin
//    d := Query.FieldByName('DATE_FIKS').AsDateTime;
//    i := Query.FieldByName('FIRST').AsInteger;
    Params.Text:=dmBase.LgotMen(dmBase.tbMensLgot, Query.FieldByName('DATE_FIKS').AsDateTime,
                                      Query.FieldByName('FIRST').AsString, ', ');
    {
    dmBase.tbMensLgot.CancelRange;
    try
      dmBase.tbMensLgot.IndexFieldNames := 'DATE_FIKS;ID;KOD';
      dmBase.tbMensLgot.SetRange([d,i],[d,i]);
      if not dmBase.tbMensLgot.Eof then begin
        Params.Text := '';
        while not dmBase.tbMensLgot.Eof do begin
          if dmBase.SprLgot.Locate('ID',dmBase.tbMensLgot.FieldByName('KOD').AsString,[]) then begin
            Params.Text := Params.Text + dmBase.SprLgot.FieldByName('NAME').AsString+', ';
          end;
          dmBase.tbMensLgot.Next;
        end;
        if Params.Text<>'' then Params.Text:=Copy(Params.Text,1,Length(Params.Text)-2);
      end else begin
        Params.Text := '';
      end;
    finally
      dmBase.tbMensLgot.CancelRange;
    end;
   }
  end;
end;

procedure TfmGurnAlfKn.SaveToIni;
var
  ini : TSasaIniFile;
begin
  inherited SaveToIni;
  ini := GlobalTask.iniFile('LOCAL');
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_COUNT_MENS',FVisibleCountMens);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_LIST_MENS',FVisibleListMens);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_LIST_OWNERS',FVisibleOwners);
  ini.WriteBool(KodGurnal+'.Add','ADD_OTNOSH_MENS',FAddOtnosh);
  ini.WriteBool(KodGurnal+'.Add','ADD_DATER_MENS',FAddDateR);
  ini.WriteBool(KodGurnal+'.Add','ADD_LGOT_MENS',FAddLgot);
  ini.WriteBool(KodGurnal+'.Add','ADD_IN_MENS',FAddIN);
  ini.WriteBool(KodGurnal+'.Add','ADD_PASP_MENS',FAddPasp);
  ini.WriteBool(KodGurnal+'.Add','ADD_DATEP_MENS',FAddDateP);
  ini.WriteBool(KodGurnal+'.Add','ADD_FIRST_MENS',FAddFirst);
  ini.WriteBool(KodGurnal+'.Add','ADD_ALL_MENS',FAddAllMens);
  ini.WriteString(KodGurnal+'.Add','TYPE_COUNT_MENS',FTypeCountMens);
  ini.WriteBool(KodGurnal+'.Add','UNION_FIO',FUnionFIO);
  ini.WriteBool(KodGurnal+'.Add','UNION_ADRES',FUnionAdres);
end;


procedure TfmGurnAlfKn.LoadFromIni;
var
  i : Integer;
  ini : TSasaIniFile;
begin
  inherited LoadFromIni;
  ini := GlobalTask.iniFile('LOCAL');
  FVisibleCountMens := ini.ReadBool(KodGurnal+'.Add','VISIBLE_COUNT_MENS',false);
  FVisibleListMens  := ini.ReadBool(KodGurnal+'.Add','VISIBLE_LIST_MENS',false);
  FVisibleOwners    := ini.ReadBool(KodGurnal+'.Add','VISIBLE_LIST_OWNERS',false);

  FAddOtnosh := ini.ReadBool(KodGurnal+'.Add','ADD_OTNOSH_MENS',false);
  FAddDateR  := ini.ReadBool(KodGurnal+'.Add','ADD_DATER_MENS',false);
  FAddDateP  := ini.ReadBool(KodGurnal+'.Add','ADD_DATEP_MENS',false);
  FAddLgot   := ini.ReadBool(KodGurnal+'.Add','ADD_LGOT_MENS',false);
  FAddIN     := ini.ReadBool(KodGurnal+'.Add','ADD_IN_MENS',false);
  FAddPasp   := ini.ReadBool(KodGurnal+'.Add','ADD_PASP_MENS',false);
  FAddFirst  := ini.ReadBool(KodGurnal+'.Add','ADD_FIRST_MENS',false);
  FAddAllMens:= ini.ReadBool(KodGurnal+'.Add','ADD_ALL_MENS',false);
  CreateParAddMen;

  FUnionFIO  := ini.ReadBool(KodGurnal+'.Add','UNION_FIO',false);
  FUnionAdres:= ini.ReadBool(KodGurnal+'.Add','UNION_ADRES',true);
  FTypeCountMens    := ini.ReadString(KodGurnal+'.Add','TYPE_COUNT_MENS','100');
  if Length(FTypeCountMens)<3
    then FTypeCountMens := PadRStr(FTypeCountMens,3,'0');
  for i:=0 to Grid.Columns.Count-1 do begin
    if Grid.Columns[i].FieldName='LGOT' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetLgot;
    end else if UpperCase(Grid.Columns[i].FieldName)='PASSPORT' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetPassport;
    end else if Grid.Columns[i].FieldName='COUNT_MENS' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsCountMens;
    end else if Grid.Columns[i].FieldName='LIST_MENS' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsListMens;
    end else if Grid.Columns[i].FieldName='OWNERS' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetOwners;
    end;
  end;
  CheckPropertyUnionFIO;
  CheckPropertyUnionAdres;
  CheckCountMens;
  try
    Grid.FieldColumns['MNS_LPX'].Visible:=GlobalTask.ParamAsBoolean('OTM_MNS_LPX');
  except
  end;
end;
//------------------------------------------------------------------------------------------------------------
procedure TfmGurnAlfKn.CreateParAddMen;
begin
  FParAdd:=';';
  if FAddOtnosh then  FParAdd:=FParAdd+'OTN;';
  if FAddDateR  then  FParAdd:=FParAdd+'DATER;';
  if FAddDateP  then  FParAdd:=FParAdd+'DATEP;';
  if FAddIN     then  FParAdd:=FParAdd+'IN;';
  if FAddLgot   then  FParAdd:=FParAdd+'LGOT;';
  if FAddPasp   then  FParAdd:=FParAdd+'PASP;';
  if FAddFirst  then  FParAdd:=FParAdd+'FIRST;';
  if FAddAllMens then FParAdd:=FParAdd+'ALL;';
end;
//------------------------------------------------------------------------------------------------------------
procedure TfmGurnAlfKn.GridColumnsListMens(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  c1,c2,c3 : Char;
  lOk1,lOk2,lOk3,lOk,lVozr : Boolean;
  n,nTrud,nVozr,nVozr1,nVozr2,i,j:Integer;
  strLicID,s,ss,strType : String;
  p:TPassport;
begin
// FParAdd ';OTN;DATER;DATEP;IN;PASP;LGOT;ALL;FIRST'
//------------------------------------------------------------------------------------------------------------
  Params.Text:=dmBase.ListMensLic(Query.FieldByName('ID').AsString, Query.FieldByName('FIRST').AsInteger, FTypeCountMens, FParAdd, #13#10, nil);
 {
  s:='';
  if FVisibleListMens then begin
    strLicID := Query.FieldByName('ID').AsString;
    if strLicID<>'' then begin
      with dmBase do begin
      tbMens.CancelRange;
      tbMens.IndexName := 'LIC_KEY';
      try
        c1 := FTypeCountMens[1];
        c2 := FTypeCountMens[2];
        c3 := FTypeCountMens[3];

        strType:=FTypeCountMens;
        lVozr:=false;
        nVozr1:=-1;
        nVozr2:=-1;
        nTrud:=-1;
        i:=Pos(';',strType);
        if i>0 then begin  // передан возраст: 000;0-18
          s:=Copy(strType,i+1,Length(strType));
          strType:=Copy(strType,1,i-1);
          if s<>'' then begin
            lVozr:=true;
            j:=Pos('#',s);
            if j=0 then begin
              if Copy(s,1,4)='TRUD' then begin    //   0-младше труд  1-труд  2-старше труд  3-не трудосп
                nTrud:=StrToIntDef(Copy(s,5,1),2);
                nVozr1:=999;
              end else begin
                nVozr1:=StrToInt(s);
              end;
            end else begin
              ss:=Trim(Copy(s,1,j-1));
              if ss<>''
                then nVozr1:=StrToInt(ss);
              ss:=Trim(Copy(s,j+1,100));
              if ss<>''
                then nVozr2:=StrToInt(ss);
            end;
          end;
        end;
        s:='';
        // !!! будет включать в список людей всех !!!
        if FAddAllMens
          then lVozr:=false;
        //-------------------------------------------
//        lOk:=false;
        tbMens.SetRange([DateFiks,strLicID],[DateFiks,strLicID]);
        while not tbMens.Eof do begin
          if (tbMens.FieldByName('CANDELETE').IsNull or not tbMens.FieldByName('CANDELETE').AsBoolean) and
             (FAddFirst or (Query.FieldByName('FIRST').AsInteger<>tbMens.FieldByName('ID').AsInteger)) then begin
            lOk :=false;
            lOk1:=false;
            lOk2:=false;
            lOk3:=false;

            if (c1='0') or ((c1='1') and tbMens.FieldByName('PRESENT').AsBoolean) or
               ((c1='2') and not tbMens.FieldByName('PRESENT').AsBoolean)
              then lOk1 := true;

            if (c2='0') or ((c2='1') and (tbMens.FieldByName('DATEP').AsString<>'')) or
               ((c2='2') and (tbMens.FieldByName('DATEP').AsString=''))
              then lOk2 := true;

            if (c3='0') or ((c3='1') and (tbMens.FieldByName('PROPIS').AsBoolean=true)) or
               ((c3='2') and (tbMens.FieldByName('PROPIS').AsBoolean=false))
              then lOk3 := true;

            if lOk1 and lOk2 and lOk3 then begin
              if lVozr then begin
                lOk:=false;
                if not tbMens.FieldByName('DATER').IsNull then begin
                  if nTrud>-1 then begin
                    n:=Trud(GetCurDate,tbMens.FieldByName('DATER').AsDateTime, tbMens.FieldByName('POL').AsString);
                    if nTrud=3 then begin
                      lOk:=((n=0) or (n=2));    // нетрудоспособ.
                    end else begin
                      lOk:=(n=nTrud);
                    end;
                  end else begin
                    nVozr:=GetCountYear(GetCurDate,tbMens.FieldByName('DATER').AsDateTime);
                    if nVozr1=-1 then begin
                      if (nVozr>=0) and (nVozr<=nVozr2) then lOk := true;
                    end else if nVozr2=-1 then begin
                      if (nVozr>=nVozr1) then lOk := true;
                    end else begin
                      if (nVozr>=nVozr1) and (nVozr<=nVozr2) then lOk := true;
                    end;
                  end;
                end;
              end else begin
                lOk:=true;
              end;
            end;
            if lOk then begin
              if FAddOtnosh and (tbMens.FieldByName('OTNOSH').AsString<>'') then begin
                if dmBase.SprOtnosh.Locate('ID', tbMens.FieldByName('OTNOSH').AsString,[])
                  then ss := ANSILowerCase(dmBase.SprOtnosh.FieldByName('NAME').AsString)+' '
                  else ss := '';
              end else begin
                ss := '';
              end;
              s := s + ss+tbMens.FieldByName('FAMILIA').AsString+' '+
                       tbMens.FieldByName('NAME').AsString+' '+
                       tbMens.FieldByName('OTCH').AsString;//', ';
              if FAddDateR and (tbMens.FieldByName('DATER').AsString<>'') then begin
                 s := s + ' ' + FormatDateTime('dd.mm.yyyy',tbMens.FieldByName('DATER').AsDateTime)+'г.р.';
              end;
              if FAddDateP and (tbMens.FieldByName('DATEP').AsString<>'') then begin
                 s := s + ' ' + FormatDateTime('dd.mm.yyyy',tbMens.FieldByName('DATEP').AsDateTime);
              end;
              if FAddIN and (tbMens.FieldByName('LICH_NOMER').AsString<>'') then begin
                 s := s + ' ' + tbMens.FieldByName('LICH_NOMER').AsString;
              end;
              if FAddPasp and (tbMens.FieldByName('PASP_NOMER').AsString<>'') then begin
                 p:=dmBase.PasportMen(tbMens.FieldByName('DATE_FIKS').AsDateTime,tbMens.FieldByName('ID').AsString);
                 s:=s+' '+dmBase.PasportToText(p,0);
              end;
              if FAddLgot then begin
                 s := s+ ' ' + dmBase.LgotMen(dmBase.tbMensLgot, Query.FieldByName('DATE_FIKS').AsDateTime,
                                              tbMens.FieldByName('ID').AsString, ', ');
              end;
              s:=s+#13#10;
            end;
          end;
          tbMens.Next;
        end;
      finally
        tbMens.CancelRange;
      end;
      end;
    end;
    if s<>'' then s:=Copy(s,1,Length(s)-2);
  end;
  Params.Text := s;
  }
end;

procedure TfmGurnAlfKn.CheckCountMens;
begin
  try
    Grid.FieldColumns['COUNT_MENS'].Visible:=FVisibleCountMens;
    Grid.FieldColumns['LIST_MENS'].Visible:=FVisibleListMens;
    Grid.FieldColumns['OWNERS'].Visible:=FVisibleOwners;
  except
  end;
  {$IFDEF GKH}
    try
      Grid.FieldColumns['KNIGA_NOMER'].Visible:=false;
      Grid.FieldColumns['KNIGA_STR'].Visible:=false;

      Grid.FieldColumns['Date_LPX1'].Visible:=false;
      Grid.FieldColumns['Date_LPX2'].Visible:=false;
    except
    end;
  {$ELSE}
    try
      Grid.FieldColumns['KNIGA_NOMER'].Visible:=true;
      Grid.FieldColumns['KNIGA_STR'].Visible:=true;
    except
    end;
  {$ENDIF}
end;

//-----------------------------------------------------------
procedure TfmGurnAlfKn.GridColumnsCountMens(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
 if FVisibleCountMens then begin
   Params.Text := IntToStr(dmBase.CountMensEx( DateFiks, Query.FieldByName('ID').AsString, FTypeCountMens, nil));
 end;
end;

//-----------------------------------------------------------
procedure TfmGurnAlfKn.TBItemCountMensClick(Sender: TObject);
var
  i,j,nVozr1,nVozr2:Integer;
  s,ss:String;
  l:Boolean;
begin
  fmTypeCountMens := TfmTypeCountMens.Create(nil);
  fmTypeCountMens.cbShow.Checked:=FVisibleCountMens;
  fmTypeCountMens.cbListMens.Checked:=FVisibleListMens;
  fmTypeCountMens.cbOwners.Checked:=FVisibleOwners;
  fmTypeCountMens.cbOtnosh.Checked:=FAddOtnosh;
  fmTypeCountMens.cbDateR.Checked:=FAddDateR;
  fmTypeCountMens.cbDateP.Checked:=FAddDateP;
  fmTypeCountMens.cbLgot.Checked:=FAddLgot;
  fmTypeCountMens.cbIN.Checked:=FAddIN;
  fmTypeCountMens.cbPasp.Checked:=FAddPasp;
  fmTypeCountMens.cbAddFirst.Checked:=FAddFirst;
  fmTypeCountMens.cbAllMens.Checked:=FAddAllMens;
  fmTypeCountMens.cbUnionFIO.Checked:=FUnionFIO;
  fmTypeCountMens.cbUnionAdres.Checked:=FUnionAdres;
  if FTypeCountMens='' then begin
    fmTypeCountMens.rbPresent.ItemIndex :=1;
    fmTypeCountMens.rbZareg.ItemIndex   :=0;
    fmTypeCountMens.rbPropis.ItemIndex  :=0;
//'    fmTypeCountMens.cbNotVozr.Checked   :=true;
    fmTypeCountMens.cbVozr.ItemIndex:=0;
  end else begin
    fmTypeCountMens.rbPresent.ItemIndex := StrToInt(Copy(FTypeCountMens,1,1));
    fmTypeCountMens.rbPropis.ItemIndex  := StrToInt(Copy(FTypeCountMens,2,1));
    fmTypeCountMens.rbZareg.ItemIndex   := StrToInt(Copy(FTypeCountMens,3,1));
    if Pos(';',FTypeCountMens)>0 then begin
//      fmTypeCountMens.cbNotVozr.Checked:=false;
      fmTypeCountMens.cbVozr.ItemIndex:=0;
      s:=FTypeCountMens;
      nVozr1:=-2;
      nVozr2:=-2;
      try
        i:=Pos(';',s);
        s:=Copy(s,i+1,Length(s));
        if s<>'' then begin
          if Copy(s,1,4)='TRUD' then begin
            fmTypeCountMens.cbVozr.ItemIndex:=StrToIntDef(Copy(s,5,1),2)+2;
          end else begin
            fmTypeCountMens.cbVozr.ItemIndex:=1;
            j:=Pos('#',s);
            if j=0 then begin
              nVozr1:=StrToInt(s);
            end else begin
              ss:=Trim(Copy(s,1,j-1));
              if ss<>''
                then nVozr1:=StrToInt(ss)
                else nVozr1:=-1;
              ss:=Trim(Copy(s,j+1,100));
              if ss<>''
                then nVozr2:=StrToInt(ss)
                else nVozr2:=-1;
            end;
          end;
        end;
      except
//        fmTypeCountMens.cbNotVozr.Checked:=true;
        fmTypeCountMens.cbVozr.ItemIndex:=0;
        nVozr1:=-2;
        nVozr2:=-2;
      end;
      if nVozr1>-2 then fmTypeCountMens.edVozr1.Value:=nVozr1;
      if nVozr2>-2 then fmTypeCountMens.edVozr2.Value:=nVozr2;
      if fmTypeCountMens.edVozr1.Value=-1 then fmTypeCountMens.edVozr1.Text:='';
      if fmTypeCountMens.edVozr2.Value=-1 then fmTypeCountMens.edVozr2.Text:='';
    end else begin
      fmTypeCountMens.cbVozr.ItemIndex:=0;
//      fmTypeCountMens.cbNotVozr.Checked:=true;
    end;
  end;
  if fmTypeCountMens.ShowModal=mrOk then begin
    FTypeCountMens := IntToStr(fmTypeCountMens.rbPresent.ItemIndex)+
                      IntToStr(fmTypeCountMens.rbPropis.ItemIndex)+
                      IntToStr(fmTypeCountMens.rbZareg.ItemIndex);
//    if not fmTypeCountMens.cbNotVozr.Checked then begin
    if fmTypeCountMens.cbVozr.ItemIndex>0 then begin
      if fmTypeCountMens.cbVozr.ItemIndex>1 then begin
        FTypeCountMens:=FTypeCountMens+';TRUD'+IntToStr(fmTypeCountMens.cbVozr.ItemIndex-2);
      end else begin
        if (fmTypeCountMens.edVozr1.Text<>'') or (fmTypeCountMens.edVozr2.Text<>'') then begin
          FTypeCountMens:=FTypeCountMens+';'+fmTypeCountMens.edVozr1.Text+'#'+fmTypeCountMens.edVozr2.Text;
        end;
      end;
    end;

    FVisibleCountMens := fmTypeCountMens.cbShow.Checked;
    FVisibleListMens  := fmTypeCountMens.cbListMens.Checked;
    FVisibleOwners    := fmTypeCountMens.cbOwners.Checked;

    FAddOtnosh        := fmTypeCountMens.cbOtnosh.Checked;
    FAddDateR         := fmTypeCountMens.cbDateR.Checked;
    FAddDateP         := fmTypeCountMens.cbDateP.Checked;
    FAddLgot          := fmTypeCountMens.cbLgot.Checked;
    FAddIN            := fmTypeCountMens.cbIN.Checked;
    FAddPasp          := fmTypeCountMens.cbPasp.Checked;
    FAddFirst         := fmTypeCountMens.cbAddFirst.Checked;
    FAddAllMens       := fmTypeCountMens.cbAllMens.Checked;
    CreateParAddMen;

    FUnionFIO         := fmTypeCountMens.cbUnionFIO.Checked;
    FUnionAdres       := fmTypeCountMens.cbUnionAdres.Checked;

    fmTypeCountMens.Free;
    l:=dbDisableControls(Query);
    CheckCountMens;
    CheckPropertyGridColumns;
    CheckPropertyUnionFIO;
    CheckPropertyUnionAdres;
    CreateAdditiveWhere2Refresh;
    dbEnableControls(Query,l);
//    Refresh(true);
  end else begin
    fmTypeCountMens.Free;
  end;
end;

//-----------------------------------------------------------
procedure TfmGurnAlfKn.GridColumnsGetPassport(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  p : TPassport;
begin
  p := dmBase.PasportMen(Query.FieldByName('DATE_FIKS').AsDateTime,
                         Query.FieldByName('FIRST').AsString);
  Params.Text := dmBase.PasportToText(p, 0);
end;

//-----------------------------------------------------------
procedure TfmGurnAlfKn.Event_InitFields(Sender: TObject);
var
  lFilter : Boolean;
begin
  if TBItemClrFlt.Enabled or Query.Filtered or (FFilter_Punkt<>'')  then begin
    lFilter := true;
  end else begin
    lFilter := false;
  end;
  if RunInitRekvisit(Self, Query, dmBase.tbLich, 'DATE_FIKS;ID', lFilter) then Refresh(true);
end;

//-----------------------------------------------------------
function TfmGurnAlfKn.getAdditiveWhere: String;
var
 s1:String;
 procedure AddResult(ss:String);
 begin if Result='' then Result:=ss else Result:=Result+' and '+ss;  end;
begin
  Result:='';
  if not AdditiveWhere_for_FilterInterface then begin
    {$IFDEF OCHERED}
      Result:='';
    {$ELSE}
      if IsDateFiks
        then Result:=''
        else Result:='l.date_fiks='+DateToSQL(fmMain.DateFiks);
    {$ENDIF}
  end;
  s1:=GetStrSystemFilter(true);
  if s1<>''
    then AddResult(s1);
  if FFilter_Punkt<>''
    then AddResult(FFilter_Punkt);
  if (FSeekOper<>'') and FSeekAsQuery  then AddResult('l.id in (select id from '+GetNameTmpIdTable+')');
end;

//-----------------------------------------------------------
function TfmGurnAlfKn.getDefaultAddWhere: String;
begin
  Result:=getAdditiveWhere;
//  Result:=GetStrSystemFilter(true);
end;

//-----------------------------------------------------------
procedure TfmGurnAlfKn.TBItemPunktsClick(Sender: TObject);
begin
  ClickPunkts;
end;

procedure TfmGurnAlfKn.GridColumnsGetOwners(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.fieldByName('ID').AsString<>'' then begin
//    Params.Text := dmBase.HouseOwners2(Query.FieldByName('date_fiks').AsDateTime,
//                       Query.FieldByName('id').AsString, 1, nil);
    Params.Text := dmBase.HouseOwners(Query.FieldByName('date_fiks').AsDateTime,
                       Query.FieldByName('adres_id').AsString,nil, 1, nil, nil, nil);
  end;
end;

procedure TfmGurnAlfKn.TBSubmenuPunktsClick(Sender: TObject);
begin
  ClickPunkts;
end;

procedure TfmGurnAlfKn.TBItemClearPunktsClick(Sender: TObject);
begin
  ClearPunkts;
end;

procedure TfmGurnAlfKn.TBItem1Click(Sender: TObject);
var
  slPar:TStringList;
  n:INteger;
  s:String;
begin
  slPar:=TStringList.Create;
  slPar.Add('ADRES_ID='+Query.fieldbyName('ADRES_ID').AsString);
  n:=dmBase.CountMensEx( DateFiks, Query.fieldbyName('ID').AsString, '101', slPar);
  if slPar.IndexOfName('SOBSTV')>-1
    then s:='Ok' else s:='Not';
  s:=s+'  '+IntToStr(n)+'   '+slPar.Strings[0];
  slPar.Free;
  ShowMessage(s);
end;

initialization
  fmGurnAlfKn := nil;
end.
