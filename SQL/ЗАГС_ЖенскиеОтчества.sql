select distinct name from
(
select ONA_OTCH as name from ЗаключениеБраков
  union all
select ONA_OTCH as name from АктыРождений
  union all
select OTCH from АктыРождений where pol='Ж'
) aaa