//Очередь
unit fMen;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, NewDialogs, ShellApi, SasaIniFile, uTypes,
  fSimple, Db, ComCtrls, ExtCtrls, TB2Item, TB2Dock, TB2Toolbar, StdCtrls, fChoiceNasel, uCheckKod, uUtilFiles, uProjectALL,
  Mask, DBCtrlsEh, dLichSchet, DBLookupEh, CheckLst, Grids, DBGridEh, fmChList, fMenShort,
  {$IFDEF USE_TEMPLATE}
    mTplInt,mTempl,
  {$ENDIF}
 {$IFDEF VER150} Variants, {$ENDIF}
  SasaDBGrid, kbmMemTable, MetaTask, dbFunc, Buttons, FuncPr, uPadegFIO, dMen, OpisEdit, mPermit,
  vchDBCtrls, DBCtrls, ROPasScript, acPNG;

type
  TfmMen = class(TfmSimple)
    pc: TPageControl;
    tsMain: TTabSheet;
    gbObraz: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edStudent1: TDBLookupComboboxEh;
    edStudent_Type1: TDBLookupComboboxEh;
    edStud_Place: TDBEditEh;
    edStudent_Spr: TDBLookupComboboxEh;
    gbWork: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    edDolg_Name: TDBEditEh;
    edWork_Name: TDBEditEh;
    Label19: TLabel;
    edKurs: TDBEditEh;
    tsMigr: TTabSheet;
    dsMigr: TDataSource;
    Panel1: TPanel;
    gbLgot: TGroupBox;
    Panel2: TPanel;
    gbPrizn: TGroupBox;
    dsPrizn: TDataSource;
    dsLgot: TDataSource;
    edObraz: TDBComboBoxEh;
    Label47: TLabel;
    edWorkTelefon: TDBEditEh;
    pnOsn: TPanel;
    Label29: TLabel;
    edSem: TDBComboBoxEh;
    dsOsobOtm: TDataSource;
    dsKomiss: TDataSource;
    gbPasp: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edLichNomer: TDBEditEh;
    edPasp_Seria: TDBEditEh;
    edPasp_Nomer: TDBEditEh;
    edPasp_Date: TDBDateTimeEditEh;
    edPasp_Organ: TDBEditEh;
    edUdost: TDBComboBoxEh;
    tsOchered: TTabSheet;
    dsSprPostOch: TDataSource;
    dsSprSnOch: TDataSource;
    pnSostavOchered: TPanel;
    Panel4: TPanel;
    btAddMen: TBitBtn;
    btDelMen: TBitBtn;
    pcOchered: TPageControl;
    tsOchSostav: TTabSheet;
    GridSostav: TDBGridEh;
    tsOchLgot: TTabSheet;
    pnOcheredMain: TPanel;
    Label82: TLabel;
    edDecDate: TDBDateTimeEditEh;
    edDecTime: TDBDateTimeEditEh;
    lbNomer: TLabel;
    edNomer: TDBNumberEditEh;
    GridOchered: TDBGridEh;
    Label86: TLabel;
    Label87: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    tsPrim: TTabSheet;
    Panel3: TPanel;
    Label88: TLabel;
    edKolvoSostav: TDBNumberEditEh;
    edTypeHouse: TDBLookupComboboxEh;
    edPloshAll: TDBNumberEditEh;
    edKolvoKomn: TDBNumberEditEh;
    edKolvoPropis: TDBNumberEditEh;
    dsSprTypeHouse: TDataSource;
    dsSostavSem: TDataSource;
    dsOcheredLgot: TDataSource;
    lbDelo: TLabel;
    edDelo: TDBEditEh;
    edResidence: TDBComboBoxEh;
    btEdit: TBitBtn;
    tsDoks: TTabSheet;
    N_F_cbNewSem: TDBCheckBoxEh;
    edStudent: TDBComboBoxEh;
    edStudent_Type: TDBComboBoxEh;
    edIsWork: TDBComboBoxEh;
    Label33: TLabel;
    edDateVip: TDBDateTimeEditEh;
    pnKredit: TPanel;
    Label99: TLabel;
    Label92: TLabel;
    edSubsidDate: TDBDateTimeEditEh;
    edSubsidSumma: TDBNumberEditEh;
    edKreditDate: TDBDateTimeEditEh;
    edKreditSumma: TDBNumberEditEh;
    lbDateS: TLabel;
    edDateS: TDBDateTimeEditEh;
    gbUluch: TGroupBox;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    vchDBText2: TvchDBText;
    Label98: TLabel;
    edNewPloshAll: TDBNumberEditEh;
    edNewKolKomn: TDBNumberEditEh;
    edNew_Date: TDBDateTimeEditEh;
    BitBtn1: TBitBtn;
    edNewDogovor: TDBEditEh;
    Panel7: TPanel;
    TBSubRunOchered: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    TBItemStep4: TTBItem;
    TBItemStep3: TTBItem;
    N_F_cbOchUch: TDBCheckBoxEh;
    Label114: TLabel;
    edDopOchered: TDBEditEh;
    Label115: TLabel;
    edDopDate: TDBDateTimeEditEh;
    edSlugeb: TDBEditEh;
    Label116: TLabel;
    BitBtn2: TBitBtn;
    edSocial: TDBComboBoxEh;
    Image1: TImage;
    dsOcheredResh: TDataSource;
    tsResh: TTabSheet;
    GridResh: TDBGridEh;
    Label20: TLabel;
    N_F_cbSirota: TDBCheckBoxEh;
    Label18: TLabel;
    edCitizen: TDBLookupComboboxEh;
    Label21: TLabel;
    edIN: TDBEditEh;
    Label79: TLabel;
    Label81: TLabel;
    Label83: TLabel;
    edKreditNomer: TDBEditEh;
    Label84: TLabel;
    edResidenceDate: TDBDateTimeEditEh;
    Label74: TLabel;
    edMR_B_RESP: TDBCheckBoxEh;
    edMR_GOSUD: TDBLookupComboboxEh;
    edMR_B_OBL: TDBCheckBoxEh;
    pnFIO: TPanel;
    Label1: TLabel;
    edFam: TDBEditEh;
    Label2: TLabel;
    edName: TDBEditEh;
    Label3: TLabel;
    edOtch: TDBEditEh;
    Button1: TButton;
    edTelefon: TDBEditEh;
    Label5: TLabel;
    edDateR: TDBDateTimeEditEh;
    Label7: TLabel;
    edPol: TDBComboBoxEh;
    Label4: TLabel;
    ImageSpec: TImage;
    pnAdres: TPanel;
    pnZag: TPanel;
    Label38: TLabel;
    TextAdres: TvchDBText;
    btAdres: TBitBtn;
    N_F_cbBezAdresa: TDBCheckBoxEh;
    TextAdres2: TDBEditEh;
    edAdresProp: TDBEditEh;
    pnLoadAdres: TPanel;
    Label75: TLabel;
    Label76: TLabel;
    Label67: TLabel;
    Label22: TLabel;
    Label66: TLabel;
    Label23: TLabel;
    edMR_B_GOROD: TDBLookupComboboxEh;
    edMR_GOROD: TDBEditEh;
    edMR_RAION: TDBEditEh;
    edMR_OBL: TDBEditEh;
    edMR_ULICA: TDBEditEh;
    edMR_KV: TDBEditEh;
    edMR_KORP: TDBEditEh;
    edMR_DOM: TDBEditEh;
    pnTextAdres: TPanel;
    Label24: TLabel;
    edTextAdres: TDBEditEh;
    Label25: TLabel;
    Label26: TLabel;
    edMR_GOROD_RN: TDBEditEh;
    tsSobst: TTabSheet;
    dsSobst: TDataSource;
    GridSobstv: TDBGridEh;
    Label27: TLabel;
    Label28: TLabel;
    edKreditResh: TDBEditEh;
    edSubsidResh: TDBEditEh;
    Label31: TLabel;
    N_F_cbKvartirant: TDBCheckBoxEh;
    Label117: TLabel;
    edDateSrokDN: TDBDateTimeEditEh;
    btIsk2Vkl: TButton;
    btUp: TBitBtn;
    btDown: TBitBtn;
    Panel5: TPanel;
    cbOnly: TDBCheckBoxEh;
    edRegNomer: TDBEditEh;
    lbRegNomer: TLabel;
    Label34: TLabel;
    edTelefonM: TDBEditEh;
    Label32: TLabel;
    edDateLgot: TDBDateTimeEditEh;
    GroupBox2: TGroupBox;
    edDoks: TDBEditEh;
    GroupBox3: TGroupBox;
    edPrim: TDBMemo;
    Label30: TLabel;
    edTail: TDBEditEh;
    Label108: TLabel;
    edGSK: TDBEditEh;
    N_F_cbUchastok: TDBCheckBoxEh;
    edKolvoKomnPr: TDBNumberEditEh;
    Label10: TLabel;
    Label35: TLabel;
    ImageH: TImage;
    ImageU: TImage;
    Label36: TLabel;
    edDoxod: TDBNumberEditEh;
    edIsUchastokDate: TDBDateTimeEditEh;
    Label37: TLabel;
    edDecDateReal: TDBDateTimeEditEh;
    edDatePerereg: TDBDateTimeEditEh;
    Label39: TLabel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    edUchastokDate: TDBDateTimeEditEh;
    N_F_cbMnogo4: TDBCheckBoxEh;
    N_F_cbMnogoI: TDBCheckBoxEh;
    procedure FormShow(Sender: TObject);
    procedure dsMigrDataChange(Sender: TObject; Field: TField);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);  procedure edStud_PlaceEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure edWork_NameEditButtons1Click(Sender: TObject;    var Handled: Boolean);
    procedure edDolg_NameEditButtons1Click(Sender: TObject;    var Handled: Boolean);
    procedure cbVUSClick(Sender: TObject);
    procedure edOTNOSHEditButtons0Click(Sender: TObject;       var Handled: Boolean);
    procedure edPENS_TIPEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure TextAdresGetText(Sender: TObject; var Text: String);
    procedure btAdresClick(Sender: TObject);
    procedure edMR_OBLNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
    procedure edMR_RAIONNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edTypeHouseEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edRegReshEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure pcOcheredChange(Sender: TObject);
    procedure btAddMenClick(Sender: TObject);
    procedure dsSostavSemDataChange(Sender: TObject; Field: TField);
    procedure dsOcheredLgotDataChange(Sender: TObject; Field: TField);
    procedure btDelMenClick(Sender: TObject);
    procedure edPropisClick(Sender: TObject);
    procedure edPresentExClick(Sender: TObject);
    procedure GridOcheredDblClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure edPasp_OrganEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edAdresPropEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure btAddMigrClick(Sender: TObject);
    procedure btDelMigrClick(Sender: TObject);
    procedure vchDBText1GetText(Sender: TObject; var Text: String);
    procedure edAdresPropEditButtons1Click(Sender: TObject;     var Handled: Boolean);
    procedure dsMigrStateChange(Sender: TObject);
    procedure GridMigrExit(Sender: TObject);
    procedure edLichNomerUpdateData(Sender: TObject; var Handled: Boolean);
    procedure N_F_cbBezAdresaClick(Sender: TObject);
    procedure GridOcheredColumns4GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure edAdresGitEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edAdresGitEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure pcChange(Sender: TObject);
    procedure GridMigrGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure vchDBText2GetText(Sender: TObject; var Text: String);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure TBItemStep4Click(Sender: TObject);
    procedure TBItemStep3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure TextAdres2EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure GridReshColumns3GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridReshDblClick(Sender: TObject);
    procedure GridSostavDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dsOcheredReshDataChange(Sender: TObject; Field: TField);
    procedure edResidenceEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure GridReshGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDeloEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure GridSobstvColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridSostavColumns8GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure edDateSrokDNUpdateData(Sender: TObject;
      var Handled: Boolean);
    procedure btIsk2VklClick(Sender: TObject);
    procedure GridSostavGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure btUpClick(Sender: TObject);
    procedure btDownClick(Sender: TObject);
    procedure cbOnlyClick(Sender: TObject);
    procedure GridOcheredColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure N_F_cbUchastokClick(Sender: TObject);
    procedure N_F_cbNewSemClick(Sender: TObject);
    procedure N_F_cbSirotaClick(Sender: TObject);
    procedure edNomerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure GridReshColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
  private
    FEnableVUS_Form: Boolean;
    FEnableOchered_Form: Boolean;
//    procedure AddLabelPlus(Owner: TComponent; Parent : TWinControl; Edit : TDBLookupComboboxEh);
//    procedure LookUpNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
    procedure SetEnableOchered_Form(const Value: Boolean);
    procedure SetEnableVUS_Form(const Value: Boolean);
  public
    FTypeTextAdres:Integer;
    dmMen : TdmMen;
    property EnableOchered_Form : Boolean read FEnableOchered_Form write SetEnableOchered_Form;
    property EnableVUS_Form : Boolean read FEnableVUS_Form write SetEnableVUS_Form;
    {$IFDEF USE_TEMPLATE}
    procedure OnTemplateClick(Sender: TObject);
    {$ENDIF}
    function CheckOchered(nType:Integer): Boolean;
    procedure btAdresSimpleClick(Sender: TObject);
    procedure btAdresVvodClick(Sender: TObject);
    procedure btNewAdresVvodClick(Sender: TObject);

    procedure CheckDecDate;
    procedure CheckOnlyOtdelno;

    function CheckVUS(nType:Integer): Boolean;
    // корректировка из лицевого счета
    function EditForm(slPar:TStringList; strGurnal:String) : Boolean; override;
    function CreateRunTimeProperty : Boolean; override;
    procedure SetLookUp;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    procedure UpdateActions; override;
    function GetdsDopProp : TDataSource; override;
    procedure CheckContFont(cb:TDBCheckBoxEh);
    procedure CheckImageAndFont;

    procedure UserAfterSkip; override;
    procedure CheckControl;
    procedure SetSysCaption;

    function SaveToIni : Boolean; override;
    procedure LoadFromIni; override;

    procedure Event_SetDokument(Sender : TObject);

    procedure Event_ZaprosBankMain(Sender : TObject);
    procedure Event_ZaprosBankSostav(Sender : TObject);
    procedure Event_OpenTmpDir(Sender : TObject);
    procedure Event_ClearTmpDir(Sender : TObject);

  end;

//var
//  fmMen: TfmMen;

implementation

uses fMain, dBase, fAddSprName, fAddAdres, fChoiceAdresS, fChoiceAdres, uProject, fLgotOchered, fShablon, fVvodAdres, fOcheredOper,
  dDokument, IniFiles;

{$R *.DFM}

{ TfmMen }

constructor TfmMen.Create(Owner: TComponent);
var
  it:TTbItem;
  sep:TTbSeparatorItem;
begin
  inherited;

  ActionForClose    := caHide;

  FEnableVUS_Form:=false;          // доступность закладки очередь по умолчанию
  FEnableOchered_Form:=false;      // доступность закладки ВУС по умолчанию

  FSubType:='LIC';

  CheckExit := false;

  CreateEditPriznak(gbLgot, dsLgot, 'LOOKUP_LGOT','NAME');
  CreateEditPriznak(gbPrizn, dsPrizn, 'LOOKUP_PR_MENS','NAME');

  fmMain.ImageList.GetBitmap(118,btEdit.Glyph);
  fmMain.ImageList.GetBitmap(119,btAddMen.Glyph);
  fmMain.ImageList.GetBitmap(120,btDelMen.Glyph);

//  fmMain.ImageList.GetBitmap(119,btAddMigr.Glyph);
//  fmMain.ImageList.GetBitmap(120,btDelMigr.Glyph);

  dsKomiss.DataSet  := dmBase.SprKomiss;
  dsOsobOtm.DataSet := dmBase.SprOsobOtm;

  GlobalTask.CurrentOpisEdit.SetKeyForm(Self,nil);
//  GlobalTask.SetMRUListForm(Self);

//  GlobalTask.SetMRUListForm(Self);
  SetLookUp;
//  AddLabelPlus(Self, pnOsn, edOtnosh);
//  AddLabelPlus(Self, gbPens, edPENS_TIP);
//  AddLabelPlus(Self, gbObraz, edStudent_Spr);
//  AddLabelPlus(Self, gbWork, edDolg_Spr);
//  AddLabelPlus(Self, gbWork, edWork_Spr);
  edWork_Name.EditButtons[1].Glyph   := edStud_Place.EditButtons[1].Glyph;
  edDolg_Name.EditButtons[1].Glyph   := edStud_Place.EditButtons[1].Glyph;
//  edWorkNameVUS.EditButtons[1].Glyph := edStud_Place.EditButtons[1].Glyph;
//  edDolgNameVUS.EditButtons[1].Glyph := edStud_Place.EditButtons[1].Glyph;
  edResidence.EditButtons[0].Glyph   := edStud_Place.EditButtons[1].Glyph;

  edWork_Name.EditButtons[0].Hint := edStud_Place.EditButtons[0].Hint;
  edWork_Name.EditButtons[1].Hint := edStud_Place.EditButtons[1].Hint;
  edDolg_Name.EditButtons[0].Hint := edStud_Place.EditButtons[0].Hint;
  edDolg_Name.EditButtons[1].Hint := edStud_Place.EditButtons[1].Hint;
  edResidence.EditButtons[0].Hint := edStud_Place.EditButtons[1].Hint;

//  lbAdres.Color := edSostSem.Color;
//  lbUchastokVUS.Color := edSostSem.Color;
  pc.ActivePageIndex:=0;
  TBSubmenuTmp.Visible:=LoadTemplate('fmMen');
  OnSetDokument := Event_SetDokument;

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Сформировать запрос в банк';
  it.OnClick:=Event_ZaprosBankMain;
  TBSubmenuRun.Add(it);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Сформировать запрос в банк для члена семьи';
  it.OnClick:=Event_ZaprosBankSostav;
  TBSubmenuRun.Add(it);

  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Открыть папку для временных файлов';
  it.OnClick:=Event_OpenTmpDir;
  TBSubmenuRun.Add(it);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Очистить папку для временных файлов';
  it.OnClick:=Event_ClearTmpDir;
  TBSubmenuRun.Add(it);


end;

{$IFDEF USE_TEMPLATE}
procedure TfmMen.OnTemplateClick(Sender: TObject);
var
  Template: TTemplate;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      Template:=TTemplate(TComponent(Sender).Tag);
      if Template<>nil then begin
        fmMain.TemplateInterface.SetParams(TdmMen(Dokument).DateFiks,
          TdmMen(Dokument).mtDokumentID_INTERNAL.AsInteger,0);
        fmMain.TemplateInterface.SetTemplate(
          fmMain.TemplateInterface.DefaultParameterIniFile,
          fmMain.TemplateInterface.DefaultDatabaseName,
          fmMain.TemplateInterface.DefaultScript,
          Template);
      end;
   end;
end;
{$ENDIF}

{
procedure TfmMen.AddLabelPlus(Owner: TComponent; Parent : TWinControl; Edit : TDBLookupComboboxEh);
var
  lb : TLabel;
begin
  lb :=TLabel.Create(self);
  lb.Name := 'lb_'+Edit.Name;
  lb.Parent := Parent;
  lb.Left := Edit.Left + Edit.Width + 2;
  lb.Top  := Edit.Top+2;
  lb.Font.Style := [];
  lb.Caption := '(+)';
  Edit.OnNotInList := LookUpNotInList;
  Edit.Style := csDropDownEh;
end;
}
function TfmMen.CreateRunTimeProperty: Boolean;
begin
  Result:=true;
end;

procedure TfmMen.SetLookUp;
var
  ds : TDataSource;
begin
  // национальность
//  ds := TDataSource.Create(Self);
//  ds.Name := 'LookUp_Nation';
//  ds.DataSet := dmBase.SprNac;

//  edNation.ListSource := ds;
//  edNation.ListField  := 'NAME';
//  edNation.KeyField   := 'ID';
  // отношение к главе хозяйства
//  ds := TDataSource.Create(Self);
//  ds.Name := 'LookUp_Otnosh';
//  ds.DataSet := dmBase.SprOtnosh;
//  edOTNOSH.ListSource := ds;
//  edOTNOSH.ListField  := 'NAME';
//  edOTNOSH.KeyField   := 'ID';

  {
  // где учиться
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_StudType';
  ds.DataSet := dmBase.SprMestOb;
  edStudent.ListSource := ds;
  edStudent.ListField  := 'NAME';
  edStudent.KeyField   := 'ID';
  // тип обучения
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_TypeObuch';
  ds.DataSet := dmBase.SprFormOb;
  edStudent_Type.ListSource := ds;
  edStudent_Type.ListField  := 'NAME';
  edStudent_Type.KeyField   := 'ID';
  }

  // учебное заведение
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_UchZaved';
  ds.DataSet := dmBase.SprUchZaved;
  edStudent_Spr.ListSource := ds;
  edStudent_Spr.ListField  := 'NAME';
  edStudent_Spr.KeyField   := 'ID';
  // места работы
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_Work';
  ds.DataSet := dmBase.SprWork;
//  edWork_Spr.ListSource := ds;
//  edWork_Spr.ListField  := 'NAME';
//  edWork_Spr.KeyField   := 'ID';
  // Должности
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_Dolg';
  ds.DataSet := dmBase.SprDolg;
//  edDolg_Spr.ListSource := ds;
//  edDolg_Spr.ListField  := 'NAME';
//  edDolg_Spr.KeyField   := 'ID';

  // Тип пенсии
//  ds := TDataSource.Create(Self);
//  ds.Name := 'LookUp_TypePens';
//  ds.DataSet := dmBase.SprTypePens;
//  edPENS_TIP.ListSource := ds;
//  edPENS_TIP.ListField  := 'NAME';
//  edPENS_TIP.KeyField   := 'ID';

  // Гражданство
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_Strana';
  ds.DataSet := dmBase.SprStran;
  edCitizen.ListSource := ds;
  edCitizen.ListField  := 'NAME';
  edCitizen.KeyField   := 'ID';
end;

procedure TfmMen.UpdateActions;
begin
  inherited;
//  if dmMen.EditFromLichSchet then begin
//    TBItemCancel.Enabled := false;
//  end else begin
//    TBItemCancel.Enabled := true;
//  end;
//  btIsk2Vkl.Enabled:=ActiveControl=GridSostav;
  if TdmMen(Dokument).mtDokumentSTUDENT_SPR.AsString='' then begin // .FieldByName('STUDENT_SPR').AsString='' then begin
    if edStud_Place.Font.Style <> []
      then edStud_Place.Font.Style := [];
  end else begin
    if edStud_Place.Font.Style <> [fsBold]
      then edStud_Place.Font.Style := [fsBold];
  end;
  if TdmMen(Dokument).mtDokumentWORK_SPR.AsString='' then begin
    if edWork_Name.Font.Style <> [] then begin
      edWork_Name.Font.Style := [];
//      edWorkNameVUS.Font.Style := [];
    end;
  end else begin
    if edWork_Name.Font.Style <> [fsBold] then begin
      edWork_Name.Font.Style := [fsBold];
//      edWorkNameVUS.Font.Style := [fsBold];
    end;
  end;
  if TdmMen(Dokument).mtDokumentDOLG_SPR.AsString='' then begin
    if edDolg_Name.Font.Style <> [] then begin
      edDolg_Name.Font.Style := [];
//      edDolgNameVUS.Font.Style := [];
    end;
  end else begin
    if edDolg_Name.Font.Style <> [fsBold] then begin
      edDolg_Name.Font.Style := [fsBold];
//      edDolgNameVUS.Font.Style := [fsBold];
    end;
  end;
  {
  if TdmMen(Dokument).mtDokumentREG_OSNOV.AsString='' then begin
    if edPostOsn.Font.Style <> [] then begin
      edPostOsn.Font.Style := [];
    end;
  end else begin
    if edPostOsn.Font.Style <> [fsBold] then begin
      edPostOsn.Font.Style := [fsBold];
    end;
  end;
  if TdmMen(Dokument).mtDokumentREG_OSNOV2.AsString='' then begin
    if edPostOsn2.Font.Style <> [] then begin
      edPostOsn2.Font.Style := [];
    end;
  end else begin
    if edPostOsn2.Font.Style <> [fsBold] then begin
      edPostOsn2.Font.Style := [fsBold];
    end;
  end;
  }
end;

procedure TfmMen.FormShow(Sender: TObject);
begin
//  pc.ActivePageIndex:=0;
//  ActiveControl := edFam;
end;

//-----------------------------------------------------------------
procedure TfmMen.dsMigrDataChange(Sender: TObject; Field: TField);
begin
  if field<>nil then begin
    QueryExit := true;
    if field.FIeldName='DATE' then begin
      field.DataSet.FieldByName('ORGAN').AsString := GlobalTask.ParamAsString('NAME');
    end;
  end;
end;

procedure TfmMen.GridMigrExit(Sender: TObject);
begin
  dsMigr.DataSet.CheckBrowseMode;
  if dmMen.mtDokument.State<>dsEdit then dmMen.mtDokument.Edit;
//  dmMen.mtDokumentTYPEREG.AsString:=dmMen.CheckTypeReg;
end;

procedure TfmMen.dsMigrStateChange(Sender: TObject);
//var
//  s:String;
begin
{
  case dsMigr.DataSet.State of
    dsInactive : s:='dsInactive';
    dsBrowse   : s:='dsBrowse';   //	Data can be viewed, but not changed. This is the default state of an open dataset.
    dsEdit     : s:='dsEdit'; //	Active record can be modified.
    dsInsert   : s:='dsInsert';//	The active record is a newly inserted buffer that has not been posted. This record can be modified and then either posted or discarded.
    dsSetKey   : s:='dsSetKey';//	TTable and TClientDataSet only. Record searching is enabled, or a SetRange operation is under way. A restricted set of data can be viewed, and no data can be edited or inserted.
    dsCalcFields: s:='dsCalcFields';//	An OnCalcFields event is in progress. Noncalculated fields cannot be edited, and new records cannot be inserted.
    dsFilter	: s:='dsFilter';//An OnFilterRecord event is in progress. A restricted set of data can be viewed. No data can edited or inserted.
    dsNewValue: s:='dsNewValue'; //	Temporary state used internally when a field component’s NewValue property is accessed.
    dsOldValue: s:='dsOldValue';//	Temporary state used internally when a field component’s OldValue property is accessed.
    dsCurValue: s:='dsCurValue'; //	Temporary state used internally when a field component’s CurValue property is accessed.
    dsBlockRead: s:='dsBlockRead'; //	Data-aware controls are not updated and events are not triggered when moving to the next record.
    dsInternalCalc: s:='dsInterCalc';//	Temporary state used internally when values need to be calculated for a field that has a FieldKind of fkInternalCalc.
    dsOpening : s:='dsOpening';//	DataSet is in the process of opening but has not finished. This state occurs when the dataset is opened for asynchronous fetching.
 else
   s:='None state';
 end;
 showmessage(s);
}
end;

//----------------------------------------------------------------
function TfmMen.CheckOchered(nType:Integer): Boolean;
var
  s:String;
begin
  tsOchered.TabVisible := true;
  if GlobalTask.ParamAsBoolean('OCH_NOMER') then begin
    lbNomer.Visible:=true;
    edNomer.Visible:=true;
  end else begin
    lbNomer.Visible:=false;
    edNomer.Visible:=false;
  end;
  s:=GlobalTask.ParamAsString('NAME_DELO');
  if s='' then s:='Номер дела';
  lbDelo.Caption:=s;
  edDelo.Left:=lbDelo.Left+lbDelo.Width+10;

  if GlobalTask.ParamAsBoolean('OCH_REGNOMER') then begin
    lbRegNomer.Visible:=true;
    edRegNomer.Visible:=true;
  end else begin
    lbRegNomer.Visible:=false;
    edRegNomer.Visible:=false;
  end;
//  if GlobalTask.ParamAsBoolean('OCH_DELO') then begin
//    lbDelo.Visible:=true;
//    edDelo.Visible:=true;
//  end else begin
//    lbDelo.Visible:=false;
//    edDelo.Visible:=false;
// end;
  if FTypeTextAdres=0 then begin  // не показывать TEXT_ADRES
    btAdres.Visible:=true;
    TextAdres2.Visible:=false;
//    pnZag.Height:=TextAdres2.Top;
  end else if (FTypeTextAdres=1) or (FTypeTextAdres=2) then begin  // показывать и то и другое
    btAdres.Visible:=true;
    TextAdres2.Visible:=true;
    TextAdres2.Top:=TextAdres.Top+TextAdres.Height+5;
  end else if (FTypeTextAdres=3) then begin  // только TEXT_ADRES
    btAdres.Visible:=false;
    TextAdres2.Visible:=true;
    if TextAdres2.Top<>TextAdres.Top
      then TextAdres2.Top:=TextAdres.Top;
  end;
  Result:=true;
end;

//---------------------------------------------------------------
function TfmMen.CheckVUS(nType: Integer): Boolean;
begin
//  tsVUS.TabVisible := false;
{
  if (Role.CheckSubSystem(SS_VUS)<>ptDeniedAccess) and EnableVUS_Form then begin
    if not TdmMen(Dokument).mtDokumentVUS.AsBoolean then begin
      tsVUS.TabVisible := false;
    end else begin
      tsVUS.TabVisible := true;
    end;
  end else begin
    tsVUS.TabVisible := false;
  end;
  Result:=true;
}
end;

//-----------------------------------------------------------------
function TfmMen.EditForm(slPar:TStringList; strGurnal:String): Boolean;
var
  i,nAdresID,n : Integer;
  sValue,sName : String;
  lOchered, lVus : Boolean;
begin
  AssignPar(slPar);
  FTypeTextAdres:=GlobalTask.ParamAsInteger('TEXT_ADRES');
  case GlobalTask.ParamAsInteger('SIMPLE_ADRES') of
    0: btAdres.OnClick:=btAdresClick;
    1: btAdres.OnClick:=btAdresSimpleClick;
    2: btAdres.OnClick:=btAdresVvodClick;
  else
    btAdres.OnClick:=btAdresClick;
  end;
  Result := false;
  FGurnal:=strGurnal;  // журнал из которого открыли форму
  nAdresID:=-1;

  NameCurGurnal:=FGurnal;   // для того что-бы в скрипте можно было обратиться из какого журнала открыта форма
//  lOchered:=false;
//  lVus:=true;
//  TBSubRunOchered.Visible:=true;
  if (slPar<>nil) and (slPar.Count>0) then begin
    dmMen.FListPar:=slPar;
    for i:=0 to slPar.Count-1 do begin
      sValue := UpperCase(slPar.ValueFromIndex[i]);
      sName  := UpperCase(slPar.Names[i]);
      if sName='ENABLEOCHERED' then begin
  //      if sValue='1'
  //        then lOchered:=true
  //        else lOchered:=false;
      end else if sName='ENABLEVUS' then begin
//        if sValue='1'
//          then lVUS:=true
//          else lVUS:=false;
      end else if sName='PAGEINDEX' then begin
        if IsAllDigit(sValue) then begin
          pc.ActivePageIndex := StrToInt(sValue);
        end else begin
          if sValue='TSMAIN' then begin
            pc.ActivePageIndex:=0;
          end else if sValue='TSVUS' then begin
            pc.ActivePageIndex:=3;
          end else if sValue='TSOCHERED' then begin
            pc.ActivePageIndex:=4;
          end;
        end;
      end else if sName='MEN_NOTPROPIS' then begin
        TdmMen(Dokument).LicID:=0;
      end else if sName='NEW_NOMER_OCH' then begin
        if sValue='1' then begin
          Dokument.mtDokument.CheckBrowseMode;
          Dokument.mtDokument.Edit;
//          dmMen.mtDokumentNOMER_OCH.AsInteger:=dmBase.NewNomerOchered(0);
          n:=0;
          if GlobalTask.ParamAsBoolean('AUTO_DELO')
            then n:=dmBase.Och_GetNextNDELO;
          if n>0
            then dmMen.mtDokumentDELO.AsString:=intToStr(n);
          Dokument.mtDokument.Post;
        end;
      end else if sName='MEN_ADD' then begin
//        TBSubRunOchered.Visible:=false;
      end else if sName='ADRES_ID' then begin
        nAdresID:=StrToInt(sValue);
      end;
    end;
  end;

  lOchered:=true;
  lVus:=false;

  tsMigr.TabVisible:=false;
//  tsVUS.TabVisible:=false;
//  tsAdd.TabVisible:=false;

  tsOchered.TabVisible:=true;
  pc.ActivePageIndex := 0;

  EnableVus_Form:=lVus;
  EnableOchered_Form:=lOchered;

//  if Dokument.mtDokument.FieldbyName('VUS').AsBoolean then begin
//    EnableVus_Form:=lVus;
//  end;

  CheckOchered(0);
  CheckControl;
  CheckVUS(0);

  SetLength(FArrZakl,0);
//  if tsVUS.TabVisible then begin
//    SetLength(FArrZakl,Length(FArrZakl)+1);
//    FArrZakl[Length(FArrZakl)-1]:='VUS';
//   end;
  if tsOchered.TabVisible then begin
    SetLength(FArrZakl,Length(FArrZakl)+1);
    FArrZakl[Length(FArrZakl)-1]:='OCH';
  end;
//  if dmMen.EditFromLichSchet then FSubType:='LIC'
//                             else FSubType:='OTD';
  FSubType:='OTD';

  if GetNameReport='' then begin
    TBItemPreView.Visible:=false;
    TBItemPrint.Visible:=false;
  end else begin
    TBItemPreView.Visible:=true;
    TBItemPrint.Visible:=true;
  end;

  TBSubmenuTmp.Visible:=LoadTemplate('fmMen');

  Dokument.mtDokument.CheckBrowseMode;
  Dokument.mtDokument.Edit;
  // когда заводим нового человека из нового лицевого счета у людей еще ADRES_ID не заполнен
  if nAdresID>-1 then begin
    dmMen.mtDokumentADRES_ID.AsInteger:=nAdresID;
  end;

//  if Role.SystemAdmin then begin
//    Label70.Visible:=true;
//    edDateSrok.Visible:=true;
//  end;

  QueryExit:=false;
  if GetParam('RUN_REPORT','0')='1' then begin
    RunReport;
  end;

  if IsShowEdit then begin
    CheckOnlyOtdelno;
    SetSysCaption;
    TBItemStep1.Checked:=false;
    TBItemStep2.Checked:=false;
    TBItemStep3.Checked:=false;
    TBItemStep3.Visible:=false;
    TBItemStep4.Checked:=false;
    CheckImageAndFont;
    CheckDecDate;
    if ShowModal = mrOk then begin
      Result := true;
    end;
  end;
  dmMen.FListPar:=nil;
end;
{
procedure TfmMen.LookUpNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
var
  ed : TDBLookupComboboxEh;
  f  : TfmAddSprName;
begin
  if NewText <> '' then begin
  ed := TDBLookupComboboxEh(Sender);
  f := TfmAddSprName.Create(nil);
  f.edNew.Text := NewText;
  if f.ShowModal = mrOk then begin
    NewText := Trim(f.edNew.Text);
  end else begin
    NewText := '';
  end;
  try
    if NewText <> '' then begin
      ed.ListSource.DataSet.Append;
      ed.ListSource.DataSet.FieldByName('NAME').AsString := NewText;
      ed.ListSource.DataSet.Post;
      RecheckInList := true;
    end;
  finally
    f.Free;
  end;
  end;
end;
}
function TfmMen.GetdsDopProp: TDataSource;
begin
  Result := nil;
end;
//-------------------------------------------------------------
procedure TfmMen.CheckOnlyOtdelno;
var
  s:String;
begin
  if dmMen.tbOcheredLgot.RecordCount>0 then begin
    s:=dmMen.tbOcheredLgot.BookMark;
    if dmMen.tbOcheredLgot.Locate('OCHERED_ID', OCHERED_SOCIAL, []) then begin
      cbOnly.Enabled:=true;
    end else begin
      cbOnly.Enabled:=false;
    end;
    dmMen.tbOcheredLgot.BookMark:=s;
  end else begin
    cbOnly.Enabled:=false;
  end;
  if (cbOnly.Enabled=false) and (dmMen.mtDokumentONLY.AsBoolean=true) then begin
    EditDataSet(dmMen.mtDokument);
    dmMen.mtDokumentONLY.AsBoolean:=false;
  end;
end;
//-------------------------------------------------------------
procedure TfmMen.CheckContFont(cb:TDBCheckBoxEh);
begin
  if cb.Checked  then begin
    if cb.Font.Color<>clRed then cb.Font.Color:=clRed;
  end else begin
    if cb.Font.Color<>clWindowText then cb.Font.Color:=clWindowText;
  end;
end;
//----------------------------------------------------------------------------------
procedure TfmMen.CheckImageAndFont;
var
  lGsk,lUch:Boolean;
begin
  lGsk:=(dmMen.mtDokumentGSK_ID.Asinteger>0) or (edGSK.Text<>'');
  lUch:=N_F_cbUchastok.Checked;
  if lGsk and lUch then begin
    ImageH.Visible:=true;
    ImageU.Visible:=true;
    ImageU.Left:=800;
  end else if lGsk then begin
    ImageH.Visible:=true;
    ImageU.Visible:=false;
  end else if lUch then begin
    ImageH.Visible:=false;
    ImageU.Visible:=true;
    ImageU.Left:=840;
  end else begin
    ImageH.Visible:=false;
    ImageU.Visible:=false;
  end;
  CheckContFont(N_F_cbNewSem);
  CheckContFont(N_F_cbSirota);
  CheckContFont(N_F_cbMnogo4);
  CheckContFont(N_F_cbMnogoI);
end;

//-------------------------------------------------------------
procedure TfmMen.CheckDecDate;
var
  s:TBookmarkStr;
  l,lOk:Boolean;
begin
  lOk:=false;
  l:=dbDisableControls(dmMen.tbOcheredResh);
  s:=dmMen.tbOcheredResh.Bookmark;
  dmMen.tbOcheredResh.First;
  while not dmMen.tbOcheredResh.Eof do begin
    if (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_PERENOS) or
       ( (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_POST) and dmMen.tbOcheredReshRAZD.AsBoolean ) then begin
      lOk:=true;
    end;
    dmMen.tbOcheredResh.Next;
  end;
  dmMen.tbOcheredResh.Bookmark:=s;
  dbEnableControls(dmMen.tbOcheredResh,l);

  if N_F_cbSirota.Checked or lOk then begin
    edDecDate.Color:=clWindow;
    edDecDate.ReadOnly:=false;
  end else begin
    edDecDate.Color:=clInfoBk;
    edDecDate.ReadOnly:=true;
  end;
end;

//-------------------------------------------------------------
procedure TfmMen.dsDokumentDataChange(Sender: TObject; Field: TField);
var
  vResult : Variant;
begin
  inherited;
  if Dokument<>nil then begin
    if not FRun and not Dokument.IsReadDokument then begin
      FRun:=true;
      if (Field=nil) then begin
        {$IFDEF OCHERED}
  //      lbAdres.Caption       :=  TdmMen(Dokument).AdresAndTelefon;
  //      lbUchastokVUS.Caption :=  Globaltask.ParamAsString('UCHASTOK');
        if dmMen.mtDokumentONLY.AsBoolean then begin
          ImageSpec.Visible:=true;
          ImageSpec.Hint := 'Только отдельная очередь';
        end else begin
          ImageSpec.Visible:=false;
          ImageSpec.Hint := '';
        end;
        {$ELSE}
        if dmMen.mtDokumentSPEC_UCH.AsBoolean then begin
          ImageSpec.Visible:=true;
          ImageSpec.Hint := 'Специальный контингент';
        end else begin
          ImageSpec.Visible:=false;
          ImageSpec.Hint := '';
        end;
        {$ENDIF}
      end;
      if Field<>nil then begin
        vResult := null;
        if (Field.FieldName='NEWSEM') or (Field.FieldName='SIROTA') or (Field.FieldName='MNOGO_4') or (Field.FieldName='MNOGO_I') or
           (Field.FieldName='GSK_ID') or (Field.FieldName='GSK') or (Field.FieldName='UCHASTOK') then begin
          CheckImageAndFont;
          CheckDecDate;
        end else if (Field.FieldName='DEC_DATE_REAL') then begin
          if edDecDate.ReadOnly then begin
            dmMen.mtDokumentDEC_DATE.AsVariant:=Field.Value;
          end else begin
            if dmMen.mtDokumentDEC_DATE.IsNull and not Field.IsNull
              then dmMen.mtDokumentDEC_DATE.AsVariant:=Field.Value;
          end;
        end;
        RunFuncScript('MEN_ANYCORR', [Field.FieldName], vResult);
      end;
      FRun:=false;
    end;
  end;
end;

procedure TfmMen.edStud_PlaceEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
  EditDataSet(Dokument.mtDokument);
  Dokument.mtDokument.FieldByName('STUDENT_SPR').AsString := '';
  Dokument.mtDokument.FieldByName('STUD_PLACE').AsString  := '';
end;
procedure TfmMen.edWork_NameEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
  EditDataSet(Dokument.mtDokument);
  Dokument.mtDokument.FieldByName('WORK_SPR').AsString := '';
  Dokument.mtDokument.FieldByName('WORK_NAME').AsString  := '';
end;
procedure TfmMen.edDolg_NameEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
  EditDataSet(Dokument.mtDokument);
  Dokument.mtDokument.FieldByName('DOLG_SPR').AsString := '';
  Dokument.mtDokument.FieldByName('DOLG_NAME').AsString  := '';
end;

procedure TfmMen.cbVUSClick(Sender: TObject);
begin
//  if SystemProg.EnableVUS then begin
//    tsVUS.TabVisible := cbVUS.Checked;
//  end;
end;

procedure TfmMen.edOTNOSHEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_OTNOSH', 'OTNOSH', false);
  Handled := true;
end;

procedure TfmMen.edPENS_TIPEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_TYPEPENS', 'PENS_TIP', false);
  Handled := true;
end;

procedure TfmMen.TextAdresGetText(Sender: TObject; var Text: String);
begin
 if not Dokument.IsReadDokument then begin
  if dmMen.mtDokumentADRES_ID.AsInteger>0 then begin
    TextAdres.Font.Color:=clBlack;
    Text := dmBase.AdresFromID( Dokument.DateFiks, dmMen.mtDokumentADRES_ID.AsString );
  end else begin  // для тех кто проживает не в сельском совет
    TextAdres.Font.Color:=clBlue;
    Text := dmMen.GetAddAdresProp;     
  end;
  {$IFNDEF OCHERED}
  if not dmMen.EditFromLichSchet and (dmMen.LicID>0) then begin
    if dmBase.tbLich.Locate('DATE_FIKS;ID',VarArrayOf([dmMen.DateFiks,dmMen.LicID]),[]) then begin
      s:=dmBase.tbLich.FieldbyName('NOMER').AsString;
    end else begin
      s:='неизв.';
    end;
    Text:='Лиц.счет:'+s+', '+Text;                
  end;
  {$ENDIF}
 end;
end;

procedure TfmMen.btAdresSimpleClick(Sender: TObject);
var
  lErr : Boolean;
  fl:Extended;
  n:Integer;
begin
  if fmChoiceAdresS= nil then begin
    fmChoiceAdresS := TfmChoiceAdresS.Create(nil);
  end;
  fmChoiceAdresS.DateFiks := Dokument.DateFiks;
  dsDokument.DataSet.CheckBrowseMode;
  if fmChoiceAdresS.EditAdres then begin
    dmMen.mtDokument.Edit;
    dmMen.mtDokumentADRES_ID.AsInteger:=fmChoiceAdresS.IDAdres;

    fl:=dmBase.ReadPropAsFloat(fmMain.DateFiks, dmMen.mtDokumentADRES_ID.AsInteger, 'PLOSH_ALL');
    if fl>0
      then dmMen.mtDokumentPLOSH_ALL.AsFloat:=fl
      else dmMen.mtDokumentPLOSH_ALL.AsString:='';

    n:=dmBase.ReadPropAsInteger(fmMain.DateFiks, dmMen.mtDokumentADRES_ID.AsInteger, 'KOL_KOMN');
    if n>0
      then dmMen.mtDokumentKOLVO_KOMN_PR.AsInteger:=n
      else dmMen.mtDokumentKOLVO_KOMN_PR.AsString:='';

    dmMen.mtDokumentBEZADRESA.AsBoolean:=false;
    dmMen.mtDokumentKATEG.AsInteger:=LIC_REG;
    if (FTypeTextAdres=0) or (FTypeTextAdres=1) then begin
      dmMen.mtDokumentTEXT_ADRES.AsString:='';
    end;
    dmMen.mtDokument.Post;
    if dmMen.EditFromLichSchet then begin
      TdmLichSchet(Dokument).ReadPropAdres(lErr);
    end;
    CheckControl;
  end;
end;

procedure TfmMen.btAdresVvodClick(Sender: TObject);
var
  adr : TAdres;
  strErr : String;
  n,m : Integer;
  lErr:Boolean;
  fl:Extended;
begin
  dsDokument.DataSet.CheckBrowseMode;
  if dmMen.mtDokumentADRES_ID.AsInteger>0 then begin
    dmBase.AdresFromID(Dokument.DateFiks, dmMen.mtDokumentADRES_ID.AsString, false);
    adr.PunktKod:=dmBase.Adres_PunktKod;
    adr.UlicaInt:=dmBase.Adres_UlKod;
    adr.NDom:=dmBase.Adres_NDom;
    adr.Korp:=dmBase.Adres_Korp;
    adr.Kv:=dmBase.Adres_Kv;
  end else begin                             
    adr.PunktKod:=1;
    adr.UlicaInt:=0;
    adr.NDom:='';
    adr.Korp:='';
    adr.Kv:='';
  end;
  adr.NotDom:=false;
  adr.NameHouse:='';
  {$IFDEF GKH}
    if IsAccountRnGor
      then adr.RnGor:=GlobalTask.ParamAsInteger('RN_GOROD');
      else adr.RnGor:=0;
  {$ELSE}
    adr.RnGor:=0;
  {$ENDIF}
  n:=AddNewAdres2(Dokument.DateFiks,adr,strErr,false,'Адрес;Выбрать');
  if (n=0) or (n=1) then begin
    dmMen.mtDokument.Edit;
    dmMen.mtDokumentADRES_ID.AsInteger:=adr.AdresID;

    fl:=dmBase.ReadPropAsFloat(fmMain.DateFiks, dmMen.mtDokumentADRES_ID.AsInteger, 'PLOSH_ALL');
    if fl>0
      then dmMen.mtDokumentPLOSH_ALL.AsFloat:=fl
      else dmMen.mtDokumentPLOSH_ALL.AsString:='';

    m:=dmBase.ReadPropAsInteger(fmMain.DateFiks, dmMen.mtDokumentADRES_ID.AsInteger, 'KOL_KOMN');
    if m>0
      then dmMen.mtDokumentKOLVO_KOMN_PR.AsInteger:=m
      else dmMen.mtDokumentKOLVO_KOMN_PR.AsString:='';

//    dmMen.mtDokumentPLOSH_ALL.AsFloat:=dmBase.ReadPropAsFloat(fmMain.DateFiks, dmMen.mtDokumentADRES_ID.AsInteger, 'PLOSH_ALL');
//    dmMen.mtDokumentKOLVO_KOMN_PR.AsInteger:=dmBase.ReadPropAsInteger(fmMain.DateFiks, dmMen.mtDokumentADRES_ID.AsInteger, 'KOL_KOMN');

    dmMen.mtDokumentBEZADRESA.AsBoolean:=false;
    dmMen.mtDokumentKATEG.AsInteger:=LIC_REG;
    if (FTypeTextAdres=0) or (FTypeTextAdres=1) then begin
      dmMen.mtDokumentTEXT_ADRES.AsString:='';
    end;
    dmMen.mtDokument.Post;
    if dmMen.EditFromLichSchet then begin
      TdmLichSchet(Dokument).ReadPropAdres(lErr);
    end;
    CheckControl;
  end;
end;

procedure TfmMen.btAdresClick(Sender: TObject);
var
  lErr : Boolean;
  fl:Extended;
  n:Integer;
begin
  if fmChoiceAdres= nil then begin
    fmChoiceAdres := TfmChoiceAdres.Create(nil);
  end;
  fmChoiceAdres.DateFiks := Dokument.DateFiks;
  fmChoiceAdres.ChoiceLich := false;
  dmMen.mtDokument.CheckBrowseMode;
  if (fmChoiceAdres.ShowModal = mrOk) and (fmChoiceAdres.IDAdres>0) then begin
    dmMen.mtDokument.Edit;
    dmMen.mtDokumentADRES_ID.AsInteger:=fmChoiceAdres.IDAdres;
    dmMen.mtDokumentADRES_PROP.AsString:='';

    fl:=dmBase.ReadPropAsFloat(fmMain.DateFiks, dmMen.mtDokumentADRES_ID.AsInteger, 'PLOSH_ALL');
    if trunc(fl)>0
      then dmMen.mtDokumentPLOSH_ALL.AsFloat:=fl
      else dmMen.mtDokumentPLOSH_ALL.AsString:='';

    n:=dmBase.ReadPropAsInteger(fmMain.DateFiks, dmMen.mtDokumentADRES_ID.AsInteger, 'KOL_KOMN');
    if n>0
      then dmMen.mtDokumentKOLVO_KOMN_PR.AsInteger:=n
      else dmMen.mtDokumentKOLVO_KOMN_PR.AsString:='';

//    dmMen.mtDokumentPLOSH_ALL.AsFloat:=dmBase.ReadPropAsFloat(fmMain.DateFiks, dmMen.mtDokumentADRES_ID.AsInteger, 'PLOSH_ALL');
//    dmMen.mtDokumentKOLVO_KOMN_PR.AsInteger:=dmBase.ReadPropAsInteger(fmMain.DateFiks, dmMen.mtDokumentADRES_ID.AsInteger, 'KOL_KOMN');

    dmMen.mtDokumentBEZADRESA.AsBoolean:=false;
    dmMen.mtDokumentKATEG.AsInteger:=LIC_REG;
    if (FTypeTextAdres=0) or (FTypeTextAdres=1) then begin
      dmMen.mtDokumentTEXT_ADRES.AsString:='';
    end;
    dmMen.mtDokument.Post;
//    if dmMen.EditFromLichSchet then begin
//      TdmLichSchet(Dokument).ReadPropAdres(lErr);
//    end;
    CheckControl;
  end;
end;
//--------------------------------------------------------------------------------------
procedure TfmMen.TextAdres2EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if dmMen.mtDokumentADRES_ID.AsInteger>0 then begin
    dmMen.mtDokument.Edit;
    if (FTypeTextAdres=0) or (FTypeTextAdres=1) then begin
      dmMen.mtDokumentTEXT_ADRES.AsString:='';
    end;
    dmMen.mtDokument.Post;
  end else begin
    PutError('Выберите адрес проживания.',self);
  end;
end;

//------------------------------------------------------------------
procedure TfmMen.btNewAdresVvodClick(Sender: TObject);
var
  adr : TAdres;
  strErr : String;
  n,m : Integer;
  lErr:Boolean;
  fl:Extended;
begin
  dsDokument.DataSet.CheckBrowseMode;
  if dmMen.mtDokumentNEW_ADRES_ID.AsInteger>0 then begin
    dmBase.AdresFromID(Dokument.DateFiks, dmMen.mtDokumentNEW_ADRES_ID.AsString, false);
    adr.PunktKod:=dmBase.Adres_PunktKod;
    adr.UlicaInt:=dmBase.Adres_UlKod;
    adr.NDom:=dmBase.Adres_NDom;
    adr.Korp:=dmBase.Adres_Korp;
    adr.Kv:=dmBase.Adres_Kv;
  end else begin
    adr.PunktKod:=1;
    adr.UlicaInt:=0;
    adr.NDom:='';
    adr.Korp:='';
    adr.Kv:='';
  end;
  adr.NotDom:=false;
  adr.NameHouse:='';
  {$IFDEF GKH}
    if IsAccountRnGor
      then adr.RnGor:=GlobalTask.ParamAsInteger('RN_GOROD');
      else adr.RnGor:=0;
  {$ELSE}
    adr.RnGor:=0;
  {$ENDIF}
  n:=AddNewAdres2(Dokument.DateFiks,adr,strErr,false,'Адрес;Выбрать');
  if (n=0) or (n=1) then begin
    EditDataSet(dmMen.mtDokument);
    dmMen.mtDokumentNEW_ADRES_ID.AsInteger:=adr.AdresID;
    fl:=dmBase.ReadPropAsFloat(fmMain.DateFiks, adr.AdresID, 'PLOSH_ALL');
    if trunc(fl)>0 then dmMen.mtDokumentNEW_PLOSH_ALL.AsFloat:=fl
                   else dmMen.mtDokumentNEW_PLOSH_ALL.AsString:='';
    fl:=dmBase.ReadPropAsFloat(fmMain.DateFiks, adr.AdresID, 'PLOSH_GIL');
    if trunc(fl)>0 then dmMen.mtDokumentNEW_PLOSH_GIL.AsFloat:=fl
                   else dmMen.mtDokumentNEW_PLOSH_GIL.AsString:='';
    n:=dmBase.ReadPropAsInteger(fmMain.DateFiks, adr.AdresID, 'KOL_KOMN');
    if n>0  then dmMen.mtDokumentNEW_KOLVO_KOMN.AsInteger:=n
            else dmMen.mtDokumentNEW_KOLVO_KOMN.AsString:='';
  end;
end;

//--------------------------------------------------------------------------------------
procedure TfmMen.CheckControl;
begin
  if pnAdres.Height<>pnZag.Height then  pnAdres.Height:=pnZag.Height;
  // загруженная информация
  if (dmMen.mtDokumentID_BASE.AsInteger>0) then begin //  and (dmMen.mtDokumentADRES_ID>0)
    pnZag.Visible:=false;
    if dmMen.mtDokumentTEXT_ADRES.AsString<>'' then begin
      if not pnTextAdres.Visible    then pnTextAdres.Visible:=true;
      if     pnLoadAdres.Visible    then pnLoadAdres.Visible:=false;
    end else begin
      if     pnTextAdres.Visible    then pnTextAdres.Visible:=false;
      if not pnLoadAdres.Visible    then pnLoadAdres.Visible:=true;
    end;
  end else begin
    if pnLoadAdres.Visible     then pnLoadAdres.Visible:=false;
    if pnTextAdres.Visible     then pnTextAdres.Visible:=false;
    if not pnZag.Visible       then pnZag.Visible:=true;

    N_F_cbBezAdresa.Visible :=true;
    if dmMen.mtDokumentKATEG.AsInteger=BEZ_ADRESA then begin
      edAdresprop.Parent:=pnZag;
      edAdresprop.Left:=TextAdres.Left;
      edAdresprop.Top:=TextAdres.Top;
      edAdresprop.Width:=TextAdres.Width;
      btAdres.Visible := false;
    end else begin
      edAdresprop.Parent:=tsMigr; //pnNotReg;
      edAdresprop.Width:=TextAdres.Width;
      btAdres.Visible := true;
    end;
    if (FTypeTextAdres=1) then begin
      if (dmMen.mtDokumentADRES_ID.AsInteger=0) then begin
        TextAdres2.Visible:=true;
      end else begin
        TextAdres2.Visible:=false;
      end;
    end;
  end;

  CheckControlHist;

end;

procedure TfmMen.edPropisClick(Sender: TObject);
begin
  if (dmMen<>nil) and not dmMen.IsReadDokument
    then CheckControl;
end;

procedure TfmMen.edPresentExClick(Sender: TObject);
begin
  if (dmMen<>nil) and not dmMen.IsReadDokument
    then CheckControl;
end;

procedure TfmMen.UserAfterSkip;
begin
//  EditDataSet(Dokument.mtDokument);
  CheckControl;
  CheckOnlyOtdelno;
//  CheckOchered(0);
//  CheckVUS(0);
  if GetNameReport='' then begin
    TBItemPreView.Visible:=false;
    TBItemPrint.Visible:=false;
  end else begin
    TBItemPreView.Visible:=true;
    TBItemPrint.Visible:=true;
  end;
  SetLength(FArrZakl,0);
//  if tsVUS.TabVisible then begin
//    SetLength(FArrZakl,Length(FArrZakl)+1);
//    FArrZakl[Length(FArrZakl)-1]:='VUS';
//   end;
  if tsOchered.TabVisible then begin
    SetLength(FArrZakl,Length(FArrZakl)+1);
    FArrZakl[Length(FArrZakl)-1]:='OCH';
  end;
  TBSubmenuTmp.Visible:=LoadTemplate('fmMen');
  SetSysCaption;
  CheckImageAndFont;
  CheckDecDate;
//  PostDataSet(Dokument.mtDokument);
//  QueryExit := false;
end;
//----------------------------------------------------------
procedure TfmMen.SetSysCaption;
begin
  {$IFDEF OCHERED}
  if dmMen.mtDokumentID_BASE.AsInteger>0 then begin
    Caption:='Очередник ('+fmMain.SprNameOrg(dmMen.mtDokumentID_BASE.AsInteger,'К','')+')';
  end else begin
    if EnableLoadOch and (dmMen.mtDokumentID_BASE.AsInteger=0) then begin
      Caption:='Очередник ( '+MyKNAME+' )';
    end else begin
      Caption:='Очередник';
    end;
  end;
  {$ELSE}
    Caption:='Очередник';
  {$ENDIF}
end;
//----------------------------------------------------------
procedure TfmMen.edMR_OBLNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;
//----------------------------------------------------------
procedure TfmMen.edMR_RAIONNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;
//----------------------------------------------------------
procedure TfmMen.Event_ZaprosBankMain(Sender : TObject);
begin
  dmMen.ZaprosBank(true,self);
end;
procedure TfmMen.Event_ZaprosBankSostav(Sender : TObject);
begin
  dmMen.ZaprosBank(false,self);
end;

//----------------------------------------------------------
procedure TfmMen.Event_ClearTmpDir(Sender : TObject);
var
  sPath:String;
begin
  sPath:=ExtractFilePath(Application.ExeName)+'Export';
  ForceDirectories(sPath);
  ClearDir(sPath,false);
end;
//----------------------------------------------------------
procedure TfmMen.Event_OpenTmpDir(Sender : TObject);
var
  sPath:String;
begin
  sPath:=ExtractFilePath(Application.ExeName)+'Export';
  ForceDirectories(sPath);
  ShellExecute(Application.Handle, PChar('explore'), PChar(sPath), nil, nil, SW_SHOWNORMAL);
end;
//----------------------------------------------------------
procedure TfmMen.Event_SetDokument(Sender: TObject);
begin
  dmMen := TdmMen(Sender);
  LoadHistFields;
end;
//----------------------------------------------------------
procedure TfmMen.edTypeHouseEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceFromLookupSpr( 'LOOKUP_TYPEHOUSE', 'TYPEHOUSE', false);
  Handled := true;
end;
//----------------------------------------------------------
procedure TfmMen.edRegReshEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
//
end;

const
  PC_OCH_RESH=0;
  PC_OCH_SOST=1;
  PC_OCH_OTD=2;
  PC_OCH_DOCS=3;
  PC_OCH_PRIM=4;

procedure TfmMen.pcOcheredChange(Sender: TObject);
begin
  btUp.Enabled:=pcOchered.ActivePageIndex=PC_OCH_SOST;
  btDown.Enabled:=pcOchered.ActivePageIndex=PC_OCH_SOST;
  case pcOchered.ActivePageIndex of
    PC_OCH_RESH : begin     // решения
                    btAddMen.Enabled:=true;
                    btDelMen.Enabled:=true;
                    btEdit.Enabled:=true;
                  end;
    PC_OCH_SOST : begin     // состав семьи
                    btAddMen.Enabled:=true;
                    btDelMen.Enabled:=true;
                    btEdit.Enabled:=true;
                  end;
    PC_OCH_OTD  : begin     // отдельная очередь
                    btAddMen.Enabled:=true;
                    btDelMen.Enabled:=true;
                    btEdit.Enabled:=true;
                  end;
    PC_OCH_DOCS : begin     // документы
                    btAddMen.Enabled:=true;
                    btDelMen.Enabled:=false;
                    btEdit.Enabled:=false;
                  end;
  else
    btAddMen.Enabled:=false;
    btDelMen.Enabled:=false;
    btEdit.Enabled:=false;
  end;
end;

procedure TfmMen.SetEnableOchered_Form(const Value: Boolean);
begin
  FEnableOchered_Form := Value;
end;

procedure TfmMen.SetEnableVUS_Form(const Value: Boolean);
begin
  FEnableVUS_Form := Value;
end;

procedure TfmMen.btIsk2VklClick(Sender: TObject);
var
  s:String;
begin
  if (dmMen.tbSostavSem.RecordCount>0) then begin
//    if dmMen.tbSostavSemOCH.AsBoolean
//      then s:='Исключить из сосва семьи  ?'
//      else s:='Включить в состав семьи ?';
//    if Problem(s) then begin
      s:=dmMen.tbSostavSem.Bookmark;
      EditDataSet(dmMen.tbSostavSem);
      dmMen.tbSostavSemISKL.AsBoolean:=not dmMen.tbSostavSemISKL.AsBoolean;
      if dmMen.tbSostavSemISKL.AsBoolean
        then dmMen.tbSostavSemNOMER.AsString:='';
      PostDataSet(dmMen.tbSostavSem);
      dmMen.CheckCountSostav;
      dmMen.tbSostavSem.Bookmark:=s;
{
      EditDataSet(dmMen.mtDokument);
      if dmMen.tbSostavSemOCH.AsBoolean
        then dmMen.mtDokumentKOLVO_SOSTAV.AsInteger:=dmMen.mtDokumentKOLVO_SOSTAV.AsInteger+1
        else dmMen.mtDokumentKOLVO_SOSTAV.AsInteger:=dmMen.mtDokumentKOLVO_SOSTAV.AsInteger-1;
      }
//    end;
      dmMen.OchSostavMod:=true;
      QueryExit:=true;
    ActiveControl:=GridSostav;
  end;
end;
//-----------------------------------------------------------------------------------------
procedure TfmMen.btDelMenClick(Sender: TObject);
var
  s:String;
  l,lKolvo:Boolean;          
  n,m:Integer;
begin
  //---- решения --------------------
  if pcOchered.ActivePageIndex=PC_OCH_RESH then begin
    dmMen.tbOcheredResh.CheckBrowseMode;
    if dmMen.tbOcheredResh.RecordCount>0 then begin
      if Problem('Удалить решение ?',mtConfirmation,self) then begin
        dmMen.tbOcheredResh.Delete;
        dmMen.OchReshMod:=true;
        QueryExit:=true;
        CheckDecDate;
      end;
    end;
  //---- состав семьи --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_SOST then begin
    dmMen.tbSostavSem.CheckBrowseMode;
    if dmMen.tbSostavSem.RecordCount>0 then begin
      if Problem('Удалить члена семьи ?',mtConfirmation,self) then begin
        // запишем в список удаленных из состава семьи, что-бы потом при записи их --------
        // удалить из таблицы "Население" (исп-ся только для программы очередников)
        dmMen.OchSostavMod:=true;
        if (dmMen.tbSostavSemMEMBER_ID.AsString<>'') and (dmMen.tbSostavSemMEMBER_ID.AsInteger<>-1) then begin
          dmMen.sDelMens:=dmMen.sDelMens+','+dmMen.tbSostavSemMEMBER_ID.AsString;
        end;
        //---------------------------------------------------------------------------------
        dmMen.tbSostavSem.Delete;
        QueryExit:=true;
      end;
      dmMen.CheckCountSostav;
    end;
  //---- дополнительные очереди --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_OTD then begin
    dmMen.tbOcheredLgot.CheckBrowseMode;
    if dmMen.tbOcheredLgot.RecordCount>0 then begin
      if (dmMen.tbOcheredLgotOCHERED_ID.AsInteger=OCH_TYPE_SOCIAL) and cbOnly.Checked then begin
        PutError('Отключите "Только отдельная очередь" ',self);
      end else begin
        if Problem('Удалить отдельную очередь ?',mtConfirmation,self) then begin
          dmMen.DeleteReshOch(dmMen.tbOcheredLgotOCHERED_ID.AsInteger);
          dmMen.OchReshMod:=true;
          dmMen.tbOcheredLgot.Delete;
          QueryExit:=true;
          CheckOnlyOtdelno;
        end;
      end;
    end;
  //---- документы --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_DOCS then begin

  //---- примечание --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_PRIM then begin

  end;

end;

//-----------------------------------------------------------------------------------------
procedure TfmMen.btAddMenClick(Sender: TObject);
var
  n : Integer;
  s,s1,s2 : String;
begin
  //---- решения --------------------
  if pcOchered.ActivePageIndex=PC_OCH_RESH then begin
    if EditOchResh(dmMen, true, 0, nil, dmMen.mtDokument) then begin
    // dmMen.OchReshMod:=true;   внутри функции
      CheckDecDate;
      QueryExit:=true;
    end;
  //---- состав семьи --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_SOST then begin
    if EditShortMen(dmMen,true) then begin
      dmMen.OchSostavMod:=true;
      QueryExit:=true;
      dmMen.CheckCountSostav;
    end;
  //---- дополнительные очереди --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_OTD then begin
    EditLgotOchered( true, dmMen, Self);
    CheckOnlyOtdelno;
  //---- документы --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_DOCS then begin
    s:=ChoiceFromShablon(SHABLON_OCH);
    n:=edDoks.SelStart;
    edDoks.SelStart:=0;
    edDoks.SelLength:=0;
    s1:=Copy(edDoks.Text,1,n);
    s2:=Copy(edDoks.Text,n+1,Length(edDoks.Text));
    edDoks.Text := s1+s+s2;
    edDoks.SelStart:=Length(s1+s);
//            eTDBEditEh(ActiveControl).Text := TDBEditEh(ActiveControl).Text + s;
//            SendMessage(TDBEditEh(ActiveControl).Handle,  WM_SETTEXT,  0,  LParam(PChar(s)));
//            if TDBEditEh(ActiveControl).WantReturns then begin
//              SendKeys('{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{DOWN}{END}', false);
//            end else begin
//              SendKeys('{END}', false);
//            end;
  //---- примечание --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_PRIM then begin

  end;
end;
                    
//-----------------------------------------------------------------------------------------
procedure TfmMen.btEditClick(Sender: TObject);
begin
  //---- решения --------------------
  if pcOchered.ActivePageIndex=PC_OCH_RESH then begin
    if dmMen.tbOcheredReshTIP.AsInteger>0 then begin
      if EditOchResh(dmMen, false, 0, nil, dmMen.mtDokument) then begin
        QueryExit:=true;
        CheckDecDate;
      end;
    end;
    // dmMen.OchReshMod:=true;   внутри функции
  //---- состав семьи --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_SOST then begin
    if EditShortMen(dmMen,false) then begin
      dmMen.OchSostavMod:=true;
      dmMen.CheckCountSostav;
      QueryExit:=true;
    end;
  //---- дополнительные очереди --------------------
  end else if pcOchered.ActivePageIndex=PC_OCH_OTD then begin
    if dmMen.tbOcheredLgot.RecordCount>0  then EditLgotOchered( false, dmMen, Self);
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmMen.GridOcheredDblClick(Sender: TObject);
begin
  btEditClick(nil);
end;

procedure TfmMen.dsSostavSemDataChange(Sender: TObject; Field: TField);
begin
  if dmMen.tbSostavSemISKL.AsBoolean then begin
    btIsk2Vkl.Caption:='Включить';
    btIsk2Vkl.Hint:='Включить человека в состав семьи';
  end else begin
    btIsk2Vkl.Caption:='Исключить';
    btIsk2Vkl.Hint:='Исключить человека из состава семьи';
  end;
  if (Field<>nil) then begin
    dmMen.OchSostavMod:=true;
    QueryExit := true;
  end;
end;

procedure TfmMen.dsOcheredLgotDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) then begin
    QueryExit := true;
  end;
end;

procedure TfmMen.dsOcheredReshDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) then begin
    QueryExit := true;
  end;
end;

destructor TfmMen.Destroy;
begin
//  GlobalTask.SaveMRUListForm(Self);
  inherited;
end;

procedure TfmMen.edPasp_OrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD,Trim(edPasp_Organ.Text));
 if s<>'' then begin
   edPasp_Organ.Text:=s;
 end;
end;

procedure TfmMen.edAdresPropEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  adr : TAdres;
  lOk : Boolean;
  s : String;
begin
  adr.AdresPropis:=dmMen.mtDokumentADRES_PROP.AsString;
  adr.Obl:=dmMen.mtDokumentAPROP_OBL.AsString;
  adr.Raion:=dmMen.mtDokumentAPROP_RN.AsString;
  adr.Punkt:=dmMen.mtDokumentAPROP_PN.AsString;
  adr.Ulica:=dmMen.mtDokumentAPROP_UL.AsString;
  adr.NDom:=dmMen.mtDokumentAPROP_DOM.AsString;
  adr.Korp:=dmMen.mtDokumentAPROP_KORP.AsString;
  adr.Kv:=dmMen.mtDokumentAPROP_KV.AsString;
  if VvodAdres(adr) then begin
    dmMen.mtDokument.CheckBrowseMode;
    dmMen.mtDokument.Edit;
    lOk:=true;
    try
      dmMen.mtDokumentAPROP_OBL.AsString:=adr.Obl;
      dmMen.mtDokumentAPROP_RN.AsString:=adr.Raion;
      dmMen.mtDokumentAPROP_PN.AsString:=adr.Punkt;
      dmMen.mtDokumentAPROP_UL.AsString:=adr.Ulica;
      dmMen.mtDokumentAPROP_DOM.AsString:=adr.NDom;
      dmMen.mtDokumentAPROP_KORP.AsString:=adr.Korp;
      dmMen.mtDokumentAPROP_KV.AsString:=adr.Kv;
      dmMen.mtDokument.Post;
    except
      lOk:=false;
      dmMen.mtDokument.Cancel;
      PutError('Ошибка записи адреса.');
    end;
    if lOk then begin
      if adr.AdresPropis='не известен' then begin
        s:=adr.AdresPropis;
      end else begin
        adr.AdresPropis:=dmBase.AdresPropisFromAdres(adr, true);
        s:=adr.AdresPropis;
      end;
      dmMen.mtDokument.CheckBrowseMode;
      dmMen.mtDokument.Edit;
      dmMen.mtDokumentADRES_PROP.AsString:=s;
      dmMen.mtDokument.Post;
    end;
    CheckControl;
  end;
end;

procedure TfmMen.edAdresPropEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  dmMen.mtDokument.CheckBrowseMode;
  dmMen.mtDokument.Edit;
  dmMen.mtDokumentADRES_PROP.AsString:='';
  dmMen.mtDokumentAPROP_OBL.AsString:='';
  dmMen.mtDokumentAPROP_RN.AsString:='';
//      dmMen.mtDokumentAPROP_TP.AsInteger:=0;
  dmMen.mtDokumentAPROP_PN.AsString:='';
//      dmMen.mtDokumentAPROP_TU.AsInteger:=0;
  dmMen.mtDokumentAPROP_UL.AsString:='';
  dmMen.mtDokumentAPROP_DOM.AsString:='';
  dmMen.mtDokumentAPROP_KORP.AsString:='';
  dmMen.mtDokumentAPROP_KV.AsString:='';
  dmMen.mtDokument.Post;
  CheckControl;
end;

procedure TfmMen.btAddMigrClick(Sender: TObject);
begin
//  GridMigr.datasource.dataset.Append;
//  ActiveControl:=GridMigr;
//  GridMigr.SelectedIndex:=0;
end;

procedure TfmMen.btDelMigrClick(Sender: TObject);
begin
//  if not (GridMigr.DataSource.DataSet.Eof and GridMigr.DataSource.DataSet.Bof) then begin
//    if Problem(' Удалить запись ? ',mtConfirmation,self) then begin
//      GridMigr.DataSource.DataSet.Delete;
//      CheckQueryExit:=true;
//      QueryExit := true;
//      ActiveControl:=GridMigr;
//    end;
//  end;
end;

procedure TfmMen.vchDBText1GetText(Sender: TObject; var Text: String);
begin
  Text := IntToStr(TdmMen(Dokument).LicID)+'   '+FGurnal;
end;

procedure TfmMen.edLichNomerUpdateData(Sender: TObject; var Handled: Boolean);
var
  s:String;
  ed:TDbEditEh;
begin
  ed:=TDbEditEh(Sender);
//  if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
    if (edCitizen.Field.Value=MY_GRAG) or edCitizen.Field.IsNull
      or (not edUdost.Field.IsNull and edUdost.Field.Value=VIDG_GR_IN) then begin
      ed.text := CheckLichNom(true, ed.Text);
      s:=GetErrorCheck;
      if s<>'' then begin
        PutError(s);
      end;
    end;
//  end;
end;

procedure TfmMen.N_F_cbBezAdresaClick(Sender: TObject);
begin
  if not dmMen.IsReadDokument then begin
    if dmMen.mtDokument.State<>dsEdit then dmMen.mtDokument.Edit;
    if N_F_cbBezAdresa.Checked then begin
      dmMen.mtDokumentADRES_ID.AsInteger:=0;
      dmMen.mtDokumentKATEG.AsInteger:=BEZ_ADRESA;
    end else begin
      dmMen.mtDokumentKATEG.AsInteger:=ADRES_NOTREG;
    end;
    CheckControl;
  end;
end;

procedure TfmMen.GridOcheredColumns4GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  //
end;

procedure TfmMen.edAdresGitEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  adr : TAdres;
  lOk : Boolean;
  s,strTelefon : String;
  n : Integer;
begin
  adr.AdresPropis:=dmMen.mtDokumentADRES_GIT.AsString;
  adr.Obl:=dmMen.mtDokumentAGIT_OBL.AsString;
  adr.Raion:=dmMen.mtDokumentAGIT_RN.AsString;
  adr.Punkt:=dmMen.mtDokumentAGIT_PN.AsString;
  adr.Ulica:=dmMen.mtDokumentAGIT_UL.AsString;
  adr.NDom:=dmMen.mtDokumentAGIT_DOM.AsString;
  adr.Korp:=dmMen.mtDokumentAGIT_KORP.AsString;
  adr.Kv:=dmMen.mtDokumentAGIT_KV.AsString;
  strTelefon:=dmMen.mtDokumentAGIT_TEL.AsString;
  if VvodAdresTel(adr,strTelefon) then begin
    dmMen.mtDokument.CheckBrowseMode;
    dmMen.mtDokument.Edit;
    lOk:=true;
    try
      dmMen.mtDokumentAGIT_OBL.AsString:=adr.Obl;
      dmMen.mtDokumentAGIT_RN.AsString:=adr.Raion;
      dmMen.mtDokumentAGIT_PN.AsString:=adr.Punkt;
      dmMen.mtDokumentAGIT_UL.AsString:=adr.Ulica;
      dmMen.mtDokumentAGIT_DOM.AsString:=adr.NDom;
      dmMen.mtDokumentAGIT_KORP.AsString:=adr.Korp;
      dmMen.mtDokumentAGIT_KV.AsString:=adr.Kv;
      dmMen.mtDokumentAGIT_TEL.AsString:=strTelefon;
      dmMen.mtDokument.Post;
    except
      lOk:=false;
      dmMen.mtDokument.Cancel;
      PutError('Ошибка записи адреса.');
    end;
    if lOk then begin
      s:='';
      if adr.Obl<>'' then s:=s+adr.Obl+' обл., ';
      if adr.Raion<>'' then s:=s+adr.Raion+' р-н, ';
      if adr.Punkt<>'' then s:=s+adr.Punkt+', ';
      if adr.Ulica<>'' then s:=s+adr.Ulica+', ';
      if adr.NDom<>'' then s:=s+sokrDom+' '+adr.NDom+', ';
      if adr.Korp<>'' then s:=s+sokrKorp+' '+adr.Korp+', ';
      if adr.Kv<>'' then s:=s+sokrKv+' '+adr.Kv+', ';
      if strTelefon<>'' then s:=s+'телефон '+strTelefon+', ';

      s:=Trim(Copy(s,1,Length(s)-2));

      dmMen.mtDokument.CheckBrowseMode;
      dmMen.mtDokument.Edit;
      dmMen.mtDokumentADRES_GIT.AsString:=s;
      dmMen.mtDokumentADD_ADRES_GIT.AsBoolean:=true;
      dmMen.mtDokument.Post;
    end;

    CheckControl;
  end;
end;

procedure TfmMen.edAdresGitEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  if dmMen.mtDokumentADRES_ID.AsInteger>0 then begin
    dmMen.mtDokument.CheckBrowseMode;
    dmMen.mtDokument.Edit;
    dmMen.mtDokumentADRES_GIT.AsString:='';
    dmMen.mtDokumentAGIT_OBL.AsString:='';
    dmMen.mtDokumentAGIT_RN.AsString:='';
    dmMen.mtDokumentAGIT_PN.AsString:='';
    dmMen.mtDokumentAGIT_UL.AsString:='';
    dmMen.mtDokumentAGIT_DOM.AsString:='';
    dmMen.mtDokumentAGIT_KORP.AsString:='';
    dmMen.mtDokumentAGIT_KV.AsString:='';

    dmMen.mtDokumentADD_ADRES_GIT.AsBoolean:=false;
    dmMen.mtDokumentADRES_GIT.AsString:=dmBase.AdresFromID(fmMain.DateFiks , dmMen.mtDokumentADRES_ID.AsString);

    dmMen.mtDokument.Post;
  end;
end;

procedure TfmMen.pcChange(Sender: TObject);
begin
  if pc.ActivePageIndex=4
    then pcOcheredChange(Sender);
end;

procedure TfmMen.GridMigrGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (dmMen.tbMigrCONTANT.AsString='0') and (dmMen.tbMigrTIP.AsString=MIGR_UBIL) then begin
    AFont.Color:=ColorMenTempUbil;
  end else if (dmMen.tbMigrCONTANT.AsString='1') and (dmMen.tbMigrTIP.AsString=MIGR_UBIL) then begin
    AFont.Color:=ColorMenContantUbil;
  end else if (dmMen.tbMigrCONTANT.AsString='0') and (dmMen.tbMigrTIP.AsString=MIGR_PRIB) then begin
    AFont.Color:=ColorMenTempPrib;

//  end else begin
//    AFont.Color:=DefaultFontColor;
  end;
end;

procedure TfmMen.BitBtn1Click(Sender: TObject);
var
  n,nID : Integer;
  fl:Extended;
begin
  if GlobalTask.ParamAsInteger('SIMPLE_ADRES')=2 then begin
    btNewAdresVvodClick(nil);
  end else begin
    if fmChoiceAdres= nil then fmChoiceAdres := TfmChoiceAdres.Create(nil);
    fmChoiceAdres.DateFiks := dmBase.GetDateCurrentSost;
    fmChoiceAdres.ChoiceLich := false;
    if fmChoiceAdres.ShowModal = mrOk then begin
      EditDataSet(dmMen.mtDokument);
      nID:=fmChoiceAdres.IDAdres;
      dmMen.mtDokumentNEW_ADRES_ID.AsInteger := nID;
      fl:=dmBase.ReadPropAsFloat(fmMain.DateFiks, nID, 'PLOSH_ALL');
      if trunc(fl)>0 then dmMen.mtDokumentNEW_PLOSH_ALL.AsFloat:=fl
                     else dmMen.mtDokumentNEW_PLOSH_ALL.AsString:='';
      fl:=dmBase.ReadPropAsFloat(fmMain.DateFiks, nID, 'PLOSH_GIL');
      if trunc(fl)>0 then dmMen.mtDokumentNEW_PLOSH_GIL.AsFloat:=fl
                     else dmMen.mtDokumentNEW_PLOSH_GIL.AsString:='';
      n:=dmBase.ReadPropAsInteger(fmMain.DateFiks, nID, 'KOL_KOMN');
      if n>0  then dmMen.mtDokumentNEW_KOLVO_KOMN.AsInteger:=n
              else dmMen.mtDokumentNEW_KOLVO_KOMN.AsString:='';
    end;
  end;
end;

procedure TfmMen.vchDBText2GetText(Sender: TObject; var Text: String);
begin
  Text:='';
  if dmMen.mtDokumentNEW_ADRES_ID.AsInteger>0 then begin
    TextAdres.Font.Color:=clBlack;
    Text := dmBase.AdresFromID( Dokument.DateFiks, dmMen.mtDokumentNEW_ADRES_ID.AsString );
  end;
end;

//---------------------------------------------------------------------------
procedure TfmMen.TBItemStep1Click(Sender: TObject);
//var
//  f:TfmOcheredOper;
//  v:Variant;
begin
{
  f:=TfmOcheredOper.Create(nil);
//  f.tbSostavSem:=dmMen.tbSostavSem;
  f.IDCurMen:=dmMen.mtDokumentID.AsInteger;
  v:=dmMen.GetFactor('OCH_ACTION_OPER');
  if v=null then begin
    f.edOper.ItemIndex:=-1;
    f.edFIO.Text:='';
    f.IDMen:=0;
    f.edResh.Text:='';
    f.edDate.Text:='';
    f.edOsnov.Text:='';
  end else begin
    f.edOper.ItemIndex:=dmMen.GetFactor('OCH_ACTION_OPER');
    f.edFIO.Text:=dmMen.GetFactor('OCH_ACTION_FIOMEN');
    f.IDMen:=dmMen.GetFactor('OCH_ACTION_IDMEN');
    f.edResh.Text:=dmMen.GetFactor('OCH_ACTION_RESH');
    f.edDate.Value:=dmMen.GetFactor('OCH_ACTION_DATE');
    f.edOsnov.Text:=dmMen.GetFactor('OCH_ACTION_OSNOV');
  end;
  if f.ShowModal=mrOk then begin
    TBItemStep1.Checked:=true;
    TBItemStep2.Checked:=false;
    TBItemStep3.Checked:=false;
    TBItemStep4.Checked:=false;
    dmMen.SetFactor('OCH_ACTION_OPER',f.edOper.ItemIndex);
    dmMen.SetFactor('OCH_ACTION_IDMEN',f.IDMen);
    dmMen.SetFactor('OCH_ACTION_FIOMEN',f.edFIO.Text);
    dmMen.SetFactor('OCH_ACTION_RESH',f.edResh.Text);
    dmMen.SetFactor('OCH_ACTION_DATE',f.edDate.Value);
    dmMen.SetFactor('OCH_ACTION_OSNOV',f.edOsnov.Text);
    dmMen.SetFactor('OCH_ACTION_RUN',false);
  end;
  FreeAndNil(f);
}
end;

//---------------------------------------------------------------------------
procedure TfmMen.TBItemStep2Click(Sender: TObject);
//var
//  nOper:Integer;

begin
{
  if TBItemStep1.Checked then begin
    fmMain.TemplateInterface.SetParams(fmMain.DateFiks,0,0);
    nOper:=dmMen.GetFactor('OCH_ACTION_OPER');
    if nOper=0 then begin             //Переоформление
      fmMain.TemplateInterface.SetSimpleTemplate('OCHERED.VIPIS_PEREOF');
    end else if nOper=1 then begin    //Разделение
      fmMain.TemplateInterface.SetSimpleTemplate('OCHERED.VIPIS_RAZDEL');
    end else if nOper=2 then begin    //Объединение
      fmMain.TemplateInterface.SetSimpleTemplate('OCHERED.VIPIS_UNION');
    end;
    TBItemStep2.Checked:=true;
  end else begin
    PutError('Выполните первый шаг.');
  end;
}
end;

procedure TfmMen.TBItemStep3Click(Sender: TObject);
//var
//  nOper:Integer;
begin
{
  if TBItemStep1.Checked then begin
    fmMain.TemplateInterface.SetParams(fmMain.DateFiks,0,0);
    nOper:=dmMen.GetFactor('OCH_ACTION_OPER');
    if nOper=0 then begin             //Переоформление
      fmMain.TemplateInterface.SetSimpleTemplate('OCHERED.ACTION_PEREOF');
    end else if nOper=1 then begin    //Разделение
      fmMain.TemplateInterface.SetSimpleTemplate('OCHERED.ACTION_RAZDEL');
    end else if nOper=2 then begin    //Объединение
      fmMain.TemplateInterface.SetSimpleTemplate('OCHERED.ACTION_UNION');
    end;
    TBItemStep3.Checked:=true;
  end else begin
    PutError('Выполните первый шаг.');
  end;
}
end;

//---------------------------------------------------------------------------
procedure TfmMen.TBItemStep4Click(Sender: TObject);
//var
//  nOper,nID,n:Integer;
//  s,strFIO:String;
begin
{
  if TBItemStep1.Checked then begin
    if TBItemStep2.Checked then begin
      dmMen.SetFactor('OCH_ACTION_RUN',true);
      if FEnableWrite then begin
        if dmMen.PostDokument then begin
          dmMen.SetFactor('OCH_ACTION_RUN',true);
          nOper:=dmMen.GetFactor('OCH_ACTION_OPER');
          if nOper=0 then begin             //Переоформление
            s:='переоформление очереди';
          end else if nOper=1 then begin    //Разделение
            s:='разделение очереди';
          end else if nOper=2 then begin    //Объединение
            s:='объединение очереди';
          end;
          n := Question(' Выполнить '+s+' ?',
                        'Да;Нет;','',-1,-1);
          if n=1 then begin
            if dmMen.WriteDokument then begin
              QueryExit:=false;
              CheckExit:=false;
              ModalResult:=mrOk;
            end;
          end;
        end;
      end;
    end else begin
      PutError('Выполните второй шаг.');
    end;
  end else begin
    PutError('Выполните первый шаг.');
  end;
  }
end;

procedure TfmMen.BitBtn2Click(Sender: TObject);
begin
  if Problem(' Очистить улучшение жилищных условий ? ',mtConfirmation,self) then begin
    EditDataSet(TdmMen(Dokument).mtDokument);
    TdmMen(Dokument).mtDokumentNEW_ADRES_ID.AsString:='';
    TdmMen(Dokument).mtDokumentNEW_KOLVO_KOMN.AsString:='';
    TdmMen(Dokument).mtDokumentNEW_PLOSH_ALL.AsString:='';
    TdmMen(Dokument).mtDokumentNEW_DATE.AsString:='';
    TdmMen(Dokument).mtDokumentNEW_DOGOVOR.AsString:='';
  end;
end;

procedure TfmMen.GridReshColumns3GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  s,ss:String;
  ds:TDataSet;
begin
  s:='';
  case dmMen.tbOcheredResh.FieldByName('TIP').AsInteger of
   OCH_RESH_PERE,
   OCH_RESH_UNION,
   OCH_RESH_RAZD : begin
                     if dmMen.tbOcheredReshID2.AsString=dmMen.mtDokumentID.AsString
                       then Params.Text:=dmMen.GetFIO
                       else Params.Text:=dmBase.FIOMen(0,dmMen.tbOcheredReshID2.AsString,' ');
                     if s<>'' then Params.Text:=s+chr(13)+Params.Text;
                   end;
  else
    s:=GetNameOsnOch(dmMen.tbOcheredReshOSNOV.AsString,dmMen.tbOcheredReshOSNOV_TEXT.AsString,dmMen.tbOcheredResh.FieldByName('TIP').AsInteger,OCH_OSN_KRAT);
    ss:=GetNameOsnOch(dmMen.tbOcheredReshOSNOV2.AsString,dmMen.tbOcheredReshOSNOV_TEXT2.AsString,dmMen.tbOcheredResh.FieldByName('TIP').AsInteger,OCH_OSN_KRAT);
    if ss<>''
      then Params.Text:='1. '+s+chr(13)+'2. '+ss
      else Params.Text:=s;
  end;
end;

procedure TfmMen.GridReshDblClick(Sender: TObject);
begin
  btEditClick(nil);
end;

procedure TfmMen.GridSostavDblClick(Sender: TObject);
begin
  btEditClick(nil);
end;

procedure TfmMen.Button1Click(Sender: TObject);
begin
  dmMen.tbOcheredReshA.Active:=true;
  if GridResh.DataSource.DataSet=dmMen.tbOcheredResh
    then GridResh.DataSource.DataSet:=dmMen.tbOcheredReshA
    else GridResh.DataSource.DataSet:=dmMen.tbOcheredResh
end;


procedure TfmMen.edResidenceEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  Handled:=true;
  edResidence.Value:=null;
end;

procedure TfmMen.LoadFromIni;
var
  ini : TSasaIniFile;
begin
  if pnLoadAdres.Visible     then pnLoadAdres.Visible:=false;
  if pnTextAdres.Visible     then pnTextAdres.Visible:=false;
  if not pnZag.Visible       then pnZag.Visible:=true;
  if pnAdres.Height<>pnZag.Height then  pnAdres.Height:=pnZag.Height;
  inherited;
  try           
    ini:=GlobalTask.iniFile('FORM');
    pcOchered.ActivePageIndex:=ini.ReadInteger(Name,'PC_OCHERED',0);
  except

  end;
//  GridResh.RestoreColumnsLayout(ini,'GridResh_ColumnsLayOut', [crpColIndexEh,crpColWidthsEh]);
//  CompFromIni(gbSostav, ini, Name+'.gbSostav', ',Height,');
//  CompFromIni(edDop, ini, Name+'.edDop', ',Width,');
end;

//------------------------------------------------------
function TfmMen.SaveToIni: Boolean;
var
  ini : TSasaIniFile;
begin
  Result := inherited SaveToIni;
  if Result then begin
    ini := GlobalTask.iniFile('FORM');
    if pcOchered.ActivePageIndex>-1
      then ini.WriteInteger(Name,'PC_OCHERED',pcOchered.ActivePageIndex);
//    GridResh.SaveColumnsLayout(ini,'GridResh_ColumnsLayOut');
//    CompToIni(gbSostav, ini, Name+'.gbSostav', ',Height,');
//    CompToIni(edDop, ini, Name+'.edDop', ',Width,');
  end;
end;

procedure TfmMen.GridReshGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dmMen.tbOcheredReshOTKAZ.AsBoolean or (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_SN) then begin
    AFont.Color:=clRed;
  end else if (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_RAZD) or (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_UNION) or
              (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_PERE) then begin
    AFont.Color:=clBlue;
  end;
  if dmMen.tbOcheredReshPLAN.AsBoolean  then begin
    Background:=clInfoBk;
  end;
end;
//---------------------------------------------------------------------------------------
procedure TfmMen.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
end;
//---------------------------------------------------------------------------------------
// следующий номер для номера дела
procedure TfmMen.edDeloEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  n:Integer;
begin
  n:=dmbase.Och_GetNextNDELO;
  if n>0 then begin
    edDelo.Text:=IntToStr(n);
  end else begin
    PutError('Невозможно определить номер.',self);
  end;
end;

//---------------------------------------------------------------------------------------
procedure TfmMen.GridSobstvColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  l:Boolean;
begin
  if Params.Text<>'' then begin
    if Params.Text=dmMen.mtDokumentID.AsString then begin
      Params.Text:=dmMen.GetFIO;
    end else begin
      l:=dbDisableControls(dmMen.tbSostavSem);
      if dmMen.tbSostavSem.Locate('MEMBER_ID', Params.Text, []) then begin
        Params.Text:=dmMen.tbSostavSemFAMILIA.AsString+' '+dmMen.tbSostavSemNAME.AsString+' '+dmMen.tbSostavSemOTCH.AsString;
      end;
      dbEnableControls(dmMen.tbSostavSem,l);
    end;
  end;
end;

procedure TfmMen.GridSostavColumns8GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  p:TPassport;
begin
  p:=dmBase.PasportFromValues(dmMen.tbSostavSemPASP_UDOST.AsInteger, dmMen.tbSostavSemPASP_SERIA.AsString,
     dmMen.tbSostavSemPASP_NOMER.AsString,dmMen.tbSostavSemPASP_VIDAN.AsString,'',dmMen.tbSostavSemPASP_DATE.Value );
  Params.Text:=dmBase.PasportToText(p,0);
end;

procedure TfmMen.edDateSrokDNUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  if not FRun then begin
    if edDateSrokDN.Value<>null then begin
      if N_F_cbKvartirant.Field.AsInteger=0 then begin
        EditDataSet(dmMen.mtDokument);
        dmMen.mtDokumentNOMER_SEM.AsInteger:=1;
      end;
    end;
  end;
end;


procedure TfmMen.GridSostavGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
begin
  if dmMen.tbSostavSemISKL.AsBoolean
    then Background:=clInfoBk;
end;

procedure TfmMen.btUpClick(Sender: TObject);
var
  bm : TBookmarkStr;
  n1, n2, nRec1, nRec2 : Integer;
begin
  if (pcOchered.ActivePage=tsOchSostav) and not dmMen.tbSostavSemISKL.AsBoolean then begin
    bm := dmMen.tbSostavSem.Bookmark;
    dmMen.tbSostavSem.DisableControls;
    n1    := dmMen.tbSostavSemNOMER.AsInteger;
    nRec1 := dmMen.tbSostavSem.Recno;
    dmMen.tbSostavSem.Prior;
    nRec2 := dmMen.tbSostavSem.Recno;
    n2 := dmMen.tbSostavSemNOMER.AsInteger;
    if (nRec1<>nRec2) and (n1<>n2) then begin
      dmMen.tbSostavSem.Edit;
      dmMen.tbSostavSemNOMER.AsInteger := n1;
      dmMen.tbSostavSem.Post;
      dmMen.tbSostavSem.Bookmark := bm;
      dmMen.tbSostavSem.Edit;
      dmMen.tbSostavSemNOMER.AsInteger := n2;
      dmMen.tbSostavSem.Post;
    end;
    dmMen.tbSostavSem.Bookmark := bm;
    dmMen.tbSostavSem.EnableControls;
  end;
  ActiveControl:=GridSostav;
end;

procedure TfmMen.btDownClick(Sender: TObject);
var
  bm : TBookmarkStr;
  n1, n2, nRec1, nRec2 : Integer;
begin
  if (pcOchered.ActivePage=tsOchSostav) and not dmMen.tbSostavSemISKL.AsBoolean then begin
    bm := dmMen.tbSostavSem.Bookmark;
    dmMen.tbSostavSem.DisableControls;
    n1    := dmMen.tbSostavSemNOMER.AsInteger;
    nRec1 := dmMen.tbSostavSem.Recno;
    dmMen.tbSostavSem.Next;
    nRec2 := dmMen.tbSostavSem.Recno;
    n2 := dmMen.tbSostavSemNOMER.AsInteger;
    if (nRec1<>nRec2) and (n1<>n2) and not dmMen.tbSostavSemISKL.AsBoolean then begin
      dmMen.tbSostavSem.Edit;
      dmMen.tbSostavSemNOMER.AsInteger := n1;
      dmMen.tbSostavSem.Post;
      dmMen.tbSostavSem.Bookmark := bm;
      dmMen.tbSostavSem.Edit;
      dmMen.tbSostavSemNOMER.AsInteger := n2;
      dmMen.tbSostavSem.Post;
    end;
    dmMen.tbSostavSem.Bookmark := bm;
    dmMen.tbSostavSem.EnableControls;
  end;
  ActiveControl:=GridSostav;
end;

procedure TfmMen.cbOnlyClick(Sender: TObject);
begin
  if cbOnly.Checked then begin
    ImageSpec.Visible:=true;
    ImageSpec.Hint := 'Толко отдельная очередь';
  end else begin
    ImageSpec.Visible:=false;
    ImageSpec.Hint := '';
  end;
end;

procedure TfmMen.GridOcheredColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if dmmen.tbOcheredLgotVNEOCH.AsBoolean
    then Params.Text:='внеоч. '+Params.Text;
end;

procedure TfmMen.N_F_cbUchastokClick(Sender: TObject);
begin
  CheckImageAndFont;
end;

procedure TfmMen.N_F_cbNewSemClick(Sender: TObject);
begin
  CheckImageAndFont;
end;

procedure TfmMen.N_F_cbSirotaClick(Sender: TObject);
begin
  CheckImageAndFont;
  CheckDecDate;
end;

procedure TfmMen.edNomerEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  n:Integer;
//  lOk,l1,l2:Boolean;
  cur:TCursor;
begin
//  lOk:=false;
  if dmMen.mtDokumentDEC_DATE.IsNull or dmMen.mtDokumentONLY.AsBoolean then exit;

  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
    n:=dmBase.GetRealNomerOchEx(dmMen.mtDokumentID_BASE.AsInteger, 0, dmMen.mtDokumentID.AsInteger,
           dmMen.mtDokumentDEC_DATE.AsDateTime, dmMen.mtDokumentDEC_TIME.AsDateTime,1,dmMen.mtDokumentOLD_NOMER.AsInteger);

    if n>0 then begin
      EditDataSet(edNomer.Field.DataSet);
      edNomer.Text:=IntToStr(n);
    end;
  finally
    Screen.Cursor:=cur;
  end;
//  if (dmMen.mtDokumentID.AsInteger=0) or dmMen.mtDokumentNEWMEN.AsBoolean then begin
{
  if Dokument.PostDokument then begin
    l1:=dmMen.OchReshMod;
    l2:=dmMen.OchSostavMod;
    dmMen.OchReshMod:=false;
    dmMen.OchSostavMod:=false;
    lOk:=dmMen.WriteDokument(self);
    dmMen.OchReshMod:=l1;
    dmMen.OchSostavMod:=l2;
    QueryExit:=true;
  end;
  if lOk then begin
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    try
      n:=dmBase.GetRealNomerOch(dmMen.mtDokumentID_BASE.AsInteger, 0, dmMen.mtDokumentID.AsInteger);
      if n>0 then begin
        EditDataSet(edNomer.Field.DataSet);
        edNomer.Text:=IntToStr(n);
      end;
    finally
      Screen.Cursor:=cur;
    end;
  end;
  }
end;

procedure TfmMen.GridReshColumns0GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if GridResh.DataSource.DataSet.FieldByName('RAZD').AsBoolean
    then Params.Text:=Params.Text+#13+'(при разделении)';
end;     

end.
