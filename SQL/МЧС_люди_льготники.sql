select n.id, n.adres_id, n.lic_id, a.punkt 
  from население n 
  left join базаƒомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id
  where n.date_fiks='1899-12-30' and n.candelete=false and n.propis=true and n.present=true and n.lic_id>0 &punkt& and
    exists (select kod from ЌаселениеЋьготы nl where nl.date_fiks=n.date_fiks and nl.id=n.id and (&kod&) )  		  

