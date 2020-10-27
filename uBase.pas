unit uBase;

interface

{$I Task.inc}

uses Windows, SysUtils, Db, Classes, Graphics, Controls, Forms, Dialogs,
     adscnnct,
     FuncPr, dbFunc, SasaIniFile, FileCtrl, MetaTask;


  function ConnectExecuteM(strSQL:String; var strErr:String; nLog:Integer): Boolean;
  function ConnectExecuteS(strSQL:String; var strErr:String; nLog:Integer): Boolean;
  function OpenWorkQuery(strSQL:String; var strErr:String; nLog:Integer): TDataSet;

implementation

uses fMain, dBase;

//--------------------------------------------------------------------------------------
function ConnectExecuteSQL_(Conn:TAdsConnection; strSQL:String; var strErr:String; nLog:Integer): Boolean;
var
  s:String;
begin
  Result:=true;
  strErr:='';
  s:='';
  try
    Conn.Execute(strSQL);
  except
    on E:Exception do begin
      Result:=false;
      strErr:=E.Message;
      s:=' =>';
    end;
  end;
  if (nLog=1) or ((Result=false) and (nLog=2))
    then GlobalTask.WriteToLogFile(StringReplace(strSQL, #13#10, ' ', [rfReplaceAll])+s+strErr);
end;
//--------------------------------------------------------------------------------------
function ConnectExecuteM(strSQL:String; var strErr:String; nLog:Integer): Boolean;
begin
  Result:=ConnectExecuteSQL_(dmBase.AdsConnection,strSQL,strErr,nLog);
end;
//--------------------------------------------------------------------------------------
function ConnectExecuteS(strSQL:String; var strErr:String; nLog:Integer): Boolean;
begin
  Result:=ConnectExecuteSQL_(dmBase.AdsSharedConnection,strSQL,strErr,nLog);
end;
//--------------------------------------------------------------------------------------
function OpenWorkQuery(strSQL:String; var strErr:String; nLog:Integer): TDataSet;
var
  s:String;
begin
  Result:=nil;
  strErr:='';
  s:='';
  try
    dmBase.WorkQuery.SQL.Text:=strSQL;
    dmBase.WorkQuery.Open;
    Result:=dmBase.WorkQuery;
  except
    on E:Exception do begin
      strErr:=E.Message;
      s:=' =>';
    end;
  end;
  if (nLog=1) or ((Result=nil) and (nLog=2))
    then GlobalTask.WriteToLogFile(StringReplace(strSQL, #13#10, ' ', [rfReplaceAll])+s+strErr);
end;


begin

end.
