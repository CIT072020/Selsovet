unit uDate;

interface

uses SysUtils;

function GetDaysPropis( d : TDateTime; strLang : String ) : String;
function GetMonthPropis( d : TDateTime; strLang : String ) : String;
function GetYearPropis( d : TDateTime; strLang : String ) : String;
function GetDatePropis( d : TDateTime; strLang : String; nTypeDate : Integer ) : String;

const

 NameM : array [1..2,1..12] of String =
     (
       ('������','�������','�����','������','���','����','����',
         '�������','��������','�������','������','�������'),
       ('��������','������','�����i��','������i��','���','�������','�i����',
        '��i���','�������','��������i��','�ic������','������')
     );

 NameM1 : array [1..2,1..12] of String =
     (
       ('������','�������','����','������','���','����','����',
         '������','��������','�������','������','�������'),
       ('��������','����','�����i�','������i�','���','�������','�i����',
        '��i����','��������','��������i�','�ic�����','�������')
     );


implementation

const
 NameD : array [1..2,1..19] of String =
    (
     ( '�������', '�������', '��������', '���������', '������', '�������',
       '��������','��������','��������','��������','�������������','������������',
       '������������','��������������','������������','�������������','������������',
       '��������������','��������������' ),
     ( '�������','�������','�������','���������','������','�������',
       '�����','��������','���������','���������','���i���������','������������',
       '������������','��������������','������������','������������','������������',
       '��������������','���������������' )
    );
 NameD1 : array [1..2,1..19] of String =
    (
     ( '������', '������', '������', '��������', '�����', '������',
       '�������','�������','�������','�������','������������','�����������',
       '�����������','�������������','�����������','������������','�����������',
       '�������������','�������������' ),
     ( '�����','����i','����i','�������','����','�����',
       '���','������','�������','�������','���i�������','����������',
       '����������','������������','����������','����������','����������',
       '������������','�������������' )
    );

 NameDAdd : array [1..2,1..4] of String =
        (
            ('����������','����������','��������','��������'),
            ('����������','����������','��������','��������')
        );

//---------------------------------------------------
function GetDaysPropis( d : TDateTime; strLang : String ) : String;
var
  nYear,nMonth,nDay : Word;
  n : Integer;
begin
  strLang := Copy(ANSIUpperCase(strLang),1,1);
  if (strLang = 'B') or (strLang = '�') then n := 2 else n := 1;
  DecodeDate(d,nYear,nMonth,nDay);
  case nDay of
    1..19 : Result := NameD[n,nDay];
    20    : Result := NameDAdd[n,1];
    21..29: Result := NameDAdd[n,3]+' '+NameD[n,StrToInt(Copy(IntToStr(nDay),2,1))];
    30    : Result := NameDAdd[n,2];
    31    : Result := NameDAdd[n,4]+' '+NameD[n,StrToInt(Copy(IntToStr(nDay),2,1))];
  end;
end;

//----------------------------------------------------
function GetMonthPropis( d : TDateTime; strLang : String ) : String;
var
  nYear,nMonth,nDay : Word;
  n : Integer;
begin
  strLang := Copy(ANSIUpperCase(strLang),1,1);
  if (strLang = 'B') or (strLang = '�') then n := 2 else n := 1;
  DecodeDate(d,nYear,nMonth,nDay);
  Result := NameM[n,nMonth];
end;

//----------------------------------------------------
function GetMonthPropis2( d : TDateTime; strLang : String ) : String;
var
  nYear,nMonth,nDay : Word;
  n : Integer;
begin
  strLang := Copy(ANSIUpperCase(strLang),1,1);
  if (strLang = 'B') or (strLang = '�') then n := 2 else n := 1;
  DecodeDate(d,nYear,nMonth,nDay);
  Result := NameM1[n,nMonth];
end;

const
  NameTisOne : array [1..2,1..2] of String =
        (('���������','�������������'),('���������','�������������'));

  NameTis : array [1..2,1..2] of String =
        (('������','��� ������'),('������','���� ������'));

  NameSotOne : array [1..2,1..9] of String =  (
   ('������','����������','���������','������������','����������','�����������',
    '����������','������������','������������'),
   ('������','����������','��o�������','�������������','���i������','����i������',
    '���i������','�����i������','������i������')
                                              );
  NameSot : array [1..2,1..9] of String =  (
   ('���','������','������','���������','�������','��������','�������','���������','���������'),
   ('���','�������','������','���������','�������','��������','������','��������','����������')
                                              );
  NameDesOne : array [1..2,1..9] of String =  (
   ('��������','����������','����������','����������','������������','�������������',
    '������������','��������������','�����������'),
   ('���������','����������','����������','����������','���i���������','����i���������',
    '���i���������','�����i���������','������������')
   );
  NameDes : array [1..2,1..9] of String =  (
   ('','��������','��������','�����','���������','����������','���������','�����������','���������'),
   ('','��������','��������','�����','����������','�����������','���������','�����������','����������')

                                              );
//-------------------------------------------------------
function GetYearPropisEx( d : TDateTime; strLang : String; strPadeg : String ) : String;
var
  nYear,nMonth,nDay : Word;
  n, nTis, nSot, nDes, nEd,nn : Integer;
  strYear : String;
  function CheckPadeg(s : String; nCount : Integer) : String;
  begin
    if strPadeg='�' then Result := Copy(s,1,Length(s)-nCount) + '��'
                    else Result := s;
  end;
begin
  strLang := Copy(ANSIUpperCase(strLang),1,1);
  if (strLang = 'B') or (strLang = '�') then n := 2 else n := 1;
  DecodeDate(d,nYear,nMonth,nDay);
  strYear := IntToStr(nYear);
  nTis := StrToInt(Copy(strYear,1,1));
  if (nTis<1) or (nTis>2) then begin
    Result := strYear;
    exit;
  end;
  if Copy(strYear,2,3) = '000' then begin  // 1000 ��� 2000
    Result := CheckPadeg(NameTisOne[n,nTis],3);
    exit;
  end else begin
    Result := NameTis[n,nTis];
  end;
  nSot := StrToInt(Copy(strYear,2,1));
  if Copy(strYear,3,2) = '00' then begin  // 1900 ��� 2100
    Result := Result + ' ' + CheckPadeg(NameSotOne[n,nSot],3);
    exit;
  end else begin
    if nSot > 0 then begin
      Result := Result + ' ' + NameSot[n,nSot];
    end;
  end;
  nDes := StrToInt(Copy(strYear,3,1));
  nn   := StrToInt(Copy(strYear,3,2));
  nEd  := StrToInt(Copy(strYear,4,1));
  if (nn>0) and (nn<20) then begin
    if strPadeg='�' then Result := Result + ' ' + NameD1[n,nn]
                    else Result := Result + ' ' + NameD[n,nn];
  end else begin
    if nEd = 0 then begin
      Result := Result + ' ' + CheckPadeg(NameDesOne[n,nDes],3);
    end else begin
      if strPadeg='�' then Result := Result + ' ' + NameDes[n,nDes]+' '+NameD1[n,nEd]
                      else Result := Result + ' ' + NameDes[n,nDes]+' '+NameD[n,nEd];
    end;
  end;
end;

//-------------------------------------------------------
function GetYearPropis( d : TDateTime; strLang : String ) : String;
begin
  Result := GetYearPropisEx( d, strLang, '�');
end;

//-------------------------------------------------------
function GetDatePropis( d : TDateTime; strLang : String; nTypeDate : Integer ) : String;
begin
  if nTypeDate = 1 then begin  // ������ ���
    Result := GetYearPropisEx(d,strLang,'�')+' ���';
  end else if nTypeDate = 2 then begin  // ������ ��� � �����
    Result := GetMonthPropis2(d,strLang)+' '+GetYearPropis(d,strLang)+' ����';
  end else begin
    Result := GetDaysPropis(d,strLang)+' '+GetMonthPropis(d,strLang)+' '+GetYearPropis(d,strLang)+' ����';
  end;
end;
end.
