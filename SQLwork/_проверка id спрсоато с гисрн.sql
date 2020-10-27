select * from —Ô—Œ¿“Œ s
left join gisun_class g on g.typespr=80 and g.extcode=cast(s.id as SQL_CHAR)
where substring(kod,2,1)='2' and (substring(kod,5,1)='7' or substring(kod,5,1)='8') and substring(kod,8,3)='000'
      and extcode is null