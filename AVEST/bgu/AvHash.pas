unit AvHash;

interface

uses
  Windows, SysUtils, Classes, wcrypt2;

type
  AVCrypt_BLOB = record
    cData: dword;
    pcData: PByteArray;
  end;
  TProvKind = (pkAv_421 = 421, pkAv_422 = 422, pkAv_423 = 423, pkAv_424 = 424);
const
  ProvName_421: Ansistring = 'Avest CSP Base';
  ProvName_422: Ansistring = 'Avest Bel';
  ProvName_423: Ansistring = 'Avest Bel Pro';
  ProvName_424: Ansistring = 'Avest Bign';
  NewLine: string = #13#10;

var

  AvInit_Vector: array[0..31] of byte =
  (
    $41, $41, $41, $41, $41, $41, $41, $41,
    $41, $41, $41, $41, $41, $41, $41, $41,
    $41, $41, $41, $41, $41, $41, $41, $41,
    $41, $41, $41, $41, $41, $41, $41, $41
  );
function GetStreamAvHash(const InpStream: TMemoryStream; out HashStr, ErrStr:
    string): boolean;

function GetFileAvHash(const InpFile: String; out HashStr, ErrStr:
    string): boolean;

implementation

function ErrToStr(e: int64): string;
begin
  case e of
    ERROR_BUSY:
      ErrToStr := 'ERROR_BUSY';
    ERROR_CALL_NOT_IMPLEMENTED:
      ErrToStr := 'ERROR_CALL_NOT_IMPLEMENTED';
    ERROR_INVALID_HANDLE:
      ErrToStr := 'ERROR_INVALID_HANDLE';
    ERROR_INVALID_PARAMETER:
      ErrToStr := 'ERROR_INVALID_PARAMETER';
    ERROR_MORE_DATA:
      ErrToStr := 'ERROR_MORE_DATA';
    ERROR_NO_MORE_ITEMS:
      ErrToStr := 'ERROR_NO_MORE_ITEMS';
    ERROR_NOT_ENOUGH_MEMORY:
      ErrToStr := 'ERROR_NOT_ENOUGH_MEMORY';
    NTE_BAD_ALGID:
      ErrToStr := 'NTE_BAD_ALGID';
    NTE_BAD_DATA:
      ErrToStr := 'NTE_BAD_DATA';
    NTE_BAD_FLAGS:
      ErrToStr := 'NTE_BAD_FLAGS';
    NTE_BAD_HASH:
      ErrToStr := 'NTE_BAD_HASH';
    NTE_BAD_HASH_STATE:
      ErrToStr := 'NTE_BAD_HASH_STATE';
    NTE_BAD_KEY:
      ErrToStr := 'NTE_BAD_KEY';
    NTE_BAD_KEYSET:
      ErrToStr := 'NTE_BAD_KEYSET';
    NTE_BAD_KEYSET_PARAM:
      ErrToStr := 'NTE_BAD_KEYSET_PARAM';
    NTE_BAD_LEN:
      ErrToStr := 'NTE_BAD_LEN';
    NTE_BAD_PROV_TYPE:
      ErrToStr := 'NTE_BAD_PROV_TYPE';
    NTE_BAD_PUBLIC_KEY:
      ErrToStr := 'NTE_BAD_PUBLIC_KEY';
    NTE_BAD_SIGNATURE:
      ErrToStr := 'NTE_BAD_SIGNATURE';
    NTE_BAD_TYPE:
      ErrToStr := 'NTE_BAD_TYPE';
    NTE_BAD_UID:
      ErrToStr := 'NTE_BAD_UID';
    NTE_DOUBLE_ENCRYPT:
      ErrToStr := 'NTE_DOUBLE_ENCRYPT';
    NTE_EXISTS:
      ErrToStr := 'NTE_EXISTS';
    NTE_FAIL:
      ErrToStr := 'NTE_FAIL';
    NTE_KEYSET_ENTRY_BAD:
      ErrToStr := 'NTE_KEYSET_ENTRY_BAD';
    NTE_KEYSET_NOT_DEF:
      ErrToStr := 'NTE_KEYSET_NOT_DEF';
    NTE_NO_KEY:
      ErrToStr := 'NTE_NO_KEY';
    NTE_NO_MEMORY:
      ErrToStr := 'NTE_NO_MEMORY';
    NTE_PROV_DLL_NOT_FOUND:
      ErrToStr := 'NTE_PROV_DLL_NOT_FOUND';
    NTE_PROV_TYPE_ENTRY_BAD:
      ErrToStr := 'NTE_PROV_TYPE_ENTRY_BAD';
    NTE_PROV_TYPE_NO_MATCH:
      ErrToStr := 'NTE_PROV_TYPE_NO_MATCH';
    NTE_PROV_TYPE_NOT_DEF:
      ErrToStr := 'NTE_PROV_TYPE_NOT_DEF';
    NTE_PROVIDER_DLL_FAIL:
      ErrToStr := 'NTE_PROVIDER_DLL_FAIL';
    NTE_SIGNATURE_FILE_BAD:
      ErrToStr := 'NTE_SIGNATURE_FILE_BAD';
  else
    ErrToStr := 'Неизвестная ошибка (' + IntToStr(e) + ')';
  end;
end;

function BinToStr(const bin: array of byte): string;
var
  I: Integer;
begin
  for I := 0 to SizeOf(Bin) - 1 do  // выводим хеш
    Result := Result + Format('%2.2x', [Ord(bin[I])]);
end;

function InitCryptoProvaider(var hProv: HCRYPTPROV; const ProvKind: TProvKind; out ErrStr: string): boolean;
begin
  if not CryptAcquireContextA(@hProv, nil, nil, Integer(ProvKind), CRYPT_VERIFYCONTEXT) then
  begin
    ErrStr := ErrToStr(GetLastError);
    Exit(False);
  end
  else
    Result := True;
end;

function GetFileAvHash(const InpFile: String; out HashStr, ErrStr:
    string): boolean;
var
  FStr: TFileStream;
  MStr: TMemoryStream;
begin
  FStr := TFileStream.Create(InpFile, fmOpenRead or fmShareDenyNone);
  try
    MStr := TMemoryStream.Create;
    try
      MStr.LoadFromStream(Fstr);
      Result := GetStreamAvHash(MStr, HashStr, ErrStr);
    finally
      MStr.Free;
    end;
  finally
    FStr.Free;
  end;
end;

function GetStreamAvHash(const InpStream: TMemoryStream; out HashStr, ErrStr:
    string): boolean;
var
  hProv: HCRYPTPROV;
  hHash: HCRYPTHASH;
  ResCount: DWORD;
  ResSize: DWORD;
  uBLOB: AVCrypt_BLOB;
  BuffRes: array of byte;
begin
  if not (InitCryptoProvaider(hProv, pkAv_421, ErrStr) or InitCryptoProvaider(hProv, pkAv_422, ErrStr)
            or InitCryptoProvaider(hProv, pkAv_423, ErrStr) or InitCryptoProvaider(hProv, pkAv_424, ErrStr))then
  begin
    ErrStr := 'Ошибка инициализации криптопровайдера Авест. Возможно не установлен, либо установлен не корректно.' + NewLine
      + ErrToStr(GetLastError);
    Exit(False);
  end;
  try
    if not CryptCreateHash(hProv, CALG_BHF, 0, 0, @hHash) then
    begin
      ErrStr := 'Ошибка инициализации алгоритма хэширования СТБ 1176.1-99.' + NewLine
        + ErrToStr(GetLastError);
      Exit(False);
    end;
    try
      uBLOB.cData := 32;
      uBLOB.pcData := @AvInit_Vector;
      if not (CryptSetHashParam(hHash, 1001, @uBlob, 0)) then
      begin
        ErrStr := 'Ошибка установки задающего вектора.' + NewLine
          + ErrToStr(GetLastError);
        Exit(False);
      end;
      // MakeHash
      if not CryptHashData(hHash, InpStream.Memory, InpStream.Size, 0) then
      begin
        ErrStr := 'Ошибка вычисления хэша массива данных.' + NewLine
          + ErrToStr(GetLastError);
        Exit(False);
      end;
      // Получаем результат вычисления хэша
      ResCount := Sizeof(DWord);
      if not CryptGetHashParam(hHash, HP_HASHSIZE, @ResSize, @ResCount, 0) then
      begin
        ErrStr := 'Ошибка получения размера вычисленного хэша.' + NewLine
          + ErrToStr(GetLastError);
        Exit(False);
      end;
      SetLength(BuffRes, ResSize);
      try
        if not CryptGetHashParam(hHash, HP_HASHVAL, @BuffRes[0], @ResSize, 0) then
        begin
          ErrStr := 'Ошибка получения вычисленного хэша.' + NewLine
            + ErrToStr(GetLastError);
          Exit(False);
        end;
        HashStr := BinToStr(BuffRes);
        Result := True;
      finally
        SetLength(BuffRes, 0);
      end;
    finally
      CryptDestroyHash(hHash);
    end;
  finally
    CryptReleaseContext(hProv, 0);
  end;
end;

end.
