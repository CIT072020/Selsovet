select ON_RAION, Count(*) from ������������
 where on_b_rn=false and POSITION( '�����' in on_gorod)>0
 group by ON_RAION
    union all
select '���������', Count(*) from ������������
 where (on_b_rn is null or on_b_rn=true)
        or (POSITION( '�����' in on_gorod)=0)

  