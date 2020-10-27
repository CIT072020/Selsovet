update БазаСвойствОбъектов set value=replace(value,',','.')
  where position(',' in [value])>0 and typesave=6
;
update БазаСвойствОбъектов set nvalue=convert(value, SQL_NUMERIC)
  where typesave=6 or typesave=3
;
