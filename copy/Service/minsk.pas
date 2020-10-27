
//---------------------------------------------------------------
//         �����
//---------------------------------------------------------------
// ������� � ����� ���������� � � ������� �����(�����)   1
function SprMGSM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   sOtnosh:String;
   strNanim : String;
   slOwners: TStringList;
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
     ds.Fld('SHTAMP').AsString := GlobalTask.ParamAsString('SHTAMP');
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('RAION').AsString := ParamAsString('RAION');

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Zar').AsString := '���������������' ;
        ds.Fld('Zarm').AsString := '���������������' ;
      end else begin
        ds.Fld('Zar').AsString := '����������������' ;
        ds.Fld('Zarm').AsString := '����������������' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

//     ds.Fld('TYPEHOUSE').AsString:=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'������� ���');
     ds.Fld('TYPEHOUSE').AsString:=GetPredst(LicSchet.Fld('PREDST').AsString,'������� ���','NAME');

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     nn:=0;

     slOwners := TStringList.Create;
     strSobstv := adr.GetOwners(slOwners,1);
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
         if slOwners.Count=0 then begin
           strSobstv := strNanim;
         end;
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
     ds.Fld('SOBSTV').AsString := Trim(strSobstv);
     ds.Fld('NANIM').AsString  := Trim(strNanim);
     ds.Post;

     slOwners.Free;
   end;
end;

// ������� � ����� ���������� � � ������� ����� ��� (�����)    2
function SprMGSMV(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID,nn : Integer;
   strNanim,sOtnosh : String;
   slOwners: TStringList;
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
     ds.Fld('SHTAMP').AsString := GlobalTask.ParamAsString('SHTAMP');
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('RAION').AsString := ParamAsString('RAION');

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Zar').AsString := '���������������' ;
      end else begin
        ds.Fld('Zar').AsString := '����������������' ;
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

     slOwners := TStringList.Create;
     strSobstv := adr.GetOwners(slOwners,1);
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
         if slOwners.Count=0 then begin
           strSobstv := strNanim;
         end;
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

     slOwners.Free;
   end;
end;

// ������� � ����� ����������(�����)             3
function SprMGM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
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
     ds.Fld('SHTAMP').AsString := GlobalTask.ParamAsString('SHTAMP');
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,6);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('RAION').AsString := ParamAsString('RAION');

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Zar').AsString := '���������������' ;
        ds.Fld('Zarm').AsString := '���������������' ;
      end else begin
        ds.Fld('Zar').AsString := '����������������' ;
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

// � ���������� ����������� ����� ��������� � ������� ��� �����(�����)�����     4
function PomSostN(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   strNanim,sOtnosh : String;
   slOwners: TStringList;
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
     ds.Fld('SHTAMP_GERB').AsString := GlobalTask.ParamAsString('SHTAMP_GERB');
//     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Punkt').AsString := adr.Punkt
     ds.Fld('Ulica').AsString := adr.Ulica
     ds.Fld('Dom').AsString := adr.Dom
     ds.Fld('Korp').AsString := adr.Korp
     ds.Fld('Kv').AsString := adr.Kv
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('pall').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;
     ds.Fld('RAION').AsString := ParamAsString('RAION');

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

     if LicSchet.Fld('OTD_KUXNA').AsBoolean then ds.Fld('OTD_KUXNA').AsString := '���������'
                                            else ds.Fld('OTD_KUXNA').AsString := '�����';
     if LicSchet.Fld('IZOL_KOMN').AsBoolean then ds.Fld('IZOL_KOMN').AsString := '�������������'
                                            else ds.Fld('IZOL_KOMN').AsString := '���������������';

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Proj').AsString := '���������' ;
        ds.Fld('Zarm').AsString := '���������������' ;
      end else begin
        ds.Fld('Proj').AsString := '���������' ;
        ds.Fld('Zarm').AsString := '����������������' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

       if (LicSchet.Fld('MAT_STEN').AsString='') 
         then s:=''
         else s:=SeekValueSpr('���������������','ID',LicSchet.Fld('MAT_STEN').AsString,'NAME');
       ds.Fld('MAT_STEN').AsString := s;

     ds.Fld('OBORUD').AsString := OborudDoma;
     if LicSchet.Predst='' 
       then ds.Fld('POMES').AsString  := '�������������� ����� ���'
       else ds.Fld('POMES').AsString  := LicSchet.Predst;
     ds.Fld('NETAJ').AsString := adr.Etag;
     ds.Fld('ETAJ').AsString  := adr.Kol_Etag;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;

     slOwners := TStringList.Create;
     strSobstv := adr.GetOwners(slOwners,1);
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
         if slOwners.Count=0 then begin
           strSobstv := strNanim;
         end;
       end;
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
         ds.Fld('Pol').AsString   := LowerCase(m.Fld('POL').AsString);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     ds.Fld('SOBSTV').AsString := strSobstv;
     ds.Fld('NANIM').AsString  := strSobstv;
     ds.Post;

     slOwners.Free;
   end;
end;

// ������� � ������� �����. ����������_11(�����)         5
function Pril11M(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strNanim,strGR, strPlosh : String;
   slOwners : TStringList;
   nID : Integer;
   sOtnosh:String;
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
     ds.Fld('SHTAMP_GERB').AsString := GlobalTask.ParamAsString('SHTAMP_GERB');
//     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Punkt').AsString := adr.Punkt
     ds.Fld('Ulica').AsString := adr.Ulica
     ds.Fld('Dom').AsString := adr.Dom
     ds.Fld('Korp').AsString := adr.Korp
     ds.Fld('Kv').AsString := adr.Kv
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;

      if m.Fld('POL').AsString='�' then begin
        ds.Fld('Zarm').AsString := '���������������' ;
      end else begin
        ds.Fld('Zarm').AsString := '����������������' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 
     ds.Post;

    slOwners := TStringList.Create;
    strSobstv := adr.GetOwners(slOwners,1);

     ds:=GetTemplateDataSet('TABLSOST');
     //��� ������ ������
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
         if slOwners.Count=0 then begin
           strSobstv := strNanim;
         end;
       end;
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     ds.Fld('Za_kemPravo').AsString := strSobstv;
     ds.Post;

     slOwners.Free;
   end;
end;

// ������� � �������� ��������. �_4(�����)             6
function F4M(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   strNanim : String;
   slOwners: TStringList;
   nID : Integer;
   sOtnosh:String;
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
     ds.Fld('SHTAMP_GERB').AsString := GlobalTask.ParamAsString('SHTAMP_GERB');
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Punkt').AsString := adr.Punkt;
     ds.Fld('Ulica').AsString := adr.Ulica;
     ds.Fld('Dom').AsString := adr.Dom;
     ds.Fld('Korp').AsString := adr.Korp;
     ds.Fld('Kv').AsString := adr.Kv;
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,7);
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('PLOSH_KUH').AsString := LicSchet.Fld('PLOSH_KUXN').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;
     if LicSchet.Fld('KOL_SMKOMN').AsString<>'' then
       ds.Fld('SM_KOMN').AsString := LicSchet.Fld('KOL_SMKOMN').AsString;
     ds.Fld('ETAJ').AsString  := adr.Kol_Etag;

     if LicSchet.Fld('VANNA').AsBoolean then ds.Fld('VANNA').AsString:='��' else ds.Fld('VANNA').AsString:='���';
     if LicSchet.Fld('BALKON').AsBoolean then ds.Fld('BL').AsString:='��' else ds.Fld('BL').AsString:='���';

     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

    ds.Fld('MAT_STEN').AsString := SeekValueSpr('���������������','ID',LicSchet.Fld('MAT_STEN').AsString,'NAME');
    ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'�������');

    ds.Post;

    slOwners := TStringList.Create;
    strSobstv := adr.GetOwners(slOwners,1);
    ds:=GetTemplateDataSet('TABLSOST');
    nID:=m.Fld('ID_INTERNAL').AsInteger;
    sOtnosh := m.Fld('OTNOSH').AsString;

    m.First;
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
         if slOwners.Count=0 then begin
           strSobstv := strNanim;
         end;
       end;
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
         ds.Fld('Pol').AsString   := LowerCase(m.Fld('POL').AsString);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     ds.Fld('Za_kemPravo').AsString := strSobstv;
     ds.Post;

     slOwners.Free;

   end;
end;

// � ���������� ����������� ����� ��������� � ������� ��� �����(�����)   7
function PomSost(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   sOtnosh:String;
   strNanim : String;
   slOwners: TStringList;
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
     ds.Fld('SHTAMP_GERB').AsString := GlobalTask.ParamAsString('SHTAMP_GERB');
//     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Punkt').AsString := adr.Punkt
     ds.Fld('Ulica').AsString := adr.Ulica
     ds.Fld('Dom').AsString := adr.Dom
     ds.Fld('Korp').AsString := adr.Korp
     ds.Fld('Kv').AsString := adr.Kv
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('pall').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;

     if LicSchet.Fld('OTD_KUXNA').AsBoolean then ds.Fld('OTD_KUXNA').AsString := '���������'
                                            else ds.Fld('OTD_KUXNA').AsString := '�����';
     if LicSchet.Fld('IZOL_KOMN').AsBoolean then ds.Fld('IZOL_KOMN').AsString := '�������������'
                                            else ds.Fld('IZOL_KOMN').AsString := '���������������';

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

      if m.Fld('POL').AsString='�' then begin
        ds.Fld('Proj').AsString := '���������' ;
        ds.Fld('Zarm').AsString := '���������������' ;
      end else begin
        ds.Fld('Proj').AsString := '���������' ;
        ds.Fld('Zarm').AsString := '����������������' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

       if (LicSchet.Fld('MAT_STEN').AsString='') 
         then s:=''
         else s:=SeekValueSpr('���������������','ID',LicSchet.Fld('MAT_STEN').AsString,'NAME');
       ds.Fld('MAT_STEN').AsString := s;

     ds.Fld('OBORUD').AsString := OborudDoma;
     if LicSchet.Predst='' 
       then ds.Fld('POMES').AsString  := '�������������� ����� ���'
       else ds.Fld('POMES').AsString  := LicSchet.Predst;
     ds.Fld('NETAJ').AsString := adr.Etag;
     ds.Fld('ETAJ').AsString  := adr.Kol_Etag;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;

     slOwners := TStringList.Create;
     strSobstv := adr.GetOwners(slOwners,1);
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
         if slOwners.Count=0 then begin
           strSobstv := strNanim;
         end;
       end;
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
         ds.Fld('Pol').AsString   := LowerCase(m.Fld('POL').AsString);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Post;
       end;
       m.Next;
     end;
     m.First;

     ds:=GetTemplateDataSet('MAIN');
     ds.Edit;
     ds.Fld('SOBSTV').AsString := strSobstv;
     ds.Fld('NANIM').AsString  := strSobstv;
     ds.Post;

     slOwners.Free;
   end;
end;

// �������-������� �� �������� ����� � ��� (������� � ������� ������������� �� �����������)(�����)   8
function SprBTIM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   strNanim : String;
   slOwners: TStringList;
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
     ds.Fld('SHTAMP').AsString := GlobalTask.ParamAsString('SHTAMP');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'�');
     ds.Fld('AdrOR').AsString := FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('Dom').AsString := adr.Dom;
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;

     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Post;

     m.First;
     slOwners := TStringList.Create;
     strSobstv := adr.GetOwners(slOwners,1);
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
         if slOwners.Count=0 then begin
           strSobstv := strNanim;
         end;
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
     ds.Fld('SOBSTV').AsString := strSobstv;// ��������� �������������
     ds.Fld('NANIM').AsString  := strNanim;
     ds.Post;

     slOwners.Free;
   end;
end;

// �������-������� �� �������� ����� � ��� (������� ������� � ������� �������������)(�����)   9
function SprBTIPM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
   ps,d,v,k: String;
   m : TMens;
   adr : TAdresLic;
   s,strKomu,strPol,strPol2,strPol3,strErr,strEG,
   strAdres,strSobstv,strGR, strPlosh : String;
   nID : Integer;
   strNanim : String;
   slOwners: TStringList;
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
     ds.Fld('SHTAMP').AsString := GlobalTask.ParamAsString('SHTAMP');
     ds.Fld('TEKU_DATE').AsString := FormatDateTime('dd.mm.yyyy',NOW);
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'�');
     ds.Fld('AdrOR').AsString := FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('Dom').AsString := adr.Dom;
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('GOSAKT_S').AsString := LicSchet.Fld('GOSAKT_S').AsString;
     ds.Fld('GOSAKT_N').AsString := LicSchet.Fld('GOSAKT_N').AsString;

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID := m.Fld('ID_INTERNAL').AsInteger;

     ds.Append;
     ds.Fld('FIO').AsString := m.FIO;
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Post;

     m.First;

     slOwners := TStringList.Create;
     strSobstv := adr.GetOwners(slOwners,1);
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // ����������
         strNanim := m.FIO;
         if slOwners.Count=0 then begin
           strSobstv := strNanim;
         end;
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
     ds.Fld('SOBSTV').AsString := strSobstv;// ��������� �������������
     ds.Fld('NANIM').AsString  := strNanim;
     ds.Post;

     slOwners.Free;
   end;
end;

// ������� �� �������� ������ ����������(�����)      10
function SpravkSM(DateFiks: TDateTime; LicID, PID: Word):boolean;
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
     adr := LicSchet.Adres;
     strKomu := m.FIO;
     strGR:='';
     ds.Fld('SHTAMP').AsString := GlobalTask.ParamAsString('SHTAMP');
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('WORK_NAME').AsString := m.getWork;
     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);
     ds.Fld('NameOrgP').AsString := NameOrg('','�');
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'�');
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('POSTR').AsString := LicSchet.Fld('POSTR').AsString;

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

     ds.Fld('NameOrgK').AsString := NameOrg('�','�');

     if m.Fld('POL').AsString='�' then begin
        ds.Fld('Zarm').AsString := '���������������' ;
      end else begin
        ds.Fld('Zarm').AsString := '����������������' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID:=m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     while not m.Eof do begin
       if AddMenToSprav(m,nID) then begin
         ds.Append;
         ds.Fld('FIO').AsString := m.FIO;
         ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
         ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
         ds.Fld('Punkt').AsString := adr.Punkt;
         ds.Fld('WORK_NAME').AsString := m.getWork;
         ds.Post;
       end;
       m.Next;
     end;
     m.First;
   end;
end;

// ������� � ����������� � �������(�����)      11
function SprTopM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
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
     ds.Fld('SHTAMP').AsString := GlobalTask.ParamAsString('SHTAMP');
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

     ds.Fld('SP_TOPLIVO').AsString := ParamAsString('SP_TOPLIVO');

     if m.Fld('POL').AsString='�' then ds.Fld('Zar').AsString := '���������������'
                                  else ds.Fld('Zar').AsString := '����������������' ;
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ; 
      end else begin
        ds.Fld('Jit').AsString := '�� ����� ����������' ;
      end;
     ds.Post;
   end;
end;

// ������� ����������� ������������ � �������������� �����������(�����)    12
function SprFEM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, dsDeti: TDataSet;
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
     ds.Fld('SHTAMP').AsString := GlobalTask.ParamAsString('SHTAMP');
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('GOD_VOZV').AsString := LicSchet.Fld('GOD_VOZV').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('GOSAKT_S').AsString := LicSchet.Fld('GOSAKT_S').AsString;
     ds.Fld('GOSAKT_N').AsString := LicSchet.Fld('GOSAKT_N').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�'))+' '+FirstCharUpper(Obl_Name('�'));

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

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

// ����� �������� �����(�����)      13
function KopyLSM(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spr, dsDeti: TDataSet;
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
     adr := LicSchet.Adres;
     strKomu := m.FIO;
     strGR:='';
     ds.Fld('NomerLS').AsString := LicSchet.Fld('NOMER').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'�');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('�')); //+', '+FirstCharUpper(Obl_Name('�'));
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;

     if ParamAsString('����������')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end else begin
       ds.Fld('RUK_SP').AsString :='���������� ���������';
       ds.Fld('FIO_RUK').AsString := ParamAsString('����������');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('����������');
       ds.Fld('TELEFON').AsString := ParamAsString('����_�������');
     end; 

     ds.Fld('RAION').AsString := ParamAsString('RAION');
     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);

     ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'�������');

     ds.Post;
     ds:=GetTemplateDataSet('TABLSOST');
     nID:=m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     while not m.Eof do begin
       ds.Append;
       ds.Fld('FIO').AsString := m.FIO;
       ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
       ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
       ds.Fld('DATEV').AsString := DatePropis(m.Fld('DATEV').AsDateTime,3);
       ds.Fld('OTNOS').AsString := GetOtnoshMen(nID,sOtnosh,m,true);
       ds.Fld('Gragd').AsString := SeekValueSpr('��������','ID',m.Fld('CITIZEN').AsString,'GNAME');
       ds.Fld('Lgot').AsString := m.GetLgoti;
       ds.Post;

       m.Next;
     end;
     m.First;
   end;
end;
//---------------------------------------------------------------------
//         ����� END
//---------------------------------------------------------------------
