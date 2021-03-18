unit fChZagrZags;

interface

{$I Task.inc}

{$WARN SYMBOL_PLATFORM OFF}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, Variants,
  DBCtrlsEh, StdCtrls, Mask, Buttons, SasaIniFile, mVerInfo, ZipForge, Db, uTypes,
  adsdata, adsfunc, adstable, adscnnct, MetaTask, FileCtrl, fEditMemo, uProject,
  uUtilFiles, FuncPr, dbFunc, ifpii_dbfunc, uProjectAll, ExtCtrls,
  kbmMemTable;

type

  RecSvid=record
    SVID_TYPE:Integer;
    SVID_SERIA:String;
    SVID_NOMER:String;
    SVID_DATE:TDateTime;
    WHO_SVID:String;
    GISRN:Integer;
    Active:Boolean;
  end;
  ArrRecSvid=array of RecSvid;

  TfmChZagrZags = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    Label1: TLabel;
    cbChoice: TDBCheckBoxEh;
    edDisk: TDBComboBoxEh;
    edPath: TDBEditEh;
    AdsConnection: TAdsConnection;
    tbSource: TAdsTable;
    Zip: TZipForge;
    cbImitation: TDBCheckBoxEh;
    tbSourceBaseProp: TAdsTable;
    tbSourceBaseTextProp: TAdsTable;
    tbSourceHistZAGS: TAdsTable;
    tbSourceSvidPovtor: TAdsTable;
    tbSourceSprNames: TAdsTable;
    Query: TAdsQuery;
    memSeek: TkbmMemTable;
    memSeekID_ZAGS: TIntegerField;
    memSeekYEARZ: TIntegerField;
    memSeekNOMER: TIntegerField;
    memSeekAKT_TYPE: TIntegerField;
    cbCheckData: TDBCheckBoxEh;
    btHelp: TButton;
    cbType: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbChoiceClick(Sender: TObject);
    procedure edPathEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure btHelpClick(Sender: TObject);
  private
    FDefPath : String;
    IDZags : String;
    IDZagsFile:String;
    IDPODR:Integer;
    FType:Integer;
    FFromOblArxiv:Boolean;
    FListSvid:ArrRecSvid;
    FAllSeria:String;
    FCheckData:Boolean;
    FFromLais:Boolean;
  public
    procedure CreateListDisk;
    procedure CopyBaseFiles;
    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

    function CopyOneBaseFiles(strFileArxiv : String) : Integer;
    procedure ZagrGrnFiles(strFileArxiv : String);
    {$IFDEF ZAGS}
    procedure ZagrAlfFiles(strFileArxiv : String);
    {$ENDIF}
    function WriteProp(sAddText:String; nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
    function DeleteProp(nTypeObj:Integer; nID:Integer) : Boolean;
    function IsWriteSprNames:Boolean;
    procedure WriteToSprNames;
    procedure SetType(nType:Integer);
    function WriteOneRec(nTypeObj:Integer; tbSource:TAdsTable; tbDesc:TAdsTable) : Boolean;
    procedure CheckSeria(nTypeObj:Integer; ds:TDataSet);

  end;

  procedure RunZagrZags(nType:Integer=0);

implementation

uses dBase;

{$R *.DFM}


procedure RunZagrZags(nType:Integer);
var
  f : TfmChZagrZags;
begin
  f := TfmChZagrZags.Create(nil);
  f.SetType(nType);
  try
    if f.ShowModal = mrOk then begin
      f.CopyBaseFiles;
    end;
  finally
    f.Free;
  end;
end;

procedure TfmChZagrZags.SetType(nType:Integer);
begin
  FType:=nType;
  cbType.Visible:=false;
  if FType=1 then begin
    cbImitation.Visible:=false;
    cbCheckData.Visible:=false;
    btHelp.Visible:=false;
    cbCheckData.Checked:=false;
    Caption:='Сверка документов ЗАГС';
  end else if FType=2 then begin
    cbImitation.Visible:=false;
    cbCheckData.Checked:=true;
    cbCheckData.Visible:=false;
    cbType.Visible:=true;
    cbType.Top:=btHelp.Top;
    cbType.Left:=cbCheckData.Left;
    Caption:='Загрузка в алфавитную книгу';
    btHelp.Visible:=true;
  end else begin
    cbCheckData.Visible:=true;
    btHelp.Visible:=true;
    cbCheckData.Checked:=GlobalTask.GetLastValueAsBoolean('CHECKDATA_ZAGR_ZAGS');
  end;
end;

procedure TfmChZagrZags.CopyBaseFiles;
var
  lOk : Boolean;
  SearchRec: TSearchRec;
  strPath,s1,s2 : String;
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
        GlobalTask.SetLastValueAsString('PATH_ZAGR_ZAGS',edPath.Text);
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
    if FType=1 then begin
      s1:='*.svr';
      s2:='сверки';
    end else if FType=2 then begin
      s1:='*.alf';
      s2:='для загрузки в алфавитную книгу';
    end else begin  // 0
      s1:='*.zags';
      s2:='для загрузки з/а';
      GlobalTask.SetLastValueAsBoolean('CHECKDATA_ZAGR_ZAGS', cbCheckData.Checked);
    end;
    lOk := FindFirst(strPath + s1, faAnyFile, SearchRec) = 0;
    if lOk then begin
      repeat
        if (SearchRec.Name[1] <> '.') and
          (SearchRec.Attr and faVolumeID <> faVolumeID) and
          (SearchRec.Attr and faDirectory <> faDirectory) then begin
          if FType=1 then
            ZagrGrnFiles(strPath+SearchRec.Name)
          else if FType=2 then
            {$IFDEF ZAGS}
            ZagrAlfFiles(strPath+SearchRec.Name)
            {$ENDIF}
          else
            CopyOneBaseFiles(strPath+SearchRec.Name);
        end;
      until FindNext(SearchRec) <> 0;
    end else begin
      PutError(' Не найдено ни одного файла '+s2+' !  ');
    end;
    FindClose(SearchRec);
  end;
end;
//---------------------------------------------------------
function TfmChZagrZags.IsWriteSprNames:Boolean;
begin
  if (dmBase.SprNames.FieldByName('NAME').AsString<>tbSourceSprNames.FieldByName('NAME').AsString)
     and (Trim(tbSourceSprNames.FieldByName('NAME').AsString)<>'')
     and (Trim(tbSourceSprNames.FieldByName('NAME_B').AsString)<>'')
     and (Trim(tbSourceSprNames.FieldByName('SHTAMP').AsString)<>'')
    then Result:=true
    else Result:=false;
end;
//---------------------------------------------------------
procedure TfmChZagrZags.WriteToSprNames;
var
  fld:TField;
  s:String;
begin
  with dmBase.SprNames do begin
    FieldByName('NAME').AsString    := tbSourceSprNames.FieldByName('NAME').AsString;
    FieldByName('NAME_B').AsString  := tbSourceSprNames.FieldByName('NAME_B').AsString;
    FieldByName('KNAME').AsString   := tbSourceSprNames.FieldByName('KNAME').AsString;
    FieldByName('KNAME_B').AsString := tbSourceSprNames.FieldByName('KNAME_B').AsString;
    FieldByName('HANDLED').AsBoolean:= tbSourceSprNames.FieldByName('HANDLED').AsBoolean; // !!!
    if (FindField('SHTAMP')<>nil) and (tbSourceSprNames.FieldByName('SHTAMP')<>nil) then begin
      FieldByName('SHTAMP').AsString := tbSourceSprNames.FieldByName('SHTAMP').AsString;
    end;
    fld:=FindField('ZAGS_SELO');
    if (fld<>nil) then begin
      s:=Copy(tbSourceSprNames.FieldByName('SOATO').AsString,5,1);
      if fld.IsNull then fld.AsBoolean:=((s='8') or (s='7') or (s='6'));
    end;
  end;
end;

//---------------------------------------------------------
function TfmChZagrZags.CopyOneBaseFiles(strFileArxiv : String) : Integer;
var
  strDate1,strDate2 : String;
  i,j,nnn,nID : Integer;
  strPath,s,ss,sAkt : String;
  Ini : TSasaIniFile;
  VerInfo: TVerInfo;
  arrCountDok : array of Integer;
  arrCountAdd : array of Integer;
  arrCountIzm : array of Integer;
  fld : TField;
  strFieldName : String;
  slOpis, slType : TStringList;
  tbDesc : TAdsTable;
  strVer, strVerFile, strVerZAGS, sDateVigr, sTimeVigr, sType : String;
  nTypeObj, nTypeZags,nErr, nPodrFile, nPodr : Integer;
  ZagsName, s1,s2,strWhere,strSQL,strNameZags, strFilter, strNameFilter, strErr, strVerBase, strCurVer, sSOATO, sSoatoZAGS : String;
  lSeekVosstan, lIzm, lOk, lShowErr, lOnlySmert : Boolean;
  dDateVigr,dDate1,dDate2:TDateTime;
begin
  nTypeZags := dmBase.GetTypeZags;
  nErr := 0;
  slOpis := TStringList.Create;
  slType := TStringList.Create;
  lShowErr:=false;
  FFromOblArxiv:=false;
  FFromLais:=true;

  lIzm:=false;
//-------------- ??? перенесено ниже
  IDPodr := 0;
  strDate1:='';
  strDate2:='';
  strPath := ExtractFilePath(Application.ExeName)+'Export';
  ForceDirectories(strPath);
  ClearDir(strPath,false);
  AdsConnection.IsConnected := false;
  Query.SQL.Clear;
  Zip.FileName := strFileArxiv;
  Zip.BaseDir  := strPath;
  try
    Zip.OpenArchive;
    Zip.ExtractFiles('zags.ini');
  except
    Zip.CloseArchive;
    nErr := 1;
    strErr := 'Ошибка чтения файла загрузки: '+strFileArxiv;
  end;
  if nErr = 0 then begin
    VerInfo:=TVerInfo.Create(Application.ExeName);
    strVer := VerInfo.ProductVersion;
    VerInfo.Free;
    Ini := TSasaIniFile.Create(strPath+'\'+'zags.ini');
    sSoatoZags   := Copy(GlobalTask.ParamAsString('KOD'),1,4);
    IDZags       := GlobalTask.ParamAsString('ID');
    IDZagsFile   := Ini.ReadString('MAIN','ZAGS','');
    ZagsName     := Ini.ReadString('MAIN','ZAGS_NAME','');
    FFromOblArxiv:= (Ini.ReadString('MAIN','ARXIV','0')='1');

    FFromLais:= (Ini.ReadString('MAIN','LAIS','1')='1');

    strDate1    := Ini.ReadString('MAIN','DATE1','');
    strDate2    := Ini.ReadString('MAIN','DATE2','');
    strVerFile  := Ini.ReadString('MAIN','VERSION','');
    strVerZAGS  := Ini.ReadString('MAIN','VERSION_ZAGS','');
    strVerBase  := Ini.ReadString('MAIN','BASE','');
    s:=Ini.ReadString('MAIN','DATE','');
    try
      dDateVigr:=STOD(s, tdClipper);
      sDateVigr:=DatePropis(dDateVigr,3);
    except
     sDateVigr:='';
    end;
    sTimeVigr:=Ini.ReadString('MAIN','TIME','');

    FCheckData:=cbCheckData.Checked;
    s:=Ini.ReadString('MAIN','TYPE','');   // PERIOD  или  DATE_CHANGE
    if s<>'' then begin
      if s='PERIOD' then
        FCheckData:=false
      else if s='DATE_CHANGE' then
        FCheckData:=true;
    end;
    nPodrFile := 0;
    nPodr:=Globaltask.ParamAsInteger('PODR');
    lOnlySmert:=false;
    s := Trim(Ini.ReadString('MAIN','PODR',''));
    if (s='') or (s='0') then begin
      nPodrFile := 0;
    end else begin
      try
        nPodrFile := StrToInt(s);
      except
        nErr := 8;
        strErr := 'Ошибка определения номера подразделения.';
      end;
    end;
    if dmBase.OblArxivZAGS and (IDZagsFile=IDZags) then begin  // !!!   грузим из архива в свой же архив
      FFromOblArxiv:=false;
    end;
    {$IFDEF ZAGS}
    if nErr=0 then begin
      if dmBase.OblArxivZAGS then begin
        if FFromOblArxiv then begin  // информация пришла из обласного архива ЗАГС
          if IDZagsFile=IDZags then begin
            if nPodr=nPodrFile then begin
              nErr:=2;
              strErr:='Нельзя загружать собственные документы.'
            end;
          end else begin
            nErr := 2;  // нельзя загружать из архива в архив
            strErr:='нельзя загружать из архива в архив.';
          end;
        end;
      end else begin
        if FFromOblArxiv then begin  // информация пришла из обласного архива ЗАГС
          IDZagsFile:=Ini.ReadString('MAIN','ZAGS_SOURCE','');
          if IDZagsFile<>'' then begin
            if dmBase.SprNames.Locate('ID',IDZagsFile,[]) then begin
              strNameZags := dmBase.SprNames.FieldByName('NAME').AsString;
              dmBase.SprNames.First;
            end else begin
              nErr:=9;
            end;
          end else begin
            nErr:=9;
          end;
          if nErr=9
            then strErr:='Неизвестный ЗАГС поступил из архива ЗАГС.';
        end;
      end;
    end;
    {$ENDIF}

    if nErr=0 then begin
      //---- может выгрузили только смерти
      if nPodrFile>0 then begin
        if Ini.ReadInteger('MAIN','PODR_TYPEAKT',0)=_TypeObj_ZSmert then begin
          lOnlySmert:=true;
        end;
      end;

//      if Ini.ReadString('MAIN','VERSIONPROP','0')='1' then begin
//        lProp := true;
//      end else begin
//        lProp := false;
//      end;
      if (IDZags=IDZagsFile) and (nPodr=nPodrFile) then begin
        if not FFromOblArxiv then begin
          nErr := 2;  // нельзя загружать в себя самого
          strErr := 'Нельзя загружать собственные документы.';
        end;
      end;
    end;
    if nErr = 0 then begin
      if nTypeZags = ZAGS_OBL_ARXIV then begin // обастной архив ЗАГС загружает районы
        // загружаем подразделение собственного загс
        if (IDZags=IDZagsFile) and (nPodrFile>nPodr) and (nPodr=0) then begin
          IDPodr := nPodrFile;
        end;
        if dmBase.SprZAGS.Locate('ID',IDZagsFile,[]) then begin
          strNameZags := dmBase.SprZAGS.FieldByName('NAME').AsString;
          dmBase.SprZAGS.First;
        end else begin
          nErr := 3;
          strErr := 'Неизвестный ЗАГС из которого поступили документы'#13#10+
                    IDZagsFile+' '+ZagsName;
        end;
      end else begin
        // загружаем подразделение собственного загс
        if (IDZags=IDZagsFile) and (nPodrFile>nPodr) and (nPodr=0) then begin
          IDPodr := nPodrFile;
        end;
        // районный ЗАГС загружает из сельских советов  или ЗАГС
        if dmBase.SprNames.Locate('ID',IDZagsFile,[]) then begin
          strNameZags := dmBase.SprNames.FieldByName('NAME').AsString;
          dmBase.SprNames.First;
        end else begin
          nErr := 3;
          strErr := 'В справочнике организаций не найден ЗАГС из которого поступили документы:'#13#10+
                    IDZagsFile+' '+ZagsName;
        end;
      end;
    end;
    if nErr = 0 then begin
      if lOnlySmert then begin
        slOpis.AddObject('Акты смертей', dmBase.tbZapisSmert);
        slType.Add(IntToStr(dmBase.TypeObj_ZSmert));
        i:=1;
      end else begin
        slOpis.AddObject('Акты рождений', dmBase.tbZapisRogd);
        slOpis.AddObject('Акты смертей', dmBase.tbZapisSmert);
        slOpis.AddObject('Акты заключения браков', dmBase.tbZapisBrak);
        slOpis.AddObject('Акты установления отцовства', dmBase.tbZapisUstOtc);
        slType.Add(IntToStr(dmBase.TypeObj_ZRogd));
        slType.Add(IntToStr(dmBase.TypeObj_ZSmert));
        slType.Add(IntToStr(dmBase.TypeObj_ZBrak));
        slType.Add(IntToStr(dmBase.TypeObj_ZUstOtc));
        {$IFDEF ZAGS}
        if (nTypeZags=ZAGS_OBL_ARXIV) or (IDPodr>0) or FFromOblArxiv or not FFromLais then begin  // областной архив ЗАГС или собственное подразделение или ЗАГС
          slOpis.AddObject('Акты расторжения браков', dmBase.tbZapisRast);
          slOpis.AddObject('Акты усыновления', dmBase.tbZapisAdopt);
          slOpis.AddObject('Акты перемены ФИО', dmBase.tbZapisChName);
          slOpis.AddObject('Акты установления материнства', dmBase.tbZapisUstMat);
          slType.Add(IntToStr(dmBase.TypeObj_ZRast));
          slType.Add(IntToStr(dmBase.TypeObj_ZAdopt));
          slType.Add(IntToStr(dmBase.TypeObj_ZChName));
          slType.Add(IntToStr(dmBase.TypeObj_ZUstMat));
          i:=8;
        end else begin
          i:=4;
        end;
        {$ELSE}
          i:=4;
        {$ENDIF}
      end;
      SetLength(arrCountDok,i);
      SetLength(arrCountAdd,i);
      SetLength(arrCountIzm,i);
      for i:=0 to Length(arrCountDok)-1 do begin
        arrCountDok[i] := 0;
        arrCountAdd[i] := 0;
        arrCountIzm[i] := 0;
      end;
      Query.SQL.Clear;
      Query.SQL.Add(' select distinct ID_ZAGS from (');
      for i:=0 to slOpis.Count-1 do begin
        arrCountDok[i]:= Ini.ReadInteger('COUNT',TAdsTable(slOpis.Objects[i]).TableName,0);
        Query.SQL.Add(' select distinct ID_ZAGS from '+TAdsTable(slOpis.Objects[i]).TableName);
        Query.SQL.Add('  union all  ');
      end;
      Query.SQL.Strings[Query.SQL.Count-1]:=') aaa';
    end;
    Ini.Free;
  end;
  strFilter := '';
  strWhere  := '';
  strNameFilter := '';
  if nErr=0 then begin
    s := dmBase.GetVersionZAGS(true);
    if (strVerZAGS<>'') and (s<>'') then begin
      if strVerZAGS<>s then begin
        nErr := 7;
        strErr := '   Версии загс различны.   '+chr(13)+
                  '   Версия загс загружаемых данных: '+strVerZAGS+chr(13)+
                  '   Версия текущего загс: '+s;
      end;
    end else begin
      if strVerBase <> '' then begin
        strCurVer := dmBase.GetVersionBase(nil);
        if strVerBase <> strCurVer then begin
          nErr := 7;
          strErr := '   Версии баз различны.   '+chr(13)+
                    '   Версия базы загружаемых данных: '+strVerBase+chr(13)+
                    '   Версия текущей базы: '+strCurVer;
        end;
      end;
    end;
    if nErr=7 then begin  // несоответствие версий  !!!
      lShowErr:=true;
      PutError(strErr);
      if Problem('  Вы хотите продолжить загрузку ?  ') then begin
        nErr := 0;
        strErr := '';
      end;
    end;
  end;
  if nErr = 0 then begin
    if (strDate1='') and (strDate2='') then begin
      nErr := 4;
      strErr := 'Неизвестна дата выгрузки поступивших документов.';
    end else if strDate2='' then begin  // загружаем за год
      strFilter := 'Year(DATEZ)='+strDate1;
      strWhere  := 'Year(DATEZ)='+strDate1;
      strNameFilter := 'за '+strDate1+' год';
    end else begin
      dDate1:=STOD(strDate1);
      dDate2:=STOD(strDate2);
      strFilter := 'DATEZ>='+'STOD('+QStr(strDate1)+') .and. '+
                         'DATEZ<='+'STOD('+QStr(strDate2)+')';
      strWhere  := 'DATEZ>='+DateToSQL(dDate1)+' and '+ 'DATEZ<='+DateToSQL(dDate2);
      strNameFilter := 'c ' + FormatDateTime('dd.mm.yyyy',STOD(strDate1))+
                       ' по ' + FormatDateTime('dd.mm.yyyy',STOD(strDate2));
    end;
  end;

  if nErr=0 then begin
    s:='';
    if FFromOblArxiv then begin
      // если грузим из архива ЗАГС то удаляем просто за установленную дату
      ss:='записей акта из архива ЗАГС';
    end else begin
      ss:='записей акта';
      if nTypeZags=ZAGS_OBL_ARXIV then begin // для обастного архива ЗАГС будем фильтровать по полю ID_SOURCE
        strFilter := strFilter + ' .and. ID_SOURCE=' + IDZagsFile;
        strWhere  := strWhere + ' and ID_SOURCE=' + IDZagsFile;
        if (IDPodr>0) and (IDZags=IDZagsFile) then begin     // подразделение областного архива
          strFilter := strFilter + ' .and. PODR='+IntToStr(IDPodr);
          strWhere := strWhere + ' and PODR='+IntToStr(IDPodr);
          s := ' Подразделение : '+IntToStr(IDPodr)+#13;
        end;
      end else begin
//        strFilter := strFilter + ' .and. ID_ZAGS=' + IDZagsFile;
//  !!!      strWhere := strWhere + ' and ID_ZAGS=' + IDZagsFile;
        strFilter := strFilter + ' .and. ID_SOURCE=' + IDZagsFile;
        strWhere := strWhere + ' and ID_SOURCE=' + IDZagsFile;
        if IDPodr>0 then begin
          strFilter := strFilter + ' .and. PODR='+IntToStr(IDPodr);
          strWhere := strWhere + ' and PODR='+IntToStr(IDPodr);
          s := ' Подразделение : '+IntToStr(IDPodr)+#13;
        end;
      end;
    end;
    if FCheckData then begin
      sType:=AnsiLowerCase(cbCheckData.Caption);
    end else begin
      sType:='запись с передварительным удалением';
    end;
    if FCheckData<>cbCheckData.Checked
      then  sType:=sType+' (УКАЗАН В ФАЙЛЕ!)';
    if Problem('Будет произведена загрузка '+ss+'.'+#13+
               ' ЗАГС : '+strNameZags+#13+s+
               ' Период : '+strNameFilter+#13+
               ' Выгрузка произведена : '+sDateVigr+' '+sTimeVigr+#13+
               ' Тип : '+sType) then begin
    end else begin
      nErr:=-1;
      strErr := 'Отказ от загруки.';
    end;
  end;
  if nErr=0 then begin
    Zip.FileName := strFileArxiv;
    Zip.BaseDir  := strPath;
    OpenMessage('Извлечение информации из архива ...                  ','Загрузка');
    try
      ClearDir(strPath,false);
      Zip.OpenArchive;
      Zip.ExtractFiles('*.*');
    except
      CloseMessage;
      nErr := 5;
      strErr := 'Ошибка чтения загружаемых документов.';
      Zip.CloseArchive;
    end;
  end;
  if nErr = 0 then begin
    //---- соберем все серии свидетельств
    with dmBase.SvidSeria do begin
      First;
      FAllSeria:=';';
      while not Eof do begin
        FAllSeria:=FAllSeria+Trim(FieldByName('SERIA').AsString)+';';
        Next;
      end;
    end;
    //-----------------------------------
    AdsConnection.ConnectPath := strPath;
    AdsConnection.IsConnected := true;
    ChangeMessage('Поиск информации ...               ');

    tbSource.TableType := dmBase.tbZapisUstOtc.TableType;
    tbSource.AdsTableOptions.AdsCharType := dmBase.tbZapisUstOtc.AdsTableOptions.AdsCharType;

    try
      s := tbSourceBaseProp.TableName;
      tbSourceBaseProp.Open;
      s := tbSourceBaseTextProp.TableName;
      tbSourceBaseTextProp.Open;
      s := tbSourceHistZAGS.TableName;
      tbSourceHistZAGS.Open;
      s := tbSourceSvidPovtor.TableName;
      tbSourceSvidPovtor.Open;
        // справочник организаций грузим только если обласной архив
//        if nTypeZags = ZAGS_OBL_ARXIV then begin
        s := tbSourceSprNames.TableName;
        tbSourceSprNames.Open;
//        end;
    except
      nErr := 6;
      strErr := 'Ошибка открытия таблицы: '+s;
    end;

    if not dmBase.LoadSQL('Удаление_записей_актов', strSQL) then begin
      nErr:=10;
      strErr := 'Ошибка загрузки запроса на удаление.';
    end;
    if nErr=0 then begin
      if (nTypeZags=ZAGS_OBL_ARXIV) or (IDPodr>0) then begin  // если загружаем в областной архив загс или свое подразделение
        tbSourceSprNames.First;
        while not tbSourceSprNames.Eof do begin
          if not dmBase.SprNames.Locate('ID', tbSourceSprNames.FieldByName('ID').AsInteger,[]) then begin
            dmBase.SprNames.Append;
            dmBase.SprNames.FieldByName('ID').AsInteger   := tbSourceSprNames.FieldByName('ID').AsInteger;
            dmBase.SprNames.FieldByName('SOATO').AsString := tbSourceSprNames.FieldByName('SOATO').AsString;
            WriteToSprNames;
            dmBase.SprNames.Post;
          end else begin
            if nTypeZags=ZAGS_OBL_ARXIV then begin  // только если загружаем в областной архив загс
              if IsWriteSprNames then begin
                dmBase.SprNames.Edit;
                WriteToSprNames;
                dmBase.SprNames.Post;
              end;
            end;
          end;
          tbSourceSprNames.Next;
        end;
      end else if FFromOblArxiv then begin  // если грузим из областного архива ЗАГС  (возвращение записей в район!!!)
        Query.Open;  // ID всех ЗАГСов загружаемых данных
        while not Query.Eof do begin
          nID:=Query.Fields[0].AsInteger;
          if tbSourceSprNames.Locate('ID',nID, []) then begin
            if not dmBase.SprNames.Locate('ID', nID, []) then begin
              dmBase.SprNames.Append;
              dmBase.SprNames.FieldByName('ID').AsInteger   := tbSourceSprNames.FieldByName('ID').AsInteger;
              if dmBase.SprSoato.Locate('ID',nID,[])
                then sSoato:=dmBase.SprSoato.FieldByName('KOD').AsString
                else sSoato:=tbSourceSprNames.FieldByName('SOATO').AsString;;
              WriteToSprNames;
              dmBase.SprNames.Post;
            end;
          end;
          Query.Next;
        end;
        Query.Close;
      end else begin //-------------- если грузим из сельского совета ----------------------
        if tbSourceSprNames.Locate('ID',IDZagsFile, []) then begin
          if dmBase.SprNames.Locate('ID', IDZagsFile, []) then begin

            if dmBase.SprSoato.Locate('ID',IDZagsFile,[])
              then sSoato:=dmBase.SprSoato.FieldByName('KOD').AsString
              else sSoato:=tbSourceSprNames.FieldByName('SOATO').AsString;;

            dmBase.SprNames.Edit;
            if sSoato<>'' then // перезапишем код СОАТО
              dmBase.SprNames.FieldByName('SOATO').AsString:=sSOATO;
            WriteToSprNames;
            dmBase.SprNames.Post;
          end;
        end;
      end;

      //---------- контроль наличия данных ---------------
      {
      if FCheckData then begin
        for i:=0 to slOpis.Count-1 do begin
          tbDesc := TAdsTable(slOpis.Objects[i]);
          tbDesc.AdsTableOptions.AdsFilterOptions:=RESPECT_WHEN_COUNTING;
          tbSource.TableName := tbDesc.TableName;
          try
            tbSource.Open;
          except
            nErr := 6;
            strErr := 'Ошибка открытия таблицы: '+tbDesc.TableName;
            break;
          end;
          tbDesc.Filtered:=false;
          tbDesc.Filter := strFilter;
          tbDesc.Filtered:=true;
          tbDesc.RecordCount;

        end;

        if cbImitation.Checked
          then s :=' Имитация успешно завершена. '+#13+#13
          else s :=' Загрузка успешно завершена.   Загружено: '+#13+#13;
        for i:=0 to slOpis.Count-1 do begin
          s := s + slOpis.Strings[i] + '    -    ' + IntToStr(arrCountAdd[i]) + '  '+#13  ;
        end;
        ShowMessage(s);

      end;
      }
      // если не из ЛАИС и тип записи брак,смерть,рождение будем при поиске учитывать восстановлена или нет
      //-------------------------------------------------
      for i:=0 to slOpis.Count-1 do begin
        nnn:=0;
        nTypeObj:=StrToInt(slType.Strings[i]);
        if not FFromLais and ((nTypeObj=_TypeObj_ZBrak) or (nTypeObj=_TypeObj_ZRogd) or (nTypeObj=_TypeObj_ZSmert))
          then lSeekVosstan:=true else lSeekVosstan:=false;

        ChangeMessage(slOpis.Strings[i]+' ... ');

        tbDesc := TAdsTable(slOpis.Objects[i]);
        tbSource.TableName := tbDesc.TableName;
        try
          tbSource.Open;
        except
          nErr := 6;
          strErr := 'Ошибка открытия таблицы: '+tbDesc.TableName;
          break;
        end;
//                               Удаление_записей_актов.sql
        //------- удаление информации из базы  ----------------
        if not FCheckData then begin  // отключена "умная" загрузка
          ChangeMessage(slOpis.Strings[i]+'  удаление');
          s:=strSQL;
          s:=StringReplace(s, '&ADD_WHERE&', strWhere, [rfReplaceAll, rfIgnoreCase]);
          s:=StringReplace(s, '&TABLE_NAME&', tbDesc.TableName, [rfReplaceAll, rfIgnoreCase]);
          s:=StringReplace(s, '&TYPE_OBJ&', IntToStr(nTypeObj), [rfReplaceAll, rfIgnoreCase]);
          try
            GlobalTask.WriteToLogFile(s);
            dmBase.AdsConnection.Execute(s);
          except
            on E: Exception do begin
              PutError('Таблица: '+tbDesc.TableName+Chr(13)+
                       'Ошибка удаления информации'+Chr(13)+
                       E.Message);
              nErr:=6;
            end;
          end;
        end;
        if nErr>0 then break;
        //------------------------------------------------------
        ChangeMessage(slOpis.Strings[i]+'  загрузка');
        while not tbSource.Eof do begin
          SetLength(FListSvid,0);
          nnn:=nnn+1;
          lOk:=false;

          sAkt:=slOpis.Strings[i]+' ЗАГС '+tbSource.FieldByName('ID_ZAGS').AsString+' з/а №'+tbSource.FieldByName('NOMER').AsString+' '+datePropis(tbSource.FieldByName('DATEZ').AsDateTime,3);
          if FCheckData then begin  // включена "умная" загрузка
            s1:=tbSource.FieldByName('NOMER').AsString;
            s2:=tbSource.FieldByName('ID_ZAGS').AsString;
            dDate1:=GetDateField(tbSource.FieldByName('DATEZ'),0);
            // загс не введен вручную + заполнены номер,дата и орган регистрации
            if (s1<>'') and (s2<>'') and (dDate1>0) and (tbSource.FieldByName('NAME_ZAGS').AsString='') then begin
              if lSeekVosstan
                then lOk:=tbDesc.Locate('NOMER;DATEZ;ID_ZAGS;VOSSTAN',VarArrayOf([s1,dDate1,s2,tbSource.FieldByName('VOSSTAN').AsBoolean]),[])
                else lOk:=tbDesc.Locate('NOMER;DATEZ;ID_ZAGS',VarArrayOf([s1,dDate1,s2]),[]);
              if lOk then begin
                lIzm:=true;  // вывести количество измененных записей
                DeleteProp(nTypeObj, tbDesc.FieldByName('ID').AsInteger);
                arrCountIzm[i]:=arrCountIzm[i]+1;
              end;
            end;
          end;
          if lOk
            then tbDesc.Edit
            else tbDesc.Append;
          arrCountAdd[i]:=arrCountAdd[i]+1;
          //---------------------------------------
          try
            WriteOneRec(nTypeObj, tbSource, tbDesc);
            //---------------------------------------
            if cbImitation.Checked then begin
              tbDesc.Cancel;
            end else begin
              tbDesc.Post;
            end;
          except
            on E: Exception do begin
              PutError('Таблица: '+tbDesc.TableName+Chr(13)+
                      'ID1' +tbSource.FieldByName('ID').AsString+chr(13)+
                      'ID2' +tbDesc.FieldByName('ID').AsString+chr(13)+
                       'Ошибка записи'+Chr(13)+
                       E.Message);
              nErr:=6;
            end;
          end;
          try
            WriteProp(sAkt, tbSource.FieldByName('ID').AsInteger, tbDesc.FieldByName('ID').AsInteger, StrToInt(slType.Strings[i]))
          except
            on E: Exception do begin
              PutError('Тип объекта '+slType.Strings[i]+Chr(13)+
                       'ID Source ' +tbSource.FieldByName('ID').AsString+chr(13)+
                       'ID Desc ' +tbDesc.FieldByName('ID').AsString+chr(13)+
                       'Ошибка записи свойств'+Chr(13)+E.Message);
              nErr:=6;
            end;
          end;
          tbSource.Next;
          if nErr>0 then break;

          if nnn=100 then begin
            nnn:=0;
            ChangeMessage(slOpis.Strings[i]+'  '+IntToStr(arrCountAdd[i]));
          end;
        end;
        tbSource.Close;
        ChangeMessage(slOpis.Strings[i]+'  '+IntToStr(arrCountAdd[i]));
      end;
    end;
    tbSourceBaseProp.Active := false;
    tbSourceBaseTextProp.Active := false;
    tbSourceHistZAGS.Active := false;
    tbSourceSvidPovtor.Active := false;
//    if nTypeZags = ZAGS_OBL_ARXIV then begin
      tbSourceSprNames.Active := false;
//    end;

    AdsConnection.IsConnected:=false;

    CloseMessage;
  end;
//  ShowMessage(s);
  Result:=nErr;
  DeleteFiles(strPath+'\*.*');
  if nErr = 0 then begin
    if cbImitation.Checked
      then s :=' Имитация успешно завершена. '+#13+#13
      else s :=' Загрузка успешно завершена.   Загружено: '+#13+#13;
    for i:=0 to slOpis.Count-1 do begin
      if lIzm and (arrCountIzm[i]>0)
        then ss:='(заменено: '+IntToStr(arrCountIzm[i])+')'
        else ss:='';
      s := s + slOpis.Strings[i] + '    -    ' + IntToStr(arrCountAdd[i]) + '  '+ss+#13  ;
    end;
    ShowMessage(s);
  end else begin
    if not lShowErr
      then PutError(strErr);
  end;
  SetLength(arrCountDok,0);
  SetLength(arrCountAdd,0);
  SetLength(arrCountIzm,0);
  slOpis.Clear;
  slOpis.Free;
  slType.Free;
end;

//------------------------------------------------------------------------------------
function TfmChZagrZags.WriteOneRec(nTypeObj:Integer; tbSource:TAdsTable; tbDesc:TAdsTable) : Boolean;
var
  strFieldName:String;
  fld:TField;
  j:Integer;
begin
  Result:=true;

  CheckSeria(nTypeObj, tbSource);

  for j:=0 to tbSource.FieldCount-1 do begin
    strFieldName := tbSource.Fields[j].FieldName;
    if strFieldName='ID' then begin
      // не пишем т.к. AutoInc
    end else if strFieldName='DATEIZM' then begin
      try
        if FFromLais
          then tbDesc.FieldByName('DATEIZM').Value:=tbSource.FieldByName('DATEZ').Value
          else tbDesc.FieldByName('DATEIZM').Value:=tbSource.FieldByName('DATEIZM').Value;
      except
      end;
    end else if strFieldName='ID_SOURCE' then begin
      if FFromOblArxiv   // из области в район
        then tbDesc.FieldByName('ID_SOURCE').AsString:=tbSource.FieldByName('ID_ZAGS').AsString
        else tbDesc.FieldByName('ID_SOURCE').AsString:=IDZagsFile; // запишем ID ЗАГС из которого поступи данные
    end else if strFieldName='PODR' then begin
      // запишем PODR ЗАГС из которого поступи данные
      tbDesc.FieldByName('PODR').AsInteger:=IDPODR;
    end else begin
      fld := tbDesc.FindField(strFieldName);
      if (fld<>nil) then begin //and not tbSource.Fields[j].IsNull then begin
        try
          fld.Value:=tbSource.Fields[j].Value;
        except
          on E: Exception do begin
            Result:=false;
            PutError('Таблица: '+tbDesc.TableName+Chr(13)+
                     'Ошибка записи в поле: '+fld.FieldName+Chr(13)+
                     'Значение: "'+fld.AsString+'"'+Chr(13)+
                     E.Message);

          end;
        end;
      end;
    end;
  end;
  {
  if FFromOblArxiv then begin
    tbDesc.FieldByName('ID_ZAGS').AsString:=tbSource.FieldByName('ID_ZAGS').AsString;
  end else begin
//!!            if nTypeZags<>ZAGS_OBL_ARXIV then begin
      // !!! (уже не так) если загружаем не в областной архив загс, то в файле может быть только один орган загс
      // испарвлено 04.04.2016 т.к. в подразделении могут быть записи разных ЗАГСов
    tbDesc.FieldByName('ID_ZAGS').AsString:=tbSource.FieldByName('ID_ZAGS').AsString; // !!! IDZagsFile;
//!!            end else begin
      // перезапишем наименование органа из справочника
//!!              if IDZagsFile<>tbSource.FieldByName('ID_ZAGS').AsString then begin
//!!                if dmBase.SprNames.Locate('ID', tbSource.FieldByName('ID_ZAGS').AsInteger,[]) then begin
//!!                 tbDesc.FieldByName('NAME_ZAGS').AsString   := dmBase.SprNames.FieldByName('NAME').AsString;
//!!                 tbDesc.FieldByName('NAME_ZAGS_B').AsString := dmBase.SprNames.FieldByName('NAME').AsString;
//!!                end;
//!!              end;
//!!            end;
  end;
  }
end;
//------------------------------------------------------------------------------------
function TfmChZagrZags.DeleteProp(nTypeObj:Integer; nID:Integer) : Boolean;
var
  sSQL,s1,s2:String;
  n:Integer;
begin
  Result:=true;
  //----- соберем список повторных свидетельств ---------------------
  with dmBase.SvidPovtor do begin
    IndexName:='PR_KEY';
    SetRange([nTypeObj,nID],[nTypeObj,nID]);
    try
      while not Eof do begin
        s1:=Trim(FieldByName('SVID_NOMER').AsString);
        s2:=Trim(FieldByName('SVID_SERIA').AsString);
        if (s1<>'') and (s2<>'') then begin
          SetLength(FListSvid, Length(FListSvid)+1);
          n:=Length(FListSvid)-1;
          FListSvid[n].SVID_TYPE:=nTypeObj;
          FListSvid[n].SVID_NOMER:=s1;
          FListSvid[n].SVID_SERIA:=s2;
          FListSvid[n].SVID_DATE:=FieldByName('SVID_DATE').AsDateTime;
          FListSvid[n].WHO_SVID:=FieldByName('WHO_SVID').AsString;
          FListSvid[n].GISRN:=FieldByName('GISRN').AsInteger;
          FListSvid[n].Active:=true;
        end;
        Next;
      end;
    finally
      CancelRange;
    end;
  end;
  //------------------------------------------------------------------
  s1:=IntToStr(nTypeObj);
  s2:=IntToStr(nID);
  sSQL:='DELETE FROM BaseProp where typeobj='+s1+' and id='+s2+';'#13#10+
        'DELETE FROM BaseTextProp where typeobj='+s1+' and id='+s2+';'#13#10+
        'DELETE FROM HistoryZAGS where typeobj='+s1+' and id='+s2+';'#13#10+
        'DELETE FROM SvidPovtor where svid_type='+s1+' and akt_id='+s2+';'#13#10;
  dmBase.AdsConnection.Execute(sSQL);
end;
//------------------------------------------------------------------------------------
function TfmChZagrZags.WriteProp(sAddText:String;  nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
var
  fldD:TField;
  i:Integer;
  s:String;
  d:TDateTime;
begin                
  Result := true;
  d:=dmBase.GetDateCurrentSost;
  tbSourceBaseProp.IndexName := 'VIGR_KEY';
  tbSourceBaseProp.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  dmBase.tbSimpleProp.IndexName:='PR_KEY';  //TYPEOBJ;ID;DATES;POKAZ
  while not tbSourceBaseProp.Eof do begin
    with dmBase.tbSimpleProp do begin
      // проверка на наличие записи
      if Locate('TYPEOBJ;ID;DATES;POKAZ', VarArrayOf([nTypeObj,nIDDesc,d,tbSourceBaseProp.fieldByName('POKAZ').AsString]),[]) then begin
        Delete;
      end;
      try
        Append;
        FieldByName('TYPEOBJ').AsInteger := nTypeObj;
        FieldByName('ID').AsInteger := nIDDesc;
        FieldByName('DATES').AsDateTime := dmBase.GetDateCurrentSost;
        FieldByName('POKAZ').AsString := tbSourceBaseProp.fieldByName('POKAZ').AsString;
        FieldByName('VALUE').AsString := tbSourceBaseProp.fieldByName('VALUE').AsString;
        FieldByName('NVALUE').AsString := tbSourceBaseProp.fieldByName('NVALUE').AsString;
        FieldByName('TYPESAVE').AsString := tbSourceBaseProp.fieldByName('TYPESAVE').AsString;
        Post;
      except
        on E: Exception do begin
          Cancel;
          s:=sAddText+' ID='+IntToStr(nIDDesc)+' POKAZ='+tbSourceBaseProp.fieldByName('POKAZ').AsString;
          GlobalTask.WriteToLogFile(s);
          PutError('Ошибка записи в базу свойств');
        end;
      end;
    end;
    tbSourceBaseProp.Next;
  end;
  tbSourceBaseProp.CancelRange;

  tbSourceBaseTextProp.IndexName := 'VIGR_KEY';
  tbSourceBaseTextProp.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  dmBase.tbSimplePropMemo.IndexName:='PR_KEY';  //TYPEOBJ;ID;DATES;POKAZ
  while not tbSourceBaseTextProp.Eof do begin
    with dmBase.tbSimplePropMemo do begin
      // проверка на наличие записи
      if Locate('TYPEOBJ;ID;DATES;POKAZ', VarArrayOf([nTypeObj,nIDDesc,d,tbSourceBaseTextProp.fieldByName('POKAZ').AsString]),[]) then begin
        Delete;
      end;
      Append;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      FieldByName('DATES').AsDateTime := dmBase.GetDateCurrentSost;
      FieldByName('POKAZ').AsString := tbSourceBaseTextProp.fieldByName('POKAZ').AsString;
      FieldByName('VALUE').AsString := tbSourceBaseTextProp.fieldByName('VALUE').AsString;
      Post;
    end;
    tbSourceBaseTextProp.Next;
  end;
  tbSourceBaseTextProp.CancelRange;

  tbSourceHistZAGS.IndexName := 'VIGR_KEY';
  tbSourceHistZAGS.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
 // fldS:=tbSourceHistZAGS.FindField('INFO');
 // fldD:=dmBase.tbHistoryZAGS.FindField('INFO');
  while not tbSourceHistZAGS.Eof do begin
    with dmBase.tbHistoryZAGS do begin
      Append;
      for i:=0 to tbSourceHistZAGS.FieldCount-1 do begin
        fldD := FindField(tbSourceHistZAGS.Fields[i].FieldName);
        if (fldD<>nil) and not tbSourceHistZAGS.Fields[i].IsNull then begin
          try
            fldD.Value:=tbSourceHistZAGS.Fields[i].Value;
          except
            on E: Exception do begin
              PutError('Таблица: '+dmBase.tbHistoryZAGS.TableName+Chr(13)+
                       'Ошибка записи в поле: '+fldD.FieldName+Chr(13)+
                       'Значение: "'+fldD.AsString+'"'+Chr(13)+
                       E.Message);
            end;
          end;
        end;
      end;
      FieldByName('ID').AsInteger := nIDDesc;
      Post;
    end;
    tbSourceHistZAGS.Next;
  end;
  tbSourceHistZAGS.CancelRange;

  tbSourceSvidPovtor.IndexName := 'VIGR_KEY';
  tbSourceSvidPovtor.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not tbSourceSvidPovtor.Eof do begin
    with dmBase.SvidPovtor do begin
      for i:=0 to Length(FListSvid)-1 do begin
        if (FListSvid[i].SVID_SERIA=Trim(tbSourceSvidPovtor.FieldByName('SVID_SERIA').AsString)) and
           (FListSvid[i].SVID_NOMER=Trim(tbSourceSvidPovtor.FieldByName('SVID_NOMER').AsString)) then begin
          FListSvid[i].Active:=false;    // если нашли в загружаемой базе не будем восстанавливать
          break;
        end;
      end;

      Append;
      for i:=0 to tbSourceSvidPovtor.FieldCount-1 do begin
        fldD := FindField(tbSourceSvidPovtor.Fields[i].FieldName);
        if (fldD<>nil) and not tbSourceSvidPovtor.Fields[i].IsNull then begin
          try
            fldD.Value:=tbSourceSvidPovtor.Fields[i].Value;
          except
            on E: Exception do begin
              PutError('Таблица: '+dmBase.SvidPovtor.TableName+Chr(13)+
                       'Ошибка записи в поле: '+fldD.FieldName+Chr(13)+
                       'Значение: "'+fldD.AsString+'"'+Chr(13)+
                       E.Message);
            end;
          end;
        end;
      end;
      FieldByName('AKT_ID').AsInteger := nIDDesc;
      Post;

    end;
    tbSourceSvidPovtor.Next;
  end;
  tbSourceSvidPovtor.CancelRange;
  // дозапишем свидетельства ранее сохраненные в функции DeleteProp
  with dmBase.SvidPovtor do begin
    for i:=0 to Length(FListSvid)-1 do begin
      if FListSvid[i].Active then begin
        try
          Append;
          FieldByName('AKT_ID').AsInteger := nIDDesc;
          FieldByName('SVID_TYPE').AsInteger:=nTypeObj;
          FieldByName('SVID_SERIA').AsString:=FListSvid[i].SVID_SERIA;
          FieldByName('SVID_NOMER').AsString:=FListSvid[i].SVID_NOMER;
          FieldByName('SVID_DATE').AsDateTime:=FListSvid[i].SVID_DATE;
          FieldByName('WHO_SVID').AsString:=FListSvid[i].WHO_SVID;
          FieldByName('FIRST').AsBoolean:=false;
          if FListSvid[i].GISRN>0 then
            FieldByName('GISRN').AsInteger:=FListSvid[i].GISRN;
          Post;
        except
          on E: Exception do begin
            Cancel;
            s:=sAddText+' серия='+FListSvid[i].SVID_SERIA+
               ' номер='+FListSvid[i].SVID_NOMER+' дата='+datePropis(FListSvid[i].SVID_DATE,3);
            GlobalTask.WriteToLogFile(s);
            PutError('Ошибка записи в базу повторных свидетельств');
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmChZagrZags.WMDEVICECHANGE(var Msg: TMessage);
begin
{Заголовок сообщения}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CreateListDisk;
end;

//----------------------------------------------
procedure TfmChZagrZags.CreateListDisk;
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
    s := GlobalTask.GetLastValueAsString('DISK_ZAGR_ZAGS');
    edDisk.ItemIndex := 0;
    n := edDisk.Items.IndexOf(s);
    if n > -1 then begin
      edDisk.ItemIndex := n;
    end;
  end else begin
    edDisk.Enabled := false;
  end;
  FDefPath := GlobalTask.GetLastValueAsString('PATH_ZAGR_ZAGS');
  edPath.Enabled := false;
end;

procedure TfmChZagrZags.FormCreate(Sender: TObject);
begin
  CreateListDisk;
end;

procedure TfmChZagrZags.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(Zip);
end;

procedure TfmChZagrZags.cbChoiceClick(Sender: TObject);
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

procedure TfmChZagrZags.edPathEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  strDir : String;
begin
  Handled := true;
  if SelectDirectory('Выберите папку', '', strDir) then begin
    edPath.Text := strDir;
  end;
end;

procedure TfmChZagrZags.CheckSeria(nTypeObj:Integer; ds:TDataSet);
var
  sSeria,sSeria2:String;
  procedure AppendSvid(s:String);
  begin
    try
      dmBase.SvidSeria.Append;
      dmBase.SvidSeria.FieldByName('SERIA').AsString:=s;
      dmBase.SvidSeria.Post;
    except
      dmBase.SvidSeria.Cancel;
    end;
    FAllSeria:=FAllSeria+s+';';
  end;
begin
  sSeria2:='';
  if nTypeObj=_TypeObj_ZRast then begin  // повторные свид
    sSeria:=Trim(ds.FieldByName('ON_SVID_SERIA').AsString);
    sSeria2:=Trim(ds.FieldByName('ONA_SVID_SERIA').AsString);
  end else if nTypeObj=_TypeObj_ZUstOtc then begin
    sSeria:=Trim(ds.FieldByName('SVID_SERIA').AsString);
    if ds.FieldByName('TWO_SVID').AsBoolean
      then sSeria2:=Trim(ds.FieldByName('SVID_SERIA2').AsString);
  end else begin
    sSeria:=Trim(ds.FieldByName('SVID_SERIA').AsString);
  end;
  if (sSeria<>'') and (Pos(';'+Trim(sSeria)+';', FAllSeria)=0)
    then AppendSvid(sSeria);
  if (sSeria2<>'') and (Pos(';'+Trim(sSeria2)+';', FAllSeria)=0)
    then AppendSvid(sSeria2);
end;

//====== начало сверка =================================  file_svr
//---------------------------------------------------------
procedure TfmChZagrZags.ZagrGrnFiles(strFileArxiv : String);
var
  strDate1,strDate2 : String;
  i,nnn : Integer;
  strPath,s,ss : String;
  Ini : TSasaIniFile;
  arrCountDok : array of Integer;
  arrCountAdd : array of Integer;
  slOpis, slType : TStringList;
  IDZagsFile, strDateFile, strSQL_ZAGS : String;
  nTypeZags,nErr, nPodrFile, nPodr, IDPodr : Integer;
  strWhere,strNameZags, strFilter, strNameFilter, strErr : String;
  lShowErr,lOnlySmert : Boolean;
  dDate1,dDate2:TDateTime;
  nTypeObj:Integer;
  tbDesc:TAdsTable;
begin
  nTypeZags := dmBase.GetTypeZags;
  nErr := 0;
  slOpis := TStringList.Create;
  slType := TStringList.Create;
  lShowErr:=false;
  FFromOblArxiv:=false;
//-------------- ??? перенесено ниже
  IDPodr := 0;
  strDate1:='';
  strDate2:='';
  strPath := ExtractFilePath(Application.ExeName)+'Export';
  ForceDirectories(strPath);
  ClearDir(strPath,false);
  AdsConnection.IsConnected := false;
  Query.SQL.Clear;
  Zip.FileName := strFileArxiv;
  Zip.BaseDir  := strPath;
  try
    Zip.OpenArchive;
    Zip.ExtractFiles('file_svr.ini');
  except
    Zip.CloseArchive;
    nErr := 1;
    strErr := 'Ошибка чтения файла загрузки: '+strFileArxiv;
  end;
  if nErr = 0 then begin
    Ini := TSasaIniFile.Create(strPath+'\'+'file_svr.ini');
//    sSoatoZags   := Copy(GlobalTask.ParamAsString('KOD'),1,4);
    IDZags       := GlobalTask.ParamAsString('ID');
    IDZagsFile   := Ini.ReadString('MAIN','ZAGS','');
//    lFromOblArxiv:= (Ini.ReadString('MAIN','ARXIV','0')='1');

    {$IFDEF ZAGS}
    if dmBase.OblArxivZAGS then begin
      if FFromOblArxiv then begin  // информация пришла из обласного архива ЗАГС
        nErr := 2;  // нельзя загружать из архива в архив
        if IDZagsFile=IDZags
          then strErr:='Нельзя загружать собственные документы.'
          else strErr:='нельзя загружать из архива в архив.';
      end;
    end else begin               
      if FFromOblArxiv then begin  // информация пришла из обласного архива ЗАГС
        IDZagsFile:=Ini.ReadString('MAIN','ZAGS_SOURCE','');
        if IDZagsFile<>'' then begin
          if dmBase.SprNames.Locate('ID',IDZagsFile,[]) then begin
            strNameZags := dmBase.SprNames.FieldByName('NAME').AsString;
            dmBase.SprNames.First;
          end else begin
            nErr:=9;
          end;
        end else begin
          nErr:=9;
        end;
        if nErr=9
          then strErr:='Неизвестный ЗАГС поступил из архива ЗАГС.';
      end;
    end;
    {$ENDIF}

    strDate1    := Ini.ReadString('MAIN','DATE1','');
    strDate2    := Ini.ReadString('MAIN','DATE2','');
    strDateFile := Ini.ReadString('MAIN','DATE','');
    nPodrFile := 0;
    nPodr:=0;
    lOnlySmert:=false;
    strSQL_ZAGS:='';
    if nErr=0 then begin
      if (IDZags=IDZagsFile) and (nPodr=nPodrFile) then begin
        if not FFromOblArxiv then begin
          nErr := 2;  // нельзя загружать в себя самого
          strErr := 'Нельзя загружать собственные документы.';
        end;
      end;
    end;
    if nErr = 0 then begin
      if nTypeZags = ZAGS_OBL_ARXIV then begin // обастной архив ЗАГС загружает районы
        if dmBase.SprZAGS.Locate('ID',IDZagsFile,[]) then begin
          strNameZags := dmBase.SprZAGS.FieldByName('NAME').AsString;
          dmBase.SprZAGS.First;
        end else begin
          nErr := 3;
          strErr := 'Неизвестный ЗАГС из которого поступили документы.';
        end;
      end else begin
        // загружаем подразделение собственного загс
        if (IDZags=IDZagsFile) and (nPodrFile>nPodr) and (nPodr=0) then begin
          IDPodr := nPodrFile;
        end;
        // районный ЗАГС загружает из сельских советов
        if dmBase.SprNames.Locate('ID',IDZagsFile,[]) then begin
          strNameZags := dmBase.SprNames.FieldByName('NAME').AsString;
          dmBase.SprNames.First;
        end else begin
          nErr := 3;
          strErr := 'В справочнике организаций не найден ЗАГС из которого поступили документы.';
        end;
      end;
    end;
    if nErr = 0 then begin
      if lOnlySmert then begin
        slOpis.AddObject('Акты смертей', dmBase.tbZapisSmert);
        slType.Add(IntToStr(dmBase.TypeObj_ZSmert));
        i:=1;
      end else begin
        slOpis.AddObject('Акты рождений', dmBase.tbZapisRogd);
        slOpis.AddObject('Акты смертей', dmBase.tbZapisSmert);
        slOpis.AddObject('Акты заключения браков', dmBase.tbZapisBrak);
        slOpis.AddObject('Акты установления отцовства', dmBase.tbZapisUstOtc);
        slType.Add(IntToStr(dmBase.TypeObj_ZRogd));
        slType.Add(IntToStr(dmBase.TypeObj_ZSmert));
        slType.Add(IntToStr(dmBase.TypeObj_ZBrak));
        slType.Add(IntToStr(dmBase.TypeObj_ZUstOtc));
        {$IFDEF ZAGS}
        if (nTypeZags=ZAGS_OBL_ARXIV) or (IDPodr>0) then begin  // областной архив ЗАГС или собственное подразделение
          slOpis.AddObject('Акты расторжения браков', dmBase.tbZapisRast);
          slOpis.AddObject('Акты усыновления', dmBase.tbZapisAdopt);
          slOpis.AddObject('Акты перемены ФИО', dmBase.tbZapisChName);
          slOpis.AddObject('Акты установления материнства', dmBase.tbZapisUstMat);
          slType.Add(IntToStr(dmBase.TypeObj_ZRast));
          slType.Add(IntToStr(dmBase.TypeObj_ZAdopt));
          slType.Add(IntToStr(dmBase.TypeObj_ZChName));
          slType.Add(IntToStr(dmBase.TypeObj_ZUstMat));
          i:=8;
        end else begin
          i:=4;
        end;
        {$ELSE}
          i:=4;
        {$ENDIF}
      end;
      SetLength(arrCountDok,i);
      SetLength(arrCountAdd,i);
      for i:=0 to Length(arrCountDok)-1 do begin
        arrCountDok[i] := 0;
        arrCountAdd[i] := 0;
      end;
    end;
    Ini.Free;
  end;
  strFilter := '';
  strWhere  := '';
  strNameFilter := '';
  if nErr = 0 then begin
    if (strDate1='') and (strDate2='') then begin
      nErr := 4;
      strErr := 'Неизвестна дата выгрузки поступивших документов.';
    end else if strDate2='' then begin  // загружаем за год
      strFilter := 'Year(DATEZ)='+strDate1;
      strWhere  := 'Year(DATEZ)='+strDate1;
      strNameFilter := 'за '+strDate1+' год';
    end else begin
      dDate1:=STOD(strDate1);
      dDate2:=STOD(strDate2);
      strFilter := 'DATEZ>='+'STOD('+QStr(strDate1)+') .and. '+
                         'DATEZ<='+'STOD('+QStr(strDate2)+')';
      strWhere  := 'DATEZ>='+DateToSQL(dDate1)+' and '+ 'DATEZ<='+DateToSQL(dDate2);
      strNameFilter := 'c ' + FormatDateTime('dd.mm.yyyy',STOD(strDate1))+
                       ' по ' + FormatDateTime('dd.mm.yyyy',STOD(strDate2));
    end;
  end;

  if nErr=0 then begin
    s:='';
    ss:='записей акта';
    if nTypeZags=ZAGS_OBL_ARXIV then begin // для обастного архива ЗАГС будем фильтровать по полю ID_SOURCE
      strFilter := strFilter + ' .and. ID_SOURCE=' + IDZagsFile;
      strWhere  := strWhere + ' and ID_SOURCE=' + IDZagsFile;
    end else begin
      strFilter := strFilter + ' .and. ID_ZAGS=' + IDZagsFile;
      strWhere := strWhere + ' and ID_ZAGS=' + IDZagsFile;
      if IDPodr>0 then begin
        strFilter := strFilter + ' .and. PODR='+IntToStr(IDPodr);
        strWhere := strWhere + ' and PODR='+IntToStr(IDPodr);
        s := ' Подразделение : '+IntToStr(IDPodr)+#13;
      end;
    end;
  end;
  if nErr=0 then begin
    if Problem('Сверка взаимодействия с '+_GIS_+' '+ss+'.'+#13+
               ' ЗАГС : '+strNameZags+#13+s+
               ' период : '+strNameFilter) then begin
    end else begin
      nErr:=-1;
      strErr := 'Отказ от сверки.';
    end;
  end;  
  if nErr=0 then begin
    Zip.FileName := strFileArxiv;
    Zip.BaseDir  := strPath;
    OpenMessage('Извлечение информации из архива ...                  ','Загрузка');
    try
      ClearDir(strPath,false);
      Zip.OpenArchive;
      Zip.ExtractFiles('*.*');
    except
      CloseMessage;
      nErr := 5;
      strErr := 'Ошибка чтения загружаемых документов.';
      Zip.CloseArchive;
    end;
  end;
  if nErr = 0 then begin
    AdsConnection.ConnectPath := strPath;
    AdsConnection.IsConnected := true;
    ChangeMessage('Поиск информации ...               ');

    tbSource.TableType := dmBase.tbZapisUstOtc.TableType;
    tbSource.AdsTableOptions.AdsCharType := dmBase.tbZapisUstOtc.AdsTableOptions.AdsCharType;
    tbSource.TableName := 'file_svr.adt';
    try
      tbSource.Open;
    except
      nErr := 6;
      strErr := 'Ошибка открытия таблицы: '+tbSource.TableName;
    end;
    if nErr=0 then begin
      nnn:=0;
      while not tbSource.Eof do begin
        nTypeObj:=tbSource.FieldByName('TYPEOBJ').AsInteger;
        i:=slType.IndexOf(IntToStr(nTypeObj));
//        tbDesc:=dmBase.MainTableFromTypeObj(nTypeObj);
        tbDesc:=TAdsTable(slOpis.Objects[i]);
        if tbDesc.Locate('NOMER;DATEZ;ID_SOURCE',
             VarArrayOf([tbSource.FieldByName('NOMER').AsInteger, tbSource.FieldByName('DATEZ').AsDateTime, tbSource.FieldByName('ID_ZAGS').AsInteger]), []) then begin
          arrCountDok[i]:=arrCountDok[i]+1;
          if tbDesc.FieldByName('POLE_GRN').AsInteger<3000 then begin   // в базе ЗАГС не отмечено взаимодействие
            tbDesc.Edit;
            tbDesc.FieldByName('POLE_GRN').AsInteger:=tbSource.FieldByName('POLE_GRN').AsInteger;
            tbDesc.Post;
            arrCountAdd[i]:=arrCountAdd[i]+1;
          end;
        end;
        Inc(nnn,1);
        if nnn=100 then begin
          nnn:=0;
          ChangeMessage(slOpis.Strings[i]+'  '+IntToStr(arrCountAdd[i]));
        end;
        tbSource.Next;
      end;
      tbSource.Close;
    end;

    AdsConnection.IsConnected:=false;

    CloseMessage;
  end;
//  ShowMessage(s);
  DeleteFiles(strPath+'\*.*');
  if nErr = 0 then begin
    s:=' Сверка успешно завершена. '+#13+#13;
    for i:=0 to slOpis.Count-1 do begin
      s := s + slOpis.Strings[i] + ' -  найдено: '+IntToStr(arrCountDok[i])+' изменен статус: '+IntToStr(arrCountAdd[i]) + '  '+#13  ;
    end;
    ShowMessage(s);
  end else begin
    if not lShowErr
      then PutError(strErr);
  end;
  SetLength(arrCountDok,0);
  SetLength(arrCountAdd,0);
  slOpis.Clear;
  slOpis.Free;
  slType.Free;
end;
//====== конец  сверка =================================

//====== начало загрузки алфавитной книги =================================  file_alf
//---------------------------------------------------------
{$IFDEF ZAGS}
procedure TfmChZagrZags.ZagrAlfFiles(strFileArxiv : String);
var
  strDate1,strDate2 : String;
  i,nnn : Integer;
  strPath,s : String;
  Ini : TSasaIniFile;
  nZags,nYear,nNomer,nCountDok, nCountAdd, nCountErr : Integer;
//  slOpis, slType : TStringList;
  strDateFile, strSQL_ZAGS : String;
  IDZagsFile,nTA,nTypeZags,nErr, IDPodr : Integer;
  strWhere,strNameZags, strFilter, strNameFilter, strErr : String;
  lShowErr,lAdd : Boolean;
  dLoad:TDateTime;
  tbDesc:TAdsTable;
  arrFld:array of TField;
begin
  nTypeZags := dmBase.GetTypeZags;
  nErr := 0;
//  slOpis := TStringList.Create;
//  slType := TStringList.Create;
  lShowErr:=false;
  FFromOblArxiv:=false;
//-------------- ??? перенесено ниже
  nCountDok:=0;
  nCountAdd:=0;
  nCountErr:=0;
  IDZagsFile:=0;

  IDPodr:=0;
  dLoad:=Date;
  strDate1:='';
  strDate2:='';
  strPath := ExtractFilePath(Application.ExeName)+'Export';
  ForceDirectories(strPath);
  ClearDir(strPath,false);
  AdsConnection.IsConnected := false;
  Query.SQL.Clear;
  Zip.FileName := strFileArxiv;
  Zip.BaseDir  := strPath;
  try
    Zip.OpenArchive;
    Zip.ExtractFiles('file_alf.ini');
  except
    Zip.CloseArchive;
    nErr:=1;
    strErr:='Ошибка чтения файла загрузки: '+strFileArxiv;
  end;
  if dmBase.AlfavitZAGS.FindField('DATELOAD')=nil then begin
    nErr:=1;
    strErr:='Структура текущей базы не соответствует загружаемой информации';
  end;
  if nErr = 0 then begin
    Ini := TSasaIniFile.Create(strPath+'\'+'file_alf.ini');
    IDZags       := GlobalTask.ParamAsString('ID');
    IDZagsFile   := Ini.ReadInteger('MAIN','ZAGS',0);
//    IDZagsFile:=Ini.ReadString('MAIN','ZAGS_SOURCE','');
    if IDZagsFile<>0 then begin
      if dmBase.SprNames.Locate('ID',IDZagsFile,[]) then begin
        strNameZags := dmBase.SprNames.FieldByName('NAME').AsString;
        dmBase.SprNames.First;
      end else begin
        nErr:=9;
      end;
    end else begin
      nErr:=9;
    end;
    if nErr=9
      then strErr:='Неизвестный орган ЗАГС: '+IntToStr(IDZagsFile);
    strDate1    := Ini.ReadString('MAIN','DATE1','');
    strDate2    := Ini.ReadString('MAIN','DATE2','');
    strDateFile := Ini.ReadString('MAIN','DATE','');
    strSQL_ZAGS:='';
    Ini.Free;
  end;
  strFilter := '';
  strWhere  := '';
  strNameFilter := '';
  if nErr=0 then begin
    Zip.FileName := strFileArxiv;
    Zip.BaseDir  := strPath;
    OpenMessage('Извлечение информации из архива ...                  ','Загрузка');
    try
      ClearDir(strPath,false);
      Zip.OpenArchive;
      Zip.ExtractFiles('*.*');
    except
      CloseMessage;
      nErr := 5;
      strErr := 'Ошибка чтения загружаемых документов.';
      Zip.CloseArchive;
    end;
  end;
  if nErr = 0 then begin
    AdsConnection.ConnectPath := strPath;
    AdsConnection.IsConnected := true;
    ChangeMessage('Поиск информации ...               ');

    tbSource.TableType:=dmBase.tbZapisUstOtc.TableType;
    tbSource.AdsTableOptions.AdsCharType:=dmBase.tbZapisUstOtc.AdsTableOptions.AdsCharType;
    tbSource.TableName:= 'AlfavitZAGS.adt';
    try
      s:=tbSource.TableName;
      tbSource.Open;
      s:=tbSourceSprNames.TableName;
      tbSourceSprNames.Open;
    except
      nErr:=6;
      strErr:='Ошибка открытия таблицы: '+s;
    end;
    if nErr=0 then begin
      if (nTypeZags=ZAGS_OBL_ARXIV) or (IDPodr>0) then begin  // если загружаем в областной архив загс или свое подразделение
        tbSourceSprNames.First;
        while not tbSourceSprNames.Eof do begin
          if not dmBase.SprNames.Locate('ID', tbSourceSprNames.FieldByName('ID').AsInteger,[]) then begin
            dmBase.SprNames.Append;
            dmBase.SprNames.FieldByName('ID').AsInteger   := tbSourceSprNames.FieldByName('ID').AsInteger;
            dmBase.SprNames.FieldByName('SOATO').AsString := tbSourceSprNames.FieldByName('SOATO').AsString;
            WriteToSprNames;
            dmBase.SprNames.Post;
          end else begin
            if nTypeZags=ZAGS_OBL_ARXIV then begin  // только если загружаем в областной архив загс
              if IsWriteSprNames then begin
                dmBase.SprNames.Edit;
                WriteToSprNames;
                dmBase.SprNames.Post;
              end;
            end;
          end;
          tbSourceSprNames.Next;
        end;
      end;
      tbSourceSprNames.Close;
    end;
    if nErr=0 then begin
      GlobalTask.WriteToLogFile('Начало загрузки в алфавитную книгу, файл "'+strFileArxiv+'"');
      ChangeMessage('Загрузка ...');
      memSeek.Active:=true;
      memSeek.EmptyTable;
      nnn:=0;
      tbDesc:=dmBase.AlfavitZAGS;
      setLength(arrFld, tbDesc.FieldCount);
      for i:=0 to tbDesc.FieldCount-1 do  begin
        arrFld[i]:=tbSource.FindField(tbDesc.Fields[i].FieldName);
      end;
      while not tbSource.Eof do begin
        nTA:=tbSource.FieldByName('AKT_TYPE').AsInteger;
        nZags:=tbSource.FieldByName('ID_ZAGS').AsInteger;
        nYear:=tbSource.FieldByName('YEARZ').AsInteger;
        nNomer:=tbSource.FieldByName('NOMER').AsInteger;

        lAdd:=false;
        //---------- искать перед добавлением и заменять ----------------
        if cbType.ItemIndex=0 then begin
          lAdd:=true;
          // первый раз нужно удалить, т.к. может быть несколько записей в алфавитке для одной записи акта
          if not memSeek.Locate('AKT_TYPE;ID_ZAGS;YEARZ;NOMER', VarArrayOf([nTA,nZags, nYear, nNomer]), []) then begin
            if tbDesc.Locate('AKT_TYPE;ID_ZAGS;YEARZ;NOMER', VarArrayOf([nTA,nZags,nYear,nNomer]), []) then begin
               dmBase.AdsConnection.Execute(Format('DELETE FROM AlfavitZags WHERE akt_type=%d and id_zags=%d and yearz=%d and nomer=%d', [nTA,nZags,nYear,nNomer]));
            end;
            // запишем во временную таблицу что мы ее искали
            memSeek.Append;
            memSeekAKT_TYPE.AsInteger:=nTA;
            memSeekID_ZAGS.AsInteger:=nZags;
            memSeekYEARZ.AsInteger:=nYear;
            memSeekNOMER.AsInteger:=nNomer;
            memSeek.Post;
          end;
        //-------- добавлять если запись не найдена --------------
        end else if cbType.ItemIndex=1 then begin
          if not tbDesc.Locate('AKT_TYPE;ID_ZAGS;YEARZ;NOMER', VarArrayOf([nTA,nZags, nYear, nNomer]), []) then begin
            lAdd:=true;
          end;
        //-------- всегда просто добавлять  --------------
        end else if cbType.ItemIndex=2 then begin
          lAdd:=true;
        end;
        //------------------------------------------------
        Inc(nCountDok,1);
        if lAdd then begin
          tbDesc.Append;
          try
            for i:=0 to tbDesc.FieldCount-1 do  begin
              if (arrFld[i]<>nil) and (tbDesc.Fields[i].DataType<>ftAutoInc)
                then tbDesc.Fields[i].Value:=arrFld[i].Value;
            end;
            tbDesc.FieldByName('DATELOAD').AsDateTime:=dLoad;
            tbDesc.FieldByName('ID_SOURCE').AsInteger:=IDZagsFile;
            tbDesc.Post;
            Inc(nCountAdd,1);
          except
            on E: Exception do begin
              tbDesc.Cancel;
              Inc(nCountErr,1);
              GlobalTask.WriteToLogFile('Ошибка записи '+E.Message);
            end;
          end;
        end;
        Inc(nnn,1);
        if nnn=100 then begin
          nnn:=0;
          ChangeMessage('Обработано строк '+IntToStr(nCountDok));
        end;
        tbSource.Next;
      end;
      tbSource.Close;
    end;

    AdsConnection.IsConnected:=false;
    CloseMessage;
  end;
//  ShowMessage(s);
  DeleteFiles(strPath+'\*.*');
  if nErr=0 then begin
    s:=' Загрузка завершена. '+#13+
       ' Обработано '+IntToStr(nCountDok)+#13+
       ' Записано   '+IntToStr(nCountAdd)+#13+
       ' Ошибок     '+IntToStr(nCountErr);
    ShowMessage(s);
  end else begin
    if not lShowErr
      then PutError(strErr);
  end;
//  slOpis.Clear;
//  slOpis.Free;
//  slType.Free;
end;
//====== конец загрузки алфавитной книги =================================
{$ENDIF}
procedure TfmChZagrZags.btHelpClick(Sender: TObject);
var
  s:String;
begin
  if FType=2
    then s:='ZAGR_ALFAVIT'
    else s:='ZAGR_ZAGS';
  ShowHelp(s,nil,-1);
end;

end.


