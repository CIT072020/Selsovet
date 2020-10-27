 select d.id dddd, l.* 
  from Ћицевые—чета l
  left join Ѕазаƒомов d on l.adres_id=d.id  
  where d.id is null 

