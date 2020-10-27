delete from ListSvid where datep not in (
select distinct datep from ListSvid 
  where sost=0 or (sost<>0 and dater>'2008-01-01'))
