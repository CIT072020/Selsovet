select s.id, trim(tt.name)+' '+s.name name, trim(tt.name_b)+s.name_b name_b, s.typepunkt,
       gorod, not_stat, soato, vxod, date_death, date_birth, s.kod
  from спрЌасѕунктов s
  left join SysSpr.TypePunkt tt on s.typepunkt=tt.id  
order by s.id