update ������������ set present=true 
  where date_fiks='1899-12-30'
;
update ������������ set present=false 
where date_fiks='1899-12-30' and id not in (
select distinct lic_id  
  from ���������
  where present=true and candelete=false and date_fiks='1899-12-30')
;
  
