select sp.soato, sp.name name_punkt, pt.name tip_punkt, st.name tip_ul, su.name name_ul, dom1, dom2, dom, korp, kv, l.id lic_id
    ,ISNULL(b0.nvalue,0) vsego, ISNULL(b1.nvalue,0) big_enimal, ISNULL(b2.nvalue,0) korova, ISNULL(b3.nvalue,0) telki1
    ,ISNULL(b4.nvalue,0) svini, ISNULL(b5.nvalue,0) ovci, ISNULL(b6.nvalue,0) kozi, ISNULL(b7.nvalue,0) loshadi, ISNULL(b8.nvalue,0) ptica
from ЛицевыеСчета l 
left join БазаДомов a on a.id=l.adres_id and l.date_fiks=a.date_fiks 
left join СпрНасПунктов sp on sp.id=a.punkt 
left join SysSpr.TypePunkt pt on pt.id=sp.typepunkt 
left join СпрУлиц su on su.id=a.ul 
left join СпрТипУлиц st on st.id=su.tip 
left join БазаСвойствОбъектов b0 ON l.date_fiks=b0.date_fiks and l.id=b0.id and b0.pokaz='VSEGO'
left join БазаСвойствОбъектов b1 ON l.date_fiks=b1.date_fiks and l.id=b1.id and b1.pokaz='BIG_ENIMAL'
left join БазаСвойствОбъектов b2 ON l.date_fiks=b2.date_fiks and l.id=b2.id and b2.pokaz='KOROVA'
left join БазаСвойствОбъектов b3 ON l.date_fiks=b3.date_fiks and l.id=b3.id and b3.pokaz='TELKI1'
left join БазаСвойствОбъектов b4 ON l.date_fiks=b4.date_fiks and l.id=b4.id and b4.pokaz='SVINI'
left join БазаСвойствОбъектов b5 ON l.date_fiks=b5.date_fiks and l.id=b5.id and b5.pokaz='OVCI'
left join БазаСвойствОбъектов b6 ON l.date_fiks=b6.date_fiks and l.id=b6.id and b6.pokaz='KOZI'
left join БазаСвойствОбъектов b7 ON l.date_fiks=b7.date_fiks and l.id=b7.id and b7.pokaz='LOSHADI'
left join БазаСвойствОбъектов b8 ON l.date_fiks=b8.date_fiks and l.id=b8.id and b8.pokaz='PTICA'
where l.date_fiks='1899-12-30' and l.id>0 and l.candelete=false and punkt in (3) 
order by sp.name, pt.name, st.name, su.name, dom1, dom2, korp, kv