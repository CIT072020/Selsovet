// для статистики
{ **** Генерация XML *****
*
* Вызов: CreateXml(ADS соединение, год, месяц, тип записей, полный путь к создаваемому файлу,
                  полный путь к отчету)
* Пример: CreateXml([tbMarriages, tbDivorces, tbBirth, tbDeath], );
*
*************************}
unit uCreateXml;

interface

uses Forms, SysUtils, Classes, adscnnct, adstable, frxClass, frxDBSet, NativeXML, FuncPr,
     frxDesgn, frxCross, {frxADSComponents,} Dialogs, frxExportPDF;


type
  TTypeBase = set of (tbBirth, tbDeath, tbMarriages, tbDivorces, tbPaternity, tbChangename, tbMotherhood, tbAdoption);

  TXMLParams = record
    Connection : TAdsConnection;
    Year : Integer;
    Month : Integer;
    firstDate : String;
    lastDate : String;
    Name : String;
	NameBel : String;
    Soato : String;
	Shtamp : String;
    ID : String;
    PathXml : String;
    PathReport : String;
    PathIni : String;
    ExceptList : String;
    SortType : Integer; // 1 - по соато, 2 - по соато и названию
  end;

  function EDN2Xml(TypeBase: TTypeBase; Params : TXMLParams): Boolean;
//  function ScriptBirth(acReadBase: TAdsConnection): TAdsQuery;
//  function ScriptDeath(acReadBase: TAdsConnection): TAdsQuery;
//  function ScriptMarriages(acReadBase: TAdsConnection): TAdsQuery;
//  function ScriptDivorces(acReadBase: TAdsConnection): TAdsQuery;

//  procedure DS2Xml(var XmlStrings: TStrings; typeBase: String; aqReadBase: TAdsQuery);

const
  //-------- РОЖДЕНИЯ -----------
  arrSrcB = 'soato, ONA_SOATO, DateR, POL, TYPEROD, GIVOROGD, MASSA, SCHET, DLINA, SP_A, SP_B, SP_C, SP_D, SP_E, SP_F, SP_G, SP_H, SP_I, SP_J, SP_K ' +
            'ON_DateR, ONA_DateR, ON_NATION, name1, ONA_NATION, name2, ON_OBRAZ, ONA_OBRAZ, sved, SVED_DATEB,'+
			'identif,on_identif,ona_identif,dokument,isprav,decl_id,adres, nomer';
// 29.10.2015			'familia,name,otch,identif,on_identif,ona_identif,dokument,isprav,decl_id,adres';
  arrDstB = 'soato, soatm, dateBirth, sex, typeBirth, living, massBody, orderBody, lengthBody, A, B, C, D, E, F, G, H, I, J, K, dateBirthFather, dateBirthMother, ' +
            'nationFather, nameNF, nationMother, nameNM, educationFather, educationMother, typeDoc, dateRegMarriage,'+
			 'id,id_father,id_mother,document,changes,rec_true,adres, nomer';
// 29.10.2015			 'surname,name,patronymic,id,id_father,id_mother,document,changes,rec_true,adres';
  // ------- СМЕРТИ --------------
  arrSrcD = 'soato, SOATO, POL, NATION, name1, DATES, ONLYGOD, SMERT_POSL, DateR, ONLYGOD_R, SEM, OBRAZ, DOK_KOD, PR_OSN, PR_OSN_NAME, PR_NEP, PR_NEP_NAME, PR_MEST, PR_MEST_NAME,'+
            'lich_nomer,svid_nomer,datesv,dokument,adres,sdan_dok,decl_id, nomer';
  arrDstD = 'soato, soatm, sex, nation, nationName, dateDeath, onlygod, deathFollowed, dateBirth, onlygod_r, maritalStatus, education, document, basicReasonM, basicReasonName, directReasonM, directReasonName, placeDeathsM, placeDeathsName,'+
			'id,svid_nomer,datesv,doc,soato_res,sdan_dok,rec_true, nomer';
  // ------- БРАКИ ---------------
  arrSrcM  = 'soato, DATEZ, ON_DATER, ONA_DATER, ON_NATION, name, ONA_NATION, name2, ON_OBRAZ, ONA_OBRAZ, ON_SEM, ONA_SEM, ON_GRAG, name3, ONA_GRAG, name4, DETI_COUNT,'+
			 'on_identif,on_soato,ona_identif,ona_soato,decl_id, m_adres, w_adres, nomer';
  arrDstM  = 'soato, dateRegMarriage, mDateBirth, wDateBirth, mNation, mNationName, wNation, wNationName, mEducation, wEducation, mMaritalStatus, wMaritalStatus, mCitizenship, mCitizenshipName, wCitizenship, wCitizenshipName, countChild,'+
			 'm_id,m_soato,w_id,w_soato,rec_true, m_adres, w_adres, nomer';
// ------ РАЗВОДЫ --------------
  arrSrcDiv = 'soato, DATEZ, ON_DATER, ONA_DATER, ON_NATION, name, ONA_NATION, name2, ON_OBRAZ, ONA_OBRAZ, '+
              'ON_SEM, ONA_SEM, BRAK_DATE, DETI_COUNT,'+
			  'on_identif,on_soato,ona_identif,ona_soato,decl_id, sud_sila, m_adres, w_adres, nomer';
  arrDstDiv = 'soato, dateTermMarriage, mDateBirth, wDateBirth, mNation, mNationName, wNation, wNationName, mEducation, ' +
              'wEducation, mCountMarriage, wCountMarriage, dateRegMarriage, countChild,'+ //, heAge, sheAge';
			  'm_id,m_soato,w_id,w_soato,rec_true, sud_sila, m_adres, w_adres, nomer';
implementation

var
  arrSrc, arrDst : TStringList;
  parMonth, parYear : String;


function getKV(fldDom,fldKorp,fldKv:String):String;
begin
 //IIF(ONA_DOM is null,'',',д.'+trim(ONA_DOM))+IIF(ONA_KORP is null,'',',корп.'+trim(ONA_KORP))+IIF(ONA_KV is null,'',',кв.'+trim(ONA_KV))
 Result:=Format('+IIF(%0:s is null,'''','',д.''+trim(%0:s))',[fldDom,fldDom]);
 Result:=Result+Format('+IIF(%0:s is null,'''','',корп.''+trim(%0:s))',[fldKorp,fldKorp]);
 Result:=Result+Format('+IIF(%0:s is null,'''','',кв.''+trim(%0:s))',[fldKv,fldKv]);
end;

function RusType(typeBase : String): String;
var
  str : String;
begin
  str := lowerCase(typeBase);
  if str = 'birth' then Result := 'Рождения';
  if str = 'death' then Result := 'Смерти';
  if str = 'marriages' then Result := 'Браки';
  if str = 'divorces' then Result := 'Разводы';
  if str = 'certificate' then Result := 'Свидетельства';
end;

function StrType(typeBase: TTypeBase): String;
begin
{  case typeBase of
    tbBirth: Result := 'birth';
    tbDeath: Result := 'death';
    tbMarriages: Result := 'marriages';
    tbDivorces: Result := 'divorces';
  end; }
end;

function ScriptBirth(acReadBase: TAdsConnection; SortType: Integer): TAdsQuery;
var
  script, strOrder : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';
  arrSrc.CommaText := arrSrcB;
  arrDst.CommaText := arrDstB;
  n := arrSrc.Count - 1;

  try
    aqReadBase := TAdsQuery.Create(nil);
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n do begin
        flag := false;
        // --- дата рождения ребенка
        if arrDst[i] = 'dateBirth' then begin
          script := script + ' CONVERT(YEAR(ar.DateR), SQL_VARCHAR) ' + '+ ''-'' +' +
           ' iif (Length(CONVERT(MONTH(ar.DateR), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           ' CONVERT(MONTH(ar.DateR), SQL_VARCHAR) ' + '+ ''-'' +' +
           ' iif (Length(CONVERT(DAYOFMONTH(ar.DateR), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           ' CONVERT(DAYOFMONTH(ar.DateR), SQL_VARCHAR) ' + ' as ' + arrDst[i];
           flag := true;
         end;
         // --- дата рождения отца
         if arrDst[i] = 'dateBirthFather' then begin
           script := script + ' CONVERT(YEAR(ar.ON_DateR), SQL_VARCHAR) ' + '+ ''-'' +' +
           ' iif (Length(CONVERT(MONTH(ar.ON_DateR), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           ' CONVERT(MONTH(ar.ON_DateR), SQL_VARCHAR) ' + '+ ''-'' +' +
           ' iif (Length(CONVERT(DAYOFMONTH(ar.ON_DateR), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           ' CONVERT(DAYOFMONTH(ar.ON_DateR), SQL_VARCHAR) ' + ' as ' + arrDst[i];
           flag := true;
         end;
         // --- дата рождения матери
         if arrDst[i] = 'dateBirthMother' then begin
           script := script + ' CONVERT(YEAR(ar.ONA_DateR), SQL_VARCHAR) ' + '+ ''-'' +' +
           ' iif (Length(CONVERT(MONTH(ar.ONA_DateR), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           ' CONVERT(MONTH(ar.ONA_DateR), SQL_VARCHAR) ' + '+ ''-'' +' +
           ' iif (Length(CONVERT(DAYOFMONTH(ar.ONA_DateR), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           ' CONVERT(DAYOFMONTH(ar.ONA_DateR), SQL_VARCHAR) ' + ' as ' + arrDst[i];
           flag := true;
         end;
         // --- C
         if arrDst[i] = 'C' then begin
           //script := script + ' CONVERT(YEAR(ar.SP_C), SQL_VARCHAR) ' + '+ ''-'' +' +
           //' iif (Length(CONVERT(MONTH(ar.SP_C), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           //' CONVERT(MONTH(ar.SP_C), SQL_VARCHAR) ' + '+ ''-'' +' +
           //' iif (Length(CONVERT(DAYOFMONTH(ar.SP_C), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           //' CONVERT(DAYOFMONTH(ar.SP_C), SQL_VARCHAR) ' + ' as ' + arrDst[i];
           script := script + ' GET_J(SP_C_GOD, SP_C) ' + ' as ' + arrDst[i];
           flag := true;
         end;
         // --- J
         if arrDst[i] = 'J' then begin
           script := script + ' GET_J(SP_J_GOD, SP_J) ' + ' as ' + arrDst[i];
           flag := true;
         end;
         if arrDst[i] = 'dateRegMarriage' then begin
           script := script + ' CONVERT(YEAR(ar.SVED_DATEB), SQL_VARCHAR) ' + '+ ''-'' +' +
           ' iif (Length(CONVERT(MONTH(ar.SVED_DATEB), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           ' CONVERT(MONTH(ar.SVED_DATEB), SQL_VARCHAR) ' + '+ ''-'' +' +
           ' iif (Length(CONVERT(DAYOFMONTH(ar.SVED_DATEB), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           ' CONVERT(DAYOFMONTH(ar.SVED_DATEB), SQL_VARCHAR) ' + ' as ' + arrDst[i];
           flag := true;
         end;
         if arrDst[i] = 'sex' then begin
           script := script + ' iif (ar.POL = ''М'', ''1'', ''2'') ' + 'as ' + arrDst[i];
           flag := true;
         end;
         if arrDst[i] = 'living' then begin
           script := script + ' iif (ar.GIVOROGD = True, ''0'', ''1'') ' + 'as ' + arrDst[i];
           flag := true;
         end;
         if arrSrc[i] = 'sved' then begin
           script := script + 'case when sved=3 and on_dater is not null then 2 else sved end' + ' as ' + arrDst[i];
           flag := true;
         end;
         if arrSrc[i] = 'soato' then begin
           script := script + 'ss.Soato' + ' as ' + arrDst[i];
           flag := true;
         end;
         if arrSrc[i] = 'name1' then begin
           script := script + 'sn.NAME' + ' as ' + arrDst[i];
           flag := true;
         end;
         if arrSrc[i] = 'name2' then begin
           script := script + 'sn2.NAME' + ' as ' + arrDst[i];
           flag := true;
         end;

         if arrSrc[i] = 'adres' then begin
           script := script + 'trim(isnull(ar.ONA_OBL,'''')) + '','' + trim(isnull(ar.ONA_RAION,'''')) + '','' + trim(isnull(stp.NAME,'''')) +  trim(isnull(ar.ONA_GOROD,'''')) + '','' + trim(isnull(ar.ONA_GOROD_R,'''')) '+getKV('ar.ONA_DOM','ar.ONA_KORP','ar.ONA_KV')+' as ' + arrDst[i];
           flag := true;
         end;

        if not flag then begin
          script := script + 'ar.' + arrSrc[i] + ' as ' + arrDst[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'ar.' +arrSrc[i] + ' as ' + arrDst[i];
    end;

    if SortType = 1 then
      strOrder := 'ss.soato, ar.NOMER'
    else
      strOrder := 'iif(substring(soato,5,1)<''6'',ss.soato,ss.name), ar.NOMER';

    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM АктыРождений ar ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn ON ar.ON_NATION = sn.ID ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn2 ON ar.ONA_NATION = sn2.ID ' +
    'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
    'LEFT JOIN SysSpr.TypePunkt stp ON ar.ONA_B_GOROD = stp.ID ' +
    'WHERE CONVERT(YEAR(ar.DATEZ), SQL_VARCHAR) = ' + '''' + parYear + '''' +
    ' AND CONVERT(MONTH(ar.DATEZ), SQL_VARCHAR) = ' + '''' + parMonth + '''' +
    ' AND VOSSTAN=false ORDER BY ' + strOrder;
    aqReadBase.ExecSQL;
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else
      aqReadBase.Free;
  except
    aqReadBase.Free;
  end;
end;

function ScriptDeath(acReadBase: TAdsConnection; SortType: Integer): TAdsQuery;
var
  script, strOrder : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';
  arrSrc.CommaText := arrSrcD;
  arrDst.CommaText := arrDstD;
  n := arrSrc.Count - 1;

  try
    aqReadBase := TAdsQuery.Create(nil);
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n do begin
        flag := false;
        if arrDst[i] = 'dateDeath' then begin
          script := script + ' CONVERT(YEAR(sr.DATES), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(MONTH(sr.DATES), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(MONTH(sr.DATES), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(DAYOFMONTH(sr.DATES), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(DAYOFMONTH(sr.DATES), SQL_VARCHAR) ' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrDst[i] = 'dateBirth' then begin
          script := script + ' CONVERT(YEAR(sr.DateR), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(MONTH(sr.DateR), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(MONTH(sr.DateR), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(DAYOFMONTH(sr.DateR), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(DAYOFMONTH(sr.DateR), SQL_VARCHAR) ' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrDst[i] = 'datesv' then begin
           script := script + ' CONVERT(YEAR(sr.DATESV), SQL_VARCHAR) ' + '+ ''-'' +' +
           ' iif (Length(CONVERT(MONTH(sr.DATESV), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           ' CONVERT(MONTH(sr.DATESV), SQL_VARCHAR) ' + '+ ''-'' +' +
           ' iif (Length(CONVERT(DAYOFMONTH(sr.DATESV), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
           ' CONVERT(DAYOFMONTH(sr.DATESV), SQL_VARCHAR) ' + ' as ' + arrDst[i];
           flag := true;
        end;
        if arrDst[i] = 'sex' then begin
          script := script + ' iif (sr.POL = ''М'', ''1'', ''2'') ' + 'as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'soato' then begin
          script := script + 'ss.Soato' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'adres' then begin
          script := script + 'trim(isnull(sr.GT_OBL,'''')) + '','' + trim(isnull(sr.GT_RAION,'''')) + '','' + trim(isnull(stp.NAME,''''))  + trim(isnull(sr.GT_GOROD,'''')) + '','' + trim(isnull(sr.GT_GOROD_R,'''')) '+getKV('sr.GT_DOM','sr.GT_KORP','sr.GT_KV')+' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'name1' then begin
          script := script + 'sn.NAME' + ' as ' + arrDst[i];
          flag := true;
        end;
        if not flag then begin
          script := script + 'sr.' + arrSrc[i] + ' as ' + arrDst[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'sr.' +arrSrc[i] + ' as ' + arrDst[i];
    end;
	
    if SortType = 1 then
      strOrder := 'soato, sr.NOMER'
    else
      strOrder := 'iif(substring(ss.soato,5,1)<''6'',ss.soato,ss.name), sr.NOMER';
	  
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM АктыСмертей sr ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn ON sr.NATION = sn.ID ' +
    'LEFT JOIN SprNames ss ON sr.ID_ZAGS = ss.ID ' +
    'LEFT JOIN SysSpr.TypePunkt stp ON sr.GT_B_GOROD = stp.ID ' +
    'WHERE CONVERT(YEAR(sr.DATEZ), SQL_VARCHAR) = ' + '''' + parYear + '''' +
    ' AND CONVERT(MONTH(sr.DATEZ), SQL_VARCHAR) = ' + '''' + parMonth + '''' +
    ' AND VOSSTAN=false ORDER BY ' + strOrder;
    aqReadBase.ExecSQL;
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else
      aqReadBase.Free;
  except
    aqReadBase.Free;
  end;
end;

function ScriptMarriages(acReadBase: TAdsConnection; SortType: Integer): TAdsQuery;
var
  script, strOrder : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';
  arrSrc.CommaText := arrSrcM;
  arrDst.CommaText := arrDstM;
  n := arrSrc.Count - 1;

  try
    aqReadBase := TAdsQuery.Create(nil);
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n do begin
        flag := false;
        if arrDst[i] = 'mDateBirth' then begin
          script := script + ' CONVERT(YEAR(zb.ON_DATER), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(MONTH(zb.ON_DATER), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(MONTH(zb.ON_DATER), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(DAYOFMONTH(zb.ON_DATER), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(DAYOFMONTH(zb.ON_DATER), SQL_VARCHAR) ' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrDst[i] = 'wDateBirth' then begin
          script := script + ' CONVERT(YEAR(zb.ONA_DATER), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(MONTH(zb.ONA_DATER), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(MONTH(zb.ONA_DATER), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(DAYOFMONTH(zb.ONA_DATER), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(DAYOFMONTH(zb.ONA_DATER), SQL_VARCHAR) ' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrDst[i] = 'dateRegMarriage' then begin
          script := script + ' CONVERT(YEAR(zb.DATEZ), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(MONTH(zb.DATEZ), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(MONTH(zb.DATEZ), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(DAYOFMONTH(zb.DATEZ), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(DAYOFMONTH(zb.DATEZ), SQL_VARCHAR) ' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrDst[i] = 'mCitizenship' then begin
          script := script + ' iif (Length(CONVERT(zb.ON_GRAG, SQL_VARCHAR))=2, ''0'', '''') + ' +
          ' iif (Length(CONVERT(zb.ON_GRAG, SQL_VARCHAR))=1, ''00'', '''') + ' +
          'CONVERT(zb.ON_GRAG, SQL_VARCHAR)  as ' + arrDst[i];
          flag := true;
        end;
        if arrDst[i] = 'wCitizenship' then begin
          script := script + ' iif (Length(CONVERT(zb.ONA_GRAG, SQL_VARCHAR))=2, ''0'', '''') + ' +
          ' iif (Length(CONVERT(zb.ONA_GRAG, SQL_VARCHAR))=1, ''00'', '''') + ' +
          'CONVERT(zb.ONA_GRAG, SQL_VARCHAR)  as ' + arrDst[i];
          flag := true;
        end;
  		if arrSrc[i] = 'm_adres' then begin
          script := script + 'trim(isnull(zb.ON_M_OBL,'''')) + '','' + trim(isnull(zb.ON_M_RAION,'''')) + '','' + trim(isnull(stp.NAME,'''')) + trim(isnull(zb.ON_M_GOROD,'''')) + '','' + trim(isnull(zb.ON_M_GOROD_R,'''')) '+getKV('zb.ON_M_DOM','zb.ON_M_KORP','zb.ON_M_KV')+' as ' + arrDst[i];
          flag := true;
        end;
	  	if arrSrc[i] = 'w_adres' then begin
          script := script + 'trim(isnull(zb.ONA_M_OBL,'''')) + '','' + trim(isnull(zb.ONA_M_RAION,'''')) + '','' + trim(isnull(stp2.NAME,'''')) + trim(isnull(zb.ONA_M_GOROD,'''')) + '','' + trim(isnull(zb.ONA_M_GOROD_R,'''')) '+getKV('zb.ONA_M_DOM','zb.ONA_M_KORP','zb.ONA_M_KV')+' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'name' then begin
          script := script + 'sn.NAME' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'name2' then begin
          script := script + 'sn2.NAME' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'name3' then begin
          script := script + 'ss.NAME' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'name4' then begin
          script := script + 'ss2.NAME' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'soato' then begin
          script := script + 'so.Soato' + ' as ' + arrDst[i];
          flag := true;
        end;
        if not flag then begin
          script := script + 'zb.' + arrSrc[i] + ' as ' + arrDst[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'ar.' +arrSrc[i] + ' as ' + arrDst[i];
    end;

    if SortType = 1 then
      strOrder := 'so.soato, zb.NOMER'
    else
      strOrder := 'iif(substring(so.soato,5,1)<''6'',so.soato, so.name), zb.NOMER';	
	
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM ЗаключениеБраков zb ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn ON zb.ON_NATION = sn.ID ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn2 ON zb.ONA_NATION = sn2.ID '+
    'LEFT JOIN SysSpr.СпрСтран ss ON zb.ON_GRAG = ss.ID '+
    'LEFT JOIN SysSpr.СпрСтран ss2 ON zb.ONA_GRAG = ss2.ID '+
    'LEFT JOIN SprNames so ON zb.ID_ZAGS = so.ID ' +
    'LEFT JOIN SysSpr.TypePunkt stp ON zb.ON_M_B_GOROD = stp.ID ' +
    'LEFT JOIN SysSpr.TypePunkt stp2 ON zb.ONA_M_B_GOROD = stp2.ID ' +
    'WHERE CONVERT(YEAR(zb.DATEZ), SQL_VARCHAR) = ' + '''' + parYear + '''' +
    ' AND CONVERT(MONTH(zb.DATEZ), SQL_VARCHAR) = ' + '''' + parMonth + '''' +
    ' AND VOSSTAN=false ORDER BY ' + strOrder;
    aqReadBase.ExecSQL;
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else
      aqReadBase.Free;
  except
    aqReadBase.Free;
  end;
end;

function ScriptDivorces(acReadBase: TAdsConnection; SortType: Integer): TAdsQuery;
var
  script, strOrder : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';
  arrSrc.CommaText := arrSrcDiv;
  arrDst.CommaText := arrDstDiv;
  n := arrSrc.Count - 1;

  try
    aqReadBase := TAdsQuery.Create(nil);
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n  do begin
        flag := false;
        if arrDst[i] = 'mDateBirth' then begin
          script := script + ' CONVERT(YEAR(ar.ON_DATER), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(MONTH(ar.ON_DATER), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(MONTH(ar.ON_DATER), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(DAYOFMONTH(ar.ON_DATER), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(DAYOFMONTH(ar.ON_DATER), SQL_VARCHAR) ' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrDst[i] = 'wDateBirth' then begin
          script := script + ' CONVERT(YEAR(ar.ONA_DATER), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(MONTH(ar.ONA_DATER), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(MONTH(ar.ONA_DATER), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(DAYOFMONTH(ar.ONA_DATER), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(DAYOFMONTH(ar.ONA_DATER), SQL_VARCHAR) ' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrDst[i] = 'dateTermMarriage' then begin
          script := script + ' CONVERT(YEAR(ar.DATEZ), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(MONTH(ar.DATEZ), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(MONTH(ar.DATEZ), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(DAYOFMONTH(ar.DATEZ), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(DAYOFMONTH(ar.DATEZ), SQL_VARCHAR) ' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrDst[i] = 'dateRegMarriage' then begin
          script := script + ' CONVERT(YEAR(ar.BRAK_DATE), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(MONTH(ar.BRAK_DATE), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(MONTH(ar.BRAK_DATE), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(DAYOFMONTH(ar.BRAK_DATE), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(DAYOFMONTH(ar.BRAK_DATE), SQL_VARCHAR) ' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrDst[i] = 'sud_sila' then begin
          script := script + 'iif(ar.TYPE_RAST=1, '''', CONVERT(YEAR(ISNULL(ar.SUD_SILA,ar.SUD_DATE)), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(MONTH(ISNULL(ar.SUD_SILA,ar.SUD_DATE)), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(MONTH(ISNULL(ar.SUD_SILA,ar.SUD_DATE)), SQL_VARCHAR) ' + '+ ''-'' +' +
          ' iif (Length(CONVERT(DAYOFMONTH(ISNULL(ar.SUD_SILA,ar.SUD_DATE)), SQL_VARCHAR))=1, ''0'', '''') ' + '+' +
          ' CONVERT(DAYOFMONTH(ISNULL(ar.SUD_SILA,ar.SUD_DATE)), SQL_VARCHAR)) ' + ' as ' + arrDst[i];
          flag := true;
        end;
		if arrSrc[i] = 'm_adres' then begin
          script := script + 'trim(isnull(ar.ON_M_OBL,'''')) + '','' + trim(isnull(ar.ON_M_RAION,'''')) + '','' + trim(isnull(stp.NAME,'''')) + trim(isnull(ar.ON_M_GOROD,'''')) + '','' + trim(isnull(ar.ON_M_GOROD_R,'''')) '+getKV('ar.ON_M_DOM','ar.ON_M_KORP','ar.ON_M_KV')+' as ' + arrDst[i];
          flag := true;
        end;
		if arrSrc[i] = 'w_adres' then begin
          script := script + 'trim(isnull(ar.ONA_M_OBL,'''')) + '','' + trim(isnull(ar.ONA_M_RAION,'''')) + '',''+ trim(isnull(stp2.NAME,''''))  + trim(isnull(ar.ONA_M_GOROD,'''')) + '','' + trim(isnull(ar.ONA_M_GOROD_R,'''')) '+getKV('ar.ONA_M_DOM','ar.ONA_M_KORP','ar.ONA_M_KV')+' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'name' then begin
          script := script + 'sn.NAME' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'name2' then begin
          script := script + 'sn2.NAME' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'soato' then begin
          script := script + 'ss.Soato' + ' as ' + arrDst[i];
          flag := true;
        end;
        if arrSrc[i] = 'empty' then begin
          script := script + '''''' + ' as ' + arrDst[i];
          flag := true;
        end;
        if not flag then begin
          script := script + 'ar.' + arrSrc[i] + ' as ' + arrDst[i];
          flag := true;
        end;  
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'ar.' +arrSrc[i] + ' as ' + arrDst[i];
    end;

    if SortType = 1 then
      strOrder := 'ss.soato, ar.NOMER'
    else
      strOrder := 'iif(substring(ss.soato,5,1)<''6'',ss.soato,ss.name), ar.NOMER';
	
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM AktTermMarriage ar ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn ON ar.ON_NATION = sn.ID ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn2 ON ar.ONA_NATION = sn2.ID ' +
    'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
    'LEFT JOIN SysSpr.TypePunkt stp ON ar.ON_M_B_GOROD = stp.ID ' +
    'LEFT JOIN SysSpr.TypePunkt stp2 ON ar.ONA_M_B_GOROD = stp2.ID ' +
    'WHERE CONVERT(YEAR(ar.DATEZ), SQL_VARCHAR) = ' + '''' + parYear + '''' +
    ' AND CONVERT(MONTH(ar.DATEZ), SQL_VARCHAR) = ' + '''' + parMonth + '''' +
    ' AND VOSSTAN=false ORDER BY ' + strOrder;
    aqReadBase.ExecSQL;
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else
      aqReadBase.Free;      
  except
    aqReadBase.Free;
  end;
end;

procedure DS2Xml(var XmlStrings: TStrings; typeBase: String; aqReadBase: TAdsQuery);
var
  i,j : integer;
  val : Variant;
  text : String;
begin
  if length(parMonth) = 1 then
    text := parYear + '-0' + parMonth
  else
    text := parYear + '-' + parMonth;
  text := '<' + typeBase + ' period="' + text + '">';
  XmlStrings.Add(text);
  aqReadBase.First;
  for i := 0 to aqReadBase.RecordCount - 1 do begin
    XmlStrings.Add(#9 + '<row>');
    for j := 0 to arrDst.Count - 1 do begin
      if arrSrc[j] <> '''''' then begin
        text := '<' + arrDst[j];
        val := aqReadBase.FieldByName(arrDst[j]).AsString;
        if val <> '' then
          text := text + '>' + sdUTF8EscapeString(val) + '</' + arrDst[j] + '>'
        else
          text := text + ' xsi:nil="true"/>';
      end;
      XmlStrings.Add(#9 + #9 + text);
    end;
    XmlStrings.Add(#9 + '</row>');
    aqReadBase.Next;
  end;
  text := '</' + typeBase + '>';
  XmlStrings.Add(text);
  Application.ProcessMessages
end;

function EDN2Xml(TypeBase: TTypeBase; Params : TXMLParams): Boolean;
var
  qBirth, qDeath, qMarriages, qDivorces : TAdsQuery;
  XmlStrings : TStrings;
  fs : TFormatSettings;
  report : TfrxReport;
  Cross : TfrxCrossView;
  frDSBirth, frDSDeath, frDSMarriages, frDSDivorces : TfrxDBDataset;
  PdfEx : TfrxPDFExport;
  info, str, strOrder : String;
begin
  info := '';
  Result := false;
  try
  try
    arrSrc := TStringList.Create;
    arrDst := TStringList.Create;

    qBirth := nil;
    qDeath := nil;
    qMarriages := nil;
    qDivorces := nil;

    report := TfrxReport.Create(nil);
    report.EngineOptions.UseGlobalDataSetList := false;
    report.EnabledDataSets.Clear();
    report.DataSets.Clear();
    PdfEx := TFrxPDFExport.Create(nil);

    parYear := inttostr(Params.Year);
    parMonth := inttostr(Params.Month);
    XmlStrings := TStringList.Create;
    with fs do begin
      DateSeparator:='-';
      ShortDateFormat:='yyyy-mm-dd';
      LongDateFormat:='yyyy-mm-dd';
    end;

    OpenMessage('   Выгрузка информации ...   ','',10);
    try
      // --- до данных ---
      XmlStrings.Add('<?xml version="1.0"?>');
      XmlStrings.Add('<database xsi:noNamespaceSchemaLocation="schema.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');
      XmlStrings.Add('<info>');
      //XmlStrings.Add(#9 + '<type>' + {RusType(typeBase)} '</type>');
      XmlStrings.Add(#9 + '<date>' + DateToStr(date, fs) + '</date>');
      XmlStrings.Add(#9 + '<location>' + Params.Name + '</location>');
      XmlStrings.Add(#9 + '<soato>' + Params.Soato + '</soato>');
      XmlStrings.Add('</info>');
      // ----
       if Params.SortType = 1 then
         strOrder := 'soato, ar.NOMER'
       else
         strOrder := 'iif(substring(ss.soato,5,1)<''6'',ss.soato,ss.name), ar.NOMER';

      if tbBirth in typeBase then begin
        arrSrc.CommaText := arrSrcB;
        arrDst.CommaText := arrDstB;
        //Query := TADSQuery.Create(nil);
        qBirth := ScriptBirth(Params.Connection, Params.SortType);
        if qBirth <> nil then begin
         DS2Xml(XmlStrings, 'birth', qBirth);
         // выходная форма
         qBirth.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM АктыРождений ar ' +
                           'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
                           'LEFT JOIN SprNames sn ON ar.ID_ZAGS = sn.ID ' +
                           ' WHERE YEAR(ar.DATEZ) = ' +  parYear  +
                           ' AND MONTH(ar.DATEZ) = ' + parMonth +
                           ' AND VOSSTAN=false ' +
                           ' ORDER BY ' + strOrder;
         qBirth.ExecSQL;
         qBirth.Open;
        end;
      end;
      if tbDeath in typeBase then begin
        arrSrc.CommaText := arrSrcD;
        arrDst.CommaText := arrDstD;
        //Query := TADSQuery.Create(nil);
        qDeath := ScriptDeath(Params.Connection, Params.SortType);
        if qDeath <> nil then begin
          DS2Xml(XmlStrings, 'death', qDeath);
          // выходная форма
          qDeath.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM АктыСмертей ar ' +
                           'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
                           'LEFT JOIN SprNames sn ON ar.ID_ZAGS = sn.ID ' +
                           ' WHERE YEAR(ar.DATEZ) = ' +  parYear  +
                           ' AND MONTH(ar.DATEZ) = ' + parMonth +
                           ' AND VOSSTAN=false ' +
                           ' ORDER BY ' + strOrder;
          qDeath.ExecSQL;
          qDeath.Open;
        end;
      end;
      if tbMarriages in typeBase then begin
        arrSrc.CommaText := arrSrcM;
        arrDst.CommaText := arrDstM;
        //Query := TADSQuery.Create(nil);
        qMarriages := ScriptMarriages(Params.Connection, Params.SortType);
        if qMarriages <> nil then begin
          DS2Xml(XmlStrings, 'marriages', qMarriages);
          // выходная форма
          qMarriages.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM ЗаключениеБраков ar ' +
                           'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
                           'LEFT JOIN SprNames sn ON ar.ID_ZAGS = sn.ID ' +
                           ' WHERE YEAR(ar.DATEZ) = ' +  parYear  +
                           ' AND MONTH(ar.DATEZ) = ' + parMonth +
                           ' AND VOSSTAN=false ' +
                           ' ORDER BY ' + strOrder;
          qMarriages.ExecSQL;
          qMarriages.Open;
        end;
      end;
      if tbDivorces in typeBase then begin
        arrSrc.CommaText := arrSrcDiv;
        arrDst.CommaText := arrDstDiv;
        //Query := TADSQuery.Create(nil);
        qDivorces := ScriptDivorces(Params.Connection, Params.SortType);
        if qDivorces <> nil then begin
          DS2Xml(XmlStrings, 'divorces', qDivorces);
          // выходная форма
          qDivorces.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM AktTermMarriage ar ' +
                           'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
                           'LEFT JOIN SprNames sn ON ar.ID_ZAGS = sn.ID ' +
                           ' WHERE YEAR(ar.DATEZ) = ' +  parYear  +
                           ' AND MONTH(ar.DATEZ) = ' + parMonth +
                           ' AND VOSSTAN=false ' +
                           ' ORDER BY ' + strOrder;
          qDivorces.ExecSQL;
          qDivorces.Open;
        end;
      end;

      XmlStrings.Add('</database>');
      XmlStrings.Text := AnsiToUtf8(XmlStrings.Text);   // преобразуем в UTF8 и затем обрабатываем спец. символы:  & < > '
      XmlStrings.SaveToFile(Params.PathXml);

    finally
      CloseMessage();
    end;

    // добавление датасетов и печать формы
    report.LoadFromFile(Params.PathReport);
    if qBirth <> nil then begin
      frDSBirth := TfrxDBDataset.Create(nil);
      frDSBirth.Name := 'frDSBirth';
      frDSBirth.DataSet := qBirth;
      report.DataSets.Add(frDSBirth);
      report.EnabledDataSets.Add(frDSBirth);
      (report.FindObject('MasterData1') as TfrxMasterData).DataSet := frDSBirth;
      (report.FindObject('birthcount') as TfrxMemoView).Text := inttostr(qBirth.RecordCount);
    end;

    if qDeath <> nil then begin
      frDSDeath := TfrxDBDataset.Create(nil);
      frDSDeath.Name := 'frDSDeath';
      frDSDeath.DataSet := qDeath;
      report.DataSets.Add(frDSDeath);
      report.EnabledDataSets.Add(frDSDeath);
      (report.FindObject('MasterData2') as TfrxMasterData).DataSet := frDSDeath;
      (report.FindObject('deathcount') as TfrxMemoView).Text := inttostr(qDeath.RecordCount);
    end;

    if qMarriages <> nil then begin
      frDSMarriages := TfrxDBDataset.Create(nil);
      frDSMarriages.Name := 'frDSMarriages';
      frDSMarriages.DataSet := qMarriages;
      report.DataSets.Add(frDSMarriages);
      report.EnabledDataSets.Add(frDSMarriages);
      (report.FindObject('MasterData3') as TfrxMasterData).DataSet := frDSMarriages;
      (report.FindObject('marriagescount') as TfrxMemoView).Text := inttostr(qMarriages.RecordCount);
    end;

    if qDivorces <> nil then begin
      frDSDivorces := TfrxDBDataset.Create(nil);
      frDSDivorces.Name := 'frDSDivorces';
      frDSDivorces.DataSet := qDivorces;
      report.DataSets.Add(frDSDivorces);
      report.EnabledDataSets.Add(frDSDivorces);
      (report.FindObject('MasterData4') as TfrxMasterData).DataSet := frDSDivorces;
      (report.FindObject('divorcescount') as TfrxMemoView).Text := inttostr(qDivorces.RecordCount);
    end;

    (report.FindObject('NameOrg') as TfrxMemoView).Text := Params.Name;
    (report.FindObject('CodeSoato') as TfrxMemoView).Text := 'Код СОАТО: ' + Params.Soato;
    (report.FindObject('DMonth') as TfrxMemoView).Text := inttostr(Params.Month);
    (report.FindObject('DYear') as TfrxMemoView).Text := inttostr(Params.Year) + ' год.';
{
  !!! переделать !!!  привязка к конкретным номерам страниц !!!
    if qBirth = nil then
      report.Pages[2].Visible := false;
    if qDeath = nil then
      report.Pages[5].Visible := false;
    if qMarriages = nil then
      report.Pages[4].Visible := false;
    if qDivorces = nil then
      report.Pages[5].Visible := false;
}
    report.ShowReport;
    str := Params.PathXml;
    delete(str,length(str)-2,3);
    PdfEx.FileName := str + 'pdf';
    PdfEx.ShowDialog := false;
    report.Export(PdfEx);

    Result := true;

  except
    on E: Exception do MessageDlg('Ошибка при выгрузке в XML!' + #13#10 +E.Message, mtError, [mbOk], 0);
  end;
  finally
    XmlStrings.Free;
    if qBirth <> nil then begin
      frDSBirth.Free;
      qBirth.Free;
    end;
    if qDeath <> nil then begin
      frDSDeath.Free;
      qDeath.Free;
    end;
    if qMarriages <> nil then begin
      frDSMarriages.Free;
      qMarriages.Free;
    end;
    if qDivorces <> nil then begin
      frDSDivorces.Free;
      qDivorces.Free;
    end;
    arrSrc.Free;
    arrDst.Free;
    report.Free;
    PdfEx.Free;
  end;
end;

end.
