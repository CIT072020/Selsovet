function PokazZeml:String;
begin result:='cast(NValue as sql_numeric(15,4))';  end;

//procedure GetSpravSostavSem(sID:String);
//begin ExecOneReport(2{'SprMGS'}, false, sID, nil); end;

//function AddBLK:String; begin if GlobalTask.ParamAsBoolean('BLK_WITH_IN')=true then Result:='��' else Result:=''; end;
function AddBLK:String; begin Result:=''; end;

procedure Blank_Z_R;   begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� ��������'+AddBLK+'.fr3'); end;
procedure Blank_Z_R55; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� �������� ��55'+AddBLK+'.fr3'); end;
procedure Blank_Z_RZ;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� �������� ��������.fr3'); end;
procedure Blank_Z_RN;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� �������� ������.fr3'); end;
procedure Blank_Z_S;   begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� ������'+AddBLK+'.fr3'); end;
procedure Blank_Z_S6;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� ������ 6����.fr3'); end;
procedure Blank_Z_U;   begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� ������������ ���������'+AddBLK+'.fr3'); end;
procedure Blank_Z_US;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� ������������ ��������� ���'+AddBLK+'.fr3'); end;
procedure Blank_Z_B;   begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� ���������� �����'+AddBLK+'.fr3'); end;
procedure Blank_Z_SBV; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � �������� �������� ��������.fr3'); end;
procedure Blank_Z_NO;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� �� �������� �����.fr3'); end;
procedure Blank_Z_SUO; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � �������� �� ������������ ���������.fr3'); end;
procedure Blank_Z_UM;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� ������������ �����������'+AddBLK+'.fr3'); end;
procedure Blank_Z_SUM; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � �������� �� ������������ �����������.fr3'); end;
procedure Blank_Z_RB;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� ����������� �����'+AddBLK+'.fr3'); end;
procedure Blank_Z_RB35;begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� ����������� �����35'+AddBLK+'.fr3'); end; 
procedure Blank_Z_RU;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� �����������'+AddBLK+'.fr3'); end;
procedure Blank_Z_RPI; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� �������� �����'+AddBLK+'.fr3'); end;
procedure Blank_Z_AA;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� �� ������������� ������ ����.fr3'); end;
procedure Blank_Z_VI;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � �������� �����������.fr3'); end;
procedure Blank_Z_VA;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � �������������� ������ ����.fr3'); end;
procedure Blank_Z_VPS; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ������ ���������� �������������.fr3'); end;

procedure BlankRMNB; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � �������� ������ �� ��������� � �����.fr3'); end;
procedure BlankUOR;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� �� ������������ ��������� �� ��������� ���������.fr3'); end;
procedure BlankSBV;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � �������� �������� ��������.fr3'); end;
procedure BlankBRK;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ���������� � ����.fr3'); end;
procedure BlankBRKR; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ���������� � ����2.fr3'); end;
procedure BlankZVI;  begin GlobalTask.WorkReport(IsSystemAdmin,'&���������� � �������� ��� ��� � ���� � ����.fr3'); end;
procedure BlankZPF;  begin GlobalTask.WorkReport(IsSystemAdmin,'&���������� � �������� ��� � 17.fr3'); end;
procedure BlankZSV;  begin GlobalTask.WorkReport(IsSystemAdmin,'&���������� � �������� �������� ��������.fr3'); end;
procedure BlankAPN;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��� �������� ������� �������.fr3'); end;
procedure BlankPNB;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��� �� �������� �������������� �������.fr3'); end;

procedure BlankZPR;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� �� ����� ����������.frf'); end;
procedure BlankZPR2; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� �� ����� ����������.frf'); end;
procedure BlankZPR_A5;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� �� ����� �����������5.fr3'); end;
procedure BlankZPR2_A5; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� �� ����� �����������5.fr3'); end;
procedure BlankZVP;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ������ � ����� �� ����� ����������.frf'); end;

procedure BlankZRR;  begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ����������� �������.fr3'); end;
procedure BlankZPSB; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ���� ���� � �����.fr3'); end;
procedure BlankZPSS; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ���� ���� � ������.fr3'); end;
procedure BlankAKTO; begin GlobalTask.WorkReport(IsSystemAdmin,'&��� ������������.frf'); end;

procedure BlankZASR; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ������ ��� ������� � ��������.fr3'); end;
procedure BlankZASS; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ������ ��� ������� � ������.fr3'); end;
procedure BlankZSDF; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� ������� � ����� (� �����������).fr3'); end;

procedure BlankOBZS; begin GlobalTask.WorkReport(IsSystemAdmin,'&�������� ������ � ������.fr3'); end;
procedure BlankIPPS; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � �������������� �������������.fr3'); end;

procedure BlankZVINN; begin GlobalTask.WorkReport(IsSystemAdmin,'&���������� � �������� �����.fr3'); end; 
procedure BlankZVIN; begin GlobalTask.WorkReport(IsSystemAdmin,'&���������� � �������� ����.fr3'); end; 
procedure BlankZIN; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � �������� ����.fr3'); end; 
procedure BlankZSOZB; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � ������ ������� �� ���������� ������ ���� � �����.fr3'); end;

procedure Blank_Z_MNO; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� ������ �� �������� �����.fr3'); end; 
procedure Blank_Z_FIO21; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� � �������� ��� 21.fr3'); end; 
procedure Blank_Z_NZB; begin GlobalTask.WorkReport(IsSystemAdmin,'&��������� �� ���������� ������ � �����.fr3'); end;

//--------------------------------------------------------
//  [RunReport_] + [KOD ������]   nID-�������������, sName-�������� ������
function RunReport_AktSmertCopia(nID:Integer; sName:String):Boolean;
begin
  Result:=true;
  CurDok.EditDokument;
  CurDok.Fld('COPIA').AsBoolean:=true;
  CurDok.PostDokument;
end;
function RunReport_AktRogdCopia(nID:Integer; sName:String):Boolean;
begin
  Result:=true;
  CurDok.EditDokument;
  CurDok.Fld('COPIA').AsBoolean:=true;
  CurDok.PostDokument;
end;

//--------------------------------------------------------
function Report_ROVD2 : String;
begin
  if Copy(GlobalTask.ParamAsString('KOD'),1,1)='5'   // ��� ������ 
    then Result:='���� ������� ��������2�.fr3'
    else Result:='���� ������� ��������2.fr3';
end;

function Stat_Komnat : Boolean;
var
  ds,q : TDataSet;
  strSQL : String;
  i,n : Integer;
begin
  Result := true;
  OpenMessage('������ ����� "�������� ���� (�� ��������)" ','',10);
  ds := dbGetDataSet('fmMain.mtReport');
  dbSetIndex(ds,'BOK_KEY');
  dbZap(ds);
  strSQL := 'SELECT s.name, d.punkt,'+

    'Sum( CASE WHEN b1.nvalue=1 THEN 1 ELSE 0 END ) K1_KOLVO,'+
    'Sum( CASE WHEN b1.nvalue=1 THEN CAST(b2.nvalue as SQL_NUMERIC) ELSE 0 END ) K1_PL_ALL,'+
    'Sum( CASE WHEN b1.nvalue=1 THEN CAST(b3.nvalue as SQL_NUMERIC) ELSE 0 END ) K1_PL_GIL,'+

    'Sum( CASE WHEN b1.nvalue=2 THEN 1 ELSE 0 END ) K2_KOLVO,'+
    'Sum( CASE WHEN b1.nvalue=2 THEN CAST(b2.nvalue as SQL_NUMERIC) ELSE 0 END ) K2_PL_ALL,'+
    'Sum( CASE WHEN b1.nvalue=2 THEN CAST(b3.nvalue as SQL_NUMERIC) ELSE 0 END ) K2_PL_GIL,'+

    'Sum( CASE WHEN b1.nvalue=3 THEN 1 ELSE 0 END ) K3_KOLVO,'+
    'Sum( CASE WHEN b1.nvalue=3 THEN CAST(b2.nvalue as SQL_NUMERIC) ELSE 0 END ) K3_PL_ALL,'+
    'Sum( CASE WHEN b1.nvalue=3 THEN CAST(b3.nvalue as SQL_NUMERIC) ELSE 0 END ) K3_PL_GIL,'+

    'Sum( CASE WHEN b1.nvalue=4 THEN 1 ELSE 0 END ) K4_KOLVO,'+
    'Sum( CASE WHEN b1.nvalue=4 THEN CAST(b2.nvalue as SQL_NUMERIC) ELSE 0 END ) K4_PL_ALL,'+
    'Sum( CASE WHEN b1.nvalue=4 THEN CAST(b3.nvalue as SQL_NUMERIC) ELSE 0 END ) K4_PL_GIL,'+

    'Sum( CASE WHEN b1.nvalue>4 THEN 1 ELSE 0 END ) K5_KOLVO,'+
    'Sum( CASE WHEN b1.nvalue>4 THEN CAST(b2.nvalue as SQL_NUMERIC) ELSE 0 END ) K5_PL_ALL,'+
    'Sum( CASE WHEN b1.nvalue>4 THEN CAST(b3.nvalue as SQL_NUMERIC) ELSE 0 END ) K5_PL_GIL,'+

    'Sum( CASE WHEN IsNull(b1.nvalue,0)<=0 THEN 1 ELSE 0 END ) K0_KOLVO'+

    ' FROM ��������� d '+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' LEFT JOIN ������������������� b1 ON d.date_fiks=b1.date_fiks and d.id=b1.id and b1.pokaz='+QStr('KOL_KOMN')+
    ' LEFT JOIN ������������������� b2 ON d.date_fiks=b2.date_fiks and d.id=b2.id and b2.pokaz='+QStr('PLOSH_ALL')+
    ' LEFT JOIN ������������������� b3 ON d.date_fiks=b3.date_fiks and d.id=b3.id and b3.pokaz='+QStr('PLOSH_GIL')+
    ' WHERE d.date_fiks='+DateToSQL(GetDateFiksReport)+' and '+
    '    (d.candelete=false or d.candelete is null) and (s.not_stat is null or s.not_stat=false) '+
    '    and ((d.id in (select distinct(adres_id) from ������������ where own_house=true and date_fiks='+DateToSQL(GetDateFiksReport)+') and d.gilfond=0) or d.gilfond=1)'+
    ' GROUP BY 1,2';
  MemoWrite('report.sql',strSQL);
  q:=dbOpenSQL(strSQL,'');
  while not q.Eof do begin
    ds.Append;
    ds.Fld('BOK').AsString := q.Fld('NAME').AsString;
    if q.Fld('K0_KOLVO').AsInteger>0
      then ds.Fld('BOK').AsString:=ds.Fld('BOK').AsString+' ('+q.Fld('K0_KOLVO').AsString+')';
    n:=SeekValueSpr('�������������','ID',q.Fld('PUNKT').AsInteger,'TYPEPUNKT');
    ds.Fld('SSS1').AsString:=SeekValueSpr('TypePunkt','ID',n,'NAME');
    for i:=1 to 15 do begin
      ds.Fld('NUM'+IntToStr(i)).AsFloat := q.Fields.Fields[i+1].AsFloat;
    end;
    ds.Post;
    q.Next;
  end;
  dbClose(q);
  CloseMessage;
end; // stat_komnat

//------------------------------------------------------------------------------
function Stat_F1 : Boolean;
var
  ds,q : TDataSet;
  strSQL : String;
  i,n : Integer;
begin
  Result := true;
  OpenMessage('������ ����� "�������� ����" ','',10);
  ds := dbGetDataSet('fmMain.mtReport');
  dbZap(ds);
  dbSetIndex(ds,'BOK_KEY');
  strSQL := 'SELECT s.name, d.punkt,'+
    'Count(*) COUNT_PUNKT,'+
    'Sum( CAST(b3.nvalue as SQL_NUMERIC) ) PLOSH_ZDAN,'+
    'Sum( CAST(b1.nvalue as SQL_NUMERIC) ) PLOSH_ALL,'+
    'Sum( CAST(b2.nvalue as SQL_NUMERIC) ) PLOSH_GIL,'+
    'Sum( CASE WHEN b6.value='+QStr('1')+' THEN 1 ELSE 0 END ) VANNA,'+     //5
    'Sum( CASE WHEN b4.value='+QStr('1')+' THEN 1 ELSE 0 END ) VODOPROV,'+
    'Sum( CASE WHEN b5.value='+QStr('1')+' THEN 1 ELSE 0 END ) KANALIZ,'+
    'Sum( CASE WHEN b7.value='+QStr('1')+' THEN 1 ELSE 0 END ) CENT_OTOP,'+
    'Sum( CASE WHEN b8.value='+QStr('1')+' THEN 1 ELSE 0 END ) GOR_VODA,'+
    'Sum( CASE WHEN b9.value='+QStr('1')+' THEN 1 ELSE 0 END ) GAZ,'+          //10
    'Sum( CASE WHEN b10.value='+QStr('1')+' THEN 1 ELSE 0 END ) GID_GAZ,'+     //11
    'Sum( CASE WHEN b11.value='+QStr('1')+' THEN 1 ELSE 0 END ) EL_PLIT, '+    //12
    'Sum( CASE WHEN b4.value='+QStr('1')+' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_VODOPROV,'+
    'Sum( CASE WHEN b5.value='+QStr('1')+' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_KANALIZ,'+
    'Sum( CASE WHEN b7.value='+QStr('1')+' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_CENT_OTOP,'+
    'Sum( CASE WHEN b8.value='+QStr('1')+' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_GOR_VODA,'+
    'Sum( CASE WHEN b9.value='+QStr('1')+' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_GAZ,'+
    'Sum( CASE WHEN b10.value='+QStr('1')+' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_GID_GAZ,'+
    'Sum( CASE WHEN b11.value='+QStr('1')+' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_EL_PLIT,'+   //19
    'Sum( CASE WHEN b6.value='+QStr('1')+' THEN CAST(b1.nvalue as SQL_NUMERIC) ELSE 0 END ) PL_VANNA'+       //20
    ' FROM ��������� d '+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' LEFT JOIN ������������������� b1 ON d.date_fiks=b1.date_fiks and d.id=b1.id and b1.pokaz='+QStr('PLOSH_ALL')+
    ' LEFT JOIN ������������������� b2 ON d.date_fiks=b2.date_fiks and d.id=b2.id and b2.pokaz='+QStr('PLOSH_GIL')+
    ' LEFT JOIN ������������������� b3 ON d.date_fiks=b3.date_fiks and d.id=b3.id and b3.pokaz='+QStr('PLOSH_ZDAN')+
    ' LEFT JOIN ������������������� b4 ON d.date_fiks=b4.date_fiks and d.id=b4.id and b4.pokaz='+QStr('VODOPROV')+
    ' LEFT JOIN ������������������� b5 ON d.date_fiks=b5.date_fiks and d.id=b5.id and b5.pokaz='+QStr('KANALIZ')+
    ' LEFT JOIN ������������������� b6 ON d.date_fiks=b6.date_fiks and d.id=b6.id and b6.pokaz='+QStr('VANNA')+
    ' LEFT JOIN ������������������� b7 ON d.date_fiks=b7.date_fiks and d.id=b7.id and b7.pokaz='+QStr('CENT_OTOP')+
    ' LEFT JOIN ������������������� b8 ON d.date_fiks=b8.date_fiks and d.id=b8.id and b8.pokaz='+QStr('GOR_VODA')+
    ' LEFT JOIN ������������������� b9 ON d.date_fiks=b9.date_fiks and d.id=b9.id and b9.pokaz='+QStr('GAZ')+
    ' LEFT JOIN ������������������� b10 ON d.date_fiks=b10.date_fiks and d.id=b10.id and b10.pokaz='+QStr('GID_GAZ')+
    ' LEFT JOIN ������������������� b11 ON d.date_fiks=b11.date_fiks and d.id=b11.id and b11.pokaz='+QStr('EL_PLIT')+
    ' WHERE d.date_fiks='+DateToSQL(GetDateFiksReport)+' and '+
    '    (d.candelete=false or d.candelete is null) and (s.not_stat is null or s.not_stat=false) '+
    '    and ((d.id in (select distinct(adres_id) from ������������ where own_house=true and date_fiks='+DateToSQL(GetDateFiksReport)+') and d.gilfond=0) or d.gilfond=1)'+
    ' GROUP BY 1,2';
  MemoWrite('report.sql',strSQL);
  q:=dbOpenSQL(strSQL,'');
  if dbLastError()<>'' then begin
    ShowMessage(dbLastError());
  end;
  while not q.Eof do begin
    ds.Append;
    ds.Fld('BOK').AsString := q.Fld('NAME').AsString;
    n:=SeekValueSpr('�������������','ID',q.Fld('PUNKT').AsInteger,'TYPEPUNKT');
    ds.Fld('SSS1').AsString:=SeekValueSpr('TypePunkt','ID',n,'NAME');
    for i:=1 to 20 do begin
      ds.Fld('NUM'+IntToStr(i)).AsFloat := q.Fields.Fields[i+1].AsFloat;
    end;
    ds.Post;
    q.Next;
  end;
  dbClose(q);
  CloseMessage;
end; // stat_f1

//------------------------------------------------------------------------------
function Stat_F14 : Boolean;
var
  ds,q : TDataSet;
  strSQL : String;
  i : Integer;
begin
  Result := true;
  OpenMessage('������ ����� "���������� �14" ','',10);
  ds := dbGetDataSet('fmMain.mtReport');
  dbZap(ds);
  dbSetIndex(ds,'INT_KEY');
// Sum(CASE WHEN POKAZ='+QStr('POSEV')+' THEN CAST(Value as SQL_NUMERIC) ELSE 0 END)
  strSQL := 'SELECT '+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_ZERN')+' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM2,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_KART')+' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM3,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_OV')  +' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM4,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_OVZ') +' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM17,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_KORM')+' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM5,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_TRAV')+' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM6,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_SERNO')  +' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM7,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_KART')   +' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM8,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_OVOCHI') +' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM9,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_OVOCH_Z')+' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM10,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_KORNPL')+ ' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM11,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_PLOD')+   ' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM12,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_JAGOD')+  ' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM13,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('VSEGO') +    ' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM14,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('SOBST') +    ' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM15,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV') +    ' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM16 '+
    ' FROM ������������������� b '+
    ' LEFT JOIN ������������ l ON l.id=b.id and l.date_fiks=b.date_fiks'+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE b.date_fiks=' + DateToSQL(GetDateFiksReport)+' and b.typeobj='+strType_Lich+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)';
    end;
//  WriteDebug(strSQL);
  q:=dbOpenSQL(strSQL,'');
  ds.Append;
  for i:=2 to 15 do begin
    ds.Fld('NUM'+IntToStr(i)).AsFloat := q.Fld('NUM'+IntToStr(i)).AsFloat;
  end;
  ds.Fld('NUM17').AsFloat := q.Fld('NUM17').AsFloat;  // ����� � �������� ������

  ds.Fld('NUM1').AsFloat  := q.Fld('NUM16').AsFloat; // ����� ������
//  ds.Fld('NUM1').AsFloat := ds.Fld('NUM2').AsFloat+ds.Fld('NUM3').AsFloat+
//                            ds.Fld('NUM4').AsFloat+ds.Fld('NUM5').AsFloat+ds.Fld('NUM6').AsFloat;  
  ds.Post;
  dbClose(q);
  CloseMessage;
end; // stat_f14

//------------------------------------------------------------------------------
function Stat_F14_NP : Boolean;
var
  ds,q : TDataSet;
  strSQL : String;
  i : Integer;
begin
  Result := true;
  OpenMessage('������ ����� "���������� �14" �� ���. �������','',10);
  ds := dbGetDataSet('fmMain.mtReport');
  dbZap(ds);
  dbSetIndex(ds,'BOK_KEY');
  //---------- ���������� ���-� �� ���������� ������� --------------------
  strSQL := 'SELECT s.name, d.punkt punkt, COUNT(*) kolvo '+
    ' FROM ������������ l '+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE l.date_fiks=' + DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
  if not ParamAsBoolean('VKL_DELETE') then begin  //�� ���. ���������
    strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)'; 
  end;
  strSQL := strSQL + ' GROUP BY 1,2';
  q:=dbOpenSQL(strSQL,'');
  while not q.Eof do begin
    ds.Append;
    ds.Fld('INTKEY').AsInteger  := q.Fld('PUNKT').AsInteger;
    ds.Fld('BOK').AsString      := Trim(q.Fld('NAME').AsString);
    ds.Fld('NUM16').AsInteger   := q.Fld('KOLVO').AsInteger;
    ds.Post;
    q.Next;
  end;
  //---------- ������� ���. ������ �� ������� ��� ������� ������
  strSQL := 'SELECT s.id, s.name FROM ������������� s WHERE (s.not_stat is null or s.not_stat=false)';
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //���� ��� ���. ������ ������� � ������� ����������
    if not dbLocate(ds, 'INTKEY', [q.Fld('ID').AsInteger], '') then begin
      ds.Append;
      ds.Fld('INTKEY').AsInteger := q.Fld('ID').AsInteger;
      ds.Fld('BOK').AsString     := Trim(q.Fld('NAME').AsString);
      ds.Fld('NUM16').AsInteger  := 0;
      ds.Post;
    end;
    q.Next;
  end;

  //----------------------------------------------------------------------
  strSQL := 'SELECT d.punkt,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_ZERN')+' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM2,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_KART')+' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM3,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_OV')  +' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM4,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_OVZ') +' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM17,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_KORM')+' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM5,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV_TRAV')+' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM6,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_SERNO')  +' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM7,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_KART')   +' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM8,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_OVOCHI') +' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM9,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_OVOCH_Z')+' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM10,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_KORNPL')+ ' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM11,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_PLOD')+   ' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM12,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PR_JAGOD')+  ' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM13,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSEV') +    ' THEN cast(NValue as sql_numeric) ELSE 0 END) AS SQL_NUMERIC) NUM14 '+
    ' FROM ������������������� b'+
    ' LEFT JOIN ������������ l ON l.id=b.id and l.date_fiks=b.date_fiks'+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE b.date_fiks=' + DateToSQL(GetDateFiksReport)+' and b.typeobj='+strType_Lich+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null) ';
    end;
    strSQL := strSQL +
    ' GROUP BY 1';
//  WriteDebug(strSQL);
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //������ ���. �����
    if dbLocate(ds, 'INTKEY', [q.Fld('PUNKT').AsInteger], '') then begin
      ds.Edit;
      for i:=2 to 13 do begin
        ds.Fld('NUM'+IntToStr(i)).AsFloat := q.Fld('NUM'+IntToStr(i)).AsFloat;
      end;
      ds.Fld('NUM17').AsFloat := q.Fld('NUM17').AsFloat;  // ������ ������ � �������� ������
      ds.Fld('NUM1').AsFloat  := q.Fld('NUM14').AsFloat;
//      ds.Fld('NUM1').AsFloat := ds.Fld('NUM2').AsFloat+ds.Fld('NUM3').AsFloat+
//                            ds.Fld('NUM4').AsFloat+ds.Fld('NUM5').AsFloat+ds.Fld('NUM6').AsFloat;  
      // ������ � �������� � ���������
      for i:=7 to 13 do begin
        ds.Fld('NUM'+IntToStr(i)).AsFloat := ds.Fld('NUM'+IntToStr(i)).AsFloat;
      end;
      ds.Post;
    end;
    q.Next;
  end;
  dbClose(q);
  CloseMessage();
end;  // stat_f14_np


//=============================================================

//  ����� �� ���. �������
//------------------------------------------------------------------------------
function Stat_ZM_NP : Boolean;
var
  ds,q : TDataSet;
  strSQL : String;
  i : Integer;
begin
  Result := true;
  OpenMessage('������ ����� "�����" �� ���. �������','',10);
  ds := dbGetDataSet('fmMain.mtReport');
  dbZap(ds);
  dbSetIndex(ds,'BOK_KEY');
  //---------- ���������� ���-� �� ���������� ������� --------------------
  strSQL := 'SELECT s.name, d.punkt punkt, COUNT(*) kolvo '+
    ' FROM ������������ l '+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE l.date_fiks=' + DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
  if not ParamAsBoolean('VKL_DELETE') then begin  //�� ���. ���������
    strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)'; 
  end;
  strSQL := strSQL + ' GROUP BY 1,2';
  q:=dbOpenSQL(strSQL,'');
  while not q.Eof do begin
    ds.Append;
    ds.Fld('INTKEY').AsInteger  := q.Fld('PUNKT').AsInteger;
    ds.Fld('BOK').AsString      := Trim(q.Fld('NAME').AsString);
    ds.Fld('NUM16').AsInteger   := q.Fld('KOLVO').AsInteger;
    ds.Post;
    q.Next;
  end;
  //---------- ������� ���. ������ �� ������� ��� ������� ������
  strSQL := 'SELECT s.id, s.name FROM ������������� s WHERE (s.not_stat is null or s.not_stat=false)';
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //���� ��� ���. ������ ������� � ������� ����������
    if not dbLocate(ds, 'INTKEY', [q.Fld('ID').AsInteger], '') then begin
      ds.Append;
      ds.Fld('INTKEY').AsInteger := q.Fld('ID').AsInteger;
      ds.Fld('BOK').AsString     := Trim(q.Fld('NAME').AsString);
      ds.Fld('NUM16').AsInteger  := 0;
      ds.Post;
    end;
    q.Next;
  end;
  //----------------------------------------------------------------------
  strSQL := 'SELECT d.punkt,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('VSEGO')+' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM1,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('SOBST')+' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM2,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('POSTR')  +' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM3,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PRIUSAD') +' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM4,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('SOTKI')+' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM5,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('SOTKIS')+' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM6,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('ARENDA')+' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM7,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('OGOROD')  +' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM8,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('PNV')+' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM9,'+
    'CAST( Sum( CASE WHEN POKAZ='+QStr('LPX')  +' THEN '+PokazZeml+' ELSE 0 END) AS SQL_NUMERIC) NUM10'+
    ' FROM ������������������� b'+
    ' LEFT JOIN ������������ l ON l.id=b.id and l.date_fiks=b.date_fiks'+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE b.date_fiks=' + DateToSQL(GetDateFiksReport)+' and b.typeobj='+strType_Lich+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null) ';
    end;
    strSQL := strSQL +
    ' GROUP BY 1';
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //������ ���. �����
    if dbLocate(ds, 'INTKEY', [q.Fld('PUNKT').AsInteger], '') then begin
      ds.Edit;
      for i:=1 to 10 do begin
        ds.Fld('NUM'+IntToStr(i)).AsFloat := q.Fld('NUM'+IntToStr(i)).AsFloat;
      end;
      ds.Post;
    end;
    q.Next;
  end;
  //----�� �������� ����� -------------------------------------------------------
  strSQL := 'SELECT d.punkt,'+
    ' IFNULL(Sum(PLOSH_UCH),0) KOLVO'+
    ' FROM ��������� d'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE d.date_fiks=' + DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
    ' GROUP BY 1';
//  writedebug(strSQL);
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //������ ���. �����
    if dbLocate(ds, 'INTKEY', [q.Fld('PUNKT').AsInteger], '') then begin
      ds.Edit;
      ds.Fld('NUM11').AsFloat := q.Fld('KOLVO').AsFloat;
      ds.Post;
    end;
    q.Next;
  end;
  //----�� �������� ����� ��� ������� ������ -------------------------------------------------------
  strSQL := 'SELECT d.punkt,'+
    ' IFNULL(Sum(PLOSH_UCH),0) KOLVO'+
    ' FROM ��������� d'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE d.date_fiks=' + DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) and '+
    '    not exists (select adres_id from ������������ l where l.date_fiks=d.date_fiks and l.adres_id=d.id) '+
    ' GROUP BY 1';
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //������ ���. �����
    if dbLocate(ds, 'INTKEY', [q.Fld('PUNKT').AsInteger], '') then begin
      ds.Edit;
      ds.Fld('NUM12').AsFloat := q.Fld('KOLVO').AsFloat;
      ds.Post;
    end;
    q.Next;
  end;
  dbClose(q);
  CloseMessage();
end;  // ������ �� ���. �������


//=============================================================


//------------------------------------------------------------------------------
function Stat_1sx : Boolean;
var
  ds,q : TDataSet;
  strSQL : String;
  i : Integer;
begin
  Result := true;
  OpenMessage('������ ����� "���������� 1-�� (�����)" ','',10);
  ds := dbGetDataSet('fmMain.mtReport');
  dbZap(ds);
  dbSetIndex(ds,'INT_KEY');
  strSQL := 'SELECT '+
    'Sum( CASE WHEN POKAZ=''BIG_ENIMAL'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM1,'+
    'Sum( CASE WHEN POKAZ=''KOROVA'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM2,'+
    'Sum( CASE WHEN POKAZ=''TELKI1'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM3,'+
    'Sum( CASE WHEN POKAZ=''SVINI''  THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM4,'+
    'Sum( CASE WHEN POKAZ='+QStr('OVCI')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM5,'+
    'Sum( CASE WHEN POKAZ='+QStr('KOZI')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM6,'+
    'Sum( CASE WHEN POKAZ='+QStr('KOZIMAT')   +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM7,'+
    'Sum( CASE WHEN POKAZ='+QStr('LOSHADI')   +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM8,'+
    'Sum( CASE WHEN POKAZ='+QStr('PTICA')     +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM9,'+
    'Sum( CASE WHEN POKAZ='+QStr('VSEGO')     +' THEN '+PokazZeml+' ELSE 0 END) NUM10,'+
    'Sum( CASE WHEN POKAZ='+QStr('KROL')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM11,'+
    'Sum( CASE WHEN POKAZ='+QStr('PCHELI')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM12'+
    ' FROM ������������������� b'+
    ' LEFT JOIN ������������ l ON l.id=b.id and l.date_fiks=b.date_fiks'+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE b.date_fiks=' + DateToSQL(GetDateFiksReport)+' and b.typeobj='+strType_Lich+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
//    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)';
//    end;
//  WriteDebug(strSQL);
  q:=dbOpenSQL(strSQL,'');
  ds.Append;
  for i:=1 to 12 do begin
    ds.Fld('NUM'+IntToStr(i)).AsFloat := q.Fld('NUM'+IntToStr(i)).AsFloat;
  end;

  //---------- ���������� ���-�
  strSQL := 'SELECT COUNT(*) kolvo FROM ������������ l '+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    'WHERE l.date_fiks=' + DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
  strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)'; //������� �� ���. ���������

  dbChangeSQL(q, strSQL, true);
  if not q.Eof then begin
    ds.Fld('NUM16').AsInteger := q.Fld('KOLVO').AsInteger;
  end;

  strSQL := 'SELECT '+
   'Sum( CASE WHEN b.value is null THEN 1 ELSE 0 END) ALL_ENIMAL '+
   ' FROM ������������ l '+
   ' LEFT JOIN ������������������� b ON l.date_fiks=b.date_fiks and l.id=b.id '+
   ' and (b.pokaz='+QStr('BIG_ENIMAL')+' or b.pokaz='+QStr('KOROVA')+' or b.pokaz='+QStr('SVINI')+' or '+
   '    b.pokaz='+QStr('OVCI')+' or b.pokaz='+QStr('KOZI')+' or b.pokaz='+QStr('LOSHADI')+') '+
   ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
   ' LEFT JOIN ������������� s ON s.id=d.punkt '+
   ' WHERE l.date_fiks='+DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
//    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)';
//    end;
  dbChangeSQL(q, strSQL, true);
  ds.Fld('NUM17').AsInteger := q.Fld('ALL_ENIMAL').AsInteger;

  strSQL := 'SELECT '+
   'Sum( CASE WHEN b1.value is null THEN 1 ELSE 0 END) BIG_ENIMAL, '+
   'Sum( CASE WHEN b2.value is null THEN 1 ELSE 0 END) KOROVA, '+
   'Sum( CASE WHEN b3.value is null THEN 1 ELSE 0 END) SVINI, '+
   'Sum( CASE WHEN b4.value is null THEN 1 ELSE 0 END) OVCI, '+
   'Sum( CASE WHEN b5.value is null THEN 1 ELSE 0 END) KOZI '+
   ' FROM ������������ l '+
   ' LEFT JOIN ������������������� b1 ON l.date_fiks=b1.date_fiks and l.id=b1.id and b1.pokaz='+QStr('BIG_ENIMAL')+ 
   ' LEFT JOIN ������������������� b2 ON l.date_fiks=b2.date_fiks and l.id=b2.id and b2.pokaz='+QStr('KOROVA')+
   ' LEFT JOIN ������������������� b3 ON l.date_fiks=b3.date_fiks and l.id=b3.id and b3.pokaz='+QStr('SVINI')+
   ' LEFT JOIN ������������������� b4 ON l.date_fiks=b4.date_fiks and l.id=b4.id and b4.pokaz='+QStr('OVCI')+
   ' LEFT JOIN ������������������� b5 ON l.date_fiks=b5.date_fiks and l.id=b5.id and b5.pokaz='+QStr('KOZI')+
   ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
   ' LEFT JOIN ������������� s ON s.id=d.punkt '+
   ' WHERE l.date_fiks='+DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
   ' and (l.not_stat is null or l.not_stat=false) ';
//    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)';
//    end;
  dbChangeSQL(q, strSQL, true);
  ds.Fld('NUM18').AsInteger := q.Fld('BIG_ENIMAL').AsInteger;
  ds.Fld('NUM19').AsInteger := q.Fld('KOROVA').AsInteger;
  ds.Fld('NUM20').AsInteger := q.Fld('SVINI').AsInteger;
  ds.Fld('NUM21').AsInteger := q.Fld('OVCI').AsInteger;
  ds.Fld('NUM22').AsInteger := q.Fld('KOZI').AsInteger;
  ds.Post;
  dbClose(q);
  CloseMessage();
//  showmessage(IntToStr(i2-i1)+#13+IntToStr(i3-i2)+#13+IntToStr(i4-i3)+#13+
//        IntToStr(i5-i4)+#13+IntToStr(i6-i5)+#13+IntToStr(i7-i6)+#13+
//        IntToStr(i8-i7)+#13+IntToStr(i9-i8));
end;  // stat_f6

//------------------------------------------------------------------------------
function Stat_F6 : Boolean;
var
  ds,q : TDataSet;
  strSQL : String;
  i : Integer;
begin
  Result := true;
  OpenMessage('������ ����� "���������� 1-��" ','',10);
  ds := dbGetDataSet('fmMain.mtReport');
  dbZap(ds);
  dbSetIndex(ds,'INT_KEY');
  strSQL := 'SELECT '+
    'Sum( CASE WHEN POKAZ=''BIG_ENIMAL'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM1,'+
    'Sum( CASE WHEN POKAZ=''KOROVA'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM2,'+
    'Sum( CASE WHEN POKAZ=''TELKI1'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM3,'+
    'Sum( CASE WHEN POKAZ=''SVINI''  THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM4,'+
    'Sum( CASE WHEN POKAZ='+QStr('OVCI')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM5,'+
    'Sum( CASE WHEN POKAZ='+QStr('KOZI')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM6,'+
    'Sum( CASE WHEN POKAZ='+QStr('KOZIMAT')   +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM7,'+
    'Sum( CASE WHEN POKAZ='+QStr('LOSHADI')   +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM8,'+
    'Sum( CASE WHEN POKAZ='+QStr('PTICA')     +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM9,'+
    'Sum( CASE WHEN POKAZ='+QStr('KROL')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM10,'+
    'Sum( CASE WHEN POKAZ='+QStr('PCHELI')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM11,'+
    'Sum( CASE WHEN POKAZ='+QStr('NUTRII')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM12,'+
    'Sum( CASE WHEN POKAZ='+QStr('PESCI')     +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM13,'+
    'Sum( CASE WHEN POKAZ='+QStr('FREDKI')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM14,'+
    'Sum( CASE WHEN Substring(POKAZ,1,4)='+QStr('PUSH')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM15,'+
    'Sum( CASE WHEN POKAZ='+QStr('MEAT')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM23,'+
    'Sum( CASE WHEN POKAZ='+QStr('K_MEAT')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM24,'+
    'Sum( CASE WHEN POKAZ='+QStr('S_MEAT')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM25,'+
    'Sum( CASE WHEN POKAZ='+QStr('P_MEAT')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM26,'+
    'Sum( CASE WHEN POKAZ='+QStr('MOLOKO')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM27,'+
    'Sum( CASE WHEN POKAZ='+QStr('KOR_MOLOKO')+' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM28,'+
    'Sum( CASE WHEN POKAZ='+QStr('KOZ_MOLOKO')+' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM29,'+
    'Sum( CASE WHEN POKAZ='+QStr('JAICA')+' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM30,'+
    'Sum( CASE WHEN POKAZ='+QStr('MED')+' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM31'+
    ' FROM ������������������� b'+
    ' LEFT JOIN ������������ l ON l.id=b.id and l.date_fiks=b.date_fiks'+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE b.date_fiks=' + DateToSQL(GetDateFiksReport)+' and b.typeobj='+strType_Lich+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
//    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)';
//    end;
//  WriteDebug(strSQL);
  q:=dbOpenSQL(strSQL,'');
  ds.Append;
  for i:=1 to 15 do begin
    ds.Fld('NUM'+IntToStr(i)).AsFloat := q.Fld('NUM'+IntToStr(i)).AsFloat;
  end;
  for i:=23 to 31 do begin
    ds.Fld('NUM'+IntToStr(i)).AsFloat := q.Fld('NUM'+IntToStr(i)).AsFloat;
  end;
//  if (ds.Fld('NUM24').AsFloat<>0) or (ds.Fld('NUM25').AsFloat<>0) 
//     or (ds.Fld('NUM26').AsFloat<>0) then
  ds.Fld('NUM23').AsFloat := ds.Fld('NUM24').AsFloat+ds.Fld('NUM25').AsFloat+
                             ds.Fld('NUM26').AsFloat;
  if (ds.Fld('NUM28').AsFloat<>0) or (ds.Fld('NUM29').AsFloat<>0) then
    ds.Fld('NUM27').AsFloat := ds.Fld('NUM28').AsFloat+ds.Fld('NUM29').AsFloat;

  //---------- ���������� ���-�
  strSQL := 'SELECT COUNT(*) kolvo FROM ������������ l '+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    'WHERE l.date_fiks=' + DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';

  strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)'; //������� �� ���. ���������

  dbChangeSQL(q, strSQL, true);
  if not q.Eof then begin
    ds.Fld('NUM16').AsInteger := q.Fld('KOLVO').AsInteger;
  end;

  strSQL := 'SELECT '+
   'Sum( CASE WHEN b.value is null THEN 1 ELSE 0 END) ALL_ENIMAL '+
   ' FROM ������������ l '+
   ' LEFT JOIN ������������������� b ON l.date_fiks=b.date_fiks and l.id=b.id '+
   ' and (b.pokaz='+QStr('BIG_ENIMAL')+' or b.pokaz='+QStr('KOROVA')+' or b.pokaz='+QStr('SVINI')+' or '+
   '    b.pokaz='+QStr('OVCI')+' or b.pokaz='+QStr('KOZI')+' or b.pokaz='+QStr('LOSHADI')+') '+
   ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
   ' LEFT JOIN ������������� s ON s.id=d.punkt '+
   ' WHERE l.date_fiks='+DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
   ' and (l.not_stat is null or l.not_stat=false) ';
//    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)';
//    end;
  dbChangeSQL(q, strSQL, true);
  ds.Fld('NUM17').AsInteger := q.Fld('ALL_ENIMAL').AsInteger;

  strSQL := 'SELECT '+
   'Sum( CASE WHEN b1.value is null THEN 1 ELSE 0 END) BIG_ENIMAL, '+
   'Sum( CASE WHEN b2.value is null THEN 1 ELSE 0 END) KOROVA, '+
   'Sum( CASE WHEN b3.value is null THEN 1 ELSE 0 END) SVINI, '+
   'Sum( CASE WHEN b4.value is null THEN 1 ELSE 0 END) OVCI, '+
   'Sum( CASE WHEN b5.value is null THEN 1 ELSE 0 END) KOZI '+
   ' FROM ������������ l '+
   ' LEFT JOIN ������������������� b1 ON l.date_fiks=b1.date_fiks and l.id=b1.id and b1.pokaz='+QStr('BIG_ENIMAL')+ 
   ' LEFT JOIN ������������������� b2 ON l.date_fiks=b2.date_fiks and l.id=b2.id and b2.pokaz='+QStr('KOROVA')+
   ' LEFT JOIN ������������������� b3 ON l.date_fiks=b3.date_fiks and l.id=b3.id and b3.pokaz='+QStr('SVINI')+
   ' LEFT JOIN ������������������� b4 ON l.date_fiks=b4.date_fiks and l.id=b4.id and b4.pokaz='+QStr('OVCI')+
   ' LEFT JOIN ������������������� b5 ON l.date_fiks=b5.date_fiks and l.id=b5.id and b5.pokaz='+QStr('KOZI')+
   ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
   ' LEFT JOIN ������������� s ON s.id=d.punkt '+
   ' WHERE l.date_fiks='+DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
   ' and (l.not_stat is null or l.not_stat=false) ';
//    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)';
//    end;
  dbChangeSQL(q, strSQL, true);
  ds.Fld('NUM18').AsInteger := q.Fld('BIG_ENIMAL').AsInteger;
  ds.Fld('NUM19').AsInteger := q.Fld('KOROVA').AsInteger;
  ds.Fld('NUM20').AsInteger := q.Fld('SVINI').AsInteger;
  ds.Fld('NUM21').AsInteger := q.Fld('OVCI').AsInteger;
  ds.Fld('NUM22').AsInteger := q.Fld('KOZI').AsInteger;
  ds.Post;
  dbClose(q);
  CloseMessage();
//  showmessage(IntToStr(i2-i1)+#13+IntToStr(i3-i2)+#13+IntToStr(i4-i3)+#13+
//        IntToStr(i5-i4)+#13+IntToStr(i6-i5)+#13+IntToStr(i7-i6)+#13+
//        IntToStr(i8-i7)+#13+IntToStr(i9-i8));
end;  // stat_f6

//------------------------------------------------------------------------------
function Stat_F6_NP : Boolean;
var
  ds,q : TDataSet;
  strSQL : String;
  i : Integer;
begin
  Result := true;
  OpenMessage('������ ����� "���������� �6" �� ���. �������','',10);
  ds := dbGetDataSet('fmMain.mtReport');
  dbZap(ds);
  dbSetIndex(ds,'BOK_KEY');
  //---------- ���������� ���-� �� ���������� ������� --------------------
  strSQL := 'SELECT s.name, d.punkt punkt, COUNT(*) kolvo '+
    ' FROM ������������ l '+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE l.date_fiks=' + DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
  strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)'; //������� �� ���. ���������
  strSQL := strSQL + ' GROUP BY 1,2';
  q:=dbOpenSQL(strSQL,'');
  while not q.Eof do begin
    ds.Append;
    ds.Fld('INTKEY').AsInteger  := q.Fld('PUNKT').AsInteger;
    ds.Fld('BOK').AsString      := Trim(q.Fld('NAME').Asstring);
    ds.Fld('NUM16').AsInteger   := q.Fld('KOLVO').AsInteger;
    ds.Post;
    q.Next;
  end;
  //---------- ������� ���. ������ �� ������� ��� ������� ������
  strSQL := 'SELECT s.id, s.name FROM ������������� s WHERE (s.not_stat is null or s.not_stat=false)';
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //���� ��� ���. ������ ������� � ������� ����������
    if not dbLocate(ds, 'INTKEY', [q.Fld('ID').AsInteger], '') then begin
      ds.Append;
      ds.Fld('INTKEY').AsInteger := q.Fld('ID').AsInteger;
      ds.Fld('BOK').AsString     := Trim(q.Fld('NAME').Asstring);
      ds.Fld('NUM16').AsInteger  := 0;
      ds.Post;
    end;
    q.Next;
  end;
  //----------------------------------------------------------------------
  strSQL := 'SELECT d.punkt,'+
    'Sum( CASE WHEN POKAZ=''BIG_ENIMAL'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM1,'+
    'Sum( CASE WHEN POKAZ=''KOROVA'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM2,'+
    'Sum( CASE WHEN POKAZ=''TELKI1'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM3,'+
    'Sum( CASE WHEN POKAZ=''SVINI''  THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM4,'+
    'Sum( CASE WHEN POKAZ='+QStr('OVCI')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM5,'+
    'Sum( CASE WHEN POKAZ='+QStr('KOZI')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM6,'+
    'Sum( CASE WHEN POKAZ='+QStr('KOZIMAT')   +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM7,'+
    'Sum( CASE WHEN POKAZ='+QStr('LOSHADI')   +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM8,'+
    'Sum( CASE WHEN POKAZ='+QStr('PTICA')     +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM9,'+
    'Sum( CASE WHEN POKAZ='+QStr('KROL')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM10,'+
    'Sum( CASE WHEN POKAZ='+QStr('PCHELI')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM11,'+
    'Sum( CASE WHEN POKAZ='+QStr('NUTRII')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM12,'+
    'Sum( CASE WHEN POKAZ='+QStr('PESCI')     +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM13,'+
    'Sum( CASE WHEN POKAZ='+QStr('FREDKI')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM14,'+
    'Sum( CASE WHEN Substring(POKAZ,1,4)='+QStr('PUSH')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM15,'+
    'Sum( CASE WHEN POKAZ='+QStr('MEAT')      +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM23,'+
    'Sum( CASE WHEN POKAZ='+QStr('K_MEAT')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM24,'+
    'Sum( CASE WHEN POKAZ='+QStr('S_MEAT')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM25,'+
    'Sum( CASE WHEN POKAZ='+QStr('P_MEAT')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM26,'+
    'Sum( CASE WHEN POKAZ='+QStr('MOLOKO')    +' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM27,'+
    'Sum( CASE WHEN POKAZ='+QStr('KOR_MOLOKO')+' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM28,'+
    'Sum( CASE WHEN POKAZ='+QStr('KOZ_MOLOKO')+' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM29,'+
    'Sum( CASE WHEN POKAZ='+QStr('JAICA')+' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM30,'+
    'Sum( CASE WHEN POKAZ='+QStr('MED')+' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM31'+
    ' FROM ������������������� b'+
    ' LEFT JOIN ������������ l ON l.id=b.id and l.date_fiks=b.date_fiks'+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE b.date_fiks=' + DateToSQL(GetDateFiksReport)+' and b.typeobj='+strType_Lich+' and (s.not_stat is null or s.not_stat=false) '+
    ' and (l.not_stat is null or l.not_stat=false) ';
//    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null) ';
//    end;
    strSQL := strSQL +
    ' GROUP BY 1';
//  WriteDebug(strSQL);
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //������ ���. �����
    if dbLocate(ds, 'INTKEY', [q.Fld('PUNKT').AsInteger], '') then begin
      ds.Edit;
      for i:=1 to 15 do begin
        ds.Fld('NUM'+IntToStr(i)).AsFloat := q.Fld('NUM'+IntToStr(i)).AsFloat;
      end;
      for i:=23 to 31 do begin
        ds.Fld('NUM'+IntToStr(i)).AsFloat := q.Fld('NUM'+IntToStr(i)).AsFloat;
      end;
      ds.Fld('NUM23').AsFloat := ds.Fld('NUM24').AsFloat+ds.Fld('NUM25').AsFloat+
                             ds.Fld('NUM26').AsFloat;
      if (ds.Fld('NUM28').AsFloat<>0) or (ds.Fld('NUM29').AsFloat<>0) then
        ds.Fld('NUM27').AsFloat := ds.Fld('NUM28').AsFloat+ds.Fld('NUM29').AsFloat;

      ds.Post;
    end;
    q.Next;
  end;

  strSQL := 'SELECT d.punkt, '+
   'Sum( CASE WHEN b.value is null THEN 1 ELSE 0 END) ALL_ENIMAL '+
   ' FROM ������������ l '+
   ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks '+
   ' LEFT JOIN ������������� s ON s.id=d.punkt '+
   ' LEFT JOIN ������������������� b ON l.date_fiks=b.date_fiks and l.id=b.id '+
   ' and (b.pokaz='+QStr('BIG_ENIMAL')+' or b.pokaz='+QStr('KOROVA')+' or b.pokaz='+QStr('SVINI')+' or '+
   '    b.pokaz='+QStr('OVCI')+' or b.pokaz='+QStr('KOZI')+' or b.pokaz='+QStr('LOSHADI')+') '+
   ' WHERE l.date_fiks='+DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
   ' and (l.not_stat is null or l.not_stat=false) ';
//    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null) ';
//    end;
   strSQL := strSQL +
   ' GROUP BY 1';
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //������ ���. �����
    if dbLocate(ds, 'INTKEY', [q.Fld('PUNKT').AsInteger], '') then begin
      ds.Edit;
      ds.Fld('NUM17').AsInteger := q.Fld('ALL_ENIMAL').AsInteger;
      ds.Post;
    end;
    q.Next;
  end;

  strSQL := 'SELECT d.punkt, '+
   'Sum( CASE WHEN b1.value is null THEN 1 ELSE 0 END) BIG_ENIMAL, '+
   'Sum( CASE WHEN b2.value is null THEN 1 ELSE 0 END) KOROVA, '+
   'Sum( CASE WHEN b3.value is null THEN 1 ELSE 0 END) SVINI, '+
   'Sum( CASE WHEN b4.value is null THEN 1 ELSE 0 END) OVCI, '+
   'Sum( CASE WHEN b5.value is null THEN 1 ELSE 0 END) KOZI '+
   ' FROM ������������ l '+
   ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks '+
   ' LEFT JOIN ������������� s ON s.id=d.punkt '+
   ' LEFT JOIN ������������������� b1 ON l.date_fiks=b1.date_fiks and l.id=b1.id and b1.pokaz='+QStr('BIG_ENIMAL')+ 
   ' LEFT JOIN ������������������� b2 ON l.date_fiks=b2.date_fiks and l.id=b2.id and b2.pokaz='+QStr('KOROVA')+
   ' LEFT JOIN ������������������� b3 ON l.date_fiks=b3.date_fiks and l.id=b3.id and b3.pokaz='+QStr('SVINI')+
   ' LEFT JOIN ������������������� b4 ON l.date_fiks=b4.date_fiks and l.id=b4.id and b4.pokaz='+QStr('OVCI')+
   ' LEFT JOIN ������������������� b5 ON l.date_fiks=b5.date_fiks and l.id=b5.id and b5.pokaz='+QStr('KOZI')+
   ' WHERE l.date_fiks='+DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) '+
   ' and (l.not_stat is null or l.not_stat=false) ';
//    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null) ';
//    end;
   strSQL := strSQL + 
   ' GROUP BY 1';
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //������ ���. �����
    if dbLocate(ds, 'INTKEY', [q.Fld('PUNKT').AsInteger], '') then begin
      ds.Edit;
      ds.Fld('NUM18').AsInteger := q.Fld('BIG_ENIMAL').AsInteger;
      ds.Fld('NUM19').AsInteger := q.Fld('KOROVA').AsInteger;
      ds.Fld('NUM20').AsInteger := q.Fld('SVINI').AsInteger;
      ds.Fld('NUM21').AsInteger := q.Fld('OVCI').AsInteger;
      ds.Fld('NUM22').AsInteger := q.Fld('KOZI').AsInteger;
      ds.Post;
    end;
    q.Next;
  end;
  dbClose(q);
  CloseMessage();
end;  // stat_f6

//------------------------------------------------------------------------------
function KoshkiSobaki_NP : Boolean;
var
  ds,q : TDataSet;
  strSQL : String;
  i : Integer;
begin
  Result := true;
  OpenMessage('������ ����� �� ���. �������','',10);
  ds := dbGetDataSet('fmMain.mtReport');
  dbZap(ds);
  dbSetIndex(ds,'BOK_KEY');
  //---------- ���������� ���-� �� ���������� ������� --------------------
  strSQL := 'SELECT s.name, d.punkt punkt, COUNT(*) kolvo '+
    ' FROM ������������ l '+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE l.date_fiks=' + DateToSQL(GetDateFiksReport)+' and (s.not_stat is null or s.not_stat=false) ';
  strSQL := strSQL + ' and (l.candelete=false or l.candelete is null)'; //������� �� ���. ���������
  strSQL := strSQL + ' GROUP BY 1,2';
  q:=dbOpenSQL(strSQL,'');
  while not q.Eof do begin
    ds.Append;
    ds.Fld('INTKEY').AsInteger  := q.Fld('PUNKT').AsInteger;
    ds.Fld('BOK').AsString      := Trim(q.Fld('NAME').Asstring);
    ds.Fld('NUM16').AsInteger   := q.Fld('KOLVO').AsInteger;
    ds.Fld('NUM1').AsInteger   := 0;
    ds.Fld('NUM2').AsInteger   := 0;
    ds.Post;
    q.Next;
  end;
  //----------------------------------------------------------------------
  strSQL := 'SELECT d.punkt,'+
    'Sum( CASE WHEN POKAZ=''KOSHKI'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM1,'+
    'Sum( CASE WHEN POKAZ=''SOBAKI'' THEN CAST(NValue as SQL_NUMERIC) ELSE 0 END) NUM2'+
    ' FROM ������������������� b'+
    ' LEFT JOIN ������������ l ON l.id=b.id and l.date_fiks=b.date_fiks'+
    ' LEFT JOIN ��������� d ON l.adres_id=d.id and l.date_fiks=d.date_fiks'+
    ' LEFT JOIN ������������� s ON s.id=d.punkt '+
    ' WHERE b.date_fiks=' + DateToSQL(GetDateFiksReport)+' and b.typeobj='+strType_Lich+' and (s.not_stat is null or s.not_stat=false) ';
//    if not ParamAsBoolean('VKL_DELETE') then begin
      strSQL := strSQL + ' and (l.candelete=false or l.candelete is null) ';
//    end;
    strSQL := strSQL +
    ' GROUP BY 1';
//  WriteDebug(strSQL);
  dbChangeSQL(q, strSQL, true);
  while not q.Eof do begin
    //������ ���. �����
    if dbLocate(ds, 'INTKEY', [q.Fld('PUNKT').AsInteger], '') then begin
      ds.Edit;
      ds.Fld('NUM1').AsInteger := q.Fld('NUM1').AsInteger;
      ds.Fld('NUM2').AsInteger := q.Fld('NUM2').AsInteger;
      ds.Post;
    end;
    q.Next;
  end;
  dbClose(q);
  CloseMessage();
end;  // KoshkiSobaki_NP


//------------------------------------------------------------------------------
// ������ ��� ���������� 12 � ����. ���. �������
// ����� � ��������������� ����������� ����� ������������ ���������
function Stat_F24_ZAGS : Boolean;
var
  f : TfmParamQuest;
  ds,q : TDataSet;
  strSQL,strGod,strGrag,strAddWhere : String;
  i : Integer;
  nGod : Integer;
  lRiap:Boolean;
begin
  strGrag := ParamAsString('GOSUD');
  if strGrag='' then strGrag:=IntToStr(defGrag);
  f := TfmParamQuest.Create(nil);
  f.Caption := '������� ���������';
  i := StrToInt(FormatDateTime('YYYY', GlobalTask.CurrentDate))-1;
  f.AddParamEx(i, '�� ����� ���'    , 'YEAR'    ,'TYPE=LIST~DESC=KEY_YEARS');
  f.AddParamEx(Now, '���� ������������' , 'DATEF' ,'TYPE=DATE');
//  f.AddParamEx(0, '���������� � �������� ��������� (�����)', 'ZAK_ALL','');
//  f.AddParamEx(0, '�� ������ � ���������', 'ZAK_OTK','');
  f.AddParamEx(0, '������������ ������� �����', 'ANULIR','');
  f.AddParamEx(0, '������� ������', 'SVADEB_Z','');
  f.AddParamEx(0, '���������� ������', 'SVADEB_S','');
  f.AddParamEx(0, '������ ������', 'SVADEB_D','');
  f.AddParamEx(0, '�������� ���������� (0-������)', 'POSHLINA','');
  f.AddParamEx(0, '�������������� ������ (0-������)', 'PLAT','');
  if IdProg='ZAGS' then begin
    f.AddParamEx(true, '�\� ���� ������� ����', 'ALL','');
    f.AddParamEx(false, '������������ ���� ��� ������� ����', 'RIAP','');
  end;
  f.AddButtons('���������~�����',0);
  i := f.ShowQuest;
  nGod := f.GetValue('YEAR','N');
  strAddWhere:='';
  lRiap:=false;
  if i=1 then begin
    ds := FindReportTable('ZAGS');
    dbZap(ds);
    ds.Append;
    if IdProg='ZAGS' then begin
      if f.GetValue('ALL','L')=false
        then strAddWhere:=' and ID_ZAGS='+GlobalTask.ParamAsString('ID');
      lRiap:=f.GetValue('RIAP','L'); 
    end;
    ds.Fld('NUM19').AsInteger:=0;//f.GetValue('ZAK_ALL','N');   ���������� �����
    ds.Fld('NUM20').AsInteger:=0;//f.GetValue('ZAK_OTK','N');   �����
    ds.Fld('NUM21').AsInteger:=f.GetValue('ANULIR','N');
    ds.Fld('NUM22').AsInteger:=f.GetValue('SVADEB_Z','N');
    ds.Fld('NUM23').AsInteger:=f.GetValue('SVADEB_S','N');
    ds.Fld('NUM32').AsInteger:=f.GetValue('SVADEB_D','N');
    ds.Fld('NUM24').AsInteger:=f.GetValue('POSHLINA','N');
    ds.Fld('NUM25').AsInteger:=f.GetValue('PLAT','N');
    ds.Fld('DATE_FORM').AsDateTime:=f.GetValue('DATEF','D');
  end;
  f.Free;
  Result := false;
  if i = 1 then begin
    Result := true;
    strGod := IntToStr(nGod);
    GlobalTask.SetWorkParam('GOD',strGod);
    OpenMessage('������ ����� "� ��������������� ����������� ����� ����. ����."','',10);
    //--------------- ��������
    strSQL := 'SELECT Count(*) allr, Sum(CASE WHEN GIVOROGD=FALSE THEN 1 ELSE 0 End) mr '+
                ' FROM ������������ ar WHERE Year(datez)='+strGod + ' and vosstan=false'+strAddWhere;
    q:=dbOpenSQL(strSQL,'');
    ds.Fld('NUM1').AsInteger  := q.Fld('ALLR').AsInteger;
    ds.Fld('NUM2').AsInteger  := q.Fld('MR').AsInteger;
    //--------------- ������
    strSQL := 'SELECT Count(*) alls, '+
      ' Sum( CASE WHEN ( '+GetSQLVozrast('DATES','DATER')+'<1) THEN 1 ELSE 0 END) g1'+
      ' FROM ����������� WHERE Year(datez)='+strGod + ' and vosstan=false'+strAddWhere
    dbChangeSQL(q,strSQL,true);
    ds.Fld('NUM3').AsInteger  := q.Fld('ALLS').AsInteger;
    ds.Fld('NUM4').AsInteger  := q.Fld('G1').AsInteger;
    //-------------- �����
    strSQL := 'SELECT Count(*) allb, '+
      ' Sum( IIF( (ON_GRAG<>'+strGrag+' and ON_GRAG<>999) or (ONA_GRAG<>'+strGrag+' and ONA_GRAG<>999),1,0)) IN_GR,'+
      ' Sum( IIF( ON_GRAG=999 or ONA_GRAG=999,1,0)) BEZ_GR,'+
      ' Sum( IIF( '+ GetSQLVozrast('IFNULL(DATEB,DATEZ)','ON_DATER')+'<18 or '+
                     GetSQLVozrast('IFNULL(DATEB,DATEZ)','ONA_DATER')+'<18,1,0)) as NES_GR'+
      ' FROM ���������������� WHERE Year(datez)='+strGod + ' and vosstan=false'+strAddWhere
//    writedebug(strSQL);
    dbChangeSQL(q,strSQL,true);
    ds.Fld('NUM5').AsInteger  := q.Fld('ALLB').AsInteger;
    ds.Fld('NUM6').AsInteger  := q.Fld('IN_GR').AsInteger;
    ds.Fld('NUM7').AsInteger  := q.Fld('NES_GR').AsInteger;
    ds.Fld('NUM31').AsInteger := q.Fld('BEZ_GR').AsInteger;
    //-------------- ������������ ���������
    strSQL := 'SELECT Count(*) allo, '+
      ' Sum( IIF( OSNOV=2,1,0)) RESH_SUDA'+
      ' FROM ���������������� WHERE Year(datez)='+strGod+strAddWhere
    dbChangeSQL(q,strSQL,true);
    ds.Fld('NUM8').AsInteger  := q.Fld('ALLO').AsInteger;
    ds.Fld('NUM9').AsInteger  := q.Fld('RESH_SUDA').AsInteger;
    //-------------- ������� ---------------
    if ds.Fld('NUM24').AsInteger=0 then begin
      strSql:='SELECT isNull(SUM_POSHLINA,0) SUMMA FROM ���������������� WHERE Year(datez)='+strGod;
      if IdProg='ZAGS' then begin
        strSql:=strSQL+
            ' UNION ALL'+
            ' SELECT isNull(ON_SUM_POSHLINA,0)+isNull(ONA_SUM_POSHLINA,0) SUMMA FROM AktTermMarriage WHERE Year(datez)='+strGod+
            ' UNION ALL'+
            ' SELECT isNull(SUM_POSHLINA,0) SUMMA FROM AktChangeName WHERE Year(datez)='+strGod;
      end;
      strSQL:='SELECT SUM(summa) summa FROM ('+strSQL+') aaa';
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM24').AsFloat:=q.Fld('SUMMA').AsFloat;
    end;
    //-------------- ���. ������ ---------------
    if ds.Fld('NUM25').AsInteger=0 then begin
      strSql:='SELECT isNull(TARIF,0) SUMMA FROM ���������������� WHERE Year(datez)='+strGod+
              ' UNION ALL'+
              ' SELECT isNull(TARIF,0) SUMMA FROM ������������ WHERE Year(datez)='+strGod;
      strSQL:='SELECT SUM(summa) summa FROM ('+strSQL+') aaa';
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM25').AsFloat:=q.Fld('SUMMA').AsFloat;
    end;
    if IdProg='ZAGS' then begin
      //--------------- ���������� � �������� ��������� --------------------------------
      if (ds.Fld('NUM19').AsInteger=0) then begin  // ���� �� ������ �������
        strSQL := 'SELECT Count(*) COUNT_OK, Sum(CASE WHEN OK=false THEN 1 ELSE 0 END) COUNT_NOT '+
                  ' FROM AddDokZAGS ad WHERE typedok=60 and Year(datez)='+strGod; // + strAddWhere;
        dbChangeSQL(q,strSQL,true);
        ds.Fld('NUM19').AsInteger:=q.Fld('COUNT_OK').AsInteger;
        ds.Fld('NUM20').AsInteger:=q.Fld('COUNT_NOT').AsInteger;
      end;
      //-------------- �������� �����
      strSQL := 'SELECT Count(*) alli FROM AktChangeName WHERE Year(datez)='+strGod+strAddWhere
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM10').AsInteger  := q.Fld('ALLI').AsInteger;
      //-------------- �����������
      strSQL := 'SELECT Count(*) allu, '+
        ' Sum( IIF( ON_GRAG<>'+strGrag+' or ONA_GRAG<>'+strGrag+',1,0)) IN_GR'+
        ' FROM AktAdopt WHERE Year(datez)='+strGod+strAddWhere
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM11').AsInteger  := q.Fld('ALLU').AsInteger;
      ds.Fld('NUM12').AsInteger  := q.Fld('IN_GR').AsInteger;
      //-------------- ������������ �����������
      strSQL := 'SELECT Count(*) allo '+
        ' FROM ������������������ WHERE Year(datez)='+strGod+strAddWhere
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM13').AsInteger  := q.Fld('ALLO').AsInteger;
      //-------------- ����������� ������
      // �� ������� ����
      strSQL := 'SELECT Count(*) KOLVO FROM AktTermMarriage WHERE (type_rast=0 or type_rast is null) and Year(datez)='+strGod+strAddWhere
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM14').AsInteger  := q.Fld('KOLVO').AsInteger;
      // �� ��������� ��������
      strSQL := 'SELECT Count(*) KOLVO FROM AktTermMarriage WHERE type_rast=1 and Year(datez)='+strGod+strAddWhere
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM30').AsInteger  := q.Fld('KOLVO').AsInteger;
      //-------------- ��� ��������������� ������
      strSQL := dmBase.LoadSQLEx('���� �� �� ���');
      strSQL := StringReplace(strSQL, '&gggg&', strGod+strAddWhere);
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM15').AsInteger  := q.Fld('KOLVO').AsInteger;
      //-------------- ��������������� ������ �� ���������
      strSQL := ' SELECT Count(*) KOLVO FROM ������������ WHERE vosstan=true and Year(datez)='+strGod+strAddWhere;
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM16').AsInteger  := q.Fld('KOLVO').AsInteger;
    end;
    //-------------- ������ � ������������� ����������
    strSQL := ' SELECT Count(*) KOLVO FROM ���������������� WHERE osnov=true and Year(datez)='+strGod+strAddWhere;
    dbChangeSQL(q,strSQL,true);
    ds.Fld('NUM17').AsInteger  := q.Fld('KOLVO').AsInteger;
    //-------------- �������� � ������������� ����������
    strSQL := ' SELECT Count(*) KOLVO FROM ������������ WHERE (vosstan=false and dayofyear(sud_date)>0) and Year(datez)='+strGod+strAddWhere;
    dbChangeSQL(q,strSQL,true);
    ds.Fld('NUM18').AsInteger  := q.Fld('KOLVO').AsInteger;

    ds.Post;

    dbClose(q);
//---�������� ��� ������� ���� --------------------------------------------------------
    if lRiap then begin
      CurDS:=ds;
      dmBase.AnyExport('�������� ��� ������� ���� ...','&Riap_ZAGS',false,false,GetFolderMyDocument+'\����','explore');
    end;
//--------------------------------------------------------------------------------
    CloseMessage();
  end;
end;


//------------------------------------------------------------------------------
// ������ ��� ���������� 12 � ����. ���. �������
// 
function Stat_F23_ZAGS : Boolean;
var
  f : TfmParamQuest;
  ds,q : TDataSet;
  strAdd,strSQL,strGod,strDate1,strDate2 : String;
  i : Integer;
  nGod : Integer;
  sl : TStringList;
  d : TDateTime;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := '������� ���������';
  i := StrToInt(FormatDateTime('YYYY', GlobalTask.CurrentDate))-1;
//  f.AddParamEx(GlobalTask.GetLastValueAsDate('DATE_VIBOR'), '���� �������' , 'DATEVZ' ,'TYPE=DATE');

  f.AddParamEx(i , '�� ����� ���'    , 'YEAR'    ,'TYPE=LIST~DESC=KEY_YEARS');
  f.AddParamEx(Now, '���� ������������' , 'DATEF' ,'TYPE=DATE');
  f.AddButtons('���������~�����',0);
  i := f.ShowQuest;
  nGod := f.GetValue('YEAR','N');
  d:=f.GetValue('DATEF','D');
  f.Free;
  Result := false;
  if i = 1 then begin
    Result := true;
    strGod := IntToStr(nGod);
    strDate1 := QStr(strGod+'-01-01');
    strDate2 := QStr(strGod+'-12-31');
    GlobalTask.SetWorkParam('GOD',strGod);
    OpenMessage('������ ����� � �������� �������','',10);
    ds := FindReportTable('ZAGS');
    dbZap(ds);
    sl := TStringList.Create;
    sl.Add(az_rogd);
    sl.Add(az_brak);
    if IDProg()='ZAGS' then sl.Add(az_rast);
    sl.Add(az_smert);
    if IDProg()='ZAGS' then sl.Add(az_adopt);
    sl.Add(az_ustotc);
    strAdd := '';
    if IDProg()='ZAGS' then begin 
      sl.Add(az_ustmat);
      sl.Add(az_chname);
      //------- ����� ������ ������������� ����� ����
      strAdd:=' and ID_ZAGS='+GlobalTask.ParamAsString('ID');
      //---------------------------------------------
    end;
    for i:=0 to sl.Count-1 do begin
      ds.Append;
      ds.Fld('NUM1').AsString  := sl.Strings[i];
      // �������
      strSQL := 'SELECT Count(*) kolvo ' +
                ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+' and datep<'+strDate1 + ' and (dater is null or dater>='+strDate1+')';//+strAdd;
      q:=dbOpenSQL(strSQL,'');
      ds.Fld('NUM2').AsInteger  := q.Fld('KOLVO').AsInteger;
      // ������
      strSQL := 'SELECT Count(*) kolvo ' +
                ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+' and datep>='+strDate1 + ' and datep<='+strDate2; //+strAdd;
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM3').AsInteger  := q.Fld('KOLVO').AsInteger;
      // ������ ���������,���������,���������,�������,����������,������ � ������������
      strSQL := 'SELECT sum( iif(sost=1,1,0) ) s1,sum( iif(sost=2,1,0) ) s2, sum( iif(sost=3,1,0) ) s3, ' +
                ' sum( iif(sost=4,1,0) ) s4,sum( iif(sost=5,1,0) ) s5, sum( iif(sost=6,1,0) ) s6 '+
                ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+'  and dater>='+strDate1 + ' and dater<='+strDate2; //+strAdd;
      dbChangeSQL(q,strSQL,true);
      ds.Fld('NUM4').AsInteger  := q.Fld('S1').AsInteger;  // ��������
      ds.Fld('NUM5').AsInteger  := q.Fld('S2').AsInteger;  // ��������
      ds.Fld('NUM6').AsInteger  := q.Fld('S3').AsInteger;  // ���������
      ds.Fld('NUM7').AsInteger  := q.Fld('S4').AsInteger;  // ��������
      ds.Fld('NUM8').AsInteger  := q.Fld('S5').AsInteger;  // -----
      ds.Fld('NUM9').AsInteger  := q.Fld('S6').AsInteger;  // ������ � �������. (� ���. ����� �� ��������� !!!)
      ds.Post;
    end;
    ds.First;
    // ���� � ������ �� ������� ����
    strSQL := 'SELECT Count(*) kolvo ' +
              ' FROM ����������� s WHERE resh_suda=true and datez>='+strDate1 + ' and datez<='+strDate2; //+strAdd;
    dbChangeSQL(q,strSQL,true);
    ds.Edit;
    ds.Fld('NUM10').AsInteger  := q.Fld('KOLVO').AsInteger;
    ds.Fld('DATE_FORM').AsDateTime:=d;
    ds.Post;

    dbClose(q);
    CloseMessage();
  end;
end;

//------------------------------------------------------------------------------
{
function Stat_Raion : Boolean;
var
  f : TfmParamQuest;
  ds,q : TDataSet;
  strSQL,strDate1,strDate2 : String;
  i : Integer;
  d1,d2 : TDateTime;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := '���������� �� �������';
  f.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
  f.AddParamEx(Now, '�������� ����' , 'DATE2' ,'TYPE=DATE');
  f.AddButtons('���������~�����',0);
  i := f.ShowQuest;
  d1 := f.GetValue('DATE1','D');
  d2 := f.GetValue('DATE2','D');
  f.Free;
  Result := false;
  if i = 1 then begin
    Result := true;
    strDate1 := DateToSQL(d1);
    strDate2 := DateToSQL(d2);
    strWhereDate := '       and datez>='+strDate1+' and datez<='strDate2;
    OpenMessage('������ ���������� �� �������','',10);
    ds := FindReportTable('ZAGS');
    dbZap(ds);
    strSQL := 'select ON_RAION, Count(*) from ������������ '+
      ' where on_b_rn=false and POSITION( '+Parameters('GOROD_FOR_RN')+' in on_gorod)>0 '+
      strWhereDate+' group by ON_RAION ';

    strSQL := 'select Count(*) from ������������ '
     ' where (on_b_rn is null or on_b_rn=true) or (POSITION( '+Parameters('GOROD_FOR_RN')+' in on_gorod)=0) '+
       strWhereDate;


 

   strSQL := 'SELECT Count(*) kolvo ' +
              ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+' and datep>='+strDate1 + ' and datep<='+strDate2; //+strAdd;
    dbChangeSQL(q,strSQL,true);
    ds.Fld('NUM3').AsInteger  := q.Fld('KOLVO').AsInteger;
    // ������ ���������,���������,���������,�������,����������,������ � ������������
    strSQL := 'SELECT sum( iif(sost=1,1,0) ) s1,sum( iif(sost=2,1,0) ) s2, sum( iif(sost=3,1,0) ) s3, ' +
             ' sum( iif(sost=4,1,0) ) s4,sum( iif(sost=5,1,0) ) s5, sum( iif(sost=6,1,0) ) s6 '+
             ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+'  and dater>='+strDate1 + ' and dater<='+strDate2; //+strAdd;
   dbChangeSQL(q,strSQL,true);

   ds.First;
   dbClose(q);
   CloseMessage();
  end;
end;
}

function GetListBlank( q : TDataSet) : String;
var
  strSeria,strNomerFirst,strNomerCur,strNomerPred,s,strDelim : String;
  nNomerFirst, nNomerCur, nNomerPred, nCount, nAll : Integer;
begin
  Result := '';
  q.First;
  nAll := q.RecordCount;
  if nAll>0 then begin
    strdelim:='\par ';
    strSeria := q.Fld('SVID_SERIA').AsString;
    strNomerFirst:= q.Fld('SVID_NOMER').AsString;
    nNomerFirst  := StrToInt(strNomerFirst);
    strNomerPred := strNomerFirst;
    nNomerPred   := nNomerFirst;
    nCount   := 1;
    q.Next;
    while not q.Eof do begin
      strNomerCur := q.Fld('SVID_NOMER').AsString;
      nNomerCur   := StrToInt(strNomerCur);
      if (strSeria<>q.Fld('SVID_SERIA').AsString) or ((nNomerCur-nNomerPred)>1) or (nNomerCur<nNomerPred) then begin
        if nNomerFirst=nNomerPred then s:=strNomerFirst else s:=strNomerFirst+'-'+strNomerPred;
        Result  := Result + IntToStr(nCount)+' ��. '+strSeria+'  � '+s+strDelim
        nCount   := 1;
        strSeria := q.Fld('SVID_SERIA').AsString;
        strNomerFirst:= strNomerCur;
        nNomerFirst  := nNomerCur;
      end else begin 
        nCount := nCount + 1;
      end;
      strNomerPred := strNomerCur;
      nNomerPred   := nNomerCur;
      q.Next;
    end;
    if nCount>1 then begin
      Result  := Result + IntToStr(nCount)+' ��. '+strSeria+'  � '+strNomerFirst+'-'+strNomerPred;
    end else begin
      Result  := Result + '1 ��. '+strSeria+'  � '+strNomerFirst;
    end;
    if nAll>1 then Result := Result+strDelim+'( ' + IntToStr(nAll) + ' )'
  end;
  if result='' then result:='---';
end;
//------------------------------------------------------------------------------
// ������ ������� ������� ����������   ����
function Rasxod_Blank_ZAGS : Boolean;
var
  f : TfmParamQuest;
  tb,q : TDataSet;
  sGod,sMonth,s1,s2,s,sss,strAdd,strSQL,strGod,strDate1,strDate2,strDate3,strErr : String;
  i,j,i1,i2,n,n2,n3,n4,n5,n6,n7,n8,nn : Integer;
  sl,slName,slPrint,slPar: TStringList;
  HeadList: TStringList;
  WidthList: TStringList;
  pr : TPrintTable;
  grSS:Boolean;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := '������ ������� ����';
  i := StrToInt(FormatDateTime('MM', GlobalTask.CurrentDate));
  j := StrToInt(FormatDateTime('YYYY', GlobalTask.CurrentDate));
  if i=1 then begin
    i:=12
    j:=j-1;
  end else begin
    i:=i-1;
  end;

  f.AddParamEx(i , '�����'  , 'MONTH'  ,'WIDTH=100~TYPE=LIST~DESC=KEY_MONTH2');
  f.AddParamEx(j , '���'    , 'YEAR'   ,'TYPE=LIST~DESC=KEY_YEARS');
  if IDProg()='ZAGS' then
    f.AddParamEx(true , '����� "������ � ������������"'    , 'GR7'   ,'');
  f.AddButtons('���������~�����',0);
  n := f.ShowQuest;
  if f.GetValue('MONTH','S')=''
    then i:=0
    else i:=f.GetValue('MONTH','N');
  j := f.GetValue('YEAR','N');

  if IDProg()='ZAGS' 
    then grSS:=f.GetValue('GR7','L')
    else grSS:=false;

  f.Free;
  Result := false;
  if n = 1 then begin
    Result := true;
    sGod   := IntToStr(j);
//    sMonth := GetMonthPropis(STOD(sGod+'-'+PadLInt(i,2,'0')+'-01',''),'');
    if i>0 then begin
      i1:=i;
      i2:=i;
      n:=CountDays(j,i);
      sMonth:=ANSILowerCase(FormatDateTime('mmmm', STOD(sGod+'-'+PadLInt(i,2,'0')+'-01','')))+' '+sGod+' ����';
    end else begin
      n:=31;
      i1:=1;
      i2:=12;
      sMonth:=sGod+' ���';
    end;
    s1 := '01.'+PadLInt(i1,2,'0')+'.'+sGod;
    strDate1 := QStr(sGod+'-'+PadLInt(i1,2,'0')+'-01');
    s := sGod+'-'+PadLInt(i2,2,'0')+'-'+PadLInt(n,2,'0');
    s2:= FormatDateTime('dd.mm.yyyy',STOD(s,'')+1);
    strDate3 := DateToSQL(STOD(s,'')+1); // ������ ���� ���������� ������
    strDate2 := QStr(s);
    s := PadLInt(i,2,'0')+'_'+sGod;
    GlobalTask.SetWorkParam('GOD',sGod);
    GlobalTask.SetWorkParam('MONTH',IntToStr(i));
    OpenMessage('������ ����� "������ ������� ����" ','',10);
    if IDProg()='ZAGS' then begin
      if grSS then sss:='SS,Memo,10;' else sss:='';
      tb := dbCreateMemTable('NAME,Char,100;OSTATOK_N,Memo,10;PRIXOD,Memo,10;'+
          'RASXOD,Memo,10;ISPOR,Memo,10;'+sss+'OSTATOK_K,Memo,10;','');
    end else begin
      tb := dbCreateMemTable('NAME,Char,100;OSTATOK_N,Memo,10;PRIXOD,Memo,10;'+
          'RASXOD,Memo,10;ISPOR,Memo,10;OSTATOK_K,Memo,10;','');
    end;
    tb.Open;
    slPrint:=TStringList.Create;
    slPar:=TStringList.Create;
    HeadList:=TStringList.Create;
    WidthList:=TStringList.Create;

    sl     := TStringList.Create;
    slName := TStringList.Create;
    sl.Add(az_rogd);
    slName.Add('� ��������');
    sl.Add(az_brak);
    slName.Add('� ���������� �����');
    if IDProg()='ZAGS' then begin
      sl.Add(az_rast);
      slName.Add('� ����������� �����');
    end;
    sl.Add(az_smert);
    slName.Add('� ������');
    if IDProg()='ZAGS' then begin
      sl.Add(az_adopt);
      slName.Add('�� �����������');
    end;
    sl.Add(az_ustotc);
    slName.Add('�� ������������ ���������');
    if IDProg()='ZAGS' then begin
      sl.Add(az_ustmat);
      slName.Add('�� ������������ �����������');
      sl.Add(az_chname);
      slName.Add('� �������� �����');
    end;
    //------- ����� ������ ������������� ����� ����
    strAdd := '';
    if IDProg()='ZAGS' then strAdd := ' and ID_ZAGS='+GlobalTask.ParamAsString('ID');
    n2:=50;
    n3:=50;
    n4:=50;
    n5:=50;
    n6:=50;
    n7:=50;
    n8:=50;
    nn:=150;
//    writedebug(strdate1+'     '+strdate2+'     '+strdate3 );
    //---------------------------------------------
    for i:=0 to sl.Count-1 do begin
      tb.Append;
      tb.Fld('NAME').AsString := slName.Strings[i];
      // �������
      strSQL := 'SELECT svid_seria,svid_nomer ' +
                ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+' and datep<'+strDate1 + ' and (sost=0 or dater>='+strDate1+')'+
                ' ORDER BY svid_seria,svid_nomer ';
      q:=dbOpenSQL(strSQL,'');
      tb.Fld('OSTATOK_N').Asstring := GetListBlank(q);
      if Length(tb.Fld('OSTATOK_N').AsString)>10 then n2:=nn;
      // ������
      strSQL := 'SELECT svid_seria,svid_nomer' +
                ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+' and datep>='+strDate1 + ' and datep<='+strDate2+
                ' ORDER BY svid_seria,svid_nomer ';
      dbChangeSQL(q,strSQL,true);
      tb.Fld('PRIXOD').Asstring := GetListBlank(q);
      if Length(tb.Fld('PRIXOD').AsString)>10 then n3:=nn;
      // ������ ���������,���������
      strSQL := 'SELECT svid_seria, svid_nomer' +
                ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+' and (sost=1 or sost=2) and dater>='+strDate1 + ' and dater<='+strDate2+
                ' ORDER BY svid_seria,svid_nomer ';
      dbChangeSQL(q,strSQL,true);
      tb.Fld('RASXOD').Asstring := GetListBlank(q);
      if Length(tb.Fld('RASXOD').AsString)>10 then n4:=nn;
      // ���������
      strSQL := 'SELECT svid_seria, svid_nomer' +
                ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+' and sost=3 and dater>='+strDate1 + ' and dater<='+strDate2+
                ' ORDER BY svid_seria,svid_nomer ';
      dbChangeSQL(q,strSQL,true);
      tb.Fld('ISPOR').Asstring := GetListBlank(q);
      if Length(tb.Fld('ISPOR').AsString)>10 then n5:=nn;
      // !!! ��� ������� !!!  <=============================================
//      strSQL := 'SELECT svid_seria, svid_nomer' +
//                ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+' and sost=4 and dater>='+strDate1 + ' and dater<='+strDate2+
//                ' ORDER BY svid_seria,svid_nomer ';
//      dbChangeSQL(q,strSQL,true);
//      tb.Fld('UTER').Asstring := GetListBlank(q);
//      if Length(tb.Fld('UTER').AsString)>10 then n6:=nn;
      // ������ � ������������
      if grSS then begin
        strSQL := 'SELECT svid_seria, svid_nomer' +
                  ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+' and sost=6 and dater>='+strDate1 + ' and dater<='+strDate2+
                  ' ORDER BY svid_seria,svid_nomer ';
        dbChangeSQL(q,strSQL,true);
        tb.Fld('SS').Asstring := GetListBlank(q);
        if Length(tb.Fld('SS').AsString)>10 then n7:=nn;
      end;
      // ������� �� �����
      strSQL := 'SELECT svid_seria,svid_nomer ' +
                ' FROM ListSvid l WHERE svid_type='+sl.Strings[i]+' and datep<'+strDate3 + ' and (sost=0 or dater>='+strDate3+')'+
                ' ORDER BY svid_seria,svid_nomer ';
      q:=dbOpenSQL(strSQL,'');
      tb.Fld('OSTATOK_K').Asstring := GetListBlank(q);
      if Length(tb.Fld('OSTATOK_K').AsString)>10 then n8:=nn;
      tb.Post;
    end;
    StartPrint(slPrint, poLandscape, pfA4)
//    PrintString(slPrint, '\par\par', 0, 12, False, False, true);
    PrintString(slPrint, '\qc ����� � �������� �������� ������������ ��������������� ����������� ����� ������������ ��������� '+
                NameOrg('�','�')+' �� '+sMonth+' \par', 0, 14, true, False, False);
    PrintString(slPrint, '\par', 0, 12, False, False, true);

    pr := CreatePrintTable(slPrint,tb);
    pr.SetHeadWidth(0,'������������ ', 85);
    pr.SetHeadWidth(1,'������� �� \par '+s1, n2);
    pr.SetHeadWidth(2,'������', n3);
    pr.SetHeadWidth(3,'������', n4);
    pr.SetHeadWidth(4,'���������', n5);
//    pr.SetHeadWidth(5,'�������', n6);
    if grSS then begin
      pr.SetHeadWidth(5,'������ � �������.', n7);
      pr.SetHeadWidth(6,'������� �� \par '+s2, n8);
    end else begin
      pr.SetHeadWidth(5,'������� �� \par '+s2, n8);
    end;
    pr.SetHeadFont(0,10);
    pr.SetTableFont(0,8);
//    pr.SetColFont(0,0,12);
    pr.SetBorder(-1, 'ltrb');
    pr.SetAlign(-1, 'l', 'l');
    pr.Print;
    FreePrintTable(pr);

    if IDProg()='ZAGS' then begin
      PrintString(slPrint, '��������� ��� �������� ������� ������������ � ����������� ����� ������������ ��������� �� ��������. \par', 0, 12, false, false, false);
      PrintString(slPrint, ParamAsString('DOLG_RUK_ZAGS')+StringOfChar(' ',50)+ParamAsString('���_����')+' \par', 0, 12, false, false, false);
      PrintString(slPrint, ' \par', 0, 12, false, false, false);
      PrintString(slPrint, ParamAsString('DOLG_SPEC')+StringOfChar(' ',70)+ParamAsString('����_����')+' \par', 0, 12, false, false, false);
    end else begin
      PrintString(slPrint, ' \par', 0, 12, false, false, false);

//      PrintString(slPrint, ParamAsString('DOLG_SPEC')+StringOfChar(' ',50)+ParamAsString('���_����')+' \par', 0, 12, false, false, false);
       PrintString(slPrint, Zags_Otchet_Dolg+StringOfChar(' ',50)+Zags_Otchet_FIO+' \par', 0, 12, false, false, false);
    end;
    slPrint.Text:=StringReplace(slPrint.Text, '\trkeep', '');   // �������� ������� ����� �� ��������� ��������
    if FinishPrint(GetFolderMyDocument+'\������������������_'+s+'.doc', slPrint, True, strErr) then begin
      ShellExt(GetFolderMyDocument+'\������������������_'+s+'.doc');
    end else begin
      PutError(strErr);
    end;


    sl.Free;
    slName.Free;
    slPrint.Free;
    slPar.Free;
    HeadList.Free;
    WidthList.Free;
    dbClose(tb);
    dbClose(q);
    CloseMessage();
  end;
end;


//------------------------------------------------------------------------------
//---------
procedure AddOnePerepis(dsS,dsD : TDataSet; lChangePunkt : Boolean);
begin
//select punkt, 0 tip, 0 ul, '  ' name, kol_dom, kol_dom_zareg, kol_dom_progiv,
//                   dom_one_kv, dom_mn_kv,
//	   kol_kv, zareg, zareg_one_kv, zareg_mn_kv, fact_progiv
//PUNKT,Integer;TIP,Integer;UL,Integer;
//  s := 'GR1,Char,5;GR2,Char,100;GR3,Char,10;GR4,Integer;GR5,Integer;GR6,Integer;GR7,Integer;'+
//       'GR8,Integer;GR9,Integer;GR10,Integer;GR11,Integer;GR12,Integer;GR13,Integer;GR14,Integer;GR15,Char,5;';
  dsD.Append;
  if lChangePunkt then begin
    dsD.Fld('GR1').AsString:='NN';
    dsD.Fld('GR2').AsString:=SeekValueSpr('�������������','ID',dsS.Fld('PUNKT').AsInteger,'NAME');
  end else begin
    dsD.Fld('GR1').AsString:=' ';
    dsD.Fld('GR2').AsString:=dsS.Fld('NAME').AsString;
  end;
  dsD.Fld('GR3').AsString:=' ';
  dsD.Fld('GR4').AsInteger :=dsS.Fld('KOL_DOM_ZAREG').AsInteger;
  dsD.Fld('GR5').AsInteger :=dsS.Fld('DOM_ONE_KV').AsInteger;
  dsD.Fld('GR6').AsInteger :=dsS.Fld('DOM_MN_KV').AsInteger;
  dsD.Fld('GR7').AsInteger :=dsS.Fld('KOL_KV').AsInteger;
  dsD.Fld('GR8').AsInteger :=dsS.Fld('ZAREG').AsInteger;
  dsD.Fld('GR9').AsInteger :=dsS.Fld('ZAREG_ONE_KV').AsInteger;
  dsD.Fld('GR10').AsInteger:=dsS.Fld('ZAREG_MN_KV').AsInteger;
  dsD.Fld('GR11').AsInteger:=dsS.Fld('FACT_PROGIV').AsInteger;
  dsD.Fld('GR12').AsInteger:=dsS.Fld('KOL_DOM_PROGIV').AsInteger;
  dsD.Fld('GR13').AsInteger:=dsS.Fld('KOL_DOM').AsInteger;
  dsD.Fld('GR14').AsInteger:=dsS.Fld('ZAREG').AsInteger+dsS.Fld('FACT_PROGIV').AsInteger;
  dsD.Fld('GR15').AsString:=' ';
  dsD.Post;
end;

function Forma_Perepis2 : Boolean;
var
  tb,q,qq : TDataSet;
  i,n,nCurPunkt,nPunkt,nUL,nTip,nPP : Integer;
  slPrint,slPar: TStringList;
  HeadList: TStringList;
  WidthList: TStringList;
  pr : TPrintTable;
  s,ss,sss,strSQL,strErr,strName,strNN : String;
  d : TDateTime;
  lPrint,lPrintDetail : Boolean;
begin
  OpenMessage('������ ����� "������ ����� 2-������ (������ I)" ','',10);
  d := MainDateFiks;
//select punkt, 0 tip, 0 ul, '  ' name, kol_dom, kol_dom_zareg, kol_dom_progiv, dom_one_kv, dom_mn_kv,
//	   kol_kv, zareg, zareg_one_kv, zareg_mn_kv, fact_progiv
  s := 'GR1,Char,5;GR2,Char,100;GR3,Char,10;GR4,Integer;GR5,Integer;GR6,Integer;GR7,Integer;'+
       'GR8,Integer;GR9,Integer;GR10,Integer;GR11,Integer;GR12,Integer;GR13,Integer;GR14,Integer;GR15,Char,5;';
  tb := dbCreateMemTable(s,'');
  tb.Open;

  ss:=GlobalTask.ParamAsString('ID');  // ���. ������ � ����� �����

  slPrint  := TStringList.Create;
  slPar    := TStringList.Create;
  HeadList := TStringList.Create;
  WidthList:= TStringList.Create;

  strSQL := dmBase.LoadSQLEx('����� ��� ��������1');
  strSQL := dmBase.CheckDateFiksSQL(strSQL, d);
  dbExecuteSQL('drop table #forma2');
  dbExecuteSQL(strSQL);
  strSQL := dmBase.LoadSQLEx('����� ��� ��������2');
  q:=dbOpenSQL(strSQL,'');
  nCurPunkt:=-1;
  lPrintDetail := true;
  nPP:=1;
  while not q.Eof do begin
    nPunkt := q.Fld('PUNKT').AsInteger;
    nUL    := q.Fld('UL').AsInteger;
    nTip   := q.Fld('TIP').AsInteger;
    lPrint:=true;
    if nCurPunkt<>nPunkt then begin  // �������� ���������� �����
      if (q.Fld('ZAREG').AsInteger+q.Fld('FACT_PROGIV').AsInteger)>0
        then lPrintDetail := true
        else lPrintDetail := false;
    end;
    if (nUL=0) and (nTip=0) then begin
      if (nPunkt=0) then begin
        strNN:='';
        strName:='����� �� ��������� ������';
      end else begin
        strNN:=IntToStr(nPP);
        strName:=SeekValueSpr('�������������','ID',nPunkt,'NAME');
        nPP:=nPP+1;
      end;
    end else begin
      strNN:='';
      if nTip=1 then begin  // ������, �������� ����
        if not lPrintDetail 
          then lPrint:=false;
        if lPrint then begin
          if nUL>0 then begin
            s:=SeekValueSpr('�������','ID',nUL,'NAME');
            s:=SeekValueSpr('����������','ID',SeekValueSpr('�������','ID',nUL,'TIP'),'NAME')+s+', '
          end else begin
            s:='';
          end;
          sss:='select dom from #forma2 where punkt='+IntToStr(nPunkt)+' and ul='+IntToStr(nUL)+' and chet=';
          if Trim(q.Fld('NAME').AsString)='1' then begin
            sss:=sss+'false';
          end else begin
            sss:=sss+'true';
          end;
          qq:=dbOpenSQL(sss,'');
          qq.First;
          sss := Trim(qq.Fld('DOM').AsString);  // ������ ����� ����
          qq.Last;
          if sss<>Trim(qq.Fld('DOM').AsString) 
           then sss := sss+'-'+Trim(qq.Fld('DOM').AsString);  // + ��������� ����� ����
          dbClose(qq);
          strName:='  '+s+sss
        end;
      end else begin  // �������� ������� ����
        strName:='  '+q.Fld('NAME').AsString;
      end
    end;
    if lPrint then begin
      tb.Append;
      tb.Fld('GR1').AsString:=strNN;
      tb.Fld('GR2').AsString:=strName;
      tb.Fld('GR3').AsString:=' ';
      if q.Fld('KOL_DOM_ZAREG').AsInteger>0  then tb.Fld('GR4').AsInteger:=q.Fld('KOL_DOM_ZAREG').AsInteger;
      if q.Fld('DOM_ONE_KV').AsInteger>0     then tb.Fld('GR5').AsInteger:=q.Fld('DOM_ONE_KV').AsInteger;
      if q.Fld('DOM_MN_KV').AsInteger>0      then tb.Fld('GR6').AsInteger:=q.Fld('DOM_MN_KV').AsInteger;
      if q.Fld('KOL_KV').AsInteger>0         then tb.Fld('GR7').AsInteger :=q.Fld('KOL_KV').AsInteger;
      if q.Fld('ZAREG').AsInteger>0          then tb.Fld('GR8').AsInteger :=q.Fld('ZAREG').AsInteger;
      if q.Fld('ZAREG_ONE_KV').AsInteger>0   then tb.Fld('GR9').AsInteger :=q.Fld('ZAREG_ONE_KV').AsInteger;
      if q.Fld('ZAREG_MN_KV').AsInteger>0    then tb.Fld('GR10').AsInteger:=q.Fld('ZAREG_MN_KV').AsInteger;
      if q.Fld('FACT_PROGIV').AsInteger>0    then tb.Fld('GR11').AsInteger:=q.Fld('FACT_PROGIV').AsInteger;
      if q.Fld('KOL_DOM_PROGIV').AsInteger>0 then tb.Fld('GR12').AsInteger:=q.Fld('KOL_DOM_PROGIV').AsInteger;
      if q.Fld('KOL_DOM').AsInteger>0        then tb.Fld('GR13').AsInteger:=q.Fld('KOL_DOM').AsInteger;
      tb.Fld('GR14').AsInteger:=q.Fld('ZAREG').AsInteger+q.Fld('FACT_PROGIV').AsInteger;
      tb.Fld('GR15').AsString:=' ';
      tb.Post;
    end;
    nCurPunkt:=q.Fld('PUNKT').AsInteger;
    q.Next;
  end;
  dbClose(q);
  dbExecuteSQL('drop table #forma2');

  StartPrint(slPrint, poLandscape, pfA4)
//  PrintString(slPrint, '\par\par', 0, 12, False, False, true);
  PrintString(slPrint, '\qc ������ I '+'\par', 0, 14, true, False, False);
  PrintString(slPrint, '\qc �������� � �������� ���������� ������� '+
              NameOrg('�','�')+'\par', 0, 14, true, False, False);
  PrintString(slPrint, '\par\par', 0, 12, False, False, true);

  pr := CreatePrintTable(slPrint,tb);
  pr.SetHeadWidth(0,'� �/�|1', 20);
  pr.SetHeadWidth(1,'������������|2',230);
  pr.SetHeadWidth(2,'���|3', 30);
  n:=40;
  s:='�� ������ ����� 1 ���������������� �����|'
  pr.SetHeadWidth(3,s+'���������� ���. �����|4', n);
  pr.SetHeadWidth(4,s+'� ��� �����|�������������� ���. �����|5', n);
  pr.SetHeadWidth(5,s+'� ��� �����|��������������� ���. �����|6', n);
  pr.SetHeadWidth(6,s+'���-�� ������� � �������. �����|7', n);
  pr.SetHeadWidth(7,s+'����������� ���������|8', n);
  pr.SetHeadWidth(8,s+'�� ��� ������������ �|��������� � ������. �����|9', n);
  pr.SetHeadWidth(9,s+'�� ��� ������������ �|��������� � �������. �����|10', n);
  pr.SetHeadWidth(10,'���������� ����������� �� ����� 2|11', n);
  pr.SetHeadWidth(11,'��������� ���. ����|12', n);
  pr.SetHeadWidth(12,'����� ����������� ���. �����|13', n);
  pr.SetHeadWidth(13,'����� ����������� ���������|14', n);
  pr.SetHeadWidth(14,'����������|15', 60);

  pr.SetHeadFont(0,8);
  pr.SetTableFont(0,12);
  pr.SetBorder(-1, 'ltrb');
  pr.SetAlign(-1, 'c', 'r');
  pr.SetAlign(1, 'c', 'l');

  pr.Print;
  FreePrintTable(pr);
  ss:=ss+'_'+Trim(StringReplace(ParamAsString('NAME'),' ','_'));
//  PrintString(slPrint, '��������� ��� �������� ������� ������������ � ����������� ����� ������������ ��������� �� ��������. \par', 0, 12, false, false, false);
  if FinishPrint(GetFolderMyDocument+'\2������_'+ss+'.doc', slPrint, True, strErr) then begin
    ShellExt(GetFolderMyDocument+'\2������_'+ss+'.doc');
  end else begin
    PutError(strErr);
  end;

  slPrint.Free;
  slPar.Free;
  HeadList.Free;
  WidthList.Free;
  dbClose(tb);
  CloseMessage();
end;


{$IFDEF ADD_PU}
function Report_For_GAZ(DateFiks: TDateTime; LicID, PID: Word): Boolean;
var
  sSQL:String;
  d,dBegin:TDateTime;
  f:TfmParamQuest;
  q,ds,tb:TDataSet;
  slPar:TStringList;
  n:Integer;
begin
  Result:=true;
//  PAR1:=GetTemplateParam('PAR1');
  f := TfmParamQuest.Create(nil);
  f.Caption := '������� ���������';
//  s:=Trim(GlobalTask.GetLastValueAsString('OCH_PRIG_NAME'));
//  f.AddParamEx(s, '�������� �����������' , 'NAME','TYPE=STRING~WIDTH=500');  //1
  f.AddParamEx(Now, '��������� ����' , 'DATEP' ,'WIDTH=120~TYPE=DATE');             //2
  f.AddButtons('���������~�����',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    dBegin:=f.GetValue('DATEP','D');
    d:=EncodeDate(1899,12,30);
    slPar:=TStringList.Create;
    ds:=GetTemplateDataSet('MAIN');
    ds.Edit;
    ds.Fld('SHTAMP').AsString:=GetShtampSpr();
    ds.Fld('PERIOD').AsString:='� '+DatePropis(dBegin,2)+' �� '+DatePropis(NOW,2);
    ds.Fld('TEKU_DATE').AsString := DatePropis(NOW,2);
    WritePodpis(ds,31);  // ����� ������� ����  + ����� � ����. ���������
    ds.Post;
    tb:=GetTemplateDataSet('TABLSOST');
    sSQL:='select l.*, a.ABONENT_GAZ from ������������ l'+
          ' left join ��������� a on l.date_fiks=a.date_fiks and l.adres_id=a.id'+
          ' left join ������������� sp on sp.id=a.punkt '+
          ' left join ������� su on su.id=a.ul '+
          '  where l.id in (select lic_id from ��������� n where ((n.datep>='+DateToSQL(dBegin)+' and n.candelete=false and n.propis=true) or '+
          ' (n.datev>='+DateToSQL(dBegin)+' and n.candelete=true and n.propis=false)) and n.kateg=0 and n.date_fiks=''1899-12-30'') and l.date_fiks=''1899-12-30'' '+
          ' order by sp.name,su.name,a.dom1,a.dom2,kv,korp,l.id ';
    OpenMessage(' ������������ ������� ...      ','',10);
    MemoWrite('report.sql',sSQL);
    q:=dbOpenSQL(sSQL,'');
//Tables='TABLSOST=NNN,ADRES,FIO,KOLVO,SOBSTV,SOSTAV'
//FIELDS=ABONENT_GAZ,TEKU_DATE,PERIOD,NOMER,PRIL,PPP,SHTAMP,DOLG_PODP1,FIO_PODP1,DOLG_PODP2,FIO_PODP2,DOLG_PODP3,FIO_PODP3
    while not q.Eof do begin
      tb.Append;
      tb.Fld('ADRES').AsString:=dmBase.AdresFromID(d, q.Fld('ADRES_ID').AsString,false);
      tb.Fld('FIO').AsString:=dmBase.HouseOwners(d, q.Fld('ADRES_ID').AsString, nil, 1);
      tb.Fld('GAZ').AsString:=q.Fld('ABONENT_GAZ').AsString;
      slPar.Clear;
      slPar.Add('ADRES_ID='+q.Fld('ADRES_ID').AsString);
      tb.Fld('KOLVO').AsString:=IntToStr(dmBase.CountMensEx(d, q.Fld('ID').AsString, '001', slPar));
      if slPar.IndexOfName('SOBSTV')=-1 then begin  // ����������� �� ��������������� �� ������ ADRES_ID
        tb.Fld('SOBSTV').AsString:='���';
// strParAdd ';ALL;FIRST;OTN;;DATER;DATEP;IN;PASP;LGOT;'
        tb.Fld('SOSTAV').AsString:=dmBase.ListMensLic(q.Fld('ID').AsString, -1, '001', ';ALL;OTN;', ', ', nil);
      end else begin
        tb.Fld('SOBSTV').AsString:='��';
        tb.Fld('SOSTAV').AsString:='';
      end;
      if tb.Fld('KOLVO').AsString='0' then begin
        tb.Fld('KOLVO').AsString:='-';
        tb.Fld('SOSTAV').AsString:='������ '+DatePropis(q.Fld('DATE_LIKV').AsDateTime, 3);
      end;
      tb.Post;
      q.Next;
    end;
    dbClose(q);
    slPar.Free;
    CloseMessage;
    if tb.RecordCount=0 then begin
      ShowMessage('�������� ��������� ������');
      Result:=false;
    end;
  end else begin
    Result:=false;
  end;
  f.Free;
end;
{$ENDIF}

//=== ���������� 06 ��������� ������� ============================================================

const
   //������ � ������
   Indent=10;

procedure drAddName(ds: TDataSet; Name: string; Lev: Integer);
begin
   ds.Append;
   ds.Fld('NAME').AsString:=Name;
   ds.Fld('LEV').AsInteger:=Lev*Indent;
   ds.Post;
end;

procedure drSetPercent(ds, qu: TDataSet; Val, Cur, Prev: string);
begin
   if (qu.Fld(Prev).AsInteger<>0) and (qu.Fld(Cur).AsInteger<>0) then begin
      ds.Fld(Val).AsString:=FormatFloat('##0.0',xRound((qu.Fld(Cur).AsInteger/qu.Fld(Prev).AsInteger)*100, 1));
   end
   else begin
      ds.Fld(Val).AsString:='-';
   end;
end;

procedure drAddValue1(ds, qu: TDataSet; Name, Val1, Val2: string; Lev: Integer);
begin
   ds.Append;
   ds.Fld('NAME').AsString:=qu.Fld(Name).AsString;
   ds.Fld('VAL1').AsString:=qu.Fld(Val1).AsString;
   ds.Fld('VAL2').AsString:=qu.Fld(Val2).AsString;
   ds.Fld('VAL3').AsString:=IntToStr(qu.Fld(Val1).AsInteger-qu.Fld(Val2).AsInteger);
   drSetPercent(ds, qu, 'VAL4', Val1, Val2);
   ds.Fld('LEV').AsInteger:=Lev*Indent;
   ds.Post;
end;

procedure drAddValue2(ds, qu: TDataSet; Name, Val1, Val2: string; Lev: Integer);
begin
   ds.Append;
   ds.Fld('NAME').AsString:=Name;
   ds.Fld('VAL1').AsString:=qu.Fld(Val1).AsString;
   ds.Fld('VAL2').AsString:=qu.Fld(Val2).AsString;
   ds.Fld('VAL3').AsString:=IntToStr(qu.Fld(Val1).AsInteger-qu.Fld(Val2).AsInteger);
   drSetPercent(ds, qu, 'VAL4', Val1, Val2);
   ds.Fld('LEV').AsInteger:=Lev*Indent;
   ds.Post;
end;

function DocQuarterReport: Boolean;
var
   fmParam: TfmParamQuest;
   dsReport: TDataSet;
   quSQL: TDataSet;
   Res: Integer;
   Date1: TDateTime;
   Date2: TDateTime;
   SQL: string;
   CurYear: string;
   PrevYear: string;
begin
   Result:=False;
   //����� ������� ����������
   fmParam:=TfmParamQuest.Create(nil);
   fmParam.Caption:='���������';
   fmParam.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
   fmParam.AddParamEx(Now, '�������� ����' , 'DATE2' ,'TYPE=DATE');
   fmParam.AddButtons('���������~�����',0);
   Res:=fmParam.ShowQuest;
   //
   if Res=1 then begin
      Date1:=fmParam.GetValue('DATE1','D');
      Date2:=fmParam.GetValue('DATE2','D');
      GlobalTask.SetLastValueAsDate('DATE_START', Date1);
      GlobalTask.SetLastValueAsDate('DATE_END', Date2);
      CurYear:=' d.REG_DATE between '+DateToSql(Date1)+' and '+DateToSql(Date2)+' ';
      PrevYear:=' d.REG_DATE between '+DateToSql2(Date1)+' and '+DateToSql2(Date2)+' ';
      dsReport:=FindReportTable('DOC_QREP');
      dbZap(dsReport);
  
      OpenMessage('������������ ������ �� ���������� �������','',10);

      //IN01 ���������, �����
      //IN02 ����������� � ������������� ���� //NB: ???
      //IN04 ���������, �������������
      //IN06 ���������, ���������
      //IN07 ���������, ���������, �������������
      //IN08 ���������, ����������, �����
      //IN09 ���������, ����������, �� �����������
      //IN11 ���������, ����������, ������������
      //IN12 ���������, ����������, 30 � ����� �������
      //IN13 ���������, ������, ����� //NB: ???
      //IN14 ���������, ����������, �� ����������� ���
      //IN15 ���������, �����������, ����� NB: ???   vadim  21.10.2016
      SQL:=
         'select '+
         '   sum(iif('+CurYear+', 1, 0)) as IN01_VAL1, '+
         '   sum(iif('+PrevYear+', 1, 0)) as IN01_VAL2, '+
         '   sum(iif('+CurYear+'and d.EXEC_FACT<=d.EXEC_TERM, 1, 0)) as IN02_VAL1, '+
         '   sum(iif('+PrevYear+'and d.EXEC_FACT<=d.EXEC_TERM, 1, 0)) as IN02_VAL2, '+
         '   sum(iif('+CurYear+'and d.ANS_KIND=1, 1, 0)) as IN04_VAL1, '+
         '   sum(iif('+PrevYear+'and d.ANS_KIND=1, 1, 0)) as IN04_VAL2, '+
         '   sum(iif('+CurYear+'and d.IS_REPEAT=true, 1, 0)) as IN06_VAL1, '+
         '   sum(iif('+PrevYear+'and d.IS_REPEAT=true, 1, 0)) as IN06_VAL2, '+
         '   sum(iif('+CurYear+'and d.IS_REPEAT=true and d.ANS_KIND=1, 1, 0)) as IN07_VAL1, '+
         '   sum(iif('+PrevYear+'and d.IS_REPEAT=true and d.ANS_KIND=1, 1, 0)) as IN07_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1, 1, 0)) as IN08_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1, 1, 0)) as IN08_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and c.CORR_TYPE=1, 1, 0)) as IN09_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and c.CORR_TYPE=1, 1, 0)) as IN09_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and d.SIGN_TYPE=20, 1, 0)) as IN11_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and d.SIGN_TYPE=20, 1, 0)) as IN11_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and d.SIGN_TYPE=20 and d.SIGN_NUM>=30, 1, 0)) as IN12_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and d.SIGN_TYPE=20 and d.SIGN_NUM>=30, 1, 0)) as IN12_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=3, 1, 0)) as IN13_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=3, 1, 0)) as IN13_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and d.SIGN_KIND=2, 1, 0)) as IN14_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and d.SIGN_KIND=2, 1, 0)) as IN14_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=2, 1, 0)) as IN15_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=2, 1, 0)) as IN15_VAL2 '+
         'from DOCMAIN d '+
         '   left join ������������� c on c.ID=d.COVER_CORR '+
         'where d.DOC_TYPE=1 and d.NOT_EXP=False and '+
         //���������: ����������, ���������, �� �����������
         '      (d.COVER_CORR is null or not (isnull(d.APP_FORM,0)=1 and isnull(c.CORR_TYPE,0)=1 and isnull(d.COVER_TYPE,0)=1)) ';
      quSQL:=dbOpenSQL(SQL, '');

      drAddValue2(dsReport, quSQL, '��������� ���������, �����', 'IN01_VAL1', 'IN01_VAL2', 0);
      drAddValue2(dsReport, quSQL, '�� ��� �������������', 'IN04_VAL1', 'IN04_VAL2', 1);
      drAddValue2(dsReport, quSQL, '���������', 'IN06_VAL1', 'IN06_VAL2', 0);
      drAddValue2(dsReport, quSQL, '�� ��� �������������', 'IN07_VAL1', 'IN07_VAL2', 1);
      drAddValue2(dsReport, quSQL, '����������� � ������������� ����', 'IN02_VAL1', 'IN02_VAL2', 0);
      drAddValue2(dsReport, quSQL, '��������� ���������� ���������, �����', 'IN08_VAL1', 'IN08_VAL2', 0);
      drAddValue2(dsReport, quSQL, '����� ����������� ������', 'IN09_VAL1', 'IN09_VAL2', 1);
      drAddValue2(dsReport, quSQL, '������������ ���������', 'IN11_VAL1', 'IN11_VAL2', 1);
      drAddValue2(dsReport, quSQL, '� ��� ����� �� 30 � ����� �������', 'IN12_VAL1', 'IN12_VAL2', 2);
      drAddValue2(dsReport, quSQL, '�� ����������� ���', 'IN14_VAL1', 'IN14_VAL2', 1);
      drAddValue2(dsReport, quSQL, '��������� ������ ��������� �����', 'IN13_VAL1', 'IN13_VAL2', 0);
      drAddValue2(dsReport, quSQL, '��������� ����������� ��������� �����', 'IN15_VAL1', 'IN15_VAL2', 0);

      //IN16 ���������, ����������, ���������, �� �����������
      SQL:=
         'select '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and c.CORR_TYPE=1 and d.COVER_TYPE=1, 1, 0)) as IN16_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and c.CORR_TYPE=1 and d.COVER_TYPE=1, 1, 0)) as IN16_VAL2 '+
         'from DOCMAIN d '+
         '   left join ������������� c on c.ID=d.COVER_CORR '+
         'where d.DOC_TYPE=1 and d.NOT_EXP=False ';
      dbChangeSQL(quSQL ,SQL, True); 
      drAddValue2(dsReport, quSQL, '��������� ���������', 'IN16_VAL1', 'IN16_VAL2', 0);

      //IN05 ���������, �� �������/���������� ���������
      SQL:=
         'select ifnull(sp.NAME, ''������/��������� �� �������'') as MAN_GROUP_NAME, s.IN05_VAL1, s.IN05_VAL2 '+
         'from ( '+
         '   select '+
         '      SIGN_GROUP, '+
         '      sum(iif('+CurYear+', 1, 0)) as IN05_VAL1, '+
         '      sum(iif('+PrevYear+', 1, 0)) as IN05_VAL2 '+
         '   from DOCMAIN d '+
         '      left join ������������� c on c.ID=d.COVER_CORR '+
         '   where DOC_TYPE=1 and d.NOT_EXP=False and '+
         '          ('+CurYear+' or '+PrevYear+') and '+
                   //���������: ����������, ���������, �� �����������
         '         (d.COVER_CORR is null or not (isnull(d.APP_FORM,0)=1 and isnull(c.CORR_TYPE,0)=1 and isnull(d.COVER_TYPE,0)=1)) '+
         '   group by SIGN_GROUP) s '+
         'left join SprDocManGroup sp on sp.ID=s.SIGN_GROUP '+
         'order by sp.id';
      dbChangeSQL(quSQL ,SQL, True); 
      quSQL.First;
      if not quSQL.Eof then begin
         drAddName(dsReport, '��������� ��������� ��:', 0)
         while not quSQL.Eof do begin
            drAddValue1(dsReport, quSQL, 'MAN_GROUP_NAME', 'IN05_VAL1', 'IN05_VAL2', 1);
            quSQL.Next;
         end;
      end;
        
      //IN15 ���������, �� ���������
      SQL:=
         'select iif(s.SUBJ_ID<10000,ifnull(sp.NAME, ''�������� �� �������''),ifnull(spg.NAME, ''�������� �� �������'')) as SUBJ_NAME, s.IN15_VAL1, s.IN15_VAL2 '+
         'from ( '+
         '   select '+
         '      SUBJ_ID, '+
         '      sum(iif('+CurYear+', 1, 0)) as IN15_VAL1, '+
         '      sum(iif('+PrevYear+', 1, 0)) as IN15_VAL2 '+
         '   from DOCMAIN d'+
         '      left join ������������� c on c.ID=d.COVER_CORR '+
         '   where DOC_TYPE=1 and d.NOT_EXP=False and '+
         '          ('+CurYear+' or '+PrevYear+') and '+
                   //���������: ����������, ���������, �� �����������
         '         (d.COVER_CORR is null or not (isnull(d.APP_FORM,0)=1 and isnull(c.CORR_TYPE,0)=1 and isnull(d.COVER_TYPE,0)=1)) '+
         '   group by SUBJ_ID) s '+
         'left join SprDocSubj  sp  on sp.ID=s.SUBJ_ID '+
         'left join SprDocSubjG spg on spg.ID=s.SUBJ_ID '+
         'order by sp.code';
      dbChangeSQL(quSQL ,SQL, True);
      quSQL.First;
      if not quSQL.Eof then begin 
         drAddName(dsReport, '��������� ��������� �� ���������:', 0);
         while not quSQL.Eof do begin
            drAddValue1(dsReport, quSQL, 'SUBJ_NAME', 'IN15_VAL1', 'IN15_VAL2', 1);
            quSQL.Next;
         end;
      end;
      dbClose(quSQL);
      CloseMessage();
      Result:=True;
   end;
   fmParam.Free;
end;

function DocQuarterReport2: Boolean;
var
   fmParam: TfmParamQuest;
   dsReport: TDataSet;
   quSQL: TDataSet;
   quSQL2: TDataSet;
   Res: Integer;
   Date1: TDateTime;
   Date2: TDateTime;
   SQL: string;
   SQL2: string;
   CurYear: string;
   PrevYear: string;
begin
   Result:=False;
   //����� ������� ����������
   fmParam:=TfmParamQuest.Create(nil);
   fmParam.Caption:='���������';
   fmParam.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
   fmParam.AddParamEx(Now, '�������� ����' , 'DATE2' ,'TYPE=DATE');
   fmParam.AddButtons('���������~�����',0);
   Res:=fmParam.ShowQuest;
   //
   if Res=1 then begin
      Date1:=fmParam.GetValue('DATE1','D');
      Date2:=fmParam.GetValue('DATE2','D');
      GlobalTask.SetLastValueAsDate('DATE_START', Date1);
      GlobalTask.SetLastValueAsDate('DATE_END', Date2);
      CurYear:=' d.REG_DATE between '+DateToSql(Date1)+' and '+DateToSql(Date2)+' ';
      PrevYear:=' d.REG_DATE between '+DateToSql2(Date1)+' and '+DateToSql2(Date2)+' ';
      dsReport:=FindReportTable('DOC_QREP');
      dbZap(dsReport);
  
      OpenMessage('������������ ������ �� ���������� �������','',10);

      //IN01 ���������, �����
      //IN06 ���������, ���������
      //IN08 ���������, ����������, �����
      //IN09 ���������, ����������, �� �����������
      //IN13 ���������, ������, ����� //NB: ???
      //IN15 ���������, �����������, ����� //NB: ???   vadim
      SQL:=
         'select '+
         '   sum(iif('+CurYear+', 1, 0)) as IN01_VAL1, '+
         '   sum(iif('+PrevYear+', 1, 0)) as IN01_VAL2, '+
         '   sum(iif('+CurYear+'and d.IS_REPEAT=true, 1, 0)) as IN06_VAL1, '+
         '   sum(iif('+PrevYear+'and d.IS_REPEAT=true, 1, 0)) as IN06_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1, 1, 0)) as IN08_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1, 1, 0)) as IN08_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and c.CORR_TYPE=1, 1, 0)) as IN09_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and c.CORR_TYPE=1, 1, 0)) as IN09_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=3, 1, 0)) as IN13_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=3, 1, 0)) as IN13_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=2, 1, 0)) as IN15_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=2, 1, 0)) as IN15_VAL2 '+
         'from DOCMAIN d '+
         '   left join ������������� c on c.ID=d.COVER_CORR '+
         'where d.DOC_TYPE=1 and d.NOT_EXP=False and '+
                //���������: ����������, ���������, �� �����������
         '      (d.COVER_CORR is null or not (isnull(d.APP_FORM,0)=1 and isnull(c.CORR_TYPE,0)=1 and isnull(d.COVER_TYPE,0)=1)) ';

      //IN16 ���������, ����������, ���������, �� �����������
      SQL2:=
         'select '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and c.CORR_TYPE=1 and d.COVER_TYPE=1, 1, 0)) as IN16_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and c.CORR_TYPE=1 and d.COVER_TYPE=1, 1, 0)) as IN16_VAL2 '+
         'from DOCMAIN d '+
         '   left join ������������� c on c.ID=d.COVER_CORR '+
         'where d.DOC_TYPE=1 and d.NOT_EXP=False ';

      quSQL:=dbOpenSQL(SQL, '');
      quSQL2:=dbOpenSQL(SQL2, '');
      //�������� ������
      dsReport.Append;
      dsReport.Fld('NAME').AsString:='�������� ������';
      dsReport.Fld('VAL1').AsInteger:=quSQL.Fld('IN08_VAL1').AsInteger;
      dsReport.Fld('VAL2').AsInteger:=quSQL.Fld('IN13_VAL1').AsInteger;
      dsReport.Fld('VAL3').AsInteger:=quSQL.Fld('IN15_VAL1').AsInteger;
      dsReport.Fld('VAL4').AsInteger:=quSQL.Fld('IN01_VAL1').AsInteger;
      dsReport.Fld('VAL5').AsInteger:=quSQL.Fld('IN09_VAL1').AsInteger;
      dsReport.Fld('VAL6').AsInteger:=quSQL.Fld('IN06_VAL1').AsInteger;
      dsReport.Fld('VAL7').AsInteger:=quSQL2.Fld('IN16_VAL1').AsInteger;
      dsReport.Post;
      //��������������� ������ �������� ����
      dsReport.Append;
      dsReport.Fld('NAME').AsString:='��������������� ������ �������� ����';
      dsReport.Fld('VAL1').AsInteger:=quSQL.Fld('IN08_VAL2').AsInteger;
      dsReport.Fld('VAL2').AsInteger:=quSQL.Fld('IN13_VAL2').AsInteger;
      dsReport.Fld('VAL3').AsInteger:=quSQL.Fld('IN15_VAL2').AsInteger;
      dsReport.Fld('VAL4').AsInteger:=quSQL.Fld('IN01_VAL2').AsInteger;
      dsReport.Fld('VAL5').AsInteger:=quSQL.Fld('IN09_VAL2').AsInteger;
      dsReport.Fld('VAL6').AsInteger:=quSQL.Fld('IN06_VAL2').AsInteger;
      dsReport.Fld('VAL7').AsInteger:=quSQL2.Fld('IN16_VAL2').AsInteger;
      dsReport.Post;
      //�������� ������ � ���������������� ������� �������� ����, %
      dsReport.Append;
      dsReport.Fld('NAME').AsString:='�������� ������ � ���������������� ������� �������� ����, %';
      drSetPercent(dsReport, quSQL, 'VAL1', 'IN08_VAL1', 'IN08_VAL2')
      drSetPercent(dsReport, quSQL, 'VAL2', 'IN13_VAL1', 'IN13_VAL2')
      drSetPercent(dsReport, quSQL, 'VAL3', 'IN15_VAL1', 'IN15_VAL2')
      drSetPercent(dsReport, quSQL, 'VAL4', 'IN01_VAL1', 'IN01_VAL2')
      drSetPercent(dsReport, quSQL, 'VAL5', 'IN09_VAL1', 'IN09_VAL2')
      drSetPercent(dsReport, quSQL, 'VAL6', 'IN06_VAL1', 'IN06_VAL2')
      drSetPercent(dsReport, quSQL2, 'VAL7', 'IN16_VAL1', 'IN16_VAL2')
      dsReport.Post;

      dbClose(quSQL2);
      dbClose(quSQL);
      CloseMessage();
      Result:=True;
   end;
   fmParam.Free;
end;

//-------------------------------------------------------------------
{
function CheckCountEkzAkt:Boolean;
begin
  Result:=true;
  if DokZags.Fld('NOMER_EKZ').AsInteger=99 then begin //ParamAsBoolean('TWO_EKZ_AKT')  then begin
    GlobalTask.Report_SetCountEkz(2);
  end else begin
    GlobalTask.Report_SetCountEkz(1);
  end;
end;
}

//-------------------------------------------------------------------
// ���������� ����������� ������
function  Report_CheckCountEkz(sName:String; sVersionMajor:String; sVersionMinor:String;
                               sVersionRelease:String; sVersionBuild:String) : string;
var
  n:Integer;
  s:String;
begin
  Result:='EKZ=1;';
  if Pos('{EKZ}',sVersionBuild)>0 then begin               // ������� �������� ���������� �����������
    if (DokZags.Fld('TYPE_EKZ').AsInteger=91) then begin
      Result:='EKZ=2;';
    end else if (DokZags.Fld('TYPE_EKZ').AsInteger=92) then begin
      Result:='EKZ=3;';
    end else if (DokZags.Fld('TYPE_EKZ').AsInteger=93) then begin   // 2 ���. (1 �������)
      Result:='EKZ=11;';
    end;
  end;
  if          Pos('{DUP_V}',sVersionBuild)>0 then begin               // ������� ������������
    Result:=Result+'DUP=V;';
  end else if Pos('{DUP_H}',sVersionBuild)>0 then begin               // ������� ��������������
    Result:=Result+'DUP=H;';
  end else if Pos('{DUP_N}',sVersionBuild)>0 then begin               // ������� ��������
    Result:=Result+'DUP=N;';
  end;
  if Pos('{AKT}',sVersionBuild)>0 then begin               // 
    if Pos('V',sVersionMinor)>0 then s:='V' else s:='';
//    n:=GlobalTask.GetLastValueAsInteger('AKT'+sVersionMajor+s+'_OFFSET_X');
    n:=GlobalTask.ParamAsInteger('AKT'+sVersionMajor+s+'_OFFSET_X');
    if n<>0 then Result:=Result+'OFFSET_X='+IntToStr(n)+';';
//    n:=GlobalTask.GetLastValueAsInteger('AKT'+sVersionMajor+s+'_OFFSET_Y');
    n:=GlobalTask.ParamAsInteger('AKT'+sVersionMajor+s+'_OFFSET_Y');
    if n<>0 then Result:=Result+'OFFSET_Y='+IntToStr(n)+';';

    {
    n:=GlobalTask.GetLastValueAsInteger('AKT'+sVersionMajor+s+'_OFFSET_FIRST');   // ������ ������ ��������
    if n=0 then Result:=Result+'OFFSET_ALL=1;'
           else Result:=Result+'OFFSET_ALL=0;';
    }
    Result:=Result+'OFFSET_ALL=1;' // ������� ��� ��������      OFFSET_ALL=0 ��� ������ ������
  end;
//  WriteDebug('-> '+Result+'  ('+sName+')');
  if Pos('{CHECK_A5',sName)>0 then begin
//    showmessage('A5='+'"'+DokZags.Fld('REPORT_SIZE').AsString+'"');
    if DokZags.Fld('REPORT_SIZE').AsString='A5'
      then Result:=Result+'CHECK_A5=1;'; 
  end;

end;

//-------------------------------------------------------------------
// �����-�� �������� ����� ������� nCurEkz ������, ���� ���������� ����������� ����� ������
procedure  Report_CheckCurEkz_Begin(nCurEkz:Integer; sName:String; sVersionMajor:String; sVersionMinor:String;
                              sVersionRelease:String; sVersionBuild:String);
begin
  DokZags.EditDokument;
  if nCurEkz=3 then begin
    DokZags.Fld('NOMER_EKZ').AsInteger:=1;
    DokZags.Fld('COPIA').AsBoolean:=true;
  end else begin
    DokZags.Fld('NOMER_EKZ').AsInteger:=nCurEkz;
  end;
//  WriteDebug(IntToStr(nCurEkz)+'  ('+sName+')');
end;

//-------------------------------------------------------------------
// �����-�� �������� ����� ������ nCurEkz ������, ���� ���������� ����������� ����� ������
procedure  Report_CheckCurEkz_End(nCurEkz:Integer; sName:String; sVersionMajor:String; sVersionMinor:String;
                              sVersionRelease:String; sVersionBuild:String);
begin
  DokZags.EditDokument;
  if nCurEkz=3 then begin
    DokZags.Fld('COPIA').AsBoolean:=false;
  end;
end;

