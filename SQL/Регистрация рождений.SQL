select 'Количество регистраций' as name,  count(*) kolvo
FROM АктыРождений
WHERE datez>='1900-01-01' and datez<='2100-01-01' and true=true
    union all
select 'В торжественной обстановке' as name,  count(*) kolvo
FROM АктыРождений
WHERE vosstan=false and sud_date='1900-01-01' and datez>='1900-01-01' and datez<='2100-01-01' and true=true
    union all
select 'Мальчики' as name,  count(*) kolvo
FROM АктыРождений
WHERE pol='М' and datez>='1900-01-01' and datez<='2100-01-01' and true=true
    union all
select 'Девочеки' as name,  count(*) kolvo
FROM АктыРождений
WHERE pol='Ж' and datez>='1900-01-01' and datez<='2100-01-01' and true=true
    union all
select 'По заявлению матери (ст.55) ' as name,  count(*) kolvo
FROM АктыРождений
WHERE sved=3 and datez>='1900-01-01' and datez<='2100-01-01' and true=true
    union all
select 'Двойня' as name,  count(*) kolvo
from 
(
select count(*)
FROM АктыРождений
WHERE datez>='1900-01-01' and datez<='2100-01-01' and true=true
group by DATEZ,ONA_FAMILIA,ONA_NAME --,ONA_DATER --,dater
having count(*)=2
) aaa
    union all
select 'Тройня' as name,  count(*) kolvo
from 
(
select count(*)
FROM АктыРождений
WHERE datez>='1900-01-01' and datez<='2100-01-01' and true=true
group by DATEZ,ONA_FAMILIA,ONA_NAME --,ONA_DATER  --,dater
having count(*)=3
) aaa
    union all
select 'С нарушением срока регистрации' as name , count(*) kolvo 
  from АктыРождений
  where datez>cast(TIMESTAMPADD(SQL_TSI_MONTH,3,dater) as SQL_DATE) and datez>='1900-01-01' and datez<='2100-01-01' and true=true
    union all
select 'Иностранные граждане всего ' , sum(kolvo) as kolvo from
 (
    select count(*) kolvo
      from АктыРождений left join SysSpr.СпрСтран s on on_grag=s.id 
      where on_grag is not null and on_grag<>112  and on_grag<>999 and datez>='1900-01-01' and datez<='2100-01-01' and true=true
      union all
    select count(*) kolvo
      from АктыРождений left join SysSpr.СпрСтран s on ona_grag=s.id 
      where ona_grag is not null and ona_grag<>112  and ona_grag<>999 and datez>='1900-01-01' and datez<='2100-01-01' and true=true
  ) aaa	  
    union all
select 'Мужчины' , -1 as kolvo from system.iota
    union all
select '    '+s.gname as name, count(*) kolvo
  from АктыРождений left join SysSpr.СпрСтран s on on_grag=s.id 
  where on_grag is not null and on_grag<>112  and on_grag<>999 and datez>='1900-01-01' and datez<='2100-01-01' and true=true
  group by s.gname 
    union all
select 'Женщины' , -1 as kolvo from system.iota
    union all
select '    '+s.gname as name, count(*) kolvo
  from АктыРождений left join SysSpr.СпрСтран s on ona_grag=s.id 
  where ona_grag is not null and ona_grag<>112  and ona_grag<>999 and datez>='1900-01-01' and datez<='2100-01-01' and true=true
  group by s.gname
    union all
select 'Количество детей (осталось в живых)' , -1 as kolvo from system.iota
    union all
select '  '+cast(ostat as SQL_CHAR) as name , count(*) kolvo 
  from АктыРождений
  where givorogd=true and firstweek=false and datez>='1900-01-01' and datez<='2100-01-01' and true=true
  group by ostat

