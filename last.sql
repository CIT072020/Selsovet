SELECT qg.ID, qg.COVER_MESSAGE_ID, qg.COVER_MESSAGE_TIME, qg.USER_GIS,
qg.Familia, qg.Name, qg.Otch, qg.DateR, qg.Pol, qg.IDENTIF, qg.Grag
FROM QueryGis qg
ORDER BY qg.COVER_MESSAGE_TIME DESC
