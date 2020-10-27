select a.punkt, n.lic_id, count(*) kolvo
  from население n 
  left join базаДомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id
  where n.date_fiks='1899-12-30' and n.candelete=false and n.propis=true and n.present=true and n.lic_id>0  &punkt& and
    exists (select kod from НаселениеПризнаки nl where nl.date_fiks=n.date_fiks and nl.id=n.id and &gggg& )
group by 1,2

