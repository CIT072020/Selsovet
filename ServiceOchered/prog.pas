//{$DEFINE ADD_NOT_IN}

program Main;
var
  idConn, idConnShared, TypeBASE : String;
//  idTmpConn : String;
  nVersion, nVerBase : Integer;
  lCheckLicPresent, lCheckPrichSm, lCheckPerevod, lCheckIsporSvid : Boolean;
  arrCheck : array[0..50] of Boolean;
  ds1,CurDS : TDataSet;
  //для реорганизации ВУС
  sFieldVUS : String;
  dsVUS : TDataSet;
  lCheckOtnosh:Boolean;
  sTmpWHERE:String;
  lCheckOchered1:Boolean;
  _resh:TReshOchMen;
//  curMen:TMens;
const
  PENS_G='55';  //пенсионный возраст женщин
  PENS_M='60';  //пенсионный возраст мужчин
  strType_Lich = '2';
  strType_Adres= '1';
  defGrag = 112;
  az_brak    = '5';
  az_rogd    = '6';
  az_smert   = '7';
  az_ustotc  = '8';
  az_ustmat  = '18';
  az_rast    = '11';
  az_adopt   = '12';
  az_chname  = '13';
  datecursostS='1899-12-30';
  datecursostF='18991230';
  BEZ_ADRESA  = 3; //  человек не проживает и не зарегистрирован (чужой)

  MESTO_GIT=1;
  MESTO_PREB=0;
  MESTO_NOTREG=2;
  IZM_MEN=2;     // изменить данные о человеке   
  NOT_DVIG=3;    // не проводить                 

  SHAMP_=1;
  SHAMP_GERB=2;

  MAX_OCHERED=4;   //  максим. номер очереди (участок)

  OCH_RESH_POST=1;
  OCH_RESH_VOST=2;
  OCH_RESH_RAZD=3;
  OCH_RESH_PERE=4;
  OCH_RESH_UNION=5;
  OCH_RESH_SN=9;
  OCH_RESH_ADDMEN=6;
  OCH_RESH_ISKMEN=7;
  OCH_RESH_PERENOS=8;

  OCH_RESID_OBSH=1;    // residence=общежитие

  OCH_TYPE_OBSH=0;   // общий списк
  OCH_TYPE_MNOGO=1;
  OCH_TYPE_SOCIAL=2; // социальное жилье
  OCH_TYPE_VOEN=3;
  OCH_TYPE_UCH=4;

  OCH_TYPE_ANY_OTD=1000; // любая отдельная

  OCH_OSN_FULL=1;   // полное наименование
  OCH_OSN_FULL2=6;   // полное наименование + наименование указа
  OCH_OSN_KRAT=2;   // краткое + наименование указа
  OCH_OSN_UKAZ=3;   // пункт + наименование указа
  OCH_OSN_POLOG=4;  // пункт + положение
  OCH_OSN_PUNKT=5;  // только номер пункта

 VID_OPEKA_DO14 =1; // опека до 14 лет
 VID_OPEKA_NOT  =2; // опека над недееспособным
 VID_POPECH_DO18=101; // попечит. до 18 лет
 VID_POPECH_NOT =102; // попечит. над недееспособным
 CHILD_SIROTA =1;   // сирота
 CHILD_POPECH =2;   // без попечения
 FORMA_GOSUD=1;     // государственная
 FORMA_OPEKA=2;     // опекунская семья
 FORMA_PRIEM=3;     // приемная семья
 FORMA_HOUSE=4;     // детский дом семейного типа
 FORMA_DEREV=5;     // детская деревня

{$DEFINE OBR_GRAG}
//{$DEFINE OCHERED}
//{$DEFINE CHECK_ATE}

// доступность процедур для похозяйственного учета
{$DEFINE ADD_PU}

{$I load.pas}
{$I template.pas}
{$I template_b.pas}
{$I ochered.pas}
{$I minsk.pas}
{$I reports.pas}
{$I update.pas}
{$I obrabotka.pas}
{$I export.pas}
{$I excel.pas}
{$I zags.pas}
{$I pu.pas}
{$I personal.pas}

//--------------------------------------------------------------------
procedure InitScript;
begin
//  Showmessage(GetPadegNominative('Ивановым Николаем Петровичем'));
  lCheckOtnosh:=ParamAsBoolean('CHECK_OTNOSH');
  _resh:=TReshOchMen.Create;
//  curMen:=TMens.Create;
  SetNameExcel('Excel.Application');
  sFieldVUS:='';
  CreateReportTable('ZAGS',true);
  CreateReportTable('DOC_QREP',true);
  if IDProg()='SELSOVET' then begin
    CreateReportTable('GRUP',true);
  end;
  idConnShared:=dbRegisterConnect('AdsSharedConnection','CHARTYPE=ANSI;TABLETYPE=ADT');
  idConn:=dbRegisterConnect('AdsConnection','CHARTYPE=ANSI;TABLETYPE=ADT');

  TypeBASE:=GlobalTask.GetWorkParam('TYPEBASE');
  if TypeBASE='' then TypeBASE:='SELSOVET';
//  ShowMessage('*'+TypeBase+'*');
//  ShowMessage(GetPadegIF('Мария Анна','Ивановна', 'Ж', 'Р'));
//  XL:=GetOfficeObject('Excel',lOk);
//  if lOk then begin
//    ShowMessage('Ok!');
//    XL.WorkBooks.Add;
//    XL.Visible:=true;
//    XL:=null;
//  end;

{
  m:=TMens.Create;
  if m.Read(54) then begin

    ShowMessage('"'+m.Fld('AC_RESH').asString+'" '+m.Fld('FAMILIA').asString+' '+m.Fld('NAME').asString+' '+m.Fld('OTCH').asString+chr(13)+m.adres.getadres);
  end;
  m.Free;
}
 // SeekValueSpr('СпрОтношений','ID','11','NAME');

//  ShowMessage('отдел загс Кобринского райисполкома'+Chr(13)+Chr(10)+GetPadeg('отдел загс Кобринского райисполкома','Т'));
//  if OkWarning('11111111'+Chr(13)+'2222222222222222222222222') then
//    ShowMessage('OK');
//  ShowMessage(dmBase.getBelNazv(2,false,'Лунинецкий'));
end;

//--------------------------------------------------------------------
procedure ExitScript;
//var
//  WordDoc: Variant;
begin
  _resh.Free;
//  curMen.Free;
//  WordDoc := CreateOleObject('Word.Application');
//  WordDoc.Visible := True;
end;

procedure AfterUpdateParams;
begin
  lCheckOtnosh:=ParamAsBoolean('CHECK_OTNOSH');
end;

function CheckNameUl(strName : String): String;
var
  sl : TStringList;
  i : Integer;
begin
  sl := TStringList.Create;
  StrToStrings(strName, sl, ' ');
  if sl.Count=1 then begin
    Result := FirstUpper(strName);
  end else begin
    Result := FirstUpper(sl[0]);
    for i:=1 to sl.Count-1 do begin
      if Copy(sl.Strings[i],1,1)='"' 
        then  Result := Result + ' ' + sl[i]
        else  Result := Result + ' ' + ANSILowerCase(sl[i]);
    end;
  end;
  sl.Free;
end;

//-------------------------------------------------------------------------
procedure FirstLoadTerr;
var
  dsUL_Nal, dsUL, dsSour, dsDest : TDataSet;
  strTerr, strAdd : String;
begin
  dsSour := dbGetDataSet('dmBase.tbAdres');
  if dsSour.RecordCount>0 then begin
    ShowMessage(' База адресов должна быть пуста ! ');
  end else begin
  strTerr := GlobalTask.ParamAsString('KOD');
  if dbSetCurrentConnect(idConn) then begin
    SetScreenCursor('HOURCLASS');
    dsSour:=dbOpenSQL('SELECT kod,name,typepunkt,id FROM SysSpr.СпрСОАТО ORDER BY KOD','');
//    dsSour:=dbOpenSQL('SELECT kod, name FROM SysSpr.СпрСОАТО WHERE SUBSTRING(kod,1,7)='+''''+Copy(GlobalTask.ParamAsString('СОВЕТ'),1,7)+''''+
//             ' and SUBSTRING(kod,8,3)<>'+''''+'000'+'''','');

//    dsSour := dbGetDataSet('dmBase.SprSoato');
    if dsSour<>nil then begin
//      if IdProg()='GKH' then begin

//      end else begin
        if Copy(strTerr,2,1)='4' then begin // большой город + нас. пункт подч. гор. совету
          dsSour.Filter := 'kod='+''''+Copy(strTerr,1,4)+'000000'+''''+ ' or '+
           '(substr(kod,1,4)='+''''+Copy(strTerr,1,4)+''''+' and substr(kod,5,3)>'+''''+'500'+''''+
           ' and !Empty(typepunkt) )';
//where substring(kod,1,7)=:par+'000' or
// (substring(kod,1,4)=:par and substring(kod,5,3)>'500' and typepunkt is not null)
        end else begin
          if Copy(strTerr,5,1)='7' then begin // поселковый совет
            dsSour.Filter := 'SUBSTR(kod,1,7)='+''''+Copy(strTerr,1,7)+''''+
                             ' and SUBSTR(kod,8,3)<>'+''''+'000'+''''+
                             ' or kod='+QStr(Copy(strTerr,1,4)+'5'+Copy(strTerr,6,5));
          end else if Copy(strTerr,5,1)='5' then begin // городской совет
            dsSour.Filter := 'SUBSTR(kod,1,7)='+''''+Copy(strTerr,1,7)+'''';
          end else begin
            dsSour.Filter := 'SUBSTR(kod,1,7)='+''''+Copy(strTerr,1,7)+''''+
                             ' and SUBSTR(kod,8,3)<>'+''''+'000'+'''';
          end;
        end;
//      end;
      dsSour.Filtered := true;
      dsDest := dbGetDataSet('dmBase.SprPunkt');
      if dsDest<>nil then begin
        if dbExecuteSQL('DELETE FROM СпрНасПунктов') then begin
//        if dbZap(dsDest) then begin
          while not dsSour.Eof do begin
            dsDest.Append;
            dsDest.Fld('SOATO').AsString := dsSour.Fld('KOD').AsString;
            dsDest.Fld('NAME').AsString  := dsSour.Fld('NAME').AsString;
            dsDest.Fld('TYPEPUNKT').AsString := dsSour.Fld('TYPEPUNKT').AsString;
            dsDest.Fld('KOD').AsString   := dsSour.Fld('ID').AsString;
            dsDest.Post;
            dsSour.Next;
          end;
        end else begin
          RestScreenCursor;
          ShowMessage(dbLastError());
        end;
      end;
      dsDest.First;
      dsSour.Filtered := false;
//      dbClose(dsSour);
    end else begin
      RestScreenCursor;
      ShowMessage(dbLastError());
    end;
    if Copy(strTerr,5,1)='7' 
      then strAdd := ' or soato='+QStr(Copy(strTerr,1,4)+'5'+Copy(strTerr,6,5)) // поселковый совет
      else strAdd := '';
    dsUL_Nal:=dbOpenSQL('SELECT distinct name,tip FROM SysSpr.SprUlNal WHERE SUBSTRING(soato,1,7)='+''''+Copy(strTerr,1,7)+''''+ strAdd + ' ORDER BY name','');
    if dsUL_Nal<>nil then begin
      dsUL   := dbGetDataSet('dmBase.SprUL');
      if dsUL<>nil then begin
        if dbExecuteSQL('DELETE FROM СпрУлиц') then begin
//        if dbZap(dsUL) then begin
          while not dsUL_Nal.Eof do begin
            dsUL.Append;
            dsUL.Fld('NAME').AsString:=CheckNameUl(dsUL_Nal.Fld('NAME').AsString);
            dsUL.Fld('TIP').AsString     := dsUL_Nal.Fld('TIP').AsString;
            dsUL.Post;
            dsUL_NAL.Next;
          end;
        end else begin
          RestScreenCursor;
          ShowMessage(dbLastError());
        end;
      end;
      dbClose(dsUL_Nal);
    end;
    dbClose(dsSour);
    RestScreenCursor;
  end else begin
    ShowMessage('не обнаружен Connect '+idConn);
  end;
  end;
end;

//-------------------------------------------------------------------------
procedure CheckKodSoatoSprPunkt;
var
  dsSOATO,dsSprNP,dsSOVET : TDataSet;
  lOk,lErr:Boolean;
begin
  dsSOATO := dbGetDataSet('dmBase.SprSoato');
  dsSprNP := dbGetDataSet('dmBase.SprPunkt');
  dsSprNP.First;
  lErr:=false;
  dsSOVET:=dbOpenSQL('SELECT kod,name,typepunkt,id FROM SysSpr.СпрСОАТО WHERE SUBSTRING(kod,1,7)='+''''+Copy(GlobalTask.ParamAsString('KOD'),1,7)+'''','');
  while not dsSprNP.Eof do begin
    lOk:=true;
    if (dsSprNP.Fld('KOD').AsString='') or (dsSprNP.Fld('SOATO').AsString='') then begin
      lOk:=false;
    end;
    if lOk then begin
      if not dbLocate(dsSOATO,'ID',[dsSprNP.Fld('KOD').AsString],'') then begin
        lOk:=false;
      end else begin
        if dsSprNP.Fld('SOATO').AsString<>dsSOATO.Fld('KOD').AsString then begin
          lOk:=false;
        end;
      end;
    end;
    if not lOk then begin
      dsSOVET.Filter:='name='+''''+dsSprNP.Fld('NAME').AsString+'''';
      dsSOVET.Filtered:=true;
      if not dsSOVET.Eof then begin
        dsSOVET.Next;  
        if dsSOVET.Eof then begin // проверим что только одна запись
          dsSOVET.First;
          dsSprNP.Edit;
          dsSprNP.Fld('SOATO').AsString:=dsSOVET.Fld('KOD').AsString;
          dsSprNP.Fld('KOD').AsString:=dsSOVET.Fld('ID').AsString;
          dsSprNP.Fld('TYPEPUNKT').AsString:=dsSOVET.Fld('TYPEPUNKT').AsString;
          dsSprNP.Post;
        end;
      end else begin
        lErr:=true;
        dsSprNP.Edit;
        dsSprNP.Fld('SOATO').AsString:='';
        dsSprNP.Fld('KOD').AsString:='';
        dsSprNP.Post;
      end;
      dsSOVET.Filtered:=false;
    end;
    dsSprNP.Next;
  end;
  dbClose(dsSOVET);
  dsSprNP.First;
  if lErr then PutError('Обнаружены ошибки.')
          else ShowMessage('Ошибки не обнаружены.');
end;

//--------------------------------------------------------------------------------
procedure FirstLoadUL;
var
  dsUL_Nal, dsUL, dsTip,dsSour, dsDest : TDataSet;
  strTerr, strAdd : String;
begin
  strTerr:=GlobalTask.ParamAsString('KOD');
  strAdd:='';
  if dbSetCurrentConnect(idConn) then begin
    SetScreenCursor('HOURCLASS');
    if Copy(strTerr,1,1)='5' then begin // минск
      dsUL_Nal:=dbOpenSQL('SELECT distinct name,tip FROM SysSpr.SprUlNal WHERE SUBSTRING(soato,1,1)='+''''+Copy(strTerr,1,1)+''''+ strAdd + ' ORDER BY name','');
    end else begin
      if (Copy(strTerr,5,3)='000') or (Copy(strTerr,2,1)='4') // город областного подчинения
        then dsUL_Nal:=dbOpenSQL('SELECT distinct name,tip FROM SysSpr.SprUlNal WHERE SUBSTRING(soato,1,4)='+''''+Copy(strTerr,1,4)+''''+ strAdd + ' ORDER BY name','')
        else dsUL_Nal:=dbOpenSQL('SELECT distinct name,tip FROM SysSpr.SprUlNal WHERE SUBSTRING(soato,1,7)='+''''+Copy(strTerr,1,7)+''''+ strAdd + ' ORDER BY name','');
    end;
    if dsUL_Nal<>nil then begin
      dsUL   := dbGetDataSet('dmBase.SprUL');
      if dsUL<>nil then begin
        if dbExecuteSQL('DELETE FROM СпрУлиц') then begin
//        if dbZap(dsUL) then begin
          while not dsUL_Nal.Eof do begin
            dsUL.Append;
            if ParamAsBoolean('AKT_UPPER') then begin   // актовые записи в верхнем регистре
              dsUL.Fld('NAME').AsString:=ANSIUpperCase(dsUL_Nal.Fld('NAME').AsString);
            end else begin
              dsUL.Fld('NAME').AsString:=CheckNameUl(dsUL_Nal.Fld('NAME').AsString);
            end;
            dsUL.Fld('TIP').AsString     := dsUL_Nal.Fld('TIP').AsString;
            dsUL.Post;
            dsUL_NAL.Next;
          end;
          if ParamAsBoolean('AKT_UPPER') then begin   // актовые записи в верхнем регистре
            dsTip:=dbGetDataSet('dmBase.SprTypeUL');
            dsTip.First;
            while not dsTip.Eof do begin
              dsTip.Edit;
              dsTip.Fld('NAME').AsString:=ANSIUpperCase(dsTip.Fld('NAME').AsString);
              dsTip.Fld('FNAME').AsString:=ANSIUpperCase(dsTip.Fld('FNAME').AsString);
              dsTip.Post;
              dsTip.Next;
            end;
            dsTip.First;
          end;
        end else begin
          RestScreenCursor;
          ShowMessage(dbLastError());
        end;
      end;
      dbClose(dsUL_Nal);
    end;
    RestScreenCursor;
  end else begin
    ShowMessage('не обнаружен Connect '+idConn);
  end;
end;

//--------------------------------------------------------------------------------
// запись фамилии специалиста по-белорусски
procedure WriteSpecBel(sType:String;ds:TDataSet);
var
  fld : TField;
begin
//  if IDPROG()='SELSOVET' then begin
    fld := ds.FindField('SPEC_B');
    if (fld<>nil) and ParamAsBoolean('PR_SPEC_SVID') then begin
      ds.Fld('SPEC_B').AsString := Parameters('СПЕЦ_ЗАГС_Б');   
    end;
    fld := ds.FindField('RUKOV_D');
    if (fld<>nil) then  fld.AsString:=Parameters('DOLG_RUK_ZAGS');   
    fld := ds.FindField('SPEC_D');
    if (fld<>nil) then  fld.AsString:=Parameters('DOLG_SPEC');   
//  end;
end;

//{$DEFINE ADD_OLD_AKT}

// SubType:  VUS - карточка ВУС,   OCH - очередник,  NAS - из реестра населения,  LIC - из лицевого счета 
function Men_Report(SubType,Tabs:String) : String;
begin
  if IDProg1()='O' then begin // OCHERED
    AddReport('Карточка очередника','&Карточка очередника.fr3');
    AddReport('Справка о состоянии на учете нуждающихся','&Справка о состоянии на учете нуждающихся.fr3'); 
    Result := '&LIST&';
  end else begin
    if (SubType='OTD') and Men.Fld('VUS').AsBoolean then begin
      if (Tabs='') or (Pos('VUS;',Tabs)>0) then begin
        AddReport('Карточка первичного учета ВУС','&ВУС карточка первичного учета.frf');
        AddReport('Карточка первичного учета ВУС (формат А4)','&ВУС карточка первичного учетаA4.frf');
        AddReport('Карточка первичного учета ВУС (160х230)','&ВУС карточка первичного учета 160х230.frf');
        AddReport('Алфавитная карточка','&Алфавитная карточка.frf');
      end;
    end;
    if (SubType='OTD') and Men.Fld('OCHERED').AsBoolean then begin
      if (Tabs='') or (Pos('OCH;',Tabs)>0) then begin
        AddReport('Карточка очередника','&Карточка очередника.fr3');
      end;
    end;
    AddReport('Карточка регистрации','&Карточка регистрации(население).fr3');
    AddReport('Справка о состоянии на учете нуждающихся','&Справка о состоянии на учете нуждающихся.fr3'); 
    Result := '&LIST&';
  end;
end;

procedure Men_AfterCreate;
var
//  ds : TDataSet;
  i : Integer;
begin
  i := ParamAsInteger('GOSUD');
  if i>0 then  Men.Fld('CITIZEN').AsInteger := i;
  Men.Fld('POL').AsString:='М';
  Men.Fld('PROPIS').AsBoolean:=true;
  Men.Fld('NOTSELECT').AsBoolean:=false;
  Men.Fld('PASP_UDOST').AsInteger:=1;
  Men.Fld('VUS').AsBoolean:=false;

  Men.Fld('ISKL').AsBoolean:=false;
  Men.Fld('SOCIAL').AsInteger:=0;
  Men.Fld('SIROTA').AsBoolean:=false;
  Men.Fld('UCHASTOK').AsBoolean:=false;
  Men.Fld('IS_UCHASTOK').AsBoolean:=false;
  Men.Fld('MR_B_RESP').AsBoolean:=true;
  Men.Fld('MR_B_OBL').AsBoolean:=true;
  Men.Fld('OP_B_RESP').AsBoolean:=true;
  Men.Fld('OP_B_OBL').AsBoolean:=true;
  Men.Fld('SPEC_UCH').AsBoolean:=false;
//  ds := dbGetDataSet('dmMen.mtDokument');
//  if ds<>nil then begin
//    i := ParamAsInteger('GOSUD');
//    if i>0 then
//      ds.Fld('CITIZEN').AsInteger := i;   // гражданство по умолчанию Беларусь
//    ds.Fld('POL').AsString := 'М';        // пол по умолчанию мужской
//  end;
end;


procedure Men_Familia;
var
  sl : TStringList;
  s:String;
begin
  s:=Trim(Men.Fld('Familia').AsString);
  if s<>'' then begin
   Men.Fld('Familia').AsString:=FirstUpper(s);
  {
   sl := TStringList.Create;
   StrToStrings(s, sl, ' ');
   if sl.Count=3 then begin
     if Trim(Men.Fld('Name').AsString)='' then begin
       Men.Fld('Familia').AsString:=Trim(FirstUpper(sl[0]));
       Men.Fld('Name').AsString:=Trim(FirstUpper(sl[1]));
       Men.Fld('Otch').AsString:=Trim(FirstUpper(sl[2]));
     end else begin
       Men.Fld('Familia').AsString:=FirstUpper(s);
     end;
   end else begin
     Men.Fld('Familia').AsString:=FirstUpper(s);
   end;
   sl.Free;
   }
  end;
end;

procedure Men_Name;
begin
  Men.Fld('Name').AsString := Trim(FirstUpper(Men.Fld('Name').AsString));
end;

procedure Men_Otch;
begin
  Men.Fld('Otch').AsString := Trim(FirstUpper(Men.Fld('Otch').AsString));
end;

procedure Men_PASP_DATE;
begin
  if Men.Fld('PASP_VIDAN').AsString='' 
    then Men.Fld('PASP_VIDAN').AsString:=ParamAsString('PASP_ORGAN');
end;

function Spr27(sField:String):String;
begin
  Result:='';
//  ShowMessage(LicSchet.Mens.FIO);
end;

function SetTmpDataSet1( strNameDataSet : String) : Boolean;
begin
  ds1 := dbGetDataSet(strNameDataSet);
  if ds1=nil then Result:=false else Result:=true;
end;

function Raschet_Lich_Zakl(lRazdel1 : Boolean; lRazdel2 : Boolean; lPosev:Boolean) : Boolean;
var
  lMeat, lMoloko : Boolean;
  n1,n2 : Extended;
begin
  Result := true;
  if lPosev then begin  // посевная площадь
    ds1.Fld('POSEV').AsFloat := ds1.Fld('POSEV_ZERN').AsFloat+
      ds1.Fld('POSEV_KART').AsFloat+ds1.Fld('POSEV_OV').AsFloat+
      ds1.Fld('POSEV_KORM').AsFloat+ds1.Fld('POSEV_TRAV').AsFloat;
  end;
  if lRazdel1 and (Globaltask.ParamAsString('VER_UCHET')='1') then begin  // расчет производства животноводства
    lMeat   := false;
    lMoloko := false;
    if Globaltask.ParamAsFloat('UROG_KOROV')>0 then begin
      ds1.Fld('K_MEAT').AsFloat:= (ds1.Fld('KOROVA').AsInteger+ds1.Fld('TELKI1').AsInteger) * Globaltask.ParamAsFloat('UROG_KOROV');
      lMeat := true;
    end;
    if Globaltask.ParamAsFloat('UROG_M_KOR')>0 then begin 
      ds1.Fld('KOR_MOLOKO').AsFloat:= ds1.Fld('KOROVA').AsInteger * Globaltask.ParamAsFloat('UROG_M_KOR');
      lMoloko := true;
    end;
    if Globaltask.ParamAsFloat('UROG_SV')>0 then begin 
      ds1.Fld('S_MEAT').AsFloat:= ds1.Fld('SVINI').AsInteger * Globaltask.ParamAsFloat('UROG_SV');
      lMeat := true;
    end;
    if Globaltask.ParamAsFloat('UROG_M_KOZ')>0 then begin
      ds1.Fld('KOZ_MOLOKO').AsFloat:= ds1.Fld('KOZIMAT').AsInteger * Globaltask.ParamAsFloat('UROG_M_KOZ');
      lMoloko:=true;
    end;
    if Globaltask.ParamAsFloat('UROG_JAICA')>0 then ds1.Fld('JAICA').AsInteger:= ds1.Fld('PTICA').AsInteger * Globaltask.ParamAsInteger('UROG_JAICA');
    if Globaltask.ParamAsFloat('UROG_PCHELI')>0 then ds1.Fld('MED').AsFloat:= ds1.Fld('PCHELI').AsInteger * Globaltask.ParamAsFloat('UROG_PCHELI');
    if Globaltask.ParamAsFloat('UROG_PTICA')>0 then n1 := ds1.Fld('PTICA').AsInteger * Globaltask.ParamAsFloat('UROG_PTICA');
    if Globaltask.ParamAsFloat('UROG_KROL')>0 then n2 := ds1.Fld('KROL').AsInteger * Globaltask.ParamAsFloat('UROG_KROL');
    if (n1>0) or (n2>0) then begin
      ds1.Fld('P_MEAT').AsFloat := n1+n2;
      lMeat := true;
    end;
    if lMeat then begin
      ds1.Fld('MEAT').AsFloat:=ds1.Fld('K_MEAT').AsFloat+ds1.Fld('S_MEAT').AsFloat+ds1.Fld('P_MEAT').AsFloat
    end;
    if lMoloko then begin
      ds1.Fld('MOLOKO').AsFloat:=ds1.Fld('KOR_MOLOKO').AsFloat+ds1.Fld('KOZ_MOLOKO').AsFloat;
    end;
  end;
  if lRazdel2 and (Globaltask.ParamAsString('VER_UCHET')='1') then begin  // расчет производства продукции
    if Globaltask.ParamAsFloat('UROG_JAGOD')>0 then  ds1.Fld('PR_JAGOD').AsFloat := ds1.Fld('POSEV_JAG').AsFloat * Globaltask.ParamAsFloat('UROG_JAGOD');
    if Globaltask.ParamAsFloat('UROG_KART')>0 then  ds1.Fld('PR_KART').AsFloat := ds1.Fld('POSEV_KART').AsFloat * Globaltask.ParamAsFloat('UROG_KART');
    if Globaltask.ParamAsFloat('UROG_ZERN')>0 then  ds1.Fld('PR_SERNO').AsFloat:= ds1.Fld('POSEV_ZERN').AsFloat * Globaltask.ParamAsFloat('UROG_ZERN');

    if (Globaltask.ParamAsFloat('UROG_OVZ')>0) and (Globaltask.ParamAsFloat('UROG_OV')>0) then begin
       ds1.Fld('PR_OVOCH_Z').AsFloat:= ds1.Fld('POSEV_OVZ').AsFloat * Globaltask.ParamAsFloat('UROG_OVZ');
       ds1.Fld('PR_OVOCHI').AsFloat := (ds1.Fld('POSEV_OV').AsFloat-ds1.Fld('POSEV_OVZ').AsFloat) * Globaltask.ParamAsFloat('UROG_OV')+
                                        ds1.Fld('PR_OVOCH_Z').AsFloat;
    end;
    if Globaltask.ParamAsFloat('UROG_KORN')>0 then  ds1.Fld('PR_KORNPL').AsFloat:= ds1.Fld('POSEV_KORM').AsFloat * Globaltask.ParamAsFloat('UROG_KORN');

//    if Globaltask.ParamAsFloat('KOEF_JAGOD')>0 then ds1.Fld('PR_JAGOD').AsFloat:= ds1.Fld('VSEGO').AsFloat * Globaltask.ParamAsFloat('KOEF_JAGOD');
    if Globaltask.ParamAsFloat('KOEF_PLOD')>0  then ds1.Fld('PR_PLOD').AsFloat:= ds1.Fld('VSEGO').AsFloat * Globaltask.ParamAsFloat('KOEF_PLOD');
  end;
end;

function Lich_AnyCorr(strFieldName : String) : Variant;
var
  lMoloko,lMeat : Boolean;
  n1,n2 : Extended;
begin
  if (strFieldName='TYPE_VOZV') or (strFieldName='GOD_VOZV') then begin
    if LicSchet.Fld('TYPE_VOZV').AsInteger>2 then begin
      LicSchet.Fld('GOD_VOZV').AsString:='';
    end;
    if (LicSchet.Fld('GOD_VOZV').AsInteger>3000) or (LicSchet.Fld('GOD_VOZV').AsInteger<1000) then begin
      LicSchet.Fld('GOD_VOZV').AsString:='';
    end;
  end;
  if IdProg()='SELSOVET' then begin
    if strFieldName='VSEGO' then begin
//      if LicSchet.Fld('VSEGO').AsFloat>10 then begin
//        PutError('Слишком большое значение.');
//      end;
      if (Globaltask.ParamAsString('VER_UCHET')='1') then
        if Globaltask.ParamAsFloat('KOEF_PLOD')>0  then LicSchet.Fld('PR_PLOD').AsFloat:= LicSchet.Fld('VSEGO').AsFloat * Globaltask.ParamAsFloat('KOEF_PLOD');
    end;
    if ParamAsBoolean('SUM_POSEV') then begin  // автосуммирование посевов
      if (Copy(strFieldName,1,5)='POSEV') and (strFieldName<>'POSEV') then begin
        LicSchet.Fld('POSEV').AsFloat := LicSchet.Fld('POSEV_ZERN').AsFloat+
          LicSchet.Fld('POSEV_KART').AsFloat+LicSchet.Fld('POSEV_OV').AsFloat+
          LicSchet.Fld('POSEV_KORM').AsFloat+LicSchet.Fld('POSEV_TRAV').AsFloat;
  //        +LicSchet.Fld('POSEV_JAG').AsFloat;
      end;
    end;
    if ParamAsBoolean('SUM_KOROV') then begin  // автосуммирование 
      if (strFieldName='KOROVA') or (strFieldName='TELKI1') then begin
        LicSchet.Fld('BIG_ENIMAL').AsInteger := LicSchet.Fld('KOROVA').AsInteger+LicSchet.Fld('TELKI1').AsInteger;
      end;
    end;
    if (strFieldName='BIG_ENIMAL') or (strFieldName='KOROVA') or (strFieldName='TELKI1') then begin
      if LicSchet.Fld('BIG_ENIMAL').AsInteger < LicSchet.Fld('KOROVA').AsInteger+LicSchet.Fld('TELKI1').AsInteger then begin
        PutError('(Крупный рогатый скот всего) не может быть меньше суммы (коровы+молодняк)');
        LicSchet.Fld('BIG_ENIMAL').AsInteger := LicSchet.Fld('KOROVA').AsInteger+LicSchet.Fld('TELKI1').AsInteger;
      end;
    end;
    {
    if ParamAsBoolean('CALC_UROG') then begin  // автоматический расчет производства 1
      if strFieldName='POSEV_KART' then begin
        if Globaltask.ParamAsFloat('UROG_KART')>0 then  LicSchet.Fld('PR_KART').AsFloat := LicSchet.Fld('POSEV_KART').AsFloat * Globaltask.ParamAsFloat('UROG_KART');
      end else if strFieldName='POSEV_ZERN' then begin
        if Globaltask.ParamAsFloat('UROG_ZERN')>0 then  LicSchet.Fld('PR_SERNO').AsFloat:= LicSchet.Fld('POSEV_ZERN').AsFloat * Globaltask.ParamAsFloat('UROG_ZERN');
      end else if strFieldName='POSEV_JAG' then begin
        if Globaltask.ParamAsFloat('UROG_JAGOD')>0 then  LicSchet.Fld('PR_JAGOD').AsFloat := LicSchet.Fld('POSEV_JAG').AsFloat * Globaltask.ParamAsFloat('UROG_JAGOD');
      end else if (strFieldName='POSEV_OV') or (strFieldName='POSEV_OVZ') then begin
        if (Globaltask.ParamAsFloat('UROG_OV')>0) and (Globaltask.ParamAsFloat('UROG_OVZ')>0) then begin
          LicSchet.Fld('PR_OVOCH_Z').AsFloat:= LicSchet.Fld('POSEV_OVZ').AsFloat * Globaltask.ParamAsFloat('UROG_OVZ');
          LicSchet.Fld('PR_OVOCHI').AsFloat := (LicSchet.Fld('POSEV_OV').AsFloat-LicSchet.Fld('POSEV_OVZ').AsFloat) * Globaltask.ParamAsFloat('UROG_OV')+
                                        LicSchet.Fld('PR_OVOCH_Z').AsFloat;
        end;
      end else if strFieldName='POSEV_KORM' then begin
        if Globaltask.ParamAsFloat('UROG_KORN')>0 then  LicSchet.Fld('PR_KORNPL').AsFloat:= LicSchet.Fld('POSEV_KORM').AsFloat * Globaltask.ParamAsFloat('UROG_KORN');
      end;
    end;
    }
    {
    if ParamAsBoolean('CALC_ZAGOT') then begin  // автоматический расчет производства 2
      lMeat := false;
      lMoloko := false;
      if (strFieldName='KOROVA') or (strFieldName='TELKI1') then begin
        if Globaltask.ParamAsFloat('UROG_KOROV')>0 then begin
          LicSchet.Fld('K_MEAT').AsFloat:= (LicSchet.Fld('KOROVA').AsInteger+LicSchet.Fld('TELKI1').AsInteger) * Globaltask.ParamAsFloat('UROG_KOROV');
          lMeat := true;
        end;
        if Globaltask.ParamAsFloat('UROG_M_KOR')>0 then begin 
          LicSchet.Fld('KOR_MOLOKO').AsFloat:= LicSchet.Fld('KOROVA').AsInteger * Globaltask.ParamAsFloat('UROG_M_KOR');
          lMoloko := true;
        end;
      end else if strFieldName='SVINI' then begin
        if Globaltask.ParamAsFloat('UROG_SV')>0 then begin 
          LicSchet.Fld('S_MEAT').AsFloat:= LicSchet.Fld('SVINI').AsInteger * Globaltask.ParamAsFloat('UROG_SV');
          lMeat := true;
        end;
      end else if strFieldName='KOZIMAT' then begin
        if Globaltask.ParamAsFloat('UROG_M_KOZ')>0 then begin
          LicSchet.Fld('KOZ_MOLOKO').AsFloat:= LicSchet.Fld('KOZIMAT').AsInteger * Globaltask.ParamAsFloat('UROG_M_KOZ');
          lMoloko:=true;
        end;
      end else if strFieldName='PTICA' then begin
        if Globaltask.ParamAsFloat('UROG_JAICA')>0 then LicSchet.Fld('JAICA').AsInteger:= LicSchet.Fld('PTICA').AsInteger * Globaltask.ParamAsInteger('UROG_JAICA');
      end else if strFieldName='PCHELI' then begin
        if Globaltask.ParamAsFloat('UROG_PCHELI')>0 then LicSchet.Fld('MED').AsFloat:= LicSchet.Fld('PCHELI').AsInteger * Globaltask.ParamAsFloat('UROG_PCHELI');
      end;
      if (strFieldName='PTICA') or (strFieldName='KROL') then begin
        if Globaltask.ParamAsFloat('UROG_PTICA')>0 then n1 := LicSchet.Fld('PTICA').AsInteger * Globaltask.ParamAsFloat('UROG_PTICA');
        if Globaltask.ParamAsFloat('UROG_KROL')>0 then n2 := LicSchet.Fld('KROL').AsInteger * Globaltask.ParamAsFloat('UROG_KROL');
        if (n1>0) or (n2>0) then begin
          LicSchet.Fld('P_MEAT').AsFloat := n1+n2;
          lMeat := true;
        end;
      end;
      if lMeat or (strFieldName='K_MEAT') or (strFieldName='S_MEAT')or (strFieldName='P_MEAT') then begin
        LicSchet.Fld('MEAT').AsFloat:=LicSchet.Fld('K_MEAT').AsFloat+LicSchet.Fld('S_MEAT').AsFloat+LicSchet.Fld('P_MEAT').AsFloat
      end;
      if lMoloko or (strFieldName='KOZ_MOLOKO') or (strFieldName='KOR_MOLOKO') then begin
        LicSchet.Fld('MOLOKO').AsFloat:=LicSchet.Fld('KOR_MOLOKO').AsFloat+LicSchet.Fld('KOZ_MOLOKO').AsFloat;
      end;
    end;
    }
  end;
end;


//-------------------------------------------------------
procedure ZAGS_IzvOtsut_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('POL').AsString := 'М';   
  end;
end;
function ZAGS_IzvOtsut_Report:String;
begin
  Result:='';
end;

//-------------------------------------------------------
procedure ZAGS_SprBrak_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
  end;
end;
//-------------------------------------------------------
procedure ZAGS_SprRast_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
  end;
end;
//-------------------------------------------------------
procedure ZAGS_SprChName_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('POL').AsString := 'М';   
  end;
end;
//-------------------------------------------------------
procedure ZAGS_SprRogd_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('SVED').AsString := '3';   
    ds.Fld('POL').AsString := 'М';   
//    ds.Fld('B_RESP').AsBoolean:=true;
    ds.Fld('GOSUD').AsInteger := ParamAsInteger('GOSUD');   
    ds.Fld('OBL').AsString := Parameters('OBL');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('B_GOROD').AsString := Parameters('TYPEPUNKT');   
  end;
end;
//-------------------------------------------------------
procedure ZAGS_SprSmert_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('POL').AsString := 'М';   
    ds.Fld('SM_GOSUD').AsInteger := ParamAsInteger('GOSUD');   
    ds.Fld('SM_OBL').AsString := Parameters('OBL');   
    ds.Fld('SM_RAION').AsString := Parameters('RAION');   
    ds.Fld('SM_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('SM_B_GOROD').AsString := Parameters('TYPEPUNKT');   
  end;
end;
//-------------------------------------------------------
procedure ZAGS_SprAkt_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('POL').AsString := 'М';   
  end;
end;
function ZAGS_SprAkt_Report:String;
begin
  Result:='';
end;
//-------------------------------------------------------
procedure ZAGS_DeclSvid_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('GT_GOSUD').AsInteger := ParamAsInteger('GOSUD');   
    ds.Fld('GT_B_OBL').AsBoolean:=true;   
    ds.Fld('GT_OBL').AsString := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
  end;
end;
function ZAGS_DeclSvid_Report:String;
begin
  AddReport('Заявление о выдаче повторного свидетельства','&Заявление о выдаче повторного свидетельства_форма.fr3');
  Result := '&LIST&';
end;

//-------------------------------------------------------
procedure ZAGS_SprOtsut_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('POL').AsString := 'М';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GRAG').AsInteger     := i;   
      ds.Fld('RG_GOSUD').AsInteger := i;   
      ds.Fld('GT_GOSUD').AsInteger := i;   
    end;
    ds.Fld('GT_OBL').AsString := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('RG_OBL').AsString := Parameters('OBL');   
    ds.Fld('RG_RAION').AsString := Parameters('RAION');   
    ds.Fld('RG_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('RG_B_GOROD').AsString := Parameters('TYPEPUNKT');   

    if IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
      ds.Fld('GT_RNGOROD').AsString := Parameters('RN_GOROD');   
      ds.Fld('GT_RAION').AsString   := '';   
    end;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('DOLG_RUKOV_B').AsString := Zags_Sprav_DolgEx(1);   
    ds.Fld('RUKOV_B').AsString      := Zags_Sprav_FIOEx(1);   
  end;
end;
function ZAGS_SprOtsut_Report:String;
begin
  Result:='';
end;

//-------------------------------------------------------
procedure ZAGS_ZaklChName_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('POL').AsString := 'М';   
    ds.Fld('IS_IZMEN').AsBoolean := true;   
    ds.Fld('TYPE_BRAK').AsString := '1';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('RG_GOSUD').AsInteger := i;   
      ds.Fld('GT_GOSUD').AsInteger := i;   
    end;
    ds.Fld('RG_B_OBL').AsBoolean :=true;   
    ds.Fld('GT_B_OBL').AsBoolean :=true;   
    ds.Fld('GT_OBL').AsString := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('RG_OBL').AsString := Parameters('OBL');   
    ds.Fld('RG_RAION').AsString := Parameters('RAION');   
    ds.Fld('RG_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('RG_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
  end;
end;
function ZAGS_ZaklChName_Report:String;
begin
  Result:='&Заключение о перемене ФИО.fr3';
end;
//-----------------------------------------------------------
procedure ZAGS_ZaklAddIN_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime  := Now;
    ds.Fld('DATEZV').AsDateTime := Now;
//    ds.Fld('POL').AsString := 'М';   
    ds.Fld('IS_MY').AsBoolean := true;   
    ds.Fld('IS_SKLON').AsBoolean := true;   
    ds.Fld('ZV').AsString := 'Ж';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GT_GOSUD').AsInteger := i;   
    end;
    ds.Fld('GT_B_OBL').AsBoolean :=true;   
    ds.Fld('GT_OBL').AsString := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
  end;
end;
function ZAGS_ZaklAddIN_Report:String;
begin
  AddReport('Заключение о дополнении ИН','&Заключение о внесении ИН.fr3');
  AddReport('Заключение о дополнении ИН в другой ЗАГС','&Заключение о внесении ИН2.fr3');
  AddReport('Заявление о внесении ИН','&Заявление о внесении ИН.fr3');
  Result := '&LIST&';
end;

//-------------------------------------------
procedure ZAGS_ZaklIzmAkt_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime:=Now;
    ds.Fld('IS_SKLONEN').AsBoolean:=true;   

    ds.Fld('IS_IZMEN').AsBoolean:=true;   
    ds.Fld('IS_DOPOLN').AsBoolean:=false;   
    ds.Fld('IS_ISPRAV').AsBoolean:=false;   
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
  end;
end;

//-------------------------------------------------------
function ZAGS_ZaklIzmAkt_Report:String;
begin
  AddReport('Заключение о внесении изменений в актовую запись (шрифт 12)','&Заключение о внесении изменений в актовую запись.fr3');
  AddReport('Заключение о внесении изменений в актовую запись (шрифт 14)','&Заключение о внесении изменений в актовую запись14.fr3');
  Result := '&LIST&';
end;

//-------------------------------------------------------
procedure DBrak_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
  d:TDateTime;
begin
//  ds := dbGetDataSet('fmZapisBrak.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    d:=GlobalTask.GetLastValueAsDate('LAST_DATEB_DBRAK');
    if d>0 then ds.Fld('DATEB').AsDateTime:=d;

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
    ds.Fld('ON_GOROD_B').AsString := Parameters('GOROD_B');   

//    ds.Fld('ONA_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('ONA_RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_GOROD_B').AsString := Parameters('GOROD_B');   

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
    ds.Fld('ON_SEM').AsString := '2';   
    ds.Fld('ONA_SEM').AsString := '2';   
    if ds.Fld('VOSSTAN').IsNull or not ds.Fld('VOSSTAN').AsBoolean then begin
      ds.Fld('ON_DOK_TYPE').AsString  := '1';   
      ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    end;
    ds.Fld('OSNOV').AsBoolean := true;   
    ds.Fld('BELORUS').AsBoolean := false;   
//    ds.Fld('VOENKOM').AsString := Parameters('ID_VOENKOM');   

    // должность и фио принимающего заявление
    ds.Fld('DOLG_RUKOV').AsString := Parameters('DOLG_SPEC')
    ds.Fld('RUKOV').AsString := Parameters('СПЕЦ_ЗАГС');   
  
    if ParamAsFloat('SUM_POSHLINA')>0  then ds.Fld('SUM_POSHLINA').AsFloat := ParamAsFloat('SUM_POSHLINA'); 
    ds.Fld('POSHLINA').AsString := Parameters('POSHLINA'); 

//    ds.Fld('OTMETKA').AsString := 'Свидетельство о рождении жениха'+Chr(13)+Chr(10)+
//                                  'Свидетельство о рождении невесты';   
  end;
end;
function DBrak_Report : String;     // !!!
begin
//  AddReport('Заявление о регистрации брака','&Заявление о регистрации брака.frf');
  AddReport('Заявление о регистрации брака','&Заявление о регистрации брака.fr3');
  Result := '&LIST&';
end;
//-------------------------------------------------------
function IsAktFR3:Boolean;
begin
  Result:=true;
end;
//-------------------------------------------------------
// дополнение к названию формы для актовых записей
function GetAddNameAkt(lCheckNew:Boolean;var sEXT:String) : String;
var
  sVer:String;
  l2013,lEnableOld:Boolean;
  s:String;
begin
//  if (DokZAGS.GetTypeDok='') or (CurDok=nil) then begin    {!!!}
//    sEXT:='fr3';
//    exit;
//  end; 
  lEnableOld:=GlobalTask.ParamAsBoolean('ENABLE_OLD_AKT');
  sVer:=Trim(GlobalTask.ParamAsString('AKT_VER'));
  if (sVer='0') or (sVer='1') then sVer:='';
  //--- проверка новых записей -----------------------------------------
  l2013:=true;
  if not DokZAGS.Fld('DATEZ').IsNull then begin
    if DokZAGS.Fld('DATEZ').AsDateTime<STOD('2013-07-26','')
      then l2013:=false;
  end;
  //--------------------------------------------------------------------
  if l2013 or not lEnableOld then begin // с 26.07.2013
    sExt:='fr3';
    if (CurDok.TypeObj=dmBase.TypeObj_ZSmert) or (CurDok.TypeObj=dmBase.TypeObj_ZBrak) then begin
      if DokZAGS.Fld('VOSSTAN').AsBoolean then begin 
        sVer:='';
        sExt:='frf';
        Result:='';
      end;
    end;
    if sExt='fr3'
      then Result:=sVer+'Н';
  end else begin
    Result:='2';
    if not lEnableOld then begin
      if GlobalTask.ParamAsBoolean('AKT_ALBOM') then Result:='';
    end else begin
      if StrToInt(FormatDateTime('YYYY',DokZAGS.Fld('DATEZ').AsDateTime))>2008 then begin
        if GlobalTask.ParamAsBoolean('AKT_ALBOM') then Result:=''
      end else begin   // используем старые актовые записи
        if (sVer='') then Result:='';
        Result:=Result+'_2008';
      end;
    end;
    if (sVer='5') and (CurDok.TypeObj=dmBase.TypeObj_ZSmert) then  begin
      if DokZAGS.Fld('VOSSTAN').AsBoolean then Result:='' else Result:='5';
    end;
    if GlobalTask.ParamAsBoolean('AKT_ALBOM') then 
      Result := 'АЛБ'+Result;
    sEXT:='frf';
    if (Result='2') then begin   //  новые актовые записи
      if lCheckNew and IsAktFR3 then begin
         sEXT:='fr3';
         Result:='';
      end else begin
         sEXT:='frf';
      end;
    end else if (Result='5') then begin
      sEXT:='fr3';
    end;
  end;
end;

//---------------------------------
function getAddNameSvid(ds:TDataSet):String;
begin
  if GlobalTask.ParamAsBoolean('SVID_LINE')
    then Result:='М'
    else Result:='';
end;
//---------------------------------
function ZBrak_Report : String;
var
  ds : TDataSet;
  s,ss,sEXT : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
//    if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := 'АЛБ'+s;
    if ds.Fld('VOSSTAN').IsNull or not ds.Fld('VOSSTAN').AsBoolean then begin
      s := GetAddNameAkt(true, sEXT);
      ss:=getAddNameSvid(ds);
      AddReport('Запись акта о браке','&Запись акта о браке'+s+'.'+sEXT);
//      {$IFDEF OLD_SVID}
//        AddReport('Свидетельство о браке','&Свидетельство о браке'+ss+'.frf');
//      {$ELSE}
        AddReport('Свидетельство о браке','&Свидетельство о браке'+ss+'.fr3');
//      {$ENDIF}
      if IdProg='ZAGS' then begin
        AddReport('Выписка о браке','&Выписка о браке.frf');
        if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
          AddReport('Архивная справка о браке','&Архивная справка о бракеBLK.fr3');
        end else begin
          AddReport('Архивная справка о браке','&Архивная справка о браке.frf');
        end;
        if GlobalTask.ParamAsBoolean('SPRAV_BEL') then begin 
          AddReport('Архивная справка о браке (бел.)','&Архивная справка о бракеBLK_BEL.fr3');
        end;
      end;
      {$IFDEF ADD_OLD_AKT}
//        if (s='') then AddReport('Запись акта о браке (до изменения)','&Запись акта о браке2.frf');
      {$ENDIF}
    end else begin
      s := GetAddNameAkt(false, sEXT);
      AddReport('Восстановленная запись акта о браке','&Восстановленная запись акта о браке'+s+'.frf');
      AddReport('Свидетельство о браке','&Свидетельство о браке(восстановленное).frf');
      AddReport('Свидетельство о браке (старого образца)','&Свидетельство о браке(ст восстан).frf');
      AddReport('Выписка о браке','&Выписка о браке в.frf');
    end;
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>Свидетельство о браке FR3','&Свидетельство о браке.fr3');
    AddReport('>Свидетельство о браке FR3 на линии','&Свидетельство о бракеМ.fr3');
    AddReport('>Запись акта о браке2','&Запись акта о браке2.frf');
    AddReport('>Запись акта о браке2_2008','&Запись акта о браке2_2008.frf');
    AddReport('>Запись акта о браке_2008','&Запись акта о браке_2008.frf');
    AddReport('>Запись акта о бракеАЛБ','&Запись акта о бракеАЛБ.frf');
    AddReport('>Запись акта о бракеАЛБ_2008','&Запись акта о бракеАЛБ_2008.frf');
    AddReport('>Запись акта о браке FR3','&Запись акта о браке.fr3');
    AddReport('>Запись акта о браке FR3 (26.07.2013)','&Запись акта о бракеН.fr3');
    AddReport('>Восстановленная запись акта о браке 3','&Восстановленная запись акта о браке.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('Архивная справка о браке','&Архивная справка о бракеBLK.fr3');
    AddReport('Архивная справка о браке (бел.)','&Архивная справка о бракеBLK_BEL.fr3');
  end;
  Result := '&LIST&';
end;

procedure ZBrak_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisBrak.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then begin
      ds.Fld('DATEZ').AsString:='';
    end else begin
      if (GlobalTask.GetLastValueAsString('LAST_DATEZ_ZBRAK')='')
        then ds.Fld('DATEZ').AsDateTime := Date
        else ds.Fld('DATEZ').AsDateTime := GlobalTask.GetLastValueAsDate('LAST_DATEZ_ZBRAK');
    end;
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
    ds.Fld('ON_GOROD_B').AsString := Parameters('GOROD_B');   

//    ds.Fld('ONA_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('ONA_RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_GOROD_B').AsString := Parameters('GOROD_B');   

    if not CurDok.OnlySvid then begin
      ds.Fld('ON_M_OBL').AsString := Parameters('OBL');   
      ds.Fld('ON_M_RAION').AsString := Parameters('RAION');   
      ds.Fld('ON_M_GOROD').AsString := Parameters('GOROD');   

      ds.Fld('ONA_M_OBL').AsString := Parameters('OBL');   
      ds.Fld('ONA_M_RAION').AsString := Parameters('RAION');   
      ds.Fld('ONA_M_GOROD').AsString := Parameters('GOROD');   
    end;
    if not ds.Fld('VOSSTAN').AsBoolean then begin
      if not CurDok.OnlySvid and IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
        ds.Fld('ON_M_RNGOROD').AsString  := Parameters('RN_GOROD');   
        ds.Fld('ONA_M_RNGOROD').AsString := Parameters('RN_GOROD');   
        ds.Fld('ON_M_RAION').AsString    := '';   
        ds.Fld('ONA_M_RAION').AsString   := '';   
      end;
//      ds.Fld('ON_VOENKOM').AsString := Parameters('ID_VOENKOM');   
//      ds.Fld('ONA_VOENKOM').AsString := '';   
    end;
    ds.Fld('OSNOV').AsBoolean := true;   
    ds.Fld('ON_SEM').AsString := '2';
    ds.Fld('ONA_SEM').AsString := '2';   
    if not IsSimpleVvod and not ds.Fld('VOSSTAN').AsBoolean then begin
      ds.Fld('ON_DOK_TYPE').AsString  := '1';   
      ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    end;
    ds.Fld('SPEC').AsString := Parameters('СПЕЦ_ЗАГС');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('РУК_ЗАГС');   
    ds.Fld('RUKOV_B').AsString := Parameters('РУК_ЗАГС_Б');   
//    ds.Fld('OTMETKA').AsString := 'Свидетельство о рождении жениха'+Chr(13)+Chr(10)+
//                                  'Свидетельство о рождении невесты';   
    if not ds.Fld('VOSSTAN').AsBoolean then begin
      if ParamAsFloat('SUM_POSHLINA')>0
        then ds.Fld('SUM_POSHLINA').AsFloat := ParamAsFloat('SUM_POSHLINA'); 
      ds.Fld('POSHLINA').AsString := Parameters('POSHLINA'); 
    end;
//    ds.Fld('MESTO').AsInteger := 0; 
  end;
end;

//---------------------------------
function ZRast_Report : String;
var
  ds : TDataSet;
  s,sEXT,ss : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    s := GetAddNameAkt(true,sEXT);
    ss:=getAddNameSvid(ds);
    AddReport('Запись акта о расторжении брака','&Запись акта о расторжении брака'+s+'.'+sEXT);
    AddReport('Свидетельство о расторжении брака','&Свидетельство о расторжении брака'+ss+'.fr3');
    if GlobalTask.ParamAsBoolean('OLD_SVID')
      then AddReport('Свидетельство о расторжении брака (старое)','&Свидетельство о расторжении брака(ст).frf');
    if Copy(GlobalTask.ParamAsString('KOD'),1,1)='2'
      then AddReport('Свидетельство о расторжении брака (Витебск)','&Свидетельство о расторжении брака Витебск.frf');

    if IdProg='ZAGS' then begin
      AddReport('Выписка о расторжении брака','&Выписка о расторжении брака.frf');
      if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
        AddReport('Архивная справка о расторжении брака','&Архивная справка о расторжении бракаBLK.fr3');
      end else begin
        AddReport('Архивная справка о расторжении брака','&Архивная справка о расторжении брака.frf');
      end;
      if GlobalTask.ParamAsBoolean('SPRAV_BEL') then begin 
        AddReport('-------------------------------','&Empty.frf');
        AddReport('Архивная справка о расторжении брака (бел.)','&Архивная справка о расторжении бракаBLK_BEL.fr3');
      end;
    end;

    {$IFDEF ADD_OLD_AKT}
//      if (s='') then AddReport('Запись акта о расторжении брака (до изменения)','&Запись акта о расторжении брака2.frf');
    {$ENDIF}
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>Свидетельство о расторжении брака FR3','&Свидетельство о расторжении брака.fr3');
    AddReport('>Свидетельство о расторжении брака FR3 на линии','&Свидетельство о расторжении бракаМ.fr3');
    AddReport('Свидетельство о расторжении брака (старое)','&Свидетельство о расторжении брака(ст).frf');
    AddReport('Свидетельство о расторжении брака (Витебск)','&Свидетельство о расторжении брака Витебск.frf');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>Запись акта о расторжении брака2','&Запись акта о расторжении брака2.frf');
    AddReport('>Запись акта о расторжении брака2_2008','&Запись акта о расторжении брака2_2008.frf');
    AddReport('>Запись акта о расторжении брака_2008','&Запись акта о расторжении брака_2008.frf');
    AddReport('>Запись акта о расторжении бракаАЛБ','Запись акта о расторжении бракаАЛБ.frf');
    AddReport('>Запись акта о расторжении бракаАЛБ_2008','&Запись акта о расторжении бракаАЛБ_2008.frf');
    AddReport('>Запись акта о разводе FR3','&Запись акта о расторжении брака.fr3');
    AddReport('>Запись акта о разводе FR3 (26.07.2013)','&Запись акта о расторжении бракаН.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>Архивная справка о расторжении брака','&Архивная справка о расторжении брака.frf');
    AddReport('>Архивная справка о расторжении брака бланк','&Архивная справка о расторжении бракаBLK.fr3');
    AddReport('>Архивная справка о расторжении брака (бел.)','&Архивная справка о расторжении бракаBLK_BEL.fr3');
  end;
  Result := '&LIST&';
end;

procedure ZRast_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then begin
      ds.Fld('DATEZ').AsString:='';
    end else begin
      ds.Fld('DATEZ').AsDateTime:=GlobalTask.GetLastValueAsDate('LAST_DATEZ_ZRAST');
    end;
    if not CurDok.OnlySvid then begin
      i := ParamAsInteger('GOSUD');
      if i>0 then begin
        ds.Fld('ON_GRAG').AsInteger     := i;   
        ds.Fld('ONA_GRAG').AsInteger    := i;  
        ds.Fld('ON_GOSUD').AsInteger    := i;   
        ds.Fld('ONA_GOSUD').AsInteger   := i;   
        ds.Fld('ON_M_GOSUD').AsInteger  := i;   
        ds.Fld('ONA_M_GOSUD').AsInteger := i;   
      end;
      ds.Fld('ON_OBL').AsString := Parameters('OBL');   
      ds.Fld('ON_RAION').AsString := Parameters('RAION');   
      ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   

      ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
      ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
      ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   

      ds.Fld('ON_M_OBL').AsString := Parameters('OBL');   
      ds.Fld('ON_M_RAION').AsString := Parameters('RAION');   
      ds.Fld('ON_M_GOROD').AsString := Parameters('GOROD');   
      ds.Fld('ONA_M_OBL').AsString := Parameters('OBL');   
      ds.Fld('ONA_M_RAION').AsString := Parameters('RAION');   
      ds.Fld('ONA_M_GOROD').AsString := Parameters('GOROD');   
    end;
    ds.Fld('SPEC').AsString := Parameters('СПЕЦ_ЗАГС');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('РУК_ЗАГС');   
    ds.Fld('RUKOV_B').AsString := Parameters('РУК_ЗАГС_Б');   
    if not IsSimpleVvod then begin
      ds.Fld('ON_SEM').AsString := '1';   
      ds.Fld('ONA_SEM').AsString := '1';   
      if ParamAsFloat('SUMR_POSHLINA')>0
        then ds.Fld('ON_SUM_POSHLINA').AsFloat := ParamAsFloat('SUMR_POSHLINA'); 
      ds.Fld('ON_POSHLINA').AsString  := Parameters('POSHLINA'); 
      if ParamAsFloat('SUMR_POSHLINA')>0
        then ds.Fld('ONA_SUM_POSHLINA').AsFloat := ParamAsFloat('SUMR_POSHLINA'); 
      ds.Fld('ONA_POSHLINA').AsString := Parameters('POSHLINA'); 
      ds.Fld('ON_DOK_TYPE').AsString  := '1';   
      ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    end;
  end;
end;

function CheckSvidZAGS_R : String;
var
  lOk : Boolean;
begin
  result:='';
  lOk := DokZAGS.CheckSvid;
  if not lOk then result:=DokZAGS.GetLastError;
end;

function SvidAdopt_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidRast_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidUstOtc_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidChName_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidSmert_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidRogd_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidBrak_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;

function CheckSvidZAGS : Boolean;
begin
  result := DokZAGS.CheckSvid;
  if not result then PutError(DokZAGS.GetLastError);
end;

function CheckIzrasSvidZAGS : Boolean;
begin
  result := true;
end;

//---------------------------------
function ZRogd_Report : String;
var
  ds : TDataSet;
  s,ss,sm,sEXT,sv : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    s := GetAddNameAkt(true,sEXT);
    sv:=getAddNameSvid(ds);
    if CurDok.OnlySvid then begin
      if CurDok.Fld('SVIDNOT').AsBoolean then begin
        PutError('Свидетельство не выдавать!');
//        AddReport('---','&Empty.fr3');
        Result := '';
      end else begin
        AddReport('Свидетельство о рождении (с ИН)','&Свидетельство о рождении'+sv+'ИН.fr3');
        {$IFDEF ADD_NOT_IN}
          AddReport('Свидетельство о рождении','&Свидетельство о рождении'+sv+'.frf');
        {$ENDIF}
        Result := '&LIST&';
      end;
      exit;
    end;
    sm:='*';
    if ds.Fld('VOSSTAN').IsNull or not ds.Fld('VOSSTAN').AsBoolean then begin
      if not ds.Fld('GIVOROGD').AsBoolean or ds.Fld('FIRSTWEEK').AsBoolean then begin
        if ds.Fld('FIRSTWEEK').AsBoolean 
          then sm:='Справка о рождении ребенка умершего в течение первых 6 дней жизни'
          else sm:='Справка о рождении мертворожденного ребенка';
      end;
      AddReport('Запись акта о рождении','&Запись акта о рождении'+s+'.'+sEXT);
      if not ds.Fld('SVIDNOT').AsBoolean then begin 
        AddReport('Свидетельство о рождении (с ИН)','&Свидетельство о рождении'+sv+'ИН.fr3');
        {$IFDEF ADD_NOT_IN}
          AddReport('Свидетельство о рождении','&Свидетельство о рождении'+sv+'.frf');
        {$ENDIF}
      end;
      if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
        AddReport('Справка о рождении (форма №1)|1','&Справка о регистрации рожденияBLK.fr3');
//        if ds.Fld('SVED').AsString='3' then begin // заявление матери
        if IsZvMat(ds) then begin // заявление матери и не введен отец
          AddReport('Справка о рождении (форма №2)|2','&Справка о регистрации рожденияBLK.fr3');
          AddReport('Справка о постановке на учет для улучшения жилищных условий|3','&Справка о регистрации рожденияBLK.fr3');
        end;
        if sm<>'*' then AddReport(sm,'&Справка о рождении умершего ребенкаBLK.fr3');
      end else begin
        AddReport('Справка о рождении (форма №1)|1','&Справка о регистрации рождения.frf');
//        if ds.Fld('SVED').AsString='3' then begin // заявление матери
        if IsZvMat(ds) then begin // заявление матери и не введен отец
           AddReport('Справка о рождении (форма №2)|2','&Справка о регистрации рождения.frf');
           AddReport('Справка о постановке на учет для улучшения жилищных условий|3','&Справка о регистрации рождения.frf');
        end;
        if sm<>'*' then AddReport(sm,'&Справка о рождении умершего ребенка.frf');
      end;
//      if ds.Fld('SVED').AsString='3' then begin // заявление матери
      if IsZvMat(ds) then begin // заявление матери  и не введен отец
        AddReport('Заявление о регистрации рождения','Заявление о рождении55.fr3');
      end else begin
        AddReport('Заявление о регистрации рождения','Заявление о рождении.fr3');
      end;
      if IdProg='ZAGS' then begin
        AddReport('Выписка о рождении','&Выписка о рождении.frf');
        if GlobalTask.ParamAsBoolean('SPRAV_BLANK') 
          then AddReport('Архивная справка о рождении','&Архивная справка о рожденииBLK.fr3')
          else AddReport('Архивная справка о рождении','&Архивная справка о рождении.frf');
      end;
      if GlobalTask.ParamAsBoolean('SPRAV_BEL') then begin 
        AddReport('---------------------------------------------','&Empty.frf');
        AddReport('Справка о рождении (форма №1) бел.|1','&Справка о регистрации рожденияBLK_BEL.fr3');
        if IsZvMat(ds) then begin // заявление матери и не введен отец
          AddReport('Справка о рождении (форма №2) бел.|2','&Справка о регистрации рожденияBLK_BEL.fr3');
          AddReport('Справка о постановке на учет для улучшения жилищных условий бел.|3','&Справка о регистрации рожденияBLK_BEL.fr3');
        end;
        if sm<>'*' then AddReport(sm+' бел.','&Справка о рождении умершего ребенкаBLK_BEL.fr3');
        if IdProg='ZAGS' then begin
          AddReport('Архивная справка о рождении бел.','&Архивная справка о рожденииBLK_BEL.fr3');
        end;
      end;

      {$IFDEF ADD_OLD_AKT}
  //      if (s='') then AddReport('Запись акта о рождении (до изменения)','&Запись акта о рождении2.frf');
      {$ENDIF}
    end else begin
//      if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := 'АЛБ'+s;
      s := GetAddNameAkt(false,sEXT);
      AddReport('Восстановленная запись акта о рождении','&Восстановленная запись акта о рождении'+s+'.'+sExt);
      AddReport('Свидетельство о рождении','&Свидетельство о рождении(восстановленное).frf');
      AddReport('Свидетельство о рождении (c ИН)','&Свидетельство о рождении(восстановленное)ИН.frf');
//      AddReport('Восстановленная запись акта о рождении (c 26.07.2013)','&Восстановленная запись акта о рожденииН.fr3');
      AddReport('Выписка о рождении','&Выписка о рождении в.frf');
    end;
//Справка о рождении умершего ребенка
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>Свидетельство о рождении FR3','&Свидетельство о рожденииИН.fr3');
    AddReport('>Свидетельство о рождении FR3 на линии','&Свидетельство о рожденииМИН.fr3');
    AddReport('>Запись акта о рождении2','&Запись акта о рождении2.frf');
    AddReport('>Запись акта о рождении2_2008','&Запись акта о рождении2_2008.frf');
    AddReport('>Запись акта о рождении_2008','&Запись акта о рождении_2008.frf');
    AddReport('>Запись акта о рожденииАЛБ','&Запись акта о рожденииАЛБ.frf');
    AddReport('>Запись акта о рожденииАЛБ_2008','&Запись акта о рожденииАЛБ_2008.frf');
    AddReport('>Запись акта о рождении FR3','&Запись акта о рождении.fr3');
    AddReport('>Запись акта о рождении FR3 (c 26.07.2013)','&Запись акта о рожденииН.fr3');
    AddReport('>Восстановленная запись акта о рождении 3 ','&Восстановленная запись акта о рождении.fr3');
    AddReport('>Восстановленная запись акта о рождении (c 26.07.2013)','&Восстановленная запись акта о рожденииН.fr3');
    AddReport('>Заявление о регистрации рождения (ст.55)','Заявление о рождении55.fr3');
    AddReport('>Заявление о регистрации рождения','Заявление о рождении.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('Справка о рождении (форма №1)|1','&Справка о регистрации рожденияBLK.fr3');
    AddReport('Справка о рождении (форма №2)|2','&Справка о регистрации рожденияBLK.fr3');
    AddReport('Справка о постановке на учет для улучшения жилищных условий|3','&Справка о регистрации рожденияBLK.fr3');
    AddReport('>Справка о рождении умершего ребенка бланк','&Справка о рождении умершего ребенкаBLK.fr3');
    AddReport('Справка о рождении (форма №1) бел.|1','&Справка о регистрации рожденияBLK_BEL.fr3');
    AddReport('Справка о рождении (форма №2) бел.|2','&Справка о регистрации рожденияBLK_BEL.fr3');
    AddReport('Справка о постановке на учет для улучшения жилищных условий бел.|3','&Справка о регистрации рожденияBLK_BEL.fr3');
    AddReport('>Справка о рождении умершего ребенка бел.','&Справка о рождении умершего ребенкаBLK_BEL.fr3');
    AddReport('>Архивная справка о рождении бланк','&Архивная справка о рожденииBLK.fr3');
    AddReport('>Архивная справка о рождении бел.','&Архивная справка о рожденииBLK_BEL.fr3');
  end;
  Result := '&LIST&';
end;
//---------------------------------
procedure DeclRegRogd_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisRogd.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
  end;
end;

//---------------------------------
procedure ZRogd_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisRogd.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then begin
      ds.Fld('DATEZ').AsString:='';
    end else begin
      ds.Fld('DATEZ').AsDateTime := Now;
    end;
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('ON_GRAG').AsInteger     := i;   
      ds.Fld('ONA_GRAG').AsInteger    := i;  
      ds.Fld('ON_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_GOSUD').AsInteger   := i;   
      ds.Fld('ON_M_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_M_GOSUD').AsInteger   := i;   
      ds.Fld('GOSUD').AsInteger  := i;   
    end;
    ds.Fld('OBL').AsString := Parameters('OBL');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GOROD_B').AsString := Parameters('GOROD_B');   
//    ds.Fld('OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('RAION_B').AsString := Parameters('RAION_B');   

    if not ds.Fld('VOSSTAN').AsBoolean then begin
      ds.Fld('ON_OBL').AsString := Parameters('OBL');   
      ds.Fld('ON_RAION').AsString := Parameters('RAION');   
      ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   
      ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
      ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
      ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   

      ds.Fld('ON_M_GOROD').AsString := Parameters('GOROD');   
      ds.Fld('ONA_M_GOROD').AsString := Parameters('GOROD');   
    end;
    if not ds.Fld('VOSSTAN').AsBoolean then begin
      if IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
        ds.Fld('ON_RNGOROD').AsString  := Parameters('RN_GOROD');   
        ds.Fld('ONA_RNGOROD').AsString := Parameters('RN_GOROD');   
        ds.Fld('ON_RAION').AsString    := '';   
        ds.Fld('ONA_RAION').AsString   := '';   
      end;
    end;
    ds.Fld('SPEC').AsString := Parameters('СПЕЦ_ЗАГС');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('РУК_ЗАГС');   
    ds.Fld('RUKOV_B').AsString := Parameters('РУК_ЗАГС_Б');   
//    ds.Fld('VOENKOM').AsString := Parameters('ID_VOENKOM');   

    ds.Fld('TYPEROD').AsString := '1';
    ds.Fld('SVED').AsString := '1';
    ds.Fld('TYPEREG').AsString := '1';
    if not IsSimpleVvod  then begin
      ds.Fld('SCHET').AsString := '1';
      ds.Fld('OSTAT').AsString := '1';
      ds.Fld('DOKUMENT').AsString := Parameters('DOK_ROGD');
    end;
    if not IsSimpleVvod and not ds.Fld('VOSSTAN').AsBoolean then begin
      ds.Fld('ON_DOK_TYPE').AsString  := '1';   
      ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    end;

    if ds.Fld('VOSSTAN').AsBoolean then ds.Fld('SUD_NAME').AsString := 'решение суда';
  end;
end;

procedure ZUstOtc_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisUstOtc.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid 
       then  ds.Fld('DATEZ').AsString:='' 
       else  ds.Fld('DATEZ').AsDateTime:=Now;
    ds.Fld('DateDecl').AsDateTime := Now;
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('ON_GRAG').AsInteger     := i;   
      ds.Fld('ONA_GRAG').AsInteger    := i;  
      ds.Fld('ON_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_GOSUD').AsInteger   := i;   
      ds.Fld('GOSUD').AsInteger   := i;   
    end;
    ds.Fld('OBL').AsString := Parameters('OBL');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   

    if IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
      ds.Fld('ON_RNGOROD').AsString  := Parameters('RN_GOROD');   
      ds.Fld('ONA_RNGOROD').AsString := Parameters('RN_GOROD');   
      ds.Fld('ON_RAION').AsString    := '';   
      ds.Fld('ONA_RAION').AsString   := '';   
    end;

    ds.Fld('ON_DOK_TYPE').AsString  := '1';   
    ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    ds.Fld('RUKOV').AsString := Parameters('РУК_ЗАГС');   
    ds.Fld('RUKOV_B').AsString := Parameters('РУК_ЗАГС_Б');   
    ds.Fld('SPEC').AsString := Parameters('СПЕЦ_ЗАГС');   
    WriteSpecBel('',ds);
  end;
end;

function ZUstOtc_Report : String;
var
  ds:TDataSet;
  s,ss,sEXT : String;
begin
  ds := fmMain.GetCurrentDokument;
  s:=GetAddNameAkt(true,sEXT);
  ss:=getAddNameSvid(ds);
  if CurDok.OnlySvid then begin
    AddReport('Свидетельство об установлении отцовства','&Свидетельство об установлении отцовства'+ss+'.fr3');
    Result := '&LIST&';
    exit;
  end;
//  if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := 'АЛБ'+s;
  AddReport('Запись акта об отцовстве','&Запись акта об отцовстве'+s+'.'+sEXT);
  AddReport('Свидетельство об установлении отцовства','&Свидетельство об установлении отцовства'+ss+'.fr3');
//  AddReport('Свидетельство об установлении отцовства (старое)','&Свидетельство об установлении отцовства'+ss+'.frf');
  if IdProg='ZAGS' then begin
    AddReport('Извещение об установлении отцовства','&Извещение об установлении отцовства.frf'); 
  end;
  {$IFDEF ADD_OLD_AKT}
    if (s='') then AddReport('Запись акта об отцовстве (до изменения)','&Запись акта об отцовстве2.frf');
  {$ENDIF}
  if DokZAGS.Fld('OSNOV').AsInteger=2 then s:='(суд)' else s:='';
  AddReport('Заявление о регистрации установления отцовства','&Заявление об установлении отцовства'+s+'.fr3'); 

  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>Свидетельство об установлении отцовства ( новое ) FR3','&Свидетельство об установлении отцовства.fr3');
    AddReport('>Свидетельство об установлении отцовства ( новое ) FR3 на линии','&Свидетельство об установлении отцовстваМ.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>Запись акта об отцовстве2','&Запись акта об отцовстве2.frf');
    AddReport('>Запись акта об отцовстве2_2008','&Запись акта об отцовстве2_2008.frf');
    AddReport('>Запись акта об отцовстве_2008','&Запись акта об отцовстве_2008.frf');
    AddReport('>Запись акта об отцовствеАЛБ','&Запись акта об отцовствеАЛБ.frf');
    AddReport('>Запись акта об отцовствеАЛБ_2008','&Запись акта об отцовствеАЛБ_2008.frf');
    AddReport('>Запись акта об отцовстве FR3','&Запись акта об отцовстве.fr3');
    AddReport('>Запись акта об отцовстве FR3 (26.07.2013)','&Запись акта об отцовствеН.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('Свидетельство об установлении отцовства ','&Свидетельство об установлении отцовства.frf');
    AddReport('Свидетельство об установлении отцовства ( новое )','&Свидетельство об установлении отцовства(новое).frf');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('Свидетельство об установлении отцовства (М) подпись на линии','&Свидетельство об установлении отцовстваМ.frf');
    AddReport('Свидетельство об установлении отцовства (новое) (М) подпись на линии','&Свидетельство об установлении отцовства(новое)М.frf');
    AddReport('Заявление об установлении отцовства','Заявление об установлении отцовства.fr3'); 
    AddReport('Заявление об установлении отцовства (суд)','Заявление об установлении отцовства(суд).fr3'); 
  end;
  Result := '&LIST&';
end;


procedure ZUstMat_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisUstOtc.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('ON_GRAG').AsInteger     := i;   
      ds.Fld('ONA_GRAG').AsInteger    := i;  
      ds.Fld('ON_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_GOSUD').AsInteger   := i;   
      ds.Fld('GOSUD').AsInteger   := i;   
    end;
    ds.Fld('OBL').AsString := Parameters('OBL');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ON_OBL').AsString := Parameters('OBL');   
    ds.Fld('ON_RAION').AsString := Parameters('RAION');   
    ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ON_DOK_TYPE').AsString  := '1';   
    ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    ds.Fld('RUKOV').AsString := Parameters('РУК_ЗАГС');   
    ds.Fld('RUKOV_B').AsString := Parameters('РУК_ЗАГС_Б');   
    ds.Fld('SPEC').AsString := Parameters('СПЕЦ_ЗАГС');   
    WriteSpecBel('',ds);
  end;
end;

function ZUstMat_Report : String;
var
  s,sEXT : String;
begin
  s := GetAddNameAkt(true,sEXT);

  AddReport('Запись акта о материнстве','&Запись акта о материнстве'+s+'.'+sEXT);
  AddReport('Свидетельство об установлении материнства','&Свидетельство об установлении материнства.frf');
//  AddReport('Запись акта об установлении материнства (c 26.07.2013)','&Запись акта о материнствеН.fr3');
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>Запись акта о материнстве2','&Запись акта о материнстве2.frf');
    AddReport('>Запись акта о материнствеАЛБ','&Запись акта о материнствеАЛБ.frf');
    AddReport('>Запись акта о материнстве FR3','&Запись акта о материнствеН.fr3');
  end;
  Result := '&LIST&';
end;


//---------------------------------
function AktZAH_Report : String;
var
  ds : TDataSet;
  s,ss,sEXT : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    AddReport('Заявление о земельном участке','&Захоронение_заявление.fr3');
    AddReport('Заявление о выдаче справки','&Захоронение_заявление2.fr3');
    AddReport('Справка (A5)','&Захоронение_справка.fr3');
    AddReport('Справка (A4)','&Захоронение_справкаА4.fr3');
//    AddReport('Акт о захоронении','&Захоронение_акт2.fr3');
    AddReport('Удостоверение','&Захоронение_удостоверение.fr3');
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('Справка (A5)','&Захоронение_справка.fr3');
    AddReport('Справка (A4)','&Захоронение_справкаА4.fr3');
    AddReport('Заявление','&Захоронение_заявление.fr3');
    AddReport('Заявление 2','&Захоронение_заявление2.fr3');
    AddReport('Удостоверение','&Захоронение_удостоверение.fr3');
    AddReport('Акт о захоронении','&Захоронение_акт.fr3');
  end;
  Result := '&LIST&';
end;

//---------------------------------------------------
procedure AktZAH_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
  fld:TField;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('POL').AsString := 'М';   
    fld := ds.FindField('DOK_KOD');
    if fld<>nil then ds.Fld('DOK_KOD').AsString:='1';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GRAG').AsInteger  := i;   
//      ds.Fld('SM_GOSUD').AsInteger := i;   
//      ds.Fld('RG_GOSUD').AsInteger := i;   
      ds.Fld('GT_GOSUD').AsInteger := i;   
    end;
    ds.Fld('GT_B_OBL').AsBoolean := true;   
    ds.Fld('GT_OBL').AsString   := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   
//    ds.Fld('SM_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('SM_RAION_B').AsString := Parameters('RAION_B');   
//    ds.Fld('DOLG_RUKOV').AsString := Parameters('DOLG_RUK_ZAGS');   
//    ds.Fld('RUKOV').AsString := Parameters('РУК_ЗАГС');   
    ds.Fld('SVID_ZAGS').AsString := '';
    ds.Fld('DOKUMENT').AsString := '';
    ds.Fld('MOG_TYPE').AsString := '1';
    ds.Fld('MOG_L').AsFloat := 2.3;
    ds.Fld('MOG_W').AsFloat := 1.4;
    ds.Fld('ZH_MOG').AsString := '1';
  end;
end;

//---------------------------------
function ZSmert_Report : String;
var
  ds : TDataSet;
  s,ssIN,ss,sEXT : String;
  l,lIN:Boolean;
  n:Integer;
begin
  Result := '&LIST&';
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    s := GetAddNameAkt(true,sEXT);
//    ss:=getAddNameSvid(ds);   смещение делается в отчете
    lIN:=false;
    l:=false;
    if IdProg='ZAGS' then begin
      n:=GlobalTask.ParamAsInteger('PRINT_SM_IN');
      if (n=1) or (n=2) then lIN:=true;
      if (n=0) or (n=2) then l:=true;
      if CurDok.OnlySvid then begin
        if lIN then AddReport('Свидетельство о смерти с ИН','&Свидетельство о смертиИН.fr3');
        if l   then AddReport('Свидетельство о смерти','&Свидетельство о смерти.fr3');
        exit;
      end;
    end else begin
      if GlobalTask.ParamAsBoolean('PRINT_SM_IN') 
        then lIN:=true
        else l:=true;
    end;
    if ds.Fld('VOSSTAN').IsNull or not ds.Fld('VOSSTAN').AsBoolean then begin
      AddReport('Запись акта о смерти','&Запись акта о смерти'+s+'.'+sEXT);

      if lIN then AddReport('Свидетельство о смерти с ИН','&Свидетельство о смертиИН.fr3');

      if IdProg='ZAGS' then begin
        AddReport(StringOfChar('-',100),'empty');
      end;
      if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
        AddReport('Справка о смерти','&Справка о смертиBLK.fr3');
      end else begin
        AddReport('Справка о смерти','&Справка о смерти.fr3');
      end;
      AddReport('Заявление о регистрации смерти','&Заявление о смерти.fr3');
      if IdProg='ZAGS' then begin
        AddReport('Выписка о смерти','&Выписка о смерти.frf');
        if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
          AddReport('Архивная справка о смерти','&Архивная справка о смертиBLK.fr3');
        end else begin
          AddReport('Архивная справка о смерти','&Архивная справка о смерти.fr3');
        end;
      end;
     {$IFDEF ADD_OLD_AKT}
//        if (s='') then AddReport('Запись акта о смерти (до изменения)','&Запись акта о смерти2.frf');
     {$ENDIF}
      if GlobalTask.ParamAsBoolean('SPRAV_BEL') then begin 
        AddReport(StringOfChar('-',100),'empty');
        AddReport('Справка о смерти (бел.)','&Справка о смертиBLK_BEL.fr3');
        AddReport('Архивная справка о смерти (бел.)','&Архивная справка о смертиBLK_BEL.fr3');
      end;
      if l then begin
        AddReport(StringOfChar('-',100),'empty');
        AddReport('Свидетельство о смерти','&Свидетельство о смерти.fr3');
      end;
    end else begin
//      if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := 'АЛБ'+s;
      s := GetAddNameAkt(false,sEXT);
      AddReport('Восстановленная запись акта о смерти','&Восстановленная запись акта о смерти'+s+'.frf');
      AddReport('Свидетельство о смерти','&Свидетельство о смерти(восстановленное).frf');
      AddReport('Выписка о смерти','&Выписка о смерти в.frf');
    end;
    if (ds.Fld('LICH_NOMER').AsString=ds.Fld('REQUEST_IN').AsString) and (ds.Fld('COVER_MESSAGE_ID').AsString<>'')
      then AddReport('Запрос идентификационного номера','&Запрос ИН.fr3');
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>Запрос идентификационного номера','&Запрос ИН.fr3');
    AddReport('>Свидетельство о смерти FR3','&Свидетельство о смерти.fr3');
    AddReport('>Свидетельство о смерти (ИН) FR3','&Свидетельство о смертиИН.fr3');
    AddReport('>Свидетельство о смерти FR3 на линии','&Свидетельство о смертиМ.fr3');
    AddReport('>Запись акта о смерти2','&Запись акта о смерти2.frf');
    AddReport('>Запись акта о смерти2_2008','&Запись акта о смерти2_2008.frf');
    AddReport('>Запись акта о смерти_2008','&Запись акта о смерти_2008.frf');
    AddReport('>Запись акта о смертиАЛБ','&Запись акта о смертиАЛБ.frf');
    AddReport('>Запись акта о смертиАЛБ_2008','&Запись акта о смертиАЛБ_2008.frf');
    AddReport('>Запись акта о смерти FR3','&Запись акта о смерти.fr3');
    AddReport('>Запись акта о смерти FR3 Минск','&Запись акта о смерти5.fr3');
    AddReport('>Восстановленная запись акта о смерти 3 ','&Восстановленная запись акта о смерти.fr3');
    AddReport('>Запись акта о смерти (c 26.07.2013) Минск','&Запись акта о смерти5Н.fr3');
    AddReport('>Запись акта о смерти (c 26.07.2013)','&Запись акта о смертиН.fr3');
    AddReport('>Справка о смерти FR3','&Справка о смерти.fr3');
    AddReport('>Архивная справка о смерти','&Архивная справка о смерти.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>Справка о смерти бланк','&Справка о смертиBLK.fr3');
    AddReport('>Справка о смерти (бел.)','&Справка о смертиBLK_BEL.fr3');
    AddReport('>Архивная справка о смерти бланк','&Архивная справка о смертиBLK.fr3');
    AddReport('>Архивная справка о смерти (бел.)','&Архивная справка о смертиBLK_BEL.fr3');
  end;
end;

//---------------------------------------------------
procedure ZSmert_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
  fld:TField;
begin
//  ds := dbGetDataSet('fmZapisSmert.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then begin
      ds.Fld('DATEZ').AsString:='';
    end else begin
      ds.Fld('DATEZ').AsDateTime := Now;
    end;
    ds.Fld('POL').AsString := 'М';   
    fld := ds.FindField('DOK_KOD');
    if fld<>nil then ds.Fld('DOK_KOD').AsString:='1';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GRAG').AsInteger  := i;   
      ds.Fld('SM_GOSUD').AsInteger := i;   
      ds.Fld('RG_GOSUD').AsInteger := i;   
      ds.Fld('GT_GOSUD').AsInteger := i;   
    end;
//    ds.Fld('SM_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('SM_RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('SM_OBL').AsString   := Parameters('OBL');   
    ds.Fld('SM_RAION').AsString := Parameters('RAION');   
    ds.Fld('SM_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('SM_GOROD_B').AsString := Parameters('GOROD_B');   

    ds.Fld('RG_OBL').AsString   := Parameters('OBL');   
    ds.Fld('RG_RAION').AsString := Parameters('RAION');   
    ds.Fld('RG_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GT_OBL').AsString   := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   

    // сведения не представлены
    ds.Fld('SEM').AsInteger:=9;   
    ds.Fld('NATION').AsInteger:=190;    
    ds.Fld('OBRAZ').AsInteger:=98;    
          
    if not ds.Fld('VOSSTAN').AsBoolean then begin
      ds.Fld('VUS').AsBoolean := false;   
      ds.Fld('SDAN_VB').AsString := 'НЕ ПРЕДСТАВЛЕН';   
      ds.Fld('SDAN_DOK').AsString := '';   
      ds.Fld('IS_SDAN_DOK').AsBoolean := true;   
      if IdProg='ZAGS' then begin
        if IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
          ds.Fld('GT_RNGOROD').AsString  := Parameters('RN_GOROD');   
          ds.Fld('GT_RAION').AsString   := '';   
        end;
      end;
//      ds.Fld('VOENKOM').AsString := Parameters('ID_VOENKOM');   
    end;

    ds.Fld('CHERN').AsString := '9';   
    ds.Fld('SPEC').AsString := Parameters('СПЕЦ_ЗАГС');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('РУК_ЗАГС');   
    ds.Fld('RUKOV_B').AsString := Parameters('РУК_ЗАГС_Б');   
    ds.Fld('DOKUMENT').AsString := 'Врачебное свидетельство о смерти (мертворождении) № ';
    if ds.Fld('VOSSTAN').AsBoolean then ds.Fld('SUD_NAME').AsString := 'решение суда';
  end;
end;


//-------- акты усыновления ---------------------------------
function ZAdopt_Report : String;
var
  ds : TDataSet;
  s,sEXT,ss : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    s := GetAddNameAkt(true,sEXT);
    ss:=getAddNameSvid(ds);
//    if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := 'АЛБ'+s;
    if CurDok.OnlySvid then begin
      AddReport('Свидетельство об усыновлении(место рожд. 4 строки)','&Свидетельство об усыновлении2'+ss+'.frf');
      Result := '&LIST&';
      exit;
    end;
    AddReport('Запись акта об усыновлении','&Запись акта об усыновлении'+s+'.'+sEXT);
    AddReport('Свидетельство об усыновлении(место рожд. 4 строки)','&Свидетельство об усыновлении2'+ss+'.frf');
    if GlobalTask.ParamAsBoolean('OLD_SVID') then begin
      AddReport('Свидетельство об усыновлении','&Свидетельство об усыновлении.frf');
      AddReport('Свидетельство об усыновлении (старое)','&Свидетельство об усыновлении(старое).frf');
    end;
    AddReport('Заявление об усыновлении','&Заявление об усыновлении.fr3');
//    AddReport('Запись акта об усыновлении (c 26.07.2013)','&Запись акта об усыновленииН.fr3');
    AddReport('Извещение об изменении акта о рождении усыновленного','Извещение об изменении акта усыновленного.frf'); 
    {$IFDEF ADD_OLD_AKT}
//      if (s='') then AddReport('Запись акта об усыновлении (до изменения)','&Запись акта об усыновлении2.frf');
    {$ENDIF}

    if IsSystemAdmin then begin
      AddReport('-------------------------------','&Empty.frf');
      AddReport('Свидетельство об усыновлении(место рожд. 4 строки)','&Свидетельство об усыновлении2.frf');
      AddReport('Свидетельство об усыновлении(место рожд. 4 строки) Минск','&Свидетельство об усыновлении2М.frf');

      AddReport('Свидетельство об усыновлении FR3','&Свидетельство об усыновлении.fr3');
      AddReport('>Запись акта об усыновлении2','&Запись акта об усыновлении2.frf');
      AddReport('>Запись акта об усыновлении2_2008','&Запись акта об усыновлении2_2008.frf');
      AddReport('>Запись акта об усыновлении_2008','&Запись акта об усыновлении_2008.frf');
      AddReport('>Запись акта об усыновленииАЛБ','&Запись акта об усыновленииАЛБ.frf');
      AddReport('>Запись акта об усыновленииАЛБ_2008','&Запись акта об усыновленииАЛБ_2008.frf');
      AddReport('>Запись акта об усыновлении FR3','&Запись акта об усыновлении.fr3');
      AddReport('>Запись акта об усыновлении FR3 (26.07.2013)','&Запись акта об усыновленииН.fr3');
    end;
    Result := '&LIST&';
  end;
end;

//---------------------------------------------------
procedure ZAdopt_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisSmert.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then  ds.Fld('DATEZ').AsString:='' else  ds.Fld('DATEZ').AsDateTime:=Now;
    ds.Fld('POL').AsString := 'М';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GOSUD_DO').AsInteger := i;   
      ds.Fld('GOSUD_POSLE').AsInteger := i;   
      ds.Fld('OTEC_GRAG').AsInteger := i;   
      ds.Fld('MAT_GRAG').AsInteger := i;   
      ds.Fld('ON_GRAG').AsInteger := i;   
      ds.Fld('ONA_GRAG').AsInteger := i;   
      ds.Fld('OTEC_GOSUD').AsInteger := i;   
      ds.Fld('MAT_GOSUD').AsInteger := i;   
      ds.Fld('ON_GOSUD').AsInteger := i;   
      ds.Fld('ONA_GOSUD').AsInteger := i;   
    end;
    ds.Fld('OTEC_OBL').AsString := Parameters('OBL');   
    ds.Fld('MAT_OBL').AsString := Parameters('OBL');   
    ds.Fld('ON_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('OTEC_RAION').AsString := Parameters('RAION');   
    ds.Fld('MAT_RAION').AsString := Parameters('RAION');   
    ds.Fld('ON_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('OTEC_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('MAT_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   

//    ds.Fld('OBL_DO_B').AsString := Parameters('OBL_B');   
//    ds.Fld('RAION_DO_B').AsString := Parameters('RAION_B');   
    ds.Fld('OBL_DO').AsString   := Parameters('OBL');   
    ds.Fld('RAION_DO').AsString := Parameters('RAION');   
    ds.Fld('GOROD_DO').AsString := Parameters('GOROD');   
    ds.Fld('GOROD_DO_B').AsString := Parameters('GOROD_B');   
    ds.Fld('OBL_POSLE').AsString := Parameters('OBL');   
    ds.Fld('RAION_POSLE').AsString := Parameters('RAION');   
    ds.Fld('GOROD_POSLE').AsString := Parameters('GOROD');   

    ds.Fld('SPEC').AsString := Parameters('СПЕЦ_ЗАГС');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('РУК_ЗАГС');   
    ds.Fld('RUKOV_B').AsString := Parameters('РУК_ЗАГС_Б');   
  end;
end;

//-------- акты перемена имени ---------------------------------
function ZChName_Report : String;
var
  ds : TDataSet;
  s,sEXT,ss : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    s := GetAddNameAkt(true,sEXT);
    ss:=getAddNameSvid(ds);
//    if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := 'АЛБ'+s;
    if CurDok.OnlySvid then begin
      AddReport('Свидетельство о перемене имени','&Свидетельство о перемене имени.fr3');
//      AddReport('Свидетельство о перемене имени','&Свидетельство о перемене имени(новое)'+ss+'.frf');
      Result := '&LIST&';
      exit;
    end;
    AddReport('Запись акта о перемене имени','&Запись акта о перемене имени'+s+'.'+sEXT);
    AddReport('Свидетельство о перемене имени','&Свидетельство о перемене имени.fr3');
    if GlobalTask.ParamAsBoolean('OLD_SVID')
      then AddReport('Свидетельство о перемене имени (старое)','&Свидетельство о перемене имени.frf');
    if IdProg='ZAGS' then begin
      AddReport('Выписка о перемене имени','&Выписка о перемене имени.frf');
      if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
        AddReport('Архивная справка о перемене имени','&Архивная справка о перемене имениBLK.fr3');
      end else begin
        AddReport('Архивная справка о перемене имени','&Архивная справка о перемене имени.frf');
      end;
      if GlobalTask.ParamAsBoolean('SPRAV_BEL') then begin 
        AddReport('Архивная справка о перемене имени (бел.)','&Архивная справка о перемене имениBLK_BEL.fr3');
      end;
    end;
    {$IFDEF ADD_OLD_AKT}
//      if (s='') then AddReport('Запись акта о перемене имени (до изменения)','&Запись акта о перемене имени2.frf');
    {$ENDIF}
    if IsSystemAdmin then begin
      AddReport('-------------------------------','&Empty.frf');
      AddReport('>Свидетельство о перемене имени FR3','&Свидетельство о перемене имени.fr3');
      AddReport('>Свидетельство о перемене имени FR3 на линии','&Свидетельство о перемене имениМ.fr3');
      AddReport('>Запись акта о перемене имени2','&Запись акта о перемене имени2.frf');
      AddReport('>Запись акта о перемене имени2_2008','&Запись акта о перемене имени2_2008.frf');
      AddReport('>Запись акта о перемене имени_2008','&Запись акта о перемене имени_2008.frf');
      AddReport('>Запись акта о перемене имениАЛБ','&Запись акта о перемене имениАЛБ.frf');
      AddReport('>Запись акта о перемене имениАЛБ_2008','&Запись акта о перемене имениАЛБ_2008.frf');
      AddReport('>Запись акта о перемене имени FR3','&Запись акта о перемене имени.fr3');
      AddReport('>Запись акта о перемене имени FR3 (26.06.2013)','&Запись акта о перемене имениН.fr3');
      AddReport('>Архивная справка о перемене имени','&Архивная справка о перемене имени.frf');
      AddReport('>Архивная справка о перемене имени бланк','&Архивная справка о перемене имениBLK.fr3');
      AddReport('>Архивная справка о перемене имени (бел.)','&Архивная справка о перемене имениBLK_BEL.fr3');
    end;
    Result := '&LIST&';
  end;
end;

//---------------------------------------------------
procedure ZChName_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisSmert.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then  ds.Fld('DATEZ').AsString:='' else  ds.Fld('DATEZ').AsDateTime:=Now;
    ds.Fld('POL').AsString := 'М';   
    ds.Fld('DOK_TYPE').AsString  := '1';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GRAG').AsInteger := i;   
      ds.Fld('GOSUD').AsInteger := i;   
      ds.Fld('M_GOSUD').AsInteger := i;   
    end;
    ds.Fld('OBL').AsString := Parameters('OBL');   
//    ds.Fld('OBL_B').AsString := Parameters('OBL_B');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
//    ds.Fld('RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GOROD_B').AsString := Parameters('GOROD_B');   

    ds.Fld('M_OBL').AsString := Parameters('OBL');   
    ds.Fld('M_RAION').AsString := Parameters('RAION');   
    ds.Fld('M_GOROD').AsString := Parameters('GOROD');   

    ds.Fld('SPEC').AsString := Parameters('СПЕЦ_ЗАГС');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('РУК_ЗАГС');   
    ds.Fld('RUKOV_B').AsString := Parameters('РУК_ЗАГС_Б');   
    ds.Fld('OSNOV').AsString := Parameters('OSN_PER_IMENI');
    if not ds.Fld('VOSSTAN').AsBoolean then begin
      if ParamAsFloat('SUMP_POSHLINA')>0
        then ds.Fld('SUM_POSHLINA').AsFloat := ParamAsFloat('SUMP_POSHLINA'); 
      ds.Fld('POSHLINA').AsString := Parameters('POSHLINA'); 
    end;
  end;
end;
//----------------------------------------------------------------------------
function RasxodSvidNakl_Report : String;
begin
  Result := '&Приходно-расходная накладная.fr3';
end;
//----------------------------------------------------------------------------

function PasportViza_Report : String;
begin
  Result := '&Заявление на визу(1-ВВ).frf';
//  AddReport('Запись акта об отцовстве','&Запись акта об отцовстве.frf');
//  AddReport('Свидетельство об установлении отцовства','&Свидетельство об установлении отцовства.frf');
//  Result := '&LIST&';
end;

//---------------------------------------------------
function Passport_Report : String;
begin
  AddReport('Паспорт', 'Паспорт_Форма№1.fr3');
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('Паспорт FR3', 'Паспорт_Форма№1.fr3');
    AddReport('Паспорт old', 'Паспорт Форма№1.frf');
  end;
  Result := '&LIST&';
end;

//---------------------------------------------------
function VidGit_Report : String;
begin
  Result := '&Заявление вид на жительство.frf';
end;

//---------------------------------------------------
procedure PasportViza_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisSmert.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('RG_GOSUD').AsInteger := i;   
    end;
    ds.Fld('RG_OBL').AsString   := Parameters('OBL');   
    ds.Fld('RG_RAION').AsString := Parameters('RAION');   
    ds.Fld('RG_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('RUKOV').AsString    := Parameters('РУК_ПАСП');   
  end;
end;

//---------------------------------------------------
procedure TalonPrib_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  i := ParamAsInteger('GOSUD');
  if i>0 then begin
    ds.Fld('CITIZEN').AsInteger := i;   
  end;
  if Parameters('PROP_ORGAN')=''
    then ds.Fld('ORGAN').AsString := Parameters('NAME')
    else ds.Fld('ORGAN').AsString := Parameters('PROP_ORGAN');
  ds.Fld('PASP_UDOST').AsInteger := 1;
  ds.Fld('DATE_SOST').AsDateTime := Now;
  ds.Fld('DATEZ').AsDateTime := Now;
  if IdProg()<>'GKH' then begin
    ds.Fld('DATE_O').AsDateTime := Now;
  end;
  ds.Fld('B_OBL_R').AsBoolean := true;
  ds.Fld('B_OBL_O').AsBoolean := true;
  ds.Fld('GOROD_R_B').AsInteger := 1;
  ds.Fld('GOROD_O_B').AsInteger := 1;
  ds.Fld('IS_VUS').AsBoolean := false;
  if IdProg()='GKH' then begin
    ds.Fld('TYPEREG').AsInteger := NOT_DVIG;
  end;
end;

function TalonPrib_Report : String;
var
  l:Boolean;
begin
  l:=false;
  if IdProg()='GKH' then begin
    AddReport('Листок прибытия(А6)','&Листок прибытия(А6).fr3');
    AddReport('Талон к листку прибытия(А6)','&Талон к листку прибытия(А6).fr3');
    l:=true;
  end;
  AddReport('Листок прибытия','&Листок прибытия.fr3');
  AddReport('Листок прибытия и статистика','&Листок прибытия и статистика.fr3');
  AddReport('Листок прибытия (2 экз.)','&Листок прибытия2.fr3');
  if not l 
    then AddReport('Листок прибытия(А6)','&Листок прибытия(А6).fr3');
  AddReport('Талон миграционного учета', '&Талон миграционного учета.fr3');
  AddReport('Свидетельство о регистрации по месту пребывания','&Свидетельство о регистрации.fr3');
  AddReport('Сообщение о регистрации по месту жительства','&Сообщение ж.fr3');
  if l then AddReport('Сообщение о регистрации по месту жительства(А6)','&Сообщение жА6.fr3');
  AddReport('Сообщение о регистрации по месту пребывания','&Сообщение п.fr3');
  if l then AddReport('Сообщение о регистрации по месту пребывания(А6)','&Сообщение пА6.fr3');
  AddReport('Карточка регистрации','&Карточка регистрации(талон).fr3'); 

//  AddReport('Заявление о регистрации по месту жительства','&Заявление о регистрации по месту жительства.fr3'); 
//  AddReport('Заявление о регистрации по месту пребывания','&Заявление о регистрации по месту пребывания.fr3'); 

  Result := '&LIST&';
end;

//---------------------------------------------------
procedure TalonUbit_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  i := ParamAsInteger('GOSUD');
  if i>0 then begin
    ds.Fld('CITIZEN').AsInteger := i;   
  end;
  if Parameters('PROP_ORGAN')=''
    then ds.Fld('ORGAN').AsString := Parameters('NAME')
    else ds.Fld('ORGAN').AsString := Parameters('PROP_ORGAN');
  ds.Fld('DATE_SOST').AsDateTime := Now;
  ds.Fld('DATEZ').AsDateTime := Now;
  ds.Fld('PASP_UDOST').AsInteger := 1;
  ds.Fld('SMERT').AsBoolean := false;
end;

function TalonUbit_Report : String;
begin
//  AddReport('Листок убытия (3 экз.) и статистика','&Листок убытия3 и статистика1.frf');
  if IdProg()='GKH' then begin
    AddReport('Талон к листку убытия(А6)','&Талон к листку убытия(А6).fr3');
    AddReport('Листок убытия(А6)','&Листок убытия(А6).fr3');
  end;
  AddReport('Листок убытия','&Листок убытия.fr3');
  AddReport('Листок убытия и статистика','&Листок убытия и статистика.fr3');
  AddReport('Листок убытия (2 экз.)','&Листок убытия2.fr3');
  Result := '&LIST&';
end;


//---------------------------------------------------
procedure DeclRegistr_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  i := ParamAsInteger('GOSUD');
  if i>0 then ds.Fld('GOSUD_O').AsInteger := i;   
  if Parameters('PROP_ORGAN')=''
    then ds.Fld('ORGAN').AsString := Parameters('NAME')
    else ds.Fld('ORGAN').AsString := Parameters('PROP_ORGAN');
  ds.Fld('PASP_UDOST').AsInteger := 1;
  ds.Fld('DATEZ').AsDateTime := Now;
  i := ParamAsInteger('GOSUD');
  if i>0 then ds.Fld('GOSUD_O').AsInteger := i;   
  ds.Fld('OBL_O').AsString := Parameters('OBL');   
  ds.Fld('RAION_O').AsString := Parameters('RAION');   
  ds.Fld('GOROD_O').AsString := Parameters('GOROD');   
  ds.Fld('B_OBL_O').AsBoolean := true;
  ds.Fld('GOROD_O_B').AsInteger := 1;
  ds.Fld('TYPEREG').AsInteger:=MESTO_GIT;
  ds.Fld('KOLVO').AsInteger:=1;
  ds.Fld('POL').AsString:='М';
end;

function DeclRegistr_Report : String;
var
  sAdd:String;
begin
//  Result := '&LIST&';
//  AddReport('Заявление о регистрации по месту жительства','&Заявление о регистрации по месту жительства.fr3'); 
//  AddReport('Заявление о регистрации по месту пребывания','&Заявление о регистрации по месту пребывания.fr3'); 
  if GlobalTask.GetLastValueAsString('DECL_REG_A4')='1'
    then sAdd:='А4' else sAdd:='';
  if CurDok.Fld('TYPEREG').AsInteger=MESTO_GIT then begin
    Result:='&Заявление о регистрации по месту жительства'+sAdd+'.fr3'; 
  end else begin
    Result:='&Заявление о регистрации по месту пребывания'+sAdd+'.fr3'; 
  end;
end;

function Lich_Report : String;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  AddReport('Поквартирная карточка','&Поквартирная карточка (лицевой).fr3');
  AddReport('Лицевой счет(новый)','&Лицевой Счет.fr3');
  if IdProg()<>'GKH' 
    then AddReport('Лицевой счет(новый)+земля','&Лицевой Счет_земля.fr3');
  AddReport('Лицевой счет','&Лицевой Счет.frf');
  AddReport('Справка о составе семьи и занимаемом жилом помещении(банк)','@PrintSSS');
  Result := '&LIST&';
end;

function Adres_Report : String;
begin
  Result := '&Поквартирная карточка.fr3';
//  AddReport('Лицевой Счет','&Лицевой Счет.frf');
//  AddReport('Справка о составе семьи и занимаемом жилом помещении(банк)','@PrintSSS');
//  Result := '&LIST&';
end;

//---------------------------------------------------
procedure ZOpeka_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
  fld:TField;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('VID').AsInteger:=GlobalTask.GetLastValueAsInteger('DEF_OPEKA'); //;
    if ds.Fld('VID').AsInteger=0 then  ds.Fld('VID').AsInteger:=VID_OPEKA_DO14;
    ds.Fld('TIP').AsInteger := CHILD_POPECH;
    ds.Fld('FORMA').AsInteger := FORMA_OPEKA;
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('POL').AsString := 'М';   
    fld := ds.FindField('DOK_KOD');
    if fld<>nil then ds.Fld('DOK_KOD').AsString:='1';   
    i:=ParamAsInteger('GOSUD');
    if i=0 then i:=defGrag;
    ds.Fld('LONELY').AsBoolean:=false;   
    ds.Fld('GRAG').AsInteger  := i;   
//    ds.Fld('GT_GOSUD').AsInteger := i;   
    ds.Fld('GT_B_OBL').AsBoolean := true;   
    ds.Fld('GT_OBL').AsString   := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');    
//    ds.Fld('DOLG_RUKOV').AsString := Parameters('DOLG_RUK_ZAGS');   
    ds.Fld('SPEC').AsString := Parameters('SPEC');   
  end;
end;

//---------------------------------
function ZOpeka_Report : String;
//var
//  ds : TDataSet;
//  s,ss,sEXT : String;
begin
  {
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    AddReport('Карта учета ребенка','&Опека_Карта.fr3');
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
  end;
  Result := '&LIST&';
  }
  Result := '';
end;

procedure PrintSSS;
begin
  RunPrintForm('fmPrintSSS');
end;

function Lich_Check : Boolean;
begin
//  PutError('Ошибка !');
  Result := true;
end;

function GetLookUpPredZapis:String;
begin
  Result:='SELECT ID,NOMER,TYPEOBJ,MESTO,GOD,MONTH,DAY,BEGINR,LONGR, TELEFON, ON_FIO, ONA_FIO, FIRST_BRAK, '+
  'convert(DATER,SQL_DATE) DATER, Convert(DATE_CORR,SQL_DATE) DATE_CORR, '+
  'convert(cast(god as SQL_CHAR(4))+''-''+IIF(length(convert(month,SQL_VARCHAR))=1,''0''+convert(month,SQL_VARCHAR),convert(month,SQL_VARCHAR))+''-''+IIF(length(convert(day,SQL_VARCHAR))=1,''0''+convert(day,SQL_VARCHAR),convert(day,SQL_VARCHAR)),SQL_DATE) DATE_BRAK '+
  'FROM PredZapis WHERE '+GlobalTask.GetLastValueAsString('WHERE_PREDZAPIS')+' day>0 ORDER BY god,nomer ';
end;
//----------------------------------
function GetLookUpLic : String;
begin
 Result := 'SELECT l.DATE_FIKS, l.ID, l.NOMER, l.FIRST, n.Familia, n.Name, n.Otch,'+
    '  sp.name name_punkt, Trim(IFNULL(tu.name COLLATE ads_default_ci,''''))+'' ''+IFNULL(su.name COLLATE ads_default_ci,'''') name_ul,'+
    '  IFNULL(adr.dom,'''')+IFNULL(adr.korp,'''') dom_korp, adr.kv,'+
    '  l.Kniga_Nomer, l.Kniga_Str, l.ADRES_ID, l.CanDelete '+
 ' FROM ЛицевыеСчета l '+
 ' LEFT JOIN Население      n ON n.date_fiks=l.date_fiks and l.first=n.id'+
 ' LEFT JOIN БазаДомов    adr ON adr.date_fiks=l.date_fiks and adr.id=l.adres_id'+
 ' LEFT JOIN СпрНасПунктов sp ON sp.id=adr.punkt'+
 ' LEFT JOIN СпрУлиц       su ON su.id=adr.ul'+
 ' LEFT JOIN СпрТипУлиц    tu ON tu.id=su.tip'+
 ' WHERE l.date_fiks=''1899-12-30'' '+
 ' ORDER BY l.Nomer ';
end;

function GetLookUpSN_POST_OCH : String;
begin
 Result := 'SELECT ID, IIF(ukaz is null,'''',''№''+trim(UKAZ)+''  п '')+NAME AS NAME, ENDDATE, ''0'' TTT FROM SysSpr.SprPostOch '+
           ' union all '+
           'SELECT ID, IIF(ukaz is null,'''',''№''+trim(UKAZ)+''  п '')+NAME AS NAME, ENDDATE, ''1'' TTT FROM SysSpr.SprSnOch '+
           ' ORDER BY ttt,enddate,id ';
end;
//------------------------------------------------------------------
procedure CreateNalogZ;
var
  f  : TfmParamQuest;
  n, nGod, iRound, iNalog  : Integer;
  dDateVist, dDateSrok : TDateTime;
  nStavka,nZeml : Extended;
  ds,dsNalogi : TDataSet;
begin
  iRound := GlobalTask.ParamAsInteger('ROUND');
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите значения';
//  f.StepY:=17;
//  f.Flat:=false;
//  f.AddParamEx(1  , 'Налог'               , 'NALOG','TYPE=LOOKUP~DESC=LOOKUP_NALOGI~WIDTH=250');
  n := StrToInt(FormatDateTime('YYYY', GlobalTask.CurrentDate));
  f.AddParamEx(n      , 'За какой год'    , 'YEAR'    ,'TYPE=LIST~DESC=KEY_YEARS');
  f.AddParamEx(Now    , 'Дата начисления' , 'DATEVIS' ,'TYPE=DATE');
  f.AddParamEx('EMPTY', 'Срок оплаты'     , 'SROK'    ,'TYPE=DATE');
  f.AddParamEx(GlobalTask.ParamAsFloat('STAVKA_ZEM'), 'Ставка земельного налога' , 'STAVKA','FORMAT=###');

//  f.AddParamEx(0, 'Сумма', '4','FORMAT=### ### ### ###.##');
//  f.AddParamEx(2, 'List', '4','TYPE=LIST~DESC=KEY_TYPE_OBJ~WIDTH=100');
//  f.AddParamEx(6, 'Spr', '5','TYPE=SPR~DESC=LOOKUP_EDIZM~WIDTH=50~DOPSHOW=NAME');
//  f.AddParamEx(8, 'LookUp', '11','TYPE=LOOKUP~DESC=LOOKUP_EDIZM~WIDTH=350');
  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    dDateVist:= f.GetValue('DATEVIS','D');
    dDateSrok:= f.GetValue('SROK','D');
    nStavka  := f.GetValue('STAVKA','N');
    nGod     := f.GetValue('YEAR','N');
    iNalog := 1; // налог на землю
    f.Free;
    ds := dbGetDataSet('fmGurnAlfKn.Query');
    if ds<>nil then ds.DisableControls;
    OpenMessage('Расчет земельного налога ...','',10);
//    if dmBase = nil then showmessage('33333333333');
//    dsNalogi := dmBase.GetDataSet('tbNalogi');
    dsNalogi := dbGetDataSet('dmBase.tbNalogi');
    if (ds <> nil) and (dsNalogi<>nil) then begin
      dbSetIndex(dsNalogi, 'PR_KEY');
      ds.First;
      try
        while not ds.Eof do begin
          // прочитаем реквизит всего земли
          nZeml := dmBase.ReadPropAsFloat(ds.Fld('DATE_FIKS').AsDateTime,
                                      ds.Fld('ID').AsInteger, 'VSEGO');
          if nZeml > 0 then begin  // если есть земля
//            if not dbLocate(dsNalogi, 'DATE_FIKS;ID;GOD;NALOG',[ds.Fld('DATE_FIKS').AsDateTime,ds.Fld('ID').AsInteger,
//                      nGod,iNalog], '') then begin
            if not dbFindKey(dsNalogi, [ds.Fld('DATE_FIKS').AsDateTime,ds.Fld('ID').AsInteger,
                      nGod,iNalog], true) then begin
              dsNalogi.Append;
              dsNalogi.Fld('DATE_FIKS').AsDateTime := ds.Fld('DATE_FIKS').AsDateTime;
              dsNalogi.Fld('ID').AsInteger := ds.Fld('ID').AsInteger;
              dsNalogi.Fld('TYPEOBJ').AsInteger := dmBase.TypeObj_Lich;
              dsNalogi.Fld('GOD').AsInteger   := nGod; //
              dsNalogi.Fld('NALOG').AsInteger := iNalog; 
            end else begin
              dsNalogi.Edit;
            end;
            if dDateVist <> 0 then dsNalogi.Fld('DATE_VIST').AsDateTime := dDateVist;
            if dDateSrok <> 0 then dsNalogi.Fld('DATE_SROK').AsDateTime := dDateSrok;
            dsNalogi.Fld('SUMMA_VIST').AsFloat   := xRound(nZeml*nStavka,iRound);
//            dsNalogi.Fld('SUMMA_VIST').AsFloat   := RoundBYR(nZeml*nStavka);
            dsNalogi.Post;
          end;
          ds.Next;
        end;
      finally
        ds.First;
      end;
    end;
    if ds<>nil then ds.EnableControls;
    CloseMessage();
  end else begin
    f.Free;
  end;
//  fmMain.acSprPunktExecute(nil);
//  f.AddParamEx(false, 'Boolean', '1','TYPE=BOOLEAN');
//  f.AddParamEx('строка символов', 'String', '2','');
//  f.AddParamEx('', 'File', '8','TYPE=FILE~WIDTH=300');
//  f.AddParamEx('', 'Dir', '33','TYPE=DIR~WIDTH=300');
//  f.AddParamEx(3, 'Kvartal', '55','TYPE=KVARTAL');
//  f.AddParamEx(2, 'Month', '44','TYPE=MONTH');
end;

//------------------------------------------------------------------
procedure DeleteNalog;
var
  f  : TfmParamQuest;
  d : TDateTime;
  ds : TDataSet;
  lErr : Boolean;
  n,nGod,iNalog : Integer;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите значения';
//  f.StepY:=17;
//  f.Flat:=false;
  f.AddParamEx(1  , 'Налог'               , 'NALOG','TYPE=LOOKUP~DESC=LOOKUP_NALOGI~WIDTH=250');
  n := StrToInt(FormatDateTime('YYYY', GlobalTask.CurrentDate));
  f.AddParamEx(n      , 'За какой год'    , 'YEAR'    ,'TYPE=LIST~DESC=KEY_YEARS');
  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    nGod   := f.GetValue('YEAR','N');
    iNalog := f.GetValue('NALOG','N');
    f.Free;
    if Problem('  Вы уверены что хотите удалить ? ') then begin
      ds := dbGetDataSet('fmGurnAlfKn.Query');
      d  := ds.Fld('DATE_FIKS').AsDateTime;
      SetScreenCursor('HOURCLASS');
      lErr := not dbExecuteSQL('DELETE FROM nalogi WHERE DATE_FIKS='+DateToSQL(d)+
                    ' and GOD='+IntToStr(nGod)+' and NALOG='+IntToStr(iNalog));
      RestScreenCursor;
      if lErr then begin
        PutError(dbLastError());
      end;
//      ds := dbGetDataSet('fmGurnAlfKn.Query');
//      dsNalogi := dmBase.GetDataSet('tbNalogi');
//      if (ds <> nil) and (dsNalogi<>nil) then begin
//        dbSetIndex(dsNalogi, 'PR_KEY');
//      ds.First;
//      try
//        while not ds.Eof do begin
//          ds.Next;
//        end;
//      finally
//        ds.First;
//      end;
    end;
  end else begin
    f.Free;
  end;
end;

// обработка в журнале населения по корректности заполнеия номера идентификации
procedure CheckNomerIdentif;
var
  s,sErr:String;
  dsM,dsR:TDataSet;
begin
  SetScreenCursor('HOURCLASS');
  dsR := dbGetDataSet('fmMain.mtReport');
  dbZap(dsR);
  dbSetIndex(dsR,'BOK_KEY');
  try
    dsM := dmBase.GetDataSet('Население');
    dsM.Filter:='date_fiks=STOD('+QStr(DateCurSostF)+') .and. !Empty(lich_nomer) .and. (Empty(citizen) .or. citizen='+IntToStr(defGrag)+')';
    dsM.Filtered:=true;
    dsM.First;
    while not dsM.eof do begin
      s:=CheckLichNom(true,dsM.Fld('LICH_NOMER').AsString);
      sErr:=GetErrorCheck;
      if sErr='' then begin
        if s<>dsM.Fld('LICH_NOMER').AsString then begin
          dsM.Edit;
          dsM.Fld('LICH_NOMER').AsString:=s;
          dsM.Post;
        end;
      end else begin
        dsR.Append;
        dsR.Fld('BOK').AsString:=dsM.Fld('FAMILIA').AsString+' '+dsM.Fld('NAME').AsString+' '+dsM.Fld('OTCH').AsString;
        if not dsM.Fld('DATER').IsNull then
          dsR.Fld('SSS1').AsString:=DatePropis(dsM.Fld('DATER').AsDateTime,6);
        dsR.Fld('SSS2').AsString:=dsM.Fld('LICH_NOMER').AsString;
        dsR.Fld('MMM').AsString:=sErr;
        dsR.Append;
      end;
      dsM.Next;
    end;
  finally
    dsM.Filter:='';
    dsM.Filtered:=false;
    RestScreenCursor;
  end;
//  showmessage(IntToStr(dsR.RecordCount));
  if dsR.RecordCount>0 then
    GlobalTask.PreviewReport('&Ошибочные номера идентификации.frf');
end;

procedure TestWWW;
var
  ds : TDataSet;
  i : Integer;
begin
    if dbSetIndex(ds,'DATE_POST') then begin
      dbSetRange2(ds, [1,STOD('1900-01-01','')],[1,STOD('2005-12-31','')])
      ds.First;
      i:=0;
      while not ds.Eof do begin
        i:=i+1;
        ds.Next;
      end;
      i := dbRecordCount(ds);
      dbCancelRange(ds);
      ShowMessage(IntToStr(i)+'   '+IntToStr(dbRecordCount(ds)));
    end else begin
      ShowMessage('сортировка не установлена');
    end;
end;
//-------------------------------------------------------
procedure ChangeID_ZAGS;
var
  f  : TfmParamQuest;
  n,i  : Integer;
  ds : TDataSet;
  sNewID,sOldID:String;
  sNewNAME,sOldNAME,sSQL,sss:String;
  dDo:TDateTime;
  nYear,nMonth,nDay : Word;
begin
  ds:=dmBase.GetDataSet('SprNames');
  sOldID:=ds.Fld('ID').AsString;
  sOldName:=ds.Fld('NAME').AsString;
  sTmpWHERE:='ID<>'+sOldID;         // исп-ся в GetLookUpZAGS см. ниже
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Выберите новый ЗАГС';
  f.AddParamEx(0,'ЗАГС', 'ZAGS','TYPE=LOOKUP~DESC=LOOKUP_SPRNAMES2~WIDTH=250');
  f.AddParamEx(Date,'до даты', 'DATE_DO','TYPE=DATE');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  sNewID:='';
  if n = 1 then begin
    sNewID:=IntToStr(f.GetValue('ZAGS','N'));
    dDo:=f.GetValue('DATE_DO','D');
  end;
  f.Free;
  sTmpWHERE:='';
  if (sNewID<>'') and (sNewID<>'0') and (sNewID<>'-1') then begin
//    writedebug(DatePropis(dDo,0)+'  '+DatePropis(Now,0));
    if (dDo>0) and (dDo<Date) then begin
      sss:='для з/а выписанных по '+DatePropis(dDo,0)+Chr(13);
    end else begin
      sss:='';
    end;
    sNewName:=SeekValueSpr('SprNames','ID',sNewID,'NAME');
    if OkWarning('Если Вы хотите изменить орган регистрации:           '+Chr(13)+
                 '"'+sOldName+'"  '+Chr(13)+
                 ' на'+Chr(13)+
                 '"'+sNewName+'"  '+Chr(13)+sss+
                 'введите в поле ввода слово "ДА" ') then begin
      OpenMessage('Изменение ...','',10);
      n:=CountTablesZAGS;
      for i:=1 to n do begin
        sSQL:='';
        sss:='';
        if (dDo>0) and (dDo<Date) then begin
          if (UpperCase(GetNameTableZAGS(i))='ALFAVITZAGS') then begin
            DecodeDate(dDo,nYear,nMonth,nDay);
            sss:='and isnull(dayz,0)>0 and isnull(monthz,0)>0 and isnull(yearz,0)>0 and '+
                 'cast(trim(cast(yearz as SQL_CHAR))+''-''+right(''0''+trim(cast(monthz as SQL_CHAR)),2)+''-''+right(''0''+trim(cast(dayz as SQL_CHAR)),2) as SQL_DATE)<='+DateToSQL(dDo);
            sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+sss+';';
          end else if (UpperCase(GetNameTableZAGS(i))='LISTSVID') then begin

          end else begin
            sss:=' and datez<='+DateToSQL(dDo);
            sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+sss+';';
          end;
        end else begin
          sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+';';
        end;
        if sSQL<>'' then begin
//          writedebug(sSQL);
          dbExecuteSQL(sSQL);
          if dbLastError()<>'' then begin
//            writedebug(dbLastError());
            PutError( 'Ошибка выполнения: '+dbLastError() );
          end;
        end;
      end;
      CloseMessage();
    end;
  end;
end;

//--------------------------------
function GetLookUpZAGS:String;
var
  ss:String;
begin
  if sTmpWHERE<>'' then ss:=' WHERE '+sTmpWHERE else ss:='';
  Result:='SELECT ID,NAME FROM SprNames '+ss+' ORDER BY soato'; // присвоение sTmpWHERE см. выше ChangeID_ZAGS
end;

//------------------------------------------------
procedure ChangeSERIA_SVID;
var
  f  : TfmParamQuest;
  n,i  : Integer;
  ds : TDataSet;
  sNewID,sOldID:String;
  sNewNAME,sOldNAME,sSQL:String;
begin
  ds:=dmBase.GetDataSet('SvidSeria');
  sOldID:=ds.Fld('SERIA').AsString;
  sOldName:=ds.Fld('SERIA').AsString;
  sTmpWHERE:='SERIA<>'+QStr(sOldID);
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Выберите новую серию';
  f.AddParamEx('','Серия', 'SERIA','TYPE=LOOKUP~DESC=LOOKUP_SERIASVID~WIDTH=100');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  sNewID:='';
  if n = 1 then begin
    sNewID:=f.GetValue('SERIA','S');
  end;
  f.Free;
  sTmpWHERE:='';
  if (sNewID<>'') and (sNewID<>'0') and (sNewID<>'-1') then begin
    sNewName:=sNewID;
    if OkWarning('Если Вы хотите заменить серию:   '+Chr(13)+
                 '"'+sOldName+'"  '+Chr(13)+
                 ' на'+Chr(13)+
                 '"'+sNewName+'"  '+Chr(13)+
                 'введите в поле ввода слово "ДА" ') then begin
      OpenMessage('     Замена  "'+sOldName+'" на "'+sNewName+'" ... ','',10);
      sNewID:=QStr(sNewID);
      sOldID:=QStr(sOldID);
      sSQL:=' update SvidPovtor set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
            ' update АктыРождений set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
            ' update АктыСмертей set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
            ' update АктыУстОтцовства set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
            ' update АктыУстОтцовства set svid_seria2='+sNewID+' where svid_seria2='+sOldID+';'+chr(13)+
            ' update ЗаключениеБраков set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13);
      if IdProg='ZAGS' then begin
        sSQL:=sSQL+
              ' update AktAdopt set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
              ' update AktChangeName set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
              ' update АктыУстМатеринства set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
              ' update AktTermMarriage set on_svid_seria='+sNewID+' where on_svid_seria='+sOldID+';'+chr(13)+
              ' update AktTermMarriage set ona_svid_seria='+sNewID+' where ona_svid_seria='+sOldID+';';
      end;
      dbExecuteSQL(sSQL);
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения: '+dbLastError() );
      end else begin
        // удалим дубликаты SVID_TYPE, SVID_SERIA(старая;новая), SVID_NOMER
        sSQL:='DELETE FROM listsvid WHERE EXISTS (SELECT * from ( '+
          'select SVID_TYPE, IIF(SVID_SERIA='+sOldID+','+sNewID+',SVID_SERIA) SVID_SERIA, SVID_NOMER, count(*) '+
          'from listsvid l  group by 1,2,3  having count(*)>1) aaa '+
          'WHERE listsvid.svid_type=aaa.svid_type and listsvid.svid_nomer=aaa.svid_nomer and listsvid.svid_seria='+sOldID+');';
        dbExecuteSQL(sSQL);
        dbExecuteSQL('update ListSvid set svid_seria='+sNewID+' where svid_seria='+sOldID+';');
        if dbLastError()<>'' then begin
          ShowMessage( 'Ошибка (таблица свидетельста): '+dbLastError() );
        end else begin
          ds.Delete;
        end;
      end;
      CloseMessage();
    end;
  end;
end;
//--------------------------------
function GetLookUpSERIA:String;
var
  ss:String;
begin
  if sTmpWHERE<>'' then ss:=' WHERE '+sTmpWHERE else ss:='';
  Result:='SELECT SERIA AS ID, SERIA AS NAME FROM SvidSeria '+ss+' ORDER BY seria'; // присвоение sTmpWHERE см. выше 
end;
//------------------------------------------------
procedure ChangeID_UL;
var
  f  : TfmParamQuest;
  n,i  : Integer;
  ds,dsEx : TDataSet;
  sNewID,sOldID:String;
  sNewNAME,sOldNAME,sSQL:String;
begin
  ds:=dmBase.GetDataSet('SprUL');
  sOldID:=ds.Fld('ID').AsString;
  dsEx:=dmBase.GetDataSet('LookupUL');
  if not dbLocate(dsEx, 'ID', [sOldID], '') then begin
    PutError('Не найдена улица!');
    exit;
  end;
  sOldName:=dsEx.Fld('NAME').AsString;
  dsEx.First;
  sNewID:='';
  n:=0;
  try
    dsEx.Filter:='ID<>'+sOldID;
    dsEx.Filtered:=true;
    f := TfmParamQuest.Create(nil);
    f.Caption := 'Выберите новую улицу';
    f.AddParamEx(0,'Улица', 'ULICA','TYPE=LOOKUP~DESC=LOOKUP_UL~WIDTH=250');
    f.AddButtons('Выполнить~Отказ',0);
    n:=f.ShowQuest;
    sNewName:=dsEx.Fld('NAME').AsString;
  finally
    dsEx.Filter:='';
    dsEx.Filtered:=false;
  end;
  if n=1 then begin
    sNewID:=f.GetValue('ULICA','S');
  end;
  f.Free;
  if (sNewID<>'') and (sNewID<>'0') and (sNewID<>'-1') then begin
    if OkWarning('Если Вы хотите заменить улицу:   '+Chr(13)+
                 '"'+sOldName+'"  '+Chr(13)+
                 ' на'+Chr(13)+
                 '"'+sNewName+'"  '+Chr(13)+
                 'введите в поле ввода слово "ДА" ') then begin
      OpenMessage('     Замена  "'+sOldName+'" на "'+sNewName+'" ... ','',10);
//      sNewID:=QStr(sNewID);
//      sOldID:=QStr(sOldID);
      sSQL:=' update БазаДомов set ul='+sNewID+' where ul='+sOldID+';'
      dbExecuteSQL(sSQL);
      if dbLastError()<>'' then begin
        CloseMessage();
        ShowMessage( 'Ошибка выполнения: '+dbLastError() );
      end else begin
        ds.Delete;
        sSQL:=' update BigHouse set ul='+sNewID+' where ul='+sOldID+';';
        dbExecuteSQL(sSQL);
        if dbLastError()<>'' then begin
          CloseMessage();
          ShowMessage( 'Ошибка выполнения: база домов'+Chr(13)+'Неоходимо переформирование базы домов' );
        end;
      end;
      CloseMessage();
    end;
  end;
end;
//--------------------------------
function GetLookUpULICA:String;
var
  ss:String;
begin
  if sTmpWHERE<>'' then ss:=' WHERE '+sTmpWHERE else ss:='';
  Result:='SELECT ID, NAME FROM SprUL '+ss+' ORDER BY name'; // присвоение sTmpWHERE см. выше 
end;

function getSprInternat:String;
begin
  Result:='dmBase.SprUchZaved';  // в progo.pas есть такая же  функция   dmBase.SprInternat
end;

begin
end.
