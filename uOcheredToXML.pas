unit uOcheredToXML;

interface

{$I Task.inc}

uses Classes,Forms, Controls,FuncPr, SysUtils, Variants, Contnrs, db, NativeXML, dbFunc, adsdata, fmProgress, Dialogs,
     adstable, fWarning, uTypes, ifpii_dbfunc, dBase,dMen, uProject, OpisEdit, uCheckKod, uProjectAll, MetaTask;

type
{
   TOpisWrite=record;
     name:String;
     fld:TField;
     Value:Variant;
     DateAsTime:Boolean;
     WriteNull:Boolean;
   end;
   TArrOpisWrite
}
   TOchered2XML=class(TObject)
   private

    FNameRoot: String;
    FSQL: String;
    FFileName: String;
    FVersion: String;
    FProtokol: TStringList;
    FWinOwner: TWinControl;
    FNameExportFile: String;
    FAddIskl: Boolean;
    FMyID:Integer;
    FCurPunktID:Integer;
    FCurPunktKOD:Integer;
    FCurPunktATE:Integer;

    procedure SetNameRoot(const Value: String);
    procedure SetSQL(const Value: String);
    procedure SetFileName(const Value: String);
    procedure SetVersion(const Value: String);
    procedure SetLastError(const Value: String);
    procedure SetProtokol(const Value: TStringList);
    procedure SetWinOwner(const Value: TWinControl);
    procedure SetNameExportFile(const Value: String);
    procedure SetAddIskl(const Value: Boolean);
   public
     WQuery:TAdsQuery;
     VigrMy:Boolean;
     LoadMyOrg:Boolean;
     FLastError:String;
     FWriteNull:Boolean;
     FToUtf8:Boolean;
     FormatDate:String;
     FormatTime:String;
     AsAttribute:Boolean;
     VigrPrim:Boolean;
     IsExportPunktID:Boolean;
     CountMen:Integer;
     SourceID:Integer;
     IsExportMyMen:Boolean;
     XMLDokument:TNativeXml;
     curMen:TdmMen;
     MenProt:String;
     opResid:TOpisEdit;
     opReshType:TOpisEdit;
     opOchType:TOpisEdit;
     opOchSposob:TOpisEdit;
     arrBases:TArrInteger;
     dsOrg:TDataSet;

     property NameExportFile:String read FNameExportFile write SetNameExportFile;
     property AddIskl:Boolean read FAddIskl write SetAddIskl;
     property WinOwner:TWinControl read FWinOwner write SetWinOwner;
     property LastError:String read FLastError write SetLastError;
     property Protokol:TStringList read FProtokol write SetProtokol;
     property Version:String read FVersion write SetVersion;
     property NameRoot:String read FNameRoot write SetNameRoot;
     property SQL:String read FSQL write SetSQL;
     property FileName:String read FFileName write SetFileName;
     function RunExport:Boolean;
     function QueryLoad(lQuery:Boolean): Boolean;
     function RunImport(lQuery:Boolean; lQueryDelete:Boolean; lLoadIskl:Boolean; lDateAndCount:Boolean):Integer;

     function CheckVigrMen(dsOch:TDataSet; nID:Integer; nOch:Integer; var lPlan:Boolean):Boolean;
     function MenToXml(ds:TDataSet; node:TXMLNode): Boolean;
     function EventsToXML(node:TXMLNode; nID:Integer; nOch:Integer):Boolean;
     function OtdelnoToXML(node:TXMLNode; nID:Integer; lFullIskl:Boolean):Boolean;


     function CheckPunktOsn(sPunkt:String):String;
     function CheckOsn(node:TXMLNode; nType:Integer; ds:TDataSet):Boolean;

     function PasportToXml(p:TPassport; node:TXMLNode): Boolean;
     function XMLToPasport(men_node:TXMLNode; dsMen:TDataSet): Boolean;
     function XMLToEvents(node:TXMLNode; nID:Integer; nOch:Integer; nBase:Integer):Boolean;
     function XMLToOtdelno(node:TXMLNode; nID:Integer; curOch:TCurrentRecord; nBase:Integer; lFullIskl:Boolean):Boolean;

     function ObjectsToXml(nID:Integer; men_node:TXMLNode): Boolean;
     function XMLToObjects(men_node:TXMLNode; nID:Integer): Boolean;

     function CheckSprOrg(nSource:Integer;sNameOrg:String;sKratNameOrg:String;sShampOrg:String; dDate:TDateTime; nCount:Integer; sTel:String):Boolean;
     function GetLastDateAndCount(nSource:Integer; var dDate:TDateTime; var nCount :Integer):Boolean;
     function XmlToMen(dm:TdmMen; men_node:TXMLNode): Boolean;
     function WriteInfo:TXMLNode;
     function DeleteInfo(lQueryDelete:Boolean):Boolean;

     function WriteSprOrg:Boolean;
     function CheckStrW(s:String):String;
     function CheckStrR(s:String):String;

     function rProp(node:TXMLNode; sName:String): String;

     procedure AddBase(nID:Integer);
     function SeekBase(nID:Integer):Integer;

     function ValueToXML(node:TXMLNode; sName:String; v:Variant; lWriteEmpty:Boolean=false; lDateAsTime:Boolean=false): Boolean;
     function MemoToXML(node:TXMLNode; sName:String; s:String):Boolean;
     function FieldToXML(node:TXMLNode; sName:String;  fld: TField; lWriteEmpty:Boolean=false; lDateAsTime:Boolean=false): Boolean;

     function XMLToMemo(node:TXMLNode; sName:String):String;
     function XMLToValue(sValue:String; ft:TFieldType; vDefault:Variant): Variant;

     function DateToStr(d:TDateTime): Utf8String;
     function TimeToStr(t:TDateTime): Utf8String;
     function StrToDate(sDate:String): TDateTime;

     procedure AddProtokol(s:String; lAddToLast:Boolean=false);

     constructor Create;
     destructor Destroy; override;
   end;

   function RunOchered2XML:Boolean;
   function RunXML2Ochered:Boolean;

   implementation

uses fMain, StrUtils, DataTask;

//--------------------------------------------------------------
function RunOchered2XML:Boolean;
var
  ex:TOchered2XML;
begin
  Result:=false;
  ex:=TOchered2XML.Create;
  ex.AsAttribute:=true;
  ex.IsExportPunktID:=true;
  ex.VigrPrim:=true;
  ex.AddIskl:=true;
  ex.RunExport;
  ex.Free;
end;

//--------------------------------------------------------------
function RunXML2Ochered:Boolean;
var
  ex:TOchered2XML;
begin
  Result:=false;
  ex:=TOchered2XML.Create;
  ex.NameExportFile:='d:\test.xml';
  ex.AsAttribute:=true;
  ex.RunImport(true,true,true,true);
  ex.Free;
end;

{ TOchered2XML }

//--------------------------------------------------------------
constructor TOchered2XML.Create;
begin
  WQuery:=TAdsQuery.Create(nil);
  with WQuery do begin
    SourceTableType:=dmBase.tbOchered.TableType;
    AdsTableOptions.AdsCharType:=dmBase.tbOchered.AdsTableOptions.AdsCharType; // ANSI;
    AdsConnection:=dmBase.AdsConnection;
    Name:='WQueryVirg';
  end;
  FMyID:=MyID;
  CountMen:=0;
  FVersion:='2';
  FWinOwner:=nil;
  FNameRoot:='database';
  FWriteNull:=false;
  VigrMy:=true;
  LoadMyOrg:=false;   // загружать только иою организацию
  FToUtf8:=true;
  FormatDate:='dd-mm-yyyy';
  FormatTime:='hh:mm';
  FLastError:='';                    
  FAddIskl:=true;
  FNameExportFile:='d:\test.xml';
  XMLDokument:=TNativeXml.Create;
  XMLDokument.XmlFormat:=xfReadable;
  AsAttribute:=true;
  IsExportPunktID:=true;
  SetLength(arrBases,0);
//  XMLDokument.ExternalEncoding:=seAnsi;
//  XMLDokument.EncodingString:='ANSI';
  FProtokol:=TStringList.Create;
//  dsOrg:=dbCreateMemTable('ID,Integer,0;NAME,Char,300;KNAME,Char,200','');
//  dsOrg.Open;
end;
//--------------------------------------------------------------
destructor TOchered2XML.Destroy;
begin
  WQuery.Free;
  XMLDokument.Free;
  FProtokol.Free;
//  dbClose(dsOrg);
  inherited;
end;
//--------------------------------------------------------------
function TOchered2XML.DateToStr(d:TDateTime): Utf8String;
begin
  if d>0
    then Result:=CheckStrW(FormatDateTime(FormatDate,d))
    else Result:='';
end;
//--------------------------------------------------------------
function TOchered2XML.StrToDate(sDate:String): TDateTime;
begin
  Result:=0;
  if (sDate<>'') and (Length(sDate)=10) then begin
    try
      Result:=STOD(sDate,tdVigr);
    except
      Result:=0;
    end;
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.TimeToStr(t:TDateTime): Utf8String;
begin
  Result:=CheckStrW(FormatDateTime(FormatTime,t));
end;
//--------------------------------------------------------------
function TOchered2XML.WriteInfo:TXMLNode;
var
  root_node, info:TXMLNode;
begin
  FLastError:='';
//  FLastError:='Ошибка создания заголовка файла';
  root_node:=XmlDokument.Root;
  info:=root_node.NodeNew('info');
  info.WriteString('source',CheckStrW(Globaltask.ParamAsString('ID')));
  info.WriteString('name',CheckStrW(Globaltask.ParamAsString('NAME')));
  info.WriteString('kname',CheckStrW(Globaltask.ParamAsString('KNAME')));
//  info.WriteString('shtamp',CheckStrW(Globaltask.ParamAsString('SHTAMP')));
  MemoToXML(info, 'shtamp', Globaltask.ParamAsString('SHTAMP') );
  info.WriteString('telefon',CheckStrW(Globaltask.ParamAsString('СЕКР_ТЕЛЕФОН')));
  info.WriteString('date',DateToStr(Now));
  info.WriteString('version',FVersion);
//  info.WriteString('test','Иванов Николай Иванович');
//info.WriteString('formatdate',FormatDate);
//info.WriteString('formattime',FormatTime);
  Result:=info;
end;
//--------------------------------------------------------------
function TOchered2XML.DeleteInfo(lQueryDelete:Boolean):Boolean;
var
  i:Integer;
  sWhere,strSQL:String;
  lDelete:Boolean;
begin
  sWhere:='';
  if LoadMyOrg then begin
    sWhere:='id_base=0 or ';
  end else begin
    for i:=0 to Length(arrBases)-1 do begin
      sWhere:=sWhere+'id_base='+IntToStr(arrBases[i])+' or ';
    end;
  end;
  sWhere:='id_base is not null and ('+Copy(sWhere,1,Length(sWhere)-4)+')';
  WQuery.Active:=false;
  WQuery.SQL.Text:='select TOP 1 id_base from ochered where '+sWhere;
  WQuery.Active:=true;
  lDelete:=not WQuery.Eof;
  WQuery.Active:=false;
  if lDelete then begin
    if lQueryDelete then begin
      lDelete:=Problem('Загружаемая информация присутствует в базе. Удалить?');
    end;
    if lDelete then begin
      strSQL:=Trim(dmBase.LoadSQLEx('Удаление_по_ID_BASE'));
      Result:=false;
      if strSQL='' then begin
        AddProtokol('ошибка чтения файла <Удаление_по_ID_BASE>');
      end else begin
        strSQL:=StringReplace(strSQL, '&ADD_WHERE&', sWhere, [rfReplaceAll, rfIgnoreCase]);
        try
          OpenMessage('Предварительное удаление ...','',10);
          AddProtokol('предварительное удаление');
          dmBase.AdsConnection.Execute(strSQL);
          AddProtokol('успешное окончание удаления перед загрузкой');
          Result:=true;
        except
          on E: Exception do begin
            AddProtokol('ошибка удаления информации перед загрузкой:'+E.Message);
          end;
        end;
        CloseMessage;
      end;
    end else begin
      AddProtokol('отказ от предварительного удаления информации');
      if LoadMyOrg then begin
        Result:=Problem(PadCStr('Продолжить загрузку ?',STD_LEN,' '));
        AddProtokol('продолжение загрузки');
      end else begin
        Result:=false;
      end;
    end;
  end else begin
    Result:=true;
  end;
end;

//--------------------------------------------------------------
function TOchered2XML.WriteSprOrg:Boolean;
var
  nID:Integer;
  bases,base:TXMLNode;
begin
  Result:=true;
  WQuery.Active:=false;
  WQuery.SQL.Text:='select distinct id_base from ochered';
  WQuery.Active:=true;
  bases:=XmlDokument.Root.NodeNew('bases');
  while not WQuery.Eof do begin
    nID:=WQuery.FieldByName('ID_BASE').AsInteger;
    if nID>0 then begin
      if dmBase.SprNames.Locate('ID', nID,[]) then begin
        base:=bases.NodeNew('base');
        base.WriteString('source', dmBase.SprNames.FieldByName('ID').AsString );
        base.WriteString('name', CheckStrW( dmBase.SprNames.FieldByName('NAME').AsString ));
        base.WriteString('kname', CheckStrW( dmBase.SprNames.FieldByName('KNAME').AsString ));
        base.WriteString('telefon', CheckStrW( dmBase.SprNames.FieldByName('TELEFON').AsString ));
        if not dmBase.SprNames.FieldByName('LAST_DATE').IsNull
          then base.WriteString('date', DateToStr(dmBase.SprNames.FieldByName('LAST_DATE').AsDateTime) );
        MemoToXML(base, 'shtamp', dmBase.SprNames.FieldByName('SHTAMP').AsString );
      end else begin
        AddProtokol('организация с кодом '+IntToStr(nID)+' отсутствует в справочнике организаций');
        Result:=false;
      end;
    end;
    WQuery.Next;
  end;
  WQuery.Active:=false;
end;

//--------------------------------------------------------------
function TOchered2XML.CheckStrW(s:String):String;
begin
  if FToUtf8
    then Result:=AnsiToUtf8(s)
    else Result:=s;
end;
//--------------------------------------------------------------
function TOchered2XML.CheckStrR(s:String):String;
begin
  if FToUtf8
    then Result:=Utf8ToAnsi(s)
    else Result:=s;
end;
//--------------------------------------------------------------
function TOchered2XML.XMLToValue(sValue:String; ft:TFieldType; vDefault:Variant): Variant;
begin
  Result:=null;
  if Trim(sValue)='' then begin
    if vDefault<>null then Result:=vDefault;
  end else begin
    case ft of
      ftString,ftMemo : Result:=CheckStrR(sValue);
      ftBoolean  : if (sValue='1') or (UpperCase(sValue)='TRUE') then Result:=true else Result:=false;
      ftDate     : Result:=StrToDate(sValue);
      ftTime,ftTimeStamp
                 : Result:=STOT(sValue);
      ftFloat,ftCurrency
                 :  begin
                      Result:=StrToFloatMy(sValue);
                    end;
      ftLargeint : Result:=StrToInt(sValue);
      ftAutoInc,ftInteger,ftSmallint,ftWord,ftBytes
                 : begin
                     Result:=StrToInt(sValue);
                   end;
      ftBCD,ftFMTBCD : begin
                         Result:=StrToFloatMy(sValue);
                       end;
    else
      Protokol.Add('Неизвестный тип для значения '+svalue);
    end;
  end;
end;

//--------------------------------------------------------------
// значение поле в строку для атрибута
function TOchered2XML.ValueToXML(node:TXMLNode; sName:String; v:Variant; lWriteEmpty:Boolean; lDateAsTime:Boolean): Boolean;
var
  s:String;
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
    if (s<>'') or lWriteEmpty then begin
      if AsAttribute then begin
        node.WriteAttributeString(sName, s);
      end else begin
        node.WriteString(sName,s);
      end;
    end;
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.MemoToXML(node:TXMLNode; sName:String; s:String):Boolean;
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
function TOchered2XML.XMLToMemo(node:TXMLNode; sName:String):String;
var
  node_cdata:TXMLNode;
begin
  node_cdata:=node.FindNode(sName);
  if (node_cdata<>nil) then begin
    if (node_cdata.NodeCount>0) and (node_cdata.Nodes[0].ElementType=xeCData) then begin  // !CDATA  для Memo полей  (пока так)
      Result:=node_cdata.Nodes[0].ValueAsString;
    end else begin
      Result:=node_cdata.ValueAsString;
    end;
    Result:=CheckStrR(Result);
  end;
end;
//--------------------------------------------------------------
// значение поле в строку для атрибута
function TOchered2XML.FieldToXML(node:TXMLNode; sName:String; fld: TField; lWriteEmpty:Boolean; lDateAsTime:Boolean): Boolean;
var
  s:String;
begin
  Result:=true;
  s:='';
  if fld.IsNull then begin
    if not lWriteEmpty then begin
      Result:=false;
    end;
  end else begin
    case fld.DataType of
      ftString,ftMemo : s:=CheckStrW(fld.AsString);
      {
      ftMemo     : begin
  //                             node.AttributeAdd('CDATA','1');
                     node_cdata:=node.NodeNew(AnsiToUtf8(sName));
                     node_cdata.ElementType:=xeCData;
                     node_cdata.ValueAsString:=AnsiToUtf8(DataSet.Fields[i].AsString);
                   end;
      }
      ftBoolean  : if fld.AsBoolean=true then s:='1' else s:='0';
      ftDate     : s:=DateToStr(fld.AsDateTime);
      ftDateTime : begin
                     if lDateAsTime
                       then s:=TimeToStr(fld.AsDateTime)
                       else s:=DateToStr(fld.AsDateTime);
                   end;
      ftTime,ftTimeStamp
                 : s:=TimeToStr(fld.AsDateTime);
      ftFloat,ftCurrency
                 :  begin
                     s:=FloatToStrMy(fld.AsFloat);
                     if s='0' then s:='';
                   end;
      ftLargeint : s:=IntToStr(fld.AsInteger);
      ftAutoInc,ftInteger,ftSmallint,ftWord,ftBytes
                 : begin
                     s:=IntToStr(fld.AsInteger);
                     if s='0' then s:='';
                   end;
      ftBCD,ftFMTBCD : begin
                         s:=FloatToStrMy(fld.AsFloat);
                         if s='0' then s:='';
                       end;
    else
      Protokol.Add('Неизвестный тип поля '+fld.FieldName);
      Result:=false;
    end;
  end;
  if Result then begin
    if (s<>'') or lWriteEmpty then begin
      if AsAttribute then begin
        node.WriteAttributeString(sName, s);
      end else begin
        node.WriteString(sName,s);
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------------
function TOchered2XML.rProp(node:TXMLNode; sName:String): String;
begin
  Result:=node.ReadAttributeString(sName,'');
end;
//--------------------------------------------------------------
procedure TOchered2XML.AddBase(nID:Integer);
begin
  SetLength(arrBases, Length(arrBases)+1);
  arrBases[Length(arrBases)-1]:=nID;
end;
//--------------------------------------------------------------
function TOchered2XML.SeekBase(nID:Integer):Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to Length(arrBases)-1 do begin
    if arrBases[i]=nID then begin
      Result:=i;
      exit;
    end;
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.PasportToXml(p:TPassport; node:TXMLNode): Boolean;
var
  node1:TXMLNode;
begin
  result:=false;
  if (p.UdostKod>0) and ((p.Nomer<>'') or (p.Organ<>'')) then begin
    node1:=node.NodeNew('passport');
    ValueToXML(node1, 'type', p.UdostKod);
    ValueToXML(node1, 'seria', p.Seria);
    ValueToXML(node1, 'nomer', p.Nomer);
    ValueToXML(node1, 'date', DateToStr(p.Date));
    ValueToXML(node1, 'srok', DateToStr(p.Srok));
    ValueToXML(node1, 'organ', p.Organ);
    ValueToXML(node1, 'seria', p.Seria);
    result:=true;
  end;
end;

//------------------------------------------------------------------------------------
//procedure TOchered2XML.CheckRekv('PASP_UDOST', sValue);
//begin
//end;
//------------------------------------------------------------------------------------
function TOchered2XML.XMLToPasport(men_node:TXMLNode; dsMen:TDataSet): Boolean;
var
  node:TXMLNode;
  d:TDateTime;
begin
  Result:=false;
  node:=men_node.FindNode('passport');
  if node<>nil then begin
    dmBase.WriteValueProp('PASP_VIDAN', XMLToValue(rProp(node,'organ'),ftString, ''),dmBase.GetDateCurrentSost,
                          dsMen.FieldByName('ID').AsInteger, _TypeObj_Nasel, ftMemo);
    dsMen.FieldByName('PASP_SERIA').AsString:=XMLToValue(rProp(node,'seria'),ftString, '');
    dsMen.FieldByName('PASP_NOMER').AsString:=XMLToValue(rProp(node,'nomer'),ftString, '');
    d:=XMLToValue(rProp(node,'date'),ftDate, 0);  if d>0 then dsMen.FieldByName('PASP_DATE').AsDateTime:=d;
    dsMen.FieldByName('PASP_UDOST').AsString:=XMLToValue(rProp(node,'type'),ftString, '');   // контроль !!!!
//    CheckRekv('PASP_UDOST', dsMen.FieldByName('PASP_UDOST').AsString);
    d:=XMLToValue(rProp(node,'srok'),ftDate, 0);  if d>0 then dsMen.FieldByName('PASP_SROK').AsDateTime:=d;
    Result:=true;
  end;
end;

//------------------------------------------------------------------------------------
function TOchered2XML.ObjectsToXml(nID:Integer; men_node:TXMLNode): Boolean;
var
  node,node1:TXMLNode;
begin
  Result:=false;
  dmBase.tbMensSobst.IndexName := 'MEN_KEY';
  dmBase.tbMensSobst.SetRange([nID],[nID]);
  with dmBase.tbMensSobst do begin
    if not Eof then begin
      node:=men_node.NodeNew('objects');
      Result:=true;
      while not Eof do begin
        if FieldByName('KADASTR').AsString<>'' then begin
          node1:=node.NodeNew('object');
          FieldToXML(node1, 'kadastr', FieldByName('KADASTR') );
          FieldToXML(node1, 'adres', FieldByName('ADRES') );
          FieldToXML(node1, 'dest', FieldByName('DEST') );
          FieldToXML(node1, 'plosh_all', FieldByName('PLOSH_ALL') );
          FieldToXML(node1, 'dater', FieldByName('DATER') );
          FieldToXML(node1, 'datep', FieldByName('DATEP') );
          FieldToXML(node1, 'tail', FieldByName('TAIL') );
          FieldToXML(node1, 'pravo', FieldByName('PRAVO') );
          FieldToXML(node1, 'prim', FieldByName('PRIM') );
        end;
        Next;
      end;
    end;
    CancelRange;
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.XMLToObjects(men_node:TXMLNode; nID:Integer): Boolean;
var
  node:TXMLNode;
  d:TDateTime;
  i:Integer;
  fl:Extended;
  s:String;
begin
  Result:=false;
  node:=men_node.NodeByName('objects'); //FindNode('objects');
  if node<>nil then begin
    for i:=0 to node.NodeCount-1 do begin
      if node.Nodes[i].Name='object' then begin
        s:=Trim(XMLToValue(rProp(node.Nodes[i],'kadastr'),ftString,''));
        if s<>'' then begin
          with dmBase.tbMensSobst do begin
            Append;
            try
              FieldByName('ID').AsInteger:=nID;
              FieldByName('KADASTR').AsString:=s;
              FieldByName('DEST').AsString:=XMLToValue(rProp(node.Nodes[i],'dest'),ftString,'');
              FieldByName('ADRES').AsString:=XMLToValue(rProp(node.Nodes[i],'adres'),ftString,'');
              d:=XMLToValue(rProp(node.Nodes[i],'dater'),ftDate, 0);   if d>0 then FieldByName('DATER').AsDateTime:=d;
              d:=XMLToValue(rProp(node.Nodes[i],'datep'),ftDate, 0);   if d>0 then FieldByName('DATEP').AsDateTime:=d;
              FieldByName('TAIL').AsString:=XMLToValue(rProp(node.Nodes[i],'tail'),ftString,'');
              FieldByName('PRAVO').AsString:=XMLToValue(rProp(node.Nodes[i],'pravo'),ftString,'');
              FieldByName('PRIM').AsString:=XMLToValue(rProp(node.Nodes[i],'dest'),ftString,'');
              fl:=XMLToValue(rProp(node.Nodes[i],'plosh_all'),ftFloat, 0);  if fl>0 then FieldByName('PLOSH_ALL').AsFloat:=fl;
              Post;
            except
              Cancel;
            end
          end;
        end;
      end;
    end;
  end;
end;
//-----------------------------------------------------------------------------------
function TOchered2XML.EventsToXML(node:TXMLNode; nID:Integer; nOch:Integer):Boolean;
var
  ev_node,node1:TXMLNode;
  dsSpr:TDataSet;
  n:Integer;
begin
  {
0=общая
1=многодетная семья
2=социальное жилье
3=военнослужащие
  OCH_RESH_POST=1;
  OCH_RESH_VOST=2;
  OCH_RESH_RAZD=3;
  OCH_RESH_PERE=4;
  OCH_RESH_UNION=5;
  OCH_RESH_SN=9;
}
  Result:=false;
  with dmBase.tbOcheredResh do begin
    IndexName := 'PR_KEY';
    SetRange([nID,nOch],[nID,nOch]);
    if not Eof then begin
      ev_node:=nil;
      while not Eof do begin
        // проектные решения не выгружаем
        if FieldByName('PLAN').IsNull or not FieldByName('PLAN').AsBoolean then begin
          Result:=true;
          if ev_node=nil then begin
            ev_node:=node.NodeNew('events');
          end;
          node1:=ev_node.NodeNew('resh');
    //      ValueToXML(node1, 'och', FieldByName('OCHERED_ID').AsString );
    //      ValueToXML(node1, 'type', opReshType.Naim(FieldByName('TIP').AsString) );
          ValueToXML(node1, 'type', FieldByName('TIP').AsString );
          FieldToXML(node1, 'date', FieldByName('DATER') );
          FieldToXML(node1, 'nomer', FieldByName('NOMER') );
          n:=FieldByName('OSNOV').AsInteger;
          if n>0 then begin
            if VigrMy then
              ValueToXML(node1, 'osnov', IntToStr(n) );
            dsSpr:=SeekOsnOch(n);
            if dsSpr<>nil then begin
              FieldToXML(node1, 'osnov_punkt', dsSpr.FieldByName('PUNKT') );
              FieldToXML(node1, 'osnov_ukaz',  dsSpr.FieldByName('UKAZ') );
            end;
          end else begin
            FieldToXML(node1, 'osnov_text', FieldByName('OSNOV_TEXT') );
          end;
          n:=FieldByName('OSNOV2').AsInteger;
          if n>0 then begin
            if VigrMy then
              ValueToXML(node1, 'osnov2', IntToStr(n) );
            dsSpr:=SeekOsnOch(n);
            if dsSpr<>nil then begin
              FieldToXML(node1, 'osnov2_punkt', dsSpr.FieldByName('PUNKT') );
              FieldToXML(node1, 'osnov2_ukaz',  dsSpr.FieldByName('UKAZ') );
            end;
          end else begin
            FieldToXML(node1, 'osnov2_text', FieldByName('OSNOV_TEXT2') );
          end;
          FieldToXML(node1, 'dates', FieldByName('DATE_SILA') );
          if FieldByName('OTKAZ').AsBoolean then ValueToXML( node1, 'otkaz', '1');
        end;
        Next;
      end;
      CancelRange;
    end;
  end;
end;

//--------------------------------------------------------------
function TOchered2XML.CheckVigrMen(dsOch:TDataSet; nID:Integer; nOch:Integer; var lPlan:Boolean):Boolean;
var
  n:integer;
begin
  {$IFDEF OCHERED}
  if not IsExportMyMen and (dsOch.FieldByName('ID_BASE').AsInteger=0) then begin
    Result:=false;
    exit;
  end;
  {$ENDIF}

  n:=0;
  lPlan:=false;
  with dmBase.tbOcheredResh do begin
    IndexName := 'PR_KEY';
    SetRange([nID,nOch],[nID,nOch]);
    if not Eof then begin
      while not Eof do begin
        // проектные решения не выгружаем
        if not FieldByName('PLAN').IsNull and FieldByName('PLAN').AsBoolean then begin
          lPlan:=true;
        end else begin
          Inc(n,1);
        end;
        Next;
      end;
    end;
    CancelRange;
  end;
  if lPlan then begin
    if n>0
      then Result:=true
      else Result:=false;
  end else begin
    Result:=true;
  end;
//  if not Result  then ShowMessage(IntToStr(nID));
end;
//--------------------------------------------------------------
function TOchered2XML.MenToXml(ds:TDataSet; node:TXMLNode): Boolean;
var
  men_node, node1:TXMLNode;
  dsMen:TDataSet;
  nID,n,nIDS : Integer;
  s:String;
  adr:TAdres;
  DateFiks:TDateTime;
//  slFld:TStringList;
  p:TPassport;
  lFullIskl,lIskl,lPlan:Boolean;
  nIDLast, nIDPost, nIDSn:Integer;
  lVigrIN:Boolean;
begin
  nID := ds.FieldByName('ID').AsInteger;
  DateFiks:=dmBase.GetDateCurrentSost;
  dsMen:=dmBase.GetMen(dmBase.GetDateCurrentSost,IntToStr(nID));
  lVigrIN:=GlobalTask.ParamAsBoolean('VOCH_IN');

  result:=false;

  if dsMen=nil then begin  //  !!!  ОШИБКА
    exit;
  end;
  if not CheckVigrMen(ds,nID,0,lPlan) then begin   // проверим, а надо ли выгружать человека
    exit;
  end;

//  if not dsMen.FieldByName('DATES').IsNull then begin
//    exit;   // умершего человека не выгружаем
//  end;
  result:=true;
  men_node:=node.NodeNew('men');

{  slFld:=TStringList.Create;
  slFld.AddObject('fam',dsMen.FieldByName('FAMILIA'));
  slFld.AddObject('name',dsMen.FieldByName('NAME'));
}
  {$IFDEF OCHERED}
    FieldToXML(men_node, 'base', ds.FieldByName('ID_BASE'));
  {$ENDIF}
  FieldToXML(men_node, 'fam', dsMen.FieldByName('FAMILIA'));
  FieldToXML(men_node, 'name', dsMen.FieldByName('NAME'));
  FieldToXML(men_node, 'otch', dsMen.FieldByName('OTCH'));
  FieldToXML(men_node, 'dater', dsMen.FieldByName('DATER'));
  FieldToXML(men_node, 'dates', dsMen.FieldByName('DATES'));
  FieldToXML(men_node, 'pol', dsMen.FieldByName('POL'));
  if lVigrIN then
    FieldToXML(men_node, 'in', dsMen.FieldByName('LICH_NOMER'));

  n:=dsMen.FieldByName('CITIZEN').AsInteger;
  if (n=0) or (n=MY_GRAG) then begin
  end else begin
    FieldToXML(men_node, 'citizen', dsMen.FieldByName('CITIZEN'));
    // из других систем можно выгружать "лицо без гражданства"  , "иностранный гражданин"
  end;
  FieldToXML(men_node, 'tel', dsMen.FieldByName('TELEFON'));
  FieldToXML(men_node, 'delo', ds.FieldByName('DELO'));
  FieldToXML(men_node, 'dec_time', ds.FieldByName('DEC_TIME'), false, true);
  FieldToXML(men_node, 'dec_date', ds.FieldByName('DEC_DATE'));
  FieldToXML(men_node, 'dec_date_real', ds.FieldByName('DEC_DATE_REAL'));
  FieldToXML(men_node, 'date_check', ds.FieldByName('PER_DATE'));
  FieldToXML(men_node, 'nomer', ds.FieldByName('NOMER_OCH'));
//  ValueToXML(men_node, 'room', opResid.Naim(ds.FieldByName('RESIDENCE').AsString) );  // тип занимаемого жилья
//  FieldToXML(men_node, 'room_kod', ds.FieldByName('RESIDENCE') );
  FieldToXML(men_node, 'room', ds.FieldByName('RESIDENCE') );
  FieldToXML(men_node, 'room_date', ds.FieldByName('RESIDENCE_DATE') );

  if ds.FieldByName('ONLY').AsBoolean   then ValueToXML( men_node, 'only', '1');
  if ds.FieldByName('SIROTA').AsBoolean then ValueToXML( men_node, 'sirota', '1');
  if ds.FieldByName('NEWSEM').AsBoolean then ValueToXML( men_node, 'newfamily', '1');
  if ds.FieldByName('IS_UCHASTOK').AsBoolean then ValueToXML( men_node, 'uch', '1');

  if lPlan then begin   // !!!    если есть проектные решения
    lIskl:=dmBase.GetIDLastReshOchered_(nID, 0, true, nIDLast, nIDPost, nIDSn);
  end else begin
    lIskl:=ds.FieldByName('ISKL').AsBoolean;
  end;
  if lIskl then ValueToXML( men_node, 'iskl', '1');
  lFullIskl:=lIskl;

  //------ закладка документы ----------------------------------------------------------------
  MemoToXML(men_node, 'doc', ds.FieldByName('OCHERED_DOK').AsString);

  //------ закладка примечание ----------------------------------------------------------------
  if VigrPrim then begin
    node:=men_node.NodeNew('add');
    FieldToXML(node, 'kol_kom', ds.FieldByName('KOLVO_KOMN'));
    if ds.FieldByName('UCHASTOK').AsBoolean=true then FieldToXML(node, 'uch', ds.FieldByName('UCHASTOK'));
    FieldToXML(node, 'gsk', ds.FieldByName('GSK'));    // если будет справочник то переделать  !!!!
    FieldToXML(node, 'kredit_date', ds.FieldByName('KREDIT_DATE'));
    FieldToXML(node, 'kredit_summa', ds.FieldByName('KREDIT_SUMMA'));
    FieldToXML(node, 'kredit_nomer', ds.FieldByName('KREDIT_NOMER'));
    FieldToXML(node, 'kredit_resh', ds.FieldByName('KREDIT_RESH'));
    FieldToXML(node, 'subsid_date', ds.FieldByName('SUBSID_DATE'));
    FieldToXML(node, 'subsid_summa', ds.FieldByName('SUBSID_SUMMA'));
    FieldToXML(node, 'subsid_resh', ds.FieldByName('SUBSID_RESH'));
    FieldToXML(node, 'add_ochered', ds.FieldByName('DOP_OCHERED'));
    FieldToXML(node, 'add_date', ds.FieldByName('DOP_DATE'));
    FieldToXML(node, 'office', ds.FieldByName('SLUGEB_POMECH'));
    //------- улучшение жил. условий -----------------------------------------------------------
    if not ds.FieldByName('SOCIAL').IsNull and (ds.FieldByName('SOCIAL').AsInteger>0) then begin
      node1:=node.NodeNew('new');
//      ValueToXML(node1, 'type', opOchSposob.Naim(ds.FieldByName('SOCIAL').AsString) );
//      if ds.FieldByName('SOCIAL').AsInteger>0 then ValueToXML(node1, 'type_kod', ds.FieldByName('SOCIAL').AsInteger );
      ValueToXML(node1, 'type', ds.FieldByName('SOCIAL').AsString );
      if not ds.FieldByName('NEW_ADRES_ID').IsNull then begin
        s:=dmBase.AdresFromID(dmbase.GetDateCurrentSost, ds.FieldByName('NEW_ADRES_ID').AsString, false);
        ValueToXML(node1,'adres', s);
      end;
      FieldToXML(node1, 'plosh_all', ds.FieldByName('NEW_PLOSH_ALL'));
      FieldToXML(node1, 'kol_kom', ds.FieldByName('NEW_KOLVO_KOMN'));
      FieldToXML(node1, 'dogovor', ds.FieldByName('NEW_DOGOVOR'));
      FieldToXML(node1, 'date', ds.FieldByName('NEW_DATE'));
    end;
    men_node.DeleteEmptyNodes;
  end;
  //------ паспорт ----------------------------------------------------------------
  p:=dmBase.PasportMen(dmbase.GetDateCurrentSost,IntToStr(nID));
  PasportToXML(p,men_node);
  //------ адрес ----------------------------------------------------------------
  node:=men_node.NodeNew('adres');
  adr:=dmBase.AdresMen(DateFiks,IntToStr(nID),s);
  if adr.OnlyText then begin
    ValueToXML(node, 'text', adr.AdresPropis);
    ValueToXML(node, 'reg', '0');
  end else begin
    if (adr.PunktKod>0) and IsExportPunktID then begin
      if adr.PunktKod<>FCurPunktID then begin
        if dmBase.SprPunkt.Locate('ID', adr.PunktKod, []) then begin
          n:=dmBase.SprPunkt.FieldByName('KOD').AsInteger;
          FCurPunktKOD:=n;
          if FCurPunktKOD>0 then begin
            if dmBase.SprSoato.Locate('ID', FCurPunktKOD, []) then begin
              n:=dmBase.SprSOATO.FieldByName('ATE_ID').AsInteger;
              if n>0 then begin
                FCurPunktATE:=n;
              end;
            end;
          end;
        end;
      end;
      if VigrMy then
        if FCurPunktKOD>0  then ValueToXML(node, 'kod', IntToStr(FCurPunktKOD));
      if FCurPunktATE>0  then ValueToXML(node, 'ate', IntToStr(FCurPunktATE));
    end;
    ValueToXML(node, 'obl', adr.obl);
    ValueToXML(node, 'rn', adr.raion);
    ValueToXML(node, 'rng', adr.RnGorName);
    if (adr.AdresID>0) or ((adr.PunktN<>'') and (adr.PunktTK>0)) then begin
      ValueToXML(node, 'np', adr.PunktN);
//      ValueToXML(node, 'npt', adr.PunktTN);
      ValueToXML(node, 'npt', adr.PunktTK);
    end else begin
      ValueToXML(node, 'punkt', adr.Punkt);
    end;
    ValueToXML(node, 'ul', adr.ulica);
    ValueToXML(node, 'dom', adr.ndom);
    ValueToXML(node, 'korp', adr.korp);
    ValueToXML(node, 'kv', adr.kv);
  end;
  FieldToXML(node, 'plosh_all', ds.FieldByName('PLOSH_ALL'));
  FieldToXML(node, 'kol_kom', ds.FieldByName('KOLVO_KOMN_PR'));
  FieldToXML(node, 'kol_prop', ds.FieldByName('KOLVO_PROPIS'));


  //------ решения ----------------------------------------------------------------
  EventsToXML(men_node, nID, 0);

  //------ отдельные очереди ----------------------------------------------------------------
  OtdelnoToXML(men_node, nID, lFullIskl);

  //------ объекты собственности ----------------------------------------------------------------
  ObjectsToXml(nID,men_node);

  //------ сотав семьи ----------------------------------------------------------------
  node:=men_node.NodeNew('sostav');
  dmBase.tbSostavSem.IndexName := 'PR_KEY';
  dmBase.tbSostavSem.SetRange([nID],[nID]);

  while not dmBase.tbSostavSem.Eof do begin
    if not dmBase.tbSostavSem.FieldByName('ISKL').AsBoolean then begin
      nIDS:=dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger;
      dsMen:=dmBase.GetMen(dmBase.GetDateCurrentSost,IntToStr(nIDS));
      p.UdostKod:=0;
      if dsMen=nil then begin
  //      ShowMessageC(IntToStr(nID)+'  '+IntToStr(nIDS)+'  '+dmBase.tbSostavSem.FieldByName('FAMILIA').AsString);
        dsMen:=dmBase.tbSostavSem;
      end else begin
        //------ паспорт ----------------------------------------------------------------
        p:=dmBase.PasportMen(dmbase.GetDateCurrentSost,IntToStr(nIDS));
      end;
      node1:=node.NodeNew('men');
      s:=dmBase.tbSostavSem.FieldByName('OTNOSH').AsString;
      if (s<>'') and dmBase.SprOtnosh.Locate('ID', s, []) then begin
        s:=ANSILowerCase(Trim(dmBase.SprOtnosh.FieldByName('NAME').AsString));
        ValueToXML(node1, 'otn', s);
      end;
      FieldToXML(node1, 'fam', dsMen.FieldByName('FAMILIA') );
      FieldToXML(node1, 'name', dsMen.FieldByName('NAME') );
      FieldToXML(node1, 'otch', dsMen.FieldByName('OTCH') );
      if lVigrIN then
        FieldToXML(node1, 'in', dsMen.FieldByName('LICH_NOMER') );
      FieldToXML(node1, 'dater', dsMen.FieldByName('DATER') );
      FieldToXML(node1, 'pol', dsMen.FieldByName('POL') );
      PasportToXML(p,node1);
      ObjectsToXml(nIDS,node1);
    end;
    dmBase.tbSostavSem.Next;
  end;

  dmBase.tbSostavSem.CancelRange;
  {
  //------ льготы ----------------------------------------------------------------
  with dmBase.tbMensLgot do begin
    IndexName := 'PR_KEY';
    SetRange([DateFiks,nID],[DateFiks,nID]);
    node1:=nil;
    while not Eof do begin
      if dmBase.SprLgot.Locate('ID',FieldByName('KOD').Asinteger,[]) then begin
        if not dmBase.SprLgot.FieldByName('OCH_KOD').IsNull then begin
          if node1=nil
            then node1:=men_node.NodeNew('lgot');
          node2:=node1.NodeNew('row');
          node2.WriteAttributeString('code', CheckStrW(dmBase.SprLgot.FieldByName('OCH_KOD').AsString));
          node2.WriteAttributeString('name', CheckStrW(dmBase.SprLgot.FieldByName('NAME').AsString));
        end;
      end;
      Next;
    end;
    CancelRange;
  end;
  }
  //dmBase.GetReshOch(ds.FieldByName('ID_POST_RESH').AsInteger);
end;
//--------------------------------------------------------------
function TOchered2XML.RunExport: Boolean;
var
//  st:TsostTable;
  dsOch:TDataSet;
  node,node_info:TXMLNode;
  nCheck,nCount,n,m:Integer;
  lOk:Boolean;
begin
  Result:=false;
  FLastError:='';
  FProtokol.Clear;
  XMLDokument.Clear;
  XMLDokument.XmlFormat:=xfReadable;
  XMLDokument.ExternalEncoding:=seANSI;
  XMLDokument.EncodingString:='windows-1251';
  XMLDokument.Root.Name:=FNameRoot;
  CountMen:=0;
  {$IFDEF OCHERED}
  IsExportMyMen:=Globaltask.ParamAsBoolean('OCH_VIGR_MY');
  {$ELSE}
  IsExportMyMen:=true;
  {$ENDIF}

  FCurPunktID:=-1;     // ID из спр. нас. пунктов
  FCurPunktKOD:=0;    // ID из спр. соато
  FCurPunktATE:=0;    // ID из спр. ATE
  lOk:=true;
  node_info:=WriteInfo;
  if node_info=nil then begin
    lOk:=false;
  end;
  {$IFDEF OCHERED}
  if lOk then begin
    lOk:=WriteSprOrg;
  end;
  {$ENDIF}
  if lOk then begin
    opResid:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_RESIDENCE');
    opReshType:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPE_RESH');
    opOchType:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEOCHERED');
    opOchSposob:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_OCHERED_SPOSOB');

    nCount:=0;
    n:=0;
    if FSQL='' then begin
  //    st:=SaveSostTable(dmBase.tbOchered, true, true);
      WQuery.Active:=false;
      WQuery.SQL.Text:='select * from ochered where ochered_id=0';
      if not FAddIskl then WQuery.SQL.Text:=WQuery.SQL.Text+' and iskl=false';
      {$IFDEF OCHERED}
        WQuery.SQL.Text:=WQuery.SQL.Text+' order by id_base, nomer_och';
      {$ELSE}
        WQuery.SQL.Text:=WQuery.SQL.Text+' order by nomer_och';
      {$ENDIF}
      try
        OpenMessage('Подготовка выгрузки','',10);
  //      dmBase.tbOchered.IndexName:='NOMER_KEY';
  //      dmBase.tbOchered.Filter:='ochered_id=0';
  //      if not FAddIskl then dmBase.tbOchered.Filter:=dmBase.tbOchered.Filter+' and iskl=false';
        WQuery.Open;
  //      dmBase.tbOchered.Filtered:=true;
  //      dmBase.tbOchered.AdsTableOptions.AdsFilterOptions:=RESPECT_WHEN_COUNTING;
  //      m:=dmBase.tbOchered.RecordCount;
  //      dmBase.tbOchered.AdsTableOptions.AdsFilterOptions:=IGNORE_WHEN_COUNTING;
  //      m:=dmBase.tbOchered.RecordCount;
        m:=WQuery.RecordCount;
        dsOch:=WQuery;
        CloseMessage;
        if m>1000 then nCheck:=100 else nCheck:=10;
        CreateProgress('Очередники', 'Выгрузка информации', m);
        ChangeProgress(1, 'Выгрузка информации');
        node:=XMLDokument.Root.NodeNew('rows');
        while not dsOch.Eof do begin
          if MenToXml(dsOch,node) then begin
            nCount:=nCount+1;
            Inc(n,1);
            if n=nCheck then begin
              n:=0;
              ChangeProgress(nCount, 'Выгрузка информации');
            end;
          end;
          dsOch.Next;
        end;
        ChangeProgress(m, 'Выгрузка информации');
      finally
  //      dmBase.tbOchered.AdsTableOptions.AdsFilterOptions:=IGNORE_WHEN_COUNTING;
  //      RestSostTable( dmBase.tbOchered, st);
        CloseProgress;
      end;
    end else begin
      {
      WQuery.Active:=false;
      WQuery.SQL.Text:=FSQL;
      WQuery.Open;
      while WQuery.Eof do begin

        WQuery.Next;
      end;
      WQuery.Close;
      }
    end;
    OpenMessage('Сохранения файла ...','',10);
    try
      node_info.WriteString('count',IntToStr(nCount));
      CountMen:=nCount;
      Result:=true;
      try
        XMLDokument.SaveToFile(FNameExportFile);
      except
        on E: Exception do begin
          Result:=false;
          FLastError:=E.Message;
        end;
      end;
    finally
      CloseMessage;
    end;
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.GetLastDateAndCount(nSource:Integer; var dDate:TDateTime; var nCount :Integer):Boolean;
begin
  Result:=false;
  if dmBase.SprNames.Locate('ID', nSource,[]) then begin
    Result:=true;
    if dmBase.SprNames.FieldByName('LAST_DATE').IsNull
      then dDate:=0
      else dDate:=dmBase.SprNames.FieldByName('LAST_DATE').AsDateTime;
    nCount:=dmBase.SprNames.FieldByName('LAST_COUNT').AsInteger;
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.CheckSprOrg(nSource:Integer;sNameOrg:String;sKratNameOrg:String;sShampOrg:String; dDate:TDateTime; nCount:Integer; sTel:String):Boolean;
var
  sSoato:String;
begin
  if dmBase.SprSoato.Locate('ID', nSource,[]) then begin
    Result:=true;
    sSoato:=dmBase.SprSoato.FieldByName('KOD').AsString;
    if dmBase.SprNames.Locate('ID', nSource,[]) then begin
      dmBase.SprNames.Edit;
    end else begin
      dmBase.SprNames.Append;
    end;
    with dmBase.SprNames do begin
      FieldByName('SOATO').AsString   := sSoato;
      FieldByName('ID').AsInteger     := nSource;
      FieldByName('NAME').AsString    := sNameOrg;
      FieldByName('NAME_B').AsString  := '';
      FieldByName('KNAME').AsString   := sKratNameOrg;
      FieldByName('KNAME_B').AsString := '';
      FieldByName('SHTAMP').AsString  := sShampOrg;
      FieldByName('TELEFON').AsString  := sTel;
      FieldByName('HANDLED').AsBoolean := false;
      if nCount>0
        then FieldByName('LAST_COUNT').AsInteger := nCount;
      if dDate>0
        then FieldByName('LAST_DATE').AsDateTime := dDate;
    end;
    dmBase.SprNames.Post;
  end else begin
    Result:=false;
    AddProtokol('организация с кодом '+IntToStr(nSource)+' ('+sKratNameOrg+') отсутствует в системном справочнике');
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.CheckPunktOsn(sPunkt:String):String;
begin
  CharDel(sPunkt,'п');
  sPunkt:=Trim(sPunkt);
  if Copy(sPunkt,1,1)='.'
    then sPunkt:=Copy(sPunkt,2,Length(sPunkt));
  if RightStr(sPunkt,1)<>'.' then sPunkt:=sPunkt+'.';
end;
//--------------------------------------------------------------
function TOchered2XML.CheckOsn(node:TXMLNode; nType:Integer; ds:TDataSet):Boolean;
var
  n:Integer;
  s,ss,sAdd:String;
  dsSpr:TDataSet;
  fld,fldT:TField;
begin
  Result:=false;
  if nType=2 then sAdd:='2' else sAdd:='';
  fld:=ds.FindField('OSNOV'+sAdd);
  fldT:=ds.FindField('OSNOV_TEXT'+sAdd);
  n:=XMLToValue(rProp(node,'osnov'+sAdd),ftInteger, 0);
  if n>0 then begin
    if SeekOsnOch(n)=nil then begin
      // !!!! ошибка
    end else begin
      fld.AsInteger:=n;
      Result:=true;
    end;
  end else begin
    s:=CheckPunktOsn( XMLToValue(rProp(node,'osnov'+sAdd+'_punkt'),ftString, '') );
    ss:=XMLToValue(rProp(node,'osnov'+sAdd+'_ukaz'),ftString, '');
    if (s<>'') and (ss<>'') then begin
      dsSpr:=GetDataSetSprOsnOch(ds.FieldByName('TIP').AsInteger);
      if dsSpr.Locate('UKAZ;PUNKT', VarArrayOf([s,ss]),[]) then begin
        fld.AsInteger:=dsSpr.FieldByName('ID').AsInteger;
        Result:=true;
      end else begin
        // !!!! ошибка
      end;
    end else begin
      fldT.AsString:=XMLToValue(rProp(node,'osnov'+sAdd+'_text'),ftString, '');
      if fldT.AsString<>''
        then Result:=true;
    end;
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.XMLToEvents(node:TXMLNode; nID:Integer; nOch:Integer; nBase:Integer):Boolean;
var
  cur_node, ev_node:TXMLNode;
  ds:TDataSet;
  i:Integer;
  d:TDateTime;
begin
  Result:=false;
  ev_node:=node.FindNode('events');
  if ev_node<>nil then begin
    ds:=dmBase.tbOcheredResh;
    for i:=0 to ev_node.NodeCount-1 do begin
      if ev_node.Nodes[i].Name='resh' then begin
        cur_node:=ev_node.Nodes[i];
        ds.Append;
        ds.FieldByName('ID').AsInteger:=nID;
        ds.FieldByName('OCHERED_ID').AsInteger:=nOch;
        ds.FieldByName('TIP').AsInteger:=XMLToValue(rProp(cur_node,'type'),ftInteger, 0);  // !!!! контроль
        d:=XMLToValue(rProp(cur_node,'date'),ftDate, 0);
        if d>0 then begin
          ds.FieldByName('DATER').AsDateTime:=d;
          ds.FieldByName('DATE_SORT').AsDateTime:=d;
        end;
        d:=XMLToValue(rProp(cur_node,'dates'),ftDate, 0);  if d>0 then ds.FieldByName('DATE_SILA').AsDateTime:=d;
        ds.FieldByName('NOMER').AsString:=XMLToValue(rProp(cur_node,'nomer'),ftString, '');
        ds.FieldByName('ID_BASE').AsInteger:=nBase;
        ds.FieldByName('OTKAZ').AsBoolean:=XMLToValue(rProp(cur_node,'otkaz'),ftBoolean, false);
        CheckOsn(cur_node,1,ds);   // обработать ошибки
        CheckOsn(cur_node,2,ds);   // обработать ошибки
        ds.Post;
      end;
    end;
    dmBase.SetIDLastReshOchered_(dmBase.tbOchered);
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.OtdelnoToXML(node:TXMLNode; nID:Integer; lFullIskl:Boolean):Boolean;
var
  st:TSostTable;
  och_node, cur_node:TXMLNode;
  nOch,nIDLast,nIDPost,nIDSn:Integer;
  lIskl,lPlan:Boolean;
begin
  Result:=false;
  st:=SaveSostTable(dmBase.tbOchered, true, true);
  och_node:=nil;
  try
    with dmBase.tbOchered do begin
      IndexName:='MEN_KEY';
      SetRange([nID],[nID]);
      while not Eof do begin
        nOch:=FieldByName('OCHERED_ID').AsInteger;
        if nOch>0 then begin
          if CheckVigrMen(dmBase.tbOchered, nID, nOch, lPlan) then begin   // надо ли выгружать отдельную очередь или она только в плане
            if och_node=nil then och_node:=node.NodeNew('otdelno');
            Result:=true;
            cur_node:=och_node.NodeNew('och');
            FieldToXML(cur_node,'type', FieldByName('OCHERED_ID'),false);

            if lFullIskl then begin
              ValueToXML(cur_node,'iskl', '1', true, false);
            end else begin
              if lPlan then begin
                lIskl:=dmBase.GetIDLastReshOchered_(nID, nOch, true, nIDLast, nIDPost, nIDSn);
              end else begin
                lIskl:=FieldByName('ISKL').AsBoolean;
              end;
              if lIskl then ValueToXML(cur_node,'iskl', '1', false, false);
            end;
  //          if lFullIskl
  //            then ValueToXML(cur_node,'iskl', lFullIskl, true, false)
  //            else FieldToXML(cur_node,'iskl', FieldByName('ISKL'),false);
            FieldToXML(cur_node,'nomer', FieldByName('NOMER_OCH'),false);
            FieldToXML(cur_node,'dec_date', FieldByName('DEC_DATE'),false);
            FieldToXML(cur_node,'dec_date_real', FieldByName('DEC_DATE_REAL'),false);
            FieldToXML(cur_node,'dec_time', FieldByName('DEC_TIME'),false, true);
            //------ закладка документы ----------------------------------------------------------------
            MemoToXML(cur_node, 'doc', FieldByName('OCHERED_DOK').AsString);
            EventsToXML(cur_node,nID,nOch);
          end;
        end;
        Next;
      end;
    end;
  finally
    RestSostTable(dmBase.tbOchered, st);
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.XMLToOtdelno(node:TXMLNode; nID:Integer; curOch:TCurrentRecord; nBase:Integer; lFullIskl:Boolean):Boolean;
var
  cur_node, otd_node:TXMLNode;
  ds:TDataSet;
  nOch,i,n:Integer;
  d:TDateTime;
  s:String;
begin
  Result:=false;
  otd_node:=node.FindNode('otdelno');
  if otd_node<>nil then begin
    Result:=true;
    ds:=dmBase.tbOchered;
    s:=';0;';
    for i:=0 to otd_node.NodeCount-1 do begin
      cur_node:=otd_node.Nodes[i];
      nOch:=XMLToValue(rProp(cur_node,'type'),ftInteger, 0);  // !!!! контроль
      if Pos(';'+IntToStr(nOch)+';',s)>0 then begin
        AddProtokol('ОШИБКА: '+MenProt+', дублирование ID отдельной очереди '+IntToStr(nOch));
      end else begin
        s:=s+IntToStr(nOch)+';';
        if (nOch>0) and (nOch<=MAX_OCHERED) then begin
          ds.Append;
          ds.FieldByName('ID').AsInteger:=nID;
          ds.FieldByName('OCHERED_ID').AsInteger:=nOch;
          ds.FieldByName('ID_BASE').AsInteger:=nBase;
          ds.FieldByName('ISKL').AsBoolean:=XMLToValue(rProp(cur_node,'iskl'),ftBoolean, false);
          if lFullIskl
            then ds.FieldByName('ISKL').AsBoolean:=lFullIskl;
          n:=XMLToValue(rProp(cur_node,'nomer'),ftInteger, 0);  if n>0 then ds.FieldByName('NOMER_OCH').AsInteger:=n;
          d:=XMLToValue(rProp(cur_node,'dec_date'),ftDate, 0);  if d>0 then ds.FieldByName('DEC_DATE').AsDateTime:=d;
          d:=XMLToValue(rProp(cur_node,'dec_time'),ftTime, 0);  if d>0 then ds.FieldByName('DEC_TIME').AsDateTime:=d;
          d:=XMLToValue(rProp(cur_node,'dec_date_real'),ftDate, 0);  if d>0 then ds.FieldByName('DEC_DATE_REAL').AsDateTime:=d;
          ds.FieldByName('OCHERED_DOK').AsString:=XMLToMemo(cur_node,'doc');

          ds.FieldByName('DELO').AsString:=GetValueFieldEx(curOch,'DELO','');
          ds.FieldByName('N_DELO').AsInteger:=GetValueFieldEx(curOch,'N_DELO',0);
          ds.FieldByName('OTKAZ').AsBoolean:=false;
          ds.FieldByName('KOLVO_PROPIS').AsString:=GetValueFieldEx(curOch,'KOLVO_PROPIS','');
          ds.FieldByName('KOLVO_SOSTAV').AsString:=GetValueFieldEx(curOch,'KOLVO_SOSTAV','');
          ds.FieldByName('KOLVO_KOMN').AsString:=GetValueFieldEx(curOch,'KOLVO_KOMN','');
          ds.FieldByName('KOLVO_KOMN_PR').AsString:=GetValueFieldEx(curOch,'KOLVO_KOMN_PR','');

          ds.FieldByName('PLOSH_ALL').Value:=GetValueFieldEx(curOch,'PLOSH_ALL',null);

          ds.FieldByName('RESIDENCE').AsString:=GetValueFieldEx(curOch,'RESIDENCE','');

          ds.FieldByName('SIROTA').AsBoolean:=GetValueFieldEx(curOch,'SIROTA',false);
          ds.FieldByName('NEWSEM').AsBoolean:=GetValueFieldEx(curOch,'NEWSEM',false);
          ds.FieldByName('UCHASTOK').AsBoolean:=GetValueFieldEx(curOch,'UCHASTOK',false);
          ds.FieldByName('IS_UCHASTOK').AsBoolean:=GetValueFieldEx(curOch,'IS_UCHASTOK',false);
          ds.FieldByName('ONLY').AsBoolean:=GetValueFieldEx(curOch,'ONLY',false);
          ds.FieldByName('GSK').AsString:=GetValueFieldEx(curOch,'GSK','');

          ds.Post;
          XMLToEvents(cur_node,nID,nOch,nBase);
        end else begin
          AddProtokol('ОШИБКА: '+MenProt+', неверный ID отдельной очереди '+IntToStr(nOch));
        end;
      end;
    end;
  end;
end;
//--------------------------------------------------------------
function TOchered2XML.XmlToMen(dm:TdmMen; men_node:TXMLNode): Boolean;
var
  node,node1, cur_node:TXMLNode;
  nBase,nID,n,nIDS,i : Integer;
  fl:Extended;
  s,ss,sIN:String;
  d,d_s:TDateTime;
  dsMen,dsMenA,dsOch,ds:TDataSet;
  curOch:TCurrentRecord;
  l,lFullIskl,lIskl:Boolean;
  adr : TAdres;

  //  sl:TStringList;
 function ReadProp(sName:String):String;  begin Result:=cur_node.ReadAttributeString(sName,''); end;
begin
  Result:=false;
  dsMen:=dmBase.tbMens;
  dsMenA:=dmBase.tbMensAdd;
  dsOch:=dmBase.tbOchered;

  cur_node:=men_node;  // <<--------------!!!
  nBase:=XMLToValue(ReadProp('base'),ftInteger, 0);
  if LoadMyOrg then begin // грузим только своих людей
    if (nBase<>0) and (FMyID<>nBase)    // если не мой человек, то не грузим
      then exit;
    nBase:=0;  // !!!
  end else begin
    if nBase=0 then begin
      nBase:=SourceID;
    end else begin
      if SeekBase(nBase)=-1 then begin
        AddProtokol('неизвестная организания в загружаемой базе '+IntToStr(nBase));
        exit;
      end;
    end;
  end;

  lIskl:=XMLToValue(ReadProp('iskl'),ftBoolean, false);
  if lIskl and not AddIskl then begin   // не грузить исключенных
    exit;
  end;

  nID:=dmBase.GetNewID(_TypeObj_Nasel);

  dsMen.Append;
  dsMen.FieldByName('ID').AsInteger:=nID;
  dsMen.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
  dsMen.FieldByName('ID_BASE').AsInteger:=nBase;
  dsMen.FieldByName('ADRES_ID').AsInteger:=0;
  dsMen.FieldByName('LIC_ID').AsInteger:=0;
  dsMen.FieldByName('OCHERED').AsBoolean:=true;
  dsMenA.Append;
  dsMenA.FieldByName('ID').AsInteger:=nID;
  dsOch.Append;
  dsOch.FieldByName('ID').AsInteger:=nID;
  dsOch.FieldByName('OCHERED_ID').AsInteger:=0;
  dsOch.FieldByName('ID_BASE').AsInteger:=nBase;

//  dm.mtDokument.EmptyTable;
//  dm.mtDokument.Append;

  dsMen.FieldByName('FAMILIA').AsString:=XMLToValue(ReadProp('fam'),ftString, '');
  dsMen.FieldByName('NAME').AsString:=XMLToValue(ReadProp('name'),ftString, '');
  dsMen.FieldByName('OTCH').AsString:=XMLToValue(ReadProp('otch'),ftString, '');

  MenProt:=dsMen.FieldByName('FAMILIA').AsString+' '+dsMen.FieldByName('NAME').AsString+' '+dsMen.FieldByName('OTCH').AsString;  //!

  d:=XMLToValue(ReadProp('dater'),ftDate, 0);   if d>0 then dsMen.FieldByName('DATER').AsDateTime:=d;
  d:=XMLToValue(ReadProp('dates'),ftDate, 0);   if d>0 then dsMen.FieldByName('DATES').AsDateTime:=d;
  sIN:=CheckRus2(XMLToValue(ReadProp('in'),ftString, ''));
  dsMen.FieldByName('LICH_NOMER').AsString:=sIN;
  s:=ANSIUpperCase(XMLToValue(ReadProp('citizen'),ftString, MY_GRAG_STR));
  if not IsAllDigit(s) then begin
    if s='РБ' then s:=MY_GRAG_STR else if s='ИН' then s:=IN_GRAG_STR else if s='ЛБГ' then s:=NOT_GRAG_STR;
  end;
  dsMen.FieldByName('CITIZEN').AsString:=s;
  dsMen.FieldByName('TELEFON').AsString:=XMLToValue(ReadProp('tel'),ftString, '');

  dsOch.FieldByName('DELO').AsString:=XMLToValue(ReadProp('delo'),ftString, '');
  dsOch.FieldByName('N_DELO').AsInteger:=CreateNDelo(dsOch.FieldByName('DELO').AsString);

  d:=XMLToValue(ReadProp('dec_time'),ftTime, 0);  if d>0 then dsOch.FieldByName('DEC_TIME').AsDateTime:=d;
  d:=XMLToValue(ReadProp('dec_date'),ftDate, 0);  if d>0 then dsOch.FieldByName('DEC_DATE').AsDateTime:=d;
  d:=XMLToValue(ReadProp('dec_date_real'),ftDate, 0);  if d>0 then dsOch.FieldByName('DEC_DATE_REAL').AsDateTime:=d;
  d:=XMLToValue(ReadProp('date_check'),ftDate, 0);     if d>0 then dsOch.FieldByName('PER_DATE').AsDateTime:=d;

  dsOch.FieldByName('NOMER_OCH').AsString:=XMLToValue(ReadProp('nomer'),ftString, '');
  dsOch.FieldByName('RESIDENCE').AsInteger:=XMLToValue(ReadProp('room'),ftInteger, 0);  // !!!! контроль значения
  d:=XMLToValue(ReadProp('room_date'),ftDate, 0);  if d>0 then dsOch.FieldByName('RESIDENCE_DATE').AsDateTime:=d;
  l:=XMLToValue(ReadProp('sirota'),ftBoolean, false);    dsOch.FieldByName('SIROTA').AsBoolean:=l;
  l:=XMLToValue(ReadProp('newfamily'),ftBoolean, false); dsOch.FieldByName('NEWSEM').AsBoolean:=l;
  l:=XMLToValue(ReadProp('uch'),ftBoolean, false);       dsOch.FieldByName('IS_UCHASTOK').AsBoolean:=l;
  l:=XMLToValue(ReadProp('only'),ftBoolean, false);      dsOch.FieldByName('ONLY').AsBoolean:=l;
//  l:=XMLToValue(ReadProp('iskl'),ftBoolean, false);      dsOch.FieldByName('ISKL').AsBoolean:=l;
  dsOch.FieldByName('ISKL').AsBoolean:=lIskl;
  lFullIskl:=lIskl;

  //------ закладка документы ----------------------------------------------------------------
  dsOch.FieldByName('OCHERED_DOK').AsString:=XMLToMemo( men_node, 'doc');

  //------ закладка примечание ----------------------------------------------------------------
  node:=men_node.FindNode('add');
  if node<>nil then begin
    cur_node:=node;  // <<--------------!!!
    n:=XMLToValue(ReadProp('kol_kom'),ftInteger, 0);  if n>0 then dsOch.FieldByName('KOLVO_KOMN').AsInteger:=n;
    l:=XMLToValue(ReadProp('uch'),ftBoolean, false);  dsOch.FieldByName('UCHASTOK').AsBoolean:=l;
    dsOch.FieldByName('GSK').AsString:=XMLToValue(ReadProp('gsk'),ftString, '');
    d:=XMLToValue(ReadProp('kredit_date'),ftDate, 0);  if d>0 then dsOch.FieldByName('KREDIT_DATE').AsDateTime:=d;
    fl:=XMLToValue(ReadProp('kredit_summa'),ftFloat, 0);  if fl>0 then dsOch.FieldByName('KREDIT_SUMMA').AsFloat:=fl;
    dsOch.FieldByName('KREDIT_NOMER').AsString:=XMLToValue(ReadProp('kredit_nomer'),ftString, '');
    dsOch.FieldByName('KREDIT_RESH').AsString:=XMLToValue(ReadProp('kredit_resh'),ftString, '');
    d:=XMLToValue(ReadProp('subsid_date'),ftDate, 0);  if d>0 then dsOch.FieldByName('SUBSID_DATE').AsDateTime:=d;
    fl:=XMLToValue(ReadProp('subsid_summa'),ftFloat, 0);  if fl>0 then dsOch.FieldByName('SUBSID_SUMMA').AsFloat:=fl;
    dsOch.FieldByName('SUBSID_RESH').AsString:=XMLToValue(ReadProp('subsid_resh'),ftString, '');
    dsOch.FieldByName('DOP_OCHERED').AsString:=XMLToValue(ReadProp('add_ochered'),ftString, '');
    d:=XMLToValue(ReadProp('add_date'),ftDate, 0);  if d>0 then dsOch.FieldByName('DOP_DATE').AsDateTime:=d;
    dsOch.FieldByName('SLUGEB_POMECH').AsString:=XMLToValue(ReadProp('office'),ftString, '');

    //------- улучшение жил. условий -----------------------------------------------------------
    node1:=node.FindNode('new');
    if node1<>nil then begin
      cur_node:=node1;  // <<--------------!!!
      dsOch.FieldByName('SOCIAL').AsString:=XMLToValue(ReadProp('type'),ftString, '');  // контроль !!!!
      dmBase.WriteValueProp('NEW_ADRES', XMLToValue(ReadProp('adres'),ftString, ''),dmbase.GetDateCurrentSost,nID,_TypeObj_Nasel,ftMemo);
      fl:=XMLToValue(ReadProp('plosh_all'),ftFloat, 0);  if fl>0 then dsOch.FieldByName('NEW_PLOSH_ALL').AsFloat:=fl;
      n:=XMLToValue(ReadProp('kol_kom'),ftInteger, 0);   if n>0  then dsOch.FieldByName('NEW_KOLVO_KOMN').AsInteger:=n;
      dsOch.FieldByName('NEW_DOGOVOR').AsString:=XMLToValue(ReadProp('dogovor'),ftString, '');
      d:=XMLToValue(ReadProp('date'),ftDate, 0);  if d>0 then dsOch.FieldByName('NEW_DATE').AsDateTime:=d;
    end;
  end;

  //------ паспорт ----------------------------------------------------------------
  XMLToPasport(men_node,dsMen);

  //------ объекты собственности ----------------------------------------------------------------
  XMLToObjects(men_node,nID);

  //------ адрес ----------------------------------------------------------------
  node:=men_node.FindNode('adres');
  if node<>nil then begin
    cur_node:=node;   // <<--------------!!!
// <adres obl="Брестская" rn="Брестский" np=" Ковердяки" npt="2" ul="ул. 40 лет Победы" dom="26" kv="13" plosh_all="51.6" kol_kom="2" kol_prop="3"/>
    adr.Obl:=XMLToValue(ReadProp('obl'),ftString, '');
    adr.Raion:=XMLToValue(ReadProp('rn'),ftString, '');
    adr.Ulica:=XMLToValue(ReadProp('ul'),ftString, '');

    s:=XMLToValue(ReadProp('npt'),ftString, '');
    if s<>'' then dmBase.GetTypePunkt(s, '', s);
    adr.Punkt:=Trim(s+' '+Trim(XMLToValue(ReadProp('np'),ftString, '')));
    adr.RnGorName:=XMLToValue(ReadProp('rng'),ftString, '');

    adr.NDom:=XMLToValue(ReadProp('dom'),ftString, '');
    adr.Korp:=XMLToValue(ReadProp('korp'),ftString, '');
    adr.Kv:=XMLToValue(ReadProp('kv'),ftString, '');
    adr.AdresPropis:=dmBase.AdresPropisFromAdres(adr, true);

    if LoadMyOrg then begin
      d_s:=dmBase.GetDateCurrentSost;
      dmBase.WriteValueProp('APROP_OBL', adr.Obl, d_s, nID, dmBase.TypeObj_Nasel, ftMemo);
      dmBase.WriteValueProp('APROP_RN', adr.Raion,  d_s, nID, dmBase.TypeObj_Nasel, ftMemo);
      dmBase.WriteValueProp('APROP_PN', adr.Punkt, d_s, nID, dmBase.TypeObj_Nasel, ftMemo);
      dmBase.WriteValueProp('APROP_UL', adr.Ulica, d_s, nID, dmBase.TypeObj_Nasel, ftMemo);
      dmBase.WriteValueProp('APROP_DOM',adr.NDom,  d_s, nID, dmBase.TypeObj_Nasel, ftString);
      dmBase.WriteValueProp('APROP_KORP', adr.Korp, d_s, nID, dmBase.TypeObj_Nasel, ftString);
      dmBase.WriteValueProp('APROP_KV', adr.Kv, d_s, nID, dmBase.TypeObj_Nasel, ftString);
      dmBase.WriteValueProp('ADRES_PROP', adr.AdresPropis, d_s, nID, dmBase.TypeObj_Nasel, ftMemo);
    end else begin
      dsMenA.FieldByName('TEXT_ADRES').AsString:=XMLToValue(ReadProp('text'),ftString, '');
      dsMenA.FieldByName('MR_ID').AsString:=XMLToValue(ReadProp('kod'),ftString, '');
      dsMenA.FieldByName('MR_ATE').AsString:=XMLToValue(ReadProp('ate'),ftString, '');

      dsMenA.FieldByName('MR_B_RESP').AsBoolean:=true;
      dsMenA.FieldByName('MR_GOSUD').AsString:='';
      dsMenA.FieldByName('MR_B_GOROD').AsString:='';
      s:=XMLToValue(ReadProp('punkt'),ftString, '');
      if s='' then begin
        s:=XMLToValue(ReadProp('npt'),ftString, '');
        if s<>'' then begin
          dsMenA.FieldByName('MR_B_GOROD').AsString:=s;
        end;
        dsMenA.FieldByName('MR_GOROD').AsString:=XMLToValue(ReadProp('np'),ftString, '');
      end else begin
        ss:=CheckNamePunkt(s);
        if ss<>'' then begin
          n:=Pos(';',ss);
          dsMenA.FieldByName('MR_B_GOROD').AsString:=Copy(ss,1,n-1);
          dsMenA.FieldByName('MR_GOROD').AsString:=Copy(ss,n+1,Length(ss));;
        end else begin
          dsMenA.FieldByName('MR_GOROD').AsString:=s;
        end;
      end;
      dsMenA.FieldByName('MR_OBL').AsString:=XMLToValue(ReadProp('obl'),ftString, '');
      dsMenA.FieldByName('MR_B_OBL').AsBoolean:=true;
      dsMenA.FieldByName('MR_RAION').AsString:=XMLToValue(ReadProp('rn'),ftString, '');
      dsMenA.FieldByName('MR_GOROD_RN').AsString:=XMLToValue(ReadProp('rng'),ftString, '');
  // пока не выгружвется  dsMenA.FieldByName('MR_TYPE_ULICA').AsString:=XMLToValue(ReadProp('tul'),ftString, '');
      dsMenA.FieldByName('MR_ULICA').AsString:=XMLToValue(ReadProp('ul'),ftString, '');
      dsMenA.FieldByName('MR_DOM').AsString:=XMLToValue(ReadProp('dom'),ftString, '');
      dsMenA.FieldByName('MR_KORP').AsString:=XMLToValue(ReadProp('korp'),ftString, '');
      dsMenA.FieldByName('MR_KV').AsString:=XMLToValue(ReadProp('kv'),ftString, '');
    end;

    fl:=XMLToValue(ReadProp('plosh_all'),ftFloat, 0);    if fl>0 then dsOch.FieldByName('PLOSH_ALL').AsFloat:=fl;
    n:=XMLToValue(ReadProp('kol_kom'),ftInteger, 0);     if n>0  then dsOch.FieldByName('KOLVO_KOMN_PR').AsFloat:=n;
    n:=XMLToValue(ReadProp('kol_prop'),ftInteger, 0);    if n>0  then dsOch.FieldByName('KOLVO_PROPIS').AsFloat:=n;
    n:=XMLToValue(ReadProp('kol_sostav'),ftInteger, 0);  if n>0  then dsOch.FieldByName('KOLVO_SOSTAV').AsFloat:=n;
  end;

  dsMen.Post;
  dsMenA.Post;
  node:=men_node.FindNode('sostav');
  if node=nil then dsOch.FieldByName('KOLVO_SOSTAV').AsInteger:=1
              else dsOch.FieldByName('KOLVO_SOSTAV').AsInteger:=node.NodeCount+1;
  dsOch.Post;
  // создадим для отдельных очередей
  GetCurrentRecord(dsOch,'',curOch);

  //------ сотав семьи ----------------------------------------------------------------
  //node:=men_node.FindNode('sostav');  ^^ см. выше  ^^
  if node<>nil then begin
    ds:=dmBase.tbSostavSem;
    for i:=0 to node.NodeCount-1 do begin
      if node.Nodes[i].Name='men' then begin
        cur_node:=node.Nodes[i];   // <<--------------!!!
        nIDS:=dmBase.GetNewID(_TypeObj_Nasel);
        // добавим человека в базу населения
        dsMen.Append;
        dsMen.FieldByName('ID').AsInteger:=nIDS;
        dsMen.FieldByName('ID_BASE').AsInteger:=nBase;
        dsMen.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
        s:=XMLToValue(ReadProp('otn'),ftString, '');
        if s<>'' then dsMen.FieldByName('OTNOSH').AsInteger:=dmBase.CheckSprOtnosh(s);
        dsMen.FieldByName('FAMILIA').AsString:=XMLToValue(ReadProp('fam'),ftString, '');
        dsMen.FieldByName('NAME').AsString:=XMLToValue(ReadProp('name'),ftString, '');
        dsMen.FieldByName('OTCH').AsString:=XMLToValue(ReadProp('otch'),ftString, '');
        d:=XMLToValue(ReadProp('dater'),ftDate, 0);  if d>0 then dsMen.FieldByName('DATER').AsDateTime:=d;
        sIN:=CheckRus2(XMLToValue(ReadProp('in'),ftString, ''));
        dsMen.FieldByName('LICH_NOMER').AsString:=sIN;
        dsMen.FieldByName('POL').AsString:=XMLToValue(ReadProp('pol'),ftString, '');
        XMLToPasport(cur_node,dsMen);
        XMLToObjects(cur_node,nIDS);
        dsMen.Post;
        // добавим человека в состав семьи
        ds.Append;
        ds.FieldByName('ID').AsInteger:=nID;
        ds.FieldByName('MEMBER_ID').AsInteger:=nIDS;
        ds.FieldByName('NOMER').AsInteger:=i+1;
        ds.FieldByName('OTNOSH').AsString:=dsMen.FieldByName('OTNOSH').AsString;
        ds.FieldByName('FAMILIA').AsString:=dsMen.FieldByName('FAMILIA').AsString;
        ds.FieldByName('NAME').AsString:=dsMen.FieldByName('NAME').AsString;
        ds.FieldByName('OTCH').AsString:=dsMen.FieldByName('OTCH').AsString;
        ds.FieldByName('LICH_NOMER').AsString:=sIN;
        ds.FieldByName('POL').AsString:=dsMen.FieldByName('POL').AsString;
        if not dsMen.FieldByName('DATER').IsNull then  ds.FieldByName('DATER').AsDateTime:=dsMen.FieldByName('DATER').AsDateTime;
        ds.Post;
      end;
    end;
  end;
  {
0=общая
1=многодетная семья
2=социальное жилье
3=военнослужащие
  OCH_RESH_POST=1;
  OCH_RESH_VOST=2;
  OCH_RESH_RAZD=3;
  OCH_RESH_PERE=4;
  OCH_RESH_UNION=5;
  OCH_RESH_SN=9;
}
  //------ решения ----------------------------------------------------------------
  if dsOch.FieldByName('ID').AsInteger<>nID then begin
    dsOch.Locate('ID', nID, []);
  end;
  XMLToEvents(men_node,nID,0,nBase);
  //------ отдельные очереди ----------------------------------------------------------------
  XMLToOtdelno(men_node, nID, curOch, nBase, lFullIskl);
  Result:=true;

end;
//--------------------------------------------------------------
procedure TOchered2XML.AddProtokol(s:String; lAddToLast:Boolean);
var
  n:Integer;
begin
  n:=0;
  if lAddToLast then begin
    n:=FProtokol.Count;
  end;
  if n=0
    then FProtokol.Add(s)
    else FProtokol.Strings[n-1]:=FProtokol.Strings[n-1]+s;
end;

//--------------------------------------------------------------
function TOchered2XML.QueryLoad(lQuery:Boolean): Boolean;
var
  i,n:Integer;
  s,ss:String;
begin
  Result:=true;
  n:=MyID;
  for i:=0 to Length(arrBases)-1 do begin
    if (n=arrBases[i]) and not LoadMyOrg then begin
      AddProtokol('файл содержит информацию собственной организации, загрузка невозможна');
      Result:=false;
    end;
  end;
  if Result and lQuery then begin
    Result:=false;
    if Length(arrBases)=1 then begin
      s:='Файл: '+fmMain.SprNameOrg(SourceID,'К','')+'. Загрузить ?';
      if Problem(s) then Result:=true;
    end else begin
      s:='Файл: '+fmMain.SprNameOrg(SourceID,'К','')+#13#10+'с информацией из'+#13#10;
      for i:=0 to Length(arrBases)-1 do begin
        ss:=fmMain.SprNameOrg(arrBases[i],'К','');
        if ss='' then ss:='База '+IntToStr(arrBases[i]);
        s:=s+IntToStr(i+1)+'. '+ss+#13#10;
      end;
      if OkWarning(s,nil,true,false) then begin
        Result:=true;
      end;
    end;
  end;
end;

//--------------------------------------------------------------
function TOchered2XML.RunImport(lQuery:Boolean; lQueryDelete:Boolean; lLoadIskl:Boolean; lDateAndCount:Boolean): Integer;
var
  node_info,men_node,node,node_data:TXMLNode;
  nCheck,nCount,nCountL,i,n,m:Integer;
  sTel,snameLoad,s,sNameOrg,sKratNameOrg,sShtampOrg:String;
  dDate,dDateL:TDateTime;
  lOk:Boolean;
//  sl:TStringList;
begin
  Result:=0;
  FLastError:='';
//  FProtokol.Clear;
  XMLDokument.Clear;
  XMLDokument.Root.Name:=FNameRoot;
  CountMen:=0;
  AddIskl:=lLoadIskl;
  OpenMessage('Подготовка загрузки ... ','', 10);
  try
    AddProtokol('открытие файла '+FNameExportFile);
    XMLDokument.LoadFromFile(FNameExportFile);
  except
    on E: Exception do begin
      CloseMessage;
      FLastError:=E.Message;
      AddProtokol('ошибка открытияя: '+FLastError);
      exit;
    end;
  end;
  CloseMessage;

  node_info:=XMLDokument.Root.FindNode('info');
  if node_info=nil then begin
    AddProtokol('не найден информационный  ТЕГ <info>');
    exit;      // ОШИБКА
  end;

  SetLength(arrBases,0);

  lOk:=true;
  s:=node_info.readString('ansi','');
  if s='1'  then FToUtf8:=false  else FToUtf8:=true;  // нужно будет переводить из Utf8 в ANSI
  n:=node_info.ReadInteger('source',0);
  SourceID:=0;

  if n>=0 then begin
    SourceID:=n;
    sNameOrg:=XMLToValue(node_info.ReadString('name',''),ftString,'');
    sKratNameOrg:=XMLToValue(node_info.ReadString('kname',''),ftString,'');
    sTel:=XMLToValue(node_info.ReadString('telefon',''),ftString,'');
    if sKratNameOrg='' then sKratNameOrg:=sNameOrg;
    if (sNameOrg='') and (sKratNameOrg='') then begin
      AddProtokol('неизвестно название организации поставщика информации');
      lOk:=false;
    end;
    snameLoad:=sKratNameOrg;
    sShtampOrg:=XMLToMemo( node_info, 'shtamp');
    nCount:=XMLToValue(node_info.ReadString('count','0'),ftInteger,0);
    Version:=XMLToValue(node_info.ReadString('version','1'),ftString,'1');
    dDate:=XMLToValue(node_info.ReadString('date',''),ftDate,0);
    if lOk then begin
      if lDateAndCount then begin // игнорировать файлы при совпадении даты и количества
        if GetLastDateAndCount(SourceID, dDateL, nCountL) then begin
          if (dDate<dDateL) then begin  // дата загружаемых данных меньше даты последней загрузки
            lOk:=false;  // тогда не грузим
            AddProtokol('файл пропущен: дата загружаемых данных ('+DatePropis(dDate,3)+') меньше даты последней загрузки ('+DatePropis(dDateL,3)+')');
          end else if (dDate=dDateL) and (nCount=nCountL) then begin
            lOk:=false;  // тогда не грузим
            AddProtokol(Format('файл пропущен: совпадение даты (%s) и количества (%s)', [DatePropis(dDate,3),IntToStr(nCount)]));
          end;
        end;
      end;
      if lOk then begin
        lOk:=CheckSprOrg(SourceID,sNameOrg,sKratNameOrg,sShtampOrg,dDate,nCount,sTel);
        AddBase(SourceID);
      end;
    end;
//    showmessage(snameOrg+#13#10+sKratNameOrg+#13#10+sShtampOrg+#13#10+DatePropis(dDate,3));
  end else begin
    AddProtokol('неизвестный поставщик информации');
    PutError('Неизвестный поставщик информации');
    lOk:=false;
  end;
//  opResid:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_RESIDENCE');
//  opReshType:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPE_RESH');
//  opOchType:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEOCHERED');
//  opOchSposob:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_OCHERED_SPOSOB');

  if lOk then begin
    node_data:=XMLDokument.Root.FindNode('bases');
    if (node_data<>nil) and not LoadMyOrg then begin
      m:=node_data.NodeCount;
      for i:=0 to m-1 do begin
        node:=node_data.Nodes[i];
        n:=node.ReadInteger('source',0);
        if n>0 then begin
          AddBase(n);
          sNameOrg:=XMLToValue(node.ReadString('name',''),ftString,'');
          sKratNameOrg:=XMLToValue(node.ReadString('kname',''),ftString,'');
          sTel:=XMLToValue(node.ReadString('telefon',''),ftString,'');
          try
            dDate:=XMLToValue(node.ReadString('date',''),ftDate,0);
          except
            dDate:=0;
          end;
          if sKratNameOrg='' then sKratNameOrg:=sNameOrg;
          if (sNameOrg='') and (sKratNameOrg='') then begin
            AddProtokol('неизвестно название организации поставщика информации');
            lOk:=false;
          end;
          sShtampOrg:=XMLToMemo( node_info, 'shtamp');
          if lOk then begin
            lOk:=CheckSprOrg(n,sNameOrg,sKratNameOrg,sShtampOrg,dDate,0,sTel);
          end;
          if not lOk
            then break;
        end else begin

        end;
      end;
    end;
  end;

  if lOk then begin
    node_data:=XMLDokument.Root.FindNode('rows');
    if node_data=nil then begin
      AddProtokol('данные для загрузки не найдены (rows)');
    end else begin
      AddProtokol('загрузка данных: '+sNameLoad);
//      curMen:=TdmMen.Create(nil);
//      curMen.EnableRunScript:=false;   // недоступен автоматический вызов скриптов
      if QueryLoad(lQuery) then begin
        if DeleteInfo(lQueryDelete) then begin
          AddProtokol('начало загрузки:    '+FormatDateTime('dd.mm.yyyy hh:mm:ss', Now));
          curMen:=nil;
          n:=0;
          m:=node_data.NodeCount;
          if m>1000 then nCheck:=100 else nCheck:=10;
          CreateProgress('Загрузка', sNameLoad, m);
          ChangeProgress(1, sNameLoad);
          try
            for i:=0 to m-1 do begin
              men_node:=node_data.Nodes[i];
              if XmlToMen(curMen,men_node)
                then  Inc(CountMen,1);
              Inc(n,1);
              if n=nCheck then begin
                n:=0;
                ChangeProgress(CountMen, sNameLoad);
              end;
            end;
          finally
            CloseProgress;
          end;
          AddProtokol('окончание загрузки: '+FormatDateTime('dd.mm.yyyy hh:mm:ss', Now));
          AddProtokol('загружено: '+IntToStr(CountMen));
          Result:=CountMen;
        end;
      end else begin
        AddProtokol('отказ от загрузки: '+sNameLoad);
        Result:=0;
      end;
//      curMen.Free;
    end;
  end;
end;
//--------------------------------------------------------------
procedure TOchered2XML.SetFileName(const Value: String);
begin
  FFileName := Value;
end;
procedure TOchered2XML.SetLastError(const Value: String);
begin
  FLastError := Value;
end;
procedure TOchered2XML.SetNameRoot(const Value: String);
begin
  FNameRoot:=Value;
end;
procedure TOchered2XML.SetProtokol(const Value: TStringList);
begin
  FProtokol := Value;
end;
procedure TOchered2XML.SetSQL(const Value: String);
begin
  FSQL := Value;
end;
procedure TOchered2XML.SetVersion(const Value: String);
begin
  FVersion := Value;
end;
procedure TOchered2XML.SetWinOwner(const Value: TWinControl);
begin
  FWinOwner := Value;
end;

procedure TOchered2XML.SetNameExportFile(const Value: String);
begin
  FNameExportFile := Value;
end;

procedure TOchered2XML.SetAddIskl(const Value: Boolean);
begin
  FAddIskl := Value;
end;

end.
