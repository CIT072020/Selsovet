insert into јкты”стќтцовства 
select * from ZZZ.јкты”стќтцовства
where id in (  
select n.id from ZZZ.јкты”стќтцовства n
left join јкты”стќтцовства o on n.nomer=o.nomer and n.datez=o.datez
where o.nomer is null)
