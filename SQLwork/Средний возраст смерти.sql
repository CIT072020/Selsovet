select month, sum(iif(pol='�',sr_vozr,0)) sr_vozr_g, sum(iif(pol='�',sr_vozr,0)) sr_vozr_m
 from (
   select '�' pol, month(datez) month, avg(getvozrast(dates,dater)) sr_vozr  from ����������� 
      where pol='�' and dates is not null and dater is not null  and Year(datez)=2011 group by 2
    union all
   select '�' pol, 20 month , avg(getvozrast(dates,dater)) sr_vozr from ����������� 
      where pol='�' and dates is not null and dater is not null and Year(datez)=2011 
    union all
   select '�' pol, month(datez) month , avg(getvozrast(dates,dater)) sr_vozr from ����������� 
      where pol='�' and dates is not null and dater is not null and Year(datez)=2011 group by 2
    union all
   select '�' pol, 20 month , avg(getvozrast(dates,dater)) sr_vozr from ����������� 
     where pol='�' and dates is not null and dater is not null and Year(datez)=2011 ) a
group by 1   