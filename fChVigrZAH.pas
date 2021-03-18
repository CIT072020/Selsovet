unit fChVigrZAH;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, Variants, DateUtils,
  StdCtrls, Buttons, Mask, DBCtrlsEh, OpisEdit, MetaTask, FuncPr, ShellApi, uproject, uTypes,
  adscnnct, adstable, dBase, DataTask, ZipForge, FileCtrl, uUtilFiles, Db,
  adsdata, adsfunc, sasaIniFile, mVerInfo, u2zags, uCreateXML, reportTask,
  frxClass, ExtCtrls, CheckLst;

type
  TfmChVigrZAH = class(TForm)
    GroupBox1: TGroupBox;
    rbMonth: TRadioButton;
    rbKv: TRadioButton;
    rbYear: TRadioButton;
    AdsConnection: TAdsConnection;
    Zip: TZipForge;
    tbDesc: TAdsTable;
    tbDescSprZAH: TAdsTable;
    tbDescBaseProp: TAdsTable;
    tbDescHistZAGS: TAdsTable;
    tbDescSprRazmer: TAdsTable;
    Report: TfrxReport;
    Panel1: TPanel;
    Panel2: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    lbPer: TLabel;
    Label3: TLabel;
    lbGod1: TLabel;
    edNomerPeriod: TDBComboBoxEh;
    edDisk: TDBComboBoxEh;
    cbPath: TDBCheckBoxEh;
    cbAll: TDBCheckBoxEh;
    rbAny: TRadioButton;
    edDate1: TDBDateTimeEditEh;
    edDate2: TDBDateTimeEditEh;
    Button1: TButton;
    ListKlad: TCheckListBox;
    procedure rbMonthClick(Sender: TObject);
    procedure rbKvClick(Sender: TObject);
    procedure rbYearClick(Sender: TObject);
    procedure edDiskEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure cbPathClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbAllClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    FTypeVigr: Integer;
    procedure GetStrDate( var strDate1, strDate2 : String; nType:Integer);
//    procedure GetDate( var d1, d2 : TDateTime);
    procedure SetTypeVigr(const Value: Integer);
  public
    FSprZAH:TStringList;
    FPath : String;
    FZAGS : Integer;
    IDPodr:String;
    nIDPodr:Integer;
    property TypeVigr:Integer read FTypeVigr write SetTypeVigr;

    constructor Create( Owner : TComponent); override;
    destructor Destroy; override;
    procedure UpdateActions; override;
    procedure CleateListDisk;

    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

    function IsKladCheck(nID:Integer):Boolean;

    procedure RefreshListDisk;
    function GetDiskFree(strDisk : String) : Int64;
    procedure CopyBaseFiles(lAlfavit:Boolean; lOnlyHandle:Boolean);
    function WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
  end;

  procedure RunVigrZAH(nType:Integer);

implementation

uses fMain, uProjectAll;

var
  fmChVigrZAH: TfmChVigrZAH;
  lFirstVigr:Boolean;

{$R *.DFM}

{ TfmChVigrZAH }

procedure RunVigrZAH(nType:Integer);
var
  n:Integer;
  lOK:Boolean;
begin
  lOK:=true;
  fmChVigrZAH := TfmChVigrZAH.Create(nil);
  fmChVigrZAH.FZAGS:=0;
  fmChVigrZAH.TypeVigr:=nType;

  with dmBase.SprZAH do begin
    First;
    while not Eof and lOk do begin
      if FieldByName('ID_GIS').IsNull or (FieldByName('ID_GIS').AsInteger=0) then begin
        lOK:=false;
        PutError('Заполните все коды ГИС РН в справочнике мест захоронений');
      end else begin
        fmChVigrZAH.FSprZAH.Add(FieldByName('ID').AsString+'='+FieldByName('ID_GIS').AsString);
        fmChVigrZAH.ListKlad.Items.AddObject(FieldByName('NAME').AsString, Pointer(FieldByName('ID').AsInteger));
      end;
      Next;
    end;
    First;
  end;

  if lOK then begin
    try
      if fmChVigrZAH.ShowModal = mrOk then begin
        fmChVigrZAH.CopyBaseFiles(false,false);
      end;
    finally
      fmChVigrZAH.Free;
    end;
  end;
end;

procedure TfmChVigrZAH.SetTypeVigr(const Value: Integer);
begin
  FTypeVigr := Value;
  if FTypeVigr=1 then begin
  end;
end;

procedure TfmChVigrZAH.FormCreate(Sender: TObject);
var
 s:String;
 n:Integer;
 d:TDateTime;
begin
  {$IFDEF LAIS}
    cbPath.Visible:=false;
  {$ENDIF}
  IDPodr:=Trim(GlobalTask.ParamAsString('PODR'));
  if IDPodr='' then IDPodr:='0';
  try
    nIDPodr:=StrToInt(IDPodr);
  except
    nIDPodr:=0;
    PutError('Ошибка определения номера подразделения.');
  end;
  s:=GlobalTask.GetLastValueAsString('DATE_VIGR_PODR');
  if s=''
    then d:=Now-1
    else d:=GlobalTask.GetLastValueAsDate('DATE_VIGR_PODR')+1;

  edDate1.Value:=d;
end;

procedure TfmChVigrZAH.CopyBaseFiles(lAlfavit:Boolean; lOnlyHandle:Boolean);
var
  strVersionZAH,strDate1,strDate2, strDisk, strPathCopy : String;
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
  strFieldName, sKlad : String;
  slOpis, slType : TStringList;
  tbSource : TAdsTable;
  lCloseMessage,lErr,lFTP:Boolean;
  Par:TXMLParams;

  function GetNameFile : String;
  var s1,s2:String;
  begin
    {
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
    }
    if IDPodr='0' then Result := GlobalTask.ParamAsString('ID')
                  else Result := IDPodr;
    GetStrDate(s1, s2, 1);
    Result:=Result+'_'+s1+'_'+s2+'.zah';
  end;
begin
  IDZags := GlobalTask.ParamAsString('ID');

  lCopy := false;
  slOpis := TStringList.Create;
  slType := TStringList.Create;
  slOpis.AddObject('Информация', dmBase.AktZ);
  slType.Add( IntToStr(_TypeObj_AktZAH) );
  SetLength(arrCountDok, 1);

  strVersionZAH := dmBase.GetVersionZAH(false);
  for i:=0 to Length(arrCountDok)-1 do begin
    arrCountDok[i]:= 0;
  end;
  strDate1:='';
  strDate2:='';
  if edDisk.Enabled and (edDisk.ItemIndex>-1) then begin
    GlobalTask.SetLastValueAsString('DISK_VIGR_ZAH', edDisk.Items[fmChVigrZAH.edDisk.ItemIndex]);
  end;

  GetStrDate(strDate1, strDate2, 0);
  sl := TStringList.Create;

  strPath := ExtractFilePath(Application.ExeName)+'Export';

  ForceDirectories(strPath);
  ClearDir(strPath,false);
  lFTP:=false;

  //---------- мое подразделение -----------------
//  IDPodr := GlobalTask.ParamAsString('PODR');   см. FormCreate
//  if IDPodr='' then IDPodr:='0';
  //----------------------------------------------
  AdsConnection.ConnectPath := strPath;
  AdsConnection.IsConnected := true;
  lCloseMessage:=false;
  OpenMessage('Поиск информации ..............................','Выгрузка');
  lErr:=false;
  try

    ChangeMessage('Подготовка ...  ');
    for i:=0 to slOpis.Count-1 do begin
      sTable:=TAdsTable(slOpis.Objects[i]).TableName;
      dmBase.ScriptForCreateTable( sTable, sl);
      AdsConnection.Execute( sl.Text );
    end;

    dmBase.ScriptForCreateTable( 'BaseProp', sl);
    sl.Add('CREATE INDEX VIGR_KEY ON BaseProp (TYPEOBJ,ID);');
    AdsConnection.Execute( sl.Text );
{
    dmBase.ScriptForCreateTable( 'BaseTextProp', sl);
    sl.Add('CREATE INDEX VIGR_KEY ON BaseTextProp (TYPEOBJ,ID);');
    AdsConnection.Execute( sl.Text );

    dmBase.ScriptForCreateTable( 'HistoryZAGS', sl);
    sl.Add('CREATE INDEX VIGR_KEY ON HistoryZAGS (TYPEOBJ,ID);');
    AdsConnection.Execute( sl.Text );
}
    dmBase.ScriptForCreateTable( 'SprRazmer', sl);
    // !!!
    sl.Text:=StringReplace(sl.Text, 'AUTOINC', 'INTEGER', [rfReplaceAll,rfIgnoreCase]);
    AdsConnection.Execute( sl.Text );

    dmBase.ScriptForCreateTable( 'SprZAH', sl);
    // !!!
    sl.Text:=StringReplace(sl.Text, 'AUTOINC', 'INTEGER', [rfReplaceAll,rfIgnoreCase]);
    AdsConnection.Execute( sl.Text );

    sl.Free;

    tbDescSprRazmer.Open;
    tbDescSprZAH.Open;
    tbDescBaseProp.Open;
//    tbDescHistZAGS.Open;
    tbDesc.TableType := dmBase.AktZ.TableType;
    tbDesc.AdsTableOptions.AdsCharType := dmBase.AktZ.AdsTableOptions.AdsCharType;
    //------------------- запишем таблицу SprRazmer------------------------------
    dmBase.SprRazmer.First;
    while not dmBase.SprRazmer.Eof do begin
      tbDescSprRazmer.Append;
      for j:=0 to tbDescSprRazmer.FieldCount-1 do begin
        strFieldName := tbDescSprRazmer.Fields[j].FieldName;
        fld := dmBase.SprRazmer.FindField(strFieldName);
        if (fld<>nil) and not fld.IsNull then begin
          tbDescSprRazmer.Fields[j].Value:=fld.Value;
        end;
      end;
      tbDescSprRazmer.Post;
      dmBase.SprRazmer.Next;
    end;
    dmBase.SprRazmer.First;
    //------------------- запишем справочник SprZAH------------------------------
    sKlad:='';
    dmBase.SprZAH.First;
    while not dmBase.SprZAH.Eof do begin
      if cbAll.Checked or IsKladCheck(dmBase.SprZAH.FieldByName('ID').AsInteger) then begin
        {$IFDEF LAIS}
          // !!! для ЛАИС выгружаем каждый раз список кладбищ, которые хотим загрузить
          sKlad:=sKlad+dmBase.SprZAH.FieldByName('ID_GIS').AsString+',';
        {$ELSE}
          if not cbAll.Checked
            then sKlad:=sKlad+dmBase.SprZAH.FieldByName('ID_GIS').AsString+',';
        {$ENDIF}
        tbDescSprZAH.Append;
        for j:=0 to tbDescSprZAH.FieldCount-1 do begin
          strFieldName := tbDescSprZAH.Fields[j].FieldName;
          fld := dmBase.SprZAH.FindField(strFieldName);
          if (fld<>nil) and not fld.IsNull then begin
            tbDescSprZAH.Fields[j].Value:=fld.Value;
          end;
        end;
        tbDescSprZAH.Post;
        //------------------- запишем BaseProp ( списки книг ) ------------------------------
        WriteProp(dmBase.SprZAH.FieldByName('ID').AsInteger, tbDescSprZAH.FieldByName('ID').AsInteger, _TypeObj_BookKlad);
      end;
      dmBase.SprZAH.Next;
    end;
    dmBase.SprZAH.First;

    for i:=0 to slOpis.Count-1 do begin
      ChangeMessage(slOpis.Strings[i]+'   ');
      nnn:=0;
      tbSource := TAdsTable(slOpis.Objects[i]);
      tbDesc.TableName := tbSource.TableName;
      tbDesc.Open;
      tbSource.Filtered:=false;
      if strDate2='' then begin  // за год
        tbSource.Filter:='Year(DATEZ)='+strDate1;
      end else begin
        tbSource.Filter:='DATEZ>='+'STOD('+QStr(strDate1)+') and '+
                         'DATEZ<='+'STOD('+QStr(strDate2)+')';
      end;
      if not cbAll.Checked then begin
        s:='';
        for j:=0 to ListKlad.Items.Count-1 do begin
          if ListKlad.Checked[j]
            then s:=s+'zh_klad='+IntToStr(Integer(ListKlad.Items.Objects[j]))+' or ';
        end;
        if s<>''
          then s:='('+Copy(s,1,Length(s)-4)+')';
        tbSource.Filter:=tbSource.Filter+' and '+s;
      end;
//   showmessage(tbSource.Filter);
      tbSource.Filtered:=true;
      GlobalTask.WriteToLogFile('Выгрузка информации из таблицы "'+tbSource.TableName+'" по фильтру: "'+tbSource.Filter+'"');
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
            tbDesc.FieldByName('ID_SOURCE').AsString:='0'; //IDZags;
          end else if strFieldName='ID_ZAGS' then begin
            tbDesc.FieldByName('ID_ZAGS').AsString:='0'; //IDZags;
          end else if strFieldName='PODR' then begin
            // запишем номер подразделения
            tbDesc.FieldByName('PODR').AsString:=IDPodr;
          end else begin
            fld := tbSource.FindField(strFieldName);
            if (fld<>nil) and not fld.IsNull then begin
              tbDesc.Fields[j].Value:=fld.Value;
            end;
          end;
        end;
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
    tbDescSprRazmer.Close;
    tbDescSprZAH.Close;
//    tbDescBaseProp.Close;
//    tbDescBaseTextProp.Close;
//    tbDescHistZAGS.Close;
    AdsConnection.IsConnected:=false;
    j := 0;
    for i:=0 to slOpis.Count-1 do begin
      j := j + arrCountDok[i];
    end;
    if j = 0 then begin
      CloseMessage;
      lCloseMessage:=true;
      ShowMessage('Не найдено ни одного документа для выгрузки.');
      lErr:=true;
    end;
    if j > 0 then begin
      GlobalTask.SetLastValueAsDate('DATE_VIGR_PODR', edDate2.Value);
      Ini := TSasaIniFile.Create(strPath+'\'+'zah.ini');
//        Ini.WriteString('MAIN','ZAGS_SOURCE','0');
      Ini.WriteString('MAIN','ARXIV','0');
      Ini.WriteString('MAIN','ORGAN',GlobalTask.ParamAsString('ID'));      // откуда выгружено
      Ini.WriteString('MAIN','NAME',GlobalTask.ParamAsString('NAME'));   // название откуда выгружено
      Ini.WriteString('MAIN','DATE',DTOS(dmBase.getCurDate,tdClipper));
      Ini.WriteString('MAIN','TIME',FormatDateTime('hh:nn',Now));
      Ini.WriteString('MAIN','DATE1',strDate1);
      Ini.WriteString('MAIN','DATE2',strDate2);
//      Ini.WriteString('MAIN','SPRZAH',FSprZAH.CommaText);
      VerInfo:=TVerInfo.Create(Application.ExeName);
      Ini.WriteString('MAIN','VERSION',VerInfo.ProductVersion);
      Ini.WriteString('MAIN','VERSION_ZAH',strVersionZAH);
      Ini.WriteString('MAIN','BASE',dmBase.GetVersionBase(nil));
//      Ini.WriteString('MAIN','VERSIONPROP','1');
      Ini.WriteString('MAIN','PODR',IDPodr);
      if (sKlad<>'')
        then Ini.WriteString('MAIN','KLAD', Copy(sKlad,1,Length(sKlad)-1));
//      Ini.WriteInteger('MAIN','PODR_TYPEAKT',0);

      VerInfo.Free;
      for i:=0 to slOpis.Count-1 do begin
        Ini.WriteString('COUNT',TAdsTable(slOpis.Objects[i]).TableName,IntToStr(arrCountDok[i]));
      end;
      Ini.UpdateFile;
      Ini.Free;
      lReport:=false;
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
        if cbPath.Checked and cbPath.Visible then begin
          strPathCopy:=Trim(GlobalTask.ParamAsString('PATH_VIGR_ZAH'));
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
            DeleteFiles(strPathCopy+'*.zah');
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

      if lReport
       then report.ShowPreparedReport;

      if not lErr then begin
        s :=' Выгрузка успешно завершена. Выгружено: '+#13;
        for i:=0 to slOpis.Count-1 do begin
          s := s + slOpis.Strings[i] + '    -    ' + IntToStr(arrCountDok[i]) + '  '+#13;
        end;
        GlobalTask.WriteToLogFile(StringReplace(s,#13,'',[rfReplaceAll]));
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

  if not lErr then begin
    if lFTP then begin
      if SetPropertyFPT(fmMain.IdFTP1, SERVER_ZAH, '') then begin
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
end;

function TfmChVigrZAH.WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
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
      FieldByName('DATES').AsDateTime := dmBase.tbSimpleProp.fieldByName('DATES').AsDateTime;
      FieldByName('POKAZ').AsString := dmBase.tbSimpleProp.fieldByName('POKAZ').AsString;
      FieldByName('VALUE').AsString := dmBase.tbSimpleProp.fieldByName('VALUE').AsString;
      FieldByName('NVALUE').AsString := dmBase.tbSimpleProp.fieldByName('NVALUE').AsString;
      FieldByName('TYPESAVE').AsString := dmBase.tbSimpleProp.fieldByName('TYPESAVE').AsString;
      Post;
    end;
    dmBase.tbSimpleProp.Next;
  end;
  dmBase.tbSimpleProp.CancelRange;
  {
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
  }
  {
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
  }
end;

function TfmChVigrZAH.GetDiskFree(strDisk : String) : TLargeInteger;
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
//------------------------------------------------
constructor TfmChVigrZAH.Create(Owner: TComponent);
begin
  inherited;
  FSprZAH:=TStringList.Create;
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_YEARS',edGod.Items, edGod.KeyItems);
//  edGod.DropDownBox.Rows:=12;
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_YEARS',edGod1.Items, edGod1.KeyItems);
//  edGod1.DropDownBox.Rows:=12;
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_MONTH',edNomerPeriod.Items, edNomerPeriod.KeyItems);
  CleateListDisk;
end;
//------------------------------------------------
destructor TfmChVigrZAH.Destroy;
begin
  FSprZAH.Free;
  inherited;
end;
//------------------------------------------------
procedure TfmChVigrZAH.WMDEVICECHANGE(var Msg: TMessage);
begin
{Заголовок сообщения}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CleateListDisk;
end;

//------------------------------------------------
procedure TfmChVigrZAH.RefreshListDisk;
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
procedure TfmChVigrZAH.CleateListDisk;
var
//  c : Char;
  s : String;
  n : Integer;
begin
  edDisk.Enabled := true;
  RefreshListDisk;
  s:=Trim(GlobalTask.ParamAsString('PATH_VIGR_ZAH'));
  if s='' then begin
    cbPath.Checked:=false;
    cbPath.Enabled:=false;
    if edDisk.Items.Count > 0 then begin
      s := GlobalTask.GetLastValueAsString('DISK_VIGR_ZAH');
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

procedure TfmChVigrZAH.GetStrDate( var strDate1, strDate2 : String; nType:Integer);
var
  s : String;
  strDay : String;
  n1, n2 : Integer;
begin
  if nType=0 then begin
    strDate1 := FormatDateTime('YYYYMMDD', edDate1.Value);
    strDate2 := FormatDateTime('YYYYMMDD', edDate2.Value);
  end else begin
    strDate1 := FormatDateTime('DDMMYYYY', edDate1.Value);
    strDate2 := FormatDateTime('DDMMYYYY', edDate2.Value);
  end;

{
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
  }
end;
{
procedure TfmChVigrZAH.GetDate( var d1, d2 : TDateTime);
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
}

//procedure TfmChVigrZags.CheckControl;
//begin
//end;

procedure TfmChVigrZAH.rbMonthClick(Sender: TObject);
begin
  edNomerPeriod.ItemIndex := -1;
//  edNomerPeriod.Enabled := true;
//  edNomerPeriod.Visible := true;
//  lbPer.Visible:=true;
//  lbGod1.Visible:=false;
//  edGod1.Visible:=false;
//  lbGod.Caption:='Год';
  edNomerPeriod.DropDownBox.Rows:=12;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_MONTH',edNomerPeriod.Items, edNomerPeriod.KeyItems);
end;

procedure TfmChVigrZAH.rbKvClick(Sender: TObject);
begin
  edNomerPeriod.ItemIndex := -1;
//  edNomerPeriod.Enabled := true;
  edNomerPeriod.Visible := true;
//  lbPer.Visible:=true;
//  lbGod1.Visible:=false;
//  edGod1.Visible:=false;
//  lbGod.Caption:='Год';
//  edNomerPeriod.DropDownBox.Rows:=4;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_KVART',edNomerPeriod.Items, edNomerPeriod.KeyItems);
end;

procedure TfmChVigrZAH.rbYearClick(Sender: TObject);
begin
  edNomerPeriod.ItemIndex := -1;
//  edNomerPeriod.Enabled := false;
  edNomerPeriod.Visible := false;
//  lbPer.Visible:=false;
//  lbGod1.Visible:=true;
//  edGod1.Visible:=true;
//  edGod1.Top:=edNomerPeriod.Top;
//  lbGod1.Top:=lbPer.Top;
//  lbGod.Caption:='Конечный год';
end;

procedure TfmChVigrZAH.UpdateActions;
begin
  inherited;
  if (edDate1.Value<>null) and (edDate2.Value<>null) and (edDate2.Value>=edDate1.Value) //and (YearOf(edDate1.Value)=YearOf(edDate2.Value))
    then btOk.Enabled := true
    else btOk.Enabled := false;

  {
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
  }
end;

procedure TfmChVigrZAH.edDiskEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edDisk.Text:='';
  edDisk.ItemIndex:=-1;
end;

procedure TfmChVigrZAH.cbPathClick(Sender: TObject);
begin
  edDisk.Enabled:=not cbPath.Checked;
end;

procedure TfmChVigrZAH.Button1Click(Sender: TObject);
begin
  if edDate1.Value<>null then edDate2.Value:=edDate1.Value;
end;

procedure TfmChVigrZAH.cbAllClick(Sender: TObject);
begin
  ListKlad.Enabled:=not cbAll.Checked;
end;

function TfmChVigrZAH.IsKladCheck(nID:Integer):Boolean;
var
  i:Integer;
begin
  Result:=false;
  for i:=0 to ListKlad.Items.Count-1 do begin
    if (Integer(ListKlad.Items.Objects[i])=nID) and ListKlad.Checked[i] then begin
      Result:=true;
      exit;
    end;
  end;
end;

procedure TfmChVigrZAH.btOkClick(Sender: TObject);
var
  i:Integer;
  lOk:Boolean;
begin
  lOk:=false;
  if cbAll.Checked then begin
    lOk:=true;
  end else begin
    for i:=0 to ListKlad.Items.Count-1 do begin
      if ListKlad.Checked[i] then begin
        lOk:=true;
        break;
      end;
    end;
    if not lOk then PutError('Не отмечено ни одно место захоронения');
  end;
  if lOk
    then ModalResult:=mrOK;
end;

initialization
  lFirstVigr:=true;
finalization

end.
