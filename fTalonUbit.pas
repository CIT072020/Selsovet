unit fTalonUbit;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uProjectAll,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,
  AdsData, ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc, uCheckKod, uProject, ifpii_dbfunc, uTypes,
  OpisEdit, MetaTask, Grids, DBGridEh, Buttons, vchDBCtrls, FR_DSet,
  FR_DBSet, ToolCtrlsEh
  {$IFDEF VER150} ,Variants, ImgList, kbmMemCSVStreamFormat, ZipForge {$ENDIF}  ;

type
  TfmTalonUbit = class(TfmSimpleD)
    pn: TPanel;
    edDate_SOST: TDBDateTimeEditEh;
    pc: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label20: TLabel;
    Label6: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    edPol: TDBComboBoxEh;
    edNATION: TDBLookupComboboxEh;
    edDateR: TDBDateTimeEditEh;
    gbRogd: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edGOSUD_R: TDBLookupComboboxEh;
    edGOROD_R: TDBEditEh;
    gbPribil: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edGOSUD_O: TDBLookupComboboxEh;
    edGOROD_O: TDBEditEh;
    Label17: TLabel;
    Label41: TLabel;
    edRukov: TDBEditEh;
    Label35: TLabel;
    edOrgan: TDBEditEh;
    edWork: TDBEditEh;
    dsStran: TDataSource;
    dsNation: TDataSource;
    Label5: TLabel;
    edDate_O: TDBDateTimeEditEh;
    LabelCel: TLabel;
    edCel: TDBLookupComboboxEh;
    Label25: TLabel;
    edSrok: TDBEditEh;
    Label19: TLabel;
    edIst: TDBLookupComboboxEh;
    edDateZ: TDBDateTimeEditEh;
    GroupBox1: TGroupBox;
    GridDeti: TDBGridEh;
    dsDeti: TDataSource;
    Label38: TLabel;
    mtDeti: TkbmMemTable;
    mtDetiNAME: TStringField;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentDateR: TDateField;
    DokumentSOATO_R: TStringField;
    DokumentGOSUD_R: TIntegerField;
    DokumentOBL_R: TStringField;
    DokumentRAION_R: TStringField;
    DokumentGOROD_R: TStringField;
    DokumentSELO_R: TStringField;
    DokumentPOL: TStringField;
    DokumentNATION: TIntegerField;
    DokumentOBRAZ: TIntegerField;
    DokumentSEM: TIntegerField;
    DokumentSOATO: TStringField;
    DokumentADRES_ID: TIntegerField;
    DokumentADRES_NAME: TMemoField;
    DokumentORGAN: TMemoField;
    DokumentSOATO_O: TStringField;
    DokumentGOSUD_O: TIntegerField;
    DokumentOBL_O: TStringField;
    DokumentRAION_O: TStringField;
    DokumentGOROD_O: TStringField;
    DokumentDATE_O: TDateField;
    DokumentGOD_PROG: TSmallintField;
    DokumentCEL: TIntegerField;
    DokumentSROK: TStringField;
    DokumentISTOC: TIntegerField;
    DokumentDETI: TSmallintField;
    DokumentLICH_NOMER: TStringField;
    DokumentPASP_SERIA: TStringField;
    DokumentPASP_NOMER: TStringField;
    DokumentPASP_DATE: TDateField;
    DokumentDATE_SOST: TDateField;
    DokumentRUKOV: TStringField;
    DokumentMEN_ID: TIntegerField;
    DokumentLICH_ID: TIntegerField;
    dsCel: TDataSource;
    dsIst: TDataSource;
    mtDetiCHILD_ID: TIntegerField;
    mtDetiPOL: TStringField;
    mtDetiDATER: TDateField;
    mtDetiOTCH: TStringField;
    cbProvDvig: TDBCheckBoxEh;
    DokumentPROV: TBooleanField;
    DokumentWORK_NAME: TStringField;
    DokumentDOLG_NAME: TStringField;
    Label18: TLabel;
    edObraz: TDBComboBoxEh;
    Label16: TLabel;
    edSem: TDBComboBoxEh;
    Label31: TLabel;
    edDolgName: TDBEditEh;
    N_F_edSuprug: TDBCheckBoxEh;
    DokumentSUPRUG: TBooleanField;
    DokumentPASP_VIDAN: TStringField;
    gbVibil: TGroupBox;
    Label7: TLabel;
    Label21: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    edGOSUD_V: TDBLookupComboboxEh;
    edGOROD_V: TDBEditEh;
    Label26: TLabel;
    edDeti: TDBNumberEditEh;
    DokumentSOATO_V: TStringField;
    DokumentOBL_V: TStringField;
    DokumentRAION_V: TStringField;
    DokumentGOROD_V: TStringField;
    DokumentGOSUD_V: TIntegerField;
    DokumentCONTANT: TIntegerField;
    edContant: TDBComboBoxEh;
    DokumentNEW_ADRES_ID: TIntegerField;
    DokumentNEW_UL: TStringField;
    DokumentNEW_DOM: TStringField;
    DokumentNEW_KORP: TStringField;
    DokumentNEW_KV: TStringField;
    DokumentNEW_FIO: TStringField;
    gbPasp: TGroupBox;
    Label8: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    ENG_edLichNomer: TDBEditEh;
    edPasp_Seria: TDBEditEh;
    edPasp_Nomer: TDBEditEh;
    edPasp_Date: TDBDateTimeEditEh;
    edPasp_Organ: TDBEditEh;
    Label34: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    edNewUL: TDBEditEh;
    edNewDom: TDBEditEh;
    edNewKorp: TDBEditEh;
    edNewKv: TDBEditEh;
    edNewFIO: TDBEditEh;
    DokumentCITIZEN: TIntegerField;
    Label42: TLabel;
    edCitizen: TDBLookupComboboxEh;
    dsGrag: TDataSource;
    DokumentDRUG_PRICH: TMemoField;
    Label43: TLabel;
    edDrugPrich: TDBEditEh;
    mtDetiFAMILIA: TStringField;
    BtRB: TImage;
    btRF: TImage;
    btU: TImage;
    DokumentWORK_DOLG_OLD: TMemoField;
    Label44: TLabel;
    edWorkOLD: TDBEditEh;
    Panel1: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    frDBDeti: TfrDBDataSet;
    bgBilProp: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    edGOSUD_B: TDBLookupComboboxEh;
    edOBL_B: TDBEditEh;
    edGOROD_B: TDBEditEh;
    edRAION_B: TDBEditEh;
    btAdres: TBitBtn;
    TextAdres: TvchDBText;
    Label15: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    edUL_B: TDBEditEh;
    edDOM_B: TDBEditEh;
    edKORP_B: TDBEditEh;
    edKV_B: TDBEditEh;
    DokumentGOSUD_B: TIntegerField;
    DokumentOBL_B: TStringField;
    DokumentRAION_B: TStringField;
    DokumentGOROD_B: TStringField;
    DokumentUL_B: TStringField;
    DokumentDOM_B: TStringField;
    DokumentKORP_B: TStringField;
    DokumentKV_B: TStringField;
    TextLich: TvchDBText;
    DokumentPASP_UDOST: TSmallintField;
    edUdost: TDBComboBoxEh;
    DokumentGOROD_R_B: TSmallintField;
    DokumentGOROD_O_B: TSmallintField;
    DokumentGOROD_V_B: TSmallintField;
    DokumentGOROD_B_B: TSmallintField;
    DokumentB_OBL_R: TBooleanField;
    DokumentB_OBL_O: TBooleanField;
    DokumentB_OBL_V: TBooleanField;
    DBCheckBoxEh3: TDBCheckBoxEh;
    edB_GOROD_R: TDBLookupComboboxEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    edGOROD_O_B: TDBLookupComboboxEh;
    edGOROD_B_B: TDBLookupComboboxEh;
    edGOROD_V_B: TDBLookupComboboxEh;
    DBCheckBoxEh2: TDBCheckBoxEh;
    DokumentDATE_SROK: TDateField;
    edDateSrok: TDBDateTimeEditEh;
    Label52: TLabel;
    DokumentDATE_SMERT: TDateField;
    DokumentAKT_SMERT: TMemoField;
    N_F_cbUmer: TDBCheckBoxEh;
    DokumentSMERT: TBooleanField;
    edAktSmert: TDBEditEh;
    edOBL_R: TDBEditEh;
    edRAION_R: TDBEditEh;
    edOBL_O: TDBEditEh;
    edRAION_O: TDBEditEh;
    edRAION_V: TDBEditEh;
    edOBL_V: TDBEditEh;
    DokumentATE_ID: TIntegerField;
    DokumentEVA_ID: TIntegerField;
    procedure edPolChange(Sender: TObject);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure TextAdresGetText(Sender: TObject; var Text: String);
    procedure btAdresClick(Sender: TObject);
    procedure GridDetiColumns0EditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edFamiliaEditButtons0Click(Sender: TObject;             var Handled: Boolean);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure dsDetiDataChange(Sender: TObject; Field: TField);
    procedure TextLichGetText(Sender: TObject; var Text: String);
    procedure edRAION_RNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure edOBL_RNotInList(Sender: TObject; NewText: String;        var RecheckInList: Boolean);
    procedure edPasp_OrganEditButtons0Click(Sender: TObject;            var Handled: Boolean);
    procedure ENG_edLichNomerUpdateData(Sender: TObject; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edCelChange(Sender: TObject);
    procedure N_F_cbUmerClick(Sender: TObject);
  private
    procedure WriteDvigMen( nIDMen : Integer);
  public
    { Public declarations }
    FEnabledEva:Boolean;
    FPrintSS:Boolean;
    FCurLic : Integer;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function ReadTalonPrib(nID : Integer) : Boolean;
    function ReadAktSmert(nID : Integer) : Boolean;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure UpdateActions; override;
    function BeforeEdit: Boolean; override;
    constructor Create(Owner : TComponent); override;
    procedure SetRB_OnClick(Sender: TObject;  var Handled: Boolean);
    procedure SetRF_OnClick(Sender: TObject;  var Handled: Boolean);
    procedure SetU_OnClick(Sender: TObject;  var Handled: Boolean);
    procedure SetSmert(lSet:Boolean; lSeekCel:Boolean);
    procedure ReadAdres;
    procedure WriteDokumentFromArr(arrRec : TCurrentRecord; lDeti:Boolean);
  end;

  procedure TalonUbitFromTalonPrib(nID : Integer);
  procedure TalonUbitFromPassport(fS:TfmSimpleD; lDeti:Boolean);
  procedure TalonUbitFromAktSmert(nID : Integer);

var
  fmTalonUbit: TfmTalonUbit;

implementation

uses dBase, fChoiceAdres, fMain, fChoiceNasel, fShablon;

{$R *.DFM}

procedure TalonUbitFromPassport(fS:TfmSimpleD; lDeti:Boolean);
var
  n,nVozr,nID:Integer;
  sBookMark:String;
  arr:TCurrentRecord;
  ds:TDataSet;
begin
  nID:=fs.Dokument.FieldByName('ID_MEN').AsInteger;
  if nID>0 then begin
    ds:=dmBase.GetMen(fmMain.DateFiks,IntToStr(nID));
    GetCurrentRecord( ds, '', arr);

    fmTalonUbit := TfmTalonUbit.Create(nil);
    fmTalonUbit.TBSubmenuRun.Visible:=false;
    fmTalonUbit.edFamilia.EditButtons[0].Visible:=false;
    fmTalonUbit.pc.ActivePageIndex:=0;
//  fmTalonPrib.edTypeReg.Enabled:=false;

//  fmTalonPrib.FFromMen:=true;
// см. BeforeEdit  fmTalonPrib.FEnableWrite:=false;
    try
      fmTalonUbit.IsReadDokument:=true;
      fmTalonUbit.NewDok(true);

      EditDataSet(fmTalonUbit.Dokument);
      fmTalonUbit.WriteDokumentFromArr(arr,true);
      fmTalonUbit.cbProvDvig.Checked:=false;
      fmTalonUbit.Dokument.Post;
      fmTalonUbit.IsReadDokument:=false;
      fmTalonUbit.QueryExit:=false;
      fmTalonUbit.EditModal;

    finally
      fmTalonUbit.Free;
      fmTalonUbit:=nil;
    end;
  end else begin
    PutError('В заявлении на паспорт человек должен быть выбран из населения!');
  end;
end;

procedure TalonUbitFromTalonPrib(nID : Integer);
begin
  fmTalonUbit := TfmTalonUbit.Create(nil);
  try
    fmTalonUbit.NewDok(true);
    fmTalonUbit.ReadTalonPrib(nID);
    fmTalonUbit.EditModal;
  finally
    fmTalonUbit.Free;
    fmTalonUbit := nil;
  end;
end;

procedure TalonUbitFromAktSmert(nID : Integer);
begin
  fmTalonUbit := TfmTalonUbit.Create(nil);
  try
    fmTalonUbit.NewDok(true);
    fmTalonUbit.ReadAktSmert(nID);
    fmTalonUbit.QueryExit:=true;
    fmTalonUbit.EditModal;
  finally
    fmTalonUbit.Free;
    fmTalonUbit := nil;
  end;
end;

constructor TfmTalonUbit.Create(Owner: TComponent);
var
  bt  : TEditButtonEh;
begin
  inherited;
//  FCheckKeyboard:=false; было до 29.03.2019
  FCheckLookupField:=false;
  FMainTable := dmBase.tbTalonUbit;
  dmBase.SetDateFormat(mtDeti);
  mtDeti.Open;
  pc.ActivePageIndex:=0;
  FPageControl := pc;
  FPrintSS:=(GlobalTask.ParamAsString('TALON_PR_SS')='1');  // печать сельского совета в талонах
  FUpdatingObj:=GetUpdatingObj(TypeObj);
//  GridDeti.Columns[0].EditButtons[0].Glyph.Assign( edFamilia.EditButtons[0].Glyph);
  FEnabledEva:=IsActiveGISRU;

  if GlobalTask.ParamAsBoolean('AUTO_UBIT') then begin
    cbProvDvig.Visible := true;
    cbProvDvig.Checked := true;
  end else begin
    cbProvDvig.Visible := false;
    cbProvDvig.Checked := false;
  end;
  edFamilia.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateData;
  edOtch.OnUpdateData:=FIOUpdateData;

  edGOROD_R.OnUpdateData:=CityUpdate;
  edGOROD_B.OnUpdateData:=CityUpdate;
  edGOROD_V.OnUpdateData:=CityUpdate;
  edGOROD_O.OnUpdateData:=CityUpdate;

//  fmMain.SetCurrentDokument(Dokument);

  fmMain.ImageList.GetBitmap(IL_ADD_MEN,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_MEN,btDelChild.Glyph);

  bt := edGOSUD_R.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetRB_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtRB.Picture.Bitmap;

  bt := edGOSUD_O.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetRB_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtRB.Picture.Bitmap;

  bt := edGOSUD_V.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetRB_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtRB.Picture.Bitmap;

  bt := edGOSUD_B.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetRB_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtRB.Picture.Bitmap;

  bt := edGOSUD_R.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetRF_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtRF.Picture.Bitmap;
  bt := edGOSUD_O.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetRF_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtRF.Picture.Bitmap;
  bt := edGOSUD_V.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetRF_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtRF.Picture.Bitmap;

  bt := edGOSUD_R.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetU_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtU.Picture.Bitmap;
  bt := edGOSUD_O.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetU_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtU.Picture.Bitmap;
  bt := edGOSUD_V.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetU_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtU.Picture.Bitmap;

  edUdost.DropDownBox.Rows:=TYPEDOK_ROWS;  // utypes.pas
  edUdost.DropDownBox.Width:=TYPEDOK_Width;  // utypes.pas

end;
{
function TfmTalonUbit.GetNameReport: String;
begin
  Result := '&Листок убытия.frf';
end;
}
function TfmTalonUbit.GetVid: String;
begin
  Result := 'TalonUbit';
end;

function TfmTalonUbit.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentPOL.AsString := 'М';
  DokumentGOROD_R_B.AsInteger:=1;
  DokumentGOROD_O_B.AsInteger:=1;
  DokumentGOROD_V_B.AsInteger:=1;
  DokumentGOROD_B_B.AsInteger:=1;
  DokumentB_OBL_R.AsBoolean:=true;
  DokumentB_OBL_O.AsBoolean:=true;
  DokumentB_OBL_V.AsBoolean:=true;
  DokumentSUPRUG.AsBoolean := false;
  DokumentPROV.AsBoolean := false;
  DokumentCONTANT.AsInteger := 1;
  mtDeti.EmptyTable;
  inherited NewDok(lAppend);
  DokumentPRINT_POVTOR.AsBoolean:=FPrintSS;
  QueryExit:=false;
  Result := true;
end;

function TfmTalonUbit.ReadTalonPrib(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
begin
  NewDok(false);
  Result := true;
  if not dmBase.tbTalonPrib.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbTalonPrib.FieldCount-1 do begin
    strField := dmBase.tbTalonPrib.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      try
        fld.Value := dmBase.tbTalonPrib.Fields[i].Value;
      except
      end
    end;
  end;
  DokumentPROV.AsBoolean:=false;
  if DokumentPASP_UDOST.IsNull then DokumentPASP_UDOST.AsInteger:=1;
  DokumentID.AsInteger:=-1;

  dmBase.AdresFromID(dmBase.GetDateCurrentSost, DokumentADRES_ID.AsString);

  DokumentGOSUD_V.AsInteger:=GlobalTask.ParamAsInteger('GOSUD');
  DokumentOBL_V.AsString:=GlobalTask.ParamAsString('OBL');
  DokumentRAION_V.AsString:=GlobalTask.ParamAsString('RAION');
  DokumentGOROD_V.AsString:=dmBase.Adres_PunktN;
  DokumentGOROD_V_B.AsInteger:=dmBase.Adres_PunktTK;

  DokumentGOSUD_O.AsString:='';
  DokumentOBL_O.AsString:='';
  DokumentRAION_O.AsString:='';
  DokumentGOROD_O.AsString:='';
  DokumentGOROD_O_B.AsInteger:=1;

  DokumentADRES_ID.AsString:='';
  DokumentADRES_NAME.AsString:='';
  DokumentPROV.AsBoolean:=true;
  DokumentDATE_O.AsString:='';
  DokumentCONTANT.AsString:='1';
  DokumentSROK.AsString:='';
  DokumentWORK_NAME.AsString:=DokumentWORK_DOLG_OLD.AsString;
  DokumentDOLG_NAME.AsString:='';
  DokumentWORK_DOLG_OLD.AsString:='';
  btAdres.Visible:=false;
  cbProvDvig.Checked := false;
  cbProvDvig.Enabled := false;

  with dmBase.tbTalonPrib do begin
    DokumentGOSUD_B.AsInteger:=FieldByName('GOSUD_O').AsInteger;
    DokumentOBL_B.AsString:=FieldByName('OBL_O').AsString;
    DokumentRAION_B.AsString:=FieldByName('RAION_O').AsString;
    DokumentGOROD_B.AsString:=FieldByName('GOROD_O').AsString;
    DokumentGOROD_B_B.AsInteger:=FieldByName('GOROD_O_B').AsInteger;
  end;

  DokumentMEN_ID.AsString:='';
  DokumentLICH_ID.AsString:='';

  Dokument.Post;
  if nID > 0 then begin
    dmBase.tbTalonPribDeti.IndexName := 'PR_KEY';
    dmBase.tbTalonPribDeti.SetRange([nID],[nID]);
    with dmBase.tbTalonPribDeti do begin
      while not Eof do begin
        mtDeti.Append;
        mtDetiFAMILIA.AsString  := FieldByName('FAMILIA').AsString;
        mtDetiNAME.AsString     := FieldByName('NAME').AsString;
        mtDetiOTCH.AsString     := FieldByName('OTCH').AsString;
        mtDetiPOL.AsString      := FieldByName('POL').AsString;
        mtDetiDATER.AsString    := FieldByName('DATER').AsString;
        mtDetiCHILD_ID.AsString := FieldByName('CHILD_ID').AsString;
        mtDeti.Post;
        Next;
      end;
    end;
    dmBase.tbTalonPribDeti.CancelRange;
  end;
end;

function TfmTalonUbit.ReadAktSmert(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField,strName,sAkt : String;
  adr : TAdres;
  p : TPassport;
  arrRec : TCurrentRecord;
  ds:TDataSet;
begin
  NewDok(false);
  Result := true;
  if not dmBase.tbZapisSmert.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  //------- читаем карточку -----------
  Dokument.Edit;

  with dmBase.tbZapisSmert do begin

    if FieldByName('POL').AsString='М' then sAkt:='Умер' else sAkt:='Умерла';
    sAkt:=sAkt+' '+FormatDateTime('dd.mm.yyyy',FieldByName('DATES').AsDateTime)+
    ', з/а о смерти №'+FieldByName('NOMER').AsString+' от '+FormatDateTime('dd.mm.yyyy',FieldByName('DATEZ').AsDateTime);
    sAkt:=sAkt+' '+GlobalTask.ParamAsString('KNAME');

    DokumentSMERT.AsBoolean:=true;
    if GlobalTask.ParamAsInteger('PRICH_SMERT')>0 then begin
      DokumentCEL.AsInteger:=GlobalTask.ParamAsInteger('PRICH_SMERT');
    end;
    if GlobalTask.ParamAsInteger('TALON_SMERT')=1 then begin
      DokumentDRUG_PRICH.AsString:=sAkt;
    end else begin
      DokumentAKT_SMERT.AsString:=sAkt;
    end;

    //------ место рождения -----
    DokumentGOSUD_R.AsString:=FieldByName('RG_GOSUD').AsString;
    DokumentB_OBL_R.AsBoolean:=FieldByName('RG_B_OBL').AsBoolean;
    DokumentOBL_R.AsString:=FieldByName('RG_OBL').AsString;
    DokumentRAION_R.AsString:=FieldByName('RG_RAION').AsString;
    DokumentGOROD_R.AsString:=FieldByName('RG_GOROD').AsString;
    DokumentGOROD_R_B.AsInteger:=FieldByName('RG_B_GOROD').AsInteger;

    //------ куда убыл -------
   // DokumentGOSUD_V.AsString:=FieldByName('GT_GOSUD').AsString;
   // DokumentB_OBL_V.AsBoolean:=FieldByName('GT_B_OBL').AsBoolean;
   // DokumentOBL_V.AsString:=FieldByName('GT_OBL').AsString;
   // DokumentRAION_V.AsString:=FieldByName('GT_RAION').AsString;
   // DokumentGOROD_V.AsString:=FieldByName('GT_GOROD').AsString;
   // DokumentGOROD_V_B.AsString:=FieldByName('GT_B_GOROD').AsString;

    DokumentMEN_ID.AsString:=FieldByName('MEN_ID').AsString;
    if DokumentMEN_ID.AsString<>'' then begin
      ds:=dmBase.GetMen( dmBase.GetDateCurrentSost,DokumentMEN_ID.AsString);
      if (ds=nil) and (FieldByName('LICH_NOMER').AsString<>'') then begin
        ds:=dmBase.GetMenIN( dmBase.GetDateCurrentSost, FieldByName('LICH_NOMER').AsString);
      end;
      if ds<>nil then begin
        p:=dmBase.PasportMen(dmBase.GetDateCurrentSost,DokumentMEN_ID.AsString);
        if p.Nomer <> '' then begin
          DokumentPASP_UDOST.AsInteger := p.UdostKod;
          DokumentPASP_SERIA.AsString := p.Seria;
          DokumentPASP_NOMER.AsString := p.Nomer;
          DokumentPASP_VIDAN.AsString := p.Organ;
          DokumentLICH_NOMER.AsString := p.LichNomer;
          DokumentPASP_DATE.AsDateTime := p.Date;
        end;
        DokumentLICH_ID.AsString:=ds.FieldByName('LIC_ID').AsString;
        adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, DokumentMEN_ID.AsString, strName);
        DokumentADRES_ID.AsInteger:=adr.AdresID;
        //---- место жительства -----
        ReadAdres;
        // откуда прибыл
        with dmBase.tbMensAdd do begin
          if Locate('ID', DokumentMEN_ID.AsInteger, []) then begin
            WriteField( DokumentGOSUD_O   , FieldByName('OP_GOSUD')  ); //   , lErr);
            WriteField( DokumentB_OBL_O   , FieldByName('OP_B_OBL')  ); //   , lErr);
            WriteField( DokumentOBL_O     , FieldByName('OP_OBL')    ); //     , lErr);
            WriteField( DokumentRAION_O   , FieldByName('OP_RAION')  ); //   , lErr);
            WriteField( DokumentGOROD_O_B , FieldByName('OP_B_GOROD')); // , lErr);
            WriteField( DokumentGOROD_O   , FieldByName('OP_GOROD')  ); //   , lErr);
            WriteDateField( DokumentDATE_O, FieldByName('OP_DATE')  ); //   , lErr);
          end;
        end;
        //------------------------------------------------------
        btAdres.Visible:=false;
      end;
    end;

    WriteDateField(DokumentDateR,FieldByName('DATER'));
    WriteDateField(DokumentDATEZ,FieldByName('DATEZ'));

    DokumentCITIZEN.AsString:=FieldByName('GRAG').AsString;
    DokumentPOL.AsString:=FieldByName('POL').AsString;
    DokumentFAMILIA.AsString:=FieldByName('FAMILIA').AsString;
    DokumentNAME.AsString:=FieldByName('NAME').AsString;
    DokumentOTCH.AsString:=FieldByName('OTCH').AsString;
    DokumentNATION.AsString:=FieldByName('NATION').AsString;

    DokumentOBRAZ.AsString:=FieldByName('OBRAZ').AsString;
    DokumentSEM.AsString:=FieldByName('SEM').AsString;

    DokumentWORK_NAME.AsString:=FieldByName('WORK_NAME').AsString;


  end;    // with

  DokumentPROV.AsBoolean:=false;
  if DokumentPASP_UDOST.IsNull then DokumentPASP_UDOST.AsInteger:=1;
  DokumentID.AsInteger:=-1;

  DokumentADRES_NAME.AsString:='';
  DokumentPROV.AsBoolean:=true;
  DokumentDATE_O.AsString:='';
  DokumentCONTANT.AsString:='1';
  DokumentSROK.AsString:='';
  DokumentDOLG_NAME.AsString:='';
//  cbProvDvig.Checked := false;
//  cbProvDvig.Enabled := false;

  Dokument.Post;
end;

function TfmTalonUbit.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
begin
  FRead:=true;
  NewDok(false);
  Result := true;
  if not dmBase.tbTalonUbit.Locate('ID', nID, []) then begin
    FRead:=false;
    Result := false;
    exit;
  end;
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbTalonUbit.FieldCount-1 do begin
    strField := dmBase.tbTalonUbit.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      fld.Value := dmBase.tbTalonUbit.Fields[i].Value;
    end;
  end;
  if DokumentPROV.IsNull then DokumentPROV.AsBoolean:=true;
  if DokumentPASP_UDOST.IsNull then DokumentPASP_UDOST.AsInteger:=1;
  Dokument.Post;
  if DokumentID.AsInteger > 0 then begin
    dmBase.tbTalonUbitDeti.IndexName := 'PR_KEY';
    dmBase.tbTalonUbitDeti.SetRange([DokumentID.AsInteger],[DokumentID.AsInteger]);
    with dmBase.tbTalonUbitDeti do begin
      while not Eof do begin
        mtDeti.Append;
        mtDetiFAMILIA.AsString  := FieldByName('FAMILIA').AsString;
        mtDetiNAME.AsString     := FieldByName('NAME').AsString;
        mtDetiOTCH.AsString     := FieldByName('OTCH').AsString;
        mtDetiPOL.AsString      := FieldByName('POL').AsString;
        mtDetiDATER.AsString    := FieldByName('DATER').AsString;
        mtDetiCHILD_ID.AsString := FieldByName('CHILD_ID').AsString;
        mtDeti.Post;
        Next;
      end;
    end;
    dmBase.tbTalonUbitDeti.CancelRange;
  end;
  FRead:=false;
end;

function TfmTalonUbit.WriteDok: Boolean;
var
  i, nID, nIDFirst : Integer;
  fld : TField;
  strField, strErr, strIDLic : String;
  vKeyValues : Variant;
  dLastSost : TDateTime;
  nIdChild, nIdMen : Integer;
  sSoob,strSoob, strLich,s : String;
  lCheckEn, lCloseLic : Boolean;
  recID:TID;
begin
  AdditiveBeforeWriteDok;
  lCheckEn:=false;
  strSoob := '';
  PostDataSet(Dokument);
  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
//  if DokumentDATEZ.IsNull then begin
//    strErr := ' Заполните дату проверки талона. ';
//  end else if DokumentDATE_SOST.AsString='' then begin
//    strErr := ' Заполните дату составления талона. ';
  if DokumentADRES_ID.AsString='' then begin
    if DokumentMEN_ID.AsString<>'' then begin
      strErr := ' Заполните адрес прописки. ';
    end;
  end else if DokumentCEL.AsString='' then begin
    strErr := ' Заполните цель выезда. ';
  end else if DokumentDATE_SOST.AsString='' then begin
    strErr := ' Заполните дату составления талона. ';
  end else if DokumentDATEZ.AsString='' then begin
    strErr := ' Заполните дату выписки. ';
  end else if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') or
              (DokumentOTCH.AsString='')then begin
    strErr := ' Заполните Фамилия, Имя, Отчество. ';
  end else if (DokumentDETI.AsString <> '') or
              (mtDeti.RecordCount>0) then begin
    if (mtDeti.RecordCount>0) and (DokumentDETI.AsInteger<>mtDeti.RecordCount) then begin
      strErr := ' Количество детей не совпадает с реально введеным. ';
    end;
  end;
  if strErr<>'' then begin
    PutError(strErr);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbTalonUbit.Append;
    dmBase.tbTalonUbit.Post;
    nID := dmBase.tbTalonUbit.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.tbTalonUbit.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    dmBase.tbTalonUbit.Edit;
    for i:=1 to dmBase.tbTalonUbit.FieldCount-1 do begin
      strField := dmBase.tbTalonUbit.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.tbTalonUbit.Fields[i].Value := fld.Value;
      end;
    end;
    dmBase.tbTalonUbit.Post;

    AdditiveWriteDok;

    mtDeti.First;
    dLastSost := dmBase.LastDateSost;
    while dmBase.tbTalonUbitDeti.Locate('ID',DokumentID.AsInteger,[])
      do dmBase.tbTalonUbitDeti.Delete;
    with dmBase.tbTalonUbitDeti do begin
      while not mtDeti.Eof do begin
        nIdChild := -1;
        if cbProvDvig.Checked and cbProvDvig.Enabled then begin
          if (DokumentLICH_ID.AsString<>'') and (DokumentLICH_ID.AsString<>'0') and
             ((dLastSost = dmBase.GetDateCurrentSost) or
              (DokumentDATEZ.AsDateTime >= dLastSost)) then begin

            // если у ребенка нет ид. то не записываем его
            if mtDetiCHILD_ID.AsString<>'' then begin
              vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, mtDetiCHILD_ID.AsInteger);
              if dmBase.tbMens.Locate('DATE_FIKS;ID',vKeyValues,[]) then begin
                nIdChild := mtDetiCHILD_ID.AsInteger;
              end;
            end;
            if nIdChild > 0 then begin
              WriteDvigMen(nIdChild); // запишем в базу движний человека
              dmBase.tbMens.Edit;
              dmBase.tbMens.FieldByName('KATEG').AsInteger := LIC_REG;
              dmBase.tbMens.FieldByName('PRESENT').AsBoolean   := false;
              dmBase.tbMens.FieldByName('DATEV').AsDateTime    := DokumentDATEZ.AsDateTime;
              // если на постоянно то пометим на удаление
              if DokumentCONTANT.AsInteger = 1 then begin
                dmBase.tbMens.FieldByName('CANDELETE').AsBoolean := true;
                dmBase.tbMens.FieldByName('PROPIS').AsBoolean   := false;
              end else begin
                dmBase.tbMens.FieldByName('CANDELETE').AsBoolean := false;
                // срок до какого человек времмено выбыл
                if not DokumentDATE_SROK.IsNull and (DokumentCONTANT.AsInteger=0)
                  then dmBase.tbMens.FieldByName('DATE_SROK').AsDateTime := DokumentDATE_SROK.AsDateTime;
              end;
              dmBase.tbMens.Post;
              strSoob := strSoob + mtDetiName.AsString+' ';
              if mtDetiPOL.AsString='М' then begin
                strSoob := strSoob + 'скорректирован '+#13;
              end else begin
                strSoob := strSoob + 'скорректирована '+#13;
              end;
            end;
          end;
        end;
        Append;
        FieldByName('ID').Value := nID;
        if mtDetiFAMILIA.AsString='' then begin
          FieldByName('FAMILIA').AsString   := DokumentFamilia.AsString;
        end else begin
          FieldByName('FAMILIA').AsString   := mtDetiFAMILIA.AsString;
        end;
        FieldByName('NAME').AsString   := mtDetiNAME.AsString;
        FieldByName('OTCH').AsString   := mtDetiOTCH.AsString;
        FieldByName('POL').AsString    := mtDetiPOL.AsString;
        FieldByName('DATER').AsString  := mtDetiDATER.AsString;
        FieldByName('CHILD_ID').AsString  := mtDetiCHILD_ID.AsString;
        Post;
        mtDeti.Next;
      end;
    end;
    mtDeti.First;
    strLich:='';
    if cbProvDvig.Checked  and cbProvDvig.Enabled then begin
      nIdMen := -1;
      if (DokumentMEN_ID.AsString<>'') and
         ((dLastSost = dmBase.GetDateCurrentSost) or
          (DokumentDATEZ.AsDateTime >= dLastSost)) then begin
        // если у человека нет Id то ничего не делаем
        if DokumentMEN_ID.AsString<>'' then begin
          vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, DokumentMEN_ID.AsInteger);
          if dmBase.tbMens.Locate('DATE_FIKS;ID',vKeyValues,[]) then begin
            nIdMen := DokumentMEN_ID.AsInteger;
          end;
        end;
        if nIDMen > 0 then begin
          EditDataSet(dmBase.tbTalonUbit);
          dmBase.tbTalonUbit.FieldByName('PROV').AsBoolean := true;
          PostDataSet(dmBase.tbTalonUbit);
          WriteDvigMen(nIdMen); // запишем в базу движний человека
          dmBase.tbMens.Edit;
          dmBase.tbMens.FieldByName('KATEG').AsInteger := LIC_REG;
          dmBase.tbMens.FieldByName('PRESENT').AsBoolean   := false;
          // проставим дату выписки
          dmBase.tbMens.FieldByName('DATEV').AsDateTime    := DokumentDATEZ.AsDateTime;
          if DokumentCONTANT.AsInteger=1 then begin
            dmBase.tbMens.FieldByName('CANDELETE').AsBoolean := true;
            dmBase.tbMens.FieldByName('PROPIS').AsBoolean   := false;
          end else begin
            dmBase.tbMens.FieldByName('CANDELETE').AsBoolean := false;
            // срок до какого человек временно выбыл
            if not DokumentDATE_SROK.IsNull and (DokumentCONTANT.AsInteger=0)
              then dmBase.tbMens.FieldByName('DATE_SROK').AsDateTime := DokumentDATE_SROK.AsDateTime;
          end;
          dmBase.tbMens.Post;

          //------------------------------------------------------
          // проверим льготу
          if not lCheckEn
            then lCheckEn:=dmBase.CheckRunMen(_TypeObj_TalonUbit, CHECK_EN, nIDMen, recID);
          //-------------------------------------------------------

          //------ ВУС ------------------------------------
          if GlobalTask.ParamAsBoolean('AUTO_SN_VUS') and (DokumentCONTANT.AsInteger=1) then begin
            if dmBase.tbVUS.Locate('ID', nIDMen,[]) then begin
              dmBase.tbVUS.Edit;
              WriteDateField(dmBase.tbVUS.FindField('UBIT_DATE'),DokumentDATE_SOST);
              if N_F_cbUmer.Checked then begin
                s:=DokumentAKT_SMERT.AsString;
                if s='' then begin
                  s:=DokumentDRUG_PRICH.AsString;
                end
              end else begin
                if DokumentPOL.AsString='М' then s:='Убыл, ' else s:='Убыла, ';
                s:=s+dmBase.GetAdresAkt3(Dokument,'GOSUD_V,FName;OBL_V,B_OBL_V;RAION_V;GOROD_V,GOROD_V_B;',1);
                if DokumentCEL.AsString<>'' then begin  // причина
                  s:=s+', '+edCel.Text;
                end;
              end;
              dmBase.tbVUS.FieldByName('UBIT_TEXT').AsString:=s;
              dmBase.tbVUS.Post;
            end;
          end;

          strIDLic := dmBase.tbMens.FieldByName('LIC_ID').AsString;

          strSoob := strSoob + DokumentFamilia.AsString+' '+mtDetiName.AsString+' '+mtDetiOTCH.AsString+' ';
          if DokumentPOL.AsString='М' then begin
            strSoob := strSoob + 'скорретирован '+#13;
          end else begin
            strSoob := strSoob + 'скорретирована '+#13;
          end;

          // если на постоянно
          if DokumentCONTANT.AsInteger=1 then begin
            s:='';
            dmBase.CheckCloseLic(StrToInt(strIDLic), DokumentMEN_ID.AsInteger, DokumentDATEZ.AsDateTime, s);
            if s<>'' then strSoob:=s;
          end;
        end;
      end;
    end;
    if strSoob <> '' then begin
      ShowMessage(strSoob);
    end;
    if Result then QueryExit:=false;

    if lCheckEn then begin
      SystemProg.SetRunMenReport( recID, 2{'SprMGS'});
    end;

  end;
end;

//-----------------------------------------------------------
// записать движение человека
procedure TfmTalonUbit.WriteDvigMen( nIDMen : Integer);
var
  vKeyValues, vKeyValuesD : Variant;
  sCode,s,ss : String;
  lSeek : Boolean;
begin
  lSeek := false;
  vKeyValuesD := VarArrayCreate( [0, 3], varOleStr );
  vKeyValuesD[0] := dmBase.GetDateCurrentSost;
  vKeyValuesD[1] := nIdMen;
  vKeyValuesD[2] := DokumentDATEZ.AsDateTime;
  if dmBase.tbMensDvig.Locate('DATE_FIKS;ID;DATE', vKeyValuesD,[]) then begin
    lSeek := true;
  end else begin
    vKeyValues := VarArrayCreate( [0, 3], varOleStr );
    vKeyValues[0] := dmBase.GetDateCurrentSost;
    vKeyValues[1] := nIdMen;
    vKeyValues[2] := 0;  // убыл
    vKeyValues[3] := DokumentID.AsInteger;
    if dmBase.tbMensDvig.Locate('DATE_FIKS;ID;TIP;TALON', vKeyValues,[]) then begin
      lSeek := true;
    end;
  end;
  if lSeek then begin
    dmBase.tbMensDvig.Edit;
  end else begin
    dmBase.tbMensDvig.Append;
    dmBase.tbMensDvig.FieldByName('DATE_FIKS').AsDateTime := dmBase.GetDateCurrentSost;
    dmBase.tbMensDvig.FieldByName('ID').AsInteger         := nIdMen;
  end;
  dmBase.tbMensDvig.FieldByName('TIP').AsInteger    := 0; // убыл
  dmBase.tbMensDvig.FieldByName('TALON').AsInteger  := DokumentID.AsInteger;
  dmBase.tbMensDvig.FieldByName('DATE').AsDateTime  := DokumentDATEZ.AsDateTime;
  dmBase.tbMensDvig.FieldByName('CONTANT').AsInteger:= DokumentCONTANT.AsInteger;
  dmBase.tbMensDvig.FieldByName('PRICH').AsInteger  := DokumentCEL.AsInteger;
  dmBase.tbMensDvig.FieldByName('ORGAN').AsString   := DokumentORGAN.AsString;
  if DokumentCONTANT.AsInteger=1 then begin
    dmBase.tbMensDvig.FieldByName('DATE_SROK').AsString:='';
  end else begin
    if not edDateSrok.Field.IsNull
      then dmBase.tbMensDvig.FieldByName('DATE_SROK').AsDateTime:=edDateSrok.Field.AsDateTime;
  end;
  s := '';
  if DokumentGOSUD_V.AsString<>'' then begin
    if DokumentGOSUD_V.AsString=GlobalTask.ParamAsString('GOSUD') then begin
      if DokumentOBL_V.AsString<>GlobalTask.ParamAsString('OBL') then begin
        s := DokumentOBL_V.AsString +' обл. , ';
      end;
      if DokumentRAION_V.AsString<>'' then begin
        if Pos('.',DokumentRAION_V.AsString)=0
          then s := s + DokumentRAION_V.AsString +' р-н, '
          else s := s + DokumentRAION_V.AsString +', ';
      end;
    end else begin
      if dmBase.SprStran.Locate('ID', DokumentGOSUD_V.AsString, []) then begin
        s := dmBase.SprStran.FieldByName('NAME').AsString+' ';
      end else begin
        s := '';
      end;
    end;
    if DokumentGOROD_V.AsString<>'' then begin
      ss := dmBase.GetFullNamePunkt(DokumentGOROD_V.AsString,DokumentGOROD_V_B);
      if ss <> '' then ss := ', ' + ss;
      s := s + ss;
    end;
  end;
  dmBase.tbMensDvig.FieldByName('KOMM').AsString := s;
  try
    dmBase.tbMensDvig.Post;
  except
    on E:Exception do begin
      if ( E is EADSDatabaseError ) then begin
        sCode:='['+InttOStr((E as EADSDatabaseError).ACEErrorCode)+'] ';
      end else begin
        sCode:=' ';
      end;
      PutError('Ошибка: '+sCode+E.Message);
      dmBase.tbMensDvig.Cancel;
    end;
  end;
end;

procedure TfmTalonUbit.edPolChange(Sender: TObject);
begin
  if edPol.Value<>null then begin
    if edPol.Value='М' then begin
      edNATION.ListField:='NAME_M'
    end else if edPol.Value='Ж' then begin
      edNATION.ListField:='NAME_G'
    end else begin
    edNATION.ListField:='NAME'
    end;
  end else begin
    edNATION.ListField:='NAME'
  end;
end;

procedure TfmTalonUbit.UpdateActions;
begin
  inherited;
  if cbProvDvig.Visible then begin
    if (DokumentLICH_ID.AsString='') or (DokumentLICH_ID.AsString='0') or (DokumentMEN_ID.AsString='') then begin
      cbProvDvig.Enabled := false;
    end else begin
      cbProvDvig.Enabled := true;
    end;
  end;
  if edSem.ItemIndex <> 0 then begin
    N_F_edSuprug.Enabled := false;
    if DokumentSUPRUG.AsBoolean then begin
      EditDataSet(Dokument);
      DokumentSUPRUG.AsBoolean := false;
    end;
  end else begin
    N_F_edSuprug.Enabled := true;
  end;
  if DokumentMEN_ID.AsString<>'' then begin
    btAdres.Enabled := false;
  end;
//  if DokumentMEN_ID.AsString='' then begin
//    edFamilia.Font.Color := clBlack;
//  end else begin
//    edFamilia.Font.Color := clRed;
//  end;
end;

procedure TfmTalonUbit.dsDokumentDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field <> nil then begin
    if Field.FieldName='CONTANT' then begin
    end;
  end;
end;

procedure TfmTalonUbit.TextAdresGetText(Sender: TObject; var Text: String);
//var
//  vKeyValues : Variant;
begin
{
  if DokumentADRES_ID.AsString<>'' then begin
    Text := dmBase.AdresFromID( dmBase.GetDateCurrentSost, DokumentADRES_ID.AsString );
    if DokumentLICH_ID.AsString<>'' then begin
      vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, DokumentLICH_ID.AsInteger);
      if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
        Text := 'Лиц.счет '+Trim(dmBase.tbLich.FieldByName('NOMER').AsString)+' : '+Text;
      end;
    end;
  end;
}
end;

procedure TfmTalonUbit.ReadAdres;
begin
  dmBase.AdresFromID(dmBase.GetDateCurrentSost, DokumentADRES_ID.AsString);
  DokumentGOSUD_B.AsInteger:=GlobalTask.ParamAsInteger('GOSUD');
  DokumentOBL_B.AsString:=GlobalTask.ParamAsString('OBL');
  DokumentRAION_B.AsString:=GlobalTask.ParamAsString('RAION');
  DokumentGOROD_B.AsString:=dmBase.Adres_PunktN;

  DokumentGOROD_B_B.AsInteger:=dmBase.Adres_PunktTK;

  DokumentUL_B.AsString:=dmBase.Adres_UL;
  DokumentDOM_B.AsString:=dmBase.Adres_NDom;
  DokumentKORP_B.AsString:=dmBase.Adres_Korp;
  DokumentKV_B.AsString:=dmBase.Adres_Kv;
end;

procedure TfmTalonUbit.btAdresClick(Sender: TObject);
//var
//  strLich : string;
begin
  if fmChoiceAdres= nil then begin
    fmChoiceAdres := TfmChoiceAdres.Create(nil);
  end;
  fmChoiceAdres.DateFiks   := dmBase.GetDateCurrentSost;
  fmChoiceAdres.ChoiceLich := true;
  if fmChoiceAdres.ShowModal = mrOk then begin
    EditDataSet(Dokument);
    DokumentADRES_ID.AsInteger := fmChoiceAdres.IDAdres;
    ReadAdres;
    DokumentADRES_ID.Asstring  := '';
    {
    if fmChoiceAdres.IDLich > 0 then begin
      DokumentLICH_ID.AsInteger := fmChoiceAdres.IDLich;
    end else begin
      DokumentLICH_ID.AsString  := '';
    end;
    }
    {
    strLich := dmBase.GetIDLichSchetFromAdres(dmBase.GetDateCurrentSost,DokumentADRES_ID.AsString);
    if strLich <> '' then begin
      DokumentLICH_ID.AsString := strLich;
    end;
    }
    PostDataSet(Dokument);
  end;
end;

function TfmTalonUbit.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
  if Result then begin
    if cbProvDvig.Visible
      then cbProvDvig.Checked := not DokumentPROV.AsBoolean;
  end;

// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edGOROD_R,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edGOROD_O,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edGOROD_V,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edGOROD_B,n,3,true,false,false,FAddButtonMRUList_Punkt,true);

  n:=LimitMRUList(1);
  SetMRUList(edOBL_R,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edOBL_O,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edOBL_V,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edOBL_B,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION_R,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edRAION_O,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edRAION_B,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edRAION_V,n,2,true,false,false,FAddButtonMRUList);

end;

procedure TfmTalonUbit.GridDetiColumns0EditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
begin
  if ChoiceMen( TControl(Sender), '', '', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(mtDeti);
      v := GetValueField(arrRec, 'ID');
      mtDetiCHILD_ID.AsInteger := v;
      v := GetValueField(arrRec, 'FAMILIA');
      if v = null then mtDetiFAMILIA.AsString := ''
                  else mtDetiFAMILIA.AsString := v;
      v := GetValueField(arrRec, 'NAME');
      if v = null then mtDetiNAME.AsString := ''
                  else mtDetiNAME.AsString := v;
      v := GetValueField(arrRec, 'OTCH');
      if v = null then mtDetiOTCH.AsString := ''
                  else mtDetiOTCH.AsString := v;
      v := GetValueField(arrRec, 'DATER');
      if v = null then mtDetiDateR.AsString := ''
                  else mtDetiDateR.Value    := v;
      v := GetValueField(arrRec, 'POL');
      if v <> null then mtDetiPOL.Value := v;
      QueryExit:=true;
      Screen.Cursor := old;
  end;
end;

procedure TfmTalonUbit.edFamiliaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  nID : Integer;
  adr : TAdres;
  old : TCursor;
  p : TPassport;
  strName : String;
begin
  if ChoiceMen( TControl(Sender), Trim(edFamilia.Text), '', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      v := GetValueField(arrRec, 'ID');
      DokumentMEN_ID.AsInteger := v;
      v := GetValueField(arrRec, 'FAMILIA');
      if v = null then DokumentFAMILIA.AsString := ''
                  else DokumentFAMILIA.AsString := v;
      v := GetValueField(arrRec, 'NAME');
      if v = null then DokumentNAME.AsString := ''
                  else DokumentNAME.AsString := v;
      v := GetValueField(arrRec, 'OTCH');
      if v = null then DokumentOTCH.AsString := ''
                  else DokumentOTCH.AsString := v;
      v := GetValueField(arrRec, 'DATER');
      if v = null then DokumentDateR.AsString := ''
                  else DokumentDateR.Value    := v;
      v := GetValueField(arrRec, 'NATION');
      if v = null then DokumentNATION.AsInteger:= 0
                  else DokumentNATION.Value    := v;
      v := GetValueField(arrRec, 'OBRAZ');
      if v = null then DokumentOBRAZ.AsString := ''
                  else DokumentOBRAZ.Value    := v;
      v := GetValueField(arrRec, 'POL');
      if v <> null then DokumentPOL.Value := v;
      v := GetValueField(arrRec, 'SEM');
      if v = null then DokumentSEM.AsString := ''
                  else DokumentSEM.Value    := v;

      v := GetValueField(arrRec, 'CITIZEN');
      if v <> null then DokumentCITIZEN.Value := v;

      nID := DokumentMEN_ID.AsInteger;
      DokumentWORK_DOLG_OLD.AsString := Concat2Str(dmBase.GetWork(nId, arrRec),dmBase.GetDolg(nID, arrRec),', ');
      p := dmBase.GetRecPasport(nID, arrRec);
      if p.Nomer <> '' then begin
        DokumentPASP_UDOST.AsInteger := p.UdostKod;
        DokumentPASP_SERIA.AsString := p.Seria;
        DokumentPASP_NOMER.AsString := p.Nomer;
        DokumentPASP_VIDAN.AsString := p.Organ;
        DokumentLICH_NOMER.AsString := p.LichNomer;
        DokumentPASP_DATE.AsDateTime := p.Date;
      end;
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      DokumentADRES_ID.AsInteger := adr.AdresID;
      DokumentLICH_ID.AsInteger  := adr.LicID;
      ReadAdres;

      //------ запишем место рождения человека ------------
      with dmBase.tbMensAdd do begin
        if Locate('ID', DokumentMEN_ID.AsInteger, []) then begin
          WriteField( DokumentGOSUD_R   , FieldByName('MR_GOSUD')  ); //   , lErr);
          WriteField( DokumentB_OBL_R   , FieldByName('MR_B_OBL')  ); //   , lErr);
          WriteField( DokumentOBL_R     , FieldByName('MR_OBL')    ); //     , lErr);
          WriteField( DokumentRAION_R   , FieldByName('MR_RAION')  ); //   , lErr);
          WriteField( DokumentGOROD_R_B , FieldByName('MR_B_GOROD')); // , lErr);
          WriteField( DokumentGOROD_R   , FieldByName('MR_GOROD')  ); //   , lErr);

          WriteField( DokumentGOSUD_O   , FieldByName('OP_GOSUD')  ); //   , lErr);
          WriteField( DokumentB_OBL_O   , FieldByName('OP_B_OBL')  ); //   , lErr);
          WriteField( DokumentOBL_O     , FieldByName('OP_OBL')    ); //     , lErr);
          WriteField( DokumentRAION_O   , FieldByName('OP_RAION')  ); //   , lErr);
          WriteField( DokumentGOROD_O_B , FieldByName('OP_B_GOROD')); // , lErr);
          WriteField( DokumentGOROD_O   , FieldByName('OP_GOROD')  ); //   , lErr);
          WriteDateField( DokumentDATE_O, FieldByName('OP_DATE')  ); //   , lErr);
        end;
      end;
      //------------------------------------------------------

      PostDataSet(Dokument);
      Screen.Cursor := old;
  end;
end;

procedure TfmTalonUbit.SetRB_OnClick(Sender: TObject;
  var Handled: Boolean);
begin
  TDBLookupComboBoxEh(TWinControl(Sender).Parent).Value:=112;
  Handled:=true;
end;

procedure TfmTalonUbit.SetRF_OnClick(Sender: TObject;
  var Handled: Boolean);
begin
  TDBLookupComboBoxEh(TWinControl(Sender).Parent).Value:=643;
  Handled:=true;
end;

procedure TfmTalonUbit.SetU_OnClick(Sender: TObject; var Handled: Boolean);
begin
  TDBLookupComboBoxEh(TWinControl(Sender).Parent).Value:=804;
  Handled:=true;
end;

procedure TfmTalonUbit.btAddChildClick(Sender: TObject);
begin
  mtDeti.Append;
end;

procedure TfmTalonUbit.btDelChildClick(Sender: TObject);
begin
  if mtDeti.RecordCount>0 then begin
    mtDeti.Delete;
  end;
end;

procedure TfmTalonUbit.dsDetiDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field<>nil then begin
    QueryExit := true;
  end;
end;

procedure TfmTalonUbit.TextLichGetText(Sender: TObject; var Text: String);
var
  vKeyValues : Variant;
begin
  if DokumentADRES_ID.AsString<>'' then begin
    if DokumentLICH_ID.AsString<>'' then begin
      vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, DokumentLICH_ID.AsInteger);
      if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
        Text := 'Лиц.счет №'+Trim(dmBase.tbLich.FieldByName('NOMER').AsString);
      end;
    end;
  end;
end;

procedure TfmTalonUbit.edRAION_RNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmTalonUbit.edOBL_RNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmTalonUbit.edPasp_OrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD,Trim(edPasp_Organ.Text));
 if s<>'' then begin
   edPasp_Organ.Text:=s;
 end;
end;

procedure TfmTalonUbit.ENG_edLichNomerUpdateData(Sender: TObject; var Handled: Boolean);
var
  s:String;
begin
  if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
    if (edUdost.Field.AsInteger=PASP_GR_RB) and (edCitizen.Field.Value=MY_GRAG) or edCitizen.Field.IsNull then begin
      ENG_edLichNomer.text := CheckLichNom(true, ENG_edLichNomer.Text);
      s:=GetErrorCheck;
      if s<>'' then begin
        PutError(s);
      end;
    end;
  end;
end;                             

procedure TfmTalonUbit.FormCreate(Sender: TObject);
begin
  inherited;
  FCurLic:=0;
  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,mtDeti,'Deti','Дети');
  {$ENDIF}
end;

procedure TfmTalonUbit.edCelChange(Sender: TObject);
var
  nVal,n:Integer;
begin
  if edCel.Value=null then begin

  end else begin
    try
      nVal:=StrToInt(VarToStr(edCel.Value));
    except
      nVal:=0;
    end;
    if nVal>0 then begin
      n:=Globaltask.ParamAsInteger('PRICH_SMERT');
      if n>0 then begin
        if n=nVal then begin
          SetSmert(true,false);
        end else begin
          SetSmert(false,false);
        end;
      end;
    end;
  end;
end;

procedure TfmTalonUbit.N_F_cbUmerClick(Sender: TObject);
begin
  if N_F_cbUmer.Checked then begin
    SetSmert(true,true);
  end else begin
    SetSmert(false,true);
  end;
end;


procedure TfmTalonUbit.SetSmert(lSet: Boolean; lSeekCel:Boolean);
var
  n:Integer;
begin
  if not FRun then begin
    FRun:=true;
    n:=Globaltask.ParamAsInteger('PRICH_SMERT');
    EditDataSet(Dokument);
    if lSet then begin
      if lSeekCel and (n>0) then begin
        if dmBase.SprTypeMigr.Locate('ID',n,[]) then begin
          DokumentCEL.AsInteger:=n;
        end else begin

        end;
      end;
      DokumentSMERT.AsBoolean:=true;

      gbVibil.Visible:=false;
      DokumentGOSUD_V.AsString:='';
      DokumentOBL_V.AsString:='';
      DokumentRAION_V.AsString:='';
      DokumentGOROD_V.AsString:='';
      DokumentGOROD_V_B.AsString:='';
      if Globaltask.ParamAsInteger('TALON_SMERT')=1 then begin  // необходимо набирать в другие причины
        edAktSmert.Visible:=false;
      end else begin                             // хотим, чтобы печаталось в графе куда убыл
        edAktSmert.Left := LabelCel.Left;
        edAktSmert.Top := edCel.Top+30;
        edAktSmert.Width:=Self.ClientWidth-40;
        edAktSmert.Visible:=true;
      end;
    end else begin
      DokumentSMERT.AsBoolean:=false;
      if lSeekCel then begin
        DokumentCEL.AsString:='';
      end;
      gbVibil.Visible:=true;
      edAktSmert.Visible:=false;
      DokumentAKT_SMERT.AsString:='';
      DokumentDATE_SMERT.AsString:='';
    end;
    FRun:=false;
  end;
end;

procedure TfmTalonUbit.WriteDokumentFromArr(arrRec: TCurrentRecord;  lDeti: Boolean);
var
  v : Variant;
  nID : Integer;
  p : TPassport;
  ListDeti:TDataSet;
  sKodOtnosh:String;
begin
   EditDataSet(Dokument);
      DokumentMEN_ID.AsInteger := GetValueField(arrRec, 'ID');
      v := GetValueField(arrRec, 'FAMILIA');
      if v = null then DokumentFAMILIA.AsString := ''
                  else DokumentFAMILIA.AsString := v;
      v := GetValueField(arrRec, 'NAME');
      if v = null then DokumentNAME.AsString := ''
                  else DokumentNAME.AsString := v;
      v := GetValueField(arrRec, 'OTCH');
      if v = null then DokumentOTCH.AsString := ''
                  else DokumentOTCH.AsString := v;
      v := GetValueField(arrRec, 'DATER');
      if v = null then DokumentDateR.AsString := ''
                  else DokumentDateR.Value    := v;
      v := GetValueField(arrRec, 'NATION');
      if v = null then DokumentNATION.AsInteger:= 0
                  else DokumentNATION.Value    := v;
      v := GetValueField(arrRec, 'CITIZEN');
      if v = null then DokumentCITIZEN.AsInteger:= 0
                  else DokumentCITIZEN.Value    := v;
      v := GetValueField(arrRec, 'OBRAZ');
      if v = null then DokumentOBRAZ.AsString := ''
                  else DokumentOBRAZ.Value    := v;
      v := GetValueField(arrRec, 'POL');
      if v <> null then DokumentPOL.Value := v;
      v := GetValueField(arrRec, 'SEM');
      if v = null then DokumentSEM.AsString := ''
                  else DokumentSEM.Value    := v;

      nID := DokumentMEN_ID.AsInteger;

      DokumentWORK_NAME.AsString := dmBase.GetWork(nId, arrRec);
      DokumentDOLG_NAME.AsString := dmBase.GetDolg(nID, arrRec);

      p := dmBase.GetRecPasport(nID, arrRec);
      if p.Nomer <> '' then begin
        DokumentPASP_UDOST.AsInteger := p.UdostKod;
        DokumentPASP_SERIA.AsString := p.Seria;
        DokumentPASP_NOMER.AsString := p.Nomer;
        DokumentPASP_VIDAN.AsString := p.Organ;
        DokumentLICH_NOMER.AsString := p.LichNomer;
        DokumentPASP_DATE.AsDateTime := p.Date;
      end;
//      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
//      DokumentADRES_ID.AsInteger := adr.AdresID;
//      DokumentLICH_ID.AsInteger  := adr.LicID;
//      FCurLic:=adr.LicID;

      DokumentADRES_ID.AsInteger := GetValueFieldEx(arrRec, 'ADRES_ID',0);
      DokumentLICH_ID.AsInteger  := GetValueFieldEx(arrRec, 'LIC_ID',0);
      FCurLic:=DokumentLICH_ID.AsInteger;

      //------ запишем место рождения человека ------------
      with dmBase.tbMensAdd do begin
        if Locate('ID', DokumentMEN_ID.AsInteger, []) then begin
          WriteField( DokumentGOSUD_R   , FieldByName('MR_GOSUD')  ); //   , lErr);
          WriteField( DokumentB_OBL_R   , FieldByName('MR_B_OBL')  ); //   , lErr);
          WriteField( DokumentOBL_R     , FieldByName('MR_OBL')    ); //     , lErr);
          WriteField( DokumentRAION_R   , FieldByName('MR_RAION')  ); //   , lErr);
          WriteField( DokumentGOROD_R_B , FieldByName('MR_B_GOROD')); // , lErr);
          WriteField( DokumentGOROD_R   , FieldByName('MR_GOROD')  ); //   , lErr);

          WriteField( DokumentGOSUD_O   , FieldByName('OP_GOSUD')  ); //   , lErr);
          WriteField( DokumentB_OBL_O   , FieldByName('OP_B_OBL')  ); //   , lErr);
          WriteField( DokumentOBL_O     , FieldByName('OP_OBL')    ); //     , lErr);
          WriteField( DokumentRAION_O   , FieldByName('OP_RAION')  ); //   , lErr);
          WriteField( DokumentGOROD_O_B , FieldByName('OP_B_GOROD')); // , lErr);
          WriteField( DokumentGOROD_O   , FieldByName('OP_GOROD')  ); //   , lErr);
          WriteField( DokumentDATE_O    , FieldByName('OP_DATE')  ); //   , lErr);
        end;
      end;
      //------------------------------------------------------
      if lDeti then begin
        ListDeti:=dbCreateListDeti;
        dmBase.GetDeti(ListDeti,DokumentMEN_ID.AsString,DokumentPOL.AsString,0,14,false,false);
        mtDeti.EmptyTable;
        while not ListDeti.Eof do begin
          mtDeti.Append;
          mtDetiFAMILIA.AsString:=ListDeti.FieldByName('FAMILIA').AsString;
          mtDetiNAME.AsString:=ListDeti.FieldByName('NAME').AsString;
          mtDetiOTCH.AsString:=ListDeti.FieldByName('OTCH').AsString;
          mtDetiPOL.AsString:=ListDeti.FieldByName('POL').AsString;

          sKodOtnosh:='';
          {
          if mtDetiPOL.AsString='М' then begin
            if dmBase.SprOtnosh.Locate('NAME','сын',[loCaseInsensitive])
              then sKodOtnosh:=dmBase.SprOtnosh.FieldByName('ID').AsString;
          end else begin
            if dmBase.SprOtnosh.Locate('NAME','дочь',[loCaseInsensitive])
              then sKodOtnosh:=dmBase.SprOtnosh.FieldByName('ID').AsString;
          end;
          if sKodOtnosh<>'' then mtDetiOTNOSH.AsString:=sKodOtnosh;
          }
          if not ListDeti.FieldByName('DATER').IsNull then begin
            mtDetiDATER.AsDateTime:=ListDeti.FieldByName('DATER').AsDateTime;
          end;
          mtDeti.Post;
          ListDeti.Next;
        end;
        dbClose(ListDeti);
      end;

end;

end.
