
procedure CheckListSvid;
var
  qSvid,dsSvid : TDataSet;
  n:Integer;
  s:String;
begin
  if Problem('Запустить процедуру провеверки ?') then begin
    WriteDebug('Обновление базы свидетельств');
    dbExecuteSQL('UPDATE ListSvid set id_zags=2495');

    qSvid:=dbOpenSQL('SELECT * FROM SysSpr.ListSvid','');
    dsSvid:=dmBase.GetDataSet('ListSvid');
    n:=0;
    while not qSvid.Eof do begin
      s:='';
      if dbLocate(dsSvid,'SVID_TYPE;SVID_SERIA;SVID_NOMER',[qSvid.Fld('SVID_TYPE').AsInteger, qSvid.Fld('SVID_SERIA').AsString, qSvid.Fld('SVID_NOMER').AsString],'')  then begin
        if qSvid.Fld('DATEP').AsString<>dsSvid.Fld('DATEP').AsString
          then s:=s+', дата прихода загр.:'+DatePropis(qSvid.Fld('DATEP').AsDateTime,3)+' база:'+DatePropis(dsSvid.Fld('DATEP').AsDateTime,3);
        if qSvid.Fld('DATER').AsString<>dsSvid.Fld('DATER').AsString
          then s:=s+', дата расх. загр.:'+DatePropis(qSvid.Fld('DATER').AsDateTime,3)+' база:'+DatePropis(dsSvid.Fld('DATER').AsDateTime,3);
        if qSvid.Fld('AKT_NOMER').AsInteger<>dsSvid.Fld('AKT_NOMER').AsInteger
          then s:=s+', № акта загр.:'+qSvid.Fld('AKT_NOMER').AsString+' база:'+dsSvid.Fld('AKT_NOMER').AsString;
        if qSvid.Fld('AKT_DATE').AsString<>dsSvid.Fld('AKT_DATE').AsString
          then s:=s+', дата акта загр.:'+DatePropis(qSvid.Fld('AKT_DATE').AsDateTime,3)+' база:'+DatePropis(dsSvid.Fld('AKT_DATE').AsDateTime,3);
        if s<>'' then WriteDebug(qSvid.Fld('SVID_SERIA').AsString+' '+qSvid.Fld('SVID_NOMER').AsString+' : '+Copy(s,3,Length(s)));
      end else begin
        dsSvid.Append;
        dsSvid.Fld('SVID_TYPE').AsInteger:=qSvid.Fld('SVID_TYPE').AsInteger;
        dsSvid.Fld('SVID_SERIA').AsString:=qSvid.Fld('SVID_SERIA').AsString;
        dsSvid.Fld('SVID_NOMER').AsString:=qSvid.Fld('SVID_NOMER').AsString;
        if not qSvid.Fld('DATEP').IsNull then dsSvid.Fld('DATEP').AsDateTime:=qSvid.Fld('DATEP').AsDateTime;
        if not qSvid.Fld('DATER').IsNull then dsSvid.Fld('DATER').AsDateTime:=qSvid.Fld('DATER').AsDateTime;

        dsSvid.Fld('SOST').AsInteger:=qSvid.Fld('SOST').AsInteger;
        dsSvid.Fld('AKT_NOMER').AsInteger:=qSvid.Fld('AKT_NOMER').AsInteger;
        if not qSvid.Fld('AKT_DATE').IsNull then dsSvid.Fld('AKT_DATE').AsDateTime:=qSvid.Fld('AKT_DATE').AsDateTime;
        dsSvid.Fld('ID_ZAGS').AsInteger:=2495;
        dsSvid.Post;
//        WriteDebug('+ '+qSvid.Fld('SVID_SERIA').AsString+' '+qSvid.Fld('SVID_NOMER').AsString);
        n:=n+1;
      end;
      qSvid.Next;
    end;
    dbClose(qSvid);
    WriteDebug('Итого добавлено: '+IntToStr(n));
  end;
end;



