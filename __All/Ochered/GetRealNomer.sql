CREATE PROCEDURE CreateTmpRealNomer ( nBase INTEGER, nType INTEGER ) 
BEGIN 
  DECLARE parType Integer;
  DECLARE parBase Integer;
  DECLARE cursor1 CURSOR;
  DECLARE n Integer;

  parType =( SELECT nType FROM __input );
  parBase =( SELECT nBase FROM __input );
  OPEN cursor1 AS SELECT * FROM ochered WHERE ochered_id=parType and id_base=parBase and iskl=false ORDER BY OCHERED_ID,SIMPLE,DEC_DATE,DEC_TIME,OLD_NOMER;
  n=0;
  DELETE FROM Временная;
  WHILE FETCH cursor1 DO
    IF parType=0 and cursor1.only=true THEN

    ELSE 
      n=n+1;
      INSERT INTO Временная (ID,NOMER) VALUES (cursor1.id, n);
    END IF;
  END WHILE;
  CLOSE cursor1;
END;
//-----------------------------------------------------------
CREATE FUNCTION GetRealNomer ( nBase INTEGER, nType INTEGER, nID INTEGER )
   RETURNS INTEGER
BEGIN
  DECLARE cursor1 CURSOR AS SELECT * FROM ochered WHERE ochered_id=nType and id_base=nBase and iskl=false ORDER BY OCHERED_ID,SIMPLE,DEC_DATE,DEC_TIME,OLD_NOMER;
  DECLARE n Integer;
  DECLARE m Integer;
  OPEN cursor1;
  n=0;
  m=0;
  WHILE FETCH cursor1 DO
    IF nType=0 and cursor1.only=true THEN

    ELSE 
      n=n+1;
      IF cursor1.id=nID THEN
        m=n;
        LEAVE;
      END IF;
    END IF;
  END WHILE;
  CLOSE cursor1;
  RETURN m;
END;


