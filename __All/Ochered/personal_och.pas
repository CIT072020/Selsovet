//----------------------------------
// выгрузка очередников для сайта
procedure Ochered2Site;
var
  sl:TStringList;
  q,ds : TDataSet;
  s,sMyName,sDatePost,sNomer,sKodOrg,sNameOrg,sInsert,sPath,sDateR,sDateP,sYearP:String;
  Date1,Date2:TDateTime;
  fmParam:TfmParamQuest;
  n,nCount,nAll,nMyID:Integer;
begin
  {
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='Параметры';
  fmParam.AddParamEx(Now, 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
  fmParam.AddParamEx(Now, 'Конечная дата' , 'DATE2' ,'TYPE=DATE');

  sAddWhere:='';
  fmParam.AddButtons('Выполнить~Отказ',0);
  n:=fmParam.ShowQuest;
  }
  n:=1;
  sPath:=GetFolderMyDocument+'\Выгрузка';
  ForceDirectories(sPath);
  DeleteFiles(sPath+'\*.*');
  if n=1 then begin
//    Date1:=fmParam.GetValue('DATE1','D');
//    Date2:=fmParam.GetValue('DATE2','D');
//    sDisk:=Trim(fmParam.GetValueAsText('DISK'));
    nMyID:=GlobalTask.ParamAsInteger('ID');
    s:='NAME';  // или KNAME
    sMyName:=GlobalTask.ParamAsString(s); //SeekValueSpr('SprNames','ID',nMyID,'NAME');

    OpenMessage('Выгрузка ...             ','',10);
    q:=dbOpenSQL('SELECT n.id, n.familia, n.name, n.otch, n.dater, oc.ochered_id as och_type, isnull(oc.id_base,0) as kod_org, sn.'+s+' as name_org, '+CRLF+
                 '    oc.nomer_och as och_nomer, op.dater as resh_date, op.nomer as resh_nomer, oc.dec_date date_account, oc.kolvo_sostav, oc.only FROM Ochered oc '+CRLF+
                 ' LEFT JOIN ocheredResh op ON oc.id_post_resh=op.auto_id '+CRLF+
                 ' LEFT JOIN SprNames sn on sn.id=oc.ID_BASE '+CRLF+
                 ' LEFT JOIN Население n on n.id=oc.ID '+CRLF+
                 ' WHERE oc.iskl=false ' , '');
// left join OcheredResh ocr on oc.id_last_resh=ocr.auto_id 
    sl:=TStringList.Create;
    sInsert:='INSERT INTO `ochered` ( `id`,`familia`,`name`,`otch`,`dater`,`godpost`,`kod_org`,`och_type`,`date_account`,`och_nomer`,`resh_nomer`,`resh_date`,`kolvo`) VALUES ';
    n:=0;
    nAll:=0;
    sl.Add(sInsert);
    while not q.Eof do begin
      if (q.Fld('OCH_TYPE').AsInteger>0) or not q.Fld('ONLY').AsBoolean then begin   // !!!
        if q.Fld('DATE_ACCOUNT').IsNull then begin
          sDatePost:='NULL';
          sYearP:='NULL';
        end else begin 
          sDatePost:=DateToSQL(q.Fld('DATE_ACCOUNT').AsDateTime);
          sYearP:=DatePropis(q.Fld('DATE_ACCOUNT').AsDateTime,7);
        end;
        if q.Fld('RESH_DATE').IsNull then sDateP:='NULL' else sDateP:=DateToSQL(q.Fld('RESH_DATE').AsDateTime);
        if q.Fld('DATER').IsNull then sDater:='NULL'     else sDateR:=DateToSQL(q.Fld('DATER').AsDateTime);
        if q.Fld('OCH_NOMER').IsNull then sNomer:='NULL' else sNomer:=q.Fld('OCH_NOMER').AsString;
        if q.Fld('KOD_ORG').AsInteger=0 then begin
          sKodOrg:=IntToStr(nMyID);
          sNameOrg:=QStr(sMyName);
        end else begin
          sKodOrg:=q.Fld('KOD_ORG').AsString;
          sNameOrg:=QStr(q.Fld('NAME_ORG').AsString);
        end;
        s:='('+q.Fld('ID').AsString+','+QStr(q.Fld('FAMILIA').AsString)+','+QStr(q.Fld('NAME').AsString)+','+QStr(q.Fld('OTCH').AsString)+','+sDateR+','+sYearP+','+sKodOrg+','+
            q.Fld('OCH_TYPE').AsString+','+sDatePost+','+sNomer+','+QStr(q.Fld('RESH_NOMER').AsString)+','+sDateP+','+IntToStr(q.Fld('KOLVO_SOSTAV').AsInteger)+')';
        s:=StringReplace(s,'\','\\');
        nAll:=nAll+1;
        n:=n+1;
        if n=500 then begin
          sl.Add(s+';'+CRLF+'COMMIT;'+CRLF);
          ChangeMessage('Выгрузка '+IntToStr(nAll));
          sl.Add(sInsert);
          n:=0;
        end else begin
          sl.Add(s+',');
        end;
      end;
      q.Next;
    end;
    n:=sl.Count;
    if n>0 then begin
      if RightStr(sl.Strings[n-1],1)=',' then begin
        sl.Strings[n-1]:=Copy(sl.Strings[n-1],1,Length(sl.Strings[n-1])-1)+';'+CRLF+'COMMIT;';
      end;
      sl.SaveToFile(sPath+'\ochered2site.sql');
    end;

    ChangeMessage('Выгрузка справочника');
    dbChangeSQL(q, 'SELECT * FROM SprNames ORDER BY SOATO', true);
    n:=0;
    sl.Clear;
    sInsert:='INSERT INTO `sprorg` ( `id`,`name`,`kname`,`rn`,`telefon`,`datev` ) VALUES ';
    sl.Add(sInsert);
    while not q.Eof do begin
      if q.Fld('LAST_DATE').IsNull then sDater:='NULL'  else sDateR:=DateToSQL(q.Fld('LAST_DATE').AsDateTime);
      sl.Add('('+q.Fld('ID').AsString+','+QStr(GetPadeg(q.Fld('NAME').AsString,'П'))+','+QStr(q.Fld('KNAME').AsString)+','+QStr(Copy(q.Fld('SOATO').AsString,1,4))+','+QStr(q.Fld('TELEFON').AsString)+','+sDateR+'),');
      n:=n+1;
      q.Next;
    end;
    n:=sl.Count;
    if n>0 then begin
      sl.Strings[n-1]:=Copy(sl.Strings[n-1],1,Length(sl.Strings[n-1])-1)+';'+CRLF+'COMMIT;';
      sl.SaveToFile(sPath+'\sprorg2site.sql');
    end;

    {
    ChangeMessage('Выгрузка SOATO');
    dbChangeSQL(q, 'SELECT * FROM sysspr.СпрСОАТО WHERE substring(kod,1,1)=''1'' and substring(kod,5,6)=''000000'' ORDER BY KOD', true);
    n:=0;
    sl.Clear;
    sInsert:='INSERT INTO `sprrn` ( `kod`,`name`) VALUES ';
    sl.Add(sInsert);
    while not q.Eof do begin
      sl.Add('('+QStr(Copy(q.Fld('KOD').AsString,1,4))+','+QStr(q.Fld('NAME').AsString)+'),');
      n:=n+1;
      q.Next;
    end;
    n:=sl.Count;
    if n>0 then begin
      sl.Strings[n-1]:=Copy(sl.Strings[n-1],1,Length(sl.Strings[n-1])-1)+';'+CRLF+'COMMIT;';
      sl.SaveToFile(sPath+'\sprrn2site.sql');
    end;
    }
    sl.Free;
    dbClose(q);
    CloseMessage();
    ShellExt2(sPath,'explore');
  end;
end;






