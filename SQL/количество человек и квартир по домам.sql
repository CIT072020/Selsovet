select * from (
select b.punkt, b.ul, b.dom, b.korp, count(*) num_kv, sum(ludi) as num_ludi from базадомов b
left join (select date_fiks, adres_id, count(*) as ludi 
           from население 
		   group by date_fiks, adres_id) x
  on x.date_fiks=b.date_fiks and x.adres_id=b.id 
where b.date_fiks='1899-12-30'
group by b.punkt, b.ul, b.dom, b.korp ) a
