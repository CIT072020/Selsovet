unit fGurnNasel;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants, DateUtils,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uTypes,
  TB2Item, TB2Dock, TB2Toolbar, StdCtrls, Mask, DBCtrlsEh, TB2ToolWindow, FuncPr, NewDialogs,
  DbFunc, vchDBCtrls, PrnDbgeh, Menus, MetaTask, mPermit, SasaIniFile, fWarning,ifpii_dbfunc,
  ImgList, ComCtrls, ExtCtrls;

type
  TfmGurnNasel = class(TfmGurnal)
    TBToolWindow1: TTBToolWindow;
    edSeek: TDBEditEh;
    TBItemLgot: TTBItem;
    TBItemEditLic: TTBItem;
    TBItemAddMen: TTBItem;
    TBItemDopGraf: TTBItem;
    TBItemCopyMen: TTBItem;                                           
    edFind: TComboBox;
    TBItemPrizn: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItemEmptyAdres: TTBItem;
    procedure edSeekChange(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure TBItemLgotClick(Sender: TObject);
    procedure TBItemPriznClick(Sender: TObject);
    procedure TBItemEditLicClick(Sender: TObject);
    procedure TBItemAddMenClick(Sender: TObject);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure TBItemDopGrafClick(Sender: TObject);
    procedure TBItemCopyMenClick(Sender: TObject);
    procedure edSeekEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edSeekKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure GridKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure edFindChange(Sender: TObject);
    procedure TBItemPunktsClick(Sender: TObject);
    procedure TBSubmenuPunktsClick(Sender: TObject);
    procedure TBItemClearPunktsClick(Sender: TObject);
    procedure edSeekEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure TBItemClrFltClick(Sender: TObject);
    procedure TBItemEmptyAdresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FVisibleUdostLgot:Boolean;
    FVisibleMR : Boolean;
    FVisiblePrib : Boolean;

    FVisibleParent : Boolean;
    FParent_DATER : Boolean;
    FParent_WORK : Boolean;
    FParent_PASP : Boolean;
    FParent_IN : Boolean;

    FVisibleDeti : Boolean;
    FDetiVozr1 : Integer;
    FDetiVozr2 : Integer;
    FDetiCount : Integer;
    FDetiCount2: Integer;
    FDetiOnlyMama : Boolean;
    FDetiAddOthosh : Boolean;
    FDetiAddGodR : Integer;
    ListDeti : TDataSet;

    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    function  LoadQuery : Boolean; override;
    procedure GridColumnsGetLgot(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetAddInfo(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetPaspVidan(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetDeti(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    function  getAddInfoMen(sID:String):String;
    procedure GridColumnsGetPapa(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMama(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure Event_CheckErrorMens(Sender: TObject);
    procedure Event_DeleteRegistryMens(Sender: TObject);
    procedure Event_CheckRegistryMens(Sender: TObject);
    procedure Event_CheckUnRegistryMens(Sender: TObject);
    procedure Event_InitFields(Sender: TObject);
    procedure Event_VigrMinTrud(Sender: TObject);
    procedure CheckAddGraf;

    procedure QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);

    function  getAdditiveWhere: String; override;
    function  getDefaultAddWhere: String; override;
    function  getIDForTmpTable(nType:Integer;strFilter:String):Boolean;
    function  setAdditiveFilter:Boolean; override;
    function  getAdditiveFilter: String; override;
    procedure ClearSeek;
    procedure EditSeekChange;
    function GetHintSeek(n:Integer):String;

    procedure AddUpdateActions; override;
    procedure SaveToIni; override;
    procedure LoadFromIni; override;
    procedure SetListParEditForm; override;

    procedure CreateParSavedFilter(sl:TStringList); override;
    function ReadParSavedFilter(sl:TStringList):Boolean; override;
  end;

const
  DEF_VISIBLE_MENS = 3;

  TYPESEEK_FIO=0;
  TYPESEEK_LIC=1;
  TYPESEEK_DETI=2;
  TYPESEEK_ANY=3;
  TYPESEEK_MINTRUD=4;

var
  fmGurnNasel: TfmGurnNasel;

implementation

uses fMain, dBase, fLgotSeek, fVisibleMensGurnal, fTypeGurnalNasel, fInitField, uProject, fRunSprav, mFindInt,
  IniFiles;

{$R *.DFM}

{ TfmGurnNasel }

constructor TfmGurnNasel.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_Nasel;
  inherited;
  QuestDel := '  Удалить текущего человека ?  ';
  TBItemGrantSprav.Visible:=true;
  ListDeti := dbCreateListDeti;
  edFind.ItemIndex:=TYPESEEK_FIO;
  FIgnoreCheck:=true;
  FEnabledUnionFIO:=true;
  FEnabledUnionAdres:=true;
  FEnabledUnionPasp:=true;
  TBItemIsklOtbor.Visible:=true;
  TBItemIsklOtbor.Enabled:=false;
  TBItemAddOtbor.Visible:=true;
  TBItemAddOtbor.Enabled:=false;
  TBItemWriteSavedFilter.Visible:=true;;
  TBItemWriteSavedFilter.Enabled:=false;
  edSeek.EditButtons[0].Visible:=FSeekEnter;

  {$IFDEF GKH}
    TBSubmenuPunkts.Visible:=false;
//    TBItemPunkts.Visible:=false;
  {$ENDIF}
end;

destructor TfmGurnNasel.Destroy;
begin
  dbClose(ListDeti);
  inherited;
end;

procedure TfmGurnNasel.SetListParEditForm;
begin
  inherited;
//  FListPar.Add('ENABLEOCHERED=0');
end;
//----------------------------------------------------------------
function TfmGurnNasel.getAdditiveWhere: String;
var
 s1:String;
 procedure AddResult(ss:String);
 begin if Result='' then Result:=ss else Result:=Result+' and '+ss;  end;
begin
  if not AdditiveWhere_for_FilterInterface then begin
    {$IFDEF OCHERED}
      Result:='';
    {$ELSE}
      if IsDateFiks
        then Result:=''
        else Result:='n.date_fiks='+DateToSQL(fmMain.DateFiks);
    {$ENDIF}
  end;
  s1:=GetStrSystemFilter(true);
  if s1<>''            then AddResult(s1);
  if FFilter_Punkt<>'' then AddResult(FFilter_Punkt);

  if FSeekAsQuery and FSeekAsQuery_Active then AddResult(' n.id in (select id from '+GetNameTmpIdTable+')');

end;
//----------------------------------------------------------------
function TfmGurnNasel.getDefaultAddWhere: String;
begin
  Result:=getAdditiveWhere;
end;
//----------------------------------------------------------------
function TfmGurnNasel.setAdditiveFilter: Boolean;
var
  s, strOrderBy, strFilter : String;
//  n:Integer;
  l:Boolean;
  cur:TCursor;
begin           
  result:=true;
  Query.Filtered := false;
  Query.OnFilterRecord:=nil;
  Query.Filter := '';
  if FSeekAsQuery then begin

    if not TBItemClrFlt.Enabled then begin
      FilterInterface.Filter.ClearFilter;     // !!!    гарантированно очистим фильтр
//      SetSearchRangeGurnal;
//      FilterInterface.SearchRange:=srCurrent;
    end;

    s:=getAdditiveFilter;
//    if s<>'' then
//      strOrderBy:='l.Nomer,n.NStr';
    if (s<>'') and (edFind.ItemIndex=TYPESEEK_MINTRUD) and FSeekAsQuery_Active
      then strOrderBy:='l.Nomer,n.NStr'
      else strOrderBy:='';
    FullRefresh(true, strOrderBy);
  end else begin

  end;
end;

//----------------------------------------------------------------
function TfmGurnNasel.getAdditiveFilter: String;
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
      if FSeekAsQuery_Ready then begin   // отбор уже готов, прочитан из сохраненного файла

      end else begin
        if getIDForTmpTable(edFind.ItemIndex,strFilter) then begin

        end;
      end;
      FSeekAsQuery_Active:=true;
    end;
    Result:=CreateAdditiveWhere(getAdditiveWhere);
    if Result<>'' then begin
      FNewSQL:=ChangeWhere( Query.SQL.Text, Result, false);
    end;
  end else begin
    if nLen=0 then begin
      Result:='';
    end else begin
    end;
  end;  
  TBItemIsklOtbor.Enabled:=FSeekAsQuery_Active;
  TBItemAddOtbor.Enabled:=FSeekAsQuery_Active;
  TBItemWriteSavedFilter.Enabled:=FSeekAsQuery_Active;
  if not TBItemClrFlt.Enabled then TBItemClrFlt.Enabled:=FSeekAsQuery_Active;
end;

//----------------------------------------------------------------
function TfmGurnNasel.getIDForTmpTable(nType:Integer;strFilter:String):Boolean;
var
  slSQL:TStringList;
  sFam,sName,sOper,sOp,s1,s2,sNot:String;
  sMonth, sYear:String;
  n:Integer;
  lOk,lSeek:Boolean;
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
  sNot:='';
  try
    slSQL:=TStringList.Create;
    slSQL.Add('DELETE FROM &tmp&;');

    CheckOper(strFilter);
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
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT DISTINCT ID FROM Население WHERE '+getWhere(sFam,sName)+' and date_fiks='+DateToSQL(DateFiks)+';');
//      if (nType=TYPESEEK_FIO_SS) then begin   // + состав семьи
//        slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM SostavSem WHERE '+getWhere(sFam,sName)+';');
//      end;
      if GlobalTask.ParamAsBoolean('SEEK_WITH_HIST') then begin
        if sOper='*' then s1:='VALUE LIKE '+QStr(sFam+'%')
                     else s1:='VALUE='+QStr(sFam);
        s2:='';
        if sName<>'' then begin
          if sOper='*' then s1:=s1+' and NAME LIKE '+QStr(sName+'%')
                       else s1:=s1+' and NAME='+QStr(sName);
          s2:=' LEFT JOIN Население n ON  n.date_fiks='+DateToSQL(DateFiks)+' and HistoryZags.id=n.id ';
        end;
        slSQL.Add('INSERT INTO &tmp& (ID) SELECT HistoryZags.ID FROM HistoryZags '+
                  s2+
                  ' WHERE typeobj='+IntToStr(_TypeObj_Nasel)+' and fieldname='+QStr('FAMILIA')+' and '+s1+';');
      end;
    end else if (nType=TYPESEEK_LIC) then begin
      if IsAllDigit(strFilter) then begin
        TmpQuery.SQL.Text:=StringReplace( slSQL.Text, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);

        if dmBase.tbLich.Locate('DATE_FIKS;NOMER', VarArrayOf([DateFiks,strFilter]), []) then begin
          // соберем все лицевые счета (исправлено 12.07.2017)
          slSQL.Add('INSERT INTO &tmp& (ID) SELECT n.ID FROM Население n LEFT JOIN ЛицевыеСчета l ON n.date_fiks=l.date_fiks and l.id=n.lic_id '+
                    'WHERE n.date_fiks='+DatetoSQL(DateFiks)+' and l.nomer='+strFilter);
//          slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM Население WHERE lic_id='+dmBase.tbLich.FieldByName('ID').AsString+';');
        end else begin
          slSQL.Add('INSERT INTO &tmp& (ID) SELECT -999 FROM system.iota;');
        end;
      end;

    //------- ДЕТИ ---------------------------------------------------
    end else if (nType=TYPESEEK_DETI) then begin
      lOk:=false;
      lSeek:=false;
      if (sOper='*') then begin
        FDetiCount:=-1;
        sOp:='*';
        lOk:=true;
      end else begin
        if IsAllDigit(Trim(strFilter)) and (Trim(strFilter)<>'') then begin
          if (sOper='=') or (sOper='')
            then sOp:='='
            else sOp:=sOper;
          try
            FDetiCount:=StrToInt(strFilter);
            lOk:=true;
          except
          end;
        end;
      end;
      if lOk then begin             
        Query.DisableControls;
        Query.First;
        s1:='';
        while not Query.Eof do begin
          lOk:=false;
          try
            n := dmBase.GetCountDeti(Query.FieldByName('ID').AsString,
                                     Query.FieldByName('POL').AsString,
                                     FDetiVozr1,FDetiVozr2,false,false);
            if (n>0) then begin
              if sOp='*' then begin
                lOk:=true;
              end else if sOp='=' then begin
                lOk:=(n=FDetiCount);
              end else if sOp='>' then begin
                lOk:=(n>FDetiCount);
              end else if sOp='<' then begin
                lOk:=(n<FDetiCount);
              end;
            end;
            if lOk then begin
              if FDetiOnlyMama and (Query.FieldByName('POL').AsString='М') then begin
                lOk:=false;
              end;
            end;
          except

          end;
          if lOk then begin
            lSeek:=true;
            slSQL.Add('INSERT INTO &tmp& (ID) SELECT '+Query.FieldByName('ID').AsString+' FROM system.iota;');
          end;
          Query.Next;
        end;
        Query.First;
        Query.EnableControls;
        if not lSeek
          then slSQL.Add('INSERT INTO &tmp& (ID) SELECT -999 FROM system.iota;');
      end;
    //------- Свой ---------------------------------------------------
    end else if (nType=TYPESEEK_ANY) then begin
      slSQL.Add(' insert into &tmp& (ID) SELECT -999 as ID FROM System.Iota;');
    //------- ЛПХ ---------------------------------------------------
    end else if (nType=TYPESEEK_MINTRUD) then begin
//      if IsAllDigit(Trim(strFilter)) and (Trim(strFilter)<>'') then begin
//        s2:=strFilter;

//        s1:='date_lpx1 is not null and Year(date_lpx1)<='+s2+' and (date_lpx2 is null or Year(date_lpx2)>='+s2+')';
//        if GlobalTask.ParamAsBoolean('OTM_MNS_LPX') then begin
//          s1:='(('+s1+') or (mns_lpx is not null and mns_lpx=true))';
//        end;
        s1:=' insert into &tmp& (ID) SELECT ID FROM Население WHERE date_fiks='+DateToSQL(DateFiks)+' and '+
         ' lic_id in ( SELECT ID FROM ЛицевыеСчета WHERE date_fiks='+DateToSQL(DateFiks)+' and mns_lpx=true )'+
         ' and dates is null and Trud(curdate(),dater,pol)=1 and getVozrast(curdate(),dater)>17 ;';
        slSQL.Add(s1);
        {
        n:=GlobalTask.ParamAsInteger('SEEK_LPX');
        if n=0 then n:=SEEK_LPX_DATE;
        s1:=dmBase.LoadSQLEx('_SeekMNS_LPX|'+IntToStr(n));
        if s1<>'' then begin
          slSQL.Add(s1);
        end else begin
          if n=SEEK_LPX_PL then begin
            s1:=' insert into &tmp& (ID) SELECT ID FROM Население WHERE date_fiks='+DateToSQL(DateFiks)+' and '+
             ' lic_id in (SELECT ID FROM БазаСвойствОбъектов WHERE '+
             ' date_fiks=' + DateToSQL(DateFiks)+' and typeobj='+intToStr(_TypeObj_Lich)+' and pokaz='+QStr('LPX')+
             ' and nvalue is not null and nvalue>0)';
          end else if n=SEEK_LPX_DATE then begin
            s1:=' insert into &tmp& (ID) SELECT ID FROM Население WHERE date_fiks='+DateToSQL(DateFiks)+' and '+
             ' lic_id in (SELECT ID FROM ЛицевыеСчета WHERE '+
             ' date_fiks='+DateToSQL(DateFiks)+' and date_lpx1 is not null and Year(date_lpx1)<='+s2+
             ' and (date_lpx2 is null or Year(date_lpx2)>='+s2+'))';
          end else if n=SEEK_LPX_CHECK then begin
            s1:=' insert into &tmp& (ID) SELECT ID FROM Население WHERE date_fiks='+DateToSQL(DateFiks)+' and '+
             ' lic_id in (SELECT ID FROM ЛицевыеСчета WHERE '+
             ' date_fiks='+DateToSQL(DateFiks)+' and mns_lpx is not null and mns_lpx=true)';
          end;
          }
//      end;
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

//----------------------------------------------------------------
function TfmGurnNasel.LoadQuery: Boolean;
var
 it : TTbItem;
 sep : TTbSeparatorItem;
 pt:TPermitType;
begin

  FSeekAsQuery:=true;

  Result := inherited LoadQuery;
{
  if Result then begin
    for i:=0 to Grid.Columns.Count-1 do begin
      if Grid.Columns[i].FieldName='ADRES_ID' then begin
        Grid.Columns[i].OnGetCellParams := GridColumnsGetAdres;
      end;
    end;
}

  pt:=Role.CheckSubSystem(SS_PASP);

  if ((Role.Status=rsAdmin) or (pt=ptFull)) and (DateFiks=dmBase.GetDateCurrentSost) then begin
    TBSubItemRun.Visible:=true;
    if TBSubItemRun.Count>0 then begin
      sep := TTbSeparatorItem.Create(TBSubItemRun);
      TBSubItemRun.Add(sep);
    end;

    if (Role.Status=rsAdmin) and (DateFiks=dmBase.GetDateCurrentSost) then begin
      it := TTbItem.Create(TBSubItemRun);
      it.Caption:='Контроль реестра на наличие ошибочных данных';
      it.OnClick:=Event_CheckErrorMens;
      TBSubItemRun.Add(it);
    end;

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Выписать людей у которых закончилась регистрация';
    it.OnClick:=Event_CheckUnRegistryMens;
    TBSubItemRun.Add(it);

    {  неправильно работает
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Удалить выписанных людей у которых закончилась регистрация';
    it.OnClick:=Event_DeleteRegistryMens;
    TBSubItemRun.Add(it);
    }
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Вернуть временно убывших';
    it.OnClick:=Event_CheckRegistryMens;
    TBSubItemRun.Add(it);

    if (Role.Status=rsAdmin) and (DateFiks=dmBase.GetDateCurrentSost) then begin
      it := TTbItem.Create(TBSubItemRun);
      it.Caption:='Изменить значение реквизита в базе';
      it.OnClick:=Event_InitFields;
      TBSubItemRun.Add(it);
    end;

    TBSubItemRun.Add( TTbSeparatorItem.Create(TBSubItemRun) );
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Выгрузить для Минтруда (база трудоспособных граждан)';
    it.OnClick:=Event_VigrMintrud;
    TBSubItemRun.Add(it);
  end;

  {
  itVklMens := TTbItem.Create(TBSubSysFlt);
  itVklMens.Name:='TBOnlyPresent';
  itVklMens.AutoCheck := true;
  itVklMens.Checked:=true;
  itVklMens.Caption:='Только присутствующие на территории';
  itVklMens.OnClick:=Event_VklMens;
  itVklMens.Visible:=false;
  TBSubSysFlt.Add(itVklMens);
  }

end;

//----------------------------------------------------------------
procedure TfmGurnNasel.LoadFromIni;
var
  i : Integer;
  ini : TSasainiFile;
begin
  inherited LoadFromIni;
  ini := GlobalTask.iniFile('LOCAL');

  FVisibleUdostLgot:=ini.ReadBool(KodGurnal+'.Add','VISIBLE_UL',false);
  FVisibleMR := ini.ReadBool(KodGurnal+'.Add','VISIBLE_MR',false);
  FVisiblePrib := ini.ReadBool(KodGurnal+'.Add','VISIBLE_PRIB',false);

  FVisibleParent := ini.ReadBool(KodGurnal+'.Add','VISIBLE_PARENT',false);
  FParent_DATER:=ini.ReadBool(KodGurnal+'.Add','PARENT_DATER',false);
  FParent_WORK:=ini.ReadBool(KodGurnal+'.Add','PARENT_WORK',false);
  FParent_PASP:=ini.ReadBool(KodGurnal+'.Add','PARENT_PASP',false);
  FParent_IN:=ini.ReadBool(KodGurnal+'.Add','PARENT_IN',false);

  FVisibleDeti:=ini.ReadBool(KodGurnal+'.Add','VISIBLE_DETI',false);
  FDetiVozr1:=ini.ReadInteger(KodGurnal+'.Add','DETI_VOZR1',0);
  FDetiVozr2:=ini.ReadInteger(KodGurnal+'.Add','DETI_VOZR2',18);
  FDetiCount:=ini.ReadInteger(KodGurnal+'.Add','DETI_COUNT',0);
  FDetiCount2:=ini.ReadInteger(KodGurnal+'.Add','DETI_COUNT2',4);

  FDetiOnlyMama:=ini.ReadBool(KodGurnal+'.Add','DETI_ONLYMAMA',true);
  FDetiAddOthosh:=ini.ReadBool(KodGurnal+'.Add','DETI_ADDOTNOSH',true);
  FDetiAddGodR:=ini.ReadInteger(KodGurnal+'.Add','DETI_ADDGODR',0);
  FUnionFIO:=ini.ReadBool(KodGurnal+'.Add','UNION_FIO',false);
  FUnionAdres:=ini.ReadBool(KodGurnal+'.Add','UNION_ADRES',true);
  FUnionPasp:=ini.ReadBool(KodGurnal+'.Add','UNION_PASP',false);

  CreateAdditiveWhere(getAdditiveWhere);

  for i:=0 to Grid.Columns.Count-1 do begin
    if Grid.Columns[i].FieldName='LGOT' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetLgot;
    end else if Grid.Columns[i].FieldName='DETI' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetDeti;
    end else if Grid.Columns[i].FieldName='ADD_INFO' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetAddInfo;
    end else if Grid.Columns[i].FieldName='PASP_VIDAN' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetPaspVidan;
    end else if Grid.Columns[i].FieldName='PA_ID' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetPapa;
    end else if Grid.Columns[i].FieldName='MA_ID' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetMama;
    end;
  end;
  CheckPropertyUnionFIO;
  CheckPropertyUnionAdres;
  CheckPropertyUnionPasp;
  CheckAddGraf;
  try
    Grid.FieldColumns['MNS_LPX'].Visible:=GlobalTask.ParamAsBoolean('OTM_MNS_LPX');
  except
  end;
  {$IFDEF GKH}
    try
      Grid.FieldColumns['Date_LPX1'].Visible:=false;
      Grid.FieldColumns['Date_LPX2'].Visible:=false;
    except
    end;
  {$ENDIF}
end;

procedure TfmGurnNasel.SaveToIni;
var
  ini : TSasaIniFile;
begin
  ini := GlobalTask.iniFile('LOCAL');

  ini.WriteBool(KodGurnal+'.Add','VISIBLE_UL',FVisibleUdostLgot);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_MR',FVisibleMR);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_PRIB',FVisiblePrib);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_PARENT',FVisibleParent);

  ini.WriteBool(KodGurnal+'.Add','PARENT_DATER',FParent_DATER);
  ini.WriteBool(KodGurnal+'.Add','PARENT_WORK',FParent_WORK);
  ini.WriteBool(KodGurnal+'.Add','PARENT_PASP',FParent_PASP);
  ini.WriteBool(KodGurnal+'.Add','PARENT_IN',FParent_IN);

  ini.WriteBool(KodGurnal+'.Add','VISIBLE_DETI',FVisibleDeti);
  ini.WriteInteger(KodGurnal+'.Add','DETI_VOZR1',FDetiVozr1);
  ini.WriteInteger(KodGurnal+'.Add','DETI_VOZR2',FDetiVozr2);
  ini.WriteInteger(KodGurnal+'.Add','DETI_COUNT',FDetiCount);
  ini.WriteInteger(KodGurnal+'.Add','DETI_COUNT2',FDetiCount2);
  ini.WriteBool(KodGurnal+'.Add','DETI_ONLYMAMA',FDetiOnlyMama);
  ini.WriteBool(KodGurnal+'.Add','DETI_ADDOTNOSH',FDetiAddOthosh);
  ini.WriteInteger(KodGurnal+'.Add','DETI_ADDGODR',FDetiAddGodR);
  ini.WriteBool(KodGurnal+'.Add','UNION_FIO',FUnionFIO);
  ini.WriteBool(KodGurnal+'.Add','UNION_ADRES',FUnionAdres);
  ini.WriteBool(KodGurnal+'.Add','UNION_PASP',FUnionPasp);

  inherited SaveToIni;
//  ini.WriteInteger(KodGurnal+'.Add','VISIBLEMENS',FVisibleMens);
end;

//----------------------------------------------------------------------
procedure TfmGurnNasel.Event_CheckUnRegistryMens(Sender: TObject);
var
  strSQL,strSoob,s : String;
  nCount,n : Integer;
  sl,slErr:TStringList;
  vKeyValues:Variant;
  lErr:Boolean;
begin
   n := QuestionPos(' Выписать людей с истекшим сроком регистрации ? ',
        ' Выполнить ; Просмотр кандидатов ; Отказ ;','',-1,-1,qtConfirmation, Self);

//  if Problem(' Выписать людей с истекшим сроком регистрации ? ') then begin
  if (n=1) or (n=2) then begin
//   только для присутствующих людей (present=true)
//    strSQL := 'select distinct(id) from Население where candelete=false and present=true and '+#13+
//              'date_srok is not null and date_srok<=curdate() and date_fiks=&DATE_FIKS& ';

//    strSQL := 'select distinct(id) from Население where candelete=false and present=true and lic_id>0 and '+#13+
//              'date_srok is not null and date_srok<=curdate() and date_fiks=&DATE_FIKS& ';

    strSQL:=dmBase.LoadSQLEx('_ПроверитьДвижениеНаселения');

    strSQL := dmBase.CheckDateFiksSQL(strSQL, DateFiks);
    strSQL := StringReplace(strSQL,'&TIP&','1',[rfReplaceAll,rfIgnoreCase]);   // выписка
    nCount := 0;
    TmpQuery.SQL.Text := strSQL;
    OpenMessage('Поиск людей ...','',10);
    sl:=TStringList.Create;
    slErr:=TStringList.Create;
    try
      TmpQuery.Open;
      while not TmpQuery.Eof do begin
        lErr:=false;
        if n=1 then begin
          if not dmBase.VipisMen(DateFiks, TmpQuery.FieldByName('ID').AsInteger, TmpQuery.FieldByName('DATE_SROK').AsDateTime, strSoob) then begin
            slErr.Append(strSoob);
            lErr:=true;
          end;
        end else begin
          vKeyValues := dmBase.CreateSeek(DateFiks, TmpQuery.FieldByName('ID').AsInteger);
          with dmBase.tbMens do begin
            if Locate('DATE_FIKS;ID', vKeyValues, []) then begin
              strSoob := FieldByName('FAMILIA').AsString+' '+FieldByName('NAME').AsString+' '+FieldByName('OTCH').AsString+' '+
                         dmBase.AdresFromIDEx(DateFiks, FieldByName('ADRES_ID').AsString, true, true);
            end;
          end;
        end;
        if not lErr then begin
          sl.Add(strSoob);
          Inc(nCount,1);
        end;
        TmpQuery.Next;
      end;
    finally
      CloseMessage;
      TmpQuery.Close;
    end;
    if (nCount>0) or (slErr.Count>0) then begin
      if n=1 then s:=' Выписано    ' else s:=' Будет выписано';
      sl.Insert(0,s+': '+IntToStr(nCount)+' чел. ');
      if slErr.Count>0 then begin
        sl.Insert(0,' Ошибочных : '+IntToStr(slErr.Count)+' чел. (см.ниже)');
        sl.Append(StringOfChar('-',60));
        sl.AddStrings(slErr);
      end;
      ShowMemo(sl,'Сообщение','0;0;600;600');
//      ShowMessage('  Выписано: '+IntToStr(nCount)+' человек.  ' );
      Refresh(true);
    end else begin
      ShowMessageCont('  Никто не найден.  ', self );
    end;
    sl.Free;
    slErr.Free;
  end;
end;

//----------------------------------------------------------------------
procedure TfmGurnNasel.Event_CheckRegistryMens(Sender: TObject);
var
  strSQL,strSoob,s : String;
  nCount,n : Integer;
  sl,slErr:TStringList;
  vKeyValues:Variant;
  lErr:Boolean;
begin
   n := QuestionPos(' Вернуть временно убывших с истекшим сроком отсутствия ? ',
        ' Выполнить ; Просмотр кандидатов ; Отказ ;','',-1,-1,qtConfirmation, Self);

//  if Problem(' Вернуть временно убывших с истекшим сроком ? ') then begin
  if (n=1) or (n=2) then begin
// только для отсутствующих людей (present=false)
//    strSQL := 'select distinct(id) from Население where candelete=false and present=false and propis=true and lic_id>0 and '+#13+
//              'date_srok is not null and date_srok<=curdate() and date_fiks=&DATE_FIKS& ';

    strSQL:=dmBase.LoadSQLEx('_ПроверитьДвижениеНаселения');

    strSQL := dmBase.CheckDateFiksSQL(strSQL, DateFiks);
    strSQL := StringReplace(strSQL,'&TIP&','0',[rfReplaceAll,rfIgnoreCase]);   // выбывшие
    nCount := 0;
    TmpQuery.SQL.Text := strSQL;
    OpenMessage('Поиск людей ...','',10);
    sl:=TStringList.Create;
    slErr:=TStringList.Create;
    try
      TmpQuery.Open;
      while not TmpQuery.Eof do begin
        lErr:=false;
        if n=1 then begin
          if not dmBase.VozvratMen(DateFiks, TmpQuery.FieldByName('ID').AsInteger, TmpQuery.FieldByName('DATE_SROK').AsDateTime, strSoob) then begin
            slErr.Append(strSoob);
            lErr:=true;
          end;
        end else begin
          vKeyValues := dmBase.CreateSeek(DateFiks, TmpQuery.FieldByName('ID').AsInteger);
          with dmBase.tbMens do begin
            if Locate('DATE_FIKS;ID', vKeyValues, []) then begin
              strSoob := FieldByName('FAMILIA').AsString+' '+FieldByName('NAME').AsString+' '+FieldByName('OTCH').AsString+' '+
                         dmBase.AdresFromIDEx(DateFiks, FieldByName('ADRES_ID').AsString, true, true);
            end;
          end;
        end;
        if not lErr then begin
          sl.Add(strSoob);
          Inc(nCount,1);
        end;
        TmpQuery.Next;
      end;
    finally
      CloseMessage;
      TmpQuery.Close;
    end;
    if (nCount>0) or (slErr.Count>0)then begin
      if n=1 then s:='Возвращено' else s:='Будет возвращено';
      sl.Insert(0,' '+s+' : '+IntToStr(nCount)+' чел. ');
      if slErr.Count>0 then begin
        sl.Insert(0,' Ошибочных   : '+IntToStr(slErr.Count)+' чел. (см.ниже)');
        sl.Append(StringOfChar('-',60));
        sl.AddStrings(slErr);
      end;
      ShowMemo(sl,'Сообщение','0;0;600;600');
//      ShowMessage('  Восстановлено: '+IntToStr(nCount)+' человек.  ' );
      Refresh(true);
    end else begin
      ShowMessageCont('  Никто не найден.  ',self );
    end;
    sl.Free;
    slErr.Free;
  end;
end;

//----------------------------------------------------------------------
procedure TfmGurnNasel.Event_DeleteRegistryMens(Sender: TObject);
var
  strSQL,s : String;
  nCount : Integer;
  vKeyValues:Variant;
begin
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
  s := s + 'введите слово ДА в поле ввода'#13;
  if OkWarning(s) then begin
    strSQL := 'select distinct(id) from Население where date_srok is not null and candelete=true and '+
              'date_srok<=curdate() and date_fiks=&DATE_FIKS& ';
//    strSQL := 'select distinct(id) from Население where date_srok is not null and lic_id>0 and candelete=true and '+
//              'date_srok<=curdate() and date_fiks=&DATE_FIKS& ';
    strSQL := dmBase.CheckDateFiksSQL(strSQL, DateFiks);
    nCount := 0;
    TmpQuery.SQL.Text := strSQL;
    OpenMessage('Поиск людей ...','',10);
    try
      TmpQuery.Open;
      ChangeMessage('Удаление ...');
      while not TmpQuery.Eof do begin
        if not dmBase.DeleteMen(DateFiks, TmpQuery.FieldByName('ID').AsString,true) then begin
          PutError(dmBase.LastErrorDelete);
        end else begin
          Inc(nCount,1);
        end;
        TmpQuery.Next;
      end;
    finally
      CloseMessage;
      TmpQuery.Close;
    end;
    if nCount>0 then begin
      ShowMessage('  Удалено: '+IntToStr(nCount)+' человек.  ' );
      Refresh(true);
    end else begin
      ShowMessage('  Для удаления никто не найден.  ' );
    end;
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.Event_CheckErrorMens(Sender: TObject);
var
  strSQL : String;
  nCount : Integer;
begin
  if Problem(' Выполнить контроль реестра на наличие ошибочных данных ? ') then begin
    OpenMessage('Контроль базы населения ...','',10);
    Application.ProcessMessages;
    strSQL:='UPDATE Население SET lic_id=0,first=false '+#13+
            '  FROM Население '+#13+
            '  LEFT JOIN ЛицевыеСчета l ON l.date_fiks=Население.Date_fiks and l.id=Население.lic_id '+#13+
            '  WHERE Население.lic_id>0 and l.id is null';
    dmBase.AdsConnection.Execute(strSQL);
    Application.ProcessMessages;
    strSQL:='UPDATE Население SET present=true WHERE present is null; '+
            'UPDATE Население SET propis=true WHERE propis is null;'+
            'UPDATE Население SET nomer_sem=0 WHERE nomer_sem is null;'+
            'UPDATE Население SET candelete=false WHERE candelete is null;'+
            'UPDATE Население SET present=false WHERE candelete=true and present=true;'+
            'UPDATE Население SET propis=false WHERE candelete=true and propis=true;'+
            'UPDATE Население SET lic_id=0 WHERE lic_id>0 and date_fiks=''1899-12-30'' and lic_id not in (select id from ЛицевыеСчета where date_fiks=''1899-12-30'');'+
            'DELETE FROM НаселениеЛьготы WHERE kod in (select distinct kod from населениельготы n left join спрльготников s on n.kod=s.id where s.id is null);'+
            'UPDATE Население SET ochered=true WHERE id in (select n.ID from население n left join Ochered oc on n.id=oc.id where n.date_fiks='+
                  QStr(CURRENT_SOST)+' and oc.OCHERED_ID=0 and n.ochered=false);';
    dmBase.AdsConnection.Execute(strSQL);
    if dmBase.LoadSQL('Ошибочные_люди',strSQL) then begin
      strSQL := dmBase.CheckDateFiksSQL(strSQL, DateFiks);
      nCount := 0;
      TmpQuery.SQL.Text := strSQL;
      ChangeMessage('Поиск людей ...');
      Application.ProcessMessages;
      try
        TmpQuery.Open;
        ChangeMessage('Удаление ...');
        Application.ProcessMessages;
        while not TmpQuery.Eof do begin
          if not dmBase.DeleteMen(DateFiks, TmpQuery.FieldByName('ID').AsString,true) then begin
            PutError(dmBase.LastErrorDelete);
          end else begin
            Inc(nCount,1);
          end;
          TmpQuery.Next;
        end;
      finally
        CloseMessage;
        TmpQuery.Close;
      end;
      if nCount>0 then begin
        ShowMessage(' Ошибочные данные удалены: '+IntToStr(nCount)+' человек.  ' );
        Refresh(true);
      end else begin
        ShowMessage('  Для удаления никто не найден.  ' );
      end;
    end else begin
      PutError('Не найден запрос: "Ошибочные_люди"');
    end;
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.Event_InitFields(Sender: TObject);
var
  lFilter : Boolean;
begin
  if TBItemClrFlt.Enabled or Query.Filtered or FSeekAsQuery_Active then begin
    lFilter := true;
  end else begin
    lFilter := false;
  end;
  if RunInitRekvisit(Self, Query, dmBase.tbMens, 'DATE_FIKS;ID', lFilter) then Refresh(true);
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.Event_VigrMinTrud(Sender: TObject);
var
  v : Variant;
  n:Integer;
begin
  if (GlobalTask.Script<>nil) then begin
    if Trim(GlobalTask.ParamAsString('UNP'))='' then begin
      PutError('Заполните код УНП в параметрах', self);
      exit;
    end;
    v:=null;
//    if (Trim(edSeek.text)<>'') and (edFind.ItemIndex=TYPESEEK_MINTRUD) and FSeekAsQuery_Active then begin
    if TBItemClrFlt.Enabled or Query.Filtered or FSeekAsQuery_Active then begin
//      nYear:=StrToInt(edSeek.text);
      Query.DisableControls;
      try
        Query.Filter:='empty(LICH_NOMER)';
        Query.Filtered:=true;
        Query.First;
        n:=0;
        while not Query.Eof do begin
          n:=n+1;
          Query.Next;
        end;
        Query.Filtered:=false;
        if n=0 then begin
          GlobalTask.Script.RunEx('NaselToMintrud',[1,edSeek.text],v);
        end else begin
          PutError('Отсутствует идентификационный номер: '+IntTostr(n)+' чел. (обязательно для выгрузки)',self);
        end;
      finally
        Query.EnableControls;
      end;
    end else begin
//      PutError('Установите вспомогательный отбор "Выгрузка для Минтруда"',self);
      PutError('Выгрузка недоступна',self);
    end;
  end;
end;
//----------------------------------------------------------------
function TfmGurnNasel.GetHintSeek(n:Integer):String;
begin
  case n of
    TYPESEEK_FIO   : Result:='Фамилия Имя человека';
//    TYPESEEK_FIO_SS   : Result:='Фамилия Имя или человека из состава семьи';
    TYPESEEK_MINTRUD  : Result:='Отбор для выгрузки для Минтруда ';
    TYPESEEK_ANY   : Result:='Произвольный пользовательский отбор ';
    TYPESEEK_LIC   : Result:='Номер лицевого счета';
    TYPESEEK_DETI  : Result:='Количество детей на лицевом счете согласно параметров';
  else
    Result:='';
  end;
end;
//------------------------------------------------------------------------------
procedure TfmGurnNasel.edSeekChange(Sender: TObject);
begin
  if not FRun then begin
    if FSeekEnter then begin

    end else begin
      if edFind.ItemIndex=TYPESEEK_FIO then begin
        EditSeekChange;
      end;
    end;
  end;
//    setAdditiveFilter;
//    ActiveControl:=edSeek;
end;
//------------------------------------------------------------------------------
procedure TfmGurnNasel.EditSeekChange;
var
  strFilter : String;
  nLen,n : Integer;
begin
  strFilter := Trim(edSeek.Text);
  if (strFilter<>'') then begin
    if (edFind.ItemIndex=TYPESEEK_FIO) and IsAllDigit(strFilter) then begin
      edFind.ItemIndex:=TYPESEEK_LIC;
    end;
  end else begin
    Query.Filtered := false;
    Query.OnFilterRecord:=nil;
    Query.Filter := '';
  end;
  if (edFind.ItemIndex=TYPESEEK_FIO) and (strFilter<>'') then begin   // без подтверждения клавишей [Enter]
    nLen := Length(strFilter);
    Query.DisableControls;
    Query.Filtered := false;
    Query.OnFilterRecord:=nil;
//    if FSeekAsQuery_Active
//      then
    if nLen = 0 then begin
      Query.Filter := '';
    end else begin
      n:=Pos(' ',strFilter);
      if n>0 then begin
        Query.Filter := 'FAMILIA='+QStr(Copy(strFilter,1,n-1)+'*')+
                        'and NAME='+QStr(Copy(strFilter,n+1,20)+'*');
      end else begin
        Query.Filter := 'FAMILIA='+QStr(strFilter+'*');
      end;
      Query.Filtered := true;
    end;
    Query.EnableControls;
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.edSeekEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  SetAdditiveFilter;
end;
//----------------------------------------------------------------
procedure TfmGurnNasel.edSeekEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  Handled:=true;
  TBItemClrFltClick(nil);
end;
//----------------------------------------------------------------
procedure TfmGurnNasel.ClearSeek;
begin
  FRun:=true;
  edSeek.Text:='';
  edFind.ItemIndex:=TYPESEEK_FIO;
  FRun:=false;
  FSeekAsQuery_Active:=false;
  TBItemIsklOtbor.Enabled:=FSeekAsQuery_Active;
  TBItemAddOtbor.Enabled:=FSeekAsQuery_Active;
  TBItemWriteSavedFilter.Enabled:=FSeekAsQuery_Active;

//  setAdditiveFilter;
end;
//----------------------------------------------------------------
procedure TfmGurnNasel.edFindChange(Sender: TObject);
var
  lClear:Boolean;
begin
{
    Query.Filtered := false;
    Query.OnFilterRecord:=nil;
    Query.Filter := '';
}
  FRun:=true;
  lClear:=false;
  try
    edSeek.Hint:=GetHintSeek(edFind.ItemIndex);
    edSeek.Text:='';
    if FSeekAsQuery_Active then begin
      lClear:=true;
      setAdditiveFilter;
    end;
//      ActiveControl:=edSeek;
  finally
    FRun:=false;
  end;
  if edFind.ItemIndex=TYPESEEK_FIO then begin
    edSeek.EditButtons[0].Visible:=FSeekEnter;
  end else begin
    edSeek.EditButtons[0].Visible:=true;
  end;
  if (edFind.ItemIndex=TYPESEEK_MINTRUD) or (edFind.ItemIndex=TYPESEEK_ANY) then begin
    edSeek.Text:='*';
    edSeek.ReadOnly:=true;
    SetAdditiveFilter;
  end else begin
    edSeek.ReadOnly:=false;
    if lClear then
      ClearFilter;
  end;
end;
{
var
  cur:TCursor;
begin
  edSeek.Text:='';
  Query.Filtered := false;
  Query.OnFilterRecord:=nil;
  Query.Filter := '';
  edSeek.Enabled:=((edFind.ItemIndex=0) or (edFind.ItemIndex=1));
  if edFind.ItemIndex=2 then begin
    edFind.Hint:='Поиск людей только с детьми (в соответствии с настройкой графы с детьми)';
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    Query.OnFilterRecord:=QueryFilterRecord;
    Query.Filtered := true;
    Screen.Cursor:=cur;
  end else begin
    edFind.Hint:='';
  end;
end;
}

//----------------------------------------------------------------
procedure TfmGurnNasel.edSeekKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
  strFilter : String;
  nLen : Integer;
begin
  inherited;
  if (Key=VK_RETURN) and (Shift=[]) then begin
    if (edFind.ItemIndex<>TYPESEEK_FIO) or FSeekEnter
      then setAdditiveFilter;
    {                           
    // поиск по номеру лиц. счета
    if (edFind.ItemIndex=1) then begin
      strFilter := StringReplace(Trim(edSeek.Text),' ','',[rfReplaceAll]);
      nLen := Length(strFilter);
      Query.DisableControls;
      Query.Filtered := false;
      Query.OnFilterRecord:=nil;
      if nLen = 0 then begin
        Query.Filter := '';
      end else begin
        if IsAllDigit(strFilter) then begin
          Query.Filter := 'LIC_NOMER='+strFilter;
          Query.Filtered := true;
        end else begin
          Beep;
        end;
      end;
      if not Query.Eof then begin
        ActiveControl := Grid;
      end;
      Query.EnableControls;
    end else begin
      if (edFind.ItemIndex=TYPESEEK_FIO) then begin
        EditSeekChange;
        if not Query.Eof then begin
          ActiveControl := Grid;
        end;
      end;
    end;
      }
    Key:=0;
  end else if (Key=VK_TAB) and (Shift=[]) then begin
    ActiveControl := Grid;
    Key:=0;
  end;
end;

//-------------------------------------------------------------------------------------------------
procedure TfmGurnNasel.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
begin
  SetColorRowGridMen(AFont,Background,Query);
end;

procedure TfmGurnNasel.FormResize(Sender: TObject);
begin
  TBToolWindow1.DockPos:=1400;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.TBItemLgotClick(Sender: TObject);
var
  strSeek : String;
  strSQL  : String;
begin
  strSeek := RunMensSeek(tsLgot, true, FID, '');
  if Length(strSeek)>0 then begin
    strSeek := FFilterJurnal.GetDefaultWhere+' and ' + strSeek;
    strSQL  := ChangeWhere( Query.SQL.Text, strSeek, false);
    FNewSQL := strSQL;
    Refresh;              
    FNewSQL:='';
    TBItemClrFlt.Enabled:=true;
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.TBItemPriznClick(Sender: TObject);
var
  strSeek : String;
  strSQL  : String;
begin
  strSeek := RunMensSeek(tsPrizn, true, FID, '');
  if Length(strSeek)>0 then begin
    strSeek := FFilterJurnal.GetDefaultWhere+' and ' + strSeek;
    strSQL  := ChangeWhere( Query.SQL.Text, strSeek, false);
    FNewSQL := strSQL;
    Refresh;
    FNewSQL:='';
    TBItemClrFlt.Enabled:=true;
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.TBItemEditLicClick(Sender: TObject);
begin
  if fmMain.EditDokument(Query, dmBase.TypeObj_Lich,'LIC_ID',nil,true,KodGurnal) then begin
//    Refresh;
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.AddUpdateActions;
begin
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.GridColumnsGetAddInfo(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  d : TDateTime;
  i : Integer;
begin
  if Query.FieldByName('ID').AsString<>'' then begin
    d := Query.FieldByName('DATE_FIKS').AsDateTime;
    i := Query.FieldByName('ID').AsInteger;
    Params.Text := dmBase.ReadOneProp(d, i, 'ADD_INFO', ftMemo);
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.GridColumnsGetLgot(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  d : TDateTime;
  i : Integer;
begin
  if Query.FieldByName('ID').AsString<>'' then begin
    d := Query.FieldByName('DATE_FIKS').AsDateTime;
    i := Query.FieldByName('ID').AsInteger;
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
  end;
end;
//----------------------------------------------------------------
function TfmGurnNasel.getAddInfoMen(sID:String):String;
var
  ds:TDataSet;
  sW,sD:String;
  d:TDateTime;
begin
  Result:='';
  d:=Query.FieldByName('DATE_FIKS').AsDateTime;
  ds:=dmBase.GetMen(d, sID);
  if ds<>nil then begin
    Result:= ds.FieldByName('FAMILIA').AsString+' '+ds.FieldByName('NAME').AsString+' '+ds.FieldByName('OTCH').AsString;
    if FParent_DATER and not ds.FieldByName('DATER').IsNull then begin
      Result:=Result+', '+DatePropis(ds.FieldByName('DATER').AsDateTime,3);
    end;
    if FParent_IN and (ds.FieldByName('LICH_NOMER').AsString<>'') then begin
      Result:=Result+', '+ds.FieldByName('LICH_NOMER').AsString;
    end;
    if FParent_WORK then begin
      sW:=dmBase.getMenWork(d,sID);
      sD:=dmBase.getMenDolg(d,sID);
      if sD<>'' then sW:=sW+', '+sD;
      if sW<>''
        then Result:=Result+chr(13)+chr(10)+' '+sW;
    end;
    if FParent_PASP then begin
      sW:=dmBase.GetMenPasp(d,sID,0);
      if sW<>''
        then Result:=Result+chr(13)+chr(10)+' '+sW;
    end;
  end;
end;
//----------------------------------------------------------------
procedure TfmGurnNasel.GridColumnsGetMama(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=getAddInfoMen(Query.FieldByName('MA_ID').AsString);
//  dmBase.FIOMen(Query.FieldByName('DATE_FIKS').AsDateTime, Query.FieldByName('MA_ID').AsString);
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.GridColumnsGetPapa(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=getAddInfoMen(Query.FieldByName('PA_ID').AsString);
//  Params.Text:=dmBase.FIOMen(Query.FieldByName('DATE_FIKS').AsDateTime, Query.FieldByName('PA_ID').AsString);
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.GridColumnsGetDeti(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  i : Integer;
  s1,s2:String;
begin
  Params.Text:='';
  if Query.FieldByName('ID').AsString<>'' then begin
    if not FDetiOnlyMama or (Query.FieldByName('POL').AsString<>'М') then begin
      dbEmptyTable(ListDeti);
      dmBase.GetDeti(ListDeti, Query.FieldByName('ID').AsString,
                              Query.FieldByName('POL').AsString,FDetiVozr1,FDetiVozr2,false,false);
      i:=ListDeti.RecordCount;
      if (i>0) then begin //and (i>FDetiCount) and (i<FDetiCount2) then begin
        while not ListDeti.Eof do begin
          if FDetiAddOthosh then begin
            if ListDeti.FieldByName('POL').AsString='М' then s1:='сын ' else s1:='дочь ';
          end else begin
            s1:='';
          end;
          if ListDeti.FieldByName('DATER').isNull then begin
            s2:='';
          end else begin
            case FDetiAddGodR of
              0 : s2:=' '+FormatDateTime('YYYY',ListDeti.FieldByName('DATER').AsDateTime)+'г.р.'; // год рождения
              1 : s2:=' '+FormatDateTime('DD.MM.YYYY',ListDeti.FieldByName('DATER').AsDateTime)+'г.';  // дата рождения
              2 : s2:=' '+GetVozrast(ListDeti.FieldByName('AGE').AsInteger, true); // возраст
            else
              s2:='';  // ничего
            end;
          end;
          Params.Text:=Params.Text+s1+
          ListDeti.FieldByName('FAMILIA').AsString+' '+ListDeti.FieldByName('NAME').AsString+' '+ListDeti.FieldByName('OTCH').AsString+
          s2+#13#10;
          ListDeti.Next;
        end;
      end;
    end;
    if Params.Text<>'' then Params.Text:=Copy(Params.Text,1,Length(Params.Text)-2);
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.GridColumnsGetPaspVidan(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  d : TDateTime;
  i : Integer;
begin
  if Query.FieldByName('ID').AsString<>'' then begin
    d := Query.FieldByName('DATE_FIKS').AsDateTime;
    i := Query.FieldByName('ID').AsInteger;
    Params.Text := dmBase.ReadOneProp(d, i, 'PASP_VIDAN', ftMemo);
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.TBItemAddMenClick(Sender: TObject);
begin
  FListPar.Clear;
  FListPar.Add('MEN_NOTPROPIS=1');
  FListPar.Add('MEN_ADD=1');
  try
    if fmMain.EditDokument(Query, TypeEditObj,'ID', FListPar,true,KodGurnal) then begin
      Refresh(false);
    end;
  finally
    FListPar.Clear;
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.TBItemCopyMenClick(Sender: TObject);
var
  nNewLic:Integer;
begin
  nNewLic:=dmBase.CopyMen(DateFiks,Query.FieldByName('ID').AsString,'','',dmBase.GetCurDate,GlobalTask.ParamAsBoolean('SAVE_DVIG_COPY'));
  if nNewLic>0 then begin
    if fmMain.EditDokument(Query, dmBase.TypeObj_Lich,IntToStr(nNewLic),nil,true, KodGurnal) then begin

    end;
    Refresh;
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.QueryAfterScroll(DataSet: TDataSet);
var
  lNoneLic : Boolean;
begin
  inherited;
  // челове без лицевого счета (корректировка счета невозможна, удаление человека доступно
  if (Query.FieldByName('LIC_ID').AsString='') or (Query.FieldByName('LIC_ID').AsString='0') then begin
    lNoneLic := true;
  end else begin
    lNoneLic := false;
  end;
  if Query.Eof and Query.Bof then begin
    TBItemEditLic.Enabled:=false;
    if FEnableWrite
      then TBItemDelDok.Enabled:=false;
  end else begin
    if lNoneLic then begin
      TBItemEditLic.Enabled:=false;
      if FEnableWrite
        then TBItemDelDok.Enabled:=true;
    end else begin
      TBItemEditLic.Enabled:=true;
      if FEnableWrite
        then TBItemDelDok.Enabled:=false;
    end;
  end;
  // копирование недоступно если человек должен быть удален или он без лицевого счета
  if lNoneLic or (Query.FieldByName('CANDELETE').AsBoolean=true)
    then TBItemCopyMen.Enabled:=false
    else TBItemCopyMen.Enabled:=true;
end;

procedure TfmGurnNasel.TBItemDopGrafClick(Sender: TObject);
var
  f : TfmTypeGurnalNasel;
begin
  f := TfmTypeGurnalNasel.Create(nil);
  f.cbPrib.Checked:=FVisiblePrib;
  f.cbUL.Checked:=FVisibleUdostLgot;
  f.cbMR.Checked:=FVisibleMR;
  f.cbParent.Checked:=FVisibleParent;

  f.cbParentDATER.Checked:=FParent_DATER;
  f.cbParentWORK.Checked:=FParent_WORK;
  f.cbParentPASP.Checked:=FParent_PASP;
  f.cbParentIN.Checked:=FParent_IN;

  f.cbDeti.Checked:=FVisibleDeti;
  f.edVozr1.Value:=FDetiVozr1;
  f.edVozr2.Value:=FDetiVozr2;
//  f.edKolvo.Value:=FDetiCount;
//  f.edKolvo2.Value:=FDetiCount2;
  f.cbOnlyMama.Checked:=FDetiOnlyMama;
  f.cbDetiOtnosh.Checked:=FDetiAddOthosh;
  f.edDetiGod.ItemIndex:=FDetiAddGodR;
  f.cbUnionFIO.Checked:=FUnionFIO;
  f.cbUnionAdres.Checked:=FUnionAdres;
  f.cbUnionPasp.Checked:=FUnionPasp;

  if f.ShowModal=mrOk then begin
    FVisiblePrib := f.cbPrib.Checked;
    FVisibleUdostLgot:=f.cbUL.Checked;
    FVisibleMR := f.cbMR.Checked;

    FVisibleParent:=f.cbParent.Checked;
    FParent_DATER:=f.cbParentDATER.Checked;
    FParent_WORK:=f.cbParentWORK.Checked;
    FParent_PASP:=f.cbParentPASP.Checked;
    FParent_IN:=f.cbParentIN.Checked;

    FVisibleDeti := f.cbDeti.Checked;
    try
      FDetiVozr1 := f.edVozr1.Value;
    except
      FDetiVozr1 := 0;
    end;
    try
      FDetiVozr2 := f.edVozr2.Value;
    except
      FDetiVozr2 := 18;
    end;
//    FDetiCount   := f.edKolvo.Value;
//    FDetiCount2  := f.edKolvo2.Value;
    FDetiOnlyMama:=f.cbOnlyMama.Checked;
    FDetiAddOthosh:=f.cbDetiOtnosh.Checked;
    FDetiAddGodR:=f.edDetiGod.ItemIndex;
    FUnionFIO:=f.cbUnionFIO.Checked;
    FUnionAdres:=f.cbUnionAdres.Checked;
    FUnionPasp:=f.cbUnionPasp.Checked;

    CheckAddGraf;
    CheckPropertyGridColumns;
    CheckPropertyUnionFIO;
    CheckPropertyUnionAdres;
    CheckPropertyUnionPasp;
//    if edFind.ItemIndex=2 then begin
      Refresh(true);
//    end;
  end;
  f.Free;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.CheckAddGraf;
begin
  try
    Grid.FieldColumns['MEN_PRIB_UBIL'].Visible:=FVisiblePrib;
    Grid.FieldColumns['MR_GOROD'].Visible:=FVisibleMR;
    Grid.FieldColumns['PA_ID'].Visible:=FVisibleParent;
    Grid.FieldColumns['MA_ID'].Visible:=FVisibleParent;
    Grid.FieldColumns['DETI'].Visible:=FVisibleDeti;
    Grid.FieldColumns['UDOST_LGOT'].Visible:=FVisibleUdostLgot;
  except
  end
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  Grid.MyUserKeyDown(Sender,Key,Shift);   // !!!   чтобы срабатывали стандартные клавиши из SasaDbGrid

  if (Key>0) and (Key=VK_TAB) then begin
    ActiveControl:=edSeek;
    Key:=0;
  end;
end;

//-----------------------------------------------------------------------------
procedure TfmGurnNasel.QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  n:Integer;
begin
  Accept := false;
  try
    n := dmBase.GetCountDeti(Query.FieldByName('ID').AsString,
                             Query.FieldByName('POL').AsString,
                             FDetiVozr1,FDetiVozr2,false,false);
    if (n>0) and (n>FDetiCount) and (n<FDetiCount2)
      then Accept := true;
    if Accept then begin
      if FDetiOnlyMama and (Query.FieldByName('POL').AsString='М') then begin
        Accept := false;
      end;
    end;
  except
  end;
end;

//----------------------------------------------------------------
procedure TfmGurnNasel.TBItemPunktsClick(Sender: TObject);
begin
  ClickPunkts;
end;

procedure TfmGurnNasel.TBSubmenuPunktsClick(Sender: TObject);
begin
  ClickPunkts;
end;

procedure TfmGurnNasel.TBItemClearPunktsClick(Sender: TObject);
begin
  ClearPunkts;
end;
//---------------------------------------------------------------------
procedure TfmGurnNasel.TBItemClrFltClick(Sender: TObject);
begin
  ClearSeek;
  inherited;
end;
//---------------------------------------------------------------------
procedure TfmGurnNasel.CreateParSavedFilter(sl: TStringList);
begin
  case edFind.ItemIndex of
    TYPESEEK_FIO : sl.Add('INDEX=FIO');
    TYPESEEK_LIC : sl.Add('INDEX=LIC');
    TYPESEEK_DETI: sl.Add('INDEX=DETI');
    TYPESEEK_MINTRUD: sl.Add('INDEX=MINTRUD');
    TYPESEEK_ANY: sl.Add('INDEX=ANY');
  end;
  sl.Add('VALUE='+StringReplace(edSeek.Text,'=','(chr61)',[rfReplaceAll]));
end;
//---------------------------------------------------------------------
function TfmGurnNasel.ReadParSavedFilter(sl: TStringList): Boolean;
var
  i:Integer;
  s:String;
begin
  Result:=true;
  edFind.ItemIndex:=-1;
  for i:=0 to sl.Count-1 do begin
    s:=StringReplace(Trim(sl.ValueFromIndex[i]),'(chr61)','=',[rfReplaceAll]);
    if sl.Names[i]='INDEX' then begin
      if s='FIO' then begin
        edFind.ItemIndex:=TYPESEEK_FIO;
      end else if s='LIC' then begin
        edFind.ItemIndex:=TYPESEEK_LIC;
      end else if s='DETI' then begin
        edFind.ItemIndex:=TYPESEEK_DETI;
      end else if s='MINTRUD' then begin
        edFind.ItemIndex:=TYPESEEK_MINTRUD;
      end else if s='ANY' then begin
        edFind.ItemIndex:=TYPESEEK_ANY;
      end;
    end else if sl.Names[i]='VALUE' then begin
      edSeek.Text:=s;
    end;
  end;
  if edFind.ItemIndex=-1
    then Result:=false;
end;

procedure TfmGurnNasel.TBItemEmptyAdresClick(Sender: TObject);
var
  strSQL  : String;
begin
  FFltCaption:='[Без адресов]';
  SetCaptionGurnal;
  strSQL  := ChangeWhere( Query.SQL.Text, FFilterJurnal.DefaultWhere+' and punkt is null and n.adres_id>0', false);
  FNewSQL := strSQL;
  Refresh;
  FNewSQL:='';
  TBItemClrFlt.Enabled:=true;
end;


end.
