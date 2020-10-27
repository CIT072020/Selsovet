select month, sum(iif(pol='Ж',sr_vozr,0)) sr_vozr_g, sum(iif(pol='М',sr_vozr,0)) sr_vozr_m
 from (
   select 'Ж' pol, month(datez) month, avg(getvozrast(dates,dater)) sr_vozr  from актысмертей 
      where pol='Ж' and dates is not null and dater is not null  and Year(datez)=2011 group by 2
    union all
   select 'Ж' pol, 20 month , avg(getvozrast(dates,dater)) sr_vozr from актысмертей 
      where pol='Ж' and dates is not null and dater is not null and Year(datez)=2011 
    union all
   select 'М' pol, month(datez) month , avg(getvozrast(dates,dater)) sr_vozr from актысмертей 
      where pol='М' and dates is not null and dater is not null and Year(datez)=2011 group by 2
    union all
   select 'М' pol, 20 month , avg(getvozrast(dates,dater)) sr_vozr from актысмертей 
     where pol='М' and dates is not null and dater is not null and Year(datez)=2011 ) a
group by 1   