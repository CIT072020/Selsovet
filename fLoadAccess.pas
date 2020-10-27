unit fLoadAccess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dBase, fMAin, QStrings,
  Dialogs, Grids, DBGridEh, DB, ADODB, uTypes, uProject, uCheckKod, uProjectAll, StdCtrls;

type
  TfmLoadAccess = class(TForm)
    Button1: TButton;
    edDebug: TMemo;
    ADOConnection1: TADOConnection;
    tbOchered: TADOTable;
    tbNasel: TADOTable;
    tbSostav: TADOTable;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    SprOsnPost: TADOTable;
    ListBox1: TListBox;
    tbPer: TADOTable;
    tbLgot: TADOTable;
    SprLgot: TADOTable;
    tbPast: TADOTable;
    SprTypeHouse: TADOTable;
    dsMaster: TDataSource;
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
    function CreateAdres(var adr:TAdres):Integer;
    function FindOsnov(sOsnov:String):Integer;

    procedure LoadONE(nOtd:Integer=0);
    function WriteOneResh(nOch:Integer;nID:Integer; nTip:Integer; var dDate:TDateTime):Integer;

    function WriteDate(fldSource,fldDest:TField):Boolean;
  end;

  procedure LoadAccess;

implementation

uses StrUtils;

{$R *.dfm}

procedure LoadAccess;
var
  f: TfmLoadAccess;
begin
  f:=TfmLoadAccess.create(nil);
  f.ShowModal;
  f.Free;
end;

procedure TfmLoadAccess.FormCreate(Sender: TObject);
var
  i:INteger;
begin
 slLoad:=TStringList.Create;
 slPrich:=TStringList.Create;
 slAdd:=TStringList.Create;
 for i:=0 to ComponentCount-1 do begin
   if Components[i] is TADOTable then begin
     if not TADOTable(Components[i]).Active then TADOTable(Components[i]).Active:=true;
     ListBox1.Items.AddObject(TADOTable(Components[i]).Name, Components[i]);
   end;
 end;
 DataSource1.DataSet:=tbOchered;

end;

procedure TfmLoadAccess.FormDestroy(Sender: TObject);
begin
  slLoad.Free;
  slPrich.Free;
  slAdd.Free;
end;

procedure TfmLoadAccess.Button1Click(Sender: TObject);
var
  nSocialOch,n,nnn,m:Integer;
  lLoad:Boolean;
  function GetPunkt(sss:String):String;
  begin
    Result:=Trim(sss);
    if RightStr(result,1)='.' then Copy(result,1,Length(result)-1);
  end;
begin
  nCount1:=0;
  n:=0;
  m:=0;
//  slLoad.Clear;
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

  tbOchered.First;
  while not tbOchered.Eof do begin
    lLoad:=(nnn=0) or (Frac(n/nnn)=0);
    if lLoad then begin
      LoadOne;
      Inc(m,1);
    end;
    tbOchered.Next;
    Inc(n,1);
    Label1.Caption:=IntToStr(n);
//    Label4.Caption:=IntToStr(m);
    Application.ProcessMessages;
  end;
  tbOchered.First;
{
  if nSocialOch>0 then begin
    n:=0;
    fbOchered.Close;
    fbOchered.SelectSQL.Text:='select * FROM OOCH WHERE KOCH='+IntToStr(nSocialOch)+' ORDER BY TN';
    fbOchered.Active:=true;
    fbOchered.First;
    while not fbOchered.Eof do begin
      LoadOne(nSocialOch);
      fbOchered.Next;
      Inc(n,1);
      Label2.Caption:=IntToStr(n);
      Application.ProcessMessages;
    end;
    fbOchered.First;
  end;
 }
end;


function TfmLoadAccess.CreateAdres(var adr: TAdres): Integer;
var
  s,sRaion, sObl, sErr, sTipPunkt, sPrim,sPunkt,sDom,sKorp,sKv,sUl,sTipUl : String;
  nTipUl,nRezid,nKomn, nPunkt, nKodUl, n, nCountZar, nCount, nTypeHouse : Integer;
  nPlosh:Extended;
  lMy:Boolean;
  nAdresID:Integer;
  nKodNP,i:Integer;
begin
  sObl:='';
  Result:=-1;
  lMy:=false;
//  sPrim:=fbMensAdresPRIM.AsString;
  nKomn:=tbNasel.fieldByName('ИмКомнат').AsInteger;     // колич. комнат
  nCountZar:=tbNasel.fieldByName('КолПроживающих').AsInteger;  // колич. зарегистр.
  nCount:=tbNasel.fieldByName('КолЧлСемьи').AsInteger;     // кол-во в составе семьи

  //---------------------------------------
  n:=tbNasel.fieldByName('ТипЖилья').AsInteger;            // код проживания

{    1=общежитие   2=служебное   3=специальное   4=социальное   5=коммерческое  6=частный жилфонд  }
  nRezid:=0;
  nTypeHouse:=0;
  if (n>0) and SprTypeHouse.Locate('Код', n, []) then begin
    s:=AnsiLowerCase(SprTypeHouse.FieldByName('ТипЖилья').AsString);
    if n=5 then  // гос. квартира
      nRezid:=7
    else if Copy(s,1,4)='обще' then
      nRezid:=1
    else if Copy(s,1,4)='служ' then
      nRezid:=2
    else if Copy(s,1,4)='спец' then
      nRezid:=3
    else if Copy(s,1,4)='соци' then
      nRezid:=4
    else if Copy(s,1,5)='комме' then
      nRezid:=5
    else if Copy(s,1,4)='част' then
      nRezid:=6;
    if s<>'' then begin
      if not dmBase.SprTypeHouse.Locate('NAME', s, [loCaseInsensitive]) then begin
        dmBase.SprTypeHouse.Append;
        dmBase.SprTypeHouse.FieldByNAme('NAME').AsString:=s;
        dmBase.SprTypeHouse.Post;
      end;
      nTypeHouse:=dmBase.SprTypeHouse.FieldByNAme('ID').AsInteger;
    end;
  end;
  sPunkt:=tbNasel.fieldByName('НасПункт').AsString;
  sUl:=tbNasel.fieldByName('Улица').AsString;
  sDom:=tbNasel.fieldByName('Дом').AsString;
  sKorp:=tbNasel.fieldByName('Корпус').AsString;
  sKv:=tbNasel.fieldByName('Квартира').AsString;
  nPlosh:=tbNasel.fieldByName('ИмОбщаяПлощадь').AsFloat;       // площадь
  //----------------------------
  if (nPlosh>0) then  dmBase.tbOchered.FieldByName('PLOSH_ALL').AsFloat:=nPlosh;
//================
  if nCountZar>0 then dmBase.tbOchered.FieldByName('KOLVO_PROPIS').AsInteger:=nCountZar;
  if nKomn>0     then dmBase.tbOchered.FieldByName('KOLVO_KOMN_PR').AsInteger:=nKomn;
  if nCount>0    then dmBase.tbOchered.FieldByName('KOLVO_SOSTAV').AsInteger:=nCount;

  if nTypeHouse>0   then dmBase.tbOchered.FieldByName('TYPEHOUSE').AsInteger:=nTypeHouse;
  if nRezid>0       then dmBase.tbOchered.FieldByName('RESIDENCE').AsInteger:=nRezid;
  //----------------------------

  nPunkt:=0;   // !!!
  nKodUl:=0;
  if Pos('сморгонь', ANSILowercase(sPunkt))>0 then begin
    lMy:=true;
    nPunkt:=1;
  end;
  nTipUl:=0;
  if nPunkt=1 then begin
    if sUL<>'' then begin
      i:=Pos('ул.',sUl);
      if i>0 then begin
        sUl:=Trim(StringReplace(sUl,'ул.','',[]));
        nTipUl:=1;
      end else begin
        i:=Pos('пер.',sUl);
        if i>0 then begin
          sUl:=Trim(StringReplace(sUl,'пер.','',[]));
          nTipUL:=3;
        end else begin
          i:=Pos('пр-т',sUl);
          if i>0 then begin
            sUl:=Trim(StringReplace(sUl,'пр-т','',[]));
            nTipUL:=2;
          end else begin
            i:=Pos('пр.',sUl);
            if i>0 then begin
              sUl:=Trim(StringReplace(sUl,'пр.','',[]));
              nTipUL:=5;
            end;
          end;
        end;
      end;
      if nTipUl=0 then begin
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
        if nKomn>0  then dmBase.WriteValueProp('KOL_KOMN', nKomn, dmBase.GetDateCurrentSost, nAdresID,dmbase.TypeObj_Adres,ftInteger);
        if nPlosh>0 then dmBase.WriteValueProp('PLOSH_ALL', nPlosh,dmBase.GetDateCurrentSost, nAdresID, dmbase.TypeObj_Adres,ftFloat);
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
//      adr.AdresPropis:=tbNasel.fieldByName('Адрес').AsString;
    s:=dmBase.AdresPropisFromAdres(adr, true);
    if s<>''
      then adr.AdresPropis:=s
  end;
end;

function TfmLoadAccess.FindOsnov(sOsnov: String): Integer;
var
  i:Integer;
begin
  Result:=0;
  for i:=0 to slPrich.Count-1 do begin
    if Pos(slPrich.Names[i], sOsnov)>0 then begin
      Result:=StrToInt(slPrich.ValueFromIndex[i]);
      exit;
    end;
  end;
end;
//-------------------------------------------------------------------------
procedure TfmLoadAccess.LoadONE(nOtd:Integer);
var
  nAdresID:Integer;
  nInt, nID, nOch, fbID, fbIDs, nIDs, nn,n,i,nGrag, nIDReshPost, nIDReshSn:Integer;
  nH,nM,nS,nmm:Word;
  s,sOtn,sIN,sNomer,sOsn,sFld:String;
  adr:TAdres;
  df,dDateP,dDateS,d:TDateTime;
  lOk, lPr, lNewSem,lSirota : Boolean;
  sBookMark:TBookmarkStr;
  ts: TTimeStamp;
begin
  sFld:='КодОчередника';
  slAdd.Clear;
  fbID:=tbOchered.fieldByName(sFld).AsInteger;
  if nOtd=0 then begin
    slLoad.Add(IntToStr(fbID));   // запишем код кого грузим
  end else begin
    if slLoad.IndexOf(InttoStr(fbID))>-1 then begin  // уже грузили
      exit;    // <<<<<<<<<<<<<<<< !!!
    end;
  end;

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

  if nOtd>0 then begin
    dmBase.tbOchered.FieldByName('ONLY').AsBoolean:=true
  end else begin
    dmBase.tbOchered.FieldByName('ONLY').AsBoolean:=false;
  end;

  if tbNasel.Locate(sFld, fbID, []) then begin      // найдем человека
    nAdresID:=CreateAdres(adr);    // если адрес создан, то nAdresID>0, иначе заполнена запись adr:TAdres
  end else begin
    edDebug.Lines.Add('ERROR: NOT FOUND fbID='+inttostr(fbID)); // error
    dmBase.tbOchered.Cancel;
    exit;
  end;
  //------- постановка ----------------------
  dmBase.tbOchered.FieldByName('ID_POST_RESH').AsInteger:=WriteOneResh(0, nID, OCH_RESH_POST, dDateP);
  //------- снятие ----------------------
  dmBase.tbOchered.FieldByName('ID_SN_RESH').AsInteger:=WriteOneResh(0, nID, OCH_RESH_SN, dDateS);
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
  dmBase.tbOchered.FieldByName('ISKL').AsBoolean:=tbOchered.FieldByName('Снят').AsBoolean;


  dmBase.tbOchered.FieldByName('DELO').AsString:=s;
  dmBase.tbOchered.FieldByName('N_DELO').AsInteger:=n;
  if (tbOchered.FieldByName('НомерОчереди').AsInteger>0) and (tbOchered.FieldByName('НомерОчереди').AsInteger<32000) then
    dmBase.tbOchered.FieldByName('NOMER_OCH').AsInteger:=tbOchered.FieldByName('НомерОчереди').AsInteger;
  dmBase.tbOchered.FieldByName('DELO').AsString:=tbOchered.FieldByName('НомерУчета').AsString;
  dmBase.tbOchered.FieldByName('N_DELO').AsInteger:=tbOchered.FieldByName('НомерУчета').AsInteger;
  dmBase.tbOchered.FieldByName('OCHERED_PRIM').AsString:=tbOchered.FieldByName('Примечание').AsString;

  d:=tbOchered.FieldByName('ДатаПостановки').AsDateTime;
  if d>0 then begin
    ts:=DateTimeToTimeStamp(d);
    if ts.Date>0 then  dmBase.tbOchered.FieldByName('DEC_DATE').AsDateTime:=Int(d); //ts.Date;
    if ts.Time>0 then  dmBase.tbOchered.FieldByName('DEC_TIME').Value:=Frac(d); //ts.Time;
    if ts.Date>0 then  dmBase.tbOchered.FieldByName('DEC_DATE_REAL').AsDateTime:=Int(d);
  end else begin
    dmBase.tbOchered.FieldByName('DEC_DATE').AsDateTime:=dDateP;
    dmBase.tbOchered.FieldByName('DEC_DATE_REAL').AsDateTime:=dDateP;
  end;
  if (tbNasel.FieldByName('Строит').AsString<>'') and (tbNasel.FieldByName('Строит').AsString<>'_НЕТ_')
    then dmBase.tbOchered.FieldByName('GSK').AsString:=tbNasel.FieldByName('Строит').AsString;

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
  dmBase.tbMens.FieldByName('FAMILIA').AsString:=tbNasel.FieldByName('Фамилия').AsString;
  dmBase.tbMens.FieldByName('NAME').AsString:=tbNasel.FieldByName('Имя').AsString;
  dmBase.tbMens.FieldByName('OTCH').AsString:=tbNasel.FieldByName('Отчество').AsString;
  WriteDate(tbNasel.FieldByName('ДатаРождения'), dmBase.tbMens.FieldByName('DATER') );
  dmBase.tbMens.FieldByName('POL').AsString:=PolFrom(tbNasel.FieldByName('Имя').AsString, tbNasel.FieldByName('Отчество').AsString);
  sIN:=CheckRus2(tbNasel.FieldByName('ЛичныйНомер').AsString);
  dmBase.tbMens.FieldByName('LICH_NOMER').AsString:=sIN;
  if sIN<>'' then begin
    if Copy(sIN,12,1)<>'V'
      then nGrag:=MY_GRAG
      else nGrag:=StrToInt(IN_GRAG_STR);
  end else begin
    nGrag:=MY_GRAG;
  end;
  dmBase.tbMens.FieldByName('TELEFON').AsString:=tbNasel.FieldByName('ТелД').AsString;
  dmBase.tbMens.FieldByName('WORK_TELEF').AsString:=tbNasel.FieldByName('ТелР').AsString;

  if tbNasel.FieldByName('МестоРаботы').AsString<>'' then begin
    dmBase.WriteValueProp('WORK_NAME', tbNasel.FieldByName('МестоРаботы').AsString, DF, nID, dmBase.TypeObj_Nasel, ftMemo);
  end;

  if tbNasel.FieldByName('IdentCard').AsString='1' then begin
    dmBase.tbMens.FieldByName('PASP_UDOST').AsString:='1';
    s:=tbNasel.FieldByName('IdentCardNumber').AsString;
    i:=Q_StrCSpn(s, '1234567890', 1);  // первая позиция цифры
    if i > 0 then begin
      dmBase.tbMens.FieldByName('PASP_SERIA').AsString:=copy(s,1,i-1);
      dmBase.tbMens.FieldByName('PASP_NOMER').AsString:=copy(s,i,Length(s));
    end;
    dmBase.WriteValueProp('PASP_VIDAN', tbNasel.FieldByName('IdentCardDep').AsString, DF, nID, dmBase.TypeObj_Nasel, ftMemo);
    WriteDate(tbNasel.FieldByName('IdentCardDate'), dmBase.tbMens.FieldByName('PASP_DATE'));
  end;

  if nAdresID>0  then begin
    dmBase.tbMens.FieldByName('ADRES_ID').AsInteger:=nAdresID;
  end else begin
    dmBase.tbMens.FieldByName('ADRES_ID').AsInteger:=0;
    edDebug.Lines.Add('fbID='+inttostr(fbID)+', текстовый адрес');
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

  //------- состав семьи ---------------------
  tbSostav.First;      // установлен мастер-детайл
//  fbSostavSem.Filtered:=true;
  nN:=1;
  while not tbSostav.Eof do begin
    sOtn:=tbSostav.fieldByName('Родство').AsString;  // отношение к очереднику
    if MySameText(sOtn,'сама') or MySameText(sOtn,'сам') then begin

    end else begin
      with dmBase.tbSostavSem do begin
        nIDs:=dmBase.GetNewID(_TypeObj_Nasel);
        Append;
        FieldByName('ID').AsInteger:=nID;
        FieldByName('NOMER').AsInteger:=nN;
        nN:=nN+1;
        FieldByName('FAMILIA').AsString:=tbSostav.fieldByName('Фамилия').AsString;
        FieldByName('NAME').AsString:=tbSostav.fieldByName('Имя').AsString;
        FieldByName('OTCH').AsString:=tbSostav.fieldByName('Отчество').AsString;
        FieldByName('POL').AsString:=PolFrom(tbSostav.fieldByName('Имя').AsString, tbSostav.fieldByName('Отчество').AsString);
        FieldByName('MEMBER_ID').AsInteger:=nIDs;
        WriteDate(tbSostav.fieldByName('ДатаРождения'), FieldByName('DATER'));
        sIN:=CheckRus2(tbSostav.fieldByName('ЛичныйНомер').AsString);
        FieldByName('LICH_NOMER').AsString:=sIN;

        if tbSostav.FieldByName('IdentCard').AsString='1' then begin
          FieldByName('PASP_UDOST').AsString:='1';
          s:=tbSostav.FieldByName('IdentCardNumber').AsString;
          i:=Q_StrCSpn(s, '1234567890', 1);  // первая позиция цифры
          if i > 0 then begin
            FieldByName('PASP_SERIA').AsString:=copy(s,1,i-1);
            FieldByName('PASP_NOMER').AsString:=copy(s,i,Length(s));
          end;
          FieldByName('PASP_VIDAN').AsString:=tbSostav.FieldByName('IdentCardDep').AsString;
        end;
        if sIN<>'' then begin
          if Copy(sIN,12,1)<>'V'
            then nGrag:=MY_GRAG
            else nGrag:=StrToInt(IN_GRAG_STR);
        end else begin
          nGrag:=MY_GRAG;
        end;
        n:=0;
        if sOtn<>'' then begin
          if not dmBase.SprOtnosh.Locate('NAME',sOtn,[loCaseInsensitive]) then begin
            dmBase.sprOtnosh.Append;
            dmBase.SprOtnosh.FieldByName('NAME').AsString:=sOtn;
            dmBase.SprOtnosh.Post;
          end;
          n:=dmBase.SprOtnosh.FieldByName('ID').AsInteger;
        end;
        if n>0 then FieldByName('OTNOSH').AsInteger:=n;
        Post;
  //-------------------------------------------------------------------------
        dmBase.tbMens.Append;
        dmBase.tbMens.FieldByName('DATE_FIKS').AsDateTime:=df;
        dmBase.tbMens.FieldByName('ID').AsInteger:=nIDs;
        dmBase.tbMens.FieldByName('ID_BASE').AsInteger:=0;
        dmBase.tbMens.FieldByName('OCHERED').AsBoolean:=false;
        dmBase.tbMens.FieldByName('FAMILIA').AsString:=FieldByName('FAMILIA').AsString;
        dmBase.tbMens.FieldByName('NAME').AsString:=FieldByName('NAME').AsString;
        dmBase.tbMens.FieldByName('OTCH').AsString:=FieldByName('OTCH').AsString;
        dmBase.tbMens.FieldByName('OTNOSH').AsString:=FieldByName('OTNOSH').AsString;
        dmBase.tbMens.FieldByName('POL').AsString:=FieldByName('POL').AsString;
        dmBase.tbMens.FieldByName('CITIZEN').AsInteger:=nGrag;
        dmBase.tbMens.FieldByName('LICH_NOMER').AsString:=FieldByName('LICH_NOMER').AsString;
        if FieldByName('PASP_NOMER').AsString<>'' then begin
          WriteDate( FieldByName('PASP_DATE'), dmBase.tbMens.FieldByName('PASP_DATE'));
          dmBase.tbMens.FieldByName('PASP_UDOST').AsString:=FieldByName('PASP_UDOST').AsString;
          dmBase.tbMens.FieldByName('PASP_SERIA').AsString:=FieldByName('PASP_SERIA').AsString;
          dmBase.tbMens.FieldByName('PASP_NOMER').AsString:=FieldByName('PASP_NOMER').AsString;
          dmBase.WriteProp(df, nIDs, dmBase.tbSostavSem, 'PASP_VIDAN', dmBase.TypeObj_Nasel);
        end;
                                    
        if not FieldByName('DATER').IsNull
          then dmBase.tbMens.FieldByName('DATER').Value:=FieldByName('DATER').Value;
        dmBase.tbMens.Post;
      end;
  //-------------------------------------------------------------------------
    end;
    tbSostav.Next;
  end;
  tbSostav.First;
  //----- end состав семьи --------------------------------

  //-- льготы ----------------------------------
  tbLgot.First;
  while not tbLgot.Eof do begin
    s:='';
    if SprLgot.Locate('КодЛьготы', tbLgot.FieldByName('КодЛьготы').AsInteger, [loCaseInsensitive]) then begin
      s:=SprLgot.FieldByName('Льгота').AsString;
      if Pos('СИРОТА', ANSIUpperCase(s))>0 then begin
        Inc(nCount1,1);
        lSirota:=true;
      end;
      if Pos('МОЛОДА', ANSIUpperCase(s))>0 then begin
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
        edDebug.Lines.Add('ERROR ЛЬГОТА : men='+InttoStr(fbID)+' lgot='+s); // error
      end;
    end;
    tbLgot.Next;
  end;
  tbLgot.First;

  if lNewSem or lSirota then begin
    dmBase.tbOchered.BookMark:=sBookMark;
    dmBase.tbOchered.Edit;
    dmBase.tbOchered.FieldByName('NEWSEM').AsBoolean:=lNewSem;
    dmBase.tbOchered.FieldByName('SIROTA').AsBoolean:=lSirota;
    dmBase.tbOchered.Post;
  end;

end;


//-------------------------------------------------------------------
function TfmLoadAccess.WriteOneResh(nOch:Integer;nID:Integer; nTip:Integer; var dDate:TDateTime):Integer;
var
  sNomer,s,sOsn,sOsnF:String;
  nOsn:Integer;
begin
  Result:=0;
  sNomer:='';
  dDate:=0;
  sOsn:='';
  if nTip=OCH_RESH_POST then begin  // постановка
    if tbOchered.FieldByName('OrderOn').AsInteger>0 then begin
      if SprOsnPost.Locate('OrderOn', tbOchered.FieldByName('OrderOn').AsInteger,[]) then begin
        sOsn:=SprOsnPost.FieldByName('OrderText').AsString;
      end;
    end;
    sNomer:=tbOchered.FieldByName('НомерРешПост').AsString;
    if not tbOchered.FieldByName('ДатаРешПост').IsNull then dDate:=tbOchered.FieldByName('ДатаРешПост').AsDateTime;
  end else begin   // снятие
    sOsn:=tbOchered.FieldByName('OrderOut').AsString;
    if not tbOchered.FieldByName('ДатаРешСн').IsNull then dDate:=tbOchered.FieldByName('ДатаРешСн').AsDateTime;
    sNomer:=tbOchered.FieldByName('НомерРешСн').AsString;
  end;
  if (sNomer='') and (dDate=0) and (sOsn='') then begin
    if nTip=OCH_RESH_POST then begin  // постановка
      edDebug.Lines.Add('ERROR: NOT RESH '+inttostr(nID)); // error
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

procedure TfmLoadAccess.ListBox1Click(Sender: TObject);
var
  s:String;
  i:Integer;
begin
 s:=ListBox1.Items[ListBox1.ItemIndex];
 for i:=0 to ComponentCount-1 do begin
   if Components[i] is TADOTable then begin
     if TADOTable(Components[i]).Name=s then begin
       DataSource1.DataSet:=TADOTable(Components[i]);
     end;
   end;
 end;
end;

//-----------------------------------------------------------
function TfmLoadAccess.WriteDate(fldSource,fldDest:TField):Boolean;
begin
  Result:=false;
  if not fldSource.IsNull then begin
    fldDest.AsDateTime:=fldSource.AsDateTime;
    Result:=true;
  end;
end;

end.
