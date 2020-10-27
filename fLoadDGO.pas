unit fLoadDGO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, adsdata, adsfunc, adstable, adscnnct, ExtCtrls, DBCtrls, FuncPr,
  StdCtrls, Mask, DBCtrlsEh;

type

  TBirth=record
    Nomer:Integer;
    DateZ:TDateTime;
    Svid_Seria:String;
    Svid_Nomer:String;
    Fam:String;
    Name:String;
    Otch:String;
    Pol:String;
    DateR:TDateTime;
    TimeR:TTime;
    Givor:Boolean;
    Schet:Integer;
    TypeRod:Integer;
    Ostat:Integer;
    Dlina:Integer;
    Massa:Integer;
    Sved:Integer;
    Sp_A:Integer;
    Sp_B:Integer;
    Sp_C:TDateTime;
    Sp_D:Integer;
    Sp_E:Integer;
    Sp_F:Integer;
    Sp_G:Integer;
    Sp_H:Integer;
    Sp_I:Integer;
    Sp_J:TDateTime;
    Sp_J_God:String;
    Sp_K:Integer;

    Dok:String;
    Osnov:String;
    Decl:String;
    Svid:String;
    Otmetka:String;
    ON_Pasp:String;
    ONA_Pasp:String;
    Povt:String;
    Izmen:String;

    R_Gosud_:String;
    R_Gosud:Integer;
    R_Obl:String;
    R_Rn:String;
    R_Gorod:String;

    ON_Fam:String;
    ON_Name:String;
    ON_Otch:String;
    ON_Dater:TDateTime;
    ON_R_Gosud_:String;
    ON_R_Gosud:Integer;
    ON_R_Obl:String;
    ON_R_Rn:String;
    ON_R_Gorod:String;
    ON_G_Gosud_:String;
    ON_G_Gosud:Integer;
    ON_G_Obl:String;
    ON_G_Rn:String;
    ON_G_RnGor:String;
    ON_G_Gorod:String;
    ON_G_Ul:String;
    ON_G_Dom:String;
    ON_G_Kv:String;
    ON_G_God:String;

    ON_Nation:Integer;
    ON_NationN:String;
    ON_Citizen:Integer;
    ON_CitizenN:String;
    ON_Work:String;
    ON_Obraz:Integer;

    ONA_Fam:String;
    ONA_Name:String;
    ONA_Otch:String;
    ONA_Dater:TDateTime;
    ONA_R_Gosud_:String;
    ONA_R_Gosud:Integer;
    ONA_R_Obl:String;
    ONA_R_Rn:String;
    ONA_R_Gorod:String;
    ONA_G_Gosud_:String;
    ONA_G_Gosud:Integer;
    ONA_G_Obl:String;
    ONA_G_Rn:String;
    ONA_G_RnGor:String;
    ONA_G_Gorod:String;
    ONA_G_Ul:String;
    ONA_G_Dom:String;
    ONA_G_Kv:String;
    ONA_G_God:String;

    ONA_Nation:Integer;
    ONA_NationN:String;
    ONA_Citizen:Integer;
    ONA_CitizenN:String;
    ONA_Work:String;
    ONA_Obraz:Integer;

  end;
  //----------------------------------------------------------
  TBrak=record
    Nomer:Integer;
    DateZ:TDateTime;
    Svid_Seria:String;
    Svid_Nomer:String;

    Otmetka:String;
    ON_Pasp:String;
    ONA_Pasp:String;
    Povt:String;
    Izmen:String;
    Sost:Integer;
    sDeti:String;
    ON_Fam:String;
    ON_FamP:String;
    ON_Name:String;
    ON_Otch:String;
    ON_Dater:TDateTime;
    ON_R_Gosud_:String;
    ON_R_Gosud:Integer;
    ON_R_Obl:String;
    ON_R_Rn:String;
    ON_R_Gorod:String;
    ON_G_Gosud_:String;
    ON_G_Gosud:Integer;
    ON_G_Obl:String;
    ON_G_Rn:String;
    ON_G_RnGor:String;
    ON_G_Gorod:String;
    ON_G_Ul:String;
    ON_G_Dom:String;
    ON_G_Kv:String;
    ON_G_God:String;

    ON_Nation:Integer;
    ON_NationN:String;
    ON_Citizen:Integer;
    ON_CitizenN:String;
    ON_Work:String;
    ON_Obraz:Integer;
    ON_Sem:Integer;

    ONA_Fam:String;
    ONA_FamP:String;
    ONA_Name:String;
    ONA_Otch:String;
    ONA_Dater:TDateTime;
    ONA_R_Gosud_:String;
    ONA_R_Gosud:Integer;
    ONA_R_Obl:String;
    ONA_R_Rn:String;
    ONA_R_Gorod:String;
    ONA_G_Gosud_:String;
    ONA_G_Gosud:Integer;
    ONA_G_Obl:String;
    ONA_G_Rn:String;
    ONA_G_RnGor:String;
    ONA_G_Gorod:String;
    ONA_G_Ul:String;
    ONA_G_Dom:String;
    ONA_G_Kv:String;
    ONA_G_God:String;

    ONA_Nation:Integer;
    ONA_NationN:String;
    ONA_Citizen:Integer;
    ONA_CitizenN:String;
    ONA_Work:String;
    ONA_Obraz:Integer;
    ONA_Sem:Integer;

  end;

  //----------------------------------------------------------
  TMen_=record
    ok:Boolean;
    Fam:String;
    Name:String;
    Otch:String;
    Dater:TDateTime;
    GosudN:String;
    Gosud:Integer;
    Obl:String;
    Rn:String;
    Gorod:String;
    Pol:String;
    Nation:Integer;
    NationN:String;
    Citizen:Integer;
    CitizenN:String;
  end;
  TAdres_=record
    Gosud:Integer;
    GosudN:String;
    Obl:String;
    Rn:String;
    Gorod:String;
    RnGor:String;
    Ul:String;
  end;

  TfmLoadDGO = class(TForm)
    list: TMemo;
    Label1: TLabel;
    edYear: TDBNumberEditEh;
    edMonth: TDBNumberEditEh;
    Label2: TLabel;
    DataSource1: TDataSource;
    Button1: TButton;
    AdsConnection1: TAdsConnection;
    tb: TAdsTable;
    tbFam: TAdsTable;
    tbSpr: TAdsTable;
    cbR: TCheckBox;
    Label3: TLabel;
    edRec: TDBNumberEditEh;
    Button2: TButton;
    Label4: TLabel;
    edYearE: TDBNumberEditEh;
    Label5: TLabel;
    edMonthE: TDBNumberEditEh;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure edRecChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    rb:TBirth;
    rm:TBrak;
    function readRecordR(nRec:Integer):Boolean;
    procedure ShowRecordR;
    procedure LoadRecordR;
    function readRecordB(nRec:Integer):Boolean;
    procedure ShowRecordB;
    procedure LoadRecordB;
    function readMen(nID:Integer):TMen_;
    function readAdres(nGosud,nObl,nRn,nCity,nCityRn:Integer;nUl:Integer):TAdres_;
    function readWork(nWork,nDolg:Integer):String;
    function CheckTypePunkt(sName:String):String;

  end;

const
  perevod='Н'#13#10;

var
  fmLoadDGO: TfmLoadDGO;

implementation

uses dBase;

{$R *.dfm}

procedure TfmLoadDGO.Button1Click(Sender: TObject);
var
  s,sFld:String;
begin
  tb.Active:=false;
  if cbR.Checked then begin
    s:='RB';
    sFld:='NUMBBR';
  end else begin
    s:='RM';
    sFld:='NUMBMR';
  end;
  tb.TableName:=s+Copy(IntToStr(edYear.Value),3,2)+PadLStr(IntToStr(edMonth.Value),2,'0')+'.DBF';
  tb.Open;
  edRec.MinValue:=tb.FieldByName(sFld).AsInteger;
  tb.Last;
  edRec.MaxValue:=tb.FieldByName(sFld).AsInteger;
  tb.First;
  edRec.Value:=tb.FieldByName(sFld).AsInteger;
  if cbR.Checked then begin
    readRecordR(edRec.Value);
    ShowRecordR;
  end else begin
    readRecordB(edRec.Value);
    ShowRecordB;
  end;
end;

procedure TfmLoadDGO.Button2Click(Sender: TObject);
var
  s,sFile,sFld:String;
  nMaxValue, nMinValue, nRec, nYear, nMonth:Integer;
begin
  tb.Active:=false;
  if cbR.Checked then begin
    s:='RB';
    sFld:='NUMBBR';
  end else begin
    s:='RM';
    sFld:='NUMBMR';
  end;
  nYear:=edYear.Value;
  nMonth:=edMonth.Value;
  list.Clear;
  while (nYear<=edYearE.Value) and  (nMonth<=edMonthE.Value) do begin
    tb.Active:=false;
    list.Lines.Add(IntToStr(nYear)+'  '+IntToStr(nMonth) );
    tb.TableName:=s+Copy(IntToStr(nYear),3,2)+PadLStr(IntToStr(nMonth),2,'0')+'.DBF';
    tb.Open;
    nMinValue:=tb.FieldByName(sFld).AsInteger;
    tb.Last;
    nMaxValue:=tb.FieldByName(sFld).AsInteger;
    for nRec:=nMinValue to nMaxValue do begin
      if cbR.Checked then begin
        readRecordR(nRec);
        if rb.Povt<>'' then
          list.Lines.Add(IntToStr(nRec)+' > '+rb.Povt);
      end else begin
        readRecordB(nRec);
        if rm.Povt<>'' then
          list.Lines.Add(IntToStr(nRec)+' > '+rm.Povt);
      end;
    end;
    Inc(nMonth);
    if nMonth>12 then begin
      nMonth:=1;
      Inc(nYear,1);
    end;
  end;
end;

procedure TfmLoadDGO.FormCreate(Sender: TObject);
begin
  AdsConnection1.IsConnected:=true;
  tbFam.Open;
  tbSpr.Open;
end;

procedure TfmLoadDGO.FormDestroy(Sender: TObject);
begin
  tbFam.Close;
  tbSpr.Close;
  AdsConnection1.IsConnected:=false;
end;
//---------------------------------------------------------------------------
function TfmLoadDGO.readWork(nWork,nDolg:Integer):String;

begin
  Result:='';
  if (nWork>0) and tbSpr.AdsSeek('   10'+PadLStr(inttostr(nWork),5,' '),stHARD)
    then Result:=tbSpr.FieldByName('NAMER').AsString;
  if (nDolg>0) and tbSpr.AdsSeek('   11'+PadLStr(inttostr(nDolg),5,' '),stHARD)
    then if Result='' then Result:=tbSpr.FieldByName('NAMER').AsString
                      else Result:=Result+', '+tbSpr.FieldByName('NAMER').AsString
end;
//---------------------------------------------------------------------------
function TfmLoadDGO.readAdres(nGosud,nObl,nRn,nCity,nCityRn,nUl:Integer):TAdres_;
begin
  if (nGosud>0) and tbSpr.AdsSeek('    1'+PadLStr(inttostr(nGosud),5,' '),stHARD) then begin
    result.Gosud:=tbSpr.FieldByName('ID').AsInteger;
    result.GosudN:=tbSpr.FieldByName('NAMER').AsString;
  end else begin
    result.Gosud:=0;
    result.GosudN:='';
  end;
  if (nObl>0) and tbSpr.AdsSeek('    3'+PadLStr(inttostr(nObl),5,' '),stHARD)
      then result.Obl:=tbSpr.FieldByName('NAMER').AsString
      else result.Obl:='';
  if (nRn>0) and tbSpr.AdsSeek('    4'+PadLStr(inttostr(nRn),5,' '),stHARD)
    then result.Rn:=tbSpr.FieldByName('NAMER').AsString
    else result.Rn:='';
  if (nCity>0) and tbSpr.AdsSeek('    2'+PadLStr(inttostr(nCity),5,' '),stHARD)
    then result.Gorod:=tbSpr.FieldByName('NAMER').AsString
    else result.Gorod:='';
  if (nCityRn>0) and tbSpr.AdsSeek('   20'+PadLStr(inttostr(nCity),5,' '),stHARD)
    then result.RnGor:=tbSpr.FieldByName('NAMER').AsString
    else result.RnGor:='';
  if (nUl>0) and tbSpr.AdsSeek('    9'+PadLStr(inttostr(nUl),5,' '),stHARD)
    then result.Ul:=tbSpr.FieldByName('NAMER').AsString
    else result.Ul:='';
end;
//---------------------------------------------------------------------------
function TfmLoadDGO.readMen(nID:Integer):TMen_;
var
  n:Integer;
  adr:TAdres_;
begin
  result.ok:=false;
  if tbFam.FindKey([nID]) then begin
//  if tbFam.Locate('NUMCARDF',nID, []) then begin
    result.ok:=true;
    result.Fam:=tbFam.FieldByName('FAMILYR').AsString;
    result.Name:=tbFam.FieldByName('NAMER').AsString;
    result.Otch:=tbFam.FieldByName('PATRONR').AsString;
    try
      result.DateR:=tbFam.FieldByName('BIRTHTIME').AsDateTime;
    except
    end;
    if tbFam.FieldByName('SEX').AsString='1'
      then result.Pol:='М'
      else result.Pol:='Ж';
    adr:=readAdres(tbFam.FieldByName('RESIDCOUNT').AsInteger, tbFam.FieldByName('RESIDOBL').AsInteger,
                   tbFam.FieldByName('RESIDPLACE').AsInteger, tbFam.FieldByName('RESIDCITY').AsInteger, 0, 0);
    result.Gosud:=adr.Gosud;
    result.GosudN:=adr.GosudN;
    result.Obl:=adr.Obl;
    result.Rn:=adr.Rn;
    result.Gorod:=adr.Gorod;

    n:=tbFam.FieldByName('NATIONAL').AsInteger;
    if tbSpr.AdsSeek('    5'+PadLStr(inttostr(n),5,' '),stHARD)
      then result.NationN:=tbSpr.FieldByName('NAMER').AsString
      else result.NationN:='';
//    result.Nation:=0;
//    if (result.NationN<>'') and dmBase.SprNac.Locate('NAME',Copy(result.NationN,1,4), [loCaseInsensitive, loPartialKey]) then begin
//      result.Nation:=dmBase.SprNac.FieldByName('ID').AsInteger;
//    end;
    result.Nation:=tbSpr.FieldByName('ID').AsInteger;
    n:=tbFam.FieldByName('CITIZEN').AsInteger;
    if tbSpr.AdsSeek('   19'+PadLStr(inttostr(n),5,' '),stHARD)
      then result.CitizenN:=tbSpr.FieldByName('NAMER').AsString
      else result.CitizenN:='';
    result.Citizen:=tbSpr.FieldByName('ID').AsInteger;

  end;
end;
//----------------------------------------
function TfmLoadDGO.readRecordR(nRec:Integer):Boolean;
var
  m:TMen_;
  n,i,j:Integer;
  adr:TAdres_;
  s:String;
  arr:TArrStrings;
begin
  Result:=false;
  tb.Filter:='NUMBBR='+IntToStr(nRec);
  tb.Filtered:=true;
  if tb.FieldByName('NUMBBR').AsInteger>0 then begin

  Result:=true;
  rb.Nomer:=tb.FieldByName('NUMBBR').AsInteger;
  rb.DateZ:=tb.FieldByName('DATEBR').AsDateTime;

  rb.Svid_Seria:=Trim(tb.FieldByName('SERIA').AsString);
  if rb.Svid_Seria='l-АЛ' then rb.Svid_Seria:='I-АЛ';
  if rb.Svid_Seria='ll-АЛ' then rb.Svid_Seria:='II-АЛ';
  if rb.Svid_Seria='1-АЛ' then rb.Svid_Seria:='I-АЛ';
  if rb.Svid_Seria='11-АЛ' then rb.Svid_Seria:='II-АЛ';

  rb.Svid_Nomer:=PadlStr(tb.FieldByName('NUMBER').AsString,7,'0');

  if tb.FieldByName('BRAK').AsBoolean=true then rb.Sved:=3 else rb.Sved:=1;
  if not tb.FieldByName('TIMBR').IsNUll and (tb.FieldByName('TIMBR').AsInteger>0) then begin
    i:=Trunc(tb.FieldByName('TIMBR').AsFloat);
    j:=Round( Frac(tb.FieldByName('TIMBR').AsFloat)*100);
    try
      rb.TimeR:=EncodeTime(i,j,0,0);
    except
      rb.TimeR:=0;
    end;
  end else begin
    rb.TimeR:=0;
  end;
  if Copy(tb.FieldByName('ALIVE').AsString,1,1)='м' then rb.Givor:=false else rb.Givor:=true;
  rb.TypeRod:=tb.FieldByName('HOWMANYB').AsInteger;
  if tb.FieldByName('COUNTBABY').AsInteger>0 then rb.Schet:=tb.FieldByName('COUNTBABY').AsInteger else rb.Schet:=0;
  if tb.FieldByName('MASBR').AsInteger>0 then rb.Massa:=tb.FieldByName('MASBR').AsInteger else rb.Massa:=0;
  if tb.FieldByName('DLINBR').AsInteger>0 then rb.Dlina:=tb.FieldByName('DLINBR').AsInteger else rb.Dlina:=0;
  rb.Sp_A:=tb.FieldByName('SpecA').AsInteger;
  rb.Sp_B:=tb.FieldByName('SpecB').AsInteger;
  if not tb.FieldByName('SpecC').IsNull then rb.Sp_C:=tb.FieldByName('SpecC').AsDateTime else rb.Sp_C:=0;
  rb.Sp_D:=tb.FieldByName('SpecD').AsInteger;
  rb.Sp_E:=tb.FieldByName('SpecE').AsInteger;
  rb.Sp_F:=tb.FieldByName('SpecF').AsInteger;
  rb.Sp_G:=tb.FieldByName('SpecG').AsInteger;
  rb.Sp_H:=tb.FieldByName('SpecH').AsInteger;
  rb.Sp_I:=tb.FieldByName('SpecI').AsInteger;
  s:=PadLStr(tb.FieldByName('SpecJ').AsString,8,'0');
  if Copy(s,1,1)='0' then begin
    rb.Sp_J_God:=tb.FieldByName('SpecJ').AsString;
  end else begin
    try
      rb.Sp_J:=STOD(copy(s,5,4)+copy(s,3,2)+copy(s,1,2),tdClipper);
    except
      rb.Sp_J_God:=s;
    end
  end;
  rb.Sp_K:=tb.FieldByName('SpecK').AsInteger;

  s:=StringReplace( tb.FieldByName('DATABR').AsString, 'Н'+chr(13)+chr(10), '', [rfReplaceAll]);
  s:=Trim(StringReplace( tb.FieldByName('DATABR').AsString, 'Н'+chr(10), '', [rfReplaceAll]));
  StrToArr(s,arr,'#',false);
  SetLength(arr,7);
  rb.Dok:=DelAllChar(arr[1],chr(13)+Chr(10));
  rb.Osnov:=DelAllChar(arr[2],chr(13)+Chr(10));
  if Pos('заявление матери', ANSILowerCase(rb.Osnov))>0
    then rb.Sved:=3; // !!!
  rb.Decl:=DelAllChar(arr[3],chr(13)+Chr(10));
  rb.Svid:=arr[4];
  rb.Otmetka:=arr[5];
  rb.ON_Pasp:=DelAllChar(arr[6],chr(13)+Chr(10));

  m:=readMen(tb.FieldByName('NUMBBABY').AsInteger);
  if m.ok then begin
    rb.Fam:=m.Fam;
    rb.Name:=m.Name;
    rb.Otch:=m.Otch;
    rb.DateR:=m.Dater;
    rb.R_Gosud_:=m.GosudN;
    rb.R_Gosud:=m.Gosud;
    rb.R_Obl:=m.Obl;
    rb.R_Rn:=m.Rn;
    rb.R_Gorod:=m.Gorod;
    rb.Pol:=m.pol;
  end;
  m:=readMen(tb.FieldByName('NPARENTS').AsInteger);
  if m.ok then begin
    rb.ON_Fam:=m.Fam;
    rb.ON_Name:=m.Name;
    rb.ON_Otch:=m.Otch;
    rb.ON_DateR:=m.Dater;
    rb.ON_R_Gosud_:=m.GosudN;
    rb.ON_R_Gosud:=m.Gosud;
    rb.ON_R_Obl:=m.Obl;
    rb.ON_R_Rn:=m.Rn;
    rb.ON_R_Gorod:=m.Gorod;
    rb.ON_NationN:=m.NationN;
    rb.ON_Nation:=m.Nation;
    rb.ON_CitizenN:=m.CitizenN;
    rb.ON_Citizen:=m.Citizen;
  end;
  adr:=readAdres(tb.FieldByName('RESIDCOUNT').AsInteger, tb.FieldByName('RESIDOBL').AsInteger,
                 tb.FieldByName('RESIDPLACE').AsInteger, tb.FieldByName('RESIDCITY').AsInteger, tb.FieldByName('RESIDCITYP').AsInteger,
                 tb.FieldByName('RESIDSTREE').AsInteger);
  rb.ON_G_Gosud:=adr.Gosud;
  rb.ON_G_Gosud_:=adr.GosudN;
  rb.ON_G_Obl:=adr.Obl;
  rb.ON_G_Rn:=adr.Rn;
  rb.ON_G_Gorod:=adr.Gorod;
  rb.ON_G_RnGor:=adr.RnGor;
  rb.ON_G_Ul:=adr.Ul;
  rb.ON_G_Dom:=tb.FieldByName('RESIDHOME').AsString;
  rb.ON_G_Kv:=tb.FieldByName('RESIDKV').AsString;
  rb.ON_G_God:=tb.FieldByName('TIMCONST').AsString;

  n:=tb.FieldByName('EDUCATION').AsInteger;
  if (n>0) and tbSpr.AdsSeek('    6'+PadLStr(inttostr(n),5,' '),stHARD)
      then rb.ON_Obraz:=tbSpr.FieldByName('ID').AsInteger
      else rb.ON_Obraz:=0;
  rb.ON_Work:=readWork(tb.FieldByName('WHEREWORK').AsInteger, tb.FieldByName('WHOWORK').AsInteger);

  tb.Next;

  if tb.FieldByName('COUNTBABY').AsInteger>0 then rb.Ostat:=tb.FieldByName('COUNTBABY').AsInteger else rb.Ostat:=rb.Schet;

  s:=StringReplace( tb.FieldByName('DATABR').AsString, perevod, '', [rfReplaceAll]);
  StrToArr(s,arr,'#',false);
  SetLength(arr,4);
  rb.ONA_Pasp:=DelAllChar(arr[1],chr(13)+Chr(10));
  rb.Povt:=Trim(arr[2]);
  rb.Izmen:=Trim(arr[3]);
  if Copy(rb.Izmen,1,1)='<' then rb.Izmen:=Copy(rb.Izmen,2,length(rb.Izmen));

  m:=readMen(tb.FieldByName('NPARENTS').AsInteger);
  if m.ok then begin
    rb.ONA_Fam:=m.Fam;
    rb.ONA_Name:=m.Name;
    rb.ONA_Otch:=m.Otch;
    rb.ONA_DateR:=m.Dater;
    rb.ONA_R_Gosud_:=m.GosudN;
    rb.ONA_R_Gosud:=m.Gosud;
    rb.ONA_R_Obl:=m.Obl;
    rb.ONA_R_Rn:=m.Rn;
    rb.ONA_R_Gorod:=m.Gorod;
    rb.ONA_NationN:=m.NationN;
    rb.ONA_Nation:=m.Nation;
    rb.ONA_CitizenN:=m.CitizenN;
    rb.ONA_Citizen:=m.Citizen;
  end;
  adr:=readAdres(tb.FieldByName('RESIDCOUNT').AsInteger, tb.FieldByName('RESIDOBL').AsInteger,
                 tb.FieldByName('RESIDPLACE').AsInteger, tb.FieldByName('RESIDCITY').AsInteger, tb.FieldByName('RESIDCITY').AsInteger,
                 tb.FieldByName('RESIDSTREE').AsInteger);
  rb.ONA_G_Gosud:=adr.Gosud;
  rb.ONA_G_Gosud_:=adr.GosudN;
  rb.ONA_G_Obl:=adr.Obl;
  rb.ONA_G_Rn:=adr.Rn;
  rb.ONA_G_Gorod:=adr.Gorod;
  rb.ONA_G_RnGor:=adr.RnGor;
  rb.ONA_G_Ul:=adr.Ul;
  rb.ONA_G_Dom:=tb.FieldByName('RESIDHOME').AsString;
  rb.ONA_G_Kv:=tb.FieldByName('RESIDKV').AsString;
  rb.ONA_G_God:=tb.FieldByName('TIMCONST').AsString;
  rb.ONA_G_God:=tb.FieldByName('TIMCONST').AsString;

  n:=tb.FieldByName('EDUCATION').AsInteger;
  if (n>0) and tbSpr.AdsSeek('    6'+PadLStr(inttostr(n),5,' '),stHARD)
      then rb.ONA_Obraz:=tbSpr.FieldByName('ID').AsInteger
      else rb.ONA_Obraz:=0;
  rb.ONA_Work:=readWork(tb.FieldByName('WHEREWORK').AsInteger, tb.FieldByName('WHOWORK').AsInteger);

  end;

  tb.Filtered:=false;
//  list.Lines.Add('Номер: '+tb.FieldByName('NUMBBR').AsString);
end;

procedure TfmLoadDGO.ShowRecordR;
var
  s,ss:String;
begin
  list.Clear;
  list.Lines.Add('з/а        № '+inttostr(rb.Nomer)+' от '+DatePropis(rb.DateZ,3));
  list.Lines.Add('свидетельство '+rb.svid_seria+' '+rb.svid_nomer);
  list.Lines.Add('документ   '+rb.Dok);
  if rb.Sved=3  then list.Lines.Add('заявление матери') else list.Lines.Add('брак зарегистрирован');
  list.Lines.Add('основание  '+rb.Osnov);
  list.Lines.Add('заявитель  '+rb.Decl);
  list.Lines.Add('свидетель  '+rb.Svid);
  list.Lines.Add('документ   '+rb.Dok);
  list.Lines.Add('основание  '+rb.Osnov);
  list.Lines.Add('отметка    '+rb.Otmetka);
  list.Lines.Add('изменения  '+rb.Izmen);
  list.Lines.Add('повторное  '+rb.Povt);
  list.Lines.Add('---------------------------------------------------------------------------');
  list.Lines.Add('ребенок:  '+rb.Fam+' '+rb.Name+' '+rb.Otch+'  '+DatePropis(rb.DateR,3)+'  '+formatDateTime('HH:NN', rb.TimeR));
  list.Lines.Add('          '+rb.R_Gosud_+'('+IntToStr(rb.R_Gosud)+')'+', '+rb.R_Obl+', '+rb.R_Rn+',  '+rb.R_Gorod);
  list.Lines.Add('----------------------------------------------------------------------------');
  list.Lines.Add('отец:     '+rb.ON_Fam+' '+rb.ON_Name+' '+rb.ON_Otch+'  '+DatePropis(rb.ON_DateR,3));
  list.Lines.Add(' рождение '+rb.ON_R_Gosud_+'('+IntToStr(rb.ON_R_Gosud)+')'+', '+rb.ON_R_Obl+', '+rb.ON_R_Rn+',  '+rb.ON_R_Gorod);
  list.Lines.Add(' адрес    '+rb.ON_G_Gosud_+'('+IntToStr(rb.ON_G_Gosud)+')'+', '+rb.ON_G_Obl+', '+rb.ON_G_Rn+',  '+rb.ON_G_Gorod+',  '+rb.ON_G_Ul+',  дом '+rb.ON_G_Dom+',  кв '+rb.ON_G_Kv);
  list.Lines.Add(' работа   '+rb.ON_Work);
  list.Lines.Add(' паспорт  '+rb.ON_Pasp);
  s:=IntToStr(rb.ON_Nation);
  if rb.ON_Nation>0 then begin
    dmBase.SprNac.Locate('ID', rb.ON_Nation, []);
    s:=s+' '+dmBase.SprNac.FieldByName('NAME_M').AsString;
  end;
  ss:=IntToStr(rb.ON_Citizen);
  if rb.ON_Citizen>0 then begin
    dmBase.SprStran.Locate('ID', rb.ON_Citizen, []);
    ss:=ss+' '+dmBase.SprStran.FieldByName('GNAME').AsString;
  end;
  list.Lines.Add('          '+rb.ON_NationN+'('+s+'), '+rb.ON_CitizenN+'('+ss+')');
  list.Lines.Add('------------------------------------------------------------------------------');
  list.Lines.Add('мать:     '+rb.ONA_Fam+' '+rb.ONA_Name+' '+rb.ONA_Otch+'  '+DatePropis(rb.ONA_DateR,3));
  list.Lines.Add(' рождение '+rb.ONA_R_Gosud_+'('+IntToStr(rb.ONA_R_Gosud)+')'+', '+rb.ONA_R_Obl+', '+rb.ONA_R_Rn+',  '+rb.ONA_R_Gorod);
  list.Lines.Add(' адрес    '+rb.ONA_G_Gosud_+'('+IntToStr(rb.ONA_G_Gosud)+')'+', '+rb.ONA_G_Obl+', '+rb.ONA_G_Rn+',  '+rb.ONA_G_Gorod+',  '+rb.ONA_G_Ul+',  дом '+rb.ONA_G_Dom+',  кв '+rb.ONA_G_Kv);
  list.Lines.Add(' работа   '+rb.ONA_Work);
  list.Lines.Add(' паспорт  '+rb.ONA_Pasp);
  s:=IntToStr(rb.ONA_Nation);
  if rb.ONA_Nation>0 then begin
    dmBase.SprNac.Locate('ID', rb.ONA_Nation, []);
    s:=s+' '+dmBase.SprNac.FieldByName('NAME_G').AsString;
  end;
  ss:=IntToStr(rb.ONA_Citizen);
  if rb.ONA_Citizen>0 then begin
    dmBase.SprStran.Locate('ID', rb.ONA_Citizen, []);
    ss:=ss+' '+dmBase.SprStran.FieldByName('GNAME').AsString;
  end;
  list.Lines.Add('          '+rb.ONA_NationN+'('+s+'), '+rb.ONA_CitizenN+'('+ss+')');
end;

//================================================================================
//  БРАК
function TfmLoadDGO.readRecordB(nRec:Integer):Boolean;
var
  m:TMen_;
  n,i,j:Integer;
  adr:TAdres_;
  s:String;
  arr:TArrStrings;
  lBrak1,lBrak2:Boolean;
begin
  Result:=false;
  tb.Filter:='NUMBMR='+IntToStr(nRec);
  tb.Filtered:=true;

  if tb.FieldByName('NUMBMR').AsInteger>0 then begin

  Result:=true;
  rm.Nomer:=tb.FieldByName('NUMBMR').AsInteger;
  rm.DateZ:=tb.FieldByName('DATEMR').AsDateTime;

  rm.Svid_Seria:=tb.FieldByName('SERIA').AsString;
  if rm.Svid_Seria='l-АЛ' then rm.Svid_Seria:='I-АЛ';
  if rm.Svid_Seria='ll-АЛ' then rm.Svid_Seria:='II-АЛ';
  if rm.Svid_Seria='1-АЛ' then rm.Svid_Seria:='I-АЛ';
  if rm.Svid_Seria='11-АЛ' then rm.Svid_Seria:='II-АЛ';

  rm.Svid_Nomer:=PadlStr(tb.FieldByName('NUMBER').AsString,7,'0');

  lBrak1:=tb.FieldByName('BRAK').AsBoolean;

  s:=StringReplace( tb.FieldByName('DATAMR').AsString, 'Н'+chr(13)+chr(10), '', [rfReplaceAll]);
  s:=Trim(StringReplace( tb.FieldByName('DATAMR').AsString, 'Н'+chr(10), '', [rfReplaceAll]));
  StrToArr(s,arr,'#',false);
  SetLength(arr,7);
  rm.sDeti:=Trim(DelAllChar(arr[1],chr(13)+Chr(10)));
  rm.ON_Pasp:=Trim(DelAllChar(arr[2],chr(13)+Chr(10)));
  rm.Otmetka:=arr[3];
  rm.Izmen:=arr[4];
  if Copy(rm.Izmen,1,1)='<' then rm.Izmen:=Copy(rm.Izmen,2,length(rm.Izmen));

  m:=readMen(tb.FieldByName('BEFOREF').AsInteger);
  if m.ok then begin
    rm.ON_Fam:=m.Fam;
    rm.ON_Name:=m.Name;
    rm.ON_Otch:=m.Otch;
    rm.ON_DateR:=m.Dater;
    rm.ON_R_Gosud_:=m.GosudN;
    rm.ON_R_Gosud:=m.Gosud;
    rm.ON_R_Obl:=m.Obl;
    rm.ON_R_Rn:=m.Rn;
    rm.ON_R_Gorod:=m.Gorod;
    rm.ON_NationN:=m.NationN;
    rm.ON_Nation:=m.Nation;
    rm.ON_CitizenN:=m.CitizenN;
    rm.ON_Citizen:=m.Citizen;
  end;
  m:=readMen(tb.FieldByName('AFTERF').AsInteger);
  if m.ok then begin
    rm.ON_FamP:=m.Fam;
  end;
  adr:=readAdres(tb.FieldByName('RESIDCOUNT').AsInteger, tb.FieldByName('RESIDOBL').AsInteger,
                 tb.FieldByName('RESIDPLACE').AsInteger, tb.FieldByName('RESIDCITY').AsInteger, tb.FieldByName('RESIDCITYP').AsInteger,
                 tb.FieldByName('RESIDSTREE').AsInteger);
  rm.ON_G_Gosud:=adr.Gosud;
  rm.ON_G_Gosud_:=adr.GosudN;
  rm.ON_G_Obl:=adr.Obl;
  rm.ON_G_Rn:=adr.Rn;
  rm.ON_G_Gorod:=adr.Gorod;
  rm.ON_G_RnGor:=adr.RnGor;
  rm.ON_G_Ul:=adr.Ul;
  rm.ON_G_Dom:=tb.FieldByName('RESIDHOME').AsString;
  rm.ON_G_Kv:=tb.FieldByName('RESIDKV').AsString;
  rm.ON_G_God:=tb.FieldByName('TIMCONST').AsString;

  n:=tb.FieldByName('EDUCATION').AsInteger;
  if (n>0) and tbSpr.AdsSeek('    6'+PadLStr(inttostr(n),5,' '),stHARD)
      then rm.ON_Obraz:=tbSpr.FieldByName('ID').AsInteger
      else rm.ON_Obraz:=0;
  n:=tb.FieldByName('FAMILYSTAT').AsInteger;
  if (n>0) and tbSpr.AdsSeek('    7'+PadLStr(inttostr(n),5,' '),stHARD)
      then rm.ON_Sem:=tbSpr.FieldByName('ID').AsInteger
      else rm.ON_Sem:=0;
  rm.ON_Work:=readWork(tb.FieldByName('WHEREWORK').AsInteger, tb.FieldByName('WHOWORK').AsInteger);


  tb.Next;

  lBrak2:=tb.FieldByName('BRAK').AsBoolean;
  rm.Sost:=0;   // заключен
  if lBrak1 and lBrak2 then begin

  end else if not lBrak1 and lBrak2 then begin
    rm.Sost:=2;  // расторгнут
  end else if not lBrak1 and not lBrak2 then begin
    rm.Sost:=4;  // недействительный
  end;

  s:=StringReplace( tb.FieldByName('DATAMR').AsString, perevod, '', [rfReplaceAll]);
  StrToArr(s,arr,'#',false);
  SetLength(arr,3);
  rm.ONA_Pasp:=DelAllChar(arr[1],chr(13)+Chr(10));
  rm.Povt:=Trim(arr[2]);

  m:=readMen(tb.FieldByName('BEFOREF').AsInteger);
  if m.ok then begin
    rm.ONA_Fam:=m.Fam;
    rm.ONA_Name:=m.Name;
    rm.ONA_Otch:=m.Otch;
    rm.ONA_DateR:=m.Dater;
    rm.ONA_R_Gosud_:=m.GosudN;
    rm.ONA_R_Gosud:=m.Gosud;
    rm.ONA_R_Obl:=m.Obl;
    rm.ONA_R_Rn:=m.Rn;
    rm.ONA_R_Gorod:=m.Gorod;
    rm.ONA_NationN:=m.NationN;
    rm.ONA_Nation:=m.Nation;
    rm.ONA_CitizenN:=m.CitizenN;
    rm.ONA_Citizen:=m.Citizen;
  end;
  m:=readMen(tb.FieldByName('AFTERF').AsInteger);
  if m.ok then begin
    rm.ONA_FamP:=m.Fam;
  end;
  adr:=readAdres(tb.FieldByName('RESIDCOUNT').AsInteger, tb.FieldByName('RESIDOBL').AsInteger,
                 tb.FieldByName('RESIDPLACE').AsInteger, tb.FieldByName('RESIDCITY').AsInteger, tb.FieldByName('RESIDCITY').AsInteger,
                 tb.FieldByName('RESIDSTREE').AsInteger);
  rm.ONA_G_Gosud:=adr.Gosud;
  rm.ONA_G_Gosud_:=adr.GosudN;
  rm.ONA_G_Obl:=adr.Obl;
  rm.ONA_G_Rn:=adr.Rn;
  rm.ONA_G_Gorod:=adr.Gorod;
  rm.ONA_G_RnGor:=adr.RnGor;
  rm.ONA_G_Ul:=adr.Ul;
  rm.ONA_G_Dom:=tb.FieldByName('RESIDHOME').AsString;
  rm.ONA_G_Kv:=tb.FieldByName('RESIDKV').AsString;
  rm.ONA_G_God:=tb.FieldByName('TIMCONST').AsString;

  n:=tb.FieldByName('EDUCATION').AsInteger;
  if (n>0) and tbSpr.AdsSeek('    6'+PadLStr(inttostr(n),5,' '),stHARD)
      then rm.ONA_Obraz:=tbSpr.FieldByName('ID').AsInteger
      else rm.ONA_Obraz:=0;
  n:=tb.FieldByName('FAMILYSTAT').AsInteger;
  if (n>0) and tbSpr.AdsSeek('    7'+PadLStr(inttostr(n),5,' '),stHARD)
      then rm.ONA_Sem:=tbSpr.FieldByName('ID').AsInteger
      else rm.ONA_Sem:=0;
  rm.ONA_Work:=readWork(tb.FieldByName('WHEREWORK').AsInteger, tb.FieldByName('WHOWORK').AsInteger);

  end;

  tb.Filtered:=false;
//  list.Lines.Add('Номер: '+tb.FieldByName('NUMBBR').AsString);
end;

procedure TfmLoadDGO.ShowRecordB;
var
  s:String;
begin
  list.Clear;
  if rm.Sost=2 then begin
    s:='РАСТОРГНУТ'
  end else if  rm.Sost=4 then begin
    s:='ПРИЗНАН НЕДЕЙСТВИТЕЛЬНЫМ'
  end;
  list.Lines.Add('з/а        № '+inttostr(rm.Nomer)+' от '+DatePropis(rm.DateZ,3)+'   '+s);
  list.Lines.Add('отметка    '+rm.Otmetka);
  list.Lines.Add('изменения  '+rm.Izmen);
  list.Lines.Add('повторное  '+rm.Povt);
  list.Lines.Add('----------------------------------------------------------------------------');
  list.Lines.Add('дети       '+rm.sDeti);
  list.Lines.Add('----------------------------------------------------------------------------');
  list.Lines.Add('женимх:   '+rm.ON_Fam+' ('+rm.ON_FamP+') '+rm.ON_Name+' '+rm.ON_Otch+'  '+DatePropis(rm.ON_DateR,3));
  list.Lines.Add(' рождение '+rm.ON_R_Gosud_+'('+IntToStr(rm.ON_R_Gosud)+')'+', '+rm.ON_R_Obl+', '+rm.ON_R_Rn+',  '+rm.ON_R_Gorod);
  list.Lines.Add(' адрес    '+rm.ON_G_Gosud_+'('+IntToStr(rm.ON_G_Gosud)+')'+', '+rm.ON_G_Obl+', '+rm.ON_G_Rn+',  '+rm.ON_G_Gorod+',  '+rm.ON_G_Ul+',  дом '+rm.ON_G_Dom+',  кв '+rm.ON_G_Kv);
  list.Lines.Add(' работа   '+rm.ON_Work);
  list.Lines.Add(' паспорт  '+rm.ON_Pasp);
  list.Lines.Add('          '+rm.ON_NationN+', '+rm.ON_CitizenN+'('+IntToStr(rm.ON_Citizen)+')');
  list.Lines.Add('------------------------------------------------------------------------------');
  list.Lines.Add('невеста:  '+rm.ONA_Fam+' ('+rm.ONA_FamP+') '+rm.ONA_Name+' '+rm.ONA_Otch+'  '+DatePropis(rm.ONA_DateR,3));
  list.Lines.Add(' рождение '+rm.ONA_R_Gosud_+'('+IntToStr(rm.ONA_R_Gosud)+')'+', '+rm.ONA_R_Obl+', '+rm.ONA_R_Rn+',  '+rm.ONA_R_Gorod);
  list.Lines.Add(' адрес    '+rm.ONA_G_Gosud_+'('+IntToStr(rm.ONA_G_Gosud)+')'+', '+rm.ONA_G_Obl+', '+rm.ONA_G_Rn+',  '+rm.ONA_G_Gorod+',  '+rm.ONA_G_Ul+',  дом '+rm.ONA_G_Dom+',  кв '+rm.ONA_G_Kv);
  list.Lines.Add(' работа   '+rm.ONA_Work);
  list.Lines.Add(' паспорт  '+rm.ONA_Pasp);
  list.Lines.Add('          '+rm.ONA_NationN+', '+rm.ONA_CitizenN+'('+IntToStr(rm.ONA_Citizen)+')');
end;

//================================================================================
procedure TfmLoadDGO.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
//  readRecordR;
end;

procedure TfmLoadDGO.edRecChange(Sender: TObject);
begin
  try
    if cbR.Checked then begin
      if readRecordR(edRec.value)
        then showRecordR;
    end else begin
      if readRecordB(edRec.value)
        then showRecordB;
    end;
  except
    list.Clear;
    list.Lines.Add('Error');
  end;
end;
//------------------------------------------------------------------------------
// ЗАГРУЗКА
//------------------------------------------------------------------------------
procedure TfmLoadDGO.Button3Click(Sender: TObject);
var
  s,sFile,sFld:String;
  nMaxValue, nMinValue, nRec, nYear, nMonth:Integer;
begin
  tb.Active:=false;
  if cbR.Checked then begin
    s:='RB';
    sFld:='NUMBBR';
  end else begin
    s:='RM';
    sFld:='NUMBMR';
  end;
  nYear:=edYear.Value;
  nMonth:=edMonth.Value;
  list.Clear;
  while (nYear<=edYearE.Value) and  (nMonth<=edMonthE.Value) do begin
    tb.Active:=false;
    tb.IndexDefs.Clear;
    tb.IndexName:='';

    list.Lines.Add(IntToStr(nYear)+'  '+IntToStr(nMonth) );
    tb.TableName:=s+Copy(IntToStr(nYear),3,2)+PadLStr(IntToStr(nMonth),2,'0')+'.DBF';
    tb.Open;

    tb.AdsOpenIndex(s+Copy(IntToStr(nYear),3,2)+PadLStr(IntToStr(nMonth),2,'0')+'1.NTX');
    tb.IndexDefs.Update;
    tb.IndexName:=s+Copy(IntToStr(nYear),3,2)+PadLStr(IntToStr(nMonth),2,'0')+'1';
    tb.First;
    nMinValue:=tb.FieldByName(sFld).AsInteger;
    tb.Last;
    nMaxValue:=tb.FieldByName(sFld).AsInteger;

    list.Lines.Add(#13#10'-----------------------');
    list.Lines.Add(tb.TableName);
    list.Lines.Add('-----------------------');
    for nRec:=nMinValue to nMaxValue do begin
      if cbR.Checked then begin
        if readRecordR(nRec) then begin
          loadRecordR;
          list.Lines.Add(IntToStr(nRec)+' > з/а № '+inttostr(rb.Nomer)+' от '+DatePropis(rb.DateZ,3));
        end;
      end else begin
        if readRecordB(nRec) then begin
          loadRecordB;
          list.Lines.Add(IntToStr(nRec)+' > з/а № '+inttostr(rm.Nomer)+' от '+DatePropis(rm.DateZ,3));
        end;
      end;
      Application.ProcessMessages;
    end;
    Inc(nMonth);
    if nMonth>12 then begin
      nMonth:=1;
      Inc(nYear,1);
    end;
  end;
end;
//----------------------------------------------------------
function TfmLoadDGO.CheckTypePunkt(sName:String):String;
const
  arr_types:array[0..5] of string=('д.','х.','п.','г.','сан.','с.');
var
  s:String;
  i:Integer;
  lType:Boolean;
begin
  lType:=false;
  s:=Trim(ANSILowerCase(sName));
  for i:=low(arr_types) to high(arr_types) do begin
    if Copy(s,1,length(arr_types[i]))=arr_types[i] then begin
      lType:=true;
      break;
    end;
  end;
  if lType
    then Result:=''
    else Result:='1'; // город
end;
//----------------------------------------------------------
procedure TfmLoadDGO.LoadRecordB;
var
  tb:TAdsTable;
begin
  tb:=dmBase.tbZapisBrak;
  tb.Append;
  tb.FieldByName('PODR').AsInteger:=9;
  tb.FieldByName('ID_ZAGS').AsInteger:=50001;
  tb.FieldByName('ID_SOURCE').AsInteger:=50001;

  tb.FieldByName('NOMER').AsInteger:=rm.Nomer;
  tb.FieldByName('DATEZ').AsDateTime:=rm.DateZ;
  tb.FieldByName('SVID_SERIA').AsString:=rm.Svid_Seria;
  tb.FieldByName('SVID_NOMER').AsString:=rm.Svid_Nomer;
  tb.FieldByName('DATESV').AsDateTime:=rm.DateZ;

  if rm.sDeti<>''
    then tb.FieldByName('DETI').AsString:='#'+rm.sDeti;

  // жених -----------------------------------------------------------------------------
  tb.FieldByName('ON_FAMILIA').AsString:=rm.ON_Fam;
  tb.FieldByName('ON_FAMILIAP').AsString:=rm.ON_FamP;
  tb.FieldByName('ON_NAME').AsString:=rm.ON_Name;
  tb.FieldByName('ON_OTCH').AsString:=rm.ON_Otch;
  tb.FieldByName('ON_DATER').AsDateTime:=rm.ON_Dater;
  if rm.ON_Nation>0  then tb.FieldByName('ON_NATION').AsInteger:=rm.ON_Nation;
  if rm.ON_Citizen>0 then tb.FieldByName('ON_GRAG').AsInteger:=rm.ON_Citizen;

  if rm.ON_R_Gosud>0 then tb.FieldByName('ON_GOSUD').AsInteger:=rm.ON_R_Gosud;
  tb.FieldByName('ON_OBL').AsString:=rm.ON_R_Obl;
  if Pos(' ',rm.ON_R_Obl)=0 then tb.FieldByName('ON_B_OBL').AsString:='1' else tb.FieldByName('ON_B_OBL').AsString:='';
  tb.FieldByName('ON_RAION').AsString:=rm.ON_R_Rn;
  tb.FieldByName('ON_GOROD').AsString:=rm.ON_R_Gorod;
  tb.FieldByName('ON_B_GOROD').AsString:=CheckTypePunkt(rm.ON_R_Gorod);

  tb.FieldByName('ON_WORK').AsString:=rm.ON_Work;
  tb.FieldByName('ON_OBRAZ').AsInteger:=rm.ON_Obraz;

  if rm.ON_G_Gosud>0 then tb.FieldByName('ON_M_GOSUD').AsInteger:=rm.ON_G_Gosud;
  tb.FieldByName('ON_M_OBL').AsString:=rm.ON_G_Obl;
  if Pos(' ',rm.ON_G_Obl)=0 then tb.FieldByName('ON_M_B_OBL').AsString:='1' else tb.FieldByName('ON_M_B_OBL').AsString:='';
  tb.FieldByName('ON_M_RAION').AsString:=rm.ON_G_Rn;
  tb.FieldByName('ON_M_GOROD').AsString:=rm.ON_G_Gorod;
  if (rm.ON_G_Rn='') and (rm.ON_G_RnGor<>'') then begin
    tb.FieldByName('ON_M_B_RN').AsBoolean:=true;
    tb.FieldByName('ON_M_RAION').AsString:=rm.ON_G_RnGor;
  end else begin
    tb.FieldByName('ON_M_B_RN').AsBoolean:=false;
  end;
  tb.FieldByName('ON_M_B_GOROD').AsString:=CheckTypePunkt(rm.ON_G_Gorod);
  tb.FieldByName('ON_M_GOROD_R').AsString:=rm.ON_G_Ul;
  tb.FieldByName('ON_M_DOM').AsString:=rm.ON_G_Dom;
  tb.FieldByName('ON_M_KV').AsString:=rm.ON_G_Kv;

  tb.FieldByName('ON_SEM').AsInteger:=rm.ON_Sem;
  tb.FieldByName('ON_DOKUMENT').AsString:=rm.ON_Pasp;

  // невеста -----------------------------------------------------------------------------
  tb.FieldByName('ONA_FAMILIA').AsString:=rm.ONA_Fam;
  tb.FieldByName('ONA_FAMILIAP').AsString:=rm.ONA_FamP;
  tb.FieldByName('ONA_NAME').AsString:=rm.ONA_Name;
  tb.FieldByName('ONA_OTCH').AsString:=rm.ONA_Otch;
  tb.FieldByName('ONA_DATER').AsDateTime:=rm.ONA_Dater;
  if rm.ONA_Nation>0  then tb.FieldByName('ONA_NATION').AsInteger:=rm.ONA_Nation;
  if rm.ONA_Citizen>0 then tb.FieldByName('ONA_GRAG').AsInteger:=rm.ONA_Citizen;

  if rm.ONA_R_Gosud>0 then tb.FieldByName('ONA_GOSUD').AsInteger:=rm.ONA_R_Gosud;
  tb.FieldByName('ONA_OBL').AsString:=rm.ONA_R_Obl;
  if Pos(' ',rm.ONA_R_Obl)=0 then tb.FieldByName('ONA_B_OBL').AsString:='1' else tb.FieldByName('ONA_B_OBL').AsString:='';
  tb.FieldByName('ONA_RAION').AsString:=rm.ONA_R_Rn;
  tb.FieldByName('ONA_GOROD').AsString:=rm.ONA_R_Gorod;
  tb.FieldByName('ONA_B_GOROD').AsString:=CheckTypePunkt(rm.ONA_R_Gorod);

  tb.FieldByName('ONA_WORK').AsString:=rm.ONA_Work;
  tb.FieldByName('ONA_OBRAZ').AsInteger:=rm.ONA_Obraz;

  if rm.ONA_G_Gosud>0 then tb.FieldByName('ONA_M_GOSUD').AsInteger:=rm.ONA_G_Gosud;
  tb.FieldByName('ONA_M_OBL').AsString:=rm.ONA_G_Obl;
  if Pos(' ',rm.ONA_G_Obl)=0 then tb.FieldByName('ONA_M_B_OBL').AsString:='1' else tb.FieldByName('ONA_M_B_OBL').AsString:='';
  tb.FieldByName('ONA_M_RAION').AsString:=rm.ONA_G_Rn;
  tb.FieldByName('ONA_M_GOROD').AsString:=rm.ONA_G_Gorod;
  if (rm.ONA_G_Rn='') and (rm.ONA_G_RnGor<>'') then begin
    tb.FieldByName('ONA_M_B_RN').AsBoolean:=true;
    tb.FieldByName('ONA_M_RAION').AsString:=rm.ONA_G_RnGor;
  end else begin
    tb.FieldByName('ONA_M_B_RN').AsBoolean:=false;
  end;
  tb.FieldByName('ONA_M_B_GOROD').AsString:=CheckTypePunkt(rm.ONA_G_Gorod);
  tb.FieldByName('ONA_M_GOROD_R').AsString:=rm.ONA_G_Ul;
  tb.FieldByName('ONA_M_DOM').AsString:=rm.ONA_G_Dom;
  tb.FieldByName('ONA_M_KV').AsString:=rm.ONA_G_Kv;

  tb.FieldByName('ONA_SEM').AsInteger:=rm.ONA_Sem;
  tb.FieldByName('ONA_DOKUMENT').AsString:=rm.ONA_Pasp;

  tb.FieldByName('OTMETKA').AsString:=rm.Otmetka;

  tb.Post;

  if rm.Izmen<>'' then
    dmBase.WritePropSimpleDok(dmBase.TypeObj_ZBrak, tb.FieldByName('ID').AsInteger,
                              STOD('1899-12-30',tdAds), 'IZMEN',  nil, rm.Izmen);

end;
//------------------------------------------------------------------------------------
procedure TfmLoadDGO.LoadRecordR;
var
  tb:TAdsTable;
begin
  tb:=dmBase.tbZapisRogd;
  tb.Append;
  tb.FieldByName('PODR').AsInteger:=9;
  tb.FieldByName('ID_ZAGS').AsInteger:=50001;
  tb.FieldByName('ID_SOURCE').AsInteger:=50001;

  tb.FieldByName('NOMER').AsInteger:=rb.Nomer;
  tb.FieldByName('DATEZ').AsDateTime:=rb.DateZ;
  tb.FieldByName('SVID_SERIA').AsString:=rb.Svid_Seria;
  tb.FieldByName('SVID_NOMER').AsString:=rb.Svid_Nomer;
  tb.FieldByName('DATESV').AsDateTime:=rb.DateZ;

  // ребенок -----------------------------------------------------------------------------
  tb.FieldByName('FAMILIA').AsString:=rb.Fam;
  tb.FieldByName('NAME').AsString:=rb.Name;
  tb.FieldByName('OTCH').AsString:=rb.Otch;
  tb.FieldByName('DATER').AsDateTime:=rb.Dater;
  tb.FieldByName('TIMER').AsDateTime:=rb.TimeR;
  tb.FieldByName('POL').AsString:=rb.Pol;

  tb.FieldByName('GIVOROGD').AsBoolean:=rb.Givor;
  tb.FieldByName('TYPEROD').AsInteger:=rb.TypeRod;
  tb.FieldByName('SCHET').AsInteger:=rb.Schet;
  tb.FieldByName('OSTAT').AsInteger:=rb.Ostat;
  if rb.Ostat<>rb.Schet then begin
    ShowMessage(inttostr(rb.nomer)+'  '+datepropis(rb.DateZ,3)+'  '+inttostr(rb.Schet)+'  '+inttostr(rb.Ostat))
  end;
  tb.FieldByName('DLINA').AsInteger:=rb.Dlina;
  tb.FieldByName('MASSA').AsInteger:=rb.Massa;
  if rb.SP_A>0 then tb.FieldByName('SP_A').AsInteger:=rb.SP_A;
  if rb.SP_B>0 then tb.FieldByName('SP_B').AsInteger:=rb.SP_B;
  if rb.SP_C>0 then tb.FieldByName('SP_C').AsDateTime:=rb.SP_C;
  if rb.SP_D>0 then tb.FieldByName('SP_D').AsInteger:=rb.SP_D;
  if rb.SP_E>0 then tb.FieldByName('SP_E').AsInteger:=rb.SP_E;
  if rb.SP_F>0 then tb.FieldByName('SP_F').AsInteger:=rb.SP_F;
  if rb.SP_G>0 then tb.FieldByName('SP_G').AsInteger:=rb.SP_G;
  if rb.SP_H>0 then tb.FieldByName('SP_H').AsInteger:=rb.SP_H;
  if rb.SP_I>0 then tb.FieldByName('SP_I').AsInteger:=rb.SP_I;
  if rb.SP_K>0 then tb.FieldByName('SP_K').AsInteger:=rb.SP_K;
  if (rb.SP_J_GOD='') and (rb.SP_J>0) then begin
    tb.FieldByName('SP_J').AsDateTime:=rb.SP_J;
  end else begin
    tb.FieldByName('SP_J_GOD').AsString:=rb.SP_J_GOD;
  end;

  if rb.R_Gosud>0 then tb.FieldByName('GOSUD').AsInteger:=rb.R_Gosud;
  tb.FieldByName('OBL').AsString:=rb.R_Obl;
  if Pos(' ',rb.R_Obl)=0 then tb.FieldByName('B_OBL').AsString:='1' else tb.FieldByName('B_OBL').AsString:='';
  tb.FieldByName('RAION').AsString:=rb.R_Rn;
  tb.FieldByName('GOROD').AsString:=rb.R_Gorod;
  tb.FieldByName('B_GOROD').AsString:=CheckTypePunkt(rb.R_Gorod);


  // отец -----------------------------------------------------------------------------
  tb.FieldByName('ON_FAMILIA').AsString:=rb.ON_Fam;
  tb.FieldByName('ON_NAME').AsString:=rb.ON_Name;
  tb.FieldByName('ON_OTCH').AsString:=rb.ON_Otch;
  tb.FieldByName('ON_DATER').AsDateTime:=rb.ON_Dater;
  if rb.ON_Nation>0  then tb.FieldByName('ON_NATION').AsInteger:=rb.ON_Nation;
  if rb.ON_Citizen>0 then tb.FieldByName('ON_GRAG').AsInteger:=rb.ON_Citizen;

  if rb.ON_R_Gosud>0 then tb.FieldByName('ON_M_GOSUD').AsInteger:=rb.ON_R_Gosud;
  tb.FieldByName('ON_M_OBL').AsString:=rb.ON_R_Obl;
  if Pos(' ',rb.ON_R_Obl)=0 then tb.FieldByName('ON_M_B_OBL').AsString:='1' else tb.FieldByName('ON_M_B_OBL').AsString:='';
  tb.FieldByName('ON_M_RAION').AsString:=rb.ON_R_Rn;
  tb.FieldByName('ON_M_GOROD').AsString:=rb.ON_R_Gorod;
  tb.FieldByName('ON_M_B_GOROD').AsString:=CheckTypePunkt(rb.ON_R_Gorod);

  tb.FieldByName('ON_WORK').AsString:=rb.ON_Work;
  tb.FieldByName('ON_OBRAZ').AsInteger:=rb.ON_Obraz;

  if rb.ON_G_Gosud>0 then tb.FieldByName('ON_GOSUD').AsInteger:=rb.ON_G_Gosud;
  tb.FieldByName('ON_OBL').AsString:=rb.ON_G_Obl;
  if Pos(' ',rb.ON_G_Obl)=0 then tb.FieldByName('ON_B_OBL').AsString:='1' else tb.FieldByName('ON_B_OBL').AsString:='';
  tb.FieldByName('ON_RAION').AsString:=rb.ON_G_Rn;
  tb.FieldByName('ON_GOROD').AsString:=rb.ON_G_Gorod;
  if (rb.ON_G_Rn='') and (rb.ON_G_RnGor<>'') then begin
    tb.FieldByName('ON_B_RN').AsBoolean:=true;
    tb.FieldByName('ON_RAION').AsString:=rb.ON_G_RnGor;
  end else begin
    tb.FieldByName('ON_B_RN').AsBoolean:=false;
  end;
  tb.FieldByName('ON_B_GOROD').AsString:=CheckTypePunkt(rb.ON_G_Gorod);
  tb.FieldByName('ON_GOROD_R').AsString:=rb.ON_G_Ul;
  tb.FieldByName('ON_DOM').AsString:=rb.ON_G_Dom;
  tb.FieldByName('ON_KV').AsString:=rb.ON_G_Kv;

  tb.FieldByName('ON_DOKUMENT').AsString:=rb.ON_Pasp;

  // мать -----------------------------------------------------------------------------
  tb.FieldByName('ONA_FAMILIA').AsString:=rb.ONA_Fam;
  tb.FieldByName('ONA_NAME').AsString:=rb.ONA_Name;
  tb.FieldByName('ONA_OTCH').AsString:=rb.ONA_Otch;
  tb.FieldByName('ONA_DATER').AsDateTime:=rb.ONA_Dater;
  if rb.ONA_Nation>0  then tb.FieldByName('ONA_NATION').AsInteger:=rb.ONA_Nation;
  if rb.ONA_Citizen>0 then tb.FieldByName('ONA_GRAG').AsInteger:=rb.ONA_Citizen;

  if rb.ONA_R_Gosud>0 then tb.FieldByName('ONA_M_GOSUD').AsInteger:=rb.ONA_R_Gosud;
  tb.FieldByName('ONA_M_OBL').AsString:=rb.ONA_R_Obl;
  if Pos(' ',rb.ONA_R_Obl)=0 then tb.FieldByName('ONA_M_B_OBL').AsString:='1' else tb.FieldByName('ONA_M_B_OBL').AsString:='';
  tb.FieldByName('ONA_M_RAION').AsString:=rb.ONA_R_Rn;
  tb.FieldByName('ONA_M_GOROD').AsString:=rb.ONA_R_Gorod;
  tb.FieldByName('ONA_M_B_GOROD').AsString:=CheckTypePunkt(rb.ONA_R_Gorod);

  tb.FieldByName('ONA_WORK').AsString:=rb.ONA_Work;
  tb.FieldByName('ONA_OBRAZ').AsInteger:=rb.ONA_Obraz;

  if rb.ONA_G_Gosud>0 then tb.FieldByName('ONA_GOSUD').AsInteger:=rb.ONA_G_Gosud;
  tb.FieldByName('ONA_OBL').AsString:=rb.ONA_G_Obl;
  if Pos(' ',rb.ONA_G_Obl)=0 then tb.FieldByName('ONA_B_OBL').AsString:='1' else tb.FieldByName('ONA_B_OBL').AsString:='';
  tb.FieldByName('ONA_RAION').AsString:=rb.ONA_G_Rn;
  tb.FieldByName('ONA_GOROD').AsString:=rb.ONA_G_Gorod;
  if (rb.ONA_G_Rn='') and (rb.ONA_G_RnGor<>'') then begin
    tb.FieldByName('ONA_B_RN').AsBoolean:=true;
    tb.FieldByName('ONA_RAION').AsString:=rb.ONA_G_RnGor;
  end else begin
    tb.FieldByName('ONA_B_RN').AsBoolean:=false;
  end;
  tb.FieldByName('ONA_B_GOROD').AsString:=CheckTypePunkt(rb.ONA_G_Gorod);
  tb.FieldByName('ONA_GOROD_R').AsString:=rb.ONA_G_Ul;
  tb.FieldByName('ONA_DOM').AsString:=rb.ONA_G_Dom;
  tb.FieldByName('ONA_KV').AsString:=rb.ONA_G_Kv;

  tb.FieldByName('ONA_DOKUMENT').AsString:=rb.ONA_Pasp;

  tb.FieldByName('OTMETKA').AsString:=rb.Otmetka;
  tb.FieldByName('DOKUMENT').AsString:=rb.Dok;
  tb.FieldByName('DECL').AsString:=rb.Decl;
  tb.FieldByName('SVED').AsInteger:=rb.Sved;
  tb.FieldByName('SVED_SVID').AsString:=rb.Osnov;
  tb.FieldByName('ON_SVID').AsString:=rb.Svid;

  tb.FieldByName('OTMETKA').AsString:=rb.Otmetka;

  tb.Post;

  if rb.Izmen<>'' then
    dmBase.WritePropSimpleDok(dmBase.TypeObj_ZRogd, tb.FieldByName('ID').AsInteger,
                              STOD('1899-12-30',tdAds), 'IZMEN',  nil, rb.Izmen);
end;

procedure TfmLoadDGO.Button4Click(Sender: TObject);
var
  ss,s,sFile,sFld:String;
  nn,nCount1,nCount, nMaxValue, nMinValue, nRec, nYear, nMonth:Integer;
begin
  tb.Active:=false;
  if cbR.Checked then begin
    s:='RB';
    sFld:='NUMBBR';
  end else begin
    s:='RM';
    sFld:='NUMBMR';
  end;
  nYear:=edYear.Value;
  nMonth:=edMonth.Value;
  list.Clear;
  nCount:=0;
  nCount1:=0;
  while (nYear<=edYearE.Value) and  (nMonth<=edMonthE.Value) do begin
    tb.Active:=false;
    tb.IndexDefs.Clear;
    tb.IndexName:='';

    tb.TableName:=s+Copy(IntToStr(nYear),3,2)+PadLStr(IntToStr(nMonth),2,'0')+'.DBF';
    tb.Open;

    tb.AdsOpenIndex(s+Copy(IntToStr(nYear),3,2)+PadLStr(IntToStr(nMonth),2,'0')+'1.NTX');
    tb.IndexDefs.Update;
    tb.IndexName:=s+Copy(IntToStr(nYear),3,2)+PadLStr(IntToStr(nMonth),2,'0')+'1';
    tb.First;
    nMinValue:=tb.FieldByName(sFld).AsInteger;
    nn:=-1;
    while not tb.Eof do begin
      if nn<>tb.FieldByName(sFld).AsInteger then begin
        nCount1:=nCount1+1;
        nn:=tb.FieldByName(sFld).AsInteger;
      end;
      tb.Next;
    end;

    tb.Last;
    nMaxValue:=tb.FieldByName(sFld).AsInteger;
    nCount:=nCount+Trunc(tb.RecordCount/2);
    Application.ProcessMessages;
    list.Lines.Add(IntToStr(nYear)+'  '+IntToStr(nMonth)+'     '+IntToStr(nCount)+'     '+IntToStr(nCount1) );
    Inc(nMonth);
    if nMonth>12 then begin
      nMonth:=1;
      Inc(nYear,1);
    end;
  end;
  list.Lines.Add('Всего  '+IntToStr(nCount)+'  '+IntToStr(nCount1) );
end;

end.
