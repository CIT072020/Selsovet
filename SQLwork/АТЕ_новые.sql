select * from ate a
left join СпрСоато s on s.ate_id=a.ate_id
where s.kod is null and a.dateout is null and category<>245 and category<>243
