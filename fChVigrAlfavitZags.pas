unit fChVigrAlfavitZags;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, Variants, DateUtils,
  StdCtrls, Buttons, Mask, DBCtrlsEh, OpisEdit, MetaTask, FuncPr, ShellApi, uproject, uTypes,
  adscnnct, adstable, dBase, DataTask, ZipForge, FileCtrl, uUtilFiles, Db,
  adsdata, adsfunc, sasaIniFile, mVerInfo, u2zags, uCreateXML, reportTask, fEditMemo,
  frxClass, ExtCtrls;

type
  TfmChVigrAlfavitZags = class(TForm)
    AdsConnection: TAdsConnection;
    Zip: TZipForge;
    tbDesc: TAdsTable;
    tbDescSprNames: TAdsTable;
    Report: TfrxReport;
    Panel1: TPanel;
    Panel2: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    lbPer: TLabel;
    lbGod: TLabel;
    Label3: TLabel;
    lbGod1: TLabel;
    edNomerPeriod: TDBComboBoxEh;
    edGod2: TDBComboBoxEh;
    edDisk: TDBComboBoxEh;
    edGod1: TDBComboBoxEh;
    cbPath: TDBCheckBoxEh;
    gbZAGS: TGroupBox;
    edZAGS: TDBEditEh;
    btHelp: TButton;
    cbAll: TDBCheckBoxEh;
    cbTypeVigr: TComboBox;
    procedure rbMonthClick(Sender: TObject);
    procedure rbKvClick(Sender: TObject);
    procedure rbYearClick(Sender: TObject);
    procedure edDiskEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure cbPathClick(Sender: TObject);
    procedure edZAGSEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btHelpClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure cbAllClick(Sender: TObject);
  private
//    arrComp:array [0..3] of TWinControl;
    FTypeVigr: Integer;
    procedure GetStrDate( var strDate1, strDate2 : String);
    procedure GetStrYear( var strYear1, strYear2 : String);
//    procedure GetDate( var d1, d2 : TDateTime);
    procedure SetTypeVigr(const Value: Integer);
  public
    FPath : String;
    FZAGS : Integer;
    IDPodr:String;
    nIDPodr:Integer;
    FMyID:Integer;
    property TypeVigr:Integer read FTypeVigr write SetTypeVigr;

    constructor Create( Owner : TComponent); override;
    procedure UpdateActions; override;
    procedure CleateListDisk;

    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

    procedure RefreshListDisk;
    function GetDiskFree(strDisk : String) : Int64;
    procedure CopyBaseFiles;
    procedure SetZags(nID:Integer);
  end;

  procedure RunVigrAlfavitZags(nType:Integer; slPar:TStringList=nil);

implementation

uses fMain, uProjectAll, NewDialogs;

var
  fmChVigrAlfavitZags: TfmChVigrAlfavitZags;
  lFirstVigr:Boolean;

{$R *.DFM}

{ TfmChVigrAlfavitZags }

procedure RunVigrAlfavitZags(nType:Integer; slPar:TStringList);
begin
  fmChVigrAlfavitZags := TfmChVigrAlfavitZags.Create(nil);
  fmChVigrAlfavitZags.SetZAGS(GlobalTask.ParamAsInteger('ID'));
  fmChVigrAlfavitZags.FMyID:=fmChVigrAlfavitZags.FZAGS;
  fmChVigrAlfavitZags.cbAll.Checked:=true;
  fmChVigrAlfavitZags.edZAGS.Enabled:=false;;
//  n:=fmChVigrAlfavitZags.Height-fmChVigrAlfavitZags.gbZAGS.Height;
//  if dmBase.OblArxivZAGS then begin
//    fmChVigrAlfavitZags.Height:=GetHeight(n+50);
//  end else begin
//    if fmChVigrAlfavitZags.nIDPodr=0
//      then fmChVigrAlfavitZags.Caption := 'Выгрузить в архив ЗАГС';
//    fmChVigrAlfavitZags.gbZAGS.Visible:=false;
//    fmChVigrAlfavitZags.Height:=GetHeight(n);
//  end;
  fmChVigrAlfavitZags.TypeVigr:=nType;
//  if nType=1 then begin // для учета захоронений
//    fmChVigrAlfavitZags.Zip.Password:=PSW_ZAGS2ZAH;
//  end;
  try
    if fmChVigrAlfavitZags.ShowModal = mrOk then begin
//      if nType=2
//        then fmChVigrAlfavitZags.VigrGrnFiles  // файл сверки по регистрации
//        else fmChVigrAlfavitZags.CopyBaseFiles(false,false);
      fmChVigrAlfavitZags.CopyBaseFiles();
    end;
  finally
    fmChVigrAlfavitZags.Free;
  end;
end;

procedure TfmChVigrAlfavitZags.SetTypeVigr(const Value: Integer);
begin
  FTypeVigr:=Value;
  if FTypeVigr=0 then begin   // выгрузить все записи актов
    {$IFDEF ZAGS}
      if not dmBase.OblArxivZAGS  then begin
//        for i:=Low(arrComp) to High(arrComp) do arrComp[i].Visible:=true;
//        cbDateIzm.Checked:=GlobalTask.GetLastValueAsBoolean('VIGR_ZAGS_DATEIZM');
//        edMinYear.Enabled:=cbDateIzm.Checked;
//        lbMinYear.Enabled:=cbDateIzm.Checked;
//        edMinYear.Value:=GlobalTask.GetLastValueAsInteger('VIGR_ZAGS_MINYEAR');
//        if edMinYear.Value<1900
//          then edMinYear.Value:=null;
      end;
    {$ENDIF}
  end else if FTypeVigr=1 then begin
//    rbYear.Checked:=true;
//    rbYearClick(nil);
  end else if FTypeVigr=2 then begin    // файл сверки по регистрации

  end;
end;

procedure TfmChVigrAlfavitZags.FormCreate(Sender: TObject);
begin
  IDPodr:=Trim(GlobalTask.ParamAsString('PODR'));
  if IDPodr='' then IDPodr:='0';
  try
    nIDPodr:=StrToInt(IDPodr);
  except
    nIDPodr:=0;
    PutError('Ошибка определения номера подразделения.');
  end;
  {
  arrComp[0]:=edMinYear;
  arrComp[1]:=lbMinYear;
  arrComp[2]:=cbDateIzm;
  arrComp[3]:=btHelp;
  for i:=Low(arrComp) to High(arrComp) do arrComp[i].Visible:=false;
  if not cbOnlySmert.Visible
    then for i:=Low(arrComp) to High(arrComp) do arrComp[i].Top:=arrComp[i].Top-18; }
end;

procedure TfmChVigrAlfavitZags.CopyBaseFiles;
var
  strYear1, strYear2,ss,strVersionZAGS,strDate1,strDate2, strDisk, strPathCopy : String;
  sl : TStringList;
  nCountVigr,nID,i,j,nnn : Integer;
  n,m : Int64;
  sErr,strPath,s,IDZags,sTable,sAdd : String;
  lCopy : Boolean;
  nFree : TLargeInteger;
  Ini : TSasaIniFile;
  VerInfo: TVerInfo;
  arrCountDok : array of Integer;
  fld : TField;
  strFieldName : String;
  slOpis, slType : TStringList;
  tbSource : TAdsTable;
  lCloseMessage,lErr,lFTP:Boolean;
//  Par:TXMLParams;

  function GetNameFile : String;
  begin
    Result := GlobalTask.ParamAsString('ID')+'_';
    if Copy(strDate1,1,4)=Copy(strDate2,1,4)
      then Result := Result + Copy(strDate1,1,4)+'G'
      else Result := Result + Copy(strDate1,1,4)+'_'+Copy(strDate2,1,4)+'G';
    if IDPodr='0' then Result := Result + '.alf'
                  else Result := Result + '_'+IDPodr+'.alf'
  end;
  procedure AppendToDescSpr;
  var
    jj:Integer;
  begin
    tbDescSprNames.Append;
    for jj:=0 to tbDescSprNames.FieldCount-1 do begin
      strFieldName := tbDescSprNames.Fields[jj].FieldName;
      fld := dmBase.SprNames.FindField(strFieldName);
      if (fld<>nil) and not fld.IsNull then begin
        tbDescSprNames.Fields[jj].Value:=fld.Value;
      end;
    end;
    tbDescSprNames.Post;
  end;
begin
  lCopy := false;
  slOpis := TStringList.Create;
  slType := TStringList.Create;
  slOpis.AddObject('Алфавитная книга', dmBase.AlfavitZAGS);
  slType.Add( IntToStr(_TypeObj_Alfavit) );
  SetLength(arrCountDok, 1);
  strVersionZAGS := dmBase.GetVersionZAGS(false);
  for i:=0 to Length(arrCountDok)-1 do arrCountDok[i]:=0;
  nCountVigr:=0;

  strDate1:='';
  strDate2:='';
  if edDisk.Enabled and (edDisk.ItemIndex>-1) then begin
    GlobalTask.SetLastValueAsString('DISK_VIGR_ZAGS', edDisk.Items[fmChVigrAlfavitZags.edDisk.ItemIndex]);
  end;
  GetStrDate(strDate1, strDate2);
  GetStrYear(strYear1, strYear2);
  sl := TStringList.Create;

  strPath := ExtractFilePath(Application.ExeName)+'Export';

  ForceDirectories(strPath);
  ClearDir(strPath,false);
  lFTP:=false;
  AdsConnection.ConnectPath := strPath;
  AdsConnection.IsConnected := true;
  lCloseMessage:=false;
  OpenMessage('Поиск информации ..............................','Выгрузка');
  lErr:=false;
  try

    ChangeMessage('Подготовка ...  ');
    for i:=0 to slOpis.Count-1 do begin
      if slType.Strings[i]=IntToStr(_TypeObj_Alfavit) then begin
        sTable:='AlfavitZAGS';
      end else begin
        sTable:=TAdsTable(slOpis.Objects[i]).TableName;
      end;
      dmBase.ScriptForCreateTable( sTable, sl);
      AdsConnection.Execute( sl.Text );
    end;
    dmBase.ScriptForCreateTable( 'SprNames', sl);
    AdsConnection.Execute( sl.Text );

    sl.Free;
    tbDescSprNames.Open;
    tbDesc.TableType:=dmBase.tbZapisRogd.TableType;
    tbDesc.AdsTableOptions.AdsCharType:=dmBase.tbZapisRogd.AdsTableOptions.AdsCharType;
    sErr:='';
    // запишем таблицу SprNames (органы ЗАГС которые присутствуют в алфавитке)
    dmBase.SprNames.First;
    if not cbAll.Checked and (FZAGS>0) then begin
      if dmBase.SprNames.Locate('ID', FZAGS, []) then begin
        AppendToDescSpr;
      end else begin
        lErr:=true;
      end;
    end else begin
      while not dmBase.SprNames.Eof do begin
        dmBase.WorkQuery.SQL.Text:='SELECT TOP 1 id_zags FROM AlfavitZags WHERE id_zags='+dmBase.SprNames.FieldByName('ID').AsString;
        dmBase.WorkQuery.Open;
        if dmBase.WorkQuery.Fields[0].AsInteger>0 then begin
          if dmBase.SprNames.FieldByName('HANDLED').AsBoolean=true then begin // нельзя выгружать если орган ЗАГС введен вручную
            lErr:=true;
            sErr:=sErr+dmBase.SprNames.FieldByName('ID').AsString+' '+dmBase.SprNames.FieldByName('KNAME').AsString+CRLF;
          end else begin
            AppendToDescSpr;
          end;
        end;
        dmBase.SprNames.Next;
      end;
    end;
    dmBase.SprNames.First;
    tbDescSprNames.Close;
    if sErr<>''
      then sErr:='Выгрузка невозможна.'+CRLF+'Присутствуют органы ЗАГС введенные вручную:'+CRLF+sErr;

    if not lErr then begin
      sAdd:='';
      for i:=0 to slOpis.Count-1 do begin
        ChangeMessage(slOpis.Strings[i]+'   ');
        nnn:=0;
        tbSource := TAdsTable(slOpis.Objects[i]);
        tbDesc.TableName := tbSource.TableName;
        tbDesc.Open;
        tbSource.Filtered:=false;
        {
        if strDate2='' then begin  // за год
          tbSource.Filter:=sAdd+'Yearz('+sField+')='+strDate1;
        end else begin
          tbSource.Filter:=sAdd+sField+'>='+'STOD('+QStr(strDate1)+') and '+
                                sField+'<='+'STOD('+QStr(strDate2)+')';
        end;
        }
        if strYear1=strYear2 then begin  // за год
          tbSource.Filter:=sAdd+'yearz='+strYear1;
        end else begin
          tbSource.Filter:=sAdd+'yearz>='+strYear1+' and yearz<='+strYear2;
        end;
        if not cbAll.Checked and (FZAGS>0)
          then tbSource.Filter:=tbSource.Filter+' and id_zags='+IntToStr(FZAGS);
        if cbTypeVigr.ItemIndex=1
          then tbSource.Filter:=tbSource.Filter+' and handled=true';
//        WriteToDebug([tbSource.Tablename+':  '+tbSource.Filter]);
        tbSource.Filtered:=true;
        while not tbSource.Eof do begin
          tbDesc.Append;
          arrCountDok[i]:=arrCountDok[i]+1;
          nnn:=nnn+1;
          for j:=0 to tbDesc.FieldCount-1 do begin
            strFieldName := tbDesc.Fields[j].FieldName;
            fld := tbSource.FindField(strFieldName);
            if (fld<>nil) and not fld.IsNull then begin
              tbDesc.Fields[j].Value:=fld.Value;
            end;
          end;
          nID:=tbSource.FieldByName('ID_ZAGS').AsInteger;
          if nID=0 then nID:=FMyID;
          tbDesc.FieldByName('HANDLED').AsBoolean:=true;
          tbDesc.FieldByName('AKT_ID').AsInteger:=0;
          tbDesc.FieldByName('ID_ZAGS').AsInteger:=nID;
          tbDesc.FieldByName('ID_SOURCE').AsInteger:=FMyID;
          tbDesc.Post;
          if nnn=100 then begin
            nnn:=0;
            ChangeMessage(slOpis.Strings[i]+'  ' +IntToStr(arrCountDok[i]));
          end;
          tbSource.Next;
        end;
        ChangeMessage(slOpis.Strings[i]+'  ' +IntToStr(arrCountDok[i]));
        tbDesc.Close;
        tbSource.Filter:='';
        tbSource.Filtered:=false;
      end;
    end;

    AdsConnection.IsConnected:=false;
    for i:=0 to slOpis.Count-1 do
      nCountVigr:=nCountVigr+arrCountDok[i];

    if not lErr then begin
      if nCountVigr = 0 then begin
        CloseMessage;
        lCloseMessage:=true;
        ShowMessage('  Не выгружено ни одной записи!  ');
      end else begin
        Ini := TSasaIniFile.Create(strPath+'\'+'file_alf.ini');
        if dmBase.OblArxivZAGS
          then Ini.WriteString('MAIN','ARXIV','1')                          // выгрузка из обл. архива
          else Ini.WriteString('MAIN','ARXIV','0');
        Ini.WriteInteger('MAIN','ZAGS',FMyID);      // загс откуда выгружено
        if not cbAll.Checked and (FZAGS>0)
          then Ini.WriteString('MAIN','ZAGS_SOURCE',IntToStr(FZAGS))        // данные какого загс выгружены
          else Ini.WriteString('MAIN','ZAGS_SOURCE','0');
        Ini.WriteString('MAIN','ZAGS_NAME',GlobalTask.ParamAsString('NAME'));   // название загс откуда выгружено
        Ini.WriteString('MAIN','DATE',DTOS(Now,tdClipper));
        Ini.WriteString('MAIN','TIME',FormatDateTime('hh:nn',Now));
        Ini.WriteString('MAIN','DATE1',strDate1);
        Ini.WriteString('MAIN','DATE2',strDate2);
        VerInfo:=TVerInfo.Create(Application.ExeName);
        Ini.WriteString('MAIN','VERSION',VerInfo.ProductVersion);
        Ini.WriteString('MAIN','BASE',dmBase.GetVersionBase(nil));
        Ini.WriteString('MAIN','VERSIONPROP','1');
        Ini.WriteString('MAIN','PODR',IDPodr);

        VerInfo.Free;
        for i:=0 to slOpis.Count-1 do begin
          Ini.WriteString('COUNT',TAdsTable(slOpis.Objects[i]).TableName,IntToStr(arrCountDok[i]));
        end;
        Ini.UpdateFile;
        Ini.Free;
        Report.Clear;

        ChangeMessage('Архивирование ...');
        Zip.FileName := strPath+'\'+GetNameFile;
        Zip.BaseDir  := strPath;
        Zip.OpenArchive(fmCreate);
        Zip.AddFiles('*.*');
        Zip.CloseArchive;
        // копируем на носитель
        n := GetFileSize(Zip.FileName);
        m:=0;
        lErr:=false;
        strPathCopy:='';
        strDisk:='';
        if edDisk.Enabled and (edDisk.ItemIndex>-1) then begin
          strDisk := edDisk.Items[edDisk.ItemIndex];
          strPathCopy:=strDisk+':\';
        end else begin
          if cbPath.Checked then begin
            strPathCopy:=Trim(GlobalTask.ParamAsString('PATH_VIGR_ZAGS'));
            if MySameText('ftp', strPathCopy)
              then lFTP:=true;
            if (strPathCopy<>'') and not lFTP then strPathCopy:=CheckSleshN(strPathCopy);
          end else begin
            strPathCopy:='';
          end;
        end;

        if strPathCopy<>'' then begin
          if not lFTP then begin
            if lFirstVigr and (strDisk<>'') then begin  // копируем на диск
              DeleteFiles(strPathCopy+'*.alf');
              lFirstVigr:=false;
            end else begin
              DeleteFile(strPathCopy+GetNameFile);
            end;
            ChangeMessage('Копирование на носитель ...');
            if strDisk<>'' then begin
              nFree := GetDiskFree(strDisk);
              if nFree < (n+m) then begin
                PutError(' На диске '+QStr(strDisk)+' не хватает места для размещения файла  !');
                lErr:=true;
              end;
            end;
            if not lErr then begin
              if CopyFile(PChar(strPath+'\'+GetNameFile),
                          PChar(strPathCopy+GetNameFile), false) then begin
                lCopy := true;
              end else begin
                PutError('Ошибка копирования файла : '+strPath+'\'+GetNameFile+
                        #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
                lErr:=true;
              end;
            end;
          end;
        end;
        s:='';
  //      if lReport
  //       then report.ShowPreparedReport;
        if not lErr then begin
          s :=' Выгрузка успешно завершена.   Выгружено: '+#13+#13;
          for i:=0 to slOpis.Count-1 do begin
            s := s + slOpis.Strings[i] + '    -    ' + IntToStr(arrCountDok[i]) + '  '+#13  ;
          end;
        end;
        if lCopy then begin
          DeleteFiles(strPath+'\*.*');
        end else begin
          DeleteFiles(strPath+'\*.ini');
          DeleteFiles(strPath+'\*.adt');
          DeleteFiles(strPath+'\*.adm');
          DeleteFiles(strPath+'\*.adi');
          CloseMessage;
          lCloseMessage:=true;
        end;
      end;
    end;
  finally
    if not lCloseMessage
      then CloseMessage();
  end;
  slOpis.Free;
  if not lErr and (nCountVigr>0) then begin
    ShowMessage(s);
    if lFTP then begin
      if SetPropertyFPT(fmMain.IdFTP1, SERVER_ZAGS, '') then begin
        fmMain.CheckVisibleProgress(true,'Передача:');
        if not fmMain.PutFileFTP(true,strPath+'\'+GetNameFile) then begin
          lErr:=true;
        end;
        fmMain.CheckVisibleProgress(false,'');
      end else begin
        sErr:='Ошибка чтения параметров FTP';
        lErr:=true;
      end;
      if lErr then begin
        ShellExecute(Application.Handle, PChar('explore'), PChar(strPath), nil, nil, SW_SHOWNORMAL);
      end else begin
        DeleteFiles(strPath+'\*.*');
      end;
    end else begin
      if lCopy then begin
        if (strDisk<>'') or (Pos(UPPERCASE(Copy(strPathCopy,1,1)),'ABCDEF')>0)
          then ShellExecute(Application.Handle, PChar('explore'), PChar(strPathCopy), nil, nil, SW_SHOWNORMAL);
      end else begin
        ShellExecute(Application.Handle, PChar('explore'), PChar(strPath), nil, nil, SW_SHOWNORMAL);
      end;
    end;
  end;
  if lErr and (sErr<>'')
    then PutError(sErr);
end;

function TfmChVigrAlfavitZags.GetDiskFree(strDisk : String) : TLargeInteger;
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

constructor TfmChVigrAlfavitZags.Create(Owner: TComponent);
begin
  inherited;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_YEARS',edGod1.Items, edGod1.KeyItems);
  edGod1.DropDownBox.Rows:=12;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_YEARS',edGod2.Items, edGod2.KeyItems);
  edGod2.DropDownBox.Rows:=12;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_MONTH',edNomerPeriod.Items, edNomerPeriod.KeyItems);
  CleateListDisk;
  FMyID:=GlobalTask.ParamAsInteger('ID');
end;

//------------------------------------------------
procedure TfmChVigrAlfavitZags.WMDEVICECHANGE(var Msg: TMessage);
begin
{Заголовок сообщения}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CleateListDisk;
end;

//------------------------------------------------
procedure TfmChVigrAlfavitZags.RefreshListDisk;
var
  c : Char;
  d : DWORD;
//  s : String;
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
procedure TfmChVigrAlfavitZags.CleateListDisk;
var
//  c : Char;
  s : String;
  n : Integer;
begin
  edDisk.Enabled := true;
  RefreshListDisk;
  s:=Trim(GlobalTask.ParamAsString('PATH_VIGR_ZAGS'));
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
    if MySameText('ftp',s)
      then cbPath.Caption:=' Выгрузить на FTP'
      else cbPath.Caption:=' Выгрузить по пути: '+s;
    edDisk.ItemIndex := -1;
  end;
end;

procedure TfmChVigrAlfavitZags.GetStrDate( var strDate1, strDate2 : String);
var
  s : String;
begin
  strDate1 := '';
  strDate2 := '';
//  s := edGod1.KeyItems[edGod.ItemIndex];
//  if rbMonth.Checked then begin
//    strDate1 := s + PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0') +
//                '01';
//    strDay := IntToStr(CountDays( s, edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex]));
//    strDate2 := s + PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0')
//                + strDay;
//  end else if rbKv.Checked then begin
//    n1 := (StrToInt(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex])-1)*3+1;
//    n2 := n1 + 2;
//    strDate1 := s + PadLInt(n1,2,'0') + '01';
//    strDay := IntToStr(CountDays( s, n2));
//    strDate2 := s + PadLInt(n2,2,'0') + strDay;
//  end else if rbYear.Checked then begin
    s := edGod1.KeyItems[edGod1.ItemIndex];   // начальный год
    strDate1 := s+'0101';
    s := edGod2.KeyItems[edGod2.ItemIndex];  // конечный год
    strDate2 := s+'1231';
//    strDate1 := edGod1.KeyItems[edGod1.ItemIndex];
//    strDate2 := edGod.KeyItems[edGod.ItemIndex];
//  end;
end;
procedure TfmChVigrAlfavitZags.GetStrYear( var strYear1, strYear2 : String);
begin
  strYear1:=edGod1.KeyItems[edGod1.ItemIndex];  // начальный год
  strYear2:=edGod2.KeyItems[edGod2.ItemIndex]; // конечный год
end;

{
procedure TfmChVigrAlfavitZags.GetDate( var d1, d2 : TDateTime);
var
  s,s1,s2 : String;
begin
  s := edGod1.KeyItems[edGod1.ItemIndex];   // начальный год
  s1 := s+'0101';
  s := edGod2.KeyItems[edGod2.ItemIndex];   // конечный год
  s2 := s+'1231';
  d1 := STOD(s1,tdClipper);
  d2 := STOD(s2,tdClipper);
end;
}
//procedure TfmChVigrAlfavitZags.CheckControl;
//begin
//end;

procedure TfmChVigrAlfavitZags.rbMonthClick(Sender: TObject);
begin
  edNomerPeriod.ItemIndex := -1;
//  edNomerPeriod.Enabled := true;
  edNomerPeriod.Visible := true;
  lbPer.Visible:=true;
  lbGod1.Visible:=false;
  edGod1.Visible:=false;
  lbGod.Caption:='Год';
  edNomerPeriod.DropDownBox.Rows:=12;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_MONTH',edNomerPeriod.Items, edNomerPeriod.KeyItems);
end;

procedure TfmChVigrAlfavitZags.rbKvClick(Sender: TObject);
begin
  edNomerPeriod.ItemIndex := -1;
//  edNomerPeriod.Enabled := true;
  edNomerPeriod.Visible := true;
  lbPer.Visible:=true;
  lbGod1.Visible:=false;
  edGod1.Visible:=false;
  lbGod.Caption:='Год';
  edNomerPeriod.DropDownBox.Rows:=4;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_KVART',edNomerPeriod.Items, edNomerPeriod.KeyItems);
end;

procedure TfmChVigrAlfavitZags.rbYearClick(Sender: TObject);
begin
  edNomerPeriod.ItemIndex := -1;
//  edNomerPeriod.Enabled := false;
  edNomerPeriod.Visible := false;
  lbPer.Visible:=false;
  lbGod1.Visible:=true;
  edGod1.Visible:=true;
  edGod1.Top:=edNomerPeriod.Top;
  lbGod1.Top:=lbPer.Top;
  lbGod.Caption:='Конечный год';
end;

procedure TfmChVigrAlfavitZags.UpdateActions;
begin
  inherited;
  if (edGod1.ItemIndex>-1) and (edGod2.ItemIndex>-1) and
     (StrToIntDef(edGod2.KeyItems[edGod2.ItemIndex],0)>=StrToIntDef(edGod1.KeyItems[edGod1.ItemIndex],0)) then begin
    btOk.Enabled := true;
  end else begin
    btOk.Enabled := false;
  end;
end;
//------------------------------
procedure TfmChVigrAlfavitZags.edDiskEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edDisk.Text:='';
  edDisk.ItemIndex:=-1;
end;
//------------------------------
procedure TfmChVigrAlfavitZags.cbPathClick(Sender: TObject);
begin
  edDisk.Enabled:=not cbPath.Checked;
end;
//------------------------------
procedure TfmChVigrAlfavitZags.edZAGSEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  nID:Integer;
begin
  if fmMain.ChoiceZAGS('', nID) then begin
    FZAGS:=nID;
    if dmBase.SprNames.Locate('ID', nID, []) then begin
      edZAGS.Text:=Trim(dmBase.SprNames.FieldByName('KNAME').AsString);
      if edZAGS.Text=''
        then edZAGS.Text:=dmBase.SprNames.FieldByName('NAME').AsString;
    end else begin
      edZAGS.Text:='';
      FZAGS:=0;
    end;
  end;
end;
//------------------------------
procedure TfmChVigrAlfavitZags.SetZags(nID:Integer);
begin
  FZAGS:=nID;
  if dmBase.SprNames.Locate('ID', nID, []) then begin
    edZAGS.Text:=Trim(dmBase.SprNames.FieldByName('KNAME').AsString);
    if edZAGS.Text=''
      then edZAGS.Text:=dmBase.SprNames.FieldByName('NAME').AsString;
  end else begin
    edZAGS.Text:='';
    FZAGS:=0;
  end;
end;
//------------------------------
procedure TfmChVigrAlfavitZags.btHelpClick(Sender: TObject);
//var
//  s:String;
begin
  ShowHelp('VIGR_ALFAVIT', nil, -1);
//  s:='<READONLY>'+getResource('VIGR_ALFAVIT', -1);
//  EditMemo(s, '', nil, 800);
end;

procedure TfmChVigrAlfavitZags.btOkClick(Sender: TObject);
var
  lOk:Boolean;
  n:Integer;
begin
  lOk:=true;
  if not cbAll.Checked and (FZAGS>0) then begin
    if dmBase.SprNames.Locate('ID', FZAGS, []) then begin
      if dmBase.SprNames.FieldByName('HANDLED').AsBoolean=true then begin // нельзя выгружать если орган ЗАГС введен вручную
        lOk:=false;
        PutError('"'+edZAGS.Text+'" введен вручную');
      end;
    end else begin
      lOk:=false;
      PutError('"'+edZAGS.Text+'" не найден в справочнике');
    end;
  end;
  if lOk and (cbTypeVigr.ItemIndex=0) then begin
    n:=Question('В выгружаемом файле все записи будут отмечены как введенные вручную.',
               '  Продолжить  ;  Отказ  ','Вопрос',1,2,qtConfirmation);
    if n<>1
      then lOk:=false;
  end;
  if lOk
    then ModalResult:=mrOk;
end;

procedure TfmChVigrAlfavitZags.cbAllClick(Sender: TObject);
begin
  edZAGS.Enabled:=not cbAll.Checked;
end;

initialization
  lFirstVigr:=true;
finalization

end.
