select '1' tt , name, kolvo, kod from
( 
select kod, count(*) kolvo
   from НаселениеЛьготы
   where date_fiks='1899-12-30'
   group by 1
) aaa
left join СпрЛьготников s on aaa.kod=s.id
  union all
select '2' tt, name, kolvo, kod from
( 
select kod, count(*) kolvo
   from НаселениеПризнаки
   where date_fiks='1899-12-30'
   group by 1
) aaa
left join СпрПрНаселения s on aaa.kod=s.id

order by tt, kod
   