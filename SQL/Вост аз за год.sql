SELECT sum(KOLVO) KOLVO
FROM (
 SELECT Count(*) KOLVO FROM ЗаключениеБраков WHERE vosstan=true and Year(datez)=&gggg&
   union all 
 SELECT Count(*) KOLVO FROM AktChangeName WHERE vosstan=true and Year(datez)=&gggg&
   union all 
 SELECT Count(*) KOLVO FROM АктыСмертей WHERE vosstan=true and Year(datez)=&gggg&
   union all 
 SELECT Count(*) KOLVO FROM АктыРождений WHERE vosstan=true and Year(datez)=&gggg&
   union all
 SELECT Count(*) KOLVO FROM AktTermMarriage WHERE vosstan=true and Year(datez)=&gggg&
) aaa
