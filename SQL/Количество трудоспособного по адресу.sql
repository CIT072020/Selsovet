select count(*) 
  from население n
  where date_fiks='1899-12-30' and candelete=false and propis=true and present=true and lic_id>0 and
        adres_id=:par and Trud(curdate(),dater,pol)=1 and 
        not exists (select kod from ЌаселениеЋьготы nl where nl.date_fiks=n.date_fiks and nl.id=n.id and (kod=2) )  		  
