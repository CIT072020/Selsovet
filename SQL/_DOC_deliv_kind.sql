select deliv_kind,  kolvo1, kolvo_all1, round(cast((100*kolvo1) as SQL_DOUBLE)/kolvo_all1,2) proc1, 
                    kolvo2, kolvo_all2, round(cast((100*kolvo2) as SQL_DOUBLE)/kolvo_all2,2) proc2
 from 
( select deliv_kind, sum(IIF(reg_date>='2018-01-01' and reg_date<='2018-12-31',1,0)) kolvo1,
                     sum(IIF(reg_date>='2019-01-01' and reg_date<='2019-12-31',1,0)) kolvo2
  from DOCMAIN d
  where doc_type=&doc_type& and ((reg_date>='2018-01-01' and reg_date<='2018-12-31') or (reg_date>='2019-01-01' and reg_date<='2019-12-31'))   
  group by 1 ) a
  left join (select count(*) kolvo_all1  from DOCMAIN where doc_type=&doc_type& and reg_date>='2018-01-01' and reg_date<='2018-12-31') b1 on 1=1
  left join (select count(*) kolvo_all2  from DOCMAIN where doc_type=&doc_type& and reg_date>='2019-01-01' and reg_date<='2019-12-31') b2 on 1=1