unit fLoadLicGES;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, FuncPr, Registry, FileCtrl, Variants, mPermit, uTypes,
  DBCtrlsEh, Mask, MetaTask, adscnnct, {Db,} adsdata, adsfunc,
  adstable, Db, fWarning, uCheckBase, uUtilFiles, fmChList, uProject, uProjectAll, TaskParam;

type
  TfmLoadLicGES = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    lbPath: TLabel;
    Bevel1: TBevel;
    edPath: TDBEditEh;
    Label2: TLabel;
    ConnectSource: TAdsConnection;
    Query: TAdsQuery;
    cbCurSost: TDBCheckBoxEh;
    Label3: TLabel;
    cbAllPunkt: TDBCheckBoxEh;
    cbOneBase: TDBCheckBoxEh;
    btClear: TBitBtn;
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function CheckCopy(var strErr : String; strPath:String) : Boolean;
    procedure FormDestroy(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure edPathEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure cbOneBaseClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
  private
    FListSource : TStringList;
    FDirSource  : String;
    FDirTmp     : String;
    FDirDesc    : String;
    FMyBase     : Boolean;
    FRunUpdateBeforeRestore : Boolean;
    FListBases:TStringList;
  public
    function  GetInfoBase(strDict:String; var strInfo:String) : Boolean;
    function  CheckBasesForLoad(strPath:String):Boolean;
    procedure LoadData;
    function  CopyListFiles : Boolean;
    procedure UpdateActions; override;
    function  OpenTablesDict( strNameDict : String ) : Boolean;
    procedure DropMessageMouse(var Msg: TMsg; var Handled: Boolean);
  end;

  procedure LoadLicGES;

implementation

uses dBase;

{$R *.DFM}

//-----------------------------------------------------------
procedure LoadLicGES;
var
  fmLoadLicGES:TfmLoadLicGES;
begin    
  fmLoadLicGES:=TfmLoadLicGES.Create(nil);
  if dmBase.IsMainBase then begin
//    fmLoadLicGES.Label4.Visible:=false;
//    fmLoadLicGES.edAddNomerLic.Visible:=false;
//    fmLoadLicGES.edAddNomerLic.Text := '0';
  end else begin
//    fmLoadLicGES.Label4.Top:=fmLoadLicGES.cbOneBase.Top;
  //  fmLoadLicGES.edAddNomerLic.Top:=fmLoadLicGES.cbOneBase.Top;
    fmLoadLicGES.btClear.Visible:=false;

 //   fmLoadLicGES.edAddNomerLic.Text := IntToStr(dmBase.GetLastNomerLic);
    fmLoadLicGES.cbOneBase.Checked:=true;
    fmLoadLicGES.cbOneBase.Visible:=false;

  end;
  try
    if fmLoadLicGES.ShowModal=mrOk then begin
      fmLoadLicGES.LoadData;
    end;
  finally
    fmLoadLicGES.Free;
  end;
end;

//-----------------------------------------------------------
procedure TfmLoadLicGES.btOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

//-----------------------------------------------------------
function TfmLoadLicGES.CopyListFiles : Boolean;
var
  i : Integer;
  FileAttrs : Integer;
  strPathS, strName : String;
  sr :  TSearchRec;
begin
  Result := true;
//-------------
  FListSource.Clear;
  strPathS := FDirSource;
  if FileExists(strPathS+NAME_DICT) then begin
    FileAttrs := SysUtils.faReadOnly+SysUtils.faArchive+SysUtils.faAnyFile;	//faDirectory;
    if FindFirst( strPathS+'*.*', FileAttrs, sr) = 0 then begin
      strName := sr.Name;
      while strName<>'' do begin
        if ANSIUpperCase(Right(strName,3))<>'BAK' then begin
          FListSource.Add(strName);
        end;
        if FindNext(sr) = 0  then strName:=sr.Name
                             else strName:='';
      end;
      FindClose(sr);
    end;
  end;
//-------------
  if FListSource.Count = 0 then begin
    PutError('Не найдена база для копирования по пути: '+#13+FDirSource);
    Result := false;
  end else begin
    ClearDir(FDirDesc,false);
    for i:=0 to FListSource.Count-1 do begin
      Application.ProcessMessages;
      if FileExists(FDirSource+FListSource.Strings[i]) then begin
        if not CopyFile(PChar(FDirSource+FListSource.Strings[i]),
                      PChar(FDirDesc+FListSource.Strings[i]), false) then begin
          PutError('Ошибка копирования файла : '+#13+
                  'откуда :'+FDirSource+FListSource.Strings[i]+#13+
                  'куда   :'+FDirDesc+FListSource.Strings[i]+#13+
                  IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
          Result := false;
          if Problem(' Прервать копирование ? ') then begin
            break;
          end;
        end else begin
          FileAttrs := FileGetAttr(FDirDesc+FListSource.Strings[i]);
          if FileAttrs and SysUtils.faReadOnly <> 0 then begin
            if FileSetAttr(FDirDesc+FListSource.Strings[i], FileAttrs-SysUtils.faReadOnly)=-1 then begin
              PutError(' Ошибка снятия атрибута "только для чтения" с файла: '+FListSource.Strings[i]);
              Result := false;
              break;
            end;
          end;
        end;
      end;
    end;
  end;
end;

//-----------------------------------------------------------
function TfmLoadLicGES.OpenTablesDict( strNameDict : String ) : Boolean;
var
  TestConn : TAdsConnection;
  q  : TAdsQuery;
  tb : TAdsTable;
begin
  Result := true;
  TestConn := TAdsConnection.Create(Self);
  with TestConn do begin
    AdsServerTypes := dmBase.AdsConnection.AdsServerTypes;
    ConnectPath := strNameDict;
    UserName := SYSTEM_USER;
    Password := SYSTEM_PASSWORD;
    LoginPrompt := false;
    Name := 'TestConn';
  end;
  tb := TAdsTable.Create(nil);
  with tb do begin
    TableType := ttAdsADT;
    AdsTableOptions.AdsCharType := ANSI;
    DataBaseName := 'TestConn';
    Name := 'tbTmpConn';
  end;
  q := TAdsQuery.Create(nil);
  with q do begin
    SourceTableType := ttAdsADT;
    AdsTableOptions.AdsCharType := ANSI;
    DataBaseName := 'TestConn';
    Name := 'qTmpConn';
  end;
  try
    TestConn.Connect;
  except
    on E:Exception do begin
      Result := false;
      PutError('Ошибка тестового открытия загружаемой базы.'+Chr(13)+Chr(10)+E.Message);
    end;
  end;
  if Result then begin
    q.SQL.Text := 'SELECT name FROM '+SysQuery('system.tables');
    q.Open;
    while not q.Eof do begin
      tb.Close;
      tb.TableName := q.Fields[0].AsString;
      try
        tb.Open;
        Application.ProcessMessages;
      except
        on E:Exception do begin
          Result := false;
          PutError('Ошибка тестового открытия загружаемой базы.'+Chr(13)+Chr(10)+E.Message);
        end;
      end;
      q.Next;
    end;
    tb.Close;
    q.Close;
  end;
  TestConn.Disconnect;
  q.Free;
  tb.Free;
  TestConn.Free;
end;
{ // ограничить мышь
procedure TForm1.Button1Click(Sender: TObject);
var
  r: TRect;
  pr: PRect;
begin
  r.Left := 100;
  r.Top := 100;
  r.Right := Screen.Width - 100;
  r.Bottom := Screen.Height - 100;
  pr := @r;
  ClipCursor(pr);
end;
Чтобы восстановить:
ClipCursor(NULL);
}


//    i := Pos('КОПИЯДАННЫХ', ANSIUpperCase(FDirSource));
//    if i>0 then begin
//      strDir := Copy(FDirSource,1,i-1) + 'КопияСервис\';

//-----------------------------------------------------------------------------------
function TfmLoadLicGES.GetInfoBase(strDict:String; var strInfo:String) : Boolean;
var
  n:Integer;
begin
  strInfo:='';
  Result:=false;
  ConnectSource.IsConnected := false;
  ConnectSource.ConnectPath := strDict;
  ConnectSource.Password    := SYSTEM_PASSWORD;
  ConnectSource.UserName    := SYSTEM_USER;
  try
    ConnectSource.Connect;
    Query.Close;
    Query.SQL.Text:='select id_base from global';
    Query.Open;
    n:=Query.Fields[0].AsInteger;
    Query.Close;
    if n>0 then begin
      if dmBase.SprGES.Locate('PARENT;ID_BASE', VarArrayOf([GlobalTask.ParamAsInteger('ID'), n]), []) then begin
        strInfo:=dmBase.SprGES.FieldByName('NAME').AsString;
        Result:=true;
      end else begin
        if Problem('Вы хотите загрузить в базу ЖЭСа ?') then begin
          strInfo:='База ЖЭС';
          Result:=true;
        end;
      end;
    end;
  except

  end;
  ConnectSource.IsConnected:=false;
end;

//-----------------------------------------------------------------------------------
function TfmLoadLicGES.CheckBasesForLoad(strPath:String):Boolean;
var
 sr:TSearchRec;
 s,strInfo, strBases:String;
begin
  strBases:='';
  Result:=false;
  FListBases.Clear;
  if cbOneBase.Checked then begin  // грузим одну базу
    s:=CheckSleshN(strPath)+'КопияДанных\'+NAME_DICT;
    if FileExists(s) then begin
      if GetInfoBase(s, strInfo) then begin
        strBases:=strInfo;
        FListBases.Add(strPath);
        Result:=true;
      end else begin
        Result:=false;
      end;
    end else begin
      Result:=false;
    end;
    if not Result
      then PutError('Не найдена база для загрузки.')
  end else begin
    if FindFirst(CheckSleshN(strPath)+'*', faAnyFile, sr)=0 then begin
      repeat
        if (sr.Attr and faDirectory)=faDirectory then begin
          if (sr.Name<>'.') and (sr.Name<>'..') then begin
            s:=CheckSleshN(strPath)+sr.Name+'\';
            if FileExists(s+'КопияДанных\'+NAME_DICT) then begin
              if GetInfoBase(s+'КопияДанных\'+NAME_DICT, strInfo) then begin
                strBases:=strBases+#13+strInfo;
                FListBases.Add(s);
                Result:=true;
              end;
            end;
          end;
        end;
      until FindNext(sr)<>0;
    end;
    FindClose(sr);
    if FListBases.Count=0 then begin
      PutError('Не найдено ни одной базы для загрузки.')
    end else begin
      if not Problem('Найдено '+IntToStr(FListBases.Count)+' баз: '+strBases+#13+'Продолжить ? ') then begin
        Result:=false;
      end;
    end;
  end;
end;
//-----------------------------------------------------------------
procedure TfmLoadLicGES.LoadData;
var
  strPath,s,strErr, strFile, strData, strDesc, strSource : String;
  dDateCopy, dNow : TDateTime;
  lOk, lClear : Boolean;
  nTypeBackup,nErr,n,i : Integer;
begin

  dNow := Date;
  strPath:=edPath.Text;

  lOk:=CheckBasesForLoad(strPath);

  if lOk then begin

    for i:=0 to FListBases.Count-1 do begin
      strPath:=CheckSleshN(FListBases.Strings[i]);

      try

        FMyBase:=false;
        if CheckCopy(strErr, strPath) then begin
          OpenMessage(' Предварительное копирование базы ...','',12);
          GlobalTask.LogFile.WriteToLogFile('Начало загрузки базы лицевых счетов:'+FDirSource);
       //!!!   dmBase.CloseBase;
          Application.ProcessMessages;
          Sleep(100);
          strSource := FDirSource;  // откуда копировать
          strDesc   := FDirDesc;    // куда копировать
          //--- предварительно скопируем резервную копию во временную папку
          ClearDir(FDirTmp,true);
          ForceDirectories(FDirTmp);
          FDirDesc := FDirTmp+'\';
          Application.ProcessMessages;
          Sleep(100);
          lOk := CopyListFiles;

          if lOk and FRunUpdateBeforeRestore then begin
             //     ChangeMessage(' Тестовое открытие ...');
            lOk:=OpenTablesDict( FDirTmp+'\'+NAME_DICT );
          end;

          CloseMessage();
          //-----------------------------
          if lOk then begin
            if FRunUpdateBeforeRestore then begin // необходима реорганизация резервной копии
      //          lok := false;
              lOk := RunCheckBase( dmBase.GetPathConnect+NAME_DICT, FDirTmp+'\'+NAME_DICT, dmBase.AdsConnection, Self);
      //!!!        dmBase.SimpleDisconnect;
              if lOk then begin
                // копирование из временной папки в папку базы
                FDirSource := FDirTmp+'\';
                FDirDesc   := strDesc;
              end;
            end else begin
              // тестовое открытие базы после копирования во временную папку
              OpenMessage(' Тестовое открытие ...','',12);
              FDirSource := FDirTmp+'\';
              FDirDesc   := strDesc;
              lOk := OpenTablesDict( FDirTmp+'\'+NAME_DICT );
            end;
          end;
          CloseMessage();
          n:=0;
          {
          if Trim(edAddNomerLic.Text)='' then begin
            n:=0
          end else begin
            try
              n:=StrToInt(Trim(edAddNomerLic.Text));
            except
              n:=0;
            end;
          end;
          }
          if lOk then begin
//            lClear:=cbClearTables.Checked;
            nErr := dmBase.RunLoadBaseGES(false, FDirTmp+'\', cbCurSost.Checked, cbAllPunkt.Checked, n, '' {edAddNomerKniga.Text}, nil);
//            lClear:=false;
            if nErr<>0 then begin
              lOk:=false;
              strErr:=dmBase.GetErrorLoadBase(nErr);
            end;
          end;

          if not Role.SystemAdmin
            then ClearDir(FDirTmp,true);

        end else begin
          lOk := false;
        end;

      finally
        Application.OnMessage := nil;
      end;
    end;    // end  FOR

  end;
  if lOk then begin
    GlobalTask.LogFile.WriteToLogFile('Успешное завершение загрузки базы лицевых счетов.');
    ShowMessage(' Загрузка базы успешно завершена.');
  end else begin
    if strErr<>''
      then PutError(strErr)
      else PutError('Ошибка загрузки базы.');
    GlobalTask.LogFile.WriteToLogFile('При загрузке базы лицевых счетов произошла лшибка.');
    GlobalTask.LogFile.WriteToLogFile('-> '+strErr);
  end;
  // Close;  ???
end;

function TfmLoadLicGES.CheckCopy(var strErr : String; strPath:String): Boolean;
var
  strPathS : String;
  strPathD : String;
  FileAttrs,n : Integer;
  strName, strMask : String;
  sr :  TSearchRec;
  strVerCur, strVerOld, s : String;
  lOk : Boolean;
  LoadParam : TTaskParameters;
begin
  Result := false;
  FRunUpdateBeforeRestore := false;
  FDirTmp := CheckSleshN(ExtractFilePath(Application.ExeName))+'Tmp';
  strMask := CheckSleshN( dmBase.GetPathConnect )+'*.BAK';
  DeleteFiles(strMask);
  FListSource.Clear;
  strPathS := CheckSleshN( strPath );
  strVerCur := dmBase.GetVersionBase(nil);
  lOk := true;
  try
    LoadParam := TTaskParameters.Create(strPathS + 'КопияСервис\'+GlobalTask.NameFileTaskParameters);
    if GlobalTask.ParamAsInteger('ID')=LoadParam.ParamAsInteger('ID') then begin
      FMyBase := true;
    end else begin
      FMyBase := false;
    end;
    LoadParam.Free;
  except
    strErr := 'Ошибка чтения параметров загружаемой базы.';
    lOk := false;
  end;
  if lOk and FMyBase then begin
    if not Problem(' Вы хотите дозагрузить свою базу набранную на другом компьютере ? ')
      then lOk:=false;
  end;
  if lOk then begin
    strPathS := strPathS + 'КопияДанных\';
    if FileExists(strPathS+NAME_DICT) then begin
      if lOk then begin
        ConnectSource.ConnectPath := strPathS+NAME_DICT;  // откуда будем загружать базу
        ConnectSource.Password := SYSTEM_PASSWORD;
        ConnectSource.UserName := SYSTEM_USER;
        try
          ConnectSource.Connect;
        except
          strErr := 'Ошибка подключения к загружаемой базе.';
          lOk := false;
        end;
      end;
      if lOk then begin
        try
  //        strVerOld := dmBase.GetVersionBase( ConnectSource );
          Query.SQL.Text := 'SELECT Version_Major, Version_Minor FROM '+SysQuery('system.dictionary');
          Query.Open;
          strVerOld := Trim(Query.FieldByName('Version_Major').AsString+'.'+
                            Query.FieldByName('Version_Minor').AsString);
          Query.Close;
        except
          strErr := 'Невозможно определить версию резервной копии.';
          lOk := false;
        end;
        ConnectSource.Disconnect;
      end;
      if lOk then begin
        if strVerOld <> strVerCur then begin
          strErr := '';
          s := '';
          s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
          s := s + 'Версия загружаемой базы не соответствует'#13;
          s := s + 'версии текущей базы.'#13;
          s := s + 'Если Вы хотите реорганизовать загружаемую базу'#13;
          s := s + 'введите слово ДА в поле ввода.'#13;
          s := s + 'Иначе загрузка не будет произведена.'#13;
          if OkWarning(s) then begin
            FRunUpdateBeforeRestore := true;
          end else begin
            lOk := false;
          end;
        end;
      end;
      if lOk then begin
        FileAttrs := SysUtils.faReadOnly+SysUtils.faArchive+SysUtils.faAnyFile;	//faDirectory;
        strPathD := CheckSleshN( dmBase.GetPathConnect );
        if FindFirst( strPathD+'*.*', FileAttrs, sr) = 0 then begin
          strName := sr.Name;
          while strName<>'' do begin
            if ANSIUpperCase(Right(strName,3))<>'BAK' then begin
              FListSource.Add(strName);
            end;
            if FindNext(sr) = 0  then strName:=sr.Name
                                 else strName:='';
          end;
          FindClose(sr);
        end;
        FDirSource := strPathS;
        FDirDesc   := strPathD;
        Result := true;
      end;
    end else begin
      strErr := 'Не найдена база для загрузки по пути: '+strPathS;
    end;
  end;
end;

procedure TfmLoadLicGES.FormCreate(Sender: TObject);
begin
  FListBases:=TStringList.Create;
  FRunUpdateBeforeRestore := false;
  FListSource := TStringList.Create;
  edPath.Text := GlobalTask.GetLastValueAsString('PATH_LOAD');
  if Right(edPath.Text,1)='\'  then begin
    edPath.Text := Copy(edPath.Text,1,Length(edPath.Text)-1);
  end;
end;

procedure TfmLoadLicGES.FormDestroy(Sender: TObject);
begin
  FListSource.Free;
  FListBases.Free;
end;

procedure TfmLoadLicGES.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLoadLicGES.edPathEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  strDir:String;
begin
  if SelectDirectory('Выберите каталог c загружаемой базы', '', strDir) then begin
    edPath.Text := strDir;
    Handled := true;
  end;
end;

procedure TfmLoadLicGES.UpdateActions;
begin
  inherited;
  btOk.Enabled := (edPath.Text<>'') and
                  (UpperCase(Copy(edPath.Text,1,4))<>'DATA');
end;

procedure TfmLoadLicGES.DropMessageMouse(var Msg: TMsg;  var Handled: Boolean);
begin
  Handled := (msg.wParam > 0) and (msg.wParam <255);
//  Handled := (msg.wParam = vk_lButton) or
//             (msg.wParam = vk_rButton) or
//             (msg.wParam = vk_mButton);
end;

procedure TfmLoadLicGES.cbOneBaseClick(Sender: TObject);
begin
  if cbOneBase.Checked
    then lbPath.Caption:='Путь к загружаемой базе'
    else lbPath.Caption:='Путь к папке с копиями';
end;

procedure TfmLoadLicGES.btClearClick(Sender: TObject);
var
  s:String;
  arr:TArrStrings;
  i:Integer;
begin
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'После выполнения операции информация в базе будет уничтожена.'#13;
  s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
  s := s + 'введите слово ДА в поле ввода'#13;
  if OkWarning(s) then begin
     OpenMessage('Очистка базы ...');
     try
       dmBase.AdsConnection.CloseCachedTables;
       dmBase.CloseBase;
       Application.ProcessMessages;
       Sleep(100);
       Application.ProcessMessages;
       s:=dmBase.LoadSQLEx(GetNameFileClearBase);
       s:=StringReplace(s,Chr(13),'',[rfReplaceAll, rfIgnoreCase]);
       s:=StringReplace(s,Chr(10),'',[rfReplaceAll, rfIgnoreCase]);
       Application.ProcessMessages;
       if s<>'' then begin
         strToArr(s,arr,';',true);
         dmBase.AdsConnection.IsConnected:=false;
         dmBase.AdsSharedConnection.IsConnected:=false;
//         dmBase.AdsConnection.IsConnected:=true;
         try
           for i:=0 to Length(arr)-1 do begin
             dmBase.AdsConnection.IsConnected:=true;
             dmBase.WorkQuery.SQL.Text:=arr[i];
             dmBase.WorkQuery.ExecSQL;
             dmBase.AdsConnection.IsConnected:=false;

//             dmBase.WorkQuery.AdsCloseSQLStatement;
//             dmBase.AdsConnection.CloseCachedTables;
             Sleep(100);
             Application.ProcessMessages;
           end;
         except
           on E:Exception do begin
             CloseMessage;
             PutError('Ошибка очистки базы:'+Chr(13)+Chr(10)+E.Message+Chr(13)+Chr(10)+arr[i]);
           end;
         end;
         dmBase.AdsConnection.IsConnected:=false;
         Application.ProcessMessages;
       end;
       dmBase.OpenBase;
     finally
       CloseMessage;
     end;
  end;
end;

initialization

end.
