--��������� ��� �������� ��� ������������ � ���� ������� ������
DELETE FROM ��������� where id in
 (SELECT n.id FROM ��������� n
   LEFT OUTER JOIN ������������ l ON n.date_fiks=l.date_fiks and n.lic_id=l.id
   WHERE l.id is null)
