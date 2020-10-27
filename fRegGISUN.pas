unit fRegGISUN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uTypes,
  Dialogs, StdCtrls, Buttons, uObjectsScript, uProject, uProjectAll;

type
  TfmRegGISUN = class(TForm)
    Label1: TLabel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    procedure btOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FPovtor: Boolean;
    FPovtorSvid: Boolean;
    procedure SetPovtor(const Value: Boolean);
    procedure SetPovtor_;
    procedure SetPovtorSvid(const Value: Boolean);
  public
    property Povtor : Boolean read FPovtor write SetPovtor;
    property PovtorSvid : Boolean read FPovtorSvid write SetPovtorSvid;
  end;

var
  fmRegGISUN: TfmRegGISUN;

implementation

{$R *.dfm}

procedure TfmRegGISUN.btOkClick(Sender: TObject);
begin
  if CurDok.FormDok<>nil then begin
    PostMessage(CurDok.FormDok.Handle,WM_REGISTER_AKT,0,0);
    CurDok.FormDok.FRun:=false;
  end;
  Close;
end;

procedure TfmRegGISUN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfmRegGISUN.FormActivate(Sender: TObject);
begin
   SetWindowPos(Handle,
                          HWND_TOPMOST,
                          Left,
                          Top,
                          Width,
                          Height,
                          SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TfmRegGISUN.FormCreate(Sender: TObject);
begin
  if CurDok.FormDok<>nil then CurDok.FormDok.FRun:=true;
  Povtor:=false;
end;

procedure TfmRegGISUN.btCancelClick(Sender: TObject);
begin
  if CurDok.FormDok<>nil then CurDok.FormDok.FRun:=false;
  Close;
end;

procedure TfmRegGISUN.SetPovtorSvid(const Value: Boolean);
begin
  FPovtorSvid := Value;
  SetPovtor_;
end;

procedure TfmRegGISUN.SetPovtor(const Value: Boolean);
begin
  FPovtor := Value;
  SetPovtor_;
end;

procedure TfmRegGISUN.SetPovtor_;
begin
  if FPovtorSvid then begin
    Label1.Caption:=' Послать повторное свидетельство в '+_GIS_+' ? ';
  end else begin
    if FPovtor
      then Label1.Caption:=' Послать повторно данные о регистрации в '+_GIS_+' ? '
      else Label1.Caption:=' Послать данные о регистрации в '+_GIS_+' ? ';
  end;
end;

procedure TfmRegGISUN.FormDestroy(Sender: TObject);
begin
  if CurDok.FormDok<>nil then CurDok.FormDok.FRun:=false;
end;


end.
