update Население set vus=true where date_fiks='1899-12-30' and (vus=false or vus is null) and id in (select id from VUS);
update Население set vus=false where date_fiks='1899-12-30' and (vus=true or vus is null) and id not in (select id from VUS);
update Население set ochered=true where date_fiks='1899-12-30' and (ochered=false or ochered is null) and id in (select distinct id from Ochered);
delete from ochered where id not in (select id from Население where date_fiks='1899-12-30');
delete from vus where id not in (select id from Население where date_fiks='1899-12-30');
update SostavSem set iskl=false where iskl is null;
update Ochered set only=false where only is null;
update Ochered set simple=1 where simple is null;
update ochered set iskl=false where iskl is null;
update ochered set otkaz=false where otkaz is null;
update ochered set dec_date_real=dec_date where dec_date_real is null;
DELETE FROM ocheredResh WHERE id not in (select id from ochered);
DELETE FROM SostavSem WHERE id not in (select id from ochered);
DELETE FROM ocheredResh WHERE cast(id as SQL_CHAR)+' '+trim(cast(ochered_id as SQL_CHAR)) not in (SELECT cast(id as SQL_CHAR)+' '+trim(cast(ochered_id as SQL_CHAR)) from ochered);
