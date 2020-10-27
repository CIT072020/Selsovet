DELETE FROM #tmp_fmGurnOchered;
INSERT INTO #tmp_fmGurnOchered (ID) SELECT ID FROM Население WHERE FAMILIA LIKE 'андр%' and NAME LIKE 'вас%';
INSERT INTO #tmp_fmGurnOchered (ID) SELECT ID FROM SostavSem WHERE FAMILIA LIKE 'андр%' and NAME LIKE 'вас%';
INSERT INTO #tmp_fmGurnOchered (ID) SELECT ID FROM HistoryZags WHERE typeobj=3 and fieldname='FAMILIA' and VALUE LIKE 'андр%';
