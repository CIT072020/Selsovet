try
  drop table #d1;
  drop table #d2;
catch all
end;
-- ��������� ��������� ��������� ������(��������)
select id, date, max(date_srok) date_srok into #d1 
  from ����������������� 
  where date_fiks=&DATE_FIKS& and tip=&TIP& and contant=0 and date_srok is not null and date_srok<=curdate() group by 1,2;
-- ��������� �������� � ������������ �����   
select id, max(date) date  into #d2
  from ����������������� 
  where date_fiks=&DATE_FIKS& group by 1;
--  ��������� ������(��������) �.�. ��������� � ������ ��������
select d1.id, d1.date_srok from #d1 d1
  left join #d2 d2 on d1.id=d2.id 
where d1.id=d2.id and d1.date is not null and d1.date=d2.date 
  
