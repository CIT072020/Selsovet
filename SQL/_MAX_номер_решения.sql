select max(cast(trim(reg_resh) as SQL_INTEGER)) 
from ochered 
where position('/' in reg_resh)=0 and position('.' in reg_resh)=0  and position('-' in reg_resh)=0
