unit uAddKey;

interface

uses Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants,
     adsset, adstable, Db, adsdata, adsfunc, adscnnct,
     dbFunc, FuncPr, kbmMemTable, SasaIniFile, FileCtrl, adsdictionary;

function CheckAddKey( strSearch : String ) : Boolean;
function CheckAddKeyEx( strType:String; strSearch : String ) : Boolean;

implementation

uses dBase;

//-----------------------------------------------------
// ищет ключ по 4 и 7 знакам
function CheckAddKeyEx( strType:String; strSearch : String ) : Boolean;
var
  s : String;
begin
  Result := false;
  if (strSearch<>'') then begin
    if Copy(strSearch,1,1)='S' then begin
      if Copy(strSearch,2,1)<>'' then begin
        // 'S1234'
        s := Copy(strSearch,1,5);   // найдем район
        dmBase.WorkQueryS.SQL.Text:='select top 1 * from addid where system='+QStr(strType)+' and id='+QStr(s);
        dmBase.WorkQueryS.Open;
        if dmBase.WorkQueryS.FieldByName('SYSTEM').AsString<>'' then Result:=true;
        dmBase.WorkQueryS.Close;
        if not Result then begin
          // 'S1234834'
          s := Copy(strSearch,1,8);   // найдем район
          dmBase.WorkQueryS.SQL.Text:='select top 1 * from addid where system='+QStr(strType)+' and id='+QStr(s);
          dmBase.WorkQueryS.Open;
          if dmBase.WorkQueryS.FieldByName('SYSTEM').AsString<>'' then Result:=true;
          dmBase.WorkQueryS.Close;
        end;
      end;
    end else begin
      if strSearch<>'' then begin
        // 3474644
        dmBase.WorkQueryS.SQL.Text:='select top 1 * from addid where system='+QStr(strType)+' and id='+QStr(strSearch);
        dmBase.WorkQueryS.Open;
        if dmBase.WorkQueryS.FieldByName('SYSTEM').AsString<>'' then Result:=true;
        dmBase.WorkQueryS.Close;
      end;
    end;
  end;
end;

//-----------------------------------------------------
// ищет ключ по 4 и 7 знакам
function CheckAddKey( strSearch : String ) : Boolean;
var
  conn : TAdsConnection;
  tb : TAdsTable;
  strFile,s : String;
begin
  Result := false;
  strFile := NameFromExe('addkey.adt');
  if FileExists(strFile) and (strSearch<>'') then begin
    conn := TAdsConnection.Create(nil);
    conn.Name := 'ConnectAddKey';
    conn.ConnectPath := ExtractFilePath(Application.ExeName);
    conn.AdsServerTypes := [stADS_LOCAL];
    conn.IsConnected := true;
    tb := TAdsTable.Create(nil);
    tb.TableName := 'addkey.adt';
    tb.TableType := ttAdsADT;
    tb.DatabaseName := conn.Name;
    tb.AdsTableOptions.AdsCharType:=ANSI;
    tb.Exclusive := false;
    tb.EncryptionPassword := 'myfirstlove';
    tb.Open;
    s := Copy(strSearch,1,4);   // найдем район
    if tb.Locate('ID', s, []) then begin
      Result := true;
    end else begin
      s := Copy(strSearch,1,7); // найдем Сельский Совет
      if tb.Locate('ID', s, []) then begin
        Result := true;
      end;
    end;
    tb.Close;
    tb.Free;
    conn.Free;
  end;
end;

//-----------------------------------------------------
// ищет ключ по 4 и 7 знакам
function CheckCloseKey( strVer:String; strSys:String; strSearch : String; var strErr:String) : Boolean;
var
  conn : TAdsConnection;
  tb : TAdsTable;
  strFile,s : String;
  lErr:Boolean;
begin
  Result:=false;
  strFile:=NameFromExe('addkey.adt');
  strErr:='';
  if FileExists(strFile) and (strSearch<>'') then begin
    lErr:=false;
    conn := TAdsConnection.Create(nil);
    conn.Name := 'ConnectAddKey';
    conn.ConnectPath := ExtractFilePath(Application.ExeName);
    conn.AdsServerTypes := [stADS_LOCAL];
    conn.IsConnected := true;
    tb := TAdsTable.Create(nil);
    tb.TableName := 'addkey.adt';
    tb.TableType := ttAdsADT;
    tb.DatabaseName := conn.Name;
    tb.AdsTableOptions.AdsCharType:=ANSI;
    tb.Exclusive := false;
    tb.EncryptionPassword := 'myfirstlove';
    try
      tb.Open;
    except
      lErr:=true;
    end;
    s := Copy(strSearch,1,4);   // найдем район
    if tb.Locate('SYSTEM;ID', VarArrayOf(['VERSION',strVer]), []) then begin  // найдем версию
      if not tb.Locate('SYSTEM;ID', VarArrayOf([strSys,strSearch]), []) then begin
        Result := true;
      end;
    end else begin
      strErr:='Файл дополнительных ключей несоответствующей версии';
    end;
    if not lErr then begin
      tb.Close;
    end;  
    tb.Free;
    conn.Free;
  end else begin
    strErr:='Не найден файл дополнительных ключей';
  end;
end;

begin

end.
