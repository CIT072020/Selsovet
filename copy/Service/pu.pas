
//---------------------------
procedure WriteIzbToNasel;
var
  sRusGr,strDate,sID,sIzb,s,sSQL,strErr,ss,s1,s2,s3,s4 : String;
  sl:TStringList;
  SprUch,q,ds : TDataSet;
  lOpen,lDubl:Boolean;
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
    dbExecuteSQL('update Население set IZB_UCH=null, IZB_OKR_SS=null, IZB_OKR_RN=null, IZB_OKR_OBL=null where date_fiks=''1899-12-30'';');
    while not SprUch.Eof do begin
      if SprUch.Fld('ACTIVE').AsBoolean then begin
        if not lOpen
          then OpenMessage(' Запись в базу населения номеров участков ... ','',10);
        lOpen:=true;
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
    if lOpen then begin
      CloseMessage;
    end else begin
      PutError('Нет активных избирательных участков');
    end;
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


