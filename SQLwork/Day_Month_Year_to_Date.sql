select cast(trim(cast(yearz as SQL_CHAR))+'-'+right('0'+trim(cast(monthz as SQL_CHAR)),2)+'-'+right('0'+trim(cast(dayz as SQL_CHAR)),2) as SQL_DATE)
       from alfavitzags
	   where isnull(dayz,0)>0 and isnull(monthz,0)>0 and isnull(yearz,0)>0
	         
