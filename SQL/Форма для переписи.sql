select b.id adres_id,   
       h.punkt, h.ul, h.dom, h.one_kv, h.otdelno
from базаƒомов b
left join BigHouse h on b.date_fiks=h.date_fiks and b.punkt=h.punkt and
            ifnull(b.ul,0)=h.ul	and
			iif(b.dom is null or b.dom='',2,1)=h.type_dom and 
			iif(b.dom is null or b.dom='',b.korp,b.dom)=h.dom
where b.date_fiks='1899-12-30'			
			  