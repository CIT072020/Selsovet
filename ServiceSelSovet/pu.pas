//------------------------------------------------------------------
procedure CreateNalogZ;
var
  f  : TfmParamQuest;
  n, nGod, iRound, iNalog  : Integer;
  dDateVist, dDateSrok : TDateTime;
  nStavka,nZeml : Extended;
  ds,dsNalogi : TDataSet;
begin
  iRound := GlobalTask.ParamAsInteger('ROUND');
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите значения';
//  f.StepY:=17;
//  f.Flat:=false;
//  f.AddParamEx(1  , 'Налог'               , 'NALOG','TYPE=LOOKUP~DESC=LOOKUP_NALOGI~WIDTH=250');
  n := StrToInt(FormatDateTime('YYYY', GlobalTask.CurrentDate));
  f.AddParamEx(n      , 'За какой год'    , 'YEAR'    ,'TYPE=LIST~DESC=KEY_YEARS');
  f.AddParamEx(Now    , 'Дата начисления' , 'DATEVIS' ,'TYPE=DATE');
  f.AddParamEx('EMPTY', 'Срок оплаты'     , 'SROK'    ,'TYPE=DATE');
  f.AddParamEx(GlobalTask.ParamAsFloat('STAVKA_ZEM'), 'Ставка земельного налога' , 'STAVKA','FORMAT=###');

//  f.AddParamEx(0, 'Сумма', '4','FORMAT=### ### ### ###.##');
//  f.AddParamEx(2, 'List', '4','TYPE=LIST~DESC=KEY_TYPE_OBJ~WIDTH=100');
//  f.AddParamEx(6, 'Spr', '5','TYPE=SPR~DESC=LOOKUP_EDIZM~WIDTH=50~DOPSHOW=NAME');
//  f.AddParamEx(8, 'LookUp', '11','TYPE=LOOKUP~DESC=LOOKUP_EDIZM~WIDTH=350');
  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    dDateVist:= f.GetValue('DATEVIS','D');
    dDateSrok:= f.GetValue('SROK','D');
    nStavka  := f.GetValue('STAVKA','N');
    nGod     := f.GetValue('YEAR','N');
    iNalog := 1; // налог на землю
    f.Free;
    ds := dbGetDataSet('fmGurnAlfKn.Query');
    if ds<>nil then ds.DisableControls;
    OpenMessage('Расчет земельного налога ...','',10);
    Globaltask.WriteToLogFile('Расчет земельного налога за '+IntToStr(nGod),nil);
    dsNalogi := dbGetDataSet('dmBase.tbNalogi');
    if (ds <> nil) and (dsNalogi<>nil) then begin
      dbSetIndex(dsNalogi, 'PR_KEY');
      ds.First;
      try
        while not ds.Eof do begin
          // прочитаем реквизит всего земли
          nZeml := dmBase.ReadPropAsFloat(ds.Fld('DATE_FIKS').AsDateTime,
                                      ds.Fld('ID').AsInteger, 'VSEGO');
          if nZeml > 0 then begin  // если есть земля
            if not dbLocate(dsNalogi, 'DATE_FIKS;TYPEOBJ;ID;GOD;NALOG',[ds.Fld('DATE_FIKS').AsDateTime,_TypeObj_Lich,ds.Fld('ID').AsInteger,nGod,iNalog], '') then begin
//            if not dbFindKey(dsNalogi, [ds.Fld('DATE_FIKS').AsDateTime,_TypeObj_Lich,ds.Fld('ID').AsInteger,nGod,iNalog], true) then begin
//              writedebug(ds.Fld('DATE_FIKS').AsString+', '+inttostr(_typeobj_lich)+', '+ds.Fld('ID').AsString+', '+inttostr(ngod)+', '+inttostr(inalog));
              dsNalogi.Append;
              dsNalogi.Fld('DATE_FIKS').AsDateTime := ds.Fld('DATE_FIKS').AsDateTime;
              dsNalogi.Fld('ID').AsInteger := ds.Fld('ID').AsInteger;
              dsNalogi.Fld('TYPEOBJ').AsInteger := _TypeObj_Lich;
              dsNalogi.Fld('GOD').AsInteger   := nGod; //
              dsNalogi.Fld('NALOG').AsInteger := iNalog; 
            end else begin
              dsNalogi.Edit;
            end;
            if dDateVist<>0 then dsNalogi.Fld('DATE_VIST').AsDateTime := dDateVist;
            if dDateSrok<>0 then dsNalogi.Fld('DATE_SROK').AsDateTime := dDateSrok;
            dsNalogi.Fld('SUMMA_VIST').AsFloat   := xRound(nZeml*nStavka,iRound);
//            dsNalogi.Fld('SUMMA_VIST').AsFloat   := RoundBYR(nZeml*nStavka);
            dsNalogi.Post;
          end;
          ds.Next;
        end;
      finally
        ds.First;
      end;
    end;
    if ds<>nil then ds.EnableControls;
    CloseMessage();
  end else begin
    f.Free;
  end;
//  fmMain.acSprPunktExecute(nil);
//  f.AddParamEx(false, 'Boolean', '1','TYPE=BOOLEAN');
//  f.AddParamEx('строка символов', 'String', '2','');
//  f.AddParamEx('', 'File', '8','TYPE=FILE~WIDTH=300');
//  f.AddParamEx('', 'Dir', '33','TYPE=DIR~WIDTH=300');
//  f.AddParamEx(3, 'Kvartal', '55','TYPE=KVARTAL');
//  f.AddParamEx(2, 'Month', '44','TYPE=MONTH');
end;

//------------------------------------------------------------------
procedure DeleteNalog;
var
  f  : TfmParamQuest;
  d : TDateTime;
  ds : TDataSet;
  lErr : Boolean;
  n,nGod,iNalog : Integer;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите значения';
//  f.StepY:=17;
//  f.Flat:=false;
  f.AddParamEx(1  , 'Налог'               , 'NALOG','TYPE=LOOKUP~DESC=LOOKUP_NALOGI~WIDTH=250');
  n := StrToInt(FormatDateTime('YYYY', GlobalTask.CurrentDate));
  f.AddParamEx(n      , 'За какой год'    , 'YEAR'    ,'TYPE=LIST~DESC=KEY_YEARS');
  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    nGod   := f.GetValue('YEAR','N');
    iNalog := f.GetValue('NALOG','N');
    f.Free;
    if Problem('  Вы уверены что хотите удалить ? ') then begin
      ds := dbGetDataSet('fmGurnAlfKn.Query');
      d  := ds.Fld('DATE_FIKS').AsDateTime;
      SetScreenCursor('HOURCLASS');
      lErr := not dbExecuteSQL('DELETE FROM nalogi WHERE DATE_FIKS='+DateToSQL(d)+' and TYPEOBJ='+IntToStr(_TypeObj_Lich)+
                    ' and GOD='+IntToStr(nGod)+' and NALOG='+IntToStr(iNalog));
      Globaltask.WriteToLogFile('Удаление налога ('+IntToStr(iNalog)+') за '+IntToStr(nGod),nil);
      RestScreenCursor;
      if lErr then begin
        PutError(dbLastError());
      end;
//      ds := dbGetDataSet('fmGurnAlfKn.Query');
//      dsNalogi := dmBase.GetDataSet('tbNalogi');
//      if (ds <> nil) and (dsNalogi<>nil) then begin
//        dbSetIndex(dsNalogi, 'PR_KEY');
//      ds.First;
//      try
//        while not ds.Eof do begin
//          ds.Next;
//        end;
//      finally
//        ds.First;
//      end;
    end;
  end else begin
    f.Free;
  end;
end;
//------------------------------------------------------------------
procedure ExcelListLgotEl;
var
  s,sNameExcel,sSQL:String;
  lOk:Boolean;
  XL:Variant;
  q,dsLic:TDataSet;
  ind,nFirst,nLast,n:Integer;
  eh:TExcelHelper;
  lOtn:Boolean;
begin
  XL:=GetOfficeObject('Excel',lOk);
  if lOk then begin
    sNameExcel:='Льготники на оплату ЖКУ.xls';
    XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));
    sSQL:='SELECT EN_LGOT_DATA, getFIO(Familia,Name,Otch) as FIO, n.* FROM Население n'+CRLF+
          '  LEFT JOIN  НаселениеДоп nn ON n.id=nn.id'+CRLF+
          '  WHERE date_fiks=''1899-12-30'' and EN_LGOT_DATA is not null and n.candelete=false and lic_id>0 ORDER BY n.Familia,n.Name';
    MemoWrite('export.sql',sSQL);
    OpenMessage(' Выполнение выгрузки ...      ','',10);
    q:=dbOpenSQL(sSQL,'');
    ind:=dbRecordCount(q);
    nFirst:=6;
    nLast:=nFirst+ind-1;
    XL.Range['A3'].Value:=NameOrg('','');
    XL.Range['A4'].Value:=DatePropis(Now,4);
    eh:=TExcelHelper.Create;
    eh.SetSize(ind,6);
    eh.SetRangeExcel('A'+IntToStr(nFirst),'F'+IntToStr(nLast));
    ind:=1;
    n:=0;
    dsLic := dbGetDataSet('dmBase.tbLich');
    while not q.Eof do begin
      eh.SetEl(ind,1, ind);
      eh.SetEl(ind,2, q.Fld('FIO').AsString);
      eh.SetEl(ind,3, dmBase.AdresMen(q.Fld('ID').AsString,''));
      s:=';ALL;DATER;';
      if dbLocate(dsLic,'DATE_FIKS;ID',[STOD(datecursostS,''), q.Fld('LIC_ID').AsInteger],'') then begin
        if dsLic.Fld('FIRST').AsInteger=q.Fld('ID').AsInteger then s:=s+'OTN;';
      end;
      eh.SetEl(ind,4, dmBase.ListMensLic(q.Fld('LIC_ID').AsString, q.Fld('ID').AsInteger, '001', s, CRLF, nil));
      eh.SetEl(ind,5, DatePropis(q.Fld('DATER').AsDateTime,3));
      eh.SetEl(ind,6, dmBase.LgotMen(q.Fld('ID').AsString, ','));
      ind:=ind+1;
      q.Next;
    end;
    q.First;
    CloseMessage;
    eh.ExportExcel;
    eh.Free;
    sNameExcel:=ParamAsString('KNAME')+' (льготники по ЖКХ).xls';
    DeleteFile(GetFileExcel(sNameExcel));
    XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
    XL.Visible:=true;
    XL:=null;
  end;
end;

procedure ExcelListEmptyAdres;
var
  sNameExcel,sSQL:String;
  lOk:Boolean;
  XL:Variant;
  q:TDataSet;
  ind,nFirst,nLast,n:Integer;
  eh:TExcelHelper;
begin
  XL:=GetOfficeObject('Excel',lOk);
  if lOk then begin
    sNameExcel:='Список пустующих жилых помещений.xls';
    XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));
    sSQL:=dmBase.LoadSQLEx('_Empty_Adres');
    if ParamAsInteger('CH_ADRES')=0 
      then sSQL:=StringReplace(sSQL, 'sp.nomer', 'sp.id');
    MemoWrite('export.sql',sSQL);
    OpenMessage(' Выполнение выгрузки ...      ','',10);
    q:=dbOpenSQL(sSQL,'');
    ind:=dbRecordCount(q);
    nFirst:=6;
    nLast:=nFirst+ind-1;
    XL.Range['A3'].Value:=NameOrg('','');
    XL.Range['A4'].Value:=DatePropis(Now,4);
    eh:=TExcelHelper.Create;
    eh.SetSize(ind,4);
    eh.SetRangeExcel('A'+IntToStr(nFirst),'D'+IntToStr(nLast));
    ind:=1;
    n:=0;
    while not q.Eof do begin
      eh.SetEl(ind,1, ind);
      eh.SetEl(ind,2, q.Fld('Adres').AsString);
      eh.SetEl(ind,3, q.Fld('Plosh_All').AsString);
      eh.SetEl(ind,4, DatePropis(q.Fld('LastDateV').AsDateTime,3));
      ind:=ind+1;
      q.Next;
    end;
    q.First;
    CloseMessage;
    eh.ExportExcel;
    eh.Free;
    sNameExcel:=ParamAsString('KNAME')+' (пустующие).xls';
    DeleteFile(GetFileExcel(sNameExcel));
    XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
    XL.Visible:=true;
    XL:=null;
  end;
end;

//---------------------------
procedure WriteIzbToNasel;
var
  sRusGr,strDate,sID,sIzb,s,sSQL,strErr,ss,s1,s2,s3,s4 : String;
  sl:TStringList;
  SprUch,q,ds : TDataSet;
  lFind,lOpen,lDubl:Boolean;
  d,d1:TDateTime;
  nYear,nMonth,nDay : Word;
  f:TfmParamQuest;
  i:integer;
begin
  SprUch:=dbGetDataSet('dmBase.SprIzbUch') ;
  SprUch.CheckBrowseMode;
  SprUch.First;
  lOpen:=false;
  sl:=TStringList.Create;

  f := TfmParamQuest.Create(nil);
  f.Caption := 'Параметры записи';
  f.AddParamEx(false, 'Только для избирателей', 'ONLY' ,'TYPE=BOOLEAN~WIDTH=80');
  f.AddParamEx(true, 'Контроль дублирования людей', 'DUBL' ,'TYPE=BOOLEAN~WIDTH=80');
  f.AddButtons('Выполнить~Отказ',0);
  if f.ShowQuest=1 then begin
    lDubl:=f.GetValue('DUBL','L');
    if f.GetValue('ONLY','L')=true then begin
      //----- только избиратели ------
      d:=GlobalTask.ParamAsDate('DATE_VIBOR');
      DecodeDate(d,nYear,nMonth,nDay);
      nYear:=nYear-18;
      d1:=EncodeDate(nYear,nMonth,nDay);
      strDate := DateToSQL(d);
      if GlobalTask.ParamAsBoolean('RUSGR_VIBOR') then sRusGr:='n.citizen=643 or' else sRusGr:='';
      sIzb:=CRLF+' and ('+sRusGr+' n.citizen=112 or n.citizen is null ) and '+
           ' (n.notselect is null or n.notselect=false) and '+getStrPropis+' and getVozrast('+strDate+', n.dater)>=18';
//            ' (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+')>18 '+
//            ' or (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+'))=18 and dater<='+DateToSQL(d1)+') ';
    end else begin
      sIzb:='';
    end;
    //------------------------------
    lFind:=false;
    OpenMessage(' Запись в базу населения номеров участков ... ','',10);
    lOpen:=true;
    dbExecuteSQL('update Население set IZB_UCH=null, IZB_OKR_SS=null, IZB_OKR_RN=null, IZB_OKR_OBL=null where date_fiks=''1899-12-30'';');
    while not SprUch.Eof do begin
      if SprUch.Fld('ACTIVE').AsBoolean then begin
        lFind:=true;
        s:=Trim(SprUch.Fld('PUNKTS').AsString);
        if s<>'' then begin
          ss:=GetFieldWhere(s,'id');
          s:=CRLF+'('+GetWherePunktUlDom(SprUch.Fld('ID').AsInteger, s, 'd.Punkt', SprUch.Fld('UL').AsString, 'd.ul', dbGetDataSet('dmBase.SprIzbUch2'), false)+')';
          sSQL := 'SELECT n.ID '+
            ' FROM Население n '+
            ' LEFT JOIN ЛицевыеСчета l ON l.date_fiks=n.date_fiks and l.id=n.lic_id '+
            ' LEFT JOIN БазаДомов d ON d.date_fiks=n.date_fiks and d.id=n.adres_id '+CRLF+
            ' WHERE n.date_fiks='+QStr('1899-12-30')+' and (n.adres_id is not null and n.adres_id>0) and '+s+sIzb;
//      writedebug(sSQL);
          q:=dbOpenSQL(sSQL,'');
          while not q.Eof do begin
            s1:=SprUch.Fld('NOMER').AsString;
            s2:=Trim(SprUch.Fld('OKRUG').AsString);
            if s2='' then s2:='null' else s2:=QStr(s2);
            s3:=Trim(SprUch.Fld('OKRUG_RN').AsString);
            if s3='' then s3:='null' else s3:=QStr(s3);
            s4:=Trim(SprUch.Fld('OKRUG_OBL').AsString);
            if s4='' then s4:='null' else s4:=QStr(s4);
            sID:=q.Fld('ID').AsString;
            i:=sl.IndexOfName(sID);
            if i=-1 then sl.Add(sID+'='+s1)
                    else sl.Strings[i]:=sl.Strings[i]+', '+s1;
            sSQL:='update Население set IZB_UCH='+s1+', IZB_OKR_SS='+s2+', IZB_OKR_RN='+s3+', IZB_OKR_OBL='+s4+' where date_fiks=''1899-12-30'' and id='+sID+';';
            dbExecuteSQL(sSQL);
//      writedebug(sSQL);
            q.Next;
          end;
          dbClose(q);
        end;
      end;
      SprUch.Next;
    end;
    if lOpen then CloseMessage;
    if not lFind then PutError('Нет активных избирательных участков');
    if lDubl then begin 
      for i:=0 to sl.Count-1 do begin
        if Pos(',',sl.Strings[i])>0 then begin
          ds:=dmBase.getMen(dmBase.GetDateCurrentSost,sl.Names[i]);
          if ds<>nil then WriteDebug(CreateFIO(ds)+', '+datePropis(ds.Fld('DATER').AsDateTime,3)+'  участки:'+sl.Values[sl.Names[i]])
                     else WriteDebug(sl.Strings[i]);
        end;
      end;
    end;
  end;
  SprUch.First;
  f.Free;
  sl.Free;
end;
//--------------------------------------------------------
procedure ObsledDomHoz1;
var
 XL:Variant;
 eh:TExcelHelper;
 f:TfmParamQuest;
 n,i,nFirst,nLast,ind:Integer;
 sl : TStringList;
 sRn,sNameExcel,sNameTemp,s,sPath,sSQL,sNPunkt,sPunkt,sLgot:String;
 lOk:Boolean;
 v:Variant;
 q,tb,ds:TDataSet;
begin
  f:=TfmParamQuest.Create(nil);
  f.Caption:='Параметры';
//  f.AddParamEx(true, 'Вывод домохозяйств с пустыми значениями' , 'ALL','TYPE=BOOLEAN');
  f.AddParamEx(lvString('LIST_PUNKT_OBSL'), 'Названия нас. пунктов через запятую(или -)' , 'SPISOK','TYPE=STRING~WIDTH=300');
//  fmParam.AddParamEx(Now, 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
// не работает   fmParam.AddParamEx('', 'Район города2' , 'RNGOROD2' ,'TYPE=LIST~DESC=KEY_RN_MYGOR~WIDTH=150');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  sNPunkt:=Trim(f.GetValue('SPISOK','C'));
  lOk:=false;
  if (n=1) and (sNPunkt<>'') then begin
    lOk:=true;
    sPunkt:='';
    sLgot:='';
    if sNPunkt='-' then begin
      ds:=dbGetDataSet('dmBase.SprPunkt');
      ds.First;
      while not ds.Eof do begin
        sPunkt:=sPunkt+ds.Fld('ID').AsString+',';
        ds.Next;
      end;
      ds.First;
    end else begin
      sl:=TStringList.Create;
      StrToStrings(sNPunkt, sl, ',');
      for i:=0 to sl.Count-1 do begin
        if Trim(sl.Strings[i])<>'' then begin
          n:=Pos('.', sl.Strings[i]);
          if n>0 then s:=Copy(sl.Strings[i],n+1,100) else s:=sl.Strings[i];
          v:=SeekValueSpr('СпрНасПунктов','NAME',Trim(s),'ID');
          if v=null then v:=0;
          if v>0 then begin
            sPunkt:=sPunkt+IntToStr(v)+',';
          end else begin
            lOk:=false;
            PutError('Не найден: '+s);
          end;
        end;
      end;
      sl.Free;
    end;
    sLgot:=KodAllInvalid;
    if sLgot='' then sLgot:='999';
  end;
  if lOk and (sPunkt<>'') then begin
    XL:=GetOfficeObject('Excel',lOk);
    if lOk then begin
      slvString('LIST_PUNKT_OBSL', sNPunkt);
      sPunkt:=Copy(sPunkt,1,Length(sPunkt)-1);

      sSQL:=dmBase.LoadSQLEx('Обследование-2018-02_0');
      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);
      MemoWrite('last.sql',sSQL);
      tb:=dbOpenSQL2MemTable(sSQL,'');
//      tb := dbCreateMemTable('ADRES,Integer,0;COUNT_ALL,Integer,0;COUNT_INV1,Integer,0;COUNT_INV2,Integer,0;','');
//      tb.Open;
      sSQL:=dmBase.LoadSQLEx('Обследование-2018-02_1');
      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);
      sSQL:=StringReplace(sSQL, '&lgot&', sLgot);
      OpenMessage(' Выполнение выгрузки ...      ','',10);
      sRn:=ParamAsString('RAION');
      sNameTemp:='Обследование дом хозяйств.xls';
      sNameExcel:=sRn+ ' район '+ParamAsString('KNAME')+'.xls';
//      DeleteFile(GetFileExcel(sNameExcel));
//      CopyFile(GetFileExcelReport(sNameTemp), GetFileExcel(sNameExcel), false, true, false);
      XL.WorkBooks.Add(GetFileExcelReport(sNameTemp));
      q:=dbOpenSQL(sSQL,'');
      while not q.Eof do begin
        if dbLocate(tb, 'ADRES', [q.Fld('ADRES_ID').AsInteger],'') then begin
          tb.Edit;
          tb.Fld('COUNT_INV1').AsInteger:=q.Fld('INV1').AsInteger;
          tb.Fld('COUNT_INV2').AsInteger:=q.Fld('INV2').AsInteger;
          tb.Post;
        end;
        q.next;
      end;
      sSQL:=dmBase.LoadSQLEx('Обследование-2018-02_2');
      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);
      sSQL:=StringReplace(sSQL, '&lgot&', sLgot);
      dbChangeSQL(q, sSQL, true);
      while not q.Eof do begin
        if dbLocate(tb, 'ADRES', [q.Fld('ADRES_ID').AsInteger],'') then begin
          tb.Edit;
          tb.Fld('COUNT_ALL').AsInteger:=q.Fld('COUNT_DETI').AsInteger;
          tb.Fld('COUNT_NASEL').AsInteger:=q.Fld('COUNT_ALL').AsInteger;
          tb.Post;
        end;
        q.next;
      end;
      dbClose(q);
      tb.First;
      while not tb.Eof do begin
        if (tb.Fld('COUNT_NASEL').AsInteger>0)  // or (tb.Fld('COUNT_INV1').AsInteger>0) or (tb.Fld('COUNT_INV2').AsInteger>0) 
          then tb.Next
          else tb.Delete;
      end;
      tb.First;
      ind:=dbRecordCount(tb);
      nFirst:=6;
      nLast:=6+ind-1;
  //        XL.Range['A3'].Value:=NameOrg('','');
      eh:=TExcelHelper.Create;
      eh.SetSize(ind,18);
      eh.SetRangeExcel('A'+IntToStr(nFirst),'R'+IntToStr(nLast));
      ind:=1;
      n:=0;
      tb.First;
      while not tb.Eof do begin
        eh.SetEl(ind,1, ind);
//        eh.SetEl(ind,1, tb.Fld('ADRES').AsString);
        eh.SetEl(ind,2, ParamAsString('KOD'));
        eh.SetEl(ind,3, tb.Fld('SOATO').AsString);
        eh.SetEl(ind,4, sRn);
        eh.SetEl(ind,5, ParamAsString('KNAME'));
        eh.SetEl(ind,6, tb.Fld('TIP_PUNKT').AsString); // dmBase.GetTailAdres('PUNKTTN'));
        eh.SetEl(ind,7, tb.Fld('NAME_PUNKT').AsString); //dmBase.GetTailAdres('PUNKTN'));
        eh.SetEl(ind,8, tb.Fld('TIP_UL').AsString); 
        eh.SetEl(ind,9, tb.Fld('NAME_UL').AsString);
        eh.SetEl(ind,10, 'дом');
        eh.SetEl(ind,11, tb.Fld('DOM').AsString); 
        eh.SetEl(ind,13, tb.Fld('KV').AsString); 
        eh.SetEl(ind,14, '');  // ФИО
        if tb.Fld('COUNT_ALL').AsInteger=0
          then eh.SetEl(ind,15, '')
          else eh.SetEl(ind,15, tb.Fld('COUNT_ALL').AsString);
        if tb.Fld('COUNT_INV1').AsInteger=0
          then eh.SetEl(ind,16, '')
          else eh.SetEl(ind,16, tb.Fld('COUNT_INV1').AsString);
        if tb.Fld('COUNT_INV2').AsInteger=0
          then eh.SetEl(ind,17, '')
          else eh.SetEl(ind,17, tb.Fld('COUNT_INV2').AsString);
        eh.SetEl(ind,18, '');
        ind:=ind+1;
        tb.Next;
      end;
      CloseMessage;
      tb.Close;
      tb.Free;
      eh.ExportExcel;
      eh.Free;
      DeleteFile(GetFileExcel(sNameExcel));
      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
//      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel), xlExcel8); //xlWorkbookDefault);
//      XL.ActiveWorkBook.Save;
//      XL.ActiveWorkBook.Close(true);
      XL.Visible:=true;
      XL:=null;
    end;
  end;
  f.Free;
end;
//----------------------------------
procedure ObsledDomHoz2;
var
 XL:Variant;
 eh:TExcelHelper;
 f:TfmParamQuest;
 n1,n2,n3,n,i,nFirst,nLast,ind:Integer;
 sl : TStringList;
 sRn,sNameExcel,sNameTemp,s,sPath,sSQL,sNPunkt,sPunkt:String;
 lOk:Boolean;
 v:Variant;
 q,tb,ds:TDataSet;
begin
  f:=TfmParamQuest.Create(nil);
  f.Caption:='Параметры';
//  f.AddParamEx(true, 'Вывод домохозяйств с пустыми значениями' , 'ALL','TYPE=BOOLEAN');
  f.AddParamEx(lvString('LIST_PUNKT_OBSL'), 'Названия нас. пунктов через запятую(или -)' , 'SPISOK','TYPE=STRING~WIDTH=300');
//  fmParam.AddParamEx(Now, 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
// не работает   fmParam.AddParamEx('', 'Район города2' , 'RNGOROD2' ,'TYPE=LIST~DESC=KEY_RN_MYGOR~WIDTH=150');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  sNPunkt:=Trim(f.GetValue('SPISOK','C'));
  lOk:=false;
  if (n=1) and (sNPunkt<>'') then begin
    lOk:=true;
    sPunkt:='';
    if sNPunkt='-' then begin
      ds:=dbGetDataSet('dmBase.SprPunkt');
      ds.First;
      while not ds.Eof do begin
        sPunkt:=sPunkt+ds.Fld('ID').AsString+',';
        ds.Next;
      end;
      ds.First;
    end else begin
      sl:=TStringList.Create;
      StrToStrings(sNPunkt, sl, ',');
      for i:=0 to sl.Count-1 do begin
        if Trim(sl.Strings[i])<>'' then begin
          n:=Pos('.', sl.Strings[i]);
          if n>0 then s:=Copy(sl.Strings[i],n+1,100) else s:=sl.Strings[i];
          v:=SeekValueSpr('СпрНасПунктов','NAME',Trim(s),'ID');
          if v=null then v:=0;
          if v>0 then begin
            sPunkt:=sPunkt+IntToStr(v)+',';
          end else begin
            lOk:=false;
            PutError('Не найден: '+s);
          end;
        end;
      end;
      sl.Free;
    end;
  end;
  if lOk and (sPunkt<>'') then begin
    XL:=GetOfficeObject('Excel',lOk);
    if lOk then begin
      slvString('LIST_PUNKT_OBSL', sNPunkt);
      sPunkt:=Copy(sPunkt,1,Length(sPunkt)-1);
      OpenMessage(' Выполнение выгрузки ...      ','',10);

      sSQL:=dmBase.LoadSQLEx('Обследование2-2018-05');
      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);
      MemoWrite('last.sql',sSQL);
      tb:=dbOpenSQL2MemTable(sSQL,'');
      sRn:=ParamAsString('RAION');
      sNameTemp:='Обследование дом хозяйств2.xls';
      sNameExcel:=sRn+ ' район '+ParamAsString('KNAME')+'.xls';
      XL.WorkBooks.Add(GetFileExcelReport(sNameTemp));
      tb.First;
      ind:=dbRecordCount(tb);
      nFirst:=6;
      nLast:=6+ind-1;
  //        XL.Range['A3'].Value:=NameOrg('','');
      eh:=TExcelHelper.Create;
      eh.SetSize(ind,9);
      eh.SetRangeExcel('A'+IntToStr(nFirst),'I'+IntToStr(nLast));
      ind:=1;
      n:=0;
      tb.First;
      n1:=0;
      n2:=0;
      n3:=0; 
      while not tb.Eof do begin
        eh.SetEl(ind,1, ind);
        eh.SetEl(ind,2, ParamAsString('KOD'));
        eh.SetEl(ind,3, tb.Fld('SOATO').AsString);
        eh.SetEl(ind,4, sRn);
        s:=ParamAsString('KNAME');
        n:=Pos(' ',s);
        if n>0 then s:=Copy(s,1,n-1);
        eh.SetEl(ind,5, s);
        eh.SetEl(ind,6, tb.Fld('NAME_PUNKT').AsString); 
        eh.SetEl(ind,7, tb.Fld('KOLVO_ADRES').AsString); 
        n1:=n1+tb.Fld('KOLVO_ADRES').AsInteger;
        eh.SetEl(ind,8, tb.Fld('KOLVO_LIC').AsString); 
        n2:=n2+tb.Fld('KOLVO_LIC').AsInteger;
        eh.SetEl(ind,9, tb.Fld('KOLVO_CHILD').AsString); 
        n3:=n3+tb.Fld('KOLVO_CHILD').AsInteger;
        ind:=ind+1;
        tb.Next;
      end;
      CloseMessage;
      tb.Close;
      tb.Free;
      eh.ExportExcel;
      eh.Free;
      s:=IntToStr(nLast+1);
      XL.Range['A'+s].Value:='Итого';
      XL.Range['G'+s].Value:=n1;
      XL.Range['H'+s].Value:=n2;
      XL.Range['I'+s].Value:=n3;
      DeleteFile(GetFileExcel(sNameExcel));
      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
//      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel), xlExcel8); //xlWorkbookDefault);
//      XL.ActiveWorkBook.Save;
//      XL.ActiveWorkBook.Close(true);
      XL.Visible:=true;
      XL:=null;
    end;
  end;
  f.Free;
end;
//--------------------------------------------------------
procedure ObsledDomHoz3;
var
 XL:Variant;
 eh:TExcelHelper;
 f:TfmParamQuest;
 n,i,m,nFirst,nLast,ind:Integer;
 sl : TStringList;
 sFIO,sRn,sNameExcel,sNameTemp,s,ss,sPath,sSQL,sNPunkt,sPunkt,sLgot:String;
 lOk:Boolean;
 v:Variant;
 q,tb,ds,dsMens,dsLic:TDataSet;
 d:TDateTime;
begin
  f:=TfmParamQuest.Create(nil);
  f.Caption:='Параметры';
//  f.AddParamEx(true, 'Вывод домохозяйств с пустыми значениями' , 'ALL','TYPE=BOOLEAN');
  f.AddParamEx(lvString('LIST_PUNKT_OBSL'), 'Названия нас. пунктов через запятую(или -)' , 'SPISOK','TYPE=STRING~WIDTH=300');
//  fmParam.AddParamEx(Now, 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
// не работает   fmParam.AddParamEx('', 'Район города2' , 'RNGOROD2' ,'TYPE=LIST~DESC=KEY_RN_MYGOR~WIDTH=150');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  sNPunkt:=Trim(f.GetValue('SPISOK','C'));
  lOk:=false;
  if (n=1) and (sNPunkt<>'') then begin
    lOk:=true;
    sPunkt:='';
    sLgot:='';
    if sNPunkt='-' then begin
      ds:=dbGetDataSet('dmBase.SprPunkt');
      ds.First;
      while not ds.Eof do begin
        sPunkt:=sPunkt+ds.Fld('ID').AsString+',';
        ds.Next;
      end;
      ds.First;
    end else begin
      sl:=TStringList.Create;
      StrToStrings(sNPunkt, sl, ',');
      for i:=0 to sl.Count-1 do begin
        if Trim(sl.Strings[i])<>'' then begin
          n:=Pos('.', sl.Strings[i]);
          if n>0 then s:=Copy(sl.Strings[i],n+1,100) else s:=sl.Strings[i];
          v:=SeekValueSpr('СпрНасПунктов','NAME',Trim(s),'ID');
          if v=null then v:=0;
          if v>0 then begin
            sPunkt:=sPunkt+IntToStr(v)+',';
          end else begin
            lOk:=false;
            PutError('Не найден: '+s);
          end;
        end;
      end;
      sl.Free;
    end;
    sLgot:=KodAllInvalid;
    if sLgot='' then sLgot:='999';
  end;
  if lOk and (sPunkt<>'') then begin
    XL:=GetOfficeObject('Excel',lOk);
    if lOk then begin
      slvString('LIST_PUNKT_OBSL', sNPunkt);
      sPunkt:=Copy(sPunkt,1,Length(sPunkt)-1);

      sSQL:=dmBase.LoadSQLEx('Обследование3-2019-01');
      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);
      MemoWrite('last.sql',sSQL);
      tb:=dbOpenSQL2MemTable(sSQL,'');

      OpenMessage(' Выполнение выгрузки ...      ','',10);
      sRn:=ParamAsString('RAION');
      sNameTemp:='Обследование дом хозяйств3.xls';
      sNameExcel:=sRn+ ' район '+ParamAsString('KNAME')+'.xls';
//      DeleteFile(GetFileExcel(sNameExcel));
//      CopyFile(GetFileExcelReport(sNameTemp), GetFileExcel(sNameExcel), false, true, false);
      XL.WorkBooks.Add(GetFileExcelReport(sNameTemp));
//      q:=dbOpenSQL(sSQL,'');
      tb.First;
      ind:=dbRecordCount(tb);
      nFirst:=7;
      nLast:=7+ind-1;
  //        XL.Range['A3'].Value:=NameOrg('','');
      eh:=TExcelHelper.Create;
      eh.SetSize(ind,18);
      eh.SetRangeExcel('A'+IntToStr(nFirst),'P'+IntToStr(nLast));
      ind:=1;
      n:=0;
      dsMens:=dbGetDataSet('dmBase.tbMens');
      dsLic := dbGetDataSet('dmBase.tbLich');
      d:=STOD(datecursostS,'');
      tb.First;
      while not tb.Eof do begin
        eh.SetEl(ind,1, ind);
        eh.SetEl(ind,2, sRn);
        eh.SetEl(ind,3, ParamAsString('KNAME'));
        eh.SetEl(ind,4, tb.Fld('TIP_PUNKT').AsString+tb.Fld('NAME_PUNKT').AsString);
        eh.SetEl(ind,5, tb.Fld('TIP_UL').AsString); 
        eh.SetEl(ind,6, tb.Fld('NAME_UL').AsString);
        eh.SetEl(ind,7, tb.Fld('DOM').AsString); 
        eh.SetEl(ind,8, tb.Fld('KORP').AsString); 
        eh.SetEl(ind,9, tb.Fld('KV').AsString); 
        sFIO:='';
        if dbLocate(dsLic,'DATE_FIKS;ID',[d, tb.Fld('LIC_ID').AsInteger],'') then begin
          if dbLocate(dsMens,'DATE_FIKS;ID',[d, dsLic.Fld('FIRST').AsInteger],'') then begin
            sFIO:=CreateFIO(dsMens);
          end;
        end;
        eh.SetEl(ind,10, sFIO);
        ss:='';
        if tb.Fld('COUNT_DETI').AsInteger>0 then begin
//          writedebug(tb.Fld('COUNT_DETI').AsString+'  '+sFIO);
          eh.SetEl(ind,11, 1);
          q:=dbOpenSQL('SELECT DATER FROM Население WHERE date_fiks=''1899-12-30'' and dater>=''2014-03-05'' and propis=true and dates is null and lic_id='+tb.Fld('LIC_ID').AsString ,'');
          m:=12;
          while not q.Eof do begin
            if m<16
              then eh.SetEl(ind,m, DatePropis(q.Fld('DATER').AsDateTime,3))
              else ss:=ss+DatePropis(q.Fld('DATER').AsDateTime,3)+' ';
            m:=m+1;
            q.Next;
          end;
        end else begin
         eh.SetEl(ind,11, 2); 
        end;
        dbClose(q);
        eh.SetEl(ind,16, ss);
        ind:=ind+1;
        tb.Next;
      end;
      CloseMessage;
      tb.Close;
      tb.Free;
      eh.ExportExcel;
      eh.Free;
      DeleteFile(GetFileExcel(sNameExcel));
      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
//      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel), xlExcel8); //xlWorkbookDefault);
//      XL.ActiveWorkBook.Save;
//      XL.ActiveWorkBook.Close(true);
      XL.Visible:=true;
      XL:=null;
    end;
  end;
  f.Free;
end;
//--------------------------------------------------------
procedure ObsledDomHoz4;
var
 XL:Variant;
 eh:TExcelHelper;
 f:TfmParamQuest;
 n,i,m,nFirst,nLast,ind:Integer;
 sl : TStringList;
 sFIO,sRn,sNameExcel,sNameTemp,sd,s,ss,sPath,sSQL,sNPunkt,sPunkt,sLgot:String;
 lOk:Boolean;
 v:Variant;
 q,tb,ds,dsMens,dsLic:TDataSet;
 d,dr:TDateTime;
begin
  f:=TfmParamQuest.Create(nil);
  f.Caption:='Параметры';
//  f.AddParamEx(true, 'Вывод домохозяйств с пустыми значениями' , 'ALL','TYPE=BOOLEAN');
  f.AddParamEx(lvString('LIST_PUNKT_OBSL'), 'Названия нас. пунктов через запятую(или -)' , 'SPISOK','TYPE=STRING~WIDTH=300');
//  fmParam.AddParamEx(Now, 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
// не работает   fmParam.AddParamEx('', 'Район города2' , 'RNGOROD2' ,'TYPE=LIST~DESC=KEY_RN_MYGOR~WIDTH=150');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  sNPunkt:=Trim(f.GetValue('SPISOK','C'));
  lOk:=false;
  if (n=1) and (sNPunkt<>'') then begin
    lOk:=true;
    sPunkt:='';
    sLgot:='';
    if sNPunkt='-' then begin
      ds:=dbGetDataSet('dmBase.SprPunkt');
      ds.First;
      while not ds.Eof do begin
        sPunkt:=sPunkt+ds.Fld('ID').AsString+',';
        ds.Next;
      end;
      ds.First;
    end else begin
      sl:=TStringList.Create;
      StrToStrings(sNPunkt, sl, ',');
      for i:=0 to sl.Count-1 do begin
        if Trim(sl.Strings[i])<>'' then begin
          n:=Pos('.', sl.Strings[i]);
          if n>0 then s:=Copy(sl.Strings[i],n+1,100) else s:=sl.Strings[i];
          v:=SeekValueSpr('СпрНасПунктов','NAME',Trim(s),'ID');
          if v=null then v:=0;
          if v>0 then begin
            sPunkt:=sPunkt+IntToStr(v)+',';
          end else begin
            lOk:=false;
            PutError('Не найден: '+s);
          end;
        end;
      end;
      sl.Free;
    end;
    sLgot:=KodAllInvalid;
    if sLgot='' then sLgot:='999';
  end;
  if lOk and (sPunkt<>'') then begin
    XL:=GetOfficeObject('Excel',lOk);
    if lOk then begin
      slvString('LIST_PUNKT_OBSL', sNPunkt);
      sPunkt:=Copy(sPunkt,1,Length(sPunkt)-1);

      sSQL:=dmBase.LoadSQLEx('Обследование4');
      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);
      MemoWrite('last.sql',sSQL);
      tb:=dbOpenSQL2MemTable(sSQL,'');

      OpenMessage(PadRStr(' Выполнение выгрузки ...',40,' '),'',10);
      sRn:=ParamAsString('RAION');
      sNameTemp:='Обследование дом хозяйств4.xls';
      sNameExcel:=sRn+ ' район '+ParamAsString('KNAME')+'.xls';
//      DeleteFile(GetFileExcel(sNameExcel));
//      CopyFile(GetFileExcelReport(sNameTemp), GetFileExcel(sNameExcel), false, true, false);
      XL.WorkBooks.Add(GetFileExcelReport(sNameTemp));
//      q:=dbOpenSQL(sSQL,'');
      tb.First;
      ind:=dbRecordCount(tb);
      nFirst:=5;
      nLast:=5+ind-1;
  //        XL.Range['A3'].Value:=NameOrg('','');
      eh:=TExcelHelper.Create;
      eh.SetSize(ind,26);
      eh.SetRangeExcel('A'+IntToStr(nFirst),'Y'+IntToStr(nLast));
      ind:=1;
      n:=0;
      dsMens:=dbGetDataSet('dmBase.tbMens');
      dsLic := dbGetDataSet('dmBase.tbLich');
      d:=STOD(datecursostS,'');
      tb.First;
      while not tb.Eof do begin
        ChangeMessage(' Выполнение выгрузки ... '+InttoStr(ind));
        eh.SetEl(ind,1, ind);
        eh.SetEl(ind,2, ParamAsString('KOD'));
        eh.SetEl(ind,3, tb.Fld('SOATO').AsString);
        eh.SetEl(ind,4, sRn);
        eh.SetEl(ind,5, ParamAsString('KNAME'));
        eh.SetEl(ind,6, tb.Fld('TIP_PUNKT').AsString);
        eh.SetEl(ind,7, tb.Fld('NAME_PUNKT').AsString);
        eh.SetEl(ind,8, tb.Fld('TIP_UL').AsString); 
        eh.SetEl(ind,9, tb.Fld('NAME_UL').AsString);
        if tb.Fld('KORP').AsString<>'' then begin 
          s:='корп'; 
          ss:=tb.Fld('KORP').AsString;
        end else begin
          s:='дом';
          ss:=tb.Fld('DOM').AsString;
        end;
        eh.SetEl(ind,10, s); 
        eh.SetEl(ind,11,ss); 
        if tb.Fld('KV').AsString<>'' then eh.SetEl(ind,12,'кв'); 
        eh.SetEl(ind,13,tb.Fld('KV').AsString); 
        sFIO:='';
        if dbLocate(dsLic,'DATE_FIKS;ID',[d, tb.Fld('LIC_ID').AsInteger],'') then begin
          if dbLocate(dsMens,'DATE_FIKS;ID',[d, dsLic.Fld('FIRST').AsInteger],'') then begin
            sFIO:=CreateFIO(dsMens);
          end;
        end;
        eh.SetEl(ind,14, sFIO);
        eh.SetEl(ind,15, tb.Fld('COUNT_MENS').AsInteger);
        ss:='';
        if tb.Fld('COUNT_MENS').AsInteger>0 then begin
//          writedebug(tb.Fld('COUNT_MENS').AsString+'  '+sFIO);
          q:=dbOpenSQL('SELECT DATER FROM Население WHERE date_fiks=''1899-12-30'' and propis=true and dates is null and lic_id='+tb.Fld('LIC_ID').AsString ,'');
          m:=16;
          while not q.Eof do begin
            dr:=q.Fld('DATER').AsDateTime;
            if dr>0 then sd:=IntToStr(YearOf(dr)) else sd:='неизв.';
            if m<26 
              then eh.SetEl(ind, m, sd)
              else ss:=ss+sd+' ';
            m:=m+1;
            q.Next;
          end;
        end else begin
         eh.SetEl(ind,15, 0); 
        end;
        dbClose(q);
        eh.SetEl(ind,26, ss);
        ind:=ind+1;
        tb.Next;
      end;
      CloseMessage;
      tb.Close;
      tb.Free;
      eh.ExportExcel;
      eh.Free;
      DeleteFile(GetFileExcel(sNameExcel));
      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
//      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel), xlExcel8); //xlWorkbookDefault);
//      XL.ActiveWorkBook.Save;
//      XL.ActiveWorkBook.Close(true);
      XL.Visible:=true;
      XL:=null;
    end;
  end;
  f.Free;
end;

//--------------------------------------------------------
procedure ObsledDomHoz5;
var
 XL:Variant;
 eh:TExcelHelper;
 f:TfmParamQuest;
 n,i,nFirst,nLast,ind:Integer;
 m,m1,m10:Extended;
 m2,m3,m4,m5,m6,m7,m8,m9:Integer;
 sl : TStringList;
 sFIO,sRn,sNameExcel,sNameTemp,sd,s,ss,sPath,sSQL,sNPunkt,sPunkt:String;
 lEmpty,lOk:Boolean;
 v:Variant;
 q,tb,ds,dsMens,dsLic:TDataSet;
 d,dr:TDateTime;
begin
  f:=TfmParamQuest.Create(nil);
  f.Caption:='Параметры';
//  f.AddParamEx(true, 'Вывод домохозяйств с пустыми значениями' , 'ALL','TYPE=BOOLEAN');
  f.AddParamEx(lvString('LIST_PUNKT_OBSL'), 'Названия нас. пунктов через запятую(или -)' , 'SPISOK','TYPE=STRING~WIDTH=300');
//  f.AddParamEx(true, 'Не пустые лицевые счета (с данными)' , 'EMPTY','');
//  fmParam.AddParamEx(Now, 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
// не работает   fmParam.AddParamEx('', 'Район города2' , 'RNGOROD2' ,'TYPE=LIST~DESC=KEY_RN_MYGOR~WIDTH=150');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  sNPunkt:=Trim(f.GetValue('SPISOK','C'));
//  lEmpty:=f.GetValue('EMPTY','L');
  lEmpty:=false; // !!!
  lOk:=false;
  if (n=1) and (sNPunkt<>'') then begin
    lOk:=true;
    sPunkt:='';
    if sNPunkt='-' then begin
      ds:=dbGetDataSet('dmBase.SprPunkt');
      ds.First;
      while not ds.Eof do begin
        sPunkt:=sPunkt+ds.Fld('ID').AsString+',';
        ds.Next;
      end;
      ds.First;
    end else begin
      sl:=TStringList.Create;
      StrToStrings(sNPunkt, sl, ',');
      for i:=0 to sl.Count-1 do begin
        if Trim(sl.Strings[i])<>'' then begin
          n:=Pos('.', sl.Strings[i]);
          if n>0 then s:=Copy(sl.Strings[i],n+1,100) else s:=sl.Strings[i];
          v:=SeekValueSpr('СпрНасПунктов','NAME',Trim(s),'ID');
          if v=null then v:=0;
          if v>0 then begin
            sPunkt:=sPunkt+IntToStr(v)+',';
          end else begin
            lOk:=false;
            PutError('Не найден: '+s);
          end;
        end;
      end;
      sl.Free;
    end;
  end;
  if lOk and (sPunkt<>'') then begin
    m1:=0; m2:=0; m3:=0; m4:=0; m5:=0; m6:=0; m7:=0; m8:=0; m9:=0; m10:=0;

    XL:=GetOfficeObject('Excel',lOk);
    if lOk then begin
      slvString('LIST_PUNKT_OBSL', sNPunkt);
      sPunkt:=Copy(sPunkt,1,Length(sPunkt)-1);

      sSQL:=dmBase.LoadSQLEx('Обследование5');
      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);

      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);
      if lEmpty
        then sSQL:=StringReplace(sSQL, 'not_empty', chr(13)+chr(10)+'(b0.nvalue is not null or b1.nvalue is not null or b2.nvalue is not null or b3.nvalue is not null or b4.nvalue is not null or b5.nvalue is not null or b6.nvalue is not null or b7.nvalue is not null or b8.nvalue is not null)')
        else sSQL:=StringReplace(sSQL, 'and not_empty', '');
      MemoWrite('vigr.sql',sSQL);
      OpenMessage(PadRStr(' Выполнение выгрузки ...',40,' '),'',10);
      tb:=dbOpenSQL2MemTable(sSQL,'');
      sRn:=ParamAsString('RAION');
      sNameTemp:='Численность скота и птицы.xls';
      sNameExcel:=sRn+ ' район '+ParamAsString('KNAME')+'.xls';
//      DeleteFile(GetFileExcel(sNameExcel));
//      CopyFile(GetFileExcelReport(sNameTemp), GetFileExcel(sNameExcel), false, true, false);
      XL.WorkBooks.Add(GetFileExcelReport(sNameTemp));
//      q:=dbOpenSQL(sSQL,'');
      tb.First;
      ind:=dbRecordCount(tb);
      nFirst:=8;
      nLast:=8+ind-1;
  //        XL.Range['A3'].Value:=NameOrg('','');
      eh:=TExcelHelper.Create;
      eh.SetSize(ind,25);
      eh.SetRangeExcel('A'+IntToStr(nFirst),'Y'+IntToStr(nLast));
      ind:=1;
      n:=0;
      dsMens:=dbGetDataSet('dmBase.tbMens');
      dsLic := dbGetDataSet('dmBase.tbLich');
      d:=STOD(datecursostS,'');
      tb.First;
      sd:=ParamAsString('KNAME');
      i:=Pos(' ',sd);
      if i>0 then sd:=Copy(sd,1,i-1);
      while not tb.Eof do begin
        ChangeMessage(' Выполнение выгрузки ... '+InttoStr(ind));
        eh.SetEl(ind,1, ind);
        eh.SetEl(ind,2, ParamAsString('KOD'));
        eh.SetEl(ind,3, tb.Fld('SOATO').AsString);
        eh.SetEl(ind,4, sRn);
        eh.SetEl(ind,5, sd);
        eh.SetEl(ind,6, tb.Fld('TIP_PUNKT').AsString);
        eh.SetEl(ind,7, tb.Fld('NAME_PUNKT').AsString);
        eh.SetEl(ind,8, tb.Fld('TIP_UL').AsString); 
        eh.SetEl(ind,9, tb.Fld('NAME_UL').AsString);
        if tb.Fld('KORP').AsString<>'' then begin 
          s:='корп'; 
          ss:=tb.Fld('KORP').AsString;
        end else begin
          s:='дом';
          ss:=tb.Fld('DOM').AsString;
        end;
        eh.SetEl(ind,10, s); 
        eh.SetEl(ind,11,ss); 
        if tb.Fld('KV').AsString<>'' then eh.SetEl(ind,12,'кв'); 
        eh.SetEl(ind,13,tb.Fld('KV').AsString); 
        sFIO:='';
        if dbLocate(dsLic,'DATE_FIKS;ID',[d, tb.Fld('LIC_ID').AsInteger],'') then begin
          if dbLocate(dsMens,'DATE_FIKS;ID',[d, dsLic.Fld('FIRST').AsInteger],'') then begin
            sFIO:=CreateFIO(dsMens);
          end;
        end;
        eh.SetEl(ind,14, sFIO);
        eh.SetEl(ind,15, xRound(tb.Fld('VSEGO').AsFloat,2));
        m1:=m1+xRound(tb.Fld('VSEGO').AsFloat,2);
        eh.SetEl(ind,16, tb.Fld('BIG_ENIMAL').AsInteger);// P
        m2:=m2+tb.Fld('BIG_ENIMAL').AsInteger;
        eh.SetEl(ind,17, tb.Fld('KOROVA').AsInteger);    // Q
        m3:=m3+tb.Fld('KOROVA').AsInteger;
        eh.SetEl(ind,18, tb.Fld('TELKI1').AsInteger);    // R
        m4:=m4+tb.Fld('TELKI1').AsInteger;
        eh.SetEl(ind,19, tb.Fld('SVINI').AsInteger);     // S
        m5:=m5+tb.Fld('SVINI').AsInteger;
        eh.SetEl(ind,20, tb.Fld('OVCI').AsInteger);      // T
        m6:=m6+tb.Fld('OVCI').AsInteger;
        eh.SetEl(ind,21, tb.Fld('KOZI').AsInteger);      // U
        m7:=m7+tb.Fld('KOZI').AsInteger;
        eh.SetEl(ind,22, tb.Fld('LOSHADI').AsInteger);   // V
        m8:=m8+tb.Fld('LOSHADI').AsInteger;
        eh.SetEl(ind,23, tb.Fld('PTICA').AsInteger);     // W
        m9:=m9+tb.Fld('PTICA').AsInteger;
//  =Q8*1+R8*0,6+(P8-Q8-R8)*0,6+S8*0,3+T8*0,1+ U8*0,1+  V8*1+    W8*0,02
        m:=tb.Fld('KOROVA').AsInteger+tb.Fld('TELKI1').AsInteger*0.6+(tb.Fld('BIG_ENIMAL').AsInteger-tb.Fld('KOROVA').AsInteger-tb.Fld('TELKI1').AsInteger)*0.6+
           tb.Fld('SVINI').AsInteger*0.3+tb.Fld('OVCI').AsInteger*0.1+tb.Fld('KOZI').AsInteger*0.1+tb.Fld('LOSHADI').AsInteger+tb.Fld('PTICA').AsInteger*0.02;
        eh.SetEl(ind,24, xRound(m,2));  // формула
        m10:=m10+xRound(m,2);
        eh.SetEl(ind,25, ''); // примечание
        ind:=ind+1;
        tb.Next;
      end;
      s:=IntToStr(nLast+2);
      XL.Range['O'+s].Value:=m1;
      XL.Range['P'+s].Value:=m2;
      XL.Range['Q'+s].Value:=m3;
      XL.Range['R'+s].Value:=m4;
      XL.Range['S'+s].Value:=m5;
      XL.Range['T'+s].Value:=m6;
      XL.Range['U'+s].Value:=m7;
      XL.Range['V'+s].Value:=m8;
      XL.Range['W'+s].Value:=m9;
      XL.Range['X'+s].Value:=m10;
      s:=IntToStr(nLast+5);
      XL.Range['D'+s].Value:=DolgRukov;
      XL.Range['E'+s].Value:=FIORukov;
      CloseMessage;
      tb.Close;
      tb.Free;
      eh.ExportExcel;
      eh.Free;
      DeleteFile(GetFileExcel(sNameExcel));
      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
//      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel), xlExcel8); //xlWorkbookDefault);
//      XL.ActiveWorkBook.Save;
//      XL.ActiveWorkBook.Close(true);
      XL.Visible:=true;
      XL:=null;
    end;
  end;
  f.Free;
end;


//==================================================================================================
//  !!! СПРАВКИ !!!   НАЧАЛО
//==================================================================================================
// Справка о месте жительства и составе семьи
function SprMGS(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strTypeSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sVsego,sZml,sOtnosh :String;
   strNanim,strYear,sPadeg,sAdd1,sAdd2 : String;
   lZml,lAsGKX:Boolean;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   lAsGKX:=ParamAsBoolean('SPRMGS_GKX');  // в соотв. с постановлением ЖКХ
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strKomu := m.FIO;
     strYear:='';
     if GetTemplateParam('PAR3')='1' then lZml:=true else lZml:=false;
     if (IdProg()='GKH') and lZml then lZml:=false;

     if lAsGKX then begin
       sAdd1:='Выдана '+GetNameAsPol('гражданину',m.Fld('POL').AsString)+' ';
       sAdd2:='в том, что '+GetNameAsPol('он',m.Fld('POL').AsString)+' действительно ';
       sPadeg:='Д';
     end else begin
       sAdd1:='';
       sAdd2:='';
       sPadeg:='И';
       if m.Fld('DATER').AsString<>'' then begin
         if GetTemplateParam('PAR2')='2' then begin
           strYear := ', '+DatePropis(m.Fld('DATER').AsDateTime,3);
         end else begin
           strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+' г.р.';
         end;
       end;
     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('@PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('@PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := sAdd1+GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,sPadeg)+strYear;
//     ds.Fld('Komu').AsString := sAdd1+GetPadegFIO(strKomu,m.Fld('POL').AsString,sPadeg)+strYear;
     if GetTemplateParam('PAR2')='2' then begin
       ds.Fld('NAME_DATER').AsString := 'Дата рождения';
       ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     end else begin
       ds.Fld('NAME_DATER').AsString := 'Год рождения';
       ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     end;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

     WritePodpis(ds, StrToInt(GetTemplateParam('PAR1')) );

     WriteMenToSpr(m,ds);
     ds.Fld('Zarm').AsString:=sAdd2+ds.Fld('Zarm').AsString;

//     ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'частный дом');
     ds.Fld('TYPEHOUSE').AsString:=GetPredst(LicSchet.Fld('PREDST').AsString,'частный дом','NAME2');
     if lZml then begin
       if LicSchet.Fld('VSEGO').AsFloat>0 then sVsego:='Жилой дом расположен на земельном участке площадью '+LicSchet.Fld('VSEGO').AsString+' га,' else sVsego:='Земля';
       if LicSchet.Fld('SOBST').AsFloat>0 then sZml:=sZml+' в частной собственности '+LicSchet.Fld('SOBST').AsString+' га,';
       if GlobalTask.ParamAsBoolean('V_PNV') and (LicSchet.Fld('PNV').AsFloat>0) then sZml:=sZml+' пожизненное наследуемое владение '+LicSchet.Fld('PNV').AsString+' га,';
       if GlobalTask.ParamAsBoolean('V_LPX') and (LicSchet.Fld('LPX').AsFloat>0) then sZml:=sZml+' личное подсобное хозяйство '+LicSchet.Fld('LPX').AsString+' га,';
       if GlobalTask.ParamAsBoolean('V_OGOROD') and (LicSchet.Fld('OGOROD').AsFloat>0) then sZml:=sZml+' для огородничества '+LicSchet.Fld('OGOROD').AsString+' га,';
       if GlobalTask.ParamAsBoolean('V_ARENDA') and (LicSchet.Fld('ARENDA').AsFloat>0) then sZml:=sZml+' в аренде '+LicSchet.Fld('ARENDA').AsString+' га,';
       if GlobalTask.ParamAsBoolean('V_SOTKI') and (LicSchet.Fld('SOTKI').AsFloat>0) then sZml:=sZml+' сотки '+LicSchet.Fld('SOTKI').AsString+' га,';
       if GlobalTask.ParamAsBoolean('V_SOTKIS') and (LicSchet.Fld('SOTKIS').AsFloat>0) then sZml:=sZml+' сотки (сельсовета)'+LicSchet.Fld('SOTKIS').AsString+' га,';
       if GlobalTask.ParamAsBoolean('V_PRIUSAD') and (LicSchet.Fld('PRIUSAD').AsFloat>0) then sZml:=sZml+' приусадебный участок '+LicSchet.Fld('PRIUSAD').AsString+' га,';
       sZml:=sVsego+sZml;
       if Copy(sZml,Length(sZml),1)=',' then  sZml:=Copy(sZml,1,Length(sZml)-1);
       ds.Fld('ZML').AsString:=sZml;
     end;
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;
     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         strNanim := m.FIO; // наниматель
       end;
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         if GetTemplateParam('PAR2')='2' then begin
           ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         end else begin
           ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         end;
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;

     s:='является';
     strTypeSobstv:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strTypeSobstv+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;

     ds.Post;

   end;
end;

//=== адрес ================================
// Справка о месте жительства и составе семьи
function SprMGS_Adres(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim,strYear,sPadeg,sAdd1,sAdd2 : String;
   lAsGKX:Boolean;
begin
   result:=true;
   lAsGKX:=ParamAsBoolean('SPRMGS_GKX');  // в соотв. с постановлением ЖКХ
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     adr := Adres;
     m := adr.Mens;
     strKomu := m.FIO;
     strYear:='';
     if lAsGKX then begin
       sAdd1:='Выдана '+GetNameAsPol('гражданину',m.Fld('POL').AsString)+' ';
       sAdd2:='в том, что '+GetNameAsPol('он',m.Fld('POL').AsString)+' действительно ';
       sPadeg:='Д';
     end else begin
       sAdd1:='';
       sAdd2:='';
       sPadeg:='И';
       if m.Fld('DATER').AsString<>'' then begin
         strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+' г.р.';
       end;
     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := adr.ListLicSchet;
     ds.Fld('PLOSH_ALL').AsString := adr.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := adr.Fld('PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := sAdd1+GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,sPadeg)+strYear;
//     ds.Fld('Komu').AsString := sAdd1+GetPadegFIO(strKomu,m.Fld('POL').AsString,sPadeg)+strYear;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('NAME_DATER').AsString := 'Год рождения';
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

     WritePodpis(ds,14);

     WriteMenToSpr(m,ds);
     ds.Fld('Zarm').AsString:=sAdd2+ds.Fld('Zarm').AsString;

     ds.Fld('TYPEHOUSE').AsString:=GetPredst(Adres.Fld('PREDST').AsString,'частный дом','NAME');
  
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;

     strNanim:='';
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;

     s:='является';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;

     ds.Post;

   end;
end;

//==================================================================================================
//  !!! СПРАВКИ !!!   КОНЕЦ
//==================================================================================================

//==================================================================================================
//  !!! АКТЫ !!!   НАЧАЛО
//==================================================================================================
// Акт обследования материально-бытового положения 
function AktMBP(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
//     strKomu := m.FIO;
     nID:=m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;

     strGR:='';
     ds.Fld('TEKU_DATE').AsString := DatePropis(now,4);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('KomuR').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'Р');
//     ds.Fld('KomuR').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Р');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('WORK_NAME').AsString := m.getWork;
     ds.Fld('NameOrgP').AsString := NameOrg('','Р');
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;

//Животноводство
     if LicSchet.Fld('KOROVA').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('KOR').AsString := 'Коровы - '+LicSchet.Fld('KOROVA').AsString+'.';
     end; 
     if LicSchet.Fld('TELKI1').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('TEL').AsString := 'Молодняк до года - '+LicSchet.Fld('TELKI1').AsString+'.';
     end; 
     if LicSchet.Fld('SVINI').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('SVIN').AsString := 'Свиньи - '+LicSchet.Fld('SVINI').AsString+'.';
     end; 
     if LicSchet.Fld('OVCI').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('OVCI').AsString := 'Овцы - '+LicSchet.Fld('OVCI').AsString+'.';
     end; 
     if LicSchet.Fld('KOZI').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('KOZI').AsString := 'Козы - '+LicSchet.Fld('KOZI').AsString+'.';
     end; 
     if LicSchet.Fld('LOSHADI').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('LOSH').AsString := 'Лошади (кони) - '+LicSchet.Fld('LOSHADI').AsString+'.';
     end; 
     if LicSchet.Fld('PTICA').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('PTIC').AsString := 'Птица - '+LicSchet.Fld('PTICA').AsString+'.';
     end; 
     if LicSchet.Fld('KROL').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('KROL').AsString := 'Кролики - '+LicSchet.Fld('KROL').AsString+'.';
     end; 
     if LicSchet.Fld('PCHELI').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('PCHEL').AsString := 'Пчелосемьи (штук) - '+LicSchet.Fld('PCHELI').AsString+'.';
     end; 
     ds.Fld('TYPEHOUSE').AsString:=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,
                                   'Собственный дом');
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     m.First;
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('Punkt').AsString := adr.Punkt;
         ds.Fld('WORK_NAME').AsString := m.getWork;
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

// Акт из адресной книги
function AktMBP_Adres(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strNanim, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     adr:=Adres;
     m:=adr.Mens;
//     strKomu := m.FIO;
     nID:=m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;

     s:=CheckOwners(adr,s,strSobstv,strNanim);  
     ds.Fld('SOBSTV').AsString:= strSobstv;  //собственники
     ds.Fld('TYPEHOUSE').AsString:=GetPredst(Adres.Fld('PREDST').AsString,'частный дом','NAME2');
     ds.Fld('KOL_KOMN').AsString:=Adres.Fld('KOL_KOMN').AsString;
     ds.Fld('PLOSH_GIL').AsString:=Adres.Fld('PLOSH_GIL').AsString;

     ds.Fld('TEKU_DATE').AsString := DatePropis(now,4);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('KomuR').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'Р');
//     ds.Fld('KomuR').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Р');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('WORK_NAME').AsString := m.getWork;
     ds.Fld('NameOrgP').AsString := NameOrg('','Р');
//     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
//     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     m.First;
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('Punkt').AsString := adr.Punkt;
         ds.Fld('WORK_NAME').AsString := m.getWork;
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

// Акт обследования материально-бытового положения пенсионера, инвалида, ребенка-инвалида
function AktOBP(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   sOtnosh :String;
   nn : Extended;

begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('TELEFOND').AsString := LicSchet.Fld('TELEFON').AsString;
     ds.Fld('TELEFONM').AsString := m.Fld('TELEFON').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;

//Животноводство
     if LicSchet.Fld('KOROVA').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('KOR').AsString := 'Коровы - '+LicSchet.Fld('KOROVA').AsString+'.';
     end; 
     if LicSchet.Fld('TELKI1').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('TEL').AsString := 'Молодняк до года - '+LicSchet.Fld('TELKI1').AsString+'.';
     end; 
     if LicSchet.Fld('SVINI').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('SVIN').AsString := 'Свиньи - '+LicSchet.Fld('SVINI').AsString+'.';
     end; 
     if LicSchet.Fld('OVCI').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('OVCI').AsString := 'Овцы - '+LicSchet.Fld('OVCI').AsString+'.';
     end; 
     if LicSchet.Fld('KOZI').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('KOZI').AsString := 'Козы - '+LicSchet.Fld('KOZI').AsString+'.';
     end; 
     if LicSchet.Fld('LOSHADI').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('LOSH').AsString := 'Лошади (кони) - '+LicSchet.Fld('LOSHADI').AsString+'.';
     end; 
     if LicSchet.Fld('PTICA').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('PTIC').AsString := 'Птица - '+LicSchet.Fld('PTICA').AsString+'.';
     end; 
     if LicSchet.Fld('KROL').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('KROL').AsString := 'Кролики - '+LicSchet.Fld('KROL').AsString+'.';
     end; 
     if LicSchet.Fld('PCHELI').AsString='' then begin
       ds.Fld('JT').AsString :='';
     end else begin
       ds.Fld('PCHEL').AsString := 'Пчелосемьи (штук) - '+LicSchet.Fld('PCHELI').AsString+'.';
     end; 

//Земля
     if LicSchet.Fld('VSEGO').AsString='' then begin
       ds.Fld('ZT').AsString :='';
     end else begin
     nn := LicSchet.Fld('VSEGO').AsFloat-LicSchet.Fld('POSTR').AsFloat-LicSchet.Fld('PRIUSAD').AsFloat;
     ds.Fld('ZEML').AsString := 'Участок, предоставленный во временное пользование для огородничества, а также для сенокошения и выпаса скота - '+FormatFloat('####0.####',nn)+'га'+'.';
     end;
     if LicSchet.Fld('PRIUSAD').AsString='' then begin
       ds.Fld('ZT').AsString :='';
     end else begin
       ds.Fld('PRIUS').AsString := 'Приусадебный участок - '+LicSchet.Fld('PRIUSAD').AsString+'га'+'.';
     end; 

     ds.Fld('TYPEHOUSE').AsString:=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,
                                   'Собственный дом');
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('Punkt').AsString := adr.Punkt;
         ds.Fld('WORK_NAME').AsString := m.getWork;
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;
//==================================================================================================
//  !!! АКТЫ !!!   КОНЕЦ
//==================================================================================================


//----- Предписание -------------------------------------
function Predpis(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   m : TMens;
   adr : TAdresLic;
begin
   Result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'Д');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Д');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р')); // +', '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('TGOD').AsString := FormatDateTime('yyyy',NOW);
     if m.Fld('POL').AsString='М' 
       then ds.Fld('Grag').AsString := 'Гражданину' 
       else ds.Fld('Grag').AsString := 'Гражданке';
     ds.Post;
   end;
end;
//----- Предписание -------------------------------------
function Predpis_Adres(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   dsMen,ds: TDataSet;
   m : TMens;
   adr : TAdresLic;
   sID,sPol:String;
begin
   Result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     adr:=Adres;
     m:=adr.Mens;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     sPol:='М';
     if (adr.HouseOwners.Fld('TYPEKOD').AsInteger=OWNER_NASEL) then begin
       sID:=adr.HouseOwners.Fld('KOD').AsString;
       dsMen:=dmBase.getMen(dmBase.GetDateCurrentSost, sID);
       if dsMen<>nil then begin 
         sPol:=dsMen.Fld('POL').AsString;
         ds.Fld('Komu').AsString:=GetPadegFIO3(dsMen.Fld('Familia').AsString, dsMen.Fld('Name').AsString,dsMen.Fld('Otch').AsString,dsMen.Fld('POL').AsString,'Д');
         ds.Fld('Adres').AsString:=dmBase.AdresMen(sID,'');
       end;
     end;
     if (ds.Fld('Komu').AsString='') and (m.Count>0) then begin
       ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'Д');
       ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р')); // +', '+FirstCharUpper(Obl_Name('Р'));
       sPol:=m.Fld('POL').AsString;
     end;
     if sPol='М'
       then ds.Fld('Grag').AsString:='Гражданину' 
       else ds.Fld('Grag').AsString:='Гражданке';
     ds.Fld('TGOD').AsString := FormatDateTime('yyyy',NOW);
     ds.Post;
   end;
end;
//---------------------------------------------------
//   списки на выборы президента
procedure SpiskiViborEx(nType:Integer);
var
  sl,slPar: TStringList;
  HeadList: TStringList;
  WidthList: TStringList;
  f  : TfmParamQuest;
  m,i,j,n,nUch,ns,nIDUch  : Integer;
  d,d1 : TDateTime;
  sSort,strNameUch,s,strDate,strSQL,strErr,ss,sss,sRusGr,sAdr,sAdr2 : String;
  nYear,nMonth,nDay : Word;
  SprUch,tb,q : TDataSet;                    
  lDop,lA4,lFIO1,lAdresFromLic,lCheckAddAdres : Boolean;
begin
  // включать граждан россии в списки
  if GlobalTask.ParamAsBoolean('RUSGR_VIBOR') then begin
    sRusGr:='n.citizen=643 or';
  end else begin
    sRusGr:='';
  end;

  SprUch := dbGetDataSet('dmBase.SprIzbUch') ;
  SprUch.First;
  if not SprUch.Eof then begin
    n := SprUch.Fld('NOMER').AsInteger;
  end else begin
    PutError(' Заполните справочник избирательных участков ! ');
    exit;
  end;
  sl:=TStringList.Create;
  slPar:=TStringList.Create;
  HeadList:=TStringList.Create;
  WidthList:=TStringList.Create;
  tb := dbCreateMemTable('NOMER,Char,20;FIO,Char,100;DATER,Char,25;MESTO,Char,200;'+
        'TYR1,Char,5;TYR2,Char,5;TYR3,Char,5;TYR4,Char,5;ROSP,Char,10;','');
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите параметры';
//  f.StepY:=17;
//  f.Flat:=false;
  f.AddParamEx(GlobalTask.ParamAsDate('DATE_VIBOR'), 'Дата выборов' , 'DATEVZ' ,'TYPE=DATE');
//  f.AddParamEx(n      , 'Избирательный участок' , 'IZBUCH','TYPE=LOOKUP~DESC=LOOKUP_SPRIZBUCH~WIDTH=400');
  f.AddParamEx(n      , 'Избирательный участок' , 'IZBUCH','');
  f.AddParamEx(lvString('NAME_POST_CIK'), 'Дата и номер постановления ЦИК' , 'POSTAN','TYPE=STRING~WIDTH=200');
  f.AddParamEx(lvString('NAME_SPIS_GR'), 'Название СПИСКА' , 'SPISOK','TYPE=STRING~WIDTH=500');
  f.AddParamEx(1, 'Тип сортировки' , 'SORT','TYPE=LIST~DESC=KEY_SORTIZB~WIDTH=300');
  f.AddParamEx(1, 'Формат' , 'FORMAT','TYPE=LIST~DESC=KEY_FORMAT_SPIS~WIDTH=100');
  f.AddParamEx(false, 'ФИО в одну сроку' , 'FIO_ONE','');
  f.AddParamEx(lvBoolean('ADD_ADRES'), 'Проверять адрес жит. для выборов' , 'ADD_ADRES','');
  f.AddParamEx(lvBoolean('ADD_DOP'), 'Печать приложения' , 'ADD_DOP','');

  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  try
  if n = 1 then begin
    lAdresFromLic:=false;         //     !!!
    d  := f.GetValue('DATEVZ','D');
    ns := f.GetValue('SORT','I');
    if f.GetValue('FORMAT','I')=1 
      then lA4:=true 
      else lA4:=false;
    lFIO1:=f.GetValue('FIO_ONE','B');
    lCheckAddAdres:=f.GetValue('ADD_ADRES','B');
    lDop:=f.GetValue('ADD_DOP','B');
    slvString('NAME_SPIS_GR', f.GetValue('SPISOK','S'));
    slvString('NAME_POST_CIK', f.GetValue('POSTAN','S'));
    slvDate('DATE_VIBOR', d);
    slvBoolean('ADD_ADRES', lCheckAddAdres);
    slvBoolean('ADD_DOP', lDop);
    DecodeDate(d,nYear,nMonth,nDay);
    nYear := nYear-18;
    nUch := f.GetValue('IZBUCH','N');
    f.Free;
    d1 := EncodeDate(nYear,nMonth,nDay);
    strDate := DateToSQL(d);
    if not dbLocate(SprUch,'NOMER',[nUch],'') then begin
      PutError(' Не выбран избирательный участок !');
    end else begin
      if ParamAsInteger('CH_ADRES')=0 
        then sSort:='d.punkt'
        else sSort:='s.nomer';
      //---- определим сортировать или нет нас. пункты по номеру -----
//      q:=dbOpenSQL('SELECT count(*) as nnn FROM СпрНасПунктов WHERE nomer is null','');
//      if q.Fld('nnn').AsInteger=0 then sSort:='s.nomer' else sSort:='d.punkt';
//      dbClose(q);
      //---------------------------------------------------------------
      if lCheckAddAdres then begin
        sAdr:=' LEFT JOIN БазаДомов d ON d.date_fiks=n.date_fiks and d.id=ifnull(n.adres_id_git,n.adres_id) ';
        sAdr2:='n.adres_id';
      end else begin
        if lAdresFromLic  then begin  // !!!
          sAdr:=' LEFT JOIN БазаДомов d ON d.date_fiks=l.date_fiks and d.id=l.adres_id ';
          sAdr2:='l.adres_id';
        end else begin
          sAdr:=' LEFT JOIN БазаДомов d ON d.date_fiks=n.date_fiks and d.id=n.adres_id ';
          sAdr2:='n.adres_id';
        end;
      end;
      strNameUch := SprUch.Fld('NAME').AsString;
      nIDUch := SprUch.Fld('ID').AsInteger;
      s := SprUch.Fld('PUNKTS').AsString;
      ss:= GetFieldWhere(s,'id');
//      s := GetFieldWhere2(s,'d.Punkt',SprUch.Fld('UL').AsString,'d.ul');
      s := GetWherePunktUlDom(nIDUch,s,'d.Punkt',SprUch.Fld('UL').AsString,'d.ul',dbGetDataSet('dmBase.SprIzbUch2'), false);
//      s := GetFieldWhere(s,'d.Punkt');
      strSQL := 'SELECT s.nomer, familia, n.name name1, otch, dater, lic_id, d.punkt, '+sAdr2+', n.adres_id_git, 1 ppp, u.name, d.dom, d.dom1, d.dom2, d.korp, d.kv '+
        ' FROM Население n '+
        ' LEFT JOIN ЛицевыеСчета l ON l.date_fiks=n.date_fiks and l.id=n.lic_id '+
        sAdr+   // LEFT JOIN БазаДомов
        ' LEFT JOIN СпрНасПунктов s ON d.punkt=s.id '+
        ' LEFT JOIN СпрУлиц u ON u.id=d.ul '+
        ' WHERE n.date_fiks='+QStr('1899-12-30')+' and ( '+sRusGr+' n.citizen=112 or n.citizen is null ) and '+
        ' (n.notselect is null or n.notselect=false) and (n.adres_id is not null and n.adres_id>0) and '+
        getStrPropis+' and '+
        ' (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+')>18 '+
        ' or (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+'))=18 and '+
        ' dater<='+DateToSQL(d1)+' ) and ('+ s + ') ';
      if ns<>4 then begin
        strSQL:=strSQL+'   union all '+
        ' SELECT nomer, '+QStr(' ')+', name as name1, '+QStr(' ')+', CURDATE( ), 0, id as punkt, 0, 0, 0,'+QStr('')+','+QStr('')+','+QStr('')+','+QStr('')+','+QStr('')+','+QStr('')+
        ' FROM СпрНасПунктов WHERE '+ss+' ';
      end;
      if ns=1 then begin
        strSQL := strSQL+' ORDER BY '+sSort+',familia,name1';
      end else if ns=2 then begin
        strSQL := strSQL+' ORDER BY '+sSort+',ppp,u.name,d.dom1,d.dom2,d.korp,d.kv';
      end else if ns=3 then begin
        strSQL := strSQL+' ORDER BY '+sSort+',ppp,u.name,familia';
      end else begin
        strSQL := strSQL+' ORDER BY familia,name1';
      end;
//      writedebug(strSQL);
      OpenMessage(' Формирование списка избирателей ... ','',10);
      q:=dbOpenSQL(strSQL,'');
      tb.Open;
      n := 1;
      s := '1234567890';
      j := 10;
      while not q.Eof do begin
        tb.Append;
        if q.Fld('adres_id').AsInteger=0 then begin
          tb.Fld('MESTO').AsString:='\b\fs28\qc '+q.Fld('name1').AsString+'\b0';
          s := q.Fld('name1').AsString;
          j := Length(s);
        end else begin
          tb.Fld('NOMER').AsString:='\fs20\qr '+IntToStr(n);
          if lFIO1 then sss:=' ' else sss:='\par ';
          if lA4 
             then  tb.Fld('FIO').AsString:='\b\fs28\qc '+FirstUpper(q.Fld('Familia').AsString)+sss+
                       FirstUpper(q.Fld('Name1').AsString)+' '+FirstUpper(q.Fld('Otch').AsString)+'\b0'
             else  tb.Fld('FIO').AsString:='\b\fs28\qc '+FirstUpper(q.Fld('Familia').AsString)+sss+
                       FirstUpper(q.Fld('Name1').AsString)+' '+FirstUpper(q.Fld('Otch').AsString)+'\b0';
          if StrToInt(FormatDateTime('yyyy',q.Fld('DateR').AsDateTime))<>nYear then begin
            tb.Fld('DATER').AsString:='\qc '+FormatDateTime('yyyy',q.Fld('DateR').AsDateTime)
          end else begin
            s := FormatDateTime('dd.mm.yyyy',q.Fld('DateR').AsDateTime);
            tb.Fld('DATER').AsString:='\qc '+Copy(s,1,6)+'\par '+Copy(s,7,4);
          end;
          if lCheckAddAdres and (q.Fld('adres_id_git').AsString<>'') then begin
            tb.Fld('MESTO').AsString:=dmBase.AdresFromID(EncodeDate(1899,12,30),q.Fld('adres_id_git').AsString,false);
          end else begin
            tb.Fld('MESTO').AsString:=dmBase.AdresFromID(EncodeDate(1899,12,30),q.Fld('adres_id').AsString,false);
          end;
          if Copy(tb.Fld('MESTO').AsString,1,j)=s 
            then tb.Fld('MESTO').AsString:=Copy(tb.Fld('MESTO').AsString,j+2,200);
          tb.Fld('TYR1').AsString:=' \par\par ';
          tb.Post;
          n:=n+1;
        end;
        q.Next;
      end;
      dbClose(q);
      if lA4 
        then StartPrint(sl, poLandscape, pfA4)
        else StartPrint(sl, poLandscape, pfA3);
      if lDop then begin
        s:='';
        if lA4 then m:=14 else m:=23;
        for i:=1 to m do s:=s+'\tab';
        PrintString(sl, s+'\ql Приложение 1\line'+s+' к постановлению Центральной комиссии\line'+s+' Республики Беларусь по выборам и\line'+s+' проведению республиканских\line'+s+' референдумов\line'+s+' '+lvString('NAME_POST_CIK')+'\par ', 0, 12, false, False, False);
      end;
      PrintString(sl, '\qc СПИСОК\par ', 0, 14, true, False, False);
      PrintString(sl, '\qc '+lvString('NAME_SPIS_GR')+' \par\par ', 0, 14, true, False, False);
      PrintString(sl, '\qc '+DatePropis(d,2)+' \par\par ', 0, 14, False, False, true);
      PrintString(sl, 'Участок для голосования № '+IntToStr(nUch)+'      '+strNameUch+' \par\par\par\par ', 0, 12, False, False, true);

      if lA4 then begin
        HeadList.Add('\fs18 № п/п|\fs18 1');
        HeadList.Add('\fs18 Фамилия, имя, отчество|\fs18 2');
        HeadList.Add('\fs18 Год рождения*|\fs18 3');
        HeadList.Add('\fs18 Место жительства (место пребывания)|\fs18 4');
        if nType=1  then begin
          HeadList.Add('\fs18 Подпись избирателя при получении бюллетеня|\fs18 в первом туре выборов**|\fs18 5');
          HeadList.Add('\fs18 Подпись избирателя при получении бюллетеня|\fs18 во втором туре голосования|\fs18 6');
          HeadList.Add('\fs18 Подпись избирателя при получении бюллетеня|\fs18 в первом туре повторных выборов**|\fs18 7');
          HeadList.Add('\fs18 Подпись избирателя при получении бюллетеня|\fs18 во втором туре голосования повторных выборов|\fs18 8');
          HeadList.Add('\fs18 Примечание|9');
          StrToStrings('30;240;60;190;85;85;85;85;70', WidthList, ';');   // 9 граф
        end else begin
          HeadList.Add('\fs18 Подпись избирателя при получении бюллетеня**|\fs18 при проведении основных выборов|\fs18 5');
          HeadList.Add('\fs18 Подпись избирателя при получении бюллетеня**|\fs18 при проведении повторных выборов|\fs18 6');
          HeadList.Add('\fs18 Примечание|7');
          StrToStrings('30;250;60;270;100;100;120', WidthList, ';');   // 7 граф
        end;
      end else begin
        HeadList.Add('№ п/п|1');
        HeadList.Add('Фамилия, имя, отчество|2');
        HeadList.Add('Год рождения*|3');
        HeadList.Add('Место жительства (место пребывания)|4');
        if nType=1  then begin
          HeadList.Add('Подпись избирателя при получении бюллетеня|в первом туре выборов**|5');
          HeadList.Add('Подпись избирателя при получении бюллетеня|во втором туре голосования|6');
          HeadList.Add('Подпись избирателя при получении бюллетеня|в первом туре повторных выборов**|7');
          HeadList.Add('Подпись избирателя при получении бюллетеня|во втором туре голосования повторных выборов|8');
          HeadList.Add('Примечание|9');
          StrToStrings('50;270;80;300;130;130;130;130;130', WidthList, ';');   // 9 граф
        end else begin
          HeadList.Add('Подпись избирателя при получении бюллетеня**|при проведении основных выборов|5');
          HeadList.Add('Подпись избирателя при получении бюллетеня**|при проведении повторных выборов|6');
          HeadList.Add('Примечание|7');
          StrToStrings('50;380;85;350;150;150;150', WidthList, ';');   // 9 граф
        end;    
      end;

      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      if nType=1 then begin
        slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
        slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      end;
      PrintTable(sl, tb, HeadList, WidthList, slPar, 0, 12);
//      PrintString(sl, StringOfChar('-',30)+'\par', 0, 10, false, false, false);
      PrintString(sl, '*	В отношении избирателей, которым в текущем году до дня или в день выборов исполняется 18 лет, указываются число, месяц и год рождения.\par', 0, 10, false, false, false);
      PrintString(sl, '**	При досрочном голосовании избиратель дополнительно в этой графе указывает дату голосования.\par', 0, 10, false, false, false);

      PrintString(sl, ' \par\par ', 0, 12, false, false, false);

      PrintString(sl, 'Председатель местного исполнительного и распорядительного органа     __________                    ____________________ \par ', 0, 12, false, false, false);
      PrintString(sl, '(глава местной администрации)', 0, 12, false, false, false);
      PrintString(sl, StringOfChar(' ',72)+'(подпись)'+StringOfChar(' ',44)+'(инициалы, фамилия) \par\par ', 0, 8, false, false, false);

      PrintString(sl, 'Председатель участковой комиссии'+StringOfChar(' ',42)+'__________                    ____________________ \par ', 0, 12, false, false, false);
      PrintString(sl, StringOfChar(' ',123)+'(подпись)'+StringOfChar(' ',43)+'(инициалы, фамилия) \par\par ', 0, 8, false, false, false);

      PrintString(sl, 'Секретарь участковой комиссии'+StringOfChar(' ',46)+'__________                    ____________________ \par ', 0, 12, false, false, false);
      PrintString(sl, StringOfChar(' ',123)+'(подпись)'+StringOfChar(' ',43)+'(инициалы, фамилия) \par ', 0, 8, false, false, false);

      if FinishPrint(GetFolderMyDocument+'\СписокИзбирателей'+IntToStr(nUch)+'.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') 
          then ShellExt(GetFolderMyDocument+'\СписокИзбирателей'+IntToStr(nUch)+'.doc')
      end else begin
        PutError(strErr);
      end;
      tb.Close;
      CloseMessage;
    end;
  end else begin
    f.Free;
  end;
  finally
    tb.Free;
    sl.Free;
    slPar.Free;
    HeadList.Free;
    WidthList.Free;
  end;
end;
//---------------------------------------------------
//   списки на выборы президента
procedure SpiskiVibor;
begin
 SpiskiViborEx(1);
end;
//   списки на парламентские выборы
procedure SpiskiViborParl;
begin
 SpiskiViborEx(2);
end;

//---------------------------------------------------------------------
//   списки на местные выборы
//---------------------------------------------------------------------
procedure SpiskiViborMestn;
var
  sl,slPar: TStringList;
  HeadList: TStringList;
  WidthList,slWidth: TStringList;
  f  : TfmParamQuest;
  i,j,n,nUch,ns,nIDUch,nGR,mm  : Integer;
  d,d1 : TDateTime;
  s1,s2,s3,sss,sSI,ssort,strNameOkr,strNameUch,s,strDate,strSQL,strErr,ss,sRusGr,sAdr,sAdr2 : String;
  nYear,nMonth,nDay : Word;
  SprUch,tb,q : TDataSet;
  lA4,lFIO1,lAdresFromLic,lCheckAddAdres,lAddObl,lGor : Boolean;
  sRN,sGOR,sOBL,sMesto,sDefGor,sDefRn,sDefObl:String;
  lGKH,lNamePunkt:Boolean;
begin
  // включать граждан россии в списки
  if GlobalTask.ParamAsBoolean('RUSGR_VIBOR') then begin
    sRusGr:='n.citizen=643 or';
  end else begin
    sRusGr:='';
  end;

  SprUch := dbGetDataSet('dmBase.SprIzbUch') ;
  SprUch.First;
  if not SprUch.Eof then begin
    n := SprUch.Fld('NOMER').AsInteger;
  end else begin
    PutError(' Заполните справочник избирательных участков ! ');
    exit;
  end;
  sl:=TStringList.Create;
  slPar:=TStringList.Create;
  HeadList:=TStringList.Create;
  WidthList:=TStringList.Create;
  tb := dbCreateMemTable('NOMER,Char,15;FIO,Char,100;DATER,Char,15;MESTO,Char,200;'+
        'OKR1,Char,15;OKR2,Char,15;OKR3,Char,15;ROSP1,Char,5;ROSP2,Char,10;PRIM,Char,10;','');
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите параметры';
//  f.StepY:=17;
//  f.Flat:=false;
  f.AddParamEx(GlobalTask.ParamAsDate('DATE_VIBOR'), 'Дата выборов' , 'DATEVZ' ,'TYPE=DATE');
//  f.AddParamEx(n      , 'Избирательный участок' , 'IZBUCH','TYPE=LOOKUP~DESC=LOOKUP_SPRIZBUCH~WIDTH=400');
  f.AddParamEx(n , 'Избирательный участок' , 'IZBUCH','WIDTH=50');
  f.AddParamEx(lvString('NAME_SPIS_GR_M'), 'Название СПИСКА' , 'SPISOK','TYPE=STRING~WIDTH=500');
  f.AddParamEx(lvString('NAME_OBL_SOV'), 'областной Совет депутатов' , 'OBL_SOV','TYPE=STRING~WIDTH=500');
  f.AddParamEx(lvString('NAME_RAI_SOV'), 'районный(городской) Совет депутатов' , 'RAI_SOV','TYPE=STRING~WIDTH=500');
  f.AddParamEx(lvString('NAME_SEL_SOV'), 'сельский Совет депутатов' , 'SEL_SOV','TYPE=STRING~WIDTH=500');
  f.AddParamEx(1, 'Тип сортировки' , 'SORT','TYPE=LIST~DESC=KEY_SORTIZB~WIDTH=300');
  f.AddParamEx(1, 'Формат' , 'FORMAT','TYPE=LIST~DESC=KEY_FORMAT_SPIS~WIDTH=100');
  f.AddParamEx(false, 'ФИО в одну сроку' , 'FIO_ONE','');
  f.AddParamEx(1, '№ первого в списке' , 'FIRST_NOMER','WIDTH=50');
  f.AddParamEx(lvInteger('NNN_OBL'), '№ окр. для обл. совета по умолчанию' , 'NNN_OBL','WIDTH=50');
  f.AddParamEx(lvInteger('NNN_RN'), '№ окр. для район. совета по умолчанию' , 'NNN_RN','WIDTH=50');
  f.AddParamEx(lvInteger('NNN_GOR'), '№ окр. для гор. совета по умолчанию' , 'NNN_GOR','WIDTH=50');
  f.AddParamEx(lvBoolean('ADD_ADRES'), 'Проверять адрес жит. для выборов' , 'ADD_ADRES','');
  f.AddParamEx(lvBoolean('ADD_NAMEPUNKT'), 'Печать в адресе названия нас. пункта' , 'ADD_NAMEPUNKT','');
//  f.AddParamEx(GlobalTask.GetLastValueAsInteger('NNN_SS'), 'Номер окр. для совета' , 'NNN_SS','WIDTH=50');

//  f.AddParamEx(0, 'Сумма', '4','FORMAT=### ### ### ###.##');
//  f.AddParamEx(2, 'List', '4','TYPE=LIST~DESC=KEY_TYPE_OBJ~WIDTH=100');
//  f.AddParamEx(6, 'Spr', '5','TYPE=SPR~DESC=LOOKUP_EDIZM~WIDTH=50~DOPSHOW=NAME');
  if IdProg()='GKH' then lGKH:=true else lGKH:=false;
  lAddObl:=false;
  lGor:=false;
  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  try
  if n = 1 then begin
    lAdresFromLic:=false;         //     !!!
    lCheckAddAdres:=f.GetValue('ADD_ADRES','B');
    lNamePunkt:=f.GetValue('ADD_NAMEPUNKT','B');
    if ParamAsInteger('CH_ADRES')=0 
      then sSort:='d.punkt'
      else sSort:='s.nomer';

    if lCheckAddAdres then begin
      sAdr:=' LEFT JOIN БазаДомов d ON d.date_fiks=n.date_fiks and d.id=ifnull(n.adres_id_git,n.adres_id) ';
      sAdr2:='n.adres_id';
    end else begin
      if lAdresFromLic  then begin  // !!!
        sAdr:=' LEFT JOIN БазаДомов d ON d.date_fiks=l.date_fiks and d.id=l.adres_id ';
        sAdr2:='l.adres_id';
      end else begin
        sAdr:=' LEFT JOIN БазаДомов d ON d.date_fiks=n.date_fiks and d.id=n.adres_id ';
        sAdr2:='n.adres_id';
      end;
    end;

    //---- определим сортировать или нет нас. пункты по номеру -----
//    q:=dbOpenSQL('SELECT count(*) as nnn FROM СпрНасПунктов WHERE nomer is null','');
//    if q.Fld('nnn').AsInteger=0 then sSort:='s.nomer' else sSort:='d.punkt';
//    dbClose(q);
    //---------------------------------------------------------------

    d  := f.GetValue('DATEVZ','D');
    ns := f.GetValue('SORT','I');
    if f.GetValue('FORMAT','I')=1 
      then lA4:=true 
      else lA4:=false;
    lFIO1:=f.GetValue('FIO_ONE','B');
    n:= f.GetValue('FIRST_NOMER','I');
    slvString('NAME_SPIS_GR_M', f.GetValue('SPISOK','S'));
    slvString('NAME_OBL_SOV', f.GetValue('OBL_SOV','S'));
    slvString('NAME_RAI_SOV', f.GetValue('RAI_SOV','S'));
    slvString('NAME_SEL_SOV', f.GetValue('SEL_SOV','S'));
    slvInteger('NNN_OBL', f.GetValue('NNN_OBL','I'));
    slvInteger('NNN_RN', f.GetValue('NNN_RN','I'));
    slvInteger('NNN_GOR', f.GetValue('NNN_GOR','I'));
    slvBoolean('ADD_ADRES', lCheckAddAdres);
    slvBoolean('ADD_NAMEPUNKT', lNamePunkt);
    slvDate('DATE_VIBOR', d);
    DecodeDate(d,nYear,nMonth,nDay);
    if lvInteger('NNN_GOR')<>0 
      then lGor:=true;
    if not lGor and (lvInteger('NNN_OBL')<>0) 
      then lAddObl:=true;
    if lGKH then begin
      lAddObl:=true;
      lGor:=true;
    end;

    // ширины граф таблицы
    slWidth:=TStringList.Create;
    if not lA4 then begin
      StrToStrings('50;270;80;300;90;90;90;130;130;100', slWidth, ';');      // 10 граф
    end else begin
      if lGKH then begin
        StrToStrings('30;240;60;220;40;40;40;90;90;65', slWidth, ';')  // 10 граф
      end else begin
        if lAddObl or lGor
          then  StrToStrings('30;240;60;220;40;40;65;85;85;65', slWidth, ';')  // 10 граф
          else  StrToStrings('30;240;60;220;60;65;90;90;70', slWidth, ';');    // 9  граф
      end;
    end;

    nYear := nYear-18;
    nUch := f.GetValue('IZBUCH','N');
    f.Free;
    d1 := EncodeDate(nYear,nMonth,nDay);
    strDate := DateToSQL(d);
    if not dbLocate(SprUch,'NOMER',[nUch],'') then begin
      PutError(' Не выбран избирательный участок !');
    end else begin
      j:=0;
      while (SprUch.Fld('NOMER').AsInteger=nUch) and not SprUch.Eof do begin 
        j:=j+1;
        SprUch.Next
      end;
      dbLocate(SprUch,'NOMER',[nUch],'');

      while (SprUch.Fld('NOMER').AsInteger=nUch) and not SprUch.Eof do begin // <---------

        strNameUch := SprUch.Fld('NAME').AsString;
        strNameOkr := SprUch.Fld('NAME').AsString;
        nIDUch := SprUch.Fld('ID').AsInteger;
        s := SprUch.Fld('PUNKTS').AsString;
        ss:= GetFieldWhere(s,'id');
  //      s := GetFieldWhere2(s,'d.Punkt',SprUch.Fld('UL').AsString,'d.ul');
        s := GetWherePunktUlDom(nIDUch,s,'d.Punkt',SprUch.Fld('UL').AsString,'d.ul',dbGetDataSet('dmBase.SprIzbUch2'), false);
  //      s := GetFieldWhere(s,'d.Punkt');
        strSQL := 'SELECT s.nomer,familia, n.name name1, otch, dater, lic_id, d.punkt, '+sAdr2+', n.adres_id_git, 1 ppp, u.name, d.dom, d.dom1, d.dom2, d.korp, d.kv '+
          ' FROM Население n '+
          ' LEFT JOIN ЛицевыеСчета l ON l.date_fiks=n.date_fiks and l.id=n.lic_id '+
          sAdr+  // LEFT JOIN БазаДомов
          ' LEFT JOIN СпрНасПунктов s ON d.punkt=s.id '+
          ' LEFT JOIN СпрУлиц u ON u.id=d.ul '+
          ' WHERE n.date_fiks='+QStr('1899-12-30')+' and ( '+sRusGr+' n.citizen=112 or n.citizen is null ) and '+
          ' (n.notselect is null or n.notselect=false) and (n.adres_id is not null and n.adres_id>0) and '+
          getStrPropis+' and '+
          ' (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+')>18 '+
          ' or (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+'))=18 and '+
          ' dater<='+DateToSQL(d1)+' ) and ('+ s + ') '
        if ns<>4 then begin
          strSQL:=strSQL+'   union all '+
          ' SELECT nomer,'+QStr(' ')+', name name1, '+QStr(' ')+', CURDATE( ), 0, id as punkt, 0, 0, 0,'+QStr('')+', '+QStr('')+','+QStr('')+','+QStr('')+','+QStr('')+','+QStr('')+
          ' FROM СпрНасПунктов WHERE '+ss+' ';
        end;
        if ns=1 then begin
          strSQL := strSQL+' ORDER BY '+sSort+',familia,name1';
        end else if ns=2 then begin
          strSQL := strSQL+' ORDER BY '+sSort+',ppp,u.name,d.dom1,d.dom2,d.korp,d.kv';
        end else if ns=3 then begin
          strSQL := strSQL+' ORDER BY '+sSort+',ppp,u.name,familia';
        end else begin
          strSQL := strSQL+' ORDER BY familia,name1';
        end;
//        writedebug(strSQL);
        OpenMessage(' Формирование списка избирателей ... ','',10);
        q:=dbOpenSQL(strSQL,'');
        tb.Open;

        if j>1 then begin
          tb.Append;
          tb.Fld('MESTO').AsString:='\b\fs28\qc '+strNameOkr +'\b0';
          tb.Post;
        end;
        i:=lvInteger('NNN_RN');
        if i<1 then sDefRn:='' else sDefRn:=IntToStr(i);
        i:=lvInteger('NNN_OBL');
        if i<1 then sDefObl:='' else sDefObl:=IntToStr(i);
        i:=lvInteger('NNN_GOR');
        if i<1 then sDefGor:='' else sDefGor:=IntToStr(i);

        s := '1234567890';
        j := 10;
        while not q.Eof do begin
          tb.Append;
          if q.Fld('adres_id').AsInteger=0 then begin
            tb.Fld('MESTO').AsString:='\b\fs28\qc '+q.Fld('name1').AsString+'\b0';
            s := q.Fld('name1').AsString;
            j := Length(s);
          end else begin
            if SprUch.Fld('OKRUG_RN').AsString=''  then sRN:=sDefRn   else sRN:=SprUch.Fld('OKRUG_RN').AsString;
            if SprUch.Fld('OKRUG_GOR').AsString='' then sGor:=sDefGor else sGor:=SprUch.Fld('OKRUG_GOR').AsString;
            if SprUch.Fld('OKRUG_OBL').AsString='' then sObl:=sDefObl else sObl:=SprUch.Fld('OKRUG_OBL').AsString;
            sSI:=SprUch.Fld('OKRUG').AsString;

            tb.Fld('NOMER').AsString:='\qr '+IntToStr(n);
            if lFIO1 then sss:=' ' else sss:='\par ';

            if IdProg()='GKH' then begin
              s1:=sObl;
              s2:=sRN;
              s3:=sGOR;
            end else begin
              if lGor then begin
                s1:=sRN;
                s2:=sGOR;
                s3:=sSI;
              end else begin
                if lAddObl then begin
                 s1:=sOBL;
                 s2:=sRN;
                 s3:=sSI;
                end else begin
                  s1:=sRN;
                  s2:=sSI;
                  s3:='';
                end;
              end;
            end;

            tb.Fld('OKR1').AsString:='\qc '+s1;
            tb.Fld('OKR2').AsString:='\qc '+s2;
            tb.Fld('OKR3').AsString:='\qc '+s3;

            tb.Fld('FIO').AsString:='\b\fs28\qc '+FirstUpper(q.Fld('Familia').AsString)+sss+
                                     FirstUpper(q.Fld('Name1').AsString)+' '+FirstUpper(q.Fld('Otch').AsString)+'\b0';

            if StrToInt(FormatDateTime('yyyy',q.Fld('DateR').AsDateTime))<>nYear 
              then tb.Fld('DATER').AsString:='\qc '+FormatDateTime('yyyy',q.Fld('DateR').AsDateTime)
              else tb.Fld('DATER').AsString:='\qc '+FormatDateTime('dd.mm.yyyy',q.Fld('DateR').AsDateTime);
            if lCheckAddAdres and (q.Fld('adres_id_git').AsString<>'') then begin
              sMesto:=dmBase.AdresFromID(EncodeDate(1899,12,30),q.Fld('adres_id_git').AsString,false);
            end else begin
              sMesto:=dmBase.AdresFromID(EncodeDate(1899,12,30),q.Fld('adres_id').AsString,false);
            end;
            if not lNamePunkt then begin
              mm:=Pos(',',sMesto);
              if mm>0 then begin
                sMesto:=Trim(Copy(sMesto,mm+1,300));
              end;
            end;
            tb.Fld('MESTO').AsString:=sMesto;
//            if Copy(tb.Fld('MESTO').AsString,1,j)=s 
//              then tb.Fld('MESTO').AsString:=Copy(tb.Fld('MESTO').AsString,j+2,200);
  //          tb.Fld('OKR1').AsString:=' \par\par ';
            tb.Post;
            n:=n+1;
          end;
          q.Next;
        end;
        dbClose(q);
  
        SprUch.Next;
  
      end; // <---------------------------------------

      if lvInteger('NNN_OBL')>0 
        then s1:=lvString('NNN_OBL')
        else s1:='   ';
      if lvInteger('NNN_RN')>0 
        then s2:=lvString('NNN_RN')
        else s2:='   ';

      if lA4 
        then  StartPrint(sl, poLandscape, pfA4)
        else  StartPrint(sl, poLandscape, pfA3);
  //    PrintString(sl, UpperCase(NameOrg('Б',''))+'\par ', 0, 12, False, False, False);
  //    PrintString(sl, UpperCase(NameOrg('',''))+'\par ', 0, 12, False, False, False);
  //    PrintString(sl, '\ldblquote   '+IntToStr(nDay)+'  \rdblquote   '+GetMonthPropis(GlobalTask.CurrentDate,'Р')+'   '+IntToStr(nYear)+' №___\par\par ', 0, 12, False, False, False);
//StringOfChar(' ',120)+
      PrintString(sl, '\qc '+DatePropis(d,2)+' \par\par ', 0, 12, False, False, true);
      PrintString(sl, '\qc СПИСОК\par ', 0, 14, true, False, False);
      PrintString(sl, '\qc '+lvString('NAME_SPIS_GR_M')+' \par\par ', 0, 14, true, False, False);
      PrintString(sl, 'Участок для голосования № '+IntToStr(nUch)+'      '+strNameUch+' \par\par ', 0, 12, False, False, true);
      PrintString(sl, 'избирательный округ № '+s1+'     по выборам  '+ lvString('NAME_OBL_SOV')+' \par ', 0, 12, false, false, true);
      PrintString(sl, '   (наименование избирательного округа по выборам депутата областного Совета депутатов) \par\par ', 0, 8, false, false, false);
      PrintString(sl, 'избирательный округ № '+s2+'     по выборам  '+ lvString('NAME_RAI_SOV')+' \par ', 0, 12, false, false, true);
      PrintString(sl, '   (наименование избирательного округа по выборам депутата районного, городского Совета депутатов) \par\par ', 0, 8, false, false, false);
      PrintString(sl, 'избирательный округ №            по выборам  '+ lvString('NAME_SEL_SOV')+' \par ', 0, 12, false, false, true);
      PrintString(sl, '   (наименование избирательного округа по выборам депутата городского(города районного подчинения) поселкового, сельского Совета депутатов) \par\par\par ', 0, 8, false, false, false);

//      PrintString(sl, '   (наименование избирательного округа по выборам депутата областного Совета депутатов)'+StringOfChar(' ',200)+'(наименование областного Совета депутатов) \par ', 0, 8, false, false, false);
      for i:=0 to slWidth.Count-1 do begin
        WidthList.Add(slWidth.Strings[i]);
      end;
      sss:='Номер избирательного округа по выборам депутатов местных Советов депутатов';
      if lA4 then begin
        HeadList.Add('\fs18 № п/п|\fs18 1');
        HeadList.Add('\fs18 Фамилия, имя, отчество|\fs18 2');
        HeadList.Add('\fs18 Год рождения|\fs18 3');
        HeadList.Add('\fs18 Место жительства|\fs18 4');
        nGr:=5;
        if lAddObl then begin
          HeadList.Add('\fs18 '+sss+'|\fs18 област- ного Совета|\fs18 '+IntToStr(nGR));
          nGR:=nGR+1;
        end;
        HeadList.Add('\fs18 '+sss+'|\fs18 район- ного Совета|\fs18 '+IntToStr(nGR));
        nGR:=nGR+1
        if lGor then begin
          HeadList.Add('\fs18 '+sss+'|\fs18 город- ского Совета|\fs18 '+IntToStr(nGR));
          nGR:=nGR+1;
        end;
        if not lGKH then begin
          HeadList.Add('\fs18 '+sss+'|\fs18 поселкового или сельского Совета|\fs18 '+IntToStr(nGR));
          nGR:=nGR+1;
        end;
        HeadList.Add('\fs18 Подпись избирателя при получении бюллетеня|\fs18 при проведении основных выборов|\fs18 '+IntToStr(nGR));
        nGR:=nGR+1;
        HeadList.Add('\fs18 Подпись избирателя при получении бюллетеня|\fs18 при проведении повторных выборов|\fs18 '+IntToStr(nGR));
        nGR:=nGR+1;
        HeadList.Add('\fs18 Примечание|\fs18 '+IntToStr(nGR));
      end else begin
        HeadList.Add('№ п/п|1');
        HeadList.Add('Фамилия, имя, отчество|2');
        HeadList.Add('Год рождения|3');
        HeadList.Add('Место жительства|4');
        if lAddObl then begin
          HeadList.Add(sss+'|областного Совета|6');
          HeadList.Add(sss+'|районного Совета|5');
        end else begin
          HeadList.Add(sss+'|районного Совета|5');
          HeadList.Add(sss+'|городского Совета|6');
        end;
        if lGor 
          then HeadList.Add(sss+'|городского Совета|7')
          else HeadList.Add(sss+'|поселкового или сельского Совета|7');
        HeadList.Add('Подпись избирателя при получении бюллетеня|при проведении основных выборов|8');
        HeadList.Add('Подпись избирателя при получении бюллетеня|при проведении повторных выборов|9');
        HeadList.Add('Примечание|10');
      end;
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs\fs28');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      if not lA4 or lAddObl or lGor then slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      PrintTable(sl, tb, HeadList, WidthList, slPar, 0, 12);
      PrintString(sl, ' \par\par ', 0, 12, false, false, false);
      PrintString(sl, 'Председатель  ___________________________ участковой избирательной комиссии \par\par ', 0, 12, false, false, false);
      PrintString(sl, '№ ______ по выборам депутатов местных Советов депутатов Республики Беларусь   __________                      ____________________ \par ', 0, 12, false, false, false);
      PrintString(sl, StringOfChar(' ',142)+'(подпись)'+StringOfChar(' ',45)+'(инициалы, фамилия) \par\par ', 0, 8, false, false, false);
      PrintString(sl, 'Секретарь        ___________________________ участковой избирательной комиссии \par\par ', 0, 12, false, false, false);
      PrintString(sl, '№ ______ по выборам депутатов местных Советов депутатов Республики Беларусь   __________                      ____________________ \par ', 0, 12, false, false, false);
      PrintString(sl, StringOfChar(' ',142)+'(подпись)'+StringOfChar(' ',45)+'(инициалы, фамилия) \par ', 0, 8, false, false, false);

      if FinishPrint(GetFolderMyDocument+'\СписокИзбирателей'+IntToStr(nUch)+'.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') 
          then ShellExt(GetFolderMyDocument+'\СписокИзбирателей'+IntToStr(nUch)+'.doc')
      end else begin
        PutError(strErr);
      end;
      tb.Close;
      CloseMessage;
    end;
    slWidth.Free;
  end else begin
    f.Free;
  end;
  finally
    tb.Free;
    sl.Free;
    slPar.Free;
    HeadList.Free;
    WidthList.Free;
  end;
end;

//------------------------------------
//----- различные СПИСКИ -------------
//------------------------------------
function ListSved_UserForm:boolean;
var
  f:TfmParamQuest;
  n:Integer;
  sUch:String;
begin
  Result:=false;
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите параметры';
  f.AddParamEx(lvDate('VUS_DATE1') , 'Начальная дата', 'DATE1','TYPE=DATE~REQ=1');
  f.AddParamEx(lvDate('VUS_DATE2') , 'Конечная дата', 'DATE2','TYPE=DATE~REQ=1');
  f.AddButtons('<OK>Выполнить~Отказ',0);
  n:=f.ShowQuest;
  if (n=1) and (f.GetValue('DATE1','D')>0) and (f.GetValue('DATE2','D')>0) then begin
    slvDate('VUS_DATE1', f.GetValue('DATE1','D'));
    slvDate('VUS_DATE2', f.GetValue('DATE2','D'));
    SetGlobalVar('DATE1',f.GetValue('DATE1','D'));
    SetGlobalVar('DATE2',f.GetValue('DATE2','D'));
    Result:=true;
  end;
  f.Free;
end;
//
function ListSved(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   dsSup,ds,q:TDataSet;
   sID,strSQL,d1,d2,s,s1,s2,s3,s4 : String;
begin
  Result:=true;
  ds:=GetTemplateDataSet('MAIN');
  if ds<>nil then begin
    if not ds.Active then ds.Open;
    ds.Edit;
    ds.Fld('SHTAMP').AsString:=GetShtampSpr();
    ds.Fld('PRIL').AsString:=getPril(-1,'VOEN_PRIP',14);
    ds.Fld('DATESOST').AsString:=DatePropis(NOW,2);
    ds.Fld('PERIOD').AsString:=DatePropis(getGlobalvar('DATE1'),3)+' по '+DatePropis(getGlobalvar('DATE2'),3);
    ds.Fld('RUKOV').AsString :=DolgRukov()+'             '+FIORukov();
    ds.Post;
    ds:=GetTemplateDataSet('TABLSOST');
    strSQL := 'SELECT n.*, d.suprug_id, v.* '+
        ' FROM VUS v '+Chr(13)+
        ' LEFT JOIN Население n ON n.date_fiks=&datefiks& and n.id=v.id '+Chr(13)+
        ' LEFT JOIN НаселениеДоп d ON n.id=d.id '+Chr(13)+
        ' WHERE (prib_date>=&d1& and prib_date<=&d2&) or (ubit_date>=&d1& and ubit_date<=&d2&) or (datesost>=&d1& and datesost<=&d2&)'+Chr(13)+
        ' ORDER BY familia,name,otch ';
    strSQL:=dmBase.CheckParamsSQL(strSQL);
    strSQL:=StringReplace(strSQL, '&d1&', DateToSQL(getGlobalvar('DATE1')));
    strSQL:=StringReplace(strSQL, '&d2&', DateToSQL(getGlobalvar('DATE2')));
    OpenMessage(' Формирование списка ... ','',10);
    MemoWrite('report.sql',strSQL);

    q:=dbOpenSQL(strSQL,'');
    s1:='Исключен';
    s2:='Снят';
    s3:='Принят';
    s4:='супруг';
    if q.Fld('POL').AsString='Ж' then begin
      s1:=s1+'а';
      s2:=s2+'а';
      s3:=s3+'а';
    end else begin
      s4:=s4+'а';
    end;
    while not q.Eof do begin
//      writedebug('ubit_date:'+Inttostr(datetoint(q.fld('ubit_date').AsDateTime))+'  datesost:'+Inttostr(datetoint(q.Fld('datesost').AsDateTime))+'  prib_date:'+Inttostr(datetoint(q.Fld('prib_date').AsDateTime)));
      sID:=q.Fld('ID').AsString;
      ds.Append;
      if not q.Fld('ubit_date').IsNull then begin
        if q.Fld('vus_iskl').AsBoolean then s:=s1 else s:=s2;
        s:=s+' с учета '+DatePropis(q.Fld('ubit_date').AsDateTime,3)+' '+q.Fld('UBIT_TEXT').AsString;
      end else if not q.Fld('datesost').IsNull and (DateToInt(q.fld('datesost').AsDateTime)>DateToInt(q.fld('prib_date').AsDateTime)) then begin 
        s:='Изменение данных '+DatePropis(q.Fld('datesost').AsDateTime,3);
      end else if not q.Fld('prib_date').IsNull then begin 
        s:=s3+' на учет '+DatePropis(q.Fld('prib_date').AsDateTime,3);
      end;
      ds.Fld('OSNOV').AsString:=s;
      ds.Fld('ZVAN').AsString:=Concat2Str(Trim(ValueFromKey('KEY_VUS_ZVANI',q.Fld('ZVAN').AsString,'',false)+' '+ValueFromKey('KEY_VUS_ZVANI2',q.Fld('ZVAN2').AsString,'',false)), 
                                          q.Fld('NOMER_VUS').AsString,', ');
      ds.Fld('FIO').AsString:=q.Fld('Familia').AsString+' '+q.Fld('Name').AsString+' '+q.Fld('Otch').AsString+Concat_IF2(', ',q.Fld('LICH_NOMER').AsString);
      ds.Fld('DATER').AsString:=DatePropis(q.Fld('DateR').AsDateTime,3);
      ds.Fld('MESTOG').AsString:=dmBase.AdresFromID(DateFiks,q.Fld('adres_id').AsString,false);
      ds.Fld('MESTOP').AsString:=q.Fld('adres_git').AsString;
      s:='';
      if q.Fld('suprug_id').AsInteger>0 then begin
        dsSup:=dmBase.getMen(DateFiks, q.Fld('suprug_id').AsString);
        if dsSup<>nil then begin
          s:=s4+' '+createFIO(dsSup)+' '+DatePropis(dsSup.Fld('DATER').AsDateTime,3);
        end;
      end;
      if s='' then s:=q.Fld('SOSTAV_SEM').AsString
              else s:=s+Concat_IF2(', ',q.Fld('SOSTAV_SEM').AsString);
      ds.Fld('SEM').AsString:=s;
      ds.Fld('OBR').AsString:=ValueFromKey('KEY_OBRAZ',q.Fld('OBRAZ').AsString,'',false);
      ds.Fld('WORK').AsString:=dmBase.getMenWork(DateFiks,sID);
      if ds.Fld('WORK').AsString=''
        then ds.Fld('WORK').AsString:=dmBase.getMenStud(DateFiks,sID)
        else ds.Fld('WORK').AsString:=ds.Fld('WORK').AsString+Concat_IF2(', ',dmBase.getMenDolg(DateFiks,sID));
      s:='';
      if q.Fld('TELEFON_M').AsString<>'' then s:='моб.'+q.Fld('TELEFON_M').AsString+CRLF;
      if q.Fld('AGIT_TEL').AsString<>''  then s:=s+'преб.'+q.Fld('AGIT_TEL').AsString+CRLF;
      if q.Fld('WORK_TELEF').AsString<>''  then s:=s+'раб.'+q.Fld('WORK_TELEF').AsString;
      ds.Fld('TEL').AsString:=dmbase.getMenTel(DateFiks,sID,'MDPR',', ');//CRLF);    
      ds.Fld('OTMETKA').AsString:=q.Fld('SPEC_TEXT').AsString;
      ds.Post;
      q.Next;
    end;
    dbClose(q);
    CloseMessage;
  end;
end;
//==================================================================
function ListPripis_UserForm:boolean;
var
  f:TfmParamQuest;
  n:Integer;
  sUch:String;
begin
  Result:=false;
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите параметры';
  f.AddParamEx(lvDate('PRIP_DATE1') , 'Дата рождения с', 'DATE1','TYPE=DATE~REQ=1');
  f.AddParamEx(lvDate('PRIP_DATE2') , 'Дата рождения по', 'DATE2','TYPE=DATE~REQ=1');
  f.AddParamEx(true , 'Только мужчины', 'ONLYM','');
  f.AddParamEx(true , 'Включать временно отсутствующих', 'VREM','');
  f.AddParamEx(lvString('N_PRIZ_UCH'), 'Номер призывного участка', 'PRIZ_UCH','WIDTH=120');
  f.AddParamEx(lvInteger('ORIENT_LP'), 'Ориентация листа', 'ORIENT','TYPE=LIST~DESC=KEY_ORIENT~WIDTH=120');
  f.AddButtons('<OK>Выполнить~Отказ',0);
  n:=f.ShowQuest;
  if (n=1) and (f.GetValue('DATE1','D')>0) and (f.GetValue('DATE2','D')>0) then begin
    slvDate('PRIP_DATE1', f.GetValue('DATE1','D'));
    slvDate('PRIP_DATE2', f.GetValue('DATE2','D'));
    slvString('N_PRIZ_UCH', f.GetValue('PRIZ_UCH','S'));
    slvInteger('ORIENT_LP', f.GetValue('ORIENT','N'));
    SetGlobalVar('PRIZ_UCH',f.GetValue('PRIZ_UCH','C'));
    SetGlobalVar('DATE1',f.GetValue('DATE1','D'));
    SetGlobalVar('DATE2',f.GetValue('DATE2','D'));
    SetGlobalVar('ONLYM',f.GetValue('ONLYM','L'));
    SetGlobalVar('VREM',f.GetValue('VREM','L'));
    SetGlobalVar('ORIENT',f.GetValue('ORIENT','N'));
    Result:=true;
  end;
  f.Free;
end;
//
function ListPripis_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if getGlobalvar('ORIENT')=0 then begin
    Result:='Список подлежащих приписке_АЛБ.doc';
  end else begin
    Result:='Список подлежащих приписке.doc';
  end;
end;
//
function ListPripis(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,q:TDataSet;
   strSQL,strID,s,ss : String;
begin
  Result:=true;
  ds:=GetTemplateDataSet('MAIN');
  if ds<>nil then begin
    if not ds.Active then ds.Open;
    ds.Edit;
    ds.Fld('SHTAMP').AsString:=GetShtampSpr();
    ds.Fld('PRIL').AsString:=getPril(-1,'VOEN_PRIP',1);
    ds.Fld('DATESOST').AsString:=DatePropis(NOW,2);
//    ds.Fld('GODR').AsString:=getGlobalvar('YEAR');
    ds.Fld('PRIZ_UCH').AsString := getGlobalvar('PRIZ_UCH');
    s:='';
    if getGlobalvar('ONLYM') then begin
      s:=' and pol='+QStr('М');
    end;
    ds.Fld('RUKOV').AsString :=DolgRukov()+'             '+FIORukov();
    ds.Post;
    ds:=GetTemplateDataSet('TABLSOST');
    ss:=' and '+getStrPropis2(getGlobalvar('VREM'),false);
    strSQL := 'SELECT id, familia, name, otch, dater, lic_id, adres_id '+
        ' FROM Население n '+Chr(13)+
        ' WHERE n.date_fiks='+QStr('1899-12-30')+' and dater is not null and dater>='+DateToSQL(getGlobalvar('DATE1'))+' and dater<='+DateToSQL(getGlobalvar('DATE2'))+ss+s+Chr(13)+
        ' ORDER BY familia,name,otch ';
    OpenMessage(' Формирование списка ... ','',10);
    MemoWrite('report.sql',strSQL);
    q:=dbOpenSQL(strSQL,'');
    while not q.Eof do begin
      ds.Append;
      ds.Fld('FIO').AsString:=q.Fld('Familia').AsString+' '+q.Fld('Name').AsString+' '+q.Fld('Otch').AsString;
      ds.Fld('MESTOR').AsString:=dmBase.getMenWork(DateFiks,q.Fld('ID').AsString);
      ds.Fld('GODR').AsString:=IntToStr(YearOf(q.Fld('DateR').AsDateTime));
      if ds.Fld('MESTOR').AsString=''
        then ds.Fld('MESTOR').AsString:=dmBase.getMenStud(DateFiks,q.Fld('ID').AsString);
//      ds.Fld('MESTOR').AsString:=datePropis(q.Fld('DATER').AsDateTime,1)+' '+ds.Fld('MESTOR').AsString;
      ds.Fld('MESTOG').AsString:=dmBase.AdresFromID(DateFiks,q.Fld('adres_id').AsString,false);
      ds.Fld('OTMETKA').AsString:='';
      ds.Post;
      q.Next;
    end;
    dbClose(q);
    CloseMessage;
  end;
end;
//---------------------------------------------------
// дети прод на территории
function ListDetiProg_UserForm:boolean;
var
  f:TfmParamQuest;
  n:Integer;
  d:TDateTime;
begin
  Result:=false;
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите параметры';
  d:=lvDate('DATE_LIST');
  if d<=0 then d:=NOW;
  f.AddParamEx(d, 'На дату' , 'DATE_LIST' ,'TYPE=DATE');
  f.AddParamEx(0, 'Начальный возраст' , 'VOZR1' ,'WIDTH=50');
  f.AddParamEx(17, 'Конечный возраст' , 'VOZR2' ,'WIDTH=50');
  f.AddParamEx(lvInteger('PUNKT'),'Населенный пункт', 'PUNKT','TYPE=LOOKUP~DESC=LOOKUP_PUNKT~WIDTH=150');
  f.AddParamEx(false , 'Включать временно отсутствующих', 'NOT_PRESENT','');
  f.AddParamEx(true  , 'Заполнять учебное заведение', 'YES_UCH','');
  f.AddParamEx(false , 'Учитывать дату прибытия', 'IS_DATE_PRIB','');
  f.AddParamEx(NOW , 'Начальная дата прибытия', 'DATE_PRIB1','');
  f.AddParamEx(NOW , 'Конечная дата прибытия', 'DATE_PRIB2','');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  if n = 1 then begin
    slvInteger('PUNKT', f.GetValue('PUNKT','I'));
    slvInteger('VOZR1', f.GetValue('VOZR1','I'));
    slvInteger('VOZR2', f.GetValue('VOZR2','I'));
    slvDate('DATE_LIST', f.GetValue('DATE_LIST','D'));
    slvBoolean('NOT_PRESENT', f.GetValue('NOT_PRESENT','L'));
    SetGlobalVar('IS_DATE_PRIB', f.GetValue('IS_DATE_PRIB','L'));
    SetGlobalVar('DATE_PRIB1', f.GetValue('DATE_PRIB1','D'));
    SetGlobalVar('DATE_PRIB2', f.GetValue('DATE_PRIB2','D'));
    SetGlobalVar('NAME_PUNKT',f.GetValueAsText('PUNKT'));
    SetGlobalVar('YES_UCH',f.GetValue('YES_UCH','L'));
    Result:=true;
  end;
  f.Free;
end;
function ListDetiProg(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,q,dsR:TDataSet;
   strSQL,strID,s,sVozr,sNamePrib,sNameVozr : String;
   nPunkt,nVozr1,nVozr2:Integer;
   dSost,d1,d2:TDateTime;
   lUch:Boolean;
begin
  Result:=true;
  ds:=GetTemplateDataSet('MAIN');
  if ds<>nil then begin
    if not ds.Active then ds.Open;
    ds.Edit;
    nPunkt:=lvInteger('PUNKT');
    if nPunkt<=0 
      then s:=''
      else s:=' and d.punkt='+IntToStr(nPunkt);
    // только присутствующих
    if not lvBoolean('NOT_PRESENT') then begin
      s:=s+' and n.present=true';
    end;
    dSost:= lvDate('DATE_LIST');
    nVozr1:= lvInteger('VOZR1');
    if nVozr1<0 then nVozr1:=0;
    nVozr2:= lvInteger('VOZR2');
    if nVozr1<0 then nVozr2:=0;
    sNameVozr:='';
    if nVozr1<>0 then sNameVozr:=' от '+IntToStr(nVozr1);
    if nVozr2<>0 then sNameVozr:=sNameVozr+' до '+IntToStr(nVozr2);
    if sNameVozr<>'' then sNameVozr:=' ( '+sNameVozr+' лет включительно )';

    sVozr:='';
    if nVozr1<=0 then sVozr:='' else sVozr:=' GetVozrast('+DateToSQL(dSost)+',n.dater)>='+IntToStr(nVozr1);
    if nVozr2>0 then begin
      if sVozr<>'' then sVozr:=sVozr+' and ';
      sVozr:=sVozr+' GetVozrast('+DateToSQL(dSost)+',n.dater)<='+IntToStr(nVozr2);
    end;
    if sVozr<>'' then sVozr:=' and '+sVozr;

    sNamePrib:='';
    if GetGlobalVar('IS_DATE_PRIB') then begin
      d1:=GetGlobalVar('DATE_PRIB1');
      d2:=GetGlobalVar('DATE_PRIB2');
      if (d1>0) and (d2>0) and (d1<=d2) then begin
        sNamePrib:=', прибывших с '+DatePropis(d1,3)+' по '+DatePropis(d2,3);
        s:=s+' and n.datep>='+DateToSQL(d1)+' and n.datep<='+DateToSQL(d2);
      end else begin
        PutError('Ошибка формирования даты прибытия');
      end;
    end;
    lUch := GetGlobalVar('YES_UCH');
    ds.Fld('NAME_PUNKT').AsString := GetGlobalVar('NAME_PUNKT');
    ds.Fld('VOZRAST').AsString := sNameVozr+sNamePrib;

    ds.Fld('SHTAMP').AsString := GetShtampSpr();
    ds.Fld('DATESOST').AsString := datePropis(dSost,3);
    ds.Fld('DOLG_RUK').AsString :=DolgRukov();
    ds.Fld('FIO_RUK').AsString :=FIORukov();
    ds.Post;
    ds:=GetTemplateDataSet('TABLSOST');
    strSQL := 'SELECT n.id, familia, name, otch, dater, pol, adres_id, pa_id, ma_id, kurs '+
        ' FROM Население n '+
        ' LEFT JOIN БазаДомов d ON d.date_fiks=n.date_fiks and d.id=n.adres_id '+
        ' WHERE n.date_fiks='+QStr('1899-12-30')+' and n.propis=true and n.candelete=false '+
          sVozr+s+
        ' ORDER BY familia,name,otch ';
//        ' GetVozrast('+DateToSQL(dSost)+',n.dater)<18 '+s+
//    writedebug(strSQL);
    MemoWrite('list.sql',strSQL);
    OpenMessage(' Формирование списка ... ','',10);
    q:=dbOpenSQL(strSQL,'');
    while not q.Eof do begin
      ds.Append;
      ds.Fld('FIO').AsString:=q.Fld('Familia').AsString+' '+q.Fld('Name').AsString+' '+q.Fld('Otch').AsString;
      if lUch then begin
        ds.Fld('NAME_UCH').AsString:=dmBase.getMenStud(DateFiks,q.Fld('ID').AsString);
        if q.Fld('kurs').AsString<>'' 
          then ds.Fld('NAME_UCH').AsString:=q.Fld('kurs').AsString+'кл. '+ds.Fld('NAME_UCH').AsString;
      end;
      ds.Fld('MESTOG').AsString:=dmBase.AdresFromID(DateFiks,q.Fld('adres_id').AsString,false);
      s:='';
      dsR:=dmBase.getMen(dateFiks,q.Fld('ma_id').AsString);
      if dsR<>nil then begin
        s:=dsR.Fld('Familia').AsString+' '+dsR.Fld('Name').AsString+' '+dsR.Fld('Otch').AsString;
      end;
      dsR:=dmBase.getMen(dateFiks,q.Fld('pa_id').AsString);
      if dsR<>nil then begin
        if s<>'' then s:=s+chr(13);
        s:=s+dsR.Fld('Familia').AsString+' '+dsR.Fld('Name').AsString+' '+dsR.Fld('Otch').AsString;
      end;
      ds.Fld('RODIT').AsString:=s;
      ds.Fld('POL').AsString:=q.Fld('POL').AsString;
      ds.Fld('DATER').AsString:=DatePropis(q.Fld('DATER').AsDateTime,3);
      ds.Fld('OTMETKA').AsString:='';
      ds.Post;
      q.Next;
    end;
    dbClose(q);
    CloseMessage;
  end;
end;

//------------------------------------
//---------- end списки
//------------------------------------
