select a.punkt, l.id as lic_id
  from ������������ l
  left join ��������� a on l.date_fiks=a.date_fiks and l.adres_id=a.id 
  left join ������������� s ON s.id=a.punkt
  left join ��������� n ON l.date_fiks=n.date_fiks and l.first=n.id
  where l.date_fiks='1899-12-30' and l.candelete=false and l.adres_id>0 and n.propis=true  &punkt& and
        exists (select kod from �������������������� lp where lp.date_fiks=l.date_fiks and l.id=lp.id and (&gggg&))
 


