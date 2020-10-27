unit fChZagrSpr;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uTypes,
  DBCtrlsEh, StdCtrls, Mask, Buttons, SasaIniFile, mVerInfo, ZipForge, Db,
  adsdata, adsfunc, adstable, adscnnct, MetaTask, FileCtrl,
  uUtilFiles, FuncPr, ToolEdit;

type

  TfmChZagrSpr = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    AdsConnection: TAdsConnection;
    tbSource: TAdsTable;
    Zip: TZipForge;
    tbSourceBaseProp: TAdsTable;
    tbSourceBaseTextProp: TAdsTable;
    tbSourceHistZAGS: TAdsTable;
    tbSourceSvidPovtor: TAdsTable;
    tbSourceSprNames: TAdsTable;
    Label3: TLabel;
    edPath: TDirectoryEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDefPath : String;
    IDZags : String;
  public
    procedure CreateListDisk;
    procedure CopyBaseFiles;
    function CopyOneBaseFiles(strFileArxiv : String) : Integer;
    function WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
  end;

  procedure RunZagrSpr;

implementation

uses dBase;

{$R *.DFM}


procedure RunZagrSpr;
var
  f : TfmChZagrSpr;
begin
  f := TfmChZagrSpr.Create(nil);
  try
    if f.ShowModal = mrOk then begin
      f.CopyBaseFiles;
    end;
  finally
    f.Free;
  end;
end;

procedure TfmChZagrSpr.CopyBaseFiles;
var
  lOk : Boolean;
  SearchRec: TSearchRec;
  strPath : String;
begin
  lOk := true;
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
  if lOk then begin
    lOk := FindFirst(strPath+'*.zip', faAnyFile, SearchRec) = 0;
    if lOk then begin
      repeat
        if (SearchRec.Name[1] <> '.') and
          (SearchRec.Attr and faVolumeID <> faVolumeID) and
          (SearchRec.Attr and faDirectory <> faDirectory) then begin
          CopyOneBaseFiles(strPath+SearchRec.Name);
        end;
      until FindNext(SearchRec) <> 0;
    end else begin
      PutError(' Не найдено ни одного файла для загрузки !  ');
    end;
    FindClose(SearchRec);
  end;
end;

function TfmChZagrSpr.CopyOneBaseFiles(strFileArxiv : String) : Integer;
var
  strDate1,strDate2 : String;
  i,j : Integer;
  strPath,s : String;
  Ini : TSasaIniFile;
  VerInfo: TVerInfo;
  arrCountDok : array of Integer;
  arrCountAdd : array of Integer;
  fld : TField;
  strFieldName : String;
  slOpis, slType : TStringList;
  tbDesc : TAdsTable;
  IDZagsFile, strVer, strVerFile, strVerZAGS, strDateFile : String;
  nTypeZags,nErr, nPodrFile, nPodr, IDPodr : Integer;
  strNameZags, strFilter, strNameFilter, strErr, strVerBase, strCurVer : String;
  lProp : Boolean;
begin
  nTypeZags := dmBase.GetTypeZags;
  lProp := true;
  nErr := 0;
  slOpis := TStringList.Create;
  slType := TStringList.Create;
//-------------- ??? перенесено ниже
  IDPodr := 0;
  strDate1:='';
  strDate2:='';
  strPath := ExtractFilePath(Application.ExeName)+'Export';
  ForceDirectories(strPath);
  ClearDir(strPath,false);
  AdsConnection.IsConnected := false;
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
    IDZags      := GlobalTask.ParamAsString('ID');
    IDZagsFile  := Ini.ReadString('MAIN','ZAGS','');
    strDate1    := Ini.ReadString('MAIN','DATE1','');
    strDate2    := Ini.ReadString('MAIN','DATE2','');
    strVerFile  := Ini.ReadString('MAIN','VERSION','');
    strVerZAGS  := Ini.ReadString('MAIN','VERSION_ZAGS','');
    strVerBase  := Ini.ReadString('MAIN','BASE','');
    strDateFile := Ini.ReadString('MAIN','DATE','');
    nPodrFile := 0;
    nPodr:=0;
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
    if nErr=0 then begin
      nPodr:=Globaltask.ParamAsInteger('PODR');
      if Ini.ReadString('MAIN','VERSIONPROP','0')='1' then begin
        lProp := true;
      end else begin
        lProp := false;
      end;
      if (IDZags=IDZagsFile) and (nPodr=nPodrFile) then begin
        nErr := 2;  // нельзя загружать в себя самого
        strErr := 'Нельзя загружать собственные документы.';
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
      slOpis.AddObject('Акты рождений', dmBase.tbZapisRogd);
      slOpis.AddObject('Акты смертей', dmBase.tbZapisSmert);
      slOpis.AddObject('Акты заключения браков', dmBase.tbZapisBrak);
      slOpis.AddObject('Акты установления отцовства', dmBase.tbZapisUstOtc);
      slType.Add(IntToStr(dmBase.TypeObj_ZRogd));
      slType.Add(IntToStr(dmBase.TypeObj_ZSmert));
      slType.Add(IntToStr(dmBase.TypeObj_ZBrak));
      slType.Add(IntToStr(dmBase.TypeObj_ZUstOtc));
      {$IFDEF ZAGS}
      if (nTypeZags = ZAGS_OBL_ARXIV) or (IDPodr>0) then begin  // областной архив ЗАГС или собственное подразделение
        slOpis.AddObject('Акты разводов', dmBase.tbZapisRast);
        slOpis.AddObject('Акты усыновления', dmBase.tbZapisAdopt);
        slOpis.AddObject('Акты смены имени', dmBase.tbZapisChName);
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
      SetLength(arrCountDok,i);
      SetLength(arrCountAdd,i);
      for i:=0 to Length(arrCountDok)-1 do begin
        arrCountDok[i] := 0;
        arrCountAdd[i] := 0;
      end;
      for i:=0 to slOpis.Count-1 do begin
        arrCountDok[i]:= Ini.ReadInteger('COUNT',TAdsTable(slOpis.Objects[i]).TableName,0);
      end;
    end;
    Ini.Free;
  end;
  strFilter := '';
  strNameFilter := '';
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
  if nErr = 0 then begin
    if (strDate1='') and (strDate2='') then begin
      nErr := 4;
      strErr := 'Неизвестна дата выгрузки поступивших документов.';
    end else if strDate2='' then begin  // загружаем за год
      strFilter := 'Year(DATEZ)='+strDate1;
      strNameFilter := 'за '+strDate1+' год';
    end else begin
      strFilter := 'DATEZ>='+'STOD('+QStr(strDate1)+') .and. '+
                         'DATEZ<='+'STOD('+QStr(strDate2)+')';
      strNameFilter := 'c ' + FormatDateTime('dd.mm.yyyy',STOD(strDate1))+
                       ' по ' + FormatDateTime('dd.mm.yyyy',STOD(strDate2));
    end;
  end;
  if nErr=0 then begin
    s:='';
    // для обастного архива ЗАГС будем фильтровать по полю ID_SOURCE
    if nTypeZags = ZAGS_OBL_ARXIV then begin
      strFilter := strFilter + ' .and. ID_SOURCE=' + IDZagsFile;
    end else begin
      strFilter := strFilter + ' .and. ID_ZAGS=' + IDZagsFile;
      if IDPodr>0 then begin
        strFilter := strFilter + ' .and. PODR='+IntToStr(IDPodr);
        s := ' Подразделение : '+IntToStr(IDPodr)+#13;
      end;
    end;
    if Problem('Будет произведена загрузка документов.'+#13+
               ' ЗАГС : '+strNameZags+#13+s+
               ' период : '+strNameFilter) then begin
    end else begin
      nErr:=-1;
      strErr := 'Отказ от загруки.';
    end;
  end;
  if nErr=0 then begin
    Zip.FileName := strFileArxiv;
    Zip.BaseDir  := strPath;
    OpenMessage('Извлечение информации из архива ...        ','Загрузка');
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
    ChangeMessage('Поиск информации ...    ');

    tbSource.TableType := dmBase.tbZapisUstOtc.TableType;
    tbSource.AdsTableOptions.AdsCharType := dmBase.tbZapisUstOtc.AdsTableOptions.AdsCharType;
    if lProp then begin
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
    end;
    if nErr=0 then begin
      // если загружаем в областной архив загс
      if nTypeZags = ZAGS_OBL_ARXIV then begin
        tbSourceSprNames.First;
        while not tbSourceSprNames.Eof do begin
          if not dmBase.SprNames.Locate('ID', tbSourceSprNames.FieldByName('ID').AsInteger,[]) then begin
            dmBase.SprNames.Append;
            dmBase.SprNames.FieldByName('ID').AsInteger   := tbSourceSprNames.FieldByName('ID').AsInteger;
            dmBase.SprNames.FieldByName('SOATO').AsString := tbSourceSprNames.FieldByName('SOATO').AsString;
          end else begin
            dmBase.SprNames.Edit;
          end;
          with dmBase.SprNames do begin
            FieldByName('NAME').AsString    := tbSourceSprNames.FieldByName('NAME').AsString;
            FieldByName('NAME_B').AsString  := tbSourceSprNames.FieldByName('NAME_B').AsString;
            FieldByName('KNAME').AsString   := tbSourceSprNames.FieldByName('KNAME').AsString;
            FieldByName('KNAME_B').AsString := tbSourceSprNames.FieldByName('KNAME_B').AsString;
            if (FindField('SHTAMP')<>nil) and (tbSourceSprNames.FieldByName('SHTAMP')<>nil) then begin
              FieldByName('SHTAMP').AsString := tbSourceSprNames.FieldByName('SHTAMP').AsString;
            end;
          end;
          dmBase.SprNames.Post;
          tbSourceSprNames.Next;
        end;
      end else begin // если грузим из сельского совета
        if tbSourceSprNames.Locate('ID',IDZagsFile, []) then begin
          if dmBase.SprNames.Locate('ID', IDZagsFile, []) then begin
            dmBase.SprNames.Edit;
            with dmBase.SprNames do begin
              FieldByName('NAME').AsString    := tbSourceSprNames.FieldByName('NAME').AsString;
              FieldByName('NAME_B').AsString  := tbSourceSprNames.FieldByName('NAME_B').AsString;
              FieldByName('KNAME').AsString   := tbSourceSprNames.FieldByName('KNAME').AsString;
              FieldByName('KNAME_B').AsString := tbSourceSprNames.FieldByName('KNAME_B').AsString;
              if (FindField('SHTAMP')<>nil) and (tbSourceSprNames.FieldByName('SHTAMP')<>nil) then begin
                FieldByName('SHTAMP').AsString := tbSourceSprNames.FieldByName('SHTAMP').AsString;
              end;
            end;
            dmBase.SprNames.Post;
          end;
        end;
      end;

      //---------- контроль наличия данных ---------------
      {
      if cbCheckData.Checked then begin
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
      //-------------------------------------------------

      for i:=0 to slOpis.Count-1 do begin
        tbDesc := TAdsTable(slOpis.Objects[i]);
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
  //      j:=0;
        // удаление информации из базы
        while not tbDesc.Eof do begin
  //        j:=j+1;
          if lProp then begin
            dmBase.DeletePropSimpleDok(tbDesc.FieldByName('ID').AsString, StrToInt(slType.Strings[i]));
          end;
          tbDesc.Delete;
        end;
  //      ShowMessage(strFilter + ' :    '+inttostr(j));
        tbDesc.Filtered:=false;
        tbDesc.Filter  := '';
        while not tbSource.Eof do begin
          tbDesc.Append;
          arrCountAdd[i] := arrCountAdd[i] + 1;
          for j:=0 to tbSource.FieldCount-1 do begin
            strFieldName := tbSource.Fields[j].FieldName;
            if strFieldName='ID' then begin
              // не пишем т.к. AutoInc
            end else if strFieldName='ID_SOURCE' then begin
              // запишем ID ЗАГС из которого поступи данные
              tbDesc.FieldByName('ID_SOURCE').AsString:=IDZagsFile;
            end else if strFieldName='PODR' then begin
              // запишем PODR ЗАГС из которого поступи данные
              tbDesc.FieldByName('PODR').AsInteger:=IDPODR;
            end else begin
              fld := tbDesc.FindField(strFieldName);
              if (fld<>nil) and not tbSource.Fields[j].IsNull then begin
                try
                  fld.Value:=tbSource.Fields[j].Value;
                except
                  on E: Exception do begin
                    PutError('Таблица: '+tbDesc.TableName+Chr(13)+
                             'Ошибка записи в поле: '+fld.FieldName+Chr(13)+
                             'Значение: "'+fld.AsString+'"'+Chr(13)+
                             E.Message);

                  end;
                end;
              end;
            end;
          end;
          // если загружаем не в областной архив загс, то в файле может быть только один орган загс
          if nTypeZags <> ZAGS_OBL_ARXIV then begin
            tbDesc.FieldByName('ID_ZAGS').AsString:=IDZagsFile;
          end else begin
            // перезапишем наименование органа из справочника
            if IDZagsFile<>tbSource.FieldByName('ID_ZAGS').AsString then begin
              if dmBase.SprNames.Locate('ID', tbSource.FieldByName('ID_ZAGS').AsInteger,[]) then begin
                tbDesc.FieldByName('NAME_ZAGS').AsString   := dmBase.SprNames.FieldByName('NAME').AsString;
                tbDesc.FieldByName('NAME_ZAGS_B').AsString := dmBase.SprNames.FieldByName('NAME').AsString;
              end;
            end;
          end;
          tbDesc.Post;
          if lProp then begin
            WriteProp(tbSource.FieldByName('ID').AsInteger,
                      tbDesc.FieldByName('ID').AsInteger,
                      StrToInt(slType.Strings[i]))
          end;

          tbSource.Next;
        end;
        tbSource.Close;
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
  Result := nErr;
  DeleteFiles(strPath+'\*.*');
  if nErr = 0 then begin
    s:=' Загрузка успешно завершена.   Загружено: '+#13+#13;
    for i:=0 to slOpis.Count-1 do begin
      s := s + slOpis.Strings[i] + '    -    ' + IntToStr(arrCountAdd[i]) + '  '+#13  ;
    end;
    ShowMessage(s);
  end else begin
    PutError(strErr);
  end;
  SetLength(arrCountDok,0);
  SetLength(arrCountAdd,0);
  slOpis.Clear;
  slOpis.Free;
  slType.Free;
end;

function TfmChZagrSpr.WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
begin
  Result := true;

  tbSourceBaseProp.IndexName := 'VIGR_KEY';
  tbSourceBaseProp.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not tbSourceBaseProp.Eof do begin
    with dmBase.tbSimpleProp do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      FieldByName('DATES').AsDateTime := dmBase.GetDateCurrentSost;
      FieldByName('POKAZ').AsString := tbSourceBaseProp.fieldByName('POKAZ').AsString;
      FieldByName('VALUE').AsString := tbSourceBaseProp.fieldByName('VALUE').AsString;
      FieldByName('NVALUE').AsString := tbSourceBaseProp.fieldByName('NVALUE').AsString;
      FieldByName('TYPESAVE').AsString := tbSourceBaseProp.fieldByName('TYPESAVE').AsString;
      Post;
    end;
    tbSourceBaseProp.Next;
  end;
  tbSourceBaseProp.CancelRange;

  tbSourceBaseTextProp.IndexName := 'VIGR_KEY';
  tbSourceBaseTextProp.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not tbSourceBaseTextProp.Eof do begin
    with dmBase.tbSimplePropMemo do begin
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
  while not tbSourceHistZAGS.Eof do begin
    with dmBase.tbHistoryZAGS do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      FieldByName('DATEIZM').AsDateTime := tbSourceHistZAGS.fieldByName('DATEIZM').AsDateTime;
      FieldByName('FIELDNAME').AsString := tbSourceHistZAGS.fieldByName('FIELDNAME').AsString;
      FieldByName('VALUE').AsString := tbSourceHistZAGS.fieldByName('VALUE').AsString;
      FieldByName('NOMER').AsString := tbSourceHistZAGS.fieldByName('NOMER').AsString;
      FieldByName('DATEZ').AsDateTime := tbSourceHistZAGS.fieldByName('DATEZ').AsDateTime;
      Post;
    end;
    tbSourceHistZAGS.Next;
  end;
  tbSourceHistZAGS.CancelRange;

  tbSourceSvidPovtor.IndexName := 'VIGR_KEY';
  tbSourceSvidPovtor.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not tbSourceSvidPovtor.Eof do begin
    with dmBase.SvidPovtor do begin
      Append;
      FieldByName('SVID_TYPE').AsInteger  := nTypeObj;
      FieldByName('AKT_ID').AsInteger     := nIDDesc;
      FieldByName('SVID_DATE').AsDateTime := tbSourceSvidPovtor.fieldByName('SVID_DATE').AsDateTime;
      FieldByName('SVID_SERIA').AsString  := tbSourceSvidPovtor.fieldByName('SVID_SERIA').AsString;
      FieldByName('SVID_NOMER').AsString  := tbSourceSvidPovtor.fieldByName('SVID_NOMER').AsString;
      FieldByName('NAME_ZAGS').AsString   := tbSourceSvidPovtor.fieldByName('NAME_ZAGS').AsString;
      FieldByName('NAME_ZAGS_B').AsString := tbSourceSvidPovtor.fieldByName('NAME_ZAGS_B').AsString;
      Post;
    end;
    tbSourceSvidPovtor.Next;
  end;
  tbSourceSvidPovtor.CancelRange;

end;

procedure TfmChZagrSpr.CreateListDisk;
  var
  c : Char;
  d : DWORD;
  s : String;
  n,i : Integer;
begin
{
  d := GetLogicalDrives;
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
  }
end;

procedure TfmChZagrSpr.FormCreate(Sender: TObject);
begin
  CreateListDisk;
end;

procedure TfmChZagrSpr.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(Zip);
end;

end.
