unit fChVigrZags;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, Variants, DateUtils,
  StdCtrls, Buttons, Mask, DBCtrlsEh, OpisEdit, MetaTask, FuncPr, ShellApi, uproject, uTypes,
  adscnnct, adstable, dBase, DataTask, ZipForge, FileCtrl, uUtilFiles, Db,
  adsdata, adsfunc, sasaIniFile, mVerInfo, u2zags, uCreateXML, reportTask, feditMemo,
  frxClass, ExtCtrls;

type
  TfmChVigrZags = class(TForm)
    GroupBox1: TGroupBox;
    rbMonth: TRadioButton;
    rbKv: TRadioButton;
    rbYear: TRadioButton;
    AdsConnection: TAdsConnection;
    Zip: TZipForge;
    tbDesc: TAdsTable;
    tbDescBaseProp: TAdsTable;
    tbDescBaseTextProp: TAdsTable;
    tbDescHistZAGS: TAdsTable;
    tbDescSvidPovtor: TAdsTable;
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
    edGod: TDBComboBoxEh;
    edDisk: TDBComboBoxEh;
    edGod1: TDBComboBoxEh;
    cbPath: TDBCheckBoxEh;
    gbZAGS: TGroupBox;
    edZAGS: TDBEditEh;
    cbOnlySmert: TDBCheckBoxEh;
    cbAll: TDBCheckBoxEh;
    cbDateIzm: TDBCheckBoxEh;
    btHelp: TButton;
    edMinYear: TDBNumberEditEh;
    lbMinYear: TStaticText;
    procedure rbMonthClick(Sender: TObject);
    procedure rbKvClick(Sender: TObject);
    procedure rbYearClick(Sender: TObject);
    procedure edDiskEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure cbPathClick(Sender: TObject);
    procedure edZAGSEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btHelpClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure cbDateIzmClick(Sender: TObject);
  private
    arrComp:array [0..3] of TWinControl;
    FTypeVigr: Integer;
    FDateIzm:Boolean;
    procedure GetStrDate( var strDate1, strDate2 : String);
    procedure GetDate( var d1, d2 : TDateTime);
    procedure SetTypeVigr(const Value: Integer);
  public
    FPath : String;
    FZAGS : Integer;
    IDPodr:String;
    nIDPodr:Integer;
    property TypeVigr:Integer read FTypeVigr write SetTypeVigr;

    constructor Create( Owner : TComponent); override;
    procedure UpdateActions; override;
    procedure CleateListDisk;

    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

    procedure RefreshListDisk;
    function GetDiskFree(strDisk : String) : Int64;
    procedure CopyBaseFiles(lAlfavit:Boolean; lOnlyHandle:Boolean);
    procedure VigrGrnFiles;
    function WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
  end;

  procedure RunVigrZags(nType:Integer; slPar:TStringList=nil);

implementation

uses fMain, uProjectAll;

var
  fmChVigrZags: TfmChVigrZags;
  lFirstVigr:Boolean;

{$R *.DFM}

{ TfmChVigrZags }

procedure RunVigrZags(nType:Integer; slPar:TStringList);
var
  n:Integer;
begin
  fmChVigrZags := TfmChVigrZags.Create(nil);
  fmChVigrZags.FZAGS:=0;
  n:=fmChVigrZags.Height-fmChVigrZags.gbZAGS.Height;
  {$IFDEF ZAGS}
    if dmBase.OblArxivZAGS then begin
      fmChVigrZags.Height:=GetHeight(n+50);
    end else begin
      if fmChVigrZags.nIDPodr=0
        then fmChVigrZags.Caption := 'Выгрузить в архив ЗАГС';
      fmChVigrZags.gbZAGS.Visible:=false;
      fmChVigrZags.Height:=GetHeight(n);
    end;
  {$ELSE}
    fmChVigrZags.gbZAGS.Visible:=false;
    fmChVigrZags.Height:=GetHeight(n);
  {$ENDIF}
  fmChVigrZags.TypeVigr:=nType;
  if nType=1 then begin // для учета захоронений
    fmChVigrZags.Zip.Password:=PSW_ZAGS2ZAH;
  end;
  try
    if fmChVigrZags.ShowModal = mrOk then begin
      if nType=2
        then fmChVigrZags.VigrGrnFiles  // файл сверки по регистрации
        else fmChVigrZags.CopyBaseFiles(false,false);
    end;
  finally
    fmChVigrZags.Free;
  end;
end;

procedure TfmChVigrZags.SetTypeVigr(const Value: Integer);
var
  i:Integer;
begin
  FTypeVigr:=Value;
  if FTypeVigr=0 then begin   // выгрузить все записи актов
    {$IFDEF ZAGS}
      if not dmBase.OblArxivZAGS  then begin
        for i:=Low(arrComp) to High(arrComp) do arrComp[i].Visible:=true;
        cbDateIzm.Checked:=GlobalTask.GetLastValueAsBoolean('VIGR_ZAGS_DATEIZM');
        edMinYear.Enabled:=cbDateIzm.Checked;
        lbMinYear.Enabled:=cbDateIzm.Checked;
        edMinYear.Value:=GlobalTask.GetLastValueAsInteger('VIGR_ZAGS_MINYEAR');
        if edMinYear.Value<1900
          then edMinYear.Value:=null;
      end;
    {$ENDIF}
  end else if FTypeVigr=1 then begin
    Caption:='Выгрузить з/а о смерти';
    cbOnlySmert.Checked:=true;
    cbOnlySmert.Visible:=false;
    cbPath.Checked:=false;
    cbPath.Visible:=false;
    cbAll.Top:=cbPath.Top;
    cbAll.Left:=cbPath.Left;
    {$IFDEF LAIS}
      cbAll.Checked:=true;
      cbAll.Visible:=false;
      cbDateIzm.Checked:=false;
      btHelp.Visible:=false;
    {$ELSE}
      cbAll.Visible:=true;
    {$ENDIF}
    rbYear.Checked:=true;
    rbYearClick(nil);
  end else if FTypeVigr=2 then begin    // файл сверки по регистрации
    Caption :='Выгрузка для сверки';
  end;
end;

procedure TfmChVigrZags.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  IDPodr:=Trim(GlobalTask.ParamAsString('PODR'));
  if IDPodr='' then IDPodr:='0';
  try
    nIDPodr:=StrToInt(IDPodr);
  except
    nIDPodr:=0;
    PutError('Ошибка определения номера подразделения.');
  end;
  cbOnlySmert.Visible:=nIDPodr>0;

  arrComp[0]:=edMinYear;
  arrComp[1]:=lbMinYear;
  arrComp[2]:=cbDateIzm;
  arrComp[3]:=btHelp;
  for i:=Low(arrComp) to High(arrComp) do arrComp[i].Visible:=false;
  if not cbOnlySmert.Visible
    then for i:=Low(arrComp) to High(arrComp) do arrComp[i].Top:=arrComp[i].Top-18;
end;

//====begin файл сверки ================================
procedure TfmChVigrZags.VigrGrnFiles;
var
  {$IFDEF ZAGS}
   ss :String;
  {$ENDIF}
  strVersionZAGS,strDate1,strDate2, strDisk, strPathCopy : String;
  dDate1,dDate2:TDateTime;
  sl : TStringList;
  i,j,nnn : Integer;
  n,m : Int64;
  strPath,s,IDZags,sTable : String;
  lCopy,lReport : Boolean;
  nFree : TLargeInteger;
  Ini : TSasaIniFile;
  VerInfo: TVerInfo;
  arrCountDok : array of Integer;
  fld : TField;
  strFieldName : String;
  slOpis, slType : TStringList;
  tbSource : TAdsTable;
  lCloseMessage,lErr,lFTP:Boolean;
  Par:TXMLParams;

  function GetNameFile : String;
  begin
    Result := GlobalTask.ParamAsString('ID')+'_';
    if rbMonth.Checked then begin
      Result := Result + Copy(strDate1,1,6)+'M';
    end else if rbKv.Checked then begin
      Result := Result + Copy(strDate1,1,4)+
                PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0')+'K';
    end else if rbYear.Checked then begin
      if Copy(strDate1,1,4)=Copy(strDate2,1,4)
        then Result := Result + Copy(strDate1,1,4)+'G'
        else Result := Result + Copy(strDate1,1,4)+'_'+Copy(strDate2,1,4)+'G';
    end;
    Result := Result + '.svr';
  end;
begin
  {$IFDEF ZAGS}
    if FZAGS=0
      then IDZags:=GlobalTask.ParamAsString('ID')
      else IDZags:=IntToStr(FZAGS);    // если выгружаем из обл. архива конкретный ЗАГС
  {$ELSE}
    IDZags := GlobalTask.ParamAsString('ID');
  {$ENDIF}
  lCopy := false;
  slOpis := TStringList.Create;
  slType := TStringList.Create;

  slOpis.AddObject('Акты рождений', dmBase.tbZapisRogd);
  slOpis.AddObject('Акты смертей', dmBase.tbZapisSmert);
  slOpis.AddObject('Акты заключения браков', dmBase.tbZapisBrak);
  slOpis.AddObject('Акты установления отцовства', dmBase.tbZapisUstOtc);
  slType.Add( IntToStr(dmBase.TypeObj_ZRogd) );
  slType.Add( IntToStr(dmBase.TypeObj_ZSmert) );
  slType.Add( IntToStr(dmBase.TypeObj_ZBrak) );
  slType.Add( IntToStr(dmBase.TypeObj_ZUstOtc) );
  SetLength(arrCountDok, 4);
  {$IFDEF ZAGS}
    slOpis.AddObject('Акты разводов', dmBase.tbZapisRast);
    slOpis.AddObject('Акты усыновления', dmBase.tbZapisAdopt);
    slOpis.AddObject('Акты перемены имени', dmBase.tbZapisChName);
    slOpis.AddObject('Акты установления материнства', dmBase.tbZapisUstMat);
    slType.Add( IntToStr(dmBase.TypeObj_ZRast) );
    slType.Add( IntToStr(dmBase.TypeObj_ZAdopt) );
    slType.Add( IntToStr(dmBase.TypeObj_ZChName) );
    slType.Add( IntToStr(dmBase.TypeObj_ZUstMat) );
    SetLength(arrCountDok, 8);
  {$ENDIF}

  for i:=0 to Length(arrCountDok)-1 do begin
    arrCountDok[i]:= 0;
  end;
  strDate1:='';
  strDate2:='';
  if edDisk.Enabled and (edDisk.ItemIndex>-1) then begin
    GlobalTask.SetLastValueAsString('DISK_VIGR_ZAGS', edDisk.Items[fmChVigrZags.edDisk.ItemIndex]);
  end;
  GetStrDate(strDate1, strDate2);
  sl := TStringList.Create;

  strPath := ExtractFilePath(Application.ExeName)+'Export';

  ForceDirectories(strPath);
  ClearDir(strPath,false);
  lFTP:=false;

  AdsConnection.ConnectPath := strPath;
  AdsConnection.IsConnected := true;
  lCloseMessage:=false;
  OpenMessage('Поиск информации ..............................','Выгрузка');
  ChangeMessage('Подготовка ...  ');
  Application.ProcessMessages;
  lErr:=false;
  try
    sl.Text:='CREATE TABLE file_svr ( TYPEOBJ Integer, NOMER Integer, DATEZ Date, ID_ZAGS Integer, ID_SOURCE Integer, POLE_GRN Integer); ';
    AdsConnection.Execute( sl.Text );

    {
    for i:=0 to slOpis.Count-1 do begin
      sTable:=TAdsTable(slOpis.Objects[i]).TableName;
      dmBase.ScriptForCreateTable( sTable, sl);
      AdsConnection.Execute( sl.Text );
    end;}
    sl.Free;

    tbDesc.TableType := dmBase.tbZapisUstOtc.TableType;
    tbDesc.AdsTableOptions.AdsCharType := dmBase.tbZapisUstOtc.AdsTableOptions.AdsCharType;
    tbDesc.TableName := 'file_svr.adt';
    tbDesc.Open;

    for i:=0 to slOpis.Count-1 do begin
      ChangeMessage(slOpis.Strings[i]+'   ');
      nnn:=0;
      tbSource := TAdsTable(slOpis.Objects[i]);
      tbSource.Filtered:=false;
      if strDate2='' then begin  // за год
        tbSource.Filter:='Year(DATEZ)='+strDate1;
      end else begin
        tbSource.Filter:='DATEZ>='+'STOD('+QStr(strDate1)+') and '+
                         'DATEZ<='+'STOD('+QStr(strDate2)+')';
      end;
      tbSource.Filter:=tbSource.Filter+' and not Empty(pole_grn) and pole_grn>=3000';

      {$IFDEF ZAGS}
//      if FZAGS>0 then begin
//        tbSource.Filter:=tbSource.Filter+' and id_source='+IntToStr(FZAGS);
//      end;
      {$ENDIF}
      tbSource.Filtered:=true;
//      ShowMessage(tbSource.Filter+'  '+IntToStr(tbSource.RecordCount));
      while not tbSource.Eof do begin
        arrCountDok[i] := arrCountDok[i] + 1;
        nnn:=nnn+1;
        tbDesc.Append;
        tbDesc.FieldByName('NOMER').AsInteger:=tbSource.FieldByName('NOMER').AsInteger;
        tbDesc.FieldByName('DATEZ').AsDateTime:=tbSource.FieldByName('DATEZ').AsDateTime;
        tbDesc.FieldByName('POLE_GRN').AsInteger:=tbSource.FieldByName('POLE_GRN').AsInteger;
        tbDesc.FieldByName('TYPEOBJ').AsString:=slType.Strings[i];
        tbDesc.FieldByName('ID_SOURCE').AsString:=IDZags;
        tbDesc.FieldByName('ID_ZAGS').AsString := IDZags;
//        tbDesc.FieldByName('PODR').AsString:=IDPodr;
        tbDesc.Post;
        if nnn=100 then begin
          nnn:=0;
          ChangeMessage(slOpis.Strings[i]+'  ' +IntToStr(arrCountDok[i]));
        end;
        tbSource.Next;
      end;
      ChangeMessage(slOpis.Strings[i]+'  ' +IntToStr(arrCountDok[i]));
      tbSource.Filter:='';
      tbSource.Filtered:=false;
    end;
    tbDesc.Close;
    AdsConnection.IsConnected:=false;
    j := 0;
    for i:=0 to slOpis.Count-1 do begin
      j := j + arrCountDok[i];
    end;
    if j = 0 then begin
      ShowMessage('  Не найдено ни одного документа для копирования !  ');
    end;
    if j > 0 then begin
      Ini := TSasaIniFile.Create(strPath+'\'+'file_svr.ini');
      Ini.WriteString('MAIN','ZAGS',GlobalTask.ParamAsString('ID'));      // загс откуда выгружено
      Ini.WriteString('MAIN','ZAGS_NAME',GlobalTask.ParamAsString('NAME'));   // название загс откуда выгружено
      Ini.WriteString('MAIN','DATE',DTOS(dmBase.getCurDate,tdClipper));
      Ini.WriteString('MAIN','TIME',FormatDateTime('hh:nn',Now));
      Ini.WriteString('MAIN','DATE1',strDate1);
      Ini.WriteString('MAIN','DATE2',strDate2);
      Ini.UpdateFile;
      Ini.Free;

      ChangeMessage('Архивирование ...');
      Zip.FileName := strPath+'\'+GetNameFile;
      Zip.BaseDir  := strPath;
      Zip.OpenArchive(fmCreate);
      Zip.AddFiles('*.*');
      Zip.CloseArchive;
      // копируем на носитель
      n := GetFileSize(Zip.FileName);
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
            DeleteFiles(strPathCopy+'*.svr');
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
    end else begin
      DeleteFiles(strPath+'\*.*');
    end;
  finally
    if not lCloseMessage
      then CloseMessage();
  end;
  slOpis.Free;
  if not lErr then begin
    ShowMessage(s);
  end;

  if lFTP then begin
    if SetPropertyFPT(fmMain.IdFTP1, SERVER_ZAGS, '') then begin
      fmMain.CheckVisibleProgress(true,'Передача:');
      if not fmMain.PutFileFTP(true,strPath+'\'+GetNameFile) then begin
        lErr:=true;
      end;
     fmMain.CheckVisibleProgress(false,'');
    end else begin
      PutError('Ошибка чтения параметров FTP');
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
//=== end файл сверки =================================


procedure TfmChVigrZags.CopyBaseFiles(lAlfavit:Boolean; lOnlyHandle:Boolean);
var
  {$IFDEF ZAGS}
   ss :String;
  {$ENDIF}
  strVersionZAGS,strDate1,strDate2, strDisk, strPathCopy : String;
  dDate1,dDate2:TDateTime;
  sl : TStringList;
  i,j,nnn : Integer;
  n,m : Int64;
  strPath,s,IDZags,sTable,sField,sAdd : String;
  lCopy,lReport, lHandleExp : Boolean;
  nFree : TLargeInteger;
  Ini : TSasaIniFile;
  VerInfo: TVerInfo;
  arrCountDok : array of Integer;
  fld : TField;
  strFieldName : String;
  slOpis, slType : TStringList;
  tbSource : TAdsTable;
  lCloseMessage,lErr,lFTP:Boolean;
  Par:TXMLParams;

  function GetNameFile : String;
  begin
    Result := GlobalTask.ParamAsString('ID')+'_';
    if rbMonth.Checked then begin
      Result := Result + Copy(strDate1,1,6)+'M';
    end else if rbKv.Checked then begin
      Result := Result + Copy(strDate1,1,4)+
                PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0')+'K';
    end else if rbYear.Checked then begin
      if Copy(strDate1,1,4)=Copy(strDate2,1,4)
        then Result := Result + Copy(strDate1,1,4)+'G'
        else Result := Result + Copy(strDate1,1,4)+'_'+Copy(strDate2,1,4)+'G';
    end;
    if FTypeVigr=1 then begin
      Result := Result + '.zah';
    end else begin
      if IDPodr='0' then Result := Result + '.zags'
                    else Result := Result + '_'+IDPodr+'.zags'
    end;
  end;
begin
  {$IFDEF ZAGS}
    if FZAGS=0
      then IDZags:=GlobalTask.ParamAsString('ID')
      else IDZags:=IntToStr(FZAGS);    // если выгружаем из обл. архива конкретный ЗАГС
  {$ELSE}
    IDZags := GlobalTask.ParamAsString('ID');
  {$ENDIF}
  lCopy := false;
  slOpis := TStringList.Create;
  slType := TStringList.Create;
  lHandleExp:=false;  // экспортировать органы введенные "вручную"  оставляя их коды
  if cbOnlySmert.Checked then begin
    slOpis.AddObject('Акты смертей', dmBase.tbZapisSmert);
    slType.Add( IntToStr(dmBase.TypeObj_ZSmert) );
    SetLength(arrCountDok, 1);
  end else begin
    slOpis.AddObject('Акты рождений', dmBase.tbZapisRogd);
    slOpis.AddObject('Акты смертей', dmBase.tbZapisSmert);
    slOpis.AddObject('Акты заключения браков', dmBase.tbZapisBrak);
    slOpis.AddObject('Акты установления отцовства', dmBase.tbZapisUstOtc);
    slType.Add( IntToStr(dmBase.TypeObj_ZRogd) );
    slType.Add( IntToStr(dmBase.TypeObj_ZSmert) );
    slType.Add( IntToStr(dmBase.TypeObj_ZBrak) );
    slType.Add( IntToStr(dmBase.TypeObj_ZUstOtc) );
    SetLength(arrCountDok, 4);
    {$IFDEF ZAGS}
      slOpis.AddObject('Акты разводов', dmBase.tbZapisRast);
      slOpis.AddObject('Акты усыновления', dmBase.tbZapisAdopt);
      slOpis.AddObject('Акты перемены имени', dmBase.tbZapisChName);
      slOpis.AddObject('Акты установления материнства', dmBase.tbZapisUstMat);
      slType.Add( IntToStr(dmBase.TypeObj_ZRast) );
      slType.Add( IntToStr(dmBase.TypeObj_ZAdopt) );
      slType.Add( IntToStr(dmBase.TypeObj_ZChName) );
      slType.Add( IntToStr(dmBase.TypeObj_ZUstMat) );
      SetLength(arrCountDok, 8);
      if lAlfavit then begin
        slOpis.AddObject('Алфавитная книга', nil);
        slType.Add( IntToStr(_TypeObj_Alfavit) );
        SetLength(arrCountDok, Length(arrCountDok)+1);
      end;
      if not dmBase.OblArxivZAGS then begin
        GlobalTask.SetLastValueAsBoolean('VIGR_ZAGS_DATEIZM',cbDateIzm.Checked);
        GlobalTask.SetLastValueAsString('VIGR_ZAGS_MINYEAR',VarToStr(edMinYear.Value));
        FDateIzm:=cbDateIzm.Checked;
      end else begin
        FDateIzm:=false;
      end;
    {$ELSE}
      FDateIzm:=false;
    {$ENDIF}
  end;
  strVersionZAGS := dmBase.GetVersionZAGS(false);
  for i:=0 to Length(arrCountDok)-1 do begin
    arrCountDok[i]:= 0;
  end;
  strDate1:='';
  strDate2:='';
  if edDisk.Enabled and (edDisk.ItemIndex>-1) then begin
    GlobalTask.SetLastValueAsString('DISK_VIGR_ZAGS', edDisk.Items[fmChVigrZags.edDisk.ItemIndex]);
  end;
  GetStrDate(strDate1, strDate2);
  sl := TStringList.Create;

  strPath := ExtractFilePath(Application.ExeName)+'Export';

  ForceDirectories(strPath);
  ClearDir(strPath,false);
  lFTP:=false;

  //---------- мое подразделение -----------------
//  IDPodr := GlobalTask.ParamAsString('PODR');   см. FormCreate
//  if IDPodr='' then IDPodr:='0';
  //----------------------------------------------
  if (nIDPodr>0) and dmBase.OblArxivZAGS then begin
    lHandleExp:=true;     // для нормальной перегрузки из архива в архив (ГОМЕЛЬ)  !!!
  end;
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

    dmBase.ScriptForCreateTable( 'BaseProp', sl);
    sl.Add('CREATE INDEX VIGR_KEY ON BaseProp (TYPEOBJ,ID);');
    AdsConnection.Execute( sl.Text );

    dmBase.ScriptForCreateTable( 'BaseTextProp', sl);
    sl.Add('CREATE INDEX VIGR_KEY ON BaseTextProp (TYPEOBJ,ID);');
    AdsConnection.Execute( sl.Text );

    dmBase.ScriptForCreateTable( 'HistoryZAGS', sl);
    sl.Add('CREATE INDEX VIGR_KEY ON HistoryZAGS (TYPEOBJ,ID);');
    AdsConnection.Execute( sl.Text );

    dmBase.ScriptForCreateTable( 'SvidPovtor', sl);
    sl.Add('CREATE INDEX VIGR_KEY ON SvidPovtor (SVID_TYPE,AKT_ID);');
    AdsConnection.Execute( sl.Text );

    dmBase.ScriptForCreateTable( 'SprNames', sl);
    AdsConnection.Execute( sl.Text );

    sl.Free;
    tbDescSprNames.Open;
    tbDescBaseProp.Open;
    tbDescBaseTextProp.Open;
    tbDescHistZAGS.Open;
    tbDescSvidPovtor.Open;
    tbDesc.TableType := dmBase.tbZapisUstOtc.TableType;
    tbDesc.AdsTableOptions.AdsCharType := dmBase.tbZapisUstOtc.AdsTableOptions.AdsCharType;

    // запишем таблицу SprNames
    {$IFDEF ZAGS}
      dmBase.SprNames.First;
      while not dmBase.SprNames.Eof do begin
        //---------- только выбранные из справочника ------------
        if lHandleExp or (dmBase.SprNames.FieldByName('HANDLED').AsBoolean=false) then begin
          tbDescSprNames.Append;
          for j:=0 to tbDescSprNames.FieldCount-1 do begin
            strFieldName := tbDescSprNames.Fields[j].FieldName;
            fld := dmBase.SprNames.FindField(strFieldName);
            if (fld<>nil) and not fld.IsNull then begin
              tbDescSprNames.Fields[j].Value:=fld.Value;
            end;
          end;
          tbDescSprNames.Post;
        end;
        dmBase.SprNames.Next;
      end;
      dmBase.SprNames.First;
    {$ELSE}
      if dmBase.SprNames.Locate('ID', GlobalTask.ParamAsString('ID'),[]) then begin
        tbDescSprNames.Append;
        with tbDescSprNames do begin
          FieldByName('SOATO').AsString   := GlobalTask.ParamAsString('KOD');
          FieldByName('ID').AsString      := GlobalTask.ParamAsString('ID');
          FieldByName('NAME').AsString    := GlobalTask.ParamAsString('NAME');
          FieldByName('NAME_B').AsString  := GlobalTask.ParamAsString('NAME_B');
          FieldByName('KNAME').AsString   := GlobalTask.ParamAsString('KNAME');
          FieldByName('KNAME_B').AsString := GlobalTask.ParamAsString('KNAME_B');
          FieldByName('SHTAMP').AsString  := GlobalTask.ParamAsString('SHTAMP_ZAGS');
          FieldByName('HANDLED').AsBoolean := false;
        end;
        tbDescSprNames.Post;
      end;
    {$ENDIF}

    sAdd:='';
    if FDateIzm then begin
      sField:='DATEIZM';
      if (edMinYear.Value<>null) and (edMinYear.Value>0)   // введено ограничение на мин. год записи акта
        then sAdd:='Year(DATEZ)>='+VarToStr(edMinYear.Value)+' and ';
    end else begin
      sField:='DATEZ';
    end;

    for i:=0 to slOpis.Count-1 do begin
      ChangeMessage(slOpis.Strings[i]+'   ');
      nnn:=0;
      tbSource := TAdsTable(slOpis.Objects[i]);
      tbDesc.TableName := tbSource.TableName;
      tbDesc.Open;
      tbSource.Filtered:=false;
      if strDate2='' then begin  // за год
        tbSource.Filter:=sAdd+'Year('+sField+')='+strDate1;
      end else begin
        tbSource.Filter:=sAdd+sField+'>='+'STOD('+QStr(strDate1)+') and '+
                              sField+'<='+'STOD('+QStr(strDate2)+')';
      end;
//      WriteToDebug([tbSource.Tablename+':  '+tbSource.Filter]);
      if (FTypeVigr=1) then begin
        if not cbAll.Checked then begin   // только мой ЗАГС
          tbSource.Filter:=tbSource.Filter+' and id_zags='+IDZags;
        end;
        tbSource.Filter:=tbSource.Filter+' and (resh_suda=false or empty(resh_suda))';    // не по решению суда
      end;
      {$IFDEF ZAGS}
      if FZAGS>0 then begin
        tbSource.Filter:=tbSource.Filter+' and id_source='+IntToStr(FZAGS);
      end;
      {$ENDIF}
      tbSource.Filtered:=true;
//      ShowMessage(tbSource.Filter+'  '+IntToStr(tbSource.RecordCount));
      while not tbSource.Eof do begin
        tbDesc.Append;
        arrCountDok[i] := arrCountDok[i] + 1;
        nnn:=nnn+1;
        for j:=0 to tbDesc.FieldCount-1 do begin
          strFieldName := tbDesc.Fields[j].FieldName;
          if strFieldName='ID' then begin
            // не пишем т.к. AutoInc
          end else if strFieldName='ID_SOURCE' then begin
            // теперь будем писать ID_ZAGS откуда идут данные (ID где реально выписано),
            //  сельсовет->район ID_ZAGS,ID_SOURCE будут совпадать
            //  район->обл.архив ID_ZAGS,ID_SOURCE не всегда будут совпадать
            tbDesc.FieldByName('ID_SOURCE').AsString:=IDZags;
          end else if strFieldName='PODR' then begin
            // запишем номер подразделения
            tbDesc.FieldByName('PODR').AsString:=IDPodr;
          end else if strFieldName='ID_AKT_ROGD' then begin     // ID акта о рождении актуален только в текущей (не выгруженной) базе
            tbDesc.FieldByName('ID_AKT_ROGD').AsString:='';
          end else begin
            fld := tbSource.FindField(strFieldName);
            if (fld<>nil) and not fld.IsNull then begin
              tbDesc.Fields[j].Value:=fld.Value;
            end;
          end;
        end;
        {$IFDEF ZAGS}
          ss := tbSource.FieldByName('ID_ZAGS').AsString;
          if ss='' then begin
            ss:=IDZags;
          end;
          if not lHandleExp and (Copy(ss,1,4)='9000') and (Length(ss)=8) then begin // ID_ZAGS добавлен в справочник вручную
            tbDesc.FieldByName('ID_ZAGS').AsString := IDZags;
            if dmBase.SprNames.Locate('ID', IDZags, []) then begin
              tbDesc.FieldByName('NAME_ZAGS').AsString     := dmBase.SprNames.FieldByName('NAME').AsString;
              tbDesc.FieldByName('NAME_ZAGS_B').AsString   := dmBase.SprNames.FieldByName('NAME_B').AsString;
            end;
          end else begin
            tbDesc.FieldByName('ID_ZAGS').AsString := ss;
            // если наименование загс символьное не введено
            if tbSource.FieldByName('NAME_ZAGS').AsString='' then begin
              tbDesc.FieldByName('NAME_ZAGS').AsString   := '';
              tbDesc.FieldByName('NAME_ZAGS_B').AsString := '';
//-------------- VADIM: закоментировано 26.06.2012 -----------
//              if dmBase.SprNames.Locate('ID', ss, []) then begin
//                tbDesc.FieldByName('NAME_ZAGS').AsString   := ''; dmBase.SprNames.FieldByName('NAME').AsString;
//                tbDesc.FieldByName('NAME_ZAGS_B').AsString := ''; dmBase.SprNames.FieldByName('NAME_B').AsString;
//              end;
            end else begin
              tbDesc.FieldByName('NAME_ZAGS').AsString   := tbSource.FieldByName('NAME_ZAGS').AsString;
              tbDesc.FieldByName('NAME_ZAGS_B').AsString := tbSource.FieldByName('NAME_ZAGS_B').AsString;
            end;
          end;
        {$ELSE}
          // для сельсовета всегда перепишем поля: ID_ZAGS, NAME_ZAGS, NAME_ZAGS_B
          tbDesc.FieldByName('ID_ZAGS').AsString   := IDZags;
          tbDesc.FieldByName('ID_SOURCE').AsString := IDZags;
          tbDesc.FieldByName('NAME_ZAGS').AsString   := ''; //GlobalTask.ParamAsString('NAME');     VADIM: закоментировано 26.06.2012
          tbDesc.FieldByName('NAME_ZAGS_B').AsString := ''; //GlobalTask.ParamAsString('NAME_B');
        {$ENDIF}
        tbDesc.Post;
        WriteProp(tbSource.FieldByName('ID').AsInteger,
                  tbDesc.FieldByName('ID').AsInteger,
                  StrToInt(slType.Strings[i]) );
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
    tbDescSprNames.Close;
    tbDescBaseProp.Close;
    tbDescBaseTextProp.Close;
    tbDescHistZAGS.Close;
    tbDescSvidPovtor.Close;
    AdsConnection.IsConnected:=false;
    j := 0;
    for i:=0 to slOpis.Count-1 do begin
      j := j + arrCountDok[i];
    end;
    if j = 0 then begin
      ShowMessage('  Не найдено ни одного документа для копирования !  ');
    end;
    if j > 0 then begin
      Ini := TSasaIniFile.Create(strPath+'\'+'zags.ini');
      {$IFDEF ZAGS}
        if dmBase.OblArxivZAGS
          then Ini.WriteString('MAIN','ARXIV','1')                          // выгрузка из обл. архива
          else Ini.WriteString('MAIN','ARXIV','0');
        Ini.WriteString('MAIN','ZAGS',GlobalTask.ParamAsString('ID'));      // загс откуда выгружено
        if FZAGS>0
          then Ini.WriteString('MAIN','ZAGS_SOURCE',IntToStr(FZAGS))        // данные какого загс выгружены
          else Ini.WriteString('MAIN','ZAGS_SOURCE','0');
        Ini.WriteString('MAIN','LAIS','0');         // выгрузка из ЗАГС
      {$ELSE}
        Ini.WriteString('MAIN','ARXIV','0');
        Ini.WriteString('MAIN','ZAGS',GlobalTask.ParamAsString('ID'));      // загс откуда выгружено
        Ini.WriteString('MAIN','LAIS','1');        // выгрузка из ЛАИС
      {$ENDIF}
      Ini.WriteString('MAIN','ZAGS_NAME',GlobalTask.ParamAsString('NAME'));   // название загс откуда выгружено
      Ini.WriteString('MAIN','DATE',DTOS(dmBase.getCurDate,tdClipper));
      Ini.WriteString('MAIN','TIME',FormatDateTime('hh:nn',Now));
      Ini.WriteString('MAIN','DATE1',strDate1);
      Ini.WriteString('MAIN','DATE2',strDate2);
      VerInfo:=TVerInfo.Create(Application.ExeName);
      Ini.WriteString('MAIN','VERSION',VerInfo.ProductVersion);
      Ini.WriteString('MAIN','VERSION_ZAGS',strVersionZAGS);
      Ini.WriteString('MAIN','BASE',dmBase.GetVersionBase(nil));
      Ini.WriteString('MAIN','VERSIONPROP','1');
      Ini.WriteString('MAIN','PODR',IDPodr);
      {$IFDEF LAIS}
        Ini.WriteString('MAIN','TYPE','PERIOD');
      {$ELSE}
        if FDateIzm
          then Ini.WriteString('MAIN','TYPE','DATE_CHANGE');
//          else Ini.WriteString('MAIN','TYPE','');
      {$ENDIF}
      if (nIDPodr>0) and cbOnlySmert.Visible and cbOnlySmert.Checked then begin
        Ini.WriteInteger('MAIN','PODR_TYPEAKT',_TypeObj_ZSmert);
      end else begin
        Ini.WriteInteger('MAIN','PODR_TYPEAKT',0);
      end;

      VerInfo.Free;
      for i:=0 to slOpis.Count-1 do begin
        Ini.WriteString('COUNT',TAdsTable(slOpis.Objects[i]).TableName,IntToStr(arrCountDok[i]));
      end;
      Ini.UpdateFile;
      Ini.Free;
      lReport:=false;
      Report.Clear;

      par.Connection:=dmBase.AdsConnection;
      GetDate(dDate1, dDate2);
      par.FirstDate:=DTOS(dDate1,tdAds);
      par.LastDate:=DTOS(dDate2,tdAds);
      par.Name:=GlobalTask.ParamAsString('NAME');
      par.NameBel:=GlobalTask.ParamAsString('NAME_B');
      par.Shtamp:=GlobalTask.ParamAsString('SHTAMP');
      par.Soato:=GlobalTask.ParamAsString('KOD');
      par.ID:=GlobalTask.ParamAsString('ID');
      par.PathReport:=GetFullNameReport('&ss2zags_report.fr3');
      par.PathIni:=Globaltask.PathService+'field2xml.ini';
      par.ExceptList:='sys';
      par.PathXml:=strPath+'\zags.xml';

      if GlobalTask.ParamAsBoolean('ZAGS2XML') then begin
        ChangeMessage('Формирование XML ...');
        {$IFDEF ZAGS}
          ZAGS2Xml([tbBirth,tbMarriages,tbDeath,tbPaternity,tbDivorces, tbMotherhood, tbChangeName, tbAdoption],par,false,report);
          lReport:=true;
        {$ELSE}
          ZAGS2Xml([tbBirth,tbMarriages,tbDeath,tbPaternity],par,false,report);
          lReport:=true;
        {$ENDIF}
      end else begin
        if GlobalTask.ParamAsBoolean('VIGR_REPORT') then begin
          {$IFDEF ZAGS}
            ZAGS2Xml([tbBirth,tbMarriages,tbDeath,tbPaternity,tbDivorces, tbMotherhood, tbChangeName, tbAdoption],par,true,report);
            lReport:=true;
          {$ELSE}
            ZAGS2Xml([tbBirth,tbMarriages,tbDeath,tbPaternity],par,true,report);
            lReport:=true;
          {$ENDIF}
        end;
      end;
      ChangeMessage('Архивирование ...');
      Zip.FileName := strPath+'\'+GetNameFile;
      Zip.BaseDir  := strPath;
      Zip.OpenArchive(fmCreate);
      Zip.AddFiles('*.*');
      Zip.CloseArchive;
      // копируем на носитель
      n := GetFileSize(Zip.FileName);
      if GlobalTask.ParamAsBoolean('ZAGS2XML') then begin
        m:=GetFileSize(strPath+'\zags.xml');
      end else begin
        m:=0;
      end;
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
            DeleteFiles(strPathCopy+'*.zags');
            lFirstVigr:=false;
          end else begin
            DeleteFile(strPathCopy+GetNameFile);
          end;
          DeleteFile(strPathCopy+'zags.xml');
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
            if GlobalTask.ParamAsBoolean('ZAGS2XML') then begin
              if CopyFile(PChar(strPath+'\zags.xml'),
                          PChar(strPathCopy+'zags.xml'), false) then begin
                lCopy := true;
              end else begin
                PutError('Ошибка копирования файла : '+strPath+'\zags.xml'+
                        #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
                lErr:=true;
              end;
            end;
          end;
        end;
      end;
      s:='';

      if lReport
       then report.ShowPreparedReport;

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
        if GlobalTask.ParamAsBoolean('ZAGS2XML') then begin
//          ShowMessage('  Файлы сохранены на компьютере как: "'+strPath+'\'+GetNameFile+'"  '+#13+strPath+'\zags.xml');
        end else begin
          DeleteFiles(strPath+'\*.xml');
//          ShowMessage('  Файл сохранен на компьютере как: "'+strPath+'\'+GetNameFile+'"  ');
        end;
      end;
    end else begin
      DeleteFiles(strPath+'\*.*');
    end;
  finally
    if not lCloseMessage
      then CloseMessage();
  end;
  slOpis.Free;
  if not lErr then begin
    ShowMessage(s);
  end;

  if lFTP then begin
    if SetPropertyFPT(fmMain.IdFTP1, SERVER_ZAGS, '') then begin
      fmMain.CheckVisibleProgress(true,'Передача:');
      if not fmMain.PutFileFTP(true,strPath+'\'+GetNameFile) then begin
        lErr:=true;
      end;
     fmMain.CheckVisibleProgress(false,'');
    end else begin
      PutError('Ошибка чтения параметров FTP');
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

function TfmChVigrZags.WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
var
  fldD:TField;
  i:Integer;
begin
  Result := true;

  dmBase.tbSimpleProp.IndexName := 'PR_KEY';
  dmBase.tbSimpleProp.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not dmBase.tbSimpleProp.Eof do begin
    with tbDescBaseProp do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      FieldByName('DATES').AsDateTime := dmBase.GetDateCurrentSost;
      FieldByName('POKAZ').AsString := dmBase.tbSimpleProp.fieldByName('POKAZ').AsString;
      FieldByName('VALUE').AsString := dmBase.tbSimpleProp.fieldByName('VALUE').AsString;
      FieldByName('NVALUE').AsString := dmBase.tbSimpleProp.fieldByName('NVALUE').AsString;
      FieldByName('TYPESAVE').AsString := dmBase.tbSimpleProp.fieldByName('TYPESAVE').AsString;
      Post;
    end;
    dmBase.tbSimpleProp.Next;
  end;
  dmBase.tbSimpleProp.CancelRange;

  dmBase.tbSimplePropMemo.IndexName := 'PR_KEY';
  dmBase.tbSimplePropMemo.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not dmBase.tbSimplePropMemo.Eof do begin
    with tbDescBaseTextProp do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      FieldByName('DATES').AsDateTime := dmBase.GetDateCurrentSost;
      FieldByName('POKAZ').AsString := dmBase.tbSimplePropMemo.FieldByName('POKAZ').AsString;
      FieldByName('VALUE').AsString := dmBase.tbSimplePropMemo.FieldByName('VALUE').AsString;
      Post;
    end;
    dmBase.tbSimplePropMemo.Next;
  end;
  dmBase.tbSimplePropMemo.CancelRange;

  dmBase.tbHistoryZAGS.IndexName := 'PR_KEY';
  dmBase.tbHistoryZAGS.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not dmBase.tbHistoryZAGS.Eof do begin
    with tbDescHistZAGS do begin
      Append;
      for i:=0 to dmBase.tbHistoryZAGS.FieldCount-1 do begin
        fldD := FindField(dmBase.tbHistoryZAGS.Fields[i].FieldName);
        if (fldD<>nil) and not dmBase.tbHistoryZAGS.Fields[i].IsNull then begin
          try
            fldD.Value:=dmBase.tbHistoryZAGS.Fields[i].Value;
          except
            on E: Exception do begin
              PutError('История реквизитов'+Chr(13)+
                       'Ошибка записи в поле: '+fldD.FieldName+Chr(13)+
                       'Значение: "'+fldD.AsString+'"'+Chr(13)+
                       E.Message);
            end;
          end;
        end;
      end;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      Post;
    end;
    dmBase.tbHistoryZAGS.Next;
  end;
  dmBase.tbHistoryZAGS.CancelRange;

  dmBase.SvidPovtor.IndexName := 'PR_KEY';
  dmBase.SvidPovtor.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not dmBase.SvidPovtor.Eof do begin
    with tbDescSvidPovtor do begin
      Append;
      for i:=0 to dmBase.SvidPovtor.FieldCount-1 do begin
        fldD := FindField(dmBase.SvidPovtor.Fields[i].FieldName);
        if (fldD<>nil) and not dmBase.SvidPovtor.Fields[i].IsNull then begin
          try
            fldD.Value:=dmBase.SvidPovtor.Fields[i].Value;
          except
            on E: Exception do begin
              PutError('Повторные свидетельства'+Chr(13)+
                       'Ошибка записи в поле: '+fldD.FieldName+Chr(13)+
                       'Значение: "'+fldD.AsString+'"'+Chr(13)+
                       E.Message);
            end;
          end;
        end;
      end;
      FieldByName('SVID_TYPE').AsInteger  := nTypeObj;
      FieldByName('AKT_ID').AsInteger     := nIDDesc;
      Post;
    end;
    dmBase.SvidPovtor.Next;
  end;
  dmBase.SvidPovtor.CancelRange;
end;

function TfmChVigrZags.GetDiskFree(strDisk : String) : TLargeInteger;
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

constructor TfmChVigrZags.Create(Owner: TComponent);
begin
  inherited;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_YEARS',edGod.Items, edGod.KeyItems);
  edGod.DropDownBox.Rows:=12;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_YEARS',edGod1.Items, edGod1.KeyItems);
  edGod1.DropDownBox.Rows:=12;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_MONTH',edNomerPeriod.Items, edNomerPeriod.KeyItems);
  CleateListDisk;
end;

//------------------------------------------------
procedure TfmChVigrZags.WMDEVICECHANGE(var Msg: TMessage);
begin
{Заголовок сообщения}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CleateListDisk;
end;

//------------------------------------------------
procedure TfmChVigrZags.RefreshListDisk;
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
procedure TfmChVigrZags.CleateListDisk;
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

procedure TfmChVigrZags.GetStrDate( var strDate1, strDate2 : String);
var
  s : String;
  strDay : String;
  n1, n2 : Integer;
begin
  strDate1 := '';
  strDate2 := '';
  s := edGod.KeyItems[edGod.ItemIndex];
  if rbMonth.Checked then begin
    strDate1 := s + PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0') +
                '01';
    strDay := IntToStr(CountDays( s, edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex]));
    strDate2 := s + PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0')
                + strDay;
  end else if rbKv.Checked then begin
    n1 := (StrToInt(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex])-1)*3+1;
    n2 := n1 + 2;
    strDate1 := s + PadLInt(n1,2,'0') + '01';
    strDay := IntToStr(CountDays( s, n2));
    strDate2 := s + PadLInt(n2,2,'0') + strDay;
  end else if rbYear.Checked then begin
    s := edGod1.KeyItems[edGod1.ItemIndex];   // начальный год
    strDate1 := s+'0101';
    s := edGod.KeyItems[edGod.ItemIndex];     // конечный год
    strDate2 := s+'1231';
//    strDate1 := edGod1.KeyItems[edGod1.ItemIndex];
//    strDate2 := edGod.KeyItems[edGod.ItemIndex];
  end;
end;

procedure TfmChVigrZags.GetDate( var d1, d2 : TDateTime);
var
  s,s1,s2 : String;
  strDay : String;
  n1, n2 : Integer;
begin
  s := edGod.KeyItems[edGod.ItemIndex];
  if rbMonth.Checked then begin
    s1 := s + PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0') +
                '01';
    strDay := IntToStr(CountDays( s, edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex]));
    s2 := s + PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0')
                + strDay;
  end else if rbKv.Checked then begin
    n1 := (StrToInt(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex])-1)*3+1;
    n2 := n1 + 2;
    s1 := s + PadLInt(n1,2,'0') + '01';
    strDay := IntToStr(CountDays( s, n2));
    s2 := s + PadLInt(n2,2,'0') + strDay;
  end else if rbYear.Checked then begin
    s := edGod1.KeyItems[edGod1.ItemIndex];   // начальный год
    s1 := s+'0101';
    s := edGod.KeyItems[edGod.ItemIndex];     // конечный год
    s2 := s+'1231';
  end;
  d1 := STOD(s1,tdClipper);
  d2 := STOD(s2,tdClipper);
end;

//procedure TfmChVigrZags.CheckControl;
//begin
//end;

procedure TfmChVigrZags.rbMonthClick(Sender: TObject);
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

procedure TfmChVigrZags.rbKvClick(Sender: TObject);
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

procedure TfmChVigrZags.rbYearClick(Sender: TObject);
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

procedure TfmChVigrZags.UpdateActions;
begin
  inherited;
  if ( (edNomerPeriod.ItemIndex > -1) or rbYear.Checked ) and
     ( edGod.ItemIndex > -1) then begin
    if rbYear.Checked then begin
      if (edGod1.ItemIndex>-1) and (edGod1.ItemIndex>=edGod.ItemIndex) then begin
        btOk.Enabled := true;
      end else begin
        btOk.Enabled := false;
      end;
    end else begin
      btOk.Enabled := true;
    end;
  end else begin
    btOk.Enabled := false;
  end;
end;

procedure TfmChVigrZags.edDiskEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edDisk.Text:='';
  edDisk.ItemIndex:=-1;
end;

procedure TfmChVigrZags.cbPathClick(Sender: TObject);
begin
  edDisk.Enabled:=not cbPath.Checked;
end;

procedure TfmChVigrZags.edZAGSEditButtons0Click(Sender: TObject; var Handled: Boolean);
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

procedure TfmChVigrZags.btHelpClick(Sender: TObject);
var
  s:String;
begin
  s:='<READONLY>'+getResource('VIGR_ZAGS', -1);
  EditMemo(s, '', nil, 800);
end;                                                                          

procedure TfmChVigrZags.btOkClick(Sender: TObject);
begin
  if cbDateIzm.Checked and (edMinYear.Value<>null) and (edMinYear.Value>0) then begin
    if (edMinYear.Value<1900) or (edMinYear.Value>YearOf(Date)) then begin
      PutError('Неверное значение'#13#10+'Минимальный год записи акта: '+VarToStr(edMinYear.Value));
    end else begin
      ModalResult:=mrOk;
    end;
  end else begin
    ModalResult:=mrOk;
  end;
end;

procedure TfmChVigrZags.cbDateIzmClick(Sender: TObject);
begin
  edMinYear.Enabled:=cbDateIzm.Checked;
  lbMinYear.Enabled:=cbDateIzm.Checked;
end;

initialization
  lFirstVigr:=true;
finalization

end.
