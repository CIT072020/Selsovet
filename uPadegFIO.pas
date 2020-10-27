
unit uPadegFIO;

interface

uses Windows, SysUtils, fEditPadegExceptions;

type

//  TGetFIOPadeg = function(pLastName, pFirstName, pMiddleName: PChar;
//                       bSex: Boolean; nPadeg: LongInt; pResult: PChar;
//                       var nLen: LongInt): Integer;
  TGetFIO =  function(pLastName, pFirstName, pMiddleName: ShortString;
                cSex: Char; nPadeg: LongInt): ShortString; stdcall;
  TGetFIOFromStr =  function(pFIO: ShortString; cSex: Char;
                nPadeg: LongInt): ShortString; stdcall;
  TGetIF = function (pFirstName, pLastName: ShortString; cSex: Char;
                nPadeg: LongInt): ShortString; stdcall;
  TGetNominative = function(pFIO: ShortString): ShortString; stdcall;

//function GetDaysPropis( d : TDateTime; strLang : String ) : String;
  function IsLoadPadegDLL : Boolean;
  function GetPadegFIO( strFIO : String; cPol : String; cPadeg : String) : String;
  function GetPadegIF( strFirstName, strLastName : String; cPol : String; cPadeg : String) : String;
  function GetPadegFIO3( strFamilia, strFirstName, strLastName : String; cPol : String; cPadeg : String) : String;
  function GetPadegNominative( strFIO : String) : String;
  procedure EditExceptionsPadeg;

implementation

var
  lLoadLib : Boolean;
  hndDLLHandle : THandle;
  GetFIO : TGetFIO;
  GetFIOFromStr : TGetFIOFromStr;
  GetIF : TGetIF;
  GetNominative : TGetNominative;

//------------------------------------------------------------------------
function IsLoadPadegDLL : Boolean;
begin
  Result := lLoadLib;
end;

function CreatePadeg( cPadeg : String ) : Integer;
begin
  cPadeg := Trim(ANSIUpperCase(cPadeg));
  if cPadeg = 'Р' then begin
    Result := 2;
  end else if cPadeg = 'Д' then begin
    Result := 3;
  end else if cPadeg = 'В' then begin
    Result := 4;
  end else if cPadeg = 'Т' then begin
    Result := 5;
  end else if cPadeg = 'П' then begin
    Result := 6;
  end else begin
    Result := 1;
  end;
end;
//------------------------------------------------------------------------
function GetPadegFIO( strFIO : String; cPol : String; cPadeg : String) : String;
var
  i,n,m : Integer;
  s1,s2,s3,s : String;
begin
  if lLoadLib then begin
//    c := ANSILowerCase(cPol)
//    n := CreatePadeg(cPadeg);
//    c := ANSILowerCase(cPol)[1];
    cpol:=ANSILowerCase(copy(cpol,1,1));
    if cpol='' then cpol:='м';
    if Pos('~',strFIO)=0 then begin
      if (Trim(strFIO)<>'') and (Trim(cPol)<>'') then begin
        n:=Pos('(',strFIO);
        m:=Pos(')',strFIO);
        if (n>0) and (m>0) and (m>n) then begin
          s:=Copy(strFIO,m+1,Length(strFIO));
          strFIO:=Copy(strFIO,1,n-1)+s;
        end;
        Result := GetFIOFromStr(ShortString(strFIO), cPol[1], CreatePadeg(cPadeg));
      end else begin
        Result := strFIO;
      end;
    end else begin
      i:=Pos('~',strFIO);
      s1:=Copy(strFIO,1,i-1);
      strFIO:=Copy(strFIO,i+1,Length(strFIO));
      i:=Pos('~',strFIO);
      s2:=Copy(strFIO,1,i-1);
      s3:=Copy(strFIO,i+1,Length(strFIO));
      Result:=GetPadegFIO3( s1,s2,s3, cPol, cPadeg);
    end;
  end else begin
    if Pos('~',strFIO)>0 then begin
      strFIO:=StringReplace(strFIO, '~', ' ', [rfReplaceAll]);
    end;
    Result := strFIO;
  end;
end;

function GetPadegFIO3( strFamilia,strFirstName,strLastName : String; cPol : String; cPadeg : String) : String;
begin
  cPol:=ANSILowerCase(copy(cPol,1,1));
  if cPol='' then cPol:='м';
  Result:=GetPadegFIO(strFamilia,cPol,cPadeg)+' '+GetPadegIF(strFirstName,strLastName,cPol,cPadeg);
end;

function GetPadegIF( strFirstName, strLastName : String; cPol : String; cPadeg : String) : String;
begin
  if lLoadLib then begin
    cpol:=ANSILowerCase(copy(cpol,1,1));
    if cpol='' then cpol:='м';
    Result := GetIF(strFirstName, strLastName, cpol[1], CreatePadeg(cPadeg));
  end else begin
    Result := strFirstName+' '+strLastName;
  end;
end;

function GetPadegNominative( strFIO : String) : String;
begin
  if lLoadLib then begin
    Result := GetNominative(strFIO);
  end else begin
    Result := strFIO;
  end;
end;

procedure EditExceptionsPadeg;
begin
  EditExceptions;
end;

initialization
  lLoadLib := false;
  try             
    // загружаем dll динамически
    hndDLLHandle := loadLibrary ( 'Padeg.dll' );
    if hndDLLHandle <> 0 then begin
//      @GetFIOPadeg := getProcAddress ( hndDLLHandle, 'GetFIOPadeg' );
      lLoadLib := true;
      @GetFIO := getProcAddress ( hndDLLHandle, 'GetFIO' );
      @GetFIOFromStr := getProcAddress ( hndDLLHandle, 'GetFIOFromStr' );
      @GetIF := getProcAddress ( hndDLLHandle, 'GetIF' );
      @GetNominative := getProcAddress ( hndDLLHandle, 'GetNominative' );
      if addr(GetFIO)=nil then lLoadLib := false;
      if addr(GetFIOFromStr)=nil then lLoadLib := false;
      if addr(GetIF)=nil then lLoadLib := false;
      if addr(GetNominative)=nil then lLoadLib := false;
    end;
  except
  end;

finalization
  if lLoadLib then FreeLibrary( hndDLLHandle );
end.
