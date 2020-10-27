--  параметрезировать d.punkt + n.date_fiks  + на какую дату
SELECT familia, name, otch, dater, lic_id, d.punkt,
 TIMESTAMPDIFF(SQL_TSI_YEAR,DATER,'2006-03-19')-
  case when dayofyear('2006-03-19')-dayofyear(dater)>0 then 0 else 1 end COUNT_YEAR
 FROM Ќаселение n
 LEFT JOIN Ћицевые—чета l ON l.date_fiks=n.date_fiks and l.id=n.lic_id 
 LEFT JOIN Ѕазаƒомов d ON d.date_fiks=d.date_fiks and d.id=l.adres_id 
 WHERE n.date_fiks='1899-12-30' and (n.citizen=112 or n.citizen is null ) and
   (n.present=true or n.present is null) and
   (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'2006-03-19')>18
   or (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'2006-03-19'))=18 and
     dater<='1988-03-19' )
   and d.punkt=11
 ORDER BY familia