//----------------------------------------------------------------

function GetDate_(sdate:String):TDateTime;
begin
  sDate:=Trim(sDate);
  if sDate='' then begin
    result:=0;
  end else begin
    try
      result:=STOD(Copy(sDate,7,4)+'-'+Copy(sDate,4,2)+'-'+Copy(sDate,1,2),'');
    except
      result:=0;
    end;
  end;
end;

procedure LoadZaslavl;
var
  XL:Variant;
  lOk:Boolean;
  sNameExcel:String;
  nID,nNomer,nAdresID,nTipUl,nKodUl,i,j,m,n:Integer;
  nLicID,nCountLic,nCountAdr,nCountMen:INteger;
  dsSprNP, dsSprOtn, dsSprUL,dsMens,dsLich,dsAdres : TDataSet;
  sErr,s,ss,sFam, sName, sOtch, sUL,sDOM,sKV,sAdres,sFIO, sPol, sOtn, sStat, sReg:String;
  dDateR, dDateP, dDateV:TDateTime;
  sl,slAdres:TStringList;
  lOwner, lFirst, lAddAdres:Boolean;
begin
  XL:=GetOfficeObject('Excel',lOk);
  nNomer:=3063;
  nCountLic:=0;
  nCountAdr:=0;
  nCountMen:=0;
  if lOk then begin
    sl := TStringList.Create;
    slAdres := TStringList.Create;
    sNameExcel:='E:\��������.xls';
//����������-1
    XL.WorkBooks.Add(sNameExcel);
    dsMens := dmBase.GetDataSet('tbMens');
    dsLich := dmBase.GetDataSet('tbLich');
    dsAdres:= dmBase.GetDataSet('tbAdres');
    dsSprUL:= dmBase.GetDataSet('SprUL');
    dsSprOtn:= dmBase.GetDataSet('������������');
//    dsSprNP:= dmBase.GetDataSet('�������������');
//    try
      j:=0;
      for i:=3 to 12100 do begin //13739 do begin

        s:=IntToStr(i);
        sAdres:=Trim(XL.Range['B'+s].Value);
        sFIO:=Trim(XL.Range['C'+s].Value);
        sPol:=Trim(XL.Range['D'+s].Value);
        sOtn:=Trim(XL.Range['E'+s].Value);
        dDateR:=GetDate_(XL.Range['F'+s].Value);
        sStat:=Trim(XL.Range['I'+s].Value);
        sReg:=Trim(XL.Range['J'+s].Value);
        dDateP:=GetDate_(XL.Range['K'+s].Value);
        dDateV:=GetDate_(XL.Range['L'+s].Value);
//        writedebug('"'+vDateR+'"');
        nKodUl:=0;
        if (sAdres<>'') and (sFIO<>'���') then begin
          StrToStrings(sFIO, sl, ' ');                
          sFam:=sl[0];
          if sl.count>1 then sName:=sl[1];
          if sl.count>2 then sOtch:=sl[2];
  //   �. �������� ���-� 1 �.1 ��.1
          if Copy(sAdres,1,11)<>'�. ��������' then begin
            writedebug('<<<<<<<'+sAdres+'>>>>>>>');
          end else begin
            sAdres:=Copy(sAdres,12,Length(sAdres));
            m:=Pos('�.',sAdres);
            n:=Pos('��.',sAdres);
            if n=0 then n:=Length(sAdres);
//            if (m=0) or (n=0) then begin
//              writedebug('$$$$$$$'+sAdres+'$$$$$$$$');
//            end else begin
              sUL:=Trim(Copy(sAdres,1,m-1)); 
              sDom:=Trim(Copy(sAdres,m+2,n-m-2));
              sKv:=Trim(Copy(sAdres,n+3,Length(sAdres)));
              if (sUl='���-� 1') or (sUl='���-� 2') then begin
                if sUl='���-� 1'
                  then nKodUl:=115
                  else nKodUl:=51;
              end else begin
                m:=Pos(' ',sUl);
                s:=Trim(Copy(sUl,1,m-1));
                if (s<>'��.') and (s<>'���.') 
                  then  writedebug('--'+s+'--');
                if s='��.' then nTipUl:=1 else nTipUl:=3;
                sUl:=Trim(Copy(sUl,m+1,100));
                if not dbLocate(dsSprUL,'NAME;TIP',[sUl,nTipUl],'') then begin
                  if sUl='�������' then begin
                    nKodUl:=34;
                  end else begin
                    writedebug(s+' "'+sUl+'"');
                  end;
                end else begin
                  nKodUL:=dsSprUL.Fld('ID').AsInteger;
                end;
              end;
//            end;
              if nKodUL=0 then  writedebug('????'+sUl);
//              writedebug('>>>'+inttostr(i));
              if ((dDateV=0) or (dDateV>Now)) and (sStat<>'�����') then begin
                // nKodUL, sDom, sKv
                s:='<'+inttostr(nKodUl)+'_'+sDom+'_'+sKv+'_>';
//                writedebug(s);
                ss:=slAdres.Values[s];
                nAdresID:=0;
                lAddAdres:=false;
                if ss='' then begin
                  dmBase.AddAdres(STOD('1899-12-30',''),1,nKodUL,sDom, '', sKv,nAdresID,sErr);
                  slAdres.Add(s+'='+inttostr(nAdresID));
                  lAddAdres:=true;
                  nCountAdr:=nCountAdr+1;
                end else begin
                  nAdresID:=strtoint(ss);
                end;
                if nAdresID>0 then begin
                  if lAddAdres then begin
                    nLicID := dmBase.GetNewID(dmBase.TypeObj_Lich);
                    dsLich.Append;
                    dsLich.Fld('ID').AsInteger:=nLicID;
                    dsLich.Fld('ADRES_ID').AsInteger:=nAdresID;
                    dsLich.Fld('NOMER').AsString:=inttostr(nNomer);
                    nNomer:=nNomer+1;
                    dsLich.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
                    dsLich.Fld('CANDELETE').AsBoolean:=false;
                    dsLich.Fld('FIRST').AsString:=''; //dsMens.Fld('ID').AsString;
                    dsLich.Post;
                    nCountLic:=nCountLic+1;
                  end;
                  //---- ������� �������� -----------------
                  nID := dmBase.GetNewID(dmBase.TypeObj_Nasel);
                  dsMens.Append;
                  dsMens.Fld('ID').AsInteger:=nID;
                  dsMens.Fld('FAMILIA').AsString:=Trim(FirstUpper(sFam));
                  dsMens.Fld('NAME').AsString:=Trim(FirstUpper(sName));
                  dsMens.Fld('OTCH').AsString:=Trim(FirstUpper(sOtch));
                  dsMens.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
                  if dDateR>0 then dsMens.Fld('DATER').AsDateTime:=dDateR;
                  if dDateP>0 then dsMens.Fld('DATEP').AsDateTime:=dDateP;
                  if dDateV>0  // ��������� ����������� ?
                    then dsMens.Fld('PROPIS').AsBoolean:=false
                    else dsMens.Fld('PROPIS').AsBoolean:=true;
                  dsMens.Fld('PRESENT').AsBoolean:=true;
                  dsMens.Fld('CANDELETE').AsBoolean:=false;
                  if (sReg='����������') or (sReg='��� �����������') 
                    then dsMens.Fld('PROPIS').AsBoolean:=false;
                  dsMens.Fld('POL').AsString:=sPol;
                  if not dbLocate(dsSprOtn,'NAME',[sOtn],'') then begin
                    dsSprOtn.Append;
                    dsSprOtn.Fld('NAME').AsString:=sOtn;
                    dsSprOtn.Post;
                  end;
                  lOwner:=false;
                  lFirst:=false;
                  if sStat='������/���.�����' then begin
                    lFirst:=true;
                    if sOtn='�����������' 
                      then lOwner:=true;
                  end;
                  dsMens.Fld('OTNOSH').AsInteger:=dsSprOtn.Fld('ID').AsInteger;
                  dsMens.Fld('FIRST').AsBoolean:=lFirst;
                  dsMens.Fld('CITIZEN').AsInteger:=112;
                  dsMens.Fld('LIC_ID').AsInteger:=nLicID;
                  dsMens.Fld('ADRES_ID').AsInteger:=nAdresID;
                  dsMens.Post;
                  nCountMen:=nCountMen+1;
//                writedebug('men end');

                  if lFirst then begin
                    dsLich.Edit;
                    dsLich.Fld('OWN_HOUSE').AsBoolean:=lOwner;
                    dsLich.Fld('FIRST').AsInteger:=nID;
                    dsLich.Post;
                  end;

                end;
              end;
          end;
        end;
        j:=j+1;
        if j>999 then begin 
          writedebug(inttostr(i-2));
          j:=0;
        end;
        {
        if not dbLocate(dsSprULD,'NAME;TIP',[s,i],'') then begin
          PutError('������: ����� �� ������� "'+dsData.Fld('Naim').asString+'"'+'   �.�.'+dsData.Fld('SCET').AsString);
          nIDUL := 0;
        end else begin
          nIDUL := dsSprULD.Fld('ID').AsInteger; // <-------- ����� ------------------
        end;
        }
//        strHouse := Trim(dsData.Fld('P_DOM').AsString);
//        strKv := Trim(dsData.Fld('KV_N').AsString);
//        strKorp := '';

        {
        writedebug('-------------------------------------------------');
        writedebug(inttostr(i-2)+' '+sAdres+' '+sFIO+' '+sPol);
        }
      end;
//    finally
//      CloseMessage();
//    end;

    XL.Visible:=true;
    XL:=null;
    sl.Free;
    slAdres.Free;
    writedebug('������:'+inttostr(ncountAdr));
    writedebug('���.�����:'+inttostr(ncountLic));
    writedebug('����:'+inttostr(ncountMen));
  end;
end;
{
procedure LoadGKH_Brest;
var
  dsMensLgotD,dsSprLgotD,dsMatStenD,dsSprSoato, dsSprNP, dsSprOtnD, dsSprULD,dsMensD,dsLichD,dsAdresD : TDataSet;
  dsLgotS,dsSelS,dsData,dsGilFondS,dsGragS,dsNationS,dsPunktS,dsMensS,dsUlS, dsStatS : TDataSet;
  i,j,n,nID,nAdresID,nGlava,nPunkt,nIDUL,nGES : Integer;
  s,strErr,strDir, strHouse, strKv, strKorp, strNameUL : String;
  strSQL,sFam,sName,sOtch:String;
  sl:TstringList;
  d : TDateTime;
  lOk : Boolean;
  f  : TfmParamQuest;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := '���������';
  f.AddParamEx(GlobalTask.GetLastValueAsString('DIR') , '���� � ������' , 'DIR' ,'TYPE=DIR');
  f.AddParamEx(StrToInt(Copy(GlobalTask.ParamAsString('KOD'),9,2)) , '����� ���' , 'GES' ,'');
  f.AddButtons('���������~�����',0);
  n := f.ShowQuest;
  strDir:='';
  if n = 1 then begin
    nGES:=f.GetValue('GES','N');
    strDir:=f.GetValue('DIR','C');
  end;
  f.Free;
  if (strDir<>'') and (nGes>0) and (nGES<14) then begin 
    GlobalTask.SetLastValueAsString('DIR', strDir);
    GlobalTask.SetLastValueAsInteger('GES', nGES);
    lOk := false;
    if FileExists(strDir+'\ad_dom.dbf') and FileExists(strDir+'\kvp.dbf') 
      then lOk:=true
      else PutError('�� ������� ����� ��� ��������.');
//    if lOk then begin
//      s := '';
//      s := s + '��������!'#13; // + Chr(13)+
//      s := s + '����� ���������� �������� ������� ����������'#13;
//      s := s + '� ���� ����� ����������.'#13;
//      s := s + '���� �� ������� � ������������� ���������� ��������,'#13;
//      s := s + '������� ����� �� � ���� �����'#13;
//      lOk := OkWarning(s);
//    end;
    if lOk then begin
    dsMensD := dmBase.GetDataSet('tbMens');
    dsMensLgotD := dmBase.GetDataSet('���������������');
    dsLichD := dmBase.GetDataSet('tbLich');
    dsAdresD:= dmBase.GetDataSet('tbAdres');
    dsSprULD:= dmBase.GetDataSet('SprUL');
    dsSprOtnD:= dmBase.GetDataSet('������������');
    dsSprNP:= dmBase.GetDataSet('�������������');
    dsSprSoato:= dmBase.GetDataSet('��������');
    dsMatStenD:= dmBase.GetDataSet('���������������');
    dsSprLgotD:= dmBase.GetDataSet('�������������');
    if (dsMensD<>nil) and Problem(' ������ �������� ? ') then begin
      OpenMessage('�������� ������ ...             ','',10);

      dsSprNP.First;
      nPunkt:=dsSprNP.Fld('ID').AsInteger; // <---------- ���. ����� --------------
      sl := TStringList.Create;
      n:=0;
      j:=0;
      while not dsData.Eof do begin
        s:=dsData.Fld('Naim').asString;
        if Copy(s,1,3)='�-�' then begin
          i:=6;
          s:=Copy(s,4,100);
        end else if Copy(s,1,4)='���.' then begin
          i:=20;
          s:=Copy(s,5,100);
        end else if Copy(s,1,4)='���.' then begin
          i:=3;
          s:=Copy(s,5,100);
        end else if Copy(s,1,3)='��.' then begin
          i:=1;
          s:=Copy(s,4,100);
        end else if Copy(s,1,3)='��.' then begin
          i:=4;
          s:=Copy(s,4,100);
        end else if Copy(s,1,3)='��.' then begin
          i:=2;
          s:=Copy(s,4,100);
        end;
        s:=Trim(s);
        if not dbLocate(dsSprULD,'NAME;TIP',[s,i],'') then begin
          PutError('������: ����� �� ������� "'+dsData.Fld('Naim').asString+'"'+'   �.�.'+dsData.Fld('SCET').AsString);
//          dsSprULD.Append;
//          dsSprULD.Fld('NAME').AsString:=s;
//          dsSprULD.Fld('TIP').AsInteger:=i;
//          dsSprULD.Post;
          nIDUL := 0;
        end else begin
          nIDUL := dsSprULD.Fld('ID').AsInteger; // <-------- ����� ------------------
        end;
        strHouse := Trim(dsData.Fld('P_DOM').AsString);
        strKv := Trim(dsData.Fld('KV_N').AsString);
        strKorp := '';

        s:=Trim(dsData.Fld('FIO').AsString);
        i:=Pos(' ',s);
        if i>0 then begin
          sFam:=Copy(s,1,i-1);
          s:=Copy(s,i+1,100);
          i:=Pos('.',s);
          if i>0 then begin
            sName:=Copy(s,1,i);
            sOtch:=Copy(s,i+1,100);
          end else begin
            sName:=s;
            sOtch:='';
          end;
        end else begin
          sFam:=s;
          sName:='';
          sOtch:='';
        end;
        if sFam='' then sFam:=' ��� �������';
        nAdresID:=0;
        strErr:='';
        dmBase.AddAdres(STOD('1899-12-30',''),nPunkt,nIDUL,strHouse,strKorp,strKv,nAdresID,strErr);
        if nAdresID>0 then begin
          if dbLocate(dsAdresD,'DATE_FIKS;ID',[STOD('1899-12-30',''),nAdresID],'') then begin
            dsAdresD.Edit;
            dsAdresD.Fld('GILFOND').AsInteger:=1;
            dsAdresD.Fld('ETAG').AsString:=dsData.Fld('ETAJ').AsString;
            dsAdresD.Fld('KOL_ETAG').AsString:='';
            if AnsiUpperCase(dsData.Fld('RU').AsString)='�' 
              then dsAdresD.Fld('RAION').AsString:='365'
              else dsAdresD.Fld('RAION').AsString:='368';
            dsAdresD.Post;
          end;
          dmBase.WriteValueProp('PLOSH_ALL',dsData.Fld('PL_O').asFloat, STOD('1899-12-30',''), nAdresID, dmBase.TypeObj_Adres,ftFloat);
          dmBase.WriteValueProp('PLOSH_GIL',dsData.Fld('PL_J').asFloat, STOD('1899-12-30',''), nAdresID, dmBase.TypeObj_Adres,ftFloat);
          dmBase.WriteValueProp('KOL_KOMN' ,dsData.Fld('KOM').asInteger, STOD('1899-12-30',''), nAdresID, dmBase.TypeObj_Adres,ftInteger);
        end else begin
          PutError(strErr);
        end;

        //---- ������� �������� -----------------
        nID := dmBase.GetNewID(dmBase.TypeObj_Nasel);
        dsMensD.Append;
        dsMensD.Fld('ID').AsInteger:=nID;
        dsMensD.Fld('FAMILIA').AsString:=sFam;
        dsMensD.Fld('NAME').AsString:=sName;
        dsMensD.Fld('OTCH').AsString:=sOtch;
        dsMensD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
        dsMensD.Fld('PROPIS').AsBoolean:=true;
        dsMensD.Fld('PRESENT').AsBoolean:=true;
        dsMensD.Fld('CANDELETE').AsBoolean:=false;
        dsMensD.Fld('POL').AsString:='�';

        dsMensD.Fld('OTNOSH').AsString:='';
        dsMensD.Fld('FIRST').AsBoolean:=true;
        dsMensD.Fld('CITIZEN').AsInteger:=112;

        dsMensD.Post;

        nID := dmBase.GetNewID(dmBase.TypeObj_Lich);
        dsLichD.Append;
        dsLichD.Fld('ID').AsInteger:=nID;
        dsLichD.Fld('ADRES_ID').AsInteger:=nAdresID;
        dsLichD.Fld('NOMER').AsString:=dsData.Fld('SCET').AsString;
        dsLichD.Fld('DATE_FIKS').AsDateTime:=STOD('1899-12-30','');
        dsLichD.Fld('CANDELETE').AsBoolean:=false;
        dsLichD.Fld('FIRST').AsString:=dsMensD.Fld('ID').AsString;
        dsLichD.Post;

        dsMensD.Edit;
        dsMensD.Fld('LIC_ID').AsInteger:=dsLichD.Fld('ID').AsInteger;
        dsMensD.Fld('ADRES_ID').AsInteger:=dsLichD.Fld('ADRES_ID').AsInteger;
        dsMensD.Post;

        n:=n+1;
        j:=j+1;
        if (j=100) then begin 
          ChangeMessage('���������:'+IntToStr(n));
          AppProcess;
          j:=0;
        end;
        dsData.Next;

      end;
      sl.Free;
      dbCloseConnect('TMP_LOAD');
      dbSetCurrentConnect(idConn);
      CloseMessage();
      ShowMessage('�������� ���������.'+Chr(13)+IntToStr(n)+' ���.������');
    end;
    end;
  end;
end;
}
