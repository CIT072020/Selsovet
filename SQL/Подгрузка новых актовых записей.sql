insert into ���������������� 
select * from ZZZ.����������������
where id in (  
select n.id from ZZZ.���������������� n
left join ���������������� o on n.nomer=o.nomer and n.datez=o.datez
where o.nomer is null)
