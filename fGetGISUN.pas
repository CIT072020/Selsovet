unit fGetGISUN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MetaTask,OpisEdit,Variants, uTypes,
  StdCtrls, Buttons, ExtCtrls, SasaDbGrid, DbCtrlsEh, DbGridEh, DBLookupEh, dBase, uGISUN, uCheckKod, uProject,
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

  TfmGetGISUN = class(TForm)
    pn: TPanel;
    btCancel: TBitBtn;
    btOk: TBitBtn;
    DataSource: TDataSource;
    pnIN: TPanel;
    pnIN1: TPanel;
    edIN1: TDBEditEh;
    lbPasp1: TLabel;
    lbINChild: TLabel;
    edINChild: TDBEditEh;
    pnIN2: TPanel;
    lbPasp2: TLabel;
    edIN2: TDBEditEh;
    pnIN3: TPanel;
    lbPasp3: TLabel;
    edIN3: TDBEditEh;
    pnIN4: TPanel;
    lbPasp4: TLabel;
    edIN4: TDBEditEh;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPasp1Change(Sender: TObject);
    procedure edIN1UpdateData(Sender: TObject; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FAkt  : TfmSimpleD;
    FFlat : Boolean;
    FStepY: Integer;
    FRun:Boolean;
    FClearKey : Boolean;
    FOpisDok:TOpisEdit;
    function EditModal:Boolean;
    procedure OnEditMemo( Sender : TObject; var Handled: Boolean);
    procedure DBTextGetText(Sender: TObject; var Text: String);
  public
    procedure UpdateActions; override;
    function CheckOk:Boolean;
  end;

  function GetInfoGISUN(Akt: TfmSimpleD) : Boolean;

implementation

//uses OpisEdit;

{$R *.DFM}
type

  TCurRec=record
     sPol:String;
     dDateR:TDateTime;
     sIN:String;
     nPasp1:Integer;
     nPasp2:Integer;
     nPasp3:Integer;
     nPasp4:Integer;
     sIN1:String;
     sIN2:String;
     sIN3:String;
     sIN4:String;
  end;

function GetInfoGISUN(Akt: TfmSimpleD) : Boolean;
var
  f : TfmGetGISUN;
  kb:LongWord;
  lQuery:Boolean;
  s:String;
begin
  // если в параметрах отключен контроль перед запросом
  if not Gisun.IsCheckQuery then begin
    Result:=true;
    exit;
  end;
  Result:=false;
  Akt.Dokument.CheckBrowseMode;
  lQuery:=true;


  if lQuery then begin
    f := TfmGetGISUN.Create(Akt);

    if Akt.TypeObj=_TypeObj_Opeka then begin
//      f.edIN4.Visible:=false;
//      f.lbPasp4.Visible:=false;
      if Akt.GetAddPROP('TYPEOPEKA')=1
        then s:='Опекун'
        else s:='Попечитель';
      f.lbPasp3.Caption:=s;
      f.lbPasp4.Caption:=s+' супруг(а)';
      f.lbINChild.Caption:='Подопечный';
    end;

    kb:=GetTypeKeyBoard;
    if Akt.FCheckKeyboard then
      ActivateENGKeyboard;

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
function TfmGetGISUN.EditModal: Boolean;
var
  n:Integer;
  sNew:String;
begin
  {
  FOpisDok:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_UDOST');
  edPasp1.KeyItems.Assign( FOpisDok.KeyList );
  edPasp1.Items.Assign( FOpisDok.Items );

  n:=edPasp1.KeyItems.IndexOf('888');   // просто документ
  if n>-1 then begin
    edPasp1.KeyItems.Delete(n);
    edPasp1.Items.Delete(n);
  end;
  n:=edPasp1.KeyItems.IndexOf('889');   // просто паспорт (старые актовые записи)
  if n>-1 then begin
    edPasp1.KeyItems.Delete(n);
    edPasp1.Items.Delete(n);
  end;

  edPasp2.KeyItems.Assign( edPasp1.KeyItems );
  edPasp2.Items.Assign( edPasp1.Items );
  edPasp3.KeyItems.Assign( edPasp1.KeyItems );
  edPasp3.Items.Assign( edPasp1.Items );
  edPasp4.KeyItems.Assign( edPasp1.KeyItems );
  edPasp4.Items.Assign( edPasp1.Items );
  }
  FRun:=true;
  ActiveControl:=edINChild;
  if FAkt.TypeObj=_TypeObj_Opeka then begin
    edINChild.Value:=FAkt.dokument.fieldByName('IDENTIF').AsString;
    edIN1.Value:=FAkt.dokument.fieldByName('OTEC_IDENTIF').AsString;
    edIN2.Value:=FAkt.dokument.fieldByName('MAT_IDENTIF').AsString;
    edIN3.Value:=FAkt.dokument.fieldByName('ON_IDENTIF').AsString;
    if FAkt.dokument.fieldByName('TWO').AsBoolean then begin
      edIN4.Value:=FAkt.dokument.fieldByName('ONA_IDENTIF').AsString;
    end else begin
      edIN4.Value:='';
      edIN4.Enabled:=false;
      lbPasp4.Enabled:=false;
    end;
  end else begin
    edINChild.Value:=FAkt.dokument.fieldByName('IDENTIF_DO').AsString;
    edIN1.Value:=FAkt.dokument.fieldByName('OTEC_IDENTIF').AsString;
    edIN2.Value:=FAkt.dokument.fieldByName('MAT_IDENTIF').AsString;
    edIN3.Value:=FAkt.dokument.fieldByName('ON_IDENTIF').AsString;
    edIN4.Value:=FAkt.dokument.fieldByName('ONA_IDENTIF').AsString;
  end;

  FRun:=false;
  if ShowModal=mrOk then begin
    FRun:=true;
    FAkt.dokument.Edit;
    if FAkt.TypeObj=_TypeObj_Opeka then begin
      FAkt.dokument.fieldByName('IDENTIF').AsString:=Trim(VarToStr(edINChild.Value));
      FAkt.dokument.fieldByName('OTEC_IDENTIF').AsString:=Trim(VarToStr(edIN1.Value));
      FAkt.dokument.fieldByName('MAT_IDENTIF').AsString:=Trim(VarToStr(edIN2.Value));
      FAkt.dokument.fieldByName('ON_IDENTIF').AsString:=Trim(VarToStr(edIN3.Value));
      if FAkt.dokument.fieldByName('TWO').AsBoolean then begin
        FAkt.dokument.fieldByName('ONA_IDENTIF').AsString:=Trim(VarToStr(edIN4.Value));
      end;
    end else begin
      FAkt.dokument.fieldByName('IDENTIF_DO').AsString:=Trim(VarToStr(edINChild.Value));
      FAkt.dokument.fieldByName('IDENTIF_POSLE').AsString:=Trim(VarToStr(edINChild.Value));
      FAkt.dokument.fieldByName('OTEC_IDENTIF').AsString:=Trim(VarToStr(edIN1.Value));
      FAkt.dokument.fieldByName('MAT_IDENTIF').AsString:=Trim(VarToStr(edIN2.Value));
      FAkt.dokument.fieldByName('ON_IDENTIF').AsString:=Trim(VarToStr(edIN3.Value));
      FAkt.dokument.fieldByName('ONA_IDENTIF').AsString:=Trim(VarToStr(edIN4.Value));
    end;
    FAkt.dokument.Post;
    Result:=true;
  end else begin
    Result:=false;
  end;
end;
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.btCancelClick(Sender: TObject);
begin
//  FGrid.DataSource.DataSet.Cancel;
  ModalResult:=mrCancel;
end;
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.btOkClick(Sender: TObject);
var
  lErr : Boolean;
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
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      if CheckOk then btOkClick(nil);
    end;
  end;
end;
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.OnEditMemo(Sender: TObject; var Handled: Boolean);
begin
end;
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.DBTextGetText(Sender: TObject; var Text: String);
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
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action:=caFree;
  try
//    if (FGrid.DataSource.DataSet.State=dsInsert)	or
//       (FGrid.DataSource.DataSet.State=dsEdit) then  FGrid.DataSource.DataSet.Cancel;
  except
  end;
end;
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.edPasp1Change(Sender: TObject);
begin
end;
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.edIN1UpdateData(Sender: TObject;  var Handled: Boolean);
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
          PutError(s);
          Activecontrol:=ed;
//          raise ELichNomerInvalid.Create(s);
        end;
      end;
    end;
  end;
end;
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.UpdateActions;
begin
  inherited;
  btOk.Enabled:=CheckOk;
end;
//---------------------------------------------------------------------------------------
procedure TfmGetGISUN.FormCreate(Sender: TObject);
var
  lPB:Boolean;
begin
  lPB:=true;
  edINChild.EditMask:=GetEditMaskIN(true);
  edIN1.EditMask:=GetEditMaskIN(lPB);
  edIN2.EditMask:=GetEditMaskIN(lPB);
  edIN3.EditMask:=GetEditMaskIN(lPB);
  edIN4.EditMask:=GetEditMaskIN(lPB);
end;
//---------------------------------------------------------------------------------------
function TfmGetGISUN.CheckOk: Boolean;
var
  lc,l1,l2,l3,l4:Boolean;
begin
  Result:=true;
  lc:=false;
  l1:=false;
  l2:=false;
  l3:=false;
  l4:=false;
  if (Trim(edINChild.Text)<>'') then begin
    if (Length(Trim(edINChild.Text))<LEN_IN) then begin
      Result:=false;
    end else begin
      lc:=true;
    end;
  end;
  if (Trim(edIN1.Text)<>'') then begin
    if (Length(Trim(edIN1.Text))<LEN_IN) then begin
      Result:=false;
    end else begin
      l1:=true;
    end;
  end;
  if (Trim(edIN2.Text)<>'') then begin
    if (Length(Trim(edIN2.Text))<LEN_IN) then begin
      Result:=false;
    end else begin
      l2:=true;
    end;
  end;
  if (Trim(edIN3.Text)<>'') then begin
    if (Length(Trim(edIN3.Text))<LEN_IN) then begin
      Result:=false;
    end else begin
      l3:=true;
    end;
  end;
  if edIN4.Visible and (Trim(edIN4.Text)<>'') then begin
    if (Length(Trim(edIN4.Text))<LEN_IN) then begin
      Result:=false;
    end else begin
      l4:=true;
    end;
  end;
  if not lc and not l1 and not l2 and not l3 and not l4 then begin
    Result:=false;
  end;
end;


end.
