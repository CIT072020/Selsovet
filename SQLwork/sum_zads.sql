select 'усыновлени€', count(*) from aktadopt
  union all
select 'изм. имени', count(*) from aktchangename
  union all
select 'разводы', count(*) from akttermmarriage
  union all
select 'рождени€', count(*) from јкты–ождений
  union all
select 'смертей', count(*) from јкты—мертей
  union all
select 'браки', count(*) from «аключениеЅраков 
  union all
select 'уст. отцовства', count(*) from јкты”стќтцовства 