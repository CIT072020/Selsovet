SELECT *  FROM SysSpr.�������� s
  WHERE Substring(kod,1,4)=:PAR_RN and
    Substring(kod,5,3)<>'550' and
   (Substring(kod,5,1)='8' or Substring(kod,5,1)='7' or
     (Substring(kod,5,3)>'500' and Substring(kod,5,3)<'550' )
           or
      (Substring(s.kod,5,3)>'550' and Substring(s.kod,5,3)<'600' 
         and
       Substring(s.kod,1,4)+'7'+substring(s.kod,6,2)+'000' not in (SELECT kod FROM SysSpr.��������))  	
) and
    Substring(kod,6,2)<>'00' and Substring(kod,8,3)='000'

