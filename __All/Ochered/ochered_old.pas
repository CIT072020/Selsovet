//--------------------------------------------------------------------------
//                       �������
//--------------------------------------------------------------------------

// ��������� � �������� �� ���� ����������� � ��������� ����� 
function Zajv_UchetOch(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds:TDataSet;      
  n:Integer;
begin
// showmessage('****************');
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('FIOP').AsString := GetPadegFIO3(Men.Fld('Familia').AsString,Men.Fld('Name').AsString,Men.Fld('Otch').AsString,Men.Fld('POL').AsString,'�');
     ds.Fld('MESTOJ').AsString := Men.Adres.GetAdres2(true,true,''); // Men.Adres.GetAdres()+', '+Raion_Name('')+', '+Obl_Name('') ; 
     ds.Fld('Adres').AsString := Men.Adres.GetAdres();                                     
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('PLOSH_ALL').AsString := Men.Fld('PLOSH_ALL').AsString;
     ds.Fld('KOLC').AsString := Men.Fld('KOLVO_SOSTAV').AsString;
     n:=Men.Fld('KOLVO_PROPIS').AsInteger-Men.Fld('KOLVO_SOSTAV').AsInteger;
     if n>0
       then ds.Fld('KOLC2').AsString:=IntToStr(n)
       else ds.Fld('KOLC2').AsString:='_______';
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     if not Men.Fld('DEC_TIME').IsNull
       then ds.Fld('TEKU_DATE').AsString:=ds.Fld('TEKU_DATE').AsString+', '+FormatDateTime('HH:NN',Men.Fld('DEC_TIME').AsDateTime);
     ds.Fld('SOSTAVSEM').AsString := Men.SostavSemToStr('NPP;OTN;FIO',chr(13));

     InitListStr(Men.Fld('OCHERED_DOK').AsString);
     ds.Fld('SpisDok').AsString := GetAllStr('NPP;VAL',chr(13));
     if GlobalTask.ParamAsBoolean('ADD_SPOSOB')
       then ds.Fld('SPOSOB').AsString:='������ ��������� �������� �������: '+StringOfChar('_',20);

     ds.Post;
   end;
end;

  // ������� � ����������� � ��������� �������� ������� (������� �� �����)
function SprJUch(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,sIskl,sSN,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh,sOtnosh : String;
   nID,nn : Integer;
   resh : TReshOchMen;
   dDatePost:TDateTime;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := Men;
     adr := Men.Adres;
     strKomu := m.FIO;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     s:=SpecGrafToStr(m,8,0);  // ���������� ������
     if s<>'' 
       then ds.Fld('Komu').AsString := ds.Fld('Komu').AsString + ', ' + s;
  
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
//     ds.Fld('SOSTAVSEM').AsString := Men.SostavSemToStr('NPP;OTN;FIO;Year',chr(13));
     ds.Fld('KOLC').AsString := Men.Fld('KOLVO_SOSTAV').AsString;

     resh:=Men.GetReshOch(OCH_TYPE_OBSH, OCH_RESH_POST);
     dDatePost:=resh.DateR;

     ds.Fld('DATER').AsString := DatePropis(resh.DateR,6);
     ds.Fld('NOMER').AsString := resh.Nomer;

     ds.Fld('DATEZ').AsString := DatePropis(Men.Fld('DEC_DATE').AsDateTime,6);

     ds.Fld('NOMER_OCH').AsString := Men.Fld('NOMER_OCH').AsString;   // ???
//     ds.Fld('NOMER_OCH').AsString := Men.Fld('REG_NOMER').AsString;   // ???
                                                     
     ds.Fld('REG_OSNOV').AsString := resh.GetTextOsnov(OCH_OSN_FULL2,false); // GetOsnovOcheredR('POST',resh,OCH_OSN_FULL);

     WritePodpis(ds,26);

     if Men.OtdelnoOch.RecordCount=0 then begin
       ds.Fld('DATEOT').AsString:='';
     end else begin
       Men.OtdelnoOch.First;
       ds.Fld('DATEOT').AsString := '� ��������� ������';  //� '+DatePropis(Men.OtdelnoOch.Fld('DEC_DATE').AsDateTime,6);
     end;

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Grag').AsString := '����������';
        ds.Fld('ONO').AsString := '��';
        ds.Fld('Vkl').AsString := '�������';
        ds.Fld('Gr').AsString := '���������';
        ds.Fld('Proj').AsString := '���������';
        ds.Fld('Zarm').AsString := '���������������';
        sSN := '����';
      end else begin
        ds.Fld('Grag').AsString := '���������';
        ds.Fld('ONO').AsString := '���';
        ds.Fld('Vkl').AsString := '��������';
        ds.Fld('Gr').AsString := '���������';
        ds.Fld('Proj').AsString := '���������';
        ds.Fld('Zarm').AsString := '����������������';
        sSN := '�����';
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
       ds.Fld('Jit').AsString := '�� ����� ����������'; 
     end else begin
       ds.Fld('Jit').AsString := '�� ����� ����������';
     end;
     ds.Fld('NAME_DATER').AsString := '��� ��������';

     resh:=Men.GetReshOch(OCH_TYPE_OBSH, OCH_RESH_SN);

     if (resh.Tip=OCH_RESH_SN) and (resh.DateR>dDatePost) then begin 
       sIskl:=DatePropis(resh.DateR,3)+' '+', �'+resh.Nomer
       sIskl:=sIskl+', '+resh.GetTextOsnov(OCH_OSN_FULL2,true);
       {  s:=GetOsnovOcheredR('SN', resh, OCH_OSN_FULL);
       if s<>'' then sIskl:=sIskl+', '+s;
       if resh.ADDINFO<>'' then begin
         s:=resh.ADDINFO;
         if s<>'' then sIskl:=sIskl+', '+s;
       end;}
     end else begin 
       sIskl:='';
     end;

     if sIskl<>'' then  begin
       ds.Fld('SNATIE1').AsString := Chr(13)+sSN+' � ��e�� ����������� � ��������� �������� �������'+Chr(13);
       ds.Fld('SNATIE2').AsString := sIskl+Chr(13);
     end;

     if GlobalTask.ParamAsBoolean('SPROCH_ADDTEXT') then begin
       s:='';
       if Men.Fld('GSK').AsString=''        then s:=s+'������� � ������������� ���� �� ���������.';
       if Men.Fld('SUBSID_SUMMA').AsFloat=0 then s:=s+'����������� ������������� �������� �� ������������� (�������������) ������ ����, �������� � ����, � '+
  	                                           '����� �� ������� ���� �� ����� ������������ �� ���������������.';
       ds.Fld('ADDTEXT').AsString:=s;
     end;

     ds.Post;

     ds:=GetTemplateDataSet('TABLSOST');
     //---------------------------------------------
     m.SostavSem.First;
     nn:=1;
     while not m.SostavSem.Eof do begin
       if not m.SostavSem.Fld('ISKL').AsBoolean then begin
         ds.Append;
         ds.Fld('NN').AsString := IntToStr(nn);
         nn:=nn+1;
         ds.Fld('FIO').AsString := CreateFIO(m.SostavSem);
         ds.Fld('DATER').AsString := DatePropis(m.SostavSem.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := ANSILowerCase(SeekValueSpr('������������','ID',m.SostavSem.Fld('OTNOSH').AsString,'NAME'));
         ds.Post;
       end;
       m.SostavSem.Next;
     end;
     m.SostavSem.First;
   end;
end;

//------------------------------------------
function Och_NameDelo:String;
begin
  Result:=Trim(Globaltask.ParamAsString('NAME_DELO'));
  if Result='' then Result:='������� ����� ����';
end;
//------------------------------------------
function Och_GetNameVipis(n:Integer):String;
begin
  Result:='';
  case n of 
    OCH_RESH_POST: Result:='� ���������� �� ���� �������, ����������� � ��������� �������� �������';
    OCH_RESH_VOST: Result:='� �������������� �� ����� �������, ����������� � ��������� �������� �������';
    OCH_RESH_RAZD: Result:='� ������� ������� ����������� � ��������� �������� �������';
    OCH_RESH_PERE: Result:='� �������������� ������� � ���������� �� ����������������� ����� ��� �����';
    OCH_RESH_UNION: Result:='�� ����������� ������� ����������� � ��������� �������� �������';
    OCH_RESH_SN: Result:='� ������ � ����� �������, ����������� � ��������� �������� �������';
    OCH_RESH_ADDMEN: Result:='� ��������� � ������ �����';
    OCH_RESH_ISKMEN: Result:='�� ���������� �� ������� �����';
    OCH_RESH_PERENOS: Result:='� �������� ������� ����������� � ��������� �������� �������';
  end;
end;
function Och_GetStrResh(n:Integer;lOtkaz:Boolean):String;
begin
  Result:='';
  if lOtkaz then begin
    Result:='�������� � ���������� �� ���� �������, ����������� � ��������� �������� �������:';
    if n=OCH_RESH_VOST then Result:='�������� � �������������� �� ����� �������, ����������� � ��������� �������� �������:';
  end else begin
    case n of 
      OCH_RESH_POST: Result:='��������� �� ���� �������, ����������� � ��������� �������� �������:';
      OCH_RESH_VOST: Result:='������������ �� ����� �������, ����������� � ��������� �������� �������:';
      OCH_RESH_RAZD: Result:='��������� ������� ����������� � ��������� �������� �������:';
      OCH_RESH_PERE: Result:='������������ ������� ����������� � ��������� �������� ������� � ���������� �� ����������������� ����� ��� �����:';
      OCH_RESH_UNION: Result:='���������� ������� ����������� � ��������� �������� �������:';
      OCH_RESH_SN: Result:='����� � ����� ����������� � ��������� �������� �������:';
      OCH_RESH_ADDMEN: Result:='�������� � ������ �����:';
      OCH_RESH_ISKMEN: Result:='��������� �� ������� �����';
      OCH_RESH_PERENOS: Result:='��������� ������� ����������� � ��������� �������� �������:';
    end;
  end;
end;
function Komn2Str(n:Integer):String;
var
  s:String;
begin
  Result:='';
  if n>0 then begin
    case n of
      1: s:='����';
      2: s:='����';
      3: s:='����';
      4: s:='�������';
      5: s:='����';
    else 
     s:=IntToStr(n)+'-';
    end;
    Result:=s+'��������� ��������';
  end;
end;
//--------------------------
function Och_MenToResh(Men:TMens;sSostav:String;newMen:TMens):String;
var
  sText:String;
  s,ss,sss,sPol:String;
begin
  if newMen=nil then begin
    sText:=GetPadegFIO(Men.FIO, Men.POL, '�');
    sPol:=Men.POL;
  end else begin
    sText:=GetPadegFIO(newMen.FIO, newMen.POL, '�');
    sPol:=newMen.POL;
  end;
  s:=Men.SostavSemToStr(sSostav, ', ');
  if ParamAsBoolean('RESH_NEWSEM') 
    then if Men.Fld('NEWSEM').AsBoolean then sss:=' (������� �����) ' else sss:=''
    else sss:='';
  if s='' then begin
    if sPOL='�' then s:=', ������' else s:=', ����';
    sText:=sText+s;
  end else begin
    sText:=sText+'  � ������ '+sss+Trim(IntPropis(Men.Fld('KOLVO_SOSTAV').AsInteger,'���'))+':';
    if sPOL='�' then s:=' ���, '+s else s:=' ����, '+s;
    sText:=sText+s;
  end;
  ss:=Men.Adres.GetAdres2(false,false,'');  // ���������� AdresFromID
  ss:=Trim(Men.Adres.Kv); 
  if ss<>'' then ss:=' � '+ss;
//  if sPOL='�' then s:=', ������������������� � ' else s:=', ������������������ � ';
  s:=', '+GetNameAsPol('������������',sPol)+' � ';
  if Men.Fld('RESIDENCE').AsInteger=OCH_RESID_OBSH then begin    // ���������
    s:=s+' ���������, ������� '+ss;
  end else begin
    if Men.Fld('KOLVO_KOMN_PR').AsString<>''
      then s:=s+' '+Komn2Str(Men.Fld('KOLVO_KOMN_PR').AsInteger)+ss
      else s:=s+' ��������'+ss;
    if Men.Fld('PLOSH_ALL').AsInteger>0 then begin
      if Men.Fld('TAIL').AsString<>'' then sss:=Men.Fld('TAIL').AsString+' �� ' else sss:='';
      s:=s+' ����� ��������  '+sss+Men.Fld('PLOSH_ALL').AsString+' ��.�.';
    end;
    if (Men.Fld('KOLVO_PROPIS').AsInteger>0) and ParamAsBoolean('RESH_PROPIS') then begin
      s:=s+' (����� ��������� '+Trim(IntPropis(Men.Fld('KOLVO_PROPIS').AsInteger,'���'))+')';
    end;
  end;
  if (Men.Fld('RESIDENCE').AsInteger<>OCH_RESID_OBSH) and ParamAsBoolean('RESH_TYPEHOUSE') and (Men.Fld('TYPEHOUSE').AsInteger>0) then begin  
    s:=s+', '+SeekValueSpr('�����������','ID',Men.Fld('TYPEHOUSE').AsInteger,'NAME');
  end;
  if AnsiUpperCase(Men.Adres.PunktN)=AnsiUpperCase(ParamAsString('GOROD')) then begin
    sText:=sText+s+', �� '+Men.Adres.Ulica;
  end else begin
    sText:=sText+s+', � '+Men.Adres.PunktUlica;  
  end;
  s:='';
  if Men.Adres.Dom<>'' then s:=s+'��� � '+Men.Adres.Dom;
  if Men.Adres.Korp<>'' then s:=s+' ������ � '+Men.Adres.Korp;

  if s<>'' then sText:=sText+' '+Trim(s);
  Result:=sText;
end;
//------------------------------------------
function Och_CreateTextVipis_(Men:TMens;resh:TReshOchMen;lRealDate:Boolean;nDP:Integer;lVipis:Boolean;lAddMen:Boolean; lAddToch:Boolean):String;
var
  newMen:TMens;
  sText,s,ss, sTipSostav,sDate:String;
  lIskl,l:Boolean;
  nTipText:Integer;
begin
  if lVipis then begin
    nTipText:=GlobalTask.ParamAsInteger('TEXT_OSN_VIPIS'); //OCH_OSN_POLOG;   TEXT_OSN_RESH
    if nTipText=0 then nTipText:=5;
    sTipSostav:=GlobalTask.ParamAsString('SOSTAV_VIPIS');  // 'OTN;FIO'    SOSTAV_RESH
    if sTipSostav='' then sTipSostav:='OTN;FIO';
  end else begin
    nTipText:=GlobalTask.ParamAsInteger('TEXT_OSN_RESH'); //OCH_OSN_POLOG;   TEXT_OSN_RESH
    if nTipText=0 then nTipText:=5;
    sTipSostav:=GlobalTask.ParamAsString('SOSTAV_RESH');  // 'OTN;FIO'    SOSTAV_RESH
    if sTipSostav='' then sTipSostav:='OTN;FIO';
  end;

  if resh=nil then begin 
    resh:=Men.GetReshOch(-2, 0);  // ������� �������   (-1 ��������� �������)
  end;
  sText:='';
  newMen:=nil;
  if (resh.Tip=OCH_RESH_RAZD) or (resh.Tip=OCH_RESH_PERE) or (resh.Tip=OCH_RESH_UNION) then begin
    newMen:=TMens.Create;
    // �� ������ ��������, ���, ������. ���., ��������, ������, �������
    newMen.ReadEx(resh.ID2,'MIGR=0,VUS=0,ADD=0,PR_LG_HIST=0'); //Men.ReshOch.Fld('ID2').AsInteger);   'ALLADD=0'
  end;
  if lRealDate
    then sDate:=DatePropis(resh.DateSilaResh,nDP)
    else sDate:='#DATEPOST&';
  if (resh.Tip=OCH_RESH_POST) or (resh.Tip=OCH_RESH_VOST) or (resh.Tip=OCH_RESH_SN) then begin // ����������, ����������., ������
    if lAddMen then sText:=Och_MenToResh(Men,sTipSostav,nil);
    if resh.ochered_id=OCH_TYPE_OBSH then ss:=' �� ������ ������' else ss:=' �� ���������� ������ ('+NameOtdOch(resh.ochered_id,false)+')';
    sText:=sText+ss;
    sText:=sText+' � '+sDate+' �� ��������� '+resh.GetTextOsnov(nTipText,true)+'.';
    if (resh.Tip=OCH_RESH_VOST) then begin
      if GlobalTask.ParamAsBoolean('RESH_ADD_OTM') then begin
        Men.FillReshOch(_resh, resh.OCHERED_ID, OCH_RESH_SN);  // ��� ������� ������� ���� ������� � ������
        if _resh.TIP=OCH_RESH_SN then sText:=sText+' �������� ������� � ������ �� '+DatePropis(_resh.DateR,nDP)+' � '+_resh.Nomer+'.';
      end;
    end;
  end else if (resh.Tip=OCH_RESH_RAZD)  then begin   // ����������
    sText:=Och_MenToResh(Men,sTipSostav,nil);
    s:='����� ����� '+GetPadegFIO(newMen.FIO,newMen.POL,'�')+' ��������� �� ���� ����������� � ��������� �������� ������� �������� �� ������ ����� ';
    if resh.ochered_id=OCH_TYPE_OBSH then ss:=' � ����� ������' else ss:=' � ��������� ������ ('+NameOtdOch(resh.ochered_id,false)+')';
    sText:=sText+'. '+s+' � '+sDate+' �� ��������� '+Resh.GetTextOsnov(nTipText,true);
  end else if (resh.Tip=OCH_RESH_PERE)  then begin   // ��������������
//   writedebug('OCH_RESH_PERE');
    sText:=Och_MenToResh(Men,sTipSostav+'+CHK_OTN+MEN-'+IntToStr(resh.ID2),newMen);
  end else if (resh.Tip=OCH_RESH_UNION)  then begin   // �����������
    sText:=Och_MenToResh(Men,sTipSostav,nil);
    s:=Och_MenToResh(newMen,sTipSostav,nil);
    sText:=sText+' � '+s+' c '+sDate;
  end;
  FreeAndNil(newMen);
  if lAddToch then begin
    if (trim(sText)<>'') and (RightStr(sText,1)<>'.') 
      then Result:=sText+'.' 
      else Result:=sText;
  end else begin
    if (trim(sText)<>'') and (RightStr(sText,1)='.') 
      then Result:=Copy(sText,1,Length(stext)-1)
      else Result:=sText;
  end;
end;
const
  OCH_DATEPROPIS=3;
//------------------------------------------
function Och_CreateTextIzv(lRealDate:Boolean):String;   // ���������� � fOcheredOper
var
  nDP:Integer;
begin
  nDP:=OCH_DATEPROPIS;  // ��� DatePripis(dDate, nDP)
//  Result:=Och_CreateTextVipis_(Men,nil,lRealDate,nDP,TYPE_IZV); // !!!          // TYPE_IZV=3; TYPE_VIPIS=2; TYPE_RESH=1;
end;
//------------------------------------------
function Och_CreateTextResh(lRealDate:Boolean):String;   // ���������� � fOcheredOper
var
  nDP:Integer;
begin
  nDP:=OCH_DATEPROPIS;  // ��� DatePripis(dDate, nDP)
  Result:=Och_CreateTextVipis_(Men,nil,lRealDate,nDP,false,true,true);
end;
//------------------------------------------
function Och_CreateTextVipis(lRealDate:Boolean):String;   // ���������� � fOcheredOper
var
  nDP:Integer;
begin
  nDP:=OCH_DATEPROPIS;  // ��� DatePripis(dDate, nDP)
  Result:=Och_CreateTextVipis_(Men,nil,lRealDate,nDP,true,true,true);
end;
//------------------------------------------
function VipiskaReshAll(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds:TDataSet;
  lCur:Boolean;
  sText,s,ss,sNomPril:String;
  nDP,i:Integer;
  lOtkaz,lIskl,l:Boolean;
  sl:TStringList;
  r1,r2:TReshOchMen;
begin
//Men.OtdelnoOch: TDataSet;
//Men.ReshOch: TDataSet;
  nDP:=OCH_DATEPROPIS; 
  Result:=true;
  if GetTemplateParam('PAR2')='CUR' then lCur:=true else lCur:=false;
  r1:=TReshOchMen.Create;
  r2:=TReshOchMen.Create;
  sl:=TStringList.Create;
  try
  ds:=GetTemplateDataSet('MAIN');
  ds.Edit;
  if lCur then begin
    Men.FillReshOch(r1,-2,0);  // ������� �������  
  end else begin
    Men.FillReshOch(r1,-4,0);  // ����� ��������� �������
    sl.Add('2');
    Men.AllReshOch(sl,r1.DateR,r1.Nomer);  // 2 ������� �� ������ � ����
//    writedebug('sl.count='+inttostr(sl.count));
    for i:=0 to sl.Count-1 do begin
      if i=0 then Men.FillReshOch(r1,-4,StrToInt(sl.Strings[i]));  // 
      if i=1 then Men.FillReshOch(r2,-4,StrToInt(sl.Strings[i]));  // 
    end;
  end;
  WritePodpis(ds, GetTemplateParam('PAR1') );  // !!!!
  AddDolgPodpis(ds, '�����'+CRLF, true);
  ds.Fld('NOMER').AsString:=r1.Nomer; // Men.ReshOch.Fld('NOMER').AsString;
  if r1.dateR=0 //Men.ReshOch.Fld('DATER').IsNull 
     then ds.Fld('DATER').AsString:='"___" _____________'
     else ds.Fld('DATER').AsString:=DatePropis(r1.dateR,nDP); // Men.ReshOch.Fld('DATER').AsDateTime,6);
  ds.Fld('TYPE_VIP').AsString:=Och_GetNameVipis(r1.TIP); //Men.ReshOch.Fld('TIP').AsInteger);

  if podpis_shtamp()<1  // ���� ������ ���, �� ������� ������������
    then ds.Fld('NAME').AsString:=NameOrg('�','�');   

  if r1.Tip=OCH_RESH_SN then begin
    ds.Fld('SLUSH').AsString:='���������� '+ds.Fld('TYPE_VIP').AsString
    lIskl:=true;
  end else begin
    ds.Fld('SLUSH').AsString:='��������� '+ds.Fld('TYPE_VIP').AsString;
    lIskl:=false;
  end;

  if podpis_shtamp()<1 then begin
    if r1.Tip=OCH_RESH_SN then  sNomPril:='12' else if r1.Tip=OCH_RESH_RAZD then sNomPril:='6' else if r1.Tip=OCH_RESH_UNION then sNomPril:='7' else if r1.Tip=OCH_RESH_PERE then sNomPril:='8' else sNomPril:='4';
    ds.FieldByName('PRIL').AsString:='���������� '+sNomPril+CRLF+'� ������������� '+CRLF+'������������ �������-'+CRLF+'������������� ���������'+CRLF+
                                     '���������� ��������'+CRLF+'27.12.2010 � 28';
  end;
  ds.Fld('RESH').AsString:=Och_GetStrResh(r1.Tip,r1.Otkaz);

  if r1.Text(true)='' 
    then sText:=Och_CreateTextVipis_(Men,r1,true,nDP,true,true,true)
    else sText:=r1.CheckFieldsInText(r1.Text(true),nDP);    // nDP - �������� ��� DatePropis

  if lIskl then begin
    if r2.Tip>-1 then begin
      sText:=CheckZnackDel(sText,'.');
      if r2.Text(true)='' 
        then sText:=sText+' � '+Och_CreateTextVipis_(Men,r2,true,nDP,true,false,false)
        else sText:=sText+' � '+r2.CheckFieldsInText(r2.Text(true),nDP);    // nDP - �������� ��� DatePropis
      sText:=CheckZnack(sText,'.');
    end;
  end else begin
    s:=Men.NomerOch(r1.ochered_id,'RESH_ADD_NOMER');  // � ������ ���������
    if s<>'' then begin 
      if r2.Tip=-1 then sText:=sText+CRLF+'����� ������� '+s+'.'
                   else sText:=CheckZnackDel(sText,'.')+', ����� ������� '+s;
    end;
    if r2.Tip>-1 then begin
      if r2.Text(true)='' 
        then sText:=sText+' � '+Och_CreateTextVipis_(Men,r2,true,nDP,true,false,false)
        else sText:=sText+' � '+r2.CheckFieldsInText(r2.Text(true),nDP);    // nDP - �������� ��� DatePropis
      sText:=CheckZnackDel(sText,'.');
      ss:=Men.NomerOch(r2.ochered_id,'RESH_ADD_NOMER');  // � ������ ���������
      if ss<>'' then sText:=sText+', ����� ������� '+ss;
      sText:=CheckZnack(sText,'.');
    end;
  end;
  s:=GetNomerDelo(Men.Fld('DELO').AsString);   // � ������ ���������
  if s<>'' then sText:=sText+CRLF+Och_NameDelo()+' '+s+'.';
  ds.Fld('TEXT').AsString:=sText;
  ds.Post;

  finally
    sl.Free;
    r1.Free;
    r2.Free;
  end;
end;
//------------------------------------------
function VipiskaReshList(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  curMen:TMens;
  sl:TStringList;
  q,ds,dsOch,dsResh :TDataSet;
  sSQL,sWhere,sText,s,ss,sSam,sNomPril,sNomer:String;
  dDate:TDateTime;
  nDP,m,n,nTipText,nType:Integer;
  lOk,lOtkaz,lIskl,lAdd,lVipiska:Boolean;
  reshOb,reshOtd,r1,r2:TReshOchMen;
begin
  nDP:=OCH_DATEPROPIS; 
  Result:=RunFormEx('CreateReshOch','ONLY_NOMER_DATE=1');
  if not Result then exit;
  nType:=GlobalTask.GetLastValueAsInteger('TYPE_RESH');
  sNomer:=GlobalTask.GetLastValueAsString('NOMER_RESH');
  if Trim(GlobalTask.GetLastValueAsString('DATE_RESH'))<>''
    then dDate:=GlobalTask.GetLastValueAsDate('DATE_RESH')
    else dDate:=0;
  nTipText:=GlobalTask.ParamAsInteger('TEXT_OSN_IZV'); //OCH_OSN_POLOG;   TEXT_OSN_RESH
  dsResh:=dmBase.GetDataSet('tbOcheredResh');
  dsOch:=dmBase.GetDataSet('tbOchered');
  sWhere:=' r.nomer='+QStr(sNomer);
  if dDate>0  then sWhere:=sWhere+' and r.dater='+DateToSQL(dDate);
  if nType>0  then sWhere:=sWhere+' and r.tip='+IntToStr(nType);
  sWhere:=globaltask.AddWhereCurIdBase(sWhere,'o');
  sSQL:='SELECT distinct r.ID FROM OcheredResh r '+
        'LEFT JOIN Ochered o ON o.ochered_id=r.ochered_id and o.id=r.id '+
        ' WHERE ' +sWhere+
        ' ORDER BY dec_date, dec_time';
  sl:=TStringList.Create;
  curMen:=TMens.Create;
  if Copy(ANSIUpperCase(GetTemplateParam('PAR2')),1,5)='VIPIS' then lVipiska:=true else lVipiska:=false;
  
  OpenMessage(' ������������ ...                 ','',10);
  try
  reshOb:=TReshOchMen.Create;
  reshOtd:=TReshOchMen.Create;
  q:=dbOpenSQL(sSQL,'');
  lOk:=false;
  ds:=GetTemplateDataSet('TABLSOST');
  while not q.Eof do begin
    curMen.ReadEx(q.Fld('ID').AsInteger, 'MIGR=0,VUS=0,ADD=0,PR_LG_HIST=0'); //'ALLADD=0'
    if curMen.Value('POL')='�' then sSam:='���' else sSam:='����';
    sl.Clear;
    r1:=nil; 
    r2:=nil;
    reshOb.Clear;
    reshOtd.Clear;
    sl.Clear;
    curMen.AllReshOch(sl,dDate, sNomer);  // ��� ������� �� ������ � ����
    for m:=0 to sl.Count-1 do begin
      curMen.FillReshOch(_resh, -4, StrToInt(sl.Strings[m])); // ������� �� AUTO_ID
      if (_resh.ochered_id=0) and (_resh.Tip>-1)
        then curMen.FillReshOch(reshOb, -4, StrToInt(sl.Strings[m]));  // ������� �� AUTO_ID
      if (_resh.ochered_id>0) and (_resh.Tip>-1)
        then curMen.FillReshOch(reshOtd, -4, StrToInt(sl.Strings[m])); // ������� �� AUTO_ID
    end;
    if reshOb.Tip>-1 then begin 
      r1:=reshOb;                            // ������ �������
      if reshOtd.Tip>-1 then r2:=reshOtd;    // ������ �������
    end else begin
      r1:=reshOtd;                           // ������ ������ �������
    end;
    lOk:=true;
    ds.Append;
    WritePodpis(ds, GetTemplateParam('PAR1') );  // !!!!
    sText:='';
    lAdd:=false;
    IF lVipiska THEN BEGIN //---------------- �������
      lAdd:=true;
      ds.Fld('NOMER').AsString:=r1.Nomer; 
      if r1.DateR=0 then ds.Fld('DATER').AsString:='"___" _____________'  else ds.Fld('DATER').AsString:=DatePropis(r1.dateR,nDP);
      ds.Fld('TYPE_VIP').AsString:=Och_GetNameVipis(r1.TIP); 
      AddDolgPodpis(ds, '�����'+CRLF, true);
      if podpis_shtamp()<1  // ���� ������ ���, �� ������� ������������
        then ds.Fld('NAME').AsString:=NameOrg('�','�');   
      if r1.Tip=OCH_RESH_SN then begin
        ds.Fld('SLUSH').AsString:='���������� '+ds.Fld('TYPE_VIP').AsString
        lIskl:=true;
      end else begin
        ds.Fld('SLUSH').AsString:='��������� '+ds.Fld('TYPE_VIP').AsString;
        lIskl:=false;
      end;
      if podpis_shtamp()<1 then begin
        if r1.Tip=OCH_RESH_SN then  sNomPril:='12' else if r1.Tip=OCH_RESH_RAZD then sNomPril:='6' else if r1.Tip=OCH_RESH_UNION then sNomPril:='7' else if r1.Tip=OCH_RESH_PERE then sNomPril:='8' else sNomPril:='4';
          ds.FieldByName('PRIL').AsString:='���������� '+sNomPril+CRLF+'� ������������� '+CRLF+'������������ �������-'+CRLF+'������������� ���������'+CRLF+
                                           '���������� ��������'+CRLF+'27.12.2010 � 28';
      end;
      ds.Fld('RESH').AsString:=Och_GetStrResh(r1.Tip,r1.Otkaz);
      if r1.Text(true)='' 
        then sText:=Och_CreateTextVipis_(curMen,r1,true,nDP,true,true,true)
        else sText:=r1.CheckFieldsInText(r1.Text(true),nDP);    // nDP - �������� ��� DatePropis
      if lIskl then begin
        if r2<>nil then begin
          sText:=CheckZnackDel(sText,'.');
          if r2.Text(true)='' 
            then sText:=sText+' � '+Och_CreateTextVipis_(curMen,r2,true,nDP,true,false,false)
            else sText:=sText+' � '+r2.CheckFieldsInText(r2.Text(true),nDP);    // nDP - �������� ��� DatePropis
          sText:=CheckZnack(sText,'.');
        end;
      end else begin
        s:=curMen.NomerOch(r1.ochered_id,'RESH_ADD_NOMER');  // � ������ ���������
        if s<>'' then begin 
          if r2=nil then sText:=sText+CRLF+'����� ������� '+s+'.'
                    else sText:=CheckZnackDel(sText,'.')+', ����� ������� '+s;
        end;
        if r2<>nil then begin
          sText:=CheckZnackDel(sText,'.');
          if r2.Text(true)='' 
            then sText:=sText+' � '+Och_CreateTextVipis_(curMen,r2,true,nDP,true,false,false)
            else sText:=sText+' � '+r2.CheckFieldsInText(r2.Text(true),nDP);    // nDP - �������� ��� DatePropis
          ss:=curMen.NomerOch(r2.ochered_id,'RESH_ADD_NOMER');  // � ������ ���������
          if ss<>'' then sText:=sText+', ����� ������� '+ss;
          sText:=CheckZnack(sText,'.');
        end;
      end;
    END ELSE BEGIN      // --------------------- ���������
      ds.Fld('FIOP').AsString := GetPadegFIO3(curMen.Fld('Familia').AsString,curMen.Fld('Name').AsString,curMen.Fld('Otch').AsString,curMen.Fld('POL').AsString,'�');
      ds.Fld('MESTOJ').AsString := curMen.Adres.GetAdres2(true,true,''); //Men.Adres.GetAdres()+', '+Raion_Name('')+', '+Obl_Name('') ;                                           
      ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
//       resh:=Men.GetReshOch(OCH_TYPE_OBSH, OCH_RESH_POST);
      ds.Fld('DATER').AsString := DatePropis(r1.DateR,6);
      ds.Fld('NOMER').AsString := r1.Nomer;
      if r1.TIP=OCH_RESH_SN then begin
        lAdd:=true;
        ds.Fld('NAME_IZV').AsString:='� ������ ������� � ����� ����������� � ��������� �������� �������';
        sText:='�� ��������� '+r1.GetTextOsnov(nTipText,false)+'�� � ������ '+curMen.Fld('KOLVO_SOSTAV').AsString+' ���., '+sSam+','+
               curMen.SostavSemToStr('OTN;FIO;YEAR',', ')+' ����� � ����� ����������� � ��������� �������� ������� �� '+
               r1.NameList(2,'�')+' � '+DatePropis(r1.DateR,6);
        if r2<>nil then sText:=sText+' � �� '+r2.NameList(2,'�')+' � '+DatePropis(r2.DateR,6);
        sText:=sText+'.';
      end else if (r1.TIP=OCH_RESH_POST) or (r1.TIP=OCH_RESH_VOST) then begin
        lAdd:=true;
        if _resh.TIP=OCH_RESH_POST then s:='���������� �� ����' else s:='������������� �� �����';
        ds.Fld('NAME_IZV').AsString:='� ���������� �� ���� (�������������� �� �����) �������,����������� � ��������� �������� �������';
        sText:='�� � ������ '+curMen.Fld('KOLVO_SOSTAV').AsString+' ���.: '+sSam+', '+curMen.SostavSemToStr('OTN;FIO;YEAR',', ')+s+
               ' �������, ����������� � ��������� �������� �������, � �������� � ����� ������ � '+DatePropis(curMen.Fld('DEC_DATE').AsDateTime,6);
        s:=curMen.NomerOch(r1.ochered_id,'RESH_ADD_NOMER');  // � ������ ���������
        if s<>'' then begin 
          if r2=nil then sText:=sText+CRLF+'����� ������� '+s+'.'
                    else sText:=sText+', ����� ������� '+s;
        end;
        if r2<>nil then begin 
          sText:=sText+' � '+r2.NameList(2, '�')+' � '+DatePropis(r2.DateSilaResh,6);
          ss:=curMen.NomerOch(r2.ochered_id,'RESH_ADD_NOMER');  // � ������ ���������
          if ss<>'' then sText:=sText+', ����� ������� '+ss;
          sText:=CheckZnack(sText,'.');
        end;
      end;
    END;
    s:=GetNomerDelo(curMen.Fld('DELO').AsString);   // � ������ ���������
    if s<>'' then sText:=sText+CRLF+Och_NameDelo()+' '+s+'.';
    ds.Fld('TEXT').AsString:=sText;
    ds.Fld('PPP').AsString:='\page';
    if lAdd then ds.Post else ds.Cancel;
    q.Next;
  end;
  if lOk then begin
    ds.Edit;
    ds.Fld('PPP').AsString:='';
    ds.Post;
  end;
  finally
    reshOb.Free;
    reshOtd.Free;
    dbClose(q);
    CloseMessage;
    sl.Free;
    curMen.Free;
  end;
end;
// ---------------------------
// ��������� � �������� �� ���� ����������� � ��������� ����� 
function IZV_UchetOch(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsR: TDataSet;      
   s,ss,sText,sNomer,sNomerOtd, sOb,sOtd : String;
   resh : TReshOchMen;
   i,n,nID:Integer;
   sl:TStringList;
   lPost:Boolean;
begin
// showmessage('****************');
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     sOb:='';  sOtd:='';
     resh:=Men.GetReshOch(-1, OCH_RESH_POST);   // ��������� ��������� � ���������� ��������������
     if resh.tip>-1 then begin  // ������� ����
       if resh.Tip=OCH_RESH_POST then lPost:=true else lPost:=false;
       sl:=TStringList.Create;
       Men.AllReshOch(sl,resh.DateR,resh.Nomer);  // ��� ������� �� ������ � ����
       for i:=0 to sl.Count-1 do begin
         resh:=Men.GetReshOch(-4, StrToInt(sl.Strings[i])); // ������� �� AUTO_ID
         n:=resh.Ochered_ID;
         s:=resh.nameList(2,'�')+' � '+DatePropis(Men.DatePostOch(n),6);
         ss:=Men.NomerOch(n,'RESH_ADD_NOMER');
         if ss<>'' then ss:=', ����� ������� '+ss;
         if n=0 then begin 
           sOb:=s;
           if ss<>'' then sOb:=sOb+ss;
         end else begin 
           sOtd:=s;
           if ss<>'' then sOtd:=sOtd+ss;
         end;
       end;
       sl.Free;
       if not ds.Active then ds.Open;
       ds.Edit;
       if lPost then ds.Fld('TEXT_POST').AsString :='���������� �� ����' else ds.Fld('TEXT_POST').AsString :='������������� �� �����';
       ds.Fld('FIOP').AsString := GetPadegFIO3(Men.Fld('Familia').AsString,Men.Fld('Name').AsString,Men.Fld('Otch').AsString,Men.Fld('POL').AsString,'�');
       ds.Fld('MESTOJ').AsString := Men.Adres.GetAdres2(true,true,''); //Men.Adres.GetAdres()+', '+Raion_Name('')+', '+Obl_Name('') ;                                           
       ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
//       resh:=Men.GetReshOch(OCH_TYPE_OBSH, OCH_RESH_POST);
       ds.Fld('DATER').AsString := DatePropis(resh.DateR,6);
       ds.Fld('NOMER').AsString := resh.Nomer;
       ds.Fld('KOLC').AsString := Men.Fld('KOLVO_SOSTAV').AsString;
       ds.Fld('SOSTAVSEM').AsString := Men.SostavSemToStr('OTN;FIO;YEAR',', ');
       ds.Fld('DATEO').AsString := sOb;
       if (sOb<>'') and (sOtd<>'') then  sOtd:=' � '+sOtd;
       ds.Fld('DATEOT').AsString := sOtd+'.';
       sText:='';
       s:=GetNomerDelo(Men.Fld('DELO').AsString);   // � ������ ���������
       if s<>'' then sText:=sText+Och_NameDelo()+' '+s+'.';
       ds.Fld('TEXT').AsString := sText;

       WritePodpis(ds,24);

       ds.Post;
     end;
   end;
end;
// --------------------------------------
// ��������� � ������ � ����� ����������� � ��������� ����� 
function IZV_SnOch(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds : TDataSet;      
   sOsnov,sOb,sOtd,s,ss : String;
   resh : TReshOchMen;
   nTipText,i,n:Integer;
   sl:TStringList;
begin
// showmessage('****************');
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   nTipText:=GlobalTask.ParamAsInteger('TEXT_OSN_IZV'); //OCH_OSN_POLOG;   TEXT_OSN_RESH
   if nTipText=0 then nTipText:=5;

   if ds<>nil then begin
     resh:=Men.GetReshOch(-1, OCH_RESH_SN); //��������� ������� � ������
     if resh.tip>-1 then begin  // ������� ����
       sOsnov:=''; sOb:=''; sOtd:='';
       sl:=TStringList.Create;
       Men.AllReshOch(sl,resh.DateR,resh.Nomer);  // ��� ������� �� ������ � ����
       for i:=0 to sl.Count-1 do begin
         resh:=Men.GetReshOch(-4, StrToInt(sl.Strings[i])); // ������� �� AUTO_ID
         n:=resh.Ochered_ID;
         s:=' �� '+resh.nameList(2,'�')+' � '+DatePropis(resh.DateR,6);
         if n=0 then begin 
           sOb:=s;
           if ss<>'' then sOb:=sOb+ss;
           sOsnov:=resh.GetTextOsnov(nTipText,false);
         end else begin 
           sOtd:=s;
           if ss<>'' then sOtd:=sOtd+ss;
           if sOsnov='' then sOsnov:=resh.GetTextOsnov(nTipText,false);
         end;
       end;
       sl.Free;
       if not ds.Active then ds.Open;
       ds.Edit;
       ds.Fld('FIOP').AsString := GetPadegFIO3(Men.Fld('Familia').AsString,Men.Fld('Name').AsString,Men.Fld('Otch').AsString,Men.Fld('POL').AsString,'�');
       if Men.Fld('NEW_ADRES_ID').AsInteger>0
         then ds.Fld('MESTOJ').AsString:=dmBase.AdresFromID(STOD(datecursostS,''),Men.Fld('NEW_ADRES_ID').AsString,false)
         else ds.Fld('MESTOJ').AsString:=Men.Adres.GetAdres2(true,true,''); //Men.Adres.GetAdres()+', '+Raion_Name('')+', '+Obl_Name('');
       ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
       ds.Fld('KOLC').AsString := Men.Fld('KOLVO_SOSTAV').AsString;
       ds.Fld('SOSTAVSEM').AsString := Men.SostavSemToStr('OTN;FIO;YEAR',', ');
       ds.Fld('DATER').AsString := DatePropis(resh.DateR,6);
       ds.Fld('NOMER').AsString := resh.Nomer;
       ds.Fld('ISK_OSNOV').AsString := sOsnov;
       if sOb<>'' then begin
         ds.Fld('DATEO').AsString:=sOb;
         s:=' � ';
       end;
       if sOtd<>'' 
        then ds.Fld('DATEOT').AsString:=sOtd;
       WritePodpis(ds,25);
       ds.Post;
     end;
   end;
end;
//---------------------------------------------------------------------
function _CreateReshOch_UserForm:boolean;
var
  f:TfmParamQuest;
  n:Integer;
begin
  Result:=RunForm('CreateReshOch');
end;
//---------------------------------------------------------------------
function CreateReshOch(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  q,dsResh,ds,dsTb:TDataSet;
  sText,s,ss,sWhere,sSQL:String;
  sNomer,sNewNomer,sResh,sFirst:String;
  dDate,dNewDate:TDateTime;
  nDP,n,i,j,nPunkt,m:Integer;
  lOtkaz,lIskl,l,lCheckPlan,lVipiska:Boolean;
  resh:TReshOchMen;
  arrType: array[1..9] of integer;
  curMen:TMens;
  sl,slN:TStringList;
begin
  Result:=RunFormEx('CreateReshOch',''); // 'ONLY_NOMER_DATE=1');
  if not result then exit;
//Men.OtdelnoOch: TDataSet;
//Men.ReshOch: TDataSet;
  Result:=true;
  nDP:=OCH_DATEPROPIS; 
  sNomer:=GlobalTask.GetLastValueAsString('NOMER_RESH');
  if GlobalTask.GetLastValueAsString('CHECK_PLAN')='1'
    then lCheckPlan:=true else lCheckPlan:=false;
  if Trim(GlobalTask.GetLastValueAsString('DATE_RESH'))<>''
    then dDate:=GlobalTask.GetLastValueAsDate('DATE_RESH')
    else dDate:=0;
  sNewNomer:=GlobalTask.GetLastValueAsString('NEW_NOMER_RESH');
  dNewDate:=GlobalTask.GetLastValueAsDate('NEW_DATE_RESH');
  dsResh:=dmBase.GetDataSet('tbOcheredResh');
  sWhere:=' r.nomer='+QStr(sNomer);
  if dDate>0 
    then sWhere:=sWhere+' and r.dater='+DateToSQL(dDate);
  sWhere:=globaltask.AddWhereCurIdBase(sWhere,'o');

  sSQL:='SELECT r.*, o.nomer_och FROM OcheredResh r '+
        'LEFT JOIN Ochered o ON o.ochered_id=r.ochered_id and o.id=r.id '+
        ' WHERE ' +sWhere+
        ' ORDER BY dec_date, dec_time';
  sl:=TStringList.Create;
  slN:=TStringList.Create;
  if Copy(ANSIUpperCase(GetTemplateParam('PAR1')),1,6)='RESHEN' then begin
    lVipiska:=true;
  end else begin
    lVipiska:=false;
  end;
//ReshenAll
  try
    OpenMessage(' ������������ ...                 ','',10);
    curMen:=TMens.Create;
    q:=dbOpenSQL(sSQL,'');
    while not q.Eof do begin
      sl.Add(q.FieldByName('AUTO_ID').AsString);
      slN.Add(q.FieldByName('NOMER_OCH').AsString);
      q.Next;
    end;
    dbClose(q);
    if (sNewNomer<>'') or (dNewDate>0) or lCheckPlan then begin
      for m:=0 to sl.Count-1 do begin
        if dbLocate(dsResh,'AUTO_ID', [ sl.Strings[m] ],'') then begin
          dsResh.Edit;
          if sNewNomer<>'' then dsResh.Fld('NOMER').AsString:=sNewNomer;
          if dNewDate>0    then begin 
            dsResh.Fld('DATER').AsDateTime:=dNewDate;
            dsResh.Fld('DATE_SORT').AsDateTime:=dNewDate;
          end;
          if lCheckPlan then  dsResh.Fld('PLAN').AsBoolean:=false;
          dsResh.Post;
        end;
      end;
      if sNewNomer<>'' then sNomer:=sNewNomer;
      if dNewDate>0    then dDate:=dNewDate;
      sWhere:=' r.nomer='+QStr(sNomer);
      if dDate>0 
        then sWhere:=sWhere+' and r.dater='+DateToSQL(dDate);
      sWhere:=globaltask.AddWhereCurIdBase(sWhere,'o');
      sSQL:='SELECT r.*, o.nomer_och FROM OcheredResh r '+
            'LEFT JOIN Ochered o ON o.ochered_id=r.ochered_id and o.id=r.id '+
            ' WHERE ' +sWhere+
            ' ORDER BY dec_date, dec_time';
//    writedebug(sSQL);
      sl.Clear;
      slN.clear;
      q:=dbOpenSQL(sSQL,'');
      while not q.Eof do begin
        sl.Add(q.FieldByName('AUTO_ID').AsString);
        slN.Add(q.FieldByName('NOMER_OCH').AsString);
        dmBase.SetIDLastReshOcheredMen(q.FieldByName('ID').AsInteger);
        q.Next;
      end;
      dbClose(q);
    end;

    dsTb:=GetTemplateDataSet('TB_PRIN');
    ds:=GetTemplateDataSet('MAIN');
    ds.Edit;
    ds.Fld('NOMER').AsString:=sNomer;
    if dDate>0
     then ds.Fld('DATER').AsString:=datePropis(dDate,3);
    s:=GetOrganResh(0);
    if Pos('�������������',AnsiUpperCase(s))>0 then s:=s+' ������' else s:=s+' �����';
    ds.Fld('NAME').AsString:=s;
    WritePodpis(ds, GetTemplateParam('PAR1') );  // !!!!
    ds.Post;
//    AddDolgPodpis(ds, '�����'+CRLF, true);
//    if podpis_shtamp()<1  // ���� ������ ���, �� ������� ������������
//      then ds.Fld('NAME').AsString:=NameOrg('�','�');   
    arrType[1]:=OCH_RESH_POST; arrType[2]:=OCH_RESH_VOST; arrType[3]:=OCH_RESH_RAZD; 
    arrType[4]:=OCH_RESH_PERE; arrType[5]:=OCH_RESH_UNION; arrType[6]:=OCH_RESH_SN;
    arrType[7]:=OCH_RESH_ADDMEN; arrType[8]:=OCH_RESH_ISKMEN; ; arrType[9]:=OCH_RESH_PERENOS;
    nPunkt:=1;
    sResh:=''
    for i:=1 to 9 do begin
      for j:=1 to 2 do begin
        n:=1;
        sFirst:='';
        sText:='';
        sResh:='';
        dsResh.First;
        if j=1 then lOtkaz:=false else lOtkaz:=true;

        for m:=0 to sl.Count-1 do begin
          if dbLocate(dsResh,'AUTO_ID', [ sl.Strings[m] ],'') then begin
//        while not dsResh.Eof do begin
            dmBase.FillReshOch(_resh, -1);  // ������� ������� � ������� tbOcheredResh
            if (_resh.TIP=arrType[i]) and (_resh.OTKAZ=lOtkaz) and not _resh.Razdel then begin
              if sFirst='' then sFirst:=IntToStr(nPunkt)+'. '+Och_GetStrResh(_resh.Tip,_resh.Otkaz);  // ������ ������ ���
              curMen.ReadEx(dsResh.Fld('ID').AsInteger,'MIGR=0,VUS=0,ADD=0,PR_LG_HIST=0'); //'ALLADD=0'
              if _resh.Text(false)='' then begin  // ����� ��� �������
                sText:=Och_CreateTextVipis_(curMen,_resh,true,nDP,false,true,true);
              end else begin
                // ������� #DATEPOST&
                sText:=_resh.CheckFieldsInText(_resh.Text(false),nDP);    // nDP - �������� ��� DatePropis
              end;
              sText:=chr(9)+IntToStr(nPunkt)+'.'+IntToStr(n)+ '. '+sText;
              if _resh.TIP<>OCH_RESH_SN then begin
//                s:=Trim(GetNomerOch(curMen.DataSet));
                s:=Trim(slN.Strings[m]); //Trim(GetNomerOch(curMen.DataSet));
                if s='0' then s:='';
                if Globaltask.ParamAsBoolean('RESH_ADD_NOMER') and (s<>'') then sText:=sText+' ����� ������� '+s+'.';
              end;

              s:=Trim(curMen.Fld('DELO').AsString);
              if Globaltask.ParamAsBoolean('RESH_ADD_DELO') and (s<>'') then sText:=sText+' '+Och_NameDelo()+' '+s+'.';

              n:=n+1;
              sResh:=sResh+sText+CRLF;
            end;
          end;
//          dsResh.Next;
        end;
        if sFirst<>'' then begin   // ��� ����-�� ���� �������
          nPunkt:=nPunkt+1;
          dsTb.Append;
          dsTb.Fld('TEXT').AsString:=Chr(9)+sFirst+CRLF+sResh;
          dsTb.Post;
        end;
      end;
    end;
  finally
    CloseMessage();
    sl.Free;
    slN.Free;
    curMen.Free;
    dsResh.Filter:='';
    dsResh.Filtered:=false;
  end;
//  s:='select * from OcheredResh where nomer='
//  q:=dbOpenSQL(sSQL,'');
end;
