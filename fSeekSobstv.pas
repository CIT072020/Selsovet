unit fSeekSobstv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uTypes,
  Dialogs, fSimpleDialog, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh;

type

  TRecordSeekSobstv=record
    TypeSeek : Integer;
    Value    : String;
    History  : Integer;
  end;

  TfmSeekSobstv = class(TfmSimpleDialog)
    edSeek: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edSeek2: TComboBox;
    edSeek1: TComboBox;
    procedure edSeek1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  SOBSTV_CUR=0;         // текущие собственники
  SOBSTV_HIST=1;        // история собственников
  SOBSTV_ALL=2;         // все собственники

  function SetSeekSobstv(var CurSeek : TRecordSeekSobstv; Owner:TComponent) : Boolean;

implementation

uses dBase;

{$R *.dfm}

function SetSeekSobstv(var CurSeek : TRecordSeekSobstv; Owner:TComponent) : Boolean;
var
  fmSeekSobstv: TfmSeekSobstv;
begin
  fmSeekSobstv:=TfmSeekSobstv.Create(Owner);
  if CurSeek.TypeSeek=OWNER_NASEL
    then fmSeekSobstv.edSeek1.ItemIndex:=0
    else fmSeekSobstv.edSeek1.ItemIndex:=1;
  fmSeekSobstv.edSeek2.ItemIndex:=CurSeek.History;
  fmSeekSobstv.edSeek.Text:=CurSeek.Value;
  if fmSeekSobstv.edSeek1.ItemIndex=0
    then fmSeekSobstv.Label2.Caption:='Фамилия'
    else fmSeekSobstv.Label2.Caption:='Организация';
  if fmSeekSobstv.ShowModal=mrOk then begin
    if fmSeekSobstv.edSeek1.ItemIndex=0
      then CurSeek.TypeSeek:=OWNER_NASEL
      else CurSeek.TypeSeek:=OWNER_ORG;
    CurSeek.History  := fmSeekSobstv.edSeek2.ItemIndex;
    CurSeek.Value    := Trim(fmSeekSobstv.edSeek.Text);
    Result:=true;
  end else begin
    Result:=false;
  end;
  fmSeekSobstv.Free;
  Application.ProcessMessages;
end;

procedure TfmSeekSobstv.edSeek1Change(Sender: TObject);
begin
  if edSeek1.ItemIndex=0
    then Label2.Caption:='Фамилия'
    else Label2.Caption:='Организация';
end;

end.
