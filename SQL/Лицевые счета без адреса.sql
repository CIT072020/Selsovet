 select d.id dddd, l.* 
  from ������������ l
  left join ��������� d on l.adres_id=d.id  
  where d.id is null 

