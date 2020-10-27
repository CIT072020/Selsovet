DELETE FROM БазаДомов WHERE punkt is null;
UPDATE БазаДомов SET kv=null WHERE kv='';
UPDATE БазаДомов SET korp=null WHERE korp='';
UPDATE БазаДомов SET dom=null WHERE dom='';
update население set население.adres_id=l.adres_id
  from Лицевыесчета l
  where l.date_fiks=население.date_fiks and население.lic_id=l.id and
        население.adres_id is null and население.lic_id is not null;
update население set propis=true where propis is null;
update население set present=true where present is null;
insert into BigHouse (date_fiks,punkt,ul,dom,korp,kol_kv,tip)
   select date_fiks,punkt,ifnull(ul,0) ul,ifnull(dom,'#') dom,ifnull(korp,'#') korp, count(*) as kol_kv, min(tip) as tip from 
     базадомов
     group by 1,2,3,4,5 ;
update BigHouse set tip=1 where tip is null;


