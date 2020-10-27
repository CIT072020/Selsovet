select * from (
select '√»— –Õ (‰Ó 40000)',max(convert(extcode,sql_integer)) max_id from gisun_class where typespr=80 and length(extcode)<6 and convert(extcode,sql_integer)<40000
  union all
select '—Œ¿“Œ',max(id) max_id from —Ô—Œ¿“Œ where id<100000
  union all
select '«¿√— (‰Ó 40000)',max(id) from sprZAGS where  id<40000
  union all
select '«¿√— (√»— –Õ)',max(cast(extcode as SQL_INTEGER)) from gisun_class where length(extcode)<8 and typespr=80 and cast(extcode as SQL_INTEGER)<40000
  union all
select 'MAX ‚ËÚÛ‡Î¸Ì˚È',26910 from system.iota
  union all
select '«¿√— (‰Ó 50000)',max(id) from sprZAGS where  id<50000
  union all
select '«¿√—',max(id) from sprZAGS
  union all
select '∆›— (‰Ó 30000)',max(id) from sprGES where  id<30000
  union all
select '∆›—',max(id) from sprGES
  union all
select '-----------',39999 from system.iota
) aaa 
--order by max_id 