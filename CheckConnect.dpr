program CheckConnect;
{$APPTYPE CONSOLE}
uses
  SysUtils,ace{,adscnnct},IniFiles{, FuncPr};

type
  TArrStrings = array of String;

var
//  Conn : TAdsConnection;
  ini  : TIniFile;
  strPath : String;
  nType : UNSIGNED16;
  nCode : UNSIGNED32;
  s : String;
  arr : TArrStrings;
  i : Integer;
  h : ADSHANDLE;
  ulRetVal : UNSIGNED32;
  hTable : ADSHANDLE;

//-------------------------------------------------------
function CheckSleshN( strDir : String ) : String;
begin
  strDir := Trim(strDir);
  if Copy(strDir,Length(strDir),1) <> '\' then begin
    strDir := strDir + '\';
  end;
  Result := strDir;
end;
//-------------------------------------------------------
function IsFullPath( strDir : String ) : Boolean;
begin
  if ( Pos('..', strDir)>0 ) or ( Pos('\\', strDir)>0 ) or
     ( Pos(':', strDir)>0 ) then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;
//-------------------------------------------------------
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
//-----------------------------------------------------------
function PadRStr( s : String; nLen : Integer; cSim : Char) : String;
begin
  Result := s;
  while Length(Result) < nLen do begin
    Result := Result + cSim;
  end;
  if Length(Result) > nLen then begin
    Result := Copy(Result,1,nLen);
  end;
end;
//-------------------------------------------------------
function FindServers(nType:Integer):Boolean;
var
  hTable,hConn:ADSHANDLE;
  ulRet : UNSIGNED32;
  usIsEOF: UNSIGNED16;
  ulLen : UNSIGNED32;
  pcField : PAnsiChar;
  s,ss:String;
  n:Integer;
  port:SmallInt;
begin
  Result:=true;
//ADS_FS_MULTICAST_ONLY (0x01): Perform only the initial portion of the enumeration process. The list of servers is gathered via multicast over UDP. The only information returned is the IP address and port number. If the server is v10 or greater, the server name will also be returned.
//ADS_FS_CONNECT_ALL (0x02):  Attempt to connect to all server addresses discovered by the multicast operation. This may include addresses that are not reachable through a normal connect call (e.g., an address that is local to the machine and cannot be reached from the network). If there are a large number of addresses returned, this may result in very slow performance from the API due to timeout delays on each connect attempt.
//If no options are provided (e.g., ADS_DEFAULT or 0 is specified), the default behavior is to attempt to connect to addresses that are the same as the multicast response address. One situation in which this might not gather all desired information is if, for example, Advantage Database Server is bound to one address on a multihomed machine and the multicast response is returned from a different address. In this situation, it would be necessary to use the ADS_FS_CONNECT_ALL option.
  ulRet := AdsFindServers( nType {ADS_DEFAULT}, @hTable );
  ss:='сервер не найден';
  if (ulRet=AE_SUCCESS ) then begin
    ss:=padrstr('IP adres',20,' ')+padrstr('Port',10,' ')+padrstr('Server Name',20,' ')+padrstr('Version',15,' ')+#13#10;
    ss:=ss+stringOfChar('-',65)+#13#10;
    AdsGotoTop( hTable );
    AdsAtEof( hTable, @usIsEOF );
    n:=0;
    while usIsEOF=0 do begin
//        StrPLCopy( 'Multicast Addr', AnsiString( strFieldName ), ADS_MAX_FIELD_NAME );
      //utilStrPLCopy( acFieldName, AnsiString( strFieldName ), ADS_MAX_FIELD_NAME );
//      AdsGetShort  AdsGetLong    AdsGetField
//'Server Name'  'Version'

       AdsGetShort(hTable,'Port',@port);

       AdsGetDataLength( hTable, 'IP Addr', ADS_BYTE_LENGTH, @ulLen );
       pcField:=PAnsiChar( StrAlloc( ulLen ) );
       AdsGetString( hTable, 'IP Addr', pcField, @ulLen, ADS_RTRIM);
       s:=StrPas(pcField);
       ss:=ss+padrstr(s,20,' ')+padrstr(inttostr(port),10,' ');

       AdsGetDataLength( hTable, 'Server Name', ADS_BYTE_LENGTH, @ulLen );
       pcField:=PAnsiChar( StrAlloc( ulLen ) );
       AdsGetString( hTable, 'Server Name', pcField, @ulLen, ADS_RTRIM);
       s:=StrPas(pcField);
       ss:=ss+padrstr(s,20,' ');

       AdsGetDataLength( hTable, 'Version', ADS_BYTE_LENGTH, @ulLen );
       pcField:=PAnsiChar( StrAlloc( ulLen ) );
       AdsGetString( hTable, 'Version', pcField, @ulLen, ADS_RTRIM);
       s:=StrPas(pcField);
       ss:=ss+padrstr(s,15,' ');

       ss:=ss+#13#10;
      inc(n,1);
      AdsSkip(hTable,1);
      AdsAtEof( hTable, @usIsEOF );
    end;
//    ss:=ss+' ip:2222222'+', port:55555'+#13#10;
    writeln(ss);
//    showmessage(inttostr(n)+'  '+ss);

    // connect to current working directory
    ulRet := AdsConnect60( '.', ADS_LOCAL_SERVER, nil, nil,
                          ADS_DEFAULT, @hConn );
    if ( ulRet = AE_SUCCESS ) then begin
      ulRet := AdsCopyTable( hTable, ADS_IGNOREFILTERS,'findads.adt' );
      AdsDisconnect( hConn );
    end;
  end;
  ulRet := AdsCloseTable( hTable );
end;
//=======================================================================================================================================
begin
  if ParamCount<=1 then begin
    if ParamCount=0 then begin
      i:=0;
    end else begin
      i:=StrToIntDef(ParamStr(1),0);
      if (i<0) or (i>2)
        then i:=0;
    end;
    FindServers(i);
    readln;
    exit;
  end;
//  Conn := TAdsConnection.Create(nil);
  ini  := TIniFile.Create(ExtractFilePath(ParamStr(0))+'SysParams.ini');
  strPath := ini.ReadString('PATH','CONNECT','');
  if Length(strPath)=0 then strPath:='DATA';
  if not IsFullPath(strPath) then begin
    strPath := CheckSleshN(ExtractFilePath(ParamStr(0)))+strPath;
  end;
  s := Ini.ReadString('ADMIN','SERVERTYPES', 'LOCAL');
  ini.Free;
  arr := StrToArr(s,',',true);
  nType := 0;
  for i:=Low(arr) to High(arr) do begin
    s := ANSIUpperCase(Trim(arr[i]));
    if s = 'LOCAL' then begin
      nType := nType + ADS_LOCAL_SERVER;
    end else if s = 'REMOTE' then begin
      nType := nType + ADS_REMOTE_SERVER;
    end else if s = 'INTERNET' then begin
      nType := nType + ADS_AIS_SERVER;
    end;
  end;
  h:=0;
  nCode := AdsConnect60(PChar(strPath), nType, PChar(ParamStr(1)), PChar(ParamStr(2)), ADS_DEFAULT, @h);
  ExitCode := nCode;
  if nCode = AE_SUCCESS then begin
    if ParamStr(3)<>'' then begin
      hTable := 0;
      ulRetVal := AdsOpenTable( h, PChar(ParamStr(3)), nil, ADS_DEFAULT,
                ADS_ANSI, ADS_PROPRIETARY_LOCKING, ADS_CHECKRIGHTS,
                ADS_EXCLUSIVE, @hTable );
      if ( ulRetVal <> AE_SUCCESS ) then begin
        ExitCode := 9999;
      end else begin
        AdsCloseTable(hTable);
      end;
    end;
  end;
  if nCode = 0 then begin
    AdsDisconnect(h);
  end;
  if ParamCount > 3 then begin
    WriteLn(s+':  '+IntToStr(ExitCode));
  end;
//  ini  := TIniFile.Create('SysParams.ini');
//  Conn.Free;
end.
