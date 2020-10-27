//--------------------------------------------------------------------------------------
CREATE FUNCTION GetFieldSL 
   ( 
   strField CHAR ( 20 ),
      strValue MEMO
   )
   RETURNS CHAR ( 200 )
BEGIN

DECLARE k Integer;
DECLARE n Integer;
DECLARE m Integer;

  k=Length(Trim(strField));
  n=Position(Trim(strField)+'=' IN strValue);
  if n>0 then
    m=Locate(CHAR(13)+CHAR(10),strValue,n);
    if m>0 
     then RETURN substring(strValue,n+k+1,m-n-k-1);
     else RETURN substring(strValue,n+k+1,length(strValue));
    end if;
  else
    RETURN '';
  end if;
END;
//--------------------------------------------------------------------------------------
CREATE FUNCTION GetFieldSLD 
   ( 
   strField CHAR ( 20 ),
      strValue MEMO
   )
   RETURNS DATE
BEGIN

  DECLARE s CHAR(20);
  s=getFieldSL(strField,strValue);
  if s='' then 
    RETURN null;
  else	
    RETURN cast(s as SQL_DATE);
  end if;	
END;
//--------------------------------------------------------------------------------------
CREATE FUNCTION GetFieldXML 
   ( 
   strField CHAR ( 20 ),
      strValue MEMO
   )
   RETURNS CHAR ( 200 )
BEGIN
DECLARE k Integer;
DECLARE n Integer;
DECLARE m Integer;

  k=Length(Trim(strField));
  strValue=REPLACE( strValue, char(38)+'apos;', '''');
  strValue=REPLACE( strValue, char(38)+'quot;', '"');
  n=Position('<'+Trim(strField)+'>' IN strValue);
  m=Position('</'+Trim(strField)+'>' IN strValue);
  if n>0 and m>0 then
    RETURN substring(strValue,n+k+2,m-n-k-2);
  else
    RETURN '';
  end if;
END;
