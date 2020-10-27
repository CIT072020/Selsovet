unit fDeclRegUstOtc;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,  uSaveMemtable,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc, DateUtils,uTypes,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  ImgList, DBGridEh, Buttons, AppEvnts, vchDBCtrls, kbmMemCSVStreamFormat,
  ZipForge;

type
  TfmDeclRegUstOtc = class(TfmSimpleD)
    pn: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    edNomer: TDBEditEh;
    edDateZ: TDBDateTimeEditEh;
    DokumentDATEZ: TDateField;
    DokumentFIO: TStringField;
    DokumentRG_GOSUD: TIntegerField;
    DokumentRG_OBL: TStringField;
    DokumentRG_RAION: TStringField;
    DokumentRG_GOROD: TStringField;
    DokumentGT_GOROD_R: TStringField;
    DokumentRUKOV: TStringField;
    DokumentRG_B_RESP: TBooleanField;
    DokumentRG_B_OBL: TBooleanField;
    dsStran: TDataSource;
    dsNation: TDataSource;
    DokumentID_ZAGS: TIntegerField;
    dsGragd: TDataSource;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    ImageGISUN: TImage;
    DokumentRG_B_GOROD: TSmallintField;
    ApplicationEvents1: TApplicationEvents;
    pnMain: TPanel;
    Label1: TLabel;
    edFIO: TDBEditEh;
    DokumentADRES: TMemoField;
    DokumentNOMER: TStringField;
    DokumentRNGOROD: TStringField;
    DokumentDOKUMENT: TMemoField;
    gbGit: TGroupBox;
    Label15: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label53: TLabel;
    edB_RESP: TDBCheckBoxEh;
    edGOSUD: TDBLookupComboboxEh;
    edB_OBL: TDBCheckBoxEh;
    edGOROD: TDBEditEh;
    edGOROD_R: TDBEditEh;
    edRNGOROD: TDBLookupComboboxEh;
    edB_GOROD: TDBLookupComboboxEh;
    edRAION: TDBEditEh;
    edOBL: TDBEditEh;
    DokumentZAPROS: TMemoField;
    DokumentZAPROS_DATE: TDateField;
    DokumentORGANS: TMemoField;
    DokumentOTVET_DATE: TDateField;
    DokumentOTMETKA: TMemoField;
    DokumentPRIM: TMemoField;
    Label4: TLabel;
    edAdres: TDBEditEh;
    Label5: TLabel;
    edZAPROS: TDBEditEh;
    Label6: TLabel;
    edORGANS: TDBEditEh;
    Label9: TLabel;
    edOTMETKA: TDBEditEh;
    Label10: TLabel;
    edOTVET_DATE: TDBDateTimeEditEh;
    Label11: TLabel;
    edZAPROS_DATE: TDBDateTimeEditEh;
    edPRIM: TDBEditEh;
    Label12: TLabel;
    DokumentGOD: TIntegerField;
    DokumentDOK_TYPE: TIntegerField;
    DokumentDOK_SERIA: TStringField;
    DokumentDOK_NOMER: TStringField;
    DokumentDOK_DATE: TDateField;
    DokumentDOK_NAME: TMemoField;
    edFIO2: TDBEditEh;
    edAdres2: TDBEditEh;
    DokumentFIO2: TStringField;
    DokumentADRES2: TMemoField;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edRNGORODNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure pcRastChange(Sender: TObject);
    procedure N_F_cbBrakClick(Sender: TObject);
    procedure edLicoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsRastDataChange(Sender: TObject; Field: TField);
    procedure edRukovEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edDokumentEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edDokumentEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
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

  end;

  function EditDeclRegUstOtc(nID : Integer; nTypeObj:Integer=0) : Boolean;


implementation

uses dBase, fMain, fChoiceNasel, fShablon, fEnterDokument, uProject;

{$R *.DFM}

var
  fmDeclRegUstOtc: TfmDeclRegUstOtc;

function EditDeclRegUstOtc(nID : Integer; nTypeObj:Integer) : Boolean;
begin
//  result := true;
  fmDeclRegUstOtc := TfmDeclRegUstOtc.Create(nil);
  if nTypeObj=0
    then nTypeObj:=_TypeObj_UZUstOtc;
  fmDeclRegUstOtc.TypeObj := nTypeObj;

  try
    with fmDeclRegUstOtc do begin
      IsReadDokument:=true;
      if nID=-1 then begin
        NewDok(true);
        SetIDZags;
        //CheckEnabledNameOrgan(true);
      end else begin
        ReadDok( nID );
        CheckEnabledNameOrgan(false,false);
      end;
      TBItemZAGS.Visible:=false;
      TBToolbarOrgan.Visible:=false;
      IsReadDokument:=false;
      QueryExit:=false;
      Result:=EditModal;
    end;
  finally
    fmDeclRegUstOtc.Free;
    fmDeclRegUstOtc := nil;
  end;
end;

{ TfmDeclRegUstOtc }

constructor TfmDeclRegUstOtc.Create(Owner: TComponent);
var
  n:Integer;
begin
  inherited;
 // FDokZAGS := true;
  FAutoNum:=true;
//  FAutoNum := false; //IsAutoNumZAGS;
  FBigTable:=1;   // исп-ся в функции SetNewNomerDok

  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(3);
  SetMRUList(edGOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

//  n:=LimitMRUList(4);
//  SetMRUList(edGT_RNGOROD,n,4,true,false,false,FAddButtonMRUList_Punkt);


  SetLength(FArrChoiceRekv,1);
//  FArrChoiceRekv[0].nType:=SHABLON_ADRESAT;
//  FArrChoiceRekv[0].FieldName:='ADRESAT';

  FArrChoiceRekv[0].nType:=SHABLON_ISPOLN;
  FArrChoiceRekv[0].FieldName:='OTMETKA';
{
  FArrChoiceRekv[0].nType:=0;
  FArrChoiceRekv[0].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[0].FieldName:='R_ZAGS';
  FArrChoiceRekv[0].sPadeg:='П';

}
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
  FMainTable := dmBase.GurnalRegistr;
  dsGragd.DataSet := dmBase.SprGragd;
//  edFamilia.EditButtons[0].Glyph := edDecl.EditButtons[0].Glyph;
//  pc.ActivePageIndex:=0;
  FPageControl := nil;

//  edFamilia.OnUpdateData:=FIOUpdateData;
//  edGOROD.OnUpdateData:=CityUpdate;

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
  ImageGISUN.Visible := false;
end;

destructor TfmDeclRegUstOtc.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmDeclRegUstOtc.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;

function TfmDeclRegUstOtc.GetVid: String;
begin
  Result := 'DeclRegUstOtc';
end;

function TfmDeclRegUstOtc.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
{
  DokumentB_RESP.AsBoolean:=true;
  DokumentB_OBL.AsBoolean:=true;
  DokumentB_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
}

  inherited NewDok(lAppend);

  QueryExit:=false;
  Result := true;
end;

function TfmDeclRegUstOtc.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
begin
  Result := true;
  if not dmBase.GurnalRegistr.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  for i:=0 to dmBase.GurnalRegistr.FieldCount-1 do begin
    strField := dmBase.GurnalRegistr.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.GurnalRegistr.Fields[i]);
    end;
  end;
  {
  if (DokumentDOK_TYPE.AsString<>'') and (DokumentDOK_NOMER.AsString<>'') then begin
    edDokument.ReadOnly:=true;
    edDokument.Color:=GetDisableColor;
  end;
  }
  SetIDZags;

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
procedure TfmDeclRegUstOtc.WriteSoato(fld:TField);
var
  SOATO:TSOATO;
begin
  SOATO:=dmBase.GetSoatoAkt(Dokument,
        'GOSUD,FName;OBL,B_OBL;RAION,RNGOROD;GOROD,B_GOROD',true,FLenSoato);
  fld.AsString:=SOATO.Kod;
end;
//------------------------------------------------------------------------
function TfmDeclRegUstOtc.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr, strRazd : String;
  vKeyValues : Variant;
  st:TStringStream;
begin
  AdditiveBeforeWriteDok;
  PostDataSet(Dokument);
  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
  if DokumentDATEZ.IsNull then begin
    strErr := ' Заполните дату. ';
  end else if DokumentNOMER.AsString='' then begin
    strErr := ' Заполните номер. ';
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства о смерти. ';
  end else if (DokumentFIO.AsString='')  then begin
    strErr := ' Заполните Фамилию, инициалы. ';
  end;

  if strErr<>'' then begin
    PutError(strErr);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.GurnalRegistr.Append;
    dmBase.GurnalRegistr.Post;
    nID := dmBase.GurnalRegistr.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.GurnalRegistr.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;

    dmBase.GurnalRegistr.Edit;

    SaveDef:=false;

    for i:=1 to dmBase.GurnalRegistr.FieldCount-1 do begin
      strField := dmBase.GurnalRegistr.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.GurnalRegistr.Fields[i].Value := fld.Value;
      end;
    end;

    dmBase.GurnalRegistr.FieldByName('TYPEOBJ').AsInteger:=TypeObj;
    dmBase.GurnalRegistr.FieldByName('GOD').AsInteger:=YearOf(DokumentDATEZ.AsDateTime);
    dmBase.GurnalRegistr.Post;

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

procedure TfmDeclRegUstOtc.UpdateActions;
begin
  inherited;
end;

procedure TfmDeclRegUstOtc.dsDokumentDataChange(Sender: TObject;  Field: TField);
var
  strField : String;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    strField:=ANSIUpperCase(Field.FieldName);
    if strField = 'FAMILIA' then begin

    end;
  end;
end;

function TfmDeclRegUstOtc.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
end;

procedure TfmDeclRegUstOtc.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmDeclRegUstOtc.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

procedure TfmDeclRegUstOtc.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmDeclRegUstOtc.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmDeclRegUstOtc.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmDeclRegUstOtc.CheckOnlyGod;
begin
end;

procedure TfmDeclRegUstOtc.CheckOnlyGodR;
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

procedure TfmDeclRegUstOtc.edRNGORODNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmDeclRegUstOtc.CheckRnGorod;
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

procedure TfmDeclRegUstOtc.edDateRUpdateData(Sender: TObject; var Handled: Boolean);
begin
//  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 1);
end;

function TfmDeclRegUstOtc.CreateSubMenuRun: Boolean;
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

procedure TfmDeclRegUstOtc.pcRastChange(Sender: TObject);
begin
end;

//-----------------------------------------------------------------------------------------
procedure TfmDeclRegUstOtc.N_F_cbBrakClick(Sender: TObject);
begin
end;

//-----------------------------------------------------------------------------------------
procedure TfmDeclRegUstOtc.edLicoEnter(Sender: TObject);
begin
end;

//-----------------------------------------------------------------------------------------
procedure TfmDeclRegUstOtc.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF USE_FR3}
 //   CreatefrxDBdataSet(self,tbRast,'DeclRegRogd','DeclRegRogd');
  {$ENDIF}
end;

//-----------------------------------------------------------------------------------------
procedure TfmDeclRegUstOtc.dsRastDataChange(Sender: TObject; Field: TField);
begin
  if Field<>nil then begin
    QueryExit:=true;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmDeclRegUstOtc.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
//  ChoiceSpecD(edRukov);
end;

//-----------------------------------------------------------------------------------------
procedure TfmDeclRegUstOtc.edDokumentEditButtons0Click(Sender: TObject;  var Handled: Boolean);
//var
// p : TPassport;
// s : String;
begin
{
  fmEnterDokument:=TfmEnterDokument.Create(Self);
  with fmEnterDokument do begin
    tb.Edit;
    if (edDokument.ReadOnly=true) and (DokumentDOK_TYPE.AsString<>'') and (DokumentDOK_NOMER.AsString<>'') then begin
      tbDOK_TYPE.AsString:=DokumentDOK_TYPE.AsString;
      tbDOK_SERIA.AsString:=DokumentDOK_SERIA.AsString;
      tbDOK_NOMER.AsString:=DokumentDOK_NOMER.AsString;
//      tbDOK_ORGAN.AsString:=DokumentDOK_ORGAN.AsString;
      tbDOK_NAME.AsString:=DokumentDOK_NAME.AsString;
      WriteDateField(tbDOK_DATE,DokumentDOK_DATE);
    end;
    if EditDokument then begin
      Application.ProcessMessages;
      EditDataSet(Dokument);
      p := dmBase.PasportFromValues(tbDOK_TYPE.AsInteger, tbDOK_SERIA.AsString, tbDOK_NOMER.AsString,
                           tbDOK_NAME.AsString, '', tbDOK_DATE.Value);
      s := dmBase.PasportToText(p,0);
      if s<>'' then begin
        DokumentDOKUMENT.AsString:=s;
        DokumentDOK_TYPE.AsString:=tbDOK_TYPE.AsString;
        DokumentDOK_SERIA.AsString:=tbDOK_SERIA.AsString;
        DokumentDOK_NOMER.AsString:=tbDOK_NOMER.AsString;
//      DokumentDOK_ORGAN.AsString:=tbDOK_ORGAN.AsString;
        DokumentDOK_NAME.AsString:=tbDOK_NAME.AsString;
        WriteDateField(DokumentDOK_DATE,tbDOK_DATE);
        edDokument.ReadOnly:=true;
        edDokument.Color:=GetDisableColor;
      end;
      PostDataSet(Dokument);
    end;
  end;
}
end;

procedure TfmDeclRegUstOtc.edDokumentEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
{
  EditDataSet(Dokument);
  DokumentDOKUMENT.AsString:='';
  DokumentDOK_TYPE.AsString:='';
  DokumentDOK_SERIA.AsString:='';
  DokumentDOK_NOMER.AsString:='';
  DokumentDOK_NAME.AsString:='';
  DokumentDOK_DATE.AsString:='';
  edDokument.ReadOnly:=false;
  edDokument.Color:=GetControlColor;
}
end;

end.
