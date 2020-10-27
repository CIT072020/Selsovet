select ON_RAION, Count(*) from актырождений
 where on_b_rn=false and POSITION( 'БРЕСТ' in on_gorod)>0
 group by ON_RAION
    union all
select 'Остальные', Count(*) from актырождений
 where (on_b_rn is null or on_b_rn=true)
        or (POSITION( 'БРЕСТ' in on_gorod)=0)

  