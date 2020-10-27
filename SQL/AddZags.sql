insert into sysspr.sprzags
select id, name, name_b, kod as soato from
  sysspr.спрсоато
  where substring(kod,1,1)='3'
    and substring(kod,3,2)<>'00' and substring(kod,5,6)='000000'