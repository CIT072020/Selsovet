unit fLoadKam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uProject, DateUtils, uCheckKod, dBase, uTypes,
  Dialogs, Grids, DBGridEh, DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, FIBDatabase, pFIBDatabase, StdCtrls, SynEditHighlighter, QStrings,
  SynHighlighterSQL, SynEdit, ExtCtrls, Mask, DBCtrlsEh;

type
  TfmLoadKam = class(TForm)
    pFIBDatabase: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    tbListTable: TpFIBDataSet;
    DataSource1: TDataSource;
    tbView: TpFIBDataSet;
    DataSource2: TDataSource;
    pFIBDataSet1: TpFIBDataSet;
    DataSource3: TDataSource;
    SynSQLSyn1: TSynSQLSyn;
    pFIBDataSet2: TpFIBDataSet;
    Panel1: TPanel;
    DBGridEh3: TDBGridEh;
    Splitter1: TSplitter;
    edSQL: TSynEdit;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Button3: TButton;
    btLoad: TButton;
    Label1: TLabel;
    fbSprOsn: TpFIBDataSet;
    fbSostavSem: TpFIBDataSet;
    fbSprOsnKOSN: TFIBIntegerField;
    fbSprOsnNOSN: TFIBStringField;
    fbSprOsnNNOSN: TFIBStringField;
    fbOchered: TpFIBDataSet;
    fbOcheredKOSN: TFIBIntegerField;
    fbOcheredTN: TFIBIntegerField;
    fbOcheredKOCH: TFIBIntegerField;
    fbOcheredKR_P: TFIBIntegerField;
    fbOcheredKR_S: TFIBIntegerField;
    fbOcheredKPR: TFIBIntegerField;
    fbOcheredNMP: TFIBIntegerField;
    fbOcheredDATA_Z: TFIBDateTimeField;
    fbOcheredDNOW: TFIBDateTimeField;
    fbOcheredPRIM: TFIBStringField;
    fbOcheredNMPP: TFIBIntegerField;
    fbOcheredTIME_Z: TFIBDateTimeField;
    fbOcheredKOSNX: TFIBIntegerField;
    fbOcheredKOSNY: TFIBIntegerField;
    fbMens: TpFIBDataSet;
    fbMensTN: TFIBIntegerField;
    fbMensFNAME: TFIBStringField;
    fbMensINAME: TFIBStringField;
    fbMensONAME: TFIBStringField;
    fbMensKEM: TFIBStringField;
    fbMensKPR: TFIBIntegerField;
    fbMensKOTR: TFIBIntegerField;
    fbMensFSEARCH: TFIBStringField;
    fbMensKRAB: TFIBIntegerField;
    fbMensD_ROZ: TFIBDateTimeField;
    fbMensFN_DEV: TFIBStringField;
    fbMensL_NOMER: TFIBStringField;
    fbMensS_NOMER: TFIBStringField;
    fbMensN_NOMER: TFIBStringField;
    fbMensD_NOMER: TFIBDateTimeField;
    fbMensK_NOMER: TFIBStringField;
    fbSprLgot: TpFIBDataSet;
    fbSprLgotKLGOTA: TFIBIntegerField;
    fbSprLgotNLGOTA: TFIBStringField;
    fbSprTypeHouse: TpFIBDataSet;
    fbSprTypeHouseKZIL: TFIBIntegerField;
    fbSprTypeHouseNZIL: TFIBStringField;
    fbSprTypeHouseSZIL: TFIBStringField;
    fbSprOtnosh: TpFIBDataSet;
    fbSprOtnoshKSEM: TFIBIntegerField;
    fbSprOtnoshNSEM: TFIBStringField;
    fbSprOtnoshPMN: TFIBBooleanField;
    fbSprInternat: TpFIBDataSet;
    fbSprReshen: TpFIBDataSet;
    fbSprReshenKR: TFIBIntegerField;
    fbSprReshenNR: TFIBStringField;
    fbSprReshenDR: TFIBDateTimeField;
    fbMensLgota: TpFIBDataSet;
    fbAdresDom: TpFIBDataSet;
    fbAdresDomKADR_DOM: TFIBIntegerField;
    fbAdresDomKUL: TFIBIntegerField;
    fbAdresDomDOM: TFIBIntegerField;
    fbAdresDomDDOM: TFIBStringField;
    fbAdresDomKORPUS: TFIBIntegerField;
    fbAdresDomKPR: TFIBIntegerField;
    fbAdresDomKRAON: TFIBIntegerField;
    fbAdresDomKNASP: TFIBIntegerField;
    fbAdresDomPUNKT: TFIBStringField;
    fbAdresDomRAION: TFIBStringField;
    fbAdresDomUL_TIP: TFIBStringField;
    fbAdresDomUL_NAME: TFIBStringField;
    fbMensAdres: TpFIBDataSet;
    fbMensAdresKMAN: TFIBIntegerField;
    fbMensAdresKADR: TFIBIntegerField;
    fbMensAdresTN: TFIBIntegerField;
    fbMensAdresNDATA: TFIBDateTimeField;
    fbMensAdresKDATA: TFIBDateTimeField;
    fbMensAdresPKW: TFIBBooleanField;
    fbMensAdresPRIM: TFIBStringField;
    fbMensAdresLSCH: TFIBIntegerField;
    fbMensAdresKZIL: TFIBIntegerField;
    fbMensAdresKW: TFIBIntegerField;
    fbMensAdresDKW: TFIBStringField;
    fbMensAdresOS: TFIBFloatField;
    fbMensAdresZS: TFIBFloatField;
    fbMensAdresPPRIVAT: TFIBBooleanField;
    fbMensAdresKPR: TFIBIntegerField;
    fbMensAdresETAZ: TFIBBooleanField;
    edDebug: TMemo;
    fbSostavSemKOSEM: TFIBIntegerField;
    fbSostavSemTN: TFIBIntegerField;
    fbSostavSemKSEM: TFIBIntegerField;
    fbSostavSemSM: TFIBIntegerField;
    fbSostavSemNSEM: TFIBStringField;
    fbSostavSemPMN: TFIBBooleanField;
    fbAdresDomPUNKT_TYPE: TFIBIntegerField;
    fbAdresDomPUNKT_TIP: TFIBStringField;
    fbAdresDomRAION_TYPE: TFIBIntegerField;
    fbSprSoato: TpFIBDataSet;
    fbSprSoatoKRAON: TFIBIntegerField;
    fbSprSoatoNRAON: TFIBStringField;
    fbSprSoatoKPRAON: TFIBIntegerField;
    fbSprSoatoKCITY: TFIBIntegerField;
    fbSprSoatoPRF: TFIBStringField;
    fbOcheredAdd: TpFIBDataSet;
    fbMensLgotaKSLGOT: TFIBIntegerField;
    fbMensLgotaKLGOTA: TFIBIntegerField;
    fbMensLgotaTN: TFIBIntegerField;
    fbMensLgotaNLGOTA: TFIBStringField;
    fbOcheredAddKOSN: TFIBIntegerField;
    fbOcheredAddTN: TFIBIntegerField;
    fbOcheredAddKOCH: TFIBIntegerField;
    fbOcheredAddKR_P: TFIBIntegerField;
    fbOcheredAddKR_S: TFIBIntegerField;
    fbOcheredAddKPR: TFIBIntegerField;
    fbOcheredAddNMP: TFIBIntegerField;
    fbOcheredAddDATA_Z: TFIBDateTimeField;
    fbOcheredAddDNOW: TFIBDateTimeField;
    fbOcheredAddPRIM: TFIBStringField;
    fbOcheredAddNMPP: TFIBIntegerField;
    fbOcheredAddTIME_Z: TFIBDateTimeField;
    fbOcheredAddKOSNX: TFIBIntegerField;
    fbOcheredAddKOSNY: TFIBIntegerField;
    Button2: TButton;
    pFIBQuery: TpFIBQuery;
    edKodNP: TDBNumberEditEh;
    Label2: TLabel;
    edSocial: TDBNumberEditEh;
    cbLoadAddOch: TCheckBox;
    edKoef: TDBNumberEditEh;
    Label3: TLabel;
    Label4: TLabel;
    fbMensAdresPCOUNT: TFIBIntegerField;
    fbMensAdresKCOUNT: TFIBIntegerField;
    fbMensAdresSCOUNT: TFIBIntegerField;
    cbPrim: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btLoadClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nCount1:Integer;
    FKodVneOch:Integer;
    slLoad:TStringList;
    slAdd:TStringList;
    slPrich:TStringList;
    procedure OpenFB;
    procedure CloseFB;
    function CreateAdres(fbIDMen:Integer; var adr:TAdres; var nInt:Integer):Integer;
    function FindOsnov(sOsnov:String):Integer;
    function IsMyAdres(nKodNP:Integer; sTipUL:String; sUL:String):Boolean;

    procedure LoadONE(nOtd:Integer=0);
    function WriteOneResh(nOch:Integer;nID:Integer; nTip:Integer; var dDate:TDateTime):Integer;
    function WriteDate(fldSource,fldDest:TField):Boolean;

  end;

  procedure LoadKam;

implementation

//uses dBase;

{$R *.dfm}

procedure LoadKam;
var
  f:TfmLoadKam;
begin
  f:=TfmLoadKam.create(nil);
  f.ShowModal;
  f.Free;
end;
//-----------------------------------------------------------
procedure TfmLoadKam.Button3Click(Sender: TObject);
begin
  pFIBDataSet2.Active:=false;
  pFIBDataSet2.SelectSQL.Text:=edSQL.Text;
  pFIBDataSet2.Active:=true;
end;
//-----------------------------------------------------------
procedure TfmLoadKam.Button1Click(Sender: TObject);
begin
  tbView.Active:=false;
  tbView.SelectSQL.Text:='select * from '+tbListTable.Fields[0].AsString;
  tbView.Active:=true;
end;
//-----------------------------------------------------------
procedure TfmLoadKam.OpenFB;
begin
  fbSprOsn.Active:=true;
  fbSprLgot.Active:=true;
  fbSprTypeHouse.Active:=true;
  {$IFDEF OPEN_INTERNAT}
  fbSprInternat.Active:=true;
  {$ENDIF}
  fbSprReshen.Active:=true;
  fbSprOtnosh.Active:=true;
  fbSprSoato.Active:=true;

  fbOchered.Active:=true;
  fbOcheredAdd.Active:=true;
  fbAdresDom.Active:=true;
  fbSostavSem.Active:=true;
  fbMens.Active:=true;
  fbMensLgota.Active:=true;
  fbMensAdres.Active:=true;
end;
//-----------------------------------------------------------
procedure TfmLoadKam.CloseFB;
begin
  fbSprOsn.Active:=false;
  fbSprLgot.Active:=false;
  fbSprTypeHouse.Active:=false;
  {$IFDEF OPEN_INTERNAT}
  fbSprInternat.Active:=false;
  {$ENDIF}

  fbSprReshen.Active:=false;
  fbSprOtnosh.Active:=false;
  fbSprSoato.Active:=false;

  fbOchered.Active:=false;
  fbOcheredAdd.Active:=false;
  fbAdresDom.Active:=false;
  fbSostavSem.Active:=false;
  fbMens.Active:=false;
  fbMensLgota.Active:=false;
  fbMensAdres.Active:=false;
end;

//-----------------------------------------------------------
procedure TfmLoadKam.FormCreate(Sender: TObject);
begin
 slLoad:=TStringList.Create;
 slPrich:=TStringList.Create;
 slAdd:=TStringList.Create;
 pFIBDatabase.Connected:=true;
 tbListTable.Active:=true;
 OpenFB;
end;
//-----------------------------------------------------------
procedure TfmLoadKam.FormDestroy(Sender: TObject);
begin
  slLoad.Free;
  slPrich.Free;
  slAdd.Free;
  CloseFB;
end;
//-----------------------------------------------------------
procedure TfmLoadKam.btLoadClick(Sender: TObject);
var
  nSocialOch,n,nnn,m:Integer;
  lLoad:Boolean;
begin
{
  if not dmBase.SprPrNasel.Locate('NAME','внеочередное',[loCaseInsensitive]) then begin
    dmBase.SprPrNasel.Append;
    dmBase.SprPrNasel.FieldByName('NAME').AsString:='внеочередное';
    dmBase.SprPrNasel.Post;
  end;
  FKodVneOch:=dmBase.SprPrNasel.FieldByName('ID').AsInteger;
  }
  n:=0;
  m:=0;
  nCount1:=0;
  nSocialOch:=edSocial.Value;  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< !!!
  try
    fbOchered.Active:=false;
  except
  end;
  slLoad.Clear;
  slPrich.Clear;
  dmbase.SprPostOch.First;
  while not dmbase.SprPostOch.Eof do begin
    if dmBase.SprPostOch.FieldByName('UKAZ').AsString='563' then
      slPrich.Add(Trim(dmBase.SprPostOch.FieldByName('PUNKT').AsString)+'='+dmBase.SprPostOch.FieldByName('ID').AsString);
    dmbase.SprPostOch.Next;
  end;
  dmbase.SprSnOch.First;
  while not dmbase.SprSnOch.Eof do begin
    if dmBase.SprSnOch.FieldByName('UKAZ').AsString='563' then
      slPrich.Add(Trim(dmBase.SprSnOch.FieldByName('PUNKT').AsString)+'='+dmBase.SprSnOch.FieldByName('ID').AsString);
    dmbase.SprSnOch.Next;
  end;

  fbOchered.Active:=true;
  fbOchered.First;
  nnn:=edKoef.Value;
  while not fbOchered.Eof do begin
    lLoad:=(nnn=0) or (Frac(n/nnn)=0);
    if lLoad then begin
      LoadOne;
      Inc(m,1);
    end;
    fbOchered.Next;
    Inc(n,1);
    Label1.Caption:=IntToStr(n);
    Label4.Caption:=IntToStr(m);
    Application.ProcessMessages;
  end;
  fbOchered.First;

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

end;

//-------------- определим мой город или нет ----------------------------------
function TfmLoadKam.IsMyAdres(nKodNP:Integer; sTipUL:String; sUL:String):Boolean;

begin
  Result:=false;
  sTipUL:=ANSIUpperCase(sTipUL);
  sUL:=ANSIUpperCase(sUL);
  if (sTipUl<>'Г.') and (Copy(sTipUl,1,2)<>'Д.')  and (sTipUl<>'Г.П.') and (sTipUl<>'ГП') then begin
    Result:=true;
    if (Pos('ДЕР.',sUL)>0) or (Pos('ДЕРЕВНЯ',sUL)>0) or (Pos('Г/П',sUL)>0) or (Pos('АГ.',sUL)>0) or
       (Pos('Г.П.',sUL)>0) or (Pos('КРАЙ',sUL)>0)  or (Pos('АГР.',sUL)>0)  or (Pos('АГРОГ',sUL)>0) or
       (Pos(',',sUL)>0)  or (Pos('ШКОЛА',sUL)>0)  or (Pos('РЕБЕНКА',sUL)>0) then begin
      Result:=false;
    end;
  end;
  if Result and (fbAdresDomKNASP.AsInteger<>0) and (nKodNP<>fbAdresDomKNASP.AsInteger) then Result:=false;
end;
//-----------------------------------------------------------
function TfmLoadKam.CreateAdres(fbIDMen:Integer; var adr:TAdres; var nInt:Integer):Integer;
var
  s,sRaion, sObl, sErr, sTipPunkt, sPrim,sPunkt,sDom,sDom1,sDom2,sKorp,sKv,sUl,sTipUl : String;
  nTipUl,nRezid,nKomn, nPunkt, nKodUl, n, nCountZar, nCount, nTypeHouse : Integer;
  nPlosh:Extended;
  lMy:Boolean;
  nAdresID:Integer;
  nKodNP,i:Integer;
begin
  sObl:='';
  Result:=-1;
  nInt:=0;
  nKodNP:=edKodNP.Value;
  if fbMensAdres.Locate('TN', fbIDMen, []) then begin                              // OADRMAN
    lMy:=false;
    sPrim:=fbMensAdresPRIM.AsString;
    nKomn:=fbMensAdresLSCH.AsInteger;        // колич. комнат
    nCountZar:=fbMensAdresPCOUNT.AsInteger;  // колич. зарегистр.
    nCount:=fbMensAdresSCOUNT.AsInteger;     // кол-во в составе семьи
    //----------- интернат ---------------
    {$IFDEF OPEN_INTERNAT}
    n:=fbMensAdresKINT.AsInteger;
    if n>0  then begin
      if fbSprInternat.Locate('KINT', n, []) then begin
        s:=fbSprInternatNINT.AsString;
        if not dmBase.SprPrNasel.Locate('NAME', s, [loCaseInsensitive]) then begin
          dmBase.SprPrNasel.Append;
          dmBase.SprPrNasel.FieldByName('NAME').AsString:=s;
          dmBase.SprPrNasel.Post;
          nInt:=dmBase.SprPrNasel.FieldByName('ID').AsInteger;  // !!!   код интерната в справочнике признаков
        end;
      end;
    end;
    {$ENDIF}
    //---------------------------------------
    n:=fbMensAdresKZIL.AsInteger;            // код проживания

{    1=общежитие   2=служебное   3=специальное   4=социальное   5=коммерческое  6=частный жилфонд  }
    nRezid:=0;
    nTypeHouse:=0;
    if (n>0) and fbSprTypeHouse.Locate('KZIL', n, []) then begin
      s:=AnsiLowerCase(fbSprTypeHouseNZIL.AsString);
      if Copy(s,1,4)='обще' then
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
    sKv:=fbMensAdresKW.AsString+Trim(fbMensAdresDKW.AsString);  // квартира
    nPlosh:=fbMensAdresOS.AsFloat;           // площадь
    //----------------------------
    if not fbMensAdresOS.IsNull and (nPlosh>0)
      then  dmBase.tbOchered.FieldByName('PLOSH_ALL').AsFloat:=nPlosh;
//================
    if nCountZar>0 then dmBase.tbOchered.FieldByName('KOLVO_PROPIS').AsInteger:=nCountZar;
    if nKomn>0     then dmBase.tbOchered.FieldByName('KOLVO_KOMN_PR').AsInteger:=nKomn;
    if nCount>0    then dmBase.tbOchered.FieldByName('KOLVO_SOSTAV').AsInteger:=nCount;

    if nTypeHouse>0   then dmBase.tbOchered.FieldByName('TYPEHOUSE').AsInteger:=nTypeHouse;
    if nRezid>0       then dmBase.tbOchered.FieldByName('RESIDENCE').AsInteger:=nRezid;
    //----------------------------

    nPunkt:=0;   // !!!
    nKodUl:=0;
    if fbAdresDom.Locate('KADR_DOM', fbMensAdresKADR.AsInteger , []) then begin    // OADRES_DOM
      sTipPunkt:=fbAdresDomPUNKT_TIP.AsString+'.';
      sPunkt:=fbAdresDomPUNKT.AsString;
      sTipUl:=fbAdresDomUL_TIP.AsString;
      sUl:=fbAdresDomUL_NAME.AsString;        

      lMy:=IsMyAdres(nKodNP,sTipUl,sUl);

      if lMy then begin //fbAdresDomKNASP.AsInteger=nKodNP then begin //49501000 then begin
        sObl:='Гродненская';
        sRaion:='';
        nPunkt:=1;   // !!!
      end else begin
        if fbAdresDomRAION_TYPE.AsInteger=2 then begin   // район
          sObl:='';
          sRaion:=fbAdresDomRAION.AsString;
          if fbSprSoato.Locate('KRAON', fbAdresDomKRAON.AsInteger, []) then begin
            n:=fbSprSoatoKPRAON.AsInteger;
            if fbSprSoato.Locate('KRAON', n, []) then begin
              if fbSprSoatoKCITY.AsInteger=1 then begin  // обоасть
                sObl:=fbSprSoatoNRAON.AsString;
              end;
            end;
          end;
        end else begin
          sObl:=fbAdresDomRAION.AsString;
          sRaion:='';
        end;
        // если адрес не мой, но нас. пункт проставлен мой
        if (nKodNP=fbAdresDomKNASP.AsInteger) or (fbAdresDomKNASP.AsInteger=0) then begin
          sTipPunkt:=sTipUl;
          sPunkt:=sUL;
          sTipUL:='';
          sUL:='';
        end;
      end;
      if (sUl<>'') and lMy then begin
        nTipUl:=0;
        i:=Pos('пер.',sTipUl);
        if i>0 then begin
          nTipUl:=3;
          s:=Trim(Copy(sTipUl,1,i-1));
          if s='2' then begin
            s:=s+'-ой ';
          end else if s='3' then begin
            s:=s+'-ий ';
          end else begin
            s:=s+'-ый ';
          end;
          if i>1 then sUl:=s+sUl;
          sTipUl:='пер.';
        end;
        if Pos('пер.',sUl)>0 then begin
          nTipUL:=3;
          sTipUl:='пер.';
          sUl:=StringReplace(sUl,'пер.','',[]);
        end;
        if sTipUl='ул' then sTipUl:='ул.';
        if sTipUl=''   then sTipUl:='ул.';
        if nTipUl=0 then begin
          if dmBase.SprTypeUl.Locate('NAME', sTipUl, [loCaseInsensitive]) then begin
            nTipUl:=dmBase.SprTypeUl.FieldByName('ID').AsInteger;
          end;
        end;
        if nTipUl=0 then begin
          if not dmBase.SprUL.Locate('NAME', sUl, [loCaseInsensitive]) then begin
            dmBase.SprUL.Append;
            dmBase.SprUL.FieldByName('NAME').AsString:=sUl;
            dmBase.SprUL.FieldByName('TIP').AsInteger:=1;
            dmBase.SprUL.Post;
          end;
        end else begin
          if not dmBase.SprUL.Locate('NAME;TIP', VarArrayOf([sUl,nTipUl]), []) then begin
            dmBase.SprUL.Append;
            dmBase.SprUL.FieldByName('NAME').AsString:=sUl;
            dmBase.SprUL.FieldByName('TIP').AsInteger:=nTipUl;
            dmBase.SprUL.Post;
          end;
        end;
        nKodUl:=dmBase.SprUl.FieldByName('ID').AsInteger;
      end;
      sDom:=Trim(fbAdresDomDOM.AsString+Trim(fbAdresDomDDOM.AsString));
      RazdNomerDom(sDom, sDom1,sDom2);
      sKorp:=Trim(fbAdresDomKORPUS.AsString);
      if sKorp='0' then sKorp:='';
      if sDom='0'  then sDom:='';
      if sKv='0'  then sKv:='';

      adr.PunktKod:=nPunkt;
      adr.UlicaInt:=nKodUl;
      adr.Dom:=sDom;
      adr.NDom:=sDom;
      adr.Korp:=sKorp;
      adr.Kv:=sKv;
      adr.NotDom:=false;
      adr.NameHouse:='';
      if lMy then begin
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
        adr.Raion:=sRaion;
        adr.Punkt:=Trim(sTipPunkt+' '+sPunkt);
        adr.Ulica:=Trim(sTipUl+' '+sUL);
        s:=dmBase.AdresPropisFromAdres(adr, true);
        if s<>''
          then adr.AdresPropis:=s
      end;
    end;
  end;
end;

//-----------------------------------------------------------
function TfmLoadKam.WriteDate(fldSource,fldDest:TField):Boolean;
begin
  Result:=false;
  if not fldSource.IsNull and (YearOf(fldSource.AsDateTime)<>1111) and (YearOf(fldSource.AsDAteTime)<>2222) then begin
    fldDest.AsDateTime:=fldSource.AsDateTime;
    Result:=true;
  end;
end;

//-----------------------------------------------------------
function TfmLoadKam.WriteOneResh(nOch:Integer;nID:Integer; nTip:Integer; var dDate:TDateTime):Integer;
var
  sNomer,sOsn,sOsnF:String;
  nOsn:Integer;
begin
  Result:=0;
  sNomer:='';
  dDate:=0;
  sOsn:='';
  if nTip=OCH_RESH_POST then begin  // постановка
    if fbOcheredKR_P.AsInteger>0 then begin
      if fbSprReshen.Locate('KR', fbOcheredKR_P.AsInteger,[]) then begin
        sNomer:=fbSprReshenNR.AsString;
        if not fbSprReshenDR.IsNull then dDate:=fbSprReshenDR.AsDateTime;
      end;
    end;
    if fbOcheredKOSNX.AsInteger>0 then begin
      if fbSprOsn.Locate('KOSN', fbOcheredKOSNX.AsInteger, []) then begin
        if fbSprOsnNOSN.AsString=''
          then sOsn:=fbSprOsnNNOSN.AsString
          else sOsn:=fbSprOsnNOSN.AsString;
      end;
    end;
  end else begin   // снятие
    if fbOcheredKR_S.AsInteger>0 then begin
      if fbSprReshen.Locate('KR', fbOcheredKR_S.AsInteger,[]) then begin
        sNomer:=fbSprReshenNR.AsString;
        if not fbSprReshenDR.IsNull then dDate:=fbSprReshenDR.AsDateTime;
      end;
    end;
    if fbOcheredKOSNY.AsInteger>0 then begin
      if fbSprOsn.Locate('KOSN', fbOcheredKOSNY.AsInteger, []) then begin
        if fbSprOsnNOSN.AsString=''
          then sOsn:=fbSprOsnNNOSN.AsString
          else sOsn:=fbSprOsnNOSN.AsString;
        sOsnF:=fbSprOsnNNOSN.AsString;
      end;
    end;
  end;
  if (sNomer='') and (dDate=0) and (sOsn='') then begin
    if nTip=OCH_RESH_POST then begin  // постановка
      edDebug.Lines.Add('ERROR: NOT RESH '+inttostr(fbOcheredTN.AsInteger)); // error
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
      dmBase.tbOcheredResh.FieldByName('ADDINFO').AsString:=sOsn+#13+sOsnF;
    end else begin
      dmBase.tbOcheredResh.FieldByName('OSNOV').AsString:='0';
      dmBase.tbOcheredResh.FieldByName('OSNOV_TEXT').AsString:=sOsn;
      dmBase.tbOcheredResh.FieldByName('ADDINFO').AsString:=sOsnF;
    end;

    if dDate>0
      then dmBase.tbOcheredResh.FieldByName('DATER').AsDateTime:=dDate;
    dmBase.tbOcheredResh.Post;
    Result:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
  end;
end;
//-----------------------------------------------------------
function TfmLoadKam.FindOsnov(sOsnov:String):Integer;
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
//-----------------------------------------------------------
procedure TfmLoadKam.LoadOne(nOtd:Integer);
var
  nAdresID:Integer;
  nInt, nID, nOch, fbID, fbIDs, nIDs, nn,n,i,nGrag, nIDReshPost, nIDReshSn:Integer;
  nH,nM,nS,nmm:Word;
  s,sOtn,sIN,sNomer,sOsn:String;
  adr:TAdres;
  df,dDateP,dDateS:TDateTime;
  lOk, lPr, lNewSem,lSirota : Boolean;
  sBookMark:TBookmarkStr;
begin
  slAdd.Clear;
  fbID:=fbOcheredTN.AsInteger;
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

  if fbMens.Locate('TN', fbID, []) then begin      // найдем человека в FireBird
    nAdresID:=CreateAdres(fbID,adr,nInt);    // если адрес создан, то nAdresID>0, иначе заполнена запись adr:TAdres
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

  if cbPrim.Checked then begin
    s:=Trim(fbOcheredPRIM.AsString);
    i := Q_StrSpn(s,'1234567890.',1);   // первая не цифра
    if (i=0) then begin                 // если все цифры
      //
    end else if (i=1) then begin        // если все не цифры
      s:='';
    end else begin
      s:=Copy(s,1,i-1);
    end;
    i:=Pos('.',s);
    try
      if i=0
        then n:=StrToInt(s)
        else n:=StrToInt(Copy(s,1,i-1));
    except
      n:=0;
    end;
    dmBase.tbOchered.FieldByName('DELO').AsString:=s;
    dmBase.tbOchered.FieldByName('N_DELO').AsInteger:=n;
  end;

  dmBase.tbOchered.FieldByName('OCHERED_PRIM').AsString:=fbOcheredPRIM.AsString;

  if not fbOcheredDATA_Z.IsNull and (YearOf(fbOcheredDATA_Z.AsDateTime)<>1111) and (YearOf(fbOcheredDATA_Z.AsDateTime)<>2222) then begin
    dmBase.tbOchered.FieldByName('DEC_DATE').AsDateTime:=fbOcheredDATA_Z.AsDateTime;
    dmBase.tbOchered.FieldByName('DEC_DATE_REAL').AsDateTime:=fbOcheredDATA_Z.AsDateTime;
  end;
  if not fbOcheredTIME_Z.IsNull then begin
    DecodeTime(fbOcheredTIME_Z.AsDateTime, nH,nM,nS,nmm);
    if nH>0 then begin
      dmBase.tbOchered.FieldByName('DEC_TIME').AsDateTime:=EncodeTime(nH,nM,0,0);
    end;
  end;
  if fbOcheredNMP.AsInteger>0 then
    dmBase.tbOchered.FieldByName('NOMER_OCH').AsInteger:=fbOcheredNMP.AsInteger;
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
  dmBase.tbMens.FieldByName('FAMILIA').AsString:=fbMensFNAME.AsString;
  dmBase.tbMens.FieldByName('NAME').AsString:=fbMensINAME.AsString;
  dmBase.tbMens.FieldByName('OTCH').AsString:=fbMensONAME.AsString;
  WriteDate(fbMensD_ROZ, dmBase.tbMens.FieldByName('DATER') );
  dmBase.tbMens.FieldByName('POL').AsString:=PolFrom(fbMensINAME.AsString, fbMensONAME.AsString);
  sIN:=CheckRus2(fbMensL_NOMER.AsString);
  dmBase.tbMens.FieldByName('LICH_NOMER').AsString:=sIN;
  if sIN<>'' then begin
    if Copy(sIN,12,1)<>'V'
      then nGrag:=MY_GRAG
      else nGrag:=StrToInt(IN_GRAG_STR);
  end else begin
    nGrag:=MY_GRAG;
  end;
  if fbMensN_NOMER.AsString<>'' then begin
    if nGrag=MY_GRAG
      then dmBase.tbMens.FieldByName('PASP_UDOST').AsString:='1'
      else dmBase.tbMens.FieldByName('PASP_UDOST').AsString:='2';
    dmBase.tbMens.FieldByName('PASP_SERIA').AsString:=fbMensS_NOMER.AsString;
    dmBase.tbMens.FieldByName('PASP_NOMER').AsString:=fbMensN_NOMER.AsString;
    dmBase.WriteValueProp('PASP_VIDAN', fbMensK_NOMER.AsString, DF, nID, dmBase.TypeObj_Nasel, ftMemo);
    WriteDate(fbMensD_NOMER, dmBase.tbMens.FieldByName('PASP_DATE'));
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

  if nInt>0 then begin     // запишем в признаки интернат
    dmBase.tbMensPr.Append;
    dmBase.tbMensPr.FieldByName('DATE_FIKS').AsDateTime:=df;
    dmBase.tbMensPr.FieldByName('ID').AsInteger:=nID;
    dmBase.tbMensPr.FieldByName('KOD').AsInteger:=nInt;
    dmBase.tbMensPr.Post;
  end;

  //------- состав семьи ---------------------
  fbSostavSem.Filter:='tn='+inttostr(fbID);
  fbSostavSem.Filtered:=true;
  nN:=1;
  while not fbSostavSem.Eof do begin
    sOtn:=fbSostavSemNSEM.AsString;  // отношение к очереднику
    if MySameText(sOtn,'сама') or MySameText(sOtn,'сам') then begin

    end else begin
      fbIDs:=fbSostavSemSM.AsInteger;
      if fbMens.Locate('TN', fbIDs, []) then begin
        with dmBase.tbSostavSem do begin
          nIDs:=dmBase.GetNewID(_TypeObj_Nasel);
          Append;
          FieldByName('ID').AsInteger:=nID;
          FieldByName('NOMER').AsInteger:=nN;
          nN:=nN+1;
          FieldByName('FAMILIA').AsString:=fbMensFNAME.AsString;
          FieldByName('NAME').AsString:=fbMensINAME.AsString;
          FieldByName('OTCH').AsString:=fbMensONAME.AsString;
          FieldByName('POL').AsString:=PolFrom(fbMensINAME.AsString, fbMensONAME.AsString);
          FieldByName('MEMBER_ID').AsInteger:=nIDs;
          WriteDate(fbMensD_ROZ, FieldByName('DATER'));
          sIN:=CheckRus2(fbMensL_NOMER.AsString);
          FieldByName('LICH_NOMER').AsString:=sIN;
          if sIN<>'' then begin
            if Copy(sIN,12,1)<>'V'
              then nGrag:=MY_GRAG
              else nGrag:=StrToInt(IN_GRAG_STR);
          end else begin
            nGrag:=MY_GRAG;
          end;
          if fbMensN_NOMER.AsString<>'' then begin
            if nGrag=MY_GRAG
              then FieldByName('PASP_UDOST').AsString:='1'
              else FieldByName('PASP_UDOST').AsString:='2';
            FieldByName('PASP_SERIA').AsString:=fbMensS_NOMER.AsString;
            FieldByName('PASP_NOMER').AsString:=fbMensN_NOMER.AsString;
            FieldByName('PASP_VIDAN').AsString:=fbMensK_NOMER.AsString;
            WriteDate(fbMensD_NOMER, FieldByName('PASP_DATE'));
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
    end;
    fbSostavSem.Next;
  end;
  fbSostavSem.Filter:='';
  fbSostavSem.Filtered:=false;
  //----- end состав семьи --------------------------------

  //-- льготы ----------------------------------
  fbMensLgota.Filter:='tn='+IntToStr(fbID);
  fbMensLgota.Filtered:=true;
  while not fbMensLgota.Eof do begin
    if ANSIUpperCase(fbMensLgotaNLGOTA.AsString)='СИРОТА' then begin
      Inc(nCount1,1);
      lSirota:=true;
    end;
    if ANSIUpperCase(fbMensLgotaNLGOTA.AsString)='МОЛОДАЯ СЕМЬЯ' then begin
      lNewSem:=true;
    end;
    if not dmBase.SprLgot.Locate('NAME', fbMensLgotaNLGOTA.AsString, [loCaseInsensitive]) then begin
      dmBase.SprLgot.Append;
      dmBase.SprLgot.FieldByName('NAME').AsString:=fbMensLgotaNLGOTA.AsString;
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
      edDebug.Lines.Add('ERROR ЛЬГОТА FireBird: men='+InttoStr(fbID)+' lgot='+fbMensLgotaNLGOTA.AsString); // error
    end;
    fbMensLgota.Next;
  end;
  fbMensLgota.Filtered:=false;
  fbMensLgota.Filter:='';

  //-- доп. очереди ----------------------------------
  if  cbLoadAddOch.Checked then begin
    fbOcheredAdd.Filter:='tn='+IntToStr(fbID);
    fbOcheredAdd.Filtered:=true;
    while not fbOcheredAdd.Eof do begin
      s:=IntToStr(fbID)+'/'+Inttostr(fbOcheredAddKOCH.AsInteger);
      if slAdd.IndexOf(s)=-1 then begin  // что-бы исключить дублирование
        slAdd.Add(s);
        lOk:=false;
        lPr:=false;
  {
        if fbOcheredAddKOCH.AsInteger=8 then begin    // сирота
          lSirota:=true;
        end else if fbOcheredAddKOCH.AsInteger=1 then begin    // районная (перегрузим в социальную)
          nOch:=2;
          lOk:=true;
        end else begin
          nOch:=fbOcheredAddKOCH.AsInteger;
          dmBase.tbMensPr.Append;
          dmBase.tbMensPr.FieldByName('DATE_FIKS').AsDateTime:=df;
          dmBase.tbMensPr.FieldByName('ID').AsInteger:=nID;
          case nOch of
            2 : dmBase.tbMensPr.FieldByName('KOD').AsInteger:=1; // предприятия
          else
            dmBase.tbMensPr.FieldByName('KOD').AsInteger:=0;
          end;
          dmBase.tbMensPr.Post;
        end;
  }

        if fbOcheredAddKOCH.AsInteger=1 then begin    //  многодетная
          nOch:=1;
          lOk:=true;
        end else if fbOcheredAddKOCH.AsInteger=2 then begin    //  социальное
          nOch:=2;
          lOk:=true;
        end;

        if lOk then begin
          dmBase.tbOchered.Append;                                   //  <-  tbOchered  APPEND
          dmBase.tbOchered.FieldByName('OCHERED_ID').AsInteger:=nOch;
          dmBase.tbOchered.FieldByName('ID_BASE').AsInteger:=0;
          dmBase.tbOchered.FieldByName('ID').AsInteger:=nID;
          dmBase.tbOchered.FieldByName('OTKAZ').AsBoolean:=false;
          dmBase.tbOchered.FieldByName('ISKL').AsBoolean:=false;
          if nOtd>0 then begin
            dmBase.tbOchered.FieldByName('ONLY').AsBoolean:=true
          end else begin
            dmBase.tbOchered.FieldByName('ONLY').AsBoolean:=false;
          end;
          //------- постановка ----------------------
          dmBase.tbOchered.FieldByName('ID_POST_RESH').AsInteger:=WriteOneResh(nOch, nID, OCH_RESH_POST, dDateP);
          //------- снятие ----------------------
          dmBase.tbOchered.FieldByName('ID_SN_RESH').AsInteger:=WriteOneResh(nOch, nID, OCH_RESH_SN, dDateS);
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
          dmBase.tbOchered.FieldByName('OCHERED_PRIM').AsString:=fbOcheredAddPRIM.AsString;

          if not fbOcheredAddDATA_Z.IsNull and (YearOf(fbOcheredAddDATA_Z.AsDateTime)<>1111) and (YearOf(fbOcheredAddDATA_Z.AsDateTime)<>2222) then begin
            dmBase.tbOchered.FieldByName('DEC_DATE').AsDateTime:=fbOcheredAddDATA_Z.AsDateTime;
          end;
          if not fbOcheredAddTIME_Z.IsNull then begin
            DecodeTime(fbOcheredAddTIME_Z.AsDateTime, nH,nM,nS,nmm);
            if nH>0 then begin
              dmBase.tbOchered.FieldByName('DEC_TIME').AsDateTime:=EncodeTime(nH,nM,0,0);
            end;
          end;
          if fbOcheredAddNMP.AsInteger>0 then
            dmBase.tbOchered.FieldByName('NOMER_OCH').AsInteger:=fbOcheredAddNMP.AsInteger;
          //-----------------------
          dmBase.tbOchered.Post;
        end;
      end;

      fbOcheredAdd.Next;
    end;
    fbOcheredAdd.Filtered:=false;
  end;

  if lNewSem or lSirota then begin
    dmBase.tbOchered.BookMark:=sBookMark;
    dmBase.tbOchered.Edit;
    dmBase.tbOchered.FieldByName('NEWSEM').AsBoolean:=lNewSem;
    dmBase.tbOchered.FieldByName('SIROTA').AsBoolean:=lSirota;
    dmBase.tbOchered.Post;
  end;

end;


procedure TfmLoadKam.Button2Click(Sender: TObject);
var
  n:Integer;
begin
  pFIBQuery.ExecQuery;
//  fbAdresDom.First;
  n:=0;
  while not pFIBQuery.Eof do begin
    edDebug.Lines.Add( pFIBQuery.FieldByName('KADR_DOM').AsString );
    pFIBQuery.Next;
    Inc(n,1);
  end;
  ShowMessage(inttostr(n));
//  pFIBQuery.First;
end;

end.
