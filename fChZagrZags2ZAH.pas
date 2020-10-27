unit fChZagrZags2Zah;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, Variants,
  DBCtrlsEh, StdCtrls, Mask, Buttons, SasaIniFile, mVerInfo, ZipForge, Db, uProject, uProjectAll,
  adsdata, adsfunc, adstable, adscnnct, MetaTask, FileCtrl,
  uUtilFiles, FuncPr, ifpii_dbfunc, ComCtrls;

type

  TfmChZagrZags2Zah = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    Label1: TLabel;
    cbChoice: TDBCheckBoxEh;
    edDisk: TDBComboBoxEh;
    edPath: TDBEditEh;
    AdsConnection: TAdsConnection;
    tbSource: TAdsTable;
    Zip: TZipForge;
    tbSourceBaseProp: TAdsTable;
    tbSourceBaseTextProp: TAdsTable;
    tbSourceHistZAGS: TAdsTable;
    tbSourceSvidPovtor: TAdsTable;
    tbSourceSprNames: TAdsTable;
    Query: TAdsQuery;
    Label2: TLabel;
    cbType: TComboBox;
    cbDelete: TCheckBox;
    lbSeek: TLabel;
    cbSeek: TComboBox;
    cbEmpty: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    edDate1: TDBDateTimeEditEh;
    edDate2: TDBDateTimeEditEh;
    btSetDate: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cbChoiceClick(Sender: TObject);
    procedure edPathEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
    procedure btSetDateClick(Sender: TObject);
  private
    FDefPath : String;
    IDZags : String;
    IDZagsFile:String;
    IDZagsName:String;
    FTypeLoad:Integer;
    FFields:TStringList;
    FDate1:TDateTime;
    FDate2:TDateTime;
  public
    procedure CreateListDisk;
    procedure CopyBaseFiles(lSetDate:Boolean);
    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;

    function GetXML:String;
    function CopyOneBaseFiles(strFileArxiv : String; lSetDate:Boolean) : Integer;
    function LoadOneRec(lProp:Boolean; var nLoad:Integer):Boolean;
    function WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
    procedure WriteToSprNames;

  end;

  procedure RunZagrZags2Zah;

implementation

uses dBase, uTypes;

{$R *.DFM}

const
  LOAD_FULL=1;
  LOAD_IN=2;

procedure RunZagrZags2Zah;
var
  f : TfmChZagrZags2Zah;
begin
  f := TfmChZagrZags2Zah.Create(nil);
  f.FFields:=nil;
  f.FDate1:=0;
  f.FDate2:=0;
  f.Zip.Password:=PSW_ZAGS2ZAH;
  try
    if f.ShowModal = mrOk then begin
      f.CopyBaseFiles(false);
    end;
  finally
    if f.FFields<>nil
      then f.FFields.Free;
    f.Free;
  end;
end;

procedure TfmChZagrZags2Zah.CopyBaseFiles(lSetDate:Boolean);
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
    lOk := FindFirst(strPath+'*.zah', faAnyFile, SearchRec) = 0;
    if lOk then begin
      if cbType.ItemIndex=0 then FTypeLoad:=LOAD_FULL else FTypeLoad:=LOAD_IN;
      if lSetDate then begin
        CopyOneBaseFiles(strPath+SearchRec.Name, true);
      end else begin
        repeat
          if (SearchRec.Name[1] <> '.') and
            (SearchRec.Attr and faVolumeID <> faVolumeID) and
            (SearchRec.Attr and faDirectory <> faDirectory) then begin
            CopyOneBaseFiles(strPath+SearchRec.Name, false);
          end;
        until FindNext(SearchRec) <> 0;
      end;
    end else begin
      PutError(' Не найдено ни одного файла для загрузки !  ');
    end;
    FindClose(SearchRec);
  end;
end;
//---------------------------------------------------------
procedure TfmChZagrZags2Zah.WriteToSprNames;
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
function TfmChZagrZags2Zah.CopyOneBaseFiles(strFileArxiv : String; lSetDate:Boolean) : Integer;
var
  strDate1,strDate2 : String;
  i,j,nnn,mmm, nID : Integer;
  strPath,s,ss : String;
  Ini : TSasaIniFile;
  VerInfo: TVerInfo;
  arrCountDok : array of Integer;
  arrCountAdd : array of Integer;
  fld : TField;
  strFieldName : String;
  slOpis, slType : TStringList;
  tbDesc : TAdsTable;
  strVer, strVerFile, strVerZAGS, old, strDateFile, strSQL_ZAGS : String;
  nTypeZags,nErr, nPodrFile, nPodr, IDPodr : Integer;
  strWhere,strSQL,strNameZags, strFilter, strNameFilter, strErr, strVerBase, strCurVer, sSOATO, sSoatoZAGS : String;
  lAll,lProp,lShowErr,lFromOblArxiv,lOnlySmert : Boolean;
  dDate1,dDate2:TDateTime;
begin
  Result:=0;
  nTypeZags := dmBase.GetTypeZah;
  lProp := true;
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
    IDZagsName   := Ini.ReadString('MAIN','ZAGS_NAME','');
    lFromOblArxiv:= (Ini.ReadString('MAIN','ARXIV','0')='1');

    strDate1    := Ini.ReadString('MAIN','DATE1','');
    strDate2    := Ini.ReadString('MAIN','DATE2','');
    strVerFile  := Ini.ReadString('MAIN','VERSION','');
    strVerZAGS  := Ini.ReadString('MAIN','VERSION_ZAGS','');
    strVerBase  := Ini.ReadString('MAIN','BASE','');
    strDateFile := Ini.ReadString('MAIN','DATE','');
    nPodrFile := 0;
    nPodr:=0;
    lOnlySmert:=false;
    strSQL_ZAGS:='';
    lAll:=true;

    if nErr = 0 then begin
      slOpis.AddObject('З/а о сметрти', dmBase.AktZ);
      slType.Add(IntToStr(dmBase.TypeObj_ZSmert));
      i:=1;

      SetLength(arrCountDok,i);
      SetLength(arrCountAdd,i);
      for i:=0 to Length(arrCountDok)-1 do begin
        arrCountDok[i] := 0;
        arrCountAdd[i] := 0;
      end;
    end;
    Ini.Free;
  end;

  if lSetDate then begin
    try
      FDate1:=STOD(strDate1);
      FDate2:=STOD(strDate2);
      edDate1.Value:=FDate1;
      edDate2.Value:=FDate2;
    except
      Result:=0;
      nErr:=-1;
      FDate1:=0;
      FDate2:=0;
      lShowErr:=true;
      PutError('Ошибка определения даты.');
    end;
  end else begin
    strFilter := '';
    strWhere  := '';
    strNameFilter := '';

    // если даты установлены вручную
    if (edDate1.Value<>null) or (edDate2.Value<>null) then begin
      if (edDate1.Value=null) or (edDate2.Value=null) then begin
        nErr:=7;
      end else if edDate1.Value>edDate2.Value then begin
        nErr:=7;
      end;
      if nErr>0 then strErr:='Неверно введены даты загрузки.'
                else lAll:=false;
    end;

    if nErr = 0 then begin

      if (edDate1.Value<>null) and (edDate2.Value<>null) then begin
        strDate1:=DTOS(edDate1.Value,tdClipper);
        strDate2:=DTOS(edDate2.Value,tdClipper);
      end;

      if (strDate1='') and (strDate2='') then begin
        nErr := 4;
        strErr := 'Неизвестна дата выгрузки поступивших документов.';
      end else if strDate2='' then begin  // загружаем за год
        strFilter := 'Year(ZA_DATE)='+strDate1;
        strWhere  := 'Year(ZA_DATE)='+strDate1;
        strNameFilter := 'за '+strDate1+' год';
      end else begin
        dDate1:=STOD(strDate1);
        dDate2:=STOD(strDate2);
        strFilter := 'ZA_DATE>='+'STOD('+QStr(strDate1)+') and '+
                           'ZA_DATE<='+'STOD('+QStr(strDate2)+')';
        strWhere  := 'ZA_DATE>='+DateToSQL(dDate1)+' and '+ 'ZA_DATE<='+DateToSQL(dDate2);
        strNameFilter := 'c ' + FormatDateTime('dd.mm.yyyy',STOD(strDate1))+
                         ' по ' + FormatDateTime('dd.mm.yyyy',STOD(strDate2));
      end;
    end;

    if nErr=0 then begin
      s:='';
      ss:='записей акта о смерти';
      if FTypeLoad=LOAD_IN then begin
        ss:=' ИН из '+ss;
      end;
      strWhere  := strWhere + ' and SVID_SOURCE=' + IDZagsFile;
      if Problem('Будет произведена загрузка '+ss+'.'+#13+
  //               ' ЗАГС : '+strNameZags+#13+s+
                 ' период : '+strNameFilter) then begin
      end else begin
        nErr:=-1;
        strErr := 'Отказ от загруки.';
      end;
    end;

    i:=0;

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

      tbSource.TableType := dmBase.AktZ.TableType;
      tbSource.AdsTableOptions.AdsCharType := dmBase.AktZ.AdsTableOptions.AdsCharType;
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
  //    if not dmBase.LoadSQL('Удаление_записей_актов', strSQL) then begin
  //      nErr:=10;
  //      strErr := 'Ошибка загрузки запроса на удаление.';
  //    end;
      if nErr=0 then begin
        tbDesc := dmBase.AktZ;
        tbSource.TableName := 'АктыСмертей';
        try
          tbSource.Open;
        except
          nErr := 6;
          strErr := 'Ошибка открытия таблицы: '+tbSource.TableName;
        end;
      end;

      //------- удаление информации из базы  ----------------
      if (nErr=0) and cbDelete.Checked then begin
        ChangeMessage('предварительное удаление');
        s:='delete from AktZ where '+strWHERE;
  //      s:=strSQL;
  //      s:=StringReplace(s, '&ADD_WHERE&', strWhere, [rfReplaceAll, rfIgnoreCase]);
  //      s:=StringReplace(s, '&TABLE_NAME&', 'AktZ', [rfReplaceAll, rfIgnoreCase]);
  //      s:=StringReplace(s, '&TYPE_OBJ&', IntToStr(_TypeObj_AktZAH), [rfReplaceAll, rfIgnoreCase]);
        try
          MemoWrite('last.sql',s);
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
      //------- загрузка ------------------------------------------
      if nErr=0 then begin
        nnn:=0;  mmm:=0; // mmm2:=0;
        ChangeMessage('загрузка');
        old:=dmBase.AktZ.IndexName;
        dmBase.AktZ.IndexName:='FAMILIA';
        while not tbSource.Eof do begin
          nnn:=nnn+1;
          if lAll or ((tbSource.FieldByName('DATEZ').AsDateTime>=dDate1) and (tbSource.FieldByName('DATEZ').AsDateTime<=dDate2)) then begin
            LoadOneRec(lProp, mmm);
          end;
          tbSource.Next;
          if nnn=100 then begin
            nnn:=0;
            ChangeMessage(' загружено: '+IntToStr(mmm));
          end;
        end;
        tbSource.Close;
        ChangeMessage(' загружено: '+IntToStr(mmm));
        dmBase.AktZ.IndexName:=old;
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
    Result := nErr;
    DeleteFiles(strPath+'\*.*');
    if nErr = 0 then begin
      if FTypeLoad=LOAD_FULL then begin
        ShowMessage('Загрузка успешно завершена.'#13'Загружено: '+IntToStr(mmm));
      end else begin
        ShowMessage('Загрузка успешно завершена.'#13'Загружено ИН: '+IntToStr(mmm));
      end;
    end else begin
      if not lShowErr
        then PutError(strErr);
    end;
  end;

//  ShowMessage(s);

  SetLength(arrCountDok,0);
  SetLength(arrCountAdd,0);
  slOpis.Clear;
  slOpis.Free;
  slType.Free;
end;
//-----------------------------------------------------------------------------
function TfmChZagrZags2Zah.LoadOneRec(lProp:Boolean; var nLoad:Integer):Boolean;
var
  j:Integer;
  sField,sBookMark:String;
  tbDesc:TAdsTable;
  fld:TField;
  lOk:Boolean;
begin
  tbDesc:=dmBase.AktZ;
  lOk:=false;
  if FTypeLoad=LOAD_FULL then begin
    tbDesc.Append;
    lOk:=true;
  end else begin
    tbDesc.SetRange([tbSource.FieldByName('FAMILIA').AsString],[tbSource.FieldByName('FAMILIA').AsString]);
    j:=0;
    while not tbDesc.Eof do begin
      if MySameText(tbSource.FieldByName('NAME').AsString,tbDesc.FieldByName('NAME').AsString) and
         MySameText(tbSource.FieldByName('OTCH').AsString,tbDesc.FieldByName('OTCH').AsString) then begin
         if cbSeek.ItemIndex=0 then begin // ФИО+дата смерти
           if tbSource.FieldByName('DATES').AsString=tbDesc.FieldByName('DATES').AsString then begin
             sBookMark:=tbDesc.Bookmark;
             j:=j+1;
           end;
         end else begin
           if tbSource.FieldByName('DATER').AsString=tbDesc.FieldByName('DATER').AsString then begin
             sBookMark:=tbDesc.Bookmark;
             j:=j+1;
           end;
         end;
      end;
      tbDesc.Next;
    end;
    tbDesc.CancelRange;
    if j=1 then begin
      lOk:=true;
      tbDesc.Bookmark:=sBookMark;
      tbDesc.Edit;
    end;
  end;

{    d2xml:=ds2xml.DS_Add(Dokument,true);
  d2xml.FClearRecord:=false;
  d2xml.FWriteNull:=false;
  d2xml.SetWriteFields(
     'SM_GOSUD;SM_B_OBL;SM_OBL;SM_RAION;SM_GOROD_R;SM_B_GOROD;SM_GOROD;SM_DOM;SM_KORP;SM_KV;SM_TEXT;'+
     'PR_OSN;PR_OSN_NAME;RG_B_RESP;RG_GOSUD;RG_B_OBL;RG_OBL;RG_RAION;RG_B_GOROD;RG_GOROD;'+
     'ZH_PRICH;RAZR_DATE;RAZR_ORGAN;RAZR_FIO;PR_OSN_NAME;PR_OSN;DOKUMENT;PRIL_LIST;TEXT_VOZR;TEXT_DATES;DOLG_RUKOV;'+
     'SVID_ZAGS;USLUG'
     ); }

  if lOk then begin
    if FTypeLoad=LOAD_FULL then begin
      if FFields=nil then begin
        FFields:=TStringList.Create;
        FFields.CommaText:='FAMILIA,NAME,OTCH,DATES,ONLYGOD,GRAG,DATER,ONLYGOD_R,SVID_SERIA,SVID_NOMER,DATESV,POL'; //+
//                'GT_GOSUD,GT_B_OBL,GT_OBL,GT_B_RN,GT_RAION,GT_B_GOROD,GT_GOROD,GT_GOROD_R,GT_DOM,GT_KORP,GT_KV';
      end;
      tbDesc.FieldByName('ZA_NOMER').AsString:=tbSource.FieldByName('NOMER').AsString;
      tbDesc.FieldByName('ZA_DATE').AsString:=tbSource.FieldByName('DATEZ').AsString;
      tbDesc.FieldByName('ID_ZAGS').AsInteger:=0;
      tbDesc.FieldByName('ID_SOURCE').AsInteger:=0;
      tbDesc.FieldByName('PODR').AsInteger:=0;
      tbDesc.FieldByName('ID_ZAGS').AsInteger:=0;
      tbDesc.FieldByName('SVID_SOURCE').AsString:=IDZagsFile;

      tbDesc.FieldByName('MOG_TYPE').AsInteger:=1;
      tbDesc.FieldByName('MOG_L').AsFloat:=2.3;
      tbDesc.FieldByName('MOG_W').AsFloat:=1.4;

//      tbDesc.FieldByName('SVID_ZAGS').AsString:=IDZagsName;
      for j:=0 to FFields.Count-1 do begin
        tbDesc.FieldByName(FFields.Strings[j]).Value:=tbSource.FieldByName(FFields.Strings[j]).Value;
      end;
      tbDesc.FieldByName('ADD_FIELDS').AsString:=GetXML;
      if (tbSource.FieldByName('LICH_NOMER').AsString<>'') then
        tbDesc.FieldByName('LICH_NOMER').AsString:=tbSource.FieldByName('LICH_NOMER').AsString;

      nLoad:=nLoad+1;
      {
        except
          on E: Exception do begin
            PutError('Ошибка записи в поле: '+fld.FieldName+Chr(13)+
                     'Значение: "'+fld.AsString+'"'+Chr(13)+
                      E.Message);
          end;
        end;
        }
    end else begin
      if tbSource.FieldByName('LICH_NOMER').AsString<>'' then begin
        if not cbEmpty.Checked or (tbDesc.FieldByName('LICH_NOMER').AsString='') then begin
          tbDesc.FieldByName('LICH_NOMER').AsString:=tbSource.FieldByName('LICH_NOMER').AsString;
          nLoad:=nLoad+1;
        end;
      end;
    end;
    tbDesc.Post;
  end;
  Result:=lOk;
//  if lProp then begin
//    WriteProp(tbSource.FieldByName('ID').AsInteger, tbDesc.FieldByName('ID').AsInteger, _TypeObj_AktZAH );
//  end;
end;
//-----------------------------------------------------------------------------------------------
function TfmChZagrZags2Zah.GetXML:String;
var
 s:String;
 procedure FieldToXML(s1:String;fld:TField;s2:String);
 begin
   if not fld.IsNull then begin
     case fld.DataType of
       ftBoolean	: if fld.AsBoolean
                      then Result:=Result+s1+'1'+s2
                      else Result:=Result+s1+'0'+s2;
     else
       Result:=Result+s1+fld.AsString+s2;
     end;
   end;
 end;
begin
  Result:='<?xml version="1.0" encoding="UTF-8"?>'#13#10+
          '<DATASETS VERSION="1">'#13#10+
          '<DOKUMENT ONE_RECORD="1" RECORD_COUNT="1">'#13#10;
  with tbSource do begin
    FieldToXML('<PR_OSN_NAME>'#13#10'<![CDATA[',FieldByName('PR_OSN_NAME'),']]>'#13#10'</PR_OSN_NAME>'#13#10);

    FieldToXML('<SM_GOSUD>',FieldByName('SM_GOSUD'),'</SM_GOSUD>'#13#10);
    FieldToXML('<SM_B_OBL>',FieldByName('SM_B_OBL'),'</SM_B_OBL>'#13#10);
    FieldToXML('<SM_OBL>',FieldByName('SM_OBL'),'</SM_OBL>'#13#10);
    FieldToXML('<SM_RAION>',FieldByName('SM_RAION'),'</SM_RAION>'#13#10);
    FieldToXML('<SM_B_GOROD>',FieldByName('SM_B_GOROD'),'</SM_B_GOROD>'#13#10);
    FieldToXML('<SM_GOROD>',FieldByName('SM_GOROD'),'</SM_GOROD>'#13#10);

    FieldToXML('<PR_OSN_NAME>'#13#10'<![CDATA[',FieldByName('PR_OSN_NAME'),']]>'#13#10'</PR_OSN_NAME>'#13#10);
    FieldToXML('<DOKUMENT>'#13#10'<![CDATA[',FieldByName('DOKUMENT'),']]>'#13#10'</DOKUMENT>'#13#10);

    FieldToXML('<RG_B_RESP>',FieldByName('RG_B_RESP'),'</RG_B_RESP>'#13#10);
    FieldToXML('<RG_GOSUD>',FieldByName('RG_GOSUD'),'</RG_GOSUD>'#13#10);
    FieldToXML('<RG_B_OBL>',FieldByName('RG_B_OBL'),'</RG_B_OBL>'#13#10);
    FieldToXML('<RG_OBL>',FieldByName('RG_OBL'),'</RG_OBL>'#13#10);
    FieldToXML('<RG_RAION>',FieldByName('RG_RAION'),'</RG_RAION>'#13#10);
    FieldToXML('<RG_B_GOROD>',FieldByName('RG_B_GOROD'),'</RG_B_GOROD>'#13#10);
    FieldToXML('<RG_GOROD>',FieldByName('RG_GOROD'),'</RG_GOROD>'#13#10);

    FieldToXML('<PR_GOSUD>',FieldByName('GT_GOSUD'),'</PR_GOSUD>'#13#10);
    FieldToXML('<PR_B_OBL>',FieldByName('GT_B_OBL'),'</PR_B_OBL>'#13#10);
    FieldToXML('<PR_OBL>',FieldByName('GT_OBL'),'</PR_OBL>'#13#10);
    FieldToXML('<PR_RAION>',FieldByName('GT_RAION'),'</PR_RAION>'#13#10);
    FieldToXML('<PR_B_GOROD>',FieldByName('GT_B_GOROD'),'</PR_B_GOROD>'#13#10);
    FieldToXML('<PR_GOROD>',FieldByName('GT_GOROD'),'</PR_GOROD>'#13#10);
    FieldToXML('<PR_GOROD_R>',FieldByName('GT_GOROD_R'),'</PR_GOROD_R>'#13#10);
    FieldToXML('<PR_DOM>',FieldByName('GT_DOM'),'</PR_DOM>'#13#10);
    FieldToXML('<PR_KORP>',FieldByName('GT_KORP'),'</PR_KORP>'#13#10);
    FieldToXML('<PR_KV>',FieldByName('GT_KV'),'</PR_KV>'#13#10);


    if tbSourceBaseProp.Locate('TYPEOBJ;ID;POKAZ', VarArrayOf([_TypeObj_ZSmert, FieldByName('ID').AsInteger, 'TEXT_VOZR']), [])
      then Result:=Result+'<TEXT_VOZR>'+tbSourceBaseProp.FieldByName('VALUE').AsString+'</TEXT_VOZR>'#13#10;
    if tbSourceBaseProp.Locate('TYPEOBJ;ID;POKAZ', VarArrayOf([_TypeObj_ZSmert, FieldByName('ID').AsInteger, 'TEXT_DATES']), [])
      then Result:=Result+'<TEXT_DATES>'+tbSourceBaseProp.FieldByName('VALUE').AsString+'</TEXT_DATES>'#13#10;
    s:='';
    if FieldByName('NAME_ZAGS').AsString<>'' then begin
      s:=FieldByName('NAME_ZAGS').AsString;
//    end else if FieldByName('ID_ZAGS').AsString=IDZagsFile then begin
//      s:=IDZagsName;
    end else begin
      if tbSourceSprNames.Locate('ID', FieldByName('ID_ZAGS').AsInteger, [])
        then s:=tbSourceSprNames.FieldByName('NAME').AsString;
    end;
    if s<>'' then
      Result:=Result+'<SVID_ZAGS>'+s+'</SVID_ZAGS>'#13#10;

  end;
  Result:=Result+#13#10'</DOKUMENT>'#13#10'</DATASETS>';
end;

//------------------------------------------------------------------------------------
function TfmChZagrZags2Zah.WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
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
{
  tbSourceSvidPovtor.IndexName := 'VIGR_KEY';
  tbSourceSvidPovtor.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not tbSourceSvidPovtor.Eof do begin
    with dmBase.SvidPovtor do begin
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
}
end;

procedure TfmChZagrZags2Zah.WMDEVICECHANGE(var Msg: TMessage);
begin
{Заголовок сообщения}
  if Msg.Msg = WM_DEVICECHANGE then
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then
      CreateListDisk;
end;

//----------------------------------------------
procedure TfmChZagrZags2Zah.CreateListDisk;
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

procedure TfmChZagrZags2Zah.FormCreate(Sender: TObject);
begin
  CreateListDisk;
end;

procedure TfmChZagrZags2Zah.cbChoiceClick(Sender: TObject);
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


procedure TfmChZagrZags2Zah.edPathEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  strDir : String;
begin
  Handled := true;
  if SelectDirectory('Выберите папку', '', strDir) then begin
    edPath.Text := strDir;
  end;
end;

procedure TfmChZagrZags2Zah.FormDestroy(Sender: TObject);
begin
//  FreeAndNil(Zip);
end;

procedure TfmChZagrZags2Zah.cbTypeChange(Sender: TObject);
begin
  case cbType.ItemIndex of
    0: begin
         lbSeek.Enabled:=false;
         cbSeek.Enabled:=false;
         cbDelete.Checked:=true;
         cbDelete.Enabled:=true;
         cbEmpty.Checked:=false;
         cbEmpty.Enabled:=false;
       end;
    1: begin
         lbSeek.Enabled:=true;
         cbSeek.Enabled:=true;
         cbDelete.Checked:=false;
         cbDelete.Enabled:=false;
         cbEmpty.Checked:=true;
         cbEmpty.Enabled:=true;
       end;
  end;
end;

procedure TfmChZagrZags2Zah.btSetDateClick(Sender: TObject);
begin
  CopyBaseFiles(true);
end;

end.
