
procedure LoadVileika;
var
  dsMensLgotD,dsSprLgotD,dsMatStenD,dsSprSoato, dsSprNP, dsSprOtnD, dsSprULD,dsMensD,dsLichD,dsAdresD : TDataSet;
  dsLgotS,dsSelS,dsMatStenS,dsGilFondS,dsGragS,dsNationS,dsPunktS,dsMensS,dsUlS, dsStatS : TDataSet;
  i,n,nID,nAdresID,nGlava,nPunkt,nIDUL : Integer;
  s,strErr,strDir, strHouse, strKv, strKorp, strNameUL : String;
  d : TDateTime;
  lOk : Boolean;
begin
  strDir := ChoiceDir('Выберите папку с данными','');
  if strDir='' then begin
    strDir:='F:\Projects\SelSovet\Вилейка';
  end;
  if (strDir<>'') then begin //	and FileExists(strDir+'\mens.dbf') then begin
    lOk := false;
    if FileExists(strDir+'\mens.dbf') and FileExists(strDir+'\punkt.dbf') 
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
      OpenMessage('Загрузка данных ...','',10);

      dbExecuteSQL('DELETE FROM СпрУлиц');
      dbExecuteSQL('DELETE FROM СпрНасПунктов');
      dbExecuteSQL('DELETE FROM СпрОтношений');
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
      dbExecuteSQL('DELETE FROM СпрЛьготников');
      dbExecuteSQL('DELETE FROM СпрМатериалСтен');
      dbOpenConnect('Vileika','PATH='+strDir+';TYPESERVER=LOCAL');
      dsMensS := dbOpen('mens.dbf','CHARTYPE=ANSI;TABLETYPE=CDX');
      dsUlS   := dbOpen('ul.dbf','CHARTYPE=ANSI;TABLETYPE=CDX');
      dsStatS := dbOpen('status.dbf','CHARTYPE=ANSI;TABLETYPE=CDX');
      dsPunktS:= dbOpen('punkt.dbf','CHARTYPE=ANSI;TABLETYPE=CDX');
      dsGragS := dbOpen('citizen.dbf','CHARTYPE=ANSI;TABLETYPE=CDX');
      dsNationS:= dbOpen('national.dbf','CHARTYPE=ANSI;TABLETYPE=CDX');
      dsGilFondS:= dbOpen('gilfond.dbf','CHARTYPE=ANSI;TABLETYPE=CDX');
      dsMatStenS:= dbOpen('matsten.dbf','CHARTYPE=ANSI;TABLETYPE=CDX');
      dsSelS:= dbOpen('sel.dbf','CHARTYPE=ANSI;TABLETYPE=CDX');
      dsLgotS:= dbOpen('lgot.dbf','CHARTYPE=ANSI;TABLETYPE=CDX');
      //----- загрузим справочник льготников -----
      while not dsLgotS.Eof do begin
        if ANSILowerCase(dsLgotS.Fld('KAT_NAME').AsString)<>'нет' then begin
          dsSprLgotD.Append;
          dsSprLgotD.Fld('NAME').AsString := dsLgotS.Fld('KAT_NAME').AsString;
          dsSprLgotD.Post;
        end;
        dsLgotS.Next;
      end;
      //----- загрузим справочник отношений -----
      nGlava := 0;
      while not dsStatS.Eof do begin
        if ANSILowerCase(dsStatS.Fld('STATUS_NAMEC').AsString)<>'глава хозяйства' then begin
          dsSprOtnD.Append;
          dsSprOtnD.Fld('NAME').AsString := dsStatS.Fld('STATUS_NAMEC').AsString;
          dsSprOtnD.Post;
        end else begin
          nGlava := dsStatS.Fld('ID').AsInteger;
        end;
        dsStatS.Next;
      end;
      //------- загрузим справочник нас. пунктов -------------
      while not dsPunktS.Eof do begin
        dsSprNP.Append;
        dsSprNP.Fld('NAME').AsString  := dsPunktS.Fld('NAME').AsString;
        dsSprNP.Fld('SOATO').AsString := dsPunktS.Fld('SOATO').AsString;
        if dbLocate(dsSprSOATO,'KOD',[dsPunktS.Fld('SOATO').AsString],'') then begin
          dsSprNP.Fld('KOD').AsString   := dsSprSOATO.Fld('ID').AsString;
        end;
        dsSprNP.Fld('GOROD').AsBoolean:= false;
        dsSprNP.Fld('NOT_STAT').AsBoolean:= false;
        dsSprNP.Post;
        dsPunktS.Next;
      end;
      //--------------------
      i:=0;
      while not dsMensS.Eof do begin
        strHouse := Trim(dsMensS.Fld('N_HOUSE').AsString);
        if strHouse='0' then strHouse:='';
        strKv := Trim(dsMensS.Fld('N_KVARTIR').AsString);
        if strKv='0' then strKv:='';
        strKorp := Trim(dsMensS.Fld('N_KORPUS').AsString);
        if strKorp='0' then strKorp:='';

        if (dsMensS.Fld('STATUS_PROPN').AsInteger=1) and 
           (dsMensS.Fld('N_LSCHET').AsInteger<>0) and (strHouse<>'') then begin
          //------ проверим улицу -----
          if dbLocate(dsUlS,'KUL',[dsMensS.Fld('KOD_STREET').AsInteger],'')
            then strNameUL := Trim(dsULS.Fld('ULICA').AsString)
            else strNameUL := Trim(dsMensS.Fld('KOD_STREET').AsString);
          if strNameUL='0' then begin
            nIDUL := 0;
          end else begin
            if not dbLocate(dsSprULD,'NAME',[strNameUL],'') then begin
              dsSprULD.Append;
              dsSprULD.Fld('NAME').AsString:=strNameUL;
              dsSprULD.Fld('TIP').AsInteger:=1;
              dsSprULD.Post;
            end;
            nIDUL := dsSprULD.Fld('ID').AsInteger;
          end;
          //---- сформируем адрес ------------------
          nPunkt:=0;
          if dbLocate(dsSprNP,'SOATO',[dsMensS.Fld('SOATO').AsString],'') then begin
            nPunkt:= dsSprNP.Fld('ID').AsInteger;
          end else begin
            PutError('Не найден СОАТО: '+dsMensS.Fld('SOATO').AsString);
          end;
          nAdresID:=0;
          strErr:='';
          dmBase.AddAdres(STOD('1899-12-30',''),nPunkt,nIDUL,strHouse,strKv,strKorp,nAdresID,strErr);
          //---- добавим человека -----------------
          nID := dmBase.GetNewID(dmBase.TypeObj_Nasel);
          dsMensD.Append;
          dsMensD.Fld('ID').AsInteger:=nID;
          dsMensD.Fld('FAMILIA').AsString:=dsMensS.Fld('FAMILY').AsString;
          dsMensD.Fld('NAME').AsString:=dsMensS.Fld('FIRSTNAME').AsString;
          dsMensD.Fld('OTCH').AsString:=dsMensS.Fld('LASTNAME').AsString;
          dsMensD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
          dsMensD.Fld('PROPIS').AsBoolean:=true;
          dsMensD.Fld('PRESENT').AsBoolean:=true;
          dsMensD.Fld('CANDELETE').AsBoolean:=false;

          dsMensD.Fld('POL').AsString:=dsMensS.Fld('SEX').AsString;
          dsMensD.Fld('DATER').Value:=dsMensS.Fld('DATAAGE').Value;
          dsMensD.Fld('DATEP').Value:=dsMensS.Fld('DATE_PROP').Value;
          dsMensD.Fld('TELEFON').AsString:=dsMensS.Fld('NUM_PHONE').AsString;

          dsMensD.Fld('LICH_NOMER').AsString:=dsMensS.Fld('PERS_NUM').AsString;
          dsMensD.Fld('PASP_SERIA').AsString:=dsMensS.Fld('SERIYA_DOC').AsString;
          dsMensD.Fld('PASP_NOMER').AsString:=dsMensS.Fld('N_DOC').AsString;
          dsMensD.Fld('PASP_DATE').Value:=dsMensS.Fld('DATE_V_DOC').Value;

          if dsMensS.Fld('ORG_V_DOC').AsString<>'' then
            dmBase.WriteFieldProp( d, 'PASP_VIDAN', dsMensS.Fld('ORG_V_DOC'), nID, dmBase.TypeObj_Nasel, ftMemo);

          dsMensD.Fld('OTNOSH').AsString:='';
          dsMensD.Fld('FIRST').AsBoolean:=false;
          if nGlava<>dsMensS.Fld('IDSTATFAM').AsInteger then begin
            if dbLocate(dsStatS, 'ID', [dsMensS.Fld('IDSTATFAM').AsInteger], '') then begin
              if dbLocate(dsSprOtnD, 'NAME', [dsStatS.Fld('STATUS_NAMEC').AsString], '') then begin
                dsMensD.Fld('OTNOSH').AsInteger:=dsSprOtnD.Fld('ID').AsInteger;
              end;
            end;
          end;

          if dbLocate(dsLgotS, 'ID', [dsMensS.Fld('ID_KAT_LGOTN').AsInteger], '') then begin
            if dbLocate(dsSprLgotD, 'NAME', [dsLgotS.Fld('KAT_NAME').AsString], '') then begin
              dsMensLgotD.Append;
              dsMensLgotD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
              dsMensLgotD.Fld('ID').AsInteger  := dsMensD.Fld('ID').AsInteger;
              dsMensLgotD.Fld('KOD').AsInteger := dsSprLgotD.Fld('ID').AsInteger;
              dsMensLgotD.Post;
            end;
          end;


          if dbLocate(dsNationS,'ID',[dsMensS.Fld('ID_NATIONALN').AsString],'') then begin
            s := dsNationS.Fld('NATIONAL').asString;
            n:=0;
            if copy(s,1,5)='белор' then n:=3;
            if copy(s,1,5)='русск' then n:=1;
            if copy(s,1,3)='укр'   then n:=2;
            if copy(s,1,4)='поля'  then n:=173;
            if copy(s,1,4)='лито'  then n:=8;
            if copy(s,1,3)='евр'   then n:=57;
            if copy(s,1,3)='нем'   then n:=171;
            if n>0 then dsMensD.Fld('NATION').AsInteger:=n;
          end;
          if dbLocate(dsGragS,'ID',[dsMensS.Fld('ID_GRAJDAN').AsString],'') then begin
            s := ANSIUpperCase(dsGragS.Fld('GRAJDAN').asString);
            n:=0;
            if pos('БЕЛАРУСЬ',s)>0 then n:=112;
            if pos('POCCИ',s)>0    then n:=643;
            if pos('УКР',s)>0      then n:=804;
            if n>0 then dsMensD.Fld('CITIZEN').AsInteger:=n;
          end;

          dsMensD.Post;

          if not dbLocate(dsLichD, 'NOMER', [dsMensS.Fld('N_LSCHET').AsString],'') then begin
            nID := dmBase.GetNewID(dmBase.TypeObj_Lich);
            dsLichD.Append;
            dsLichD.Fld('ID').AsInteger:=nID;
            dsLichD.Fld('ADRES_ID').AsInteger:=nAdresID;
            dsLichD.Fld('NOMER').AsString:=dsMensS.Fld('N_LSCHET').AsString;
            dsLichD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
            dsLichD.Fld('OWN_HOUSE').AsBoolean:=true;
            dsLichD.Fld('CANDELETE').AsBoolean:=false;
            dsLichD.Fld('FIRST').AsString:=dsMensD.Fld('ID').AsString;
            dsLichD.Post;
          end;
          if nGlava=dsMensS.Fld('IDSTATFAM').AsInteger then begin
            dsLichD.Edit;
            dsLichD.Fld('FIRST').AsString:=dsMensD.Fld('ID').AsString;
            dsLichD.Post;
            dsMensD.Edit;
            dsMensD.Fld('OTNOSH').AsString:='';
            dsMensD.Fld('FIRST').AsBoolean:=true;
            dsMensD.Post;
          end;
          dsMensD.Edit;
          dsMensD.Fld('LIC_ID').AsInteger:=dsLichD.Fld('ID').AsInteger;
          dsMensD.Fld('ADRES_ID').AsInteger:=dsLichD.Fld('ADRES_ID').AsInteger;
          dsMensD.Post;
          if dbLocate(dsSelS, 'ID_PERS', [dsMensS.Fld('ID_REC').AsString], '') then begin
            nID := dsLichD.Fld('ID').AsInteger;
            d   := STOD('1899-12-30','');
            dmBase.WriteFieldProp( d, 'VSEGO', dsSelS.Fld('SZ_VSEGO'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'SOBST', dsSelS.Fld('SZ_PRIVAT'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'POSTR', dsSelS.Fld('SZ_HOST'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'POSEV', dsSelS.Fld('SP_VSEGO'), nID, dmBase.TypeObj_Lich, ftFloat);

            dmBase.WriteFieldProp( d, 'POSEV_ZERN', dsSelS.Fld('SP_ZERNO'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'POSEV_KART', dsSelS.Fld('SP_KARTOF'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'POSEV_OV', dsSelS.Fld('SP_OVOS'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'POSEV_OVZ', dsSelS.Fld('SP_TEPLIC'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'POSEV_KORM', dsSelS.Fld('SP_KORN'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'POSEV_TRAV', dsSelS.Fld('SP_TRAV'), nID, dmBase.TypeObj_Lich, ftFloat);

            dmBase.WriteFieldProp( d, 'PR_SERNO', dsSelS.Fld('PR_ZERNO'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'PR_KART', dsSelS.Fld('PR_KARTOF'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'PR_OVOCHI', dsSelS.Fld('PR_OV_VS'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'PR_OVOCH_Z', dsSelS.Fld('PR_OVTEPL'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'PR_KORNPL', dsSelS.Fld('PR_K_KORN'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'PR_PLOD', dsSelS.Fld('PR_PLODY'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'PR_JAGOD', dsSelS.Fld('PR_YAGOD'), nID, dmBase.TypeObj_Lich, ftFloat);

            dmBase.WriteFieldProp( d, 'BIG_ENIMAL', dsSelS.Fld('NA_KRUPVS'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'KOROVA', dsSelS.Fld('NA_KOROV'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'TELKI1', dsSelS.Fld('NA_MOLOD'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'SVINI', dsSelS.Fld('NA_SVIN'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'OVCI', dsSelS.Fld('NA_OVCY'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'KOZI', dsSelS.Fld('NA_KOZY'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'KOZIMAT', dsSelS.Fld('NA_KOZMAT'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'LOSHADI', dsSelS.Fld('NA_LOSHAD'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'PTICA', dsSelS.Fld('NA_PTICY'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'KROL', dsSelS.Fld('NA_KROLY'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'PCHELI', dsSelS.Fld('NA_PCHEL'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'PUSH', dsSelS.Fld('NA_ZVER'), nID, dmBase.TypeObj_Lich, ftFloat);

            dmBase.WriteFieldProp( d, 'MEAT', dsSelS.Fld('PA_SKOTPT'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'K_MEAT', dsSelS.Fld('PA_KRSKOT'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'S_MEAT', dsSelS.Fld('PA_SVIN'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'P_MEAT', dsSelS.Fld('PA_PROCH'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'KOR_MOLOKO', dsSelS.Fld('PA_MOLKOR'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'KOZ_MOLOKO', dsSelS.Fld('PA_MOLKOZ'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'JAICA', dsSelS.Fld('PA_YAIC'), nID, dmBase.TypeObj_Lich, ftFloat);
            dmBase.WriteFieldProp( d, 'MED', dsSelS.Fld('PA_MED'), nID, dmBase.TypeObj_Lich, ftFloat);
          end;
          if dbLocate(dsGilFondS, 'ID_PERS', [dsMensS.Fld('ID_REC').AsString], '') then begin
            nID := dsLichD.Fld('ADRES_ID').AsInteger;
            d   := STOD('1899-12-30','');
            dmBase.WriteFieldProp( d, 'GOD_VOZV', dsGilFondS.Fld('YEARBUILD'), nID, dmBase.TypeObj_Adres, ftInteger);
            dmBase.WriteFieldProp( d, 'PLOSH_ZDAN', dsGilFondS.Fld('S_HOUSE'), nID, dmBase.TypeObj_Adres, ftFloat);
            dmBase.WriteFieldProp( d, 'PLOSH_ALL', dsGilFondS.Fld('S_KVAR'), nID, dmBase.TypeObj_Adres, ftFloat);
            dmBase.WriteFieldProp( d, 'PLOSH_GIL', dsGilFondS.Fld('S_LIVING'), nID, dmBase.TypeObj_Adres, ftFloat);
            dmBase.WriteFieldProp( d, 'GAZ', dsGilFondS.Fld('GAS_NATUR'), nID, dmBase.TypeObj_Adres, ftBoolean);
            dmBase.WriteFieldProp( d, 'GID_GAZ', dsGilFondS.Fld('GAS_LIQUEF'), nID, dmBase.TypeObj_Adres, ftBoolean);
            dmBase.WriteFieldProp( d, 'KOL_KOMN', dsGilFondS.Fld('N_ROOM'), nID, dmBase.TypeObj_Adres, ftInteger);
            dmBase.WriteFieldProp( d, 'VODOPROV', dsGilFondS.Fld('WATER'), nID, dmBase.TypeObj_Adres, ftBoolean);
            dmBase.WriteFieldProp( d, 'KANALIZ', dsGilFondS.Fld('KANALIZ'), nID, dmBase.TypeObj_Adres, ftBoolean);
            dmBase.WriteFieldProp( d, 'CENT_OTOP', dsGilFondS.Fld('C_HEATING'), nID, dmBase.TypeObj_Adres, ftBoolean);
            dmBase.WriteFieldProp( d, 'GOR_VODA', dsGilFondS.Fld('HOT_WATER'), nID, dmBase.TypeObj_Adres, ftBoolean);
            dmBase.WriteFieldProp( d, 'VANNA', dsGilFondS.Fld('BATHDOUCH'), nID, dmBase.TypeObj_Adres, ftBoolean);
            dmBase.WriteFieldProp( d, 'EL_PLIT', dsGilFondS.Fld('ELECTRANGE'), nID, dmBase.TypeObj_Adres, ftBoolean);
            dmBase.WriteFieldProp( d, 'KOLODEC', dsGilFondS.Fld('WATERWELL'), nID, dmBase.TypeObj_Adres, ftBoolean);
            if dbLocate(dsMatStenS, 'ID_MAT', [dsGilFondS.Fld('IDMATERIAL').AsString], '') then begin
              if not dbLocate(dsMatStenD, 'NAME', [dsMatStenS.Fld('MATERIAL').AsString], '') then begin
                dsMatStenD.Append;
                dsMatStenD.Fld('NAME').AsString := dsMatStenS.Fld('MATERIAL').AsString;
                dsMatStenD.Post;
              end;
              dmBase.WriteFieldProp( d, 'MAT_STEN', dsMatStenD.Fld('ID'), nID, dmBase.TypeObj_Adres, ftString);
            end;
          end;
          i:=i+1;
        end;
        dsMensS.Next;
      end;
      dsMensS.Close;
      dsUlS.Close;
      dsStatS.Close;
      dsPunktS.Close;
      dsGragS.Close;
      dsNationS.Close;
      dsGilFondS.Close;
      dsMatStenS.Close;
      dsSelS.Close;
      dsLgotS.Close;
      dbCloseConnect('Vileika');
      dbSetCurrentConnect(idConn);
      CloseMessage();
      ShowMessage('Загрузка завершена.');
    end;
    end;
  end;
end;

