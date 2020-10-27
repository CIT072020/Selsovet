unit fCopyData;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, FuncPr, Registry, FileCtrl, uTypes,
  DBCtrlsEh, Mask, MetaTask, adscnnct, {Db,} adsdata, adsfunc,
  {$IFDEF SMDO} uSmdo, {$ENDIF}
  adstable, Db, fWarning, uCheckBase, uUtilFiles, fmChList, uProject, uProjectAll,
  kbmMemTable, kbmMemCSVStreamFormat, ZipForge;

type
  TfmCopyData = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    Label1: TLabel;
    Bevel1: TBevel;
    edPath: TDBEditEh;
    Label2: TLabel;
    ConnectSource: TAdsConnection;
    Query: TAdsQuery;
    cbRestoreParams: TCheckBox;
    Dokument: TkbmMemTable;
    SvidPovtor: TkbmMemTable;
    HistZAGS: TkbmMemTable;
    kbmCSVStreamFormat2: TkbmCSVStreamFormat;
    cbDocArxiv: TCheckBox;
    Zip: TZipForge;
    cbArxiv: TCheckBox;
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function CheckCopy(var strErr : String) : Boolean;
    function CheckCopyRestore(var strErr : String): Boolean;
    procedure FormDestroy(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure edPathEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure cbRestoreParamsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbArxivClick(Sender: TObject);
  private
    FListSource : TStringList;
    FError:String;
    FDirSource  : String;
    FDirTmp     : String;
    FDirDesc    : String;
    FPathAutoBackup  : String;
    FPathAutoBackup2 : String;
    FRestore: Boolean;
    FRunUpdateBeforeRestore : Boolean;
    FAutoBackup: Boolean;
    FNumCopy: Integer;
    FFullPath: Boolean;
    FArxivCopy: Boolean;
    FIdBase: String;
    procedure SetRestore(const Value: Boolean);
    procedure SetAutoBackup(const Value: Boolean);
    procedure SetNumCopy(const Value: Integer);
    procedure SetFullPath(const Value: Boolean);
    procedure SetArxivCopy(const Value: Boolean);
    procedure SetIdBase(const Value: String);
  public
    property FullPath : Boolean read FFullPath write SetFullPath;
    property Restore : Boolean read FRestore write SetRestore;
    property AutoBackup : Boolean read FAutoBackup write SetAutoBackup;
    property ArxivCopy : Boolean read FArxivCopy write SetArxivCopy;
    property NumCopy : Integer read FNumCopy write SetNumCopy;
    property IdBase : String read FIdBase write SetIdBase;

    function CopyData:Boolean;
    function SeekAnyFileDocArxiv(strPath:String):Boolean;

    function  CopyListFiles(lCheckArxiv:Boolean=false) : Boolean;
    function  GetPropAutoBackup(s:String; var strData:String; var strTime:String):Boolean;
    function  IsRunAutoBackup(var strFile:String):Boolean;
    procedure UpdateActions; override;
    function  OpenTablesDict( strNameDict : String ) : Boolean;
    function  ChoiceAutoBackup : Integer;

    function getNameFileArxiv:String;
    function RunZipBase(strBaseDir:String; strPath:String):Boolean;
    function RunUnZipBase(strBaseDir:String; strFile:String):Boolean;

    function  GetPropertyAutoBackup( n : Integer ) : String;
    procedure DropMessageMouse(var Msg: TMsg; var Handled: Boolean);

    function IsDocArxiv : Boolean;
    function CheckCopyDocArxiv : Boolean;
    function CopyParams(nType:Integer; lRestore : Boolean; var sSoob:String) : Boolean;
  end;

var
  fmCopyData  : TfmCopyData;
//  lAutoBackup : Boolean;   для выполнения автоматического резервного копирования

implementation

uses dBase;

{$R *.DFM}

const
  COPY_ALL=0;
  COPY_PARAMS=1;
  COPY_DOCARXIV=2;

//------------------------------------------------------------------------
procedure TfmCopyData.btOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;
//------------------------------------------------------------------------
procedure TfmCopyData.cbArxivClick(Sender: TObject);
begin
  ArxivCopy:=cbArxiv.Checked;
end;
//------------------------------------------------------------------------
function TfmCopyData.CopyListFiles(lCheckArxiv:Boolean) : Boolean;
var
  i : Integer;
  FileAttrs : Integer;
  sExt,s,strFileZip, strPathS, strName, strPath : String;
  lOk,lCreateArxiv,lExistArxiv:Boolean;
  sr :  TSearchRec;
begin
  Result := true;
//-------------
  FListSource.Clear;
  strPathS := FDirSource;
  if DirExists(FDirDesc)
    then ClearDir(FDirDesc,false);
  lCreateArxiv:=false;
  lOk:=true;
  if lCheckArxiv
    then lExistArxiv:=FileExists(strPathS+getNameFileArxiv)
    else lExistArxiv:=false;
  if FileExists(strPathS+NAME_DICT) or lExistArxiv then begin
    //---- будем делать резервное копирование с архивированием --------
    if not Restore and ArxivCopy then begin
      s:=ChangeMessage2('Архивирование ...');
      lCreateArxiv:=RunZipBase(FDirSource, FDirSource); //strPath); //FDirDesc);
      lOk:=lCreateArxiv;
      if not lCreateArxiv then begin
        if Problem('Ошибка:' +FError+'. Продолжить без архивации базы ?') then begin
          lOk:=true;
        end;
      end;
      ChangeMessage(s);
    end;
    if Restore and lExistArxiv then begin
      s:=ChangeMessage2('Извлечение из архива ...');
      lOk:=RunUnZipBase(FDirDesc, strPathS+getNameFileArxiv); //strPath); //FDirDesc);
      ChangeMessage(s);
      //----- !!! извлекли архив в нужную папку FDirDesc, выходим из функции !!! ---------------------
      if lOk then begin
        EXIT; // !!!
      end;
    end;

    //---- обычное копирование ----------------------------------------
    if lOK then begin
      if lCreateArxiv then begin
        FListSource.Add(NAME_DICT);
        FListSource.Add(ChangeFileExt(NAME_DICT,'.am'));
        FListSource.Add(ChangeFileExt(NAME_DICT,'.ai'));
        FListSource.Add(getNameFileArxiv);
      end else begin
        FileAttrs := SysUtils.faReadOnly+SysUtils.faArchive+SysUtils.faAnyFile;	//faDirectory;
        if FindFirst( strPathS+'*.*', FileAttrs, sr) = 0 then begin
          strName := sr.Name;
          while strName<>'' do begin
            if IsFileFromBase(strName) or (AutoBackup and (Pos('date_auto_backup', strName)>0)) then  //  uProjectAll.pas  (ANSIUpperCase(Right(strName,3))<>'BAK') and (ANSIUpperCase(Right(strName,3))<>'TMP') then begin
              FListSource.Add(strName);
            if FindNext(sr)=0  then strName:=sr.Name
                               else strName:='';
          end;
          FindClose(sr);
        end;
      end;
    end;
  end;
//-------------
  if FListSource.Count = 0 then begin
    PutError('Не найдены файлы для копирования по пути: '+#13+FDirSource);
    Result := false;
  end else begin
    if DirExists(FDirDesc) then begin
      {
        Вставить проверку на наличие файла архива базы:  Selsovet.zip или Base.zip  (анализ имени по NAME_DICT)
        и вместо копирования сделать извлечение из архива !!!
      }

//      strFileZip:=strPathS+ChangeFileExt(NAME_DICT,'.zip');
//      if FileExists(strFileZip) then begin

//      end else begin
        for i:=0 to FListSource.Count-1 do begin
          Application.ProcessMessages;
          if Pos('\',FListSource.Strings[i])=0
            then strName:=FDirSource+FListSource.Strings[i]
            else strName:=FListSource.Strings[i];   // уже сидит полное имя файла
          if FileExists(strName) then begin
            if not CopyFile(PChar(strName), PChar(FDirDesc+FListSource.Strings[i]), false) then begin
              PutError('Ошибка копирования файла : '+#13+
                      'откуда :'+strName+#13+
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
//        end;
        end;
        if lCreateArxiv then begin  // после копирования удалим ранее созданнй архив
          DeleteFile(FDirSource+getNameFileArxiv);
        end;
    end else begin
      PutError('Путь для копирования недоступен: '+#13+FDirDesc);
      Result := false;
    end;
  end;
end;
//------------------------------------------------------------------------
function TfmCopyData.OpenTablesDict( strNameDict : String ) : Boolean;
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
      PutError('Ошибка тестового открытия резервной копии.'+Chr(13)+Chr(10)+E.Message);
    end;
  end;
  if result then begin
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
          PutError('Ошибка тестового открытия резервной копии.'+Chr(13)+Chr(10)+'Таблица: "'+tb.TableName+'"'+Chr(13)+Chr(10)+E.Message);
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

//-----------------------------------------------------------------
function TfmCopyData.GetPropAutoBackup(s:String; var strData:String; var strTime:String):Boolean;
var
  n:Integer;
begin
  Result:=true;
  n:=Pos(Chr(13)+Chr(10),s);
  if n=0 then begin
    strData:=s;
    strTime:='';
  end else begin
    strData:=Copy(s,1,n-1);
    strTime:=Copy(s,n+2,100);
  end;
end;
//-----------------------------------------------------------------
// проверка необходимости резервного автокопирования
function TfmCopyData.IsRunAutoBackup(var strFile:String):Boolean;
var
  nTypeBackup:Integer;
  s,strTime,strData : String;
  dDateCopy, dNow, dTime : TDateTime;
begin
  Result:=false;
  strFile:='';
  dNow:=Date;
  if dmBase.IsMainComputer then begin
    nTypeBackup := GlobalTask.ParamAsInteger('AUTO_BACKUP');
    if GlobalTask.ParamAsInteger('AUTO_BACKUP') > 0 then begin
      Result:=true;
      strFile := CheckSleshN(edPath.Text)+'date_auto_backup';
      if FileExists(strFile) then begin
        s:='';
        strData:='';
        if MemoRead(strFile, s) then begin
          GetPropAutoBackup(s, strData, strTime);
          try
            dDateCopy := STOD(strData, tdAds);
            dTime := STOT(strTime);
          except
            dDateCopy := 0;
          end;
        end else begin
          dDateCopy := 0;
          dTime:=0;
        end;
      end else begin
        dDateCopy := 0;
        dTime := 0;
      end;
      if dDateCopy<>0 then begin
        if nTypeBackup=1 then begin   // каждый день
          if (FormatDateTime('MMYYYY',dDateCopy) <> FormatDateTime('MMYYYY',dNow )) or
             (dNow > dDateCopy)
            then Result:=true
            else Result:=false;
        end else if nTypeBackup=2 then begin  // каждую неделю
          if (FormatDateTime('MMYYYY',dDateCopy) <> FormatDateTime('MMYYYY',dNow )) or
             ((dNow-7) > dDateCopy)
            then Result:=true
            else Result:=false;
        end else if nTypeBackup=3 then begin  // каждый месяц
          if ( FormatDateTime('MMYYYY',dDateCopy) <> FormatDateTime('MMYYYY',dNow ) )
            then Result:=true
            else Result:=false;
        end;
      end;
    end;
  end;
end;
//-----------------------------------------------------------------
function TfmCopyData.CopyData:Boolean;
var
  s,ss,strErr, strFile, strData, strTime, strDesc, strSource : String;
  dNow, dFullNow : TDateTime;
//  dDateCopy, dNow, dFullNow, dTime : TDateTime;
  lOk,l : Boolean;
//  nTypeBackup : Integer;
begin
  dNow:=Date;
  dFullNow:=Now;
  lOk := true;
                        
  try      
//  EnabledAllForms( self, false);
//  DisableMainForm;
  if FAutoBackup and not Restore then begin  // проверка необходимости резервного автокопирования
    lOk:=IsRunAutoBackup(strFile);
  end;
  ss:='';
  if lOk and CheckCopy(strErr) then begin
//    Application.OnMessage := DropMessageMouse;
    //--- ВОСТАНОВЛЕНИЕ ----------------------------------------------------------------------
    if Restore then begin
      OpenMessage(' Предварительное копирование файлов ...','',10);
      GlobalTask.LogFile.WriteToLogFile('Начало восстановления из резервной копии:'+FDirSource);
      dmBase.CloseBase;
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
      lOk := CopyListFiles(true);  // true - проверить на наличие архива
      if lOk and FRunUpdateBeforeRestore then begin
   //     ChangeMessage(' Тестовое открытие ...');
        lOk := OpenTablesDict( FDirTmp+'\'+NAME_DICT );
      end;
      CloseMessage();
      //-----------------------------
      if lOk then begin
        if FRunUpdateBeforeRestore then begin // необходима реорганизация резервной копии
          dmBase.SimpleDisconnect;
          lOk := RunCheckBase( dmBase.GetPathConnect+NAME_DICT, FDirTmp+'\'+NAME_DICT, dmBase.AdsConnection, Self);
          dmBase.SimpleDisconnect;
          if lOk then begin
            // копирование из временной папки в папку базы
            FDirSource := FDirTmp+'\';
            FDirDesc   := strDesc;
            OpenMessage(PadRStr(' Копирование файлов ... ',40,' '),'',10);
            lOk := CopyListFiles;
          end;
        end else begin
          // тестовое открытие базы после копирования во временную папку
          OpenMessage(PadRStr(' Тестовое открытие ...',40,' '),'',10);
          FDirSource := FDirTmp+'\';
          FDirDesc   := strDesc;
          lOk := OpenTablesDict( FDirTmp+'\'+NAME_DICT );
          if lOk then begin
            // копирование из временной папки в папку базы
            ChangeMessage(' Копирование файлов ...   ');
            lOk := CopyListFiles;
            s := CheckSleshN(FDirDesc)+'date_auto_backup';
            if FileExists(s) then begin
              DeleteFile(s);
            end;
          end;
        end;
      end;
      FDirDesc   := strDesc;
      FDirSource := strSource;
      ClearDir(FDirTmp,true);
      s:='';
      l:=true;
      if lOk and IsDocArxiv then begin
        l:=CopyParams(COPY_DOCARXIV, Restore,s);
        if s<>'' then begin
          GlobalTask.LogFile.WriteToLogFile(s);
          if not l
            then ss:=s;
        end;
      end;
      if lOk and cbRestoreParams.Checked then begin
        l:=CopyParams(COPY_PARAMS, Restore, s);
        if s<>'' then begin
          GlobalTask.LogFile.WriteToLogFile(s);
          if not l
            then if ss='' then ss:=s else ss:=ss+chr(13)+s;
        end;
      end;
      if not l and (ss<>'') then strErr:=ss;
      lOk:=true;

      GlobalTask.LogFile.WriteToLogFile('Успешное завершение копирования из резервной копии.');
      CloseMessage();

      if dmBase.OpenBase
        then GlobalTask.LogFile.WriteToLogFile('Успешная установка базы после восстановления.')
        else GlobalTask.LogFile.WriteToLogFile('ОШИБКА при установке базы после восстановления.');

    //--- КОПИРОВАНИЕ ----------------------------------------------------------------------
    end else begin
      //---- автокопирование ------------------------------
      if FAutoBackup then begin
        {$IFDEF ZAH}
          if dmBase.AktZ.Active=true then begin
            dmBase.AktZ.First;
            if dmBase.AktZ.Eof
              then lOk:=false;
          end else begin
            lOk:=false;
          end;
        {$ELSE}
          {$IFDEF ADD_MENS_PU}
          // только для сельского совета
            if dmBase.tbMens.Active=true then begin
              dmBase.tbMens.First;
              dmBase.tbAdres.First;
              if dmBase.tbMens.Eof and dmBase.tbAdres.Eof then begin
                lOk:=false;  // считаем что база пуста и копирование делать не надо
              end;
            end else begin
              lOk:=false;  // база не открыта
            end;
          {$ENDIF}
        {$ENDIF}
        // если база не пуста
        if lOk then begin
          OpenMessage(PadRStr(' Подготовка базы ...  ',40,' '),'Резервное копирование',10);
          GlobalTask.LogFile.WriteToLogFile('Начало автоматического резервного копирования по пути:'+FDirDesc);
          dmBase.CloseBase;
          ChangeMessage(' Копирование файлов ... ');
          strSource := FDirSource;  // откуда копировать
          strDesc   := FDirDesc;    // куда копировать
          //------- если копия уже есть сохраним её в AutoBackup2 ------------
          if FileExists(FPathAutoBackup+'\'+NAME_DICT) then begin
            ClearDir(FPathAutoBackup2,true);
            ForceDirectories(FPathAutoBackup2);
            FDirSource := FPathAutoBackup+'\';
            FDirDesc   := FPathAutoBackup2+'\';
            Application.ProcessMessages;
            Sleep(100);
            lOk:=CopyListFiles;
          end;
          if lOk then begin
            FDirSource := strSource;
            FDirDesc   := strDesc;
            lOk := CopyListFiles;
            if lOk then begin
              MemoWrite(strFile, DTOS(dNow, tdAds)+Chr(13)+Chr(10)+FormatDateTime('hh:mm:ss',dFullNow));
            end;
          end;
          CloseMessage();
          dmBase.OpenBase;
        end;
     //---------- резервное копирование  --------------------------------------------------------
      end else begin
        OpenMessage(PadRStr(' Подготовка базы ...  ',40,' '),'Резервное копирование',10);
        if ANSIUpperCase(Right(FDirDesc,12))='КОПИЯДАННЫХ\'
          then s := Copy(FDirDesc,1,Length(FDirDesc)-12)
          else s := FDirDesc;
        GlobalTask.SetLastValueAsString('PATH_BACKUP', s);
        dmBase.CloseBase;
        GlobalTask.LogFile.WriteToLogFile('Начало резервного копирования по пути:'+FDirDesc);
        GlobalTask.SetLastValueAsDate('LAST_BACKUP_COPY', Date);
        ChangeMessage(' Копирование файлов ...       ');
        lOk := CopyListFiles;
        if lOk then CopyParams(COPY_ALL, Restore,s);
        dmBase.OpenBase;
      end;
    end;
    CloseMessage();
    if strErr<>''
      then PutError(strErr);
  end else begin
    lOk := false;
    if strErr<>''
      then PutError(strErr);
  end;

  finally
    Application.OnMessage := nil;
//    EnableMainForm;
//    EnabledAllForms( nil, true);
  end;

  if lOk then begin
    if not Restore then begin
      GlobalTask.LogFile.WriteToLogFile('Успешное завершение резервного копирования.');
    end;
    if not FAutoBackup then begin
      ShowMessage(' Копирование файлов успешно завершено.');
      Close;
    end;
  end;
  FAutoBackup := false;
  Result:=lOk;
end;

//------------------------------------------------------------------------
function TfmCopyData.IsDocArxiv : Boolean;
begin
  Result:=cbDocArxiv.Visible and cbDocArxiv.Checked and cbDocArxiv.Enabled;
end;
//------------------------------------------------------------------------
function TfmCopyData.CheckCopyDocArxiv : Boolean;
var
  i : Integer;
  strDir : String;
begin
  Result:=false;
  strDir     := '';
  if Right(ANSIUpperCase(FDirSource),13)='\КОПИЯДАННЫХ\' then begin
    i := Pos('\КОПИЯДАННЫХ\', ANSIUpperCase(FDirSource));
    strDir := Copy(FDirSource,1,i) + 'КопияСервис\';
    if FileExists(strDir+'DocArxiv.zip') then begin
      Result:=true;
    end;
  end else begin                       
    strDir:=Copy(FDirSource,1,Length(FDirSource)-1);
    i:=LastPos('\',strDir);
    if i>0 then begin
      strDir:=Copy(strDir,1,i)+'DocArxiv';
      if not SeekAnyFileDocArxiv(strDir)
        then Result:=false;
    end;
  end;
end;

//------------------------------------------------------------------------
function TfmCopyData.CopyParams(nType:Integer; lRestore:Boolean; var sSoob:String) : Boolean;
var
  arrFiles:TArrStrings;
  FileAttrs : Integer;
  i,j,n : Integer;
  strFile, strFileL, strDir, strDirWork, strDirExe, strDirDocArxiv,s : String;
  lArxiv,lErr:Boolean;
  function CopyOneFile(strFile1,strFile2 : String) : Boolean;
  begin
    Result:=true;
    if FileExists(strFile1) then begin
      if not CopyFile( PChar(strFile1), PChar(strFile2), false) then begin
          PutError('Ошибка копирования файла : '+#13+
                  'откуда :'+strFile1+#13+
                  'куда   :'+strFile2+#13+
                  IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
          Result := false;
      end else begin
        FileAttrs := FileGetAttr(strFile2);
        if FileAttrs and SysUtils.faReadOnly <> 0 then begin
          if FileSetAttr(strFile2, FileAttrs-SysUtils.faReadOnly)=-1 then begin
            PutError(' Ошибка снятия атрибута "только для чтения" с файла: '+#13#10+strFile2);
            Result := false;
          end;
        end;
      end;
    end;
  end;
begin
  Result := true;
  {$IFDEF SMDO}
    n:=3;
  {$ELSE}
    n:=2;
  {$ENDIF}
  SetLength(arrFiles,n);
  arrFiles[0]:='GISUN.INI';
  arrFiles[1]:='TaskParams.ini';
  {$IFDEF SMDO}
    arrFiles[2]:='SMDO.INI';
  {$ENDIF}
  if lRestore then begin
    strDir     := '';
    strDirWork := '';
    strDirExe  := '';
    if Right(ANSIUpperCase(FDirSource),13)='\КОПИЯДАННЫХ\' then begin
      i := Pos('\КОПИЯДАННЫХ\', ANSIUpperCase(FDirSource));
      strDir := Copy(FDirSource,1,i) + 'КопияСервис\';
      strDirWork := strDir;
      strDirExe  := strDir;
      lArxiv:=true;
    end else begin
      strDir:=Copy(FDirSource,1,Length(FDirSource)-1);
      i:=LastPos('\',strDir);
      if i>0 then begin
        strDirWork := Copy(strDir,1,i)+'Work\';
        strDirExe  := Copy(strDir,1,i);
        strDir     := Copy(strDir,1,i)+'Service\';
      end else begin
        strDir:='';
      end;
      lArxiv:=false;
    end;
    if strDir<>'' then begin
      //----Параметры -------------------------------------------
      if (nType=COPY_ALL) or (nType=COPY_PARAMS) then begin
        //------ список дополнительных файлов из папки Service ------
        for j:=Low(arrFiles) to High(arrFiles) do begin
          strFile:=strDir+arrFiles[j];
          if FileExists(strFile) then begin
            CopyOneFile( strFile, GlobalTask.PathService+arrFiles[j] );
          end;
        end;
        //------------------------------------------
        strFile := NameFromExe('shtamp.doc');
        CopyOneFile(strDirExe+'shtamp.doc', strFile);
        strFile := NameFromExe('shtamp-bel.doc');
        CopyOneFile(strDirExe+'shtamp-bel.doc', strFile);
        strFile := NameFromExe('shtamp_gerb.doc');
        CopyOneFile(strDirExe + 'shtamp_gerb.doc', strFile);

        strFile := GlobalTask.PathWorkDir+'Local.ini';
        CopyOneFile(strDirWork+'Local.ini', strFile);

        {$IFDEF ZAGS}
        strFile := NameFromExe('talon_dop.doc');
        CopyOneFile(strDirExe + 'talon_dop.doc', strFile);
        {$ENDIF}
        strFile  := strDir + GlobalTask.NameFileTaskParameters;
        strFileL := strDirWork + GlobalTask.NameFileLocalParameters;
        if FileExists(strFile) then begin
          if not GlobalTask.RestoreParameters(strFile,strFileL) then begin
            PutError(GlobalTask.LastError);
            Result := false;
          end;
        end else begin
          PutError('Не найден файл параметров.');
          Result := false;
        end;
        {$IFDEF SMDO}
           if Smdo<>nil then Smdo.SetParamsSMDO(Smdo.FPathINI);
        {$ENDIF}
      end;
      //-----Прикрепленные документы --------------------------------
      if (nType=COPY_ALL) or (nType=COPY_DOCARXIV) then begin
        if IsDocArxiv then begin
          if lArxiv then begin
            if FileExists(strDir+'DocArxiv.zip') then begin
              strDirDocArxiv:=FDirTmp+'\DocArxiv';
              ForceDirectories(strDirDocArxiv);
              Zip.FileName:=strDir+'DocArxiv.zip';
              Zip.BaseDir :=strDirDocArxiv;
              try
                Zip.OpenArchive;
                Zip.ExtractFiles('*.*');
              except
                Zip.CloseArchive;
                sSoob:='Ошибка чтения архива прикрепленных файлов';
                Result:=false;
              end;
            end else begin
              sSoob:='Не найден архив с прикрепленными файлами';
              Result:=false;
            end;
          end else begin
            strDirDocArxiv:=strDirExe+'DocArxiv';
          end;
          if Result then begin
            if DirectoryExists(strDirDocArxiv) and (GetFolderSize(strDirDocArxiv)>0) then begin
              s:=CheckSleshN(ExtractFilePath(Application.ExeName))+'DocArxiv';
              ClearDir(s,true);
              ForceDirectories(s);
              CopyDir(strDirDocArxiv, s);
            end else begin
              sSoob:='Папка с прикрепленными файлами пуста';
              Result:=false;
            end;
          end;
          if lArxiv
            then ClearDir(FDirTmp,true);
        end;
      end;

    end;
  end else begin
    i := Pos('КОПИЯДАННЫХ', ANSIUpperCase(FDirDesc));
    if i > 0 then begin
      strDir := Copy(FDirDesc,1,i-1) + 'КопияСервис\';
      ForceDirectories(strDir);
//      if cbDocArxiv.Checked then begin
//        ForceDirectories(strDir+'DocArxiv');
//        strDirDocArxiv := strDir+'DocArxiv\';
//      end;
      strFile := GlobalTask.PathService + GlobalTask.NameFileTaskParameters;
      CopyOneFile( strFile, strDir + GlobalTask.NameFileTaskParameters );
      strFile := GlobalTask.PathWorkDir + GlobalTask.NameFileLocalParameters;
      CopyOneFile( strFile, strDir + GlobalTask.NameFileLocalParameters );

      strFile := GlobalTask.PathWorkDir + 'Local.ini';
      CopyOneFile( strFile, strDir + 'Local.ini');

      strFile := NameFromExe('shtamp.doc');
      CopyOneFile( strFile, strDir + 'shtamp.doc');
      strFile := NameFromExe('shtamp-bel.doc');
      CopyOneFile( strFile, strDir + 'shtamp-bel.doc');
      strFile := NameFromExe('shtamp_gerb.doc');
      CopyOneFile( strFile, strDir + 'shtamp_gerb.doc');
      {$IFDEF ZAGS}
      strFile := NameFromExe('talon_dop.doc');
      CopyOneFile( strFile, strDir + 'talon_dop.doc');
      {$ENDIF}
      //------ список дополнительных файлов из папки Service ------
      for j:=Low(arrFiles) to High(arrFiles) do begin
        strFile:=GlobalTask.PathService+arrFiles[j];
        if FileExists(strFile) then begin
          CopyOneFile( strFile, strDir+arrFiles[j]);
        end;       
      end;
      s:=CheckSleshN(ExtractFilePath(Application.ExeName))+'DocArxiv';
      DeleteFile(strDir+'DocArxiv.zip');
      if IsDocArxiv and (GetFolderSize(s)>0) then begin
        ChangeMessage('Дополнительные файлы ...');
        Zip.CompressionLevel:=clNone;     // без сжатия
        Zip.FileName := strDir+'DocArxiv.zip';
        Zip.BaseDir  := s;
        Zip.ExclusionMasks.Clear;
        Zip.FileMasks.Clear;
        Zip.ExclusionMasks.Add('*.eml');
        Zip.ExclusionMasks.Add('*.xml');
        Zip.FileMasks.Add('*.*');
        Zip.OpenArchive(fmCreate);
//        Zip.AddFiles('*.*');
        Zip.AddFiles;
        Zip.CloseArchive;
        Zip.ExclusionMasks.Clear;
        Zip.FileMasks.Clear;
//        CopyOneFile( strFile, strDir+arrFiles[j]);
//        CopyDir(CheckSleshN(ExtractFilePath(Application.ExeName))+'DocArxiv' , strDirDocArxiv);
      end;
      //------------------------------------------
    end;
  end;
end;
//------------------------------------------------------------------------
function TfmCopyData.CheckCopy(var strErr : String): Boolean;
var
  strPathS : String;
  strPathD : String;
  FileAttrs : Integer;
  strName, strMask : String;
  sr :  TSearchRec;
begin
  FRunUpdateBeforeRestore := false;
  FDirTmp := CheckSleshN(ExtractFilePath(Application.ExeName))+'Tmp';
  strMask := CheckSleshN( dmBase.GetPathConnect )+'*.BAK';
  DeleteFiles(strMask);
  if Restore then begin
    Result := CheckCopyRestore(strErr);
  end else begin
    Result := false;
    FListSource.Clear;
    strPathS := CheckSleshN( dmBase.GetPathConnect );
    if FileExists(strPathS+NAME_DICT) then begin
      FileAttrs := SysUtils.faReadOnly+SysUtils.faArchive+SysUtils.faAnyFile;	//faDirectory;
      if FindFirst( strPathS+'*.*', FileAttrs, sr) = 0 then begin
        strName := sr.Name;
        while strName<>'' do begin
          if (ANSIUpperCase(Right(strName,3))<>'BAK') and (ANSIUpperCase(Right(strName,3))<>'TMP') then begin
            FListSource.Add(strName);
          end;
          if FindNext(sr) = 0  then strName:=sr.Name
                               else strName:='';
        end;
        FindClose(sr);
      end;
      try
        FDirSource := strPathS;

        strPathD := CheckSleshN( edPath.Text );

        if not FAutoBackup then begin
          strPathD := strPathD + 'КопияДанных\';
        end;

        ForceDirectories(strPathD);
        FDirDesc := strPathD;
        Result := true;
      except
        strErr := 'Ошибка проверки пути: '+strPathD;
      end;
    end else begin
      strErr := 'Не найдены файлы для копирования по пути: '+strPathS;
    end;
  end;
end;
//------------------------------------------------------------------------
function TfmCopyData.CheckCopyRestore(var strErr : String): Boolean;
var
  strPathS : String;
  strPathD : String;
  FileAttrs,n : Integer;
  strName : String;
  sr :  TSearchRec;
  lOk : Boolean;
  strVerCur, strVerOld, s : String;
begin
  Result := false;
  FListSource.Clear;
  strPathS := CheckSleshN( edPath.Text );
  strVerCur := dmBase.GetVersionBase(nil);
  lOk := true;
  if AutoBackup then begin
    n := ChoiceAutoBackup;
    if n = 0 then lOk := false;
    if n=1 then begin
      edPath.Text := FPathAutoBackup;
    end else begin
      edPath.Text := FPathAutoBackup2;
    end;
    strPathS := CheckSleshN( edPath.Text );
    if lOk then begin
      s := '';
      s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
      s := s + 'После выполнения восстановления текущая информация'#13;
      s := s + 'в базе будет уничтожена.'#13;
      s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
      s := s + 'введите слово ДА в поле ввода'#13;
      if not OkWarning(s) then begin
        lOk:=false;
      end;
    end;
  end else begin
    if not FullPath then begin
      strPathS := strPathS + 'КопияДанных\';
    end;
  end;
  if lOk then begin
    if FileExists(strPathS+NAME_DICT) then begin
      if lOk then begin
        ConnectSource.ConnectPath := strPathS+NAME_DICT;  // откуда будем восстанавливать базу
        ConnectSource.Password := SYSTEM_PASSWORD;
        ConnectSource.UserName := 'ADSSYS';
        try
          ConnectSource.Connect;
        except
          strErr := 'Ошибка подключения к резервной копии.';
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
          s := s + 'Версия базы резервной копии не соответствует'#13;
          s := s + 'версии текущей базы.'#13;
          s := s + 'Если Вы хотите реорганизовать резервную копию'#13;
          s := s + 'введите слово ДА в поле ввода.'#13;
          s := s + 'Иначе восстановление не будет произведено.'#13;
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
            if (ANSIUpperCase(Right(strName,3))<>'BAK') and (ANSIUpperCase(Right(strName,3))<>'TMP') then begin
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

        if not AutoBackup and IsDocArxiv then begin
          if not CheckCopyDocArxiv then begin
            Result:=false;
            strErr := 'Не найдены прикрепленные документы.';
          end;
        end;

      end;
    end else begin
      strErr := 'Не найдены файлы для копирования по пути: '+strPathS;
    end;
  end;
end;

//------------------------------------------------------------------------
procedure TfmCopyData.FormCreate(Sender: TObject);
var
  s:String;
begin
  FIdBase:='';
  FRunUpdateBeforeRestore := false;
  FListSource := TStringList.Create;

  s:=GlobalTask.ParamAsString('PATH_AUTOBACKUP');
  if s=''
    then s:=ExtractFilePath(Application.ExeName);

  FPathAutoBackup  := CheckSleshN(s)+'AutoBackup';
  FPathAutoBackup2 := FPathAutoBackup + '2';
  FNumCopy := 1;   // номер автокопии
  edPath.Text := GlobalTask.GetLastValueAsString('PATH_BACKUP');  //???
  if Right(edPath.Text,1)='\'  then begin
    edPath.Text := Copy(edPath.Text,1,Length(edPath.Text)-1);
  end;
end;

//------------------------------------------------------------------------
function TfmCopyData.SeekAnyFileDocArxiv(strPath:String):Boolean;
var
  s:String;
  sr:TSearchRec;
  lSeek:Boolean;
begin
//  FileAttrs := SysUtils.faReadOnly+SysUtils.faArchive+SysUtils.faAnyFile;	//faDirectory;
  lSeek:=false;
  if FindFirst( strPath+'\*.*', SysUtils.faAnyFile+faDirectory+SysUtils.faArchive+SysUtils.faReadOnly, sr) = 0 then begin
    s:=sr.Name;
    while s<>'' do begin                  
      if Copy(s,1,1)<>'.' then begin
        if (sr.Attr and faDirectory)<>0 then begin
          lSeek:=SeekAnyFileDocArxiv(strPath+'\'+s);
        end else begin
          if (UpperCase(ExtractFileExt(s))='.ZIP') or (UpperCase(ExtractFileExt(s))='.XML') or (Pos('\SMDO\',UpperCase(strPath))>0)
            then lSeek:=true;
        end;
      end;
      if FindNext(sr)=0  then s:=sr.Name
                         else s:='';
      if lSeek then break;
    end;
    FindClose(sr);
  end;
  Result:=lSeek;
end;

//------------------------------------------------------------------------
function TfmCopyData.ChoiceAutoBackup : Integer;
var
  sl : TStringList;
  s : String;
  n : Integer;
begin
  Result := 0;
  if AutoBackup and Restore then begin
    sl := TStringList.Create;
    s := GetPropertyAutoBackup(1);
    if s <> '' then sl.Add(s);
    s := GetPropertyAutoBackup(2);
    if s <> '' then sl.Add(s);
    if sl.Count>0 then begin
      n := ChoiceFromList(sl, 'Выберите копию');
      if n < 0 then begin
        Result := 0;
      end else if n=0 then begin
        Result := 1;
      end else begin
        Result := 2;
      end;
    end;
    sl.Free;
  end;
end;

//------------------------------------------------------------------------
function TfmCopyData.GetPropertyAutoBackup( n : Integer ) : String;
var
  strFile,s,strData,strTime : String;
begin
  Result := '';
  if n<2 then begin
    s := FPathAutoBackup;
  end else begin
    s := FPathAutoBackup2;
  end;
  strFile := CheckSleshN(s)+'date_auto_backup';
  if FileExists(strFile) then begin
    s := '';
    if MemoRead(strFile, s) then begin
      GetPropAutoBackup(s, strData, strTime);
      try
        Result := 'Резервная копия создана: ' + FormatDateTime('dd mmmm yyyy',STOD(strData, tdAds))+' '+strTime;
      except
        Result := 'Дата создания резервной копии неизвестна';
      end;
    end;
  end;
end;

//------------------------------------------------------------------------
procedure TfmCopyData.SetAutoBackup(const Value: Boolean);
begin
  FAutoBackup := Value;
  if Value then begin
    edPath.Text := FPathAutoBackup;
  end else begin
    edPath.Text := Trim(GlobalTask.GetLastValueAsString('PATH_BACKUP'));  //???
    if Right(edPath.Text,1)='\'  then begin
      edPath.Text := Copy(edPath.Text,1,Length(edPath.Text)-1);
    end;
  end;
end;

//------------------------------------------------------------------------
procedure TfmCopyData.FormDestroy(Sender: TObject);
begin
  FListSource.Free;
end;

//------------------------------------------------------------------------
procedure TfmCopyData.btCancelClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------
procedure TfmCopyData.edPathEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  strDir, s : String;
begin
  if FRestore then begin
    s := 'Выберите каталог c резервной копией';
  end else begin
    s := 'Выберите каталог для резервного копирования';
  end;
  if SelectDirectory(s, '', strDir) then begin
    edPath.Text := strDir;
    Handled := true;
  end;
end;

//------------------------------------------------------------------------
procedure TfmCopyData.SetRestore(const Value: Boolean);
begin
  FRestore := Value;
  cbRestoreParams.Checked := false;
  cbRestoreParams.Visible := FRestore;

  cbArxiv.Visible:=false;
//  cbArxiv.Visible:=not FRestore;
  cbArxiv.Top:=cbRestoreParams.Top;
  cbArxiv.Left:=cbRestoreParams.Left;

//  cbArxiv.Checked := not FRestore;

  if Value then begin
    Caption := 'Воccтановление базы из резервной копии';
    Label1.Caption := 'Путь к резервной копии';
  end else begin
    Caption := 'Резервное копирование';
    Label1.Caption := 'Путь для копирования';
  end;
  {$IFDEF LAIS}
    cbDocArxiv.Visible:=true;
    cbDocArxiv.Checked:=false;
  {$ENDIF}
  {$IFDEF POST}
    cbDocArxiv.Visible:=true;
    cbDocArxiv.Checked:=true;
  {$ENDIF}
  {$IFDEF OCHERED}
    cbDocArxiv.Visible:=true;
    cbDocArxiv.Checked:=false;
  {$ENDIF}
  if FAutoBackup then begin
    cbDocArxiv.Visible:=false;
  end;
  if cbDocArxiv.Visible and not FRestore then begin
    if not SeekAnyFileDocArxiv(CheckSleshN(ExtractFilePath(Application.ExeName))+'DocArxiv') then begin
      cbDocArxiv.Visible:=false;
    end;
  end;
  if not FAutoBackup and cbDocArxiv.Visible and not FRestore then begin
    cbDocArxiv.Checked:=true;
  end;
end;

//------------------------------------------------------------------------
procedure TfmCopyData.UpdateActions;
begin
  inherited;
  btOk.Enabled := (edPath.Text<>'') and
                  (UpperCase(Copy(edPath.Text,1,4))<>'DATA');
end;

//------------------------------------------------------------------------
procedure TfmCopyData.SetNumCopy(const Value: Integer);
begin
  FNumCopy := Value;
end;

//------------------------------------------------------------------------
procedure TfmCopyData.DropMessageMouse(var Msg: TMsg;  var Handled: Boolean);
begin
  Handled := (msg.wParam > 0) and (msg.wParam <255);
//  Handled := (msg.wParam = vk_lButton) or
//             (msg.wParam = vk_rButton) or
//             (msg.wParam = vk_mButton);
end;

//------------------------------------------------------------------------
procedure TfmCopyData.SetFullPath(const Value: Boolean);
begin
  FFullPath := Value;
  if FFullPath then begin
    Caption := 'Воccтановление базы из найденной копии';
    Label1.Caption := 'Путь к найденной копии';
  end;
end;

procedure TfmCopyData.cbRestoreParamsClick(Sender: TObject);
begin
{
  if FRestore then begin
    if cbRestoreParams.Checked then begin
      cbDocArxiv.Enabled:=true;
    end else begin
      cbDocArxiv.Checked:=false;
      cbDocArxiv.Enabled:=false;
    end;
  end;
}
end;
//------------------------------------------------------------
procedure TfmCopyData.SetIdBase(const Value: String);
begin
  FIdBase := Value;
end;
//------------------------------------------------------------
procedure TfmCopyData.SetArxivCopy(const Value: Boolean);
begin
  FArxivCopy := Value;
end;
//------------------------------------------------------------
function TfmCopyData.getNameFileArxiv:String;
begin
//  Result:=ChangeFileExt(NAME_DICT,'.zip');
  if FIdBase=''
    then Result:='data_'+GlobalTask.ParamAsString('ID')+'.zip'
    else Result:='data_'+FIdBase+'.zip';
end;
//------------------------------------------------------------
// архивирование папкки с базой
function TfmCopyData.RunZipBase(strBaseDir:String; strPath:String):Boolean;
begin
  FError:='';
  ForceDirectories(strPath);
  Result:=true;
  try
    Zip.FileName := CheckSleshN(strPath)+getNameFileArxiv;
    Zip.BaseDir  := strBaseDir;
    Zip.OpenArchive(fmCreate);
    Zip.BeginUpdate;
    Zip.AddFiles('*.adt');
    Application.ProcessMessages;
    Zip.AddFiles('*.adm');
    Application.ProcessMessages;
    Zip.AddFiles('*.adi');
    Application.ProcessMessages;
    Zip.AddFiles('*.add');
    Application.ProcessMessages;
    Zip.AddFiles('*.am');
    Zip.AddFiles('*.ai');
    Zip.EndUpdate;
    Zip.CloseArchive;
  except
    on E:Exception do begin
      FError:=E.Message;
      Result:=false;
    end;
  end;
end;
//------------------------------------------------------------
// разархивирование папкки с базой
function TfmCopyData.RunUnZipBase(strBaseDir:String; strFile:String):Boolean;
begin
  FError:='';
  Result:=true;
  try
    Zip.FileName := strFile;
    if FileExists(Zip.FileName) then begin
      ForceDirectories(strBaseDir);
      ClearDir(strBaseDir,false);
      Zip.BaseDir:=strBaseDir;
      Zip.OpenArchive(fmOpenRead);
      Zip.ExtractFiles('*.*');
      Zip.CloseArchive;
    end else begin
      Result:=false;
      FError:='Файл архива '+strFile+' не найден';
    end;
  except
    on E:Exception do begin
      Result:=false;
      FError:=E.Message;
    end;
  end;
end;
//----------------------------------------------------------------------------
procedure TfmCopyData.Button1Click(Sender: TObject);
begin
  OpenMessage('Архивирование ...', '', 10);
  RunZipBase(ExtractFilePath(dmBase.AdsConnection.ConnectPath), 'D:\111');
  CloseMessage;
end;

initialization
//  lAutoBackup := false;

end.
