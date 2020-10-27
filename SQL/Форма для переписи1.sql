select a.punkt,h.ul,h.dom,h.korp,h.chet,h.otdelno,iif(isnull(h.kol_kv,0)<2,true,false) one_kv,h.kol_kv,
       h.giloe, zareg, fact_progiv, h.name, a.dom1, a.dom2 
into #forma2
from

(
select n.date_fiks, b.punkt, b.ul, b.dom1, b.dom2, b.dom, b.korp,
       sum(iif(propis=false and (present=true or present is null),1,0)) fact_progiv, 
       sum(iif((propis=true or propis is null) and (present=true or present is null),1,0)) zareg
  from Население n
  left join БазаДомов b on n.date_fiks=b.date_fiks and n.adres_id=b.id 
  where n.date_fiks='1899-12-30' and n.adres_id>0
  group by 1,2,3,4,5,6,7
 union all
select b.date_fiks, b.punkt, b.ul, b.dom1, b.dom2, b.dom, b.korp, 
       0 fact_progiv, 
       0 zareg
  from БазаДомов b
-- исключаем участки и строящиеся дома и административные здания
  where b.date_fiks='1899-12-30' and b.tip<>6 and b.tip<>7 and b.tip<>8 and b.id not in (select adres_id id from Население where date_fiks='1899-12-30' and adres_id is not null) 
  group by 1,2,3,4,5,6,7
) a
 
  left join BigHouse h on a.date_fiks=h.date_fiks and a.punkt=h.punkt and
            ifnull(a.ul,0)=h.ul	and ifnull(a.dom,'#')=h.dom and ifnull(a.korp,'#')=h.korp
  where a.date_fiks='1899-12-30'
order by h.punkt,h.ul,a.dom1,a.dom2,h.korp
			
			  