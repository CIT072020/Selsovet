select id, fio, getvozrast(curdate(),dater), iif(pol1='М', id1, id2) as id_papa, iif(pol1='Ж', id1, id2) as id_mama,
        iif(pol1='М', glava, two) as fio_papa, iif(pol1='Ж', glava, two) as fio_mama
into #papa_mama		
from (
select ddd.nameo,GetFIO(ddd.familia,ddd.name,ddd.otch) two ,ddd.id as id2, ddd.pol as pol2,
       GetFIO(f.familia,f.name,f.otch) as glava ,f.id as id1,f.pol as pol1,
	   n.dater,n.id,substring(s.name,1,5),GetFIO(n.familia,n.name,n.otch) as fio,n.lic_id 
from население n 
left join спротношений s on s.id=n.otnosh
left join население f on n.date_fiks=f.date_fiks and f.first=true and n.lic_id=f.lic_id
left join 
  (
  select nn.familia,nn.name,nn.otch,nn.pol,nn.id,substring(ss.name,1,5),nn.lic_id,ss.name as nameo 
  from население nn 
  left join спротношений ss on ss.id=nn.otnosh
  left join население ff on nn.date_fiks=ff.date_fiks and ff.first=true and nn.lic_id=ff.lic_id
  where ( (ss.name='жена'and ff.pol='М') or (ss.name='муж' and ff.pol='Ж') ) and nn.first=false and nn.date_fiks='1899-12-30'
  ) ddd on n.lic_id=ddd.lic_id
where (s.name='дочь' or s.name='сын') and n.first=false and f.id is not null and n.date_fiks='1899-12-30'
) zzz;

update n set n.pa_id=p.id_papa, n.ma_id=p.id_mama 
  from население n inner join #papa_mama p on p.id=n.id and n.date_fiks='1899-12-30'
  where date_fiks='1899-12-30';

   