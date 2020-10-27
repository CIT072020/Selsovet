select s.name, a.punkt, count(*) kolvo from население n
  left join БазаДомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id 
  LEFT JOIN СпрНасПунктов s ON s.id=a.punkt
  where n.date_fiks='1899-12-30' and n.present=true and n.propis=true and n.candelete=false and n.lic_id>0 and n.adres_id>0 &punkt&
group by 1,2 
	    
	   

