unit OLEUtils;

interface

  uses ComObj, Windows, ActiveX, SysUtils;

  procedure OpenDocWord( strFile : String );

implementation

procedure OpenDocWord( strFile : String );
var
  WordAppl : Variant;
  DocName  : string;
  strPath  : String;
  lOk : Boolean;
begin
 if strFile<>'' then
 begin
//    CoInitialize(nil);
    strPath := ExtractFilePath(ParamStr(0));
    if Pos('\', strFile)=0 
      then  DocName := strPath+strFile
      else  DocName := strFile;
    lOk:=true;
    try
      WordAppl := GetActiveOleObject('Word.Application');
    except
      try
        WordAppl := CreateOleObject('Word.Application');
      except
        lOk:=false;
      end;
    end;
    if lOk then begin
      WordAppl.Visible := true;
      WordAppl.Application.Documents.Open(DocName); //,False,False,False,'','',False,'','',wdOpenFormatAuto);
      WordAppl.Activate;
    end;
//    CoUninitialize;
 end;
end;

initialization

end.
