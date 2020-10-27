select soato, trim(tt.name)+' '+trim(s.name) name_punkt, punkt, kolvo_child , kolvo_lic, kolvo_adres 
from (
select punkt, sum(iif(t=1,kolvo,0)) kolvo_child , sum(iif(t=2,kolvo,0)) kolvo_lic, sum(iif(t=3,kolvo,0)) kolvo_adres
from (
select 1 t, punkt, kolvo from (
select a.punkt, sum( iif(dater>='2013-12-01',1,0) ) kolvo
  from население n
  left join БазаДомов a on a.date_fiks=n.date_fiks and n.adres_id=a.id
  where n.date_fiks='1899-12-30' and a.punkt in (&punkt&) and n.propis=true and n.candelete=false and n.dates is null        
group by 1 ) a1
  union all
select 2 t, punkt, kolvo from (
  select punkt, sum(yes_lic) kolvo from (
  select a.punkt, lic_id, count(*) kolvo, 1 yes_lic
    from население n
    left join БазаДомов a on a.date_fiks=n.date_fiks and n.adres_id=a.id
    where n.date_fiks='1899-12-30' and a.punkt in (&punkt&) and n.propis=true and n.candelete=false and n.dates is null
  group by 1,2 ) b1
  group by 1) b2         
  union all
select 3 t, punkt, kolvo from (
  select punkt, sum(yes_adres) kolvo from (
  select a.punkt, adres_id, count(*) kolvo, 1 yes_adres
    from население n
    left join БазаДомов a on a.date_fiks=n.date_fiks and n.adres_id=a.id
    where n.date_fiks='1899-12-30' and a.punkt in (&punkt&) and n.propis=true and n.candelete=false and n.dates is null
  group by 1,2 ) c1
  group by 1) c2         
) d1
group by 1 ) dd1
left join СпрНасПунктов s on s.id=dd1.punkt
left join SysSpr.TypePunkt tt on tt.id=s.typepunkt
