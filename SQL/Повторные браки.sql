select count(*) from ����������������
  where (on_sem=2 and ona_sem<>2) or (ona_sem=2 and on_sem<>2)
   union all
select count(*) from ����������������
  where (on_sem<>2 and ona_sem<>2)

  