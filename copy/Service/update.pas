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

function CheckOchered_Before:Integer;
var
  n:Integer;
  ds:TDataSet;
begin
  Result:=0;
  if (IdProg()<>'ZAGS') then begin
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
    if ds<>nil then begin
      if ds.Fld('REG_OSNOV2')=nil 
        then sAdd:=',0,'+QStr('')
        else sAdd:=',REG_OSNOV2,REG_OSNOV_TEXT2';
      dbClose(ds);
    end;
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

//-----------------------------------------------------------------
function CreateFunc_GetVozrast:Integer;
var
  strSQL:String;
begin
strSQL:='CREATE FUNCTION GetVozrast(DATE_C DATE,DATE_R DATE) RETURNS INTEGER '+chr(13)+
        'DESCRIPTION '+QStr('Вернуть возраст между датой рождения DATE_R и датой DATE_C')+chr(13)+
        'BEGIN '+chr(13)+
        'RETURN TRUNCATE(TIMESTAMPDIFF(SQL_TSI_MONTH,DATE_R,DATE_C)/12,0)-IIF(month(DATE_R)=month(DATE_C), IIF(dayofmonth(DATE_R)-dayofmonth(DATE_C)>0,1,0),0);'+chr(13)+
        'END;';
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

//---------------------------------------------------------
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
//---------------------------------------
function AfterUpdate : Integer;
var
  strSQL,s,ss : String;
  ds,ds1 : TDataSet;
  lUpdate : Boolean;
  n:Integer;
  d1,d2:TDateTime;
begin
//   showmessage('AfterUpdate:   '+dbConnectPath()+'    '+dbGetCurrentConnect());
{
  dbExecuteSQL('EXECUTE PROCEDURE sp_DropLink('+QStr('NewBase')+', TRUE);');
  strSQL := 'EXECUTE PROCEDURE sp_CreateLink('+QStr('NewBase')+','+
             QStr('..\NewData\ss.add')+', TRUE, FALSE, TRUE, '+
             QStr('')+', '+QStr('')+');';
  dbExecuteSQL(strSQL);
}

  ChangeMessage('Контроль базы ...');
  if lCheckPerevod then begin
    dbExecuteSQL('DELETE FROM SprPerevod');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (SprPerevod): '+dbLastError() );
      Result := 1;
    end;
    if Result=0 then begin
      dbExecuteSQL('INSERT INTO SprPerevod (tip,r_name,b_name) SELECT tip,r_name,b_name FROM NewBase.SprPerevod ');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (SprPerevod): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
  if (Result=0) and lCheckIsporSvid then begin
    dbExecuteSQL('update IsporSvid set sost=2 where sost is null');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (IsporSvid): '+dbLastError() );
      Result := 1;
    end;
  end;
  if (Result=0) and lCheckLicPresent then begin
    dbExecuteSQL('update ЛицевыеСчета set present=true where present is null');
    if dbLastError()='' then begin
      dbExecuteSQL('update ЛицевыеСчета set present=false where candelete=true');
    end;
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (IsporSvid): '+dbLastError() );
      Result := 1;
    end;
  end;
  if (Result=0) and arrCheck[8] then begin
    dbExecuteSQL('UPDATE Население SET kateg=0 WHERE kateg is null');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Население): '+dbLastError() );
      Result := 1;
    end;
    if Result=0 then begin
      dbExecuteSQL('UPDATE Население SET lic_id=0 WHERE lic_id is null');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (Население): '+dbLastError() );
        Result := 1;
      end;
    end;
    if Result=0 then begin
      dbExecuteSQL('UPDATE Население SET adres_id=0 WHERE adres_id is null');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (Население): '+dbLastError() );
        Result := 1;
      end;
    end;
    if Result=0 then begin
      strSQL:='select n.ROWID, n.*, s.VALUE as ADRES_PROP from Население n' +
              ' left join базастрок s on n.id=s.id and n.date_fiks=s.date_fiks and pokaz=''ADRES_PROP'' '+
              ' where n.date_fiks=''1899-12-30'' ';
      ds := dbOpenSQL(strSQL,'');
      while not ds.Eof and (Result=0) do begin
        if ds.Fld('LIC_ID').AsInteger>0 then begin
          if ds.Fld('ADRES_PROP').AsString='' then begin  // чужой адрес регистрации не введен
            n:=0;
          end else begin       // человек зарегистрирован в другом месте,но нах-ся на лицевом счете
            n:=1;
          end;
        end else begin  // человек без лицевого счета не может быть зарегистрированным
          if ds.Fld('ADRES_ID').AsInteger=0 then begin
            n:=3;
          end else begin
            n:=2;
          end;
        end;
        if ds.Fld('KATEG').AsInteger<>n then begin
          dbExecuteSQL('UPDATE Население SET kateg='+IntToStr(n)+' WHERE ROWID='+QStr(ds.Fld('ROWID').AsString));
          if dbLastError()<>'' then begin
            ShowMessage( 'Ошибка выполнения скрипта (Население): '+dbLastError() );
            Result := 1;
          end;
        end;
        ds.Next;
      end;
      dbClose(ds);
    end;
  end;
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
  if (Result=0) and arrCheck[9] then begin  // реогранизация спр-ка организаций
    Result:=CheckSprWork;
  end;
  if (Result=0) and arrCheck[10] then begin  // реогранизация спр-ка организаций
    dbExecuteSQL('EXECUTE PROCEDURE sp_ZapTable('+QStr('SprDocFolder')+');');
    if dbLastError()='' then begin
      strSQL:='insert into SprDocFolder (n_order, name, short, is_user) values(1, ''Общая'', ''Общая'', 2);'+
              'insert into SprDocFolder (n_order, name, short, is_user) values(2, ''Срочно ответить'', ''Срочно'', 1);'+
              'insert into SprDocFolder (n_order, name, short, is_user) values(3, ''У исполнителя'', ''У исполнителя'', 1);'+
              'insert into SprDocFolder (n_order, name, short, is_user) values(4, ''Ожидается ответ'', ''Ожидается ответ'', 1);'+
              'insert into SprDocFolder (n_order, name, short, is_user) values(5, ''Неотправленные документы'', ''Не отправлено'', 1);'+
              'insert into SprDocFolder (n_order, name, short, is_user) values(6, ''На контроле'', ''На контроле'', 1);'+
              'insert into SprDocFolder (n_order, name, short, is_user) values(7, ''У руководства'', ''У руководства'', 1);'+
              'insert into SprDocFolder (n_order, name, short, is_user) values(8, ''В деле'', ''В деле'', 1);';
      dbExecuteSQL(strSQL);
    end;
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (справочник SprDocFolder): '+dbLastError() );
      Result := 1;
    end;
    if Result=0 then begin
      lUpdate := false;
      ds := dbOpenSQL('SELECT Count(*) FROM SprDocGroup','');
      if ds.Fields.Fields[0].AsInteger=0 then begin
        lUpdate := true;
      end;
      dbClose(ds);
      if lUpdate then begin
        dbExecuteSQL('INSERT INTO SprDocGroup SELECT * FROM NewBase.SprDocGroup ');
        if dbLastError()<>'' then begin
          ShowMessage( 'Ошибка выполнения скрипта (SprDocGroup): '+dbLastError() );
          Result := 1;
        end;
      end;
    end;
  end;
  if (Result=0) and arrCheck[11] then begin  // ликвидация справочника собственников SprOwners
    Result:=CheckSprOwners;
    if Result=1
      then ShowMessage( 'Ошибка выполнения скрипта (CheckSprOwners): '+dbLastError() );
  end;
  if (Result=0) and arrCheck[12] then begin
    ds := dbOpenSQL('select * from '+SysQuery('system.columns')+' where name='+QStr('PRIZ')+' and parent='+QStr('Население'),'');
    if ds.RecordCount>0 then begin
      dbExecuteSQL('UPDATE Население SET priz=false WHERE priz is null');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (Население): '+dbLastError() );
        Result := 1;
      end;
    end;
    dbClose(ds);
    if Result=0 then begin
      dbExecuteSQL('UPDATE БазаДомов SET not_dom=false WHERE not_dom is null');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (БазаДомов): '+dbLastError() );
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
  if (Result=0) and arrCheck[13] then begin
    dbExecuteSQL('UPDATE SprDocFolder SET IS_USER=1 WHERE IS_USER<>2');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта: '+dbLastError() );
      Result := 1;
    end;
    if Result=0 then begin
      dbExecuteSQL('UPDATE DocMain SET NOT_EXP=false WHERE NOT_EXP is null');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта: '+dbLastError() );
        Result := 1;
      end;
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
  if (Result=0) then begin
    lUpdate := false;
    ds := dbOpenSQL('SELECT Count(*) FROM SprDocAdmProcU','');
    if ds.Fields.Fields[0].AsInteger=0 then begin
      lUpdate := true;
    end;
    dbClose(ds);
    if lUpdate then begin
      dbExecuteSQL('INSERT INTO SprDocAdmProcU SELECT * FROM NewBase.SprDocAdmProcU');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (SprDocAdmProcU): '+dbLastError() );
        Result := 1;
      end;
    end else begin
      // добавим процедуру 8.1.1.
      ds := dbOpenSQL('SELECT Count(*) FROM SprDocAdmProcU WHERE id=10825','');
      if ds.Fields.Fields[0].AsInteger=0 then begin
        dbExecuteSQL('INSERT INTO SprDocAdmProcU SELECT * FROM NewBase.SprDocAdmProcU WHERE id=10825');
      end;
      dbClose(ds);
    end;
  end;
//---------перекодировка смерть последовала --------------------------------
  if (Result=0) and arrCheck[14] then begin
    strSQL:=
      'update АктыСмертей set SMERT_POSL=21 where SMERT_POSL=1; '+
      'update АктыСмертей set SMERT_POSL=4  where SMERT_POSL=2; '+
      'update АктыСмертей set SMERT_POSL=5  where SMERT_POSL=3;'
    dbExecuteSQL(strSQL);
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Перекодировка смерть последовала): '+dbLastError() );
      Result := 1;
    end;
    if Result=0 then begin
      strSQL:='update DocMain set DOC_KIND=null where DOC_KIND=999; '+
              'update DocFile set STORE_KIND=1; '+
              'update DocFile set DIR_YEAR='+QStr('20')+'+trim(DIR_YEAR) where length(trim(DIR_YEAR))=2;';
      dbExecuteSQL(strSQL);
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (Перекодировка DocMain,DocFile): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
//----------------------------------------
  if (Result=0) and arrCheck[15] then begin
    dbExecuteSQL('UPDATE ЛицевыеСчета SET kniga_nomer=trim(kniga_nomer),kniga_str=trim(kniga_str)');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (ЛицевыеСчета): '+dbLastError() );
      Result := 1;
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
//----------------------------------------
  if (Result=0) and arrCheck[17] then begin
    Result:=CheckSprAdmProc('SprDocAdmProc', 146, '700;701;702;703;704;705;706;707;708;709;710;711;712;713;714;715;716;717;718;719;720;721;722;723;724;725;726;727;728;729;','');
    if Result=0 then begin
      dbExecuteSQL('_CheckAdmProc.sql');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (SprDocAdmProc): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
  if (Result=0) and arrCheck[18] then begin
    dbExecuteSQL('UPDATE Паспорт SET typedok=4 WHERE typedok is null');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Паспорт): '+dbLastError() );
      Result := 1;
    end;
    if (Result=0) then begin
      dbExecuteSQL('update БазаДомов set ms_za_pred=false where ms_za_pred is null');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (БазаДомов): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
  if (Result=0) then begin
    Result:=CheckSprAdmProc('SprDocAdmProc', 170, '370;389;519;520;5;26;42;48;51;52;131;227;585;593;65;66;67;69;369;730;731;732;733;734;735;736;737;738;','');
  end;
  if (Result=0) then begin
    Result:=CheckSprAdmProc('SprDocAdmProcU', 170, '10689;10667;10691;10705;10826;10827;10828;10829;10135;10136;10052;10070;','10137;10138;10139;10140;10141;');
  end;

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
  //--------------------
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
  //--------------------
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
  if (Result=0) and arrCheck[1] then begin
     // контроль почты СМДО
     dbExecuteSQL('update smdopost set ack_type=2 where id in (select id from smdopost where msg_type>0 and subj_type=1 and ack_type=1 and msg_id in (select ack_msg_id from smdopost where msg_type=0 and ack_type=2))');
     dbExecuteSQL('delete from smdopost where id is null or id<1;');
  end;
  if (Result=0) and arrCheck[3] then begin
     dbExecuteSQL('update docmain set tel_line=false where tel_line is null');
  end;
  if (Result=0) and arrCheck[5] then begin
    dbExecuteSQL('UPDATE SprIzbUch SET active=false WHERE active is null');
  end;

//  if (Result=0) and arrCheck[4] then begin
//    Result:=UpdateGosClassObr;
//  end;
  if (TypeBase='OPEKA') then begin
    Result:=UpdateChildPrich;
  end;
end;

function BeforeUpdate : Integer;
var
  ds : TDataSet;
  nVer,i : Integer;
  lEof : Boolean;
begin
  lCheckOchered1:=false;
  ds := dbOpenSQL('SELECT * FROM '+SysQuery('system.dictionary'),'');
  nVer := StrToInt(ds.Fld('Version_Major').AsString+ds.Fld('Version_Minor').AsString);
  nVerBase:=nVer;
//  showmessage('BeforeUpdate:   '+dbConnectPath()+'    '+dbGetCurrentConnect()+' ->'+IntToStr(nVer));
  for i:=0 to 50 do  arrCheck[i]:=false;
  lCheckPerevod:=false;
  lCheckIsporSvid:=false;
  lCheckLicPresent:=false;

  if (TypeBase='ZAH') then begin 
    if (nVer<28) then arrCheck[27]:=true;
    if (nVer<29) then arrCheck[0]:=true;  // список книг
    if (nVer<44) then arrCheck[2]:=true;  // реквизит uslug
  end else if (TypeBase='OPEKA') then begin

  end else if (TypeBase='POST') then begin
    arrCheck[1]:=true;
    if (nVer<220) then arrCheck[3]:=true;  // реквизит tel_line DocMain
    if (nVer<24) then arrCheck[4]:=true;  // спр. госуд. тематик обращений гр.
  end else begin
    if nVer < 39 then lCheckPerevod:=true;
    if nVer < 43 then lCheckIsporSvid:=true;
    if nVer < 46 then lCheckLicPresent:=true;
    if nVer < 102 then arrCheck[8]:=true;
    if nVer < 104 then arrCheck[9]:=true;
    if nVer < 105 then arrCheck[10]:=true;
    if nVer < 106 then arrCheck[11]:=true;
    if nVer < 109 then arrCheck[12]:=true;
    if nVer < 113 then arrCheck[13]:=true;
    if nVer < 117 then arrCheck[14]:=true;
    if nVer < 119 then arrCheck[15]:=true;
    if nVer < 125 then arrCheck[16]:=true;
    if nVer < 146 then arrCheck[17]:=true;
    if nVer < 149 then arrCheck[18]:=true;
    // arrCheck[19]:=true;
    if nVer < 180 then arrCheck[20]:=true;
    if nVer < 182 then arrCheck[21]:=true;
//    if nVer < 183 then arrCheck[22]:=true;
    if (nVer<186) and (TypeBase<>'ZAGS')    then arrCheck[23]:=true;
    if (nVer<192) and (TypeBase<>'ZAGS')    then arrCheck[24]:=true;
    if (nVer<192) and (TypeBase='ZAGS')     then arrCheck[26]:=true;
// ???   if nVer<182 then arrCheck[4]:=true;   // update dateizm в з/а
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
    end else if (TypeBase='GKH') then begin
      if (nVer<200) then arrCheck[25]:=true;
      if (nVer<262) then arrCheck[28]:=true;
      if (nVer<280) then arrCheck[3]:=true;  // реквизит tel_line DocMain
      if (nVer<282) then arrCheck[4]:=true;   // спр. госуд. тематик обращений гр.
    end else if (TypeBase='OCHERED') then begin
      if (nVer<203) then arrCheck[3]:=true;  // реквизит tel_line DocMain
      if (nVer<203) then arrCheck[4]:=true;   // спр. госуд. тематик обращений гр.
    end;
  end;

//  if nVer < 177 then begin 
//    DeleteFile(getPathConnect()+'AktTermMarriage.adi');
//    writedebug(getPathConnect()+'AktTermMarriage.adi');
//  end;

  //---- необходимость реорганизации Население в VUS ------
//  ds := dbOpenSQL('select * from system.columns where name='+QStr('VB_NOMER')+' and parent='+QStr('Население'),'');
//  if (ds.RecordCount>0) then begin
//    CheckVUS_Before;
//  end;
//  dbClose(ds);
  //-------------------------------------------------------
  CheckOchered_Before;

  Result := 0;
  if (nVer<241) and (TypeBase='SELSOVET') then begin
    dbExecuteSQL('EXECUTE PROCEDURE sp_ZapTable('+QStr('BigHouse')+')');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Удаление BigHouse): '+dbLastError() );
//      Result := 1;
    end;
  end;
end;

