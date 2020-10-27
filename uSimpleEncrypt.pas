unit uSimpleEncrypt;

interface

{ **** UBPFD *********** by delphibase.endimus.com ****
>> Шифрование строки

Предназначена для простого шифрование строк и паролей, ключ 96 бит, шифрование
симметричное.

Зависимости: UBPFD.decrypt
Автор:       Anatoly Podgoretsky, anatoly@podgoretsky.com, Johvi
Copyright:   (c) Anatoly Podgoretsky, 1996
Дата:        26 апреля 2002 г.


Пример использования:
if Encrypt(S, StartKey, MultKey, AddKey) <> OriginalPwd then
   ...

Пример использования:
S := 'Ваш старый пароль: <' + Decrypt(S, StartKey, MultKey, AddKey) + '>';


***************************************************** }

function Encrypt(const InString: string; StartKey, MultKey, AddKey: Integer): string;
function Decrypt(const InString: string; StartKey, MultKey, AddKey: Integer):  string;

implementation

//const
//  StartKey = 471; // Start default key
//  MultKey = 62142; // Mult default key
//  AddKey = 11719; // Add default key
//     обязательно смените ключи до использования

function Encrypt(const InString: string; StartKey, MultKey, AddKey: Integer): string;
var
  I: Byte;
  // Если поменять тип переменной I на Integer, то будет возможно
  // шифрование текста длиной более 255 символом - VID.
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
end;

{$R-}
{$Q-}

function Decrypt(const InString: string; StartKey, MultKey, AddKey: Integer):  string;
var
  I: Byte;
  // Если поменять тип переменной I на Integer, то будет возможно
  // шифрование текста длиной более 255 символом - VID.
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
  end;
end;
{$R+}
{$Q+}

