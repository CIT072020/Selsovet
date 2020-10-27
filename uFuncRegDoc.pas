unit uFuncRegDoc;

interface

{$I Task.inc}

uses Windows, Forms,Dialogs, Classes, Messages, SysUtils, Variants, ShellApi,
     ZipForge, QStrings, db, FuncPr, MetaTask, NativeXML, DateUtils, fEditMemo,
     mPermit, uUtilFiles, uProject, uProjectAll;

type

   TRegdoc2XML=class(TObject)
   private
    FRootDelo: String;
    FRootDoc: String;
    FVersion: String;
    FMyID:Integer;
   public
//     OnLoadOneOpeka:TLoadOneOpeka;
     FDelo:Integer;
     FIsDate:Boolean;
     FDate1:TDateTime;
     FDate2:TDateTime;

     FProtokol: TStrings;
     FDebug: TStrings;
     FLastError:String;
     FWriteNull:Boolean;
     FToUtf8:Boolean;
     FormatDate:String;
     FormatTime:String;
     FPathExport:String;
     FPathDoc:String;
     AsAttribute:Boolean;
     xmlDelo:TNativeXml;
     xmlRkk:TNativeXml;
     arrTypeDok:array of integer;

     function DeloToArxiv:Boolean;

     function CreateOneFile(dsFiles:TDataSet; nodeFiles:TXmlNode):Boolean;
     procedure ClearXml(dx:TNativeXML; sNameRoot:String);
     function CheckStrW(s:String):String;
     function CheckStrR(s:String):String;
     function MemoToXML(node:TXMLNode; sName:String; s:String):Boolean;
     function ValueToXML(node:TXMLNode; sName:String; v:Variant; lWriteEmpty:Boolean=true; nAsAttribute:Integer=-1): Boolean;
     function DateToStr(d:TDateTime; lAddEmptyTime:Boolean=false): Utf8String;
     function DateTimeToStr(d:TDateTime): Utf8String;
     function SetPathExport(sPath:String):Boolean;
     function getTypeDoc(nType:Integer):String;
     function getHeadDoc(nType:Integer):String;
     procedure AddProtokol(sValue:String; lDebug:Boolean=false);


     function ExportSprFileDocList:Boolean;

     constructor Create;
     destructor Destroy; override;

   end;


   procedure DeloToVedomArx;
   procedure NomekToVedomArx;

implementation

uses dBase, fMain, mDRecInt, fParamQuest, uTypes;

const
  AS_ATR=1;
  AS_TEG=0;

procedure NomekToVedomArx;
var
  da:TRegdoc2XML;
  sPath:String;
begin
  da:=TRegdoc2XML.Create;
  sPath:=GlobalTask.GetLastValueAsString('PATH_VIGR_DELO');
  if sPath=''
    then sPath:=ExtractFilePath(Application.ExeName)+'Export\';
  if da.SetPathExport(sPath) then begin;   // !!! брать из параметров
    OpenMessageEx('Экспорт справочника номенклатуры');
    da.AsAttribute:=false;
    da.ExportSprFileDocList;
    CloseMessage;
    ShellExecute(Application.Handle, PChar('explore'), PChar(sPath), nil, nil, SW_SHOWNORMAL);
  end;
//  ShowStrings(da.FProtokol,'');
  da.Free;
end;

procedure DeloToVedomArx;
var
  da:TRegdoc2XML;
  fs:TFormatSettings;
  n,nDelo:Integer;
  f:TfmParamQuest;
  nYear, nMonth, nDay:Word;
  s,sPath:String;
  lDate:Boolean;
  d1,d2:TDateTime;
begin
  f:=TfmParamQuest.Create(nil);
  f.Caption := 'Введите значения';
  sPath:=GlobalTask.GetLastValueAsString('PATH_VIGR_DELO');
  f.AddParamEx(sPath, 'Папка для выгрузки' , 'PATH' ,'TYPE=DIR');
  // [LOOKUP_SPRDOCFILELIST]  DISPLAY=FILE_IND,NAME
  f.AddParamEx(0 , 'Номенклатура' , 'DELO' ,'TYPE=LOOKUP~DESC=LOOKUP_SPRDOCFILELIST~WIDTH=100~BOX=100,500');
  if BeginDateDelo1=0 then begin
    DecodeDate(Now, nYear, nMonth, nDay);
    BeginDateDelo1:=StartOfAYear(nYear-1);
    BeginDateDelo2:=EndOfAYear(nYear-1);
  end;
  f.AddParamEx(true, 'Учитывать дату направления в дело', 'ISDATE' ,'TYPE=BOOLEAN');
  f.AddParamEx(BeginDateDelo1, 'Начальная дата', 'DATE1' ,'TYPE=DATE');
  f.AddParamEx(BeginDateDelo2, 'Конечная дата' , 'DATE2' ,'TYPE=DATE');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  da:=TRegdoc2XML.Create;
  nDelo:=f.GetValue('DELO','N');
  sPath:=CheckSleshN(f.GetValue('PATH','S'));
  lDate:=f.GetValue('ISDATE','L');
  d1:=f.GetValue('DATE1','D');
  d2:=f.GetValue('DATE1','D');
  f.Free;
  if (sPath<>'') and (n>0) and (nDelo>0) then begin
    GlobalTask.SetLastValueAsString('PATH_VIGR_DELO',DeleteSlesh(sPath));

    SetLength(da.arrTypeDok,2);
  {  dtPetition=1 обращения граждан;  dtInfo=2 справки;  gtAdmProc=5 административные процедуры  }
    da.arrTypeDok[0]:=gtIncoming;
    da.arrTypeDok[1]:=gtOutgoing;
    if da.SetPathExport(sPath) then begin;   // !!! брать из параметров
      OpenMessageEx('Выгрузка в ведомственный архив ...');
      try
        da.FDelo:=nDelo;
        da.FIsDate:=lDate;
        da.FDate1:=d1;
        da.FDate2:=d2;
        da.DeloToArxiv();
      finally
        CloseMessage();
      end;
    end;
    if da.FProtokol.Count=0 then begin
      ShowMessage('Выгрузка успешно завершена');
    end else begin
      s:='<READONLY>'+da.FProtokol.Text;
      EditMemo(s, 'Ошибки', nil, 800);
    end;
    if Role.SystemAdmin then begin
      s:=da.FDebug.Text;
      EditMemo(s, 'Отладка', nil, 800);
    end;
    da.Free;
  end;
end;

//--------------------------------------------------------------
constructor TRegdoc2XML.Create;
begin
  FMyID:=MyID;
  FVersion:='1';
  FRootDelo:='delo';
  FRootDoc:='document';
  FWriteNull:=false;
  FToUtf8:=true;
  FormatDate:='yyyy-mm-dd';
  FormatTime:='hh:mm';
  FLastError:='';
  xmlDelo:=TNativeXml.Create;
  ClearXml(xmlDelo, FRootDelo);
  xmlRkk:=TNativeXml.Create;
  ClearXml(xmlRkk, FRootDoc);
  AsAttribute:=false;
  FProtokol:=TStringList.Create;
  FDebug:=TStringList.Create;
  FDelo:=0;
  FIsDate:=false;
  FDate1:=0;
  FDate2:=0;
//  dsOrg:=dbCreateMemTable('ID,Integer,0;NAME,Char,300;KNAME,Char,200','');
//  dsOrg.Open;
end;
//--------------------------------------------------------------
destructor TRegdoc2XML.Destroy;
begin
  xmlDelo.Free;
  xmlRkk.Free;
  FProtokol.Free;
  FDebug.Free;
  inherited;
end;
//--------------------------------------------------------------
procedure TRegdoc2XML.ClearXml(dx:TNativeXML; sNameRoot:String);
begin
  dx.Clear;
  dx.Root.Name:=sNameRoot;
  dx.XmlFormat:=xfReadable;
  {
  dx.ExternalEncoding:=seANSI;
  dx.EncodingString:='windows-1251';
  }
end;
//--------------------------------------------------------------
function TRegdoc2XML.CheckStrW(s:String):String;
begin
  if FToUtf8
    then Result:=AnsiToUtf8(s)
    else Result:=s;
end;
//--------------------------------------------------------------
function TRegdoc2XML.CheckStrR(s:String):String;
begin
  if FToUtf8
    then Result:=Utf8ToAnsi(s)
    else Result:=s;
end;
//--------------------------------------------------------------
function TRegdoc2XML.MemoToXML(node:TXMLNode; sName:String; s:String):Boolean;
var
  node1,node_cdata:TXMLNode;
begin
  Result:=false;
  if Trim(s)<>'' then begin
    node1:=node.NodeNew(sName);
    node_cdata:=node1.NodeNew(sName);
    node_cdata.ElementType:=xeCData;
    node_cdata.ValueAsString:=CheckStrW(s);
    Result:=true;
  end;
end;
//--------------------------------------------------------------
function TRegdoc2XML.ValueToXML(node:TXMLNode; sName:String; v:Variant; lWriteEmpty:Boolean; nAsAttribute:Integer): Boolean;
var
  s:String;
  lAttribute:Boolean;
begin
  Result:=true;
  s:='';
  if VarIsEmpty(v) then begin
    if not lWriteEmpty then begin
      Result:=false;
    end;
  end else begin
    s:=CheckStrW( VarToStr(v) );
  end;
  if Result then begin
    if nAsAttribute=-1
      then lAttribute:=AsAttribute
      else lAttribute:=(nAsAttribute=1);
    if (s<>'') or lWriteEmpty then begin
      if lAttribute then begin
        node.WriteAttributeString(sName, s)
      end else begin
        case VarType(v) of
          varBoolean: node.WriteBool(sName,v);
        else
          node.WriteString(sName,s);
        end;
      end;
    end;
  end;
end;
//--------------------------------------------------------------
function TRegdoc2XML.DateToStr(d:TDateTime; lAddEmptyTime:Boolean): Utf8String;
begin
  if d>0
    then Result:=CheckStrW(FormatDateTime(FormatDate,d))
    else Result:='';
  if lAddEmptyTime and (Result<>'')
    then Result:=Result+' 00:00:00';
end;
//--------------------------------------------------------------
function TRegdoc2XML.DateTimeToStr(d:TDateTime): Utf8String;
begin
  if d>0
    then Result:=CheckStrW(FormatDateTime(FormatDate+' '+FormatTime,d))
    else Result:='';
end;
//--------------------------------------------------------------
function TRegdoc2XML.SetPathExport(sPath:String):Boolean;
begin
  if DirectoryExists(sPath) then begin
    FPathExport:=CheckSleshN(sPath);
    Result:=true;
  end else begin
    PutError('Путь для выгрузки "'+sPath+'" недоступен.');
    Result:=false;
  end;
end;
//--------------------------------------------------------------
function TRegdoc2XML.getTypeDoc(nType:Integer):String;
begin
{
   // тип документа - DOC_TYPE
   dtPetition   = 1;  // обращения граждан
   dtInfo       = 2;  // справки
   gtIncoming   = 3;  // входящие документы
   gtOutgoing   = 4;  // исходящие документы
   gtAdmProc    = 5;  // административные процедуры

   // базовая группа документов (определяет вид РКК) - GROUP_KIND
   gkIncoming   = 1;  // входящие
   gkOutgoing   = 2;  // исходящие
   gkInternal   = 3;  // внутренние
   gkPetition   = 4;  // обращения граждан
   gkAdmProc    = 5;  // административные процедуры
   gkInfo       = 6;  // справки
}
  case nType of
    dtPetition : Result:='petition';  // обращения граждан
    dtInfo     : Result:='spr';       // справки
    gtIncoming : Result:='incoming';  // входящие документы
    gtOutgoing : Result:='outgoing';  // исходящие документы
    gtAdmProc  : Result:='procedure'; // административные процедуры
  end;
end;
const
  ssh='Регистрационно-контрольная карточка';
//--------------------------------------------------------------
function TRegdoc2XML.getHeadDoc(nType:Integer):String;
begin
  case nType of
    dtPetition : Result:=ssh+' обращений граждан';  // обращения граждан
    dtInfo     : Result:='Форма учета выданных справок (документов)';  // справки
    gtIncoming : Result:=ssh+' входящего документа';  // входящие документы
    gtOutgoing : Result:=ssh+' исходящего документа'; // исходящие документы
    gtAdmProc  : Result:='Регистрационно-контрольная форма регистрации заявлений заинтересованных лиц'; // административные процедуры
  end;
end;
procedure TRegdoc2XML.AddProtokol(sValue:String; lDebug:Boolean);
begin
  FProtokol.Add(sValue);
  if lDebug then
    FDebug.Add(sValue);
end;
//--------------------------------------------------------------
function TRegdoc2XML.DeloToArxiv:Boolean;
var
  dsDelo, dsFiles:TDataSet;
  sDelo,s,sDate,sFileDoc, sFolder, sPath, sDolg, sFIO:String;
  nNum,i,n:Integer;
  nodeInfo, nodeDocs, nodeDoc, nodeFiles:TXMLNode;
begin
  FProtokol.Clear;
  FDebug.Clear;
  Result:=false;
  if not DirectoryExists(FPathExport) then begin
    AddProtokol('Путь для выгрузки "'+FPathExport+'" недоступен.');
    exit;
  end;
//  sPath:=FPathExport+'Дело от '+FormatDateTime('yyyy-mm-dd',Now)+' '+IntToStr(FDelo)+'\';
  sPath:=FPathExport+'Дело '+IntToStr(FDelo)+'\';
  ClearDir(sPath,true);
  if not ForceDirectories(sPath) then begin
    AddProtokol('Ошибка создания папки: "'+sPath+'"');
    exit;
  end;
  sDate:='';
  if FIsDate then begin
    if (FDate1>0) and (FDate2>0) then begin
      sDate:=' and in_delo_date>='+DateToSQL(FDate1)+' and in_delo_date<='+DateToSQL(FDate2);
    end else begin
      AddProtokol('Не заполнен параметр на даты выгрузки в дело');
      exit;
    end;
  end;
  with dmBase.SprDocFileList do begin
    Locate('ID', FDelo, []);
    if FieldByName('DATE_BEGIN').IsNull or FieldByName('DATE_END').IsNull then begin
      AddProtokol('Не заполнены дата начала и дата завершения дела в номенклатуре дел.');
      exit;
    end;
  end;
  s:='';
  for i:=Low(arrTypeDok) to High(arrTypeDok)
    do s:=s+'doc_type='+IntToStr(arrTypeDok[i])+' or ';
  if s<>'' then s:='('+Copy(s,1,Length(s)-4)+')';
  FDebug.Add('SELECT * FROM DocMain WHERE '+s+' and in_file=true and file_id='+IntToStr(FDelo)+sDate+' ORDER BY reg_date, reg_num ');
  dsDelo:=dmBase.OpenQuery(FDebug.Strings[FDebug.Count-1]);
  if dsDelo=nil then begin
    AddProtokol(dmBase.LastError);
    exit;
  end;
  dsFiles:=nil;
  if dsDelo.RecordCount=0 then begin
    AddProtokol('Не найдено документов для выгрузки',true);
  end else begin
    n:=1;
    ClearXml(xmlDelo, FRootDelo);
    ValueToXML(xmlDelo.Root, 'sysid', dmBase.GetSysIdBase, true, 1);   // UUID / GUID – статистически уникальный 128–битный идентификатор, формируется на стороне системы ВСЭД.
    ValueToXML(xmlDelo.Root, 'sysname', GetNameProgram, true, 1);  // Наименование системы отправителя (ВСЭД).
    ValueToXML(xmlDelo.Root, 'sysversion', GetVersionProgram(2), true, 1);
    nodeInfo:=xmlDelo.Root.NodeNew('info');
//    ValueToXML(nodeInfo, 'source', 'LAIS');
    ValueToXML(nodeInfo, 'date', DateTimeToStr(Now));
    ValueToXML(nodeInfo, 'id', FDelo);
    ValueToXML(nodeInfo, 'formatdate', FormatDate);
    ValueToXML(nodeInfo, 'formattime', FormatTime);
    with dmBase.SprDocFileList do begin
      Locate('ID', FDelo, []);
      sDelo:=FieldByName('FILE_IND').AsString;
      ValueToXML(nodeInfo, 'index', sDelo);
      ValueToXML(nodeInfo, 'name', FieldByName('NAME').AsString);
      ValueToXML(nodeInfo, 'period', FieldByName('ARTICLE').AsString);
      ValueToXML(nodeInfo, 'note', FieldByName('NOTE').AsString);
      ValueToXML(nodeInfo, 'begin', DateToStr(FieldByName('DATE_BEGIN').AsDateTime));
      ValueToXML(nodeInfo, 'end', DateToStr(FieldByName('DATE_END').AsDateTime));
    end;
    nodeDocs:=xmlDelo.Root.NodeNew('documents');
    nodeInfo:=nil; //  <-------  ниже новая инициализация
    FPathDoc:='';
    nNum:=1;
    while not dsDelo.Eof do begin
      nodeDoc:=nodeDocs.NodeNew('document');
      sFolder:='DOC-'+getGuid(false);
      FPathDoc:=sPath+sFolder+'\';
      if ForceDirectories(FPathDoc) then begin
        sFileDoc:=getGuid(true)+'.xml';  // имя xml-файла с описанием документа
        ValueToXML(nodeDoc, 'folder', sFolder, true, AS_ATR);
        ValueToXML(nodeDoc, 'type', getTypeDoc(dsDelo.FieldByName('DOC_TYPE').AsInteger), true, AS_ATR);
        ValueToXML(nodeDoc, 'description', sFileDoc, true, AS_ATR);

        ClearXml(xmlRKK, FRootDoc);
        //----------------
//        9.3.1. ElectronicObject  Группирующий элемент для данных о электронном
        nodeInfo:=xmlRKK.Root.NodeNew('ElectronicObject');
//        9.3.2  AkIndexSED          Внутренний идентификатор дела во внешней системе (от 1 до 300 символов)
//        9.3.3  NumberInKeeping     Номер документа в деле.  (Положительное целое число. Минимальное значение 1)
//        9.3.4  IdentificationCode  Регистрационный индекс (№ документа)   (не более 300 символов)
//        9.3.5  Title     Заголовок ЭД    (не более 1500 символов)
//        9.3.6  Heading   Наименование документа  (не более 1500 символов)
//        9.3.11 HasRkk  Наличие регистрационно-контрольной карточки (РКК) (boolean)
//        9.3.16 CreateTs  Дата создания документа  (Формат YYYY-MM-DD hh:mm:ss)
//        9.3.7  OwnerName Обозначает автора электронного документа, которым является физическое лицо, создавшее документ. (не более 300 символов)
//        9.3.17 SourceApproveTs Дата подписания или утверждения документа (YYYY-MM-DD hh:mm:ss)

//???        ValueToXML(nodeInfo, 'AkIndexSED', dsDelo.FieldByName('DOC_ID').AsString); // Внутренний идентификатор дела во внешней системе (от 1 до 300 символов)
        ValueToXML(nodeInfo, 'IDinSED', dsDelo.FieldByName('DOC_ID').AsString); // Внутренний идентификатор дела во внешней системе (от 1 до 300 символов)
        ValueToXML(nodeInfo, 'NumberInKeeping', dsDelo.FieldByName('REG_NUM').AsString);  // 9.3.3  NumberInKeeping  Номер документа в деле.
        ValueToXML(nodeInfo, 'IdentificationCode', dsDelo.FieldByName('REG_IND').AsString);  // 9.3.4  IdentificationCode  Регистрационный индекс (№ документа)
        ValueToXML(nodeInfo, 'Title', dsDelo.FieldByName('CONTENT').AsString);     // краткое содержание /9.3.5  Title Заголовок ЭД (не более 1500 символов)
        ValueToXML(nodeInfo, 'Heading', getHeadDoc(dsDelo.FieldByName('DOC_TYPE').AsInteger));     //
        ValueToXML(nodeInfo, 'HasRKK', 'true');     //
        ValueToXML(nodeInfo, 'CreateTs', DateToStr(dsDelo.FieldByName('REG_DATE').AsDateTime,true)); // 9.3.16 CreateTs  Дата создания документа  (Формат YYYY-MM-DD hh:mm:ss)
        getDolgAndFIOFromSpr(dsDelo.FieldByName('VISIT_MAN').AsString, sDolg, sFIO);
        ValueToXML(nodeInfo, 'OwnerName', Trim(sDolg+ ' '+sFIO));     //
        ValueToXML(nodeInfo, 'SourceApproveTs', DateToStr(dsDelo.FieldByName('REG_DATE').AsDateTime,true),true);  //
        ValueToXML(nodeInfo, 'DateInDelo', DateToStr(dsDelo.FieldByName('IN_DELO_DATE').AsDateTime,true),true);     //

//        9.3.8  ClassDoc  Код класса документа. Соответсвует коду из таблицы 1 из справочника ОКРБ 010-95 «Унифицированные документы» (не более 10 символов)
//        9.3.9  Languages Группирующий элемент для элемента Language
//        9.3.10 Language  String
//        9.3.12 NeedSanction  Информация о наличии требования определенной санкции (ограничения доступа) (Boolean)
//        9.3.13 Keywords Аннотация к документу (не более 2000 символов)
//        9.3.14 ObjectType Код вида ЭД. таблицы 2 «Коды видов документов» ОКРБ 010-95 «Унифицированные документы» (не более 3 символов)
//        9.3.15 Note  Содержит примечания о документе  может совпадать с NoteED (раздел 7.3.16) (не более 2000 символов)

        // ...
        //----------------
        nNum:=nNum+1;
        nodeFiles:=xmlRKK.Root.NodeNew('files');
        //----------------

        s:='SELECT * FROM DocFile WHERE doc_id='+dsDelo.FieldByName('DOC_ID').AsString+' ORDER BY n_order';
        FDebug.Add(s);
        if dsFiles=nil
          then dsFiles:=dmBase.OpenQuery(s)
          else dmBase.ChangeSQL(dsFiles, s);
        while not dsFiles.Eof do begin
          CreateOneFile(dsFiles, nodeFiles);
          dsFiles.Next;
        end;
        xmlRKK.SaveToFile(FPathDoc+sFileDoc);
      end else begin
        AddProtokol('Ошибка создания папки: "'+sFolder+'"', true);
      end;
      dsDelo.Next;
      Inc(n,1);
    end;
    xmlDelo.SaveToFile(sPath+'delo.xml');
    dmBase.FreeQuery(dsFiles);
  end;
  dmBase.FreeQuery(dsDelo);
end;
//--------------------------------------------------------------
function TRegdoc2XML.CreateOneFile(dsFiles:TDataSet; nodeFiles:TXmlNode):Boolean;
var
  s,s1,s2,sFullName, sSign, sInfo, sFileName, sFileArx:String;
  Zip:TZipForge;
  nodeF,nodeS,nodeSn:TXmlNode;
  arr1,arr2:TArrStrings;
  i:Integer;
begin
  Result:=false;
  sFileName:='';
  //--------------------
  if dsFiles.FieldByName('STORE_KIND').AsInteger=stInFolder then begin  // в специальной папке
    sFileArx:=GetDocArxivFolder(s,0)+dsFiles.FieldByName('DIR_YEAR').AsString+'\'+dsFiles.FieldByName('DIR_MONTH').AsString+'\'+dsFiles.FieldByName('DIR_NAME').AsString;
    if FileExists(sFileArx) then begin
      Zip:=TZipForge.Create(nil);
      try
        Zip.FileName:=sFileArx;
        Zip.BaseDir:=FPathDoc;
        Zip.OpenArchive;
        Zip.ExtractFiles(dsFiles.FieldByName('NAME').AsString);
        sFileName:=dsFiles.FieldByName('NAME').AsString;
        Result:=true;
      finally
        Zip.CloseArchive;
        Zip.Free;
      end;
    end else begin
      AddProtokol('Файл '+dsFiles.FieldByName('NAME').AsString+'('+sFileArx+') не найден в специальной папке.',true);
    end;
  end else begin // ссылка на файл
    sFileName:=dsFiles.FieldByName('NAME').AsString;
    sFullName:=NormDir(ChecksleshN(dsFiles.FieldByName('PATH').AsString)+sFileName);
    if sFullName<>'' then begin
      if FileExists(sFullName) then begin
        if CopyFile(PChar(sFullName), PChar(FPathDoc+sFileName), true) then begin
          Result:=true;
        end else begin
          AddProtokol('Ошибка копирования файла "'+sFullName+'" в "'+FPathDoc+sFileName+'" '+IntToStr(GetLastError)+' ('+SysErrorMessage(GetLastError)+') ');
        end;
      end else begin
        AddProtokol('Не найден файл "'+sFullName+'"');
      end;
    end else begin
      AddProtokol('Неизвестно имя файла');
    end;
  end;
  if Result then begin
    nodeF:=nodeFiles.NodeNew('file');
    ValueToXML(nodeF, 'name', sFileName);
    ValueToXML(nodeF, 'id', dsFiles.FieldByName('FILE_ID').AsString);
    ValueToXML(nodeF, 'note', dsFiles.FieldByName('NOTE').AsString);
    s1:=dsFiles.FieldByName('SIGNATURE').AsString;
    s2:=dsFiles.FieldByName('SIGNINFO').AsString;
    StrToArr(s1,arr1,#13#10,true);
    StrToArr(s2,arr2,#13#10,true);
    nodeSn:=nodeF.NodeNew('signatures');
    for i:=low(arr1) to high(arr1) do begin
      nodeS:=nodeSn.NodeNew('signature');
      ValueToXML(nodeS, 'value', arr1[i]);
      ValueToXML(nodeS, 'info', arr2[i]);
    end;
  end;
end;
//--------------------------------------------------------------
function TRegdoc2XML.ExportSprFileDocList:Boolean;
var
  dx:TNativeXML;
  node,row:TXMLNode;
  function check_val(s:String):String;
  begin
    Q_SpaceCompressInPlace(s);
    Result:=s;
  end;
begin
  Result:=true;
  dx:=TNativeXml.Create;
  ClearXml(dx, 'classifier');
  dx.Root.WriteAttributeString('source', 'LAIS');
  dx.Root.WriteAttributeString('id', '1');
  dx.Root.WriteAttributeString('file', 'SprDocFileList');
  dx.Root.WriteAttributeString('name', checkstrw('Номенклатура дел'));
  dx.Root.WriteAttributeString('formatdate', FormatDate);
  dx.Root.WriteAttributeString('version', '1');
  node:=dx.Root.NodeNew('rows');
  with dmBase.SprDocFileList do begin
    First;
    while not Eof do begin
      row:=node.NodeNew('row');
      ValueToXML(row,'id', FieldByName('ID').AsString);
      ValueToXML(row,'parent_id', FieldByName('PARENT_ID').AsString);
      ValueToXML(row,'is_node', FieldByName('IS_NODE').AsString);
      ValueToXML(row,'order', FieldByName('N_ORDER').AsString);
      ValueToXML(row,'index', FieldByName('FILE_IND').AsString);
      ValueToXML(row,'name', check_val(FieldByName('NAME').AsString));
      ValueToXML(row,'period', check_val(FieldByName('ARTICLE').AsString));
      ValueToXML(row,'note', check_val(FieldByName('NOTE').AsString));
      ValueToXML(row,'begin', DateToStr(FieldByName('DATE_BEGIN').AsDateTime));
      ValueToXML(row,'end', DateToStr(FieldByName('DATE_END').AsDateTime));
      Next;
    end;
    First;
  end;
  dx.SaveToFile(FPathExport+'spr_nomenclature.xml');
  dx.Free;
end;

end.
