unit fLogon;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Metatask,
  StdCtrls, Buttons, Mask, DBCtrlsEh, uFunc, FuncPr, ExtCtrls, adscnnct;

type
  TfmLogon = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edPassword: TEdit;
    pnBt: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    pnPIN: TPanel;
    Label3: TLabel;
    edUser: TMaskEdit;
    edPIN: TMaskEdit;
    cbPswVisible: TDBCheckBoxEh;
    Conn: TAdsConnection;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbPswVisibleClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
    FLengthPIN:Integer;
    FClearKey:Boolean;
    FCheckUser:Boolean;
    FType:Integer;
  public
    { Public declarations }
    procedure UpdateActions; override;
    function OkPIN:Boolean;
  end;

  function ShowLogon( var strUser: String; var strPassword : String; var strPIN:String; nLeft,nTop : Integer; nType:Integer; FormOwner:TForm=nil) : Boolean;

var
  fmLogon: TfmLogon;

implementation

uses uTypes, uProjectAll
{$IFDEF GISUN}
   ,dBase, uGisun, uETSP2;
{$ELSE}
   ;
{$ENDIF}

{$R *.DFM}
                   
function ShowLogon( var strUser: String; var strPassword : String; var strPIN:String; nLeft,nTop : Integer; nType:Integer; FormOwner:TForm=nil) : Boolean;
var
  kb:LongWord;
begin       
  fmLogon := TfmLogon.Create(FormOwner);
  if nLeft>-1 then fmLogon.Left := nLeft;
  if nTop>-1  then fmLogon.Top  := nTop;
  if (nLeft=-1) and (nTop=-1) then begin
    fmLogon.Position:=poOwnerFormCenter;
  end;

  if strUser<>'' then begin
    fmLogon.ActiveControl := fmLogon.edPassword;
    fmLogon.edUser.Text := strUser;
  end;
  kb:=0;
  if strPassword<>'' then begin
    fmLogon.edPassword.Text := strPassword;
  end;

  fmLogon.cbPswVisible.Checked:=GlobalTask.GetLastValueAsBoolean('PSW_VISIBE');

  kb:=GetTypeKeyBoard;
  ActivateENGKeyboard;
  fmLogon.FCheckUser:=true;  
  fmLogon.FType:=nType;
  {$IFDEF GISUN}
  if ( (nType=2) or (nType=4) ) and (Gisun.TypeETSP=ETSP_AVEST) and not Gisun.AvestEnabledPIN then begin // ГИС РН + PIN
    nType:=1;  // !!!  недоступен ввод пина !!!
    strPin:='';
  end;
  {$ENDIF}
  //-------------------------------------------------------------------------------------
  if nType=1 then begin // ГИС РН
    fmLogon.edUser.Text:=GlobalTask.GetLastValueAsString('LAST_USER_GIS');
    fmLogon.Caption:=_GIS_;
    fmLogon.btOk.Caption:='Принять';
    if fmLogon.edUser.Text=''
      then fmLogon.ActiveControl:=fmLogon.edUser
      else fmLogon.ActiveControl:=fmLogon.edPassword;

  end else if nType=3 then begin // FTP
    fmLogon.edUser.Text:=strUser;
    fmLogon.edUser.CharCase:=ecNormal;
    fmLogon.Caption:=strPIN;
    fmLogon.btOk.Caption:='Принять';
    if fmLogon.edUser.Text=''
      then fmLogon.ActiveControl:=fmLogon.edUser
      else fmLogon.ActiveControl:=fmLogon.edPassword;
    fmLogon.FCheckUser:=false;
  end;
  {$IFDEF GISUN}
  if (nType=2) or (nType=4) then begin // ГИС РН + PIN     2 или 4 уже неважно !!!
    fmLogon.edUser.Text:=GlobalTask.GetLastValueAsString('LAST_USER_GIS');
    fmLogon.Caption:=_GIS_;
    fmLogon.btOk.Caption:='Принять';
    if fmLogon.edUser.Text=''
      then fmLogon.ActiveControl:=fmLogon.edUser
      else if fmLogon.edPassword.Text=''
        then fmLogon.ActiveControl:=fmLogon.edPassword
        else fmLogon.ActiveControl:=fmLogon.edPIN;
    fmLogon.pnPIN.Visible:=true;   
    fmLogon.FLengthPIN:=0;
//    if (ETSP2<>nil) then begin
//      fmLogon.edPIN.EditMask:=Replicate('c',ETSP2.LengthPIN)+';1; ';
//      fmLogon.FLengthPIN:=ETSP2.LengthPIN;
//    end;
    if Gisun.DbUserAsGIS and (strUser<>'') and (strPassword<>'') then begin
      fmLogon.FCheckUser:=false;
    end else begin
      fmLogon.FCheckUser:=true;
    end;
    if not fmLogon.FCheckUser then begin
      fmLogon.edUser.Visible:=false;
      fmLogon.edPassword.Visible:=false;
      fmLogon.Label1.Visible:=false;
      fmLogon.Label2.Visible:=false;
      fmLogon.ClientHeight:=fmLogon.pnPIN.Height+fmLogon.pnBt.Height;
      fmLogon.ActiveControl:=fmLogon.edPIN;
    end;
  end else begin
    fmLogon.pnPIN.Visible:=false;
    fmLogon.Height:=fmLogon.Height-fmLogon.pnPIN.Height;
  end;
  {$ELSE}
    fmLogon.pnPIN.Visible:=false;
    fmLogon.Height:=fmLogon.Height-fmLogon.pnPIN.Height;
  {$ENDIF}

  if fmLogon.ShowModal=mrOk then begin
    strUser := Trim(fmLogon.edUser.Text);
    CharDel(strUser,' ');
    strPassword:=Trim(fmLogon.edPassword.Text);
    CharDel(strPassword,' ');
    strPIN := Trim(fmLogon.edPIN.Text);
    CharDel(strPIN,' ');
    if fmLogon.FCheckUser and (nType<>0) then begin
      GlobalTask.SetLastValueAsString('LAST_USER_GIS',strUser);
    end;
    Result := true;
  end else begin
    Result := false;
  end;

  GlobalTask.SetLastValueAsBoolean('PSW_VISIBE', fmLogon.cbPswVisible.Checked);

  if (kb>0) then
    ActivateKeyboardLayout(kb,KLF_ACTIVATE);

  fmLogon.Free;
end;

procedure TfmLogon.FormCreate(Sender: TObject);
begin
//  LoadPosForm( Self );
end;

procedure TfmLogon.FormDestroy(Sender: TObject);
begin
//  SavePosForm( Self );
end;

procedure TfmLogon.cbPswVisibleClick(Sender: TObject);
begin
  if cbPswVisible.Checked
    then edPassword.PasswordChar:=Chr(0)
    else edPassword.PasswordChar:='*';
//  if cbPswVisible.Checked
//    then edPIN.PasswordChar:=Chr(0)
//    else edPIN.PasswordChar:='*';
  if edPassword.Visible then begin
    ActiveControl:=edPassword;
  end else begin
    if edPIN.Visible then begin
      ActiveControl:=edPIN;
    end;
  end;
end;

procedure TfmLogon.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  FClearKey:=false;
  if Key=32 then begin
    FClearKey:=true;
    Key:=0;
  end;
end;

procedure TfmLogon.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
end;

procedure TfmLogon.btOkClick(Sender: TObject);
{$IFDEF GISUN}
var
  strErr,strUser,strPassword:String;
{$ENDIF}
begin
{$IFDEF GISUN}
  if ((FType=1) or (FType=2)) and GlobalTask.ParamAsBoolean('GIS_CHECK_BASE') and Gisun.DbUserAsGIS then begin
    strUser := Trim(edUser.Text);
    CharDel(strUser,' ');
    strPassword := Trim(edPassword.Text);
    CharDel(strPassword,' ');
    Conn.AdsServerTypes := dmBase.AdsConnection.AdsServerTypes;
    Conn.ConnectPath := dmBase.AdsConnection.ConnectPath;
    Conn.UserName := strUser;
    Conn.Password := strPassword;
    try
      Conn.IsConnected := true;
    except
      on E:Exception do begin
        if Pos('7078', E.Message) > 0 then begin
          strErr:=' Неверное имя пользователя или пароль.';
        end else if Pos('6420', E.Message) > 0 then begin
          strErr:=' Ошибка подклюления к серверу базы данных.';
        end else begin
          strErr:=E.Message;
        end;
      end;
    end;
    if Conn.IsConnected then begin
      Conn.IsConnected:=false;
      ModalResult:=mrOk;
    end else begin
      PutError(' Проверка пользователя в базе данных:'+#13+strErr);
    end;
  end else begin
    ModalResult:=mrOk;
  end;
{$ELSE}
  ModalResult:=mrOk;
{$ENDIF}
end;

function TfmLogon.OkPIN: Boolean;
begin
  if pnPIN.Visible then begin
    if FLengthPIN=0 then begin
      Result:=(Length(Trim(edPIN.Text))>7);
    end else begin
      Result:=(Length(Trim(edPIN.Text))=FLengthPIN);
    end;
  end else begin
    Result:=true;
  end;
end;

procedure TfmLogon.UpdateActions;
begin
{$IFDEF GISUN}
  if FCheckUser then begin
    btOk.Enabled:=((edPassword.Text<>'') and (edUser.Text<>'') and OkPIN);
  end else begin
    btOk.Enabled:=OkPIN;
  end;
{$ELSE}
    btOk.Enabled:=((edPassword.Text<>'') and (edUser.Text<>''));
{$ENDIF}
end;


end.
