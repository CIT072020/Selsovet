//ЛАИС
unit fAdres;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uTypes,
  fSimple, Db, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, StdCtrls, Mask, Variants, DBFunc,
  DBCtrlsEh, DBLookupEh, ExtCtrls, TB2ToolWindow, dBase, dAdres, MetaTask, uProject, fShablon,
  Grids, DBGridEh, SasaDBGrid, Buttons, OpisEdit, FuncPr, fAddSobstv,CreateControls,
  ImgList, RXCtrls, DBCtrls, vchDBCtrls;

type
  TfmAdres = class(TfmSimple)
    pc: TPageControl;
    tsMain: TTabSheet;
    dsUL: TDataSource;
    dsPunkt: TDataSource;
    tsProp: TTabSheet;
    sbProp: TScrollBox;
    dsLichSchet: TDataSource;
    dsDopProp: TDataSource;
    gbSobstv: TGroupBox;
    Panel1: TPanel;
    btAddMen: TBitBtn;                
    btDelMen: TBitBtn;
    dsHouseProps: TDataSource;
    dsHouseOwners: TDataSource;
    ImageList: TImageList;
    btEditMen: TBitBtn;
    Label7: TLabel;
    dsPredst: TDataSource;
    dsBigHouse: TDataSource;
    tsBigHouse: TTabSheet;
    Label13: TLabel;
    cbGiloe: TDBCheckBoxEh;
    cbOtdelno: TDBCheckBoxEh;
    cbChet: TDBCheckBoxEh;
    lbNameBigHouse: TLabel;
    edKolvoKv: TDBNumberEditEh;
    edNameBigHouse: TDBEditEh;
    Panel3: TPanel;
    GridSobstv: TSasaDBGrid;
    N_F_cbHist: TDBCheckBoxEh;
    btRemove: TBitBtn;
    TabSheet1: TTabSheet;
    gbSostav: TGroupBox;
    GridMens: TSasaDBGrid;
    pnWorkMens: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btEditMenAdres: TBitBtn;
    btChoiceMen: TBitBtn;
    btIsklMen: TBitBtn;
    dsMens: TDataSource;
    btUp: TBitBtn;
    btDown: TBitBtn;
    tsMCHS: TTabSheet;
    Label19: TLabel;
    Label20: TLabel;
    edMS_API: TDBNumberEditEh;
    edMS_OUT: TDBComboBoxEh;
    edMS_OTOPL: TDBComboBoxEh;
    edMS_ELPR: TDBComboBoxEh;
    edMS_DATE: TDBDateTimeEditEh;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    gbPrim: TGroupBox;
    edMS_PRIM: TDBEditEh;
    Label24: TLabel;
    edMS_ZA_PRED: TDBComboBoxEh;
    tsUch: TTabSheet;
    sbUch: TScrollBox;
    pnMain: TPanel;
    vchDBText1: TvchDBText;
    iPrivateSect: TImage;
    Label4: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    edTip: TDBComboBoxEh;
    edOsnovDate: TDBDateTimeEditEh;
    edOsnov: TDBEditEh;
    pnHouse: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edEtag: TDBNumberEditEh;
    edKol_Etag: TDBNumberEditEh;
    edPredst: TDBLookupComboboxEh;
    edGilfond: TDBComboBoxEh;
    N_F_edPrivateSect: TDBCheckBoxEh;
    edControlHouse: TDBComboBoxEh;
    edKolvoKn: TDBNumberEditEh;
    edDateKn: TDBDateTimeEditEh;
    edUseGilfond: TDBComboBoxEh;
    edAbonentGAZ: TDBEditEh;
    N_F_cbSpecUch: TDBCheckBoxEh;
    iUchastok: TImage;
    dsResh: TDataSource;
    tsResh: TTabSheet;
    GroupBox2: TGroupBox;
    GridResh: TDBGridEh;
    Panel4: TPanel;
    edOsnovNomer: TDBEditEh;
    pnUch: TPanel;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edUchNomer: TDBEditEh;
    edUchDateIskl: TDBDateTimeEditEh;
    edUchIsklOsnov: TDBEditEh;
    edUchDatePred: TDBDateTimeEditEh;
    Label25: TLabel;
    edUchFor: TDBComboBoxEh;
    Label26: TLabel;
    edPloshUch: TDBNumberEditEh;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    sbAdd: TSpeedButton;
    sbDel: TSpeedButton;
    GridProp: TDBGridEh;
    Splitter2: TSplitter;
    gbVlMen: TGroupBox;
    GridLich: TSasaDBGrid;
    gbAddInfo: TGroupBox;
    Splitter1: TSplitter;
    edPrim: TDBMemo;
    Label27: TLabel;
    edNomXoz: TDBEditEh;
    tsNalogi: TTabSheet;
    Panel6: TPanel;
    btAddNalog: TBitBtn;
    btDeleteNalog: TBitBtn;
    btEditNalog: TBitBtn;
    GridNalogi: TSasaDBGrid;
    dsNalogi: TDataSource;
    Label28: TLabel;
    GroupBox3: TGroupBox;
    edUchPrim: TDBMemo;
    edUchTypeOwner: TDBComboBoxEh;
    procedure lbTipULGetText(Sender: TObject; var Text: String);
    procedure dsDopPropDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure dsHousePropsDataChange(Sender: TObject; Field: TField);
    procedure dsHouseOwnersDataChange(Sender: TObject; Field: TField);
    procedure btAddMenClick(Sender: TObject);
    procedure btDelMenClick(Sender: TObject);
    procedure GridSobstvColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure btEditMenClick(Sender: TObject);
    procedure GridSobstvDblClick(Sender: TObject);
    procedure dsBigHouseDataChange(Sender: TObject; Field: TField);
    procedure vchDBText1GetText(Sender: TObject; var Text: String);
    procedure N_F_cbHistClick(Sender: TObject);
    procedure GridSobstvColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure btRemoveClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure btEditMenAdresClick(Sender: TObject);
    procedure GridMensColumns6GetCellParams(Sender: TObject;    EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridMensGetCellParams(Sender: TObject; Column: TColumnEh;   AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure N_F_edPrivateSectClick(Sender: TObject);
    procedure edControlHouseEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edControlHouseEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure edControlHouseUpdateData(Sender: TObject;         var Handled: Boolean);
    procedure pcChange(Sender: TObject);
    procedure edDateKnUpdateData(Sender: TObject; var Handled: Boolean);
    procedure btUpClick(Sender: TObject);
    procedure btDownClick(Sender: TObject);
    procedure edUseGilfondEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbPropResize(Sender: TObject);
    procedure edTipChange(Sender: TObject);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure GridLichGetCellParams(Sender: TObject; Column: TColumnEh;   AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure btAddNalogClick(Sender: TObject);
    procedure btEditNalogClick(Sender: TObject);
    procedure btDeleteNalogClick(Sender: TObject);
    procedure GridNalogiGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridNalogiColumns9GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridNalogiDblClick(Sender: TObject);
    procedure Label28Click(Sender: TObject);
    procedure edUchTypeOwnerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edPrimClick(Sender: TObject);
  private
    { Private declarations }
    dAdr : TdmAdres;
    opProps  : TOpisEdit;
    FViewHist:Boolean;
    FSetFormMens : Boolean;
  public
    procedure SetParamForMens;
    procedure EditMen;
    procedure SetViewHist(lValue:Boolean);
    function GetViewHist:Boolean;
    function EditForm(slPar:TStringList; strGurnal:String) : Boolean; override;
    function CreateRunTimeProperty : Boolean; override;
    constructor Create(Owner : TComponent); override;
    procedure UpdateActions; override;
    function GetdsDopProp : TDataSource; override;
    procedure AddCreateControl( c:TWinControl; prop : TPropControl );
    function LoadObjectAdres:String;

  end;

var
  fmAdres: TfmAdres;

implementation

uses fMain, fEditRecHistOwners, dMen, uObjectsScript, fRecordGrid, FuncEh, uProjectAll;


{$R *.DFM}

{ TfmAdres }

constructor TfmAdres.Create(Owner: TComponent);
begin
  inherited;
  N_F_cbHist.Checked:=false;
  FSetFormMens   := false;
  FViewHist:=false;
  opProps  := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPE_HOUSE');
end;

procedure TfmAdres.FormHide(Sender: TObject);
begin
  FSetFormMens   := false;
end;

type ts=class(TPageControl);

function TfmAdres.CreateRunTimeProperty: Boolean;
var
  i : Integer;
begin
  Result := true;
  ListDopRazdel.AddObject('1', sbProp);
//  ListDopRazdel.AddObject('2', sbUch);
//  ListDopRazdel.AddObject('1', tsProp);
  Dokument.tbDopProp.Close;
  Dokument.tbDopProp.FieldDefs.Clear;
  dsDopProp.DataSet  := Dokument.tbDopProp;
  for i:=0 to ListDopRazdel.Count-1 do begin
    CreateDopControls(dmBase.TypeObj_Adres, TWinControl(ListDopRazdel.Objects[i]),
            ListDopRazdel.Strings[i],0,AddCreateControl);
  end;

//  StaticText1.ParentFont:=false;
//  StaticText1.Font.Style:=StaticText1.Font.Style+[fsBold];
//  RxLabel1.ParentColor:=true;
//  RxLabel1.Font.Style:=RxLabel1.Font.Style+[fsBold];

//  Label15.Font.Style:=Label15.Font.Style+[fsBold];
//  Label15.Caption:=ColorToString(sbProp.Color);
//  Label15.Caption:=ColorToString(ts(pc).Color);

  Dokument.tbDopProp.Open;
  Dokument.tbDopProp.Append;
  Dokument.tbDopProp.Post;
  dsDokument.DataSet := Dokument.mtDokument;
  dAdr := TdmAdres(Dokument);
  dAdr.mtLichSchet.Open;
  dAdr.tbHouseProps.Open;
  dAdr.tbHouseOwners.Open;
  dAdr.tbHouseOwnersHist.Open;
  dAdr.tbResh.Open;
  dAdr.tbNalogi.Open;
  dAdr.mtBigHouse.Open;

  dsBigHouse.DataSet:=dAdr.mtBigHouse;
  dsLichSchet.DataSet:=dAdr.mtLichSchet;
  dsNalogi.DataSet:=dAdr.tbNalogi;

  GlobalTask.CurrentOpisEdit.SetKeyForm(Self,nil);
end;

//--------------------------------------------------------
procedure TfmAdres.SetParamForMens;
begin
  if not FSetFormMens then begin
    dsMens.DataSet := TdmAdres(Dokument).dmMens.mtDokument;
    TdmAdres(Dokument).dmMens.EditFromLichSchet := false;
    TdmAdres(Dokument).dmMens.EditFromAdres := true;
    fmMain.SetDataSets_fmMen(TdmAdres(Dokument).dmMens);
//    fmMain.fmMen.dsDokument.DataSet := TdmAdres(Dokument).dmMens.mtDokument;
//    fmMain.fmMen.dsLgot.DataSet  := TdmAdres(Dokument).dmMens.tbLgot;
//    fmMain.fmMen.dsPrizn.DataSet := TdmAdres(Dokument).dmMens.tbPriznaki;
//    fmMain.fmMen.dsMigr.DataSet  := TdmAdres(Dokument).dmMens.tbMigr;
    TdmMen(fmMain.fmMen.Dokument).EditFromLichSchet := false;
    TdmMen(fmMain.fmMen.Dokument).EditFromAdres := true;
    fmMain.fmMen.SetSubSystem(SS_HOZ_UCHET);
    if FEnableWrite then begin
      fmMain.fmMen.TBItemWrite.Caption:='Выход';
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
end;

//--------------------------------------------
procedure TfmAdres.EditMen;
var
  slPar:TStringList;
begin
  slPar:=TStringList.Create;
  slPar.Add('ADRES_ID='+TdmAdres(Dokument).mtDokumentID.AsString);
  if (dAdr.dmMens.mtDokumentLIC_ID.AsString<>'') and
     (dAdr.dmMens.mtDokumentLIC_ID.AsInteger>0) then begin
    slPar.Add('LIC_ID='+dAdr.dmMens.mtDokumentLIC_ID.AsString);
  end else begin
    slPar.Add('LIC_ID=0');
  end;
  fmMain.fmMen.ActiveControl := fmMain.fmMen.edFam;
  fmMain.fmMen.EditForm(slPar,FGurnal);
  if not QueryExit then begin
    QueryExit := fmMain.fmMen.QueryExit or fmMain.fmMen.CheckQueryExit;
  end;
//  CheckFirst(strErr);
  slPar.Free;
end;

procedure TfmAdres.btEditMenAdresClick(Sender: TObject);
begin
  SetParamForMens;
  dsMens.DataSet.Edit;
  EditMen;
end;

function TfmAdres.EditForm(slPar:TStringList; strGurnal:String): Boolean;
begin

  CurGridMens:=GridMens;

  AssignPar(slPar);

  Result := false;
  FGurnal:=strGurnal;  // журнал из которого открыли форму
  pc.ActivePageIndex:=0;
  Adres.dmAdres := TdmAdres(Dokument);
  Adres.OnlyAdres:=true;
  TBSubmenuTmp.Visible:=LoadTemplate('fmAdres');

  if GetParam('RUN_REPORT','0')='1' then begin
    RunReport;
  end else begin
    if not GlobalTask.ParamAsBoolean('V_NALOGI') then begin
      tsNalogi.TabVisible:=false
    end else begin
//      GridNalogi.SumList.RecalcAll;
      tsNalogi.TabVisible:=true;
    end;
  end;
  {$IFDEF OCHERED}
     tsMCHS.TabVisible:=false;
  {$ENDIF}

  if IsShowEdit then begin
    EditDataSet(dAdr.mtDokument);
    if ShowModal = mrOk then begin
      Result := true;
    end;
  end;
  Adres.dmAdres := nil;
  Adres.OnlyAdres:=false;

  CurGridMens:=nil;


end;

procedure TfmAdres.UpdateActions;
begin
  inherited;
//
end;
//--------------------------------------------------------------------------
procedure TfmAdres.lbTipULGetText(Sender: TObject; var Text: String);
var
  strTip : String;
begin
  Text := '';
  if dAdr<>nil then begin
  if dAdr.mtDokumentUL.AsString<>'' then begin
    if dmBase.SprUL.Locate('ID', dAdr.mtDokumentUL.AsString, []) then begin
      strTip := dmBase.SprUL.FieldByName('TIP').AsString;
      if strTip <> '' then begin
        if dmBase.SprTypeUL.Locate('ID', strTip, []) then begin
          Text := dmBase.SprTypeUL.FieldByName('NAME').AsString;
        end;
      end;
    end;
  end;
  end;
end;
//--------------------------------------------------------------------------
function TfmAdres.GetdsDopProp: TDataSource;
begin
  Result := dsDopProp;
end;
//--------------------------------------------------------------------------
procedure TfmAdres.dsDopPropDataChange(Sender: TObject; Field: TField);
begin
  if Field<>nil then begin
    QueryExit := true;
  end;
end;
//--------------------------------------------------------------------------
procedure TfmAdres.FormCreate(Sender: TObject);
begin
  inherited;
  fmMain.ImageList.GetBitmap(IL_ADD_MEN, sbAdd.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_MEN, sbDel.Glyph);

  tsResh.TabVisible:=false;
//  tsUch.TabVisible:=false;

end;
//--------------------------------------------------------------------------
procedure TfmAdres.sbAddClick(Sender: TObject);
var
  strKod : String;
begin
  strKod := opProps.ChoiceFromKeyList(nil);
  if strKod <>'' then begin
    if not TdmAdres(Dokument).tbHouseProps.Locate('KOD', strKod, []) then begin
      TdmAdres(Dokument).tbHouseProps.Append;
      try
        TdmAdres(Dokument).tbHousePropsKOD.AsString := strKod;
        TdmAdres(Dokument).tbHouseProps.Post;
      except
        PutError(' Ошибка добавления значения. ');
        TdmAdres(Dokument).tbHouseProps.Cancel;
      end;
    end else begin
      PutError(' Значение уже существует в списке. ');
    end;
  end;
end;

procedure TfmAdres.sbDelClick(Sender: TObject);
begin
  if TdmAdres(Dokument).tbHouseProps.RecordCount>0 then begin
    if Problem(' Удалить значение из списка признаков ? ') then begin
      QueryExit := true;
      TdmAdres(Dokument).tbHouseProps.Delete;
    end;
  end;
end;

procedure TfmAdres.dsHousePropsDataChange(Sender: TObject; Field: TField);
var
  v : Variant;
begin
  if (Field<>nil) and (Dokument<>nil) then begin
    QueryExit := true;
//    RunProcScript(Dokument.GetVid+'_HOUSEPROPS_'+UpperCase(Field.FieldName),v);
  end;
end;

procedure TfmAdres.dsHouseOwnersDataChange(Sender: TObject; Field: TField);
var
  v : Variant;
begin
  if (Field<>nil) and (Dokument<>nil) then begin
    QueryExit := true;
//    RunProcScript(Dokument.GetVid+'_HOUSEPROPS_'+UpperCase(Field.FieldName),v);
  end;
end;

procedure TfmAdres.btAddMenClick(Sender: TObject);
begin
  if GetViewHist then begin
    EditSobstvHist( TdmAdres(Dokument), true);
  end else begin
    EditSobstv( TdmAdres(Dokument).tbHouseOwners, TdmAdres(Dokument).tbHouseOwnersHist, nil, -1, true);
  end;
//  LoadObjectAdres;
  QueryExit := true;
end;

procedure TfmAdres.btEditMenClick(Sender: TObject);
begin
  if dAdr.tbHouseOwners.RecordCount>0 then begin
    if GetViewHist then begin
      EditSobstvHist( TdmAdres(Dokument), false);
    end else begin
      EditSobstv( TdmAdres(Dokument).tbHouseOwners, TdmAdres(Dokument).tbHouseOwnersHist, nil, -1, false);
    end;
//  LoadObjectAdres;
    QueryExit := true;
  end;
end;

procedure TfmAdres.btDelMenClick(Sender: TObject);
begin
  if dAdr.tbHouseOwners.RecordCount>0 then begin
    if GetViewHist then begin
      if TdmAdres(Dokument).tbHouseOwnersHist.RecordCount>0 then begin
        if Problem(' Удалить собственника из истории ? ') then begin
          QueryExit := true;
          TdmAdres(Dokument).tbHouseOwnersHist.Delete;
        end;
      end;
    end else begin
      if TdmAdres(Dokument).tbHouseOwners.RecordCount>0 then begin
        if Problem(' Удалить собственника ? ') then begin
          QueryExit := true;
          TdmAdres(Dokument).tbHouseOwners.Delete;
        end;
      end;
    end;
  end;
end;

procedure TfmAdres.btRemoveClick(Sender: TObject);
var
  lRemove:Boolean;
begin
  if not GetViewHist then begin
    if TdmAdres(Dokument).tbHouseOwners.RecordCount>0 then begin
      if Problem(' Переместить собственника в историю ? ') then begin
        if dAdr.tbHouseOwnersDATEP.IsNull then begin
          PutError('Заполните дату окончания владения.');
        end else begin
          lRemove:=true;
          if (dmBase.GetCurDate<dAdr.tbHouseOwners.FieldByName('DATEP').AsDateTime) then begin
            lRemove:=Problem('Текущая дата меньше даты окончания. Переместить?');
          end;
          if lRemove then begin
            QueryExit := true;
            dAdr.RemoveToHist;
          end;
        end;
      end;
    end;
  end else begin
    beep;
  end;
end;

procedure TfmAdres.GridSobstvColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  ds : TDataSet;
  fld: TField;
begin
  ds:=GridSobstv.DataSource.DataSet;
  if ds.FieldByName('TYPEKOD').IsNull then begin
    Params.ImageIndex := -1;
  end else if (ds.FieldByName('TYPEKOD').AsInteger=OWNER_NASEL) then begin
    fld:=ds.FindField('PROPIS');
    if fld=nil then begin
      Params.ImageIndex:=0;
    end else begin
      if fld.AsBoolean=true
       then Params.ImageIndex:=0
       else Params.ImageIndex:=1;
     end;
  end else begin
    Params.ImageIndex := 2;
  end;
end;

procedure TfmAdres.GridSobstvColumns1GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  fld:TField;
begin
  if not EditMode then begin
    fld:=GridSobstv.DataSource.DataSet.FindField('NAME_MEN');
    if fld=nil then begin
      Params.Text:=GridSobstv.DataSource.DataSet.FieldByName('NAME').AsString;
    end else begin
      Params.Text:=Trim(GridSobstv.DataSource.DataSet.FieldByName('NAME').AsString)+' '+
                   Trim(GridSobstv.DataSource.DataSet.FieldByName('NAME_MEN').AsString)+' '+
                   GridSobstv.DataSource.DataSet.FieldByName('OTCH_MEN').AsString;
    end;
  end;
end;

procedure TfmAdres.GridSobstvDblClick(Sender: TObject);
begin
  btEditMenClick(nil);
end;

procedure TfmAdres.dsBigHouseDataChange(Sender: TObject; Field: TField);
var
  v : Variant;
begin
  if (Field<>nil) and (Dokument<>nil) then begin
    if not Dokument.IsReadDokument then begin
      CheckQueryExit:=true;
      QueryExit := true;
      RunProcScript(Dokument.GetVid+'_'+UpperCase(Field.FieldName),v);
    end;
  end;
end;

// !!! -------------------------------------
function TfmAdres.LoadObjectAdres:String;
begin
  if dAdr<>nil then begin
    if dAdr.mtDokumentID.AsInteger>0 then begin
      Result:=dAdr.mtDokumentADRES_TEXT.AsString; //было до 27.07.2020 =>   dmBase.AdresFromID(dAdr.DateFiks, dAdr.mtDokumentID.AsString);
    end else begin
      Result:='';
      dmbase.ClearGlobalAdres;
    end;
  end;
end;
//-------------------------------------------
procedure TfmAdres.vchDBText1GetText(Sender: TObject; var Text: String);
begin
  Text:=LoadObjectAdres;
end;

function TfmAdres.GetViewHist: Boolean;
begin
  Result:=FViewHist;
end;

procedure TfmAdres.SetViewHist(lValue: Boolean);
begin
  FViewHist:=lValue;
  if FViewHist then begin
    GridSobstv.DataSource.DataSet:=dAdr.tbHouseOwnersHist;
    gbSobstv.Caption:=' ИСТОРИЯ СОБСТВЕННИКОВ ';
    btRemove.Enabled:=false;
  end else begin
    GridSobstv.DataSource.DataSet:=dAdr.tbHouseOwners;
    gbSobstv.Caption:=' Собственники ';
    btRemove.Enabled:=true;
  end;
end;

procedure TfmAdres.N_F_cbHistClick(Sender: TObject);
begin
  SetViewHist(N_F_cbHist.Checked);
end;

procedure TfmAdres.GridMensColumns6GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
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

procedure TfmAdres.GridMensGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dAdr.dmMens.mtDokument.Active then begin
    if not dAdr.dmMens.mtDokumentCANDELETE.IsNull and dAdr.dmMens.mtDokumentCANDELETE.AsBoolean then begin
      AFont.Color := ColorMenContantUbil; //  clRed;
    end else begin
      if not dAdr.dmMens.mtDokumentPROPIS.IsNull and (dAdr.dmMens.mtDokumentPROPIS.AsBoolean=false) then begin
        AFont.Color := ColorMenTempPrib; //$00319D31;
      end else if not dAdr.dmMens.mtDokumentPRESENT.IsNull and (dAdr.dmMens.mtDokumentPRESENT.AsBoolean=false) then begin
        AFont.Color := ColorMenTempUbil; // Grid.Color2;
      end;
    end;
    if not dAdr.dmMens.mtDokumentSPEC_UCH.IsNull and dAdr.dmMens.mtDokumentSPEC_UCH.AsBoolean then begin
      AFont.Style := AFont.Style + [fsBold];
    end;
  end;
end;

procedure TfmAdres.N_F_edPrivateSectClick(Sender: TObject);
begin
{$IFDEF GKH}
  iPrivateSect.Visible:=N_F_edPrivateSect.Checked;
{$ENDIF}
end;

procedure TfmAdres.edControlHouseEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
// по умолчанию из параметров
  edControlHouse.Value:=0;
end;

procedure TfmAdres.edUseGilfondEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
// по умолчанию из параметров
  edUseGilfond.Value:=0;
end;

procedure TfmAdres.edControlHouseEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
// в частной собственности
  edControlHouse.Value:=-1;
end;

procedure TfmAdres.edControlHouseUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  EditDataSet(dAdr.mtBigHouse);
  if edControlHouse.Value<>null then begin
    if edControlHouse.Value=CONTROL_PRIVATE
      then dAdr.mtBigHousePRIVATE_SECT.AsBoolean:=True
      else dAdr.mtBigHousePRIVATE_SECT.AsBoolean:=False;
  end else begin
    {$IFDEF GKH}
      dAdr.mtBigHousePRIVATE_SECT.AsBoolean:=False;
    {$ELSE}
      dAdr.mtBigHousePRIVATE_SECT.AsBoolean:=True;
    {$ENDIF}
  end;
end;

procedure TfmAdres.pcChange(Sender: TObject);
begin
  TTabControl(Sender).Repaint;
end;

procedure TfmAdres.edDateKnUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if edDateKn.Value=null then begin
    edKolvoKn.Text:='';
  end else begin
    if edKolvoKn.Text=''
      then edKolvoKn.Value:=1;
  end;
end;

procedure TfmAdres.btUpClick(Sender: TObject);
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

procedure TfmAdres.btDownClick(Sender: TObject);
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

procedure TfmAdres.AddCreateControl(c: TWinControl; prop: TPropControl);
begin
//  ShowMessage(prop.Caption+'   '+c.ClassName+'    '+IntToStr(c.TabOrder));
end;

procedure TfmAdres.FormResize(Sender: TObject);
//var
//  i : Integer;
begin
  inherited;
//  sbProp.Invalidate;
// sbProp.Update;
//   For i := 0 to (ComponentCount - 1) do
//     begin
//        If (Components[i].ClassType = TRxLabel) then
//            TRxLabel(Components[i]).Refresh;
//     end;
end;

procedure TfmAdres.FormShow(Sender: TObject);
//var
//  i : Integer;
begin
  inherited;
//  sbProp.Invalidate;
//  sbProp.Update;
  {
   For i := 0 to (ComponentCount - 1) do
     begin
        If (Components[i].ClassType = TLabel) then
            TLabel(Components[i]).Refresh;
     end;
   }
end;

procedure TfmAdres.sbPropResize(Sender: TObject);
//var
//  i : Integer;
begin
  inherited;
//  WriteToDebug(['sbProp resize']);
  sbProp.Invalidate;
  sbProp.Update;
  {
   For i := 0 to (sbProp.ControlCount - 1) do
     begin
        If (sbProp.Controls[i].ClassType = TRxLabel) then begin
            TRxLabel(sbProp.Controls[i]).Invalidate;
            TRxLabel(sbProp.Controls[i]).Update;
        end;
     end;
  }
end;

procedure TfmAdres.edTipChange(Sender: TObject);
begin
  if edTip.ItemIndex>-1
    then iUchastok.Visible:=StrToInt(edTip.KeyItems[edTip.ItemIndex])=TH_UCHASTOK
    else iUchastok.Visible:=false;
end;
//KEY_HOUSE_V
procedure TfmAdres.dsDokumentDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field<>nil then begin
    if Field.FieldName='TIP' then
      iUchastok.Visible:=Field.AsInteger=TH_UCHASTOK;

  end;
end;
//---------------------------------------------------------------------
procedure TfmAdres.GridLichGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not dAdr.mtLichSchetDATE_LIKV.IsNull
    then AFont.Color:=clRed;
end;

const
  Err_Nalog = 'Можно корректировать только налоги адреса';

procedure TfmAdres.btEditNalogClick(Sender: TObject);
var
  Ic : TIcon;
  Params:TParamsEditSpr;
begin
  if dAdr.tbNalogiTYPEOBJ.AsInteger=_TypeObj_Adres then begin
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

procedure TfmAdres.btDeleteNalogClick(Sender: TObject);
begin
  if (dAdr.tbNalogi.State=dsBrowse) and
     not dAdr.tbNalogi.IsEmpty then begin
    if dAdr.tbNalogiTYPEOBJ.AsInteger=_TypeObj_Adres then begin
      if Problem(' Удалить текущий налог ?  ',mtConfirmation,self) then begin
        dAdr.tbNalogi.Delete;
        QueryExit:=true;
      end;
    end else begin
      PutError(Err_Nalog);
    end;
  end;
end;
procedure TfmAdres.GridNalogiDblClick(Sender: TObject);
begin
  btEditNalogClick(nil);
end;

procedure TfmAdres.btAddNalogClick(Sender: TObject);
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
procedure TfmAdres.GridNalogiColumns9GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds:TDataSet;
begin
  if dAdr.tbNalogiMEN_ID.IsNull then begin
    Params.Text:='';
  end else begin
    ds:=dmBase.GetMen(fmMain.DateFiks, dAdr.tbNalogiMEN_ID.AsString);
    if ds<>nil then begin
      Params.Text:=CreateFIO(ds,'');
    end;
  end;
end;

procedure TfmAdres.GridNalogiGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dAdr.tbNalogiTYPEOBJ.AsInteger<>_TypeObj_Adres then begin
    AFont.Color:=clBlue;
  end else begin

  end;
end;


procedure TfmAdres.Label28Click(Sender: TObject);
begin
  Label28.Caption:=dmbase.Adres_PunktN+' дом'+dmbase.Adres_NDom+' кв.'+dmbase.Adres_Kv;
end;

procedure TfmAdres.edUchTypeOwnerEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  nKod:Integer;
  Opis:TOpisEdit;
  l:Boolean;
begin
  nKod:=ChoiceFromShablonEx(nil, SHABLON_UCH_TYPE_OWN, true, ''); //VarToStr(edUchTypeOwner.Value));
  l:=dbDisableControls(dAdr.mtDokument);
  try
    if ModifyShablon then begin  // fShablon.pas
      CheckKeyListOpis('KEY_UCH_TYPE_OWN');   // uProject.pas
      LoadComboboxFromOpis( edUchTypeOwner, 'KEY_UCH_TYPE_OWN');
    end;
    if nKod>0 then begin
      EditDataSet(dAdr.mtDokument);
      dAdr.mtDokumentUCH_TYPEOWNER.AsInteger:=nKod;
      QueryExit:=true;
//      then edUchTypeOwner.Value:=nKod;
    end;
  finally
    dbEnableControls(dAdr.mtDokument,l);
  end;
end;

procedure TfmAdres.edPrimClick(Sender: TObject);
begin
  EditDataSet(dAdr.mtDokument);
end;

end.
