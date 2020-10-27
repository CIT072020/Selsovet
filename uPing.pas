unit uPing;

interface 

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
     winsock, StdCtrls; 

type 
  IPINFO = record 
  Ttl :char; 
  Tos :char; 
  IPFlags :char; 
  OptSize :char; 
  Options :^char; 
  end;

  ICMPECHO = record 
    Source :longint; 
    Status :longint; 
    RTTime :longint; 
    DataSize:Shortint; 
    Reserved:Shortint; 
    pData :^variant; 
    i_ipinfo:IPINFO; 
  end; 

TIcmpCreateFile = function():integer; {$IFDEF WIN32} stdcall; {$ENDIF} 
TIcmpCloseHandle = procedure(var handle:integer);{$IFDEF WIN32} stdcall; {$ENDIF} 
TIcmpSendEcho = function(var handle:integer; endereco:DWORD; buffer:variant; tam:WORD; IP:IPINFO; ICMP:ICMPECHO; tamicmp:DWORD; tempo:DWORD):DWORD;{$IFDEF WIN32} stdcall; {$ENDIF} 


type 
  TForm1 = class(TForm) 
  Button1: TButton; 
  Button2: TButton; 
  Edit1: TEdit; 
  Memo1: TMemo; 
  procedure Button1Click(Sender: TObject); 
  procedure Button2Click(Sender: TObject); 
  private 
  { Private declarations } 
  public 

end; 


implementation 

{$R *.DFM} 

procedure TForm1.Button1Click(Sender: TObject); 
var 
  wsadt : wsadata; 
  icmp :icmpecho; 
  HNDicmp : integer; 
  hndFile :integer; 
  Host :PHostEnt; 
  Destino :in_addr; 
  Endereco :^DWORD; 
  IP : ipinfo; 
  Retorno :integer; 
  dwRetorno :DWORD; 
  x :integer; 
  IcmpCreateFile : TIcmpCreateFile; 
  IcmpCloseHandle : TIcmpCloseHandle; 
  IcmpSendEcho : TIcmpSendEcho; 

begin 
  if (edit1.Text = '') then begin 
    Application.MessageBox('Digite um HostName ou um End. IP', 'Error', MB_OK); 
    exit; 
  end; 
  HNDicmp := LoadLibrary('ICMP.DLL'); 
  if (HNDicmp <> 0) then begin 
    @IcmpCreateFile := GetProcAddress(HNDicmp,'IcmpCreateFile'); 
    @IcmpCloseHandle := GetProcAddress(HNDicmp,'IcmpCloseHandle'); 
    @IcmpSendEcho := GetProcAddress(HNDicmp,'IcmpSendEcho'); 
    if (@IcmpCreateFile=nil) or (@IcmpCloseHandle=nil) or (@IcmpSendEcho=nil) then begin 
      Application.MessageBox('Erro pegando endereços ICMP','Error', MB_OK); 
      FreeLibrary(HNDicmp); 
    end; 
  end; 
  Retorno := WSAStartup($0101,wsadt); 

  if (Retorno <> 0) then begin 
    Application.MessageBox('Não foi possível carregar WinSockets','WSAStartup', MB_OK); 
    WSACleanup(); 
    FreeLibrary(HNDicmp); 
  end; 

  Destino.S_addr := inet_addr(Pchar(Edit1.text)); 
  if (Destino.S_addr = 0) then begin 
    Host := GetHostbyName(PChar(Edit1.text)); 
  end else begin 
    Host := GetHostbyAddr(@Destino,sizeof(in_addr), AF_INET); 
  end; 

  if (host = nil) then begin 
    Application.MessageBox('Host não encontrado','Error', MB_OK); 
    WSACleanup(); 
    FreeLibrary(HNDicmp); 
    exit; 
  end; 
  memo1.Lines.Add('Pinging ' + Edit1.text); 
  
  Endereco := @Host.h_addr_list; 
  
  HNDFile := IcmpCreateFile(); 
  for x:= 0 to 4 do begin 
    Ip.Ttl := char(255); 
    Ip.Tos := char(0); 
    Ip.IPFlags := char(0); 
    Ip.OptSize := char(0); 
    Ip.Options := nil; 
    
    dwRetorno := IcmpSendEcho( 
                  HNDFile, 
                  Endereco^, 
                  null, 
                  0, 
                  Ip, 
                  Icmp, 
                  sizeof(Icmp), 
                  DWORD(5000)); 
    Destino.S_addr := icmp.source; 
    Memo1.Lines.Add('Pingou ' + Edit1.text); 
  end; 
{
error := GetLastError();
    if (error <> 0) then
    begin
         Memo1.SetTextBuf('Error in call to '+
                          'IcmpSendEcho()');
         Memo1.Lines.Add('Error code: '+IntToStr(error));
         Exit;
    end;

     // Ñìîòðèì íåêîòîðûå èç âåðíóâøèõñÿ äàííûõ
    Memo1.Lines.Add('Reply from '+
                IntToStr(LoByte(LoWord(pIpe^.Address)))+'.'+
                IntToStr(HiByte(LoWord(pIpe^.Address)))+'.'+
                IntToStr(LoByte(HiWord(pIpe^.Address)))+'.'+
                IntToStr(HiByte(HiWord(pIpe^.Address))));
    Memo1.Lines.Add('Reply time: '+IntToStr(pIpe.RTTime)+' ms'); 
}  
  
  IcmpCLoseHandle(HNDFile); 
  FreeLibrary(HNDicmp); 
  WSACleanup(); 
end; 

{
procedure Ping(IP: String; OutS: TStrings); 
const BUFSIZE = 2000; 
var 
  SecAttr: TSecurityAttributes; 
  hReadPipe, hWritePipe: THandle; 
  StartupInfo: TStartUpInfo; 
  ProcessInfo: TProcessInformation; 
  Buffer: PAnsiChar; 
  WaitReason, 
  BytesRead: DWord; 
begin 
  with SecAttr do begin 
    nlength := SizeOf(TSecurityAttributes); 
    binherithandle := true; 
    lpsecuritydescriptor := nil; 
  end; 
  if Createpipe(hReadPipe, hWritePipe, @SecAttr, 0) then begin 
    Buffer := AllocMem(BUFSIZE + 1); 
    FillChar(StartupInfo, SizeOf(StartupInfo), #0); 
    StartupInfo.cb := SizeOf(StartupInfo); 
    StartupInfo.hStdOutput := hWritePipe; 
    StartupInfo.hStdInput := hReadPipe; 
    StartupInfo.dwFlags := STARTF_USESTDHANDLES + STARTF_USESHOWWINDOW; 
    StartupInfo.wShowWindow := SW_HIDE; 
    if CreateProcess(nil, PChar('ping.exe ' + IP), @SecAttr, @SecAttr, true, NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then begin 
      repeat 
        WaitReason := WaitForSingleObject(ProcessInfo.hProcess, 100); 
        Application.ProcessMessages; 
      until (WaitReason <> WAIT_TIMEOUT); 
      Repeat 
        BytesRead := 0; 
        ReadFile(hReadPipe, Buffer[0], BUFSIZE, BytesRead, nil); 
        Buffer[BytesRead] := #0; 
        OemToAnsi(Buffer, Buffer); 
        OutS.Add(String(Buffer)); 
      until (BytesRead < BUFSIZE); 
    end; 
    FreeMem(Buffer); 
    CloseHandle(ProcessInfo.hProcess); 
    CloseHandle(ProcessInfo.hThread); 
    CloseHandle(hReadPipe); 
    CloseHandle(hWritePipe); 
  end; 
end;
}

end.




