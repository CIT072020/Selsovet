SELECT ID, KOD, NAME, 
    Substring(NAME,3,50) NAME1, 
    Trim(Substring(NAME, POSITION(' ' IN NAME)+1,50)) NAME2
  FROM SysSpr.—Ô—Œ¿“Œ
  WHERE (substring(kod,1,7)='3216804' or substring(kod,1,7)='3216820') and 
    substring(kod,8,3)<>'000'
  ORDER BY 4
