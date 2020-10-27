select distinct date_fiks, id
from
( 
select b.date_fiks, b.id 
  from Ѕазаƒомов b
  full join Ћицевые—чета l on l.date_fiks=b.date_fiks and l.adres_id=b.id
where adres_id is null    
  union all
select b.date_fiks, b.id 
  from Ѕазаƒомов b
  full join Ќаселение l on l.date_fiks=b.date_fiks and l.adres_id=b.id
where adres_id is null    
) aaa
/*
select o.id adres_id, b.punkt, ifnull(b.ul,0) ul,b.dom, b.korp,
 from houseOwners o
 left join базаƒомов b on o.id=b.id
 left join BigHouse h on b.date_fiks=h.date_fiks and b.punkt=h.punkt and
            ifnull(b.ul,0)=h.ul	and
			iif(b.dom is null or b.dom='',2,1)=h.type_dom and 
			iif(b.dom is null or b.dom='',b.korp,b.dom)=h.dom

 where b.punkt=1   -- условие дополнительного отбора   ( h.otdelno, h.chet ) 
       and o.date_fiks='1899-12-30' and typekod=2
*/
	   