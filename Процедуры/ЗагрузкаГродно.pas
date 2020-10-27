function VUS_Zvan(n:Integer):String;
begin
  result:='';
  case n of
       311:result:='61';// Майор                                                       
       314:result:='32';// Старший прапорщик                                           
       315:result:='53'// старший лейтенант                                           
       316:result:='54'// капитан                                                     
       322:result:='11'// рядовой                                                     
       324:result:='24'// старшина                                                    
       325:result:='13'// матрос                                                      
       326:result:='51'// младший лейтенант                                           
       327:result:='52'// лейтенант                                                   
       328:result:='62'// подполковник                                                
       329:result:='63'// полковник                                                   
       330:result:='21'// младший сержант                                             
       331:result:='23'//старший сержант                                             
       332:result:='22'// сержант                                                     
       333:result:='31'//  прапорщик                                                  
       335:result:='12'// ефрейтор                                                    
       391:result:='33'// мичман                                                      
       410:result:='53'// старший лейтенант м\с                                       
       411:result:='61'// майор милиции                                               
  end;
end;

function VUS_Gruppa(n:Integer):string;
begin
  result:='';
  case n of
    309 :Result:='ВС';  // ВС
    317 :Result:='МВД';  // МВД
    319 :Result:='КГБ'; // КГБ
    320 :Result:='ОПС'; // ОПС
  end;
end;

function GetPos(s:String;arrS:array of string;var nNewPos:Integer):Integer;
var
  i,n:Integer;
begin
  Result:=0;
  nNewPos:=0;
  for i:=0 to GetArrayLength(arrS)-1 do begin
    n:=Length(arrS[i]);
    Result:=Pos(arrS[i],ANSILowercase(s));
    if Result>0 then begin 
      break;
    end;
  end;
  nNewPos:=Result+n;
end;

function GetObraz(n:Integer):Integer;
begin
  result:=0;
  case n of
    1   :Result:=6;  // начальное
    101 :Result:=4;  // среднее
    392 :Result:=1; // высшее
    304 :Result:=7; // НГ
    305 :Result:=7; // НГ
    307 :Result:=5; // неполное среднее
    301 :Result:=5; // НС (неполн средн)
    308 :Result:=5;// общее базовое
    436 :Result:=3; // проф-техн
    102 :Result:=2; // среднее спец
    101 :Result:=4;  // среднее
  end;
end;

function GetGrag(n:Integer):Integer;
begin
  result:=0;
  case n of
    1   :Result:=112; 
    2   :Result:=643; 
    3   :Result:=440; 
    4   :Result:=51; 
    5   :Result:=804;
    6   :Result:=860; 
    7   :Result:=999; 
    8   :Result:=428; 
    9   :Result:=616; 
    10  :Result:=999; 
    11  :Result:=31; 
    12  :Result:=498; 
  end;
end;

function GetGosud(s:String):String;
begin
  Result:='';
  s:=ANSIUpperCase(Trim(s));
  if Copy(s,1,2)='РБ' then begin
    Result:='112'; 
  end else if Copy(s,1,2)='РФ' then begin
    Result:='643'; 
  end else if Copy(s,1,2)='УК' then begin
    Result:='804'; 
  end else if Copy(s,1,2)='УЗ' then begin
    Result:='860'; 
  end else if (Copy(s,1,3)='ФРГ') or (Copy(s,1,3)='ГЕР') then begin
    Result:='276'; 
  end else if Copy(s,1,3)='ЧЕХ' then begin
    Result:='203'; 
  end else if Copy(s,1,3)='МОЛ' then begin
    Result:='498'; 
  end else if Copy(s,1,3)='ЛИТ' then begin
    Result:='440'; 
  end else if Copy(s,1,3)='ЛАТ' then begin
    Result:='428'; 
  end else if Copy(s,1,3)='КЫР' then begin
    Result:='417'; 
  end else if Copy(s,1,3)='КАЗ' then begin
    Result:='398'; 
  end else if Copy(s,1,3)='АЗЕ' then begin
    Result:='31'; 
  end else if Copy(s,1,3)='АБХ' then begin
    Result:='904'; 
  end;
  case n of
    1   :Result:=112; 
    2   :Result:=643; 
    3   :Result:=440; 
    4   :Result:=51; 
    5   :Result:=804;
    6   :Result:=860; 
    7   :Result:=999; 
    8   :Result:=428; 
    9   :Result:=616; 
    10  :Result:=999; 
    11  :Result:=31; 
    12  :Result:=498; 
  end;
end;

procedure LoadGrogno;
var
  dsMensAdd,dsMensLgotD,dsSprLgotD,dsMatStenD,dsSprSoato, dsSprNP, dsSprOtnD, dsSprULD,dsMensD,dsLichD,dsAdresD : TDataSet;
  dsLgotS,dsSelS,dsMatStenS,dsGilFondS,dsGragS,dsNationS,dsPunktS,dsUlS, dsStatS : TDataSet;

  dsSprNacD,dsData,dsSprDolgD,dsVUSD,dsVUS:TDataSet;
  memNP,memDolg,memOtn,memUL,memMen:TDataSet;
  sSQL,sName,sPar:String;

  n1,n2,nNew1,nNew2,i,n,m,nID,nAdresID,nGlava,nPunkt,nUL,nHouse,nLicID,nMenID : Integer;
  s,ss,strErr,strAdres,strDir,strHouse,strKv,strKorp : String;
  d,dPrib,dVib : TDateTime;
  lOk,lFindLic : Boolean;
begin
  strDir:='F:\Гродно\Data';
//  strDir := ChoiceDir('Выберите папку с данными','');
//  if strDir='' then begin
//    strDir:='E:\Гродно\Data';
//  end;
  if (strDir<>'') then begin //	and FileExists(strDir+'\mens.dbf') then begin
    lOk := false;
    if FileExists(strDir+'\sl_ludi.dbf') and FileExists(strDir+'\sl_xoz.dbf') 
      then lOk:=true
      else PutError('Не найдены файлы для загрузки.');
{
    if lOk then begin
      s := '';
      s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
      s := s + 'После выполнения загрузки текущая информация'#13;
      s := s + 'в базе будет уничтожена.'#13;
      s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
      s := s + 'введите слово ДА в поле ввода'#13;
      lOk := OkWarning(s);
    end;
}
    if lOk then begin
    dsMensD := dmBase.GetDataSet('tbMens');
    dsMensAdd := dmBase.GetDataSet('НаселениеДоп');
    dsMensLgotD := dmBase.GetDataSet('НаселениеЛьготы');
    dsLichD := dmBase.GetDataSet('tbLich');
    dsAdresD:= dmBase.GetDataSet('tbAdres');
    dsSprULD:= dmBase.GetDataSet('SprUL');
    dsSprOtnD:= dmBase.GetDataSet('СпрОтношений');
    dsSprNP:= dmBase.GetDataSet('СпрНасПунктов');
    dsSprSoato:= dmBase.GetDataSet('СпрСОАТО');
    dsMatStenD:= dmBase.GetDataSet('СпрМатериалСтен');
    dsSprLgotD:= dmBase.GetDataSet('СпрЛьготников');
    dsSprNacD:=dbGetDataSet('dmBase.SprNAC') ;
    dsSprDolgD:=dmBase.GetDataSet('СпрДолжностей');
    dsVUSD:=dmBase.GetDataSet('VUS');

    if (dsMensD<>nil) then begin //and Problem(' Начнем загрузку ? ') then begin
//      WriteDebug('Загрузка ...');
//      WriteDebug('предварительное удаление ...');
      OpenMessage('Загрузка данных ...','',10);

      dbExecuteSQL('DELETE FROM СпрУлиц');
      dbExecuteSQL('DELETE FROM СпрНасПунктов');
      dbExecuteSQL('DELETE FROM СпрОтношений');
      dbExecuteSQL('DELETE FROM СпрДолжностей');
      dbExecuteSQL('DELETE FROM СозданиеОбъекта');
      dbExecuteSQL('DELETE FROM Население');
      dbExecuteSQL('DELETE FROM НаселениеДоп');
      dbExecuteSQL('DELETE FROM VUS');
      dbExecuteSQL('DELETE FROM НаселениеДвижение');
      dbExecuteSQL('DELETE FROM НаселениеЛьготы');
      dbExecuteSQL('DELETE FROM НаселениеПризнаки');
      dbExecuteSQL('DELETE FROM ЛицевыеСчета');
      dbExecuteSQL('DELETE FROM ЛицевыеСчетаПризнаки');
      dbExecuteSQL('DELETE FROM БазаДомов');
      dbExecuteSQL('DELETE FROM БазаСтрок');
      dbExecuteSQL('DELETE FROM БазаСвойствОбъектов');
      dbExecuteSQL('DELETE FROM HouseProps');
      dbExecuteSQL('DELETE FROM HouseOwners');
//      dbExecuteSQL('DELETE FROM СпрЛьготников');
//      dbExecuteSQL('DELETE FROM СпрМатериалСтен');

      dbOpenConnect('Grodno','PATH='+strDir+';TYPESERVER=LOCAL');
      sPar:='CHARTYPE=ANSI;TABLETYPE=CDX';

      sSQL:='select *  from sl_xozl x '+chr(13)+
            ' left join sl_ludi m on x.xozludi=m.ludiid '+chr(13)+
            ' left join sl_xoz l on l.xozlicsc=x.xozllicsc '+chr(13)+
            ' left join s_dolzn d on d.dolznid=m.ludidolzn '+chr(13)+
            ' left join s_ulic u on u.ulicid=l.xozulic '+chr(13)+
            ' where xozludi>0 and xozllicsc>0 and l.xozlicsc is not null and m.ludiid is not null and xozzakr is null ';

      dsData := dbOpenSQL(sSQL,sPar);

      sSQL:=' select s.*, s1.znachnaim as zvan, s2.znachnaim as komanda '+chr(13)+
            '  from sl_wus s '+chr(13)+
            '  left join s_kdr s1 on s1.sprid=5 and s1.znachid=s.wuszwan '+chr(13)+
            '  left join s_kdr s2 on s2.sprid=10 and s2.znachid=s.wuskom ';
      dsVUS := dbOpenSQL(sSQL,sPar);

      dsUlS   := dbOpen('s_ulic.dbf',sPar);
      dsPunktS:= dbOpen('s_der.dbf',sPar);
      dsNationS:= dbOpen('s_nac.dbf',sPar);
      dsStatS:= dbOpen('s_rodst.dbf',sPar);
      dsGilFondS:= dbOpen('sl_jiv.dbf',sPar);

      //----- загрузим справочник отношений -----
      WriteDebug('спр. отношений');
      memOtn := dbCreateMemTable('KOD_S,Integer;KOD_D,Integer;','');
      memOtn.Open;
      nGlava := 0;
      while not dsStatS.Eof do begin
        if Copy(ANSILowerCase(dsStatS.Fld('RODSTNAIM').AsString),1,5)<>'глава' then begin
          dsSprOtnD.Append;
          dsSprOtnD.Fld('NAME').AsString := dsStatS.Fld('RODSTNAIM').AsString;
          dsSprOtnD.Post;
          memOtn.Append;
          memOtn.Fld('KOD_S').AsString :=dsStatS.Fld('RODSTID').AsString;
          memOtn.Fld('KOD_D').AsString :=dsSprOtnD.Fld('ID').AsString;
          memOtn.Post;
        end else begin
          nGlava := dsStatS.Fld('RODSTID').AsInteger;
        end;
        dsStatS.Next;
      end;

      //------- загрузим справочник улиц -------------
      WriteDebug('спр. улиц');
      memUL := dbCreateMemTable('KOD_S,Integer;KOD_D,Integer;','');
      memUL.Open;
      while not dsULS.Eof do begin
        if Copy(dsUlS.Fld('ULICNAIM').AsString,1,4)='пер.' then begin
          s:=Trim(Copy(dsUlS.Fld('ULICNAIM').AsString,5,100));
          ss:='3';
        end else begin
          s:=Trim(dsUlS.Fld('ULICNAIM').AsString);
          ss:='1';
        end;
        if (s<>'Общежитие') and (copy(s,1,3)<>'дом') and (copy(s,1,3)<>'нет') then begin
          if not dbLocate(dsSprULD,'NAME',[s],'') then begin
            dsSprULD.Append;
            dsSprULD.Fld('ID').AsString:=dsUlS.Fld('ULICID').AsString;
            dsSprULD.Fld('TIP').AsString:=ss;
            dsSprULD.Fld('NAME').AsString:=s;
            dsSprULD.Post;
          end;
          memUL.Append;
          memUL.Fld('KOD_S').AsString :=dsUlS.Fld('ULICID').AsString;
          memUL.Fld('KOD_D').AsString :=dsSprULD.Fld('ID').AsString;
          memUL.Post;
        end;
        dsUlS.Next;
      end;
      WriteDebug('спр. нас. пунктов');
      //------- загрузим справочник нас. пунктов -------------
      memNP := dbCreateMemTable('KOD_S,Integer;KOD_D,Integer;','');
      memNP.Open;
      while not dsPunktS.Eof do begin
        dsSprNP.Append;
        dsSprNP.Fld('NAME').AsString  := dsPunktS.Fld('DERNAIM').AsString;
        dsSprNP.Fld('TYPEPUNKT').AsInteger:=2;
        dsSprNP.Fld('CHERN').AsBoolean:= false;
        dsSprNP.Fld('GOROD').AsBoolean:= false;
        dsSprNP.Fld('NOT_STAT').AsBoolean:= false;
        dsSprNP.Post;
        memNP.Append;
        memNP.Fld('KOD_S').AsString :=dsPunktS.Fld('DERID').AsString;
        memNP.Fld('KOD_D').AsString :=dsSprNP.Fld('ID').AsString;
        memNP.Post;
        dsPunktS.Next;
      end;
      //--------------------


      memMen := dbCreateMemTable('KOD_S,Integer;KOD_D,Integer;','');
      memMen.Open;
      i:=0;
      nHouse:=1;   // для домов без номера
      WriteDebug('люди');

      while not dsData.Eof do begin
        if dsData.Fld('XOZPRIBD').IsNull then dPrib:=0 else dPrib:=dsData.Fld('XOZPRIBD').AsDateTime;
        if dsData.Fld('XOZVYBD').IsNull then dVib:=0 else dVib:=dsData.Fld('XOZVYBD').AsDateTime;

        if dVib=0 then begin   // выбывшие не нужны

        strHouse:='';
        if dbLocate(memNP,'KOD_S',[dsData.Fld('XOZDER').AsInteger],'')
          then nPunkt:=memNP.Fld('KOD_D').AsInteger
          else nPunkt:=0;
        if dbLocate(memUL,'KOD_S',[dsData.Fld('XOZULIC').AsInteger],'')
          then nUL:=memUL.Fld('KOD_D').AsInteger
          else nUL:=0;
        s:=Trim(dsData.Fld('ULICNAIM').AsString);
        if (s='Общежитие') then begin
          strHouse:='общ';
          nUL:=0;
        end else if (copy(s,1,3)='дом') then begin
          strHouse:=trim(copy(s,4,10));
          nUL:=0;
        end else if (copy(s,1,3)='нет') then begin
          strHouse:='нет';
          nUL:=0;
        end;

        lFindLic:=false;
        if dbLocate(dsLichD, 'NOMER', [dsData.Fld('XOZLICSC').AsInteger],'') then begin
          nLicID := dsLichD.Fld('ID').AsInteger;
          nAdresID:=dsLichD.Fld('ADRES_ID').AsInteger;
          if nAdresID=0 then begin
            WriteDebug('adres not found');
          end;
          lFindLic:=true;
        end;
        if not lFindLic then begin
          strAdres:=Trim(dsData.Fld('XOZADRES').AsString);
          strKv := '';
          strKorp := '';
          n1:=0;
          n2:=0;
          nNew1:=0;
          nNew2:=0;
          if strAdres='' then begin
            if strHouse='' then begin
              strHouse:='*'+IntToStr(nHouse);
              nHouse:=nHouse+1;
            end;
          end else if IsAllDigit(strAdres) then begin
            if strHouse='' 
              then strHouse:=strAdres
              else strKv:=strAdres;
          end else begin
            n1:=GetPos(strAdres,['дом','д.','д'],nNew1);
            n2:=GetPos(strAdres,['блок','кв.','кв','бл','к.','ком'],nNew2);
            if (n1=0) and (n2=0) then begin
              n:=Pos('-',strAdres);
              if (strHouse='') and (n>0) then begin
                strHouse:=Copy(strAdres,1,n-1);
                strKv:=Copy(strAdres,n+1,10);
              end else begin
                if strHouse='' 
                  then strHouse:=strAdres
                  else strKv:=strAdres;
              end;
            end else if n2=0 then begin   // нет номера квартиры
              strHouse:=Copy(strAdres,nNew1,20);
            end else if n1=0 then begin  // нет номера дома
              if (n2>2) and (strHouse='') then
                strHouse:=Trim(Copy(strAdres,1,n2-1));
              if strHouse='' then begin
                strHouse:='*'+IntToStr(nHouse);
                nHouse:=nHouse+1;
              end;
              strKv:=Copy(strAdres,nNew2,20);
            end else begin
              strHouse:=Copy(strAdres,nNew1,n2-nNew1);
              strKv:=Copy(strAdres,nNew2,20);
            end;
          end;
          strHouse:=Trim(DelAllChar(strHouse,',.; '));
          strKv:=Trim(DelAllChar(strKv,',.; '));

  //        writedebug(Trim(dsData.Fld('XOZADRES').AsString)+'  n='+
  //            inttostr(n1)+','+inttostr(n2)+
  //            '   nNew='+inttostr(nNew1)+','+inttostr(nNew2)+
  //            '  dom="'+strHouse+'"'+' kv="'+strKv+'"');
          nAdresID:=0;
          strErr:='';

          if dmBase.FindAdres(STOD('1899-12-30',''),nPunkt,nUL,trim(strHouse),strKorp,trim(strKv),-1) then begin
            nAdresID:=dmBase.getFindAdresID;
          end else begin
            dmBase.AddAdres(STOD('1899-12-30',''),nPunkt,nUL,trim(strHouse),strKorp,trim(strKv),nAdresID,strErr);
{ jivstr
    20     общая площадь
    21     жилая
    22     год возвед.
    23     мат стен   дер кир
    24  наличие водопровода
    25 наличие канализ
    26  наличие центр отопл
    27 газоснабж
    28 водозаб колонка
   29   всего земли
   30     земля под постройками
   36   приусадебная
}

            d:=STOD('1899-12-30','');
            n:=dsData.Fld('XOZLICSC').AsInteger;
            if dbLocate(dsGilFondS, 'JIVLICSC;JIVSTR', [n,22], '') then 
              dmBase.WriteFieldProp( d, 'GOD_VOZV', dsGilFondS.Fld('JIVKOL2'), nAdresID, dmBase.TypeObj_Adres, ftInteger);

            if dbLocate(dsGilFondS, 'JIVLICSC;JIVSTR', [n,20], '') then 
              dmBase.WriteFieldProp( d, 'PLOSH_ALL', dsGilFondS.Fld('JIVKOL2'), nAdresID, dmBase.TypeObj_Adres, ftFloat);

            if dbLocate(dsGilFondS, 'JIVLICSC;JIVSTR', [n,21], '') then 
              dmBase.WriteFieldProp( d, 'PLOSH_GIL', dsGilFondS.Fld('JIVKOL2'), nAdresID, dmBase.TypeObj_Adres, ftFloat);

            if dbLocate(dsGilFondS, 'JIVLICSC;JIVSTR', [n,23], '') then begin
              n1:=0;
              if ANSIUpperCase(Copy(dsGilFondS.Fld('JIVKOL1').AsString,1,3))='ДЕР' then begin
                n1:=1;
              end else if ANSIUpperCase(Copy(dsGilFondS.Fld('JIVKOL1').AsString,1,3))='КИР' then begin
                n1:=2;
              end;
              if (n1>0) and dbLocate(dsMatStenD, 'ID', [n1], '') then begin
                dmBase.WriteFieldProp( d, 'MAT_STEN', dsMatStenD.Fld('ID'), nAdresID, dmBase.TypeObj_Adres, ftString);
              end;
            end;
          end;
        end;

        if not lFindLic then begin
          nLicID := dmBase.GetNewID(dmBase.TypeObj_Lich);
          dsLichD.Append;
          dsLichD.Fld('ID').AsInteger:=nLicID;
          dsLichD.Fld('ADRES_ID').AsInteger:=nAdresID;
          dsLichD.Fld('NOMER').AsString:=dsData.Fld('XOZLICSC').AsString;
          dsLichD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
          dsLichD.Fld('OWN_HOUSE').AsBoolean:=true;
          dsLichD.Fld('CANDELETE').AsBoolean:=false;
          dsLichD.Fld('FIRST').AsInteger:=dsData.Fld('XOZGLAVA').AsInteger;
          dsLichD.Fld('TELEFON').AsString:=dsData.Fld('XOZADRES').AsString;
          dsLichD.Post;

          d:=STOD('1899-12-30','');
          n:=dsData.Fld('XOZLICSC').AsInteger;
          if dbLocate(dsGilFondS, 'JIVLICSC;JIVSTR', [n,29], '') then 
            dmBase.WriteFieldProp( d, 'VSEGO', dsGilFondS.Fld('JIVKOL2'), nLicID, dmBase.TypeObj_Lich, ftFloat);
          if dbLocate(dsGilFondS, 'JIVLICSC;JIVSTR', [n,30], '') then 
            dmBase.WriteFieldProp( d, 'POSTR', dsGilFondS.Fld('JIVKOL2'), nLicID, dmBase.TypeObj_Lich, ftFloat);
          if dbLocate(dsGilFondS, 'JIVLICSC;JIVSTR', [n,36], '') then 
            dmBase.WriteFieldProp( d, 'PRIUSAD', dsGilFondS.Fld('JIVKOL2'), nLicID, dmBase.TypeObj_Lich, ftFloat);
        end;

        //---- добавим человека -----------------
        nMenID:=dmBase.GetNewID(dmBase.TypeObj_Nasel);
        memMen.append;
        memMen.Fld('KOD_S').AsInteger:=dsData.Fld('LUDIID').AsInteger;
        memMen.Fld('KOD_D').AsInteger:=nMenID;
        memMen.Post;
        dsMensD.Append;
        dsMensD.Fld('ID').AsInteger:=nMenID;
        dsMensD.Fld('FAMILIA').AsString:=dsData.Fld('LUDIFAM').AsString;
        dsMensD.Fld('NAME').AsString:=dsData.Fld('LUDIIMQ').AsString;
        dsMensD.Fld('OTCH').AsString:=dsData.Fld('LUDIOTC').AsString;
        dsMensD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
        dsMensD.Fld('PROPIS').AsBoolean:=true;
        dsMensD.Fld('PRESENT').AsBoolean:=true;
        dsMensD.Fld('CANDELETE').AsBoolean:=false;
        if dsData.Fld('LUDIPOL').AsInteger=1 then dsMensD.Fld('POL').AsString:='М' else dsMensD.Fld('POL').AsString:='Ж';
        dsMensD.Fld('DATER').Value:=dsData.Fld('LUDIDROZ').Value;

        dmBase.WriteFieldProp( d, 'WORK_NAME', dsData.Fld('LUDIMRAB'), nID, dmBase.TypeObj_Nasel, ftMemo);

        if not dbLocate(dsSprDolgD,'NAME', [dsData.Fld('DOLZNNAIM').AsString],'') then begin
          dsSprDolgD.Append;
          dsSprDolgD.Fld('NAME').AsString:=dsData.Fld('DOLZNNAIM').AsString;
          dsSprDolgD.Post;
        end;
        dsMensD.Fld('DOLG_SPR').AsInteger:=dsSprDolgD.Fld('ID').AsInteger;

        dsMensD.Fld('DATEP').Value:=dsData.Fld('XOZPRIBD').Value;
        dsMensD.Fld('DATEV').Value:=dsData.Fld('XOZVYBD').Value;
        //--- определить присутствие человека ----
        //----------------
        if dbLocate(memOtn,'KOD_S',[dsData.Fld('XOZRODST').AsInteger],'')
          then dsMensD.Fld('OTNOSH').AsInteger:=memOtn.Fld('KOD_D').AsInteger
          else dsMensD.Fld('OTNOSH').AsString:='';

        dsMensD.Fld('LICH_NOMER').AsString:=dsdata.Fld('LUDIPASPNL').AsString;
        dsMensD.Fld('PASP_SERIA').AsString:=dsData.Fld('LUDIPASPS').AsString;
        dsMensD.Fld('PASP_NOMER').AsString:=dsdata.Fld('LUDIPASPN').AsString;
        dsMensD.Fld('PASP_DATE').Value:=dsData.Fld('LUDIPASPD').Value;

        if dsData.Fld('LUDIPASPW').AsString<>'' then
          dmBase.WriteFieldProp( d, 'PASP_VIDAN', dsData.Fld('LUDIPASPW'), nMenID, dmBase.TypeObj_Nasel, ftMemo);

        dsMensD.Fld('FIRST').AsBoolean:=false;

        //--- национальность
        if dbLocate(dsNationS,'NACID',[dsData.Fld('LUDINAC').AsInteger],'') then begin
          sName:=Copy(dsNationS.Fld('NACNAIM1').AsString,1,4);
          if dbLocate(dsSprNacD,'NAME',[sName],'part,notcase') then begin
            dsMensD.Fld('NATION').AsInteger:=dsSprNacD.Fld('ID').AsInteger;
          end;
        end;
        //--- образовае
        n:=GetObraz(dsData.Fld('LUDIOBR').AsInteger);
        if n>0 then dsMensD.Fld('OBRAZ').AsInteger:=n;
        //--- гражданство
        n:=GetGrag(dsData.Fld('LUDIGOS').AsInteger);
        if n>0 then dsMensD.Fld('CITIZEN').AsInteger:=n;

        dsMensD.Fld('LIC_ID').AsInteger:=nLicID;
        dsMensD.Fld('ADRES_ID').AsInteger:=nAdresID;
        dsMensD.Fld('VUS').AsBoolean:=false;
        dsMensD.Fld('OCHERED').AsBoolean:=false;

        dsMensD.Post;

        if (dsData.Fld('LUDIMROZO').AsString<>'') or (dsData.Fld('LUDIMROZR').AsString<>'') or
           (dsData.Fld('LUDIMROZ').AsString<>'') or (dsData.Fld('LUDIMROZST').AsString<>'') or
           (dsData.Fld('LUDIPRIBO').AsString<>'') or (dsData.Fld('LUDIPRIBR').AsString<>'') or
           (dsData.Fld('LUDIPRIB').AsString<>'') then begin

          dsMensAdd.Append;
          dsMensAdd.Fld('ID').AsInteger:=nMenID;

          dsMensAdd.Fld('MR_B_OBL').AsBoolean:=true;
          dsMensAdd.Fld('MR_OBL').AsString:=dsData.Fld('LUDIMROZO').AsString;
          dsMensAdd.Fld('MR_RAION').AsString:=dsData.Fld('LUDIMROZR').AsString;
          dsMensAdd.Fld('MR_GOROD').AsString:=dsData.Fld('LUDIMROZ').AsString;
          dsMensAdd.Fld('MR_GOSUD').AsString:=GetGosud(dsData.Fld('LUDIMROZST').AsString;

          dsMensAdd.Fld('OP_OBL').AsString:=dsData.Fld('LUDIPRIBO').AsString;
          dsMensAdd.Fld('OP_RAION').AsString:=dsData.Fld('LUDIPRIBR').AsString;
          dsMensAdd.Fld('OP_GOROD').AsString:=dsData.Fld('LUDIPRIB').AsString;

          dsMensAdd.Post;
        end;
{
 LUDIMROZO           C         20        Место рождения область
 LUDIMROZR           C         20        Место рождения район
 LUDIMROZ            C         40        Место рождения населенный пункт
 LUDIMROZST          C         40        Место рождения страна
 LUDIPRIBO           C         20        Откуда прибыл область (республика)
 LUDIPRIBR           C         20        Откуда прибыл район
 LUDIPRIB            C         40        Откуда прибыл населенный пункт
}
{
      ID Integer,
      MR_B_RESP Logical,
      MR_GOSUD Integer,
      MR_B_OBL Logical,
      MR_OBL CIChar( 50 ),
      MR_RAION CIChar( 50 ),
      MR_B_GOROD Short,
      MR_GOROD CIChar( 50 ),
      MR_GOROD_RN CIChar( 60 ),
      MR_TYPE_ULICA CIChar( 5 ),
      MR_ULICA CIChar( 40 ),
      MR_DOM CIChar( 5 ),
      MR_KORP CIChar( 5 ),
      MR_KV CIChar( 50 ),
      OP_B_RESP Logical,
      OP_GOSUD Integer,
      OP_B_OBL Logical,
      OP_OBL CIChar( 50 ),
      OP_RAION CIChar( 50 ),
      OP_B_GOROD Short,
      OP_GOROD CIChar( 50 ),
      OP_DATE Date,
}


        i:=i+1;

        end;      // <--------- dVib

//        WriteDebug(IntToStr(i));
//        if i>1000 then break;
        dsData.Next;
      end;

     //------------------------------------------------------------------------------
      WriteDebug('обработаем лицевые');
      dsLichD.First;
      while not dsLichD.Eof do begin
        dsLichD.Edit;
        if dbLocate(memMen, 'KOD_S', [dsLichD.Fld('FIRST').AsInteger], '') then begin
          dsLichD.Fld('FIRST').AsInteger:=memMen.Fld('KOD_D').AsInteger;
          if dbLocate(dsMensD, 'ID', [memMen.Fld('KOD_D').AsInteger], '') then begin
            dsMensD.Edit;
            dsMensD.Fld('FIRST').AsBoolean:=true;;
            dsMensD.Post;
          end else begin
            writedebug('2 first not found '+memMen.Fld('KOD_D').AsString);
          end;
        end else begin
          dsLichD.Fld('FIRST').AsString:='';
          writedebug('1 first not found '+dsLichD.Fld('FIRST').AsString);
        end;
        dsLichD.Post;
        dsLichD.Next;
      end;
     //------------------------------------------------------------------------------
      WriteDebug('ВУС');
      dsVUS.First;
      while not dsVUS.Eof do begin
        if dbLocate(memMen, 'KOD_S', [dsVUS.Fld('WUSLUDI').AsInteger], '') then begin
           if dbLocate(dsMensD, 'ID', [memMen.Fld('KOD_D').AsInteger], '') then begin
             dsVUSD.Append;
             dsVUSD.Fld('ID').AsString:=memMen.Fld('KOD_D').AsString;
             dsVUSD.Fld('NOMER_VUS').AsString:=dsVUS.Fld('WUSNAIM').AsString;
             dsVUSD.Fld('GRUPPA').AsString:=VUS_Gruppa(dsVUS.Fld('WUSGRUCH').AsInteger);
             dsVUSD.Fld('ZVAN').AsString:=VUS_Zvan(dsVUS.Fld('WUSZWAN').AsInteger);
             dsVUSD.Fld('SPEC_TEXT').AsString:=dsVUS.Fld('WUSSPECUCH').AsString;
             if (dsVUS.Fld('WUSGODN').AsInteger=1) then //or (dsVUS.Fld('WUSGOND').AsInteger=2) then
               dsVUSD.Fld('GODEN').AsInteger:=1; //dsVUS.Fld('WUSGOND').AsInteger;
             dsVUSD.Fld('KOMANDA').AsString:=dsVUS.Fld('KOMANDA').AsString;
             dsVUSD.Fld('JAVKA').AsString:=dsVUS.Fld('WUSTIME').AsString;
             dsVUSD.Fld('MARSHRUT').AsString:=dsVUS.Fld('WUSWAY').AsString;
             dsVUSD.Fld('PRIZ').AsBoolean:=false;
             dsVUSD.Post;

             dsMensD.Edit;
             dsMensD.Fld('VUS').AsBoolean:=true;
             dsMensD.Post;
           end;
        end;
        dsVUS.Next;
      end;
     //------------------------------------------------------------------------------

      dbClose(dsData);
      dbClose(dsUlS);
      dbClose(dsStatS);
      dbClose(dsPunktS);
      dbClose(dsNationS);
      dbClose(dsVUS);

      dbClose(memNP);
      dbClose(memOtn);
      dbClose(memDolg);
      dbClose(memUL);
      dbClose(memMen);
    
      dbCloseConnect('Grodno');
      dbSetCurrentConnect(idConn);
      CloseMessage();
      ShowMessage('Загрузка завершена.');
    end;
    end;
  end;
end;

