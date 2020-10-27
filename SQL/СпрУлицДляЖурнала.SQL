select 0 punkt, ss.id ul, trim(ss.name)+' '+trim(tt.name) name_ul
  from спр”лиц ss
  left join спр“ип”лиц tt on ss.tip=tt.id
order by ss.name
