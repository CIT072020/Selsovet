delete from baseprop where typeobj=6 and 
id in (
   select b.id from baseprop b
     left join актырождений a on a.id=b.id
     where typeobj=6 and a.id is null
	  )