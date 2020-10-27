
procedure CheckLoadZapis_(nType:Integer);
var
  ds,dsZ,dsSvid,dsApp : TdataSet;
  ss,s,sID:String;
  d:TDateTime;
  i,j:Integer;
  sl,slSvid:TStringList;
begin
  if nType=6 
    then s:='АктыРождений' 
    else s:='ЗаключениеБраков';
  ds:=dbOpenSQL('SELECT DATEZ, NOMER, COUNT(*) KOLVO FROM '+s+' GROUP BY 1,2 HAVING Count(*)>1','');
  dsSvid:=dbOpenSQL('SELECT TOP 1 * FROM SvidPovtor','');
  dsApp:=dmBase.GetDataSet('SvidPovtor');
  dsZ:=dmBase.GetDataSet(s);
  dsZ.First;
  i:=1;
  sl:=TStringList.Create;
  slSvid:=TStringList.Create;
  dbSetIndex(dsZ,'NOMER');
  dbSetIndex(dsApp,'PR_KEY');   //SVID_TYPE;AKT_ID;SVID_DATE;SVID_NOMER
  while not ds.Eof do begin
    dbSetRange(dsZ,[ds.Fld('NOMER').AsInteger,ds.Fld('DATEZ').AsDateTime]);
    sl.Clear;
    slSvid.Clear;
    s:='';
    sID:='';
    while not dsZ.Eof do begin
      // соберем все свидетельства
      if (Trim(dsZ.Fld('SVID_NOMER').AsString)<>'') and not dsZ.Fld('DATESV').IsNUll then begin
        ss:=DTOS(dsZ.Fld('DATESV').AsDateTime,'C')+PadLStr(Trim(dsZ.Fld('SVID_NOMER').AsString),10,' ')+PadLStr(Trim(dsZ.Fld('SVID_SERIA').AsString),10,' ');
        if slSvid.IndexOf(ss)=-1 
          then slSvid.Add(ss);
      end;
      dbChangeSQL(dsSvid, 'SELECT * FROM SvidPovtor WHERE SVID_TYPE='+InttoStr(nType)+' and AKT_ID='+dsZ.Fld('ID').AsString, true);
      while not dsSvid.Eof do begin
        if (Trim(dsSvid.Fld('SVID_NOMER').AsString)<>'') and not dsSvid.Fld('SVID_DATE').IsNUll then begin
          ss:=DTOS(dsSvid.Fld('SVID_DATE').AsDateTime,'C')+PadLStr(Trim(dsSvid.Fld('SVID_NOMER').AsString),10,' ')+PadLStr(Trim(dsSvid.Fld('SVID_SERIA').AsString),10,' ');
          if slSvid.IndexOf(ss)=-1 
            then slSvid.Add(ss);
        end;
        dsSvid.Next;
      end;
      //------------------------------------------------
      if sID='' 
        then sID:=dsZ.Fld('ID').AsString;
      if dsZ.Fld('PODR').AsInteger=9 then begin
        sID:=dsZ.Fld('ID').AsString;
      end;
      sl.Add(dsZ.Fld('ID').AsString);
      s:=s+dsZ.Fld('ID').AsString+','
      dsZ.Next;
    end;
    dbCancelRange(dsZ);
    writeDebug('------------------------------------------------------');
    writeDebug(inttostr(i)+'  '+ds.Fld('NOMER').AsString+'  '+ds.Fld('DATEZ').AsString+' === '+s+' === '+slSvid.CommaText);
    // удаление
    if sl.Count>0 then begin
      for j:=0 to sl.Count-1 do begin
        ss:=sl.Strings[j];
        if ss<>sID then begin
          if dbLocate(dsZ,'ID',[ss],'') then begin
            WriteDebug('DELETE '+ss);  
            dmBase.DeleteDokument(dsZ,nType,true);
          end else begin
            WriteDebug('???????????????????');
          end;
        end;
      end;
    end;
    // добавление свид.
    if dbLocate(dsZ,'ID',[sID],'') then begin
      if slSvid.Count>0 then begin
        for j:=0 to slSvid.Count-1 do begin
          d:=STOD(copy(slSvid.Strings[j],1,8),'C');
          s:=Trim(copy(slSvid.Strings[j],9,10));
          ss:=Trim(copy(slSvid.Strings[j],19,10));
          if (dsZ.Fld('SVID_NOMER').AsString='') or (dsZ.Fld('SVID_NOMER').AsString<>s) then begin
            if not dbLocate(dsApp, 'SVID_TYPE;AKT_ID;SVID_NOMER;SVID_DATE', [nType,sID,s,d], '') then begin
              writeDebug('APPEND '+sID+ '   '+ss+'|'+s+'|'+DatePropis(d,3));
              try
                dsApp.Append;
                dsApp.Fld('SVID_TYPE').AsInteger:=nType;
                dsApp.Fld('AKT_ID').AsString:=sID;
                dsApp.Fld('SVID_SERIA').AsString:=ss;
                dsApp.Fld('SVID_NOMER').AsString:=s;
                dsApp.Fld('SVID_DATE').AsDateTime:=d;
                dsApp.Post;  
              except
                dsApp.Cancel;  
                writeDebug('ERROR APPEND '+sID+ '   '+ss+' '+s+' '+DatePropis(d,3));
              end;
            end else begin
              writeDebug('FIND APPEND '+sID+ '   '+ss+' '+s+' '+DatePropis(d,3));
            end;
          end;
        end;
      end;
    end else begin
      WriteDebug('APPEND ???????????????????');
    end;
    ds.Next;
    i:=i+1;
  end;
  dbClose(ds);
  dbClose(dsSvid);
  sl.Free;
  slSvid.Free;
end;

procedure CheckLoadZapis;
begin
  dbExecuteSQL('update АктыРождений set gosud=112 where podr=9 and gosud=on_m_gosud and gosud<>112');
  dbExecuteSQL('delete from SvidPovtor where svid_nomer is null');
  CheckLoadZapis_(5);
  CheckLoadZapis_(6);
end;

