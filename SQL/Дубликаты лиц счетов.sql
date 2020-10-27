--select count(*) from (
try
  drop table #lic_del;
catch all
end try;

select punkt,ul,dom,korp,kv,n.familia,n.name,n.otch,n.dater,count(*)
into #lic_del 
from лицевыесчета l
left join базадомов a on l.adres_id=a.id and l.date_fiks=a.date_fiks
left join население n on l.first=n.id and l.date_fiks=n.date_fiks
where l.date_fiks='1899-12-30' and (a.punkt>0 and a.punkt<7)
group by 1,2,3,4,5,6,7,8,9
having count(*)>1;
--) aaa
delete from временная;
--select l.id, l.adres_id, a.punkt,a.ul, a.dom, a.korp, a.kv, n.familia, n.name, n.otch from лицевыесчета l
insert into временная (id)  
select l.id from лицевыесчета l 
left join базадомов a on l.adres_id=a.id and l.date_fiks=a.date_fiks
left join население n on l.first=n.id and l.date_fiks=n.date_fiks
where l.date_fiks='1899-12-30' and (a.punkt>0 and a.punkt<7) and
 l.id>10000 and 
 cast(a.punkt as SQL_CHAR)+cast(ifnull(a.ul,0) as SQL_CHAR)+cast(ifnull(a.dom,'1') as SQL_CHAR)+cast(ifnull(a.kv,'1') as SQL_CHAR)+GetFIO(n.familia,n.name,n.otch)+cast(n.dater as SQL_CHAR) 
 in (select cast(punkt as SQL_CHAR)+cast(ifnull(ul,0) as SQL_CHAR)+cast(ifnull(dom,'1') as SQL_CHAR)+cast(ifnull(kv,'1') as SQL_CHAR)+GetFIO(familia,name,otch)+cast(dater as SQL_CHAR) from #lic_del)
--order by a.punkt,a.ul, a.dom, a.korp, a.kv, n.familia, n.name, n.otch 
/* 
left join #lic_del ld on  
 ifnull(a.punkt,0)=ifnull(ld.punkt,0) and ifnull(a.ul,0)=ifnull(ld.ul,0)
 and ifnull(a.dom,'1')=ifnull(ld.dom,'1') and ifnull(a.korp,'1')=ifnull(ld.korp,'1') 
 and ifnull(a.kv,'1')=ifnull(ld.kv,'1') 
 and ifnull(n.familia,'1')=ifnull(ld.familia,'1')
 and ifnull(n.name,'1')=ifnull(ld.name,'1') and ifnull(n.otch,'1')=ifnull(ld.otch,'1')
 and ifnull(n.dater,curdate())=ifnull(ld.dater,curdate())
*/ 
--where ld.name<>''
--select * from #lic_del 
  

