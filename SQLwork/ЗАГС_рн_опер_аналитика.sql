======= {1} C����� =============================================================================
select Count(*) KOLVO, 

  Sum(IIF(not zags_selo,1,0)) GOOROD, 
  Sum(IIF(not zags_selo and a.pol='�',1,0)) KOLVO_GM, 
  Sum(IIF(not zags_selo and a.pol='�',1,0)) KOLVO_GG, 
  Sum(IIF(not zags_selo and Trud(dates, dater, pol)=1,1,0)) TRUD_G,    
  Sum(CASE WHEN not zags_selo and Trud(dates, dater, pol)=2 or WordPens(WORK_NAME)=1 THEN 1 ELSE 0 END) PENS_G,
  Sum(CASE WHEN not zags_selo and getVozrast(dates, dater)<1 THEN 1 ELSE 0 END) MLAD_G,

  Sum(IIF(zags_selo,1,0)) SELO,
  Sum(IIF(zags_selo and a.pol='�',1,0)) KOLVO_SM, 
  Sum(IIF(zags_selo and a.pol='�',1,0)) KOLVO_SG, 
  Sum(IIF(zags_selo and Trud(dates, dater, pol)=1,1,0)) TRUD_S,    
  Sum(CASE WHEN zags_selo and Trud(dates, dater, pol)=2 or WordPens(WORK_NAME)=1 THEN 1 ELSE 0 END) PENS_S,
  Sum(CASE WHEN zags_selo and getVozrast(dates, dater)<1 THEN 1 ELSE 0 END) MLAD_S
	      
  from ����������� a 
  left join SprNames s on a.id_zags=s.id
where datez>='2010-01-01' and datez<'2020-10-01' 

======= {2} �������� =============================================================================
select Count(*) KOLVO, 
  Sum(IIF(not zags_selo,1,0)) GOOROD, 
  Sum(IIF(zags_selo,1,0)) SELO,
  from ������������ a 
  left join SprNames s on a.id_zags=s.id
where datez>='2010-01-01' and datez<'2020-10-01' 

======= {3} ����� =============================================================================
select Count(*) KOLVO, 
  Sum(IIF(not zags_selo,1,0)) GOOROD, 
  Sum(IIF(zags_selo,1,0)) SELO,
  from ���������������� a 
  left join SprNames s on a.id_zags=s.id
where datez>='2010-01-01' and datez<'2020-10-01' 

======= {4} ����.������ =============================================================================
select Count(*) KOLVO, 
  Sum(IIF(not zags_selo,1,0)) GOOROD, 
  Sum(IIF(zags_selo,1,0)) SELO,
  from AktTermMarriage a 
  left join SprNames s on a.id_zags=s.id
where datez>='2010-01-01' and datez<'2020-10-01' 



