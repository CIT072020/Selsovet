program UpdateProg;

{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

uses
  Windows,
  Classes,
  Forms,
  FileCtrl,
  Dialogs,
  SysUtils,
  Registry,
  Variants,
  fmQueryEx,
  ROPasScript,
  MetaTask,
  ifp_metatask in 'ifp_metatask.pas',
  FuncPr,
  fMainConf in 'fMainConf.pas' {fmMainConf},
  DataTask in 'DataTask.pas' {dmTask: TDataModule},
  dBaseConf in 'dBaseConf.pas' {dmBaseConf: TDataModule},
  fParamsGisun in 'fParamsGisun.pas' {fmParamsGisun},
  fTypeServer in 'fTypeServer.pas' {fmTypeServer},
  fServiceUpdate in 'fServiceUpdate.pas' {fmServiceUpdate};
    
{$R *.RES}

var
  strErr, strUser, strPassword, ss, sss : String;
  i,FileAttrs : Integer;
  lOk,lSetTypeServer,lSetGisun,lCopyLastUpdate,lClearBase,lService,lRunSQL : Boolean;
  sFile,sSQL:String;
  val : Variant;
  reg : TRegistry;
  sl:TStringList;
begin
  SetThreadLocale(1049);
  Application.Initialize;
  strUser := '*';
  strPassword := '*';
  strTypeBase := 'SELSOVET';
  lLais:=false;
  lSetTypeServer:=false;
  lSetGisun:=false;
  lClearBase := false;
  lCopyLastUpdate := false;    
  lService := false;
  lRunSQL := false;
  for i:=1 to ParamCount do begin
    ss := Trim(UpperCase(ParamStr(i)));
    if Copy(UpperCase(ParamStr(i)),1,5)='/PSW:' then begin
      strPassword := Trim(Copy(ParamStr(i),6,30));
    end else if Copy(UpperCase(ParamStr(i)),1,5)='/USR:' then begin
      strUser := Trim(Copy(ParamStr(i),6,30));
    end else if Copy(ss,1,5)='/ZAGS' then begin
      strTypeBase := 'ZAGS';
    end else if Copy(ss,1,4)='/GKH' then begin
      strTypeBase := 'GKH';
    end else if (Copy(UpperCase(ParamStr(i)),1,5)='/POST') or (UpperCase(ParamStr(i))='/LAISSMDO') then begin
      strTypeBase := 'POST';
      NameDict:='Base.add';
    end else if (Copy(ss,1,5)='/LAIS') or (Copy(ss,1,5)='/SELS') then begin
      strTypeBase := 'SELSOVET';
      lLais:=true;
    end else if Copy(ss,1,4)='/OCH' then begin
      strTypeBase := 'OCHERED';
    end else if Copy(ss,1,4)='/ZAH' then begin
      strTypeBase := 'ZAH';
      NameDict:='Base.add';
    end else if Copy(UpperCase(ParamStr(i)),1,6)='/OPEKA' then begin
      strTypeBase := 'OPEKA';
      NameDict:='Base.add';
    end else if Copy(UpperCase(ParamStr(i)),1,11)='/TYPESERVER' then begin
      lSetTypeServer := true;
    end else if Copy(UpperCase(ParamStr(i)),1,6)='/GISUN' then begin
      lSetGisun := true;
    end else if Copy(UpperCase(ParamStr(i)),1,10)='/CLEARBASE' then begin
      lClearBase := true;
    end else if Copy(UpperCase(ParamStr(i)),1,5)='/SERV' then begin
      lService := true;
    end else if ss='/LASTUPDATE' then begin
      lCopyLastUpdate := true;
    end else if Copy(ss,1,4)='/SQL' then begin
      lRunSQL := true;
      sSQL:='';
      if Copy(ss,5,1)=':' then begin
        sFile:=ExtractFilePath(Application.ExeName)+'SQL\'+Copy(ss,6,Length(ss))+'.sql';
        if FileExists(sFile) then begin
          MemoRead(sFile,sSQL);
        end;
      end;      
    end;
  end;     
  if lCopyLastUpdate then begin
    reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey('Software\VCBOUS',false) then begin
        ss  := Reg.ReadString('namelastupdate');
        sss := Reg.ReadString('typelastupdate');
        if (ss<>'') and ((sss='SELSOVET') or (sss='LAIS') or (sss='GKH') or (sss='ZAH') or (sss='OPEKA') or (sss='POST') or (sss='ZAGS') or (sss='OCHERED')) then begin
          if Pos('LASTUPDATE.EXE',ANSIUpperCase(ss))=0 then begin
//            ShowMessage(' КОПИРОВАНИЕ ');
            if FileExists(ss) then begin
              ForceDirectories(CheckSleshN(ExtractFilePath(ParamStr(0)))+'LastUpdate');
              sss:=CheckSleshN(ExtractFilePath(ParamStr(0)))+'LastUpdate\LastUpdate.exe';
              lOk:=true;
              if FileExists(sss) then begin
                FileAttrs := FileGetAttr(sss);
//                if FileAttrs and SysUtils.faReadOnly <> 0 then begin
                if FileAttrs and faReadOnly <> 0 then begin
                  if FileSetAttr(sss, FileAttrs-faReadOnly)=-1 then begin
                    PutError(' Ошибка снятия атрибута "только для чтения" с файла: '+sss);
                    lOk:=false;
                  end;
                end;
                if lOk then begin
                  if not DeleteFile(sss) then begin
                    PutError('Ошибка удаления файла : '+sss+
                       #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
                    lOk:=false;
                  end;
                end;
              end;
              if lOk then begin
                if not CopyFile(PChar(ss), PChar(sss), false) then begin
                  PutError('Ошибка копирования файла : '+ss+
                          #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
                end else begin
                  FileAttrs := FileGetAttr(sss);
                  if FileAttrs and faReadOnly <> 0 then begin
                    if FileSetAttr(sss, FileAttrs-faReadOnly)=-1 then begin
                      PutError(' Ошибка снятия атрибута "только для чтения" с файла: '+sss);
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
//        Reg.WriteString('namelastupdate','');
//        Reg.WriteString('typelastupdate','');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end else begin

  ;
  Application.CreateForm(TfmMainConf, fmMainConf);
  Application.CreateForm(TdmBaseConf, dmBaseConf);
  ;
                        
    fmMainConf.SystemPassword := 'sysdba';
    dmBaseConf.SystemPassword := fmMainConf.SystemPassword;
    GlobalTask.LogFile.IncDateTime := true;
    GlobalTask.LogFile.DateTimeFormatStr := 'dd.mm.yyyy hh:nn  ';
    GlobalTask.LogFile.LoggingActive := GlobalTask.ParamAsBoolean('LOG_ACTIVE');
    GlobalTask.LogFile.LogFileName   := CheckSleshN(GlobalTask.PathWorkDir)+'LogFile.txt';
    GlobalTask.SetWorkParam('TYPEBASE',strTypeBase);
   
    if lSetTypeServer then begin
      ss:=dmBaseConf.IniSysParams.ReadString('ADMIN','SERVERTYPES', 'LOCAL');
      Application.CreateForm(TfmTypeServer, fmTypeServer);
      fmTypeServer.Pass:=fmMainConf.SystemPassword;
      if Pos('LOCAL',ss)>0
        then fmTypeServer.rbLocal.Checked  := true
        else fmTypeServer.rbRemote.Checked := true;
      ss := UpperCase(Copy(dmBaseConf.IniSysParams.ReadString('ADMIN','COMMUNICATION', 'DEFAULT'),1,3));
      if ss='DEF' then begin
        fmTypeServer.cbC.ItemIndex := 0;
      end else if ss='TCP' then begin
        fmTypeServer.cbC.ItemIndex := 1;
      end else if ss='UDP' then begin
        fmTypeServer.cbC.ItemIndex := 2;
      end else if ss='IPX' then begin
        fmTypeServer.cbC.ItemIndex := 3;
      end else begin
        fmTypeServer.cbC.ItemIndex := 0;
      end;
      fmTypeServer.edIP.Text := dmBaseConf.IniSysParams.ReadString('SERVER','LAN_IP', '');
      if dmBaseConf.IniSysParams.ReadString('SERVER','LAN_PORT', '')<>'' then begin
        try
          fmTypeServer.edPORT.Value := dmBaseConf.IniSysParams.ReadInteger('SERVER','LAN_PORT', 6262);
        except
          fmTypeServer.edPORT.Text := '';
        end;
      end;
      fmTypeServer.ShowModal;
      fmTypeServer.Free;
    end else if lService then begin
      Application.CreateForm(TfmServiceUpdate, fmServiceUpdate);
      fmServiceUpdate.ShowModal;                                        
      fmServiceUpdate.Free;
    end else if lSetGisun then begin
      Application.CreateForm(TfmParamsGisun, fmParamsGisun);
      fmParamsGisun.SetTypeBase(strTypeBase);
      fmParamsGisun.ShowModal;
      fmParamsGisun.Free;
    end else if lClearBase then begin
      dmBaseConf.DMClearBase;
    end else if lRunSQL then begin
      if dmBaseConf.DMAdminConnct then begin
        sl:=TStringList.Create;
        // наименования таблиц по-русски не подсвечиваются ?
        sl.CommaText:='Ochered,OcheredResh,Население,ЗаключениеБраков,AktTermMarriage,ListSvid';
        ShowFormQuery(dmBaseConf.GetPropertyAds, dmBaseConf.IniSysParams, false, sSQL, true, sl);
        dmBaseConf.AdsConnection.Disconnect;
        sl.Free;
      end;
    end else begin

     // strUser := 'АДМИНИСТРАТОР';
      dmBaseConf.CheckNewUser := true;
      dmBaseConf.CheckUser     := strUser;
      dmBaseConf.CheckPassword := strPassword;
      ExitCode := 0; // системная переменная  Delphi
      if not dmBaseConf.OpenConnect(strErr) then begin
        PutError(strErr);
        ExitCode := 1;
      end else begin
        if strUser <> 'ADSSYS' then begin
          fmMainConf.SysAdmin := false;
        end;
        dmBaseConf.CheckNewUser := true;
        dmBaseConf.CheckUser    := 'ADSSYS';
        dmBaseConf.CheckPassword:= fmMainConf.SystemPassword;
        if not dmBaseConf.OpenConnect(strErr) then begin
          PutError(' Невозможно подключиться ситемным администратором ! ');
          ExitCode := 1;
        end;
      end;
      if ExitCode = 0 then begin
    //    if (ParamStr(1)<>'') and (Copy(UpperCase(Trim(ParamStr(1))),1,2)='/R') then begin
    //      fmMainConf.TypeChange := chRestore;
    //    end;
        lOk := true;
        fmMainConf.CheckUpdate; // заполняются параметры выполнения обновления
//        ShowMessage(fmMainConf.ScriptFile);
        if fmMainConf.ScriptFile<>'' then begin
          GlobalTask.SetNameFileMainScript(fmMainConf.ScriptFile);
          RegisterScriptClass( SIRegister_Metatask, RIRegister_Metatask);
          RegisterScriptLib( RegisterMetaTaskLibrary_C, RegisterMetaTaskLibrary_R);

          RegisterScriptVar('GlobalTask', 'TMetaTask', GlobalTask);
    //      RegisterScriptVar('fmMainConf', 'TfmMainConf', fmMainConf);
    //      RegisterScriptVar('dmBaseConf', 'TdmBaseConf', dmBaseConf);

          lOk := GlobalTask.CreateMainScript; // обязательно после RegisterDatatask
        end;
        if lOk then begin
          fmMainConf.CreateReadme;
          if fmMainConf.ScriptFile<>'' then begin
            val := null;
            GlobalTask.Script.RunEx('BEFOREUPDATE',[],val);
            if (val <> null) and (VarType(val)<>varEmpty) then begin
              ExitCode := val;
            end;
          end;
          if ExitCode = 0 then begin
            try
              dmBaseConf.AdsConnection.CloseCachedTables;
              dmBaseConf.AdsConnection.IsConnected:=false;
              dmBaseConf.AdsConnection.IsConnected:=true;
            except
              ExitCode := 1;
            end;
            if not fmMainConf.RunUpdate then begin
              ExitCode := 1;
            end;
          end;
        end else begin
          PutError('Ошибка создания скрипта '+fmMainConf.ScriptFile);
          ExitCode := 1;
        end;
    //    Application.Run;
      end;

    end;
  end;
//  ShowMessage(IntToStr(ExitCode));
//  if nExitCode > 0
//    then Halt(nExitCode);
end.
