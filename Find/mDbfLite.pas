unit mDbfLite; // dbf lite
interface
uses
   Classes;

type
   PDBFHeader=^TDBFHeader;
   TDBFHeader=packed record
      typ: Byte;
      year: Byte;
      month: Byte;
      day: Byte;
      last_rec: LongInt;
      data_offset: word;
      rec_size: word;
      Reserve1: array[0..1] of Byte;
      TranIncmpl: Byte;
      Encrypted: Byte;
      MultUseFlg: LongInt;
      UserIDLast: LongInt;
      Reserve2: array[0..3] of Byte;
      DBTableFlag: Byte;
      LangID: Byte;
      Reserve3: array[0..1] of Byte;
   end;

   PDBFField=^TDBFField;
   TDBFField=packed record
      name: array[0..10] of Char;
      typ: Char;
      offset: LongInt;
      len: Byte;
      dec: Byte;
      dbFieldFlag: Byte;
      ResBytes: array[0..4] of Byte;
      ResWord: word;
      dbFieldNum: word;
      dbFiller: array[0..3] of Byte;
   end;

   PDBFFieldArr=^TDBFFieldArr;
   TDBFFieldArr=array [0..4095] of TDBFField;
   TDBFFieldRec=record
      name: string;
      len: Integer;
      dec: Integer;
      typ: Char;
   end;
   TDBFFieldArray=array of TDBFFieldRec;

   TDBFFileState=(dfsWrite, dfsNone);

   TDBFFile=class (TObject)
   private
      FState: TDBFFileState;
      FAppend: Boolean;
      FFileName: string;
      FFile: Integer;
      FHeader: TDBFHeader;
      FFields: PDBFFieldArr;
      FOpen: Boolean;
      FOnlyRead: Boolean;
      FCurRecord: PChar;
      FCurRec: Integer;
      FFieldsCount: Integer;
   private
      procedure SetCurRec(const Value: Integer);
      function GetField(i: Integer): string;
      procedure SetField(i: Integer; const Value: string);
      function GetNumRecs: Integer;
      function GetEof: Boolean;
   public
      constructor Create(FileName: string);
      destructor Destroy; override;
      function Open(OnlyRead: Boolean=True): Boolean;
      function GetFieldNo(FieldName: string): Integer;
      procedure First;
      procedure Next;
      procedure Close;
      procedure Append;
      procedure Flush;
   public
      property Eof: Boolean read GetEof;
      property NumRecs: Integer read GetNumRecs;
      property CurRec: Integer read FCurRec write SetCurRec;
      property Fields[I: Integer]: string read GetField write SetField; default;
      property FieldsCount: Integer read FFieldsCount;
      property IsOpen: Boolean read FOpen;
      property FileName: string read FFileName;
      property FieldsArr: PDBFFieldArr read FFields;
   end;

function CreateDBF(FileName: string; var Fields: TDBFFieldArray; Rewrite: Boolean=True): Boolean;

implementation
uses
   Windows, SysUtils;

function CreateDBF(FileName: string; var Fields: TDBFFieldArray; Rewrite: Boolean=true): Boolean;
const
   E: array [1..3] of byte=($0D, $00, $1A);
var
   F: Integer;
   Header: TDBFHeader;
   I: Integer;
   Len: Integer;
   Year: Word;
   Month: Word;
   Day: Word;
   Field: TDBFField;
begin
   Result:=False;
   if not Rewrite and FileExists(FileName) then begin
      Result:=True;
   end
   else begin
      F:=FileCreate(FileName);
      if F>0 then begin
         FillChar(Header, SizeOf(Header), 0);
         Len:=0;
         for I:=Low(Fields) to High(Fields) do begin
            case Fields[I].typ of
               'C': begin
                  Len:=Len+Fields[I].len+Fields[I].dec*256;
               end;
               'D': begin
                  Len:=Len+8;
                  Fields[i].len:=8;
               end;
               'L': begin
                  Len:=Len+1;
                  Fields[i].len:=1;
               end;
               'N': begin
                  Len:=Len+Fields[I].len;
               end;
            end;
         end;
         DecodeDate(Now, Year, Month, Day);
         Header.typ:=$03;
         Header.year:=StrToInt(copy(IntToStr(Year), 3, 2));
         Header.month:=Month;
         Header.day:=Day;
         Header.data_offset:=Length(Fields)*SizeOf(TDBFField)+SizeOf(Header)+1;
         Header.rec_size:=Len+1;
         FileWrite(F, Header, SizeOf(TDBFHeader));
         for I:=Low(Fields) to High(Fields) do begin
            FillChar(Field, SizeOf(TDBFField), 0);
            Move(Fields[I].name[1], field.name, length(fields[I].name));
            Field.typ:=Fields[I].typ;
            Field.len:=Fields[I].len;
            Field.dec:=Fields[I].dec;
            FileWrite(F, Field, SizeOf(TDBFField));
         end;
         FileWrite(F, E, SizeOf(E));
         FileClose(F);
         Result:=True;
      end;
   end;
end;

{ TDBFFile }

procedure TDBFFile.Append;
begin
   if FOpen and not FOnlyRead then begin
      Flush;
      inc(FHeader.last_rec);
      FCurRec:=FHeader.last_rec;
      FillChar(FCurRecord^, succ(FHeader.rec_size), ' ');
      FileSeek(FFile, FHeader.data_offset+pred(FCurRec)*FHeader.rec_size, 0);
      FState:=dfsWrite;
      FAppend:=True;
   end;
end;

procedure TDBFFile.Close;
begin
   if FFile>0 then begin
      try
         Flush;
         FOpen:=False;
         if FFields<>nil then begin
            if not FOnlyRead then begin
               FileSeek(FFile, 0, 0);
               FileWrite(FFile, FHeader, SizeOf(TDBFHeader));
            end;
            FreeMem(FFields, succ(FHeader.data_offset-SizeOf(TDBFHeader)));
            FFields:=nil;
         end;
         if FCurRecord<>nil then begin
            FreeMem(FCurRecord, succ(FHeader.rec_size));
            FCurRecord:=nil;
         end;
      finally
         FileClose(FFile);
         FFile:=-1;
      end;
   end;
end;

constructor TDBFFile.Create(FileName: string);
begin
   FOpen:=False;
   FFields:=nil;
   FCurRecord:=nil;
   FFile:=-1;
   FFileName:=FileName;
   FState:=dfsNone;
   FOnlyRead:=True;
   FAppend:=False;
end;

destructor TDBFFile.Destroy;
begin
   Close;
   inherited;
end;

procedure TDBFFile.First;
begin
   FCurRec:=0;
   if FOpen then begin
      Flush;
      FileSeek(FFile, FHeader.data_offset, 0);
      Next;
   end;
end;

procedure TDBFFile.Flush;
const
  ef:Byte =$1A;
begin
   if FOpen and (FState=dfsWrite) and not FOnlyRead then begin
      FileWrite(FFile, FCurRecord^, FHeader.rec_size);
      if FAppend then begin
         FileWrite(FFile, ef, 1);
      end;
      FState:=dfsNone;
      FAppend:=False;
   end;
end;

function TDBFFile.GetEof: Boolean;
begin
   Result:=FOpen and (FHeader.last_rec<FCurRec);
end;

function TDBFFile.GetField(i: Integer): string;
var
   field: TDBFField;
   pc: PChar;
   offset: Integer;
   len: Integer;
begin
   if (i>=0) and (i<FFieldsCount) then begin
      field:=FFields^[i];
      offset:=field.offset;
      case field.typ of
         'C': begin
            len:=field.len+field.dec*256;//!!!???
            Result:=copy(FCurRecord, offset, len);
            pc:=PChar(Result);
            OemToCharBuff(pc, pc, len);
         end;
         'L': begin
            Result:=copy(FCurRecord, offset, 1);
         end;
         'D': begin
            pc:=FCurRecord+offset;
            dec(pc);
            if pc^=' ' then begin
               Result:='';
            end
            else begin
               Result:=copy(pc, 0, 8);
            end;
         end;
         'N': begin
            len:=field.len;
            pc:=FCurRecord+offset;
            dec(pc);
            while (pc^=' ') and (len>0) do begin
               inc(pc);
               dec(len);
            end;
            Result:=copy(pc, 0, len);
         end;
         'M': begin
            Result:='';
         end;
      end;
   end
   else begin
      Result:='';
   end;
end;

function TDBFFile.GetFieldNo(FieldName: string): Integer;
var
   i: Integer;
begin
   Result:=-1;
   i:=0;
   while (Result=-1) and (i<FieldsCount) do begin
     if FFields^[i].name=FieldName then begin
        Result:=i;
        Exit;
     end;
     inc(i);
   end;
end;

function TDBFFile.GetNumRecs: Integer;
begin
   if FOpen then begin
      Result:=FHeader.last_rec;
   end
   else begin
      Result:=-1;
   end;
end;

procedure TDBFFile.Next;
begin
   if FOpen then begin
      Flush;
      repeat
         inc(FCurRec);
         if not eof then begin
            FileRead(FFile, FCurRecord^, FHeader.rec_size);
         end;
      until Eof or (FCurRecord^<>'*');
   end;
end;

function TDBFFile.Open(OnlyRead: Boolean): Boolean;
var
   mode: Integer;
   count: Integer;
   fl: Integer;
   i: Integer;
   offset: Integer;
begin
   Result:=False;
   Close;
   if FileExists(FFileName) then begin
      FOnlyRead:=OnlyRead;
      if OnlyRead then begin
         mode:=fmOpenRead or fmShareExclusive;
      end
      else begin
         mode:=fmOpenReadWrite or fmShareExclusive;
      end;
      FFile:=FileOpen(FFileName, mode);
      if FFile>0 then begin
         count:=FileRead(FFile, FHeader, SizeOf(TDBFHeader));
         if count<>SizeOf(TDBFHeader) then begin
            Close;
            Exit;
         end;
         fl:=succ(FHeader.data_offset-SizeOf(TDBFHeader));
         GetMem(FFields, fl);
         FFieldsCount:=(FHeader.data_offset-SizeOf(TDBFHeader)) div SizeOf(TDBFField);
         count:=FileRead(FFile, FFields^, fl);
         if count<>fl then begin
            Close;
            Exit;
         end;
         offset:=2;
         for i:=0 to FieldsCount-1 do begin
            FFields^[i].offset:=offset;
            if FFields^[i].typ='C' then begin
               offset:=offset+FFields^[i].len+FFields^[i].dec*256;
               FFields^[i].len:=FFields^[i].len+FFields^[i].dec*256;
            end
            else begin
               offset:=offset+FFields^[i].len;
            end;
         end;
         GetMem(FCurRecord, succ(FHeader.rec_size));
         FState:=dfsNone;
         FAppend:=False;
         FOpen:=True;
         First;
         Result:=True;
      end;
   end;
end;

procedure TDBFFile.SetCurRec(const Value: Integer);
begin
   if FOpen then begin
      if Value<>FCurRec then begin
         Flush;
         FCurRec:=Value;
         FileSeek(FFile, FHeader.data_offset+pred(FCurRec)*FHeader.rec_size, 0);
         FileRead(FFile, FCurRecord^, FHeader.rec_size);
      end;
   end;
end;

procedure TDBFFile.SetField(i: Integer; const Value: string);
var
   field: TDBFField;
   pc: PChar;
   pc2: PChar;
   offset: Integer;
   len: Integer;
   vlen: Integer;
begin
   if (i>=0) and (i<FFieldsCount) then begin
      field:=FFields^[i];
      if field.typ='C' then begin
         len:=field.len+field.dec*256;//!!!???
      end
      else begin
         len:=field.len;
      end;
      vlen:=Length(Value);
      offset:=field.offset;
      pc:=FCurRecord+offset;
      dec(pc);
      case field.typ of
         'C': begin
            if vlen=0 then begin
               FillChar(pc^, len, ' ');
            end
            else begin
               if len>vlen then begin
                  pc2:=pc+vlen;
                  FillChar(pc2^, len-vlen, ' ');
               end
               else begin
                  vlen:=len;
               end;
               move(value[1], pc^, vlen);
               CharToOemBuff(pc, pc, vlen);
            end;
         end;
         'L': begin
            if vlen=0 then begin
               pc^:=' ';
            end
            else begin
               pc^:=value[1];
               if (pc^<>'T') and (pc^<>'F') then begin
                  pc^:=' ';
               end;
            end;
         end;
         'D': begin
            if (vlen=0) or (vlen<8) then begin
               FillChar(pc^, 8, ' ');
            end
            else begin
               move(value[1], pc^, 8);
            end;
         end;
         'N': begin
            if vlen=0 then begin
               FillChar(pc^, len, ' ');
            end
            else begin
               if len>vlen then begin
                  FillChar(pc^, len-vlen, ' ');
                  pc:=pc+len-vlen;
               end
               else begin
                  vlen:=len;
               end;
               move(value[1], pc^, vlen);
            end;
         end;
         'M': begin
         end;
      end;
   end;
end;

end.
