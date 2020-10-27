select name,punkt,count(*) kolvo_l, sum(kolvo_m)
from
(
select name,punkt,lic_id,count(*) kolvo_m
from (
select s.name, a.punkt, n.lic_id, l.nomer, n.id from население n
  left join Ѕазаƒомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id 
  LEFT JOIN —прЌасѕунктов s ON s.id=a.punkt
  left join лицевые—чета l on n.date_fiks=l.date_fiks and n.lic_id=l.id 
  where n.date_fiks='1899-12-30' and n.propis=true and n.candelete=false and n.lic_id>0 and n.adres_id>0 and  
        exists (select kod from лицевые—четаѕризнаки nl where nl.date_fiks=n.date_fiks and l.id=nl.id and (kod=1 or kod=2)) 
	   ) aaa
group by 1,2,3
) bbb
group by 1,2
	    
	   

