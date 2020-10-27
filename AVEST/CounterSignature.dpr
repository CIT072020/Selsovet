program CounterSignature;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, AvCryptMail, Classes, Winapi.Windows;


Function GetErrorInfo(aResult: AvCmResult): AnsiString;
var
    S: AnsiString;
    W: AvCmLong;
begin
  AvCmGetErrorInfo(0, aResult, AVCM_SHORT_STRING, Nil, W, 0);
  SetLength(S, W);
  AvCmGetErrorInfo(0, aResult, AVCM_SHORT_STRING, @S[1], W, 0);
  Result := S;
end;

Procedure CheckAvCryptMailResult(aResult: AvCmResult);
var
    S: AnsiString;
begin
  if aResult <> AVCMR_SUCCESS then begin
     S := GetErrorInfo(aResult);
     raise Exception.Create('������ AvCryptMail: ' + S);
  end
end;

Function FileToStr(aFile: String): AnsiString;
var
    FileRead: TFileStream;
Begin
  FileRead := TFileStream.Create(aFile, fmOpenRead or fmShareDenyNone);
  SetLength(Result, FileRead.Size);
  FileRead.ReadBuffer(Result[1], FileRead.Size);
  FileRead.Free;
End;

Function StrToFile(aFile: String; Const Str: AnsiString): boolean;
var
   hFile :THANDLE;
   dwWriten: DWORD;
   FileStream: TFileStream;
Begin
  Result := False;
  hFile := CreateFile(PChar(aFile), GENERIC_WRITE, 0, Nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (hFile = INVALID_HANDLE_VALUE) then
     Exit;

  if not WriteFile(hFile, Str[1], Length(Str), dwWriten, Nil) Then
     Exit;
  CloseHandle(hFile);
  result := True;
End;


Function GetCertProperty(hCert: AvCmHcert; attr_id: AvCmLong; OID: AnsiString): AnsiString;
var
    attr_param: pointer;
    W: AvCmLong;
Begin
  attr_param := nil;
  if OID <> '' then
     attr_param := @OID[1];
  CheckAvCryptMailResult(AvCmGetCertAttr(hCert, attr_id, attr_param, Nil, W, AVCMF_ATTR_BY_OID));
  // �������� ������ (������ �������� �������� ����� ������ ������� �������� �� 1 ������)
  SetLength(Result, W);
  CheckAvCryptMailResult(AvCmGetCertAttr(hCert, attr_id, attr_param, @Result[1], W, AVCMF_ATTR_BY_OID));
End;




Function FindAddCounterSignature(hSign: AvCmHsign; MyCN: AnsiString; var canSave: boolean): boolean;
var
   CounterSignCount, W, i: AvCmLong;
   hcert: AvCmHcert;
   CertValid: AvCmLong;
   CounterSignValid: AvCmLong;
   hCounterSign: AvCmHsign;
   CN: AnsiString;
Begin
  Result := False;
  // �������� ����������
  CheckAvCryptMailResult(AvCmFindCertBySign(hsign, hcert, 0));
  CN := GetCertProperty(hcert, AVCM_SUBJECT_ATTR, '2.5.4.3');
  Writeln(CN + ' S/N=' + GetCertProperty(hcert, AVCM_SERIAL_AS_STRING, ''));
  try
  // ���������� �������������� ��������
  W := SizeOf(CounterSignCount);
  CheckAvCryptMailResult(AvCmGetSignAttr(hSign, AVCM_COUNTERSIGNATURE_COUNT, Nil, @CounterSignCount, W, 0));
  if (CounterSignCount = 0) then begin
     // �������������� �������� ��� ��� ��������� �������������� �������
     // ��������� ���������������� �����������
     W := SizeOf(CertValid);
     CheckAvCryptMailResult(AvCmGetCertAttr(hcert, AVCM_VALID, Nil, @CertValid, W, 0));
     if CertValid = AVCMR_SUCCESS then begin
        Result := True;
        // ��� ��������� ��� - ���� ����� ������� - ������������ ��� ��� �������������
        // ��� ������� ���������� commonName (2.5.4.3 - ����� ������) �����������
        if CN = MyCN then begin
           Writeln('��� ������������ ����� �������');
        end else begin
           // ���������� ������������ - ����� ������������ ���
           // �������� ����� �������, ������� ������������ � ���� AVCMF_COUNTERSIGNATURE
           // ��� ������������� ��������� ���������� � ��������� ���� AVCMF_ADD_SIGN_CERT
           Writeln('���������� ������������ - ������������ ���');
           CheckAvCryptMailResult(AvCmMsgSign(hSign, AVCMF_COUNTERSIGNATURE));
           canSave := True;
        end;
     end else begin
        Writeln('���������� �� ������������: ' + GetErrorInfo(CertValid));
     end;
  end else begin
     // ��������� �������������� �������
     for i := 0 to CounterSignCount - 1 do begin
        W := SizeOf(hCounterSign);
        CheckAvCryptMailResult(AvCmGetSignAttr(hSign, AVCM_COUNTERSIGNATURE_BYNUM, @i, @hCounterSign, W, 0));
        // ��������� ���������� ��� CounterSign
        W := SizeOf(CounterSignValid);
        CheckAvCryptMailResult(AvCmGetSignAttr(hCounterSign, AVCM_MSGSIGN_VALID, Nil, @CounterSignValid, W, 0));
        if (CounterSignValid <> AVCMR_SUCCESS) Then begin
           Writeln('��� �������������� ������� �������: ' + GetErrorInfo(CounterSignValid));
           Exit;
        end;
        // ��������� �������������� �������
        Writeln('��� �����������:');
        Result := FindAddCounterSignature(hCounterSign, MyCN, canSave);
        if Not Result then
           Exit;
     end;
  end;
  finally
    AvCmCloseHandle(hcert, 0);
  end;
End;


var
     Fhc: AvCmHc;
     FileName: AnsiString;
     S: AnsiString;
     hmsg: AvCmHmsg;
     SignCount, W: AvCmLong;
     id: AvCmLong;
     hMycert: AvCmHcert;
     MyCN: AnsiString;
     hSign: AvCmHsign;
     canSave: boolean; // = True � ��������� ��������� CounterSignature - ��������� ���������� ������������
begin
  try
    DefaultSystemCodePage := 1251;
    if ParamCount > 0 then begin
       FileName := ParamStr(1);
    end else begin
       Writeln('�� ����� ������� ����');
       Exit;
    end;
    S := FileToStr(FileName);
    // ����������� �������� AvCryptMail.dll
    LoadAvCryptMailDLL('');

    // ������������� ����������
    CheckAvCryptMailResult(AvCmInit(AVCMF_STARTUP));
  try
    Writeln('������������� ���������� ...');
    // Login
    CheckAvCryptMailResult(AvCmLogin(0, Nil, fhc, 0));
    Writeln('���� � ������� ...');

    // �������� ������ ����������
    W := SizeOf(hMycert);
    CheckAvCryptMailResult(AvCmGetObjectInfo(fhc, AVCM_MY_CERT, @hMycert, W, 0));
    // commonName (2.5.4.3 - ����� ������) ������� �����������
    MyCN := GetCertProperty(hMycert, AVCM_SUBJECT_ATTR, '2.5.4.3');
    Writeln('commonName=' + MyCN);

    // ��������� ��������� ��� �������� ���
    CheckAvCryptMailResult(AvCmOpenMsg(fhc, @S[1], Length(S), hmsg, AVCMF_IN_PKCS7));
    try
      // �������� ���������� ���
      W := SizeOf(SignCount);
      CheckAvCryptMailResult(AvCmGetMsgParam(hmsg, AVCM_SIGN_COUNT, @SignCount, W, 0));
      Writeln('���� �������� ' + IntToStr(SignCount) + ' ���');
      canSave := False;
      for id := 0 to SignCount - 1 do begin
        // ��������� ��������������� ���
        if AvCmMsgVerifySignAtIndex(hmsg, id, AVCMF_NO_CERT_VERIFY) = 0 then begin
           Writeln('��� ��������� �����');
           CheckAvCryptMailResult(AvCmGetMsgSign(hmsg, id, hSign, 0));
           try
             Writeln('��������:');
             if not FindAddCounterSignature(hSign, MyCN, canSave) Then begin
                Writeln('�� ������� ��������� ���������������� ����������� ����������. �������� ���������');
                Exit;
             end;
           finally
             AvCmCloseHandle(hSign, 0);
           end;
        end else begin
           Writeln('��� ��������� �������. �������� ���������');
           Exit;
        end;
      end;
      Writeln('�������� ������');
      if canSave then begin
         // �������� ���� ��������� � ���������� CounterSignature
         CheckAvCryptMailResult(AvCmGetMsg(hmsg, nil, W, 0));
         SetLength(S, W);
         CheckAvCryptMailResult(AvCmGetMsg(hmsg, @S[1], W, 0));
         FileName := FileName + '.p7s';
         if StrToFile(FileName, S) then
            Writeln('��������� � ��������������� ��������� ��������� � ' + FileName);
      end;
    finally
      AvCmCloseHandle(hmsg, 0);
    end;
  finally
    CheckAvCryptMailResult(AvCmLogout(fhc, 0));
    CheckAvCryptMailResult(AvCmInit(AVCMF_SHUTDOWN));
  end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
