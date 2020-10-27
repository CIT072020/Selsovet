const
  DEF_COUNT=2500;

procedure ListDvigPeriod;
var
  eh:TExcelHelper;
begin
//
end;

procedure Main_ExcelReport;
begin
  slExcelReport.Add('Список пустующих жилых помещений=ExcelListEmptyAdres');
  slExcelReport.Add('Льготники на оплату ЖКУ=ExcelListLgotEl');
end;

procedure fmGurnOchered_ExcelReport;
begin
  slExcelReport.Add('Cписок нуждающихся в улучшении жилищных условий=ListOchered10');
  slExcelReport.Add('Cписок с составом семьи для кадастрового агентства=ListOcheredKadastr');
  slExcelReport.Add('Отдельный список нуждающихся=ListOcheredOtd');
end;

procedure fmGurnalAdres_ExcelReport;
begin
  slExcelReport.Add('Количество проживающих для переписи=ListCountPerepis');
  slExcelReport.Add('Количество проживающих для переписи(по квартирам)=ListCountPerepisKv');
  slExcelReport.Add('----------');
//  slExcelReport.Add('Перепись. Данные по населенным пунктам=ListCountPerepis2');
//  slExcelReport.Add('----------');
  slExcelReport.Add('Количество дворов в разрезе нас. пунктов=ListCountDvor');
  slExcelReport.Add('Список для обследования дом.хозяйств (октябрь 2019)=ObsledDomHoz4');
  slExcelReport.Add('Численность скота и птицы=ObsledDomHoz5');
//  slExcelReport.Add('Список для обследования дом.хозяйств (январь 2019)=ObsledDomHoz3');
  slExcelReport.Add('Список пустующих жилых помещений=ExcelListEmptyAdres');
  slExcelReport.Add('Льготники на оплату ЖКУ=ExcelListLgotEl');
end;

const
  xlWorkbookDefault=     51;
  xlWorkbookNormal =  -4143;
  xlCSV=6;
  xlExcel8=56;    // Excel 97-2003 Workbook


function KodAllInvalid:String;
var
  ds:TDataSet;
  sCurName:String;
begin
  Result:='';
  ds:= dmBase.GetDataSet('СпрЛьготников');
  ds.First;
  while not ds.Eof do begin
    sCurName:=ANSIUpperCase(ds.FieldByName('NAME').AsString);
    if Pos('ИНВАЛИД ',sCurName)>0 then begin
      Result:=Result+ds.Fld('ID').AsString+',';
    end;
    ds.Next;
  end;
  if Result<>'' then Result:=Copy(Result,1,Length(Result)-1);
end;

//-----------------------------------
procedure ListCountPerepis;
var
  XL:Variant;
  lOk,l:Boolean;
  eh:TExcelHelper;
  q,ds:TDataSet;
  nDefCount,n,ind,nFirst,nLast:Integer;
  s,ss,sUl:String;
  sDom,sK,sRn,sPunkt,sSQL,sNameExcel:String;
begin
  if not Problem('Сформировать файл для переписи ?') then exit;
  {
  sSQL := dmBase.LoadSQLEx('Количество_перепись1');
  OpenMessage(' Выполнение проверки ...      ','',10);
  q:=dbOpenSQL(sSQL,'');
  sPunkt:='';
  nDefCount:=DEF_COUNT;
  while not q.Eof do begin 
    if q.Fld('KOLVO').AsInteger>nDefCount then begin
      sPunkt:=sPunkt+'a.punkt='+q.Fld('PUNKT').AsString+' or ';
    end;
    q.Next;
  end;
  dbClose(q);
  CloseMessage;
  }
//  if sPunkt='' then begin
//    ShowMessage('Отсутствуют нас. пункты с числом жителей больше '+IntToStr(nDefCount)+'. Выгрузка не нужна.');
//  end else begin
//    sPunkt:='('+Copy(sPunkt,1,Length(sPunkt)-4)+')';
    XL:=GetOfficeObject('Excel',lOk);
    if lOk then begin
      sNameExcel:='Количество для переписи.xls';
      XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));
      sSQL:=dmBase.LoadSQLEx('Количество_перепись2');
//      sSQL:=StringReplace(sSQL, '1=1', sPunkt);
      OpenMessage(' Выполнение выгрузки ...      ','',10);
      MemoWrite('export.sql',sSQL);
      q:=dbOpenSQL(sSQL,'');
      sRn:=ParamAsString('RAION');
      ind:=dbRecordCount(q);
      nFirst:=6;
      nLast:=6+ind-1;
      XL.Range['A3'].Value:=NameOrg('','');
      XL.Range['A4'].Value:=DatePropis(Now,1);
      eh:=TExcelHelper.Create;
      eh.SetSize(ind,12);
      eh.SetRangeExcel('A'+IntToStr(nFirst),'L'+IntToStr(nLast));
      ind:=1;
      n:=0;

      while not q.Eof do begin
        eh.SetEl(ind,1, ind);
        eh.SetEl(ind,2, q.Fld('SOATO').AsString);
        eh.SetEl(ind,3, q.Fld('TIP_PUNKT').AsString);
        eh.SetEl(ind,4, q.Fld('PUNKT').AsString);
        eh.SetEl(ind,5, q.Fld('TIP_UL').AsString);
        eh.SetEl(ind,6, q.Fld('UL').AsString);
        sDom:=ANSIUpperCase(Trim(q.Fld('DOM1').AsString)+Trim(q.Fld('DOM2').AsString));
        eh.SetEl(ind,7, sDom);
        eh.SetEl(ind,8, q.Fld('KORP').AsString);
        if Trim(q.Fld('KORP').AsString)<>'' then sK:=' к.'+Trim(q.Fld('KORP').AsString) else sK:='';
        sUl:=Trim(q.Fld('TIP_UL').AsString+' '+q.Fld('UL').AsString);
        if sUl<>'' then sUl:=', '+sUl;
        eh.SetEl(ind,9, q.Fld('TIP_PUNKT').AsString+' '+q.Fld('PUNKT').AsString+sUl+', '+sDom+sK);
        eh.SetEl(ind,10, q.Fld('KOLVO').AsInteger);
        if q.Fld('OTSUT').AsInteger>0 then
          eh.SetEl(ind,11, q.Fld('OTSUT').AsInteger);
        if q.Fld('VREM').AsInteger>0 then
          eh.SetEl(ind,12, q.Fld('VREM').AsInteger);
        ind:=ind+1;
        q.Next;
      end;
      q.First;
      CloseMessage;

      eh.ExportExcel;
      eh.Free;
      sNameExcel:=sRn+ ' район '+ParamAsString('KNAME')+'.xls';
      DeleteFile(GetFileExcel(sNameExcel));
      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
      XL.Visible:=true;
      XL:=null;
    end;
//  end;
end;
//-----------------------------------
procedure ListCountPerepisKv;
var
  XL:Variant;
  lOk,l:Boolean;
  eh:TExcelHelper;
  q,ds:TDataSet;
  nDefCount,n,ind,nFirst,nLast:Integer;
  s,ss,sUl:String;
  sKv,sDom,sK,sRn,sPunkt,sSQL,sNameExcel:String;
begin
  if not Problem('Сформировать файл для переписи (по квартирам) ?') then exit;
    XL:=GetOfficeObject('Excel',lOk);
    if lOk then begin
      sNameExcel:='Количество для переписи кв.xls';
      XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));
      sSQL:=dmBase.LoadSQLEx('Количество_перепись3');
      OpenMessage(' Выполнение выгрузки ...      ','',10);
      MemoWrite('export.sql',sSQL);
      q:=dbOpenSQL(sSQL,'');
      sRn:=ParamAsString('RAION');
      ind:=dbRecordCount(q);
      nFirst:=6;
      nLast:=6+ind-1;
      XL.Range['A3'].Value:=NameOrg('','');
      XL.Range['A4'].Value:=DatePropis(Now,1);
      eh:=TExcelHelper.Create;
      eh.SetSize(ind,13);
      eh.SetRangeExcel('A'+IntToStr(nFirst),'M'+IntToStr(nLast));
      ind:=1;
      n:=0;

      while not q.Eof do begin
        eh.SetEl(ind,1, ind);
        eh.SetEl(ind,2, q.Fld('SOATO').AsString);
        eh.SetEl(ind,3, q.Fld('TIP_PUNKT').AsString);
        eh.SetEl(ind,4, q.Fld('PUNKT').AsString);
        eh.SetEl(ind,5, q.Fld('TIP_UL').AsString);
        eh.SetEl(ind,6, q.Fld('UL').AsString);
        sDom:=ANSIUpperCase(Trim(q.Fld('DOM1').AsString)+Trim(q.Fld('DOM2').AsString));
        eh.SetEl(ind,7, sDom);
        eh.SetEl(ind,8, q.Fld('KORP').AsString);
        eh.SetEl(ind,9, q.Fld('KV').AsString);
        if Trim(q.Fld('KORP').AsString)<>'' then sK:=' к.'+Trim(q.Fld('KORP').AsString) else sK:='';
        if Trim(q.Fld('KV').AsString)<>''   then sKv:=', кв.'+Trim(q.Fld('KV').AsString) else sKv:='';
        sUl:=Trim(q.Fld('TIP_UL').AsString+' '+q.Fld('UL').AsString);
        if sUl<>'' then sUl:=', '+sUl;
        eh.SetEl(ind,10, q.Fld('TIP_PUNKT').AsString+' '+q.Fld('PUNKT').AsString+sUl+', '+sDom+sK+sKv);
        eh.SetEl(ind,11, q.Fld('KOLVO').AsInteger);
        if q.Fld('OTSUT').AsInteger>0 then
          eh.SetEl(ind,12, q.Fld('OTSUT').AsInteger);
        if q.Fld('VREM').AsInteger>0 then
          eh.SetEl(ind,13, q.Fld('VREM').AsInteger);
        ind:=ind+1;
        q.Next;
      end;
      q.First;
      CloseMessage;

      eh.ExportExcel;
      eh.Free;
      sNameExcel:=sRn+ ' район '+ParamAsString('KNAME')+'.xls';
      DeleteFile(GetFileExcel(sNameExcel));
      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
      XL.Visible:=true;
      XL:=null;
    end;
//  end;
end;
//--------------------------------
{
procedure ListCountPerepis2;
var
 XL:Variant;
 eh:TExcelHelper;
 n1,n2,n,i,nLast,nFirst,ind:Integer;
 sl : TStringList;
 ssk,sRn,sNameExcel,sNameTemp,s,sPath,sSQL,sNPunkt,sPunkt:String;
 lOk:Boolean;
 v:Variant;
 q,tb,ds:TDataSet;
begin
  n:=1; //f.ShowQuest;
  sNPunkt:='-'; //Trim(f.GetValue('SPISOK','C'));
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
    end;
  end;
  if lOk and (sPunkt<>'') then begin
    XL:=GetOfficeObject('Excel',lOk);
    if lOk then begin
      sPunkt:=Copy(sPunkt,1,Length(sPunkt)-1);
      OpenMessage(' Выполнение выгрузки ...      ','',10);
      sSQL:=dmBase.LoadSQLEx('Обследование-2018-12');
      MemoWrite('last.sql',sSQL);
      tb:=dbOpenSQL2MemTable(sSQL,'');
      sRn:=ParamAsString('RAION');
      sNameTemp:='Cельсовет перепись.xls';
      sNameExcel:=sRn+ ' район '+ParamAsString('KNAME')+'.xls';
      XL.WorkBooks.Add(GetFileExcelReport(sNameTemp));
      tb.First;
      ind:=dbRecordCount(tb);
      nFirst:=9;  // !!!
      nLast:=nFirst+ind-1;
      eh:=TExcelHelper.Create;
      eh.SetSize(ind,7);  // !!!
      eh.SetRangeExcel('A'+IntToStr(nFirst),'G'+IntToStr(nLast));
      ind:=1;
      n1:=0;
      n2:=0;
      s:=ParamAsString('KNAME');
      n:=Pos(' ',s);
      if n>0 then ssk:=Copy(s,1,n-1) else ssk:=s;
      tb.First;
      while not tb.Eof do begin
        eh.SetEl(ind,1, ind);
        eh.SetEl(ind,2, tb.Fld('SOATO').AsString);
        eh.SetEl(ind,3, ssk);
        eh.SetEl(ind,4, tb.Fld('TYPE_PUNKT').AsString); 
        eh.SetEl(ind,5, tb.Fld('NAME_PUNKT').AsString); 
        eh.SetEl(ind,6, tb.Fld('KOLVO_P').AsString); 
        eh.SetEl(ind,7, tb.Fld('KOLVO_O').AsString); 
        n1:=n1+tb.Fld('KOLVO_P').AsInteger;
        n2:=n2+tb.Fld('KOLVO_O').AsInteger;
        ind:=ind+1;
        tb.Next;
      end;
      CloseMessage;
      tb.Close;
      tb.Free;
      eh.ExportExcel;
      eh.Free;
      s:=IntToStr(nLast+1);
      XL.Range['B2'].Value:=sRn;
      XL.Range['F2'].Value:=ParamAsString('OBL');
      XL.Range['C8'].Value:='Итого по '+getPadeg(ssk,'Д')+' сельсовету';
      XL.Range['F8'].Value:=n1;
      XL.Range['G8'].Value:=n2;
      DeleteFile(GetFileExcel(sNameExcel));
      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
      XL.Visible:=true;
      XL:=null;
    end;
  end;
end;
}
//--------------------------------
procedure ListCountDvor;
var
  XL:Variant;
  lOk,l:Boolean;
  eh:TExcelHelper;
  q,ds:TDataSet;
  n,ind,nFirst,nLast:Integer;
  s,ss:String;
  sSort, sRn,sSQL,sNameExcel:String;
begin
  XL:=GetOfficeObject('Excel',lOk);
  if lOk then begin
    sNameExcel:='Количество дворов.xls';
    XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));
    sSQL := dmBase.LoadSQLEx('Количество дворов');
    if ParamAsInteger('CH_ADRES')=0 then sSort:='s.id' else sSort:='s.nomer';
    sSQL:=StringReplace(sSQL, '&order_by&', sSort);
    MemoWrite('export.sql',sSQL);
    OpenMessage(' Выполнение запроса ...      ','',10);
    q:=dbOpenSQL(sSQL,'');
    CloseMessage;
    if q=nil then begin
      PutError(dbLastError());
      XL:=null;
      exit;
    end;
    sRn:=ParamAsString('RAION');
    ind:=dbRecordCount(q);
    nFirst:=6;
    nLast:=6+ind-1;
    XL.Range['A3'].Value:=NameOrg('','');
    XL.Range['A4'].Value:=DatePropis(Now,1);
    eh:=TExcelHelper.Create;
    eh.SetSize(ind,9);
    eh.SetRangeExcel('A'+IntToStr(nFirst),'I'+IntToStr(nLast));
    ind:=1;
    while not q.Eof do begin
      eh.SetEl(ind,1, ind);
      eh.SetEl(ind,2, sRn);
      eh.SetEl(ind,3, q.Fld('TYPEPUNKT').AsString);
      eh.SetEl(ind,4, q.Fld('NAMEPUNKT').AsString);
      eh.SetEl(ind,5, q.Fld('KOLVO').AsInteger);
      eh.SetEl(ind,6, q.Fld('KOLVO1').AsInteger);
      eh.SetEl(ind,7, q.Fld('KOLVO2').AsInteger);
      eh.SetEl(ind,8, q.Fld('KOLVO_MN').AsInteger);
      eh.SetEl(ind,9, q.Fld('KOLVO0').AsInteger);
      ind:=ind+1;
      q.Next;
    end;
    q.First;
    CloseMessage;

    eh.ExportExcel;
    eh.Free;
    sNameExcel:=sRn+ ' район '+ParamAsString('KNAME')+'.xls';
//    showmessage(GetFileExcel(sNameExcel));
    DeleteFile(GetFileExcel(sNameExcel));
    XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
    XL.Visible:=true;
    XL:=null;
  end;
end;

//----------------------------------------------------------------
procedure ListOchered10;
var
  XL:Variant;
  lOk,l:Boolean;
  eh:TExcelHelper;
  q,dsOch,dsOchResh:TDataSet;
  n,ind,nFirst,nLast,nIdOch:Integer;
  sDateDog,s,ss,sPomech,sSostav,sOsn,sDate,sPredos,sIskl,sID,sSlugeb,sDopOchered,sKolvo:String;
  sNameExcel:String;
  dDatePost:TDateTime;
//  resh:TReshOchMen;
begin
  XL:=GetOfficeObject('Excel',lOk);
  if lOk then begin
    q:=dbGetDataSet('fmGurnOchered.Query');
    dsOch:=dbGetDataSet('dmBase.tbOchered');
    dsOchResh:=dbGetDataSet('dmBase.tbOcheredResh');
    if q.Fld('OCHERED_ID').AsInteger=0 then begin
      sNameExcel:='Общий список нуждающихся.xls';
    end else begin
      sNameExcel:='Отдельный список нуждающихся.xls';
    end;
    XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));

    ind:=dbRecordCount(q);
    nFirst:=8;
    nLast:=8+ind-1;
    XL.Range['A4'].Value:=GetOrganResh(q.FieldByName('ID_BASE').AsInteger);   // было NameOrg('','')
    XL.Range['A5'].Value:=DatePropis(Now,1);
    XL.Range['C'+IntToStr(nLast+2)].Value:=Ochered_Dolg;
    XL.Range['E'+IntToStr(nLast+2)].Value:=Ochered_FIO;

    eh:=TExcelHelper.Create;
    eh.SetSize(ind,12);
    eh.SetRangeExcel('A'+IntToStr(nFirst),'K'+IntToStr(nLast));
    ind:=1;
    n:=0;
    q.First;
    nIdOch:=q.Fld('OCHERED_ID').AsInteger;
    if q.Fld('OCHERED_ID').AsInteger<>0 then begin
      XL.Range['A2'].Value:='Отдельный список ('+ValueFromKey('KEY_TYPEOCHERED',IntToStr(nIdOch),'',false)+')';
    end;
//  q.DisaleControls;

    l:=dbDisableControls(q);
    OpenMessage(' Выгрузка реестра...              ','',10);
    try
    while not q.Eof do begin
      sID:=q.Fld('ID').AsString;
      sPredos:='';  // предоставлено помещение
      if dbLocate(dsOch,'OCHERED_ID;ID',[0,sId],'') then begin
        sSlugeb:=dsOch.Fld('SLUGEB_POMECH').Asstring;       // служебн. помещение
        sDopOchered:=dsOch.Fld('DOP_OCHERED').Asstring+' '+DatePropis(dsOch.Fld('DOP_DATE').AsDateTime,3);

        if not dsOch.Fld('NEW_ADRES_ID').IsNull then begin
          sPredos:=dmBase.AdresFromID(MainDateFiks,dsOch.Fld('new_adres_id').AsString,false);
          sPredos:=dmBase.AdresFromID(MainDateFiks,dsOch.Fld('new_adres_id').AsString,false);
          if dsOch.Fld('NEW_PLOSH_ALL').Asstring<>'' then 
            sPredos:=sPredos+', общ.пл. '+FormatFloat('####0.##',dsOch.Fld('NEW_PLOSH_ALL').AsFloat)+' кв.м.';
          if dsOch.Fld('NEW_DOGOVOR').Asstring<>'' then 
            sPredos:=sPredos+', дог.найма '+dsOch.Fld('NEW_DOGOVOR').AsString+' от '+DatePropis(dsOch.Fld('NEW_DATE').AsDateTime,3);
        end;
        if dsOch.Fld('UCHASTOK').AsBoolean=true then begin
          s:='предоставлен земельный участок';
          if not dsOch.Fld('UCHASTOK_DATE').IsNull 
            then s:=s+' '+DatePropis(dsOch.Fld('UCHASTOK_DATE').AsDateTime,3);
          if sPredos=''
            then sPredos:=s 
            else sPredos:=sPredos+', '+s
        end;
        if (nIdOch=0) and (dsOch.Fld('KREDIT_SUMMA').AsString<>'') then begin
          s:='льготный кредит в сумме '+dsOch.Fld('KREDIT_SUMMA').AsString;
          if sPredos=''
            then sPredos:=s 
            else sPredos:=sPredos+', '+s
        end;
      end;
//      writedebug(spredos+'  '+)
      eh.SetEl(ind,1, ind);
      eh.SetEl(ind,2, q.Fld('FAMILIA').AsString+' '+q.Fld('NAME').AsString+' '+q.Fld('OTCH').AsString);

      sSostav:=dsOch.Fld('KOLVO_SOSTAV').AsString;
      if sSostav<>'' then sSostav:=sSostav+' чел. ';
      sDateDog:='';
      if nIdOch=0 then begin  // только для общей очереди
        ss:=dmBase.SostavSemToStr(sID, 'OTN;FIO;DATER3', chr(10)); //', ');
        if ss<>'' then begin
          sSostav:=sSostav+chr(10)+ss;
        end;
      end else begin
        if not q.Fld('DATE_SROK_DN').IsNull and q.Fld('SIROTA').AsBoolean
          then sDateDog:=DatePropis(q.Fld('DATE_SROK_DN').AsDateTime,3);
      end;

      eh.SetEl(ind,3, sSostav);

//      eh.SetEl(ind,4,dmBase.AdresFromID(MainDateFiks,q.Fld('adres_id').AsString,false));
      eh.SetEl(ind,4,dmBase.AdresMen(q.Fld('id').AsString,'')); //'+SHOW'));

      s:=dmBase.HouseOwners(MainDateFiks, q.Fld('ADRES_ID').AsString, nil, 1);
      sKolvo:=dsOch.Fld('KOLVO_PROPIS').AsString;
      if sKolvo<>'' then sKolvo:=sKolvo+' чел.' else sKolvo:='';
      if nIdOch=0 then begin
        sPomech:=dsOch.Fld('KOLVO_KOMN_PR').AsString+' комн.';
        sPomech:=sPomech+', '+dsOch.Fld('PLOSH_ALL').asString+' кв.м.';
        sPomech:=sPomech+', '+s;
//        ss:=SeekValueSpr('SprTypeHouse','ID',q.Fld('TYPEHOUSE').AsString,'NAME');
        sPomech:=sPomech+', '+sKolvo;    
      end else begin
        sPomech:=dsOch.Fld('PLOSH_ALL').asString+' кв.м.';
        sPomech:=sPomech+', '+s;
        sPomech:=sPomech+', '+sKolvo;    
      end;
      eh.SetEl(ind,5,sPomech);

      dmBase.FillReshOch(_resh, q.Fld('ID_POST_RESH').AsInteger);
      sOsn:=_resh.GetTextOsnov(OCH_OSN_UKAZ,false);    // пункт+указ
      sDate:='';
      dDatePost:=0;
      if (_resh.TIP>-1) and (_resh.DateR>0) then begin
        sDate:=DatePropis(q.Fld('DEC_DATE').AsDateTime,3);
        if not q.Fld('DEC_TIME').IsNull then begin
          sDate:=sDate+' '+FormatDateTime('hh:mm',q.Fld('DEC_TIME').AsDateTime);
        end;
        if _resh.Nomer<>'' then s:=', №'+_resh.Nomer else s:='';
        sDate:=sDate+s;
        if _resh.DateR>0 then begin 
          dDatePost:=_resh.DateR;
          sDate:=sDate+' от '+DatePropis(_resh.DateR,3);
        end;   
      end;
//      resh.Free;

      if nIdOch=0 then begin   // общая очередь
        eh.SetEl(ind,6,sOsn);
        eh.SetEl(ind,7,sDate);
      end else begin
        eh.SetEl(ind,7,sOsn);
        eh.SetEl(ind,6,sDate);
      end;

      sDate:='';
      sIskl:='';
      dmBase.FillReshOch(_resh,q.Fld('ID_SN_RESH').AsInteger);
      if (_resh.TIP>-1) and (_resh.Nomer<>'') then begin
        if (dDatePost=0) or (_resh.DATER>dDatePost) then begin   // дата решения о снятии больше даты решения постановки
          sIskl:=DatePropis(_resh.DATER,3)+' '+', №'+_resh.Nomer
//          s:=_resh.GetTextOsnov(OCH_OSN_KRAT,true);
          s:=_resh.GetTextOsnov(OCH_OSN_UKAZ,false);
          if s<>'' then sIskl:=sIskl+', '+s;
        end;
      end;
//      resh.Free;

      if nIdOch=0 then begin   // общая очередь
        eh.SetEl(ind,8,  sDopOchered);
        eh.SetEl(ind,9,  sSlugeb);
        eh.SetEl(ind,10, sPredos);
        eh.SetEl(ind,11, sIskl);
      end else begin
        eh.SetEl(ind,8, sKolvo);
        eh.SetEl(ind,9, sPredos);
        eh.SetEl(ind,10, sDateDog); // DATE_SROK_DN
        eh.SetEl(ind,11, sIskl);
      end;
      ind:=ind+1;
      n:=n+1;
      if n=100 then begin
        ChangeMessage(' Выгрузка реестра... '+IntToStr(ind-1));
        n:=0;
      end;
      q.Next;
    end;
    q.First;
    finally
      dbEnableControls(q,l);
      CloseMessage();
    end;

    eh.ExportExcel;
    eh.Free;
    DeleteFile(GetFileExcel(sNameExcel));
    XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
    XL.Visible:=true;
    XL:=null;
//    ShellExt(GetFileExcel(sNameExcel));
  end;
end;

//----------------------------------------------------------------
// отдельная очередь по просьбе Березы
procedure ListOcheredOtd;
var
  XL:Variant;
  lOk,l:Boolean;
  eh:TExcelHelper;
  q,dsOch,dsOchResh:TDataSet;
  n,ind,nFirst,nLast,nIdOch:Integer;
  s,ss,sPomech,sSostav,sOsn,sDate,sPredos,sIskl,sID,sSlugeb,sDopOchered,sKolvo:String;
  sNameExcel:String;
//  resh:TReshOchMen;
begin
  XL:=GetOfficeObject('Excel',lOk);
  q:=dbGetDataSet('fmGurnOchered.Query');
  if lOk and (q.Fld('OCHERED_ID').AsInteger>0) then begin
    dsOch:=dbGetDataSet('dmBase.tbOchered');
    dsOchResh:=dbGetDataSet('dmBase.tbOcheredResh');
    sNameExcel:='Отдельный список нуждающихся (расширенный).xls';
    XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));

    ind:=dbRecordCount(q);
    nFirst:=9;
    nLast:=9+ind-1;

    XL.Range['A4'].Value:=GetOrganResh(q.FieldByName('ID_BASE').AsInteger);   // было NameOrg('','')
    XL.Range['A5'].Value:=DatePropis(Now,1);
    XL.Range['C'+IntToStr(nLast+2)].Value:=Ochered_Dolg;
    XL.Range['E'+IntToStr(nLast+2)].Value:=Ochered_FIO;

    eh:=TExcelHelper.Create;
    eh.SetSize(ind,12);                                          // !!!
    eh.SetRangeExcel('A'+IntToStr(nFirst),'L'+IntToStr(nLast));  // !!!
    ind:=1;
    n:=0;
    q.First;
    nIdOch:=q.Fld('OCHERED_ID').AsInteger;
    if q.Fld('OCHERED_ID').AsInteger<>0 then begin
      XL.Range['A2'].Value:='Отдельный список ('+ValueFromKey('KEY_TYPEOCHERED',IntToStr(nIdOch),'',false)+')';
    end;
//  q.DisaleControls;

    l:=dbDisableControls(q);
    OpenMessage(' Выгрузка реестра...              ','',10);
    try
    while not q.Eof do begin
      sID:=q.Fld('ID').AsString;
      //---------- общая очередь -------------------
      if dbLocate(dsOch,'OCHERED_ID;ID',[0,sId],'') then begin
        dmBase.FillReshOch(_resh, dsOch.Fld('ID_POST_RESH').AsInteger);
//        sOsn:=_resh.GetTextOsnov(OCH_OSN_PUNKT,false);
        if (_resh.TIP>-1) and (_resh.DateR>0) then begin
          eh.SetEl(ind,8,_resh.Nomer);                // 8888888
          eh.SetEl(ind,9,DatePropis(_resh.DateR,3));  // 9999999
        end;
      end;

      eh.SetEl(ind,1, ind);
      eh.SetEl(ind,2, q.Fld('DELO').AsString);
      eh.SetEl(ind,3, q.Fld('FAMILIA').AsString+' '+q.Fld('NAME').AsString+' '+q.Fld('OTCH').AsString);
      //------- 4444444444444
//      sSostav:=dsOch.Fld('KOLVO_SOSTAV').AsString;
//      if sSostav<>'' then sSostav:=sSostav+' чел. ';
      ss:=dmBase.SostavSemToStr(sID, 'OTN;FIO;DATER3', chr(10)); //', ');
      if ss<>'' then sSostav:=ss  else sSostav:='';
      eh.SetEl(ind,4, sSostav);
      //------- 5555555555555
      eh.SetEl(ind,5,dmBase.AdresMen(q.Fld('id').AsString,'')); //'+SHOW'));
      //------- 6666666666666  характеристика
      sKolvo:=dsOch.Fld('KOLVO_PROPIS').AsString;
      if sKolvo<>'' then sKolvo:=sKolvo+' чел.' else sKolvo:='';
      if nIdOch=0 then begin
        sPomech:=dsOch.Fld('KOLVO_KOMN_PR').AsString+' комн.';
        sPomech:=sPomech+', '+dsOch.Fld('PLOSH_ALL').asString+' кв.м.';
        sPomech:=sPomech+', '+s;
//        ss:=SeekValueSpr('SprTypeHouse','ID',q.Fld('TYPEHOUSE').AsString,'NAME');
        sPomech:=sPomech+', '+sKolvo;    
      end else begin
        sPomech:=dsOch.Fld('PLOSH_ALL').asString+' кв.м.';
        sPomech:=sPomech+', '+s;
        sPomech:=sPomech+', '+sKolvo;    
      end;
      eh.SetEl(ind,6,sPomech);

      dmBase.FillReshOch(_resh, q.Fld('ID_POST_RESH').AsInteger);
      sOsn:=_resh.GetTextOsnov(OCH_OSN_PUNKT,false);
      eh.SetEl(ind,7, sOsn);                // 999999999999
      if (_resh.TIP>-1) and (_resh.DateR>0) then begin
        eh.SetEl(ind,10,_resh.Nomer);                // 10 10 10 10 10 10
        eh.SetEl(ind,11,DatePropis(_resh.DateR,3));  // 11 11 11 11 11 11
      end;
      eh.SetEl(ind,12,DatePropis(q.Fld('DEC_DATE').AsDateTime,3));  // 12 12 12 12 12 12

      ind:=ind+1;
      n:=n+1;
      if n=100 then begin
        ChangeMessage(' Выгрузка реестра... '+IntToStr(ind-1));
        n:=0;
      end;
      q.Next;
    end;
    q.First;
    finally
      dbEnableControls(q,l);
      CloseMessage();
    end;

    eh.ExportExcel;
    eh.Free;
    DeleteFile(GetFileExcel(sNameExcel));
    XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
    XL.Visible:=true;
    XL:=null;
//    ShellExt(GetFileExcel(sNameExcel));
  end;
end;

//----------------------------------------------------------------
procedure ListOcheredKadastr;
var
  XL:Variant;
  lOk,lOneFile:Boolean;
  eh:TExcelHelper;
  q,dsOch,dsHist:TDataSet;
  m1,m2,n,ind,nFirst,nLast,nLenArr,nIdOch,nMax,nOstat,nAll:Integer;
  sValues,s,ss,sss,sFile,sFld:String;
  sNameExcel,sSQL:String;
  slMens:TStringList;
  sl:TStringList;
  i,j,nType:Integer;
  l:Boolean;
begin
  nType:=ParamAsInteger('KADASTR_R1');   // что выгружать в номер очереди 0-ничего  1-номер очереди  2-дело
  sFile:=Trim(ParamAsString('KADASTR_FILE'));
  if sFile='' then sFile:='Zapros2';

  q:=dbGetDataSet('fmGurnOchered.Query');
  q.First;
  l:=dbDisableControls(q);
  sValues:=BookmarkCurGurnalToValues('ID',',');
  if (sValues<>'') or ParamAsBoolean('KADASTR_FILTER') then begin  // выгрузка для кадастрового с учетом отбора или отмеченных
  // было  s:=GetWHERECurGurnal
    // соберем ID и OCHERED_ID
    sss:=q.Fld('ochered_id').AsString;
    if sValues<>'' then begin
      ss:=sValues;
    end else begin
      ss:='';
      while not q.Eof do begin
        ss:=ss+q.Fld('ID').AsString+',';
        q.Next;
      end;
      ss:=ss+'-1';
    end;
    s:='oc.ochered_id='+sss+' and oc.id in ('+ss+')'; 
  end else begin
    s:='oc.id_base=0 and oc.ochered_id=0 and oc.iskl=false '; 
  end;
  q.First;
  dbEnableControls(q,l);

//    else s:=globaltask.AddWhereCurIdBase('oc.ochered_id=0 and oc.iskl=false ',''); 
//  writedebug('-----------------');
//  writedebug(s);
//  exit;

  XL:=GetOfficeObject('Excel',lOk);
  if nType=2 then ss:='delo, nomer_och' else ss:='nomer_och, delo';
  if lOk then begin
    sSQL:=' select oc.id, oc.nomer_och, oc.delo, 0 NNN, 0 MMM, n.id men_id, n.familia, n.name, n.otch, n.dater, n.lich_nomer, g.gname, isnull(n.citizen,0) citizen from ochered oc '+
            ' left join население n on oc.id=n.id and n.date_fiks='+QStr(datecursostS)+
            ' left join OcheredResh r on oc.id_last_resh=r.auto_id '+
            ' left join БазаДомов a on a.date_fiks=''1899-12-30'' and a.id=n.adres_id '+
            ' left join sysspr.СпрСтран g on n.CITIZEN=g.id '+
            ' where '+s+ //oc.ochered_id=0 and oc.iskl=false and n.date_fiks='+QStr(datecursostS)+
            '  union all  '+
            ' select oc.id, oc.nomer_och, oc.delo, 1 NNN, s.NOMER MMM, member_id men_id, isnull(n.familia,s.familia), isnull(n.name,s.name), isnull(n.otch,s.otch), isnull(n.dater,s.dater), isnull(n.lich_nomer,s.lich_nomer), g.gname, isnull(n.citizen,0) citizen from sostavsem s '+
            ' left join ochered oc on oc.id=s.id '+
            ' left join население n on s.member_id=n.id and n.date_fiks='+QStr(datecursostS)+
            ' left join OcheredResh r on oc.id_last_resh=r.auto_id '+
            ' left join БазаДомов a on a.date_fiks=''1899-12-30'' and a.id=n.adres_id '+
            ' left join sysspr.СпрСтран g on n.CITIZEN=g.id '+
            ' where '+s+ //oc.ochered_id=0 and oc.iskl=false'+
            ' order by '+ss+',oc.id,NNN,MMM ';
//    q:=dbOpenSQL2MemTable(sSQL,'');
    MemoWrite('export.sql',sSQL);
    OpenMessage(' Подготовка к формированию списка ...      ','',10);
    try
    q:=dbOpenSQL(sSQL,'');
    CloseMessage;
    if q=nil then begin
      PutError(dbLastError());
      XL:=null;
      exit;
    end;
    OpenMessage(' Формирование списка ...                 ','',10);
//    if ParamAsBoolean('KADASTR_FILTER') then begin // выгрузка для кадастрового с учетом отбора или всех
//      s:=GetFilterCurGurnal;
//      if s<>'' then begin 
//        q.Filter:=s;
//        q.Filtered:=true;
//      end;
//    end;
    dsOch:=dbGetDataSet('dmBase.tbOchered');
    dsHist:=dbGetDataSet('dmBase.HistoryZAGS');
    if dsHist=nil  then writedebug('dmBase.tbHistoryZAGS');
    dbSetIndex(dsHist,'PR_KEY');
    sNameExcel:=sFile+'.xls';
//    sNameExcel:='Список нуждающихся для НКА.xls'; 
//    XL.Range['A1'].Value:=NameOrg('','')
    slMens:=TStringList.Create;
    n:=1;
    q.First;
    if nType=2 then sFld:='DELO' else sFld:='NOMER_OCH';
    while not q.Eof do begin
      if (q.Fld('CITIZEN').AsInteger=0) or (q.Fld('CITIZEN').AsInteger=112) then begin
        s:='Гражданин РБ';
      end else if Pos(';'+q.Fld('CITIZEN').AsString+';',';997;998;999;')>0 then begin
        s:='Лицо без гражданства';
      end else begin
        // 996 считаем тоже иностранным гражданином
        s:='Иностранный гражданин';
      end;
      slMens.Add(q.Fld('MEN_ID').AsString+'~'+q.Fld('FAMILIA').AsString+'~'+q.Fld('NAME').AsString+'~'+
                 q.Fld('OTCH').AsString+'~'+DatePropis(q.Fld('DATER').AsDateTime,3)+'~'+q.Fld('LICH_NOMER').AsString+'~'+
                 q.Fld(sFld).AsString+'~'+s);
//                 q.Fld('NOMER_OCH').AsString+'~'+s);

      dbSetRange2(dsHist,[TYPEOBJ_NASEL,q.Fld('MEN_ID').AsInteger,'FAMILIA',0],[TYPEOBJ_NASEL,q.Fld('MEN_ID').AsInteger,'FAMILIA',Date+1]);
      while not dsHist.Eof do begin
        slMens.Add(q.Fld('MEN_ID').AsString+'~'+dsHist.Fld('VALUE').AsString+'~'+q.Fld('NAME').AsString+'~'+
                   q.Fld('OTCH').AsString+'~'+DatePropis(q.Fld('DATER').AsDateTime,3)+'~'+q.Fld('LICH_NOMER').AsString+'~'+
                   q.Fld(sFld).AsString+'~'+s);
        dsHist.Next;
      end;
      dbCancelRange(dsHist);
      q.Next;
      n:=n+1;
      if n>100 then begin
        ChangeMessage(' Формирование списка ... '+IntToStr(slMens.Count));
        n:=1;
      end;

    end;
    q.First;
    nAll:=slMens.Count;                // количество человек
    sl:=TStringList.Create;
    eh:=TExcelHelper.Create;

    DeleteFile(GetFileExcel(sNameExcel));
    s:=sFile;
    nMax:=32000;                       // максимальное количество в файле
    nOstat:=nAll;                      // сколько осталось выгрузить
    if nAll>nMax then lOneFile:=false else lOneFile:=true;
    j:=1;
    ChangeMessage(' Формирование Excel ... ');
    while nOstat>0 do begin
      if nMax<nOstat then nLenArr:=nMax else nLenArr:=nOstat;
      nFirst:=4;
      nLast:=nFirst+nLenArr-1;
      m1:=(j-1)*nMax;                  // первый номер для выгрузки      0    ,32000,64000 ...
      m2:=m1+nLenArr;                  // последний номер для выгрузки   29999,63999,      ...
      XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));
      eh.SetSize(nLenArr,7);
      eh.SetRangeExcel('A'+IntToStr(nFirst),'G'+IntToStr(nLast));
      ind:=1;
//      writedebug('nAll='+intToStr(nAll)+'nLenArr='+intToStr(nLenArr)+' j='+intToStr(j)+'  m1='+IntToStr(m1)+' m2='+IntToStr(m2) );

      for i:=m1 to m2-1 do begin //slMens.Count-1 do begin
        StrToStrings2(slMens.Strings[i],sl,'~',false);
        eh.SetEl(ind,1, sl.Strings[1]);
        eh.SetEl(ind,2, sl.Strings[2]);
        eh.SetEl(ind,3, sl.Strings[3]);
        eh.SetEl(ind,4, sl.Strings[4]);
        eh.SetEl(ind,5, sl.Strings[5]);
        if nType=0
          then eh.SetEl(ind,6, '')
          else eh.SetEl(ind,6, sl.Strings[6]);
        eh.SetEl(ind,7, sl.Strings[7]);
        ind:=ind+1;
      end;
      nOstat:=nAll-m2;                 // сколько осталось выгрузить
      if lOneFile then ss:=s+'.xls' else ss:=s+IntToStr(j)+'.xls';
      j:=j+1;
      eh.ExportExcel;
      DeleteFile(GetFileExcel(ss));
      XL.ActiveWorkBook.SaveAs(GetFileExcel(ss));
    end;

    eh.Free;
    sl.Free;
    slMens.Free;

    finally
      CloseMessage();
      dbClose(q);
    end;

    XL.Visible:=true;
    XL:=null;
  end;
end;

//----------------------------------------------------------------
procedure LoadOwnersFromKadastr;
var
  XL:Variant;
  lOk:Boolean;
  dsMens,dsMensS:TDataSet;
  sNameExcel,s:String;
  i,j:Integer;
  sIN,sKad,sAdres,sNazn,sPravo,sTail,sPrim:String;
  vDateS,vDateP,vPlosh:Variant;
  sDateS,sDateP,sPlosh,sFam,sName,sOtch:String;
begin
  XL:=GetOfficeObject('Excel',lOk);
  if lOk then begin
    sNameExcel:='E:\Ответ.xls';
    XL.WorkBooks.Add(sNameExcel);
    sIN:='*'
    i:=3;
    dsMens:=dbGetDataSet('dmBase.tbMens');
    dsMensS:=dbGetDataSet('dmBase.tbMensSobst');
    try
      for i:=3 to 300 do begin //13739 do begin
        s:=IntToStr(i);
        sFam:=Trim(XL.Range['B'+s].Value);
        sName:=Trim(XL.Range['C'+s].Value);
        sOtch:=Trim(XL.Range['D'+s].Value);
        //sIN:=Trim(XL.Range['F'+s].Value);

        sIN:=Trim(XL.Range['F'+s].Value);
//        if sIN<>'' then begin
          sKad:=Trim(XL.Range['G'+s].Value);
          sAdres:=Trim(XL.Range['H'+s].Value);
          vPlosh:=XL.Range['I'+s].Value;
          if vPlosh=null then sPlosh:='null' else sPlosh:=FloatToStr(vPlosh);
          sNazn:=Trim(XL.Range['J'+s].Value);
          sPravo:=Trim(XL.Range['K'+s].Value);
          sTail:=Trim(XL.Range['L'+s].Value);
          vDateS:=XL.Range['M'+s].Value;
          if vDateS=null then sDateS:='null' else sDateS:=vDateS;
          vDateP:=XL.Range['N'+s].Value;
          if vDateP=null then sDateP:='null' else sDateP:=vDateP;
          sPrim:=Trim(XL.Range['O'+s].Value);
          writedebug('-------------------------------------------------');
          writedebug(inttostr(i-2)+' '+sFam+' '+sName+' '+sOtch+' IN='+sIN+''+' KAD='+sKad+' ADR='+sAdres+' PLOSH='+sPlosh+' TAIL='+sTail+' PRAVO='+sPravo);
          writedebug('DATES='+sDateS+'  DATEP='+sDateP);
          writedebug('NAZN='+sNazn);
          writedebug('PRIM='+sPrim);
//        end;
//        i:=i+1;
      end;
    finally
//      CloseMessage();
    end;

    XL.Visible:=true;
    XL:=null;
  end;
end;

