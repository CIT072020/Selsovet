delete from SvidPovtor where rowid in (
select b.rowid from SvidPovtor b
left join УдалениеОбъекта u on u.del_id=b.akt_id and u.typeobj=b.svid_type
where del_id is null)
