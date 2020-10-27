
// загрузить ЖКХ Брест

procedure LoadSprUl_Brest;
var
  dsData,dsSprULD,dsSprNP:TDataSet;
  n,i,j:Integer;
  s:String;
begin
  dsSprULD:= dmBase.GetDataSet('SprUL');
  dsSprNP:= dmBase.GetDataSet('СпрНасПунктов');
  dbOpenConnect('TMP_LOAD','PATH=F:\ЖКХ_Брест;TYPESERVER=LOCAL');
  dsData := dbOpenSQL('select * from ulica','CHARTYPE=OEM;TABLETYPE=CDX');
  dsSprNP.First;
  if dsSprNP.Eof then begin
    dsSprNP.Append;
    dsSprNP.Fld('NAME').AsString:='Брест';
    dsSprNP.Fld('NAME_B').AsString:='Брэст';
    dsSprNP.Fld('TYPEPUNKT').AsString  := '1';
    dsSprNP.Fld('SOATO').AsString := '1401000000';
    dsSprNP.Fld('KOD').AsString   := '2495';
    dsSprNP.Fld('GOROD').AsBoolean:= true;
    dsSprNP.Fld('NOT_STAT').AsBoolean:= false;
    dsSprNP.Post;
  end;
  n:=0;
  j:=0;
  while not dsData.Eof do begin
    s:=dsData.Fld('Naim').asString;
    if Copy(s,1,3)='б-р' then begin
      i:=6;
      s:=Copy(s,4,100);
    end else if Copy(s,1,4)='наб.' then begin
      i:=20;
      s:=Copy(s,5,100);
    end else if Copy(s,1,4)='пер.' then begin
      i:=3;
      s:=Copy(s,5,100);
    end else if Copy(s,1,3)='ул.' then begin
      i:=1;
      s:=Copy(s,4,100);
    end else if Copy(s,1,3)='пл.' then begin
      i:=4;
      s:=Copy(s,4,100);
    end else if Copy(s,1,3)='пр.' then begin
      i:=2;
      s:=Copy(s,4,100);
    end;
    s:=Trim(s);
    if not dbLocate(dsSprULD,'NAME;TIP',[s,i],'') then begin
      dsSprULD.Append;
      dsSprULD.Fld('NAME').AsString:=s;
      dsSprULD.Fld('TIP').AsInteger:=i;
      dsSprULD.Post;
    end;
    dsData.Next;
  end;
  dbClose(dsData);
  dbCloseConnect('TMP_LOAD');
  dbSetCurrentConnect(idConn);
end;

procedure LoadGKH_Brest;
var
  dsMensLgotD,dsSprLgotD,dsMatStenD,dsSprSoato, dsSprNP, dsSprOtnD, dsSprULD,dsMensD,dsLichD,dsAdresD : TDataSet;
  dsLgotS,dsSelS,dsData,dsGilFondS,dsGragS,dsNationS,dsPunktS,dsMensS,dsUlS, dsStatS : TDataSet;
  i,j,n,nID,nAdresID,nGlava,nPunkt,nIDUL,nGES : Integer;
  s,strErr,strDir, strHouse, strKv, strKorp, strNameUL : String;
  strSQL,sFam,sName,sOtch:String;
  sl:TstringList;
  d : TDateTime;
  lOk : Boolean;
  f  : TfmParamQuest;
begin
//  strDir := ChoiceDir('Выберите папку с данными','');
//  if strDir='' then begin
//    strDir:='F:\ЖКХ_Брест';
//  end;
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Параметры';
  f.AddParamEx(GlobalTask.GetLastValueAsString('DIR') , 'Путь к файлам' , 'DIR' ,'TYPE=DIR');
  f.AddParamEx(StrToInt(Copy(GlobalTask.ParamAsString('KOD'),9,2)) , 'Номер ЖЭС' , 'GES' ,'');
  f.AddButtons('Выполнить~Отказ',0);
  n := f.ShowQuest;
  strDir:='';
  if n = 1 then begin
    nGES:=f.GetValue('GES','N');
    strDir:=f.GetValue('DIR','C');
  end;
  f.Free;
  if (strDir<>'') and (nGes>0) and (nGES<14) then begin 
    GlobalTask.SetLastValueAsString('DIR', strDir);
    GlobalTask.SetLastValueAsInteger('GES', nGES);
    lOk := false;
    if FileExists(strDir+'\ad_dom.dbf') and FileExists(strDir+'\kvp.dbf') 
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
      dbOpenConnect('TMP_LOAD','PATH='+strDir+';TYPESERVER=LOCAL');
      strSQL:='select k.RU, k.DU, cast(SCET as SQL_INTEGER) SCET, ad.p_tip, tu.s_naim, ad.p_ulica, ul.naim, '+
              'P_DOM, KV_N, KOM, FIO, PL, PL_J, PL_O, STATUS, DGV, TELEFON, ETAJ '+
              ' from kvp k '+
              ' left join ad_dom ad on substring(scet,1,4)=ad.dom '+
              ' left join t_ulica tu on tu.kod=ad.p_tip '+
              ' left join ulica ul on ul.kod=ad.p_ulica '+
              ' where k.du='+QStr(PadLInt(nGES,2,'0'));
      dsData := dbOpenSQL(strSQL,'CHARTYPE=OEM;TABLETYPE=CDX');
      if dsData=nil then begin
        writedebug(dbLastError());
        CloseMessage;
        exit;
      end;
      dsSprNP.First;
      nPunkt:=dsSprNP.Fld('ID').AsInteger; // <---------- нас. пункт --------------
      sl := TStringList.Create;
      n:=0;
      j:=0;
      while not dsData.Eof do begin
        s:=dsData.Fld('Naim').asString;
        if Copy(s,1,3)='б-р' then begin
          i:=6;
          s:=Copy(s,4,100);
        end else if Copy(s,1,4)='наб.' then begin
          i:=20;
          s:=Copy(s,5,100);
        end else if Copy(s,1,4)='пер.' then begin
          i:=3;
          s:=Copy(s,5,100);
        end else if Copy(s,1,3)='ул.' then begin
          i:=1;
          s:=Copy(s,4,100);
        end else if Copy(s,1,3)='пл.' then begin
          i:=4;
          s:=Copy(s,4,100);
        end else if Copy(s,1,3)='пр.' then begin
          i:=2;
          s:=Copy(s,4,100);
        end;
        s:=Trim(s);
        if not dbLocate(dsSprULD,'NAME;TIP',[s,i],'') then begin
          PutError('Ошибка: улица не найдена "'+dsData.Fld('Naim').asString+'"'+'   л.с.'+dsData.Fld('SCET').AsString);
//          dsSprULD.Append;
//          dsSprULD.Fld('NAME').AsString:=s;
//          dsSprULD.Fld('TIP').AsInteger:=i;
//          dsSprULD.Post;
          nIDUL := 0;
        end else begin
          nIDUL := dsSprULD.Fld('ID').AsInteger; // <-------- улица ------------------
        end;
        strHouse := Trim(dsData.Fld('P_DOM').AsString);
        strKv := Trim(dsData.Fld('KV_N').AsString);
        strKorp := '';

        s:=Trim(dsData.Fld('FIO').AsString);
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
        dmBase.AddAdres(STOD('1899-12-30',''),nPunkt,nIDUL,strHouse,strKorp,strKv,nAdresID,strErr);
        if nAdresID>0 then begin
          if dbLocate(dsAdresD,'DATE_FIKS;ID',[STOD('1899-12-30',''),nAdresID],'') then begin
            dsAdresD.Edit;
            dsAdresD.Fld('GILFOND').AsInteger:=1;
            dsAdresD.Fld('ETAG').AsString:=dsData.Fld('ETAJ').AsString;
            dsAdresD.Fld('KOL_ETAG').AsString:='';
            if AnsiUpperCase(dsData.Fld('RU').AsString)='Л' 
              then dsAdresD.Fld('RAION').AsString:='365'
              else dsAdresD.Fld('RAION').AsString:='368';
            dsAdresD.Post;
          end;
          dmBase.WriteValueProp('PLOSH_ALL',dsData.Fld('PL_O').asFloat, STOD('1899-12-30',''), nAdresID, dmBase.TypeObj_Adres,ftFloat);
          dmBase.WriteValueProp('PLOSH_GIL',dsData.Fld('PL_J').asFloat, STOD('1899-12-30',''), nAdresID, dmBase.TypeObj_Adres,ftFloat);
          dmBase.WriteValueProp('KOL_KOMN' ,dsData.Fld('KOM').asInteger, STOD('1899-12-30',''), nAdresID, dmBase.TypeObj_Adres,ftInteger);
        end else begin
          PutError(strErr);
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
        dsLichD.Fld('NOMER').AsString:=dsData.Fld('SCET').AsString;
        dsLichD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
        dsLichD.Fld('CANDELETE').AsBoolean:=false;
        dsLichD.Fld('FIRST').AsString:=dsMensD.Fld('ID').AsString;

        s:=Trim(dsData.Fld('STATUS').asString);
        if s='В' then begin
          i:=2;
        end else if s='Л' then begin
          i:=3;
        end else if s='П' then begin
          i:=4;
        end else if s='Ц' then begin
          i:=5;
        end else if s='И' then begin
          i:=6;
        end else if s='Щ' then begin
          i:=7;
        end else if (s='Ж') or (s='К') then begin
          i:=8;
        end else if (s<>'') then begin
          i:=0;
        end else begin
          i:=1;  // государственная
        end;

        dsLichD.Fld('TYPEHOUSE').AsInteger:=i;
        if (i=8) or (i=2) then begin
          dsLichD.Fld('OWN_HOUSE').AsBoolean:=true;
        end else begin
          dsLichD.Fld('OWN_HOUSE').AsBoolean:=false;
        end;
        dsLichD.Fld('TELEFON').AsString:=dsData.Fld('TELEFON').asString;

        dsLichD.Post;

        // запишем в базу свойств ДОГОВОР
        dmBase.WriteValueProp('DOGOVOR',dsData.Fld('DGV').asString, STOD('1899-12-30',''), nID, dmBase.TypeObj_Lich,ftMemo);

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

