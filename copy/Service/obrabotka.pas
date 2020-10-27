
//procedure SetKladFromSprZah;
//begin
//end;

procedure TestListMensLic;
var
  slPar:TStringList;
  n:INteger;
  s:String;
begin
//  ShowMessage(dmBase.ListMensLic('1111', 0, '000',';OTN;DATER;', chr(13)+chr(10), nil));
  slPar:=TStringList.Create;
  slPar.Add('ADRES_ID='+'10518');//Query.fieldbyName('ADRES_ID').AsString);
  n:=dmBase.CountMensEx( MaindateFiks, '10519'{Query.fieldbyName('ID').AsString}, '101', slPar);
  if slPar.IndexOfName('SOBSTV')>-1
    then s:='Ok' else s:='Not';
  s:=s+'  '+IntToStr(n);
  slPar.Free;
  ShowMessage(s);
end;


procedure CheckPensioner;
var
  sSQL:String;
begin
  sSQL:='update ��������� set pens_tip=1 '+
        'where date_fiks='+QStr(datecursostS)+' and (pens_tip is null or pens_tip<1) and dater is not null '+
        ' and ( (pol=''�'' and GetVozrast(curdate(),dater)>='+PENS_G+') or (pol=''�'' and GetVozrast(curdate(),dater)>='+PENS_M+')) ';
//  writedebug(sSQL)
  dbExecuteSQL(sSQL);
end;

//---------------------------------------------------------
procedure CheckPredZapis;
var
  ds : TdataSet;
  i:Integer;
begin
  ds:=dbOpenSQL('select count(*) KOLVO from '+SysQuery('system.tables')+' where name=''predzapis'' ','');
  i:=ds.Fld('KOLVO').AsInteger;
  dbClose(ds);
  if i>0 then begin
    dbExecuteSQL('UPDATE PredZapis set otkaz=false;');
    ds:=dbOpenSQL('select * from PredZapis order by god,dater','');
    ds.First;
    i:=1;
    while not ds.Eof do begin
      if (ds.Fld('DAY').AsInteger>0) and (ds.Fld('GOD').AsInteger=2015) then begin
        ds.Edit;
        ds.FieldByName('NOMER').AsInteger:=i;
        i:=i+1;
        ds.Post;
      end;
      ds.Next;
    end;
    dbClose(ds);
  end;
end;
//---------------------------------------------------------
function IsLoadZAGS(s:String):Boolean;
begin
  if ParamAsInteger('ID')=40000 then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

function LoadZAGS_MID:Boolean;
var
  q,dsOrg : TDataSet;
  n:Integer;
begin
  if Problem('��������� ������ ����������� ?') then begin
    q:=dbOpenSQL('SELECT * FROM SysSpr.SprZAGS WHERE id>=40000 and id<50000','');
    dsOrg := dmBase.GetDataSet('SprNames');
    n:=0;
    while not q.Eof do begin
      if not dbLocate(dsOrg,'ID',[q.Fld('ID').AsInteger],'')  then begin
        dsOrg.Append;
        dsOrg.Fld('ID').AsInteger:=q.Fld('ID').AsInteger;
        dsOrg.Fld('NAME').AsString:=q.Fld('NAME').AsString;
        dsOrg.Fld('NAME_B').AsString:=q.Fld('NAME_B').AsString;
        dsOrg.Fld('SOATO').AsString:=q.Fld('SOATO').AsString;
        dsOrg.Fld('HANDLED').AsBoolean:=false;
        dsOrg.Post;
        n:=n+1;
      end;
      q.Next;
    end;
    dbClose(q);
    ShowMessage('���������: '+IntToStr(n));
  end;
end;
//----------------------------------------
function RunClearIN:Boolean;
var
  Date1,Date2:TDateTime;
  fmParam:TfmParamQuest;
  n:Integer;
  lOk:Boolean;
begin
  Result:=false;
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='���������';
  fmParam.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
  fmParam.AddParamEx(Now, '�������� ����' , 'DATE2' ,'TYPE=DATE');
  fmParam.AddButtons('���������~�����',0);
  n:=fmParam.ShowQuest;
  if n=1 then begin
    Date1:=fmParam.GetValue('DATE1','D');
    Date2:=fmParam.GetValue('DATE2','D');
    fmParam.Free;
    if (Date1>0) and (Date2>0) and (Date2>=Date1) then begin
      if OkWarning('���� �� ������ ������ ���� �� � �������,'+Chr(13)+
                   '� ������� ���� � �������� '+Chr(13)+
                   '�� ������ c  '+DatePropis(Date1,3)+'   ��   '+DatePropis(Date2,3)+','+Chr(13)+
                   '������� � ���� ����� ����� "��" ') then begin
        OpenMessage(' ���������� ������� �� ...    ','',10);
        SetScreenCursor('HOURCLASS');
        lOk:=dbExecuteSQL('UPDATE ������������ SET identif='''' WHERE datez>='+DateToSQL(Date1)+
                     ' and datez<='+DateToSQL(Date2));
        if lOk then begin
          lOk:=dbExecuteSQL('delete from BaseProp where typeobj=32');
        end;
        RestScreenCursor;
        CloseMessage;
        if lOk then begin
          Result:=true;
        end else begin
          PutError(dbLastError());
        end;
      end;
    end else begin
      PutError('����������� ������� ����.');
    end;
  end else begin
    fmParam.Free;
  end;
end;

procedure RunSummaTarif;
var
  q : TDataSet;
  Date1,Date2:TDateTime;
  fmParam:TfmParamQuest;
  n:Integer;
  lZBrak,lBrak,lRogd:Boolean;
  m1,m2,m3:Extended;
  sSQL:String;
begin
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='���������';
  fmParam.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
  fmParam.AddParamEx(Now, '�������� ����' , 'DATE2' ,'TYPE=DATE');
  fmParam.AddParamEx(true, '��������� � �����' , 'ZBRAK' ,'');
  fmParam.AddParamEx(true, '�����' , 'BRAK' ,'');
  fmParam.AddParamEx(true, '��������' , 'ROGD' ,'');
  fmParam.AddButtons('���������~�����',0);
  n:=fmParam.ShowQuest;
  if n=1 then begin
    Date1:=fmParam.GetValue('DATE1','D');
    Date2:=fmParam.GetValue('DATE2','D');
    lZBrak:=fmParam.GetValue('ZBRAK','L');
    lBrak:=fmParam.GetValue('BRAK','L');
    lRogd:=fmParam.GetValue('ROGD','L');
    OpenMessage('  ������ ...  ','',10);
    m1:=0;
    m2:=0;
    q:=nil;
    if lBrak then begin
      q:=dbOpenSQL('SELECT Sum(isNull(TARIF,0)) SUMMA FROM ���������������� WHERE datez>='+DateToSQL(Date1)+
                   ' and datez<='+DateToSQL(Date2),'');
      m1:=q.Fld('SUMMA').AsFloat;
    end;
    if lZBrak then begin
      q:=dbOpenSQL('SELECT Sum(isNull(TARIF,0)) SUMMA FROM DeclareMarriage WHERE datez>='+DateToSQL(Date1)+
                   ' and datez<='+DateToSQL(Date2),'');
      m3:=q.Fld('SUMMA').AsFloat;
    end;
    if lRogd then begin
      q:=dbOpenSQL('SELECT Sum(isNull(TARIF,0)) SUMMA FROM ������������ WHERE datez>='+DateToSQL(Date1)+
                   ' and datez<='+DateToSQL(Date2),'');
      m2:=q.Fld('SUMMA').AsFloat;
    end;
    CloseMessage();
    if q<>nil then dbClose(q);
    if lZBrak or lBrak or lRogd then begin
      fmParam.Free;
      fmParam:=TfmParamQuest.Create(nil);
      fmParam.Caption:='���������';
      if lZBrak  then fmParam.AddParamEx(m3, '��������� � �����' , 'ZBRAK' ,'');
      if lBrak   then fmParam.AddParamEx(m1, '�����' , 'BRAK' ,'');
      if lRogd   then fmParam.AddParamEx(m2, '��������' , 'ROGD' ,'');
      fmParam.AddButtons('�������',0);
      fmParam.ShowQuest;
    end;
  end;
  fmParam.Free;
end;

procedure RunSummaPoshlina;
var
  q : TDataSet;
  Date1,Date2:TDateTime;
  fmParam:TfmParamQuest;
  n:Integer;
  lBrak,lZBrak,lRast,lChName:Boolean;
  m1,m2,m3,m4:Extended;
  sSQL:String;
begin
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='���������';
  fmParam.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
  fmParam.AddParamEx(Now, '�������� ����' , 'DATE2' ,'TYPE=DATE');
  fmParam.AddParamEx(true, '��������� � �����' , 'ZBRAK' ,'');
  fmParam.AddParamEx(true, '�����' , 'BRAK' ,'');
  fmParam.AddParamEx(true, '�������' , 'RAST' ,'');
  fmParam.AddParamEx(true, '�������� ���' , 'CHNAME' ,'');
  fmParam.AddButtons('���������~�����',0);
  n:=fmParam.ShowQuest;
  if n=1 then begin
    Date1:=fmParam.GetValue('DATE1','D');
    Date2:=fmParam.GetValue('DATE2','D');
    lZBrak:=fmParam.GetValue('ZBRAK','L');
    lBrak:=fmParam.GetValue('BRAK','L');
    lRast:=fmParam.GetValue('RAST','L');
    lChName:=fmParam.GetValue('CHNAME','L');
    OpenMessage('  ������ ...  ','',10);
    m1:=0;
    m2:=0;
    m3:=0;
    q:=nil;
    if lBrak then begin
      q:=dbOpenSQL('SELECT Sum(isNull(SUM_POSHLINA,0)) SUMMA FROM ���������������� WHERE datez>='+DateToSQL(Date1)+
                   ' and datez<='+DateToSQL(Date2),'');
      m1:=q.Fld('SUMMA').AsFloat;
    end;
    if lRast then begin
      sSQL:='SELECT Sum(isNull(ON_SUM_POSHLINA,0)+isNull(ONA_SUM_POSHLINA,0)) SUMMA FROM AktTermMarriage WHERE datez>='+DateToSQL(Date1)+
            ' and datez<='+DateToSQL(Date2);
      if q=nil
        then q:=dbOpenSQL(sSQL,'')
        else dbChangeSQL(q, sSQL, true);
      m2:=q.Fld('SUMMA').AsFloat;
    end;
    if lChName then begin
      sSQL:='SELECT Sum(isNull(SUM_POSHLINA,0)) SUMMA FROM AktChangeName WHERE datez>='+DateToSQL(Date1)+
                   ' and datez<='+DateToSQL(Date2);
      if q=nil
        then q:=dbOpenSQL(sSQL,'')
        else dbChangeSQL(q, sSQL, true);
      m3:=q.Fld('SUMMA').AsFloat;
    end;
    if lZBrak then begin
      q:=dbOpenSQL('SELECT Sum(isNull(SUM_POSHLINA,0)) SUMMA FROM DeclareMarriage WHERE datez>='+DateToSQL(Date1)+
                   ' and datez<='+DateToSQL(Date2),'');
      m4:=q.Fld('SUMMA').AsFloat;
    end;
    CloseMessage();
    if q<>nil then dbClose(q);
    if lZBrak or lBrak or lRast or lChName then begin
      fmParam.Free;
      fmParam:=TfmParamQuest.Create(nil);
      fmParam.Caption:='���������';
      if lZBrak  then fmParam.AddParamEx(m4, '��������� � �����' , 'ZBRAK' ,'');
      if lBrak   then fmParam.AddParamEx(m1, '�����' , 'BRAK' ,'');
      if lRast   then fmParam.AddParamEx(m2, '�������' , 'RAST' ,'');
      if lChName then fmParam.AddParamEx(m3, '�������� ���' , 'CHNAME' ,'');
      fmParam.AddButtons('�������',0);
      fmParam.ShowQuest;
    end;
  end;
  fmParam.Free;
end;
//----------------------------------------------
function RunDenom:Boolean;
var
  Date1,Date2:TDateTime;
  fmParam:TfmParamQuest;
  n:Integer;
begin
  Result:=false;
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='�����������';
  fmParam.AddParamEx(STOD('2016-01-01',''), '��������� ����' , 'DATE1' ,'TYPE=DATE');
  fmParam.AddParamEx(STOD('2016-06-30',''), '�������� ����' , 'DATE2' ,'TYPE=DATE');
  fmParam.AddButtons('���������~�����',0);
  n:=fmParam.ShowQuest;
  if n=1 then begin
    Date1:=fmParam.GetValue('DATE1','D');
    Date2:=fmParam.GetValue('DATE2','D');
    if OkWarning('���� �� ������ �������������� ���� "�������" � "�����",'+Chr(13)+
                 '�� ������ c  '+DatePropis(Date1,3)+'   ��   '+DatePropis(Date2,3)+','+Chr(13)+
                 '������� � ���� ����� ����� "��" '+
                 '���������� �������� ������ ���� ���!') then begin
      Result:=true;
      OpenMessage('  ����������� ...  ','',10);
      dbExecuteSQL('update ���������������� set SUM_POSHLINA=SUM_POSHLINA/10000 WHERE sum_poshlina is not null and datez>='+DateToSQL(Date1)+' and datez<='+DateToSQL(Date2));
      AppProcess;
      dbExecuteSQL('update AktTermMarriage  set ONA_SUM_POSHLINA=ONA_SUM_POSHLINA/10000 WHERE ona_sum_poshlina is not null and datez>='+DateToSQL(Date1)+' and datez<='+DateToSQL(Date2));
      AppProcess;
      dbExecuteSQL('update AktTermMarriage  set ON_SUM_POSHLINA=ON_SUM_POSHLINA/10000 WHERE on_sum_poshlina is not null and datez>='+DateToSQL(Date1)+' and datez<='+DateToSQL(Date2));
      AppProcess;
      dbExecuteSQL('update AktChangeName    set SUM_POSHLINA=SUM_POSHLINA/10000 WHERE sum_poshlina is not null and datez>='+DateToSQL(Date1)+' and datez<='+DateToSQL(Date2));
      AppProcess;
      dbExecuteSQL('update DeclareMarriage  set SUM_POSHLINA=SUM_POSHLINA/10000 WHERE sum_poshlina is not null and datez>='+DateToSQL(Date1)+' and datez<='+DateToSQL(Date2));
      AppProcess;
      dbExecuteSQL('update ���������������� set TARIF=TARIF/10000 WHERE TARIF is not null and datez>='+DateToSQL(Date1)+' and datez<='+DateToSQL(Date2));
      AppProcess;
      dbExecuteSQL('update DeclareMarriage set TARIF=TARIF/10000 WHERE TARIF is not null and datez>='+DateToSQL(Date1)+' and datez<='+DateToSQL(Date2));
      AppProcess;
      dbExecuteSQL('update ������������ set TARIF=TARIF/10000 WHERE TARIF is not null and datez>='+DateToSQL(Date1)+' and datez<='+DateToSQL(Date2));
      CloseMessage();
    end;
  end;
  fmParam.Free;
end;

//------------------------------------------
procedure ClearBrakRast;
var
  Date1,Date2:TDateTime;
  fmParam:TfmParamQuest;
  n:Integer;
  lOk:Boolean;
begin
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='���������';
  fmParam.AddParamEx(STOD('1900-01-01',''), '��������� ����' , 'DATE1' ,'TYPE=DATE');
  fmParam.AddParamEx(Now, '�������� ����' , 'DATE2' ,'TYPE=DATE');
  fmParam.AddButtons('���������~�����',0);
  n:=fmParam.ShowQuest;
  if n=1 then begin
    Date1:=fmParam.GetValue('DATE1','D');
    Date2:=fmParam.GetValue('DATE2','D');
    if (Date1>0) and (Date2>0) and (Date2>=Date1) then begin
      if OkWarning('���� �� ������ ������ ���� "���� ����������",'+Chr(13)+
                   '� ������� ���� � ����� '+Chr(13)+
                   '�� ������ c  '+DatePropis(Date1,3)+'   ��   '+DatePropis(Date2,3)+','+Chr(13)+
                   '������� � ���� ����� ����� "��" ') then begin
        OpenMessage(' ���������� ...    ','',10);
        SetScreenCursor('HOURCLASS');
        n:=dbExecuteSQL2('UPDATE ���������������� SET brak_rast=false WHERE brak_rast=true and type_rast is null and datez>='+DateToSQL(Date1)+
                     ' and datez<='+DateToSQL(Date2));
        RestScreenCursor;
        CloseMessage;
        if n=-1 then begin
          PutError(dbLastError());
        end else begin
          ShowMessage('���������� '+IntToStr(n)+' �������');
        end;
      end;
    end else begin
      PutError('����������� ������� ����.');
    end;
  end;
  fmParam.Free;
end;

function RunCreateBigHouse : Boolean;
begin
  Result := OkWarning('���� �� ������ ������������ ���� ����� ������,'+Chr(13)+
                        '�� ������� � ���� ����� ����� "��" ')
  if Result then begin
    OpenMessage('  ������������ ���� ����� ... ', '', 10);
    try
      dmBase.CreateBigHouse;
    finally
      CloseMessage;
    end;
  end;
end;

function RunCheckOwners : Boolean;
var
  n:Integer;
  ds:TdataSet;
begin
  ds:=dbOpenSQL('select count(*) kolvo from sprOwners','');
  n:=ds.Fld('KOLVO').AsInteger;
  dbClose(ds);
  if n=0 then begin
    ShowMessage('������������� �� ���������.')
  end else begin
//    OpenMessage('  ������������� ����������� ������������� ... ', '', 10);
    n:=0;
    try
      n:=CheckSprOwners;
    finally
//      CloseMessage;
    end;
    if n=1 then begin
      PutError(dbLastError());
    end else begin
      ShowMessage('������������� ������� ���������.')
    end;
  end;
end;

function RunLoadOwners : Boolean;
var
  ds : TDataSet;
  strSQL : String;
begin
  Result := true;
  ds:=dbOpenSQL('SELECT Count(*) FROM HouseOwners','');
  if ds.Fields.Fields[0].AsInteger > 0 then begin
    PutError('  ������ ������������� ������ ���� ���� !  ');
    Result := OkWarning('���� �� ������ ������������ ������ ������������� ������,'+Chr(13)+
                        '�� ������� � ���� ����� ����� "��" ')
    if Result then begin
      SetScreenCursor('HOURCLASS');
      Result := dbExecuteSQL('DELETE FROM HouseOwners');
      RestScreenCursor;
      if not Result then begin
        PutError(dbLastError());
      end;
    end;
  end;
  dbClose(ds);
  if Result then begin
    strSQL :='insert into HouseOwners (date_fiks,id,kod,typekod,nomer) '+
             ' select l.date_fiks,adres_id id , first kod, 1 typekod, 1 nomer from ������������ l '+
             ' left join ��������� d on l.adres_id=d.id and '+
             ' l.date_fiks=d.date_fiks '+
             ' where own_house=true and d.id is not null';
    SetScreenCursor('HOURCLASS');
    Result := dbExecuteSQL(strSQL);
    RestScreenCursor;
    if not Result then begin
      PutError(dbLastError());
    end;
  end;
end;

function RunLoadDateFiks : Boolean;
begin
  Result := true;
  SetScreenCursor('HOURCLASS');
  dbExecuteSQL('DELETE FROM ������������');
  dbExecuteSQL('INSERT INTO ������������ SELECT distinct date_fiks FROM ������������');
//  if not Result then begin
//    PutError(dbLastError());
//  end;
  RestScreenCursor;
end;

function ChangeSelSovet : Boolean;
var
  ds : TDataSet;
  strSQL,strNew, strOld : String;
  n : Integer;
begin
  strOld := '3243868';
  strNew := '3243814';
  Result := true;
  strSQL := 'SELECT ID, KOD, NAME, Substring(NAME,3,50) NAME1 FROM SysSpr.�������� '+Chr(13)+
            ' WHERE (substring(kod,1,7)='+QStr(strNew) + ' or substring(kod,1,7)=' + QStr(strOld) + ') and ' +Chr(13)+
            ' substring(kod,8,3)<>'+QStr('000')+Chr(13)+
            ' ORDER BY 4';
  ds:=dbOpenSQL(strSQL,'');

  n:=1;
  while not ds.Eof do begin
    strSQL := 'UPDATE SysSpr.�������� SET kod='+QStr('8999999'+PadLInt(n,3,'0'))+' WHERE id='+ds.Fields.Fields[0].AsString;
    Result := dbExecuteSQL(strSQL);
    if not Result then begin
      PutError(dbLastError());
    end;
    ds.Next;
    n:=n+1;
  end;

  ds.First;
  n:=1;
  while not ds.Eof do begin
    strSQL := 'UPDATE SysSpr.�������� SET kod='+QStr(strNew+PadLInt(n,3,'0'))+' WHERE id='+ds.Fields.Fields[0].AsString;
    Result := dbExecuteSQL(strSQL);
    if not Result then begin
      PutError(dbLastError());
    end;
    ds.Next;
    n:=n+5;
  end;
  strSQL := 'DELETE FROM SysSpr.�������� WHERE kod='+QStr(strOld+'000');
  Result := dbExecuteSQL(strSQL);
  if not Result then begin
    PutError(dbLastError());
  end;
  dbClose(ds);
end;

function CheckAdresNoneMen : Boolean;
var
  ds : TDataSet;
  strSQL,s : String;
  i:Integer;
begin
  Result := true;
  SetScreenCursor('HOURCLASS');
  ds:=dbOpenSQL('SELECT ROWID,ID FROM ��������� WHERE propis=false and lic_id>0 and date_fiks='+QStr('1899-12-30'),'');
  i:=0;
  while not ds.Eof do begin
    s := dmBase.ReadPropAsText(STOD('1899-12-30',''), ds.Fld('ID').AsInteger, 'ADRES_PROP');
    if s='' then begin
      dmBase.WriteValueProp('ADRES_PROP','�� ��������', STOD('1899-12-30',''), ds.Fld('ID').AsInteger,
                            dmBase.TypeObj_Nasel,ftMemo);
      i:=i+1;
    end; 	
    ds.Next;
  end;
  RestScreenCursor;
  ShowMessage('��������: '+IntToStr(i)+' �������');
end;

procedure RunCheckErrorSostavSem;
var
  strSQL:String;
  ds,dsR:TDataSet;
begin
  SetScreenCursor('HOURCLASS');
  dsR := dbGetDataSet('fmMain.mtReport');
  dbZap(dsR);
  dbSetIndex(dsR,'BOK_KEY');
  strSQL :='select o.nomer_och, familia, name, otch, o.id, kolvo_sostav, nnn from ochered o '+
           'left join  '+
           ' ( select id, count(*) as nnn from sostavsem where iskl=false or iskl is null group by id ) ss '+
           ' on ss.id=o.id and nnn+1<>kolvo_sostav '+
           'left join ��������� n on date_fiks='+QStr('1899-12-30')+' and n.id=o.id '+  
           'where ochered_id=0 and nnn is not null or kolvo_sostav>50 ';
  ds:=dbOpenSQL(strSQL,'');
  while not ds.eof do begin
    dsR.Append;
    dsR.Fld('INT1').AsInteger:=ds.Fld('nomer_och').AsInteger;
    dsR.Fld('BOK').AsString:=ds.Fld('FAMILIA').AsString+' '+ds.Fld('NAME').AsString+' '+ds.Fld('OTCH').AsString;
    dsR.Fld('INT2').AsInteger:=ds.Fld('kolvo_sostav').AsInteger;
    dsR.Fld('INT3').AsInteger:=ds.Fld('nnn').AsInteger;
    dsR.Post;
    ds.Next;
  end;
  dbClose(ds);
  RestScreenCursor;
  if dsR.RecordCount>0 then begin
    GlobalTask.PreviewReport('&��������� ����������.fr3')
    if Problem(' ��������� �������� ? ') then begin
      SetScreenCursor('HOURCLASS');
      OpenMessage('  �������� ...         ','',10);
      AppProcess;
      dbExecuteSQL('delete from sostavsem where id in (select id from ('+strSQL+') bbb)');
      AppProcess;
      dbCloseCachedTables;
      dbPack( dbGetDataSet('dmBase.tbSostavSem') );
      CloseMessage;
      RestScreenCursor;
    end;
  end else begin
    ShowMessage('������ �� ����������.');
  end;
end;

//---------------------------------------------------------------------
procedure CheckErrorID_BASE;
var
  ds,dsCheck:TDataSet;
  strSQL:String;
begin
  OpenMessage(' ���������� ��������� ...    ','',10);
  SetScreenCursor('HOURCLASS');
  strSQL :='select o.id, o.ochered_id, o.id_base id_base, ol.id_base id_base_new from ochered o '+
           ' left join ochered ol on o.id=ol.id and ol.ochered_id=0 '+
           ' where o.id_base=0 and o.ochered_id>0 and ol.id_base>0 ';
  try
    dsCheck:=dbOpenSQL(strSQL,'');
    ds := dbGetDataSet('dmBase.tbOchered');
    while not dsCheck.eof do begin
      if dbLocate(ds,'OCHERED_ID;ID',[dsCheck.Fld('OCHERED_ID').AsInteger,dsCheck.Fld('ID').AsInteger],'') then begin
        ds.Edit;
        ds.Fld('ID_BASE').AsInteger:=dsCheck.Fld('ID_BASE_NEW').AsInteger;
        ds.Post;
      end;
      dsCheck.Next;
    end;
    dbClose(dsCheck);
  finally
    CloseMessage;
    RestScreenCursor;
  end;
end;

//---------------------------------------------------------------------
procedure CreateDeloForOtdelnoOch;
var
  ds:TDataSet;
  s,strSQL:String;
begin
  OpenMessage(' ���������� ��������� ...    ','',10);
  SetScreenCursor('HOURCLASS');
  strSQL :='try drop table #tmp; catch all end; '+
           'SELECT id, delo s_delo INTO #tmp FROM Ochered WHERE ochered_id=0 and delo is not null; '+ 
           'UPDATE Ochered SET delo=(SELECT s_delo FROM #tmp t WHERE Ochered.id=t.id) WHERE ochered_id>0; ';
  try
    dbExecuteSQL(strSQL);
    ds := dbGetDataSet('dmBase.tbOchered');
    ds.First;
    _CreateN_Delo(ds);
  finally
    CloseMessage;
    RestScreenCursor;
  end;
end;
//---------------------------------------------------------------------

procedure CreateN_Delo;
var
  ds:TDataSet;
  s:String;
begin
  SetScreenCursor('HOURCLASS');
  try
    ds := dbGetDataSet('dmBase.tbOchered');
    ds.First;
    _CreateN_Delo(ds);
  finally
    RestScreenCursor;
  end;
end;

procedure SetPapaMama;
var
  strSQL:String;
  l:Boolean;
begin
  dbExecuteSQL('drop table #papa_mama');
  strSQL := dmBase.LoadSQLEx('����_����_��������');
  if strSQL<>'' then begin
    SetScreenCursor('HOURCLASS');
    l := dbExecuteSQL(strSQL);
    RestScreenCursor;
    if l then begin
      ShowMessage('��������� ������� ���������.')
    end else begin
      PutError(dbLastError());
    end;
  end else begin
    PutError('������ ������ ������� ��� ��������� ���������.');
  end;
end;
//------------------------------------------------------------------
procedure DelErrorDvig;
var
  strSQL:String;
  l:Boolean;
begin
  strSQL := dmBase.LoadSQLEx('_��������_������_��������');
//  writedebug(strSQL);
  if strSQL<>'' then begin
    SetScreenCursor('HOURCLASS');
    l := dbExecuteSQL(strSQL);
    RestScreenCursor;
    if l then begin
      ShowMessage('��������� ������� ���������.')
    end else begin
      PutError(dbLastError());
    end;
  end else begin
    PutError('������ ������ ������� ��� ��������� ���������.');
  end;
end;
//------------------------------------------------------------------
function KodForInvalid(nGrup:Integer;lVoen:Boolean):String;
var
  ds:TDataSet;
  sGrup1,sGrup2,sCurName:String;
begin
  Result:='';
  ds:= dmBase.GetDataSet('�������������');
  ds.First;
  if nGrup>0 then begin
    sGrup1:=IntToStr(nGrup);
    if nGrup=1 then sGrup2:='I';
    if nGrup=2 then sGrup2:='II';
    if nGrup=3 then sGrup2:='III';
  end;
  while not ds.Eof do begin
    sCurName:=ANSIUpperCase(ds.FieldByName('NAME').AsString);
    if nGrup=0 then begin
      if Pos('������� ',sCurName)>0 then begin
        if not lVoen or ( (Pos('���',sCurName)>0) or (Pos('����',sCurName)>0) ) then begin
//    writedebug(sCurName);
          if Result='' then Result:='kod='+ds.FieldByName('ID').AsString
                       else Result:=Result+' or kod='+ds.FieldByName('ID').AsString;
        end;
      end;
    end else begin
      if (Pos('������� ',sCurName)>0) and 
         ( (Pos(' '+sGrup1+' ',sCurName)>0) or (Pos(' '+sGrup2+' ',sCurName)>0) ) then begin
        if not lVoen or ( (Pos('���',sCurName)>0) or (Pos('����',sCurName)>0) ) then begin
          if Result='' then Result:='kod='+ds.FieldByName('ID').AsString
                       else Result:=Result+' or kod='+ds.FieldByName('ID').AsString;
        end;
      end;
    end;
    ds.Next;
  end;
end;

//------------------------------------------------------------------
function KodFromName(sNameSpr:String; sName:String; sFieldName:String):String;
var
  ds:TDataSet;
  i:Integer;
  sl:TStringList;
  lOk:Boolean;
begin
  Result:='';
  sl:=TStringList.Create;
  ds:= dmBase.GetDataSet(sNameSpr); // ��������������  �������������
  sl.Add(ANSIUpperCase(sName));
//  StrToStrings(sName, sl, ';');
  ds.First;
  while not ds.Eof do begin
//    writedebug(ANSIUpperCase(ds.FieldByName('NAME').AsString));
    lOk:=true;
    for i:=0 to sl.Count-1 do begin
      if Pos(sl[i],ANSIUpperCase(ds.FieldByName('NAME').AsString))=0 then begin
        lOk:=false;
      end;
    end;
    if lOk then begin
      if sFieldName='' then begin
        Result:=ds.FieldByName('ID').AsString;
      end else begin
        if Result=''
          then Result:=sFieldName+'='+ds.FieldByName('ID').AsString
          else Result:=Result+' or '+sFieldName+'='+ds.FieldByName('ID').AsString;
      end;
    end;
    ds.Next;
  end;
  sl.Free;
  if (sFieldName<>'') and (Result<>'') then begin
    Result:='('+Result+')';
  end;
end;
procedure AddLicToList(sLic:String;sPunkt:String;sType:String;dsLic:TDataSet;dsL:TDataSet);
var
  s,ss:String;
  d:TDateTime;
  n:Integer;
  dsAdres:TDataSet;
begin
  d:=STOD(datecursostS,'');
  if dbLocate(dsLic,'DATE_FIKS;ID',[d,sLic],'') then begin
    if dsLic.Fld('adres_id').AsInteger>0 then begin
      dsAdres := dbGetDataSet('dmBase.tbAdres');
      s:=dmBase.AdresFromID(d,dsLic.Fld('adres_id').AsString,false);
      if dbLocate(dsAdres,'DATE_FIKS;ID',[d,dsLic.Fld('adres_id').AsString],'') then begin
        dsL.Append;
        dsL.Fld('PUNKT').AsString:=sPunkt;
        dsL.Fld('UL').AsInteger:=dsAdres.Fld('UL').AsInteger;
        dsL.Fld('DOM1').AsString:=dsAdres.Fld('DOM1').AsString;
        dsL.Fld('DOM2').AsString:=dsAdres.Fld('DOM2').AsString;
        dsL.Fld('KV').AsString:=dsAdres.Fld('KV').AsString;
        dsL.Fld('TYPE').AsString:=sType;
        dsL.Fld('SSS2').AsString:=s;
        if dsAdres.Fld('MS_API').AsInteger>0 then dsL.Fld('SSS3').AsString:='��'else dsL.Fld('SSS3').AsString:='���';
        if dsAdres.Fld('MS_OTOPL').IsNull or (dsAdres.Fld('MS_OTOPL').AsBoolean=true) then dsL.Fld('SSS4').AsString:='��'else dsL.Fld('SSS4').AsString:='���';
        if dsAdres.Fld('MS_ELPR').IsNull or (dsAdres.Fld('MS_ELPR').AsBoolean=true) then dsL.Fld('SSS5').AsString:='��'else dsL.Fld('SSS5').AsString:='���';
        n:=SeekValueSpr('�������������','ID',sPUNKT,'TYPEPUNKT');
        ss:=SeekValueSpr('�������������','ID',sPUNKT,'NAME');
        s:=SeekValueSpr('TypePunkt','ID',n,'NAME');
        dsL.Fld('SSS1').AsString:=s+' '+ss;
        dsL.Post;
      end;
    end else begin

    end;
  end;
end;

//--------------------------------------------------------
function IsAddAdres(nTip:Integer):Boolean;    // !!! �������� ��� ��� ����� � ������� (������ �� ���� ���)
begin
  if nTip=1 then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;
//--------------------------------------------------------
function RaschetPogarPasp:Boolean;
var
  q,q1,ds,dsL,dsLic:TDataSet;
  n,i:Integer;
  s,strSQLTrud,strSQL,sKod,sAllInvalid,sInvalidI_II,sInvalidV:String;
  sss,s11,s12,s13,s14,s15,s16,s17:String;
  sDom,sKorp,sFilterPunkt:String;
  d:TDateTime;
  arr : array[1..3] of String;
begin
{+ ���_���_���������.sql
+  ���_��������I_II_������_������������.sql
+  ���_������� �� ��������� �� ��� �������.sql
  ���_���� �� ��������� �� ��� �������.sql
+  ���_����_���������.sql
+  ���_������������ ������� ����.sql
  ���_������_������� �� ��������� �� ��� �������.sql }

  sFilterPunkt:=GetGlobalFilterPunkt;  //  !!!    ������������
  if sFilterPunkt<>'' then begin
    sFilterPunkt:=' and '+sFilterPunkt;
  end;

  Result:=true;
  //--------------------------------------------------------------------------------------
  sInvalidV:=KodForInvalid(0,true);
  if sInvalidV='' then begin
    PutError('� ����������� ���������� �� ���������� �������� �����');
    Result:=false;
    exit;
  end;
  //--------------------------------------------------------------------------------------
  sInvalidI_II:=KodForInvalid(1,false);
  s:=KodForInvalid(2,false);
  if s<>'' then 
    if sInvalidI_II='' then sInvalidI_II:=s else sInvalidI_II:=sInvalidI_II+' or '+s;
  if sInvalidI_II='' then begin
    PutError('� ����������� ���������� �� ���������� �������� I � II ������');
    Result:=false;
    exit;
  end;
//  writedebug(sInvalidI_II);
  //--------------------------------------------------------------------------------------
  sAllInvalid:=KodForInvalid(0,false);   // ��� ��������
  if sAllInvalid='' then begin
    PutError('� ����������� ���������� �� ���������� ��������');
    Result:=false;
    exit;
  end;
  //----- ������ ��� ����������� ���������� ��������������� �� ������ --------------------
  strSQLTrud:='select count(*) kolvo from ��������� n '+Chr(13)+
    ' where date_fiks='+QStr(datecursostS)+' and candelete=false and propis=true and present=true and lic_id>0 and '+Chr(13)+
    ' adres_id=&adres& and Trud(curdate(),dater,pol)=1 and  not exists (select kod from ��������������� nl where nl.date_fiks=n.date_fiks and nl.id=n.id and (&kod&) )';  		  
  strSQLTrud:=dmBase.CheckDateFiksSQL(strSQLTrud, MaindateFiks);
  strSQLTrud := StringReplace(strSQLTrud, '&kod&', sAllInvalid);
  OpenMessage(' ____________������ �������� ...        ','',10);
  AppProcess;     

  ds := FindReportTable('ZAGS');
  dbZap(ds);
  dsL:= FindReportTable('GRUP');
//  if dsL=nil then  writedebug('===============');
  dbZap(dsL);
  dbSetIndex(dsL,'PR_KEY');
  dsLic := dbGetDataSet('dmBase.tbLich');

  ChangeMessage('  ����������� ��������� 1.  ');
  strSQL := dmBase.LoadSQLEx('���_���_���������');
  strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
  strSQL := StringReplace(strSQL, '&punkt&', sFilterPunkt);
  q:=dbOpenSQL(strSQL,'');
  while not q.Eof do begin
    ds.Append;

    n:=SeekValueSpr('�������������','ID',q.Fld('PUNKT').AsInteger,'TYPEPUNKT');
    s:=SeekValueSpr('TypePunkt','ID',n,'NAME');

    ds.Fld('BOK').AsString:=s+' '+q.Fld('NAME').AsString;
    ds.Fld('NUM1').AsInteger:=q.Fld('PUNKT').AsInteger;
    ds.Fld('NUM2').AsInteger:=q.Fld('KOLVO').AsInteger;
    for n:=3 to 25 do ds.Fld('NUM'+IntToStr(n)).AsInteger:=0;
    ds.Post;
    q.Next;
  end;
  //===����������� �����====1.1=========================================
  ChangeMessage('  ����������� ��������� 1.1  ');
  sKod:=KodFromName('�������������','��������','kod');
  if sKod<>'' then begin
    strSQL := dmBase.LoadSQLEx('���_������� �� ��������� �� ��� �������');
    strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
    strSQL := StringReplace(strSQL, '&gggg&', sKod);
    strSQL := StringReplace(strSQL, '&punkt&', sFilterPunkt);
    dbChangeSQL(q,strSQL,true);
    s11:='*';
    while not q.Eof do begin
      s:=q.Fld('lic_id').AsString+'*';
      if Pos('*'+s,s11)=0 then begin 
         s11:=s11+s;
         AddLicToList(q.Fld('lic_id').AsString,q.Fld('punkt').AsString,'1',dsLic,dsL);
      end;
      if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
        ds.Edit;
        ds.Fld('NUM3').AsInteger:=ds.Fld('NUM3').AsInteger+1;                           //3
        ds.Fld('NUM4').AsInteger:=ds.Fld('NUM4').AsInteger+q.Fld('KOLVO_M').AsInteger;  //4
        ds.Post;
      end;
      q.Next;
    end;
  end;
//  writedebug(s11);
  //===������������ �������� ���� �������� ��������=======1.2===========================
  ChangeMessage('  ����������� ��������� 1.2  ');
  strSQL := dmBase.LoadSQLEx('���_������������ ������� ����');
  strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
  strSQL := StringReplace(strSQL, '&punkt&', sFilterPunkt);
  dbChangeSQL(q,strSQL,true);
  q.First;
  s12:='*';

  q1:=dbOpenSQL('SELECT TOP 1 * from �������������','');

  while not q.Eof do begin
    s := StringReplace(strSQLTrud, '&adres&', q.Fld('adres_id').AsString);
    dbChangeSQL(q1,s,true);
    if q1.Fld('kolvo').AsInteger=0 then begin  // ��� �������������� ����� �� ������ ���������� ��������
      if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
        sss:=q.Fld('lic_id').AsString+'*';
        if Pos('*'+sss,s12)=0 then begin 
          s12:=s12+sss;
          AddLicToList(q.Fld('lic_id').AsString,q.Fld('punkt').AsString,'2',dsLic,dsL);
        end;
        ds.Edit;
        ds.Fld('NUM5').AsInteger:=ds.Fld('NUM5').AsInteger+1;  
        ds.Post;
      end;
    end;
    q.Next;
  end;
  //===�������� �������� 1 � 2 ������=======1.3===========================
  ChangeMessage('  ����������� ��������� 1.3  ');
  strSQL := dmBase.LoadSQLEx('���_����_���������');
  strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
  strSQL := StringReplace(strSQL, '&kod&', sInvalidI_II);
  strSQL := StringReplace(strSQL, '&punkt&', sFilterPunkt);
  dbChangeSQL(q,strSQL,true);
  s13:='*';
  while not q.Eof do begin
    s := StringReplace(strSQLTrud, '&adres&', q.Fld('adres_id').AsString);
    dbChangeSQL(q1,s,true);
    if q1.Fld('kolvo').AsInteger=0 then begin  // ��� �������������� ����� �� ������ ����������
      if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
        sss:=q.Fld('lic_id').AsString+'*';
        if Pos('*'+sss,s13)=0 then begin 
          s13:=s13+sss;
          AddLicToList(q.Fld('lic_id').AsString,q.Fld('punkt').AsString,'3',dsLic,dsL);
        end;
        ds.Edit;
        ds.Fld('NUM6').AsInteger:=ds.Fld('NUM6').AsInteger+1;  
        ds.Post;
      end;
    end;
    q.Next;
  end;
  //===������������ �������� �������� 1 � 2 ������ ������������ =======1.4===========================
  ChangeMessage('  ����������� ��������� 1.4  ');
  strSQL := dmBase.LoadSQLEx('���_��������I_II_������_������������');
  strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
  strSQL := StringReplace(strSQL, '&kod&', sInvalidI_II);
  strSQL := StringReplace(strSQL, '&punkt&', sFilterPunkt);
  dbChangeSQL(q,strSQL,true);
  s14:='*';
  while not q.Eof do begin
    s := StringReplace(strSQLTrud, '&adres&', q.Fld('adres_id').AsString);
    dbChangeSQL(q1,s,true);
    if q1.Fld('kolvo').AsInteger=0 then begin  // ��� �������������� ����� �� ������ ����������
      if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
        sss:=q.Fld('lic_id').AsString+'*';
        if Pos('*'+sss,s14)=0 then begin 
          s14:=s14+sss;
          AddLicToList(q.Fld('lic_id').AsString,q.Fld('punkt').AsString,'4',dsLic,dsL);
        end;
        ds.Edit;
        ds.Fld('NUM7').AsInteger:=ds.Fld('NUM7').AsInteger+1;  
        ds.Post;
      end;
    end;
    q.Next;
  end;
  //===��������������� �����========1.5=====================================
  ChangeMessage('  ����������� ��������� 1.5  ');
  sKod:=KodFromName('�������������','������������','kod');
  s15:='*';
  if sKod<>'' then begin
    strSQL := dmBase.LoadSQLEx('���_������� �� ��������� �� ��� �������');
    strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
    strSQL := StringReplace(strSQL, '&gggg&', sKod);
    strSQL := StringReplace(strSQL, '&punkt&', sFilterPunkt);
    dbChangeSQL(q,strSQL,true);
    while not q.Eof do begin
      if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
        sss:=q.Fld('lic_id').AsString+'*';
        if Pos('*'+sss,s15)=0 then begin 
          s15:=s15+sss;
          AddLicToList(q.Fld('lic_id').AsString,q.Fld('punkt').AsString,'5',dsLic,dsL);
        end;
        ds.Edit;
        ds.Fld('NUM8').AsInteger:=ds.Fld('NUM8').AsInteger+1;  
        ds.Fld('NUM9').AsInteger:=ds.Fld('NUM9').AsInteger+q.Fld('KOLVO_M').AsInteger;  
        ds.Post;
      end;
      q.Next;
    end;
  end;
  //===�������� ����========1.6==========================
  ChangeMessage('  ����������� ��������� 1.6  ');
  strSQL := dmBase.LoadSQLEx('���_����_���������');
  strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
  s16:='*';
  if sInvalidV<>'' then begin
    strSQL := StringReplace(strSQL, '&kod&', sInvalidV);
    strSQL := StringReplace(strSQL, '&punkt&', sFilterPunkt);
    dbChangeSQL(q,strSQL,true);
    while not q.Eof do begin
      if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
        sss:=q.Fld('lic_id').AsString+'*';
        if Pos('*'+sss,s16)=0 then begin 
          s16:=s16+sss;
          AddLicToList(q.Fld('lic_id').AsString,q.Fld('punkt').AsString,'6',dsLic,dsL);
        end;
        ds.Edit;
        ds.Fld('NUM10').AsInteger:=ds.Fld('NUM10').AsInteger+1;  
        ds.Post;
      end;
      q.Next;
    end;
  end;
  //===���������������� ��������� ���������=====1.7========================================
  ChangeMessage('  ����������� ��������� 1.7  ');
  sKod:=KodFromName('��������������','��������','kod');
  s17:='*';
  if sKod<>'' then begin
    strSQL := dmBase.LoadSQLEx('���_���� �� ��������� �� ��� �������');
    strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
    strSQL := StringReplace(strSQL, '&gggg&', sKod);
    strSQL := StringReplace(strSQL, '&punkt&', sFilterPunkt);
    dbChangeSQL(q,strSQL,true);
//    writedebug(strSQL);
    while not q.Eof do begin
      if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
        //--------- ���������������� ������� ����� ------------
        ds.Edit;
        sss:=q.Fld('lic_id').AsString+'*';
        if Pos('*'+sss,s17)=0 then begin 
          s17:=s17+sss;
          ds.Fld('NUM19').AsInteger:=ds.Fld('NUM19').AsInteger+1;  
          AddLicToList(q.Fld('lic_id').AsString,q.Fld('punkt').AsString,'7',dsLic,dsL);
        end;
        //-----------------------------------------------------
        ds.Edit;
        ds.Fld('NUM11').AsInteger:=ds.Fld('NUM11').AsInteger+q.Fld('KOLVO').AsInteger;  
        ds.Post;
      end;
      q.Next;
    end;
  end;
  ChangeMessage('  ������ ������������ ... ');

  //===���������������� �����====2.=========================================
  sKod:=KodFromName('�������������','�����������','kod');
//  writedebug('<'+sKod+'>');
  if sKod<>'' then begin
    strSQL := dmBase.LoadSQLEx('���_������_������� �� ��������� �� ��� �������');
    strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
    strSQL := StringReplace(strSQL, '&gggg&', sKod);
    strSQL := StringReplace(strSQL, '&punkt&', sFilterPunkt);
//    writedebug(strSQL);
    dbChangeSQL(q,strSQL,true);
    while not q.Eof do begin
      if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
        ds.Edit;
        ds.Fld('NUM12').AsInteger:=ds.Fld('NUM12').AsInteger+1;  
        sss:='*'+q.Fld('LIC_ID').AsString+'*';
        if Pos(sss,s11)>0 then ds.Fld('NUM13').AsInteger:=ds.Fld('NUM13').AsInteger+1;
        if Pos(sss,s12)>0 then ds.Fld('NUM14').AsInteger:=ds.Fld('NUM14').AsInteger+1;
        if Pos(sss,s13)>0 then ds.Fld('NUM15').AsInteger:=ds.Fld('NUM15').AsInteger+1;
        if Pos(sss,s14)>0 then ds.Fld('NUM16').AsInteger:=ds.Fld('NUM16').AsInteger+1;
        if Pos(sss,s15)>0 then ds.Fld('NUM17').AsInteger:=ds.Fld('NUM17').AsInteger+1;
        if Pos(sss,s16)>0 then ds.Fld('NUM18').AsInteger:=ds.Fld('NUM18').AsInteger+1;
        ds.Post;
      end;
      q.Next;
    end;
  end;
  ///////////////// s17   ����������������  ��.����

  ChangeMessage('  ��������������� ��������� ... ');
  arr[1]:='ms_api=0';             // �� ������������� API 
  arr[2]:='ms_otopl=false';
  arr[3]:='ms_elpr=false';
  strSQL:='select l.id lic_id, l.adres_id, a.punkt from ������������ l left join ��������� a on l.Date_fiks=a.Date_fiks and l.adres_id=a.id '+
          'where l.date_fiks='+QStr(datecursostS)+' and &ssss&  &punkt& ';
  strSQL:=dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
  for i:=1 to 3 do begin
    s:=IntToStr(i);
    strSQL:=StringReplace(strSQL, '&ssss&', arr[i])
    strSQL:=StringReplace(strSQL, '&punkt&', sFilterPunkt);
    dbChangeSQL(q,strSQL,true);
    while not q.Eof do begin
      if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
        ds.Edit;
        dbIncField( ds, 'NUM'+s+'00', 1);      // �����
        sss:='*'+q.Fld('LIC_ID').AsString+'*';
        if Pos(sss,s11)>0 then dbIncField( ds, 'NUM'+s+'01', 1);
        if Pos(sss,s12)>0 then dbIncField( ds, 'NUM'+s+'02', 1);
        if Pos(sss,s13)>0 then dbIncField( ds, 'NUM'+s+'03', 1);
        if Pos(sss,s14)>0 then dbIncField( ds, 'NUM'+s+'04', 1);
        if Pos(sss,s15)>0 then dbIncField( ds, 'NUM'+s+'05', 1);
        if Pos(sss,s16)>0 then dbIncField( ds, 'NUM'+s+'06', 1);
        if Pos(sss,s17)>0 then dbIncField( ds, 'NUM'+s+'07', 1);
        ds.Post;
      end;
      q.Next;
    end;
  end;

  ChangeMessage('  ���������� ����� ... ');
  strSQL:=' select punkt, '+
          ' count(*) all_house, '+
          ' sum(case when kol_kv<2 or kol_kv is null then 1 else 0 end) private, '+
          ' sum(case when kol_kv>2 then 1 else 0 end) mnkv, '+
          ' sum(case when kol_kv=2 then 1 else 0 end) blokir, '+
          ' sum(case when kol_kv>1 and (kol_etag>1) then 1 else 0 end) mnogo '+
          ' from bigHouse  '+
          ' where date_fiks='+QStr(datecursostS)+' and tip=1 &punkt& '+   // ������ ����� ����, ���� �� ���� ����� � ���� �����
          ' group by 1 ';
  s:=StringReplace(sFilterPunkt, 'a.', '');  // !!!
  strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
  strSQL := StringReplace(strSQL, '&punkt&', s);
  dbChangeSQL(q,strSQL,true);
  while not q.Eof do begin
    if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
      ds.Edit;
      ds.Fld('NUM20').AsInteger:=ds.Fld('NUM20').AsInteger+q.Fld('all_house').AsInteger;  
      ds.Fld('NUM21').AsInteger:=ds.Fld('NUM21').AsInteger+q.Fld('private').AsInteger;  
      ds.Fld('NUM22').AsInteger:=ds.Fld('NUM22').AsInteger+q.Fld('mnkv').AsInteger;  
      ds.Fld('NUM23').AsInteger:=ds.Fld('NUM23').AsInteger+q.Fld('blokir').AsInteger;  
      ds.Fld('NUM24').AsInteger:=ds.Fld('NUM24').AsInteger+q.Fld('mnogo').AsInteger;  
      ds.Fld('NUM25').AsInteger:=0;   // ���������
      ds.Post;
    end;
    q.Next;
  end;

  dbClose(q1);

  dbClose(q);
  CloseMessage;

end;


//--------------------------------------------------------
function RaschetPogarPasp2:Boolean;
var
  q,ds,dsAdres:TDataSet;
  n,m,i:Integer;
  s,strSQL:String;
  sDom,sKorp,sFilterPunkt:String;
  d:TDateTime;
  arr : array[1..4] of Integer;
  lOK:Boolean;
begin

  sFilterPunkt:=GetGlobalFilterPunkt;  //  !!!    ������������    ���������� a.punkt

  Result:=true;
  OpenMessage('  �������������� ����� ��������� ... ','',10);
  AppProcess;
  ds := FindReportTable('ZAGS');
  dbZap(ds);
  sFilterPunkt:=StringReplace(sFilterPunkt,'a.punkt=','punkt=');
  if sFilterPunkt='' 
    then q:=dbOpenSQL('select * from ������������� order by name','')
    else q:=dbOpenSQL('select * from ������������� where '+StringReplace(sFilterPunkt,'punkt=','id=')+' order by name','');
  dsAdres:=dmBase.GetDataSet('���������');
  while not q.Eof do begin
    ds.Append;
    n:=SeekValueSpr('�������������','ID',q.Fld('ID').AsInteger,'TYPEPUNKT');
    s:=SeekValueSpr('TypePunkt','ID',n,'NAME');
    ds.Fld('BOK').AsString:=s+' '+q.Fld('NAME').AsString;
    ds.Fld('NUM1').AsInteger:=q.Fld('ID').AsInteger;
    for n:=2 to 25 do ds.Fld('NUM'+IntToStr(n)).AsInteger:=0;
    ds.Post;
    q.Next;
  end;
  // ������ ����� ����, ���� �� ���� ����� � ���� �����
  if sFilterPunkt='' 
    then strSQL:='select * from bigHouse where date_fiks='+QStr(datecursostS)+' and tip=1 '
    else strSQL:='select * from bigHouse where date_fiks='+QStr(datecursostS)+' and tip=1 and '+sFilterPunkt;   
  strSQL := dmBase.CheckDateFiksSQL(strSQL, MaindateFiks);
  dbChangeSQL(q,strSQL,true);
  d:=STOD(datecursostS,'');
  while not q.Eof do begin
    sDom:=Trim(q.Fld('DOM').AsString);
    if sDom='#' then sDom:='';
    sKorp:=Trim(q.Fld('KORP').AsString);
    if sKorp='#' then sKorp:='';
//    writedebug('punkt='+q.Fld('PUNKT').AsString+ '   ul='+q.Fld('UL').AsString+' dom='+sDom+' korp='+sKorp);
    if dmBase.FindAdres(d, q.Fld('PUNKT').AsInteger, q.Fld('UL').AsInteger,sDom,sKorp, '{---}', -1) then begin
      if dbLocate(ds,'NUM1',[q.Fld('PUNKT').AsInteger],'') then begin
        m:=dmBase.GetFindAdresID;

//        if dbLocate(dsAdres,'DATE_FIKS;ID',[d,m],'') 
//          then lOK:=IsAddAdres(dsAdres.Fld('TIP').AsInteger)    // !!! �������� ��� ��� ����� � �������
//          else lOK:=false;
        lOK:=true;
//        if (q.Fld('PUNKT').AsInteger=3) and (q.Fld('UL').AsInteger=15) then begin
//          writedebug('"'+sDom+'   "'+sKorp+'"'+'   count_kv:'+q.Fld('KOL_KV').Asstring+' count_et:'+q.Fld('KOL_ETAG').AsString);
//        end;
        if lOK then begin   // <++++++++++++++++++

          arr[1]:=0;
          arr[2]:=0;
          arr[3]:=0;
          arr[4]:=0;
          n:=2;
          if q.Fld('KOL_KV').IsNull or (q.Fld('KOL_KV').AsInteger<2) then begin
            arr[1]:=2;
          end;
          if (q.Fld('KOL_KV').AsInteger>1) and (q.Fld('KOL_ETAG').AsInteger>1) then begin
            arr[2]:=16;
          end;
          if (q.Fld('KOL_KV').AsInteger>2) then begin
            arr[3]:=23;
          end;
          if (q.Fld('KOL_KV').AsInteger=2)  then begin
            arr[4]:=9;
          end;
          ds.Edit;
          for i:=1 to 4 do begin
            if arr[i]>0 then begin
              n:=arr[i];
              if dmBase.ReadPropAsBoolean(d, m,'GAZ',false)     then ds.Fld('NUM'+IntToStr(n+0)).AsInteger:=ds.Fld('NUM'+IntToStr(n+0)).AsInteger+1;
              if dmBase.ReadPropAsBoolean(d, m,'GID_GAZ',false) then ds.Fld('NUM'+IntToStr(n+1)).AsInteger:=ds.Fld('NUM'+IntToStr(n+1)).AsInteger+1;
              if dmBase.ReadPropAsBoolean(d, m,'VODOPROV',false) 
                then ds.Fld('NUM'+IntToStr(n+2)).AsInteger:=ds.Fld('NUM'+IntToStr(n+2)).AsInteger+1;
              if dmBase.ReadPropAsBoolean(d, m,'KOLODEC',false) 
                then ds.Fld('NUM'+IntToStr(n+3)).AsInteger:=ds.Fld('NUM'+IntToStr(n+3)).AsInteger+1;
              if dmBase.ReadPropAsBoolean(d, m,'CENT_OTOP',false) then begin
                ds.Fld('NUM'+IntToStr(n+4)).AsInteger:=ds.Fld('NUM'+IntToStr(n+4)).AsInteger+1;
              end else begin
                if dmBase.ReadPropAsBoolean(d, m,'PECH',false) 
                  then ds.Fld('NUM'+IntToStr(n+5)).AsInteger:=ds.Fld('NUM'+IntToStr(n+5)).AsInteger+1  //������
                  else ds.Fld('NUM'+IntToStr(n+6)).AsInteger:=ds.Fld('NUM'+IntToStr(n+6)).AsInteger+1; //�����
                // ���� ��� �������� ������� ��������� "PAROV"
              end;
            end;
          end;
          ds.Post;

        end;   // < +++++++++++++++++++++++++++
      end;
    end;
    q.next;
  end;
  dbClose(q);
  CloseMessage;
end;

function RunVoenkomFromSoato:Boolean;
var
  ds : TDataSet;
  Date1,Date2:TDateTime;
  fmParam:TfmParamQuest;
  n,m,m1,m2:Integer;
  lRogd, lUstOtc:Boolean;
  arrType: array[1..4] of Integer;
  arrS: array[1..4] of String;
  sSOATO,s,ss:String;
  lOk:Boolean;
begin
  arrType[1]:=_TypeObj_ZRogd; arrType[2]:=_TypeObj_ZUstOtc; arrType[3]:=_TypeObj_ZBrak; arrType[4]:=_TypeObj_ZRast;
  arrS[1]:='��������'; arrS[2]:='���. ���������'; arrS[3]:='�����'; arrS[4]:='����. �����';
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='���������';
  fmParam.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
  fmParam.AddParamEx(Now, '�������� ����' , 'DATE2' ,'TYPE=DATE');
  fmParam.AddParamEx(false, arrS[1], 'ROGD' ,'');
  fmParam.AddParamEx(false, arrS[2], 'USTOTC' ,'');
  fmParam.AddParamEx(false, arrS[3], 'BRAK' ,'');
  fmParam.AddParamEx(false, arrS[4], 'RAST' ,'');
  fmParam.AddButtons('���������~�����',0);
  n:=fmParam.ShowQuest;
  if n=1 then begin
    Date1:=fmParam.GetValue('DATE1','D');
    Date2:=fmParam.GetValue('DATE2','D');
    if not fmParam.GetValue('ROGD','L')   then arrType[1]:=0;
    if not fmParam.GetValue('USTOTC','L') then arrType[2]:=0;
    if not fmParam.GetValue('BRAK','L')   then arrType[3]:=0;
    if not fmParam.GetValue('RAST','L')   then arrType[4]:=0;
    lUstOtc:=fmParam.GetValue('USTOTC','L');
    OpenMessage('  ����������� ...  ','',10);
    ss:='';
    for n:=1 to 4 do begin
      if arrType[n]>0 then begin
        if n<3 then s:='ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_B_RN;ON_GOROD,ON_B_GOROD'
               else s:='ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_B_RN;ON_M_GOROD,ON_M_B_GOROD';
        m1:=0; m2:=0;
        ds:=dmBase.DataSetFromTypeObj(arrType[n]);
        ds.Filter:='datez>='+DateToFilter(Date1)+' and datez<='+DateToFilter(Date2); //+' and (empty(on_voenkom) or on_voenkom=0)';
        try
          ds.Filtered:=true;
          while not ds.Eof do begin
            if (ds.Fld('ON_VOENKOM').AsInteger=0) and ((ds.Fld('ON_GRAG').AsInteger=112) or (ds.Fld('ON_GRAG').AsInteger=0)) then begin
              lOk:=true;
              if arrType[n]=_TypeObj_ZRogd 
                 then if ds.Fld('SVED').AsInteger<>3 then lOk:=true else lOk:=false;   // �� �� ��������� ������
              if lOk then begin
                sSOATO:=dmBase.GetKodSoatoAkt(ds,s,true,7);
                m:=dmBase.VoenkomFromSOATO(sSOATO);
                if m>0 then begin
                  m2:=m2+1;
                  ds.Edit;
                  ds.Fld('ON_VOENKOM').AsInteger:=m;
                  ds.Post;
                end;
                m1:=m1+1;
              end;
            end;
            ds.Next;
          end;
          if (m1>0) then
            ss:=ss+arrS[n]+': ������� �������: '+IntToStr(m1)+', ���������� ��������: '+InttoStr(m2)+CRLF;
        finally
          ds.Filter:='';
          ds.Filtered:=false;
        end;
      end;
    end;
    CloseMessage;
    if ss<>'' then ShowMessage(ss);
  end;
end;

procedure SeekMen;
var
  sFam,sName,sOtch:String;
  fmParam:TfmParamQuest;
  n:Integer;
  dsMens:TDataSet;
begin
  dsMens:=dbGetDataSet('dmBase.tbMens');
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='���������';
  fmParam.AddParamEx('���������', '�������' , 'FAM' ,'');
  fmParam.AddParamEx('�����', '���' , 'NAME' ,'');
  fmParam.AddParamEx('���������', '��������' , 'OTCH' ,'');
  fmParam.AddButtons('���������~�����',0);
  n:=fmParam.ShowQuest;
  if n=1 then begin
    sFam:=fmParam.GetValue('FAM','S');
    sName:=fmParam.GetValue('NAME','S');
    sOtch:=fmParam.GetValue('OTCH','S');
    dsMens.Filter:='familia='+QStr(Trim(sFam))+' and name='+QStr(Trim(sName))+' and otch='+QStr(Trim(sOtch));
    dsMens.Filtered:=true;
    writedebug(dsMens.Filter);
    if not dsMens.Eof then
      writedebug('Ok!');
    dsMens.Filtered:=false;
    if dbLocate(dsMens,'FAMILIA;NAME;OTCH',[sFam,sName,sOtch],'') then begin
      ShowMessage('Ok!');
    end;
  end;
  fmParam.Free;
end;

procedure CheckKolvoSostav;
var
  sSQL:String;
begin
  OpenMessage('���������� ...','',10);
  sSQL:=' update Ochered set kolvo_sostav=null;'+CRLF+
        ' try '+CRLF+
        '   drop table #tmp;'+CRLF+
        ' catch all'+CRLF+
        ' end;'+CRLF+
        ' select id, count(*) nnn into #tmp from sostavsem where iskl=false or iskl is null group by 1;'+CRLF+
        ' update Ochered set kolvo_sostav=nnn+1  from #tmp t WHERE  Ochered.id=t.id;'+CRLF+
        ' update Ochered set kolvo_sostav=1 WHERE kolvo_sostav is null;';
  dbExecuteSQL(sSQL);
  AppProcess;
  dbCloseCachedTables;
  CloseMessage();
//select id, kolvo_sostav from ochered
end;



