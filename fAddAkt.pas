unit fAddAkt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, Mask, DBLookupEh, OpisEdit, MetaTask, dBase,
  Db, AddEvents, FuncPr;

{$I Task.inc}

type
  TfmAddAkt = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    lbDay: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    edNomer: TDBNumberEditEh;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    edZAGS_ID: TDBLookupComboboxEh;
    DataSource1: TDataSource;
    edDay: TDBNumberEditEh;
    edMonth: TDBNumberEditEh;
    edYear: TDBNumberEditEh;
    lbMonth: TLabel;
    cbVosstan: TDBCheckBoxEh;
    lbVosstan: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btOkClick(Sender: TObject);
    procedure edFamiliaExit(Sender: TObject);
    procedure edNameExit(Sender: TObject);
    procedure edOtchExit(Sender: TObject);
    procedure edNomerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    FClearKey  : Boolean;
    FZAGS_NAME : String;
    FZAGS_ID   : Integer;
    FType      : Integer;
    procedure CheckDefault;
  end;

var
  fmAddAkt: TfmAddAkt;

implementation

{$R *.DFM}

procedure TfmAddAkt.CheckDefault;
begin
  edZAGS_ID.Enabled := true;
  if FZAGS_ID>0 then begin
    edZAGS_ID.Value   := FZAGS_ID;
    edZAGS_ID.Enabled := false;
  end else if (FZAGS_NAME<>'') then begin
    edZAGS_ID.Text    := FZAGS_NAME;
    edZAGS_ID.Enabled := false;
  end;
end;

procedure TfmAddAkt.FormCreate(Sender: TObject);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  {$IFDEF ZAGS}
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS');
  {$ELSE}
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_S');
  {$ENDIF}
  FZAGS_ID:=0;
  FZAGS_NAME:='';
  FType:=0;
  edFamilia.text := '';
  edName.text := '';
  edOtch.text := '';
  edNomer.text := '';
end;

procedure TfmAddAkt.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_F2) or (Key=VK_INSERT) then begin
    btOkClick(nil);
  end else if (Key=106) then begin  // "*"
    if cbVosstan.Enabled and cbVosstan.Visible then begin
      cbVosstan.Checked:=not cbVosstan.Checked;
    end;
    FClearKey:=true;
    Key:=0;
  end;
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
end;

procedure TfmAddAkt.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmAddAkt.edNomerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=' ' then begin
    Key:=#0;
    cbVosstan.Checked:=not cbVosstan.Checked;
  end;
end;

procedure TfmAddAkt.btOkClick(Sender: TObject);
var
  d:TDateTime;
begin
  if edFamilia.text<>'' then begin
    d:=1;
    if edDay.Enabled then begin  // вводим полную дату
      try
        d:=Encodedate(edYear.Value, edMonth.Value, edDay.Value);
      except
        d:=0;
      end;
      if d=0 then begin
        PutError('Ошибка ввода даты.', self);
      end;
    end;
    if d>0 then begin
      edFamilia.Text := Trim(FirstUpper( edFamilia.Text ));
      edName.Text    := Trim(FirstUpper( edName.Text ));
      edOtch.Text    := Trim(FirstUpper( edOtch.Text ));
      ActiveControl := edFamilia;
      edFamilia.SelectAll;
      ModalResult := mrOk;
    end;
  end else begin
    PutError('Заполните фамилию.');
  end;
end;

procedure TfmAddAkt.edFamiliaExit(Sender: TObject);
begin
  edFamilia.Text := Trim(FirstUpper( edFamilia.Text ));
end;

procedure TfmAddAkt.edNameExit(Sender: TObject);
begin
  edName.Text := Trim(FirstUpper( edName.Text ));
end;

procedure TfmAddAkt.edOtchExit(Sender: TObject);
begin
  edOtch.Text := Trim(FirstUpper( edOtch.Text ));
end;


end.
