select distinct name from
(
select ONA_NAME as name from ЗаключениеБраков
  union all
select ONA_NAME as name from АктыРождений
  union all
select NAME from АктыРождений where pol='Ж'
) aaa