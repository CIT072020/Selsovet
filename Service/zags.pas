

//---------------------------------------------------------------
// ��������� ��������� � �����
procedure RunDeclToAZ; 
var
  q,ds,dsDecl,dsBrak:TDataSet;
  nAll,nCh,nAdd,nAktID:Integer;
  l,lOk,lFind:Boolean;
  s:String;
begin
  if not Problem('��������� �������� ��������� � ������� ���� � ����� ?') then exit;
  dsDecl:=dbGetDataSet('dmBase.tbDeclBrak');
  dsBrak:=dbGetDataSet('dmBase.tbZapisBrak');
  q:=dbGetDataSet('fmGurnDBrak.Query');
  q.First;
  l:=dbDisableControls(q);
  nCh:=0;
  nAdd:=0;
  nAll:=0;
//  OpenMessage('���������� ��������� ...','',10);
  writedebug('���������� ���������');
  while not q.Eof do begin
    if dbLocate(dsDecl, 'ID',[q.Fld('ID').AsInteger], '') then begin
      nAll:=nAll+1;
      nAktID:=dsDecl.Fld('BRAK_ID').AsInteger;
      lOk:=false;
      lFind:=false;
      if nAktID>0 then begin
        if dbLocate(dsBrak, 'ID',[nAktID], '') then begin  // ����� ������ ���� �� ID
          lFind:=true;
          if (dsDecl.Fld('ON_FAMILIA').AsString=dsBrak.Fld('ON_FAMILIA').AsString) and (dsDecl.Fld('ONA_FAMILIA').AsString=dsBrak.Fld('ONA_FAMILIA').AsString) and 
             (dsDecl.Fld('ON_NAME').AsString=dsBrak.Fld('ON_NAME').AsString) and (dsDecl.Fld('ONA_NAME').AsString=dsBrak.Fld('ONA_NAME').AsString) and
             (dsDecl.Fld('ON_OTCH').AsString=dsBrak.Fld('ON_OTCH').AsString) and (dsDecl.Fld('ONA_OTCH').AsString=dsBrak.Fld('ONA_OTCH').AsString) then begin
            lOk:=true;
          end;
        end; 
      end;
      if not lOk then begin
        s:='SELECT ID,NOMER,DATEZ,ONA_FAMILIA,ONA_NAME,ONA_OTCH,ONA_DATER FROM ���������������� WHERE ON_FAMILIA='+QStr(dsDecl.Fld('ON_FAMILIA').AsString)+' and ON_DATER='+DateToSQL(dsDecl.Fld('ON_DATER').AsDateTime)+' and '+
           'ONA_FAMILIA='+QStr(dsDecl.Fld('ONA_FAMILIA').AsString)+' and ONA_NAME='+QStr(dsDecl.Fld('ONA_NAME').AsString)+
           ' and ONA_OTCH='+QStr(dsDecl.Fld('ONA_OTCH').AsString)+' and ONA_DATER='+DateToSQL(dsDecl.Fld('ONA_DATER').AsDateTime)+' ORDER BY DATEZ DESC';
//        writedebug(s);
        ds:=dbOpenSQL(s,'');
        if (ds.Fld('ID').AsInteger>0) and not ds.Fld('DATEZ').IsNull and not ds.Fld('NOMER').IsNull then begin
//          writedebug('>>>  '+ds.Fld('ONA_FAMILIA').AsString+' '+ds.Fld('ONA_NAME').AsString+' '+ds.Fld('ONA_OTCH').AsString+' '+ds.Fld('ONA_DATER').AsString);
          dsDecl.Edit;
          dsDecl.Fld('BRAK_ID').AsInteger:=ds.Fld('ID').AsInteger;
          dsDecl.Fld('OTMETKA_ISP').AsString:='�/� �'+ds.Fld('NOMER').AsString+' �� '+DatePropis(ds.Fld('DATEZ').AsDateTime,3);
          dsDecl.Post;
          writedebug('��������� �'+dsDecl.Fld('NOMER').AsString+' �� '+DatePropis(dsDecl.Fld('DATEZ').AsDateTime,3)+'  =>   '+dsDecl.Fld('OTMETKA_ISP').AsString);
          if lFind or (nAktID>0) 
            then nCh:=nCh+1 
            else nAdd:=nAdd+1;
        end;
        dbClose(ds);
      end;
    end;
    q.Next;
  end;
  q.First;
  dbEnableControls(q,l);
//  CloseMessage;
  writedebug('��������� ���������');
  writedebug('����������� �������: '+IntToStr(nAll));
  writedebug('�������� �������: '+IntToStr(nCh));
  writedebug('��������� �������: '+IntToStr(nAdd));
end;

//---------------------------------------------------------------
// ��������������� ������ �� ����
function REPORT_PredBrak(n:Integer):String; 
begin
  GlobalTask.SetLastValueAsInteger('TYPE_LIST', n); //������ �� ����� ��� �� ����
  Result:='����_����_������.fr3';
end;
//---------------------------------------------------------------
procedure DIzm_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisBrak.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
//    ds.Fld('DATEB').AsDateTime := GlobalTask.GetLastValueAsDate('LAST_DATEB_DBRAK');

    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GRAG').AsInteger:=i;   
      ds.Fld('GOSUD').AsInteger:=i;   
      ds.Fld('M_GOSUD').AsInteger:=i;   
    end;
    ds.Fld('OBL').AsString := Parameters('OBL');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GOROD_B').AsString := Parameters('GOROD_B');   

    ds.Fld('M_OBL').AsString := Parameters('OBL');   
    ds.Fld('M_RAION').AsString := Parameters('RAION');   
    ds.Fld('M_GOROD').AsString := Parameters('GOROD');   
    // ��������� � ��� ������������ ���������
    ds.Fld('SPEC_D').AsString := Parameters('DOLG_SPEC')
    ds.Fld('SPEC').AsString := Parameters('����_����');   
    ds.Fld('IS_IZMEN').AsBoolean:=true;   
    ds.Fld('IS_DOPOLN').AsBoolean:=false;   
    ds.Fld('IS_ISPRAV').AsBoolean:=false;   
  
  end;
end;
//-------------------------------------------------------
function DIzm_Report : String;     // !!!
var
  ds:TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds.Fld('ST21').AsBoolean=true  // ���� ��������, ������ 21 �������
    then AddReport('��������� � �������� ��������� (��.21)','&��������� �� ��������� ������� � ����� 21.fr3')
    else AddReport('��������� � �������� ���������','&��������� � �������� ���������.fr3');
  Result := '&LIST&';
end;
//---------------------------------------------------------------
procedure DChName_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisBrak.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
//    ds.Fld('DATEB').AsDateTime := GlobalTask.GetLastValueAsDate('LAST_DATEB_DBRAK');

    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GRAG').AsInteger     := i;   
    end;
    ds.Fld('OBL').AsString := Parameters('OBL');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GOROD_B').AsString := Parameters('GOROD_B');   

    ds.Fld('M_OBL').AsString := Parameters('OBL');   
    ds.Fld('M_RAION').AsString := Parameters('RAION');   
    ds.Fld('M_GOROD').AsString := Parameters('GOROD');   
    // ��������� � ��� ������������ ���������
    ds.Fld('SPEC_D').AsString := Parameters('DOLG_SPEC')
    ds.Fld('SPEC').AsString := Parameters('����_����');   
  
//    if ParamAsFloat('SUM_POSHLINA')>0  then ds.Fld('SUM_POSHLINA').AsFloat := ParamAsFloat('SUM_POSHLINA'); 
//    ds.Fld('POSHLINA').AsString := Parameters('POSHLINA'); 

  end;
end;
//-------------------------------------------------------
function DChName_Report : String;     // !!!
var
  ds:TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if (ds.Fld('TYPE_BRAK').AsInteger=1) and (ds.Fld('ST21').AsBoolean=true)  // ���� ��������, ������ 21 �������
    then AddReport('��������� � ����������� �������� �������, ������������ �����, ��������','&��������� � ����������� �������� ���21.fr3')
    else AddReport('��������� � ����������� �������� �������, ������������ �����, ��������','&��������� � ����������� �������� ���.fr3');
  Result := '&LIST&';
end;
//-------------------------------------------------------
procedure DRast_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisBrak.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DATEB').AsDateTime := GlobalTask.GetLastValueAsDate('LAST_DATEB_DRAST');

    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('ON_GRAG').AsInteger     := i;   
      ds.Fld('ONA_GRAG').AsInteger    := i;  
      ds.Fld('ON_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_GOSUD').AsInteger   := i;   
      ds.Fld('ON_M_GOSUD').AsInteger  := i;   
      ds.Fld('ONA_M_GOSUD').AsInteger := i;   
    end;
//    ds.Fld('ON_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('ON_RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('ON_OBL').AsString := Parameters('OBL');   
    ds.Fld('ON_RAION').AsString := Parameters('RAION');   
    ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   

//    ds.Fld('ONA_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('ONA_RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   

    ds.Fld('ON_M_OBL').AsString := Parameters('OBL');   
    ds.Fld('ON_M_RAION').AsString := Parameters('RAION');   
    ds.Fld('ON_M_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_M_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_M_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_M_GOROD').AsString := Parameters('GOROD');   
    if IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
      ds.Fld('ON_M_RNGOROD').AsString  := Parameters('RN_GOROD');   
      ds.Fld('ONA_M_RNGOROD').AsString := Parameters('RN_GOROD');   
      ds.Fld('ON_M_RAION').AsString    := '';   
      ds.Fld('ONA_M_RAION').AsString   := '';   
    end;
//    ds.Fld('VOENKOM').AsString := Parameters('ID_VOENKOM');   
    // ��������� � ��� ������������ ���������
    ds.Fld('DOLG_RUKOV').AsString := Parameters('DOLG_SPEC')
    ds.Fld('RUKOV').AsString := Parameters('����_����');   
    ds.Fld('ON_DOK_TYPE').AsString  := '1';   
    ds.Fld('ONA_DOK_TYPE').AsString := '1';   

    if ParamAsFloat('SUMR_POSHLINA')>0 then begin 
      ds.Fld('ON_SUM_POSHLINA').AsFloat  := ParamAsFloat('SUMR_POSHLINA'); 
      ds.Fld('ONA_SUM_POSHLINA').AsFloat := ParamAsFloat('SUMR_POSHLINA'); 
      ds.Fld('ON_POSHLINA').AsString  := Parameters('POSHLINA'); 
      ds.Fld('ONA_POSHLINA').AsString := Parameters('POSHLINA'); 
    end;
  end;
end;
//-------------------------------------------------------
function DRast_Report : String;
var
  ds:TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds.Fld('TYPE_RAST').AsInteger=1
    then AddReport('��������� � ����������� ����������� �����','&��������� � ����������� �����35.fr3')
    else AddReport('��������� � ����������� ����������� �����','&��������� � ����������� �����.fr3');
  Result := '&LIST&';
end;
//-------------------------------------------------------
// �������� ���� ����������� ����������
function Rn_ZAGS_Oper : Boolean;
var
  f:TfmParamQuest;
  ds,q : TDataSet;
  sSQL,s,ss : String;
  i : Integer;
  dOtch1,dOtch2:TDateTime;
  nYear,nMonth,nDay : Word;
begin
  Result:=false;
  f:=TfmParamQuest.Create(nil);
  f.Caption := '������� ���������';
  f.AddParamEx(Now, '�� ����' , 'DATEF' ,'TYPE=DATE');
  f.AddButtons('���������~�����',0);
  i:=f.ShowQuest;
  if i=1 then begin
    Result:=true;
//    GlobalTask.SetWorkParam('GOD',strGod);
    OpenMessage(PadRStr('������ ����� ...',30,' '),'',10);

    dOtch1:=f.GetValue('DATEF','D');
    DecodeDate(dOtch1,nYear,nMonth,nDay);
    dOtch2:=EncodeDate(nYear-1,nMonth,nDay);
    GlobalTask.SetWorkParam('DATE1',dOtch1);
    GlobalTask.SetWorkParam('DATE2',dOtch2);
//    writedebug(datepropis(dOtch1,3)+'   '+datepropis(dOtch2,3));

    ds:=FindReportTable('ZAGS');
    dbZap(ds);
    s:='����_��_����_���������|';
    ss:=dmBase.LoadSQLEx(s+'{1}');
//    sSQL := dmBase.CheckDateFiksSQL(sSQL, MaindateFiks);
    ds.Append;

    sSQL:=StringReplace(ss, QStr('1900-01-01'), DateToSQL(EncodeDate(nYear,1,1)));
    sSQL:=StringReplace(sSQL, QStr('2200-01-01'), DateToSQL(dOtch1));         // datez>='1900-01-01' and datez<'2200-02-01'
//  writedebug(sSQL);
    q:=dbOpenSQL(sSQL,'');
    ds.Fld('NUM1').AsInteger  := q.Fld('KOLVO_GM').AsInteger;
    ds.Fld('NUM2').AsInteger  := q.Fld('KOLVO_GG').AsInteger;
    ds.Fld('NUM3').AsInteger  := q.Fld('TRUD_G').AsInteger;
    ds.Fld('NUM4').AsInteger  := q.Fld('PENS_G').AsInteger;
    ds.Fld('NUM5').AsInteger  := q.Fld('KOLVO_SM').AsInteger;
    ds.Fld('NUM6').AsInteger  := q.Fld('KOLVO_SG').AsInteger;
    ds.Fld('NUM7').AsInteger  := q.Fld('TRUD_S').AsInteger;
    ds.Fld('NUM8').AsInteger  := q.Fld('PENS_S').AsInteger;
    ds.Fld('NUM11').AsInteger := q.Fld('MLAD_G').AsInteger;
    ds.Fld('NUM12').AsInteger := q.Fld('MLAD_S').AsInteger;

    sSQL:=StringReplace(ss, QStr('1900-01-01'), DateToSQL(EncodeDate(nYear-1,1,1)));
    sSQL:=StringReplace(sSQL, QStr('2200-01-01'), DateToSQL(dOtch2));
    dbChangeSQL(q,sSQL,true);
//  writedebug('--------------------');
//  writedebug(sSQL);
    ds.Fld('NUM21').AsInteger  := q.Fld('KOLVO_GM').AsInteger;
    ds.Fld('NUM22').AsInteger  := q.Fld('KOLVO_GG').AsInteger;
    ds.Fld('NUM23').AsInteger  := q.Fld('TRUD_G').AsInteger;
    ds.Fld('NUM24').AsInteger  := q.Fld('PENS_G').AsInteger;
    ds.Fld('NUM25').AsInteger  := q.Fld('KOLVO_SM').AsInteger;
    ds.Fld('NUM26').AsInteger  := q.Fld('KOLVO_SG').AsInteger;
    ds.Fld('NUM27').AsInteger  := q.Fld('TRUD_S').AsInteger;
    ds.Fld('NUM28').AsInteger  := q.Fld('PENS_S').AsInteger;
    ds.Fld('NUM31').AsInteger := q.Fld('MLAD_G').AsInteger;
    ds.Fld('NUM32').AsInteger := q.Fld('MLAD_S').AsInteger;
    //--- �������� -----
    ss:=dmBase.LoadSQLEx(s+'{2}');
    sSQL:=StringReplace(ss, QStr('1900-01-01'), DateToSQL(EncodeDate(nYear,1,1)));
    sSQL:=StringReplace(sSQL, QStr('2200-01-01'), DateToSQL(dOtch1));         
    dbChangeSQL(q,sSQL,true);
    ds.Fld('NUM9').AsInteger  := q.Fld('GOROD').AsInteger;
    ds.Fld('NUM10').AsInteger  := q.Fld('SELO').AsInteger;
    sSQL:=StringReplace(ss, QStr('1900-01-01'), DateToSQL(EncodeDate(nYear-1,1,1)));
    sSQL:=StringReplace(sSQL, QStr('2200-01-01'), DateToSQL(dOtch2));
//    writedebug(sSQL);
    dbChangeSQL(q,sSQL,true);
    ds.Fld('NUM29').AsInteger  := q.Fld('GOROD').AsInteger;
    ds.Fld('NUM30').AsInteger  := q.Fld('SELO').AsInteger;
    //--- ����� -----
    ss:=dmBase.LoadSQLEx(s+'{3}');
    sSQL:=StringReplace(ss, QStr('1900-01-01'), DateToSQL(EncodeDate(nYear,1,1)));
    sSQL:=StringReplace(sSQL, QStr('2200-01-01'), DateToSQL(dOtch1));         
    dbChangeSQL(q,sSQL,true);
    ds.Fld('NUM13').AsInteger  := q.Fld('GOROD').AsInteger;
    ds.Fld('NUM14').AsInteger  := q.Fld('SELO').AsInteger;
    sSQL:=StringReplace(ss, QStr('1900-01-01'), DateToSQL(EncodeDate(nYear-1,1,1)));
    sSQL:=StringReplace(sSQL, QStr('2200-01-01'), DateToSQL(dOtch2));
    dbChangeSQL(q,sSQL,true);
    ds.Fld('NUM33').AsInteger  := q.Fld('GOROD').AsInteger;
    ds.Fld('NUM34').AsInteger  := q.Fld('SELO').AsInteger;
    //--- �������. ������ -----
    ss:=dmBase.LoadSQLEx(s+'{4}');
//    writedebug(ss);
    sSQL:=StringReplace(ss, QStr('1900-01-01'), DateToSQL(EncodeDate(nYear,1,1)));
    sSQL:=StringReplace(sSQL, QStr('2200-01-01'), DateToSQL(dOtch1));         
//    writedebug(sSQL);
    dbChangeSQL(q,sSQL,true);
    ds.Fld('NUM15').AsInteger  := q.Fld('SOGL').AsInteger;
    ds.Fld('NUM16').AsInteger  := q.Fld('SUD').AsInteger;
    sSQL:=StringReplace(ss, QStr('1900-01-01'), DateToSQL(EncodeDate(nYear-1,1,1)));
    sSQL:=StringReplace(sSQL, QStr('2200-01-01'), DateToSQL(dOtch2));
    dbChangeSQL(q,sSQL,true);
    ds.Fld('NUM35').AsInteger  := q.Fld('SOGL').AsInteger;
    ds.Fld('NUM36').AsInteger  := q.Fld('SUD').AsInteger;

    ds.Post;
    dbClose(q);
    CloseMessage();
  end;
  f.Free;
end;

//-----------------------------------------------
// �������� ���� ������������� ����������
function Rn_ZAGS_Sravn : Boolean;
var
  f:TfmParamQuest;
  ds,q : TDataSet;
  sSQL,s,ss : String;
  i,nFont,nMonth,nYear : Integer;
begin
  Result:=false;
  f:=TfmParamQuest.Create(nil);
  f.Caption := '������� ���������';
  f.AddParamEx(YearOf(Now), '���' , 'GOD' ,'WIDTH=50');
  f.AddParamEx(MonthOf(Now) , '�����'  , 'MONTH'  ,'WIDTH=100~TYPE=LIST~DESC=KEY_MONTH');
  f.AddParamEx(false, '��������� ������ ������' , 'FONT' ,'WIDTH=100');
  f.AddButtons('���������~�����',0);
  i:=f.ShowQuest;
  if i=1 then begin
    Result:=true;
    nYear:=f.GetValue('GOD','N');
    nMonth:=f.GetValue('MONTH','N');
    if f.GetValue('FONT','L')
      then nFont:=12
      else nFont:=14;
    GlobalTask.SetWorkParam('GOD',nYear);
    GlobalTask.SetWorkParam('MONTH',nMonth);
    GlobalTask.SetWorkParam('FONT',nFont);
    OpenMessage(PadRStr('������ ����� ...',30,' '),'',10);

    ds:=FindReportTable('ZAGS');
    dbZap(ds);
    dbSetIndex(ds,'INT_KEY');
    ds.Append;
    for i:=1 to 12 do begin
      ds.Append;
      ds.Fld('INTKEY').AsInteger:=i;
      ds.Post;
    end;

    ss:=dmBase.LoadSQLEx('����_��_�����_���������');
    ss:=StringReplace(ss, '2009', IntToStr(nYear-1));
    ss:=StringReplace(ss, '2010', IntToStr(nYear));
    ss:=StringReplace(ss, '&month&', IntToStr(nMonth));
//    writedebug(ss);
    //--- �������� -----
    sSQL:=dmBase.GetSQLFromStr(ss,'{2}');
//    writedebug(sSQL);
    q:=dbOpenSQL(sSQL,'');
    while not q.Eof do begin
      if dbLocate(ds, 'INTKEY', [q.Fld('NMONTH').AsInteger], '') then begin
        ds.Edit;
        ds.Fld('NUM1').AsInteger  := q.Fld('KOLVO_GP').AsInteger;
        ds.Fld('NUM2').AsInteger  := q.Fld('KOLVO_SP').AsInteger;
        ds.Fld('NUM3').AsInteger  := q.Fld('KOLVO_GC').AsInteger;
        ds.Fld('NUM4').AsInteger  := q.Fld('KOLVO_SC').AsInteger;
        ds.Post;
      end;
      q.Next;
    end;
    //--- ������ -----
    sSQL:=dmBase.GetSQLFromStr(ss,'{1}');
    dbChangeSQL(q,sSQL,true);
    while not q.Eof do begin
      if dbLocate(ds, 'INTKEY', [q.Fld('NMONTH').AsInteger], '') then begin
        ds.Edit;
        ds.Fld('NUM5').AsInteger  := q.Fld('KOLVO_GP').AsInteger;
        ds.Fld('NUM6').AsInteger  := q.Fld('KOLVO_SP').AsInteger;
        ds.Fld('NUM7').AsInteger  := q.Fld('KOLVO_GC').AsInteger;
        ds.Fld('NUM8').AsInteger  := q.Fld('KOLVO_SC').AsInteger;
        ds.Post;
      end;
      q.Next;
    end;
    //--- ����. ������ -----
    sSQL:=dmBase.GetSQLFromStr(ss,'{3}');
    dbChangeSQL(q,sSQL,true);
    while not q.Eof do begin
      if dbLocate(ds, 'INTKEY', [q.Fld('NMONTH').AsInteger], '') then begin
        ds.Edit;
        ds.Fld('NUM9').AsInteger  := q.Fld('KOLVO_GP').AsInteger;
        ds.Fld('NUM10').AsInteger  := q.Fld('KOLVO_SP').AsInteger;
        ds.Fld('NUM11').AsInteger  := q.Fld('KOLVO_GC').AsInteger;
        ds.Fld('NUM12').AsInteger  := q.Fld('KOLVO_SC').AsInteger;
        ds.Post;
      end;
      q.Next;
    end;
    //--- �������. ������ -----
    sSQL:=dmBase.GetSQLFromStr(ss,'{4}');
    dbChangeSQL(q,sSQL,true);
    while not q.Eof do begin
      if dbLocate(ds, 'INTKEY', [q.Fld('NMONTH').AsInteger], '') then begin
        ds.Edit;
        ds.Fld('NUM13').AsInteger  := q.Fld('KOLVO_P').AsInteger;
        ds.Fld('NUM14').AsInteger  := q.Fld('KOLVO_C').AsInteger;
        ds.Post;
      end;
      q.Next;
    end;
    dbClose(q);
    CloseMessage();
  end;
  f.Free;
end;

