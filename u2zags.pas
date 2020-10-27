{ **** Генерация XML *****
*
* Вызов: ZAGS2Xml(ADS соединение, год, месяц, тип записей, полный путь к создаваемому файлу,
                  полный путь к отчету)
*
*************************}
unit u2zags;

interface

{$I Task.inc}

uses SysUtils, Classes, adscnnct, adstable, frxClass, frxDBSet, Forms, FuncPr,
     frxDesgn, frxCross, {frxADSComponents,} Dialogs, {XMLDoc,}
     IniFiles, DateUtils, DB, NativeXml, uCreateXml;


  function ZAGS2Xml(TypeBase: TTypeBase; Params : TXMLParams; lOnlyReport:Boolean; report : TfrxReport): Boolean;

implementation
//  function ScriptBirth(acReadBase: TAdsConnection): TAdsQuery;
//  function ScriptDeath(acReadBase: TAdsConnection): TAdsQuery;
//  function ScriptMarriages(acReadBase: TAdsConnection): TAdsQuery;
//  function ScriptPaternity(acReadBase: TAdsConnection): TAdsQuery;

//  procedure DS2Xml(var XmlStrings: TStrings; typeBase: String; aqReadBase: TAdsQuery);

const
  Version = '2.0';
var
  arrSrc, arrDst : TStringList;
  parfDate, parlDate,  arrSrcB, arrDstB,
  arrSrcD, arrDstD, arrSrcM, arrDstM, arrSrcTM, arrDstTM,
  arrSrcP, arrDstP, arrSrcCN, arrDstCN, arrSrcMH, arrDstMH,
  arrSrcA, arrDstA : String;
  ExceptList : TStringList;
  fs : TFormatSettings;
  sCurZags:String;
  nCount:Integer;

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
  if str = 'changename' then Result := 'Перемена имени';
  if str = 'motherhood' then Result := 'Установление материнства';
  if str = 'adoption' then Result := 'Усыновление/удочерение';
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

function ScriptBirth(acReadBase: TAdsConnection): TAdsQuery;
var
  script, str : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';

  arrSrc.CommaText := arrSrcB;  //?
  arrDst.CommaText := arrDstB;  //?

  n := arrSrc.Count - 1;

  aqReadBase:=TAdsQuery.Create(nil);
  try
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n do begin
        flag := false;
        str := copy(arrSrc[i],length(arrSrc[i]) - 4, 5);
        if str = 'name$' then begin
          if arrSrc[i] = 'B_GOROD_name$' then
            script := script + 'tp1.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'B_M_GOROD_name$' then
            script := script + 'tp0.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ON_NATION_name$' then
            script := script + 'sn1.NAME as ' + arrSrc[i];

          if arrSrc[i] = 'NAME_ZAGS_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME) as ' + arrSrc[i];
          if arrSrc[i] = 'NAME_ZAGS_B_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME_B) as ' + arrSrc[i];

          if arrSrc[i] = 'ON_B_GOROD_name$' then
            script := script + 'tp2.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ON_M_B_GOROD_name$' then
            script := script + 'tp3.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_NATION_name$' then
            script := script + 'sn2.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_B_GOROD_name$' then
            script := script + 'tp4.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_M_B_GOROD_name$' then
            script := script + 'tp5.FNAME as ' + arrSrc[i];
          flag := true;
        end;
        if str = 'join$' then begin
          if arrSrc[i] = 'OTHER_join$' then
            script := script + 'jn1.Value as ' + arrSrc[i];
          if arrSrc[i] = 'IZMEN_join$' then
            script := script + 'jn2.Value as ' + arrSrc[i];
          flag := true;
        end;

        if not flag then begin
          script := script + 'ar.' + arrSrc[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'ar.' +arrSrc[i];
    end;
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM АктыРождений ar ' +
    'LEFT JOIN SysSpr.TypePunkt tp1 ON ar.B_GOROD = tp1.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp0 ON ar.B_M_GOROD = tp0.ID ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn1 ON ar.ON_NATION = sn1.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp2 ON ar.ON_B_GOROD = tp2.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp3 ON ar.ON_M_B_GOROD = tp3.ID ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn2 ON ar.ONA_NATION = sn2.ID ' +
    'LEFT JOIN SprNames sz ON ar.ID_ZAGS = sz.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp4 ON ar.ONA_B_GOROD = tp4.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp5 ON ar.ONA_M_B_GOROD = tp5.ID ' +
    'LEFT JOIN BaseTextProp jn1 ON (ar.ID = jn1.ID) AND (jn1.TYPEOBJ = 6) AND (jn1.POKAZ = ''OTHER'') ' +
    'LEFT JOIN BaseTextProp jn2 ON (ar.ID = jn2.ID) AND (jn2.TYPEOBJ = 6) AND (jn2.POKAZ = ''IZMEN'') ' +
    'WHERE ar.DATEZ >= ' + '''' + parfDate + '''' +
    ' AND ar.DATEZ <= ' + '''' + parlDate + '''' +
    ' AND VOSSTAN=false ORDER BY ar.NOMER';
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else
      aqReadBase.Free;
  except
    aqReadBase.Free;
  end;
end;

function ScriptDeath(acReadBase: TAdsConnection): TAdsQuery;
var
  script, str : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';

  arrSrc.CommaText := arrSrcD;  //?
  arrDst.CommaText := arrDstD;  //?

  n := arrSrc.Count - 1;

  aqReadBase := TAdsQuery.Create(nil);
  try
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n do begin
        flag := false;
        str := copy(arrSrc[i],length(arrSrc[i]) - 4, 5);
        if str = 'name$' then begin
          if arrSrc[i] = 'NATION_name$' then
            script := script + 'sn1.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'SM_B_GOROD_name$' then
            script := script + 'tp1.FNAME as ' + arrSrc[i];

          if arrSrc[i] = 'NAME_ZAGS_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME) as ' + arrSrc[i];
          if arrSrc[i] = 'NAME_ZAGS_B_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME_B) as ' + arrSrc[i];

          if arrSrc[i] = 'RG_B_GOROD_name$' then
            script := script + 'tp2.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'GT_B_GOROD_name$' then
            script := script + 'tp3.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'VOENKOM_name$' then
            script := script + 'vm1.NAME as ' + arrSrc[i];
          flag := true;
        end;
        if str = 'join$' then begin
          if arrSrc[i] = 'OTHER_join$' then
            script := script + 'jn1.Value as ' + arrSrc[i];
          if arrSrc[i] = 'IZMEN_join$' then
            script := script + 'jn2.Value as ' + arrSrc[i];
          flag := true;
        end;

        if not flag then begin
          script := script + 'ss.' + arrSrc[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'as.' +arrSrc[i];
    end;
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM АктыСмертей ss ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn1 ON ss.NATION = sn1.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp1 ON ss.SM_B_GOROD = tp1.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp2 ON ss.RG_B_GOROD = tp2.ID ' +
    'LEFT JOIN SprNames sz ON ss.ID_ZAGS = sz.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp3 ON ss.GT_B_GOROD = tp3.ID ' +
    'LEFT JOIN SysSpr.SprVoenkom vm1 ON ss.VOENKOM = vm1.ID ' +
    'LEFT JOIN BaseTextProp jn1 ON (ss.ID = jn1.ID) AND (jn1.TYPEOBJ = 7) AND (jn1.POKAZ = ''OTHER'') ' +
    'LEFT JOIN BaseTextProp jn2 ON (ss.ID = jn2.ID) AND (jn2.TYPEOBJ = 7) AND (jn2.POKAZ = ''IZMEN'') ' +
    'WHERE ss.DATEZ >= ' + '''' + parfDate + '''' +
    ' AND ss.DATEZ <= ' + '''' + parlDate + '''' +
    ' AND VOSSTAN=false ORDER BY ss.NOMER';
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else
      aqReadBase.Free;
  except
    aqReadBase.Free;
  end;
end;

function ScriptMarriages(acReadBase: TAdsConnection): TAdsQuery;
var
  script, str : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';

  arrSrc.CommaText := arrSrcM;  //?
  arrDst.CommaText := arrDstM;  //?

  n := arrSrc.Count - 1;

  aqReadBase := TAdsQuery.Create(nil);
  try
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n do begin
        flag := false;
        str := copy(arrSrc[i],length(arrSrc[i]) - 4, 5);
        if str = 'name$' then begin
          // жених
          if arrSrc[i] = 'ON_B_GOROD_name$' then
            script := script + 'tp1.FNAME as ' + arrSrc[i];

          if arrSrc[i] = 'NAME_ZAGS_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME) as ' + arrSrc[i];
          if arrSrc[i] = 'NAME_ZAGS_B_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME_B) as ' + arrSrc[i];

          if arrSrc[i] = 'ON_NATION_name$' then
            script := script + 'sn1.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ON_M_B_GOROD_name$' then
            script := script + 'tp2.FNAME as ' + arrSrc[i];
          //if arrSrc[i] = 'ON_DOK_ORGAN_name$' then
            //script := script + 'td1.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ON_VOENKOM_name$' then
            script := script + 'vm1.NAME as ' + arrSrc[i];
          // невеста
          if arrSrc[i] = 'ONA_B_GOROD_name$' then
            script := script + 'tp3.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_NATION_name$' then
            script := script + 'sn2.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_M_B_GOROD_name$' then
            script := script + 'tp4.FNAME as ' + arrSrc[i];
          //if arrSrc[i] = 'ONA_DOK_ORGAN_name$' then
            //script := script + 'td2.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_VOENKOM_name$' then
            script := script + 'vm2.NAME as ' + arrSrc[i];
          flag := true;
        end;
        if str = 'join$' then begin
          if arrSrc[i] = 'OTHER_join$' then
            script := script + 'jn1.Value as ' + arrSrc[i];
          if arrSrc[i] = 'IZMEN_join$' then
            script := script + 'jn2.Value as ' + arrSrc[i];
          flag := true;
        end;

        if not flag then begin
          script := script + 'zb.' + arrSrc[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'zb.' +arrSrc[i];
    end;
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM ЗаключениеБраков zb ' +
    // жених
    'LEFT JOIN SysSpr.TypePunkt tp1 ON zb.ON_B_GOROD = tp1.ID ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn1 ON zb.ON_NATION = sn1.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp2 ON zb.ON_M_B_GOROD = tp2.ID ' +
    //'LEFT JOIN SysSpr.SprTypeDok td1 ON zb.ON_DOK_ORGAN = td1.ID ' +
    'LEFT JOIN SysSpr.SprVoenkom vm1 ON zb.ON_VOENKOM = vm1.ID ' +
    // невеста
    'LEFT JOIN SysSpr.TypePunkt tp3 ON zb.ONA_B_GOROD = tp3.ID ' +
    'LEFT JOIN SprNames sz ON zb.ID_ZAGS = sz.ID ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn2 ON zb.ONA_NATION = sn2.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp4 ON zb.ONA_M_B_GOROD = tp4.ID ' +
    //'LEFT JOIN SysSpr.SprTypeDok td2 ON zb.ONA_DOK_ORGAN = td2.ID ' +
    'LEFT JOIN SysSpr.SprVoenkom vm2 ON zb.ONA_VOENKOM = vm2.ID ' +
    'LEFT JOIN BaseTextProp jn1 ON (zb.ID = jn1.ID) AND (jn1.TYPEOBJ = 5) AND (jn1.POKAZ = ''OTHER'') ' +
    'LEFT JOIN BaseTextProp jn2 ON (zb.ID = jn2.ID) AND (jn2.TYPEOBJ = 5) AND (jn2.POKAZ = ''IZMEN'') ' +
    // ---
    'WHERE zb.DATEZ >= ' + '''' + parfDate + '''' +
    ' AND zb.DATEZ <= ' + '''' + parlDate + '''' +
    ' AND VOSSTAN=false ORDER BY zb.NOMER';
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else
      aqReadBase.Free;
  except
    aqReadBase.Free;
  end;
end;

function ScriptPaternity(acReadBase: TAdsConnection): TAdsQuery;
var
  script, str : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';

  arrSrc.CommaText := arrSrcP;  //?
  arrDst.CommaText := arrDstP;  //?

  n := arrSrc.Count - 1;

  aqReadBase := TAdsQuery.Create(nil);
  try
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n do begin
        flag := false;
        str := copy(arrSrc[i],length(arrSrc[i]) - 4, 5);
        if str = 'name$' then begin
          // жених
          if arrSrc[i] = 'ON_NATION_name$' then
            script := script + 'sn1.NAME as ' + arrSrc[i];

          if arrSrc[i] = 'NAME_ZAGS_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME) as ' + arrSrc[i];
          if arrSrc[i] = 'NAME_ZAGS_B_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME_B) as ' + arrSrc[i];

          if arrSrc[i] = 'ON_M_B_GOROD_name$' then
            script := script + 'tp1.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ON_DOK_TYPE_name$' then
            script := script + 'td1.NAME as ' + arrSrc[i];
          // невеста
          if arrSrc[i] = 'ONA_NATION_name$' then
            script := script + 'sn2.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_M_B_GOROD_name$' then
            script := script + 'tp2.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_DOK_TYPE_name$' then
            script := script + 'td2.NAME as ' + arrSrc[i];
          // ---
          if arrSrc[i] = 'VOENKOM_name$' then
            script := script + 'vm1.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'B_GOROD_name$' then
            script := script + 'tp3.FNAME as ' + arrSrc[i];
          flag := true;
        end;
        if str = 'join$' then begin
          if arrSrc[i] = 'OTHER_join$' then
            script := script + 'jn1.Value as ' + arrSrc[i];
          if arrSrc[i] = 'IZMEN_join$' then
            script := script + 'jn2.Value as ' + arrSrc[i];
          if arrSrc[i] = 'RESHSUD_join$' then
            script := script + 'jn3.Value as ' + arrSrc[i];
          flag := true;
        end;

        if not flag then begin
          script := script + 'uo.' + arrSrc[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'uo.' +arrSrc[i];
    end;
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM АктыУстОтцовства uo ' +
    // отец
    'LEFT JOIN SysSpr.СпрНациональностей sn1 ON uo.ON_NATION = sn1.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp1 ON uo.ON_M_B_GOROD = tp1.ID ' +
    'LEFT JOIN SysSpr.SprTypeDok td1 ON uo.ON_DOK_TYPE = td1.ID ' +
    // мать
    'LEFT JOIN SysSpr.СпрНациональностей sn2 ON uo.ONA_NATION = sn2.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp2 ON uo.ONA_M_B_GOROD = tp2.ID ' +
    'LEFT JOIN SysSpr.SprTypeDok td2 ON uo.ONA_DOK_TYPE = td2.ID ' +
    // ---
    'LEFT JOIN SysSpr.TypePunkt tp3 ON uo.B_GOROD = tp3.ID ' +
    'LEFT JOIN SysSpr.SprVoenkom vm1 ON uo.VOENKOM = vm1.ID ' +
    'LEFT JOIN SprNames sz ON uo.ID_ZAGS = sz.ID ' +
    'LEFT JOIN BaseTextProp jn1 ON (uo.ID = jn1.ID) AND (jn1.TYPEOBJ = 8) AND (jn1.POKAZ = ''OTHER'') ' +
    'LEFT JOIN BaseTextProp jn2 ON (uo.ID = jn2.ID) AND (jn2.TYPEOBJ = 8) AND (jn2.POKAZ = ''IZMEN'') ' +
    'LEFT JOIN BaseTextProp jn3 ON (uo.ID = jn2.ID) AND (jn2.TYPEOBJ = 8) AND (jn2.POKAZ = ''RESHSUD'') ' +
    'WHERE uo.DATEZ >= ' + '''' + parfDate + '''' +
    ' AND uo.DATEZ <= ' + '''' + parlDate + '''' +
    ' ORDER BY uo.NOMER'; //AND VOSSTAN=false
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else
      aqReadBase.Free;
  except
    aqReadBase.Free;
  end;
end;

//********************
// Установление материнства
//********************
function ScriptMotherhood(acReadBase: TAdsConnection): TAdsQuery;
var
  script, str : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';

  arrSrc.CommaText := arrSrcMH;  //?
  arrDst.CommaText := arrDstMH;  //?

  n := arrSrc.Count - 1;

  aqReadBase:=TAdsQuery.Create(nil);
  aqReadBase.AdsConnection:=acReadBase;
  try

    for i := 0 to n do begin
        flag := false;
        str := copy(arrSrc[i],length(arrSrc[i]) - 4, 5);
        if str = 'name$' then begin
          // жених
          if arrSrc[i] = 'ON_NATION_name$' then
            script := script + 'sn1.NAME as ' + arrSrc[i];

          if arrSrc[i] = 'NAME_ZAGS_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME) as ' + arrSrc[i];
          if arrSrc[i] = 'NAME_ZAGS_B_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME_B) as ' + arrSrc[i];

          if arrSrc[i] = 'ON_M_B_GOROD_name$' then
            script := script + 'tp1.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ON_DOK_TYPE_name$' then
            script := script + 'td1.NAME as ' + arrSrc[i];
          // невеста
          if arrSrc[i] = 'ONA_NATION_name$' then
            script := script + 'sn2.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_M_B_GOROD_name$' then
            script := script + 'tp2.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_DOK_TYPE_name$' then
            script := script + 'td2.NAME as ' + arrSrc[i];
          // ---
          if arrSrc[i] = 'VOENKOM_name$' then
            script := script + 'vm1.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'B_GOROD_name$' then
            script := script + 'tp3.FNAME as ' + arrSrc[i];
          flag := true;
        end;
        if str = 'join$' then begin
          if arrSrc[i] = 'OTHER_join$' then
            script := script + 'jn1.Value as ' + arrSrc[i];
          if arrSrc[i] = 'IZMEN_join$' then
            script := script + 'jn2.Value as ' + arrSrc[i];
          if arrSrc[i] = 'RESHSUD_join$' then
            script := script + 'jn3.Value as ' + arrSrc[i];
          flag := true;
        end;

        if not flag then begin
          script := script + 'uo.' + arrSrc[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'uo.' +arrSrc[i];
    end;
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM АктыУстМатеринства uo ' +
    // отец
    'LEFT JOIN SysSpr.СпрНациональностей sn1 ON uo.ON_NATION = sn1.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp1 ON uo.ON_M_B_GOROD = tp1.ID ' +
    'LEFT JOIN SysSpr.SprTypeDok td1 ON uo.ON_DOK_TYPE = td1.ID ' +
    // мать
    'LEFT JOIN SysSpr.СпрНациональностей sn2 ON uo.ONA_NATION = sn2.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp2 ON uo.ONA_M_B_GOROD = tp2.ID ' +
    'LEFT JOIN SysSpr.SprTypeDok td2 ON uo.ONA_DOK_TYPE = td2.ID ' +
    // ---
    'LEFT JOIN SysSpr.TypePunkt tp3 ON uo.B_GOROD = tp3.ID ' +
    'LEFT JOIN SysSpr.SprVoenkom vm1 ON uo.VOENKOM = vm1.ID ' +
    'LEFT JOIN SprNames sz ON uo.ID_ZAGS = sz.ID ' +
    'LEFT JOIN BaseTextProp jn1 ON (uo.ID = jn1.ID) AND (jn1.TYPEOBJ = 8) AND (jn1.POKAZ = ''OTHER'') ' +
    'LEFT JOIN BaseTextProp jn2 ON (uo.ID = jn2.ID) AND (jn2.TYPEOBJ = 8) AND (jn2.POKAZ = ''IZMEN'') ' +
    'LEFT JOIN BaseTextProp jn3 ON (uo.ID = jn2.ID) AND (jn2.TYPEOBJ = 8) AND (jn2.POKAZ = ''RESHSUD'') ' +
    'WHERE uo.DATEZ >= ' + '''' + parfDate + '''' +
    ' AND uo.DATEZ <= ' + '''' + parlDate + '''' +
    ' ORDER BY uo.NOMER'; //AND VOSSTAN=false
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else
      aqReadBase.Free;
  except
    aqReadBase.Free;
  end;
end;

//------------------------------------------------------------------
// РАЗВОДЫ
//------------------------------------------------------------------
function ScriptDivorces(acReadBase: TAdsConnection): TAdsQuery;
var
  script, str : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';

  arrSrc.CommaText := arrSrcTM;  //?
  arrDst.CommaText := arrDstTM;  //?

  n := arrSrc.Count - 1;

  aqReadBase := TAdsQuery.Create(nil);
  try
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n do begin
        flag := false;
        str := copy(arrSrc[i],length(arrSrc[i]) - 4, 5);
        if str = 'name$' then begin
          // жених
          if arrSrc[i] = 'ON_B_GOROD_name$' then
            script := script + 'tp1.FNAME as ' + arrSrc[i];

          if arrSrc[i] = 'NAME_ZAGS_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME) as ' + arrSrc[i];
          if arrSrc[i] = 'NAME_ZAGS_B_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME_B) as ' + arrSrc[i];

          if arrSrc[i] = 'ON_NATION_name$' then
            script := script + 'sn1.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ON_M_B_GOROD_name$' then
            script := script + 'tp2.FNAME as ' + arrSrc[i];
          //if arrSrc[i] = 'ON_DOK_ORGAN_name$' then
            //script := script + 'td1.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ON_VOENKOM_name$' then
            script := script + 'vm1.NAME as ' + arrSrc[i];
          // невеста
          if arrSrc[i] = 'ONA_B_GOROD_name$' then
            script := script + 'tp3.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_NATION_name$' then
            script := script + 'sn2.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_M_B_GOROD_name$' then
            script := script + 'tp4.FNAME as ' + arrSrc[i];
          //if arrSrc[i] = 'ONA_DOK_ORGAN_name$' then
            //script := script + 'td2.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_VOENKOM_name$' then
            script := script + 'vm2.NAME as ' + arrSrc[i];
          flag := true;
        end;
        if str = 'join$' then begin
          if arrSrc[i] = 'OTHER_join$' then
            script := script + 'jn1.Value as ' + arrSrc[i];
          if arrSrc[i] = 'IZMEN_join$' then
            script := script + 'jn2.Value as ' + arrSrc[i];
          flag := true;
        end;

        if not flag then begin
          script := script + 'zb.' + arrSrc[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'zb.' +arrSrc[i];
    end;
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM AktTermMarriage zb ' +
    // жених
    'LEFT JOIN SysSpr.TypePunkt tp1 ON zb.ON_B_GOROD = tp1.ID ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn1 ON zb.ON_NATION = sn1.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp2 ON zb.ON_M_B_GOROD = tp2.ID ' +
    //'LEFT JOIN SysSpr.SprTypeDok td1 ON zb.ON_DOK_ORGAN = td1.ID ' +
    'LEFT JOIN SysSpr.SprVoenkom vm1 ON zb.ON_VOENKOM = vm1.ID ' +
    // невеста
    'LEFT JOIN SysSpr.TypePunkt tp3 ON zb.ONA_B_GOROD = tp3.ID ' +
    'LEFT JOIN SprNames sz ON zb.ID_ZAGS = sz.ID ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn2 ON zb.ONA_NATION = sn2.ID ' +
    'LEFT JOIN SysSpr.TypePunkt tp4 ON zb.ONA_M_B_GOROD = tp4.ID ' +
    //'LEFT JOIN SysSpr.SprTypeDok td2 ON zb.ONA_DOK_ORGAN = td2.ID ' +
    'LEFT JOIN SysSpr.SprVoenkom vm2 ON zb.ONA_VOENKOM = vm2.ID ' +
    'LEFT JOIN BaseTextProp jn1 ON (zb.ID = jn1.ID) AND (jn1.TYPEOBJ = 5) AND (jn1.POKAZ = ''OTHER'') ' +
    'LEFT JOIN BaseTextProp jn2 ON (zb.ID = jn2.ID) AND (jn2.TYPEOBJ = 5) AND (jn2.POKAZ = ''IZMEN'') ' +
    // ---
    'WHERE zb.DATEZ >= ' + '''' + parfDate + '''' +
    ' AND zb.DATEZ <= ' + '''' + parlDate + '''' +
    ' AND VOSSTAN=false ORDER BY zb.NOMER';
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else                                     
      aqReadBase.Free;
  except
    aqReadBase.Free;
  end;
end;

function ScriptChangeName(acReadBase: TAdsConnection): TAdsQuery;
var
  script, str : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';

  arrSrc.CommaText := arrSrcCN;  //?
  arrDst.CommaText := arrDstCN;  //?

  n := arrSrc.Count - 1;

  aqReadBase := TAdsQuery.Create(nil);
  try
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n do begin
        flag := false;
        str := copy(arrSrc[i],length(arrSrc[i]) - 4, 5);
        if str = 'name$' then begin
          if arrSrc[i] = 'NATION_name$' then
            script := script + 'sn1.NAME as ' + arrSrc[i];

          if arrSrc[i] = 'SM_B_GOROD_name$' then
            script := script + 'tp1.FNAME as ' + arrSrc[i];

          if arrSrc[i] = 'NAME_ZAGS_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME) as ' + arrSrc[i];
          if arrSrc[i] = 'NAME_ZAGS_B_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME_B) as ' + arrSrc[i];

          if arrSrc[i] = 'RG_B_GOROD_name$' then
            script := script + 'tp2.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'GT_B_GOROD_name$' then
            script := script + 'tp3.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'VOENKOM_name$' then
            script := script + 'vm1.NAME as ' + arrSrc[i];
          flag := true;
        end;
        if str = 'join$' then begin
          if arrSrc[i] = 'OTHER_join$' then
            script := script + 'jn1.Value as ' + arrSrc[i];
          if arrSrc[i] = 'IZMEN_join$' then
            script := script + 'jn2.Value as ' + arrSrc[i];
          flag := true;
        end;

        if not flag then begin
          script := script + 'ss.' + arrSrc[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'as.' +arrSrc[i];
    end;
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM AktChangeName ss ' +
    'LEFT JOIN SysSpr.СпрНациональностей sn1 ON ss.NATION = sn1.ID ' +
   // 'LEFT JOIN SysSpr.TypePunkt tp1 ON ss.SM_B_GOROD = tp1.ID ' +
    //'LEFT JOIN SysSpr.TypePunkt tp2 ON ss.RG_B_GOROD = tp2.ID ' +
    //'LEFT JOIN SprNames sz ON ss.ID_ZAGS = sz.ID ' +
    //'LEFT JOIN SysSpr.TypePunkt tp3 ON ss.GT_B_GOROD = tp3.ID ' +
    //'LEFT JOIN SysSpr.SprVoenkom vm1 ON ss.VOENKOM = vm1.ID ' +
    //'LEFT JOIN BaseTextProp jn1 ON (ss.ID = jn1.ID) AND (jn1.TYPEOBJ = 7) AND (jn1.POKAZ = ''OTHER'') ' +
    //'LEFT JOIN BaseTextProp jn2 ON (ss.ID = jn2.ID) AND (jn2.TYPEOBJ = 7) AND (jn2.POKAZ = ''IZMEN'') ' +
    'WHERE ss.DATEZ >= ' + '''' + parfDate + '''' +
    ' AND ss.DATEZ <= ' + '''' + parlDate + '''' +
    ' AND VOSSTAN=false ORDER BY ss.NOMER';
    aqReadBase.Open;
    if aqReadBase.RecordCount > 0 then
      Result := aqReadBase
    else
      aqReadBase.Free;
  except
    aqReadBase.Free;
  end;
end;

//********************
// Усыновление
//********************
function ScriptAdoption(acReadBase: TAdsConnection): TAdsQuery;
var
  script, str : String;
  i, j, n : integer;
  flag : Boolean;
  aqReadBase : TAdsQuery;
begin
  Result := nil;
  script := '';

  arrSrc.CommaText := arrSrcA;  //?
  arrDst.CommaText := arrDstA;  //?

  n := arrSrc.Count - 1;

  aqReadBase := TAdsQuery.Create(nil);
  try
    aqReadBase.AdsConnection := acReadBase;

    for i := 0 to n do begin
        flag := false;
        str := copy(arrSrc[i],length(arrSrc[i]) - 4, 5);
        if str = 'name$' then begin

          if arrSrc[i] = 'ON_NATION_name$' then
            script := script + 'sn1.NAME as ' + arrSrc[i];

          if arrSrc[i] = 'NAME_ZAGS_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME) as ' + arrSrc[i];
          if arrSrc[i] = 'NAME_ZAGS_B_name$' then
            script := script + 'IIF(id_zags='+sCurZAGS+','''',sz.NAME_B) as ' + arrSrc[i];

          if arrSrc[i] = 'ON_M_B_GOROD_name$' then
            script := script + 'tp1.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ON_DOK_TYPE_name$' then
            script := script + 'td1.NAME as ' + arrSrc[i];

          if arrSrc[i] = 'ONA_NATION_name$' then
            script := script + 'sn2.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_M_B_GOROD_name$' then
            script := script + 'tp2.FNAME as ' + arrSrc[i];
          if arrSrc[i] = 'ONA_DOK_TYPE_name$' then
            script := script + 'td2.NAME as ' + arrSrc[i];
          // ---
          if arrSrc[i] = 'VOENKOM_name$' then
            script := script + 'vm1.NAME as ' + arrSrc[i];
          if arrSrc[i] = 'B_GOROD_name$' then
            script := script + 'tp3.FNAME as ' + arrSrc[i];
          flag := true;
        end;
        if str = 'join$' then begin
          if arrSrc[i] = 'OTHER_join$' then
            script := script + 'jn1.Value as ' + arrSrc[i];
          if arrSrc[i] = 'IZMEN_join$' then
            script := script + 'jn2.Value as ' + arrSrc[i];
          if arrSrc[i] = 'RESHSUD_join$' then
            script := script + 'jn3.Value as ' + arrSrc[i];
          flag := true;
        end;

        if not flag then begin
          script := script + 'uo.' + arrSrc[i];
          flag := true;
        end;
        if i < n then
          script := script + ', ';
        if (i = n) and (not flag) then
          script := script + 'uo.' +arrSrc[i];
    end;
    aqReadBase.SQL.Text := 'SELECT ' + script + ' FROM AktAdopt uo ' +
    // отец
    //'LEFT JOIN SysSpr.СпрНациональностей sn1 ON uo.ON_NATION = sn1.ID ' +
    //'LEFT JOIN SysSpr.TypePunkt tp1 ON uo.ON_M_B_GOROD = tp1.ID ' +
    //'LEFT JOIN SysSpr.SprTypeDok td1 ON uo.ON_DOK_TYPE = td1.ID ' +
    // мать
    //'LEFT JOIN SysSpr.СпрНациональностей sn2 ON uo.ONA_NATION = sn2.ID ' +
    //'LEFT JOIN SysSpr.TypePunkt tp2 ON uo.ONA_M_B_GOROD = tp2.ID ' +
    //'LEFT JOIN SysSpr.SprTypeDok td2 ON uo.ONA_DOK_TYPE = td2.ID ' +
    // ---
    //'LEFT JOIN SysSpr.TypePunkt tp3 ON uo.B_GOROD = tp3.ID ' +
    //'LEFT JOIN SysSpr.SprVoenkom vm1 ON uo.VOENKOM = vm1.ID ' +
    //'LEFT JOIN SprNames sz ON uo.ID_ZAGS = sz.ID ' +
    'LEFT JOIN BaseTextProp jn1 ON (uo.ID = jn1.ID) AND (jn1.TYPEOBJ = 8) AND (jn1.POKAZ = ''OTHER'') ' +
    'LEFT JOIN BaseTextProp jn2 ON (uo.ID = jn2.ID) AND (jn2.TYPEOBJ = 8) AND (jn2.POKAZ = ''IZMEN'') ' +
    'LEFT JOIN BaseTextProp jn3 ON (uo.ID = jn2.ID) AND (jn2.TYPEOBJ = 8) AND (jn2.POKAZ = ''RESHSUD'') ' +
    'WHERE uo.DATEZ >= ' + '''' + parfDate + '''' +
    ' AND uo.DATEZ <= ' + '''' + parlDate + '''' +
    ' ORDER BY uo.NOMER'; //AND VOSSTAN=false
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

function children(childs : String; var children, node: TXmlNode): Boolean;
var
  str : String;
  sl : TStringList;
  i, j : Integer;
begin
  Result := false;
  sl := TStringList.Create;
  try
    try
      sl.CommaText := childs;
      if (sl.Count >= 4) and (length(sl.Strings[2]) > 2) then begin
        for i := 0 to (sl.Count div 4) - 1 do begin
          node := children.NodeNew('child');
          node.NodeNew('surname').ValueAsString := sl.Strings[4*i + 0];
          node.NodeNew('name').ValueAsString := sl.Strings[4*i + 1];
          node.NodeNew('patronymic').ValueAsString := sl.Strings[4*i + 2];
          node.NodeNew('year').ValueAsString := sl.Strings[4*i + 3];
        end;
      end;
      Result := true;
    except
      on E: Exception do MessageDlg('Ошибка при формировании списка детей в ак. зап. "Браки"!' + #13#10 +E.Message, mtError, [mbOk], 0);
    end;
  finally
    sl.Free;
  end;
end;

var
  i, j, k : Integer;
  str, tag, long, fl, selectQuery: String;
  flag : Boolean;
  Value : Variant;
  dt : TDateTime;
  NativeDoc : TNativeXml;
  node, row, temp : TXmlNode;
begin
  NativeDoc := TNativeXml.Create;
  try
  NativeDoc.ReadFromString('<' + typeBase + '/>');
  try
    aqReadBase.First;
    for j := 0 to aqReadBase.RecordCount - 1 do begin
      nCount:=nCount+1;
      if nCount>100 then begin
        nCount:=0;
        Application.ProcessMessages;
      end;
      row := NativeDoc.Root.NodeNew('row');
      for i := 0 to arrDst.Count - 1 do begin
        long := '';
        flag := false;
        str := arrDst.Strings[i];
        // исключения
        tag := copy(str, 1, pos('/', str) - 1);
        for k := 0 to ExceptList.Count - 1 do begin
          if ExceptList.Strings[k] = tag then
            flag := true;
          if flag = true then
            break;
        end;
        Value := aqReadBase.FieldByName(arrSrc[i]).AsString;
        if aqReadBase.FieldDefs.Find(arrSrc[i]).DataType = ftDate then begin
          if aqReadBase.FieldByName(arrSrc[i]).IsNull
            then Value:=''
            else Value:=DateToStr(aqReadBase.FieldByName(arrSrc[i]).AsDateTime, fs);
        end;
        // особая обработка
        if (typeBase = 'marriage') and (arrSrc[i] = 'DETI') then begin
          temp := row.NodeNew('children');
          children(Value, temp, node);
          flag := true;
        end;
        // ---
        if not flag then begin // (pos('@', str) = 0) and
          node := row;
          while str <> '' do begin
            if (pos('/', str) <> 0) then begin
              tag := copy(str, 1, pos('/', str) - 1);
              delete(str, 1, pos('/', str));
            end
            else begin
              tag := str;
              str := '';
            end;
            if (str = '') and (copy(tag, 1, 1) = '@') then begin // если атрибут
              delete(tag, 1, 1);
              row.FindNode('/'+ typeBase +'/row' + long).AttributeAdd(tag, String(Value))
            end
            else begin // во всех остальных случаях
              node := row.FindNode('/'+ typeBase +'/row' + long + '/' + tag);
              if (node = nil) and (long <> '') then begin
                node := row.FindNode('/'+ typeBase +'/row' + long).NodeNew(tag);
              end;
              if (node = nil) and (long = '') then
                node := row.NodeNew(tag);
              if str = '' then
                node.ValueAsString := String(Value);
              if long <> '' then
                long := long + '/' + tag
              else
                long := '/' + long + tag;
            end;
          end;
        end;
      end;
      aqReadBase.Next;
    end;
    NativeDoc.XmlFormat := xfReadable;
    str := (NativeDoc.WriteToString);
    XmlStrings.Add(str);
  except
    on E: Exception do MessageDlg('Ошибка при формировании XML!' + #13#10 +E.Message, mtError, [mbOk], 0);
  end;
  finally
    NativeDoc.Free;
  end;
end;

//------------------------------------------------------------------
function ZAGS2Xml(TypeBase: TTypeBase; Params : TXMLParams; lOnlyReport:Boolean; report : TfrxReport): Boolean;
var
  qBirth, qDeath, qMarriages, qPaternity, qDivorces, qChangename, qMotherhood,
  qAdoption : TAdsQuery;
  XmlStrings : TStrings;
  frxObject:TfrxComponent;
//  report : TfrxReport;
  Cross : TfrxCrossView;
  frDSBirth, frDSDeath, frDSMarriages, frDSDivorces, frDSPaternity, frDSChangename,
  frDSMotherhood, frDSAdoption : TfrxDBDataset;
  info : String;
  // ---
  Ini : TIniFile;
  Fields, Tags : TStringList;
  strings : TStrings;
  i, j : Integer;
  NativeDoc : TNativeXml;
  node : TXmlNode;
  fl : Boolean;
  lMyReport:Boolean;
begin
  info := '';
  Result := false;
  fl := false;
  sCurZAGS:='0';
  nCount:=0;
  try
  try
    arrSrc := TStringList.Create;
    arrDst := TStringList.Create;
    ExceptList := TStringList.Create;
    NativeDoc := TNativeXml.Create;

    qBirth := nil;
    qDeath := nil;
    qMarriages := nil;
    qPaternity := nil;
    qDivorces:=nil;
	  qChangename:=nil;
    qMotherhood:=nil;
    qAdoption:=nil;

    // чтение ini c тегами и полями
    Ini := TIniFile.Create(Params.PathIni); // !!!!!!!!!!!!
    Fields := TStringList.Create;
    Tags := TStringList.Create;
    strings := TStringList.Create;
    // РОЖДЕНИЯ
    Ini.ReadSection('birth', strings);
    Fields.AddStrings(strings);
    Ini.ReadSectionValues('birth', strings);
    arrSrcB := '';
    arrDstB := '';
    for i := 0 to Fields.Count - 1 do begin
      Tags.Append(Ini.ReadString('birth', Fields[i], ''));
      arrSrcB := arrSrcB + Fields[i] + ',';
      arrDstB := arrDstB + Ini.ReadString('birth', Fields[i], '') + ','
    end;
    delete(arrSrcB, length(arrSrcB), 1);
    delete(arrDstB, length(arrDstB), 1);
    // БРАКИ
    Fields.Clear;
    Tags.Clear;
    Ini.ReadSection('marriage', strings);
    Fields.AddStrings(strings);
    Ini.ReadSectionValues('marriage', strings);
    arrSrcM := '';
    arrDstM := '';
    for i := 0 to Fields.Count - 1 do begin
      Tags.Append(Ini.ReadString('marriage', Fields[i], ''));
      arrSrcM := arrSrcM + Fields[i] + ',';
      arrDstM := arrDstM + Ini.ReadString('marriage', Fields[i], '') + ','
    end;
    delete(arrSrcM, length(arrSrcM), 1);
    delete(arrDstM, length(arrDstM), 1);
    // РАЗВОДЫ
    Fields.Clear;
    Tags.Clear;
    Ini.ReadSection('divorces', strings);
    Fields.AddStrings(strings);
    Ini.ReadSectionValues('divorces', strings);
    arrSrcTM := '';
    arrDstTM := '';
    for i := 0 to Fields.Count - 1 do begin
      Tags.Append(Ini.ReadString('divorces', Fields[i], ''));
      arrSrcTM := arrSrcTM + Fields[i] + ',';
      arrDstTM := arrDstTM + Ini.ReadString('divorces', Fields[i], '') + ','
    end;
    delete(arrSrcTM, length(arrSrcTM), 1);
    delete(arrDstTM, length(arrDstTM), 1);
    // СМЕРТИ
    Fields.Clear;
    Tags.Clear;
    Ini.ReadSection('death', strings);
    Fields.AddStrings(strings);
    Ini.ReadSectionValues('death', strings);
    arrSrcD := '';
    arrDstD := '';
    for i := 0 to Fields.Count - 1 do begin
      Tags.Append(Ini.ReadString('death', Fields[i], ''));
      arrSrcD := arrSrcD + Fields[i] + ',';
      arrDstD := arrDstD + Ini.ReadString('death', Fields[i], '') + ','
    end;
    delete(arrSrcD, length(arrSrcD), 1);
    delete(arrDstD, length(arrDstD), 1);
    // УСТ. ОТЦОВСТВА
    Fields.Clear;
    Tags.Clear;
    Ini.ReadSection('paternity', strings);
    Fields.AddStrings(strings);
    Ini.ReadSectionValues('paternity', strings);
    arrSrcP := '';
    arrDstP := '';
    for i := 0 to Fields.Count - 1 do begin
      Tags.Append(Ini.ReadString('paternity', Fields[i], ''));
      arrSrcP := arrSrcP + Fields[i] + ',';
      arrDstP := arrDstP + Ini.ReadString('paternity', Fields[i], '') + ','
    end;
    delete(arrSrcP, length(arrSrcP), 1);
    delete(arrDstP, length(arrDstP), 1);
    // УСТ. МАТЕРИНСТВА
    Fields.Clear;
    Tags.Clear;
    Ini.ReadSection('motherhood', strings);
    Fields.AddStrings(strings);
    Ini.ReadSectionValues('motherhood', strings);
    arrSrcMH := '';
    arrDstMH := '';
    for i := 0 to Fields.Count - 1 do begin
      Tags.Append(Ini.ReadString('motherhood', Fields[i], ''));
      arrSrcMH := arrSrcMH + Fields[i] + ',';
      arrDstMH := arrDstMH + Ini.ReadString('motherhood', Fields[i], '') + ','
    end;
    delete(arrSrcMH, length(arrSrcMH), 1);
    delete(arrDstMH, length(arrDstMH), 1);
	// ПЕРЕМЕНА ИМЕНИ
    Fields.Clear;
    Tags.Clear;
    Ini.ReadSection('changename', strings);
    Fields.AddStrings(strings);
    Ini.ReadSectionValues('changename', strings);
    arrSrcCN := '';
    arrDstCN := '';
    for i := 0 to Fields.Count - 1 do begin
      Tags.Append(Ini.ReadString('changename', Fields[i], ''));
      arrSrcCN := arrSrcCN + Fields[i] + ',';
      arrDstCN := arrDstCN + Ini.ReadString('changename', Fields[i], '') + ','
    end;
    delete(arrSrcCN, length(arrSrcCN), 1);
    delete(arrDstCN, length(arrDstCN), 1);
	  // УСЫНОВЛЕНИЕ
    Fields.Clear;
    Tags.Clear;
    Ini.ReadSection('adoption', strings);
    Fields.AddStrings(strings);
    Ini.ReadSectionValues('adoption', strings);
    arrSrcA := '';
    arrDstA := '';
    for i := 0 to Fields.Count - 1 do begin
      Tags.Append(Ini.ReadString('adoption', Fields[i], ''));
      arrSrcA := arrSrcA + Fields[i] + ',';
      arrDstA := arrDstA + Ini.ReadString('adoption', Fields[i], '') + ','
    end;
    delete(arrSrcA, length(arrSrcA), 1);
    delete(arrDstA, length(arrDstA), 1);
    // ---
    lMyReport:=false;
    if report=nil then begin
      report := TfrxReport.Create(nil);
      lMyReport:=true;
    end;
    report.EngineOptions.UseGlobalDataSetList := false;
    report.EnabledDataSets.Clear();
    report.DataSets.Clear();

    parlDate := Params.lastDate;
    parfDate := Params.firstDate;
    ExceptList.CommaText := Params.ExceptList;
    XmlStrings := TStringList.Create;
    with fs do begin
      DateSeparator:='-';
      ShortDateFormat:='yyyy-mm-dd';
      LongDateFormat:='yyyy-mm-dd';       
    end;
    if not lOnlyReport then begin
      // --- до данных ---
      XmlStrings.Add('<?xml version="1.0" encoding="UTF-8"?>');
      XmlStrings.Add('<base xsi:noNamespaceSchemaLocation="zags.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');
      XmlStrings.Add('<info>');
      XmlStrings.Add(#9 + '<version>' + Version + '</version>');
      XmlStrings.Add(#9 + '<soato>' + Params.Soato + '</soato>');
      XmlStrings.Add(#9 + '<id_zags>' + Params.ID + '</id_zags>');
      XmlStrings.Add(#9 + '<name>' + Params.Name + '</name>');
      XmlStrings.Add(#9 + '<name_bel>' + Params.NameBel + '</name_bel>');
      XmlStrings.Add(#9 + '<shtamp>' + Params.Shtamp + '</shtamp>');
      XmlStrings.Add(#9 + '<first_date>' + Params.firstDate + '</first_date>');
      XmlStrings.Add(#9 + '<last_date>' + Params.lastDate + '</last_date>');
      XmlStrings.Add(#9 + '<birth_count>' + '</birth_count>');
      XmlStrings.Add(#9 + '<marriage_count>' + '</marriage_count>');
      XmlStrings.Add(#9 + '<divorces_count>' + '</divorces_count>');
      XmlStrings.Add(#9 + '<death_count>' + '</death_count>');
      XmlStrings.Add(#9 + '<paternity_count>' + '</paternity_count>');
      XmlStrings.Add(#9 + '<motherhood_count>' + '</motherhood_count>');
      XmlStrings.Add(#9 + '<changename_count>' + '</changename_count>');
      XmlStrings.Add(#9 + '<adoption_count>' + '</adoption_count>');
      XmlStrings.Add('</info>');
    end;

    sCurZags:=Params.ID;
    //XmlStrings.Add(#9 + '<date>' + DateToStr(date, fs) + '</date>');
    // ----
    if tbBirth in typeBase then begin
      arrSrc.CommaText := arrSrcB;
      arrDst.CommaText := arrDstB;
      //Query := TADSQuery.Create(nil);
      qBirth := ScriptBirth(Params.Connection);
      if qBirth <> nil then begin
       if not lOnlyReport
         then DS2Xml(XmlStrings, 'birth', qBirth);
       // выходная форма
       qBirth.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM АктыРождений ar ' +
                         'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
                         'LEFT JOIN SprNames sn ON ar.ID_ZAGS = sn.ID ' +
                         ' WHERE ar.DATEZ >= ' + '''' + parfDate + '''' +
                         ' AND ar.DATEZ <= ' + '''' + parlDate + '''' +
                         ' ORDER BY soato, datez, ar.NOMER';
       qBirth.Open;
      end;
    end;
    if tbDivorces in typeBase then begin
      arrSrc.CommaText := arrSrcTM;
	    arrDst.CommaText := arrDstTM;
      //Query := TADSQuery.Create(nil);
      qDivorces := ScriptDivorces(Params.Connection);
      if qDivorces <> nil then begin
        if not lOnlyReport
          then DS2Xml(XmlStrings, 'divorces', qDivorces);
        // выходная форма
        qDivorces.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM AktTermMarriage ar ' +
                         'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
                         'LEFT JOIN SprNames sn ON ar.ID_ZAGS = sn.ID ' +
                         ' WHERE ar.DATEZ >= ' + '''' + parfDate + '''' +
                         ' AND ar.DATEZ <= ' + '''' + parlDate + '''' +
                         ' ORDER BY soato, datez, ar.NOMER';
        qDivorces.Open;
      end;
    end;

    if tbMarriages in typeBase then begin
      arrSrc.CommaText := arrSrcM;
	    arrDst.CommaText := arrDstM;
      //Query := TADSQuery.Create(nil);
      qMarriages := ScriptMarriages(Params.Connection);
      if qMarriages <> nil then begin
         if not lOnlyReport
           then DS2Xml(XmlStrings, 'marriage', qMarriages);
        // выходная форма
        qMarriages.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM ЗаключениеБраков ar ' +
                         'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
                         'LEFT JOIN SprNames sn ON ar.ID_ZAGS = sn.ID ' +
                         ' WHERE ar.DATEZ >= ' + '''' + parfDate + '''' +
                         ' AND ar.DATEZ <= ' + '''' + parlDate + '''' +
                         ' ORDER BY soato, datez, ar.NOMER';
        qMarriages.Open;
      end;
    end;
    if tbDeath in typeBase then begin
      arrSrc.CommaText := arrSrcD;
   	  arrDst.CommaText := arrDstD;
      //Query := TADSQuery.Create(nil);
      qDeath := ScriptDeath(Params.Connection);
      if qDeath <> nil then begin
        if not lOnlyReport
          then DS2Xml(XmlStrings, 'death', qDeath);
        // выходная форма
        qDeath.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM АктыСмертей ar ' +
                         'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
                         'LEFT JOIN SprNames sn ON ar.ID_ZAGS = sn.ID ' +
                         ' WHERE ar.DATEZ >= ' + '''' + parfDate + '''' +
                         ' AND ar.DATEZ <= ' + '''' + parlDate + '''' +
                         ' ORDER BY soato, datez, ar.NOMER';
        qDeath.Open;
      end;
    end;
    if tbPaternity in typeBase then begin
      arrSrc.CommaText := arrSrcP;
      arrDst.CommaText := arrDstP;
      //Query := TADSQuery.Create(nil);
      qPaternity := ScriptPaternity(Params.Connection);
      if qPaternity <> nil then begin
        if not lOnlyReport
          then DS2Xml(XmlStrings, 'paternity', qpaternity);
        // выходная форма
        qPaternity.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM АктыУстОтцовства uo ' +
                         'LEFT JOIN SprNames ss ON uo.ID_ZAGS = ss.ID ' +
                         'LEFT JOIN SprNames sn ON uo.ID_ZAGS = sn.ID ' +
                         ' WHERE uo.DATEZ >= ' + '''' + parfDate + '''' +
                         ' AND uo.DATEZ <= ' + '''' + parlDate + '''' +
                         ' ORDER BY soato, uo.NOMER';
        qPaternity.Open;
      end;
    end;
    if tbMotherhood in typeBase then begin
      arrSrc.CommaText := arrSrcMH;
      arrDst.CommaText := arrDstMH;
      //Query := TADSQuery.Create(nil);
      qMotherhood := ScriptMotherhood(Params.Connection);
      if qMotherhood <> nil then begin
        if not lOnlyReport
          then DS2Xml(XmlStrings, 'motherhood', qMotherhood);
        // выходная форма
        qMotherhood.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM АктыУстМатеринства uo ' +
                         'LEFT JOIN SprNames ss ON uo.ID_ZAGS = ss.ID ' +
                         'LEFT JOIN SprNames sn ON uo.ID_ZAGS = sn.ID ' +
                         ' WHERE uo.DATEZ >= ' + '''' + parfDate + '''' +
                         ' AND uo.DATEZ <= ' + '''' + parlDate + '''' +
                         ' ORDER BY soato, uo.NOMER';
        qMotherhood.Open;
      end;
    end;
    if tbChangename in typeBase then begin
      arrSrc.CommaText := arrSrcCN;
   	  arrDst.CommaText := arrDstCN;
      //Query := TADSQuery.Create(nil);
      qChangename := ScriptChangename(Params.Connection);
      if qChangename <> nil then begin
         if not lOnlyReport
           then DS2Xml(XmlStrings, 'changename', qChangename);
        // выходная форма
        qChangename.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM AktChangeName ar ' +
                         'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
                         'LEFT JOIN SprNames sn ON ar.ID_ZAGS = sn.ID ' +
                         ' WHERE ar.DATEZ >= ' + '''' + parfDate + '''' +
                         ' AND ar.DATEZ <= ' + '''' + parlDate + '''' +
                         ' ORDER BY soato, datez, ar.NOMER';
        qChangename.Open;
      end;
    end;
    if tbAdoption in typeBase then begin
      arrSrc.CommaText := arrSrcA;
   	  arrDst.CommaText := arrDstA;
      //Query := TADSQuery.Create(nil);
      qAdoption := ScriptAdoption(Params.Connection);
      if qAdoption <> nil then begin
        if not lOnlyReport
          then DS2Xml(XmlStrings, 'adoption', qAdoption);
        // выходная форма
        qAdoption.SQL.Text := 'SELECT ss.Soato as soato, nomer, sn.NAME, datez as DATE FROM AktAdopt ar ' +
                         'LEFT JOIN SprNames ss ON ar.ID_ZAGS = ss.ID ' +
                         'LEFT JOIN SprNames sn ON ar.ID_ZAGS = sn.ID ' +
                         ' WHERE ar.DATEZ >= ' + '''' + parfDate + '''' +
                         ' AND ar.DATEZ <= ' + '''' + parlDate + '''' +
                         ' ORDER BY soato, datez, ar.NOMER';
        qAdoption.Open;
      end;
    end;

    if (qBirth <> nil) or (qMarriages <> nil) or (qDivorces <> nil) or (qDeath <> nil) or
      (qPaternity <> nil) or (qMotherhood <> nil) or (qChangename <> nil) or (qAdoption <> nil) then begin
      fl:=true;
    end;

    if not lOnlyReport then begin
      XmlStrings.Add('</base>');
      // пишу кол-во выгруженных актов
      NativeDoc.ReadFromString(AnsiToUtf8(XmlStrings.Text));

      if qBirth <> nil then begin
        NativeDoc.Root.FindNode('/base/info/birth_count').ValueAsInteger := qBirth.RecordCount;
      end else begin
        NativeDoc.Root.FindNode('/base/info/birth_count').ValueAsInteger := 0;
      end;

      if qMarriages <> nil then begin
        NativeDoc.Root.FindNode('/base/info/marriage_count').ValueAsInteger := qMarriages.RecordCount;
      end else begin
        NativeDoc.Root.FindNode('/base/info/marriage_count').ValueAsInteger := 0;
      end;

      if qDivorces <> nil then begin
        NativeDoc.Root.FindNode('/base/info/divorces_count').ValueAsInteger := qDivorces.RecordCount;
      end else begin
        NativeDoc.Root.FindNode('/base/info/divorces_count').ValueAsInteger := 0;
      end;

      if qDeath <> nil then begin
        NativeDoc.Root.FindNode('/base/info/death_count').ValueAsInteger := qDeath.RecordCount;
      end else begin
        NativeDoc.Root.FindNode('/base/info/death_count').ValueAsInteger := 0;
      end;

      if qPaternity <> nil then begin
        NativeDoc.Root.FindNode('/base/info/paternity_count').ValueAsInteger := qPaternity.RecordCount;
      end else begin
        NativeDoc.Root.FindNode('/base/info/paternity_count').ValueAsInteger := 0;
      end;

      if qMotherhood <> nil then begin
        NativeDoc.Root.FindNode('/base/info/motherhood_count').ValueAsInteger := qMotherhood.RecordCount;
      end else begin
        NativeDoc.Root.FindNode('/base/info/motherhood_count').ValueAsInteger := 0;
      end;

      if qChangename <> nil then begin
        NativeDoc.Root.FindNode('/base/info/changename_count').ValueAsInteger := qChangename.RecordCount;
      end else begin
        NativeDoc.Root.FindNode('/base/info/changename_count').ValueAsInteger := 0;
      end;

      if qAdoption <> nil then begin
        NativeDoc.Root.FindNode('/base/info/adoption_count').ValueAsInteger := qAdoption.RecordCount;
      end else begin
        NativeDoc.Root.FindNode('/base/info/adoption_count').ValueAsInteger := 0;
      end;

      // ---
      NativeDoc.XmlFormat := xfReadable;
      //NativeDoc.ExternalEncoding := seUTF8;
      //NativeDoc.EncodingString := 'UTF-8';
      NativeDoc.SaveToFile(Params.PathXml);
    end;

    //XmlStrings.Clear;
    //XmlStrings.Add(NativeDoc.WriteToString);
    //XmlStrings.Text := AnsiToUtf8(XmlStrings.Text);
    //XmlStrings.SaveToFile(Params.PathXml);

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

    if qPaternity <> nil then begin
      frDSPaternity := TfrxDBDataset.Create(nil);
      frDSPaternity.Name := 'frDSPaternity';
      frDSPaternity.DataSet := qPaternity;
      report.DataSets.Add(frDSPaternity);
      report.EnabledDataSets.Add(frDSPaternity);
      (report.FindObject('MasterData4') as TfrxMasterData).DataSet := frDSPaternity;
      (report.FindObject('paternitycount') as TfrxMemoView).Text := inttostr(qPaternity.RecordCount);
    end;


    if qMotherhood <> nil then begin
      frDSMotherhood := TfrxDBDataset.Create(nil);
      frDSMotherhood.Name := 'frDSMotherhood';
      frDSMotherhood.DataSet := qMotherhood;
      report.DataSets.Add(frDSMotherhood);
      report.EnabledDataSets.Add(frDSMotherhood);
      (report.FindObject('MasterData6') as TfrxMasterData).DataSet := frDSPaternity;
      (report.FindObject('motherhoodcount') as TfrxMemoView).Text := inttostr(qMotherhood.RecordCount);
    end else begin
      {$IFDEF LAIS}
        (report.FindObject('motherhoodcount') as TfrxMemoView).Visible:=false;
        (report.FindObject('motherhoodcell') as TfrxMemoView).Visible:=false;
      {$ENDIF}
    end;

    if qDivorces <> nil then begin
      frDSDivorces := TfrxDBDataset.Create(nil);
      frDSDivorces.Name := 'frDSDivorces';
      frDSDivorces.DataSet := qDivorces;
      report.DataSets.Add(frDSDivorces);
      report.EnabledDataSets.Add(frDSDivorces);
      (report.FindObject('MasterData5') as TfrxMasterData).DataSet := frDSDivorces;
      (report.FindObject('divorcescount') as TfrxMemoView).Text := inttostr(qDivorces.RecordCount);
    end else begin
      {$IFDEF LAIS}
        (report.FindObject('divorcescount') as TfrxMemoView).Visible:=false;
        (report.FindObject('divorcescell') as TfrxMemoView).Visible:=false;
      {$ENDIF}
    end;

    if qChangename <> nil then begin
      frDSChangename:= TfrxDBDataset.Create(nil);
      frDSChangename.Name := 'frDSChangename';
      frDSChangename.DataSet := qChangename;
      report.DataSets.Add(frDSChangename);
      report.EnabledDataSets.Add(frDSChangename);
      (report.FindObject('MasterData7') as TfrxMasterData).DataSet := frDSChangename;
      (report.FindObject('changenamecount') as TfrxMemoView).Text := inttostr(qChangename.RecordCount);
    end else begin
      {$IFDEF LAIS}
        (report.FindObject('changenamecount') as TfrxMemoView).Visible:=false;
        (report.FindObject('changenamecell') as TfrxMemoView).Visible:=false;
      {$ENDIF}
    end;

    if qAdoption <> nil then begin
      frDSAdoption:= TfrxDBDataset.Create(nil);
      frDSAdoption.Name := 'frDSAdoption';
      frDSAdoption.DataSet := qAdoption;
      report.DataSets.Add(frDSAdoption);
      report.EnabledDataSets.Add(frDSAdoption);
      (report.FindObject('MasterData8') as TfrxMasterData).DataSet := frDSAdoption;
      (report.FindObject('adoptioncount') as TfrxMemoView).Text := inttostr(qAdoption.RecordCount);
    end else begin
      {$IFDEF LAIS}
        (report.FindObject('adoptioncount') as TfrxMemoView).Visible:=false;
        (report.FindObject('adoptioncell') as TfrxMemoView).Visible:=false;
      {$ENDIF}
    end;

    (report.FindObject('NameOrg') as TfrxMemoView).Text := Params.Name;
    (report.FindObject('CodeSoato') as TfrxMemoView).Text := 'Код СОАТО: ' + Params.Soato;
    (report.FindObject('DYear') as TfrxMemoView).Text := 'c ' + FormatDateTime('dd.mm.yyyy',STOD(Params.firstDate,tdAds)) + ' по ' +
                         FormatDateTime('dd.mm.yyyy', STOD(Params.lastDate,tdAds)); // + ' год.';

    if qBirth = nil then
      report.Pages[2].Visible := false;
    if qDeath = nil then
      report.Pages[3].Visible := false;
    if qMarriages = nil then
      report.Pages[4].Visible := false;

    if qPaternity = nil then begin
      frxObject:=report.FindObject('PagePaternity');
      if frxObject<>nil then begin
        TfrxPage(frxObject).Visible:=false;
      end;
    end;

    if qMotherhood = nil then begin
      frxObject:=report.FindObject('PageMotherhood');
      if frxObject<>nil then begin
        TfrxPage(frxObject).Visible:=false;
      end;
    end;

    if qDivorces = nil then begin
      frxObject:=report.FindObject('PageDivorces');
      if frxObject<>nil then begin
        TfrxPage(frxObject).Visible:=false;
      end;
    end;

    if qChangeName = nil then begin
      frxObject:=report.FindObject('PageChangename');
      if frxObject<>nil then begin
        TfrxPage(frxObject).Visible:=false;
      end;
    end;

    if qAdoption = nil then begin
      frxObject:=report.FindObject('PageAdoption');
      if frxObject<>nil then begin
        TfrxPage(frxObject).Visible:=false;
      end;
    end;

    if lMyReport then  begin
      report.ShowReport;
    end else begin
      report.PrepareReport;
    end;

    if fl then
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
    if qPaternity <> nil then begin
      frDSPaternity.Free;
      qPaternity.Free;
    end;
    if qMotherhood <> nil then begin
      frDSMotherhood.Free;
      qMotherhood.Free;
    end;
    if qDivorces <> nil then begin
      frDSDivorces.Free;
      qDivorces.Free;
    end;
    if qChangename <> nil then begin
      frDSChangename.Free;
      qChangename.Free;
    end;
    arrSrc.Free;
    arrDst.Free;
    if lMyReport
      then report.Free;
    ExceptList.Free;
    Ini.Free;
    Tags.Free;
    Fields.Free;
    Strings.Free;
    NativeDoc.Free;
  end;
end;


end.
