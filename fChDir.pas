unit fChDir;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, FileCtrl,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, adscnnct, Buttons, ExtCtrls,
  uTypes;

type
  TfmChDir = class(TForm)
    edPath: TDBEditEh;
    Bevel1: TBevel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    procedure edPathEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FResult:String;
    FNameSelect:String;
    FType:Integer;
    FConnection:TAdsConnection;
    procedure SetParams(sValue:String; sProg:String; nType:Integer; sName:String; Connect:TAdsCOnnection);
    function GetValue:String;
  end;

//var
//  fmChDir: TfmChDir;

implementation

uses dBase, StrUtils;

{$R *.dfm}

procedure TfmChDir.FormCreate(Sender: TObject);
begin
  FResult:='';
  FNameSelect:='”кажите папку с программой "%s" на главном компьютере';
  FType:=0;  // база данных
  FConnection:=nil;
end;

procedure TfmChDir.SetParams(sValue:String; sProg:String; nType: Integer; sName: String;  Connect: TAdsCOnnection);
begin
  if nType>-1  then FType:=nType;
  if sName<>'' then FNameSelect:=sName;
  FConnection:=Connect;
  if sProg<>'' then begin
    FNameSelect:=Format(FNameSelect, [sProg]);
  end else begin
    FNameSelect:=StringReplace(FNameSelect, '"%s"', '', []);
  end;
  Caption:=FNameSelect;
  if RightStr(sValue,1)='\'
    then sValue:=Copy(sValue,1,Length(sValue)-1);
  edPath.Text:=sValue;
end;

procedure TfmChDir.edPathEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  strDir:String;
begin
  if SelectDirectory(FNameSelect, '', strDir) then begin
    edPath.Text := strDir;
    Handled := true;
  end;
end;

procedure TfmChDir.btOkClick(Sender: TObject);
begin
  if edPath.Text<>'' then begin
    if dmBase.IsDirBase(edPath.Text, 0) then begin
      FResult:=edPath.Text;
    end;
  end;
//
end;

function TfmChDir.GetValue: String;
begin
  Result:=edPath.Text;
end;

{
if Win32MajorVersion >= 6 then
  with TFileOpenDialog.Create(nil) do
    try
      Title := 'Select Directory';
      Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem]; // YMMV
      OkButtonLabel := 'Select';
      DefaultFolder := FDir;
      FileName := FDir;
      if Execute then
        ShowMessage(FileName);
    finally
      Free;
    end
else
  if SelectDirectory('Select Directory', ExtractFileDrive(FDir), FDir,
             [sdNewUI, sdNewFolder]) then
    ShowMessage(FDir)
}


end.
