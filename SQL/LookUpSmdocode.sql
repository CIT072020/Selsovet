select code, s.* from ( 
select distinct smdocode as code from smdopost where smdocode<>'pkinci' and substring(smdocode,1,8)<>'SMDO_DIS' ) a
left join smdosprorg s on code=s.smdocode
order by s.soato