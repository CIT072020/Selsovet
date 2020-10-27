
update население set adres_id = 
  ( select l.adres_id 
    from лицевыесчета l 
    where l.date_fiks=население.date_fiks and население.lic_id=l.id )

update население set adres_id=l.adres_id
  from население inner join лицевыесчета l 
    on l.date_fiks=население.date_fiks and население.lic_id=l.id

update население set adres_id=l.adres_id
  from лицевыесчета l  
  where l.date_fiks=население.date_fiks and население.lic_id=l.id
