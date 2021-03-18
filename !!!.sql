select 0 ismemo, pokaz, value, nvalue, typesave from BaseProp 
  where typeobj=8 and id=17 and dates='1899-12-30' 
 union all 
select 1 ismemo, pokaz, value, 0 nvalue, 0 typesave from BaseTextProp 
  where typeobj=8 and id=17 and dates='1899-12-30' 
