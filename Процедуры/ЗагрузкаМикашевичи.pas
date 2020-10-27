// загрузить ЖКХ Микашевичи
procedure LoadMikash;
var
  dsMensLgotD,dsSprLgotD,dsMatStenD,dsSprSoato, dsSprNP, dsSprOtnD, dsSprULD,dsMensD,dsLichD,dsAdresD : TDataSet;
  dsLgotS,dsSelS,dsData,dsGilFondS,dsGragS,dsNationS,dsPunktS,dsMensS,dsUlS, dsStatS : TDataSet;
  i,n,nID,nAdresID,nGlava,nPunkt,nIDUL : Integer;
  s,strErr,strDir, strHouse, strKv, strKorp, strNameUL : String;
  strSQL,sFam,sName,sOtch:String;
  sl:TstringList;
  d : TDateTime;
  lOk : Boolean;
begin
  strDir := ChoiceDir('Выберите папку с данными','');
  if strDir='' then begin
    strDir:='F:\Projects\SelSovet7\Mik\Data';
  end;
  if (strDir<>'') then begin //	and FileExists(strDir+'\mens.dbf') then begin
    lOk := false;
    if FileExists(strDir+'\lss.dbf') and FileExists(strDir+'\kvs.dbf') 
      then lOk:=true
      else PutError('Не найдены файлы для загрузки.');
    if lOk then begin
      s := '';
      s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
      s := s + 'После выполнения загрузки текущая информация'#13;
      s := s + 'в базе будет уничтожена.'#13;
      s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
      s := s + 'введите слово ДА в поле ввода'#13;
      lOk := OkWarning(s);
    end;
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
    if (dsMensD<>nil) and Problem(' Начнем загрузку ? ') then begin
//      WriteDebug('Загрузка ...');
//      WriteDebug('предварительное удаление ...');
      OpenMessage('Загрузка данных ...             ','',10);

//      dbExecuteSQL('DELETE FROM СпрУлиц');
//      dbExecuteSQL('DELETE FROM СпрНасПунктов');
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
      dbOpenConnect('Vileika','PATH='+strDir+';TYPESERVER=LOCAL');
      strSQL:='select * from lss l '+
         'left join ( '+
         'select kvid, kvname, kvrm, hsid, hsname, stid, stname, r.regid, kod, s_naim, naim, r.regname, r.tip, r.soato from '+
         '( '+
            'select kvid, kvname, kvrm, hsid, hsname, kk.stid, stname, regid, s.kod, st.s_naim, st.naim from '+
            '( '+
           'select kvid, kvname, kvrm, h.hsid, h.hsname, stid from kvs k '+
           'left join hss h on k.hsid=h.hsid '+
            ') kk '+
          'left join streets s on s.stid=kk.stid '+
          'left join st_naim st on s.kod=st.kod '+
          ') kkk '+
          'left join regions r on kkk.regid=r.regid '+
          ') kkkk on l.kvid=kkkk.kvid ';
      dsData := dbOpenSQL(strSQL,'CHARTYPE=ANSI;TABLETYPE=CDX');
      if dsData=nil then begin
        writedebug(dbLastError());
        CloseMessage;
        exit;
      end;
      sl := TStringList.Create;

//  lsid, lsfio, privat, jilpl, rooms
// kvid, kvname, kvrm, hsid, hsname, stid, stname, r.regid, kod, s_naim, naim, 
// r.regname, r.tip, r.soato
      n:=0;
      while not dsData.Eof do begin
        if not dbLocate(dsSprNP, 'NAME', [dsData.Fld('RegName').asString], '') then begin
          dsSprNP.Append;
          dsSprNP.Fld('NAME').AsString  := dsData.Fld('REGNAME').AsString;
          if dsSprNP.Fld('NAME').AsString='Микашевичи'
            then dsSprNP.Fld('TYPEPUNKT').AsString  := '1'
            else dsSprNP.Fld('TYPEPUNKT').AsString  := '2';
          dsSprNP.Fld('SOATO').AsString := '';
          dsSprNP.Fld('KOD').AsString   := '';
          dsSprNP.Fld('GOROD').AsBoolean:= false;
          dsSprNP.Fld('NOT_STAT').AsBoolean:= false;
          dsSprNP.Post;
        end;
        nPunkt:=dsSprNP.Fld('ID').AsInteger; // <---------- нас. пункт --------------
        if not dbLocate(dsSprULD,'NAME',[dsData.Fld('StName').asString],'') then begin
          dsSprULD.Append;
          dsSprULD.Fld('NAME').AsString:=dsData.Fld('StName').asString;
          dsSprULD.Fld('TIP').AsInteger:=1;
          if dsData.Fld('KOD').asString<>'1' then dsSprULD.Fld('TIP').AsInteger:=3; // переулок
          dsSprULD.Post;
        end;
        nIDUL := dsSprULD.Fld('ID').AsInteger; // <-------- улица ------------------

        strHouse := Trim(dsData.Fld('HSNAME').AsString);
        strKv := Trim(dsData.Fld('KVNAME').AsString);
        strKorp := '';

        s:=Trim(dsData.Fld('LSFIO').AsString);
        sl.Clear;
        StrToStrings(s, sl, ' ');
        if sl.Count>2 then begin
          sFam := sl[0];            // <----- ФИО --------------------
          sName:= sl[1];
          sOtch:= sl[2];
        end else begin
          if sl.Count=2 then begin
            sFam := sl[0];          
            sName:= sl[1];
            sOtch:='';
          end else begin
            sFam := dsData.Fld('LSFIO').AsString;
            sName:= '';
            sOtch:= '';
          end;
        end;

        nAdresID:=0;
        strErr:='';

        dmBase.AddAdres(STOD('1899-12-30',''),nPunkt,nIDUL,strHouse,strKorp,strKv,nAdresID,strErr);

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
        dsLichD.Fld('NOMER').AsString:=dsData.Fld('LSID').AsString;
        dsLichD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
        dsLichD.Fld('OWN_HOUSE').AsBoolean:=dsData.Fld('PRIVAT').AsBoolean;
        dsLichD.Fld('CANDELETE').AsBoolean:=false;
        dsLichD.Fld('FIRST').AsString:=dsMensD.Fld('ID').AsString;
        dsLichD.Post;

        dsMensD.Edit;
        dsMensD.Fld('LIC_ID').AsInteger:=dsLichD.Fld('ID').AsInteger;
        dsMensD.Fld('ADRES_ID').AsInteger:=dsLichD.Fld('ADRES_ID').AsInteger;
        dsMensD.Post;

        nID := dsLichD.Fld('ADRES_ID').AsInteger;
        d := STOD('1899-12-30','');
        dmBase.WriteFieldProp( d, 'PLOSH_GIL', dsData.Fld('JILPL'), nID, dmBase.TypeObj_Adres, ftFloat);
        dmBase.WriteFieldProp( d, 'KOL_KOMN', dsData.Fld('ROOMS'), nID, dmBase.TypeObj_Adres, ftInteger);
        n:=n+1;
//        if (n div 100) = 0 then begin 
          ChangeMessage('Загружено записей :'+IntToStr(n));
          AppProcess;
//        end;
       dsData.Next;

      end;
      sl.Free;
      dbCloseConnect('Vileika');
      dbSetCurrentConnect(idConn);
      CloseMessage();
      ShowMessage('Загрузка завершена.'+Chr(13)+IntToStr(n)+' лиц.счетов');
    end;
    end;
  end;
end;

