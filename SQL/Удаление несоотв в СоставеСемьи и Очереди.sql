--delete from sostavsem where id in
--(select id from (
select o.nomer_och, familia, name, otch, o.id, kolvo_sostav, nnn from ochered o
left join  
 ( select id, count(*) as nnn from sostavsem group by id ) ss
 on ss.id=o.id and nnn+1<>kolvo_sostav
left join население n on date_fiks='1899-12-30' and n.id=o.id   
where ochered_id=0 and nnn is not null --) bbb)
