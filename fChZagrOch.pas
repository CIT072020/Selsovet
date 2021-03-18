unit fChZagrOch;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, ShellApi,
  DBCtrlsEh, StdCtrls, Mask, Buttons, SasaIniFile, mVerInfo, ZipForge, Db, uProject, uProjectAll,
  adsdata, adsfunc, adstable, adscnnct, MetaTask, FileCtrl, uOcheredToXML,
  uUtilFiles, FuncPr;

type

  TfmChZagrOch = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    Label1: TLabel;
    cbChoice: TDBCheckBoxEh;
    edDisk: TDBComboBoxEh;
    edPath: TDBEditEh;
    Zip: TZipForge;
    cbQuery: TDBCheckBoxEh;
    cbQueryDelete: TDBCheckBoxEh;
    cbLoadIskl: TDBCheckBoxEh;
    cbDateAndCount: TDBCheckBoxEh;
    cbOnlyMy: TDBCheckBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure cbChoiceClick(Sender: TObject);
    procedure edPathEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    FDefPath : String;
  public
    imp:TOchered2XML;
    procedure CreateListDisk;
    procedure CopyBaseFiles;
    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

  end;

  procedure RunZagrOch;

implementation

uses dBase, StrUtils;

{$R *.DFM}


procedure RunZagrOch;
var
  f : TfmChZagrOch;
begin
  f := TfmChZagrOch.Create(nil);
  try
    if f.ShowModal = mrOk then begin
      f.CopyBaseFiles;
    end;
  finally
    f.Free;
  end;
end;

procedure TfmChZagrOch.CopyBaseFiles;
var
  lOk,lArxiv,lErr : Boolean;
  SearchRec: TSearchRec;
  s,strPath,sFile,sExtractFile,sTmpPath : String;
  slFiles:TStringList;
  i,nCount,n:Integer;
begin
  lOk := true;
  if cbChoice.Checked then begin
    if edPath.Text <> '' then begin
      strPath := CheckSleshN(edPath.Text);
      if strPath = ExtractFilePath(Application.ExeName)+'Export\' then begin
        PutError(' Файлы для загрузки не должны находиться по пути: '+#13+
                 ExtractFilePath(Application.ExeName)+'Export');
        lOk := false;
      end else begin
//        GlobalTask.SetLastValueAsString('PATH_VIGR_OCH',edPath.Text);
        FDefPath := edPath.Text;
      end;
    end else begin
      PutError(' Неизвестен путь для поиска файлов ! ');
      lOk := false;
    end;
  end else begin
    if edDisk.Text<>'' then begin
      strPath := edDisk.Text+':\';
    end else begin
      PutError(' Неизвестен путь для поиска файлов ! ');
      lOk := false;
    end;
  end;
  if lOk then begin
    OpenMessage('Контроль базы ...','',10);
    try
      dmBase.WorkQuery.SQL.Text:='SELECT COUNT(*) FROM СозданиеОбъекта';
      dmBase.WorkQuery.Open;
      n:=dmBase.WorkQuery.Fields[0].AsInteger;
      dmBase.WorkQuery.Close;
      if n>10000 then begin
        dmBase.WorkQuery.SQL.Text:='SELECT Max(NEWID) FROM СозданиеОбъекта';
        dmBase.WorkQuery.Open;
        n:=dmBase.WorkQuery.Fields[0].AsInteger;
        dmBase.WorkQuery.Close;
        dmBase.AdsConnection.Execute('DELETE FROM СозданиеОбъекта WHERE newid<'+IntToStr(n-1000));
      end;
    except
      on E:Exception do begin
        PutError('Ошибка проверти таблицы создания объектов:'+chr(13)+E.Message);
        lOk:=false;
      end;
    end;
    CloseMessage();
  end;
  if lOk then begin
    nCount:=0;
    slFiles:=TStringList.Create;
    lOk := FindFirst(strPath+'ochered*.xml', faAnyFile, SearchRec) = 0;
    if lOk then begin
      GlobalTask.SetLastValueAsString('LAST_PATH_ZAGR_OCH',FDefPath);
      repeat
        if (SearchRec.Name[1] <> '.') and (SearchRec.Attr and faVolumeID <> faVolumeID) and (SearchRec.Attr and faDirectory <> faDirectory) then begin
          slFiles.Add(strPath+SearchRec.Name);
        end;
      until FindNext(SearchRec) <> 0;
    end;
    FindClose(SearchRec);
    lOk := FindFirst(strPath+'ochered*.zxml', faAnyFile, SearchRec) = 0;
    if lOk then begin
      GlobalTask.SetLastValueAsString('LAST_PATH_ZAGR_OCH',FDefPath);
      repeat
        if (SearchRec.Name[1] <> '.') and (SearchRec.Attr and faVolumeID <> faVolumeID) and (SearchRec.Attr and faDirectory <> faDirectory) then begin
          slFiles.Add(strPath+SearchRec.Name);
        end;
      until FindNext(SearchRec) <> 0;
    end;
    FindClose(SearchRec);
    if slFiles.Count=0
      then lOk:=false
      else lOk:=true;
    sTmpPath:='';
    if lOk then begin
      GlobalTask.WriteToLogFile('Начало загрузки файлов очередников ('+inttostr(slFiles.count)+') .');
      imp:=TOchered2XML.Create;
      imp.Protokol.Clear;
      try
        for i:=0 to slFiles.Count-1 do begin
          imp.AddProtokol(InttoStr(i+1)+'. ----------------------------');
          sFile:=slFiles.Strings[i];
          lArxiv:=false;
          lErr:=false;
          if MySameText( RightStr(sFile,5), '.zxml') then begin  // архив
            imp.AddProtokol('Файл архива: '+sFile+', извлечение файла загрузки');
            s:=ExtractFileName(sFile);
            sTmpPath:=CreateTmpPath(0);
            lArxiv:=true;
            {
            if not CopyFile(PChar(sFile), PChar(sTmpPath+'\'+s), false) then begin
              imp.AddProtokol('Ошибка копирования файла : '+sFile+' -> '+sTmpPath+'\'+s);
              lErr:=true;
            end;
            }
            Zip.FileName:=sFile;
            Zip.BaseDir:=sTmpPath;
            sExtractFile:=ChangeFileExt(s,'.xml');
            try
              Zip.OpenArchive;
              Zip.ExtractFiles(sExtractFile);
            except
              lErr:=true;
              imp.AddProtokol('Ошибка распаковки файла загрузки: '+Zip.FileName);
              Zip.CloseArchive;
            end;
            if not lErr then begin
              if FileExists(sTmpPath+'\'+sExtractFile) then begin
                sFile:=sTmpPath+'\'+sExtractFile;
              end else begin
                imp.AddProtokol('Ошибка распаковки файла загрузки: '+Zip.FileName);
                lErr:=true;
              end;
            end;
          end;
          if not lErr then begin
            imp.NameExportFile:=sFile;
            imp.LoadMyOrg:=false;
            if cbOnlyMy.Checked then begin
              if Problem('Вы хотите загрузить только своих очередников ?')
                then imp.LoadMyOrg:=true;
            end;
            n:=imp.RunImport(cbQuery.Checked, cbQueryDelete.Checked, cbLoadIskl.Checked, cbDateAndCount.Checked);
            nCount:=nCount+n;
          end;
          if lArxiv then begin
            ClearDir(sTmpPath,false);
          end;
        end;
      finally
        if sTmpPath<>''
          then ClearDir(sTmpPath,true);
        imp.AddProtokol('------------------------------');
        imp.AddProtokol('Всего загружено: '+intToStr(nCount));
        sFile:=NameFromExe('Протокол_загрузки.txt');
        imp.Protokol.SaveToFile(sFile);
        GlobalTask.WriteToLogFile('Окончание загрузки файлов очередников.');
        ShellExecute(Application.Handle, 'Open', PChar(sFile), nil, nil, SW_SHOWNORMAL);
//      ShowStrings(imp.Protokol,'Протокол загрузки');
        imp.Free;
      end;
    end else begin
      PutError(' Не найдено ни одного файла для загрузки !  ');
    end;
    slFiles.Free;
  end;
  {
    lOk := FindFirst(strPath+'ochered*.xml', faAnyFile, SearchRec) = 0;
    if lOk then begin
      imp:=TOchered2XML.Create;
      imp.Protokol.Clear;
      GlobalTask.SetLastValueAsString('LAST_PATH_ZAGR_OCH',FDefPath);
      repeat
        if (SearchRec.Name[1] <> '.') and
          (SearchRec.Attr and faVolumeID <> faVolumeID) and
          (SearchRec.Attr and faDirectory <> faDirectory) then begin

          imp.NameExportFile:=strPath+SearchRec.Name;

          imp.RunImport(cbQuery.Checked, cbQueryDelete.Checked, cbLoadIskl.Checked, cbDateAndCount.Checked);

//          CopyOneBaseFiles(strPath+SearchRec.Name);
        end;
      until FindNext(SearchRec) <> 0;
      ShowStrings(imp.Protokol,'Протокол загрузки');
      imp.Free;
    end else begin
      PutError(' Не найдено ни одного файла для загрузки !  ');
    end;
    FindClose(SearchRec);
  end;
  }


end;

procedure TfmChZagrOch.WMDEVICECHANGE(var Msg: TMessage);
begin
{Заголовок сообщения}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CreateListDisk;
end;

//----------------------------------------------
procedure TfmChZagrOch.CreateListDisk;
  var
  c : Char;
  d : DWORD;
  s : String;
  n,i : Integer;
begin
  edDisk.Enabled:=true;
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
  if edDisk.Items.Count > 0 then begin
//    s := GlobalTask.GetLastValueAsString('DISK_ZAGR_ZAGS');
    edDisk.ItemIndex := 0;
    n := edDisk.Items.IndexOf(s);
    if n > -1 then begin
      edDisk.ItemIndex := n;
    end;
  end else begin
    edDisk.Enabled := false;
  end;
  if not edDisk.Enabled then begin
    edPath.Enabled := true;
    if edPath.Text = '' then begin
      edPath.Text := FDefPath;
    end;
    cbChoice.Checked:=true;
  end;
end;

procedure TfmChZagrOch.FormCreate(Sender: TObject);
var
  s:String;
begin
  cbOnlyMy.Checked:=false;
  cbOnlyMy.Visible:=GlobalTask.ParamAsBoolean('LOAD_MY_ORG');

  FDefPath:=Trim(GlobalTask.GetLastValueAsString('LAST_PATH_ZAGR_OCH'));
  s:=Trim(Globaltask.ParamAsString('PATH_LOAD_OCH'));
  CreateListDisk;
  if s<>'' then begin
    FDefPath:=s;
    edPath.Text:=s;
    edPath.Enabled:=true;
    cbChoice.Checked:=true;
  end;
end;

procedure TfmChZagrOch.cbChoiceClick(Sender: TObject);
begin
  if cbChoice.Checked then begin
    edPath.Enabled := true;
    if edPath.Text = '' then begin
      edPath.Text := FDefPath;
    end;
  end else begin
    edPath.Enabled := false;
  end;
end;


procedure TfmChZagrOch.edPathEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  strDir : String;
begin
  Handled := true;
  if SelectDirectory('Выберите папку', '', strDir) then begin
    edPath.Text := strDir;
  end;
end;

procedure TfmChZagrOch.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(Zip);
end;

end.
