select a.punkt PUNKT, count(*) KOLVO from население n
  left join БазаДомов a on n.adres_id=a.id and n.date_fiks=a.date_fiks 
  where n.date_fiks='1899-12-30' and n.propis=true and present=true and n.candelete=false
  group by 1
