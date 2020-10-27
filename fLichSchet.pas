unit fLichSchet;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimple, Db, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, ExtCtrls, DBCtrlsEh, uProjectAll,
  DBLookupEh, StdCtrls, Mask, dLichSchet, dMen, Grids, DBGridEh, FuncEh, SasaDBGrid, fAddSobstv, fmChList,
  fChoiceAdres, fChoiceAdresS, vchDBCtrls, MetaTask, kbmMemTable, Buttons, FuncPr, DbFunc, uTypes,
  TB2ToolWindow, OpisEdit, SasaIniFile, SasaUtils,fChoiceNasel, ImgList
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type

  TSearchNalog = record
//    God   : String;
//    Date  : TDateTime;
    Nalog : Integer;
    Summa : Extended;
  end;
  TArrSearchNalog = array of TSearchNalog;

  TfmLichSchet = class(TfmSimple)
    pnShap: TPanel;
    pc: TPageControl;
    tsSostav: TTabSheet;
    tsAnimal: TTabSheet;
    tsLand: TTabSheet;
    tsHouse: TTabSheet;
    tsAdd: TTabSheet;
    Label1: TLabel;
    edLichSchet: TDBEditEh;
    Label4: TLabel;
    dsMens: TDataSource;
    sbAnimal: TScrollBox;
    sbZeml: TScrollBox;
    sbDom: TScrollBox;
    sbDop: TScrollBox;
    pnNomer: TPanel;
    lbKadastr: TLabel;
    lbNomKn: TLabel;
    lbNomStr: TLabel;
    edNomKn: TDBEditEh;
    edNomStr: TDBEditEh;
    edKadastr: TDBEditEh;
    TextAdres: TvchDBText;
    dsDopProp: TDataSource;
    pnDopInfo: TPanel;
    btAdres: TBitBtn;
    lbSobst: TLabel;
    N_F_cbOwnHouse: TDBCheckBoxEh;
    dsPriznak: TDataSource;
    edTypeHouse: TDBLookupComboboxEh;
    dsSprTypeHouse: TDataSource;
    gbSozd: TGroupBox;
    cbLikv: TGroupBox;
    edDateSozd: TDBDateTimeEditEh;
    edPrSozd: TDBLookupComboboxEh;
    edTowNomerS: TDBEditEh;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dsSprPrSozd: TDataSource;
    Label15: TLabel;
    edDateLikv: TDBDateTimeEditEh;
    Label16: TLabel;
    edPrLikv: TDBLookupComboboxEh;
    Label17: TLabel;
    edTwoNomerL: TDBEditEh;
    dsSprPrLikv: TDataSource;
    tsNalogi: TTabSheet;
    GridNalogi: TSasaDBGrid;
    dsNalogi: TDataSource;
    dsDokuments: TDataSource;
    tsDokumets: TTabSheet;
    GridDok: TSasaDBGrid;
    Panel2: TPanel;
    btAddDok: TBitBtn;
    btDelDok: TBitBtn;
    btEditDok: TBitBtn;
    TBItem1: TTBItem;
    TBSubmenuSort: TTBSubmenuItem;
    TBItemSort_Nomer: TTBItem;
    TBItemSort_FIO: TTBItem;
    TBItemSort_DateP: TTBItem;
    lbClose: TvchDBText;
    dsPredst: TDataSource;
    gbSobstv: TGroupBox;
    GridSobstv: TSasaDBGrid;
    Panel3: TPanel;
    btAddSobstv: TBitBtn;
    btDelSobstv: TBitBtn;
    btEditSobstv: TBitBtn;
    ImageList: TImageList;
    dsHouseOwners: TDataSource;
    btIsvechNal: TBitBtn;
    gbDop: TGroupBox;
    edDop: TDBEditEh;
    Split2: TSplitter;
    gbPriznak: TGroupBox;
    gbSostav: TGroupBox;
    GridMens: TSasaDBGrid;
    pnWorkMens: TPanel;
    btDelMen: TBitBtn;
    btAddMen: TBitBtn;
    btEditMen: TBitBtn;
    btChoiceMen: TBitBtn;
    btPerevodMen: TBitBtn;
    btUp: TBitBtn;
    btDown: TBitBtn;
    btIsklMen: TBitBtn;
    Split1: TSplitter;
    pnOsnov: TPanel;
    pnRekv: TPanel;
    Label3: TLabel;
    edTelefon: TDBEditEh;
    Label6: TLabel;
    edOSNOV_ID: TDBComboBoxEh;
    Label18: TLabel;
    edDate_Osnov: TDBDateTimeEditEh;
    edDogovor: TDBEditEh;
    TBSubmenuProp: TTBSubmenuItem;
    edFirst: TDBEditEh;
    Label48: TLabel;
    edNomer_Osnov: TDBEditEh;
    edNotStat: TDBCheckBoxEh;
    ImageNotStat: TImage;
    Label7: TLabel;
    edAbonentGAZ: TDBEditEh;
    Panel1: TPanel;
    btAddNalog: TBitBtn;
    btDeleteNalog: TBitBtn;
    btEditNalog: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edPredst: TDBLookupComboboxEh;
    edEtag: TDBNumberEditEh;
    edKol_Etag: TDBNumberEditEh;
    N_F_cbPrivateSect: TDBCheckBoxEh;
    edControlHouse: TDBComboBoxEh;
    edUseGilfond: TDBComboBoxEh;
    edPloshZanim: TDBNumberEditEh;
    edKomnZanim: TDBNumberEditEh;
    edTailHouse: TDBEditEh;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText9: TStaticText;
    N_F_cbMNS_LPX: TDBCheckBoxEh;
    edPloshUch: TDBNumberEditEh;
    StaticText1: TStaticText;
    lbDateSost: TvchDBText;
    btReadAll: TBitBtn;
    TBItemPropAutoSum: TTBItem;
    btSetAutoSum: TBitBtn;
    Label10: TLabel;
    edUchNomer: TDBEditEh;
    procedure TextAdresGetText(Sender: TObject; var Text: String);
    procedure btAddMenClick(Sender: TObject);
    procedure btEditMenClick(Sender: TObject);
    procedure btDelMenClick(Sender: TObject);

    procedure ChoiceAdresAddWrite(nID:Integer);
    procedure btAdresClick(Sender: TObject);
    procedure btAdresSimpleClick(Sender: TObject);
    procedure btAdresVvodClick(Sender: TObject);

    procedure FormHide(Sender: TObject);
    procedure btReadAllClick(Sender: TObject);
    procedure GridMensColumns1GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridMensColumns6GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure GridMensGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure sbDopResize(Sender: TObject);
    procedure N_F_cbOwnHouseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btChoiceMenClick(Sender: TObject);
    procedure btUpClick(Sender: TObject);
    procedure btDownClick(Sender: TObject);
    procedure dsMensDataChange(Sender: TObject; Field: TField);
    procedure dsNalogiDataChange(Sender: TObject; Field: TField);
    procedure btAddDokClick(Sender: TObject);
    procedure btDelDokClick(Sender: TObject);
    procedure btEditDokClick(Sender: TObject);
    procedure edTypeHouseEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure dsDopPropDataChange(Sender: TObject; Field: TField);
    procedure TBItemSort_DatePClick(Sender: TObject);
    procedure TBItemSort_NomerClick(Sender: TObject);
    procedure TBItemSort_FIOClick(Sender: TObject);
    procedure lbCloseGetText(Sender: TObject; var Text: String);
    procedure GridSobstvColumns0GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
//    procedure GridSobstvColumns1GetCellParams(Sender: TObject;
//      EditMode: Boolean; Params: TColCellParamsEh);
    procedure btIsklMenClick(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure btIsvechNalClick(Sender: TObject);
    procedure GridDokDblClick(Sender: TObject);
    procedure edLichSchetEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edLichSchetEditButtons1Click(Sender: TObject;      var Handled: Boolean);
    procedure btAddSobstvClick(Sender: TObject);
    procedure btEditSobstvClick(Sender: TObject);
    procedure btDelSobstvClick(Sender: TObject);
    procedure GridSobstvGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure edControlHouseUpdateData(Sender: TObject;          var Handled: Boolean);
    procedure edControlHouseEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edControlHouseEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure edDogovorEditButtons0Click(Sender: TObject;        var Handled: Boolean);
    procedure edFEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edFirstEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure edNotStatClick(Sender: TObject);
    procedure edUseGilfondEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure btAddNalogClick(Sender: TObject);
    procedure btDeleteNalogClick(Sender: TObject);
    procedure sbDomResize(Sender: TObject);
    procedure sbAnimalResize(Sender: TObject);
    procedure sbZemlResize(Sender: TObject);
    procedure lbDateSostGetText(Sender: TObject; var Text: String);
    procedure TBItemPropAutoSumClick(Sender: TObject);
    procedure btSetAutoSumClick(Sender: TObject);
    procedure btEditNalogClick(Sender: TObject);
    procedure GridNalogiDblClick(Sender: TObject);
    procedure GridNalogiColumns9GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridNalogiGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
    FSetFormMens : Boolean;
    dLich : TdmLichSchet;
    procedure SetParamForMens;
    procedure CreateKeyList;
  public
    { Public declarations }
//    fmChoiceAdres : TfmChoiceAdres;

    function CurMenIsFirst:Boolean;
    procedure SetAutoSum;

    function EditForm(slPar:TStringList; strGurnal:String) : Boolean; override;
    function GetDataSetMens : TDataSet;
    function IsEnabledFirst : Boolean;
    function CheckFirst( var strErr : String ) : Boolean;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    function CreateRunTimeProperty : Boolean; override;
    function GetDsDopProp : TDataSource; override;
    procedure EditMen;
    procedure UpdateActions; override;
    procedure UserAfterSkip; override;
    function BeforeReport : Boolean; override;
    procedure AfterReport; override;
    function SaveToIni : Boolean; override;
    procedure LoadFromIni; override;
    procedure WriteNalogFromIzvech(strGod : String; dDateDok : TDateTime; dDateSrok : TDateTime; arr : TArrSearchNalog);
  end;

const
  sVsego='VSEGO';   // поле всего земли


implementation

uses fMain, dBase, fMen, fIzvechNal, uObjectsScript, uProject, fLichSchetDok, fShablon, fAddAdres, fSimpleDialog, fRecordGrid,
    dDokument;

{$R *.DFM}

{ TfmLichSchet }

constructor TfmLichSchet.Create(Owner: TComponent);
begin
  inherited;
  // не установлены параметры для формы fmMen, dmMen
  FSetFormMens   := false;
  ActionForClose := caHide;
  TBSubmenuTmp.Visible:=true;
  TBSubmenuProp.Visible:=false;
//  fmChoiceAdres  := nil;
  pnNomer.Visible:=GlobalTask.ParamAsBoolean('LIC_PN_NOMER');
  pnOsnov.Visible:=GlobalTask.ParamAsBoolean('LIC_PN_OSNOV');
  FCheckAutoSum:=true;
end;

procedure TfmLichSchet.FormHide(Sender: TObject);
begin
  // не установлены параметры для формы fmMen, dmMen
  FSetFormMens   := false;
end;

destructor TfmLichSchet.Destroy;
begin
  inherited;
end;

function TfmLichSchet.CreateRunTimeProperty: Boolean;
var
  i,nFontSize,n,m : Integer;
  s:String;
  lOk:Boolean;
  ed,edVsego:TCustomDBEditEh;
  edD:TDbDateTimeEditEh;
begin
  Result := true;

 // if Globaltask.ParamAsInteger('VER_UCHET')<>1 then begin // версия от 4 июля 2011 года
    Globaltask.WriteParamAsString('CALC_UROG','0');
    Globaltask.WriteParamAsString('CALC_ZAGOT','0');
    ListDopRazdel.AddObject('11', sbAnimal);
//    ListDopRazdel.AddObject('11', tsAnimal);
    tsSostav.Caption:='Состав (Раздел I)';
    tsHouse.Caption:='Дом (Раздел II)';
    tsAnimal.Caption:='Показатели (Раздел III)';
    tsLand.TabVisible:=false;
    Dokument.tbDopProp.Close;
    Dokument.tbDopProp.FieldDefs.Clear;
    dsDopProp.DataSet  := Dokument.tbDopProp;
    FCheckAutoSum:=true;

    nFontSize:=10;   // GlobalFontSizeE !!!
// !!!   pc.Font.Size:=10;
    sbAnimal.Font.Size:=nFontSize;
    sbZeml.Font.Size:=nFontSize;
    sbDom.Font.Size:=nFontSize;

    for i:=0 to ListDopRazdel.Count-1 do begin
      CreateDopControls(dmBase.TypeObj_Lich, TWinControl(ListDopRazdel.Objects[i]),  ListDopRazdel.Strings[i],0); //Label3.Color);
    end;
    FCheckAutoSum:=false;
    {
  end else begin
    ListDopRazdel.AddObject('1', sbAnimal);
    ListDopRazdel.AddObject('2', sbZeml);
  //  ListDopRazdel.AddObject('3', sbDom);
    Dokument.tbDopProp.Close;
    Dokument.tbDopProp.FieldDefs.Clear;
    dsDopProp.DataSet  := Dokument.tbDopProp;
    for i:=0 to ListDopRazdel.Count-1 do begin
      CreateDopControls(dmBase.TypeObj_Lich, TWinControl(ListDopRazdel.Objects[i]),
              ListDopRazdel.Strings[i],0); //Label3.Color);
    end;
  end;
   }
  // прочитаем структуру первого раздела для типа "дом"
  CreateDopControls(dmBase.TypeObj_Adres, sbDom, '1',0);

  Dokument.tbDopProp.Open;
  Dokument.tbDopProp.Append;
  Dokument.tbDopProp.Post;
  dsDokument.DataSet := Dokument.mtDokument;
  dLich := TdmLichSchet(Dokument);
  dLich.tbPriznaki.Open;
  dLich.tbNalogi.Open;
  dLich.tbDokumens.Open;
  dLich.tbHouseOwners.Open;
  dsPriznak.DataSet := TdmLichSchet(Dokument).tbPriznaki;
  dsNalogi.DataSet  := TdmLichSchet(Dokument).tbNalogi;
  dsDokuments.DataSet  := TdmLichSchet(Dokument).tbDokumens;

  //----- ДАТЫ ДЛЯ ВЕДЕНИЯ ЛПХ ----------------------
  ed:=nil;
  edVsego:=nil;    
  // найдем контрол для ввода значения участка ЛПХ
  for i:=0 to sbAnimal.ControlCount-1 do begin // ComponentCount-1 do begin // Self.ComponentCount-1 do begin
    if sbAnimal.Controls[i] is TCustomDBEditEh then begin
      s:=TCustomDBEditEh(sbAnimal.Controls[i]).DataField;
//    s:=Prop_tkString(self.Components[i], 'DATAFIELD', false, '', lOk);
      if (s<>'') then begin
        if (s='LPX')   then ed:=TCustomDBEditEh(sbAnimal.Controls[i]);
        if (s='VSEGO') then edVsego:=TCustomDBEditEh(sbAnimal.Controls[i]);
//      if (s='V') then ed:=TCustomDBEditEh(self.Components[i]);
      end;
    end;
  end;
  if ed<>nil then begin
    n:=ed.Left+ed.Width+20;
    for i:=1 to 2 do begin
      with TDbDateTimeEditEh.Create(ed.Owner) do begin
        Parent:=ed.Parent;
        Left:=n;
        Width:=115;
        Top:=ed.Top;
        DataSource:=dsDokument;
        DataField:='DATE_LPX'+IntToStr(i);
        Name:='DateLPX'+IntToStr(i);
        if i=1 then begin
          Hint:='дата предоставления участка';
          m:=n+Width+18;
        end else begin
          Hint:='до какого срока предоставлен участок';
        end;
        Font.Height:=edNomStr.Font.Height;
        Flat:=ed.Flat;
        n:=n+Width+50;
      end;
    end;
    with TStaticText.Create(ed.Owner) do begin
      Parent:=ed.Parent;
      Top:=ed.Top+2;
      Left:=m;
      Caption:='до';
    end;
  end;
  if edVsego<>nil then begin
    with TBitBtn.Create(sbAnimal) do begin
      Parent:=sbAnimal;
      Left:=edVsego.Left+edVsego.Width+20;
      Top:=edVsego.Top;
      Width:=22;
      Height:=20;
      Glyph.Assign(btSetAutoSum.Glyph);
      OnClick:=btSetAutoSum.OnClick;
      Hint:=btSetAutoSum.HInt;
    end;
  end;
  //----------------------------------------------------

  dmBase.SetDateFormat(dsNalogi.DataSet);
  dmBase.SetDateFormat(dsDokuments.DataSet);

  CreateEditPriznak(gbPriznak, dsPriznak, 'LOOKUP_PR_LICH','NAME');

  GlobalTask.CurrentOpisEdit.SetKeyForm(Self,nil);

end;

procedure TfmLichSchet.TextAdresGetText(Sender: TObject; var Text: String);
begin
  if dsDokument.DataSet.FieldByName('ADRES_ID').AsString<>'' then begin
    Text:=dLich.mtDokumentADRES_TEXT.AsString;
//было до 27.07.2020    Text := dmBase.AdresFromID( Dokument.DateFiks, dsDokument.DataSet.FieldByName('ADRES_ID').AsString );
  end;
end;

function TfmLichSchet.GetDsDopProp: TDataSource;
begin
  Result := dsDopProp;
end;
//--------------------------------------------------------------------
procedure TfmLichSchet.CreateKeyList;
var
  Col:TColumnEh;
//  Opis:TOpisEdit;
begin
  if GridDok<>nil then begin
    Col:=GridDok.FieldColumns['TYPEDOK'];
    GlobalTask.CurrentOpisEdit.GetListOpis('KEY_LIC_TYPEDOK', Col.PickList, Col.KeyList);
  end;
//  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_LIC_TYPEDOK');
//  Col:=GridDok.FieldColumns['TYPEDOK'];
//  for i:=0 to Opis.Items.Count-1 do begin
//    Col.PickList.Add(Opis.Items[i]);
//    Col.KeyList.Add(Opis.KeyList[i]);
//  end;

end;
//--------------------------------------------------------------------
procedure TfmLichSchet.SetParamForMens;
begin
  {$IFNDEF ZAGS}
  if not FSetFormMens then begin
    dsMens.DataSet := TdmLichSchet(Dokument).dmMens.mtDokument;
    TdmLichSchet(Dokument).dmMens.EditFromLichSchet := true;
    TdmLichSchet(Dokument).dmMens.EditFromadres := false;
    fmMain.SetDataSets_fmMen(TdmMen(TdmLichSchet(Dokument).dmMens));
//    fmMain.fmMen.dsDokument.DataSet := TdmLichSchet(Dokument).dmMens.mtDokument;
//    fmMain.fmMen.dsLgot.DataSet  := TdmLichSchet(Dokument).dmMens.tbLgot;
//    fmMain.fmMen.dsPrizn.DataSet := TdmLichSchet(Dokument).dmMens.tbPriznaki;
//    fmMain.fmMen.dsMigr.DataSet  := TdmLichSchet(Dokument).dmMens.tbMigr;
    TdmMen(fmMain.fmMen.Dokument).EditFromLichSchet := true;
    TdmMen(fmMain.fmMen.Dokument).EditFromAdres := false;
    fmMain.fmMen.SetSubSystem(SS_HOZ_UCHET);
    if FEnableWrite then begin
      fmMain.fmMen.TBItemWrite.Caption:='Выход';
      fmMain.fmMen.TBItemWrite.Hint:='Выход';
      fmMain.fmMen.TBItemWrite.Visible:=true;
      fmMain.fmMen.TBItemCancel.Visible:=false;
//      fmMain.fmMen.TBItemReLoad.Visible:=false;
    end else begin
      fmMain.fmMen.TBItemWrite.Visible:=false;
      fmMain.fmMen.TBItemCancel.Visible:=true;
//      fmMain.fmMen.TBItemReLoad.Visible:=false;
    end;
//    fmMain.fmMen.cbVUS.Visible := true;
//    fmMain.fmMen.TBItemPreView.Visible:=false;
//    fmMain.fmMen.TBItemPrint.Visible:=false;
    fmMain.fmMen.SkipDataSet := nil;
    fmMain.fmMen.CheckExit:=false;;
    GlobalTask.CurrentOpisEdit.SetKeyForm(fmMain.fmMen, nil);
//    dsMens.DataSet.Post;
    FSetFormMens := true;
  end;

  {$IFNDEF OCHERED}
  if CurMenIsFirst then begin
//  (edFirst.Value<>null) and
//     not dsMens.DataSet.FieldByName('ID_INTERNAL').IsNull and
//     (dsMens.DataSet.FieldByName('ID_INTERNAL').Value=edFirst.Value) then begin
//    fmMain.fmMen.edOTNOSH.Enabled:=false;
//    fmMain.fmMen.cbKvartirant.Enabled:=false;
  end else begin
//    fmMain.fmMen.edOTNOSH.Enabled:=true;
//    fmMain.fmMen.cbKvartirant.Enabled:=true;
  end;
  fmMain.fmMen.edOTNOSH.Enabled:=true;
  fmMain.fmMen.N_F_cbKvartirant.Enabled:=true;
  {$ENDIF}

  {$ENDIF}
end;

//---------------------------------------------
// текущий человек глава лицевого счета ?
//---------------------------------------------
function TfmLichSchet.CurMenIsFirst:Boolean;
begin
  if (dLich.mtDokumentFIRST.AsInteger>0) and
     not dLich.dmMens.mtDokumentID_INTERNAL.IsNull and
     (dLich.dmMens.mtDokumentID_INTERNAL.AsInteger=dLich.mtDokumentFIRST.AsInteger) then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

procedure TfmLichSchet.EditMen;
var
  strErr : String;
  slPar:TStringList;
begin
  slPar:=TStringList.Create;
  if (TdmLichSchet(Dokument).mtDokumentADRES_ID.AsString<>'') and
     (TdmLichSchet(Dokument).mtDokumentADRES_ID.AsInteger>0) then begin
    slPar.Add('ADRES_ID='+TdmLichSchet(Dokument).mtDokumentADRES_ID.AsString);
  end;
  fmMain.fmMen.ActiveControl := fmMain.fmMen.edFam;
  fmMain.fmMen.EditForm(slPar,FGurnal);
  if not QueryExit then begin
    QueryExit := fmMain.fmMen.QueryExit or fmMain.fmMen.CheckQueryExit;
  end;
  CheckFirst(strErr);
  slPar.Free;
end;

//---------------- добавить нового человека --------------------
procedure TfmLichSchet.btAddMenClick(Sender: TObject);
var
  s:String;
begin
  if (TdmLichSchet(Dokument).mtDokumentADRES_ID.AsString='') or
     (TdmLichSchet(Dokument).mtDokumentADRES_ID.AsInteger<=0) then begin
    PutError('Выберите адрес лицевого счета.');
  end else begin
    s:=dLich.dmMens.mtDokumentFAMILIA.AsString;
    dLich.dmMens.mtDokument.Append;
    dLich.dmMens.mtDokumentFAMILIA.AsString:=s;
    SetParamForMens;
    dLich.dmMens.AfterCreateDokument;
    EditMen;
    dLich.FNewMen:=true;
    if (dLich.dmMens.mtDokumentFAMILIA.AsString='') or (dLich.dmMens.mtDokumentNAME.AsString='') then begin
      dLich.dmMens.mtDokument.Delete;
    end;
  end;
end;

//---------- корректировка текущего человека -----------------
procedure TfmLichSchet.btEditMenClick(Sender: TObject);
begin
  if dsMens.DataSet.RecordCount=0 then exit;
  if (TdmLichSchet(Dokument).mtDokumentADRES_ID.AsString='') or
     (TdmLichSchet(Dokument).mtDokumentADRES_ID.AsInteger<=0) then begin
    PutError('Выберите адрес лицевого счета.');
  end else begin
    SetParamForMens;
    dsMens.DataSet.Edit;
    EditMen;
  end;
end;

//------------ удалить текущего человека --------------------
procedure TfmLichSchet.btDelMenClick(Sender: TObject);
var
  strErr:String;
  strID:String;
  lDel:Boolean;
begin
  if dsMens.DataSet.RecordCount=0 then exit;
  SetParamForMens;
  if Problem('   Удалить человека с лицевого счета ?   ',mtConfirmation,self) then begin
    strID:=dsMens.DataSet.FieldByName('ID').AsString;

    // лицевой счет не новый, и челоек был прочитан из базы
    if strID<>'' then begin
      if dmBase.CheckDeleteMen(fmMain.DateFiks, StrToInt(strID), strErr, dLich.dmMens.GetFIO) then begin
        lDel:=true;
      end else begin
        if Problem(strErr+#13+' Удалить человека ?',mtConfirmation,self)
          then lDel:=true
          else lDel:=false;
      end;
    end else begin
      lDel:=true;
    end;
    if lDel then begin
      TdmLichSchet(Dokument).slDelMens.Add( dsMens.DataSet.FieldByName('ID').AsString );
      QueryExit := true;
      // удалим из текущего списка собственников
      while dLich.tbHouseOwners.Locate('KOD;TYPEKOD', VarArrayOf([StrToInt(strID),OWNER_NASEL]), []) do begin
        dLich.tbHouseOwners.Delete;
      end;
      if CurMenIsFirst then begin
      //(edFirst.Value<>null) and not dsMens.DataSet.FieldByName('ID_INTERNAL').IsNull and
//                                      (dsMens.DataSet.FieldByName('ID_INTERNAL').Value=edFirst.Value) then begin
        EditDataSet(dLich.mtDokument);
        dLich.mtDokumentFIRST.AsString:='';
        dLich.mtDokumentFIRST_FIO.AsString:='';
//        edFirst.Field.AsString := '';
      end;
      dsMens.DataSet.Delete;
    end;
    {
    with dsMens.DataSet do begin
      bm := BookMark;
      IndexFieldNames:='NSTR';
      IndexFieldNames:='NSTR';
    end;
    }
  end;
end;

//------------ исключить текущего человека --------------------
procedure TfmLichSchet.btIsklMenClick(Sender: TObject);
begin
  if dsMens.DataSet.RecordCount=0 then exit;
  {
  sKomu:=dLich.dmMens.mtDokumentOTNOSH.AsString;
  nIDKomu:=dLich.dmMens.mtDokumentID.AsInteger;
  sl:=TStringList.Create;
  s:=dLich.dmMens.mtDokument.Bookmark;
  dLich.dmMens.mtDokument.First;
  while not dLich.dmMens.mtDokument.Eof do begin
    sl.Add('"'+GetOtnosh(nIDKomu, sKomu,dLich.dmMens.mtDokumentID.AsInteger, dLich.dmMens.mtDokumentOTNOSH.AsString ,dLich.dmMens.mtDokumentPOL.AsString)+'"');
    dLich.dmMens.mtDokument.Next;
  end;
  dLich.dmMens.mtDokument.Bookmark:=s;
  ShowStrings(sl,'');
  sl.Free;
  }
  SetParamForMens;
  if Problem('   Исключить человека с лицевого счета ?   ',mtConfirmation,self) then begin
    // лицевой счет не новый, и был прочитан из базы
    if dsMens.DataSet.FieldByName('ID').AsString <> '' then begin
      TdmLichSchet(Dokument).slIsklMens.Add( dsMens.DataSet.FieldByName('ID').AsString );
      QueryExit := true;
    end;
    if CurMenIsFirst then begin
      EditDataSet(dLich.mtDokument);
      dLich.mtDokumentFIRST.AsString:='';
      dLich.mtDokumentFIRST_FIO.AsString:='';
    end;
//    if (edFirst.Value<>null) and
//      not dsMens.DataSet.FieldByName('ID_INTERNAL').IsNull and
//      (dsMens.DataSet.FieldByName('ID_INTERNAL').Value=edFirst.Value) then begin
//      EditDataSet(dsDokument.DataSet);
//      edFirst.Field.AsString := '';
//    end;
    dsMens.DataSet.Delete;
  end;
end;

//--------- перевод человека на другой лицевой счет --------------
procedure TfmLichSchet.btReadAllClick(Sender: TObject);
var
  arrRec : TCurrentRecord;
  old : TCursor;
begin
  if dmBase.GetDateCurrentSost=dLich.DateFiks then begin
    if dLich.mtDokumentADRES_ID.AsInteger>0 then begin //  dLich.mtDokumentID.AsInteger>0 then begin
    // может параметр адрес или лицевой счет
      if Problem('Загрузить всех людей, кто ранее проживал по адресу (из состояний базы) ?',mtConfirmation,self) then begin
        old := Screen.Cursor;
        Screen.Cursor:=crHourGlass;
        dLich.dmMens.ReadHistMens(1, dLich.mtDokumentID.AsInteger, dLich.mtDokumentADRES_ID.AsInteger);
        Screen.Cursor:=old;
        FTmpWrite:=false;
  //      TBItemWrite.Enabled:=false;
      end;
    end;
  end else begin
    ShowMessageCont('Операция доступна только в текущем состоянии', Self);
  end;
{
  if dsMens.DataSet.RecordCount=0 then exit;
  with dLich.dmMens.mtDokument do begin
    strMen := Trim(FieldByName('FAMILIA').AsString)+' '+
              Trim(FieldByName('NAME').AsString)+' '+
              Trim(FieldByName('OTCH').AsString);
  end;
  if dLich.dmMens.mtDokumentNEWDOK.AsBoolean=true then begin
    PutError(' Вновь добавленного человека нельзя перевести на другой личевой счет ! ');
  end else begin
    strIdMen := dLich.dmMens.mtDokumentID.AsString;
    if Problem('Вы хотите перевести <' +strMen + '> на другой лицевой счет ? ',mtConfirmation,self) then begin
      old := Screen.Cursor;
//      Screen.Cursor := crHourGlass;
      try
        Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_LIC');
      finally
//        Screen.Cursor := old;
      end;
      if Opis<>nil then begin
        SetLength(arrRec,1);
        v := null;
        if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
          old := Screen.Cursor;
          Screen.Cursor := crHourGlass;
          //EditDataSet(Dokument);
          v := GetValueField(arrRec, 'ID');

          SetParamForMens;
          TdmLichSchet(Dokument).slPerevodMens.Add( strIdMen+'='+VarToStr(v) );
          QueryExit := true;
          if CurMenIsFirst then begin
            EditDataSet(dLich.mtDokument);
            dLich.mtDokumentFIRST.AsString:='';
            dLich.mtDokumentFIRST_FIO.AsString:='';
          end;
//          if (edFirst.Value<>null) and not dsMens.DataSet.FieldByName('ID_INTERNAL').IsNull and
//               (dsMens.DataSet.FieldByName('ID_INTERNAL').Value=edFirst.Value) then begin
//            EditDataSet(dsDokument.DataSet);
//            edFirst.Field.AsString := '';
//          end;
          dsMens.DataSet.Delete;
          Screen.Cursor := old;
        end;
      end;
    end;
  end;
}
end;

//--------- выбрать человека из другого лицевого счета) -----
procedure TfmLichSchet.btChoiceMenClick(Sender: TObject);
var
//  v : Variant;
  arrRec : TCurrentRecord;
  nID,n,m:Integer;
  lFirst,lCopyMen:Boolean;
  slPar:TStringList;
  par:TParamsChoiceMen;
  dDateS:TDateTime;
//  nAdres:Integer;
begin
  if (TdmLichSchet(Dokument).mtDokumentADRES_ID.AsString='') or
     (TdmLichSchet(Dokument).mtDokumentADRES_ID.AsInteger<=0) then begin
    PutError('Выберите адрес лицевого счета.');
  end else begin
    par:=TParamsChoiceMen.Create;
    par.lEnabledCopyMen:=true;
    if ChoiceMenEx( edLichSchet, '', 'empty(dates)', arrRec, par) then begin
      nID := GetValueField(arrRec, 'ID');
      dDateS:=GetValueFieldEx(arrRec, 'DATES', 0);
  //    lPropis := GetValueFieldEx(arrRec,'PROPIS',true);
  //    lPresent:= GetValueFieldEx(arrRec,'PRESENT',true);
  //    nAdres  := GetValueFieldEx(arrRec,'ADRES_ID',0);
      if dLich.dmMens.mtDokument.Locate('ID',nID,[]) then begin
        Beep;
        PutError(dLich.dmMens.GetFIO+' уже присутствует в лицевом счете. ');
      end else begin
        lCopyMen:=false;
        dLich.dmMens.ClearMaster;
        m:=dLich.dmMens.LicID;
        if GetValueFieldEx(arrRec, '_LOADMIGR', false)=false then begin
          slPar:=TStringList.Create;
          slPar.Add('MIGR=0');
        end else begin
          slPar:=nil;
        end;
        dLich.dmMens.ReadOneMen(nID,false,slPar);
        slPar.Free;

        dLich.dmMens.LicID:=m;
        n := dLich.dmMens.mtDokument.RecordCount;
        dLich.dmMens.mtDokument.Locate('ID',nID,[]);
        dLich.dmMens.mtDokument.Edit;
        dLich.dmMens.mtDokumentNSTR.AsInteger := n;
        dLich.dmMens.mtDokumentFIRST.AsBoolean:= false;
        dLich.dmMens.mtDokumentLIC_ID.AsInteger:=m;
        dLich.dmMens.mtDokumentADRES_ID.AsInteger:=dLich.mtDokumentADRES_ID.AsInteger;
        //------- если копирует красного человека создадим новый ID  ------
        if GetValueFieldEx(arrRec, '_COPYMEN', false)=true then begin
          lCopyMen:=true;
//          nNewID:=dmBase.GetNewID(dmBase.TypeObj_Nasel);  // ID для сторой копии человека
          // прочитанный человек остается под старым ID, а у человека из базы нужно будет менять призаписи лиц. счета
          TdmLichSchet(Dokument).slChangeIDMens.Add(IntToStr(nID)+'=***'); //  новый ID запросим при записи
//        dmBase.ChangeIDMen(dLich.dmMens.mtDokumentID.AsInteger, nID);   при записи лицевого
        end;
        dLich.FNewMen:=true;
        //-------------------------------------------------------------------
        dLich.dmMens.mtDokument.Post;
        dLich.dmMens.SetMaster;
        if n=1 then begin
          dLich.mtDokument.CheckBrowseMode;
          dLich.mtDokument.Edit;
          dLich.mtDokumentFIRST.AsInteger := dLich.dmMens.mtDokumentID_INTERNAL.AsInteger;
          dLich.mtDokumentFIRST_FIO.AsString := dLich.dmMens.GetFIO;
          lFirst:=true;
        end else begin
          lFirst:=false;
        end;
        dLich.dmMens.mtDokument.CheckBrowseMode;
        dLich.dmMens.mtDokument.Locate('ID',nID,[]);
        dLich.dmMens.mtDokument.Edit;
        dLich.dmMens.mtDokumentFIRST.AsBoolean:=lFirst;
        dLich.dmMens.mtDokumentADRES_ID.AsInteger:=dLich.mtDokumentADRES_ID.AsInteger;

        if dDateS=0 then begin
          dLich.dmMens.mtDokumentCANDELETE.AsBoolean:=false;
          dLich.dmMens.mtDokumentPROPIS.AsBoolean:=true;
          dLich.dmMens.mtDokumentPRESENT.AsBoolean:=true;
        end;

        dLich.dmMens.mtDokumentOTNOSH.AsString:= '';
        dLich.dmMens.mtDokumentDATE_SROK.AsString:='';
        dLich.dmMens.mtDokumentDATE_SROK_DN.AsString:='';
        dLich.dmMens.mtDokumentNOMER_SEM.AsString:='0';
        dLich.dmMens.mtDokumentDATEP.AsString:='';
        dLich.dmMens.mtDokumentDATEV.AsString:='';
        dLich.dmMens.ClearAddAdresProp;

        dLich.dmMens.mtDokumentKATEG.AsInteger:=LIC_REG;
  //      dLich.dmMens.mtDokumentPRESENTex.AsBoolean:=true;
        dLich.dmMens.mtDokument.Post;

        btEditMenClick(nil);
      end;
    end;
  end;
end;

procedure TfmLichSchet.UpdateActions;
var
  lVisible,lEnable : Boolean;
begin
  inherited;
  if TdmLichSchet(Dokument).mtDokumentADRES_ID.IsNull or
     (TdmLichSchet(Dokument).mtDokumentADRES_ID.AsInteger <= 0) then begin
    lVisible := false;
  end else begin
    lVisible := true;
//    if not TdmLichSchet(Dokument).mtDokumentOWN_HOUSE.AsBoolean then begin

    //--- сделаем дом доступным всегда в независимости от того в чьей собственности
  //  if not cbOwnHouse.Checked then begin
  //    lVisible := false;
  //  end;
    //-------------------------------
  end;
 // edTypeHouse.Enabled := not cbOwnHouse.Checked;
  if tsHouse.TabVisible <> lVisible then begin
    tsHouse.TabVisible := lVisible;
  end;
  if FEnableWrite then begin
    if dsMens.DataSet.Eof and dsMens.DataSet.Bof then begin
      lEnable := false;
      btEditMen.Enabled := lEnable;
      btDelMen.Enabled  := lEnable;
      btPerevodMen.Enabled := lEnable;
      btIsklMen.Enabled := lEnable;
      if TdmLichSchet(Dokument).mtDokumentDATE_LIKV.IsNull then begin
        edFirst.Visible := lEnable;
        lbSobst.Visible := lEnable;
      end;
    end else begin
      if TdmLichSchet(Dokument).mtDokumentDATE_LIKV.IsNull then begin
        edFirst.Visible   := true;
        lbSobst.Visible   := true;
      end;
      btEditMen.Enabled := true;
      btDelMen.Enabled  := true;
      btIsklMen.Enabled := true;
    end;
    if Dokument.DateFiks<>dmBase.GetDateCurrentSost then begin
      btChoiceMen.Enabled := false;
    end else begin
      btChoiceMen.Enabled := true;
    end;
  end;
end;
//------------------------------------------------------------------
procedure TfmLichSchet.ChoiceAdresAddWrite(nID:Integer);
var
  lErr : Boolean;
  fld:TField;
begin
  dLich.mtDokument.Edit;
  dLich.mtDokument.FieldByName('ADRES_ID').AsInteger := nID;
  TdmLichSchet(Dokument).ReadPropAdres(lErr);
  fld:=dLich.tbDopProp.FindField('PLOSH_GIL');
  if (fld<>nil) and not fld.IsNull
   then dLich.mtDokumentPL_ZANIM.Value:=fld.Value
   else dLich.mtDokumentPL_ZANIM.AsString:='';
  fld:=dLich.tbDopProp.FindField('KOL_KOMN');
  if (fld<>nil) and not fld.IsNull
    then dLich.mtDokumentKOM_ZANIM.Value:=fld.Value
    else dLich.mtDokumentKOM_ZANIM.AsString:='';
  dLich.ReadRekvAdres;  // !!!
  dLich.mtDokument.Post;
end;
//------------------------------------------------------------------
procedure TfmLichSchet.btAdresClick(Sender: TObject);
var
  lErr : Boolean;
  fld:TField;
begin
  if fmChoiceAdres= nil then begin
    fmChoiceAdres := TfmChoiceAdres.Create(nil);
  end;
  fmChoiceAdres.DateFiks := Dokument.DateFiks;
  fmChoiceAdres.ChoiceLich := false;
  dsDokument.DataSet.CheckBrowseMode;
  if (fmChoiceAdres.ShowModal = mrOk) and (fmChoiceAdres.IDAdres>0) then begin
    ChoiceAdresAddWrite(fmChoiceAdres.IDAdres);
  end;
end;
//------------------------------------------------
procedure TfmLichSchet.btAdresSimpleClick(Sender: TObject);
begin
  if fmChoiceAdresS= nil then begin
    fmChoiceAdresS := TfmChoiceAdresS.Create(nil);
  end;
  fmChoiceAdresS.DateFiks := Dokument.DateFiks;
  dsDokument.DataSet.CheckBrowseMode;
  if fmChoiceAdresS.EditAdres then begin
    ChoiceAdresAddWrite(fmChoiceAdresS.IDAdres);
  end;
end;

//------------------------------------------------
procedure TfmLichSchet.btAdresVvodClick(Sender: TObject);
var
  adr : TAdres;
  strErr : String;
  nUL,n : Integer;
  lErr:Boolean;
begin
  dsDokument.DataSet.CheckBrowseMode;
//  dmBase.AdresFromID(Dokument.DateFiks, dLich.mtDokumentADRES_ID.AsString, false);
  adr.PunktKod:=dLich.mtDokumentPUNKT.AsInteger; //dmBase.Adres_PunktKod;
  if dLich.mtDokumentADRES_ID.AsInteger<=0
    then adr.UlicaInt:=-1
    else adr.UlicaInt:=dLich.mtDokumentUL.AsInteger; //dmBase.Adres_UlKod;
  adr.NDom:=dLich.mtDokumentDOM.AsString; // dmBase.Adres_NDom;
  adr.Korp:=dLich.mtDokumentKORP.AsString; //dmBase.Adres_Korp;
  adr.Kv:=dLich.mtDokumentKV.AsString; // dmBase.Adres_Kv;
  adr.NotDom:=false;
  adr.NameHouse:='';
  {$IFDEF GKH}
    if IsAccountRnGor
      then adr.RnGor:=GlobalTask.ParamAsInteger('RN_GOROD')
      else adr.RnGor:=0;
  {$ELSE}
    adr.RnGor:=0;
  {$ENDIF}
  n:=AddNewAdres2(Dokument.DateFiks,adr,strErr,false,'Адрес;Выбрать',self);
  if (n=0) or (n=1) then begin
    ChoiceAdresAddWrite(adr.AdresID);
  end;
end;

//------------------------------------------------
function TfmLichSchet.getDataSetMens : TDataSet;
begin
  Result := dsMens.DataSet;
end;

//------------------------------------------------
// проверить доступность первого члена хоз-ва для формы fmMen
function TfmLichSchet.IsEnabledFirst : Boolean;
var
  ds : TDataSet;
  sBookMark : String;
begin
  Result := true;
  ds := GetDataSetMens;
  if ds <> nil then begin
    if ds.FieldByName('FIRST').IsNull or not ds.FieldByName('FIRST').AsBoolean then begin
      Result := false;
    end else begin
      Result := true;
    end;
    // если текущий не глава хоз-ва, то поищем если уже глава хоз-ва
    if not Result then begin
      ds.DisableControls;
      sBookMark := ds.Bookmark;
      ds.First;
      while not ds.Eof do begin
        if not ds.FieldByName('FIRST').IsNull and ds.FieldByName('FIRST').AsBoolean then begin
          Result := false;
          break;
        end;
        ds.Next;
      end;
      ds.Bookmark := sBookMark;
      ds.EnableControls;
    end;
  end;
end;

//------------------------------------------------
// проверить первого члена хоз-ва
function TfmLichSchet.CheckFirst( var strErr : String ) : Boolean;
//var
//  cur : Variant;
//  ds : TDataSet;
//  sBookMark : String;
//  nCount : Integer;
begin
//  nCount := 0;
//  strErr := '';
  Result := true;
  if edFirst.Field.AsString='' then begin
    if dsMens.DataSet.RecordCount > 0 then begin
      dsMens.DataSet.First;
      EditDataSet(dLich.mtDokument);
      dLich.mtDokumentFIRST.AsInteger:=dLich.dmMens.mtDokumentID_INTERNAL.AsInteger;
      dLich.mtDokumentFIRST_FIO.AsString:=dLich.dmMens.GetFIO;
    end;

//      EditDataSet(dsDokument.DataSet);
//      edFirst.Field.Value := dsMens.DataSet.FieldByName('ID_INTERNAL').Value;
//    end;
  end;
  {
  cur := edFirst.Field.Value;
  EditDataSet(dsDokument.DataSet);
  edFirst.Field.AsString := '';
  edFirst.Field.Value := cur;
  }
  {
  ds := GetDataSetMens;
  if ds <> nil then begin
    ds.DisableControls;
    sBookMark := ds.Bookmark;
    ds.First;
    while not ds.Eof do begin
      if not ds.FieldByName('FIRST').IsNull and ds.FieldByName('FIRST').AsBoolean then begin
        if nCount > 0 then begin
          strErr := 'Введен более чем один глава хозяйства !';
          Result := false;
        end;

        nCount := nCount + 1;
      end;
      ds.Next;
    end;
    ds.Bookmark := sBookMark;
    ds.EnableControls;
  end;
  }
end;

//---------------------------------------------------------------------------------------------------------------
procedure TfmLichSchet.GridMensColumns1GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  s:String;
begin
  if not EditMode then begin
    s:='';
    if Params.Text<>'' then begin
      if dmBase.SprOtnosh.Locate('ID',Params.Text,[]) then begin
        s := dmBase.SprOtnosh.FieldByName('NAME').AsString;
      end;
    end;
    if s='' then begin
      if not TdmLichSchet(Dokument).mtDokumentFIRST.IsNull and
         (TdmLichSchet(Dokument).mtDokumentFIRST.AsString=
           dsMens.DataSet.FieldByName('ID_INTERNAL').AsString) then begin
        if TdmLichSchet(Dokument).mtDokumentOWN_HOUSE.AsBoolean=true then begin
          s := 'Собственник';
        end else begin
          s := 'Наним.,поднаним.';
        end;
      end;
    end;
    Params.text := s;
  end;
end;

//---------------------------------------------------------------------------------------------------------------
procedure TfmLichSchet.GridMensColumns6GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      if (Params.Text='М') then begin
        Params.Text:='Мужской';
      end else if (Params.Text='Ж') then begin
        Params.Text:='Женский';
      end;
    end;
  end;
end;

procedure TfmLichSchet.dsDokumentDataChange(Sender: TObject; Field: TField);
var
  vResult : Variant;
  bm : TBookmarkStr;
begin
  inherited;
  if Dokument.mtDokument.FieldByName('OWN_HOUSE').AsBoolean=true then begin
    lbSobst.Caption := 'ФИО собственника';
  end else begin
    lbSobst.Caption := 'ФИО нанимателя, поднанимателя';
  end;
  if (Field<>nil) then begin
    if Field.FieldName='ADRES_ID' then begin
      if Field.IsNull or (Field.AsInteger=0) then begin
        sbDom.Visible:=false;
      end else begin
        sbDom.Visible:=true;
      end;
    end else if Field.FieldName='FIRST' then begin
      // если не идет процесс чтения лицевого счета
      if not Dokument.IsReadDokument then begin
        if not Field.IsNull then begin
          bm := dsMens.DataSet.Bookmark;
          dsMens.DataSet.DisableControls;
          if dsMens.DataSet.Locate('ID_INTERNAL', Field.Value, []) then begin
            if dsMens.DataSet.FieldByName('OTNOSH').AsString<>'' then begin
              EditDataSet(dsMens.DataSet);
              dsMens.DataSet.FieldByName('OTNOSH').AsString:='';
              PostDataSet(dsMens.DataSet);
            end;
          end;
          dsMens.DataSet.Bookmark := bm;
          dsMens.DataSet.EnableControls;
          dsMens.DataSet.Refresh;
        end;
      end;
    end;
    if not Dokument.IsReadDokument then begin
      vResult := null;
      RunFuncScript('LICH_ANYCORR', [Field.FieldName], vResult);
    end;
  end;
end;

procedure TfmLichSchet.GridMensGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not dsMens.DataSet.FieldByName('CANDELETE').IsNull and  dsMens.DataSet.FieldByName('CANDELETE').AsBoolean then begin
    if dsMens.DataSet.FieldByName('NEW_ID').AsInteger>0
      then AFont.Color := ColorMenCopy
      else AFont.Color := GridMens.Color1;
  end else if not dsMens.DataSet.FieldByName('PROPIS').IsNull and(dsMens.DataSet.FieldByName('PROPIS').AsBoolean=false) then begin
    AFont.Color := $00319D31; //clGreen; //Grid.NewRowColor;
  end else if not dsMens.DataSet.FieldByName('PRESENT').IsNull and not dsMens.DataSet.FieldByName('PRESENT').AsBoolean then begin
    AFont.Color := GridMens.Color2; //clRed;
  end;
  if CurMenIsFirst then begin
//  (edFirst.Value<>null) and
//    not dsMens.DataSet.FieldByName('ID_INTERNAL').IsNull and
//    (dsMens.DataSet.FieldByName('ID_INTERNAL').Value=edFirst.Value) then begin
    AFont.Style := [fsBold];
  end;
  if dsMens.DataSet.FieldByName('PROPIS').AsBoolean and  dsMens.DataSet.FieldByName('PRESENT').AsBoolean then begin
    if not dsMens.DataSet.FieldByName('DATE_SROK_DN').IsNull then begin
      AFont.Style := AFont.Style + [fsUnderline];
    end;
  end;
end;

procedure TfmLichSchet.sbDopResize(Sender: TObject);
begin
  edDop.Width  := gbDop.Width-10;
  edDop.Height := gbDop.Height-14;
end;

procedure TfmLichSchet.N_F_cbOwnHouseClick(Sender: TObject);
begin
{
  if cbOwnHouse.Checked then begin
//    edTypeHouse.Value:=null;
  end else begin
    dmBase.SprTypeHouse.First;
    if not dmBase.SprTypeHouse.Eof then begin
      edTypeHouse.Value := dmBase.SprTypeHouse.FieldByName('ID').AsString;
    end;
  end;
}
end;

procedure TfmLichSchet.FormShow(Sender: TObject);
begin
  pc.ActivePageIndex := 0;
  if edLichSchet.Visible then begin
    ActiveControl := edLichSchet;
  end;
  N_F_cbMNS_LPX.Visible:=GlobalTask.ParamAsBoolean('OTM_MNS_LPX');
end;

procedure TfmLichSchet.btUpClick(Sender: TObject);
var
  bm : TBookmarkStr;
  n1, n2, nRec1, nRec2 : Integer;
  fld : TField;
begin
  fld := dsMens.DataSet.FieldByName('NSTR');
  with dsMens.DataSet do begin
    bm := Bookmark;
    DisableControls;
    n1    := fld.AsInteger;
    nRec1 := Recno;
    Prior;
    nRec2 := Recno;
    n2 := fld.AsInteger;
    if (nRec1<>nRec2) and (n1<>n2) then begin
      Edit;
      fld.AsInteger := n1;
      Post;
      Bookmark := bm;
      Edit;
      fld.AsInteger := n2;
      Post;
    end;
    Bookmark := bm;
    EnableControls;
  end;
end;

procedure TfmLichSchet.btDownClick(Sender: TObject);
var
  bm : TBookmarkStr;
  n1, n2, nRec1, nRec2 : Integer;
  fld : TField;
begin
  fld := dsMens.DataSet.FieldByName('NSTR');
  with dsMens.DataSet do begin
    bm := Bookmark;
//    DisableControls;
    n1    := fld.AsInteger;
    nRec1 := Recno;
    Next;
    nRec2 := Recno;
    n2 := fld.AsInteger;
    if (nRec1<>nRec2) and (n1<>n2) then begin
      Edit;
      fld.AsInteger := n1;
      Post;
      Bookmark := bm;
      Edit;
      fld.AsInteger := n2;
      Post;
    end;
    Bookmark := bm;
//    EnableControls;
  end;
end;

procedure TfmLichSchet.dsMensDataChange(Sender: TObject; Field: TField);
begin
  if Field<>nil then begin
    QueryExit := true;
//    Showmessage(Field.FieldName);
  end;
end;

procedure TfmLichSchet.dsDopPropDataChange(Sender: TObject; Field: TField);
var
  vResult:Variant;
  i:Integer;
begin
  if Field<>nil then begin
    if not Dokument.IsReadDokument then begin
      QueryExit := true;
      vResult := null;
      RunFuncScript('LICH_ANYCORR', [Field.FieldName], vResult);

      if (FFieldsAutoSum_My.Count>0) and (FFieldsAutoSum_My.IndexOf(Field.FieldName)>-1) then begin
        dsDopProp.DataSet.DisableControls;
        EditDataSet(dsDopProp.DataSet);
        try
          with dsDopProp.DataSet do begin

            FieldByName(sVsego).AsFloat:=0;
            for i:=0 to FFieldsAutoSum_My.Count-1 do begin
              FieldByName(sVsego).AsFloat:=FieldByName(sVsego).AsFloat+FieldByname(FFieldsAutoSum_My.Strings[i]).AsFloat;
            end;
          end;
        finally
          dsDopProp.DataSet.EnableControls;
        end;
      end;

    end;
  end;
end;

function TfmLichSchet.EditForm(slPar:TStringList; strGurnal:String) : Boolean;
var
  lRunReport:Boolean;
  arr:TArrStrings;
begin
  StrToStrings(GlobalTask.ParamAsString('AUTOSUM_VSEGO'),FFieldsAutoSum_My,';',true);

  CurGridMens:=GridMens;

  AssignPar(slPar);
  lRunReport:=GetParam('RUN_REPORT','0')='1';

  FGurnal:=strGurnal;  // журнал из которого открыли форму
  Result := false;

  if not lRunReport then begin
    case GlobalTask.ParamAsInteger('SIMPLE_ADRES') of
      0: btAdres.OnClick:=btAdresClick;
      1: btAdres.OnClick:=btAdresSimpleClick;
      2: btAdres.OnClick:=btAdresVvodClick;
    else
      btAdres.OnClick:=btAdresClick;
    end;
    if (TdmLichSchet(Dokument).mtDokumentID.AsInteger=-1) and
       (GlobalTask.ParamAsInteger('MIN_TWO_NOMER')>0)  then begin
      edLichSchet.EditButtons[0].Visible:=true;
      edLichSchet.EditButtons[1].Visible:=true;
      edLichSchet.Width:=150;
    end else begin
      edLichSchet.EditButtons[0].Visible:=false;
      edLichSchet.EditButtons[1].Visible:=false;
      edLichSchet.Width:=120;
    end;

    if FEnableWrite then begin
      btEditMen.Caption    := 'Коррект.';
    end else begin
      btEditMen.Caption    := 'Просмотр';
      btAddMen.Enabled     := false;
      btIsklMen.Enabled    := false;
      btAdres.Visible      := false;
      btDelMen.Enabled     := false;
      btPerevodMen.Enabled := false;
      btChoiceMen.Enabled  := false;
      btUp.Enabled   := false;
      btDown.Enabled := false;
    end;

    TdmLichSchet(Dokument).slIsklMens.Clear;
    TdmLichSchet(Dokument).slDelMens.Clear;
    TdmLichSchet(Dokument).slPerevodMens.Clear;
  end;

  CreateKeyList;
  SetParamForMens;

  dsMens.DataSet.First;

  if TdmLichSchet(Dokument).mtDokumentID.AsInteger=-1 then begin
    TBItemReLoad.Visible:=false;
  end else begin
    TBItemReLoad.Visible:=true;
  end;
  QueryExit := false;
  if Dokument.DateFiks<>dmBase.GetDateCurrentSost then begin
    btPerevodMen.Enabled := false;
  end;
  // загрузим шаблоны
  LicSchet.dmLichSchet := TdmLichSchet(Dokument);

  if not lRunReport then begin
    TBSubmenuTmp.Visible:=LoadTemplate('fmLichSchet');

    if not GlobalTask.ParamAsBoolean('V_ZVERI')
      then tsAnimal.TabVisible:=false
      else tsAnimal.TabVisible:=true;

//    if Globaltask.ParamAsInteger('VER_UCHET')<2 then begin
//      if not GlobalTask.ParamAsBoolean('V_SELXOZ')
//        then tsLand.TabVisible:=false
//        else tsLand.TabVisible:=true;
//    end;

    if not GlobalTask.ParamAsBoolean('V_NALOGI') then begin
      tsNalogi.TabVisible:=false
    end else begin
//      GridNalogi.SumList.RecalcAll;
      tsNalogi.TabVisible:=true;
    end;

    if not GlobalTask.ParamAsBoolean('V_DOKUM')
      then tsDokumets.TabVisible:=false
      else tsDokumets.TabVisible:=true;
  end;
//  fmMain.TemplateInterface.GetTemplate('fmLichSchet.SpxNalLS');
//  showmessage(GetParam(slPar,'NONE','XXX'));

  if lRunReport then begin
    RunReport;
  end;

  fmMain.FOpenLic:=true;
  if IsShowEdit then begin
    if ShowModal=mrOk then begin
      Result := true;
    end;
  end;
  fmMain.FOpenLic:=false;

  CurGridMens:=GridMens;

end;

procedure TfmLichSchet.UserAfterSkip;
var
 s : String;
begin
  inherited;
  s:=TdmLichSchet(Dokument).mtDokumentFIRST.AsString;
  EditDataSet(Dokument.mtDokument);
  TdmLichSchet(Dokument).mtDokumentFIRST.AsString:='';
  TdmLichSchet(Dokument).mtDokumentFIRST.AsString:=s;
  PostDataSet(Dokument.mtDokument);
  QueryExit := false;
  TdmLichSchet(Dokument).slIsklMens.Clear;
  TdmLichSchet(Dokument).slDelMens.Clear;
  TdmLichSchet(Dokument).slPerevodMens.Clear;
end;

procedure TfmLichSchet.AfterReport;
begin
//  EnableControls;
end;

function TfmLichSchet.BeforeReport: Boolean;
begin
  Result := true;
  dLich.PostDokument;
//  DisableControls;
end;

procedure TfmLichSchet.dsNalogiDataChange(Sender: TObject; Field: TField);
begin
  if Field<>nil then begin
    QueryExit := true;
//    GridNalogi.SumList.RecalcAll;
  end;
end;

procedure TfmLichSchet.LoadFromIni;
var
  ini : TSasaIniFile;
begin
  inherited;
  ini := GlobalTask.iniFile('FORM');
  GridNalogi.RestoreColumnsLayout(ini,'GridNalogi_ColumnsLayOut',
                                  [crpColIndexEh,crpColWidthsEh]);
  CompFromIni(gbSostav, ini, Name+'.gbSostav', ',Height,');
  CompFromIni(edDop, ini, Name+'.edDop', ',Width,');
  if gbSostav.Height<270
    then gbSostav.Height:=270;
end;

function TfmLichSchet.SaveToIni: Boolean;
var
  ini : TSasaIniFile;
begin
  Result := inherited SaveToIni;
  if Result then begin
    ini := GlobalTask.iniFile('FORM');
    GridNalogi.SaveColumnsLayout(ini,'GridNalogi_ColumnsLayOut');
    CompToIni(gbSostav, ini, Name+'.gbSostav', ',Height,');
    CompToIni(edDop, ini, Name+'.edDop', ',Width,');
  end;
end;

//-----------------------------------------------------------
procedure TfmLichSchet.btAddDokClick(Sender: TObject);
var
 f:TfmLicSchetDok;
 Col:TColumnEh;
// Opis:TOPisEdit;
// i:Integer;
begin
 f:=TfmLicSchetDok.Create(nil);
 f.edTypeDok.ItemIndex:=0;
 f.edData.Value:=Now;
 f.edNomer.Text:='';
 f.edKomm.Text:='';
 if f.ShowModal=mrOk then begin
   dLich.tbDokumens.Append;
   dLich.tbDokumensTypeDok.AsString:=f.edTypeDok.KeyItems[f.edTypeDok.ItemIndex];
   dLich.tbDokumensDate_Dok.AsdateTime:=f.edData.Value;
   dLich.tbDokumensNomer.AsString:=f.edNomer.Text;
   dLich.tbDokumensKomm.AsString:=f.edKomm.Text;
   dLich.tbDokumensSubject.AsString:='';
   dLich.tbDokumens.Post;
   QueryExit:=true;
 end;
 if f.CheckTypeDok then begin
//   Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_LIC_TYPEDOK');
   Col:=GridDok.FieldColumns['TYPEDOK'];
   GlobalTask.CurrentOpisEdit.GetListOpis('KEY_LIC_TYPEDOK', Col.PickList, Col.KeyList);
//   for i:=0 to Opis.Items.Count-1 do begin
//     Col.PickList.Add(Opis.Items[i]);
//     Col.KeyList.Add(Opis.KeyList[i]);
//   end;
 end;
 f.Free;

end;

procedure TfmLichSchet.btIsvechNalClick(Sender: TObject);
var
  f : TfmIzvechNal;
  strGod,s : String;
  arr: TArrSearchNalog;
  i : Integer;
begin
  s := dsDokument.DataSet.FieldByName('ADRES_ID').AsString;
  if (s<>'') and (s<>'0') then begin
//!!!    dmBase.AdresFromID( Dokument.DateFiks, dsDokument.DataSet.FieldByName('ADRES_ID').AsString );
    f := TfmIzvechNal.Create(nil);
    strGod := Copy(DTOS(GlobalTask.CurrentDate,tdClipper),1,4);
    if not f.tbDok.Active then f.tbDok.Active:=true;
    f.tbDok.Append;
    f.tbDokGOD.AsString := strGod;
    f.tbDokDOK_DATE.AsDateTime := GlobalTask.CurrentDate;
    f.tbDokADRES_PUNKT.AsString := dLich.mtDokumentPUNKT_NAME.asString; //dmBase.Adres_Punkt;
    f.tbDokADRES_UL.AsString    := dLich.mtDokumentUL_NAME.asString; //dmBase.Adres_UL;
    f.tbDokADRES_DOM.AsString   := dLich.mtDokumentDOM.asString; //dmBase.Adres_NDom;
    f.tbDokADRES_KV.AsString    := dLich.mtDokumentKV.asString; //dmBase.Adres_Kv;

    f.tbDokFIO.AsString := edFirst.Text;
    if dLich.dmMens.mtDokument.Locate('ID_INTERNAL', dLich.mtDokumentFIRST.AsInteger,[]) then begin
      f.tbDokUNP.AsString :=  dLich.dmMens.mtDokumentUNP.AsString;
    end;
    f.tbDokNOMER.AsString       := edLichSchet.Text;
    f.tbDokPENJA_DATE.AsDateTime:= STOD(strGod+'0101');
    f.lbNedoim.Caption := 'Недоимка за ' + IntToStr(StrToInt(strGod)-1)+' год';
    f.tbDok.Post;
    f.tbDok.Edit;
    if f.ShowModal=mrOk then begin
      QueryExit:=true;
      with TdmLichSchet(Dokument) do begin
        tbDokumens.Append;
        tbDokumensDate_Dok.AsDateTime := f.tbDokDOK_DATE.AsDateTime;
        tbDokumensTypeDok.AsInteger := DOK_IZVECH_NALOG;
        tbDokumensNomer.AsString    := f.tbDokNOMER.AsString;
        dmBase.WriteDataSetToMemo(f.tbDok, tbDokumensSubject, false, '');
//  NALOG_ZEMLJA   = 1; NALOG_NEDVIG   = 2; NALOG_NEDOIMKA = 3;  NALOG_PENJA    = 4;
        SetLength(arr,0);
        i:=0;
        if f.tbDokNEDVIG_ALL.AsFloat>0 then begin
          SetLength(arr,i+1);
          arr[i].Nalog:= NALOG_NEDVIG;
          arr[i].Summa:= f.tbDokNEDVIG_ALL.AsFloat;
          Inc(i,1);
        end;
        if f.tbDokZEMLJA_ALL.AsFloat>0 then begin
          SetLength(arr,i+1);
          arr[i].Nalog:= NALOG_ZEMLJA;
          arr[i].Summa:= f.tbDokZEMLJA_ALL.AsFloat;
          Inc(i,1);
        end;
        if f.tbDokNEDOIM_ALL.AsFloat>0 then begin
          SetLength(arr,i+1);
          arr[i].Nalog:= NALOG_NEDOIMKA;
          arr[i].Summa:= f.tbDokNEDOIM_ALL.AsFloat;
          Inc(i,1);
        end;
        if f.tbDokPENJA_ALL.AsFloat>0 then begin
          SetLength(arr,i+1);
          arr[i].Nalog:= NALOG_PENJA;
          arr[i].Summa:= f.tbDokPENJA_ALL.AsFloat;
        end;
        WriteNalogFromIzvech(f.tbDokGOD.AsString, f.tbDokDOK_DATE.AsDateTime, STOD(f.tbDokGOD.AsString+'1115'), arr);
        tbDokumens.Post;
        QueryExit:=true;
      end;
    end;
    f.Free;
  end;
end;

procedure TfmLichSchet.WriteNalogFromIzvech(strGod : String; dDateDok : TDateTime; dDateSrok : TDateTime; arr: TArrSearchNalog);
var
  i : Integer;
  vKeyValues : Variant;
begin
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  for i:=Low(arr) to High(arr) do begin
    vKeyValues[0] := strGod;
    vKeyValues[1] := arr[i].Nalog;
    with TdmLichSchet(Dokument) do begin
      if not tbNalogi.Locate('GOD;NALOG', vKeyValues,[]) then begin
        tbNalogi.Append;
        tbNalogiGOD.AsString   := vKeyValues[0];
        tbNalogiNALOG.AsString := vKeyValues[1];
        tbNalogiTYPEOBJ.AsInteger := _TypeObj_Lich;
        tbNalogi.Post;
      end;
      tbNalogi.Edit;
      tbNalogiDATE_VIST.AsDateTime  := dDateDok;
      if dDateSrok>0 then
        tbNalogiDATE_SROK.AsDateTime  := dDateSrok;
      tbNalogiSUMMA_VIST.AsFloat    := arr[i].Summa;
      tbNalogi.Post;
    end;
  end;
end;

procedure TfmLichSchet.GridDokDblClick(Sender: TObject);
begin
  btEditDokClick(nil);
end;

//-----------------------------------------------------------
procedure TfmLichSchet.btEditDokClick(Sender: TObject);
var
  fd:TfmLicSchetDok;
  f : TfmIzvechNal;
  strGod,s : String;
  arr: TArrSearchNalog;
  i : Integer;
begin
  if dLich.tbDokumens.IsEmpty
    then exit;
  if dLich.tbDokumensTypeDok.AsInteger=DOK_IZVECH_NALOG then begin
    if not TdmLichSchet(Dokument).tbDokumens.IsEmpty then begin
      s := dsDokument.DataSet.FieldByName('ADRES_ID').AsString;
      if (s<>'') and (s<>'0') then begin
//        dmBase.AdresFromID( Dokument.DateFiks, dsDokument.DataSet.FieldByName('ADRES_ID').AsString );
        f := TfmIzvechNal.Create(nil);
        strGod := Copy(DTOS(GlobalTask.CurrentDate,tdClipper),1,4);
        if not f.tbDok.Active then f.tbDok.Active:=true;
        f.tbDok.Append;
        dmBase.ReadDataSetFromMemo(f.tbDok, TdmLichSchet(Dokument).tbDokumensSubject, false);
        EditDataSet(f.tbDok);
        f.lbNedoim.Caption := 'Недоимка за ' + IntToStr(f.tbDokGOD.AsInteger-1)+' год';
        if f.ShowModal=mrOk then begin
          QueryExit:=true;
          with TdmLichSchet(Dokument) do begin
            tbDokumens.Edit;
            tbDokumensDate_Dok.AsDateTime := f.tbDokDOK_DATE.AsDateTime;
            tbDokumensTypeDok.AsInteger   := DOK_IZVECH_NALOG;
            tbDokumensNomer.AsString      := f.tbDokNOMER.AsString;
            dmBase.WriteDataSetToMemo(f.tbDok, tbDokumensSubject, false,'');
            SetLength(arr,0);
            i:=0;
            if f.tbDokNEDVIG_ALL.AsFloat>0 then begin
              SetLength(arr,i+1);
              arr[i].Nalog:= NALOG_NEDVIG;
              arr[i].Summa:= f.tbDokNEDVIG_ALL.AsFloat;
              Inc(i,1);
            end;
            if f.tbDokZEMLJA_ALL.AsFloat>0 then begin
              SetLength(arr,i+1);
              arr[i].Nalog:= NALOG_ZEMLJA;
              arr[i].Summa:= f.tbDokZEMLJA_ALL.AsFloat;
              Inc(i,1);
            end;
            if f.tbDokNEDOIM_ALL.AsFloat>0 then begin
              SetLength(arr,i+1);
              arr[i].Nalog:= NALOG_NEDOIMKA;
              arr[i].Summa:= f.tbDokNEDOIM_ALL.AsFloat;
              Inc(i,1);
            end;
            if f.tbDokPENJA_ALL.AsFloat>0 then begin
              SetLength(arr,i+1);
              arr[i].Nalog:= NALOG_PENJA;
              arr[i].Summa:= f.tbDokPENJA_ALL.AsFloat;
            end;
            WriteNalogFromIzvech(f.tbDokGOD.AsString, f.tbDokDOK_DATE.AsDateTime, STOD(f.tbDokGOD.AsString+'1115'), arr);
            tbDokumens.Post;
          end;
        end;
        f.Free;
      end;
    end;
  end else begin
    fd:=TfmLicSchetDok.Create(nil);
    fd.edTypeDok.Value:=dLich.tbDokumensTypeDok.AsString;
    fd.edTypeDok.Enabled:=false;
    fd.edData.Value:=dLich.tbDokumensDate_Dok.AsDateTime;
    fd.edNomer.Text:=dLich.tbDokumensNomer.AsString;
    fd.edKomm.Text:=dLich.tbDokumensKomm.AsString;
    if fd.ShowModal=mrOk then begin
      dLich.tbDokumens.Edit;
      dLich.tbDokumensDate_Dok.AsDateTime:=fd.edData.Value;
      dLich.tbDokumensNomer.AsString:=fd.edNomer.Text;
      dLich.tbDokumensKomm.AsString:=fd.edKomm.Text;
      dLich.tbDokumensSubject.AsString:='';
      dLich.tbDokumens.Post;
      QueryExit:=true;
    end;
    fd.Free;
  end;           
end;

//-----------------------------------------------------------
procedure TfmLichSchet.btDelDokClick(Sender: TObject);
begin
  if not TdmLichSchet(Dokument).tbDokumens.IsEmpty then begin
    if Problem(' Удалить текущий документ ?  ',mtConfirmation,self) then begin
      TdmLichSchet(Dokument).tbDokumens.Delete;
      QueryExit:=true;
    end;
  end;
end;

procedure TfmLichSchet.edTypeHouseEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_TYPEHOUSE', 'TYPEHOUSE', false);
  Handled := true;
end;

procedure TfmLichSchet.TBItemSort_DatePClick(Sender: TObject);
begin
  TkbmMemTable(dsMens.DataSet).IndexFieldNames:='DATEP;FAMILIA;NAME';
  GridMens.FieldColumns['NSTR'].Visible:=false;
end;

procedure TfmLichSchet.TBItemSort_NomerClick(Sender: TObject);
begin
  TkbmMemTable(dsMens.DataSet).IndexFieldNames:='NSTR';
  GridMens.FieldColumns['NSTR'].Visible:=true;
end;

procedure TfmLichSchet.TBItemSort_FIOClick(Sender: TObject);
begin
  TkbmMemTable(dsMens.DataSet).IndexFieldNames:='FAMILIA;NAME';
  GridMens.FieldColumns['NSTR'].Visible:=false;
end;

procedure TfmLichSchet.lbCloseGetText(Sender: TObject; var Text: String);
var
  l : Boolean;
begin
  if TdmLichSchet(Dokument).mtDokumentDATE_LIKV.IsNull then begin
    Text := '';
    l:=true;
  end else begin
    Text := '  Лицевой счет ликвидирован:   '+DatePropis(TdmLichSchet(Dokument).mtDokumentDATE_LIKV.AsDateTime,5);
    l:=false;
 //   lbClose.Width := edFirst.Left+edFirst.Width+5;
  end;
  Label1.Visible       := l;
  edLichSchet.Visible  := l;
  lbSobst.Visible      := l;
  edFirst.Visible      := l;
  lbClose.Visible := not l;
end;

procedure TfmLichSchet.GridSobstvColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if dLich.tbHouseOwnersTYPEKOD.IsNull then begin
    Params.ImageIndex := -1;
  end else if (dLich.tbHouseOwnersTYPEKOD.AsInteger=OWNER_NASEL) then begin
    if dLich.tbHouseOwnersPROPIS.AsBoolean=true
      then Params.ImageIndex := 0    // зарегистр. население
      else Params.ImageIndex := 1;   // не зарегистр. население
  end else begin
    Params.ImageIndex := 2;  // организация
  end;
end;


{
procedure TfmLichSchet.GridSobstvColumns1GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if dLich.tbHouseOwnersTYPEKOD.IsNull then begin
    Params.ImageIndex := -1;
  end else if (dLich.tbHouseOwnersTYPEKOD.AsInteger=OWNER_MY) and
    (dLich.tbHouseOwnersPROPIS.AsBoolean=true) then begin
    Params.ImageIndex := 0;
  end else begin
    Params.ImageIndex := 1;
  end;
end;
}

procedure TfmLichSchet.pcChange(Sender: TObject);
begin
  TTabControl(Sender).Repaint;
end;

procedure TfmLichSchet.edLichSchetEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edLichSchet.Text:=IntToStr(dmBase.GetLastNomerLicFirst+1);
end;

procedure TfmLichSchet.edLichSchetEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  n:Int64;
begin
  // двойной учет
  if GlobalTask.ParamAsInt64('MIN_TWO_NOMER')>0 then begin
    n:=dmBase.GetLastNomerLic;
    if n=0 // из второй части нет лицевых счетов
      then n:=GlobalTask.ParamAsInt64('MIN_TWO_NOMER')
      else n:=n+1;
    edLichSchet.Text:=IntToStr(n);
  end else begin
    edLichSchet.Text:=IntToStr(dmBase.GetLastNomerLic+1);
  end;
end;

procedure TfmLichSchet.btAddSobstvClick(Sender: TObject);
begin
  EditSobstv( dLich.tbHouseOwners, nil, dLich.dmMens.mtDokument, dLich.mtDokumentADRES_ID.AsInteger, true);
  FSetFormMens:=false;
  QueryExit:=true;
end;

procedure TfmLichSchet.btEditSobstvClick(Sender: TObject);
begin
  if dLich.tbHouseOwners.RecordCount>0 then begin
    EditSobstv( dLich.tbHouseOwners, nil, dLich.dmMens.mtDokument, dLich.mtDokumentADRES_ID.AsInteger, false);
    QueryExit:=true;
  end;
end;

procedure TfmLichSchet.btDelSobstvClick(Sender: TObject);
begin
  if dLich.tbHouseOwners.RecordCount>0 then begin
    if Problem(' Удалить собственника ? ',mtConfirmation,self) then begin
      QueryExit:=true;
      dLich.tbHouseOwners.Delete;
    end;
  end;
end;

procedure TfmLichSchet.GridSobstvGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
begin
  if not dLich.tbHouseOwnersDATEP.IsNull then begin
    AFont.Color:=clRed;
  end;
end;

procedure TfmLichSchet.edControlHouseUpdateData(Sender: TObject; var Handled: Boolean);
begin
  EditDataSet(dLich.mtDokument);
  if edControlHouse.Value<>null then begin
    if edControlHouse.Value=CONTROL_PRIVATE
      then dLich.mtDokumentPRIVATE_SECT.AsBoolean:=True
      else dLich.mtDokumentPRIVATE_SECT.AsBoolean:=False;
  end else begin
    {$IFDEF GKH}
      dLich.mtDokumentPRIVATE_SECT.AsBoolean:=False;
    {$ELSE}
      dLich.mtDokumentPRIVATE_SECT.AsBoolean:=True;
    {$ENDIF}
  end;
end;

procedure TfmLichSchet.edControlHouseEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
// по умолчанию из параметров
  edControlHouse.Value:=0;
end;

procedure TfmLichSchet.edControlHouseEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
// в частной собственности
  edControlHouse.Value:=-1;
end;

procedure TfmLichSchet.edDogovorEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceFromShablonEx(edDogovor, SHABLON_OSNOV_PRED,true);
end;

procedure TfmLichSchet.edFEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i,nID : Integer;
  List : TStringList;
  st:TSostTable;
begin
  List := TStringList.Create;
  st:=SaveSostDataSet(dLich.dmMens.mtDokument,true);
  dLich.dmMens.mtDokument.First;
  while not dLich.dmMens.mtDokument.Eof do begin
    if (dLich.dmMens.mtDokumentID.AsInteger>0) and
       (dLich.mtDokumentFIRST.AsInteger<>dLich.dmMens.mtDokumentID_INTERNAL.AsInteger) then begin
      List.AddObject(dLich.dmMens.GetFIO, Pointer(dLich.dmMens.mtDokumentID_INTERNAL.AsInteger));
    end;
    dLich.dmMens.mtDokument.Next;
  end;
  if List.Count>0 then begin
    i := ChoiceFromList(List,'Выберите человека',edFirst);
    if (i>-1)  then begin
      nID := Integer(List.Objects[i]);
      EditDataSet(dLich.mtDokument);
      dLich.mtDokumentFIRST.AsInteger:=nID;
      dLich.mtDokumentFIRST_FIO.AsString:=List.Strings[i];
      // сбросим старого главу, если найдем
      if dLich.dmMens.mtDokument.Locate('FIRST',true,[]) then begin
        EditDataSet(dLich.dmMens.mtDokument);
        dLich.dmMens.mtDokumentFIRST.AsBoolean:=false;
        PostDataSet(dLich.dmMens.mtDokument);
      end;
      // установим нового главу
      if dLich.dmMens.mtDokument.Locate('ID_INTERNAL',nID,[]) then begin
        EditDataSet(dLich.dmMens.mtDokument);
        dLich.dmMens.mtDokumentFIRST.AsBoolean:=true;
        PostDataSet(dLich.dmMens.mtDokument);
      end;
    end;
  end;
  RestSostDataSet(dLich.dmMens.mtDokument,st);
  List.Free;
end;

procedure TfmLichSchet.edFirstEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  EditDataSet(dLich.mtDokument);
  dLich.mtDokumentFIRST.AsString:='';
  dLich.mtDokumentFIRST_FIO.AsString:='';
  // сбросим старого главу, если найдем
  if dLich.dmMens.mtDokument.Locate('FIRST',true,[]) then begin
    EditDataSet(dLich.dmMens.mtDokument);
    dLich.dmMens.mtDokumentFIRST.AsBoolean:=false;
    PostDataSet(dLich.dmMens.mtDokument);
  end;
end;

procedure TfmLichSchet.edNotStatClick(Sender: TObject);
begin
  if edNotStat.Checked then begin
    ImageNotStat.Visible:=true;
    ImageNotStat.Hint := 'Не включать в формы статистики';
  end else begin
    ImageNotStat.Visible:=false;
    ImageNotStat.Hint := '';
  end;
end;

procedure TfmLichSchet.edUseGilfondEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
// по умолчанию из параметров
  edUseGilfond.Value:=0;
end;

procedure TfmLichSchet.sbDomResize(Sender: TObject);
begin
  Inherited;
  sbDom.Invalidate;
  sbDom.Update;
end;

procedure TfmLichSchet.sbAnimalResize(Sender: TObject);
begin
  inherited;
  sbAnimal.Invalidate;
  sbAnimal.Update;
end;

procedure TfmLichSchet.sbZemlResize(Sender: TObject);
begin
  inherited;
  sbZeml.Invalidate;
  sbZeml.Update;
end;

procedure TfmLichSchet.lbDateSostGetText(Sender: TObject;  var Text: String);
begin
  if TdmLichSchet(Dokument).mtDokumentDATE_FIKS.AsDateTime>0
    then Text:=' на '+FormatDateTime('dd.mm.yyyy', TdmLichSchet(Dokument).mtDokumentDATE_FIKS.AsDateTime)
    else Text:='';
end;


procedure TfmLichSchet.btSetAutoSumClick(Sender: TObject);
begin
  SetAutoSum;
end;

procedure TfmLichSchet.TBItemPropAutoSumClick(Sender: TObject);
begin
  SetAutoSum;
end;

procedure TfmLichSchet.SetAutoSum;
var
 f:TfmSimpleDialog;
 i,nTop:Integer;
 cb:TCheckBox;
 lb:TLabel;
 sField:String;
 arr:array of TCheckBox;
begin
  f:=TfmSimpleDialog.Create(Self);
  f.Position:=poOwnerFormCenter;
  f.Caption:='Автосуммирование';
//          nCurWidth :=GetTextWidth(Lb.Caption, lb.Font.Height, lb.Font.Name, false);
  f.btOk.Caption:='Установить';
  SetLength(arr,FFieldsAutoSum_All.Count);
  nTop:=5;
  for i:=0 to FFieldsAutoSum_All.Count-1 do begin
    sField:=FFieldsAutoSum_All.Names[i];
    if sField=sVsego then begin
      lb:=TLabel.Create(f);
      lb.Parent:=f;
      lb.Caption:=FFieldsAutoSum_All.ValueFromIndex[i];  //
      lb.Top:=nTop;
      lb.Left:=10;
      lb.Font.Size:=GlobalFontSizeE; // 10;
      arr[i]:=nil;
    end else begin
      cb:=TCheckBox.Create(f);
      cb.Parent:=f;
      cb.Caption:='  '+FFieldsAutoSum_All.ValueFromIndex[i];
      if FFieldsAutoSum_My.IndexOf(FFieldsAutoSum_All.Names[i])=-1
        then cb.Checked:=false
        else cb.Checked:=true;
      arr[i]:=cb;
      cb.Top:=nTop;
      cb.Left:=20;
      cb.Width:=480;
      cb.Font.Size:=GlobalFontSizeE; // 10;
    end;
    nTop:=nTop+24;
  end;
//  f.ClientHeight:=FFieldsAutoSum_All.Count*26+f.Panel1.Height;
  f.ClientHeight:=nTop+5+f.Panel1.Height;
  f.ClientWidth:=500;
  if f.ShowModal=mrOk then begin
    FFieldsAutoSum_My.Clear;
    sField:='';
    for i:=0 to FFieldsAutoSum_All.Count-1 do begin
      if (arr[i]<>nil) and arr[i].Checked then begin
        FFieldsAutoSum_My.Add(FFieldsAutoSum_All.Names[i]);
        sField:=sField+FFieldsAutoSum_All.Names[i]+';';
      end;
    end;
    GlobalTask.WriteParamAsString('AUTOSUM_VSEGO',sField);
    GlobalTask.SaveParameters;
    //ShowMessage(GlobalTask.ParamAsString('AUTOSUM_VSEGO'));
  end;
  f.Free;
end;

const
  Err_Nalog = 'Можно корректировать только налоги лицевого счета';

procedure TfmLichSchet.btEditNalogClick(Sender: TObject);
var
  Ic : TIcon;
  Params:TParamsEditSpr;
begin
  if dLich.tbNalogiTYPEOBJ.AsInteger=_TypeObj_Lich then begin
  //  Ic := TIcon.Create;
  //  ImageList.GetIcon(INDEX_ADD,Ic);
    Ic:=nil; //btAddNalog.Glyph;
  //  Params:=TParamsEditSpr.Create;
  //  Params.FormatList.Add('<FILEDNAME>=<DISPLAYFORMAT>~<ALIGN=C,L,R>');
  //  Params.FormatList.Add('MEN_ID=CHOICE_MEN');
  //  Params.FreeOnExitSpr:=true;
    Params:=nil;

  // потом переделать на fEditNalog
    EditRecordGrid( GridNalogi, false, Ic, Params);
  end else begin
    PutError(Err_Nalog);
  end;
end;

procedure TfmLichSchet.btDeleteNalogClick(Sender: TObject);
begin
  if (TdmLichSchet(Dokument).tbNalogi.State=dsBrowse) and
     not TdmLichSchet(Dokument).tbNalogi.IsEmpty then begin
    if dLich.tbNalogiTYPEOBJ.AsInteger=_TypeObj_Lich then begin
      if Problem(' Удалить текущий налог ?  ',mtConfirmation,self) then begin
        TdmLichSchet(Dokument).tbNalogi.Delete;
        QueryExit:=true;
      end;
    end else begin
      PutError(Err_Nalog);
    end;
  end;
end;
procedure TfmLichSchet.GridNalogiDblClick(Sender: TObject);
begin
  btEditNalogClick(nil);
end;

procedure TfmLichSchet.btAddNalogClick(Sender: TObject);
var
  Ic : TIcon;
  Params:TParamsEditSpr;
begin
//  Ic := TIcon.Create;
//  ImageList.GetIcon(INDEX_ADD,Ic);
  Ic:=nil;
//  Params:=TParamsEditSpr.Create;
//  Params.FormatList.Add('<FILEDNAME>=<DISPLAYFORMAT>~<ALIGN=C,L,R>');
//  Params.FormatList.Add('MEN_ID=CHOICE_MEN');
//  Params.FreeOnExitSpr:=true;

  Params:=nil;
// потом переделать на fEditNalog
  EditRecordGrid( GridNalogi, true, Ic, Params);
end;
//-----------------------------------------------------
procedure TfmLichSchet.GridNalogiColumns9GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds:TDataSet;
begin
  if dLich.tbNalogiMEN_ID.IsNull then begin
    Params.Text:='';
  end else begin
    ds:=dmBase.GetMen(fmMain.DateFiks, dLich.tbNalogiMEN_ID.AsString);
    if ds<>nil then begin
      Params.Text:=CreateFIO(ds,'');
    end;
  end;
end;

procedure TfmLichSchet.GridNalogiGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dLich.tbNalogiTYPEOBJ.AsInteger<>_TypeObj_Lich then begin
    AFont.Color:=clBlue;
  end else begin

  end;
end;

end.
