
update ��������� set adres_id = 
  ( select l.adres_id 
    from ������������ l 
    where l.date_fiks=���������.date_fiks and ���������.lic_id=l.id )

update ��������� set adres_id=l.adres_id
  from ��������� inner join ������������ l 
    on l.date_fiks=���������.date_fiks and ���������.lic_id=l.id

update ��������� set adres_id=l.adres_id
  from ������������ l  
  where l.date_fiks=���������.date_fiks and ���������.lic_id=l.id
