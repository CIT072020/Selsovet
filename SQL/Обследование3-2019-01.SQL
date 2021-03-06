select sp.name name_punkt, pt.name tip_punkt, st.name tip_ul, su.name name_ul, dom1, dom2, dom, korp, kv, n.lic_id, 
       sum( iif(getVozrast(curdate(),n.dater)<18,1,0) ) count_deti
from ��������� n
left join ������������ l on n.lic_id=l.id and n.date_fiks=l.date_fiks 
left join ��������� a on a.id=l.adres_id and l.date_fiks=a.date_fiks 
left join ������������� sp on sp.id=a.punkt 
left join SysSpr.TypePunkt pt on pt.id=sp.typepunkt 
left join ������� su on su.id=a.ul 
left join ���������� st on st.id=su.tip 
where n.date_fiks='1899-12-30' and lic_id>0 and n.propis=true and dates is null and punkt in (&punkt&) 
group by sp.name, pt.name, st.name, su.name, dom1, dom2, dom, korp, kv, n.lic_id