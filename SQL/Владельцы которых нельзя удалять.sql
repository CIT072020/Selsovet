select distinct kod as id 
  from houseowners h
  left join население n on n.date_fiks='1899-12-30' and n.id=h.kod
  where h.date_fiks='1899-12-30' and n.candelete is not null and n.candelete=true