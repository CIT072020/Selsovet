select s.name, a.punkt, n.id from население n
  left join Ѕазаƒомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id 
  LEFT JOIN —прЌасѕунктов s ON s.id=a.punkt
  where n.date_fiks='1899-12-30' and n.propis=true and n.candelete=false and n.lic_id>0 and n.adres_id>0 and
       exists (select id from ЌаселениеЋьготы nl where nl.date_fiks=n.date_fiks and n.id=nl.id and (kod=1 or kod=2)) 
  
  /*  
      (  1 in (select kod from ЌаселениеЋьготы nl where nl.date_fiks=n.date_fiks and n.id=nl.id) 
	       or
         2 in (select kod from ЌаселениеЋьготы nl where nl.date_fiks=n.date_fiks and n.id=nl.id)
       )
  */	    
order by 1	   
		    
