unit dAdres;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MetaTask, uTypes,uProjectAll,
  dDokument, Db, kbmMemTable, dbFunc, FuncPr, mPermit, dMen
 {$IFDEF VER150} ,Variants, FR_DSet, FR_DBSet {$ENDIF}  ;

type
  TdmAdres = class(TdmDokument)
    mtDokumentPUNKT: TIntegerField;
    mtDokumentUL: TIntegerField;
    mtDokumentDOM: TStringField;
    mtDokumentKORP: TStringField;
    mtDokumentKV: TStringField;
    mtDokumentTIP: TIntegerField;
    mtDokumentPRIM: TMemoField;
    mtLichSchet: TkbmMemTable;
    mtLichSchetNOMER: TStringField;
    mtLichSchetFIRST: TIntegerField;
    mtLichSchetFIO: TStringField;
    mtLichSchetKNIGA_NOMER: TStringField;
    mtLichSchetKNIGA_STR: TStringField;
    mtDokumentOSNOV: TMemoField;
    tbHouseProps: TkbmMemTable;
    tbHousePropsKOD: TSmallintField;
    tbHouseOwners: TkbmMemTable;
    tbHouseOwnersDATES: TDateField;
    tbHouseOwnersTAIL: TStringField;
    tbHouseOwnersPRIM: TMemoField;
    tbHouseOwnersNOMER: TSmallintField;
    tbHouseOwnersDATEP: TDateField;
    tbHouseOwnersTYPEKOD: TSmallintField;
    tbHouseOwnersKOD: TIntegerField;
    tbHouseOwnersADRES: TStringField;
    tbHouseOwnersNAME: TStringField;
    tbHouseOwnersPROPIS: TBooleanField;
    mtDokumentUCH_NOMER: TStringField;
    mtDokumentETAG: TIntegerField;
    mtDokumentKOL_ETAG: TIntegerField;
    mtDokumentPREDST: TIntegerField;
    mtDokumentGILFOND: TSmallintField;
    mtBigHouse: TkbmMemTable;
    mtBigHousePUNKT: TIntegerField;
    mtBigHouseUL: TIntegerField;
    mtBigHouseDOM: TStringField;
    mtBigHouseNAME: TStringField;
    mtBigHouseKOL_ETAG: TSmallintField;
    mtBigHouseKOL_KV: TSmallintField;
    mtBigHouseGILOE: TBooleanField;
    mtBigHouseOTDELNO: TBooleanField;
    mtBigHouseCHET: TBooleanField;
    mtBigHouseID: TIntegerField;
    mtBigHouseGOD_VOZV: TSmallintField;
    mtBigHouseMAT_STEN: TSmallintField;
    mtBigHouseTIP: TIntegerField;
    mtBigHouseKORP: TStringField;
    tbHouseOwnersHist: TkbmMemTable;
    tbHouseOwnersHistNOMER: TSmallintField;
    tbHouseOwnersHistTYPEKOD: TSmallintField;
    tbHouseOwnersHistKOD: TIntegerField;
    tbHouseOwnersHistTAIL: TStringField;
    tbHouseOwnersHistDATES: TDateField;
    tbHouseOwnersHistDATEP: TDateField;
    tbHouseOwnersHistADRES: TStringField;
    tbHouseOwnersHistPRIM: TMemoField;
    tbHouseOwnersHistNAME: TStringField;
    tbHouseOwnersHistDATE_ROGD: TDateField;
    tbHouseOwnersHistDATE_SMER: TDateField;
    tbHouseOwnersHistLICH_NOMER: TStringField;
    tbHouseOwnersHistUNP: TStringField;
    tbHouseOwnersHistPASSPORT: TMemoField;
    tbHouseOwnersHistTELEFON: TStringField;
    tbHouseOwnersHistNAME_MEN: TStringField;
    tbHouseOwnersHistOTCH_MEN: TStringField;
    mtDokumentNOT_DOM: TBooleanField;
    mtLichSchetTELEFON: TStringField;
    mtLichSchetDATE_SOZD: TDateField;
    mtLichSchetDATE_LIKV: TDateField;
    mtLichSchetCANDELETE: TBooleanField;
    mtLichSchetPRESENT: TBooleanField;
    mtLichSchetOWN_HOUSE: TBooleanField;
    mtLichSchetTYPEHOUSE: TIntegerField;
    mtBigHouseKANALIZ: TBooleanField;
    mtBigHouseCENT_OTOP: TBooleanField;
    mtBigHouseGOR_VODA: TBooleanField;
    mtBigHouseVODOPROV: TBooleanField;
    mtBigHouseGAZ: TBooleanField;
    mtBigHouseLIFT: TBooleanField;
    mtBigHouseMUSOROPR: TBooleanField;
    mtBigHousePRIVATE_SECT: TBooleanField;
    mtBigHouseCONTROL: TIntegerField;
    mtDokumentOSNOV_DATE: TDateField;
    mtBigHousePLOSH_ZDAN: TFloatField;
    mtDokumentDATE_KN: TDateField;
    mtDokumentKOLVO_KN: TSmallintField;
    mtBigHouseUSE_GILFOND: TIntegerField;
    mtBigHouseTYPE_VOZV: TIntegerField;
    mtDokumentABONENT_GAZ: TStringField;
    mtDokumentMS_DATE: TDateField;
    mtDokumentMS_API: TSmallintField;
    mtDokumentMS_OUT: TSmallintField;
    mtDokumentMS_OTOPL: TBooleanField;
    mtDokumentMS_ELPR: TBooleanField;
    mtDokumentMS_PRIM: TMemoField;
    mtDokumentMS_ZA_PRED: TBooleanField;
    mtDokumentSPEC_UCH: TBooleanField;
    mtDokumentUCH_ISKL_DATE: TDateField;
    mtDokumentUCH_ISKL_OSNOV: TMemoField;
    mtDokumentOSNOV_NOMER: TStringField;
    mtDokumentPLOSH_UCH: TFloatField;
    mtDokumentUCH_PRED_DATE: TDateField;
    mtDokumentUCH_FOR: TSmallintField;
    mtDokumentNOM_XOZ: TIntegerField;
    mtDokumentUL_NAME: TStringField;
    mtDokumentPUNKT_NAME: TStringField;
    mtDokumentNAMEHOUSE: TStringField;
    mtDokumentADRES_TEXT: TStringField;
    mtDokumentUCH_PRIM: TMemoField;
    mtDokumentUCH_TYPEOWNER: TIntegerField;
  private
    FdmMens: TdmMen;
    procedure SetdmMens(const Value: TdmMen);
  public
    property  dmMens : TdmMen read FdmMens write SetdmMens;
    procedure RemoveToHist;
    function  ReadDokument( ID : Integer; slPar : TStringList=nil) : Boolean; override;
    function  WriteDokument(f:TForm=nil) : Boolean; override;
    function  PostDokument : Boolean; override;
    function  CancelDokument : Boolean; override;
    function  CheckDokument(var strErr : String) : Boolean; override;
    function GetVid: String; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

var
  dmAdres: TdmAdres;

implementation

uses dBase, uProject;

{$R *.DFM}

{ TdmAdres }

constructor TdmAdres.Create(Owner: TComponent);
begin
  inherited;
  FTypeObj:=_TypeObj_Adres;
  FdmMens:=nil;
  ListDopRazdel.AddObject('1', nil);
  ListDopRazdel.AddObject('2', nil);
  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,mtDokument,'Adres','Текущий документ адреса');
    CreatefrxDBdataSet(self,mtBigHouse,'BigHouse','Свойства дома');
    CreatefrxDBdataSet(self,tbDopProp,'Adres_Prop','Свойства адреса');
    CreatefrxDBdataSet(self,mtLichSchet,'Adres_LicSchet','Лицевые счета адреса');
    CreatefrxDBdataSet(self,tbHouseOwners,'Adres_Owners','Владельцы адреса');
    CreatefrxDBdataSet(self,tbHouseOwnersHist,'Adres_OwnersHist','История владельцев адреса');
    CreatefrxDBdataSet(self,tbHouseProps,'Adres_Props','Свойства адреса');
    CreatefrxDBdataSet(self,tbResh,'Adres_Resh','Решения по адресу');
    CreatefrxDBdataSet(self,tbNalogi,'Adres_Nalogi','Налоги адреса');
  {$ENDIF}
end;

destructor TdmAdres.Destroy;
begin
  inherited;
end;

function TdmAdres.GetVid: String;
begin                             
  Result := 'ADRES';
end;                                

function TdmAdres.CancelDokument: Boolean;
begin
  Result := false;
end;

function TdmAdres.CheckDokument(var strErr: String): Boolean;
var
  nUL : Integer;
begin
  strErr := '';
  Result := true;
  if mtDokumentPUNKT.AsString = '' then begin
    strErr := 'Заполните населенный пункт !';
  end else begin
    if mtDokumentUL.AsString = ''
      then nUL := -1
      else nUL := mtDokumentUL.AsInteger;
    if dmBase.FindAdres(DateFiks, mtDokumentPUNKT.AsInteger, nUL,
         mtDokumentDOM.AsString, mtDokumentKORP.AsString, mtDokumentKV.AsString,
         mtDokumentID.AsInteger) then begin
      strErr := 'Введенный адрес уже существует !';
    end;
  end;
  if strErr <> '' then begin
    Result := false;
  end;
end;

function TdmAdres.PostDokument: Boolean;
begin
  PostDataSet(mtDokument);
  PostDataSet(tbDopProp);
  PostDataSet(tbHouseOwners);
  PostDataSet(tbHouseOwnersHist);
  PostDataSet(tbHouseProps);
  PostDataSet(tbNalogi);
  {$IFDEF LAIS}
  PostDataSet(tbResh);
  {$ENDIF}
  PostDataSet(mtBigHouse);
  Result := true;
end;

function TdmAdres.ReadDokument(ID: Integer; slPar : TStringList): Boolean;
var
  old : TCursor;
  vKeyValues : Variant;
  dsMen : TDataSet;
  lErr, lFind : Boolean;
  i,n : Integer;
  adr : TAdres;
  slLich:TstringList;
  fld:TField;
begin
  Result := true;
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := DateFiks;
    vKeyValues[1] := ID;
    lFind := dmBase.tbAdres.Locate('DATE_FIKS;ID', vKeyValues, []);
    mtDokument.First;
    while not mtDokument.Eof do mtDokument.Delete;
    mtDokument.Append;
    mtDokumentID.AsInteger := -1;
    mtDokumentDATE_FIKS.AsDateTime := DateFiks;
    mtDokumentNOMER.AsString := '';
    if not lFind then begin
      // для того, что-бы почистить значения и проставить у них типы объектов
      EditDataSet(tbDopProp);
      for i:=0 to ListDopRazdel.Count-1 do begin
        dmBase.ReadPropFields( dmBase.TypeObj_Adres, ListDopRazdel.Strings[i] , DateFiks, -1, tbDopProp, lErr);
      end;
      PostDataSet(tbDopProp);
      tbNalogi.EmptyTable;
      Result := false;
    end else begin
      try
        lErr := false;
        with dmBase.tbAdres do begin
          WriteField( mtDokumentID,  FieldByName('ID'), lErr );
          WriteField( mtDokumentPUNKT,  FieldByName('PUNKT'), lErr );
          WriteField( mtDokumentUL,  FieldByName('UL'), lErr );
          WriteField( mtDokumentDOM,  FieldByName('DOM'), lErr );
          WriteField( mtDokumentKORP,  FieldByName('KORP'), lErr );
          WriteField( mtDokumentKV,  FieldByName('KV'), lErr );
          WriteField( mtDokumentTIP,  FieldByName('TIP'), lErr );
          WriteField( mtDokumentPRIM,  FieldByName('PRIM'), lErr );
          n:=Pos('#',mtDokumentPRIM.AsString);
          if n>0 then begin
            mtDokumentUCH_PRIM.AsString:=Copy(mtDokumentPRIM.AsString,n+1,Length(mtDokumentPRIM.AsString));
            mtDokumentPRIM.AsString:=Copy(mtDokumentPRIM.AsString,1,n-1);
          end;
          WriteField( mtDokumentNOM_XOZ,  FieldByName('VID'), lErr );             // !!! VID => NOM_XOZ
          WriteField( mtDokumentUCH_TYPEOWNER, FieldByName('HOUSE_ID'), lErr );   // !!! HOUSE_ID => UCH_TYPEOWNER

          WriteField( mtDokumentETAG,  FieldByName('ETAG'), lErr );
          WriteField( mtDokumentKOL_ETAG,  FieldByName('KOL_ETAG'), lErr );
          WriteField( mtDokumentPREDST,  FieldByName('PREDST'), lErr );
          WriteField( mtDokumentGILFOND,  FieldByName('GILFOND'), lErr );
//          WriteField( mtDokumentCHET,  FieldByName('CHET'), lErr );
//          WriteField( mtDokumentOTDELNO,  FieldByName('OTDELNO'), lErr );
          WriteField( mtDokumentOSNOV,  FieldByName('OSNOV'), lErr );
          WriteDateField(mtDokumentOSNOV_DATE, FieldByName('OSNOV_DATE'));
          {$IFDEF LAIS}
          WriteField(mtDokumentOSNOV_NOMER, FieldByName('OSNOV_NOMER'), lErr);
          {$ENDIF}
          WriteField( mtDokumentKOLVO_KN,  FieldByName('KOLVO_KN'), lErr );
          WriteField( mtDokumentABONENT_GAZ,  FieldByName('ABONENT_GAZ'), lErr );
          WriteDateField(mtDokumentDATE_KN, FieldByName('DATE_KN'));
          WriteField(mtDokumentSPEC_UCH, FieldByName('SPEC_UCH'),lErr);
          if mtDokumentSPEC_UCH.IsNull then mtDokumentSPEC_UCH.AsBoolean:=false;

          if FieldByName('NOT_DOM').IsNull or not FieldByName('NOT_DOM').AsBoolean
            then mtDokumentNOT_DOM.AsBoolean:=false
            else mtDokumentNOT_DOM.AsBoolean:=true;

          if mtDokumentGILFOND.AsString='' then mtDokumentGILFOND.AsInteger:=0;

          WriteDateField(mtDokumentMS_DATE, FieldByName('MS_DATE'));
          WriteField( mtDokumentMS_API,  FieldByName('MS_API'), lErr );
          WriteField( mtDokumentMS_OUT,  FieldByName('MS_OUT'), lErr );
          WriteField( mtDokumentMS_OTOPL,  FieldByName('MS_OTOPL'), lErr );
          WriteField( mtDokumentMS_ELPR,  FieldByName('MS_ELPR'), lErr );
          WriteField( mtDokumentMS_ZA_PRED,  FieldByName('MS_ZA_PRED'), lErr );
          mtDokumentMS_PRIM.AsString:=dmBase.ReadPropAsText(DateFiks, ID, 'MS_PRIM');
          
          //------- участок ----------------
          WriteField( mtDokumentPLOSH_UCH,  FieldByName('PLOSH_UCH'), lErr );
          mtDokumentUCH_NOMER.AsString:=FieldByName('UCH_NOMER').AsString;
          mtDokumentUCH_FOR.AsString:=FieldByName('UCH_FOR').AsString;
          WriteDateField( mtDokumentUCH_PRED_DATE,  FieldByName('UCH_PRED_DATE'));
          WriteDateField( mtDokumentUCH_ISKL_DATE,  FieldByName('UCH_ISKL_DATE'));
          mtDokumentUCH_ISKL_OSNOV.AsString:=FieldByName('UCH_ISKL_OSNOV').AsString;
          //--------------------------------

          EditDataSet(tbDopProp);
          for i:=0 to ListDopRazdel.Count-1 do begin
            dmBase.ReadPropFields( dmBase.TypeObj_Adres, ListDopRazdel.Strings[i] , DateFiks, ID, tbDopProp, lErr);
          end;
          fld:=tbDopProp.FindField('TYPE_VOZV');
          if fld<>nil then begin
            if (fld.AsString='') or (fld.AsString='0') then begin
              fld.AsInteger:=1;  // тип года постройки по умолчанию равен "Год постройки"
            end;
          end;
          PostDataSet(tbDopProp);
                      
        end;
        //----- Лицевые счета ------------------------------------------
        slLich:=TStringList.Create;

        mtLichSchet.EmptyTable;
        dmBase.tbLich.IndexName := 'ADRES_KEY';
        dmBase.tbLich.SetRange([DateFiks,ID],[DateFiks,ID]);
        while not dmBase.tbLich.Eof do begin

          if GlobalTask.ParamAsBoolean('READ_ALL_LIC') or not dmBase.tbLich.FieldByName('CANDELETE').AsBoolean then begin
            slLich.Add(dmBase.tbLich.FieldByName('ID').AsString);

            mtLichSchet.Append;
            mtLichSchetNOMER.AsString := dmBase.tbLich.FieldByName('NOMER').AsString;
            mtLichSchetFIRST.AsString := dmBase.tbLich.FieldByName('FIRST').AsString;
            if mtLichSchetFIRST.AsString<>'' then begin
              dsMen := dmBase.GetMen(DateFiks, mtLichSchetFIRST.AsString);
              if dsMen <> nil then begin
                mtLichSchetFIO.AsString := Trim(dsMen.FieldByName('FAMILIA').AsString)+
                  ' '+Trim(dsMen.FieldByName('NAME').AsString)+' '+
                  Trim(dsMen.FieldByName('OTCH').AsString);
              end;
            end;
            mtLichSchetKNIGA_NOMER.AsString := trim(dmBase.tbLich.FieldByName('KNIGA_NOMER').AsString);
            mtLichSchetKNIGA_STR.AsString := trim(dmBase.tbLich.FieldByName('KNIGA_STR').AsString);
            mtLichSchetTELEFON.AsString := dmBase.tbLich.FieldByName('TELEFON').AsString;
            if not dmBase.tbLich.FieldByName('DATE_SOZD').IsNull then mtLichSchetDATE_SOZD.AsDateTime := dmBase.tbLich.FieldByName('DATE_SOZD').AsDateTime;
            if not dmBase.tbLich.FieldByName('DATE_LIKV').IsNull then mtLichSchetDATE_LIKV.AsDateTime := dmBase.tbLich.FieldByName('DATE_LIKV').AsDateTime;
            mtLichSchetCANDELETE.AsBoolean := dmBase.tbLich.FieldByName('CANDELETE').AsBoolean;
            mtLichSchetPRESENT.AsBoolean := dmBase.tbLich.FieldByName('PRESENT').AsBoolean;
            mtLichSchetOWN_HOUSE.AsBoolean := dmBase.tbLich.FieldByName('OWN_HOUSE').AsBoolean;
            mtLichSchetTYPEHOUSE.AsString := dmBase.tbLich.FieldByName('TYPEHOUSE').AsString;
            mtLichSchet.Post;
          end;
          dmBase.tbLich.Next;
        end;
        dmBase.tbLich.CancelRange;

        //----- Налоги ------------------------------------------
        ReadNalogi(_TypeObj_Adres, -1, ID, nil, slLich);
        //----- Люди проживающие по адресу --------------------------
        slLich.Add('0');  // для того чтобы прочитались люди без лицевого счета
        dmMens.ReadAllMensAdres(slLich, ID, nil);
        slLich.Free;

        //----- Владельцы ------------------------------------------
        dmBase.LoadHouseOwners(ID,DateFiks,tbHouseOwners,tbHouseOwnersHist);


        //------- Хар-ки здания --------------------------------------
        adr.Punkt:=mtDokumentPUNKT.AsString; // нас. пункт
        adr.Ulica:=mtDokumentUL.AsString;   //  улица
        adr.Dom:=dmBase.GetNomerDom(mtDokumentDOM.AsString);
        adr.Korp:=dmBase.GetNomerDom(mtDokumentKORP.AsString);

        EditDataSet(tbDopProp);

        dmBase.LoadBigHouseProp(adr, DateFiks, mtBigHouse);
        if mtBigHouseKOL_ETAG.AsString<>''
          then mtDokumentKOL_ETAG.AsInteger:=mtBigHouseKOL_ETAG.AsInteger;

//        if mtBigHouseTIP.AsString<>''
//          then mtDokumentTIP.AsString:=mtBigHouseTIP.AsString;
          
        if mtBigHouseGOD_VOZV.AsString<>''
          then tbDopProp.FieldByName('GOD_VOZV').AsString:=mtBigHouseGOD_VOZV.AsString;
        if mtBigHouseTYPE_VOZV.AsString<>''
          then tbDopProp.FieldByName('TYPE_VOZV').AsString:=mtBigHouseTYPE_VOZV.AsString;
//   боровляны
//        if mtBigHousePLOSH_ZDAN.AsString<>''
//          then tbDopProp.FieldByName('PLOSH_ZDAN').AsFloat:=mtBigHousePLOSH_ZDAN.AsFloat;

        if mtBigHouseMAT_STEN.AsString<>''
          then tbDopProp.FieldByName('MAT_STEN').AsString:=mtBigHouseMAT_STEN.AsString;

        {$IFDEF GKH}
          if mtBigHouseKANALIZ.AsString<>'' then tbDopProp.FieldByName('KANALIZ').AsBoolean:=mtBigHouseKANALIZ.AsBoolean;
          if mtBigHouseCENT_OTOP.AsString<>'' then tbDopProp.FieldByName('CENT_OTOP').AsBoolean:=mtBigHouseCENT_OTOP.AsBoolean;
          if mtBigHouseGOR_VODA.AsString<>'' then tbDopProp.FieldByName('GOR_VODA').AsBoolean:=mtBigHouseGOR_VODA.AsBoolean;
          if mtBigHouseVODOPROV.AsString<>'' then tbDopProp.FieldByName('VODOPROV').AsBoolean:=mtBigHouseVODOPROV.AsBoolean;
          if mtBigHouseGAZ.AsString<>'' then tbDopProp.FieldByName('GAZ').AsBoolean:=mtBigHouseGAZ.AsBoolean;
          if mtBigHouseLIFT.AsString<>'' then tbDopProp.FieldByName('LIFT').AsBoolean:=mtBigHouseLIFT.AsBoolean;
          if mtBigHouseMUSOROPR.AsString<>'' then tbDopProp.FieldByName('MUSOROPR').AsBoolean:=mtBigHouseMUSOROPR.AsBoolean;
        {$ENDIF}
        if tbDopProp.FieldByName('PLOSH_ZDAN').AsInteger=0 then tbDopProp.FieldByName('PLOSH_ZDAN').AsString:='';

        PostDataSet(tbDopProp);

        if mtDokumentKOL_ETAG.AsInteger=0 then mtDokumentKOL_ETAG.AsString:='';

        //----- Признаки ------------------------------------------
        tbHouseProps.EmptyTable;
        dmBase.tbHouseProps.IndexName := 'PR_KEY';
        dmBase.tbHouseProps.SetRange([DateFiks,ID],[DateFiks,ID]);
        while not dmBase.tbHouseProps.Eof do begin
          tbHouseProps.Append;
          tbHousePropsKOD.AsString := dmBase.tbHouseProps.FieldByName('KOD').AsString;
          if tbHousePropsKOD.AsString<>''
            then tbHouseProps.Post;
          dmBase.tbHouseProps.Next;
        end;
        dmBase.tbHouseProps.CancelRange;

        //----- Решения ------------------------------------------
        {$IFDEF LAIS}
        {
        tbResh.EmptyTable;
        dmBase.tbResh.IndexName := 'PR_KEY';
        dmBase.tbResh.SetRange([ID],[ID]);
        while not dmBase.tbResh.Eof do begin
          tbResh.Append;
          tbReshTIP.AsString   := dmBase.tbResh.FieldByName('TIP').AsString;
          tbReshDATER.Value    := dmBase.tbResh.FieldByName('DATER').Value;
          tbReshNOMER.AsString := dmBase.tbResh.FieldByName('NOMER').AsString;
          tbReshPRIM.AsString  := dmBase.tbResh.FieldByName('PRIM').AsString;
          tbResh.Post;
          dmBase.tbResh.Next;
        end;
        dmBase.tbResh.CancelRange;
        }
        {$ENDIF}

      except
        on E: Exception do begin
          PutError(E.Message);
          Result := false;
        end;
      end;
      if lErr then Result := false;
    end;
    if mtDokumentID.AsInteger <= 0 then begin
      AfterCreateDokument;
    end else begin

      mtDokumentADRES_TEXT.AsString:=dmBase.AdresFromID(DateFiks,mtDokumentID.AsString,true);
      mtDokumentPUNKT_NAME.AsString:=dmBase.Adres_Punkt;
      mtDokumentUL_NAME.AsString:=dmBase.Adres_UL;
      mtDokumentNAMEHOUSE.AsString:=dmBase.Adres_NameHouse;

      AfterReadDokument;
    end;
    PostDataSet(mtDokument);
  finally
    Screen.Cursor := old;
  end;
end;

//----------------------------------------------------------
function TdmAdres.WriteDokument(f:TForm): Boolean;
var
  vKeyValues : Variant;
  lErr, lFind, lNew : Boolean;
  ID : Integer;
  strErr : String;
  old : TCursor;
  strDom, strKorp, strKv : String;
  adr : TAdres;
  fld:TField;
begin
  PostDokument;
  Result := CheckDokument(strErr);
  if not Result then begin
    Beep;
    PutError(strErr);
    exit;
  end;
//  dmBase.AdsConnection.BeginTransaction;
  lNew:=false;
  // новый адрес
  if mtDokumentID.IsNull or (mtDokumentID.AsInteger<1) then begin
    ID := dmBase.GetNewID( dmBase.TypeObj_Adres );
    EditDataSet(mtDokument);
    mtDokumentID.AsInteger := ID;
    lNew:=true;
  end else begin
    ID := mtDokumentID.AsInteger;
  end;
  PostDataSet(mtDokument);
  // ошибка при выдаче нового ID
  if ID<=0 then exit;
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := DateFiks;
    vKeyValues[1] := ID;
    lFind := dmBase.tbAdres.Locate('DATE_FIKS;ID', vKeyValues, []);
    if not lFind then begin
      dmBase.tbAdres.Append;
      dmBase.tbAdres.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
      dmBase.tbAdres.FieldByName('ID').AsInteger := ID;
    end else begin
      dmBase.tbAdres.Edit;
    end;
    with dmBase.tbAdres do begin
      try
        lErr := false;
//        WriteField( FieldByName('NOMER'), mtDokumentNOMER,  lErr );
        if lNew then begin
          WriteField( FieldByName('ID'), mtDokumentID,  lErr );
          WriteField( FieldByName('PUNKT'), mtDokumentPUNKT, lErr );
          WriteField( FieldByName('UL'), mtDokumentUL, lErr );

          if Trim(mtDokumentDOM.AsString)=''
            then strDom := ''
            else strDom := dmBase.GetNomerDom(mtDokumentDOM.AsString);
          if Trim(mtDokumentKORP.AsString)=''
            then strKorp := ''
            else strKorp := dmBase.GetNomerDom(mtDokumentKORP.AsString);
          if Trim(mtDokumentKV.AsString)=''
            then strKv := ''
            else strKv := dmBase.GetNomerDom(mtDokumentKV.AsString);

          FieldByName('DOM').AsString  := strDom;
//          if strDom<>'' then strKorp:='';
          FieldByName('KORP').AsString := strKorp;
          FieldByName('KV').AsString   := strKv;
        end;
        WriteField( FieldByName('UCH_NOMER'), mtDokumentUCH_NOMER, lErr );

        //---- участок ----------------
        WriteField( FieldByName('PLOSH_UCH'), mtDokumentPLOSH_UCH, lErr );
        FieldByName('UCH_NOMER').AsString:=mtDokumentUCH_NOMER.AsString;
        FieldByName('UCH_FOR').AsString:=mtDokumentUCH_FOR.AsString;
        WriteDateField( FieldByName('UCH_PRED_DATE'), mtDokumentUCH_PRED_DATE );
        WriteDateField( FieldByName('UCH_ISKL_DATE'), mtDokumentUCH_ISKL_DATE);
        FieldByName('UCH_ISKL_OSNOV').AsString:=mtDokumentUCH_ISKL_OSNOV.AsString;
        //--------------------------------

        WriteField( FieldByName('TIP'), mtDokumentTIP, lErr );

        if Trim(mtDokumentUCH_PRIM.AsString)<>''
          then FieldByName('PRIM').AsString:=mtDokumentPRIM.AsString+'#'+mtDokumentUCH_PRIM.AsString
          else FieldByName('PRIM').AsString:=mtDokumentPRIM.AsString;

        WriteField( FieldByName('VID'), mtDokumentNOM_XOZ, lErr );   // !!! NOM_XOZ => VID !!!
        WriteField( FieldByName('HOUSE_ID'), mtDokumentUCH_TYPEOWNER, lErr );   // !!! UCH_TYPEOWNER => HOUSE_ID !!!

        WriteField( FieldByName('ETAG'), mtDokumentETAG, lErr );
        WriteField( FieldByName('KOL_ETAG'), mtDokumentKOL_ETAG, lErr );
        WriteField( FieldByName('ABONENT_GAZ'), mtDokumentABONENT_GAZ, lErr );
        WriteField( FieldByName('PREDST'), mtDokumentPREDST, lErr );
        WriteField( FieldByName('NOT_DOM'), mtDokumentNOT_DOM, lErr );

        FieldByName('SPEC_UCH').AsBoolean:=mtDokumentSPEC_UCH.AsBoolean;

        if mtDokumentGILFOND.AsString=''
          then FieldByName('GILFOND').AsInteger := 0
          else FieldByName('GILFOND').AsInteger := mtDokumentGILFOND.AsInteger;
        WriteField( FieldByName('OSNOV'), mtDokumentOSNOV, lErr );
        WriteDateField( FieldByName('OSNOV_DATE'), mtDokumentOSNOV_DATE);
        {$IFDEF LAIS}
        FieldByName('OSNOV_NOMER').AsString:=mtDokumentOSNOV_NOMER.AsString;
        {$ENDIF}
        WriteField( FieldByName('KOLVO_KN'), mtDokumentKOLVO_KN, lErr );
        WriteDateField( FieldByName('DATE_KN'), mtDokumentDATE_KN);

        FieldByName('CONTROL').AsString:=mtBigHouseCONTROL.AsString;
        FieldByName('USE_GILFOND').AsString:=mtBigHouseUSE_GILFOND.AsString;
        FieldByName('PRIVATE_SECT').AsBoolean:=mtBigHousePRIVATE_SECT.AsBoolean; // !!!

          WriteDateField(FieldByName('MS_DATE'),mtDokumentMS_DATE);
          WriteField(FieldByName('MS_API'),mtDokumentMS_API,lErr );
          WriteField(FieldByName('MS_OUT'),mtDokumentMS_OUT,lErr );
          WriteField(FieldByName('MS_OTOPL'),mtDokumentMS_OTOPL,lErr );
          WriteField(FieldByName('MS_ELPR'),mtDokumentMS_ELPR,lErr );
          WriteField(FieldByName('MS_ZA_PRED'),mtDokumentMS_ZA_PRED,lErr );
          dmBase.WriteFieldProp( DateFiks, 'MS_PRIM', mtDokumentMS_PRIM, ID, dmBase.TypeObj_Adres, ftMemo);

//        if mtDokumentCHET.IsNull then begin
//          n := CheckChetNomer(strDom,strKorp);
//          if n>0 then FieldByName('CHET').AsBoolean := (n=2)
//                 else FieldByName('CHET').AsString := '';
//        end else begin
//          WriteField(FieldByName('CHET'), mtDokumentCHET, lErr );
//        end;

//        if mtDokumentOTDELNO.IsNull
//          then FieldByName('OTDELNO').AsBoolean := false
//          else WriteField(FieldByName('OTDELNO'), mtDokumentOTDELNO, lErr );

        Post;

        fld:=tbDopProp.FindField('TYPE_VOZV');
        if fld<>nil then begin
          if (fld.AsString='') or (fld.AsString='0') then begin
            EditDataSet(tbDopProp);
            fld.AsInteger:=1;  // тип года постройки по умолчанию равен "Год постройки"
          end;
          if fld.AsInteger>2 then begin   // не "год постройки", не "год переноса"
           EditDataSet(tbDopProp);
           tbDopProp.FieldByName('GOD_VOZV').AsString:='';   // чистим год возведения
          end;
          PostDataSet(tbDopProp);
        end;

        dmBase.WriteProp( DateFiks, ID, tbDopProp, '', dmBase.TypeObj_Adres);

        //----------------------------------------------------------------------
        // если включен автоперенос в историю собственников
        if GlobalTask.ParamAsBoolean('AUTO_HIST_SB') then begin
          tbHouseOwners.First;
          while not tbHouseOwners.Eof do begin
            if not tbHouseOwners.FieldByName('DATEP').IsNull and
              (dmBase.GetCurDate>=tbHouseOwners.FieldByName('DATEP').AsDateTime) then begin
              RemoveToHist;
            end else begin
              tbHouseOwners.Next;
            end;
          end;
        end;

        //----- Владельцы ------------------------------------------------------
        dmBase.SaveHouseOwners(ID, DateFiks, tbHouseOwners, tbHouseOwnersHist);
        //----- налоги ------------------------------------------------------
        WriteNalogi(_TypeObj_Adres, ID);
        //----- Признаки ------------------------------------------------------
        dmBase.DeleteFromList( dmBase.tbHouseProps, DateFiks, ID);
        tbHouseProps.First;
        while not tbHouseProps.Eof do begin
          if not tbHousePropsKOD.IsNull then begin
            dmBase.tbHouseProps.Append;
            dmBase.tbHouseProps.FieldByName('DATE_FIKS').Value := DateFiks;
            dmBase.tbHouseProps.FieldByName('ID').Value  := ID;
            dmBase.tbHouseProps.FieldByName('KOD').AsString := tbHousePropsKOD.AsString;
            try
              dmBase.tbHouseProps.Post;
            except
              dmBase.tbHouseProps.Cancel;
            end;
          end;
          tbHouseProps.Next;
        end;
        tbHouseProps.First;

        //----- решения ------------------------------------------------------
        {$IFDEF LAIS}
        {
        dmBase.tbResh.IndexName:='PR_KEY';
        while dmBase.tbResh.FindKey([ID]) do dmBase.tbResh.Delete;
        tbResh.First;
        while not tbResh.Eof do begin
          if not tbReshDATER.IsNull then begin
            dmBase.tbResh.Append;
            dmBase.tbResh.FieldByName('ID').Value  := ID;
            dmBase.tbResh.FieldByName('DATER').Value := tbReshDATER.Value;
            dmBase.tbResh.FieldByName('ID').AsString := tbReshTIP.AsString;
            dmBase.tbResh.FieldByName('NOMER').AsString := tbReshNOMER.AsString;
            dmBase.tbResh.FieldByName('PRIM').AsString := tbReshPRIM.AsString;
            try
              dmBase.tbResh.Post;
            except
              dmBase.tbResh.Cancel;
            end;
          end;
          tbResh.Next;
        end;
        tbResh.First;
        }
        {$ENDIF}

        //----------- характеристики здания -------------------------
        adr.Punkt:=mtDokumentPUNKT.AsString; // нас. пункт
        adr.Ulica:=mtDokumentUL.AsString;   //  улица
        adr.Dom:=dmBase.GetNomerDom(mtDokumentDOM.AsString);
        adr.Korp:=dmBase.GetNomerDom(mtDokumentKORP.AsString);
        mtBigHouse.CheckBrowseMode;
        mtBigHouse.Edit;
        mtBigHouseKOL_ETAG.AsInteger := mtDokumentKOL_ETAG.AsInteger;
        mtBigHouseTIP.AsString       := mtDokumentTIP.AsString;
        mtBigHouseGOD_VOZV.AsString  := tbDopProp.FieldByName('GOD_VOZV').AsString;
        mtBigHouseTYPE_VOZV.AsString := tbDopProp.FieldByName('TYPE_VOZV').AsString;
//  боровляны
//        mtBigHousePLOSH_ZDAN.AsFloat := tbDopProp.FieldByName('PLOSH_ZDAN').AsFloat;
        mtBigHouseMAT_STEN.AsString  := tbDopProp.FieldByName('MAT_STEN').AsString;

        {$IFDEF GKH}
          mtBigHouseKANALIZ.AsBoolean:=tbDopProp.FieldByName('KANALIZ').AsBoolean;
          mtBigHouseCENT_OTOP.AsBoolean:=tbDopProp.FieldByName('CENT_OTOP').AsBoolean;
          mtBigHouseGOR_VODA.AsBoolean:=tbDopProp.FieldByName('GOR_VODA').AsBoolean;
          mtBigHouseVODOPROV.AsBoolean:=tbDopProp.FieldByName('VODOPROV').AsBoolean;
          mtBigHouseGAZ.AsBoolean:=tbDopProp.FieldByName('GAZ').AsBoolean;
          mtBigHouseLIFT.AsBoolean:=tbDopProp.FieldByName('LIFT').AsBoolean;
          mtBigHouseMUSOROPR.AsBoolean:=tbDopProp.FieldByName('MUSOROPR').AsBoolean;
        {$ENDIF}

        mtBigHouse.Post;
        dmBase.SaveBigHouseProp(adr, DateFiks, mtBigHouse);

      except
        on E: Exception do begin
          PutError(E.Message);
          Result := false;
        end;
      end;
      if lErr then Result := false;
    end;
  finally
    Screen.Cursor := old;
  end;
end;

procedure TdmAdres.RemoveToHist;
var
  ds:TDataSet;
  pasp:TPassport;
begin
  tbHouseOwnersHist.Append;
  tbHouseOwnersHistNOMER.AsString:=tbHouseOwnersNOMER.AsString;
  tbHouseOwnersHistTYPEKOD.AsString:=tbHouseOwnersTYPEKOD.AsString;
  tbHouseOwnersHistKOD.AsString:=tbHouseOwnersKOD.AsString;
  tbHouseOwnersHistADRES.AsString:=tbHouseOwnersADRES.AsString;
  tbHouseOwnersHistNAME.AsString:=tbHouseOwnersNAME.AsString;
  tbHouseOwnersHistTAIL.AsString:=tbHouseOwnersTAIL.AsString;
  tbHouseOwnersHistPRIM.AsString:=tbHouseOwnersPRIM.AsString;
  WriteDateField(tbHouseOwnersHistDATES,tbHouseOwnersDATES);
  WriteDateField(tbHouseOwnersHistDATEP,tbHouseOwnersDATEP);
  if tbHouseOwnersHistTYPEKOD.AsInteger=OWNER_NASEL then begin
    ds:=dmBase.GetMen(DateFiks,tbHouseOwnersHistKOD.AsString);
    if ds<>nil then begin
      tbHouseOwnersHistNAME.AsString  := ds.FieldByName('FAMILIA').AsString;
      tbHouseOwnersHistNAME_MEN.AsString := ds.FieldByName('NAME').AsString;
      tbHouseOwnersHistOTCH_MEN.AsString := ds.FieldByName('OTCH').AsString;
      WriteDateField(tbHouseOwnersHistDATE_ROGD, ds.FieldByName('DATER'));
      WriteDateField(tbHouseOwnersHistDATE_SMER, ds.FieldByName('DATES'));
      tbHouseOwnersHistLICH_NOMER.AsString := ds.FieldByName('LICH_NOMER').AsString;
      tbHouseOwnersHistTELEFON.AsString := ds.FieldByName('TELEFON').AsString;
      pasp:=dmBase.PasportMen(dateFiks,tbHouseOwnersHistKOD.AsString);
      tbHouseOwnersHistPASSPORT.AsString:=dmBase.PasportToText(pasp,0);
    end;
  end else begin
//    if dmBase.SprWork.Locate('ID', tbHouseOwnersHistKOD.AsString,[]) then begin
//      tbHouseOwnersHistUNP.AsString:=dmBase.SprWork.FieldByName('UNP').AsString;  пока нет такого поля
//    end
  end;
  tbHouseOwnersHist.Post;
  tbHouseOwners.Delete;
end;

procedure TdmAdres.SetdmMens(const Value: TdmMen);
begin
  FdmMens := Value;
end;

end.
