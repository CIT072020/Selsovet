unit fChVigrOch;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, VAriants,
  StdCtrls, Buttons, Mask, DBCtrlsEh, OpisEdit, MetaTask, FuncPr, ShellApi, uProject, uTypes,
  adscnnct, adstable, {dBase, DataTask,} ZipForge, FileCtrl, uUtilFiles, Db, uOcheredToXML,
  adsdata, adsfunc, sasaIniFile, mVerInfo;
  // {reportTask, frxClass}

type
  TfmChVigrOch = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    Zip: TZipForge;
    Label3: TLabel;
    edDisk: TDBComboBoxEh;
    tbOchered: TAdsTable;
    cbPath: TDBCheckBoxEh;
    procedure edDiskEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure cbPathClick(Sender: TObject);
  private
  public
    FPath : String;
    FShow : Boolean;
    FDate : TDateTime;
    constructor Create( Owner : TComponent); override;
    procedure UpdateActions; override;
    procedure CleateListDisk;

    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

    procedure RefreshListDisk;
    function GetDiskFree(strDisk : String) : Int64;
    procedure CopyBaseFiles(lArxiv:Boolean; lOnlyHandle:Boolean);
  end;

  procedure RunVigrOch(lShow:Boolean);

implementation

uses fMain, dBase, uProjectAll;

var
  fmChVigrOch: TfmChVigrOch;
  lFirstVigr:Boolean;
  lRunVigr:Boolean;

{$R *.DFM}

{ TfmChVigrZags }

procedure RunVigrOch(lShow:Boolean);
begin
  if not lRunVigr then begin
    fmChVigrOch := TfmChVigrOch.Create(nil);
    fmChVigrOch.FShow:=lShow;
    fmChVigrOch.FDate:=Date;
    lRunVigr:=true;   
    try
      if lShow then begin
        if fmChVigrOch.ShowModal = mrOk then begin
          fmChVigrOch.CopyBaseFiles(GlobalTask.ParamAsBoolean('ARXIV_OCHERED'),false);
        end;
      end else begin
        fmChVigrOch.CopyBaseFiles(GlobalTask.ParamAsBoolean('ARXIV_OCHERED'),false);
      end;
    finally
      lRunVigr:=false;
      fmChVigrOch.Free;
    end;
  end;
end;

procedure TfmChVigrOch.CopyBaseFiles(lArxiv:Boolean; lOnlyHandle:Boolean);
var
  ID:String;
  s,ss,strFileName,strFullFileName,strPath,strPathCopy,strDisk:String;
  ex:TOchered2XML;
  lErr,lCopy,lFTP,lShow:Boolean;
  n,nFree,nCount:Integer;
  function getNameFile : String;
    begin Result := 'ochered'+ID+'.xml' end;
  function getNameFileArx : String;
    begin Result := 'ochered'+ID+'.zxml' end;
begin           
  lFTP:=false;
  ID := GlobalTask.ParamAsString('ID');
//  strVersionZAGS := dmBase.GetVersionZAGS(false);
  if edDisk.Enabled and (edDisk.ItemIndex>-1) then begin
    GlobalTask.SetLastValueAsString('DISK_VIGR_ZAGS', edDisk.Items[edDisk.ItemIndex]);
  end;
  strPath := ExtractFilePath(Application.ExeName)+'Export';
  ForceDirectories(strPath);
  ClearDir(strPath,false);
  //---------- мое подразделение -----------------
//  IDPodr := GlobalTask.ParamAsString('PODR');
//  if IDPodr='' then IDPodr:='0';
  //----------------------------------------------
  lErr:=false;
  ss:='';
  ex:=TOchered2XML.Create;
  ex.AsAttribute:=true;
  ex.VigrPrim:=true;
  ex.AddIskl:=true; //GlobalTask.ParamAsBoolean('ADD_ISKL');
  strFileName:=getNameFile;
  strFullFileName:=strPath+'\'+strFileName;
  ex.NameExportFile:=strFullFileName;
  GlobalTask.LogFile.WriteToLogFile('Начало выгрузки очередников.');

  if not ex.RunExport then begin
    lErr:=true;
    if FShow
      then PutError(ex.LastError)
      else GlobalTask.LogFile.WriteToLogFile(ex.LastError);
  end;
  nCount:=ex.CountMen;

  ex.Free;
  lCopy:=false;

  if not lErr and lArxiv then begin
    lShow:=false;
    n:=GetFileSize(strFullFileName);
    if n>100000 then begin
      OpenMessage(PadCStr('Архивирование ...',STD_LEN,' '),'',0);
      lShow:=true;
    end;
    try
      Zip.FileName := strPath+'\'+getNameFileArx;
      Zip.BaseDir  := strPath;
      Zip.OpenArchive(fmCreate);
      Zip.AddFiles('ochered*.xml');
      Zip.CloseArchive;
      DeleteFile(strFullFileName);
      strFileName:=getNameFileArx;
      strFullFileName:=strPath+'\'+strFileName;
    finally
      if lShow then
        CloseMessage;
    end;
  end;

  if not lErr then begin
    // копируем на носитель
    n := GetFileSize(strFullFileName);
    strPathCopy:='';
    strDisk:='';

    if edDisk.Enabled and (edDisk.ItemIndex>-1) then begin
      strDisk := edDisk.Items[edDisk.ItemIndex];
      strPathCopy:=strDisk+':\';
    end else begin
      if cbPath.Enabled and cbPath.Checked then begin
        strPathCopy:=Trim(GlobalTask.ParamAsString('PATH_VIGR_OCH'));
        if MySameText('ftp', strPathCopy)
          then lFTP:=true;
        if (strPathCopy<>'') and not lFTP then strPathCopy:=CheckSleshN(strPathCopy);
      end;
    end;

    lFirstVigr:=true;
    if strPathCopy<>'' then begin
      if lFTP then begin
        {  см. ниже
        if fmMain.SetPropertyFPT(SERVER_OCHERED, '') then begin
          fmMain.CheckVisibleProgress(true,'Передача:');
          if not fmMain.PutFileFTP(true,strFullFileName) then begin //strPath+'\'+GetNameFile) then begin
            lErr:=true;
          end;
          fmMain.CheckVisibleProgress(false,'');
        end else begin
          PutError('Ошибка чтения параметров FTP');
          lErr:=true;
        end;
        }
      end else begin
        OpenMessage(PadCStr('Копирование файла '+strFileName+' ...',40,' '),'',0);
        s:='';
        try
          if lFirstVigr and (strDisk<>'') then begin  // копируем на диск
            DeleteFiles(strPathCopy+'ochered*.xml');
            DeleteFiles(strPathCopy+'ochered*.zxml');
            lFirstVigr:=false;
          end else begin
            DeleteFile(strPathCopy+strFileName);
          end;
          if strDisk<>'' then begin
            nFree := GetDiskFree(strDisk);
            if nFree < (n+10000) then begin
              s:=' На диске '+QStr(strDisk)+' не хватает места для размещения файла  '+strFileName+' ('+IntToStr(n)+' байт).';
              lErr:=true;
            end;
          end;
          if not lErr then begin
            if CopyFile(PChar(strFullFileName), PChar(strPathCopy+strFileName), false) then begin
              lCopy := true;
            end else begin
              s:='Ошибка копирования файла : '+strFullFileName+#13+' в '+#13+strPathCopy+strFileName+
                       #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')';
              lErr:=true;
            end;
          end;
        finally
          CloseMessage;
        end;
        if lErr then begin
          if FShow
            then PutError(s)
            else GlobalTask.LogFile.WriteToLogFile(Stringreplace(s,#13,' ',[rfReplaceAll, rfIgnoreCase]));
        end;
      end;
    end;
  end;
//  if lReport
//    then report.ShowPreparedReport;

  if not lErr then begin
    GlobalTask.LogFile.WriteToLogFile('Окончание выгрузки очередников.');
    ss :='Выгрузка успешно завершена. Выгружено: '+IntToStr(nCount)+' человек.';
    GlobalTask.LogFile.WriteToLogFile(ss);
    if lCopy then begin
      DeleteFiles(strPath+'\*.*');
    end;
    if FShow
      then ShowMessage(ss);
  end else begin
    GlobalTask.LogFile.WriteToLogFile('Ошибка выгрузки очередников.');
  end;

  if lFTP then begin
    GlobalTask.LogFile.WriteToLogFile('Передача файла очередников по FTP.');
    if SetPropertyFPT(fmMain.IdFTP1, SERVER_OCHERED, '') then begin
      fmMain.CheckVisibleProgress(true,'Передача:');
      if not fmMain.PutFileFTP(FShow,strFullFileName) then begin //strPath+'\'+GetNameFile) then begin
        lErr:=true;
        GlobalTask.LogFile.WriteToLogFile('Ошибка передачи файла по FTP.');
      end;
      fmMain.CheckVisibleProgress(false,'');
    end else begin
      s:='Ошибка чтения параметров FTP.';
      GlobalTask.LogFile.WriteToLogFile(s);
      if FShow
        then PutError(s);
      lErr:=true;
    end;
    if lErr then begin
      s:='Ошибка передачи файла '+strFullFileName+' по FTP.';
      GlobalTask.LogFile.WriteToLogFile(s);
      if FShow then ShellExecute(Application.Handle, PChar('explore'), PChar(strPath), nil, nil, SW_SHOWNORMAL);
    end else begin
      s:='Файл '+strFileName+' передан по FTP.';
      GlobalTask.LogFile.WriteToLogFile(s);
      DeleteFiles(strPath+'\*.*');
    end;
  end else begin
    if lCopy
      then s:='Файл '+strPathCopy+strFileName
      else s:='Файл '+strFullFileName;
    if FShow then begin
      if lCopy then begin
        if (strDisk<>'') or (Pos(UPPERCASE(Copy(strPathCopy,1,1)),'ABCDEF')>0)
          then ShellExecute(Application.Handle, PChar('explore'), PChar(strPathCopy), nil, nil, SW_SHOWNORMAL);
      end else begin
        ShellExecute(Application.Handle, PChar('explore'), PChar(strPath), nil, nil, SW_SHOWNORMAL);
      end;
    end;
  end;
  if not lErr then begin
    {$IFDEF OCHERED}
    with dmBase.tbJurnOper do begin
      if not Locate('ID;DATEOPER', VarArrayOf([SHEDULE_VIGR_OCH, FDate]), []) then begin
        Append;
        FieldByName('ID').AsInteger:=SHEDULE_VIGR_OCH;
        FieldByName('DATEOPER').AsDateTime:=FDate;
      end else begin
        Edit;
      end;
      FieldByName('TIMEOPER').AsDateTime:=Time;
      FieldByName('RESULT_TYPE').AsInteger:=1;
      FieldByName('RESULT_OPIS').AsString:=ss+' '+s;
      Post;
    end;
    {$ENDIF}
  end;
end;
//-----------------------------------------------------------------------------
function TfmChVigrOch.GetDiskFree(strDisk : String) : TLargeInteger;
var
  FreeBytesAvailableToCaller: TLargeInteger;
  FreeSize: TLargeInteger;
  TotalSize: TLargeInteger;
begin
  GetDiskFreeSpaceEx(PChar(strDisk+':'),
    FreeBytesAvailableToCaller,
    Totalsize,
    @FreeSize);
  Result := FreeSize;
end;

constructor TfmChVigrOch.Create(Owner: TComponent);
begin
  inherited;
  CleateListDisk;
end;

//------------------------------------------------
procedure TfmChVigrOch.WMDEVICECHANGE(var Msg: TMessage);
begin
{Заголовок сообщения}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CleateListDisk;
end;

//------------------------------------------------
procedure TfmChVigrOch.RefreshListDisk;
var
  c : Char;
  d : DWORD;
  n,i : Integer;
begin
  d := GetLogicalDrives;
  edDisk.ItemIndex:=-1;
  edDisk.Items.Clear;
  edDisk.KeyItems.Clear;
  i:=1;
  for c:='A' to 'Z' do begin
    if (d and 1)<>0 then begin
      n := GetDriveType(PChar(c + ':/'));
      if n=DRIVE_REMOVABLE then begin
        edDisk.Items.Add(c);
        edDisk.KeyItems.Add(IntToStr(i));
      end;
    end;
    d := d shr 1;
    Inc(i,1);
  end;
end;
//------------------------------------------------
procedure TfmChVigrOch.CleateListDisk;
var
  s : String;
  n : Integer;
begin
  edDisk.Enabled := true;
  RefreshListDisk;
  s:=Trim(GlobalTask.ParamAsString('PATH_VIGR_OCH'));
  if s='' then begin
    cbPath.Checked:=false;
    cbPath.Enabled:=false;
    if edDisk.Items.Count > 0 then begin
      s := GlobalTask.GetLastValueAsString('DISK_VIGR_ZAGS');
      edDisk.ItemIndex := 0;
      n := edDisk.Items.IndexOf(s);
      if n > -1 then begin
        edDisk.ItemIndex := n;
      end;
    end else begin
      edDisk.ItemIndex := -1;
      edDisk.Enabled := false;
    end;
  end else begin
    cbPath.Checked:=true;
    cbPath.Enabled:=true;
    edDisk.ItemIndex := -1;
  end;
end;

//procedure TfmChVigrZags.CheckControl;
//begin
//end;

procedure TfmChVigrOch.UpdateActions;
begin
  inherited;
  btOk.Enabled := true;
end;

procedure TfmChVigrOch.edDiskEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edDisk.Text:='';
  edDisk.ItemIndex:=-1;
end;

procedure TfmChVigrOch.cbPathClick(Sender: TObject);
begin
  edDisk.Enabled:=not cbPath.Checked;
end;

initialization
//  lFirstVigr:=true;
  lRunVigr:=false;
finalization

end.
