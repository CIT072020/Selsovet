--GRANT Alter ON [USER1] TO [АДМИНИСТРАТОР];
--select * from system.users
--EXECUTE PROCEDURE sp_ModifyUserProperty('СПЕЦИАЛИСТ', 'USER_DEFINED_PROP', 'GISRN_ETSP=2');
/*
insert into baseTextProp (TYPEOBJ, ID, DATES, POKAZ, VALUE)  
select 3 typeobj, ID, '1900-01-01' dates, 'SVERKI' pokaz, 'NAME=Форма 2'+char(13)+char(10)+'DATE_SV='+
      Trim(convert(Year(DATESV_F2),sql_char))+Trim(IIF(Month(DATESV_F2)<10,'0'+convert(Month(DATESV_F2),sql_char),convert(Month(DATESV_F2),sql_char)))+
      Trim(IIF(DayOfMonth(DATESV_F2)<10,'0'+convert(DayOfMonth(DATESV_F2),sql_char),convert(DayOfMonth(DATESV_F2),sql_char)))+char(13)+char(10) value
  from vus where DATESV_F2 is not null;
-- ////////////////////////////////  
insert into baseTextProp (TYPEOBJ, ID, DATES, POKAZ, VALUE)  
select 3 typeobj, ID, '1900-01-02' dates, 'SVERKI' pokaz, 'NAME=Военный комиссариат'+char(13)+char(10)+'DATE_SV='+
      Trim(convert(Year(DATESV_VK),sql_char))+Trim(IIF(Month(DATESV_VK)<10,'0'+convert(Month(DATESV_VK),sql_char),convert(Month(DATESV_VK),sql_char)))+
      Trim(IIF(DayOfMonth(DATESV_VK)<10,'0'+convert(DayOfMonth(DATESV_VK),sql_char),convert(DayOfMonth(DATESV_VK),sql_char)))+char(13)+char(10) value
  from vus where DATESV_VK is not null; 
-- ////////////////////////////////
insert into baseTextProp (TYPEOBJ, ID, DATES, POKAZ, VALUE)  
select 3 typeobj, ID, '1900-01-03' dates, 'SVERKI' pokaz, 'NAME=Карточка прописки'+char(13)+char(10)+'DATE_SV='+
      Trim(convert(Year(DATESV_LIC),sql_char))+Trim(IIF(Month(DATESV_LIC)<10,'0'+convert(Month(DATESV_LIC),sql_char),convert(Month(DATESV_LIC),sql_char)))+
      Trim(IIF(DayOfMonth(DATESV_LIC)<10,'0'+convert(DayOfMonth(DATESV_LIC),sql_char),convert(DayOfMonth(DATESV_LIC),sql_char)))+char(13)+char(10) value
  from vus where DATESV_LIC is not null;
  */
