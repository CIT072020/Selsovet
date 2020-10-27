unit fLoadExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dBase, fMAin, QStrings, ComObj,
  Dialogs, Grids, DBGridEh, DB, FuncPr, uTypes, uProject, uCheckKod, uProjectAll, StdCtrls;

type
  TfmLoadExcel = class(TForm)
    Button1: TButton;
    edDebug: TMemo;
    Label1: TLabel;
    ListBox1: TListBox;
    cbShowExcel: TCheckBox;
    edGraf: TEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
    nCount1:Integer;
    slLoad:TStringList;
    slAdd:TStringList;
    slPrich:TStringList;
  public
    XL:Variant;
    function CreateAdres(var adr:TAdres; sl:TStringList):Integer;
    function FindOsnov(sOsnov:String):Integer;

    procedure LoadONE(sl:TStringList);
    procedure WriteHistory(nID:Integer; nTypeObj:Integer; sFam:String);
    procedure WriteLgota(nID:Integer; sLgot:String);

    function WriteOneResh(sl:TStringList; nOch:Integer;nID:Integer; nTip:Integer; var dDate:TDateTime):Integer;

    function WriteDate(fldSource,fldDest:TField):Boolean;
    function GetDate(sDate:String; var dDate : TDateTime):Boolean;

  end;

  procedure LoadExcel;

implementation

uses StrUtils;

const
  EL_NOMER=0;
  EL_FIO=1;
  EL_COUNT=2;
  EL_ADRES=3;
  EL_POM=4;
  EL_LGOT=5;
  EL_OSN=6;
  EL_DATER=7;   // ���� �������
  EL_DATEP=8;   // ���� ����������
  EL_DATES=9;   // ���� ������
  EL_ADD=10;    // �������������



{$R *.dfm}

procedure LoadExcel;
var
  f: TfmLoadExcel;
begin
  f:=TfmLoadExcel.create(nil);
  f.ShowModal;
  f.Free;
end;

procedure TfmLoadExcel.FormCreate(Sender: TObject);
var
  i:INteger;
begin
 slLoad:=TStringList.Create;
 slPrich:=TStringList.Create;
 slAdd:=TStringList.Create;
 {
 for i:=0 to ComponentCount-1 do begin
   if Components[i] is TADOTable then begin
     if not TADOTable(Components[i]).Active then TADOTable(Components[i]).Active:=true;
     ListBox1.Items.AddObject(TADOTable(Components[i]).Name, Components[i]);
   end;
 end;
 DataSource1.DataSet:=tbOchered;
 }
end;

procedure TfmLoadExcel.FormDestroy(Sender: TObject);
begin
  slLoad.Free;
  slPrich.Free;
  slAdd.Free;
end;

procedure TfmLoadExcel.Button1Click(Sender: TObject);
var
  v,arr:Variant;
  i1,i2, nSocialOch,i,j,n,nn,nnn,mmm,m,t:Integer;
  lLoad:Boolean;
  sl:TStringList;
  lErr:Boolean;
  function GetPunkt(sss:String):String;
  begin
    Result:=Trim(sss);
    if RightStr(result,1)='.' then Copy(result,1,Length(result)-1);
  end;
begin
  nCount1:=0;
  n:=0;
  m:=0;

  slPrich.Clear;
  dmbase.SprPostOch.First;
  while not dmbase.SprPostOch.Eof do begin
    if dmBase.SprPostOch.FieldByName('UKAZ').AsString='563' then
      slPrich.Add(GetPunkt(dmBase.SprPostOch.FieldByName('PUNKT').AsString)+'='+dmBase.SprPostOch.FieldByName('ID').AsString);
    dmbase.SprPostOch.Next;
  end;
  dmbase.SprSnOch.First;
  while not dmbase.SprSnOch.Eof do begin
    if dmBase.SprSnOch.FieldByName('UKAZ').AsString='563' then
      slPrich.Add(GetPunkt(dmBase.SprSnOch.FieldByName('PUNKT').AsString)+'='+dmBase.SprSnOch.FieldByName('ID').AsString);
    dmbase.SprSnOch.Next;
  end;

  try
    try XL := GetActiveOleObject('Excel.Application');
    except XL := CreateOleObject('Excel.Application');
  end;
    except
      raise Exception.Create('H� ���y ���y����� Excel');
  end;

  try
    xl.Workbooks.Add('E:\�����.xlsx');
  except
    on E: Exception do begin
      PutError('������ �������� �����'+#13#10+E.Message,self);
      lErr:=true;
      edDebug.Lines.Add(E.Message);
      exit;
    end;                       
  end;

  if cbShowExcel.Checked
    then xl.Visible:=true;
  lErr:=false;
  try
    arr:=XL.Range[Trim(edGraf.Text)].value;
  except
    on E: Exception do begin
      lErr:=true;
      edDebug.Lines.Add(E.Message);
    end;
  end;
  if lErr then exit;

  sl:=TStringList.Create;
  nn:=0;
  n := VarArrayDimCount(arr);
  if n <> 2 then begin
    lErr:=true;
  end;
  if lErr then exit;
  i1:=VarArrayLowBound(arr,1);
  i2:=VarArrayHighBound(arr,1);
  for i:=i1 to i2 do begin
    mmm:=VarArrayLowBound(arr,2);
    t := VarType(arr[i,mmm+1]);
    if (t=VarNull) or (t=VarEmpty) then begin
      v:=null;
    end else begin
      v:=arr[i,mmm+1];
    end;
    if (v=null) or (trim(vartostr(v))='') then begin
      v:='';
    end else begin
      v:=VarToStr(arr[i,mmm+1]);
    end;
    if v='' then begin
      Inc(nn,1);
      Label2.Caption:='���������: '+IntToStr(nn);
      Application.ProcessMessages;
    end else begin
      lLoad:=(nnn=0) or (Frac(n/nnn)=0);
      if lLoad then begin
        sl.Clear;
        for j:=mmm to VarArrayHighBound(arr,2) do begin
          sl.Add(arr[i,j]);
        end;
        LoadOne(sl);
        Inc(m,1);
      end;
      Inc(n,1);
      Label1.Caption:=IntToStr(n);
      Application.ProcessMessages;
    end;

  end;
  sl.Free;
end;

//--------------------------------------------------------------------------------------
function TfmLoadExcel.CreateAdres(var adr: TAdres; sl:TStringList): Integer;
var
  s,ss,sAdres,sErr, sTipPunkt, sPrim,sPunkt,sDom,sKorp,sKv,sUl,sTipUl : String;
  nTipUl,nRezid,nKomn, nPunkt, nKodUl, n:  Integer;
  nPlosh:Extended;
  lMy:Boolean;
  nAdresID:Integer;
  nKodNP,i,j:Integer;
  arr:TArrStrings;
begin
  lMy:=true;
  Result:=-1;
  adr.Obl:='';
  adr.Punkt:='';
  adr.Ulica:='';
  adr.Dom:='';
  adr.Korp:='';
  adr.Kv:='';
  s:=sl.Strings[EL_ADRES];
  s:=StringReplace(s,'��,','��.',[]);
  i:=Pos('(',s);
  if i>0 then begin
    edDebug.Lines.Add(sl.Strings[EL_NOMER]+' ADD ADRES: '+Copy(s,i,100));
    s:=Copy(s,1,i-1);
  end else begin

  end;
  if s='' then begin
    edDebug.Lines.Add('ERROR empty adres: '+sl.Strings[EL_NOMER]);
    exit;
  end;
  StrToArr(s,arr,',',true);       
  i:=Pos(' �.',arr[0]);
  if i>0 then begin
    arr[0]:=StringReplace(arr[0],' �.',',�.',[]);
    s:='';                  
    for i:=0 to Length(arr)-1 do begin
      s:=s+arr[i]+',';
    end;
    s:=Copy(s,1,Length(s)-1);
    StrToArr(s,arr,',',true);
  end;
  if Length(arr)>4 then begin
    edDebug.Lines.Add(sl.Strings[EL_NOMER]+' ERROR count simvol adres '+sl.Strings[EL_ADRES]);
    exit;
  end;
  if Length(arr)=4 then begin
    sUl:=arr[0];
    sDom:=Trim(StringReplace(arr[1],'�.','',[]));
    sKorp:=Trim(StringReplace(arr[2],'�.','',[]));
    sKorp:=Trim(StringReplace(sKorp,'����.','',[]));
    sKv:=Trim(StringReplace(arr[3],'��.','',[]));
  end else begin
    SetLength(arr,3);
    sUl:=arr[0];
    sDom:=Trim(StringReplace(arr[1],'�.','',[]));
    sKorp:='';
    sKv:=Trim(StringReplace(arr[2],'��.','',[]));
    sKv:=Trim(StringReplace(sKv,'�.','',[]));
  end;

  nPunkt:=1;   // !!!
  nKodUl:=0;
  nTipUl:=0;

  if nPunkt=1 then begin
    if sUL<>'' then begin
      if nTipUl=0 then begin
        i:=Pos('��.',ANSILowerCase(sUl));
        if i>0 then begin
          sUl:=Trim(StringReplace(sUl,'��.','',[]));
          nTipUl:=1;
        end;
      end;
      if nTipUl=0 then begin
        i:=Pos('���.',ANSILowerCase(sUl));
        if i>0 then begin
          sUl:=Trim(StringReplace(sUl,'���.','',[]));
          nTipUl:=1;
        end;
      end;
      if nTipUl=0 then begin
        i:=Pos('�� ',sUl);
        if i>0 then begin
          sUl:=Trim(StringReplace(sUl,'�� ','',[]));
          nTipUl:=1;
        end;
      end;
      if nTipUl=0 then begin
        i:=Pos('���.',sUl);
        if i>0 then begin
          sUl:=Trim(StringReplace(sUl,'���.','',[]));
          nTipUL:=3;
        end;
        if nTipUl=0 then begin
          i:=Pos('��� ',sUl);
          if i>0 then begin
            sUl:=Trim(StringReplace(sUl,'��� ','',[]));
            nTipUL:=3;
          end;
        end;
        if nTipUl=0 then begin
          i:=Pos(' ���',sUl);
          if i>0 then begin
            sUl:=Trim(StringReplace(sUl,'���','',[]));
            nTipUL:=3;
          end;
        end;
        if nTipUL=3 then begin
          for j:=1 to 6 do begin
            ss:=inttostr(j)+'-�';
            i:=Pos(ss,sUl);
            if i>0 then begin
              sUl:=Trim(StringReplace(sUl,ss,'',[]))+' '+ss;
              break;
            end;
          end;
        end;
      end;
           
      if nTipUl=0 then begin
        edDebug.Lines.Add(sl.Strings[EL_NOMER]+' ERROR ����������� ���: '+sUl);
        if dmBase.SprUL.Locate('NAME', sUl, [loCaseInsensitive]) then begin
          nTipUl:=dmBase.SprUL.FieldByName('TIP').AsInteger;
        end else begin
          nTipUl:=1;
        end;
      end;

      if not dmBase.SprUL.Locate('NAME;TIP', VarArrayOf([sUl,nTipUl]), []) then begin
        dmBase.SprUL.Append;
        dmBase.SprUL.FieldByName('NAME').AsString:=sUl;
        dmBase.SprUL.FieldByName('TIP').AsInteger:=nTipUl;
        dmBase.SprUL.Post;
      end;
      nKodUl:=dmBase.SprUl.FieldByName('ID').AsInteger;
    end;


    adr.PunktKod:=nPunkt;
    adr.UlicaInt:=nKodUl;
    adr.Dom:=sDom;
    adr.NDom:=sDom;
    adr.Korp:=sKorp;
    adr.Kv:=sKv;
    adr.NotDom:=false;
    adr.NameHouse:='';
    if dmBase.AddAdres(dmBase.GetDateCurrentSost,adr,nAdresID,sErr)>-1 then begin
      if nAdresID>0 then begin
        Result:=nAdresID;
//        if nKomn>0  then dmBase.WriteValueProp('KOL_KOMN', nKomn, dmBase.GetDateCurrentSost, nAdresID,dmbase.TypeObj_Adres,ftInteger);
//        if nPlosh>0 then dmBase.WriteValueProp('PLOSH_ALL', nPlosh,dmBase.GetDateCurrentSost, nAdresID, dmbase.TypeObj_Adres,ftFloat);
      end;
    end;
  end else begin
    Result:=0;
    adr.Obl:='';
    adr.Punkt:=sPunkt;
    adr.Ulica:=sUL;
    adr.Dom:=sDom;
    adr.Korp:=sKorp;
    adr.Kv:=sKv;
//      adr.AdresPropis:=tbNasel.fieldByName('�����').AsString;
    s:=dmBase.AdresPropisFromAdres(adr, true);
    if s<>''
      then adr.AdresPropis:=s
  end;
end;

//-------------------------------------------------------------------------
function TfmLoadExcel.FindOsnov(sOsnov: String): Integer;
var
  i:Integer;
begin
  Result:=0;
  if Pos(',',sOsnov)=0 then begin
    sOsnov:=Trim(StringReplace(sOsnov,'�.','',[]));
    if RightStr(sOsnov,1)<>'.' then sOsnov:=sOsnov+'.';
    for i:=0 to slPrich.Count-1 do begin
      if slPrich.Names[i]=sOsnov then begin
        Result:=StrToInt(slPrich.ValueFromIndex[i]);
        exit;
      end;
    end;
  end;
end;
procedure TfmLoadExcel.WriteHistory(nID:Integer; nTypeObj:Integer; sFam:String);
begin
  dmBase.tbHistoryZAGS.Append;
  dmBase.tbHistoryZAGS.FieldByName('TYPEOBJ').AsInteger := nTypeObj;
  dmBase.tbHistoryZAGS.FieldByName('ID').AsInteger := nID;
  dmBase.tbHistoryZAGS.FieldByName('FIELDNAME').AsString := 'FAMILIA';
  dmBase.tbHistoryZAGS.FieldByName('VALUE').AsString := sFam;

  dmBase.tbHistoryZAGS.FieldByName('TYPEDATE').AsInteger:=0;
  dmBase.tbHistoryZAGS.FieldByName('DATEPROPIS').AsString := '';

  dmBase.tbHistoryZAGS.FieldByName('INFO').AsString := '';
  dmBase.tbHistoryZAGS.FieldByName('DATEIZM').AsDateTime := dmBase.getCurDate;
  dmBase.tbHistoryZAGS.Post;
end;
//-------------------------------------------------------------------------
procedure TfmLoadExcel.WriteLgota(nID:Integer; sLgot:String);
begin
  if not dmBase.SprLgot.Locate('NAME', sLgot, [loCaseInsensitive]) then begin
    dmBase.SprLgot.Append;
    dmBase.SprLgot.FieldByName('NAME').AsString:=sLgot;
    dmBase.SprLgot.Post;
  end;
  dmBase.tbMensLgot.Append;
  dmBase.tbMensLgot.FieldByName('ID').AsInteger:=nID;
  dmBase.tbMensLgot.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
  dmBase.tbMensLgot.FieldByName('KOD').AsInteger:=dmBase.SprLgot.FieldByName('ID').AsInteger;
  try
    dmBase.tbMensLgot.Post;
  except
   dmBase.tbMensLgot.Cancel;
   edDebug.Lines.Add('ERROR ������ : lgot='+sLgot); // error
  end;
end;

//-------------------------------------------------------------------------
procedure TfmLoadExcel.LoadONE(sl:TStringList);
var
  nAdresID:Integer;
  nInt, nID, nOch, nIDs, nn,n,i,j,nGrag, nIDReshPost, nIDReshSn:Integer;
  nH,nM,nS,nmm:Word;
  nPlosh:Extended;
  nRezid, nTypeHouse,nCountZar,nCount,nKomn:Integer;
  s,ss,sOtn,sIN,sNomer,sOsn,sFld:String;
  adr:TAdres;
  df,dDateP,dDateS,d:TDateTime;
  lOk, lPr, lMnogo,lVoen, lNewSem,lSirota : Boolean;
  sBookMark:TBookmarkStr;
  ts: TTimeStamp;
  arr:TArrStrings;
begin
  slAdd.Clear;
  nInt:=0;
  nID:=dmBase.GetNewID(_TypeObj_Nasel);
  lNewSem:=false;
  lSirota:=false;
  //-----------------------
  dmBase.tbOchered.Append;                                   //  <-  tbOchered  APPEND
  dmBase.tbOchered.FieldByName('OCHERED_ID').AsInteger:=0;
  dmBase.tbOchered.FieldByName('ID_BASE').AsInteger:=0;
  dmBase.tbOchered.FieldByName('ID').AsInteger:=nID;
  dmBase.tbOchered.FieldByName('OTKAZ').AsBoolean:=false;
  dmBase.tbOchered.FieldByName('ISKL').AsBoolean:=false;

//  if nOtd>0 then begin
//    dmBase.tbOchered.FieldByName('ONLY').AsBoolean:=true
//  end else begin
  dmBase.tbOchered.FieldByName('ONLY').AsBoolean:=false;
//  end;
  dDateP:=0;
  dDateS:=0;
  nAdresID:=CreateAdres(adr,sl);    // ���� ����� ������, �� nAdresID>0, ����� ��������� ������ adr:TAdres
//  s:=sl.strings[EL_DATEP];
  //------- ���������� ----------------------
  dmBase.tbOchered.FieldByName('ID_POST_RESH').AsInteger:=WriteOneResh(sl, 0, nID, OCH_RESH_POST, dDateP);
  //------- ������ ----------------------
//  s:=sl.strings[EL_DATES];
  dmBase.tbOchered.FieldByName('ID_SN_RESH').AsInteger:=WriteOneResh(sl, 0, nID, OCH_RESH_SN, dDateS);
  if (dDateS=0) and (dDateP=0) then begin
    dmBase.tbOchered.FieldByName('ID_LAST_RESH').AsInteger:=0;
  end else begin
    if (dDateS=0) or (dDateS<dDateP) then begin
      dmBase.tbOchered.FieldByName('ID_LAST_RESH').AsInteger:=dmBase.tbOchered.FieldByName('ID_POST_RESH').AsInteger;
    end else begin
      dmBase.tbOchered.FieldByName('ID_LAST_RESH').AsInteger:=dmBase.tbOchered.FieldByName('ID_SN_RESH').AsInteger;
      dmBase.tbOchered.FieldByName('ISKL').AsBoolean:=true;
    end;
  end;

  nRezid:=0;
  nTypeHouse:=0;
  nPlosh:=0;
  nCountZar:=0;
  nKomn:=0;
  nCount:=0;

  s:=ANSILowerCase(Trim(sl.Strings[EL_POM]));
{    1=���������   2=���������   3=�����������   4=����������   5=������������  6=������� �������  }

  if IsAllDigit(Copy(s,1,2)) then begin  // ��������
    i:=Pos('�.��.',s);
    if i>0 then begin
      ss:=Copy(s,1,i-1);
      ss:=StringReplace(ss,',','.',[]);
      try
        nPlosh:=StrToFloatMy(ss,'.');
      except
        nPlosh:=0;
      end;
    end;
  end;

  if (Pos('�����',s)>0) or (Pos('10 ���',s)>0) then begin
    nRezid:=1;
  end;

  if (Pos('���.',s)>0) or (Pos('�����',s)>0) then begin
    nRezid:=6;
  end;

  // ������
  if (Pos('�����',s)>0) and (Pos('���',s)>0) then begin
    WriteLgota(nID, '����������� �����');
  end;
  if (Pos('�����',s)>0) then begin
    WriteLgota(nID, '������');
    lSirota:=true;
  end;
  if (Pos('�����',s)>0) and (Pos('���',s)>0) then begin
    WriteLgota(nID, '������� �����');
    lNewSem:=true;
  end;
  if (Pos('��-���',s)>0) then begin  // ������� �������
    WriteLgota(nID, '�������-�������');
  end else begin
    if (Pos('���.',s)>0) or (Pos('�����',s)>0) then begin
      WriteLgota(nID, '�������');
    end;
  end;
  if (Pos('��������',s)>0) or (Pos('���',s)>0) then begin
    WriteLgota(nID, '��������������');
  end;
  if (Pos('2-�� ���',s)>0) or (Pos('2-� ���',s)>0) then begin
    WriteLgota(nID, '2-� �����');
  end;
  //----------------------------
  s:=Trim(sl.Strings[EL_COUNT]);
  if s<>'' then begin
    try
      nCount:=StrToInt(s);
    except
      nCount:=0;
    end;
  end;
  //----------------------------
  s:=Trim(sl.Strings[EL_LGOT]);     
  if (s<>'') and (Pos('/',s)>0) then begin
    StrToArr(s,arr,'/',true);
    if Length(arr)=2 then begin
      arr[0]:=StringReplace(arr[0],'�.��.','',[]);
      arr[0]:=StringReplace(arr[0],'�.','',[]);
      arr[0]:=StringReplace(arr[0],',','.',[]);
      arr[1]:=StringReplace(arr[1],'���.','',[]);
      arr[1]:=StringReplace(arr[1],'�.','',[]);
      try
        nPlosh:=StrToFloatMy(arr[0],'.');
        nCountZar:=StrToInt(arr[1]);
      except
        nPlosh:=0;
        nCountZar:=0;
      end;
    end;
  end;
  //----------------------------
  if (nPlosh>0) then  dmBase.tbOchered.FieldByName('PLOSH_ALL').AsFloat:=nPlosh;
//================
  if nCountZar>0 then dmBase.tbOchered.FieldByName('KOLVO_PROPIS').AsInteger:=nCountZar;
//  if nKomn>0     then dmBase.tbOchered.FieldByName('KOLVO_KOMN_PR').AsInteger:=nKomn;
  if nCount>0    then dmBase.tbOchered.FieldByName('KOLVO_SOSTAV').AsInteger:=nCount;

  if nTypeHouse>0   then dmBase.tbOchered.FieldByName('TYPEHOUSE').AsInteger:=nTypeHouse;
  if nRezid>0       then dmBase.tbOchered.FieldByName('RESIDENCE').AsInteger:=nRezid;
  //----------------------------

//  dmBase.tbOchered.FieldByName('ISKL').AsBoolean:=tbOchered.FieldByName('����').AsBoolean;


//  dmBase.tbOchered.FieldByName('DELO').AsString:=s;
//  dmBase.tbOchered.FieldByName('N_DELO').AsInteger:=n;

  if sl.Strings[EL_NOMER]<>''  then begin
    try
      dmBase.tbOchered.FieldByName('NOMER_OCH').AsInteger:=StrToInt(sl.Strings[EL_NOMER]);
    except
      dmBase.tbOchered.FieldByName('NOMER_OCH').AsString:='';
    end;
  end;  
//  dmBase.tbOchered.FieldByName('DELO').AsString:=tbOchered.FieldByName('����������').AsString;
//  dmBase.tbOchered.FieldByName('N_DELO').AsInteger:=tbOchered.FieldByName('����������').AsInteger;

  dmBase.tbOchered.FieldByName('OCHERED_PRIM').AsString:=sl.Strings[EL_NOMER]+' '+sl.Strings[EL_FIO]+' '+sl.Strings[EL_ADRES]+
         #13#10'������: '+sl.Strings[EL_COUNT]+#13#10+
         #13#10'���������: '+sl.Strings[EL_POM]+#13#10'������: '+sl.Strings[EL_LGOT]+#13#10'���������: '+sl.Strings[EL_OSN]+
         #13#10'�������: '+sl.Strings[EL_DATER]+#13#10'����������: '+sl.Strings[EL_DATEP]+#13#10'������:'+sl.Strings[EL_DATES]+
         #13#10+sl.Strings[EL_ADD];
  d:=0;
  if GetDate(sl.Strings[EL_DATEP],d) then begin
    dmBase.tbOchered.FieldByName('DEC_DATE').AsDateTime:=d;
    dmBase.tbOchered.FieldByName('DEC_DATE_REAL').AsDateTime:=d;
//    ts:=DateTimeToTimeStamp(d);
//    if ts.Date>0 then  dmBase.tbOchered.FieldByName('DEC_DATE').AsDateTime:=Int(d); //ts.Date;
//    if ts.Time>0 then  dmBase.tbOchered.FieldByName('DEC_TIME').Value:=Frac(d); //ts.Time;
//    if ts.Date>0 then  dmBase.tbOchered.FieldByName('DEC_DATE_REAL').AsDateTime:=Int(d);
  end else begin
    dmBase.tbOchered.FieldByName('DEC_DATE').AsDateTime:=dDateP;
    dmBase.tbOchered.FieldByName('DEC_DATE_REAL').AsDateTime:=dDateP;
  end;
  if (dDateP=0) and (d=0) then begin
    dmBase.tbOchered.FieldByName('DEC_DATE').AsString:='';
    dmBase.tbOchered.FieldByName('DEC_DATE_REAL').AsString:='';
  end;
//  if (tbNasel.FieldByName('������').AsString<>'') and (tbNasel.FieldByName('������').AsString<>'_���_')
//    then dmBase.tbOchered.FieldByName('GSK').AsString:=tbNasel.FieldByName('������').AsString;

  //-----------------------
  dmBase.tbOchered.Post;
  sBookMark:=dmBase.tbOchered.BookMark;

//  edDebug.Lines.Add(fbOcheredNMP.AsString+' '+fbMensFNAME.AsString+' '+fbMensINAME.AsString+' '+fbMensONAME.AsString);

  df:=dmBase.getDateCurrentSost;

  dmBase.tbMens.Append;                                      //  <-  tbMens  APPEND
  dmBase.tbMens.FieldByName('OCHERED').AsBoolean:=true;
  dmBase.tbMens.FieldByName('ID').AsInteger:=nID;
  dmBase.tbMens.FieldByName('ID_BASE').AsInteger:=0;
  dmBase.tbMens.FieldByName('DATE_FIKS').AsDateTime:=df;
  s:=sl.Strings[EL_FIO];
  i:=Pos('(',s);
  if i>0 then begin
    j:=Pos(')',s);
    if j>0 then begin
      ss:=Copy(s,i+1,j-i-1);
      s:=Trim(Copy(s,1,i-1))+' '+Trim(Copy(s,j+1,Length(s)));
//      edDebug.Lines.Add('HISTORY: '+ss);
      WriteHistory(nID, _TypeObj_Nasel, ss);
    end;
  end;
  strtoarr(s,arr,' ', true);
  setlength(arr,3);
  dmBase.tbMens.FieldByName('FAMILIA').AsString:=Trim(arr[0]);
  dmBase.tbMens.FieldByName('NAME').AsString:=Trim(arr[1]);
  dmBase.tbMens.FieldByName('OTCH').AsString:=Trim(arr[2]);
//  WriteDate(tbNasel.FieldByName('������������'), dmBase.tbMens.FieldByName('DATER') );
  dmBase.tbMens.FieldByName('POL').AsString:=PolFrom(arr[1], arr[2]);
//  sIN:=CheckRus2(tbNasel.FieldByName('�����������').AsString);
  sIN:='';
  dmBase.tbMens.FieldByName('LICH_NOMER').AsString:=sIN;
  if sIN<>'' then begin
    if Copy(sIN,12,1)<>'V'
      then nGrag:=MY_GRAG
      else nGrag:=StrToInt(IN_GRAG_STR);
  end else begin
    nGrag:=MY_GRAG;
  end;
//  dmBase.tbMens.FieldByName('TELEFON').AsString:=tbNasel.FieldByName('����').AsString;
//  dmBase.tbMens.FieldByName('WORK_TELEF').AsString:=tbNasel.FieldByName('����').AsString;

//  if tbNasel.FieldByName('�����������').AsString<>'' then begin
//    dmBase.WriteValueProp('WORK_NAME', tbNasel.FieldByName('�����������').AsString, DF, nID, dmBase.TypeObj_Nasel, ftMemo);
//  end;

  if nAdresID>0  then begin
    dmBase.tbMens.FieldByName('ADRES_ID').AsInteger:=nAdresID;
  end else begin
    dmBase.tbMens.FieldByName('ADRES_ID').AsInteger:=0;
    edDebug.Lines.Add(sl.Strings[EL_ADRES]+', ��������� �����');
    dmBase.WriteValueProp('ADRES_PROP', adr.AdresPropis, DF, nID, dmBase.TypeObj_Nasel, ftMemo);
    dmBase.WriteValueProp('APROP_OBL', adr.Obl, DF, nID, dmBase.TypeObj_Nasel, ftMemo);
    dmBase.WriteValueProp('APROP_RN', adr.Raion, DF, nID, dmBase.TypeObj_Nasel, ftMemo);
    dmBase.WriteValueProp('APROP_PN', adr.Punkt, DF, nID, dmBase.TypeObj_Nasel, ftMemo);
    dmBase.WriteValueProp('APROP_UL', adr.Ulica, DF, nID, dmBase.TypeObj_Nasel, ftMemo);
    dmBase.WriteValueProp('APROP_DOM', adr.NDom, DF, nID, dmBase.TypeObj_Nasel, ftString);
    dmBase.WriteValueProp('APROP_KORP', adr.Korp, DF, nID, dmBase.TypeObj_Nasel, ftString);
    dmBase.WriteValueProp('APROP_KV', adr.Kv, DF, nID, dmBase.TypeObj_Nasel, ftString);
  end;
  dmBase.tbMens.Post;

  //------- ������ ����� ---------------------
  //----- end ������ ����� --------------------------------

  //-- ������ ----------------------------------
  {
  tbLgot.First;
  while not tbLgot.Eof do begin
    s:='';
    if SprLgot.Locate('���������', tbLgot.FieldByName('���������').AsInteger, [loCaseInsensitive]) then begin
      s:=SprLgot.FieldByName('������').AsString;
      if Pos('������', ANSIUpperCase(s))>0 then begin
        Inc(nCount1,1);
        lSirota:=true;
      end;
      if Pos('������', ANSIUpperCase(s))>0 then begin
        Inc(nCount1,1);
        lNewSem:=true;
      end;
    end;
    if s<>'' then begin
      if not dmBase.SprLgot.Locate('NAME', s, [loCaseInsensitive]) then begin
        dmBase.SprLgot.Append;
        dmBase.SprLgot.FieldByName('NAME').AsString:=s;
        dmBase.SprLgot.Post;
      end;
      dmBase.tbMensLgot.Append;
      dmBase.tbMensLgot.FieldByName('ID').AsInteger:=nID;
      dmBase.tbMensLgot.FieldByName('DATE_FIKS').AsDateTime:=df;
      dmBase.tbMensLgot.FieldByName('KOD').AsInteger:=dmBase.SprLgot.FieldByName('ID').AsInteger;
      try
        dmBase.tbMensLgot.Post;
      except
        dmBase.tbMensLgot.Cancel;
        edDebug.Lines.Add('ERROR ������ : men='+InttoStr(fbID)+' lgot='+s); // error
      end;
    end;
    tbLgot.Next;
  end;
  tbLgot.First;
  }
  if lNewSem or lSirota then begin
    dmBase.tbOchered.BookMark:=sBookMark;
    dmBase.tbOchered.Edit;
    dmBase.tbOchered.FieldByName('NEWSEM').AsBoolean:=lNewSem;
    dmBase.tbOchered.FieldByName('SIROTA').AsBoolean:=lSirota;
    dmBase.tbOchered.Post;
  end;

end;


//-------------------------------------------------------------------
function TfmLoadExcel.WriteOneResh(sl:TStringList; nOch:Integer;nID:Integer; nTip:Integer; var dDate:TDateTime):Integer;
var
  sNomer,sDate,s,sOsn,sOsnF:String;
  nOsn:Integer;
  d:TDateTime;
begin
  Result:=0;
  sNomer:='';
  dDate:=0;
  if nTip=OCH_RESH_POST then begin  // ����������
    sOsn:=Trim(sl.Strings[EL_OSN]);
    sDate:=Trim(sl.Strings[EL_DATER]);
    if sDate='' then sDate:=Trim(sl.Strings[EL_DATEP]);
  end else begin   // ������
    sOsn:='';
    sDate:=Trim(sl.Strings[EL_DATES]);
  end;
  if sDate<>'' then begin
    if GetDate(sDate,d)
      then dDate:=d;
    if (nTip=OCH_RESH_SN) and (dDate=0) then begin
   //   ShowMessage(sOsn+' '+sl.Strings[EL_DATES]);
    end;
  end;
  if (sNomer='') and (dDate=0) and (sOsn='') then begin
    if nTip=OCH_RESH_POST then begin  // ����������
      edDebug.Lines.Add('ERROR: NOT RESH '+sl.Strings[EL_NOMER]); // error
    end;
  end else begin
    dmBase.tbOcheredResh.Append;
    dmBase.tbOcheredResh.FieldByName('OCHERED_ID').AsInteger:=nOch;
    dmBase.tbOcheredResh.FieldByName('ID').AsInteger:=nID;
    dmBase.tbOcheredResh.FieldByName('TIP').AsInteger:=nTip;
    dmBase.tbOcheredResh.FieldByName('ID_BASE').AsInteger:=0;
    dmBase.tbOcheredResh.FieldByName('NOMER').AsString:=sNomer;

    nOsn:=FindOsnov(sOsn);
    if nOsn>0 then begin
      dmBase.tbOcheredResh.FieldByName('OSNOV').AsInteger:=nOsn;
//      dmBase.tbOcheredResh.FieldByName('ADDINFO').AsString:=sOsn+#13+sOsnF;
    end else begin
      dmBase.tbOcheredResh.FieldByName('OSNOV').AsString:='0';
      dmBase.tbOcheredResh.FieldByName('OSNOV_TEXT').AsString:=sOsn;
//      dmBase.tbOcheredResh.FieldByName('ADDINFO').AsString:=sOsnF;
    end;

    if dDate>0
      then dmBase.tbOcheredResh.FieldByName('DATER').AsDateTime:=dDate;
    dmBase.tbOcheredResh.Post;
    Result:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
  end;
end;

procedure TfmLoadExcel.ListBox1Click(Sender: TObject);
var
  s:String;
  i:Integer;
begin
 s:=ListBox1.Items[ListBox1.ItemIndex];
 for i:=0 to ComponentCount-1 do begin
 {
   if Components[i] is TADOTable then begin
     if TADOTable(Components[i]).Name=s then begin
       DataSource1.DataSet:=TADOTable(Components[i]);
     end;
   end;
 }
 end;
end;

//-----------------------------------------------------------
function TfmLoadExcel.WriteDate(fldSource,fldDest:TField):Boolean;
begin
  Result:=false;
  if not fldSource.IsNull then begin
    fldDest.AsDateTime:=fldSource.AsDateTime;
    Result:=true;
  end;
end;

//------------------------------------------------------------------------------------
function TfmLoadExcel.GetDate(sDate:String; var dDate : TDateTime):Boolean;
var
  i:Integer;
begin
  Result:=false;
  i:=Pos(',',sDate);
  if i>0
    then sDate:=Copy(sDate,1,i-1);    // ���� ��� ���� ����� ������
  sDate:=Trim(sDate);
  if (sDate<>'') and IsAllDigit(Copy(sDate,1,2)) then begin
    try
      dDate:=EncodeDate(StrToInt(copy(sDate,7,4)),StrToInt(copy(sDate,4,2)),StrToInt(copy(sDate,1,2)));
      Result:=true;
    except
      dDate:=0;
       // ???
    end;
  end else begin
    dDate:=0;
  end;
end;

end.
