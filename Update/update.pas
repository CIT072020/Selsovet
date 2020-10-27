//  !!! SysQuery('system.columns') !!!
program Main;
var
  idConn : String;
  nVerBase : Integer;
  lCheckOchered1 :Boolean;
  arrCheck : array[0..50] of Boolean;
  check_SprZah:Boolean;
  //для реорганизации ВУС
  sFieldVUS, TypeBase : String;
  dsVUS : TDataSet;

const
  strType_Lich = '2';
  defGrag = 112;
  datecursostS='1899-12-30';
  datecursostF='18991230';
  BEZ_ADRESA  = 3; //  человек не проживает и не зарегистрирован (чужой)

//{$DEFINE CHECK_ATE}
//{$DEFINE CHECK_ADMPROC}

//--------------------------------------------------------------------
procedure InitScript;
begin
  idConn:=dbRegisterConnect('AdsConnection','CHARTYPE=ANSI;TABLETYPE=ADT');
end;

function CheckOchered_Before:Integer;
var
  n:Integer;
  ds:TDataSet;
begin
  Result:=0;
  if (TypeBase<>'ZAGS') and (TypeBase<>'ZAH') and (TypeBase<>'OPEKA')  and (TypeBase<>'POST') then begin
    dbCloseCachedTables;
    ds:=dbOpenSQL('select count(*) as kolvo from '+SysQuery('system.columns')+' where name=''REG_OSNOV'' and parent=''Ochered'' ','');
    n:=ds.Fld('KOLVO').AsInteger;
    dbClose(ds);
    if n>0 then begin
      dbExecuteSQL('UPDATE Ochered set isk_osnov=isk_osnov+1000 where isk_osnov is not null and isk_osnov>0 and isk_osnov<1000;');
      dbExecuteSQL('TRY drop table OcheredTmp; CATCH ALL END TRY;');
      ds:=dbOpenSQL('select * into OcheredTmp from Ochered','');
      if dbLastError()='' then begin
        lCheckOchered1:=true;
      end else begin
        PutError(dbLastError());
        Result:=1;
      end;
      dbClose(ds);
    end;
  end;
end;

procedure _CreateN_Delo(ds:TDataSet);
var
  s:String;
begin
  while not ds.eof do begin
    s:=Trim(ds.Fld('DELO').AsString);
    ds.Edit;
    if s<>'' then begin
      if IsAllDigit(s) then begin
        ds.Fld('N_DELO').AsInteger := StrToInt(s);
      end else begin
        s:=Trim(Q_GetWordN(1,s, './-()*'));
        if IsAllDigit(s) 
          then ds.Fld('N_DELO').AsInteger := StrToInt(s)
          else ds.Fld('N_DELO').AsInteger := 0;
      end;
    end else begin
      ds.Fld('N_DELO').AsInteger := 0;
    end;
    ds.Post;
    ds.Next;
  end;
end;

function CheckOchered_After:Integer;
var
  s,sAdd:String;
  n:Integer;
  ds:TDataSet;
begin
  //------------------------
  Result:=0;
  if lCheckOchered1 then begin
    ds:=dbOpen('OcheredTmp','');
    if (ds<>nil) then begin
      if ds.FindField('REG_OSNOV2')=nil 
        then sAdd:=',0,'+QStr('')
        else sAdd:=',REG_OSNOV2,REG_OSNOV_TEXT2';
      dbClose(ds);
    end;
//    writedebug(sAdd);
    s:='insert into OcheredResh (ID,OCHERED_ID,TIP,NOMER,DATER,OSNOV,OSNOV_TEXT,OSNOV2,OSNOV_TEXT2,OTKAZ,DATE_SILA) '+
       '   select ID,OCHERED_ID,1,REG_RESH,ISNULL(REG_DATE,DEC_DATE),ISNULL(REG_OSNOV,0),REG_OSNOV_TEXT'+sAdd+',OTKAZ,ISNULL(DEC_DATE,REG_DATE)  '+
       '   from OcheredTmp where reg_date is not null or reg_resh is not null or iskl=false or iskl is null;'+
       'insert into OcheredResh (ID,OCHERED_ID,TIP,NOMER,DATER,OSNOV,OSNOV_TEXT,ADDINFO,OTKAZ) '+
       '   select ID,OCHERED_ID,9,ISK_RESH,ISK_DATE,ISNULL(ISK_OSNOV,0),ISK_OSNOV_TEXT,ISK_ADDINFO,false '+
       '   from OcheredTmp where isk_date is not null or isk_resh is not null or iskl=true;';
    dbExecuteSQL(s); 
    if dbLastError()<>'' then begin
      PutError(dbLastError());
      Result:=1;
    end;
    dbExecuteSQL('TRY drop table OcheredTmp; CATCH ALL END TRY;');

    s:='update Ochered set ID_POST_RESH=0, ID_SN_RESH=0,ID_LAST_RESH=0;'+
       'update Ochered set ID_POST_RESH=ISNULL(AUTO_ID,0) FROM OcheredResh where ochered.id=ocheredResh.id and ochered.ochered_id=ocheredResh.ochered_id and tip=1;'+
       'update Ochered set ID_SN_RESH=ISNULL(AUTO_ID,0) FROM OcheredResh where ochered.id=ocheredResh.id and ochered.ochered_id=ocheredResh.ochered_id and tip=9;'+
       'update Ochered set ID_LAST_RESH=ID_SN_RESH FROM Ochered where iskl=true;'+
       'update Ochered set ID_LAST_RESH=ID_POST_RESH FROM Ochered where iskl=false or iskl is null;';
    dbExecuteSQL(s); 
    if dbLastError()<>'' then begin
      PutError(dbLastError());
      Result:=1;
    end;
    if Result=0 then begin
      ds:=dbOpen('Ochered','');
      if ds<>nil then begin
        _CreateN_Delo(ds);
        dbClose(ds);
      end;
    end;
  end;
end;

//-----------------------------------------------------------------
function GetCaseForField(ds:TDataSet; strFieldName:String):String;
begin
  Result:=strFieldName+'=case '+strFieldName;
  ds.First;
  while not ds.Eof do begin
    Result:=Result+' when '+ds.FieldByName('ID_OLD').AsString+' then '+ds.FieldByName('ID_NEW').AsString;
    ds.Next;
  end;
  Result:=Result+' else '+strFieldName+' end';
end;

//-----------------------------------------------------------------
function CheckSprOwners:Integer;
var
  sl : TStringList;
  s,strSQL:String;
  ds,dsM,dsS:TDataSet;
  i : Integer;
begin
  Result:=0;
  //--- перекодировка "HouseOwners" на соответствие полных однофамильцев из базы "Население"
  strSQL:='select n.id id_new, s.id id_old '+Chr(13)+
          ' from население n '+Chr(13)+
          ' left join sprowners s on s.name=trim(n.familia)+'+QStr(' ')+'+trim(n.name)+'+QStr(' ')+'+trim(n.otch) '+Chr(13)+
          '                          and n.date_fiks=s.date_fiks and s.typeowner=1'+Chr(13)+
          ' where n.date_fiks='+QStr(datecursostS)+' and s.id is not null';
  ds := dbOpenSQL(strSQL,'');
  if ds.Eof then begin
    dbClose(ds);
  end else begin
    s:=GetCaseForField(ds,'kod');
    dbClose(ds);
    dbExecuteSQL('update HouseOwners set '+s+' where typekod=2');
    if dbLastError()<>'' then begin
      Result := 1;
    end;
  end;
  if Result=0 then begin
    //--- добавим людей из справочника "SprOwners" в базу "Население" ---
    strSQL:=
            ' select * from sprowners '+Chr(13)+
            ' where typeowner=1 and date_fiks='+QStr(datecursostS)+' and id not in (select s.id '+Chr(13)+
            ' from население n '+Chr(13)+
            ' left join sprowners s on s.name=trim(n.familia)+'+QStr(' ')+'+trim(n.name)+'+QStr(' ')+'+trim(n.otch) '+Chr(13)+
            '                          and n.date_fiks=s.date_fiks and s.typeowner=1'+Chr(13)+
            ' where n.date_fiks='+QStr(datecursostS)+' and s.id is not null) and id in (select kod from houseowners)';
    ds := dbOpenSQL(strSQL,'');
//    WriteDebug(IntToStr(ds.RecordCount));
    dsM := dbOpen('Население','');
    dsS := dbOpen('БазаСтрок','');
    sl := TStringList.Create;
    while not ds.Eof do begin
//      WriteDebug(ds.Fld('ID').AsString+' '+ds.Fld('NAME').AsString);
      dsM.Append;
      sl.Clear;
      StrToStrings(ds.Fld('NAME').AsString, sl, ' ');
      dsM.Fld('FAMILIA').AsString:='';
      dsM.Fld('NAME').AsString:='';
      dsM.Fld('OTCH').AsString:='';
      if sl.Count>0 then dsM.Fld('FAMILIA').AsString:=sl.Strings[0];
      if sl.Count>1 then dsM.Fld('NAME').AsString:=sl.Strings[1];
      if sl.Count>2 then dsM.Fld('OTCH').AsString:=sl.Strings[2];
      dsM.Fld('DATE_FIKS').AsDateTime:=STOD(datecursostS,'');
      dsM.Fld('ID').AsInteger:=ds.Fld('ID').AsInteger;
      if not ds.Fld('DATER').IsNull then dsM.Fld('DATER').AsDateTime:=ds.Fld('DATER').AsDateTime;
      dsM.Fld('POL').AsString:=ds.Fld('POL').AsString;
      dsM.Fld('LICH_NOMER').AsString:=ds.Fld('LICH_NOMER').AsString;
      dsM.Fld('TELEFON').AsString:=ds.Fld('TELEFON').AsString;
      dsM.Fld('CITIZEN').AsString:=ds.Fld('CITIZEN').AsString;
      dsM.Fld('KATEG').AsInteger:=BEZ_ADRESA; //  человек не проживает и не зарегистрирован (чужой)
      dsM.Fld('LIC_ID').AsInteger:=0;
      dsM.Fld('ADRES_ID').AsInteger:=0;
      dsM.Fld('PROPIS').AsBoolean:=false;
      dsM.Fld('PRESENT').AsBoolean:=false;
      dsM.Fld('CANDELETE').AsBoolean:=false;
      dsM.Fld('FIRST').AsBoolean:=false;
      dsM.Fld('VUS').AsBoolean:=false;
      dsM.Fld('OCHERED').AsBoolean:=false;
      dsM.Post;
      //--- запишем адрес прописки в таблицу "БазаСтрок"------
      dsS.Append;
      dsS.Fld('DATE_FIKS').AsDateTime:=dsM.Fld('DATE_FIKS').AsDateTime;
      dsS.Fld('ID').AsInteger:=dsM.Fld('ID').AsInteger;
      dsS.Fld('TYPEOBJ').AsInteger:=3; //dmBase.TypeObj_Nasel
      dsS.Fld('POKAZ').AsString:='ADRES_PROP';
      dsS.Fld('VALUE').AsString:=ds.Fld('ADRES').AsString;
      dsS.Post;
      //---------------------------------
      ds.Next;
    end;
    sl.Free;
    dbClose(ds);
    dbClose(dsM);
    dbClose(dsS);
  end;
  //-------------------------------------------
  if Result=0 then begin
    //--- перекодировка "HouseOwners" на соответствие наименования из справочника "СпрМестРаботы" ---
    strSQL:='select n.id id_new, s.id id_old, '+Chr(13)+
          ' n.name name_pred, s.name name_spr '+Chr(13)+
          ' from СпрМестРаботы n '+Chr(13)+
          ' left join sprowners s on s.name=n.name and s.date_fiks='+QStr(datecursostS)+' and s.typeowner=2'+Chr(13)+
          ' where s.id is not null';
    ds := dbOpenSQL(strSQL,'');
    if ds.Eof then begin
      dbClose(ds);
    end else begin
      s:=GetCaseForField(ds,'kod');
      dbClose(ds);
      dbExecuteSQL('update HouseOwners set '+s);
      if dbLastError()<>'' then begin
        Result := 1;
      end;
    end;
  end;
  if Result=0 then begin
    //--- добавим предприятия из справочника "SprOwners" в таблицу "СпрМестРаботы" ---
    strSQL:=
            ' select * from sprowners '+Chr(13)+
            ' where typeowner=2 and date_fiks='+QStr(datecursostS)+' and id not in (select s.id '+Chr(13)+
            ' from СпрМестРаботы n '+Chr(13)+
            ' left join sprowners s on s.name=n.name and s.date_fiks='+QStr(datecursostS)+' and s.typeowner=2'+Chr(13)+
            ' where s.id is not null and s.id in (select kod from houseowners))';
    ds := dbOpenSQL(strSQL,'');
    dsM := dbOpen('СпрМестРаботы','');
    while not ds.Eof do begin
      dsM.Append;
      dsM.Fld('ID').AsInteger:=ds.Fld('ID').AsInteger;
      dsM.Fld('NAME').AsString:=ds.Fld('NAME').AsString;
      dsM.Fld('TELEFON').AsString:=ds.Fld('TELEFON').AsString;
      dsM.Fld('ADRES').AsString:=ds.Fld('ADRES').AsString;
      dsM.Post;
      ds.Next;
    end;
    dbClose(ds);
    dbClose(dsM);
  end;
  if Result=0 then begin
    dbExecuteSQL('update HouseOwners set typekod=1');
    if dbLastError()<>'' then Result := 1;
    dbExecuteSQL('update HouseOwners set typekod=2 where kod in (select id from СпрМестРаботы)');
    if dbLastError()<>'' then Result := 1;
    dbExecuteSQL('delete from SprOwners'); // очистим справочник собственников, после успешной обработки
    if dbLastError()<>'' then Result := 1;
  end;
end;

//------------------------------------------------------------
procedure CheckNamePunktBase;
var
  ds : TdataSet;
  s : String;
  i:Integer;
  lErr:Boolean;
begin
//  ds:= dmBase.GetDataSet('СпрНасПунктов');
  ds:=dbOpen('СпрНасПунктов','');
  ds.First;
  while not ds.Eof do begin
    s := CheckNamePunkt(ds.FieldByName('NAME').AsString);
    if s <> '' then begin
      i:=Pos(';',s);
      ds.Edit;
      ds.FieldByName('TYPEPUNKT').AsString:=Copy(s,1,i-1);
      ds.FieldByName('NAME').AsString:=Trim(Copy(s,i+1,200));
      ds.Post;
    end;
    ds.Next;
  end;
  dbClose(ds);
  ds:=dbOpen('SprPerevod','');
  dbSetIndex(ds, 'BEL_KEY');       // TIP;B_NAME
  ds.First;
  while not ds.Eof do begin
    lErr:=false;
    if ds.FieldByName('TIP').AsInteger=3 then begin // нас пункты
      ds.Edit;
      s := CheckNamePunkt(ds.FieldByName('R_NAME').AsString);
      if s <> '' then begin
        i:=Pos(';',s);
        ds.FieldByName('R_NAME').AsString:=Trim(Copy(s,i+1,200));
      end;
      try
        ds.Post;
      except
        lErr:=true;
        ds.Cancel;
      end;
    end;
    if lErr then ds.delete else ds.next;
  end;
  dbSetIndex(ds, 'PR_KEY');  // TIP;R_NAME
  ds.First;
  while not ds.Eof do begin
    lErr:=false;
    if ds.FieldByName('TIP').AsInteger=3 then begin // нас пункты
      ds.Edit;
      s := CheckNamePunktB(ds.FieldByName('B_NAME').AsString);
      if s <> '' then begin
        i:=Pos(';',s);
        ds.FieldByName('B_NAME').AsString:=Trim(Copy(s,i+1,200));
      end;
      try
        ds.Post;
      except
        lErr:=true;
        ds.Cancel;
      end;
    end;
    if lErr then ds.delete else ds.next;
  end;
  dbClose(ds);
end;

//------------------------------------------------------------
function CheckSprWork : Integer;
var
  dsObj,dsSpr : TdataSet;
  s,sNewId,sOldID : String;
  fldID:TField;
begin
  Result:=0;
  dsSpr:=dbOpen('СпрМестРаботы','');
  if not dsSpr.Eof then begin 
    s:=' %ID%=case %ID% ';
    dsObj:=dbOpen('СозданиеОбъекта','');
    fldID:=dsSpr.Fld('ID');
    dsSpr.First;
    while not dsSpr.Eof do begin dsSpr.Edit;fldID.AsInteger:=-1*fldID.AsInteger;dsSpr.Post;dsSpr.Next; end;
    dsSpr.First;
    while not dsSpr.Eof do begin
      dsObj.Append;
      dsObj.Fld('USERID').AsString:='ADSSYS';
      dsObj.Fld('DATE_ADD').AsDateTime:=Now;
      dsObj.Fld('TYPEOBJ').AsInteger:=22;     //  dmBase.TypeObj_Organ
      dsObj.Post;
      sNewID:=dsObj.Fld('NEWID').AsString;
      sOldID:=IntToStr(-1*dsSpr.Fld('ID').AsInteger);
      dsSpr.Edit;
      fldID.AsString:=sNewID;
      dsSpr.Post;
      s := s + ' when '+sOldID+' then '+sNewID;
      dsSpr.Next;
    end;
    dbClose(dsObj);
    s:=s+' else %ID% end';
    s:=Stringreplace(s,'%ID%','work_spr');
    dbExecuteSQL('UPDATE Население SET '+s+' WHERE work_spr is not null');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (СпрМестРаботы->Население): '+dbLastError() );
      Result := 1;
    end;
  end;
  dbClose(dsSpr);
end;

//-----------------------------------------
procedure CheckMen(ds:TDataSet);
begin
end;

//---------------------------------------
function CheckSprAdmProc(sTb:String; nVer:Integer; sProc:String; sDel:String):Integer;
var
  ds,dsNew:TDataSet;
  sl:TStringList;
  s:String;
  i:Integer;
  lAdd:Boolean;
begin
  Result:=0;
{$IFDEF CHECK_ADMPROC}
  if nVerBase<nVer then begin
    ChangeMessage('Административные процедуры ...');
    sl:=TStringList.Create;
    ds:=dbOpen(sTb,'');
    dsNew:=dbOpenSQL('SELECT * FROM NewBase.'+sTb+' ORDER BY ID','');
    if (ds<>nil) and (dsNew<>nil) then begin
      try
      if sProc<>'' then begin
        sl.Clear;
        StrToStrings(sProc, sl, ';');
        for i:=0 to sl.Count-1 do begin
          s:=sl.strings[i];
          if dbLocate(dsNew, 'ID', [s], '') then begin
            if dbLocate( ds, 'ID', [s], '') then begin
              ds.Edit;
              lAdd:=false;
            end else begin
              ds.Append;
              lAdd:=true;
            end;
            if lAdd then begin
              ds.FieldByName('ID').AsInteger:=dsNew.FieldByName('ID').AsInteger;
              ds.FieldByName('IS_SELECT').AsInteger:=dsNew.FieldByName('IS_SELECT').AsInteger;
            end;
            ds.FieldByName('PARENT_ID').AsInteger:=dsNew.FieldByName('PARENT_ID').AsInteger;
            ds.FieldByName('IS_NODE').AsInteger:=dsNew.FieldByName('IS_NODE').AsInteger;
            ds.FieldByName('HI_CODE').AsString:=dsNew.FieldByName('HI_CODE').AsString;
            ds.FieldByName('HI_LEVEL').AsInteger:=dsNew.FieldByName('HI_LEVEL').AsInteger;
            ds.FieldByName('PROC_NO').AsString:=dsNew.FieldByName('PROC_NO').AsString;
            ds.FieldByName('NAME').AsString:=dsNew.FieldByName('NAME').AsString;
            ds.FieldByName('FULL_NAME').AsString:=dsNew.FieldByName('FULL_NAME').AsString;
            ds.FieldByName('NEED_REQ').AsString:=dsNew.FieldByName('NEED_REQ').AsString;
            ds.FieldByName('PROC_RES').AsString:=dsNew.FieldByName('PROC_RES').AsString;
            ds.FieldByName('EXCL_DATE').Value:=dsNew.FieldByName('EXCL_DATE').Value;
            ds.Post;
          end;
        end;
      end;
      if sDel<>'' then begin   // удаление
        sl.Clear;
        StrToStrings(sDel, sl, ';');
        for i:=0 to sl.Count-1 do begin
          s:=sl.strings[i];
          if dbLocate( ds, 'ID', [s], '') then begin
            ds.Delete;
          end;
        end;
      end;
      except
        Result:=1;
      end;
    end;
    dbClose(ds);
    dbClose(dsNew);
    sl.Free;
  end;
{$ENDIF}
end;

procedure _CheckErrorID_BASE;
var
  ds,dsCheck:TDataSet;
  strSQL:String;
begin
//  OpenMessage(' Выполнение обработки ...    ','',10);
//  SetScreenCursor('HOURCLASS');
  strSQL :='select o.id, o.ochered_id, o.id_base id_base, ol.id_base id_base_new from ochered o '+
           ' left join ochered ol on o.id=ol.id and ol.ochered_id=0 '+
           ' where o.id_base=0 and o.ochered_id>0 and ol.id_base>0 ';
  try
    dsCheck:=dbOpenSQL(strSQL,'');
    ds := dbOpen('Ochered',''); //dbGetDataSet('dmBase.tbOchered');
    while not dsCheck.eof do begin
      if dbLocate(ds,'OCHERED_ID;ID',[dsCheck.Fld('OCHERED_ID').AsInteger,dsCheck.Fld('ID').AsInteger],'') then begin
        ds.Edit;
        ds.Fld('ID_BASE').AsInteger:=dsCheck.Fld('ID_BASE_NEW').AsInteger;
        ds.Post;
      end;
      dsCheck.Next;
    end;
    dbClose(dsCheck);
    dbClose(ds);
  finally
//    CloseMessage;
//    RestScreenCursor;
  end;
end;

function UpdateChildPrich:Integer;
var
  ds:TDataSet;
  lUpdate:Boolean;
begin
  Result:=0;
  ds := dbOpenSQL('SELECT Count(*) FROM SprChildPrich','');
  if ds.Fields.Fields[0].AsInteger=0 then lUpdate:=true else lUpdate:=false;
  dbClose(ds);
//  lUpdate:=true;
  if lUpdate then begin
    dbExecuteSQL('INSERT INTO SprChildPrich SELECT * FROM NewBase.SprChildPrich ');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (SprChildPrich): '+dbLastError() );
      Result:=1;
    end else begin
      ds:=dbOpen('SprChildPrich','');
      while not ds.Eof do begin
        dbExecuteSQL('update AktOpek set prich_child='+ds.Fld('ID').AsString+' where prich_child='+ds.Fld('OLD').AsString);
        ds.Next;
      end;
      dbClose(ds);
    end;
  end;
end;
function UpdateGosClassObr:Integer;
var
  ds:TDataSet;
  lUpdate:Boolean;
begin
  Result:=0;
  lUpdate:=false;
  ds:=dbOpenSQL('SELECT Count(*) FROM SprDocSubjG','');
  if ds<>nil then begin 
    if ds.Fields.Fields[0].AsInteger=0 then lUpdate:=true;
    dbClose(ds);
  end;
  if not lUpdate then begin
    ds:=dbOpenSQL('SELECT Max(dateizm) FROM SprDocSubjG','');
    if ds<>nil then begin 
      if (ds.Fields.Fields[0].IsNull) or (ds.Fields.Fields[0].AsDateTime<STOD('2019-01-01','')) then begin 
        dbExecuteSQL('DELETE FROM SprDocSubjG;');  // !!!  повторно обновим справочник !!!
        lUpdate:=true;
      end;
      dbClose(ds);
    end;
  end;
  if lUpdate then begin
    dbExecuteSQL('INSERT INTO SprDocSubjG SELECT * FROM SysSpr.SprDocSubj;');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (SprSocSubjG): '+dbLastError() );
      Result:=1;
    end;
  end;
end;
function CheckZags_Before:Boolean;
var
  n:Integer;
  ds:TDataSet;
begin
  Result:=false;
  ds:=dbOpenSQL('select count(*) as kolvo from '+SysQuery('system.columns')+' where name=''ST21'' and parent=''DeclareIzm'' ','');
  n:=ds.Fld('KOLVO').AsInteger;
  dbClose(ds);
  if n=0 
    then Result:=true;   // поле St21 отсутствует
end;
//---------------------------------------
procedure CopyDecl21;
var
  dsFrom, dsTo:TDataSet;
  fld:TField;
begin
  dsFrom:=dbOpenSQL('SELECT d.* FROM DeclareChName d WHERE st21=true','');
  dsTo := dbOpen('DeclareIzm',''); //dmBase.GetDataSet('DeclareIzm');
  while not dsFrom.Eof do begin
    dbAppendRecord(dsFrom, dsTo, true);
    dsTo.Edit;
    dbCopyRecordEx(dsFrom, dsTo, 'familia=familiaDo;name=nameDo;otch=otchDo;familiana=familiaPosle;nameNa=namePosle;otchNa=otchPosle;familiaNa_B=familiaPosle_B;reg_nomer=b_nomer;reg_date=b_date;reg_zags=b_zags;');
    fld:=dsTo.Fld('ADD_FIELDS');
    addToXMLField(fld, 'WORK_PLACE', dsFrom.Fld('WORK_PLACE').AsString, 'C');
    addToXMLField(fld, 'OTMETKA_ISP', dsFrom.Fld('OTMETKA_ISP').AsString, 'C');
    addToXMLField(fld, 'PRIM', dsFrom.Fld('PRIM').AsString, 'C');
    dsTo.Post;
    dsFrom.next;
  end;
  dbClose(dsTo);
  dbClose(dsFrom);
  dbExecuteSQL('delete from DeclareChName where st21=true'); 
end;
//-----------------------------------------
function CheckDateSverki:Integer;
var
  sSQL:String;
begin
Result:=0;
sSQL:=
'delete from BaseTextProp where typeobj=3 and pokaz=''SVERKI'';'++Chr(13)+
'insert into baseTextProp (TYPEOBJ, ID, DATES, POKAZ, VALUE)  '+
'select 3 typeobj, ID, ''1900-01-01'' dates, ''SVERKI'' pokaz, ''NAME=Форма 2''+char(13)+char(10)+''DATE_SV=''+'+
'      Trim(convert(Year(DATESV_F2),sql_char))+Trim(IIF(Month(DATESV_F2)<10,''0''+convert(Month(DATESV_F2),sql_char),convert(Month(DATESV_F2),sql_char)))+'+
'      Trim(IIF(DayOfMonth(DATESV_F2)<10,''0''+convert(DayOfMonth(DATESV_F2),sql_char),convert(DayOfMonth(DATESV_F2),sql_char)))+char(13)+char(10) value '+
'  from vus where DATESV_F2 is not null;'++Chr(13)+
'insert into baseTextProp (TYPEOBJ, ID, DATES, POKAZ, VALUE)  '+
'select 3 typeobj, ID, ''1900-01-02'' dates, ''SVERKI'' pokaz, ''NAME=Военный комиссариат''+char(13)+char(10)+''DATE_SV=''+'+
'      Trim(convert(Year(DATESV_VK),sql_char))+Trim(IIF(Month(DATESV_VK)<10,''0''+convert(Month(DATESV_VK),sql_char),convert(Month(DATESV_VK),sql_char)))+'+
'      Trim(IIF(DayOfMonth(DATESV_VK)<10,''0''+convert(DayOfMonth(DATESV_VK),sql_char),convert(DayOfMonth(DATESV_VK),sql_char)))+char(13)+char(10) value'+
'  from vus where DATESV_VK is not null; '++Chr(13)+
'insert into baseTextProp (TYPEOBJ, ID, DATES, POKAZ, VALUE)  '+
'select 3 typeobj, ID, ''1900-01-03'' dates, ''SVERKI'' pokaz, ''NAME=Карточка прописки''+char(13)+char(10)+''DATE_SV=''+'+
'      Trim(convert(Year(DATESV_LIC),sql_char))+Trim(IIF(Month(DATESV_LIC)<10,''0''+convert(Month(DATESV_LIC),sql_char),convert(Month(DATESV_LIC),sql_char)))+'+
'      Trim(IIF(DayOfMonth(DATESV_LIC)<10,''0''+convert(DayOfMonth(DATESV_LIC),sql_char),convert(DayOfMonth(DATESV_LIC),sql_char)))+char(13)+char(10) value'+
'  from vus where DATESV_LIC is not null;'
  dbExecuteSQL(sSQL);
  if dbLastError()<>'' then begin
    ShowMessage( 'Ошибка выполнения скрипта (создание списка дат сверки): '+dbLastError() );
    Result:=1;
  end;
end;
//-----------------------------------------
function AfterUpdate : Integer;
var
  strSQL,s,ss : String;
  ds,ds2 : TDataSet;
  lUpdate : Boolean;
  n:Integer;
  d1,d2:TDateTime;
begin
{
  dbExecuteSQL('EXECUTE PROCEDURE sp_DropLink('+QStr('NewBase')+', TRUE);');
  strSQL := 'EXECUTE PROCEDURE sp_CreateLink('+QStr('NewBase')+','+
             QStr('..\NewData\Ss.add')+', TRUE, FALSE, TRUE, '+
             QStr('')+', '+QStr('')+');';
  dbExecuteSQL(strSQL);
}
  ChangeMessage('Контроль базы ...');

  if Result=0 then begin
    lUpdate := false;
    ds := dbOpenSQL('SELECT Count(*) FROM SprDocSubj','');
    if ds.Fields.Fields[0].AsInteger=0 then begin
      lUpdate := true;
    end;
    dbClose(ds);
    if lUpdate then begin
      dbExecuteSQL('INSERT INTO SprDocSubj SELECT * FROM NewBase.SprDocSubj ');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (SprDocSubj): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
  if Result=0 then begin
    lUpdate := false;
    ds := dbOpenSQL('SELECT Count(*) FROM SprDocFileList','');
    if ds.Fields.Fields[0].AsInteger=0 then begin
      lUpdate := true;
    end;
    dbClose(ds);
    if lUpdate then begin
      dbExecuteSQL('INSERT INTO SprDocFileList SELECT * FROM NewBase.SprDocFileList ');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (SprDocFileList): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
  if lCheckOchered1 then begin
    if Result=0 then begin
      Result:=CheckOchered_After;
      if Result=1 then begin
        ShowMessage( 'Ошибка выполнения скрипта: '+chr(13)+'Реорганизация очередников'+chr(13)+dbLastError() );
      end;
    end else begin
      dbExecuteSQL('TRY drop table OcheredTmp; CATCH ALL END TRY;');
    end;
  end;
  if (Result=0) then begin
    lUpdate := false;
    ds := dbOpenSQL('SELECT Count(*) FROM SprDocAdmProc','');
    if ds.Fields.Fields[0].AsInteger=0 then begin
      lUpdate := true;
    end;
    dbClose(ds);
    if lUpdate then begin
      dbExecuteSQL('INSERT INTO SprDocAdmProc SELECT * FROM NewBase.SprDocAdmProc');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (SprDocAdmProc): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
  if arrCheck[1] then begin // LAIS.SMDO  или ЛАИС
    if (Result=0) then begin
      ds:=dbOpenSQL('SELECT Count(*) FROM system.tables WHERE name=''SMDOSprVidDok''','');
      if ds.Fields.Fields[0].AsInteger>0 then begin
        dbClose(ds);
        lUpdate := false;
        ds := dbOpenSQL('SELECT Count(*) FROM SMDOSprVidDok','');
        if ds.Fields.Fields[0].AsInteger=0 then begin
          lUpdate := true;
        end;
        dbClose(ds);
        if lUpdate then begin
          dbExecuteSQL('INSERT INTO SMDOSprVidDok SELECT * FROM NewBase.SMDOSprVidDok');
          if dbLastError()<>'' then begin
            ShowMessage( 'Ошибка выполнения скрипта (SMDOSprVidDok): '+dbLastError() );
  //          Result := 1;
         end;
        end;
      end;
    end;
    if (Result=0) then begin
      ds:=dbOpenSQL('SELECT Count(*) FROM system.tables WHERE name=''SMDOSprOrg''','');
      if ds.Fields.Fields[0].AsInteger>0 then begin
        dbClose(ds);
        lUpdate := false;
        ds := dbOpenSQL('SELECT Count(*) FROM SMDOSprOrg','');
        if ds.Fields.Fields[0].AsInteger=0 then begin
          lUpdate := true;
        end;
        dbClose(ds);
        if lUpdate then begin
          dbExecuteSQL('INSERT INTO SMDOSprOrg SELECT * FROM NewBase.SMDOSprOrg');
          if dbLastError()<>'' then begin
            ShowMessage( 'Ошибка выполнения скрипта (SMDOSprOrg): '+dbLastError() );
  //          Result := 1;
         end;
        end;
      end;
    end;
  end;
  if arrCheck[8] then begin // LAIS.SMDO  или ЛАИС
    dbExecuteSQL('DELETE FROM УдалениеОбъекта WHERE typeobj=35');
  end;
  if arrCheck[9] then begin // LAIS или ZAGS
    dbExecuteSQL('DELETE FROM УдалениеОбъекта;');   
    dbExecuteSQL('UPDATE АктыСмертей  SET SM_B_RESP=false;');   //Корректировались реквизиты ГИС РН
    dbExecuteSQL('UPDATE АктыРождений SET B_RESP=false;');
    dbExecuteSQL('UPDATE АктыУстОтцовства SET B_RESP=false;');
    dbExecuteSQL('UPDATE ЗаключениеБраков SET ON_B_RESP=false;');
    if TypeBase='ZAGS' then begin
      dbExecuteSQL('UPDATE AktChangeName SET B_RESP=false;');
      dbExecuteSQL('UPDATE АктыУстМатеринства SET B_RESP=false;');
      dbExecuteSQL('UPDATE AktTermMarriage SET ON_B_RESP=false;');
    end;
  end;
//----------------------------------------
  if (Result=0) and arrCheck[16] then begin
    strSQL:='UPDATE Население SET nomer_sem=0 WHERE nomer_sem is null; '+
            'UPDATE Население SET nomer_sem=1 WHERE nomer_sem>1;'+
            'UPDATE Население SET new_id=0;';
    dbExecuteSQL(strSQL);
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Население): '+dbLastError() );
      Result := 1;
    end;
    if (Result=0) then begin
      strSQL:='update SprDocAdmProc set proc_no=''1.1.13.'' where id in (16,17,18); '+
              'update SprDocAdmProc set proc_no=''6.1.1.'' where id in (152,153,154,155,156,157,158,159,160); '+
              'update SprDocAdmProc set proc_no=''11.13.1.'' where id in (304,305,306); '+
              'update SprDocAdmProc set proc_no=''11.13.2.'' where id in (308,309);';
      dbExecuteSQL(strSQL);
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (SprDocAdmProc): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
  {
  if (Result=0) then begin
    Result:=CheckSprAdmProc('SprDocAdmProc', 170, '370;389;519;520;5;26;42;48;51;52;131;227;585;593;65;66;67;69;369;730;731;732;733;734;735;736;737;738;','');
  end;
  if (Result=0) then begin
    Result:=CheckSprAdmProc('SprDocAdmProcU', 170, '10689;10667;10691;10705;10826;10827;10828;10829;10135;10136;10052;10070;','10137;10138;10139;10140;10141;');
  end;
  }
  if (Result=0) and arrCheck[20] then begin
    dbExecuteSQL('update БазаДомов set dom2=null where trim(dom2)=''''; '+
                 'update БазаДомов set dom1=null where trim(dom1)=''''; ');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (БазаДомов): '+dbLastError() );
    end;
  end;
  if (Result=0) and arrCheck[21] then begin
    dbExecuteSQL('update Ochered set id_base=0 where id_base is null; '+
                 'update Население set id_base=0 where id_base is null;'+
                 'update OcheredResh set id_base=0 where id_base is null;'+
                 'update OcheredResh set plan=false where plan is null;'+
                 'update OcheredResh set date_sort=dater where date_sort is null and dater is not null;');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (id_base): '+dbLastError() );
    end;
  end;
  if (Result=0) and arrCheck[22] then begin
    _CheckErrorID_BASE;
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (check id_base): '+dbLastError() );
    end;
  end;
  if (Result=0) and arrCheck[23] then begin
    dbExecuteSQL('update SostavSem set iskl=false where iskl is null;'+
                 'update Ochered set only=false where only is null;'+
                 'update Ochered set simple=1 where simple is null;');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта 23: '+dbLastError() );
    end;
  end;
  if (Result=0) and arrCheck[24] then begin
    dbExecuteSQL('update Ochered set dec_date_real=dec_date where dec_date_real is null and dec_date is not null;'+
                 'delete from ocheredResh where id not in (select id from ochered);');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта 24: '+dbLastError() );
    end;
  end;
  if (Result=0) and arrCheck[25] then begin
    strSQL:=
     '  try '+
     '  drop table #d1; '+
     '  drop table #d2; '+
     '  drop table #d3; '+
     '  drop table #d4; '+
     'catch all '+
     'end; '+
     'select id id1, max(date_srok) ddd1 into #d1 from населениеДвижение where date_fiks=''1899-12-30'' and tip=0 and contant=0 and date_srok is not null group by 1; '+
     'select id id2, max(date)      ddd2 into #d2 from населениеДвижение where date_fiks=''1899-12-30'' and tip=0 and contant=1 group by 1; '+
     'select id id3, max(date)      ddd3 into #d3 from населениеДвижение where date_fiks=''1899-12-30'' group by 1; '+
     'select id1 idX, ddd1 dddX into #d4 from #d1 d1  '+
     '  left join #d2 d2 on d1.id1=d2.id2  '+
     '  left join #d3 d3 on d1.id1=d3.id3  '+
     'where d1.ddd1=d2.ddd2 and d2.ddd2=d3.ddd3;  '+
     'delete from населениеДвижение  '+
     ' where cast(id as SQL_CHAR)+CAST(date as SQL_CHAR) in(select cast(idX as SQL_CHAR)+CAST(dddX as SQL_CHAR) from #d4)  '+
     '       and date_fiks=''1899-12-30''; '+
     'update население set date_srok=d.dddX, datev=null, propis=true, present=true, candelete=false '+
     '  from #d4 d where candelete=true and date_fiks=''1899-12-30'' and id=d.idX; ';
    dbExecuteSQL(strSQL);
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта 25: '+dbLastError() );
    end;
  end;
  if (Result=0) and arrCheck[26] then begin
    dbExecuteSQL('update АктыРождений set on_chern=null;'+
                 'update АктыРождений set on_chern=1 where sved=3;');  // заявление матери
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта 26: '+dbLastError() );
    end;
    lUpdate := false;
    ds := dbOpenSQL('SELECT Count(*) FROM SprWriteDecl','');
    if ds.Fields.Fields[0].AsInteger=0 then begin
      lUpdate := true;
    end;
    dbClose(ds);
    if lUpdate then begin
      dbExecuteSQL('insert into SprWriteDecl (name, nomer) values (''заявление матери'', 1);');
      dbExecuteSQL('insert into SprWriteDecl (name, nomer) values (''иностранный гражданин'', 2);');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (SprWriteDecl): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
  if (Result=0) and arrCheck[27] then begin
    dbExecuteSQL('update SprZah set book=1 where book is null;');
    dbExecuteSQL('update AktZ   set svid_dok=1 where svid_dok is null;');   // свидетельство о смерти
    dbExecuteSQL('update AktZ   set svid_zags=getFieldXML(''SVID_ZAGS'',add_fields) WHERE svid_zags is null or svid_zags='''' ');
    lUpdate := false;
    ds := dbOpenSQL('SELECT Count(*) FROM SprRazmer','');
    if ds.Fields.Fields[0].AsInteger=0 then begin
      lUpdate := true;
    end;
    dbClose(ds);
    if lUpdate then begin
      dbExecuteSQL('insert into SprRazmer (name, mog_l, mog_w) values (''одиночное'', 2.3, 1.4);');
      dbExecuteSQL('insert into SprRazmer (name, mog_l, mog_w) values (''семейное'', 2.3, 2);');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (SprRazmer): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
  if (Result=0) and arrCheck[2] then begin
    dbExecuteSQL('update AktZ set uslug=Trim(getFieldXML(''USLUG'',add_fields));'); // WHERE uslug is null or uslug='''' ');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта: '+dbLastError() );
      Result := 1;
    end;
  end;
  if (Result=0) and arrCheck[0] then begin
    ds:=dbOpenSQL('select count(*) from BaseProp where typeobj=39','');  // _TypeObj_BookKlad=39;
    if ds.Fields.Fields[0].AsInteger=0 
      then lUpdate:=true else lUpdate:=false;
    dbClose(ds);
    if lUpdate then begin
      dbExecuteSQL('insert into BaseProp (typeobj, id, dates, pokaz) select 39, id, book_date, cast(book as SQL_CHAR) from SprZah where book is not null and book_date is not null;');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (BaseProp): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;

  if (Result=0) and arrCheck[28] then begin
     dbExecuteSQL('UPDATE базаДомов SET plosh_uch=nvalue '+
                  '  FROM базаДомов d '+
                  '  INNER JOIN БазаСвойствОбъектов b ON b.date_fiks=d.date_fiks and b.typeobj=1 and b.Pokaz=''PLOSH_UCH'' and b.id=d.id  ');
  end;
  if (Result=0) and arrCheck[29] then begin
    dbExecuteSQL('update ЛицевыеСчета set mns_lpx=false where date_fiks='+QStr(datecursostS)+';'); 
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта: '+dbLastError() );
      Result := 1;
    end;
  end;
  if (Result=0) and ((TypeBase='POST') or (TypeBase='ZAGS')) then begin
    dbExecuteSQL('update СпрМестРаботы set is_korr=true');
  end;
  if (Result=0) and arrCheck[1] then begin
     // контроль почты СМДО
     dbExecuteSQL('update smdopost set ack_type=2 where id in (select id from smdopost where msg_type>0 and subj_type=1 and ack_type=1 and msg_id in (select ack_msg_id from smdopost where msg_type=0 and ack_type=2))');
     dbExecuteSQL('delete from smdopost where id is null or id<1;');
  end;
  if (Result=0) and arrCheck[3] then begin
     dbExecuteSQL('update docmain set tel_line=false where tel_line is null');
  end;
  if (Result=0) and arrCheck[4] then begin
    Result:=UpdateGosClassObr;
  end;
  if (Result=0) and arrCheck[5] then begin
    dbExecuteSQL('UPDATE SprIzbUch SET active=false WHERE active is null');
  end;
  if (Result=0) and arrCheck[6] then begin
     dbExecuteSQL('UPDATE SprNames SET zags_selo=false where substring(soato,5,6)=''000000'' or substring(soato,1,1)=''5'' or substring(soato,5,1) in (''5'',''3'',''0'',''4'');'+
                  'UPDATE SprNames SET zags_selo=true where zags_selo is null;');
  end;
  if (Result=0) and arrCheck[7] then begin
    dbExecuteSQL('UPDATE AktOpek SET is_control=true WHERE is_control is null');
    dbExecuteSQL('UPDATE AktOpek SET is_mintrud=false WHERE is_mintrud is null');
    dbExecuteSQL('UPDATE AktOpek SET lonely=false WHERE lonely is null');
  end;
  if (Result=0) and (TypeBase='ZAGS') and arrCheck[19] then begin
    dbExecuteSQL('UPDATE DeclareTermMarriage SET type_rast=1');
  end;
  if (TypeBase='OPEKA') then begin
    Result:=UpdateChildPrich;
  end;
  if (Result=0) and arrCheck[30] then begin
    dbExecuteSQL('UPDATE AktOpek SET DOC_OPEKA_OTM=4 WHERE DOC_OPEKA_OTM is null');
  end;
  if (Result=0) and arrCheck[31] then begin
    dbExecuteSQL('UPDATE AktOpek set type_sn=CASE WHEN date_otm is not null THEN 1 WHEN date_osv is not null THEN 2 WHEN date_otst is not null THEN 3 ELSE 1 END WHERE type_sn is null or TYPE_SN=0;'+
    'UPDATE AktOpek set date_otm=date_osv WHERE date_osv is not null and type_sn=2;'+
    'UPDATE AktOpek set nomer_otm=nomer_osv WHERE date_osv is not null and type_sn=2;'+
    'UPDATE AktOpek set date_otm=date_otst WHERE date_otst is not null and type_sn=3;'+
    'UPDATE AktOpek set nomer_otm=nomer_otst WHERE date_otst is not null and type_sn=3;');
  end;
  if (Result=0) and (TypeBase='ZAGS') and arrCheck[32] then begin
    try
      CopyDecl21;
    except
    end;
  end;
  if (Result=0) and arrCheck[11] then begin
    dbExecuteSQL('UPDATE СпрМестРаботы set is_gosud=false where is_gosud is null');
    dbExecuteSQL('UPDATE СпрМестРаботы set IS_GILFOND=false where IS_GILFOND is null');
    dbExecuteSQL('UPDATE СпрМестРаботы set IS_CONTROL=false where IS_CONTROL is null');
    dbExecuteSQL('UPDATE СпрМестРаботы set IS_KORR=false where IS_KORR is null');
  end;
  if (Result=0) and arrCheck[12] then begin
    Result:=CheckDateSverki;
    dbExecuteSQL('UPDATE БазаДомов SET kv=Right(''       ''+Trim(kv),7) WHERE kv is not null;'+
                 'UPDATE БазаДомов SET dom=Right(''       ''+Trim(dom),7) WHERE dom is not null;'+
                 'UPDATE БазаДомов SET korp=Right(''       ''+Trim(korp),7) WHERE korp is not null;');
  end;
  //======= проверка SprZah на корректность значения поля ATE ====================
  if (Result=0) and check_SprZah then begin
//          ShowMessage( '1111111111111111');
    ds:=dbOpenSQL('select count(*) as kolvo from SprZah where (ate=0) or ((ate>0) and ate not in (select ate_id from sysspr.ate))','');
    if ds<>nil then begin
      n:=ds.Fld('KOLVO').AsInteger;
//          ShowMessage( '22222222         '+inttostr(n));
      dbClose(ds);
      if n>0 then begin  // необходима проверка справочника SprZAH
        strSQL:=
            'try '+
            '  drop table #update_zah; '+
            'catch all '+
            'end; '+
            'select id, '+
            '  iif(ate_punkt=0 or ate_punkt is null,iif(ate_ss=0 or ate_ss is null, iif(ate_rn=0 or ate_rn is null, ate_obl, ate_rn),ate_ss),ate_punkt) ate, '+
            '  ate_obl,ate_rn,ate_ss,ate_punkt, name, name_path '+
            '  into #update_zah '+
            '  from sysspr.gisun_sprzah '+
            '  where ate_punkt=0 or ate_punkt is null  '+
            '  order by id; '+
            'update sprZah set sprZah.ate=u.ate from #update_zah u where sprZah.id_gis=cast(u.id as SQL_INTEGER);';
        dbExecuteSQL(strSQL);
        if dbLastError()<>'' then begin
          ShowMessage( 'Ошибка выполнения скрипта SprZAH: '+dbLastError() );
        end;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------
function BeforeUpdate : Integer;
var
  ds,ds1 : TDataSet;
  nVer,i : Integer;
  lEof : Boolean;
begin
  check_SprZah:=false;
  lCheckOchered1:=false;
  TypeBase:=GlobalTask.GetWorkParam('TYPEBASE');
  if TypeBase='' then TypeBase:='SELSOVET';
  ds := dbOpenSQL('SELECT * FROM '+SysQuery('system.dictionary'),'');
  nVer := StrToInt(ds.Fld('Version_Major').AsString+ds.Fld('Version_Minor').AsString);
  nVerBase:=nVer;
  for i:=0 to 50 do arrCheck[i]:=false;
  if (TypeBase='ZAH') then begin 
    if (nVer<28) then arrCheck[27]:=true;
    if (nVer<29) then arrCheck[0]:=true;  // список книг
    if (nVer<44) then arrCheck[2]:=true;  // реквизит uslug
    check_SprZah:=true;
  end else if (TypeBase='OPEKA') then begin
    if (nVer<49) then arrCheck[7]:=true;  // реквизит is_control
    if (nVer<52) then arrCheck[30]:=true;  // DOC_OPEKA_OTM is null
    if (nVer<53) then arrCheck[31]:=true;  // TYPE_SN  DATEDOK_UST
  end else if (TypeBase='POST') then begin
    arrCheck[1]:=true;
    if (nVer<22) then arrCheck[3]:=true;  // реквизит tel_line DocMain
    if (nVer<24) then arrCheck[4]:=true;  // спр. госуд. тематик обращений гр.
    if (nVer<26) then arrCheck[8]:=true;  // УдалениеОбъекта
//    DeleteFiles(sPath+'\DocArxiv\EML\*.*');

  end else begin
    if nVer < 147 then arrCheck[17]:=true;
    if nVer < 149 then arrCheck[18]:=true;
    //  arrCheck[19]
    if nVer < 180 then arrCheck[20]:=true;
    if nVer < 182 then arrCheck[21]:=true;
    if nVer < 183 then arrCheck[22]:=true;
    if (TypeBase='ZAGS') then begin
      if (nVer<192) then arrCheck[26]:=true;
      if (nVer<209) then arrCheck[6]:=true;  // SprNames поле zags_selo
      if (nVer<221) then arrCheck[19]:=true;  // 
      if (nVer<232) then 
        arrCheck[32]:=CheckZags_Before;  //  DeclareChName->DeclareIzm
      if (nVer<240) then arrCheck[9]:=true;  // UpdatingObj  SM_B_RESP  B_RESP
    end else begin 
      if (nVer<186) then arrCheck[23]:=true;
      if (nVer<192) then arrCheck[24]:=true;
      if (TypeBase='SELSOVET') then begin
        if (nVer<200) then arrCheck[25]:=true;
        if (nVer<260) then arrCheck[27]:=true;
        if (nVer<262) then arrCheck[28]:=true;
        if (nVer<268) then arrCheck[0]:=true;   // список книг
        if (nVer<278) then arrCheck[2]:=true;   // реквизит uslug
        if (nVer<280) then arrCheck[3]:=true;   // реквизит tel_line DocMain
        if (nVer<280) then arrCheck[29]:=true;  // MNS_LPX очистить
        arrCheck[1]:=true;
        if (nVer<283) then arrCheck[5]:=true;   
        if (nVer<284) then arrCheck[7]:=true;   // is_control
        if (nVer<286) then arrCheck[4]:=true;   // спр. госуд. тематик обращений гр.
        if (nVer<287) then arrCheck[30]:=true;  // DOC_OPEKA_OTM is null
        if (nVer<288) then arrCheck[31]:=true;  // TYPE_SN  DATEDOK_UST
        if (nVer<289) then arrCheck[26]:=true;
        if (nVer<300) then arrCheck[8]:=true;  // УдалениеОбъекта 
        if (nVer<300) then arrCheck[9]:=true;  // UpdatingObj  SM_B_RESP  B_RESP
        if (nVer<311) then arrCheck[11]:=true; // 
        if (nVer<320) then arrCheck[12]:=true; // исправление ошибки даты сверки таблицы VUS и изменение размера полей дом,корп,кв
      end else if (TypeBase='GKH') then begin
        if (nVer<200) then arrCheck[25]:=true;
        if (nVer<262) then arrCheck[28]:=true;
        if (nVer<280) then arrCheck[3]:=true;  // реквизит tel_line DocMain
        if (nVer<286) then arrCheck[4]:=true;   // спр. госуд. тематик обращений гр.
      end else if (TypeBase='OCHERED') then begin
        if (nVer<203) then arrCheck[3]:=true;  // реквизит tel_line DocMain
        if (nVer<204) then arrCheck[4]:=true;   // спр. госуд. тематик обращений гр.
      end;
    end;
  end;

//  if nVer < 177 then begin
//    ShowMessage(getPathConnect());
//  end;


  dbClose(ds);

  // необходимость реорганизации Население в VUS
//  ds := dbOpenSQL('select * from system.columns where name='+QStr('VB_NOMER')+' and parent='+QStr('Население'),'');
//  if (ds.RecordCount>0) then begin
//    CheckVUS_Before;
//  end;
//  dbClose(ds);
  CheckOchered_Before;
  Result := 0;
  if (nVer<320) and (TypeBase='SELSOVET') then begin
    dbExecuteSQL('EXECUTE PROCEDURE sp_ZapTable('+QStr('BigHouse')+')');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Удаление BigHouse): '+dbLastError() );
//      Result := 1;
    end;
  end;
  if (nVer<24) and (TypeBase='ZAH') then begin
    dbExecuteSQL('update AktZ set pole_grn=0 where pole_grn>=3000;');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (POLE_GRN): '+dbLastError() );
    end;
  end;
end;

//--------------------------------------------------------------------
procedure ExitScript;
begin
end;

begin
end.