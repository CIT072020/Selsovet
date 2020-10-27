procedure ChangeID_ZAGS;
var
  f  : TfmParamQuest;
  n,i  : Integer;
  ds : TDataSet;
  sNewID,sOldID:String;
  sNewNAME,sOldNAME,sSQL,sss:String;
  dDo:TDateTime;
  nYear,nMonth,nDay : Word;
begin
  ds:=dmBase.GetDataSet('SprNames');
  sOldID:=ds.Fld('ID').AsString;
  sOldName:=ds.Fld('NAME').AsString;
  sTmp:='ID<>'+sOldID;
  f := TfmParamQuest.Create(nil);
  f.Caption := '�������� ����� ����';
  f.AddParamEx(0,'����', 'ZAGS','TYPE=LOOKUP~DESC=LOOKUP_SPRNAMES2~WIDTH=250');
  f.AddParamEx(Now,'�� ����', 'DATE_DO','TYPE=DATE');
  f.AddButtons('���������~�����',0);
  n:=f.ShowQuest;
  sNewID:='';
  if n = 1 then begin
    sNewID:=IntToStr(f.GetValue('ZAGS','N'));
    dDo:=f.GetValue('DATE_DO','D');
  end;
  f.Free;
  if (sNewID<>'') and (sNewID<>'0') and (sNewID<>'-1') then begin
    writedebug(inttostr(ddo));
    if (dDo>0) and (dDo<=Now) then begin
      sss:='��� �/� ���������� �� '+DatePropis(dDo,0)+Chr(13);
    end else begin
      sss:='';
    end;
    sNewName:=SeekValueSpr('SprNames','ID',sNewID,'NAME');
    if OkWarning('���� �� ������ �������� ����� �����������:           '+Chr(13)+
                 '"'+sOldName+'"  '+Chr(13)+
                 ' ��'+Chr(13)+
                 '"'+sNewName+'"  '+Chr(13)+sss+
                 '������� � ���� ����� ����� "��" ') then begin
      OpenMessage('��������� ...','',10);
      n:=CountTablesZAGS;
      for i:=1 to n do begin
        sss:='';
        if (dDo>0) and (dDo<=Now) then begin
          if (UperCase(GetNameTableZAGS(i))='ALFAVITZAGS') then begin
            DecodeDate(dDo,nYear,nMonth,nDay);
            sss:=' and yearz<='+IntToStr(nYear)+' and monthz<='+IntToStr(nMonth)+' and dayz<='+IntToStr(nDay);
          end else if (UperCase(GetNameTableZAGS(i))<>'LISTSVID') then begin

          end else begin
            sss:=' and datez<='+DateToSQL(dDo);
            sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+sss+';';
          end;
        end else begin
          sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+';';
        end;
        writedebug(sSQL);
        dbExecuteSQL(sSQL);
        if dbLastError()<>'' then begin
          ShowMessage( '������ ����������: '+dbLastError() );
        end;
      end;
      CloseMessage();
    end;
  end;
end;
