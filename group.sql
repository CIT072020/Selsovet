select a.PUNKT as Field_4,count(*) as FieldNo17,sum(case when TRUNCATE(TIMESTAMPDIFF(SQL_TSI_MONTH, n.DATER, CURDATE())/12,0)-IIF(MONTH(n.DATER)=MONTH(CURDATE()), IIF(DAYOFMONTH(n.DATER)-DAYOFMONTH(CURDATE())>0, 1, 0), 0)<=14
 then 1 end) as FieldNo18,sum(case when TRUNCATE(TIMESTAMPDIFF(SQL_TSI_MONTH, n.DATER, CURDATE())/12,0)-IIF(MONTH(n.DATER)=MONTH(CURDATE()), IIF(DAYOFMONTH(n.DATER)-DAYOFMONTH(CURDATE())>0, 1, 0), 0)<18
 then 1 end) as FieldNo19,sum(case when (
Trud(curDate(), n.dater, n.pol)=0
)
 then 1 end) as FieldNo20,sum(case when (
Trud(curDate(), n.dater, n.pol)=1
)
 then 1 end) as FieldNo21,sum(case when (
Trud(curDate(), n.dater, n.pol)<>2
)
 then 1 end) as FieldNo22
  from Население n
 LEFT JOIN БазаДомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id 
  where n.Date_Fiks='1899-12-30'
  group by a.PUNKT

