select 0 punkt, ss.id ul, trim(ss.name)+' '+trim(tt.name) name_ul
  from ������� ss
  left join ���������� tt on ss.tip=tt.id
order by ss.name
