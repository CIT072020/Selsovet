unit uSaveMemTable;
interface
uses
   Classes, Forms, SysUtils, IniFiles, DB, TypInfo, StrUtils, Windows,
   kbmMemTable, kbmMemCSVStreamFormat;


//функции чтения/записи последовательности таблиц (MemTable)
function LoadMemTable(FileName: string; Arg: array of const; LoadFormat: TkbmCSVStreamFormat=nil): Boolean;
function SaveMemTable(FileName: string; Arg: array of const; CreateBackup: Boolean=True; SaveFormat: TkbmCSVStreamFormat=nil): Boolean;
function CreateDefaultFormat: TkbmCSVStreamFormat;

function LoadMemTableFromStr(sValue:String; Arg: array of const; strRazdField:String; LoadFormat: TkbmCSVStreamFormat=nil): Boolean;
function SaveMemTableToStr(Arg: array of const; var strRazdField:String; SaveFormat: TkbmCSVStreamFormat=nil): String;

var
  SaveDef:Boolean;

implementation

function CreateDefaultFormat: TkbmCSVStreamFormat;
begin
   Result:=TkbmCSVStreamFormat.Create(nil);
   Result.CSVQuote:=#0;
   Result.CSVFieldDelimiter:=chr(20); //';';
   Result.CSVRecordDelimiter:=#0;
   Result.sfDef:=[];
end;

function CreateDefaultFormat2: TkbmCSVStreamFormat;
begin
   Result:=TkbmCSVStreamFormat.Create(nil);
   Result.CSVQuote:=#0;
   Result.CSVFieldDelimiter:=chr(20); //';';
   Result.CSVRecordDelimiter:=#0;
   Result.sfDef:=[sfSaveDef];
end;

function LoadMemTable(FileName: string; Arg: array of const; LoadFormat: TkbmCSVStreamFormat=nil): Boolean;
var
   I: Integer;
   StartPos: Integer;
   EndPos: Integer;
   ds: TkbmMemTable;
   Section: string;
   sl: TStringList;
   Sections: TStringList;
   S: string;
   stream: TStringStream;
   Offset: Cardinal;
   Ind: Integer;
   DefaultLoadFormat: TkbmCSVStreamFormat;
begin
   Result:=True;
   if FileExists(FileName) then begin
      //создание формата по умолчанию
      DefaultLoadFormat:=nil;
      if LoadFormat=nil then begin
         if SaveDef
           then DefaultLoadFormat:=CreateDefaultFormat2
           else DefaultLoadFormat:=CreateDefaultFormat;
         LoadFormat:=DefaultLoadFormat;
      end;
      sl:=TStringList.Create;
      Sections:=TStringList.Create;
      try
         sl.LoadFromFile(FileName);
         S:=sl.Text;
         //поиск всех секций
         Offset:=0;
         if (Length(S)>0) and (S[1]='[') then begin
            Offset:=1;
         end;
         StartPos:=Offset-2;
         repeat
            if Offset<>0 then begin
               Offset:=PosEx(']'#13#10, S, Offset);
               if Offset<>0 then begin
                  EndPos:=Offset;
                  Sections.AddObject(AnsiUpperCase(Copy(S, StartPos+2, Succ(EndPos-StartPos-2))), TObject(EndPos+3));
               end;
            end;
            Offset:=PosEx(#13#10'[', S, Offset);
            StartPos:=Offset;
         until Offset=0;
         //цикл по списку загружаемых таблиц
         for I:=Low(Arg) to High(Arg) div 2 do begin
            if (Arg[Succ(I*2)].VType=vtObject) and (Arg[I*2].VType=vtAnsiString) and (Arg[Succ(I*2)].VObject is TkbmMemTable) then begin
               ds:=TkbmMemTable(Arg[(I*2)+1].VObject);
               Section:='['+AnsiUpperCase(string(Arg[I*2].VAnsiString))+']';
               Ind:=Sections.IndexOf(Section);
               //если нашли секцию
               if Ind<>-1 then begin
                  StartPos:=Integer(Sections.Objects[Ind]);
                  if Ind<Pred(Sections.Count) then begin
                     EndPos:=Integer(Sections.Objects[Succ(Ind)])-Length(Sections[Succ(Ind)])-5;
                  end
                  else begin
                     EndPos:=Length(S);
                  end;
                  stream:=TStringStream.Create(Copy(S, StartPos, Succ(EndPos-StartPos)));
                  try
                     ds.LoadFromStreamViaFormat(stream, LoadFormat)
                  finally
                     stream.Free;
                  end;
               end
               else begin
                  Result:=False;
               end;
            end;
         end;
      finally
         if DefaultLoadFormat<>nil then begin
            DefaultLoadFormat.Free;
         end;
         Sections.Free;
         sl.Free;
      end;
   end;
end;

function SaveMemTable(FileName: string; Arg: array of const; CreateBackup: Boolean=True; SaveFormat: TkbmCSVStreamFormat=nil): Boolean;
var
   Section: string;
   sl: TStringList;
   stream: TStringStream;
   I:Integer;
   ds: TkbmMemTable;
   BakFileName: string;
   DefaultSaveFormat: TkbmCSVStreamFormat;
begin
   Result:=False;
   //создание копии файла
   if FileExists(FileName) then begin
      BakFileName:=ChangeFileExt(FileName, StringReplace(ExtractFileExt(FileName), '.', '.~', []));
      CopyFile(PChar(FileName), PChar(BakFileName), False);
   end;
   //создание формата по умолчанию
   DefaultSaveFormat:=nil;
   if SaveFormat=nil then begin
      if SaveDef
        then DefaultSaveFormat:=CreateDefaultFormat2
        else DefaultSaveFormat:=CreateDefaultFormat;
      SaveFormat:=DefaultSaveFormat;
   end;
   sl:=TStringList.Create;
   stream:=TStringStream.Create('');
   try
      //цикл по списку сохраняемых таблиц
      for I:=Low(Arg) to (High(Arg) div 2) do begin
         if (Arg[Succ(I*2)].VType=vtObject)  and (Arg[I*2].VType=vtAnsiString)  and (Arg[Succ(I*2)].VObject is TkbmMemTable) then begin
            ds:=TkbmMemTable(Arg[Succ(I*2)].VObject);
            Section:='['+string(Arg[I*2].VAnsiString)+']';
            sl.Add(Section);
            ds.SaveToStreamViaFormat(stream, SaveFormat);
            sl.Add(stream.DataString);
            stream.Size:=0;
         end;
      end;
      sl.SaveToFile(FileName);
      Result:=True;
   finally
      if DefaultSaveFormat<>nil then begin
         DefaultSaveFormat.Free;
      end;
      sl.Free;
      stream.Free;
   end;
end;

//-----------------------------------------------------------------------------------------------------------------
function LoadMemTableFromStr(sValue:String; Arg: array of const; strRazdField:String; LoadFormat: TkbmCSVStreamFormat=nil): Boolean;
var
   I: Integer;
   StartPos: Integer;
   EndPos: Integer;
   ds: TkbmMemTable;
   Section: string;
   sl: TStringList;
   Sections: TStringList;
   S: string;
   stream: TStringStream;
   Offset: Cardinal;
   Ind: Integer;
   DefaultLoadFormat: TkbmCSVStreamFormat;
begin
   Result:=True;
   //создание формата по умолчанию
   DefaultLoadFormat:=nil;
   if LoadFormat=nil then begin
     if SaveDef
       then DefaultLoadFormat:=CreateDefaultFormat2
       else DefaultLoadFormat:=CreateDefaultFormat;
     LoadFormat:=DefaultLoadFormat;
   end;

   //======================================================
   if Length(strRazdField)=0 then strRazdField:=';';
   LoadFormat.CSVFieldDelimiter:=strRazdField[1];   // !!!
   //======================================================

   sl:=TStringList.Create;
   Sections:=TStringList.Create;
   try
//     sl.Text:=LoadFromFile(FileName);
     S:=sValue;
     //поиск всех секций
     Offset:=0;
     if (Length(S)>0) and (S[1]='[') then begin
       Offset:=1;
     end;
     StartPos:=Offset-2;
     repeat
       if Offset<>0 then begin
         Offset:=PosEx(']'#13#10, S, Offset);
         if Offset<>0 then begin
           EndPos:=Offset;
           Sections.AddObject(AnsiUpperCase(Copy(S, StartPos+2, Succ(EndPos-StartPos-2))), TObject(EndPos+3));
         end;
       end;
       Offset:=PosEx(#13#10'[', S, Offset);
       StartPos:=Offset;
     until Offset=0;
     //цикл по списку загружаемых таблиц
     for I:=Low(Arg) to High(Arg) div 2 do begin
       if (Arg[Succ(I*2)].VType=vtObject) and (Arg[I*2].VType=vtAnsiString) and (Arg[Succ(I*2)].VObject is TkbmMemTable) then begin
         ds:=TkbmMemTable(Arg[(I*2)+1].VObject);
         Section:='['+AnsiUpperCase(string(Arg[I*2].VAnsiString))+']';
         Ind:=Sections.IndexOf(Section);
         //если нашли секцию
         if Ind<>-1 then begin
           StartPos:=Integer(Sections.Objects[Ind]);
           if Ind<Pred(Sections.Count) then begin
             EndPos:=Integer(Sections.Objects[Succ(Ind)])-Length(Sections[Succ(Ind)])-5;
           end
           else begin
             EndPos:=Length(S);
           end;
           stream:=TStringStream.Create(Copy(S, StartPos, Succ(EndPos-StartPos)));
           try
             ds.LoadFromStreamViaFormat(stream, LoadFormat)
           finally
             stream.Free;
           end;
         end
         else begin
           Result:=False;
         end;
       end;
    end;
  finally
    if DefaultLoadFormat<>nil then begin
      DefaultLoadFormat.Free;
    end;
    Sections.Free;
  end;
end;

function SaveMemTableToStr(Arg: array of const; var strRazdField:String; SaveFormat: TkbmCSVStreamFormat): String;
var
   Section: string;
   sl: TStringList;
   stream: TStringStream;
   I:Integer;
   ds: TkbmMemTable;
   BakFileName: string;
   DefaultSaveFormat: TkbmCSVStreamFormat;
begin
   Result:='';
   //создание формата по умолчанию
   DefaultSaveFormat:=nil;
   if SaveFormat=nil then begin
      if SaveDef
        then DefaultSaveFormat:=CreateDefaultFormat2
        else DefaultSaveFormat:=CreateDefaultFormat;
      SaveFormat:=DefaultSaveFormat;
   end;

   //======================================================
   strRazdField:=SaveFormat.CSVFieldDelimiter;   // !!!
   //======================================================

   sl:=TStringList.Create;
   stream:=TStringStream.Create('');
   try
      //цикл по списку сохраняемых таблиц
      for I:=Low(Arg) to (High(Arg) div 2) do begin
         if (Arg[Succ(I*2)].VType=vtObject)  and (Arg[I*2].VType=vtAnsiString)  and (Arg[Succ(I*2)].VObject is TkbmMemTable) then begin
            ds:=TkbmMemTable(Arg[Succ(I*2)].VObject);
            Section:='['+string(Arg[I*2].VAnsiString)+']';
            sl.Add(Section);
            ds.SaveToStreamViaFormat(stream, SaveFormat);
            sl.Add(stream.DataString);
            stream.Size:=0;
         end;
      end;
      Result:=sl.Text;
   finally
      if DefaultSaveFormat<>nil then begin
         DefaultSaveFormat.Free;
      end;
      sl.Free;
      stream.Free;
   end;
end;

initialization
  SaveDef:=true;
end.
