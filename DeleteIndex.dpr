program CheckConnect;
{$APPTYPE CONSOLE}
uses
  SysUtils, {ace,}{,adscnnct}IniFiles{, FuncPr}, uUtilFiles;

type
  TArrStrings = array of String;

var
//  Conn : TAdsConnection;
  ini  : TIniFile;
  strPath : String;
  s : String;
  arr : TArrStrings;
  i : Integer;
function CheckSleshN( strDir : String ) : String;
begin
  strDir := Trim(strDir);
  if Copy(strDir,Length(strDir),1) <> '\' then begin
    strDir := strDir + '\';
  end;
  Result := strDir;
end;
function IsFullPath( strDir : String ) : Boolean;
begin
  if ( Pos('..', strDir)>0 ) or ( Pos('\\', strDir)>0 ) or
     ( Pos(':', strDir)>0 ) then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;
function  StrToArr(cStr : String; cDelim : String;
                   lDelEmpty : Boolean) : TArrStrings;
var
  iPos   : Integer;
  iCount : Integer;
  iLen   : Integer;
  s : String;
begin
  iCount := 0;
  SetLength(Result,10);
  iLen := Length(cDelim);
  while Length(cStr) > 0 do begin
    iPos := Pos( cDelim, cStr );
    Inc(iCount);
    if Length(Result) < iCount then begin
      SetLength(Result, Length(Result)+10);
    end;
    if ( iPos > 0 ) then begin
      s := Copy( cStr, 1, iPos - 1 );
      if not lDelEmpty or ( Length(Trim(s)) > 0 ) then begin
        Result[iCount-1] := s;
      end else begin
        Dec(iCount);
      end;
      cStr := Copy( cStr, iPos + iLen, Length(cStr) );
    end else begin
      if not lDelEmpty or ( Length(Trim(cStr)) > 0 ) then begin
        Result[iCount-1] := cStr;
      end else begin
        Dec(iCount);
      end;
      cStr:='';
    end;
  end;
  SetLength(Result, iCount);
end;
function Right( sStr: String; iNum: LongInt ): String;
begin
  Result := '';
  if not (iNum > Length(sStr)) then begin
    Result := Copy( sStr, (Length(sStr) - iNum + 1), Length(sStr) );
  end;
end;
function LastPos( strSeek : String; strSource: String) : Integer;
var
 i : Integer;
begin
  Result:=0;
  for i:=Length(strSource) downto 1 do begin
    if Copy(strSource,i,Length(strSeek))=strSeek then begin
      Result := i;
      break;
    end;
  end;
end;
begin
  ini  := TIniFile.Create(ExtractFilePath(ParamStr(0))+'SysParams.ini');
  strPath := ini.ReadString('PATH','CONNECT','');
  if Length(strPath)=0 then strPath:='DATA';
  if not IsFullPath(strPath) then begin
    strPath := CheckSleshN(ExtractFilePath(ParamStr(0)))+strPath;
  end;
  if UpperCase(Right(strPath,4))='.ADD' then begin
    i := LastPos('\', strPath);
    strPath := Copy(strPath,1,i);
  end;
  strPath := CheckSleshN(strPath);
  DeleteFiles(strPath+'*.adi');
  DeleteFiles(strPath+'*.bak');
end.
