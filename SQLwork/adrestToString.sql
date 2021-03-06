select isnull(p.gorod,false) isgorod, etag, kol_etag, b.not_dom, b.id, b.punkt, trim(isnull(tp.name,'')) tp_name, trim(p.name) punkt_name, iif(p.name is null, '', trim(isnull(tp.name,''))+char(160)+trim(p.name)) punkt_fullname, 
       u.id ul, trim(u.name) ul_name, iif(u.name is null,'',trim(isnull(tu.name,''))+char(160)+trim(u.name)) ul_fullname,
       trim(isnull(b.dom,'')) dom, trim(isnull(b.korp,'')) korp, trim(isnull(b.kv,'')) kv 
 from БазаДомов b
 left join СпрНасПунктов p on p.id=b.punkt
 left join SysSpr.TypePunkt tp on tp.id=p.typepunkt
 left join СпрУлиц u on u.id=b.ul
 left join СпрТипУлиц tu on tu.id=u.tip
 where b.id=4589 and date_fiks='1899-12-30';
