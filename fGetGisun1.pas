unit fGetGISUN1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uTypes,
  StdCtrls, Buttons, ExtCtrls, SasaDbGrid, DbCtrlsEh, DbGridEh, DBLookupEh, dBase, uCheckKod, uGISUN,
  Db, Math, FuncPr, FuncEh, ToolCtrlsEh, AddEvents, fEditMemo, vchDBCtrls, fSimpleD, MetaTask, uProject,
  Mask;

type

  TTypeColumnEh = ( tcString, tcNumber, tcBoolean, tcDate, tcPickList, tcSpr, tcMemo, tcLookup);

  TIN=record
    Caption:String;
    fldDok:TField;
    fldIN:TField;
  end;
  TArrIN=array of TIN;

  TfmGetGISUN1 = class(TForm)
    pn: TPanel;
    btCancel: TBitBtn;
    btOk: TBitBtn;
    DataSource: TDataSource;
    PanelIN: TPanel;
    lbINChild: TLabel;
    edIN: TDBEditEh;
    cbDok: TDBCheckBoxEh;
    lbDecl: TLabel;
    edDecl: TDBEditEh;
    Bevel: TBevel;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FGrid : TSasaDbGrid;
    FAkt  : TfmSimpleD;
    FAdd  : Boolean;
    FFlat : Boolean;
    FStepY: Integer;
    FClearKey : Boolean;
    FErr:Boolean;
    FDecl:Boolean;
    FsErr:String;
//    FParam : TParamsEditSpr;
//    function GetTypeColumn( Grid : TSasaDbGrid; i : Integer) : TTypeColumnEh;
    procedure OnEditMemo( Sender : TObject; var Handled: Boolean);
    procedure DBTextGetText(Sender: TObject; var Text: String);
    function  CheckIN(ed : TDbEditEh; sName:String):Boolean;
    function CheckOk:Boolean;
  public
    procedure UpdateActions; override;
  end;

  function GetInfoGISUN1(Akt: TfmSimpleD; sFld:String; sFldDecl:String) : Boolean;

implementation

uses OpisEdit; //, fAktZ;

{$R *.DFM}

function GetInfoGISUN1(Akt: TfmSimpleD; sFld:String; sFldDecl:String) : Boolean;
var
  f : TfmGetGISUN1;
  i:Integer;
  sINDecl,sIN,sFldDok:String;
  kb:LongWord;
begin
  // если в параметрах отключен контроль перед запросом
  if not Gisun.IsCheckQuery then begin
    Result:=true;
    exit;
  end;
  Result:=false;
//  TfmAktZ(Akt).edZH_KLAD.Visible:=false;
  Akt.Dokument.CheckBrowseMode;
  sFldDok:='';
  if sFld='' then begin
    if Akt.TypeObj=_TypeObj_AktZAH then begin
      sFld:='LICH_NOMER';
      sFldDok:='';
    end else if Akt.TypeObj=dmBase.TypeObj_ZSmert then begin
      sFld:='LICH_NOMER';
      sFldDok:='IS_SDAN_DOK';
    end else begin
      sFld:='IDENTIF';
      sFldDok:=''
    end;
  end else begin
    sFldDok:=''
  end;
  sIN:=Trim(Akt.Dokument.FieldByName(sFld).AsString);
  { !!! будем всегда открывать форму для запроса  !!!
  if Length(sIN)=14 then begin
    Result:=true;
    if sFldDok<>'' then begin
      Akt.Dokument.Edit;
      Akt.Dokument.FieldByName(sFldDok).AsBoolean:=true;
      Akt.Dokument.Post;
    end;
    EXIT;
  end;
  }
  kb:=GetTypeKeyBoard;
  if Akt.FCheckKeyboard
    then ActivateENGKeyboard;
  f := TfmGetGISUN1.Create(Akt);
  if sFldDok='' then begin
    f.cbDok.Visible:=false;
  end;
  f.FFlat := GlobalFlat;
  f.FStepY:= GlobalStepY;
  f.FAkt := Akt;
  f.edIN.Text:=sIN;
  if sFldDecl='' then begin
    f.Height:=f.Height-40;
    f.Bevel.Visible:=false;
    f.edDecl.Visible:=false;
    f.lbDecl.Visible:=false;
    f.FDecl:=false;
    f.edDecl.Text:='';
  end else begin
    f.edDecl.Text:=Trim(Akt.Dokument.FieldByName(sFldDecl).AsString);
  end;
  try
    if f.ShowModal=mrOk then begin
      Akt.Dokument.Edit;
      Akt.Dokument.FieldByName(sFld).AsString:=Trim(f.edIN.Text);
      if sFldDok<>'' then begin
        Akt.Dokument.FieldByName(sFldDok).AsBoolean:=f.cbDok.Checked;
      end;
      if sFldDecl<>'' then begin
        Akt.Dokument.FieldByName(sFldDecl).AsString:=Trim(f.edDecl.Text);
      end;
      Akt.Dokument.Post;
      Result:=true;
    end else begin
      Result:=false;
    end;
  finally
    FreeAndNil(f);
  end;
  if Akt.FCheckKeyboard and (kb>0) then
    ActivateKeyboardLayout(kb,KLF_ACTIVATE);
end;

//---------------------------------------------------------
procedure TfmGetGISUN1.btCancelClick(Sender: TObject);
begin
//  FGrid.DataSource.DataSet.Cancel;
  ModalResult:=mrCancel;
end;

procedure TfmGetGISUN1.btOkClick(Sender: TObject);
begin
  FsErr:='';
  if CheckIN(edIN, '') and CheckIN(edDecl, 'Заявитель: '#13#10) then begin
    ModalResult:=mrOk;
  end else begin
    PutError(FsErr);
    ActiveControl:=edIN;
  end;
end;

procedure TfmGetGISUN1.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_INSERT) then begin
      cbDok.Checked:=not cbDok.Checked;
    end else if CheckOk and ((Key = VK_F2) or (Key = VK_RETURN)) and (Shift=[]) then begin
      btOkClick(nil);
    end;
  end;
end;

procedure TfmGetGISUN1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmGetGISUN1.OnEditMemo(Sender: TObject; var Handled: Boolean);
begin
end;

procedure TfmGetGISUN1.DBTextGetText(Sender: TObject; var Text: String);
var
  Opis : TOpisEdit;
  ds   : TDataSet;
  ss   : String;
begin
  if TObject(TComponent(Sender).Tag) is TOpisEdit then begin
  {
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
    }
  end;
end;

procedure TfmGetGISUN1.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action:=caFree;
  try
//    if (FGrid.DataSource.DataSet.State=dsInsert)	or
//       (FGrid.DataSource.DataSet.State=dsEdit) then  FGrid.DataSource.DataSet.Cancel;
  except
  end;
end;

function TfmGetGISUN1.CheckIN(ed : TDbEditEh; sName:String):Boolean;
var
  s : String;
begin
  Result:=true;
  s  := Trim(ed.Text);
  if s<>'' then begin
    if CheckRUS(s) then ed.Text:=s;
    if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
      ed.Text := CheckLichNom(true, ed.Text);
      FsErr:=GetErrorCheck;
      if FsErr<>'' then begin
        FsErr:=sName+FsErr;
        Result:=false;
      end;
    end;
  end;
end;

procedure TfmGetGISUN1.FormCreate(Sender: TObject);
begin
  FErr:=false;
  FDecl:=true;
//  edIN.EditMask:=GetEditMaskIN(true);
end;
//----------------------------------------------------------------
function TfmGetGISUN1.CheckOk:Boolean;
begin
  Result:=true;
  if FDecl then begin   // можно ввести два ИН
    if (Length(Trim(edDecl.Text))<LEN_IN) and (Length(Trim(edIN.Text))<LEN_IN) then begin
      Result:=false;
    end;
    if Result then begin
      if ( (Trim(edDecl.Text)<>'') and (Length(Trim(edDecl.Text))<LEN_IN) ) or
         ( (Trim(edIN.Text)<>'') and (Length(Trim(edIN.Text))<LEN_IN)  ) then begin
        Result:=false;
      end;
    end;
  end else begin
    if (Length(Trim(edIN.Text))<LEN_IN) then begin
      Result:=false;
    end;
  end;
end;

procedure TfmGetGISUN1.UpdateActions;
begin
  inherited;
  btOk.Enabled:=CheckOk;
end;

end.
