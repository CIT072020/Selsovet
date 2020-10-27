select distinct name from
(
select ON_NAME as name from ЗаключениеБраков
  union all
select ON_NAME as name from АктыРождений
  union all
select NAME from АктыРождений where pol='М'
) aaa