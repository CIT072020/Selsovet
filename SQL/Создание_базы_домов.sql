DELETE FROM ��������� WHERE punkt is null;
UPDATE ��������� SET kv=null WHERE kv='';
UPDATE ��������� SET korp=null WHERE korp='';
UPDATE ��������� SET dom=null WHERE dom='';
update ��������� set ���������.adres_id=l.adres_id
  from ������������ l
  where l.date_fiks=���������.date_fiks and ���������.lic_id=l.id and
        ���������.adres_id is null and ���������.lic_id is not null;
update ��������� set propis=true where propis is null;
update ��������� set present=true where present is null;
insert into BigHouse (date_fiks,punkt,ul,dom,korp,kol_kv,tip)
   select date_fiks,punkt,ifnull(ul,0) ul,ifnull(dom,'#') dom,ifnull(korp,'#') korp, count(*) as kol_kv, min(tip) as tip from 
     ���������
     group by 1,2,3,4,5 ;
update BigHouse set tip=1 where tip is null;


