unit uDataSet2XML;
{
 Доделать возможность   WriteAsAttribute (запись значений как атрибут)
}
interface

uses Classes,Forms, FuncPr, SysUtils, Variants, Contnrs, db, NativeXML, dbFunc;

type

   TDataSet2XML=class(TObject)
   private
    FDataSet: TDataSet;
    FNameRoot: String;
    FExceptFields: String;
    FWriteAsAttribute: Boolean;
    procedure SetDataSet(const Value: TDataSet);
    procedure SetNameRoot(const Value: String);
    procedure SetExceptFields(const Value: String);
    procedure SetWriteAsAttribute(const Value: Boolean);
   public
     FLastError:String;
     FWriteNull:Boolean;
     FToANSI:Boolean;
     FOneRecord:Boolean;  // одна запись;
     FClearRecord:Boolean; // чистить запись, если FOneRecord=true
     FStru:Boolean; // записывать структуру файла
     property ExceptFields:String read FExceptFields write SetExceptFields;  // поля которые не надо сохранять
     property WriteAsAttribute:Boolean read FWriteAsAttribute write SetWriteAsAttribute;
     property DataSet:TDataSet read FDataSet write SetDataSet;
     property NameRoot:String read FNameRoot write SetNameRoot;
     function SetWriteFields(Value:String):Boolean;
     function DataSetToXML(XMLNode:TXMLNode):Boolean;
     function XMLToDataSet(XMLNode:TXMLNode):Boolean;
     function NodeToRecord(XMLNode:TXMLNode): Boolean;
     constructor Create;
     destructor Destroy; override;
   end;

   TDataSets2XML=class(TObject)
   private
    FWriteNull: Boolean;
    FOneRecord: Boolean;
    FVersion: String;
    FLastError: String;
    FSaveStru: Boolean;
    FWriteAsAttribute: Boolean;
    procedure SetOneRecord(const Value: Boolean);
    procedure SetWriteNull(const Value: Boolean);
    procedure SetVersion(const Value: String);
    procedure SetLastError(const Value: String);
    procedure SetSaveStru(const Value: Boolean);
    procedure SetWriteAsAttribute(const Value: Boolean);
   public
     XMLDokument:TNativeXml;
     ListDataSet:TObjectList;
     ListAttribute:TStringList;
     property WriteAsAttribute:Boolean read FWriteAsAttribute write SetWriteAsAttribute;
     property Version : String read FVersion write SetVersion;
     property WriteNull:Boolean read FWriteNull write SetWriteNull;
     property OneRecord:Boolean read FOneRecord write SetOneRecord;  // одна запись;
     property SaveStru:Boolean read FSaveStru write SetSaveStru;
     property LastError:String read FLastError write SetLastError;
     procedure DS_Clear;
     function DS_Add(ds:TDataSet; lOneRecord:Boolean=false):TDataset2XML;
     function DS_Count:Integer;
     function DS(i:Integer):TDataset2XML;

     procedure ReadAttributeDokument;
     procedure WriteAttributeDokument;
     procedure ClearXMLDokument;

     function DataToXML:Boolean;    //  DataSet`ы в XML
     function XMLToData:Boolean;    //  XML в Dtaaset`ы

     function StringToXML(s:String):Boolean;    // ANSI строка в XML
     function XMLToString:String;               // XML в ANSI строку

     function XMLToFile(sFile:String): Boolean;
     function FileToXML(sFile:String): Boolean;

     constructor Create;
     destructor Destroy; override;
   end;

implementation


{ TDataSet2XML }

//-------------------------------------------------------------------------------------
constructor TDataSet2XML.Create;
begin
  FOneRecord:=false;   // одна запись;
  FStru:=false;
  FWriteNull:=false;   // писать NULL значения;
  FLastError:='';
  FToANSI:=true;
  FClearRecord:=true;
  FNameRoot:='';
  FWriteAsAttribute:=false;
end;

//-------------------------------------------------------------------------------------
function TDataSet2XML.DataSetToXML(XMLNode:TXMLNode): Boolean;
var
  i:Integer;
  x:TNativeXML;
  root_node, cur_node, node, node_cdata:TXMLNode;
  sName:String;
  fld:TField;
  lOk,lExcept:Boolean;
  nCount:Integer;
  sss:String;
begin
  Result:=false;
  FLastError:='';
  if XMLNode=nil then begin
    x:=TNativeXML.Create;
    x.XmlFormat:=xfReadable;
    root_node:=x.Root;
  end else begin
    root_node:=XMLNode;
  end;
  root_node.Name:=AnsiToUtf8(NameRoot);
  if FOneRecord then begin
    root_node.AttributeAdd('ONE_RECORD','1');
  end else begin
    root_node.AttributeAdd('ONE_RECORD','0');
    DataSet.First;
  end;
  {
  if FStru then begin
    s:='';
    for i:=0 to DataSet.FieldDefs.Count-1 do begin
      DataSet.FieldDefs[i].Name+'('+IntToStr(  DataSet.FieldDefs[i].DataType;
    end;
  end;
  }
  lOk:=not DataSet.Eof;
  nCount:=0;
  if Copy(FExceptFields,1,1)='!' then begin   // пишем только перечисленные поля
    lExcept:=false;
    sss:=';'+Copy(FExceptFields,2,Length(FExceptFields))+';'
  end else begin                              // не пишем перечисленные поля
    lExcept:=true;
    sss:=';'+FExceptFields+';';
  end;
  try
    while lOk do begin
      if FOneRecord then begin
        cur_node:=root_node;
      end else begin
        cur_node:=root_node.NodeNew('row');
      end;
      nCount:=nCount+1;
      for i:=0 to DataSet.FieldCount-1 do begin
        fld:=DataSet.Fields[i];
        sName:=UpperCase(fld.FieldName);
//        if ( (FExceptFields='') or ( (lExcept and Pos(sName+';',FExceptFields)=0)) )
//             and (fld.DataType<>ftAutoInc) and (fld.FieldKind=fkData) then begin
        if ( (sss='') or (lExcept and (Pos(';'+sName+';',sss)=0)) or (not lExcept and (Pos(';'+sName+';',sss)>0))   )
             and (fld.DataType<>ftAutoInc) and (fld.FieldKind=fkData) then begin
          if fld.IsNull or (fld.AsString='') then begin
            if FWriteNull then begin
              node:=cur_node.NodeNew(AnsiToUtf8(sName));
              node.ValueAsString:='';
            end;
          end else begin
            node:=cur_node.NodeNew(AnsiToUtf8(sName));
            case fld.DataType of
              ftString   : node.ValueAsString:=AnsiToUtf8(fld.AsString);
              ftMemo     : begin
//                             node.AttributeAdd('CDATA','1');
                             node_cdata:=node.NodeNew(AnsiToUtf8(sName));
                             node_cdata.ElementType:=xeCData;
                             node_cdata.ValueAsString:=AnsiToUtf8(DataSet.Fields[i].AsString);
                           end;
              ftBoolean  : if fld.AsBoolean=true
                             then node.ValueAsString:='1'
                             else node.ValueAsString:='0';
              ftDate,ftDateTime
                         : node.ValueAsDateTime:=DataSet.Fields[i].AsDateTime;
              ftTime,ftTimeStamp
                         : node.ValueAsDateTime:=DataSet.Fields[i].AsDateTime;
              ftFloat,ftCurrency
                         : node.ValueAsFloat:=DataSet.Fields[i].AsFloat;
              ftLargeint : node.ValueAsInt64:=DataSet.Fields[i].AsInteger;
              ftInteger,ftSmallint,ftWord,ftBytes
                         : node.ValueAsInteger:=DataSet.Fields[i].AsInteger;
            else
              FLastError:='Неизвестный тип поля '+sName;
            end;
          end;
        end;
      end;
      if FOneRecord then begin
        lOk:=false;
      end else begin
        DataSet.Next;
        lOk:=not DataSet.Eof;
      end;
    end;
  except
    on E: Exception do begin
      FLastError:=E.Message;
    end;
  end;
  root_node.AttributeAdd('RECORD_COUNT',IntToStr(nCount));
//  s:=Utf8ToAnsi(x.WriteToString);
  if XMLNode=nil then begin
    x.SaveToFile('test.xml');
    x.Free;
  end;
  if FLastError=''
    then Result:=true;
end;
//-------------------------------------------------------------------------------------
function TDataSet2XML.XMLToDataSet(XMLNode:TXMLNode): Boolean;
var
  i:Integer;
  root_node, cur_node :TXMLNode;
  lOneRecord,lCheck:Boolean;
begin
  Result:=false;
  FLastError:='';        
  root_node:=XMLNode;
  try
    if root_node.AttributeByName['ONE_RECORD']='1'
      then lOneRecord:=true
      else lOneRecord:=false;
  except
    lOneRecord:=false;
  end;
  if lOneRecord then begin
    lCheck:=dbDisableControls(DataSet);
    DataSet.CheckBrowseMode;
    DataSet.Edit;
    if FClearRecord then begin
      for i:=0 to DataSet.FieldCount-1 do begin
        DataSet.Fields[i].Value:=null;
      end;
    end;
    if NodeToRecord(root_node)
      then DataSet.Post
      else DataSet.Cancel;
    dbEnableControls(DataSet,lCheck);
  end else begin
    lCheck:=dbDisableControls(DataSet);
    for i:=0 to root_node.NodeCount-1 do begin
      cur_node:=root_node.Nodes[i];
      if cur_node.Name='row' then begin
        DataSet.Append;
        if NodeToRecord(cur_node) then begin
          DataSet.Post;
        end else begin
          DataSet.Cancel;
        end;
      end;
    end;
    dbEnableControls(DataSet,lCheck);
  end;
  if FLastError=''
    then Result:=true;
end;
//----------------------------------------------------------------------
function TDataSet2XML.NodeToRecord(XMLNode:TXMLNode): Boolean;
var
  i,j:Integer;
  node :TXMLNode;  //node_cdata
  sName:String;
  fld:TField;
begin
  Result:=false;
  for i:=0 to XMLNode.NodeCount-1 do begin
    node:=XMLNode.Nodes[i];
    sName:=Utf8ToAnsi(node.Name);
    fld:=DataSet.FindField(sName);
    if fld<>nil then begin
      try
        if (node.NodeCount>0) and (node.Nodes[0].ElementType=xeCData) then begin  // !CDATA  для Memo полей  (пока так)
          fld.AsString:=Utf8ToAnsi(node.Nodes[0].ValueAsString);
        end else begin
          case fld.DataType of
            ftString   : fld.AsString:=Utf8ToAnsi(node.ValueAsString);
            ftMemo     : fld.AsString:=Utf8ToAnsi(node.ValueAsString);
            ftBoolean  : if node.ValueAsString='1'
                           then fld.AsBoolean:=true
                           else fld.AsBoolean:=false;
            ftDate,ftDateTime
                       : fld.AsDateTime:=node.ValueAsDateTime;
            ftTime,ftTimeStamp
                       : fld.AsDateTime:=node.ValueAsDateTime;
            ftFloat,ftCurrency
                       : fld.AsFloat:=node.ValueAsFloat;
            ftLargeint : fld.AsInteger:=node.ValueAsInt64;
            ftInteger,ftSmallint,ftWord,ftBytes
                       : fld.AsInteger:=node.ValueAsInteger;
          else
            FLastError:='Неизвестный тип поля '+sName;
          end;
        end;
      except
        on E: Exception do begin
          FLastError:=E.Message;
        end;
      end;
    end;
  end;
  if FLastError=''
    then Result:=true;
end;

//-------------------------------------------------------------------------------------
destructor TDataSet2XML.Destroy;
begin
  inherited;
end;

//-------------------------------------------------------------------------------------
procedure TDataSet2XML.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
  if FNameRoot='' then FNameRoot:=ANSIUpperCase(FDataSet.Name);
end;

//-------------------------------------------------------------------------------------
procedure TDataSet2XML.SetNameRoot(const Value: String);
begin
  FNameRoot := ANSIUpperCase(Value);
end;

//-------------------------------------------------------------------------------------
procedure TDataSet2XML.SetExceptFields(const Value: String);
begin
  FExceptFields := Value;
  FExceptFields := UpperCase(FExceptFields);
end;
function TDataSet2XML.SetWriteFields(Value:String): Boolean;
begin
  Result:=true;
  if Value=''
    then FExceptFields := ''
    else FExceptFields := '!'+UpperCase(Value);
end;

{ TDataSets2XML }

constructor TDataSets2XML.Create;
begin
  XMLDokument:=TNativeXml.Create;
  XMLDokument.XmlFormat:=xfReadable;
  XMLDokument.Root.Name:='DataSets';
  ListDataSet:=TObjectList.Create;
  ListAttribute:=TStringList.Create;
  ListDataSet.OwnsObjects:=true;
  FWriteNull:=false;
  FOneRecord:=false;
  FSaveStru:=false;
  FVersion:='1';
  FWriteAsAttribute:=false;
end;
//-----------------------------------------------------------
function TDataSets2XML.DataToXML: Boolean;
var
  i:Integer;
  xmlNode:TXMLNode;
  dsx:TDataSet2XML;
  s:String;
begin
  Result:=true;
  XMLDokument.Clear;
  XMLDokument.XmlFormat:=xfReadable;
  XMLDokument.Root.Name:='DATASETS';
  XMLDokument.Root.AttributeAdd('VERSION',FVersion);
  WriteAttributeDokument;
  FLastError:='';
  s:='';
  for i:=0  to ListDataSet.Count-1 do begin
    dsx:=TDataSet2XML(ListDataSet.Items[i]);
    xmlNode:=XMLDokument.Root.NodeNew(dsx.NameRoot);
    dsx.DataSetToXML(xmlNode);
    if dsx.FLastError<>'' then begin
      s:=s+dsx.FLastError+chr(13)+chr(10);
    end;
  end;
  FLastError:=s;
  if FLastError<>''
    then Result:=false;
end;
//-----------------------------------------------------------
function TDataSets2XML.XMLToData: Boolean;
var
  i,j:Integer;
  xmlNode:TXMLNode;
  dsx:TDataSet2XML;
  s,sName:String;
begin
  Result:=true;
  FLastError:='';
  s:='';
  for i:=0  to ListDataSet.Count-1 do begin
    dsx:=TDataSet2XML(ListDataSet.Items[i]);
    sName:=ANSIUpperCase(dsx.NameRoot); // DataSet.Name);
    for j:=0 to XMLDokument.Root.NodeCount-1 do begin
      if Utf8ToAnsi(XMLDokument.Root.Nodes[j].Name)=sName then begin
        dsx.XMLToDataSet(XMLDokument.Root.Nodes[j]);
        if dsx.FLastError<>'' then begin
          s:=s+dsx.FLastError+chr(13)+chr(10);
        end;
      end;
    end;
  end;
  FLastError:=s;
  if FLastError<>''
    then Result:=false;
end;
//-----------------------------------------------------------
function TDataSets2XML.XMLToString: String;
begin
  Result:=Utf8ToAnsi(XMLDokument.WriteToString);
end;
//-----------------------------------------------------------
function TDataSets2XML.StringToXML(s: String): Boolean;
begin
  Result:=false;
  ClearXMLDokument;
  if s<>'' then begin
    try
      XMLDokument.ReadFromString(AnsiToUtf8(s));
      Result:=true;
    except
      on E: Exception do begin
        FLastError:=E.Message;
      end;
    end;
  end;
end;
//-----------------------------------------------------------
function TDataSets2XML.FileToXML(sFile:String): Boolean;
begin
  Result:=false;
  ClearXMLDokument;
  try
    XMLDokument.LoadFromFile(sFile);
    Result:=true;
  except
    on E: Exception do begin
      FLastError:=E.Message;
    end;
  end;
end;
//-----------------------------------------------------------
function TDataSets2XML.XMLToFile(sFile:String): Boolean;
begin
  Result:=false;
  try
    XMLDokument.SaveToFile(sFile);
    Result:=true;
  except
    on E: Exception do begin
      FLastError:=E.Message;
    end;
  end;
end;
//-----------------------------------------------------------
procedure TDataSets2XML.ReadAttributeDokument;
var
  i:Integer;
begin
  ListAttribute.Clear;
  for i:=0 to XMLDokument.Root.AttributeCount-1 do begin
    ListAttribute.Add(Utf8ToAnsi(XMLDokument.Root.AttributeName[i])+'='+Utf8ToAnsi(XMLDokument.Root.AttributeValue[i]));
  end;
end;
//-----------------------------------------------------------
procedure TDataSets2XML.WriteAttributeDokument;
var
  i,n:Integer;
begin
  for i:=0 to ListAttribute.Count-1 do begin
    n:=XMLDokument.Root.AttributeIndexByname(AnsiToUtf8(ListAttribute.Names[i]));
    if n>-1 then begin
      XMLDokument.Root.AttributeValue[n]:=AnsiToUtf8(ListAttribute.ValueFromIndex[i]);
    end else begin
      XMLDokument.Root.AttributeAdd(AnsiToUtf8(ListAttribute.Names[i]), AnsiToUtf8(ListAttribute.ValueFromIndex[i]));
    end;
  end;
end;

//-----------------------------------------------------------
procedure TDataSets2XML.ClearXMLDokument;
begin
  ListAttribute.Clear;
  XMLDokument.Clear;
  XMLDokument.XmlFormat:=xfReadable;
end;

//-----------------------------------------------------------
destructor TDataSets2XML.Destroy;
begin
  ListDataSet.Free;
  ListAttribute.Free;
  XMLDokument.Free;
  inherited;
end;

//-----------------------------------------------------------
function TDataSets2XML.DS(i: Integer): TDataset2XML;
begin
  Result:=TDataSet2XML(ListDataSet.Items[i]);
end;

//-----------------------------------------------------------
function TDataSets2XML.DS_Add(ds:TDataSet; lOneRecord:Boolean): TDataset2XML;
begin
  Result:=TDataSet2XML.Create;
  Result.DataSet:=ds;
  Result.FWriteNull:=WriteNull;
  Result.FOneRecord:=lOneRecord;
  Result.FStru:=FSaveStru;
  ListDataSet.Add(Result);
end;

//-----------------------------------------------------------
procedure TDataSets2XML.DS_Clear;
begin
  ListDataSet.Clear;
end;

//-----------------------------------------------------------
function TDataSets2XML.DS_Count: Integer;
begin
  Result:=ListDataSet.Count;
end;

//-----------------------------------------------------------
procedure TDataSets2XML.SetOneRecord(const Value: Boolean);
begin
  FOneRecord := Value;
end;
//-----------------------------------------------------------
procedure TDataSets2XML.SetWriteNull(const Value: Boolean);
begin
  FWriteNull := Value;
end;

//-----------------------------------------------------------
procedure TDataSets2XML.SetVersion(const Value: String);
begin
  FVersion := Value;
end;

//-----------------------------------------------------------
procedure TDataSets2XML.SetLastError(const Value: String);
begin
  FLastError := Value;
end;

procedure TDataSets2XML.SetSaveStru(const Value: Boolean);
begin
  FSaveStru := Value;
end;


procedure TDataSet2XML.SetWriteAsAttribute(const Value: Boolean);
begin
  FWriteAsAttribute := Value;
end;

procedure TDataSets2XML.SetWriteAsAttribute(const Value: Boolean);
begin
  FWriteAsAttribute := Value;
end;

end.
