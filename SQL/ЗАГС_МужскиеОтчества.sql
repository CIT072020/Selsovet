select distinct name from
(
select ON_OTCH as name from ЗаключениеБраков
  union all
select ON_OTCH as name from АктыРождений
  union all
select OTCH from АктыРождений where pol='М'
) aaa