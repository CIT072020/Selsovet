select distinct punkt, IFNULL(ul,0) ul, dom, korp, not_dom,dom1,dom2 from БазаДомов
  where date_fiks='1899-12-30' 
  order by punkt,ul,dom1,dom2,korp
