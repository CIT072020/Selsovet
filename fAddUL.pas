unit fAddUL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrlsEh, StdCtrls, Buttons, Mask, DBLookupEh, dBase, db, FuncPr
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmAddUL = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    edNameUL: TDBEditEh;
    edTipUL: TDBLookupComboboxEh;
    DataSource: TDataSource;
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idUL : Integer;
    procedure UpdateActions; override;
  end;

var
  fmAddUL: TfmAddUL;

implementation

{$R *.DFM}

{ TfmAddUL }

procedure TfmAddUL.UpdateActions;
begin
  inherited;
  btOk.Enabled := ( (Trim(edNameUL.Text)<>'') and (edTipUL.Value<>null) );
end;

procedure TfmAddUL.btOkClick(Sender: TObject);
var
  vSeek : Variant;
begin
  vSeek := VarArrayCreate( [0, 1], varOleStr );
  vSeek[0] := edNameUL.Text;
  vSeek[1] := edTipUL.Value;
  if not dmBase.SprUL.Locate('NAME;TIP',vSeek,[loCaseInsensitive]) then begin
    dmBase.SprUL.Append;
    dmBase.SprUL.FieldByName('NAME').AsString:=edNameUL.Text;
    dmBase.SprUL.FieldByName('TIP').AsString:=VarToStr(edTipUL.Value);
    dmBase.SprUL.Post;
    idUL := dmBase.SprUL.FieldByName('ID').AsInteger;
    ModalResult := mrOk;
  end else begin
    PutError('"'+edTipUL.Text+' '+edNameUL.Text+'" уже существует.  ');
  end;
end;

end.
