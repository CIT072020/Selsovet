//----------------------------------
// выгрузка для Минтруда
procedure NaselToMintrud1(ds:TDataSet; sYear:String; sQuarter:String; sUNP:String; sAdd:String);
var
  sl:TStringList;
  s,sPath,sFile:String;
  n:Integer;
  d:TDateTime;
  lOk:Boolean;
begin

  sl:=TStringList.Create;
  sl.Add('[FORMAT]'); 
  sl.Add('VERSION=1.0'); 
  sl.Add('TYPE=IDENTIF'); 
  sl.Add('DIRECTION=EXCLUDE');  // INCLUDE
  sl.Add('[/FORMAT]'); 
  sl.Add('[LIST]'); 
  sl.Add('YEAR='+sYear); 
  sl.Add('QUARTER='+sQuarter); 
  sl.Add('ORG_UNP='+ParamAsString('UNP')); 
  sl.Add('[/LIST]'); 
  sl.Add('[IDENTIF]'); 

  OpenMessage('Выгрузка труд. населения для Минтруда ...','',10);
  try
    ds.First;
    while not ds.Eof do begin  
      sl.Add(ds.Fld('LICH_NOMER').AsString); 
      ds.Next;
    end;
  finally
    CloseMessage();
  end;

  sl.Add('[/IDENTIF]'); 
  for n:=0 to sl.Count-1 do sl.Strings[n]:=ANSItoUTF8(sl.Strings[n]);
  ds.First;
  sPath:=GetFolderExport;
  if sAdd<>'' then sAdd:='_'+sAdd;
  sFile:=sPath+'\MT_'+sUNP+'_'+sYear+'_'+StringReplace(sQuarter,',','-')+sAdd+'.txt';
  ForceDirectories(sPath);
  DeleteFiles(sPath+'\*.*');
  sl.SaveToFile(sFile);
  sl.Free;
//  ShowMessage(sFile);
  ShellExt2(sPath,'explore');
end;
//-------------------------------
procedure NaselToMintrud(nType:Integer; sSeek:String);
var
  ds:TDataSet;
  f:TfmParamQuest;
  n:Integer;
  sAdd,sQ,sUNP,sYear,s:String;
  lOk:Boolean;
begin
  sUNP:=Trim(ParamAsString('UNP'));
  f:=TfmParamQuest.Create(nil);
  f.Caption:='Параметры';
  f.AddParamEx(YearOf(Now), 'Год выгрузки' , 'YEAR' ,'TYPE=YEAR~MIN=2000~MAX=2999~WIDTH=80');
  f.AddParamEx('', 'Квартал выгрузки' , 'QUARTER' ,'WIDTH=80');
  f.AddParamEx('СХ', 'Дополнение к имени файла' , 'ADDNAME' ,'WIDTH=80');
//  if lRnGorod then begin  // МИНСК
//    fmParam.AddParamEx(0, 'Район города' , 'RNGOROD' ,'TYPE=LOOKUP~DESC=LOOKUP_RNGOROD~WIDTH=150');
// не работает   fmParam.AddParamEx('', 'Район города2' , 'RNGOROD2' ,'TYPE=LIST~DESC=KEY_RN_MYGOR~WIDTH=150');
//  end;
//  f.AddParamEx('', 'Диск для копирования', 'DISK','TYPE=REMOTEDISK~WIDTH=50');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  if n=1 then begin
    lOk:=true;
    sYear:=IntToStr(f.GetValue('YEAR','N'));
    sQ:=Q_DelChars(f.GetValue('QUARTER','C'),' ');
    sAdd:=Q_DelChars(f.GetValue('ADDNAME','C'),' ');
    if (sQ='') or not IsAllDigit(StringReplace(sQ, ',', '0')) then begin
      PutError('Ошибка при заполнении номера квартала');
      lOk:=false;
    end;
    if lOk then begin
      ds:=dbGetDataSet('fmGurnNasel.Query');
      if nType=1 then begin
        NaselToMintrud1(ds, sYear, sQ, sUNP, sAdd);
      end;
    end;
  end;
  f.Free;
end;

// выгрузка умерших для соц.защиты
function DateToStrType(d:TDateTime;sType:String):String;
begin
  if (Trim(sType)='') then sType:='0';
  if d=0 then begin
    Result:='';
  end else if sType='0' then begin
    Result:=FormatDateTime('DDMMYYYY',d);
  end else if sType='1' then begin
    Result:='0000'+FormatDateTime('YYYY',d);
  end else begin
    Result:='00'+FormatDateTime('MMYYYY',d);
  end;
end;

//----------------------------------
// выгрузка для соц. защиты
procedure Death2SocZachita;
var
  sl:TStringList;
  q,ds : TDataSet;
  s,sZAGS,sPath,sType,sIN,sAddWhere,sDisk:String;
  Date1,Date2:TDateTime;
  fmParam:TfmParamQuest;
  n:Integer;
  lAkt,lPrintFile,lRnGorod:Boolean;
begin
  if (Copy(ParamAsString('KOD'),1,1)='5') then begin  // МИНСК
    lRnGorod:=true;
  end else begin
    lRnGorod:=false;
  end;

  lRnGorod:=false;  // !!!!!!!!

  if lRnGorod then begin
    sZAGS:='';
  end else begin
    sZAGS:=ParamAsString('KOD_SZ');
    if Length(sZags)<>3 then begin
      PutError('Заполните в параметрах код отдела Фонда социальной защиты.');
      exit;
    end;
  end;
  sType:=ParamAsString('ARXIV');
  if (sType='R') or (sType='G') then begin

  end else begin
    PutError('Выгрузка возможна только для ЗАГС райисполкома или ЗАГС горисполкома.(см.параметры)');
    exit;
  end;
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='Параметры';
  fmParam.AddParamEx(Now, 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
  fmParam.AddParamEx(Now, 'Конечная дата' , 'DATE2' ,'TYPE=DATE');
//  if lRnGorod then begin  // МИНСК
//    fmParam.AddParamEx(0, 'Район города' , 'RNGOROD' ,'TYPE=LOOKUP~DESC=LOOKUP_RNGOROD~WIDTH=150');
// не работает   fmParam.AddParamEx('', 'Район города2' , 'RNGOROD2' ,'TYPE=LIST~DESC=KEY_RN_MYGOR~WIDTH=150');
//  end;
  fmParam.AddParamEx('', 'Диск для копирования', 'DISK','TYPE=REMOTEDISK~WIDTH=50');
  sAddWhere:='';
  fmParam.AddButtons('Выполнить~Отказ',0);
  n:=fmParam.ShowQuest;

  if n=1 then begin

    Date1:=fmParam.GetValue('DATE1','D');
    Date2:=fmParam.GetValue('DATE2','D');
    sDisk:=Trim(fmParam.GetValueAsText('DISK'));

    lAkt:=ParamAsBoolean('PRINT_AKT_SZ');
    lPrintFile:=ParamAsBoolean('PRINT_REEST_SZ'); //fmParam.GetValue('FILE','L');
{
    if lRnGorod then begin
      sZAGS:='!!!';
      s:=fmParam.GetValueAsText('RNGOROD');
      if s='' then begin
        sAddWhere:=' and GT_GOROD=<>'+QStr(Parameters('GOROD_FOR_RN'));
      end else begin
        sAddWhere:=' and GT_RAION='+QStr(s)+' and GT_GOROD='+QStr(Parameters('GOROD_FOR_RN'));
      end;
    end;
}
    OpenMessage('Выгрузка ...','',10);
    q:=dbOpenSQL('SELECT * FROM АктыСмертей WHERE datez>='+DateToSQL(Date1)+
                 ' and datez<='+DateToSQL(Date2)+' and vosstan=false '+sAddWhere+' ORDER BY Familia,Name','');
    q.Open;
    sl:=TStringList.Create;
    n:=0;
    ds := FindReportTable('LOGFILE');
    dbZap(ds);
    while not q.Eof do begin
      sIN:=StringReplace(q.Fld('LICH_NOMER').AsString,'=',' ');
      sIN:=CheckLichNom(true, sIN);
      if GetErrorCheck<>'' then sIN:='';
      s:='#1='+StringReplace(q.Fld('FAMILIA').AsString,'=',' ')+'='+
               StringReplace(q.Fld('NAME').AsString,'=',' ')+'='+
               StringReplace(q.Fld('OTCH').AsString,'=',' ')+'='+
               sIN+'='+
               q.Fld('POL').AsString+'='+
               DateToStrType(q.Fld('DATER').AsDateTime,q.Fld('ONLYGOD_R').AsString)+'='+
               DateToStrType(q.Fld('DATES').AsDateTime,q.Fld('ONLYGOD').AsString)+'='+
               StringReplace(q.Fld('NOMER').AsString,'=',' ')+'='+
               DateToStrType(q.Fld('DATEZ').AsDateTime,'0');
      sl.Add(s);
      if lPrintFile then begin
        ds.Append;
        ds.FieldByName('TEXT').AsString:=s;
        ds.Post;
      end;
      n:=n+1;
      q.Next;
    end;
    s:='#2='+IntToStr(n);
    sl.Add(s);
    if lPrintFile then begin
      ds.Append;
      ds.FieldByName('TEXT').AsString:=s;
      ds.Post;
    end;
    if sDisk='' then begin
      sPath:=GetFolderMyDocument+'\Соцзащита';
      ForceDirectories(sPath);
      DeleteFiles(sPath+'\*.*');
    end else begin
      sPath:=sDisk+':';
      DeleteFiles(sPath+'\*.'+sZAGS);
    end;
    sl.SaveToFile(sPath+'\U'+sType+FormatDateTime('DDMMYY',Now)+'.'+sZAGS);
    sl.Free;
    dbClose(q);
    CloseMessage();

    if lPrintFile then begin
      GlobalTask.PreviewReport('&Выгрузка для Соцзащиты.fr3');
    end;
    if lAkt then begin
//      GlobalTask.SetLastValueAsString('KOLVO_L', 'XXX');  в отчете присваивается переменная TOTALPAGES
      GlobalTask.SetLastValueAsInteger('KOLVO_F', 1);
      GlobalTask.SetLastValueAsInteger('KOLVO_M', n);
      RunTemplate('ZAGS_AktPrPer_AktSm');  // см. ниже
    end;

    ShellExt2(sPath,'explore');
  end;
end;
//------------
function ZAGS_AktPrPer_AktSm(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
begin
  result:=true;
  ds:=GetTemplateDataSet('MAIN');
  if ds<>nil then begin
    if not ds.Active then ds.Open;
    ds.Edit;
//     ds.Fld('SHTAMP').AsString := GetShtampSpr();
    ds.Fld('KOLVO_L').AsString := GlobalTask.GetLastValueAsString('TOTALPAGES')+' шт';
    ds.Fld('KOLVO_F').AsString := GlobalTask.GetLastValueAsString('KOLVO_F')+' шт';
    ds.Fld('KOLVO_M').AsString := GlobalTask.GetLastValueAsString('KOLVO_M')+' лиц';
    ds.Fld('GOROD').AsString := 'г. '+GlobalTask.ParamAsString('GOROD');
    ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
    ds.Fld('NAME_ZAGS').AsString := GetPadeg(ParamAsString('NAME'),'');
    ds.Fld('ORG').AsString := GetPadeg(GlobalTask.ParamAsString('FOND_SZ'),'');  // фонд социальной защиты
    ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Otchet_DOLG;
    ds.Fld('RUKOV').AsString :=Zags_Otchet_FIO;
    ds.Post;
  end;
end;

//-----------------------------------------------------------------
// выгрузка умерших для БелГосстраха
//-----------------------------------------------------------------
procedure Death2BelGosStrah;
var
  sl:TStringList;
  q : TDataSet;
  s,sZAGS,s1,s2,sPath:String;
  Date1,Date2:TDateTime;
  fmParam:TfmParamQuest;
  n:Integer;
begin
  sZAGS:=Copy(ParamAsstring('KOD'),1,4);
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='Параметры';
  fmParam.AddParamEx(Now, 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
  fmParam.AddParamEx(Now, 'Конечная дата' , 'DATE2' ,'TYPE=DATE');
  fmParam.AddButtons('Выполнить~Отказ',0);
  n:=fmParam.ShowQuest;
  if n=1 then begin
    Date1:=fmParam.GetValue('DATE1','D');
    Date2:=fmParam.GetValue('DATE2','D');
    OpenMessage('Выгрузка для Белгосстрах ...','',10);
    q:=dbOpenSQL('SELECT * FROM АктыСмертей WHERE datez>='+DateToSQL(Date1)+
                 ' and datez<='+DateToSQL(Date2)+' and vosstan=false ORDER BY Familia,Name','');
    q.Open;
    s:=IntToStr(q.RecordCount);
    sl:=TStringList.Create;
    sl.Add(ANSItoUTF8('<?xml version="1.0" encoding="UTF-8"?>')); 
    sl.Add(ANSItoUTF8('<root ZAGS="'+sZAGS+'" Date1="'+DTOS(Date1,'')+'" Date2="'+DTOS(Date2,'')+'" CountRecord="'+s+'" >')); 
    while not q.Eof do begin
      s1:=q.Fld('ONLYGOD').AsString;
      if (s1='') then s1:='0';
      s2:=q.Fld('ONLYGOD_R').AsString;
      if (s2='') then s2:='0';
      s:='   <Dead '+
                 'NumberAktNote="'+q.Fld('NOMER').AsString+'" '+
                 'SurName="'+q.Fld('FAMILIA').AsString+'" '+
                 'Name="'+q.Fld('NAME').AsString+'" '+
                 'Patronymic="'+q.Fld('OTCH').AsString+'" '+
                 'BirthDate="'+DTOS(q.Fld('DATER').AsDateTime,'')+'" '+
                 'BirthDateType="'+s2+'" '+
                 'DeathDate="'+DTOS(q.Fld('DATES').AsDateTime,'')+'" '+
                 'DeathDateType="'+s1+'" '+
                 'Address="'+StringReplace(GetAdresAkt(q,'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1,true),'"','`')+'" '+
               '/>';
      sl.Add(ANSItoUTF8(s)); 
      q.Next;
    end;
    sl.Add(ANSItoUTF8('</root>')); 
    sPath:=GetFolderMyDocument+'\Белгосстрах';
    ForceDirectories(sPath);
    DeleteFiles(sPath+'\*.*');
    sl.SaveToFile(sPath+'\'+sZAGS+'_'+DTOS(Date1,'C')+'_'+DTOS(Date2,'C')+'.xml');
    sl.Free;
    dbClose(q);
    CloseMessage();
    ShellExt2(sPath,'explore');
  end;
end;

//------------------------------------------------------------------------------
function Vib_Obsl_Prop : String;
begin
  Result := 'TABLETYPE=CDX;CHARTYPE=OEM';
end;

function Vib_Obsl(strPath:String):Boolean;
var
  strSQL,sKod,s : String;
  q,ds,dsAdres,dsSprNP : TDataSet;
  d : TDateTime;
  nID,n : Integer;
begin
  Result:=true;
//  OpenMessage('Расчет земельного налога ...','',10);
  d := MainDateFiks;
  if d <> dmBase.GetDateCurrentSost then begin
    s:='состояния на '+DatePropis(d,2);
  end else begin
    s:='текущего состояния';
  end;
  strSQL := dmBase.LoadSQLEx('Выборочное_обследование');
  strSQL := dmBase.CheckDateFiksSQL(strSQL, d);
  q:=dbOpenSQL(strSQL,'');
  ds:=dbGetDataSet('fmMain.expVib_Obsl');
  dsSprNP:=dmBase.GetDataSet('СпрНасПунктов');
  dsAdres:=dmBase.GetDataSet('БазаДомов');
  if ds<>nil then begin
    ChangeMessage('Выгрузка из '+s+' ...');
    nID:=GlobalTask.ParamAsInteger('ID');
    sKod:=GlobalTask.ParamAsString('KOD');
    n:=1;
    while not q.Eof do begin
      ds.Append;
      ds.Fld('NPP').AsInteger := n;
      ds.Fld('SOATO_SS').AsString := sKod;
      ds.Fld('ID_SS').AsInteger := nID;
      if dbLocate(dsAdres,'DATE_FIKS;ID',[d,q.Fld('ADRES_ID').AsInteger],'') then begin
        if dbLocate(dsSprNP,'ID',[dsAdres.Fld('PUNKT').AsInteger],'') then begin
          ds.Fld('SOATO_NP').AsString := dsSprNP.Fld('SOATO').AsString;
        end;
      end;
      ds.Fld('GR01').AsString := q.Fld('NOMER').AsString;
      ds.Fld('GR02').AsString := dmBase.AdresFromID(d,q.Fld('ADRES_ID').asString,false);
      ds.Fld('GR03').AsInteger:= 1;
      ds.Fld('GR04').AsInteger:= 1;

      ds.Fld('GR05').AsFloat  := dmBase.ReadPropAsFloat(d, q.Fld('ID').AsInteger,'VSEGO');
      ds.Fld('GR06').AsFloat  := dmBase.ReadPropAsFloat(d, q.Fld('ID').AsInteger,'POSTR');
      ds.Fld('GR07').AsFloat  := ds.Fld('GR05').AsFloat-ds.Fld('GR06').AsFloat;
      ds.Fld('GR08').AsFloat  := dmBase.ReadPropAsFloat(d, q.Fld('ID').AsInteger,'POSEV');
      ds.Fld('GR09').AsFloat  := dmBase.ReadPropAsFloat(d, q.Fld('ID').AsInteger,'POSEV_ZERN');
      ds.Fld('GR10').AsFloat  := dmBase.ReadPropAsFloat(d, q.Fld('ID').AsInteger,'POSEV_KART');
      ds.Fld('GR11').AsFloat  := dmBase.ReadPropAsFloat(d, q.Fld('ID').AsInteger,'POSEV_OV');
      ds.Fld('GR12').AsFloat  := dmBase.ReadPropAsFloat(d, q.Fld('ID').AsInteger,'POSEV_KORM');
      ds.Fld('GR13').AsFloat  := dmBase.ReadPropAsFloat(d, q.Fld('ID').AsInteger,'POSEV_TRAV');
      ds.Fld('GR14').AsFloat  := ds.Fld('GR08').AsFloat-
         (ds.Fld('GR09').AsFloat+ds.Fld('GR10').AsFloat+ds.Fld('GR11').AsFloat+ds.Fld('GR12').AsFloat+ds.Fld('GR13').AsFloat);
      //----- животноводство --------------------
      ds.Fld('GR15').AsInteger := dmBase.ReadPropAsInteger(d, q.Fld('ID').AsInteger,'BIG_ENIMAL');
      ds.Fld('GR16').AsInteger := dmBase.ReadPropAsInteger(d, q.Fld('ID').AsInteger,'KOROVA');
      ds.Fld('GR17').AsInteger := dmBase.ReadPropAsInteger(d, q.Fld('ID').AsInteger,'TELKI1');
      ds.Fld('GR18').AsInteger := dmBase.ReadPropAsInteger(d, q.Fld('ID').AsInteger,'SVINI');
      ds.Fld('GR19').AsInteger := dmBase.ReadPropAsInteger(d, q.Fld('ID').AsInteger,'OVCI');
      ds.Fld('GR20').AsInteger := dmBase.ReadPropAsInteger(d, q.Fld('ID').AsInteger,'KOZI');
      ds.Fld('GR21').AsInteger := dmBase.ReadPropAsInteger(d, q.Fld('ID').AsInteger,'KOZIMAT');
      ds.Fld('GR22').AsInteger := dmBase.ReadPropAsInteger(d, q.Fld('ID').AsInteger,'LOSHADI');
      ds.Fld('GR23').AsInteger := dmBase.ReadPropAsInteger(d, q.Fld('ID').AsInteger,'PTICA');

      ds.Post;
      q.Next;
      AppProcess;
      n:=n+1;
    end;
  end else begin
    PutError('not found dataset expVib_Obsl');
  end;
  dbClose(q);
end;


function Vigr_Lais_Tables : String;
begin
  Result := 'Nasel;Lgot;Adres;LicSchet;Ochered;Brak;Birth;Death;Property;Obrach';
end;
function Vigr_Lais_Prop : String;
begin
  Result := 'TABLETYPE=CDX;CHARTYPE=ANSI;ADD_ID=0';
end;

//----------------------------------------------------------------------------
function GetSOATOPunkt(dsSprNP:TDataSet; sPunkt:Integer):String;
begin
  Result:=''; 
  if dbLocate(dsSprNP,'ID',[sPUNKT],'') then begin
//    if (dsSprNP.Fld('DATE_DEATH').AsString<>'') or (not dsSprNP.Fld('NOT_RIAP').IsNull and dsSprNP.Fld('NOT_RIAP').AsBoolean) then begin  // если не пустая дата исключения
    if (not dsSprNP.Fld('NOT_RIAP').IsNull and dsSprNP.Fld('NOT_RIAP').AsBoolean) then begin  // если не пустая дата исключения
      Result:='*';   // не надо выгружать
    end;
    if (Result='') then begin
      if dsSprNP.Fld('VXOD').AsString<>'' then begin // Входит в состав др.нас.пункта (не имеет своего СОАТО)
        if dbLocate(dsSprNP,'SOATO',[dsSprNP.Fld('VXOD').AsString],'') then begin
          Result := dsSprNP.Fld('KOD').AsString; // Внутреннее ID СОАТО
        end;
      end else begin
        Result := dsSprNP.Fld('KOD').AsString; // Внутреннее ID СОАТО
      end;
    end;
  end;
end;
//----------------------------------------------------------------------------
// доработать выгрузку с учетом поля VXOD в справочнике нас. пунктов !!!
//----------------------------------------------------------------------------
function Vigr_Lais(strPath:String):Boolean;
var
  strSQL,sKod,sSOATO : String;
  lIskl,lVxod:Boolean;
  q,ds,dsAdres,dsSprNP,dsSOATO : TDataSet;
  d : TDateTime;
  nID,n,i : Integer;
  sl:TStringList;
  tb,tbMen:TDataSet;
begin
  d := dmBase.GetDateCurrentSost;
  nID:=GlobalTask.ParamAsInteger('ID');
  sKod:=GlobalTask.ParamAsString('KOD');
  dsSOATO:=dmBase.GetDataSet('СпрСОАТО');
  dsSprNP:=dmBase.GetDataSet('СпрНасПунктов');
  dsAdres:=dmBase.GetDataSet('БазаДомов');
  dsSprNP.First;
  Result:=true;
  sl:=TStringList.Create();
  while not dsSprNP.Eof do begin
    if Result then begin
      lVxod:=false;
//      if (dsSprNP.Fld('DATE_DEATH').AsString='') and (dsSprNP.Fld('NOT_RIAP').IsNull or not dsSprNP.Fld('NOT_RIAP').AsBoolean) then begin  // если пустая дата исключения
      if (dsSprNP.Fld('NOT_RIAP').IsNull or not dsSprNP.Fld('NOT_RIAP').AsBoolean) then begin  // если пустая дата исключения
        if (dsSprNP.Fld('KOD').AsString='') or (dsSprNP.Fld('SOATO').AsString='') then begin
          if dsSprNP.Fld('VXOD').AsString<>'' then begin // Входит в состав др.нас.пункта (не имеет своего СОАТО)
            sl.Add(dsSprNP.Fld('VXOD').AsString);
            lVxod:=true;
          end else begin
            Result:=false;
          end;
        end;
        if Result and not lVxod then begin
          if not dbLocate(dsSOATO,'ID',[dsSprNP.Fld('KOD').AsString],'') then begin
  //        PutError('Код населенного пункта "'+dsSprNP.Fld('NAME').AsString+'" отсутствует в справочнике территорий.');
            Result:=false;
          end else begin
            if dsSprNP.Fld('SOATO').AsString<>dsSOATO.Fld('KOD').AsString then begin
  //          PutError('Код СОАТО населенного пункта "'+dsSprNP.Fld('NAME').AsString+'" не соответствует коду в справочнике территорий.');
              Result:=false;
            end;
          end;
        end;
        if not Result then begin
          dsSprNP.Edit;
          dsSprNP.Fld('SOATO').AsString:='';
          dsSprNP.Fld('KOD').AsString:='';
          dsSprNP.Post;
        end;
      end;
    end;
    dsSprNP.Next;
  end;
  if Result then begin
    for i:=0 to sl.Count-1 do begin  // проверим которые входят в состав
      if dbLocate(dsSprNP,'SOATO',[sl.Strings[i]],'') then begin
        if (dsSprNP.Fld('KOD').AsString='') then begin
          Result:=false;
        end else if not dbLocate(dsSOATO,'ID',[dsSprNP.Fld('KOD').AsString],'') then begin
          Result:=false;
        end;
      end else begin
        Result:=false;
      end;
    end;
  end;
  sl.Free;
  dsSprNP.First;
  if not Result 
    then PutError('Не всем населенным пунктам проставлен код территории.');
  if Result then begin
   tb:=dbCreateMemTable('ID,Integer,0;','');
   tb.Open;
   tbMen:=dbCreateMemTable('ID,Integer,0;','');
   tbMen.Open;
  //-------- выгрузим население -----------------
    ChangeMessage('Выгрузка из таблицы населения ...');
//    strSQL := 'select * from население where date_fiks=&DATE_FIKS& and adres_id>0 and lic_id>0';
    strSQL := 'select * from население where date_fiks=&DATE_FIKS&';
    strSQL := dmBase.CheckDateFiksSQL(strSQL, d);
    q:=dbOpenSQL(strSQL,'');
    ds:=dbGetDataSet('fmMain.expNasel');
    n:=1;
    while not q.Eof do begin

      sSOATO:='';
      lIskl:=false;
      if q.Fld('ADRES_ID').AsInteger>0 then begin
        if dbLocate(dsAdres,'DATE_FIKS;ID',[d,q.Fld('ADRES_ID').AsInteger],'') then begin
          sSOATO:=GetSOATOPunkt(dsSprNP, dsAdres.Fld('PUNKT').AsInteger);
        end;
      end;
//      if sSOATO='' then writeDebug(dsAdres.Fld('PUNKT').AsString);

      if (sSOATO<>'*') then begin
        ds.Append;
        ds.Fld('SOATO_ID').AsString := sSOATO; // Внутреннее ID СОАТО
  
        ds.Fld('Ctzn_Fam').AsString  := q.Fld('FAMILIA').AsString;  
        ds.Fld('Ctzn_Name').AsString := q.Fld('NAME').AsString;     
        ds.Fld('Ctzn_Otch').AsString := q.Fld('OTCH').AsString;     
     
        tbMen.Append;
        tbMen.FieldByName('ID').AsInteger:=q.Fld('ID').AsInteger;
        tbMen.Post;
  
        ds.Fld('Ctzn_Id').AsString := q.Fld('ID').AsString;  // ID человека
        if q.Fld('LIC_ID').AsString=''
          then ds.Fld('PA_Id').AsString := '0'
          else ds.Fld('PA_Id').AsString := q.Fld('LIC_ID').AsString;  // ID лицевого счета
        if q.Fld('ADRES_ID').AsString=''
          then ds.Fld('Addr_Id').AsString := '0'  
          else ds.Fld('Addr_Id').AsString := q.Fld('ADRES_ID').AsString;  // ID адреса
        if not q.Fld('DATER').IsNull then ds.Fld('Ctzn_BD').AsDateTime := q.Fld('DATER').AsDateTime;
        ds.Fld('Ctzn_Sex').AsString := q.Fld('POL').AsString;  // ID адреса
        ds.Fld('Country_Id').AsString := q.Fld('CITIZEN').AsString;  // гражданство
        ds.Fld('Cfs_Id').AsString := q.Fld('SEM').AsString;  // ID семейного положения (key_semf из keylist.ini)
        ds.Fld('Nation_Id').AsString := q.Fld('NATION').AsString;  
        ds.Fld('WT_Id').AsString := q.Fld('ISWORK').AsString;  
        ds.Fld('Ctzn_WiV').AsBoolean := q.Fld('WORKSELO').AsBoolean;  
        ds.Fld('Educ_Id').AsString := q.Fld('OBRAZ').AsString;  
  
        ds.Fld('EducP_Id').AsString := q.Fld('STUDENT').AsString;       //??? ID места обучения (СпрГдеУчится)
        ds.Fld('EducM_Id').AsString := q.Fld('STUDENT_TYPE').AsString;  //??? ID типа образования (СпрТипОбучения) (дн.,веч.,заоч.)
        ds.Fld('Educ_Crs').AsString := q.Fld('KURS').AsString;  // номер курса
  
        ds.Fld('Pension_Id').AsString := q.Fld('PENS_TIP').AsString;  //??? ID типа пенсионера (СпрТиповПенсионеров)
        if not q.Fld('PENS_DATE').IsNull then ds.Fld('Ctzn_RD').AsDateTime := q.Fld('PENS_DATE').AsDateTime;
        if not q.Fld('DATES').IsNull then ds.Fld('Ctzn_DD').AsDateTime := q.Fld('DATES').AsDateTime;
        if not q.Fld('DATEP').IsNull then ds.Fld('Ctzn_DI').AsDateTime := q.Fld('DATEP').AsDateTime;
        if not q.Fld('DATEV').IsNull then ds.Fld('Ctzn_DO').AsDateTime := q.Fld('DATEV').AsDateTime;
        if q.Fld('CANDELETE').AsBoolean then begin
          ds.Fld('Ctzn_Rgstr').AsBoolean := false;  
          ds.Fld('Ctzn_LH').AsBoolean := false;  
        end else begin
          ds.Fld('Ctzn_Rgstr').AsBoolean := q.Fld('PROPIS').AsBoolean;  
          ds.Fld('Ctzn_LH').AsBoolean := q.Fld('PRESENT').AsBoolean;  
        end;
  
        ds.Post;
      end;

      q.Next;
      AppProcess;
      n:=n+1;
    end;
  //-------- выгрузим льготы -----------------
    ChangeMessage('Выгрузка из таблицы льготы ...');
    AppProcess;
    strSQL := 'select n.id, n.kod, s.name from НаселениеЛьготы n '+
              ' left join СпрЛьготников s on s.id=n.kod where date_fiks=&DATE_FIKS&';
    strSQL := dmBase.CheckDateFiksSQL(strSQL, d);
    dbChangeSQL(q, strSQL, true);
    ds:=dbGetDataSet('fmMain.expLgot');
    n:=1;
    while not q.Eof do begin
      if dbLocate(tbMen,'ID',[q.Fld('ID').AsInteger],'') then begin
        ds.Append;
        ds.Fld('Ctzn_Id').AsString := q.Fld('ID').AsString;      // ID человека
        ds.Fld('Prvlg_Id').AsString := q.Fld('KOD').AsString;    // ID льготы из локального справочника
        ds.Fld('Prvlg_Nm').AsString := q.Fld('NAME').AsString;  // название льготы
        ds.Post;
      end;
      q.Next;
      AppProcess;
      n:=n+1;
    end;
  //-------- выгрузим лиц. счета -----------------
    ChangeMessage('Выгрузка из таблицы лиц.счета ...');
    AppProcess;
    strSQL := 'select * from ЛицевыеСчета where date_fiks=&DATE_FIKS&'; // and date_likv is null';
    strSQL := dmBase.CheckDateFiksSQL(strSQL, d);
    dbChangeSQL(q, strSQL, true);
    ds:=dbGetDataSet('fmMain.expLicSchet');
     n:=1;
    while not q.Eof do begin
      sSOATO:='';
      lIskl:=false;
      if q.Fld('ADRES_ID').AsInteger>0 then begin
        if dbLocate(dsAdres,'DATE_FIKS;ID',[d,q.Fld('ADRES_ID').AsInteger],'') then begin
          if dbLocate(dsSprNP,'ID',[dsAdres.Fld('PUNKT').AsInteger],'') then begin
            sSOATO:=GetSOATOPunkt(dsSprNP, dsAdres.Fld('PUNKT').AsInteger);
          end;
        end;
      end;
//      if sSOATO='' then writeDebug(dsAdres.Fld('PUNKT').AsString);
      if (sSOATO<>'*') then begin
        tb.Append;
        tb.FieldByName('ID').AsInteger:=q.Fld('ID').AsInteger;
        tb.Post;

        ds.Append;
        ds.Fld('SOATO_ID').AsString := sSOATO; // Внутреннее ID СОАТО
        ds.Fld('PA_Id').AsString := q.Fld('ID').AsString;            // ID 
        if not q.Fld('DATE_LIKV').IsNull then
          ds.Fld('PA_DD').AsDateTime := q.Fld('DATE_LIKV').AsDateTime;     // Дата ликвидации лицевого счета
        if not q.Fld('DATE_SOZD').IsNull then
          ds.Fld('PA_DR').AsDateTime := q.Fld('DATE_SOZD').AsDateTime;     // Дата создания лицевого счета
        ds.Fld('Addr_Id').AsString := q.Fld('ADRES_ID').AsString;    // ID адреса
        ds.Fld('PA_OH').AsBoolean := q.Fld('OWN_HOUSE').AsBoolean;   // свой дом
        ds.Fld('AT_Id').AsString := '' //q.Fld('').AsString;         // ID типа проживания (СпрТипЖилья)
        ds.Post;
      end;
      q.Next;
      AppProcess;
      n:=n+1;
    end;
  //-------- выгрузим адреса -----------------
    ChangeMessage('Выгрузка из таблицы адресов ...');
    AppProcess;
    strSQL := 'select * from БазаДомов where date_fiks=&DATE_FIKS&';
    strSQL := dmBase.CheckDateFiksSQL(strSQL, d);
    dbChangeSQL(q, strSQL, true);
    ds:=dbGetDataSet('fmMain.expAdres');
     n:=1;
    while not q.Eof do begin

      lIskl:=false;
      sSOATO:=GetSOATOPunkt(dsSprNP, q.Fld('PUNKT').AsInteger);
//      if sSOATO='' then writeDebug(q.Fld('PUNKT').AsString);
      if (sSOATO<>'*') then begin
        tb.Append;
        tb.FieldByName('ID').AsInteger:=q.Fld('ID').AsInteger;
        tb.Post;
  
        ds.Append;
        ds.Fld('SOATO_ID').AsString := sSOATO; // Внутреннее ID СОАТО
        ds.Fld('Addr_Id').AsString := q.Fld('ID').AsString;    // ID адреса
        ds.Fld('HT_Id').AsString := q.Fld('TIP').AsString;    // 
        ds.Fld('Addr_Floor').AsString := q.Fld('ETAG').AsString;    // 
        ds.Fld('Addr_FlQ').AsString := q.Fld('KOL_ETAG').AsString;    // 
        ds.Fld('Addr_AH').AsString := q.Fld('GILFOND').AsString;    // 
        ds.Fld('Addr_FQ').AsString := '' // q.Fld('').AsString;    // ??? количество квартир
        ds.Post;
      end;

      q.Next;
      AppProcess;
      n:=n+1;
    end;
  //-------- выгрузим базу свойств -----------------
    ChangeMessage('Выгрузка из базы свойств ...');
    AppProcess;
    strSQL := 'select * from БазаСвойствОбъектов where date_fiks=&DATE_FIKS&';
    strSQL := dmBase.CheckDateFiksSQL(strSQL, d);
    dbChangeSQL(q, strSQL, true);
    ds:=dbGetDataSet('fmMain.expProperty');
    n:=1;
    while not q.Eof do begin
      if dbLocate(tb,'ID',[q.Fld('ID').AsInteger],'') then begin
        ds.Append;
        ds.Fld('ID').AsString := q.Fld('ID').AsString;    // ID 
        ds.Fld('TypeObj').AsString := q.Fld('TYPEOBJ').AsString;    // ID адреса
        ds.Fld('Pokaz').AsString := q.Fld('Pokaz').AsString;    // 
        ds.Fld('TypeSave').AsString := q.Fld('TypeSave').AsString;    // 
        ds.Fld('Value').AsString := q.Fld('Value').AsString;    // 
        if not q.Fld('NValue').IsNull then ds.Fld('NValue').AsFloat:=q.Fld('NValue').AsFloat;    // 
        ds.Post;
      end;
      q.Next;
      AppProcess;
      n:=n+1;
    end;
  //-------- выгрузим очередников -----------------
    ChangeMessage('Выгрузка из таблицы очередников ...');
    AppProcess;
//    strSQL := 'select * from Ochered';
    strSQL := 'select op.dater as reg_date, op.osnov as reg_osnov, ifnull(op.osnov_text,sp.name collate ads_default_cs) as reg_osnov_text, '+
              ' os.dater as isk_date, os.osnov as isk_osnov, ifnull(os.osnov_text,ss.name collate ads_default_cs) as isk_osnov_text, '+
              ' o.*  from Ochered o '+
         ' left join ocheredResh op on o.id_post_resh=op.auto_id  '+
         ' left join ocheredResh os on o.id_sn_resh=os.auto_id '+
         ' left join sysspr.sprPostOch sp on op.osnov=sp.id '+
         ' left join sysspr.sprSnOch ss on os.osnov=ss.id  ';
    dbChangeSQL(q, strSQL, true);
    ds:=dbGetDataSet('fmMain.expOchered');
    n:=1;
    while not q.Eof do begin
      if dbLocate(tbMen,'ID',[q.Fld('ID').AsInteger],'') then begin
        ds.Append;
        ds.Fld('Ctzn_Id').AsString := q.Fld('ID').AsString;    // ID человека
        ds.Fld('HL_Type').AsInteger := q.Fld('OCHERED_ID').AsInteger;    // ID очереди
        if not q.Fld('REG_DATE').IsNull then ds.Fld('HL_Bdate').AsDateTime := q.Fld('REG_DATE').AsDateTime;
        ds.Fld('HL_RInId').AsString := q.Fld('REG_OSNOV').AsString;    // ID причины
        ds.Fld('HL_RInT').AsString := q.Fld('REG_OSNOV_TEXT').AsString;    // текст причины
        if not q.Fld('ISK_DATE').IsNull then ds.Fld('HL_Edate').AsDateTime := q.Fld('ISK_DATE').AsDateTime;
        ds.Fld('HL_ROutID').AsString := q.Fld('ISK_OSNOV').AsString;    // ID причины
        ds.Fld('HL_ROutT').AsString := q.Fld('ISK_OSNOV_TEXT').AsString;    // текст причины
        ds.Post;
      end;
      q.Next;
      AppProcess;
      n:=n+1;
    end;
  //-------- выгрузим браки -----------------
    ChangeMessage('Выгрузка из таблицы закл.браков ...');
    AppProcess;
    strSQL := 'select DATEZ,ON_ID,ONA_ID from ЗаключениеБраков order by DATEZ';
    strSQL := dmBase.CheckDateFiksSQL(strSQL, d);
    dbChangeSQL(q, strSQL, true);
    ds:=dbGetDataSet('fmMain.expBrak');
    n:=1;
    while not q.Eof do begin
      ds.Append;
      ds.Fld('SOATO_Id').AsString := '';  // ???
      if not q.Fld('DATEZ').IsNull then ds.Fld('Wedd_Date').AsDateTime := q.Fld('DATEZ').AsDateTime;
      ds.Fld('Ctzn_HeID').AsString := q.Fld('ON_ID').AsString;    
      ds.Fld('Ctzn_SheID').AsString := q.Fld('ONA_ID').AsString;   
      ds.Post;
      q.Next;
      AppProcess;
      n:=n+1;
    end;
  //-------- выгрузим рождения -----------------
    ChangeMessage('Выгрузка из таблицы рожденеий ...');
    AppProcess;
    strSQL := 'select DATEZ,DATER from АктыРождений order by DATEZ';
    strSQL := dmBase.CheckDateFiksSQL(strSQL, d);
    dbChangeSQL(q, strSQL, true);
    ds:=dbGetDataSet('fmMain.expBirth');
    n:=1;
    while not q.Eof do begin
      ds.Append;
      ds.Fld('SOATO_Id').AsString := '';  // ???
      if not q.Fld('DATEZ').IsNull then ds.Fld('Wedd_Date').AsDateTime := q.Fld('DATEZ').AsDateTime;
      if not q.Fld('DATER').IsNull then ds.Fld('Ctzn_BD').AsDateTime := q.Fld('DATER').AsDateTime;
      ds.Post;
      q.Next;
      AppProcess;
      n:=n+1;
    end;
  //-------- выгрузим смерти -----------------
    ChangeMessage('Выгрузка из таблицы смертей ...');
    AppProcess;
    strSQL := 'select DATEZ,DATES from АктыСмертей order by DATEZ';
    strSQL := dmBase.CheckDateFiksSQL(strSQL, d);
    dbChangeSQL(q, strSQL, true);
    ds:=dbGetDataSet('fmMain.expDeath');
    n:=1;
    while not q.Eof do begin
      ds.Append;
      ds.Fld('SOATO_Id').AsString := '';  // ???
      if not q.Fld('DATEZ').IsNull then ds.Fld('Wedd_Date').AsDateTime := q.Fld('DATEZ').AsDateTime;
      if not q.Fld('DATES').IsNull then ds.Fld('Ctzn_DD').AsDateTime := q.Fld('DATES').AsDateTime;
      ds.Post;
      q.Next;
      AppProcess;
      n:=n+1;
    end;

  //-------- выгрузим обращения граждан -----------------
    ChangeMessage('Выгрузка из таблицы обращений ...');
    AppProcess;
    strSQL := 'select * from DOCMAIN d left join СпрМестРаботы c on c.ID=d.COVER_CORR '+
              'where d.DOC_TYPE=1 and d.GROUP_KIND=4 and ((d.COVER_CORR is null or not (isnull(d.APP_FORM,0)=1 and isnull(c.CORR_TYPE,0)=1 and isnull(d.COVER_TYPE,0)=1))) '+
                     ' and NOT_EXP=false';
    dbChangeSQL(q, strSQL, true);
    ds:=dbGetDataSet('fmMain.expObrach');
    n:=1;
    while not q.Eof do begin
      ds.Append;
//      ds.Fld('SOATO_Id').AsString := '';   ???
      if not q.Fld('REG_DATE').IsNull then ds.Fld('Reg_Date').AsDateTime := q.Fld('REG_DATE').AsDateTime;
      ds.Fld('App_Form').AsString := q.Fld('App_Form').AsString;    
      ds.Fld('App_Kind').AsString := q.Fld('App_Kind').AsString;    
      ds.Fld('Sign_Type').AsString := q.Fld('Sign_Type').AsString;    
      ds.Fld('Sign_Kind').AsString := q.Fld('Sign_Kind').AsString;    
      ds.Fld('Is_Repeat').AsBoolean := q.Fld('Is_Repeat').AsBoolean;    
      if q.Fld('Corr_Type').AsInteger=1 
       then ds.Fld('Corr_Type').AsBoolean := true    
       else ds.Fld('Corr_Type').AsBoolean := false;
      if not q.Fld('EXEC_TERM').IsNull then ds.Fld('EXEC_TERM').AsDateTime := q.Fld('EXEC_TERM').AsDateTime;
      if not q.Fld('EXEC_FACT').IsNull then ds.Fld('EXEC_FACT').AsDateTime := q.Fld('EXEC_FACT').AsDateTime;
      ds.Fld('Ans_Kind').AsString := q.Fld('Ans_Kind').AsString;    
      ds.Post;
      q.Next;
      AppProcess;
      n:=n+1;
    end;

    dbClose(q);
    sl:=TStringList.Create();
    sl.Add('[EXPORT]');
    sl.Add('VERSION=1');
    sl.Add('NAME='+ParamAsString('NAME'));
    sl.Add('SOATO_KOD='+sKod);
    sl.Add('SOATO_ID='+IntToStr(nID));
    sl.Add('DATE='+DTOS(Now,''));
    sl.SaveToFile(strPath+'\export_lais.ini');
    sl.Free;
    dbClose(tb);
    dbClose(tbMen);
  end;
end;


//----------------------------------------------------------------------------
//    !!!  "Riap_Zags" !!!   begin
//----------------------------------------------------------------------------
function Riap_Zags_ResultFile : String;
begin  
  // см. функцию в Stat_F23_ZAGS (reports.pas)
  Result:='Zags13_'+GlobalTask.GetWorkParam('GOD')+'_'+GlobalTask.ParamAsString('ID')+'.dbf'; 
end;
function Riap_Zags_Tables : String;
begin  
  Result:='Zags13'; 
end;
function Riap_Zags_Prop : String;
begin  
  Result:='TABLETYPE=CDX;CHARTYPE=ANSI;ADD_ID=0';
end;
//----------------------------------------------------------------------------
function Riap_Zags(strPath:String):Boolean;
var
  ds : TDataSet;
  nID : Integer;
begin
  nID:=GlobalTask.ParamAsInteger('ID');
  ds:=dbGetDataSet('fmMain.expZags13');
  ds.Append;
  ds.Fld('ID_ZAGS').AsInteger:=nID;
  ds.Fld('Date_Form').AsDateTime:=CurDS.Fld('Date_Form').AsDateTime;// Дата формирования
  ds.Fld('GOD').AsString:=GlobalTask.GetWorkParam('GOD');           // за какой год

  ds.Fld('RG_ALL').AsInteger  :=CurDS.Fld('NUM1').AsInteger;// Рождений всего
  ds.Fld('RG_M').AsInteger    :=CurDS.Fld('NUM2').AsInteger;//  в том числе мертворожденных
  ds.Fld('SM_ALL').AsInteger  :=CurDS.Fld('NUM3').AsInteger;// Смерти всего
  ds.Fld('SM_1').AsInteger    :=CurDS.Fld('NUM4').AsInteger;//  в том числе до года
  ds.Fld('BR_ALL').AsInteger  :=CurDS.Fld('NUM5').AsInteger;// Браки всего
  ds.Fld('BR_IN').AsInteger   :=CurDS.Fld('NUM6').AsInteger;//   в том числе в торжественной обстановке
  ds.Fld('BR_NS').AsInteger   :=CurDS.Fld('NUM7').AsInteger;//   в том числе с иностранцами
  ds.Fld('UO_ALL').AsInteger  :=CurDS.Fld('NUM8').AsInteger;// Установление отцовства
  ds.Fld('UO_SUD').AsInteger  :=CurDS.Fld('NUM9').AsInteger;//   в том числе по решению суда
  ds.Fld('CHNAME').AsInteger  :=CurDS.Fld('NUM10').AsInteger;// Перемена фамилии, имени, отчества
  ds.Fld('ADOPT').AsInteger   :=CurDS.Fld('NUM11').AsInteger;// Усыновления
  ds.Fld('ADOPT_IN').AsInteger:=CurDS.Fld('NUM12').AsInteger;//   в том числе иностранцами
  ds.Fld('UM').AsInteger      :=CurDS.Fld('NUM13').AsInteger;// Установление материнства
  ds.Fld('RAST').AsInteger    :=CurDS.Fld('NUM14').AsInteger;// Расторжений брака (без детей и имущ. претензий)
  ds.Fld('VOSTAN').AsInteger  :=CurDS.Fld('NUM15').AsInteger;// восстановлено актовых записей
  ds.Fld('VOSTAN_R').AsInteger:=CurDS.Fld('NUM16').AsInteger;//   в том числе рождений
  ds.Fld('BR_TO').AsInteger   :=CurDS.Fld('NUM17').AsInteger;// Браки в торжественной обстановке
  ds.Fld('RG_TO').AsInteger   :=CurDS.Fld('NUM18').AsInteger;// Рождений в торжественной обстановке
  ds.Fld('ZAK_ALL').AsInteger :=CurDS.Fld('NUM19').AsInteger;// Заключений всего
  ds.Fld('ZAK_OTK').AsInteger :=CurDS.Fld('NUM20').AsInteger;//   в том числе отказ
  ds.Fld('ANULIR').AsInteger  :=CurDS.Fld('NUM21').AsInteger;// анулировано актовых записей
  ds.Fld('SVADEB_Z').AsInteger:=CurDS.Fld('NUM22').AsInteger;// золотых свадеб
  ds.Fld('SVADEB_S').AsInteger:=CurDS.Fld('NUM23').AsInteger;// серебряных свадеб
  ds.Fld('POSHLINA').AsInteger:=CurDS.Fld('NUM24').AsInteger;// взыскано госуд. пошлины
  ds.Fld('PLAT').AsInteger    :=CurDS.Fld('NUM25').AsInteger;// взыскано платы за доп. услуги

  ds.Fld('ALL').AsInteger     :=ds.Fld('RG_ALL').AsInteger+ds.Fld('SM_ALL').AsInteger+ds.Fld('BR_ALL').AsInteger+  // Всего зарегистрировано 
                                ds.Fld('UO_ALL').AsInteger+ds.Fld('CHNAME').AsInteger+ds.Fld('ADOPT').AsInteger+
                                ds.Fld('UM').AsInteger+ds.Fld('RAST').AsInteger;
  ds.Post;
  Result:=true;
end;
//----------------------------------------------------------------------------
//    !!!  "Riap_Zags" !!!   end

//----------------------------------------------------------------------------
//    !!!  "Vigr_Energo" !!!   begin
//----------------------------------------------------------------------------
function EnergoExport : Boolean;
begin
  dmBase.AnyExport('Выгрузка для энегросетей ...','&Vigr_Energo',false,false,'#PATH_EXPORT','explore');
end;
//----------------------------------------------------------------------------
function Vigr_Energo_ResultFile : String;
begin  
  Result:='energo_'+GlobalTask.ParamAsString('ID')+'.dbf'; 
end;
function Vigr_Energo_Tables : String;
begin  
  Result:='Energo'; 
end;
function Vigr_Energo_Prop : String;
begin  
  Result:='TABLETYPE=CDX;CHARTYPE=ANSI;ADD_ID=0';
end;
//----------------------------------------------------------------------------
function Vigr_Energo(strPath:String):Boolean;
var
  ds : TDataSet;
  n : Integer;
  q,qR,qL,qA:TDataSet;
  sSQL,sSQLRazd,sSQLLgot,sSQLRegJ:String;
begin
  sSQLRazd:='select adres_id ID, count(id) kolvo from ЛицевыеСчета l where date_fiks=''1899-12-30'' and id>0 group by 1 having count(*)>1 ';
  sSQLRegJ:='select lic_id id, count(id) kolvo from Население n where date_fiks=''1899-12-30'' and n.propis=true and n.dates is null and lic_id>0 group by 1 ';
  sSQLLgot:='select en_lic_id id , count(*) kolvo from '+
            '(select d.id, en_lic_id, n.lic_id from НаселениеДоп d '+
             ' left join Население n on n.date_fiks=''1899-12-30'' and n.id=d.id'+
              ' where en_lic_id is not null and en_lic_id=n.lic_id and n.propis=true and n.dates is null ) aaa group by 1 ';
  sSQL:='SELECT n.familia,n.name,n.otch,l.id, l.adres_id, l.nomer, upper(tp.fname) tnp, upper(sp.name) np, upper(trim(stu.name)+su.name) ul, trim(a.dom) dom, trim(a.kv) kv, a.korp FROM ЛицевыеСчета l '+
        ' LEFT JOIN БазаДомов a ON a.date_fiks=l.date_fiks and l.adres_id=a.id '+
        ' LEFT JOIN СпрНасПунктов sp ON sp.id=a.punkt '+
        ' LEFT JOIN sysspr.TypePunkt tp ON tp.id=sp.typepunkt '+
        ' LEFT JOIN СпрУлиц su ON su.id=a.ul '+
        ' LEFT JOIN СпрТипУлиц stu ON stu.id=su.tip '+
        ' LEFT JOIN Население n ON n.date_fiks=''1899-12-30'' and n.id=l.first '+
        ' WHERE l.date_fiks=''1899-12-30'' ORDER BY l.nomer';
//  n:=dmBase.CountMensEx( DateFiks, ds.FieldByName('ID').AsString, FTypeCountMens);
  q:=dbOpenSQL(sSQL, '');
  qR:=dbOpenSQL(sSQLRegJ, '');
  qL:=dbOpenSQL(sSQLLgot, '');
  qA:=dbOpenSQL(sSQLRazd, '');
//  nID:=GlobalTask.ParamAsInteger('ID');
  ds:=dbGetDataSet('fmMain.expEnergo');
  while not q.Eof do begin
    ds.Append;
    if dbLocate(qA,'ID',[q.Fld('ADRES_ID').AsInteger],'') then ds.Fld('RAZD').AsString:='1' else ds.Fld('RAZD').AsString:='0';
    ds.Fld('SCET').AsString:=q.Fld('NOMER').AsString;
    ds.Fld('TNP').AsString:=q.Fld('TNP').AsString;
    ds.Fld('NP').AsString:=q.Fld('NP').AsString;
    ds.Fld('UL').AsString:=q.Fld('UL').AsString;
    ds.Fld('FIO').AsString:=q.Fld('FAMILIA').AsString+' '+q.Fld('NAME').AsString+' '+q.Fld('OTCH').AsString;
    ds.Fld('DOM').AsString:=q.Fld('DOM').AsString;
    ds.Fld('KV_N').AsString:=q.Fld('KV').AsString;
    if dbLocate(qR,'ID',[q.Fld('ID').AsInteger],'') then n:=qR.Fld('KOLVO').AsInteger else n:=0;
    ds.Fld('REGJ').AsInteger:=n;
    if dbLocate(qL,'ID',[q.Fld('ID').AsInteger],'') then n:=qL.Fld('KOLVO').AsInteger else n:=0;
    ds.Fld('LGOT').AsInteger:=n;
    ds.Post;
    q.Next;
    AppProcess;
  end;
  dbClose(q);
  dbClose(qR);
  dbClose(qL);
  dbClose(qA);
  Result:=true;
end;
//----------------------------------------------------------------------------
