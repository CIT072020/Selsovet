select s.id, trim(t.name)+' '+s.name name from
(select distinct ul from ���������
  where date_fiks=&DATEFIKS& and punkt=? and ul is not null ) b
left join ������� s on b.ul=s.id
left join ���������� t on s.tip=t.id
order by s.name