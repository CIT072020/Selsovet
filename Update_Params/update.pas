
program Main;
var
  idConn : String;
  nVersion : Integer;
  lCheckLicPresent, lCheckPrichSm, lCheckPerevod, lCheckIsporSvid : Boolean;
  arrCheck : array[0..30] of Boolean;
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

//--------------------------------------------------------------------
procedure InitScript;
begin
  idConn:=dbRegisterConnect('AdsConnection','CHARTYPE=ANSI;TABLETYPE=ADT');
  nVersion := 1;
end;

function CheckVUS_Before:Integer;
var
  s,ss:String;
  ds,ds1:TDataSet;
begin
  s:='ID,PRIZ,DATESV_VK,DATESV_LIC,DATESV_F2,NOMER_VUS,GRUPPA,ZVAN,GODEN,TYPE_KOMANDA,KOMANDA,JAVKA,'+
     'MARSHRUT,GRAGSPEC,KOMISS_DATE,KOMISS,KOMISS_GODEN,KOMISS_STAT,KOMISS_GRAFA,KOMISS_PRIKAZ,'+
     'KOMISS_DATEPERE,DATESOST,VB_SERIA,VB_NOMER,VB_DATE,PRIB_DATE,PRIB_DATEVK,UBIT_DATE,'+
     'UBIT_DATEVK,SPEC,SPEC_TEXT,VUS_SOSTAV,VUS_PREDN,VUS_MARKA_TS';
  ds := dbOpenSQL('select TOP 1 * from Население','');
  sFieldVUS:=dbFieldNames(ds,s);
  dbClose(ds);
  dbCloseCachedTables;
  s:='SELECT n.'+sFieldVUS;
  s:=s+',b1.VALUE as SOSTAV_SEM ,b2.VALUE as PRIB_TEXT ,b3.VALUE as UBIT_TEXT,b4.VALUE as ADRES_GIT';
  s:=s+' from Население n';
  s:=s+' left join БазаСтрок b1 on n.id=b1.id and b1.pokaz=''SOSTAV_SEM'' and n.date_fiks=b1.date_fiks';	 
  s:=s+' left join БазаСтрок b2 on n.id=b2.id and b2.pokaz=''PRIB_TEXT'' and n.date_fiks=b2.date_fiks';	 
  s:=s+' left join БазаСтрок b3 on n.id=b3.id and b3.pokaz=''UBIT_TEXT'' and n.date_fiks=b3.date_fiks';	 
  s:=s+' left join БазаСтрок b4 on n.id=b4.id and b4.pokaz=''ADRES_GIT'' and n.date_fiks=b4.date_fiks';	 
  s:=s+' where n.vus=true and n.date_fiks='+QStr(datecursostS)
  dsVUS:=dbOpenSQL2MemTable(s,'');
//  dsVUS:=dbOpenSQL('SELECT '+sFieldVUS+' INTO #TmpVUS FROM Население WHERE vus=true and date_fiks='+QStr(datecursostS),'');
  if dbLastError()='' then begin
    sFieldVUS:=sFieldVUS+',SOSTAV_SEM,PRIB_TEXT,UBIT_TEXT,ADRES_GIT';
    Result:=0;
  end else begin
    PutError(dbLastError());
    sFieldVUS:='';
    Result:=1;
  end;
end;

function CheckVUS_After:Integer;
var
  ds,dsN:TDataSet;
begin
  ds := dbOpenSQL('select * from system.tables where name='+QStr('VUS'),'');
  if (ds.RecordCount>0) and (sFieldVUS<>'') then begin
    dsVUS.First;
    dbExecuteSQL('delete from VUS'); 
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Население/ВУС): '+dbLastError() );
      Result := 1;
    end else begin
      dsN:=dbOpen('VUS','');
      while not dsVUS.Eof do begin
        dbAppendRecord(dsVUS,dsN,true);
        dsVUS.Next;
      end;
      dbClose(dsN);
      dbClose(dsVUS);
      dbExecuteSQL('UPDATE VUS SET priz=false WHERE priz is null');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (Население/ВУС): '+dbLastError() );
        Result := 1;
      end else begin
        dbExecuteSQL('delete from БазаСтрок where pokaz=''SOSTAV_SEM'' or pokaz=''PRIB_TEXT'' or pokaz=''UBIT_TEXT'' '); 
        dbExecuteSQL('delete from БазаСтрок where pokaz=''ADRES_GIT'' or pokaz=''AGIT_OBL'' or pokaz=''AGIT_RN''  or pokaz=''AGIT_PN''  or pokaz=''AGIT_UL''  or pokaz=''AGIT_DOM'' '); 
        dbExecuteSQL('delete from БазаСтрок where pokaz=''AGIT_KORP'' or pokaz=''AGIT_KV''  or pokaz=''AGIT_TEL'' '); 
        if dbLastError()<>'' then begin
          ShowMessage( 'Ошибка выполнения скрипта (Население/ВУС): '+dbLastError() );
          Result := 1;
        end else begin
          Result := 0;
        end;
      end;
    end;
  end;
  dbClose(ds);
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

//-----------------------------------------
function AfterUpdate : Integer;
var
  strSQL,s,ss : String;
  ds : TDataSet;
  lUpdate : Boolean;
  n:Integer;
begin
{
  dbExecuteSQL('EXECUTE PROCEDURE sp_DropLink('+QStr('NewBase')+', TRUE);');
  strSQL := 'EXECUTE PROCEDURE sp_CreateLink('+QStr('NewBase')+','+
             QStr('..\NewData\Ss.add')+', TRUE, FALSE, TRUE, '+
             QStr('')+', '+QStr('')+');';
  dbExecuteSQL(strSQL);
}
  if nVersion = 2 then begin
    ChangeMessage('Реорганизация базы ...');
    strSQL:='update БазаСвойствОбъектов set value=replace(value, '','' , ''.'' )'+
            '  where position('','' in [value])>0 and typesave=6;'+
            'update БазаСвойствОбъектов set nvalue=CAST(value AS SQL_NUMERIC)'+
            '  where typesave=6 or typesave=3;'+
            'update население set adres_id=l.adres_id ' +
            '  from лицевыесчета l  '+
            '  where l.date_fiks=население.date_fiks and население.lic_id=l.id;';
    dbExecuteSQL(strSQL);
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта: '+dbLastError() );
      Result := 1;
    end else begin
      Result := 0;
    end;
    if Result=0 then begin
      dbExecuteSQL('INSERT INTO SprKomiss (name) VALUES (''Центральная военно-врачебная комиссия ВС РБ'') ');
      dbExecuteSQL('INSERT INTO SprOsobOtm (name) VALUES (''бронь'') ');
      dbExecuteSQL('INSERT INTO SprOsobOtm (name) VALUES (''снят по возрасту'') ');
    end;
  end;
  if lCheckPrichSm then begin
    lUpdate := false;
    ds := dbOpenSQL('SELECT Count(*) FROM SprPrichSm','');
    if ds.Fields.Fields[0].AsInteger < 10 then begin
      lUpdate := true;
    end;
    dbClose(ds);
    if lUpdate then begin
      dbExecuteSQL('INSERT INTO SprPrichSm SELECT * FROM NewBase.SprPrichSm ');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (SprPrichSm): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
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
  if (Result=0) and arrCheck[0] then begin
    strSQL:=
      'update АктыРождений set on_obraz=4 where on_obraz=2;'+
      'update АктыРождений set on_obraz=2 where on_obraz=3;'+
      'update АктыРождений set ona_obraz=4 where ona_obraz=2;'+
      'update АктыРождений set ona_obraz=2 where ona_obraz=3;'+
      'update AktAdopt set on_obraz=4 where on_obraz=2;'+
      'update AktAdopt set on_obraz=2 where on_obraz=3;'+
      'update AktTermMarriage set on_obraz=4 where on_obraz=2;'+
      'update AktTermMarriage set on_obraz=2 where on_obraz=3;'+
      'update ЗаключениеБраков set on_obraz=4 where on_obraz=2;'+
      'update ЗаключениеБраков set on_obraz=2 where on_obraz=3;'+
      'update AktAdopt set ona_obraz=4 where ona_obraz=2;'+
      'update AktAdopt set ona_obraz=2 where ona_obraz=3;'+
      'update AktTermMarriage set ona_obraz=4 where ona_obraz=2;'+
      'update AktTermMarriage set ona_obraz=2 where ona_obraz=3;'+
      'update ЗаключениеБраков set ona_obraz=4 where ona_obraz=2;'+
      'update ЗаключениеБраков set ona_obraz=2 where ona_obraz=3;'+
      'update АктыСмертей set obraz=4 where obraz=2;'+
      'update АктыСмертей set obraz=2 where obraz=3;'+
      'update ТалоныПрибытия set obraz=4 where obraz=2;'+
      'update ТалоныПрибытия set obraz=2 where obraz=3;'+
      'update Население set obraz=4 where obraz=2;'+
      'update Население set obraz=2 where obraz=3;';
    dbExecuteSQL(strSQL);
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Перекодировка образования): '+dbLastError() );
      Result := 1;
    end;
  end;
  if (Result=0) and arrCheck[1] then begin
    dbExecuteSQL('update СпрНасПунктов set gorod=false,not_stat=false');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (СпрНасПунктов): '+dbLastError() );
    end;
  end;
  if (Result=0) and arrCheck[2] then begin
    dbExecuteSQL('update БазаДомов set gilfond=0');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (БазаДомов): '+dbLastError() );
    end;
  end;
  if (Result=0) and arrCheck[3] then begin
    dbExecuteSQL('update AlfavitZags set dayz=dayofmonth(datez), monthz=month(datez), yearz=year(datez)');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (AlfavitZags): '+dbLastError() );
    end;
  end;
  if (Result=0) and arrCheck[4] then begin
    dbExecuteSQL('update Население set pasp_udost=1 where pasp_nomer is not null');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Население): '+dbLastError() );
      Result := 1;
    end;
  end;
  if (Result=0) and arrCheck[6] then begin
    strSQL:='update актырождений set b_gorod=2 where b_gorod=0;'+
            'update актырождений set on_b_gorod=2 where on_b_gorod=0;'+
            'update актырождений set ona_b_gorod=2 where ona_b_gorod=0;'+
            'update актырождений set b_m_gorod=2 where b_m_gorod=0;'+
            'update заключениебраков set on_b_gorod=2 where on_b_gorod=0;'+
            'update заключениебраков set ona_b_gorod=2 where ona_b_gorod=0;'+
            'update заключениебраков set on_m_b_gorod=2 where on_m_b_gorod=0;'+
            'update заключениебраков set ona_m_b_gorod=2 where ona_m_b_gorod=0;'+
            'update declaremarriage set on_b_gorod=2 where on_b_gorod=0;'+
            'update declaremarriage set ona_b_gorod=2 where ona_b_gorod=0;'+
            'update declaremarriage set on_m_b_gorod=2 where on_m_b_gorod=0;'+
            'update declaremarriage set ona_m_b_gorod=2 where ona_m_b_gorod=0;'+
            'update akttermmarriage set on_b_gorod=2 where on_b_gorod=0;'+
            'update akttermmarriage set ona_b_gorod=2 where ona_b_gorod=0;'+
            'update akttermmarriage set on_m_b_gorod=2 where on_m_b_gorod=0;'+
            'update akttermmarriage set ona_m_b_gorod=2 where ona_m_b_gorod=0;'+
            'update aktadopt set on_b_gorod=2 where on_b_gorod=0;'+
            'update aktadopt set ona_b_gorod=2 where ona_b_gorod=0;'+
            'update aktadopt set otec_b_gorod=2 where otec_b_gorod=0;'+
            'update aktadopt set mat_b_gorod=2 where mat_b_gorod=0;'+
            'update aktadopt set b_gorod_do=2 where b_gorod_do=0;'+
            'update aktadopt set b_gorod_posle=2 where b_gorod_posle=0;'+
            'update aktchangename set b_gorod=2 where b_gorod=0;'+
            'update aktchangename set m_b_gorod=2 where m_b_gorod=0;'+
            'update актыустотцовства set b_gorod=2 where b_gorod=0;'+
            'update актыустотцовства set on_b_gorod=2 where on_b_gorod=0;'+
            'update актыустотцовства set ona_b_gorod=2 where ona_b_gorod=0;'+
            'update актыустотцовства set on_m_b_gorod=2 where on_m_b_gorod=0;'+
            'update актыустотцовства set ona_m_b_gorod=2 where ona_m_b_gorod=0;'+
            'update актысмертей set rg_b_gorod=2 where rg_b_gorod=0;'+
            'update актысмертей set gt_b_gorod=2 where gt_b_gorod=0;'+
            'update актысмертей set sm_b_gorod=2 where sm_b_gorod=0';
    dbExecuteSQL(strSQL);
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Перекодировка типа нас. пункта): '+dbLastError() );
      Result := 1;
    end;
    if dbLastError()='' then begin
      CheckNamePunktBase;
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (Изменение типа нас. пункта): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
  if (Result=0) and arrCheck[7] then begin
    dbExecuteSQL('UPDATE Население SET ochered=false WHERE ochered is null');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (Население): '+dbLastError() );
      Result := 1;
    end;
    if Result=0 then begin
      dbExecuteSQL('UPDATE Население SET notdelete=false WHERE notdelete is null');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (Население): '+dbLastError() );
        Result := 1;
      end;
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
    ds := dbOpenSQL('select * from system.columns where name='+QStr('PRIZ')+' and parent='+QStr('Население'),'');
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
  if (Result=0) and (sFieldVUS<>'') then begin
    Result:=CheckVUS_After;
  end;
  if (Result=0) and arrCheck[5] then begin
    dbExecuteSQL('UPDATE VUS SET type_komanda=1 WHERE type_komanda is null');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (VUS): '+dbLastError() );
      Result := 1;
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
              'update DocFile set DIR_YEAR='+QStr('20')+'+trim(DIR_YEAR) where length(trim(DIR_YEAR))=2;'
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
    dbExecuteSQL('_CheckAdmProc.sql');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (SprDocAdmProc): '+dbLastError() );
      Result := 1;
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
  {$IFDEF CHECK_ATE}
  if (Result=0) then begin
    ds := dbOpenSQL('select max(dateout) max_date from ate','');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (формирование ATE): '+dbLastError() );
      Result := 1;
    end else begin
      if ds.Fld('max_date').IsNull or (ds.Fld('max_date').AsDateTime<STOD('2012-10-02','')) then begin
        dbExecuteSQL('delete from ATE');
        dbExecuteSQL('insert into ATE select * from NewBase.ATE');
        if dbLastError()<>'' then begin
          ShowMessage( 'Ошибка выполнения скрипта (формирование ATE): '+dbLastError() );
          Result := 1;
        end;
      end;
    end;
  end;
  {$ENDIF}
  if (Result=0) and arrCheck[19] then begin
    dbExecuteSQL('update AktTermMarriage set type_rast=0 where type_rast is null;');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта (AktTermMarriage): '+dbLastError() );
      Result := 1;
    end;
  end;
{
  if (Result=0) and ParamAsBoolean('AKT_UPPER') then begin
    dbExecuteSQL('UPDATE СпрТипУлиц SET name=upper(name),fname=upper(fname)');
    dbExecuteSQL('UPDATE SysSpr.TypePunkt SET name=upper(name),name_b=upper(name_b),fname=upper(fname)');
//    dbExecuteSQL('UPDATE SysSpr.СпрНациональностей SET name=upper(name),fname=upper(fname)');
    if dbLastError()<>'' then begin
      ShowMessage( 'Ошибка выполнения скрипта: '+dbLastError() );
      Result := 1;
    end;
  end;
}
end;

//-----------------------------------------------------------------
function BeforeUpdate : Integer;
var
  ds,ds1 : TDataSet;
  nVer : Integer;
  lEof : Boolean;
begin
  TypeBase:=GlobalTask.GetWorkParam('TYPEBASE');
  if TypeBase='' then TypeBase:='SELSOVET';

  ds := dbOpenSQL('SELECT * FROM system.dictionary','');
  if ds.Fld('Version_Major').AsInteger < 3 then begin
    nVersion := 2;
  end;
  nVer := StrToInt(ds.Fld('Version_Major').AsString+ds.Fld('Version_Minor').AsString);
  if nVer < 38 then lCheckPrichSm:=true    else lCheckPrichSm:=false;
  if nVer < 39 then lCheckPerevod:=true    else lCheckPerevod:=false;
  if nVer < 43 then lCheckIsporSvid:=true  else lCheckIsporSvid:=false;
  if nVer < 46 then lCheckLicPresent:=true  else lCheckLicPresent:=false;
  if nVer < 55 then arrCheck[0]:=true  else arrCheck[0]:=false;
  if nVer < 70 then arrCheck[1]:=true  else arrCheck[1]:=false;
  if nVer < 76 then arrCheck[2]:=true  else arrCheck[2]:=false;
  if nVer < 77 then arrCheck[3]:=true  else arrCheck[3]:=false;
  if nVer < 81 then arrCheck[4]:=true  else arrCheck[4]:=false;
  if nVer < 85 then arrCheck[5]:=true  else arrCheck[5]:=false;
  if nVer < 90 then arrCheck[6]:=true  else arrCheck[6]:=false;
  if nVer < 100 then arrCheck[7]:=true  else arrCheck[7]:=false;
  if nVer < 102 then arrCheck[8]:=true  else arrCheck[8]:=false;
  if nVer < 102 then arrCheck[8]:=true  else arrCheck[8]:=false;
  if nVer < 104 then arrCheck[9]:=true  else arrCheck[9]:=false;
  if nVer < 105 then arrCheck[10]:=true  else arrCheck[10]:=false;
  if nVer < 106 then arrCheck[11]:=true  else arrCheck[11]:=false;
  if nVer < 109 then arrCheck[12]:=true  else arrCheck[12]:=false;
  if nVer < 113 then arrCheck[13]:=true  else arrCheck[13]:=false;
  if nVer < 117 then arrCheck[14]:=true  else arrCheck[14]:=false;
  if nVer < 119 then arrCheck[15]:=true  else arrCheck[15]:=false;
  if nVer < 125 then arrCheck[16]:=true  else arrCheck[16]:=false;
  if nVer < 147 then arrCheck[17]:=true  else arrCheck[17]:=false;

  if nVer < 149 then arrCheck[18]:=true  else arrCheck[18]:=false;
  if nVer < 150 then arrCheck[19]:=true  else arrCheck[19]:=false;


  dbClose(ds);

  // необходимость реорганизации Население в VUS
  ds := dbOpenSQL('select * from system.columns where name='+QStr('VB_NOMER')+' and parent='+QStr('Население'),'');
  if (ds.RecordCount>0) then begin
    CheckVUS_Before;
  end;
  dbClose(ds);

  Result := 0;
  if nVer <= 88 then begin
    ds := dbOpenSQL('select * from system.tables where name='+QStr('bighouse'),'');
    lEof := ds.Eof;
    dbClose(ds);
    if not lEof then begin
      dbExecuteSQL('EXECUTE PROCEDURE sp_ZapTable('+QStr('BigHouse')+')');
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения скрипта (Удаление BigHouse): '+dbLastError() );
        Result := 1;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------
procedure ExitScript;
begin
end;

begin
end.