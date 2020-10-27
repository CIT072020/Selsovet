
  DECLARE col cursor;
  DECLARE ss string, i integer, nOldLen Integer, sNewLen String, stmt String;
  nOldLen=7;
  sNewLen='10';
  
  open col as select {static} * from system.columns where name like '%dom%' and parent<>'БазаДомов'
              and parent<>'SprIzbUch2' and parent<>'ТалоныУбытия'
			   and parent<>'ТалоныПрибытия'  and parent<>'BigHouse'
			    and parent<>'НаселениеДоп';
  i=0;
  while fetch col do
   insert into global (id_base,main_base) values (i,0);
   i=i+1;
  end;
  
  i=0;
  while fetch col do
   insert into global (main_base,id_base,sss) values (0,col.Field_Length,trim(col.parent)+'.'+trim(col.name));
   
    if col.Field_Length=nOldLen then  
      stmt = 'ALTER TABLE ' + trim(col.parent) + 
             ' ALTER COLUMN ' + trim(col.name) + ' ' +trim(col.name) + 
			 ' CiChar('+sNewLen+')';
      insert into global (main_base,sss) values (0,trim(stmt));
      EXECUTE IMMEDIATE stmt;
	endif;
	i=i+1;  
  end while;
