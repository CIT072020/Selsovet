//{$DEFINE ADD_NOT_IN}

program Main;
var
  idConn, idConnShared, TypeBASE : String;
//  idTmpConn : String;
  nVersion, nVerBase : Integer;
  lCheckLicPresent, lCheckPrichSm, lCheckPerevod, lCheckIsporSvid : Boolean;
  arrCheck : array[0..50] of Boolean;
  ds1,CurDS : TDataSet;
  //��� ������������� ���
  sFieldVUS : String;
  dsVUS : TDataSet;
  lCheckOtnosh:Boolean;
  sTmpWHERE:String;
  lCheckOchered1:Boolean;
  _resh:TReshOchMen;
//  curMen:TMens;
const
  PENS_G='55';  //���������� ������� ������
  PENS_M='60';  //���������� ������� ������
  strType_Lich = '2';
  strType_Adres= '1';
  defGrag = 112;
  az_brak    = '5';
  az_rogd    = '6';
  az_smert   = '7';
  az_ustotc  = '8';
  az_ustmat  = '18';
  az_rast    = '11';
  az_adopt   = '12';
  az_chname  = '13';
  datecursostS='1899-12-30';
  datecursostF='18991230';
  BEZ_ADRESA  = 3; //  ������� �� ��������� � �� ��������������� (�����)

  MESTO_GIT=1;
  MESTO_PREB=0;
  MESTO_NOTREG=2;
  IZM_MEN=2;     // �������� ������ � ��������   
  NOT_DVIG=3;    // �� ���������                 

  SHAMP_=1;
  SHAMP_GERB=2;

  MAX_OCHERED=4;   //  ������. ����� ������� (�������)

  OCH_RESH_POST=1;
  OCH_RESH_VOST=2;
  OCH_RESH_RAZD=3;
  OCH_RESH_PERE=4;
  OCH_RESH_UNION=5;
  OCH_RESH_SN=9;
  OCH_RESH_ADDMEN=6;
  OCH_RESH_ISKMEN=7;
  OCH_RESH_PERENOS=8;

  OCH_RESID_OBSH=1;    // residence=���������

  OCH_TYPE_OBSH=0;   // ����� �����
  OCH_TYPE_MNOGO=1;
  OCH_TYPE_SOCIAL=2; // ���������� �����
  OCH_TYPE_VOEN=3;
  OCH_TYPE_UCH=4;

  OCH_TYPE_ANY_OTD=1000; // ����� ���������

  OCH_OSN_FULL=1;   // ������ ������������
  OCH_OSN_FULL2=6;   // ������ ������������ + ������������ �����
  OCH_OSN_KRAT=2;   // ������� + ������������ �����
  OCH_OSN_UKAZ=3;   // ����� + ������������ �����
  OCH_OSN_POLOG=4;  // ����� + ���������
  OCH_OSN_PUNKT=5;  // ������ ����� ������

 VID_OPEKA_DO14 =1; // ����� �� 14 ���
 VID_OPEKA_NOT  =2; // ����� ��� ��������������
 VID_POPECH_DO18=101; // �������. �� 18 ���
 VID_POPECH_NOT =102; // �������. ��� ��������������
 CHILD_SIROTA =1;   // ������
 CHILD_POPECH =2;   // ��� ���������
 FORMA_GOSUD=1;     // ���������������
 FORMA_OPEKA=2;     // ���������� �����
 FORMA_PRIEM=3;     // �������� �����
 FORMA_HOUSE=4;     // ������� ��� ��������� ����
 FORMA_DEREV=5;     // ������� �������

{$DEFINE OBR_GRAG}
//{$DEFINE OCHERED}
//{$DEFINE CHECK_ATE}

// ����������� �������� ��� ���������������� �����
{$DEFINE ADD_PU}

{$I load.pas}
{$I template.pas}
{$I template_b.pas}
{$I ochered.pas}
{$I minsk.pas}
{$I reports.pas}
{$I update.pas}
{$I obrabotka.pas}
{$I export.pas}
{$I excel.pas}
{$I zags.pas}
{$I pu.pas}
{$I personal.pas}

//--------------------------------------------------------------------
procedure InitScript;
begin
//  Showmessage(GetPadegNominative('�������� �������� ����������'));
  lCheckOtnosh:=ParamAsBoolean('CHECK_OTNOSH');
  _resh:=TReshOchMen.Create;
//  curMen:=TMens.Create;
  SetNameExcel('Excel.Application');
  sFieldVUS:='';
  CreateReportTable('ZAGS',true);
  CreateReportTable('DOC_QREP',true);
  if IDProg()='SELSOVET' then begin
    CreateReportTable('GRUP',true);
  end;
  idConnShared:=dbRegisterConnect('AdsSharedConnection','CHARTYPE=ANSI;TABLETYPE=ADT');
  idConn:=dbRegisterConnect('AdsConnection','CHARTYPE=ANSI;TABLETYPE=ADT');

  TypeBASE:=GlobalTask.GetWorkParam('TYPEBASE');
  if TypeBASE='' then TypeBASE:='SELSOVET';
//  ShowMessage('*'+TypeBase+'*');
//  ShowMessage(GetPadegIF('����� ����','��������', '�', '�'));
//  XL:=GetOfficeObject('Excel',lOk);
//  if lOk then begin
//    ShowMessage('Ok!');
//    XL.WorkBooks.Add;
//    XL.Visible:=true;
//    XL:=null;
//  end;

{
  m:=TMens.Create;
  if m.Read(54) then begin

    ShowMessage('"'+m.Fld('AC_RESH').asString+'" '+m.Fld('FAMILIA').asString+' '+m.Fld('NAME').asString+' '+m.Fld('OTCH').asString+chr(13)+m.adres.getadres);
  end;
  m.Free;
}
 // SeekValueSpr('������������','ID','11','NAME');

//  ShowMessage('����� ���� ����������� ������������'+Chr(13)+Chr(10)+GetPadeg('����� ���� ����������� ������������','�'));
//  if OkWarning('11111111'+Chr(13)+'2222222222222222222222222') then
//    ShowMessage('OK');
//  ShowMessage(dmBase.getBelNazv(2,false,'����������'));
end;

//--------------------------------------------------------------------
procedure ExitScript;
//var
//  WordDoc: Variant;
begin
  _resh.Free;
//  curMen.Free;
//  WordDoc := CreateOleObject('Word.Application');
//  WordDoc.Visible := True;
end;

procedure AfterUpdateParams;
begin
  lCheckOtnosh:=ParamAsBoolean('CHECK_OTNOSH');
end;

function CheckNameUl(strName : String): String;
var
  sl : TStringList;
  i : Integer;
begin
  sl := TStringList.Create;
  StrToStrings(strName, sl, ' ');
  if sl.Count=1 then begin
    Result := FirstUpper(strName);
  end else begin
    Result := FirstUpper(sl[0]);
    for i:=1 to sl.Count-1 do begin
      if Copy(sl.Strings[i],1,1)='"' 
        then  Result := Result + ' ' + sl[i]
        else  Result := Result + ' ' + ANSILowerCase(sl[i]);
    end;
  end;
  sl.Free;
end;

//-------------------------------------------------------------------------
procedure FirstLoadTerr;
var
  dsUL_Nal, dsUL, dsSour, dsDest : TDataSet;
  strTerr, strAdd : String;
begin
  dsSour := dbGetDataSet('dmBase.tbAdres');
  if dsSour.RecordCount>0 then begin
    ShowMessage(' ���� ������� ������ ���� ����� ! ');
  end else begin
  strTerr := GlobalTask.ParamAsString('KOD');
  if dbSetCurrentConnect(idConn) then begin
    SetScreenCursor('HOURCLASS');
    dsSour:=dbOpenSQL('SELECT kod,name,typepunkt,id FROM SysSpr.�������� ORDER BY KOD','');
//    dsSour:=dbOpenSQL('SELECT kod, name FROM SysSpr.�������� WHERE SUBSTRING(kod,1,7)='+''''+Copy(GlobalTask.ParamAsString('�����'),1,7)+''''+
//             ' and SUBSTRING(kod,8,3)<>'+''''+'000'+'''','');

//    dsSour := dbGetDataSet('dmBase.SprSoato');
    if dsSour<>nil then begin
//      if IdProg()='GKH' then begin

//      end else begin
        if Copy(strTerr,2,1)='4' then begin // ������� ����� + ���. ����� ����. ���. ������
          dsSour.Filter := 'kod='+''''+Copy(strTerr,1,4)+'000000'+''''+ ' or '+
           '(substr(kod,1,4)='+''''+Copy(strTerr,1,4)+''''+' and substr(kod,5,3)>'+''''+'500'+''''+
           ' and !Empty(typepunkt) )';
//where substring(kod,1,7)=:par+'000' or
// (substring(kod,1,4)=:par and substring(kod,5,3)>'500' and typepunkt is not null)
        end else begin
          if Copy(strTerr,5,1)='7' then begin // ���������� �����
            dsSour.Filter := 'SUBSTR(kod,1,7)='+''''+Copy(strTerr,1,7)+''''+
                             ' and SUBSTR(kod,8,3)<>'+''''+'000'+''''+
                             ' or kod='+QStr(Copy(strTerr,1,4)+'5'+Copy(strTerr,6,5));
          end else if Copy(strTerr,5,1)='5' then begin // ��������� �����
            dsSour.Filter := 'SUBSTR(kod,1,7)='+''''+Copy(strTerr,1,7)+'''';
          end else begin
            dsSour.Filter := 'SUBSTR(kod,1,7)='+''''+Copy(strTerr,1,7)+''''+
                             ' and SUBSTR(kod,8,3)<>'+''''+'000'+'''';
          end;
        end;
//      end;
      dsSour.Filtered := true;
      dsDest := dbGetDataSet('dmBase.SprPunkt');
      if dsDest<>nil then begin
        if dbExecuteSQL('DELETE FROM �������������') then begin
//        if dbZap(dsDest) then begin
          while not dsSour.Eof do begin
            dsDest.Append;
            dsDest.Fld('SOATO').AsString := dsSour.Fld('KOD').AsString;
            dsDest.Fld('NAME').AsString  := dsSour.Fld('NAME').AsString;
            dsDest.Fld('TYPEPUNKT').AsString := dsSour.Fld('TYPEPUNKT').AsString;
            dsDest.Fld('KOD').AsString   := dsSour.Fld('ID').AsString;
            dsDest.Post;
            dsSour.Next;
          end;
        end else begin
          RestScreenCursor;
          ShowMessage(dbLastError());
        end;
      end;
      dsDest.First;
      dsSour.Filtered := false;
//      dbClose(dsSour);
    end else begin
      RestScreenCursor;
      ShowMessage(dbLastError());
    end;
    if Copy(strTerr,5,1)='7' 
      then strAdd := ' or soato='+QStr(Copy(strTerr,1,4)+'5'+Copy(strTerr,6,5)) // ���������� �����
      else strAdd := '';
    dsUL_Nal:=dbOpenSQL('SELECT distinct name,tip FROM SysSpr.SprUlNal WHERE SUBSTRING(soato,1,7)='+''''+Copy(strTerr,1,7)+''''+ strAdd + ' ORDER BY name','');
    if dsUL_Nal<>nil then begin
      dsUL   := dbGetDataSet('dmBase.SprUL');
      if dsUL<>nil then begin
        if dbExecuteSQL('DELETE FROM �������') then begin
//        if dbZap(dsUL) then begin
          while not dsUL_Nal.Eof do begin
            dsUL.Append;
            dsUL.Fld('NAME').AsString:=CheckNameUl(dsUL_Nal.Fld('NAME').AsString);
            dsUL.Fld('TIP').AsString     := dsUL_Nal.Fld('TIP').AsString;
            dsUL.Post;
            dsUL_NAL.Next;
          end;
        end else begin
          RestScreenCursor;
          ShowMessage(dbLastError());
        end;
      end;
      dbClose(dsUL_Nal);
    end;
    dbClose(dsSour);
    RestScreenCursor;
  end else begin
    ShowMessage('�� ��������� Connect '+idConn);
  end;
  end;
end;

//-------------------------------------------------------------------------
procedure CheckKodSoatoSprPunkt;
var
  dsSOATO,dsSprNP,dsSOVET : TDataSet;
  lOk,lErr:Boolean;
begin
  dsSOATO := dbGetDataSet('dmBase.SprSoato');
  dsSprNP := dbGetDataSet('dmBase.SprPunkt');
  dsSprNP.First;
  lErr:=false;
  dsSOVET:=dbOpenSQL('SELECT kod,name,typepunkt,id FROM SysSpr.�������� WHERE SUBSTRING(kod,1,7)='+''''+Copy(GlobalTask.ParamAsString('KOD'),1,7)+'''','');
  while not dsSprNP.Eof do begin
    lOk:=true;
    if (dsSprNP.Fld('KOD').AsString='') or (dsSprNP.Fld('SOATO').AsString='') then begin
      lOk:=false;
    end;
    if lOk then begin
      if not dbLocate(dsSOATO,'ID',[dsSprNP.Fld('KOD').AsString],'') then begin
        lOk:=false;
      end else begin
        if dsSprNP.Fld('SOATO').AsString<>dsSOATO.Fld('KOD').AsString then begin
          lOk:=false;
        end;
      end;
    end;
    if not lOk then begin
      dsSOVET.Filter:='name='+''''+dsSprNP.Fld('NAME').AsString+'''';
      dsSOVET.Filtered:=true;
      if not dsSOVET.Eof then begin
        dsSOVET.Next;  
        if dsSOVET.Eof then begin // �������� ��� ������ ���� ������
          dsSOVET.First;
          dsSprNP.Edit;
          dsSprNP.Fld('SOATO').AsString:=dsSOVET.Fld('KOD').AsString;
          dsSprNP.Fld('KOD').AsString:=dsSOVET.Fld('ID').AsString;
          dsSprNP.Fld('TYPEPUNKT').AsString:=dsSOVET.Fld('TYPEPUNKT').AsString;
          dsSprNP.Post;
        end;
      end else begin
        lErr:=true;
        dsSprNP.Edit;
        dsSprNP.Fld('SOATO').AsString:='';
        dsSprNP.Fld('KOD').AsString:='';
        dsSprNP.Post;
      end;
      dsSOVET.Filtered:=false;
    end;
    dsSprNP.Next;
  end;
  dbClose(dsSOVET);
  dsSprNP.First;
  if lErr then PutError('���������� ������.')
          else ShowMessage('������ �� ����������.');
end;

//--------------------------------------------------------------------------------
procedure FirstLoadUL;
var
  dsUL_Nal, dsUL, dsTip,dsSour, dsDest : TDataSet;
  strTerr, strAdd : String;
begin
  strTerr:=GlobalTask.ParamAsString('KOD');
  strAdd:='';
  if dbSetCurrentConnect(idConn) then begin
    SetScreenCursor('HOURCLASS');
    if Copy(strTerr,1,1)='5' then begin // �����
      dsUL_Nal:=dbOpenSQL('SELECT distinct name,tip FROM SysSpr.SprUlNal WHERE SUBSTRING(soato,1,1)='+''''+Copy(strTerr,1,1)+''''+ strAdd + ' ORDER BY name','');
    end else begin
      if (Copy(strTerr,5,3)='000') or (Copy(strTerr,2,1)='4') // ����� ���������� ����������
        then dsUL_Nal:=dbOpenSQL('SELECT distinct name,tip FROM SysSpr.SprUlNal WHERE SUBSTRING(soato,1,4)='+''''+Copy(strTerr,1,4)+''''+ strAdd + ' ORDER BY name','')
        else dsUL_Nal:=dbOpenSQL('SELECT distinct name,tip FROM SysSpr.SprUlNal WHERE SUBSTRING(soato,1,7)='+''''+Copy(strTerr,1,7)+''''+ strAdd + ' ORDER BY name','');
    end;
    if dsUL_Nal<>nil then begin
      dsUL   := dbGetDataSet('dmBase.SprUL');
      if dsUL<>nil then begin
        if dbExecuteSQL('DELETE FROM �������') then begin
//        if dbZap(dsUL) then begin
          while not dsUL_Nal.Eof do begin
            dsUL.Append;
            if ParamAsBoolean('AKT_UPPER') then begin   // ������� ������ � ������� ��������
              dsUL.Fld('NAME').AsString:=ANSIUpperCase(dsUL_Nal.Fld('NAME').AsString);
            end else begin
              dsUL.Fld('NAME').AsString:=CheckNameUl(dsUL_Nal.Fld('NAME').AsString);
            end;
            dsUL.Fld('TIP').AsString     := dsUL_Nal.Fld('TIP').AsString;
            dsUL.Post;
            dsUL_NAL.Next;
          end;
          if ParamAsBoolean('AKT_UPPER') then begin   // ������� ������ � ������� ��������
            dsTip:=dbGetDataSet('dmBase.SprTypeUL');
            dsTip.First;
            while not dsTip.Eof do begin
              dsTip.Edit;
              dsTip.Fld('NAME').AsString:=ANSIUpperCase(dsTip.Fld('NAME').AsString);
              dsTip.Fld('FNAME').AsString:=ANSIUpperCase(dsTip.Fld('FNAME').AsString);
              dsTip.Post;
              dsTip.Next;
            end;
            dsTip.First;
          end;
        end else begin
          RestScreenCursor;
          ShowMessage(dbLastError());
        end;
      end;
      dbClose(dsUL_Nal);
    end;
    RestScreenCursor;
  end else begin
    ShowMessage('�� ��������� Connect '+idConn);
  end;
end;

//--------------------------------------------------------------------------------
// ������ ������� ����������� ��-����������
procedure WriteSpecBel(sType:String;ds:TDataSet);
var
  fld : TField;
begin
//  if IDPROG()='SELSOVET' then begin
    fld := ds.FindField('SPEC_B');
    if (fld<>nil) and ParamAsBoolean('PR_SPEC_SVID') then begin
      ds.Fld('SPEC_B').AsString := Parameters('����_����_�');   
    end;
    fld := ds.FindField('RUKOV_D');
    if (fld<>nil) then  fld.AsString:=Parameters('DOLG_RUK_ZAGS');   
    fld := ds.FindField('SPEC_D');
    if (fld<>nil) then  fld.AsString:=Parameters('DOLG_SPEC');   
//  end;
end;

//{$DEFINE ADD_OLD_AKT}

// SubType:  VUS - �������� ���,   OCH - ���������,  NAS - �� ������� ���������,  LIC - �� �������� ����� 
function Men_Report(SubType,Tabs:String) : String;
begin
  if IDProg1()='O' then begin // OCHERED
    AddReport('�������� ����������','&�������� ����������.fr3');
    AddReport('������� � ��������� �� ����� �����������','&������� � ��������� �� ����� �����������.fr3'); 
    Result := '&LIST&';
  end else begin
    if (SubType='OTD') and Men.Fld('VUS').AsBoolean then begin
      if (Tabs='') or (Pos('VUS;',Tabs)>0) then begin
        AddReport('�������� ���������� ����� ���','&��� �������� ���������� �����.frf');
        AddReport('�������� ���������� ����� ��� (������ �4)','&��� �������� ���������� �����A4.frf');
        AddReport('�������� ���������� ����� ��� (160�230)','&��� �������� ���������� ����� 160�230.frf');
        AddReport('���������� ��������','&���������� ��������.frf');
      end;
    end;
    if (SubType='OTD') and Men.Fld('OCHERED').AsBoolean then begin
      if (Tabs='') or (Pos('OCH;',Tabs)>0) then begin
        AddReport('�������� ����������','&�������� ����������.fr3');
      end;
    end;
    AddReport('�������� �����������','&�������� �����������(���������).fr3');
    AddReport('������� � ��������� �� ����� �����������','&������� � ��������� �� ����� �����������.fr3'); 
    Result := '&LIST&';
  end;
end;

procedure Men_AfterCreate;
var
//  ds : TDataSet;
  i : Integer;
begin
  i := ParamAsInteger('GOSUD');
  if i>0 then  Men.Fld('CITIZEN').AsInteger := i;
  Men.Fld('POL').AsString:='�';
  Men.Fld('PROPIS').AsBoolean:=true;
  Men.Fld('NOTSELECT').AsBoolean:=false;
  Men.Fld('PASP_UDOST').AsInteger:=1;
  Men.Fld('VUS').AsBoolean:=false;

  Men.Fld('ISKL').AsBoolean:=false;
  Men.Fld('SOCIAL').AsInteger:=0;
  Men.Fld('SIROTA').AsBoolean:=false;
  Men.Fld('UCHASTOK').AsBoolean:=false;
  Men.Fld('IS_UCHASTOK').AsBoolean:=false;
  Men.Fld('MR_B_RESP').AsBoolean:=true;
  Men.Fld('MR_B_OBL').AsBoolean:=true;
  Men.Fld('OP_B_RESP').AsBoolean:=true;
  Men.Fld('OP_B_OBL').AsBoolean:=true;
  Men.Fld('SPEC_UCH').AsBoolean:=false;
//  ds := dbGetDataSet('dmMen.mtDokument');
//  if ds<>nil then begin
//    i := ParamAsInteger('GOSUD');
//    if i>0 then
//      ds.Fld('CITIZEN').AsInteger := i;   // ����������� �� ��������� ��������
//    ds.Fld('POL').AsString := '�';        // ��� �� ��������� �������
//  end;
end;


procedure Men_Familia;
var
  sl : TStringList;
  s:String;
begin
  s:=Trim(Men.Fld('Familia').AsString);
  if s<>'' then begin
   Men.Fld('Familia').AsString:=FirstUpper(s);
  {
   sl := TStringList.Create;
   StrToStrings(s, sl, ' ');
   if sl.Count=3 then begin
     if Trim(Men.Fld('Name').AsString)='' then begin
       Men.Fld('Familia').AsString:=Trim(FirstUpper(sl[0]));
       Men.Fld('Name').AsString:=Trim(FirstUpper(sl[1]));
       Men.Fld('Otch').AsString:=Trim(FirstUpper(sl[2]));
     end else begin
       Men.Fld('Familia').AsString:=FirstUpper(s);
     end;
   end else begin
     Men.Fld('Familia').AsString:=FirstUpper(s);
   end;
   sl.Free;
   }
  end;
end;

procedure Men_Name;
begin
  Men.Fld('Name').AsString := Trim(FirstUpper(Men.Fld('Name').AsString));
end;

procedure Men_Otch;
begin
  Men.Fld('Otch').AsString := Trim(FirstUpper(Men.Fld('Otch').AsString));
end;

procedure Men_PASP_DATE;
begin
  if Men.Fld('PASP_VIDAN').AsString='' 
    then Men.Fld('PASP_VIDAN').AsString:=ParamAsString('PASP_ORGAN');
end;

function Spr27(sField:String):String;
begin
  Result:='';
//  ShowMessage(LicSchet.Mens.FIO);
end;

function SetTmpDataSet1( strNameDataSet : String) : Boolean;
begin
  ds1 := dbGetDataSet(strNameDataSet);
  if ds1=nil then Result:=false else Result:=true;
end;

function Raschet_Lich_Zakl(lRazdel1 : Boolean; lRazdel2 : Boolean; lPosev:Boolean) : Boolean;
var
  lMeat, lMoloko : Boolean;
  n1,n2 : Extended;
begin
  Result := true;
  if lPosev then begin  // �������� �������
    ds1.Fld('POSEV').AsFloat := ds1.Fld('POSEV_ZERN').AsFloat+
      ds1.Fld('POSEV_KART').AsFloat+ds1.Fld('POSEV_OV').AsFloat+
      ds1.Fld('POSEV_KORM').AsFloat+ds1.Fld('POSEV_TRAV').AsFloat;
  end;
  if lRazdel1 and (Globaltask.ParamAsString('VER_UCHET')='1') then begin  // ������ ������������ ��������������
    lMeat   := false;
    lMoloko := false;
    if Globaltask.ParamAsFloat('UROG_KOROV')>0 then begin
      ds1.Fld('K_MEAT').AsFloat:= (ds1.Fld('KOROVA').AsInteger+ds1.Fld('TELKI1').AsInteger) * Globaltask.ParamAsFloat('UROG_KOROV');
      lMeat := true;
    end;
    if Globaltask.ParamAsFloat('UROG_M_KOR')>0 then begin 
      ds1.Fld('KOR_MOLOKO').AsFloat:= ds1.Fld('KOROVA').AsInteger * Globaltask.ParamAsFloat('UROG_M_KOR');
      lMoloko := true;
    end;
    if Globaltask.ParamAsFloat('UROG_SV')>0 then begin 
      ds1.Fld('S_MEAT').AsFloat:= ds1.Fld('SVINI').AsInteger * Globaltask.ParamAsFloat('UROG_SV');
      lMeat := true;
    end;
    if Globaltask.ParamAsFloat('UROG_M_KOZ')>0 then begin
      ds1.Fld('KOZ_MOLOKO').AsFloat:= ds1.Fld('KOZIMAT').AsInteger * Globaltask.ParamAsFloat('UROG_M_KOZ');
      lMoloko:=true;
    end;
    if Globaltask.ParamAsFloat('UROG_JAICA')>0 then ds1.Fld('JAICA').AsInteger:= ds1.Fld('PTICA').AsInteger * Globaltask.ParamAsInteger('UROG_JAICA');
    if Globaltask.ParamAsFloat('UROG_PCHELI')>0 then ds1.Fld('MED').AsFloat:= ds1.Fld('PCHELI').AsInteger * Globaltask.ParamAsFloat('UROG_PCHELI');
    if Globaltask.ParamAsFloat('UROG_PTICA')>0 then n1 := ds1.Fld('PTICA').AsInteger * Globaltask.ParamAsFloat('UROG_PTICA');
    if Globaltask.ParamAsFloat('UROG_KROL')>0 then n2 := ds1.Fld('KROL').AsInteger * Globaltask.ParamAsFloat('UROG_KROL');
    if (n1>0) or (n2>0) then begin
      ds1.Fld('P_MEAT').AsFloat := n1+n2;
      lMeat := true;
    end;
    if lMeat then begin
      ds1.Fld('MEAT').AsFloat:=ds1.Fld('K_MEAT').AsFloat+ds1.Fld('S_MEAT').AsFloat+ds1.Fld('P_MEAT').AsFloat
    end;
    if lMoloko then begin
      ds1.Fld('MOLOKO').AsFloat:=ds1.Fld('KOR_MOLOKO').AsFloat+ds1.Fld('KOZ_MOLOKO').AsFloat;
    end;
  end;
  if lRazdel2 and (Globaltask.ParamAsString('VER_UCHET')='1') then begin  // ������ ������������ ���������
    if Globaltask.ParamAsFloat('UROG_JAGOD')>0 then  ds1.Fld('PR_JAGOD').AsFloat := ds1.Fld('POSEV_JAG').AsFloat * Globaltask.ParamAsFloat('UROG_JAGOD');
    if Globaltask.ParamAsFloat('UROG_KART')>0 then  ds1.Fld('PR_KART').AsFloat := ds1.Fld('POSEV_KART').AsFloat * Globaltask.ParamAsFloat('UROG_KART');
    if Globaltask.ParamAsFloat('UROG_ZERN')>0 then  ds1.Fld('PR_SERNO').AsFloat:= ds1.Fld('POSEV_ZERN').AsFloat * Globaltask.ParamAsFloat('UROG_ZERN');

    if (Globaltask.ParamAsFloat('UROG_OVZ')>0) and (Globaltask.ParamAsFloat('UROG_OV')>0) then begin
       ds1.Fld('PR_OVOCH_Z').AsFloat:= ds1.Fld('POSEV_OVZ').AsFloat * Globaltask.ParamAsFloat('UROG_OVZ');
       ds1.Fld('PR_OVOCHI').AsFloat := (ds1.Fld('POSEV_OV').AsFloat-ds1.Fld('POSEV_OVZ').AsFloat) * Globaltask.ParamAsFloat('UROG_OV')+
                                        ds1.Fld('PR_OVOCH_Z').AsFloat;
    end;
    if Globaltask.ParamAsFloat('UROG_KORN')>0 then  ds1.Fld('PR_KORNPL').AsFloat:= ds1.Fld('POSEV_KORM').AsFloat * Globaltask.ParamAsFloat('UROG_KORN');

//    if Globaltask.ParamAsFloat('KOEF_JAGOD')>0 then ds1.Fld('PR_JAGOD').AsFloat:= ds1.Fld('VSEGO').AsFloat * Globaltask.ParamAsFloat('KOEF_JAGOD');
    if Globaltask.ParamAsFloat('KOEF_PLOD')>0  then ds1.Fld('PR_PLOD').AsFloat:= ds1.Fld('VSEGO').AsFloat * Globaltask.ParamAsFloat('KOEF_PLOD');
  end;
end;

function Lich_AnyCorr(strFieldName : String) : Variant;
var
  lMoloko,lMeat : Boolean;
  n1,n2 : Extended;
begin
  if (strFieldName='TYPE_VOZV') or (strFieldName='GOD_VOZV') then begin
    if LicSchet.Fld('TYPE_VOZV').AsInteger>2 then begin
      LicSchet.Fld('GOD_VOZV').AsString:='';
    end;
    if (LicSchet.Fld('GOD_VOZV').AsInteger>3000) or (LicSchet.Fld('GOD_VOZV').AsInteger<1000) then begin
      LicSchet.Fld('GOD_VOZV').AsString:='';
    end;
  end;
  if IdProg()='SELSOVET' then begin
    if strFieldName='VSEGO' then begin
//      if LicSchet.Fld('VSEGO').AsFloat>10 then begin
//        PutError('������� ������� ��������.');
//      end;
      if (Globaltask.ParamAsString('VER_UCHET')='1') then
        if Globaltask.ParamAsFloat('KOEF_PLOD')>0  then LicSchet.Fld('PR_PLOD').AsFloat:= LicSchet.Fld('VSEGO').AsFloat * Globaltask.ParamAsFloat('KOEF_PLOD');
    end;
    if ParamAsBoolean('SUM_POSEV') then begin  // ���������������� �������
      if (Copy(strFieldName,1,5)='POSEV') and (strFieldName<>'POSEV') then begin
        LicSchet.Fld('POSEV').AsFloat := LicSchet.Fld('POSEV_ZERN').AsFloat+
          LicSchet.Fld('POSEV_KART').AsFloat+LicSchet.Fld('POSEV_OV').AsFloat+
          LicSchet.Fld('POSEV_KORM').AsFloat+LicSchet.Fld('POSEV_TRAV').AsFloat;
  //        +LicSchet.Fld('POSEV_JAG').AsFloat;
      end;
    end;
    if ParamAsBoolean('SUM_KOROV') then begin  // ���������������� 
      if (strFieldName='KOROVA') or (strFieldName='TELKI1') then begin
        LicSchet.Fld('BIG_ENIMAL').AsInteger := LicSchet.Fld('KOROVA').AsInteger+LicSchet.Fld('TELKI1').AsInteger;
      end;
    end;
    if (strFieldName='BIG_ENIMAL') or (strFieldName='KOROVA') or (strFieldName='TELKI1') then begin
      if LicSchet.Fld('BIG_ENIMAL').AsInteger < LicSchet.Fld('KOROVA').AsInteger+LicSchet.Fld('TELKI1').AsInteger then begin
        PutError('(������� ������� ���� �����) �� ����� ���� ������ ����� (������+��������)');
        LicSchet.Fld('BIG_ENIMAL').AsInteger := LicSchet.Fld('KOROVA').AsInteger+LicSchet.Fld('TELKI1').AsInteger;
      end;
    end;
    {
    if ParamAsBoolean('CALC_UROG') then begin  // �������������� ������ ������������ 1
      if strFieldName='POSEV_KART' then begin
        if Globaltask.ParamAsFloat('UROG_KART')>0 then  LicSchet.Fld('PR_KART').AsFloat := LicSchet.Fld('POSEV_KART').AsFloat * Globaltask.ParamAsFloat('UROG_KART');
      end else if strFieldName='POSEV_ZERN' then begin
        if Globaltask.ParamAsFloat('UROG_ZERN')>0 then  LicSchet.Fld('PR_SERNO').AsFloat:= LicSchet.Fld('POSEV_ZERN').AsFloat * Globaltask.ParamAsFloat('UROG_ZERN');
      end else if strFieldName='POSEV_JAG' then begin
        if Globaltask.ParamAsFloat('UROG_JAGOD')>0 then  LicSchet.Fld('PR_JAGOD').AsFloat := LicSchet.Fld('POSEV_JAG').AsFloat * Globaltask.ParamAsFloat('UROG_JAGOD');
      end else if (strFieldName='POSEV_OV') or (strFieldName='POSEV_OVZ') then begin
        if (Globaltask.ParamAsFloat('UROG_OV')>0) and (Globaltask.ParamAsFloat('UROG_OVZ')>0) then begin
          LicSchet.Fld('PR_OVOCH_Z').AsFloat:= LicSchet.Fld('POSEV_OVZ').AsFloat * Globaltask.ParamAsFloat('UROG_OVZ');
          LicSchet.Fld('PR_OVOCHI').AsFloat := (LicSchet.Fld('POSEV_OV').AsFloat-LicSchet.Fld('POSEV_OVZ').AsFloat) * Globaltask.ParamAsFloat('UROG_OV')+
                                        LicSchet.Fld('PR_OVOCH_Z').AsFloat;
        end;
      end else if strFieldName='POSEV_KORM' then begin
        if Globaltask.ParamAsFloat('UROG_KORN')>0 then  LicSchet.Fld('PR_KORNPL').AsFloat:= LicSchet.Fld('POSEV_KORM').AsFloat * Globaltask.ParamAsFloat('UROG_KORN');
      end;
    end;
    }
    {
    if ParamAsBoolean('CALC_ZAGOT') then begin  // �������������� ������ ������������ 2
      lMeat := false;
      lMoloko := false;
      if (strFieldName='KOROVA') or (strFieldName='TELKI1') then begin
        if Globaltask.ParamAsFloat('UROG_KOROV')>0 then begin
          LicSchet.Fld('K_MEAT').AsFloat:= (LicSchet.Fld('KOROVA').AsInteger+LicSchet.Fld('TELKI1').AsInteger) * Globaltask.ParamAsFloat('UROG_KOROV');
          lMeat := true;
        end;
        if Globaltask.ParamAsFloat('UROG_M_KOR')>0 then begin 
          LicSchet.Fld('KOR_MOLOKO').AsFloat:= LicSchet.Fld('KOROVA').AsInteger * Globaltask.ParamAsFloat('UROG_M_KOR');
          lMoloko := true;
        end;
      end else if strFieldName='SVINI' then begin
        if Globaltask.ParamAsFloat('UROG_SV')>0 then begin 
          LicSchet.Fld('S_MEAT').AsFloat:= LicSchet.Fld('SVINI').AsInteger * Globaltask.ParamAsFloat('UROG_SV');
          lMeat := true;
        end;
      end else if strFieldName='KOZIMAT' then begin
        if Globaltask.ParamAsFloat('UROG_M_KOZ')>0 then begin
          LicSchet.Fld('KOZ_MOLOKO').AsFloat:= LicSchet.Fld('KOZIMAT').AsInteger * Globaltask.ParamAsFloat('UROG_M_KOZ');
          lMoloko:=true;
        end;
      end else if strFieldName='PTICA' then begin
        if Globaltask.ParamAsFloat('UROG_JAICA')>0 then LicSchet.Fld('JAICA').AsInteger:= LicSchet.Fld('PTICA').AsInteger * Globaltask.ParamAsInteger('UROG_JAICA');
      end else if strFieldName='PCHELI' then begin
        if Globaltask.ParamAsFloat('UROG_PCHELI')>0 then LicSchet.Fld('MED').AsFloat:= LicSchet.Fld('PCHELI').AsInteger * Globaltask.ParamAsFloat('UROG_PCHELI');
      end;
      if (strFieldName='PTICA') or (strFieldName='KROL') then begin
        if Globaltask.ParamAsFloat('UROG_PTICA')>0 then n1 := LicSchet.Fld('PTICA').AsInteger * Globaltask.ParamAsFloat('UROG_PTICA');
        if Globaltask.ParamAsFloat('UROG_KROL')>0 then n2 := LicSchet.Fld('KROL').AsInteger * Globaltask.ParamAsFloat('UROG_KROL');
        if (n1>0) or (n2>0) then begin
          LicSchet.Fld('P_MEAT').AsFloat := n1+n2;
          lMeat := true;
        end;
      end;
      if lMeat or (strFieldName='K_MEAT') or (strFieldName='S_MEAT')or (strFieldName='P_MEAT') then begin
        LicSchet.Fld('MEAT').AsFloat:=LicSchet.Fld('K_MEAT').AsFloat+LicSchet.Fld('S_MEAT').AsFloat+LicSchet.Fld('P_MEAT').AsFloat
      end;
      if lMoloko or (strFieldName='KOZ_MOLOKO') or (strFieldName='KOR_MOLOKO') then begin
        LicSchet.Fld('MOLOKO').AsFloat:=LicSchet.Fld('KOR_MOLOKO').AsFloat+LicSchet.Fld('KOZ_MOLOKO').AsFloat;
      end;
    end;
    }
  end;
end;


//-------------------------------------------------------
procedure ZAGS_IzvOtsut_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('POL').AsString := '�';   
  end;
end;
function ZAGS_IzvOtsut_Report:String;
begin
  Result:='';
end;

//-------------------------------------------------------
procedure ZAGS_SprBrak_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
  end;
end;
//-------------------------------------------------------
procedure ZAGS_SprRast_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
  end;
end;
//-------------------------------------------------------
procedure ZAGS_SprChName_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('POL').AsString := '�';   
  end;
end;
//-------------------------------------------------------
procedure ZAGS_SprRogd_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('SVED').AsString := '3';   
    ds.Fld('POL').AsString := '�';   
//    ds.Fld('B_RESP').AsBoolean:=true;
    ds.Fld('GOSUD').AsInteger := ParamAsInteger('GOSUD');   
    ds.Fld('OBL').AsString := Parameters('OBL');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('B_GOROD').AsString := Parameters('TYPEPUNKT');   
  end;
end;
//-------------------------------------------------------
procedure ZAGS_SprSmert_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('POL').AsString := '�';   
    ds.Fld('SM_GOSUD').AsInteger := ParamAsInteger('GOSUD');   
    ds.Fld('SM_OBL').AsString := Parameters('OBL');   
    ds.Fld('SM_RAION').AsString := Parameters('RAION');   
    ds.Fld('SM_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('SM_B_GOROD').AsString := Parameters('TYPEPUNKT');   
  end;
end;
//-------------------------------------------------------
procedure ZAGS_SprAkt_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('POL').AsString := '�';   
  end;
end;
function ZAGS_SprAkt_Report:String;
begin
  Result:='';
end;
//-------------------------------------------------------
procedure ZAGS_DeclSvid_AfterCreate;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('GT_GOSUD').AsInteger := ParamAsInteger('GOSUD');   
    ds.Fld('GT_B_OBL').AsBoolean:=true;   
    ds.Fld('GT_OBL').AsString := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
  end;
end;
function ZAGS_DeclSvid_Report:String;
begin
  AddReport('��������� � ������ ���������� �������������','&��������� � ������ ���������� �������������_�����.fr3');
  Result := '&LIST&';
end;

//-------------------------------------------------------
procedure ZAGS_SprOtsut_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('POL').AsString := '�';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GRAG').AsInteger     := i;   
      ds.Fld('RG_GOSUD').AsInteger := i;   
      ds.Fld('GT_GOSUD').AsInteger := i;   
    end;
    ds.Fld('GT_OBL').AsString := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('RG_OBL').AsString := Parameters('OBL');   
    ds.Fld('RG_RAION').AsString := Parameters('RAION');   
    ds.Fld('RG_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('RG_B_GOROD').AsString := Parameters('TYPEPUNKT');   

    if IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
      ds.Fld('GT_RNGOROD').AsString := Parameters('RN_GOROD');   
      ds.Fld('GT_RAION').AsString   := '';   
    end;
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
    ds.Fld('DOLG_RUKOV_B').AsString := Zags_Sprav_DolgEx(1);   
    ds.Fld('RUKOV_B').AsString      := Zags_Sprav_FIOEx(1);   
  end;
end;
function ZAGS_SprOtsut_Report:String;
begin
  Result:='';
end;

//-------------------------------------------------------
procedure ZAGS_ZaklChName_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('POL').AsString := '�';   
    ds.Fld('IS_IZMEN').AsBoolean := true;   
    ds.Fld('TYPE_BRAK').AsString := '1';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('RG_GOSUD').AsInteger := i;   
      ds.Fld('GT_GOSUD').AsInteger := i;   
    end;
    ds.Fld('RG_B_OBL').AsBoolean :=true;   
    ds.Fld('GT_B_OBL').AsBoolean :=true;   
    ds.Fld('GT_OBL').AsString := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('RG_OBL').AsString := Parameters('OBL');   
    ds.Fld('RG_RAION').AsString := Parameters('RAION');   
    ds.Fld('RG_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('RG_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
  end;
end;
function ZAGS_ZaklChName_Report:String;
begin
  Result:='&���������� � �������� ���.fr3';
end;
//-----------------------------------------------------------
procedure ZAGS_ZaklAddIN_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime  := Now;
    ds.Fld('DATEZV').AsDateTime := Now;
//    ds.Fld('POL').AsString := '�';   
    ds.Fld('IS_MY').AsBoolean := true;   
    ds.Fld('IS_SKLON').AsBoolean := true;   
    ds.Fld('ZV').AsString := '�';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GT_GOSUD').AsInteger := i;   
    end;
    ds.Fld('GT_B_OBL').AsBoolean :=true;   
    ds.Fld('GT_OBL').AsString := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
  end;
end;
function ZAGS_ZaklAddIN_Report:String;
begin
  AddReport('���������� � ���������� ��','&���������� � �������� ��.fr3');
  AddReport('���������� � ���������� �� � ������ ����','&���������� � �������� ��2.fr3');
  AddReport('��������� � �������� ��','&��������� � �������� ��.fr3');
  Result := '&LIST&';
end;

//-------------------------------------------
procedure ZAGS_ZaklIzmAkt_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime:=Now;
    ds.Fld('IS_SKLONEN').AsBoolean:=true;   

    ds.Fld('IS_IZMEN').AsBoolean:=true;   
    ds.Fld('IS_DOPOLN').AsBoolean:=false;   
    ds.Fld('IS_ISPRAV').AsBoolean:=false;   
    ds.Fld('DOLG_RUKOV').AsString := Zags_Sprav_Dolg;   
    ds.Fld('RUKOV').AsString      := Zags_Sprav_FIO;   
  end;
end;

//-------------------------------------------------------
function ZAGS_ZaklIzmAkt_Report:String;
begin
  AddReport('���������� � �������� ��������� � ������� ������ (����� 12)','&���������� � �������� ��������� � ������� ������.fr3');
  AddReport('���������� � �������� ��������� � ������� ������ (����� 14)','&���������� � �������� ��������� � ������� ������14.fr3');
  Result := '&LIST&';
end;

//-------------------------------------------------------
procedure DBrak_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
  d:TDateTime;
begin
//  ds := dbGetDataSet('fmZapisBrak.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    d:=GlobalTask.GetLastValueAsDate('LAST_DATEB_DBRAK');
    if d>0 then ds.Fld('DATEB').AsDateTime:=d;

    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('ON_GRAG').AsInteger     := i;   
      ds.Fld('ONA_GRAG').AsInteger    := i;  
      ds.Fld('ON_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_GOSUD').AsInteger   := i;   
      ds.Fld('ON_M_GOSUD').AsInteger  := i;   
      ds.Fld('ONA_M_GOSUD').AsInteger := i;   
    end;
//    ds.Fld('ON_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('ON_RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('ON_OBL').AsString := Parameters('OBL');   
    ds.Fld('ON_RAION').AsString := Parameters('RAION');   
    ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ON_GOROD_B').AsString := Parameters('GOROD_B');   

//    ds.Fld('ONA_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('ONA_RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_GOROD_B').AsString := Parameters('GOROD_B');   

    ds.Fld('ON_M_OBL').AsString := Parameters('OBL');   
    ds.Fld('ON_M_RAION').AsString := Parameters('RAION');   
    ds.Fld('ON_M_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_M_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_M_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_M_GOROD').AsString := Parameters('GOROD');   
    if IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
      ds.Fld('ON_M_RNGOROD').AsString  := Parameters('RN_GOROD');   
      ds.Fld('ONA_M_RNGOROD').AsString := Parameters('RN_GOROD');   
      ds.Fld('ON_M_RAION').AsString    := '';   
      ds.Fld('ONA_M_RAION').AsString   := '';   
    end;
    ds.Fld('ON_SEM').AsString := '2';   
    ds.Fld('ONA_SEM').AsString := '2';   
    if ds.Fld('VOSSTAN').IsNull or not ds.Fld('VOSSTAN').AsBoolean then begin
      ds.Fld('ON_DOK_TYPE').AsString  := '1';   
      ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    end;
    ds.Fld('OSNOV').AsBoolean := true;   
    ds.Fld('BELORUS').AsBoolean := false;   
//    ds.Fld('VOENKOM').AsString := Parameters('ID_VOENKOM');   

    // ��������� � ��� ������������ ���������
    ds.Fld('DOLG_RUKOV').AsString := Parameters('DOLG_SPEC')
    ds.Fld('RUKOV').AsString := Parameters('����_����');   
  
    if ParamAsFloat('SUM_POSHLINA')>0  then ds.Fld('SUM_POSHLINA').AsFloat := ParamAsFloat('SUM_POSHLINA'); 
    ds.Fld('POSHLINA').AsString := Parameters('POSHLINA'); 

//    ds.Fld('OTMETKA').AsString := '������������� � �������� ������'+Chr(13)+Chr(10)+
//                                  '������������� � �������� �������';   
  end;
end;
function DBrak_Report : String;     // !!!
begin
//  AddReport('��������� � ����������� �����','&��������� � ����������� �����.frf');
  AddReport('��������� � ����������� �����','&��������� � ����������� �����.fr3');
  Result := '&LIST&';
end;
//-------------------------------------------------------
function IsAktFR3:Boolean;
begin
  Result:=true;
end;
//-------------------------------------------------------
// ���������� � �������� ����� ��� ������� �������
function GetAddNameAkt(lCheckNew:Boolean;var sEXT:String) : String;
var
  sVer:String;
  l2013,lEnableOld:Boolean;
  s:String;
begin
//  if (DokZAGS.GetTypeDok='') or (CurDok=nil) then begin    {!!!}
//    sEXT:='fr3';
//    exit;
//  end; 
  lEnableOld:=GlobalTask.ParamAsBoolean('ENABLE_OLD_AKT');
  sVer:=Trim(GlobalTask.ParamAsString('AKT_VER'));
  if (sVer='0') or (sVer='1') then sVer:='';
  //--- �������� ����� ������� -----------------------------------------
  l2013:=true;
  if not DokZAGS.Fld('DATEZ').IsNull then begin
    if DokZAGS.Fld('DATEZ').AsDateTime<STOD('2013-07-26','')
      then l2013:=false;
  end;
  //--------------------------------------------------------------------
  if l2013 or not lEnableOld then begin // � 26.07.2013
    sExt:='fr3';
    if (CurDok.TypeObj=dmBase.TypeObj_ZSmert) or (CurDok.TypeObj=dmBase.TypeObj_ZBrak) then begin
      if DokZAGS.Fld('VOSSTAN').AsBoolean then begin 
        sVer:='';
        sExt:='frf';
        Result:='';
      end;
    end;
    if sExt='fr3'
      then Result:=sVer+'�';
  end else begin
    Result:='2';
    if not lEnableOld then begin
      if GlobalTask.ParamAsBoolean('AKT_ALBOM') then Result:='';
    end else begin
      if StrToInt(FormatDateTime('YYYY',DokZAGS.Fld('DATEZ').AsDateTime))>2008 then begin
        if GlobalTask.ParamAsBoolean('AKT_ALBOM') then Result:=''
      end else begin   // ���������� ������ ������� ������
        if (sVer='') then Result:='';
        Result:=Result+'_2008';
      end;
    end;
    if (sVer='5') and (CurDok.TypeObj=dmBase.TypeObj_ZSmert) then  begin
      if DokZAGS.Fld('VOSSTAN').AsBoolean then Result:='' else Result:='5';
    end;
    if GlobalTask.ParamAsBoolean('AKT_ALBOM') then 
      Result := '���'+Result;
    sEXT:='frf';
    if (Result='2') then begin   //  ����� ������� ������
      if lCheckNew and IsAktFR3 then begin
         sEXT:='fr3';
         Result:='';
      end else begin
         sEXT:='frf';
      end;
    end else if (Result='5') then begin
      sEXT:='fr3';
    end;
  end;
end;

//---------------------------------
function getAddNameSvid(ds:TDataSet):String;
begin
  if GlobalTask.ParamAsBoolean('SVID_LINE')
    then Result:='�'
    else Result:='';
end;
//---------------------------------
function ZBrak_Report : String;
var
  ds : TDataSet;
  s,ss,sEXT : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
//    if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := '���'+s;
    if ds.Fld('VOSSTAN').IsNull or not ds.Fld('VOSSTAN').AsBoolean then begin
      s := GetAddNameAkt(true, sEXT);
      ss:=getAddNameSvid(ds);
      AddReport('������ ���� � �����','&������ ���� � �����'+s+'.'+sEXT);
//      {$IFDEF OLD_SVID}
//        AddReport('������������� � �����','&������������� � �����'+ss+'.frf');
//      {$ELSE}
        AddReport('������������� � �����','&������������� � �����'+ss+'.fr3');
//      {$ENDIF}
      if IdProg='ZAGS' then begin
        AddReport('������� � �����','&������� � �����.frf');
        if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
          AddReport('�������� ������� � �����','&�������� ������� � �����BLK.fr3');
        end else begin
          AddReport('�������� ������� � �����','&�������� ������� � �����.frf');
        end;
        if GlobalTask.ParamAsBoolean('SPRAV_BEL') then begin 
          AddReport('�������� ������� � ����� (���.)','&�������� ������� � �����BLK_BEL.fr3');
        end;
      end;
      {$IFDEF ADD_OLD_AKT}
//        if (s='') then AddReport('������ ���� � ����� (�� ���������)','&������ ���� � �����2.frf');
      {$ENDIF}
    end else begin
      s := GetAddNameAkt(false, sEXT);
      AddReport('��������������� ������ ���� � �����','&��������������� ������ ���� � �����'+s+'.frf');
      AddReport('������������� � �����','&������������� � �����(���������������).frf');
      AddReport('������������� � ����� (������� �������)','&������������� � �����(�� �������).frf');
      AddReport('������� � �����','&������� � ����� �.frf');
    end;
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>������������� � ����� FR3','&������������� � �����.fr3');
    AddReport('>������������� � ����� FR3 �� �����','&������������� � ������.fr3');
    AddReport('>������ ���� � �����2','&������ ���� � �����2.frf');
    AddReport('>������ ���� � �����2_2008','&������ ���� � �����2_2008.frf');
    AddReport('>������ ���� � �����_2008','&������ ���� � �����_2008.frf');
    AddReport('>������ ���� � ��������','&������ ���� � ��������.frf');
    AddReport('>������ ���� � ��������_2008','&������ ���� � ��������_2008.frf');
    AddReport('>������ ���� � ����� FR3','&������ ���� � �����.fr3');
    AddReport('>������ ���� � ����� FR3 (26.07.2013)','&������ ���� � ������.fr3');
    AddReport('>��������������� ������ ���� � ����� 3','&��������������� ������ ���� � �����.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('�������� ������� � �����','&�������� ������� � �����BLK.fr3');
    AddReport('�������� ������� � ����� (���.)','&�������� ������� � �����BLK_BEL.fr3');
  end;
  Result := '&LIST&';
end;

procedure ZBrak_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisBrak.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then begin
      ds.Fld('DATEZ').AsString:='';
    end else begin
      if (GlobalTask.GetLastValueAsString('LAST_DATEZ_ZBRAK')='')
        then ds.Fld('DATEZ').AsDateTime := Date
        else ds.Fld('DATEZ').AsDateTime := GlobalTask.GetLastValueAsDate('LAST_DATEZ_ZBRAK');
    end;
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('ON_GRAG').AsInteger     := i;   
      ds.Fld('ONA_GRAG').AsInteger    := i;  
      ds.Fld('ON_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_GOSUD').AsInteger   := i;   
      ds.Fld('ON_M_GOSUD').AsInteger  := i;   
      ds.Fld('ONA_M_GOSUD').AsInteger := i;   
    end;
//    ds.Fld('ON_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('ON_RAION_B').AsString := Parameters('RAION_B');   

    ds.Fld('ON_OBL').AsString := Parameters('OBL');   
    ds.Fld('ON_RAION').AsString := Parameters('RAION');   
    ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ON_GOROD_B').AsString := Parameters('GOROD_B');   

//    ds.Fld('ONA_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('ONA_RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_GOROD_B').AsString := Parameters('GOROD_B');   

    if not CurDok.OnlySvid then begin
      ds.Fld('ON_M_OBL').AsString := Parameters('OBL');   
      ds.Fld('ON_M_RAION').AsString := Parameters('RAION');   
      ds.Fld('ON_M_GOROD').AsString := Parameters('GOROD');   

      ds.Fld('ONA_M_OBL').AsString := Parameters('OBL');   
      ds.Fld('ONA_M_RAION').AsString := Parameters('RAION');   
      ds.Fld('ONA_M_GOROD').AsString := Parameters('GOROD');   
    end;
    if not ds.Fld('VOSSTAN').AsBoolean then begin
      if not CurDok.OnlySvid and IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
        ds.Fld('ON_M_RNGOROD').AsString  := Parameters('RN_GOROD');   
        ds.Fld('ONA_M_RNGOROD').AsString := Parameters('RN_GOROD');   
        ds.Fld('ON_M_RAION').AsString    := '';   
        ds.Fld('ONA_M_RAION').AsString   := '';   
      end;
//      ds.Fld('ON_VOENKOM').AsString := Parameters('ID_VOENKOM');   
//      ds.Fld('ONA_VOENKOM').AsString := '';   
    end;
    ds.Fld('OSNOV').AsBoolean := true;   
    ds.Fld('ON_SEM').AsString := '2';
    ds.Fld('ONA_SEM').AsString := '2';   
    if not IsSimpleVvod and not ds.Fld('VOSSTAN').AsBoolean then begin
      ds.Fld('ON_DOK_TYPE').AsString  := '1';   
      ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    end;
    ds.Fld('SPEC').AsString := Parameters('����_����');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('���_����');   
    ds.Fld('RUKOV_B').AsString := Parameters('���_����_�');   
//    ds.Fld('OTMETKA').AsString := '������������� � �������� ������'+Chr(13)+Chr(10)+
//                                  '������������� � �������� �������';   
    if not ds.Fld('VOSSTAN').AsBoolean then begin
      if ParamAsFloat('SUM_POSHLINA')>0
        then ds.Fld('SUM_POSHLINA').AsFloat := ParamAsFloat('SUM_POSHLINA'); 
      ds.Fld('POSHLINA').AsString := Parameters('POSHLINA'); 
    end;
//    ds.Fld('MESTO').AsInteger := 0; 
  end;
end;

//---------------------------------
function ZRast_Report : String;
var
  ds : TDataSet;
  s,sEXT,ss : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    s := GetAddNameAkt(true,sEXT);
    ss:=getAddNameSvid(ds);
    AddReport('������ ���� � ����������� �����','&������ ���� � ����������� �����'+s+'.'+sEXT);
    AddReport('������������� � ����������� �����','&������������� � ����������� �����'+ss+'.fr3');
    if GlobalTask.ParamAsBoolean('OLD_SVID')
      then AddReport('������������� � ����������� ����� (������)','&������������� � ����������� �����(��).frf');
    if Copy(GlobalTask.ParamAsString('KOD'),1,1)='2'
      then AddReport('������������� � ����������� ����� (�������)','&������������� � ����������� ����� �������.frf');

    if IdProg='ZAGS' then begin
      AddReport('������� � ����������� �����','&������� � ����������� �����.frf');
      if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
        AddReport('�������� ������� � ����������� �����','&�������� ������� � ����������� �����BLK.fr3');
      end else begin
        AddReport('�������� ������� � ����������� �����','&�������� ������� � ����������� �����.frf');
      end;
      if GlobalTask.ParamAsBoolean('SPRAV_BEL') then begin 
        AddReport('-------------------------------','&Empty.frf');
        AddReport('�������� ������� � ����������� ����� (���.)','&�������� ������� � ����������� �����BLK_BEL.fr3');
      end;
    end;

    {$IFDEF ADD_OLD_AKT}
//      if (s='') then AddReport('������ ���� � ����������� ����� (�� ���������)','&������ ���� � ����������� �����2.frf');
    {$ENDIF}
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>������������� � ����������� ����� FR3','&������������� � ����������� �����.fr3');
    AddReport('>������������� � ����������� ����� FR3 �� �����','&������������� � ����������� ������.fr3');
    AddReport('������������� � ����������� ����� (������)','&������������� � ����������� �����(��).frf');
    AddReport('������������� � ����������� ����� (�������)','&������������� � ����������� ����� �������.frf');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>������ ���� � ����������� �����2','&������ ���� � ����������� �����2.frf');
    AddReport('>������ ���� � ����������� �����2_2008','&������ ���� � ����������� �����2_2008.frf');
    AddReport('>������ ���� � ����������� �����_2008','&������ ���� � ����������� �����_2008.frf');
    AddReport('>������ ���� � ����������� ��������','������ ���� � ����������� ��������.frf');
    AddReport('>������ ���� � ����������� ��������_2008','&������ ���� � ����������� ��������_2008.frf');
    AddReport('>������ ���� � ������� FR3','&������ ���� � ����������� �����.fr3');
    AddReport('>������ ���� � ������� FR3 (26.07.2013)','&������ ���� � ����������� ������.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>�������� ������� � ����������� �����','&�������� ������� � ����������� �����.frf');
    AddReport('>�������� ������� � ����������� ����� �����','&�������� ������� � ����������� �����BLK.fr3');
    AddReport('>�������� ������� � ����������� ����� (���.)','&�������� ������� � ����������� �����BLK_BEL.fr3');
  end;
  Result := '&LIST&';
end;

procedure ZRast_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then begin
      ds.Fld('DATEZ').AsString:='';
    end else begin
      ds.Fld('DATEZ').AsDateTime:=GlobalTask.GetLastValueAsDate('LAST_DATEZ_ZRAST');
    end;
    if not CurDok.OnlySvid then begin
      i := ParamAsInteger('GOSUD');
      if i>0 then begin
        ds.Fld('ON_GRAG').AsInteger     := i;   
        ds.Fld('ONA_GRAG').AsInteger    := i;  
        ds.Fld('ON_GOSUD').AsInteger    := i;   
        ds.Fld('ONA_GOSUD').AsInteger   := i;   
        ds.Fld('ON_M_GOSUD').AsInteger  := i;   
        ds.Fld('ONA_M_GOSUD').AsInteger := i;   
      end;
      ds.Fld('ON_OBL').AsString := Parameters('OBL');   
      ds.Fld('ON_RAION').AsString := Parameters('RAION');   
      ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   

      ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
      ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
      ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   

      ds.Fld('ON_M_OBL').AsString := Parameters('OBL');   
      ds.Fld('ON_M_RAION').AsString := Parameters('RAION');   
      ds.Fld('ON_M_GOROD').AsString := Parameters('GOROD');   
      ds.Fld('ONA_M_OBL').AsString := Parameters('OBL');   
      ds.Fld('ONA_M_RAION').AsString := Parameters('RAION');   
      ds.Fld('ONA_M_GOROD').AsString := Parameters('GOROD');   
    end;
    ds.Fld('SPEC').AsString := Parameters('����_����');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('���_����');   
    ds.Fld('RUKOV_B').AsString := Parameters('���_����_�');   
    if not IsSimpleVvod then begin
      ds.Fld('ON_SEM').AsString := '1';   
      ds.Fld('ONA_SEM').AsString := '1';   
      if ParamAsFloat('SUMR_POSHLINA')>0
        then ds.Fld('ON_SUM_POSHLINA').AsFloat := ParamAsFloat('SUMR_POSHLINA'); 
      ds.Fld('ON_POSHLINA').AsString  := Parameters('POSHLINA'); 
      if ParamAsFloat('SUMR_POSHLINA')>0
        then ds.Fld('ONA_SUM_POSHLINA').AsFloat := ParamAsFloat('SUMR_POSHLINA'); 
      ds.Fld('ONA_POSHLINA').AsString := Parameters('POSHLINA'); 
      ds.Fld('ON_DOK_TYPE').AsString  := '1';   
      ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    end;
  end;
end;

function CheckSvidZAGS_R : String;
var
  lOk : Boolean;
begin
  result:='';
  lOk := DokZAGS.CheckSvid;
  if not lOk then result:=DokZAGS.GetLastError;
end;

function SvidAdopt_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidRast_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidUstOtc_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidChName_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidSmert_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidRogd_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;
function SvidBrak_ONPRINTREPORT : String;
begin Result:=CheckSvidZAGS_R end;

function CheckSvidZAGS : Boolean;
begin
  result := DokZAGS.CheckSvid;
  if not result then PutError(DokZAGS.GetLastError);
end;

function CheckIzrasSvidZAGS : Boolean;
begin
  result := true;
end;

//---------------------------------
function ZRogd_Report : String;
var
  ds : TDataSet;
  s,ss,sm,sEXT,sv : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    s := GetAddNameAkt(true,sEXT);
    sv:=getAddNameSvid(ds);
    if CurDok.OnlySvid then begin
      if CurDok.Fld('SVIDNOT').AsBoolean then begin
        PutError('������������� �� ��������!');
//        AddReport('---','&Empty.fr3');
        Result := '';
      end else begin
        AddReport('������������� � �������� (� ��)','&������������� � ��������'+sv+'��.fr3');
        {$IFDEF ADD_NOT_IN}
          AddReport('������������� � ��������','&������������� � ��������'+sv+'.frf');
        {$ENDIF}
        Result := '&LIST&';
      end;
      exit;
    end;
    sm:='*';
    if ds.Fld('VOSSTAN').IsNull or not ds.Fld('VOSSTAN').AsBoolean then begin
      if not ds.Fld('GIVOROGD').AsBoolean or ds.Fld('FIRSTWEEK').AsBoolean then begin
        if ds.Fld('FIRSTWEEK').AsBoolean 
          then sm:='������� � �������� ������� �������� � ������� ������ 6 ���� �����'
          else sm:='������� � �������� ���������������� �������';
      end;
      AddReport('������ ���� � ��������','&������ ���� � ��������'+s+'.'+sEXT);
      if not ds.Fld('SVIDNOT').AsBoolean then begin 
        AddReport('������������� � �������� (� ��)','&������������� � ��������'+sv+'��.fr3');
        {$IFDEF ADD_NOT_IN}
          AddReport('������������� � ��������','&������������� � ��������'+sv+'.frf');
        {$ENDIF}
      end;
      if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
        AddReport('������� � �������� (����� �1)|1','&������� � ����������� ��������BLK.fr3');
//        if ds.Fld('SVED').AsString='3' then begin // ��������� ������
        if IsZvMat(ds) then begin // ��������� ������ � �� ������ ����
          AddReport('������� � �������� (����� �2)|2','&������� � ����������� ��������BLK.fr3');
          AddReport('������� � ���������� �� ���� ��� ��������� �������� �������|3','&������� � ����������� ��������BLK.fr3');
        end;
        if sm<>'*' then AddReport(sm,'&������� � �������� �������� �������BLK.fr3');
      end else begin
        AddReport('������� � �������� (����� �1)|1','&������� � ����������� ��������.frf');
//        if ds.Fld('SVED').AsString='3' then begin // ��������� ������
        if IsZvMat(ds) then begin // ��������� ������ � �� ������ ����
           AddReport('������� � �������� (����� �2)|2','&������� � ����������� ��������.frf');
           AddReport('������� � ���������� �� ���� ��� ��������� �������� �������|3','&������� � ����������� ��������.frf');
        end;
        if sm<>'*' then AddReport(sm,'&������� � �������� �������� �������.frf');
      end;
//      if ds.Fld('SVED').AsString='3' then begin // ��������� ������
      if IsZvMat(ds) then begin // ��������� ������  � �� ������ ����
        AddReport('��������� � ����������� ��������','��������� � ��������55.fr3');
      end else begin
        AddReport('��������� � ����������� ��������','��������� � ��������.fr3');
      end;
      if IdProg='ZAGS' then begin
        AddReport('������� � ��������','&������� � ��������.frf');
        if GlobalTask.ParamAsBoolean('SPRAV_BLANK') 
          then AddReport('�������� ������� � ��������','&�������� ������� � ��������BLK.fr3')
          else AddReport('�������� ������� � ��������','&�������� ������� � ��������.frf');
      end;
      if GlobalTask.ParamAsBoolean('SPRAV_BEL') then begin 
        AddReport('---------------------------------------------','&Empty.frf');
        AddReport('������� � �������� (����� �1) ���.|1','&������� � ����������� ��������BLK_BEL.fr3');
        if IsZvMat(ds) then begin // ��������� ������ � �� ������ ����
          AddReport('������� � �������� (����� �2) ���.|2','&������� � ����������� ��������BLK_BEL.fr3');
          AddReport('������� � ���������� �� ���� ��� ��������� �������� ������� ���.|3','&������� � ����������� ��������BLK_BEL.fr3');
        end;
        if sm<>'*' then AddReport(sm+' ���.','&������� � �������� �������� �������BLK_BEL.fr3');
        if IdProg='ZAGS' then begin
          AddReport('�������� ������� � �������� ���.','&�������� ������� � ��������BLK_BEL.fr3');
        end;
      end;

      {$IFDEF ADD_OLD_AKT}
  //      if (s='') then AddReport('������ ���� � �������� (�� ���������)','&������ ���� � ��������2.frf');
      {$ENDIF}
    end else begin
//      if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := '���'+s;
      s := GetAddNameAkt(false,sEXT);
      AddReport('��������������� ������ ���� � ��������','&��������������� ������ ���� � ��������'+s+'.'+sExt);
      AddReport('������������� � ��������','&������������� � ��������(���������������).frf');
      AddReport('������������� � �������� (c ��)','&������������� � ��������(���������������)��.frf');
//      AddReport('��������������� ������ ���� � �������� (c 26.07.2013)','&��������������� ������ ���� � ���������.fr3');
      AddReport('������� � ��������','&������� � �������� �.frf');
    end;
//������� � �������� �������� �������
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>������������� � �������� FR3','&������������� � ����������.fr3');
    AddReport('>������������� � �������� FR3 �� �����','&������������� � �����������.fr3');
    AddReport('>������ ���� � ��������2','&������ ���� � ��������2.frf');
    AddReport('>������ ���� � ��������2_2008','&������ ���� � ��������2_2008.frf');
    AddReport('>������ ���� � ��������_2008','&������ ���� � ��������_2008.frf');
    AddReport('>������ ���� � �����������','&������ ���� � �����������.frf');
    AddReport('>������ ���� � �����������_2008','&������ ���� � �����������_2008.frf');
    AddReport('>������ ���� � �������� FR3','&������ ���� � ��������.fr3');
    AddReport('>������ ���� � �������� FR3 (c 26.07.2013)','&������ ���� � ���������.fr3');
    AddReport('>��������������� ������ ���� � �������� 3 ','&��������������� ������ ���� � ��������.fr3');
    AddReport('>��������������� ������ ���� � �������� (c 26.07.2013)','&��������������� ������ ���� � ���������.fr3');
    AddReport('>��������� � ����������� �������� (��.55)','��������� � ��������55.fr3');
    AddReport('>��������� � ����������� ��������','��������� � ��������.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('������� � �������� (����� �1)|1','&������� � ����������� ��������BLK.fr3');
    AddReport('������� � �������� (����� �2)|2','&������� � ����������� ��������BLK.fr3');
    AddReport('������� � ���������� �� ���� ��� ��������� �������� �������|3','&������� � ����������� ��������BLK.fr3');
    AddReport('>������� � �������� �������� ������� �����','&������� � �������� �������� �������BLK.fr3');
    AddReport('������� � �������� (����� �1) ���.|1','&������� � ����������� ��������BLK_BEL.fr3');
    AddReport('������� � �������� (����� �2) ���.|2','&������� � ����������� ��������BLK_BEL.fr3');
    AddReport('������� � ���������� �� ���� ��� ��������� �������� ������� ���.|3','&������� � ����������� ��������BLK_BEL.fr3');
    AddReport('>������� � �������� �������� ������� ���.','&������� � �������� �������� �������BLK_BEL.fr3');
    AddReport('>�������� ������� � �������� �����','&�������� ������� � ��������BLK.fr3');
    AddReport('>�������� ������� � �������� ���.','&�������� ������� � ��������BLK_BEL.fr3');
  end;
  Result := '&LIST&';
end;
//---------------------------------
procedure DeclRegRogd_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisRogd.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
  end;
end;

//---------------------------------
procedure ZRogd_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisRogd.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then begin
      ds.Fld('DATEZ').AsString:='';
    end else begin
      ds.Fld('DATEZ').AsDateTime := Now;
    end;
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('ON_GRAG').AsInteger     := i;   
      ds.Fld('ONA_GRAG').AsInteger    := i;  
      ds.Fld('ON_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_GOSUD').AsInteger   := i;   
      ds.Fld('ON_M_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_M_GOSUD').AsInteger   := i;   
      ds.Fld('GOSUD').AsInteger  := i;   
    end;
    ds.Fld('OBL').AsString := Parameters('OBL');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GOROD_B').AsString := Parameters('GOROD_B');   
//    ds.Fld('OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('RAION_B').AsString := Parameters('RAION_B');   

    if not ds.Fld('VOSSTAN').AsBoolean then begin
      ds.Fld('ON_OBL').AsString := Parameters('OBL');   
      ds.Fld('ON_RAION').AsString := Parameters('RAION');   
      ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   
      ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
      ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
      ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   

      ds.Fld('ON_M_GOROD').AsString := Parameters('GOROD');   
      ds.Fld('ONA_M_GOROD').AsString := Parameters('GOROD');   
    end;
    if not ds.Fld('VOSSTAN').AsBoolean then begin
      if IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
        ds.Fld('ON_RNGOROD').AsString  := Parameters('RN_GOROD');   
        ds.Fld('ONA_RNGOROD').AsString := Parameters('RN_GOROD');   
        ds.Fld('ON_RAION').AsString    := '';   
        ds.Fld('ONA_RAION').AsString   := '';   
      end;
    end;
    ds.Fld('SPEC').AsString := Parameters('����_����');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('���_����');   
    ds.Fld('RUKOV_B').AsString := Parameters('���_����_�');   
//    ds.Fld('VOENKOM').AsString := Parameters('ID_VOENKOM');   

    ds.Fld('TYPEROD').AsString := '1';
    ds.Fld('SVED').AsString := '1';
    ds.Fld('TYPEREG').AsString := '1';
    if not IsSimpleVvod  then begin
      ds.Fld('SCHET').AsString := '1';
      ds.Fld('OSTAT').AsString := '1';
      ds.Fld('DOKUMENT').AsString := Parameters('DOK_ROGD');
    end;
    if not IsSimpleVvod and not ds.Fld('VOSSTAN').AsBoolean then begin
      ds.Fld('ON_DOK_TYPE').AsString  := '1';   
      ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    end;

    if ds.Fld('VOSSTAN').AsBoolean then ds.Fld('SUD_NAME').AsString := '������� ����';
  end;
end;

procedure ZUstOtc_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisUstOtc.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid 
       then  ds.Fld('DATEZ').AsString:='' 
       else  ds.Fld('DATEZ').AsDateTime:=Now;
    ds.Fld('DateDecl').AsDateTime := Now;
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('ON_GRAG').AsInteger     := i;   
      ds.Fld('ONA_GRAG').AsInteger    := i;  
      ds.Fld('ON_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_GOSUD').AsInteger   := i;   
      ds.Fld('GOSUD').AsInteger   := i;   
    end;
    ds.Fld('OBL').AsString := Parameters('OBL');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   

    if IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
      ds.Fld('ON_RNGOROD').AsString  := Parameters('RN_GOROD');   
      ds.Fld('ONA_RNGOROD').AsString := Parameters('RN_GOROD');   
      ds.Fld('ON_RAION').AsString    := '';   
      ds.Fld('ONA_RAION').AsString   := '';   
    end;

    ds.Fld('ON_DOK_TYPE').AsString  := '1';   
    ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    ds.Fld('RUKOV').AsString := Parameters('���_����');   
    ds.Fld('RUKOV_B').AsString := Parameters('���_����_�');   
    ds.Fld('SPEC').AsString := Parameters('����_����');   
    WriteSpecBel('',ds);
  end;
end;

function ZUstOtc_Report : String;
var
  ds:TDataSet;
  s,ss,sEXT : String;
begin
  ds := fmMain.GetCurrentDokument;
  s:=GetAddNameAkt(true,sEXT);
  ss:=getAddNameSvid(ds);
  if CurDok.OnlySvid then begin
    AddReport('������������� �� ������������ ���������','&������������� �� ������������ ���������'+ss+'.fr3');
    Result := '&LIST&';
    exit;
  end;
//  if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := '���'+s;
  AddReport('������ ���� �� ���������','&������ ���� �� ���������'+s+'.'+sEXT);
  AddReport('������������� �� ������������ ���������','&������������� �� ������������ ���������'+ss+'.fr3');
//  AddReport('������������� �� ������������ ��������� (������)','&������������� �� ������������ ���������'+ss+'.frf');
  if IdProg='ZAGS' then begin
    AddReport('��������� �� ������������ ���������','&��������� �� ������������ ���������.frf'); 
  end;
  {$IFDEF ADD_OLD_AKT}
    if (s='') then AddReport('������ ���� �� ��������� (�� ���������)','&������ ���� �� ���������2.frf');
  {$ENDIF}
  if DokZAGS.Fld('OSNOV').AsInteger=2 then s:='(���)' else s:='';
  AddReport('��������� � ����������� ������������ ���������','&��������� �� ������������ ���������'+s+'.fr3'); 

  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>������������� �� ������������ ��������� ( ����� ) FR3','&������������� �� ������������ ���������.fr3');
    AddReport('>������������� �� ������������ ��������� ( ����� ) FR3 �� �����','&������������� �� ������������ ����������.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>������ ���� �� ���������2','&������ ���� �� ���������2.frf');
    AddReport('>������ ���� �� ���������2_2008','&������ ���� �� ���������2_2008.frf');
    AddReport('>������ ���� �� ���������_2008','&������ ���� �� ���������_2008.frf');
    AddReport('>������ ���� �� ������������','&������ ���� �� ������������.frf');
    AddReport('>������ ���� �� ������������_2008','&������ ���� �� ������������_2008.frf');
    AddReport('>������ ���� �� ��������� FR3','&������ ���� �� ���������.fr3');
    AddReport('>������ ���� �� ��������� FR3 (26.07.2013)','&������ ���� �� ����������.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('������������� �� ������������ ��������� ','&������������� �� ������������ ���������.frf');
    AddReport('������������� �� ������������ ��������� ( ����� )','&������������� �� ������������ ���������(�����).frf');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('������������� �� ������������ ��������� (�) ������� �� �����','&������������� �� ������������ ����������.frf');
    AddReport('������������� �� ������������ ��������� (�����) (�) ������� �� �����','&������������� �� ������������ ���������(�����)�.frf');
    AddReport('��������� �� ������������ ���������','��������� �� ������������ ���������.fr3'); 
    AddReport('��������� �� ������������ ��������� (���)','��������� �� ������������ ���������(���).fr3'); 
  end;
  Result := '&LIST&';
end;


procedure ZUstMat_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisUstOtc.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('ON_GRAG').AsInteger     := i;   
      ds.Fld('ONA_GRAG').AsInteger    := i;  
      ds.Fld('ON_GOSUD').AsInteger    := i;   
      ds.Fld('ONA_GOSUD').AsInteger   := i;   
      ds.Fld('GOSUD').AsInteger   := i;   
    end;
    ds.Fld('OBL').AsString := Parameters('OBL');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ON_OBL').AsString := Parameters('OBL');   
    ds.Fld('ON_RAION').AsString := Parameters('RAION');   
    ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ON_DOK_TYPE').AsString  := '1';   
    ds.Fld('ONA_DOK_TYPE').AsString := '1';   
    ds.Fld('RUKOV').AsString := Parameters('���_����');   
    ds.Fld('RUKOV_B').AsString := Parameters('���_����_�');   
    ds.Fld('SPEC').AsString := Parameters('����_����');   
    WriteSpecBel('',ds);
  end;
end;

function ZUstMat_Report : String;
var
  s,sEXT : String;
begin
  s := GetAddNameAkt(true,sEXT);

  AddReport('������ ���� � �����������','&������ ���� � �����������'+s+'.'+sEXT);
  AddReport('������������� �� ������������ �����������','&������������� �� ������������ �����������.frf');
//  AddReport('������ ���� �� ������������ ����������� (c 26.07.2013)','&������ ���� � ������������.fr3');
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>������ ���� � �����������2','&������ ���� � �����������2.frf');
    AddReport('>������ ���� � ��������������','&������ ���� � ��������������.frf');
    AddReport('>������ ���� � ����������� FR3','&������ ���� � ������������.fr3');
  end;
  Result := '&LIST&';
end;


//---------------------------------
function AktZAH_Report : String;
var
  ds : TDataSet;
  s,ss,sEXT : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    AddReport('��������� � ��������� �������','&�����������_���������.fr3');
    AddReport('��������� � ������ �������','&�����������_���������2.fr3');
    AddReport('������� (A5)','&�����������_�������.fr3');
    AddReport('������� (A4)','&�����������_��������4.fr3');
//    AddReport('��� � �����������','&�����������_���2.fr3');
    AddReport('�������������','&�����������_�������������.fr3');
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('������� (A5)','&�����������_�������.fr3');
    AddReport('������� (A4)','&�����������_��������4.fr3');
    AddReport('���������','&�����������_���������.fr3');
    AddReport('��������� 2','&�����������_���������2.fr3');
    AddReport('�������������','&�����������_�������������.fr3');
    AddReport('��� � �����������','&�����������_���.fr3');
  end;
  Result := '&LIST&';
end;

//---------------------------------------------------
procedure AktZAH_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
  fld:TField;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('POL').AsString := '�';   
    fld := ds.FindField('DOK_KOD');
    if fld<>nil then ds.Fld('DOK_KOD').AsString:='1';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GRAG').AsInteger  := i;   
//      ds.Fld('SM_GOSUD').AsInteger := i;   
//      ds.Fld('RG_GOSUD').AsInteger := i;   
      ds.Fld('GT_GOSUD').AsInteger := i;   
    end;
    ds.Fld('GT_B_OBL').AsBoolean := true;   
    ds.Fld('GT_OBL').AsString   := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   
//    ds.Fld('SM_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('SM_RAION_B').AsString := Parameters('RAION_B');   
//    ds.Fld('DOLG_RUKOV').AsString := Parameters('DOLG_RUK_ZAGS');   
//    ds.Fld('RUKOV').AsString := Parameters('���_����');   
    ds.Fld('SVID_ZAGS').AsString := '';
    ds.Fld('DOKUMENT').AsString := '';
    ds.Fld('MOG_TYPE').AsString := '1';
    ds.Fld('MOG_L').AsFloat := 2.3;
    ds.Fld('MOG_W').AsFloat := 1.4;
    ds.Fld('ZH_MOG').AsString := '1';
  end;
end;

//---------------------------------
function ZSmert_Report : String;
var
  ds : TDataSet;
  s,ssIN,ss,sEXT : String;
  l,lIN:Boolean;
  n:Integer;
begin
  Result := '&LIST&';
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    s := GetAddNameAkt(true,sEXT);
//    ss:=getAddNameSvid(ds);   �������� �������� � ������
    lIN:=false;
    l:=false;
    if IdProg='ZAGS' then begin
      n:=GlobalTask.ParamAsInteger('PRINT_SM_IN');
      if (n=1) or (n=2) then lIN:=true;
      if (n=0) or (n=2) then l:=true;
      if CurDok.OnlySvid then begin
        if lIN then AddReport('������������� � ������ � ��','&������������� � ��������.fr3');
        if l   then AddReport('������������� � ������','&������������� � ������.fr3');
        exit;
      end;
    end else begin
      if GlobalTask.ParamAsBoolean('PRINT_SM_IN') 
        then lIN:=true
        else l:=true;
    end;
    if ds.Fld('VOSSTAN').IsNull or not ds.Fld('VOSSTAN').AsBoolean then begin
      AddReport('������ ���� � ������','&������ ���� � ������'+s+'.'+sEXT);

      if lIN then AddReport('������������� � ������ � ��','&������������� � ��������.fr3');

      if IdProg='ZAGS' then begin
        AddReport(StringOfChar('-',100),'empty');
      end;
      if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
        AddReport('������� � ������','&������� � ������BLK.fr3');
      end else begin
        AddReport('������� � ������','&������� � ������.fr3');
      end;
      AddReport('��������� � ����������� ������','&��������� � ������.fr3');
      if IdProg='ZAGS' then begin
        AddReport('������� � ������','&������� � ������.frf');
        if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
          AddReport('�������� ������� � ������','&�������� ������� � ������BLK.fr3');
        end else begin
          AddReport('�������� ������� � ������','&�������� ������� � ������.fr3');
        end;
      end;
     {$IFDEF ADD_OLD_AKT}
//        if (s='') then AddReport('������ ���� � ������ (�� ���������)','&������ ���� � ������2.frf');
     {$ENDIF}
      if GlobalTask.ParamAsBoolean('SPRAV_BEL') then begin 
        AddReport(StringOfChar('-',100),'empty');
        AddReport('������� � ������ (���.)','&������� � ������BLK_BEL.fr3');
        AddReport('�������� ������� � ������ (���.)','&�������� ������� � ������BLK_BEL.fr3');
      end;
      if l then begin
        AddReport(StringOfChar('-',100),'empty');
        AddReport('������������� � ������','&������������� � ������.fr3');
      end;
    end else begin
//      if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := '���'+s;
      s := GetAddNameAkt(false,sEXT);
      AddReport('��������������� ������ ���� � ������','&��������������� ������ ���� � ������'+s+'.frf');
      AddReport('������������� � ������','&������������� � ������(���������������).frf');
      AddReport('������� � ������','&������� � ������ �.frf');
    end;
    if (ds.Fld('LICH_NOMER').AsString=ds.Fld('REQUEST_IN').AsString) and (ds.Fld('COVER_MESSAGE_ID').AsString<>'')
      then AddReport('������ ������������������ ������','&������ ��.fr3');
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>������ ������������������ ������','&������ ��.fr3');
    AddReport('>������������� � ������ FR3','&������������� � ������.fr3');
    AddReport('>������������� � ������ (��) FR3','&������������� � ��������.fr3');
    AddReport('>������������� � ������ FR3 �� �����','&������������� � �������.fr3');
    AddReport('>������ ���� � ������2','&������ ���� � ������2.frf');
    AddReport('>������ ���� � ������2_2008','&������ ���� � ������2_2008.frf');
    AddReport('>������ ���� � ������_2008','&������ ���� � ������_2008.frf');
    AddReport('>������ ���� � ���������','&������ ���� � ���������.frf');
    AddReport('>������ ���� � ���������_2008','&������ ���� � ���������_2008.frf');
    AddReport('>������ ���� � ������ FR3','&������ ���� � ������.fr3');
    AddReport('>������ ���� � ������ FR3 �����','&������ ���� � ������5.fr3');
    AddReport('>��������������� ������ ���� � ������ 3 ','&��������������� ������ ���� � ������.fr3');
    AddReport('>������ ���� � ������ (c 26.07.2013) �����','&������ ���� � ������5�.fr3');
    AddReport('>������ ���� � ������ (c 26.07.2013)','&������ ���� � �������.fr3');
    AddReport('>������� � ������ FR3','&������� � ������.fr3');
    AddReport('>�������� ������� � ������','&�������� ������� � ������.fr3');
    AddReport('-------------------------------','&Empty.frf');
    AddReport('>������� � ������ �����','&������� � ������BLK.fr3');
    AddReport('>������� � ������ (���.)','&������� � ������BLK_BEL.fr3');
    AddReport('>�������� ������� � ������ �����','&�������� ������� � ������BLK.fr3');
    AddReport('>�������� ������� � ������ (���.)','&�������� ������� � ������BLK_BEL.fr3');
  end;
end;

//---------------------------------------------------
procedure ZSmert_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
  fld:TField;
begin
//  ds := dbGetDataSet('fmZapisSmert.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then begin
      ds.Fld('DATEZ').AsString:='';
    end else begin
      ds.Fld('DATEZ').AsDateTime := Now;
    end;
    ds.Fld('POL').AsString := '�';   
    fld := ds.FindField('DOK_KOD');
    if fld<>nil then ds.Fld('DOK_KOD').AsString:='1';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GRAG').AsInteger  := i;   
      ds.Fld('SM_GOSUD').AsInteger := i;   
      ds.Fld('RG_GOSUD').AsInteger := i;   
      ds.Fld('GT_GOSUD').AsInteger := i;   
    end;
//    ds.Fld('SM_OBL_B').AsString := Parameters('OBL_B');   
//    ds.Fld('SM_RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('SM_OBL').AsString   := Parameters('OBL');   
    ds.Fld('SM_RAION').AsString := Parameters('RAION');   
    ds.Fld('SM_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('SM_GOROD_B').AsString := Parameters('GOROD_B');   

    ds.Fld('RG_OBL').AsString   := Parameters('OBL');   
    ds.Fld('RG_RAION').AsString := Parameters('RAION');   
    ds.Fld('RG_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GT_OBL').AsString   := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');   

    // �������� �� ������������
    ds.Fld('SEM').AsInteger:=9;   
    ds.Fld('NATION').AsInteger:=190;    
    ds.Fld('OBRAZ').AsInteger:=98;    
          
    if not ds.Fld('VOSSTAN').AsBoolean then begin
      ds.Fld('VUS').AsBoolean := false;   
      ds.Fld('SDAN_VB').AsString := '�� �����������';   
      ds.Fld('SDAN_DOK').AsString := '';   
      ds.Fld('IS_SDAN_DOK').AsBoolean := true;   
      if IdProg='ZAGS' then begin
        if IsRnGorod and (Parameters('RN_GOROD')<>'') then begin
          ds.Fld('GT_RNGOROD').AsString  := Parameters('RN_GOROD');   
          ds.Fld('GT_RAION').AsString   := '';   
        end;
      end;
//      ds.Fld('VOENKOM').AsString := Parameters('ID_VOENKOM');   
    end;

    ds.Fld('CHERN').AsString := '9';   
    ds.Fld('SPEC').AsString := Parameters('����_����');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('���_����');   
    ds.Fld('RUKOV_B').AsString := Parameters('���_����_�');   
    ds.Fld('DOKUMENT').AsString := '��������� ������������� � ������ (��������������) � ';
    if ds.Fld('VOSSTAN').AsBoolean then ds.Fld('SUD_NAME').AsString := '������� ����';
  end;
end;


//-------- ���� ����������� ---------------------------------
function ZAdopt_Report : String;
var
  ds : TDataSet;
  s,sEXT,ss : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    s := GetAddNameAkt(true,sEXT);
    ss:=getAddNameSvid(ds);
//    if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := '���'+s;
    if CurDok.OnlySvid then begin
      AddReport('������������� �� �����������(����� ����. 4 ������)','&������������� �� �����������2'+ss+'.frf');
      Result := '&LIST&';
      exit;
    end;
    AddReport('������ ���� �� �����������','&������ ���� �� �����������'+s+'.'+sEXT);
    AddReport('������������� �� �����������(����� ����. 4 ������)','&������������� �� �����������2'+ss+'.frf');
    if GlobalTask.ParamAsBoolean('OLD_SVID') then begin
      AddReport('������������� �� �����������','&������������� �� �����������.frf');
      AddReport('������������� �� ����������� (������)','&������������� �� �����������(������).frf');
    end;
    AddReport('��������� �� �����������','&��������� �� �����������.fr3');
//    AddReport('������ ���� �� ����������� (c 26.07.2013)','&������ ���� �� ������������.fr3');
    AddReport('��������� �� ��������� ���� � �������� �������������','��������� �� ��������� ���� �������������.frf'); 
    {$IFDEF ADD_OLD_AKT}
//      if (s='') then AddReport('������ ���� �� ����������� (�� ���������)','&������ ���� �� �����������2.frf');
    {$ENDIF}

    if IsSystemAdmin then begin
      AddReport('-------------------------------','&Empty.frf');
      AddReport('������������� �� �����������(����� ����. 4 ������)','&������������� �� �����������2.frf');
      AddReport('������������� �� �����������(����� ����. 4 ������) �����','&������������� �� �����������2�.frf');

      AddReport('������������� �� ����������� FR3','&������������� �� �����������.fr3');
      AddReport('>������ ���� �� �����������2','&������ ���� �� �����������2.frf');
      AddReport('>������ ���� �� �����������2_2008','&������ ���� �� �����������2_2008.frf');
      AddReport('>������ ���� �� �����������_2008','&������ ���� �� �����������_2008.frf');
      AddReport('>������ ���� �� ��������������','&������ ���� �� ��������������.frf');
      AddReport('>������ ���� �� ��������������_2008','&������ ���� �� ��������������_2008.frf');
      AddReport('>������ ���� �� ����������� FR3','&������ ���� �� �����������.fr3');
      AddReport('>������ ���� �� ����������� FR3 (26.07.2013)','&������ ���� �� ������������.fr3');
    end;
    Result := '&LIST&';
  end;
end;

//---------------------------------------------------
procedure ZAdopt_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisSmert.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then  ds.Fld('DATEZ').AsString:='' else  ds.Fld('DATEZ').AsDateTime:=Now;
    ds.Fld('POL').AsString := '�';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GOSUD_DO').AsInteger := i;   
      ds.Fld('GOSUD_POSLE').AsInteger := i;   
      ds.Fld('OTEC_GRAG').AsInteger := i;   
      ds.Fld('MAT_GRAG').AsInteger := i;   
      ds.Fld('ON_GRAG').AsInteger := i;   
      ds.Fld('ONA_GRAG').AsInteger := i;   
      ds.Fld('OTEC_GOSUD').AsInteger := i;   
      ds.Fld('MAT_GOSUD').AsInteger := i;   
      ds.Fld('ON_GOSUD').AsInteger := i;   
      ds.Fld('ONA_GOSUD').AsInteger := i;   
    end;
    ds.Fld('OTEC_OBL').AsString := Parameters('OBL');   
    ds.Fld('MAT_OBL').AsString := Parameters('OBL');   
    ds.Fld('ON_OBL').AsString := Parameters('OBL');   
    ds.Fld('ONA_OBL').AsString := Parameters('OBL');   
    ds.Fld('OTEC_RAION').AsString := Parameters('RAION');   
    ds.Fld('MAT_RAION').AsString := Parameters('RAION');   
    ds.Fld('ON_RAION').AsString := Parameters('RAION');   
    ds.Fld('ONA_RAION').AsString := Parameters('RAION');   
    ds.Fld('OTEC_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('MAT_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ON_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('ONA_GOROD').AsString := Parameters('GOROD');   

//    ds.Fld('OBL_DO_B').AsString := Parameters('OBL_B');   
//    ds.Fld('RAION_DO_B').AsString := Parameters('RAION_B');   
    ds.Fld('OBL_DO').AsString   := Parameters('OBL');   
    ds.Fld('RAION_DO').AsString := Parameters('RAION');   
    ds.Fld('GOROD_DO').AsString := Parameters('GOROD');   
    ds.Fld('GOROD_DO_B').AsString := Parameters('GOROD_B');   
    ds.Fld('OBL_POSLE').AsString := Parameters('OBL');   
    ds.Fld('RAION_POSLE').AsString := Parameters('RAION');   
    ds.Fld('GOROD_POSLE').AsString := Parameters('GOROD');   

    ds.Fld('SPEC').AsString := Parameters('����_����');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('���_����');   
    ds.Fld('RUKOV_B').AsString := Parameters('���_����_�');   
  end;
end;

//-------- ���� �������� ����� ---------------------------------
function ZChName_Report : String;
var
  ds : TDataSet;
  s,sEXT,ss : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    s := GetAddNameAkt(true,sEXT);
    ss:=getAddNameSvid(ds);
//    if GlobalTask.ParamAsBoolean('AKT_ALBOM') then s := '���'+s;
    if CurDok.OnlySvid then begin
      AddReport('������������� � �������� �����','&������������� � �������� �����.fr3');
//      AddReport('������������� � �������� �����','&������������� � �������� �����(�����)'+ss+'.frf');
      Result := '&LIST&';
      exit;
    end;
    AddReport('������ ���� � �������� �����','&������ ���� � �������� �����'+s+'.'+sEXT);
    AddReport('������������� � �������� �����','&������������� � �������� �����.fr3');
    if GlobalTask.ParamAsBoolean('OLD_SVID')
      then AddReport('������������� � �������� ����� (������)','&������������� � �������� �����.frf');
    if IdProg='ZAGS' then begin
      AddReport('������� � �������� �����','&������� � �������� �����.frf');
      if GlobalTask.ParamAsBoolean('SPRAV_BLANK') then begin 
        AddReport('�������� ������� � �������� �����','&�������� ������� � �������� �����BLK.fr3');
      end else begin
        AddReport('�������� ������� � �������� �����','&�������� ������� � �������� �����.frf');
      end;
      if GlobalTask.ParamAsBoolean('SPRAV_BEL') then begin 
        AddReport('�������� ������� � �������� ����� (���.)','&�������� ������� � �������� �����BLK_BEL.fr3');
      end;
    end;
    {$IFDEF ADD_OLD_AKT}
//      if (s='') then AddReport('������ ���� � �������� ����� (�� ���������)','&������ ���� � �������� �����2.frf');
    {$ENDIF}
    if IsSystemAdmin then begin
      AddReport('-------------------------------','&Empty.frf');
      AddReport('>������������� � �������� ����� FR3','&������������� � �������� �����.fr3');
      AddReport('>������������� � �������� ����� FR3 �� �����','&������������� � �������� ������.fr3');
      AddReport('>������ ���� � �������� �����2','&������ ���� � �������� �����2.frf');
      AddReport('>������ ���� � �������� �����2_2008','&������ ���� � �������� �����2_2008.frf');
      AddReport('>������ ���� � �������� �����_2008','&������ ���� � �������� �����_2008.frf');
      AddReport('>������ ���� � �������� ��������','&������ ���� � �������� ��������.frf');
      AddReport('>������ ���� � �������� ��������_2008','&������ ���� � �������� ��������_2008.frf');
      AddReport('>������ ���� � �������� ����� FR3','&������ ���� � �������� �����.fr3');
      AddReport('>������ ���� � �������� ����� FR3 (26.06.2013)','&������ ���� � �������� ������.fr3');
      AddReport('>�������� ������� � �������� �����','&�������� ������� � �������� �����.frf');
      AddReport('>�������� ������� � �������� ����� �����','&�������� ������� � �������� �����BLK.fr3');
      AddReport('>�������� ������� � �������� ����� (���.)','&�������� ������� � �������� �����BLK_BEL.fr3');
    end;
    Result := '&LIST&';
  end;
end;

//---------------------------------------------------
procedure ZChName_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisSmert.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    if CurDok.OnlySvid then  ds.Fld('DATEZ').AsString:='' else  ds.Fld('DATEZ').AsDateTime:=Now;
    ds.Fld('POL').AsString := '�';   
    ds.Fld('DOK_TYPE').AsString  := '1';   
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('GRAG').AsInteger := i;   
      ds.Fld('GOSUD').AsInteger := i;   
      ds.Fld('M_GOSUD').AsInteger := i;   
    end;
    ds.Fld('OBL').AsString := Parameters('OBL');   
//    ds.Fld('OBL_B').AsString := Parameters('OBL_B');   
    ds.Fld('RAION').AsString := Parameters('RAION');   
//    ds.Fld('RAION_B').AsString := Parameters('RAION_B');   
    ds.Fld('GOROD').AsString := Parameters('GOROD');   
    ds.Fld('GOROD_B').AsString := Parameters('GOROD_B');   

    ds.Fld('M_OBL').AsString := Parameters('OBL');   
    ds.Fld('M_RAION').AsString := Parameters('RAION');   
    ds.Fld('M_GOROD').AsString := Parameters('GOROD');   

    ds.Fld('SPEC').AsString := Parameters('����_����');   
    WriteSpecBel('',ds);
    ds.Fld('RUKOV').AsString := Parameters('���_����');   
    ds.Fld('RUKOV_B').AsString := Parameters('���_����_�');   
    ds.Fld('OSNOV').AsString := Parameters('OSN_PER_IMENI');
    if not ds.Fld('VOSSTAN').AsBoolean then begin
      if ParamAsFloat('SUMP_POSHLINA')>0
        then ds.Fld('SUM_POSHLINA').AsFloat := ParamAsFloat('SUMP_POSHLINA'); 
      ds.Fld('POSHLINA').AsString := Parameters('POSHLINA'); 
    end;
  end;
end;
//----------------------------------------------------------------------------
function RasxodSvidNakl_Report : String;
begin
  Result := '&��������-��������� ���������.fr3';
end;
//----------------------------------------------------------------------------

function PasportViza_Report : String;
begin
  Result := '&��������� �� ����(1-��).frf';
//  AddReport('������ ���� �� ���������','&������ ���� �� ���������.frf');
//  AddReport('������������� �� ������������ ���������','&������������� �� ������������ ���������.frf');
//  Result := '&LIST&';
end;

//---------------------------------------------------
function Passport_Report : String;
begin
  AddReport('�������', '�������_�����1.fr3');
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
    AddReport('������� FR3', '�������_�����1.fr3');
    AddReport('������� old', '������� �����1.frf');
  end;
  Result := '&LIST&';
end;

//---------------------------------------------------
function VidGit_Report : String;
begin
  Result := '&��������� ��� �� ����������.frf';
end;

//---------------------------------------------------
procedure PasportViza_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
//  ds := dbGetDataSet('fmZapisSmert.Dokument');
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    i := ParamAsInteger('GOSUD');
    if i>0 then begin
      ds.Fld('RG_GOSUD').AsInteger := i;   
    end;
    ds.Fld('RG_OBL').AsString   := Parameters('OBL');   
    ds.Fld('RG_RAION').AsString := Parameters('RAION');   
    ds.Fld('RG_GOROD').AsString := Parameters('GOROD');   
    ds.Fld('RUKOV').AsString    := Parameters('���_����');   
  end;
end;

//---------------------------------------------------
procedure TalonPrib_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  i := ParamAsInteger('GOSUD');
  if i>0 then begin
    ds.Fld('CITIZEN').AsInteger := i;   
  end;
  if Parameters('PROP_ORGAN')=''
    then ds.Fld('ORGAN').AsString := Parameters('NAME')
    else ds.Fld('ORGAN').AsString := Parameters('PROP_ORGAN');
  ds.Fld('PASP_UDOST').AsInteger := 1;
  ds.Fld('DATE_SOST').AsDateTime := Now;
  ds.Fld('DATEZ').AsDateTime := Now;
  if IdProg()<>'GKH' then begin
    ds.Fld('DATE_O').AsDateTime := Now;
  end;
  ds.Fld('B_OBL_R').AsBoolean := true;
  ds.Fld('B_OBL_O').AsBoolean := true;
  ds.Fld('GOROD_R_B').AsInteger := 1;
  ds.Fld('GOROD_O_B').AsInteger := 1;
  ds.Fld('IS_VUS').AsBoolean := false;
  if IdProg()='GKH' then begin
    ds.Fld('TYPEREG').AsInteger := NOT_DVIG;
  end;
end;

function TalonPrib_Report : String;
var
  l:Boolean;
begin
  l:=false;
  if IdProg()='GKH' then begin
    AddReport('������ ��������(�6)','&������ ��������(�6).fr3');
    AddReport('����� � ������ ��������(�6)','&����� � ������ ��������(�6).fr3');
    l:=true;
  end;
  AddReport('������ ��������','&������ ��������.fr3');
  AddReport('������ �������� � ����������','&������ �������� � ����������.fr3');
  AddReport('������ �������� (2 ���.)','&������ ��������2.fr3');
  if not l 
    then AddReport('������ ��������(�6)','&������ ��������(�6).fr3');
  AddReport('����� ������������� �����', '&����� ������������� �����.fr3');
  AddReport('������������� � ����������� �� ����� ����������','&������������� � �����������.fr3');
  AddReport('��������� � ����������� �� ����� ����������','&��������� �.fr3');
  if l then AddReport('��������� � ����������� �� ����� ����������(�6)','&��������� ��6.fr3');
  AddReport('��������� � ����������� �� ����� ����������','&��������� �.fr3');
  if l then AddReport('��������� � ����������� �� ����� ����������(�6)','&��������� ��6.fr3');
  AddReport('�������� �����������','&�������� �����������(�����).fr3'); 

//  AddReport('��������� � ����������� �� ����� ����������','&��������� � ����������� �� ����� ����������.fr3'); 
//  AddReport('��������� � ����������� �� ����� ����������','&��������� � ����������� �� ����� ����������.fr3'); 

  Result := '&LIST&';
end;

//---------------------------------------------------
procedure TalonUbit_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  i := ParamAsInteger('GOSUD');
  if i>0 then begin
    ds.Fld('CITIZEN').AsInteger := i;   
  end;
  if Parameters('PROP_ORGAN')=''
    then ds.Fld('ORGAN').AsString := Parameters('NAME')
    else ds.Fld('ORGAN').AsString := Parameters('PROP_ORGAN');
  ds.Fld('DATE_SOST').AsDateTime := Now;
  ds.Fld('DATEZ').AsDateTime := Now;
  ds.Fld('PASP_UDOST').AsInteger := 1;
  ds.Fld('SMERT').AsBoolean := false;
end;

function TalonUbit_Report : String;
begin
//  AddReport('������ ������ (3 ���.) � ����������','&������ ������3 � ����������1.frf');
  if IdProg()='GKH' then begin
    AddReport('����� � ������ ������(�6)','&����� � ������ ������(�6).fr3');
    AddReport('������ ������(�6)','&������ ������(�6).fr3');
  end;
  AddReport('������ ������','&������ ������.fr3');
  AddReport('������ ������ � ����������','&������ ������ � ����������.fr3');
  AddReport('������ ������ (2 ���.)','&������ ������2.fr3');
  Result := '&LIST&';
end;


//---------------------------------------------------
procedure DeclRegistr_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
begin
  ds := fmMain.GetCurrentDokument;
  i := ParamAsInteger('GOSUD');
  if i>0 then ds.Fld('GOSUD_O').AsInteger := i;   
  if Parameters('PROP_ORGAN')=''
    then ds.Fld('ORGAN').AsString := Parameters('NAME')
    else ds.Fld('ORGAN').AsString := Parameters('PROP_ORGAN');
  ds.Fld('PASP_UDOST').AsInteger := 1;
  ds.Fld('DATEZ').AsDateTime := Now;
  i := ParamAsInteger('GOSUD');
  if i>0 then ds.Fld('GOSUD_O').AsInteger := i;   
  ds.Fld('OBL_O').AsString := Parameters('OBL');   
  ds.Fld('RAION_O').AsString := Parameters('RAION');   
  ds.Fld('GOROD_O').AsString := Parameters('GOROD');   
  ds.Fld('B_OBL_O').AsBoolean := true;
  ds.Fld('GOROD_O_B').AsInteger := 1;
  ds.Fld('TYPEREG').AsInteger:=MESTO_GIT;
  ds.Fld('KOLVO').AsInteger:=1;
  ds.Fld('POL').AsString:='�';
end;

function DeclRegistr_Report : String;
var
  sAdd:String;
begin
//  Result := '&LIST&';
//  AddReport('��������� � ����������� �� ����� ����������','&��������� � ����������� �� ����� ����������.fr3'); 
//  AddReport('��������� � ����������� �� ����� ����������','&��������� � ����������� �� ����� ����������.fr3'); 
  if GlobalTask.GetLastValueAsString('DECL_REG_A4')='1'
    then sAdd:='�4' else sAdd:='';
  if CurDok.Fld('TYPEREG').AsInteger=MESTO_GIT then begin
    Result:='&��������� � ����������� �� ����� ����������'+sAdd+'.fr3'; 
  end else begin
    Result:='&��������� � ����������� �� ����� ����������'+sAdd+'.fr3'; 
  end;
end;

function Lich_Report : String;
var
  ds : TDataSet;
begin
  ds := fmMain.GetCurrentDokument;
  AddReport('������������ ��������','&������������ �������� (�������).fr3');
  AddReport('������� ����(�����)','&������� ����.fr3');
  if IdProg()<>'GKH' 
    then AddReport('������� ����(�����)+�����','&������� ����_�����.fr3');
  AddReport('������� ����','&������� ����.frf');
  AddReport('������� � ������� ����� � ���������� ����� ���������(����)','@PrintSSS');
  Result := '&LIST&';
end;

function Adres_Report : String;
begin
  Result := '&������������ ��������.fr3';
//  AddReport('������� ����','&������� ����.frf');
//  AddReport('������� � ������� ����� � ���������� ����� ���������(����)','@PrintSSS');
//  Result := '&LIST&';
end;

//---------------------------------------------------
procedure ZOpeka_AfterCreate;
var
  ds : TDataSet;
  i : Integer;
  fld:TField;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    ds.Fld('VID').AsInteger:=GlobalTask.GetLastValueAsInteger('DEF_OPEKA'); //;
    if ds.Fld('VID').AsInteger=0 then  ds.Fld('VID').AsInteger:=VID_OPEKA_DO14;
    ds.Fld('TIP').AsInteger := CHILD_POPECH;
    ds.Fld('FORMA').AsInteger := FORMA_OPEKA;
    ds.Fld('DATEZ').AsDateTime := Now;
    ds.Fld('POL').AsString := '�';   
    fld := ds.FindField('DOK_KOD');
    if fld<>nil then ds.Fld('DOK_KOD').AsString:='1';   
    i:=ParamAsInteger('GOSUD');
    if i=0 then i:=defGrag;
    ds.Fld('LONELY').AsBoolean:=false;   
    ds.Fld('GRAG').AsInteger  := i;   
//    ds.Fld('GT_GOSUD').AsInteger := i;   
    ds.Fld('GT_B_OBL').AsBoolean := true;   
    ds.Fld('GT_OBL').AsString   := Parameters('OBL');   
    ds.Fld('GT_RAION').AsString := Parameters('RAION');   
    ds.Fld('GT_B_GOROD').AsString := Parameters('TYPEPUNKT');   
    ds.Fld('GT_GOROD').AsString := Parameters('GOROD');    
//    ds.Fld('DOLG_RUKOV').AsString := Parameters('DOLG_RUK_ZAGS');   
    ds.Fld('SPEC').AsString := Parameters('SPEC');   
  end;
end;

//---------------------------------
function ZOpeka_Report : String;
//var
//  ds : TDataSet;
//  s,ss,sEXT : String;
begin
  {
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    AddReport('����� ����� �������','&�����_�����.fr3');
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
  end;
  Result := '&LIST&';
  }
  Result := '';
end;

procedure PrintSSS;
begin
  RunPrintForm('fmPrintSSS');
end;

function Lich_Check : Boolean;
begin
//  PutError('������ !');
  Result := true;
end;

function GetLookUpPredZapis:String;
begin
  Result:='SELECT ID,NOMER,TYPEOBJ,MESTO,GOD,MONTH,DAY,BEGINR,LONGR, TELEFON, ON_FIO, ONA_FIO, FIRST_BRAK, '+
  'convert(DATER,SQL_DATE) DATER, Convert(DATE_CORR,SQL_DATE) DATE_CORR, '+
  'convert(cast(god as SQL_CHAR(4))+''-''+IIF(length(convert(month,SQL_VARCHAR))=1,''0''+convert(month,SQL_VARCHAR),convert(month,SQL_VARCHAR))+''-''+IIF(length(convert(day,SQL_VARCHAR))=1,''0''+convert(day,SQL_VARCHAR),convert(day,SQL_VARCHAR)),SQL_DATE) DATE_BRAK '+
  'FROM PredZapis WHERE '+GlobalTask.GetLastValueAsString('WHERE_PREDZAPIS')+' day>0 ORDER BY god,nomer ';
end;
//----------------------------------
function GetLookUpLic : String;
begin
 Result := 'SELECT l.DATE_FIKS, l.ID, l.NOMER, l.FIRST, n.Familia, n.Name, n.Otch,'+
    '  sp.name name_punkt, Trim(IFNULL(tu.name COLLATE ads_default_ci,''''))+'' ''+IFNULL(su.name COLLATE ads_default_ci,'''') name_ul,'+
    '  IFNULL(adr.dom,'''')+IFNULL(adr.korp,'''') dom_korp, adr.kv,'+
    '  l.Kniga_Nomer, l.Kniga_Str, l.ADRES_ID, l.CanDelete '+
 ' FROM ������������ l '+
 ' LEFT JOIN ���������      n ON n.date_fiks=l.date_fiks and l.first=n.id'+
 ' LEFT JOIN ���������    adr ON adr.date_fiks=l.date_fiks and adr.id=l.adres_id'+
 ' LEFT JOIN ������������� sp ON sp.id=adr.punkt'+
 ' LEFT JOIN �������       su ON su.id=adr.ul'+
 ' LEFT JOIN ����������    tu ON tu.id=su.tip'+
 ' WHERE l.date_fiks=''1899-12-30'' '+
 ' ORDER BY l.Nomer ';
end;

function GetLookUpSN_POST_OCH : String;
begin
 Result := 'SELECT ID, IIF(ukaz is null,'''',''�''+trim(UKAZ)+''  � '')+NAME AS NAME, ENDDATE, ''0'' TTT FROM SysSpr.SprPostOch '+
           ' union all '+
           'SELECT ID, IIF(ukaz is null,'''',''�''+trim(UKAZ)+''  � '')+NAME AS NAME, ENDDATE, ''1'' TTT FROM SysSpr.SprSnOch '+
           ' ORDER BY ttt,enddate,id ';
end;
//------------------------------------------------------------------
procedure CreateNalogZ;
var
  f  : TfmParamQuest;
  n, nGod, iRound, iNalog  : Integer;
  dDateVist, dDateSrok : TDateTime;
  nStavka,nZeml : Extended;
  ds,dsNalogi : TDataSet;
begin
  iRound := GlobalTask.ParamAsInteger('ROUND');
  f := TfmParamQuest.Create(nil);
  f.Caption := '������� ��������';
//  f.StepY:=17;
//  f.Flat:=false;
//  f.AddParamEx(1  , '�����'               , 'NALOG','TYPE=LOOKUP~DESC=LOOKUP_NALOGI~WIDTH=250');
  n := StrToInt(FormatDateTime('YYYY', GlobalTask.CurrentDate));
  f.AddParamEx(n      , '�� ����� ���'    , 'YEAR'    ,'TYPE=LIST~DESC=KEY_YEARS');
  f.AddParamEx(Now    , '���� ����������' , 'DATEVIS' ,'TYPE=DATE');
  f.AddParamEx('EMPTY', '���� ������'     , 'SROK'    ,'TYPE=DATE');
  f.AddParamEx(GlobalTask.ParamAsFloat('STAVKA_ZEM'), '������ ���������� ������' , 'STAVKA','FORMAT=###');

//  f.AddParamEx(0, '�����', '4','FORMAT=### ### ### ###.##');
//  f.AddParamEx(2, 'List', '4','TYPE=LIST~DESC=KEY_TYPE_OBJ~WIDTH=100');
//  f.AddParamEx(6, 'Spr', '5','TYPE=SPR~DESC=LOOKUP_EDIZM~WIDTH=50~DOPSHOW=NAME');
//  f.AddParamEx(8, 'LookUp', '11','TYPE=LOOKUP~DESC=LOOKUP_EDIZM~WIDTH=350');
  f.AddButtons('���������~�����',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    dDateVist:= f.GetValue('DATEVIS','D');
    dDateSrok:= f.GetValue('SROK','D');
    nStavka  := f.GetValue('STAVKA','N');
    nGod     := f.GetValue('YEAR','N');
    iNalog := 1; // ����� �� �����
    f.Free;
    ds := dbGetDataSet('fmGurnAlfKn.Query');
    if ds<>nil then ds.DisableControls;
    OpenMessage('������ ���������� ������ ...','',10);
//    if dmBase = nil then showmessage('33333333333');
//    dsNalogi := dmBase.GetDataSet('tbNalogi');
    dsNalogi := dbGetDataSet('dmBase.tbNalogi');
    if (ds <> nil) and (dsNalogi<>nil) then begin
      dbSetIndex(dsNalogi, 'PR_KEY');
      ds.First;
      try
        while not ds.Eof do begin
          // ��������� �������� ����� �����
          nZeml := dmBase.ReadPropAsFloat(ds.Fld('DATE_FIKS').AsDateTime,
                                      ds.Fld('ID').AsInteger, 'VSEGO');
          if nZeml > 0 then begin  // ���� ���� �����
//            if not dbLocate(dsNalogi, 'DATE_FIKS;ID;GOD;NALOG',[ds.Fld('DATE_FIKS').AsDateTime,ds.Fld('ID').AsInteger,
//                      nGod,iNalog], '') then begin
            if not dbFindKey(dsNalogi, [ds.Fld('DATE_FIKS').AsDateTime,ds.Fld('ID').AsInteger,
                      nGod,iNalog], true) then begin
              dsNalogi.Append;
              dsNalogi.Fld('DATE_FIKS').AsDateTime := ds.Fld('DATE_FIKS').AsDateTime;
              dsNalogi.Fld('ID').AsInteger := ds.Fld('ID').AsInteger;
              dsNalogi.Fld('TYPEOBJ').AsInteger := dmBase.TypeObj_Lich;
              dsNalogi.Fld('GOD').AsInteger   := nGod; //
              dsNalogi.Fld('NALOG').AsInteger := iNalog; 
            end else begin
              dsNalogi.Edit;
            end;
            if dDateVist <> 0 then dsNalogi.Fld('DATE_VIST').AsDateTime := dDateVist;
            if dDateSrok <> 0 then dsNalogi.Fld('DATE_SROK').AsDateTime := dDateSrok;
            dsNalogi.Fld('SUMMA_VIST').AsFloat   := xRound(nZeml*nStavka,iRound);
//            dsNalogi.Fld('SUMMA_VIST').AsFloat   := RoundBYR(nZeml*nStavka);
            dsNalogi.Post;
          end;
          ds.Next;
        end;
      finally
        ds.First;
      end;
    end;
    if ds<>nil then ds.EnableControls;
    CloseMessage();
  end else begin
    f.Free;
  end;
//  fmMain.acSprPunktExecute(nil);
//  f.AddParamEx(false, 'Boolean', '1','TYPE=BOOLEAN');
//  f.AddParamEx('������ ��������', 'String', '2','');
//  f.AddParamEx('', 'File', '8','TYPE=FILE~WIDTH=300');
//  f.AddParamEx('', 'Dir', '33','TYPE=DIR~WIDTH=300');
//  f.AddParamEx(3, 'Kvartal', '55','TYPE=KVARTAL');
//  f.AddParamEx(2, 'Month', '44','TYPE=MONTH');
end;

//------------------------------------------------------------------
procedure DeleteNalog;
var
  f  : TfmParamQuest;
  d : TDateTime;
  ds : TDataSet;
  lErr : Boolean;
  n,nGod,iNalog : Integer;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := '������� ��������';
//  f.StepY:=17;
//  f.Flat:=false;
  f.AddParamEx(1  , '�����'               , 'NALOG','TYPE=LOOKUP~DESC=LOOKUP_NALOGI~WIDTH=250');
  n := StrToInt(FormatDateTime('YYYY', GlobalTask.CurrentDate));
  f.AddParamEx(n      , '�� ����� ���'    , 'YEAR'    ,'TYPE=LIST~DESC=KEY_YEARS');
  f.AddButtons('���������~�����',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    nGod   := f.GetValue('YEAR','N');
    iNalog := f.GetValue('NALOG','N');
    f.Free;
    if Problem('  �� ������� ��� ������ ������� ? ') then begin
      ds := dbGetDataSet('fmGurnAlfKn.Query');
      d  := ds.Fld('DATE_FIKS').AsDateTime;
      SetScreenCursor('HOURCLASS');
      lErr := not dbExecuteSQL('DELETE FROM nalogi WHERE DATE_FIKS='+DateToSQL(d)+
                    ' and GOD='+IntToStr(nGod)+' and NALOG='+IntToStr(iNalog));
      RestScreenCursor;
      if lErr then begin
        PutError(dbLastError());
      end;
//      ds := dbGetDataSet('fmGurnAlfKn.Query');
//      dsNalogi := dmBase.GetDataSet('tbNalogi');
//      if (ds <> nil) and (dsNalogi<>nil) then begin
//        dbSetIndex(dsNalogi, 'PR_KEY');
//      ds.First;
//      try
//        while not ds.Eof do begin
//          ds.Next;
//        end;
//      finally
//        ds.First;
//      end;
    end;
  end else begin
    f.Free;
  end;
end;

// ��������� � ������� ��������� �� ������������ ��������� ������ �������������
procedure CheckNomerIdentif;
var
  s,sErr:String;
  dsM,dsR:TDataSet;
begin
  SetScreenCursor('HOURCLASS');
  dsR := dbGetDataSet('fmMain.mtReport');
  dbZap(dsR);
  dbSetIndex(dsR,'BOK_KEY');
  try
    dsM := dmBase.GetDataSet('���������');
    dsM.Filter:='date_fiks=STOD('+QStr(DateCurSostF)+') .and. !Empty(lich_nomer) .and. (Empty(citizen) .or. citizen='+IntToStr(defGrag)+')';
    dsM.Filtered:=true;
    dsM.First;
    while not dsM.eof do begin
      s:=CheckLichNom(true,dsM.Fld('LICH_NOMER').AsString);
      sErr:=GetErrorCheck;
      if sErr='' then begin
        if s<>dsM.Fld('LICH_NOMER').AsString then begin
          dsM.Edit;
          dsM.Fld('LICH_NOMER').AsString:=s;
          dsM.Post;
        end;
      end else begin
        dsR.Append;
        dsR.Fld('BOK').AsString:=dsM.Fld('FAMILIA').AsString+' '+dsM.Fld('NAME').AsString+' '+dsM.Fld('OTCH').AsString;
        if not dsM.Fld('DATER').IsNull then
          dsR.Fld('SSS1').AsString:=DatePropis(dsM.Fld('DATER').AsDateTime,6);
        dsR.Fld('SSS2').AsString:=dsM.Fld('LICH_NOMER').AsString;
        dsR.Fld('MMM').AsString:=sErr;
        dsR.Append;
      end;
      dsM.Next;
    end;
  finally
    dsM.Filter:='';
    dsM.Filtered:=false;
    RestScreenCursor;
  end;
//  showmessage(IntToStr(dsR.RecordCount));
  if dsR.RecordCount>0 then
    GlobalTask.PreviewReport('&��������� ������ �������������.frf');
end;

procedure TestWWW;
var
  ds : TDataSet;
  i : Integer;
begin
    if dbSetIndex(ds,'DATE_POST') then begin
      dbSetRange2(ds, [1,STOD('1900-01-01','')],[1,STOD('2005-12-31','')])
      ds.First;
      i:=0;
      while not ds.Eof do begin
        i:=i+1;
        ds.Next;
      end;
      i := dbRecordCount(ds);
      dbCancelRange(ds);
      ShowMessage(IntToStr(i)+'   '+IntToStr(dbRecordCount(ds)));
    end else begin
      ShowMessage('���������� �� �����������');
    end;
end;
//-------------------------------------------------------
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
  sTmpWHERE:='ID<>'+sOldID;         // ���-�� � GetLookUpZAGS ��. ����
  f := TfmParamQuest.Create(nil);
  f.Caption := '�������� ����� ����';
  f.AddParamEx(0,'����', 'ZAGS','TYPE=LOOKUP~DESC=LOOKUP_SPRNAMES2~WIDTH=250');
  f.AddParamEx(Date,'�� ����', 'DATE_DO','TYPE=DATE');
  f.AddButtons('���������~�����',0);
  n:=f.ShowQuest;
  sNewID:='';
  if n = 1 then begin
    sNewID:=IntToStr(f.GetValue('ZAGS','N'));
    dDo:=f.GetValue('DATE_DO','D');
  end;
  f.Free;
  sTmpWHERE:='';
  if (sNewID<>'') and (sNewID<>'0') and (sNewID<>'-1') then begin
//    writedebug(DatePropis(dDo,0)+'  '+DatePropis(Now,0));
    if (dDo>0) and (dDo<Date) then begin
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
        sSQL:='';
        sss:='';
        if (dDo>0) and (dDo<Date) then begin
          if (UpperCase(GetNameTableZAGS(i))='ALFAVITZAGS') then begin
            DecodeDate(dDo,nYear,nMonth,nDay);
            sss:='and isnull(dayz,0)>0 and isnull(monthz,0)>0 and isnull(yearz,0)>0 and '+
                 'cast(trim(cast(yearz as SQL_CHAR))+''-''+right(''0''+trim(cast(monthz as SQL_CHAR)),2)+''-''+right(''0''+trim(cast(dayz as SQL_CHAR)),2) as SQL_DATE)<='+DateToSQL(dDo);
            sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+sss+';';
          end else if (UpperCase(GetNameTableZAGS(i))='LISTSVID') then begin

          end else begin
            sss:=' and datez<='+DateToSQL(dDo);
            sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+sss+';';
          end;
        end else begin
          sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+';';
        end;
        if sSQL<>'' then begin
//          writedebug(sSQL);
          dbExecuteSQL(sSQL);
          if dbLastError()<>'' then begin
//            writedebug(dbLastError());
            PutError( '������ ����������: '+dbLastError() );
          end;
        end;
      end;
      CloseMessage();
    end;
  end;
end;

//--------------------------------
function GetLookUpZAGS:String;
var
  ss:String;
begin
  if sTmpWHERE<>'' then ss:=' WHERE '+sTmpWHERE else ss:='';
  Result:='SELECT ID,NAME FROM SprNames '+ss+' ORDER BY soato'; // ���������� sTmpWHERE ��. ���� ChangeID_ZAGS
end;

//------------------------------------------------
procedure ChangeSERIA_SVID;
var
  f  : TfmParamQuest;
  n,i  : Integer;
  ds : TDataSet;
  sNewID,sOldID:String;
  sNewNAME,sOldNAME,sSQL:String;
begin
  ds:=dmBase.GetDataSet('SvidSeria');
  sOldID:=ds.Fld('SERIA').AsString;
  sOldName:=ds.Fld('SERIA').AsString;
  sTmpWHERE:='SERIA<>'+QStr(sOldID);
  f := TfmParamQuest.Create(nil);
  f.Caption := '�������� ����� �����';
  f.AddParamEx('','�����', 'SERIA','TYPE=LOOKUP~DESC=LOOKUP_SERIASVID~WIDTH=100');
  f.AddButtons('���������~�����',0);
  n:=f.ShowQuest;
  sNewID:='';
  if n = 1 then begin
    sNewID:=f.GetValue('SERIA','S');
  end;
  f.Free;
  sTmpWHERE:='';
  if (sNewID<>'') and (sNewID<>'0') and (sNewID<>'-1') then begin
    sNewName:=sNewID;
    if OkWarning('���� �� ������ �������� �����:   '+Chr(13)+
                 '"'+sOldName+'"  '+Chr(13)+
                 ' ��'+Chr(13)+
                 '"'+sNewName+'"  '+Chr(13)+
                 '������� � ���� ����� ����� "��" ') then begin
      OpenMessage('     ������  "'+sOldName+'" �� "'+sNewName+'" ... ','',10);
      sNewID:=QStr(sNewID);
      sOldID:=QStr(sOldID);
      sSQL:=' update SvidPovtor set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
            ' update ������������ set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
            ' update ����������� set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
            ' update ���������������� set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
            ' update ���������������� set svid_seria2='+sNewID+' where svid_seria2='+sOldID+';'+chr(13)+
            ' update ���������������� set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13);
      if IdProg='ZAGS' then begin
        sSQL:=sSQL+
              ' update AktAdopt set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
              ' update AktChangeName set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
              ' update ������������������ set svid_seria='+sNewID+' where svid_seria='+sOldID+';'+chr(13)+
              ' update AktTermMarriage set on_svid_seria='+sNewID+' where on_svid_seria='+sOldID+';'+chr(13)+
              ' update AktTermMarriage set ona_svid_seria='+sNewID+' where ona_svid_seria='+sOldID+';';
      end;
      dbExecuteSQL(sSQL);
      if dbLastError()<>'' then begin
        ShowMessage( '������ ����������: '+dbLastError() );
      end else begin
        // ������ ��������� SVID_TYPE, SVID_SERIA(������;�����), SVID_NOMER
        sSQL:='DELETE FROM listsvid WHERE EXISTS (SELECT * from ( '+
          'select SVID_TYPE, IIF(SVID_SERIA='+sOldID+','+sNewID+',SVID_SERIA) SVID_SERIA, SVID_NOMER, count(*) '+
          'from listsvid l  group by 1,2,3  having count(*)>1) aaa '+
          'WHERE listsvid.svid_type=aaa.svid_type and listsvid.svid_nomer=aaa.svid_nomer and listsvid.svid_seria='+sOldID+');';
        dbExecuteSQL(sSQL);
        dbExecuteSQL('update ListSvid set svid_seria='+sNewID+' where svid_seria='+sOldID+';');
        if dbLastError()<>'' then begin
          ShowMessage( '������ (������� ������������): '+dbLastError() );
        end else begin
          ds.Delete;
        end;
      end;
      CloseMessage();
    end;
  end;
end;
//--------------------------------
function GetLookUpSERIA:String;
var
  ss:String;
begin
  if sTmpWHERE<>'' then ss:=' WHERE '+sTmpWHERE else ss:='';
  Result:='SELECT SERIA AS ID, SERIA AS NAME FROM SvidSeria '+ss+' ORDER BY seria'; // ���������� sTmpWHERE ��. ���� 
end;
//------------------------------------------------
procedure ChangeID_UL;
var
  f  : TfmParamQuest;
  n,i  : Integer;
  ds,dsEx : TDataSet;
  sNewID,sOldID:String;
  sNewNAME,sOldNAME,sSQL:String;
begin
  ds:=dmBase.GetDataSet('SprUL');
  sOldID:=ds.Fld('ID').AsString;
  dsEx:=dmBase.GetDataSet('LookupUL');
  if not dbLocate(dsEx, 'ID', [sOldID], '') then begin
    PutError('�� ������� �����!');
    exit;
  end;
  sOldName:=dsEx.Fld('NAME').AsString;
  dsEx.First;
  sNewID:='';
  n:=0;
  try
    dsEx.Filter:='ID<>'+sOldID;
    dsEx.Filtered:=true;
    f := TfmParamQuest.Create(nil);
    f.Caption := '�������� ����� �����';
    f.AddParamEx(0,'�����', 'ULICA','TYPE=LOOKUP~DESC=LOOKUP_UL~WIDTH=250');
    f.AddButtons('���������~�����',0);
    n:=f.ShowQuest;
    sNewName:=dsEx.Fld('NAME').AsString;
  finally
    dsEx.Filter:='';
    dsEx.Filtered:=false;
  end;
  if n=1 then begin
    sNewID:=f.GetValue('ULICA','S');
  end;
  f.Free;
  if (sNewID<>'') and (sNewID<>'0') and (sNewID<>'-1') then begin
    if OkWarning('���� �� ������ �������� �����:   '+Chr(13)+
                 '"'+sOldName+'"  '+Chr(13)+
                 ' ��'+Chr(13)+
                 '"'+sNewName+'"  '+Chr(13)+
                 '������� � ���� ����� ����� "��" ') then begin
      OpenMessage('     ������  "'+sOldName+'" �� "'+sNewName+'" ... ','',10);
//      sNewID:=QStr(sNewID);
//      sOldID:=QStr(sOldID);
      sSQL:=' update ��������� set ul='+sNewID+' where ul='+sOldID+';'
      dbExecuteSQL(sSQL);
      if dbLastError()<>'' then begin
        CloseMessage();
        ShowMessage( '������ ����������: '+dbLastError() );
      end else begin
        ds.Delete;
        sSQL:=' update BigHouse set ul='+sNewID+' where ul='+sOldID+';';
        dbExecuteSQL(sSQL);
        if dbLastError()<>'' then begin
          CloseMessage();
          ShowMessage( '������ ����������: ���� �����'+Chr(13)+'��������� ���������������� ���� �����' );
        end;
      end;
      CloseMessage();
    end;
  end;
end;
//--------------------------------
function GetLookUpULICA:String;
var
  ss:String;
begin
  if sTmpWHERE<>'' then ss:=' WHERE '+sTmpWHERE else ss:='';
  Result:='SELECT ID, NAME FROM SprUL '+ss+' ORDER BY name'; // ���������� sTmpWHERE ��. ���� 
end;

function getSprInternat:String;
begin
  Result:='dmBase.SprUchZaved';  // � progo.pas ���� ����� ��  �������   dmBase.SprInternat
end;

begin
end.
