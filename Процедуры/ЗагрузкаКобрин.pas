// загрузить ЖКХ Кобрин
procedure LoadGKH_Kobrin;
var
  dsMensLgotD,dsSprLgotD,dsMatStenD,dsSprSoato, dsSprNP, dsSprOtnD, dsSprULD,dsMensD,dsLichD,dsAdresD : TDataSet;
  dsLgotS,dsSelS,dsData,dsGilFondS,dsGragS,dsNationS,dsPunktS,dsMensS,dsUlS, dsStatS,dsSprTH : TDataSet;
  m,nType,i,j,n,nID,nAdresID,nPunkt,nIDUL,nNew,nPunkt1 : Integer;
  nID_V,nID_S,nID_G : Integer;
  s,ss,s1,s2,s3,strErr,strDir, strHouse, strKv, strKorp, strNameUL : String;
  strSQL,sFam,sName,sOtch:String;
  sl:TStringList;
  d : TDateTime;
  lOk : Boolean;
begin
  strDir := ChoiceDir('Выберите папку с данными','');
//  if strDir='' then begin
//    strDir:='F:\ЖКХ_Брест';
//  end;
//  strDir:='F:\Кобрин_ЖКХ';
  if (strDir<>'') then begin 
    lOk := false;
    if FileExists(strDir+'\ls.dbf') and FileExists(strDir+'\spfond.dbf') 
      then lOk:=true
      else PutError('Не найдены файлы для загрузки.');
//    if lOk then begin
//      s := '';
//      s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
//      s := s + 'После выполнения загрузки текущая информация'#13;
//      s := s + 'в базе будет уничтожена.'#13;
//      s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
//      s := s + 'введите слово ДА в поле ввода'#13;
//      lOk := OkWarning(s);
//    end;
    if lOk then begin
    dsMensD := dmBase.GetDataSet('tbMens');
    dsMensLgotD := dmBase.GetDataSet('НаселениеЛьготы');
    dsLichD := dmBase.GetDataSet('tbLich');
    dsAdresD:= dmBase.GetDataSet('tbAdres');
    dsSprULD:= dmBase.GetDataSet('SprUL');
    dsSprOtnD:= dmBase.GetDataSet('СпрОтношений');
    dsSprNP:= dmBase.GetDataSet('СпрНасПунктов');
    dsSprSoato:= dmBase.GetDataSet('СпрСОАТО');
    dsMatStenD:= dmBase.GetDataSet('СпрМатериалСтен');
    dsSprLgotD:= dmBase.GetDataSet('СпрЛьготников');
    dsSprTH:= dmBase.GetDataSet('СпрТипЖилья');
    if (dsMensD<>nil) and Problem(' Начнем загрузку ? ') then begin
//      WriteDebug('Загрузка ...');
//      WriteDebug('предварительное удаление ...');
      OpenMessage('Загрузка данных ...             ','',10);

//      dbExecuteSQL('DELETE FROM СпрУлиц');
      dbExecuteSQL('DELETE FROM СпрНасПунктов');
      dbExecuteSQL('DELETE FROM СпрТипЖилья');
//      dbExecuteSQL('DELETE FROM СпрОтношений');
      dbExecuteSQL('DELETE FROM СозданиеОбъекта');
      dbExecuteSQL('DELETE FROM Население');
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
      dbOpenConnect('TMP_LOAD','PATH='+strDir+';TYPESERVER=LOCAL');
      strSQL:=' select l.KD,AD,convert(substring(convert(LS,SQL_CHAR),1,length(convert(LS,SQL_CHAR))-1),SQL_INTEGER) KV,'+chr(13)+
                     ' LS,FI,VS,PP,KO,SK,PO,KM,MP '+chr(13)+
                     ' from ls l '+chr(13)+
                     ' left join spfond s on s.kd=l.kd '+chr(13)+
                     ' where l.kd>1 ';
      dsData := dbOpenSQL(strSQL,'CHARTYPE=OEM;TABLETYPE=CDX');
      if dsData=nil then begin
        writedebug(dbLastError());
        CloseMessage;
        exit;
      end;
      dsSprNP.First;
      if dsSprNP.Fld('NAME').AsString='' then begin
        dsSprNP.Append;
        dsSprNP.Fld('NAME').AsString:='Кобрин';
        dsSprNP.Fld('TYPEPUNKT').AsString:='1';
        dsSprNP.Fld('GOROD').AsBoolean:=true;
        dsSprNP.Fld('NOT_STAT').AsBoolean:=false;
        dsSprNP.Post;
      end;
      dsSprNP.First;
      nPunkt1:=dsSprNP.Fld('ID').AsInteger; // <---------- нас. пункт Кобрин --------------


      dsSprTH.Append;
      dsSprTH.Fld('NAME').AsString:='Государственная';
      dsSprTH.Post;
      nID_G:=dsSprTH.Fld('ID').AsInteger;

      dsSprTH.Append;
      dsSprTH.Fld('NAME').AsString:='Служебная';
      dsSprTH.Post;
      nID_S:=dsSprTH.Fld('ID').AsInteger;

      dsSprTH.Append;
      dsSprTH.Fld('NAME').AsString:='Выкупленная';
      dsSprTH.Post;
      nID_V:=dsSprTH.Fld('ID').AsInteger;

      sl := TStringList.Create;
      n:=0;
      j:=0;
      while not dsData.Eof do begin
        s:=dsData.Fld('AD').AsString;
        StrToStrings(s, sl, ',');
        if sl.Count=3  then begin // вместе с населенным пунктом
          s1:=sl.Strings[0];
          s2:=sl.Strings[1];
          s3:=sl.Strings[2];
          m:=getPos(s1,['д.','пос.','г.', 'с.'], nNew);
          if m>0 then begin
            ss:=ANSIUpperCase(Trim(Copy(s1,1,nNew-m)));
//            writedebug(ss);
            nType:=1;
            if ss='Д.' then begin
              nType:=2;
            end else if Copy(ss,1,1)='Г' then begin
              nType:=1;
            end else if Copy(ss,1,1)='С' then begin
              nType:=3;
            end else if Copy(ss,1,1)='П' then begin
              nType:=8;
            end else if Copy(ss,1,2)='АГ' then begin
              nType:=17;
            end;
            ss:=Trim(Copy(s1,nNew,30));
            if not dbLocate(dsSprNP, 'NAME', [ss], '') then begin
              dsSprNP.Append;
              dsSprNP.Fld('NAME').AsString:=ss;
              dsSprNP.Fld('TYPEPUNKT').AsInteger:=nType;
              if nType=1 then dsSprNP.Fld('GOROD').AsBoolean:=true else dsSprNP.Fld('GOROD').AsBoolean:=false;
              dsSprNP.Fld('NOT_STAT').AsBoolean:=false;
              dsSprNP.Post;
            end;
            nPunkt:=dsSprNP.Fld('ID').AsInteger;
          end else begin
            writedebug('ошибка n=0: '+s);
          end;
        end else if sl.Count=2 then begin  // Город Кобрин
          s1:='г.Кобрин';
          s2:=sl.Strings[0];
          s3:=sl.Strings[1];
          nPunkt:=nPunkt1;
        end else  begin  
          writedebug('ошибка sl.Count: '+s);
        end
        //-------------- улица ----------------------------------
        s2:=Trim(s2);
        m:=getPos(s2,['ул.','пр.','пер.','пл.'], nNew);
        if m=0 then begin
          i:=1;
          s:=s2;
        end else if Copy(s2,1,4)='пер.' then begin
          i:=3;
          s:=Copy(s2,5,100);
        end else if Copy(s2,1,3)='ул.' then begin
          i:=1;
          s:=Copy(s2,4,100);
        end else if Copy(s2,1,3)='пл.' then begin
          i:=4;
          s:=Copy(s2,4,100);
        end else if Copy(s2,1,3)='пр.' then begin
          i:=2;
          s:=Copy(s2,4,100);
        end;
        s:=Trim(s);
        if Copy(s,1,9)='Интернаци' then
          s:='Интернациональная';
        if not dbLocate(dsSprULD,'NAME;TIP',[s,i],'') then begin
//          writedebug('Ошибка: улица не найдена "'+s+'"');
          dsSprULD.Append;
          dsSprULD.Fld('NAME').AsString:=s;
          dsSprULD.Fld('TIP').AsInteger:=i;
          dsSprULD.Post;
//          nIDUL := 0;
          nIDUL := dsSprULD.Fld('ID').AsInteger; // <-------- улица ------------------
        end else begin
          nIDUL := dsSprULD.Fld('ID').AsInteger; // <-------- улица ------------------
        end;
        //-------------- дом ----------------------------------
        s3:=Trim(s3);
        m:=getPos(s3,['д.','д'], nNew);
        if (m=0) or IsAllDigit(s3) then begin
          s:=s3;
        end else begin
          s:=Trim(Copy(s3,nNew,10));
        end;
        strHouse := s;
        strKv := Trim(dsData.Fld('KV').AsString);
        strKorp := '';

        s:=Trim(dsData.Fld('FI').AsString);
        i:=Pos(' ',s);
        if i>0 then begin
          sFam:=Copy(s,1,i-1);
          s:=Copy(s,i+1,100);
          i:=Pos('.',s);
          if i>0 then begin
            sName:=Copy(s,1,i);
            sOtch:=Copy(s,i+1,100);
          end else begin
            sName:=s;
            sOtch:='';
          end;
        end else begin
          sFam:=s;
          sName:='';
          sOtch:='';
        end;
        if sFam='' then sFam:=' без фамилии';
        nAdresID:=0;
        strErr:='';
        if dmBase.FindAdres(STOD('1899-12-30',''),nPunkt,nIDUL,trim(strHouse),strKorp,trim(strKv),-1) then begin
          nAdresID:=dmBase.getFindAdresID;
        end else begin
          dmBase.AddAdres(STOD('1899-12-30',''),nPunkt,nIDUL,trim(strHouse),strKorp,trim(strKv),nAdresID,strErr);
        end;
//        dmBase.AddAdres(STOD('1899-12-30',''),nPunkt,nIDUL,strHouse,strKorp,strKv,nAdresID,strErr);
        if nAdresID>0 then begin
          dmBase.WriteValueProp('PLOSH_ALL',dsData.Fld('PO').asFloat, STOD('1899-12-30',''), nAdresID, dmBase.TypeObj_Adres,ftFloat);
          dmBase.WriteValueProp('PLOSH_GIL',dsData.Fld('PP').asFloat, STOD('1899-12-30',''), nAdresID, dmBase.TypeObj_Adres,ftFloat);
          dmBase.WriteValueProp('KOL_KOMN' ,dsData.Fld('KM').asInteger, STOD('1899-12-30',''), nAdresID, dmBase.TypeObj_Adres,ftInteger);
        end else begin
          writedebug(strErr);
        end;

        //---- добавим человека -----------------
        nID := dmBase.GetNewID(dmBase.TypeObj_Nasel);
        dsMensD.Append;
        dsMensD.Fld('ID').AsInteger:=nID;
        dsMensD.Fld('FAMILIA').AsString:=sFam;
        dsMensD.Fld('NAME').AsString:=sName;
        dsMensD.Fld('OTCH').AsString:=sOtch;
        dsMensD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
        dsMensD.Fld('PROPIS').AsBoolean:=true;
        dsMensD.Fld('PRESENT').AsBoolean:=true;
        dsMensD.Fld('CANDELETE').AsBoolean:=false;
        dsMensD.Fld('POL').AsString:='М';

        dsMensD.Fld('OTNOSH').AsString:='';
        dsMensD.Fld('FIRST').AsBoolean:=true;
        dsMensD.Fld('CITIZEN').AsInteger:=112;

        dsMensD.Post;

        nID := dmBase.GetNewID(dmBase.TypeObj_Lich);
        dsLichD.Append;
        dsLichD.Fld('ID').AsInteger:=nID;
        dsLichD.Fld('ADRES_ID').AsInteger:=nAdresID;
        dsLichD.Fld('NOMER').AsString:=PadLStr(dsData.Fld('KD').AsString,4,'0')+
                                       PadLStr(dsData.Fld('LS').AsString,4,'0');
        dsLichD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
        dsLichD.Fld('CANDELETE').AsBoolean:=false;
        dsLichD.Fld('FIRST').AsString:=dsMensD.Fld('ID').AsString;
        dsLichD.Fld('NOMER_REL').AsString:=dsLichD.Fld('NOMER').AsString;
        s:=Trim(dsData.Fld('VS').asString);
        if s='В' then begin
          i:=nID_V;
        end else if s='С' then begin
          i:=nID_S;
        end else begin
          i:=nID_G;  // государственная
        end;

        dsLichD.Fld('TYPEHOUSE').AsInteger:=i;
        if (i=nID_V) then begin
          dsLichD.Fld('OWN_HOUSE').AsBoolean:=true;
        end else begin
          dsLichD.Fld('OWN_HOUSE').AsBoolean:=false;
        end;

        dsLichD.Post;

        dsMensD.Edit;
        dsMensD.Fld('LIC_ID').AsInteger:=dsLichD.Fld('ID').AsInteger;
        dsMensD.Fld('ADRES_ID').AsInteger:=dsLichD.Fld('ADRES_ID').AsInteger;
        dsMensD.Post;

        n:=n+1;
        j:=j+1;
        if (j=100) then begin 
          ChangeMessage('Загружено:'+IntToStr(n));
          AppProcess;
          j:=0;
        end;
        dsData.Next;

      end;
      sl.Free;
      dbCloseConnect('TMP_LOAD');
      dbSetCurrentConnect(idConn);
      CloseMessage();
      ShowMessage('Загрузка завершена.'+Chr(13)+IntToStr(n)+' лиц.счетов');
    end;
    end;
  end;
end;

