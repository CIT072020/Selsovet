unit uSynapseObj;

interface

{$I Task.inc}

uses
  Windows, Db, Messages, SysUtils, Classes, Graphics, ComCtrls, Controls, Forms, ExtCtrls, StdCtrls, Dialogs, DsiWin32, ActnList, uTypes,
  {$IFNDEF UPDATEPROG} mMD5, mPermit, {$ENDIF}
  FuncPr, dbFunc, uProjectAll,
  mVerInfo, ShellApi, TasksEx, AsyncCalls,
  ftpSend, blcksock, pingsend, httpsend,  //ssl_openssl,
  QStrings, SasaIniFile, MetaTask;

const
  // тип отображения загрузки
  TV_NONE=0;  // не показывать
  TV_SB=1;    // на StatusBar

type

  TSynapseObj=class(TObject)
  public
    FTypeVisible:Integer;
    Fpb: TProgressBar;
    Fbt: TButton;
    Flb: TStaticText;
    FThread:Boolean;
    FProtokol:TStringList;
    FWinOwner:TComponent;
    FLeftOwner:Integer;
    FTopOwner:Integer;
    FTypeServer:Integer;
    FError:String;
    FFileName:String;
    FOutputDir:String;
    FFileSize:Integer;
    FSaveToFile:Boolean;
    FCount:Integer;
    FCurCount:Integer;
    FUpdate:Integer;
    FDateSprOrgSMDO:TDateTime;
    FDateSprVidDokSMDO:TDateTime;
    FFileSprOrg:String;
    FFileSprVidDok:String;
    FMessages:String;
    FCheckSpr:Boolean;
    FCheckMessages:Boolean;
    FCancelLoad:Boolean;
    FShowConnect:Boolean;
    FRun:Integer;
    FSystemAdmin:Boolean;
    FCurUpdate:Integer;
    FTPClient:TFTPSend;
    function  CreateProgressBar: TWinControl;
    function RunFileFTP(nAfter:Integer=1):String;
    function  GetFileFTP(lShowConnect:Boolean; slPar:TStringList=nil):Boolean;
    function  CheckUpdate(sNameFileUpdate:String=''): Boolean;
    procedure Event_DSockOnStatus(Sender: TObject; Reason: THookSocketReason; const Value: String);
    procedure Event_OnStatus(Sender: TObject; Response: Boolean;  const Value: string);
    procedure Event_ClickButton(Sender: TObject);
    constructor Create(WinOwner:TComponent);
    destructor Destroy; override;
  end;

  function Http_GetText(URL:String; Response:TStrings):Boolean;

var
 oUpdate:TSynapseObj;

implementation

uses Variants;

//uses {$IFDEF UPDATEPROG}

function Http_GetText(URL:String; Response:TStrings):Boolean;
var
  HTTP: THTTPSend;
begin
  HTTP:=THTTPSend.Create;
  try
    Result:=HTTP.HTTPMethod('GET', URL);
    if Result then begin
      Response.LoadFromStream(HTTP.Document);
    end else begin
      Response.Add(IntToStr(HTTP.Sock.LastError)+' '+HTTP.Sock.LastErrorDesc);
    end;
  finally
    HTTP.Free;
  end;
end;
{ TSynapseObj }

constructor TSynapseObj.Create(WinOwner:TComponent);
begin
  FDateSprOrgSMDO:=0;
  FDateSprVidDokSMDO:=0;
  FFileName:='';
  try
    FOutputDir:=CheckSleshN(ExtractFilePath(Application.ExeName))+'Обновление\';
  except
    FOutputDir:='';
  end;
  FCurUpdate:=0;
  FFileSize:=0;
  FCount:=0;
  FUpdate:=0;
  FCurCount:=0;
  FRun:=0;
  FWinOwner:=WinOwner;
  FTypeVisible:=TV_SB;
  FTypeServer:=0;
  FLeftOwner:=5;
  FTopOwner:=2;
  FThread:=true;
  FSaveToFile:=false;
  FCancelLoad:=false;
  FMessages:='';
  FCheckMessages:=false;
  FCheckSpr:=false;;
  FShowConnect:=false;
  FProtokol:=TStringList.Create;
  FTPClient:=nil;
  FBt:=nil;
  FPb:=nil;
  {$IFDEF UPDATEPROG}
    FSystemAdmin:=false;
  {$ELSE}
    FSystemAdmin:=Role.SystemAdmin;
  {$ENDIF}
end;

destructor TSynapseObj.Destroy;
begin
  if Fpb<>nil then Fpb.Free;
  FProtokol.Free;
  inherited;
end;

procedure TSynapseObj.Event_DSockOnStatus(Sender: TObject;  Reason: THookSocketReason; const Value: String);
var
  n:Integer;
  lOk:Boolean;
begin
  if (Reason=HR_ReadCount) and (Fpb<>nil) then begin
    n:=StrToInt(Value);
    FCurCount:=FCurCount+n;
    FCount:=FCount+n;
    lOk:=true;
    if (FFileSize>1000000) then begin
      if FCurCount>200000 then begin
        n:=FCurCount;
        FCurCount:=0;
      end else begin
        lOk:=false;
      end;
    end;
    if lOk then begin
      if FThread then EnterMainThread;
      try
        if trunc(100*(FCount/FFileSize))<=100 then begin
          Fpb.Hint:='Загрузка обновления '+inttostr(trunc(100*(FCount/FFileSize)))+'%';
//        Fbt.Caption:=inttostr(fcount);
          Fpb.Position:=Fpb.Position+n;
        end else begin
          Fpb.Hint:='Обновление загружено';
        end;
        Application.ProcessMessages;
      finally
        if FThread then LeaveMainThread;
      end;
    end;
  end;
end;
procedure TSynapseObj.Event_OnStatus(Sender: TObject; Response: Boolean;  const Value: string);
var
  s:String;
begin
  if Response then s:='О> ' else s:='З>';
  FProtokol.Add(s+Value);
end;
procedure TSynapseObj.Event_ClickButton(Sender: TObject);
begin
  if FThread then EnterMainThread;
  try
    if Problem('Прервать выполнение загрузки ?') then begin
      FCancelLoad:=true;
      FTPClient.Abort;
    end;
  finally
    if FThread then LeaveMainThread;
  end;
end;
//---------------------------------------------------------------
function TSynapseObj.CreateProgressBar: TWinControl;
begin
  Result:=nil;
  if FWinOwner<>nil then begin
    Result:=TWinControl(FWinOwner);
    Fpb:=TProgressBar.Create(FWinOwner);
    Fpb.ShowHint:=true;
    Fpb.Hint:='Загрузка';
    Fpb.Parent:=Result;
    Fpb.Left:=Result.Width-Fpb.Width-20;
    Fpb.Top:=2;
    Fpb.Height:=17;
    Fpb.Anchors:=[akTop,akRight];
    Fpb.Min:=0;
    Fpb.Max:=FFileSize;
    Fpb.Visible:=true;

    Fbt:=TButton.Create(FWinOwner);
    Fbt.ShowHint:=true;
    Fbt.Hint:='Прервать загрузку';
    Fbt.Parent:=Result;
    Fbt.Anchors:=[akTop,akRight];
    Fbt.Left:=Fpb.Left-Fbt.Width-20;
    Fbt.Top:=2;
    Fbt.Height:=17;
    Fbt.Caption:='Прервать';
    Fbt.OnClick:=Event_ClickButton;

    Flb:=TStaticText.Create(FWinOwner);
    Flb.ParentFont:=false;
    Flb.Parent:=Result;
    Flb.Visible:=false;
    Flb.Top:=Fpb.Top+1;
    Flb.Left:=Fpb.Left+5;
    Flb.Anchors:=[akTop,akRight];
    Flb.Font.Size:=8;
    Flb.Font.Style:=[];
    Flb.Caption:='Сохранение файла ...';
    Flb.Width:=Fpb.Width;
  end;
end;
//---------------------------------------------------------------
//function TSynapseObj.RunFileFTP(lGetNameFile:Boolean):String;
function TSynapseObj.RunFileFTP(nAfter:Integer):String;
begin
  Result:='';
  if FError<>'' then begin
    PutError(FError);
  end else begin
    if not FCancelLoad then begin
      if nAfter=0 then begin   // вернуть имя файла
        Result:=CheckSleshN(FOutputDir)+FFileName;
      end else if nAfter=1 then begin  // установить  (по умолчанию)
        if Problem('Загрузка завершена. Установить? ') then begin
          WinExec(PChar(CheckSleshN(FOutputDir)+FFileName), SW_SHOWNORMAL);
          Application.Terminate;
        end else begin
          nAfter:=2;
        end;
      end;
      if nAfter=2 then begin  // открыть в проводнике
        ShellExecute(Application.Handle, PChar('explore'), PChar(FOutputDir), nil, nil, SW_SHOWNORMAL);
      end;
    end;
  end;
end;
//---------------------------------------------------------------
function TSynapseObj.GetFileFTP(lShowConnect:Boolean; slPar: TStringList): Boolean;
var
  sType,sFile,sOldFileName,sFileName:String;
  rFTP:TPropFTP;
  nTask:Integer;
  lSetVisible,lOk:Boolean;
  wc:TWinControl;
begin
{   slPar
    MESSAGE=(1,0)            читать сообщения
    READ_MESSAGES=прочитанные сообщения
    FILE=updatelaisXXX.exe   файл обновления
    DIR=   папка для сохранения файла
    SERVER=(0;SERVER_BREST;SERVER_FTP;SERVER_OCHERED;SERVER_ZAGS;... SERVER_NCES_UPD)   тип серверп или 0
    TYPE=update,bases,setup
}
//function ValueFromParams(slPar:TStringList;sParam,sDefault: String): String;
//function ObjectFromParams(slPar:TStringList;sParam:String): TObject;
  FCancelLoad:=false;
  FError:='';
  Result:=false;
  sOldFileName:='';

  if slPar<>nil then begin
    sOldFileName:=FFileName;
//    lCheckMessages:=ValueFromParams(slPar,'MESSAGE','0')='1';
    sFile:=ValueFromParams(slPar,'FILE','');
    sType:=ValueFromParams(slPar,'TYPE','update');
    if sFile<>'' then FFileName:=sFile;
  end else begin
    sType:='update';
  end;
  FProtokol.Clear;
  lSetVisible:=false;
  FCount:=0;
  FCurCount:=0;
  if FTypeServer=0 then
    FTypeServer:=GlobalTask.ParamAsInteger('TYPE_UPDATE');   // 1-Брест  2-FTP  10-сетевой путь
//было  rFTP:=GetPropertyFTP(FTypeServer, 'update');
  rFTP:=GetPropertyFTP(FTypeServer, sType);   // стало 14.10.2020
  FTPClient:=TFTPSend.Create;
  FTPClient.TargetHost:=rFTP.Host;
  FTPClient.TargetPort:=IntToStr(rFTP.Port);
  FTPClient.UserName:=rFTP.UserName;
  FTPClient.Password:=rFTP.Password;
  FTPClient.PassiveMode:=rFTP.Passive;
//  FThread:=false;
//  FTPClient.TargetHost:='QWW'+FTPClient.TargetHost;
  FTPClient.OnStatus:=Event_OnStatus;
  FTPClient.DSock.OnStatus:=Event_DSockOnStatus;
  FProtokol.Add('HOST:'+FTPClient.TargetHost+' '+'DIR:'+rFTP.Dir); //+ ' SAVETOFILE:'+VarToStr(FSaveToFile));
  wc:=nil;
  FRun:=RUN_GETFILE;
  if lShowConnect
    then OpenMessage('Подключение к серверу обновлений ...');
  if FThread then nTask:=EnterWorkerThread;
  try
    lOk:=FTPClient.Login and FTPClient.ChangeWorkingDir(rFTP.Dir);
    if lShowConnect then begin
      if FThread then EnterMainThread;
      CloseMessage;
      if FThread then LeaveMainThread;
    end;
    if lOk then begin
      if FFileSize=0 then begin
        FTPClient.FTPCommand('TYPE I');
        FFileSize:=FTPClient.FileSize(FFileName); //+#13+FTPClient.ResultString+#13+FTPClient.FullResult.Text);
      end;
      if FFileSize<=0 then begin
        FProtokol.Add('Не определен размер файла '+FFileName);
        FFileSize:=40000000;
      end;
      if FThread then EnterMainThread;
      try
        // создастся прогресс, если FWinOwner<>nil
        wc:=CreateProgressBar;
        if (wc<>nil) and not wc.Visible then begin
          wc.Visible:=true;
          lSetVisible:=true;
        end;
      finally
        if FThread then LeaveMainThread;
      end;
      if FOutputDir<>'' then begin
        ForceDirectories(FOutputDir);
        CheckSlesh(FOutputDir);
      end;
      FTPClient.BinaryMode:=true;
      //------- сохранять сразу в файл -----------
      {
      FTPClient.DirectFile:=FSaveToFile;
      FTPClient.DirectFileName:=FOutputDir+FFileName;
      if FileExists(FOutputDir+FFileName) then DeleteFile(FOutputDir+FFileName);
      }
      //------------------------------------------
      Result:=FTPClient.RetrieveFile(FFileName,false);//прочитали файл в поток
      if FThread then EnterMainThread;
      try
        Fpb.Position:=0;
        Flb.Visible:=true;
        Fbt.Visible:=false;
        Application.ProcessMessages;
//        Sleep(3000);
      finally
        if FThread then LeaveMainThread;
      end;
      if Result then begin
        sFileName:=FOutputDir+FFileName;
        if FileExists(sFileName) then begin
          DeleteFile(sFileName);
          Application.ProcessMessages;
          Sleep(500);
        end;
        try
          FTPClient.DataStream.SaveToFile(sFileName);  //сохранили из потока на диск
        except
          on E:Exception do begin
            FError:=E.Message;
            Result:=false;
          end;
        end;
        if not FileExists(sFileName) then begin
          if (FError='') then begin
            FError:='Файл обновления '+sFileName+' не найден';
            Result:=false;
          end;
        end;
      end else begin
        if not FCancelLoad
          then FError:=FTPClient.ResultString;
      end;
     // Fpb.Position:=0;
      FTPClient.Logout;
    end else begin
      FError:=FTPClient.ResultString;
      if FError='' then begin
        FError:=IntToStr(FTPClient.Sock.LastError)+' '+FTPClient.Sock.LastErrorDesc;
      end;
    end;
  finally
    if FThread then LeaveWorkerThread;
    FRun:=0;
  end;
  if sOldFileName<>''
    then FFileName:=sOldFileName;

  FreeAndNil(FTPClient);
  if FWinOwner<>nil then begin
    FreeAndNil(Fpb);
    FreeAndNil(Fbt);
    FreeAndNil(Flb);
    if (wc<>nil) and lSetVisible then wc.Visible:=false;
  end;
  if FError<>''
    then FProtokol.Add('ERROR:'+FError);
  if FSystemAdmin
    then ShowStrings(FProtokol,'');
end;

//---------------------------------------------------------------
function TSynapseObj.CheckUpdate(sNameFileUpdate:String): Boolean;
var
  i,m,nn:Integer;
  VerInfo:TVerInfo;
  nUpdate,nCurUpdate:Integer;
  rFTP:TPropFTP;
  nTask:Integer;
  sFile,s,ss:String;
  lMessages:Boolean;
  dFile:TDateTime;                
  sl:TStringlist;
begin
  Result:=false;
  FError:='';
  FFileName:='';
  FFileSize:=0;
  FUpdate:=0;
  FDateSprOrgSMDO:=0;
  FDateSprVidDokSMDO:=0;
  nUpdate:=0;
  FRun:=RUN_CHECK;
  if FCheckMessages
    then FMessages:='';
  if FCurUpdate=0 then begin
    try
      VerInfo:=TVerInfo.Create(Application.ExeName);
      nCurUpdate:=StrToIntDef(VerInfo.Build,0);
      VerInfo.Free;
    except
      nCurUpdate:=0;
    end;
  end else begin
    nCurUpdate:=1;
  end;
//  nCurUpdate:=8; // для проверки
  if FTypeServer=0 then
    FTypeServer:=GlobalTask.ParamAsInteger('TYPE_UPDATE');   // 1-Брест  2-FTP  10-сетевой путь  9-НСЭУ

  if (FTypeServer=NET_PATH) or (FTypeServer=0) then begin   // !!!!  <++++++++++++++++++++++++++
    exit;
  end;

  rFTP:=GetPropertyFTP(FTypeServer, 'update');
  FTPClient:=TFTPSend.Create;
  FTPClient.TargetHost:=rFTP.Host;
  FTPClient.TargetPort:=IntToStr(rFTP.Port);
  FTPClient.UserName:=rFTP.UserName;
  FTPClient.Password:=rFTP.Password;
  FTPClient.PassiveMode:=rFTP.Passive;
  FProtokol.Clear;
  FProtokol.Add('HOST:'+FTPClient.TargetHost+' '+'DIR:'+rFTP.Dir);
  FTPClient.OnStatus:=Event_OnStatus;

//  FThread:=false;  // !!! для теста
  if FThread then begin
    nTask:=EnterWorkerThread;
  end else begin
    OpenMessage('Подключение к серверу обновлений ...', '', 10);
  end;
//  sleep(20000);
  try
    if FTPClient.Login and FTPClient.ChangeWorkingDir(rFTP.Dir) then begin
      FTPClient.List(FTPClient.GetCurrentDir,false);

//    raise Exception.Create('!!!!!!! ERROR');

      for i:=0 to FTPClient.FtpList.Count-1 do begin
        dFile:=Trunc(FTPClient.FtpList[i].FileTime);
        sFile:=FTPClient.FtpList[i].FileName;
        FProtokol.Add('File='+sFile+'  Date='+FormatDateTime('dd.mm.yyyy hh:nn', dFile));
        if sNameFileUpdate=''
          then ss:=NAME_FILE_UPDATE //'UPDATELAIS';
          else ss:=sNameFileUpdate;
        // !!!!!!!!  для выполнения тестовой проверки, чтобы  не мешало реальным пользователям
//        if Role.SystemAdmin then begin
//          ss:='_'+ss;
//        end;
        nn:=Length(ss)+1;
        if FCheckMessages and (sFile=FILE_MESSAGES) then begin
          lMessages:=true;
        end;
        if FCheckSpr then begin
          if (Copy(UpperCase(sFile),1,6)='SPRORG') then begin
            try
//              d:=STOD(Copy(sFile,8,8),tdClipper);  //  sprorg_20180118
              if dFile>FDateSprOrgSMDO then begin
                FDateSprOrgSMDO:=dFile;
                FFileSprOrg:=sFile;
              end;
            except
              FDateSprOrgSMDO:=0;
            end;
          end;
          if (Copy(UpperCase(sFile),1,9)='SPRVIDDOK') then begin
            try
//              d:=STOD(Copy(sFile,8,8),tdClipper);  //  sprviddok_20180118
              if dFile>FDateSprVidDokSMDO then begin
                FDateSprVidDokSMDO:=dFile;  //  sprviddok
                FFileSprVidDok:=sFile;
              end;
            except
              FDateSprVidDokSMDO:=0;
            end;
          end;
        end;
        if Pos(ss,UpperCase(sFile))>0 then begin
          m:=LastPos('.',sFile);
          if m>0 then begin
            s:=Copy(sFile,nn,m-nn);
            nUpdate:=StrToIntDef(s,0);
            if (nCurUpdate>0) and (nUpdate>nCurUpdate) and (nUpdate>FUpdate) then begin
              Result:=true;
              FUpdate:=nUpdate;
              FFileName:=sFile;
              FFileSize:=FTPClient.FtpList[i].FileSize;
            end;
          end;
        end;
      end;
      if lMessages then begin   // может надо прочитать файл с сообщениями
        ss:=NameFromExe(FILE_MESSAGES);
        DeleteFile(ss);
        FTPClient.RetrieveFile(FILE_MESSAGES,false);//прочитали файл в поток
        //FProtokol.Add('RetrieveFile:'+FTPClient.ResultString);
        FTPClient.DataStream.SaveToFile(ss);  //сохранили из потока на диск
        if FileExists(ss) then begin
          MemoRead(NameFromExe(FILE_MESSAGES), FMessages);
        end;
      end;
      FTPClient.Logout;
    end else begin
      FError:=FTPClient.ResultString;
      if FError='' then begin
        FError:=IntToStr(FTPClient.Sock.LastError)+' '+FTPClient.Sock.LastErrorDesc;
      end;
    end;
  finally
    if FThread then begin
      LeaveWorkerThread;
    end else begin
      CloseMessage;
    end;
    FRun:=0;
  end;

  FreeAndNil(FTPClient);
  if FError<>''
    then FProtokol.Add('ERROR:'+FError);
  if FSystemAdmin then begin
    if FMessages<>''
      then FProtokol.Add('MESSAGES:'#13#10+FMessages);
    ShowStrings(FProtokol,'');
  end;
end;

initialization
  oUpdate:=nil;
finalization
  FreeAndNil(oUpdate);

end.
