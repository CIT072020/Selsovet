unit fZAGS_ZaklSnBrak;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, fSimpleSeekAkt, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uSaveMemTable,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc, uDataSet2XML, DateUtils,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat;

type
  TfmZAGS_ZaklSnBrak = class(TfmSimpleD)
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentMEN_ID: TIntegerField;
    DokumentLICH_ID: TIntegerField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentPOL: TStringField;
    DokumentGRAG: TIntegerField;
    DokumentDateR: TDateField;
    DokumentGT_GOSUD: TIntegerField;
    DokumentGT_OBL: TStringField;
    DokumentGT_RAION: TStringField;
    DokumentGT_GOROD: TStringField;
    DokumentGT_GOROD_R: TStringField;
    DokumentRUKOV: TStringField;
    DokumentGT_B_RESP: TBooleanField;
    DokumentGT_B_OBL: TBooleanField;
    dsStran: TDataSource;
    dsNation: TDataSource;
    DokumentID_ZAGS: TIntegerField;
    dsGragd: TDataSource;
    DokumentGT_RNGOROD: TStringField;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    DokumentGT_B_GOROD: TSmallintField;
    ApplicationEvents1: TApplicationEvents;
    DokumentADRESAT: TMemoField;
    DokumentR_NOMER: TStringField;
    DokumentR_DATE: TDateField;
    DokumentR_ZAGS: TMemoField;
    TBItemAktRogd: TTBItem;
    TBItemAktBrak: TTBItem;
    DokumentDOLG_RUKOV: TStringField;
    DokumentSPEC: TStringField;
    DokumentDOLG_SPEC: TStringField;
    DokumentPRINT_RAZR: TBooleanField;
    pnFIO: TPanel;
    gbGit: TGroupBox;
    Label15: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label53: TLabel;
    edGT_B_RESP: TDBCheckBoxEh;
    edGT_GOSUD: TDBLookupComboboxEh;
    edGT_B_OBL: TDBCheckBoxEh;
    edGT_GOROD: TDBEditEh;
    edGT_GOROD_R: TDBEditEh;
    edGT_B_GOROD: TDBLookupComboboxEh;
    edGT_RN: TDBEditEh;
    edGT_OBL: TDBEditEh;
    gbAktRogd: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Label28: TLabel;
    edRNomer: TDBEditEh;
    edRDate: TDBDateTimeEditEh;
    edRZAGS: TDBEditEh;
    edRFamilia: TDBEditEh;
    edRName: TDBEditEh;
    edROtch: TDBEditEh;
    pnRukov: TPanel;
    lbRukov: TvchDBText;
    lbSpec: TvchDBText;
    edRukov: TDBEditEh;
    edSpec: TDBEditEh;
    cbRazr: TDBCheckBoxEh;
    gbSvid: TPanel;
    DokumentD1_DOK_TYPE: TIntegerField;
    DokumentD1_DOK_SERIA: TStringField;
    DokumentD1_DOK_NOMER: TStringField;
    DokumentD1_DOK_ORGAN: TIntegerField;
    DokumentD1_DOK_DATE: TDateField;
    DokumentD2_DOK_TYPE: TIntegerField;
    DokumentD2_DOK_SERIA: TStringField;
    DokumentD2_DOK_NOMER: TStringField;
    DokumentD2_DOK_ORGAN: TIntegerField;
    DokumentD2_DOK_DATE: TDateField;
    DokumentD1_DOKUMENT: TMemoField;
    DokumentD2_DOKUMENT: TMemoField;
    edSVID_SERIAP: TDBLookupComboboxEh;
    Label4: TLabel;
    Label5: TLabel;
    edSvid_NomerP: TDBEditEh;
    DokumentSVID_SERIA: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentSVID_SERIAP: TStringField;
    DokumentSVID_NOMERP: TStringField;
    DokumentIDENTIF: TStringField;
    lbIDENTIF: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    DokumentIS_MY: TBooleanField;
    N_F_cbIsMy: TDBCheckBoxEh;
    DokumentFamilia1: TStringField;
    DokumentName1: TStringField;
    DokumentOtch1: TStringField;
    edDateSv: TDBDateTimeEditEh;
    Label6: TLabel;
    DokumentIS_SKLON: TBooleanField;
    DokumentD1_IDENTIF: TStringField;
    DokumentD2_IDENTIF: TStringField;
    DokumentDATEZV: TDateField;
    DokumentNOMERZV: TStringField;
    DokumentFamilia2: TStringField;
    DokumentName2: TStringField;
    DokumentOtch2: TStringField;
    DokumentSVED_TWO: TMemoField;
    pnDoks: TPanel;
    gbDoks: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    lbSvid: TLabel;
    Label55: TLabel;
    edD1_DOK_TYPE: TDBComboBoxEh;
    edD1_DOK_SERIA: TDBEditEh;
    edD1_DOK_NOMER: TDBEditEh;
    edD1_DOKUMENT: TDBEditEh;
    edD1_DOK_DATE: TDBDateTimeEditEh;
    edD2_DOK_TYPE: TDBComboBoxEh;
    edD2_DOK_SERIA: TDBEditEh;
    edD2_DOK_NOMER: TDBEditEh;
    edD2_DOKUMENT: TDBEditEh;
    edD2_DOK_DATE: TDBDateTimeEditEh;
    edSVID_SERIA: TDBLookupComboboxEh;
    edSvid_Nomer: TDBEditEh;
    Label7: TLabel;
    edSvedTwo: TDBEditEh;
    N_F_cbSklon: TDBCheckBoxEh;
    Label8: TLabel;
    edNomerZv: TDBEditEh;
    Label9: TLabel;
    edDateZv: TDBDateTimeEditEh;
    DokumentZV: TStringField;
    pn: TPanel;
    lbNomer: TLabel;
    Label11: TLabel;
    edNomer: TDBEditEh;
    edDateZ: TDBDateTimeEditEh;
    DokumentDATESV: TDateField;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    edFamilia: TDBEditEh;
    Label2: TLabel;
    edName: TDBEditEh;
    Label3: TLabel;
    edOtch: TDBEditEh;
    edZvl: TDBComboBoxEh;
    N_F_cbSklonR: TDBCheckBoxEh;
    DokumentIS_SKLONR: TBooleanField;
    edDateR: TDBDateTimeEditEh;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edGT_RNGORODNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure cbOnlyGodChange(Sender: TObject);
    procedure cbOnlyGodRChange(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure btChoiceChildClick(Sender: TObject);
    procedure TBItemAktRogdClick(Sender: TObject);
    procedure TBItemAktBrakClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edNameUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSpecEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure TBItemSeekAktClick(Sender: TObject);
    procedure edD2_DOK_TYPEEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSvid_NomerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edRNameUpdateData(Sender: TObject; var Handled: Boolean);
    procedure N_F_cbIsMyClick(Sender: TObject);
  private
//    H : THintWindow;
    procedure OnDestroyHint( Sender : TObject);
    procedure SetIDZags;
  public
    { Public declarations }
    function CreateSubMenuRun: Boolean; override;
    procedure WriteSoato(fld:TField);
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    function GetTypeBrak:Integer;
    procedure UpdateActions; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    function BeforeEdit : Boolean; override;
    function SaveToIni : Boolean; override;
    procedure LoadFromIni; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure CheckOnlyGod;
    procedure CheckOnlyGodR;
    procedure CheckRnGorod;
    procedure ReadZRogd(arrRec:TCurrentRecord);
    procedure PostDokument; override;
    function AddParEnterAdresat(slPar: TStringList; strFieldName:String=''): Boolean;  override;
  end;

  function EditZAGS_ZaklSnBrak(nID : Integer) : Boolean;


implementation

uses dBase, fMain, fShablon, fEnterDokument, uProject;

{$R *.DFM}

var
  fmZAGS_ZaklSnBrak: TfmZAGS_ZaklSnBrak;

function EditZAGS_ZaklSnBrak(nID : Integer) : Boolean;
begin
//  result := true;
  fmZAGS_ZaklSnBrak := TfmZAGS_ZaklSnBrak.Create(nil);
  try
    with fmZAGS_ZaklSnBrak do begin
      IsReadDokument:=true;
      TBItemZAGS.Visible:=false;
      TBToolbarOrgan.Visible:=false;
      if nID=-1 then begin
        NewDok(true);
        SetIDZags;
//      CheckEnabledNameOrgan(true);
      end else begin
        ReadDok( nID );
//      CheckEnabledNameOrgan(false);
        TBToolbarOrgan.Visible:=false;
      end;
      IsReadDokument:=false;
      QueryExit:=false;
      Result:=EditModal;
    end;
  finally
    fmZAGS_ZaklSnBrak.Free;
    fmZAGS_ZaklSnBrak:=nil;
  end;
end;

{ TfmZAGS_ZaklAddIN }

constructor TfmZAGS_ZaklSnBrak.Create(Owner: TComponent);
var
  n:Integer;
  d2xml:TDataSet2XML;
begin
  inherited;

  edD2_DOK_TYPE.EditButtons[0].Glyph:=ImBtClear.Picture.Bitmap;
  edSVID_NOMER.EditButtons[0].Glyph:=ImBtClear.Picture.Bitmap;

  d2xml:=ds2xml.DS_Add(Dokument,true);
  d2xml.FClearRecord:=false;
  d2xml.ExceptFields:='ID;ID_ZAGS;NAME_ZAGS;NAME_ZAGSB';
//  ds2xml.DS_Add(tbDeti);

 // FDokZAGS := true;
  FCheckLookupField:=false;
//  dmBase.SetDateFormat(tbDeti);
//  if not tbDeti.Active then tbDeti.Active:=true;
  if not Dokument.Active then Dokument.Active:=true;

  TypeObj := _TypeObj_ZAGS_ZaklAddIN;

// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(1);
  SetMRUList(edGT_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edGT_RN,n,2,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(3);
  SetMRUList(edGT_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  SetLength(FArrChoiceRekv,3);
//  FArrChoiceRekv[0].nType:=SHABLON_ADRESAT;
//  FArrChoiceRekv[0].FieldName:='ADRESAT';

  FArrChoiceRekv[0].nType:=1;
  FArrChoiceRekv[0].FieldName:='D1_DOKUMENT';

  FArrChoiceRekv[1].nType:=1;
  FArrChoiceRekv[1].FieldName:='D2_DOKUMENT';

  FArrChoiceRekv[2].nType:=0;
  FArrChoiceRekv[2].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[2].FieldName:='R_ZAGS';
  FArrChoiceRekv[2].sPadeg:=''; //'Т';

  {
  SetLength(FArrChoiceRekv,7);
  FArrChoiceRekv[0].nType:=0;
  FArrChoiceRekv[0].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[0].FieldName:='WORK_NAME';
  FArrChoiceRekv[1].nType:=SHABLON_SP_SM;
  FArrChoiceRekv[1].FieldName:='DOKUMENT';
  FArrChoiceRekv[2].nType:=SHABLON_DOKUMENT;
  FArrChoiceRekv[2].FieldName:='SDAN_DOK';

  FArrChoiceRekv[3].nType:=0;
  FArrChoiceRekv[3].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[3].FieldName:='GT_GOROD_R';
  }
//  FAutoNum := false;
  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.AddDokZAGS;
  dsGragd.DataSet := dmBase.SprGragd;
//  edFamilia.EditButtons[0].Glyph := edDecl.EditButtons[0].Glyph;

  FPageControl := nil;

//  edFamilia.OnExit := OnDestroyHint;
//  edName.OnExit    := OnDestroyHint;
//  edOtch.OnExit    := OnDestroyHint;
//  edRukov.OnExit   := OnDestroyHint;

//  fmMain.SetCurrentDokument(Dokument);

//  edFamilia.EditButtons.Items[0].Visible:=false;

//  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
//    cbOnlyGodR.ClientWidth := GetTextWidth(cbOnlyGodR.Items[2],cbOnlyGodR.Font.Height,cbOnlyGodR.Font.Name,true)+GetSystemMetrics(SM_CXVSCROLL)+2*GetSystemMetrics(SM_CXEDGE); //+5;
//    cbOnlyGodR.Left  := lbDateR.Left+lbDateR.Width+5;
//    edDateR.Left := cbOnlyGodR.Left+cbOnlyGodR.Width+5;
//  end else begin
//    cbOnlyGodR.Visible:=false;
//  end;

  FTypeCheckRegistr:=EC_FIRST;  // !!!
  
  edFamilia.OnUpdateData:=FIOUpdateData;
//  edName.OnUpdateData:=FIOUpdateData;  !!!
//  edOtch.OnUpdateData:=FIOUpdateData;  !!!

  edRFamilia.OnUpdateData:=FIOUpdateData;
//  edRName.OnUpdateData:=FIOUpdateData;  !!!
//  edROtch.OnUpdateData:=FIOUpdateData;  !!!

  edGT_GOROD.OnUpdateData:=CityUpdate;

  SetcbBel(nil);
{
  SetLength(FArrCheckField,5);
  WriteToArrCheck(0,  1, false, 'GT_OBL'    );
  WriteToArrCheck(1,  2, false, 'GT_RAION'  );
  WriteToArrCheck(2,  1, false, 'RG_OBL'    );
  WriteToArrCheck(3,  2, false, 'RG_RAION'  );
  WriteToArrCheck(4,  3, false, 'GT_RNGOROD');
}
  //SetPanelPovtor(tsPovtor, cbPovtor, Label41, Label42);
  TBSubmenuGISUN.Visible:=false;
//  ImageGISUN.Visible := false;
end;

destructor TfmZAGS_ZaklSnBrak.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZAGS_ZaklSnBrak.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmZAGS_ZaklSnBrak.GetVid: String;
begin
  Result := 'ZAGS_ZaklAddIN';
end;

function TfmZAGS_ZaklSnBrak.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;

//  DokumentPOVTOR.AsBoolean:=false;
//  DokumentCOPIA.AsBoolean:=false;

  DokumentGT_B_RESP.AsBoolean:=true;
  DokumentGT_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');

  DokumentIS_SKLON.AsBoolean:=GlobalTask.GetLastValueAsBoolean('ZAKLADDIN_SKLON');
  DokumentIS_SKLONR.AsBoolean:=GlobalTask.GetLastValueAsBoolean('ZAKLADDIN_SKLONR');

  DokumentRUKOV.AsString:=GlobalTask.GetLastValueAsString( 'ZAKLADDIN_RUKOV');
  if DokumentRUKOV.AsString<>''
    then DokumentDOLG_RUKOV.AsString:=GlobalTask.GetLastValueAsString('ZAKLADDIN_RUKOV_DOLG');

//  DokumentSPEC.AsString:=GlobalTask.GetLastValueAsString( 'ZAKLADDIN_SPEC');
//  if DokumentSPEC.AsString<>''
//    then DokumentDOLG_SPEC.AsString:=GlobalTask.GetLastValueAsString('ZAKLADDIN_SPEC_DOLG');

//  if GlobalTask.GetLastValueAsString('ZAKLCHNAME_UTV')='0'
//    then DokumentPRINT_RAZR.AsBoolean:=false
//    else DokumentPRINT_RAZR.AsBoolean:=true;

//  cbBelorus.Checked:=false;
//  if lAppend then begin
//    CheckRnGorod;
//  end;
  inherited NewDok(lAppend);

  QueryExit:=false;
  Result := true;
end;

function TfmZAGS_ZaklSnBrak.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField,s : String;
begin
  Result := true;
  if not dmBase.AddDokZAGS.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
//  NewDok(false);

  //------- читаем карточку -----------

  if dmBase.AddDokZAGS.FieldByName('VERSION').AsString='1' then begin
    Dokument.EmptyTable;
    Dokument.Append;
    Dokument.Post;
//    tbDeti.EmptyTable;

    ds2xml.StringToXML(dmBase.AddDokZAGS.FieldByName('VALUE').AsString);
    ds2xml.XMLToData;

  end else begin
    Dokument.EmptyTable;
//    tbDeti.EmptyTable;
    LoadMemTableFromStr(dmBase.AddDokZAGS.FieldByName('VALUE').AsString,
                        ['DOKUMENT', Dokument],dmBase.AddDokZAGS.FieldByName('FIELD_DELIMITER').AsString,nil);
  end;

//  tbDeti.First;
  Dokument.First;
  Dokument.Edit;
  for i:=0 to dmBase.AddDokZAGS.FieldCount-1 do begin
    strField := dmBase.AddDokZAGS.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.AddDokZAGS.Fields[i]);
    end;
  end;
  SetIDZags;
  DokumentPRINT_RAZR.AsBoolean:=true;

  s:=PolFrom(DokumentNAME.AsString, DokumentOTCH.AsString);
  if s<>'' then begin
    DokumentPOL.AsString:=s;
  end;
  if DokumentPOL.AsString='' then begin
    DokumentPOL.AsString:='М';
  end;

//  ReadDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger,
//          STOD('1899-12-30',tdAds));

//  DokumentCOPIA.AsBoolean:=false;

//  DokumentGT_RNGOROD.AsString  := '';
//  if DokumentGT_B_RN.IsNull then DokumentGT_B_RN.AsBoolean:=true;
//  if not DokumentGT_B_RN.AsBoolean then begin
//    DokumentGT_RNGOROD.AsString := DokumentGT_RAION.AsString;
//    DokumentGT_RAION.AsString   := '';
//  end;

  AdditiveReadDok;

//  CheckRnGorod;

  Dokument.Post;

end;

//------------------------------------------------------------------------
procedure TfmZAGS_ZaklSnBrak.WriteSoato(fld:TField);
var
  SOATO:TSOATO;
begin
  SOATO:=dmBase.GetSoatoAkt(Dokument,
        'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION,GT_RNGOROD;GT_GOROD,GT_B_GOROD',true,FLenSoato);
  if (SOATO.Kod='9000000') and (DokumentGT_GOSUD.IsNull or (DokumentGT_GOSUD.AsInteger=MY_GRAG)) then begin
    SOATO:=dmBase.GetSoatoAkt(Dokument,
          'SM_GOSUD,FName;SM_OBL;SM_RAION;SM_GOROD,SM_B_GOROD',true,FLenSoato);

  end;
  fld.AsString:=SOATO.Kod;
end;
//------------------------------------------------------------------------
function TfmZAGS_ZaklSnBrak.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr, strRazd : String;
begin
  AdditiveBeforeWriteDok;
  PostDataSet(Dokument);
//  PostDataSet(tbDeti);
  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
//  if DokumentDATEZ.IsNull then begin
//    strErr := ' Заполните дату. ';
//  end else if DokumentNOMER.AsString='' then begin
//    strErr := ' Заполните номер. ';
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства о смерти. ';
  if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then begin
    strErr := ' Заполните Фамилия, Имя. ';
  end;

  if strErr<>'' then begin
    PutError(strErr);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.AddDokZAGS.Append;
    dmBase.AddDokZAGS.Post;
    nID := dmBase.AddDokZAGS.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.AddDokZAGS.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;

    dmBase.AddDokZAGS.Edit;
    SaveDef:=false;

    if FWriteAsXML then begin
      if ds2xml.DataToXML then begin
        dmBase.AddDokZAGS.FieldByName('VALUE').AsString:=ds2xml.XMLToString;
        dmBase.AddDokZAGS.FieldByName('VERSION').AsString:='1';
      end else begin
        PutError(ds2xml.LastError,self);
      end;
    end else begin
      dmBase.AddDokZAGS.FieldByName('VALUE').AsString:=SaveMemTableToStr(['DOKUMENT', dokument], strRazd, nil);
      dmBase.AddDokZAGS.FieldByName('FIELD_DELIMITER').AsString:=strRazd;
      dmBase.AddDokZAGS.FieldByName('VERSION').AsString:='0';
    end;

    for i:=1 to dmBase.AddDokZAGS.FieldCount-1 do begin
      strField := dmBase.AddDokZAGS.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.AddDokZAGS.Fields[i].Value := fld.Value;
      end;
    end;

    dmBase.AddDokZAGS.FieldByName('TYPEDOK').AsInteger:=TypeObj;
    dmBase.AddDokZAGS.Post;

    if FAddNewDok then begin
      GlobalTask.SetLastValueAsBoolean('ZAKLADDIN_SKLON', DokumentIS_SKLON.AsBoolean);
      GlobalTask.SetLastValueAsBoolean('ZAKLADDIN_SKLONR', DokumentIS_SKLONR.AsBoolean);
      GlobalTask.SetLastValueAsString('ZAKLADDIN_RUKOV', DokumentRUKOV.AsString);
      if DokumentRUKOV.AsString=''
        then GlobalTask.SetLastValueAsString('ZAKLADDIN_RUKOV_DOLG','')
        else GlobalTask.SetLastValueAsString('ZAKLADDIN_RUKOV_DOLG',DokumentDOLG_RUKOV.AsString);
    end;

//    WriteDopProperty(dmBase.TypeObj_ZSmert, DokumentID.AsInteger,
//                   STOD('1899-12-30',tdAds));


    AdditiveWriteDok;
//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);
    QueryExit:=false;
    Result := true;
    if Result then QueryExit:=false;
  end;
end;

procedure TfmZAGS_ZaklSnBrak.UpdateActions;
begin
  inherited;
end;
//-----------------------------------------------------------------------------
procedure TfmZAGS_ZaklSnBrak.dsDokumentDataChange(Sender: TObject; Field: TField);
//var
//  strField : String;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    FRun:=true;
    try
    {
    strField:=ANSIUpperCase(Field.FieldName);
    if strField = 'FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentMEN_ID.AsString:='';
      end else begin
        edRFamilia.Text:=Field.AsString;
      end;
    end else if strField = 'NAME' then begin
      if Field.AsString<>'' then begin
        edRName.Text:=Field.AsString;
      end;
    end else if strField = 'OTCH' then begin
      if Field.AsString<>'' then begin
        edROtch.Text:=Field.AsString;
      end;
    end;
    }
    finally
      FRun:=false;
    end;
  end;
end;
//-----------------------------------------------------------------------------
function TfmZAGS_ZaklSnBrak.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
end;
//-----------------------------------------------------------------------------
procedure TfmZAGS_ZaklSnBrak.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;
//-----------------------------------------------------------------------------
function TfmZAGS_ZaklSnBrak.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;
//-----------------------------------------------------------------------------
procedure TfmZAGS_ZaklSnBrak.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;
//-----------------------------------------------------------------------------
procedure TfmZAGS_ZaklSnBrak.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmZAGS_ZaklSnBrak.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmZAGS_ZaklSnBrak.CheckOnlyGod;
begin
end;

procedure TfmZAGS_ZaklSnBrak.CheckOnlyGodR;
begin
//  if cbOnlyGodR.ItemIndex=2 then begin          // год и месяц
//    edDATER.EditButton.Visible:=false;
//    edDATER.EditFormat:='MM.YYYY';
//  end else if cbOnlyGodR.ItemIndex=1 then begin // год
//    edDATER.EditButton.Visible:=false;
//    edDATER.EditFormat:='YYYY';
//  end else begin      // полная дата
//    edDATER.EditButton.Visible:=true;
//    edDATER.EditFormat:='DD.MM.YYYY';
//  end;
end;

procedure TfmZAGS_ZaklSnBrak.edGT_RNGORODNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZAGS_ZaklSnBrak.CheckRnGorod;
//var
//  nW,nL,nT, nW1 : Integer;
begin
{
  if EnabledRnGorod or
     (not DokumentGT_B_RN.IsNull and not DokumentGT_B_RN.AsBoolean) then begin
    nW  := edGT_GOROD_R.Width;
    nL  := edGT_RAION.Left;
    nT  := edGT_GOROD_R.Top;
    nW1 := edGT_RNGOROD.Width;
    edGT_RNGOROD.Left  := nL;
    edGT_RNGOROD.Top   := nT;
    edGT_GOROD_R.Width := nW - nW1 - 5;
    edGT_GOROD_R.Left  := nL + nW1 + 5;
    edGT_RNGOROD.Visible := true;
  end else begin
    edGT_RNGOROD.Visible := false;
  end;
}
end;

procedure TfmZAGS_ZaklSnBrak.cbOnlyGodChange(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZAGS_ZaklSnBrak.cbOnlyGodRChange(Sender: TObject);
begin
  CheckOnlyGodR;
end;

procedure TfmZAGS_ZaklSnBrak.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmZAGS_ZaklSnBrak.CreateSubMenuRun: Boolean;
//var
// it : TTbItem;
// sep : TTbSeparatorItem;
begin
  Result:=false;

//  it := TTbItem.Create(TBSubmenuRun);
//  it.Caption:='Аннулирование актовой записи';
//  it.OnClick:=Event_Annulir;
//  TBSubmenuRun.Add(it);
end;

procedure TfmZAGS_ZaklSnBrak.btAddChildClick(Sender: TObject);
begin
//  tbDeti.Append;
//  ActiveControl:=GridDeti;
end;

procedure TfmZAGS_ZaklSnBrak.btDelChildClick(Sender: TObject);
begin
//  if tbDeti.RecordCount>0 then begin
//    tbDeti.Delete;
//    ActiveControl:=GridDeti;
//  end;
end;

//--------------------------------------------------------------------------
// выбор актовой записи о рождении ребенка
procedure TfmZAGS_ZaklSnBrak.btChoiceChildClick(Sender: TObject);
{
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
}  
begin
{
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ROGD');
  if Opis<>nil then begin
//    if edFamiliaDo.Text<>'' then begin
//      Opis.DataSet.Filter := 'FAMILIA='+QStr(edFamiliaDo.Text);
//    end;
//    Opis.DataSet.Filtered := true;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(GridDeti, v, arrRec, nil) and (v<>null) then begin
      tbDeti.Append;
      tbDetiFIO.AsString := GetValueFieldEx(arrRec, 'FAMILIA','')+' '+GetValueFieldEx(arrRec, 'NAME','')+' '+
                            GetValueFieldEx(arrRec, 'OTCH', '');
      v := GetValueField(arrRec, 'DATER');
      if v = null then tbDetiDateR.AsString:='' else tbDetiDateR.Value := v;
      if dmBase.tbZapisRogd.Locate('ID', GetValueFieldEx(arrRec, 'ID',0),[]) then begin
        tbDetiMESTO.AsString:=dmBase.GetAdresAkt3(dmBase.tbZapisRogd,
              'GOSUD,FName;OBL,B_OBL;RAION;GOROD,B_GOROD',1);
      end;
      tbDetiNOMER.AsString:= GetValueFieldEx(arrRec, 'NOMER','');
      v:=GetValueField(arrRec, 'DATEZ');
      if v<>null then tbDetiDATEA.Value:=v;
      tbDetiMESTOREG.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','Т',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

      tbDeti.Post;
      QueryExit:=true;
    end;
//    Opis.DataSet.Filter   := '';
//    Opis.DataSet.Filtered := false;
  end;
}
end;
//-------------------------------------------------------------------------
procedure TfmZAGS_ZaklSnBrak.ReadZRogd(arrRec:TCurrentRecord);
var
  v:Variant;
  s,ss,s2,sRn:String;
  nID,n:Integer;
begin
  FRun:=true;
  try
    EditDataSet(Dokument);
    nID:=GetValueFieldEx(arrRec, 'ID',0);
    if (GetValueFieldEx(arrRec, 'SVED','1')='3') or (DokumentZV.AsString='Ж') then begin // заявление матери
      DokumentZV.AsString := 'Ж';
      ss:='ONA_';
      s2:='ON_';
    end else begin
      ss:='ON_';
      s2:='ONA_';
      DokumentZV.AsString := 'М';
    end;
    DokumentFAMILIA1.AsString := FirstUpper(GetValueFieldEx(arrRec, ss+'FAMILIA',''));
    DokumentNAME1.AsString    := FirstUpper(GetValueFieldEx(arrRec, ss+'NAME',''));
    DokumentOTCH1.AsString    := FirstUpper(GetValueFieldEx(arrRec, ss+'OTCH', ''));
    DokumentD1_IDENTIF.AsString := GetValueFieldEx(arrRec, ss+'IDENTIF', '');
    if GetValueFieldEx(arrRec, ss+'DOK_NOMER', '')<>'' then begin
      DokumentD1_DOK_TYPE.AsString := GetValueFieldEx(arrRec, ss+'DOK_TYPE', '');
      DokumentD1_DOK_SERIA.AsString := GetValueFieldEx(arrRec, ss+'DOK_SERIA', '');
      DokumentD1_DOK_NOMER.AsString := GetValueFieldEx(arrRec, ss+'DOK_NOMER', '');
      DokumentD1_DOKUMENT.AsString := GetValueFieldEx(arrRec, ss+'DOKUMENT', '');
      GetValueFieldEx2(arrRec, ss+'DOK_DATE', DokumentD1_DOK_DATE);
    end;

    DokumentGT_B_RESP.AsBoolean := GetValueFieldEx(arrRec, ss+'B_RESP',true);
    DokumentGT_GOSUD.AsString   := GetValueFieldEx(arrRec, ss+'GOSUD','');
    DokumentGT_B_OBL.AsBoolean  := GetValueFieldEx(arrRec, ss+'B_OBL', true);
    DokumentGT_OBL.AsString     := GetValueFieldEx(arrRec, ss+'OBL', '');
    DokumentGT_RAION.AsString   := GetValueFieldEx(arrRec, ss+'RAION','');
    DokumentGT_GOROD.AsString   := GetValueFieldEx(arrRec, ss+'GOROD','');
    DokumentGT_B_GOROD.AsString := GetValueFieldEx(arrRec, ss+'B_GOROD','');
    sRn:='';
    if GetValueFieldEx(arrRec, ss+'B_RN',false) then begin
      sRn:=DokumentGT_RAION.AsString;
      DokumentGT_RAION.AsString:='';
    end;
    s:=GetValueFieldEx(arrRec, ss+'GOROD_R','');
    if s<>'' then sRn:=trim(sRn+' '+s);
    s:=GetValueFieldEx(arrRec, ss+'DOM','');
    if s<>'' then sRn:=trim(sRn+' '+sokrDom+' '+s);
    s:=GetValueFieldEx(arrRec, ss+'KORP','');
    if s<>'' then sRn:=trim(sRn+' '+sokrKorp+' '+s);
    s:=GetValueFieldEx(arrRec, ss+'KV','');
    if s<>'' then sRn:=trim(sRn+' '+sokrKv+' '+s);
    DokumentGT_GOROD_R.AsString :=sRn;

    DokumentD2_IDENTIF.AsString:='';
    if (GetValueFieldEx(arrRec, 'SVED','1')<>'3') and (GetValueFieldEx(arrRec, s2+'DOK_NOMER', '')<>'') then begin // не заявление матери
      DokumentD2_DOK_TYPE.AsString := GetValueFieldEx(arrRec, s2+'DOK_TYPE', '');
      DokumentD2_DOK_SERIA.AsString := GetValueFieldEx(arrRec, s2+'DOK_SERIA', '');
      DokumentD2_DOK_NOMER.AsString := GetValueFieldEx(arrRec, s2+'DOK_NOMER', '');
      DokumentD2_DOKUMENT.AsString := GetValueFieldEx(arrRec, s2+'DOKUMENT', '');
      DokumentD2_IDENTIF.AsString := GetValueFieldEx(arrRec, s2+'IDENTIF', '');
      GetValueFieldEx2(arrRec, s2+'DOK_DATE', DokumentD2_DOK_DATE);
    end;
    if (GetValueFieldEx(arrRec, 'SVED','1')<>'3') and (GetValueFieldEx(arrRec, s2+'FAMILIA', '')<>'') then begin
      s:=FirstUpper(GetValueFieldEx(arrRec, s2+'FAMILIA', ''))+' '+FirstUpper(GetValueFieldEx(arrRec, s2+'NAME', ''))+' '+FirstUpper(GetValueFieldEx(arrRec, s2+'OTCH', ''));
      n:=StrToInt(GetValueFieldEx(arrRec, s2+'NATION', '0'));
      if (n>0) and ((n<190) or (n>199)) and dmBase.SprNac.Locate('ID', n, []) then begin
        if s2='ONA_'
          then s:=s+' '+dmBase.SprNac.FieldByName('NAME_G').AsString
          else s:=s+' '+dmBase.SprNac.FieldByName('NAME_M').AsString;
      end;
      s:=s+' '+DokumentD2_IDENTIF.AsString;
      DokumentSVED_TWO.AsString:=s;
    end;

    DokumentFAMILIA.AsString := FirstUpper(GetValueFieldEx(arrRec, 'FAMILIA',''));
    DokumentNAME.AsString    := FirstUpper(GetValueFieldEx(arrRec, 'NAME',''));
    DokumentOTCH.AsString    := FirstUpper(GetValueFieldEx(arrRec, 'OTCH', ''));

    DokumentIDENTIF.AsString := GetValueFieldEx(arrRec, 'IDENTIF', '');
    DokumentPOL.AsString     := GetValueFieldEx(arrRec, 'POL', '');
    v := GetValueField(arrRec, 'DATER');
    if v = null then DokumentDateR.AsString:='' else DokumentDateR.Value := v;

    DokumentR_NOMER.AsString  := GetValueFieldEx(arrRec, 'NOMER','');
    DokumentR_DATE.AsDateTime := GetValueFieldEx(arrRec, 'DATEZ',0);

    DokumentSVID_NOMER.AsString  := GetValueFieldEx(arrRec, 'SVID_NOMER','');
    DokumentSVID_SERIA.AsString  := GetValueFieldEx(arrRec, 'SVID_SERIA','');

    if GetValueFieldEx(arrRec, 'ID_ZAGS',0)=MyID
      then DokumentIS_MY.AsBoolean:=true
      else DokumentIS_MY.AsBoolean:=false;

    DokumentR_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','И',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

    try
      with dmBase.SvidPovtor do begin
        IndexName := 'PR_KEY';
        SetRange([_TypeObj_ZRogd,nID],[_TypeObj_ZRogd,nID]);
        try
          First;
          DokumentSVID_NOMERP.AsString  := Trim(FieldByName('SVID_NOMER').AsString);
          DokumentSVID_SERIAP.AsString  := Trim(FieldByName('SVID_SERIA').AsString);
        finally
          CancelRange;
        end;
      end;
    except
    end;

    PostDataSet(Dokument);

  finally
    FRun:=false;
    QueryExit:=true;
  end;
end;
//-------------------------------------------------------------------------
procedure TfmZAGS_ZaklSnBrak.TBItemSeekAktClick(Sender: TObject);
var
  nID,nGod,nNomer:Integer;
  arrRec:TCurrentRecord;
  nTypeObj:Integer;
begin
 SetLength(arrRec,1);
 Dokument.CheckBrowseMode;
 try
   nNomer:=Dokument.FieldByName('R_NOMER').AsInteger;
   if Dokument.FieldByName('R_DATE').AsString=''
     then nGod:=0
     else nGod:=YearOf(Dokument.FieldByName('R_DATE').AsDateTime);
 except
   nNomer:=0;
   nGod:=YearOf(Now);
 end;
 if nGod>0 then nGod:=-1*nGod;
 nTypeObj:=_TypeObj_ZRogd;
 nID:=SimpleSeekAkt( nTypeObj, 0, nGod, nNomer, arrRec);
 if nID>0 then begin
   ReadZRogd(arrRec);
 end;
end;

//--------------------------------------------------------------------------
procedure TfmZAGS_ZaklSnBrak.TBItemAktRogdClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ParamFlt:TParamFieldFlt;
  s:String;
begin
  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ROGD');
  if Opis<>nil then begin
    Dokument.CheckBrowseMode;
    if edRFamilia.Text<>'' then begin
      s:=Trim(edRFamilia.Text);
      if (s<>'') and (Pos(' ',s)=0) then begin
        Opis.AutoFilter:=true;
        ParamFlt := TParamFieldFlt.Create;
        with ParamFlt do begin
          TypeSr:=tsBegin;
          Value1:=s;
          CICharacter:=true;
          FieldName:='FAMILIA';
          OnlySet:=true;
        end;
      end;
    end;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edFamilia, v, arrRec, ParamFlt) and (v<>null) then begin
      ReadZRogd(arrRec);
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
//  Opis.DataSet.Filter   := '';
//  Opis.DataSet.Filtered := false;
end;

procedure TfmZAGS_ZaklSnBrak.TBItemAktBrakClick(Sender: TObject);
{
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  sName,ss,s : String;
  Pol:TPol;
  lCheck:Boolean;
  old:TCursor;
  ParamFlt:TParamFieldFlt;
}
begin
{
  ParamFlt := nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_BRAK');
  if Opis<>nil then begin
    sName:='';
    if (sName='') and (edName.Text<>'') then sName:=edName.Text;
    if (sName='') and (edRName.Text<>'') then sName:=edRName.Text;
    Pol:=tpNone;
    if sName<>'' then begin
      dmBase.CheckNameBel(Pol,sName,'');
    end;
    if Pol=tpNone then begin
      if Problem('   Ищем мужчину ?   ') then begin
        Pol := tpM;
      end else begin
        Pol := tpG;
      end;
    end;
    if Pol=tpM
      then ss:='ON_'
      else ss:='ONA_';
    if edFamilia.Text<>'' then begin
      s:=Trim(edFamilia.Text);
      if (s<>'') and (Pos(' ',s)=0) then begin
        Opis.AutoFilter:=true;
        ParamFlt := TParamFieldFlt.Create;
        with ParamFlt do begin
          TypeSr:=tsBegin;
          Value1:=s;
          CICharacter:=true;
          FieldName:=ss+'FAMILIAP';
          OnlySet:=true;
        end;
      end;
    end;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edFamilia, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      lCheck:=dbDisableControls(Dokument);
      Screen.Cursor := crHourGlass;
      FRun:=true;
      try
        EditDataSet(Dokument);
        if Pol=tpM then DokumentPOL.AsString:='М'
                   else DokumentPOL.AsString:='Ж';
        DokumentB_ZAGS.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'ID_ZAGS',0),'','Т',GetValueFieldEx(arrRec, 'NAME_ZAGS',''));

        DokumentB_NOMER.AsString  := GetValueFieldEx(arrRec, 'NOMER','');
        DokumentB_DATE.AsDateTime := GetValueFieldEx(arrRec, 'DATEZ',0);
        if Pol=tpM
          then DokumentSUPRUG.AsString := GetValueField(arrRec, 'ONA_FAMILIAP')+' '+GetValueField(arrRec, 'ONA_NAME')+' '+GetValueField(arrRec, 'ONA_OTCH')
          else DokumentSUPRUG.AsString := GetValueField(arrRec, 'ON_FAMILIAP')+' '+GetValueField(arrRec, 'ON_NAME')+' '+GetValueField(arrRec, 'ON_OTCH');

        //  в браках: место жительства ON_M_...   в рождениях: место рождения ON_...
        DokumentGT_B_RESP.Value:=GetValueFieldEx(arrRec, ss+'M_B_RESP',true);
        DokumentGT_GOSUD.AsString:=GetValueFieldEx(arrRec, ss+'M_GOSUD','');
        DokumentGT_B_OBL.Value:=GetValueFieldEx(arrRec, ss+'M_B_OBL',true);
        DokumentGT_OBL.Value:=GetValueFieldEx(arrRec, ss+'M_OBL','');
        DokumentGT_RAION.AsString:=GetValueFieldEx(arrRec, ss+'M_RAION','');
        DokumentGT_B_GOROD.AsString:=GetValueFieldEx(arrRec, ss+'M_B_GOROD','');
        DokumentGT_GOROD.AsString:=GetValueFieldEx(arrRec, ss+'M_GOROD','');
        DokumentGT_GOROD_R.AsString:=GetValueFieldEx(arrRec, ss+'M_GOROD_R','');

        DokumentWORK.AsString:=GetValueFieldEx(arrRec, ss+'WORK','');
//      if GetValueFieldEx(arrRec, ss+'VUS',false)=true then begin
//        if pol=tpM then DokumentVUS.AsString:='ВОЕННООБЯЗАННЫЙ' else
//      end else begin
//      end;
// ???       DokumentVUS.AsString:=GetValueFieldEx(arrRec, ss+'VUS','');

        PostDataSet(Dokument);
        QueryExit:=true;
      finally
        FRun:=false;
        Screen.Cursor := old;
        dbEnableControls(Dokument,lCheck);
      end;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
  }
end;

procedure TfmZAGS_ZaklSnBrak.PostDokument;
begin
  inherited;
end;

procedure TfmZAGS_ZaklSnBrak.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF USE_FR3}
//    CreatefrxDBdataSet(self,tbDeti,'Deti','Дети');
  {$ENDIF}
  TBItemAdresat.Visible:=false;
end;

procedure TfmZAGS_ZaklSnBrak.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;

procedure TfmZAGS_ZaklSnBrak.edNameUpdateData(Sender: TObject;  var Handled: Boolean);
var
  s:String;
begin
  FIOUpdateData(Sender,Handled);
  if not FRun and not IsReadDokument then begin
    s:=PolFrom(edName.Text,edOtch.Text);
    if s<>'' then begin
      EditDataSet(Dokument);
      DokumentZV.AsString:=s;
    end;
  end;
end;

procedure TfmZAGS_ZaklSnBrak.edRNameUpdateData(Sender: TObject; var Handled: Boolean);
var
  s:String;
begin
  FIOUpdateData(Sender,Handled);
  if not FRun and not IsReadDokument then begin
    s:=PolFrom(edRName.Text,edROtch.Text);
    if s<>'' then begin
      EditDataSet(Dokument);
      DokumentPOL.AsString:=s;
    end;
  end;
end;

//----------------------------------------------------------------------
function TfmZAGS_ZaklSnBrak.GetTypeBrak:Integer;
begin
end;
//----------------------------------------------------------------------
{
1=состоит в браке (з/а о браке)
2=в браке не состоит
3=разведен (решение суда)
4=разведен (з/а о раст. брака)
5=вдова (вдовец) (з/а о браке)
}
procedure TfmZAGS_ZaklSnBrak.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

function TfmZAGS_ZaklSnBrak.AddParEnterAdresat(slPar: TStringList;  strFieldName: String): Boolean;
var
  n:Integer;
begin
  Result:=true;
  slPar.Add('CAPTION=Значение');
  slPar.Add('ONLY_SHABLON=1');
  n:=FindChoiceRekv(strFieldName);
  if n=-1 then begin
    Result:=false;
  end else begin
    slPar.Add('SHABLON='+IntToStr(FArrChoiceRekv[n].nType));
  end;
//  s:=slPar.Values['CAPTION_SHABLON'];
end;

procedure TfmZAGS_ZaklSnBrak.edD2_DOK_TYPEEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  EditDataSet(Dokument);
  DokumentD2_DOK_TYPE.AsString:='';
  DokumentD2_DOK_SERIA.AsString:='';
  DokumentD2_DOK_NOMER.AsString:='';
  DokumentD2_DOK_DATE.AsString:='';
  DokumentD2_DOKUMENT.AsString:='';
end;

procedure TfmZAGS_ZaklSnBrak.edSvid_NomerEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  EditDataSet(Dokument);
  DokumentSVID_SERIA.AsString:='';
  DokumentSVID_NOMER.AsString:='';
end;

procedure TfmZAGS_ZaklSnBrak.N_F_cbIsMyClick(Sender: TObject);
begin
  if N_F_cbIsMy.Checked then begin
    edRZAGS.Text:=MyName;
    edRZAGS.Enabled:=false;
  end else begin
    edRZAGS.Enabled:=true;
  end;
end;

end.
