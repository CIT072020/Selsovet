unit fLoadPinsk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uProject, uProjectAll,
  Dialogs, DB, adsdata, adsfunc, adstable, adscnnct, StdCtrls, Mask, funcPr, QStrings, uCheckKod,
  DBCtrlsEh, Grids, DBGridEh, ExtCtrls, ComCtrls;

type
  TfmLoadPinsk = class(TForm)
    connectPinsk: TAdsConnection;
    Kart: TAdsTable;
    KartSem: TAdsTable;
    Label1: TLabel;
    PageControl1: TPageControl;
    tsDebug: TTabSheet;
    tsBasa: TTabSheet;
    edDebug: TMemo;
    Panel1: TPanel;
    Label2: TLabel;
    edConnect: TDBEditEh;
    Button1: TButton;
    Button2: TButton;
    cbAll: TCheckBox;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    cbDeleted: TCheckBox;
    Panel3: TPanel;
    Label3: TLabel;
    Splitter1: TSplitter;
    DBGridEh3: TDBGridEh;
    DataSource3: TDataSource;
    KartLgot: TAdsTable;
    Label4: TLabel;
    SprOsnov: TAdsTable;
    SprTypeHouse: TAdsTable;
    tbConst: TAdsTable;
    edDate: TDBDateTimeEditEh;
    DBGridEh4: TDBGridEh;
    DataSource4: TDataSource;
    Button3: TButton;
    Label5: TLabel;
    DBGridEh5: TDBGridEh;
    SemLgot: TAdsTable;
    DataSource5: TDataSource;
    cbFilter: TDBCheckBoxEh;
    Label6: TLabel;
    Label7: TLabel;
    SprLgot: TAdsTable;
    KartA: TAdsTable;
    KartASem: TAdsTable;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    TabSheet1: TTabSheet;
    DBGridEh6: TDBGridEh;
    DBGridEh7: TDBGridEh;
    cbOsn: TCheckBox;
    Button4: TButton;
    SprGSK: TAdsTable;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure cbDeletedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure KartAfterScroll(DataSet: TDataSet);
    procedure cbFilterClick(Sender: TObject);
    procedure DBGridEh5Columns11GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FCount:Integer;
    FList:TStringList;
    procedure LoadOne;
    procedure LoadOneA;
    procedure FilterLgot;
    function CreateAdres(nIDMen:Integer; sAdres:String):Integer;
  end;

  procedure LoadPinsk;

implementation

uses fMain, dBase;

{$R *.dfm}

procedure LoadPinsk;
var
  fmLoadPinsk: TfmLoadPinsk;
begin
  fmLoadPinsk:=TfmLoadPinsk.Create(nil);
  try
    fmLoadPinsk.ShowModal;
  finally
    fmLoadPinsk.Free;
  end;
end;

procedure TfmLoadPinsk.Button1Click(Sender: TObject);
begin
  connectPinsk.ConnectPath:=edConnect.Text;
  connectPinsk.IsConnected:=true;
  Kart.Active:=true;
  KartSem.Active:=true;
  KartLgot.Active:=true;
  KartA.Active:=true;
  KartASem.Active:=true;

  SemLgot.Active:=true;
  SprOsnov.Active:=true;
  SprLgot.Active:=true;
  SprTypeHouse.Active:=true;
  tbConst.Active:=true;
end;

procedure TfmLoadPinsk.FormDestroy(Sender: TObject);
begin
  Kart.Active:=false;
  KartSem.Active:=false;
  KartLgot.Active:=false;
  KartA.Active:=false;
  KartASem.Active:=false;
  SemLgot.Active:=false;
  SprOsnov.Active:=false;
  SprLgot.Active:=false;
  SprTypeHouse.Active:=false;
  tbConst.Active:=false;
  connectPinsk.IsConnected:=false;
end;


procedure TfmLoadPinsk.Button2Click(Sender: TObject);
var
  n,i:Integer;
  lAll:Boolean;
begin
// выполнить запрос на удаление  ' " МОДУЛЬ
  Kart.First;
  n:=1;
  FCount:=0;
  FList:=TStringList.Create;
  lAll:=cbAll.Checked;
  dmBase.SprUL.IndexFieldNames:='NAME;TIP';
  tbConst.Filter:='alltrim(id)=''1Z'' and STOD('+QStr(DTOS(edDate.Value,tdClipper))+')=date';
  tbConst.Filtered:=true;
  tbConst.DisableControls;
  while not tbConst.Eof do begin
    FList.Add(Trim(tbConst.FieldByName('OBJID').AsString)+'='+Trim(tbConst.FieldByName('VALUE').AsString));
    tbConst.Next;
  end;
//  FList.SaveToFile('zzz');
  tbConst.Filtered:=false;
//  exit;
  kart.DisableControls;
  KartSem.DisableControls;
  KartLgot.DisableControls;
  kartA.DisableControls;
  KartASem.DisableControls;
  SemLgot.DisableControls;

  if cbOsn.Checked then begin
    while not Kart.Eof do begin
      if (Kart.fieldbyName('SP36').AsString<>'') and (Kart.fieldbyName('ISMARK').AsString<>'*') then begin
        LoadOne;
      end;
      Label2.Caption:=IntToStr(n);
      Application.ProcessMessages;
      n:=n+1;
      Kart.Next;
    end;
  end;
//  i:=0;
  if cbAll.Checked then begin
    while not KartA.Eof do begin
      if (KartA.fieldbyName('SP116').AsString<>'') and (KartA.fieldbyName('ISMARK').AsString<>'*') then begin
        LoadOneA;
      end;
      Label2.Caption:=IntToStr(n);
      Application.ProcessMessages;
      n:=n+1;
      KartA.Next;
//      inc(i,1);
//      if i>2000 then break;
    end;
  end;
  SemLgot.EnableControls;
  kart.EnableControls;
  KartSem.EnableControls;
  KartLgot.EnableControls;
  kartA.EnableControls;
  KartASem.EnableControls;
  tbConst.EnableControls;
  Kart.First;
  FList.Free;
  Label2.Caption:=Label2.Caption+' OK!';
  Application.ProcessMessages;
end;

const
 K_DELO='SP274';   //	(P)НомерДела
 K_FAM='SP36';    //	(P)Фамилия
 K_NAME='SP37';    //	(P)Имя
 K_OTCH='SP38';    //	(P)Отчество
 K_ADRES='SP39';    //	(P)Адрес
 K_PRIN='SP40';    //	(P)ПринадлежностьЖил
 K_GSK='SP45';    //	(P)ЖСК
 K_OSNOV='SP63';    //	(P)ОснованиеПостанов
 K_DATEP='SP41';    //	(P)ДатаПостановкиНаУ
 K_NOMERZ='SP42';    //	(P)РегНомерЗаявления
 K_DATER='SP43';    //	(P)ДатаРешения
 K_NOMERR='SP44';    //	(P)НомерРешения
 K_KOLSEM='SP46';    //	(P)Семья  (количество человек)
 K_KOLPROG='SP47';    //	(P)Проживает        (количество человек)
 K_KOMN='SP48';    //	(P)ПотребностьВЖилье  (количество комнат)
 K_PLOSH_ALL='SP49';    //	(P)ОбщаяПлощадь
 K_PLOSH_GIL='SP50';    //	(P)ЖилаяПлощадь
 K_KOL_KOMN='SP51';    //	(P)КоличествоКомнат
 K_BLAG='SP52';    //	(P)Благоустройство
 K_SAN='SP53';   	//(P)Сантехсостояние
 K_SUBS='SP186';   //	(P)Субсидия
 K_KREDIT='SP187';   //	(P)Кредит
 K_MALO='SP188';   //	(P)Малообеспечен
 K_OBCH='SP219';   //	(P)Общежитие
 K_OBCH_DATE='SP220';   //	(P)ДатаОбщежития

 S_FAM='SP72';    //  	(P)Фамилия
 S_NAME='SP73';    //  	(P)Имя
 S_OTCH='SP74';    //  	(P)Отчество
 S_IN='SP275';   //  	(P)ЛичныйНомер
 S_OTNOSH='SP87';    //  	(P)Родство
 S_POL='SP103';   //  	(P)Пол
 S_YEAR='SP88';    //  	(P)ГодРождения
 S_DATE='SP170';   //  	(P)ДатаРождения
 S_MOL='SP90';    //  	(P)МолодаяСемья
 S_DATE_MOL='SP91';    //  	(P)ДатаПостановкиМол
 S_MALO='SP221';   //  	(P)Малообеспечен

const
  My_Otn=';муж;жена;дочь;сын;мать;отец;брат;сестра;племянник;племянница;бабушка;дедушка;свекровь;свекор;теща;тесть;дядя;тетя;невестка;зять;внук;внучка;';

procedure TfmLoadPinsk.LoadOne;
var
  i,n,nID,nID2,nAdresID,nKod,NN,nKod2:Integer;
  sID1C,s,ss,sSocial,sFIO,sFIOD,sFilter,sNomerSirota,sLichNomer:String;
  arr:TArrStrings;
  dDec,dDateR,DateFiks,dDateDec,dDecSirota,dReshSirota:TDateTime;
  lFIO,lIskl,lMolod,lSirota,lSeek:Boolean;
begin
  sID1C:=Kart.fieldbyName('ID').AsString;
  nID:=dmBase.GetNewID(_TypeObj_Nasel);
  nAdresID:=CreateAdres(nID, Kart.fieldbyName(K_ADRES).AsString);

  lFIO:=false;
  sFIO:=ANSIUpperCase(Kart.fieldbyName(K_FAM).AsString+Kart.fieldbyName(K_NAME).AsString+Kart.fieldbyName(K_OTCH).AsString);
  sFIOD:=Kart.fieldbyName(K_FAM).AsString+' '+Kart.fieldbyName(K_NAME).AsString+' '+Kart.fieldbyName(K_OTCH).AsString;
  sLichNomer:='';
  dDateR:=0;
  try

 // if sFIO='ШПАКОВСКАЯЕВГЕНИЯЯКОВЛЕВНА' then begin
//    ShowMessage(sFIOD);
//  end;
  KartSem.SetRange([sID1C],[sID1C]);   //см. MasterSource
  nN:=1;
  lMolod:=false;  // молодая семья
  sFilter:=';'+sID1C+';';
  lSeek:=false;
  while not KartSem.Eof do begin
    s:=Trim(KartSem.FieldByName(S_FAM).AsString);
    if (s<>'') and (KartSem.FieldByName('ISMARK').AsString<>'*') then begin
      sFilter:=sFilter+Trim(KartSem.FieldByName('ID').AsString)+';';  // для фильтрации льгот
      if Trim(KartSem.FieldByName(S_MOL).AsString)='2M'
        then lMolod:=true;
      if sFIO=ANSIUpperCase(KartSem.fieldbyName(S_FAM).AsString+KartSem.fieldbyName(S_NAME).AsString+KartSem.fieldbyName(S_OTCH).AsString) then begin
        lSeek:=true;
        // типа хозяин очереди
          sLichNomer:=CheckLichNom(true, kartSem.FieldByName(S_IN).AsString);
          if KartSem.fieldbyName(S_DATE).AsString<>'' then begin
            dDateR:=KartSem.FieldbyName(S_DATE).AsDateTime;
          end else if KartSem.fieldbyName(S_YEAR).AsInteger>0 then begin
            try
              dDateR:=STOD(trim(KartSem.fieldbyName(S_YEAR).AsString)+'0101',tdClipper);
            except
              if not lFIO then begin edDebug.Lines.Add(sFIOD); lFIO:=true end;
              edDebug.Lines.Add(sID1C+':  Год Рождения='+KartSem.fieldbyName(S_YEAR).AsString);
            end;
          end;
      end else begin

        with dmBase.tbSostavSem do begin
          Append;
          FieldByName('ID').AsInteger:=nID;
          FieldByName('NOMER').AsInteger:=nN;
          nN:=nN+1;
          FieldByName('FAMILIA').AsString:=kartSem.FieldByName(S_FAM).AsString;
          FieldByName('NAME').AsString:=kartSem.FieldByName(S_NAME).AsString;
          FieldByName('OTCH').AsString:=kartSem.FieldByName(S_OTCH).AsString;
          FieldByName('LICH_NOMER').AsString:=CheckLichNom(true, kartSem.FieldByName(S_IN).AsString);
          if Trim(kartSem.FieldByName(S_POL).AsString)='2Y'
            then FieldByName('POL').AsString:='Ж'
            else FieldByName('POL').AsString:='М';

          nID2:=dmBase.GetNewID(_TypeObj_Nasel);
          FieldByName('MEMBER_ID').AsInteger:=nID2;
          if KartSem.fieldbyName(S_DATE).AsString<>'' then begin
            FieldByName('DATER').AsDateTime:=KartSem.FieldbyName(S_DATE).AsDateTime;
          end else if KartSem.fieldbyName(S_YEAR).AsInteger>0 then begin
            try
              FieldByName('DATER').AsDateTime:=STOD(trim(KartSem.fieldbyName(S_YEAR).AsString)+'0101',tdClipper);
            except
              if not lFIO then begin edDebug.Lines.Add(sFIOD); lFIO:=true end;
              edDebug.Lines.Add(sID1C+':  Год Рождения='+KartSem.fieldbyName(S_YEAR).AsString);
              FieldByName('DATER').AsString:='';
            end;
          end;
          s:=ansilowercase(trim(KartSem.FieldByName(S_OTNOSH).AsString));
          nKod:=0;
          if (s<>'') and (Pos(';'+s+';',My_Otn)>0) then begin
            if not dmBase.SprOtnosh.Locate('NAME', s,[loCaseInsensitive]) then begin
              dmBase.sprOtnosh.Append;
              dmBase.SprOtnosh.FieldByName('NAME').AsString:=s;
              dmBase.SprOtnosh.Post;
            end;
            nKod:=dmBase.SprOtnosh.FieldByName('ID').AsInteger;
          end;
          if nKod>0 then begin
            FieldByName('OTNOSH').AsInteger:=nKod;
          end;
          Post;
    //-------------------------------------------------------------------------
          dmBase.tbMens.Append;
          dmBase.tbMens.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
          dmBase.tbMens.FieldByName('ID').AsInteger:=nID2;
          dmBase.tbMens.FieldByName('OCHERED').AsBoolean:=false;
          dmBase.tbMens.FieldByName('FAMILIA').AsString:=FieldByName('FAMILIA').AsString;
          dmBase.tbMens.FieldByName('NAME').AsString:=FieldByName('NAME').AsString;
          dmBase.tbMens.FieldByName('OTCH').AsString:=FieldByName('OTCH').AsString;
          dmBase.tbMens.FieldByName('OTNOSH').AsString:=FieldByName('OTNOSH').AsString;
          dmBase.tbMens.FieldByName('POL').AsString:=FieldByName('POL').AsString;
          dmBase.tbMens.FieldByName('LICH_NOMER').AsString:=FieldByName('LICH_NOMER').AsString;
          dmBase.tbMens.FieldByName('CITIZEN').AsInteger:=112;
          if nAdresID>0
            then dmBase.tbMens.FieldByName('ADRES_ID').AsInteger:=nAdresID;
          if not FieldByName('DATER').IsNull
            then dmBase.tbMens.FieldByName('DATER').Value:=FieldByName('DATER').Value;
          dmBase.tbMens.Post;
    //-------------------------------------------------------------------------
        end;
      end;
    end;
    KartSem.Next;
  end;

  if not lSeek then begin
    edDebug.Lines.Add('НЕ НАЙДЕН ГЛАВА '+sFIOD);
  end;

  SemLgot.Filter:='';
  FilterLgot;

  KartSem.CancelRange;

  with dmBase.tbMens do begin
    Append;
    FieldByName('OCHERED').AsBoolean:=true;
    FieldByName('FAMILIA').AsString:=Kart.FieldByName(K_FAM).AsString;
    FieldByName('NAME').AsString:=Kart.FieldByName(K_NAME).AsString;
    FieldByName('OTCH').AsString:=Kart.FieldByName(K_OTCH).AsString;
    FieldByName('LICH_NOMER').AsString:=sLichNomer;
    if dDateR>0 then FieldByName('DATER').AsDateTime:=dDateR;
    FieldByName('ID').AsInteger:=nID;
    DateFiks:=STOD('1899-12-30',tdAds);
    FieldByName('DATE_FIKS').AsDateTime:=DateFiks;
    FieldByName('PROPIS').AsBoolean:=true;
    FieldByName('PRESENT').AsBoolean:=true;
    FieldByName('CANDELETE').AsBoolean:=false;
    FieldByName('POL').AsString:=PolFrom(Kart.FieldByName(K_NAME).AsString, Kart.FieldByName(K_OTCH).AsString);
    FieldByName('OTNOSH').AsString:='';
    FieldByName('LIC_ID').AsString:='0';
    FieldByName('ADRES_ID').AsInteger:=nAdresID;
    FieldByName('CITIZEN').AsInteger:=MY_GRAG;

    Post;
  end;
  //-------------------------
  lSirota:=false;
  while not SemLgot.Eof do begin
    if SemLgot.FieldByName('ISMARK').AsString<>'*' then begin
      s:=Trim(SemLgot.FieldByName('SP223').AsString);   // ID льготы
      if s='O' then begin
        lSirota:=true;
        {SP224-(P)ДатаПостановкиНаУ  SP225-(P)РегНомерЗаявления  SP226-(P)ДатаРешения  SP227-(P)НомерРешения}
        if SemLgot.FieldByName('SP224').IsNull then dDecSirota:=0  else dDecSirota:=SemLgot.FieldByName('SP224').AsDateTime;
        if SemLgot.FieldByName('SP226').IsNull then dReshSirota:=0 else dReshSirota:=SemLgot.FieldByName('SP226').AsDateTime;
        sNomerSirota:=SemLgot.FieldByName('SP227').AsString;
      end else begin
        if SprLgot.FindKey([SemLgot.FieldByName('SP223').AsString]) then begin
          ss:=SprLgot.FieldByName('SP18').AsString;
          if not dmBase.SprLgot.Locate('NAME', ss, [loCaseInsensitive]) then begin
            dmBase.SprLgot.Append;
            dmBase.SprLgot.FieldByName('NAME').AsString:=ss;
            dmBase.SprLgot.Post;
          end;
          nKod:=dmBase.SprLgot.FieldByName('ID').AsInteger;
          try
            dmbase.tbMensLgot.Append;
            dmbase.tbMensLgot.FieldByName('ID').AsInteger:=nID;
            dmbase.tbMensLgot.FieldByName('KOD').AsInteger:=nKod;
            dmbase.tbMensLgot.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
            dmbase.tbMensLgot.Post;
          except
            dmbase.tbMensLgot.Cancel;
            edDebug.Lines.Add('Ошибка льготы='+inttostr(nID)+' '+inttostr(nkod)+' '+ss);
          end;
        end else begin
          edDebug.Lines.Add('Льгота="'+SemLgot.FieldByName('ID').AsString+'"');
        end;
      end;
    end;
    SemLgot.Next;
  end;
  //--------------------------
  dDec:=0;   // дата заявления
  with dmBase.tbOchered do begin
    Append;
    FieldByName('OCHERED_ID').AsInteger:=0;
    FieldByName('ID').AsInteger:=nID;
    FieldByName('OTKAZ').AsBoolean:=false;
    FieldByName('ISKL').AsBoolean:=false;

    FieldByName('NEWSEM').AsBoolean:=lMolod;  // молодая семья
    FieldByName('SIROTA').AsBoolean:=lSirota;

    FieldByName('RESIDENCE').AsString:='';
    if not Kart.FieldByName(K_OBCH).IsNull and (Kart.FieldByName(K_OBCH).AsInteger=1) then FieldByName('RESIDENCE').AsInteger:=1;  // общежитие
    if (FieldByName('RESIDENCE').AsInteger=1) and not Kart.FieldByName(K_OBCH_DATE).IsNull
      then FieldByName('RESIDENCE_DATE').AsDateTime:=Kart.FieldByName(K_OBCH_DATE).AsDateTime;
    try
      if not Kart.FieldByName(K_PLOSH_ALL).IsNull then FieldByName('PLOSH_ALL').AsFloat:=Kart.FieldByName(K_PLOSH_ALL).AsFloat;
    except
      if not lFIO then begin edDebug.Lines.Add(sFIOD); lFIO:=true end;
      edDebug.Lines.Add(sID1C+':  площ.всего='+Kart.FieldByName(K_PLOSH_ALL).AsString);
      FieldByName('PLOSH_ALL').AsString:='';
    end;
    try
      if not Kart.FieldByName(K_PLOSH_GIL).IsNull then FieldByName('PLOSH_GIL').AsFloat:=Kart.FieldByName(K_PLOSH_GIL).AsFloat;
    except
      if not lFIO then begin edDebug.Lines.Add(sFIOD); lFIO:=true end;
      edDebug.Lines.Add(sID1C+':  пл.жил='+Kart.FieldByName(K_PLOSH_GIL).AsString);
      FieldByName('PLOSH_GIL').AsString:='';
    end;
    if not Kart.FieldByName(K_KOL_KOMN).IsNull  then FieldByName('KOLVO_KOMN_PR').AsInteger:=Kart.FieldByName(K_KOL_KOMN).AsInteger; // проживает
    if not Kart.FieldByName(K_KOMN).IsNull      then FieldByName('KOLVO_KOMN').AsInteger:=Kart.FieldByName(K_KOMN).AsInteger;  // претендует
    if not Kart.FieldByName(K_KOLSEM).IsNull    then FieldByName('KOLVO_SOSTAV').AsInteger:=Kart.FieldByName(K_KOLSEM).AsInteger;   // семья
    if not Kart.FieldByName(K_KOLPROG).IsNull   then FieldByName('KOLVO_PROPIS').AsInteger:=Kart.FieldByName(K_KOLPROG).AsInteger;  // проживающих
    if not Kart.FieldByName(K_DELO).IsNull      then FieldByName('DELO').AsString:=Kart.FieldByName(K_DELO).AsString;
    if FieldByName('DELO').AsString<>'' then FieldByName('N_DELO').AsInteger:=CreateNDelo(FieldByName('DELO').AsString);
    if not Kart.FieldByName(K_DATEP).IsNull     then begin
      FieldByName('DEC_DATE').AsDateTime:=Kart.FieldByName(K_DATEP).AsDateTime;
      dDec:=FieldByName('DEC_DATE').AsDateTime;
    end;
    if not Kart.FieldByName(K_SUBS).AsInteger=1     then FieldByName('SUBSID_RESH').AsString:='1';
    if not Kart.FieldByName(K_KREDIT).AsInteger=1   then FieldByName('KREDIT_RESH').AsString:='1';

    s:=Trim(Kart.FieldByName(K_BLAG).AsString);
    // 3-благоустр. 4-неблагоустр, 5-частично благоуст.
    if s<>'' then begin  //1M-неблагоустроенная, 1L-благоустроенная, 1N-частично благоустроенная
      nKod:=0;
      if s='1L' then nKod:=3;
      if s='1M' then nKod:=4;
      if s='1N' then nKod:=5;
      if nKod>0 then begin
        dmBase.tbMensPr.Append;
        dmBase.tbMensPr.FieldByName('ID').AsInteger:=nID;
        dmBase.tbMensPr.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
        dmBase.tbMensPr.FieldByName('KOD').AsInteger:=nKod;
        dmBase.tbMensPr.Post;
      end;
    end;
    s:=Trim(Kart.FieldByName(K_SAN).AsString);
    // 6-отвечает сантех., 7-не отвечает сантехсосю
    if s<>'' then begin  //1P-отвечает, 1Q-не отвечает
      nKod:=0;
      if s='1P' then nKod:=6;
      if s='1Q' then nKod:=7;
      if nKod>0 then begin
        dmBase.tbMensPr.Append;
        dmBase.tbMensPr.FieldByName('ID').AsInteger:=nID;
        dmBase.tbMensPr.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
        dmBase.tbMensPr.FieldByName('KOD').AsInteger:=nKod;
        dmBase.tbMensPr.Post;
      end;
    end;
    // номер очереди
//    i:=FList.IndexOf(trim(sID1C));
    s:=FList.Values[trim(sID1C)];
    if s<>'' then begin
      FieldByName('NOMER_OCH').AsString:=s;// FromIndex[i];
    end;


    {
    if tbConst.Locate('ID;OBJID;DATE', VarArrayOf(['  1Z', sID1C ,edDate.Value]),[]) then begin
      if not tbConst.FieldByName('VALUE').IsNull then begin
        FieldByName('NOMER_OCH').AsString:=tbConst.FieldByName('VALUE').AsString;
      end;
    end;
    }
    Post;
  end;
  with dmBase.tbOcheredResh do begin
    Append;
    FieldByName('ID').AsInteger:=nID;
    FieldByName('OCHERED_ID').AsInteger:=0;
    FieldByName('OTKAZ').AsBoolean:=false;
    FieldByName('TIP').AsInteger:=OCH_RESH_POST;
    FieldByName('NOMER').AsString:=Kart.FieldByName(K_NOMERR).AsString;
    if (Kart.FieldByName(K_NOMERR).AsString='') or (Kart.FieldByName(K_NOMERR).AsString='0')
      then FieldByName('PLAN').AsBoolean:=true;
    if not Kart.FieldByName(K_DATER).IsNull then FieldByName('DATER').AsDateTime:=Kart.FieldByName(K_DATER).AsDateTime;

    s:=Kart.FieldByName(K_OSNOV).AsString;
    if s<>'' then begin
      if SprOsnov.Locate('ID', s, []) then begin
        FieldByName('OSNOV_TEXT').AsString:=SprOsnov.FieldByName('DESCR').AsString;

      end;
    end;
    Post;
  end;
  with dmBase.tbOchered do begin
    Edit;
    FieldByName('ID_LAST_RESH').AsInteger:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
    FieldByName('ID_POST_RESH').AsInteger:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
    Post;
  end;
  //=====================================================
  //======== социальная очередь =========================
  //=====================================================
  if lSirota then begin
    with dmBase.tbOchered do begin
      Append;
      FieldByName('OCHERED_ID').AsInteger:=OCHERED_SOCIAL;
      FieldByName('ID').AsInteger:=nID;
      FieldByName('OTKAZ').AsBoolean:=false;
      FieldByName('ISKL').AsBoolean:=false;

      FieldByName('NEWSEM').AsBoolean:=lMolod;  // молодая семья
      FieldByName('SIROTA').AsBoolean:=lSirota;

      FieldByName('RESIDENCE').AsString:='';
      if not Kart.FieldByName(K_OBCH).IsNull and (Kart.FieldByName(K_OBCH).AsInteger=1) then FieldByName('RESIDENCE').AsInteger:=1;  // общежитие
      if (FieldByName('RESIDENCE').AsInteger=1) and not Kart.FieldByName(K_OBCH_DATE).IsNull
        then FieldByName('RESIDENCE_DATE').AsDateTime:=Kart.FieldByName(K_OBCH_DATE).AsDateTime;
      try
        if not Kart.FieldByName(K_PLOSH_ALL).IsNull then FieldByName('PLOSH_ALL').AsFloat:=Kart.FieldByName(K_PLOSH_ALL).AsFloat;
      except
        if not lFIO then begin edDebug.Lines.Add(sFIOD); lFIO:=true end;
        edDebug.Lines.Add(sID1C+':  площ.всего='+Kart.FieldByName(K_PLOSH_ALL).AsString);
        FieldByName('PLOSH_ALL').AsString:='';
      end;
      try
        if not Kart.FieldByName(K_PLOSH_GIL).IsNull then FieldByName('PLOSH_GIL').AsFloat:=Kart.FieldByName(K_PLOSH_GIL).AsFloat;
      except
        FieldByName('PLOSH_GIL').AsString:='';
      end;
      if not Kart.FieldByName(K_KOL_KOMN).IsNull  then FieldByName('KOLVO_KOMN_PR').AsInteger:=Kart.FieldByName(K_KOL_KOMN).AsInteger; // проживает
      if not Kart.FieldByName(K_KOMN).IsNull      then FieldByName('KOLVO_KOMN').AsInteger:=Kart.FieldByName(K_KOMN).AsInteger;  // претендует
      if not Kart.FieldByName(K_KOLSEM).IsNull    then FieldByName('KOLVO_SOSTAV').AsInteger:=Kart.FieldByName(K_KOLSEM).AsInteger;   // семья
      if not Kart.FieldByName(K_KOLPROG).IsNull   then FieldByName('KOLVO_PROPIS').AsInteger:=Kart.FieldByName(K_KOLPROG).AsInteger;  // проживающих
      if not Kart.FieldByName(K_DELO).IsNull      then FieldByName('DELO').AsString:=Kart.FieldByName(K_DELO).AsString;
      if FieldByName('DELO').AsString<>'' then FieldByName('N_DELO').AsInteger:=CreateNDelo(FieldByName('DELO').AsString);

      if dDecSirota>0 then begin
        FieldByName('DEC_DATE').AsDateTime:=dDecSirota;
      end else if dDec>0 then begin
        FieldByName('DEC_DATE').AsDateTime:=dDec;
      end;
      Post;
    end;

    with dmBase.tbOcheredResh do begin
      Append;
      FieldByName('ID').AsInteger:=nID;
      FieldByName('OCHERED_ID').AsInteger:=OCHERED_SOCIAL;
      FieldByName('OTKAZ').AsBoolean:=false;
      FieldByName('TIP').AsInteger:=OCH_RESH_POST;
      FieldByName('NOMER').AsString:=sNomerSirota;;
      if dReshSirota>0 then begin
        FieldByName('DATER').AsDateTime:=dReshSirota;
      end;
      s:=Kart.FieldByName(K_OSNOV).AsString;
      if s<>'' then begin
        if SprOsnov.Locate('ID', s, []) then begin
          FieldByName('OSNOV_TEXT').AsString:=SprOsnov.FieldByName('DESCR').AsString;
        end;
      end;
      Post;
    end;
    with dmBase.tbOchered do begin
      Edit;
      FieldByName('ID_LAST_RESH').AsInteger:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
      FieldByName('ID_POST_RESH').AsInteger:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
      Post;
    end;
  end;

  except
  end;
end;

const
 A_DELO='SP115';   //	(P)НомерДела
 A_FAM='SP116';    //	(P)Фамилия
 A_NAME='SP117';    //	(P)Имя
 A_OTCH='SP118';    //	(P)Отчество
 A_ADRES='SP119';    //	(P)Адрес

 A_PRIN='SP120';    //	(P)ПринадлежностьЖил
 A_GSK='SP121';    //	(P)ЖСК
 A_OSNOV='SP122';    //	(P)ОснованиеПостанов
 A_DATEP='SP123';    //	(P)ДатаПостановкиНаУ
 A_NOMERZ='SP124';    //	(P)РегНомерЗаявления
 A_DATER='SP125';    //	(P)ДатаРешения
 A_NOMERR='SP126';    //	(P)НомерРешения
 A_KOLSEM='SP127';    //	(P)Семья  (количество человек)
 A_KOLPROG='SP128';    //	(P)Проживает        (количество человек)
 A_KOMN='SP129';    //	(P)ПотребностьВЖилье  (количество комнат)
 A_PLOSH_ALL='SP130';    //	(P)ОбщаяПлощадь
 A_PLOSH_GIL='SP131';    //	(P)ЖилаяПлощадь
 A_KOL_KOMN='SP132';    //	(P)КоличествоКомнат
 A_BLAG='SP133';    //	(P)Благоустройство
 A_SAN='SP134';   	//(P)Сантехсостояние
 A_DATE_ISKL='SP165';   // дата исключения

 SA_FAM='SP144';    //  	(P)Фамилия
 SA_NAME='SP145';    //  	(P)Имя
 SA_OTCH='SP146';    //  	(P)Отчество
 SA_IN='SP277';   //  	(P)ЛичныйНомер
 SA_OTNOSH='SP147';    //  	(P)Родство
 SA_POL='SP148';   //  	(P)Пол
 SA_YEAR='SP149';    //  	(P)ГодРождения
 SA_DATE='SP171';   //  	(P)ДатаРождения
 SA_MOL='SP150';    //  	(P)МолодаяСемья
 SA_DATE_MOL='SP151';    //  	(P)ДатаПостановкиМол
 SA_MALO='SP222';   //  	(P)Малообеспечен
//-----------------------------------------------------------------
procedure TfmLoadPinsk.LoadOneA;
var
  i,n,nID,nID2,nAdresID,nKod,NN,nKod2:Integer;
  sID1C,s,ss,sSocial,sFIO,sFIOD,sFilter,sNomerSirota,sLichNomer:String;
  arr:TArrStrings;
  dDateIskl,dDec,dDateR,DateFiks,dDateDec,dDecSirota,dReshSirota:TDateTime;
  lFIO,lIskl,lMolod,lSirota:Boolean;
begin
  sID1C:=KartA.fieldbyName('ID').AsString;
  nID:=dmBase.GetNewID(_TypeObj_Nasel);
  nAdresID:=CreateAdres(nID, KartA.fieldbyName(A_ADRES).AsString);

  dDateIskl:=0;
  if not KartA.fieldbyName(A_DATE_ISKL).IsNull
    then dDateIskl:=KartA.fieldbyName(A_DATE_ISKL).AsDateTime;

  lFIO:=false;
  sFIO:=ANSIUpperCase(KartA.fieldbyName(A_FAM).AsString+KartA.fieldbyName(A_NAME).AsString+KartA.fieldbyName(A_OTCH).AsString);
  sFIOD:=KartA.fieldbyName(A_FAM).AsString+' '+KartA.fieldbyName(A_NAME).AsString+' '+KartA.fieldbyName(A_OTCH).AsString;
  try

  KartASem.SetRange([sID1C],[sID1C]);   //см. MasterSource
  sLichNomer:='';
  dDateR:=0;
  nN:=1;
  lMolod:=false;  // молодая семья
  sFilter:=';'+sID1C+';';
  while not KartASem.Eof do begin
    s:=Trim(KartASem.FieldByName(SA_FAM).AsString);
    if (s<>'') and (KartASem.FieldByName('ISMARK').AsString<>'*') then begin
      sFilter:=sFilter+Trim(KartASem.FieldByName('ID').AsString)+';';  // для фильтрации льгот
      if Trim(KartASem.FieldByName(SA_MOL).AsString)='2M'
        then lMolod:=true;
      if sFIO=ANSIUpperCase(KartASem.fieldbyName(SA_FAM).AsString+KartASem.fieldbyName(SA_NAME).AsString+KartASem.fieldbyName(SA_OTCH).AsString) then begin
        // типа хозяин очереди
          sLichNomer:=CheckLichNom(true, KartASem.FieldByName(SA_IN).AsString);
          if KartASem.fieldbyName(SA_DATE).AsString<>'' then begin
            dDateR:=KartASem.FieldbyName(SA_DATE).AsDateTime;
          end else if KartASem.fieldbyName(SA_YEAR).AsInteger>0 then begin
            try
              dDateR:=STOD(trim(KartASem.fieldbyName(SA_YEAR).AsString)+'0101',tdClipper);
            except
              if not lFIO then begin edDebug.Lines.Add(sFIOD); lFIO:=true end;
              edDebug.Lines.Add(sID1C+':  Год Рождения='+KartASem.fieldbyName(SA_YEAR).AsString);
            end;
          end;
      end else begin

        with dmBase.tbSostavSem do begin
          Append;
          FieldByName('ID').AsInteger:=nID;
          FieldByName('NOMER').AsInteger:=nN;
          nN:=nN+1;
          FieldByName('FAMILIA').AsString:=KartASem.FieldByName(SA_FAM).AsString;
          FieldByName('NAME').AsString:=KartASem.FieldByName(SA_NAME).AsString;
          FieldByName('OTCH').AsString:=KartASem.FieldByName(SA_OTCH).AsString;
          FieldByName('LICH_NOMER').AsString:=CheckLichNom(true, KartASem.FieldByName(SA_IN).AsString);
          if Trim(KartASem.FieldByName(SA_POL).AsString)='2Y'
            then FieldByName('POL').AsString:='Ж'
            else FieldByName('POL').AsString:='М';

          nID2:=dmBase.GetNewID(_TypeObj_Nasel);
          FieldByName('MEMBER_ID').AsInteger:=nID2;
          if KartASem.fieldbyName(SA_DATE).AsString<>'' then begin
            FieldByName('DATER').AsDateTime:=KartASem.FieldbyName(SA_DATE).AsDateTime;
          end else if KartASem.fieldbyName(SA_YEAR).AsInteger>0 then begin
            try
              FieldByName('DATER').AsDateTime:=STOD(trim(KartASem.fieldbyName(SA_YEAR).AsString)+'0101',tdClipper);
            except
              if not lFIO then begin edDebug.Lines.Add(sFIOD); lFIO:=true end;
              edDebug.Lines.Add(sID1C+':  Год Рождения='+KartASem.fieldbyName(SA_YEAR).AsString);
              FieldByName('DATER').AsString:='';
            end;
          end;
          s:=ansilowercase(trim(KartASem.FieldByName(SA_OTNOSH).AsString));
          if s='супруг'   then s:='муж';
          if s='супруга'  then s:='жена';
          nKod:=0;
          if (s<>'') and (Pos(';'+s+';',My_Otn)>0) then begin
            if not dmBase.SprOtnosh.Locate('NAME', s,[loCaseInsensitive]) then begin
              dmBase.sprOtnosh.Append;
              dmBase.SprOtnosh.FieldByName('NAME').AsString:=s;
              dmBase.SprOtnosh.Post;
            end;
            nKod:=dmBase.SprOtnosh.FieldByName('ID').AsInteger;
          end;
          if nKod>0 then begin
            FieldByName('OTNOSH').AsInteger:=nKod;
          end;
          Post;
    //-------------------------------------------------------------------------
          dmBase.tbMens.Append;
          dmBase.tbMens.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
          dmBase.tbMens.FieldByName('ID').AsInteger:=nID2;
          dmBase.tbMens.FieldByName('OCHERED').AsBoolean:=false;
          dmBase.tbMens.FieldByName('FAMILIA').AsString:=FieldByName('FAMILIA').AsString;
          dmBase.tbMens.FieldByName('NAME').AsString:=FieldByName('NAME').AsString;
          dmBase.tbMens.FieldByName('OTCH').AsString:=FieldByName('OTCH').AsString;
          dmBase.tbMens.FieldByName('OTNOSH').AsString:=FieldByName('OTNOSH').AsString;
          dmBase.tbMens.FieldByName('POL').AsString:=FieldByName('POL').AsString;
          dmBase.tbMens.FieldByName('LICH_NOMER').AsString:=FieldByName('LICH_NOMER').AsString;
          dmBase.tbMens.FieldByName('CITIZEN').AsInteger:=112;
          if nAdresID>0
            then dmBase.tbMens.FieldByName('ADRES_ID').AsInteger:=nAdresID;
          if not FieldByName('DATER').IsNull
            then dmBase.tbMens.FieldByName('DATER').Value:=FieldByName('DATER').Value;
          dmBase.tbMens.Post;
    //-------------------------------------------------------------------------
        end;
      end;
    end;
    KartASem.Next;
  end;

  SemLgot.Filter:='';
  FilterLgot;

  KartASem.CancelRange;

  with dmBase.tbMens do begin
    Append;
    FieldByName('OCHERED').AsBoolean:=true;
    FieldByName('FAMILIA').AsString:=KartA.FieldByName(A_FAM).AsString;
    FieldByName('NAME').AsString:=KartA.FieldByName(A_NAME).AsString;
    FieldByName('OTCH').AsString:=KartA.FieldByName(A_OTCH).AsString;
    FieldByName('LICH_NOMER').AsString:=sLichNomer;
    if dDateR>0 then FieldByName('DATER').AsDateTime:=dDateR;
    FieldByName('ID').AsInteger:=nID;
    DateFiks:=STOD('1899-12-30',tdAds);
    FieldByName('DATE_FIKS').AsDateTime:=DateFiks;
    FieldByName('PROPIS').AsBoolean:=true;
    FieldByName('PRESENT').AsBoolean:=true;
    FieldByName('CANDELETE').AsBoolean:=false;
    FieldByName('POL').AsString:=PolFrom(KartA.FieldByName(A_NAME).AsString, KartA.FieldByName(A_OTCH).AsString);
    FieldByName('OTNOSH').AsString:='';
    FieldByName('LIC_ID').AsString:='0';
    FieldByName('ADRES_ID').AsInteger:=nAdresID;
    FieldByName('CITIZEN').AsInteger:=MY_GRAG;

    Post;
  end;
  //-------------------------
  lSirota:=false;
  while not SemLgot.Eof do begin
    if SemLgot.FieldByName('ISMARK').AsString<>'*' then begin
      s:=Trim(SemLgot.FieldByName('SP223').AsString);   // ID льготы
      if s='O' then begin
        lSirota:=true;
        {SP224-(P)ДатаПостановкиНаУ  SP225-(P)РегНомерЗаявления  SP226-(P)ДатаРешения  SP227-(P)НомерРешения}
        if SemLgot.FieldByName('SP224').IsNull then dDecSirota:=0  else dDecSirota:=SemLgot.FieldByName('SP224').AsDateTime;
        if SemLgot.FieldByName('SP226').IsNull then dReshSirota:=0 else dReshSirota:=SemLgot.FieldByName('SP226').AsDateTime;
        sNomerSirota:=SemLgot.FieldByName('SP227').AsString;
      end else begin
        if SprLgot.FindKey([SemLgot.FieldByName('SP223').AsString]) then begin
          ss:=SprLgot.FieldByName('SP18').AsString;
          if not dmBase.SprLgot.Locate('NAME', ss, [loCaseInsensitive]) then begin
            dmBase.SprLgot.Append;
            dmBase.SprLgot.FieldByName('NAME').AsString:=ss;
            dmBase.SprLgot.Post;
          end;
          nKod:=dmBase.SprLgot.FieldByName('ID').AsInteger;
          dmbase.tbMensLgot.Append;
          dmbase.tbMensLgot.FieldByName('ID').AsInteger:=nID;
          dmbase.tbMensLgot.FieldByName('KOD').AsInteger:=nKod;
          dmbase.tbMensLgot.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
          dmbase.tbMensLgot.Post;
        end else begin
          edDebug.Lines.Add('Льгота="'+SemLgot.FieldByName('ID').AsString+'"');
        end;
      end;
    end;
    SemLgot.Next;
  end;
  //--------------------------
  dDec:=0;   // дата заявления
  with dmBase.tbOchered do begin
    Append;
    FieldByName('OCHERED_ID').AsInteger:=0;
    FieldByName('ID').AsInteger:=nID;
    FieldByName('OTKAZ').AsBoolean:=false;
    FieldByName('ISKL').AsBoolean:=true;

    FieldByName('NEWSEM').AsBoolean:=lMolod;  // молодая семья
    FieldByName('SIROTA').AsBoolean:=lSirota;

    FieldByName('RESIDENCE').AsString:='';

//    if not KartA.FieldByName(A_OBCH).IsNull and (KartA.FieldByName(A_OBCH).AsInteger=1) then FieldByName('RESIDENCE').AsInteger:=1;  // общежитие
//    if (FieldByName('RESIDENCE').AsInteger=1) and not KartA.FieldByName(A_OBCH_DATE).IsNull
//      then FieldByName('RESIDENCE_DATE').AsDateTime:=KartA.FieldByName(A_OBCH_DATE).AsDateTime;
    try
      if not KartA.FieldByName(A_PLOSH_ALL).IsNull then FieldByName('PLOSH_ALL').AsFloat:=KartA.FieldByName(A_PLOSH_ALL).AsFloat;
    except
      if not lFIO then begin edDebug.Lines.Add(sFIOD); lFIO:=true end;
      edDebug.Lines.Add(sID1C+':  площ.всего='+KartA.FieldByName(A_PLOSH_ALL).AsString);
      FieldByName('PLOSH_ALL').AsString:='';
    end;
    try
      if not KartA.FieldByName(A_PLOSH_GIL).IsNull then FieldByName('PLOSH_GIL').AsFloat:=KartA.FieldByName(A_PLOSH_GIL).AsFloat;
    except
      if not lFIO then begin edDebug.Lines.Add(sFIOD); lFIO:=true end;
      edDebug.Lines.Add(sID1C+':  пл.жил='+KartA.FieldByName(A_PLOSH_GIL).AsString);
      FieldByName('PLOSH_GIL').AsString:='';
    end;
    if not KartA.FieldByName(A_KOL_KOMN).IsNull  then FieldByName('KOLVO_KOMN_PR').AsInteger:=KartA.FieldByName(A_KOL_KOMN).AsInteger; // проживает
    if not KartA.FieldByName(A_KOMN).IsNull      then FieldByName('KOLVO_KOMN').AsInteger:=KartA.FieldByName(A_KOMN).AsInteger;  // претендует
    if not KartA.FieldByName(A_KOLSEM).IsNull    then FieldByName('KOLVO_SOSTAV').AsInteger:=KartA.FieldByName(A_KOLSEM).AsInteger;   // семья
    if not KartA.FieldByName(A_KOLPROG).IsNull   then FieldByName('KOLVO_PROPIS').AsInteger:=KartA.FieldByName(A_KOLPROG).AsInteger;  // проживающих
    if not KartA.FieldByName(A_DELO).IsNull      then FieldByName('DELO').AsString:=KartA.FieldByName(A_DELO).AsString;
    if FieldByName('DELO').AsString<>'' then FieldByName('N_DELO').AsInteger:=CreateNDelo(FieldByName('DELO').AsString);
    if not KartA.FieldByName(A_DATEP).IsNull     then begin
      FieldByName('DEC_DATE').AsDateTime:=KartA.FieldByName(A_DATEP).AsDateTime;
      dDec:=FieldByName('DEC_DATE').AsDateTime;
    end;
//    if not KartA.FieldByName(A_SUBS).AsInteger=1     then FieldByName('SUBSID_RESH').AsString:='1';
//    if not KartA.FieldByName(A_KREDIT).AsInteger=1   then FieldByName('KREDIT_RESH').AsString:='1';

    s:=Trim(KartA.FieldByName(A_BLAG).AsString);
    // 3-благоустр. 4-неблагоустр, 5-частично благоуст.
    if s<>'' then begin  //1M-неблагоустроенная, 1L-благоустроенная, 1N-частично благоустроенная
      nKod:=0;
      if s='1L' then nKod:=3;
      if s='1M' then nKod:=4;
      if s='1N' then nKod:=5;
      if nKod>0 then begin
        dmBase.tbMensPr.Append;
        dmBase.tbMensPr.FieldByName('ID').AsInteger:=nID;
        dmBase.tbMensPr.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
        dmBase.tbMensPr.FieldByName('KOD').AsInteger:=nKod;
        dmBase.tbMensPr.Post;
      end;
    end;
    s:=Trim(KartA.FieldByName(A_SAN).AsString);
    // 6-отвечает сантех., 7-не отвечает сантехсосю
    if s<>'' then begin  //1P-отвечает, 1Q-не отвечает
      nKod:=0;
      if s='1P' then nKod:=6;
      if s='1Q' then nKod:=7;
      if nKod>0 then begin
        dmBase.tbMensPr.Append;
        dmBase.tbMensPr.FieldByName('ID').AsInteger:=nID;
        dmBase.tbMensPr.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
        dmBase.tbMensPr.FieldByName('KOD').AsInteger:=nKod;
        dmBase.tbMensPr.Post;
      end;
    end;
    // номер очереди
//    i:=FList.IndexOf(trim(sID1C));
    s:=FList.Values[trim(sID1C)];
    if s<>'' then begin
      FieldByName('NOMER_OCH').AsString:=s;// FromIndex[i];
    end;


    {
    if tbConst.Locate('ID;OBJID;DATE', VarArrayOf(['  1Z', sID1C ,edDate.Value]),[]) then begin
      if not tbConst.FieldByName('VALUE').IsNull then begin
        FieldByName('NOMER_OCH').AsString:=tbConst.FieldByName('VALUE').AsString;
      end;
    end;
    }
    Post;
  end;
  with dmBase.tbOcheredResh do begin
    Append;
    FieldByName('ID').AsInteger:=nID;
    FieldByName('OCHERED_ID').AsInteger:=0;
    FieldByName('OTKAZ').AsBoolean:=false;
    FieldByName('TIP').AsInteger:=OCH_RESH_POST;
    FieldByName('NOMER').AsString:=KartA.FieldByName(A_NOMERR).AsString;
    if (KartA.FieldByName(A_NOMERR).AsString='') or (KartA.FieldByName(A_NOMERR).AsString='0')
      then FieldByName('PLAN').AsBoolean:=true;
    if not KartA.FieldByName(A_DATER).IsNull then FieldByName('DATER').AsDateTime:=KartA.FieldByName(A_DATER).AsDateTime;

    s:=KartA.FieldByName(A_OSNOV).AsString;
    if s<>'' then begin
      if SprOsnov.Locate('ID', s, []) then begin
        FieldByName('OSNOV_TEXT').AsString:=SprOsnov.FieldByName('DESCR').AsString;

      end;
    end;
    Post;
  end;
  with dmBase.tbOchered do begin
    Edit;
    FieldByName('ID_POST_RESH').AsInteger:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
    Post;
  end;
  //--------снятие -------------------------------------------------------------------
  with dmBase.tbOcheredResh do begin
    Append;
    FieldByName('ID').AsInteger:=nID;
    FieldByName('OCHERED_ID').AsInteger:=0;
    FieldByName('OTKAZ').AsBoolean:=false;
    FieldByName('TIP').AsInteger:=OCH_RESH_SN;
    FieldByName('NOMER').AsString:='';
    if dDateIskl=0 then begin
      FieldByName('DATER').AsString:='';
      FieldByName('DATE_SORT').AsDateTime:=STOD('9999-12-31',tdAds);
    end else begin
      FieldByName('DATER').AsDateTime:=dDateIskl;
      FieldByName('DATE_SORT').AsDateTime:=STOD('9999-12-31',tdAds);
    end;
    Post;
  end;
  with dmBase.tbOchered do begin
    Edit;
    FieldByName('ID_SN_RESH').AsInteger:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
    FieldByName('ID_LAST_RESH').AsInteger:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
    Post;
  end;
  //=====================================================
  //======== социальная очередь =========================
  //=====================================================
  {
  if lSirota then begin
    with dmBase.tbOchered do begin
      Append;
      FieldByName('OCHERED_ID').AsInteger:=OCHERED_SOCIAL;
      FieldByName('ID').AsInteger:=nID;
      FieldByName('OTKAZ').AsBoolean:=false;
      FieldByName('ISKL').AsBoolean:=false;

      FieldByName('NEWSEM').AsBoolean:=lMolod;  // молодая семья
      FieldByName('SIROTA').AsBoolean:=lSirota;

      FieldByName('RESIDENCE').AsString:='';
//      if not KartA.FieldByName(A_OBCH).IsNull and (KartA.FieldByName(A_OBCH).AsInteger=1) then FieldByName('RESIDENCE').AsInteger:=1;  // общежитие
//      if (FieldByName('RESIDENCE').AsInteger=1) and not KartA.FieldByName(A_OBCH_DATE).IsNull
//        then FieldByName('RESIDENCE_DATE').AsDateTime:=KartA.FieldByName(A_OBCH_DATE).AsDateTime;
      try
        if not KartA.FieldByName(A_PLOSH_ALL).IsNull then FieldByName('PLOSH_ALL').AsFloat:=KartA.FieldByName(A_PLOSH_ALL).AsFloat;
      except
        if not lFIO then begin edDebug.Lines.Add(sFIOD); lFIO:=true end;
        edDebug.Lines.Add(sID1C+':  площ.всего='+KartA.FieldByName(A_PLOSH_ALL).AsString);
        FieldByName('PLOSH_ALL').AsString:='';
      end;
      try
        if not KartA.FieldByName(A_PLOSH_GIL).IsNull then FieldByName('PLOSH_GIL').AsFloat:=KartA.FieldByName(A_PLOSH_GIL).AsFloat;
      except
        FieldByName('PLOSH_GIL').AsString:='';
      end;
      if not KartA.FieldByName(A_KOL_KOMN).IsNull  then FieldByName('KOLVO_KOMN_PR').AsInteger:=KartA.FieldByName(A_KOL_KOMN).AsInteger; // проживает
      if not KartA.FieldByName(A_KOMN).IsNull      then FieldByName('KOLVO_KOMN').AsInteger:=KartA.FieldByName(A_KOMN).AsInteger;  // претендует
      if not KartA.FieldByName(A_KOLSEM).IsNull    then FieldByName('KOLVO_SOSTAV').AsInteger:=KartA.FieldByName(A_KOLSEM).AsInteger;   // семья
      if not KartA.FieldByName(A_KOLPROG).IsNull   then FieldByName('KOLVO_PROPIS').AsInteger:=KartA.FieldByName(A_KOLPROG).AsInteger;  // проживающих
      if not KartA.FieldByName(A_DELO).IsNull      then FieldByName('DELO').AsString:=KartA.FieldByName(A_DELO).AsString;
      if FieldByName('DELO').AsString<>'' then FieldByName('N_DELO').AsInteger:=CreateNDelo(FieldByName('DELO').AsString);

      if dDecSirota>0 then begin
        FieldByName('DEC_DATE').AsDateTime:=dDecSirota;
      end else if dDec>0 then begin
        FieldByName('DEC_DATE').AsDateTime:=dDec;
      end;
      Post;
    end;

    with dmBase.tbOcheredResh do begin
      Append;
      FieldByName('ID').AsInteger:=nID;
      FieldByName('OCHERED_ID').AsInteger:=OCHERED_SOCIAL;
      FieldByName('OTKAZ').AsBoolean:=false;
      FieldByName('TIP').AsInteger:=OCH_RESH_POST;
      FieldByName('NOMER').AsString:=sNomerSirota;;
      if dReshSirota>0 then begin
        FieldByName('DATER').AsDateTime:=dReshSirota;
      end;
      s:=KartA.FieldByName(A_OSNOV).AsString;
      if s<>'' then begin
        if SprOsnov.Locate('ID', s, []) then begin
          FieldByName('OSNOV_TEXT').AsString:=SprOsnov.FieldByName('DESCR').AsString;
        end;
      end;
      Post;
    end;
    with dmBase.tbOchered do begin
      Edit;
      FieldByName('ID_LAST_RESH').AsInteger:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
      FieldByName('ID_POST_RESH').AsInteger:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
      Post;
    end;
  end;
  }

  except
  end;
end;




function TfmLoadPinsk.CreateAdres(nIDMen:Integer; sAdres:String): Integer;
var
  s,ss,sss,sName,sDomKv,sAdd,sDom,sKv,sErr:String;

  nUL,nPer,n,i,nKodUL, nPunkt,nAdresID:Integer;
  adr:Tadres;
  arr:TArrStrings;
  lText:Boolean;
begin
  Result:=0;
//  exit;
//  sAdres:=Kart.FieldByName('SP39').AsString;
  ss:=Trim(sAdres);
  if ss='' then exit;
  lText:=false;
  arr:=StrToArr(ss,',',true);
  sDom:='';
  sKv:='';
  if Length(arr)=1 then begin
    edDebug.Lines.Add('нет запятой:  '+ss);
    exit;
  end;

  lText:=false;
  if Length(arr)>2 then begin  // не пинск
    edDebug.Lines.Add('>> '+ss);
    lText:=true;

  end else begin
    ss:=arr[0];
    ss:=StringReplace(ss,'-ая','-я',[]);
    ss:=StringReplace(ss,'-ой','-й',[]);
    ss:=StringReplace(ss,'-ый','-й',[]);
    ss:=StringReplace(ss,'ё','е',[]);
    s:=ANSILowerCase(arr[0]);
    n:=Pos('-',arr[1]);
    if n=0 then begin
      sDom:=arr[1];
      sKv:='';
    end else begin
      sDom:=Copy(arr[1],1,n-1);
      sKv:=Copy(arr[1],n+1,Length(arr[1]));
    end;
    nUL:=1;

    if (copy(s,1,3)='ул.') or (copy(s,1,3)='ул,') then begin
      nUL:=1;
      ss:=Copy(ss,4,length(ss));
    end else if copy(s,1,4)='пер.'  then begin
      nUL:=3;
      ss:=Copy(ss,5,length(ss));
    end else if copy(s,1,3)='пл.'  then begin
      nUL:=4;
      ss:=Copy(ss,4,length(ss));
    end else if copy(s,1,3)='п-т'  then begin
      nUL:=2;
      ss:=Copy(ss,4,length(ss));
    end else if (copy(s,1,4)='пр-т') or (copy(s,1,4)='п-кт') then begin
      nUL:=2;
      ss:=Copy(ss,5,length(ss));
    end else if copy(s,1,5)='пр-кт'  then begin
      nUL:=2;
      ss:=Copy(ss,6,length(ss));
    end else if copy(s,1,4)='пр-д'  then begin
      nUL:=5;
      ss:=Copy(ss,5,length(ss));
    end else if pos('тупик', ss)>0 then begin
      nUL:=8;
      ss:=StringReplace(ss,'тупик','',[]);
    end else if pos('туп.', ss)>0 then begin
      nUL:=8;
      ss:=StringReplace(ss,'туп.','',[]);
    end else if pos('пр-д', ss)>0 then begin
      nUL:=5;
      ss:=StringReplace(ss,'пр-д','',[]);
    end else if pos('проезд', ss)>0 then begin
      nUL:=5;
      ss:=StringReplace(ss,'проезд','',[]);
    end;
    s:=ANSILowerCase(Trim(ss));
    if Pos('чуклая',s)>0 then begin  // 'И.Чуклая'
      ss:='И.Чуклая';
    end else if s='ипд' then begin   // 'ИРКУТСКО-ПИНСКОЙ дивизии'
      ss:='ИРКУТСКО-ПИНСКОЙ дивизии';
    end else if Pos('космодемьянской',s)>0 then begin
      ss:='Космодемьянской';
    end else if Pos('гуренковой',s)>0 then begin
      ss:='Гуренковой';
    end else if s='весеняя' then begin
      ss:='Весенняя';
    end else if s='крупская' then begin
      ss:='Крупской';
    end else if s='а.блока' then begin
      ss:='Блока';
    end else if s='гастело' then begin
      ss:='Гастелло';
    end else if s='cухзая' then begin
      ss:='Сухая';
    end else if Pos('нордмана',s)>0 then begin
      ss:='Генерала Нордмана';
    end else if Pos('маркса',s)>0 then begin
      ss:='Маркса';
    end else if Pos('кошевого',s)>0 then begin
      ss:='О.Кошевого';
    end else if Pos('янищиц',s)>0 then begin
      ss:='Янищиц';
    end else if Pos('2 новая',s)>0 then begin
      ss:='2-я Новая';
    end else if s='косюшко' then begin
      ss:='Костюшко';
    end else if s='первомайсий' then begin
      ss:='Первомайский';
    end else if s='молодежнная' then begin
      ss:='Молодежная';
    end else if s='черниевичская' then begin
      ss:='Чернеевичская';
    end else if s='скорины' then begin
      ss:='Ф.Скорины';
    end else if s='загородняя' then begin
      ss:='Загородная';
    end else if s='превомайская' then begin
      ss:='Первомайская';
    end else if Pos('флотилии',s)>0 then begin
      ss:='Днепровской Флотилии';
    end else if Pos('грушевский',s)>0 then begin
      ss:='Грушевский';
    end else if Pos('панковой',s)>0 then begin
      ss:='Панковой';
    end else if Pos('рокосовского',s)>0 then begin
      ss:='Рокоссовского';
    end else if Pos('лиственный',s)>0 then begin
      ss:='Лиственный';
      nUL:=5;
    end else if Pos('я.колоса',s)>0 then begin
      ss:='Я.Коласа';
    end else if s='колоса' then begin
      ss:='Я.Коласа';
    end else if s='сухзая' then begin
      ss:='Сухая';
    end else if s='энегельса' then begin
      ss:='Энгельса';
    end else if s='нефтянная' then begin
      ss:='Нефтяная';
    end else if s='новопесчанная' then begin
      ss:='Новопесчаная';
    end else if Pos('1-й долинский',s)>0 then begin
      ss:='1-й Долинский';
      nUL:=5;
    end else if Pos('2-й долинский',s)>0 then begin
      ss:='2-й Долинский';
      nUL:=5;
    end else if Pos('3-й долинский',s)>0 then begin
      ss:='3-й Долинский';
      nUL:=5;
    end else if Pos('1-й боберный',s)>0 then begin
      ss:='1-й Боберный';
      nUL:=5;
    end else if Pos('2-й боберный',s)>0 then begin
      ss:='2-й Боберный';
      nUL:=5;
    end else if Pos('1-й ракетный',s)>0 then begin
      ss:='1-й Ракетный';
      nUL:=5;
    end else if Pos('2-й ракетный',s)>0 then begin
      ss:='2-й Ракетный';
      nUL:=5;
    end else if Pos('3-й ракетный',s)>0 then begin
      ss:='3-й Ракетный';
      nUL:=5;
    end;
    sName:=Trim(ss);
    sAdd:='';
    if dmBase.SprUL.Locate('NAME;TIP',VarArrayOf([sName+sAdd, nUL]), []) then begin
      FCount:=FCount+1;
      Label5.Caption:=Inttostr(FCount);
      nKodUL:=dmBase.SprUL.FieldByName('ID').AsInteger;
    end else begin
      i:=0;
      dmBase.SprUL.SetRange([sName+sAdd,0],[sName+sAdd,999]);
      while not dmBase.SprUL.Eof do begin
        i:=i+1;
        dmBase.SprUL.Next;
      end;
      dmBase.SprUL.cancelRange;
      if (i=1) then begin
        nKodUL:=dmBase.SprUL.FieldByName('ID').AsInteger;
      end else begin
        edDebug.Lines.Add('>>>>'+sName+sAdd+'      '+inttostr(nUL)+'     '+inttostr(nPer));
        lText:=true;
      end;
    end;
    if (nKodUL>0) and not lText then begin
      adr.PunktKod:=1;
      adr.UlicaInt:=nKodUl;
      adr.Dom:=sDom;
      adr.Korp:='';
      adr.Kv:=sKv;
      adr.NotDom:=false;
      adr.NameHouse:='';
      if dmBase.AddAdres(dmBase.GetDateCurrentSost,adr,nAdresID,sErr)>-1 then begin
        if nAdresID>0 then begin
          Result:=nAdresID;
        end;
      end;
    end;
  end;
  if Result=0 then begin
    with dmBase.tbMensAdd do begin
      Append;
      FieldByName('ID').AsInteger:=nIDMen;
      FieldByName('TEXT_ADRES').AsString:=sAdres;
      Post;
    end;
  end;
end;

procedure TfmLoadPinsk.DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if TAdsTable(Column.Field.DataSet).AdsIsRecordDeleted(0)
    then Background:=clInfoBk;
end;

procedure TfmLoadPinsk.cbDeletedClick(Sender: TObject);
begin
  dmbase.AdsSettings.ShowDeleted:=cbDeleted.Checked;
  kart.First;
end;
//--------------------------------------------------------------------------------------
procedure TfmLoadPinsk.FormCreate(Sender: TObject);
begin
  edDate.Value:=STOD('2014-08-22', tdAds);
end;
//--------------------------------------------------------------------------------------
procedure TfmLoadPinsk.Button3Click(Sender: TObject);
begin
  tbConst.Filter:='alltrim(id)=''1Z'' and STOD('+QStr(DTOS(edDate.Value,tdClipper))+')=date';
  tbConst.Filtered:=true;
end;
//--------------------------------------------------------------------------------------
procedure TfmLoadPinsk.FilterLgot;
var
  s:String;
begin
  KartSem.First;
  s:=';';
  while not KartSem.Eof do begin
    s:=s+Trim(KartSem.FieldByName('ID').AsString)+';';
    KartSem.Next;
  end;
  KartSem.First;
  SemLgot.Filter:='at(alltrim(parentext)+'';'','+QStr(s)+')>0';
  SemLgot.Filtered:=true;
end;
//--------------------------------------------------------------------------------------
procedure TfmLoadPinsk.KartAfterScroll(DataSet: TDataSet);
begin
  if cbFilter.Checked then begin
    FilterLgot;
  end;
end;
//--------------------------------------------------------------------------------------
procedure TfmLoadPinsk.cbFilterClick(Sender: TObject);
begin
  if cbFilter.Checked then begin
    FilterLgot;
  end else begin
    SemLgot.Filtered:=false;
  end;
end;
//--------------------------------------------------------------------------------------
procedure TfmLoadPinsk.DBGridEh5Columns11GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if SprLgot.FindKey([Params.Text]) then begin
    Params.Text:=SprLgot.FieldByName('DESCR').AsString;
  end;
end;
//--------------------------------------------------------------------------------------
procedure TfmLoadPinsk.Button4Click(Sender: TObject);
var
  sLichNomer,s,sID1C,sFIO,sFIOD:String;
begin
  SemLgot.DisableControls;
  kart.DisableControls;
  KartSem.DisableControls;
  KartLgot.DisableControls;
  kartA.DisableControls;
  KartASem.DisableControls;
  tbConst.DisableControls;

  while not Kart.Eof do begin
    if (Kart.fieldbyName('SP36').AsString<>'') and (Kart.fieldbyName('ISMARK').AsString<>'*') then begin
      sFIO:=ANSIUpperCase(Kart.fieldbyName(K_FAM).AsString+Kart.fieldbyName(K_NAME).AsString+Kart.fieldbyName(K_OTCH).AsString);
      sFIOD:=Kart.fieldbyName(K_FAM).AsString+' '+Kart.fieldbyName(K_NAME).AsString+' '+Kart.fieldbyName(K_OTCH).AsString;
      sGSK:=Trim(Kart.fieldbyName(K_GSK).AsString);
      sLichNomer:='';
      sID1C:=Kart.fieldbyName('ID').AsString;
      if (sGSK<>'') then begin
        KartSem.SetRange([sID1C],[sID1C]);   //см. MasterSource
        while not KartSem.Eof do begin
          s:=Trim(KartSem.FieldByName(S_FAM).AsString);
          if (s<>'') and (KartSem.FieldByName('ISMARK').AsString<>'*') then begin
            if sFIO=ANSIUpperCase(KartSem.fieldbyName(S_FAM).AsString+KartSem.fieldbyName(S_NAME).AsString+KartSem.fieldbyName(S_OTCH).AsString) then begin
              sLichNomer:=CheckLichNom(true, kartSem.FieldByName(S_IN).AsString);
              if SprGSK.FindKey([Kart.fieldbyName(K_GSK).AsString]) then begin
                ss:=Trim(SprLgot.FieldByName('SP31').AsString);
                s:=Trim(SprLgot.FieldByName('DESCR').AsString);
                if s<>'' then begin
                  if dmBase.tbMens.Locate('LICH_NOMER',sLichNomer,[]) then begin
                    if dmBase.tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([0,dmBase.tbMens.FieldByName('ID').AsInteger],[]) then begin
                      dmBase.tbOchered.Edit;
                      dmBase.tbOchered.FieldByName('GSK').AsString:=s;
                      dmBase.tbOchered.Post;
                    end;
                  end;
                end;
              end;
            end;
          end;
          KartSem.Next;
        end;
      end;
    end;
    Label2.Caption:=IntToStr(n);
    Application.ProcessMessages;
    n:=n+1;
    Kart.Next;
  end;

  SemLgot.EnableControls;
  kart.EnableControls;
  KartSem.EnableControls;
  KartLgot.EnableControls;
  kartA.EnableControls;
  KartASem.EnableControls;
  tbConst.EnableControls;
end;

end.
