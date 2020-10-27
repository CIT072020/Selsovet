unit CryptoHash;

interface

uses windows, wcrypt2;

function StringToMD5Hash(ASource: String; AlgID: NativeUInt = CALG_MD5): string;

implementation

uses classes, sysutils;

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

function StringToMD5Hash(ASource: String; AlgID: NativeUInt = CALG_MD5): string;
const
  NewLine: string = #13#10;
var
  hProv: HCRYPTPROV;
  hHash: HCRYPTHASH;
  ResCount: DWORD;
  ResSize: DWORD;
  ErrStr: string;
  InpStream: TStringStream;
  BuffRes: array of byte;
begin
  if not CryptAcquireContextA(@hProv, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT) then
  begin
    if (GetLastError() = Cardinal(NTE_BAD_KEYSET)) then
      if not CryptAcquireContextA(@hProv, nil, nil, PROV_DSS_DH, CRYPT_NEWKEYSET) then
      begin
        ErrStr := 'Ошибка инициализации криптопровайдера. Возможно не установлен, либо установлен не корректно.' + NewLine
          + ErrToStr(GetLastError);
        raise Exception.Create(ErrStr);
      end;
  end;
  InpStream := TStringStream.Create;
  InpStream.WriteString(ASource);
  try
    try
     if not CryptCreateHash(hProv, CALG_MD5, 0, 0, @hHash) then
      begin
        ErrStr := 'Ошибка инициализации алгоритма хэширования MD5.' + NewLine
          + ErrToStr(GetLastError);
        raise Exception.Create(ErrStr);
      end;
      try
        if not CryptHashData(hHash, InpStream.Memory, InpStream.Size, 0) then
        begin
          ErrStr := 'Ошибка вычисления хэша массива данных.' + NewLine
            + ErrToStr(GetLastError);
          raise Exception.Create(ErrStr);
        end;
      // Получаем результат вычисления хэша
      ResCount := Sizeof(DWord);
      if not CryptGetHashParam(hHash, HP_HASHSIZE, @ResSize, @ResCount, 0) then
      begin
        ErrStr := 'Ошибка получения размера вычисленного хэша.' + NewLine
          + ErrToStr(GetLastError);
        raise Exception.Create(ErrStr);
      end;
        SetLength(BuffRes, ResSize);
        try
          if not CryptGetHashParam(hHash, HP_HASHVAL, @BuffRes[0], @ResSize, 0) then
          begin
            ErrStr := 'Ошибка получения вычисленного хэша.' + NewLine
              + ErrToStr(GetLastError);
            raise Exception.Create(ErrStr);
          end;
          Result := BinToStr(BuffRes);
        finally
          SetLength(BuffRes, 0);
        end;
      finally
        CryptDestroyHash(hHash);
      end;
    finally
      CryptReleaseContext(hProv, 0);
    end;
  finally
    InpStream.Free;
  end;
end;

end.
