======= {1} ÓÑÒÀÍÎÂËÅÍÈÅ ÎÒÖÎÂÑÒÂÀ =============================================================================
select month(datez) NMONTH, 
  Sum(IIF(not zags_selo and year(datez)=2009, 1,0)) KOLVO_GP, 
  Sum(IIF(    zags_selo and year(datez)=2009, 1,0)) KOLVO_SP, 
  Sum(IIF(not zags_selo and year(datez)=2010, 1,0)) KOLVO_GC, 
  Sum(IIF(    zags_selo and year(datez)=2010, 1,0)) KOLVO_SC 
  from ÀêòûÓñòÎòöîâñòâà a 
  left join SprNames s on a.id_zags=s.id
where (year(datez)=2009 or year(datez)=2010) and month(datez)<=&month&
group by 1 

======= {2} ÓÑÒÀÍÎÂËÅÍÈÅ ÌÀÒÅĞÈÍÑÒÂÀ =============================================================================
select month(datez) NMONTH, 
  Sum(IIF(year(datez)=2009, 1,0)) KOLVO_P, 
  Sum(IIF(year(datez)=2010, 1,0)) KOLVO_C
  from ÀêòûÓñòÌàòåğèíñòâà a 
  left join SprNames s on a.id_zags=s.id
where (year(datez)=2009 or year(datez)=2010) and month(datez)<=&month&
group by 1 

======= {3} ÏÅĞÅÌÅÍÀ ÈÌÅÍÈ =============================================================================
select month(datez) NMONTH, 
  Sum(IIF(year(datez)=2009, 1,0)) KOLVO_P, 
  Sum(IIF(year(datez)=2010, 1,0)) KOLVO_C
  from AktChangeName a 
  left join SprNames s on a.id_zags=s.id
where (year(datez)=2009 or year(datez)=2010) and month(datez)<=&month&
group by 1 

======= {4} ÓÑÛÍÎÂËÅÍÈÅ =============================================================================
select month(datez) NMONTH, 
  Sum(IIF(year(datez)=2009, 1,0)) KOLVO_P, 
  Sum(IIF(year(datez)=2010, 1,0)) KOLVO_C
  from AktAdopt a 
  left join SprNames s on a.id_zags=s.id
where (year(datez)=2009 or year(datez)=2010) and month(datez)<=&month&
group by 1 
====================================================================================
