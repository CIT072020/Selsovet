// ����.����
program Main;
var
  idConn, TypeBASE : String;
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
  z_opeka    = '63';
  datecursostS='1899-12-30';
  datecursostF='18991230';
  BEZ_ADRESA  = 3; //  ������� �� ��������� � �� ��������������� (�����)

  SHAMP_=1;
  SHAMP_GERB=2;
  MESTO_GIT=1;
  MESTO_PREB=0;
  MESTO_NOTREG=2;
  IZM_MEN=2;     // �������� ������ � ��������   
  NOT_DVIG=3;    // �� ���������                 

  MAX_OCHERED=4;   //  ������. ����� ������� (�������)

  OCH_RESH_POST=1;
  OCH_RESH_VOST=2;
  OCH_RESH_RAZD=3;
  OCH_RESH_PERE=4;
  OCH_RESH_UNION=5;
  OCH_RESH_SN=9;
  OCH_RESH_ADDMEN=6;
  OCH_RESH_ISKMEN=7;

  OCH_RESID_OBSH=1;    // residence=���������

  OCH_TYPE_OBSH=0;   // ����� �����
  OCH_TYPE_SOCIAL=2; // ���������� �����
  OCH_TYPE_ANY_OTD=1000; // ����� ���������

  OCH_OSN_FULL=1;   // ������ ������������
  OCH_OSN_FULL2=6;   // ������ ������������ + ������������ �����
  OCH_OSN_KRAT=2;   // ������� + ������������ �����
  OCH_OSN_UKAZ=3;   // ����� + ������������ �����
  OCH_OSN_POLOG=4;  // ����� + ���������
  OCH_OSN_PUNKT=5;  // ������ ����� ������

//{$DEFINE OLD_SVID}
{$DEFINE OBR_GRAG}
//{$DEFINE OCHERED}
//{$DEFINE CHECK_ATE}

{$I load.pas}
{$I personal.pas}
{$I update.pas}

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
//  if IDProg()='SELSOVET' then begin
    CreateReportTable('GRUP',true);
//  end;
  idConn:=dbRegisterConnect('AdsConnection','CHARTYPE=ANSI;TABLETYPE=ADT');

  TypeBASE:=GlobalTask.GetWorkParam('TYPEBASE');
  if TypeBASE='' then TypeBASE:='POST';
//  ShowMessage(GetPadegFIO('�������', '�', '�'));
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

//---------------------------------------------------------------
function DolgSecretar : String; begin Result:='1111';  end; //'����������� ������';
function FIOSecretar : String;  begin Result:='2222';   end;

function DolgRukov : String;    begin Result:=ParamAsString('DOLG_RUKOV');  end;
function FIORukov : String;     begin Result:=ParamAsString('RUKOV');end;

function DolgGlBux : String;    
begin 
  Result:=ParamAsString('DOLG_GL_BUX'); 
  if Result='' then Result:='������� ���������';
end;
function FIOGlBux : String;  begin Result:=ParamAsString('��_���������');end;

//---------------------------------------------------------------
function DolgSpec : String;    
begin  Result:=ParamAsString('DOLG_SPEC'); end;
//---------------------------------------------------------------
function FIOSpec : String;     
begin  Result:=ParamAsString('SPEC');   end;

//-------------------------------------------------------------------------
procedure FirstLoadTerr;
var
  dsUL_Nal, dsUL, dsSour, dsDest : TDataSet;
  strTerr, strAdd : String;
begin
  strTerr := SoatoFromID(MyID());
  if (strTerr<>'') and dbSetCurrentConnect(idConn) then begin
    SetScreenCursor('HOURCLASS');
    dsSour:=dbOpenSQL('SELECT kod,name,typepunkt,id FROM SysSpr.�������� ORDER BY KOD','');
    if dsSour<>nil then begin
        if Copy(strTerr,2,1)='4' then begin // ������� ����� + ���. ����� ����. ���. ������
          dsSour.Filter := 'kod='+''''+Copy(strTerr,1,4)+'000000'+''''+ ' or '+
           '(substr(kod,1,4)='+''''+Copy(strTerr,1,4)+''''+' and substr(kod,5,3)>'+''''+'500'+''''+
           ' and !Empty(typepunkt) )';
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
   sl := TStringList.Create;
   StrToStrings(s, sl, ' ');
   if sl.Count=3 then begin
     Men.Fld('Familia').AsString := Trim(FirstUpper(sl[0]));
     Men.Fld('Name').AsString := Trim(FirstUpper(sl[1]));
     Men.Fld('Otch').AsString := Trim(FirstUpper(sl[2]));
   end else begin
     Men.Fld('Familia').AsString := Trim(FirstUpper(Men.Fld('Familia').AsString));
   end;
   sl.Free;
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

const
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
var
  ds : TDataSet;
  s,ss,sEXT : String;
begin
  ds := fmMain.GetCurrentDokument;
  if ds<>nil then begin
    AddReport('����� ����� �������','&�����_�����.fr3');
  end;
  if IsSystemAdmin then begin
    AddReport('-------------------------------','&Empty.frf');
  end;
  Result := '&LIST&';
end;

//----------------------------------------------------------------------------

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
 Result := 'SELECT ID, ''�''+trim(UKAZ)+''  � ''+NAME AS NAME, ENDDATE, ''0'' TTT FROM SysSpr.SprPostOch '+
           ' union all '+
           'SELECT ID, ''�''+trim(UKAZ)+''  � ''+NAME AS NAME, ENDDATE, ''1'' TTT FROM SysSpr.SprSnOch '+
           ' ORDER BY ttt,enddate,id ';
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
      sSQL:=' update ��������� set ul='+sNewID+' where ul='+sOldID+';'+chr(13)+
            ' update BigHouse set ul='+sNewID+' where ul='+sOldID+';';
      dbExecuteSQL(sSQL);
      if dbLastError()<>'' then begin
        ShowMessage( '������ ����������: '+dbLastError() );
      end else begin
        ds.Delete;
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
  Result:='dmBase.SprInternat';  // � prog.pas ���� ����� ��  �������   dmBase.SprUchZaved
end;


//=== ���������� 06 ��������� ������� ============================================================

const
   //������ � ������
   Indent=10;

procedure drAddName(ds: TDataSet; Name: string; Lev: Integer);
begin
   ds.Append;
   ds.Fld('NAME').AsString:=Name;
   ds.Fld('LEV').AsInteger:=Lev*Indent;
   ds.Post;
end;

procedure drSetPercent(ds, qu: TDataSet; Val, Cur, Prev: string);
begin
   if (qu.Fld(Prev).AsInteger<>0) and (qu.Fld(Cur).AsInteger<>0) then begin
      ds.Fld(Val).AsString:=FormatFloat('##0.0',xRound((qu.Fld(Cur).AsInteger/qu.Fld(Prev).AsInteger)*100, 1));
   end
   else begin
      ds.Fld(Val).AsString:='-';
   end;
end;

procedure drAddValue1(ds, qu: TDataSet; Name, Val1, Val2: string; Lev: Integer);
begin
   ds.Append;
   ds.Fld('NAME').AsString:=qu.Fld(Name).AsString;
   ds.Fld('VAL1').AsString:=qu.Fld(Val1).AsString;
   ds.Fld('VAL2').AsString:=qu.Fld(Val2).AsString;
   ds.Fld('VAL3').AsString:=IntToStr(qu.Fld(Val1).AsInteger-qu.Fld(Val2).AsInteger);
   drSetPercent(ds, qu, 'VAL4', Val1, Val2);
   ds.Fld('LEV').AsInteger:=Lev*Indent;
   ds.Post;
end;

procedure drAddValue2(ds, qu: TDataSet; Name, Val1, Val2: string; Lev: Integer);
begin
   ds.Append;
   ds.Fld('NAME').AsString:=Name;
   ds.Fld('VAL1').AsString:=qu.Fld(Val1).AsString;
   ds.Fld('VAL2').AsString:=qu.Fld(Val2).AsString;
   ds.Fld('VAL3').AsString:=IntToStr(qu.Fld(Val1).AsInteger-qu.Fld(Val2).AsInteger);
   drSetPercent(ds, qu, 'VAL4', Val1, Val2);
   ds.Fld('LEV').AsInteger:=Lev*Indent;
   ds.Post;
end;

function DocQuarterReport: Boolean;
var
   fmParam: TfmParamQuest;
   dsReport: TDataSet;
   quSQL: TDataSet;
   Res: Integer;
   Date1: TDateTime;
   Date2: TDateTime;
   SQL: string;
   CurYear: string;
   PrevYear: string;
begin
   Result:=False;
   //����� ������� ����������
   fmParam:=TfmParamQuest.Create(nil);
   fmParam.Caption:='���������';
   fmParam.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
   fmParam.AddParamEx(Now, '�������� ����' , 'DATE2' ,'TYPE=DATE');
   fmParam.AddButtons('���������~�����',0);
   Res:=fmParam.ShowQuest;
   //
   if Res=1 then begin
      Date1:=fmParam.GetValue('DATE1','D');
      Date2:=fmParam.GetValue('DATE2','D');
      GlobalTask.SetLastValueAsDate('DATE_START', Date1);
      GlobalTask.SetLastValueAsDate('DATE_END', Date2);
      CurYear:=' d.REG_DATE between '+DateToSql(Date1)+' and '+DateToSql(Date2)+' ';
      PrevYear:=' d.REG_DATE between '+DateToSql2(Date1)+' and '+DateToSql2(Date2)+' ';
      dsReport:=FindReportTable('DOC_QREP');
      dbZap(dsReport);
  
      OpenMessage('������������ ������ �� ���������� �������','',10);

      //IN01 ���������, �����
      //IN02 ����������� � ������������� ���� //NB: ???
      //IN04 ���������, �������������
      //IN06 ���������, ���������
      //IN07 ���������, ���������, �������������
      //IN08 ���������, ����������, �����
      //IN09 ���������, ����������, �� �����������
      //IN11 ���������, ����������, ������������
      //IN12 ���������, ����������, 30 � ����� �������
      //IN13 ���������, ������, ����� //NB: ???
      //IN14 ���������, ����������, �� ����������� ���
      //IN15 ���������, �����������, ����� NB: ???   vadim  21.10.2016
      SQL:=
         'select '+
         '   sum(iif('+CurYear+', 1, 0)) as IN01_VAL1, '+
         '   sum(iif('+PrevYear+', 1, 0)) as IN01_VAL2, '+
         '   sum(iif('+CurYear+'and d.EXEC_FACT<=d.EXEC_TERM, 1, 0)) as IN02_VAL1, '+
         '   sum(iif('+PrevYear+'and d.EXEC_FACT<=d.EXEC_TERM, 1, 0)) as IN02_VAL2, '+
         '   sum(iif('+CurYear+'and d.ANS_KIND=1, 1, 0)) as IN04_VAL1, '+
         '   sum(iif('+PrevYear+'and d.ANS_KIND=1, 1, 0)) as IN04_VAL2, '+
         '   sum(iif('+CurYear+'and d.IS_REPEAT=true, 1, 0)) as IN06_VAL1, '+
         '   sum(iif('+PrevYear+'and d.IS_REPEAT=true, 1, 0)) as IN06_VAL2, '+
         '   sum(iif('+CurYear+'and d.IS_REPEAT=true and d.ANS_KIND=1, 1, 0)) as IN07_VAL1, '+
         '   sum(iif('+PrevYear+'and d.IS_REPEAT=true and d.ANS_KIND=1, 1, 0)) as IN07_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1, 1, 0)) as IN08_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1, 1, 0)) as IN08_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and c.CORR_TYPE=1, 1, 0)) as IN09_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and c.CORR_TYPE=1, 1, 0)) as IN09_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and d.SIGN_TYPE=20, 1, 0)) as IN11_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and d.SIGN_TYPE=20, 1, 0)) as IN11_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and d.SIGN_TYPE=20 and d.SIGN_NUM>=30, 1, 0)) as IN12_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and d.SIGN_TYPE=20 and d.SIGN_NUM>=30, 1, 0)) as IN12_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=3, 1, 0)) as IN13_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=3, 1, 0)) as IN13_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and d.SIGN_KIND=2, 1, 0)) as IN14_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and d.SIGN_KIND=2, 1, 0)) as IN14_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=2, 1, 0)) as IN15_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=2, 1, 0)) as IN15_VAL2 '+
         'from DOCMAIN d '+
         '   left join ������������� c on c.ID=d.COVER_CORR '+
         'where d.DOC_TYPE=1 and d.NOT_EXP=False and '+
         //���������: ����������, ���������, �� �����������
         '      (d.COVER_CORR is null or not (isnull(d.APP_FORM,0)=1 and isnull(c.CORR_TYPE,0)=1 and isnull(d.COVER_TYPE,0)=1)) ';
      quSQL:=dbOpenSQL(SQL, '');

      drAddValue2(dsReport, quSQL, '��������� ���������, �����', 'IN01_VAL1', 'IN01_VAL2', 0);
      drAddValue2(dsReport, quSQL, '�� ��� �������������', 'IN04_VAL1', 'IN04_VAL2', 1);
      drAddValue2(dsReport, quSQL, '���������', 'IN06_VAL1', 'IN06_VAL2', 0);
      drAddValue2(dsReport, quSQL, '�� ��� �������������', 'IN07_VAL1', 'IN07_VAL2', 1);
      drAddValue2(dsReport, quSQL, '����������� � ������������� ����', 'IN02_VAL1', 'IN02_VAL2', 0);
      drAddValue2(dsReport, quSQL, '��������� ���������� ���������, �����', 'IN08_VAL1', 'IN08_VAL2', 0);
      drAddValue2(dsReport, quSQL, '����� ����������� ������', 'IN09_VAL1', 'IN09_VAL2', 1);
      drAddValue2(dsReport, quSQL, '������������ ���������', 'IN11_VAL1', 'IN11_VAL2', 1);
      drAddValue2(dsReport, quSQL, '� ��� ����� �� 30 � ����� �������', 'IN12_VAL1', 'IN12_VAL2', 2);
      drAddValue2(dsReport, quSQL, '�� ����������� ���', 'IN14_VAL1', 'IN14_VAL2', 1);
      drAddValue2(dsReport, quSQL, '��������� ������ ��������� �����', 'IN13_VAL1', 'IN13_VAL2', 0);
      drAddValue2(dsReport, quSQL, '��������� ����������� ��������� �����', 'IN15_VAL1', 'IN15_VAL2', 0);

      //IN16 ���������, ����������, ���������, �� �����������
      SQL:=
         'select '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and c.CORR_TYPE=1 and d.COVER_TYPE=1, 1, 0)) as IN16_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and c.CORR_TYPE=1 and d.COVER_TYPE=1, 1, 0)) as IN16_VAL2 '+
         'from DOCMAIN d '+
         '   left join ������������� c on c.ID=d.COVER_CORR '+
         'where d.DOC_TYPE=1 and d.NOT_EXP=False ';
      dbChangeSQL(quSQL ,SQL, True); 
      drAddValue2(dsReport, quSQL, '��������� ���������', 'IN16_VAL1', 'IN16_VAL2', 0);

      //IN05 ���������, �� �������/���������� ���������
      SQL:=
         'select ifnull(sp.NAME, ''������/��������� �� �������'') as MAN_GROUP_NAME, s.IN05_VAL1, s.IN05_VAL2 '+
         'from ( '+
         '   select '+
         '      SIGN_GROUP, '+
         '      sum(iif('+CurYear+', 1, 0)) as IN05_VAL1, '+
         '      sum(iif('+PrevYear+', 1, 0)) as IN05_VAL2 '+
         '   from DOCMAIN d '+
         '      left join ������������� c on c.ID=d.COVER_CORR '+
         '   where DOC_TYPE=1 and d.NOT_EXP=False and '+
         '          ('+CurYear+' or '+PrevYear+') and '+
                   //���������: ����������, ���������, �� �����������
         '         (d.COVER_CORR is null or not (isnull(d.APP_FORM,0)=1 and isnull(c.CORR_TYPE,0)=1 and isnull(d.COVER_TYPE,0)=1)) '+
         '   group by SIGN_GROUP) s '+
         'left join SprDocManGroup sp on sp.ID=s.SIGN_GROUP '+
         'order by sp.id';
      dbChangeSQL(quSQL ,SQL, True); 
      quSQL.First;
      if not quSQL.Eof then begin
         drAddName(dsReport, '��������� ��������� ��:', 0)
         while not quSQL.Eof do begin
            drAddValue1(dsReport, quSQL, 'MAN_GROUP_NAME', 'IN05_VAL1', 'IN05_VAL2', 1);
            quSQL.Next;
         end;
      end;
        
      //IN15 ���������, �� ���������
      SQL:=
         'select ifnull(sp.NAME, ''�������� �� �������'') as SUBJ_NAME, s.IN15_VAL1, s.IN15_VAL2 '+
         'from ( '+
         '   select '+
         '      SUBJ_ID, '+
         '      sum(iif('+CurYear+', 1, 0)) as IN15_VAL1, '+
         '      sum(iif('+PrevYear+', 1, 0)) as IN15_VAL2 '+
         '   from DOCMAIN d'+
         '      left join ������������� c on c.ID=d.COVER_CORR '+
         '   where DOC_TYPE=1 and d.NOT_EXP=False and '+
         '          ('+CurYear+' or '+PrevYear+') and '+
                   //���������: ����������, ���������, �� �����������
         '         (d.COVER_CORR is null or not (isnull(d.APP_FORM,0)=1 and isnull(c.CORR_TYPE,0)=1 and isnull(d.COVER_TYPE,0)=1)) '+
         '   group by SUBJ_ID) s '+
         'left join SprDocSubj sp on sp.ID=s.SUBJ_ID '+
         'order by sp.code';
      dbChangeSQL(quSQL ,SQL, True);
      quSQL.First;
      if not quSQL.Eof then begin 
         drAddName(dsReport, '��������� ��������� �� ���������:', 0);
         while not quSQL.Eof do begin
            drAddValue1(dsReport, quSQL, 'SUBJ_NAME', 'IN15_VAL1', 'IN15_VAL2', 1);
            quSQL.Next;
         end;
      end;
      dbClose(quSQL);
      CloseMessage();
      Result:=True;
   end;
   fmParam.Free;
end;

function DocQuarterReport2: Boolean;
var
   fmParam: TfmParamQuest;
   dsReport: TDataSet;
   quSQL: TDataSet;
   quSQL2: TDataSet;
   Res: Integer;
   Date1: TDateTime;
   Date2: TDateTime;
   SQL: string;
   SQL2: string;
   CurYear: string;
   PrevYear: string;
begin
   Result:=False;
   //����� ������� ����������
   fmParam:=TfmParamQuest.Create(nil);
   fmParam.Caption:='���������';
   fmParam.AddParamEx(Now, '��������� ����' , 'DATE1' ,'TYPE=DATE');
   fmParam.AddParamEx(Now, '�������� ����' , 'DATE2' ,'TYPE=DATE');
   fmParam.AddButtons('���������~�����',0);
   Res:=fmParam.ShowQuest;
   //
   if Res=1 then begin
      Date1:=fmParam.GetValue('DATE1','D');
      Date2:=fmParam.GetValue('DATE2','D');
      GlobalTask.SetLastValueAsDate('DATE_START', Date1);
      GlobalTask.SetLastValueAsDate('DATE_END', Date2);
      CurYear:=' d.REG_DATE between '+DateToSql(Date1)+' and '+DateToSql(Date2)+' ';
      PrevYear:=' d.REG_DATE between '+DateToSql2(Date1)+' and '+DateToSql2(Date2)+' ';
      dsReport:=FindReportTable('DOC_QREP');
      dbZap(dsReport);
  
      OpenMessage('������������ ������ �� ���������� �������','',10);

      //IN01 ���������, �����
      //IN06 ���������, ���������
      //IN08 ���������, ����������, �����
      //IN09 ���������, ����������, �� �����������
      //IN13 ���������, ������, ����� //NB: ???
      //IN15 ���������, �����������, ����� //NB: ???   vadim
      SQL:=
         'select '+
         '   sum(iif('+CurYear+', 1, 0)) as IN01_VAL1, '+
         '   sum(iif('+PrevYear+', 1, 0)) as IN01_VAL2, '+
         '   sum(iif('+CurYear+'and d.IS_REPEAT=true, 1, 0)) as IN06_VAL1, '+
         '   sum(iif('+PrevYear+'and d.IS_REPEAT=true, 1, 0)) as IN06_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1, 1, 0)) as IN08_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1, 1, 0)) as IN08_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and c.CORR_TYPE=1, 1, 0)) as IN09_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and c.CORR_TYPE=1, 1, 0)) as IN09_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=3, 1, 0)) as IN13_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=3, 1, 0)) as IN13_VAL2, '+
         '   sum(iif('+CurYear+'and d.APP_FORM=2, 1, 0)) as IN15_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=2, 1, 0)) as IN15_VAL2 '+
         'from DOCMAIN d '+
         '   left join ������������� c on c.ID=d.COVER_CORR '+
         'where d.DOC_TYPE=1 and d.NOT_EXP=False and '+
                //���������: ����������, ���������, �� �����������
         '      (d.COVER_CORR is null or not (isnull(d.APP_FORM,0)=1 and isnull(c.CORR_TYPE,0)=1 and isnull(d.COVER_TYPE,0)=1)) ';

      //IN16 ���������, ����������, ���������, �� �����������
      SQL2:=
         'select '+
         '   sum(iif('+CurYear+'and d.APP_FORM=1 and c.CORR_TYPE=1 and d.COVER_TYPE=1, 1, 0)) as IN16_VAL1, '+
         '   sum(iif('+PrevYear+'and d.APP_FORM=1 and c.CORR_TYPE=1 and d.COVER_TYPE=1, 1, 0)) as IN16_VAL2 '+
         'from DOCMAIN d '+
         '   left join ������������� c on c.ID=d.COVER_CORR '+
         'where d.DOC_TYPE=1 and d.NOT_EXP=False ';

      quSQL:=dbOpenSQL(SQL, '');
      quSQL2:=dbOpenSQL(SQL2, '');
      //�������� ������
      dsReport.Append;
      dsReport.Fld('NAME').AsString:='�������� ������';
      dsReport.Fld('VAL1').AsInteger:=quSQL.Fld('IN08_VAL1').AsInteger;
      dsReport.Fld('VAL2').AsInteger:=quSQL.Fld('IN13_VAL1').AsInteger;
      dsReport.Fld('VAL3').AsInteger:=quSQL.Fld('IN15_VAL1').AsInteger;
      dsReport.Fld('VAL4').AsInteger:=quSQL.Fld('IN01_VAL1').AsInteger;
      dsReport.Fld('VAL5').AsInteger:=quSQL.Fld('IN09_VAL1').AsInteger;
      dsReport.Fld('VAL6').AsInteger:=quSQL.Fld('IN06_VAL1').AsInteger;
      dsReport.Fld('VAL7').AsInteger:=quSQL2.Fld('IN16_VAL1').AsInteger;
      dsReport.Post;
      //��������������� ������ �������� ����
      dsReport.Append;
      dsReport.Fld('NAME').AsString:='��������������� ������ �������� ����';
      dsReport.Fld('VAL1').AsInteger:=quSQL.Fld('IN08_VAL2').AsInteger;
      dsReport.Fld('VAL2').AsInteger:=quSQL.Fld('IN13_VAL2').AsInteger;
      dsReport.Fld('VAL3').AsInteger:=quSQL.Fld('IN15_VAL2').AsInteger;
      dsReport.Fld('VAL4').AsInteger:=quSQL.Fld('IN01_VAL2').AsInteger;
      dsReport.Fld('VAL5').AsInteger:=quSQL.Fld('IN09_VAL2').AsInteger;
      dsReport.Fld('VAL6').AsInteger:=quSQL.Fld('IN06_VAL2').AsInteger;
      dsReport.Fld('VAL7').AsInteger:=quSQL2.Fld('IN16_VAL2').AsInteger;
      dsReport.Post;
      //�������� ������ � ���������������� ������� �������� ����, %
      dsReport.Append;
      dsReport.Fld('NAME').AsString:='�������� ������ � ���������������� ������� �������� ����, %';
      drSetPercent(dsReport, quSQL, 'VAL1', 'IN08_VAL1', 'IN08_VAL2')
      drSetPercent(dsReport, quSQL, 'VAL2', 'IN13_VAL1', 'IN13_VAL2')
      drSetPercent(dsReport, quSQL, 'VAL3', 'IN15_VAL1', 'IN15_VAL2')
      drSetPercent(dsReport, quSQL, 'VAL4', 'IN01_VAL1', 'IN01_VAL2')
      drSetPercent(dsReport, quSQL, 'VAL5', 'IN09_VAL1', 'IN09_VAL2')
      drSetPercent(dsReport, quSQL, 'VAL6', 'IN06_VAL1', 'IN06_VAL2')
      drSetPercent(dsReport, quSQL2, 'VAL7', 'IN16_VAL1', 'IN16_VAL2')
      dsReport.Post;

      dbClose(quSQL2);
      dbClose(quSQL);
      CloseMessage();
      Result:=True;
   end;
   fmParam.Free;
end;

//-------------------------------------------------------------------
{
function CheckCountEkzAkt:Boolean;
begin
  Result:=true;
  if DokZags.Fld('NOMER_EKZ').AsInteger=99 then begin //ParamAsBoolean('TWO_EKZ_AKT')  then begin
    GlobalTask.Report_SetCountEkz(2);
  end else begin
    GlobalTask.Report_SetCountEkz(1);
  end;
end;
}

//-------------------------------------------------------------------
// ���������� ����������� ������
function  Report_CheckCountEkz(sName:String; sVersionMajor:String; sVersionMinor:String;
                               sVersionRelease:String; sVersionBuild:String) : string;
var
  n:Integer;
  s:String;
begin
  Result:='EKZ=1;';
  if Pos('{EKZ}',sVersionBuild)>0 then begin               // ������� �������� ���������� �����������
    if (DokZags.Fld('TYPE_EKZ').AsInteger=91) then begin
      Result:='EKZ=2;';
    end else if (DokZags.Fld('TYPE_EKZ').AsInteger=92) then begin
      Result:='EKZ=3;';
    end else if (DokZags.Fld('TYPE_EKZ').AsInteger=93) then begin   // 2 ���. (1 �������)
      Result:='EKZ=11;';
    end;
  end;
  if          Pos('{DUP_V}',sVersionBuild)>0 then begin               // ������� ������������
    Result:=Result+'DUP=V;';
  end else if Pos('{DUP_H}',sVersionBuild)>0 then begin               // ������� ��������������
    Result:=Result+'DUP=H;';
  end else if Pos('{DUP_N}',sVersionBuild)>0 then begin               // ������� ��������
    Result:=Result+'DUP=N;';
  end;
  if Pos('{AKT}',sVersionBuild)>0 then begin               // 
    if Pos('V',sVersionMinor)>0 then s:='V' else s:='';
//    n:=GlobalTask.GetLastValueAsInteger('AKT'+sVersionMajor+s+'_OFFSET_X');
    n:=GlobalTask.ParamAsInteger('AKT'+sVersionMajor+s+'_OFFSET_X');
    if n<>0 then Result:=Result+'OFFSET_X='+IntToStr(n)+';';
//    n:=GlobalTask.GetLastValueAsInteger('AKT'+sVersionMajor+s+'_OFFSET_Y');
    n:=GlobalTask.ParamAsInteger('AKT'+sVersionMajor+s+'_OFFSET_Y');
    if n<>0 then Result:=Result+'OFFSET_Y='+IntToStr(n)+';';

    {
    n:=GlobalTask.GetLastValueAsInteger('AKT'+sVersionMajor+s+'_OFFSET_FIRST');   // ������ ������ ��������
    if n=0 then Result:=Result+'OFFSET_ALL=1;'
           else Result:=Result+'OFFSET_ALL=0;';
    }
    Result:=Result+'OFFSET_ALL=1;' // ������� ��� ��������      OFFSET_ALL=0 ��� ������ ������
  end;
//  WriteDebug('-> '+Result+'  ('+sName+')');
  if Pos('{CHECK_A5',sName)>0 then begin
//    showmessage('A5='+'"'+DokZags.Fld('REPORT_SIZE').AsString+'"');
    if DokZags.Fld('REPORT_SIZE').AsString='A5'
      then Result:=Result+'CHECK_A5=1;'; 
  end;

end;

//-------------------------------------------------------------------
// �����-�� �������� ����� ������� nCurEkz ������, ���� ���������� ����������� ����� ������
procedure  Report_CheckCurEkz_Begin(nCurEkz:Integer; sName:String; sVersionMajor:String; sVersionMinor:String;
                              sVersionRelease:String; sVersionBuild:String);
begin
  DokZags.EditDokument;
  if nCurEkz=3 then begin
    DokZags.Fld('NOMER_EKZ').AsInteger:=1;
    DokZags.Fld('COPIA').AsBoolean:=true;
  end else begin
    DokZags.Fld('NOMER_EKZ').AsInteger:=nCurEkz;
  end;
//  WriteDebug(IntToStr(nCurEkz)+'  ('+sName+')');
end;

//-------------------------------------------------------------------
// �����-�� �������� ����� ������ nCurEkz ������, ���� ���������� ����������� ����� ������
procedure  Report_CheckCurEkz_End(nCurEkz:Integer; sName:String; sVersionMajor:String; sVersionMinor:String;
                              sVersionRelease:String; sVersionBuild:String);
begin
  DokZags.EditDokument;
  if nCurEkz=3 then begin
    DokZags.Fld('COPIA').AsBoolean:=false;
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
         stWriting: Result:='DOC_MAIN_RKK_2';
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
    if (Doc2Tpl.Field('SIGN_KIND').AsInteger=1) and ParamAsBoolean('DR_RKK_PASP') and (Doc2Tpl.Field('PROV_NUM').AsString<>'') then
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

begin
end.
