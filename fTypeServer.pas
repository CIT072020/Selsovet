unit fTypeServer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrlsEh, Mask, IniFiles, FuncPr, adscnnct, dbFunc,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdException, IdAntiFreezeBase,
  IdEcho;

type
  TfmTypeServer = class(TForm)
    rbLocal: TRadioButton;
    rbRemote: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    cbC: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edIP: TDBEditEh;
    edPORT: TDBNumberEditEh;
    AdsConnection: TAdsConnection;
    TCPClient: TIdTCPClient;
    SpeedButton1: TSpeedButton;
    IdEcho: TIdEcho;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edIPEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edPORTEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TCPClientStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure IdEchoStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
  private
    { Private declarations }
  public
    { Public declarations }
    Pass:String;
    iniAds : TIniFile;
    procedure UpdateActions; override;
  end;

var
  fmTypeServer: TfmTypeServer;

implementation

uses dBaseConf, WinSock;

{$R *.DFM}

//-------------------------------------------------------------
function GetLocalIP: String;
const WSVer = $101;
var
  wsaData: TWSAData;
  P: PHostEnt;
  Buf: array [0..127] of Char;
begin
  Result := '';
  if WSAStartup(WSVer, wsaData) = 0 then begin
    if GetHostName(@Buf, 128) = 0 then begin
      P := GetHostByName(@Buf);
      if P <> nil then Result := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
    end;
    WSACleanup;
  end;
end;

procedure TfmTypeServer.BitBtn1Click(Sender: TObject);
var
 s,strIP : String;
begin
  if rbLocal.Checked
    then dmBaseConf.IniSysParams.WriteString('ADMIN','SERVERTYPES', 'LOCAL')
    else dmBaseConf.IniSysParams.WriteString('ADMIN','SERVERTYPES', 'REMOTE');
  if cbC.ItemIndex>-1 then begin
    case cbC.ItemIndex of
      0 : s:='DEFAULT';
      1 : s:='TCPIP';
      2 : s:='UDPIP';
      3 : s:='IPX';
    end;
    dmBaseConf.IniSysParams.WriteString('ADMIN','COMMUNICATION', s);
  end;
  if rbRemote.Checked then begin
    strIP := edIP.Text;
    CharDel(strIP,' ');
    if (edPORT.Text<>'') and (strIP<>'...') then begin
      dmBaseConf.IniSysParams.WriteString('SERVER','LAN_IP',strIP);
      dmBaseConf.IniSysParams.WriteString('SERVER','LAN_PORT',edPORT.Text);
    end else begin
      dmBaseConf.IniSysParams.EraseSection('SERVER');
    end;
  end;
  dmBaseConf.IniSysParams.UpdateFile;
  ModalResult := mrOk;

end;

procedure TfmTypeServer.UpdateActions;
begin
  inherited;
  cbC.Enabled    := rbRemote.Checked;
  edIP.Enabled   := rbRemote.Checked;
  edPORT.Enabled := rbRemote.Checked;
  SpeedButton1.Enabled := rbRemote.Checked;
end;

procedure TfmTypeServer.FormCreate(Sender: TObject);
begin
  iniAds := TIniFile.Create(NamefromExe('ads.ini'));
end;

procedure TfmTypeServer.FormDestroy(Sender: TObject);
begin
  iniAds.Free;
end;

procedure TfmTypeServer.edIPEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edIP.Text:=GetLocalIP;
end;

procedure TfmTypeServer.edPORTEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  lerr:Boolean;
  AdsInfo:TAdsServerInfo;
begin
  lerr:=false;
  try
    AdsConnection.ConnectPath:='C:\'; //dmBaseConf.AdsConnection.ConnectPath;
//    AdsConnection.Password:=Pass;
    AdsConnection.UserName:='';
    AdsConnection.IsConnected:=true;
  except
    lerr:=true;
  end;
  if lerr then begin
    PutError('Ошибка подключения к серверу.');
  end else begin
    AdsInfo:=GetAdsServerInfo(AdsConnection);
    if AdsInfo.Error>0 then begin
      PutError('Ошибка получения информации ('+IntToStr(AdsInfo.Error)+').');
    end else begin
      edPort.Value:=AdsInfo.IPPort;
    end;
    AdsConnection.IsConnected:=false;
  end;
end;

procedure TfmTypeServer.SpeedButton1Click(Sender: TObject);
var
  sAdres,s:String;
  sPort:String;
begin
  sAdres:=edIP.text;
  CharDel(sAdres,' ');
  if sAdres='' then begin
    PutError('Не заполнен IP-адрес подключения.');
    exit;
  end;
  sPort:=Trim(edPORT.Text);
  if sPort='' then begin
    PutError('Не заполнен номер порта.');
    exit;
  end;
//  IdEcho.Host:=sAdres;
//  IdEcho.Port:=StrToInt(sPORT);
  TCPClient.Host:=sAdres;
  TCPClient.Port:=StrToInt(sPORT);
  OpenMessage('Проверка подключения','',10);
  try
    try
//      IdEcho.Connect;
      TCPClient.Connect;
    except
      on E: EIdException do begin
        CloseMessage;
        if Pos('# 11001',E.Message) > 0 then begin
          s:='Адрес "'+sAdres+'" не найден.';
        end else if Pos('# 10060',E.Message) > 0 then begin
          s:='Время ожидания "'+sPort+'" истекло.';
        end else begin
          s:=E.Message;
        end;
        PutError(s);
      end;
    end;
    if TCPClient.Connected then begin
//    if IdEcho.Connected then begin
      CloseMessage;
      ShowMessage('Соединение установлено.');
    end;
  finally
    TCPClient.Disconnect;
//    IdEcho.Disconnect;
    CloseMessage;
  end;
end;

procedure TfmTypeServer.TCPClientStatus(ASender: TObject;  const AStatus: TIdStatus; const AStatusText: String);
begin
  Application.ProcessMessages;
end;

procedure TfmTypeServer.IdEchoStatus(ASender: TObject;  const AStatus: TIdStatus; const AStatusText: String);
begin
  Application.ProcessMessages;
end;

end.
