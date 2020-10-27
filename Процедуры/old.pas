//----------------------------------------------------------------------
function ListOchered(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  q,ds:TDataSet;
  n:Integer;
  s,sOsn,sDate,sPredos,sIskl:String;
  lSocial:Boolean;
begin
  Result:=true;
  q:=dbGetDataSet('fmGurnOchered.Query');
//FIELDS=DATER,NAME,PRIN,DOLG,RUKOV
  ds:=GetTemplateDataSet('MAIN');
  ds.Edit;
  if q.Fld('OCHERED_ID').AsInteger=2 then lSocial:=true else lSocial:=false;
  if q.Fld('OCHERED_ID').AsInteger=0 then begin
    ds.Fld('NAMESPIS').AsString:='����� ������';
    ds.Fld('PRIL_NOM').AsString:='10';
  end else begin
    ds.Fld('NAMESPIS').AsString:='��������� ������ ('+ValueFromKey('KEY_TYPEOCHERED',q.Fld('OCHERED_ID').AsString,'',false)+')';
    ds.Fld('PRIL_NOM').AsString:='11';
  end;
  ds.Fld('NAME').AsString:=NameOrg('','');
  ds.Fld('DATER').AsString:=DatePropis(Now,1);
  ds.Fld('DOLG').AsString :=Ochered_Dolg;
  ds.Fld('RUKOV').AsString :=Ochered_FIO;
  s:='���� � ����� �������� �� ����, ����� �������';
  if lSocial then begin
    ds.Fld('GR6').AsString :=s;
    ds.Fld('GR7').AsString :='��������� ��������� � ������';
    ds.Fld('GR8').AsString :='���������� ������� ����������� � ����� ���������';
    ds.Fld('GR9').AsString :='������� � �������������� ������ ��������� ����������� ����������� (�����, ��� ������, ����� � ���� �������� �����)';
    ds.Fld('GR10').AsString:='������� � ������ � ����� ��� �������������� ������ ��������� ����������� �����������';
  end else begin
    ds.Fld('GR6').AsString :='��������� �������� �� ���� ����������� � ��������� �������� �������';
    ds.Fld('GR7').AsString :=s;
    ds.Fld('GR8').AsString :='��� ��� ������ �� ���� � � ������ �������';
    ds.Fld('GR9').AsString :='������� � �������������� ������ ��������� (�����, ��� ������, ����� � ���� �������� �����) ���� �������������� ��������� �������';
    ds.Fld('GR10').AsString:='������� � ������ � ����� ��� �������������� ������ ��������� ���� ��������� �������, �������� � ���� ���� ��������������� ��������� ��� ������������� (�������������) ��� ������������ ����� ���������';
  end;
  ds.Post;
  ds:=GetTemplateDataSet('TB_PRIN');
  n:=0;
  q.First;
//  q.DisaleControls;
  while not q.Eof do begin
//    if not q.Fld('ISKL').AsBoolean then begin
      ds.Append;
      n:=n+1;
  //TB_PRIN=NPP,FIOP,KOLC,PROJ,POMESH,OSNOV,DATEP,WHO,PREDOS,SNAT
      ds.Fld('NPP').AsString:=IntToStr(n);
      ds.Fld('FIOP').AsString:=q.Fld('FAMILIA').AsString+' '+q.Fld('NAME').AsString+' '+q.Fld('OTCH').AsString;
      ds.Fld('KOLC').AsString:=q.Fld('KOLVO_SOSTAV').AsString;
      if q.Fld('OCHERED_ID').AsInteger=0 then begin
        s:=dmBase.SostavSemToStr(q.Fld('ID').AsString, 'OTN;FIO;DATER3', ', ');
        if s<>'' then begin
          ds.Fld('KOLC').AsString:=ds.Fld('KOLC').AsString+'  '+s;
        end;
      end;
      ds.Fld('PROJ').AsString:=dmBase.AdresFromID(MainDateFiks,q.Fld('adres_id').AsString,false);
      ds.Fld('POMESH').AsString:=q.Fld('KOLVO_KOMN_PR').AsString+' ����.';
      ds.Fld('POMESH').AsString:=ds.Fld('POMESH').AsString+', '+q.Fld('PLOSH_ALL').asString+' ��.�.';
      s:=dmBase.HouseOwners(MainDateFiks, q.Fld('ADRES_ID').AsString, nil, 0);
      ds.Fld('POMESH').AsString:=ds.Fld('POMESH').AsString+', '+s;

      s:=GetTypeHouse(false,q.Fld('TYPEHOUSE').AsString,'');

      ds.Fld('POMESH').AsString:=ds.Fld('POMESH').AsString+', '+s+', '+q.Fld('KOLVO_PROPIS').AsString+' ���.';    
      sDate:='';
      if (q.Fld('REG_RESH').AsString<>'') then begin
        sDate:=DatePropis(q.Fld('DEC_DATE').AsDateTime,3);
        if not q.Fld('DEC_TIME').IsNull then begin
          sDate:=sDate+' '+FormatDateTime('hh:mm',q.Fld('DEC_TIME').AsDateTime);
        end;
        sDate:=sDate+', �'+q.Fld('REG_RESH').AsString;
        if not q.Fld('REG_DATE').IsNull then sDate:=sDate+' �� '+DatePropis(q.Fld('REG_DATE').AsDateTime,3);
      end;
      sOsv:=GetOsnovOchered(q,0);

      if (q.Fld('ISK_RESH').AsString<>'') 
        then sIskl:=DatePropis(q.Fld('ISK_DATE').AsDateTime,3)+' '+', �'+q.Fld('ISK_RESH').AsString
        else sIskl:='';
      if q.Fld('ISK_OSNOV').AsString='' 
        then s:=q.Fld('ISK_OSNOV_TEXT').AsString
        else s:=' �.'+SeekValueSpr('SprSnOch','ID',q.Fld('ISK_OSNOV').AsString,'PUNKT')+'  ��������� �������� ����� ���������� ���������� �������� �565';
      if s<>'' then sIskl:=sIskl+', '+s;
      if q.Fld('ISK_ADDINFO').AsString<>'' 
        then sIskl:=sIskl+','+q.Fld('ISK_ADDINFO').AsString;

      sPredos:='';
      if not q.Fld('NEW_ADRES_ID').IsNull then begin
        sPredos:=dmBase.AdresFromID(MainDateFiks,q.Fld('new_adres_id').AsString,false);
      end;
      if not lSocial and (q.Fld('KREDIT_SUMMA').AsString<>'') then begin
        sPredos:=sPredos+' �������� ������ � ����� '+q.Fld('KREDIT_SUMMA').AsString;
      end;
      if lSocial then begin
        // 6 ���� � �����
        ds.Fld('OSNOV').AsString:=sDate;
        // 7 ��������� ����������
        ds.Fld('DATEP').AsString:=sOsn;
        // 8
        ds.Fld('WHO').AsString:=q.Fld('KOLVO_PROPIS').AsString;
        // 9
        ds.Fld('PREDOS').AsString:=sPredos;
        // 10
        ds.Fld('SNAT').AsString:=sIskl;
      end else begin
        //6
        ds.Fld('OSNOV').AsString:=sOsn;
        //7
        ds.Fld('DATEP').AsString:=sDate;
        //8
        ds.Fld('WHO').AsString:='';
        //9
        ds.Fld('PREDOS').AsString:=sPredos;
        //10
        ds.Fld('SNAT').AsString:=sIskl;
      end;
      ds.Post;
//    end;
    q.Next;
  end;
end;

procedure SpravkaNalog;
var
   sl, slPar: TStringList;
   HeadList: TStringList;
   WidthList: TStringList;
   tb,sprOtnosh : TDataSet;
   m : TMens;
   adr : TAdresLic;
   nStr,nID,i : Integer;
   strKomu,strPol2,strPol3,strErr,
   strAdres,s : String;
   nYear,nMonth,nDay : Word;
   pr : TPrintTable;
   nn : Double;
begin
   sl:=TStringList.Create;
   slPar:=TStringList.Create;
   HeadList:=TStringList.Create;
   WidthList:=TStringList.Create;
   try
      m := LicSchet.Mens;
      if m.Fld('POL').AsString='�' then begin
        strPol2 := '���������';
        strPol3 := '���';
      end else begin
        strPol2 := '���������';
        strPol3 := '��';
      end;
      adr := LicSchet.Adres;
      nID := m.Fld('ID_INTERNAL').AsInteger;
      strKomu := m.Fld('FAMILIA').AsString+' '+m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;

      DecodeDate(GlobalTask.CurrentDate,nYear,nMonth,nDay);

      strAdres:= adr.GetAdres+', '+FirstCharUpper(Raion_Name('�'))+', '+FirstCharUpper(Obl_Name('�'));

      StartPrint(sl, poPortrait, pfA4);
      PrintShtamp1(sl, '���������� 1 \par � ������������� ������������ \par �� ������� � ������ \par ���������� �������� \par 17.01.2007 �9');

//      PrintString(sl, UpperCase(NameOrg('',''))+'\par\par ', 0, 12, False, False, False);

      PrintString(sl, '\qc �������  � ______\par ', 0, 14, True, False, False);

      PrintString(sl, '\qc ��������������, ��� ����������� ��������� ����������� ���������� \par ', 0, 12, false, False, False);
      PrintString(sl, '\qc ����� � (���) ������, ���������� � ��� � �����, � ���������� \par ', 0, 12, false, False, False);
      PrintString(sl, '\qc �������� ������� ��� ��������, ����������� � �������������, \par ', 0, 12, false, False, False);
      PrintString(sl, '\qc �������, ���������� � �����������, �� ��������� �������, \par ', 0, 12, false, False, False);
      PrintString(sl, '\qc ���������� ��� ������� ������� ���������� ��������� \par ', 0, 12, false, False, False);
      PrintString(sl, '\qc �����������, �������������� \par\par ', 0, 12, false, False, False);
      s := m.LichNomer;

      if s<>'' then s:=', '+s;
      PrintString(sl, ' \ul1 '+GetPadegFIO(strKomu,m.Fld('POL').AsString,'�')+'    �������: '+m.Passport+s+' ���.���� '+LicSchet.Fld('NOMER').AsString+' \par ', 0, 12, False, False, False);
      PrintString(sl, strPol2+' \ul1 '+strAdres+' \par ', 0, 12, False, False, False);
      PrintString(sl, '� ������������ ��, ��� �� ��������� ������� (��������), ����������� (�����������) � '+strPol3+' �����������, �������� ���� � ������� �������������:  \par ', 0, 12, False, False, False);

      PrintString(sl, '\qc I \par ', 0, 12, True, False, False);
      PrintString(sl, '\qc 1. ��� � ������������ �������� \par ', 0, 12, True, False, False);

      if LicSchet.Fld('PRIUSAD').AsString='' then begin
        PrintString(sl, PadRStr('   '+adr.GetAdres,120,' ')+chr(160)+' \par\par ', 0, 12, False, False, True);
      end else begin
        PrintString(sl, PadRStr('   '+adr.GetAdres+'  ������������ ������� �������: '+LicSchet.Fld('PRIUSAD').AsString+'��',100,' ')+chr(160)+' \par\par ', 0, 12, False, False, True);
      end;
      PrintString(sl, '\qc 2. ������� � ������������� ������������ ���� � ������ ����������� \par ', 0, 12, True, False, False);
      PrintString(sl, StringOfChar('_',160)+'\par\par ', 0, 12, False, False, False);
      PrintString(sl, '\qc 3. �������, ��������������� �� ��������� ����������� ��� ��������������, � ����� ��� ����������� � ������ ����� \par ', 0, 12, True, False, False);

//      PrintString(sl, StringOfChar('_',160)+'\par\par ', 0, 12, False, False, False);
      nn := LicSchet.Fld('VSEGO').AsFloat-LicSchet.Fld('POSTR').AsFloat-LicSchet.Fld('PRIUSAD').AsFloat
      if nn>0 
       then PrintString(sl, PadRStr('   '+FormatFloat('####0.####',nn)+'��',140,' ')+chr(160)+' \par\par ', 0, 12, False, False, True)
       else PrintString(sl, StringOfChar('_',160)+'\par\par ', 0, 12, False, False, False);

      //-----------------------------------------------------------------
      PrintString(sl, '\qc ����������� ��������� ���������, ��������������� ��� ����������\par\par ', 0, 11, False, False, False);
      PrintString(sl, '\qc II ���������������\par ', 0, 12, True, False, False);
      tb := dbCreateMemTable('NAME,Char,100;PLOSH,Char,15;OB,Char,30;SUB,Char,70;','');
      tb.Open;
      for i:=0 to 2 do begin
        tb.Append;
        tb.Fld('NAME').AsString  := '';
        tb.Fld('PLOSH').AsString := '';
        tb.Fld('OB').AsString    := '';
        tb.Post;
      end;
      pr := CreatePrintTable(sl,tb);
      pr.SetHeadWidth(0,'������������ ��������', 250);
      pr.SetHeadWidth(1,'�������� �������, ��', 80);
      pr.SetHeadWidth(2,'����� ������������� ��������� (��.���.)', 120);
      pr.SetHeadWidth(3,'������� �������� ������������� �������', 140);
      pr.SetHeadFont(0,9);
      pr.SetPrintHead(true);
      pr.SetTableFont(0,12);
      pr.SetColFont(0,0,12);
      pr.SetBorder(-1, 'ltrb');
      pr.SetAlign(-1, 'c', 'c');
      pr.Print;
      FreePrintTable(pr);
//      PrintTable(sl, tb, HeadList, WidthList, slPar, 0, 12);
      tb.Free;
      //-----------------------------------------------------------------

      PrintString(sl, '\par \qc ��������������\par ', 0, 12, True, False, False);
      tb := dbCreateMemTable('NAME,Char,100;VID,Char,15;KOLVO,Integer;VESG,Float;VESU,Float;SUB,Char,70;','');
      tb.Open;
      for i:=0 to 2 do begin
        tb.Append;
        tb.Fld('NAME').AsString  := '';
        tb.Fld('VID').AsString   := '';
        tb.Fld('KOLVO').AsString := '';
        tb.Fld('VESG').AsString  := '';
        tb.Fld('VESU').AsString  := '';
        tb.Fld('SUB').AsString   := '';
        tb.Post;
      end;
      pr := CreatePrintTable(sl,tb);
      pr.SetHeadWidth(0,'������������ ������������� ���������', 150);
      pr.SetHeadWidth(1,'��� ���������', 80);
      pr.SetHeadWidth(2,'���������� �����', 65);
      pr.SetHeadWidth(3,'��� ������������� ��������� | ����� ��� (��.���.)', 80);
      pr.SetHeadWidth(4,'��� ������������� ��������� | ������� ��� (��.���.)', 80);
      pr.SetHeadWidth(5,'������� �������� ������������� �������', 120);
      pr.SetHeadFont(0,9);
      pr.SetPrintHead(true);
      pr.SetTableFont(0,12);
      pr.SetColFont(0,0,12);
      pr.SetBorder(-1, 'ltrb');
      pr.SetAlign(-1, 'c', 'c');
      pr.Print;
//      PrintTableEx(sl, tb, HeadList, WidthList, slPar, 0, 10, 0, 12);
      FreePrintTable(pr);
      tb.Free;

//-----------------------------------------------------------------------
      PrintString(sl, '\page\qc ������������\par ', 0, 12, True, False, False);
      tb := dbCreateMemTable('NAME,Char,100;KOLVO,Integer;VES,Float;SUB,Char,70;','');
      tb.Open;
      for i:=0 to 1 do begin
        tb.Append;
        tb.Fld('NAME').AsString  := '';
        tb.Fld('KOLVO').AsString := '';
        tb.Fld('VES').AsString  := '';
        tb.Post;
      end;
      pr := CreatePrintTable(sl,tb);
      pr.SetHeadWidth(0,'������������ ������������� ���������', 170);
      pr.SetHeadWidth(1,'���������� ����������', 130);
      pr.SetHeadWidth(2,'��� ������������� ��������� (��.���.)', 130);
      pr.SetHeadWidth(3,'������� �������� ������������� �������', 160);
      pr.SetHeadFont(0,9);
      pr.SetPrintHead(true);
      pr.SetTableFont(0,12);
      pr.SetColFont(0,0,12);
      pr.SetBorder(-1, 'ltrb');
      pr.SetAlign(-1, 'c', 'c');
      pr.Print;
      FreePrintTable(pr);
      tb.Free;
//--- ������ ���������� ��� ---------------------------
//   fcTimesNewRoman=0  fcArial=1  fcCourierNew=2

      PrintString(sl, '\par ', 0, 12, True, False, False);
      PrintString(sl, '\qc III ������ ���������� ���, ���������� ������� ����� (������)\par ', 0, 12, True, False, False);
      PrintString(sl, PadCStr(strKomu,100,' ')+'_'+'\par ', 0, 12, False, False, True);
//      PrintString(sl, '\ql '+StringOfChar('_',100)+'\par ', 0, 9, False, False, False);
      PrintString(sl, '\ql (�������, ���, �������� ����������� ����, � �����������, �������� ���� � ������� ������������� �������� ���������� ��������� �������) \par\par ', 0, 7, False, True, False);
      m.First;
      nStr:=1;
      sprOtnosh := dbGetDataSet('dmBase.SprOtnosh');
//      strSobstv := adr.GetOwners(slOwners,1);

      tb := dbCreateMemTable('NOMER,Integer;NAME,Char,100;ADRES,Char,100;OTNOSH,Char,30','');
      tb.Open;
      pr := CreatePrintTable(sl,tb);
      pr.SetHeadWidth(0,'� �/�', 20);
      pr.SetHeadWidth(1,'�������, ���, ��������', 220);
      pr.SetHeadWidth(2,'����� ����������� ����� ����������', 260);
      pr.SetHeadWidth(3,'����������� ��������������', 90);
      while not m.Eof do begin
        // ���������� ������� �������
        if AddMenToSprav(m,nID) then begin
//        if (m.Fld('ID_INTERNAL').AsInteger<>nID) and
//           (m.Fld('PROPIS').AsBoolean=true) and             // ���. ������ �����������
//           (m.Fld('PRESENT').AsBoolean=true) then begin // ���. ������ ��������������
          tb.Append;
          tb.Fld('NOMER').AsInteger := nStr;
          tb.Fld('NAME').AsString   := '\ql '+m.Fld('FAMILIA').AsString+' '+
                            m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
          if m.Fld('OTNOSH').AsString<>'' then begin
            if dbLocate(sprOtnosh, 'ID', [m.Fld('OTNOSH').AsString], '') then begin
              tb.Fld('OTNOSH').AsString  := sprOtnosh.Fld('NAME').AsString;
            end;
          end;
          tb.Fld('ADRES').AsString := strAdres;
          tb.Post;
          nStr:=nStr+1;
        end;
        m.Next;
      end;
      while tb.RecordCount<4 do begin
        tb.Append;
        tb.Post;
      end;
      m.First;
      pr.SetHeadFont(0,9);
      pr.SetPrintHead(true);
      pr.SetTableFont(0,10);
//      pr.SetColFont(2,0,10);
      pr.SetBorder(-1, 'ltrb');
      pr.SetAlign(-1, 'c', 'c');
      pr.Print;
      FreePrintTable(pr);
      tb.Free;
      PrintString(sl, '������� ������ '+DatePropis(Now,2)+' � ������������� �� ���������� ���������� ��������� ���������. \par\par ', 0, 12, False, False, False);
      PrintString(sl, '������������ �������� ��������������� \par � ����������������� ������ '+StringOfChar(' ',75)+'\b0\i0\fs28 '+Parameters('������������')+'\par ', 0, 10, true, true, false);
      PrintString(sl, StringOfChar(' ',65)+StringOfChar('_',60)+ ' \par ', 0, 10, false, false, false);
      PrintString(sl, StringOfChar(' ',90)+'�������                 (�������, ���, ��������) \par\par ', 0, 10, false, false, false);
      PrintString(sl, '�.�. \par ', 0, 10, false, false, false);
//-----------------------------------------------------------------------
      PrintString(sl, '\qc IV\par ', 0, 12, True, False, False);
      PrintString(sl, '\ql ����� ��� ������ ����������� \par ', 0, 10, False, False, False);
      PrintString(sl, '\qr '+StringOfChar('_',80)+'\par ', 0, 9, False, False, False);
      PrintString(sl, '\qr (������������ � ��� (����� ��������� �� ������� ���������������� ���������� \par\par ', 0, 8, False, True, False);
      PrintString(sl, '\qr '+StringOfChar('_',80)+'\par ', 0, 9, False, False, False);
      PrintString(sl, '\qr ����������� �������, � ������, � ������� �������� ��� ���������� �������������)) \par\par ', 0, 8, False, True, False);

//-----------------------------------------------------------------------
      PrintString(sl, '\qc V\par ', 0, 12, True, False, False);
      PrintString(sl, '\qc ������� �������������� �������\par\par ', 0, 12, True, False, False);
      tb := dbCreateMemTable('N1,Char,10;N2,Char,10;','');
      tb.Open;
      for i:=0 to 6 do begin
        tb.Append;
        tb.Post;
      end;
      pr := CreatePrintTable(sl,tb);
      pr.SetHeadWidth(0,'�������� ����������� \par (���������, �������, ���, ��������, ����)', 310);
      pr.SetHeadWidth(1,'������������ � ���������� ���������,\par ������������� �� ������ ��������', 310);
      pr.SetPrintHead(true);
      pr.SetHeadFont(0,9);
      pr.SetTableFont(0,12);
      pr.SetBorder(-1, 'ltrb');
      pr.Print;
      FreePrintTable(pr);
      tb.Free;
//-----------------------------------------------------------------------
      if FinishPrint(GetFolderMyDocument+'\����������������.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') then
          ShellExt(GetFolderMyDocument+'\����������������.doc');
      end else begin
        PutError(strErr);
      end;
   finally
      sl.Free;
      slPar.Free;
      HeadList.Free;
      WidthList.Free;
   end;
end;

procedure SpravkaSostav;
var
   sl, slPar, slOwners: TStringList;
   HeadList: TStringList;
   WidthList: TStringList;
   tb,sprOtnosh : TDataSet;
   m : TMens;
   adr : TAdresLic;
   nStr,nID,i : Integer;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nYear,nMonth,nDay : Word;
begin
   sl:=TStringList.Create;
   slOwners:=TStringList.Create;
   slPar:=TStringList.Create;
   HeadList:=TStringList.Create;
   WidthList:=TStringList.Create;
   try
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      nID := m.Fld('ID_INTERNAL').AsInteger;
      strKomu := m.Fld('FAMILIA').AsString+' '+m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
      strGR:='';
      if m.Fld('DATER').AsString<>'' then
        strGR:=FormatDateTime('YYYY',m.Fld('DATER').AsDateTime);
      if m.Fld('POL').AsString='�' then begin
        strPol :='��' ;
        strPol2:='���������' ;
        strPol3:='�';
        strEG := '���';
      end else begin
        strPol:='���';
        strPol2:='���������' ;
        strPol3:='�';
        strEG := '��';
      end;
      DecodeDate(GlobalTask.CurrentDate,nYear,nMonth,nDay);
      strAdres:= adr.GetAdres+', '+FirstCharUpper(Raion_Name('�'))+', '+FirstCharUpper(Obl_Name('�'));
      StartPrint(sl, poPortrait, pfA4);
      PrintString(sl, UpperCase(NameOrg('�',''))+'\par ', 0, 12, False, False, False);
      PrintString(sl, UpperCase(NameOrg('',''))+'\par ', 0, 12, False, False, False);
      PrintString(sl, ParamAsString('GOROD')+' '+FirstCharUpper(Raion_Name(''))+' '+FirstCharUpper(Obl_Name(''))+'\par ', 0, 12, False, False, False);
      PrintString(sl, '\ldblquote   '+IntToStr(nDay)+'  \rdblquote   '+GetMonthPropis(GlobalTask.CurrentDate,'�')+'   '+IntToStr(nYear)+' �__________\par\par ', 0, 12, False, False, False);
      PrintString(sl, '\qc �������\par ', 0, 12, False, False, False);
      PrintString(sl, '\fi720\qj ������ ��������� ��. '+GetPadegFIO(strKomu,strPol3,'�')+'  '+strGR+' �.�. � ���, ��� '+strPol+' ������������� '+strPol2+' �� ������ '+strAdres+' \par\par ', 0, 12, False, False, False);
      s:='_______________________________';
      if m.Fld('DATEP').AsString<>'' then begin
        s:= FormatDateTime('DD.MM.YYYY',m.Fld('DATEP').AsDateTime);
      end;

//      if LicSchet.Fld('PLOSH_ZDAN').AsString=''
        strPlosh := LicSchet.Fld('PLOSH_ALL').AsString
//        else strPlosh := LicSchet.Fld('PLOSH_ZDAN').AsString;
      PrintString(sl, ' �������� ��c������(��������) � '+ s +' \par ', 0, 12, False, False, False);
      PrintString(sl, '���������� �������: '+ strPlosh + ' ��.�., �����: '+LicSchet.Fld('PLOSH_GIL').AsString+' ��.�.' +' \par ', 0, 12, False, False, False);
      PrintString(sl, '����� ���.�����: '+ LicSchet.Fld('nomer').AsString+' \par ', 0, 12, False, False, False);
      PrintString(sl, '������ � ���(���) ���������: \par\par ', 0, 12, False, False, False);

      HeadList.Add('� �/�');
      HeadList.Add('�������, ���, ��������');
      HeadList.Add('��� ��������');
      HeadList.Add('����������� ���������');
      HeadList.Add('���� ��������');
      WidthList.Add('30');
      WidthList.Add('250');
      WidthList.Add('80');
      WidthList.Add('100');
      WidthList.Add('120');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');

      tb := dbCreateMemTable('NOMER,Integer;NAME,Char,100;DATER,Char,15;OTNOSH,Char,30;DATEPROP,Date;','');
      tb.Open;

      m.First;
      nStr:=2;
      sprOtnosh := dbGetDataSet('dmBase.SprOtnosh');
//      strSobstv := '';
      strSobstv := adr.GetOwners(slOwners,1);
      while not m.Eof do begin
        if slOwners.Count=0 then begin
          // ����� �������� �����, ������� ��� �� �� � �����������
          if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
            strSobstv := m.Fld('FAMILIA').AsString+' '+
                              m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
          end;
        end;
        if AddMenToSprav(m,nID) then begin
      //     (m.Fld('ID_INTERNAL').AsInteger<>nID) and       
       //    (m.Fld('PROPIS').AsBoolean=true) and            
      //     (m.Fld('PRESENT').AsBoolean=true) then begin 
          tb.Append;
          tb.Fld('NOMER').AsInteger := nStr;
          tb.Fld('NAME').AsString   := m.Fld('FAMILIA').AsString+' '+
                            m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
          if m.Fld('DATER').AsString<>'' then
            tb.Fld('DATER').AsString := FormatDateTime('YYYY',m.Fld('DATER').AsDateTime);
//        if m.Fld('DATEP').AsString<>'' then
//          tb.Fld('DATEP').AsString := FormatDateTime('DD.MM.YYYY',m.Fld('DATEP').AsDateTime);
          if m.Fld('OTNOSH').AsString<>'' then begin
            if dbLocate(sprOtnosh, 'ID', [m.Fld('OTNOSH').AsString], '') then begin
              tb.Fld('OTNOSH').AsString  := sprOtnosh.Fld('NAME').AsString;
            end;
          end;

          if m.Fld('DATEP').AsString<>'' then begin;
            tb.Fld('DATEPROP').AsString := FormatDateTime('DD.MM.YYYY',m.Fld('DATEP').AsDateTime);
          end;

          tb.Post;
          nStr:=nStr+1;
        end;
        m.Next;
      end;
      m.First;
      PrintTable(sl, tb, HeadList, WidthList, slPar, 0, 12);
      if slOwners.Count<2 then begin
        s := '\par\fi720\qj �������� �������������� �������� ';
      end else begin
        s := '\par\fi720\qj ��������� ��������������� ��������: ';
      end;
      if slOwners.Count=0 then begin
        PrintString(sl, s + strSobstv+'\par ', 0, 12, False, False, False);
      end else begin
        PrintString(sl, s + strSobstv+'\par ', 0, 12, False, False, False);
      end;
      PrintString(sl, '\fi720 ������� ������ ��� �������������� �� ����� ����������.\par\par ', 0, 12, False, False, False);
      PrintString(sl, '������������ ���������                                    '+ParamAsString('������������')+'\par\par ', 0, 12, False, False, False);
      PrintString(sl, '���������                                                 '+ParamAsString('��_���������')+'\par\par ', 0, 12, False, False, False);
      PrintString(sl, '����������                                                '+ParamAsString('���_����')+'\par\par ', 0, 12, False, False, False);
      if FinishPrint(GetFolderMyDocument+'\�������������������.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') then
          ShellExt(GetFolderMyDocument+'\�������������������.doc');
//        if ParamAsBoolean('SHOW_WRITE_DOK') then
//          ShowMessage('�������� <�������������������.doc> ������� � ����� <��� ���������>');
      end else begin
        PutError(strErr);
      end;
      tb.Close;
//      Memo1.Lines.Assign(sl);
   finally
      tb.Free;
      sl.Free;
      slOwners.Free;
      slPar.Free;
      HeadList.Free;
      WidthList.Free;
   end;
end;

procedure SostavSem(lPrintAll : Boolean; nType : Integer);
var
   sl, slPar, slOwners: TStringList;
   HeadList: TStringList;
   WidthList: TStringList;
   tb,sprOtnosh : TDataSet;
   m : TMens;
   adr : TAdresLic;
   nStr,nID : Integer;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strOborud,strGR,strPlosh, strNanim : String;
   nYear,nMonth,nDay : Word;
begin
   sl:=TStringList.Create;
   slOwners:=TStringList.Create;
   slPar:=TStringList.Create;
   HeadList:=TStringList.Create;
   WidthList:=TStringList.Create;
   try
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      nID := m.Fld('ID_INTERNAL').AsInteger;
      strKomu := m.Fld('FAMILIA').AsString+' '+m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
      strGR:='';
      if m.Fld('DATER').AsString<>'' then begin
//        if nType=0 
//          then strGR:=FormatDateTime('YYYY',m.Fld('DATER').AsDateTime)
//          else strGR:=FormatDateTime('DD.MM.YYYY',m.Fld('DATER').AsDateTime);
        strGR:=FormatDateTime('DD.MM.YYYY',m.Fld('DATER').AsDateTime);
      end;
      if m.Fld('POL').AsString='�' then begin
        strPol :='��' ;
        strPol2:='��������' ;
        strPol3:='�';
        strEG := '���';
      end else begin
        strPol:='���';
        strPol2:='���������' ;
        strPol3:='�';
        strEG := '��';
      end;
      DecodeDate(GlobalTask.CurrentDate,nYear,nMonth,nDay);
      strAdres:= adr.GetAdres+', '+FirstCharUpper(Raion_Name('�'))+', '+FirstCharUpper(Obl_Name('�'));
      StartPrint(sl, poPortrait, pfA4);
      PrintString(sl, UpperCase(NameOrg('�',''))+'\par ', 0, 12, False, False, False);
      PrintString(sl, UpperCase(NameOrg('',''))+'\par ', 0, 12, False, False, False);
      PrintString(sl, ParamAsString('GOROD')+' '+FirstCharUpper(Raion_Name(''))+' '+FirstCharUpper(Obl_Name(''))+'\par ', 0, 12, False, False, False);

      PrintString(sl, '\ldblquote   '+IntToStr(nDay)+'  \rdblquote   '+GetMonthPropis(GlobalTask.CurrentDate,'�')+'   '+IntToStr(nYear)+' �_________ \par ', 0, 12, False, False, False);
      if nType=1 
       then  PrintString(sl, '��   �__________   ��  ___________\par\par ', 0, 12, False, False, False)
       else  PrintString(sl, '\par ', 0, 12, False, False, False);

      PrintString(sl, '\qc �������\par ', 0, 14, True, False, False);
      if lPrintAll then begin
        PrintString(sl, '\qc � ���������� ����������� ����� ��������� � � ������� �����\par\par ', 0, 11, true, False, False);
      end else begin
        PrintString(sl, '\qc � ������� �����\par\par ', 0, 12, False, False, False);
      end;
      if lPrintAll then begin
        PrintString(sl, '\fi720\qj ���� ��. '+GetPadegFIO(strKomu,strPol3,'�')+'  '+strGR+' �.�. � ���, ��� '+strPol+' ������������� '+strPol2+' �� ������ '+strAdres+' ��� ���������:\par\par ' , 0, 12, False, False, False);
      end else begin
        PrintString(sl, '\fi720\qj ���� ��. '+GetPadegFIO(strKomu,strPol3,'�')+'  '+strGR+' �.�. � ���, ��� '+strPol+' ������������� '+strPol2+' �� ������ '+strAdres+', � ������ '+strEG+' ����� �������������:\par\par ', 0, 12, False, False, False);
      end;
      HeadList.Add('� �/�');
      HeadList.Add('�������, ���, ��������');
//      if nType=0 
//        then HeadList.Add('��� ��������')
//        else HeadList.Add('���� ��������');
      HeadList.Add('���� ��������');
      HeadList.Add('������� �������');
      WidthList.Add('30');
      WidthList.Add('250');
      WidthList.Add('120');
      WidthList.Add('90');
      if lPrintAll then begin
        HeadList.Add('���� ��������');
        WidthList.Add('120');
      end else begin
        HeadList.Add('����������');
        WidthList.Add('150');
      end;
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');

      tb := dbCreateMemTable('NOMER,Integer;NAME,Char,100;GODR,Char,10;OTNOSH,Char,30;DATEP,Char,15;','');
      tb.Open;

      // ������� ���� ���� �������� �������
      tb.Append;
      tb.Fld('NOMER').AsInteger := 1;
      tb.Fld('NAME').AsString   := FirstCharUpper(strPol) + ' ��';
      {
      s := m.Fld('WORK_NAME').AsString;
      if m.Fld('DOLG_NAME').AsString<>'' 
        then s := s + ',' + m.Fld('DOLG_NAME').AsString;
      if (s='') then begin
        if (m.Fld('STUD_PLACE').AsString<>'') then begin
          s := m.Fld('STUD_PLACE').AsString;
        end else begin
          if not m.Fld('ISWORK').IsNull and (m.Fld('ISWORK').AsBoolean=false) then begin 
            if m.Fld('POL').AsString='�' then s:='�����������' else s:='�����������';
          end;
        end;
      end;
      tb.Fld('WORKNAME').AsString := s;
      }
      if m.Fld('DATEP').AsString<>'' then
        tb.Fld('DATEP').AsString := FormatDateTime('DD.MM.YYYY',m.Fld('DATEP').AsDateTime);
      tb.Post;

      m.First;
      nStr:=2;
      sprOtnosh := dbGetDataSet('dmBase.SprOtnosh');
//      strSobstv := '';
      strSobstv := adr.GetOwners(slOwners,1);
      while not m.Eof do begin
        if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
          // ����������
          strNanim := m.Fld('FAMILIA').AsString+' '+
                            m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
          if slOwners.Count=0 then begin
            strSobstv := strNanim;
          end;
        end;
        // ���������� ������� �������
        if AddMenToSprav(m,nID) then begin
//        if (m.Fld('ID_INTERNAL').AsInteger<>nID) and
//           (m.Fld('PROPIS').AsBoolean=true) and             // ���. ������ �����������
//           (m.Fld('PRESENT').AsBoolean=true) then begin // ���. ������ ��������������
          tb.Append;
          tb.Fld('NOMER').AsInteger := nStr;
          tb.Fld('NAME').AsString   := m.Fld('FAMILIA').AsString+' '+
                            m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
          if m.Fld('DATER').AsString<>'' then begin
//            if nType=0
//              then tb.Fld('GODR').AsString := FormatDateTime('YYYY',m.Fld('DATER').AsDateTime)
//              else tb.Fld('GODR').AsString := FormatDateTime('DD.MM.YYYY',m.Fld('DATER').AsDateTime);
            tb.Fld('GODR').AsString := FormatDateTime('DD.MM.YYYY',m.Fld('DATER').AsDateTime);
          end;
          if m.Fld('OTNOSH').AsString<>'' then begin
            if dbLocate(sprOtnosh, 'ID', [m.Fld('OTNOSH').AsString], '') then begin
              tb.Fld('OTNOSH').AsString  := sprOtnosh.Fld('NAME').AsString;
            end;
          end;
          if m.Fld('DATEP').AsString<>'' then
            tb.Fld('DATEP').AsString := FormatDateTime('DD.MM.YYYY',m.Fld('DATEP').AsDateTime);
          tb.Post;
          nStr:=nStr+1;
        end;
        m.Next;
      end;
      m.First;
      PrintTable(sl, tb, HeadList, WidthList, slPar, 0, 12);
      if lPrintAll then begin
        strOborud := '��.����������, ';
        if LicSchet.Fld('VODOPROV').AsBoolean  then strOborud:=strOborud+'������������, ';
        if LicSchet.Fld('KANALIZ').AsBoolean   then strOborud:=strOborud+'������������, ';
        if LicSchet.Fld('CENT_OTOP').AsBoolean then strOborud:=strOborud+'�����. ����������, ';
        if LicSchet.Fld('GOR_VODA').AsBoolean  then strOborud:=strOborud+'������� ��������������, ';
        if LicSchet.Fld('GAZ').AsBoolean       then strOborud:=strOborud+'����� (�������), ';
        if LicSchet.Fld('EL_PLIT').AsBoolean   then strOborud:=strOborud+'��������� ������������, ';
        strOborud := Trim(strOborud);
        strOborud := Copy(strOborud,1,Length(strOborud)-1);
        s := '\par\fi720\qj ����������� (�������������) �������� '+strNanim;

        if slOwners.Count<2 then begin
          s := '\par\fi720\qj ������������� ������ ��������� �������� ';
        end else begin
          s := '\par\fi720\qj �������������� ������ ��������� ��������: ';
        end;
        if slOwners.Count=0 then begin
          PrintString(sl, s + strSobstv+'\par ', 0, 12, False, False, False);
        end else begin
          PrintString(sl, s + strSobstv+'\par ', 0, 12, False, False, False);
//          for i:=0 to slOwners.Count-1 do begin
//          end;
        end;
        if LicSchet.Fld('PLOSH_ZDAN').AsString=''
          then strPlosh := LicSchet.Fld('PLOSH_ALL').AsString
          else strPlosh := LicSchet.Fld('PLOSH_ZDAN').AsString;
        PrintString(sl, '\qc �������������� ������ ��������� \par ', 0, 12, true, False, False);
        PrintString(sl, '\fi720\qj ����� ��������� ������������ ����� ��� ����� �������� '+strPlosh+' ��.�., ', 0, 12, False, False, False);
        PrintString(sl, '����� �������� '+LicSchet.Fld('PLOSH_GIL').AsString+' ��.�.', 0, 12, False, False, False);
        PrintString(sl, '  ����� ��� ������� �� '+LicSchet.Fld('KOL_KOMN').AsString+' ������ � �����.', 0, 12, False, False, False);
        PrintString(sl, '\fi720\qj ����� ��������� �����������: '+strOborud+'\par ', 0, 12, False, False, False);
        PrintString(sl, '\fi720\qj ������ ����� �������� �� ������� ������� ����� '+GetPadegFIO(strKomu,strPol3,'�')+' �� ���������� '+GetPadeg(ParamAsString('KNAME'),'�')+' �� ��������. \par ', 0, 12, False, False, False);
      end else begin
        if nType=0 then begin
          PrintString(sl, '\fi720\qj ���������: ��������������� ����� � '+LicSchet.Fld('KNIGA_NOMER').AsString+', ������� ���� � '+LicSchet.Fld('NOMER').AsString+'. \par ', 0, 12, False, False, False);
        end;
      end;
// PLOSH_ALL-����� ������� PLOSH_GIL-�����  PLOSH_ZDAN-������
// KOL_KOMN- ���. ������
// VODOPROV-����������   KANALIZ-����������� CENT_OTOP-�����.���������
// GOR_VODA-���.�������������  GAZ-��� ������� GID_GAZ-��� ���������  EL_PLIT-�������� ��.�����
// 
      tb.Close;

      PrintString(sl, '\fi720 ������� ������ ��� �������������� �� ����� ����������.\par\par ', 0, 12, False, False, False);
      if nType=0 then begin
        PrintString(sl, '������������ ���������                                                                            '+ParamAsString('������������')+'\par\par ', 0, 12, False, False, False);
      end;
      PrintString(sl, '��������� ���������                                                                                  '+ParamAsString('���������')+'\par\par ', 0, 12, False, False, False);

      if FinishPrint(GetFolderMyDocument+'\�������������������.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') then
          ShellExt(GetFolderMyDocument+'\�������������������.doc');
//        if ParamAsBoolean('SHOW_WRITE_DOK') then
//          ShowMessage('�������� <�������������������.doc> ������� � ����� <��� ���������>');
      end else begin
        PutError(strErr);
      end;
//      Memo1.Lines.Assign(sl);
   finally
      tb.Free;
      sl.Free;
      slOwners.Free;
      slPar.Free;
      HeadList.Free;
      WidthList.Free;
   end;
end;

procedure SostavSem1;
begin
  SostavSem(false,0);
end;

procedure SostavSem3;
begin
  SostavSem(false,1);
end;

procedure SostavSem2;
begin
  SostavSem(true,0);
end;


//---------------------------------------------------

procedure SpravkaMestoAndSostav;
var
   sl, slPar, slOwners: TStringList;
   HeadList: TStringList;
   WidthList: TStringList;
   tb,sprOtnosh,sprTypeHouse : TDataSet;
   m : TMens;
   adr : TAdresLic;
   nStr,nID : Integer;
   s,strKomu,strPol,strPol2,strPol3,strPol4,strErr,strEG,
   strAdres,strSobstv,strOborud,strGR,strPlosh, strNanim : String;
   nYear,nMonth,nDay : Word;
begin
   sl:=TStringList.Create;
   slOwners:=TStringList.Create;
   slPar:=TStringList.Create;
   HeadList:=TStringList.Create;
   WidthList:=TStringList.Create;
   try
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      nID := m.Fld('ID_INTERNAL').AsInteger;
      strKomu := m.Fld('FAMILIA').AsString+' '+m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
      strGR:='';
      if m.Fld('DATER').AsString<>'' then
        strGR:=FormatDateTime('YYYY',m.Fld('DATER').AsDateTime);
      if m.Fld('POL').AsString='�' then begin
        strPol :='��' ;
        strPol2:='��������' ;
        strPol4:='����������' ;
        strPol3:='�';
        strEG := '���';
      end else begin
        strPol:='���';
        strPol2:='���������' ;
        strPol4:='���������' ;
        strPol3:='�';
        strEG := '��';
      end;
      DecodeDate(GlobalTask.CurrentDate,nYear,nMonth,nDay);
      strAdres:= adr.GetAdres+', '+FirstCharUpper(Raion_Name('�'))+', '+FirstCharUpper(Obl_Name('�'));
      StartPrint(sl, poPortrait, pfA4);

      PrintShtamp1(sl, '���������� 1 \par � ������������� ������������ \par �������-������������� ��������� \par ���������� �������� \par 21.12.2005 �58');

//      PrintString(sl, StringReplace(GlobalTask.ParamAsString('SHTAMP'),Chr(13)+Chr(10),'\par')+'\par', 0, 12, False, False, False);
//      PrintString(sl, UpperCase(NameOrg('�',''))+'\par', 0, 12, False, False, False);
//      PrintString(sl, UpperCase(NameOrg('',''))+'\par', 0, 12, False, False, False);
//      PrintString(sl, ParamAsString('GOROD')+' '+FirstCharUpper(Raion_Name(''))+' '+FirstCharUpper(Obl_Name(''))+'\par', 0, 12, False, False, False);
      PrintString(sl, '\ldblquote   '+IntToStr(nDay)+'  \rdblquote   '+GetMonthPropis(GlobalTask.CurrentDate,'�')+'   '+IntToStr(nYear)+'  �_______\par\par ', 0, 12, False, False, False);
      PrintString(sl, '\qc �������\par ', 0, 14, True, False, False);
      PrintString(sl, '\qc � ����� ���������� � � ������� �����\par\par ', 0, 12, true, False, False);
      PrintString(sl, '\qj ������ '+strPol4+' '+GetPadegFIO(strKomu,strPol3,'�')+'\par ', 0, 12, False, False, False);
      PrintString(sl, '\qj � ���, ��� '+strPol+' ������������� ��������� �� ������: '+strAdres+'. \par ', 0, 12, False, False, False);
      PrintString(sl, '\qj '+strPol2 +'��������� c '+DatePropis(m.Fld('DATEP').AsDateTime,2)+'\par ', 0, 12, False, False, False);

      sprTypeHouse := dbGetDataSet('dmBase.SprTypeHouse');

//      if LicSchet.Fld('PLOSH_ZDAN').AsString=''
        strPlosh := LicSchet.Fld('PLOSH_ALL').AsString
//        else strPlosh := LicSchet.Fld('PLOSH_ZDAN').AsString;
      PrintString(sl, '\qj ���������� ����� �������: '+strPlosh+' ��.������, � �������� ����� '+LicSchet.Fld('NOMER').AsString+'. \par ', 0, 12, False, False, False);
      s:='';
      if LicSchet.Fld('OWN_HOUSE').AsBoolean then begin
        s := '������� ���';
      end else begin
        if dbLocate(sprTypeHouse, 'ID', [LicSchet.Fld('TYPEHOUSE').AsString], '') then begin
          s := sprTypeHouse.Fld('NAME').AsString;
        end;
      end;

      PrintString(sl, '\qj ����� ��������� ��������: '+s+'\par ', 0, 12, False, False, False);
      PrintString(sl, '\qj � ����� ��������� ����� ��������� (����������������) ��������� ����: '+'\par ', 0, 12, False, False, False);

      HeadList.Add('� �/�');
      HeadList.Add('�������, ���, ��������');
      HeadList.Add('��� ��������');
      HeadList.Add('������� �������');
      WidthList.Add('30');
      WidthList.Add('270');
      WidthList.Add('120');
      WidthList.Add('90');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');

      tb := dbCreateMemTable('NOMER,Integer;NAME,Char,100;GODR,Char,10;OTNOSH,Char,30;DATEP,Char,15;','');
      tb.Open;

      m.First;
      nStr:=1;
      sprOtnosh    := dbGetDataSet('dmBase.SprOtnosh');
//      strSobstv := '';
      strSobstv := adr.GetOwners(slOwners,1);
      while not m.Eof do begin
        if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
          // ����������
          strNanim := m.Fld('FAMILIA').AsString+' '+
                            m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
          if slOwners.Count=0 then begin
            strSobstv := strNanim;
          end;
        end;
        // ���������� ������� �������
        if AddMenToSprav(m,nID) then begin

//        if (m.Fld('ID_INTERNAL').AsInteger<>nID) and
//           (m.Fld('PROPIS').AsBoolean=true) and             // ���. ������ �����������
//           (m.Fld('PRESENT').AsBoolean=true) then begin // ���. ������ ��������������
          tb.Append;
          tb.Fld('NOMER').AsInteger := nStr;
          tb.Fld('NAME').AsString   := m.Fld('FAMILIA').AsString+' '+
                            m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
          if m.Fld('DATER').AsString<>'' then
            tb.Fld('GODR').AsString := FormatDateTime('YYYY',m.Fld('DATER').AsDateTime);
          if m.Fld('OTNOSH').AsString<>'' then begin
            if dbLocate(sprOtnosh, 'ID', [m.Fld('OTNOSH').AsString], '') then begin
              tb.Fld('OTNOSH').AsString  := sprOtnosh.Fld('NAME').AsString;
            end;
          end;
          if m.Fld('DATEP').AsString<>'' then
            tb.Fld('DATEP').AsString := FormatDateTime('DD.MM.YYYY',m.Fld('DATEP').AsDateTime);
          tb.Post;
          nStr:=nStr+1;
        end;
        m.Next;
      end;
      m.First;
      PrintTable(sl, tb, HeadList, WidthList, slPar, 0, 12);

      tb.Close;

      PrintString(sl, '\par ', 0, 12, False, False, False);
      PrintString(sl, '����������� (�������������) �������� '+strNanim+'. \par\par ', 0, 12, False, False, False);
      PrintString(sl, '��������� ������� ������������� � ������� ����� ������� � ���� �� ������.\par\par\par ', 0, 12, False, False, False);
      PrintString(sl, '������������ ���������                                    '+ParamAsString('������������')+'\par\par ', 0, 12, False, False, False);
      PrintString(sl, '����������                                                           '+ParamAsString('���_����')+'\par\par ', 0, 12, False, False, False);
      PrintString(sl, '���������                                                              '+ParamAsString('��_���������')+'\par\par ', 0, 12, False, False, False);

      if FinishPrint(GetFolderMyDocument+'\������������������������������������.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') then
          ShellExt(GetFolderMyDocument+'\������������������������������������.doc');
//        if ParamAsBoolean('SHOW_WRITE_DOK') then
//          ShowMessage('�������� <�������������������.doc> ������� � ����� <��� ���������>');
      end else begin
        PutError(strErr);
      end;
//      Memo1.Lines.Assign(sl);
   finally
      tb.Free;
      sl.Free;
      slOwners.Free;
      slPar.Free;
      HeadList.Free;
      WidthList.Free;
   end;
end;

procedure SpravkaMesto;
var
   sl, slOwners: TStringList;
   sprOtnosh : TDataSet;
   m : TMens;
   adr : TAdresLic;
   nStr,nID : Integer;
   s,strKomu,strPol,strPol2,strPol3,strPol4,strErr,strEG,
   strAdres,strSobstv,strOborud,strGR,strPlosh, strNanim : String;
   nYear,nMonth,nDay : Word;
begin
   sl:=TStringList.Create;
   slOwners:=TStringList.Create;
   try
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      nID := m.Fld('ID_INTERNAL').AsInteger;
      strKomu := m.Fld('FAMILIA').AsString+' '+m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
      strGR:='';
      if m.Fld('DATER').AsString<>'' then
        strGR:=FormatDateTime('YYYY',m.Fld('DATER').AsDateTime);
      if m.Fld('POL').AsString='�' then begin
        strPol :='��' ;
        strPol2:='��������' ;
        strPol4:='����������' ;
        strPol3:='�';
        strEG := '���';
      end else begin
        strPol:='���';
        strPol2:='���������' ;
        strPol4:='���������' ;
        strPol3:='�';
        strEG := '��';
      end;
      DecodeDate(GlobalTask.CurrentDate,nYear,nMonth,nDay);
      strAdres:= adr.GetAdres+', '+FirstCharUpper(Raion_Name('�'))+', '+FirstCharUpper(Obl_Name('�'));
      StartPrint(sl, poPortrait, pfA4);

      PrintShtamp1(sl, '���������� 2 \par � ������������� ������������ \par �������-������������� ��������� \par ���������� �������� \par 21.12.2005 �58');

//      PrintString(sl, StringReplace(GlobalTask.ParamAsString('SHTAMP'),Chr(13)+Chr(10),'\par')+'\par', 0, 12, False, False, False);

//      PrintString(sl, UpperCase(NameOrg('�',''))+'\par', 0, 12, False, False, False);
//      PrintString(sl, UpperCase(NameOrg('',''))+'\par', 0, 12, False, False, False);
//      PrintString(sl, ParamAsString('GOROD')+' '+FirstCharUpper(Raion_Name(''))+' '+FirstCharUpper(Obl_Name(''))+'\par', 0, 12, False, False, False);
      PrintString(sl, '\ldblquote   '+IntToStr(nDay)+'  \rdblquote   '+GetMonthPropis(GlobalTask.CurrentDate,'�')+'   '+IntToStr(nYear)+'  �_______\par\par ', 0, 12, False, False, False);
      PrintString(sl, '\qc �������\par ', 0, 14, True, False, False);
      PrintString(sl, '\qc � ����� ���������� \par\par ', 0, 12, true, False, False);
      PrintString(sl, '\qj ������ '+strPol4+' '+GetPadegFIO(strKomu,strPol3,'�')+'\par ', 0, 12, False, False, False);
      PrintString(sl, '\qj � ���, ��� '+strPol+' ������������� ��������� �� ������: '+strAdres+'. \par ', 0, 12, False, False, False);
      PrintString(sl, '\qj '+strPol2 +' ��������� c '+DatePropis(m.Fld('DATEP').AsDateTime,2)+'\par ', 0, 12, False, False, False);

      PrintString(sl, '��������� ������� ������������� � ������� ����� ������� � ���� �� ������.\par\par ', 0, 12, False, False, False);
      PrintString(sl, '��������� ���������                                          '+ParamAsString('���������')+'\par\par ', 0, 12, False, False, False);
      if ParamAsString('���_����')<>ParamAsString('���������') then 
        PrintString(sl, '����������                                                           '+ParamAsString('���_����')+'\par\par ', 0, 12, False, False, False);

      if FinishPrint(GetFolderMyDocument+'\�����������������������.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') then
          ShellExt(GetFolderMyDocument+'\�����������������������.doc');
//        if ParamAsBoolean('SHOW_WRITE_DOK') then
//          ShowMessage('�������� <�������������������.doc> ������� � ����� <��� ���������>');
      end else begin
        PutError(strErr);
      end;
//      Memo1.Lines.Assign(sl);
   finally
      sl.Free;
      slOwners.Free;
   end;
end;


