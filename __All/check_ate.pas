  // ���� ������ ��� ���� �������� �������������� ���
  {$IFDEF CHECK_ATE}
    ChangeMessage('���������� ��� ...');
    ds  := dbOpenSQL('select max(datein) max_date from ate','');
    if dbLastError()<>'' then ShowMessage( '������ ���������� ������� (������ � ATE �������): '+dbLastError() );
    ds1 := dbOpenSQL('select max(datein) max_date from newbase.ate','');
    if dbLastError()<>'' then ShowMessage( '������ ���������� ������� (������ � ATE �����): '+dbLastError() );
    if (ds<>nil) and (ds1<>nil) then begin
      if ds.Fld('max_date').IsNull  then d1:=0 else d1:=ds.Fld('max_date').AsDateTime;
      if ds1.Fld('max_date').IsNull then d2:=0 else d2:=ds.Fld('max_date').AsDateTime;
      if (d1=0) or (d1<d2) then begin
        dbClose(ds);
        ds := dbOpenSQL('select count(*) KOLVO from NewBase.ATE','');
        if (dbLastError()='') and (ds.Fld('KOLVO').AsInteger>0) then begin
          dbExecuteSQL('delete from ATE');
          dbExecuteSQL('insert into ATE select * from NewBase.ATE where category<240');
          if dbLastError()<>'' then begin
            ShowMessage( '������ ���������� ������� (������������ ATE): '+dbLastError() );
            Result := 1;
          end;
        end;
      end;
      dbClose(ds);
      dbClose(ds1);
    end;
    ChangeMessage('�������� ���� ...');
  {$ENDIF}
