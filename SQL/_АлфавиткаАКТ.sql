
======= {7} ������ =============================================================================
SELECT Familia, Name, Otch, datez, nomer, id_zags, isnull(vosstan,false) as vosstan, name_zags, pol
  FROM �����������
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
ORDER BY &ORDER_BY&

======= {6} �������� =============================================================================
SELECT Familia, Name, Otch, datez, nomer, id_zags, isnull(vosstan,false) as vosstan, name_zags, pol
  FROM ������������
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
ORDER BY &ORDER_BY&

======= {5} ����� =============================================================================
SELECT * FROM
(
SELECT ONA_Familia as Familia, ONA_Name as Name, ONA_Otch as Otch, datez, nomer, id_zags, isnull(vosstan,false) as vosstan, name_zags, '�' pol
  FROM ����������������
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
      union all
SELECT ONA_FamiliaP as Familia, ONA_Name as Name, ONA_Otch as Otch, datez, nomer, id_zags, isnull(vosstan,false) as vosstan, name_zags, '�' pol
  FROM ����������������
  WHERE ONA_FamiliaP is not null and ONA_FamiliaP<>ONA_Familia &print_all&
        and year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
      union all
SELECT ON_Familia as Familia, ON_Name as Name, ON_Otch as Otch, datez, nomer, id_zags, isnull(vosstan,false) as vosstan, name_zags, '�' pol
  FROM ����������������
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
      union all
SELECT ON_FamiliaP as Familia, ON_Name as Name, ON_Otch as Otch, datez, nomer, id_zags, isnull(vosstan,false) as vosstan, name_zags, '�' pol
  FROM ����������������
  WHERE ON_FamiliaP is not null and ON_FamiliaP<>ON_Familia &print_all&
        and year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
) aaa
ORDER BY &ORDER_BY&

======= {11} ������� =============================================================================
SELECT * FROM
(
SELECT ONA_Familia as Familia, ONA_Name as Name, ONA_Otch as Otch, datez, nomer, id_zags, false vosstan, name_zags, '�' pol
  FROM AktTermMarriage
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
      union all
SELECT ONA_FamiliaP as Familia, ONA_Name as Name, ONA_Otch as Otch, datez, nomer, id_zags, false vosstan, name_zags, '�' pol
  FROM AktTermMarriage
  WHERE ONA_FamiliaP is not null and ONA_FamiliaP<>ONA_Familia &print_all&
        and year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
      union all
SELECT ON_Familia as Familia, ON_Name as Name, ON_Otch as Otch, datez, nomer, id_zags, false vosstan, name_zags, '�' pol
  FROM AktTermMarriage
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
      union all
SELECT ON_FamiliaP as Familia, ON_Name as Name, ON_Otch as Otch, datez, nomer, id_zags, false vosstan, name_zags, '�' pol
  FROM AktTermMarriage
  WHERE ON_FamiliaP is not null and ON_FamiliaP<>ON_Familia &print_all&
        and year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
) aaa
ORDER BY &ORDER_BY&

======= {13} �������� =============================================================================
SELECT * FROM
(
SELECT FamiliaPosle as Familia, NamePosle as Name, OtchPosle as Otch, datez, nomer, id_zags, isnull(vosstan,false) as vosstan, name_zags, pol
  FROM AktChangeName
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
      union all
SELECT FamiliaDo as Familia, NameDo as Name, OtchDo as Otch, datez, nomer, id_zags, isnull(vosstan,false) as vosstan, name_zags, pol
  FROM AktChangeName
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &print_all& &add_where&
) aaa
ORDER BY &ORDER_BY&

======= {12} ����������� =============================================================================
SELECT * FROM
(
SELECT FamiliaPosle as Familia, NamePosle as Name, OtchPosle as Otch, datez, nomer, id_zags, false as vosstan, name_zags, pol
  FROM AktAdopt
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
      union all
SELECT FamiliaDo as Familia, NameDo as Name, OtchDo as Otch, datez, nomer, id_zags, false as vosstan, name_zags, pol
  FROM AktAdopt
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &print_all& &add_where&
) aaa
ORDER BY &ORDER_BY&

======= {8} ���_��������� =============================================================================
SELECT * FROM
(
SELECT FamiliaPosle as Familia, NamePosle as Name, OtchPosle as Otch, datez, nomer, id_zags, false as vosstan, name_zags, pol
  FROM ����������������
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
      union all
SELECT FamiliaDo as Familia, NameDo as Name, OtchDo as Otch, datez, nomer, id_zags, false as vosstan, name_zags, pol
  FROM ����������������
  WHERE (FamiliaDo<>FamiliaPosle or NameDo<>NamePosle or OtchDo<>OtchPosle) &print_all& 
        and year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
) aaa
ORDER BY &ORDER_BY&

======= {18} ���_����������� =============================================================================
SELECT * FROM
(
SELECT FamiliaPosle as Familia, NamePosle as Name, OtchPosle as Otch, datez, nomer, id_zags, false as vosstan, name_zags, pol
  FROM ������������������
  WHERE year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
      union all
SELECT FamiliaDo as Familia, NameDo as Name, OtchDo as Otch, datez, nomer, id_zags, false as vosstan, name_zags, pol
  FROM ������������������
  WHERE (FamiliaDo<>FamiliaPosle or NameDo<>NamePosle or OtchDo<>OtchPosle) &print_all& 
        and year(datez)>=&Year1& and year(datez)<=&Year2& &add_where&
) aaa
ORDER BY &ORDER_BY&

======= {999} ZZZ =============================================================================


