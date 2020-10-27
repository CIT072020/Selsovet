unit fChoiceUL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrlsEh, StdCtrls, Mask, DBLookupEh, dBase, Db, Buttons, Metatask,
  FuncPr, adsdata, adsfunc, adstable
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmChoiceUL = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dsUL: TDataSource;
    edNameUL: TDBLookupComboboxEh;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    btAdd: TButton;
    Query: TAdsQuery;
    edTipUL: TDBEditEh;
    procedure btAddClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edNameULChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FError : Boolean;
  public
    function KodUL : Integer;
    procedure UpdateActions; override;
  end;

var
  fmChoiceUL: TfmChoiceUL;

implementation

uses fAddUL;

{$R *.DFM}

procedure TfmChoiceUL.btAddClick(Sender: TObject);
var
  f : TfmAddUL;
begin
  f := TfmAddUL.Create(nil);
  try
    if f.ShowModal = mrOk then begin
      Query.DisableControls;
      Query.Close;
      Query.Open;
      Query.EnableControls;
      edNameUL.Value := f.idUL;
    end;
  finally
    f.Free;
  end;
end;

procedure TfmChoiceUL.UpdateActions;
begin
  inherited;
  btOk.Enabled := ((edNameUL.Text<>'') and (edTipUL.Text<>''));
end;

procedure TfmChoiceUL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift=[]) and  (Key=VK_INSERT) then begin
    btAddClick(nil);
  end;
end;

procedure TfmChoiceUL.FormCreate(Sender: TObject);
var
  Tip : Integer;
begin
  Query.Open;
  edTipUL.Value:=null;
  edNameUL.Value:=GlobalTask.GetLastValueAsInteger('DEFAULT_KOD_UL');
  if edNameUL.Value <> null then begin
    if dmBase.SprUL.Locate('ID',edNameUL.Value,[]) then begin
      Tip := dmBase.SprUL.FieldByName('TIP').AsInteger;
      if dmBase.SprTypeUL.Locate('ID',Tip,[]) then begin
        edTipUL.Text := dmBase.SprTypeUL.FieldByName('NAME').AsString;
      end;
    end;
  end;
  ActiveControl := edNameUL;
end;

procedure TfmChoiceUL.btOkClick(Sender: TObject);
begin
  if not FError then begin
    GlobalTask.SetLastValueAsInteger('DEFAULT_KOD_UL', edNameUL.Value);
    ModalResult := mrOk;
  end;
end;

function TfmChoiceUL.KodUL: Integer;
begin
  Result := edNameUL.Value;
end;

procedure TfmChoiceUL.edNameULChange(Sender: TObject);
var
  Tip : Integer;
begin
  if edNameUL.Value <> null then begin
    if dmBase.SprUL.Locate('ID',edNameUL.Value,[]) then begin
      Tip := dmBase.SprUL.FieldByName('TIP').AsInteger;
      if dmBase.SprTypeUL.Locate('ID',Tip,[]) then begin
        edTipUL.Text := dmBase.SprTypeUL.FieldByName('NAME').AsString;
      end;
    end;
  end;
end;

procedure TfmChoiceUL.FormDestroy(Sender: TObject);
begin
  Query.Close;
end;

end.
