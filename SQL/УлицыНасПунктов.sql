select punkt, ul, trim(tt.name)+' '+trim(ss.name) name_ul from 
(select distinct punkt, ul from ���������
  where date_fiks='1899-12-30' and ul is not null) uu
  left join ������� ss on uu.ul=ss.id
  left join ���������� tt on ss.tip=tt.id
order by punkt,ss.name