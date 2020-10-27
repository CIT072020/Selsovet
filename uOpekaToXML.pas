unit uOpekaToXML;

interface

{$I Task.inc}

uses Classes,Forms, Controls,FuncPr, SysUtils, Variants, Contnrs, db, NativeXML, dbFunc, adsdata, fmProgress, Dialogs,
     fWarning, uTypes, ifpii_dbfunc, dBase, uProject, OpisEdit, uCheckKod, uProjectAll, MetaTask;

type

   TLoadOneOpeka = procedure(nAll:Integer; nLoad:Integer; nNew:Integer; nCur:Integer) of object;

   TOpeka2XML=class(TObject)
   private
    FNameRoot: String;
    FSQL: String;
    FFileName: String;
    FVersion: String;
    FProtokol: TStrings;
    FWinOwner: TWinControl;
    FNameExportFile: String;
    FAddIskl: Boolean;

    FCurPunktID:Integer;
    FCurPunktKOD:Integer;
    FCurPunktATE:Integer;

    procedure SetNameRoot(const Value: String);
    procedure SetSQL(const Value: String);
    procedure SetFileName(const Value: String);
    procedure SetVersion(const Value: String);
    procedure SetLastError(const Value: String);
    procedure SetProtokol(const Value: TStrings);
    procedure SetWinOwner(const Value: TWinControl);
    procedure SetNameExportFile(const Value: String);
    procedure SetAddIskl(const Value: Boolean);
   public
     OnLoadOneOpeka:TLoadOneOpeka;
     VigrMy:Boolean;
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
     property Protokol:TStrings read FProtokol write SetProtokol;
     property Version:String read FVersion write SetVersion;
     property NameRoot:String read FNameRoot write SetNameRoot;
     property SQL:String read FSQL write SetSQL;
     property FileName:String read FFileName write SetFileName;
     function RunExport:Boolean;
     function QueryLoad(lQuery:Boolean; sName:String): Boolean;
     function RunImport(lQuery:Boolean; lQueryDelete:Boolean; lOnlyNew, lSeekID, lSeekIN, lLoadAdres:Boolean): Integer;

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
     function XmlToMen(men_node:TXMLNode; lOnlyNew:Boolean; lSeekID:Boolean; lSeekIN:Boolean; lLoadAdres:Boolean; var lAppend:Boolean): Boolean;
     function WriteInfo:TXMLNode;
     function DeleteInfo(lQueryDelete:Boolean):Boolean;

     procedure DecodeObl(sObl:String; fldObl, fldType:TField);
     procedure DecodeRaion(sRn:String; fldRn:TField);

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

   function RunOpeka2XML:Boolean;
   function RunXML2Opeka:Boolean;

   implementation

uses fMain, StrUtils;

//--------------------------------------------------------------
function RunOpeka2XML:Boolean;
var
  ex:TOpeka2XML;
begin
  Result:=false;
  ex:=TOpeka2XML.Create;
  ex.AsAttribute:=true;
  ex.IsExportPunktID:=true;
  ex.VigrPrim:=true;
  ex.AddIskl:=true;
  ex.RunExport;
  ex.Free;
end;

//--------------------------------------------------------------
function RunXML2Opeka:Boolean;
var
  ex:TOpeka2XML;
begin
  Result:=false;
  ex:=TOpeka2XML.Create;
  ex.NameExportFile:='d:\test.xml';
  ex.AsAttribute:=true;
  ex.RunImport(true,true,true,true,true,true);
  ShowStrings(ex.FProtokol,'Протокол');
  ex.Free;
end;

{ TOpeka2XML }

//--------------------------------------------------------------
constructor TOpeka2XML.Create;
begin
  OnLoadOneOpeka:=nil;
  CountMen:=0;
  FVersion:='2';
  FWinOwner:=nil;
  FNameRoot:='export_data';
  FWriteNull:=false;
  VigrMy:=true;
  FToUtf8:=true;
  FormatDate:='yyyy-mm-dd';
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
//  FProtokol:=TStringList.Create;
//  dsOrg:=dbCreateMemTable('ID,Integer,0;NAME,Char,300;KNAME,Char,200','');
//  dsOrg.Open;
end;
//--------------------------------------------------------------
destructor TOpeka2XML.Destroy;
begin
  XMLDokument.Free;
//  FProtokol.Free;
//  dbClose(dsOrg);
  inherited;
end;
//--------------------------------------------------------------
function TOpeka2XML.DateToStr(d:TDateTime): Utf8String;
begin
  if d>0
    then Result:=CheckStrW(FormatDateTime(FormatDate,d))
    else Result:='';
end;
//--------------------------------------------------------------
function TOpeka2XML.StrToDate(sDate:String): TDateTime;
begin
  Result:=0;
  if (sDate<>'') and (Length(sDate)=10) then begin
    try
      Result:=STOD(sDate,tdAds);
    except
      Result:=0;
    end;
  end;
end;
//--------------------------------------------------------------
function TOpeka2XML.TimeToStr(t:TDateTime): Utf8String;
begin
  Result:=CheckStrW(FormatDateTime(FormatTime,t));
end;
//--------------------------------------------------------------
function TOpeka2XML.WriteInfo:TXMLNode;
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
function TOpeka2XML.DeleteInfo(lQueryDelete:Boolean):Boolean;
begin
  Result:=true;
end;

//--------------------------------------------------------------
function TOpeka2XML.WriteSprOrg:Boolean;
var
  nID:Integer;
  bases,base:TXMLNode;
begin
  Result:=true;
  dmBase.WorkQuery.Active:=false;
  dmBase.WorkQuery.SQL.Text:='select distinct id_base from ochered';
  dmBase.WorkQuery.Active:=true;
  bases:=XmlDokument.Root.NodeNew('bases');
  while not dmBase.WorkQuery.Eof do begin
    nID:=dmBase.WorkQuery.FieldByName('ID_BASE').AsInteger;
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
    dmBase.WorkQuery.Next;
  end;
  dmBase.WorkQuery.Active:=false;
end;

//--------------------------------------------------------------
function TOpeka2XML.CheckStrW(s:String):String;
begin
  if FToUtf8
    then Result:=AnsiToUtf8(s)
    else Result:=s;
end;
//--------------------------------------------------------------
function TOpeka2XML.CheckStrR(s:String):String;
begin
  if FToUtf8
    then Result:=Utf8ToAnsi(s)
    else Result:=s;
end;
//--------------------------------------------------------------
function TOpeka2XML.XMLToValue(sValue:String; ft:TFieldType; vDefault:Variant): Variant;
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
function TOpeka2XML.ValueToXML(node:TXMLNode; sName:String; v:Variant; lWriteEmpty:Boolean; lDateAsTime:Boolean): Boolean;
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
function TOpeka2XML.MemoToXML(node:TXMLNode; sName:String; s:String):Boolean;
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
function TOpeka2XML.XMLToMemo(node:TXMLNode; sName:String):String;
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
function TOpeka2XML.FieldToXML(node:TXMLNode; sName:String; fld: TField; lWriteEmpty:Boolean; lDateAsTime:Boolean): Boolean;
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
function TOpeka2XML.rProp(node:TXMLNode; sName:String): String;
begin
  Result:=node.ReadAttributeString(sName,'');
end;
//--------------------------------------------------------------
procedure TOpeka2XML.AddBase(nID:Integer);
begin
  SetLength(arrBases, Length(arrBases)+1);
  arrBases[Length(arrBases)-1]:=nID;
end;
//--------------------------------------------------------------
function TOpeka2XML.SeekBase(nID:Integer):Integer;
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
function TOpeka2XML.PasportToXml(p:TPassport; node:TXMLNode): Boolean;
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
//procedure TOpeka2XML.CheckRekv('PASP_UDOST', sValue);
//begin
//end;
//------------------------------------------------------------------------------------
function TOpeka2XML.XMLToPasport(men_node:TXMLNode; dsMen:TDataSet): Boolean;
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
function TOpeka2XML.ObjectsToXml(nID:Integer; men_node:TXMLNode): Boolean;
begin
end;
//--------------------------------------------------------------
function TOpeka2XML.XMLToObjects(men_node:TXMLNode; nID:Integer): Boolean;
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
        end;
      end;
    end;
  end;
end;
//-----------------------------------------------------------------------------------
function TOpeka2XML.EventsToXML(node:TXMLNode; nID:Integer; nOch:Integer):Boolean;
begin
end;

//--------------------------------------------------------------
function TOpeka2XML.CheckVigrMen(dsOch:TDataSet; nID:Integer; nOch:Integer; var lPlan:Boolean):Boolean;
begin
  Result:=true;
end;
//--------------------------------------------------------------
function TOpeka2XML.MenToXml(ds:TDataSet; node:TXMLNode): Boolean;
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
    FieldToXML(men_node, 'in', dsMen.FieldByName('IDENTIF'));

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

end;
//--------------------------------------------------------------
function TOpeka2XML.RunExport: Boolean;
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
      dmBase.WorkQuery.Active:=false;
      dmBase.WorkQuery.SQL.Text:='select * from ochered where ochered_id=0';
      if not FAddIskl then dmBase.WorkQuery.SQL.Text:=dmBase.WorkQuery.SQL.Text+' and iskl=false';
      {$IFDEF OCHERED}
        dmBase.WorkQuery.SQL.Text:=dmBase.WorkQuery.SQL.Text+' order by id_base, nomer_och';
      {$ELSE}
        dmBase.WorkQuery.SQL.Text:=dmBase.WorkQuery.SQL.Text+' order by nomer_och';
      {$ENDIF}
      try
        OpenMessage('Подготовка выгрузки','',10);
  //      dmBase.tbOchered.IndexName:='NOMER_KEY';
  //      dmBase.tbOchered.Filter:='ochered_id=0';
  //      if not FAddIskl then dmBase.tbOchered.Filter:=dmBase.tbOchered.Filter+' and iskl=false';
        dmBase.WorkQuery.Open;
  //      dmBase.tbOchered.Filtered:=true;
  //      dmBase.tbOchered.AdsTableOptions.AdsFilterOptions:=RESPECT_WHEN_COUNTING;
  //      m:=dmBase.tbOchered.RecordCount;
  //      dmBase.tbOchered.AdsTableOptions.AdsFilterOptions:=IGNORE_WHEN_COUNTING;
  //      m:=dmBase.tbOchered.RecordCount;
        m:=dmBase.WorkQuery.RecordCount;
        dsOch:=dmBase.WorkQuery;
        CloseMessage;
        if m>1000 then nCheck:=100 else nCheck:=10;
        CreateProgress('Опека', 'Загрузка информации', m);
        ChangeProgress(1, 'Загрузка информации');
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
      dmBase.WorkQuery.Active:=false;
      dmBase.WorkQuery.SQL.Text:=FSQL;
      dmBase.WorkQuery.Open;
      while dmBase.WorkQuery.Eof do begin

        dmBase.WorkQuery.Next;
      end;
      dmBase.WorkQuery.Close;
      }
    end;
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
  end;
end;
//--------------------------------------------------------------
function TOpeka2XML.GetLastDateAndCount(nSource:Integer; var dDate:TDateTime; var nCount :Integer):Boolean;
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
function TOpeka2XML.CheckSprOrg(nSource:Integer;sNameOrg:String;sKratNameOrg:String;sShampOrg:String; dDate:TDateTime; nCount:Integer; sTel:String):Boolean;
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
function TOpeka2XML.CheckPunktOsn(sPunkt:String):String;
begin
  CharDel(sPunkt,'п');
  sPunkt:=Trim(sPunkt);
  if Copy(sPunkt,1,1)='.'
    then sPunkt:=Copy(sPunkt,2,Length(sPunkt));
  if RightStr(sPunkt,1)<>'.' then sPunkt:=sPunkt+'.';
end;
//--------------------------------------------------------------
function TOpeka2XML.CheckOsn(node:TXMLNode; nType:Integer; ds:TDataSet):Boolean;
begin
end;
//--------------------------------------------------------------
function TOpeka2XML.XMLToEvents(node:TXMLNode; nID:Integer; nOch:Integer; nBase:Integer):Boolean;
begin
  Result:=false;
end;
//--------------------------------------------------------------
function TOpeka2XML.OtdelnoToXML(node:TXMLNode; nID:Integer; lFullIskl:Boolean):Boolean;
begin
end;
//--------------------------------------------------------------
function TOpeka2XML.XMLToOtdelno(node:TXMLNode; nID:Integer; curOch:TCurrentRecord; nBase:Integer; lFullIskl:Boolean):Boolean;
begin
end;
//------------------------------------------------------------------------------
procedure TOpeka2XML.DecodeObl(sObl:String; fldObl, fldType:TField);
begin
  fldType.AsString:='';   // null
  fldObl.AsString:='';
  if Trim(sObl)<>'' then begin
    if Pos('КРАЙ', ANSIUpperCase(sObl))>0 then begin
      fldType.AsBoolean:=false;
      sObl:=StringReplace(sObl,'КРАЙ','',[rfIgnoreCase]);
    end else begin
      if Pos('ОБЛАСТЬ', ANSIUpperCase(sObl))=0 then begin
        if Pos(' ', ANSIUpperCase(sObl))=0 then begin
          fldType.AsBoolean:=true;
        end;
      end else begin
        fldType.AsBoolean:=true;
        sObl:=StringReplace(sObl,'ОБЛАСТЬ','',[rfIgnoreCase]);
      end;
    end;
    fldObl.AsString:=sObl;
  end else begin
    fldType.AsBoolean:=true;
  end;
end;

//------------------------------------------------------------------------------
procedure TOpeka2XML.DecodeRaion(sRn:String; fldRn:TField);
begin
  if Pos('РАЙОН', ANSIUpperCase(sRn))>0 then begin
    sRn:=StringReplace(sRn,'РАЙОН','',[rfIgnoreCase]);
  end;
  fldRn.AsString:=sRn;
end;

//--------------------------------------------------------------
function TOpeka2XML.XmlToMen(men_node:TXMLNode; lOnlyNew:Boolean; lSeekID:Boolean; lSeekIN:Boolean; lLoadAdres:Boolean; var lAppend:Boolean): Boolean;
var
  node,node1, cur_node:TXMLNode;
  nVozr,nID,n,nIDS,i : Integer;
  sObjectID,s,ss,sIN:String;
  d:TDateTime;
  dsMen,ds:TDataSet;
  l,lOk,lSeek:Boolean;
//  sl:TStringList;
 function ReadProp(sName:String):String;  begin Result:=cur_node.ReadAttributeString(sName,''); end;
begin
  Result:=false;
  dsMen:=dmBase.tbZapisOpeka;

  cur_node:=men_node;  // <<--------------!!!
  sIN:=Trim(CheckRus2(XMLToValue(ReadProp('child_id_number'),ftString, '')));
  sObjectID:=Trim(XMLToValue(ReadProp('OBJECT_ID'), ftString, ''));
//  if lOnlyNew then lSeekID:=true;
  lAppend:=false;
  lOk:=true;
  lSeek:=false;
  if lSeekID and (sObjectID<>'') then begin
    if dsMen.Locate('EXTERNAL_ID', sObjectID, []) then begin
      lSeek:=true;
      if lOnlyNew
        then lOk:=false;
    end;
  end;
  if lOk and lSeekIN and not lSeek and (sIN<>'') then begin
    if dsMen.Locate('IDENTIF', sIN, []) then begin
      lSeek:=true;
      if lOnlyNew
        then lOk:=false;
    end;
  end;
  if lOk then begin
    if lSeek then begin
      dsMen.Edit;
    end else begin
      dsMen.Append;
      lAppend:=true;
    end;
    //  dsMen.FieldByName('ID').AsInteger:=nID;
    dsMen.FieldByName('EXTERNAL_ID').AsString:=sObjectID;
    dsMen.FieldByName('FAMILIA').AsString:=XMLToValue(ReadProp('child_firstname'),ftString, '');
    dsMen.FieldByName('NAME').AsString:=XMLToValue(ReadProp('child_name'),ftString, '');
    dsMen.FieldByName('OTCH').AsString:=XMLToValue(ReadProp('child_lastname'),ftString, '');
    if sIN<>'' then dsMen.FieldByName('IDENTIF').AsString:=sIN;

    d:=XMLToValue(ReadProp('child_birthday'),ftDate, 0);  if d>0 then dsMen.FieldByName('DATER').AsDateTime:=d;
    if XMLToValue(ReadProp('child_sex'),ftString, '')='Ж'
      then dsMen.FieldByName('POL').AsString:='Ж'
      else dsMen.FieldByName('POL').AsString:='М';

    if lLoadAdres then begin
      s:=XMLToValue(ReadProp('child_citizenship'),ftString, '');
      if s<>'' then if dmBase.SprStran.Locate('ALFA3', s, []) then dsMen.FieldByName('GRAG').AsString:=dmBase.SprStran.FieldByName('ID').AsString;
      // место рождения
      s:=XMLToValue(ReadProp('child_country_of_birth'),ftString, '');
      if s<>'' then if dmBase.SprStran.Locate('ALFA3', s, []) then dsMen.FieldByName('RG_GOSUD').AsString:=dmBase.SprStran.FieldByName('ID').AsString;
      DecodeObl(XMLToValue(ReadProp('child_region_of_birth'),ftString, ''), dsMen.FieldByName('RG_OBL'), dsMen.FieldByName('RG_B_OBL') );
      DecodeRaion(XMLToValue(ReadProp('child_district_of_birth'),ftString, ''), dsMen.FieldByName('RG_RAION') );
      dsMen.FieldByName('RG_GOROD').AsString:=XMLToValue(ReadProp('child_locality'),ftString, '');
      // место жительства
//      dsMen.FieldByName('GT_GOSUD').AsInteger:=MY_GRAG;
      DecodeObl(XMLToValue(ReadProp('child_residence_region'),ftString, ''), dsMen.FieldByName('GT_OBL'), dsMen.FieldByName('GT_B_OBL') );
      DecodeRaion(XMLToValue(ReadProp('child_residence_district'),ftString, ''), dsMen.FieldByName('GT_RAION') );
      s:=XMLToValue(ReadProp('child_residence_locality'),ftString, ''); if s<>'' then dsMen.FieldByName('GT_GOROD').AsString:=s;
    end;

    s:=XMLToValue(ReadProp('child_plase_of_study'),ftString, '');  if s<>'' then dsMen.FieldByName('PLACE_WORK').AsString:=s;
    s:=XMLToValue(ReadProp('child_place_of_work'),ftString, '');   if s<>'' then dsMen.FieldByName('PLACE_WORK').AsString:=s;
    s:=XMLToValue(ReadProp('child_orphanstatus'),ftString, '');    if s<>'' then dsMen.FieldByName('TIP').AsString:=s;

    d:=XMLToValue(ReadProp('trustees_set_date'),ftDate, 0);        if d>0 then dsMen.FieldByName('DATEZ').AsDateTime:=d;
    s:=XMLToValue(ReadProp('trustees_set_order'),ftString, '');    if s<>'' then dsMen.FieldByName('NOMER_UST').AsString:=s;
    d:=XMLToValue(ReadProp('trustees_end_date'),ftDate, 0);        if d>0 then dsMen.FieldByName('DATE_OTM').AsDateTime:=d;
    s:=XMLToValue(ReadProp('trustees_end_order'),ftString, '');    if s<>'' then dsMen.FieldByName('NOMER_OTM').AsString:=s;

    if not dsMen.FieldByName('DATEZ').IsNull and not dsMen.FieldByName('DATER').IsNUll then begin
      nVozr:=GetCountYear(dsMen.FieldByName('DATEZ').AsDateTime ,dsMen.FieldByName('DATER').AsDateTime);
      if nVozr<14 then begin
        dsMen.FieldByName('VID').AsInteger:=VID_OPEKA_DO14;
      end else begin
        dsMen.FieldByName('VID').AsInteger:=VID_POPECH_DO18;
      end;
    end;
    // guardian_date="2003-08-12" guardian_organ="Орган опеки, Барановичский район"
    s:=XMLToValue(ReadProp('guardian_form'),ftString, '');         if s<>'' then dsMen.FieldByName('FORMA').AsString:=s;

//    d:=XMLToValue(ReadProp('guardian_date'),ftDate, 0);  if d>0 then dsMen.FieldByName('DATER').AsDateTime:=d;

    // попечитель
    dsMen.FieldByName('ON_FAMILIA').AsString:=XMLToValue(ReadProp('trustee1_firstname'),ftString, '');
    dsMen.FieldByName('ON_NAME').AsString:=XMLToValue(ReadProp('trustee1_name'),ftString, '');
    dsMen.FieldByName('ON_OTCH').AsString:=XMLToValue(ReadProp('trustee1_lastname'),ftString, '');
    dsMen.FieldByName('ON_IDENTIF').AsString:=XMLToValue(ReadProp('trustee1_id_number'),ftString, '');
    d:=XMLToValue(ReadProp('trustee1_birthday'),ftDate, 0);  if d>0 then dsMen.FieldByName('ON_DATER').AsDateTime:=d;
    s:=XMLToValue(ReadProp('trustee1_citizenship'),ftString, '');
    if s<>'' then if dmBase.SprStran.Locate('ALFA3', s, []) then dsMen.FieldByName('ON_GRAG').AsString:=dmBase.SprStran.FieldByName('ID').AsString;
    dsMen.FieldByName('OTNOSH').AsString:=XMLToValue(ReadProp('trustee1_relation'),ftString, '');
    if lLoadAdres then begin
      dsMen.FieldByName('ON_GOSUD').AsInteger:=MY_GRAG;
      DecodeObl(XMLToValue(ReadProp('trustee1_region'),ftString, ''), dsMen.FieldByName('ON_OBL'), dsMen.FieldByName('ON_B_OBL') );
      DecodeRaion(XMLToValue(ReadProp('trustee1_district'),ftString, ''), dsMen.FieldByName('ON_RAION') );
      s:=XMLToValue(ReadProp('trustee1_locality'),ftString, ''); if s<>'' then dsMen.FieldByName('ON_GOROD').AsString:=s;
    end;
    // второй попечитель
    s:=XMLToValue(ReadProp('trustee2_firstname'),ftString, '');
    if s<>'' then begin
      dsMen.FieldByName('TWO').AsBoolean:=true;
      dsMen.FieldByName('ONA_FAMILIA').AsString:=XMLToValue(ReadProp('trustee2_firstname'),ftString, '');
      dsMen.FieldByName('ONA_NAME').AsString:=XMLToValue(ReadProp('trustee2_name'),ftString, '');
      dsMen.FieldByName('ONA_OTCH').AsString:=XMLToValue(ReadProp('trustee2_lastname'),ftString, '');
      dsMen.FieldByName('ONA_IDENTIF').AsString:=XMLToValue(ReadProp('trustee2_id_number'),ftString, '');
      d:=XMLToValue(ReadProp('trustee2_birthday'),ftDate, 0);  if d>0 then dsMen.FieldByName('ONA_DATER').AsDateTime:=d;
      s:=XMLToValue(ReadProp('trustee2_citizenship'),ftString, '');
      if s<>'' then if dmBase.SprStran.Locate('ALFA3', s, []) then dsMen.FieldByName('ONA_GRAG').AsString:=dmBase.SprStran.FieldByName('ID').AsString;
    end;
    // отец
    s:=XMLToValue(ReadProp('dad_firstname'),ftString, '');
    if s<>'' then begin
      dsMen.FieldByName('OTEC_FAMILIA').AsString:=XMLToValue(ReadProp('dad_firstname'),ftString, '');
      dsMen.FieldByName('OTEC_NAME').AsString:=XMLToValue(ReadProp('dad_name'),ftString, '');
      dsMen.FieldByName('OTEC_OTCH').AsString:=XMLToValue(ReadProp('dad_lastname'),ftString, '');
      dsMen.FieldByName('OTEC_IDENTIF').AsString:=XMLToValue(ReadProp('dad_id_number'),ftString, '');
      d:=XMLToValue(ReadProp('dad_birthday'),ftDate, 0);  if d>0 then dsMen.FieldByName('OTEC_DATER').AsDateTime:=d;
      s:=XMLToValue(ReadProp('dad_citizenship'),ftString, '');
      if s<>'' then if dmBase.SprStran.Locate('ALFA3', s, []) then dsMen.FieldByName('OTEC_GRAG').AsString:=dmBase.SprStran.FieldByName('ID').AsString;
      if lLoadAdres then begin
        dsMen.FieldByName('OTEC_GOSUD').AsInteger:=MY_GRAG;
        DecodeObl(XMLToValue(ReadProp('dad_region'),ftString, ''), dsMen.FieldByName('OTEC_OBL'), dsMen.FieldByName('OTEC_B_OBL') );
        DecodeRaion(XMLToValue(ReadProp('dad_district'),ftString, ''), dsMen.FieldByName('OTEC_RAION') );
        s:=XMLToValue(ReadProp('dad_locality'),ftString, '');  if s<>'' then dsMen.FieldByName('OTEC_GOROD').AsString:=s;
      end;
    end;
    // мать
    s:=XMLToValue(ReadProp('mom_firstname'),ftString, '');
    if s<>'' then begin
      dsMen.FieldByName('MAT_FAMILIA').AsString:=XMLToValue(ReadProp('mom_firstname'),ftString, '');
      dsMen.FieldByName('MAT_NAME').AsString:=XMLToValue(ReadProp('mom_name'),ftString, '');
      dsMen.FieldByName('MAT_OTCH').AsString:=XMLToValue(ReadProp('mom_lastname'),ftString, '');
      dsMen.FieldByName('MAT_IDENTIF').AsString:=XMLToValue(ReadProp('mom_id_number'),ftString, '');
      d:=XMLToValue(ReadProp('mom_birthday'),ftDate, 0);  if d>0 then dsMen.FieldByName('MAT_DATER').AsDateTime:=d;
      s:=XMLToValue(ReadProp('mom_citizenship'),ftString, '');
      if s<>'' then if dmBase.SprStran.Locate('ALFA3', s, []) then dsMen.FieldByName('MAT_GRAG').AsString:=dmBase.SprStran.FieldByName('ID').AsString;
      if lLoadAdres then begin
        dsMen.FieldByName('MAT_GOSUD').AsInteger:=MY_GRAG;
        DecodeObl(XMLToValue(ReadProp('mom_region'),ftString, ''), dsMen.FieldByName('MAT_OBL'), dsMen.FieldByName('MAT_B_OBL') );
        DecodeRaion(XMLToValue(ReadProp('mom_district'),ftString, ''), dsMen.FieldByName('MAT_RAION') );
        s:=XMLToValue(ReadProp('mom_locality'),ftString, '');  if s<>'' then dsMen.FieldByName('MAT_GOROD').AsString:=s;
      end;
    end;
    dsMen.Post;
    Result:=true;
  end else begin
    AddProtokol(sObjectID+'  '+XMLToValue(ReadProp('child_firstname'),ftString, '')+' '+
       XMLToValue(ReadProp('child_name'),ftString, '')+' '+XMLToValue(ReadProp('child_lastname'),ftString, ''));
  end;

end;
//--------------------------------------------------------------
procedure TOpeka2XML.AddProtokol(s:String; lAddToLast:Boolean);
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
function TOpeka2XML.QueryLoad(lQuery:Boolean; sName:String): Boolean;
var
  i,n:Integer;
  s,ss:String;
begin
  Result:=true;
  if Result and lQuery then begin
    Result:=true;
    s:='Файл: '+sName+'. Загрузить ?';
    if Problem(s) then Result:=true;
//      if OkWarning(s,nil,true,false) then begin
//        Result:=true;
//      end;
  end;
end;

//--------------------------------------------------------------
function TOpeka2XML.RunImport(lQuery:Boolean; lQueryDelete:Boolean; lOnlyNew, lSeekID, lSeekIN, lLoadAdres:Boolean): Integer;
var
  node_info,men_node,node,node_data:TXMLNode;
  nCheck,nCount,nNew,i,n,m:Integer;
  sObjectID,s:String;
  dDate,dDateL:TDateTime;
  lAppend,lOk:Boolean;
  sNameLoad:String;
//  sl:TStringList;
begin
  Result:=0;
  FLastError:='';
//  FProtokol.Clear;
  XMLDokument.Clear;
  XMLDokument.Root.Name:=FNameRoot;
  CountMen:=0;
  nNew:=0;

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

  {
  node_info:=XMLDokument.Root.FindNode('DataInfo');
  if node_info=nil then begin
    AddProtokol('не найден информационный  'ktvtynТЕГ <info>');
    exit;      // ОШИБКА
  end;
  }
  SetLength(arrBases,0);
  sNameLoad:=FNameExportFile;
  lOk:=true;
//  s:=node_info.readString('ansi','');
//  if s='1'  then FToUtf8:=false  else FToUtf8:=true;  // нужно будет переводить из Utf8 в ANSI
//  n:=node_info.ReadInteger('source',0);
//  SourceID:=0;

  if lOk then begin
    node_data:=XMLDokument.Root.FindNode('Children');
    if node_data=nil then begin
      AddProtokol('данные для загрузки не найдены (Children)');
    end else begin
      AddProtokol('загрузка данных: '+sNameLoad);
//      curMen:=TdmMen.Create(nil);
//      curMen.EnableRunScript:=false;   // недоступен автоматический вызов скриптов
      if QueryLoad(lQuery, sNameLoad) then begin
        if DeleteInfo(lQueryDelete) then begin
          AddProtokol('начало загрузки:    '+FormatDateTime('dd.mm.yyyy hh:mm:ss', Now));
          n:=0;
          m:=node_data.NodeCount;
          if m>1000 then nCheck:=100 else nCheck:=10;
          CreateProgress('Загрузка', sNameLoad, m);
          ChangeProgress(1, sNameLoad);
          try
            for i:=0 to m-1 do begin
              men_node:=node_data.Nodes[i];
              if XmlToMen(men_node, lOnlyNew, lSeekID, lSeekIN, lLoadAdres, lAppend) then begin
                Inc(CountMen,1);
                if lAppend then Inc(nNew,1);
              end;
              Inc(n,1);
              if n=nCheck then begin
                n:=0;
                ChangeProgress(CountMen, sNameLoad);
              end;
              if Assigned(OnLoadOneOpeka) then
                OnLoadOneOpeka(m,CountMen,nNew,i+1);
            end;
          finally
            CloseProgress;
          end;
          AddProtokol('окончание загрузки: '+FormatDateTime('dd.mm.yyyy hh:mm:ss', Now));
          AddProtokol('загружено: '+IntToStr(CountMen));
          AddProtokol('новых: '+IntToStr(nNew));
          AddProtokol('пропущено: '+IntToStr(m-CountMen));
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
procedure TOpeka2XML.SetFileName(const Value: String);
begin
  FFileName := Value;
end;
procedure TOpeka2XML.SetLastError(const Value: String);
begin
  FLastError := Value;
end;
procedure TOpeka2XML.SetNameRoot(const Value: String);
begin
  FNameRoot:=Value;
end;
procedure TOpeka2XML.SetProtokol(const Value: TStrings);
begin
  FProtokol := Value;
end;
procedure TOpeka2XML.SetSQL(const Value: String);
begin
  FSQL := Value;
end;
procedure TOpeka2XML.SetVersion(const Value: String);
begin
  FVersion := Value;
end;
procedure TOpeka2XML.SetWinOwner(const Value: TWinControl);
begin
  FWinOwner := Value;
end;

procedure TOpeka2XML.SetNameExportFile(const Value: String);
begin
  FNameExportFile := Value;
end;

procedure TOpeka2XML.SetAddIskl(const Value: Boolean);
begin
  FAddIskl := Value;
end;

end.
