select n.adres_id, 
  count(*) count_all,
  sum( iif(getVozrast(curdate(),n.dater)<18, 1, 0) ) count_deti
  from население n
  left join БазаДомов a on a.date_fiks=n.date_fiks and n.adres_id=a.id
  where n.date_fiks='1899-12-30' and a.tip=1 and a.punkt in (&punkt&) and n.propis=true and n.dates is null
group by 1