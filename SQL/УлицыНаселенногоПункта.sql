select s.id, trim(t.name)+' '+s.name name from
(select distinct ul from базадомов
  where date_fiks=&DATEFIKS& and punkt=? and ul is not null ) b
left join —пр”лиц s on b.ul=s.id
left join —пр“ип”лиц t on s.tip=t.id
order by s.name