try
  drop table #brak;
  drop table #rogd;
  drop table #smer;
  drop table #ustotc;
  drop table #ustmat;
  drop table #chname;
  drop table #adopt;
  drop table #term;
catch all
end;

select id_zags, count(*) kolvo
  into #brak
  FROM Çàêëş÷åíèåÁğàêîâ
  WHERE vosstan=false and datez>=:date1 and datez<=:date2
  GROUP BY 1;
select id_zags, count(*) kolvo
  into #rogd
  FROM ÀêòûĞîæäåíèé
  WHERE vosstan=false and datez>=:date1 and datez<=:date2
  GROUP BY 1;
select id_zags, count(*) kolvo
  into #smer
  FROM ÀêòûÑìåğòåé
  WHERE vosstan=false and datez>=:date1 and datez<=:date2
  GROUP BY 1;
select id_zags, count(*) kolvo
  into #ustotc
  FROM ÀêòûÓñòÎòöîâñòâà
  WHERE datez>=:date1 and datez<=:date2
  GROUP BY 1;
select id_zags, count(*) kolvo
  into #ustmat
  FROM ÀêòûÓñòÌàòåğèíñòâà
  WHERE datez>=:date1 and datez<=:date2
  GROUP BY 1;
select id_zags, count(*) kolvo
  into #chname
  FROM AktChangeName
  WHERE datez>=:date1 and datez<=:date2
  GROUP BY 1;
select id_zags, count(*) kolvo
  into #adopt
  FROM AktAdopt
  WHERE datez>=:date1 and datez<=:date2
  GROUP BY 1;
select id_zags, count(*) kolvo
  into #term
  FROM AktTermMarriage
  WHERE datez>=:date1 and datez<=:date2
  GROUP BY 1;
----------------------------------------  
select n.id, n.name, r.kolvo kolvo_r, b.kolvo kolvo_b, 
       s.kolvo kolvo_s, u.kolvo kolvo_u, m.kolvo kolvo_m,
       c.kolvo kolvo_c, a.kolvo kolvo_a, t.kolvo kolvo_t
from sprnames n
left join #rogd r   on n.id=r.id_zags 
left join #brak b   on n.id=b.id_zags
left join #smer s   on n.id=s.id_zags 
left join #ustotc u on n.id=u.id_zags
left join #ustmat m on n.id=m.id_zags
left join #chname c on n.id=c.id_zags
left join #adopt a  on n.id=a.id_zags
left join #term t   on n.id=t.id_zags
  
  
