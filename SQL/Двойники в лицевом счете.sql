select l.nomer,s.familia,s.name, s.kolvo
from 
 ( select lic_id,familia,name,count(*) kolvo from население 
   where date_fiks='1899-12-30'
   group by lic_id,familia,name
   having count(*)>1 ) s
left join лицевыесчета l on l.id=s.lic_id   
