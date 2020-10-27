select h.id, h.kod, n.id id_men from HouseOwners h
  left join Население n on h.kod=n.id and n.date_fiks='1899-12-30'
  where h.typekod=1 and h.date_fiks='1899-12-30' and n.id is null
 
