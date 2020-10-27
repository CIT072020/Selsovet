try
  drop table #tmp;
  drop table #tmp2;
catch all
end;
//------
select id,familia,name,otch,dater,lich_nomer, 'mmm' into #tmp from население where 
 ifnull(trim(familia),'*')+ifnull(trim(name),'*')+ifnull(trim(otch),'*')+cast( ifnull(dater,curdate()) as SQL_CHAR) in
   (select name from ( 
   select ifnull(trim(familia),'*')+ifnull(trim(name),'*')+ifnull(trim(otch),'*')+cast( ifnull(dater,curdate()) as SQL_CHAR) name,count(*)
    from население
	group by 1
	having count(*)>1
  )aaa );

select s.id, s.familia,s.name,s.otch,s.dater,s.lich_nomer,'sss' into #tmp2 
  from sostavsem s 
--  left join #tmp t on t.id=s.member_id
  where  member_id in (select id from #tmp);

--select * from #tmp
--  union all
--select * from #tmp2
--order by familia,name,otch   
//------

select * from (
select t.familia fa,t.name na,t.otch oc, n.familia,n.name,n.otch,n.dater,o.* from ochered o
  left join население n on o.id=n.id  
  left join #tmp t on o.id=t.id  
  where ochered_id=0 and t.id is not null

 union all

select t2.familia fa,t2.name na,t2.otch oc, n.familia,n.name,n.otch,n.dater,o.* from ochered o
  left join население n on o.id=n.id  
  left join #tmp2 t2 on o.id=t2.id  
  where ochered_id=0 and t2.id is not null
) aaa 
order by fa,na,oc  