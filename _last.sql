SELECT p.*, d.nomer, d.datez, d.mesto as mesto_
FROM  PredZapis p
LEFT JOIN DeclareMarriage d ON d.id=p.decl_id
WHERE p.typeobj=11 and p.mesto=0 and p.god=2018 and p.month=1 and day>0 and p.otkaz=false
ORDER BY day, beginr
