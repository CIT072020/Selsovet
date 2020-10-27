SELECT
  dater,
  dates, 
  month(dater),
  month(dates),
  case when month(dates)=month(dater) then 0 else dayofmonth(dates)-dayofmonth(dater) end,
  dayofmonth(dates)-dayofmonth(dater),
   TIMESTAMPDIFF(SQL_TSI_MONTH,DATER,DATES)/12 - 
    case when dayofmonth(dates)-dayofmonth(dater)>=0 then 0 else 1 end g1
     FROM јкты—мертей WHERE Year(datez)=2005
