// захоронения
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
{$DEFINE CHECK_ATE}

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
  idConnShared:=dbRegisterConnect('AdsSharedConnection','CHARTYPE=ANSI;TABLETYPE=ADT');
  idConn:=dbRegisterConnect('AdsConnection','CHARTYPE=ANSI;TABLETYPE=ADT');

  TypeBASE:=GlobalTask.GetWorkParam('TYPEBASE');
  if TypeBASE='' then TypeBASE:='ZAH';
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

//---------------------------------
function AktZAH_Report : String;
var
  ds : TDataSet;
  s,ss,sEXT : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    AddReport('Заявление','&Захоронение_заявление.fr3');
    AddReport('Справка (A5)','&Захоронение_справка.fr3');
    AddReport('Справка (A4)','&Захоронение_справкаА4.fr3');
//    AddReport('Акт о захоронении','&Захоронение_акт.fr3');
    AddReport('Акт о захоронении','&Захоронение_акт2.fr3');
    AddReport('Удостоверение','&Захоронение_удостоверение.fr3');
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('Справка','&Захоронение_справка.fr3');
    AddReport('Заявление','&Захоронение_заявление.fr3');
    AddReport('Удостоверение','&Захоронение_удостоверение.fr3');
    AddReport('Акт о захоронении (старый)','&Захоронение_акт.fr3');
    AddReport('Акт о захоронении','&Захоронение_акт2.fr3');
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
    ds.Fld('DATEZH').AsDateTime := Now;
    ds.Fld('POL').AsString := 'М';   
    fld := ds.FindField('DOK_KOD');
    if fld<>nil then ds.Fld('DOK_KOD').AsString:='1';   
    i:=ParamAsInteger('GOSUD');
    if i=0 then i:=defGrag;
    ds.Fld('GRAG').AsInteger  := i;   
    ds.Fld('GT_GOSUD').AsInteger := i;   

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
//    ds.Fld('ZH_MOG').AsString := '1';
    
  end;
end;


//----------------------------------------------------------------------------
function RasxodSvidNakl_Report : String;
begin
  Result := '&Приходно-расходная накладная.fr3';
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


//----------------------------------------------------------------
procedure LoadFromExcel;
var
  XL:Variant;
  lOk:Boolean;
  dsAkt:TDataSet;
  sNameExcel,s:String;
  nID,i,j:Integer;
  dDate:TDAteTime;
  sIN,sfio, sPasp, sSpec, sRow, sUch :String;
  sDateS,sFam,sName,sOtch, sSect:String;
  sl:TStringList;
begin
  XL:=GetOfficeObject('Excel',lOk);
  if lOk then begin
    sNameExcel:='E:\Глусск.xls';
    XL.WorkBooks.Add(sNameExcel);
    sIN:='*'
    dsAkt:=dbGetDataSet('dmBase.AktZ');
    sl:=TStringList.Create;
    try
      for i:=2 to 810 do begin //13739 do begin
        sl.Clear;
        s:=IntToStr(i);
        sFIO:=Trim(XL.Range['D'+s].Value);
        StrToStrings(sFIO, sl, ' ');
        if sl.Count>0 then sFam:=sl.Strings[0];
        if sl.Count>1 then sName:=sl.Strings[1];
        if sl.Count>2 then sOtch:=sl.Strings[2];
        dDate:=XL.Range['E'+s].Value;
        sPasp:=XL.Range['F'+s].Value;
        sIN:=XL.Range['G'+s].Value;
        sSpec:=XL.Range['I'+s].Value;
        sSect:=XL.Range['J'+s].Value;
        sRow:=XL.Range['K'+s].Value;
        sUch:=XL.Range['L'+s].Value;

//          vDateP:=XL.Range['N'+s].Value;
//          if vDateP=null then sDateP:='null' else sDateP:=vDateP;
        nID:=dmBase.getNewID(62);
        dsAkt.Append;
        dsAkt.Fld('ID').AsInteger:=nID;
        dsAkt.Fld('ID_SOURCE').AsInteger:=700100279;
        dsAkt.Fld('ID_ZAGS').AsInteger:=700100279;
        dsAkt.Fld('PODR').AsInteger:=1;
        dsAkt.Fld('DATES').AsDateTime:=dDate;
        dsAkt.Fld('FAMILIA').AsString:=sFam;
        dsAkt.Fld('NAME').AsString:=sName;
        dsAkt.Fld('OTCH').AsString:=sOtch;
        dsAkt.Fld('LICH_NOMER').AsString:=sIN;
        dsAkt.Fld('LICH_NOMER').AsString:=sIN;
        dsAkt.Fld('ZH_UCH').AsString:=sSect;
        dsAkt.Fld('ZH_RAD').AsString:=sRow;
        try
          dsAkt.Fld('ZH_UCH2').AsString:=sUch;
        except
        end;
        dsAkt.Fld('RUKOV').AsString:=sSpec;

        dsAkt.Post;
        writedebug('-------------------------------------------------');
        writedebug(inttostr(i-1)+'  '+DatePropis(dDate,3)+' '+sFam+' '+sName+' '+sOtch+' IN='+sIN);
//        writedebug('DATES='+sDateS+'  DATEP='+sDateP);
//        end;
//        i:=i+1;
      end;
    finally
//      CloseMessage();
    end;

    XL.Visible:=true;
    XL:=null;
    sl.Free;
  end;
end;



begin
end.
