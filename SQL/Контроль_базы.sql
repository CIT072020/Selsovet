update БазаДомов set kv='' where kv is null;
update БазаДомов set korp='' where korp is null;
update БазаДомов set dom='' where dom is null;
update Население set население.adres_id=l.adres_id
  from Лицевыесчета l
  where l.date_fiks=население.date_fiks and население.lic_id=l.id and
        население.adres_id is null and население.lic_id is not null;
update население set propis=true where propis is null;
update население set present=true where present is null;
