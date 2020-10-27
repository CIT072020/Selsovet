unit dBaseConf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DataTask, adsdictionary, adsset, adstable, Db, adsdata, adsfunc, adscnnct, fWarning,
  registry, funcpr, uProjectAll, metatask;

type
  TdmBaseConf = class(TdmTask)
    NewConn: TAdsConnection;
    AdsDictionary: TAdsDictionary;
    NewDict: TAdsDictionary;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    slRun:TStringList;
    SystemPassword:String;
    constructor Create(Owner : Tcomponent); override;
    function GetPathConnect : String;
    function GetCurPath : String;
    function GetPathSprConnect : String;
    function GetPathNewConnect : String;
    function SetNameFileParamTask : Boolean; override;
    function GetStrRegKey: String;
    function GetInstallPath: String;
    procedure DMClearBase;
    function DMAdminConnct:Boolean;
    function LoadSQLEx(strNameSQL: String): String;
    function CheckDateFiksSQL(strSQL: String; DateFiks: TDateTime) : String;
    function GetDateCurrentSost: TDateTime;

  end;

var
  dmBaseConf: TdmBaseConf;
  strTypeBase : String;
  lLais:Boolean;
  NameDict:String;
  TypeServerFTP:Integer;
  DirFTP:String;

const
  SERVER_BREST=1;
  SERVER_RIAP=2;
  SERVER_NCES_UPD=9;

  // DirFTP:='/var/ftpd/pub/bases';


implementation

{$R *.DFM}

{ TdmBaseConf }

constructor TdmBaseConf.Create(Owner: Tcomponent);
begin
  CreateSimple(Owner);
  slRun:=TStringList.Create;
  dmTaskCreate(true);
  if strTypeBase='ZAGS' then begin
    GlobalTask.NameFileTaskParameters := 'ParamZags.tsk';
  end else if strTypeBase='OCHERED' then begin
    GlobalTask.NameFileTaskParameters := 'ParamOchered.tsk';
  end else if strTypeBase='GKH' then begin
    GlobalTask.NameFileTaskParameters := 'ParamGKH.tsk';
  end else if strTypeBase='ZAH' then begin
    GlobalTask.NameFileTaskParameters := 'ParamZAH.tsk';
  end else if strTypeBase='OPEKA' then begin
    GlobalTask.NameFileTaskParameters := 'ParamOpeka.tsk';
  end else if strTypeBase='POST' then begin
    GlobalTask.NameFileTaskParameters := 'ParamPost.tsk';
  end else begin
    GlobalTask.NameFileTaskParameters := 'Parameters.tsk';
  end;
  ReadGlobalPar(PathForSysParams);
  SetMainComp;
  AdsConnection.ConnectPath := GetPathConnect;
  AdsSharedConnection.ConnectPath := GetPathSprConnect;
  AdsDictionary.ConnectPath := GetPathConnect;
  NewConn.ConnectPath := GetPathNewConnect;
  NewDict.ConnectPath := GetPathNewConnect;
  GlobalPar.ConnectPath := AdsConnection.ConnectPath;
  GlobalPar.SharedConnectPath  := AdsSharedConnection.ConnectPath;
//  ReadParamsAllTables;
end;

//---------------------------------------------------------------
function TdmBaseConf.GetInstallPath: String;
var
  reg : TRegistry;
begin
  Result := '';
  reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('Software\VCBOUS\'+GetStrRegKey,false)
      then Result := Reg.ReadString('installpath');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  if Result=''
    then Result:=ExtractFilePath(Application.ExeName);
end;
//---------------------------------------------------------------
function TdmBaseConf.LoadSQLEx(strNameSQL: String): String;
var
  s : String;
begin
  Result:='';
  if LoadSQL(strNameSQL, s) then begin
    Result := s;
    Result := CheckDateFiksSQL(Result,GetDateCurrentSost);
  end;
end;
//-------------------------------------------------------------------------------
function TdmBaseConf.GetDateCurrentSost: TDateTime;
begin
  Result := STOD('1899-12-30', tdAds);
end;
//--------------------------------------------------------------------------------------
function TdmBaseConf.CheckDateFiksSQL(strSQL: String; DateFiks: TDateTime) : String;
begin
  strSQL := StringReplace(strSQL, '1899-12-30', DTOS(DateFiks,tdAds), [rfReplaceAll, rfIgnoreCase]);
  strSQL := StringReplace(strSQL, '&DATE_FIKS&', QStr(DTOS(DateFiks,tdAds)), [rfReplaceAll, rfIgnoreCase]);
  Result := strSQL;
end;

//---------------------------------------------------------------
function TdmBaseConf.GetPathConnect: String;
var
  reg : TRegistry;
begin
  Result := GetInstallPath;
  if Result <> '' then begin
    Result := CheckSleshN(Result) + 'Data\'+NameDict;
  end;
end;

function TdmBaseConf.GetStrRegKey: String;
begin
  if lLais or (strTypeBase='SELSOVET') then begin
    Result:='LAIS';                      
  end else begin
    Result:=strTypeBase;
  end;
end;

function TdmBaseConf.GetCurPath: String;
begin
  Result := GetInstallPath;
  if Result <> '' then begin
    Result := CheckSleshN(Result) + 'Data\';
  end;
end;
                                                  
function TdmBaseConf.GetPathSprConnect: String;
begin
  Result := GetInstallPath;
  if Result <> '' then begin
    Result := CheckSleshN(Result) + 'Spr\SysSpr.add';
  end;
end;

function TdmBaseConf.GetPathNewConnect: String;
begin
  Result := GetInstallPath;
  if Result <> '' then begin
    Result := CheckSleshN(Result) + 'NewData\'+NameDict;
  end;
end;

function TdmBaseConf.SetNameFileParamTask: Boolean;
begin
  Result := true;
end;

procedure TdmBaseConf.DMClearBase;
var
  s,ss,strErr:String;
  arr:TArrStrings;
  i:Integer;
  lOk,lErr:Boolean;
begin
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'После выполнения операции'#13;
  s := s + 'информация в базе будет уничтожена.'#13;
  s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
  s := s + 'введите пароль АДМИНИСТРАТОРА в поле ввода'#13;
  lOk:=false;
  lErr:=true;
  while lErr do begin
    ss:=s;
    if OkWarningEx(ss, 2) then begin
      AdsConnection.IsConnected:=false;
      AdsConnection.Username:='АДМИНИСТРАТОР';
      AdsConnection.Password:=ss;
      if dmBaseConf.OpenConnect(strErr) then begin
        lOk:=true;
        lErr:=false;
      end else begin
        PutError(strErr);
      end;
    end else begin
      lErr:=false;
    end;
  end;
  if lOk then begin
     OpenMessage('     Очистка базы ...     ','',10);
     try
       AdsConnection.CloseCachedTables;
       Application.ProcessMessages;
       if LoadSQL(GetNameFileClearBase, s) then begin
         s:=StringReplace(s,Chr(13),'',[rfReplaceAll, rfIgnoreCase]);
         s:=StringReplace(s,Chr(10),'',[rfReplaceAll, rfIgnoreCase]);
         Application.ProcessMessages;
         if s<>'' then begin
           strToArr(s,arr,';',true);
           try
             for i:=0 to Length(arr)-1 do begin
               ChangeMessage('  Шаг ' +IntToStr(i+1)+' из '+IntToStr(Length(arr)) );
               AdsConnection.Execute(arr[i]);
               Application.ProcessMessages;
             end;
           except
             on E:Exception do begin
               CloseMessage;
               PutError('Ошибка очистки базы:'+Chr(13)+Chr(10)+E.Message+Chr(13)+Chr(10)+arr[i]);
             end;
           end;
           AdsConnection.IsConnected:=false;
           Application.ProcessMessages;
         end;
       end else begin
         PutError('Не найден скрипт для очистки базы');
       end;
     finally
       CloseMessage;
     end;
  end;
end;

function TdmBaseConf.DMAdminConnct:Boolean;
var
  s,ss,strErr:String;
  arr:TArrStrings;
  i:Integer;
  lOk,lErr:Boolean;
begin
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
  s := s + 'Введите пароль АДМИНИСТРАТОРА в поле ввода'#13;
  lOk:=false;
  lErr:=true;
  while lErr do begin
    ss:=s;
    if OkWarningEx(ss, 2) then begin
      AdsConnection.IsConnected:=false;
      AdsConnection.Username:='АДМИНИСТРАТОР';
      AdsConnection.Password:=ss;
      if dmBaseConf.OpenConnect(strErr) then begin
        dmBaseConf.SimpleDisconnect;
        AdsConnection.Username:='ADSSYS';
        AdsConnection.Password:=SystemPassword;
        if dmBaseConf.OpenConnect(strErr) then begin
          lOk:=true;
          lErr:=false;
        end else begin
          PutError(strErr);
        end;
      end else begin
        PutError(strErr);
      end;
    end else begin
      lErr:=false;
    end;
  end;
  if lOk then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

procedure TdmBaseConf.DataModuleDestroy(Sender: TObject);
begin
  slRun.Free;
  inherited;
end;


initialization
  strTypeBase := 'SELSOVET';
  NameDict:='Selsovet.add';
  TypeServerFTP:=SERVER_BREST;
  DirFTP:='';

finalization

end.
