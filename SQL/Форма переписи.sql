select *
into #form2st 
from
(
select b.id adres_id,   
       h.punkt, h.ul, h.dom, h.one_kv, h.otdelno, h.kol_kv
from базаДомов b
left join BigHouse h on b.date_fiks=h.date_fiks and b.punkt=h.punkt and
            ifnull(b.ul,0)=h.ul	and
			iif(b.dom is null or b.dom='',2,1)=h.type_dom and 
			iif(b.dom is null or b.dom='',b.korp,b.dom)=h.dom
where b.date_fiks='1899-12-30'
) aaa
left join
(
select adres_id adres_id_men, 
       sum(iif(propis=false and present=true,1,0)) fact_progiv, 
       sum(iif(propis=true and present=true,1,0)) zareg,
       sum(iif(propis=true and present=true and h.one_kv=true,1,0)) zareg_one_kv
  from Население n
  left join БазаДомов b on n.date_fiks=b.date_fiks and n.adres_id=b.id 
  left join BigHouse h on b.date_fiks=h.date_fiks and b.punkt=h.punkt and
            ifnull(b.ul,0)=h.ul	and
			iif(b.dom is null or b.dom='',2,1)=h.type_dom and 
			iif(b.dom is null or b.dom='',b.korp,b.dom)=h.dom
  where n.date_fiks='1899-12-30'
  group by 1
) bbb on bbb.adres_id_men=aaa.adres_id 

			
