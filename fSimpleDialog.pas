unit fSimpleDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,AddEvents,
  StdCtrls, Buttons, ExtCtrls, uProject, FuncPr;

type
  TfmSimpleDialog = class(TForm)
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    ImBtClear: TImage;
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    FClearKey:Boolean;
  public
    FRun:Boolean;
    slGo:TStringList;
    constructor Create( Owner : TComponent); override;
    function EditModal : Boolean;
    procedure SetPropertyControl; virtual;
    function CheckOk : Boolean; virtual;
  end;

var
  fmSimpleDialog: TfmSimpleDialog;

implementation

{$R *.DFM}

{ TfmSimpleDialog }

function TfmSimpleDialog.CheckOk: Boolean;
begin
  Result := true;
end;

constructor TfmSimpleDialog.Create(Owner: TComponent);
begin
  inherited;
  SetPropertyControl;
  FClearKey:=false;
  slGo:=nil;
end;

function TfmSimpleDialog.EditModal: Boolean;
begin
  SetFlatEhComp(Self,GlobalFlat);
  if ShowModal=mrOk
    then Result := true
    else Result := false;
end;

procedure TfmSimpleDialog.SetPropertyControl;
begin
//
end;

procedure TfmSimpleDialog.btOkClick(Sender: TObject);
begin
  if CheckOk then ModalResult := mrOk;
end;

procedure TfmSimpleDialog.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key=VK_F2 then begin
    btOkClick(nil);
    FClearKey:=true;
  end else begin
    Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil, false,slGo);
  end;
end;

procedure TfmSimpleDialog.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then Key:=#0;
  FClearKey:=false;
end;

procedure TfmSimpleDialog.FormCreate(Sender: TObject);
begin
  FRun:=false;
end;

end.
