unit fParamsSMDO;

interface

{$I Task.inc}
{$DEFINE SYNA}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, AddEvents, uProjectAll,
  {$IFDEF SYNA}
    pingsend,         
  {$ENDIF}
  Dialogs, StdCtrls, Buttons, Mask, DBCtrlsEh, CheckLst, ComCtrls, ShellApi, sndkey32, mPermit,
     {$IFDEF EMAIL_INDY}
     //  IdMessage, IdSocks, IdMessageClient, IdSMTP, IdPOP3,
//       IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
//       IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdException,
       IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdSocks, IdSMTP, IdException,
       IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
       IdMessageClient, IdPOP3, IdCoder, IdCoder3to4, IdCoderMIME,
     {$ENDIF}
  MetaTask, OpisEdit, dbFunc, FuncPr, uSMDO, IdRawBase, IdRawClient, IdIcmpClient;

type
  TfmParamsSMDO = class(TForm)
    gbSMTP: TGroupBox;
    lbMarsh: TLabel;
    edMarsh: TEdit;
    Label2: TLabel;
    edSMTP: TEdit;
    Label3: TLabel;
    cbAuto: TCheckBox;
    gbPOP: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edPOP: TEdit;
    lbUser: TLabel;
    edUser: TEdit;
    edSMTP_Port: TDBNumberEditEh;
    lbPassword: TLabel;
    edPassword: TEdit;
    edPOP_Port: TDBNumberEditEh;
    cbDeletePost: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbEmail: TLabel;
    edEmail: TEdit;
    gbSED: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edSEDName: TEdit;
    edSEDId: TMaskEdit;
    gbOrg: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    edSmdoName: TEdit;
    edSmdoKod: TEdit;
    pc: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    cbStartSMDO: TCheckBox;
    cbAddTask: TCheckBox;
    cbManual: TCheckBox;
    edCOC: TMemo;
    cbEnabled: TCheckBox;
    lbAutoCheck: TLabel;
    edAutoCheck: TDBNumberEditEh;
    Label6: TLabel;
    cbCheckRefreshCOC: TCheckBox;
    tsSpr: TTabSheet;
    Label1: TLabel;
    edAdresPKNCI: TEdit;
    Label7: TLabel;
    edPKNCI: TMaskEdit;
    Label8: TLabel;
    Label13: TLabel;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    cbGMT: TCheckBox;
    cbPswVisible: TCheckBox;
    cbReceiveCOC: TCheckBox;
    cbCheckTCP: TCheckBox;
    Button2: TButton;
    SpeedButton7: TSpeedButton;
    Label14: TLabel;
    cbCOC: TComboBox;
    lbVersion: TStaticText;
    cbVersion: TComboBox;
    btDelo: TButton;
    cbCheckCert: TComboBox;
    lbCheckCert: TLabel;
    edSizeMail: TDBNumberEditEh;
    Label15: TLabel;
    cbSizeMail: TCheckBox;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    cbCheckLoadCOC: TCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cbEnabledClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TCPClientStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: String);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure cbPswVisibleClick(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Ping(sIP:String);
    procedure Label13Click(Sender: TObject);
    procedure btDelMessageClick(Sender: TObject);
    procedure btStatMessageClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure btDeloClick(Sender: TObject);
    procedure edSizeMailChange(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);

  private
    { Private declarations }
    FClearKey:Boolean;
  public
    { Public declarations }
    FRunEvent:TNotifyEvent;
    FCheckEng:Boolean;
    procedure setEnabledVvod(lSet:Boolean);
    procedure setCheckVvod(lOnlyEng:Boolean);
    function CreatePOP(var idPOP:TidPOP3; var sErr:String; sl:TStringList):Boolean;
    procedure KeyPress_Check(Sender: TObject; var Key: Char);
    procedure SetSizeChecked(n:Integer);
    function GetSizeChecked : Integer;

  end;


implementation

{$R *.dfm}

procedure TfmParamsSMDO.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then Key:=#0;
  FClearKey:=false;
end;

procedure TfmParamsSMDO.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if ActiveControl=edCOC then begin
    //
  end else begin
    Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  end;
end;

procedure TfmParamsSMDO.FormCreate(Sender: TObject);
begin
  pc.ActivePageIndex:=0;
  FClearKey:=false;
  FCheckEng:=true;
  lbAutoCheck.Hint:=edAutoCheck.Hint;
//  cbVersion.Hint:=cbVersion.Hint+' (доступно с '+DatePropis(SMDO.FVersionXML_Date,3)+')';
//  lbVersion.Hint:=cbVersion.Hint;
  btDelo.Visible:=Role.SystemAdmin;
  cbSizeMail.Hint:=edSizeMail.Hint;
end;

procedure TfmParamsSMDO.cbEnabledClick(Sender: TObject);
begin
  setEnabledVvod(cbEnabled.Checked);
end;

procedure TfmParamsSMDO.setEnabledVvod(lSet:Boolean);
begin
  setControlsEnabled(gbOrg, lSet);
  setControlsEnabled(gbSed, lSet);
  setControlsEnabled(gbSMTP, lSet);
  setControlsEnabled(gbPOP, lSet);
  setControlsEnabled(pc, lSet);
  lbVersion.Enabled:=lSet;
  cbVersion.Enabled:=lSet;
  lbPassword.Enabled:=lSet;
  edPassword.Enabled:=lSet;
  lbMarsh.Enabled:=lSet;
  edMarsh.Enabled:=lSet;
  lbUser.Enabled:=lSet;
  edUser.Enabled:=lSet;
  lbEmail.Enabled:=lSet;
  edEmail.Enabled:=lSet;
  {
  if lSet and (Date>=SMDO.FVersionXML_Date) then begin
//    lbVersion.Enabled:=true;
    cbVersion.Enabled:=true;
  end else begin
//    lbVersion.Enabled:=false;
    cbVersion.Enabled:=false;
  end;
  }
//  edAutoCheck.Enabled:=lSet;
end;

procedure TfmParamsSMDO.Button1Click(Sender: TObject);
begin
  edSEDName.Text:='Программный комплекс «ЛАИС.СМДО»';
//  edSEDId.Text:='04c0d9a3-1c9b-4938-ad9f-d106e14a88da';
  edSEDId.Text:='2ec937bf-b89a-4d01-b4d3-355e220e32ff';
end;
procedure TfmParamsSMDO.btDeloClick(Sender: TObject);
begin
  edSEDName.Text:=SEDNAME_DELO;
  edSEDId.Text:=SEDVALUE_DELO;
end;
//-------------------------------------------------------
procedure TfmParamsSMDO.SpeedButton1Click(Sender: TObject);
//var
//  s:String;
begin
  if SMDO.CheckTCP(edSMTP.Text, edSMTP_Port.Value, true) then begin
    ShowMessage('Соединение установлено.');
  end else begin
    PutError(SMDO.LastErrorSMDO);
  end;
end;

procedure TfmParamsSMDO.SpeedButton2Click(Sender: TObject);
//var
//  s:String;
begin
  if SMDO.CheckTCP(edPOP.Text, edPOP_Port.Value, true) then begin
    ShowMessage('Соединение установлено.');
  end else begin
    PutError(SMDO.LastErrorSMDO);
  end;
end;
//----------------------------------------------------------
procedure TfmParamsSMDO.TCPClientStatus(ASender: TObject;  const AStatus: TIdStatus; const AStatusText: String);
begin
  Application.ProcessMessages;
end;
//----------------------------------------------------------
procedure TfmParamsSMDO.SpeedButton3Click(Sender: TObject);
begin
  ShellExecute(0, 'Open', 'iexplore.exe', PChar(edAdresPKNCI.Text), nil, SW_NORMAL);
end;
procedure TfmParamsSMDO.SpeedButton5Click(Sender: TObject);
begin
  ShellExecute(0, 'Open', 'iexplore.exe', PChar(CheckSleshN(edAdresPKNCI.Text)+'ws/actualDictionaryWebService?wsdl'), nil, SW_NORMAL);
//      then Result:=Result+'/ws/actualDictionaryWebService'      ?wsdl
//      else Result:=Result+'/ws/historyDictionaryWebService';    ?wsdl
//   http://86.57.146.82:9080/spr/ws/historyDictionaryWebService?wsdl
end;

procedure TfmParamsSMDO.SpeedButton6Click(Sender: TObject);
var
  idSMTP:TidSMTP;
  lOk:Boolean;
  sErr:String;
begin
  sErr:='';
//  if (Trim(edUser.Text)='')      then sErr:=sErr+'Заполните логоин к почтовому ящику'#13#10;
//  if (Trim(edPassword.Text)='')  then sErr:=sErr+'Заполните пароль'#13#10;
  if (Trim(edSmtp.Text)='')       then sErr:=sErr+'Заполните IP маршрутизатора СМДО'#13#10;
  if (VarToStr(edSmtp_Port.Text)='') then sErr:=sErr+'Заполните номер порта'#13#10;
  if sErr<>'' then begin
    PutError(sErr);
    exit;
  end;
  lOk:=true;
  idSMTP:=TidSMTP.Create(nil);
  idSmtp.AuthenticationType:=atLogin;
  IdSMTP.Host:=edSmtp.Text;
  IdSMTP.Port:=edSmtp_Port.Value;
  IdSMTP.Username:=edUser.Text;
  IdSMTP.Password:=edPassword.Text;
  OpenMessage(PadCStr('Подключение ...',40,' '));
  try   
    IdSMTP.Connect; //(15000);
  except
    on E:Exception do begin
      lOk:=false;
      sErr:='Ошибка подключения: '#13#10+E.Message;
      CloseMessage;
    end;
  end;
  if lOk then begin
    try
      if not IdSMTP.Authenticate then begin
        lOk:=false;
        sErr:='Ошибка авторизации';
      end;
    except
      on E:Exception do begin
        lOk:=false;
        sErr:='Ошибка подключения: '#13#10+E.Message;
      end;
    end;
    CloseMessage;
    IdSMTP.Disconnect;
    if lOk
      then ShowMessage('Проверка прошла успешно.')
      else PutError(sErr);
  end else begin
    PutError(sErr);
  end;
  idSMTP.Free;
end;

procedure TfmParamsSMDO.cbPswVisibleClick(Sender: TObject);
begin
  if cbPswVisible.Checked
    then edPassword.PasswordChar:=Chr(0)
    else edPassword.PasswordChar:='*';
  ActiveControl:=edPassword;
//  edPassword.
end;

procedure TfmParamsSMDO.Ping(sIP:String);
var
  lOk:Boolean;
  s:String;
  {$IFDEF SYNA}
  ping:TPingSend;
  nTime:Integer;
  {$ELSE}
    IdIcmpClient:TIdIcmpClient;
  {$ENDIF}
begin
  if sIP='' then exit;
  OpenMessage(PadCStr('Ping '+sIP+' ...',40,' '));
  {$IFDEF SYNA}
    ping:=TPingSend.Create;
    lOk:=false;
    try
      s:=sIP+'  нет ответа';
      if ping.ping(sIP) then begin
        if ping.replyError=IE_NoError then begin
          nTime:=ping.pingtime;
          if nTime>0 then begin
            lOk:=true;
            s:=sIP+'  время отклика: '+IntToStr(nTime)+'мс'
          end;
        end;
      end;
    finally
      ping.Free;
    end;
  {$ELSE}
    s:='';
    lOk:=true;
    IdIcmpClient:=TIdIcmpClient.Create(nil);
    IdIcmpClient.Host:=Trim(sIP);
    try
      IdIcmpClient.Ping;
      with IdIcmpClient.ReplyStatus do begin
        if BytesReceived>0
          then s:=FromIpAddress+'  время отклика: '+IntToStr(TimeToLive)+'мс'
          else s:=edSMTP.Text+'  нет ответа';
      end;
    except
      on E:Exception do begin
        lOk:=false;
        s:='Ошибка операции ping '+IdIcmpClient.Host+#13#10+E.Message;
      end;
    end;
    IdIcmpClient.Free;
  {$ENDIF}
  CloseMessage;
  if lOk
    then ShowMessage(s)
    else PutError(s);
end;

procedure TfmParamsSMDO.Label8Click(Sender: TObject);
begin
  Ping(edSMTP.Text);
end;

procedure TfmParamsSMDO.Label13Click(Sender: TObject);
begin
  Ping(edPOP.Text);
end;

procedure TfmParamsSMDO.SpeedButton8Click(Sender: TObject);
begin
  Ping(edSMTP.Text);
end;

procedure TfmParamsSMDO.SpeedButton9Click(Sender: TObject);
begin
  Ping(edPOP.Text);
end;

//---------------------------------------------------------------------------------
function TfmParamsSMDO.CreatePOP(var idPOP:TidPOP3; var sErr:String; sl:TStringList):Boolean;
var
  lOk:Boolean;
begin
  Result:=false;
  idPOP:=nil;
  sl.Clear;
  sErr:='';
  if (Trim(edUser.Text)='')      then sErr:=sErr+'Заполните логоин к почтовому ящику'#13#10;
  if (Trim(edPassword.Text)='')  then sErr:=sErr+'Заполните пароль'#13#10;
  if (Trim(edPop.Text)='')       then sErr:=sErr+'Заполните IP маршрутизатора СМДО'#13#10;
  if (VarToStr(edPop_Port.Text)='') then sErr:=sErr+'Заполните номер порта'#13#10;
  if sErr<>'' then begin
    exit;
  end;
  idPOP:=TidPOP3.Create(nil);
  IdPOP.IOHandler:=nil;
  IdPOP.Host:=edPop.Text;
  IdPOP.Port:=edPop_Port.Value;
  IdPOP.Username:=edUser.Text;
  IdPOP.Password:=edPassword.Text;
  OpenMessage(PadCStr('Подключение ...',40,' '));
  Result:=true;
  try
    IdPOP.Connect();
  except
    on E:Exception do begin
      Result:=false;
      sErr:='Ошибка подключения: '#13#10+E.Message;
    end;
  end;
  if Result then begin
    ChangeMessage(PadCStr('Получение информации ...',40,' '));
    try
      IdPOP.UIDL(sl,-1);   // список сообщений в почтовом ящике
    except
      on E:Exception do begin
        Result:=false;
        sErr:='Ошибка получения количества сообщений: '#13#10+E.Message;
      end;
    end;
  end;
  CloseMessage;
  if not Result and (IdPop<>nil) then begin
    try
      if IDPop.Connected
        then IdPOP.Disconnect;
    except
    end;
  end;
end;
//-----------------------------------------------------------------------------
procedure TfmParamsSMDO.SpeedButton4Click(Sender: TObject);
var
  idPOP:TidPOP3;
  lOk:Boolean;
  sErr,sUD,s:String;
  sl1:TStringList;
  i,n,nNew,nCount:Integer;
begin
  nNew:=-1;
  nCount:=-1;
  sl1:=TStringList.Create;
  lOk:=CreatePOP(idPOP, sErr, sl1);
  if lOk and (SMDO<>nil) and (sl1.Count>0) then begin
    OpenMessage(PadCStr('Проверка сообщений ...',40,' '));
    nCount:=sl1.Count;
    nNew:=0;
    for i:=0 to sl1.Count-1 do begin
      n:=Pos(' ',sl1.Strings[i]); //  '3 4646464'
      sUD:=Trim(Copy(sl1.Strings[i], n, 100));   // уникальный ID сообщения
      if not SMDO.SeekUID(sUD) then begin
        nNew:=nNew+1;;
      end;
    end;
    CloseMessage;
  end;
  sl1.Free;
  if (IDPop<>nil) then begin
    if IdPop.Connected then IdPOP.Disconnect;
    idPOP.Free;
  end;
  if lOk then begin
    s:='';
    if nCount>-1 then s:=#13#10+'Количество сообщений в ящике: '+InttoStr(nCount);
    if nNew>-1   then s:=s+#13#10+'Количество новых сообщений: '+InttoStr(nNew);
    ShowMessage('Проверка прошла успешно.'+s);
  end else begin
    PutError(sErr);
  end;
end;
//-----------------------------------------------------------------
procedure TfmParamsSMDO.btDelMessageClick(Sender: TObject);
var
  idPOP:TidPOP3;
  lOk,lDel:Boolean;
  sErr,sUD,s:String;
  sl1, slDel:TStringList;
  i,n,m,nNew,nCount:Integer;
begin
  nNew:=-1;
  nCount:=-1;
  sl1:=TStringList.Create;
  slDel:=TStringList.Create;      
  lOk:=CreatePOP(idPOP, sErr, sl1);
  if lOk and (SMDO<>nil) and (sl1.Count>0) then begin
    nNew:=0;
    for i:=0 to sl1.Count-1 do begin
      n:=Pos(' ',sl1.Strings[i]); // '3 4646464'
      sUD:=Trim(Copy(sl1.Strings[i], n, 100));   // уникальный ID сообщения
      n:=StrToInt(Trim(Copy(sl1.Strings[i], 1, n-1)));   // номер сообщения
      if SMDO.SeekUID(sUD) then begin  // сообщение было получено
        slDel.Add(IntToStr(n));
      end else begin
        nNew:=nNew+1;
      end;
    end;
    lDel:=false;
    if slDel.Count=0 then begin
      ShowMessage('Нет прочитанных сообщений');
      IdPOP.Disconnect;
    end else begin
      OpenMessage('Удаление сообщений ... ');
      try
        for i:=0 to slDel.Count-1 do begin
          n:=StrToInt(slDel.Strings[i]);
          IdPOP.Delete(StrToInt(slDel.Strings[i]));
        end;
        lDel:=true;
      finally
        CloseMessage;
        IdPOP.Disconnect;
        if lDel
          then ShowMessage('Удалено сообщений: '+IntToStr(slDel.count))
          else PutError('Ошибка удаления сообщений');
      end;
    end;
  end else begin
    PutError(sErr);
  end;
  sl1.Free;
  slDel.Free;
  idPOP.Free;
end;
//---------------------------------------------------------------------------------
procedure TfmParamsSMDO.btStatMessageClick(Sender: TObject);
var
  idPOP:TidPOP3;
  lOk,lDel:Boolean;
  sErr,sUD,s:String;
  sl1:TStringList;
  i,n,m,nNew,nCount:Integer;
  msg:TIdMessage;
begin
  nNew:=-1;
  nCount:=-1;
  sl1:=TStringList.Create;
  lOk:=CreatePOP(idPOP, sErr, sl1);
  if lOk and (SMDO<>nil) and (sl1.Count>0) then begin
    nNew:=0;
    for i:=0 to sl1.Count-1 do begin
      n:=Pos(' ',sl1.Strings[i]); // '3 4646464'
      sUD:=Trim(Copy(sl1.Strings[i], n, 100));   // уникальный ID сообщения
      n:=StrToInt(Trim(Copy(sl1.Strings[i], 1, n-1)));   // номер сообщения
      if SMDO.SeekUID(sUD) then begin  // сообщение было получено

      end else begin

      end;
    end;
      msg:=TIdMessage.Create(nil);
      try
        for i:=0 to sl1.Count-1 do begin
          msg.Clear;
          n:=StrToInt(sl1.Strings[i]);
          IdPop.RetrieveHeader(n, Msg);
          m:=IdPop.RetrieveMsgSize(n);
        end;
        lDel:=true;
      finally
        CloseMessage;
        IdPOP.Disconnect;
      end;
      msg.Free;
  end else begin
    PutError(sErr);
  end;
  sl1.Free;
  idPOP.Free;
end;

procedure TfmParamsSMDO.Button2Click(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRSMDO_NAME');
  if Opis<>nil then begin
    v:=null;
    if Opis.ChoiceFromSprEx(edSmdoName, v, arrRec, nil) and (v<>null) then begin
      if v <> null then begin
        edSmdoName.Text:=GetValueFieldEx(arrRec, 'NAME', '');
        edSmdoKod.Text:=GetValueFieldEx(arrRec, 'SMDOCODE', '');;
      end;
    end;
  end;
  ActiveControl:=edSmdoKod;
  SendKeys('{HOME}', false);
end;

procedure TfmParamsSMDO.SpeedButton7Click(Sender: TObject);
var
  s,s1,s2:String;
  n:Integer;
begin
  if edUser.Text='' then begin
    ShowMessage('Заполните логин к почтовому ящику');
  end else if (edPOP.Text='') and (edSMTP.Text='') then begin
    ShowMessage('Заполните IP маршрутизатора СМДО');
  end else begin
//  http://10.30.254.57/mail/smdo/s0008211.nsf
    if (edPOP.Text='')
      then s1:=edSMTP.Text
      else s1:=edPOP.Text;
    n:=Pos('-',edUser.Text);
    if n>0
      then s2:=Copy(edUser.Text,1,n-1)
      else s2:=edUser.Text;
    s:='http://'+s1+'/mail/smdo/'+s2+'.nsf';
//    ShellExecute(Application.Handle, 'Open', PChar(s), nil, nil, SW_SHOWNORMAL);
    ShellExecute(0, 'Open', 'iexplore.exe', PChar(s), nil, SW_NORMAL);
  end;
end;

procedure TfmParamsSMDO.KeyPress_Check(Sender: TObject; var Key: Char);
var
 c:Char;
begin
  if (Ord(Key)>32) and (Key<>#0) then begin
    c:=Key;
    if ((Key>='А') and (Key<='я')) or (Key in ['Ё','ё']) then  begin
      Key:=#0;
    end else begin

    end;
    if Key=#0 then PutError('Ошибочный символ "'+c+'"',self);
  end;
end;

procedure TfmParamsSMDO.setCheckVvod(lOnlyEng: Boolean);
begin
  if lOnlyEng then begin
    edMarsh.OnKeyPress:=KeyPress_Check;
    edEmail.OnKeyPress:=KeyPress_Check;
    edUser.OnKeyPress:=KeyPress_Check;
    edSmdoKod.OnKeyPress:=KeyPress_Check;
  end;
end;

procedure TfmParamsSMDO.edSizeMailChange(Sender: TObject);
var
  l:Boolean;
begin
  if (edSizeMail.Value<>null) and (edSizeMail.Value>0)
    then l:=true
    else l:=false;
  if l and not cbSizeMail.Checked
    then cbSizeMail.Checked:=true;
  if not l and cbSizeMail.Checked
    then cbSizeMail.Checked:=false;
end;
//-------------------------------------------------------
procedure TfmParamsSMDO.SetSizeChecked(n: Integer);
begin
  cbSizeMail.Checked:=false;
  edSizeMail.Value:=n;
  edSizeMailChange(nil);
end;
//-------------------------------------------------------
function TfmParamsSMDO.GetSizeChecked : Integer;
begin
  Result:=0;
  if cbSizeMail.Checked then begin
    if (edSizeMail.Value<>null) and (edSizeMail.Value>0)
      then Result:=edSizeMail.Value;
  end;    
end;


end.
