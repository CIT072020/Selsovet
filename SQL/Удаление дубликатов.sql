delete from базастрок where базастрок.rowid in (
select b1.rowid from базастрок b1,базастрок b2
where b1.date_fiks=b2.date_fiks and b1.id=b2.id and b1.pokaz=b2.pokaz
      and b1.rowid>b2.rowid );
delete from базасвойствобъектов where базасвойствобъектов.rowid in (
select b1.rowid from базасвойствобъектов b1,базасвойствобъектов b2
where b1.date_fiks=b2.date_fiks and b1.id=b2.id and b1.pokaz=b2.pokaz
      and b1.rowid>b2.rowid );


delete from baseprop1 where baseprop1.rowid in (
select b1.rowid from baseprop1 b1,baseprop1 b2
where b1.dates=b2.dates and b1.id=b2.id and b1.pokaz=b2.pokaz and b1.typeobj=b2.typeobj
      and b1.rowid>b2.rowid );
	  
delete from basetextprop1 where basetextprop1.rowid in (
select b1.rowid from basetextprop1 b1,basetextprop1 b2
where b1.dates=b2.dates and b1.id=b2.id and b1.pokaz=b2.pokaz and b1.typeobj=b2.typeobj
      and b1.rowid>b2.rowid );