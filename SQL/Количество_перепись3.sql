select s.soato, tp.name tip_punkt, s.name punkt, Trim(stu.name) tip_ul, su.name ul, a.dom1, a.dom2, a.korp, a.kv, 
      sum(iif(n.propis=true and present=true ,1,0)) kolvo, 
      sum(iif(n.propis=true and present=false ,1,0)) otsut, 
      sum(iif(n.propis=false and present=true and n.date_srok is not null,1,0)) vrem 
  from население n
  left join Ѕазаƒомов a on n.adres_id=a.id and n.date_fiks=a.date_fiks 
  left join —прЌасѕунктов s on a.punkt=s.id 
  left join —пр”лиц su on a.ul=su.id 
  left join —пр“ип”лиц stu on stu.id=su.tip 
  left join SysSpr.TypePunkt tp on tp.id=s.typepunkt 
  where n.date_fiks='1899-12-30' and n.lic_id>0 and n.candelete=false and 1=1 
  group by 1,2,3,4,5,6,7,8,9
