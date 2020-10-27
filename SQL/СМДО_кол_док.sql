select SUM(IIF(ttt=1,mmm,0)) VX_ALL, SUM(IIF(ttt=2,mmm,0)) ISX_ALL,
       SUM(IIF(ttt=3,mmm,0)) VX_SMDO, SUM(IIF(ttt=4,mmm,0)) ISX_SMDO
FROM (
select 1 ttt,count(*) mmm from docmain where doc_type=3 and reg_date>='1899-12-30' and reg_date<='3000-12-30' // вход€шие
  union all
select 2,count(*) mmm from docmain where doc_type=4 and reg_date>='1899-12-30' and reg_date<='3000-12-30'      // исход€щие
  union all
select 3,count(*) mmm from smdopost where subj_type=1 and (msg_type=1 or msg_type=3) and datepost>='1899-12-30 00:00:00'  and datepost<='3000-12-30 23:59:50' and SoobIsReg(MY_REGNUMBER) //вход€шие
  union all
select 4,count(*) mmm from smdopost where subj_type=2 and (msg_type=1 or msg_type=3) and sent=1 and datepost>='1899-12-30 00:00:00'  and datepost<='3000-12-30 23:59:50' and SoobIsReg(MY_REGNUMBER) //исход€щие
) aaa