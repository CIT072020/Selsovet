select punkt, ul, trim(tt.name)+' '+trim(ss.name) name_ul from 
(select distinct punkt, ul from Ѕазаƒомов
  where date_fiks='1899-12-30' and ul is not null) uu
  left join спр”лиц ss on uu.ul=ss.id
  left join спр“ип”лиц tt on ss.tip=tt.id
order by punkt,ss.name