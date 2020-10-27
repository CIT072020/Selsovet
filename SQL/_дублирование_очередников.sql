try
  drop table #tmp;
catch all
end;
//------
select id into #tmp from население where 
 ifnull(trim(familia),'*')+ifnull(trim(name),'*')+ifnull(trim(otch),'*')+cast( ifnull(dater,curdate()) as SQL_CHAR) in
   (select name from ( 
   select ifnull(trim(familia),'*')+ifnull(trim(name),'*')+ifnull(trim(otch),'*')+cast( ifnull(dater,curdate()) as SQL_CHAR) name,count(*)
    from население
	group by 1
	having count(*)>1
  )aaa );
//------
select * from (
select n.familia,n.name,n.otch,n.dater,o.* from ochered o
  left join население n on o.id=n.id  
  where ochered_id=0 and o.id in (select id from #tmp)
 union all
select n.familia,n.name,n.otch,n.dater,o.* from ochered o
  left join население n on o.id=n.id  
  left join sostavsem s on o.id=s.member_id  
  where s.member_id in (select id from #tmp) 
) aaa 
order by familia,name,otch,dater  