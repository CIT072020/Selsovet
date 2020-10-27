unit fChVigrOpeka;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, Variants, DateUtils,
  StdCtrls, Buttons, Mask, DBCtrlsEh, OpisEdit, MetaTask, FuncPr, ShellApi, uproject, uTypes,
  adscnnct, adstable, dBase, DataTask, ZipForge, FileCtrl, uUtilFiles, Db, mPermit,
  adsdata, adsfunc, sasaIniFile, mVerInfo, u2zags, uCreateXML, reportTask, uBase,
  frxClass, ExtCtrls, frxDBSet;

type
  TfmChVigrOpeka = class(TForm)
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
    tbDescSprNames: TAdsTable;
    Report: TfrxReport;
    Panel1: TPanel;
    Panel2: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    lbPer1: TLabel;
    Label3: TLabel;
    lbPer2: TLabel;
    edDisk: TDBComboBoxEh;
    cbPath: TDBCheckBoxEh;
    cbClear: TDBCheckBoxEh;
    rbAny: TRadioButton;
    edDate1: TDBDateTimeEditEh;
    edDate2: TDBDateTimeEditEh;
    Button1: TButton;
    frxSource: TfrxDBDataset;
    cbRequiredSend: TDBCheckBoxEh;
    lbPer: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure rbMonthClick(Sender: TObject);
    procedure rbKvClick(Sender: TObject);
    procedure edDiskEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure cbPathClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbRequiredSendClick(Sender: TObject);
  private
    FTypeVigr: Integer;
    procedure GetStrDate( var strDate1, strDate2 : String; nType:Integer);
//    procedure GetDate( var d1, d2 : TDateTime);
    procedure SetTypeVigr(const Value: Integer);
  public
    FListID:TStringList;
    FPath : String;
    FZAGS : Integer;
    IDPodr:String;
    nIDPodr:Integer;
    tbSource : TDataSet;
    property TypeVigr:Integer read FTypeVigr write SetTypeVigr;

    constructor Create( Owner : TComponent); override;
    procedure UpdateActions; override;
    procedure CleateListDisk;

    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

    procedure CheckRequired(l:Boolean);
    procedure RefreshListDisk;
    function GetDiskFree(strDisk : String) : Int64;
    procedure CopyBaseFiles(lAlfavit:Boolean; lOnlyHandle:Boolean);
    function WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
  end;

  procedure RunVigrOpeka(nType:Integer; sl:TStringList);

implementation

uses fMain, uProjectAll;

var
//  fmChVigrOpeka: TfmChVigrOpeka;
  lFirstVigr:Boolean;
  nNomerVigrDay:Integer;

{$R *.DFM}

{ TfmChVigrOpeka }

procedure RunVigrOpeka(nType:Integer; sl:TStringList);
var
  n:Integer;
  f:TfmChVigrOpeka;
begin
  f := TfmChVigrOpeka.Create(nil);
  f.FZAGS:=0;
  f.TypeVigr:=nType;      
  f.FListID:=sl;
  if (f.FListID<>nil) and (f.FListID.Count>0) then begin
    f.lbPer.Caption:='Выгрузка по отбору, в количестве: '+IntToStr(f.FListID.Count);
    f.lbPer.Visible:=false;
    f.lbPer1.Visible:=false;
    f.lbPer2.Visible:=false;
    f.edDate1.Visible:=false;
    f.edDate2.Visible:=false;
    f.Button1.Visible:=false;
    f.cbRequiredSend.Checked:=false;
    f.cbRequiredSend.Visible:=false;
  end else begin
    f.FListID:=nil;
  end;
  f.cbRequiredSend.Visible:=false;
  f.CheckRequired(f.cbRequiredSend.Checked);
  try
    if f.ShowModal = mrOk then begin
      f.CopyBaseFiles(false,false);
      nNomerVigrDay:=nNomerVigrDay+1;
    end;
  finally
    f.Free;
  end;
end;

procedure TfmChVigrOpeka.SetTypeVigr(const Value: Integer);
begin
  FTypeVigr := Value;
  if FTypeVigr=1 then begin
  end;
end;

procedure TfmChVigrOpeka.CheckRequired(l:Boolean);
begin
  lbPer.Enabled:=not l;
  lbPer1.Enabled:=not l;
  lbPer2.Enabled:=not l;
  edDate1.Enabled:=not l;
  edDate2.Enabled:=not l;
  Button1.Enabled:=not l;
end;

procedure TfmChVigrOpeka.FormCreate(Sender: TObject);
var
 s:String;
 n:Integer;
 d:TDateTime;
begin
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

procedure TfmChVigrOpeka.CopyBaseFiles(lAlfavit:Boolean; lOnlyHandle:Boolean);
var
  strVersion,strDate1,strDate2, strDisk, strPathCopy : String;
  dVigr,dDate1,dDate2:TDateTime;
  sl : TStringList;
  nLogSQL,i,j,nnn : Integer;
  n,m : Int64;
  strErr,strPath,s,IDZags,sTable : String;
  lCopy,lReport : Boolean;
  nFree : TLargeInteger;
  Ini : TSasaIniFile;
  VerInfo: TVerInfo;
  arrCountDok : array of Integer;
  fld : TField;
  sID, sTableName, strFieldName : String;
  slOpis, slType : TStringList;
  lOpenSourceAsQuery, lCloseMessage,lErr,lFTP:Boolean;
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
    if edDate1.Visible
      then Result:=Result+'_'+s1+'_'+s2+'_'+intToStr(nNomerVigrDay)+'.opeka'
      else Result:=Result+'_'+s1+'_'+intToStr(nNomerVigrDay)+'.opeka';
  end;
begin
  IDZags := GlobalTask.ParamAsString('ID');

  nLogSQL:=2;  // только в случае ошибки

  lCopy := false;
  slOpis := TStringList.Create;
  slType := TStringList.Create;
  slOpis.AddObject('Информация', dmBase.tbZapisOpeka);   // aktz
  slType.Add( IntToStr(_TypeObj_Opeka) );
  SetLength(arrCountDok, 1);

  strVersion:='1'; //dmBase.GetVersionOpeka(false);
  for i:=0 to Length(arrCountDok)-1 do begin
    arrCountDok[i]:= 0;
  end;
  strDate1:='';
  strDate2:='';
  if edDisk.Enabled and (edDisk.ItemIndex>-1) then begin
    GlobalTask.SetLastValueAsString('DISK_VIGR_OPEKA', edDisk.Items[edDisk.ItemIndex]);
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
{
    dmBase.ScriptForCreateTable( 'BaseProp', sl);
    sl.Add('CREATE INDEX VIGR_KEY ON BaseProp (TYPEOBJ,ID);');
    AdsConnection.Execute( sl.Text );

    dmBase.ScriptForCreateTable( 'BaseTextProp', sl);
    sl.Add('CREATE INDEX VIGR_KEY ON BaseTextProp (TYPEOBJ,ID);');
    AdsConnection.Execute( sl.Text );

    dmBase.ScriptForCreateTable( 'HistoryZAGS', sl);
    sl.Add('CREATE INDEX VIGR_KEY ON HistoryZAGS (TYPEOBJ,ID);');
    AdsConnection.Execute( sl.Text );

    dmBase.ScriptForCreateTable( 'SprNames', sl);
    AdsConnection.Execute( sl.Text );
}
    sl.Free;

//    tbDescSprNames.Open;
//    tbDescBaseProp.Open;
//    tbDescBaseTextProp.Open;
//    tbDescHistZAGS.Open;
    tbDesc.TableType := dmBase.tbZapisOpeka.TableType;
    tbDesc.AdsTableOptions.AdsCharType := dmBase.tbZapisOpeka.AdsTableOptions.AdsCharType;
    //------------------- запишем таблицу SprNames------------------------------
    {$IFDEF ZAGS}
      {
      dmBase.SprNames.First;
      while not dmBase.SprNames.Eof do begin
        //---------- только выбранные из справочника ------------
        if dmBase.SprNames.FieldByName('HANDLED').AsBoolean=false then begin
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
      dmBase.SprNames.First; }
    {$ELSE}
    {
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
      end;}
    {$ENDIF}
    dVigr:=Now;
    for i:=0 to slOpis.Count-1 do begin
      lOpenSourceAsQuery:=false;
      ChangeMessage(slOpis.Strings[i]+' сбор информации ... ');
      nnn:=0;
      sTableName:=TAdsTable(slOpis.Objects[i]).TableName;
      sID:='';
      GlobalTask.WriteToLogFile('Выгрузка информации по опеке.');
      if (FListID=nil) then begin
        tbSource:=TAdsTable(slOpis.Objects[i]);
        tbSource.Filtered:=false;
        if cbRequiredSend.Checked then begin
          tbSource.Filter:= Opeka_RequiredSendToGISRN;  // uProjectAll.pas;
        end else begin
          if strDate2='' then begin  // за год
            tbSource.Filter:='Year(DATEZ)='+strDate1;
          end else begin
            tbSource.Filter:='(DATEZ>='+'STOD('+QStr(strDate1)+') and DATEZ<='+'STOD('+QStr(strDate2)+')) or '+
                             '(DATE_EDIT_GIS>='+'STOD('+QStr(strDate1)+') and DATE_EDIT_GIS<='+'STOD('+QStr(strDate2)+'))';
          end;
        end;
        tbSource.Filtered:=true;
        tbSource.First;
        n:=0;
        while not tbSource.Eof do begin
          sID:=sID+tbSource.FieldByName('ID').AsString+',';
          tbSource.Next;
          Inc(n,1);
        end;
        GlobalTask.WriteToLogFile('filter('+inttostr(n)+'): '+tbSource.Filter);
        tbSource.Filtered:=false;
        tbSource.First;
      end else begin
        GlobalTask.WriteToLogFile('установлен отбор в реестве, количество='+inttostr(FListID.Count));
        for j:=0 to FListID.Count-1 do begin
          sID:=sID+FListID.Strings[j]+',';
        end;
      end;
      //==================================
      if sID<>'' then begin
        sID:=Copy(sID,1,Length(sID)-1);
        tbSource:=OpenWorkQuery('SELECT * FROM '+sTableName+' WHERE id in ('+sID+') ORDER BY FAMILIA,NAME,OTCH,IDENTIF,DATEZ', strErr, nLogSQL);
        lOpenSourceAsQuery:=true;

        tbDesc.TableName:=sTableName; //  tbSource.TableName;
        tbDesc.Open;
        ChangeMessage(slOpis.Strings[i]+'  выгрузка ... ');

  //      ShowMessage(tbSource.Filter+'  '+IntToStr(tbSource.RecordCount));
        while not tbSource.Eof do begin
          tbDesc.Append;
          arrCountDok[i] := arrCountDok[i] + 1;
          nnn:=nnn+1;
          for j:=0 to tbDesc.FieldCount-1 do begin
            strFieldName := tbDesc.Fields[j].FieldName;
            if strFieldName='ID' then begin
              // не пишем т.к. AutoInc
            end else if strFieldName='DATE_VIGR' then begin
              // ???
            end else if strFieldName='DATE_ZAGR' then begin
              // ???
            end else if strFieldName='ID_SOURCE' then begin
              // теперь будем писать ID_ZAGS откуда идут данные (ID где реально выписано),
              //  сельсовет->район ID_ZAGS,ID_SOURCE будут совпадать
              //  район->обл.архив ID_ZAGS,ID_SOURCE не всегда будут совпадать
  //            tbDesc.FieldByName('ID_SOURCE').AsString:=tbDesc.FieldByName('ID_SOURCE').AsString;
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
          tbDesc.FieldByName('ID_ZAGS').AsString  :=IDZags;
          tbDesc.FieldByName('ID_SOURCE').AsString:=tbSource.FieldByName('ID').AsString;  // !!!
          tbDesc.Post;

          if not ConnectExecuteM('UPDATE '+sTableName+' SET date_vigr='+DateToSQL(dVigr)+' WHERE id='+tbSource.FieldByName('ID').AsString, strErr, nLogSQL) then begin

          end;

          {
          WriteProp(tbSource.FieldByName('ID').AsInteger,
                    tbDesc.FieldByName('ID').AsInteger,
                    StrToInt(slType.Strings[i]) );
           }
          if nnn=100 then begin
            nnn:=0;
            ChangeMessage(slOpis.Strings[i]+'  ' +IntToStr(arrCountDok[i]));
          end;
          tbSource.Next;
        end;

        ChangeMessage(slOpis.Strings[i]+'  ' +IntToStr(arrCountDok[i]));
        tbDesc.Close;

        frxSource.DataSet:=tbSource;
        GlobalTask.WorkReport(Role.SystemAdmin, '&Опека_Выгрузка.fr3');

        tbSource.Filter:='';
        tbSource.Filtered:=false;
        if lOpenSourceAsQuery
          then tbSource.Close;
      end;
      //==================================
    end;
//    tbDescSprNames.Close;
//    tbDescBaseProp.Close;
//    tbDescBaseTextProp.Close;
//    tbDescHistZAGS.Close;
    AdsConnection.IsConnected:=false;
    j := 0;
    for i:=0 to slOpis.Count-1 do begin
      j := j + arrCountDok[i];
    end;
    if j = 0 then begin
      ShowMessage('  Не найдено ни одного документа для копирования !  ');
      lErr:=true;
    end;
    if j > 0 then begin
      if edDate1.Visible
        then GlobalTask.SetLastValueAsDate('DATE_VIGR_PODR', edDate2.Value);
      Ini := TSasaIniFile.Create(strPath+'\'+'opeka.ini');
      Ini.WriteString('MAIN','ARXIV','0');
      Ini.WriteString('MAIN','ORGAN',GlobalTask.ParamAsString('ID'));      // откуда выгружено
      Ini.WriteString('MAIN','NAME',GlobalTask.ParamAsString('NAME'));   // название откуда выгружено
      Ini.WriteString('MAIN','DATE',DTOS(dmBase.getCurDate,tdClipper));
      Ini.WriteString('MAIN','TIME',FormatDateTime('hh:nn',Now));
      Ini.WriteString('MAIN','DATE1',strDate1);
      Ini.WriteString('MAIN','DATE2',strDate2);
      VerInfo:=TVerInfo.Create(Application.ExeName);
      Ini.WriteString('MAIN','VERSION',VerInfo.ProductVersion);
      Ini.WriteInteger('MAIN','VERSION_VIGR',VersionVigrOpeka);  // VersionVigrOpeka определено в uTypes.pas
      Ini.WriteString('MAIN','BASE',dmBase.GetVersionBase(nil));
      Ini.WriteString('MAIN','PODR',IDPodr);

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
        if cbPath.Checked then begin
          strPathCopy:=Trim(GlobalTask.ParamAsString('PATH_VIGR_OPEKA'));
          if MySameText('ftp', strPathCopy)
            then lFTP:=true;
          if (strPathCopy<>'') and not lFTP then strPathCopy:=CheckSleshN(strPathCopy);
        end else begin
          strPathCopy:='';
        end;
      end;

      if strPathCopy=''
        then strPathCopy:=ExtractFilePath(Application.ExeName)+'Выгрузка\';


      if strPathCopy<>'' then begin
        if not lFTP then begin
          ForceDirectories(strPathCopy);
          if lFirstVigr then begin //and (strDisk<>'') then begin  // копируем на диск
            DeleteFiles(strPathCopy+'*.opeka');
            lFirstVigr:=false;
          end else begin
            DeleteFile(strPathCopy+GetNameFile);
          end;
          ChangeMessage('Копирование файла ...');
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
              PutError('Ошибка копирования файла : '+strPath+'\'+GetNameFile+#13+'в папку '+strPathCopy+
                      #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
              lErr:=true;
            end;

          end;
        end;
      end;
      s:='';

//      if lReport then begin
//      end;

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

  if not lErr then begin
    if lFTP then begin
      if SetPropertyFPT(fmmain.IdFTP1, SERVER_OPEKA, '') then begin
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

function TfmChVigrOpeka.WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
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

end;

function TfmChVigrOpeka.GetDiskFree(strDisk : String) : TLargeInteger;
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

constructor TfmChVigrOpeka.Create(Owner: TComponent);
begin
  inherited;
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_YEARS',edGod.Items, edGod.KeyItems);
//  edGod.DropDownBox.Rows:=12;
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_YEARS',edGod1.Items, edGod1.KeyItems);
//  edGod1.DropDownBox.Rows:=12;
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_MONTH',edNomerPeriod.Items, edNomerPeriod.KeyItems);
  CleateListDisk;
end;

//------------------------------------------------
procedure TfmChVigrOpeka.WMDEVICECHANGE(var Msg: TMessage);
begin
{Заголовок сообщения}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CleateListDisk;
end;

//------------------------------------------------
procedure TfmChVigrOpeka.RefreshListDisk;
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
procedure TfmChVigrOpeka.CleateListDisk;
var
//  c : Char;
  s : String;
  n : Integer;
begin
  edDisk.Enabled := true;
  RefreshListDisk;
  s:=Trim(GlobalTask.ParamAsString('PATH_VIGR_OPEKA'));
  if s='' then begin
    cbPath.Checked:=false;
    cbPath.Enabled:=false;
    if edDisk.Items.Count > 0 then begin
      s := GlobalTask.GetLastValueAsString('DISK_VIGR_OPEKA');
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

procedure TfmChVigrOpeka.GetStrDate( var strDate1, strDate2 : String; nType:Integer);
var
  s : String;
  strDay : String;
  n1, n2 : Integer;
begin
  if edDate1.Visible then begin
    if nType=0 then begin
      strDate1 := FormatDateTime('YYYYMMDD', edDate1.Value);
      strDate2 := FormatDateTime('YYYYMMDD', edDate2.Value);
    end else begin
      strDate1 := FormatDateTime('DDMMYYYY', edDate1.Value);
      strDate2 := FormatDateTime('DDMMYYYY', edDate2.Value);
    end;
  end else begin
    strDate1 := FormatDateTime('YYYYMMDD', Now);
    strDate2 := FormatDateTime('YYYYMMDD', Now);
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
procedure TfmChVigrOpeka.GetDate( var d1, d2 : TDateTime);
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

procedure TfmChVigrOpeka.rbMonthClick(Sender: TObject);
begin
//  edNomerPeriod.ItemIndex := -1;
//  edNomerPeriod.Enabled := true;
//  edNomerPeriod.Visible := true;
//  lbPer.Visible:=true;
//  lbGod1.Visible:=false;
//  edGod1.Visible:=false;
//  lbGod.Caption:='Год';
//  edNomerPeriod.DropDownBox.Rows:=12;
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_MONTH',edNomerPeriod.Items, edNomerPeriod.KeyItems);
end;

procedure TfmChVigrOpeka.rbKvClick(Sender: TObject);
begin
//  edNomerPeriod.ItemIndex := -1;
//  edNomerPeriod.Enabled := true;
//  edNomerPeriod.Visible := true;
//  lbPer.Visible:=true;
//  lbGod1.Visible:=false;
//  edGod1.Visible:=false;
//  lbGod.Caption:='Год';
//  edNomerPeriod.DropDownBox.Rows:=4;
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_KVART',edNomerPeriod.Items, edNomerPeriod.KeyItems);
end;

procedure TfmChVigrOpeka.UpdateActions;
var
  l:Boolean;
begin
  inherited;
  l:=true;
  if (FListID=nil) then begin
    if not cbRequiredSend.Checked then begin
      if (edDate1.Value<>null) and (edDate2.Value<>null) and (edDate2.Value>=edDate1.Value) //and (YearOf(edDate1.Value)=YearOf(edDate2.Value))
        then l:=true
        else l:=false;
    end;
  end;
  if l<>btOk.Enabled
    then btOk.Enabled:=l;     
end;

procedure TfmChVigrOpeka.edDiskEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edDisk.Text:='';
  edDisk.ItemIndex:=-1;
end;

procedure TfmChVigrOpeka.cbPathClick(Sender: TObject);
begin
  edDisk.Enabled:=not cbPath.Checked;
end;

procedure TfmChVigrOpeka.Button1Click(Sender: TObject);
begin
  if edDate1.Value<>null then edDate2.Value:=edDate1.Value;
end;

procedure TfmChVigrOpeka.cbRequiredSendClick(Sender: TObject);
begin
  CheckRequired(cbRequiredSend.Checked);
end;

initialization
  lFirstVigr:=true;
  nNomerVigrDay:=1;
finalization

end.
