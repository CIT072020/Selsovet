select typeobj,id,pokaz, count(*)
--select *
from �������������������
--where id=5181
--order by pokaz
group by typeobj,id,pokaz
having count(*)>1
