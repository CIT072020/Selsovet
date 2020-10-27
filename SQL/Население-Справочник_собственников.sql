select trim(familia)+' '+trim(n.name)+' '+trim(otch), n.dater, s.name, s.dater 
  from население n
  left join sprowners s on s.name=trim(n.familia)+' '+trim(n.name)+' '+trim(n.otch) 
            and n.date_fiks=s.date_fiks
  where n.date_fiks='1899-12-30' and s.name is not null 
