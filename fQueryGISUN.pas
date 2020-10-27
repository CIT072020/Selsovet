unit fQueryGISUN;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,DateUtils,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,uSaveMemTable, uProject,uProjectAll,uTypes,mPermit,
  ExtCtrls, OpisEdit, dbFunc, MetaTask, DBLookupEh, DBCtrlsEh, StdCtrls,
  Mask, Grids, DBGridEh, FuncPr, FR_DSet, FR_DBSet, TB2ExtItems, DBCtrls,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, mRegInt, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  Buttons, ImgList, kbmMemCSVStreamFormat, vchDBCtrls, ZipForge;

type
  TfmQueryGISUN = class(TfmSimpleD)
    TBItemChoiceMen: TTBItem;
    pc: TPageControl;
    tsTail1: TTabSheet;
    Label1: TLabel;
    edFamilia: TDBEditEh;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    edDATER: TDBDateTimeEditEh;
    Label14: TLabel;
    Label22: TLabel;
    edGRAG: TDBLookupComboboxEh;
    tsReshSud: TTabSheet;
    dsDeti: TDataSource;
    dsNation: TDataSource;
    dsStran: TDataSource;
    edSpec: TDBEditEh;
    Label4: TLabel;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentFamilia_B: TStringField;
    DokumentName_B: TStringField;
    DokumentOtch_B: TStringField;
    DokumentPOL: TStringField;
    DokumentDateR: TDateField;
    DokumentGOSUD: TIntegerField;
    DokumentOBL: TStringField;
    DokumentRAION: TStringField;
    DokumentGOROD: TStringField;
    DokumentNATION: TIntegerField;
    DokumentGRAG: TIntegerField;
    DokumentM_GOSUD: TIntegerField;
    DokumentM_OBL: TStringField;
    DokumentM_RAION: TStringField;
    DokumentM_GOROD: TStringField;
    DokumentM_GOROD_R: TStringField;
    DokumentM_B_OBL: TBooleanField;
    DokumentSEM: TIntegerField;
    DokumentV_OBAZAN: TBooleanField;
    DokumentDOKUMENT: TMemoField;
    DokumentOTMETKA: TMemoField;
    DokumentRUKOV: TStringField;
    DokumentRUKOV_B: TStringField;
    DokumentSPEC: TStringField;
    DokumentID_ZAGS: TIntegerField;
    DokumentID_SOURCE: TIntegerField;
    DokumentB_OBL: TBooleanField;
    DokumentFirst_Ekz: TBooleanField;
    edPol: TDBComboBoxEh;
    DokumentOBL_B: TStringField;
    DokumentRAION_B: TStringField;
    DokumentGOROD_B: TStringField;
    DokumentV_WHO: TMemoField;
    dsGragd: TDataSource;
    TBItemArxSpr: TTBItem;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    DokumentB_GOROD: TSmallintField;
    DokumentM_B_GOROD: TSmallintField;
    DokumentSTATUS: TStringField;
    DokumentPOLE_GRN: TSmallintField;
    DokumentDOK_TYPE: TSmallintField;
    DokumentDOK_SERIA: TStringField;
    DokumentDOK_NOMER: TStringField;
    DokumentDOK_DATE: TDateField;
    DokumentDOK_ORGAN: TIntegerField;
    DokumentVOENKOM: TIntegerField;
    DokumentTYPEMESSAGE: TStringField;
    DokumentIDENTIF: TStringField;
    Label26: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    DokumentSPEC_B: TStringField;
    TBItemZaklChName: TTBItem;
    DokumentM_RNGOROD: TStringField;
    BLR_edOtch: TDBEditEh;
    BLR_edName: TDBEditEh;
    BLR_edFamilia: TDBEditEh;
    Label9: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    edGOSUD: TDBLookupComboboxEh;
    edB_OBL: TDBCheckBoxEh;
    edGOROD: TDBEditEh;
    BLR_edOBL: TDBEditEh;
    BLR_edRAION: TDBEditEh;
    edB_GOROD: TDBLookupComboboxEh;
    edRAION: TDBEditEh;
    edOBL: TDBEditEh;
    BLR_edGorod: TDBEditEh;
    BLR_edGosud: TDBLookupComboboxEh;
    BLR_edB_GOROD: TDBLookupComboboxEh;
    Label36: TLabel;
    lbDolgSpec: TvchDBText;
    TBItemDeclChName: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    Bevel1: TBevel;
    Label23: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    edM_GOROD_R: TDBEditEh;
    edM_RNGOROD: TDBLookupComboboxEh;
    edM_DOM: TDBEditEh;
    edM_KORP: TDBEditEh;
    edM_KV: TDBEditEh;
    Label18: TLabel;
    edM_GOSUD: TDBLookupComboboxEh;
    Label19: TLabel;
    edM_B_OBL: TDBCheckBoxEh;
    edM_OBL: TDBEditEh;
    edM_B_GOROD: TDBLookupComboboxEh;
    edM_GOROD: TDBEditEh;
    edM_RAION: TDBEditEh;
    Label20: TLabel;
    Label2: TLabel;
    Label24: TLabel;
    Label31: TLabel;
    edDOKUMENT: TDBEditEh;
    edSEM: TDBComboBoxEh;
    edDOK_TYPE: TDBComboBoxEh;
    edDOK_SERIA: TDBEditEh;
    edDOK_NOMER: TDBEditEh;
    Label69: TLabel;
    edDOK_DATE: TDBDateTimeEditEh;
    gbDeti: TGroupBox;
    GridDeti: TDBGridEh;
    edSEM_DOK: TDBEditEh;
    DokumentSEM_DOK: TStringField;
    GridRS: TDBGridEh;
    mDebug: TMemo;
    DokumentM_DOM: TStringField;
    DokumentM_KORP: TStringField;
    DokumentM_KV: TStringField;
    DokumentREG_DATE: TDateField;
    DokumentREG_DATE_TILL: TDateField;
    Label3: TLabel;
    N_F_edGisUser: TDBEditEh;
    Label8: TLabel;
    N_F_GisIdQuery: TDBEditEh;
    Label13: TLabel;
    N_F_edGisTimeQuery: TDBDateTimeEditEh;
    N_F_lbStatus: TvchDBText;
    dsReshSud: TDataSource;
    edDateS: TDBDateTimeEditEh;
    DokumentDATES: TDateField;
    N_F_OnlyActive: TCheckBox;
    N_F_Do18: TCheckBox;
    lbDateS: TLabel;
    procedure FormResize(Sender: TObject);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edOBL_RNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure edRaion_RNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure edDATERUpdateData(Sender: TObject; var Handled: Boolean);
    function EmptyIzm: String; override;
    procedure Button1Click(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure GridDetiTitleBtnClick(Sender: TObject; ACol: Integer;      Column: TColumnEh);
    procedure edSpecEditButtons0Click(Sender: TObject;                   var Handled: Boolean);
    procedure GridDetiColumns5EditButtons0Click(Sender: TObject;         var Handled: Boolean);
    procedure GridDetiKeyDown(Sender: TObject; var Key: Word;            Shift: TShiftState);
    procedure TBItemDeclChNameClick(Sender: TObject);
    procedure dsDetiDataChange(Sender: TObject; Field: TField);
    procedure TBItemGetDataGISUNClick(Sender: TObject);
    procedure lbAnnulirGetText(Sender: TObject; var Text: String);
    procedure GridDetiGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure N_F_lbStatusGetText(Sender: TObject; var Text: String);
    procedure N_F_Do18Click(Sender: TObject);
    procedure N_F_OnlyActiveClick(Sender: TObject);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    { Public declarations }
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function ReadDeti(strDeti:String): Boolean;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    function BeforeEdit : Boolean; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    procedure UpdateActions; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure CheckControlSvid;
    function CheckFIO: String; override;
    function CreateSubMenuRun: Boolean; override;
    procedure QueryAddObrab(data: TPersonalData_; dsOutPut:TDataSet; dsDokument:TDataSet; slPar:TStringList);
    function CheckAddPanel(var Text : String):Boolean; override;
    function SetNewNomerDok(lSetDate:Boolean=false):Integer; override;   // новый номер
    function CheckDokumentSimple(nType:Integer; lWriteDok:Boolean):Boolean; override;

    procedure SetOnlyPovtorSvid(lOnlyPovtor: Boolean;  pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;  lbSvid, lbNomer: TLabel);
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;
    procedure CheckFilterDeti;

  end;

function RunQueryGISUN( nID : Integer; slPar:TStringList) : Boolean;

var
  fmQueryGISUN: TfmQueryGISUN;

implementation

uses dBase, fMain, fShablon, uDataSet2XML, fGetGisun1;

{$R *.DFM}
{$I Task.inc}

{ TfmZapisBrak }

function RunQueryGISUN( nID : Integer; slPar:TStringList) : boolean;
begin
//  result := true;
  fmQueryGISUN := TfmQueryGISUN.Create(nil);
  fmQueryGISUN.IsCreateForm:=false;
  fmQueryGISUN.AssignPar(slPar);
  try
    fmQueryGISUN.IsReadDokument:=true;
    if nID=-1 then begin
      fmQueryGISUN.NewDok(true);
      fmQueryGISUN.SetIDZags;
    end else begin
      fmQueryGISUN.ReadDok( nID );
      fmQueryGISUN.TBItemZAGS.Visible:=false;
    end;
    fmQueryGISUN.IsReadDokument:=false;
    {$IFDEF GISUN}
      fmQueryGISUN.CheckAkt_GISUN(0);
//      Gisun.CheckChName(fmZapisChName);
//      fmZapisChName.CheckImageGisun(fmZapisChName.DokumentPOLE_GRN,fmZapisChName.ImageGISUN);
      fmQueryGISUN.BeforeEditFormGISUN;
    {$ENDIF}
    result := fmQueryGISUN.EditModal;
  finally
    fmQueryGISUN.Free;
    fmQueryGISUN := nil;
  end;
end;

function TfmQueryGISUN.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_QueryGis); //
end;

function TfmQueryGISUN.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentPOVTOR.AsBoolean:=false;
  DokumentB_OBL.AsBoolean      := true;
  DokumentM_B_OBL.AsBoolean    := true;
  DokumentFirst_Ekz.AsBoolean := true;
  inherited NewDok(lAppend);
  QueryExit:=false;
  Result := true;
  tbFamily.EmptyTable;
  tbReshSud.EmptyTable;
end;
{
procedure TfmZapisChName.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
//--------------------------------------------------------------------
function TfmQueryGISUN.ReadDeti(strDeti:String): Boolean;
begin
  Result:=true;
//
end;
//--------------------------------------------------------------------
function TfmQueryGISUN.ReadDok(nID: Integer): Boolean;
var
  i,j : Integer;
  fld : TField;
  strField: String;
begin
  Result := true;
  if not dmBase.tbQueryGisun.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;

  ds2xml.StringToXML(dmBase.tbQueryGisun.FieldByName('ADD_FIELDS').AsString);
  ds2xml.XMLToData;
  tbReshSud.First;
  tbFamily.First;

  for i:=0 to dmBase.tbQueryGisun.FieldCount-1 do begin
    strField := dmBase.tbQueryGisun.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.tbQueryGisun.Fields[i]);
    end;
  end;
  SetIDZags;

//  ReadDopProperty(_TypeObj_QueryGis, DokumentID.AsInteger, STOD('1899-12-30',tdAds));
  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;

  //---------------------------------------
  if not Role.SystemAdmin
    then tsReshSud.TabVisible:=(tbReshSud.RecordCount>0)

end;
//------------------------------------------------------------------
function TfmQueryGISUN.CheckDokumentSimple(nType: Integer; lWriteDok: Boolean): Boolean;
var
  strErr:String;
  procedure AddErr(s:String); begin  FLastError:=FLastError+s+chr(13)+chr(10); end;
begin
//  Result:=inherited CheckDokumentSimple(nType,lWriteDok);
  Result:=true;
  FLastError:='';
  if DokumentCOVER_MESSAGE_ID.AsString='' then AddErr('Не выполнялся запрос данных из '+_GIS_+'.');
  if FLastError<>''
    then Result:=false;
end;
//------------------------------------------------------------------
function TfmQueryGISUN.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, sAddFields, strErr, s : String;
  procedure AddErr(s:String); begin  strErr:=strErr+s+chr(13)+chr(10); end;
begin
  PostDataSet(Dokument);
  PostDataSet(tbFamily);
  PostDataSet(tbReshSud);
  AdditiveBeforeWriteDok;
  FLastError:='';

  Result := true;
  //--------------- проверка на ошибки ввода -------------
  Result:=CheckDokumentSimple(0, true);
  strErr:=FLastError;
  if strErr<>'' then begin
    PutError(strErr,self);
    Result := false;               
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbQueryGisun.Append;
    dmBase.tbQueryGisun.Post;
    nID := dmBase.tbQueryGisun.FieldByName('ID').AsInteger;
  end else begin
    nID:=DokumentID.AsInteger;
    if not dmBase.tbQueryGisun.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if ds2xml.DataToXML then begin
    sAddFields:=ds2xml.XMLToString;
  end else begin
    Result:=false;
    PutError(ds2xml.LastError,self);
  end;

  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger:=nID;
    Dokument.Post;
    dmBase.tbQueryGisun.Edit;
    for i:=1 to dmBase.tbQueryGisun.FieldCount-1 do begin
      strField := dmBase.tbQueryGisun.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.tbQueryGisun.Fields[i].Value := fld.Value;
      end;
    end;
    dmBase.tbQueryGisun.FieldByName('ADD_FIELDS').AsString:=sAddFields;
//    WriteDopProperty(_TypeObj_QueryGis, DokumentID.AsInteger,STOD('1899-12-30',tdAds));
    WriteDateIzm;
    WriteForAllDok_BeforePost;
    dmBase.tbQueryGisun.Post;
    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}
  end;

  AdditiveWriteDok;

  QueryExit:=false;
  Result := true;
  if Result then FlushBuffers;
end;
//-----------------------------------------------------
function TfmQueryGISUN.EmptyIzm: String;
begin
  Result:=''; //SprChName_EmptyIzm;  // uProject
end;

procedure TfmQueryGISUN.FormResize(Sender: TObject);
begin
//  gbDeti.Width := Self.ClientWidth-8;
end;

//------------------------------------------------------------------------------------------
function TfmQueryGISUN.CreateSubMenuRun: Boolean;
begin
  inherited CreateSubmenuRun;
  Result:=true;
  AddSubmenu_CheckFIO;
  AddSubmenu_ReadDolg;
end;

constructor TfmQueryGISUN.Create(Owner: TComponent);
var
  n:Integer;
  d2xml:TDataSet2XML;
begin
  inherited;
  FCheckLookupField:=false;   // так как все поля (область,район,город) переделаны на DbEditEh.MRUList;
  FDokRegister:=true;
//  Dokument.Active:=true;
  if not Dokument.Active  then Dokument.Active:=true;
  if not tbFamily.Active  then tbFamily.Active:=true;
  if not tbReshSud.Active then tbReshSud.Active:=true;
  FDokZAGS := false;
  TypeObj := _TypeObj_QueryGIS;
  FUpdatingObj:=GetUpdatingObj(TypeObj);
  FCheckKeyGrid:=false;

  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';

//  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
//  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);

//  AddButton_LoadIdentif(ENG_edIDENTIF);

  d2xml:=ds2xml.DS_Add(Dokument,true);
  d2xml.FClearRecord:=false;
  d2xml.FWriteNull:=false;
  d2xml.SetWriteFields('ID');
  ds2xml.DS_Add(tbReshSud,false);
  ds2xml.DS_Add(tbFamily,false);

  FAutoNum:=false;
  FMainTable:=dmBase.tbQueryGisun;
  dsGragd.DataSet := dmBase.SprGragd;
  FPageControl := pc;
  pc.ActivePageIndex:=0;
//  fmMain.SetCurrentDokument(Dokument);
  dmBase.SetDateFormat(tbFamily);

  TBItemArxSpr.Visible:=false;
//  SetControlFIOUpdate([edFamilia, edName, edOtch, BLR_edFamilia, BLR_edName, BLR_edOtch],false);
//  SetControlCityUpdate([edOBL, edRAION, edGOROD, edM_OBL, edM_RAION, edM_GOROD, BLR_edOBL,  BLR_edRAION, BLR_edGorod ]);
  ENG_edIdentif.OnUpdateData:=IN_UpdateData;

  n:=2;

  CreatefrxDBdataSet(self,tbFamily,'Family','Семья');
  CreatefrxDBdataSet(self,tbReshSud,'ReshSud','РешенияСуда');

  {$IFDEF GISUN}
    FImageGisun:=nil; //ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
//    ImageGISUN.Visible := IsActiveGISUN;
    {
    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN;
    }
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
  TBItemHistCorr.Visible:=FUpdatingObj;
  if not Role.SystemAdmin
    then tsReshSud.TabVisible:=false
end;

destructor TfmQueryGISUN.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmQueryGISUN.OnDestroyHint(Sender : TObject);
begin
  DestroyHint(H);
end;

procedure TfmQueryGISUN.UpdateActions;
begin
  inherited;
end;

procedure TfmQueryGISUN.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol : TPol;
begin
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    FRun := true;
    try
      if FCheckBelName then begin
        strField := UpperCase(Field.FieldName);
        EditDataSet(Dokument);
        Pol := tpNone;
        if not Field.IsNull then begin
          if strField='NAME' then begin
//            DokumentName_B.AsString := dmBase.CheckNameBel(Pol, Field.AsString);
          end else if strField='OTCH' then begin
//            DokumentOtch_B.AsString := dmBase.CheckOtchBel(Pol, Field.AsString);
          end else if strField='FAMILIA' then begin
//              DokumentFamilia_B.AsString := dmBase.GetBelFamily( Field.AsString );
          end;
        end;
      end;
    finally
      FRun := false;
    end;
  end;
  inherited;
end;

procedure TfmQueryGISUN.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
end;

procedure TfmQueryGISUN.AdditiveReadDok;
begin
  inherited;
end;

procedure TfmQueryGISUN.edOBL_RNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmQueryGISUN.edRaion_RNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmQueryGISUN.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetChName(Self);
//  Gisun.CheckChName(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmQueryGISUN.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterChName(Self);
//  Gisun.CheckChName(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmQueryGISUN.edDATERUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 13);
end;
//--------------------------------------------------------------------
procedure TfmQueryGISUN.TBItemDeclChNameClick(Sender: TObject);
begin
end;
//--------------------------------------------------------------------
function TfmQueryGISUN.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result:= inherited BeforeEdit;

// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edGOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edM_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edM_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edM_RAION,n,2,true,false,false,FAddButtonMRUList);

end;

procedure TfmQueryGISUN.Button1Click(Sender: TObject);
begin
  SaveDokumentToFile;
end;

procedure TfmQueryGISUN.btDelChildClick(Sender: TObject);
begin
end;

//------------------------------------------------------------------------
procedure TfmQueryGISUN.CheckControlSvid;
begin
end;
//--------------------------------------------------------------------------------------
procedure TfmQueryGISUN.GridDetiTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
end;
//------------------------------------------------------------
procedure TfmQueryGISUN.edSpecEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;
//------------------------------------------------------------
function TfmQueryGISUN.CheckFIO: String;
begin
end;

procedure TfmQueryGISUN.SetOnlyPovtorSvid(lOnlyPovtor: Boolean;  pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;  lbSvid, lbNomer: TLabel);
begin
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
end;

procedure TfmQueryGISUN.GridDetiColumns5EditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceShablonZAGS(TDBGridEh(ActiveControl).DataSource.DataSet,TDBGridEh(ActiveControl).SelectedField.FieldName,'И', '');
end;

procedure TfmQueryGISUN.GridDetiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
{
 if (Shift=[]) and (Key=VK_F10) and (TDBGridEh(ActiveControl).SelectedField.FieldName='ZAGS_NAME') then begin
   ChoiceShablonZAGS(TDBGridEh(ActiveControl).DataSource.DataSet,TDBGridEh(ActiveControl).SelectedField.FieldName,'И', '');
   Key:=0;
 end;
}
end;


function TfmQueryGISUN.CheckDateEditGIS: Boolean;
begin
  Result:=false;
end;
//-----------------------------------------------------------
procedure TfmQueryGISUN.WriteAfterRegister_GISUN;
begin
end;
//-----------------------------------------------------------
procedure TfmQueryGISUN.CheckFilterDeti;
var
  sFilter:String;
begin
  if N_F_OnlyActive.Checked
    then sFilter:='status=''1'' '
    else sFilter:='';
  if N_F_Do18.Checked then begin
    if sFilter=''
      then sFilter:='vozr<18'
      else sFilter:=sFilter+' and vozr<18';
  end;
  tbFamily.Filter:=sFilter;
  tbFamily.Filtered:=(tbFamily.Filter<>'');
end;
//-----------------------------------------------------------
procedure TfmQueryGISUN.dsDetiDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) and not IsReadDokument then begin
    QueryExit:=true;
  end;
end;
//--------------------------------------------------------------------
procedure TfmQueryGISUN.QueryAddObrab(data: TPersonalData_; dsOutPut:TDataSet; dsDokument:TDataSet; slPar:TStringList);
var
  setResh:TListReshSud;
  dsResh:TDataSet;
  sPar:String;
  fld,fld2:TField;
  sem:Integer;
//  ed:TDbComboboxEh;
//  edText:TDbEditEh;
  ms:TMartialStatus;
begin
//  dsResh:=TDataSet(ObjectFromParams(slPar,'RESH_SUD'));
  setResh:=Gisun.RegInt.GetCoursList(data, dsOutPut, tbReshSud, '', slPar);
  if Gisun.LoadSemStatus then begin  // загружать семейный статус
//    s:=dsOutPut.FieldByName('PREFIX').AsString; // ON ONA
    fld:=dsDokument.FindField('SEM_DOK');
    fld2:=dsDokument.FindField('SEM');
    if (fld<>nil) and (fld2<>nil) then begin
//      ed:=edSEM;
//      edText:=edSEM_DOK;
      sPar:='<FIO>'; //<FIO><NAME>';
      ms:=Gisun.RegInt.GetMartialStatus(data, sPar);
      mDebug.Text:=mDebug.Text+'Status='+IntToStr(ms.Status)+': '+ms.Text+#13#10+
                               'NameStatus='+ms.NameStatus+'  Doc='+ms.Doc+#13#10;
      if ms.Status>0 then begin
        sem:=Gisun.RegInt.MartialStatus2Sem(ms.Status);
        EditDataSet(dsDokument);
        fld.Tag:=ms.Status;
//      if ms.Status=10
//        then fld.AsString:='СОСТОИТ В БРАКЕ! '+ms.Text
        fld.AsString:=Concat2Str(ms.NameStatus, ms.Text, ', ');
        fld2.AsInteger:=sem;
      end else begin
      end;
    end;
  end;
end;
//-----------------------------------------------------------------
procedure TfmQueryGISUN.TBItemGetDataGISUNClick(Sender: TObject);
var
//arr:TCurrentRecord;
//  sl:TStringList;
  i:Integer;
  cur:TCursor;
  sl,slPar:TStringList;
  ds:TDataSet;
begin
{$IFDEF GISUN}
  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  Gisun.CurAkt:=Self;    // !!! важно
  FamilyGets:=[getChild];
  try
    if GetInfoGISUN1(Self, '', '') then begin
      EditDataSet(Dokument);
      for i:=0 to Dokument.FieldCount-1 do begin
        if (Dokument.Fields[i].FieldName<>'IDENTIF') and (Dokument.Fields[i].FieldName<>'ID')
          then Dokument.Fields[i].AsVariant:=null;
      end;
      Dokument.CheckBrowseMode;
      tbReshSud.EmptyTable;
      tbFamily.EmptyTable;
//      mDebug.Text:='';
      sl:=TStringList.Create;
      if ENG_edIDENTIF.Text<>'' then begin
        sl.Add('ON='+ENG_edIDENTIF.Text);
      end;
      Gisun.RegInt.FObrPersonalData:=QueryAddObrab;  // дополнительная обработка при запросе данных для каждого лица
      slPar:=TStringList.Create;
      slPar.AddObject('RESH_SUD', tbReshSud);
      PrepareFamilyGets(slPar);
      try
        ds:=Gisun.LoadIdentifData(sl,Dokument,slPar);
      finally
        slPar.Free;
        Gisun.RegInt.FObrPersonalData:=nil
      end;

      if ds<>nil then begin
        ds.First;
//        Gisun.LoadPersonalData(edON_IDENTIF.Text, arr);
        FRun:=true;
        EditDataSet(Dokument);
        try
        while not ds.Eof do begin
          if (ds.FieldByName('PREFIX').AsString='ON') then begin
//          if (ds.FieldByName('IDENTIF').AsString=ENG_edON_IDENTIF.Text) then begin
            DokumentUSER_GIS.AsString:=Gisun.RegInt.Username;
            DokumentCOVER_MESSAGE_ID.AsString:=Gisun.RegInt.CoverMessageId;
            DokumentCOVER_MESSAGE_TIME.AsDateTime:=Gisun.RegInt.CoverMessageTime;
            DokumentSTATUS.AsString:=ds.FieldByName('STATUS').AsString;
            DokumentPOL.AsString:=ds.FieldByName('POL').AsString;
            WriteField(DokumentDATER,ds.FieldByName('DATER'));
            WriteField(DokumentDATES,ds.FieldByName('DATES'));

            DokumentFamilia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
            DokumentNAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
            DokumentOTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
            DokumentFamilia_B.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA_B').AsString);
            DokumentNAME_B.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME_B').AsString);
            DokumentOTCH_B.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH_B').AsString);
            DokumentGRAG.AsString:=ds.FieldByName('GRAG').AsString;

            DokumentDOK_TYPE.AsString:=ds.FieldByName('DOK_TYPE').AsString;
            WriteField(DokumentDOK_DATE,ds.FieldByName('DOK_DATE'));
            DokumentDOK_SERIA.AsString:=ds.FieldByName('DOK_SERIA').AsString;
            DokumentDOK_NOMER.AsString:=ds.FieldByName('DOK_NOMER').AsString;
            DokumentDOKUMENT.AsString:=ds.FieldByName('DOKUMENT').AsString;

            DokumentGOSUD.AsString:=ds.FieldByName('GOSUD_R').AsString;
            DokumentOBL.AsString:=ds.FieldByName('OBL_R').AsString;
            DokumentB_OBL.AsString:=ds.FieldByName('B_OBL_R').AsString; // !!!

            DokumentOBL_B.AsString:=ds.FieldByName('OBL_B_R').AsString;
            DokumentRAION.AsString:=ds.FieldByName('RAION_R').AsString;
            DokumentRAION_B.AsString:=ds.FieldByName('RAION_B_R').AsString;
            DokumentB_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_R').AsString;
            DokumentGOROD.AsString:=ds.FieldByName('GOROD_R').AsString;
            DokumentGOROD_B.AsString:=ds.FieldByName('GOROD_B_R').AsString;


            DokumentM_GOSUD.AsString:=ds.FieldByName('GOSUD_G').AsString;
            DokumentM_OBL.AsString:=ds.FieldByName('OBL_G').AsString;
//              DokumentON_M_B_OBL.AsString:=''; // !!!
            DokumentM_RAION.AsString:=ds.FieldByName('RAION_G').AsString;
            DokumentM_B_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_G').AsString;
            DokumentM_GOROD.AsString:=ds.FieldByName('GOROD_G').AsString;
            DokumentM_RNGOROD.AsString:=ds.FieldByName('RNGOROD_G').AsString;
            DokumentM_GOROD_R.AsString:=ds.FieldByName('ULICA_G').AsString;
            DokumentM_DOM.AsString:=ds.FieldByName('DOM_G').AsString;
            DokumentM_KORP.AsString:=ds.FieldByName('KORP_G').AsString;
            DokumentM_KV.AsString:=ds.FieldByName('KV_G').AsString;

            try
              WriteDateField(DokumentREG_DATE, ds.FieldByName('REG_DATE'));
              WriteDateField(DokumentREG_DATE_TILL, ds.FieldByName('REG_DATE_TILL'));
            except
            end;
          end else if (Copy(ds.FieldByName('PREFIX').AsString,1,8)='ON_CHILD') then begin  // дети
            tbFamily.Append;
            tbFamilyIDENTIF.AsString:=ds.FieldByName('IDENTIF').AsString;
            tbFamilyFamilia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
            tbFamilyNAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
            tbFamilyOTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
            tbFamilyPOL.AsString:=ds.FieldByName('POL').AsString;
            tbFamilyMESTOR.AsString:=ds.FieldByName('ADRES_R').AsString;
            tbFamilySTATUS.AsString:=ds.FieldByName('STATUS').AsString;
            tbFamilySTATUS_NAME.AsString:=Gisun.Status2Str(ds.FieldByName('STATUS').AsString,'');
            WriteDateField(tbFamilyDATER, ds.FieldByName('DATER'));
            WriteDateField(tbFamilyDATES, ds.FieldByName('DATES'));

            if (tbFamilyDATER.AsDateTime>0) and (tbFamilySTATUS.AsString='1')
              then tbFamilyVOZR.AsInteger:=GetCountYear( Now, tbFamilyDateR.AsDateTime);
            tbFamily.Post;
          end;
          ds.Next;
        end;

        PostDataSet(Dokument);
        finally
          FRun:=false;
        end;
        ds.Free;
      end;
      sl.Free;
      if not Role.SystemAdmin
        then tsReshSud.TabVisible:=(tbReshSud.RecordCount>0);
      tbReshSud.First;
      CheckFilterDeti;
      tbFamily.First;

      edDateS.Visible:=not DokumentDATES.IsNull;
      lbDateS.Visible:=not DokumentDATES.IsNull;

    end;
  finally
    Gisun.CurAkt:=nil;
    Screen.Cursor:=cur;
  end;
{$ENDIF}
//
end;

function TfmQueryGISUN.CheckAddPanel(var Text: String): Boolean;
begin
  Result:=true;
end;

procedure TfmQueryGISUN.lbAnnulirGetText(Sender: TObject;  var Text: String);
begin
  Text:='';
end;

procedure TfmQueryGISUN.GridDetiGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (tbFamilySTATUS.AsString<>'1')
    then AFont.Color:=clRed;
end;

procedure TfmQueryGISUN.N_F_lbStatusGetText(Sender: TObject; var Text: String);
begin
  Text:=GetStatus(DokumentSTATUS);
end;

procedure TfmQueryGISUN.N_F_Do18Click(Sender: TObject);
begin
  if N_F_Do18.Checked and not N_F_OnlyActive.Checked
    then N_F_OnlyActive.Checked:=true;
  CheckFilterDeti;
end;

procedure TfmQueryGISUN.N_F_OnlyActiveClick(Sender: TObject);
begin
  CheckFilterDeti;
end;

function TfmQueryGISUN.SetNewNomerDok(lSetDate: Boolean): Integer;
begin
  Result:=0;
end;


end.
