select id, id1, id2 from (

select h.id, n1.id as id1, n1.id_spr as id2 from houseowners h
left join (
  select n.id, s.id id_spr, trim(familia)+' '+trim(n.name)+' '+trim(otch), n.dater, s.name, s.dater 
  from население n
  left join sprowners s on s.name=trim(n.familia)+' '+trim(n.name)+' '+trim(n.otch) 
            and n.date_fiks=s.date_fiks
  where n.date_fiks='1899-12-30' and s.name is not null
) n1 on n1.id=h.kod

union all

select h.id, n1.id, n1.id_spr from houseowners h
left join (
  select n.id, s.id id_spr, trim(familia)+' '+trim(n.name)+' '+trim(otch), n.dater, s.name, s.dater 
  from население n
  left join sprowners s on s.name=trim(n.familia)+' '+trim(n.name)+' '+trim(n.otch) 
            and n.date_fiks=s.date_fiks
  where n.date_fiks='1899-12-30' and s.name is not null
) n1 on n1.id_spr=h.kod

) a
where id1 is not null and id2 is not null 
group by id, id1, id2 having count(*)>1
--order by id  