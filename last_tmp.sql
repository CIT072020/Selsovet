DELETE FROM #tmp_fmGurnOchered;
INSERT INTO #tmp_fmGurnOchered (ID) SELECT ID FROM ��������� WHERE FAMILIA LIKE '����%' and NAME LIKE '���%';
INSERT INTO #tmp_fmGurnOchered (ID) SELECT ID FROM SostavSem WHERE FAMILIA LIKE '����%' and NAME LIKE '���%';
INSERT INTO #tmp_fmGurnOchered (ID) SELECT ID FROM HistoryZags WHERE typeobj=3 and fieldname='FAMILIA' and VALUE LIKE '����%';
