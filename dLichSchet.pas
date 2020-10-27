unit dLichSchet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uTypes,
  dDokument, dMen, Db, kbmMemTable, FuncPr, DbFunc, FR_DSet, FR_DBSet,mPermit, uProjectAll,
  MetaTask
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

{$I Task.inc}

type
  TTypeFirst = ( tfNone, tfNormal, tfInternal );

  TdmLichSchet = class(TdmDokument)
    mtDokumentADRES_ID: TIntegerField;
    mtDokumentGRUPPA: TIntegerField;
    mtDokumentKADASTR: TStringField;
    mtDokumentFIRST: TIntegerField;
    mtDokumentKNIGA_NOMER: TStringField;
    mtDokumentKNIGA_STR: TStringField;
    tbPriznaki: TkbmMemTable;
    tbPriznakiKOD: TIntegerField;
    tbPriznakiNAME: TStringField;
    mtDokumentDOPOLN: TMemoField;
    mtDokumentOWN_HOUSE: TBooleanField;
    mtDokumentDATE_SOZD: TDateField;
    mtDokumentDATE_LIKV: TDateField;
    mtDokumentPRICH_SOZD: TIntegerField;
    mtDokumentPRICH_LIKV: TIntegerField;
    mtDokumentTYPEHOUSE: TIntegerField;
    mtDokumentNOMER_TWO_S: TIntegerField;
    mtDokumentNOMER_TWO_L: TIntegerField;
    frDBPriznaki: TfrDBDataSet;
    mtDokumentCANDELETE: TBooleanField;
    tbDokumens: TkbmMemTable;
    tbDokumensDate_Dok: TDateField;
    tbDokumensTypeDok: TIntegerField;
    tbDokumensSubject: TMemoField;
    tbDokumensKomm: TMemoField;
    tbDokumensNomer: TStringField;
    mtDokumentTELEFON: TStringField;
    mtDokumentTAIL: TStringField;
    mtDokumentPREDST: TIntegerField;
    mtDokumentETAG: TIntegerField;
    mtDokumentKOL_ETAG: TIntegerField;
    tbHouseOwners: TkbmMemTable;
    tbHouseOwnersNOMER: TSmallintField;
    tbHouseOwnersTYPEKOD: TSmallintField;
    tbHouseOwnersKOD: TIntegerField;
    tbHouseOwnersTAIL: TStringField;
    tbHouseOwnersDATES: TDateField;
    tbHouseOwnersDATEP: TDateField;
    tbHouseOwnersPRIM: TMemoField;
    tbHouseOwnersADRES: TStringField;
    tbHouseOwnersNAME: TStringField;
    tbHouseOwnersPROPIS: TBooleanField;
    mtDokumentPRESENT: TBooleanField;
    mtDokumentDOGOVOR: TMemoField;
    mtDokumentPRIVATE_SECT: TBooleanField;
    mtDokumentCONTROL: TIntegerField;
    mtDokumentOSNOV_ID: TIntegerField;
    mtDokumentOSNOV_DATE: TDateField;
    mtDokumentFIRST_FIO: TStringField;
    mtDokumentOSNOV_NOMER: TStringField;
    mtDokumentABONENT_GAZ: TStringField;
    mtDokumentNOT_STAT: TBooleanField;
    mtDokumentUSE_GILFOND: TIntegerField;
    mtDokumentPL_ZANIM: TFloatField;
    mtDokumentTAIL_HOUSE: TStringField;
    mtDokumentKOM_ZANIM: TSmallintField;
    mtDokumentDATE_LPX1: TDateField;
    mtDokumentDATE_LPX2: TDateField;
    mtDokumentMNS_LPX: TBooleanField;
    mtDokumentPLOSH_UCH: TFloatField;
    mtDokumentPUNKT: TIntegerField;
    mtDokumentPUNKT_NAME: TStringField;
    mtDokumentUL: TIntegerField;
    mtDokumentUL_NAME: TStringField;
    mtDokumentDOM: TStringField;
    mtDokumentKORP: TStringField;
    mtDokumentKV: TStringField;
    mtDokumentADRES_TEXT: TStringField;
    mtDokumentNAMEHOUSE: TStringField;
    mtDokumentNOT_DOM: TBooleanField;
    mtDokumentUCH_NOMER: TStringField;
  private
    FdmMens: TdmMen;
    FLastBook : String;
    procedure SetdmMens(const Value: TdmMen);
  public
    FCheckOwners:Boolean;     // формировать список собственникоа на автомате
    FNewMen:Boolean;
    LastNomerLic : String;
    TypeFirst : TTypeFirst;
    slIsklMens: TStringList;
    slDelMens : TStringList;
    slAddMens : TStringList;
    slPerevodMens : TStringList;
    slChangeIDMens:TStringList;
    property  dmMens : TdmMen read FdmMens write SetdmMens;

    function  CurOwnerOk(d:TDateTime) : Boolean;
    function  NanimOrOwners(sPar:String) : String;
    function  HouseOwners(sl : TStringList; nType : Integer) : String;
    function  ReadDokument( ID : Integer; slPar : TStringList=nil) : Boolean; override;
    function  WriteDokument(f:TForm=nil) : Boolean; override;
    function ReadRekvAdres : Boolean;
    function  PostDokument : Boolean; override;
    function  CancelDokument : Boolean; override;
    function  CheckDokument( var strErr : String) : Boolean; override;
    function GetVid : String; override;
    function ReadPropAdres( var lErr : Boolean)  : String;
    function WriteOwners( nIdFirst : Integer) : Boolean;
    function WritePropAdres : Boolean;
    function CheckFirst( var strErr : String) : Boolean;
    procedure AfterCreateDokument; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;


implementation

uses dBase, uProject, fMain;

{$R *.DFM}

{ TdmLichSchet }

constructor TdmLichSchet.Create(Owner: TComponent);
begin
  inherited;
  FTypeObj:=_TypeObj_Lich;
  OpenTableFactor;
  LastNomerLic:='';
  FLastBook := '';
//  if Globaltask.ParamAsInteger('VER_UCHET')<>1 then begin // версия от 4 июля 2011 года
    ListDopRazdel.AddObject('11', nil);
//  end else begin
//    ListDopRazdel.AddObject('1', nil);
//    ListDopRazdel.AddObject('2', nil);
//  end;
  slIsklMens:= TStringList.Create;
  slDelMens := TStringList.Create;
  slAddMens := TStringList.Create;
  slPerevodMens := TStringList.Create;
  slChangeIDMens:=TStringList.Create;
  FNewMen:=false;
//  ListDopRazdel.AddObject('3', nil);
  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,mtDokument,'Lic','Текущий лицевой счет');
    CreatefrxDBdataSet(self,tbDopProp,'Lic_Prop','Свойства лицевого счета');
    CreatefrxDBdataSet(self,tbPriznaki,'Lic_Priz','Признаки лицевого счета');
    CreatefrxDBdataSet(self,tbHouseOwners,'Lic_AdresOwners','Владельцы адреса');
    CreatefrxDBdataSet(self,tbNalogi,'Lic_Nalogi','Налоги лицевого счета');
    CreatefrxDBdataSet(self,tbPropertys,'Lic_Factor','Показатели');
  {$ENDIF}


end;

destructor TdmLichSchet.Destroy;
begin
  slIsklMens.Free;
  slDelMens.Free;
  slAddMens.Free;
  slPerevodMens.Free;
  slChangeIDMens.Free;
  inherited;
end;

procedure TdmLichSchet.SetdmMens(const Value: TdmMen);
begin
  FdmMens := Value;
  {$IFDEF USE_FR3}
//    if (Value<>nil) then begin
//      CreatefrxDBdataSet(self,dmMens.mtDokument,'Lic_Mens','Люди лицевого счета');
//    end;
  {$ENDIF}
end;
//-------------------------------------------------
function TdmLichSchet.ReadRekvAdres : Boolean;
begin
  Result:=false;
  if mtDokumentADRES_ID.AsInteger>0 then begin
    mtDokumentADRES_TEXT.AsString:=dmBase.AdresFromID(fmMain.DateFiks,mtDokumentADRES_ID.AsString,true);
    Result:=true;
    with dmBase do begin
      mtDokumentPUNKT.AsInteger:=Adres_PunktKod;
      mtDokumentPUNKT_NAME.AsString:=Adres_Punkt;
      mtDokumentUL.AsInteger:=Adres_UlKod;
      mtDokumentUL_NAME.AsString:=Adres_Ul;
      mtDokumentDOM.AsString:=Adres_NDom;
      mtDokumentKORP.AsString:=Adres_Korp;
      mtDokumentKv.AsString:=Adres_Kv;
      mtDokumentNAMEHOUSE.AsString:=Adres_NameHouse;
      mtDokumentNOT_DOM.AsBoolean:=Adres_NotDom;
      mtDokumentUCH_NOMER.AsString:=Adres_UchNomer;
    end;
  end;
end;
//-------------------------------------------------
function TdmLichSchet.ReadDokument(ID: Integer; slPar : TStringList): Boolean;
var
  vKeyValues : Variant;
  lErr, lFind : Boolean;
  i, nIdFirst : Integer;
  old : TCursor;
  fld:TField;
  slMens:TStringList;
begin
  Result := true;
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  slMens:=TStringList.Create;
  try
  IsReadDokument := true;
  slIsklMens.Clear;
  slDelMens.Clear;
  slAddMens.Clear;
  slPerevodMens.Clear;
  slChangeIDMens.Clear;
  FNewMen:=false;
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  vKeyValues[0] := DateFiks;
  vKeyValues[1] := ID;
  lFind:=dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []);
  if lFind then begin
    try
      i:=dmBase.tbLich.FieldByName('ADRES_ID').AsInteger;
    except
      i:=0;
    end;
    dmMens.ReadAllMens(ID, i, slMens);
  end else begin
    dmMens.ReadAllMens(-1, -1, nil);
  end;

  FCheckOwners:=true;

  DeleteAllFactor;
  // очистим и создадим пустую запись лицевого счета
  mtDokument.First;
  mtDokument.EmptyTable;
//  while not mtDokument.Eof do mtDokument.Delete;
  mtDokument.Append;
  mtDokumentID.AsInteger := -1;
  mtDokumentADRES_ID.AsInteger := 0;
  mtDokumentDATE_FIKS.AsDateTime := DateFiks;
  mtDokumentKNIGA_NOMER.AsString := FLastBook;

  if not lFind then begin
    // для того, что-бы почистить значения и проставить у них типы объектов
    tbHouseOwners.EmptyTable;
    EditDataSet(tbDopProp);
    for i:=0 to ListDopRazdel.Count-1 do begin
      dmBase.ReadPropFields( dmBase.TypeObj_Lich, ListDopRazdel.Strings[i] , DateFiks, -1, tbDopProp, lErr);
    end;
    ReadPropAdres(lErr);
    PostDataSet(tbDopProp);
    tbPriznaki.EmptyTable;
    tbNalogi.EmptyTable;
    tbDokumens.EmptyTable;
    Result := false;
  end else begin
    with dmBase.tbLich do begin
      try
        lErr := false;
        WriteField( mtDokumentID,  FieldByName('ID'), lErr );
        WriteField( mtDokumentNOMER,  FieldByName('NOMER'), lErr );
        WriteField( mtDokumentADRES_ID,  FieldByName('ADRES_ID'), lErr );
        WriteField( mtDokumentGRUPPA,  FieldByName('GRUPPA'), lErr );
        WriteField( mtDokumentKADASTR,  FieldByName('KADASTR'), lErr );
        WriteField( mtDokumentFIRST,  FieldByName('FIRST'), lErr );

        WriteField( mtDokumentKNIGA_NOMER,  FieldByName('KNIGA_NOMER'), lErr );
        mtDokumentKNIGA_NOMER.AsString:=Trim(mtDokumentKNIGA_NOMER.AsString);

        WriteField( mtDokumentKNIGA_STR,  FieldByName('KNIGA_STR'), lErr );
        mtDokumentKNIGA_STR.AsString:=Trim(mtDokumentKNIGA_STR.AsString);

        WriteField( mtDokumentOWN_HOUSE,  FieldByName('OWN_HOUSE'), lErr );
//        WriteField( mtDokumentPRIVATE_SECT,  FieldByName('PRIVATE_SECT'), lErr );  читаем и пишем из адреса
//        if mtDokumentPRIVATE_SECT.IsNull then mtDokumentPRIVATE_SECT.AsBoolean:=false;
        WriteField( mtDokumentPRICH_SOZD,  FieldByName('PRICH_SOZD'), lErr );
        WriteField( mtDokumentDATE_SOZD,  FieldByName('DATE_SOZD'), lErr );
        WriteField( mtDokumentPRICH_LIKV,  FieldByName('PRICH_LIKV'), lErr );
        WriteField( mtDokumentDATE_LIKV,  FieldByName('DATE_LIKV'), lErr );

        WriteField( mtDokumentNOMER_TWO_S,  FieldByName('NOMER_TWO_S'), lErr );
        WriteField( mtDokumentNOMER_TWO_L,  FieldByName('NOMER_TWO_L'), lErr );
        WriteField( mtDokumentTYPEHOUSE,  FieldByName('TYPEHOUSE'), lErr );
        WriteField( mtDokumentTELEFON,  FieldByName('TELEFON'), lErr );

        WriteField( mtDokumentOSNOV_ID,  FieldByName('OSNOV_ID'), lErr );
        WriteField( mtDokumentOSNOV_NOMER,  FieldByName('OSNOV_NOMER'), lErr );
        WriteDateField( mtDokumentOSNOV_DATE,  FieldByName('OSNOV_DATE') );

        WriteField( mtDokumentCANDELETE, FieldByName('CANDELETE'), lErr );
        WriteField( mtDokumentPRESENT, FieldByName('PRESENT'), lErr );
        WriteField( mtDokumentNOT_STAT, FieldByName('NOT_STAT'), lErr );

        WriteField( mtDokumentDATE_LPX1,  FieldByName('DATE_LPX1'), lErr );
        WriteField( mtDokumentDATE_LPX2,  FieldByName('DATE_LPX2'), lErr );
        WriteField( mtDokumentMNS_LPX,  FieldByName('MNS_LPX'), lErr );


        if mtDokumentNOT_STAT.IsNull then mtDokumentNOT_STAT.AsBoolean:=false;
        if mtDokumentMNS_LPX.IsNull  then mtDokumentMNS_LPX.AsBoolean:=false;

        // прочитаем дополнительные свойства
        mtDokumentDOPOLN.AsString  := dmBase.ReadOneProp(DateFiks, ID, 'DOPOLN', ftMemo);
        mtDokumentDOGOVOR.AsString := dmBase.ReadOneProp(DateFiks, ID, 'DOGOVOR', ftMemo);

        EditDataSet(tbDopProp);
        for i:=0 to ListDopRazdel.Count-1 do begin
          dmBase.ReadPropFields( dmBase.TypeObj_Lich, ListDopRazdel.Strings[i] , DateFiks, ID, tbDopProp, lErr);
        end;

        ReadPropAdres(lErr);


        mtDokumentKOM_ZANIM.AsString := dmBase.ReadPropAsString(DateFiks, ID, 'KOM_ZANIM');
        mtDokumentPL_ZANIM.AsString := dmBase.ReadPropAsstring(DateFiks, ID, 'PL_ZANIM');
        mtDokumentTAIL_HOUSE.AsString  := dmBase.ReadPropAsString(DateFiks, ID, 'TAIL_HOUSE');
        //------- занимаемая жилая площадь ---------------
        if mtDokumentPL_ZANIM.IsNull then begin
          fld:=tbDopProp.FindField('PLOSH_GIL');
          if (fld<>nil) and not fld.IsNull then begin
            mtDokumentPL_ZANIM.Value:=fld.Value;
          end;
        end;
        if mtDokumentKOM_ZANIM.IsNull then begin
          fld:=tbDopProp.FindField('KOL_KOMN');
          if (fld<>nil) and not fld.IsNull then begin
            mtDokumentKOM_ZANIM.Value:=fld.Value;
          end;
        end;
        //---------------------------------------------------------

        PostDataSet(tbDopProp);
        //----- признаки ------------------------------------------------------
        tbPriznaki.EmptyTable;
        with dmBase.tbLichPr do begin
          IndexName := 'PR_KEY';
          SetRange([DateFiks,ID],[DateFiks,ID]);
          while not Eof do begin
            tbPriznaki.Append;
            tbPriznakiKOD.Value := FieldByName('KOD').Value;
            tbPriznaki.Post;
            Next;
          end;
          CancelRange;
        end;
        //----- налоги ------------------------------------------------------
// !!!       ReadNalogi(_TypeObj_Lich, ID, mtDokumentADRES_ID.AsInteger, slMens);
        ReadNalogi(_TypeObj_Lich, ID, mtDokumentADRES_ID.AsInteger, nil, nil);
        //----- документы ------------------------------------------------------
        tbDokumens.EmptyTable;
        with dmBase.tbDokuments do begin
          IndexName := 'PR_KEY';
          SetRange([DateFiks,ID],[DateFiks,ID]);
          while not Eof do begin
            tbDokumens.Append;
            WriteDateField( tbDokumensDate_Dok, FieldByName('DATE_DOK'));
            tbDokumensTypeDok.AsString := FieldByName('TypeDok').AsString;
            tbDokumensKomm.AsString    := FieldByName('KOMM').AsString;
            tbDokumensSubject.AsString := FieldByName('SUBJECT').AsString;
            tbDokumensNomer.AsString   := FieldByName('NOMER').AsString;
            tbDokumens.Post;
            Next;
          end;
          CancelRange;
        end;
      except
        on E: Exception do begin
          PutError(E.Message);
          Result := false;
        end;
      end;
      if lErr then Result := false;
    end;
  end;
  //------------ заполним адрес  ---------------------
  ReadRekvAdres;
  //--------------------------------------------------
  if mtDokumentID.AsInteger <= 0 then begin
    AfterCreateDokument;
  end else begin
    // есть глава хозяйства
    if not mtDokumentFIRST.IsNull and (mtDokumentFIRST.AsInteger > 0) then begin
      nIdFirst := mtDokumentFIRST.AsInteger;
      mtDokumentFIRST.AsInteger := 0;  // проставим 0, если не найдем человека в списке людей
      dmMens.mtDokument.First;
      while not dmMens.mtDokument.Eof do begin
        if not dmMens.mtDokumentID.IsNull and
           (dmMens.mtDokumentID.AsInteger = nIdFirst) then begin
          // проставим главе хозяйства внутренний код
          mtDokumentFIRST.AsInteger := dmMens.mtDokumentID_INTERNAL.AsInteger;
          mtDokumentFIRST_FIO.AsString := dmMens.GetFIO;
          break;
        end;
        dmMens.mtDokument.Next;
      end;
      dmMens.mtDokument.First;
    end;
    AfterReadDokument;
  end;
  PostDataSet(mtDokument);
  finally
    slMens.Free;
    Screen.Cursor := old;
    IsReadDokument := false;
  end;
end;

//--------------------------------------------------------------------------
function TdmLichSchet.WriteDokument(f:TForm): Boolean;
var
  vKeyValues  : Variant;
  lCheckEn, lErr, lFind, lNew, lMen : Boolean;
  ID, nIDFirst, i : Integer;
  strErr : String;
  nIdRealFirst : Integer;
  old : TCursor;
  nIdMen, nIdLic, nIdAdres, nIDSeek, nIDCopyMen : Integer;
  fld:TField;
  arr:TArrStrings;
  dsChild:TDataSet;
  strPolFirst:String;
  recID:TID;
  ld : TLastDvig;
begin
  LastNomerLic := '';
  PostDokument;
  Result := CheckDokument(strErr);
  if not Result then begin
    if strErr<>'' then begin
      Beep;
      PutError(strErr);
    end;
    exit;
  end;
  lCheckEn:=false;
//  dmBase.AdsConnection.BeginTransaction;
  // новый лицевой счет
  if mtDokumentID.IsNull or (mtDokumentID.AsInteger<1) then begin
    ID := dmBase.GetNewID( dmBase.TypeObj_Lich );
    EditDataSet(mtDokument);
    mtDokumentID.AsInteger := ID;
    FLastBook := mtDokumentKNIGA_NOMER.AsString;
    lNew := true;
  end else begin
    ID := mtDokumentID.AsInteger;
    lNew := false;
  end;
  PostDataSet(mtDokument);
  // ошибка при выдаче нового ID
  if ID<=0 then exit;
  nIdAdres := -1;
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  vKeyValues[0] := DateFiks;
  vKeyValues[1] := ID;
  lFind := dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []);
  if not lFind then begin
    dmBase.tbLich.Append;
    dmBase.tbLich.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
    dmBase.tbLich.FieldByName('ID').AsInteger := ID;
  end else begin
    dmBase.tbLich.Edit;
  end;
  with dmBase.tbLich do begin
    try
      lErr := false;
      WriteField( FieldByName('ID'), mtDokumentID,  lErr );
      WriteField( FieldByName('NOMER'), mtDokumentNOMER,  lErr );
      if lNew then begin
        LastNomerLic := mtDokumentNOMER.AsString;
      end;
      if mtDokumentADRES_ID.AsString<>''
        then nIdAdres := mtDokumentADRES_ID.AsInteger;
      WriteField( FieldByName('ADRES_ID'), mtDokumentADRES_ID,  lErr );
      WriteField( FieldByName('GRUPPA'), mtDokumentGRUPPA,  lErr );
      WriteField( FieldByName('KADASTR'), mtDokumentKADASTR,  lErr );
      WriteField( FieldByName('KNIGA_NOMER'), mtDokumentKNIGA_NOMER,  lErr );
      FieldByName('KNIGA_NOMER').AsString:=Trim(FieldByName('KNIGA_NOMER').AsString);
      WriteField( FieldByName('KNIGA_STR'), mtDokumentKNIGA_STR,  lErr );
      FieldByName('KNIGA_STR').AsString:=Trim(FieldByName('KNIGA_STR').AsString);
      WriteField( FieldByName('OWN_HOUSE'), mtDokumentOWN_HOUSE, lErr );
//      WriteField( FieldByName('PRIVATE_SECT'), mtDokumentPRIVATE_SECT, lErr );  читаем и пишем из адреса
      WriteField( FieldByName('PRICH_SOZD'), mtDokumentPRICH_SOZD , lErr );
      WriteField( FieldByName('DATE_SOZD'), mtDokumentDATE_SOZD, lErr );
      WriteField( FieldByName('PRICH_LIKV'), mtDokumentPRICH_LIKV, lErr );
      WriteField( FieldByName('DATE_LIKV'), mtDokumentDATE_LIKV,  lErr );
      WriteField( FieldByName('NOMER_TWO_S'), mtDokumentNOMER_TWO_S, lErr );
      WriteField( FieldByName('NOMER_TWO_L'), mtDokumentNOMER_TWO_L, lErr );
      WriteField( FieldByName('TYPEHOUSE'), mtDokumentTYPEHOUSE, lErr );
      WriteField( FieldByName('TELEFON'), mtDokumentTELEFON, lErr );

      WriteField( FieldByName('OSNOV_ID'), mtDokumentOSNOV_ID, lErr );
      WriteField( FieldByName('OSNOV_NOMER'), mtDokumentOSNOV_NOMER, lErr );
      WriteDateField( FieldByName('OSNOV_DATE'), mtDokumentOSNOV_DATE);

      WriteField( FieldByName('CANDELETE'), mtDokumentCANDELETE, lErr );
      WriteField( FieldByName('PRESENT'), mtDokumentPRESENT, lErr );
      WriteField( FieldByName('NOT_STAT'), mtDokumentNOT_STAT, lErr );

      WriteField( FieldByName('DATE_LPX1'), mtDokumentDATE_LPX1, lErr );
      WriteField( FieldByName('DATE_LPX2'), mtDokumentDATE_LPX2, lErr );
      WriteField( FieldByName('MNS_LPX'), mtDokumentMNS_LPX, lErr );

      if mtDokumentDATE_LIKV.IsNull and (DateFiks=dmBase.GetDateCurrentSost) and (mtDokumentADRES_ID.AsString<>'') then begin
        dmBase.tbAdres.IndexName := 'PR_KEY';
        if dmBase.tbAdres.FindKey([DateFiks,nIdAdres]) then begin
          // ессли тип адреса не заполнен или пустующий, то поставим тип как жилой
          if dmBase.tbAdres.FieldByName('TIP').IsNull or (dmBase.tbAdres.FieldByName('TIP').AsInteger=HOUSE_EMPTY) then begin
            dmBase.tbAdres.Edit;
            try
              dmBase.tbAdres.FieldByName('TIP').AsInteger:=HOUSE_GIL;
              dmBase.tbAdres.Post;
            except
              dmBase.tbAdres.Cancel;
              PutError(' Ошибка установки у адреса типа проживания как жилой. ');
            end;
          end;
        end;

        // возможно нужно поставить адресу, что он пустующий
        // дом может пустовать три года и считаться ЖИЛЫМ !!!
        {
        if mtDokumentCANDELETE.AsBoolean then begin
          lEmptyHouse := true;
          dmBase.WorkQuery.SQL.Text := 'SELECT id FROM ЛицевыеСчета WHERE date_fiks='+QStr(CURRENT_SOST)+
                                       ' and adres_id='+mtDokumentADRES_ID.AsString;
          dmBase.WorkQuery.Open;
          while not dmBase.WorkQuery.Eof do begin
            // по адресу лицевого счета есть еще другой лицевой счет
            if dmBase.WorkQuery.Fields[0].AsInteger<>ID then begin
              lEmptyHouse := false;
              break;
            end;
            dmBase.WorkQuery.Next;
          end;
          dmBase.WorkQuery.Close;
          if lEmptyHouse then begin
            dmBase.tbAdres.IndexName := 'PR_KEY';
            if dmBase.tbAdres.FindKey([DateFiks,nIdAdres]) then begin
              // ессли тип адреса не заполнен или жилой, то поставим тип как пустующий
              if dmBase.tbAdres.FieldByName('TIP').IsNull or (dmBase.tbAdres.FieldByName('TIP').AsInteger=HOUSE_GIL) then begin
                dmBase.tbAdres.Edit;
                try
                  dmBase.tbAdres.FieldByName('TIP').AsInteger:=HOUSE_EMPTY;
                  dmBase.tbAdres.Post;
                except
                  dmBase.tbAdres.Cancel;
                  PutError(' Ошибка установки у адреса типа проживания как пустующий. ');
                end;
              end;
            end;
          end;
        end else begin
          dmBase.tbAdres.IndexName := 'PR_KEY';
          if dmBase.tbAdres.FindKey([DateFiks,nIdAdres]) then begin
            // ессли тип адреса не заполнен или пустующий, то поставим тип как жилой
            if dmBase.tbAdres.FieldByName('TIP').IsNull or (dmBase.tbAdres.FieldByName('TIP').AsInteger=HOUSE_EMPTY) then begin
              dmBase.tbAdres.Edit;
              try
                dmBase.tbAdres.FieldByName('TIP').AsInteger:=HOUSE_GIL;
                dmBase.tbAdres.Post;
              except
                dmBase.tbAdres.Cancel;
                PutError(' Ошибка установки у адреса типа проживания как жилой. ');
              end;
            end;
          end;
        end;
        }
      end;
      if not lErr then begin
        // пишем в базу длинных строк
        dmBase.WriteProp(DateFiks, ID, mtDokument, 'DOPOLN', dmBase.TypeObj_Lich);
        dmBase.WriteProp(DateFiks, ID, mtDokument, 'DOGOVOR', dmBase.TypeObj_Lich);

        //-------------------------------------------------------------------------------
        // свойства по площадям для лицевого счета
        //-------------------------------------------------------------------------------
        dmBase.WriteProp(DateFiks, ID, mtDokument, 'TAIL_HOUSE', dmBase.TypeObj_Lich);
        //---------- занимаемая жилая площадь ---------------------
        fld:=tbDopProp.FindField('PLOSH_GIL');
        if (fld<>nil) and not fld.IsNull then begin
          if fld.AsString=mtDokumentPL_ZANIM.AsString
            then dmBase.DeleteProp(DateFiks, ID, 'PL_ZANIM', ftFloat)
            else dmBase.WriteProp(DateFiks, ID, mtDokument, 'PL_ZANIM', dmBase.TypeObj_Lich);
        end else begin
          dmBase.WriteProp(DateFiks, ID, mtDokument, 'PL_ZANIM', dmBase.TypeObj_Lich);
        end;
        //---------- кол-во занимаемых комнат ---------------------
        fld:=tbDopProp.FindField('KOL_KOMN');
        if (fld<>nil) and not fld.IsNull then begin
          if fld.AsString=mtDokumentKOM_ZANIM.AsString
            then dmBase.DeleteProp(DateFiks, ID, 'KOM_ZANIM', ftFloat)
            else dmBase.WriteProp(DateFiks, ID, mtDokument, 'KOM_ZANIM', dmBase.TypeObj_Lich);
        end else begin
          dmBase.WriteProp(DateFiks, ID, mtDokument, 'KOM_ZANIM', dmBase.TypeObj_Lich);
        end;

        dmBase.WriteProp( DateFiks, ID, tbDopProp, '', dmBase.TypeObj_Lich);

        lErr := not WritePropAdres;
        //----- Владельцы ------------------------------------------------------
        if mtDokumentADRES_ID.AsInteger>0 then begin
          dmBase.SaveHouseOwners(mtDokumentADRES_ID.AsInteger, DateFiks, tbHouseOwners, nil);
        end;
        //----- признаки ------------------------------------------------------
        dmBase.DeleteFromList( dmBase.tbLichPr, DateFiks, ID);
        tbPriznaki.First;
        with dmBase.tbLichPr do begin
          while not tbPriznaki.Eof do begin
            if not tbPriznakiKOD.IsNull then begin
              Append;
              FieldByName('DATE_FIKS').Value := DateFiks;
              FieldByName('ID').Value        := ID;
              FieldByName('KOD').Value := tbPriznakiKOD.Value;
              try
                Post;
              except
                Cancel;
              end;
            end;
            tbPriznaki.Next;
          end;
        end;
        tbPriznaki.First;
        //----- налоги ------------------------------------------------------
        WriteNalogi(_TypeObj_Lich, ID);
        //----- документы ------------------------------------------------------
        dmBase.DeleteFromList( dmBase.tbDokuments, DateFiks, ID);
        tbDokumens.First;
        with dmBase.tbDokuments do begin
          while not tbDokumens.Eof do begin
//            if not tbNalogiGOD.IsNull and not tbNalogiNALOG.IsNull then begin
              Append;
              FieldByName('DATE_FIKS').Value := DateFiks;
              FieldByName('ID').Value        := ID;
              FieldByName('TYPEOBJ').Value   := dmBase.TypeObj_Lich;
              FieldByName('TYPEDOK').AsString:= tbDokumensTypeDok.AsString;
              WriteDateField( FieldByName('DATE_DOK'), tbDokumensDate_Dok);
              FieldByName('KOMM').AsString := tbDokumensKOMM.AsString;
              FieldByName('SUBJECT').AsString := tbDokumensSUBJECT.AsString;
              FieldByName('NOMER').AsString := tbDokumensNOMER.AsString;
              try
                Post;
              except
                Cancel;
              end;
//            end;
            tbDokumens.Next;
          end;
          tbDokumens.First;
        end;
      end;
    except
      on E: Exception do begin
        PutError(E.Message);
        Result := false;
      end;
    end;
    if lErr then Result := false;
  end;
  if Result then begin
    for i:=0 to slDelMens.Count-1 do begin
      lCheckEn:=true;
      if not dmBase.DeleteMen( DateFiks, slDelMens.Strings[i], false ) then begin
        Result:=false;
        Beep;
        PutError(dmBase.LastErrorDelete);
      end;
    end;
    for i:=0 to slIsklMens.Count-1 do begin
      lCheckEn:=true;
      nIdMen:=StrToInt(slIsklMens.Strings[i]);
      // найдем человека в таблице "Население"
      if dmBase.tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,nIDMen]), []) then begin
        try          
          dmBase.tbMens.Edit;
          dmBase.tbMens.FieldByName('LIC_ID').AsInteger:=0;
          dmBase.tbMens.FieldByName('FIRST').AsBoolean:=false;
          dmBase.tbMens.FieldByName('PROPIS').AsBoolean:=false;
          dmBase.tbMens.FieldByName('PRESENT').AsBoolean:=false;
          dmBase.tbMens.FieldByName('CANDELETE').AsBoolean:=false;
//-------- 24.01.2017  --------------------------
// было     dmBase.tbMens.FieldByName('KATEG').AsInteger:=ADRES_NOTREG;
//          dmBase.WriteValueProp('ADRES_PROP', 'не известен', DateFiks, StrToInt(slIsklMens.Strings[i]),
//                              dmBase.TypeObj_Nasel, ftMemo);
          dmBase.tbMens.FieldByName('ADRES_ID').AsInteger:=0;
          dmBase.tbMens.FieldByName('KATEG').AsInteger:=BEZ_ADRESA;
          dmBase.tbMens.Post;
          ld:=dmBase.LastDvigMen(DateFiks, slIsklMens.Strings[i]);
          if dmBase.tbMens.FieldByName('DATES').IsNull and (IntToStr(ld.TypeMigr)=MIGR_UBIL) and ld.Contant and (ld.Komm<>'') then begin
            dmBase.WriteValueProp('ADRES_PROP', ld.Komm, DateFiks, nIDMen, dmBase.TypeObj_Nasel, ftMemo);
            if ld.Obl=''   then dmBase.DeleteProp(DateFiks, nIDMen, 'APROP_OBL', ftMemo)
                           else dmBase.WriteValueProp('APROP_OBL', ld.Obl, DateFiks, nIDMen, dmBase.TypeObj_Nasel, ftMemo);
            if ld.Rn=''    then dmBase.DeleteProp(DateFiks, nIDMen, 'APROP_RN', ftMemo)
                           else dmBase.WriteValueProp('APROP_RN', ld.Rn, DateFiks, nIDMen, dmBase.TypeObj_Nasel, ftMemo);
            if ld.Punkt='' then dmBase.DeleteProp(DateFiks, nIDMen, 'APROP_PN', ftMemo)
                           else dmBase.WriteValueProp('APROP_PN', ld.Punkt, DateFiks, nIDMen, dmBase.TypeObj_Nasel, ftMemo);
          end else begin
            dmBase.WriteValueProp('ADRES_PROP', 'не известен', DateFiks, nIDMen, dmBase.TypeObj_Nasel, ftMemo);
          end;
//------------------------------------------------------
        except
          Result:=false;
          Beep;
          PutError('Ошибка исключения с лицевого счета');
        end;
      end;
    end;
    for i:=0 to slPerevodMens.Count-1 do begin
      nIdMen := StrToInt(slPerevodMens.Names[i]);
      nIdLic := StrToInt(slPerevodMens.Values[slPerevodMens.Names[i]]);
      lCheckEn:=true;
      if not dmBase.ChangeLicMen( DateFiks, nIdMen, nIdLic ) then begin
        Result:=false;
        Beep;
        PutError(' Ошибка перевода на другой лицевой счет ! ');
      end;
    end;
    for i:=0 to slAddMens.Count-1 do begin
      nIdMen := StrToInt(slAddMens.Names[i]);
      nIdLic := StrToInt(slAddMens.Values[slAddMens.Names[i]]);
      lCheckEn:=true;
      if not dmBase.ChangeLicMen( DateFiks, nIdMen, nIdLic ) then begin
        Result:=false;
        Beep;
        PutError(' Ошибка добавления человека из другого лицевого счета ! ');
      end;
    end;
  end;
  strPolFirst:='';
  if Result then begin
    lMen:=dbDisableControls(dmMens.mtDokument);
    dmBase.tbLich.FieldByName('FIRST').AsInteger:=0;
    // есть глава хозяйства
    nIdFirst := 0;
    if not mtDokumentFIRST.IsNull and (mtDokumentFIRST.AsInteger > 0) then begin
      nIdFirst := mtDokumentFIRST.AsInteger;  // это наш внутренний код
      dmMens.mtDokument.First;
      while not dmMens.mtDokument.Eof do begin
        if not dmMens.mtDokumentID.IsNull and
           (dmMens.mtDokumentID_INTERNAL.AsInteger = nIdFirst) then begin
          // проставим реальный ID в поле FIRST лиц. счета
          // при создании нового лиц. счета работает неправильно
          strPolFirst := dmMens.mtDokumentPOL.AsString;
          dmBase.tbLich.FieldByName('FIRST').AsInteger := dmMens.mtDokumentID.AsInteger;
//          nIdRealFirst := dmMens.mtDokumentID.AsInteger;
          break;
        end;
        dmMens.mtDokument.Next;
      end;
      dmMens.mtDokument.First;
    end;
    nIdRealFirst:=0;
    // передаем внутренний ID (nIdFirst) и получаем после записи реальный ID (nIdRealFirst)
    if not dmMens.mtDokument.ControlsDisabled
      then dmMens.mtDokument.DisableControls;

    // если были люди загруженные с базы населения с целью их копирования, создания дубля
    for i:=0 to slChangeIDMens.Count-1 do begin
      nIDSeek    := StrToInt(slChangeIDMens.Names[i]);
      nIDCopyMen := dmBase.GetNewID(dmBase.TypeObj_Nasel);
      lCheckEn:=true;
//      nNewID := StrToInt(slChangeIDMens.ValueFromIndex[i]);
      if not dmBase.ChangeIDCopyMen( nIDSeek, nIDCopyMen ) then begin
//        Result:=false;
//        Beep;
//        PutError(' Ошибка перевода на другой лицевой счет ! ');
      end;
    end;

    dmMens.sChilds:='';
    dmBase.tbLich.CheckBrowseMode;
    Result:=dmMens.WriteAllMens(ID, nIdFirst, nIdAdres, nIdRealFirst);
    dmMens.mtDokument.First;

    if dmMens.IsLgotEN and ( dmMens.DvigMod or FNewMen or lCheckEn ) then begin
      if dmBase.CheckRunMen(_TypeObj_Nasel, CHECK_EN, dmMens.mtDokumentID.AsInteger, recID, true) then begin
        dmMens.CheckEN:=true;
        SystemProg.SetRunMenReport(recID, 2{'SprMGS'});
      end;
    end;                           

    if (dmMens.sChilds<>'') then begin  // у главы лицевого счета есть дети
      StrToArr(dmMens.sChilds,arr,',',true);
      for i:=0 to Length(arr)-1 do begin
        dsChild:=dmBase.GetMen(DateFiks,arr[i]);
        if dsChild<>nil then begin
          try
            dsChild.Edit;
            if dmMens.sSuprug='' then begin
              if strPolFirst<>'' then begin
                if strPolFirst='М' then begin
                  if dsChild.FieldByName('PA_ID').AsString=''
                    then dsChild.FieldByName('PA_ID').AsInteger:=nIdRealFirst;
                end else begin
                  if dsChild.FieldByName('MA_ID').AsString=''
                    then dsChild.FieldByName('MA_ID').AsInteger:=nIdRealFirst;
                end;
              end;
            end else begin
              if dmMens.sSuprugPOL='М' then begin
                if dsChild.FieldByName('PA_ID').AsString=''
                  then dsChild.FieldByName('PA_ID').AsString:=dmMens.sSuprug;
                if dsChild.FieldByName('MA_ID').AsString=''
                  then dsChild.FieldByName('MA_ID').AsInteger:=nIdRealFirst;
              end else begin
                if dsChild.FieldByName('PA_ID').AsString=''
                  then dsChild.FieldByName('PA_ID').AsInteger:=nIdRealFirst;
                if dsChild.FieldByName('MA_ID').AsString=''
                  then dsChild.FieldByName('MA_ID').AsString:=dmMens.sSuprug;
              end;
            end;
            dsChild.Post;
          except
            PutError('Ошибка записи родителей.');
          end;
        end;
      end;

    end;

    if Result and (nIdRealFirst>0) then begin
      EditDataSet(dmBase.tbLich);
      dmBase.tbLich.FieldByName('FIRST').AsInteger := nIdRealFirst;
      WriteOwners(nIdRealFirst);
    end;

    dmBase.tbLich.CheckBrowseMode;

    dbEnableControls(dmMens.mtDokument, lMen);
    if dmMens.mtDokument.ControlsDisabled
      then dmMens.mtDokument.EnableControls;

//    dmBase.AdsConnection.Commit;
  end else begin
    dmBase.tbLich.Cancel;
//    dmBase.AdsConnection.Rollback;
  end;
  dmBase.FlushBufferTableLich;
  finally
    Screen.Cursor := old;
  end;
//  ShowMessage(IntToStr(dmBase.CountMens(DateFiks,IntToStr(ID))));  количество людей на лиц. счете
end;

//---------------------------------------------------------------------------------------
function TdmLichSchet.ReadPropAdres(var lErr : Boolean) : String;
var
  vKeyValues : Variant;
  i : integer;
  adr : TAdres;
  fld:TField;
begin
  Result := '';
  if not mtDokumentADRES_ID.IsNull and (mtDokumentADRES_ID.AsInteger>0) then begin
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := DateFiks;
    vKeyValues[1] := mtDokumentADRES_ID.AsInteger;
  //  OWNER_MY
    if dmBase.tbAdres.Locate('DATE_FIKS;ID',vKeyValues,[]) then begin
      adr := dmBase.AdresForSeek(dmBase.tbAdres);
      EditDataSet(mtDokument);
      mtDokumentPREDST.AsString := dmBase.tbAdres.FieldByName('PREDST').AsString;
      mtDokumentETAG.AsString := dmBase.tbAdres.FieldByName('ETAG').AsString;
      if not dmBase.tbAdres.FieldByName('PLOSH_UCH').IsNUll
        then mtDokumentPLOSH_UCH.Value := dmBase.tbAdres.FieldByName('PLOSH_UCH').Value;
      mtDokumentKOL_ETAG.AsString := dmBase.tbAdres.FieldByName('KOL_ETAG').AsString;
      mtDokumentABONENT_GAZ.AsString := dmBase.tbAdres.FieldByName('ABONENT_GAZ').AsString;

      mtDokumentCONTROL.AsString := dmBase.tbAdres.FieldByName('CONTROL').AsString;
      mtDokumentUSE_GILFOND.AsString := dmBase.tbAdres.FieldByName('USE_GILFOND').AsString;
      {$IFDEF GKH}
        if dmBase.tbAdres.FieldByName('PRIVATE_SECT').IsNull
          then mtDokumentPRIVATE_SECT.AsBoolean := false
          else mtDokumentPRIVATE_SECT.AsBoolean := dmBase.tbAdres.FieldByName('PRIVATE_SECT').AsBoolean;
      {$ELSE}
        if dmBase.tbAdres.FieldByName('PRIVATE_SECT').IsNull
          then mtDokumentPRIVATE_SECT.AsBoolean := true
          else mtDokumentPRIVATE_SECT.AsBoolean := dmBase.tbAdres.FieldByName('PRIVATE_SECT').AsBoolean;
      {$ENDIF}
{
      if mtDokumentID.AsInteger>0 then begin
      dmBase.tbHouseOwners.IndexFieldNames:='DATE_FIKS;ID;KOD;TYPEKOD';
      dmBase.tbHouseOwners.
      dmBase.tbHouseOwners.

      dmBase.tbHouseOwners.IndexFieldNames:='DATE_FIKS;ID;NOMER';
      dmBase.tbHouseOwners.SetRange([DateFiks,mtDokumentADRES_ID.AsInteger],[DateFiks,mtDokumentADRES_ID.AsInteger]);
      while not dmBase.tbHouseOwners.Eof do begin
        dmBase.tbHouseOwners.Next;
      end;
      dmBase.tbHouseOwners.CancelRange;
}

      tbDopProp.Edit;
      //--------- очистим ранее прочитанные значения ----------
      for i:=0 to tbDopProp.FieldCount-1 do begin
        if (tbDopProp.Fields[i].Tag > 0) and
           (tbDopProp.Fields[i].Tag = dmBase.TypeObj_Adres) then begin
          tbDopProp.Fields[i].Value := null;
        end;
      end;
      //-------------------------------------------------------
      dmBase.ReadPropFields( dmBase.TypeObj_Adres, '1', DateFiks, mtDokumentADRES_ID.AsInteger,
                             tbDopProp, lErr);
      fld:=tbDopProp.FindField('TYPE_VOZV');
      if fld<>nil then begin
        if (fld.AsString='') or (fld.AsString='0') then begin
           fld.AsInteger:=1;  // тип года постройки по умолчанию равен "Год постройки"
        end;
      end;

      if dmBase.FindBigHouse(adr,DateFiks) then begin

        if not dmBase.tbBigHouse.FieldByName('PRIVATE_SECT').IsNull then begin
          mtDokumentPRIVATE_SECT.AsBoolean := dmBase.tbBigHouse.FieldByName('PRIVATE_SECT').AsBoolean;
        end;
        if not dmBase.tbBigHouse.FieldByName('CONTROL').IsNull
          then mtDokumentCONTROL.AsInteger := dmBase.tbBigHouse.FieldByName('CONTROL').AsInteger;

        if not dmBase.tbBigHouse.FieldByName('USE_GILFOND').IsNull
          then mtDokumentUSE_GILFOND.AsInteger := dmBase.tbBigHouse.FieldByName('USE_GILFOND').AsInteger;

        if dmBase.tbBigHouse.FieldByNAme('KOL_ETAG').AsString<>''
          then mtDokumentKOL_ETAG.AsString:=dmBase.tbBigHouse.FieldByName('KOL_ETAG').AsString;
        if dmBase.tbBigHouse.FieldByName('GOD_VOZV').AsString<>''
          then tbDopProp.FieldByName('GOD_VOZV').AsString:=dmBase.tbBigHouse.FieldByName('GOD_VOZV').AsString;
// боровляны
//        if dmBase.tbBigHouse.FieldByName('PLOSH_ZDAN').AsString<>''
//          then tbDopProp.FieldByName('PLOSH_ZDAN').AsFloat:=dmBase.tbBigHouse.FieldByName('PLOSH_ZDAN').AsFloat;

        if dmBase.tbBigHouse.FieldByName('MAT_STEN').AsString<>''
          then tbDopProp.FieldByName('MAT_STEN').AsString:=dmBase.tbBigHouse.FieldByName('MAT_STEN').AsString;

        {$IFDEF GKH}
          if dmBase.tbBigHouse.FieldByName('KANALIZ').AsString<>'' then tbDopProp.FieldByName('KANALIZ').AsBoolean:=dmBase.tbBigHouse.FieldByName('KANALIZ').AsBoolean;
          if dmBase.tbBigHouse.FieldByName('CENT_OTOP').AsString<>'' then tbDopProp.FieldByName('CENT_OTOP').AsBoolean:=dmBase.tbBigHouse.FieldByName('CENT_OTOP').AsBoolean;
          if dmBase.tbBigHouse.FieldByName('GOR_VODA').AsString<>'' then tbDopProp.FieldByName('GOR_VODA').AsBoolean:=dmBase.tbBigHouse.FieldByName('GOR_VODA').AsBoolean;
          if dmBase.tbBigHouse.FieldByName('VODOPROV').AsString<>'' then tbDopProp.FieldByName('VODOPROV').AsBoolean:=dmBase.tbBigHouse.FieldByName('VODOPROV').AsBoolean;
          if dmBase.tbBigHouse.FieldByName('GAZ').AsString<>'' then tbDopProp.FieldByName('GAZ').AsBoolean:=dmBase.tbBigHouse.FieldByName('GAZ').AsBoolean;
          if dmBase.tbBigHouse.FieldByName('LIFT').AsString<>'' then tbDopProp.FieldByName('LIFT').AsBoolean:=dmBase.tbBigHouse.FieldByName('LIFT').AsBoolean;
          if dmBase.tbBigHouse.FieldByName('MUSOROPR').AsString<>'' then tbDopProp.FieldByName('MUSOROPR').AsBoolean:=dmBase.tbBigHouse.FieldByName('MUSOROPR').AsBoolean;
        {$ENDIF}

      end;

      tbDopProp.Post;

      //----- Владельцы ----------------------
      dmBase.LoadHouseOwners(mtDokumentADRES_ID.AsInteger,DateFiks,tbHouseOwners,nil);
      if tbHouseOwners.RecordCount>0 then begin
        FCheckOwners:=false;   // на автомате нельзя будет формировать собственников, потому, что прочитали
      end;
    end;
  end;
end;

//-------------------------------------------------------------------
function TdmLichSchet.WritePropAdres: Boolean;
var
  i : integer;
  vKeyValues : Variant;
  adr : TAdres;
  lOk:Boolean;
  strErr:String;
  fld:TField;
begin
  Result := true;
  fld:=tbDopProp.FindField('TYPE_VOZV');
  if fld<>nil then begin
    EditDataSet(tbDopProp);
    if (fld.AsString='') or (fld.AsString='0') then begin
      fld.AsInteger:=1;  // тип года постройки по умолчанию равен "Год постройки"
    end;
    if fld.AsInteger>2 then begin   // не "год постройки", не "год переноса"
      tbDopProp.FieldByName('GOD_VOZV').AsString:='';   // чистим год возведения
    end;
  end;
  if mtDokumentADRES_ID.IsNull then begin
    //--------- очистим ранее прочитанные значения ----------
    EditDataSet(tbDopProp);
    for i:=0 to tbDopProp.FieldCount-1 do begin
      if (tbDopProp.Fields[i].Tag > 0) and
         (tbDopProp.Fields[i].Tag = dmBase.TypeObj_Adres) then begin
        tbDopProp.Fields[i].Value := null;
      end;
    end;
  end else begin
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := DateFiks;
    vKeyValues[1] := mtDokumentADRES_ID.AsInteger;
    if dmBase.tbAdres.Locate('DATE_FIKS;ID',vKeyValues,[]) then begin
      dmBase.tbAdres.Edit;
      dmBase.tbAdres.FieldByName('PREDST').AsString   := mtDokumentPREDST.AsString;
      dmBase.tbAdres.FieldByName('ETAG').AsString     := mtDokumentETAG.AsString;
      dmBase.tbAdres.FieldByName('PLOSH_UCH').Value:=mtDokumentPLOSH_UCH.Value;
      dmBase.tbAdres.FieldByName('UCH_NOMER').Value:=mtDokumentUCH_NOMER.Value;

      dmBase.tbAdres.FieldByName('KOL_ETAG').AsString := mtDokumentKOL_ETAG.AsString;
      dmBase.tbAdres.FieldByName('ABONENT_GAZ').AsString := mtDokumentABONENT_GAZ.AsString;
      dmBase.tbAdres.FieldByName('PRIVATE_SECT').AsBoolean:=mtDokumentPRIVATE_SECT.AsBoolean;
      dmBase.tbAdres.FieldByName('CONTROL').AsString:=mtDokumentCONTROL.AsString;
      dmBase.tbAdres.FieldByName('USE_GILFOND').AsString:=mtDokumentUSE_GILFOND.AsString;
      dmBase.tbAdres.Post;
      adr := dmBase.AdresForSeek(dmBase.tbAdres);
      if not dmBase.FindBigHouse(adr,DateFiks) then begin
        lOk:=dmBase.AddBigHouse(adr,DateFiks,true,strErr);
        if lOk then begin
          lOk:=dmBase.FindBigHouse(adr,DateFiks);
        end;
      end else begin
        lOk:=true;
      end;
      if lOk then begin
        dmBase.tbBigHouse.Edit;
        dmBase.tbBigHouse.FieldByNAme('KOL_ETAG').AsString := dmBase.tbAdres.FieldByName('KOL_ETAG').AsString;
        dmBase.tbBigHouse.FieldByName('GOD_VOZV').AsString   := tbDopProp.FieldByName('GOD_VOZV').AsString;
        dmBase.tbBigHouse.FieldByName('TYPE_VOZV').AsString  := tbDopProp.FieldByName('TYPE_VOZV').AsString;
        // боровляны
        //        dmBase.tbBigHouse.FieldByName('PLOSH_ZDAN').AsString := tbDopProp.FieldByName('PLOSH_ZDAN').AsString;
        dmBase.tbBigHouse.FieldByName('MAT_STEN').AsString  := tbDopProp.FieldByName('MAT_STEN').AsString;
        dmBase.tbBigHouse.FieldByName('PRIVATE_SECT').AsBoolean:=mtDokumentPRIVATE_SECT.AsBoolean;
        dmBase.tbBigHouse.FieldByName('CONTROL').AsString:=mtDokumentCONTROL.AsString;
        dmBase.tbBigHouse.FieldByName('USE_GILFOND').AsString:=mtDokumentUSE_GILFOND.AsString;

        {$IFDEF GKH}
          dmBase.tbBigHouse.FieldByName('KANALIZ').AsBoolean:=tbDopProp.FieldByName('KANALIZ').AsBoolean;
          dmBase.tbBigHouse.FieldByName('CENT_OTOP').AsBoolean:=tbDopProp.FieldByName('CENT_OTOP').AsBoolean;
          dmBase.tbBigHouse.FieldByName('GOR_VODA').AsBoolean:=tbDopProp.FieldByName('GOR_VODA').AsBoolean;
          dmBase.tbBigHouse.FieldByName('VODOPROV').AsBoolean:=tbDopProp.FieldByName('VODOPROV').AsBoolean;
          dmBase.tbBigHouse.FieldByName('GAZ').AsBoolean:=tbDopProp.FieldByName('GAZ').AsBoolean;
          dmBase.tbBigHouse.FieldByName('LIFT').AsBoolean:=tbDopProp.FieldByName('LIFT').AsBoolean;
          dmBase.tbBigHouse.FieldByName('MUSOROPR').AsBoolean:=tbDopProp.FieldByName('MUSOROPR').AsBoolean;
        {$ENDIF}

        dmBase.tbBigHouse.Post;
      end;
    end;
    Result := dmBase.WriteProp( DateFiks, mtDokumentADRES_ID.AsInteger, tbDopProp, '', dmBase.TypeObj_Adres);
  end;
end;


//--------------------------------------------------------------------------------
function TdmLichSchet.WriteOwners( nIdFirst : Integer ) : Boolean;
var
  vKeyValues : Variant;
  lAdd : Boolean;
begin
  Result := false;
  lAdd := false;
  if not mtDokumentADRES_ID.IsNull and (mtDokumentOWN_HOUSE.AsBoolean=true) and
     (nIdFirst>0) then begin
    // если список владельцев пуст и свой дом, то добавим главу в этот список
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := DateFiks;
    vKeyValues[1] := mtDokumentADRES_ID.AsInteger;
    if dmBase.tbHouseOwners.Locate('DATE_FIKS;ID', vKeyValues, []) then begin

      //  17.03.2010 , если список собственников не пуст, то не будем его трогать !!!

      {
      dmBase.tbHouseOwners.IndexName := 'PR_KEY';
      dmBase.tbHouseOwners.SetRange([DateFiks,mtDokumentADRES_ID.AsInteger],[DateFiks,mtDokumentADRES_ID.AsInteger]);
      dmBase.tbHouseOwners.First;
      iCount := 0;
      nCurID := 0;
      while not dmBase.tbHouseOwners.Eof do begin
        // человек из сельского совета
        if dmBase.tbHouseOwners.FieldByName('TYPEKOD').AsString=OWNER_NASEL_STR then begin
          nCurID := dmBase.tbHouseOwners.FieldByName('KOD').AsInteger;
        end;
        iCount := iCount + 1;
        dmBase.tbHouseOwners.Next;
      end;
      // если один собственник и он из с/с
      if (iCount=1) and (nCurID>0) then begin
        vKeyValues[1] := nCurID;
        // может человек умер или уехал или его просто удалили из базы
        if not dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
          dmBase.tbHouseOwners.Delete;
          lAdd := true;
        end;
      end;
      dmBase.tbHouseOwners.CancelRange;
      }
    end else begin
      lAdd := true;
    end;
    // если список собственников пуст, то добавим главу хоз-ва
    if lAdd and FCheckOwners then begin
      dmBase.tbHouseOwners.Append;
      dmBase.tbHouseOwners.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
      dmBase.tbHouseOwners.FieldByName('ID').AsInteger      := mtDokumentADRES_ID.AsInteger;
      dmBase.tbHouseOwners.FieldByName('KOD').AsInteger     := nIdFirst;
      dmBase.tbHouseOwners.FieldByName('TYPEKOD').AsInteger := OWNER_NASEL;
      dmBase.tbHouseOwners.FieldByName('NOMER').AsInteger   := 1;
      dmBase.tbHouseOwners.Post;
      Result := true;
    end;
  end;
end;

function TdmLichSchet.CancelDokument: Boolean;
begin
  Result := true;
end;

function TdmLichSchet.PostDokument: Boolean;
begin
  PostDataSet(mtDokument);
  PostDataSet(tbPriznaki);
  PostDataSet(tbNalogi);
  PostDataSet(tbDokumens);
  if mtDokumentADRES_ID.AsString='0' then begin
    EditDataSet(mtDokument);
    mtDokumentADRES_ID.AsString:='';
    PostDataSet(mtDokument);
  end;
  if tbDopProp.Active then begin
    PostDataSet(tbDopProp);
  end;
  Result := true;
end;

function TdmLichSchet.GetVid: String;
begin
  Result := 'LICH';
end;

function TdmLichSchet.CheckDokument(var strErr: String): Boolean;
var
  lCanDelete, lCheck, lYesMens, lPresent : Boolean;
  strDateLikv : String;
  d : TDateTime;
begin
  lCanDelete := false;
  lPresent   := true;
  strErr := '';
  Result := inherited CheckDokument(strErr);
  if Result then begin
    if GlobalTask.DemoVersion then begin
      if Result then begin
        if (dmBase.tbLich.RecordCount >= 20) and (mtDokumentID.AsInteger=-1) then begin
          strErr := 'В демо-версии невозможно создать болеее 20 лицевых счетов !';
          Result := false;
        end;
      end;
    end;
  end;
  if Result then begin
    if Trim(mtDokumentNOMER.AsString) = '' then begin
      strErr := 'Не введен номер лицевого счета !';
    end else if mtDokumentADRES_ID.AsString='' then begin
      strErr := 'Не выбран адрес лицевого счета !';
    end;
    if strErr<>'' then Result := false;
  end;
  if Result then begin
    if Trim(mtDokumentNOMER.AsString)<>'' then begin
      if not dmBase.CheckNomerLich(DateFiks, mtDokumentID.AsInteger, mtDokumentNOMER.AsString) then begin
        strErr := ' Введенный номер лицевого счета уже существует ! ';
        Result := false;
      end;
    end;
  end;
  strDateLikv:='';
  if Result then begin
    lCheck := dbDisableControls(dmMens.mtDokument);
    // проставлена дата ликвидации лицевого счета
    if not mtDokumentDATE_LIKV.IsNull then begin
      lYesMens   := false;
      // проверим если есть люди, то ставить признак для удаления нельзя
      dmMens.mtDokument.First;
      while not dmMens.mtDokument.Eof do begin
        if not dmMens.mtDokumentCANDELETE.AsBoolean then begin
          lYesMens := true;
          break;
        end;
        dmMens.mtDokument.Next;
      end;
      dmMens.mtDokument.First;
      if lYesMens then begin
        strErr := 'Нельзя ликвидировать счет с людьми !';
        Result := false;
      end else begin
        lCanDelete := true;
      end;
    end else begin
      dmMens.mtDokument.First;
      lYesMens := not dmMens.mtDokument.Eof;
      if not lYesMens then begin
        strErr := 'Не введен ни один человек !';
        Result := false;
      end else begin
        lCanDelete := true;
        lPresent := false;
        while not dmMens.mtDokument.Eof do begin

           //если человек не должен иметь адрес
//          if not dmMens.MustAdres then begin
//            strErr := 'На лицевом счете есть не зарегистрированный или не проживающий человек! ('+dmMens.GetFIO+')';
//            Result:=false;
//            break;
//          end;

          // если человек подлежит удалению
          if dmMens.mtDokumentCANDELETE.AsBoolean then begin
            //---- попытаемся проставить дату ликвидации лицевого счета ----
            if not dmMens.mtDokumentDATES.IsNull or not dmMens.mtDokumentDATEV.IsNull then begin
              if not dmMens.mtDokumentDATES.IsNull
                then d:=dmMens.mtDokumentDATES.AsDateTime
                else d:=dmMens.mtDokumentDATEV.AsDateTime;
              if strDateLikv='' then begin
                strDateLikv := DTOS(d);
              end else if STOD(strDateLikv)<d then begin // если дата ликвидации раньше, чем текущая дата убытия человека
                strDateLikv := DTOS(d);
              end;
            end;
          end else begin
            lCanDelete := false;
          end;
          if dmMens.mtDokumentPRESENT.AsBoolean then begin
            lPresent := true;
          end;
          dmMens.mtDokument.Next;
        end;
        dmMens.mtDokument.First;
      end;
    end;
    dbEnableControls(dmMens.mtDokument,lCheck);
  end;   
  if Result then begin
    Result := CheckFirst(strErr);
  end;
{
   проверка наличия человека с главой хозяйства

    if not mtDokumentFIRST.IsNull and mtDokumentFIRST.AsBoolean then begin
      if not mtDokumentPRESENT.AsBoolean then begin
        strErr := 'Отсутствующий человек не может быть главой хозяйства !';
        Result := false;
      end;
    end;
}
  if Result then begin
    EditDataSet(mtDokument);
    // если для удаления, то людей точно не должно быть
    if lCanDelete then lPresent:=false;
    mtDokumentCANDELETE.AsBoolean := lCanDelete;
    mtDokumentPRESENT.AsBoolean   := lPresent;
    if lCanDelete and (strDateLikv<>'') then begin
      mtDokumentDATE_LIKV.AsDateTime := STOD(strDateLikv);
    end;
    PostDataSet(mtDokument);
  end;
end;

//------------------------------------------------
// проверить первого члена хоз-ва
function TdmLichSchet.CheckFirst(var strErr: String): Boolean;
var
  ds : TDataSet;
  sBookMark : String;
//  nCount : Integer;
begin
//  nCount := 0;
//  strErr := '';
  Result := true;
  ds := dmMens.mtDokument;
  ds.DisableControls;
  sBookMark := ds.Bookmark;
  if ds.RecordCount = 0 then begin
//    strErr := 'Не введен ни один член хозяйства !';
//    Result := false;
  end else begin
    ds.First;
    while not ds.Eof do begin
      if ds.FieldByName('FAMILIA').AsString='' then begin
        strErr:='Заполните все фамилии !';
        Result:=false;
      end;
      ds.Next;
    end;
  end;
  ds.Bookmark := sBookMark;
  ds.EnableControls;
end;

//-----------------------------------------------------------------------
procedure TdmLichSchet.AfterCreateDokument;
var
  n:Int64;
begin
  inherited;
  {$IFDEF GKH}
    mtDokumentPRIVATE_SECT.AsBoolean := false;
    mtDokumentOWN_HOUSE.AsBoolean := false;
  {$ELSE}
    mtDokumentPRIVATE_SECT.AsBoolean := true;
    mtDokumentOWN_HOUSE.AsBoolean := true;
  {$ENDIF}
  if LastNomerLic<>'' then begin
    mtDokumentNOMER.AsString := IntToStr(StrToInt64(LastNomerLic)+1);
  end else begin
    if Globaltask.ParamAsInt64('MIN_TWO_NOMER')>0 then begin
      n:=dmBase.GetLastNomerLic;
      if n=0 then n:=dmBase.GetLastNomerLicFirst;
      mtDokumentNOMER.AsString := IntToStr(n+1);
    end else begin
      mtDokumentNOMER.AsString := IntToStr(dmBase.GetLastNomerLic+1);
    end;
  end;
end;

//----------------------------------------------------------------
// текущий собственник действительный
function TdmLichSchet.CurOwnerOk(d:TDateTime) : Boolean;
begin
  Result:=false;
  if tbHouseOwnersDATES.IsNull and tbHouseOwnersDATEP.IsNull then begin
    Result:=true;
  end else if not tbHouseOwnersDATES.IsNull and not tbHouseOwnersDATEP.IsNull then begin
    if (tbHouseOwnersDATES.AsDateTime<=d) and (d<=tbHouseOwnersDATEP.AsDateTime) then begin
      Result:=true;
    end;
  end else if tbHouseOwnersDATES.IsNull then begin
    if (d<=tbHouseOwnersDATEP.AsDateTime) then begin
      Result:=true;
    end;
  end else if tbHouseOwnersDATEP.IsNull then begin
    if (tbHouseOwnersDATES.AsDateTime<=d) then begin
      Result:=true;
    end;
  end;
end;

//-----------------------------------------------------------------------
// если nType=1  , то добавить какой частью владеет
//-----------------------------------------------------------------------
function TdmLichSchet.HouseOwners(sl:TStringList; nType:Integer) : String;
var
  s, strName,sBookmark : String;
  lPropis : Boolean;
  lMen,lOrg:Boolean;
  lOk,l1,l2:Boolean;
  d:TDateTime;
begin
  Result := '';
  if sl<>nil then sl.Clear;
  if mtDokumentADRES_ID.AsString='' then begin
    Result := '';
    exit;
  end;
  if DateFiks=dmBase.GetDateCurrentSost then begin
    d := dmBase.GetCurDate;
  end else begin
    d := DateFiks;
  end;
  l1:=dbDisableControls(tbHouseOwners);
  tbHouseOwners.First;
  lMen:=false;
  lOrg:=false;
  while not tbHouseOwners.Eof do begin
    //----------------------------------------
    lOk:=CurOwnerOk(d);
    //----------------------------------------
    if lOk then begin
      strName:='';
      if nType=2 then begin
        if tbHouseOwnersTYPEKOD.AsInteger=OWNER_NASEL then begin  // человек
          lMen:=true;
        end else begin
          lOrg:=true;
        end;
      end else begin
        if tbHouseOwnersTYPEKOD.AsInteger=OWNER_NASEL then begin  // человек
          // поищем в текущем лицевом счете
          l2:=dbDisableControls(dmMens.mtDokument);
          sBookmark:=dmMens.mtDokument.Bookmark;
          dmMens.mtDokument.First;
          while not dmMens.mtDokument.Eof do begin
            if tbHouseOwnersKOD.AsInteger=dmMens.mtDokumentID.AsInteger then begin
              strName:=dmMens.mtDokumentFAMILIA.AsString+' '+dmMens.mtDokumentNAME.AsString+' '+dmMens.mtDokumentOTCH.AsString;
              break;
            end;
            dmMens.mtDokument.Next;
          end;
          dmMens.mtDokument.Bookmark:=sBookmark;
          dbEnableControls(dmMens.mtDokument,l2);

        end;
        if strName='' then begin   // не нашли в текущем лицевом счете
          s := dmBase.AdresOwner(DateFiks, tbHouseOwnersKOD.AsString,
                 tbHouseOwnersTYPEKOD.AsInteger, strName, lPropis);
        end;
        if nType=1 then begin
          sl.Add(strName + ' ' + tbHouseOwnersTAIL.AsString);
          s := tbHouseOwnersTAIL.AsString;
          if (s<>'') and (s<>'1') then s := '-' + s + ' '+NAME_TAIL; //' часть';
          Result := Result + strName + s + ', ';
        end else begin
          sl.Add(strName);
          Result := Result + strName + ', ';
        end;
      end;
    end;
    tbHouseOwners.Next;
  end;

  if nType=2 then begin
    if lMen and lOrg then begin
      Result:='0';
    end else if lOrg then begin
      Result:='2';
    end else begin
      Result:='1';
    end;
  end else begin
    Result := Copy(Result,1,Length(Result)-2);
  end;

  tbHouseOwners.First;
  dbEnableControls(tbHouseOwners,l1);
end;

//-----------------------------------------------------------------------
// если собственник организация вернуть главу лиц. счета, инче список собственников
function TdmLichSchet.NanimOrOwners(sPar:String) : String;
var
  s,sDelim:String;
  lOrg:Boolean;
  lGos, lCheckOrg, lCheckGosud, lAddTail,l:Boolean;
  d:TDateTime;
  fld:TField;
begin
  Result := '';
  if mtDokumentADRES_ID.AsString='' then exit;
  if DateFiks=dmBase.GetDateCurrentSost then d:=dmBase.GetCurDate else d:=DateFiks;
  lAddTail:=(Pos('TAIL',sPar)>0);      // добавить часть владения
  // 'GOSUD' и 'ORG' взаимоисключающие !!!
  lCheckGosud:=(Pos('GOSUD',sPar)>0);  // контроль государственная ('1') или частная ('0')
  lCheckOrg:=(Pos('ORG',sPar)>0);      // собственник организация ('1') или нет ('0')
  l:=dbDisableControls(tbHouseOwners);
  tbHouseOwners.First;
  lOrg:=false;
  lGos:=false;
  if (Pos('CRLF',sPar)>0)       // разделитель перевод каретки
    then sDelim:=CRLF
    else sDelim:=', ';
  while not tbHouseOwners.Eof do begin
    if CurOwnerOk(d) then begin
      if tbHouseOwnersTYPEKOD.AsInteger=OWNER_ORG then begin
        lOrg:=true;
        if lCheckGosud then begin
          if dmBase.SprWork.Locate('ID', tbHouseOwnersKOD.AsInteger, []) then begin
            fld:=dmBase.SprWork.FindField('IS_GOSUD');    // в государственной собственности
            if (fld<>nil) and not fld.isNull and (fld.AsBoolean=true)
              then lGos:=true;
          end;
        end;
        break;
      end else if tbHouseOwnersTYPEKOD.AsInteger=OWNER_NASEL then begin  // человек
        Result:=Result+tbHouseOwnersNAME.AsString;
        if lAddTail then begin
          s:=Trim(tbHouseOwnersTAIL.AsString);
          if (s<>'') and (s<>'1') then s := '-' + s + ' '+NAME_TAIL; //' часть';
        end else begin
          s:='';
        end;
        Result:=Result+s+sDelim;
      end;
    end;
    tbHouseOwners.Next;
  end;
  if lCheckOrg then begin
    if lOrg
      then Result:='1'
      else Result:='0';
  end else if lCheckGosud then begin
    if lGos
      then Result:='1'
      else Result:='0';
  end else begin
    if lOrg then begin
      Result:=mtDokumentFIRST_FIO.AsString;
    end else begin
      Result:=Copy(Result,1,Length(Result)-2);
    end;
  end;
  tbHouseOwners.First;
  dbEnableControls(tbHouseOwners,l);
end;

end.
