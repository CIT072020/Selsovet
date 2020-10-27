//----------------------------------------------------------------------------
CREATE FUNCTION TrudM( DATE_C DATE, DATE_R DATE)
   RETURNS INTEGER
BEGIN

DECLARE n Integer;
  n=TIMESTAMPDIFF(SQL_TSI_MONTH,DATE_R,DATE_C)-IIF(month(DATE_R)=month(DATE_C), IIF(dayofmonth(DATE_R)-dayofmonth(DATE_C)>0,1,0),0); 

  IF n<192 THEN  // <16 лет
    RETURN 0; 
  ELSEIF DATE_R<'1957-01-01' THEN
    IF n<720 THEN  // 60 дет 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;
  ELSEIF DATE_R<'1957-07-01' THEN
    IF n<726 THEN  // 60,5 год 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;

  ELSEIF DATE_R<'1958-01-01' THEN
    IF n<732 THEN  // 61 год 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;
  ELSEIF DATE_R<'1958-07-01' THEN
    IF n<738 THEN  // 61,5 года 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;

  ELSEIF DATE_R<'1959-01-01' THEN
    IF n<744 THEN  // 62 года 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;
  ELSEIF DATE_R<'1959-07-01' THEN
    IF n<750 THEN  // 62,5 года 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;

  ELSEIF DATE_R>='1959-07-01' THEN
    IF n<756 THEN  // 63 года 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;

  ELSE 
    RETURN -1;
  ENDIF;
END;
//----------------------------------------------------------------------------
CREATE FUNCTION TrudG(DATE_C DATE, DATE_R DATE)
   RETURNS INTEGER
BEGIN

DECLARE n Integer;
  n=TIMESTAMPDIFF(SQL_TSI_MONTH,DATE_R,DATE_C)-IIF(month(DATE_R)=month(DATE_C), IIF(dayofmonth(DATE_R)-dayofmonth(DATE_C)>0,1,0),0); 

  IF n<192 THEN  // <16 лет
    RETURN 0; 
  ELSEIF DATE_R<'1962-01-01' THEN
    IF n<660 THEN  // 55 дет 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;
  ELSEIF DATE_R<'1962-07-01' THEN
    IF n<666 THEN  // 55,5 дет 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;

  ELSEIF DATE_R<'1963-01-01' THEN
    IF n<672 THEN  // 56 дет 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;
  ELSEIF DATE_R<'1963-07-01' THEN
    IF n<678 THEN  // 56,5 дет 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;

  ELSEIF DATE_R<'1964-01-01' THEN
    IF n<684 THEN  // 57 дет 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;
  ELSEIF DATE_R<'1964-07-01' THEN
    IF n<690 THEN  // 57,5 дет 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;

  ELSEIF DATE_R>='1964-07-01' THEN
    IF n<696 THEN  // 58 дет 
      RETURN 1;  // трудоспособный
    ELSE 
      RETURN 2;  // старше
    ENDIF;

  ELSE 
    RETURN -1;
  ENDIF;
END;

//----------------------------------------------------------------------------
CREATE FUNCTION Trud(DATE_C DATE, DATE_R DATE, POL CHAR(1) )
   RETURNS INTEGER
BEGIN
  IF POL='М' THEN
    RETURN TrudM(DATE_C, DATE_R);
  ELSE
    RETURN TrudG(DATE_C, DATE_R);
  ENDIF;
END;

