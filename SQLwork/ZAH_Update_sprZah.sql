try
  drop table #update_zah;
catch all
end;
//------------------------------
select id,
  iif(ate_punkt=0 or ate_punkt is null,iif(ate_ss=0 or ate_ss is null, iif(ate_rn=0 or ate_rn is null, ate_obl, ate_rn),ate_ss),ate_punkt) ate, 
  ate_obl,ate_rn,ate_ss,ate_punkt, name, name_path
  into #update_zah 
  from sysspr.gisun_sprzah
  where ate_punkt=0 or ate_punkt is null 
  order by id;
//------------------------------
update sprZah set sprZah.ate=u.ate from #update_zah u where sprZah.id_gis=cast(u.id as SQL_INTEGER);