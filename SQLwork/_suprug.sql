try
  drop table #supgugi;
catch all
end try;

--select Trim(ff.familia)+' '+trim(ff.name)+' '+Trim(ff.otch),ff.pol,ff.id, 
--       Trim(nn.familia)+' '+trim(nn.name)+' '+Trim(nn.otch),nn.pol,nn.id two_id,substring(ss.name,1,5),nn.lic_id,ss.name as nameo
select distinct ff.id, nn.id two_id
  into #supgugi 
  from ��������� nn 
  left join ������������ ss on ss.id=nn.otnosh
  left join ��������� ff on nn.date_fiks=ff.date_fiks and ff.first=true and nn.lic_id=ff.lic_id
  where ( (ss.name='����'and ff.pol='�') or (ss.name='���' and ff.pol='�') ) and nn.first=false and nn.date_fiks='1899-12-30' and ff.id=5446;

select id, count(*) from #supgugi
group by 1 having count(*)>1    
--DELETE FROM ������������ WHERE SUPRUG_ID=0;  
--INSERT INTO ������������ (ID, SUPRUG_ID) SELECT ID,0 as SUPRUG_ID FROM #supgugi WHERE ID not in (SELECT ID FROM ������������);    
  
--update n set n.suprug_id=p.two_id 
--  from ������������ n inner join #supgugi p on p.id=n.id and n.date_fiks='1899-12-30'
--  where n.date_fiks='1899-12-30' and n.suprug_id is null;
  
--update n set n.suprug_id=p.id 
--  from ��������� n inner join #supgugi p on p.two_id=n.id and n.date_fiks='1899-12-30'
--  where n.date_fiks='1899-12-30' and n.suprug_id is null;

