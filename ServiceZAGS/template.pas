//--- заявление матери и не введены реальные данные по отцу ------------------------------------------------------------
function IsZvMat(ds:TDataSet):Boolean;
var
  fld:TField;
begin
  Result:=false;
  fld:=ds.FindField('ON_DATER');
  if fld=nil then begin
    if (ds.Fld('SVED').AsString='3') then begin  
      Result:=true;
    end;
  end else begin
    if (ds.Fld('SVED').AsString='3') and ds.Fld('ON_DATER').IsNull then begin  
      Result:=true;
    end;
  end;
end;
function IsZvMat_(dok:TDokZAGS):Boolean;
var
  fld:TField;
begin
  Result:=false;
  fld:=dok.Fld('ON_DATER');
  if fld=nil then begin
    if (dok.Fld('SVED').AsString='3') then begin 
      Result:=true;
    end;
  end else begin
    if (dok.Fld('SVED').AsString='3') and fld.IsNull then begin 
      Result:=true;
    end;
  end;
end;
//---------------------------------------------------------------
function Ochered_Dolg : String;    // должность руководителя по очередникам
begin Result :=ParamAsString('DOLG_RUKOV'); end;

function Ochered_FIO : String;      // ФИО руководителя по очередникам
begin Result :=ParamAsString('ПРЕДСЕДАТЕЛЬ'); end;
//---------------------------------------------------------------
function DolgSecretar : String; begin Result:=ParamAsString('DOLG_UPRAV');  end; //'Управляющий делами';
function FIOSecretar : String;  begin Result:=ParamAsString('СЕКРЕТАРЬ');   end;

function DolgRukov : String;    begin Result:=ParamAsString('DOLG_RUKOV');  end;
function FIORukov : String;     begin Result:=ParamAsString('ПРЕДСЕДАТЕЛЬ');end;

function DolgGlBux : String;    
begin 
  Result:=ParamAsString('DOLG_GL_BUX'); 
  if Result=''
    then Result:='Главный бухгалтер';
end;
function FIOGlBux : String;     begin Result:=ParamAsString('ГЛ_БУХГАЛТЕР');end;

//---------------------------------------------------------------
function DolgSpec : String;    
begin 
  if (IDPROG()='ZAGS') or  (IDPROG()='OCHERED')
    then Result:=ParamAsString('DOLG_SPEC')    
    else Result:=ParamAsString('DOLG_PASP');    
end;

//---------------------------------------------------------------
function FIOSpec : String;     
begin 
  if IDPROG()='OCHERED'
    then Result:=ParamAsString('СПЕЦИАЛИСТ')
    else 
      if IDPROG()='ZAGS' 
        then Result:=ParamAsString('СПЕЦ_ЗАГС')     
        else Result:=ParamAsString('РУК_ПАСП');     
end;
//---------------------------------------------------------------
function FIOSpecEx(nType:Integer) : String;     
begin  if nType=1 then Result:=ParamAsString('СПЕЦ_ЗАГС_Б') else Result:=FIOSpec() end;
//---------------------------------------------------------------
function DolgSpecOrSecretar : String; 
begin if FIOSpec='' then Result:=DolgSecretar else Result:=DolgSpec; end;
//---------------------------------------------------------------
function FIOSpecOrSecretar : String; 
begin if FIOSpec='' then Result:=FIOSecretar  else Result:=FIOSpec;  end;
//---------------------------------------------------------------
function FIORukovZAGS : String; 
begin Result:=Parameters('РУК_ЗАГС') end;
//---------------------------------------------------------------
function FIORukovZAGS_B : String; 
begin Result:=Parameters('РУК_ЗАГС_Б') end;
//---------------------------------------------------------------
function GetShtampSpr:String;
begin Result:=Globaltask.ParamAsString('SHTAMP') end;
//---------------------------------------------------------------
function GetShtampSprEx(nType:Integer):String;
begin 
  if nType=1 then Result:=Globaltask.ParamAsString('SHTAMP_B') 
             else Result:=Globaltask.ParamAsString('SHTAMP'); 
end;
//---------------------------------------------------------------
function Zags_Akt_Rukov : String;
begin
  Result:=DokZags.Fld('RUKOV').AsString;
end;

function Zags_Akt_Spec : String;
begin
  Result:=DokZags.Fld('SPEC').AsString;
end;
//------------------
function Zags_Svid_Podp(sLang:String) : String;
begin
  if DokZAGS.OnlySvid then begin
    if DokZags.PrintSpecSvid then begin // печать специалиста в свидетельстве
      if (sLang='B') or (sLang='Б')  then Result:=DokZags.Fld('Spec_B').AsString  else Result:=DokZags.Fld('Spec').AsString;
    end else begin
      if (sLang='B') or (sLang='Б')  then Result:=DokZags.Fld('Rukov_B').AsString  else Result := DokZags.Fld('Rukov').AsString;
    end;
  end else begin
    // если повторное свидетельство
    if DokZags.Fld('POVTOR').AsBoolean then begin
      if DokZags.PrintSpecSvid then begin // печать специалиста в свидетельстве
        if (sLang='B') or (sLang='Б') 
          then Result := ParamAsString('СПЕЦ_ЗАГС_Б')
          else Result := ParamAsString('СПЕЦ_ЗАГС');  
      end else begin
        if (sLang='B') or (sLang='Б') 
          then Result := ParamAsString('РУК_ЗАГС_Б')
          else Result := ParamAsString('РУК_ЗАГС');
      end;
    end else begin
      if DokZags.PrintSpecSvid then begin // печать специалиста в свидетельстве
        if (sLang='B') or (sLang='Б') 
          then Result := DokZags.Fld('Spec_B').AsString
          else Result := DokZags.Fld('Spec').AsString;
      end else begin
        if (sLang='B') or (sLang='Б') 
          then Result := DokZags.Fld('Rukov_B').AsString
          else Result := DokZags.Fld('Rukov').AsString;
      end;
    end;
  end;
end;
//------------------------
function Zags_Sprav_Dolg : String;
begin
 if DokZags.PrintSpecSprav=1  // печать специалиста в справках  1-да 0-нет 2-только ФИО
   then Result := ParamAsString('DOLG_SPEC')  
   else Result := ParamAsString('DOLG_RUK_ZAGS');
end;
function Zags_Sprav_FIO : String;
begin
 if (DokZags.PrintSpecSprav=1) or (DokZags.PrintSpecSprav=2) // печать специалиста в справках
   then Result := ParamAsString('СПЕЦ_ЗАГС')  
   else Result := ParamAsString('РУК_ЗАГС');
end;
//------------------------
function Zags_Sprav_DolgEx(nType:Integer) : String;
begin
 if nType=1 then begin
   if DokZags.PrintSpecSprav=1  // печать специалиста в справках  1-да 0-нет 2-только ФИО
     then Result := ParamAsString('DOLG_SPEC_B')  
     else Result := ParamAsString('DOLG_RUK_ZAGS_B');
 end else begin
   Result:=Zags_Sprav_Dolg;
 end;
end;
function Zags_Sprav_FIOEx(nType:Integer) : String;
begin
 if nType=1 then begin
   if (DokZags.PrintSpecSprav=1) or (DokZags.PrintSpecSprav=2) // печать специалиста в справках
     then Result := ParamAsString('СПЕЦ_ЗАГС_Б')  
     else Result := ParamAsString('РУК_ЗАГС_Б');
 end else begin
   Result:=Zags_Sprav_FIO;
 end;
end;
//------------------------
function Zags_Copy_Rukov : String;
begin
  if (IdProg1()='S') and (GlobalTask.GetLastValueAsInteger('COPY_ZAGS_RUK_RN')=1) then begin
    Result := ParamAsString('DOLG_ZAGS_RN');
  end else begin
   if ParamAsString('PR_SPEC_COPY')='1'  // печать специалиста в копии з/а  1-да 0-нет 2-только ФИО
     then Result := ParamAsString('DOLG_SPEC')  
     else Result := ParamAsString('DOLG_RUK_ZAGS');
  end;
end;

function Zags_Copy_FIO : String;
var
  sType:String;
begin
  if (IdProg1()='S') and (GlobalTask.GetLastValueAsInteger('COPY_ZAGS_RUK_RN')=1) then begin
    Result := ParamAsString('RUK_ZAGS_RN');
  end else begin
    sType:=ParamAsString('PR_SPEC_COPY');
    if (sType='1') or (sType='2') // печать специалиста в копии з/а
      then Result := ParamAsString('СПЕЦ_ЗАГС')  
      else Result := ParamAsString('РУК_ЗАГС');
  end;
end;
//------------------------
function Zags_Otchet_DOLG : String;
begin
  if IDPROG()='ZAGS' then begin
    Result:=ParamAsString('DOLG_RUK_ZAGS')
  end else begin
    if ParamAsBoolean('PR_SPEC_SPRAV')
      then Result:=ParamAsString('DOLG_SPEC')
      else Result:=ParamAsString('DOLG_RUK_ZAGS');
  end;
end;
//------------------------------------------------------------------------------
function Zags_Otchet_FIO : String;
begin
  if IDPROG()='ZAGS' then begin
    Result:=ParamAsString('РУК_ЗАГС')
  end else begin
    if ParamAsBoolean('PR_SPEC_SPRAV')
      then Result:=ParamAsString('СПЕЦ_ЗАГС')
      else Result:=ParamAsString('РУК_ЗАГС');
  end;
end;
//-----------------------------------
function CreateKolonN(nType:Integer):String;
begin
  Result:='';
  if ParamAsBoolean('ADD_KOLON_N') then begin
    Result:=FIOSpecEx(nType)+' '+ParamAsString('SPEC_TEL');
  end;
end;
//-----------------------------------
function CreateKolonNPismo(nType:Integer):String;
begin
  Result:='';
  if ParamAsBoolean('P_ADD_KOLON_N') then begin
    Result:=FIOSpecEx(nType)+' '+ParamAsString('SPEC_TEL');
  end;
end;
//-----------------------------------
function CreateKolonNIzv(nType:Integer):String;
begin
  Result:='';
  if ParamAsBoolean('I_ADD_KOLON_N') then begin
    Result:=FIOSpecEx(nType)+' '+ParamAsString('SPEC_TEL');
  end;
end;


//------------------------------------------------------------------------------
function FU( s : String) : String;
begin
  if (s<>'')
    then Result := ANSIUpperCase(Copy(s,1,1))+Copy(s,2,Length(s)-1)
    else Result:=s;
end;
//------------------------------------------------------------------------------
{
function FirstUpper( s : String) : String;
var
  i : Integer;
  s1,s2 : String;
begin
  i := Pos('-',s);
  if (Pos('-',s)=0) and (Pos(' ',s)=0) and (Pos(',',s)=0) then begin
    Result := ANSIUpperCase(Copy(s,1,1))+ANSILowerCase(Copy(s,2,Length(s)-1));
  end else begin
    Result := s;
//    s1 := Copy(s,1,i-1);
//    s2 := Copy(s,i+1,200);
//    Result := ANSIUpperCase(Copy(s1,1,1))+ANSILowerCase(Copy(s1,2,Length(s1)-1))+'-'+
//              ANSIUpperCase(Copy(s2,1,1))+ANSILowerCase(Copy(s2,2,Length(s2)-1));
  end;
end;
}
//------------------------------------------------------------------------------
function GetNameAsPol(sName:String;sPol:String):String;
var
  s,sType:String;
begin
  sType:='';
  if Length(sPol)>1 then begin // !!!
    sType:=Copy(sPol,2,1);
    sPol:=Copy(sPol,1,1);
  end;
  Result:=Trim(sName);
  s:=ANSILowerCase(Result);
  if s='родившегося' then begin
    if sPol='Ж'  then Result:='родившейся' else if sPol='' then Result:=s+'(ейся)';
    if (sPol='Ж') and (sType='+') then Result:='родившуюся';
  end else if s='родился' then begin
    if sPol='Ж'  then Result:='родилась'; // else if sPol='' then Result:=s+'(асьейся)';
  end else if s='проживающего' then begin
    if sPol='Ж' then Result:='проживающей' else if sPol='' then Result:=s+'(ей)';
    if (sType='2') and (sPol='М') then Result:='проживающему';
  end else if s='разведен' then begin
    if sPol='Ж' then Result:='разведена' else if sPol='' then Result:=s+'(а)';
  end else if s='гражданином' then begin
    if sPol='Ж' then Result:='гражданкой' else if sPol='' then Result:=s+'(кой)';
  end else if s='проживал' then begin
    if sPol='Ж' then Result:=s+'а' else if sPol='' then Result:=s+'(а)';
  end else if s='заявителя' then begin
    if sPol='Ж' then Result:='заявительницы' else if sPol='' then Result:=s+'(ницы)';
  end else if s='гражданина' then begin
    if sPol='Ж' then Result:='гражданки' else if sPol='' then Result:=s+'(ки)';
  end else if s='иностранного гражданина' then begin
    if sPol='Ж' then Result:='иностранной гражданки' else if sPol='' then Result:=s+'(ки)';
  end else if s='гражданину' then begin
    if sPol='Ж' then Result:='гражданке' else if sPol='' then Result:=s+'(ке)';
  end else if s='он' then begin
    if sPol='Ж' then Result:='она' else if sPol='' then Result:='он(а)';
  end else if s='зарегистрирован' then begin
    if sType='2' then begin
      if sPol='М' then Result:=s+'ному' else Result:=s+'ной';
    end else begin
      if sPol='Ж' then Result:=s+'а' else if sPol='' then Result:=s+'(а)';
    end;
  end else if s='уроженец' then begin
    if sPol='Ж' then Result:='уроженка' else if sPol='' then Result:=s+'(ка)';
  end else if s='умершего' then begin
    if sPol='Ж' then Result:='умершей' else if sPol='' then Result:=s+'(ки)';
    if (sPol='Ж') and (sType='+') then Result:='умершую' else if sPol='' then Result:=s+'(ую)';
  end else if s='снят' then begin
    if sPol='Ж' then Result:='снята' else if sPol='' then Result:=s+'(а)';
  end else if s='вернулся' then begin
    if sPol='Ж' then Result:='вернулась' else if sPol='' then Result:=s+'(а)';
  end else if s='ему' then begin
    if sPol='Ж' then Result:='ей' else if sPol='' then Result:=s+'(ей)';
  end else if s='убыл' then begin
    if sPol='Ж' then Result:=s+'а' else if sPol='' then Result:=s+'(а)';
  end;
end;

//------------------------------------------------------------------------------
function GetAdresat(strNamePar:String):String;
begin
  if Copy(strNamePar,1,1)='$' then begin
    Result:=getResource(Copy(strNamePar,2,Length(strNamePar)),0);
  end else begin
    if Copy(strNamePar,1,1)='&'
      then Result:=Copy(strNamePar,2,Length(strNamePar))
      else Result:=Trim(GlobalTask.ParamAsString(strNamePar));
  end;
  if (RIGHT(strNamePar,2)='_B') and (Result='')  then begin 
    Result:=GlobalTask.ParamAsString(Copy(strNamePar,1,Length(strNamePar)-2));
  end;
  if DokZAGS.Fld('ARX_ADRESAT')<>nil then begin
    if DokZAGS.Fld('ARX_ADRESAT').AsString<>''
      then Result:=DokZAGS.Fld('ARX_ADRESAT').AsString;
  end;

end;
//------------------------------------------------------------------------------
function GetAdresat2(strNamePar:String;strField:String;lObr:Boolean;sAdd:String):String;
begin
  Result:=GetAdresat(strNamePar);
  if strField<>'' then begin
    if DokZAGS.Fld(strField).AsString<>'' then begin
      if lObr  // в обратном порядке
        then Result:=sAdd+DokZAGS.Fld(strField).AsString+Chr(13)+Chr(10)+Result
        else Result:=Result+Chr(13)+Chr(10)+sAdd+DokZAGS.Fld(strField).AsString;
    end;
  end;
end;

//------------------------------------------------------------------------------
function NationForSprav(sKod:String; sField:String; lAddStr:String):String;
var
  l19:Boolean;
begin
  l19:=true;
  if Copy(sField,1,1)='-' then  begin
    sField:=Copy(sField,2,Length(sField));
    l19:=false;
  end;
  if (Trim(sKod)='') or (sKod='0') then begin 
    Result:='';
  end else if sKod='190' then begin
    if l19 then  Result:='сведения о национальности не представлены' else Result:='';
  end else if sKod='192' then begin
    if l19 then  Result:='сведения о национальности отсутствуют' else Result:='';
  end else begin
    Result:=SeekValueSpr('СпрНациональностей','ID',sKod,sField);
  end;
  if Result<>'' then Result:=lAddStr+Result;
end;
//------------------------------------------------------------------------------
function NationForSprav2(sKod:String; sField:String):String;
begin  Result:=NationForSprav(sKod,sField,', ');  end;

//------------------------------------------------------------------------------
function GetNameAsPolBel(sName:String;sPol:String):String;
var
  s:String;
begin
  Result:=Trim(sName);
  s:=ANSILowerCase(Result);
  if s='нарадзіўся' then begin
    if sPol='Ж'  then Result:='нарадзілася' else if sPol='' then Result:=s+'(лася)';
  end else if s='які' then begin
    if sPol='Ж'  then Result:='якая'; // else if sPol='' then Result:=s+'(асьейся)';
  end else if s='які нарадзіўся' then begin
    if sPol='Ж'  then Result:='якая нарадзілася'; // else if sPol='' then Result:=s+'(асьейся)';
  end else if s='які памёр' then begin
    if sPol='Ж'  then Result:='якая памерла'; // else if sPol='' then Result:=s+'(асьейся)';
  end else if s='заяўніка' then begin
    if sPol='Ж'  then Result:='заяўніцы' else if sPol='' then Result:=s+'(цы)';
  end else if s='грамадзяніна' then begin
    if sPol='Ж'  then Result:='грамадзянкі';
  end;
end;

//------------------------------------------------------------------------------
function NationForSprav_Bel(sKod:String; sField:String; lAddStr:String):String;
var
  l19:Boolean;
begin
  l19:=true;
  if Copy(sField,1,1)='-' then  begin
    sField:=Copy(sField,2,Length(sField));
    l19:=false;
  end;
  if (Trim(sKod)='') or (sKod='0') then begin 
    Result:='';
  end else if sKod='190' then begin
    if l19 then  Result:='звесткі пра нацыянальнасць не прадстаўлены' else Result:='';
  end else if sKod='192' then begin
    if l19 then  Result:='звесткі пра нацыянальнасць адсутнічаюць' else Result:='';
  end else begin
    Result:=SeekValueSpr('СпрНациональностей','ID',sKod,sField);
  end;
  if Result<>'' then Result:=lAddStr+Result;
end;
function NationForSprav2_Bel(sKod:String; sField:String):String;
begin Result:=NationForSprav_Bel(sKod, sField, ', '); end;

//----------------------------------------------------------
function GetBrakRast(ds:TDataSet;s1:String;s2:string;s3:String):String;
begin
  Result:='';
  if ds.Fld('TYPE_RAST').AsInteger>0 then begin // ds.Fld('BRAK_RAST').AsBoolean then begin
    if s1='#' then begin
      Result:='Брак между указанными лицами';
    end else begin
      if (s1<>'') and (s2<>'')
        then Result:='Брак между '+s1+' и '+s2
        else Result:='Брак';
    end;
    if s3='' then s3:='супруга';
    if ds.Fld('TYPE_RAST').AsInteger=2 then begin
      Result := Result + ' расторгнут на основании решения суда '+ds.Fld('SUDNAME').AsString+
               ' о расторжении брака от '+DatePropis(ds.Fld('SUDRESH').AsDateTime,TYPE_DATE_SPRAV)+
               ', вступившего в законную силу '+DatePropis(ds.Fld('SUDSILA').AsDateTime,TYPE_DATE_SPRAV);
    end else if ds.Fld('TYPE_RAST').AsInteger=4 then begin
      Result := Result + ' признан недействительным на основании решения суда '+ds.Fld('SUDNAME').AsString+
               ' от '+DatePropis(ds.Fld('SUDRESH').AsDateTime,TYPE_DATE_SPRAV)+
               ', вступившего в законную силу '+DatePropis(ds.Fld('SUDSILA').AsDateTime,TYPE_DATE_SPRAV);
    end else if ds.Fld('TYPE_RAST').AsInteger=3 then begin
      Result:=Result+' расторгнут на основании записи акта о расторжении брака № '+ds.Fld('R_NOMER').AsString+', совершенной '+
         DatePropis(ds.Fld('R_DATE').AsDateTime,TYPE_DATE_SPRAV)+' в '+ds.Fld('R_ZAGS').AsString+'.';
    end else if ds.Fld('TYPE_RAST').AsInteger=1 then begin
      Result:=Result+' прекращен в связи со смертью '+s3+', запись акта о смерти № '+
         ds.Fld('S_NOMER').AsString+' совершена '+DatePropis(ds.Fld('S_DATE').AsDateTime,TYPE_DATE_SPRAV)+
         ' в '+ds.Fld('S_ZAGS').AsString+'.';
    end;
  end;
end;
//----------------------------------------------------------
function GetBrakRast_Bel(ds:TDataSet;s1:String;s2:string;s3:String):String;
var
  fld:TField;
begin
  Result:='';
  if ds.Fld('TYPE_RAST').AsInteger>0 then begin // ds.Fld('BRAK_RAST').AsBoolean then begin
    if s1='#' then begin
      Result:='Шлюб паміж адзначанымі асобамі';
    end else begin
      if (s1<>'') and (s2<>'')
        then Result:='Шлюб паміж '+s1+' і '+s2
        else Result:='Шлюб';
    end;
    fld:=ds.Fld('SUDNAME_B');
    if fld=nil then  fld:=ds.Fld('SUDNAME');
    if ds.Fld('TYPE_RAST').AsInteger=2 then begin
      Result := Result + ' скасаваны на падставе: рашэння суда '+fld.AsString+
               ' аб скасаванні шлюбу ад '+DatePropisBel(ds.Fld('SUDRESH').AsDateTime,TYPE_DATE_SPRAV)+
               ', якое ўступіла ў законную сілу '+DatePropisBel(ds.Fld('SUDSILA').AsDateTime,TYPE_DATE_SPRAV);
    end else if ds.Fld('TYPE_RAST').AsInteger=4 then begin
      Result := Result + ' прызнаны несапраўдным на падставе рашэння суда '+fld.AsString+
               ' ад '+DatePropisBel(ds.Fld('SUDRESH').AsDateTime,TYPE_DATE_SPRAV)+
               ', якое ўступіла ў законную сілу '+DatePropisBel(ds.Fld('SUDSILA').AsDateTime,TYPE_DATE_SPRAV);
    end else if ds.Fld('TYPE_RAST').AsInteger=3 then begin
      fld:=ds.Fld('R_ZAGS_B');
      if fld=nil then  fld:=ds.Fld('R_ZAGS');
      Result:=Result+' скасаваны на падставе: запісу акта аб скасаванні шлюбу № '+ds.Fld('R_NOMER').AsString+', здзейсненага '+
              DatePropisBel(ds.Fld('R_DATE').AsDateTime,TYPE_DATE_SPRAV)+' у '+fld.AsString+'.';
    end else if ds.Fld('TYPE_RAST').AsInteger=1 then begin
      fld:=ds.Fld('S_ZAGS_B');
      if fld=nil then  fld:=ds.Fld('S_ZAGS');
      Result:=Result+' спынены ў сувязі са смерцю '+s3+', запіс акта аб смерці № '+
         ds.Fld('S_NOMER').AsString+' здзейснены '+DatePropisBel(ds.Fld('S_DATE').AsDateTime,TYPE_DATE_SPRAV)+
         ' у '+fld.AsString+'.';
    end;
  end;
end;

//------------------------------------------------------------------------------
function addWordKv(adr:TAdresLic):String;
begin
  Result:='';
end;
//------------------------------------------------------------------------------
function CheckOwners(adr:TAdresLic; var s:String; var strSobstv:String; var strNanim:String):String;
var
  slOwners:TStringList;
  n:Integer;
begin
  slOwners:=TStringList.Create;
  strSobstv:=adr.GetOwners(slOwners,1);
  Result:='Нанимателем';
  if slOwners.Count>0 then begin
    n:=adr.OwnersType;
    if n=1 then begin        // собственники только частные лица
      if slOwners.Count>1 
        then Result:='Собственниками'
        else Result:='Собственником';
      if s<>'' then begin
        if s='является' then begin
          if slOwners.Count>1 then  s:='являются';
        end else if s='гражданином' then begin
          if slOwners.Count>1 then  s:='гражданами';
        end;
      end;
    end else begin          // в числе собственников есть организация
      strSobstv:=strNanim;
    end;
  end else begin
    strSobstv:=strNanim;
  end;
  slOwners.Free;
end;

//------------------------------------------------------------------------------
function GetTypeHouse(lOwnHouse:Boolean; sTypeHouse:String; sTypeDef:String):String;
begin
  Result:='';
  if (sTypeDef='') or (IdProg()='GKH') then begin
    Result := SeekValueSpr('СпрТипЖилья','ID',sTypeHouse,'NAME');
  end else begin
    if lOwnHouse then begin
      Result := sTypeDef;
    end else begin
      Result := SeekValueSpr('СпрТипЖилья','ID',sTypeHouse,'NAME');
    end;
  end;
end;

//------------------------------------------------------------------------------
function GetPredst(sPredst:String; sTypeDef:String; strFieldName:String):String;
begin
  if sPredst='' then begin
    Result:=sTypeDef;
  end else begin
    if strFieldName='' then strFieldName:='NAME';
    Result:=SeekValueSpr('SprPredst','ID',sPredst,strFieldName);
  end;
end;

//------------------------------------------------------------------------------
// вернуть преобразованное отношение между членами лицевого счета
function GetOtnoshMen(nID:Integer;sOtnosh:String;m:TMens;lIdInternal:Boolean):String;
var
  nIDMen:Integer;
begin
  if lIdInternal then nIDMen:=m.Fld('ID_INTERNAL').AsInteger else m.Fld('ID').AsInteger;
  if lCheckOtnosh then begin
    Result:=GetOtnosh(nID,sOtnosh,nIDMen,m.Fld('OTNOSH').AsString,m.Fld('POL').AsString);
  end else begin
    if ( (m.Fld('OTNOSH').AsString='') or (nID=nIDMen) ) 
      then Result:=''
      else Result := SeekValueSpr('СпрОтношений','ID',m.Fld('OTNOSH').AsString,'NAME');
  end;
end;

//----------------------------------------------------------
function SpecGrafToStr(m:TMens;nType:Integer;nTypeDate:Integer):String;
var
  s:String;
begin
 // смотри KEY_PRIM_SPR из файла KeyList.ini
//  ParamAsInteger('SSS2_TYPE')
  if (nType=2) or (nType=4) then begin
    Result:=m.getWork;
  end else if nType=3 then begin
    Result:=DatePropis(m.Fld('DATEP').AsDateTime,nTypeDate);
  end else if nType=5 then begin
    Result:=m.GetLgoti;
  end else if nType=6 then begin   // паспорт + место рожд.
    Result:=m.PasportToStr(0)+', '+m.MestoRogd(true,0);
  end else if nType=7 then begin   // паспорт
    Result:=m.PasportToStr(0);
  end else if nType=8 then begin   // паспорт+ном.идент.
    Result:=m.PasportToStr(0);
    s:=Trim(m.Fld('LICH_NOMER').AsString);
    if s<>'' 
      then Result:=Result+', '+s+', ';
  end;
  if nType=4 then begin
    s := m.getDolg;
    if s<>'' then  Result:= Result+', '+s;
  end;
end;

//---------------------------------------------------------------
// есть такая же функция в программе unit: 
//---------------------------------------------------------------
{ !!! OLD !!!
function AddMenToSprav(m : TMens; nID : Integer) : Boolean;
begin
  if (m.Fld('ID_INTERNAL').AsInteger<>nID) and        // пропускаем хозяина справки
     (m.Fld('PROPIS').AsBoolean=true) and             // вкл. только прописанных
     ( (m.Fld('PRESENT').AsBoolean=true) or GlobalTask.ParamAsBoolean('SP_PRESENT') ) and
     (m.Fld('CANDELETE').AsBoolean=false) then begin 
    Result:=true;
  end else begin
    Result:=false;
  end;
end;
}
function AddMenToSprav(m : TMens; nID : Integer) : Boolean;
var
  sMens:String;
begin
  sMens:=GetBookmarkMen;      // отмеченные в гриде люди
  if sMens<>'' then begin
    if (m.Fld('ID_INTERNAL').AsInteger<>nID) and        // пропускаем хозяина справки
       (Pos(m.Fld('ID_INTERNAL').AsString+';',sMens)> 0)
      then Result:=true
      else Result:=false;
  end else begin
    if (m.Fld('ID_INTERNAL').AsInteger<>nID) and        // пропускаем хозяина справки 
       (m.Fld('PROPIS').AsBoolean=true) and             // 
       ( (m.Fld('PRESENT').AsBoolean=true) or GlobalTask.ParamAsBoolean('SP_PRESENT') ) and
       (m.Fld('CANDELETE').AsBoolean=false) then begin
      Result:=true;
    end else begin
      Result:=false;
    end;
  end;
end;
//---------------------------------------------------------------
function WritePodpis(ds:TDataset; vType:Variant):Integer;
var
  n:Integer;
begin
  // vType ID или KOD отчета
  n:=Podpis_Init(vType);
  if n>0 then begin
    ds.Fld('DOLG_PODP1').AsString:=podpis_dolg(1);
    ds.Fld('FIO_PODP1').AsString:=podpis_fio(1);
    if n>1 then begin
      ds.Fld('DOLG_PODP2').AsString:=podpis_dolg(2);
      ds.Fld('FIO_PODP2').AsString:=podpis_fio(2);
    end;
    if n>2 then begin
      ds.Fld('DOLG_PODP3').AsString:=podpis_dolg(3);
      ds.Fld('FIO_PODP3').AsString:=podpis_fio(3);
    end;
    if podpis_shtamp()>-1 then 
      CreateWorkShtamp(podpis_shtamp());  //SHAMP_  SHAMP_GERB
  end;

  Result:=n;
end;
//---------------------------------------------------------------
// дополнительное наименование к должности первого или последнего долж. лица
procedure AddDolgPodpis(ds:TDataset; sAdd:String; lLast:Boolean);
var
  n:Integer;
  arr:array[1..3] of string;
  s:String;
begin
  s:='DOLG_PODP';
  if lLast then begin
    arr[1]:=s+'3'; arr[2]:=s+'2'; arr[3]:=s+'1';
  end else begin
    arr[1]:=s+'1'; arr[2]:=s+'2'; arr[3]:=s+'3';
  end;
  for n:=1 to 3 do begin
    if ds.Fld(arr[n]).AsString<>'' then begin
      ds.Fld(arr[n]).AsString:=sAdd+ds.Fld(arr[n]).AsString;
      break;
    end;
  end;
end;

//-------------------------------------------------------
function GetSrokDv(nType:Integer):String;    // 
begin
  Result:=ParamAsString('SROKDV');
  if Result='' then Result:='шести месяцев';
end;
//-------------------------------------------------------
// срок действия справки   
function GetSrokDvEx(nType:Integer):String;
begin
  if nType=1 then begin
    Result:=ParamAsString('SROKDV_BEL');  //  аднаго года
    if Result='' then Result:='шасці месяцаў';
  end else begin
    Result:=ParamAsString('SROKDV');
    if Result='' then Result:='шести месяцев';
  end;
end;              
//------------------------------
procedure SetSrokDv(ds:TDataSet;nType:Integer);
begin  if ds.Fld('SROKDV')<>nil then ds.Fld('SROKDV').AsString:=GetSrokDvEx(nType);  end;
//------------------------------
procedure CreateTitle(ds:TDataSet; nType:Integer; nPril:Integer; lName:Boolean);
begin
  ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',nPril);
  ds.Fld('SHTAMP').AsString := GetShtampSprEx(nType);
  ds.Fld('KOLON_N').AsString:=CreateKolonN(nType);
  SetSrokDv(ds,nType); // !!!
  if lName then begin
    if GlobalTask.ParamAsString('ARXIV')='1' then begin
      ds.Fld('NAME_SPR').AsString :=getResource('ARX1',nType)+'   ';  // АРХИВНАЯ  strRes.ini
      ds.Fld('NAME_ORG').AsString :='';
    end else begin
      ds.Fld('NAME_SPR').AsString :='';
      ds.Fld('NAME_ORG').AsString :=getResource('ARX2',nType)+' '; // архива
    end;
  end;
end;

//-------------------------------------------------------
function RoundBYR( e : Extended ) : Extended;
var
  s,s1    : String;
  lSeek5  : Boolean;
  j : Integer;
begin
  lSeek5 := false;
  s := FloatToStr(e);
  j := Pos('.',s);
  if j > 0 then begin
    s1 := Copy(s,j+1,100);
    if StrToFloat(s1) = 0 then begin
      s := Copy(s,1,j-1);
      lSeek5 := true;
    end;
  end else begin
    lSeek5 := true;
  end;
  if lSeek5 then begin
    s1 := Copy(s,Length(s),1);
    if s1='5' then begin  // целое число оканчивающееся на 5
      Result := StrToFloat(Copy(s,1,Length(s)-1)+'0');
    end else begin
      Result := xRound(e,-1);
    end;
  end else begin
    Result := xRound(e,-1);
  end;
end;
//--------------------------------------------------------------
procedure PrintShtamp1(sl : TStringList; strAddText : String);
var
   tb : TDataSet;
   pr : TPrintTable;
begin
  tb := dbCreateMemTable('S1,Memo;S2,Memo;','');
  tb.Open;
  tb.Append;
  tb.Fld('S1').AsString := StringReplace(GetShtampSpr(),Chr(13)+Chr(10),'\par ');
  tb.Fld('S2').AsString := strAddText;;
  tb.Post;
  pr := CreatePrintTable(sl,tb);
  pr.SetPrintHead(false);
  pr.SetHeadWidth(0,'', 320);
  pr.SetHeadWidth(1,'', 300);
  pr.SetTableFont(0,12);
  pr.SetColFont(1,0,10);
//      pr.SetBorder(-1, 'ltrb');
  pr.SetAlign(0, 't', 'l');
  pr.SetAlign(1, 't', 'r');
  pr.Print;
  FreePrintTable(pr);
  tb.Free;
end;

function OborudDoma : String;
begin
  result := 'эл.освещением, ';
  if LicSchet.Fld('VODOPROV').AsBoolean  then result:=result+'водопроводом, ';
  if LicSchet.Fld('KANALIZ').AsBoolean   then result:=result+'канализацией, ';
  if LicSchet.Fld('CENT_OTOP').AsBoolean then result:=result+'центр. отоплением, ';
  if LicSchet.Fld('GOR_VODA').AsBoolean  then result:=result+'горячим водоснабжением, ';
  if LicSchet.Fld('GAZ').AsBoolean       then result:=result+'газом (сетевой), ';
  if LicSchet.Fld('EL_PLIT').AsBoolean   then result:=result+'напольной электоплитой, ';
  result := Trim(result);
  result := Copy(result,1,Length(result)-1);
end;
function OborudDomaAdr(adr:TAdresLic) : String;
begin
  result := 'эл.освещением, ';
  if adr.Fld('VODOPROV').AsBoolean  then result:=result+'водопроводом, ';
  if adr.Fld('KANALIZ').AsBoolean   then result:=result+'канализацией, ';
  if adr.Fld('CENT_OTOP').AsBoolean then result:=result+'центр. отоплением, ';
  if adr.Fld('GOR_VODA').AsBoolean  then result:=result+'горячим водоснабжением, ';
  if adr.Fld('GAZ').AsBoolean       then result:=result+'газом (сетевой), ';
  if adr.Fld('EL_PLIT').AsBoolean   then result:=result+'напольной электоплитой, ';
  result := Trim(result);
  result := Copy(result,1,Length(result)-1);
end;

//------------------------------------------------
function getStrPropis2(lOtsut:Boolean;lTmpPr:Boolean) : String;
begin
//  lOtsut включать временно отсут.
//  lTmpPr включать проживающих без регистрации
  if lOtsut and lTmpPr then begin                // включаем всех имеющих адрес на территории
    Result:='';   
  end else if lOtsut and not lTmpPr then begin   // все прописанные
    Result:='n.propis=true';
  end else if not lOtsut and lTmpPr then begin   // все присутствующие
    Result:='n.present=true';
  end else if not lOtsut and not lTmpPr then begin  // только прописанные и присутствующие
    Result:='n.propis=true and n.present=true';
  end;
  if Result='' then Result:='n.candelete=false'
               else Result:='(n.candelete=false and '+Result+')';  // исключим умерших и уехавших постоянно
//  writedebug('--->'+result);
end;
//-----------------------------------
function getStrPropis : String;
begin
  Result:=getStrPropis2(GlobalTask.ParamAsBoolean('OTSUT_VIBOR'),GlobalTask.ParamAsBoolean('TMPPR_VIBOR'));
end;
//----------------------------------------------------------------
// приглашение на прием    ОЧЕРЕДЬ
function PriglashPriem(DateFiks: TDateTime; LicID, PID: Word):Boolean;
var
  f : TfmParamQuest;
  n,i,nCount:Integer;
  d:TDateTime;
  tb,q:TDataSet;
  PAR1,s,sName,sNameOtd,sKuda,sVopros:String;
  lFilter:Boolean;
begin
//  dsOch:=dbGetDataSet('dmBase.tbOchered');
//  dsOchResh:=dbGetDataSet('dmBase.tbOcheredResh');
  PAR1:=GetTemplateParam('PAR1');
  result:=false;

  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите параметры';
  s:=Trim(GlobalTask.GetLastValueAsString('OCH_PRIG_NAME'));
  f.AddParamEx(s, 'Название приглашения' , 'NAME','TYPE=STRING~WIDTH=500');  //1
  f.AddParamEx(Now, 'Дата формирования' , 'DATEP' ,'TYPE=DATE');             //2
  n:=GlobalTask.GetLastValueAsInteger('OCH_PRIG_NOMER');
  f.AddParamEx(n+1, 'Номер' , 'NOMER', 'TYPE=NUMERIC');                      //3
  s:=Trim(GlobalTask.GetLastValueAsString('OCH_PRIG_OTD'));                  
  f.AddParamEx(s, 'Отдел' , 'NAME_OTD','TYPE=STRING~WIDTH=500');             //4
  s:=Trim(GlobalTask.GetLastValueAsString('OCH_PRIG_KUDA'));                 
  f.AddParamEx(s, 'Когда, куда, время' , 'KUDA','TYPE=STRING~WIDTH=500');    //5
  s:=Trim(GlobalTask.GetLastValueAsString('OCH_PRIG_VOPROS'));               
  f.AddParamEx(s, 'Вопрос' , 'VOPROS','TYPE=STRING~WIDTH=500');              //6
  if PAR1='1'
    then f.AddParamEx(3, 'Количество на странице (1-5)' , 'MAX','MIN=1~MAX=5~WIDTH=50');

  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    sName:=f.GetValue('NAME','S');
    d  := f.GetValue('DATEP','D');
    n  := f.GetValue('NOMER','I');
    sNameOtd:=f.GetValue('NAME_OTD','S');
    sKuda:=f.GetValue('KUDA','S');
    sVopros:=f.GetValue('VOPROS','S');
    if PAR1='1' then nCount:=f.GetValue('MAX','N')  else nCount:=1;

    GlobalTask.SetLastValueAsString('OCH_PRIG_NAME',sName);
    GlobalTask.SetLastValueAsInteger('OCH_PRIG_NOMER',n);
    GlobalTask.SetLastValueAsString('OCH_PRIG_OTD',sNameOtd);
    GlobalTask.SetLastValueAsString('OCH_PRIG_KUDA',sKuda);
    GlobalTask.SetLastValueAsString('OCH_PRIG_VOPROS',sVopros);
    f.Free;
    tb:=GetTemplateDataSet('TABLSOST');
    i:=1;
 //'TABLSOST=SHTAMP,FIOP,MESTOJ,DATEP,NOMER,NAME,NAME_OTD,KUDA,VOPROS'
    if PAR1='2' then begin
      tb.Append;
      tb.Fld('SHTAMP').AsString:=GetShtampSpr();
      tb.Fld('FIOP').AsString:=Men.FIO;
      tb.Fld('MESTOJ').AsString:=Men.Adres.GetAdres2(false,false,''); //Men.Adres.GetAdres()+', '+Raion_Name('')+', '+Obl_Name('') ;                                           
//      tb.Fld('MESTOJ').AsString:=dmBase.AdresMen(q.Fld('id').AsString,'');
      tb.Fld('DATEP').AsString:=DatePropis(d,3);
      tb.Fld('NOMER').AsString:='  '+IntToStr(n)+'  ';
      tb.Fld('NAME').AsString:=sName;
      tb.Fld('NAME_OTD').AsString:=sNameOtd;
      tb.Fld('KUDA').AsString:=sKuda;
      tb.Fld('VOPROS').AsString:=sVopros;
      WritePodpis(tb,'PriglashPriem');
      result:=true;
    end else begin
      q:=dbGetDataSet('fmGurnOchered.Query');
      q.First;
      lFilter:=BookmarkCurGurnalToFilter('ID');   // !!! устанавливаем фильтр по отмеченным записям
      OpenMessage(' Формирование  ... ','',10);

      while not q.Eof do begin
        tb.Append;
        tb.Fld('SHTAMP').AsString:=GetShtampSpr();
        tb.Fld('FIOP').AsString:=CreateFIO(q);
        tb.Fld('MESTOJ').AsString:=dmBase.AdresMen(q.Fld('id').AsString,'');
        tb.Fld('DATEP').AsString:=DatePropis(d,3);
        tb.Fld('NOMER').AsString:='  '+IntToStr(n)+'  ';
        tb.Fld('NAME').AsString:=sName;
        tb.Fld('NAME_OTD').AsString:=sNameOtd;
        tb.Fld('KUDA').AsString:=sKuda;
        tb.Fld('VOPROS').AsString:=sVopros;
        WritePodpis(tb,'PriglashPriem');

  //      tb.Fld('DOLG_PODP1').AsString:=Ochered_Dolg;
  //      tb.Fld('FIO_PODP1').AsString:=Ochered_FIO;
        n:=n+1;
        if i=nCount then begin
          tb.Fld('PPP').AsString:='\page';
          i:=1;
        end else begin 
          tb.Fld('PPP').AsString:='';
          i:=i+1;
        end;
        tb.Post;
        q.Next;
      end;
      CloseMessage;
      if lFilter then begin 
        q.Filter:='';
        q.Filtered:=false;
      end;
      q.First;
    end;
    if dbRecordCount(tb)>0 then  Result:=true;
  end else begin
    f.Free;
  end;
end;
//----------------------------------------------------------------
// приглашение на выборы
function PriglashVibor(DateFiks: TDateTime; LicID, PID: Word):Boolean;
var
  f : TfmParamQuest;
  s,sRusGr,sSort,strDate,ss,sAdr,sAdr2,strSQL,strNameUch:String;
  sNameV,sTimeV,sAdresV,sDosr,sFIO:String;
  n,nUch,ns,nIDUch,i:Integer;
  nYear,nMonth,nDay,nCount : Word;
  d,d1:TDateTime;
  SprUch,tb,q:TDataSet;
  lCheckAddAdres,lAdres,lAdresFromLic,lFIO:Boolean;
//FIO,DATEV,NAMEV,FIO,TIMEV,ADRES,DOSR
begin
  Result:=false;
  lAdresFromLic:=false;         //     !!!
  // включать граждан россии в списки
  if GlobalTask.ParamAsBoolean('RUSGR_VIBOR') then begin
    sRusGr:='n.citizen=643 or';
  end else begin
    sRusGr:='';
  end;
  SprUch := dbGetDataSet('dmBase.SprIzbUch') ;
  SprUch.First;
  if not SprUch.Eof then begin
    n := SprUch.Fld('NOMER').AsInteger;
  end else begin
    PutError(' Заполните справочник избирательных участков ! ');
    exit;
  end;
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите параметры';
//  f.StepY:=17;
//  f.Flat:=false;
  s:=GlobalTask.GetLastValueAsString('FIO_VIBOR');
  if (s='') or (s='1') then lFIO:=true else lFIO:=false;
  f.AddParamEx(GlobalTask.ParamAsDate('DATE_VIBOR'), 'Дата выборов' , 'DATEVZ' ,'TYPE=DATE');
  f.AddParamEx(n      , 'Избирательный участок' , 'IZBUCH','WIDTH=50');
  s:=Trim(GlobalTask.GetLastValueAsString('NAME_VIBOR'));
  if s='' then s:='выбары дэпутатаў мясцовых Саветаў';
  f.AddParamEx(s, 'Название выборов' , 'NAMEV','TYPE=STRING~WIDTH=500');
  s:=Trim(GlobalTask.GetLastValueAsString('TIME_VIBOR'));
  if s='' then s:='з 8 да 20 гадзiн';
  f.AddParamEx(s, 'Время выборов' , 'TIME_VIBOR','TYPE=STRING~WIDTH=500');
//  f.AddParamEx(1, 'Формат' , 'FORMAT','TYPE=LIST~DESC=KEY_FORMAT_SPIS~WIDTH=100');
//  f.AddParamEx(false, 'ФИО в одну сроку' , 'FIO_ONE','');
  f.AddParamEx(GlobalTask.GetLastValueAsString('ADRES_UCH_VIBOR'), 'Адрест участка' , 'ADRESV','TYPE=STRING~WIDTH=500');
  s:=Trim(GlobalTask.GetLastValueAsString('DOSR_VIBOR'));
  if s='' then s:='датэрмiнова з 18 па 22 сакавiка бягучага года ўключна з 10 да 14 гадзiн i з 16 да 19 гадзiн у памяшканнi ўчастковай выбарчай камiсii';
  f.AddParamEx(s, 'Время досрочных выборов' , 'TIME_DOSR','TYPE=STRING~WIDTH=500');
  f.AddParamEx(1, 'Тип сортировки' , 'SORT','TYPE=LIST~DESC=KEY_SORTIZB~WIDTH=300');
  f.AddParamEx(3, 'Количество на странице (1-3)' , 'MAX','MIN=1~MAX=3~WIDTH=50');
  f.AddParamEx(lFIO, 'Печатать ФИО ' , 'FIO','');
  f.AddParamEx(false, 'Печатать адрес жительства' , 'ADRES','');
  f.AddParamEx(true, 'Проверять адрес жит. для выборов' , 'ADRESG','');
  f.AddParamEx('', 'Часть фамилии' , 'TAIL','WIDTH=50');

  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  try
  if n = 1 then begin
    lFIO:=f.GetValue('FIO','L');
    lAdres:=f.GetValue('ADRES','L');
    lCheckAddAdres:=f.GetValue('ADRESG','L');
    lAdresFromLic:=false;         //     !!!
    ns := f.GetValue('SORT','I');
    d  := f.GetValue('DATEVZ','D');
    sNameV:=f.GetValue('NAMEV','S');
    sTimeV:=f.GetValue('TIME_VIBOR','S');
    sAdresV:=f.GetValue('ADRESV','S');
    sDosr:=f.GetValue('TIME_DOSR','S');
    nCount:=f.GetValue('MAX','N');
    sFIO:=Trim(f.GetValue('TAIL','S'));
    if sFIO<>'' then sFIO:=' and familia like '+QStr(sFIO+'%');
    GlobalTask.SetLastValueAsDate('DATE_VIBOR', d);
    GlobalTask.SetLastValueAsString('NAME_VIBOR',sNameV);
    GlobalTask.SetLastValueAsString('TIME_VIBOR',sTimeV);
    GlobalTask.SetLastValueAsString('ADRES_UCH_VIBOR',sAdresV);
    GlobalTask.SetLastValueAsString('DOSR_VIBOR',sDosr);
    GlobalTask.SetLastValueAsBoolean('FIO_VIBOR',lFIO);
    if Length(sNameV)<45 then sNameV:=sNameV+chr(13);
    DecodeDate(d,nYear,nMonth,nDay);
    nYear := nYear-18;
    nUch := f.GetValue('IZBUCH','N');
    f.Free;
    d1 := EncodeDate(nYear,nMonth,nDay);
    strDate := DateToSQL(d);
    if not dbLocate(SprUch,'NOMER',[nUch],'') then begin
      PutError(' Не выбран избирательный участок !');
    end else begin
      if ParamAsInteger('CH_ADRES')=0 
        then sSort:='d.punkt'
        else sSort:='s.nomer';
      //---- определим сортировать или нет нас. пункты по номеру -----
//      q:=dbOpenSQL('SELECT count(*) as nnn FROM СпрНасПунктов WHERE nomer is null','');
//      if q.Fld('nnn').AsInteger=0 then sSort:='s.nomer' else sSort:='d.punkt';
//      dbClose(q);
      //---------------------------------------------------------------
      if lAdresFromLic  then begin  // !!!
        sAdr:=' LEFT JOIN БазаДомов d ON d.date_fiks=l.date_fiks and d.id=l.adres_id ';
        sAdr2:='l.adres_id';
      end else begin
        sAdr:=' LEFT JOIN БазаДомов d ON d.date_fiks=n.date_fiks and d.id=n.adres_id ';
        sAdr2:='n.adres_id';
      end;
      strNameUch := SprUch.Fld('NAME').AsString;
      nIDUch := SprUch.Fld('ID').AsInteger;
      s := SprUch.Fld('PUNKTS').AsString;
      ss:= GetFieldWhere(s,'id');
//      s := GetFieldWhere2(s,'d.Punkt',SprUch.Fld('UL').AsString,'d.ul');
      s := GetWherePunktUlDom(nIDUch,s,'d.Punkt',SprUch.Fld('UL').AsString,'d.ul',dbGetDataSet('dmBase.SprIzbUch2'), false);
//      s := GetFieldWhere(s,'d.Punkt');
      strSQL := 'SELECT s.nomer, familia, n.name name1, otch, dater, lic_id, d.punkt, '+sAdr2+', n.adres_id_git, 1 ppp, u.name, d.dom, d.dom1, d.dom2, d.korp, d.kv '+
        ' FROM Население n '+
        ' LEFT JOIN ЛицевыеСчета l ON l.date_fiks=n.date_fiks and l.id=n.lic_id '+
        sAdr+   // LEFT JOIN БазаДомов
        ' LEFT JOIN СпрНасПунктов s ON d.punkt=s.id '+
        ' LEFT JOIN СпрУлиц u ON u.id=d.ul '+
        ' WHERE n.date_fiks='+QStr('1899-12-30')+' and ( '+sRusGr+' n.citizen=112 or n.citizen is null ) and '+
        ' (n.notselect is null or n.notselect=false) and (n.adres_id is not null and n.adres_id>0) and '+
        getStrPropis+sFIO+' and '+
        ' (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+')>18 '+
        ' or (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+'))=18 and '+
        ' dater<='+DateToSQL(d1)+' ) and ('+ s + ') ';
//      if ns<>4 then begin
//        strSQL:=strSQL+'   union all '+
//        ' SELECT nomer, '+QStr(' ')+', name as name1, '+QStr(' ')+', CURDATE( ), 0, id as punkt, 0, 0, 0, 0, '+QStr('')+','+QStr('')+','+QStr('')+','+QStr('')+','+QStr('')+
//        ' FROM СпрНасПунктов WHERE '+ss+' ';
//      end;
      if ns=1 then begin
        strSQL := strSQL+' ORDER BY '+sSort+',familia,name1';
      end else if ns=2 then begin
        strSQL := strSQL+' ORDER BY '+sSort+',ppp,u.name,d.dom1,d.dom2,d.korp,d.kv';
      end else if ns=3 then begin
        strSQL := strSQL+' ORDER BY '+sSort+',ppp,u.name,familia';
      end else begin
        strSQL := strSQL+' ORDER BY familia,name1';
      end;
//      writedebug(strSQL);
      OpenMessage(' Формирование  ... ','',10);
//      writedebug(strSQL);
      q:=dbOpenSQL(strSQL,'');
      tb:=GetTemplateDataSet('TABLSOST');
      i:=1;
      while not q.Eof do begin
        tb.Append;
        if lFIO then begin
          if PolFrom(q.Fld('Name1').AsString,q.Fld('Otch').AsString)='М'
            then tb.Fld('POL').AsString:='Паважаны' else tb.Fld('POL').AsString:='Паважаная';
          tb.Fld('FIO').AsString:=FirstUpper(q.Fld('Familia').AsString)+' '+FirstUpper(q.Fld('Name1').AsString)+' '+FirstUpper(q.Fld('Otch').AsString);
          if lAdres then begin
            if lCheckAddAdres and (q.Fld('adres_id_git').AsString<>'') then begin
              s:=dmBase.AdresFromID(EncodeDate(1899,12,30),q.Fld('adres_id_git').AsString,false);
            end else begin
              s:=dmBase.AdresFromID(EncodeDate(1899,12,30),q.Fld('adres_id').AsString,false);
            end;
            if s<>'' then tb.Fld('ADRES').AsString:=s;
          end;
        end else begin
          tb.Fld('POL').AsString:='';
          tb.Fld('FIO').AsString:='Паважаны выбаршчык (выбаршчыкi)!';
        end;
        tb.Fld('DATEV').AsString:=DatePropisBel(d,5)
        tb.Fld('NAMEV').AsString:=sNameV;
        tb.Fld('TIMEV').AsString:=sTimeV;
        tb.Fld('UCH').AsString:=IntToStr(nUch);
        tb.Fld('ADRESV').AsString:=sAdresV
        tb.Fld('DOSR').AsString:=sDosr; 
        if i=nCount then begin
          tb.Fld('PPP').AsString:='\page';
          i:=1;
        end else begin 
          tb.Fld('PPP').AsString:='';
          i:=i+1;
        end;
        tb.Post;
        q.Next;
      end;
      dbClose(q);
      CloseMessage;
      if dbRecordCount(tb)>0 then  Result:=true;
    end;
  end;
  finally

  end;
end;

//------- расчет количества избирателей в справочнике "избирательных пунктов" --------------
procedure SetDateVibor;
var
  d : TDateTime;
  f : TfmParamQuest;
  n : Integer;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Дата выборов';
  f.AddParamEx(GlobalTask.ParamAsDate('DATE_VIBOR'), ' ' , 'DATEVZ' ,'TYPE=DATE');
  f.AddButtons('Сохранить~Отказ',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    d:=f.GetValue('DATEVZ','D');
    GlobalTask.WriteParamAsDate('DATE_VIBOR',d);
  end;
  f.Free;
end;
//---------------------------
procedure KolvoIzbirat;
var
  nIDUch  : Integer;
  d,d1 : TDateTime;
  s,strDate,strSQL,strErr,ss,sRusGr : String;
  nYear,nMonth,nDay : Word;
  SprUch,q : TDataSet;
  lFull:Boolean;
begin
  SprUch := dbGetDataSet('dmBase.SprIzbUch') ;
  SprUch.CheckBrowseMode;

  d:=GlobalTask.ParamAsDate('DATE_VIBOR');
  DecodeDate(d,nYear,nMonth,nDay);
  nYear := nYear-18;
  d1 := EncodeDate(nYear,nMonth,nDay);
  strDate := DateToSQL(d);

  // включать граждан россии в списки
  if GlobalTask.ParamAsBoolean('RUSGR_VIBOR') then begin
    sRusGr:='n.citizen=643 or';
  end else begin
    sRusGr:='';
  end;

  nIDUch := SprUch.Fld('ID').AsInteger;
  s := SprUch.Fld('PUNKTS').AsString;
  ss:= GetFieldWhere(s,'id');
  if ss='' then begin
    lFull:=true;
    s:='';
  end else begin
    lFull:=false;
    s := GetWherePunktUlDom(nIDUch,s,'d.Punkt',SprUch.Fld('UL').AsString,'d.ul',dbGetDataSet('dmBase.SprIzbUch2'), false);
    s := ' and ( '+s+' ) ';
  end;
  strSQL := 'SELECT Count(*) KOLVO '+
        ' FROM Население n '+
        ' LEFT JOIN ЛицевыеСчета l ON l.date_fiks=n.date_fiks and l.id=n.lic_id '+
        ' LEFT JOIN БазаДомов d ON d.date_fiks=n.date_fiks and d.id=n.adres_id '+
        ' WHERE n.date_fiks='+QStr('1899-12-30')+' and ('+sRusGr+' n.citizen=112 or n.citizen is null ) and '+
        ' (n.notselect is null or n.notselect=false) and (n.adres_id is not null and n.adres_id>0) and '+
        getStrPropis+' and '+
        ' (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+')>18 '+
        ' or (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+'))=18 and '+
        ' dater<='+DateToSQL(d1)+') '+s;
//  writedebug(getStrPropis);
//  writedebug(strSQL);
//  showmessage(strsql);
  OpenMessage(' Расчет количества избирателей ... ','',10);
  q:=dbOpenSQL(strSQL,'');
  try
    SprUch.Edit;
    SprUch.Fld('KOLVO').AsInteger:=q.FieldByName('KOLVO').AsInteger;
    SprUch.Post;
  finally
    dbClose(q);
    CloseMessage;
  end;
end;

//-------------------------------------------------------------------------------------------
function ErrorMensCount : Boolean;
begin
  Result := false;
  if LicSchet.Mens.Count=0 then begin
    PutError('Нет ни одного человека на лицевом счете !')
    Result := true;
  end;
end;

//------------------------ sprWord
// Архивная справка о рождении  (ф1, ф2, для постановки на учет по жилью)
function SPR_ARXIV_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   s,par1 : String;      
   fldAdr:TField;
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     nType:=0; // !!!
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',5);
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     SetSrokDv(ds,0); 
     if GlobalTask.ParamAsString('ARXIV')='1' then begin
       ds.Fld('NAME_SPR').AsString :='АРХИВНАЯ    ';
       ds.Fld('NAME_ORG').AsString :='';
     end else begin
       ds.Fld('NAME_SPR').AsString :='';
       ds.Fld('NAME_ORG').AsString :='архива ';
     end;
     ds.Fld('KOLON_N').AsString:=CreateKolonN(0);
//     ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Fld('NAME').AsString :=GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('FIOP').AsString :=GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('DATER').AsString:=GetNameAsPol('родившегося',DokZAGS.Fld('POL').AsString+'+')+' '+DatePropis(DokZAGS.Fld('DATER').AsDateTime,TYPE_DATE_SPRAV);
     PAR1:=GetTemplateParam('PAR1');
     //------ !!! -----------
     fldAdr:=DokZAGS.Fld('ADRESAT'); 
     if fldAdr=nil then begin      // если справка из акта
       ds.Fld('ARX_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
       ds.Fld('DATEZ').AsString     := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('NOMER').AsString     := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
       if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
         if (DokZAGS.Fld('SVED').AsString='1') then begin
           ds.Fld('FIO_adr').AsString := '' ;
           ds.Fld('FIO_adr2').AsString := '' ;
         end else begin
           ds.Fld('FIO_adr').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_FAMILIA').AsString,DokZAGS.Fld('ONA_NAME').AsString,DokZAGS.Fld('ONA_OTCH').AsString,'ж','Д');
           ds.Fld('FIO_adr2').AsString := DokZAGS.GetAdres2(';;ONA_RAION;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',3);
         end;
       end else begin
         ds.Fld('FIO_adr').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
         ds.Fld('FIO_adr2').AsString := '' ;
       end;
     end else begin                // если отдельная справка не из акта
       ds.Fld('ARX_DATE').AsString  := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString     := DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('NOMER').AsString     := DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('FIO_adr').AsString   := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
       ds.Fld('ORGAN_ZAGS').AsString:= DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     //----------------------
     // NameZAGS('БК','Р')      1-белорусски,краткое   2-падеж   

     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres2('GOSUD,FNAME;+OBL,B_OBL;RAION;GOROD,B_GOROD;',3);     
     ds.Fld('MESTOR1').AsString := '';     
//     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('GOSUD,FNAME;OBL,;;;',1);     
//     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;RAION;GOROD,B_GOROD;',1);
     ds.Fld('FIO_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','И');     
     ds.Fld('FIO_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_FAMILIA').AsString,DokZAGS.Fld('ONA_NAME').AsString,DokZAGS.Fld('ONA_OTCH').AsString,'ж','И');
     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('ON_NATION').AsString,'NAME_M',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('ONA_NATION').AsString,'NAME_G',', ');
     if fldAdr=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     end;
//     if (DokZAGS.Fld('SVED').AsString<>'3') and (PAR1<>'1') then begin // на основании заявления матери
     if not IsZvMat_(DokZAGS) and (PAR1<>'1') then begin // на основании заявления матери
       PutError(' Справка выдается при регистрации ребенка по заявлению матери (без отца) !');
       result:=false;
     end;
     s:=Trim(DokZags.Fld('IZMEN').AsString);
     if s='' then s:=getResource('SPR_ROGD_IZM',nType) else if Right(s,1)<>'.' then s:=s+'.';
     if DokZAGS.Fld('ON_DATE_LR')<>nil then begin // !!!
       if not DokZAGS.Fld('ON_DATE_LR').IsNull 
         then s:=s+CRLF+getResource('SPR_ON_LR',nType)+' '+DatePropis(DokZAGS.Fld('ON_DATE_LR').AsDateTime,TYPE_DATE_SPRAV);
       if not DokZAGS.Fld('ON_SUDD_LR').IsNull
         then s:=s+' решением суда '+DokZAGS.Fld('ON_SUD_LR').AsString+' от '+DatePropis(DokZAGS.Fld('ON_SUDD_LR').AsDateTime,TYPE_DATE_SPRAV);
       if not DokZAGS.Fld('ONA_DATE_LR').IsNull 
         then s:=s+CRLF+getResource('SPR_ONA_LR',nType)+' '+DatePropis(DokZAGS.Fld('ONA_DATE_LR').AsDateTime,TYPE_DATE_SPRAV);
       if not DokZAGS.Fld('ONA_SUDD_LR').IsNull
         then s:=s+' решением суда '+DokZAGS.Fld('ONA_SUD_LR').AsString+' от '+DatePropis(DokZAGS.Fld('ONA_SUDD_LR').AsDateTime,TYPE_DATE_SPRAV);
     end;
     if PAR1='1' then begin
       ds.Fld('ADD_TEXT').AsString:=s;
     end else if PAR1='2' then begin                                               
       ds.Fld('ADD_TEXT').AsString:=getResource('SPR_ROGD1',nType);
       ds.Fld('ADD_TEXT2').AsString:=chr(13)+s;
     end else if PAR1='3' then begin
       ds.Fld('ADD_TEXT').AsString:=getResource('SPR_ROGD1',nType);
       if (fldAdr=nil) or (DokZAGS.Fld('IZMEN').AsString='') then begin      // если справка из акта или изменения пусто
         ds.Fld('ADD_TEXT2').AsString:=chr(13)+getResource('SPR_ROGD2',nType);
       end else begin
         ds.Fld('ADD_TEXT2').AsString:=chr(13)+s;
       end;
       ds.Fld('ADD_TEXT3').AsString:=chr(13)+getResource('SPR_FOR_OCH',nType);
     end;
     ds.Post;
   end;
end;
//---------------------------- sprWord
// Справка о рождении (ф1, ф2, для постановки на учет по жилью) и Ф1 в восстановленной з/а о рождении
function SPR_ROGD_POS(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=0;  // !!!
     ds.Edit;
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',1);
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     SetSrokDv(ds,0);
     if DokZAGS.Fld('POL').AsString='М' then begin
      ds.Fld('ROD').AsString := 'родился' ;
     end else begin
      ds.Fld('ROD').AsString := 'родилась' ;
     end;
// ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р'); 
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'И');
     if (YearOf(NOW)>2015) and (DokZAGS.Fld('IDENTIF').AsString<>'') then begin
       ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+', '+getResource('IN',nType)+': '+DokZAGS.Fld('IDENTIF').AsString+',';
     end;
     if DokZAGS.Fld('ONLYGOD').AsBoolean
       then ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,7)+'г.'
       else ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);

     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('SPRAV_DATE').AsString:=DatePropis(Now,TYPE_DATE_SPRAV);
     if DokZAGS.Fld('VOSSTAN').AsBoolean then begin
       ds.Fld('SPRAV_NOMER').AsString:='';
     end else begin
//       ds.Fld('SPRAV_DATE').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('SPRAV_NOMER').AsString:=DokZAGS.Fld('SPRAV_NOMER').AsString;
     end;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres2('GOSUD,FNAME;+OBL,B_OBL;RAION;GOROD,B_GOROD;',3);     
     ds.Fld('FIO_ON').AsString := GetPadegFIO(_FIO(DokZAGS,'ON_'),'М','И');//.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'Ж','И'); //DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     
//     if (DokZAGS.Fld('SVED').AsString<>'3') and (GetTemplateParam('PAR1')<>'1') then begin // на основании заявления матери
     if not IsZvMat_(DokZAGS) and (GetTemplateParam('PAR1')<>'1') then begin // на основании заявления матери
       PutError(' Справка выдается при регистрации ребенка по заявлению матери (без отца) !');
       result:=false;
     end;

     if GetTemplateParam('PAR1')='1' then begin
//       ds.Fld('ADD_TEXT').AsString := 'Справка действительна в течении шести месяцев.';
       ds.Fld('ADD_TEXT5').AsString := 'Для предоставления по месту требования для получения пособия';
     end;
     if GetTemplateParam('PAR1')='2' then begin
       ds.Fld('ADD_TEXT').AsString := 'Запись об отце в записи акта о рождении ребенка произведена на основании заявления матери, не'+chr(160)+'состоящей в браке, в соответствии со статьей 55 Кодекса Республики Беларусь о браке и семье.';
//       ds.Fld('ADD_TEXT2').AsString := chr(13)+'Справка действительна в течении шести месяцев.';
       ds.Fld('ADD_TEXT5').AsString := 'Для предоставления по месту требования для получения пособия';
     end;
     if GetTemplateParam('PAR1')='3' then begin
       ds.Fld('ADD_TEXT').AsString := 'Запись об отце в записи акта о рождении ребенка произведена на основании заявления матери, не'+chr(160)+'состоящей в браке, в соответствии со статьей 55 Кодекса Республики Беларусь о браке и семье.';
       ds.Fld('ADD_TEXT2').AsString := chr(13)+'В запись акта о рождении изменения в связи с установлением отцовства не'+chr(160)+'вносились.';
       ds.Fld('ADD_TEXT3').AsString := chr(13)+'Справка выдана для постановки на учет граждан, нуждающихся в улучшении жилищных условий.';
//       ds.Fld('ADD_TEXT4').AsString := chr(13)+'Справка действительна в течении шести месяцев.';
       ds.Fld('ADD_TEXT5').AsString := 'Для предоставления по месту требования';
     end;
     if DokZAGS.Fld('ARX_ADRESAT').AsString<>''
       then ds.Fld('ADD_TEXT5').AsString:=DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Post;
   end;
end;
// Справка о рождении мертворожденного и умершего на первой неделе жизни
function SPR_ROGD_UM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=0;  // русский язык
     ds.Edit;
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',4);
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     SetSrokDv(ds,0); 
     if DokZAGS.Fld('POL').AsString='М' then begin
      ds.Fld('ROD').AsString := 'родившегося' ;
     end else begin
      ds.Fld('ROD').AsString := 'родившуюся' ;
     end;
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('SPRAV_DATE').AsString:=DatePropis(Now,TYPE_DATE_SPRAV);
     if DokZAGS.Fld('VOSSTAN').AsBoolean then begin
       ds.Fld('SPRAV_NOMER').AsString:='';
     end else begin
//       ds.Fld('SPRAV_DATE').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('SPRAV_NOMER').AsString:=DokZAGS.Fld('SPRAV_NOMER').AsString;
     end;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres2('GOSUD,FNAME;+OBL,B_OBL;RAION;GOROD,B_GOROD;',3);     

     ds.Fld('FIO_ON').AsString := GetPadegFIO(_FIO(DokZAGS,'ON_'),'М','И');//.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'Ж','И'); //DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;

//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     if GetTemplateParam('PAR1')='1' then begin
       ds.Fld('ADD_TEXT').AsString := getResource('SPR_MROGD1',nType);  //'о записи акта о рождении мертворожденного ребенка';
       ds.Fld('ADD_TEXT2').AsString := getResource('SPR_MROGD2',nType)+'.'; //'Ребенок родился мертвым.';
     end;
     if GetTemplateParam('PAR1')='2' then begin
       ds.Fld('ADD_TEXT').AsString := getResource('SPR_UROGD1',nType); // 'о записи акта о рождении ребенка, умершего в течение первых шести дней жизни';
       ds.Fld('ADD_TEXT2').AsString := getResource('SPR_UROGD2',nType)+' (' + DatePropis(DokZAGS.Fld('DATES').AsDateTime,6) + ').';
     end;
     ds.Post;
   end;
end;

//---------------------------- sprWord

function ReportMestoZ_UserForm:boolean;
var
  f:TfmParamQuest;
  n:Integer;
begin
  Result:=false;
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите параметры';
  f.AddParamEx(StartOfTheMonth(Now), 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
  f.AddParamEx(EndOfTheMonth(Now), 'Конечная дата' , 'DATE2' ,'TYPE=DATE');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  if n = 1 then begin
    SetGlobalVar('DATE1',f.GetValue('DATE1','D'));
    SetGlobalVar('DATE2',f.GetValue('DATE2','D'));
    Result:=true;
  end;
  f.Free;
end;
function ReportMestoZ(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds,dsList:TDataSet;
  n:Integer;
  sSQL,s,ss:String;
  d1,d2:TDateTime;
begin
  result:=true;
  ds:=GetTemplateDataSet('MAIN');
  if ds<>nil then begin
     if not ds.Active then ds.Open;
     d1:=GetGlobalVar('DATE1');
     d2:=GetGlobalVar('DATE2');
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('PERIOD').AsString := 'c '+DatePropis(d1,3)+' по '+DatePropis(d2,3);

//     WritePodpis(ds,'KopyLS2');
     ds.Fld('DOLG_PODP1').AsString:=DolgRukov();   //podpis_dolg(1);
     ds.Fld('FIO_PODP1').AsString:=FIORukov();    //podpis_fio(1);
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     sSQL:= 'SELECT getFIO2(ISNULL(a.FAMILIA,''''),ISNULL(a.NAME,''''),ISNULL(a.OTCH,'''')) as FIO, a.DATES, a.SDAN_DOK, a.LICH_NOMER, s.NAME as MESTOZ, b.ZH_UCH, b.ZH_RAD, b.ZH_UCH2, b.ZH_MOG '+
            ' FROM АктыСмертей a '+
            ' LEFT JOIN AktZ b   ON a.LICH_NOMER=b.LICH_NOMER  '+
            ' LEFT JOIN SprZAH s ON s.ID=b.ZH_KLAD  '+
//            ' LEFT JOIN BaseTextProp b ON typeobj=7 and a.id=b.id and POKAZ=''MESTO_Z''  '+
            ' WHERE a.datez>='+DateToSQL(d1)+' and a.datez<='+DateToSQL(d2)+' and a.vosstan=false ORDER BY a.datez';
     dsList:=dbOpenSQL(sSQL,'');
     n:=0;
     while not dsList.Eof do begin
       n:=n+1;
       ds.Append;
       ds.Fld('NN').AsString  := IntToStr(n)+'.';
       ds.Fld('FIO').AsString := dsList.Fld('FIO').AsString;
       ds.Fld('DATES').AsString := DatePropis(dsList.Fld('DATES').AsDateTime,3);
       s:=Trim(dsList.Fld('LICH_NOMER').AsString);
       ss:=Trim(dsList.Fld('SDAN_DOK').AsString);
       if ss<>'' then if s<>'' then s:=s+', '+ss else s:=ss;
       ds.Fld('PASP').AsString  := s;
       s:=dsList.Fld('MESTOZ').AsString;
       if dsList.Fld('ZH_UCH').AsString<>''  then s:=s+', сектор'+chr(160)+dsList.Fld('ZH_UCH').AsString;
       if dsList.Fld('ZH_RAD').AsString<>''  then s:=s+', ряд'+chr(160)+dsList.Fld('ZH_RAD').AsString;
       if dsList.Fld('ZH_UCH2').AsString<>'' then s:=s+', участок'+chr(160)+dsList.Fld('ZH_UCH2').AsString;
       if dsList.Fld('ZH_MOG').AsString<>''  then s:=s+', могила'+chr(160)+dsList.Fld('ZH_MOG').AsString;
       ds.Fld('MESTO').AsString:=s;
       ds.Post;
       dsList.Next;
     end;
     dbClose(dsList)
  end;
end;

// Справка о смерти (запрос имени файла)
function SPR_SMERT_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if Copy(GlobalTask.ParamAsString('KOD'),1,1)='5' then begin  // для МИНСКА отдельная справка
    Result:='Справка о смерти5.doc';
  end;
end;
// Справка о смерти
function SPR_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   n,nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=0;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',2);
     ds.Fld('KOLON_N').AsString:=CreateKolonN(nType);
     SetSrokDv(ds,nType); // !!!
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('FIOP').AsString := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'И');
     if (YearOf(NOW)>2015) then begin
       ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+', '+getResource('IN',nType)+': ';
       if DokZAGS.Fld('LICH_NOMER').AsString=''
         then ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+getResource('NONE',nType)+','
         else ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+DokZAGS.Fld('LICH_NOMER').AsString+',';
     end;

     ds.Fld('DateS').AsString := DatePropisEX(DokZAGS.Fld('DateS').AsDateTime,6,DokZAGS.Fld('ONLYGOD').AsInteger);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('SPRAV_DATE').AsString := DatePropis(NOW,TYPE_DATE_SPRAV);
     ds.Fld('SPRAV_NOMER').AsString := DokZAGS.Fld('SPRAV_NOMER').AsString;
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
//     ds.Fld('GetVozrast').AsString := GetVozrast(GetCountYear(DokZAGS.Fld('DATES').AsDateTime,DokZAGS.Fld('DATER').AsDateTime),false);


  if  DokZAGS.Fld('DATES').IsNull or DokZAGS.Fld('DATER').IsNull then begin
    if DokZAGS.Fld('TEXT_VOZR').AsString<>'' then begin
      n:=Pos('/',DokZAGS.Fld('TEXT_VOZR').AsString);
      if n=0
        then ds.Fld('GetVozrast').AsString:=DokZAGS.Fld('TEXT_VOZR').AsString
        else ds.Fld('GetVozrast').AsString:=Copy(DokZAGS.Fld('TEXT_VOZR').AsString,1,n-1);
    end else begin
      ds.Fld('GetVozrast').AsString:='';
    end;
  end else begin
    if SubDateYear(DokZAGS.Fld('DateS').AsDateTime,DokZAGS.Fld('DateR').AsDateTime)<1 then begin
      if DokZAGS.Fld('DateS').AsDateTime=DokZAGS.Fld('DateR').AsDateTime then begin
        ds.Fld('GetVozrast').AsString:=' в возрасте менее суток';
      end else begin
        ds.Fld('GetVozrast').AsString:=' в возрасте '+SubDatePropis(DokZAGS.Fld('DateS').AsDateTime,DokZAGS.Fld('DateR').AsDateTime,0);
      end;
    end else begin
      ds.Fld('GetVozrast').AsString := ' в возрасте '+GetVozrast(GetCountYear(DokZAGS.Fld('DATES').AsDateTime,DokZAGS.Fld('DATER').AsDateTime),false);
    end;
  end;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('MESTOS').AsString := DokZAGS.GetAdres2('SM_GOSUD,FNAME;+SM_OBL,SM_B_OBL;SM_RAION;SM_GOROD,SM_B_GOROD;',3);
//     ds.Fld('MESTOS1').AsString := DokZAGS.GetAdres(';;SM_RAION;SM_GOROD,SM_B_GOROD;',1);     

    if DokZAGS.Fld('POL').AsString='М' then ds.Fld('ROD').AsString := 'умер' else ds.Fld('ROD').AsString := 'умерла' ;
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
    ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
    ds.Post;
   end;
end;
// Архивная справка о смерти (запрос имени файла)
function SPR_ARXIV_SMERT_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if Copy(GlobalTask.ParamAsString('KOD'),1,1)='5' then begin  // для МИНСКА отдельная справка
    Result:='Арх справка о смерти5.doc';
  end;
end;
// Архивная справка о смерти
function SPR_ARXIV_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   n,nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=0;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',9);
     ds.Fld('KOLON_N').AsString:=CreateKolonN(nType);
     SetSrokDv(ds,nType); // !!!
     if GlobalTask.ParamAsString('ARXIV')='1' then begin
       ds.Fld('NAME_SPR').AsString :='АРХИВНАЯ    ';
       ds.Fld('NAME_ORG').AsString :='';
     end else begin
       ds.Fld('NAME_SPR').AsString :='';
       ds.Fld('NAME_ORG').AsString :='архива ';
     end;
     if DokZAGS.Fld('ADRESAT')=nil then begin
       ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString;
       ds.Fld('ARX_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
       ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
       if  DokZAGS.Fld('DATES').IsNull or DokZAGS.Fld('DATER').IsNull then begin
         if DokZAGS.Fld('TEXT_VOZR').AsString<>'' then begin
           n:=Pos('/',DokZAGS.Fld('TEXT_VOZR').AsString);
           if n=0
             then ds.Fld('GetVozrast').AsString:=DokZAGS.Fld('TEXT_VOZR').AsString
             else ds.Fld('GetVozrast').AsString:=Copy(DokZAGS.Fld('TEXT_VOZR').AsString,1,n-1);
         end else begin
           ds.Fld('GetVozrast').AsString:='';
         end;
       end else begin
         ds.Fld('GetVozrast').AsString := ' в возрасте '+GetVozrast(GetCountYear(DokZAGS.Fld('DATES').AsDateTime,DokZAGS.Fld('DATER').AsDateTime),false);
       end;
     end else begin
       ds.Fld('ARX_ADRESAT').AsString   := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
       ds.Fld('ARX_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('NOMER').AsString := DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.Fld('NAME_ZAGS').AsString;
       ds.Fld('GetVozrast').AsString := ' в возрасте '+DokZAGS.Fld('VOZR').AsString;
     end;
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('FIOP').AsString := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');

     ds.Fld('DateS').AsString := DatePropisEX(DokZAGS.Fld('DateS').AsDateTime,6,DokZAGS.Fld('ONLYGOD').AsInteger);
     if ds.Fld('DateS').AsString='' then ds.Fld('DateS').AsString:='дата смерти неизвестна';
     s:=GetNameAsPol('умершего',DokZags.Fld('POL').AsString+'+');
     ds.Fld('DateS').AsString := s+' '+ds.Fld('DateS').AsString; 

     ds.Fld('MESTOS').AsString := DokZAGS.GetAdres2('SM_GOSUD,FNAME;+SM_OBL,SM_B_OBL;SM_RAION;SM_GOROD,SM_B_GOROD;',3);     

     if DokZAGS.Fld('POL').AsString='М' then s:='M' else s:='G';
     if (DokZAGS.Fld('NATION').AsString<>'') and (Copy(DokZAGS.Fld('NATION').AsString,1,2)<>'19')
       then ds.Fld('NATION').AsString := NationForSprav(DokZAGS.Fld('NATION').AsString,'NAME_'+s,', ');

     ds.Fld('ADD_TEXT').AsString := DokZags.GetIzm('IZMEN')+'.'+chr(13);

     if DokZAGS.Fld('ADRESAT')=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     end;

     ds.Post;
   end;
end;
//----------------------------------------------------------
function FR_GetBrakRast:String;
var
  s1,s2:String;
begin
  s1:=FirstUpper(DokZAGS.Fld('ON_FamiliaP').AsString+' '+DokZAGS.Fld('ON_Name').AsString+' '+DokZAGS.Fld('ON_Otch').AsString);
  s2:=FirstUpper(DokZAGS.Fld('ONA_FamiliaP').AsString+' '+DokZAGS.Fld('ONA_Name').AsString+' '+DokZAGS.Fld('ONA_Otch').AsString);
  Result:=GetBrakRast(DokZags.getTable('Dokument'),s1,s2,'');
end;

//----------------------------------------------------------
// Архивная справка о браке (отдельная)
function ZAGS_SprBrak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;      
   s,m,j : String;
   n:Integer;
begin
   result:=true;
//   if DokZags.ActiveON then showmessage('ON') else showmessage('ONA');
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,0,6,true);

     ds.Fld('FIOP_R').AsString := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
     ds.Fld('MESTOJ').AsString := '';

     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('Familia').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,'м','В');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('Familia2').AsString,DokZAGS.Fld('Name2').AsString,DokZAGS.Fld('Otch2').AsString,'ж','В');
     ds.Fld('ARX_DATE').AsString  := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('B_NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,TYPE_DATE_SPRAV);

     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.Fld('NAME_ZAGS').AsString;

     ds.Fld('FIO_ON').AsString := DokZAGS.Fld('FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := DokZAGS.Fld('FamiliaP2').AsString;
     // padeg_nation
     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('NATION').AsString,'NAME_MS',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('NATION2').AsString,'NAME_GS',', ');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;

     m:= GetPadegFIO3(DokZAGS.Fld('FamiliaP').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,'м','Т');
     j:= GetPadegFIO3(DokZAGS.Fld('FamiliaP2').AsString,DokZAGS.Fld('Name2').AsString,DokZAGS.Fld('Otch2').AsString,'ж','Т');
     n:=0;
     s:=GetBrakRast(DokZAGS.getTable('Dokument'),m,j,'');
     if s<>'' then begin
       ds.Fld('ADD_TEXT').AsString := s;
       n:=2;
     end;
     if DokZAGS.Fld('FIRST_BRAK').AsBoolean then begin
       ds.Fld('ADD_TEXT').AsString := 'В записи акта о заключении брака супруги значатся как вступившие в брак впервые.';
       ds.Fld('ADD_TEXT2').AsString := chr(13)+'Справка выдана для постановки на учет граждан, нуждающихся в улучшении жилищных условий.';
       n:=3;
     end;
     s:='ADD_TEXT';
     if n>1 then s:=s+IntToStr(n);
     ds.Fld(s).AsString := chr(13)+DokZags.GetIzm('IZMEN')+'.'; 
     ds.Post;
   end;
end;

//----------------------------------------------------------
// Архивная справка о браке 
function SPR_ARXIV_brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds, spruch,dsDeti: TDataSet;      
  s,m,j : String;
  n,nType:Integer;
  sBel:String;
begin
   result:=true;
//   if DokZags.ActiveON then showmessage('ON') else showmessage('ONA');
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=0;  // 1-бел. 0-рус.
     ds.Edit;
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',6);
     ds.Fld('SHTAMP').AsString := GetShtampSprEx(nType);
     ds.Fld('KOLON_N').AsString:=CreateKolonN(nType);
     SetSrokDv(ds,0);
     if GlobalTask.ParamAsString('ARXIV')='1' then begin
       ds.Fld('NAME_SPR').AsString :=getResource('ARX1',nType)+'    ';  // АРХИВНАЯ  strRes.ini
       ds.Fld('NAME_ORG').AsString :='';
     end else begin
       ds.Fld('NAME_SPR').AsString :='';
       ds.Fld('NAME_ORG').AsString :=getResource('ARX2',nType)+' '; // архива
     end;
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       if DokZAGS.ActiveON = true then begin
         ds.Fld('FIOP_R').AsString := GetPadegFIO3(DokZAGS.Fld('ON_FamiliaP').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Д');
         ds.Fld('MESTOJ').AsString := DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3);
       end else begin 
         ds.Fld('FIOP_R').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_FamiliaP').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Д');
         ds.Fld('MESTOJ').AsString := DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3);
       end; 
     end else begin
       ds.Fld('FIOP_R').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
       ds.Fld('MESTOJ').AsString := '';
     end;
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('ARX_DATE').AsString := DatePropis(NOW,4);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'М','И');
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'Ж','И');
     // padeg_nation
     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('ON_NATION').AsString,'NAME_MS',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('ONA_NATION').AsString,'NAME_GS',', ');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     m:= GetPadegFIO3(DokZAGS.Fld('ON_FamiliaP').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Т');
     j:= GetPadegFIO3(DokZAGS.Fld('ONA_FamiliaP').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Т');
     n:=0;
// дополнительный текст для 4 видов справок

     if GetTemplateParam('PAR2')='0' then begin
       s:=GetBrakRast(DokZAGS.getTable('Dokument'), m,j,'');
       ds.Fld('ADD_TEXT').AsString := s;
       n:=2;
     end;
     if GetTemplateParam('PAR2')='4' then begin
       if DokZAGS.Fld('BRAK_RAST').AsBoolean then begin
         if DokZAGS.Fld('TYPE_RAST').AsInteger=1 then s:='прекращен' else s:='расторгнут';
         PutError(' Брак '+s+'!');
         result:=false;
       end else begin
         if (DokZAGS.Fld('ON_SEM').AsString='2') and (DokZAGS.Fld('ONA_SEM').AsString='2') then begin
           ds.Fld('ADD_TEXT').AsString := getResource('SPR_BRAK_B1',nType); //'В записи акта о заключении брака супруги значатся как вступившие в брак впервые.';
           ds.Fld('ADD_TEXT2').AsString := chr(13)+getResource('SPR_FOR_OCH',nType);
           n:=3;
         end else  begin
           PutError(' Справка выдается только для вступивших в брак впервые!');
           result:=false;
         end;
       end;
     end;
     s:='ADD_TEXT';
     if n>1 then s:=s+IntToStr(n);
     ds.Fld(s).AsString := chr(13)+DokZags.GetIzm('IZMEN')+'.';
     ds.Post;
   end;
end;

// Архивная справка о расторжении брака (отдельно)
function ZAGS_SprRast(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;      
   s,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,0,7,true);
     ds.Fld('ARX_DATE').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ARX_ADRESAT').AsString := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('ZAP_NOMER').AsString;
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('Familia').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,'м','В');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('Familia2').AsString,DokZAGS.Fld('Name2').AsString,DokZAGS.Fld('Otch2').AsString,'ж','В');
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.Fld('NAME_ZAGS').AsString;
     ds.Fld('FIO_ON').AsString := DokZAGS.Fld('FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := DokZAGS.Fld('FamiliaP2').AsString;

     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('NATION').AsString,'NAME_M',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('NATION2').AsString,'NAME_G',', ');

     ds.Fld('ADD_TEXT').AsString := DokZags.GetIzm('IZMEN');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     ds.Post;
   end;
end;

// Архивная справка о расторжении брака 
function SPR_ARXIV_rast(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;      
   s,m,j : String;
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     nType:=0;
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,nType,7,true);
     ds.Fld('ARX_ADRESAT').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('ARX_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');

     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'М','И'); //DokZAGS.Fld('ON_FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'Ж','И');//DokZAGS.Fld('ONA_FamiliaP').AsString;

     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('ON_NATION').AsString,'NAME_M',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('ONA_NATION').AsString,'NAME_G',', ');

     ds.Fld('ADD_TEXT').AsString := DokZags.GetIzm('IZMEN');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Архивная справка о перемене ФИО  (отдельно)
function ZAGS_SprChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,0,8,true);
     ds.Fld('ARX_DATE').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ARX_ADRESAT').AsString   := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA2').AsString,DokZAGS.Fld('NAME2').AsString,DokZAGS.Fld('OTCH2').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('NOMER').AsString := DokZAGS.Fld('ZAP_NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.Fld('Name_ZAGS').AsString;

     ds.Fld('F').AsString := DokZAGS.Fld('FAMILIA').AsString;
     ds.Fld('I').AsString := DokZAGS.Fld('NAME').AsString;
     ds.Fld('O').AsString := DokZAGS.Fld('OTCH').AsString;

     if DokZAGS.Fld('POL').AsString='М' then s:='M' else s:='G';
     ds.Fld('NATION').AsString := NationForSprav(DokZAGS.Fld('NATION').AsString,'NAME_'+s,', ');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     ds.Fld('ADD_TEXT').AsString :=DokZags.GetIzm('IZMEN');
     ds.Post;
   end;
end;

// Архивная справка о перемене ФИО  
function SPR_ARXIV_IM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,0,8,true);

     ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIAdo').AsString,DokZAGS.Fld('NAMEdo').AsString,DokZAGS.Fld('OTCHdo').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('ARX_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('F').AsString := GetPadegFIO(DokZAGS.Fld('FAMILIAposle').AsString,DokZAGS.Fld('POL').AsString,'И');
     ds.Fld('I').AsString := GetPadegFIO(DokZAGS.Fld('NAMEposle').AsString,DokZAGS.Fld('POL').AsString,'И');
     ds.Fld('O').AsString := GetPadegFIO(DokZAGS.Fld('OTCHposle').AsString,DokZAGS.Fld('POL').AsString,'И');
     if DokZAGS.Fld('POL').AsString='М' then s:='M' else s:='G';
     ds.Fld('NATION').AsString := NationForSprav(DokZAGS.Fld('NATION').AsString,'NAME_'+s,', ');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Fld('ADD_TEXT').AsString :=DokZags.GetIzm('IZMEN');
     ds.Post;
   end;
end;

//========================================
// Извещение об отсутствии актовой записи
function ZAGS_IzvOtsut_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if DokZAGS.Fld('LANG').AsInteger=1 then begin
    CreateWorkShtamp(3);  // SHTAMP-BEL
    Result:='Извещение об отсутствии записи акта_БЕЛ.doc';
  end else begin
    CreateWorkShtamp(1);  // SHTAMP
  end;
end;

function ZAGS_IzvOtsut(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   sPol : String;      
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=DokZAGS.Fld('LANG').AsInteger;
     ds.Edit;
     sPol:=DokZAGS.Fld('POL').AsString;
     CreateTitle(ds,nType,12,false);
     ds.Fld('ADRESAT').AsString   := DokZAGS.Fld('ADRESAT').AsString;
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     if nType=1 then begin
       ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME_B');
       ds.Fld('TYPEAKT').AsString := ValueFromKey('KEY_TYPEZAGS_FULL_B',DokZags.Fld('TYPEAKT').Asstring,'',false);
     end else begin
       ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
       ds.Fld('TYPEAKT').AsString := ValueFromKey('KEY_TYPEZAGS_FULL',DokZags.Fld('TYPEAKT').Asstring,'',false);
     end;
     ds.Fld('FIO').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,sPol,'В');

     ds.Fld('DATE1').AsString := DokZAGS.Fld('DATE1').AsString;
     ds.Fld('DATE2').AsString := DokZAGS.Fld('DATE2').AsString;

     ds.Fld('ARX_FOND').AsString := DokZAGS.Fld('ARX_FOND').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
//     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','И');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     ds.Post;
   end;
end;

// справка об отсутствии актовой записи о браке
function ZAGS_SprOtsut_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if DokZAGS.Fld('LANG').AsInteger=1 then begin
    CreateWorkShtamp(3);  // SHTAMP-BEL
    Result:='Справка об отсутствии записи акта о заключении брака_БЕЛ.doc';
  end else begin
    CreateWorkShtamp(1);  // SHTAMP
  end;
end;
// справка об отсутствии актовой записи о браке
function ZAGS_SprOtsut(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,dsRast: TDataSet;
   sPol,sPol2,s,ss,s3,Strin,sKrat : String;      
   nType:Integer;
begin
//   sKrat:='<.>';
   sKrat:='';  // !!!  возможно нужно анализировать параметр !!!   '' или '<.>'
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     nType:=DokZAGS.Fld('LANG').AsInteger;
     CreateTitle(ds, nType, 10, false);
     sPol:=DokZAGS.Fld('POL').AsString;
     if sPol='М' then sPol2:='Ж' else sPol2:='М';
     if nType=1 then begin // на бел. языке
       ds.Fld('ROGD').AsString      := GetNameAsPolBel('які нарадзіўся',sPol)+' '+
                                       DatePropisBel(DokZAGS.Fld('DATER').AsDateTime,TYPE_DATE_SPRAV)+' у '+
                                       DokZAGS.GetAdres2(sKrat+'<B>RG_GOSUD,FNAME_B;+RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',1);     
       ds.Fld('MESTO_GIT').AsString := 'і пастаянна пражывае па адрасе: '+
                                       DokZAGS.GetAdres2(sKrat+'<B>GT_GOSUD,FNAME_B;+GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',1);     
       ds.Fld('ZAV').AsString       := GetNameAsPolBel('заяўніка',sPol);
       if DokZAGS.Fld('GRAG').AsString='999'
         then ds.Fld('GRAG').AsString := 'асобы без грамадзянства' 
         else ds.Fld('GRAG').AsString := GetNameAsPolBel('грамадзяніна',sPol)+' '+SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('GRAG').AsString,'FNAME_B');
       ds.Fld('NAME').AsString  := GlobalTask.ParamAsString('NAME_B');
       ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('FIO').AsString   := FirstUpper(DokZAGS.Fld('FAMILIA').AsString+' '+DokZAGS.Fld('NAME').AsString+' '+DokZAGS.Fld('OTCH').AsString);

       ds.Fld('ADD_TEXT').AsString:='';
       dsRast:=DokZags.GetTable('tbRast');
       if dsRast.Fld('TYPE_RAST').AsInteger>0 then begin
         ss:=Trim(dsRast.Fld('B_ZAGS').AsString);
         if ss='' then ss:=GlobalTask.ParamAsString('NAME_B');
         s:=chr(13)+chr(9)+'У дакументах архіва '+ss;
         s:=s+' маецца на захаванні запіс акта аб заключенні шлюбу № '+dsRast.Fld('B_NOMER').AsString+' складзены '+
            DatePropisBel(dsRast.Fld('B_DATE').AsDateTime,TYPE_DATE_SPRAV)+' у адносінах '+ 
            ds.Fld('GRAG').AsString+' '+dsRast.Fld('LICO').AsString+' і '+dsRast.Fld('SUPRUG').AsString+'.'+chr(13)+chr(9);
         if sPol2='Ж' then s3:='жонкі' else s3:='мужа';
         ss:=GetBrakRast_Bel(DokZAGS.GetTable('tbRast'),'#','',s3);
//writedebug('4444444444444');
         ds.Fld('ADD_TEXT').AsString:=s+ss;
       end;
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV_B').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV_B').AsString;
     end else begin
       ds.Fld('ROGD').AsString:=GetNameAsPol('родившегося',sPol)+' '+
                                DatePropis(DokZAGS.Fld('DATER').AsDateTime,TYPE_DATE_SPRAV)+' в '+
                                DokZAGS.GetAdres2(sKrat+'RG_GOSUD,FNAME;+RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',3);     
       if DokZAGS.Fld('GT_GOSUD').AsInteger=defGrag then begin
         ds.Fld('MESTO_GIT').AsString:=GetNameAsPol('проживающего',sPol)+' в Республике Беларусь по адресу: '+
                                       DokZAGS.GetAdres2(sKrat+';GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',3);     
       end else begin
         ds.Fld('MESTO_GIT').AsString:=GetNameAsPol('проживающего',sPol)+' по адресу: '+
                                       DokZAGS.GetAdres2(sKrat+'GT_GOSUD,FNAME;GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',3);     
       end;
       ds.Fld('ZAV').AsString:=GetNameAsPol('заявителя',sPol);

       Strin:='гражданина';
     //  if DokZAGS.Fld('GRAG').AsString<>'112' then begin 
     //     Strin := 'иностранного гражданина';
     //  end;
       if DokZAGS.Fld('GRAG').AsString='999'
         then ds.Fld('GRAG').AsString := 'лица без гражданства'
         else ds.Fld('GRAG').AsString := GetNameAsPol(Strin,sPol)+' '+SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('GRAG').AsString,'GNAME');

       ds.Fld('NAME').AsString  := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
       ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('FIO').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,sPol,'Р');

       ds.Fld('ADD_TEXT').AsString:='';
       dsRast:=DokZags.GetTable('tbRast');
       if dsRast.Fld('TYPE_RAST').AsInteger>0 then begin
         ss:=Trim(dsRast.Fld('B_ZAGS').AsString);
         if ss='' then ss:=GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
         s:=chr(13)+chr(9)+'В документах архива '+ss;
         s:=s+' имеется на хранении запись акта о заключении брака № '+dsRast.Fld('B_NOMER').AsString+' составленная '+
            DatePropis(dsRast.Fld('B_DATE').AsDateTime,TYPE_DATE_SPRAV)+' в отношении '+ 
            ds.Fld('GRAG').AsString+' '+GetPadegFIO(dsRast.Fld('LICO').AsString,sPol,'Р')+' и '+GetPadegFIO(dsRast.Fld('SUPRUG').AsString,sPol2,'Р')+'.'+chr(13)+chr(9);
         ss:=GetBrakRast(DokZAGS.GetTable('tbRast'),'#','','');
         ds.Fld('ADD_TEXT').AsString:=s+ss;
       end;
       // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
  //     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','И');
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     end;
     ds.Fld('ADRESAT').AsString := DokZAGS.Fld('ADRESAT').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATE1').AsString := DokZAGS.Fld('DATE1').AsString;
     ds.Fld('DATE2').AsString := DokZAGS.Fld('DATE2').AsString;

     ds.Post;
   end;
end;
//===========================================================
//Справка о записи акта гражданского состояния
function ZAGS_SprAkt_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if DokZAGS.Fld('LANG').AsInteger=1 then begin
    CreateWorkShtamp(3);  // SHTAMP-BEL
    Result:='Справка о записи акта гражданского состояния_БЕЛ.doc';
  end else begin
    CreateWorkShtamp(1);  // SHTAMP
  end;
end;
function ZAGS_SprAkt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   sPol : String;      
   nType:Integer;
begin
//SHTAMP,ADRESAT,NAME,DATEZ,NOMER,FIO,DOLG_RUK_ZAGS,RUKOV,NOMER_AKT,DATE_AKT,ZAGS_AKT,FIO_AKT,
//SVED,IS_IZMEN,IZMEN
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     nType:=DokZAGS.Fld('LANG').AsInteger;
     if not ds.Active then ds.Open;
     ds.Edit;
     sPol:=DokZAGS.Fld('POL').AsString;
     CreateTitle(ds, nType, 3, false);
     ds.Fld('ADRESAT').AsString   := DokZAGS.Fld('ADRESAT').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('NOMER_AKT').AsString := DokZAGS.Fld('NOMER_AKT').AsString;
     ds.Fld('SVED').AsString := Replace_CRLF(DokZAGS.Fld('VN_SVED').AsString);
     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     if DokZAGS.Fld('IS_VN_IZM').AsInteger=0 then begin
       ds.Fld('IS_IZMEN').AsString := getResource('SPR_IZM',nType);
       ds.Fld('IZMEN').AsString := '';
     end else begin
       ds.Fld('IS_IZMEN').AsString := getResource('SPR_VN_IZM',nType);
       ds.Fld('IZMEN').AsString := Replace_CRLF(DokZAGS.Fld('VN_IZM').AsString);
     end;
     if nType=1 then begin
       ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME_B');
       ds.Fld('TYPEAKT').AsString := ValueFromKey('KEY_TYPEZAGS_FULL_B',DokZags.Fld('TYPEAKT').Asstring,'',false);
       ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('FIO_AKT').AsString   := FirstUpper(DokZAGS.Fld('FAMILIA').AsString+' '+DokZAGS.Fld('NAME').AsString+' '+DokZAGS.Fld('OTCH').AsString);
       ds.Fld('ZAGS_AKT').AsString := DokZAGS.Fld('NAME_ZAGS').AsString;
       ds.Fld('DATE_AKT').AsString := DatePropisBel(DokZAGS.Fld('DATE_AKT').AsDateTime,TYPE_DATE_SPRAV);
     end else begin
       ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
       ds.Fld('TYPEAKT').AsString := ValueFromKey('KEY_TYPEZAGS_FULL',DokZags.Fld('TYPEAKT').Asstring,'',false);
       ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('FIO_AKT').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,sPol,'В');
       ds.Fld('ZAGS_AKT').AsString := GetPadeg(DokZAGS.Fld('NAME_ZAGS').AsString,'Т');
       ds.Fld('DATE_AKT').AsString := DatePropis(DokZAGS.Fld('DATE_AKT').AsDateTime,TYPE_DATE_SPRAV);
     end;
     ds.Post;
   end;
end;

//---------------------------------------------------------------------------
function ZAGS_ZaklChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,dsDeti: TDataSet;
   sPol,s,ss : String;      
begin
   Result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     sPol:=DokZAGS.Fld('POL').AsString;
//     ds.Fld('SHTAMP').AsString := GetShtampSpr();
//     if GlobalTask.ParamAsString('ARXIV')='1' then begin  областной архив
//     end;
//     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     if Pos('(', DokZAGS.Fld('FAMILIA').AsString)=0 
       then ds.Fld('FIO').AsString:=GetPadegFIO(DokZAGS.FPlus('FAMILIA;NAME;OTCH','~'),sPol,'Р')
       else ds.Fld('FIO').AsString:=DokZAGS.FPlus('FAMILIA;NAME;OTCH','~');

     ds.Fld('ROGD').AsString      := GetNameAsPol('родившегося',sPol)+' '+
                                     DatePropis(DokZAGS.Fld('DATER').AsDateTime,DP_MAIN)+' в '+
                                     DokZAGS.GetAdres('RG_GOSUD,FNAME;RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',1);     
     ds.Fld('WHO').AsString := DokZAGS.Fld('WHO').AsString;
     ds.Fld('FIO_NEW').AsString := DokZAGS.Fld('FIO_NEW').AsString;
     ds.Fld('PRICH').AsString := DokZAGS.Fld('PRICH').AsString;

     if DokZAGS.Fld('R_NOMER').AsString<>'' then begin
       ds.Fld('R_MESTO').AsString := 'В записи акта о рождении № '+DokZAGS.Fld('R_NOMER').AsString+' от '+
               DatePropis(DokZAGS.Fld('R_DATE').AsDateTime,DP_MAIN)+' совершенной '+DokZAGS.Fld('R_ZAGS').AsString+CRLF+
               GetNameAsPol('он',sPol)+' '+DokZAGS.FPlus('R_FAMILIA;R_NAME;R_OTCH',' ')+CRLF+
               GetNameAsPol('уроженец',sPol)+' '+DokZAGS.GetAdres('R_RG_GOSUD,FNAME;R_RG_OBL,R_RG_B_OBL;R_RG_RAION;R_RG_GOROD,R_RG_B_GOROD;',1)+CRLF+
               'родители '+DokZAGS.Fld('OTEC').AsString+', '+DokZAGS.Fld('MAT').AsString;
     end;

     ds.Fld('VIS_ORG').AsString := GlobalTask.ParamAsString('VIS_ORGAN');
     s:='Запись акта о браке № '+DokZAGS.Fld('B_NOMER').AsString+' от '+
               DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,DP_MAIN)+' составлена в '+DokZAGS.Fld('B_ZAGS').AsString+'.';
     if sPol='М'
       then ss:='Разведен с гражданкой '
       else ss:='Разведена с гражданином ';
     if (DokZAGS.Fld('TYPE_BRAK').AsInteger=1) or (DokZAGS.Fld('TYPE_BRAK').AsInteger=0) then begin
       ds.Fld('BRAK').AsString := 'Состоит в браке с '+DokZAGS.Fld('SUPRUG').AsString+Chr(13)+s;
     end else if (DokZAGS.Fld('TYPE_BRAK').AsInteger=2) then begin  // в браке не состоит
       ds.Fld('BRAK').AsString := 'В браке не состоит.';
     end else if (DokZAGS.Fld('TYPE_BRAK').AsInteger=3) then begin  // разведен (решеие суда)
       ds.Fld('BRAK').AsString := ss+DokZAGS.Fld('SUPRUG').AsString+Chr(13)+
            'решение суда '+DokZAGS.Fld('B_ZAGS').AsString+' от '+
            DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,DP_MAIN)+' вступившее в законную силу '+DatePropis(DokZAGS.Fld('B_DATE2').AsDateTime,DP_MAIN)+'.';
     end else if (DokZAGS.Fld('TYPE_BRAK').AsInteger=4) then begin  // разведен з/а о браке
       ds.Fld('BRAK').AsString := ss+DokZAGS.Fld('SUPRUG').AsString+Chr(13)+
             'запись акта о расторжении брака № '+DokZAGS.Fld('B_NOMER').AsString+' от '+
               DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,DP_MAIN)+' составлена в '+DokZAGS.Fld('B_ZAGS').AsString+'.';
     end else if (DokZAGS.Fld('TYPE_BRAK').AsInteger=5) then begin  // вдова (вдовец)
       if sPol='М'
         then ss:='Вдовец, состоял в браке с гражданкой '
         else ss:='Вдова, состояла в браке с гражданином ';
       ds.Fld('BRAK').AsString := ss+DokZAGS.Fld('SUPRUG').AsString+Chr(13)+s;
     end;

     dsDeti:=DokZags.Deti;
     if dsDeti.RecordCount>0 then begin
       dsDeti.First;
       ds.Fld('DETI').AsString:='Имеет детей:'+Chr(13);
       while not dsDeti.Eof do begin
         ds.Fld('DETI').AsString:=ds.Fld('DETI').AsString+
             ' - '+dsDeti.Fld('FIO').AsString+', '+dsDeti.Fld('MESTO').AsString+', '+DatePropis(dsDeti.Fld('DATER').AsDateTime,DP_MAIN)+
            ', з/а  №'+dsDeti.Fld('NOMER').AsString+' от '+DatePropis(dsDeti.Fld('DATEA').AsDateTime,DP_MAIN)+
            ' '+dsDeti.Fld('MESTOREG').AsString+Chr(13);
         dsDeti.Next;
       end;
       dsDeti.First;
     end;
     ds.Fld('MESTO_GIT').AsString := DokZAGS.GetAdres(';GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',1);     
     ds.Fld('WORK').AsString := DokZAGS.Fld('WORK').AsString;
     ds.Fld('VUS').AsString := DokZAGS.Fld('VUS').AsString;
     ds.Fld('ROVD').AsString := DokZAGS.Fld('ROVD').AsString;
     ds.Fld('ROVD_DATE').AsString := DatePropis(DokZAGS.Fld('ROVD_DATE').AsDateTime,DP_MAIN);
     ds.Fld('ROVD_ZAKL').AsString := Replace_CRLF(DokZAGS.Fld('ROVD_ZAKL').AsString);

     ds.Fld('SOOB').AsString := Replace_CRLF(DokZAGS.Fld('SOOB').AsString);
     if DokZAGS.Fld('IS_IZMEN').AsBoolean then begin
       ds.Fld('IS_IZMEN').AsString:= 'При разрешении на перемену, выданном '+getPadeg(GlobalTask.ParamAsString('VIS_ORGAN'),'Т')+', необходимо внести изменения в следующие записи актов гражданского состояния:';
       ds.Fld('IZMEN').AsString := Replace_CRLF(DokZAGS.Fld('IZMEN').AsString);
     end;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,DP_MAIN);

     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     if DokZAGS.Fld('SPEC').AsString<>'' then begin
       ds.Fld('DOLG_SPEC_ZAGS').AsString :=DokZAGS.Fld('DOLG_SPEC').AsString;
       ds.Fld('SPEC').AsString :=DokZAGS.Fld('SPEC').AsString;
     end;
     ds.Post;
   end;
end;
//---------------------------------------------------------------------------
function ZAGS_ZaklIzmAkt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,dsDeti: TDataSet;
   sPol,s,ss : String;      
   l:Boolean;
begin
   Result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     l:=DokZAGS.Fld('DELETE_CRLF').AsBoolean;
     if not ds.Active then ds.Open;
     ds.Edit;
//     sPol:=DokZAGS.Fld('POL').AsString;
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     sPol:=PolFromName(DokZAGS.Fld('NAME').AsString);
     if sPol='' then if ANSIUpperCase(RIGHT(DokZAGS.Fld('OTCH').AsString,1))='Ч' then sPol:='М' else sPol:='Ж';
     if DokZAGS.Fld('IS_SKLONEN').AsBoolean then begin 
       s:=DokZAGS.FPlus('FAMILIA;NAME;OTCH','~');
       ds.Fld('FIO').AsString:=GetPadegFIO(s,sPol,'Р')
     end else begin
       ds.Fld('FIO').AsString:=DokZAGS.FPlus('FAMILIA;NAME;OTCH',' ');
     end;
     s:='';
     if DokZAGS.Fld('IS_IZMEN').AsBoolean  then s:='изменений';
     if DokZAGS.Fld('IS_DOPOLN').AsBoolean then ss:='дополнений' else ss:='';
     if ss<>'' then if s='' then s:=ss else s:=s+', '+ss;
     if DokZAGS.Fld('IS_ISPRAV').AsBoolean then ss:='исправлений' else ss:='';
     if ss<>'' then if s='' then s:=ss else s:=s+', '+ss;
     ds.Fld('CHECK_IZM').AsString:=s;

     ds.Fld('PROSIT').AsString := Replace_CRLF2(DokZAGS.Fld('PROSIT').AsString,l);
     ds.Fld('DOKUMENTS').AsString := Replace_CRLF2(DokZAGS.Fld('DOKUMENTS').AsString,l);
     ds.Fld('USTANOVIL').AsString := Replace_CRLF2(DokZAGS.Fld('USTANOVIL').AsString,l);
     s:=ValueFromKey('KEY_TYPEZAGS_FULL',DokZags.Fld('TYPEAKT').Asstring,'',false);

     ds.Fld('AKT').AsString := 'акта '+s+' № '+DokZAGS.Fld('B_NOMER').AsString+' от '+
                                DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,DP_MAIN)+' совершенную '+
                                DokZAGS.Fld('B_ZAGS').AsString;
     ds.Fld('AKT1').AsString := StringReplace(ds.Fld('AKT').AsString,'совершенную','совершенной');

     ds.Fld('ROVD_ZAKL').AsString := Replace_CRLF2(DokZAGS.Fld('ROVD_ZAKL').AsString,l);
     ds.Fld('SOOB').AsString := Replace_CRLF2(DokZAGS.Fld('SOOB').AsString,l);

     if DokZAGS.Fld('IZMEN').AsString<>'' then begin
       ds.Fld('IZMEN').AsString := 'Кроме того необходимо внести изменения в следующие записи актов гражданского состояния:'+chr(13)+
       Replace_CRLF2(DokZAGS.Fld('IZMEN').AsString,l);
     end;
     if DokZAGS.Fld('COPY1').AsString<>'' then begin
       ds.Fld('COPY').AsString := 'Копии заключения направлены:'+chr(13);
       ds.Fld('COPY').AsString := ds.Fld('COPY').AsString+'1. '+DokZAGS.Fld('COPY1').AsString+Chr(13);
       if DokZAGS.Fld('COPY2').AsString<>'' then ds.Fld('COPY').AsString := ds.Fld('COPY').AsString+'2. '+DokZAGS.Fld('COPY2').AsString+Chr(13);
       if DokZAGS.Fld('COPY3').AsString<>'' then ds.Fld('COPY').AsString := ds.Fld('COPY').AsString+'3. '+DokZAGS.Fld('COPY3').AsString;
     end;

     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,DP_MAIN);
     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     if DokZAGS.Fld('SPEC').AsString<>'' then begin
       ds.Fld('DOLG_SPEC_ZAGS').AsString :=DokZAGS.Fld('DOLG_SPEC').AsString;
       ds.Fld('SPEC').AsString :=DokZAGS.Fld('SPEC').AsString;
     end;
     ds.Post;
   end;
end;

// заключение о внесении ИН
//---------------------------------------------------------------------------
function ZAGS_ZaklAddIN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   sPol,s,ss,sZags,szags1 : String;      
   l:Boolean;
   nD:Integer;
begin
   Result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     nD:=2;
//     sPol:=DokZAGS.Fld('POL').AsString;
     ds.Edit;
     ds.Fld('ZAKL').AsString := 'от '+DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,nD)+' №'+DokZAGS.Fld('NOMER').AsString;
     s := GlobalTask.ParamAsString('NAME');
     if DokZAGS.Fld('IS_SKLON').AsBoolean then begin 
       ds.Fld('NAME').AsString:=FU(GetPadeg(s,'Т'))+', рассмотрено';
       ds.Fld('USTAN').AsString:='УСТАНОВЛЕНО';
     end else begin
       ds.Fld('NAME').AsString:=s+', рассмотрев';
       ds.Fld('USTAN').AsString:='УСТАНОВИЛ';
     end;
     sPol:=PolFrom(DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString);
     if DokZAGS.Fld('IS_SKLONR').AsBoolean then begin 
       s:=DokZAGS.FPlus('FAMILIA;NAME;OTCH','~');
       ds.Fld('FIOR1').AsString:=GetPadegFIO(s,sPol,'Р')
       s:=DokZAGS.FPlus('FAMILIA1;NAME1;OTCH1','~');
       ds.Fld('FIO').AsString:=GetPadegFIO(s,DokZAGS.Fld('ZV').AsString,'Р');
     end else begin
       ds.Fld('FIOR1').AsString:=DokZAGS.FPlus('FAMILIA;NAME;OTCH',' ');
       ds.Fld('FIO').AsString:=DokZAGS.FPlus('FAMILIA1;NAME1;OTCH1',' ');
     end;
     ds.Fld('FIOR1').AsString:=DokZAGS.FPlus('FAMILIA;NAME;OTCH',' ')+' '+DatePropis(DokZAGS.Fld('DATER').AsDateTime,6)+' ';

     ds.Fld('ADRES').AsString := ' '+GetNameAsPol('проживающего',DokZAGS.Fld('ZV').AsString)+' по адресу: '+
                                 DokZAGS.GetAdres('GT_GOSUD,FNAME;GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',1);     

     s:=DokZAGS.GetPasport('DOC=D1_DOKUMENT;TYPE=D1_DOK_TYPE;SERIA=D1_DOK_SERIA;NOMER=D1_DOK_NOMER;DATE=D1_DOK_DATE',2);
     ss:=DokZAGS.GetPasport('DOC=D1_DOKUMENT;TYPE=D1_DOK_TYPE;SERIA=D1_DOK_SERIA;NOMER=D1_DOK_NOMER;DATE=D1_DOK_DATE',4);
     ds.Fld('DOKUMENTS').AsString := 'документ, удостоверяющий личность'+chr(13)+s+' '+ss;
     if (DokZAGS.Fld('D2_DOK_NOMER').AsString<>'') then begin
       s:=DokZAGS.GetPasport('DOC=D2_DOKUMENT;TYPE=D2_DOK_TYPE;SERIA=D2_DOK_SERIA;NOMER=D2_DOK_NOMER;DATE=D2_DOK_DATE',2);
       ss:=DokZAGS.GetPasport('DOC=D2_DOKUMENT;TYPE=D2_DOK_TYPE;SERIA=D2_DOK_SERIA;NOMER=D2_DOK_NOMER;DATE=D2_DOK_DATE',4);
       ds.Fld('DOKUMENTS').AsString := ds.Fld('DOKUMENTS').AsString+chr(13)+'документ, удостоверяющий личность второго родителя либо его копия'+chr(13)+s+' '+ss;
     end;
     if (DokZAGS.Fld('SVID_NOMER').AsString<>'') then begin
       ds.Fld('DOKUMENTS').AsString := ds.Fld('DOKUMENTS').AsString+chr(13)+'свидетельство о рождении ребенка серия '+DokZAGS.Fld('SVID_SERIA').AsString+' №'+DokZAGS.Fld('SVID_NOMER').AsString;
     end;
     s:=DokZAGS.Fld('R_ZAGS').AsString;
     if DokZAGS.Fld('IS_SKLON').AsBoolean 
       then sZags:=GetPadeg(s,'Т')
       else sZags:=s;
     ds.Fld('AKT1').AsString := ' № '+DokZAGS.Fld('R_NOMER').AsString+', совершенной '+
                                DatePropis(DokZAGS.Fld('R_DATE').AsDateTime,nD)+' '+sZags;
     ds.Fld('AKT2').AsString := ds.Fld('AKT1').AsString;
     ds.Fld('AKT4').AsString := StringReplace(ds.Fld('AKT1').AsString,'совершенной','совершенную');
     ds.Fld('FIOR2').AsString := ds.Fld('FIOR1').AsString;
     ds.Fld('FIOR3').AsString := ds.Fld('FIOR1').AsString;
     ds.Fld('FIOR4').AsString := ds.Fld('FIOR1').AsString;

     ds.Fld('DATE_IN').AsString := DatePropis(DokZAGS.Fld('DATESV').AsDateTime,nD);
     ds.Fld('DATE_SV').AsString := DatePropis(DokZAGS.Fld('DATESV').AsDateTime,nD);
     ds.Fld('SVIDP').AsString   := chr(13)+'серия'+chr(160)+DokZAGS.Fld('SVID_SERIAP').AsString+chr(160)+'№'+DokZAGS.Fld('SVID_NOMERP').AsString;

//     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,nD);
     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     ds.Fld('IDENTIF').AsString :=DokZAGS.Fld('IDENTIF').AsString;
     ds.Post;
   end;
end;

// предварительная запись
function PredZapis_Talon(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds, dsT: TDataSet;
  d:TDateTime;
  n,nDayZ:Integer;
  s,sEmpty:String;
  lRaschet:Boolean;
begin
  lRaschet:=GlobalTask.GetWorkParam('RASCHET_DAY');
  result:=true;
  ds:=GetTemplateDataSet('MAIN');
  dsT:=dbGetDataSet('fmPredZapis.tbView');
  ds.Edit;
  ds.Fld('NOMER').AsString:=dsT.Fld('NOMER').AsString;
  ds.Fld('ON_FIO').AsString:=dsT.Fld('ON_FIO').AsString;
  ds.Fld('ONA_FIO').AsString:=dsT.Fld('ONA_FIO').AsString;
  ds.Fld('TIME_BRAK').AsString:=FormatDateTime('HH:NN',dsT.Fld('BEGINR').AsDateTime);
  ds.Fld('DATE_BRAK').AsString:=DatePropis(dsT.Fld('DATE_BRAK').AsDateTime,2);
  ds.Fld('TELEFON').AsString:=GlobalTask.GetWorkParam('TELEFON');
  ds.Fld('TIMEWORK').AsString:=GlobalTask.GetWorkParam('TIMEWORK');
  ds.Fld('PORPROV').AsString:=GlobalTask.GetWorkParam('PORPROV');
  s:=SeekValueSpr('SprKomiss','ID',dsT.Fld('MESTO').AsInteger,'NAME');
  if s<>'' 
    then ds.Fld('MESTO').AsString:='Место регистрации: '+s;
  d:=IncMonth(dsT.Fld('DATE_BRAK').AsDateTime,-3);
  //--------------------------
  sEmpty:='«____» _____________ 20___ г.';
  if lRaschet then begin
    nDayZ:=GlobalTask.GetWorkParam('VISIT_DAY');
    n:=DayOfTheWeek(d);
//  writedebug(inttostr(n)+'   '+DatePropis(d,2));
    while n<>nDayZ do begin
      d:=IncDay(d,1);
      n:=DayOfTheWeek(d);
    end;
    if IsPrazdnik(d) then d:=IncDay(d,7);
    if IsPrazdnik(d) 
      then ds.Fld('DATE_DECL').AsString:=sEmpty
      else ds.Fld('DATE_DECL').AsString:=DatePropis(d,2);
    //--------------------------
    d:=dsT.Fld('DATE_BRAK').AsDateTime;
    d:=IncDay(d,-1);
    n:=DayOfTheWeek(d);
    while n<>nDayZ do begin
      d:=IncDay(d,-1);
      n:=DayOfTheWeek(d);
    end;
    if IsPrazdnik(d) then d:=IncDay(d,-7);
    if IsPrazdnik(d) 
      then ds.Fld('DATE_PASP').AsString:=sEmpty
      else ds.Fld('DATE_PASP').AsString:=DatePropis(d,2);
  end else begin        
    ds.Fld('DATE_DECL').AsString:=sEmpty;
    ds.Fld('DATE_PASP').AsString:=sEmpty;
  end;
  //--------------------------
  ds.Fld('CUR_DATE').AsString:=DatePropis(Now,2);
  ds.Post;
end;

//========================================
  // Справка о находящихся в собственности физического лица жилых помещений (не имеет,место требов)
function SPR_OTCHUG(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := FormatDateTime('YYYY',m.Fld('DATER').AsDateTime);
     if m.Fld('PASP_NOMER').AsString='' then begin
       ds.Fld('PPP_TEXT').AsString :='---';
     end else begin
       ps:= m.Fld('PASP_SERIA').AsString;
       d:= m.Fld('PASP_NOMER').AsString;
       v:= GetPadeg(m.Fld('PASP_VIDAN').AsString,'Т');
       k:= DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
       ds.Fld('PPP_TEXT').AsString := ps+d+' выдан '+k+' года '+v;
     end; 
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'Р');
  // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('NameOrgK').AsString := NameOrg('К','Р');

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('PROGIV').AsString := 'проживает' ;
        ds.Fld('ZA_KEM').AsString := 'ним' ;
        ds.Fld('PROIZV').AsString := 'производил' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
      end else begin
        ds.Fld('PROGIV').AsString := 'проживает' ;
        ds.Fld('ZA_KEM').AsString := 'ней' ;
        ds.Fld('PROIZV').AsString := 'производила' ;
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
   end;
end;

//------------------------------------------------------
// Справка о находящихся в собственности физического лица жилых помещений (не имеет,очередь)
function SPR_OTCHUG2(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Т');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     if m.Fld('PASP_NOMER').AsString='' then begin
       ds.Fld('PPP_TEXT').AsString :='---';
     end else begin
       ps:= m.Fld('PASP_SERIA').AsString;
       d:= m.Fld('PASP_NOMER').AsString;
       v:= GetPadeg(m.Fld('PASP_VIDAN').AsString,'Т');
       k:= DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
       ds.Fld('PPP_TEXT').AsString := ps+d+' выдан '+k+' года '+v;
     end; 
     ds.Fld('NameOrgP').AsString := NameOrg('','Р');
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'Р');
// 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();
     ds.Fld('NameOrgK').AsString := NameOrg('К','Р');
     ds.Post;
   end;
end;

//------------------------------------------------------------
// Справка о находящихся в собственности физического лица жилых помещений (имеет част собств)
function SPR_OTCHUG3(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Т');
  // ds.Fld('DATER').AsString := FormatDateTime('YYYY',m.Fld('DATER').AsDateTime);
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
// ds.Fld('PASP_SERIA').AsString := m.Fld('PASP_SERIA').AsString;
// ds.Fld('PASP_NOMER').AsString := m.Fld('PASP_NOMER').AsString;
// ds.Fld('PASP_VIDAN').AsString := GetPadeg(m.Fld('PASP_VIDAN').AsString,'Т');
// ds.Fld('PASP_DATE').AsString := DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
     if m.Fld('PASP_NOMER').AsString='' then begin
       ds.Fld('PPP_TEXT').AsString :='---';
     end else begin
       ps:= m.Fld('PASP_SERIA').AsString;
       d:= m.Fld('PASP_NOMER').AsString;
       v:= GetPadeg(m.Fld('PASP_VIDAN').AsString,'Т');
       k:= DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
       ds.Fld('PPP_TEXT').AsString := ps+d+' выдан '+k+' года '+v;
     end; 
// ds.Fld('Passport').AsString := m.Passport; слова - серия, номер. Наименование РОВД не в падеже.
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('NameOrgP').AsString := NameOrg('','Р');
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'Р');
// PLOSH_ALL-общая площадь PLOSH_GIL-жилая  PLOSH_ZDAN-здания     
//    if LicSchet.Fld('PLOSH_ZDAN').AsString='' если общая площадь жилого здания пусто, берем общую площадь жилого помещения.
//      then strPlosh := LicSchet.Fld('PLOSH_ALL').AsString
//      else strPlosh := LicSchet.Fld('PLOSH_ZDAN').AsString; ...не используем...
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('GOD_VOZV').AsString := LicSchet.Fld('GOD_VOZV').AsString;
// 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();
     ds.Fld('NameOrgK').AsString := NameOrg('К','Р');
     ds.Post;
   end;
end;

// Извещение о повторном свидетельстве о рождении 
function IZV_POVT_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о рождении';
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     DokZAGS.SvidPovtor.Last;
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о повторном свидетельстве о смерти
function IZV_POVT_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о смерти';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     DokZAGS.SvidPovtor.Last;
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о повторном свидетельстве о заключении брака
function IZV_POVT_Brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о заключении брака';
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('FIOP').AsString := on+' и '+ona;
     DokZAGS.SvidPovtor.Last;
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о повторном свидетельстве о расторжении брака (мужчины)
function IZV_POVT_RastBrakm(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о расторжении брака';
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('FIOP').AsString := on+' и '+ona;
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о повторном свидетельстве о расторжении брака (женщины)
function IZV_POVT_RastBrakj(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о расторжении брака';
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('FIOP').AsString := on+' и '+ona;
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
   //  ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
   //  ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о повторном свидетельстве об установлении отцовства
function IZV_POVT_UstOtc(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='об установлении отцовства';
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
 //    ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
 //    ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение в суд об исполнении решения суда
function IZV_SUD_Adopt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds: TDataSet;
  sp,s,ss:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
//   if ds<>nil then begin
//     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('ARX_ADRESAT').AsString :='Суд '+DokZAGS.Fld('SUD_NAME').AsString;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     s:='Об исполнении решения суда'+CRLF+CRLF;
     //DokZAGS.NameZAGS2('','Т'); NameOrg('','Р'); 
     // DokZags.FIO('ON_#МР')  ON_  мужской пол  родит. падеж
     sp:=DokZAGS.Fld('POL').AsString;
     if sp='М' then ss:='усыновлении' else ss:='удочерении'; 
     s:=s+NameOrg('','И')+' извещает суд об исполнении решения суда от '+DatePropis(DokZAGS.Fld('SUD_DATE').AsDateTime,5)+', вступившего в законную силу '+
        DatePropis(DokZAGS.Fld('SUD_DATEV').AsDateTime,5)+' и по заявлению '+DokZags.FIO2('ON_','М','Р')+' об '+ss+' '+DokZags.FIO2('DO;E',sp,'Р')+'.'+CRLF;
     s:=s+DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,5)+' составлена запись акта об '+ss+' №'+chr(160)+DokZAGS.Fld('NOMER').AsString+' на '+DokZags.FIO2('DO;E',sp,'Р')+' '+
        NameOrg('','Т')+' и по заявлению '+DokZags.FIO2('ON_','М','Р')+' от '+DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,5);
     ds.Fld('TEXT1').AsString:=s;
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
//   end;
end;

// Извещение о повторном свидетельстве об усыновлении (удочерении)
function IZV_POVT_Adopt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     if DokZAGS.Fld('POL').AsString='М' then begin
      ds.Fld('O_HCEM').AsString :='об усыновлении'; 
     end else begin
      ds.Fld('O_HCEM').AsString :='об удочерении'; 
     end;
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о повторном свидетельстве о перемене имени
function IZV_POVT_ChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о перемене имени';
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о повторном свидетельстве о заключении брака (восстановленное)
function IZV_POVT_BrakV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о заключении брака';
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('FIOP').AsString := on+' и '+ona;
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о повторном свидетельстве о рождении (восстановленное)
function IZV_POVT_ROGDV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о рождении';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := DokZAGS.Fld('RUKOV').AsString;
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о повторном свидетельстве о смерти (восстановленная)
function IZV_POVT_SMERTV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о смерти';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к справке о рождении 
function Soob_SPR_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о рождении';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     if DokZAGS.Fld('ADRESAT')=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','П');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

// Сопроводительное письмо к справке о смерти
function Soob_SPR_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о смерти';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');

     if DokZAGS.Fld('ADRESAT')=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','П');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

// Сопроводительное письмо к справке об отсутствии записи актв о браке
function Soob_SPR_OTSUT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString := DokZAGS.Fld('ADRESAT').AsString;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
        ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     if DokZAGS.Fld('ADRESAT')=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     end;

     ds.Post;
   end;
end;


// Сопроводительное письмо к справке о заключении брака
function Soob_SPR_Brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
   fldAdr:TField;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о заключении брака';
     fldAdr:=DokZAGS.Fld('ADRESAT'); 
     if fldAdr=nil then begin      // если справка из акта
       on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
       ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     end else begin
       on:= GetPadegFIO3(DokZAGS.Fld('Familia').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,'м','В');
       ona:= GetPadegFIO3(DokZAGS.Fld('Familia2').AsString,DokZAGS.Fld('Name2').AsString,DokZAGS.Fld('Otch2').AsString,'ж','В');
     end;
     ds.Fld('FIOP').AsString := on+' и '+ona;
     if fldAdr=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','П');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('B_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

// Сопроводительное письмо к справке о расторжении брака	
function Soob_SPR_RastBrak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
   fldAdr:TField;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о расторжении брака';
     fldAdr:=DokZAGS.Fld('ADRESAT'); 
     if fldAdr=nil then begin      // если справка из акта
       on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
       ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     end else begin
       on:= GetPadegFIO3(DokZAGS.Fld('Familia').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,'м','В');
       ona:= GetPadegFIO3(DokZAGS.Fld('Familia2').AsString,DokZAGS.Fld('Name2').AsString,DokZAGS.Fld('Otch2').AsString,'ж','В');
     end;
     ds.Fld('FIOP').AsString := on+' и '+ona;
     if DokZAGS.Fld('ADRESAT')=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','П');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

// Сопроводительное письмо к справке о перемене имени
function Soob_SPR_ChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   fldAdr:TField;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о перемене имени';
     fldAdr:=DokZAGS.Fld('ADRESAT'); 
     if fldAdr=nil then begin      // если справка из акта
       ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
     end else begin
       ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIA2').AsString,DokZAGS.Fld('NAME2').AsString,DokZAGS.Fld('OTCH2').AsString,DokZAGS.Fld('POL').AsString,'В');
     end;
     if fldAdr=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','П');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

// Сопроводительное письмо к справке о рождении (восстановленное)
function Soob_SPR_ROGDV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='о рождении';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     if DokZAGS.Fld('ADRESAT')=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','П');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

//-----------------------------------------------------
// заполняются поля: ZARM,ZAR,DATEP,ONO,GRAG,DATEP
procedure WriteMenToSpr(m:TMens; ds:TDataSet);
var
  s,ss:String;
  fld,fldR:TField;
begin
  fldR:=ds.FindField('DATEP');  
  if fldR<>nil then fldR.AsString:=DatePropis(m.Fld('DATEP').AsDateTime,6);
  s:=GetNameAsPol('зарегистрирован',m.Fld('POL').AsString);
  ss:=GetNameAsPol('проживает',m.Fld('POL').AsString);
  if m.TypeReg=MESTO_NOTREG then begin   //не зарегистрирован и не проживает
    ds.Fld('Zarm').AsString:='проживает';
    ds.Fld('Zar').AsString  := '';
    if fldR<>nil then fldR.AsString:= '';
  end else if m.TypeReg=MESTO_GIT then begin
    ds.Fld('Zarm').AsString := ss+' ('+s+') по месту жительства' ;
    ds.Fld('Zar').AsString := FirstUpper(s)+' по месту жительства c ' ;
  end else begin   // по месту пребывания
    ds.Fld('Zarm').AsString:='проживает';
    ds.Fld('Zar').AsString := FirstUpper(s)+' по месту пребывания c ' ;
  end;    
  fld:=ds.FindField('ONO');
  if fld<>nil then fld.AsString:=GetNameAsPol('он',m.Fld('POL').AsString);
  fld:=ds.FindField('GRAG');
  if fld<>nil then fld.AsString:=GetNameAsPol('гражданину',m.Fld('POL').AsString);
end;

// Копия лицевого счета
function KopyLS(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;

   nID : Integer;
   sOtnosh:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;

     nID:=m.Fld('ID_INTERNAL').asInteger;
     sOtnosh:=m.Fld('OTNOSH').asString;

     adr := LicSchet.Adres;
     strKomu := m.FIO;
     strGR:='';
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р')); //+', '+FirstCharUpper(Obl_Name('Р'));

     ds.Fld('AdresR').AsString:=FirstCharUpper(ValueFromKey('KEY_OSNOV_ZASEL',LicSchet.Fld('OSNOV_ID').AsString,'',false))+
                                ' '+LicSchet.Fld('DOGOVOR').AsString;
     ds.Fld('TYPEHOUSE').AsString:=GetPredst(LicSchet.Fld('PREDST').AsString,'частный дом','NAME');
     ds.Fld('NomerOr').AsString:=CreateStrFromStr('№',LicSchet.Fld('OSNOV_NOMER'),'');
     ds.Fld('DateOr').AsString:=CreateStrFromDate(' от ',LicSchet.Fld('OSNOV_DATE'),3)

{
     if IdProg()='GKH' then begin
       ds.Fld('AdresR').AsString := FirstCharUpper(GetPadeg(ParamAsString('GOROD')+' городской','Т'));
     end else begin
       ds.Fld('AdresR').AsString := FirstCharUpper( GetPadeg(OnlyRaion_Name('')+' районный','Т'));  // районным
     end;
     ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'Частный');
}
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;

//     WritePodpis(ds,34);
     WritePodpis(ds,'KopyLS2');

     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     m.First;
     while not m.Eof do begin
       ds.Append;
       ds.Fld('FIO').AsString := m.FIO;
       ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
       ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
       ds.Fld('DATEV').AsString := DatePropis(m.Fld('DATEV').AsDateTime,3);
       ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
       ds.Fld('Gragd').AsString := SeekValueSpr('СпрСтран','ID',m.Fld('CITIZEN').AsString,'GNAME');
       ds.Fld('Lgot').AsString := m.getLgoti;
       ds.Post;
       m.Next;
     end;
     m.First;
   end;
end;

  // Справка на адресную помощь гражданину
function SpravkS(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim,strYear : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strKomu := m.FIO;
     strYear:='';
     if m.Fld('DATER').AsString<>'' then begin
       strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+' г.р.,';
     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И')+strYear;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('POSTR').AsString := LicSchet.Fld('POSTR').AsString;

     ds.Fld('FIO_RUK').AsString := FIORukov();


     if ParamAsString('ГЛ_БУХГАЛТЕР')='' then begin
        ds.Fld('D_Buh').AsString := '';
      end else begin
        ds.Fld('D_Buh').AsString := DolgGlBux();
        ds.Fld('FIO_buh').AsString := FIOGlBux();
      end;


     ds.Fld('D_Pas').AsString := DolgSpecOrSecretar();
     ds.Fld('FIO_pas').AsString := FIOSpecOrSecretar();

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Grag').AsString := 'гражданину' ;
        ds.Fld('ONO').AsString := 'он' ;
        ds.Fld('Zar').AsString := 'Зарегистрирован' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
      end else begin
        ds.Fld('Grag').AsString := 'гражданке' ;
        ds.Fld('ONO').AsString := 'она' ;
        ds.Fld('Zar').AsString := 'Зарегистрирована' ;
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'частный дом');
 
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;

     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // наниматель
         strNanim := m.FIO;
       end;
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='является';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;
     ds.Post;

   end;
end;

// Извещение о перемене ФИО (загс,архив) 
function Izv_im(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,sPar : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     sPar:=GetTemplateParam('PAR');
     ds.Fld('TEXT1').AsString :='';
     ds.Fld('TEXT2').AsString :='';
     if sPar='1'  then begin
         ds.Fld('ARX_ADRESAT').AsString  := DokZAGS.Fld('ARX_ADRESAT').AsString
         ds.Fld('TEXT1').AsString  :='и в наш адрес вышлите новое свидетельство.';
         ds.Fld('TEXT2').AsString  :='Извещение о перемене направьте в '+TypeArxiv()+' архив ЗАГС для внесения изменений во второй экземпляр записи акта.'+CHR(13);
     end  else begin 
         ds.Fld('ARX_ADRESAT').AsString  := GetAdresat('ADRES_IZVECH'); 
     end;
    
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'И');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIAdo').AsString,DokZAGS.Fld('NAMEdo').AsString,DokZAGS.Fld('OTCHdo').AsString,DokZAGS.Fld('POL').AsString,'Д');
     ds.Fld('FIOI').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIAdo').AsString,DokZAGS.Fld('NAMEdo').AsString,DokZAGS.Fld('OTCHdo').AsString,DokZAGS.Fld('POL').AsString,'И');
     ds.Fld('DATE_Iz').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
//     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');

     ds.Fld('F').AsString := GetPadegFIO(DokZAGS.Fld('FAMILIAposle').AsString,DokZAGS.Fld('POL').AsString,'И');
     ds.Fld('I').AsString := GetPadegFIO(DokZAGS.Fld('NAMEposle').AsString,DokZAGS.Fld('POL').AsString,'И');
     ds.Fld('O').AsString := GetPadegFIO(DokZAGS.Fld('OTCHposle').AsString,DokZAGS.Fld('POL').AsString,'И');

      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;

   end;
end;

// Сообщение о перемене ФИО (РОВД,РВК) 
function Soob_im(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       ds.Fld('ROVD').AsString := GlobalTask.ParamAsString('ROVD');
       s:=DokZAGS.Fld('VOENKOM').AsString;
       if s='' then s:=ParamAsString('ID_VOENKOM');
       ds.Fld('VOENKOMAT').AsString := SeekValueSpr('SprVoenkom','ID',s,'NAME');
     end else begin
       ds.Fld('ROVD').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
//     ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres(';M_OBL,M_B_OBL;M_RAION;M_GOROD,M_B_GOROD;M_GOROD_R',1);
//     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('GOSUD,FNAME;OBL,;;;',1);     
//     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;RAION;GOROD,B_GOROD;',1);     
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'П');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOI').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIAdo').AsString,DokZAGS.Fld('NAMEdo').AsString,DokZAGS.Fld('OTCHdo').AsString,DokZAGS.Fld('POL').AsString,'И');
     ds.Fld('DATE_Iz').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     // ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','И');
     ds.Fld('F').AsString := GetPadegFIO(DokZAGS.Fld('FAMILIAposle').AsString,DokZAGS.Fld('POL').AsString,'И');
     ds.Fld('I').AsString := GetPadegFIO(DokZAGS.Fld('NAMEposle').AsString,DokZAGS.Fld('POL').AsString,'И');
     ds.Fld('O').AsString := GetPadegFIO(DokZAGS.Fld('OTCHposle').AsString,DokZAGS.Fld('POL').AsString,'И');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
   end;
end;

// Сообщение об установлении отцовства
function IZV_UstOtc(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ADRES_SOOB').AsString := GetAdresat('ADRES_SOOB');
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'П');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('MestoNomer').AsString := DokZAGS.Fld('MestoNomer').AsString;
     ds.Fld('MestoDate').AsString := DatePropis(DokZAGS.Fld('MestoDate').AsDateTime,6);
     ds.Fld('Mesto').AsString := GetPadeg(DokZAGS.Fld('Mesto').AsString,'П'); 
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'Ж','И');//.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('ONA_GOSUD,FNAME;ONA_OBL,;;;',1);     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;ONA_RAION;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*;',1);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о внесении исправления в з/а о рождении
function IZV_ISP_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о рождении';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о дополнении записи акта о рождении ИН
function IZV_DOP_IN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о рождении';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,3);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('ORGAN_ZAGS_2').AsString := NameOrg('','Р'); //DokZAGS.NameZAGS2('','Р');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'Р');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     if DokZAGS.OnlySvid then begin
       ds.Fld('SVID_SERIA').AsString := DokZAGS.Fld('SVID_SERIA').AsString;
       ds.Fld('SVID_NOMER').AsString := DokZAGS.Fld('SVID_NOMER').AsString;
       ds.Fld('SVID_DATA').AsString := DokZAGS.Fld('DATESV').AsString;
     end else begin
       ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
       ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
       ds.Fld('SVID_DATA').AsString := DokZAGS.SvidPovtor.Fld('SVID_DATE').AsString;
     end;
     ds.Fld('IDENTIF').AsString := DokZAGS.Fld('IDENTIF').AsString;
     ds.Fld('ZAKL').AsString := DokZAGS.Fld('ZAKL_IN_NOMER').AsString+chr(160)+'от'+chr(160)+DatePropis(DokZAGS.Fld('ZAKL_IN_DATE').AsDateTime,3);;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о внесении исправления в з/а о смерти
function IZV_ISP_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о смерти';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о внесении исправления в з/а о заключении брака
function IZV_ISP_Brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о заключении брака';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('FIOP').AsString := on+' и '+ona;
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о внесении исправления в з/а о расторжении брака
function IZV_ISP_RastBrak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о расторжении брака';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('FIOP').AsString := on+' и '+ona;
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о внесении исправления в з/а об установлении отцовства
function IZV_ISP_UstOtc(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='об установлении отцовства';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о внесении исправления в з/а об усыновлении (удочерении)
function IZV_ISP_Adopt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     if DokZAGS.Fld('POL').AsString='М' then begin
      ds.Fld('O_HCEM').AsString :='об усыновлении'; 
     end else begin
      ds.Fld('O_HCEM').AsString :='об удочерении'; 
     end;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о внесении исправления в з/а о перемене имени
function IZV_ISP_ChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о перемене имени';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о внесении исправления в восстановленную з/а о рождении
function IZV_ISP_ROGD_V(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о рождении';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');

     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');

     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о внесении исправления в восстановленную з/а о смерти
function IZV_ISP_SMERT_V(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о смерти';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о внесении исправления в восстановленную з/а о заключении брака
function IZV_ISP_Brak_V(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='о заключении брака';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('FIOP').AsString := on+' и '+ona;
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Заполнение граф таблицы в выписке из лицевого счета
procedure AddProdTo(ds:TDataSet; sName:String; sValue:String);
begin
     ds.Append;
     ds.Fld('PROD').AsString := sName;
     ds.Fld('KOLVO').AsString := sValue;
     ds.Post;
end;

  // Выписка из лицевого счета
function SprV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

//     ds.Fld('FIO_RUK').AsString := FIORukov();
     WritePodpis(ds,13);

     ds.Fld('LIC').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('KNIGA').AsString := LicSchet.Fld('KNIGA_NOMER').AsString;
     ds.Fld('UCH').AsString := LicSchet.Fld('VSEGO').AsString;

     ds.Fld('GOD').AsString:=FormatDateTime('YYYY',MainDateFiks);
     if ds.Fld('GOD').AsString='1899' then ds.Fld('GOD').AsString:=FormatDateTime('YYYY',Now);

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
      end else begin
       ds.Fld('Zarm').AsString := 'зарегистрирована' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     //----------------------- потому что две версии пох. учета ---------------
     if LicSchet.Fld('PR_SERNO')<>nil then begin  
       if not LicSchet.Fld('PR_SERNO').IsNull then AddProdTo(ds,'Зерно',LicSchet.Fld('PR_SERNO').AsString);
       if not LicSchet.Fld('PR_KART').IsNull then AddProdTo(ds,'Картофель',LicSchet.Fld('PR_KART').AsString);
       if not LicSchet.Fld('PR_OVOCHI').IsNull then AddProdTo(ds,'Овощи',LicSchet.Fld('PR_OVOCHI').AsString);
       if not LicSchet.Fld('PR_KORNPL').IsNull then AddProdTo(ds,'Кормовые корнеплоды',LicSchet.Fld('PR_KORNPL').AsString);
       if not LicSchet.Fld('PR_PLOD').IsNull then AddProdTo(ds,'Плоды(семечковые, косточковые)',LicSchet.Fld('PR_PLOD').AsString);
       if not LicSchet.Fld('PR_JAGOD').IsNull then AddProdTo(ds,'Ягоды культурные',LicSchet.Fld('PR_JAGOD').AsString);
     end;
     //------------------------------------------------------------------------
     ds:=GetTemplateDataSet('TABLSOST1');
     if not LicSchet.Fld('BIG_ENIMAL').IsNull then AddProdTo(ds,'Крупный рогатый скот',LicSchet.Fld('BIG_ENIMAL').AsString);
     if not LicSchet.Fld('SVINI').IsNull then AddProdTo(ds,'Свиньи',LicSchet.Fld('SVINI').AsString);
     if not LicSchet.Fld('OVCI').IsNull then AddProdTo(ds,'Овцы',LicSchet.Fld('OVCI').AsString);
     if not LicSchet.Fld('KOZI').IsNull then AddProdTo(ds,'Козы',LicSchet.Fld('KOZI').AsString);
     if not LicSchet.Fld('LOSHADI').IsNull then AddProdTo(ds,'Лошади',LicSchet.Fld('LOSHADI').AsString);
     if not LicSchet.Fld('PTICA').IsNull then AddProdTo(ds,'Птица',LicSchet.Fld('PTICA').AsString);
     if ds.RecordCount=0 then AddProdTo(ds,'не имеет','');
   end;
end;

  // Справка  о составе семьи (вариант 1)
function SprSS1(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim : String;
   lPrint:Boolean;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strKomu := m.FIO;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_buh').AsString := FIOGlBux();
     ds.Fld('FIO_pas').AsString := FIOSpec();
     ds.Fld('DOLG_RUK').AsString := DolgRukov();
     ds.Fld('DOLG_BUH').AsString := DolgGlBux();
     ds.Fld('DOLG_SPEC').AsString := DolgSpec();

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('ONO').AsString := 'он' ;
        ds.Fld('Zar').AsString := 'Зарегистрирован' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
        ds.Fld('Ego').AsString := 'ним' ;
      end else begin
        ds.Fld('ONO').AsString := 'она' ;
        ds.Fld('Zar').AsString := 'Зарегистрирована' ;
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
        ds.Fld('Ego').AsString := 'ней' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;
     if m.Count>1 then lPrint:=true else lPrint:=false;
     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // наниматель
         strNanim := m.FIO;
       end;
       if lPrint then begin
       if AddMenToSprav(m,nID) then begin
           nn:=nn+1;
           ds.Append;
           ds.Fld('NN').AsString  := IntToStr(nn)+'.';
           ds.Fld('FIO').AsString := m.FIO;
           ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
           ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
           ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
           ds.Post;
         end;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='является';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('SOBSTV').AsString:=s+' '+strSobstv;
     ds.Post;

   end;
end;


// Справка  о составе семьи (вариант 2)
function SprSS2(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   sOtnosh :String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('NomerPH').AsString := LicSchet.Fld('KNIGA_NOMER').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();
     ds.Fld('DOLG_RUK').AsString := DolgRukov();
     ds.Fld('DOLG_SEK').AsString := DolgSecretar();

     if m.Fld('POL').AsString='М' then begin
//        ds.Fld('ONO').AsString := 'он' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
        ds.Fld('Ego').AsString := 'его' ;
      end else begin
//        ds.Fld('ONO').AsString := 'она' ;
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
        ds.Fld('Ego').AsString := 'ее' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     //--------- добавляет того кому выдается справка
     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
     ds.Fld('WORK_NAME').AsString:=SpecGrafToStr(m,ParamAsInteger('SSS2_TYPE'),3);
     ds.Post;
     //---------------------------------------------
     m.First;
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('WORK_NAME').AsString:=SpecGrafToStr(m,ParamAsInteger('SSS2_TYPE'),3);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

// Справка  о составе семьи (вариант 3)
function SprSS3(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   sOtnosh :String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('FIO_SEK').AsString := FIOSecretar();
     ds.Fld('DOLG_SEK').AsString := DolgSecretar();
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('DOLG_RUK').AsString := DolgRukov();
     if m.Fld('POL').AsString='М' then begin
//        ds.Fld('ONO').AsString := 'он' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
        ds.Fld('Ego').AsString := 'его' ;
      end else begin
//        ds.Fld('ONO').AsString := 'она' ;
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
        ds.Fld('Ego').AsString := 'ее' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     //------------ добавляем кому выдается справка
     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
     ds.Fld('DATEP').AsString:=SpecGrafToStr(m,ParamAsInteger('SSS3_TYPE'),3);
     ds.Post;
     //-------------------------------------------
     m.First;
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('DATEP').AsString:=SpecGrafToStr(m,ParamAsInteger('SSS3_TYPE'),3);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

  // Справка о составе семьи и занимаемом жилом помещении (вариант 2)
function SprSSP(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   sOtnosh :String;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('@PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('@PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Р');
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'Р');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();

     if adr.Kv='' then begin
       ds.Fld('PrS').AsString :='жилой дом';
       ds.Fld('PrSb').AsString :='Жилой дом';
     end else begin
       ds.Fld('PrS').AsString :='квартиру';
       ds.Fld('PrSb').AsString :='Квартира';
     end;

     if m.Fld('POL').AsString='М' then begin
//        ds.Fld('ONO').AsString := 'он' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
//        ds.Fld('Ego').AsString := 'ним' ;
      end else begin
//        ds.Fld('ONO').AsString := 'она' ;
       ds.Fld('Zarm').AsString := 'зарегистрирована' ;
//        ds.Fld('Ego').AsString := 'ней' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Fld('OBORUD').AsString := OborudDoma;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     //------- добавим кому выдается справка
     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
     ds.Post;
     //------------------------------------
     m.First;
     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // наниматель
         strNanim := m.FIO;
       end;
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='является';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('SOBSTV').AsString:=s+' '+strSobstv;
     ds.Post;
   end;
end;

//-----------------------------------------------------------
// Справка о последнем месте жительства (адресная книга)
function SprMGP_Adres(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh : String;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     adr := Adres;
     m := adr.Mens;
     strKomu := m.FIO;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('DATES').AsString := DatePropis(m.Fld('DATES').AsDateTime,6);
     ds.Fld('NomerLS').AsString := adr.ListLicSchet;
     ds.Fld('PLOSH_ALL').AsString := adr.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := adr.Fld('PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

     WritePodpis(ds,9);
     WriteMenToSpr(m,ds);
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);

     if ds.Fld('Zarm').AsString='проживает' 
       then ds.Fld('Zarm').AsString:=GetNameAsPol('проживал',m.Fld('POL').AsString)+' ('+GetNameAsPol('зарегистрирован',m.Fld('POL').AsString)+') по месту жительства';

     ds.Fld('TYPEHOUSE').AsString:=GetPredst(Adres.Fld('PREDST').AsString,'частный дом','NAME2');
 
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;

     strNanim:='';
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='является';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;
     ds.Post;
   end;
end;

//---------------------------------------------------
// Справка о занимаемом в данном населенном пункте жилом помещении и составе семьи
function SprSSP_Adres(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh, strVed : String;
   nID,nn,nIDLic : Integer;
   sOtnosh :String;
   strNanim,strYear : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     adr := Adres;
     m := adr.Mens;
     strYear:='';
     if m.Fld('DATER').AsString<>'' then begin
       strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+'г.р.';
     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('DATEP').AsString := m.DvigToStr(', '); // DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('PLOSH_ALL').AsString := adr.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := adr.Fld('PLOSH_GIL').AsString;
     ds.Fld('MAT_STEN').AsString := AnsiLowerCase(SeekValueSpr('SprMatSten','ID',adr.Fld('MAT_STEN').AsString,'NAME'));
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'Д')+strYear;
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И')+strYear;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

     WritePodpis(ds,15);

     ds.Fld('GES').AsString := ParamAsString('DEFAULT_GES');
     ds.Fld('KOL_KOMN').AsString := adr.Fld('KOL_KOMN').AsString;
     if adr.Fld('ETAG').AsString='' then ds.Fld('ETAG').AsString := 'первом'  else ds.Fld('ETAG').AsString := adr.Fld('ETAG').AsString+' ';
     if (adr.Fld('KOL_ETAG').AsString='') or (adr.Fld('KOL_ETAG').AsString='1')  then ds.Fld('ETAGNOGO').AsString := 'одно'  else ds.Fld('ETAGNOGO').AsString := adr.Fld('KOL_ETAG').AsString+' ';
     ds.Fld('PRED').AsString := ParamAsString('SP_SOSTAVS');

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Grag').AsString := 'гражданину';
        ds.Fld('ONO').AsString := 'ним';
        ds.Fld('ON').AsString := 'его';
        ds.Fld('Pr').AsString := 'проживающему';
        ds.Fld('Zarm').AsString := 'зарегистрированному';
      end else begin
        ds.Fld('Grag').AsString := 'гражданке';
        ds.Fld('ONO').AsString := 'ней';
        ds.Fld('ON').AsString := 'ее';
        ds.Fld('Pr').AsString := 'проживающей';
        ds.Fld('Zarm').AsString := 'зарегистрированной';
      end;

     ds.Fld('PrS').AsString :=adr.Predst;
//     if adr.Kv='' then begin
//       ds.Fld('PrS').AsString :='одноквартирный жилой дом';
//       ds.Fld('PrSb').AsString :='Жилой дом';
//     end else begin
//       ds.Fld('PrS').AsString :='квартиру';
//       ds.Fld('PrSb').AsString :='Квартира';
//     end;


//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства'; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания';
      end;

     if adr.Fld('OTD_KUXNA').AsBoolean then ds.Fld('OTD_KUXNA').AsString := 'отдельной'
                                            else ds.Fld('OTD_KUXNA').AsString := 'общей';
     if adr.Fld('IZOL_KOMN').AsBoolean then ds.Fld('IZOL_KOMN').AsString := 'изолированных'
                                            else ds.Fld('IZOL_KOMN').AsString := 'неизолированных';

     ds.Fld('OBORUD').AsString := OborudDomaAdr(adr);

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID:=m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     nIDLic:=m.Fld('LIC_ID').AsInteger;
     strNanim:=m.FIO;
     m.First;
     nn:=0;

     strNanim:='';
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     ds.Fld('SOBSTV').AsString := GetPadeg(adr.ControlHouse,'Р'); // находится в ведении
     s:='является';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;
     ds.Post;
   end;
end;

//------------------------------------------------------------------------
// Справка о месте жительства
function SprMG(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   sPadeg,sAdd1,sAdd2,strAdres,strYear : String;
   nID : Integer;
   lAsGKX:Boolean;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      lAsGKX:=ParamAsBoolean('SPRMGS_GKX');  // в соотв. с постановлением ЖКХ
      strKomu := m.FIO;
      strYear:='';
     if lAsGKX then begin
       sAdd1:='Выдана '+GetNameAsPol('гражданину',m.Fld('POL').AsString)+' ';
       sAdd2:='в том, что '+GetNameAsPol('он',m.Fld('POL').AsString)+' действительно ';
       sPadeg:='Д';
     end else begin
       sAdd1:='';
       sAdd2:='';
       sPadeg:='И';
       if m.Fld('DATER').AsString<>'' then begin
         if GetTemplateParam('PAR2')='2' then begin
           strYear := ', '+DatePropis(m.Fld('DATER').AsDateTime,3);
         end else begin
           strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+' г.р.';
         end;
       end;
     end;
     ds.Fld('Komu').AsString := sAdd1+GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,sPadeg)+strYear;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И')+strYear;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

//     WritePodpis(ds,1);
     WritePodpis(ds, StrToInt(GetTemplateParam('PAR1')) );

     WriteMenToSpr(m,ds);
     ds.Fld('Zarm').AsString:=sAdd2+ds.Fld('Zarm').AsString;
     ds.Post;
   end;
end;

//--------------------------------------------------------------------------------------------
// Справка фактической эксплуатации и принадлежности капстроения (с лицевого счета)  FROM_LIC
function SprFE(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('GOD_VOZV').AsString := LicSchet.Fld('GOD_VOZV').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('GOSAKT_S').AsString := LicSchet.Fld('GOSAKT_S').AsString;
     ds.Fld('GOSAKT_N').AsString := LicSchet.Fld('GOSAKT_N').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'Д');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Д');
     ds.Fld('KomuT').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'Р');
//     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Р');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
//     ds.Fld('FIO_RUK').AsString := FIORukov();
//     ds.Fld('FIO_SEK').AsString := FIOSecretar();

     WritePodpis(ds,31);

     if LicSchet.Predst='' 
       then ds.Fld('POMES').AsString  := 'одноквартирного'
       else ds.Fld('POMES').AsString  := LicSchet.Predst;

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('ONO').AsString := 'ему' ;
      end else begin
        ds.Fld('ONO').AsString := 'ей' ;
      end;
     ds.Post;
   end;
end;

//-------------------------------------------------------------------------------------
// Справка фактической эксплуатации и принадлежности капстроения (адрес)   FROM_ADRES
function SprFE_Adres(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim,strYear : String;
   slOwners: TStringList;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     adr := Adres;
     m := adr.Mens;
//     strKomu := m.FIO;
//     strYear:='';
//     if m.Fld('DATER').AsString<>'' then begin
//       strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+' г.р.';
//     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('PLOSH_ALL').AsString := adr.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := adr.Fld('PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'Д');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Д');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('DOP_STROEN').AsString := adr.Fld('DOP_STROEN').AsString;
     ds.Fld('PLOSH_ZDAN').AsString := adr.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('GOD_VOZV').AsString := adr.Fld('GOD_VOZV').AsString;
//     ds.Fld('VSEGO').AsString := adr.Fld('VSEGO').AsString;
//     ds.Fld('GOSAKT_S').AsString := adr.Fld('GOSAKT_S').AsString;
//     ds.Fld('GOSAKT_N').AsString := adr.Fld('GOSAKT_N').AsString;

     WritePodpis(ds,14);

     WriteMenToSpr(m,ds);

     ds.Fld('TYPEHOUSE').AsString:=GetPredst(Adres.Fld('PREDST').AsString,'частный дом','NAME');
  
   end;
end;

//-------------------------------------------------------------------------------------------
// Карточка учета пустующего дома
function KartPust(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,q, dsOwn: TDataSet;
   m : TMens;
   adr : TAdresLic;
   s,sNaslFIO,sNaslAdres,sDate,sLic,sSQL:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
//    OpenMessage(' Формирование списка ... ','',10);
     adr:=Adres;
//     s:=dmBase.AdresFromID(DateFiks,adr.Fld('id').AsString,false);
//     adr:=Adres;
     sSQL := 'SELECT date_likv FROM ЛицевыеСчета WHERE adres_id='+adr.Fld('ID').AsString+' ORDER BY date_likv';
     q:=dbOpenSQL(sSQL,'');
     q.Last;
     if not q.Fld('DATE_LIKV').IsNull
       then sDate:=DatePropis(q.Fld('DATE_LIKV').AsDateTime,3)
       else sDate:='';
     dbClose(q);
     ds.Edit;
     dsOwn:=adr.HouseOwners;
     dsOwn.First;
     sNaslFIO:='';
     sNaslAdres:='';
     while not dsOwn.Eof do begin
       sNaslFIO:=sNaslFIO+dsOwn.FieldByName('NAME').AsString+', ';
       sNaslAdres:=sNaslAdres+dsOwn.FieldByName('ADRES').AsString+', ';
       dsOwn.Next;
     end;
     dsOwn.First;
//FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
//     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('PUNKT').AsString := adr.Punkt;
     ds.Fld('UL').AsString := adr.Ulica;
     ds.Fld('DOM').AsString := adr.Fld('DOM').AsString; //!!! иногда бывают глюки adr.Dom;
     ds.Fld('DATE_LIKV').AsString := sDate;
     ds.Fld('GOD_POST').AsString := adr.Fld('GOD_VOZV').AsString;
     ds.Fld('MAT_STEN').AsString := AnsiLowerCase(SeekValueSpr('SprMatSten','ID',adr.Fld('MAT_STEN').AsString,'NAME'));
     ds.Fld('PLOSH_ZDAN').AsString := adr.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('PLOSH_ALL').AsString := adr.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := adr.Fld('PLOSH_GIL').AsString;
     ds.Fld('PLOSH_UCH').AsString := adr.Fld('PLOSH_UCH').AsString;
     ds.Fld('HOZ_POST').AsString := adr.Fld('DOP_STROEN').AsString;
     ds.Fld('SOST').AsString := '';
     ds.Fld('NASL_FIO').AsString := Copy(sNaslFIO,1,Length(sNaslFIO)-2);
     ds.Fld('NASL_ADRES').AsString := Copy(sNaslAdres,1,Length(sNaslAdres)-2);
     ds.Fld('NASL_DOK').AsString := '';
     ds.Fld('UVED').AsString := '';
     ds.Fld('PREDP').AsString := '';
     ds.Post;
  end;
end;
//-------------------------------------------------------------------------------------------
// Справка-выписка из лицевого счета в БТИ (участок в частную собственность не передавался)  FROM_LIC
function SprBTI(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'Р');
     ds.Fld('AdrOR').AsString := FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('Dom').AsString := adr.Dom;
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;

     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Post;
     strNanim:='';
     m.First;
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // наниматель
         strNanim := m.FIO;
       end;
       if AddMenToSprav(m,nID) then begin
//       if (nID<>m.Fld('ID_INTERNAL').AsInteger) and
//     	 (m.Fld('PROPIS').AsBoolean=true) and             // вкл. только прописанных
//         (m.Fld('PRESENT').AsBoolean=true) then begin // вкл. только присутствующих
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='гражданином';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('GRAG').AsString:=s;
     ds.Fld('SOBSTV').AsString:=strSobstv;
     ds.Post;
   end;
end;

  // Справка-выписка из лицевого счета в БТИ (участок передан в частную собственность)
function SprBTIP(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'Р');
     ds.Fld('AdrOR').AsString := FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('Dom').AsString := adr.Dom;
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('GOSAKT_S').AsString := LicSchet.Fld('GOSAKT_S').AsString;
     ds.Fld('GOSAKT_N').AsString := LicSchet.Fld('GOSAKT_N').AsString;
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;

     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Post;

     m.First;
     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // наниматель
         strNanim := m.FIO;
       end;
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='гражданином';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=s;       // !!!
     ds.Fld('SOBSTV').AsString:=strSobstv;
     ds.Post;
   end;
end;

  // Справка о нуждаемости в улучшении жилищных условий
function SprJU(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strKomu, strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     strKomu := m.FIO;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('PRIL').AsString := getPril(2,'PRIL_GKH28',12);  // 2-печать полностью
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     s:=SpecGrafToStr(m,8,0);  // паспортные данные
     if s<>'' 
       then ds.Fld('Komu').AsString := ds.Fld('Komu').AsString + ', ' + s;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'П');

     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);
     WritePodpis(ds,4);

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Grag').AsString := 'Гражданин';
        ds.Fld('ONO').AsString := 'он';
        ds.Fld('Vkl').AsString := 'включен' ;
        ds.Fld('Proj').AsString := 'проживает' ;
        ds.Fld('Zarm').AsString := 'зарегистрированный' ;
      end else begin
        ds.Fld('Grag').AsString := 'Гражданка';
        ds.Fld('ONO').AsString := 'она';
        ds.Fld('Vkl').AsString := 'включена' ;
        ds.Fld('Proj').AsString := 'проживает' ;
        ds.Fld('Zarm').AsString := 'зарегистрированная' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;

     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

  // Справка о начисленной жилищной квоте
function SprJK(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   cPol,sOtnosh :String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     cPol:=m.Fld('POL').AsString;
     ds.Fld('Grag').AsString:=GetNameAsPol('гражданину',cPol);
     ds.Fld('Komu').AsString:=GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'Д');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);

     WritePodpis(ds,6);

     ds.Fld('ONO').AsString:=GetNameAsPol('ему',cPol);
     ds.Fld('Proj').AsString:=GetNameAsPol('проживающего',cPol+'2');
     ds.Fld('Zarm').AsString:=GetNameAsPol('зарегистрирован',cPol+'2');

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;

     while not m.Eof do begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
//       end;
       m.Next;
     end;
     m.First;
   end;
end;

  // Справка о нуждаемости в топливе
function SprTop(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('FIO_SEK').AsString := FIOSecretar();
     ds.Fld('SP_TOPLIVO').AsString := ParamAsString('SP_TOPLIVO');

     if m.Fld('POL').AsString='М' then begin
//        ds.Fld('ONO').AsString := 'он' ;
        ds.Fld('Zar').AsString := 'зарегистрирован' ;
      end else begin
//        ds.Fld('ONO').AsString := 'она' ;
        ds.Fld('Zar').AsString := 'зарегистрирована' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
   end;
end;

// Архивная справка о рождении восстановленная 
function SPR_ARX_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     SetSrokDv(ds,0); 
     if GlobalTask.ParamAsString('ARXIV')='1' then begin
     ds.Fld('NAME_SPR').AsString :='АРХИВНАЯ    ';
     ds.Fld('NAME_ORG').AsString :='';
     end else begin
     ds.Fld('NAME_SPR').AsString :='';
     ds.Fld('NAME_ORG').AsString :='архива ';
     end;
     ds.Fld('ARX_ADRESAT').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
     if DokZAGS.Fld('ONLYGOD').AsBoolean
       then ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,7)+'г.'
       else ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('GOSUD,FNAME;OBL,;;;',1);     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;RAION;GOROD,B_GOROD;',1);     
     ds.Fld('FIO_ON').AsString := DokZAGS.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;
   

     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('ON_NATION').AsString,'NAME_M',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('ONA_NATION').AsString,'NAME_G',', ');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;

     if DokZAGS.Fld('IZMEN').AsString='' then begin
       if GetTemplateParam('PAR1')='1' then begin
         ds.Fld('ADD_TEXT').AsString := 'Изменения, исправления, дополнения в запись акта о рождении не'+chr(160)+'вносились.';
       end;
       if GetTemplateParam('PAR1')='2' then begin
         if DokZAGS.Fld('VOSSTAN').AsBoolean
           then ds.Fld('ADD_TEXT').AsString:=''
           else ds.Fld('ADD_TEXT').AsString:='Запись об отце произведена на основании заявления матери, не'+chr(160)+'состоящей в браке, в соответствии со статьёй 55 Кодекса Республики Беларусь о браке и семье.'+chr(13);
         ds.Fld('ADD_TEXT2').AsString:='Изменения, исправления, дополнения в запись акта о рождении не'+chr(160)+'вносились.';
       end;
     end else begin
       ds.Fld('ADD_TEXT').AsString := DokZAGS.Fld('IZMEN').AsString;
     end;
     ds.Post;
   end;
end;

// Справка (разрешение) о въезде в пограничную зону
function SprPZ(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('KNAME').AsString := ParamAsString('KNAME');
     ds.Fld('FIO_SEK').AsString := FIOSecretar();

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Zarm').AsString := 'проживает' ;
        ds.Fld('Ego').AsString := 'его' ;
      end else begin
        ds.Fld('Zarm').AsString := 'проживает' ;
        ds.Fld('Ego').AsString := 'ее' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
   end;
end;

// Извещение о родителе иностранце
function IZV_INOSTR(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
  begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);     
     ds.Fld('KUDA').AsString := GetAdresat('ADRES_MIGR');
     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     ds.Fld('REB').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'Р');
     ds.Fld('INOST').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','И');
     ds.Fld('RB').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','И');
     ds.Fld('GR_INOST').AsString :=SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME'); 
     ds.Fld('GR_RB').AsString :=SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME');    
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;   
   end;
end;

// Извещение о браке с иностранцем
function IZV_INOST(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     
     ds.Fld('KUDA').AsString := GetAdresat('ADRES_MIGR');

     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Т');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Т');
     if  DokZAGS.Fld('ON_GRAG').AsString=IntToStr(defGrag) then begin
       ds.Fld('GR_RB').AsString := 'гражданином';
       ds.Fld('GR_INOST').AsString := 'гражданкой';
       ds.Fld('RB').AsString := on;
       ds.Fld('INOST').AsString := ona;
       ds.Fld('STR').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME');
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ON_GRAG',' '); //SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME');
       end
     else begin
       ds.Fld('GR_RB').AsString := 'гражданкой';
       ds.Fld('GR_INOST').AsString := 'гражданином';
       ds.Fld('RB').AsString := ona;
       ds.Fld('INOST').AsString := on;     
       ds.Fld('STR').AsString :=DokZags.getGrag('ON_GRAG',' '); // SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME')+' '+DokZAGS.Fld('ON_GRAG_ADD').AsString; 
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME')+' '+DokZAGS.Fld('ON_GRAG_ADD').AsString;    
     end;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;   
   end;
end;

// Извещение о браке с иностранцем (место рождения, жительства)
function IZV_INOST1(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona,on_dr,ona_dr,on_mr,ona_mr,on_mj,ona_mj: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('KUDA').AsString := GetAdresat('ADRES_MIGR');

     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Т');
     on_dr:=DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Т');
     ona_dr:=DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
     on_mr := DokZAGS.GetAdres2('ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION;ON_GOROD,ON_B_GOROD;',3);
     ona_mr := DokZAGS.GetAdres2('ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION;ONA_GOROD,ONA_B_GOROD;',3);
     on_mj := DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3); 
     ona_mj := DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3); 

     if  DokZAGS.Fld('ON_GRAG').AsString=IntToStr(defGrag) then begin
       ds.Fld('GR_RB').AsString := 'гражданином';
       ds.Fld('GR_INOST').AsString := 'гражданкой';
       ds.Fld('RB').AsString := on;
       ds.Fld('INOST').AsString := ona;
       ds.Fld('STR').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME');
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ON_GRAG',' '); //SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME');
       ds.Fld('G_RB').AsString :=', '+on_dr+' г.р., ';
       ds.Fld('G_IN').AsString := ', '+ona_dr+' г.р., ';
       ds.Fld('MR_RB').AsString :='место рождения: '+on_mr;
       ds.Fld('MR_IN').AsString :='место рождения: '+ona_mr;
       ds.Fld('MG_RB').AsString :=' место жительства: '+on_mj;
       ds.Fld('MG_IN').AsString :=' место жительства: '+ona_mj;
       end
     else begin
       ds.Fld('GR_RB').AsString := 'гражданкой';
       ds.Fld('GR_INOST').AsString := 'гражданином';
       ds.Fld('RB').AsString := ona;
       ds.Fld('INOST').AsString := on;     
       ds.Fld('STR').AsString :=DokZags.getGrag('ON_GRAG',' '); // SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME'); 
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ONA_GRAG',' '); // SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME'); 
       ds.Fld('G_RB').AsString :=', '+ona_dr+' г.р., ';
       ds.Fld('G_IN').AsString := ', '+on_dr+' г.р., ';  
       ds.Fld('MR_RB').AsString :='место рождения: '+ona_mr;
       ds.Fld('MR_IN').AsString :='место рождения: '+on_mr; 
       ds.Fld('MG_RB').AsString :=' место жительства: '+ona_mj;
       ds.Fld('MG_IN').AsString :=' место жительства: '+on_mj;
     end;
     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'М','И');//DokZAGS.Fld('ON_FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'Ж','И');//DokZAGS.Fld('ONA_FamiliaP').AsString;

     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;   
   end;
end;

// Извещение о расторжении брака с иностранцем
function IZV_RB_INOST(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     
     ds.Fld('KUDA').AsString := GetAdresat('ADRES_MIGR');

     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Т');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Т');
     if  DokZAGS.Fld('ON_GRAG').AsString=IntToStr(defGrag) then begin
       ds.Fld('GR_RB').AsString := 'гражданином';
       ds.Fld('GR_INOST').AsString := 'гражданкой';
       ds.Fld('RB').AsString := on;
       ds.Fld('INOST').AsString := ona;
       ds.Fld('STR').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME');
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ON_GRAG',' '); //SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME');
       end
     else begin
       ds.Fld('GR_RB').AsString := 'гражданкой';
       ds.Fld('GR_INOST').AsString := 'гражданином';
       ds.Fld('RB').AsString := ona;
       ds.Fld('INOST').AsString := on;     
       ds.Fld('STR').AsString :=DokZags.getGrag('ON_GRAG',' '); // SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME')+' '+DokZAGS.Fld('ON_GRAG_ADD').AsString; 
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME')+' '+DokZAGS.Fld('ON_GRAG_ADD').AsString;    
     end;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;   
   end;
end;

// Извещение о расторжении брака с иностранцем (место рождения, жительства)
function IZV_RB_INOST1(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona,on_dr,ona_dr,on_mr,ona_mr,on_mj,ona_mj: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('KUDA').AsString := GetAdresat('ADRES_MIGR');

     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Т');
     on_dr:=DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Т');
     ona_dr:=DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
     on_mr := DokZAGS.GetAdres2('ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION;ON_GOROD,ON_B_GOROD;',3);
     ona_mr := DokZAGS.GetAdres2('ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION;ONA_GOROD,ONA_B_GOROD;',3);
     on_mj := DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3); 
     ona_mj := DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3); 

     if  DokZAGS.Fld('ON_GRAG').AsString=IntToStr(defGrag) then begin
       ds.Fld('GR_RB').AsString := 'гражданином';
       ds.Fld('GR_INOST').AsString := 'гражданкой';
       ds.Fld('RB').AsString := on;
       ds.Fld('INOST').AsString := ona;
       ds.Fld('STR').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME');
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ON_GRAG',' '); //SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME');
       ds.Fld('G_RB').AsString :=', '+on_dr+' г.р., ';
       ds.Fld('G_IN').AsString := ', '+ona_dr+' г.р., ';
       ds.Fld('MR_RB').AsString :='место рождения: '+on_mr;
       ds.Fld('MR_IN').AsString :='место рождения: '+ona_mr;
       ds.Fld('MG_RB').AsString :=' место жительства: '+on_mj;
       ds.Fld('MG_IN').AsString :=' место жительства: '+ona_mj;
       end
     else begin
       ds.Fld('GR_RB').AsString := 'гражданкой';
       ds.Fld('GR_INOST').AsString := 'гражданином';
       ds.Fld('RB').AsString := ona;
       ds.Fld('INOST').AsString := on;     
       ds.Fld('STR').AsString :=DokZags.getGrag('ON_GRAG',' '); // SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME'); 
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ONA_GRAG',' '); // SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME'); 
       ds.Fld('G_RB').AsString :=', '+ona_dr+' г.р., ';
       ds.Fld('G_IN').AsString := ', '+on_dr+' г.р., ';  
       ds.Fld('MR_RB').AsString :='место рождения: '+ona_mr;
       ds.Fld('MR_IN').AsString :='место рождения: '+on_mr; 
       ds.Fld('MG_RB').AsString :=' место жительства: '+ona_mj;
       ds.Fld('MG_IN').AsString :=' место жительства: '+on_mj;
     end;
     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'М','И');//DokZAGS.Fld('ON_FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'Ж','И');//DokZAGS.Fld('ONA_FamiliaP').AsString;

     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;   
   end;
end;

// Извещение о браке в военкомат
function IZV_BRAK(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   fiop_on,fiop_ona,fio_on,fio_ona: String;      
   idVoenkom : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     idVoenkom:=0;
     if DokZAGS.Fld('ON_VUS').AsBoolean then begin
       if DokZAGS.Fld('ON_VOENKOM').AsString=''
         then idVoenkom:=ParamAsInteger('ID_VOENKOM')
         else idVoenkom:=DokZAGS.Fld('ON_VOENKOM').AsInteger;
     end;
     if DokZAGS.Fld('ONA_VUS').AsBoolean and (idVoenkom=0) then begin
       if DokZAGS.Fld('ONA_VOENKOM').AsString=''
         then idVoenkom:=ParamAsInteger('ID_VOENKOM')
         else idVoenkom:=DokZAGS.Fld('ONA_VOENKOM').AsInteger;
     end;
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       if idVoenkom>0
         then ds.Fld('KUDA').AsString := SeekValueSpr('SprVoenkom','ID',idVoenkom,'NAME');
     end else begin
       ds.Fld('KUDA').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('MJ_ON').AsString :=DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3);   
     ds.Fld('MJ_ONA').AsString :=DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3);   
     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Т');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Т');

     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'М','И');//DokZAGS.Fld('ON_FamiliaP').AsString;

     ds.Fld('ON_DATER').AsString :=DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ds.Fld('ONA_DATER').AsString:=DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
     if DokZAGS.Fld('ON_VUS').AsBoolean then begin
       ds.Fld('FIO_ON').AsString := ds.Fld('FIO_ON').AsString+', военнообязанный';
     end;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'Ж','И');//DokZAGS.Fld('ONA_FamiliaP').AsString;
     if DokZAGS.Fld('ONA_VUS').AsBoolean then begin
       ds.Fld('FIO_ONA').AsString := ds.Fld('FIO_ONA').AsString+', военнообязанная';
     end;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о расторжении брака в военкомат
function IZV_RBV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   fiop_on,fiop_ona,fio_on,fio_ona: String;      
   idVoenkom : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     idVoenkom:=0;
     if DokZAGS.Fld('ON_VUS').AsBoolean then begin
       if DokZAGS.Fld('ON_VOENKOM').AsString=''
         then idVoenkom:=ParamAsInteger('ID_VOENKOM')
         else idVoenkom:=DokZAGS.Fld('ON_VOENKOM').AsInteger;
     end;
     if DokZAGS.Fld('ONA_VUS').AsBoolean and (idVoenkom=0) then begin
       if DokZAGS.Fld('ONA_VOENKOM').AsString=''
         then idVoenkom:=ParamAsInteger('ID_VOENKOM')
         else idVoenkom:=DokZAGS.Fld('ONA_VOENKOM').AsInteger;
     end;
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       if idVoenkom>0
         then ds.Fld('KUDA').AsString := SeekValueSpr('SprVoenkom','ID',idVoenkom,'NAME');
     end else begin
       ds.Fld('KUDA').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('MJ_ON').AsString :=DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3);   
     ds.Fld('MJ_ONA').AsString :=DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3);   
     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Т');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Т');
     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'М','И');//DokZAGS.Fld('ON_FamiliaP').AsString;
     ds.Fld('ON_DATER').AsString :=DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ds.Fld('ONA_DATER').AsString:=DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
     if DokZAGS.Fld('ON_VUS').AsBoolean then begin
       ds.Fld('FIO_ON').AsString := ds.Fld('FIO_ON').AsString+', военнообязанный';
     end;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'Ж','И');//DokZAGS.Fld('ONA_FamiliaP').AsString;
     if DokZAGS.Fld('ONA_VUS').AsBoolean then begin
       ds.Fld('FIO_ONA').AsString := ds.Fld('FIO_ONA').AsString+', военнообязанная';
     end;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение об установлении отцовства в военкомат
function IZV_UO_VOEN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       s:=DokZAGS.Fld('ON_VOENKOM').AsString;
       if s='' then s:=ParamAsString('ID_VOENKOM');
       ds.Fld('VOENKOMAT').AsString := SeekValueSpr('SprVoenkom','ID',s,'NAME');
     end else begin
       ds.Fld('VOENKOMAT').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'Р');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,3);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');

     ds.Fld('FIO_ON').AsString := GetPadegFIO(_FIO(DokZAGS,'ON_'),'М','И');//.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'Ж','И'); //DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;

     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('ONA_GOSUD,FNAME;ONA_OBL,;;;',1);     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;ONA_RAION,ONA_RNGOROD;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',1);
     ds.Fld('MESTOR2').AsString := DokZAGS.GetAdres('ON_GOSUD,FNAME;ON_OBL,;;;',1);     
     ds.Fld('MESTOR3').AsString := DokZAGS.GetAdres(';;ON_RAION,ON_RNGOROD;ON_GOROD,ON_B_GOROD;ON_GOROD_R,ON_*',1);
     ds.Fld('ON_DATER').AsString := DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ds.Fld('ONA_DATER').AsString := DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение о смерти в военкомат
function IZV_SM_VOEN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       s:=DokZAGS.Fld('VOENKOM').AsString;
       if s='' then s:=ParamAsString('ID_VOENKOM');
       ds.Fld('VOENKOMAT').AsString := SeekValueSpr('SprVoenkom','ID',s,'NAME');
     end else begin
       ds.Fld('VOENKOMAT').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'Р');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,3);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('GT_GOSUD,FName;GT_OBL,GT_B_OBL;;;',1)     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1)
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
    if DokZAGS.Fld('POL').AsString='М' then begin
      ds.Fld('Gr').AsString := 'гражданина' ;
     end else begin
      ds.Fld('Gr').AsString := 'гражданки' ;
     end;
     ds.Post;
   end;
end;

// Извещение о рождении в военкомат
function IZV_R_VOEN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       s:=DokZAGS.Fld('ON_VOENKOM').AsString;
       if s='' then s:=ParamAsString('ID_VOENKOM');
       ds.Fld('VOENKOMAT').AsString := SeekValueSpr('SprVoenkom','ID',s,'NAME')
     end else begin
       ds.Fld('VOENKOMAT').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'Р');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,3);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');

     ds.Fld('FIO_ON').AsString := GetPadegFIO(_FIO(DokZAGS,'ON_'),'М','И');//.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'Ж','И'); //DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;

     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('ONA_GOSUD,FNAME;ONA_OBL,;;;',1);     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;ONA_RAION;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',1);
     ds.Fld('MESTOR2').AsString := DokZAGS.GetAdres('ON_GOSUD,FNAME;ON_OBL,;;;',1);     
     ds.Fld('MESTOR3').AsString := DokZAGS.GetAdres(';;ON_RAION;ON_GOROD,ON_B_GOROD;ON_GOROD_R,ON_*',1);
     ds.Fld('ON_DATER').AsString := DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ds.Fld('ONA_DATER').AsString := DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

//------------------------------------------------------------------------
// Извещение о расторжении брак 
function IZV_RB(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Т');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Р');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Р');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('BRAK_ZAKL').AsString := DokZAGS.Fld('BRAK_ZAKL').AsString;
     if DokZAGS.Fld('BRAK_NOMER').AsString<>'' then begin
       ds.Fld('BRAK_ZAKL').AsString:=ds.Fld('BRAK_ZAKL').AsString+' '+DatePropis(DokZAGS.Fld('BRAK_DATE').AsDateTime,2)+' за № '+DokZAGS.Fld('BRAK_NOMER').AsString;
     end;            
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

//------------------------------------------------------------------------
// Извещение о дополнении записи акта о расторжении брака 
function IZV_RBD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   sIN,p,s,sp,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('ADRES_IZVECH').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
//     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Т');
     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     ds.Fld('ORG2').AsString := DokZAGS.NameZAGS2('','П');

     ds.Fld('FIOP_ON').AsString:=GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Т');
     ds.Fld('FIOP_ONA').AsString:=GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Т');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     if DokZAGS.ActiveON=true then begin 
       sp:='ON' ;
       p:='м';
     end else begin 
       sp:='ONA';
       p:='ж';
     end;
     sIN:=DokZAGS.Fld(sp+'_IDENTIF').AsString;
     if sIN<>'' then begin
       ds.Fld('INN').AsString:='Идентификационный номер: ';
       ds.Fld('IN').AsString:=sIN+CRLF;
     end;
     ds.Fld('MJ').AsString:=DokZAGS.GetAdres(StringReplace('@_M_GOSUD,FName;@_M_OBL,@_M_B_OBL;@_M_RAION,@_M_RNGOROD;@_M_GOROD,@_M_B_GOROD;@_M_GOROD_R,ON_M_*','@',sp),1);
     ds.Fld('FIO1').AsString := GetPadegFIO3(DokZAGS.Fld(sp+'_Familia').AsString,DokZAGS.Fld(sp+'_Name').AsString,DokZAGS.Fld(sp+'_Otch').AsString,p,'В');
     ds.Fld('FIO2').AsString := DokZAGS.Fld(sp+'_FamiliaP').AsString;
     ds.Fld('VR').AsString:='';
     ds.Fld('MR').AsString:=DokZAGS.Fld(sp+'_WORK').AsString;
     ds.Fld('OBR').AsString:=ValueFromKey('KEY_OBRAZ',DokZags.Fld(sp+'_OBRAZ').Asstring,'',false);
     ds.Fld('KOL_BRAK').AsString:=DokZags.Fld(sp+'_SEM').AsString;
     if DokZAGS.Fld(sp+'_SUM_POSHLINA').AsFloat > 0
       then s:=MoneyToStr(DokZAGS.Fld(sp+'_SUM_POSHLINA').AsFloat,0,true)+' руб. '+DokZAGS.Fld(sp+'_POSHLINA').AsString
       else s:=DokZAGS.Fld(sp+'_POSHLINA').AsString;
     ds.Fld('POSH').AsString:=s;
     ds.Fld('PASP').AsString:=DokZAGS.GetPasport(StringReplace('DOC=@_DOKUMENT;TYPE=@_DOK_TYPE;SERIA=@_DOK_SERIA;NOMER=@_DOK_NOMER;DATE=@_DOK_DATE','@',sp),0);
     if DokZAGS.Fld(sp+'_SVID_NOMER').AsString<>'' then begin
       ds.Fld('SVID').AsString:=' серия '+ DokZAGS.Fld(sp+'_SVID_SERIA').AsString+' № '+ DokZAGS.Fld(sp+'_SVID_NOMER').AsString+
                                ' от '+DatePropis(DokZAGS.Fld(sp+'_SVID_DATE').AsDateTime,3)+'г.';
     end;
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

function IZV_RB1(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,0,11,false);
     ds.Fld('ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('TEKU_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'П');
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('BRAK').AsString := DokZAGS.Fld('BRAK_ZAKL').AsString;
     if DokZAGS.Fld('BRAK_NOMER').AsString<>'' then begin
       ds.Fld('BRAK').AsString:=ds.Fld('BRAK').AsString+' '+DatePropis(DokZAGS.Fld('BRAK_DATE').AsDateTime,2)+' за № '+DokZAGS.Fld('BRAK_NOMER').AsString+'.';
     end;            
{
     if DokZAGS.Fld('TYPE_RAST').AsInteger=0 then begin
       strOsnov:='Решение суда  '+DokZAGS.Fld('SUD_NAME').AsString+' от '+DatePropis(DokZAGS.Fld('SUD_DATE').AsDateTime,3);
     end else begin
       if Trim(DokZAGS.Fld('SUD_NAME').AsString)=''                      
         then strOsnov:='Совместное заявление супругов от '+DatePropis(DokZAGS.Fld('SUD_DATE').AsDateTime,3)  
         else strOsnov:=DokZAGS.Fld('SUD_NAME').AsString+' от '+DatePropis(DokZAGS.Fld('SUD_DATE').AsDateTime,3);
     end;              
}
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к копии записи акта о рождении
function SP_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта о рождении';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к копии записи акта о смерти
function SP_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта о смерти';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropisEX(DokZAGS.Fld('DATER').AsDateTime,6,DokZAGS.Fld('ONLYGOD_R').AsInteger);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к копии записи акта о заключении брака
function SP_Brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта о заключении брака';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к копии записи акта о расторжении брака
function SP_RastBrak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта о расторжении брака';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к копии записи акта об установлении отцовства
function SP_UstOtc(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := Getadresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта об установлении отцовства';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к копии записи акта об усыновлении (удочерении)
function SP_Adopt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     if DokZAGS.Fld('POL').AsString='М' then begin
      ds.Fld('O_HCEM').AsString :='записи акта об усыновлении'; 
     end else begin
      ds.Fld('O_HCEM').AsString :='записи акта об удочерении'; 
     end;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DateR_Do').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');//
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к копии записи акта о перемене имени
function SP_ChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта о перемене имени';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
    ds.Post;
   end;
end;


// Заключение о перемене ФИО  
function Zakl(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('DATE').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);    
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'И');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('FIO').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIAdo').AsString,DokZAGS.Fld('NAMEdo').AsString,DokZAGS.Fld('OTCHdo').AsString,DokZAGS.Fld('POL').AsString,'Р');
     if DokZAGS.Fld('POL').AsString='М' then begin
      ds.Fld('TEXT1').AsString :='родившегося'; 
      ds.Fld('TEXT3').AsString :='он';
      if DokZAGS.Fld('V_OBAZAN').AsBoolean then begin
        ds.Fld('VOEN').AsString :='военнообязанный';
       // ds.Fld('UCHET').AsString := SeekValueSpr('SprVoenkom','ID',DokZAGS.Fld('VOENKOM').AsString,'NAME');
        ds.Fld('UCHET').AsString := DokZAGS.Fld('V_WHO').AsString+'.';
      end else begin
        ds.Fld('VOEN').AsString :='невоеннообязанный';
      end; 
     end else begin  
      ds.Fld('TEXT1').AsString :='родившуюся';
      ds.Fld('TEXT3').AsString :='она';        
       if DokZAGS.Fld('V_OBAZAN').AsBoolean then begin
        ds.Fld('VOEN').AsString :='военнообязанная';
        // ds.Fld('UCHET').AsString := SeekValueSpr('SprVoenkom','ID',DokZAGS.Fld('VOENKOM').AsString,'NAME');
        ds.Fld('UCHET').AsString := DokZAGS.Fld('V_WHO').AsString+'.';
       end else begin
        ds.Fld('VOEN').AsString :='невоеннообязанная';
       end; 
      end;
     ds.Fld('VOEN').AsString := FirstCharUpper(ds.Fld('VOEN').AsString)+'.';
     if DokZAGS.Fld('FAMILIAdo').AsString<>DokZAGS.Fld('FAMILIAposle').AsString then begin
      ds.Fld('TEXT2').AsString :='фамилии';
      ds.Fld('OLD').AsString :=DokZAGS.Fld('FAMILIAdo').AsString;
      ds.Fld('NEW').AsString :=DokZAGS.Fld('FAMILIAposle').AsString;
     end;
     if DokZAGS.Fld('NAMEdo').AsString<>DokZAGS.Fld('NAMEposle').AsString then begin
      ds.Fld('TEXT2').AsString :='имени'; 
      ds.Fld('OLD').AsString :=DokZAGS.Fld('NAMEdo').AsString;
      ds.Fld('NEW').AsString :=DokZAGS.Fld('NAMEposle').AsString;
     end;
     if DokZAGS.Fld('OTCHdo').AsString<>DokZAGS.Fld('OTCHposle').AsString then begin
      ds.Fld('TEXT2').AsString :='отчества'; 
      ds.Fld('OLD').AsString :=DokZAGS.Fld('OTCHdo').AsString;
      ds.Fld('NEW').AsString :=DokZAGS.Fld('OTCHposle').AsString;
     end;
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('GOSUD,FNAME;OBL,;RAION;GOROD,B_GOROD;',1);     
     ds.Fld('NOMER_AKT').AsString := DokZAGS.Fld('REG_NOMER').AsString;
     ds.Fld('DATE_AKT').AsString := DokZAGS.Fld('REG_DATE').AsString;
     ds.Fld('ORG_AKT').AsString :=  GetPadeg(DokZAGS.Fld('REG_ZAGS').AsString, 'Т');
  //   ds.Fld('NATION').AsString := DokZAGS.Fld('NATION').AsString;
     DokZags.Deti.First;
     s:='';
     while not DokZags.Deti.Eof do begin
       s:=s+DokZags.Deti.Fld('FAMILIA').AsString+' '+DokZags.Deti.Fld('NAME').AsString+' '+DokZags.Deti.Fld('OTCH').AsString+', '+DokZags.Deti.Fld('GOD_ROG').AsString+', запись № '+DokZags.Deti.Fld('ZAGS_NOMER').AsString+' от '+DokZags.Deti.Fld('ZAGS_DATE').AsString+', '+DokZags.Deti.Fld('ZAGS_NAME').AsString+'; ';
       DokZags.Deti.Next;
     end;
     DokZags.Deti.First;
     ds.Fld('DETI').AsString := s;
     if s='' then begin
       ds.Fld('TEXT_D').AsString :='Детей не имеет.';
     end else begin
       ds.Fld('TEXT_D').AsString :='Дети:';
     end;
     if DokZAGS.Fld('SEM').AsString='1'
       then ds.Fld('SEM').AsString:='Состоит в браке'
       else ds.Fld('SEM').AsString:='Не состоит в браке';
     ds.Fld('ADRES').AsString := DokZAGS.GetAdres2('M_GOSUD,FName;M_OBL,M_B_OBL;M_RAION,;M_GOROD,M_B_GOROD;M_GOROD_R',3);
     ds.Fld('DOLG').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
   end;
end;

// Сопроводительное письмо к копии восстановленной записи акта о рождении
function SP_ROGDV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='восстановленной записи акта о рождении';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к копии восстановленной записи акта о смерти
function SP_SMERTV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='восстановленной записи акта о смерти';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к копии восстановленной записи акта о заключении брака
function SP_BrakV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='восстановленной записи акта о заключении брака';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
 //    ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
 //    ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к выписке записи акта о рождении
function SP_VIP_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта о рождении';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к выписке записи акта о смерти
function SP_VIP_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта о смерти';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropisEX(DokZAGS.Fld('DATER').AsDateTime,6,DokZAGS.Fld('ONLYGOD_R').AsInteger);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к выписке записи акта о заключении брака
function SP_VIP_Brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта о заключении брака';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к выписке записи акта о расторжении брака
function SP_VIP_RastBrak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта о расторжении брака';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к выписке записи акта о перемене имени
function SP_VIP_ChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='записи акта о перемене имени';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
    ds.Post;
   end;
end;

// Сопроводительное письмо к выписке восстановленной записи акта о рождении
function SP_VIP_ROGDV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='восстановленной записи акта о рождении';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к выписке восстановленной записи акта о смерти
function SP_VIP_SMERTV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='восстановленной записи акта о смерти';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сопроводительное письмо к выписке восстановленной записи акта о заключении брака
function SP_VIP_BrakV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='восстановленной записи акта о заключении брака';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
 //    ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
 //    ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Извещение об изменении диагноза
function IZV_IZM_D(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
//     ds.Fld('DOKV').AsString  := GetPadeg(DokZAGS.Fld('DOKUMENT').AsString,'Р');
     ds.Fld('DOKV').AsString  := DokZAGS.Fld('IZMEN').AsString;
     ds.Fld('PrSm').AsString  := DokZAGS.Fld('PR_NEP_NAME').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'В');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

  // Справка о расчетах (задолженности) за ЖКУ
function SprGKU(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('KomuT').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'Р');
//     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Р');
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;
     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);

     WritePodpis(ds,8);
  
     ds.Fld('TYPEHOUSE').AsString:=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,
                                    'частный дом');

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Prog').AsString := 'проживает' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
      end else begin
        ds.Fld('Prog').AsString := 'проживает' ;
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
   end;
end;
  // Справка о последнем месте жительства 
function SprMGP(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('DATES').AsString := DatePropis(m.Fld('DATES').AsDateTime,6);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('@PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('@PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

//     WritePodpis(ds,10);
     WritePodpis(ds, StrToInt(GetTemplateParam('PAR1')) );

     WriteMenToSpr(m,ds);
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);

     if ds.Fld('Zarm').AsString='проживает' 
       then ds.Fld('Zarm').AsString:=GetNameAsPol('проживал',m.Fld('POL').AsString)+' ('+GetNameAsPol('зарегистрирован',m.Fld('POL').AsString)+') по месту жительства';

//     ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'частный дом');
     ds.Fld('TYPEHOUSE').AsString:=GetPredst(LicSchet.Fld('PREDST').AsString,'частный дом','NAME2');

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;
     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // наниматель
         strNanim := m.FIO;
       end;
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='является';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;
     ds.Post;
   end;
end;
  // Справка о месте захоронения родственников 
function SprMZR(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti, dsAktSm: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG, 
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('DATES').AsString := DatePropis(m.Fld('DATES').AsDateTime,3);

     WritePodpis(ds,11);

     ds.Fld('SVID_NOMER').AsString := '           ';
     ds.Fld('SVID_DATE').AsString  := '           ';
     dsAktSm:= dmBase.GetDataSet('АктыСмертей');
     if (m.Fld('AKT_SMER_NOMER').AsString<>'') and not m.Fld('AKT_SMER_DATE').IsNull  then begin
     if dbLocate(dsAktSm,'NOMER;DATEZ',[m.Fld('AKT_SMER_NOMER').AsString,m.Fld('AKT_SMER_DATE').AsDateTime],'') then begin
       ds.Fld('SVID_NOMER').AsString :=dsAktSm.Fld('SVID_SERIA').AsString+' № '+dsAktSm.Fld('SVID_NOMER').AsString;
       ds.Fld('SVID_DATE').AsString  :=DatePropis(dsAktSm.Fld('DATESV').AsDateTime,3);
     end;
     end;
   end;
end;

// Подтверждение даты регистрации брака
function PODTV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;      
   s,ss : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     if GetTemplateParam('PAR1')='ZV'   // если заявление
       then ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEB').AsDateTime,6)
       else ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Р');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Р');

     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       if DokZAGS.ActiveON = true  then s:='' else s:='A';
       ss:=GetPadegFIO3(DokZAGS.Fld('ON'+s+'_Familia').AsString,DokZAGS.Fld('ON'+s+'_Name').AsString,DokZAGS.Fld('ON'+s+'_Otch').AsString,'м','И');
       ds.Fld('ARX_ADRESAT').AsString:=ss+CRLF+DokZAGS.GetAdres2('ON'+s+'_M_GOSUD,FName;ON'+s+'_M_OBL,ON'+s+'_M_B_OBL;ON'+s+'_M_RAION,ON'+s+'_M_RNGOROD;ON'+s+'_M_GOROD,ON'+s+'_M_B_GOROD;ON'+s+'_M_GOROD_R,ON'+s+'_M_*',3);
     end else begin
       ds.Fld('ARX_ADRESAT').AsString:=DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','И');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Fld('TELEFON').AsString := ParamAsString('TELEFON');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Post;
   end;
end;
//--------------------------------------------------------------------
// Подтверждение даты расторжения брака
function PODTVR(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;      
   s,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
 //    ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString; поле отсутствует
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');
     if GetTemplateParam('PAR1')='ZV'   // если заявление
       then ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEB').AsDateTime,6)
       else ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Р');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Р');
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','И');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;

     ds.Fld('TELEFON').AsString := ParamAsString('TELEFON');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Post;
   end;
end;
//--------------------------------------------------------------------
// Извещение о лишении родительских прав (з/а о рождении)
function IZV_Lishen(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds, spruch,dsDeti: TDataSet;
  s,ss,m,j : String;
  sPol:String;
  n:Integer;
begin
   result:=true;
   if (DokZAGS.Fld('ON_DATE_LR').AsString='') and (DokZAGS.Fld('ONA_DATE_LR').AsString='') then begin
     PutError('Никто из родителей не лишен родительских прав.');
     result:=false;
   end;
   if not DokZAGS.Fld('ON_DATE_LR').IsNull and  not DokZAGS.Fld('ONA_DATE_LR').IsNull then begin
     if DokZAGS.Fld('ON_DATE_LR').AsString=DokZAGS.Fld('ONA_DATE_LR').AsString then begin
       n:=0;
     end else begin
  //   (qtWarning, qtError, qtInformation, qtConfirmation, qtCustom)
       n:=Question( 'Кто лишен родительских прав ?', 'Отец;Мать;Отказ', 'Выбор', 0, 2, qtConfirmation, 0);
       if n=3 then result:=false;
     end;
   end else if not DokZAGS.Fld('ON_DATE_LR').IsNull then begin
     n:=1;
   end else if not DokZAGS.Fld('ONA_DATE_LR').IsNull then begin
     n:=2;
   end;
   ds:=GetTemplateDataSet('MAIN');
   if (ds<>nil) and result then begin
     if n=1 then begin 
       sPol:='ON';
       ss:='отца'; 
     end else if n=2 then begin
       sPol:='ONA';
       ss:='матери'; 
     end else begin  // оба лишены прав
       ss:='отца и матери';
       sPol:='ONA';
     end;
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString   := FU(GetPadeg(GlobalTask.ParamAsString('NAME'),'Т'));
     ds.Fld('ORGAN_ZAGS_S').AsString := DokZAGS.NameZAGS2('','Т');
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIO').AsString := GetPadegFIO3(DokZAGS.Fld('Familia').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,DokZAGS.Fld('POL').AsString,'В');
     ds.Fld('WHO').AsString:=ss;
     ds.Fld('SUD_NAME').AsString:=DokZAGS.Fld(sPol+'_SUD_LR').AsString;
     ds.Fld('SUD_DATE').AsString:=DatePropis(DokZAGS.Fld(sPol+'_SUDD_LR').AsDateTime,TYPE_DATE_IZV);
     ds.Fld('SILA_DATE').AsString:=DatePropis(DokZAGS.Fld(sPol+'_DATE_LR').AsDateTime,TYPE_DATE_IZV);

     if (DokZAGS.Fld('ARX_ADRESAT').AsString='')
       then ds.Fld('ADRES_IZVECH').AsString := ds.Fld('SUD_NAME').AsString
       else ds.Fld('ADRES_IZVECH').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;

     ds.Post;
   end;
end;

// Извещение о расторжени брак (з/а о браке)
function IZV_RBBr(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if (DokZAGS.Fld('TYPE_RAST').AsInteger=2) or (DokZAGS.Fld('TYPE_RAST').AsInteger=4)
       then ds.Fld('ADRES_IZVECH').AsString := GetAdresat2('ADRES_IZVECH','SUDNAME',true,'Суд ')
       else ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');

     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','П');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','В');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','В');
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
//     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
     ds.Fld('IZMEN').AsString :=Chr(13)+GetBrakRast(DokZAGS.getTable('Dokument'), '','','');
     if DokZAGS.Fld('ONA_FAM_R').AsString<>'' then begin
       ds.Fld('FIO_POSLE').AsString:='Фамилии после расторжения брака: у него - '+DokZAGS.Fld('ON_FAM_R').AsString+', у неё - '+DokZAGS.Fld('ONA_FAM_R').AsString+'.' ;
     end;
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Fld('TELEFON').AsString := ParamAsString('TELEFON');
     ds.Post;
   end;
end;

// Извещение об установлении отцовства для бухгалтерии по месту работы матери
function IZV_Buh(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'Р');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'Ж','И'); //.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('ONA_GOSUD,FNAME;ONA_OBL,;;;',1);     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;ONA_RAION,ONA_RNGOROD;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',1);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Заключение о снижении брачного возраста
function ZAKL_SBV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds, spruch,dsDeti: TDataSet;
  nON,nONA:Integer;
  sON,sONA,sPAR:String;
  lGetON:Boolean;
  dBrak:TDateTime;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
//     if IDProg()='ZAGS'  then begin
      ds.Fld('TEMA').AsString := 'ЗАКЛЮЧЕНИЕ' ;
//     end else begin
//      ds.Fld('TEMA').AsString := 'РАСПОРЯЖЕНИЕ' ;
//     end;
     if GetTemplateParam('PAR1')='1'
       then dBrak:=DokZAGS.Fld('DATEZ').AsDateTime
       else dBrak:=DokZAGS.Fld('DATEB').AsDateTime;   // дата брака в заявлении
     nON:=GetCountYear(dBrak,DokZAGS.Fld('ON_DATER').AsDateTime);
     if nON<18 then sON:='несовершеннолетнего'  else sON:='совершеннолетнего';
     nONA:=GetCountYear(dBrak,DokZAGS.Fld('ONA_DATER').AsDateTime);
     if nONA<18 then sONA:='несовершеннолетней'  else sONA:='совершеннолетней';

     if (nON>=18) and (nONA>=18) then begin
         PutError('Жених и невеста совершеннолетние');
         result:=false;
     end else if (nON<18) and (nONA<18) then begin
        lGetON:=DokZAGS.ActiveON;
     end else if (nON<18) then begin
        lGetON:=true;
     end else begin
        lGetON:=false;
     end;

     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('GOROD').AsString := GlobalTask.ParamAsString('GOROD');
     ds.Fld('DATEZ').AsString := DatePropis(dBrak,3);
     ds.Fld('ORG').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р');

     ds.Fld('JEN_ADR').AsString :=sON+' жениха '+GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Р')+' '+
           DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6)+' рождения, проживающего по адресу: '+
           DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3);
     ds.Fld('NEV_ADR').AsString :=sONA+' невесты '+GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Р')+' '+
           DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6)+' рождения, проживающей по адресу: '+
           DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3);

     If lGetON=true  then begin
       ds.Fld('POL').AsString :='несовершеннолетнему';
       ds.Fld('NEVJEN').AsString :='жених'; 
       ds.Fld('NEVJEN3').AsString :='несовершеннолетнему жениху'; 
       ds.Fld('ONONA').AsString :='ему';
       ds.Fld('DATER').AsString :=DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
       ds.Fld('FIOP').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'м','Д');
       ds.Fld('PASPORT').AsString := DokZAGS.GetPasport('DOC=ON_DOKUMENT;TYPE=ON_DOK_TYPE;SERIA=ON_DOK_SERIA;NOMER=ON_DOK_NOMER;DATE=ON_DOK_DATE',0);
       ds.Fld('ISPOL').AsString := DokZAGS.VozrastPropisON(0);
       ds.Fld('SNIJV').AsString := DokZAGS.VozrastPropisON(1);
     end else begin 
       ds.Fld('POL').AsString :='несовершеннолетней';
       ds.Fld('NEVJEN').AsString :='невеста'; 
       ds.Fld('NEVJEN3').AsString :='несовершеннолетней невесте'; 
       ds.Fld('ONONA').AsString :='ей';
       ds.Fld('DATER').AsString :=DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
       ds.Fld('FIOP').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'ж','Д');
       ds.Fld('PASPORT').AsString := DokZAGS.GetPasport('DOC=ONA_DOKUMENT;TYPE=ONA_DOK_TYPE;SERIA=ONA_DOK_SERIA;NOMER=ONA_DOK_NOMER;DATE=ONA_DOK_DATE',0);
       ds.Fld('ISPOL').AsString := DokZAGS.VozrastPropisONA(0);
       ds.Fld('SNIJV').AsString := DokZAGS.VozrastPropisONA(1);
     end; 
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('DOLG_RUK_ZAGS1').AsString :=Zags_Sprav_Dolg;
      ds.Fld('DOLG_RUK_ZAGS1').AsString :=AnsiLowerCase(Copy(ds.Fld('DOLG_RUK_ZAGS1').AsString,1,1))+Copy(ds.Fld('DOLG_RUK_ZAGS1').AsString,2,300);
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сообщение о регистрации смерти по решению суда
function Soob_Sud(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
//     ds.Fld('DOKV').AsString  := GetPadeg(DokZAGS.Fld('DOKUMENT').AsString,'Р');
     ds.Fld('DOKV').AsString  := DokZAGS.Fld('DOKUMENT').AsString;
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'Р');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// Сообщение о регистрации смерти иностранного гражданина 
function Soob_In(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,sPol,d,v,k: String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
    if (DokZAGS.Fld('GRAG').AsString='112') or (DokZAGS.Fld('GRAG').AsInteger>990 ) then begin 
        PutError(' Сообщение выдается только для иностранных граждан!');
       result:=false;
       exit;
    end;
      if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     s:='';
     if ParamAsBoolean('SOOB_IN_ADRES') then begin
       s:='Место рождения: '+DokZAGS.GetAdres2('RG_GOSUD,FNAME;+RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',1)+chr(13);     
       s:=s+'Место жительства: '+DokZAGS.GetAdres('GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1)+chr(13);
     end;
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('$MID');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     sPol:=DokZAGS.Fld('POL').AsString;
     ds.Fld('GRAG').AsString := GetNameAsPol('гражданина',sPol)+' '+SeekValueSpr('СпрСтран','ID',DokZAGS.Fld('GRAG').AsString,'GNAME');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'Р')+'.';
     if not DokZAGS.Fld('DATER').IsNull
       then ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+chr(13)+'Дата рождения '+ DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     if not DokZAGS.Fld('DATES').IsNull
       then ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+chr(13)+'Дата смерти '+ DatePropis(DokZAGS.Fld('DATES').AsDateTime,6);

     ds.Fld('ADD_TEXT').AsString:=s;
     if DokZAGS.Fld('SDAN_DOK').AsString<>'' then begin
       if DokZAGS.Fld('IS_SDAN_DOK').AsBoolean then k:='Сдан документ: ' else k:='Документ: ';
       ds.Fld('ADD_TEXT').AsString:=ds.Fld('ADD_TEXT').AsString+k+DokZAGS.Fld('SDAN_DOK').AsString+'.'+chr(13)
     end;
     ds.Fld('ADD_TEXT').AsString:=ds.Fld('ADD_TEXT').AsString+'Заявитель: '+DokZAGS.Fld('DECL').AsString+'.';

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

  // Справка о месте жительства и составе семьи (человек)
function SprMGSch(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   strNanim,strYear : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := Men;
     adr := Men.Adres;
     strKomu := m.FIO;
     strYear:='';
     if m.Fld('DATER').AsString<>'' then begin
       strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+' г.р.';
     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Fld('Familia').AsString,m.Fld('Name').AsString,m.Fld('Otch').AsString,m.Fld('POL').AsString,'И')+strYear;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('NAME_DATER').AsString := 'Год рождения';
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

     WritePodpis(ds,17);

     WriteMenToSpr(m,ds);

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     m.First;
     nn:=0;
     strNanim:='';
     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='является';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;
     ds.Post;
   end;
end;

  // Справка о месте жительства (человек)
function SprMGch(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := Men;
      adr := Men.Adres;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

     WritePodpis(ds,18);

     WriteMenToSpr(m,ds);

     ds.Post;
   end;
end;

// Справка в налоговую (о подсобном хозяйстве) Лицевой счет. + справка (на 1 страницу)
function SpxNalLS(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k,i,pu: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim,strYear : String;
   nnn : Extended;
   fld:TField;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Д'); 
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'Д');
     if m.Fld('PASP_NOMER').AsString='' then begin
       ds.Fld('PPP_TEXT').AsString :='---';
     end else begin
       ps:= m.Fld('PASP_SERIA').AsString;
       d:= m.Fld('PASP_NOMER').AsString;
       v:= GetPadeg(m.Fld('PASP_VIDAN').AsString,'Т');
       k:= DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
       ds.Fld('PPP_TEXT').AsString := ps+d+' выдан '+k+' '+v;
     end; 
     if m.Fld('Lich_Nomer').AsString='' then begin
       ds.Fld('PPP_TEXT2').AsString :='';
     end else begin
       i:= m.Fld('Lich_Nomer').AsString;
       ds.Fld('PPP_TEXT2').AsString := ', идентификационный номер '+i;
     end; 
     ds.Fld('Adres').AsString := adr.GetAdres;
     ds.Fld('AdresMG').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     if m.Fld('POL').AsString='М' then begin
        ds.Fld('ON').AsString := 'ему' ;
      end else begin
        ds.Fld('ON').AsString := 'ей' ;
      end;
     fld:=LicSchet.Fld('VSEGO');
     if fld<>nil then begin
       nnn := fld.AsFloat-LicSchet.Fld('POSTR').AsFloat;  // приусадебный -LicSchet.Fld('PRIUSAD').AsFloat;
       if nnn>0  then ds.Fld('VSEGO').AsString := FormatFloat('####0.####',nnn)+'га';
     end;
     fld:=ds.FindField('DOLG_PODP1');
     if fld=nil then begin  // для Минска
       if ParamAsString('СПЕЦИАЛИСТ')='' then begin
         ds.Fld('FIO_RUK').AsString := FIORukov();
       end else begin
         ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       end; 
     end else begin        // для всех остальных
       WritePodpis(ds,5);
     end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('Adres').AsString := adr.GetAdres;
         ds.Fld('AdresMG').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

  // Справка в налоговую (о подсобном хозяйстве) Человек
function SpxNal(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k,i: String;
   m : TMens;
   adr : TAdresLic;
   nnn : Extended;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := Men;
      adr := Men.Adres;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'Д');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Д');
     if m.Fld('PASP_NOMER').AsString='' then begin
       ds.Fld('PPP_TEXT').AsString :='---';
     end else begin
       ps:= m.Fld('PASP_SERIA').AsString;
       d:= m.Fld('PASP_NOMER').AsString;
       v:= GetPadeg(m.Fld('PASP_VIDAN').AsString,'Т');
       k:= DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
       ds.Fld('PPP_TEXT').AsString := ps+d+' выдан '+k+' '+v;
     end; 
     if m.Fld('Lich_Nomer').AsString='' then begin
       ds.Fld('PPP_TEXT2').AsString :='';
     end else begin
       i:= m.Fld('Lich_Nomer').AsString;
       ds.Fld('PPP_TEXT2').AsString := ', идентификационный номер '+i;
     end; 
     ds.Fld('Adres').AsString := adr.GetAdres;
//     ds.Fld('Adres').AsString:=dmBase.AdresFromID(DateFiks,m.Fld('ADRES_ID').AsString,false);
//     nnn:=dmBase.ReadPropAsFloat(DateFiks, m.Fld('ADRES_ID').AsInteger, 'PLOSH_UCH');
//     if nnn>0  then ds.Fld('VSEGO').AsString := FormatFloat('####0.####',nnn)+'га';
     ds.Fld('AdresMG').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     if m.Fld('POL').AsString='М' then begin
        ds.Fld('ON').AsString := 'ему' ;
      end else begin
        ds.Fld('ON').AsString := 'ей' ;
      end;
     WritePodpis(ds,16);

     ds.Post;
   end;
end;

  // Повестка ВУС, Повестка призывнику, Повестка гражданину, Почтовая карточка общего вызова
function POV_vus(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds:TDataSet;
   strGr,ps,par1: String;
   m : TMens;
   adr : TAdresLic;
   nPr : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := Men;
     adr := Men.Adres;
     strGR:='';
     par1:=GetTemplateParam('PAR1');   // 1-Повестка    3-Повестка гражданину    2-Повестка призывнику  4-Почтовая карточка общего вызова
     if par1='3' then nPr:=9 else if par1='2' then nPr:=2; 
     ds.Fld('PRIL').AsString:=getPril(-1,'VOEN_PRIP',nPr);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'И');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('Adres').AsString := adr.GetAdres+', '+FirstCharUpper(Raion_Name('Р'))+'.';  // +', '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('Work2Adres').AsString := Men.getWorkEx('ADRES');
     if Men.Fld('PRIZ').AsBoolean
       then ds.Fld('ZVAN').AsString := 'призывник'
       else ds.Fld('ZVAN').AsString := ValueFromKey('KEY_VUS_ZVANI',Men.Fld('ZVAN').AsString,'',false);
     ds.Fld('Zvan_Komu').AsString := ds.Fld('ZVAN').AsString+' '+ds.Fld('Komu').AsString;
     ds.Fld('POST_IND').AsString := GlobalTask.ParamAsString('POST_IND');
     ds.Fld('POST_ADRES').AsString := GlobalTask.ParamAsString('POST_ADRES');
     ds.Post;
   end;
end;
// Справка для перерасчета платы за коммунальные услуги          (ЖКХ)
function SprPKU(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strGrag,strJit,strErr,strEG,strAdres,strSobstv,strGR, strPlosh, strYear : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := Men;
     adr := Men.Adres;
     strYear:='';
     if m.Fld('DATER').AsString<>'' then begin
       strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+'г.р.';
     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if m.Fld('POL').AsString='М' then begin
       ds.Fld('Grag').AsString := 'гражданину';
       ds.Fld('Jit').AsString := 'проживающему';
       ds.Fld('Zarm').AsString := 'находился';
     end else begin
       ds.Fld('Grag').AsString := 'гражданке';
       ds.Fld('Jit').AsString := 'проживающей';
       ds.Fld('Zarm').AsString := 'находилась';
     end;
     ds.Fld('DATEP').AsString:=DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'Д')+strYear;
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Д')+strYear;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('Adres_Prop').AsString := m.Fld('ADRES_PROP').AsString;

     WritePodpis(ds,1);

//     WriteMenToSpr(m,ds);
     ds.Post;
   end;
end;

//=== подсистема 06 Обращения граждан ============================================================
{$IFDEF OBR_GRAG}
procedure drAddField(var S: string; Delimeter: string; Field: TField);
begin
   if not Field.IsNull then begin
      S:=S+Delimeter+Field.AsString;
   end;
end;

procedure drAddString(var S: string; Delimeter, AddS: string);
begin
   if S='' then begin
      S:=AddS;
   end
   else if AddS<>'' then begin
      S:=S+Delimeter+AddS;
   end;
end;

function dcIffNull(Field: TField; NullValue: string): string;
begin
   if Field.IsNull then begin
      Result:=NullValue;
   end
   else begin
      Result:=Field.AsString;
   end;
end;
//------------------------------------
function DocMainGetTemplate: string;
begin
   //новый вид РКК (по постановлению №1786 от 30.12.2011)
   if ParamAsBoolean('DR_VID_RKK') then begin
      case Doc2Tpl.Field('SIGN_KIND').AsInteger of
         skUL: Result:='DOC_MAIN_RKK_UL';
         skMan, skIP: Result:='DOC_MAIN_RKK_MAN';
      else
         Result:='';
      end;
   end
   //старый вид РКК
   else begin
      case Doc2Tpl.Field('APP_FORM').AsInteger of
         stWriting,stElect: Result:='DOC_MAIN_RKK_2';
         stVerbal: Result:='DOC_MAIN_RKK_4';
      else
         Result:='';
      end;
   end;
end;

//РКК письменно.doc
//РКК устно.doc
function DOC_MAIN_RKK_1(DateFiks: TDateTime; LicID, PID: Word): Boolean;
var
   ds: TDataSet;
   CheckOut: Boolean;
   S: string;
   DocWork,SprName: string;
   dsWork: TDataSet;
   dsWorkTable: TDataSet;
begin
   Result:=True;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
      if not ds.Active then begin
         ds.Open;
      end;
      ds.Edit;
      //1. № (регистрационный индекс)
      ds.FieldByName('REG_IND').AsString:=Doc2Tpl.Field('REG_IND').AsString;
      //2. Фамилия, имя, отчество
      ds.FieldByName('SIGN_NAME').AsString:=Doc2Tpl.Field('SIGN_NAME').AsString;
      //3. Адрес места жительства и (или) работы, контактный телефон
      ds.FieldByName('ADR_TEXT').AsString:=Doc2Tpl.Field('ADR_TEXT').AsString;
      if ParamAsBoolean('DR_VID_RKK') then begin
         S:=Trim(Doc2Tpl.Field('ADR_NOTE').AsString);
         if S<>'' then begin
            ds.FieldByName('ADR_TEXT').AsString:=ds.FieldByName('ADR_TEXT').AsString+', '+Doc2Tpl.Field('ADR_NOTE').AsString;
         end;
      end;
      S:=Trim(Doc2Tpl.Field('ADR_PHONE').AsString);
      if S<>'' then begin
         ds.FieldByName('ADR_PHONE').AsString:=', тел. '+Doc2Tpl.Field('ADR_PHONE').AsString;
      end;
      //Форма подачи обращения
      if ParamAsBoolean('DR_VID_RKK') then begin
         ds.FieldByName('APP_FORM').AsString:=Doc2Tpl.PickName('APP_FORM', 'O');;
      end;
      //4. Дата поступления
      ds.FieldByName('REG_DATE').AsString:=Doc2Tpl.Field('REG_DATE').AsString;
      //5. Количество листов обращения
      ds.FieldByName('NUM_LIST').AsString:=Doc2Tpl.Field('NUM_LIST').AsString;
      //6. Количество листов приложений
      ds.FieldByName('NUM_APP').AsString:=Doc2Tpl.Field('NUM_APP').AsString;
      //   Даты индентичных обращений
      ds.FieldByName('IDEN_DATE').AsString:=Doc2Tpl.Field('IDEN_DATE').AsString;
      //   Содержание индентичных обращений
      ds.FieldByName('IDEN_TEXT').AsString:=Doc2Tpl.Field('IDEN_TEXT').AsString;
      //7. Даты, индексы повторных обращений
      if Doc2Tpl.Field('IS_REPEAT').AsBoolean then begin
         ds.FieldByName('REPEAT_TEXT').AsString:=Doc2Tpl.Field('REPEAT_TEXT').AsString;
      end;
      //8. Корреспондент, дата и индекс сопроводительного письма 
      ds.FieldByName('COVER_CORR').AsString:=Doc2Tpl.FromSpr('COVER_CORR', 'FNAME', '=');
      ds.FieldByName('COVER_DATE').AsString:=Doc2Tpl.Field('COVER_DATE').AsString;
      ds.FieldByName('COVER_IND').AsString:=Doc2Tpl.Field('COVER_IND').AsString;
      //9. Тематика
      {+}
      if Doc2Tpl.Field('SUBJ_ID').AsInteger<10000 then SprName:='SP_SUBJ' else SprName:='SP_SUBJG';
      ds.FieldByName('SUBJ_ID').AsString:=Doc2Tpl.FromSpr2('SUBJ_ID', SprName, 'CODE', '=')+' '+Doc2Tpl.FromSpr2('SUBJ_ID', SprName, 'NAME', '=');
// было     ds.FieldByName('SUBJ_ID').AsString:=Doc2Tpl.FromSpr('SUBJ_ID', 'NAME', '=');

      //10. Содержание
      ds.FieldByName('CONTENT').AsString:=Doc2Tpl.Field('CONTENT').AsString;
      //11. Резолюция
      ds.FieldByName('RES_TEXT').AsString:=Doc2Tpl.Field('RES_TEXT').AsString;
      //--2011.08.11: ds.FieldByName('RES_MAN').AsString:=Doc2Tpl.FromSpr('RES_MAN', 'POST', 'O')+' '+Doc2Tpl.FromSpr('RES_MAN', 'FIO', '=');
      ds.FieldByName('RES_MAN').AsString:=Doc2Tpl.FromSpr('RES_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('RES_MAN', 'FIO', '=');
      ds.FieldByName('RES_DATE').AsString:=Doc2Tpl.Field('RES_DATE').AsString;
      //12. Исполнитель
      //--2011.08.11: ds.FieldByName('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'POST', 'L')+' '+Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');
      ds.FieldByName('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');
      if ParamAsBoolean('DR_VID_RKK') 
        then ds.FieldByName('EXEC_TERM2').AsString:=Doc2Tpl.Field('EXEC_TERM2').AsString;
      //13. Документ направлен на исполнение
      ds.FieldByName('EXEC_ORG').AsString:=Doc2Tpl.FromSpr('EXEC_ORG', 'FNAME', '=');
      //14. Дата направления
      ds.FieldByName('EXEC_DATE').AsString:=Doc2Tpl.Field('EXEC_DATE').AsString;
      //15. Срок исполнения
      ds.FieldByName('EXEC_TERM').AsString:=Doc2Tpl.Field('EXEC_TERM').AsString;
      //16. Дата исполнения
      ds.FieldByName('EXEC_FACT').AsString:=Doc2Tpl.Field('EXEC_FACT').AsString;
      //17. Ход рассмотрения - NB: ???
      dsWork:=Doc2Tpl.DataSet('DOC_WORK');
      //17.1 Заполнение строки
      DocWork:='';
      if dsWork<>nil then begin
         dsWork.DisableControls;
         dsWork.First;
         while not dsWork.Eof do begin
            S:=dsWork.FieldByName('OUT_NOTE').AsString;
            drAddField(S, ' от ', dsWork.FieldByName('OUT_DATE'));
            drAddField(S, ' № ', dsWork.FieldByName('OUT_IND'));
            drAddField(S, '. ', dsWork.FieldByName('IN_NOTE'));
            drAddField(S, ' от ', dsWork.FieldByName('IN_DATE'));
            drAddField(S, ' № ', dsWork.FieldByName('IN_IND'));
            drAddString(DocWork, '. ', S);
            dsWork.Next;
         end;
         dsWork.EnableControls;
      end;
      ds.FieldByName('DOC_WORK').AsString:=DocWork;
      //17.2 Заполнение таблицы
      dsWorkTable:=GetTemplateDataSet('WORK_TABLE');
      if (dsWorkTable<>nil) and (dsWork<>nil) then begin
         dsWork.DisableControls;
         dsWork.First;
         while not dsWork.Eof do begin
            dsWorkTable.Append;
            dsWorkTable.FieldByName('OUT_NOTE').AsString:=dcIffNull(dsWork.FieldByName('OUT_NOTE'), '') ;
            dsWorkTable.FieldByName('OUT_DATE').AsString:=dcIffNull(dsWork.FieldByName('OUT_DATE'), '') ;
            dsWorkTable.FieldByName('OUT_IND').AsString:=dcIffNull(dsWork.FieldByName('OUT_IND'), '') ;
            dsWorkTable.FieldByName('IN_NOTE').AsString:=dcIffNull(dsWork.FieldByName('IN_NOTE'), '') ;
            dsWorkTable.FieldByName('IN_DATE').AsString:=dcIffNull(dsWork.FieldByName('IN_DATE'), '') ;
            dsWorkTable.FieldByName('IN_IND').AsString:=dcIffNull(dsWork.FieldByName('IN_IND'), '') ;
            dsWorkTable.Post;
            dsWork.Next;
         end;
         dsWork.EnableControls;
      end;
      //18. Отметка о выдаче предписания и его исполнении - // NB: ???
      ds.FieldByName('ORDER_TEXT').AsString:=Doc2Tpl.Field('ORDER_TEXT').AsString;
      ds.FieldByName('ORDER_ORG').AsString:=Doc2Tpl.FromSpr('ORDER_ORG', 'FNAME', '=');
      ds.FieldByName('ORDER_DATE').AsString:=Doc2Tpl.Field('ORDER_DATE').AsString;
      if not Doc2Tpl.Field('ORDER_FACT').IsNull then begin  
         ds.FieldByName('ORDER_FACT').AsString:='. Получен ответ '+Doc2Tpl.Field('ORDER_FACT').AsString;
      end;
      //19. Результат рассмотрения обращения (№ и дата ответа)
      ds.FieldByName('ANS_IND').AsString:=Doc2Tpl.Field('ANS_IND').AsString;
      ds.FieldByName('ANS_DATE').AsString:=Doc2Tpl.Field('ANS_DATE').AsString;
      ds.FieldByName('ANS_KIND').AsString:=Doc2Tpl.PickName('ANS_KIND', 'F');
      ds.FieldByName('ANS_TEXT').AsString:=Doc2Tpl.Field('ANS_TEXT').AsString;
      if ParamAsBoolean('DR_VID_RKK') 
        then ds.FieldByName('ANS_VISIT').AsString:=Doc2Tpl.Field('ANS_VISIT').AsString;

      //20. Отметка о снятии с контроля
      CheckOut:=Doc2Tpl.Field('CHECK_OUT').AsBoolean;
      if CheckOut then begin
         ds.FieldByName('CHECK_OUT').AsString:='Обращение снять с контроля';
         //--2011.08.11: ds.FieldByName('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'POST', 'O')+' '+Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '=');
         ds.FieldByName('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '=');
         ds.FieldByName('CHECK_DATE').AsString:=Doc2Tpl.Field('CHECK_DATE').AsString;
      end;
      //21. Документ подшит в дело
      ds.FieldByName('FILE_ID').AsString:=Doc2Tpl.FromSpr('FILE_ID', 'FILE_IND', '=');
      if Doc2Tpl.Field('FILE_LIST').AsString<>'' then begin
         ds.FieldByName('FILE_LIST').AsString:=Doc2Tpl.Field('FILE_LIST').AsString;
      end
      else begin
         ds.FieldByName('FILE_LIST').AsString:='     ';
      end;
      //105. Отметка о личном приеме
      //--2011.08.11: ds.FieldByName('VISIT_MAN').AsString:=Doc2Tpl.FromSpr('VISIT_MAN', 'POST', 'L')+' '+Doc2Tpl.FromSpr('VISIT_MAN', 'FIO', '=');
      ds.FieldByName('VISIT_MAN').AsString:=Doc2Tpl.FromSpr('VISIT_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('VISIT_MAN', 'FIO', '=');
      ds.Post;
   end;
end;

//РКК АП.doc
function ADM_PROC_RKK_1(DateFiks: TDateTime; LicID, PID: Word): Boolean;
var
   ds: TDataSet;
   dsWork: TDataSet;
   S,sID: string;
   DocWork: string;
   SprName: string;
begin
   Result:=True;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
      if not ds.Active then begin
         ds.Open;
      end;
      ds.Edit;
      //1. Регистрационный индекс
      ds.FieldByName('REG_IND').AsString:=Doc2Tpl.Field('REG_IND').AsString;
      //2. Фамилия, собственное имя, отчество, место жительства (место пребывания) гражданина или наименование и место нахождения юридического лица, контактный телефон
      if Doc2Tpl.Field('SIGN_KIND').AsInteger=1 then begin
         ds.FieldByName('SIGN_KIND').AsString:='Фамилия, собственное имя, отчество место жительства (место пребывания) гражданина, контактный телефон';
      end
      else begin
         ds.FieldByName('SIGN_KIND').AsString:='Наименование и место нахождения юридического лица, контактный телефон';
      end;
      ds.FieldByName('SIGN_NAME').AsString:=Doc2Tpl.Field('SIGN_NAME').AsString;
      ds.FieldByName('ADR_TEXT').AsString:=Doc2Tpl.Field('ADR_TEXT').AsString;
      S:=Trim(Doc2Tpl.Field('ADR_PHONE').AsString);
      if S<>'' then begin
         ds.FieldByName('ADR_PHONE').AsString:=', тел. '+Doc2Tpl.Field('ADR_PHONE').AsString;
      end;
//      sID:=Doc2Tpl.Field('SIGN_MAN').AsString;
//  
    if (Doc2Tpl.Field('SIGN_KIND').AsInteger=1) and ParamAsBoolean('DR_RKK_PASP') then
        ds.FieldByName('SIGN_NAME').AsString:=ds.FieldByName('SIGN_NAME').AsString+', '+
           dmBase.GetMenPaspV(Doc2Tpl.Field('PROV_TYPE').AsInteger, Doc2Tpl.Field('PROV_SER').AsString, Doc2Tpl.Field('PROV_NUM').AsString, 
                       Doc2Tpl.Field('PROV_ORG').AsString, Doc2Tpl.Field('PERSON_ID').AsString, Doc2Tpl.Field('PROV_DATE').AsDateTime, 0);
//GetMenPaspV(UdostKod:Integer; Seria,Nomer,Organ,LichNomer : String;  DateV : TDateTime; nType:Integer): String', CallMethod, NAME_LIB_MEN, 'Собрать паспортные данные');

      //3. Форма подачи заявления
      ds.FieldByName('APP_FORM').AsString:=Doc2Tpl.PickName('APP_FORM', 'O');
      //4. Дата подачи заявления
      ds.FieldByName('REG_DATE').AsString:=Doc2Tpl.Field('REG_DATE').AsString;
      //5. Количество листов заявления
      ds.FieldByName('NUM_LIST').AsString:=Doc2Tpl.Field('NUM_LIST').AsString;
      //6. Количество листов документов и (или) сведений, представленных заинтересованным лицом
      ds.FieldByName('NUM_APP').AsString:=Doc2Tpl.Field('NUM_APP').AsString;
      //7. Даты, индексы <*> повторных заявлений
      //if Doc2Tpl.ParamAsBoolean('DR_PRINT_IND') then begin
      //   ds.FieldByName('REPEAT').AsString:='Даты, индексы повторных заявлений';
      //end
      //else begin
      //   ds.FieldByName('REPEAT').AsString:='Даты повторных заявлений';
      //end;
      if Doc2Tpl.Field('IS_REPEAT').AsBoolean then begin
         ds.FieldByName('REPEAT_TEXT').AsString:=Doc2Tpl.Field('REPEAT_TEXT').AsString;
      end;
      //8. Наименование административной процедуры
      {+}
      SprName:='SP_ADMPROC2';
      if Doc2Tpl.Field('ADM_PROC').AsString='' then begin
         if Doc2Tpl.Field('SIGN_KIND').AsInteger=2 then SprName:='SP_ADMPROC_U2';
      end
      else if Doc2Tpl.Field('ADM_PROC').AsInteger>10000 then SprName:='SP_ADMPROC_U2';
      ds.FieldByName('ADM_PROC').AsString:=Doc2Tpl.FromSpr2('ADM_PROC', SprName, 'PROC_NO', '=')+' '+Doc2Tpl.FromSpr2('ADM_PROC', SprName, 'FULL_NAME', '=');
      {+}
      //9. Исполнитель
      //--2011.08.11: ds.FieldByName('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'POST', 'L')+' '+Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');
      ds.FieldByName('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');
      //10. Срок исполнения
      ds.FieldByName('EXEC_TERM').AsString:=Doc2Tpl.Field('EXEC_TERM').AsString;
      //11. Ход рассмотрения - NB: ???
      dsWork:=Doc2Tpl.DataSet('DOC_WORK');
      //11.1 Заполнение строки
      DocWork:='';
      if dsWork<>nil then begin
         dsWork.DisableControls;
         dsWork.First;
         while not dsWork.Eof do begin
            S:=dsWork.FieldByName('OUT_NOTE').AsString;
            drAddField(S, ' от ', dsWork.FieldByName('OUT_DATE'));
            drAddField(S, ' № ', dsWork.FieldByName('OUT_IND'));
            drAddField(S, '. ', dsWork.FieldByName('IN_NOTE'));
            drAddField(S, ' от ', dsWork.FieldByName('IN_DATE'));
            drAddField(S, ' № ', dsWork.FieldByName('IN_IND'));
            drAddString(DocWork, '. ', S);
            dsWork.Next;
         end;
         dsWork.EnableControls;
      end;
      ds.FieldByName('DOC_WORK').AsString:=DocWork;
      //12. Отметка о направлении заявления в соответствующий уполномоченный орган и уведомлении об этом заинтересованного лица
      ds.FieldByName('EXEC_ORG').AsString:=Doc2Tpl.FromSpr('EXEC_ORG', 'FNAME', '=');
      ds.FieldByName('EXEC_DATE').AsString:=Doc2Tpl.Field('EXEC_DATE').AsString;
      //13. Дата и номер принятого административного решения
      ds.FieldByName('ANS_DATE').AsString:=Doc2Tpl.Field('ANS_DATE').AsString;
      if Trim(Doc2Tpl.Field('ANS_IND').AsString)<>'' then begin
         ds.FieldByName('ANS_IND').AsString:='№'+Doc2Tpl.Field('ANS_IND').AsString;
      end;
      //14. Результат принятого административного решения
      ds.FieldByName('ANS_KIND').AsString:=Doc2Tpl.PickName('ANS_KIND', 'F');
      if Trim(Doc2Tpl.Field('ANS_TEXT').AsString)<>'' then begin
         ds.FieldByName('ANS_TEXT').AsString:='. '+Doc2Tpl.Field('ANS_TEXT').AsString;
      end;
      //15. Отметка об уведомлении заинтересованного лица о принятом административном решении
      ds.FieldByName('DELIV_KIND').AsString:=Doc2Tpl.PickName('DELIV_KIND', 'O');
      ds.FieldByName('RES_DATE').AsString:=Doc2Tpl.Field('RES_DATE').AsString;
      //16. Отметка о снятии с контроля
      if Doc2Tpl.Field('CHECK_OUT').AsBoolean then begin
         ds.FieldByName('CHECK_OUT').AsString:='Обращение снять с контроля';
         //--2011.08.11: ds.FieldByName('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'POST', 'O')+' '+Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '=');
         ds.FieldByName('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '=');
         ds.FieldByName('CHECK_DATE').AsString:=Doc2Tpl.Field('CHECK_DATE').AsString;
      end;
      //17. Документ подшит в дело N _____ _____ л.
      if Doc2Tpl.Field('IN_FILE').AsBoolean then begin
         ds.FieldByName('FILE_ID').AsString:=Doc2Tpl.FromSpr('FILE_ID', 'FILE_IND', '=');
      end;
      ds.Post;
   end;
end;

//РКК входящие А4 в1.doc
//РКК входящие А4 в2.doc
//РКК входящие А4 в3.doc
//РКК входящие А5.doc
function IN_DOC_RKK_1(DateFiks: TDateTime; LicID, PID: Word): Boolean;
var
   ds: TDataSet;
   dsWork: TDataSet;
   S: string;
   DocWork: string;
begin
   Result:=True;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
      if not ds.Active then begin
         ds.Open;
      end;
      ds.Edit;
      //1. Срок исполнения
      //   проставляется дата (число, месяц, год), к которой документ должен быть исполнен
      //   при регистрации исходящего инициативного документа записывается дата ожидаемого ответа
      ds.Fld('EXEC_TERM').AsString:=Doc2Tpl.Field('EXEC_TERM').AsString;
      //2. Название вида документа
      //   заполняется в соответствии с названием вида регистрируемого документа
      //   при регистрации писем графа не заполняется
      if Doc2Tpl.Field('DOC_KIND').AsInteger<>6 {dk6} then begin
         ds.Fld('DOC_KIND').AsString:=Doc2Tpl.PickName('DOC_KIND', 'O');
      end;
      //3. Автор (корреспондент)
      //   при регистрации поступившего документа записывается наименование организации - автора документа
      //   при регистрации исходящего документа записывается наименование организации-корреспондента
      //   допускается применение сокращенного наименования организации
      ds.Fld('SIGN_ORG').AsString:=Doc2Tpl.FromSpr('SIGN_ORG', 'NAME', '=');
      //4. Дата и индекс поступления
      //   заполняется при регистрации входящего документа
      //   записываются дата и индекс, присвоенные документу организацией-получателем
      //   переносятся из регистрационного штампа входящих документов
      ds.Fld('REG_DATE').AsString:=Doc2Tpl.Field('REG_DATE').AsString;
      ds.Fld('REG_IND').AsString:=Doc2Tpl.Field('REG_IND').AsString;
      //5. Дата и индекс документа
      //   записываются дата и индекс, присвоенные документу организацией-автором
      //   переносятся с входящего или исходящего документа
      ds.Fld('DOC_DATE').AsString:=Doc2Tpl.Field('DOC_DATE').AsString;
      ds.Fld('DOC_IND').AsString:=Doc2Tpl.Field('DOC_IND').AsString;
      //6. Заголовок (краткое содержание)
      //   переносится заголовок, сформулированный на документе
      ds.Fld('CONTENT').AsString:=Doc2Tpl.Field('CONTENT').AsString;
      //7. Резолюция или кому направлен документ
      //   переносится текст резолюции руководителя
      ds.Fld('RES_TEXT').AsString:=Doc2Tpl.Field('RES_TEXT').AsString;
      if not Doc2Tpl.Field('RES_MAN').IsNull then begin
         ds.Fld('RES_MAN').AsString:=Doc2Tpl.FromSpr('RES_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('RES_MAN', 'FIO', '=');
         ds.Fld('RES_DATE').AsString:=Doc2Tpl.Field('RES_DATE').AsString;
      end;
      //8. Отметка об исполнении документа
      //   кратко записываются решение вопроса по существу, дата и индекс документа-ответа
      //??? EXEC_FACT - дата исполнения
      ds.Fld('ANS_TEXT').AsString:=Doc2Tpl.Field('ANS_TEXT').AsString;
      if Trim(Doc2Tpl.Field('ANS_IND').AsString)<>'' then begin
         ds.Fld('ANS_DATE').AsString:='Подготовлен ответ от '+Doc2Tpl.Field('ANS_DATE').AsString;
         ds.Fld('ANS_IND').AsString:='№ '+Doc2Tpl.Field('ANS_IND').AsString;
      end;
      //9. Контрольные отметки
      //???
      //10. Дело №
      //    проставляется индекс дела, в которое помещен документ после исполнения в соответствии с номенклатурой дел
      if Doc2Tpl.Field('IN_FILE').AsBoolean then begin
         ds.Fld('FILE_ID').AsString:=Doc2Tpl.FromSpr('FILE_ID', 'FILE_IND', '=');
      end;

      //№ п/п - Порядковый регистрационный номер, присвоенный документу при получении
      ds.Fld('REG_NUM').AsString:=Doc2Tpl.Field('REG_NUM').AsString;
      //Способ доставки - Способ доставки документа: почта, факс, mailgov (электронная почта госорганов), email (электронная почта), телеграф, другой
      ds.Fld('DELIV_KIND').AsString:=Doc2Tpl.PickName('DELIV_KIND', 'O');
      //Подписал - Фамилия и должность лица, подписавшего документ (если требуется)
      ds.Fld('SIGN_NAME').AsString:=Doc2Tpl.Field('SIGN_NAME').AsString;
      //Ответ на исходящий № - Ответ на исходящий документ: регистрационный индекс документа
      ds.Fld('REQ_IND').AsString:=Doc2Tpl.Field('REQ_IND').AsString;
      //От - Ответ на исходящий документ: дата регистрации документа
      ds.Fld('REQ_DATE').AsString:=Doc2Tpl.Field('REQ_DATE').AsString;
      //Листов - Количество листов документа
      ds.Fld('NUM_LIST').AsString:=Doc2Tpl.Field('NUM_LIST').AsString;
      //Приложений - Количество приложений, количество листов приложений
      ds.Fld('NUM_APP').AsString:=Doc2Tpl.Field('NUM_APP').AsString;
      //Исполнитель - Фамилия исполнителя, подготовившего документ
      ds.Fld('ADR_NOTE').AsString:=Doc2Tpl.Field('ADR_NOTE').AsString;
      //Телефон - Номер служебного телефона исполнителя, подготовившего документ
      ds.Fld('ADR_PHONE').AsString:=Doc2Tpl.Field('ADR_PHONE').AsString;
      //Тематика - Тематическая рубрика, к которой условно можно отнести содержание документа
      ds.Fld('SUBJ_ID').AsString:=Doc2Tpl.FromSpr('SUBJ_ID', 'NAME', '=');
      //Кому адресован - Должностное лицо, которому адресован документ
      ds.Fld('REQ_TEXT').AsString:=Doc2Tpl.Field('REQ_TEXT').AsString;
      //Исполнитель - Должностное лицо, указанное в резолюции (справочник "Должностные лица")
      ds.Fld('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');
      //Исполнители
      ds.Fld('EXEC_MENS').AsString:= Doc2Tpl.Field('IDEN_TEXT').AsString;
      //Дата исполнения - Дата фактического исполнения
      ds.Fld('EXEC_FACT').AsString:= Doc2Tpl.Field('EXEC_FACT').AsString;
      //Контроль - Отметка о постановке на контроль
      ds.Fld('REQ_CHECK').AsString:=Doc2Tpl.PickName('REQ_CHECK', 'O');
      //Снят с контроля - Отметка о снятии с контроля
      if Doc2Tpl.Field('CHECK_OUT').AsBoolean then begin
         ds.Fld('CHECK_OUT').AsString:='Снят с контроля';
      end;
      //Дата снятия - Дата снятия с контроля
      ds.Fld('CHECK_DATE').AsString:=Doc2Tpl.Field('CHECK_DATE').AsString;
      //Принял решения о снятии - Должностное лицо, принявшее решение о снятии обращения с контроля (справочник "Должностные лица")
      ds.Fld('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '=');
      //Папка - Текущая папка пользователя, в которой находится обращение (справочник "Папки документов").
      ds.Fld('FOLDER_ID').AsString:=Doc2Tpl.FromSpr('FOLDER_ID', 'NAME', '=');
      //Группа - Группа документов (справочник "Группы документов")
      ds.Fld('GROUP_ID').AsString:=Doc2Tpl.FromSpr('GROUP_ID', 'NAME', '=');

      ds.Post;
   end;
end;

//РКК исходящие А4 в1.doc
//РКК исходящие А4 в2.doc
//РКК исходящие А4 в3.doc
//РКК исходящие А5.doc
function OUT_DOC_RKK_1(DateFiks: TDateTime; LicID, PID: Word): Boolean;
var
   ds: TDataSet;
   dsWork: TDataSet;
   S: string;
   DocWork: string;
begin
   Result:=True;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
      if not ds.Active then begin
         ds.Open;
      end;
      ds.Edit;
      //1. Срок исполнения
      //   проставляется дата (число, месяц, год), к которой документ должен быть исполнен
      //   при регистрации исходящего инициативного документа записывается дата ожидаемого ответа
      if not Doc2Tpl.Field('EXEC_TERM').IsNull then begin
         ds.Fld('EXEC_TERM').AsString:=Doc2Tpl.Field('EXEC_TERM').AsString;
      end;
      //2. Название вида документа
      //   заполняется в соответствии с названием вида регистрируемого документа
      //   при регистрации писем графа не заполняется
      if Doc2Tpl.Field('DOC_KIND').AsInteger<>6 {dk6} then begin
         ds.Fld('DOC_KIND').AsString:=Doc2Tpl.PickName('DOC_KIND', 'O');
      end;
      //3. Автор (корреспондент)
      //   при регистрации поступившего документа записывается наименование организации - автора документа
      //   при регистрации исходящего документа записывается наименование организации-корреспондента
      //   допускается применение сокращенного наименования организации
      ds.Fld('SIGN_ORG').AsString:=Doc2Tpl.FromSpr('SIGN_ORG', 'NAME', '=');
      //4. Дата и индекс поступления
      //   заполняется при регистрации входящего документа
      //   записываются дата и индекс, присвоенные документу организацией-получателем
      //   переносятся из регистрационного штампа входящих документов
      //   -
      //5. Дата и индекс документа
      //   записываются дата и индекс, присвоенные документу организацией-автором
      //   переносятся с входящего или исходящего документа
      ds.Fld('REG_DATE').AsString:=Doc2Tpl.Field('REG_DATE').AsString;
      ds.Fld('REG_IND').AsString:=Doc2Tpl.Field('REG_IND').AsString;
      //6. Заголовок (краткое содержание)
      //   переносится заголовок, сформулированный на документе
      ds.Fld('CONTENT').AsString:=Doc2Tpl.Field('CONTENT').AsString;
      //7. Резолюция или кому направлен документ
      //   переносится текст резолюции руководителя
      //ds.Fld('SIGN_NAME').AsString:=Doc2Tpl.Field('SIGN_NAME').AsString;
      //8. Отметка об исполнении документа
      //   кратко записываются решение вопроса по существу, дата и индекс документа-ответа
      //??? EXEC_FACT - дата исполнения
      ds.Fld('ANS_TEXT').AsString:=Doc2Tpl.Field('ANS_TEXT').AsString;
      if Trim(Doc2Tpl.Field('ANS_IND').AsString)<>'' then begin
         ds.Fld('ANS_DATE').AsString:='Получен ответ от '+Doc2Tpl.Field('ANS_DATE').AsString;
         ds.Fld('ANS_IND').AsString:='№ '+Doc2Tpl.Field('ANS_IND').AsString;
      end;
      //9. Контрольные отметки
      //???
      //10. Дело №
      //    проставляется индекс дела, в которое помещен документ после исполнения в соответствии с номенклатурой дел
      if Doc2Tpl.Field('IN_FILE').AsBoolean then begin
         ds.Fld('FILE_ID').AsString:=Doc2Tpl.FromSpr('FILE_ID', 'FILE_IND', '=');
      end;
      ds.Fld('REG_NUM').AsString:=Doc2Tpl.Field('REG_NUM').AsString; //№ п/п - Порядковый регистрационный номер, присвоенный документу при получении
      ds.Fld('DELIV_KIND').AsString:=Doc2Tpl.PickName('DELIV_KIND', 'O'); //Способ доставки - Способ доставки документа: почта, факс, mailgov (электронная почта госорганов), email (электронная почта), телеграф, другой
      ds.Fld('SIGN_NAME').AsString:=Doc2Tpl.Field('SIGN_NAME').AsString; //Кому адресован
      ds.Fld('SIGN_ORGS').AsString:= Doc2Tpl.Field('IDEN_TEXT').AsString;  //Доп. корресп.
      ds.Fld('REQ_IND').AsString:=Doc2Tpl.Field('REQ_IND').AsString; //Ответ на исходящий № - Ответ на исходящий документ: регистрационный индекс документа
      ds.Fld('REQ_DATE').AsString:=Doc2Tpl.Field('REQ_DATE').AsString;  //От - Ответ на исходящий документ: дата регистрации документа
      ds.Fld('NUM_LIST').AsString:=Doc2Tpl.Field('NUM_LIST').AsString; //Листов - Количество листов документа
      ds.Fld('NUM_APP').AsString:=Doc2Tpl.Field('NUM_APP').AsString; //Приложений - Количество приложений, количество листов приложений
      ds.Fld('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');//Исполнитель - Должностное лицо, указанное в резолюции (справочник "Должностные лица")
      ds.Fld('RES_MAN').AsString:=Doc2Tpl.FromSpr('RES_MAN', 'FIO', '=');  //Подписал (справочник "Должностные лица")
      ds.Fld('SUBJ_ID').AsString:=Doc2Tpl.FromSpr('SUBJ_ID', 'NAME', '='); //Тематика - Тематическая рубрика
      ds.Fld('EXEC_DATE').AsString:=Doc2Tpl.Field('EXEC_DATE').AsString;   // дата напрвления
      ds.Fld('EXEC_FACT').AsString:=Doc2Tpl.Field('EXEC_FACT').AsString;   // дата имполнения
      ds.Fld('REQ_CHECK').AsString:=Doc2Tpl.PickName('REQ_CHECK', 'O'); //Контроль - Отметка о постановке на контроль
      if Doc2Tpl.Field('CHECK_OUT').AsBoolean then   //Снят с контроля - Отметка о снятии с контроля
         ds.Fld('CHECK_OUT').AsString:='Снят с контроля';
      ds.Fld('CHECK_DATE').AsString:=Doc2Tpl.Field('CHECK_DATE').AsString;  //Дата снятия - Дата снятия с контроля
      ds.Fld('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '='); //Принял решения о снятии ("Должностные лица")
      ds.Fld('FOLDER_ID').AsString:=Doc2Tpl.FromSpr('FOLDER_ID', 'NAME', '='); //Папка - Текущая папка пользователя, в которой находится обращение (справочник "Папки документов").
      ds.Fld('GROUP_ID').AsString:=Doc2Tpl.FromSpr('GROUP_ID', 'NAME', '='); //Группа - Группа документов (справочник "Группы документов")

      ds.Post;
   end;
end;

{$ENDIF}


