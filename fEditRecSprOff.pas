unit fEditRecSprOff;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants, OpisEdit,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons, Db, AddEvents, adsdata, dbFunc, uTypes,
  adsfunc, adstable, FuncPr, MetaTask, uProjectAll, ExtCtrls;

type
  TfmEditRecSprOff = class(TForm)
    pnBel: TPanel;
    lbBel: TLabel;
    pnFIO: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edPost: TDBEditEh;
    edFIO: TDBEditEh;
    edName: TDBEditEh;
    DataSource1: TDataSource;
    Query: TAdsQuery;
    QuerySeek: TAdsQuery;
    edFIOB: TDBEditEh;
    edPostB: TDBEditEh;
    pnBt: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    pnTel: TPanel;
    Label4: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    edTelMob: TDBEditEh;
    edTelefon: TDBEditEh;
    edNomer: TDBNumberEditEh;
    cbRukov: TDBCheckBoxEh;
    cbSpec: TDBCheckBoxEh;
    cbActual: TDBCheckBoxEh;
    pnFIOF: TPanel;
    lbFIOF: TLabel;
    edFIOF: TDBEditEh;
    procedure UpdateFieldName(Sender: TObject);
    procedure edSMDOChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edFIOUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edPostUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edFIOBUpdateData(Sender: TObject; var Handled: Boolean);
  private
    FClearKey : Boolean;
  public
    dsOrg:TDataSet;
    ID : Integer;
    FRun : Boolean;
    FAdd : Boolean;
  end;

var
  fmEditRecSprOff: TfmEditRecSprOff;

implementation

uses dBase, uProject;

var
  lSetDecimal : Boolean;

{$R *.DFM}

procedure TfmEditRecSprOff.edSMDOChange(Sender: TObject);
begin
  if not FRun then begin
  end;
end;
//--------------------------------------------------------------
procedure TfmEditRecSprOff.btOkClick(Sender: TObject);
var
  lOk:Boolean;
begin
  lOk:=true;
  if (edFIO.Text='') or (edPost.Text='') or (edName.Text='') then begin
    PutError('Заполните ФИО и должность',self);
    lOk:=false;
  end;
  if edFIOB.Visible and lOk and ((edFIOB.Text='') or (edPostB.Text='')) then begin
    PutError('Заполните ФИО и должность на белорусском языке',self);
    lOk:=false;
  end;
  if lOk
    then ModalResult:=mrOk;
end;
//--------------------------------------------------------------
procedure TfmEditRecSprOff.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 lSetDecimal:=false;
 if Key = VK_DECIMAL then begin
   lSetDecimal:=true;
 end;
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
end;

procedure TfmEditRecSprOff.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
  if lSetdecimal then begin
    Key := DecimalSeparator;
    lSetDecimal:=false;
  end;
end;

procedure TfmEditRecSprOff.FormCreate(Sender: TObject);
var
  strSQL : String;
  n:Integer;
begin
// 'KEY_CORR_TYPE'
  FAdd:=false;
  ID:=-1;
  lSetDecimal:=false;
  FClearKey:=false;
//  s := GlobalTask.ParamAsString('KOD');
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_CORR_TYPE',edCorrType.Items,edCorrType.KeyItems);
end;
//-------------------------------------------------------------------
procedure TfmEditRecSprOff.UpdateFieldName;
begin
  if not FRun then begin
    if (edFIO.Text<>'') and (edPost.Text<>'')
      then edName.Text:=edFIO.Text+' - '+edPost.Text;
  end;
end;
//-------------------------------------------------------------------
procedure TfmEditRecSprOff.edFIOUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if not FRun then begin
    TDbEditEh(Sender).Text:=FirstUpper(TDbEditEh(Sender).Text);
    UpdateFieldName(Sender);
  end;
end;

procedure TfmEditRecSprOff.edPostUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  UpdateFieldName(Sender);
end;

procedure TfmEditRecSprOff.edFIOBUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  TDbEditEh(Sender).Text:=FirstUpper(TDbEditEh(Sender).Text);
end;

end.
