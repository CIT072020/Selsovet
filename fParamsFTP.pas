unit fParamsFTP;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SasaIniFile, uprojectall, fSimpleDialog, StdCtrls, Buttons, ExtCtrls;

type
  TfmParamsFTP = class(TfmSimpleDialog)
    cbFTP: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edHost: TEdit;
    edUserName: TEdit;
    edPassword: TEdit;
    edDir: TEdit;
    edPort: TEdit;
    lbFTP: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbFTPChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ini : TSasaIniFile;
    sl:TStringList;
    FCurIndex:Integer;
    procedure ChangeIndexFTP(n:Integer);
    procedure SaveIndexFTP(n:Integer);
  end;

  procedure EditParamsFTP;

implementation

{$R *.dfm}

procedure EditParamsFTP;
var
  fmParamsFTP: TfmParamsFTP;
begin
  fmParamsFTP:=TfmParamsFTP.Create(nil);
  if fmParamsFTP.ShowModal=mrOk then begin
    if fmParamsFTP.cbFTP.ItemIndex>-1 then begin
      fmParamsFTP.ChangeIndexFTP(fmParamsFTP.cbFTP.ItemIndex);
    end;
    fmParamsFTP.Ini.UpdateFile;
  end;
  fmParamsFTP.Free;
end;


procedure TfmParamsFTP.FormCreate(Sender: TObject);
begin
  ini := TSasaIniFile.Create(GetNameFilePropertyFTP);
  sl:=TStringList.Create;
  {$IFDEF ZAGS}
    cbFTP.Items.Add('ЗАГС (выгрузка)');
//    cbFTP.Items.Add('Обновления');
    cbFTP.Items.Add('Автокопия');
    sl.Add('ZAGS=0');
//    sl.Add('UPDATE=1');
    sl.Add('AUTOBACKUP=2');
  {$ENDIF}
  {$IFDEF OCHERED}
      cbFTP.Items.Add('Очередь (выгрузка)');
      cbFTP.Items.Add('Обновления');
      cbFTP.Items.Add('Автокопия');
      sl.Add('OCHERED=0');
      sl.Add('UPDATE=1');
      sl.Add('AUTOBACKUP=2');
  {$ENDIF}
  {$IFDEF ZAH}
      cbFTP.Items.Add('Выгрузка');
      cbFTP.Items.Add('Обновления');
      cbFTP.Items.Add('Автокопия');
      sl.Add('ZAH=0');
      sl.Add('UPDATE=1');
      sl.Add('AUTOBACKUP=2');
  {$ENDIF}
  {$IFDEF OPEKA}
      cbFTP.Items.Add('Выгрузка');
      cbFTP.Items.Add('Обновления');
      cbFTP.Items.Add('Автокопия');
      sl.Add('OPEKA=0');
      sl.Add('UPDATE=1');
      sl.Add('AUTOBACKUP=2');
  {$ENDIF}
  {$IFDEF LAIS}
    cbFTP.Items.Add('Портал РИАП');
    cbFTP.Items.Add('Обновления');
    cbFTP.Items.Add('Очередь (выгрузка)');
    cbFTP.Items.Add('ЗАГС (выгрузка)');
    cbFTP.Items.Add('Автокопия');
    sl.Add('RIAP_DATA=0');
    sl.Add('UPDATE=1');
    sl.Add('OCHERED=2');
    sl.Add('ZAGS=3');
    sl.Add('AUTOBACKUP=4');
  {$ENDIF}
  {$IFDEF POST}
    cbFTP.Items.Add('Обновления');
    sl.Add('UPDATE=1');
  {$ENDIF}
  FCurIndex:=-1;
  cbFTP.ItemIndex:=0;
  ChangeIndexFTP(0);
end;

procedure TfmParamsFTP.FormDestroy(Sender: TObject);
begin
  ini.Free;
  inherited;
end;

procedure TfmParamsFTP.SaveIndexFTP(n:Integer);
var
  s:String;
begin
  s:=sl.Names[n];
  ini.WriteString(s,'PORT',Trim(edPort.Text));
  ini.WriteString(s,'HOST',Trim(edHost.Text));
  ini.WriteString(s,'USERNAME',Trim(edUserName.Text));
  ini.WriteString(s,'PASSWORD',Trim(edPassword.Text));
  ini.WriteString(s,'DIR',Trim(edDir.Text));
end;

procedure TfmParamsFTP.ChangeIndexFTP(n:Integer);
var
  s:String;
begin
  if FCurIndex>-1 then begin
    SaveIndexFTP(FCurIndex);
  end;
  s:=sl.Names[n];
  edPort.Text:=ini.ReadString(s,'PORT','');
  edHost.Text:=ini.ReadString(s,'HOST','');
  edUserName.Text:=ini.ReadString(s,'USERNAME','');
  edPassword.Text:=ini.ReadString(s,'PASSWORD','');
  edDir.Text:=ini.ReadString(s,'DIR','');
  FCurIndex:=cbFTP.ItemIndex;
end;

procedure TfmParamsFTP.cbFTPChange(Sender: TObject);
begin
  ChangeIndexFTP(cbFTP.ItemIndex);
end;

end.
