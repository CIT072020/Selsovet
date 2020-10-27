select pt.name tip_punkt, sp.name name_punkt, sp.soato, a.punkt, st.name tip_ul, su.name name_ul, dom, dom1, dom2, korp, kv, 
       a.id ADRES, 0 COUNT_ALL, 0 COUNT_INV1, 0 COUNT_INV2, 0 COUNT_NASEL
from Ѕазаƒомов a
left join —прЌасѕунктов sp on sp.id=a.punkt 
left join SysSpr.TypePunkt pt on pt.id=sp.typepunkt 
left join —пр”лиц su on su.id=a.ul 
left join —пр“ип”лиц st on st.id=su.tip 
where date_fiks='1899-12-30' and punkt in (&punkt&) 
order by sp.name, su.name, dom1, dom2, korp, kv