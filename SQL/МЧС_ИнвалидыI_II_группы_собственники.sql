select n.id, n.adres_id, n.lic_id, a.punkt 
  from население n 
  left join базаƒомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id
  where n.date_fiks='1899-12-30' and n.candelete=false and n.propis=true and n.present=true and n.lic_id>0  &punkt& and
       (iswork is null or iswork<>1) and 
       exists (select kod from ЌаселениеЋьготы nl where nl.date_fiks=n.date_fiks and nl.id=n.id and (&kod&) ) and 		  
       n.first=true and (n.otnosh is null or n.otnosh=0)
   --in (select kod from HouseOwners ho where ho.date_fiks=n.date_fiks and ho.id=n.adres_id)  		  

