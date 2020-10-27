unit fChZagrOpeka;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, fWarning,
  DBCtrlsEh, StdCtrls, Mask, Buttons, SasaIniFile, mVerInfo, ZipForge, Db, uTypes, uProjectAll,
  adsdata, adsfunc, adstable, adscnnct, MetaTask, FileCtrl, Variants,
  uUtilFiles, FuncPr, ifpii_dbfunc;

type

  TfmChZagrOpeka = class(TForm)
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
    cbCheckData: TDBCheckBoxEh;
    Query: TAdsQuery;
    procedure FormCreate(Sender: TObject);
    procedure cbChoiceClick(Sender: TObject);
    procedure edPathEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    FDefPath : String;
    IDZah : String;
  public
    procedure CreateListDisk;
    procedure CopyBaseFiles;
    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

    function CopyOneBaseFiles(strFileArxiv : String) : Integer;
    function WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
    procedure WriteToSprNames;

  end;

  procedure RunZagrOpeka;

implementation

uses dBase;

{$R *.DFM}


procedure RunZagrOpeka;
var
  f : TfmChZagrOpeka;
begin
  f := TfmChZagrOpeka.Create(nil);
  try
    if f.ShowModal = mrOk then begin
      f.CopyBaseFiles;
    end;
  finally
    f.Free;
  end;
end;

procedure TfmChZagrOpeka.CopyBaseFiles;
var
  lOk : Boolean;
  SearchRec: TSearchRec;
  strPath : String;
begin
  lOk := true;
  if cbChoice.Checked then begin
    if edPath.Text <> '' then begin
      strPath := CheckSleshN(edPath.Text);
      if strPath = ExtractFilePath(Application.ExeName)+'Export\' then begin
        PutError(' Файлы для загрузки не должны находиться по пути: '+#13+ExtractFilePath(Application.ExeName)+'Export');
        lOk := false;
      end else begin
        GlobalTask.SetLastValueAsString('PATH_ZAGR_OPEKA',edPath.Text);
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
    lOk := FindFirst(strPath+'*.opeka', faAnyFile, SearchRec) = 0;
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
//---------------------------------------------------------
procedure TfmChZagrOpeka.WriteToSprNames;
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
  end;
end;
//---------------------------------------------------------
function TfmChZagrOpeka.CopyOneBaseFiles(strFileArxiv : String) : Integer;
var
  strDate1,strDate2 : String;
  nVid,i,j,nnn,nID,nVerFile,nCount : Integer;
  sIN1, sIN2, strPath,s,ss : String;
  Ini : TSasaIniFile;
  VerInfo: TVerInfo;
  arrCountDok : array of Integer;
  arrCountAdd : array of Integer;
  fld : TField;
  strFieldName : String;
  slOpis, slType : TStringList;
  tbDesc : TAdsTable;
  IDZAHFile, strVer, strDateFile, strSQL_ZAGS : String;
  nTypeZah,nErr, nPodrFile, nPodr, IDPodr : Integer;
  strWhere,strSQL,strNameZags, strFilter, strNameFilter, strErr, strVerBase, strCurVer : String;
  lProp,lShowErr,lFromOblArxiv,lOnlySmert : Boolean;
  dGISRN, dDate1,dDate2,dZagr:TDateTime;
  nPoleGRN,nEdit,nApp:Integer;

begin
//  nTypeZah := dmBase.GetTypeZah;
  lProp := false;
  nErr := 0;
  slOpis := TStringList.Create;
  slType := TStringList.Create;
  lShowErr:=false;
  lFromOblArxiv:=false;
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
    Zip.ExtractFiles('opeka.ini');
  except
    Zip.CloseArchive;
    nErr := 1;
    strErr := 'Ошибка чтения файла загрузки: '+strFileArxiv;
  end;
  if nErr = 0 then begin
    VerInfo:=TVerInfo.Create(Application.ExeName);
    strVer := VerInfo.ProductVersion;
    VerInfo.Free;
    Ini := TSasaIniFile.Create(strPath+'\'+'opeka.ini');
    IDZah       := GlobalTask.ParamAsString('ID');
    IDZAHFile   := Ini.ReadString('MAIN','ORGAN','');
//    lFromOblArxiv:= (Ini.ReadString('MAIN','ARXIV','0')='1');
    strDate1    := Ini.ReadString('MAIN','DATE1','');
    strDate2    := Ini.ReadString('MAIN','DATE2','');
//    strVerFile  := Ini.ReadString('MAIN','VERSION','');
    nVerFile  := Ini.ReadInteger('MAIN','VERSION_VIGR',1);
    strVerBase  := Ini.ReadString('MAIN','BASE','');
    strDateFile := Ini.ReadString('MAIN','DATE','');
    nPodr:=Globaltask.ParamAsInteger('PODR');
    nPodrFile := 0;
    strSQL_ZAGS:='';
    s := Trim(Ini.ReadString('MAIN','PODR',''));
    if (s='') or (s='0') then begin
      nPodrFile := 0;
    end else begin
      try
        nPodrFile := StrToInt(s);
      except
        nErr:=8;
        strErr:='Ошибка определения номера подразделения.';
      end;
    end;
    if nErr=0 then begin
      if (VersionVigrOpeka<>nVerFile) then begin
        nErr:=3;  // нельзя загружать в себя самого
        strErr:='Версия файла выгрузки не соответствует версии программы.';
      end;
    end;
    if nErr=0 then begin
      if (IDZah<>IDZAHFile) then begin
        nErr:=3;  // нельзя загружать в себя самого
        strErr:='Неизвестный орган поступления информации.';
      end;
      if (IDZah=IDZAHFile) and (nPodr=nPodrFile) then begin
        nErr:=2;  // нельзя загружать в себя самого
        strErr:='Нельзя загружать собственные документы.';
      end;
    end;
    if nErr = 0 then begin
      // загружаем подразделение
      if (IDZah=IDZahFile) and (nPodrFile>nPodr) and (nPodr=0) then begin
        IDPodr := nPodrFile;
      end;
      slOpis.AddObject('Информация об опеке', dmBase.tbZapisOpeka);
      slType.Add(IntToStr(_TypeObj_Opeka));
      i:=1;
      SetLength(arrCountDok,i);
      SetLength(arrCountAdd,i);
      for i:=0 to Length(arrCountDok)-1 do begin
        arrCountDok[i] := 0;
        arrCountAdd[i] := 0;
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
  s := '1'; //dmBase.GetVersionZAH(true);

  if nErr=7 then begin  // несоответствие версий  !!!
    lShowErr:=true;
    PutError(strErr);
    if Problem('  Вы хотите продолжить загрузку ?  ') then begin
      nErr := 0;
      strErr := '';
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

  if (nErr=0) and (IDPodr>0) then begin
    s:='';
    ss:='записей';
    strFilter := strFilter + ' .and. ID_ZAGS=' + IDZahFile;
    strWhere := strWhere + ' and ID_ZAGS=' + IDZahFile;
//    if IDPodr>0 then begin
    strFilter := strFilter + ' .and. PODR='+IntToStr(IDPodr);
    strWhere := strWhere + ' and PODR='+IntToStr(IDPodr);
    s := ' Подразделение : '+IntToStr(IDPodr)+#13;
//    end;
    if Problem('Будет произведена загрузка информации.'+#13+
//               ' орган  : '+strNameZags+#13+
               s+
               ' период : '+strNameFilter) then begin
      {!!! не удаляем !!!
      dmBase.WorkQuery.SQL.Text:='select count(*) from AktOpek where '+strWhere+' and pole_grn>=3000';
      dmBase.WorkQuery.Open;
      i:=dmBase.WorkQuery.Fields[0].AsInteger;
      dmBase.WorkQuery.Close;
      if i>0 then begin
        s:='ВНИМАНИЕ!'#13+
           'За указанный период в базе найдены записи подразделения '+IntToStr(IDPodr)+#13+
           'зарегистрированные в '+_GIS_+' в количестве: '+IntToStr(i)+#13+
           'ПРИ ЗАГРУЗКЕ ЗАПИСИ БУДУТ ПЕРЕЗАПИСАНЫ'+#13+
           'Если Вы хотите продолжить, введите слово ДА в поле ввода'#13;
        if OkWarning(s,self) then begin

        end else begin
          nErr:=-1;
          strErr := 'Отказ от загруки.';
        end;
      end;
      }
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
    AdsConnection.ConnectPath := strPath;
    AdsConnection.IsConnected := true;
    ChangeMessage('Поиск информации ...               ');

    tbSource.TableType:=dmBase.tbZapisOpeka.TableType;
    tbSource.AdsTableOptions.AdsCharType:=dmBase.tbZapisOpeka.AdsTableOptions.AdsCharType;
    if lProp then begin
//      try
        {
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
}
//      except
//        nErr := 6;
//        strErr := 'Ошибка открытия таблицы: '+s;
//      end;
    end;
//    if not dmBase.LoadSQL('Удаление_информации_таблица', strSQL) then begin
//      nErr:=10;
//      strErr := 'Ошибка загрузки запроса на удаление.';
//    end;

    if nErr=0 then begin
      nEdit:=0;
      nApp:=0;
      dZagr:=Now;
      //-------------------------------------------------
      for i:=0 to slOpis.Count-1 do begin
        nnn:=0;

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

        //------- удаление информации из базы  ----------------
        {
        ChangeMessage(slOpis.Strings[i]+'  удаление');
        s:=strSQL;
        s:=StringReplace(s, '&ADD_WHERE&', strWhere, [rfReplaceAll, rfIgnoreCase]);
        s:=StringReplace(s, '&TABLE_NAME&', tbDesc.TableName, [rfReplaceAll, rfIgnoreCase]);
        s:=StringReplace(s, '&TYPE_OBJ&', slType.Strings[i], [rfReplaceAll, rfIgnoreCase]);
        try
          dmBase.AdsConnection.Execute(s);
        except
          on E: Exception do begin
            PutError('Таблица: '+tbDesc.TableName+Chr(13)+
                     'Ошибка удаления информации'+Chr(13)+
                     E.Message);
            nErr:=6;
          end;
        end;
        }
        if nErr>0 then break;
        //------------------------------------------------------
        ChangeMessage(slOpis.Strings[i]+'  загрузка');
        while not tbSource.Eof do begin
          nnn:=nnn+1;
          dGISRN:=0;
          nPoleGRN:=0;
          if tbDesc.Locate('PODR;ID_SOURCE', VarArrayOf([IDPodr, tbSource.FieldByName('ID_SOURCE').AsInteger]), []) then begin
            tbDesc.Edit;
          end else begin
            nVid:=tbSource.FieldByName('VID').AsInteger;
            sIN1:=Trim(tbSource.FieldByName('IDENTIF').AsString);
            sIN2:=Trim(tbSource.FieldByName('ON_IDENTIF').AsString);
            if (sIN1<>'') and (sIN2<>'') then begin   // попробуем найти по ИН
              tbDesc.AdsTableOptions.AdsScopeOptions:=RESPECT_SCOPES_WHEN_COUNTING;
              tbDesc.IndexFieldNames:='PODR;VID;IDENTIF;ON_IDENTIF';   // KEY_ADDSEEK
              tbDesc.SetRange([IDPodr,nVid,sIN1,sIN2],[IDPodr,nVid,sIN1,sIN2]);   // если найдена
              ss:=tbDesc.Bookmark;
              nCount:=tbDesc.RecordCount;
              tbDesc.CancelRange;
              if nCount=1 then begin   // если найдена только одна запись
                tbDesc.Bookmark:=ss;
                tbDesc.Edit;
              end else begin
                tbDesc.Append;
              end;
            end else begin
              tbDesc.Append;
            end;
          end;
          if tbDesc.State=dsEdit then begin
            if not tbDesc.FieldByName('DATE_POST_GIS').IsNull then dGISRN:=tbDesc.FieldByName('DATE_POST_GIS').AsDateTime;
            nPoleGRN:=tbDesc.FieldByName('POLE_GRN').AsInteger;
          	nEdit:=nEdit+1;
          end else begin
            nApp:=nApp+1;
          end;
          arrCountAdd[i] := arrCountAdd[i] + 1;
          for j:=0 to tbSource.FieldCount-1 do begin
            strFieldName := tbSource.Fields[j].FieldName;
            if strFieldName='ID' then begin
              // не пишем т.к. AutoInc
            end else if strFieldName='ID_SOURCE' then begin
              tbDesc.FieldByName('ID_SOURCE').AsString:=tbSource.FieldByName('ID_SOURCE').AsString;   //  !!!
            end else if strFieldName='ID_ZAGS' then begin
              tbDesc.FieldByName('ID_ZAGS').AsString:=IDZah;    // пока так !!!
            end else if strFieldName='PODR' then begin
              // запишем PODR из которого поступи данные
              tbDesc.FieldByName('PODR').AsInteger:=IDPODR;
            end else if strFieldName='DATE_VIGR' then begin
              // ???
            end else if strFieldName='DATE_ZAGR' then begin
              tbDesc.FieldByName('DATE_ZAGR').AsDateTime:=dZagr;
            end else begin
              fld := tbDesc.FindField(strFieldName);
              if (fld<>nil) then begin //and not tbSource.Fields[j].IsNull then begin
                try
                  if tbSource.Fields[j].isnull
                    then fld.AsString:=''
                    else fld.Value:=tbSource.Fields[j].Value;
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
          //-------------- вернем значения полей обратно --------------------
          if nPoleGRN>0
            then tbDesc.FieldByName('POLE_GRN').AsInteger:=nPoleGRN;
          if dGISRN>0
            then tbDesc.FieldByName('DATE_POST_GIS').AsDateTime:=dGISRN;
          //-----------------------------------------------------------------

          if cbImitation.Checked then begin
            tbDesc.Cancel;
          end else begin
            tbDesc.Post;
            if lProp then begin
              WriteProp(tbSource.FieldByName('ID').AsInteger,
                        tbDesc.FieldByName('ID').AsInteger,
                        StrToInt(slType.Strings[i]))
            end;
          end;
          tbSource.Next;
          if nnn=100 then begin
            nnn:=0;
            ChangeMessage(slOpis.Strings[i]+'  '+IntToStr(arrCountAdd[i]));
          end;
        end;
        tbSource.Close;
        ChangeMessage(slOpis.Strings[i]+'  '+IntToStr(arrCountAdd[i]));
      end;
    end;
//    tbSourceBaseProp.Active := false;
//    tbSourceBaseTextProp.Active := false;
//    tbSourceHistZAGS.Active := false;
//    tbSourceSvidPovtor.Active := false;
//    if nTypeZags = ZAGS_OBL_ARXIV then begin
//      tbSourceSprNames.Active := false;
//    end;

    AdsConnection.IsConnected:=false;

    CloseMessage;
  end;
//  ShowMessage(s);
  Result := nErr;
  DeleteFiles(strPath+'\*.*');
  if nErr = 0 then begin
    if cbImitation.Checked
      then s :=' Имитация успешно завершена. '+#13+#13
      else s :=' Загрузка успешно завершена.   Загружено: '+#13+#13;
    for i:=0 to slOpis.Count-1 do begin
      s := s + slOpis.Strings[i] + '    -    ' + IntToStr(arrCountAdd[i]) + '  '+#13  ;
      if i=0 then begin
        s := s + '  добавлено '+IntToStr(nApp)+', откорректировано '+IntToStr(nEdit);
      end;
    end;
    ShowMessage(s);
  end else begin
    if not lShowErr
      then PutError(strFileArxiv+#13#10+strErr);
  end;
  SetLength(arrCountDok,0);
  SetLength(arrCountAdd,0);
  slOpis.Clear;
  slOpis.Free;
  slType.Free;
end;
//------------------------------------------------------------------------------------
function TfmChZagrOpeka.WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
var
  fldS,fldD:TField;
  i:Integer;
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
  fldS:=tbSourceHistZAGS.FindField('INFO');
  fldD:=dmBase.tbHistoryZAGS.FindField('INFO');
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

end;

procedure TfmChZagrOpeka.WMDEVICECHANGE(var Msg: TMessage);
begin
{Заголовок сообщения}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CreateListDisk;
end;

//----------------------------------------------
procedure TfmChZagrOpeka.CreateListDisk;
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
    s := GlobalTask.GetLastValueAsString('DISK_ZAGR_OPEKA');
    edDisk.ItemIndex := 0;
    n := edDisk.Items.IndexOf(s);
    if n > -1 then begin
      edDisk.ItemIndex := n;
    end;
  end else begin
    edDisk.Enabled := false;
  end;
  FDefPath := GlobalTask.GetLastValueAsString('PATH_ZAGR_OPEKA');
  edPath.Enabled := false;
end;

procedure TfmChZagrOpeka.FormCreate(Sender: TObject);
begin
  CreateListDisk;
end;

procedure TfmChZagrOpeka.cbChoiceClick(Sender: TObject);
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


procedure TfmChZagrOpeka.edPathEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  strDir : String;
begin
  Handled := true;
  if SelectDirectory('Выберите папку', '', strDir) then begin
    edPath.Text := strDir;
  end;
end;

procedure TfmChZagrOpeka.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(Zip);
end;

end.
