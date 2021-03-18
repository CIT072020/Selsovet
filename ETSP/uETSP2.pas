unit uETSP2;

interface

uses Windows,Classes,SysUtils,Forms;

type

  TAttribute=packed record
    pValue:PChar;
	  ulValueLen:Integer;
  end;
  PAttribute=^TAttribute;
  PInt=^Integer;


  TGetSOK = function(nAlg:Integer; PAttribute:Pointer; pPin:PChar):Integer; cdecl; //stdcall;
  TSign   = function(nLenData:Integer; Data:Pointer; nAlg:Integer; nLen:PInt; Value:Pointer; pPin:PChar):Integer; cdecl;
  THash   = function(nLenData:Integer; Data:Pointer; nAlg:Integer; nLen:PInt; Value:Pointer; pPin:PChar):Integer; cdecl;
  TVerify = function(nLenData:Integer; Data:Pointer; nAlg:Integer; nLenSign:Integer; pSing:Pointer; pSok:Pointer; nLenSok:Integer; pPin:PChar):Integer; cdecl;
  TVerify1= function(nLenData:Integer; Data:Pointer; nAlg:Integer; nLenSign:Integer; pSing:Pointer; pPin:PChar):Integer; cdecl;


  TETSP2=class(TObject)
  private
    FNameLib: String;
    FLastError: String;
    GetSOK_ : TGetSOK;
    Sign_:TSign;
    Hash_:TSign;
    Verify_:TVerify;
    Verify1_:TVerify1;
    FActive: Boolean;
    FIsTest: Boolean;
    FInvertSign: Boolean;
    FDebug: Boolean;
    procedure SetLastError(const Value: String);
    procedure SetNameLib(const Value: String);
    procedure CreateForAll;
    procedure SetActive(const Value: Boolean);
    procedure SetIsTest(const Value: Boolean);
    procedure SetInvertSign(const Value: Boolean);
    procedure SetDebug(const Value: Boolean);
  public
    PIN:String;
    SignAlg:Integer;   // текущий алгоритм для SIGN
    SOKAlg:Integer;    // текущий алгоритм для СОК
    HashAlg:Integer;   // текущий алгоритм для Hash
    LengthPIN:Integer; // длина PIN
    DLL: THandle;
    PathError:String;
    slError:TStringList;
    property InvertSign:Boolean read FInvertSign write SetInvertSign;
    property LastError:String read FLastError write SetLastError;
    property NameLib:String read FNameLib write SetNameLib;
    function LoadLib(strNameLib:String):Boolean;
    function StrToFile(sFile: String; Const Str: AnsiString): boolean;
    property Active:Boolean read FActive write SetActive;
    property IsTest:Boolean read FIsTest write SetIsTest;
    property Debug:Boolean read FDebug write SetDebug;
    function GetError(n:Integer):String;
    //-------------------------------------------
    //получение сертификата
    //nAlg=1 - 45
    //nAlg=0 - 76
    function GetSOK:String;
    function Sign(nLenData:Integer; Data:String) : String;
    function Hash(nLenData:Integer; Data:String) : String;
    function Verify(nLenData:Integer; Data:String; sSign:String; sSOK:String) : Integer;
    function Verify1(nLenData:Integer; Data:String; sSign:String) : Integer;

    //-------------------------------------------
    constructor Create(strNameLib:String); overload;
    constructor Create; overload;
    destructor Destroy; override;
  end;

const
  FILL_CHAR=#0;
//  FILL_CHAR='0';
{
//получение сертификата
//alg = 1 - 45
//alg = 0 - 76
//result возвращаемый сертификат
int GetSOK( int alg, struct attribute*  result);
//расчет хэш-значения
//   data_len - длина передаваемых данных
//   data	- данные
//   alg  - 0 - СТБ 1176.1
//	 alg  - 1 - СТБ 34.101.31
//	выходные
//	digest_len - длина хэш-значения
//  pdigest - хэш-значениу
int Hash(int data_len, char * data, int alg, unsigned int* digest_len, char * pdigest);
//подписание данных
//   data_len - длина передаваемых данных
//   data	- данные
//   alg  - 0 - stb11762_sign
//	 	- 1 - stb11762pre_sign
//	 	- 2 - bign_with_hbelt
//	выходные
//	len_sign - длина подписи
//  sign - значение подписи
int Sign(int data_len, char * data, int alg, unsigned int* len_sign, char * sign);
//проверка подписи под данными
//   data_len - длина передаваемых данных
//   data	- данные
//   alg  - 0 - stb11762_sign
//	 	- 1 - stb11762pre_sign
//	 	- 2 - bign_with_hbelt
//	len_sign - длина подписи
//  sign - значение подписи
//  lenSOK - длина буфера сертификата
//  bufSOK - сертификат
int Verify(int data_len, char * data, int alg, int len_sign, char * sign, char *bufSOK, int lenSOK );


}

var
  ETSP2:TETSP2;

implementation

uses StrUtils;
//---------------------------------------------------
procedure TETSP2.CreateForAll;
begin
  PathError:='';
  DLL:=0;
  SignAlg:=2;
  SOKAlg:=1;
  HashAlg:=1;
  FIsTest:=false;
  LengthPIN:=8;
  FInvertSign:=false;
  FDebug:=false;
  slError:=TStringList.Create;
end;
//---------------------------------------------------
constructor TETSP2.Create;
begin
  inherited Create;
  CreateForAll;
end;
//---------------------------------------------------
constructor TETSP2.Create(strNameLib: String);
begin
  inherited Create;
  CreateForAll;
  LoadLib(strNameLib);
//  FIsLoadFunctionList:=false;
end;
//-----------------------------------------------------------------
destructor TETSP2.Destroy;
begin
  inherited;
  slError.Free;
  if DLL<>0
    then FreeLibrary(DLL);
end;
//-----------------------------------------------------
function TETSP2.StrToFile(sFile: String; Const Str: AnsiString): boolean;
var
   hFile :THANDLE;
   dwWriten: DWORD;
//   FileStream: TFileStream;
Begin
  Result := False;
  try
    sFile:=ExtractFilePath(Application.ExeName)+sFile;
    hFile := CreateFile(PChar(sFile), GENERIC_WRITE, 0, Nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
    if (hFile = INVALID_HANDLE_VALUE) then
       Exit;
    if not WriteFile(hFile, Str[1], Length(Str), dwWriten, Nil) Then
       Exit;
    CloseHandle(hFile);
    Result := True;
  except
  end;
End;

//-------------------------------------------------------------
function TETSP2.LoadLib(strNameLib:String):Boolean;
begin
  Result:=true;
  if DLL<>0 then begin
    FreeLibrary(DLL);
  end;
  DLL:=0;
  FLastError:='';
  GetSOK_:=nil;
  Sign_:=nil;
  Hash_:=nil;
  Verify_:=nil;
  Verify1_:=nil;
  FIsTest:=false;
  if strNameLib=''
    then strNameLib:=FNameLib;
  if RightStr(UpperCase(Trim(strNameLib)),4)='TEST' then begin
    FActive:=true;
    FIsTest:=true;
    FNameLib:=strNameLib;
    exit;
  end;
  DLL:=LoadLibrary(PAnsiChar(strNameLib));
  if DLL=0 then begin
    FLastError:=SysErrorMessage(GetLastError);
    Result:=false;
  end else begin
    FNameLib:=strNameLib;
    try
      slError.LoadFromFile(PathError+'ETSPError.txt');
    except      
    end;
    @GetSOK_ := getProcAddress ( DLL, 'GetSOK' );
    if addr(GetSOK_)=nil then FLastError:='Недоступна фукнция "СОК"(GetSOK)';
    @Sign_ := getProcAddress ( DLL, 'Sign' );
    if addr(Sign_)=nil then FLastError:='Недоступна фукнция "Создать ключ"(Sign)';
    @Hash_ := getProcAddress ( DLL, 'Hash' );
    if addr(Hash_)=nil then FLastError:='Недоступна фукнция "Создать ХЭШ"(Hash)';
    {
    @Verify_:= getProcAddress ( DLL, 'Verify' );
    if addr(Verify_)=nil then FLastError:='Недоступна фукнция "Верификация"(Verify)';
    @Verify1_:= getProcAddress ( DLL, 'Verify1' );
    if addr(Verify1_)=nil then FLastError:='Недоступна фукнция "Верификация"(Verify1)';
    }
    if FLastError<>'' then Result:=false;
  end;
  FActive:=Result;
end;
//-----------------------------------------------------------------
procedure TETSP2.SetLastError(const Value: String);
begin
  FLastError := Value;
end;
//-----------------------------------------------------------------
procedure TETSP2.SetNameLib(const Value: String);
begin
  FNameLib := Value;
  LoadLib(FNameLib);
end;

//-----------------------------------------------------------------
function TETSP2.GetSOK: String;
var
  a:TAttribute;
//  c_sok: array[0..1023] of char;
  n,i:Integer;
begin
  if IsTest then begin
    Result:='AAAAAAAAAAAAAA';
    exit;
  end;
  if (DLL>0) and Assigned(GetSOK_) then begin
    FLastError:='';
    a.ulValueLen:=0;
    n:=GetSok_(SOKAlg,@a,PChar(PIN));
    if n=0 then begin
      SetLength(Result,a.ulValueLen);
      for i:=0 to a.ulValueLen-1 do begin
        Result[i+1]:=a.pValue[i]; // c_sok[i];
      end;
    end else begin
      FLastError:='Ошибка вызова функции ZChannel GetSOK ('+GetError(n)+')';
      Result:='';
    end;
  end else begin
    FLastError:='Ошибка вызова функции ZChannel GetSOK';
    Result:='';
  end;
end;

//-----------------------------------------------------------------
function TETSP2.Sign(nLenData:Integer; Data:String) : String;
var
  c_sign: array[0..1023] of char;
  len_sign : LongWord;
  i:Integer;
begin
  if IsTest then begin
    Result:='BBBBBBBBBBBBBB';
    exit;
  end;
  if (DLL>0) and Assigned(Sign_) then begin
    FLastError:='';
    len_sign:=1024;
    FillChar(c_sign,1024,FILL_CHAR);
    i:=1;
    try
      i:=Sign_(nLenData,PChar(Data),SignAlg,@len_sign,@c_sign,PChar(PIN));
    except
      on E: Exception do begin
        FLastError:=E.Message;
      end;
    end;
    if (FLastError='') then begin
      if i=0 then begin
        SetLength(Result,len_sign);
        if FInvertSign then begin
          for i:=len_sign-1 downto 0 do begin
            Result[len_sign-i]:=c_sign[i];
          end;
        end else begin
          for i:=0 to len_sign-1 do begin
            Result[i+1]:=c_sign[i];
          end;
        end;
        if FDebug
          then StrToFile('sign.p7s', Result);
      end else begin
        FLastError:='Ошибка вызова функции ZChannel Sign ('+GetError(i)+')';
        Result:='';
      end;
    end;
  end else begin
    FLastError:='Ошибка вызова функции ZChannel Sign (библиотека не загружена)';
    Result:='';
  end;
end;


//-----------------------------------------------------------------
function TETSP2.Hash(nLenData:Integer; Data:String) : String;
var
  c_sign: array[0..1023] of char;
//  c_data: array[0..1023] of char;
  len_sign : LongWord;
  i:Integer;
begin
  if IsTest then begin
    Result:='HHH';
    exit;
  end;
  if (DLL>0) and Assigned(Hash_) then begin
    FLastError:='';
    len_sign:=1024;
    FillChar(c_sign,1024,FILL_CHAR);
    i:=1;
    try
      i:=Hash_(nLenData,PChar(Data),HashAlg,@len_sign,@c_sign,PChar(PIN));
    except
      on E: Exception do begin
        FLastError:=E.Message;
      end;
    end;
    if (FLastError='') then begin
      if i=0 then begin
        SetLength(Result,len_sign);
        for i:=0 to len_sign-1 do begin
          Result[i+1]:=c_sign[i];
        end;
      end else begin
        FLastError:='Ошибка вызова функции ZChannel Hash ('+GetError(i)+')';
        Result:='';
      end;
    end;
  end else begin
    FLastError:='Ошибка вызова функции ZChannel Hash';
    Result:='';
  end;
end;

//-----------------------------------------------------------------
function TETSP2.Verify(nLenData:Integer; Data:String; sSign:String; sSOK:String) : Integer;
begin
  if (DLL>0) and Assigned(Verify_) then begin
    Result:=-1;
    FLastError:='';
    try
      Result:=Verify_(nLenData,PChar(Data),SignAlg, Length(sSign), PChar(sSign), PChar(sSok), Length(sSok), PChar(PIN));
    except
      on E: Exception do begin
        FLastError:=E.Message;
      end;
    end;
  end else begin
    FLastError:='Ошибка вызова функции ZChannel Verify';
    Result:=-1;
  end;
end;

//-----------------------------------------------------------------
function TETSP2.Verify1(nLenData:Integer; Data:String; sSign:String) : Integer;
begin
  if (DLL>0) and Assigned(Verify_) then begin
    Result:=-1;
    FLastError:='';
    try
      Result:=Verify1_(nLenData,PChar(Data),SignAlg, Length(sSign), PChar(sSign), PChar(PIN));
    except
      on E: Exception do begin
        FLastError:=E.Message;
      end;
    end;
  end else begin
    FLastError:='Ошибка вызова функции ZChannel Verify1';
    Result:=-1;
  end;
end;

procedure TETSP2.SetActive(const Value: Boolean);
begin
  FActive := Value;
end;

procedure TETSP2.SetIsTest(const Value: Boolean);
begin
  FIsTest := Value;
end;

function TETSP2.GetError(n: Integer): String;
var
  s,ss:String;
  i:Integer;
begin
  ss:='';
  if slError.Count>0 then begin
    s:=IntToHex(n,8);
    i:=slError.IndexOfName(s);
    if i>-1 then begin
      ss:=' - '+slError.ValueFromIndex[i];
    end;
  end;
  Result:=IntToStr(n)+ss;
end;

procedure TETSP2.SetInvertSign(const Value: Boolean);
begin
  FInvertSign := Value;
end;

procedure TETSP2.SetDebug(const Value: Boolean);
begin
  FDebug := Value;
end;

initialization
  ETSP2:=nil;
finalization
  if ETSP2<>nil then FreeAndNil(ETSP2);

end.
