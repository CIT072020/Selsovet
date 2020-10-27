update спрстран 
  set fname=b.namep collate ads_default_ci 
  from s_stran b
where cast(b.kod as sql_integer)=id  
