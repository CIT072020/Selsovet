--- последнее движение в населении ------------------------------------------------------
select max_date, contant, n.* 
from Ќаселение n 
left join Ќаселениеƒоп nd on n.id=nd.id  
left join (
  select max_date, d.* from населениеƒвижение d 
    left join (select date_fiks,id,max(date) max_date from населениеƒвижение group by 1,2) aaa on d.date_fiks=aaa.date_fiks and d.id=aaa.id and d.date=aaa.max_date
    where max_date is not null and d.date_fiks='1899-12-30'
    ) dd on n.date_fiks=dd.date_fiks and n.id=dd.id
where n.date_fiks='1899-12-30' and max_date is not null


-------------------------------------------------------
select sp.name name_punkt, st.name tip_ul, su.name name_ul, dom, dom1, dom2, korp, kv, a.id adres, 0 COUNT_ALL, 0 COUNT_INV1, 0 COUNT_INV2 
from Ѕазаƒомов a
left join —прЌасѕунктов sp on sp.id=a.punkt 
left join SysSpr.TypePunkt pt on pt.id=sp.typepunkt 
left join —пр”лиц su on su.id=a.ul 
left join —пр“ип”лиц st on st.id=su.tip 
where date_fiks='1899-12-30' and punkt in (1,2,3) 
order by sp.name, su.name, dom1, dom2, korp, kv
-------------------------------------------------------
