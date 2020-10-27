1.
update sp_pred set sp_pred.oked11=ss.oked11 FROM sp_pred INNER JOIN "11.dbf" ss ON sp_pred.kod=ss.kno

2.
update sp_pred set oked11=ss.oked11 from "11.dbf" ss where sp_pred.kod=ss.kno

проверка
select sp_pred.* from sp_Pred
  left join "11.dbf" ss on ss.kno=sp_pred.kod
  where ss.oked11<>sp_pred.oked11