select ul, s.name from (select distinct ul from базадомов where ul is not null)  b
 left join спрулиц s on b.ul=s.id
