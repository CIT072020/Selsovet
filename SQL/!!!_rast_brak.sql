
select count(*) from declaretermmarriage where datez>='1900-01-01' and datez<='2100-12-31' // всего
  union all
select count(*) from declaretermmarriage where type_rast=1 and otkaz=1 and datez>='1900-01-01' and datez<='2100-12-31' // отказ от регистрации
  union all
select count(*) from declaretermmarriage where type_rast=1 and otkaz=2 and datez>='1900-01-01' and datez<='2100-12-31' // неявка на регистрацию
  union all
select count(*) from declaretermmarriage where type_rast=0 and datez>='1900-01-01' and datez<='2100-12-31' // по решению суда 


select top 1 nomer, datez-brak_date, datez, brak_date from akttermmarriage a where brak_date is not null order by datez-brak_date       // min браке

select top 1 nomer, datez-brak_date, datez, brak_date from akttermmarriage a where brak_date is not null order by datez-brak_date desc  // max в браке


// по гражданству
 select s.id, s.gname, kolvom, kolvog from SysSpr.СпрСтран s
	left join
    (  SELECT IsNull(ON_GRAG,998) GRAG, Count(*) KOLVOM
       FROM aktTermMarriage WHERE datez>='1900-01-01' and datez<='2100-12-31' and true=true
       GROUP BY 1
    ) gm on s.id=gm.grag
	left join
    (  SELECT IsNull(ONA_GRAG,998) GRAG, Count(*) KOLVOG
       FROM aktTermMarriage WHERE datez>='1900-01-01' and datez<='2100-12-31' and true=true
       GROUP BY 1
    ) gg on s.id=gg.grag
  where kolvom is not null or kolvog is not null	
  order by kolvom+kolvog desc


//---- в каком по счету браке ---------------------------------------
 select sem, sum(iif(pol=1,kolvo,0)) kolvom, sum(iif(pol=2,kolvo,0)) kolvog 
 from (
   select pol,sem, count(*) kolvo from (
      SELECT 1 as pol, IsNull(ON_SEM,1) SEM FROM aktTermMarriage  where datez>='1900-01-01' and datez<='2100-12-31' 
          union all
      SELECT 2 as pol, IsNull(ONA_SEM,1) SEM FROM aktTermMarriage where datez>='1900-01-01' and datez<='2100-12-31' ) a
   group by 1,2
 ) aa
group by 1
------или -------------
   select sem, sum(iif(pol=1,1,0)) as kolvom, sum(iif(pol=2,1,0)) as kolvog from (
      SELECT 1 as pol, IsNull(ON_SEM,1) SEM FROM aktTermMarriage  where datez>='1900-01-01' and datez<='2100-12-31' 
          union all
      SELECT 2 as pol, IsNull(ONA_SEM,1) SEM FROM aktTermMarriage where datez>='1900-01-01' and datez<='2100-12-31' ) a
   group by 1
-----------------------------

// количество лет в браке
select TIMESTAMPDIFF(SQL_TSI_YEAR,brak_date,datez) brak_time, count(*) kolvo from akttermmarriage a 
  where true=true
  group by 1 