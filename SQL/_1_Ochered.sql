
insert into OcheredResh (ID,OCHERED_ID,TIP,NOMER,DATER,OSNOV,OSNOV_TEXT,OSNOV2,OSNOV_TEXT2,OTKAZ) 
     select ID,OCHERED_ID,1,REG_RESH,ISNULL(REG_DATE,DEC_DATE),ISNULL(REG_OSNOV,0),REG_OSNOV_TEXT,REG_OSNOV2,REG_OSNOV_TEXT2,OTKAZ 
     from Ochered1 where reg_date is not null or reg_resh is not null or iskl=false or iskl is null;
insert into OcheredResh (ID,OCHERED_ID,TIP,NOMER,DATER,OSNOV,OSNOV_TEXT,ADDINFO,OTKAZ) 
   select ID,OCHERED_ID,9,ISK_RESH,ISK_DATE,ISNULL(ISK_OSNOV,0),ISK_OSNOV_TEXT,ISK_ADDINFO,false 
   from Ochered1 where isk_date is not null or isk_resh is not null or iskl=true;

update Ochered set ID_POST_RESH=0, ID_SN_RESH=0,ID_LAST_RESH=0;
update Ochered set ID_POST_RESH=ISNULL(AUTO_ID,0) FROM OcheredResh where ochered.id=ocheredResh.id and ochered.ochered_id=ocheredResh.ochered_id and tip=1;
update Ochered set ID_SN_RESH=ISNULL(AUTO_ID,0) FROM OcheredResh where ochered.id=ocheredResh.id and ochered.ochered_id=ocheredResh.ochered_id and tip=9;
update Ochered set ID_LAST_RESH=ID_SN_RESH FROM Ochered where iskl=true;
update Ochered set ID_LAST_RESH=ID_POST_RESH FROM Ochered where iskl=false or iskl is null;
