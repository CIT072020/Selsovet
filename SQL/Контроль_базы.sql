update ��������� set kv='' where kv is null;
update ��������� set korp='' where korp is null;
update ��������� set dom='' where dom is null;
update ��������� set ���������.adres_id=l.adres_id
  from ������������ l
  where l.date_fiks=���������.date_fiks and ���������.lic_id=l.id and
        ���������.adres_id is null and ���������.lic_id is not null;
update ��������� set propis=true where propis is null;
update ��������� set present=true where present is null;
