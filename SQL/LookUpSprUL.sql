select s.id, trim(isnull(tt.name,''))+' '+trim(s.name) name, trim(s.name)+' '+trim(isnull(tt.name,'')) name2
  from спр”лиц s
  left join —пр“ип”лиц tt on s.tip=tt.id  
order by s.name  