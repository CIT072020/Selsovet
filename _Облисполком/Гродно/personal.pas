//----------------------------------
// выгрузка очередников для сайта
procedure Ochered2Site;
var
  sl:TStringList;
  q,ds : TDataSet;
  s,sMyName,sSoatoRn,sDatePost,sNomer,sKodOrg,sNameOrg,sInsert,sPath,sDateR,sDateP,sYearP:String;
  Date1,Date2:TDateTime;
  fmParam:TfmParamQuest;
  nNotSoato,n,nCount,nAll,nMyID:Integer;
begin
  n:=1;
  sPath:=GetFolderMyDocument+'\Выгрузка';
  ForceDirectories(sPath);
  DeleteFiles(sPath+'\*.*');
  if n=1 then begin
//    Date1:=fmParam.GetValue('DATE1','D');
//    Date2:=fmParam.GetValue('DATE2','D');
//    sDisk:=Trim(fmParam.GetValueAsText('DISK'));
    nMyID:=GlobalTask.ParamAsInteger('ID');
    s:='KNAME';  // или NAME
    sMyName:=GlobalTask.ParamAsString(s); //SeekValueSpr('SprNames','ID',nMyID,'NAME');

    OpenMessage('Выгрузка ...             ','',10);
    q:=dbOpenSQL('SELECT n.id, n.familia, n.name, n.otch, n.dater, oc.ochered_id as och_type, isnull(oc.id_base,0) as kod_org, sn.'+s+' as name_org, '+CRLF+
                 '    oc.nomer_och as och_nomer, op.dater as resh_date, op.nomer as resh_nomer, oc.dec_date date_account, oc.kolvo_sostav, oc.only, '+CRLF+
                 ' sn.soato as soato_org, sn.telefon as tel_spec '+CRLF+
                 ' FROM Ochered oc '+CRLF+
                 ' LEFT JOIN ocheredResh op ON oc.id_post_resh=op.auto_id '+CRLF+
                 ' LEFT JOIN SprNames sn on sn.id=oc.ID_BASE '+CRLF+
                 ' LEFT JOIN Население n on n.id=oc.ID '+CRLF+
                 ' WHERE oc.iskl=false ' , '');
// left join OcheredResh ocr on oc.id_last_resh=ocr.auto_id 
    sl:=TStringList.Create;
    sInsert:='INSERT INTO `ochered` ( `familia`,`name`,`otch`,`dater`,`godpost`,`soato_rn`,`och_type`,`kname_org`,`tel_spec`,`och_nomer`,`resh_nomer`,`resh_date`) VALUES ';
    n:=0;
    nAll:=0;
    nNotSoato:=0;
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
        if q.Fld('SOATO_ORG').AsString='' then begin
          sSoatoRn:=QStr('');
          nNotSoato:=nNotSoato+1;
        end else begin
          sSoatoRn:=QStr(Copy(q.Fld('SOATO_ORG').AsString,1,4)+'000000');
        end;
        s:='('+QStr(q.Fld('FAMILIA').AsString)+','+QStr(q.Fld('NAME').AsString)+','+QStr(q.Fld('OTCH').AsString)+','+sDateR+','+sYearP+','+sSoatoRn+','+q.Fld('OCH_TYPE').AsString+','+
            sNameOrg+','+QStr(q.Fld('TEL_SPEC').AsString)+','+sNomer+','+QStr(q.Fld('RESH_NOMER').AsString)+','+sDateP+')';
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
    {
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
    }
    sl.Free;
    dbClose(q);
    CloseMessage();
    if nNotSoato>0 then begin
      ShowMessage('Количество записей без СОАТО района: '+IntToStr(nNotSoato));
    end;
    ShellExt2(sPath,'explore');
  end;
end;






