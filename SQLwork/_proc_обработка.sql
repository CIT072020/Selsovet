
  DECLARE col cursor as select * from #TTT;
  DECLARE ss string, i integer, nOldLen Integer, sNewLen String, stmt String;
  nOldLen=7;
  sNewLen='10';
  try
    drop table #TTT;
  catch all	
  end;
  CREATE TABLE #TTT ( Name CIchar(100), Parent CiChar(100), Field_Length Integer );
-- ��� �������� select * from system.columns where name like '%/_kv' escape '/' and parent<>'���������'
-- ��� �������  select * from system.columns where name like '%/_korp' escape '/' and parent<>'���������'
  INSERT INTO #TTT (Name,Parent,Field_Length) select name,parent,field_length
              from system.columns where name like '%dom%' and parent<>'���������'
                      and parent<>'SprIzbUch2' and parent<>'������������'
                     and parent<>'��������������'  and parent<>'BigHouse' and parent<>'������������';
  open col;  
  i=0;
  while fetch col do
    if col.Field_Length=nOldLen then  
      stmt = 'ALTER TABLE ' + trim(col.parent) + 
             ' ALTER COLUMN ' + trim(col.name) + ' ' +trim(col.name) + 
			 ' CiChar('+sNewLen+')';
      EXECUTE IMMEDIATE stmt;
	endif;
	i=i+1;  
  end while;
