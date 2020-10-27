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
    ds.Fld('NAMESPIS').AsString:='Общий список';
    ds.Fld('PRIL_NOM').AsString:='10';
  end else begin
    ds.Fld('NAMESPIS').AsString:='Отдельный список ('+ValueFromKey('KEY_TYPEOCHERED',q.Fld('OCHERED_ID').AsString,'',false)+')';
    ds.Fld('PRIL_NOM').AsString:='11';
  end;
  ds.Fld('NAME').AsString:=NameOrg('','');
  ds.Fld('DATER').AsString:=DatePropis(Now,1);
  ds.Fld('DOLG').AsString :=Ochered_Dolg;
  ds.Fld('RUKOV').AsString :=Ochered_FIO;
  s:='Дата и время принятия на учет, номер решения';
  if lSocial then begin
    ds.Fld('GR6').AsString :=s;
    ds.Fld('GR7').AsString :='Основания включения в список';
    ds.Fld('GR8').AsString :='Количество человек прописанных в жилом помещении';
    ds.Fld('GR9').AsString :='Отметка о предоставлении жилого помещения социального пользования (адрес, его размер, номер и дата договора найма)';
    ds.Fld('GR10').AsString:='Решение о снятии с учета или предоставлении жилого помещения социального пользования';
  end else begin
    ds.Fld('GR6').AsString :='Основания принятия на учет нуждающихся в улучшении жилищных условий';
    ds.Fld('GR7').AsString :=s;
    ds.Fld('GR8').AsString :='Где еще принят на учет и с какого времени';
    ds.Fld('GR9').AsString :='Отметка о предоставлении жилого помещения (адрес, его размер, номер и дата договора найма) либо предоставление льготного кредита';
    ds.Fld('GR10').AsString:='Решение о снятии с учета или предоставлении жилого помещения либо льготного кредита, субсидий и иных форм государственной поддержки для строительства (реконструкции) или приобретения жилых помещений';
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
      ds.Fld('POMESH').AsString:=q.Fld('KOLVO_KOMN_PR').AsString+' комн.';
      ds.Fld('POMESH').AsString:=ds.Fld('POMESH').AsString+', '+q.Fld('PLOSH_ALL').asString+' кв.м.';
      s:=dmBase.HouseOwners(MainDateFiks, q.Fld('ADRES_ID').AsString, nil, 0);
      ds.Fld('POMESH').AsString:=ds.Fld('POMESH').AsString+', '+s;

      s:=GetTypeHouse(false,q.Fld('TYPEHOUSE').AsString,'');

      ds.Fld('POMESH').AsString:=ds.Fld('POMESH').AsString+', '+s+', '+q.Fld('KOLVO_PROPIS').AsString+' чел.';    
      sDate:='';
      if (q.Fld('REG_RESH').AsString<>'') then begin
        sDate:=DatePropis(q.Fld('DEC_DATE').AsDateTime,3);
        if not q.Fld('DEC_TIME').IsNull then begin
          sDate:=sDate+' '+FormatDateTime('hh:mm',q.Fld('DEC_TIME').AsDateTime);
        end;
        sDate:=sDate+', №'+q.Fld('REG_RESH').AsString;
        if not q.Fld('REG_DATE').IsNull then sDate:=sDate+' от '+DatePropis(q.Fld('REG_DATE').AsDateTime,3);
      end;
      sOsv:=GetOsnovOchered(q,0);

      if (q.Fld('ISK_RESH').AsString<>'') 
        then sIskl:=DatePropis(q.Fld('ISK_DATE').AsDateTime,3)+' '+', №'+q.Fld('ISK_RESH').AsString
        else sIskl:='';
      if q.Fld('ISK_OSNOV').AsString='' 
        then s:=q.Fld('ISK_OSNOV_TEXT').AsString
        else s:=' п.'+SeekValueSpr('SprSnOch','ID',q.Fld('ISK_OSNOV').AsString,'PUNKT')+'  положения согласно Указа Президента Республики Беларусь №565';
      if s<>'' then sIskl:=sIskl+', '+s;
      if q.Fld('ISK_ADDINFO').AsString<>'' 
        then sIskl:=sIskl+','+q.Fld('ISK_ADDINFO').AsString;

      sPredos:='';
      if not q.Fld('NEW_ADRES_ID').IsNull then begin
        sPredos:=dmBase.AdresFromID(MainDateFiks,q.Fld('new_adres_id').AsString,false);
      end;
      if not lSocial and (q.Fld('KREDIT_SUMMA').AsString<>'') then begin
        sPredos:=sPredos+' льготный кредит с сумме '+q.Fld('KREDIT_SUMMA').AsString;
      end;
      if lSocial then begin
        // 6 дата и время
        ds.Fld('OSNOV').AsString:=sDate;
        // 7 основание постановки
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
      if m.Fld('POL').AsString='М' then begin
        strPol2 := 'проживает';
        strPol3 := 'его';
      end else begin
        strPol2 := 'проживает';
        strPol3 := 'ее';
      end;
      adr := LicSchet.Adres;
      nID := m.Fld('ID_INTERNAL').AsInteger;
      strKomu := m.Fld('FAMILIA').AsString+' '+m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;

      DecodeDate(GlobalTask.CurrentDate,nYear,nMonth,nDay);

      strAdres:= adr.GetAdres+', '+FirstCharUpper(Raion_Name('Р'))+', '+FirstCharUpper(Obl_Name('Р'));

      StartPrint(sl, poPortrait, pfA4);
      PrintShtamp1(sl, 'Приложение 1 \par к постановлению Министерства \par по налогам и сборам \par Республики Беларусь \par 17.01.2007 №9');

//      PrintString(sl, UpperCase(NameOrg('',''))+'\par\par ', 0, 12, False, False, False);

      PrintString(sl, '\qc СПРАВКА  № ______\par ', 0, 14, True, False, False);

      PrintString(sl, '\qc подтверждающая, что продаваемая продукция произведена физическим \par ', 0, 12, false, False, False);
      PrintString(sl, '\qc лицом и (или) лицами, состоящими с ним в браке, в отношениях \par ', 0, 12, false, False, False);
      PrintString(sl, '\qc близкого родства или свойства, усыновителя и усыновленного, \par ', 0, 12, false, False, False);
      PrintString(sl, '\qc опекуна, попечителя и подопечного, на земельном участке, \par ', 0, 12, false, False, False);
      PrintString(sl, '\qc выделенном для ведения личного подсобного хозяйства \par ', 0, 12, false, False, False);
      PrintString(sl, '\qc садоводства, огородничества \par\par ', 0, 12, false, False, False);
      s := m.LichNomer;

      if s<>'' then s:=', '+s;
      PrintString(sl, ' \ul1 '+GetPadegFIO(strKomu,m.Fld('POL').AsString,'И')+'    паспорт: '+m.Passport+s+' лиц.счет '+LicSchet.Fld('NOMER').AsString+' \par ', 0, 12, False, False, False);
      PrintString(sl, strPol2+' \ul1 '+strAdres+' \par ', 0, 12, False, False, False);
      PrintString(sl, 'и удостоверяет то, что на земельном участке (участках), находящемся (находящихся) в '+strPol3+' пользовании, владении либо в частной собственности:  \par ', 0, 12, False, False, False);

      PrintString(sl, '\qc I \par ', 0, 12, True, False, False);
      PrintString(sl, '\qc 1. Дом с приусадебным участком \par ', 0, 12, True, False, False);

      if LicSchet.Fld('PRIUSAD').AsString='' then begin
        PrintString(sl, PadRStr('   '+adr.GetAdres,120,' ')+chr(160)+' \par\par ', 0, 12, False, False, True);
      end else begin
        PrintString(sl, PadRStr('   '+adr.GetAdres+'  приусадебный участок площадь: '+LicSchet.Fld('PRIUSAD').AsString+'га',100,' ')+chr(160)+' \par\par ', 0, 12, False, False, True);
      end;
      PrintString(sl, '\qc 2. Участок в садоводческом товариществе либо в дачном кооперативе \par ', 0, 12, True, False, False);
      PrintString(sl, StringOfChar('_',160)+'\par\par ', 0, 12, False, False, False);
      PrintString(sl, '\qc 3. Участок, предоставленный во временное пользование для огородничества, а также для сенокошения и выпаса скота \par ', 0, 12, True, False, False);

//      PrintString(sl, StringOfChar('_',160)+'\par\par ', 0, 12, False, False, False);
      nn := LicSchet.Fld('VSEGO').AsFloat-LicSchet.Fld('POSTR').AsFloat-LicSchet.Fld('PRIUSAD').AsFloat
      if nn>0 
       then PrintString(sl, PadRStr('   '+FormatFloat('####0.####',nn)+'га',140,' ')+chr(160)+' \par\par ', 0, 12, False, False, True)
       else PrintString(sl, StringOfChar('_',160)+'\par\par ', 0, 12, False, False, False);

      //-----------------------------------------------------------------
      PrintString(sl, '\qc ПРОИЗВЕДЕНА СЛЕДУЮЩАЯ ПРОДУКЦИЯ, ПРЕДНАЗНАЧЕННАЯ ДЛЯ РЕАЛИЗАЦИИ\par\par ', 0, 11, False, False, False);
      PrintString(sl, '\qc II РАСТЕНИЕВОДСТВО\par ', 0, 12, True, False, False);
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
      pr.SetHeadWidth(0,'Наименование культуры', 250);
      pr.SetHeadWidth(1,'Посевная площадь, га', 80);
      pr.SetHeadWidth(2,'Объем произведенной продукции (ед.изм.)', 120);
      pr.SetHeadWidth(3,'Отметка субъекта производящего закупку', 140);
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

      PrintString(sl, '\par \qc ЖИВОТНОВОДСТВО\par ', 0, 12, True, False, False);
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
      pr.SetHeadWidth(0,'Наименование произведенной продукции', 150);
      pr.SetHeadWidth(1,'Вид поголовья', 80);
      pr.SetHeadWidth(2,'Количество голов', 65);
      pr.SetHeadWidth(3,'Вес произведенной продукции | Живой вес (ед.изм.)', 80);
      pr.SetHeadWidth(4,'Вес произведенной продукции | Убойный вес (ед.изм.)', 80);
      pr.SetHeadWidth(5,'Отметка субъекта производящего закупку', 120);
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
      PrintString(sl, '\page\qc ПЧЕЛОВОДСТВО\par ', 0, 12, True, False, False);
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
      pr.SetHeadWidth(0,'Наименование произведенной продукции', 170);
      pr.SetHeadWidth(1,'Количество пчелосемей', 130);
      pr.SetHeadWidth(2,'Вес произведенной продукции (ед.изм.)', 130);
      pr.SetHeadWidth(3,'Отметка субъекта производящего закупку', 160);
      pr.SetHeadFont(0,9);
      pr.SetPrintHead(true);
      pr.SetTableFont(0,12);
      pr.SetColFont(0,0,12);
      pr.SetBorder(-1, 'ltrb');
      pr.SetAlign(-1, 'c', 'c');
      pr.Print;
      FreePrintTable(pr);
      tb.Free;
//--- Список физических лиц ---------------------------
//   fcTimesNewRoman=0  fcArial=1  fcCourierNew=2

      PrintString(sl, '\par ', 0, 12, True, False, False);
      PrintString(sl, '\qc III СПИСОК ФИЗИЧЕСКИХ ЛИЦ, ЯВЛЯЮЩИХСЯ ЧЛЕНАМИ СЕМЬИ (ДЕТЬМИ)\par ', 0, 12, True, False, False);
      PrintString(sl, PadCStr(strKomu,100,' ')+'_'+'\par ', 0, 12, False, False, True);
//      PrintString(sl, '\ql '+StringOfChar('_',100)+'\par ', 0, 9, False, False, False);
      PrintString(sl, '\ql (фамилия, имя, отчество физического лица, в пользовании, владении либо в частной собственности которого находиться земельный участок) \par\par ', 0, 7, False, True, False);
      m.First;
      nStr:=1;
      sprOtnosh := dbGetDataSet('dmBase.SprOtnosh');
//      strSobstv := adr.GetOwners(slOwners,1);

      tb := dbCreateMemTable('NOMER,Integer;NAME,Char,100;ADRES,Char,100;OTNOSH,Char,30','');
      tb.Open;
      pr := CreatePrintTable(sl,tb);
      pr.SetHeadWidth(0,'№ п/п', 20);
      pr.SetHeadWidth(1,'Фамилия, имя, отчество', 220);
      pr.SetHeadWidth(2,'Адрес постоянного места жительства', 260);
      pr.SetHeadWidth(3,'Родственная принадлежность', 90);
      while not m.Eof do begin
        // пропускаем хозяина справки
        if AddMenToSprav(m,nID) then begin
//        if (m.Fld('ID_INTERNAL').AsInteger<>nID) and
//           (m.Fld('PROPIS').AsBoolean=true) and             // вкл. только прописанных
//           (m.Fld('PRESENT').AsBoolean=true) then begin // вкл. только присутствующих
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
      PrintString(sl, 'Справка выдана '+DatePropis(Now,2)+' и действительна до завершения реализации указанной продукции. \par\par ', 0, 12, False, False, False);
      PrintString(sl, 'Руководитель местного исполнительного \par и распорядительного органа '+StringOfChar(' ',75)+'\b0\i0\fs28 '+Parameters('ПРЕДСЕДАТЕЛЬ')+'\par ', 0, 10, true, true, false);
      PrintString(sl, StringOfChar(' ',65)+StringOfChar('_',60)+ ' \par ', 0, 10, false, false, false);
      PrintString(sl, StringOfChar(' ',90)+'подпись                 (фамилия, имя, отчество) \par\par ', 0, 10, false, false, false);
      PrintString(sl, 'М.П. \par ', 0, 10, false, false, false);
//-----------------------------------------------------------------------
      PrintString(sl, '\qc IV\par ', 0, 12, True, False, False);
      PrintString(sl, '\ql Место для штампа лаборатории \par ', 0, 10, False, False, False);
      PrintString(sl, '\qr '+StringOfChar('_',80)+'\par ', 0, 9, False, False, False);
      PrintString(sl, '\qr (наименование и вес (объем продукции на которую распространяются результаты \par\par ', 0, 8, False, True, False);
      PrintString(sl, '\qr '+StringOfChar('_',80)+'\par ', 0, 9, False, False, False);
      PrintString(sl, '\qr лаборатории анализа, и период, в течение которого эти результаты действительны)) \par\par ', 0, 8, False, True, False);

//-----------------------------------------------------------------------
      PrintString(sl, '\qc V\par ', 0, 12, True, False, False);
      PrintString(sl, '\qc ОТМЕТКИ КОНТРОЛИРУЮЩИХ ОРГАНОВ\par\par ', 0, 12, True, False, False);
      tb := dbCreateMemTable('N1,Char,10;N2,Char,10;','');
      tb.Open;
      for i:=0 to 6 do begin
        tb.Append;
        tb.Post;
      end;
      pr := CreatePrintTable(sl,tb);
      pr.SetHeadWidth(0,'Проверка произведена \par (должность, фамилия, имя, отчество, дата)', 310);
      pr.SetHeadWidth(1,'Наименование и количество продукции,\par предъявленной на момент проверки', 310);
      pr.SetPrintHead(true);
      pr.SetHeadFont(0,9);
      pr.SetTableFont(0,12);
      pr.SetBorder(-1, 'ltrb');
      pr.Print;
      FreePrintTable(pr);
      tb.Free;
//-----------------------------------------------------------------------
      if FinishPrint(GetFolderMyDocument+'\СправкаНалоговую.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') then
          ShellExt(GetFolderMyDocument+'\СправкаНалоговую.doc');
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
      if m.Fld('POL').AsString='М' then begin
        strPol :='он' ;
        strPol2:='проживает' ;
        strPol3:='м';
        strEG := 'его';
      end else begin
        strPol:='она';
        strPol2:='проживает' ;
        strPol3:='ж';
        strEG := 'ее';
      end;
      DecodeDate(GlobalTask.CurrentDate,nYear,nMonth,nDay);
      strAdres:= adr.GetAdres+', '+FirstCharUpper(Raion_Name('Р'))+', '+FirstCharUpper(Obl_Name('Р'));
      StartPrint(sl, poPortrait, pfA4);
      PrintString(sl, UpperCase(NameOrg('Б',''))+'\par ', 0, 12, False, False, False);
      PrintString(sl, UpperCase(NameOrg('',''))+'\par ', 0, 12, False, False, False);
      PrintString(sl, ParamAsString('GOROD')+' '+FirstCharUpper(Raion_Name(''))+' '+FirstCharUpper(Obl_Name(''))+'\par ', 0, 12, False, False, False);
      PrintString(sl, '\ldblquote   '+IntToStr(nDay)+'  \rdblquote   '+GetMonthPropis(GlobalTask.CurrentDate,'Р')+'   '+IntToStr(nYear)+' №__________\par\par ', 0, 12, False, False, False);
      PrintString(sl, '\qc СПРАВКА\par ', 0, 12, False, False, False);
      PrintString(sl, '\fi720\qj Выдана настоящая гр. '+GetPadegFIO(strKomu,strPol3,'Д')+'  '+strGR+' г.р. в том, что '+strPol+' действительно '+strPol2+' по адресу '+strAdres+' \par\par ', 0, 12, False, False, False);
      s:='_______________________________';
      if m.Fld('DATEP').AsString<>'' then begin
        s:= FormatDateTime('DD.MM.YYYY',m.Fld('DATEP').AsDateTime);
      end;

//      if LicSchet.Fld('PLOSH_ZDAN').AsString=''
        strPlosh := LicSchet.Fld('PLOSH_ALL').AsString
//        else strPlosh := LicSchet.Fld('PLOSH_ZDAN').AsString;
      PrintString(sl, ' прописан поcтоянно(временно) с '+ s +' \par ', 0, 12, False, False, False);
      PrintString(sl, 'Занимаемая площадь: '+ strPlosh + ' кв.м., жилая: '+LicSchet.Fld('PLOSH_GIL').AsString+' кв.м.' +' \par ', 0, 12, False, False, False);
      PrintString(sl, 'Номер лиц.счета: '+ LicSchet.Fld('nomer').AsString+' \par ', 0, 12, False, False, False);
      PrintString(sl, 'Вместе с ним(нею) проживают: \par\par ', 0, 12, False, False, False);

      HeadList.Add('№ п/п');
      HeadList.Add('Фамилия, имя, отчество');
      HeadList.Add('Год рождения');
      HeadList.Add('Родственные отношения');
      HeadList.Add('Дата прописки');
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
          // глава лицевого счета, считаем что он же и собственник
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
        s := '\par\fi720\qj Основным домовладельцем является ';
      end else begin
        s := '\par\fi720\qj Основными домовладельцами являются: ';
      end;
      if slOwners.Count=0 then begin
        PrintString(sl, s + strSobstv+'\par ', 0, 12, False, False, False);
      end else begin
        PrintString(sl, s + strSobstv+'\par ', 0, 12, False, False, False);
      end;
      PrintString(sl, '\fi720 Справка выдана для предоставления по месту требования.\par\par ', 0, 12, False, False, False);
      PrintString(sl, 'Председатель исполкома                                    '+ParamAsString('ПРЕДСЕДАТЕЛЬ')+'\par\par ', 0, 12, False, False, False);
      PrintString(sl, 'Бухгалтер                                                 '+ParamAsString('ГЛ_БУХГАЛТЕР')+'\par\par ', 0, 12, False, False, False);
      PrintString(sl, 'Паспортист                                                '+ParamAsString('РУК_ПАСП')+'\par\par ', 0, 12, False, False, False);
      if FinishPrint(GetFolderMyDocument+'\СправкаСоставеСемьи.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') then
          ShellExt(GetFolderMyDocument+'\СправкаСоставеСемьи.doc');
//        if ParamAsBoolean('SHOW_WRITE_DOK') then
//          ShowMessage('Документ <СправкаСоставеСемьи.doc> помещен в папку <Мои Документы>');
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
      if m.Fld('POL').AsString='М' then begin
        strPol :='он' ;
        strPol2:='прописан' ;
        strPol3:='м';
        strEG := 'его';
      end else begin
        strPol:='она';
        strPol2:='прописана' ;
        strPol3:='ж';
        strEG := 'ее';
      end;
      DecodeDate(GlobalTask.CurrentDate,nYear,nMonth,nDay);
      strAdres:= adr.GetAdres+', '+FirstCharUpper(Raion_Name('Р'))+', '+FirstCharUpper(Obl_Name('Р'));
      StartPrint(sl, poPortrait, pfA4);
      PrintString(sl, UpperCase(NameOrg('Б',''))+'\par ', 0, 12, False, False, False);
      PrintString(sl, UpperCase(NameOrg('',''))+'\par ', 0, 12, False, False, False);
      PrintString(sl, ParamAsString('GOROD')+' '+FirstCharUpper(Raion_Name(''))+' '+FirstCharUpper(Obl_Name(''))+'\par ', 0, 12, False, False, False);

      PrintString(sl, '\ldblquote   '+IntToStr(nDay)+'  \rdblquote   '+GetMonthPropis(GlobalTask.CurrentDate,'Р')+'   '+IntToStr(nYear)+' №_________ \par ', 0, 12, False, False, False);
      if nType=1 
       then  PrintString(sl, 'на   №__________   от  ___________\par\par ', 0, 12, False, False, False)
       else  PrintString(sl, '\par ', 0, 12, False, False, False);

      PrintString(sl, '\qc СПРАВКА\par ', 0, 14, True, False, False);
      if lPrintAll then begin
        PrintString(sl, '\qc О ЗАНИМАЕМОМ ГРАЖДАНИНОМ ЖИЛОМ ПОМЕЩЕНИИ И О СОСТАВЕ СЕМЬИ\par\par ', 0, 11, true, False, False);
      end else begin
        PrintString(sl, '\qc О СОСТАВЕ СЕМЬИ\par\par ', 0, 12, False, False, False);
      end;
      if lPrintAll then begin
        PrintString(sl, '\fi720\qj Дана гр. '+GetPadegFIO(strKomu,strPol3,'Д')+'  '+strGR+' г.р. в том, что '+strPol+' действительно '+strPol2+' по адресу '+strAdres+' где прописаны:\par\par ' , 0, 12, False, False, False);
      end else begin
        PrintString(sl, '\fi720\qj Дана гр. '+GetPadegFIO(strKomu,strPol3,'Д')+'  '+strGR+' г.р. в том, что '+strPol+' действительно '+strPol2+' по адресу '+strAdres+', и состав '+strEG+' семьи нижеследующий:\par\par ', 0, 12, False, False, False);
      end;
      HeadList.Add('№ п/п');
      HeadList.Add('Фамилия, имя, отчество');
//      if nType=0 
//        then HeadList.Add('Год рождения')
//        else HeadList.Add('Дата рождения');
      HeadList.Add('Дата рождения');
      HeadList.Add('Степень родства');
      WidthList.Add('30');
      WidthList.Add('250');
      WidthList.Add('120');
      WidthList.Add('90');
      if lPrintAll then begin
        HeadList.Add('Дата прописки');
        WidthList.Add('120');
      end else begin
        HeadList.Add('Примечание');
        WidthList.Add('150');
      end;
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');
      slPar.Add('\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs');

      tb := dbCreateMemTable('NOMER,Integer;NAME,Char,100;GODR,Char,10;OTNOSH,Char,30;DATEP,Char,15;','');
      tb.Open;

      // добавим того кому выдается справка
      tb.Append;
      tb.Fld('NOMER').AsInteger := 1;
      tb.Fld('NAME').AsString   := FirstCharUpper(strPol) + ' же';
      {
      s := m.Fld('WORK_NAME').AsString;
      if m.Fld('DOLG_NAME').AsString<>'' 
        then s := s + ',' + m.Fld('DOLG_NAME').AsString;
      if (s='') then begin
        if (m.Fld('STUD_PLACE').AsString<>'') then begin
          s := m.Fld('STUD_PLACE').AsString;
        end else begin
          if not m.Fld('ISWORK').IsNull and (m.Fld('ISWORK').AsBoolean=false) then begin 
            if m.Fld('POL').AsString='М' then s:='безработный' else s:='безработная';
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
          // наниматель
          strNanim := m.Fld('FAMILIA').AsString+' '+
                            m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
          if slOwners.Count=0 then begin
            strSobstv := strNanim;
          end;
        end;
        // пропускаем хозяина справки
        if AddMenToSprav(m,nID) then begin
//        if (m.Fld('ID_INTERNAL').AsInteger<>nID) and
//           (m.Fld('PROPIS').AsBoolean=true) and             // вкл. только прописанных
//           (m.Fld('PRESENT').AsBoolean=true) then begin // вкл. только присутствующих
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
        strOborud := 'эл.освещением, ';
        if LicSchet.Fld('VODOPROV').AsBoolean  then strOborud:=strOborud+'водопроводом, ';
        if LicSchet.Fld('KANALIZ').AsBoolean   then strOborud:=strOborud+'канализацией, ';
        if LicSchet.Fld('CENT_OTOP').AsBoolean then strOborud:=strOborud+'центр. отоплением, ';
        if LicSchet.Fld('GOR_VODA').AsBoolean  then strOborud:=strOborud+'горячим водоснабжением, ';
        if LicSchet.Fld('GAZ').AsBoolean       then strOborud:=strOborud+'газом (сетевой), ';
        if LicSchet.Fld('EL_PLIT').AsBoolean   then strOborud:=strOborud+'напольной электоплитой, ';
        strOborud := Trim(strOborud);
        strOborud := Copy(strOborud,1,Length(strOborud)-1);
        s := '\par\fi720\qj Наниметелем (собственником) является '+strNanim;

        if slOwners.Count<2 then begin
          s := '\par\fi720\qj Собственником жилого помещения является ';
        end else begin
          s := '\par\fi720\qj Собственниками жилого помещения являются: ';
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
        PrintString(sl, '\qc Характеристика жилого помещения \par ', 0, 12, true, False, False);
        PrintString(sl, '\fi720\qj Жилое помещение представляет жилой дом общей площадью '+strPlosh+' кв.м., ', 0, 12, False, False, False);
        PrintString(sl, 'жилой площадью '+LicSchet.Fld('PLOSH_GIL').AsString+' кв.м.', 0, 12, False, False, False);
        PrintString(sl, '  Жилой дом состоит из '+LicSchet.Fld('KOL_KOMN').AsString+' комнат и кухни.', 0, 12, False, False, False);
        PrintString(sl, '\fi720\qj Жилое помещение оборудовано: '+strOborud+'\par ', 0, 12, False, False, False);
        PrintString(sl, '\fi720\qj Других жилых строений за данными членами семьи '+GetPadegFIO(strKomu,strPol3,'Р')+' на территории '+GetPadeg(ParamAsString('KNAME'),'Р')+' не числится. \par ', 0, 12, False, False, False);
      end else begin
        if nType=0 then begin
          PrintString(sl, '\fi720\qj Основание: похозяйственная книга № '+LicSchet.Fld('KNIGA_NOMER').AsString+', лицевой счет № '+LicSchet.Fld('NOMER').AsString+'. \par ', 0, 12, False, False, False);
        end;
      end;
// PLOSH_ALL-общая площадь PLOSH_GIL-жилая  PLOSH_ZDAN-здания
// KOL_KOMN- кол. комнат
// VODOPROV-водопровод   KANALIZ-канализация CENT_OTOP-центр.отопление
// GOR_VODA-гор.водоснабжение  GAZ-газ сетевой GID_GAZ-газ сжиженный  EL_PLIT-наполтня эл.плита
// 
      tb.Close;

      PrintString(sl, '\fi720 Справка выдана для предоставления по месту требования.\par\par ', 0, 12, False, False, False);
      if nType=0 then begin
        PrintString(sl, 'Председатель исполкома                                                                            '+ParamAsString('ПРЕДСЕДАТЕЛЬ')+'\par\par ', 0, 12, False, False, False);
      end;
      PrintString(sl, 'Секретарь исполкома                                                                                  '+ParamAsString('СЕКРЕТАРЬ')+'\par\par ', 0, 12, False, False, False);

      if FinishPrint(GetFolderMyDocument+'\СправкаСоставеСемьи.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') then
          ShellExt(GetFolderMyDocument+'\СправкаСоставеСемьи.doc');
//        if ParamAsBoolean('SHOW_WRITE_DOK') then
//          ShowMessage('Документ <СправкаСоставеСемьи.doc> помещен в папку <Мои Документы>');
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
      if m.Fld('POL').AsString='М' then begin
        strPol :='он' ;
        strPol2:='Прописан' ;
        strPol4:='гражданину' ;
        strPol3:='м';
        strEG := 'его';
      end else begin
        strPol:='она';
        strPol2:='Прописана' ;
        strPol4:='гражданке' ;
        strPol3:='ж';
        strEG := 'ее';
      end;
      DecodeDate(GlobalTask.CurrentDate,nYear,nMonth,nDay);
      strAdres:= adr.GetAdres+', '+FirstCharUpper(Raion_Name('Р'))+', '+FirstCharUpper(Obl_Name('Р'));
      StartPrint(sl, poPortrait, pfA4);

      PrintShtamp1(sl, 'Приложение 1 \par к постановлению Министерства \par жилищно-коммунального хозяйства \par Республики Беларусь \par 21.12.2005 №58');

//      PrintString(sl, StringReplace(GlobalTask.ParamAsString('SHTAMP'),Chr(13)+Chr(10),'\par')+'\par', 0, 12, False, False, False);
//      PrintString(sl, UpperCase(NameOrg('Б',''))+'\par', 0, 12, False, False, False);
//      PrintString(sl, UpperCase(NameOrg('',''))+'\par', 0, 12, False, False, False);
//      PrintString(sl, ParamAsString('GOROD')+' '+FirstCharUpper(Raion_Name(''))+' '+FirstCharUpper(Obl_Name(''))+'\par', 0, 12, False, False, False);
      PrintString(sl, '\ldblquote   '+IntToStr(nDay)+'  \rdblquote   '+GetMonthPropis(GlobalTask.CurrentDate,'Р')+'   '+IntToStr(nYear)+'  №_______\par\par ', 0, 12, False, False, False);
      PrintString(sl, '\qc СПРАВКА\par ', 0, 14, True, False, False);
      PrintString(sl, '\qc с места жительства и о составе семьи\par\par ', 0, 12, true, False, False);
      PrintString(sl, '\qj Выдана '+strPol4+' '+GetPadegFIO(strKomu,strPol3,'Д')+'\par ', 0, 12, False, False, False);
      PrintString(sl, '\qj в том, что '+strPol+' действительно проживает по адресу: '+strAdres+'. \par ', 0, 12, False, False, False);
      PrintString(sl, '\qj '+strPol2 +'постоянно c '+DatePropis(m.Fld('DATEP').AsDateTime,2)+'\par ', 0, 12, False, False, False);

      sprTypeHouse := dbGetDataSet('dmBase.SprTypeHouse');

//      if LicSchet.Fld('PLOSH_ZDAN').AsString=''
        strPlosh := LicSchet.Fld('PLOSH_ALL').AsString
//        else strPlosh := LicSchet.Fld('PLOSH_ZDAN').AsString;
      PrintString(sl, '\qj Занимаемая общая площадь: '+strPlosh+' кв.метров, № лицевого счета '+LicSchet.Fld('NOMER').AsString+'. \par ', 0, 12, False, False, False);
      s:='';
      if LicSchet.Fld('OWN_HOUSE').AsBoolean then begin
        s := 'частный дом';
      end else begin
        if dbLocate(sprTypeHouse, 'ID', [LicSchet.Fld('TYPEHOUSE').AsString], '') then begin
          s := sprTypeHouse.Fld('NAME').AsString;
        end;
      end;

      PrintString(sl, '\qj Жилое помещение является: '+s+'\par ', 0, 12, False, False, False);
      PrintString(sl, '\qj В жилом помещении также прописаны (зарегистрированы) следующие лица: '+'\par ', 0, 12, False, False, False);

      HeadList.Add('№ п/п');
      HeadList.Add('Фамилия, имя, отчество');
      HeadList.Add('Год рождения');
      HeadList.Add('Степень родства');
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
          // наниматель
          strNanim := m.Fld('FAMILIA').AsString+' '+
                            m.Fld('NAME').AsString+' '+m.Fld('OTCH').AsString;
          if slOwners.Count=0 then begin
            strSobstv := strNanim;
          end;
        end;
        // пропускаем хозяина справки
        if AddMenToSprav(m,nID) then begin

//        if (m.Fld('ID_INTERNAL').AsInteger<>nID) and
//           (m.Fld('PROPIS').AsBoolean=true) and             // вкл. только прописанных
//           (m.Fld('PRESENT').AsBoolean=true) then begin // вкл. только присутствующих
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
      PrintString(sl, 'Нанимателем (собственником) является '+strNanim+'. \par\par ', 0, 12, False, False, False);
      PrintString(sl, 'Настоящая справка действительна в течение шести месяцев с даты ее выдачи.\par\par\par ', 0, 12, False, False, False);
      PrintString(sl, 'Председатель исполкома                                    '+ParamAsString('ПРЕДСЕДАТЕЛЬ')+'\par\par ', 0, 12, False, False, False);
      PrintString(sl, 'Специалист                                                           '+ParamAsString('РУК_ПАСП')+'\par\par ', 0, 12, False, False, False);
      PrintString(sl, 'Бухгалтер                                                              '+ParamAsString('ГЛ_БУХГАЛТЕР')+'\par\par ', 0, 12, False, False, False);

      if FinishPrint(GetFolderMyDocument+'\СправкаСМестаЖительстваИСоставеСемьи.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') then
          ShellExt(GetFolderMyDocument+'\СправкаСМестаЖительстваИСоставеСемьи.doc');
//        if ParamAsBoolean('SHOW_WRITE_DOK') then
//          ShowMessage('Документ <СправкаСоставеСемьи.doc> помещен в папку <Мои Документы>');
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
      if m.Fld('POL').AsString='М' then begin
        strPol :='он' ;
        strPol2:='Прописан' ;
        strPol4:='гражданину' ;
        strPol3:='м';
        strEG := 'его';
      end else begin
        strPol:='она';
        strPol2:='Прописана' ;
        strPol4:='гражданке' ;
        strPol3:='ж';
        strEG := 'ее';
      end;
      DecodeDate(GlobalTask.CurrentDate,nYear,nMonth,nDay);
      strAdres:= adr.GetAdres+', '+FirstCharUpper(Raion_Name('Р'))+', '+FirstCharUpper(Obl_Name('Р'));
      StartPrint(sl, poPortrait, pfA4);

      PrintShtamp1(sl, 'Приложение 2 \par к постановлению Министерства \par жилищно-коммунального хозяйства \par Республики Беларусь \par 21.12.2005 №58');

//      PrintString(sl, StringReplace(GlobalTask.ParamAsString('SHTAMP'),Chr(13)+Chr(10),'\par')+'\par', 0, 12, False, False, False);

//      PrintString(sl, UpperCase(NameOrg('Б',''))+'\par', 0, 12, False, False, False);
//      PrintString(sl, UpperCase(NameOrg('',''))+'\par', 0, 12, False, False, False);
//      PrintString(sl, ParamAsString('GOROD')+' '+FirstCharUpper(Raion_Name(''))+' '+FirstCharUpper(Obl_Name(''))+'\par', 0, 12, False, False, False);
      PrintString(sl, '\ldblquote   '+IntToStr(nDay)+'  \rdblquote   '+GetMonthPropis(GlobalTask.CurrentDate,'Р')+'   '+IntToStr(nYear)+'  №_______\par\par ', 0, 12, False, False, False);
      PrintString(sl, '\qc СПРАВКА\par ', 0, 14, True, False, False);
      PrintString(sl, '\qc с места жительства \par\par ', 0, 12, true, False, False);
      PrintString(sl, '\qj Выдана '+strPol4+' '+GetPadegFIO(strKomu,strPol3,'Д')+'\par ', 0, 12, False, False, False);
      PrintString(sl, '\qj в том, что '+strPol+' действительно проживает по адресу: '+strAdres+'. \par ', 0, 12, False, False, False);
      PrintString(sl, '\qj '+strPol2 +' постоянно c '+DatePropis(m.Fld('DATEP').AsDateTime,2)+'\par ', 0, 12, False, False, False);

      PrintString(sl, 'Настоящая справка действительна в течение шести месяцев с даты ее выдачи.\par\par ', 0, 12, False, False, False);
      PrintString(sl, 'Секретарь исполкома                                          '+ParamAsString('СЕКРЕТАРЬ')+'\par\par ', 0, 12, False, False, False);
      if ParamAsString('РУК_ПАСП')<>ParamAsString('СЕКРЕТАРЬ') then 
        PrintString(sl, 'Паспортист                                                           '+ParamAsString('РУК_ПАСП')+'\par\par ', 0, 12, False, False, False);

      if FinishPrint(GetFolderMyDocument+'\СправкаСМестаЖительства.doc', sl, True, strErr) then begin
        if ParamAsBoolean('SHOW_WRITE_DOK') then
          ShellExt(GetFolderMyDocument+'\СправкаСМестаЖительства.doc');
//        if ParamAsBoolean('SHOW_WRITE_DOK') then
//          ShowMessage('Документ <СправкаСоставеСемьи.doc> помещен в папку <Мои Документы>');
      end else begin
        PutError(strErr);
      end;
//      Memo1.Lines.Assign(sl);
   finally
      sl.Free;
      slOwners.Free;
   end;
end;


