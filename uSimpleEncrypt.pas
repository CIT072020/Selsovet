unit uSimpleEncrypt;

interface

{ **** UBPFD *********** by delphibase.endimus.com ****
>> ���������� ������

������������� ��� �������� ���������� ����� � �������, ���� 96 ���, ����������
������������.

�����������: UBPFD.decrypt
�����:       Anatoly Podgoretsky, anatoly@podgoretsky.com, Johvi
Copyright:   (c) Anatoly Podgoretsky, 1996
����:        26 ������ 2002 �.


������ �������������:
if Encrypt(S, StartKey, MultKey, AddKey) <> OriginalPwd then
   ...

������ �������������:
S := '��� ������ ������: <' + Decrypt(S, StartKey, MultKey, AddKey) + '>';


***************************************************** }

function Encrypt(const InString: string; StartKey, MultKey, AddKey: Integer): string;
function Decrypt(const InString: string; StartKey, MultKey, AddKey: Integer):  string;

implementation

//const
//  StartKey = 471; // Start default key
//  MultKey = 62142; // Mult default key
//  AddKey = 11719; // Add default key
//     ����������� ������� ����� �� �������������

function Encrypt(const InString: string; StartKey, MultKey, AddKey: Integer): string;
var
  I: Byte;
  // ���� �������� ��� ���������� I �� Integer, �� ����� ��������
  // ���������� ������ ������ ����� 255 �������� - VID.
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
  // ���� �������� ��� ���������� I �� Integer, �� ����� ��������
  // ���������� ������ ������ ����� 255 �������� - VID.
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

