unit fAccountSvid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB2Item, TB2Dock, TB2Toolbar, DBCtrlsEh, StdCtrls, Mask, uFunc;

type
  TfmAccountSvid = class(TForm)
    TBDock1: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemZAGS: TTBItem;
    TBItemWrite: TTBItem;
    TBItemCancel: TTBItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edDate: TDBDateTimeEditEh;
    edOper: TDBComboBoxEh;
    edSeria: TDBEditEh;
    Label5: TLabel;
    edNomer1: TDBEditEh;
    edNomer2: TDBEditEh;
    Label6: TLabel;
    edType: TDBComboBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TBItemWriteClick(Sender: TObject);
    procedure TBItemCancelClick(Sender: TObject);
    procedure edOperChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function WriteAccount : Boolean;
    procedure Edit;
    function GetOper : String;
  end;

  procedure AccountSvid;

var
  fmAccountSvid: TfmAccountSvid;

implementation

uses OpisEdit, MetaTask;

{$R *.DFM}

procedure AccountSvid;
begin
  fmAccountSvid := TfmAccountSvid.Create(nil);
  fmAccountSvid.Edit;
  fmAccountSvid.Free;
end;

procedure TfmAccountSvid.Edit;
begin
  ShowModal;
end;

procedure TfmAccountSvid.FormCreate(Sender: TObject);
var
  op : TOpisEdit;
begin
  LoadPosForm( Self );
  edOper.Items.Clear;
  edOper.Items.Add('Приход');
  edOper.Items.Add('Остаток');
  edOper.Items.Add('Возврат');
  edOper.Items.Add('Удаление');
  edOper.Items.Add('Испорчено');
  {$IFDEF ZAGS}
  edOper.Items.Add('Передача');
  op := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS');
  {$ELSE}
  op := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_S');
  {$ENDIF}
  edType.Items.Assign( op.Items );
  edType.KeyItems.Assign( op.KeyList );
  edType.ItemIndex:=0;
  edOper.ItemIndex:=0;
  edSeria.Text:='I-АЛ'
end;

procedure TfmAccountSvid.FormDestroy(Sender: TObject);
begin
  SavePosForm( Self );
end;

function TfmAccountSvid.WriteAccount: Boolean;
begin
  Result := true;
end;

procedure TfmAccountSvid.TBItemWriteClick(Sender: TObject);
begin
  if WriteAccount then ModalResult := mrOk;
end;

procedure TfmAccountSvid.TBItemCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmAccountSvid.edOperChange(Sender: TObject);
var
 s : String;
begin
  s := GetOper;
  if s<>'' then begin
    if s='Испорчено' then begin
      Label4.Caption   := 'Номер';
      Label5.Visible   := false;
      edNomer2.Visible := false;
    end else begin
      Label4.Caption   := 'Номера  с';
      Label5.Visible   := true;
      edNomer2.Visible := true;
    end;
  end;
end;

function TfmAccountSvid.GetOper: String;
begin
  Result := '';
  if edOper.ItemIndex>-1 then begin
    Result:=edOper.Items[edOper.ItemIndex];
  end;
end;

end.
