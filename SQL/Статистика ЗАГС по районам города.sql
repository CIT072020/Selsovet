select '10', '   ��������', 0 from system.iota
  union all
select '11', ONA_RAION, Count(*) from ������������
 where ona_b_rn=false and POSITION( :gorod in Upper(ona_gorod))>0
       and datez>=:date1 and datez<=:date2
 group by ONA_RAION
    union all
select '12', ' �����', Count(*) from ������������
 where ona_b_rn=false and POSITION( :gorod in Upper(ona_gorod))>0
       and datez>=:date1 and datez<=:date2
    union all
select '12', '���������', Count(*) from ������������
 where (ona_b_rn is null or ona_b_rn=true) or (POSITION( :gorod in ona_gorod)=0)
       and datez>=:date1 and datez<=:date2
    union all
select '20', '   �����', 0 from system.iota
  union all
select '21', ONA_M_RAION, Count(*) from ����������������
 where ona_m_b_rn=false and POSITION( :gorod in Upper(ona_m_gorod))>0
       and datez>=:date1 and datez<=:date2
 group by ONA_M_RAION
    union all
select '22', '  �����', Count(*) from ����������������
 where ona_m_b_rn=false and POSITION( :gorod in Upper(ona_m_gorod))>0
       and datez>=:date1 and datez<=:date2
    union all
select '22', '���������', Count(*) from ����������������
 where ((ona_m_b_rn is null or ona_m_b_rn=true) or (POSITION( :gorod in Upper(ona_m_gorod))=0))
        and datez>=:date1 and datez<=:date2
  union all
select '31', ON_M_RAION, Count(*) from ����������������
 where on_m_b_rn=false and POSITION( :gorod in Upper(on_m_gorod))>0
        and datez>=:date1 and datez<=:date2
 group by ON_M_RAION
    union all
select '32', '  �����', Count(*) from ����������������
 where (on_m_b_rn=false and POSITION( :gorod in Upper(on_m_gorod))>0) 
       and datez>=:date1 and datez<=:date2
    union all
select '32', '���������', Count(*) from ����������������
 where ((on_m_b_rn is null or on_m_b_rn=true)
        or (POSITION( :gorod in Upper(on_m_gorod))=0))
       and datez>=:date1 and datez<=:date2
    union all
select '40', '   ��������� �����', 0 from system.iota
  union all
select '42', '���� �� �������� �������� ������� � ����', count(*) from ����������������
  where (on_sem=2 and ona_sem<>2) or (ona_sem=2 and on_sem<>2)
   union all
select '42', '��� ������� �������� � ���� ��������', count(*) from ����������������
  where (on_sem<>2 and ona_sem<>2)
   union all  
select '42', '���������� �������', count(*) from ����������������
  where (on_sem<>2 or ona_sem<>2)

	   
		
