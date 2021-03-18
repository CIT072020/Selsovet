// опека
program Main;
var
  idConn, TypeBASE : String;
  curQuery:TDataSet;
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
  z_opeka    = '63';
  datecursostS='1899-12-30';
  datecursostF='18991230';
  BEZ_ADRESA  = 3; //  человек не проживает и не зарегистрирован (чужой)

  SHAMP_=1;
  SHAMP_GERB=2;
  MESTO_GIT=1;
  MESTO_PREB=0;
  MESTO_NOTREG=2;
  IZM_MEN=2;     // изменить данные о человеке   
  NOT_DVIG=3;    // не проводить                 

  MAX_OCHERED=4;   //  максим. номер очереди (участок)

  OCH_RESH_POST=1;
  OCH_RESH_VOST=2;
  OCH_RESH_RAZD=3;
  OCH_RESH_PERE=4;
  OCH_RESH_UNION=5;
  OCH_RESH_SN=9;
  OCH_RESH_ADDMEN=6;
  OCH_RESH_ISKMEN=7;

  OCH_RESID_OBSH=1;    // residence=общежитие

  OCH_TYPE_OBSH=0;   // общий списк
  OCH_TYPE_SOCIAL=2; // социальное жилье
  OCH_TYPE_ANY_OTD=1000; // любая отдельная

  OCH_OSN_FULL=1;   // полное наименование
  OCH_OSN_FULL2=6;   // полное наименование + наименование указа
  OCH_OSN_KRAT=2;   // краткое + наименование указа
  OCH_OSN_UKAZ=3;   // пункт + наименование указа
  OCH_OSN_POLOG=4;  // пункт + положение
  OCH_OSN_PUNKT=5;  // только номер пункта

//{$DEFINE OLD_SVID}
{$DEFINE OBR_GRAG}
//{$DEFINE OCHERED}
//{$DEFINE CHECK_ATE}

{$I load.pas}
{$I personal.pas}
{$I update.pas}

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
  idConn:=dbRegisterConnect('AdsConnection','CHARTYPE=ANSI;TABLETYPE=ADT');

  TypeBASE:=GlobalTask.GetWorkParam('TYPEBASE');
  if TypeBASE='' then TypeBASE:='SELSOVET';
//  ShowMessage(GetPadegFIO('Иванова', 'Ж', 'Р'));
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

function GetShtampSpr:String;
begin Result:=Globaltask.ParamAsString('SHTAMP') end;

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

//---------------------------------------------------------------
function DolgSecretar : String; begin Result:='1111';  end; //'Управляющий делами';
function FIOSecretar : String;  begin Result:='2222';   end;

function DolgRukov : String;    begin Result:=ParamAsString('DOLG_RUKOV');  end;
function FIORukov : String;     begin Result:=ParamAsString('RUKOV');end;

function DolgGlBux : String;    
begin 
  Result:=ParamAsString('DOLG_GL_BUX'); 
  if Result='' then Result:='Главный бухгалтер';
end;
function FIOGlBux : String;  begin Result:=ParamAsString('ГЛ_БУХГАЛТЕР');end;

//---------------------------------------------------------------
function DolgSpec : String;    
begin  Result:=ParamAsString('DOLG_SPEC'); end;
//---------------------------------------------------------------
function FIOSpec : String;     
begin  Result:=ParamAsString('SPEC');   end;

//-------------------------------------------------------------------------
procedure FirstLoadTerr;
var
  dsUL_Nal, dsUL, dsSour, dsDest : TDataSet;
  strTerr, strAdd : String;
begin
  strTerr := SoatoFromID(MyID());
  if (strTerr<>'') and dbSetCurrentConnect(idConn) then begin
    SetScreenCursor('HOURCLASS');
    dsSour:=dbOpenSQL('SELECT kod,name,typepunkt,id FROM SysSpr.СпрСОАТО ORDER BY KOD','');
    if dsSour<>nil then begin
        if Copy(strTerr,2,1)='4' then begin // большой город + нас. пункт подч. гор. совету
          dsSour.Filter := 'kod='+''''+Copy(strTerr,1,4)+'000000'+''''+ ' or '+
           '(substr(kod,1,4)='+''''+Copy(strTerr,1,4)+''''+' and substr(kod,5,3)>'+''''+'500'+''''+
           ' and !Empty(typepunkt) )';
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
   sl := TStringList.Create;
   StrToStrings(s, sl, ' ');
   if sl.Count=3 then begin
     Men.Fld('Familia').AsString := Trim(FirstUpper(sl[0]));
     Men.Fld('Name').AsString := Trim(FirstUpper(sl[1]));
     Men.Fld('Otch').AsString := Trim(FirstUpper(sl[2]));
   end else begin
     Men.Fld('Familia').AsString := Trim(FirstUpper(Men.Fld('Familia').AsString));
   end;
   sl.Free;
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

const
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

//----------------------------------------------------------------------------

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
 Result := 'SELECT ID, ''№''+trim(UKAZ)+''  п ''+NAME AS NAME, ENDDATE, ''0'' TTT FROM SysSpr.SprPostOch '+
           ' union all '+
           'SELECT ID, ''№''+trim(UKAZ)+''  п ''+NAME AS NAME, ENDDATE, ''1'' TTT FROM SysSpr.SprSnOch '+
           ' ORDER BY ttt,enddate,id ';
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
      sSQL:=' update БазаДомов set ul='+sNewID+' where ul='+sOldID+';'+chr(13)+
            ' update BigHouse set ul='+sNewID+' where ul='+sOldID+';';
      dbExecuteSQL(sSQL);
      if dbLastError()<>'' then begin
        ShowMessage( 'Ошибка выполнения: '+dbLastError() );
      end else begin
        ds.Delete;
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
  Result:='dmBase.SprInternat';  // в prog.pas есть такая же  функция   dmBase.SprUchZaved
end;

//----------------------------------
// выгрузка для Минтруда
function OpekaToMintrud1(nType:Integer; ds:TDataSet; sYear:String; sQuarter:String; sUNP:String):Integer;
var
  sl:TStringList;
  s,sPath,sFile:String;
  n:Integer;
  d:TDateTime;
  lOk:Boolean;
begin
  Result:=0;
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
  ds.First;
  while not ds.Eof do begin  
    if Trim(ds.Fld('IDENTIF').AsString)<>'' then begin
      sl.Add(ds.Fld('IDENTIF').AsString); 
      Result:=Result+1;
    end;
    ds.Next;
  end;
  sl.Add('[/IDENTIF]'); 
  ds.First;
  if Result>0 then begin
    for n:=0 to sl.Count-1 do sl.Strings[n]:=ANSItoUTF8(sl.Strings[n]);
    sPath:=GetFolderExport;
    if nType=1 then s:='н' else s:='оп';
    sFile:=sPath+'\MT_'+sUNP+'_'+sYear+'_'+StringReplace(sQuarter,',','-')+s+'.txt';
    ForceDirectories(sPath);
    DeleteFiles(sPath+'\*.*');
    sl.SaveToFile(sFile);
    ShellExt2(sPath,'explore');
  end;
  sl.Free;
//  ShowMessage(sFile);
end;
//------------
function Get_List_Men(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   n:Integer;
   s,ss:String;
begin
  result:=true;
  ds:=GetTemplateDataSet('MAIN');
  if ds<>nil then begin
    if not ds.Active then ds.Open;
    ds.Edit;
//    ds.Fld('KOLVO_L').AsString := GlobalTask.GetLastValueAsString('TOTALPAGES')+' шт';
    ds.Fld('SHTAMP').AsString:=GetShtampSpr();
    ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
    ss:=' для исключения из базы трудоспосбных граждан не занятых в экономике';
    s:=GetTemplateParam('PAR');
    if s='1' 
      then ds.Fld('NAMELIST').AsString :='СПИСОК'+CRLF+'недееспособных граждан'+ss
      else ds.Fld('NAMELIST').AsString :='СПИСОК'+CRLF+'опекунов (попечителей)'+ss;
    ds.Fld('FIO_PODP1').AsString :=FIORukov;
    ds.Fld('DOLG_PODP1').AsString :=DolgRukov;
    ds.Post;
    ds:=GetTemplateDataSet('TABLSOST');
//   curQuery  глобальная переменная
    n:=1;
    curQuery.First;
    while not curQuery.Eof do begin
      ds.Append;
      ds.Fld('NN').AsString:=IntToStr(n);
      ds.Fld('GR1').AsString:=curQuery.Fld('FAMILIA').AsString+' '+curQuery.Fld('NAME').AsString+' '+curQuery.Fld('OTCH').AsString;
      ds.Fld('GR2').AsString:=DatePropis(curQuery.Fld('DATER').AsDateTime,3);
      s:=Trim(curQuery.Fld('IDENTIF').AsString);
      if s='' 
        then ds.Fld('GR2').AsString:='отсутствует'
        else ds.Fld('GR3').AsString:=s;
      ds.Post;
      n:=n+1;
      curQuery.Next;
    end;
  end;
end;
//-------------------------------
procedure OpekaToMintrud(nType:Integer);
var
  ds,q:TDataSet;
  f:TfmParamQuest;
  n:Integer;
  sSQL,sQ,sUNP,sYear,s:String;
  lOk:Boolean;
begin
  sUNP:=Trim(ParamAsString('UNP'));
  f:=TfmParamQuest.Create(nil);
  f.Caption:='Параметры';
  f.AddParamEx(YearOf(Now), 'Год выгрузки' , 'YEAR' ,'TYPE=YEAR~MIN=2000~MAX=2999~WIDTH=80');
  f.AddParamEx('', 'Квартал выгрузки' , 'QUARTER' ,'WIDTH=80');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  if n=1 then begin
    lOk:=true;
    sYear:=IntToStr(f.GetValue('YEAR','N'));
    sQ:=Q_DelChars(f.GetValue('QUARTER','C'),' ');
    if (sQ='') or not IsAllDigit(StringReplace(sQ, ',', '0')) then begin
      PutError('Ошибка при заполнении номера квартала');
      lOk:=false;
    end;
    if lOk then begin
//      ds:=dbGetDataSet('fmGurnZOpeka.Query');
      if nType=1 then begin // выгрузка недееспособных
        sSQL := 'SELECT * FROM AktOpek WHERE vid=2 and getVozrast(curdate(),dater)<65 and DATE_OTM is null'; //ORDER BY familia,name,otch ';
        OpenMessage('Выгрузка недееспособных для Минтруда ...','',10);
        q:=dbOpenSQL(sSQL,'');
        curQuery:=q;
        n:=OpekaToMintrud1(nType, q, sYear, sQ, sUNP);
//        GlobalTask.SetLastValueAsInteger('KOLVO_F', 1);
      end else begin // 2
        sSQL := 'SELECT ON_FAMILIA FAMILIA, ON_NAME NAME, ON_OTCH OTCH, ON_DATER DATER, ON_IDENTIF IDENTIF FROM AktOpek WHERE is_mintrud=true'; //ORDER BY familia,name,otch ';
        OpenMessage('Выгрузка опекунов (попечителей) для Минтруда ...','',10);
        q:=dbOpenSQL(sSQL,'');
        curQuery:=q;
        n:=OpekaToMintrud1(nType, q, sYear, sQ, sUNP);
//        GlobalTask.SetLastValueAsInteger('KOLVO_F', 1);
      end;
      CloseMessage;
      if n=0 
        then ShowMessage('Для выгрузки никто не найден')
        else RunTemplate2('Get_List_Men'+InttoStr(nType), GetFolderExport, false);  // см. выше
      dbClose(q);
    end;
  end;
  f.Free;
end;


begin
end.
