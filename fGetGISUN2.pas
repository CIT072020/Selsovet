unit fGetGISUN2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MetaTask,OpisEdit,Variants,
  StdCtrls, Buttons, ExtCtrls, SasaDbGrid, DbCtrlsEh, DbGridEh, DBLookupEh, dBase, uGISUN, uCheckKod, uProject, uTypes,
  Db, Math, FuncPr, FuncEh, ToolCtrlsEh, AddEvents, fEditMemo, vchDBCtrls, fSimpleD, Mask;

type

  TTypeColumnEh = ( tcString, tcNumber, tcBoolean, tcDate, tcPickList, tcSpr, tcMemo, tcLookup);

  TIN=record
    Caption:String;
    fldDok:TField;
    fldIN:TField;
  end;
  TArrIN=array of TIN;

  TCurValue=record
  end;

  TfmGetGISUN2 = class(TForm)
    pn: TPanel;
    btCancel: TBitBtn;
    btOk: TBitBtn;
    DataSource: TDataSource;
    pnIN3: TPanel;
    lbOn: TLabel;
    lbIN_ON: TLabel;
    edIN_ON: TDBEditEh;
    edPasp_ON: TDBComboBoxEh;
    pnIN4: TPanel;
    lbOna: TLabel;
    lbIN_ONA: TLabel;
    edIN_ONA: TDBEditEh;
    edPasp_ONA: TDBComboBoxEh;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPasp1Change(Sender: TObject);
    procedure edINUpdateData(Sender: TObject; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FGrid : TSasaDbGrid;
    FAkt  : TfmSimpleD;
    FAdd  : Boolean;
    FFlat : Boolean;
    FRun:Boolean;
    FStepY: Integer;
    FClearKey : Boolean;
    FOpisDok:TOpisEdit;
    function EditModal:Boolean;
    procedure OnEditMemo( Sender : TObject; var Handled: Boolean);
    procedure DBTextGetText(Sender: TObject; var Text: String);
    function GetDokType(ed:TDbComboBoxEh):Integer;
    function CheckOk:Boolean;
  public
    procedure UpdateActions; override;
  end;

  function GetInfoGISUN2(Akt: TfmSimpleD) : Boolean;

implementation

//uses OpisEdit;

{$R *.DFM}

function GetInfoGISUN2(Akt: TfmSimpleD) : Boolean;
var
  f : TfmGetGISUN2;
  i:Integer;
  kb:LongWord;
  lQuery:Boolean;
  sIN:String;
  nPasp:Integer;
begin
  // если в параметрах отключен контроль перед запросом
  if not Gisun.IsCheckQuery then begin
    Result:=true;
    exit;
  end;
  Result:=false;
  Akt.Dokument.CheckBrowseMode;
  lQuery:=false;

  sIN:=Akt.Dokument.FieldByName('ON_IDENTIF').AsString;
  nPasp:=Akt.Dokument.FieldByName('ON_DOK_TYPE').AsInteger;
  if IsRequireIN(nPasp) and (Length(sIN)<LEN_IN) then begin
    lQuery:=true;
  end;
  if not lQuery then begin
    sIN:=Akt.Dokument.FieldByName('ONA_IDENTIF').AsString;
    nPasp:=Akt.Dokument.FieldByName('ONA_DOK_TYPE').AsInteger;
    if IsRequireIN(nPasp) and (Length(sIN)<LEN_IN) then begin
      lQuery:=true;
    end;
  end;

  if lQuery then begin
    f := TfmGetGISUN2.Create(Akt);
    if (Akt.TypeObj=_TypeObj_ZRast) or (Akt.TypeObj=_TypeObj_DRast) then begin
     f.lbOn.Caption:='Он';
     f.lbOna.Caption:='Она';
    end;
    kb:=GetTypeKeyBoard;
    if Akt.FCheckKeyboard
      then ActivateENGKeyboard;

    f.FFlat := GlobalFlat;
    f.FStepY:= GlobalStepY;
    f.FAkt := Akt;

    try
      Result:=f.EditModal;
    finally
      FreeAndNil(f);
    end;
    if Akt.FCheckKeyboard and (kb>0) then
      ActivateKeyboardLayout(kb,KLF_ACTIVATE);
  end else begin
    Result:=true;
  end;

end;
//-----------------------------------------------------------------------
function TfmGetGISUN2.EditModal: Boolean;
var
  n:Integer;
  sNew:String;
begin
  FOpisDok:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_UDOST');
  edPasp_ON.KeyItems.Assign( FOpisDok.KeyList );
  edPasp_ON.Items.Assign( FOpisDok.Items );

  n:=edPasp_ON.KeyItems.IndexOf('888');   // просто документ
  if n>-1 then begin
    edPasp_ON.KeyItems.Delete(n);
    edPasp_ON.Items.Delete(n);
  end;
  n:=edPasp_ON.KeyItems.IndexOf('889');   // просто паспорт (старые актовые записи)
  if n>-1 then begin
    edPasp_ON.KeyItems.Delete(n);
    edPasp_ON.Items.Delete(n);
  end;

  edPasp_ONA.KeyItems.Assign( edPasp_ON.KeyItems );
  edPasp_ONA.Items.Assign( edPasp_ON.Items );

  ActiveControl:=nil;
  edPasp_ON.Value:=FAkt.Dokument.fieldByName('ON_DOK_TYPE').AsString;
  if (edPasp_ON.Value=null) or (VarToStr(edPasp_ON.Value)='') then begin
    edIN_ON.Text:='';
    edIN_ON.Enabled:=false;
    ActiveControl:=edPasp_ON;
  end else begin
    edIN_ON.Text:=FAkt.dokument.fieldByName('ON_IDENTIF').AsString;
    edIN_ON.Enabled:=true;
    ActiveControl:=edIN_ON;
  end;
  FRun:=true;
  edPasp_ONA.Value:=FAkt.Dokument.fieldByName('ONA_DOK_TYPE').AsString;
  if (edPasp_ONA.Value=null) or (VarToStr(edPasp_ONA.Value)='') then begin
    edIN_ONA.Text:='';
    edIN_ONA.Enabled:=false;
    if ActiveControl=nil then ActiveControl:=edPasp_ONA;
  end else begin
    edIN_ONA.Text:=FAkt.dokument.fieldByName('ONA_IDENTIF').AsString;
    edIN_ONA.Enabled:=true;
    if ActiveControl=nil then ActiveControl:=edIN_ONA;
  end;

  FRun:=false;
  if ShowModal=mrOk then begin
    FRun:=true;
    FAkt.dokument.Edit;
    FAkt.dokument.fieldByName('ON_DOK_TYPE').AsString:=VarToStr(edPasp_ON.Value);
    if edIN_ON.Enabled
      then FAkt.dokument.fieldByName('ON_IDENTIF').AsString:=Trim(edIN_ON.Value)
      else FAkt.dokument.fieldByName('ON_IDENTIF').AsString:='';
    if SetGragFromTypeDok(FAkt.dokument.fieldByName('ON_GRAG').AsString, FAkt.dokument.fieldByName('ON_DOK_TYPE').AsString, sNew) then begin
      FAkt.dokument.fieldByName('ON_GRAG').AsString:=sNew;
    end;

    FAkt.dokument.fieldByName('ONA_DOK_TYPE').AsString:=VarToStr(edPasp_ONA.Value);
    if edIN_ONA.Enabled
      then FAkt.dokument.fieldByName('ONA_IDENTIF').AsString:=Trim(edIN_ONA.Value)
      else FAkt.dokument.fieldByName('ONA_IDENTIF').AsString:='';
    if SetGragFromTypeDok(FAkt.dokument.fieldByName('ONA_GRAG').AsString, FAkt.dokument.fieldByName('ONA_DOK_TYPE').AsString, sNew) then begin
      FAkt.dokument.fieldByName('ONA_GRAG').AsString:=sNew;
    end;

    FAkt.dokument.Post;
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

procedure TfmGetGISUN2.btCancelClick(Sender: TObject);
begin
//  FGrid.DataSource.DataSet.Cancel;
  ModalResult:=mrCancel;
end;

procedure TfmGetGISUN2.btOkClick(Sender: TObject);
var
  lErr : Boolean;
  strErr:String;
begin
  lErr := false;
  try
//    if (FParam<>nil) and Assigned(FParam.OnBeforeSave) then begin
//      FParam.OnBeforeSave(FGrid,FAdd,Icon);
//    end;
//    FGrid.DataSource.DataSet.Post;
  except
//    on E:Exception do begin
//      lErr:=true;
//      if Pos('7057', E.Message) > 0 then begin
//        strErr := ' Дублирующее значение. ';
//      end else begin
//        strErr := E.Message;
//      end;
//      PutError(strErr);
//    end;
  end;
  if not lErr then begin
    ModalResult:=mrOk;
  end;
end;

procedure TfmGetGISUN2.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      if CheckOk then btOkClick(nil);
    end;
  end;
end;

procedure TfmGetGISUN2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmGetGISUN2.OnEditMemo(Sender: TObject; var Handled: Boolean);
begin
end;

procedure TfmGetGISUN2.DBTextGetText(Sender: TObject; var Text: String);
var
  Opis : TOpisEdit;
  ds   : TDataSet;
  ss   : String;
begin
  if TObject(TComponent(Sender).Tag) is TOpisEdit then begin
    Opis := TOpisEdit(TComponent(Sender).Tag);
    if Opis.DataSet<>nil then begin
      ds := TvchDBText(Sender).DataSource.DataSet;
      ss := TvchDBText(Sender).DataField;
      if ds.FieldByName(ss).IsNull or (ds.FieldByName(ss).AsString='') then begin
        Text := '';
      end else begin
        if Opis.FieldForNaim<>'' then begin
          if Opis.DataSet.Locate(Opis.ResultField,ds.FieldByName(ss).AsString,[]) then begin
            Text := Opis.DataSet.FieldByName(Opis.FieldForNaim).AsString;
          end else begin
            Text := '';
          end;
        end else begin
          Text := ''
        end;
      end;
    end;
  end;
end;

procedure TfmGetGISUN2.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action:=caFree;
  try
//    if (FGrid.DataSource.DataSet.State=dsInsert)	or
//       (FGrid.DataSource.DataSet.State=dsEdit) then  FGrid.DataSource.DataSet.Cancel;
  except
  end;
end;

procedure TfmGetGISUN2.edPasp1Change(Sender: TObject);
var
  ed  : TDbComboBoxEh;
  ed_ : TDbEditEh;
  s:String;
  lb:TLabel;
begin
  ed := TDbComboBoxEh(Sender);
  s:=Right(ed.Name,2);
  if s='ON' then begin
    ed_:=edIN_ON;
    lb:=lbIN_ON;
  end else begin
    ed_:=edIN_ONA;
    lb:=lbIN_ONA;
  end;
  ed_.Text:='';
  ed_.Enabled:=IsRequireIN( GetDokType(ed) );
  lb.Enabled:=ed_.Enabled;
//  ed_.Visible:=ed_.Enabled;
//  lb.Visible:=ed_.Enabled;
end;

procedure TfmGetGISUN2.edINUpdateData(Sender: TObject;  var Handled: Boolean);
var
  ed : TDbEditEh;
  s : String;
begin
  if not FRun then begin
    ed := TDbEditEh(Sender);
    s  := ed.Text;
    if Trim(s)<>'' then begin
      if CheckRUS(s) then ed.Text:=s;
      if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
        ed.Text := CheckLichNom(true, ed.Text);
        s:=GetErrorCheck;
        if s<>'' then begin
  //        PutError(s);
          raise ELichNomerInvalid.Create(s);
        end;
      end;
    end;
  end;
end;                                 

procedure TfmGetGISUN2.UpdateActions;
begin
  inherited;
  btOk.Enabled:=CheckOk;
end;
//----------------------------------------------------------------
function TfmGetGISUN2.GetDokType(ed:TDbComboBoxEh):Integer;
begin
  if (ed.Value=null) or (VarToStr(ed.Value)='') then begin
    Result:=0;
  end else begin
    Result:=ed.Value;
  end;
end;
//----------------------------------------------------------------
function TfmGetGISUN2.CheckOk:Boolean;
begin
  Result:=true;
  if IsRequireIN( GetDokType(edPasp_ON) ) and (Length(Trim(edIN_ON.Text))<LEN_IN) then begin
    Result:=false;
  end;
  if IsRequireIN( GetDokType(edPasp_ONA) ) and (Length(Trim(edIN_ONA.Text))<LEN_IN) then begin
    Result:=false;
  end;
end;

procedure TfmGetGISUN2.FormCreate(Sender: TObject);
var
  lPB:Boolean;
begin
  lPB:=true;
  edIN_ON.EditMask:=GetEditMaskIN(lPB);
  edIN_ONA.EditMask:=GetEditMaskIN(lPB);
end;

end.
