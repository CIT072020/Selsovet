
//---------------------------------------------------------------
//         МИНСК
//---------------------------------------------------------------
// Справка с места жительства и о составе семьи(МИНСК)   1
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('RAION').AsString := ParamAsString('RAION');

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Zar').AsString := 'Зарегистрирован' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
      end else begin
        ds.Fld('Zar').AsString := 'Зарегистрирована' ;
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

//     ds.Fld('TYPEHOUSE').AsString:=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'частный дом');
     ds.Fld('TYPEHOUSE').AsString:=GetPredst(LicSchet.Fld('PREDST').AsString,'частный дом','NAME');

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
         // наниматель
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

// Справка с места жительства и о составе семьи ВУЗ (МИНСК)    2
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,7);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('RAION').AsString := ParamAsString('RAION');

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Zar').AsString := 'Зарегистрирован' ;
      end else begin
        ds.Fld('Zar').AsString := 'Зарегистрирована' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
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
         // наниматель
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

// Справка с места жительства(МИНСК)             3
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('RAION').AsString := ParamAsString('RAION');

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Zar').AsString := 'Зарегистрирован' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
      end else begin
        ds.Fld('Zar').AsString := 'Зарегистрирована' ;
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     ds.Post;
   end;
end;

// О занимаемом гражданином жилом помещении и составе его семьи(МИНСК)новая     4
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
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

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 

     if LicSchet.Fld('OTD_KUXNA').AsBoolean then ds.Fld('OTD_KUXNA').AsString := 'отдельной'
                                            else ds.Fld('OTD_KUXNA').AsString := 'общей';
     if LicSchet.Fld('IZOL_KOMN').AsBoolean then ds.Fld('IZOL_KOMN').AsString := 'изолированных'
                                            else ds.Fld('IZOL_KOMN').AsString := 'неизолированных';

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Proj').AsString := 'проживает' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
      end else begin
        ds.Fld('Proj').AsString := 'проживает' ;
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
      end;

     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

       if (LicSchet.Fld('MAT_STEN').AsString='') 
         then s:=''
         else s:=SeekValueSpr('СпрМатериалСтен','ID',LicSchet.Fld('MAT_STEN').AsString,'NAME');
       ds.Fld('MAT_STEN').AsString := s;

     ds.Fld('OBORUD').AsString := OborudDoma;
     if LicSchet.Predst='' 
       then ds.Fld('POMES').AsString  := 'одноквартирный жилой дом'
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
         // наниматель
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

// Справка о составе семьи. Приложение_11(МИНСК)         5
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('Punkt').AsString := adr.Punkt
     ds.Fld('Ulica').AsString := adr.Ulica
     ds.Fld('Dom').AsString := adr.Dom
     ds.Fld('Korp').AsString := adr.Korp
     ds.Fld('Kv').AsString := adr.Kv
     ds.Fld('DATEP').AsString := DatePropis(m.Fld('DATEP').AsDateTime,3);
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;

      if m.Fld('POL').AsString='М' then begin
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
      end else begin
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 
     ds.Post;

    slOwners := TStringList.Create;
    strSobstv := adr.GetOwners(slOwners,1);

     ds:=GetTemplateDataSet('TABLSOST');
     //для каждой строки
     nID := m.Fld('ID_INTERNAL').AsInteger;
     sOtnosh := m.Fld('OTNOSH').AsString;
     m.First;
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // наниматель
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

// Справка о жилищных условиях. Ф_4(МИНСК)             6
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
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

     if LicSchet.Fld('VANNA').AsBoolean then ds.Fld('VANNA').AsString:='да' else ds.Fld('VANNA').AsString:='нет';
     if LicSchet.Fld('BALKON').AsBoolean then ds.Fld('BL').AsString:='да' else ds.Fld('BL').AsString:='нет';

     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 

    ds.Fld('MAT_STEN').AsString := SeekValueSpr('СпрМатериалСтен','ID',LicSchet.Fld('MAT_STEN').AsString,'NAME');
    ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'Частный');

    ds.Post;

    slOwners := TStringList.Create;
    strSobstv := adr.GetOwners(slOwners,1);
    ds:=GetTemplateDataSet('TABLSOST');
    nID:=m.Fld('ID_INTERNAL').AsInteger;
    sOtnosh := m.Fld('OTNOSH').AsString;

    m.First;
     while not m.Eof do begin
       if m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString then begin
         // наниматель
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

// О занимаемом гражданином жилом помещении и составе его семьи(МИНСК)   7
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
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

     if LicSchet.Fld('OTD_KUXNA').AsBoolean then ds.Fld('OTD_KUXNA').AsString := 'отдельной'
                                            else ds.Fld('OTD_KUXNA').AsString := 'общей';
     if LicSchet.Fld('IZOL_KOMN').AsBoolean then ds.Fld('IZOL_KOMN').AsString := 'изолированных'
                                            else ds.Fld('IZOL_KOMN').AsString := 'неизолированных';

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 

      if m.Fld('POL').AsString='М' then begin
        ds.Fld('Proj').AsString := 'проживает' ;
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
      end else begin
        ds.Fld('Proj').AsString := 'проживает' ;
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;

       if (LicSchet.Fld('MAT_STEN').AsString='') 
         then s:=''
         else s:=SeekValueSpr('СпрМатериалСтен','ID',LicSchet.Fld('MAT_STEN').AsString,'NAME');
       ds.Fld('MAT_STEN').AsString := s;

     ds.Fld('OBORUD').AsString := OborudDoma;
     if LicSchet.Predst='' 
       then ds.Fld('POMES').AsString  := 'одноквартирный жилой дом'
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
         // наниматель
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

// Справка-выписка из лицевого счета в БТИ (участок в частную собственность не передавался)(МИНСК)   8
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
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'Р');
     ds.Fld('AdrOR').AsString := FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('Dom').AsString := adr.Dom;
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
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
         // наниматель
         strNanim := m.FIO;
         if slOwners.Count=0 then begin
           strSobstv := strNanim;
         end;
       end;
       if AddMenToSprav(m,nID) then begin
//       if (nID<>m.Fld('ID_INTERNAL').AsInteger) and
//     	 (m.Fld('PROPIS').AsBoolean=true) and             // вкл. только прописанных
//         (m.Fld('PRESENT').AsBoolean=true) then begin // вкл. только присутствующих
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
     ds.Fld('SOBSTV').AsString := strSobstv;// несколько собственников
     ds.Fld('NANIM').AsString  := strNanim;
     ds.Post;

     slOwners.Free;
   end;
end;

// Справка-выписка из лицевого счета в БТИ (участок передан в частную собственность)(МИНСК)   9
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
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'Р');
     ds.Fld('AdrOR').AsString := FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('Dom').AsString := adr.Dom;
     ds.Fld('PLOSH_ZDAN').AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;
     ds.Fld('DOP_STROEN').AsString := LicSchet.Fld('DOP_STROEN').AsString;
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('GOSAKT_S').AsString := LicSchet.Fld('GOSAKT_S').AsString;
     ds.Fld('GOSAKT_N').AsString := LicSchet.Fld('GOSAKT_N').AsString;

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
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
         // наниматель
         strNanim := m.FIO;
         if slOwners.Count=0 then begin
           strSobstv := strNanim;
         end;
       end;
       if AddMenToSprav(m,nID) then begin
//       if (nID<>m.Fld('ID_INTERNAL').AsInteger) and
//     	 (m.Fld('PROPIS').AsBoolean=true) and             // вкл. только прописанных
//         (m.Fld('PRESENT').AsBoolean=true) then begin // вкл. только присутствующих
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
     ds.Fld('SOBSTV').AsString := strSobstv;// несколько собственников
     ds.Fld('NANIM').AsString  := strNanim;
     ds.Post;

     slOwners.Free;
   end;
end;

// Справка на адресную помощь гражданину(МИНСК)      10
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('WORK_NAME').AsString := m.getWork;
     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);
     ds.Fld('NameOrgP').AsString := NameOrg('','Р');
     ds.Fld('NAME_TERR').AsString := GetPadeg(ParamAsString('NAME_TERR'),'Р');
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;
     ds.Fld('VSEGO').AsString := LicSchet.Fld('VSEGO').AsString;
     ds.Fld('POSTR').AsString := LicSchet.Fld('POSTR').AsString;

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 

     ds.Fld('NameOrgK').AsString := NameOrg('К','Р');

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('Zarm').AsString := 'зарегистрирован' ;
      end else begin
        ds.Fld('Zarm').AsString := 'зарегистрирована' ;
      end;

//     if (m.Fld('DATE_SROK').AsString='') and (m.Fld('PROPIS').AsBoolean=true) then begin
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
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

// Справка о нуждаемости в топливе(МИНСК)      11
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropis(m.Fld('DATER').AsDateTime,3);
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 

     ds.Fld('SP_TOPLIVO').AsString := ParamAsString('SP_TOPLIVO');

     if m.Fld('POL').AsString='М' then ds.Fld('Zar').AsString := 'зарегистрирован'
                                  else ds.Fld('Zar').AsString := 'зарегистрирована' ;
     if m.TypeReg=MESTO_GIT then begin
        ds.Fld('Jit').AsString := 'по месту жительства' ; 
      end else begin
        ds.Fld('Jit').AsString := 'по месту пребывания' ;
      end;
     ds.Post;
   end;
end;

// Справка фактической эксплуатации и принадлежности капстроения(МИНСК)    12
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Д');
     ds.Fld('KomuT').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'Р');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р'))+' '+FirstCharUpper(Obl_Name('Р'));

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 

     if LicSchet.Predst='' 
       then ds.Fld('POMES').AsString  := 'одноквартирного'
       else ds.Fld('POMES').AsString  := LicSchet.Predst;

     if m.Fld('POL').AsString='М' then begin
        ds.Fld('ONO').AsString := 'ему' ;
      end else begin
        ds.Fld('ONO').AsString := 'ей' ;
      end;
     ds.Post;
   end;
end;

// Копия лицевого счета(Минск)      13
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
     ds.Fld('Komu').AsString := GetPadegFIO(strKomu,m.Fld('POL').AsString,'И');
     ds.Fld('Adres').AsString := adr.GetAdres+' '+FirstCharUpper(Raion_Name('Р')); //+', '+FirstCharUpper(Obl_Name('Р'));
     ds.Fld('PLOSH_ALL').AsString := LicSchet.Fld('PLOSH_ALL').AsString;
     ds.Fld('PLOSH_GIL').AsString := LicSchet.Fld('PLOSH_GIL').AsString;
     ds.Fld('KOL_KOMN').AsString := LicSchet.Fld('KOL_KOMN').AsString;

     if ParamAsString('СПЕЦИАЛИСТ')='' then begin
       ds.Fld('RUK_SP').AsString :=DolgRukov();
       ds.Fld('FIO_RUK').AsString := FIORukov();
       ds.Fld('FIO_SEKR').AsString := FIOSecretar();
       ds.Fld('TELEFON').AsString := ParamAsString('СЕКР_ТЕЛЕФОН');
     end else begin
       ds.Fld('RUK_SP').AsString :='Специалист исполкома';
       ds.Fld('FIO_RUK').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('FIO_SEKR').AsString := ParamAsString('СПЕЦИАЛИСТ');
       ds.Fld('TELEFON').AsString := ParamAsString('СПЕЦ_ТЕЛЕФОН');
     end; 

     ds.Fld('RAION').AsString := ParamAsString('RAION');
     ds.Fld('COUNT_MENS').AsString := IntToStr(m.Count);

     ds.Fld('TYPEHOUSE').AsString :=GetTypeHouse(LicSchet.Fld('OWN_HOUSE').AsBoolean,LicSchet.Fld('TYPEHOUSE').AsString,'Частный');

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
       ds.Fld('Gragd').AsString := SeekValueSpr('СпрСтран','ID',m.Fld('CITIZEN').AsString,'GNAME');
       ds.Fld('Lgot').AsString := m.GetLgoti;
       ds.Post;

       m.Next;
     end;
     m.First;
   end;
end;
//---------------------------------------------------------------------
//         МИНСК END
//---------------------------------------------------------------------
