select '10', '   Рождения', 0 from system.iota
  union all
select '11', ONA_RAION, Count(*) from актырождений
 where ona_b_rn=false and POSITION( :gorod in Upper(ona_gorod))>0
       and datez>=:date1 and datez<=:date2
 group by ONA_RAION
    union all
select '12', ' всего', Count(*) from актырождений
 where ona_b_rn=false and POSITION( :gorod in Upper(ona_gorod))>0
       and datez>=:date1 and datez<=:date2
    union all
select '12', 'остальные', Count(*) from актырождений
 where (ona_b_rn is null or ona_b_rn=true) or (POSITION( :gorod in ona_gorod)=0)
       and datez>=:date1 and datez<=:date2
    union all
select '20', '   Браки', 0 from system.iota
  union all
select '21', ONA_M_RAION, Count(*) from заключениебраков
 where ona_m_b_rn=false and POSITION( :gorod in Upper(ona_m_gorod))>0
       and datez>=:date1 and datez<=:date2
 group by ONA_M_RAION
    union all
select '22', '  Всего', Count(*) from заключениебраков
 where ona_m_b_rn=false and POSITION( :gorod in Upper(ona_m_gorod))>0
       and datez>=:date1 and datez<=:date2
    union all
select '22', 'остальные', Count(*) from заключениебраков
 where ((ona_m_b_rn is null or ona_m_b_rn=true) or (POSITION( :gorod in Upper(ona_m_gorod))=0))
        and datez>=:date1 and datez<=:date2
  union all
select '31', ON_M_RAION, Count(*) from заключениебраков
 where on_m_b_rn=false and POSITION( :gorod in Upper(on_m_gorod))>0
        and datez>=:date1 and datez<=:date2
 group by ON_M_RAION
    union all
select '32', '  Всего', Count(*) from заключениебраков
 where (on_m_b_rn=false and POSITION( :gorod in Upper(on_m_gorod))>0) 
       and datez>=:date1 and datez<=:date2
    union all
select '32', 'остальные', Count(*) from заключениебраков
 where ((on_m_b_rn is null or on_m_b_rn=true)
        or (POSITION( :gorod in Upper(on_m_gorod))=0))
       and datez>=:date1 and datez<=:date2
    union all
select '40', '   Повторные браки', 0 from system.iota
  union all
select '42', 'Один из супругов повторно вступил в брак', count(*) from ЗаключениеБраков
  where (on_sem=2 and ona_sem<>2) or (ona_sem=2 and on_sem<>2)
   union all
select '42', 'Оба супруга вступили в брак повторно', count(*) from ЗаключениеБраков
  where (on_sem<>2 and ona_sem<>2)
   union all  
select '42', 'Количество человек', count(*) from ЗаключениеБраков
  where (on_sem<>2 or ona_sem<>2)

	   
		
