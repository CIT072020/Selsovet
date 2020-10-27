select name, sum(kolvo) count_men, count(*) count_lic,
      sum( iif(deti>0,1,0) ) count_lic_deti, 
      sum( deti )  count_deti, 
      sum( v0006 ) count_0006, 
      sum( v0714 ) count_0714, 
      sum( v1517 ) count_1517 
	  from
(SELECT s.name NAME , n.lic_id LIC_ID ,
    Count(*) kolvo,
--    Sum( year(dater)) ddd    åñëè ïîëó÷àåò íà 01.01.2007
    Sum( iif( dater>='1989-01-01' and dater<'2007-01-01',1,0)  ) deti,
    Sum( iif( dater>='2001-01-01' and dater<'2007-01-01' ,1,0) ) v0006,
    Sum( iif( dater>='1991-01-01' and dater<'2001-01-01' ,1,0) ) v0714,
    Sum( iif( dater>='1989-01-01' and dater<'1991-01-01' ,1,0) ) v1517
  FROM Íàñåëåíèå n
    LEFT OUTER JOIN ËèöåâûåÑ÷åòà l ON n.date_fiks=l.date_fiks and n.lic_id=l.id
    LEFT OUTER JOIN ÁàçàÄîìîâ d ON n.date_fiks=d.date_fiks and l.adres_id=d.id
    LEFT OUTER JOIN ÑïğÍàñÏóíêòîâ s ON s.id=d.punkt
  WHERE n.date_fiks='1899-12-30' and n.present=true and lic_id is not null
  GROUP BY 1,2 ) aaa
 group by 1


