unit uCheckBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, Dialogs,
  adsdata, adsfunc, adstable, adscnnct, adsdictionary, ace, db,
  dbFunc, funcpr, dBase, CheckDictionary, MetaTask, ifpii_dbfunc
  {$IFDEF VER150} ,Variants {$ENDIF}  ;                                    


function RunCheckBase( strNewPath, strOldPath : String; Conn : TAdsConnection; form : TForm) : Boolean;
                          
implementation

function RunScriptUpdate( strNameFunc : String) : Boolean;
var
  val : Variant;
begin
  Result := true;      
  val := null;
  GlobalTask.Script.RunEx( strNameFunc,[],val);
  if (val <> null) and (VarType(val)<>varEmpty) then begin
    if VarToStr(val) <> '0' then begin
      Result := false;
    end;
  end;
end;

function RunCheckBase( strNewPath, strOldPath : String; Conn : TAdsConnection; form : TForm) : Boolean;
var
  sl : TStringList;
  ss,strConn : String;
  arr : TArrStrings;
  i : Integer;
  ch : TCheckDictionary;
  NewDict, OldDict : TAdsDictionary;
  OldConnect, NewConnect : TAdsConnection;
  tb : TAdsTable;
  Query : TAdsQuery;
begin
  Result  := true;
  NewDict := TAdsDictionary.Create(nil);
  with NewDict do begin
    AdsServerTypes := Conn.AdsServerTypes;
    ConnectPath := strNewPath;
    UserName := SYSTEM_USER;
    Password := SYSTEM_PASSWORD;
    LoginPrompt := false;
    Name := 'NewDict';
  end;
  OldDict := TAdsDictionary.Create(nil);
  with OldDict do begin
    AdsServerTypes := Conn.AdsServerTypes;
    ConnectPath := strOldPath;
    UserName := SYSTEM_USER;
    Password := SYSTEM_PASSWORD;
    LoginPrompt := false;
    Name := 'OldDict';
  end;
  OldConnect := TAdsConnection.Create(Form);
  with OldConnect do begin
//    AdsCollation:='ANSI:ads_ascii';
    AdsServerTypes := Conn.AdsServerTypes;
    ConnectPath := strOldPath;
    UserName := SYSTEM_USER;
    Password := SYSTEM_PASSWORD;
    LoginPrompt := false;
    Name := 'OldConnect';
  end;
  Query := TAdsQuery.Create(Form);
  with Query do begin
    SourceTableType := ttAdsADT;
    AdsTableOptions.AdsCharType := ANSI;
//    AdsTableOptions.AdsCollation:='ANSI:ads_ascii';
    DataBaseName := 'OldConnect';
    Name := 'qOldConn';
  end;
  NewConnect := TAdsConnection.Create(Form);
  with NewConnect do begin
    AdsServerTypes := Conn.AdsServerTypes;
    ConnectPath := strNewPath;
    UserName := SYSTEM_USER;
    Password := SYSTEM_PASSWORD;
    LoginPrompt := false;
    Name := 'NewConnect';
  end;
  tb := TAdsTable.Create(nil);
  with tb do begin
    TableType := ttAdsADT;
    AdsTableOptions.AdsCharType := ANSI;
    DataBaseName := 'OldConnect';
    Name := 'tbOldConnect';
  end;

  try
    OldDict.Connect;
    NewDict.Connect;
    OldConnect.Connect;
    NewConnect.Connect;
  except
    on E:Exception do begin
      Result := false;
      PutError(E.Message);
    end;
  end;
  if Result then begin

    //-------- для последующей корректной работы скрипта ---
    strConn := dbGetCurrentConnect;      // запоминаем текущий коонект в скрипте
    dbRegisterConnect('OldConnect','');  // регистрирует и устанавливаем наш коннект
    dbSetCurrentConnect('OldConnect');
    //------------------------------------------------------

    RunScriptUpdate('BEFORECHECK');
    sl := TStringList.Create;
    ch := TCheckDictionary.Create(NewDict, OldDict);
    ch.CurConnect:=OldConnect;
    ch.NewConnect:=NewConnect;
    ch.EnabledCheckObjects:=[coScript];
    ch.ShowCheck:=true;
    ch.CheckDataBase;
    ch.GetScript( sl );
  //    for i:=0 to sl.Count-1 do begin
  //      Readme.Lines.Add(sl.Strings[i]);
  //    end;
  //      ss := '';
  //      for i:=0 to Readme.Lines.Count-1 do begin
  //        ss := ss + '"'+Readme.Lines[i]+'",';
  //      end;
  //      ShowStrings( Readme.Lines,'');
  //  Application. ProcessMessages;

    ss := sl.Text;
    StrToArr(ss,arr,'-- /////',true);
//!!!    Result:=RunScriptUpdate('BEFOREUPDATE');
    RunScriptUpdate('BEFOREUPDATE');
    try
      OldConnect.CloseCachedTables;
      OldConnect.IsConnected:=false;
      OldConnect.IsConnected:=true;
    except
      ExitCode:=1;
    end;
    for i:=Low(arr) to High(arr) do begin
      ChangeMessage('Изменение структуры базы'#13'  Шаг '+IntToStr(i+1)+
                   '  из  '+IntToStr(High(arr)+1));
      try
        OldConnect.CloseCachedTables;
        Query.SQL.Text:=arr[i];
        Query.ExecSQL;
//  было      OldConnect.Execute(arr[i]);
      except
        on E:Exception do begin
          Result := false;
          PutError(E.Message+#13+arr[i]);
          break;
        end;
      end;
    end;
    Application.ProcessMessages;
    if Result then begin
      Result := RunScriptUpdate('AFTERUPDATE');
      if Result then begin
        // попробуем открыть все таблицы базы
        ChangeMessage('Тестовое открытие...');
        sl.Clear;
        OldDict.GetTableNames(sl);
        for i:=0 to sl.Count-1 do begin
          tb.Close;
          tb.TableName := sl.Strings[i];
          try
            tb.Open;
          except
            on E:Exception do begin
              Result := false;
              PutError('Ошибка открытия таблицы резервной копии.'+Chr(13)+Chr(10)+E.Message);
            end;
          end;
          if not Result then break;
        end;
        tb.Close;
      end;
    end;

    ch.ShowCheck := false;
    ch.Free;

    //-------- для последующей корректной работы скрипта ---
    dbUnRegisterConnect('OldConnect');
    dbSetCurrentConnect(strConn);         // возвращаем коннект скрипта обратно
    //------------------------------------------------------

    OldDict.Disconnect;
    NewDict.Disconnect;
    OldConnect.Disconnect;
    NewConnect.Disconnect;
    sl.Free;
  end;
  tb.Free;
  OldDict.Free;
  NewDict.Free;
  FreeAndNil(OldConnect);
  FreeAndNil(NewConnect);
end;

end.
