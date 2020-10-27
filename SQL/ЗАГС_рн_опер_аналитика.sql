======= {1} CÃ≈–“» =============================================================================
select Count(*) KOLVO, 

--  Sum(IIF(not zags_selo,1,0)) GOOROD, 
  Sum(IIF(not zags_selo and a.pol='Ã',1,0)) KOLVO_GM, 
  Sum(IIF(not zags_selo and a.pol<>'Ã',1,0)) KOLVO_GG, 
  Sum(IIF(not zags_selo and Trud(dates, dater, pol)=1,1,0)) TRUD_G,    
  Sum(CASE WHEN not zags_selo and Trud(dates, dater, pol)=2 or WordPens(WORK_NAME)=1 THEN 1 ELSE 0 END) PENS_G,
  Sum(CASE WHEN not zags_selo and getVozrast(dates, dater)<1 THEN 1 ELSE 0 END) MLAD_G,

--  Sum(IIF(zags_selo,1,0)) SELO,
  Sum(IIF(zags_selo and a.pol='Ã',1,0)) KOLVO_SM, 
  Sum(IIF(zags_selo and a.pol<>'Ã',1,0)) KOLVO_SG, 
  Sum(IIF(zags_selo and Trud(dates, dater, pol)=1,1,0)) TRUD_S,    
  Sum(CASE WHEN zags_selo and (Trud(dates, dater, pol)=2 or WordPens(WORK_NAME)=1) THEN 1 ELSE 0 END) PENS_S,
  Sum(CASE WHEN zags_selo and getVozrast(dates, dater)<1 THEN 1 ELSE 0 END) MLAD_S
	      
  from ‡ÍÚ˚—ÏÂÚÂÈ a 
  left join SprNames s on a.id_zags=s.id
where datez>='1900-01-01' and datez<'2200-01-01' 

======= {2} –Œ∆ƒ≈Õ»ﬂ =============================================================================
select Count(*) KOLVO, 
  Sum(IIF(not zags_selo,1,0)) GOROD, 
  Sum(IIF(zags_selo,1,0)) SELO
  from ‡ÍÚ˚–ÓÊ‰ÂÌËÈ a 
  left join SprNames s on a.id_zags=s.id
where datez>='1900-01-01' and datez<'2200-01-01' and (vosstan=false or vosstan is null)

======= {3} ¡–¿ » =============================================================================
select Count(*) KOLVO, 
  Sum(IIF(not zags_selo,1,0)) GOROD, 
  Sum(IIF(zags_selo,1,0)) SELO
  from «‡ÍÎ˛˜ÂÌËÂ¡‡ÍÓ‚ a 
  left join SprNames s on a.id_zags=s.id
where datez>='1900-01-01' and datez<'2200-01-01' 

======= {4} –¿—“.¡–¿ Œ¬ =============================================================================
select Count(*) KOLVO, 
  Sum(IIF(TYPE_RAST=1,1,0)) SOGL, 
  Sum(IIF(TYPE_RAST<>1,1,0)) SUD
  from AktTermMarriage 
where datez>='1900-01-01' and datez<'2200-01-01' 
====================================================================================



