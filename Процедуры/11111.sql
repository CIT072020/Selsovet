select xozder, xozulic, xozadres, ulicnaim --* 
from sl_xozl x
left join sl_ludi m on x.xozludi=m.ludiid
left join sl_xoz l on l.xozlicsc=x.xozllicsc
left join s_dolzn d on d.dolznid=m.ludidolzn
left join s_ulic u on u.ulicid=l.xozulic
where xozludi>0 and xozllicsc>0 and l.xozlicsc is not null and m.ludiid is not null and xozzakr is null
--   and position('Ä' in Upper(xozadres))=0 and xozulic=0
--order by xozder, xozulic   
--   group by 1,2,3
       
