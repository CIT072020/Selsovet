select s.id, 
       trim(isnull(tt.name,''))+' '+trim(s.name) as name, 
       trim(s.name)+' '+trim(isnull(tt.name,'')) as name2, 
       trim(s.name)+' '+trim(isnull(tt.fname,'')) as name3, 
       trim(s.name) as kname
  from ������� s
  left join ���������� tt on s.tip=tt.id  
order by s.name