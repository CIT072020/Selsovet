const
  DEF_COUNT=2500;

procedure ListDvigPeriod;
var
  eh:TExcelHelper;
begin
//
end;

procedure fmGurnOchered_ExcelReport;
begin
  slExcelReport.Add('C����� ����������� � ��������� �������� �������=ListOchered10');
  slExcelReport.Add('C����� � �������� ����� ��� ������������ ���������=ListOcheredKadastr');
  slExcelReport.Add('��������� ������ �����������=ListOcheredOtd');
end;

procedure fmGurnalAdres_ExcelReport;
begin
  slExcelReport.Add('���������� ������ � ������� ���. �������=ListCountDvor');
  slExcelReport.Add('���������� ����������� ��� ��������=ListCountPerepis');
  slExcelReport.Add('������ ��� ������������ ���.�������� (��� 2018)=ObsledDomHoz2');
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
  ds:= dmBase.GetDataSet('�������������');
  ds.First;
  while not ds.Eof do begin
    sCurName:=ANSIUpperCase(ds.FieldByName('NAME').AsString);
    if Pos('������� ',sCurName)>0 then begin
      Result:=Result+ds.Fld('ID').AsString+',';
    end;
    ds.Next;
  end;
  if Result<>'' then Result:=Copy(Result,1,Length(Result)-1);
end;

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
  f.Caption:='���������';
//  f.AddParamEx(true, '����� ������������ � ������� ����������' , 'ALL','TYPE=BOOLEAN');
  f.AddParamEx(GlobalTask.GetLastValueAsString('LIST_PUNKT_OBSL'), '�������� ���. ������� ����� �������(��� -)' , 'SPISOK','TYPE=STRING~WIDTH=300');
//  fmParam.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
// �� ��������   fmParam.AddParamEx('', '����� ������2' , 'RNGOROD2' ,'TYPE=LIST~DESC=KEY_RN_MYGOR~WIDTH=150');
  f.AddButtons('���������~�����',0);
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
          v:=SeekValueSpr('�������������','NAME',Trim(s),'ID');
          if v=null then v:=0;
          if v>0 then begin
            sPunkt:=sPunkt+IntToStr(v)+',';
          end else begin
            lOk:=false;
            PutError('�� ������: '+s);
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
      GlobalTask.SetLastValueAsString('LIST_PUNKT_OBSL', sNPunkt);
      sPunkt:=Copy(sPunkt,1,Length(sPunkt)-1);

      sSQL:=dmBase.LoadSQLEx('������������-2018-02_0');
      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);
      MemoWrite('last.sql',sSQL);
      tb:=dbOpenSQL2MemTable(sSQL,'');
//      tb := dbCreateMemTable('ADRES,Integer,0;COUNT_ALL,Integer,0;COUNT_INV1,Integer,0;COUNT_INV2,Integer,0;','');
//      tb.Open;
      sSQL:=dmBase.LoadSQLEx('������������-2018-02_1');
      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);
      sSQL:=StringReplace(sSQL, '&lgot&', sLgot);
      OpenMessage(' ���������� �������� ...      ','',10);
      sRn:=ParamAsString('RAION');
      sNameTemp:='������������ ��� ��������.xls';
      sNameExcel:=sRn+ ' ����� '+ParamAsString('KNAME')+'.xls';
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
      sSQL:=dmBase.LoadSQLEx('������������-2018-02_2');
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
        eh.SetEl(ind,10, '���');
        eh.SetEl(ind,11, tb.Fld('DOM').AsString); 
        eh.SetEl(ind,13, tb.Fld('KV').AsString); 
        eh.SetEl(ind,14, '');  // ���
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
  f.Caption:='���������';
//  f.AddParamEx(true, '����� ������������ � ������� ����������' , 'ALL','TYPE=BOOLEAN');
  f.AddParamEx(GlobalTask.GetLastValueAsString('LIST_PUNKT_OBSL'), '�������� ���. ������� ����� �������(��� -)' , 'SPISOK','TYPE=STRING~WIDTH=300');
//  fmParam.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
// �� ��������   fmParam.AddParamEx('', '����� ������2' , 'RNGOROD2' ,'TYPE=LIST~DESC=KEY_RN_MYGOR~WIDTH=150');
  f.AddButtons('���������~�����',0);
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
          v:=SeekValueSpr('�������������','NAME',Trim(s),'ID');
          if v=null then v:=0;
          if v>0 then begin
            sPunkt:=sPunkt+IntToStr(v)+',';
          end else begin
            lOk:=false;
            PutError('�� ������: '+s);
          end;
        end;
      end;
      sl.Free;
    end;
  end;
  if lOk and (sPunkt<>'') then begin
    XL:=GetOfficeObject('Excel',lOk);
    if lOk then begin
      GlobalTask.SetLastValueAsString('LIST_PUNKT_OBSL', sNPunkt);
      sPunkt:=Copy(sPunkt,1,Length(sPunkt)-1);
      OpenMessage(' ���������� �������� ...      ','',10);

      sSQL:=dmBase.LoadSQLEx('������������2-2018-05');
      sSQL:=StringReplace(sSQL, '&punkt&', sPunkt);
      MemoWrite('last.sql',sSQL);
      tb:=dbOpenSQL2MemTable(sSQL,'');
      sRn:=ParamAsString('RAION');
      sNameTemp:='������������ ��� ��������2.xls';
      sNameExcel:=sRn+ ' ����� '+ParamAsString('KNAME')+'.xls';
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
      XL.Range['A'+s].Value:='�����';
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

procedure ListCountPerepis;
var
  XL:Variant;
  lOk,l:Boolean;
  eh:TExcelHelper;
  q,ds:TDataSet;
  nDefCount,n,ind,nFirst,nLast:Integer;
  s,ss:String;
  sDom,sK,sRn,sPunkt,sSQL,sNameExcel:String;
begin
  if not Problem('������������ ���� ��� �������� ?') then exit;
  sSQL := dmBase.LoadSQLEx('����������_��������1');
  OpenMessage(' ���������� �������� ...      ','',10);
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
  if sPunkt='' then begin
    ShowMessage('����������� ���. ������ � ������ ������� ������ '+IntToStr(nDefCount)+'. �������� �� �����.');
  end else begin
    sPunkt:='('+Copy(sPunkt,1,Length(sPunkt)-4)+')';
    XL:=GetOfficeObject('Excel',lOk);
    if lOk then begin
      sNameExcel:='���������� ��� ��������.xls';
      XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));
      sSQL:=dmBase.LoadSQLEx('����������_��������2');
      sSQL:=StringReplace(sSQL, '1=1', sPunkt);
      OpenMessage(' ���������� �������� ...      ','',10);
      MemoWrite('last.sql',sSQL);
      q:=dbOpenSQL(sSQL,'');
      sRn:=ParamAsString('RAION');
      ind:=dbRecordCount(q);
      nFirst:=6;
      nLast:=6+ind-1;
      XL.Range['A3'].Value:=NameOrg('','');
      XL.Range['A4'].Value:=DatePropis(Now,1);
      eh:=TExcelHelper.Create;
      eh.SetSize(ind,10);
      eh.SetRangeExcel('A'+IntToStr(nFirst),'J'+IntToStr(nLast));
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
        if Trim(q.Fld('KORP').AsString)<>'' then sK:=' �.'+Trim(q.Fld('KORP').AsString) else sK:='';
        eh.SetEl(ind,9, q.Fld('TIP_PUNKT').AsString+' '+q.Fld('PUNKT').AsString+', '+q.Fld('TIP_UL').AsString+' '+q.Fld('UL').AsString+', '+sDom+sK);
        eh.SetEl(ind,10, q.Fld('KOLVO').AsInteger);
        ind:=ind+1;
        q.Next;
      end;
      q.First;
      CloseMessage;

      eh.ExportExcel;
      eh.Free;
      sNameExcel:=sRn+ ' ����� '+ParamAsString('KNAME')+'.xls';
      DeleteFile(GetFileExcel(sNameExcel));
      XL.ActiveWorkBook.SaveAs(GetFileExcel(sNameExcel));
      XL.Visible:=true;
      XL:=null;
    end;
  end;
end;

procedure ListCountDvor;
var
  XL:Variant;
  lOk,l:Boolean;
  eh:TExcelHelper;
  q,ds:TDataSet;
  n,ind,nFirst,nLast:Integer;
  s,ss:String;
  sSort, sRn,sSQL,sNameExcel:String;
//  resh:TReshOchMen;
begin
  XL:=GetOfficeObject('Excel',lOk);
  if lOk then begin
    sNameExcel:='���������� ������.xls';
    XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));
    sSQL := dmBase.LoadSQLEx('���������� ������');
    if ParamAsInteger('CH_ADRES')=0 then sSort:='s.id' else sSort:='s.nomer';
    sSQL:=StringReplace(sSQL, '&order_by&', sSort);

    OpenMessage(' ���������� ������� ...      ','',10);
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
//    XL.Range['C'+IntToStr(nLast+2)].Value:=Ochered_Dolg;
//    XL.Range['E'+IntToStr(nLast+2)].Value:=Ochered_FIO;

    eh:=TExcelHelper.Create;
    eh.SetSize(ind,5);
    eh.SetRangeExcel('A'+IntToStr(nFirst),'E'+IntToStr(nLast));
    ind:=1;
    n:=0;

    while not q.Eof do begin
      eh.SetEl(ind,1, ind);
      eh.SetEl(ind,2, sRn);
      eh.SetEl(ind,3, q.Fld('TYPEPUNKT').AsString);
      eh.SetEl(ind,4, q.Fld('NAMEPUNKT').AsString);
      eh.SetEl(ind,5, q.Fld('KOLVO').AsInteger);
      ind:=ind+1;
      q.Next;
    end;
    q.First;
    CloseMessage;

    eh.ExportExcel;
    eh.Free;
    sNameExcel:=sRn+ ' ����� '+ParamAsString('KNAME')+'.xls';
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
  s,ss,sPomech,sSostav,sOsn,sDate,sPredos,sIskl,sID,sSlugeb,sDopOchered,sKolvo:String;
  sNameExcel:String;
//  resh:TReshOchMen;
begin
  XL:=GetOfficeObject('Excel',lOk);
  if lOk then begin
    q:=dbGetDataSet('fmGurnOchered.Query');
    dsOch:=dbGetDataSet('dmBase.tbOchered');
    dsOchResh:=dbGetDataSet('dmBase.tbOcheredResh');
    if q.Fld('OCHERED_ID').AsInteger=0 then begin
      sNameExcel:='����� ������ �����������.xls';
    end else begin
      sNameExcel:='��������� ������ �����������.xls';
    end;
    XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));

    ind:=dbRecordCount(q);
    nFirst:=8;
    nLast:=8+ind-1;
    XL.Range['A4'].Value:=GetOrganResh(q.FieldByName('ID_BASE').AsInteger);   // ���� NameOrg('','')
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
      XL.Range['A2'].Value:='��������� ������ ('+ValueFromKey('KEY_TYPEOCHERED',IntToStr(nIdOch),'',false)+')';
    end;
//  q.DisaleControls;

    l:=dbDisableControls(q);
    OpenMessage(' �������� �������...              ','',10);
    try
    while not q.Eof do begin
      sID:=q.Fld('ID').AsString;
      sPredos:='';  // ������������� ���������
      if dbLocate(dsOch,'OCHERED_ID;ID',[0,sId],'') then begin
        sSlugeb:=dsOch.Fld('SLUGEB_POMECH').Asstring;       // �������. ���������
        sDopOchered:=dsOch.Fld('DOP_OCHERED').Asstring+' '+DatePropis(dsOch.Fld('DOP_DATE').AsDateTime,3);

        if not dsOch.Fld('NEW_ADRES_ID').IsNull then begin
          sPredos:=dmBase.AdresFromID(MainDateFiks,dsOch.Fld('new_adres_id').AsString,false);
          sPredos:=dmBase.AdresFromID(MainDateFiks,dsOch.Fld('new_adres_id').AsString,false);
          if dsOch.Fld('NEW_PLOSH_ALL').Asstring<>'' then 
            sPredos:=sPredos+', ���.��. '+FormatFloat('####0.##',dsOch.Fld('NEW_PLOSH_ALL').AsFloat)+' ��.�.';
          if dsOch.Fld('NEW_DOGOVOR').Asstring<>'' then 
            sPredos:=sPredos+', ���.����� '+dsOch.Fld('NEW_DOGOVOR').AsString+' �� '+DatePropis(dsOch.Fld('NEW_DATE').AsDateTime,3);
        end;
        if dsOch.Fld('UCHASTOK').AsBoolean=true then begin
          s:='������������ ��������� �������';
          if not dsOch.Fld('UCHASTOK_DATE').IsNull 
            then s:=s+' '+DatePropis(dsOch.Fld('UCHASTOK_DATE').AsDateTime,3);
          if sPredos=''
            then sPredos:=s 
            else sPredos:=sPredos+', '+s
        end;
        if (nIdOch=0) and (dsOch.Fld('KREDIT_SUMMA').AsString<>'') then begin
          s:='�������� ������ � ����� '+dsOch.Fld('KREDIT_SUMMA').AsString;
          if sPredos=''
            then sPredos:=s 
            else sPredos:=sPredos+', '+s
        end;
      end;
//      writedebug(spredos+'  '+)
      eh.SetEl(ind,1, ind);
      eh.SetEl(ind,2, q.Fld('FAMILIA').AsString+' '+q.Fld('NAME').AsString+' '+q.Fld('OTCH').AsString);

      sSostav:=dsOch.Fld('KOLVO_SOSTAV').AsString;
      if sSostav<>'' then sSostav:=sSostav+' ���. ';
      if nIdOch=0 then begin  // ������ ��� ����� �������
        ss:=dmBase.SostavSemToStr(sID, 'OTN;FIO;DATER3', chr(10)); //', ');
        if ss<>'' then begin
          sSostav:=sSostav+chr(10)+ss;
        end;
      end;

      eh.SetEl(ind,3, sSostav);

//      eh.SetEl(ind,4,dmBase.AdresFromID(MainDateFiks,q.Fld('adres_id').AsString,false));
      eh.SetEl(ind,4,dmBase.AdresMen(q.Fld('id').AsString,'')); //'+SHOW'));

      s:=dmBase.HouseOwners(MainDateFiks, q.Fld('ADRES_ID').AsString, nil, 1);
      sKolvo:=dsOch.Fld('KOLVO_PROPIS').AsString;
      if sKolvo<>'' then sKolvo:=sKolvo+' ���.' else sKolvo:='';
      if nIdOch=0 then begin
        sPomech:=dsOch.Fld('KOLVO_KOMN_PR').AsString+' ����.';
        sPomech:=sPomech+', '+dsOch.Fld('PLOSH_ALL').asString+' ��.�.';
        sPomech:=sPomech+', '+s;
//        ss:=SeekValueSpr('SprTypeHouse','ID',q.Fld('TYPEHOUSE').AsString,'NAME');
        sPomech:=sPomech+', '+sKolvo;    
      end else begin
        sPomech:=dsOch.Fld('PLOSH_ALL').asString+' ��.�.';
        sPomech:=sPomech+', '+s;
        sPomech:=sPomech+', '+sKolvo;    
      end;
      eh.SetEl(ind,5,sPomech);

      dmBase.FillReshOch(_resh, q.Fld('ID_POST_RESH').AsInteger);
      sOsn:=_resh.GetTextOsnov(OCH_OSN_UKAZ,false);    // �����+����
      sDate:='';
      if (_resh.TIP>-1) and (_resh.DateR>0) then begin
        sDate:=DatePropis(q.Fld('DEC_DATE').AsDateTime,3);
        if not q.Fld('DEC_TIME').IsNull then begin
          sDate:=sDate+' '+FormatDateTime('hh:mm',q.Fld('DEC_TIME').AsDateTime);
        end;
        if _resh.Nomer<>'' then s:=', �'+_resh.Nomer else s:='';
        sDate:=sDate+s;
        if _resh.DateR>0 then sDate:=sDate+' �� '+DatePropis(_resh.DateR,3);
      end;
//      resh.Free;

      if nIdOch=0 then begin   // ����� �������
        eh.SetEl(ind,6,sOsn);
        eh.SetEl(ind,7,sDate);
      end else begin
        eh.SetEl(ind,7,sOsn);
        eh.SetEl(ind,6,sDate);
      end;

      dmBase.FillReshOch(_resh,q.Fld('ID_SN_RESH').AsInteger);
      sDate:='';
      if (_resh.TIP>-1) and (_resh.Nomer<>'') then begin
        sIskl:=DatePropis(_resh.DATER,3)+' '+', �'+_resh.Nomer
        s:=_resh.GetTextOsnov(OCH_OSN_KRAT,true);
        if s<>'' then sIskl:=sIskl+', '+s;
      end;
//      resh.Free;

      if nIdOch=0 then begin   // ����� �������
        eh.SetEl(ind,8,  sDopOchered);
        eh.SetEl(ind,9,  sSlugeb);
        eh.SetEl(ind,10, sPredos);
        eh.SetEl(ind,11, sIskl);
      end else begin
        eh.SetEl(ind,8, sKolvo);
        eh.SetEl(ind,9, sPredos);
        eh.SetEl(ind,10, sIskl);
        eh.SetEl(ind,11, '');
      end;
      ind:=ind+1;
      n:=n+1;
      if n=100 then begin
        ChangeMessage(' �������� �������... '+IntToStr(ind-1));
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
// ��������� ������� �� ������� ������
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
    sNameExcel:='��������� ������ ����������� (�����������).xls';
    XL.WorkBooks.Add(GetFileExcelReport(sNameExcel));

    ind:=dbRecordCount(q);
    nFirst:=9;
    nLast:=9+ind-1;

    XL.Range['A4'].Value:=GetOrganResh(q.FieldByName('ID_BASE').AsInteger);   // ���� NameOrg('','')
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
      XL.Range['A2'].Value:='��������� ������ ('+ValueFromKey('KEY_TYPEOCHERED',IntToStr(nIdOch),'',false)+')';
    end;
//  q.DisaleControls;

    l:=dbDisableControls(q);
    OpenMessage(' �������� �������...              ','',10);
    try
    while not q.Eof do begin
      sID:=q.Fld('ID').AsString;
      //---------- ����� ������� -------------------
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
//      if sSostav<>'' then sSostav:=sSostav+' ���. ';
      ss:=dmBase.SostavSemToStr(sID, 'OTN;FIO;DATER3', chr(10)); //', ');
      if ss<>'' then sSostav:=ss  else sSostav:='';
      eh.SetEl(ind,4, sSostav);
      //------- 5555555555555
      eh.SetEl(ind,5,dmBase.AdresMen(q.Fld('id').AsString,'')); //'+SHOW'));
      //------- 6666666666666  ��������������
      sKolvo:=dsOch.Fld('KOLVO_PROPIS').AsString;
      if sKolvo<>'' then sKolvo:=sKolvo+' ���.' else sKolvo:='';
      if nIdOch=0 then begin
        sPomech:=dsOch.Fld('KOLVO_KOMN_PR').AsString+' ����.';
        sPomech:=sPomech+', '+dsOch.Fld('PLOSH_ALL').asString+' ��.�.';
        sPomech:=sPomech+', '+s;
//        ss:=SeekValueSpr('SprTypeHouse','ID',q.Fld('TYPEHOUSE').AsString,'NAME');
        sPomech:=sPomech+', '+sKolvo;    
      end else begin
        sPomech:=dsOch.Fld('PLOSH_ALL').asString+' ��.�.';
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
        ChangeMessage(' �������� �������... '+IntToStr(ind-1));
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
  s,ss,sss,sFile,sFld:String;
  sNameExcel,sSQL:String;
  slMens:TStringList;
  sl:TStringList;
  i,j,nType:Integer;
  l:Boolean;
begin
  nType:=ParamAsInteger('KADASTR_R1');   // ��� ��������� � ����� ������� 0-������  1-����� �������  2-����
  sFile:=Trim(ParamAsString('KADASTR_FILE'));
  if sFile='' then sFile:='Zapros2';

  if ParamAsBoolean('KADASTR_FILTER') then begin  // �������� ��� ������������ � ������ ������ ��� ����
  // ����  s:=GetWHERECurGurnal
    // ������� ID � OCHERED_ID
    q:=dbGetDataSet('fmGurnOchered.Query');
    l:=dbDisableControls(q);
    q.First;
    sss:=q.Fld('ochered_id').AsString;
    ss:='';
    while not q.Eof do begin
      ss:=ss+q.Fld('ID').AsString+',';
      q.Next;
    end;
    ss:=ss+'-1';
    q.First;
    dbEnableControls(q,l);
    s:='oc.ochered_id='+sss+' and oc.id in ('+ss+')'; 
  end else begin
    s:='oc.id_base=0 and oc.ochered_id=0 and oc.iskl=false '; 
  end;
//    else s:=globaltask.AddWhereCurIdBase('oc.ochered_id=0 and oc.iskl=false ',''); 
//  writedebug('-----------------');
//  writedebug(s);
//  exit;

  XL:=GetOfficeObject('Excel',lOk);
  if nType=2 then ss:='delo, nomer_och' else ss:='nomer_och, delo';
  if lOk then begin
    sSQL:=' select oc.id, oc.nomer_och, oc.delo, 0 NNN, 0 MMM, n.id men_id, n.familia, n.name, n.otch, n.dater, n.lich_nomer, g.gname, isnull(n.citizen,0) citizen from ochered oc '+
            ' left join ��������� n on oc.id=n.id and n.date_fiks='+QStr(datecursostS)+
            ' left join OcheredResh r on oc.id_last_resh=r.auto_id '+
            ' left join ��������� a on a.date_fiks=''1899-12-30'' and a.id=n.adres_id '+
            ' left join sysspr.�������� g on n.CITIZEN=g.id '+
            ' where '+s+ //oc.ochered_id=0 and oc.iskl=false and n.date_fiks='+QStr(datecursostS)+
            '  union all  '+
            ' select oc.id, oc.nomer_och, oc.delo, 1 NNN, s.NOMER MMM, member_id men_id, isnull(n.familia,s.familia), isnull(n.name,s.name), isnull(n.otch,s.otch), isnull(n.dater,s.dater), isnull(n.lich_nomer,s.lich_nomer), g.gname, isnull(n.citizen,0) citizen from sostavsem s '+
            ' left join ochered oc on oc.id=s.id '+
            ' left join ��������� n on s.member_id=n.id and n.date_fiks='+QStr(datecursostS)+
            ' left join OcheredResh r on oc.id_last_resh=r.auto_id '+
            ' left join ��������� a on a.date_fiks=''1899-12-30'' and a.id=n.adres_id '+
            ' left join sysspr.�������� g on n.CITIZEN=g.id '+
            ' where '+s+ //oc.ochered_id=0 and oc.iskl=false'+
            ' order by '+ss+',oc.id,NNN,MMM ';
//    q:=dbOpenSQL2MemTable(sSQL,'');
    MemoWrite('last.sql',sSQL);
    OpenMessage(' ���������� � ������������ ������ ...      ','',10);
    try
    q:=dbOpenSQL(sSQL,'');
    CloseMessage;
    if q=nil then begin
      PutError(dbLastError());
      XL:=null;
      exit;
    end;
    OpenMessage(' ������������ ������ ...                 ','',10);
//    if ParamAsBoolean('KADASTR_FILTER') then begin // �������� ��� ������������ � ������ ������ ��� ����
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
//    sNameExcel:='������ ����������� ��� ���.xls'; 
//    XL.Range['A1'].Value:=NameOrg('','')
    slMens:=TStringList.Create;
    n:=1;
    q.First;
    if nType=2 then sFld:='DELO' else sFld:='NOMER_OCH';
    while not q.Eof do begin
      if (q.Fld('CITIZEN').AsInteger=0) or (q.Fld('CITIZEN').AsInteger=112) then begin
        s:='��������� ��';
      end else if Pos(';'+q.Fld('CITIZEN').AsString+';',';997;998;999;')>0 then begin
        s:='���� ��� �����������';
      end else begin
        // 996 ������� ���� ����������� �����������
        s:='����������� ���������';
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
        ChangeMessage(' ������������ ������ ... '+IntToStr(slMens.Count));
        n:=1;
      end;

    end;
    q.First;
    nAll:=slMens.Count;                // ���������� �������
    sl:=TStringList.Create;
    eh:=TExcelHelper.Create;

    DeleteFile(GetFileExcel(sNameExcel));
    s:=sFile;
    nMax:=32000;                       // ������������ ���������� � �����
    nOstat:=nAll;                      // ������� �������� ���������
    if nAll>nMax then lOneFile:=false else lOneFile:=true;
    j:=1;
    ChangeMessage(' ������������ Excel ... ');
    while nOstat>0 do begin
      if nMax<nOstat then nLenArr:=nMax else nLenArr:=nOstat;
      nFirst:=4;
      nLast:=nFirst+nLenArr-1;
      m1:=(j-1)*nMax;                  // ������ ����� ��� ��������      0    ,32000,64000 ...
      m2:=m1+nLenArr;                  // ��������� ����� ��� ��������   29999,63999,      ...
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
      nOstat:=nAll-m2;                 // ������� �������� ���������
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
    sNameExcel:='E:\�����.xls';
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

