select s.id, trim(isnull(tt.name,''))+' '+trim(s.name) name, trim(s.name)+' '+trim(isnull(tt.name,'')) name2
  from ������� s
  left join ���������� tt on s.tip=tt.id  
order by s.name  