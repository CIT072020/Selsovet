unit fZapisBrakV;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject, uTypes,
  ExtCtrls, OpisEdit, dbFunc, MetaTask, DBLookupEh, DBCtrlsEh, StdCtrls,
  Mask, Grids, DBGridEh, FuncPr, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList,Buttons, vchDBCtrls, kbmMemCSVStreamFormat, ZipForge;

type
  TfmZapisBrakV = class(TfmSimpleD)
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentON_Familia: TStringField;
    DokumentON_Otch: TStringField;
    DokumentON_Name: TStringField;
    DokumentON_DateR: TDateField;
    DokumentON_GOSUD: TIntegerField;
    DokumentON_OBL: TStringField;
    DokumentON_RAION: TStringField;
    DokumentON_GOROD: TStringField;
    DokumentON_NATION: TStringField;
    DokumentON_GRAG: TStringField;
    DokumentON_WORK: TStringField;
    DokumentON_OBRAZ: TIntegerField;
    DokumentON_M_GOSUD: TIntegerField;
    DokumentON_M_OBL: TStringField;
    DokumentON_M_RAION: TStringField;
    DokumentON_M_GOROD: TStringField;
    DokumentON_M_GOROD_R: TStringField;
    DokumentON_SEM: TIntegerField;
    DokumentON_DOKUMENT: TStringField;
    DokumentON_SVID: TStringField;
    DokumentOTMETKA: TMemoField;
    DokumentONA_Familia: TStringField;
    DokumentONA_Otch: TStringField;
    DokumentONA_Name: TStringField;
    DokumentONA_DateR: TDateField;
    DokumentONA_GOSUD: TIntegerField;
    DokumentONA_OBL: TStringField;
    DokumentONA_RAION: TStringField;
    DokumentONA_GOROD: TStringField;
    DokumentONA_NATION: TStringField;
    DokumentONA_GRAG: TStringField;
    DokumentONA_WORK: TStringField;
    DokumentONA_OBRAZ: TIntegerField;
    DokumentONA_M_GOSUD: TIntegerField;
    DokumentONA_M_OBL: TStringField;
    DokumentONA_M_RAION: TStringField;
    DokumentONA_M_GOROD: TStringField;
    DokumentONA_M_GOROD_R: TStringField;
    DokumentONA_SEM: TIntegerField;
    DokumentONA_DOKUMENT: TStringField;
    DokumentONA_SVID: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentDETI: TMemoField;
    TBItemChoiceMen: TTBItem;
    DokumentON_FamiliaP: TStringField;
    DokumentONA_FamiliaP: TStringField;
    pc: TPageControl;
    tsTail1: TTabSheet;
    Label1: TLabel;
    edON_Familia: TDBEditEh;
    edONA_Familia: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edON_FamiliaP: TDBEditEh;
    edONA_FamiliaP: TDBEditEh;
    Label5: TLabel;
    Label6: TLabel;
    lbDateR_Rodit: TLabel;
    edON_Name: TDBEditEh;
    edON_OTCH: TDBEditEh;
    edONA_Name: TDBEditEh;
    edONA_OTCH: TDBEditEh;
    edON_DATER: TDBDateTimeEditEh;
    edONA_DATER: TDBDateTimeEditEh;
    Label8: TLabel;
    edON_GOSUD: TDBLookupComboboxEh;
    edONA_GOSUD: TDBLookupComboboxEh;
    edON_GOROD: TDBEditEh;
    edONA_GOROD: TDBEditEh;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edON_NATION: TDBLookupComboboxEh;
    Label14: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    edSUD_NAME: TDBEditEh;
    edSUD_BRAK: TDBEditEh;
    edON_GRAG: TDBLookupComboboxEh;
    edONA_NATION: TDBLookupComboboxEh;
    edONA_GRAG: TDBLookupComboboxEh;
    tsTail2: TTabSheet;
    pnMain: TPanel;
    Label27: TLabel;
    edNomer: TDBEditEh;
    Label28: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label32: TLabel;
    edOTMETKA: TDBEditEh;
    dsDeti: TDataSource;
    tbDeti: TkbmMemTable;
    tbDetiFAMILIA: TStringField;
    tbDetiNAME: TStringField;
    tbDetiOTCH: TStringField;
    tbDetiGOD_ROG: TIntegerField;
    DokumentRUKOV: TStringField;
    DokumentON_B_RESP: TBooleanField;
    DokumentON_B_OBL: TBooleanField;
    DokumentON_M_B_RESP: TBooleanField;
    DokumentON_M_B_OBL: TBooleanField;
    DokumentONA_B_RESP: TBooleanField;
    DokumentONA_B_OBL: TBooleanField;
    DokumentONA_M_B_RESP: TBooleanField;
    DokumentONA_M_B_OBL: TBooleanField;
    edON_B_OBL: TDBCheckBoxEh;
    edONA_B_OBL: TDBCheckBoxEh;
    dsNation: TDataSource;
    dsStran: TDataSource;
    DokumentON_ID: TIntegerField;
    DokumentONA_ID: TIntegerField;
    DokumentFirst_Ekz: TBooleanField;
    N_F_1: TDBCheckBoxEh;
    Label40: TLabel;
    edSvid_Nomer: TDBEditEh;
    Label55: TLabel;
    DokumentSVID_SERIA: TStringField;
    edRukov: TDBEditEh;
    edDateSV: TDBDateTimeEditEh;
    Label29: TLabel;
    DokumentDATESV: TDateField;
    DokumentON_Familia_B: TStringField;
    DokumentON_FamiliaP_B: TStringField;
    DokumentON_Name_B: TStringField;
    DokumentON_Otch_B: TStringField;
    DokumentON_OBL_B: TStringField;
    DokumentON_RAION_B: TStringField;
    DokumentON_GOROD_B: TStringField;
    DokumentONA_Familia_B: TStringField;
    DokumentONA_FamiliaP_B: TStringField;
    DokumentONA_Name_B: TStringField;
    DokumentONA_Otch_B: TStringField;
    DokumentONA_OBL_B: TStringField;
    DokumentONA_RAION_B: TStringField;
    DokumentONA_GOROD_B: TStringField;
    DokumentRUKOV_B: TStringField;
    DokumentOSNOV: TBooleanField;
    DokumentSUD_NAME: TMemoField;
    DokumentSUD_DATE: TDateField;
    DokumentSUD_BRAK: TMemoField;
    DokumentZAVIT: TMemoField;
    DokumentVOSSTAN: TBooleanField;
    edSpec: TDBEditEh;
    DokumentSPEC: TStringField;
    edSUD_DATE: TDBDateTimeEditEh;
    Label15: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label16: TLabel;
    edZAVIT: TDBEditEh;
    DokumentID_ZAGS: TIntegerField;
    DokumentDATEB: TDateField;
    Label18: TLabel;
    edDateBrak: TDBDateTimeEditEh;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    Label41: TLabel;
    edOther: TDBEditEh;
    Label42: TLabel;
    edIzmen: TDBEditEh;
    dsGragd: TDataSource;
    DokumentON_ONLYGOD: TBooleanField;
    DokumentONA_ONLYGOD: TBooleanField;
    cbOnlyGodON: TDBCheckBoxEh;
    cbOnlyGodONA: TDBCheckBoxEh;
    DokumentCOPIA: TBooleanField;
    N_F_edCopy: TDBCheckBoxEh;
    N_F_cbPovtor: TDBCheckBoxEh;
    DokumentPOSHLINA: TStringField;
    edSVID_SERIA: TDBLookupComboboxEh;
    tsPovtor: TTabSheet;
    TBItemVozrast: TTBItem;
    DokumentON_VOZR: TSmallintField;
    DokumentONA_VOZR: TSmallintField;
    edON_VOZR: TDBNumberEditEh;
    edONA_VOZR: TDBNumberEditEh;
    edON_OBL_B: TDBEditEh;
    edON_RAION_B: TDBEditEh;
    edONA_OBL_B: TDBEditEh;
    edONA_RAION_B: TDBEditEh;
    cbBelorus: TDBCheckBoxEh;
    DokumentON_IDENTIF: TStringField;
    DokumentONA_IDENTIF: TStringField;
    DokumentON_STATUS: TStringField;
    DokumentONA_STATUS: TStringField;
    DokumentPOLE_GRN: TSmallintField;
    DokumentTYPEMESSAGE: TStringField;
    DokumentONA_B_GOROD: TSmallintField;
    DokumentON_B_GOROD: TSmallintField;
    DokumentONA_M_B_GOROD: TSmallintField;
    DokumentON_M_B_GOROD: TSmallintField;
    edON_B_GOROD: TDBLookupComboboxEh;
    edONA_B_GOROD: TDBLookupComboboxEh;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    ImageGISUN: TImage;
    Label7: TLabel;
    ENG_edON_IDENTIF: TDBEditEh;
    ENG_edONA_IDENTIF: TDBEditEh;
    DokumentON_VOENKOM: TIntegerField;
    DokumentONA_VOENKOM: TIntegerField;
    DokumentBRAK_RAST: TBooleanField;
    lbBrakRast: TvchDBText;
    cbRast: TDBCheckBoxEh;
    DokumentMESTO: TIntegerField;
    DokumentSPEC_B: TStringField;
    edON_OBL_R: TDBEditEh;
    edON_RAION_R: TDBEditEh;
    edONA_OBL_R: TDBEditEh;
    edONA_RAION_R: TDBEditEh;
    DokumentARX_ADRESAT: TMemoField;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    procedure edON_FamiliaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edONA_FamiliaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure cbBelorusClick(Sender: TObject);
    procedure edON_FamiliaEnter(Sender: TObject);
    procedure edON_FamiliaPEnter(Sender: TObject);
    procedure edON_OTCHEnter(Sender: TObject);
    procedure edON_NameEnter(Sender: TObject);
    procedure edONA_FamiliaEnter(Sender: TObject);
    procedure edONA_FamiliaPEnter(Sender: TObject);
    procedure edONA_NameEnter(Sender: TObject);
    procedure edONA_OTCHEnter(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure edON_FamiliaCheckDrawRequiredState(Sender: TObject;
      var DrawState: Boolean);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edRukovEnter(Sender: TObject);
    procedure cbOnlyGodONClick(Sender: TObject);
    procedure TBItemVozrastClick(Sender: TObject);
    procedure edON_OBL_RNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure edON_RAION_RNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure pcChange(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure TBItemStep1Click(Sender: TObject);
    procedure lbBrakRastGetText(Sender: TObject; var Text: String);
    procedure edON_DATERUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSpecEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
  public
    { Public declarations }
//    procedure SetIDZags;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure CheckOnlyGod;
    procedure CheckOnlyVozrast(lClear : Boolean);
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure UpdateActions; override;
    function BeforeEdit : Boolean; override;
    function CreateSubMenuRun: Boolean; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

  function EditZapisBrakV( nID : Integer; slPar:TStringList) : Boolean;

var
  fmZapisBrakV: TfmZapisBrakV;

implementation

uses dBase, fMain;

{$R *.DFM}
{$I Task.inc}

function EditZapisBrakV( nID : Integer; slPar:TStringList) : Boolean;
begin
//  result := true;
  fmZapisBrakV := TfmZapisBrakV.Create(nil);
  fmZapisBrakV.AssignPar(slPar); 
  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
    fmZapisBrakV.cbOnlyGodON.Visible:=true;
    fmZapisBrakV.cbOnlyGodONA.Visible:=true;
  end else begin
    fmZapisBrakV.cbOnlyGodON.Visible:=false;
    fmZapisBrakV.cbOnlyGodONA.Visible:=false;
  end;
  try
    fmZapisBrakV.IsReadDokument:=true;
    if nID=-1 then begin
      fmZapisBrakV.NewDok(true);
      fmZapisBrakV.SetIDZags;
      fmZapisBrakV.CheckEnabledNameOrgan(true);
    end else begin
      fmZapisBrakV.ReadDok( nID );
      fmZapisBrakV.TBItemZAGS.Visible:=false;
      fmZapisBrakV.CheckEnabledNameOrgan(false);
    end;
    fmZapisBrakV.IsReadDokument:=false;
    {$IFDEF GISUN}
      fmZapisBrakV.CheckAkt_GISUN(0);
//      Gisun.CheckMarriageV(fmZapisBrakV);
//      fmZapisBrakV.CheckImageGisun(fmZapisBrakV.DokumentPOLE_GRN,fmZapisBrakV.ImageGISUN);
      fmZapisBrakV.BeforeEditFormGISUN;
    {$ENDIF}
    result := fmZapisBrakV.EditModal;
  finally
    fmZapisBrakV.Free;
    fmZapisBrakV := nil;
  end;
end;

{ TfmZapisBrak }

{
function TfmZapisBrak.GetNameReport: String;
begin
  Result := '&Запись акта о браке.frf';
end;
}

function TfmZapisBrakV.GetVid: String;
begin
  Result := 'ZBrak';
end;

function TfmZapisBrakV.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  DokumentON_ONLYGOD.AsBoolean:=false;
  DokumentONA_ONLYGOD.AsBoolean:=false;

  DokumentON_B_RESP.AsBoolean     := false;
  DokumentON_B_OBL.AsBoolean      := true;
  DokumentON_M_B_RESP.AsBoolean   := false;
  DokumentON_M_B_OBL.AsBoolean    := true;
  DokumentONA_B_RESP.AsBoolean    := false;
  DokumentONA_B_OBL.AsBoolean     := true;
  DokumentONA_M_B_RESP.AsBoolean  := false;
  DokumentONA_M_B_OBL.AsBoolean   := true;

  DokumentON_B_GOROD.AsInteger    := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_M_B_GOROD.AsInteger  := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_B_GOROD.AsInteger   := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_M_B_GOROD.AsInteger := GlobalTask.ParamAsInteger('TYPEPUNKT');

  DokumentFirst_Ekz.AsBoolean := true;
  DokumentVOSSTAN.AsBoolean := true;
  DokumentBRAK_RAST.AsBoolean:=false;
  cbBelorus.Checked:=False;
  RadioButton1.Checked:=true;
  RadioButton2.Checked:=false;
  inherited NewDok(lAppend);
  QueryExit:=false;
  Result := true;
end;
{
procedure TfmZapisBrakV.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
function TfmZapisBrakV.ReadDok(nID: Integer): Boolean;
var
  i,j : Integer;
  fld : TField;
  strField,strDeti : String;
  arr : TArrStrings;
  sl  : TStringList;
begin
  Result := true;
  if not dmBase.tbZapisBrak.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbZapisBrak.FieldCount-1 do begin
    strField := dmBase.tbZapisBrak.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.tbZapisBrak.Fields[i]);
    end;
  end;
  DokumentON_B_RESP.AsBoolean:=false;    // типа реквизит отвечающий за корректировку реквизитов ГИС РН

  SetIDZags;
  if dmBase.tbZapisBrak.FieldByName('OSNOV').IsNull or
     not dmBase.tbZapisBrak.FieldByName('OSNOV').AsBoolean then begin
    RadioButton2.Checked:=true;
  end else begin
    RadioButton1.Checked:=true;
  end;

  ReadDopProperty(dmBase.TypeObj_ZBrak, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));

  if DokumentON_ONLYGOD.IsNull then DokumentON_ONLYGOD.AsBoolean:=false;
  if DokumentONA_ONLYGOD.IsNull then DokumentONA_ONLYGOD.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentBRAK_RAST.IsNull then DokumentBRAK_RAST.AsBoolean:=false;

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;

  ReadHistory(nID, dmBase.TypeObj_ZBrak);

  strDeti := dmBase.tbZapisBrak.FieldByName('DETI').AsString;
  StrToArr(strDeti, arr, Chr(13), true);
  sl := TStringList.Create;
  tbDeti.EmptyTable;
  for i:=Low(arr) to High(arr) do begin
    sl.CommaText := arr[i];
    tbDeti.Append;
    for j:=0 to sl.Count-1 do begin
      tbDeti.Fields[j].AsString := sl.Strings[j];
    end;
    tbDeti.Post;
  end;
  sl.Free;

  {$IFDEF ZAGS}
  TBItemVozrast.Checked := ((DokumentON_DateR.AsString='') and (DokumentON_VOZR.AsString<>''));
  if TBItemVozrast.Checked then CheckOnlyVozrast(false);
  {$ENDIF}

  //---------------------------------------
end;

function TfmZapisBrakV.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr : String;
  strRec, strDeti : String;
  {$IFNDEF ZAGS}
  vKeyValues : Variant;
  dLastSost : TDateTime;
  {$ENDIF}
begin
  AdditiveBeforeWriteDok;
  EditDataSet(Dokument);
  WriteOtherData(Dokument, 'OTHER', 'RUKOV_D;SPEC_D');
  PostDataSet(Dokument);
  PostDataSet(tbDeti);
  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
  if DokumentDATEZ.IsNull then begin
    strErr := ' Заполните дату акта о браке. ';
  end else if DokumentNOMER.AsString='' then begin
    strErr := ' Заполните номер акта о браке. ';
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства о браке. ';
  end;
  if (strErr='') then begin
     Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZBrak, DokumentID_ZAGS.AsInteger,
                    DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime, true);
     if not Result then exit;
  end;
  if strErr<>'' then begin
    PutError(strErr,self);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbZapisBrak.Append;
    dmBase.tbZapisBrak.Post;
    nID := dmBase.tbZapisBrak.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.tbZapisBrak.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    dmBase.tbZapisBrak.Edit;
    for i:=1 to dmBase.tbZapisBrak.FieldCount-1 do begin
      strField := dmBase.tbZapisBrak.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.tbZapisBrak.Fields[i].Value := fld.Value;
      end;
    end;
    strDeti := '';
    tbDeti.First;
    while not tbDeti.Eof do begin
      strRec := '"'+tbDetiFAMILIA.AsString+'",'+
                '"'+tbDetiNAME.AsString+'",'+
                '"'+tbDetiOTCH.AsString+'",'+
                '"'+tbDetiGOD_ROG.AsString+'"'+Chr(13);
      strDeti := strDeti + strRec;
      tbDeti.Next;
    end;
    dmBase.tbZapisBrak.FieldByName('DETI').AsString := strDeti;
    dmBase.tbZapisBrak.FieldByName('VOSSTAN').AsBoolean := true;
    if RadioButton1.Checked then begin
      dmBase.tbZapisBrak.FieldByName('OSNOV').AsBoolean := true;
    end else begin
      dmBase.tbZapisBrak.FieldByName('OSNOV').AsBoolean := false;
    end;

    if not FPrintSpecSvid
      then dmBase.tbZapisBrak.FieldByName('SPEC_B').AsString:='';

    WriteDateIzm;
    WriteForAllDok_BeforePost;

    dmBase.tbZapisBrak.Post;

    WriteDopProperty(dmBase.TypeObj_ZBrak, DokumentID.AsInteger,
                   STOD('1899-12-30',tdAds));

    WriteHistory(nID, dmBase.TypeObj_ZBrak);

    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    AdditiveWriteDok;
//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);


    QueryExit:=false;
    Result := true;
    if FCheckBelName and FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentON_FamiliaP.AsString, DokumentON_FamiliaP_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_FamiliaP.AsString, DokumentONA_FamiliaP_B.AsString);
      WriteForAll_Bel;
    end;
  {$IFNDEF ZAGS}
    dLastSost := dmBase.LastDateSost;
    if (dLastSost = dmBase.GetDateCurrentSost) or
       (DokumentDATEZ.AsDateTime >= dLastSost) then begin
      vKeyValues := VarArrayCreate( [0, 1], varOleStr );
      vKeyValues[0] := dmBase.GetDateCurrentSost;
      vKeyValues[1] := 0;
      if DokumentON_ID.AsString<>'' then begin
        // проставим у мужчины семейное положение
        vKeyValues[1] := DokumentON_ID.AsInteger;
        if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
          dmBase.tbMens.Edit;
          dmBase.tbMens.FieldByName('SEM').AsInteger := 1;
          dmBase.tbMens.Post;
        end;
      end;
      if DokumentONA_ID.AsString<>'' then begin
        // проставим у мужчины семейное положение
        vKeyValues[1] := DokumentONA_ID.AsInteger;
        if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
          dmBase.tbMens.Edit;
          dmBase.tbMens.FieldByName('SEM').AsInteger := 1;
          dmBase.tbMens.Post;
        end;
      end;
    end;
  {$ENDIF}
  end;
end;

constructor TfmZapisBrakV.Create(Owner: TComponent);
begin
  inherited;
  FCheckLookupField:=false;   // так как все поля (область,район,город) переделаны на DbEditEh.MRUList;
//  Dokument.Active:=true;
//  tbDeti.Active:=true;
  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';

  FDokZAGS := true;
  TypeObj := dmBase.TypeObj_ZBrak;
  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisBrak;
  dsGragd.DataSet := dmBase.SprGragd;
  edONA_Familia.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;
  FPageControl := pc;
  pc.ActivePageIndex:=0;
  edON_Familia.OnExit := OnDestroyHint;
  edON_FamiliaP.OnExit := OnDestroyHint;
  edON_Name.OnExit := OnDestroyHint;
  edON_Otch.OnExit := OnDestroyHint;
  edONA_Familia.OnExit := OnDestroyHint;
  edONA_FamiliaP.OnExit := OnDestroyHint;
  edONA_Name.OnExit := OnDestroyHint;
  edONA_Otch.OnExit := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;
//  fmMain.SetCurrentDokument(Dokument);
  {$IFDEF ZAGS}
    edON_Familia.EditButtons.Items[0].Visible:=false;
    edONA_Familia.EditButtons.Items[0].Visible:=false;
//    cbProvDvig.Visible := false;
//    cbProvDvig.Checked := false;
//    gbLich.Visible:=false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
    TBItemVozrast.Visible:=false;
    edCopy.Visible := false;
    cbPovtor.Visible := false;
  {$ENDIF}

  edON_Familia.OnUpdateData:=FIOUpdateData;
  edON_FamiliaP.OnUpdateData:=FIOUpdateData;
  edON_Name.OnUpdateData:=FIOUpdateData;
  edON_Otch.OnUpdateData:=FIOUpdateData;

  edONA_Familia.OnUpdateData:=FIOUpdateData;
  edONA_FamiliaP.OnUpdateData:=FIOUpdateData;
  edONA_Name.OnUpdateData:=FIOUpdateData;
  edONA_Otch.OnUpdateData:=FIOUpdateData;

  ENG_edONA_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edON_Identif.OnUpdateData:=IN_UpdateData;

  {$IFDEF GISUN}
  if IsActiveGISUN then
    SetControlCharCase(ecUpperCase,
      [
         edON_Familia, edON_FamiliaP, edON_Name, edON_Otch, edONA_Familia, edONA_FamiliaP,
         edONA_Name, edONA_Otch
      ]);
  {$ENDIF}

  edON_GOROD.OnUpdateData:=CityUpdate;
  edONA_GOROD.OnUpdateData:=CityUpdate;

  SetLength(FArrAddProperty,2);
  SetAddProperty(0, 'OTHER', '', ftMemo);
  SetAddProperty(1, 'IZMEN', '', ftMemo);
  SetcbBel(cbBelorus);

  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;

  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edONA_IDENTIF);

  SetLength(FArrCheckBelField,6);
  WriteToArrCheck(0,  1, false, 'ON_OBL'      , 'ON_OBL_B');
  WriteToArrCheck(1,  1, false, 'ONA_OBL'     , 'ONA_OBL_B');
  WriteToArrCheck(2,  2, false, 'ON_RAION'    , 'ON_RAION_B');
  WriteToArrCheck(3,  2, false, 'ONA_RAION'   , 'ONA_RAION_B');
  WriteToArrCheck(4,  3, true, 'ON_GOROD'    , 'ON_GOROD_B');
  WriteToArrCheck(5,  3, true, 'ONA_GOROD'   , 'ONA_GOROD_B');

  SetPanelPovtor(tsPovtor, N_F_cbPovtor, nil, nil);

  edON_OBL_B.Left  := edON_OBL_R.Left;
  edON_OBL_B.Width := edON_OBL_R.Width;
  edON_OBL_B.Visible := false;

  edON_RAION_B.Left := edON_RAION_R.Left;
  edON_RAION_B.Width := edON_RAION_R.Width;
  edON_RAION_B.Visible := false;

  edONA_OBL_B.Left := edONA_OBL_R.Left;
  edONA_OBL_B.Width := edONA_OBL_R.Width;
  edONA_OBL_B.Visible := false;

  edONA_RAION_B.Left := edONA_RAION_R.Left;
  edONA_RAION_B.Width := edONA_RAION_R.Width;
  edONA_RAION_B.Visible := false;

  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;

  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := IsActiveGISUN;
    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN('1');
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
end;

destructor TfmZapisBrakV.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZapisBrakV.edON_FamiliaEditButtons0Click(Sender: TObject;
          var Handled: Boolean);
begin
//      DokumentON_ID.AsInteger := v;
//      v := GetValueField(arrRec, 'FAMILIA');
//      if v = null then DokumentON_FAMILIA.AsString := ''
//                  else DokumentON_FAMILIA.AsString := v;
end;

procedure TfmZapisBrakV.edONA_FamiliaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
//      v := GetValueField(arrRec, 'FAMILIA');
//      if v = null then DokumentONA_FAMILIA.AsString := ''
//                  else DokumentONA_FAMILIA.AsString := v;
end;

procedure TfmZapisBrakV.cbBelorusClick(Sender: TObject);
begin
  if cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;
    edON_Familia.DataField  := 'ON_FAMILIA_B';
    edON_FamiliaP.DataField := 'ON_FAMILIAP_B';
    edON_Name.DataField     := 'ON_NAME_B';
    edON_Otch.DataField     := 'ON_OTCH_B';

    edON_OBL_B.Visible := true;
    edON_OBL_R.Visible := false;
    edON_RAION_B.Visible := true;
    edON_RAION_R.Visible := false;

    edON_Gorod.DataField    := 'ON_GOROD_B';
    edON_Gorod.MRUList.Active:=false;
    edON_GOSUD.ListField    := 'NAME_B';

    edONA_Familia.DataField  := 'ONA_FAMILIA_B';
    edONA_FamiliaP.DataField := 'ONA_FAMILIAP_B';
    edONA_Name.DataField     := 'ONA_NAME_B';
    edONA_Otch.DataField     := 'ONA_OTCH_B';

    edONA_OBL_B.Visible := true;
    edONA_OBL_R.Visible := false;
    edONA_RAION_B.Visible := true;
    edONA_RAION_R.Visible := false;

    edONA_Gorod.DataField    := 'ONA_GOROD_B';
    edONA_Gorod.MRUList.Active:=false;
    edONA_GOSUD.ListField    := 'NAME_B';

    edRukov.DataField       := 'RUKOV_B';
    edZAGS.DataField := 'NAME_ZAGS_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
  end else begin
    ActivateRUSKeyboard;
    edON_Familia.DataField  := 'ON_FAMILIA';
    edON_FamiliaP.DataField := 'ON_FAMILIAP';
    edON_Name.DataField     := 'ON_NAME';
    edON_Otch.DataField     := 'ON_OTCH';

    edON_OBL_B.Visible := false;
    edON_OBL_R.Visible := true;
    edON_RAION_B.Visible := false;
    edON_RAION_R.Visible := true;

    edON_Gorod.DataField    := 'ON_GOROD';
    edON_Gorod.MRUList.Active:=true;
    edON_GOSUD.ListField    := 'NAME';

    edONA_Familia.DataField  := 'ONA_FAMILIA';
    edONA_FamiliaP.DataField := 'ONA_FAMILIAP';
    edONA_Name.DataField     := 'ONA_NAME';
    edONA_Otch.DataField     := 'ONA_OTCH';

    edONA_OBL_B.Visible := false;
    edONA_OBL_R.Visible := true;
    edONA_RAION_B.Visible := false;
    edONA_RAION_R.Visible := true;

    edONA_Gorod.DataField    := 'ONA_GOROD';
    edONA_Gorod.MRUList.Active:=true;
    edONA_GOSUD.ListField    := 'NAME';

    edRukov.DataField       := 'RUKOV';
    edZAGS.DataField := 'NAME_ZAGS';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
  end;
end;

procedure TfmZapisBrakV.OnDestroyHint(Sender : TObject);
begin
  DestroyHint(H);
end;

procedure TfmZapisBrakV.edON_FamiliaEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edON_Familia,DokumentON_Familia.AsString+' ');
end;

procedure TfmZapisBrakV.edON_FamiliaPEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edON_FamiliaP,DokumentON_FamiliaP.AsString+' ');
end;

procedure TfmZapisBrakV.edON_OTCHEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edON_OTCH,DokumentON_OTCH.AsString+' ');
end;

procedure TfmZapisBrakV.edON_NameEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edON_Name,DokumentON_Name.AsString+' ');
end;

procedure TfmZapisBrakV.edONA_FamiliaEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edONA_Familia,DokumentONA_Familia.AsString+' ');
end;

procedure TfmZapisBrakV.edONA_FamiliaPEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edONA_FamiliaP,DokumentONA_FamiliaP.AsString+' ');
end;

procedure TfmZapisBrakV.edONA_NameEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edONA_NAME,DokumentONA_NAME.AsString+' ');
end;

procedure TfmZapisBrakV.edONA_OTCHEnter(Sender: TObject);
begin
  if cbBelorus.Checked then CreateHint(H,edONA_OTCH,DokumentONA_OTCH.AsString+' ');
end;

procedure TfmZapisBrakV.RadioButton1Click(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentOSNOV.AsBoolean := true;
end;

procedure TfmZapisBrakV.RadioButton2Click(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentOSNOV.AsBoolean := false;
end;

procedure TfmZapisBrakV.edON_FamiliaCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := cbBelorus.Checked;
end;

procedure TfmZapisBrakV.dsDokumentDataChange(Sender: TObject;  Field: TField);
var
  strField : String;
  Pol : TPol;
begin
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    if FCheckBelName then begin
      strField := UpperCase(Field.FieldName);
      FRun := true;
      EditDataSet(Dokument);
      if strField='ON_NAME' then begin
        Pol := tpM;
        if DokumentON_Name_B.AsString='' then begin
          DokumentON_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
        end;
      end else if strField='ON_OTCH' then begin
        Pol := tpM;
        if DokumentON_Otch_B.AsString='' then begin
          DokumentON_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
        end;
      end else if strField='ON_FAMILIA' then begin
        if DokumentON_Familia_B.AsString='' then begin
          DokumentON_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;
      end else if strField='ONA_FAMILIA' then begin
        if DokumentONA_Familia_B.AsString='' then begin
          DokumentONA_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;
      end else if strField='ON_FAMILIAP' then begin
        if DokumentON_FamiliaP_B.AsString='' then begin
          DokumentON_FamiliaP_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;
      end else if strField='ONA_FAMILIAP' then begin
        if DokumentONA_FamiliaP_B.AsString='' then begin
          DokumentONA_FamiliaP_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;                                      
      end;
      CheckForAll_Bel(Field);
      if strField='ONA_NAME' then begin
        Pol := tpG;
        if DokumentONA_Name_B.AsString='' then begin
          DokumentONA_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
        end;
      end else if strField='ONA_OTCH' then begin
        Pol := tpG;
        if DokumentONA_Otch_B.AsString='' then begin
          DokumentONA_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
        end;
      end;
      FRun := false;
    end;
  end;
  inherited;
end;

procedure TfmZapisBrakV.edRukovEnter(Sender: TObject);
begin  if cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

procedure TfmZapisBrakV.CheckOnlyGod;
begin
  if cbOnlyGodON.Checked then begin
    edON_DATER.EditButton.Visible:=false;
    edON_DATER.EditFormat:='YYYY';
  end else begin
    edON_DATER.EditButton.Visible:=true;
    edON_DATER.EditFormat:='DD.MM.YYYY';
  end;
  if cbOnlyGodONA.Checked then begin
    edONA_DATER.EditButton.Visible:=false;
    edONA_DATER.EditFormat:='YYYY';
  end else begin
    edONA_DATER.EditButton.Visible:=true;
    edONA_DATER.EditFormat:='DD.MM.YYYY';
  end;
end;

procedure TfmZapisBrakV.cbOnlyGodONClick(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZapisBrakV.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  AddSvid;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisBrakV.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisBrakV.UpdateActions;
begin
  inherited;
  {$IFDEF ZAGS}
    TBItemDolg.Enabled := N_F_edCopy.Checked;
  {$ENDIF}
end;

procedure TfmZapisBrakV.TBItemVozrastClick(Sender: TObject);
begin
  CheckOnlyVozrast(true);
end;

procedure TfmZapisBrakV.CheckOnlyVozrast(lClear: Boolean);
begin
  if TBItemVozrast.Checked then begin
    lbDateR_Rodit.Caption := '4. Возраст';
    edON_VOZR.Left      := edON_DATER.Left;
    edONA_VOZR.Left     := edONA_DATER.Left;
    cbOnlyGodON.Visible := false;
    cbOnlyGodONA.Visible:= false;
    edON_DATER.Visible  := false;
    edONA_DATER.Visible := false;
    edON_VOZR.Visible   := true;
    edONA_VOZR.Visible  := true;
    if lClear then begin
      edON_DATER.Value  := null;
      edONA_DATER.Value := null;
    end;
  end else begin
    lbDateR_Rodit.Caption := '4. Дата рождения';
    edON_DATER.Visible  := true;
    edONA_DATER.Visible := true;
    cbOnlyGodON.Visible := true;
    cbOnlyGodONA.Visible:= true;
    edON_VOZR.Visible   := false;
    edONA_VOZR.Visible  := false;
    if lClear then begin
      edON_VOZR.Value   := null;
      edONA_VOZR.Value  := null;
    end;
  end;
end;

procedure TfmZapisBrakV.edON_OBL_RNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisBrakV.edON_RAION_RNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisBrakV.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then
    cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
end;

procedure TfmZapisBrakV.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetMarriageV(Self);
//  Gisun.CheckMarriageV(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisBrakV.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterMarriageV(Self);
//  Gisun.CheckMarriageV(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisBrakV.lbBrakRastGetText(Sender: TObject; var Text: String);
begin
  if DokumentBRAK_RAST.AsBoolean then begin
    text := 'Брак'+#13+'расторгнут';
  end else begin
    text := '';
  end;
end;

procedure TfmZapisBrakV.edON_DATERUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmZapisBrakV.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edON_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edONA_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edON_OBL_R,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_OBL_R,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edON_RAION_R,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_RAION_R,n,2,true,false,false,FAddButtonMRUList);
end;

procedure TfmZapisBrakV.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;

procedure TfmZapisBrakV.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

function TfmZapisBrakV.CreateSubMenuRun: Boolean;
begin
  inherited CreateSubmenuRun;
  Result:=true;
  AddSubmenu_ReadDolg;
end;

end.
