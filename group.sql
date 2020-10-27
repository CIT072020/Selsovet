select n.FAMILIA as Field_0,n.NAME as Field_1,count(*) as FieldNo1
  from Население n
 LEFT JOIN БазаДомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id 
  where n.Date_Fiks='1899-12-30'
  group by n.FAMILIA,n.NAME
  order by Field_0
