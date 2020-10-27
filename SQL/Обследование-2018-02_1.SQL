select n.adres_id, count(*) kolvo,
       sum( iif(getVozrast(curdate(),dater)<18,1,0) ) inv1,
       sum( iif(getVozrast(curdate(),dater)>=18,1,0) ) inv2
  from население n
  left join Ѕазаƒомов a on a.date_fiks=n.date_fiks and n.adres_id=a.id
  where n.date_fiks='1899-12-30' and a.tip=1 and a.punkt in (&punkt&) and n.propis=true and n.dates is null and
        n.id in (select id from ЌаселениеЋьготы where date_fiks='1899-12-30' and kod in (&lgot&))
group by 1	