//--- ��������� ������ � �� ������� �������� ������ �� ���� ------------------------------------------------------------
function IsZvMat(ds:TDataSet):Boolean;
var
  fld:TField;
begin
  Result:=false;
  fld:=ds.FindField('ON_DATER');
  if fld=nil then begin
    if (ds.Fld('SVED').AsString='3') then begin  
      Result:=true;
    end;
  end else begin
    if (ds.Fld('SVED').AsString='3') and ds.Fld('ON_DATER').IsNull then begin  
      Result:=true;
    end;
  end;
end;
function IsZvMat_(dok:TDokZAGS):Boolean;
var
  fld:TField;
begin
  Result:=false;
  fld:=dok.Fld('ON_DATER');
  if fld=nil then begin
    if (dok.Fld('SVED').AsString='3') then begin 
      Result:=true;
    end;
  end else begin
    if (dok.Fld('SVED').AsString='3') and fld.IsNull then begin 
      Result:=true;
    end;
  end;
end;
//---------------------------------------------------------------
function Ochered_Dolg : String;    // ��������� ������������ �� �����������
begin Result :=ParamAsString('DOLG_RUKOV'); end;

function Ochered_FIO : String;      // ��� ������������ �� �����������
begin Result :=ParamAsString('������������'); end;
//---------------------------------------------------------------
function DolgSecretar : String; begin Result:=ParamAsString('DOLG_UPRAV');  end; //'����������� ������';
function FIOSecretar : String;  begin Result:=ParamAsString('���������');   end;

function DolgRukov : String;    begin Result:=ParamAsString('DOLG_RUKOV');  end;
function FIORukov : String;     begin Result:=ParamAsString('������������');end;

function DolgGlBux : String;    
begin 
  Result:=ParamAsString('DOLG_GL_BUX'); 
  if Result=''
    then Result:='������� ���������';
end;
function FIOGlBux : String;     begin Result:=ParamAsString('��_���������');end;

//---------------------------------------------------------------
function DolgSpec : String;    
begin 
  if (IDPROG()='ZAGS') or  (IDPROG()='OCHERED')
    then Result:=ParamAsString('DOLG_SPEC')    
    else Result:=ParamAsString('DOLG_PASP');    
end;

//---------------------------------------------------------------
function FIOSpec : String;     
begin 
  if IDPROG()='OCHERED'
    then Result:=ParamAsString('����������')
    else 
      if IDPROG()='ZAGS' 
        then Result:=ParamAsString('����_����')     
        else Result:=ParamAsString('���_����');     
end;
//---------------------------------------------------------------
function FIOSpecEx(nType:Integer) : String;     
begin  if nType=1 then Result:=ParamAsString('����_����_�') else Result:=FIOSpec() end;
//---------------------------------------------------------------
function DolgSpecOrSecretar : String; 
begin if FIOSpec='' then Result:=DolgSecretar else Result:=DolgSpec; end;
//---------------------------------------------------------------
function FIOSpecOrSecretar : String; 
begin if FIOSpec='' then Result:=FIOSecretar  else Result:=FIOSpec;  end;
//---------------------------------------------------------------
function FIORukovZAGS : String; 
begin Result:=Parameters('���_����') end;
//---------------------------------------------------------------
function FIORukovZAGS_B : String; 
begin Result:=Parameters('���_����_�') end;
//---------------------------------------------------------------
function GetShtampSpr:String;
begin Result:=Globaltask.ParamAsString('SHTAMP') end;
//---------------------------------------------------------------
function GetShtampSprEx(nType:Integer):String;
begin 
  if nType=1 then Result:=Globaltask.ParamAsString('SHTAMP_B') 
             else Result:=Globaltask.ParamAsString('SHTAMP'); 
end;
//---------------------------------------------------------------
function Zags_Akt_Rukov : String;
begin
  Result:=DokZags.Fld('RUKOV').AsString;
end;

function Zags_Akt_Spec : String;
begin
  Result:=DokZags.Fld('SPEC').AsString;
end;
//------------------
function Zags_Svid_Podp(sLang:String) : String;
begin
  if DokZAGS.OnlySvid then begin
    if DokZags.PrintSpecSvid then begin // ������ ����������� � �������������
      if (sLang='B') or (sLang='�')  then Result:=DokZags.Fld('Spec_B').AsString  else Result:=DokZags.Fld('Spec').AsString;
    end else begin
      if (sLang='B') or (sLang='�')  then Result:=DokZags.Fld('Rukov_B').AsString  else Result := DokZags.Fld('Rukov').AsString;
    end;
  end else begin
    // ���� ��������� �������������
    if DokZags.Fld('POVTOR').AsBoolean then begin
      if DokZags.PrintSpecSvid then begin // ������ ����������� � �������������
        if (sLang='B') or (sLang='�') 
          then Result := ParamAsString('����_����_�')
          else Result := ParamAsString('����_����');  
      end else begin
        if (sLang='B') or (sLang='�') 
          then Result := ParamAsString('���_����_�')
          else Result := ParamAsString('���_����');
      end;
    end else begin
      if DokZags.PrintSpecSvid then begin // ������ ����������� � �������������
        if (sLang='B') or (sLang='�') 
          then Result := DokZags.Fld('Spec_B').AsString
          else Result := DokZags.Fld('Spec').AsString;
      end else begin
        if (sLang='B') or (sLang='�') 
          then Result := DokZags.Fld('Rukov_B').AsString
          else Result := DokZags.Fld('Rukov').AsString;
      end;
    end;
  end;
end;
//------------------------
function Zags_Sprav_Dolg : String;
begin
 if DokZags.PrintSpecSprav=1  // ������ ����������� � ��������  1-�� 0-��� 2-������ ���
   then Result := ParamAsString('DOLG_SPEC')  
   else Result := ParamAsString('DOLG_RUK_ZAGS');
end;
function Zags_Sprav_FIO : String;
begin
 if (DokZags.PrintSpecSprav=1) or (DokZags.PrintSpecSprav=2) // ������ ����������� � ��������
   then Result := ParamAsString('����_����')  
   else Result := ParamAsString('���_����');
end;
//------------------------
function Zags_Sprav_DolgEx(nType:Integer) : String;
begin
 if nType=1 then begin
   if DokZags.PrintSpecSprav=1  // ������ ����������� � ��������  1-�� 0-��� 2-������ ���
     then Result := ParamAsString('DOLG_SPEC_B')  
     else Result := ParamAsString('DOLG_RUK_ZAGS_B');
 end else begin
   Result:=Zags_Sprav_Dolg;
 end;
end;
function Zags_Sprav_FIOEx(nType:Integer) : String;
begin
 if nType=1 then begin
   if (DokZags.PrintSpecSprav=1) or (DokZags.PrintSpecSprav=2) // ������ ����������� � ��������
     then Result := ParamAsString('����_����_�')  
     else Result := ParamAsString('���_����_�');
 end else begin
   Result:=Zags_Sprav_FIO;
 end;
end;
//------------------------
function Zags_Copy_Rukov : String;
begin
  if (IdProg1()='S') and (GlobalTask.GetLastValueAsInteger('COPY_ZAGS_RUK_RN')=1) then begin
    Result := ParamAsString('DOLG_ZAGS_RN');
  end else begin
   if ParamAsString('PR_SPEC_COPY')='1'  // ������ ����������� � ����� �/�  1-�� 0-��� 2-������ ���
     then Result := ParamAsString('DOLG_SPEC')  
     else Result := ParamAsString('DOLG_RUK_ZAGS');
  end;
end;

function Zags_Copy_FIO : String;
var
  sType:String;
begin
  if (IdProg1()='S') and (GlobalTask.GetLastValueAsInteger('COPY_ZAGS_RUK_RN')=1) then begin
    Result := ParamAsString('RUK_ZAGS_RN');
  end else begin
    sType:=ParamAsString('PR_SPEC_COPY');
    if (sType='1') or (sType='2') // ������ ����������� � ����� �/�
      then Result := ParamAsString('����_����')  
      else Result := ParamAsString('���_����');
  end;
end;
//------------------------
function Zags_Otchet_DOLG : String;
begin
  if IDPROG()='ZAGS' then begin
    Result:=ParamAsString('DOLG_RUK_ZAGS')
  end else begin
    if ParamAsBoolean('PR_SPEC_SPRAV')
      then Result:=ParamAsString('DOLG_SPEC')
      else Result:=ParamAsString('DOLG_RUK_ZAGS');
  end;
end;
//------------------------------------------------------------------------------
function Zags_Otchet_FIO : String;
begin
  if IDPROG()='ZAGS' then begin
    Result:=ParamAsString('���_����')
  end else begin
    if ParamAsBoolean('PR_SPEC_SPRAV')
      then Result:=ParamAsString('����_����')
      else Result:=ParamAsString('���_����');
  end;
end;
//-----------------------------------
function CreateKolonN(nType:Integer):String;
begin
  Result:='';
  if ParamAsBoolean('ADD_KOLON_N') then begin
    Result:=FIOSpecEx(nType)+' '+ParamAsString('SPEC_TEL');
  end;
end;
//-----------------------------------
function CreateKolonNPismo(nType:Integer):String;
begin
  Result:='';
  if ParamAsBoolean('P_ADD_KOLON_N') then begin
    Result:=FIOSpecEx(nType)+' '+ParamAsString('SPEC_TEL');
  end;
end;
//-----------------------------------
function CreateKolonNIzv(nType:Integer):String;
begin
  Result:='';
  if ParamAsBoolean('I_ADD_KOLON_N') then begin
    Result:=FIOSpecEx(nType)+' '+ParamAsString('SPEC_TEL');
  end;
end;


//------------------------------------------------------------------------------
function FU( s : String) : String;
begin
  if (s<>'')
    then Result := ANSIUpperCase(Copy(s,1,1))+Copy(s,2,Length(s)-1)
    else Result:=s;
end;
//------------------------------------------------------------------------------
{
function FirstUpper( s : String) : String;
var
  i : Integer;
  s1,s2 : String;
begin
  i := Pos('-',s);
  if (Pos('-',s)=0) and (Pos(' ',s)=0) and (Pos(',',s)=0) then begin
    Result := ANSIUpperCase(Copy(s,1,1))+ANSILowerCase(Copy(s,2,Length(s)-1));
  end else begin
    Result := s;
//    s1 := Copy(s,1,i-1);
//    s2 := Copy(s,i+1,200);
//    Result := ANSIUpperCase(Copy(s1,1,1))+ANSILowerCase(Copy(s1,2,Length(s1)-1))+'-'+
//              ANSIUpperCase(Copy(s2,1,1))+ANSILowerCase(Copy(s2,2,Length(s2)-1));
  end;
end;
}
//------------------------------------------------------------------------------
function GetNameAsPol(sName:String;sPol:String):String;
var
  s,sType:String;
begin
  sType:='';
  if Length(sPol)>1 then begin // !!!
    sType:=Copy(sPol,2,1);
    sPol:=Copy(sPol,1,1);
  end;
  Result:=Trim(sName);
  s:=ANSILowerCase(Result);
  if s='�����������' then begin
    if sPol='�'  then Result:='����������' else if sPol='' then Result:=s+'(����)';
    if (sPol='�') and (sType='+') then Result:='����������';
  end else if s='�������' then begin
    if sPol='�'  then Result:='��������'; // else if sPol='' then Result:=s+'(�������)';
  end else if s='������������' then begin
    if sPol='�' then Result:='�����������' else if sPol='' then Result:=s+'(��)';
    if (sType='2') and (sPol='�') then Result:='������������';
  end else if s='��������' then begin
    if sPol='�' then Result:='���������' else if sPol='' then Result:=s+'(�)';
  end else if s='�����������' then begin
    if sPol='�' then Result:='����������' else if sPol='' then Result:=s+'(���)';
  end else if s='��������' then begin
    if sPol='�' then Result:=s+'�' else if sPol='' then Result:=s+'(�)';
  end else if s='���������' then begin
    if sPol='�' then Result:='�������������' else if sPol='' then Result:=s+'(����)';
  end else if s='����������' then begin
    if sPol='�' then Result:='���������' else if sPol='' then Result:=s+'(��)';
  end else if s='������������ ����������' then begin
    if sPol='�' then Result:='����������� ���������' else if sPol='' then Result:=s+'(��)';
  end else if s='����������' then begin
    if sPol='�' then Result:='���������' else if sPol='' then Result:=s+'(��)';
  end else if s='��' then begin
    if sPol='�' then Result:='���' else if sPol='' then Result:='��(�)';
  end else if s='���������������' then begin
    if sType='2' then begin
      if sPol='�' then Result:=s+'����' else Result:=s+'���';
    end else begin
      if sPol='�' then Result:=s+'�' else if sPol='' then Result:=s+'(�)';
    end;
  end else if s='��������' then begin
    if sPol='�' then Result:='��������' else if sPol='' then Result:=s+'(��)';
  end else if s='��������' then begin
    if sPol='�' then Result:='�������' else if sPol='' then Result:=s+'(��)';
    if (sPol='�') and (sType='+') then Result:='�������' else if sPol='' then Result:=s+'(��)';
  end else if s='����' then begin
    if sPol='�' then Result:='�����' else if sPol='' then Result:=s+'(�)';
  end else if s='��������' then begin
    if sPol='�' then Result:='���������' else if sPol='' then Result:=s+'(�)';
  end else if s='���' then begin
    if sPol='�' then Result:='��' else if sPol='' then Result:=s+'(��)';
  end else if s='����' then begin
    if sPol='�' then Result:=s+'�' else if sPol='' then Result:=s+'(�)';
  end;
end;

//------------------------------------------------------------------------------
function GetAdresat(strNamePar:String):String;
begin
  if Copy(strNamePar,1,1)='$' then begin
    Result:=getResource(Copy(strNamePar,2,Length(strNamePar)),0);
  end else begin
    if Copy(strNamePar,1,1)='&'
      then Result:=Copy(strNamePar,2,Length(strNamePar))
      else Result:=Trim(GlobalTask.ParamAsString(strNamePar));
  end;
  if (RIGHT(strNamePar,2)='_B') and (Result='')  then begin 
    Result:=GlobalTask.ParamAsString(Copy(strNamePar,1,Length(strNamePar)-2));
  end;
  if DokZAGS.Fld('ARX_ADRESAT')<>nil then begin
    if DokZAGS.Fld('ARX_ADRESAT').AsString<>''
      then Result:=DokZAGS.Fld('ARX_ADRESAT').AsString;
  end;

end;
//------------------------------------------------------------------------------
function GetAdresat2(strNamePar:String;strField:String;lObr:Boolean;sAdd:String):String;
begin
  Result:=GetAdresat(strNamePar);
  if strField<>'' then begin
    if DokZAGS.Fld(strField).AsString<>'' then begin
      if lObr  // � �������� �������
        then Result:=sAdd+DokZAGS.Fld(strField).AsString+Chr(13)+Chr(10)+Result
        else Result:=Result+Chr(13)+Chr(10)+sAdd+DokZAGS.Fld(strField).AsString;
    end;
  end;
end;

//------------------------------------------------------------------------------
function NationForSprav(sKod:String; sField:String; lAddStr:String):String;
var
  l19:Boolean;
begin
  l19:=true;
  if Copy(sField,1,1)='-' then  begin
    sField:=Copy(sField,2,Length(sField));
    l19:=false;
  end;
  if (Trim(sKod)='') or (sKod='0') then begin 
    Result:='';
  end else if sKod='190' then begin
    if l19 then  Result:='�������� � �������������� �� ������������' else Result:='';
  end else if sKod='192' then begin
    if l19 then  Result:='�������� � �������������� �����������' else Result:='';
  end else begin
    Result:=SeekValueSpr('������������������','ID',sKod,sField);
  end;
  if Result<>'' then Result:=lAddStr+Result;
end;
//------------------------------------------------------------------------------
function NationForSprav2(sKod:String; sField:String):String;
begin  Result:=NationForSprav(sKod,sField,', ');  end;

//------------------------------------------------------------------------------
function GetNameAsPolBel(sName:String;sPol:String):String;
var
  s:String;
begin
  Result:=Trim(sName);
  s:=ANSILowerCase(Result);
  if s='�����糢��' then begin
    if sPol='�'  then Result:='����������' else if sPol='' then Result:=s+'(����)';
  end else if s='��' then begin
    if sPol='�'  then Result:='����'; // else if sPol='' then Result:=s+'(�������)';
  end else if s='�� �����糢��' then begin
    if sPol='�'  then Result:='���� ����������'; // else if sPol='' then Result:=s+'(�������)';
  end else if s='�� ����' then begin
    if sPol='�'  then Result:='���� �������'; // else if sPol='' then Result:=s+'(�������)';
  end else if s='�������' then begin
    if sPol='�'  then Result:='�������' else if sPol='' then Result:=s+'(��)';
  end else if s='�����������' then begin
    if sPol='�'  then Result:='����������';
  end;
end;

//------------------------------------------------------------------------------
function NationForSprav_Bel(sKod:String; sField:String; lAddStr:String):String;
var
  l19:Boolean;
begin
  l19:=true;
  if Copy(sField,1,1)='-' then  begin
    sField:=Copy(sField,2,Length(sField));
    l19:=false;
  end;
  if (Trim(sKod)='') or (sKod='0') then begin 
    Result:='';
  end else if sKod='190' then begin
    if l19 then  Result:='������ ��� �������������� �� �����������' else Result:='';
  end else if sKod='192' then begin
    if l19 then  Result:='������ ��� �������������� �����������' else Result:='';
  end else begin
    Result:=SeekValueSpr('������������������','ID',sKod,sField);
  end;
  if Result<>'' then Result:=lAddStr+Result;
end;
function NationForSprav2_Bel(sKod:String; sField:String):String;
begin Result:=NationForSprav_Bel(sKod, sField, ', '); end;

//----------------------------------------------------------
function GetBrakRast(ds:TDataSet;s1:String;s2:string;s3:String):String;
begin
  Result:='';
  if ds.Fld('TYPE_RAST').AsInteger>0 then begin // ds.Fld('BRAK_RAST').AsBoolean then begin
    if s1='#' then begin
      Result:='���� ����� ���������� ������';
    end else begin
      if (s1<>'') and (s2<>'')
        then Result:='���� ����� '+s1+' � '+s2
        else Result:='����';
    end;
    if s3='' then s3:='�������';
    if ds.Fld('TYPE_RAST').AsInteger=2 then begin
      Result := Result + ' ���������� �� ��������� ������� ���� '+ds.Fld('SUDNAME').AsString+
               ' � ����������� ����� �� '+DatePropis(ds.Fld('SUDRESH').AsDateTime,TYPE_DATE_SPRAV)+
               ', ����������� � �������� ���� '+DatePropis(ds.Fld('SUDSILA').AsDateTime,TYPE_DATE_SPRAV);
    end else if ds.Fld('TYPE_RAST').AsInteger=4 then begin
      Result := Result + ' ������� ���������������� �� ��������� ������� ���� '+ds.Fld('SUDNAME').AsString+
               ' �� '+DatePropis(ds.Fld('SUDRESH').AsDateTime,TYPE_DATE_SPRAV)+
               ', ����������� � �������� ���� '+DatePropis(ds.Fld('SUDSILA').AsDateTime,TYPE_DATE_SPRAV);
    end else if ds.Fld('TYPE_RAST').AsInteger=3 then begin
      Result:=Result+' ���������� �� ��������� ������ ���� � ����������� ����� � '+ds.Fld('R_NOMER').AsString+', ����������� '+
         DatePropis(ds.Fld('R_DATE').AsDateTime,TYPE_DATE_SPRAV)+' � '+ds.Fld('R_ZAGS').AsString+'.';
    end else if ds.Fld('TYPE_RAST').AsInteger=1 then begin
      Result:=Result+' ��������� � ����� �� ������� '+s3+', ������ ���� � ������ � '+
         ds.Fld('S_NOMER').AsString+' ��������� '+DatePropis(ds.Fld('S_DATE').AsDateTime,TYPE_DATE_SPRAV)+
         ' � '+ds.Fld('S_ZAGS').AsString+'.';
    end;
  end;
end;
//----------------------------------------------------------
function GetBrakRast_Bel(ds:TDataSet;s1:String;s2:string;s3:String):String;
var
  fld:TField;
begin
  Result:='';
  if ds.Fld('TYPE_RAST').AsInteger>0 then begin // ds.Fld('BRAK_RAST').AsBoolean then begin
    if s1='#' then begin
      Result:='���� ���� ���������� ������';
    end else begin
      if (s1<>'') and (s2<>'')
        then Result:='���� ���� '+s1+' � '+s2
        else Result:='����';
    end;
    fld:=ds.Fld('SUDNAME_B');
    if fld=nil then  fld:=ds.Fld('SUDNAME');
    if ds.Fld('TYPE_RAST').AsInteger=2 then begin
      Result := Result + ' ��������� �� ��������: ������� ���� '+fld.AsString+
               ' �� ��������� ����� �� '+DatePropisBel(ds.Fld('SUDRESH').AsDateTime,TYPE_DATE_SPRAV)+
               ', ���� ������� � �������� ��� '+DatePropisBel(ds.Fld('SUDSILA').AsDateTime,TYPE_DATE_SPRAV);
    end else if ds.Fld('TYPE_RAST').AsInteger=4 then begin
      Result := Result + ' �������� ����������� �� �������� ������� ���� '+fld.AsString+
               ' �� '+DatePropisBel(ds.Fld('SUDRESH').AsDateTime,TYPE_DATE_SPRAV)+
               ', ���� ������� � �������� ��� '+DatePropisBel(ds.Fld('SUDSILA').AsDateTime,TYPE_DATE_SPRAV);
    end else if ds.Fld('TYPE_RAST').AsInteger=3 then begin
      fld:=ds.Fld('R_ZAGS_B');
      if fld=nil then  fld:=ds.Fld('R_ZAGS');
      Result:=Result+' ��������� �� ��������: ����� ���� �� ��������� ����� � '+ds.Fld('R_NOMER').AsString+', ������������ '+
              DatePropisBel(ds.Fld('R_DATE').AsDateTime,TYPE_DATE_SPRAV)+' � '+fld.AsString+'.';
    end else if ds.Fld('TYPE_RAST').AsInteger=1 then begin
      fld:=ds.Fld('S_ZAGS_B');
      if fld=nil then  fld:=ds.Fld('S_ZAGS');
      Result:=Result+' ������� � ����� �� ������ '+s3+', ���� ���� �� ������ � '+
         ds.Fld('S_NOMER').AsString+' ���������� '+DatePropisBel(ds.Fld('S_DATE').AsDateTime,TYPE_DATE_SPRAV)+
         ' � '+fld.AsString+'.';
    end;
  end;
end;

//------------------------------------------------------------------------------
function addWordKv(adr:TAdresLic):String;
begin
  Result:='';
end;
//------------------------------------------------------------------------------
function CheckOwners(adr:TAdresLic; var s:String; var strSobstv:String; var strNanim:String):String;
var
  slOwners:TStringList;
  n:Integer;
begin
  slOwners:=TStringList.Create;
  strSobstv:=adr.GetOwners(slOwners,1);
  Result:='�����������';
  if slOwners.Count>0 then begin
    n:=adr.OwnersType;
    if n=1 then begin        // ������������ ������ ������� ����
      if slOwners.Count>1 
        then Result:='��������������'
        else Result:='�������������';
      if s<>'' then begin
        if s='��������' then begin
          if slOwners.Count>1 then  s:='��������';
        end else if s='�����������' then begin
          if slOwners.Count>1 then  s:='����������';
        end;
      end;
    end else begin          // � ����� ������������� ���� �����������
      strSobstv:=strNanim;
    end;
  end else begin
    strSobstv:=strNanim;
  end;
  slOwners.Free;
end;

//------------------------------------------------------------------------------
function GetTypeHouse(lOwnHouse:Boolean; sTypeHouse:String; sTypeDef:String):String;
begin
  Result:='';
  if (sTypeDef='') or (IdProg()='GKH') then begin
    Result := SeekValueSpr('�����������','ID',sTypeHouse,'NAME');
  end else begin
    if lOwnHouse then begin
      Result := sTypeDef;
    end else begin
      Result := SeekValueSpr('�����������','ID',sTypeHouse,'NAME');
    end;
  end;
end;

//------------------------------------------------------------------------------
function GetPredst(sPredst:String; sTypeDef:String; strFieldName:String):String;
begin
  if sPredst='' then begin
    Result:=sTypeDef;
  end else begin
    if strFieldName='' then strFieldName:='NAME';
    Result:=SeekValueSpr('SprPredst','ID',sPredst,strFieldName);
  end;
end;

//------------------------------------------------------------------------------
// ������� ��������������� ��������� ����� ������� �������� �����
function GetOtnoshMen(nID:Integer;sOtnosh:String;m:TMens;lIdInternal:Boolean):String;
var
  nIDMen:Integer;
begin
  if lIdInternal then nIDMen:=m.Fld('ID_INTERNAL').AsInteger else m.Fld('ID').AsInteger;
  if lCheckOtnosh then begin
    Result:=GetOtnosh(nID,sOtnosh,nIDMen,m.Fld('OTNOSH').AsString,m.Fld('POL').AsString);
  end else begin
    if ( (m.Fld('OTNOSH').AsString='') or (nID=nIDMen) ) 
      then Result:=''
      else Result := SeekValueSpr('������������','ID',m.Fld('OTNOSH').AsString,'NAME');
  end;
end;

//----------------------------------------------------------
function SpecGrafToStr(m:TMens;nType:Integer;nTypeDate:Integer):String;
var
  s:String;
begin
 // ������ KEY_PRIM_SPR �� ����� KeyList.ini
//  ParamAsInteger('SSS2_TYPE')
  if (nType=2) or (nType=4) then begin
    Result:=m.getWork;
  end else if nType=3 then begin
    Result:=DatePropis(m.Fld('DATEP').AsDateTime,nTypeDate);
  end else if nType=5 then begin
    Result:=m.GetLgoti;
  end else if nType=6 then begin   // ������� + ����� ����.
    Result:=m.PasportToStr(0)+', '+m.MestoRogd(true,0);
  end else if nType=7 then begin   // �������
    Result:=m.PasportToStr(0);
  end else if nType=8 then begin   // �������+���.�����.
    Result:=m.PasportToStr(0);
    s:=Trim(m.Fld('LICH_NOMER').AsString);
    if s<>'' 
      then Result:=Result+', '+s+', ';
  end;
  if nType=4 then begin
    s := m.getDolg;
    if s<>'' then  Result:= Result+', '+s;
  end;
end;

//---------------------------------------------------------------
// ���� ����� �� ������� � ��������� unit: 
//---------------------------------------------------------------
{ !!! OLD !!!
function AddMenToSprav(m : TMens; nID : Integer) : Boolean;
begin
  if (m.Fld('ID_INTERNAL').AsInteger<>nID) and        // ���������� ������� �������
     (m.Fld('PROPIS').AsBoolean=true) and             // ���. ������ �����������
     ( (m.Fld('PRESENT').AsBoolean=true) or GlobalTask.ParamAsBoolean('SP_PRESENT') ) and
     (m.Fld('CANDELETE').AsBoolean=false) then begin 
    Result:=true;
  end else begin
    Result:=false;
  end;
end;
}
function AddMenToSprav(m : TMens; nID : Integer) : Boolean;
var
  sMens:String;
begin
  sMens:=GetBookmarkMen;      // ���������� � ����� ����
  if sMens<>'' then begin
    if (m.Fld('ID_INTERNAL').AsInteger<>nID) and        // ���������� ������� �������
       (Pos(m.Fld('ID_INTERNAL').AsString+';',sMens)> 0)
      then Result:=true
      else Result:=false;
  end else begin
    if (m.Fld('ID_INTERNAL').AsInteger<>nID) and        // ���������� ������� ������� 
       (m.Fld('PROPIS').AsBoolean=true) and             // 
       ( (m.Fld('PRESENT').AsBoolean=true) or GlobalTask.ParamAsBoolean('SP_PRESENT') ) and
       (m.Fld('CANDELETE').AsBoolean=false) then begin
      Result:=true;
    end else begin
      Result:=false;
    end;
  end;
end;
//---------------------------------------------------------------
function WritePodpis(ds:TDataset; vType:Variant):Integer;
var
  n:Integer;
begin
  // vType ID ��� KOD ������
  n:=Podpis_Init(vType);
  if n>0 then begin
    ds.Fld('DOLG_PODP1').AsString:=podpis_dolg(1);
    ds.Fld('FIO_PODP1').AsString:=podpis_fio(1);
    if n>1 then begin
      ds.Fld('DOLG_PODP2').AsString:=podpis_dolg(2);
      ds.Fld('FIO_PODP2').AsString:=podpis_fio(2);
    end;
    if n>2 then begin
      ds.Fld('DOLG_PODP3').AsString:=podpis_dolg(3);
      ds.Fld('FIO_PODP3').AsString:=podpis_fio(3);
    end;
    if podpis_shtamp()>-1 then 
      CreateWorkShtamp(podpis_shtamp());  //SHAMP_  SHAMP_GERB
  end;

  Result:=n;
end;
//---------------------------------------------------------------
// �������������� ������������ � ��������� ������� ��� ���������� ����. ����
procedure AddDolgPodpis(ds:TDataset; sAdd:String; lLast:Boolean);
var
  n:Integer;
  arr:array[1..3] of string;
  s:String;
begin
  s:='DOLG_PODP';
  if lLast then begin
    arr[1]:=s+'3'; arr[2]:=s+'2'; arr[3]:=s+'1';
  end else begin
    arr[1]:=s+'1'; arr[2]:=s+'2'; arr[3]:=s+'3';
  end;
  for n:=1 to 3 do begin
    if ds.Fld(arr[n]).AsString<>'' then begin
      ds.Fld(arr[n]).AsString:=sAdd+ds.Fld(arr[n]).AsString;
      break;
    end;
  end;
end;

//-------------------------------------------------------
function GetSrokDv(nType:Integer):String;    // 
begin
  Result:=ParamAsString('SROKDV');
  if Result='' then Result:='����� �������';
end;
//-------------------------------------------------------
// ���� �������� �������   
function GetSrokDvEx(nType:Integer):String;
begin
  if nType=1 then begin
    Result:=ParamAsString('SROKDV_BEL');  //  ������ ����
    if Result='' then Result:='����� ������';
  end else begin
    Result:=ParamAsString('SROKDV');
    if Result='' then Result:='����� �������';
  end;
end;              
//------------------------------
procedure SetSrokDv(ds:TDataSet;nType:Integer);
begin  if ds.Fld('SROKDV')<>nil then ds.Fld('SROKDV').AsString:=GetSrokDvEx(nType);  end;
//------------------------------
procedure CreateTitle(ds:TDataSet; nType:Integer; nPril:Integer; lName:Boolean);
begin
  ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',nPril);
  ds.Fld('SHTAMP').AsString := GetShtampSprEx(nType);
  ds.Fld('KOLON_N').AsString:=CreateKolonN(nType);
  SetSrokDv(ds,nType); // !!!
  if lName then begin
    if GlobalTask.ParamAsString('ARXIV')='1' then begin
      ds.Fld('NAME_SPR').AsString :=getResource('ARX1',nType)+'   ';  // ��������  strRes.ini
      ds.Fld('NAME_ORG').AsString :='';
    end else begin
      ds.Fld('NAME_SPR').AsString :='';
      ds.Fld('NAME_ORG').AsString :=getResource('ARX2',nType)+' '; // ������
    end;
  end;
end;

//-------------------------------------------------------
function RoundBYR( e : Extended ) : Extended;
var
  s,s1    : String;
  lSeek5  : Boolean;
  j : Integer;
begin
  lSeek5 := false;
  s := FloatToStr(e);
  j := Pos('.',s);
  if j > 0 then begin
    s1 := Copy(s,j+1,100);
    if StrToFloat(s1) = 0 then begin
      s := Copy(s,1,j-1);
      lSeek5 := true;
    end;
  end else begin
    lSeek5 := true;
  end;
  if lSeek5 then begin
    s1 := Copy(s,Length(s),1);
    if s1='5' then begin  // ����� ����� �������������� �� 5
      Result := StrToFloat(Copy(s,1,Length(s)-1)+'0');
    end else begin
      Result := xRound(e,-1);
    end;
  end else begin
    Result := xRound(e,-1);
  end;
end;
//--------------------------------------------------------------
procedure PrintShtamp1(sl : TStringList; strAddText : String);
var
   tb : TDataSet;
   pr : TPrintTable;
begin
  tb := dbCreateMemTable('S1,Memo;S2,Memo;','');
  tb.Open;
  tb.Append;
  tb.Fld('S1').AsString := StringReplace(GetShtampSpr(),Chr(13)+Chr(10),'\par ');
  tb.Fld('S2').AsString := strAddText;;
  tb.Post;
  pr := CreatePrintTable(sl,tb);
  pr.SetPrintHead(false);
  pr.SetHeadWidth(0,'', 320);
  pr.SetHeadWidth(1,'', 300);
  pr.SetTableFont(0,12);
  pr.SetColFont(1,0,10);
//      pr.SetBorder(-1, 'ltrb');
  pr.SetAlign(0, 't', 'l');
  pr.SetAlign(1, 't', 'r');
  pr.Print;
  FreePrintTable(pr);
  tb.Free;
end;

function OborudDoma : String;
begin
  result := '��.����������, ';
  if LicSchet.Fld('VODOPROV').AsBoolean  then result:=result+'������������, ';
  if LicSchet.Fld('KANALIZ').AsBoolean   then result:=result+'������������, ';
  if LicSchet.Fld('CENT_OTOP').AsBoolean then result:=result+'�����. ����������, ';
  if LicSchet.Fld('GOR_VODA').AsBoolean  then result:=result+'������� ��������������, ';
  if LicSchet.Fld('GAZ').AsBoolean       then result:=result+'����� (�������), ';
  if LicSchet.Fld('EL_PLIT').AsBoolean   then result:=result+'��������� ������������, ';
  result := Trim(result);
  result := Copy(result,1,Length(result)-1);
end;
function OborudDomaAdr(adr:TAdresLic) : String;
begin
  result := '��.����������, ';
  if adr.Fld('VODOPROV').AsBoolean  then result:=result+'������������, ';
  if adr.Fld('KANALIZ').AsBoolean   then result:=result+'������������, ';
  if adr.Fld('CENT_OTOP').AsBoolean then result:=result+'�����. ����������, ';
  if adr.Fld('GOR_VODA').AsBoolean  then result:=result+'������� ��������������, ';
  if adr.Fld('GAZ').AsBoolean       then result:=result+'����� (�������), ';
  if adr.Fld('EL_PLIT').AsBoolean   then result:=result+'��������� ������������, ';
  result := Trim(result);
  result := Copy(result,1,Length(result)-1);
end;

//------------------------------------------------
function getStrPropis2(lOtsut:Boolean;lTmpPr:Boolean) : String;
begin
//  lOtsut �������� �������� �����.
//  lTmpPr �������� ����������� ��� �����������
  if lOtsut and lTmpPr then begin                // �������� ���� ������� ����� �� ����������
    Result:='';   
  end else if lOtsut and not lTmpPr then begin   // ��� �����������
    Result:='n.propis=true';
  end else if not lOtsut and lTmpPr then begin   // ��� ��������������
    Result:='n.present=true';
  end else if not lOtsut and not lTmpPr then begin  // ������ ����������� � ��������������
    Result:='n.propis=true and n.present=true';
  end;
  if Result='' then Result:='n.candelete=false'
               else Result:='(n.candelete=false and '+Result+')';  // �������� ������� � �������� ���������
//  writedebug('--->'+result);
end;
//-----------------------------------
function getStrPropis : String;
begin
  Result:=getStrPropis2(GlobalTask.ParamAsBoolean('OTSUT_VIBOR'),GlobalTask.ParamAsBoolean('TMPPR_VIBOR'));
end;
//----------------------------------------------------------------
// ����������� �� �����    �������
function PriglashPriem(DateFiks: TDateTime; LicID, PID: Word):Boolean;
var
  f : TfmParamQuest;
  n,i,nCount:Integer;
  d:TDateTime;
  tb,q:TDataSet;
  PAR1,s,sName,sNameOtd,sKuda,sVopros:String;
  lFilter:Boolean;
begin
//  dsOch:=dbGetDataSet('dmBase.tbOchered');
//  dsOchResh:=dbGetDataSet('dmBase.tbOcheredResh');
  PAR1:=GetTemplateParam('PAR1');
  result:=false;

  f := TfmParamQuest.Create(nil);
  f.Caption := '������� ���������';
  s:=Trim(GlobalTask.GetLastValueAsString('OCH_PRIG_NAME'));
  f.AddParamEx(s, '�������� �����������' , 'NAME','TYPE=STRING~WIDTH=500');  //1
  f.AddParamEx(Now, '���� ������������' , 'DATEP' ,'TYPE=DATE');             //2
  n:=GlobalTask.GetLastValueAsInteger('OCH_PRIG_NOMER');
  f.AddParamEx(n+1, '�����' , 'NOMER', 'TYPE=NUMERIC');                      //3
  s:=Trim(GlobalTask.GetLastValueAsString('OCH_PRIG_OTD'));                  
  f.AddParamEx(s, '�����' , 'NAME_OTD','TYPE=STRING~WIDTH=500');             //4
  s:=Trim(GlobalTask.GetLastValueAsString('OCH_PRIG_KUDA'));                 
  f.AddParamEx(s, '�����, ����, �����' , 'KUDA','TYPE=STRING~WIDTH=500');    //5
  s:=Trim(GlobalTask.GetLastValueAsString('OCH_PRIG_VOPROS'));               
  f.AddParamEx(s, '������' , 'VOPROS','TYPE=STRING~WIDTH=500');              //6
  if PAR1='1'
    then f.AddParamEx(3, '���������� �� �������� (1-5)' , 'MAX','MIN=1~MAX=5~WIDTH=50');

  f.AddButtons('���������~�����',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    sName:=f.GetValue('NAME','S');
    d  := f.GetValue('DATEP','D');
    n  := f.GetValue('NOMER','I');
    sNameOtd:=f.GetValue('NAME_OTD','S');
    sKuda:=f.GetValue('KUDA','S');
    sVopros:=f.GetValue('VOPROS','S');
    if PAR1='1' then nCount:=f.GetValue('MAX','N')  else nCount:=1;

    GlobalTask.SetLastValueAsString('OCH_PRIG_NAME',sName);
    GlobalTask.SetLastValueAsInteger('OCH_PRIG_NOMER',n);
    GlobalTask.SetLastValueAsString('OCH_PRIG_OTD',sNameOtd);
    GlobalTask.SetLastValueAsString('OCH_PRIG_KUDA',sKuda);
    GlobalTask.SetLastValueAsString('OCH_PRIG_VOPROS',sVopros);
    f.Free;
    tb:=GetTemplateDataSet('TABLSOST');
    i:=1;
 //'TABLSOST=SHTAMP,FIOP,MESTOJ,DATEP,NOMER,NAME,NAME_OTD,KUDA,VOPROS'
    if PAR1='2' then begin
      tb.Append;
      tb.Fld('SHTAMP').AsString:=GetShtampSpr();
      tb.Fld('FIOP').AsString:=Men.FIO;
      tb.Fld('MESTOJ').AsString:=Men.Adres.GetAdres2(false,false,''); //Men.Adres.GetAdres()+', '+Raion_Name('')+', '+Obl_Name('') ;                                           
//      tb.Fld('MESTOJ').AsString:=dmBase.AdresMen(q.Fld('id').AsString,'');
      tb.Fld('DATEP').AsString:=DatePropis(d,3);
      tb.Fld('NOMER').AsString:='  '+IntToStr(n)+'  ';
      tb.Fld('NAME').AsString:=sName;
      tb.Fld('NAME_OTD').AsString:=sNameOtd;
      tb.Fld('KUDA').AsString:=sKuda;
      tb.Fld('VOPROS').AsString:=sVopros;
      WritePodpis(tb,'PriglashPriem');
      result:=true;
    end else begin
      q:=dbGetDataSet('fmGurnOchered.Query');
      q.First;
      lFilter:=BookmarkCurGurnalToFilter('ID');   // !!! ������������� ������ �� ���������� �������
      OpenMessage(' ������������  ... ','',10);

      while not q.Eof do begin
        tb.Append;
        tb.Fld('SHTAMP').AsString:=GetShtampSpr();
        tb.Fld('FIOP').AsString:=CreateFIO(q);
        tb.Fld('MESTOJ').AsString:=dmBase.AdresMen(q.Fld('id').AsString,'');
        tb.Fld('DATEP').AsString:=DatePropis(d,3);
        tb.Fld('NOMER').AsString:='  '+IntToStr(n)+'  ';
        tb.Fld('NAME').AsString:=sName;
        tb.Fld('NAME_OTD').AsString:=sNameOtd;
        tb.Fld('KUDA').AsString:=sKuda;
        tb.Fld('VOPROS').AsString:=sVopros;
        WritePodpis(tb,'PriglashPriem');

  //      tb.Fld('DOLG_PODP1').AsString:=Ochered_Dolg;
  //      tb.Fld('FIO_PODP1').AsString:=Ochered_FIO;
        n:=n+1;
        if i=nCount then begin
          tb.Fld('PPP').AsString:='\page';
          i:=1;
        end else begin 
          tb.Fld('PPP').AsString:='';
          i:=i+1;
        end;
        tb.Post;
        q.Next;
      end;
      CloseMessage;
      if lFilter then begin 
        q.Filter:='';
        q.Filtered:=false;
      end;
      q.First;
    end;
    if dbRecordCount(tb)>0 then  Result:=true;
  end else begin
    f.Free;
  end;
end;
//----------------------------------------------------------------
// ����������� �� ������
function PriglashVibor(DateFiks: TDateTime; LicID, PID: Word):Boolean;
var
  f : TfmParamQuest;
  s,sRusGr,sSort,strDate,ss,sAdr,sAdr2,strSQL,strNameUch:String;
  sNameV,sTimeV,sAdresV,sDosr,sFIO:String;
  n,nUch,ns,nIDUch,i:Integer;
  nYear,nMonth,nDay,nCount : Word;
  d,d1:TDateTime;
  SprUch,tb,q:TDataSet;
  lCheckAddAdres,lAdres,lAdresFromLic,lFIO:Boolean;
//FIO,DATEV,NAMEV,FIO,TIMEV,ADRES,DOSR
begin
  Result:=false;
  lAdresFromLic:=false;         //     !!!
  // �������� ������� ������ � ������
  if GlobalTask.ParamAsBoolean('RUSGR_VIBOR') then begin
    sRusGr:='n.citizen=643 or';
  end else begin
    sRusGr:='';
  end;
  SprUch := dbGetDataSet('dmBase.SprIzbUch') ;
  SprUch.First;
  if not SprUch.Eof then begin
    n := SprUch.Fld('NOMER').AsInteger;
  end else begin
    PutError(' ��������� ���������� ������������� �������� ! ');
    exit;
  end;
  f := TfmParamQuest.Create(nil);
  f.Caption := '������� ���������';
//  f.StepY:=17;
//  f.Flat:=false;
  s:=GlobalTask.GetLastValueAsString('FIO_VIBOR');
  if (s='') or (s='1') then lFIO:=true else lFIO:=false;
  f.AddParamEx(GlobalTask.ParamAsDate('DATE_VIBOR'), '���� �������' , 'DATEVZ' ,'TYPE=DATE');
  f.AddParamEx(n      , '������������� �������' , 'IZBUCH','WIDTH=50');
  s:=Trim(GlobalTask.GetLastValueAsString('NAME_VIBOR'));
  if s='' then s:='������ �������� �������� ������';
  f.AddParamEx(s, '�������� �������' , 'NAMEV','TYPE=STRING~WIDTH=500');
  s:=Trim(GlobalTask.GetLastValueAsString('TIME_VIBOR'));
  if s='' then s:='� 8 �� 20 ����i�';
  f.AddParamEx(s, '����� �������' , 'TIME_VIBOR','TYPE=STRING~WIDTH=500');
//  f.AddParamEx(1, '������' , 'FORMAT','TYPE=LIST~DESC=KEY_FORMAT_SPIS~WIDTH=100');
//  f.AddParamEx(false, '��� � ���� �����' , 'FIO_ONE','');
  f.AddParamEx(GlobalTask.GetLastValueAsString('ADRES_UCH_VIBOR'), '������ �������' , 'ADRESV','TYPE=STRING~WIDTH=500');
  s:=Trim(GlobalTask.GetLastValueAsString('DOSR_VIBOR'));
  if s='' then s:='������i���� � 18 �� 22 �����i�� �������� ���� ������� � 10 �� 14 ����i� i � 16 �� 19 ����i� � ���������i ���������� �������� ���i�ii';
  f.AddParamEx(s, '����� ��������� �������' , 'TIME_DOSR','TYPE=STRING~WIDTH=500');
  f.AddParamEx(1, '��� ����������' , 'SORT','TYPE=LIST~DESC=KEY_SORTIZB~WIDTH=300');
  f.AddParamEx(3, '���������� �� �������� (1-3)' , 'MAX','MIN=1~MAX=3~WIDTH=50');
  f.AddParamEx(lFIO, '�������� ��� ' , 'FIO','');
  f.AddParamEx(false, '�������� ����� ����������' , 'ADRES','');
  f.AddParamEx(true, '��������� ����� ���. ��� �������' , 'ADRESG','');
  f.AddParamEx('', '����� �������' , 'TAIL','WIDTH=50');

  f.AddButtons('���������~�����',0);
  n  := f.ShowQuest;
  try
  if n = 1 then begin
    lFIO:=f.GetValue('FIO','L');
    lAdres:=f.GetValue('ADRES','L');
    lCheckAddAdres:=f.GetValue('ADRESG','L');
    lAdresFromLic:=false;         //     !!!
    ns := f.GetValue('SORT','I');
    d  := f.GetValue('DATEVZ','D');
    sNameV:=f.GetValue('NAMEV','S');
    sTimeV:=f.GetValue('TIME_VIBOR','S');
    sAdresV:=f.GetValue('ADRESV','S');
    sDosr:=f.GetValue('TIME_DOSR','S');
    nCount:=f.GetValue('MAX','N');
    sFIO:=Trim(f.GetValue('TAIL','S'));
    if sFIO<>'' then sFIO:=' and familia like '+QStr(sFIO+'%');
    GlobalTask.SetLastValueAsDate('DATE_VIBOR', d);
    GlobalTask.SetLastValueAsString('NAME_VIBOR',sNameV);
    GlobalTask.SetLastValueAsString('TIME_VIBOR',sTimeV);
    GlobalTask.SetLastValueAsString('ADRES_UCH_VIBOR',sAdresV);
    GlobalTask.SetLastValueAsString('DOSR_VIBOR',sDosr);
    GlobalTask.SetLastValueAsBoolean('FIO_VIBOR',lFIO);
    if Length(sNameV)<45 then sNameV:=sNameV+chr(13);
    DecodeDate(d,nYear,nMonth,nDay);
    nYear := nYear-18;
    nUch := f.GetValue('IZBUCH','N');
    f.Free;
    d1 := EncodeDate(nYear,nMonth,nDay);
    strDate := DateToSQL(d);
    if not dbLocate(SprUch,'NOMER',[nUch],'') then begin
      PutError(' �� ������ ������������� ������� !');
    end else begin
      if ParamAsInteger('CH_ADRES')=0 
        then sSort:='d.punkt'
        else sSort:='s.nomer';
      //---- ��������� ����������� ��� ��� ���. ������ �� ������ -----
//      q:=dbOpenSQL('SELECT count(*) as nnn FROM ������������� WHERE nomer is null','');
//      if q.Fld('nnn').AsInteger=0 then sSort:='s.nomer' else sSort:='d.punkt';
//      dbClose(q);
      //---------------------------------------------------------------
      if lAdresFromLic  then begin  // !!!
        sAdr:=' LEFT JOIN ��������� d ON d.date_fiks=l.date_fiks and d.id=l.adres_id ';
        sAdr2:='l.adres_id';
      end else begin
        sAdr:=' LEFT JOIN ��������� d ON d.date_fiks=n.date_fiks and d.id=n.adres_id ';
        sAdr2:='n.adres_id';
      end;
      strNameUch := SprUch.Fld('NAME').AsString;
      nIDUch := SprUch.Fld('ID').AsInteger;
      s := SprUch.Fld('PUNKTS').AsString;
      ss:= GetFieldWhere(s,'id');
//      s := GetFieldWhere2(s,'d.Punkt',SprUch.Fld('UL').AsString,'d.ul');
      s := GetWherePunktUlDom(nIDUch,s,'d.Punkt',SprUch.Fld('UL').AsString,'d.ul',dbGetDataSet('dmBase.SprIzbUch2'), false);
//      s := GetFieldWhere(s,'d.Punkt');
      strSQL := 'SELECT s.nomer, familia, n.name name1, otch, dater, lic_id, d.punkt, '+sAdr2+', n.adres_id_git, 1 ppp, u.name, d.dom, d.dom1, d.dom2, d.korp, d.kv '+
        ' FROM ��������� n '+
        ' LEFT JOIN ������������ l ON l.date_fiks=n.date_fiks and l.id=n.lic_id '+
        sAdr+   // LEFT JOIN ���������
        ' LEFT JOIN ������������� s ON d.punkt=s.id '+
        ' LEFT JOIN ������� u ON u.id=d.ul '+
        ' WHERE n.date_fiks='+QStr('1899-12-30')+' and ( '+sRusGr+' n.citizen=112 or n.citizen is null ) and '+
        ' (n.notselect is null or n.notselect=false) and (n.adres_id is not null and n.adres_id>0) and '+
        getStrPropis+sFIO+' and '+
        ' (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+')>18 '+
        ' or (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+'))=18 and '+
        ' dater<='+DateToSQL(d1)+' ) and ('+ s + ') ';
//      if ns<>4 then begin
//        strSQL:=strSQL+'   union all '+
//        ' SELECT nomer, '+QStr(' ')+', name as name1, '+QStr(' ')+', CURDATE( ), 0, id as punkt, 0, 0, 0, 0, '+QStr('')+','+QStr('')+','+QStr('')+','+QStr('')+','+QStr('')+
//        ' FROM ������������� WHERE '+ss+' ';
//      end;
      if ns=1 then begin
        strSQL := strSQL+' ORDER BY '+sSort+',familia,name1';
      end else if ns=2 then begin
        strSQL := strSQL+' ORDER BY '+sSort+',ppp,u.name,d.dom1,d.dom2,d.korp,d.kv';
      end else if ns=3 then begin
        strSQL := strSQL+' ORDER BY '+sSort+',ppp,u.name,familia';
      end else begin
        strSQL := strSQL+' ORDER BY familia,name1';
      end;
//      writedebug(strSQL);
      OpenMessage(' ������������  ... ','',10);
//      writedebug(strSQL);
      q:=dbOpenSQL(strSQL,'');
      tb:=GetTemplateDataSet('TABLSOST');
      i:=1;
      while not q.Eof do begin
        tb.Append;
        if lFIO then begin
          if PolFrom(q.Fld('Name1').AsString,q.Fld('Otch').AsString)='�'
            then tb.Fld('POL').AsString:='��������' else tb.Fld('POL').AsString:='���������';
          tb.Fld('FIO').AsString:=FirstUpper(q.Fld('Familia').AsString)+' '+FirstUpper(q.Fld('Name1').AsString)+' '+FirstUpper(q.Fld('Otch').AsString);
          if lAdres then begin
            if lCheckAddAdres and (q.Fld('adres_id_git').AsString<>'') then begin
              s:=dmBase.AdresFromID(EncodeDate(1899,12,30),q.Fld('adres_id_git').AsString,false);
            end else begin
              s:=dmBase.AdresFromID(EncodeDate(1899,12,30),q.Fld('adres_id').AsString,false);
            end;
            if s<>'' then tb.Fld('ADRES').AsString:=s;
          end;
        end else begin
          tb.Fld('POL').AsString:='';
          tb.Fld('FIO').AsString:='�������� ��������� (���������i)!';
        end;
        tb.Fld('DATEV').AsString:=DatePropisBel(d,5)
        tb.Fld('NAMEV').AsString:=sNameV;
        tb.Fld('TIMEV').AsString:=sTimeV;
        tb.Fld('UCH').AsString:=IntToStr(nUch);
        tb.Fld('ADRESV').AsString:=sAdresV
        tb.Fld('DOSR').AsString:=sDosr; 
        if i=nCount then begin
          tb.Fld('PPP').AsString:='\page';
          i:=1;
        end else begin 
          tb.Fld('PPP').AsString:='';
          i:=i+1;
        end;
        tb.Post;
        q.Next;
      end;
      dbClose(q);
      CloseMessage;
      if dbRecordCount(tb)>0 then  Result:=true;
    end;
  end;
  finally

  end;
end;

//------- ������ ���������� ����������� � ����������� "������������� �������" --------------
procedure SetDateVibor;
var
  d : TDateTime;
  f : TfmParamQuest;
  n : Integer;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := '���� �������';
  f.AddParamEx(GlobalTask.ParamAsDate('DATE_VIBOR'), ' ' , 'DATEVZ' ,'TYPE=DATE');
  f.AddButtons('���������~�����',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    d:=f.GetValue('DATEVZ','D');
    GlobalTask.WriteParamAsDate('DATE_VIBOR',d);
  end;
  f.Free;
end;
//---------------------------
procedure KolvoIzbirat;
var
  nIDUch  : Integer;
  d,d1 : TDateTime;
  s,strDate,strSQL,strErr,ss,sRusGr : String;
  nYear,nMonth,nDay : Word;
  SprUch,q : TDataSet;
  lFull:Boolean;
begin
  SprUch := dbGetDataSet('dmBase.SprIzbUch') ;
  SprUch.CheckBrowseMode;

  d:=GlobalTask.ParamAsDate('DATE_VIBOR');
  DecodeDate(d,nYear,nMonth,nDay);
  nYear := nYear-18;
  d1 := EncodeDate(nYear,nMonth,nDay);
  strDate := DateToSQL(d);

  // �������� ������� ������ � ������
  if GlobalTask.ParamAsBoolean('RUSGR_VIBOR') then begin
    sRusGr:='n.citizen=643 or';
  end else begin
    sRusGr:='';
  end;

  nIDUch := SprUch.Fld('ID').AsInteger;
  s := SprUch.Fld('PUNKTS').AsString;
  ss:= GetFieldWhere(s,'id');
  if ss='' then begin
    lFull:=true;
    s:='';
  end else begin
    lFull:=false;
    s := GetWherePunktUlDom(nIDUch,s,'d.Punkt',SprUch.Fld('UL').AsString,'d.ul',dbGetDataSet('dmBase.SprIzbUch2'), false);
    s := ' and ( '+s+' ) ';
  end;
  strSQL := 'SELECT Count(*) KOLVO '+
        ' FROM ��������� n '+
        ' LEFT JOIN ������������ l ON l.date_fiks=n.date_fiks and l.id=n.lic_id '+
        ' LEFT JOIN ��������� d ON d.date_fiks=n.date_fiks and d.id=n.adres_id '+
        ' WHERE n.date_fiks='+QStr('1899-12-30')+' and ('+sRusGr+' n.citizen=112 or n.citizen is null ) and '+
        ' (n.notselect is null or n.notselect=false) and (n.adres_id is not null and n.adres_id>0) and '+
        getStrPropis+' and '+
        ' (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+')>18 '+
        ' or (TIMESTAMPDIFF(SQL_TSI_YEAR,n.DATER,'+strDate+'))=18 and '+
        ' dater<='+DateToSQL(d1)+') '+s;
//  writedebug(getStrPropis);
//  writedebug(strSQL);
//  showmessage(strsql);
  OpenMessage(' ������ ���������� ����������� ... ','',10);
  q:=dbOpenSQL(strSQL,'');
  try
    SprUch.Edit;
    SprUch.Fld('KOLVO').AsInteger:=q.FieldByName('KOLVO').AsInteger;
    SprUch.Post;
  finally
    dbClose(q);
    CloseMessage;
  end;
end;

//-------------------------------------------------------------------------------------------
function ErrorMensCount : Boolean;
begin
  Result := false;
  if LicSchet.Mens.Count=0 then begin
    PutError('��� �� ������ �������� �� ������� ����� !')
    Result := true;
  end;
end;

//------------------------ sprWord
// �������� ������� � ��������  (�1, �2, ��� ���������� �� ���� �� �����)
function SPR_ARXIV_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   s,par1 : String;      
   fldAdr:TField;
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     nType:=0; // !!!
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',5);
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     SetSrokDv(ds,0); 
     if GlobalTask.ParamAsString('ARXIV')='1' then begin
       ds.Fld('NAME_SPR').AsString :='��������    ';
       ds.Fld('NAME_ORG').AsString :='';
     end else begin
       ds.Fld('NAME_SPR').AsString :='';
       ds.Fld('NAME_ORG').AsString :='������ ';
     end;
     ds.Fld('KOLON_N').AsString:=CreateKolonN(0);
//     ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Fld('NAME').AsString :=GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('FIOP').AsString :=GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString:=GetNameAsPol('�����������',DokZAGS.Fld('POL').AsString+'+')+' '+DatePropis(DokZAGS.Fld('DATER').AsDateTime,TYPE_DATE_SPRAV);
     PAR1:=GetTemplateParam('PAR1');
     //------ !!! -----------
     fldAdr:=DokZAGS.Fld('ADRESAT'); 
     if fldAdr=nil then begin      // ���� ������� �� ����
       ds.Fld('ARX_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
       ds.Fld('DATEZ').AsString     := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('NOMER').AsString     := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
       if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
         if (DokZAGS.Fld('SVED').AsString='1') then begin
           ds.Fld('FIO_adr').AsString := '' ;
           ds.Fld('FIO_adr2').AsString := '' ;
         end else begin
           ds.Fld('FIO_adr').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_FAMILIA').AsString,DokZAGS.Fld('ONA_NAME').AsString,DokZAGS.Fld('ONA_OTCH').AsString,'�','�');
           ds.Fld('FIO_adr2').AsString := DokZAGS.GetAdres2(';;ONA_RAION;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',3);
         end;
       end else begin
         ds.Fld('FIO_adr').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
         ds.Fld('FIO_adr2').AsString := '' ;
       end;
     end else begin                // ���� ��������� ������� �� �� ����
       ds.Fld('ARX_DATE').AsString  := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString     := DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('NOMER').AsString     := DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('FIO_adr').AsString   := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
       ds.Fld('ORGAN_ZAGS').AsString:= DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     //----------------------
     // NameZAGS('��','�')      1-����������,�������   2-�����   

     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres2('GOSUD,FNAME;+OBL,B_OBL;RAION;GOROD,B_GOROD;',3);     
     ds.Fld('MESTOR1').AsString := '';     
//     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('GOSUD,FNAME;OBL,;;;',1);     
//     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;RAION;GOROD,B_GOROD;',1);
     ds.Fld('FIO_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');     
     ds.Fld('FIO_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_FAMILIA').AsString,DokZAGS.Fld('ONA_NAME').AsString,DokZAGS.Fld('ONA_OTCH').AsString,'�','�');
     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('ON_NATION').AsString,'NAME_M',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('ONA_NATION').AsString,'NAME_G',', ');
     if fldAdr=nil then begin   // �� ����
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     end;
//     if (DokZAGS.Fld('SVED').AsString<>'3') and (PAR1<>'1') then begin // �� ��������� ��������� ������
     if not IsZvMat_(DokZAGS) and (PAR1<>'1') then begin // �� ��������� ��������� ������
       PutError(' ������� �������� ��� ����������� ������� �� ��������� ������ (��� ����) !');
       result:=false;
     end;
     s:=Trim(DokZags.Fld('IZMEN').AsString);
     if s='' then s:=getResource('SPR_ROGD_IZM',nType) else if Right(s,1)<>'.' then s:=s+'.';
     if DokZAGS.Fld('ON_DATE_LR')<>nil then begin // !!!
       if not DokZAGS.Fld('ON_DATE_LR').IsNull 
         then s:=s+CRLF+getResource('SPR_ON_LR',nType)+' '+DatePropis(DokZAGS.Fld('ON_DATE_LR').AsDateTime,TYPE_DATE_SPRAV);
       if not DokZAGS.Fld('ON_SUDD_LR').IsNull
         then s:=s+' �������� ���� '+DokZAGS.Fld('ON_SUD_LR').AsString+' �� '+DatePropis(DokZAGS.Fld('ON_SUDD_LR').AsDateTime,TYPE_DATE_SPRAV);
       if not DokZAGS.Fld('ONA_DATE_LR').IsNull 
         then s:=s+CRLF+getResource('SPR_ONA_LR',nType)+' '+DatePropis(DokZAGS.Fld('ONA_DATE_LR').AsDateTime,TYPE_DATE_SPRAV);
       if not DokZAGS.Fld('ONA_SUDD_LR').IsNull
         then s:=s+' �������� ���� '+DokZAGS.Fld('ONA_SUD_LR').AsString+' �� '+DatePropis(DokZAGS.Fld('ONA_SUDD_LR').AsDateTime,TYPE_DATE_SPRAV);
     end;
     if PAR1='1' then begin
       ds.Fld('ADD_TEXT').AsString:=s;
     end else if PAR1='2' then begin                                               
       ds.Fld('ADD_TEXT').AsString:=getResource('SPR_ROGD1',nType);
       ds.Fld('ADD_TEXT2').AsString:=chr(13)+s;
     end else if PAR1='3' then begin
       ds.Fld('ADD_TEXT').AsString:=getResource('SPR_ROGD1',nType);
       if (fldAdr=nil) or (DokZAGS.Fld('IZMEN').AsString='') then begin      // ���� ������� �� ���� ��� ��������� �����
         ds.Fld('ADD_TEXT2').AsString:=chr(13)+getResource('SPR_ROGD2',nType);
       end else begin
         ds.Fld('ADD_TEXT2').AsString:=chr(13)+s;
       end;
       ds.Fld('ADD_TEXT3').AsString:=chr(13)+getResource('SPR_FOR_OCH',nType);
     end;
     ds.Post;
   end;
end;
//---------------------------- sprWord
// ������� � �������� (�1, �2, ��� ���������� �� ���� �� �����) � �1 � ��������������� �/� � ��������
function SPR_ROGD_POS(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=0;  // !!!
     ds.Edit;
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',1);
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     SetSrokDv(ds,0);
     if DokZAGS.Fld('POL').AsString='�' then begin
      ds.Fld('ROD').AsString := '�������' ;
     end else begin
      ds.Fld('ROD').AsString := '��������' ;
     end;
// ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�'); 
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     if (YearOf(NOW)>2015) and (DokZAGS.Fld('IDENTIF').AsString<>'') then begin
       ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+', '+getResource('IN',nType)+': '+DokZAGS.Fld('IDENTIF').AsString+',';
     end;
     if DokZAGS.Fld('ONLYGOD').AsBoolean
       then ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,7)+'�.'
       else ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);

     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('SPRAV_DATE').AsString:=DatePropis(Now,TYPE_DATE_SPRAV);
     if DokZAGS.Fld('VOSSTAN').AsBoolean then begin
       ds.Fld('SPRAV_NOMER').AsString:='';
     end else begin
//       ds.Fld('SPRAV_DATE').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('SPRAV_NOMER').AsString:=DokZAGS.Fld('SPRAV_NOMER').AsString;
     end;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres2('GOSUD,FNAME;+OBL,B_OBL;RAION;GOROD,B_GOROD;',3);     
     ds.Fld('FIO_ON').AsString := GetPadegFIO(_FIO(DokZAGS,'ON_'),'�','�');//.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'�','�'); //DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     
//     if (DokZAGS.Fld('SVED').AsString<>'3') and (GetTemplateParam('PAR1')<>'1') then begin // �� ��������� ��������� ������
     if not IsZvMat_(DokZAGS) and (GetTemplateParam('PAR1')<>'1') then begin // �� ��������� ��������� ������
       PutError(' ������� �������� ��� ����������� ������� �� ��������� ������ (��� ����) !');
       result:=false;
     end;

     if GetTemplateParam('PAR1')='1' then begin
//       ds.Fld('ADD_TEXT').AsString := '������� ������������� � ������� ����� �������.';
       ds.Fld('ADD_TEXT5').AsString := '��� �������������� �� ����� ���������� ��� ��������� �������';
     end;
     if GetTemplateParam('PAR1')='2' then begin
       ds.Fld('ADD_TEXT').AsString := '������ �� ���� � ������ ���� � �������� ������� ����������� �� ��������� ��������� ������, ��'+chr(160)+'��������� � �����, � ������������ �� ������� 55 ������� ���������� �������� � ����� � �����.';
//       ds.Fld('ADD_TEXT2').AsString := chr(13)+'������� ������������� � ������� ����� �������.';
       ds.Fld('ADD_TEXT5').AsString := '��� �������������� �� ����� ���������� ��� ��������� �������';
     end;
     if GetTemplateParam('PAR1')='3' then begin
       ds.Fld('ADD_TEXT').AsString := '������ �� ���� � ������ ���� � �������� ������� ����������� �� ��������� ��������� ������, ��'+chr(160)+'��������� � �����, � ������������ �� ������� 55 ������� ���������� �������� � ����� � �����.';
       ds.Fld('ADD_TEXT2').AsString := chr(13)+'� ������ ���� � �������� ��������� � ����� � ������������� ��������� ��'+chr(160)+'���������.';
       ds.Fld('ADD_TEXT3').AsString := chr(13)+'������� ������ ��� ���������� �� ���� �������, ����������� � ��������� �������� �������.';
//       ds.Fld('ADD_TEXT4').AsString := chr(13)+'������� ������������� � ������� ����� �������.';
       ds.Fld('ADD_TEXT5').AsString := '��� �������������� �� ����� ����������';
     end;
     if DokZAGS.Fld('ARX_ADRESAT').AsString<>''
       then ds.Fld('ADD_TEXT5').AsString:=DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Post;
   end;
end;
// ������� � �������� ���������������� � �������� �� ������ ������ �����
function SPR_ROGD_UM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=0;  // ������� ����
     ds.Edit;
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',4);
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     SetSrokDv(ds,0); 
     if DokZAGS.Fld('POL').AsString='�' then begin
      ds.Fld('ROD').AsString := '�����������' ;
     end else begin
      ds.Fld('ROD').AsString := '����������' ;
     end;
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('SPRAV_DATE').AsString:=DatePropis(Now,TYPE_DATE_SPRAV);
     if DokZAGS.Fld('VOSSTAN').AsBoolean then begin
       ds.Fld('SPRAV_NOMER').AsString:='';
     end else begin
//       ds.Fld('SPRAV_DATE').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('SPRAV_NOMER').AsString:=DokZAGS.Fld('SPRAV_NOMER').AsString;
     end;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres2('GOSUD,FNAME;+OBL,B_OBL;RAION;GOROD,B_GOROD;',3);     

     ds.Fld('FIO_ON').AsString := GetPadegFIO(_FIO(DokZAGS,'ON_'),'�','�');//.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'�','�'); //DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;

//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     if GetTemplateParam('PAR1')='1' then begin
       ds.Fld('ADD_TEXT').AsString := getResource('SPR_MROGD1',nType);  //'� ������ ���� � �������� ���������������� �������';
       ds.Fld('ADD_TEXT2').AsString := getResource('SPR_MROGD2',nType)+'.'; //'������� ������� �������.';
     end;
     if GetTemplateParam('PAR1')='2' then begin
       ds.Fld('ADD_TEXT').AsString := getResource('SPR_UROGD1',nType); // '� ������ ���� � �������� �������, �������� � ������� ������ ����� ���� �����';
       ds.Fld('ADD_TEXT2').AsString := getResource('SPR_UROGD2',nType)+' (' + DatePropis(DokZAGS.Fld('DATES').AsDateTime,6) + ').';
     end;
     ds.Post;
   end;
end;

//---------------------------- sprWord

function ReportMestoZ_UserForm:boolean;
var
  f:TfmParamQuest;
  n:Integer;
begin
  Result:=false;
  f := TfmParamQuest.Create(nil);
  f.Caption := '������� ���������';
  f.AddParamEx(StartOfTheMonth(Now), '��������� ����' , 'DATE1' ,'TYPE=DATE');
  f.AddParamEx(EndOfTheMonth(Now), '�������� ����' , 'DATE2' ,'TYPE=DATE');
  f.AddButtons('���������~�����',0);
  n:=f.ShowQuest;
  if n = 1 then begin
    SetGlobalVar('DATE1',f.GetValue('DATE1','D'));
    SetGlobalVar('DATE2',f.GetValue('DATE2','D'));
    Result:=true;
  end;
  f.Free;
end;
function ReportMestoZ(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds,dsList:TDataSet;
  n:Integer;
  sSQL,s,ss:String;
  d1,d2:TDateTime;
begin
  result:=true;
  ds:=GetTemplateDataSet('MAIN');
  if ds<>nil then begin
     if not ds.Active then ds.Open;
     d1:=GetGlobalVar('DATE1');
     d2:=GetGlobalVar('DATE2');
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('PERIOD').AsString := 'c '+DatePropis(d1,3)+' �� '+DatePropis(d2,3);

//     WritePodpis(ds,'KopyLS2');
     ds.Fld('DOLG_PODP1').AsString:=DolgRukov();   //podpis_dolg(1);
     ds.Fld('FIO_PODP1').AsString:=FIORukov();    //podpis_fio(1);
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     sSQL:= 'SELECT getFIO2(ISNULL(a.FAMILIA,''''),ISNULL(a.NAME,''''),ISNULL(a.OTCH,'''')) as FIO, a.DATES, a.SDAN_DOK, a.LICH_NOMER, s.NAME as MESTOZ, b.ZH_UCH, b.ZH_RAD, b.ZH_UCH2, b.ZH_MOG '+
            ' FROM ����������� a '+
            ' LEFT JOIN AktZ b   ON a.LICH_NOMER=b.LICH_NOMER  '+
            ' LEFT JOIN SprZAH s ON s.ID=b.ZH_KLAD  '+
//            ' LEFT JOIN BaseTextProp b ON typeobj=7 and a.id=b.id and POKAZ=''MESTO_Z''  '+
            ' WHERE a.datez>='+DateToSQL(d1)+' and a.datez<='+DateToSQL(d2)+' and a.vosstan=false ORDER BY a.datez';
     dsList:=dbOpenSQL(sSQL,'');
     n:=0;
     while not dsList.Eof do begin
       n:=n+1;
       ds.Append;
       ds.Fld('NN').AsString  := IntToStr(n)+'.';
       ds.Fld('FIO').AsString := dsList.Fld('FIO').AsString;
       ds.Fld('DATES').AsString := DatePropis(dsList.Fld('DATES').AsDateTime,3);
       s:=Trim(dsList.Fld('LICH_NOMER').AsString);
       ss:=Trim(dsList.Fld('SDAN_DOK').AsString);
       if ss<>'' then if s<>'' then s:=s+', '+ss else s:=ss;
       ds.Fld('PASP').AsString  := s;
       s:=dsList.Fld('MESTOZ').AsString;
       if dsList.Fld('ZH_UCH').AsString<>''  then s:=s+', ������'+chr(160)+dsList.Fld('ZH_UCH').AsString;
       if dsList.Fld('ZH_RAD').AsString<>''  then s:=s+', ���'+chr(160)+dsList.Fld('ZH_RAD').AsString;
       if dsList.Fld('ZH_UCH2').AsString<>'' then s:=s+', �������'+chr(160)+dsList.Fld('ZH_UCH2').AsString;
       if dsList.Fld('ZH_MOG').AsString<>''  then s:=s+', ������'+chr(160)+dsList.Fld('ZH_MOG').AsString;
       ds.Fld('MESTO').AsString:=s;
       ds.Post;
       dsList.Next;
     end;
     dbClose(dsList)
  end;
end;

// ������� � ������ (������ ����� �����)
function SPR_SMERT_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if Copy(GlobalTask.ParamAsString('KOD'),1,1)='5' then begin  // ��� ������ ��������� �������
    Result:='������� � ������5.doc';
  end;
end;
// ������� � ������
function SPR_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   n,nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=0;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',2);
     ds.Fld('KOLON_N').AsString:=CreateKolonN(nType);
     SetSrokDv(ds,nType); // !!!
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('FIOP').AsString := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     if (YearOf(NOW)>2015) then begin
       ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+', '+getResource('IN',nType)+': ';
       if DokZAGS.Fld('LICH_NOMER').AsString=''
         then ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+getResource('NONE',nType)+','
         else ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+DokZAGS.Fld('LICH_NOMER').AsString+',';
     end;

     ds.Fld('DateS').AsString := DatePropisEX(DokZAGS.Fld('DateS').AsDateTime,6,DokZAGS.Fld('ONLYGOD').AsInteger);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('SPRAV_DATE').AsString := DatePropis(NOW,TYPE_DATE_SPRAV);
     ds.Fld('SPRAV_NOMER').AsString := DokZAGS.Fld('SPRAV_NOMER').AsString;
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
//     ds.Fld('GetVozrast').AsString := GetVozrast(GetCountYear(DokZAGS.Fld('DATES').AsDateTime,DokZAGS.Fld('DATER').AsDateTime),false);


  if  DokZAGS.Fld('DATES').IsNull or DokZAGS.Fld('DATER').IsNull then begin
    if DokZAGS.Fld('TEXT_VOZR').AsString<>'' then begin
      n:=Pos('/',DokZAGS.Fld('TEXT_VOZR').AsString);
      if n=0
        then ds.Fld('GetVozrast').AsString:=DokZAGS.Fld('TEXT_VOZR').AsString
        else ds.Fld('GetVozrast').AsString:=Copy(DokZAGS.Fld('TEXT_VOZR').AsString,1,n-1);
    end else begin
      ds.Fld('GetVozrast').AsString:='';
    end;
  end else begin
    if SubDateYear(DokZAGS.Fld('DateS').AsDateTime,DokZAGS.Fld('DateR').AsDateTime)<1 then begin
      if DokZAGS.Fld('DateS').AsDateTime=DokZAGS.Fld('DateR').AsDateTime then begin
        ds.Fld('GetVozrast').AsString:=' � �������� ����� �����';
      end else begin
        ds.Fld('GetVozrast').AsString:=' � �������� '+SubDatePropis(DokZAGS.Fld('DateS').AsDateTime,DokZAGS.Fld('DateR').AsDateTime,0);
      end;
    end else begin
      ds.Fld('GetVozrast').AsString := ' � �������� '+GetVozrast(GetCountYear(DokZAGS.Fld('DATES').AsDateTime,DokZAGS.Fld('DATER').AsDateTime),false);
    end;
  end;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('MESTOS').AsString := DokZAGS.GetAdres2('SM_GOSUD,FNAME;+SM_OBL,SM_B_OBL;SM_RAION;SM_GOROD,SM_B_GOROD;',3);
//     ds.Fld('MESTOS1').AsString := DokZAGS.GetAdres(';;SM_RAION;SM_GOROD,SM_B_GOROD;',1);     

    if DokZAGS.Fld('POL').AsString='�' then ds.Fld('ROD').AsString := '����' else ds.Fld('ROD').AsString := '������' ;
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
    ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
    ds.Post;
   end;
end;
// �������� ������� � ������ (������ ����� �����)
function SPR_ARXIV_SMERT_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if Copy(GlobalTask.ParamAsString('KOD'),1,1)='5' then begin  // ��� ������ ��������� �������
    Result:='��� ������� � ������5.doc';
  end;
end;
// �������� ������� � ������
function SPR_ARXIV_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   n,nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=0;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',9);
     ds.Fld('KOLON_N').AsString:=CreateKolonN(nType);
     SetSrokDv(ds,nType); // !!!
     if GlobalTask.ParamAsString('ARXIV')='1' then begin
       ds.Fld('NAME_SPR').AsString :='��������    ';
       ds.Fld('NAME_ORG').AsString :='';
     end else begin
       ds.Fld('NAME_SPR').AsString :='';
       ds.Fld('NAME_ORG').AsString :='������ ';
     end;
     if DokZAGS.Fld('ADRESAT')=nil then begin
       ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString;
       ds.Fld('ARX_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
       ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
       if  DokZAGS.Fld('DATES').IsNull or DokZAGS.Fld('DATER').IsNull then begin
         if DokZAGS.Fld('TEXT_VOZR').AsString<>'' then begin
           n:=Pos('/',DokZAGS.Fld('TEXT_VOZR').AsString);
           if n=0
             then ds.Fld('GetVozrast').AsString:=DokZAGS.Fld('TEXT_VOZR').AsString
             else ds.Fld('GetVozrast').AsString:=Copy(DokZAGS.Fld('TEXT_VOZR').AsString,1,n-1);
         end else begin
           ds.Fld('GetVozrast').AsString:='';
         end;
       end else begin
         ds.Fld('GetVozrast').AsString := ' � �������� '+GetVozrast(GetCountYear(DokZAGS.Fld('DATES').AsDateTime,DokZAGS.Fld('DATER').AsDateTime),false);
       end;
     end else begin
       ds.Fld('ARX_ADRESAT').AsString   := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
       ds.Fld('ARX_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('NOMER').AsString := DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.Fld('NAME_ZAGS').AsString;
       ds.Fld('GetVozrast').AsString := ' � �������� '+DokZAGS.Fld('VOZR').AsString;
     end;
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('FIOP').AsString := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');

     ds.Fld('DateS').AsString := DatePropisEX(DokZAGS.Fld('DateS').AsDateTime,6,DokZAGS.Fld('ONLYGOD').AsInteger);
     if ds.Fld('DateS').AsString='' then ds.Fld('DateS').AsString:='���� ������ ����������';
     s:=GetNameAsPol('��������',DokZags.Fld('POL').AsString+'+');
     ds.Fld('DateS').AsString := s+' '+ds.Fld('DateS').AsString; 

     ds.Fld('MESTOS').AsString := DokZAGS.GetAdres2('SM_GOSUD,FNAME;+SM_OBL,SM_B_OBL;SM_RAION;SM_GOROD,SM_B_GOROD;',3);     

     if DokZAGS.Fld('POL').AsString='�' then s:='M' else s:='G';
     if (DokZAGS.Fld('NATION').AsString<>'') and (Copy(DokZAGS.Fld('NATION').AsString,1,2)<>'19')
       then ds.Fld('NATION').AsString := NationForSprav(DokZAGS.Fld('NATION').AsString,'NAME_'+s,', ');

     ds.Fld('ADD_TEXT').AsString := DokZags.GetIzm('IZMEN')+'.'+chr(13);

     if DokZAGS.Fld('ADRESAT')=nil then begin   // �� ����
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     end;

     ds.Post;
   end;
end;
//----------------------------------------------------------
function FR_GetBrakRast:String;
var
  s1,s2:String;
begin
  s1:=FirstUpper(DokZAGS.Fld('ON_FamiliaP').AsString+' '+DokZAGS.Fld('ON_Name').AsString+' '+DokZAGS.Fld('ON_Otch').AsString);
  s2:=FirstUpper(DokZAGS.Fld('ONA_FamiliaP').AsString+' '+DokZAGS.Fld('ONA_Name').AsString+' '+DokZAGS.Fld('ONA_Otch').AsString);
  Result:=GetBrakRast(DokZags.getTable('Dokument'),s1,s2,'');
end;

//----------------------------------------------------------
// �������� ������� � ����� (���������)
function ZAGS_SprBrak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;      
   s,m,j : String;
   n:Integer;
begin
   result:=true;
//   if DokZags.ActiveON then showmessage('ON') else showmessage('ONA');
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,0,6,true);

     ds.Fld('FIOP_R').AsString := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
     ds.Fld('MESTOJ').AsString := '';

     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('Familia').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('Familia2').AsString,DokZAGS.Fld('Name2').AsString,DokZAGS.Fld('Otch2').AsString,'�','�');
     ds.Fld('ARX_DATE').AsString  := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('B_NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,TYPE_DATE_SPRAV);

     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.Fld('NAME_ZAGS').AsString;

     ds.Fld('FIO_ON').AsString := DokZAGS.Fld('FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := DokZAGS.Fld('FamiliaP2').AsString;
     // padeg_nation
     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('NATION').AsString,'NAME_MS',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('NATION2').AsString,'NAME_GS',', ');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;

     m:= GetPadegFIO3(DokZAGS.Fld('FamiliaP').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,'�','�');
     j:= GetPadegFIO3(DokZAGS.Fld('FamiliaP2').AsString,DokZAGS.Fld('Name2').AsString,DokZAGS.Fld('Otch2').AsString,'�','�');
     n:=0;
     s:=GetBrakRast(DokZAGS.getTable('Dokument'),m,j,'');
     if s<>'' then begin
       ds.Fld('ADD_TEXT').AsString := s;
       n:=2;
     end;
     if DokZAGS.Fld('FIRST_BRAK').AsBoolean then begin
       ds.Fld('ADD_TEXT').AsString := '� ������ ���� � ���������� ����� ������� �������� ��� ���������� � ���� �������.';
       ds.Fld('ADD_TEXT2').AsString := chr(13)+'������� ������ ��� ���������� �� ���� �������, ����������� � ��������� �������� �������.';
       n:=3;
     end;
     s:='ADD_TEXT';
     if n>1 then s:=s+IntToStr(n);
     ds.Fld(s).AsString := chr(13)+DokZags.GetIzm('IZMEN')+'.'; 
     ds.Post;
   end;
end;

//----------------------------------------------------------
// �������� ������� � ����� 
function SPR_ARXIV_brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds, spruch,dsDeti: TDataSet;      
  s,m,j : String;
  n,nType:Integer;
  sBel:String;
begin
   result:=true;
//   if DokZags.ActiveON then showmessage('ON') else showmessage('ONA');
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=0;  // 1-���. 0-���.
     ds.Edit;
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',6);
     ds.Fld('SHTAMP').AsString := GetShtampSprEx(nType);
     ds.Fld('KOLON_N').AsString:=CreateKolonN(nType);
     SetSrokDv(ds,0);
     if GlobalTask.ParamAsString('ARXIV')='1' then begin
       ds.Fld('NAME_SPR').AsString :=getResource('ARX1',nType)+'    ';  // ��������  strRes.ini
       ds.Fld('NAME_ORG').AsString :='';
     end else begin
       ds.Fld('NAME_SPR').AsString :='';
       ds.Fld('NAME_ORG').AsString :=getResource('ARX2',nType)+' '; // ������
     end;
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       if DokZAGS.ActiveON = true then begin
         ds.Fld('FIOP_R').AsString := GetPadegFIO3(DokZAGS.Fld('ON_FamiliaP').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
         ds.Fld('MESTOJ').AsString := DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3);
       end else begin 
         ds.Fld('FIOP_R').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_FamiliaP').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
         ds.Fld('MESTOJ').AsString := DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3);
       end; 
     end else begin
       ds.Fld('FIOP_R').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
       ds.Fld('MESTOJ').AsString := '';
     end;
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('ARX_DATE').AsString := DatePropis(NOW,4);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'�','�');
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'�','�');
     // padeg_nation
     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('ON_NATION').AsString,'NAME_MS',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('ONA_NATION').AsString,'NAME_GS',', ');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     m:= GetPadegFIO3(DokZAGS.Fld('ON_FamiliaP').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     j:= GetPadegFIO3(DokZAGS.Fld('ONA_FamiliaP').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     n:=0;
// �������������� ����� ��� 4 ����� �������

     if GetTemplateParam('PAR2')='0' then begin
       s:=GetBrakRast(DokZAGS.getTable('Dokument'), m,j,'');
       ds.Fld('ADD_TEXT').AsString := s;
       n:=2;
     end;
     if GetTemplateParam('PAR2')='4' then begin
       if DokZAGS.Fld('BRAK_RAST').AsBoolean then begin
         if DokZAGS.Fld('TYPE_RAST').AsInteger=1 then s:='���������' else s:='����������';
         PutError(' ���� '+s+'!');
         result:=false;
       end else begin
         if (DokZAGS.Fld('ON_SEM').AsString='2') and (DokZAGS.Fld('ONA_SEM').AsString='2') then begin
           ds.Fld('ADD_TEXT').AsString := getResource('SPR_BRAK_B1',nType); //'� ������ ���� � ���������� ����� ������� �������� ��� ���������� � ���� �������.';
           ds.Fld('ADD_TEXT2').AsString := chr(13)+getResource('SPR_FOR_OCH',nType);
           n:=3;
         end else  begin
           PutError(' ������� �������� ������ ��� ���������� � ���� �������!');
           result:=false;
         end;
       end;
     end;
     s:='ADD_TEXT';
     if n>1 then s:=s+IntToStr(n);
     ds.Fld(s).AsString := chr(13)+DokZags.GetIzm('IZMEN')+'.';
     ds.Post;
   end;
end;

// �������� ������� � ����������� ����� (��������)
function ZAGS_SprRast(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;      
   s,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,0,7,true);
     ds.Fld('ARX_DATE').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ARX_ADRESAT').AsString := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('ZAP_NOMER').AsString;
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('Familia').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('Familia2').AsString,DokZAGS.Fld('Name2').AsString,DokZAGS.Fld('Otch2').AsString,'�','�');
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.Fld('NAME_ZAGS').AsString;
     ds.Fld('FIO_ON').AsString := DokZAGS.Fld('FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := DokZAGS.Fld('FamiliaP2').AsString;

     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('NATION').AsString,'NAME_M',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('NATION2').AsString,'NAME_G',', ');

     ds.Fld('ADD_TEXT').AsString := DokZags.GetIzm('IZMEN');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     ds.Post;
   end;
end;

// �������� ������� � ����������� ����� 
function SPR_ARXIV_rast(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;      
   s,m,j : String;
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     nType:=0;
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,nType,7,true);
     ds.Fld('ARX_ADRESAT').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('ARX_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');

     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'�','�'); //DokZAGS.Fld('ON_FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'�','�');//DokZAGS.Fld('ONA_FamiliaP').AsString;

     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('ON_NATION').AsString,'NAME_M',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('ONA_NATION').AsString,'NAME_G',', ');

     ds.Fld('ADD_TEXT').AsString := DokZags.GetIzm('IZMEN');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// �������� ������� � �������� ���  (��������)
function ZAGS_SprChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,0,8,true);
     ds.Fld('ARX_DATE').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ARX_ADRESAT').AsString   := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA2').AsString,DokZAGS.Fld('NAME2').AsString,DokZAGS.Fld('OTCH2').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('NOMER').AsString := DokZAGS.Fld('ZAP_NOMER').AsString;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.Fld('Name_ZAGS').AsString;

     ds.Fld('F').AsString := DokZAGS.Fld('FAMILIA').AsString;
     ds.Fld('I').AsString := DokZAGS.Fld('NAME').AsString;
     ds.Fld('O').AsString := DokZAGS.Fld('OTCH').AsString;

     if DokZAGS.Fld('POL').AsString='�' then s:='M' else s:='G';
     ds.Fld('NATION').AsString := NationForSprav(DokZAGS.Fld('NATION').AsString,'NAME_'+s,', ');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     ds.Fld('ADD_TEXT').AsString :=DokZags.GetIzm('IZMEN');
     ds.Post;
   end;
end;

// �������� ������� � �������� ���  
function SPR_ARXIV_IM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,0,8,true);

     ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIAdo').AsString,DokZAGS.Fld('NAMEdo').AsString,DokZAGS.Fld('OTCHdo').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('ARX_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('F').AsString := GetPadegFIO(DokZAGS.Fld('FAMILIAposle').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('I').AsString := GetPadegFIO(DokZAGS.Fld('NAMEposle').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('O').AsString := GetPadegFIO(DokZAGS.Fld('OTCHposle').AsString,DokZAGS.Fld('POL').AsString,'�');
     if DokZAGS.Fld('POL').AsString='�' then s:='M' else s:='G';
     ds.Fld('NATION').AsString := NationForSprav(DokZAGS.Fld('NATION').AsString,'NAME_'+s,', ');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Fld('ADD_TEXT').AsString :=DokZags.GetIzm('IZMEN');
     ds.Post;
   end;
end;

//========================================
// ��������� �� ���������� ������� ������
function ZAGS_IzvOtsut_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if DokZAGS.Fld('LANG').AsInteger=1 then begin
    CreateWorkShtamp(3);  // SHTAMP-BEL
    Result:='��������� �� ���������� ������ ����_���.doc';
  end else begin
    CreateWorkShtamp(1);  // SHTAMP
  end;
end;

function ZAGS_IzvOtsut(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   sPol : String;      
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=DokZAGS.Fld('LANG').AsInteger;
     ds.Edit;
     sPol:=DokZAGS.Fld('POL').AsString;
     CreateTitle(ds,nType,12,false);
     ds.Fld('ADRESAT').AsString   := DokZAGS.Fld('ADRESAT').AsString;
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     if nType=1 then begin
       ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME_B');
       ds.Fld('TYPEAKT').AsString := ValueFromKey('KEY_TYPEZAGS_FULL_B',DokZags.Fld('TYPEAKT').Asstring,'',false);
     end else begin
       ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
       ds.Fld('TYPEAKT').AsString := ValueFromKey('KEY_TYPEZAGS_FULL',DokZags.Fld('TYPEAKT').Asstring,'',false);
     end;
     ds.Fld('FIO').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,sPol,'�');

     ds.Fld('DATE1').AsString := DokZAGS.Fld('DATE1').AsString;
     ds.Fld('DATE2').AsString := DokZAGS.Fld('DATE2').AsString;

     ds.Fld('ARX_FOND').AsString := DokZAGS.Fld('ARX_FOND').AsString;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
//     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     ds.Post;
   end;
end;

// ������� �� ���������� ������� ������ � �����
function ZAGS_SprOtsut_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if DokZAGS.Fld('LANG').AsInteger=1 then begin
    CreateWorkShtamp(3);  // SHTAMP-BEL
    Result:='������� �� ���������� ������ ���� � ���������� �����_���.doc';
  end else begin
    CreateWorkShtamp(1);  // SHTAMP
  end;
end;
// ������� �� ���������� ������� ������ � �����
function ZAGS_SprOtsut(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,dsRast: TDataSet;
   sPol,sPol2,s,ss,s3,Strin,sKrat : String;      
   nType:Integer;
begin
//   sKrat:='<.>';
   sKrat:='';  // !!!  �������� ����� ������������� �������� !!!   '' ��� '<.>'
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     nType:=DokZAGS.Fld('LANG').AsInteger;
     CreateTitle(ds, nType, 10, false);
     sPol:=DokZAGS.Fld('POL').AsString;
     if sPol='�' then sPol2:='�' else sPol2:='�';
     if nType=1 then begin // �� ���. �����
       ds.Fld('ROGD').AsString      := GetNameAsPolBel('�� �����糢��',sPol)+' '+
                                       DatePropisBel(DokZAGS.Fld('DATER').AsDateTime,TYPE_DATE_SPRAV)+' � '+
                                       DokZAGS.GetAdres2(sKrat+'<B>RG_GOSUD,FNAME_B;+RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',1);     
       ds.Fld('MESTO_GIT').AsString := '� ��������� �������� �� ������: '+
                                       DokZAGS.GetAdres2(sKrat+'<B>GT_GOSUD,FNAME_B;+GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',1);     
       ds.Fld('ZAV').AsString       := GetNameAsPolBel('�������',sPol);
       if DokZAGS.Fld('GRAG').AsString='999'
         then ds.Fld('GRAG').AsString := '����� ��� �������������' 
         else ds.Fld('GRAG').AsString := GetNameAsPolBel('�����������',sPol)+' '+SeekValueSpr('��������','ID',DokZAGS.Fld('GRAG').AsString,'FNAME_B');
       ds.Fld('NAME').AsString  := GlobalTask.ParamAsString('NAME_B');
       ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('FIO').AsString   := FirstUpper(DokZAGS.Fld('FAMILIA').AsString+' '+DokZAGS.Fld('NAME').AsString+' '+DokZAGS.Fld('OTCH').AsString);

       ds.Fld('ADD_TEXT').AsString:='';
       dsRast:=DokZags.GetTable('tbRast');
       if dsRast.Fld('TYPE_RAST').AsInteger>0 then begin
         ss:=Trim(dsRast.Fld('B_ZAGS').AsString);
         if ss='' then ss:=GlobalTask.ParamAsString('NAME_B');
         s:=chr(13)+chr(9)+'� ���������� ������ '+ss;
         s:=s+' ������ �� �������� ���� ���� �� ��������� ����� � '+dsRast.Fld('B_NOMER').AsString+' ��������� '+
            DatePropisBel(dsRast.Fld('B_DATE').AsDateTime,TYPE_DATE_SPRAV)+' � �������� '+ 
            ds.Fld('GRAG').AsString+' '+dsRast.Fld('LICO').AsString+' � '+dsRast.Fld('SUPRUG').AsString+'.'+chr(13)+chr(9);
         if sPol2='�' then s3:='����' else s3:='����';
         ss:=GetBrakRast_Bel(DokZAGS.GetTable('tbRast'),'#','',s3);
//writedebug('4444444444444');
         ds.Fld('ADD_TEXT').AsString:=s+ss;
       end;
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV_B').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV_B').AsString;
     end else begin
       ds.Fld('ROGD').AsString:=GetNameAsPol('�����������',sPol)+' '+
                                DatePropis(DokZAGS.Fld('DATER').AsDateTime,TYPE_DATE_SPRAV)+' � '+
                                DokZAGS.GetAdres2(sKrat+'RG_GOSUD,FNAME;+RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',3);     
       if DokZAGS.Fld('GT_GOSUD').AsInteger=defGrag then begin
         ds.Fld('MESTO_GIT').AsString:=GetNameAsPol('������������',sPol)+' � ���������� �������� �� ������: '+
                                       DokZAGS.GetAdres2(sKrat+';GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',3);     
       end else begin
         ds.Fld('MESTO_GIT').AsString:=GetNameAsPol('������������',sPol)+' �� ������: '+
                                       DokZAGS.GetAdres2(sKrat+'GT_GOSUD,FNAME;GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',3);     
       end;
       ds.Fld('ZAV').AsString:=GetNameAsPol('���������',sPol);

       Strin:='����������';
     //  if DokZAGS.Fld('GRAG').AsString<>'112' then begin 
     //     Strin := '������������ ����������';
     //  end;
       if DokZAGS.Fld('GRAG').AsString='999'
         then ds.Fld('GRAG').AsString := '���� ��� �����������'
         else ds.Fld('GRAG').AsString := GetNameAsPol(Strin,sPol)+' '+SeekValueSpr('��������','ID',DokZAGS.Fld('GRAG').AsString,'GNAME');

       ds.Fld('NAME').AsString  := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
       ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('FIO').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,sPol,'�');

       ds.Fld('ADD_TEXT').AsString:='';
       dsRast:=DokZags.GetTable('tbRast');
       if dsRast.Fld('TYPE_RAST').AsInteger>0 then begin
         ss:=Trim(dsRast.Fld('B_ZAGS').AsString);
         if ss='' then ss:=GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
         s:=chr(13)+chr(9)+'� ���������� ������ '+ss;
         s:=s+' ������� �� �������� ������ ���� � ���������� ����� � '+dsRast.Fld('B_NOMER').AsString+' ������������ '+
            DatePropis(dsRast.Fld('B_DATE').AsDateTime,TYPE_DATE_SPRAV)+' � ��������� '+ 
            ds.Fld('GRAG').AsString+' '+GetPadegFIO(dsRast.Fld('LICO').AsString,sPol,'�')+' � '+GetPadegFIO(dsRast.Fld('SUPRUG').AsString,sPol2,'�')+'.'+chr(13)+chr(9);
         ss:=GetBrakRast(DokZAGS.GetTable('tbRast'),'#','','');
         ds.Fld('ADD_TEXT').AsString:=s+ss;
       end;
       // 1-����������,�������   2-�����    NameZAGS('��','�')
  //     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     end;
     ds.Fld('ADRESAT').AsString := DokZAGS.Fld('ADRESAT').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATE1').AsString := DokZAGS.Fld('DATE1').AsString;
     ds.Fld('DATE2').AsString := DokZAGS.Fld('DATE2').AsString;

     ds.Post;
   end;
end;
//===========================================================
//������� � ������ ���� ������������ ���������
function ZAGS_SprAkt_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if DokZAGS.Fld('LANG').AsInteger=1 then begin
    CreateWorkShtamp(3);  // SHTAMP-BEL
    Result:='������� � ������ ���� ������������ ���������_���.doc';
  end else begin
    CreateWorkShtamp(1);  // SHTAMP
  end;
end;
function ZAGS_SprAkt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   sPol : String;      
   nType:Integer;
begin
//SHTAMP,ADRESAT,NAME,DATEZ,NOMER,FIO,DOLG_RUK_ZAGS,RUKOV,NOMER_AKT,DATE_AKT,ZAGS_AKT,FIO_AKT,
//SVED,IS_IZMEN,IZMEN
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     nType:=DokZAGS.Fld('LANG').AsInteger;
     if not ds.Active then ds.Open;
     ds.Edit;
     sPol:=DokZAGS.Fld('POL').AsString;
     CreateTitle(ds, nType, 3, false);
     ds.Fld('ADRESAT').AsString   := DokZAGS.Fld('ADRESAT').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('NOMER_AKT').AsString := DokZAGS.Fld('NOMER_AKT').AsString;
     ds.Fld('SVED').AsString := Replace_CRLF(DokZAGS.Fld('VN_SVED').AsString);
     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     if DokZAGS.Fld('IS_VN_IZM').AsInteger=0 then begin
       ds.Fld('IS_IZMEN').AsString := getResource('SPR_IZM',nType);
       ds.Fld('IZMEN').AsString := '';
     end else begin
       ds.Fld('IS_IZMEN').AsString := getResource('SPR_VN_IZM',nType);
       ds.Fld('IZMEN').AsString := Replace_CRLF(DokZAGS.Fld('VN_IZM').AsString);
     end;
     if nType=1 then begin
       ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME_B');
       ds.Fld('TYPEAKT').AsString := ValueFromKey('KEY_TYPEZAGS_FULL_B',DokZags.Fld('TYPEAKT').Asstring,'',false);
       ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('FIO_AKT').AsString   := FirstUpper(DokZAGS.Fld('FAMILIA').AsString+' '+DokZAGS.Fld('NAME').AsString+' '+DokZAGS.Fld('OTCH').AsString);
       ds.Fld('ZAGS_AKT').AsString := DokZAGS.Fld('NAME_ZAGS').AsString;
       ds.Fld('DATE_AKT').AsString := DatePropisBel(DokZAGS.Fld('DATE_AKT').AsDateTime,TYPE_DATE_SPRAV);
     end else begin
       ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
       ds.Fld('TYPEAKT').AsString := ValueFromKey('KEY_TYPEZAGS_FULL',DokZags.Fld('TYPEAKT').Asstring,'',false);
       ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('FIO_AKT').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,sPol,'�');
       ds.Fld('ZAGS_AKT').AsString := GetPadeg(DokZAGS.Fld('NAME_ZAGS').AsString,'�');
       ds.Fld('DATE_AKT').AsString := DatePropis(DokZAGS.Fld('DATE_AKT').AsDateTime,TYPE_DATE_SPRAV);
     end;
     ds.Post;
   end;
end;

//---------------------------------------------------------------------------
function ZAGS_ZaklChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,dsDeti: TDataSet;
   sPol,s,ss : String;      
begin
   Result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     sPol:=DokZAGS.Fld('POL').AsString;
//     ds.Fld('SHTAMP').AsString := GetShtampSpr();
//     if GlobalTask.ParamAsString('ARXIV')='1' then begin  ��������� �����
//     end;
//     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     if Pos('(', DokZAGS.Fld('FAMILIA').AsString)=0 
       then ds.Fld('FIO').AsString:=GetPadegFIO(DokZAGS.FPlus('FAMILIA;NAME;OTCH','~'),sPol,'�')
       else ds.Fld('FIO').AsString:=DokZAGS.FPlus('FAMILIA;NAME;OTCH','~');

     ds.Fld('ROGD').AsString      := GetNameAsPol('�����������',sPol)+' '+
                                     DatePropis(DokZAGS.Fld('DATER').AsDateTime,DP_MAIN)+' � '+
                                     DokZAGS.GetAdres('RG_GOSUD,FNAME;RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',1);     
     ds.Fld('WHO').AsString := DokZAGS.Fld('WHO').AsString;
     ds.Fld('FIO_NEW').AsString := DokZAGS.Fld('FIO_NEW').AsString;
     ds.Fld('PRICH').AsString := DokZAGS.Fld('PRICH').AsString;

     if DokZAGS.Fld('R_NOMER').AsString<>'' then begin
       ds.Fld('R_MESTO').AsString := '� ������ ���� � �������� � '+DokZAGS.Fld('R_NOMER').AsString+' �� '+
               DatePropis(DokZAGS.Fld('R_DATE').AsDateTime,DP_MAIN)+' ����������� '+DokZAGS.Fld('R_ZAGS').AsString+CRLF+
               GetNameAsPol('��',sPol)+' '+DokZAGS.FPlus('R_FAMILIA;R_NAME;R_OTCH',' ')+CRLF+
               GetNameAsPol('��������',sPol)+' '+DokZAGS.GetAdres('R_RG_GOSUD,FNAME;R_RG_OBL,R_RG_B_OBL;R_RG_RAION;R_RG_GOROD,R_RG_B_GOROD;',1)+CRLF+
               '�������� '+DokZAGS.Fld('OTEC').AsString+', '+DokZAGS.Fld('MAT').AsString;
     end;

     ds.Fld('VIS_ORG').AsString := GlobalTask.ParamAsString('VIS_ORGAN');
     s:='������ ���� � ����� � '+DokZAGS.Fld('B_NOMER').AsString+' �� '+
               DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,DP_MAIN)+' ���������� � '+DokZAGS.Fld('B_ZAGS').AsString+'.';
     if sPol='�'
       then ss:='�������� � ���������� '
       else ss:='��������� � ����������� ';
     if (DokZAGS.Fld('TYPE_BRAK').AsInteger=1) or (DokZAGS.Fld('TYPE_BRAK').AsInteger=0) then begin
       ds.Fld('BRAK').AsString := '������� � ����� � '+DokZAGS.Fld('SUPRUG').AsString+Chr(13)+s;
     end else if (DokZAGS.Fld('TYPE_BRAK').AsInteger=2) then begin  // � ����� �� �������
       ds.Fld('BRAK').AsString := '� ����� �� �������.';
     end else if (DokZAGS.Fld('TYPE_BRAK').AsInteger=3) then begin  // �������� (������ ����)
       ds.Fld('BRAK').AsString := ss+DokZAGS.Fld('SUPRUG').AsString+Chr(13)+
            '������� ���� '+DokZAGS.Fld('B_ZAGS').AsString+' �� '+
            DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,DP_MAIN)+' ���������� � �������� ���� '+DatePropis(DokZAGS.Fld('B_DATE2').AsDateTime,DP_MAIN)+'.';
     end else if (DokZAGS.Fld('TYPE_BRAK').AsInteger=4) then begin  // �������� �/� � �����
       ds.Fld('BRAK').AsString := ss+DokZAGS.Fld('SUPRUG').AsString+Chr(13)+
             '������ ���� � ����������� ����� � '+DokZAGS.Fld('B_NOMER').AsString+' �� '+
               DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,DP_MAIN)+' ���������� � '+DokZAGS.Fld('B_ZAGS').AsString+'.';
     end else if (DokZAGS.Fld('TYPE_BRAK').AsInteger=5) then begin  // ����� (������)
       if sPol='�'
         then ss:='������, ������� � ����� � ���������� '
         else ss:='�����, �������� � ����� � ����������� ';
       ds.Fld('BRAK').AsString := ss+DokZAGS.Fld('SUPRUG').AsString+Chr(13)+s;
     end;

     dsDeti:=DokZags.Deti;
     if dsDeti.RecordCount>0 then begin
       dsDeti.First;
       ds.Fld('DETI').AsString:='����� �����:'+Chr(13);
       while not dsDeti.Eof do begin
         ds.Fld('DETI').AsString:=ds.Fld('DETI').AsString+
             ' - '+dsDeti.Fld('FIO').AsString+', '+dsDeti.Fld('MESTO').AsString+', '+DatePropis(dsDeti.Fld('DATER').AsDateTime,DP_MAIN)+
            ', �/�  �'+dsDeti.Fld('NOMER').AsString+' �� '+DatePropis(dsDeti.Fld('DATEA').AsDateTime,DP_MAIN)+
            ' '+dsDeti.Fld('MESTOREG').AsString+Chr(13);
         dsDeti.Next;
       end;
       dsDeti.First;
     end;
     ds.Fld('MESTO_GIT').AsString := DokZAGS.GetAdres(';GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',1);     
     ds.Fld('WORK').AsString := DokZAGS.Fld('WORK').AsString;
     ds.Fld('VUS').AsString := DokZAGS.Fld('VUS').AsString;
     ds.Fld('ROVD').AsString := DokZAGS.Fld('ROVD').AsString;
     ds.Fld('ROVD_DATE').AsString := DatePropis(DokZAGS.Fld('ROVD_DATE').AsDateTime,DP_MAIN);
     ds.Fld('ROVD_ZAKL').AsString := Replace_CRLF(DokZAGS.Fld('ROVD_ZAKL').AsString);

     ds.Fld('SOOB').AsString := Replace_CRLF(DokZAGS.Fld('SOOB').AsString);
     if DokZAGS.Fld('IS_IZMEN').AsBoolean then begin
       ds.Fld('IS_IZMEN').AsString:= '��� ���������� �� ��������, �������� '+getPadeg(GlobalTask.ParamAsString('VIS_ORGAN'),'�')+', ���������� ������ ��������� � ��������� ������ ����� ������������ ���������:';
       ds.Fld('IZMEN').AsString := Replace_CRLF(DokZAGS.Fld('IZMEN').AsString);
     end;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,DP_MAIN);

     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     if DokZAGS.Fld('SPEC').AsString<>'' then begin
       ds.Fld('DOLG_SPEC_ZAGS').AsString :=DokZAGS.Fld('DOLG_SPEC').AsString;
       ds.Fld('SPEC').AsString :=DokZAGS.Fld('SPEC').AsString;
     end;
     ds.Post;
   end;
end;
//---------------------------------------------------------------------------
function ZAGS_ZaklIzmAkt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,dsDeti: TDataSet;
   sPol,s,ss : String;      
   l:Boolean;
begin
   Result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     l:=DokZAGS.Fld('DELETE_CRLF').AsBoolean;
     if not ds.Active then ds.Open;
     ds.Edit;
//     sPol:=DokZAGS.Fld('POL').AsString;
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     sPol:=PolFromName(DokZAGS.Fld('NAME').AsString);
     if sPol='' then if ANSIUpperCase(RIGHT(DokZAGS.Fld('OTCH').AsString,1))='�' then sPol:='�' else sPol:='�';
     if DokZAGS.Fld('IS_SKLONEN').AsBoolean then begin 
       s:=DokZAGS.FPlus('FAMILIA;NAME;OTCH','~');
       ds.Fld('FIO').AsString:=GetPadegFIO(s,sPol,'�')
     end else begin
       ds.Fld('FIO').AsString:=DokZAGS.FPlus('FAMILIA;NAME;OTCH',' ');
     end;
     s:='';
     if DokZAGS.Fld('IS_IZMEN').AsBoolean  then s:='���������';
     if DokZAGS.Fld('IS_DOPOLN').AsBoolean then ss:='����������' else ss:='';
     if ss<>'' then if s='' then s:=ss else s:=s+', '+ss;
     if DokZAGS.Fld('IS_ISPRAV').AsBoolean then ss:='�����������' else ss:='';
     if ss<>'' then if s='' then s:=ss else s:=s+', '+ss;
     ds.Fld('CHECK_IZM').AsString:=s;

     ds.Fld('PROSIT').AsString := Replace_CRLF2(DokZAGS.Fld('PROSIT').AsString,l);
     ds.Fld('DOKUMENTS').AsString := Replace_CRLF2(DokZAGS.Fld('DOKUMENTS').AsString,l);
     ds.Fld('USTANOVIL').AsString := Replace_CRLF2(DokZAGS.Fld('USTANOVIL').AsString,l);
     s:=ValueFromKey('KEY_TYPEZAGS_FULL',DokZags.Fld('TYPEAKT').Asstring,'',false);

     ds.Fld('AKT').AsString := '���� '+s+' � '+DokZAGS.Fld('B_NOMER').AsString+' �� '+
                                DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,DP_MAIN)+' ����������� '+
                                DokZAGS.Fld('B_ZAGS').AsString;
     ds.Fld('AKT1').AsString := StringReplace(ds.Fld('AKT').AsString,'�����������','�����������');

     ds.Fld('ROVD_ZAKL').AsString := Replace_CRLF2(DokZAGS.Fld('ROVD_ZAKL').AsString,l);
     ds.Fld('SOOB').AsString := Replace_CRLF2(DokZAGS.Fld('SOOB').AsString,l);

     if DokZAGS.Fld('IZMEN').AsString<>'' then begin
       ds.Fld('IZMEN').AsString := '����� ���� ���������� ������ ��������� � ��������� ������ ����� ������������ ���������:'+chr(13)+
       Replace_CRLF2(DokZAGS.Fld('IZMEN').AsString,l);
     end;
     if DokZAGS.Fld('COPY1').AsString<>'' then begin
       ds.Fld('COPY').AsString := '����� ���������� ����������:'+chr(13);
       ds.Fld('COPY').AsString := ds.Fld('COPY').AsString+'1. '+DokZAGS.Fld('COPY1').AsString+Chr(13);
       if DokZAGS.Fld('COPY2').AsString<>'' then ds.Fld('COPY').AsString := ds.Fld('COPY').AsString+'2. '+DokZAGS.Fld('COPY2').AsString+Chr(13);
       if DokZAGS.Fld('COPY3').AsString<>'' then ds.Fld('COPY').AsString := ds.Fld('COPY').AsString+'3. '+DokZAGS.Fld('COPY3').AsString;
     end;

     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,DP_MAIN);
     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     if DokZAGS.Fld('SPEC').AsString<>'' then begin
       ds.Fld('DOLG_SPEC_ZAGS').AsString :=DokZAGS.Fld('DOLG_SPEC').AsString;
       ds.Fld('SPEC').AsString :=DokZAGS.Fld('SPEC').AsString;
     end;
     ds.Post;
   end;
end;

// ���������� � �������� ��
//---------------------------------------------------------------------------
function ZAGS_ZaklAddIN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   sPol,s,ss,sZags,szags1 : String;      
   l:Boolean;
   nD:Integer;
begin
   Result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     nD:=2;
//     sPol:=DokZAGS.Fld('POL').AsString;
     ds.Edit;
     ds.Fld('ZAKL').AsString := '�� '+DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,nD)+' �'+DokZAGS.Fld('NOMER').AsString;
     s := GlobalTask.ParamAsString('NAME');
     if DokZAGS.Fld('IS_SKLON').AsBoolean then begin 
       ds.Fld('NAME').AsString:=FU(GetPadeg(s,'�'))+', �����������';
       ds.Fld('USTAN').AsString:='�����������';
     end else begin
       ds.Fld('NAME').AsString:=s+', ����������';
       ds.Fld('USTAN').AsString:='���������';
     end;
     sPol:=PolFrom(DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString);
     if DokZAGS.Fld('IS_SKLONR').AsBoolean then begin 
       s:=DokZAGS.FPlus('FAMILIA;NAME;OTCH','~');
       ds.Fld('FIOR1').AsString:=GetPadegFIO(s,sPol,'�')
       s:=DokZAGS.FPlus('FAMILIA1;NAME1;OTCH1','~');
       ds.Fld('FIO').AsString:=GetPadegFIO(s,DokZAGS.Fld('ZV').AsString,'�');
     end else begin
       ds.Fld('FIOR1').AsString:=DokZAGS.FPlus('FAMILIA;NAME;OTCH',' ');
       ds.Fld('FIO').AsString:=DokZAGS.FPlus('FAMILIA1;NAME1;OTCH1',' ');
     end;
     ds.Fld('FIOR1').AsString:=DokZAGS.FPlus('FAMILIA;NAME;OTCH',' ')+' '+DatePropis(DokZAGS.Fld('DATER').AsDateTime,6)+' ';

     ds.Fld('ADRES').AsString := ' '+GetNameAsPol('������������',DokZAGS.Fld('ZV').AsString)+' �� ������: '+
                                 DokZAGS.GetAdres('GT_GOSUD,FNAME;GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',1);     

     s:=DokZAGS.GetPasport('DOC=D1_DOKUMENT;TYPE=D1_DOK_TYPE;SERIA=D1_DOK_SERIA;NOMER=D1_DOK_NOMER;DATE=D1_DOK_DATE',2);
     ss:=DokZAGS.GetPasport('DOC=D1_DOKUMENT;TYPE=D1_DOK_TYPE;SERIA=D1_DOK_SERIA;NOMER=D1_DOK_NOMER;DATE=D1_DOK_DATE',4);
     ds.Fld('DOKUMENTS').AsString := '��������, �������������� ��������'+chr(13)+s+' '+ss;
     if (DokZAGS.Fld('D2_DOK_NOMER').AsString<>'') then begin
       s:=DokZAGS.GetPasport('DOC=D2_DOKUMENT;TYPE=D2_DOK_TYPE;SERIA=D2_DOK_SERIA;NOMER=D2_DOK_NOMER;DATE=D2_DOK_DATE',2);
       ss:=DokZAGS.GetPasport('DOC=D2_DOKUMENT;TYPE=D2_DOK_TYPE;SERIA=D2_DOK_SERIA;NOMER=D2_DOK_NOMER;DATE=D2_DOK_DATE',4);
       ds.Fld('DOKUMENTS').AsString := ds.Fld('DOKUMENTS').AsString+chr(13)+'��������, �������������� �������� ������� �������� ���� ��� �����'+chr(13)+s+' '+ss;
     end;
     if (DokZAGS.Fld('SVID_NOMER').AsString<>'') then begin
       ds.Fld('DOKUMENTS').AsString := ds.Fld('DOKUMENTS').AsString+chr(13)+'������������� � �������� ������� ����� '+DokZAGS.Fld('SVID_SERIA').AsString+' �'+DokZAGS.Fld('SVID_NOMER').AsString;
     end;
     s:=DokZAGS.Fld('R_ZAGS').AsString;
     if DokZAGS.Fld('IS_SKLON').AsBoolean 
       then sZags:=GetPadeg(s,'�')
       else sZags:=s;
     ds.Fld('AKT1').AsString := ' � '+DokZAGS.Fld('R_NOMER').AsString+', ����������� '+
                                DatePropis(DokZAGS.Fld('R_DATE').AsDateTime,nD)+' '+sZags;
     ds.Fld('AKT2').AsString := ds.Fld('AKT1').AsString;
     ds.Fld('AKT4').AsString := StringReplace(ds.Fld('AKT1').AsString,'�����������','�����������');
     ds.Fld('FIOR2').AsString := ds.Fld('FIOR1').AsString;
     ds.Fld('FIOR3').AsString := ds.Fld('FIOR1').AsString;
     ds.Fld('FIOR4').AsString := ds.Fld('FIOR1').AsString;

     ds.Fld('DATE_IN').AsString := DatePropis(DokZAGS.Fld('DATESV').AsDateTime,nD);
     ds.Fld('DATE_SV').AsString := DatePropis(DokZAGS.Fld('DATESV').AsDateTime,nD);
     ds.Fld('SVIDP').AsString   := chr(13)+'�����'+chr(160)+DokZAGS.Fld('SVID_SERIAP').AsString+chr(160)+'�'+DokZAGS.Fld('SVID_NOMERP').AsString;

//     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,nD);
     ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
     ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     ds.Fld('IDENTIF').AsString :=DokZAGS.Fld('IDENTIF').AsString;
     ds.Post;
   end;
end;

// ��������������� ������
function PredZapis_Talon(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds, dsT: TDataSet;
  d:TDateTime;
  n,nDayZ:Integer;
  s,sEmpty:String;
  lRaschet:Boolean;
begin
  lRaschet:=GlobalTask.GetWorkParam('RASCHET_DAY');
  result:=true;
  ds:=GetTemplateDataSet('MAIN');
  dsT:=dbGetDataSet('fmPredZapis.tbView');
  ds.Edit;
  ds.Fld('NOMER').AsString:=dsT.Fld('NOMER').AsString;
  ds.Fld('ON_FIO').AsString:=dsT.Fld('ON_FIO').AsString;
  ds.Fld('ONA_FIO').AsString:=dsT.Fld('ONA_FIO').AsString;
  ds.Fld('TIME_BRAK').AsString:=FormatDateTime('HH:NN',dsT.Fld('BEGINR').AsDateTime);
  ds.Fld('DATE_BRAK').AsString:=DatePropis(dsT.Fld('DATE_BRAK').AsDateTime,2);
  ds.Fld('TELEFON').AsString:=GlobalTask.GetWorkParam('TELEFON');
  ds.Fld('TIMEWORK').AsString:=GlobalTask.GetWorkParam('TIMEWORK');
  ds.Fld('PORPROV').AsString:=GlobalTask.GetWorkParam('PORPROV');
  s:=SeekValueSpr('SprKomiss','ID',dsT.Fld('MESTO').AsInteger,'NAME');
  if s<>'' 
    then ds.Fld('MESTO').AsString:='����� �����������: '+s;
  d:=IncMonth(dsT.Fld('DATE_BRAK').AsDateTime,-3);
  //--------------------------
  sEmpty:='�____� _____________ 20___ �.';
  if lRaschet then begin
    nDayZ:=GlobalTask.GetWorkParam('VISIT_DAY');
    n:=DayOfTheWeek(d);
//  writedebug(inttostr(n)+'   '+DatePropis(d,2));
    while n<>nDayZ do begin
      d:=IncDay(d,1);
      n:=DayOfTheWeek(d);
    end;
    if IsPrazdnik(d) then d:=IncDay(d,7);
    if IsPrazdnik(d) 
      then ds.Fld('DATE_DECL').AsString:=sEmpty
      else ds.Fld('DATE_DECL').AsString:=DatePropis(d,2);
    //--------------------------
    d:=dsT.Fld('DATE_BRAK').AsDateTime;
    d:=IncDay(d,-1);
    n:=DayOfTheWeek(d);
    while n<>nDayZ do begin
      d:=IncDay(d,-1);
      n:=DayOfTheWeek(d);
    end;
    if IsPrazdnik(d) then d:=IncDay(d,-7);
    if IsPrazdnik(d) 
      then ds.Fld('DATE_PASP').AsString:=sEmpty
      else ds.Fld('DATE_PASP').AsString:=DatePropis(d,2);
  end else begin        
    ds.Fld('DATE_DECL').AsString:=sEmpty;
    ds.Fld('DATE_PASP').AsString:=sEmpty;
  end;
  //--------------------------
  ds.Fld('CUR_DATE').AsString:=DatePropis(Now,2);
  ds.Post;
end;

//========================================
  // ������� � ����������� � ������������� ����������� ���� ����� ��������� (�� �����,����� ������)
function SPR_OTCHUG(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := FormatDateTime('YYYY',m.Fld('DATER').AsDateTime);
     if m.Fld('PASP_NOMER').AsString='' then begin
       ds.Fld('PPP_TEXT').AsString :='---';
     end else begin
       ps:= m.Fld('PASP_SERIA').AsString;
       d:= m.Fld('PASP_NOMER').AsString;
       v:= GetPadeg(m.Fld('PASP_VIDAN').AsString,'�');
       k:= DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
       ds.Fld('PPP_TEXT').AsString := ps+d+' ����� '+k+' ���� '+v;
     end; 
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'�');
  // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('NameOrgK').AsString := NameOrg('�','�');

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('PROGIV').AsString := '���������' ;
        ds.Fld('ZA_KEM').AsString := '���' ;
        ds.Fld('PROIZV').AsString := '����������' ;
        ds.Fld('Zarm').AsString := '���������������' ;
      end else begin
        ds.Fld('PROGIV').AsString := '���������' ;
        ds.Fld('ZA_KEM').AsString := '���' ;
        ds.Fld('PROIZV').AsString := '�����������' ;
        ds.Fld('Zarm').AsString := '����������������' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
   end;
end;

//------------------------------------------------------
// ������� � ����������� � ������������� ����������� ���� ����� ��������� (�� �����,�������)
function SPR_OTCHUG2(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     if m.Fld('PASP_NOMER').AsString='' then begin
       ds.Fld('PPP_TEXT').AsString :='---';
     end else begin
       ps:= m.Fld('PASP_SERIA').AsString;
       d:= m.Fld('PASP_NOMER').AsString;
       v:= GetPadeg(m.Fld('PASP_VIDAN').AsString,'�');
       k:= DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
       ds.Fld('PPP_TEXT').AsString := ps+d+' ����� '+k+' ���� '+v;
     end; 
     ds.Fld('NameOrgP').AsString := NameOrg('','�');
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'�');
// 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();
     ds.Fld('NameOrgK').AsString := NameOrg('�','�');
     ds.Post;
   end;
end;

//------------------------------------------------------------
// ������� � ����������� � ������������� ����������� ���� ����� ��������� (����� ���� ������)
function SPR_OTCHUG3(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
  // ds.Fld('DATER').AsString := FormatDateTime('YYYY',m.Fld('DATER').AsDateTime);
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
// ds.Fld('PASP_SERIA').AsString := m.Fld('PASP_SERIA').AsString;
// ds.Fld('PASP_NOMER').AsString := m.Fld('PASP_NOMER').AsString;
// ds.Fld('PASP_VIDAN').AsString := GetPadeg(m.Fld('PASP_VIDAN').AsString,'�');
// ds.Fld('PASP_DATE').AsString := DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
     if m.Fld('PASP_NOMER').AsString='' then begin
       ds.Fld('PPP_TEXT').AsString :='---';
     end else begin
       ps:= m.Fld('PASP_SERIA').AsString;
       d:= m.Fld('PASP_NOMER').AsString;
       v:= GetPadeg(m.Fld('PASP_VIDAN').AsString,'�');
       k:= DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
       ds.Fld('PPP_TEXT').AsString := ps+d+' ����� '+k+' ���� '+v;
     end; 
// ds.Fld('Passport').AsString := m.Passport; ����� - �����, �����. ������������ ���� �� � ������.
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('NameOrgP').AsString := NameOrg('','�');
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'�');
// PLOSH_ALL-����� ������� PLOSH_GIL-�����  PLOSH_ZDAN-������     
//    if LicSchet.Fld('PLOSH_ZDAN').AsString='' ���� ����� ������� ������ ������ �����, ����� ����� ������� ������ ���������.
//      then strPlosh := LicSchet.Fld('PLOSH_ALL').AsString
//      else strPlosh := LicSchet.Fld('PLOSH_ZDAN').AsString; ...�� ����������...
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('GOD_VOZV').AsString := LicSchet.Fld('GOD_VOZV').AsString;
// 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();
     ds.Fld('NameOrgK').AsString := NameOrg('�','�');
     ds.Post;
   end;
end;

// ��������� � ��������� ������������� � �������� 
function IZV_POVT_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ��������';
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     DokZAGS.SvidPovtor.Last;
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ��������� ������������� � ������
function IZV_POVT_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ������';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     DokZAGS.SvidPovtor.Last;
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ��������� ������������� � ���������� �����
function IZV_POVT_Brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� ���������� �����';
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('FIOP').AsString := on+' � '+ona;
     DokZAGS.SvidPovtor.Last;
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ��������� ������������� � ����������� ����� (�������)
function IZV_POVT_RastBrakm(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ����������� �����';
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('FIOP').AsString := on+' � '+ona;
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ��������� ������������� � ����������� ����� (�������)
function IZV_POVT_RastBrakj(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� ����������� �����';
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('FIOP').AsString := on+' � '+ona;
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
   //  ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
   //  ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ��������� ������������� �� ������������ ���������
function IZV_POVT_UstOtc(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='�� ������������ ���������';
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
 //    ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
 //    ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ��� �� ���������� ������� ����
function IZV_SUD_Adopt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds: TDataSet;
  sp,s,ss:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
//   if ds<>nil then begin
//     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('ARX_ADRESAT').AsString :='��� '+DokZAGS.Fld('SUD_NAME').AsString;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     s:='�� ���������� ������� ����'+CRLF+CRLF;
     //DokZAGS.NameZAGS2('','�'); NameOrg('','�'); 
     // DokZags.FIO('ON_#��')  ON_  ������� ���  �����. �����
     sp:=DokZAGS.Fld('POL').AsString;
     if sp='�' then ss:='�����������' else ss:='����������'; 
     s:=s+NameOrg('','�')+' �������� ��� �� ���������� ������� ���� �� '+DatePropis(DokZAGS.Fld('SUD_DATE').AsDateTime,5)+', ����������� � �������� ���� '+
        DatePropis(DokZAGS.Fld('SUD_DATEV').AsDateTime,5)+' � �� ��������� '+DokZags.FIO2('ON_','�','�')+' �� '+ss+' '+DokZags.FIO2('DO;E',sp,'�')+'.'+CRLF;
     s:=s+DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,5)+' ���������� ������ ���� �� '+ss+' �'+chr(160)+DokZAGS.Fld('NOMER').AsString+' �� '+DokZags.FIO2('DO;E',sp,'�')+' '+
        NameOrg('','�')+' � �� ��������� '+DokZags.FIO2('ON_','�','�')+' �� '+DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,5);
     ds.Fld('TEXT1').AsString:=s;
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
//   end;
end;

// ��������� � ��������� ������������� �� ����������� (����������)
function IZV_POVT_Adopt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     if DokZAGS.Fld('POL').AsString='�' then begin
      ds.Fld('O_HCEM').AsString :='�� �����������'; 
     end else begin
      ds.Fld('O_HCEM').AsString :='�� ����������'; 
     end;
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ��������� ������������� � �������� �����
function IZV_POVT_ChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� �������� �����';
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ��������� ������������� � ���������� ����� (���������������)
function IZV_POVT_BrakV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� ���������� �����';
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('FIOP').AsString := on+' � '+ona;
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ��������� ������������� � �������� (���������������)
function IZV_POVT_ROGDV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� ��������';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := DokZAGS.Fld('RUKOV').AsString;
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ��������� ������������� � ������ (���������������)
function IZV_POVT_SMERTV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� ������';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     DokZAGS.SvidPovtor.Last
     ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
     ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� � �������� 
function Soob_SPR_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� ��������';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     if DokZAGS.Fld('ADRESAT')=nil then begin   // �� ����
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','�');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� � ������
function Soob_SPR_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� ������';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');

     if DokZAGS.Fld('ADRESAT')=nil then begin   // �� ����
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','�');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� �� ���������� ������ ���� � �����
function Soob_SPR_OTSUT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString := DokZAGS.Fld('ADRESAT').AsString;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
        ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     if DokZAGS.Fld('ADRESAT')=nil then begin   // �� ����
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     end;

     ds.Post;
   end;
end;


// ���������������� ������ � ������� � ���������� �����
function Soob_SPR_Brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
   fldAdr:TField;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� ���������� �����';
     fldAdr:=DokZAGS.Fld('ADRESAT'); 
     if fldAdr=nil then begin      // ���� ������� �� ����
       on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
       ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     end else begin
       on:= GetPadegFIO3(DokZAGS.Fld('Familia').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,'�','�');
       ona:= GetPadegFIO3(DokZAGS.Fld('Familia2').AsString,DokZAGS.Fld('Name2').AsString,DokZAGS.Fld('Otch2').AsString,'�','�');
     end;
     ds.Fld('FIOP').AsString := on+' � '+ona;
     if fldAdr=nil then begin   // �� ����
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','�');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('B_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('B_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� � ����������� �����	
function Soob_SPR_RastBrak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
   fldAdr:TField;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� ����������� �����';
     fldAdr:=DokZAGS.Fld('ADRESAT'); 
     if fldAdr=nil then begin      // ���� ������� �� ����
       on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
       ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     end else begin
       on:= GetPadegFIO3(DokZAGS.Fld('Familia').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,'�','�');
       ona:= GetPadegFIO3(DokZAGS.Fld('Familia2').AsString,DokZAGS.Fld('Name2').AsString,DokZAGS.Fld('Otch2').AsString,'�','�');
     end;
     ds.Fld('FIOP').AsString := on+' � '+ona;
     if DokZAGS.Fld('ADRESAT')=nil then begin   // �� ����
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','�');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� � �������� �����
function Soob_SPR_ChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   fldAdr:TField;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� �������� �����';
     fldAdr:=DokZAGS.Fld('ADRESAT'); 
     if fldAdr=nil then begin      // ���� ������� �� ����
       ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
     end else begin
       ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIA2').AsString,DokZAGS.Fld('NAME2').AsString,DokZAGS.Fld('OTCH2').AsString,DokZAGS.Fld('POL').AsString,'�');
     end;
     if fldAdr=nil then begin   // �� ����
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','�');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� � �������� (���������������)
function Soob_SPR_ROGDV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('O_HCEM').AsString :='� ��������';
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     if DokZAGS.Fld('ADRESAT')=nil then begin   // �� ����
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.NameZAGS2('','�');
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
       ds.Fld('NOMER').AsString :=DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString:=DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     ds.Post;
   end;
end;

//-----------------------------------------------------
// ����������� ����: ZARM,ZAR,DATEP,ONO,GRAG,DATEP
procedure WriteMenToSpr(m:TMens; ds:TDataSet);
var
  s,ss:String;
  fld,fldR:TField;
begin
  fldR:=ds.FindField('DATEP');  
  if fldR<>nil then fldR.AsString:=DatePropis(m.Fld('DATEP').AsDateTime,6);
  s:=GetNameAsPol('���������������',m.Fld('POL').AsString);
  ss:=GetNameAsPol('���������',m.Fld('POL').AsString);
  if m.TypeReg=MESTO_NOTREG then begin   //�� ��������������� � �� ���������
    ds.Fld('Zarm').AsString:='���������';
    ds.Fld('Zar').AsString  := '';
    if fldR<>nil then fldR.AsString:= '';
  end else if m.TypeReg=MESTO_GIT then begin
    ds.Fld('Zarm').AsString := ss+' ('+s+') �� ����� ����������' ;
    ds.Fld('Zar').AsString := FirstUpper(s)+' �� ����� ���������� c ' ;
  end else begin   // �� ����� ����������
    ds.Fld('Zarm').AsString:='���������';
    ds.Fld('Zar').AsString := FirstUpper(s)+' �� ����� ���������� c ' ;
  end;    
  fld:=ds.FindField('ONO');
  if fld<>nil then fld.AsString:=GetNameAsPol('��',m.Fld('POL').AsString);
  fld:=ds.FindField('GRAG');
  if fld<>nil then fld.AsString:=GetNameAsPol('����������',m.Fld('POL').AsString);
end;

// ����� �������� �����
function KopyLS(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;

   nID : Integer;
   sOtnosh:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;

     nID:=m.Fld('ID_INTERNAL').asInteger;
     sOtnosh:=m.Fld('OTNOSH').asString;

     adr := LicSchet.Adres;
     strKomu := m.FIO;
     strGR:='';
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�')); //+', '+FirstCharUpper(Obl_Name('�'));

     ds.Fld('AdresR').AsString:=FirstCharUpper(ValueFromKey('KEY_OSNOV_ZASEL',LicSchet.Fld('OSNOV_ID').AsString,'',false))+
                                ' '+LicSchet.Fld('DOGOVOR').AsString;
     ds.Fld('TYPEHOUSE').AsString:=GetPredst(LicSchet.Fld('PREDST').AsString,'������� ���','NAME');
     ds.Fld('NomerOr').AsString:=CreateStrFromStr('�',LicSchet.Fld('OSNOV_NOMER'),'');
     ds.Fld('DateOr').AsString:=CreateStrFromDate(' �� ',LicSchet.Fld('OSNOV_DATE'),3)

{
     if IdProg()='GKH' then begin
       ds.Fld('AdresR').AsString := FirstCharUpper(GetPadeg(ParamAsString('GOROD')+' ���������','�'));
     end else begin
       ds.Fld('AdresR').AsString := FirstCharUpper( GetPadeg(OnlyRaion_Name('')+' ��������','�'));  // ��������
     end;
     ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'�������');
}
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;

//     WritePodpis(ds,34);
     WritePodpis(ds,'KopyLS2');

     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     m.First;
     while not m.Eof do begin
       ds.Append;
       ds.Fld('FIO').AsString := m.FIO;
       ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
       ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
       ds.Fld('DATEV').AsString := DatePropis(m.Fld('DATEV').AsDateTime,3);
       ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
       ds.Fld('Gragd').AsString := SeekValueSpr('��������','ID',m.Fld('CITIZEN').AsString,'GNAME');
       ds.Fld('Lgot').AsString := m.getLgoti;
       ds.Post;
       m.Next;
     end;
     m.First;
   end;
end;

  // ������� �� �������� ������ ����������
function SpravkS(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim,strYear : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strKomu := m.FIO;
     strYear:='';
     if m.Fld('DATER').AsString<>'' then begin
       strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+' �.�.,';
     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�')+strYear;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('POSTR').AsString := LicSchet.Fld('POSTR').AsString;

     ds.Fld('FIO_RUK').AsString := FIORukov();


     if ParamAsString('��_���������')='' then begin
        ds.Fld('D_Buh').AsString := '';
      end else begin
        ds.Fld('D_Buh').AsString := DolgGlBux();
        ds.Fld('FIO_buh').AsString := FIOGlBux();
      end;


     ds.Fld('D_Pas').AsString := DolgSpecOrSecretar();
     ds.Fld('FIO_pas').AsString := FIOSpecOrSecretar();

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Grag').AsString := '����������' ;
        ds.Fld('ONO').AsString := '��' ;
        ds.Fld('Zar').AsString := '���������������' ;
        ds.Fld('Zarm').AsString := '���������������' ;
      end else begin
        ds.Fld('Grag').AsString := '���������' ;
        ds.Fld('ONO').AsString := '���' ;
        ds.Fld('Zar').AsString := '����������������' ;
        ds.Fld('Zarm').AsString := '����������������' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'������� ���');
 
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;

     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
       end;
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='��������';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;
     ds.Post;

   end;
end;

// ��������� � �������� ��� (����,�����) 
function Izv_im(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,sPar : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     sPar:=GetTemplateParam('PAR');
     ds.Fld('TEXT1').AsString :='';
     ds.Fld('TEXT2').AsString :='';
     if sPar='1'  then begin
         ds.Fld('ARX_ADRESAT').AsString  := DokZAGS.Fld('ARX_ADRESAT').AsString
         ds.Fld('TEXT1').AsString  :='� � ��� ����� ������� ����� �������������.';
         ds.Fld('TEXT2').AsString  :='��������� � �������� ��������� � '+TypeArxiv()+' ����� ���� ��� �������� ��������� �� ������ ��������� ������ ����.'+CHR(13);
     end  else begin 
         ds.Fld('ARX_ADRESAT').AsString  := GetAdresat('ADRES_IZVECH'); 
     end;
    
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIAdo').AsString,DokZAGS.Fld('NAMEdo').AsString,DokZAGS.Fld('OTCHdo').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('FIOI').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIAdo').AsString,DokZAGS.Fld('NAMEdo').AsString,DokZAGS.Fld('OTCHdo').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('DATE_Iz').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
//     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');

     ds.Fld('F').AsString := GetPadegFIO(DokZAGS.Fld('FAMILIAposle').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('I').AsString := GetPadegFIO(DokZAGS.Fld('NAMEposle').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('O').AsString := GetPadegFIO(DokZAGS.Fld('OTCHposle').AsString,DokZAGS.Fld('POL').AsString,'�');

      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;

   end;
end;

// ��������� � �������� ��� (����,���) 
function Soob_im(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       ds.Fld('ROVD').AsString := GlobalTask.ParamAsString('ROVD');
       s:=DokZAGS.Fld('VOENKOM').AsString;
       if s='' then s:=ParamAsString('ID_VOENKOM');
       ds.Fld('VOENKOMAT').AsString := SeekValueSpr('SprVoenkom','ID',s,'NAME');
     end else begin
       ds.Fld('ROVD').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
//     ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres(';M_OBL,M_B_OBL;M_RAION;M_GOROD,M_B_GOROD;M_GOROD_R',1);
//     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('GOSUD,FNAME;OBL,;;;',1);     
//     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;RAION;GOROD,B_GOROD;',1);     
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOI').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIAdo').AsString,DokZAGS.Fld('NAMEdo').AsString,DokZAGS.Fld('OTCHdo').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('DATE_Iz').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     // ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('F').AsString := GetPadegFIO(DokZAGS.Fld('FAMILIAposle').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('I').AsString := GetPadegFIO(DokZAGS.Fld('NAMEposle').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('O').AsString := GetPadegFIO(DokZAGS.Fld('OTCHposle').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
   end;
end;

// ��������� �� ������������ ���������
function IZV_UstOtc(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('ADRES_SOOB').AsString := GetAdresat('ADRES_SOOB');
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('MestoNomer').AsString := DokZAGS.Fld('MestoNomer').AsString;
     ds.Fld('MestoDate').AsString := DatePropis(DokZAGS.Fld('MestoDate').AsDateTime,6);
     ds.Fld('Mesto').AsString := GetPadeg(DokZAGS.Fld('Mesto').AsString,'�'); 
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'�','�');//.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('ONA_GOSUD,FNAME;ONA_OBL,;;;',1);     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;ONA_RAION;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*;',1);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � �������� ����������� � �/� � ��������
function IZV_ISP_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ��������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ���������� ������ ���� � �������� ��
function IZV_DOP_IN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ��������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,3);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('ORGAN_ZAGS_2').AsString := NameOrg('','�'); //DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     if DokZAGS.OnlySvid then begin
       ds.Fld('SVID_SERIA').AsString := DokZAGS.Fld('SVID_SERIA').AsString;
       ds.Fld('SVID_NOMER').AsString := DokZAGS.Fld('SVID_NOMER').AsString;
       ds.Fld('SVID_DATA').AsString := DokZAGS.Fld('DATESV').AsString;
     end else begin
       ds.Fld('SVID_SERIA').AsString := DokZAGS.SvidPovtor.Fld('SVID_SERIA').AsString;
       ds.Fld('SVID_NOMER').AsString := DokZAGS.SvidPovtor.Fld('SVID_NOMER').AsString;
       ds.Fld('SVID_DATA').AsString := DokZAGS.SvidPovtor.Fld('SVID_DATE').AsString;
     end;
     ds.Fld('IDENTIF').AsString := DokZAGS.Fld('IDENTIF').AsString;
     ds.Fld('ZAKL').AsString := DokZAGS.Fld('ZAKL_IN_NOMER').AsString+chr(160)+'��'+chr(160)+DatePropis(DokZAGS.Fld('ZAKL_IN_DATE').AsDateTime,3);;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � �������� ����������� � �/� � ������
function IZV_ISP_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � �������� ����������� � �/� � ���������� �����
function IZV_ISP_Brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ���������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('FIOP').AsString := on+' � '+ona;
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � �������� ����������� � �/� � ����������� �����
function IZV_ISP_RastBrak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ����������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('FIOP').AsString := on+' � '+ona;
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � �������� ����������� � �/� �� ������������ ���������
function IZV_ISP_UstOtc(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='�� ������������ ���������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � �������� ����������� � �/� �� ����������� (����������)
function IZV_ISP_Adopt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     if DokZAGS.Fld('POL').AsString='�' then begin
      ds.Fld('O_HCEM').AsString :='�� �����������'; 
     end else begin
      ds.Fld('O_HCEM').AsString :='�� ����������'; 
     end;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � �������� ����������� � �/� � �������� �����
function IZV_ISP_ChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� �������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � �������� ����������� � ��������������� �/� � ��������
function IZV_ISP_ROGD_V(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ��������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');

     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');

     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � �������� ����������� � ��������������� �/� � ������
function IZV_ISP_SMERT_V(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � �������� ����������� � ��������������� �/� � ���������� �����
function IZV_ISP_Brak_V(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('O_HCEM').AsString :='� ���������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('FIOP').AsString := on+' � '+ona;
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������� ���� ������� � ������� �� �������� �����
procedure AddProdTo(ds:TDataSet; sName:String; sValue:String);
begin
     ds.Append;
     ds.Fld('PROD').AsString := sName;
     ds.Fld('KOLVO').AsString := sValue;
     ds.Post;
end;

  // ������� �� �������� �����
function SprV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));

//     ds.Fld('FIO_RUK').AsString := FIORukov();
     WritePodpis(ds,13);

     ds.Fld('LIC').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('KNIGA').AsString := LicSchet.Fld('KNIGA_NOMER').AsString;
     ds.Fld('UCH').AsString := LicSchet.Fld('VSEGO').AsString;

     ds.Fld('GOD').AsString:=FormatDateTime('YYYY',MainDateFiks);
     if ds.Fld('GOD').AsString='1899' then ds.Fld('GOD').AsString:=FormatDateTime('YYYY',Now);

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Zarm').AsString := '���������������' ;
      end else begin
       ds.Fld('Zarm').AsString := '����������������' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     //----------------------- ������ ��� ��� ������ ���. ����� ---------------
     if LicSchet.Fld('PR_SERNO')<>nil then begin  
       if not LicSchet.Fld('PR_SERNO').IsNull then AddProdTo(ds,'�����',LicSchet.Fld('PR_SERNO').AsString);
       if not LicSchet.Fld('PR_KART').IsNull then AddProdTo(ds,'���������',LicSchet.Fld('PR_KART').AsString);
       if not LicSchet.Fld('PR_OVOCHI').IsNull then AddProdTo(ds,'�����',LicSchet.Fld('PR_OVOCHI').AsString);
       if not LicSchet.Fld('PR_KORNPL').IsNull then AddProdTo(ds,'�������� ����������',LicSchet.Fld('PR_KORNPL').AsString);
       if not LicSchet.Fld('PR_PLOD').IsNull then AddProdTo(ds,'�����(����������, �����������)',LicSchet.Fld('PR_PLOD').AsString);
       if not LicSchet.Fld('PR_JAGOD').IsNull then AddProdTo(ds,'����� ����������',LicSchet.Fld('PR_JAGOD').AsString);
     end;
     //------------------------------------------------------------------------
     ds:=GetTemplateDataSet('TABLSOST1');
     if not LicSchet.Fld('BIG_ENIMAL').IsNull then AddProdTo(ds,'������� ������� ����',LicSchet.Fld('BIG_ENIMAL').AsString);
     if not LicSchet.Fld('SVINI').IsNull then AddProdTo(ds,'������',LicSchet.Fld('SVINI').AsString);
     if not LicSchet.Fld('OVCI').IsNull then AddProdTo(ds,'����',LicSchet.Fld('OVCI').AsString);
     if not LicSchet.Fld('KOZI').IsNull then AddProdTo(ds,'����',LicSchet.Fld('KOZI').AsString);
     if not LicSchet.Fld('LOSHADI').IsNull then AddProdTo(ds,'������',LicSchet.Fld('LOSHADI').AsString);
     if not LicSchet.Fld('PTICA').IsNull then AddProdTo(ds,'�����',LicSchet.Fld('PTICA').AsString);
     if ds.RecordCount=0 then AddProdTo(ds,'�� �����','');
   end;
end;

  // �������  � ������� ����� (������� 1)
function SprSS1(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim : String;
   lPrint:Boolean;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strKomu := m.FIO;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_buh').AsString := FIOGlBux();
     ds.Fld('FIO_pas').AsString := FIOSpec();
     ds.Fld('DOLG_RUK').AsString := DolgRukov();
     ds.Fld('DOLG_BUH').AsString := DolgGlBux();
     ds.Fld('DOLG_SPEC').AsString := DolgSpec();

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('ONO').AsString := '��' ;
        ds.Fld('Zar').AsString := '���������������' ;
        ds.Fld('Zarm').AsString := '���������������' ;
        ds.Fld('Ego').AsString := '���' ;
      end else begin
        ds.Fld('ONO').AsString := '���' ;
        ds.Fld('Zar').AsString := '����������������' ;
        ds.Fld('Zarm').AsString := '����������������' ;
        ds.Fld('Ego').AsString := '���' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;
     if m.Count>1 then lPrint:=true else lPrint:=false;
     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
       end;
       if lPrint then begin
       if AddMenToSprav(m,nID) then begin
           nn:=nn+1;
           ds.Append;
           ds.Fld('NN').AsString  := IntToStr(nn)+'.';
           ds.Fld('FIO').AsString := m.FIO;
           ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
           ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
           ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
           ds.Post;
         end;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='��������';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('SOBSTV').AsString:=s+' '+strSobstv;
     ds.Post;

   end;
end;


// �������  � ������� ����� (������� 2)
function SprSS2(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   sOtnosh :String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('NomerPH').AsString := LicSchet.Fld('KNIGA_NOMER').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();
     ds.Fld('DOLG_RUK').AsString := DolgRukov();
     ds.Fld('DOLG_SEK').AsString := DolgSecretar();

     if m.Fld('POL').AsString='�' then begin
//        ds.Fld('ONO').AsString := '��' ;
        ds.Fld('Zarm').AsString := '���������������' ;
        ds.Fld('Ego').AsString := '���' ;
      end else begin
//        ds.Fld('ONO').AsString := '���' ;
        ds.Fld('Zarm').AsString := '����������������' ;
        ds.Fld('Ego').AsString := '��' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     //--------- ��������� ���� ���� �������� �������
     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
     ds.Fld('WORK_NAME').AsString:=SpecGrafToStr(m,ParamAsInteger('SSS2_TYPE'),3);
     ds.Post;
     //---------------------------------------------
     m.First;
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('WORK_NAME').AsString:=SpecGrafToStr(m,ParamAsInteger('SSS2_TYPE'),3);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

// �������  � ������� ����� (������� 3)
function SprSS3(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   sOtnosh :String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('FIO_SEK').AsString := FIOSecretar();
     ds.Fld('DOLG_SEK').AsString := DolgSecretar();
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('DOLG_RUK').AsString := DolgRukov();
     if m.Fld('POL').AsString='�' then begin
//        ds.Fld('ONO').AsString := '��' ;
        ds.Fld('Zarm').AsString := '���������������' ;
        ds.Fld('Ego').AsString := '���' ;
      end else begin
//        ds.Fld('ONO').AsString := '���' ;
        ds.Fld('Zarm').AsString := '����������������' ;
        ds.Fld('Ego').AsString := '��' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     //------------ ��������� ���� �������� �������
     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
     ds.Fld('DATEP').AsString:=SpecGrafToStr(m,ParamAsInteger('SSS3_TYPE'),3);
     ds.Post;
     //-------------------------------------------
     m.First;
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('DATEP').AsString:=SpecGrafToStr(m,ParamAsInteger('SSS3_TYPE'),3);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

  // ������� � ������� ����� � ���������� ����� ��������� (������� 2)
function SprSSP(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   sOtnosh :String;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('@PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('@PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();

     if adr.Kv='' then begin
       ds.Fld('PrS').AsString :='����� ���';
       ds.Fld('PrSb').AsString :='����� ���';
     end else begin
       ds.Fld('PrS').AsString :='��������';
       ds.Fld('PrSb').AsString :='��������';
     end;

     if m.Fld('POL').AsString='�' then begin
//        ds.Fld('ONO').AsString := '��' ;
        ds.Fld('Zarm').AsString := '���������������' ;
//        ds.Fld('Ego').AsString := '���' ;
      end else begin
//        ds.Fld('ONO').AsString := '���' ;
       ds.Fld('Zarm').AsString := '����������������' ;
//        ds.Fld('Ego').AsString := '���' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Fld('OBORUD').AsString := OborudDoma;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     //------- ������� ���� �������� �������
     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
     ds.Post;
     //------------------------------------
     m.First;
     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
       end;
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='��������';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('SOBSTV').AsString:=s+' '+strSobstv;
     ds.Post;
   end;
end;

//-----------------------------------------------------------
// ������� � ��������� ����� ���������� (�������� �����)
function SprMGP_Adres(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh : String;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     adr := Adres;
     m := adr.Mens;
     strKomu := m.FIO;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('DATES').AsString := DatePropis(m.Fld('DATES').AsDateTime,6);
     ds.Fld('NomerLS').AsString := adr.ListLicSchet;
     ds.Fld('PLOSH_ALL').AsString := adr.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := adr.Fld('PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));

     WritePodpis(ds,9);
     WriteMenToSpr(m,ds);
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);

     if ds.Fld('Zarm').AsString='���������' 
       then ds.Fld('Zarm').AsString:=GetNameAsPol('��������',m.Fld('POL').AsString)+' ('+GetNameAsPol('���������������',m.Fld('POL').AsString)+') �� ����� ����������';

     ds.Fld('TYPEHOUSE').AsString:=GetPredst(Adres.Fld('PREDST').AsString,'������� ���','NAME2');
 
     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;

     strNanim:='';
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='��������';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;
     ds.Post;
   end;
end;

//---------------------------------------------------
// ������� � ���������� � ������ ���������� ������ ����� ��������� � ������� �����
function SprSSP_Adres(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh, strVed : String;
   nID,nn,nIDLic : Integer;
   sOtnosh :String;
   strNanim,strYear : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     adr := Adres;
     m := adr.Mens;
     strYear:='';
     if m.Fld('DATER').AsString<>'' then begin
       strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+'�.�.';
     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('DATEP').AsString := m.DvigToStr(', '); // DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('PLOSH_ALL').AsString := adr.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := adr.Fld('PLOSH_GIL').AsString;
     ds.Fld('MAT_STEN').AsString := AnsiLowerCase(SeekValueSpr('SprMatSten','ID',adr.Fld('MAT_STEN').AsString,'NAME'));
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'�')+strYear;
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�')+strYear;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));

     WritePodpis(ds,15);

     ds.Fld('GES').AsString := ParamAsString('DEFAULT_GES');
     ds.Fld('KOL_KOMN').AsString := adr.Fld('KOL_KOMN').AsString;
     if adr.Fld('ETAG').AsString='' then ds.Fld('ETAG').AsString := '������'  else ds.Fld('ETAG').AsString := adr.Fld('ETAG').AsString+' ';
     if (adr.Fld('KOL_ETAG').AsString='') or (adr.Fld('KOL_ETAG').AsString='1')  then ds.Fld('ETAGNOGO').AsString := '����'  else ds.Fld('ETAGNOGO').AsString := adr.Fld('KOL_ETAG').AsString+' ';
     ds.Fld('PRED').AsString := ParamAsString('SP_SOSTAVS');

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Grag').AsString := '����������';
        ds.Fld('ONO').AsString := '���';
        ds.Fld('ON').AsString := '���';
        ds.Fld('Pr').AsString := '������������';
        ds.Fld('Zarm').AsString := '�������������������';
      end else begin
        ds.Fld('Grag').AsString := '���������';
        ds.Fld('ONO').AsString := '���';
        ds.Fld('ON').AsString := '��';
        ds.Fld('Pr').AsString := '�����������';
        ds.Fld('Zarm').AsString := '������������������';
      end;

     ds.Fld('PrS').AsString :=adr.Predst;
//     if adr.Kv='' then begin
//       ds.Fld('PrS').AsString :='�������������� ����� ���';
//       ds.Fld('PrSb').AsString :='����� ���';
//     end else begin
//       ds.Fld('PrS').AsString :='��������';
//       ds.Fld('PrSb').AsString :='��������';
//     end;


//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������'; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������';
      end;

     if adr.Fld('OTD_KUXNA').AsBoolean then ds.Fld('OTD_KUXNA').AsString := '���������'
                                            else ds.Fld('OTD_KUXNA').AsString := '�����';
     if adr.Fld('IZOL_KOMN').AsBoolean then ds.Fld('IZOL_KOMN').AsString := '�������������'
                                            else ds.Fld('IZOL_KOMN').AsString := '���������������';

     ds.Fld('OBORUD').AsString := OborudDomaAdr(adr);

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID:=m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     nIDLic:=m.Fld('LIC_ID').AsInteger;
     strNanim:=m.FIO;
     m.First;
     nn:=0;

     strNanim:='';
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     ds.Fld('SOBSTV').AsString := GetPadeg(adr.ControlHouse,'�'); // ��������� � �������
     s:='��������';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;
     ds.Post;
   end;
end;

//------------------------------------------------------------------------
// ������� � ����� ����������
function SprMG(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   sPadeg,sAdd1,sAdd2,strAdres,strYear : String;
   nID : Integer;
   lAsGKX:Boolean;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      lAsGKX:=ParamAsBoolean('SPRMGS_GKX');  // � �����. � �������������� ���
      strKomu := m.FIO;
      strYear:='';
     if lAsGKX then begin
       sAdd1:='������ '+GetNameAsPol('����������',m.Fld('POL').AsString)+' ';
       sAdd2:='� ���, ��� '+GetNameAsPol('��',m.Fld('POL').AsString)+' ������������� ';
       sPadeg:='�';
     end else begin
       sAdd1:='';
       sAdd2:='';
       sPadeg:='�';
       if m.Fld('DATER').AsString<>'' then begin
         if GetTemplateParam('PAR2')='2' then begin
           strYear := ', '+DatePropis(m.Fld('DATER').AsDateTime,3);
         end else begin
           strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+' �.�.';
         end;
       end;
     end;
     ds.Fld('Komu').AsString := sAdd1+GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,sPadeg)+strYear;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�')+strYear;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));

//     WritePodpis(ds,1);
     WritePodpis(ds, StrToInt(GetTemplateParam('PAR1')) );

     WriteMenToSpr(m,ds);
     ds.Fld('Zarm').AsString:=sAdd2+ds.Fld('Zarm').AsString;
     ds.Post;
   end;
end;

//--------------------------------------------------------------------------------------------
// ������� ����������� ������������ � �������������� ����������� (� �������� �����)  FROM_LIC
function SprFE(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('GOD_VOZV').AsString := LicSchet.Fld('GOD_VOZV').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('GOSAKT_S').AsString := LicSchet.Fld('GOSAKT_S').AsString;
     ds.Fld('GOSAKT_N').AsString := LicSchet.Fld('GOSAKT_N').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('KomuT').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'�');
//     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
//     ds.Fld('FIO_RUK').AsString := FIORukov();
//     ds.Fld('FIO_SEK').AsString := FIOSecretar();

     WritePodpis(ds,31);

     if LicSchet.Predst='' 
       then ds.Fld('POMES').AsString  := '���������������'
       else ds.Fld('POMES').AsString  := LicSchet.Predst;

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('ONO').AsString := '���' ;
      end else begin
        ds.Fld('ONO').AsString := '��' ;
      end;
     ds.Post;
   end;
end;

//-------------------------------------------------------------------------------------
// ������� ����������� ������������ � �������������� ����������� (�����)   FROM_ADRES
function SprFE_Adres(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim,strYear : String;
   slOwners: TStringList;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     adr := Adres;
     m := adr.Mens;
//     strKomu := m.FIO;
//     strYear:='';
//     if m.Fld('DATER').AsString<>'' then begin
//       strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+' �.�.';
//     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('PLOSH_ALL').AsString := adr.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := adr.Fld('PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('DOP_STROEN').AsString := adr.Fld('DOP_STROEN').AsString;
     ds.Fld('PLOSH_ZDAN').AsString := adr.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('GOD_VOZV').AsString := adr.Fld('GOD_VOZV').AsString;
//     ds.Fld('VSEGO').AsString := adr.Fld('VSEGO').AsString;
//     ds.Fld('GOSAKT_S').AsString := adr.Fld('GOSAKT_S').AsString;
//     ds.Fld('GOSAKT_N').AsString := adr.Fld('GOSAKT_N').AsString;

     WritePodpis(ds,14);

     WriteMenToSpr(m,ds);

     ds.Fld('TYPEHOUSE').AsString:=GetPredst(Adres.Fld('PREDST').AsString,'������� ���','NAME');
  
   end;
end;

//-------------------------------------------------------------------------------------------
// �������� ����� ���������� ����
function KartPust(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,q, dsOwn: TDataSet;
   m : TMens;
   adr : TAdresLic;
   s,sNaslFIO,sNaslAdres,sDate,sLic,sSQL:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
//    OpenMessage(' ������������ ������ ... ','',10);
     adr:=Adres;
//     s:=dmBase.AdresFromID(DateFiks,adr.Fld('id').AsString,false);
//     adr:=Adres;
     sSQL := 'SELECT date_likv FROM ������������ WHERE adres_id='+adr.Fld('ID').AsString+' ORDER BY date_likv';
     q:=dbOpenSQL(sSQL,'');
     q.Last;
     if not q.Fld('DATE_LIKV').IsNull
       then sDate:=DatePropis(q.Fld('DATE_LIKV').AsDateTime,3)
       else sDate:='';
     dbClose(q);
     ds.Edit;
     dsOwn:=adr.HouseOwners;
     dsOwn.First;
     sNaslFIO:='';
     sNaslAdres:='';
     while not dsOwn.Eof do begin
       sNaslFIO:=sNaslFIO+dsOwn.FieldByName('NAME').AsString+', ';
       sNaslAdres:=sNaslAdres+dsOwn.FieldByName('ADRES').AsString+', ';
       dsOwn.Next;
     end;
     dsOwn.First;
//FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
//     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('PUNKT').AsString := adr.Punkt;
     ds.Fld('UL').AsString := adr.Ulica;
     ds.Fld('DOM').AsString := adr.Fld('DOM').AsString; //!!! ������ ������ ����� adr.Dom;
     ds.Fld('DATE_LIKV').AsString := sDate;
     ds.Fld('GOD_POST').AsString := adr.Fld('GOD_VOZV').AsString;
     ds.Fld('MAT_STEN').AsString := AnsiLowerCase(SeekValueSpr('SprMatSten','ID',adr.Fld('MAT_STEN').AsString,'NAME'));
     ds.Fld('PLOSH_ZDAN').AsString := adr.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('PLOSH_ALL').AsString := adr.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := adr.Fld('PLOSH_GIL').AsString;
     ds.Fld('PLOSH_UCH').AsString := adr.Fld('PLOSH_UCH').AsString;
     ds.Fld('HOZ_POST').AsString := adr.Fld('DOP_STROEN').AsString;
     ds.Fld('SOST').AsString := '';
     ds.Fld('NASL_FIO').AsString := Copy(sNaslFIO,1,Length(sNaslFIO)-2);
     ds.Fld('NASL_ADRES').AsString := Copy(sNaslAdres,1,Length(sNaslAdres)-2);
     ds.Fld('NASL_DOK').AsString := '';
     ds.Fld('UVED').AsString := '';
     ds.Fld('PREDP').AsString := '';
     ds.Post;
  end;
end;
//-------------------------------------------------------------------------------------------
// �������-������� �� �������� ����� � ��� (������� � ������� ������������� �� �����������)  FROM_LIC
function SprBTI(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'�');
     ds.Fld('AdrOR').AsString := FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('Dom').AsString := adr.Dom;
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;

     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Post;
     strNanim:='';
     m.First;
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
       end;
       if AddMenToSprav(m,nID) then begin
//       if (nID<>m.Fld('ID_INTERNAL').AsInteger) and
//     	 (m.Fld('PROPIS').AsBoolean=true) and             // ���. ������ �����������
//         (m.Fld('PRESENT').AsBoolean=true) then begin // ���. ������ ��������������
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='�����������';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('GRAG').AsString:=s;
     ds.Fld('SOBSTV').AsString:=strSobstv;
     ds.Post;
   end;
end;

  // �������-������� �� �������� ����� � ��� (������� ������� � ������� �������������)
function SprBTIP(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'�');
     ds.Fld('AdrOR').AsString := FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('Dom').AsString := adr.Dom;
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('GOSAKT_S').AsString := LicSchet.Fld('GOSAKT_S').AsString;
     ds.Fld('GOSAKT_N').AsString := LicSchet.Fld('GOSAKT_N').AsString;
     ds.Fld('FIO_RUK').AsString := FIORukov();
     ds.Fld('FIO_SEK').AsString := FIOSecretar();

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;

     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Post;

     m.First;
     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
       end;
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='�����������';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=s;       // !!!
     ds.Fld('SOBSTV').AsString:=strSobstv;
     ds.Post;
   end;
end;

  // ������� � ����������� � ��������� �������� �������
function SprJU(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strKomu, strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     strKomu := m.FIO;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('PRIL').AsString := getPril(2,'PRIL_GKH28',12);  // 2-������ ���������
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     s:=SpecGrafToStr(m,8,0);  // ���������� ������
     if s<>'' 
       then ds.Fld('Komu').AsString := ds.Fld('Komu').AsString + ', ' + s;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');

     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);
     WritePodpis(ds,4);

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Grag').AsString := '���������';
        ds.Fld('ONO').AsString := '��';
        ds.Fld('Vkl').AsString := '�������' ;
        ds.Fld('Proj').AsString := '���������' ;
        ds.Fld('Zarm').AsString := '������������������' ;
      end else begin
        ds.Fld('Grag').AsString := '���������';
        ds.Fld('ONO').AsString := '���';
        ds.Fld('Vkl').AsString := '��������' ;
        ds.Fld('Proj').AsString := '���������' ;
        ds.Fld('Zarm').AsString := '������������������' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;

     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

  // ������� � ����������� �������� �����
function SprJK(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   cPol,sOtnosh :String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     cPol:=m.Fld('POL').AsString;
     ds.Fld('Grag').AsString:=GetNameAsPol('����������',cPol);
     ds.Fld('Komu').AsString:=GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);

     WritePodpis(ds,6);

     ds.Fld('ONO').AsString:=GetNameAsPol('���',cPol);
     ds.Fld('Proj').AsString:=GetNameAsPol('������������',cPol+'2');
     ds.Fld('Zarm').AsString:=GetNameAsPol('���������������',cPol+'2');

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;

     while not m.Eof do begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
//       end;
       m.Next;
     end;
     m.First;
   end;
end;

  // ������� � ����������� � �������
function SprTop(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('FIO_SEK').AsString := FIOSecretar();
     ds.Fld('SP_TOPLIVO').AsString := ParamAsString('SP_TOPLIVO');

     if m.Fld('POL').AsString='�' then begin
//        ds.Fld('ONO').AsString := '��' ;
        ds.Fld('Zar').AsString := '���������������' ;
      end else begin
//        ds.Fld('ONO').AsString := '���' ;
        ds.Fld('Zar').AsString := '����������������' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
   end;
end;

// �������� ������� � �������� ��������������� 
function SPR_ARX_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     SetSrokDv(ds,0); 
     if GlobalTask.ParamAsString('ARXIV')='1' then begin
     ds.Fld('NAME_SPR').AsString :='��������    ';
     ds.Fld('NAME_ORG').AsString :='';
     end else begin
     ds.Fld('NAME_SPR').AsString :='';
     ds.Fld('NAME_ORG').AsString :='������ ';
     end;
     ds.Fld('ARX_ADRESAT').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     if DokZAGS.Fld('ONLYGOD').AsBoolean
       then ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,7)+'�.'
       else ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('GOSUD,FNAME;OBL,;;;',1);     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;RAION;GOROD,B_GOROD;',1);     
     ds.Fld('FIO_ON').AsString := DokZAGS.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;
   

     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('ON_NATION').AsString,'NAME_M',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('ONA_NATION').AsString,'NAME_G',', ');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;

     if DokZAGS.Fld('IZMEN').AsString='' then begin
       if GetTemplateParam('PAR1')='1' then begin
         ds.Fld('ADD_TEXT').AsString := '���������, �����������, ���������� � ������ ���� � �������� ��'+chr(160)+'���������.';
       end;
       if GetTemplateParam('PAR1')='2' then begin
         if DokZAGS.Fld('VOSSTAN').AsBoolean
           then ds.Fld('ADD_TEXT').AsString:=''
           else ds.Fld('ADD_TEXT').AsString:='������ �� ���� ����������� �� ��������� ��������� ������, ��'+chr(160)+'��������� � �����, � ������������ �� ������� 55 ������� ���������� �������� � ����� � �����.'+chr(13);
         ds.Fld('ADD_TEXT2').AsString:='���������, �����������, ���������� � ������ ���� � �������� ��'+chr(160)+'���������.';
       end;
     end else begin
       ds.Fld('ADD_TEXT').AsString := DokZAGS.Fld('IZMEN').AsString;
     end;
     ds.Post;
   end;
end;

// ������� (����������) � ������ � ����������� ����
function SprPZ(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.POL,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('KNAME').AsString := ParamAsString('KNAME');
     ds.Fld('FIO_SEK').AsString := FIOSecretar();

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Zarm').AsString := '���������' ;
        ds.Fld('Ego').AsString := '���' ;
      end else begin
        ds.Fld('Zarm').AsString := '���������' ;
        ds.Fld('Ego').AsString := '��' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
   end;
end;

// ��������� � �������� ����������
function IZV_INOSTR(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
  begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);     
     ds.Fld('KUDA').AsString := GetAdresat('ADRES_MIGR');
     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     ds.Fld('REB').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('INOST').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('RB').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('GR_INOST').AsString :=SeekValueSpr('��������','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME'); 
     ds.Fld('GR_RB').AsString :=SeekValueSpr('��������','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME');    
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;   
   end;
end;

// ��������� � ����� � �����������
function IZV_INOST(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     
     ds.Fld('KUDA').AsString := GetAdresat('ADRES_MIGR');

     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     if  DokZAGS.Fld('ON_GRAG').AsString=IntToStr(defGrag) then begin
       ds.Fld('GR_RB').AsString := '�����������';
       ds.Fld('GR_INOST').AsString := '����������';
       ds.Fld('RB').AsString := on;
       ds.Fld('INOST').AsString := ona;
       ds.Fld('STR').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('��������','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME');
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ON_GRAG',' '); //SeekValueSpr('��������','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME');
       end
     else begin
       ds.Fld('GR_RB').AsString := '����������';
       ds.Fld('GR_INOST').AsString := '�����������';
       ds.Fld('RB').AsString := ona;
       ds.Fld('INOST').AsString := on;     
       ds.Fld('STR').AsString :=DokZags.getGrag('ON_GRAG',' '); // SeekValueSpr('��������','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME')+' '+DokZAGS.Fld('ON_GRAG_ADD').AsString; 
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('��������','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME')+' '+DokZAGS.Fld('ON_GRAG_ADD').AsString;    
     end;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;   
   end;
end;

// ��������� � ����� � ����������� (����� ��������, ����������)
function IZV_INOST1(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona,on_dr,ona_dr,on_mr,ona_mr,on_mj,ona_mj: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('KUDA').AsString := GetAdresat('ADRES_MIGR');

     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     on_dr:=DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ona_dr:=DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
     on_mr := DokZAGS.GetAdres2('ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION;ON_GOROD,ON_B_GOROD;',3);
     ona_mr := DokZAGS.GetAdres2('ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION;ONA_GOROD,ONA_B_GOROD;',3);
     on_mj := DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3); 
     ona_mj := DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3); 

     if  DokZAGS.Fld('ON_GRAG').AsString=IntToStr(defGrag) then begin
       ds.Fld('GR_RB').AsString := '�����������';
       ds.Fld('GR_INOST').AsString := '����������';
       ds.Fld('RB').AsString := on;
       ds.Fld('INOST').AsString := ona;
       ds.Fld('STR').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('��������','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME');
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ON_GRAG',' '); //SeekValueSpr('��������','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME');
       ds.Fld('G_RB').AsString :=', '+on_dr+' �.�., ';
       ds.Fld('G_IN').AsString := ', '+ona_dr+' �.�., ';
       ds.Fld('MR_RB').AsString :='����� ��������: '+on_mr;
       ds.Fld('MR_IN').AsString :='����� ��������: '+ona_mr;
       ds.Fld('MG_RB').AsString :=' ����� ����������: '+on_mj;
       ds.Fld('MG_IN').AsString :=' ����� ����������: '+ona_mj;
       end
     else begin
       ds.Fld('GR_RB').AsString := '����������';
       ds.Fld('GR_INOST').AsString := '�����������';
       ds.Fld('RB').AsString := ona;
       ds.Fld('INOST').AsString := on;     
       ds.Fld('STR').AsString :=DokZags.getGrag('ON_GRAG',' '); // SeekValueSpr('��������','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME'); 
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ONA_GRAG',' '); // SeekValueSpr('��������','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME'); 
       ds.Fld('G_RB').AsString :=', '+ona_dr+' �.�., ';
       ds.Fld('G_IN').AsString := ', '+on_dr+' �.�., ';  
       ds.Fld('MR_RB').AsString :='����� ��������: '+ona_mr;
       ds.Fld('MR_IN').AsString :='����� ��������: '+on_mr; 
       ds.Fld('MG_RB').AsString :=' ����� ����������: '+ona_mj;
       ds.Fld('MG_IN').AsString :=' ����� ����������: '+on_mj;
     end;
     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'�','�');//DokZAGS.Fld('ON_FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'�','�');//DokZAGS.Fld('ONA_FamiliaP').AsString;

     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;   
   end;
end;

// ��������� � ����������� ����� � �����������
function IZV_RB_INOST(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     
     ds.Fld('KUDA').AsString := GetAdresat('ADRES_MIGR');

     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     if  DokZAGS.Fld('ON_GRAG').AsString=IntToStr(defGrag) then begin
       ds.Fld('GR_RB').AsString := '�����������';
       ds.Fld('GR_INOST').AsString := '����������';
       ds.Fld('RB').AsString := on;
       ds.Fld('INOST').AsString := ona;
       ds.Fld('STR').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('��������','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME');
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ON_GRAG',' '); //SeekValueSpr('��������','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME');
       end
     else begin
       ds.Fld('GR_RB').AsString := '����������';
       ds.Fld('GR_INOST').AsString := '�����������';
       ds.Fld('RB').AsString := ona;
       ds.Fld('INOST').AsString := on;     
       ds.Fld('STR').AsString :=DokZags.getGrag('ON_GRAG',' '); // SeekValueSpr('��������','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME')+' '+DokZAGS.Fld('ON_GRAG_ADD').AsString; 
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('��������','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME')+' '+DokZAGS.Fld('ON_GRAG_ADD').AsString;    
     end;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;   
   end;
end;

// ��������� � ����������� ����� � ����������� (����� ��������, ����������)
function IZV_RB_INOST1(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   on,ona,on_dr,ona_dr,on_mr,ona_mr,on_mj,ona_mj: String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('KUDA').AsString := GetAdresat('ADRES_MIGR');

     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     on:= GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     on_dr:=DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ona:= GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ona_dr:=DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
     on_mr := DokZAGS.GetAdres2('ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION;ON_GOROD,ON_B_GOROD;',3);
     ona_mr := DokZAGS.GetAdres2('ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION;ONA_GOROD,ONA_B_GOROD;',3);
     on_mj := DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3); 
     ona_mj := DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3); 

     if  DokZAGS.Fld('ON_GRAG').AsString=IntToStr(defGrag) then begin
       ds.Fld('GR_RB').AsString := '�����������';
       ds.Fld('GR_INOST').AsString := '����������';
       ds.Fld('RB').AsString := on;
       ds.Fld('INOST').AsString := ona;
       ds.Fld('STR').AsString :=DokZags.getGrag('ONA_GRAG',' '); //SeekValueSpr('��������','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME');
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ON_GRAG',' '); //SeekValueSpr('��������','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME');
       ds.Fld('G_RB').AsString :=', '+on_dr+' �.�., ';
       ds.Fld('G_IN').AsString := ', '+ona_dr+' �.�., ';
       ds.Fld('MR_RB').AsString :='����� ��������: '+on_mr;
       ds.Fld('MR_IN').AsString :='����� ��������: '+ona_mr;
       ds.Fld('MG_RB').AsString :=' ����� ����������: '+on_mj;
       ds.Fld('MG_IN').AsString :=' ����� ����������: '+ona_mj;
       end
     else begin
       ds.Fld('GR_RB').AsString := '����������';
       ds.Fld('GR_INOST').AsString := '�����������';
       ds.Fld('RB').AsString := ona;
       ds.Fld('INOST').AsString := on;     
       ds.Fld('STR').AsString :=DokZags.getGrag('ON_GRAG',' '); // SeekValueSpr('��������','ID',DokZAGS.Fld('ON_GRAG').AsString,'GNAME'); 
       ds.Fld('STR_RB').AsString :=DokZags.getGrag('ONA_GRAG',' '); // SeekValueSpr('��������','ID',DokZAGS.Fld('ONA_GRAG').AsString,'GNAME'); 
       ds.Fld('G_RB').AsString :=', '+ona_dr+' �.�., ';
       ds.Fld('G_IN').AsString := ', '+on_dr+' �.�., ';  
       ds.Fld('MR_RB').AsString :='����� ��������: '+ona_mr;
       ds.Fld('MR_IN').AsString :='����� ��������: '+on_mr; 
       ds.Fld('MG_RB').AsString :=' ����� ����������: '+ona_mj;
       ds.Fld('MG_IN').AsString :=' ����� ����������: '+on_mj;
     end;
     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'�','�');//DokZAGS.Fld('ON_FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'�','�');//DokZAGS.Fld('ONA_FamiliaP').AsString;

     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;   
   end;
end;

// ��������� � ����� � ���������
function IZV_BRAK(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   fiop_on,fiop_ona,fio_on,fio_ona: String;      
   idVoenkom : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     idVoenkom:=0;
     if DokZAGS.Fld('ON_VUS').AsBoolean then begin
       if DokZAGS.Fld('ON_VOENKOM').AsString=''
         then idVoenkom:=ParamAsInteger('ID_VOENKOM')
         else idVoenkom:=DokZAGS.Fld('ON_VOENKOM').AsInteger;
     end;
     if DokZAGS.Fld('ONA_VUS').AsBoolean and (idVoenkom=0) then begin
       if DokZAGS.Fld('ONA_VOENKOM').AsString=''
         then idVoenkom:=ParamAsInteger('ID_VOENKOM')
         else idVoenkom:=DokZAGS.Fld('ONA_VOENKOM').AsInteger;
     end;
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       if idVoenkom>0
         then ds.Fld('KUDA').AsString := SeekValueSpr('SprVoenkom','ID',idVoenkom,'NAME');
     end else begin
       ds.Fld('KUDA').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('MJ_ON').AsString :=DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3);   
     ds.Fld('MJ_ONA').AsString :=DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3);   
     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');

     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'�','�');//DokZAGS.Fld('ON_FamiliaP').AsString;

     ds.Fld('ON_DATER').AsString :=DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ds.Fld('ONA_DATER').AsString:=DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
     if DokZAGS.Fld('ON_VUS').AsBoolean then begin
       ds.Fld('FIO_ON').AsString := ds.Fld('FIO_ON').AsString+', ���������������';
     end;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'�','�');//DokZAGS.Fld('ONA_FamiliaP').AsString;
     if DokZAGS.Fld('ONA_VUS').AsBoolean then begin
       ds.Fld('FIO_ONA').AsString := ds.Fld('FIO_ONA').AsString+', ���������������';
     end;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ����������� ����� � ���������
function IZV_RBV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   fiop_on,fiop_ona,fio_on,fio_ona: String;      
   idVoenkom : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     idVoenkom:=0;
     if DokZAGS.Fld('ON_VUS').AsBoolean then begin
       if DokZAGS.Fld('ON_VOENKOM').AsString=''
         then idVoenkom:=ParamAsInteger('ID_VOENKOM')
         else idVoenkom:=DokZAGS.Fld('ON_VOENKOM').AsInteger;
     end;
     if DokZAGS.Fld('ONA_VUS').AsBoolean and (idVoenkom=0) then begin
       if DokZAGS.Fld('ONA_VOENKOM').AsString=''
         then idVoenkom:=ParamAsInteger('ID_VOENKOM')
         else idVoenkom:=DokZAGS.Fld('ONA_VOENKOM').AsInteger;
     end;
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       if idVoenkom>0
         then ds.Fld('KUDA').AsString := SeekValueSpr('SprVoenkom','ID',idVoenkom,'NAME');
     end else begin
       ds.Fld('KUDA').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('MJ_ON').AsString :=DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3);   
     ds.Fld('MJ_ONA').AsString :=DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3);   
     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP').AsString,'�','�');//DokZAGS.Fld('ON_FamiliaP').AsString;
     ds.Fld('ON_DATER').AsString :=DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ds.Fld('ONA_DATER').AsString:=DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
     if DokZAGS.Fld('ON_VUS').AsBoolean then begin
       ds.Fld('FIO_ON').AsString := ds.Fld('FIO_ON').AsString+', ���������������';
     end;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP').AsString,'�','�');//DokZAGS.Fld('ONA_FamiliaP').AsString;
     if DokZAGS.Fld('ONA_VUS').AsBoolean then begin
       ds.Fld('FIO_ONA').AsString := ds.Fld('FIO_ONA').AsString+', ���������������';
     end;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,2);
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� �� ������������ ��������� � ���������
function IZV_UO_VOEN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       s:=DokZAGS.Fld('ON_VOENKOM').AsString;
       if s='' then s:=ParamAsString('ID_VOENKOM');
       ds.Fld('VOENKOMAT').AsString := SeekValueSpr('SprVoenkom','ID',s,'NAME');
     end else begin
       ds.Fld('VOENKOMAT').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,3);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');

     ds.Fld('FIO_ON').AsString := GetPadegFIO(_FIO(DokZAGS,'ON_'),'�','�');//.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'�','�'); //DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;

     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('ONA_GOSUD,FNAME;ONA_OBL,;;;',1);     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;ONA_RAION,ONA_RNGOROD;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',1);
     ds.Fld('MESTOR2').AsString := DokZAGS.GetAdres('ON_GOSUD,FNAME;ON_OBL,;;;',1);     
     ds.Fld('MESTOR3').AsString := DokZAGS.GetAdres(';;ON_RAION,ON_RNGOROD;ON_GOROD,ON_B_GOROD;ON_GOROD_R,ON_*',1);
     ds.Fld('ON_DATER').AsString := DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ds.Fld('ONA_DATER').AsString := DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ������ � ���������
function IZV_SM_VOEN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       s:=DokZAGS.Fld('VOENKOM').AsString;
       if s='' then s:=ParamAsString('ID_VOENKOM');
       ds.Fld('VOENKOMAT').AsString := SeekValueSpr('SprVoenkom','ID',s,'NAME');
     end else begin
       ds.Fld('VOENKOMAT').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,3);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('GT_GOSUD,FName;GT_OBL,GT_B_OBL;;;',1)     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1)
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
    if DokZAGS.Fld('POL').AsString='�' then begin
      ds.Fld('Gr').AsString := '����������' ;
     end else begin
      ds.Fld('Gr').AsString := '���������' ;
     end;
     ds.Post;
   end;
end;

// ��������� � �������� � ���������
function IZV_R_VOEN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s:String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       s:=DokZAGS.Fld('ON_VOENKOM').AsString;
       if s='' then s:=ParamAsString('ID_VOENKOM');
       ds.Fld('VOENKOMAT').AsString := SeekValueSpr('SprVoenkom','ID',s,'NAME')
     end else begin
       ds.Fld('VOENKOMAT').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,3);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');

     ds.Fld('FIO_ON').AsString := GetPadegFIO(_FIO(DokZAGS,'ON_'),'�','�');//.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'�','�'); //DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;

     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('ONA_GOSUD,FNAME;ONA_OBL,;;;',1);     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;ONA_RAION;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',1);
     ds.Fld('MESTOR2').AsString := DokZAGS.GetAdres('ON_GOSUD,FNAME;ON_OBL,;;;',1);     
     ds.Fld('MESTOR3').AsString := DokZAGS.GetAdres(';;ON_RAION;ON_GOROD,ON_B_GOROD;ON_GOROD_R,ON_*',1);
     ds.Fld('ON_DATER').AsString := DatePropis(DokZAGS.Fld('ON_DATER').AsDateTime,3);
     ds.Fld('ONA_DATER').AsString := DatePropis(DokZAGS.Fld('ONA_DATER').AsDateTime,3);
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

//------------------------------------------------------------------------
// ��������� � ����������� ���� 
function IZV_RB(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('BRAK_ZAKL').AsString := DokZAGS.Fld('BRAK_ZAKL').AsString;
     if DokZAGS.Fld('BRAK_NOMER').AsString<>'' then begin
       ds.Fld('BRAK_ZAKL').AsString:=ds.Fld('BRAK_ZAKL').AsString+' '+DatePropis(DokZAGS.Fld('BRAK_DATE').AsDateTime,2)+' �� � '+DokZAGS.Fld('BRAK_NOMER').AsString;
     end;            
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

//------------------------------------------------------------------------
// ��������� � ���������� ������ ���� � ����������� ����� 
function IZV_RBD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   sIN,p,s,sp,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('ADRES_IZVECH').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
//     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('ORG').AsString := GetPadeg(ParamAsString('NAME'),'');
     ds.Fld('ORG2').AsString := DokZAGS.NameZAGS2('','�');

     ds.Fld('FIOP_ON').AsString:=GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString:=GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     if DokZAGS.ActiveON=true then begin 
       sp:='ON' ;
       p:='�';
     end else begin 
       sp:='ONA';
       p:='�';
     end;
     sIN:=DokZAGS.Fld(sp+'_IDENTIF').AsString;
     if sIN<>'' then begin
       ds.Fld('INN').AsString:='����������������� �����: ';
       ds.Fld('IN').AsString:=sIN+CRLF;
     end;
     ds.Fld('MJ').AsString:=DokZAGS.GetAdres(StringReplace('@_M_GOSUD,FName;@_M_OBL,@_M_B_OBL;@_M_RAION,@_M_RNGOROD;@_M_GOROD,@_M_B_GOROD;@_M_GOROD_R,ON_M_*','@',sp),1);
     ds.Fld('FIO1').AsString := GetPadegFIO3(DokZAGS.Fld(sp+'_Familia').AsString,DokZAGS.Fld(sp+'_Name').AsString,DokZAGS.Fld(sp+'_Otch').AsString,p,'�');
     ds.Fld('FIO2').AsString := DokZAGS.Fld(sp+'_FamiliaP').AsString;
     ds.Fld('VR').AsString:='';
     ds.Fld('MR').AsString:=DokZAGS.Fld(sp+'_WORK').AsString;
     ds.Fld('OBR').AsString:=ValueFromKey('KEY_OBRAZ',DokZags.Fld(sp+'_OBRAZ').Asstring,'',false);
     ds.Fld('KOL_BRAK').AsString:=DokZags.Fld(sp+'_SEM').AsString;
     if DokZAGS.Fld(sp+'_SUM_POSHLINA').AsFloat > 0
       then s:=MoneyToStr(DokZAGS.Fld(sp+'_SUM_POSHLINA').AsFloat,0,true)+' ���. '+DokZAGS.Fld(sp+'_POSHLINA').AsString
       else s:=DokZAGS.Fld(sp+'_POSHLINA').AsString;
     ds.Fld('POSH').AsString:=s;
     ds.Fld('PASP').AsString:=DokZAGS.GetPasport(StringReplace('DOC=@_DOKUMENT;TYPE=@_DOK_TYPE;SERIA=@_DOK_SERIA;NOMER=@_DOK_NOMER;DATE=@_DOK_DATE','@',sp),0);
     if DokZAGS.Fld(sp+'_SVID_NOMER').AsString<>'' then begin
       ds.Fld('SVID').AsString:=' ����� '+ DokZAGS.Fld(sp+'_SVID_SERIA').AsString+' � '+ DokZAGS.Fld(sp+'_SVID_NOMER').AsString+
                                ' �� '+DatePropis(DokZAGS.Fld(sp+'_SVID_DATE').AsDateTime,3)+'�.';
     end;
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

function IZV_RB1(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,0,11,false);
     ds.Fld('ADRESAT').AsString :=GetAdresat('ADRES_IZVECH');
     ds.Fld('TEKU_DATE').AsString  := DatePropis(NOW,TYPE_DATE_SPRAV);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('BRAK').AsString := DokZAGS.Fld('BRAK_ZAKL').AsString;
     if DokZAGS.Fld('BRAK_NOMER').AsString<>'' then begin
       ds.Fld('BRAK').AsString:=ds.Fld('BRAK').AsString+' '+DatePropis(DokZAGS.Fld('BRAK_DATE').AsDateTime,2)+' �� � '+DokZAGS.Fld('BRAK_NOMER').AsString+'.';
     end;            
{
     if DokZAGS.Fld('TYPE_RAST').AsInteger=0 then begin
       strOsnov:='������� ����  '+DokZAGS.Fld('SUD_NAME').AsString+' �� '+DatePropis(DokZAGS.Fld('SUD_DATE').AsDateTime,3);
     end else begin
       if Trim(DokZAGS.Fld('SUD_NAME').AsString)=''                      
         then strOsnov:='���������� ��������� �������� �� '+DatePropis(DokZAGS.Fld('SUD_DATE').AsDateTime,3)  
         else strOsnov:=DokZAGS.Fld('SUD_NAME').AsString+' �� '+DatePropis(DokZAGS.Fld('SUD_DATE').AsDateTime,3);
     end;              
}
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ����� ������ ���� � ��������
function SP_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� � ��������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ����� ������ ���� � ������
function SP_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� � ������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropisEX(DokZAGS.Fld('DATER').AsDateTime,6,DokZAGS.Fld('ONLYGOD_R').AsInteger);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ����� ������ ���� � ���������� �����
function SP_Brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� � ���������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ����� ������ ���� � ����������� �����
function SP_RastBrak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� � ����������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ����� ������ ���� �� ������������ ���������
function SP_UstOtc(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := Getadresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� �� ������������ ���������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ����� ������ ���� �� ����������� (����������)
function SP_Adopt(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     if DokZAGS.Fld('POL').AsString='�' then begin
      ds.Fld('O_HCEM').AsString :='������ ���� �� �����������'; 
     end else begin
      ds.Fld('O_HCEM').AsString :='������ ���� �� ����������'; 
     end;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DateR_Do').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');//
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ����� ������ ���� � �������� �����
function SP_ChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� � �������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
    ds.Post;
   end;
end;


// ���������� � �������� ���  
function Zakl(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('DATE').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);    
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('FIO').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIAdo').AsString,DokZAGS.Fld('NAMEdo').AsString,DokZAGS.Fld('OTCHdo').AsString,DokZAGS.Fld('POL').AsString,'�');
     if DokZAGS.Fld('POL').AsString='�' then begin
      ds.Fld('TEXT1').AsString :='�����������'; 
      ds.Fld('TEXT3').AsString :='��';
      if DokZAGS.Fld('V_OBAZAN').AsBoolean then begin
        ds.Fld('VOEN').AsString :='���������������';
       // ds.Fld('UCHET').AsString := SeekValueSpr('SprVoenkom','ID',DokZAGS.Fld('VOENKOM').AsString,'NAME');
        ds.Fld('UCHET').AsString := DokZAGS.Fld('V_WHO').AsString+'.';
      end else begin
        ds.Fld('VOEN').AsString :='�����������������';
      end; 
     end else begin  
      ds.Fld('TEXT1').AsString :='����������';
      ds.Fld('TEXT3').AsString :='���';        
       if DokZAGS.Fld('V_OBAZAN').AsBoolean then begin
        ds.Fld('VOEN').AsString :='���������������';
        // ds.Fld('UCHET').AsString := SeekValueSpr('SprVoenkom','ID',DokZAGS.Fld('VOENKOM').AsString,'NAME');
        ds.Fld('UCHET').AsString := DokZAGS.Fld('V_WHO').AsString+'.';
       end else begin
        ds.Fld('VOEN').AsString :='�����������������';
       end; 
      end;
     ds.Fld('VOEN').AsString := FirstCharUpper(ds.Fld('VOEN').AsString)+'.';
     if DokZAGS.Fld('FAMILIAdo').AsString<>DokZAGS.Fld('FAMILIAposle').AsString then begin
      ds.Fld('TEXT2').AsString :='�������';
      ds.Fld('OLD').AsString :=DokZAGS.Fld('FAMILIAdo').AsString;
      ds.Fld('NEW').AsString :=DokZAGS.Fld('FAMILIAposle').AsString;
     end;
     if DokZAGS.Fld('NAMEdo').AsString<>DokZAGS.Fld('NAMEposle').AsString then begin
      ds.Fld('TEXT2').AsString :='�����'; 
      ds.Fld('OLD').AsString :=DokZAGS.Fld('NAMEdo').AsString;
      ds.Fld('NEW').AsString :=DokZAGS.Fld('NAMEposle').AsString;
     end;
     if DokZAGS.Fld('OTCHdo').AsString<>DokZAGS.Fld('OTCHposle').AsString then begin
      ds.Fld('TEXT2').AsString :='��������'; 
      ds.Fld('OLD').AsString :=DokZAGS.Fld('OTCHdo').AsString;
      ds.Fld('NEW').AsString :=DokZAGS.Fld('OTCHposle').AsString;
     end;
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('GOSUD,FNAME;OBL,;RAION;GOROD,B_GOROD;',1);     
     ds.Fld('NOMER_AKT').AsString := DokZAGS.Fld('REG_NOMER').AsString;
     ds.Fld('DATE_AKT').AsString := DokZAGS.Fld('REG_DATE').AsString;
     ds.Fld('ORG_AKT').AsString :=  GetPadeg(DokZAGS.Fld('REG_ZAGS').AsString, '�');
  //   ds.Fld('NATION').AsString := DokZAGS.Fld('NATION').AsString;
     DokZags.Deti.First;
     s:='';
     while not DokZags.Deti.Eof do begin
       s:=s+DokZags.Deti.Fld('FAMILIA').AsString+' '+DokZags.Deti.Fld('NAME').AsString+' '+DokZags.Deti.Fld('OTCH').AsString+', '+DokZags.Deti.Fld('GOD_ROG').AsString+', ������ � '+DokZags.Deti.Fld('ZAGS_NOMER').AsString+' �� '+DokZags.Deti.Fld('ZAGS_DATE').AsString+', '+DokZags.Deti.Fld('ZAGS_NAME').AsString+'; ';
       DokZags.Deti.Next;
     end;
     DokZags.Deti.First;
     ds.Fld('DETI').AsString := s;
     if s='' then begin
       ds.Fld('TEXT_D').AsString :='����� �� �����.';
     end else begin
       ds.Fld('TEXT_D').AsString :='����:';
     end;
     if DokZAGS.Fld('SEM').AsString='1'
       then ds.Fld('SEM').AsString:='������� � �����'
       else ds.Fld('SEM').AsString:='�� ������� � �����';
     ds.Fld('ADRES').AsString := DokZAGS.GetAdres2('M_GOSUD,FName;M_OBL,M_B_OBL;M_RAION,;M_GOROD,M_B_GOROD;M_GOROD_R',3);
     ds.Fld('DOLG').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
   end;
end;

// ���������������� ������ � ����� ��������������� ������ ���� � ��������
function SP_ROGDV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='��������������� ������ ���� � ��������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ����� ��������������� ������ ���� � ������
function SP_SMERTV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='��������������� ������ ���� � ������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ����� ��������������� ������ ���� � ���������� �����
function SP_BrakV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='��������������� ������ ���� � ���������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
 //    ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
 //    ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� ������ ���� � ��������
function SP_VIP_ROGD(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� � ��������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� ������ ���� � ������
function SP_VIP_SMERT(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� � ������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropisEX(DokZAGS.Fld('DATER').AsDateTime,6,DokZAGS.Fld('ONLYGOD_R').AsInteger);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� ������ ���� � ���������� �����
function SP_VIP_Brak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� � ���������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� ������ ���� � ����������� �����
function SP_VIP_RastBrak(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� � ����������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� ������ ���� � �������� �����
function SP_VIP_ChName(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='������ ���� � �������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
    ds.Post;
   end;
end;

// ���������������� ������ � ������� ��������������� ������ ���� � ��������
function SP_VIP_ROGDV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='��������������� ������ ���� � ��������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� ��������������� ������ ���� � ������
function SP_VIP_SMERTV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='��������������� ������ ���� � ������';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������������� ������ � ������� ��������������� ������ ���� � ���������� �����
function SP_VIP_BrakV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;     
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('KOLON_N').AsString:=CreateKolonNPismo(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('ADRES_SOPR').AsString := GetAdresat('ADRES_SOPR');
     ds.Fld('O_HCEM').AsString :='��������������� ������ ���� � ���������� �����';
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
//     ds.Fld('DATER_on').AsString := DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
//     ds.Fld('DATER_ona').AsString := DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP_on').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ona').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
 //    ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
 //    ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� �� ��������� ��������
function IZV_IZM_D(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
//     ds.Fld('DOKV').AsString  := GetPadeg(DokZAGS.Fld('DOKUMENT').AsString,'�');
     ds.Fld('DOKV').AsString  := DokZAGS.Fld('IZMEN').AsString;
     ds.Fld('PrSm').AsString  := DokZAGS.Fld('PR_NEP_NAME').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

  // ������� � �������� (�������������) �� ���
function SprGKU(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds,spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      adr := LicSchet.Adres;
      strKomu := m.FIO;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('KomuT').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'�');
//     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;
     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);

     WritePodpis(ds,8);
  
     ds.Fld('TYPEHOUSE').AsString:=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,
                                    '������� ���');

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Prog').AsString := '���������' ;
        ds.Fld('Zarm').AsString := '���������������' ;
      end else begin
        ds.Fld('Prog').AsString := '���������' ;
        ds.Fld('Zarm').AsString := '����������������' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
   end;
end;
  // ������� � ��������� ����� ���������� 
function SprMGP(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('DATES').AsString := DatePropis(m.Fld('DATES').AsDateTime,6);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('@PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('@PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));

//     WritePodpis(ds,10);
     WritePodpis(ds, StrToInt(GetTemplateParam('PAR1')) );

     WriteMenToSpr(m,ds);
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);

     if ds.Fld('Zarm').AsString='���������' 
       then ds.Fld('Zarm').AsString:=GetNameAsPol('��������',m.Fld('POL').AsString)+' ('+GetNameAsPol('���������������',m.Fld('POL').AsString)+') �� ����� ����������';

//     ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'������� ���');
     ds.Fld('TYPEHOUSE').AsString:=GetPredst(LicSchet.Fld('PREDST').AsString,'������� ���','NAME2');

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;
     strNanim:='';
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
       end;
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='��������';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;
     ds.Post;
   end;
end;
  // ������� � ����� ����������� ������������� 
function SprMZR(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti, dsAktSm: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG, 
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   strNanim : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := LicSchet.Mens;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('DATES').AsString := DatePropis(m.Fld('DATES').AsDateTime,3);

     WritePodpis(ds,11);

     ds.Fld('SVID_NOMER').AsString := '           ';
     ds.Fld('SVID_DATE').AsString  := '           ';
     dsAktSm:= dmBase.GetDataSet('�����������');
     if (m.Fld('AKT_SMER_NOMER').AsString<>'') and not m.Fld('AKT_SMER_DATE').IsNull  then begin
     if dbLocate(dsAktSm,'NOMER;DATEZ',[m.Fld('AKT_SMER_NOMER').AsString,m.Fld('AKT_SMER_DATE').AsDateTime],'') then begin
       ds.Fld('SVID_NOMER').AsString :=dsAktSm.Fld('SVID_SERIA').AsString+' � '+dsAktSm.Fld('SVID_NOMER').AsString;
       ds.Fld('SVID_DATE').AsString  :=DatePropis(dsAktSm.Fld('DATESV').AsDateTime,3);
     end;
     end;
   end;
end;

// ������������� ���� ����������� �����
function PODTV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;      
   s,ss : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     if GetTemplateParam('PAR1')='ZV'   // ���� ���������
       then ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEB').AsDateTime,6)
       else ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');

     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       if DokZAGS.ActiveON = true  then s:='' else s:='A';
       ss:=GetPadegFIO3(DokZAGS.Fld('ON'+s+'_Familia').AsString,DokZAGS.Fld('ON'+s+'_Name').AsString,DokZAGS.Fld('ON'+s+'_Otch').AsString,'�','�');
       ds.Fld('ARX_ADRESAT').AsString:=ss+CRLF+DokZAGS.GetAdres2('ON'+s+'_M_GOSUD,FName;ON'+s+'_M_OBL,ON'+s+'_M_B_OBL;ON'+s+'_M_RAION,ON'+s+'_M_RNGOROD;ON'+s+'_M_GOROD,ON'+s+'_M_B_GOROD;ON'+s+'_M_GOROD_R,ON'+s+'_M_*',3);
     end else begin
       ds.Fld('ARX_ADRESAT').AsString:=DokZAGS.Fld('ARX_ADRESAT').AsString;
     end;
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Fld('TELEFON').AsString := ParamAsString('TELEFON');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Post;
   end;
end;
//--------------------------------------------------------------------
// ������������� ���� ����������� �����
function PODTVR(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;      
   s,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
 //    ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString; ���� �����������
     ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');
     if GetTemplateParam('PAR1')='ZV'   // ���� ���������
       then ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEB').AsDateTime,6)
       else ds.Fld('DATEZ').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;

     ds.Fld('TELEFON').AsString := ParamAsString('TELEFON');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Post;
   end;
end;
//--------------------------------------------------------------------
// ��������� � ������� ������������ ���� (�/� � ��������)
function IZV_Lishen(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds, spruch,dsDeti: TDataSet;
  s,ss,m,j : String;
  sPol:String;
  n:Integer;
begin
   result:=true;
   if (DokZAGS.Fld('ON_DATE_LR').AsString='') and (DokZAGS.Fld('ONA_DATE_LR').AsString='') then begin
     PutError('����� �� ��������� �� ����� ������������ ����.');
     result:=false;
   end;
   if not DokZAGS.Fld('ON_DATE_LR').IsNull and  not DokZAGS.Fld('ONA_DATE_LR').IsNull then begin
     if DokZAGS.Fld('ON_DATE_LR').AsString=DokZAGS.Fld('ONA_DATE_LR').AsString then begin
       n:=0;
     end else begin
  //   (qtWarning, qtError, qtInformation, qtConfirmation, qtCustom)
       n:=Question( '��� ����� ������������ ���� ?', '����;����;�����', '�����', 0, 2, qtConfirmation, 0);
       if n=3 then result:=false;
     end;
   end else if not DokZAGS.Fld('ON_DATE_LR').IsNull then begin
     n:=1;
   end else if not DokZAGS.Fld('ONA_DATE_LR').IsNull then begin
     n:=2;
   end;
   ds:=GetTemplateDataSet('MAIN');
   if (ds<>nil) and result then begin
     if n=1 then begin 
       sPol:='ON';
       ss:='����'; 
     end else if n=2 then begin
       sPol:='ONA';
       ss:='������'; 
     end else begin  // ��� ������ ����
       ss:='���� � ������';
       sPol:='ONA';
     end;
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString   := FU(GetPadeg(GlobalTask.ParamAsString('NAME'),'�'));
     ds.Fld('ORGAN_ZAGS_S').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIO').AsString := GetPadegFIO3(DokZAGS.Fld('Familia').AsString,DokZAGS.Fld('Name').AsString,DokZAGS.Fld('Otch').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('WHO').AsString:=ss;
     ds.Fld('SUD_NAME').AsString:=DokZAGS.Fld(sPol+'_SUD_LR').AsString;
     ds.Fld('SUD_DATE').AsString:=DatePropis(DokZAGS.Fld(sPol+'_SUDD_LR').AsDateTime,TYPE_DATE_IZV);
     ds.Fld('SILA_DATE').AsString:=DatePropis(DokZAGS.Fld(sPol+'_DATE_LR').AsDateTime,TYPE_DATE_IZV);

     if (DokZAGS.Fld('ARX_ADRESAT').AsString='')
       then ds.Fld('ADRES_IZVECH').AsString := ds.Fld('SUD_NAME').AsString
       else ds.Fld('ADRES_IZVECH').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;

     ds.Post;
   end;
end;

// ��������� � ���������� ���� (�/� � �����)
function IZV_RBBr(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,m,j : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if (DokZAGS.Fld('TYPE_RAST').AsInteger=2) or (DokZAGS.Fld('TYPE_RAST').AsInteger=4)
       then ds.Fld('ADRES_IZVECH').AsString := GetAdresat2('ADRES_IZVECH','SUDNAME',true,'��� ')
       else ds.Fld('ADRES_IZVECH').AsString := GetAdresat('ADRES_IZVECH');

     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     // 1-����������,�������   2-�����    NameZAGS('��','�')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('','�');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
//     ds.Fld('IZMEN').AsString := DokZAGS.Fld('IZMEN').AsString;
     ds.Fld('IZMEN').AsString :=Chr(13)+GetBrakRast(DokZAGS.getTable('Dokument'), '','','');
     if DokZAGS.Fld('ONA_FAM_R').AsString<>'' then begin
       ds.Fld('FIO_POSLE').AsString:='������� ����� ����������� �����: � ���� - '+DokZAGS.Fld('ON_FAM_R').AsString+', � �� - '+DokZAGS.Fld('ONA_FAM_R').AsString+'.' ;
     end;
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Fld('TELEFON').AsString := ParamAsString('TELEFON');
     ds.Post;
   end;
end;

// ��������� �� ������������ ��������� ��� ����������� �� ����� ������ ������
function IZV_Buh(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(0);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIOP').AsString  := GetPadegFIO3(DokZAGS.Fld('FAMILIADO').AsString,DokZAGS.Fld('NAMEDO').AsString,DokZAGS.Fld('OTCHDO').AsString,DokZAGS.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO(DokZAGS,'ONA_'),'�','�'); //.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres('ONA_GOSUD,FNAME;ONA_OBL,;;;',1);     
     ds.Fld('MESTOR1').AsString := DokZAGS.GetAdres(';;ONA_RAION,ONA_RNGOROD;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',1);
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ���������� � �������� �������� ��������
function ZAKL_SBV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds, spruch,dsDeti: TDataSet;
  nON,nONA:Integer;
  sON,sONA,sPAR:String;
  lGetON:Boolean;
  dBrak:TDateTime;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
//     if IDProg()='ZAGS'  then begin
      ds.Fld('TEMA').AsString := '����������' ;
//     end else begin
//      ds.Fld('TEMA').AsString := '������������' ;
//     end;
     if GetTemplateParam('PAR1')='1'
       then dBrak:=DokZAGS.Fld('DATEZ').AsDateTime
       else dBrak:=DokZAGS.Fld('DATEB').AsDateTime;   // ���� ����� � ���������
     nON:=GetCountYear(dBrak,DokZAGS.Fld('ON_DATER').AsDateTime);
     if nON<18 then sON:='�������������������'  else sON:='�����������������';
     nONA:=GetCountYear(dBrak,DokZAGS.Fld('ONA_DATER').AsDateTime);
     if nONA<18 then sONA:='������������������'  else sONA:='����������������';

     if (nON>=18) and (nONA>=18) then begin
         PutError('����� � ������� ����������������');
         result:=false;
     end else if (nON<18) and (nONA<18) then begin
        lGetON:=DokZAGS.ActiveON;
     end else if (nON<18) then begin
        lGetON:=true;
     end else begin
        lGetON:=false;
     end;

     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('GOROD').AsString := GlobalTask.ParamAsString('GOROD');
     ds.Fld('DATEZ').AsString := DatePropis(dBrak,3);
     ds.Fld('ORG').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'�');

     ds.Fld('JEN_ADR').AsString :=sON+' ������ '+GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�')+' '+
           DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6)+' ��������, ������������ �� ������: '+
           DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3);
     ds.Fld('NEV_ADR').AsString :=sONA+' ������� '+GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�')+' '+
           DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6)+' ��������, ����������� �� ������: '+
           DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3);

     If lGetON=true  then begin
       ds.Fld('POL').AsString :='�������������������';
       ds.Fld('NEVJEN').AsString :='�����'; 
       ds.Fld('NEVJEN3').AsString :='������������������� ������'; 
       ds.Fld('ONONA').AsString :='���';
       ds.Fld('DATER').AsString :=DatePropis(DokZAGS.Fld('ON_DateR').AsDateTime,6);
       ds.Fld('FIOP').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia').AsString,DokZAGS.Fld('ON_Name').AsString,DokZAGS.Fld('ON_Otch').AsString,'�','�');
       ds.Fld('PASPORT').AsString := DokZAGS.GetPasport('DOC=ON_DOKUMENT;TYPE=ON_DOK_TYPE;SERIA=ON_DOK_SERIA;NOMER=ON_DOK_NOMER;DATE=ON_DOK_DATE',0);
       ds.Fld('ISPOL').AsString := DokZAGS.VozrastPropisON(0);
       ds.Fld('SNIJV').AsString := DokZAGS.VozrastPropisON(1);
     end else begin 
       ds.Fld('POL').AsString :='������������������';
       ds.Fld('NEVJEN').AsString :='�������'; 
       ds.Fld('NEVJEN3').AsString :='������������������ �������'; 
       ds.Fld('ONONA').AsString :='��';
       ds.Fld('DATER').AsString :=DatePropis(DokZAGS.Fld('ONA_DateR').AsDateTime,6);
       ds.Fld('FIOP').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia').AsString,DokZAGS.Fld('ONA_Name').AsString,DokZAGS.Fld('ONA_Otch').AsString,'�','�');
       ds.Fld('PASPORT').AsString := DokZAGS.GetPasport('DOC=ONA_DOKUMENT;TYPE=ONA_DOK_TYPE;SERIA=ONA_DOK_SERIA;NOMER=ONA_DOK_NOMER;DATE=ONA_DOK_DATE',0);
       ds.Fld('ISPOL').AsString := DokZAGS.VozrastPropisONA(0);
       ds.Fld('SNIJV').AsString := DokZAGS.VozrastPropisONA(1);
     end; 
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('DOLG_RUK_ZAGS1').AsString :=Zags_Sprav_Dolg;
      ds.Fld('DOLG_RUK_ZAGS1').AsString :=AnsiLowerCase(Copy(ds.Fld('DOLG_RUK_ZAGS1').AsString,1,1))+Copy(ds.Fld('DOLG_RUK_ZAGS1').AsString,2,300);
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ����������� ������ �� ������� ����
function Soob_Sud(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
// ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
//     ds.Fld('DOKV').AsString  := GetPadeg(DokZAGS.Fld('DOKUMENT').AsString,'�');
     ds.Fld('DOKV').AsString  := DokZAGS.Fld('DOKUMENT').AsString;
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('####');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�');
//     ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('���_����');
//     ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
      ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
      ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

// ��������� � ����������� ������ ������������ ���������� 
function Soob_In(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,sPol,d,v,k: String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
    if (DokZAGS.Fld('GRAG').AsString='112') or (DokZAGS.Fld('GRAG').AsInteger>990 ) then begin 
        PutError(' ��������� �������� ������ ��� ����������� �������!');
       result:=false;
       exit;
    end;
      if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME');
     s:='';
     if ParamAsBoolean('SOOB_IN_ADRES') then begin
       s:='����� ��������: '+DokZAGS.GetAdres2('RG_GOSUD,FNAME;+RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;',1)+chr(13);     
       s:=s+'����� ����������: '+DokZAGS.GetAdres('GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD;GT_GOROD_R,GT_*',1)+chr(13);
     end;
     ds.Fld('ARX_ADRESAT').AsString :=GetAdresat('$MID');
     ds.Fld('DATEZ').AsString := DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     sPol:=DokZAGS.Fld('POL').AsString;
     ds.Fld('GRAG').AsString := GetNameAsPol('����������',sPol)+' '+SeekValueSpr('��������','ID',DokZAGS.Fld('GRAG').AsString,'GNAME');
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA').AsString,DokZAGS.Fld('NAME').AsString,DokZAGS.Fld('OTCH').AsString,DokZAGS.Fld('POL').AsString,'�')+'.';
     if not DokZAGS.Fld('DATER').IsNull
       then ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+chr(13)+'���� �������� '+ DatePropis(DokZAGS.Fld('DATER').AsDateTime,6);
     if not DokZAGS.Fld('DATES').IsNull
       then ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+chr(13)+'���� ������ '+ DatePropis(DokZAGS.Fld('DATES').AsDateTime,6);

     ds.Fld('ADD_TEXT').AsString:=s;
     if DokZAGS.Fld('SDAN_DOK').AsString<>'' then begin
       if DokZAGS.Fld('IS_SDAN_DOK').AsBoolean then k:='���� ��������: ' else k:='��������: ';
       ds.Fld('ADD_TEXT').AsString:=ds.Fld('ADD_TEXT').AsString+k+DokZAGS.Fld('SDAN_DOK').AsString+'.'+chr(13)
     end;
     ds.Fld('ADD_TEXT').AsString:=ds.Fld('ADD_TEXT').AsString+'���������: '+DokZAGS.Fld('DECL').AsString+'.';

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_Dolg;
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIO;
     ds.Post;
   end;
end;

  // ������� � ����� ���������� � ������� ����� (�������)
function SprMGSch(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   strNanim,strYear : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := Men;
     adr := Men.Adres;
     strKomu := m.FIO;
     strYear:='';
     if m.Fld('DATER').AsString<>'' then begin
       strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+' �.�.';
     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Fld('Familia').AsString,m.Fld('Name').AsString,m.Fld('Otch').AsString,m.Fld('POL').AsString,'�')+strYear;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('NAME_DATER').AsString := '��� ��������';
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));

     WritePodpis(ds,17);

     WriteMenToSpr(m,ds);

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     m.First;
     nn:=0;
     strNanim:='';
     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     s:='��������';
     strGR:=CheckOwners(adr,s,strSobstv,strNanim);
     ds.Fld('TYPESOBSTV').AsString:=strGR+addWordKv(adr);
     ds.Fld('NANIM').AsString:=s+' '+strSobstv;
     ds.Post;
   end;
end;

  // ������� � ����� ���������� (�������)
function SprMGch(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := Men;
      adr := Men.Adres;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));

     WritePodpis(ds,18);

     WriteMenToSpr(m,ds);

     ds.Post;
   end;
end;

// ������� � ��������� (� ��������� ���������) ������� ����. + ������� (�� 1 ��������)
function SpxNalLS(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k,i,pu: String;
   m : TMens;
   adr : TAdresLic;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh :String;
   strNanim,strYear : String;
   nnn : Extended;
   fld:TField;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := LicSchet.Mens;
     adr := LicSchet.Adres;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�'); 
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'�');
     if m.Fld('PASP_NOMER').AsString='' then begin
       ds.Fld('PPP_TEXT').AsString :='---';
     end else begin
       ps:= m.Fld('PASP_SERIA').AsString;
       d:= m.Fld('PASP_NOMER').AsString;
       v:= GetPadeg(m.Fld('PASP_VIDAN').AsString,'�');
       k:= DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
       ds.Fld('PPP_TEXT').AsString := ps+d+' ����� '+k+' '+v;
     end; 
     if m.Fld('Lich_Nomer').AsString='' then begin
       ds.Fld('PPP_TEXT2').AsString :='';
     end else begin
       i:= m.Fld('Lich_Nomer').AsString;
       ds.Fld('PPP_TEXT2').AsString := ', ����������������� ����� '+i;
     end; 
     ds.Fld('Adres').AsString := adr.GetAdres;
     ds.Fld('AdresMG').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     if m.Fld('POL').AsString='�' then begin
        ds.Fld('ON').AsString := '���' ;
      end else begin
        ds.Fld('ON').AsString := '��' ;
      end;
     fld:=LicSchet.Fld('VSEGO');
     if fld<>nil then begin
       nnn := fld.AsFloat-LicSchet.Fld('POSTR').AsFloat;  // ������������ -LicSchet.Fld('PRIUSAD').AsFloat;
       if nnn>0  then ds.Fld('VSEGO').AsString := FormatFloat('####0.####',nnn)+'��';
     end;
     fld:=ds.FindField('DOLG_PODP1');
     if fld=nil then begin  // ��� ������
       if ParamAsString('����������')='' then begin
         ds.Fld('FIO_RUK').AsString := FIORukov();
       end else begin
         ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       end; 
     end else begin        // ��� ���� ���������
       WritePodpis(ds,5);
     end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         nn:=nn+1;
         ds.Append;
         ds.Fld('NN').AsString  := IntToStr(nn)+'.';
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('Adres').AsString := adr.GetAdres;
         ds.Fld('AdresMG').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

  // ������� � ��������� (� ��������� ���������) �������
function SpxNal(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k,i: String;
   m : TMens;
   adr : TAdresLic;
   nnn : Extended;
   s,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
      m := Men;
      adr := Men.Adres;
      strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     if m.Fld('PASP_NOMER').AsString='' then begin
       ds.Fld('PPP_TEXT').AsString :='---';
     end else begin
       ps:= m.Fld('PASP_SERIA').AsString;
       d:= m.Fld('PASP_NOMER').AsString;
       v:= GetPadeg(m.Fld('PASP_VIDAN').AsString,'�');
       k:= DatePropis(m.Fld('PASP_DATE').AsDateTime,3);
       ds.Fld('PPP_TEXT').AsString := ps+d+' ����� '+k+' '+v;
     end; 
     if m.Fld('Lich_Nomer').AsString='' then begin
       ds.Fld('PPP_TEXT2').AsString :='';
     end else begin
       i:= m.Fld('Lich_Nomer').AsString;
       ds.Fld('PPP_TEXT2').AsString := ', ����������������� ����� '+i;
     end; 
     ds.Fld('Adres').AsString := adr.GetAdres;
//     ds.Fld('Adres').AsString:=dmBase.AdresFromID(DateFiks,m.Fld('ADRES_ID').AsString,false);
//     nnn:=dmBase.ReadPropAsFloat(DateFiks, m.Fld('ADRES_ID').AsInteger, 'PLOSH_UCH');
//     if nnn>0  then ds.Fld('VSEGO').AsString := FormatFloat('####0.####',nnn)+'��';
     ds.Fld('AdresMG').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     if m.Fld('POL').AsString='�' then begin
        ds.Fld('ON').AsString := '���' ;
      end else begin
        ds.Fld('ON').AsString := '��' ;
      end;
     WritePodpis(ds,16);

     ds.Post;
   end;
end;

  // �������� ���, �������� ����������, �������� ����������, �������� �������� ������ ������
function POV_vus(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds:TDataSet;
   strGr,ps,par1: String;
   m : TMens;
   adr : TAdresLic;
   nPr : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := Men;
     adr := Men.Adres;
     strGR:='';
     par1:=GetTemplateParam('PAR1');   // 1-��������    3-�������� ����������    2-�������� ����������  4-�������� �������� ������ ������
     if par1='3' then nPr:=9 else if par1='2' then nPr:=2; 
     ds.Fld('PRIL').AsString:=getPril(-1,'VOEN_PRIP',nPr);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'�');
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+', '+FirstCharUpper(Raion_Name('�'))+'.';  // +', '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('Work2Adres').AsString := Men.getWorkEx('ADRES');
     if Men.Fld('PRIZ').AsBoolean
       then ds.Fld('ZVAN').AsString := '���������'
       else ds.Fld('ZVAN').AsString := ValueFromKey('KEY_VUS_ZVANI',Men.Fld('ZVAN').AsString,'',false);
     ds.Fld('Zvan_Komu').AsString := ds.Fld('ZVAN').AsString+' '+ds.Fld('Komu').AsString;
     ds.Fld('POST_IND').AsString := GlobalTask.ParamAsString('POST_IND');
     ds.Fld('POST_ADRES').AsString := GlobalTask.ParamAsString('POST_ADRES');
     ds.Post;
   end;
end;
// ������� ��� ����������� ����� �� ������������ ������          (���)
function SprPKU(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strGrag,strJit,strErr,strEG,strAdres,strSobstv,strGR, strPlosh, strYear : String;
   nID : Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     m := Men;
     adr := Men.Adres;
     strYear:='';
     if m.Fld('DATER').AsString<>'' then begin
       strYear := ', '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+'�.�.';
     end;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GetShtampSpr();
     if m.Fld('POL').AsString='�' then begin
       ds.Fld('Grag').AsString := '����������';
       ds.Fld('Jit').AsString := '������������';
       ds.Fld('Zarm').AsString := '���������';
     end else begin
       ds.Fld('Grag').AsString := '���������';
       ds.Fld('Jit').AsString := '�����������';
       ds.Fld('Zarm').AsString := '����������';
     end;
     ds.Fld('DATEP').AsString:=DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO3(m.Familia,m.Name,m.Otch,m.Fld('POL').AsString,'�')+strYear;
//     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�')+strYear;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('Adres_Prop').AsString := m.Fld('ADRES_PROP').AsString;

     WritePodpis(ds,1);

//     WriteMenToSpr(m,ds);
     ds.Post;
   end;
end;

//=== ���������� 06 ��������� ������� ============================================================
{$IFDEF OBR_GRAG}
procedure drAddField(var S: string; Delimeter: string; Field: TField);
begin
   if not Field.IsNull then begin
      S:=S+Delimeter+Field.AsString;
   end;
end;

procedure drAddString(var S: string; Delimeter, AddS: string);
begin
   if S='' then begin
      S:=AddS;
   end
   else if AddS<>'' then begin
      S:=S+Delimeter+AddS;
   end;
end;

function dcIffNull(Field: TField; NullValue: string): string;
begin
   if Field.IsNull then begin
      Result:=NullValue;
   end
   else begin
      Result:=Field.AsString;
   end;
end;
//------------------------------------
function DocMainGetTemplate: string;
begin
   //����� ��� ��� (�� ������������� �1786 �� 30.12.2011)
   if ParamAsBoolean('DR_VID_RKK') then begin
      case Doc2Tpl.Field('SIGN_KIND').AsInteger of
         skUL: Result:='DOC_MAIN_RKK_UL';
         skMan, skIP: Result:='DOC_MAIN_RKK_MAN';
      else
         Result:='';
      end;
   end
   //������ ��� ���
   else begin
      case Doc2Tpl.Field('APP_FORM').AsInteger of
         stWriting,stElect: Result:='DOC_MAIN_RKK_2';
         stVerbal: Result:='DOC_MAIN_RKK_4';
      else
         Result:='';
      end;
   end;
end;

//��� ���������.doc
//��� �����.doc
function DOC_MAIN_RKK_1(DateFiks: TDateTime; LicID, PID: Word): Boolean;
var
   ds: TDataSet;
   CheckOut: Boolean;
   S: string;
   DocWork,SprName: string;
   dsWork: TDataSet;
   dsWorkTable: TDataSet;
begin
   Result:=True;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
      if not ds.Active then begin
         ds.Open;
      end;
      ds.Edit;
      //1. � (��������������� ������)
      ds.FieldByName('REG_IND').AsString:=Doc2Tpl.Field('REG_IND').AsString;
      //2. �������, ���, ��������
      ds.FieldByName('SIGN_NAME').AsString:=Doc2Tpl.Field('SIGN_NAME').AsString;
      //3. ����� ����� ���������� � (���) ������, ���������� �������
      ds.FieldByName('ADR_TEXT').AsString:=Doc2Tpl.Field('ADR_TEXT').AsString;
      if ParamAsBoolean('DR_VID_RKK') then begin
         S:=Trim(Doc2Tpl.Field('ADR_NOTE').AsString);
         if S<>'' then begin
            ds.FieldByName('ADR_TEXT').AsString:=ds.FieldByName('ADR_TEXT').AsString+', '+Doc2Tpl.Field('ADR_NOTE').AsString;
         end;
      end;
      S:=Trim(Doc2Tpl.Field('ADR_PHONE').AsString);
      if S<>'' then begin
         ds.FieldByName('ADR_PHONE').AsString:=', ���. '+Doc2Tpl.Field('ADR_PHONE').AsString;
      end;
      //����� ������ ���������
      if ParamAsBoolean('DR_VID_RKK') then begin
         ds.FieldByName('APP_FORM').AsString:=Doc2Tpl.PickName('APP_FORM', 'O');;
      end;
      //4. ���� �����������
      ds.FieldByName('REG_DATE').AsString:=Doc2Tpl.Field('REG_DATE').AsString;
      //5. ���������� ������ ���������
      ds.FieldByName('NUM_LIST').AsString:=Doc2Tpl.Field('NUM_LIST').AsString;
      //6. ���������� ������ ����������
      ds.FieldByName('NUM_APP').AsString:=Doc2Tpl.Field('NUM_APP').AsString;
      //   ���� ����������� ���������
      ds.FieldByName('IDEN_DATE').AsString:=Doc2Tpl.Field('IDEN_DATE').AsString;
      //   ���������� ����������� ���������
      ds.FieldByName('IDEN_TEXT').AsString:=Doc2Tpl.Field('IDEN_TEXT').AsString;
      //7. ����, ������� ��������� ���������
      if Doc2Tpl.Field('IS_REPEAT').AsBoolean then begin
         ds.FieldByName('REPEAT_TEXT').AsString:=Doc2Tpl.Field('REPEAT_TEXT').AsString;
      end;
      //8. �������������, ���� � ������ ����������������� ������ 
      ds.FieldByName('COVER_CORR').AsString:=Doc2Tpl.FromSpr('COVER_CORR', 'FNAME', '=');
      ds.FieldByName('COVER_DATE').AsString:=Doc2Tpl.Field('COVER_DATE').AsString;
      ds.FieldByName('COVER_IND').AsString:=Doc2Tpl.Field('COVER_IND').AsString;
      //9. ��������
      {+}
      if Doc2Tpl.Field('SUBJ_ID').AsInteger<10000 then SprName:='SP_SUBJ' else SprName:='SP_SUBJG';
      ds.FieldByName('SUBJ_ID').AsString:=Doc2Tpl.FromSpr2('SUBJ_ID', SprName, 'CODE', '=')+' '+Doc2Tpl.FromSpr2('SUBJ_ID', SprName, 'NAME', '=');
// ����     ds.FieldByName('SUBJ_ID').AsString:=Doc2Tpl.FromSpr('SUBJ_ID', 'NAME', '=');

      //10. ����������
      ds.FieldByName('CONTENT').AsString:=Doc2Tpl.Field('CONTENT').AsString;
      //11. ���������
      ds.FieldByName('RES_TEXT').AsString:=Doc2Tpl.Field('RES_TEXT').AsString;
      //--2011.08.11: ds.FieldByName('RES_MAN').AsString:=Doc2Tpl.FromSpr('RES_MAN', 'POST', 'O')+' '+Doc2Tpl.FromSpr('RES_MAN', 'FIO', '=');
      ds.FieldByName('RES_MAN').AsString:=Doc2Tpl.FromSpr('RES_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('RES_MAN', 'FIO', '=');
      ds.FieldByName('RES_DATE').AsString:=Doc2Tpl.Field('RES_DATE').AsString;
      //12. �����������
      //--2011.08.11: ds.FieldByName('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'POST', 'L')+' '+Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');
      ds.FieldByName('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');
      if ParamAsBoolean('DR_VID_RKK') 
        then ds.FieldByName('EXEC_TERM2').AsString:=Doc2Tpl.Field('EXEC_TERM2').AsString;
      //13. �������� ��������� �� ����������
      ds.FieldByName('EXEC_ORG').AsString:=Doc2Tpl.FromSpr('EXEC_ORG', 'FNAME', '=');
      //14. ���� �����������
      ds.FieldByName('EXEC_DATE').AsString:=Doc2Tpl.Field('EXEC_DATE').AsString;
      //15. ���� ����������
      ds.FieldByName('EXEC_TERM').AsString:=Doc2Tpl.Field('EXEC_TERM').AsString;
      //16. ���� ����������
      ds.FieldByName('EXEC_FACT').AsString:=Doc2Tpl.Field('EXEC_FACT').AsString;
      //17. ��� ������������ - NB: ???
      dsWork:=Doc2Tpl.DataSet('DOC_WORK');
      //17.1 ���������� ������
      DocWork:='';
      if dsWork<>nil then begin
         dsWork.DisableControls;
         dsWork.First;
         while not dsWork.Eof do begin
            S:=dsWork.FieldByName('OUT_NOTE').AsString;
            drAddField(S, ' �� ', dsWork.FieldByName('OUT_DATE'));
            drAddField(S, ' � ', dsWork.FieldByName('OUT_IND'));
            drAddField(S, '. ', dsWork.FieldByName('IN_NOTE'));
            drAddField(S, ' �� ', dsWork.FieldByName('IN_DATE'));
            drAddField(S, ' � ', dsWork.FieldByName('IN_IND'));
            drAddString(DocWork, '. ', S);
            dsWork.Next;
         end;
         dsWork.EnableControls;
      end;
      ds.FieldByName('DOC_WORK').AsString:=DocWork;
      //17.2 ���������� �������
      dsWorkTable:=GetTemplateDataSet('WORK_TABLE');
      if (dsWorkTable<>nil) and (dsWork<>nil) then begin
         dsWork.DisableControls;
         dsWork.First;
         while not dsWork.Eof do begin
            dsWorkTable.Append;
            dsWorkTable.FieldByName('OUT_NOTE').AsString:=dcIffNull(dsWork.FieldByName('OUT_NOTE'), '') ;
            dsWorkTable.FieldByName('OUT_DATE').AsString:=dcIffNull(dsWork.FieldByName('OUT_DATE'), '') ;
            dsWorkTable.FieldByName('OUT_IND').AsString:=dcIffNull(dsWork.FieldByName('OUT_IND'), '') ;
            dsWorkTable.FieldByName('IN_NOTE').AsString:=dcIffNull(dsWork.FieldByName('IN_NOTE'), '') ;
            dsWorkTable.FieldByName('IN_DATE').AsString:=dcIffNull(dsWork.FieldByName('IN_DATE'), '') ;
            dsWorkTable.FieldByName('IN_IND').AsString:=dcIffNull(dsWork.FieldByName('IN_IND'), '') ;
            dsWorkTable.Post;
            dsWork.Next;
         end;
         dsWork.EnableControls;
      end;
      //18. ������� � ������ ����������� � ��� ���������� - // NB: ???
      ds.FieldByName('ORDER_TEXT').AsString:=Doc2Tpl.Field('ORDER_TEXT').AsString;
      ds.FieldByName('ORDER_ORG').AsString:=Doc2Tpl.FromSpr('ORDER_ORG', 'FNAME', '=');
      ds.FieldByName('ORDER_DATE').AsString:=Doc2Tpl.Field('ORDER_DATE').AsString;
      if not Doc2Tpl.Field('ORDER_FACT').IsNull then begin  
         ds.FieldByName('ORDER_FACT').AsString:='. ������� ����� '+Doc2Tpl.Field('ORDER_FACT').AsString;
      end;
      //19. ��������� ������������ ��������� (� � ���� ������)
      ds.FieldByName('ANS_IND').AsString:=Doc2Tpl.Field('ANS_IND').AsString;
      ds.FieldByName('ANS_DATE').AsString:=Doc2Tpl.Field('ANS_DATE').AsString;
      ds.FieldByName('ANS_KIND').AsString:=Doc2Tpl.PickName('ANS_KIND', 'F');
      ds.FieldByName('ANS_TEXT').AsString:=Doc2Tpl.Field('ANS_TEXT').AsString;
      if ParamAsBoolean('DR_VID_RKK') 
        then ds.FieldByName('ANS_VISIT').AsString:=Doc2Tpl.Field('ANS_VISIT').AsString;

      //20. ������� � ������ � ��������
      CheckOut:=Doc2Tpl.Field('CHECK_OUT').AsBoolean;
      if CheckOut then begin
         ds.FieldByName('CHECK_OUT').AsString:='��������� ����� � ��������';
         //--2011.08.11: ds.FieldByName('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'POST', 'O')+' '+Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '=');
         ds.FieldByName('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '=');
         ds.FieldByName('CHECK_DATE').AsString:=Doc2Tpl.Field('CHECK_DATE').AsString;
      end;
      //21. �������� ������ � ����
      ds.FieldByName('FILE_ID').AsString:=Doc2Tpl.FromSpr('FILE_ID', 'FILE_IND', '=');
      if Doc2Tpl.Field('FILE_LIST').AsString<>'' then begin
         ds.FieldByName('FILE_LIST').AsString:=Doc2Tpl.Field('FILE_LIST').AsString;
      end
      else begin
         ds.FieldByName('FILE_LIST').AsString:='     ';
      end;
      //105. ������� � ������ ������
      //--2011.08.11: ds.FieldByName('VISIT_MAN').AsString:=Doc2Tpl.FromSpr('VISIT_MAN', 'POST', 'L')+' '+Doc2Tpl.FromSpr('VISIT_MAN', 'FIO', '=');
      ds.FieldByName('VISIT_MAN').AsString:=Doc2Tpl.FromSpr('VISIT_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('VISIT_MAN', 'FIO', '=');
      ds.Post;
   end;
end;

//��� ��.doc
function ADM_PROC_RKK_1(DateFiks: TDateTime; LicID, PID: Word): Boolean;
var
   ds: TDataSet;
   dsWork: TDataSet;
   S,sID: string;
   DocWork: string;
   SprName: string;
begin
   Result:=True;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
      if not ds.Active then begin
         ds.Open;
      end;
      ds.Edit;
      //1. ��������������� ������
      ds.FieldByName('REG_IND').AsString:=Doc2Tpl.Field('REG_IND').AsString;
      //2. �������, ����������� ���, ��������, ����� ���������� (����� ����������) ���������� ��� ������������ � ����� ���������� ������������ ����, ���������� �������
      if Doc2Tpl.Field('SIGN_KIND').AsInteger=1 then begin
         ds.FieldByName('SIGN_KIND').AsString:='�������, ����������� ���, �������� ����� ���������� (����� ����������) ����������, ���������� �������';
      end
      else begin
         ds.FieldByName('SIGN_KIND').AsString:='������������ � ����� ���������� ������������ ����, ���������� �������';
      end;
      ds.FieldByName('SIGN_NAME').AsString:=Doc2Tpl.Field('SIGN_NAME').AsString;
      ds.FieldByName('ADR_TEXT').AsString:=Doc2Tpl.Field('ADR_TEXT').AsString;
      S:=Trim(Doc2Tpl.Field('ADR_PHONE').AsString);
      if S<>'' then begin
         ds.FieldByName('ADR_PHONE').AsString:=', ���. '+Doc2Tpl.Field('ADR_PHONE').AsString;
      end;
//      sID:=Doc2Tpl.Field('SIGN_MAN').AsString;
//  
    if (Doc2Tpl.Field('SIGN_KIND').AsInteger=1) and ParamAsBoolean('DR_RKK_PASP') then
        ds.FieldByName('SIGN_NAME').AsString:=ds.FieldByName('SIGN_NAME').AsString+', '+
           dmBase.GetMenPaspV(Doc2Tpl.Field('PROV_TYPE').AsInteger, Doc2Tpl.Field('PROV_SER').AsString, Doc2Tpl.Field('PROV_NUM').AsString, 
                       Doc2Tpl.Field('PROV_ORG').AsString, Doc2Tpl.Field('PERSON_ID').AsString, Doc2Tpl.Field('PROV_DATE').AsDateTime, 0);
//GetMenPaspV(UdostKod:Integer; Seria,Nomer,Organ,LichNomer : String;  DateV : TDateTime; nType:Integer): String', CallMethod, NAME_LIB_MEN, '������� ���������� ������');

      //3. ����� ������ ���������
      ds.FieldByName('APP_FORM').AsString:=Doc2Tpl.PickName('APP_FORM', 'O');
      //4. ���� ������ ���������
      ds.FieldByName('REG_DATE').AsString:=Doc2Tpl.Field('REG_DATE').AsString;
      //5. ���������� ������ ���������
      ds.FieldByName('NUM_LIST').AsString:=Doc2Tpl.Field('NUM_LIST').AsString;
      //6. ���������� ������ ���������� � (���) ��������, �������������� ���������������� �����
      ds.FieldByName('NUM_APP').AsString:=Doc2Tpl.Field('NUM_APP').AsString;
      //7. ����, ������� <*> ��������� ���������
      //if Doc2Tpl.ParamAsBoolean('DR_PRINT_IND') then begin
      //   ds.FieldByName('REPEAT').AsString:='����, ������� ��������� ���������';
      //end
      //else begin
      //   ds.FieldByName('REPEAT').AsString:='���� ��������� ���������';
      //end;
      if Doc2Tpl.Field('IS_REPEAT').AsBoolean then begin
         ds.FieldByName('REPEAT_TEXT').AsString:=Doc2Tpl.Field('REPEAT_TEXT').AsString;
      end;
      //8. ������������ ���������������� ���������
      {+}
      SprName:='SP_ADMPROC2';
      if Doc2Tpl.Field('ADM_PROC').AsString='' then begin
         if Doc2Tpl.Field('SIGN_KIND').AsInteger=2 then SprName:='SP_ADMPROC_U2';
      end
      else if Doc2Tpl.Field('ADM_PROC').AsInteger>10000 then SprName:='SP_ADMPROC_U2';
      ds.FieldByName('ADM_PROC').AsString:=Doc2Tpl.FromSpr2('ADM_PROC', SprName, 'PROC_NO', '=')+' '+Doc2Tpl.FromSpr2('ADM_PROC', SprName, 'FULL_NAME', '=');
      {+}
      //9. �����������
      //--2011.08.11: ds.FieldByName('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'POST', 'L')+' '+Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');
      ds.FieldByName('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');
      //10. ���� ����������
      ds.FieldByName('EXEC_TERM').AsString:=Doc2Tpl.Field('EXEC_TERM').AsString;
      //11. ��� ������������ - NB: ???
      dsWork:=Doc2Tpl.DataSet('DOC_WORK');
      //11.1 ���������� ������
      DocWork:='';
      if dsWork<>nil then begin
         dsWork.DisableControls;
         dsWork.First;
         while not dsWork.Eof do begin
            S:=dsWork.FieldByName('OUT_NOTE').AsString;
            drAddField(S, ' �� ', dsWork.FieldByName('OUT_DATE'));
            drAddField(S, ' � ', dsWork.FieldByName('OUT_IND'));
            drAddField(S, '. ', dsWork.FieldByName('IN_NOTE'));
            drAddField(S, ' �� ', dsWork.FieldByName('IN_DATE'));
            drAddField(S, ' � ', dsWork.FieldByName('IN_IND'));
            drAddString(DocWork, '. ', S);
            dsWork.Next;
         end;
         dsWork.EnableControls;
      end;
      ds.FieldByName('DOC_WORK').AsString:=DocWork;
      //12. ������� � ����������� ��������� � ��������������� �������������� ����� � ����������� �� ���� ����������������� ����
      ds.FieldByName('EXEC_ORG').AsString:=Doc2Tpl.FromSpr('EXEC_ORG', 'FNAME', '=');
      ds.FieldByName('EXEC_DATE').AsString:=Doc2Tpl.Field('EXEC_DATE').AsString;
      //13. ���� � ����� ��������� ����������������� �������
      ds.FieldByName('ANS_DATE').AsString:=Doc2Tpl.Field('ANS_DATE').AsString;
      if Trim(Doc2Tpl.Field('ANS_IND').AsString)<>'' then begin
         ds.FieldByName('ANS_IND').AsString:='�'+Doc2Tpl.Field('ANS_IND').AsString;
      end;
      //14. ��������� ��������� ����������������� �������
      ds.FieldByName('ANS_KIND').AsString:=Doc2Tpl.PickName('ANS_KIND', 'F');
      if Trim(Doc2Tpl.Field('ANS_TEXT').AsString)<>'' then begin
         ds.FieldByName('ANS_TEXT').AsString:='. '+Doc2Tpl.Field('ANS_TEXT').AsString;
      end;
      //15. ������� �� ����������� ����������������� ���� � �������� ���������������� �������
      ds.FieldByName('DELIV_KIND').AsString:=Doc2Tpl.PickName('DELIV_KIND', 'O');
      ds.FieldByName('RES_DATE').AsString:=Doc2Tpl.Field('RES_DATE').AsString;
      //16. ������� � ������ � ��������
      if Doc2Tpl.Field('CHECK_OUT').AsBoolean then begin
         ds.FieldByName('CHECK_OUT').AsString:='��������� ����� � ��������';
         //--2011.08.11: ds.FieldByName('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'POST', 'O')+' '+Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '=');
         ds.FieldByName('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '=');
         ds.FieldByName('CHECK_DATE').AsString:=Doc2Tpl.Field('CHECK_DATE').AsString;
      end;
      //17. �������� ������ � ���� N _____ _____ �.
      if Doc2Tpl.Field('IN_FILE').AsBoolean then begin
         ds.FieldByName('FILE_ID').AsString:=Doc2Tpl.FromSpr('FILE_ID', 'FILE_IND', '=');
      end;
      ds.Post;
   end;
end;

//��� �������� �4 �1.doc
//��� �������� �4 �2.doc
//��� �������� �4 �3.doc
//��� �������� �5.doc
function IN_DOC_RKK_1(DateFiks: TDateTime; LicID, PID: Word): Boolean;
var
   ds: TDataSet;
   dsWork: TDataSet;
   S: string;
   DocWork: string;
begin
   Result:=True;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
      if not ds.Active then begin
         ds.Open;
      end;
      ds.Edit;
      //1. ���� ����������
      //   ������������� ���� (�����, �����, ���), � ������� �������� ������ ���� ��������
      //   ��� ����������� ���������� ������������� ��������� ������������ ���� ���������� ������
      ds.Fld('EXEC_TERM').AsString:=Doc2Tpl.Field('EXEC_TERM').AsString;
      //2. �������� ���� ���������
      //   ����������� � ������������ � ��������� ���� ��������������� ���������
      //   ��� ����������� ����� ����� �� �����������
      if Doc2Tpl.Field('DOC_KIND').AsInteger<>6 {dk6} then begin
         ds.Fld('DOC_KIND').AsString:=Doc2Tpl.PickName('DOC_KIND', 'O');
      end;
      //3. ����� (�������������)
      //   ��� ����������� ������������ ��������� ������������ ������������ ����������� - ������ ���������
      //   ��� ����������� ���������� ��������� ������������ ������������ �����������-��������������
      //   ����������� ���������� ������������ ������������ �����������
      ds.Fld('SIGN_ORG').AsString:=Doc2Tpl.FromSpr('SIGN_ORG', 'NAME', '=');
      //4. ���� � ������ �����������
      //   ����������� ��� ����������� ��������� ���������
      //   ������������ ���� � ������, ����������� ��������� ������������-�����������
      //   ����������� �� ���������������� ������ �������� ����������
      ds.Fld('REG_DATE').AsString:=Doc2Tpl.Field('REG_DATE').AsString;
      ds.Fld('REG_IND').AsString:=Doc2Tpl.Field('REG_IND').AsString;
      //5. ���� � ������ ���������
      //   ������������ ���� � ������, ����������� ��������� ������������-�������
      //   ����������� � ��������� ��� ���������� ���������
      ds.Fld('DOC_DATE').AsString:=Doc2Tpl.Field('DOC_DATE').AsString;
      ds.Fld('DOC_IND').AsString:=Doc2Tpl.Field('DOC_IND').AsString;
      //6. ��������� (������� ����������)
      //   ����������� ���������, ���������������� �� ���������
      ds.Fld('CONTENT').AsString:=Doc2Tpl.Field('CONTENT').AsString;
      //7. ��������� ��� ���� ��������� ��������
      //   ����������� ����� ��������� ������������
      ds.Fld('RES_TEXT').AsString:=Doc2Tpl.Field('RES_TEXT').AsString;
      if not Doc2Tpl.Field('RES_MAN').IsNull then begin
         ds.Fld('RES_MAN').AsString:=Doc2Tpl.FromSpr('RES_MAN', 'POST', '=')+' '+Doc2Tpl.FromSpr('RES_MAN', 'FIO', '=');
         ds.Fld('RES_DATE').AsString:=Doc2Tpl.Field('RES_DATE').AsString;
      end;
      //8. ������� �� ���������� ���������
      //   ������ ������������ ������� ������� �� ��������, ���� � ������ ���������-������
      //??? EXEC_FACT - ���� ����������
      ds.Fld('ANS_TEXT').AsString:=Doc2Tpl.Field('ANS_TEXT').AsString;
      if Trim(Doc2Tpl.Field('ANS_IND').AsString)<>'' then begin
         ds.Fld('ANS_DATE').AsString:='����������� ����� �� '+Doc2Tpl.Field('ANS_DATE').AsString;
         ds.Fld('ANS_IND').AsString:='� '+Doc2Tpl.Field('ANS_IND').AsString;
      end;
      //9. ����������� �������
      //???
      //10. ���� �
      //    ������������� ������ ����, � ������� ������� �������� ����� ���������� � ������������ � ������������� ���
      if Doc2Tpl.Field('IN_FILE').AsBoolean then begin
         ds.Fld('FILE_ID').AsString:=Doc2Tpl.FromSpr('FILE_ID', 'FILE_IND', '=');
      end;

      //� �/� - ���������� ��������������� �����, ����������� ��������� ��� ���������
      ds.Fld('REG_NUM').AsString:=Doc2Tpl.Field('REG_NUM').AsString;
      //������ �������� - ������ �������� ���������: �����, ����, mailgov (����������� ����� ����������), email (����������� �����), ��������, ������
      ds.Fld('DELIV_KIND').AsString:=Doc2Tpl.PickName('DELIV_KIND', 'O');
      //�������� - ������� � ��������� ����, ������������ �������� (���� ���������)
      ds.Fld('SIGN_NAME').AsString:=Doc2Tpl.Field('SIGN_NAME').AsString;
      //����� �� ��������� � - ����� �� ��������� ��������: ��������������� ������ ���������
      ds.Fld('REQ_IND').AsString:=Doc2Tpl.Field('REQ_IND').AsString;
      //�� - ����� �� ��������� ��������: ���� ����������� ���������
      ds.Fld('REQ_DATE').AsString:=Doc2Tpl.Field('REQ_DATE').AsString;
      //������ - ���������� ������ ���������
      ds.Fld('NUM_LIST').AsString:=Doc2Tpl.Field('NUM_LIST').AsString;
      //���������� - ���������� ����������, ���������� ������ ����������
      ds.Fld('NUM_APP').AsString:=Doc2Tpl.Field('NUM_APP').AsString;
      //����������� - ������� �����������, �������������� ��������
      ds.Fld('ADR_NOTE').AsString:=Doc2Tpl.Field('ADR_NOTE').AsString;
      //������� - ����� ���������� �������� �����������, �������������� ��������
      ds.Fld('ADR_PHONE').AsString:=Doc2Tpl.Field('ADR_PHONE').AsString;
      //�������� - ������������ �������, � ������� ������� ����� ������� ���������� ���������
      ds.Fld('SUBJ_ID').AsString:=Doc2Tpl.FromSpr('SUBJ_ID', 'NAME', '=');
      //���� ��������� - ����������� ����, �������� ��������� ��������
      ds.Fld('REQ_TEXT').AsString:=Doc2Tpl.Field('REQ_TEXT').AsString;
      //����������� - ����������� ����, ��������� � ��������� (���������� "����������� ����")
      ds.Fld('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');
      //�����������
      ds.Fld('EXEC_MENS').AsString:= Doc2Tpl.Field('IDEN_TEXT').AsString;
      //���� ���������� - ���� ������������ ����������
      ds.Fld('EXEC_FACT').AsString:= Doc2Tpl.Field('EXEC_FACT').AsString;
      //�������� - ������� � ���������� �� ��������
      ds.Fld('REQ_CHECK').AsString:=Doc2Tpl.PickName('REQ_CHECK', 'O');
      //���� � �������� - ������� � ������ � ��������
      if Doc2Tpl.Field('CHECK_OUT').AsBoolean then begin
         ds.Fld('CHECK_OUT').AsString:='���� � ��������';
      end;
      //���� ������ - ���� ������ � ��������
      ds.Fld('CHECK_DATE').AsString:=Doc2Tpl.Field('CHECK_DATE').AsString;
      //������ ������� � ������ - ����������� ����, ��������� ������� � ������ ��������� � �������� (���������� "����������� ����")
      ds.Fld('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '=');
      //����� - ������� ����� ������������, � ������� ��������� ��������� (���������� "����� ����������").
      ds.Fld('FOLDER_ID').AsString:=Doc2Tpl.FromSpr('FOLDER_ID', 'NAME', '=');
      //������ - ������ ���������� (���������� "������ ����������")
      ds.Fld('GROUP_ID').AsString:=Doc2Tpl.FromSpr('GROUP_ID', 'NAME', '=');

      ds.Post;
   end;
end;

//��� ��������� �4 �1.doc
//��� ��������� �4 �2.doc
//��� ��������� �4 �3.doc
//��� ��������� �5.doc
function OUT_DOC_RKK_1(DateFiks: TDateTime; LicID, PID: Word): Boolean;
var
   ds: TDataSet;
   dsWork: TDataSet;
   S: string;
   DocWork: string;
begin
   Result:=True;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
      if not ds.Active then begin
         ds.Open;
      end;
      ds.Edit;
      //1. ���� ����������
      //   ������������� ���� (�����, �����, ���), � ������� �������� ������ ���� ��������
      //   ��� ����������� ���������� ������������� ��������� ������������ ���� ���������� ������
      if not Doc2Tpl.Field('EXEC_TERM').IsNull then begin
         ds.Fld('EXEC_TERM').AsString:=Doc2Tpl.Field('EXEC_TERM').AsString;
      end;
      //2. �������� ���� ���������
      //   ����������� � ������������ � ��������� ���� ��������������� ���������
      //   ��� ����������� ����� ����� �� �����������
      if Doc2Tpl.Field('DOC_KIND').AsInteger<>6 {dk6} then begin
         ds.Fld('DOC_KIND').AsString:=Doc2Tpl.PickName('DOC_KIND', 'O');
      end;
      //3. ����� (�������������)
      //   ��� ����������� ������������ ��������� ������������ ������������ ����������� - ������ ���������
      //   ��� ����������� ���������� ��������� ������������ ������������ �����������-��������������
      //   ����������� ���������� ������������ ������������ �����������
      ds.Fld('SIGN_ORG').AsString:=Doc2Tpl.FromSpr('SIGN_ORG', 'NAME', '=');
      //4. ���� � ������ �����������
      //   ����������� ��� ����������� ��������� ���������
      //   ������������ ���� � ������, ����������� ��������� ������������-�����������
      //   ����������� �� ���������������� ������ �������� ����������
      //   -
      //5. ���� � ������ ���������
      //   ������������ ���� � ������, ����������� ��������� ������������-�������
      //   ����������� � ��������� ��� ���������� ���������
      ds.Fld('REG_DATE').AsString:=Doc2Tpl.Field('REG_DATE').AsString;
      ds.Fld('REG_IND').AsString:=Doc2Tpl.Field('REG_IND').AsString;
      //6. ��������� (������� ����������)
      //   ����������� ���������, ���������������� �� ���������
      ds.Fld('CONTENT').AsString:=Doc2Tpl.Field('CONTENT').AsString;
      //7. ��������� ��� ���� ��������� ��������
      //   ����������� ����� ��������� ������������
      //ds.Fld('SIGN_NAME').AsString:=Doc2Tpl.Field('SIGN_NAME').AsString;
      //8. ������� �� ���������� ���������
      //   ������ ������������ ������� ������� �� ��������, ���� � ������ ���������-������
      //??? EXEC_FACT - ���� ����������
      ds.Fld('ANS_TEXT').AsString:=Doc2Tpl.Field('ANS_TEXT').AsString;
      if Trim(Doc2Tpl.Field('ANS_IND').AsString)<>'' then begin
         ds.Fld('ANS_DATE').AsString:='������� ����� �� '+Doc2Tpl.Field('ANS_DATE').AsString;
         ds.Fld('ANS_IND').AsString:='� '+Doc2Tpl.Field('ANS_IND').AsString;
      end;
      //9. ����������� �������
      //???
      //10. ���� �
      //    ������������� ������ ����, � ������� ������� �������� ����� ���������� � ������������ � ������������� ���
      if Doc2Tpl.Field('IN_FILE').AsBoolean then begin
         ds.Fld('FILE_ID').AsString:=Doc2Tpl.FromSpr('FILE_ID', 'FILE_IND', '=');
      end;
      ds.Fld('REG_NUM').AsString:=Doc2Tpl.Field('REG_NUM').AsString; //� �/� - ���������� ��������������� �����, ����������� ��������� ��� ���������
      ds.Fld('DELIV_KIND').AsString:=Doc2Tpl.PickName('DELIV_KIND', 'O'); //������ �������� - ������ �������� ���������: �����, ����, mailgov (����������� ����� ����������), email (����������� �����), ��������, ������
      ds.Fld('SIGN_NAME').AsString:=Doc2Tpl.Field('SIGN_NAME').AsString; //���� ���������
      ds.Fld('SIGN_ORGS').AsString:= Doc2Tpl.Field('IDEN_TEXT').AsString;  //���. �������.
      ds.Fld('REQ_IND').AsString:=Doc2Tpl.Field('REQ_IND').AsString; //����� �� ��������� � - ����� �� ��������� ��������: ��������������� ������ ���������
      ds.Fld('REQ_DATE').AsString:=Doc2Tpl.Field('REQ_DATE').AsString;  //�� - ����� �� ��������� ��������: ���� ����������� ���������
      ds.Fld('NUM_LIST').AsString:=Doc2Tpl.Field('NUM_LIST').AsString; //������ - ���������� ������ ���������
      ds.Fld('NUM_APP').AsString:=Doc2Tpl.Field('NUM_APP').AsString; //���������� - ���������� ����������, ���������� ������ ����������
      ds.Fld('EXEC_MAN').AsString:=Doc2Tpl.FromSpr('EXEC_MAN', 'FIO', '=');//����������� - ����������� ����, ��������� � ��������� (���������� "����������� ����")
      ds.Fld('RES_MAN').AsString:=Doc2Tpl.FromSpr('RES_MAN', 'FIO', '=');  //�������� (���������� "����������� ����")
      ds.Fld('SUBJ_ID').AsString:=Doc2Tpl.FromSpr('SUBJ_ID', 'NAME', '='); //�������� - ������������ �������
      ds.Fld('EXEC_DATE').AsString:=Doc2Tpl.Field('EXEC_DATE').AsString;   // ���� ����������
      ds.Fld('EXEC_FACT').AsString:=Doc2Tpl.Field('EXEC_FACT').AsString;   // ���� ����������
      ds.Fld('REQ_CHECK').AsString:=Doc2Tpl.PickName('REQ_CHECK', 'O'); //�������� - ������� � ���������� �� ��������
      if Doc2Tpl.Field('CHECK_OUT').AsBoolean then   //���� � �������� - ������� � ������ � ��������
         ds.Fld('CHECK_OUT').AsString:='���� � ��������';
      ds.Fld('CHECK_DATE').AsString:=Doc2Tpl.Field('CHECK_DATE').AsString;  //���� ������ - ���� ������ � ��������
      ds.Fld('CHECK_MAN').AsString:=Doc2Tpl.FromSpr('CHECK_MAN', 'FIO', '='); //������ ������� � ������ ("����������� ����")
      ds.Fld('FOLDER_ID').AsString:=Doc2Tpl.FromSpr('FOLDER_ID', 'NAME', '='); //����� - ������� ����� ������������, � ������� ��������� ��������� (���������� "����� ����������").
      ds.Fld('GROUP_ID').AsString:=Doc2Tpl.FromSpr('GROUP_ID', 'NAME', '='); //������ - ������ ���������� (���������� "������ ����������")

      ds.Post;
   end;
end;

{$ENDIF}


