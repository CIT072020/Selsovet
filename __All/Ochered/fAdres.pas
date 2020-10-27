//�������
unit fAdres;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimple, Db, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, StdCtrls, Mask, Variants, DBFunc,
  DBCtrlsEh, DBLookupEh, ExtCtrls, TB2ToolWindow, dBase, dAdres, MetaTask, uProject, uTypes,
  vchDBCtrls, Grids, DBGridEh, SasaDBGrid, Buttons, OpisEdit, FuncPr, fAddSobstv,CreateControls,
  ImgList, RXCtrls;

type
  TfmAdres = class(TfmSimple)
    pc: TPageControl;
    tsMain: TTabSheet;
    dsUL: TDataSource;
    dsPunkt: TDataSource;
    tsProp: TTabSheet;
    gbVlMen: TGroupBox;
    sbProp: TScrollBox;
    dsLichSchet: TDataSource;
    dsDopProp: TDataSource;
    GridLich: TSasaDBGrid;
    gbSobstv: TGroupBox;
    Panel1: TPanel;
    btAddMen: TBitBtn;
    btDelMen: TBitBtn;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    GridProp: TDBGridEh;
    sbAdd: TSpeedButton;
    sbDel: TSpeedButton;
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
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel3: TPanel;
    GridSobstv: TSasaDBGrid;
    cbHist: TDBCheckBoxEh;
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
    pnMain: TPanel;
    vchDBText1: TvchDBText;
    iPrivateSect: TImage;
    Label4: TLabel;
    Label6: TLabel;
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
    Label16: TLabel;
    edEtag: TDBNumberEditEh;
    edKol_Etag: TDBNumberEditEh;
    edPredst: TDBLookupComboboxEh;
    edGilfond: TDBComboBoxEh;
    N_F_edPrivateSect: TDBCheckBoxEh;
    edControlHouse: TDBComboBoxEh;
    edUseGilfond: TDBComboBoxEh;
    N_F_cbSpecUch: TDBCheckBoxEh;
    iUchastok: TImage;
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
    procedure cbHistClick(Sender: TObject);
    procedure GridSobstvColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure btRemoveClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure btEditMenAdresClick(Sender: TObject);
    procedure GridMensColumns6GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridMensGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure N_F_edPrivateSectClick(Sender: TObject);
    procedure edControlHouseEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edControlHouseEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure edControlHouseUpdateData(Sender: TObject;
      var Handled: Boolean);
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
  end;

var
  fmAdres: TfmAdres;

implementation

uses fMain, fEditRecHistOwners, dMen, uObjectsScript;


{$R *.DFM}

{ TfmAdres }

constructor TfmAdres.Create(Owner: TComponent);
begin
  inherited;
  cbHist.Checked:=false;
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
  dAdr.mtBigHouse.Open;

  dsBigHouse.DataSet := dAdr.mtBigHouse;
  dsLichSchet.DataSet := dAdr.mtLichSchet;

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
      fmMain.fmMen.TBItemWrite.Caption:='�����';
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
  FGurnal:=strGurnal;  // ������ �� �������� ������� �����
  pc.ActivePageIndex:=0;
  Adres.dmAdres := TdmAdres(Dokument);
  Adres.OnlyAdres:=true;
  TBSubmenuTmp.Visible:=LoadTemplate('fmAdres');

  if GetParam('RUN_REPORT','0')='1' then begin
    RunReport;
  end;
  {$IFDEF OCHERED}
     tsMCHS.TabVisible:=false;
  {$ENDIF}

  if IsShowEdit then begin
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

function TfmAdres.GetdsDopProp: TDataSource;
begin
  Result := dsDopProp;
end;

procedure TfmAdres.dsDopPropDataChange(Sender: TObject; Field: TField);
begin
  if Field<>nil then begin
    QueryExit := true;
  end;
end;

procedure TfmAdres.FormCreate(Sender: TObject);
begin
  inherited;
  fmMain.ImageList.GetBitmap(IL_ADD_MEN, sbAdd.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_MEN, sbDel.Glyph);
end;

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
        PutError(' ������ ���������� ��������. ');
        TdmAdres(Dokument).tbHouseProps.Cancel;
      end;
    end else begin
      PutError(' �������� ��� ���������� � ������. ');
    end;
  end;
end;

procedure TfmAdres.sbDelClick(Sender: TObject);
begin
  if TdmAdres(Dokument).tbHouseProps.RecordCount>0 then begin
    if Problem(' ������� �������� �� ������ ��������� ? ') then begin
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
  QueryExit := true;
end;

procedure TfmAdres.btEditMenClick(Sender: TObject);
begin
  if GetViewHist then begin
    EditSobstvHist( TdmAdres(Dokument), false);
  end else begin
    EditSobstv( TdmAdres(Dokument).tbHouseOwners, TdmAdres(Dokument).tbHouseOwnersHist, nil, -1, false);
  end;
  QueryExit := true;
end;

procedure TfmAdres.btDelMenClick(Sender: TObject);
begin
  if GetViewHist then begin
    if TdmAdres(Dokument).tbHouseOwnersHist.RecordCount>0 then begin
      if Problem(' ������� ������������ �� ������� ? ') then begin
        QueryExit := true;
        TdmAdres(Dokument).tbHouseOwnersHist.Delete;
      end;
    end;
  end else begin
    if TdmAdres(Dokument).tbHouseOwners.RecordCount>0 then begin
      if Problem(' ������� ������������ ? ') then begin
        QueryExit := true;
        TdmAdres(Dokument).tbHouseOwners.Delete;
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
      if Problem(' ����������� ������������ � ������� ? ') then begin
        if dAdr.tbHouseOwnersDATEP.IsNull then begin
          PutError('��������� ���� ��������� ��������.');
        end else begin
          lRemove:=true;
          if (dmBase.GetCurDate<dAdr.tbHouseOwners.FieldByName('DATEP').AsDateTime) then begin
            lRemove:=Problem('������� ���� ������ ���� ���������. �����������?');
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

procedure TfmAdres.vchDBText1GetText(Sender: TObject; var Text: String);
begin
  if dAdr<>nil then begin
    if (dAdr.mtDokumentID.AsString<>'') and (dAdr.mtDokumentID.AsString<>'-1') then begin
      Text := dmBase.AdresFromID(dAdr.DateFiks, dAdr.mtDokumentID.AsString);
    end;
  end;
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
    gbSobstv.Caption:=' ������� ������������� ';
    btRemove.Enabled:=false;
  end else begin
    GridSobstv.DataSource.DataSet:=dAdr.tbHouseOwners;
    gbSobstv.Caption:=' ������������ ';
    btRemove.Enabled:=true;
  end;
end;

procedure TfmAdres.cbHistClick(Sender: TObject);
begin
  SetViewHist(cbHist.Checked);
end;

procedure TfmAdres.GridMensColumns6GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      if (Params.Text='�') then begin
        Params.Text:='�������';
      end else if (Params.Text='�') then begin
        Params.Text:='�������';
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
  iPrivateSect.Visible:=edPrivateSect.Checked;
{$ENDIF}
end;

procedure TfmAdres.edControlHouseEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
// �� ��������� �� ����������
  edControlHouse.Value:=0;
end;

procedure TfmAdres.edUseGilfondEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
// �� ��������� �� ����������
  edUseGilfond.Value:=0;
end;

procedure TfmAdres.edControlHouseEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
// � ������� �������������
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
{
  if edDateKn.Value=null then begin
    edKolvoKn.Text:='';
  end else begin
    if edKolvoKn.Text=''
      then edKolvoKn.Value:=1;
  end;
}  
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

end.
