// ������������ ���� ���������� AvCryptMail
// (C) AVEST, 2003-2005
// ������: 3.0.0
unit AvCryptMail;

interface

/// Define AVCRYPTMAIL_DYNAMIC to use dynamic import!

//{$AVCRYPTMAIL_DYNAMIC}

uses Windows;

// ----- ����, ������������ ����������� AvCryptMail -----
type

{$IFDEF WIN64}
   // ��� ������������� ����������� ���� ����������.
   AvCmResult = DWORD;
   AvCmLong = Int64;
   // ������ ����� ������
   AvCmSize = Int64;
   // ���������� ������� ����������.
   AvCmHandle = Pointer;
{$ELSE}
   // ��� ������������� ����������� ���� ����������.
   AvCmResult = DWORD;
   AvCmLong = DWORD;
   // ������ ����� ������
   AvCmSize = DWORD;
   // ���������� ������� ����������.
   AvCmHandle = Pointer;
{$ENDIF}

   PAvCmHandle = ^AvCmHandle;

   // ���������� ��������������� ������������.
   AvCmHc = AvCmHandle;

   // ���������� ��������� ���������.
   AvCmHmsg = AvCmHandle;

   // ���������� ����� �� �������� ���������.
   AvCmHsign = AvCmHandle;

   // ���������� ��������� ����������.
   AvCmHcert = AvCmHandle;
   PAvCmHcert = ^AvCmHcert;

   // ���������� ������� � ���������������� �����������,
   // ���������� � ���������� ������ ������� �������� ���.
   AvCmHsignCert = AvCmHandle;

   // ���������� ��������� ��������� �������� ��������.
   AvCmHenum = AvCmHandle;

   // ���������� ��������� ��������� �������� ������������.
   AvCmHcertEnum = AvCmHenum;

   // ���������� ��������� ��������� �������� ����������
   // � �������� � ��������������� ������������ ������������ ���������.
   AvCmHsgnCertEnum = AvCmHenum;

   // ���������� ��������� ������ ���������� ������������
   AvCmHcrl = AvCmHenum;

   // ���������� ��������� ������� �� ����������
   AvCmHreq = AvCmHenum;

   // ���������� ������� ����������.
   AvCmHcertstat = AvCmHandle;

   AvCmHOCSP = AvCmHandle;

   // ������ ����������� ��� ����������� ��� ������������� ������������
   // � ����������� � ������������ ������������/���.
   // � ��������� ����� ����������� ���������
   // ������������ ������������ � ���� ������.
   AvCmConnectionParam = packed record
      param_id: AvCmLong; // ������������� ���������
      param: pointer; // �������� ���������
   end;
   PAvCmConnectionParam = ^AvCmConnectionParam;

   // �������� ������ ��������.
   AvCmEnumGetParam = packed record
      param_id: AvCmLong; // ������������� ���������
      param_spec: pointer; // ��������� ��������������
      param: pointer; // �������� ���������
   end;
   PAvCmEnumGetParam = ^AvCmEnumGetParam;


   // �������� ������� ��������.
   AvCmImportParam = packed record
      param_id: AvCmLong; // ������������� ���������
      param: pointer; // �������� ���������
   end;
   PAvCmImportParam = ^AvCmImportParam;

   // ������ ������������ ��� ������ ������� ���������� ������������.
   AvCmFindCrlParam = packed record
      param_id: AvCmLong; // ������������� ���������
      param: pointer; // �������� ���������
   end;
   PAvCmFindCrlParam = ^AvCmFindCrlParam;

   // ������ ������������ ��� ��������� ������� �� ����������.
   AvCmGenReqParam = packed record
      param_id: AvCmLong; // ������������� ���������
      param: pointer; // �������� ���������
   end;
   PAvCmGenReqParam = ^AvCmGenReqParam;

   // ������ ������������ ��� ������ ������� �� ����������.
   AvCmFindReqParam = packed record
      param_id: AvCmLong; // ������������� ���������
      param: pointer; // �������� ���������
   end;
   PAvCmFindReqParam = ^AvCmFindReqParam;

   // ������ ������������ ��� ������� ������� �����������
   AvCmCertStatParam = packed record
      param_id: AvCmLong; // ������������� ���������
      param: pointer; // �������� ���������
   end;
   PAvCmCertStatParam = ^AvCmCertStatParam;



   //-------- ����� ----------

   // ��� ������� AvCmInit
   // ������ ���� ���������� ������������ ��� �������������� ������������� ����������
const
   AVCMF_STARTUP = $1;
AVCMF_OPEN_ATTR_CERT = $1;

   // ������ ���� ���������� ������������ ��� ������������ �������� ����������
   // ����� �� ��������� �� ��������� ������������ ��������.
const
   AVCMF_SHUTDOWN = $2;

// ��� ������� AvCmInit
// �������� ��������� ����� mac.ini
const 
   AVCMF_CHECK_FILES_INTEGRITY = $4; 

   // ��� ������� AvCmLogin
   // ����������� ��� ������������� ������������.
const
   AVCMF_NO_AUTH = $4;

// ��� ������� AvCmVerifySign � AvCmDecryptAndVerifySign
// ������ ����������� � ������ ���������� ������������
// �� ��������� � ��������� ������������.
const
   AVCMF_IMPORT = $10;

// ��� ������� AvCmOpenMsg
// ������� ������ ����� ��������� � �������� ��������� ��� PKCS#7 Data.
const
   AVCMF_IN_RAW_DATA = $100;

// ��� ������� AvCmSign AvCmEncrypt AvCmDecrypt AvCmSignAndEncrypt AvCmOpenMsg
// ������� ��������� � ������� PKCS#7.
const
   AVCMF_IN_PKCS7 = $200;

// ��� ������� AvCmSign AvCmEncrypt AvCmDecrypt AvCmSignAndEncrypt AvCmGetMsg
// �������� ��������� � ������� PKCS#7.
const
   AVCMF_OUT_PKCS7 = $2000;

// ��� ������� AvCmPutCert
// ������ ���� ������������ � ������� ���������� ������������ �� ���������� ���������
const
   AVCMF_MESSAGE = $1000;

  // ��� ������� AvCmOpenCertEnum
// ������� �� ������ ���������� ������������, � ���� ������������
const
   AVCMF_ALL_CERT = $8000;

   // ��� ������� AvCmSign AvCmSignAndEncrypt AvCmMsgSign
   // � �������� ��������� ����� �������� ��� ����������� ����������� � ���.
const
   AVCMF_ADD_ALL_CERT = $80000;

   // ��� ������� AvCmSign AvCmSignAndEncrypt AvCmMsgSign
   // � �������� ��������� ����� ������� ������ ���������� ������������.
const
   AVCMF_ADD_SIGN_CERT = $100000;
   AVCMF_ADD_ONLY_CERT = $40000;


   // ��� ������� AvCmVerifySign AvCmDecryptAndVerifySign
   // �� ���������  �������� ���������
const
   AVCMF_NO_OUTPUT = $200000;

   // ��� ������� AvCmGetMsgContent
   // ������� ������ ������� ���������� ��������� �� ����������� ��������� ����� ������.
const
   AVCMF_EXTRACT = $10;

   // ��� ������� AvCmGetSignAttr AvCmGetCertAttr
   // ������� �� ������.
const
   AVCMF_ATTR_BY_NUM = $400000;

   // ��� ������� AvCmGetSignAttr AvCmGetCertAttr
   // ������� �� ��� �������������� ������� (OID).
const
   AVCMF_ATTR_BY_OID = $800000;

   // ��� ������� AvCmEnumGet
   // �������� ��������� �� ������� ������� ������������.
const
   AVCMF_NEXT = $40;

   // ��� ������� AvCmEnumGet
   // ������ ������� ������������ � ������.
const
   AVCMF_START = $80;

   // ��� ������� AvCmGetErrorInfo
   // �������� ������ ������ �� �������������� ����������� ������.
const
   AVCMF_THREAD_ERROR = $08;

 // ��� ������� AvCmMsgSign
// ������� ��������� ����� ��������� � ����� ��������� � �������� ���������� ��������� � ����� ���������.
const
   AVCMF_AS_NEW_MESSAGE = $800;

// ������� ������ �������������� ������������ ������
   // ��� ��������� ��������� �������� Win32 API HeapAlloc,
   // ����� ������������� ��������� ���������, ��������� ���������
   // ������ �������������� �������� ���������� ������ �������� HeapFree.
const
   AVCMF_ALLOC = $1000000;

   // ���������� ��������� �� ���������� � �������������� ���������
const
   AVCMF_DETACHED = $2000000;

// �������� ������ � ����������� ��������� (��� ������� AvCmSetMsgContent)
const
   AVCMF_APPEND = $4000000;

// ������������ �� ���������� ����������� (��� ������� AvCmEncrypt)
const
   AVCMF_IGNORE_BAD_CERTS = $20;

// ������� ������ ������������, ��������������� ��� ���������� (��� ������� AvCmEnumDlg)
const
   AVCMF_ONLY_ENCR_CERTS = $400;

// �� ��������� ������� � ����������� ������������
const
   AVCMF_NO_CERT_VERIFY = $8000000;

// ��������� ���� ������ � ���������� ������ ������ ����� ���������� ���
const
   AVCMF_REPEAT_AUTHENTICATION = $800;

// �������� ������� ������������ �������� � ������ ������ ��� �����������
const
   AVCMF_FORCE_TOKEN_CONTROL = $10000;

// ������ �������� ������� ������������ �������� � ������ ������ ��� �����������
const
   AVCMF_DENY_TOKEN_CONTROL = $20000;

// AvCmLogin: ���� ������� ���� ����, �� � ��� ������, ���� ��������������� ���
// �����������, �� �������� ������ � ���������� ������
const
   AVCMF_IGNORE_CRL_ABSENCE = $1;

// AvCmLogin: ���� ������� ���� ����, �� � ��� ������, ���� ��������������� ���
// ����, �� �������� ������ � ���������� ������
const
   AVCMF_IGNORE_CRL_EXPIRE = $8;


// AvCmMsgImportCerts: ������������� ��� ����������� � ��� ��� ������ ����������� ����
const
   AVCMF_IMPORT_ALL_CERTS = $80000;


// AvCmMsgImportCerts, AvCmVerify � AvCmVerifySign: ������������� ��� �� ��������� �
// ��������� (���� � ��������� ���� ���������� �������� ����)
const
   AVCMF_IMPORT_CRL = $40000;

// AvCmOpenCertEnum: ����� �� ������ ����� ������������, �� � �������� ����� ������� �� ����������
const
   AVCMF_REQUEST_RESULT = $1;

// AvCmImport: ������� ���������� �������, ���� �� ������������ � ������������
const
   AVCMF_RETURN_HANDLE_IF_EXISTS = $1;

// ��� ������� AvCmVerifySign � AvCmDecryptAndVerifySign
// ��������� ��� �� ���� ���������
const
   AVCMF_VERIFY_ON_SIGN_DATE = $1;

// AvCmGenerateRequest: ����� ��������� ������� ���������� ������������ ��������� ������ � ����
const 
   AVCMF_ALLOW_TO_SELECT_FILE = $8;
   
// AvCmSignRawData, AvCmVerifyRawDataSign: ������� ��� ASN.1 �����������
const 
   AVCMF_RAW_SIGN = $40000;
   
// AvCmMsgVerifySign, AvCmMsgVerifySignAtIndex, AvCmVerifyRawDataSign 
// ������������ ���������� ����������� ���   
const AVCMF_NO_CRL_VERIFY        = $20;
   
// ��� ������� AvCmImport
// ����� ������� ������������ ����������� ������� ������ ������ ���������� � ������ ������
const AVCMF_SELECT_MY_CERT        = $2;


  AVCMF_UPDATE_FINAL        = $80000000;

  AVCMF_OPEN_FOR_SIGN           = $1000;
  AVCMF_OPEN_FOR_VERIFYSIGN     = $2000;
  AVCMF_OPEN_FOR_ENCRYPT        = $4000;
  AVCMF_OPEN_FOR_DECRYPT        = $8000;

  //AvCmCreateScep
  AVCMF_SCEP_OFFLINE  = $1;

  AVCMF_RELOGIN            =      $0100;
  AVCMF_OPEN_FOR_CALC_BELTHASH= $010000;
  AVCMF_OPEN_FOR_CALC_BHFHASH=  $020000;

  AVCMF_COUNTERSIGNATURE  =     $200000;

  // ��� ��������� PKCS#7 (�����������, ���) ��� ���������� ���
  AVCMF_PREPARE_CERT_CHAIN =      $8000;




   // ----- �������� ������� AvCmLogin -----
   // ��� ���������, � ������� ��������� ����������� ������������/���
const
   AVCM_DB_TYPE = $1;

   // ��������� Microsoft � ���������� ������� Windows.
const
   AVCM_DBT_MS_REGISTRY = $100;

   // ���������� � ����� ������ ORACLE (ADO).
   AVCM_DBT_ORACLE = $101;

   // ���������� � ����� ������ Sybase (ADO ODBC).
   AVCM_DBT_SYBASE = $102;

   // �������� ���������.
   AVCM_DBT_FILE = $103;

   // �������� �������� ���������.
   AVCM_DBT_ARCHIVE_FILE = $104;

   // �������� ��������� � ������.
   AVCM_DBT_ARCHIVE_MEMORY = $105;

   // ���������� � ������ ���������� � ������ �� ������ ���������� � ������ � ������������
   AVCM_DBT_E_MEMORY = $107;

   // ���������� ��������� ���������� � ����� ������.
const
   AVCM_DB_HANDLE = $2;

   // DSN - ��� ���� ������.
const
   AVCM_DB_DSN = $3;

   // ��� ������������ ���� ������.
const
   AVCM_DB_UID = $4;

   // ������ ������������ ���� ������.
const
   AVCM_DB_PWD = $5;


   // ������ ���������� � ����� ������.
const
   AVCM_DB_CONNECTSTR = $4;

   // ���� � ������ ���������
const
   AVCM_DB_FILE_PATH = $3;

   // ���� � ����� ��������� ���������
const
   AVCM_DB_ARCHIVE_FILE_PATH = $3;

   // ��������� �� �������� ���������
const
   AVCM_DB_ARCHIVE_PTR = $6;

   // ������ ��������� ��������� � ������
const
   AVCM_DB_ARCHIVE_SIZE = $7;

   // ������ ��� ������� � ���������� ������ ������
const
   AVCM_PASSWORD = $1030;

const
   AVCM_COMMON_NAME = $1031;

   // ���������� � �������� #PKCS11 ������
   AVCM_SLOTID   = $10A;



// ----- �������� ������� AvCmGetObjectInfo -----

// ��������� ����������� ������� �����������.
const
   AVCM_MY_CERT = $8;

   // ��������� ���������� �������� ��������.
const
   AVCM_CHILDREN_COUNT = $9;



   // ----- �������� ������� AvCmGetMsgParam -----

   // ��� ��������� ���������.
const
   AVCM_FORMAT = $A;

   // ������ �� ����� ��������� PKCS#7.
const
   AVCM_MF_RAW_DATA = $103;

// ������ �� ����� ��������� PKCS#7.
const
   AVCM_MF_NONE = $104;

   // ����������� ��������� � ������� PKCS#7 SignedData.
const
   AVCM_MF_SIGNED_DATA = $105;

   // ������������� ��������� � ������� PKCS#7 EnvelopedData.
const
   AVCM_MF_ENVELOPED_DATA = $106;

   // ���������� �������� � ����������� ���������.
const
   AVCM_SIGN_COUNT = $107;

   // ������ � ������� ���������� ���������
const
   AVCM_INNER_FORMAT = $108;

//   AVCM_SIGN_CERT_ENUM = $109;


  // ���� � ����� ������� �� ���������� ��� ������� AvCmGenerateRequest
  AVCM_TEMPLATE = $2F;


// ----- �������� ������� AvCmGetSignAttr AvCmGetCertAttr AvCmOpenCertEnum AvCmGetRequestAttr -----

// ���������� ��������� ����� (X.509 Name) ��������� �����������
const
   AVCM_SUBJECT_ATTR_COUNT = $1;

// ���������� ��������� ����� (X.509 Name) �������� �����������
const
   AVCM_ISSUER_ATTR_COUNT = $2;

// ������������� ������� (OID) �������� ����� ��������� ����������� � ���� ������
const
   AVCM_SUBJECT_ATTR_OID = $1033;

// ������������� ������� (OID) �������� ����� ��������� ����������� � ���� ������
const
   AVCM_ISSUER_ATTR_OID = $1034;

// �������� ���������� ����������� � ���� BLOB
const
   AVCM_EXT_BLOB = $5;

// ������������� ������������ �������� � ���� ������ ASCIIZ
const
   AVCM_AUTH_OID = $1040;//$6;

// ������������� �������������� �������� � ���� ������ ASCIIZ
const
   AVCM_UNAUTH_OID = $1041;//$7;

// �������� ������������ �������� � ���� BLOB
const
   AVCM_AUTH_BLOB = $8;

// �������� �������������� �������� � ���� BLOB
const
   AVCM_UNAUTH_BLOB = $9;

// ������ �������
const
   AVCM_VERSION = $B;

// ������������� ����� ������ ������������
   AVCM_AUTHORITY_KEY_IDENTIFIER = $100C; 

// ��� (X.509 Name) �������� ������������ ����������� � ���� ������
const
   AVCM_ISSUER_AS_STRING = $100D;

// �������� ����� ������������ �����������
const
   AVCM_SERIAL_AS_STRING = $100E;

// ������������� ��������� ����� ������������.
const
   AVCM_PUB_KEY_ID = $100F;

// ������������� ��������� �����������
const
   AVCM_HASH_ALG_OID = $1010;

// ������������� ��������� �������
const
   AVCM_SIGN_ALG_OID = $1011;

// �������
const
   AVCM_SIGN = $12;

// ���� � ����� ��������� �������, ������� ��������� �
// ������ ����������� ��������� ���������.
const
   AVCM_SIGN_DATE_TIME = $13;

// ���������� ����������� ���������
const
   AVCM_AUTH_COUNT = $14;

// ���������� ���������� ������������� ���������
const
   AVCM_UNAUTH_COUNT = $15;

// ����������� ������� � ���� ������ ASCIIZ
const
   AVCM_AUTH_AS_STRING = $1016;

// ������������� ������� � ���� ������ ASCIIZ
const
   AVCM_UNAUTH_AS_STRING = $1017;

// �������� ����� �����������
const
   AVCM_SERIAL_AS_INTEGER = $18;

// ����/����� ������ �������� �����������
const
   AVCM_NOT_BEFORE = $1A;

// ����/����� ��������� �������� �����������
const
   AVCM_NOT_AFTER = $1B;

// ����/����� ������ �������� ������� �����
const
   AVCM_KEY_NOT_BEFORE = $2A;

// ����/����� ��������� �������� ������� �����
const
   AVCM_KEY_NOT_AFTER = $2B;

// ��������� ������ �������� ������������ �����������
const
   AVCM_VALID = $2C;

// DER-������������� �����������
const
   AVCM_BLOB = $2D;

// ��������� ������ ���������������� ������� (������������� � MS CA).
const
   AVCM_MSCA_COMPATIBLE = $30;

// ���� � ����� �������� ����������� ������ ����
// ������ ��� ����� ��������� ���� � �������.
const
   AVCM_D_GREATER = $110;

// ���� � ����� �������� ����������� ������ ����
// ������ ��� ����� ��������� ���� � �������.
const
   AVCM_D_LESS = $111;

// ��� (X.509 Name) ��������� ����������� � ���� ������
const
   AVCM_SUBJECT_AS_STRING = $101C;

// ������� ����� (X.509 Name) ��������� ����������� � ���� ������
const
   AVCM_SUBJECT_ATTR = $101D;

// ������������� ��������� ��������� ����� �����������
const
   AVCM_PUB_KEY_ALG_OID = $101E;

// �������� ���� �����������
const
   AVCM_PUB_KEY = $1F;

// ������� ��������������� ����� (X.509 AltName) ��������� ����������� � ���� ������
const
   AVCM_SUBJ_ALT_NAME_ATTR = $1020;

// ���������� �������������� ���������
const
   AVCM_EXT_COUNT = $21;

// ������������� ������� (OID) ����������
const
   AVCM_EXT_OID = $1022;

// ������������ �������������� ������� (OID) ����������
const
   AVCM_EXT_OID_NAME = $1026;

// ������� ����������� ����������
const
   AVCM_EXT_CRITICAL = $23;

// ���������� ����������� � ���� ������
const
   AVCM_EXT_AS_STRING = $1024;

// ��������� �������������� ������� ������������
const
   AVCM_PURPOSE = $25;

// ����� ������������, ��������������� ��� �������.
const
   AVCM_P_SIGN = $01;

// ����� ������������, ��������������� ��� ������������.
const
   AVCM_P_CRYPT = $02;

  // ����� ������������ ������������.
   AVCM_P_NON_REPUDIABLE = $04;

// ��������� ��� �������� �����������
const
   AVCM_TYPE = $26;

// ������� ������ ������ ������������
const
   AVCM_TYPE_MY = $10E;

// ������� ������������ ���������� ������� ������������
const
   AVCM_TYPE_ROOT = $10F;

// ����� �� �������� ����� (X.509 Name) �������� ����������� � ���� ������
const
   AVCM_ISSUER_ATTR = $1032;

// ���������� ��������� � ������ ����������� ���������� ����� �����������
const
   AVCM_EXT_KEY_USAGE_COUNT = $28;

// ������������� ������� (OID) �� ������ ����������� ���������� ����� �����������.
// ��� ���� ���������� �������� ������ � ������ (�������� attr_param).
const
   AVCM_EXT_KEY_USAGE_OID = $1027;

// ������������ �������������� ������� (OID) �� ������ �����������
// ���������� ����� �����������, � ��� ������,
// ���� ������ OID ��������������� � ������������ �������.
// ��� ���� ���������� �������� ������ ���� �������������� � ������ (�������� attr_param).
const
   AVCM_EXT_KEY_USAGE_NAME = $1028;


// ����� ������� ���������� ���������.
const
   AVCM_CERT_ISSUERS_CHAIN = $1029;
   
   
// ������ ����� ��������������  ��� �� �����������
const AVCM_CRL_DISTRIBUTION_POINTS = $1035;

// ������� �� ��������� ��� ������ �������������� �����
const AVCM_IMPORT_PATH       = $1036;

// ������� �� ��������� ��� ���������� ����� ���������� �������
const AVCM_EXPORT_PATH       = $1037;


// ��������� �� ������������� �������� ��������������� ����� � ��������� ����������� ��������. 
// ������ ���� � ��� ����� �������� ����������� ��������
const AVCM_OPERATION_REPORT       = $1038;


   

// ��������� ������� AvCmGetErrorInfo
// ������� �������� ������
const
   AVCM_SHORT_STRING = $1;

// ��������� �������� ������
const
   AVCM_DESCRIPTION = $2;

// ��� ������ ����������.
// � ���� ������ � �������� ��������� �� ��������  �����
// ������ ���� ������� ��������� �� AvCmLong.
const
   AVCM_ERROR_CODE = $3;

// ����� �� ��������� ����������� �������� ������ ���������� ������������ � ���� ������
const
   AVCM_CRL_ISSUER_CERT = $2;

// ���� Subject �������� ���
const
   AVCM_CRL_ISSUER_SUBJECT = $1;

// ������� ���������� ���������������� � ��������� �������
const
   AVCM_RESULT_HANDLE = $2;


// DER-������������� �����������
const
   AVCM_CERTIFICATE = $1;

// DER-������������� ������ ���������� ������������
const
   AVCM_CRL = $2;

// DER-������������� ������� �� ���������� � ������� PKCS#10
const
   AVCM_PKCS10_REQUEST = $4;

// DER-������������� ����������� ������ �� ���������� � ������� PKCS#7 SignedData
const
   AVCM_PKCS7_REQUEST = $5;

// DER-������������� ������� ������������ (p7b)
   AVCM_PKCS7_CHAIN = $8;

// ������������ ��������� � AvCmLogin:AVCM_DBT_E_MEMORY
const
   AVCM_STORES = $201;


// ����/����� ������ �����������
const
   AVCM_CS_REVOCATION_TIME = $301;

// ������� ������ �����������
const
   AVCM_CS_REVOCATION_REASON = $302;

// ������� ��������� �����������
const
   AVCM_CS_UNTRUST_REASON = $303;




// ����� �������� �������
const
   AVCM_CHECK_MODE = $401;

// �������� ������� � �������������� ���������� ���
const
   AVCM_CM_OFFLINE = $402;

// �������� ������� ����������� � ����������
const
   AVCM_CM_ONLINE = $403;

// ����� OCSP �������
const
   AVCM_RESPONDER_URL = $404;

   
// AvCmGenerateRequest � ������������� ������ � ����������� ����������� �����������
const 
   AVCM_CERT_PROLONGATION = $405;
   
// AvCmImport - ������ ������������ �/��� ��� �� �����
const 
   AVCM_ANY_FILE = $406;   
   
   

// ---------- ������� ��������� ����������� ----------

//! ������� ��� ������ ���������
const
   AVCM_CSR_BASE = $077B1000;

// ���������� �������
const
   AVCM_CSR_REVOKED = $01 + AVCM_CSR_BASE;

// ������� ��������� �� �����������
const
   AVCM_CSR_UNKNOWN = $02 + AVCM_CSR_BASE;


   // ---------- ���� ������ ----------
   // �������� ���������� �������
const
   AVCMR_SUCCESS = 0;

   //! ������� ��� ������
const
   AVCMR_BASE = $E82A0100;

   // ������ ��� ������������� ������
const
   AVCMR_ALLOC_ERROR = $01 + AVCMR_BASE;

   // ������������� �������� �������
const
   AVCMR_BAD_ATTR = $02 + AVCMR_BASE;

   // �������� ������ ���������
const
   AVCMR_BAD_FORMAT = $03 + AVCMR_BASE;

   // ���������� ������� �������
const
   AVCMR_BAD_HANDLE = $04 + AVCMR_BASE;

   // ���������� ���������� �������
const
   AVCMR_BAD_HC = $05 + AVCMR_BASE;

   // ���������� ����������� �������
const
   AVCMR_BAD_HCERT = $06 + AVCMR_BASE;

   // ���������� �������� ������������ �������
const
   AVCMR_BAD_HENUM = $07 + AVCMR_BASE;

   // ���������� ��������� ��������� �������
const
   AVCMR_BAD_HMSG = $08 + AVCMR_BASE;

   // ���������� ������� �������
const
   AVCMR_BAD_HSIGN = $09 + AVCMR_BASE;

   // � ��������� ��� ������� � ��������� �������
const
   AVCMR_BAD_NUMBER = $0A + AVCMR_BASE;

   // ������ �������
const
   AVCMR_BAD_PASSWORD = $0B + AVCMR_BASE;

   // �������� ����� ������� ���
const
   AVCMR_BUFFER_TOO_SMALL = $0C + AVCMR_BASE;

   // �� ������ ������ ����������
const
   AVCMR_CERT_NOT_FOUND = $0D + AVCMR_BASE;

   // ������� ��� ������������ �������� �������
const
   AVCMR_CERT_CA_INVALID = $0E + AVCMR_BASE;

   // ���������� �������� �� ������
const
   AVCMR_CERT_CA_NOT_FOUND = $0F + AVCMR_BASE;

   // ���� �������� ������� ����� ����������� �������
const
   AVCMR_CERT_EXPIRED = $10 + AVCMR_BASE;

   // ���������� �� ������������ ��� ����������
const
   AVCMR_CERT_NOT_FOR_CRYPT = $11 + AVCMR_BASE;

   // ���������� �� ������������ ��� �������
const
   AVCMR_CERT_NOT_FOR_SIGN = $12 + AVCMR_BASE;

   // ������� ��� ������������ �������
const
   AVCMR_CERT_SIGN_INVALID = $13 + AVCMR_BASE;

   // �� ������� ��� ����� ��������� ������������
const
   AVCMR_CERT_STORE_NOT_FOUND = $14 + AVCMR_BASE;

   // �� ������ ��������� � ������� ������� �� ��������
const
   AVCMR_CONTAINER_NOT_FOUND = $15 + AVCMR_BASE;

   // ������� ��� ��� �������� ������� ��� ��� �������
const
   AVCMR_CRL_INVALID = $16 + AVCMR_BASE;

   // ��� �������� �� ������
const
   AVCMR_CRL_NOT_FOUND = $17 + AVCMR_BASE;

   // ���������� ����������� � ���� ������
const
   AVCMR_DB_NOT_FOUND = $18 + AVCMR_BASE;

   // �� ������ ��������
const
   AVCMR_DEVICE_NOT_FOUND = $19 + AVCMR_BASE;

   // ���������� ������� ������, ������ �����
const
   AVCMR_BUSY = $1A + AVCMR_BASE;

   // �� ������� ��������� ����������� � ���� ������
const
   AVCMR_NO_DB_PARAMS = $1B + AVCMR_BASE;

   // ������� ��������� ����� ������� ������
const
   AVCMR_NO_INPUT = $1C + AVCMR_BASE;

   // ��������� �� ����� �������, ������������ �� ����� ������� �����������
const
   AVCMR_NO_SIGN = $1D + AVCMR_BASE;

   // ��������� ������� ������������� ����������
const
   AVCMR_ALREADY_INITIALIZED = $1E + AVCMR_BASE;

   // ���������� �� ���� ����������������
const
   AVCMR_NOT_INITIALIZED = $1F + AVCMR_BASE;

   // ������ ����/������� �����������
const
   AVCMR_BAD_DATE = $20 + AVCMR_BASE;

   // ������� �������� �������� �����
const
   AVCMR_BAD_FLAGS = $21 + AVCMR_BASE;

   // ������� ��������� � ������, ��������� � ����� ������, �� ������� ������
const
   AVCMR_BAD_THREAD = $22 + AVCMR_BASE;

   // ���� �� ����������
const
   AVCMR_DATE_NOT_VALID = $23 + AVCMR_BASE;

   // ���������� ������ ����������
const
   AVCMR_INTERNAL_ERROR = $24 + AVCMR_BASE;

   // ������ �� ������
const
   AVCMR_NOT_FOUND = $25 + AVCMR_BASE;

   // ������� �� �����������
const
   AVCMR_NOT_IMPLEMENTED = $26 + AVCMR_BASE;

   // ������� �������
const
   AVCMR_SIGN_INVALID = $27 + AVCMR_BASE;

   // ������ ������� ��� ����������� ������������
const
   AVCMR_USER_NO_AUTH = $28 + AVCMR_BASE;

// �������� ������� �������
const
   AVCMR_BAD_PARAM = $29 + AVCMR_BASE;

// �������� ������ ������� ���
const
   AVCMR_BAD_FORMED_SIGN = $2A + AVCMR_BASE;

// ������������� ���������������� ����� ����������� ��������
const
   AVCMR_AVCSP_INIT_FAILED = $2B + AVCMR_BASE;

// ������ ������� � ������� Windows
const
   AVCMR_REGISTRY_ERROR = $2C + AVCMR_BASE;

// ��������� ������ ��� ������ ������� Win32
const
   AVCMR_WIN32_ERROR = $2D + AVCMR_BASE;


// ���������� ������������ ���������:
// ����� ������������ ����������� ��������� �����������
// ������ ���������� �������������������� ������������
const
   AVCMR_OTHER_RECIPIENT = $2E + AVCMR_BASE;


// �� ������ ���� (������ ���������� ������� ������������)
const
   AVCMR_CTL_NOT_FOUND = $2F + AVCMR_BASE;

// ���������� �������
const
   AVCMR_CERT_REVOKED = $30 + AVCMR_BASE;

// ��� ������� �����������
const
   AVCMR_CERT_NOT_TRUSTED = $31 + AVCMR_BASE;

// ���� �������� ��� �����
const
   AVCMR_CRL_EXPIRED = $32 + AVCMR_BASE;

// ���������� �������� ��� �� ������
const
   AVCMR_CRL_ISSUER_NOT_FOUND = $33 + AVCMR_BASE;

// ���� �������� ����������� �������� ��� �����
const
   AVCMR_CRL_ISSUER_EXPIRED = $34 + AVCMR_BASE;

// ������ ���������� �� ������������� ������ ��������� ������������.
const
   AVCMR_CERT_STORE_BAD_VERSION = $35 + AVCMR_BASE;

// � ������ ��������� ����������� ����������� �����������.
const
   AVCMR_MY_STORE_EMPTY = $36 + AVCMR_BASE;

// �������� �������� �������������.
const
   AVCMR_USER_CANCEL = $37 + AVCMR_BASE;

// ���������� �������� ����������� ������������� ����� �� �������������� ������� �����������
const
   AVCMR_RA_EXT_KEY_USAGE_NOT_ALLOWED = $38 + AVCMR_BASE;

// ���������� �������� ���������� �� �������������� ������� �����������.
const
   AVCMR_RA_EXT_NOT_ALLOWED = $39 + AVCMR_BASE;

// � ������ ����������� ��������� ����������� ������������
const
   AVCMR_TOO_MANY_CERT = $3A + AVCMR_BASE;


// �������� ������ �� ����������
const
   AVCMR_PARAM_SPEC_NOT_FOUND = $40 + AVCMR_BASE;

// ���������� �� �������� ������������ ��
const
   AVCMR_CERT_NOT_RA = $41 + AVCMR_BASE;

// ������ ��� ����������
const
   AVCMR_ALREADY_EXISTS = $42 + AVCMR_BASE;

// ��� ������ ���������� ����������
const
   AVCMR_UNKNOWN_ERROR_CODE = $43 + AVCMR_BASE;

// �������� ��� ���������� �� ���������� ��������, ����������� ���������� AVCM_CRL_ISSUER_SUBJECT
const
   AVCMR_BAD_CRL_ISSUER = $44 + AVCMR_BASE;

// � ����������� ������� ���������� ������������ ������� ����� ����� ��� ������� ��������
const
   AVCMR_OLD_CRL = $45 + AVCMR_BASE;

// ���������� ��� �������
const
   AVCMR_BAD_HCRL = $46 + AVCMR_BASE;

// ���������� �������� �������������
const
   AVCMR_CERT_TEMPORARY_REVOKED = $47 + AVCMR_BASE;

// ������ ������������� ������ ��� ��������� ��������������.
// �������� �������� �������� ��� ������� ����� ������ ������.
const
   AVCMR_REPEAT_AUTHENTICATION_ERROR = $48 + AVCMR_BASE;

// ��� ���� ������� � ���� ������������.
const
   AVCMR_DB_AUTHENTICATION_ERROR = $49 + AVCMR_BASE;

// �������� � ������ ������ �� ����������
const
   AVCMR_TOKEN_NOT_FOUND = $4A + AVCMR_BASE;

// ��������� �� ����� �����������
const
   AVCMR_NO_CONTENT = $4B + AVCMR_BASE;

// ���� �������� ����������� �������
// ������ �������
//const AVCMR_CERT_EXPIRED         = $10 + AVCMR_BASE;

// ���� �������� ����������� �� ��������
const
   AVCMR_CERT_NOT_VALID_YET = $4C + AVCMR_BASE;

// ���� �������� ����������� �����
const
   AVCMR_CERT_ALREADY_EXPIRED = $4D + AVCMR_BASE;

// �������� �� ���������������
const
   AVCMR_INVALID_TOKEN = $4E + AVCMR_BASE;

// ������ ������������� �����
const
   AVCMR_BAD_KEY = $4F + AVCMR_BASE;

// ������ ������ �� ��������
const
   AVCMR_TOKEN_WRITE_ERROR = $50 + AVCMR_BASE;

// ���������� �� ������, �� ������ ����� �� � ������ ����������� �� ������� �������
const
   AVCMR_REQUEST_DENIED = $51 + AVCMR_BASE;

// ������� ������������ ��������� �� �������� �����
const
   AVCMR_BAD_BUFFER_PTR = $52 + AVCMR_BASE;

// ������ ������������ ������ �����������.
const
   AVCMR_OBJ_LOCKED = $53 + AVCMR_BASE;

// ����������� ���������� �������������� ���������.
const
   AVCMR_NO_RECIPIENTS = $54 + AVCMR_BASE;

// �������� �� ��������������
const
   AVCMR_ALG_NOT_SUPPORTED = $55 + AVCMR_BASE;

// ���������� �� �������
const
   AVCMR_CERT_NOT_REVOKED = $56 + AVCMR_BASE;

  //  ���������� ���������������� ������ �� ���������� ��
  AVCMR_REQUEST_FOR_CA_DENIED = $57 + AVCMR_BASE;

  //  ���������� ���������������� ������ �� ���������� ��
  AVCMR_REQUEST_FOR_RA_DENIED = $58 + AVCMR_BASE;

  //  �� �� ����� ����� �� ���������� ������ ��������
  AVCMR_REQUEST_FOR_REVOKE_DENIED = $59 + AVCMR_BASE;

  // �� �� ����� ����� �������� ����������� ��� �� ����� �������� �������� ������������.
  AVCMR_INVALID_BASIC_CONSTRAINTS = $5A + AVCMR_BASE;

  // �������������� ������ AvCryptSQL.
  AVCMR_CRYPTSQL_SYNTAX_ERROR = $5B + AVCMR_BASE;

  // ����������/��� �� ������������� �������� ������
  AVCMR_NOT_CONDITION = $5C + AVCMR_BASE;
  sAVCMR_NOT_CONDITION = '����������/��� �� ������������� �������� ������.';

  // �� ������� ��������� ���. ��������, �������� ���������� � AvHSM.
  AVCMR_VERIFY_ERROR = $5D + AVCMR_BASE;

  // �������� ����������� ������� ������.
  AVCMR_BAD_DATA = $5E + AVCMR_BASE;

  // �� ������ ������������ ���� ��� �������� �������
  AVCMR_ORIGINAL_FILE_FOR_VERIFY_NOT_FOUND = $5F + AVCMR_BASE;

  // ���������� �� ������������ ��� ������� ������������
  AVCMR_CERT_NOT_FOR_SIGN_CERT = $60 + AVCMR_BASE;

  // ���������� �� ������������ ��� ������� ���
  AVCMR_CERT_NOT_FOR_SIGN_CRL = $61 + AVCMR_BASE;

  // ���������� �������� ����������� ����������� ����������.
  AVCMR_CERT_UNKNOWN_CRITICAL_EXT = $62 + AVCMR_BASE;

  // ��� �������� ����������� ����������� ����������.
  AVCMR_CRL_UNKNOWN_CRITICAL_EXT = $63 + AVCMR_BASE;

  //���������� ����� ������ �������.
  AVCMR_INVALID_KEY_USAGE = $64 + AVCMR_BASE;

  // ���������� �� ������� ������ ��.
  AVCMR_INVALID_RACERT = $65 + AVCMR_BASE;

  AVCMR_CRLSERVER_ERROR = $66 + AVCMR_BASE;

  // ������ �������� ���������� PKCS#11
  AVCMR_LOADLIBPKCS11_ERROR = $67 + AVCMR_BASE;

  // ������� ����� ���� � ������ ��������������� ���
  AVCMR_CRLDP_BAD_PATH = $68 + AVCMR_BASE;

  // �������� ������� �� ���������� ����� ������� �� ��������� ������������� �����������
  AVCMR_RENEW_BAD_ATTR = $69 + AVCMR_BASE;


  AVCMR_POLICY_NOT_FOUND = $70 + AVCMR_BASE;
  AVCMR_POLICY_NOT_APPLY = $71 + AVCMR_BASE;

  // ���������� �� ������������ ��� ������� ���������� ������������
  AVCMR_CERT_NOT_FOR_SIGN_ACERT = $72 + AVCMR_BASE;

  // ������ ��� ��������� � OCSP �������
  AVCMR_OCSP_ERROR = $73 + AVCMR_BASE;

  // ���� ������� ����� �����
  AVCMR_KEY_ALREADY_EXPIRED = $74 + AVCMR_BASE;

  // �������� �� ����������
  AVCMR_PKCS11_TOKEN_NOT_PRESENTERROR = $75 + AVCMR_BASE;

  // ������ ��� ������ ������� PKCS#11
  AVCMR_PKCS11_ERROR = $76 + AVCMR_BASE;

  // �� ������� �������� ��� ���������� ������� � LDAP
  AVCMR_LDAP_ACTION_NOT_FOUND = $77 + AVCMR_BASE;

  //������ �� ���������� ���� ������� �����������
  AVCMR_SCEP_PENDING = $78 + AVCMR_BASE;

  // ������ ��� ��������� � ������� SCEP
  AVCMR_SCEP_ERROR = $79 + AVCMR_BASE;

  // OCSP ������ ��� ������� ����������� �� �����
  AVCMR_OCSP_NOT_DEFINED = $80 + AVCMR_BASE;

  // ������ �������������� ��������.
  AVCMR_EXTERNALCHECKS_ERROR2 = $81 + AVCMR_BASE;

  //������ ��� ��� �������� �������� �� ������.
  AVCMR_CRL2_NOT_FOUND = $82 + AVCMR_BASE;

  // ���������� ����������� �� ������.
  AVCMR_ORIGINATOR_NOT_FOUND = $83 + AVCMR_BASE;

  // ���������� �������� ���������� �� �������������� ��� ������� �����������.
  AVCMR_ENC_ALG_BAD = $84 + AVCMR_BASE;

  // � ������ ����������� �������� �������� SCEP
  AVCMR_SCEP_ERROR2 = $85 + AVCMR_BASE;

  // OCSP-������� �� ������� ���������� ������ �����������
  AVCMR_OCSP_BAD_STATUS = $86 + AVCMR_BASE;

  // ������ HTTP
  AVCMR_HTTP_ERROR = $87 + AVCMR_BASE;

  //����� �������:
  AVCMR_SERVER_ERROR = $88 + AVCMR_BASE;

  //������ �������� �������������� �������, �� ���������� ������ �� �������� ��������� ���������� �������.
  AVCMR_TLS_INCOMPLETE_CREDENTIALS = $89 + AVCMR_BASE;




// ***************   O C S P ***********************************
  AVCM_OCSP_STATUS = $311;
  AVCM_OCSP_THIS_UPDATE = $312;
  AVCM_OCSP_NEXT_UPDATE = $313;
  AVCM_OCSP_REV_TIME = $314;
  AVCM_OCSP_REV_REASON_AS_DWORD = $315;
  AVCM_OCSP_RESPONSE_CERT = $316;

  AVCM_OCSP_SIGN_RESPONSE_COUNT = $321;
  AVCM_OCSP_SIGN_RESPONSE_BYNUM = $322;

  AVCM_CONST_BASE = $DA370100;

//    �������� ������� OCSPSingleResponse

  AVCM_OCSP_STATUS_GOOD =       (AVCM_CONST_BASE + 1);
  AVCM_OCSP_STATUS_REVOKED =    (AVCM_CONST_BASE + 2);
  AVCM_OCSP_STATUS_UNKNOWN =    (AVCM_CONST_BASE + 3);
  AVCM_OCSP_STATUS_BAD =        (AVCM_CONST_BASE + 4);


// Attribute Certificate
  AVCM_ATTRIBUTE_CERTS = $323;

  // ���������� �������������� ���������
  AVCM_ATTR_COUNT = $324;

  AVCM_ATTR_BLOB = $325;

  // ������������� ������� (OID) ��������
  AVCM_ATTR_OID            = $1042;

  // �������� �������� ����������� � ���� ������
  AVCM_ATTR_AS_STRING      = $1043;

  // ������������ �������������� ������� (OID) ��������
  AVCM_ATTR_OID_NAME       = $1044;

  // ���������� ����������� �� ��������, ������� AvCmScepGet
  AVCM_CONTAINERCOUNT = $326;

  // ������ �� ����������, ������� AvCmScepSet
  AVCM_SCEP_REQUEST = $327;

  AVCM_SCEP_PKCS_REQ = $328;

  AVCM_SCEP_GET_CERT_INITIAL = $329;

  AVCM_SCEP_LOGIN = $330;


  // ������ �� ���������� ��� ������� AvCmGenerateRequest
  AVCM_TEMPLATE_DATA = $331;
  // ������ �������� ��������� �����
  AVCM_CARDS_DATA = $332;

  AVCM_CERT_DATA = $332;

  // ��������� CA ������� SCEP /AVCMF_SCEP_OFFLINE
  AVCM_SCEP_CACERT = $333;

  // ���������/��������� ������ ��� ������� SCEP /AVCMF_SCEP_OFFLINE
  AVCM_SCEP_PKIOPERATION = $334;

  AVCM_SCEP_PKCS_REQ_PREPARE = $335;
  AVCM_SCEP_PKCS_REQ_ENROLL =  $336;

  AVCM_STORE_TYPE = $337;

  AVCM_REQUEST_STATE   =       $337;

  // ���������
  AVCM_REQUEST_STATE_INBOX = 1;
  // � ������� �������
  AVCM_REQUEST_STATE_PROCESSED = 2;
  // ���������
  AVCM_REQUEST_STATE_REJECTED = 3;
  // �������� � ������ �����������
  AVCM_REQUEST_STATE_MANUALPROCESSING = 4;
  // ��������� � ������ ���������
  AVCM_REQUEST_STATE_SIGN_WAIT = 5;
  // �������� ������ �������
  AVCM_REQUEST_STATE_PENDING = 6;
  // �������� ��������� �������� SCEP


  // ��� ����������, ������� AvCmScepGet
  AVCM_CONTAINERNAME       = $1045;

  AVCM_SCEP_TRANSACTIONID  = $1046;

 //
  AVCM_MSG_INI  = $1047;

  // ��������� URL � SCEP /AvCmGetRequestAttr
  AVCM_SCEP_URL  = $1048;

  // ���������� ������� ������� �����������
  AVCM_POLICYINFO_COUNT = $338;
  // �������� �������� �����������
  AVCM_POLICYINFO_OID = $1049;
  AVCM_VIEW_SIGN_ATTR = $339;


  // ���� ������� � LDAP
  AVCM_LDAP_PATH = $1050;

  // �������� ����� ��������� �����������, �� ��������� �������� ������� ����������
  AVCM_BASE_SERIAL_AS_STRING = $1051;
  // ��� �������� ��������� �����������, �� ��������� �������� ������� ����������
  AVCM_BASE_ISSUER_AS_STRING = $1052;


// 4.0.0

// Certificate
  AVCM_PKCS7_CERTS = $340;
// CRL
  AVCM_PKCS7_CRLS = $341;



  AVCM_HASH_VALUE = $402;
  AVCM_UNP = $1065;

  // TLS + SOAP
  AVCM_HTTPS_URL = $410;
  AVCM_HTTPS_PROXY_VERSION = $411;
  AVCM_HTTPS_PROXY = $412;
  AVCM_TLS_CERT = $413;
  AVCM_TLS_TRUSTS_CERTS = $414;
  AVCM_HTTPS_USERAGENT = $415;
  AVCM_HTTPS_CONTENTTYPE = $416;
  AVCM_TLS_CIPHER_INFO = $417;
  AVCM_HTTPS_READTIMEOUT = $418;
  AVCM_TLS_SESSIONID = $419;
  AVCM_TLS_ENABLEDPROTOCOLS = $41A;


  AVCM_EXT_OR_SUBJECT = $1053;

  // Import + ROOT
  AVCM_IMPORT_FILES = $420;
  AVCM_IMPORT_PKCS7_FILENAME = $421;
  AVCM_IMPORT_ROOT_FILENAME = $422;
  //AVCM_IMPORT_CRL_FILENAME = $422; - ���� �� ������������
  //AVCM_IMPORT_CA_FILENAME = $422; - ���� �� ������������ (�����������)

  // countersignature
  AVCM_COUNTERSIGNATURE_COUNT = $430;
  AVCM_COUNTERSIGNATURE_BYNUM = $431;
  AVCM_MSGSIGN_VALID          = $432;

//
//--------- ������� ���������� ---------


{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmSetWorkDir:
   function(
      WorkDir: PChar): AvCmResult; stdcall;
   {$ELSE}
function AvCmSetWorkDir(
   WorkDir: PChar): AvCmResult; stdcall;
{$ENDIF}

// ������������� ����������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmInit: function(
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmInit(
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ����������� ������������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmLogin: function(
      conn_param_count: AvCmSize;
      conn_params: PAvCmConnectionParam;
      var hc: AvCmHc;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmLogin(
   conn_param_count: AvCmSize;
   conn_params: PAvCmConnectionParam;
   var hc: AvCmHc;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ���������� ������������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmLogout: function(
      hc: AvCmHc;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmLogout(
   hc: AvCmHc;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}

// ������� ��� ������ ������ ������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmFlush: function(
      hc: AvCmHc;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmFlush(
   hc: AvCmHc;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ��������� ������������ ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmSign: function(
      hc: AvCmHandle;
      input_message: pointer;
      input_size: AvCmSize;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmSign(
   hc: AvCmHandle;
   input_message: pointer;
   input_size: AvCmSize;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� �������� ������� � ��������� ��������� ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmVerifySign: function(
      hc: AvCmHc;
      input_message: pointer;
      input_size: AvCmSize;
      var hsgn_cert_enum: AvCmHsgnCertEnum;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmVerifySign(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   var hsgn_cert_enum: AvCmHsgnCertEnum;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������ ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmEncrypt: function(
      hc: AvCmHc;
      input_message: pointer;
      input_size: AvCmSize;
      cert_count: AvCmLong;
      certificates: PAvCmHcert;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmEncrypt(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   cert_count: AvCmLong;
   certificates: PAvCmHcert;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ����������� �������������� ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmDecrypt: function(
      hc: AvCmHc;
      input_message: pointer;
      input_size: AvCmSize;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmDecrypt(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ��������� ������������ ��������� � ����������� ��� �������������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmSignAndEncrypt: function(
      hc: AvCmHc;
      input_message: pointer;
      input_size: AvCmSize;
      cert_count: AvCmLong;
      certificates: PAvCmHcert;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmSignAndEncrypt(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   cert_count: AvCmLong;
   certificates: PAvCmHcert;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ��������� � ����������� ��������� �������;
// � ��������� ��������� ���������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmDecryptAndVerifySign: function(
      hc: AvCmHc;
      input_message: pointer;
      input_size: AvCmSize;
      var hsgn_cert_enum: AvCmHsgnCertEnum;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmDecryptAndVerifySign(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   var hsgn_cert_enum: AvCmHsgnCertEnum;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ��������� ���������� �������� ������� ����������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetObjectInfo: function(
      handle: AvCmHandle;
      param_id: AvCmLong;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetObjectInfo(
   handle: AvCmHandle;
   param_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� �������� ����� �������;
// ������������ ���������� ������������ ������� ����������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmDuplicateHandle: function(
      source_handle: AvCmHandle;
      dest_hc: AvCmHc;
      var copy_of_handle: AvCmHandle;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmDuplicateHandle(
   source_handle: AvCmHandle;
   dest_hc: AvCmHc;
   var copy_of_handle: AvCmHandle;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� �������� ����������� ������� ����������;
// ����������� � ���������� ������ �� ������� ����������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmCloseHandle: function(
      handle: AvCmHandle;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmCloseHandle(
   handle: AvCmHandle;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� �������� ��� �������� � ������� ������������
// ��� �������������� ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmOpenMsg: function(
      hc: AvCmHc;
      message_data: pointer;
      message_size: AvCmSize;
      var hmsg: AvCmHmsg;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmOpenMsg(
   hc: AvCmHc;
   message_data: pointer;
   message_size: AvCmSize;
   var hmsg: AvCmHmsg;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ��������� ���������� ��������� ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetMsgParam: function(
      hmsg: AvCmHmsg;
      attr_id: AvCmLong;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetMsgParam(
   hmsg: AvCmHmsg;
   attr_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ��������� ������� ��� ����������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgSign: function(
      hmsg: AvCmHmsg;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmMsgSign(
   hmsg: AvCmHmsg;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� �������� ������� � �������� ����������� ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgVerifySign: function(
      hmsg: AvCmHmsg;
      hcert: AvCmHcert;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmMsgVerifySign(
   hmsg: AvCmHmsg;
   hcert: AvCmHcert;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������ ��������� ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgEncrypt: function(
      hmsg: AvCmHmsg;
      cert_count: AvCmLong;
      certificates: PAvCmHcert;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmMsgEncrypt(
   hmsg: AvCmHmsg;
   cert_count: AvCmLong;
   certificates: PAvCmHcert;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ��������� �������������� ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgDecrypt: function(
      hmsg: AvCmHmsg;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmMsgDecrypt(
   hmsg: AvCmHmsg;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ��������� ���������������� ���������
// � ����� �� �������������� ��������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetMsg: function(
      hmsg: AvCmHmsg;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetMsg(
   hmsg: AvCmHmsg;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ���������� ����������� ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetMsgContent: function(
      hmsg: AvCmHmsg;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetMsgContent(
   hmsg: AvCmHmsg;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ���������� ����� �� �������� ������� ������������ ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetMsgSign: function(
      hmsg: AvCmHmsg;
      sign_number: AvCmLong;
      var hsign: AvCmHsign;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetMsgSign(
   hmsg: AvCmHmsg;
   sign_number: AvCmLong;
   var hsign: AvCmHsign;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ���������� ��������� �������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetSignAttr: function(
      handle: AvCmHandle;
      attr_id: AvCmLong;
      attr_param: pointer;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetSignAttr(
   handle: AvCmHandle;
   attr_id: AvCmLong;
   attr_param: pointer;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������ ����������� �� ��� �������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmFindCertBySign: function(
      hsign: AvCmHsign;
      var hcert: AvCmHcert;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmFindCertBySign(
   hsign: AvCmHsign;
   var hcert: AvCmHcert;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ���������� ��������� �����������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetCertAttr: function(
      handle: AvCmHandle;
      attr_id: AvCmLong;
      attr_param: pointer;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetCertAttr(
   handle: AvCmHandle;
   attr_id: AvCmLong;
   attr_param: pointer;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� �������� ��������� ������ ����������� �����
// �������� ������������ ������������;
// ��������������� ������������ ��������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmOpenCertEnum: function(
      hc: AvCmHc;
      param_count: AvCmLong;
      params: PAvCmEnumGetParam;
      var hcert_enum: AvCmHcertEnum;
      flags: AvCmLong): AvCmResult; stdcall;
   _AvCmOpenCertEnum: function(
      hc: AvCmHc;
      param_count: AvCmLong;
      params: PAvCmEnumGetParam;
      var hcert_enum: AvCmHcertEnum;
      flags: AvCmLong): AvCmResult; stdcall;

   {$ELSE}
function AvCmOpenCertEnum(
   hc: AvCmHc;
   param_count: AvCmLong;
   params: PAvCmEnumGetParam;
   var hcert_enum: AvCmHcertEnum;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� �������� �������� � �������� ������������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmEnumGet: function(
      henum: AvCmHenum;
      var handle: AvCmHandle;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmEnumGet(
   henum: AvCmHenum;
   var handle: AvCmHandle;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ���������� ��������� ��������� ���������
// � �������� ������ ����� �� ������� ���������� ������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetErrorInfo: function(
      hc: AvCmHc;
      error_code: AvCmResult;
      param_id: AvCmLong;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetErrorInfo(
   hc: AvCmHc;
   error_code: AvCmResult;
   param_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ��������� ����������� ���������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmSetMsgContent: function(
      hmsg: AvCmHmsg;
      input_buffer: PByte;
      input_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmSetMsgContent(
   hmsg: AvCmHmsg;
   input_buffer: PByte;
   input_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������� �������� ���������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmEnumDlg: function(
      Hc: AvCmHc;
      cpszDlgCaption: PAnsiChar;
      cpszLabel: PAnsiChar;
      cpszOkButtonCaption: PAnsiChar;
      var henum: AvCmHenum;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmEnumDlg(
   Hc: AvCmHc;
   cpszDlgCaption: PAnsiChar;
   cpszLabel: PAnsiChar;
   cpszOkButtonCaption: PAnsiChar;
   var henum: AvCmHenum;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ���������� ����������� � ���������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgAddCert: function(
      hmsg: AvCmHMsg;
      cert_count: AvCmLong;
      const certificates: PAvCmHandle;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmMsgAddCert(
   hmsg: AvCmHMsg;
   cert_count: AvCmLong;
   const certificates: PAvCmHandle;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������� ������������ �� ���������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgImportCerts: function(
      HMsg: AvCmHMsg;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmMsgImportCerts(
   HMsg: AvCmHMsg;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ��������� ���-�������
// deprecated
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgGetSTBSign: function(
      HMsg: AvCmHMsg;
      pBuffer: Pointer;
      var pBufferSize: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmMsgGetSTBSign(
   HMsg: AvCmHMsg;
   pBuffer: Pointer;
   var pBufferSize: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������ ���������� �� �������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmShowObjectInfo: function(
      handle: AvCmHandle;
      const cpszDlgCaption: PChar;
      const cpszLabel: PChar;
      const cpszOkButtonCaption: PChar;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmShowObjectInfo(
   handle: AvCmHandle;
   const cpszDlgCaption: PChar;
   const cpszLabel: PChar;
   const cpszOkButtonCaption: PChar;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}

// ������� ������ ���������� �� �������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmShowObjectInfoExt: function(
      handle: AvCmHandle;
      h: HWND; var handle2: AvCmHandle;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmShowObjectInfoExt(
      handle: AvCmHandle;
      h: HWND; var handle2: AvCmHandle;
      flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ���������� ������������ � ��������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmEnumAddCerts: function(
      hcert_enum: AvCmHcertEnum;
      param_count: AvCmLong;
      const params: PAvCmEnumGetParam;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmEnumAddCerts(
   hcert_enum: AvCmHcertEnum;
   param_count: AvCmLong;
   const params: PAvCmEnumGetParam;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� �������� ������� � �������� ����������� ��������� �� ������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgVerifySignAtIndex: function(
      hmsg: AvCmHMsg;
      sign_index: AvCmLong;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmMsgVerifySignAtIndex(
   hmsg: AvCmHMsg;
   sign_index: AvCmLong;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������������� ���������� � ��������� �������� ��������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmInitEx: function(
      const cpszWorkDir: PChar;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmInitEx(
   const cpszWorkDir: PChar;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� �������� ���������� ���������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmOpenInnerMsg: function(
      hmsg: AvCmHMsg;
      var hmsg_inner: AvCmHMsg;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmOpenInnerMsg(
   hmsg: AvCmHMsg;
   var hmsg_inner: AvCmHMsg;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGenerateSymmetricKey: function(
      Hc: AvCmHc;
      const cpKeyAlgOid: PChar;
      output_buffer: pointer;
      var output_size: AvCmSize): AvCmResult; stdcall;
   {$ELSE}
function AvCmGenerateSymmetricKey(
   Hc: AvCmHc;
   const cpKeyAlgOid: PChar;
   output_buffer: pointer;
   var output_size: AvCmSize): AvCmResult; stdcall;
{$ENDIF}


{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmDecryptSymmetricKey: function(
      Hc: AvCmHc;
      cpEncryptedBlob: pointer;
      output_buffer: pointer;
      input_size: AvCmSize;
      var output_size: AvCmSize): AvCmResult; stdcall;
   {$ELSE}
function AvCmDecryptSymmetricKey(
   Hc: AvCmHc;
   cpEncryptedBlob: pointer;
   output_buffer: pointer;
   input_size: AvCmSize;
   var output_size: AvCmSize): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ��� ��������� ������� �� ����������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGenerateRequest: function(
      Hc: AvCmHc;
      param_count: AvCmLong;
      const params: PAvCmGenReqParam;
      var hreq: AvCmHreq;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGenerateRequest(
   Hc: AvCmHc;
   param_count: AvCmLong;
   const params: PAvCmGenReqParam;
   var hreq: AvCmHreq;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ��� ���������� ��������� ������� �� ����������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetRequestAttr: function(
      hreq: AvCmHreq;
      attr_id: AvCmLong;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetRequestAttr(
   hreq: AvCmHreq;
   attr_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ��� ������ � �������� ������� �� ����������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmFindRequest: function(
      Hc: AvCmHc;
      param_count: AvCmLong;
      const params: PAvCmFindReqParam;
      var hreq: AvCmHreq;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmFindRequest(
   Hc: AvCmHc;
   param_count: AvCmLong;
   const params: PAvCmFindReqParam;
   var hreq: AvCmHreq;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ��� ������ � �������� ������ ���������� ������������ � ������������ ������������/���.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmFindCrl: function(
      Hc: AvCmHc;
      param_count: AvCmLong;
      const params: PAvCmFindCrlParam;
      var hcrl: AvCmHcrl;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmFindCrl(
   Hc: AvCmHc;
   param_count: AvCmLong;
   const params: PAvCmFindCrlParam;
   var hcrl: AvCmHcrl;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ��� ���������� ��������� ������ ���������� ������������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetCrlAttr: function(
      hcrl: AvCmHcrl;
      attr_id: AvCmLong;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetCrlAttr(
   hcrl: AvCmHcrl;
   attr_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� AvCmImport ������������� ��� ������� ����������� ��� ������ ���������� ������������
// � ��������������� ����������� ������������/���.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmImport: function(
      Hc: AvCmHc;
      obj_type: AvCmLong;
      input_data: pointer;
      input_size: AvCmSize;
      param_count: AvCmLong;
      const params: PAvCmImportParam;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmImport(
   Hc: AvCmHc;
   obj_type: AvCmLong;
   input_data: pointer;
   input_size: AvCmSize;
   param_count: AvCmLong;
   const params: PAvCmImportParam;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ��� ��������� �����������, ������������ �� ��������� � ���������� ������������.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmPutCert: function(
      handle: AvCmHandle;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmPutCert(
   handle: AvCmHandle;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmSignRawData: function(
      Hc: AvCmHc;
      const hash_and_sign_oid: PChar;
      const data: pointer;
      data_size: AvCmSize;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmSignRawData(
   Hc: AvCmHc;
   const hash_and_sign_oid: PChar;
   const data: pointer;
   data_size: AvCmSize;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ��� �������� ������� �����������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmVerifyCertStatus: function(
      handle: AvCmHandle;
      param_count: AvCmLong;
      const params: PAvCmCertStatParam;
      var status_ok: AvCmLong;
      var hstatus: AvCmHcertstat;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmVerifyCertStatus(
   handle: AvCmHandle;
   param_count: AvCmLong;
   const params: PAvCmCertStatParam;
   var status_ok: AvCmLong;
   var hstatus: AvCmHcertstat;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� ��� ��������� ������ ������� �����������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmGetCertStatusAttr: function(
      hstatus: AvCmHcertstat;
      attr_id: AvCmLong;
      output_buffer: pointer;
      var output_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmGetCertStatusAttr(
   hstatus: AvCmHcertstat;
   attr_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


//������� ������������� ��� �������� ���
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmVerifyRawDataSign: function(
      hcert: AvCmHcert;
      hash_and_sign_oid: PChar;
      data_to_be_verified: pointer;
      data_size: AvCmSize;
      sign_value: pointer;
      sign_size: AvCmSize;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmVerifyRawDataSign(
   hcert: AvCmHcert;
   hash_and_sign_oid: PChar;
   data_to_be_verified: pointer;
   data_size: AvCmSize;
   sign_value: pointer;
   sign_size: AvCmSize;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


//������� ��������� ����������� ����������
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmSetActiveWindow: function(
      hwnd: hwnd;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmSetActiveWindow(
   hwnd: hwnd;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������� �����
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmSignFile: function(
      hc: AvCmHc;
      inFileName: PChar;
      outFileName: PChar;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmSignFile(
   hc: AvCmHc;
   inFileName: PChar;
   outFileName: PChar;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� �������� ������� �����
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmVerifyFile: function(
      hc: AvCmHc;
      inFileName: PChar;
      outFileName: PChar;
      dataFileName: PChar;
      var sign: AvCmHsign;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmVerifyFile(
   hc: AvCmHc;
   inFileName: PChar;
   outFileName: PChar;
   dataFileName: PChar;
   var sign: AvCmHsign;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������ �����
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmEncryptFile: function(
      hc: AvCmHc;
      inFileName: PChar;
      outFileName: PChar;
      CompressionLevel: AvCmLong;
      cert_count: AvCmLong;
      certificates: pointer;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmEncryptFile(
   hc: AvCmHc;
   inFileName: PChar;
   outFileName: PChar;
   CompressionLevel: AvCmLong;
   cert_count: AvCmLong;
   certificates: pointer;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// ������� ������������� �����
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmDecryptFile: function(
      hc: AvCmHc;
      inFileName: PChar;
      outFileName: PChar;
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmDecryptFile(
   hc: AvCmHc;
   inFileName: PChar;
   outFileName: PChar;
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}

{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgUpdate: function(
   hmsg: AvCmHmsg;
   in_data: pointer;//PByte;
   in_size: AvCmSize;
   var out_data: PByte;
   var out_size: AvCmSize;
   flags: AvCmLong): AvCmResult;
   stdcall;
   {$ELSE}
function AvCmMsgUpdate(
   hmsg: AvCmHmsg;
   in_data: pointer; //PByte;
   in_size: AvCmSize;
   var out_data: PByte;
   var out_size: AvCmSize;
   flags: AvCmLong): AvCmResult;
   stdcall;
{$ENDIF}

{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgVerifySignAtIndexForDate: function(
   hmsg: AvCmHmsg;
   sign_index: AvCmLong;
   pDate: PSystemTime;
   flags: AvCmLong): AvCmResult;
   stdcall;
   {$ELSE}
Function AvCmMsgVerifySignAtIndexForDate(
   hmsg: AvCmHmsg;
   sign_index: AvCmLong;
   pDate: PSystemTime;
   flags: AvCmLong): AvCmResult;
   stdcall;
{$ENDIF}

{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
  AvCmMsgSetAttribute: function(
  h: AvCmHandle;
  attr_id: AvCmLong;
  attr_param: pointer;
  input_buffer: pointer;
  input_size: AvCmSize;
  flags: AvCmLong): AvCmResult;
  stdcall;
{$ELSE}
Function AvCmMsgSetAttribute(
  h: AvCmHandle;
  attr_id: AvCmLong;
  attr_param: pointer;
  input_buffer: pointer;
  input_size: AvCmSize;
  flags: AvCmLong): AvCmResult;
  stdcall;
{$ENDIF}

{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
  AvCmCheckCrlDP: function(
    hc: AvCmHc;
    CrlDPPath: PAnsiChar;
    flags: AvCmLong): AvCmResult;  stdcall;
{$ELSE}
function AvCmCheckCrlDP(
  hc: AvCmHc;
  CrlDPPath: PAnsiChar;
  flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}

{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
AvCmOpenCert: function(
  hc: AvCmHc;
  input_data: Pointer;
  input_size: AvCmSize;
  var handle: AvCmHandle;
  flags: DWORD): AvCmResult; stdcall;
AvCmOpenCRL: function(
  hc: AvCmHc;
  input_data: Pointer;
  input_size: AvCmSize;
  var handle: AvCmHandle;
  flags: DWORD): AvCmResult; stdcall;
AvCmCheckCondition: function(
  handle: AvCmHandle;
  Condition: PAnsiChar;
  flags: DWORD): AvCmResult; stdcall;

{$ELSE}
Function AvCmOpenCert(
  hc: AvCmHc;
  input_data: Pointer;
  input_size: AvCmSize;
  var handle: AvCmHandle;
  flags: DWORD): AvCmResult; stdcall;
Function AvCmOpenCRL(
  hc: AvCmHc;
  input_data: Pointer;
  input_size: AvCmSize;
  var handle: AvCmHandle;
  flags: DWORD): AvCmResult; stdcall;
function AvCmCheckCondition(
  handle: AvCmHandle;
  Condition: PAnsiChar;
  flags: DWORD): AvCmResult; stdcall;
{$ENDIF}

{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmMsgOCSPAddResponse: function(
   hmsg: AvCmHmsg;
   sign_index: AvCmLong;
   hr: AvCmHandle;
   flags: AvCmLong): AvCmResult;
   stdcall;

var
  AvCmMsgOCSPGetResponseAttr: function(
  hr: AvCmHandle;
  attr_id: AvCmLong;
  attr_param: pointer;
  output_buffer: pointer;
  var output_size: AvCmLong;
  flags: AvCmLong): AvCmResult;
  stdcall;

var
  AvCmMsgOCSPGetResponse: function(
  handle: AvCmHandle;
  id: AvCmLong;
  var hr: AvCmHOCSP;
  flags: AvCmLong): AvCmResult;
  stdcall;

{$ELSE}
Function AvCmMsgOCSPAddResponse(
  handle: AvCmHandle;
  sign_index: AvCmLong;
  hr: AvCmHandle;
  flags: AvCmLong): AvCmResult; stdcall;

Function AvCmMsgOCSPGetResponseAttr(
  hr: AvCmHOCSP;
  attr_id: AvCmLong;
  attr_param: pointer;
  output_buffer: pointer;
  var output_size: AvCmSize;
  flags: AvCmLong): AvCmResult; stdcall;

Function AvCmMsgOCSPGetResponse(
  handle: AvCmHandle;
  id: AvCmLong;
  var hr: AvCmHOCSP;
  flags: AvCmLong): AvCmResult; stdcall;

{$ENDIF}

{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
AvCmCreateScep: function(
  hc: AvCmHc;
  URL: PAnsiChar;
  var hs: AvCmHandle;
  flags: AvCmLong): AvCmResult; stdcall;
AvCmScepSet: function(
  hs: AvCmHandle;
  param_id: AvCmLong;
  in_data: Pointer;
  in_size: AvCmSize;
  flags: AvCmLong): AvCmResult; stdcall;
AvCmScepGet: function(
  hs: AvCmHandle;
  param_id: AvCmLong;
  param_spec: Pointer;
  out_data: Pointer;
  var out_size: AvCmSize;
  flags: AvCmLong): AvCmResult; stdcall;
AvCmScepExecute: function(
  hs: AvCmHandle;
  oper_id: AvCmLong;
  flags: AvCmLong): AvCmResult; stdcall;
AvCmOpenEnum: function(
  hc: AvCmHc;
  CryptSQL: Pointer;
  var hcert_enum:
  AvCmHcertEnum;
  ObjType,
  flags: AvCmLong): AvCmResult; stdcall;

{$ELSE}
Function AvCmCreateScep(
  hc: AvCmHc;
  URL: PAnsiChar;
  var hs: AvCmHandle;
  flags: AvCmLong): AvCmResult; stdcall;
Function AvCmScepSet(
  hs: AvCmHandle;
  param_id: AvCmLong;
  in_data: Pointer;
  in_size: AvCmSize;
  flags: AvCmLong): AvCmResult; stdcall;
Function AvCmScepGet(
  hs: AvCmHandle;
  param_id: AvCmLong;
  param_spec: Pointer;
  out_data: Pointer;
  var out_size: AvCmSize;
  flags: AvCmLong): AvCmResult; stdcall;
Function AvCmScepExecute(
  hs: AvCmHandle;
  oper_id: AvCmLong;
  flags: AvCmLong): AvCmResult; stdcall;

function AvCmOpenEnum(
  hc: AvCmHc;
  CryptSQL: Pointer;
  var hcert_enum: AvCmHcertEnum;
  ObjType, flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}

{$IFDEF AVCRYPTMAIL_DYNAMIC}
AvCmTLSCreateConnect: Function(hc: AvCmHandle; conn_param_count: AvCmLong; conn_params: PAvCmConnectionParam; var htls: AvCmHandle; flags: AvCmLong): AvCmResult; stdcall;
AvCmTlsGet: Function(htsl: AvCmHandle; URL: PAnsiChar; var res_data: PByte; var res_size: AvCmLong; flags: AvCmLong): AvCmResult; stdcall;
AvCmTlsPost: Function(htsl: AvCmHandle; URL: PAnsiChar; data: PByte; data_size: AvCmLong; var res_data: PByte; var res_size: AvCmLong; flags: AvCmLong): AvCmResult; stdcall;
AvCmDebugLog: Function (App, msg, rem: PAnsiChar; flags: AvCmLong): AvCmResult; stdcall;

{$ELSE}
Function AvCmTLSCreateConnect(hc: AvCmHandle; conn_param_count: AvCmLong; conn_params: PAvCmConnectionParam; var htls: AvCmHandle; flags: AvCmLong): AvCmResult; stdcall;
Function AvCmTlsGet(htsl: AvCmHandle; URL: PAnsiChar; var res_data: PByte; var res_size: AvCmLong; flags: AvCmLong): AvCmResult; stdcall;
Function AvCmTlsPost(htsl: AvCmHandle; URL: PAnsiChar; data: PByte; data_size: AvCmLong; var res_data: PByte; var res_size: AvCmLong; flags: AvCmLong): AvCmResult; stdcall;
Function AvCmDebugLog(App, msg, rem: PAnsiChar; flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}

{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   DLLLoaded: boolean { is DLL (dynamically) loaded already? }
   = false;
   DLLHandle: THandle = 0;
   CurVersion: String;
procedure LoadAvCryptMailDLL(LibraryName: String);
procedure FreeAvCryptMailDLL;
Function AvCryptMailDLLPath: String;
{$ENDIF}

function FileVersion(FileName: string): string;
function GetWinError(ecode: HRESULT): AnsiString;

//////////////////////////////////////////////////////////////////////////////
implementation

uses SysUtils;

function GetFileVersion(FileName: string; var VerInfo: TVSFixedFileInfo): boolean;
var
  InfoSize, puLen: DWORD;
  Pt, InfoPtr: Pointer;
begin
  InfoSize := GetFileVersionInfoSize(PChar(FileName), puLen);
  FillChar(VerInfo, SizeOf(TVSFixedFileInfo), 0);
  if InfoSize > 0 then begin
     GetMem(Pt,InfoSize);
     GetFileVersionInfo(PChar(FileName), 0, InfoSize, Pt);
     VerQueryValue(Pt,'\',InfoPtr,puLen);
     Move(InfoPtr^, VerInfo, sizeof(TVSFixedFileInfo));
     FreeMem(Pt);
     Result := True;
  end  else
    Result := False;
end;

function GetWinError(ecode: HRESULT): AnsiString;
var
   message_buffer: pointer;
begin
  message_buffer := nil;

  FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_ALLOCATE_BUFFER
      or FORMAT_MESSAGE_IGNORE_INSERTS or FORMAT_MESSAGE_MAX_WIDTH_MASK,
      nil, ecode, MAKELANGID(LANG_NEUTRAL, SUBLANG_SYS_DEFAULT),
      @message_buffer, 0, nil );

  if message_buffer <> nil then begin
     result := AnsiString(PAnsiChar(message_buffer));
     LocalFree(HLOCAL(message_buffer));
   end else
     result := '';
end;


function FileVersion(FileName: string): string;
var
    VerInfo: TVSFixedFileInfo;
begin
  if GetFileVersion(FileName, VerInfo) then
     Result := Format('%u.%u.%u.%u',[HiWord(VerInfo.dwProductVersionMS), LoWord(VerInfo.dwProductVersionMS),
               HiWord(VerInfo.dwProductVersionLS), LoWord(VerInfo.dwProductVersionLS)])
  else
     Result := '0.0.0.0';
end;


{$IFNDEF AVCRYPTMAIL_DYNAMIC}

function AvCmSetWorkDir(
   WorkDir: PChar): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// ������������� ����������.

function AvCmInit(
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ����������� ������������.

function AvCmLogin(
   conn_param_count: AvCmLong;
   conn_params: PAvCmConnectionParam;
   var hc: AvCmHc;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ���������� ������������

function AvCmLogout(
   hc: AvCmHc;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


function AvCmFlush(
   hc: AvCmHc;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// ������� ��������� ������������ ���������.

function AvCmSign(
   hc: AvCmHandle;
   input_message: pointer;
   input_size: AvCmSize;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� �������� ������� � ��������� ��������� ���������.

function AvCmVerifySign(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   var hsgn_cert_enum: AvCmHsgnCertEnum;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ������������ ���������.

function AvCmEncrypt(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   cert_count: AvCmLong;
   certificates: PAvCmHcert;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ������������� ����������� �������������� ���������.

function AvCmDecrypt(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ��������� ������������ ��������� � ����������� ��� �������������.

function AvCmSignAndEncrypt(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   cert_count: AvCmLong;
   certificates: PAvCmHcert;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ������������� ��������� � ����������� ��������� �������;
// � ��������� ��������� ���������

function AvCmDecryptAndVerifySign(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   var hsgn_cert_enum: AvCmHsgnCertEnum;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ��������� ���������� �������� ������� ����������.

function AvCmGetObjectInfo(
   handle: AvCmHandle;
   param_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� �������� ����� �������;
// ������������ ���������� ������������ ������� ����������.

function AvCmDuplicateHandle(
   source_handle: AvCmHandle;
   dest_hc: AvCmHc;
   var copy_of_handle: AvCmHandle;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� �������� ����������� ������� ����������;
// ����������� � ���������� ������ �� ������� ����������

function AvCmCloseHandle(
   handle: AvCmHandle;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� �������� ��� �������� � ������� ������������
// ��� �������������� ���������.

function AvCmOpenMsg(
   hc: AvCmHc;
   message_data: pointer;
   message_size: AvCmSize;
   var hmsg: AvCmHmsg;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ��������� ���������� ��������� ���������.

function AvCmGetMsgParam(
   hmsg: AvCmHmsg;
   attr_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ��������� ������� ��� ����������.

function AvCmMsgSign(
   hmsg: AvCmHmsg;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� �������� ������� � �������� ����������� ���������.

function AvCmMsgVerifySign(
   hmsg: AvCmHmsg;
   hcert: AvCmHcert;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ������������ ��������� ���������.

function AvCmMsgEncrypt(
   hmsg: AvCmHmsg;
   cert_count: AvCmLong;
   certificates: PAvCmHcert;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ������������� ��������� �������������� ���������.

function AvCmMsgDecrypt(
   hmsg: AvCmHmsg;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ��������� ���������������� ���������
// � ����� �� �������������� ��������.

function AvCmGetMsg(
   hmsg: AvCmHmsg;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ���������� ����������� ���������.

function AvCmGetMsgContent(
   hmsg: AvCmHmsg;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ���������� ����� �� �������� ������� ������������ ���������.

function AvCmGetMsgSign(
   hmsg: AvCmHmsg;
   sign_number: AvCmLong;
   var hsign: AvCmHsign;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ���������� ��������� �������.

function AvCmGetSignAttr(
   handle: AvCmHandle;
   attr_id: AvCmLong;
   attr_param: pointer;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ������ ����������� �� ��� �������.

function AvCmFindCertBySign(
   hsign: AvCmHsign;
   var hcert: AvCmHcert;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ���������� ��������� �����������.

function AvCmGetCertAttr(
   handle: AvCmHandle;
   attr_id: AvCmLong;
   attr_param: pointer;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� �������� ��������� ������ ����������� �����
// �������� ������������ ������������;
// ��������������� ������������ ��������.

function AvCmOpenCertEnum(
   hc: AvCmHc;
   param_count: AvCmLong;
   params: PAvCmEnumGetParam;
   var hcert_enum: AvCmHcertEnum;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� �������� �������� � �������� ������������.

function AvCmEnumGet(
   henum: AvCmHenum;
   var handle: AvCmHandle;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ���������� ��������� ��������� ���������
// � �������� ������ ����� �� ������� ���������� ������.

function AvCmGetErrorInfo(
   hc: AvCmHc;
   error_code: AvCmResult;
   param_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� �������� ���� � ������� ��������� ���;
// ���������� �� ������� AvCmGetSignAttr.

function AvCmCheckDate(
   test_date: SYSTEMTIME;
   sign_date_time: SYSTEMTIME;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// ������� ��������� ����������� ���������.

function AvCmSetMsgContent(
   hmsg: AvCmHmsg;
   input_buffer: PByte;
   input_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// ������� ������� �������� ���������

function AvCmEnumDlg(Hc: AvCmHc; //Wnd: HWnd;
   cpszDlgCaption, cpszLabel, cpszOkButtonCaption: PAnsiChar; var henum:
   AvCmHenum; flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ���������� ����������� � ���������

function AvCmMsgAddCert(
   hmsg: AvCmHMsg;
   cert_count: AvCmSize;
   const certificates: PAvCmHandle;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// ������� ������� ������������ �� ���������

function AvCmMsgImportCerts(
   HMsg: AvCmHMsg;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ��������� ���-�������

function AvCmMsgGetSTBSign(
   HMsg: AvCmHMsg;
   pBuffer: Pointer;
   var pBufferSize: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ������ ���������� �� �������

function AvCmShowObjectInfo(
   handle: AvCmHandle;
   const cpszDlgCaption: PChar;
   const cpszLabel: PChar;
   const cpszOkButtonCaption: PChar;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� ������ ���������� �� �������
function AvCmShowObjectInfoExt(
      handle: AvCmHandle;
      h: HWND; var handle2: AvCmHandle;
      flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// ������� ���������� ������������ � ��������

function AvCmEnumAddCerts(
   hcert_enum: AvCmHcertEnum;
   param_count: AvCmLong;
   const params: PAvCmEnumGetParam;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� �������� ������� � �������� ����������� ��������� �� ������

function AvCmMsgVerifySignAtIndex(
   hmsg: AvCmHMsg;
   sign_index: AvCmLong;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������������� ���������� � ��������� �������� ��������.

function AvCmInitEx(
   const cpszWorkDir: PChar;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// ������� �������� ���������� ���������

function AvCmOpenInnerMsg(
   hmsg: AvCmHMsg;
   var hmsg_inner: AvCmHMsg;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

function AvCmGenerateSymmetricKey(
   Hc: AvCmHc;
   const cpKeyAlgOid: PChar;
   output_buffer: pointer;
   var output_size: AvCmSize): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

function AvCmDecryptSymmetricKey(
   Hc: AvCmHc;
   cpEncryptedBlob: pointer;
   output_buffer: pointer;
   input_size: AvCmSize;
   var output_size: AvCmSize): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

function AvCmGenerateRequest(
   Hc: AvCmHc;
   param_count: AvCmLong;
   const params: PAvCmGenReqParam;
   var hreq: AvCmHreq;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

function AvCmGetRequestAttr(
   hreq: AvCmHreq;
   attr_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

function AvCmFindRequest(
   Hc: AvCmHc;
   param_count: AvCmLong;
   const params: PAvCmFindReqParam;
   var hreq: AvCmHreq;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

function AvCmFindCrl(
   Hc: AvCmHc;
   param_count: AvCmLong;
   const params: PAvCmFindCrlParam;
   var hcrl: AvCmHcrl;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

function AvCmGetCrlAttr(
   hcrl: AvCmHcrl;
   attr_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

function AvCmImport(
   Hc: AvCmHc;
   obj_type: AvCmLong;
   input_data: pointer;
   input_size: AvCmSize;
   param_count: AvCmLong;
   const params: PAvCmImportParam;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

function AvCmPutCert(
   handle: AvCmHandle;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

function AvCmSignRawData(
   Hc: AvCmHc;
   const hash_and_sign_oid: PChar;
   const data: pointer;
   data_size: AvCmSize;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

// ������� ������������� ��� �������� ������� �����������

function AvCmVerifyCertStatus(
   handle: AvCmHandle;
   param_count: AvCmLong;
   const params: PAvCmCertStatParam;
   var status_ok: AvCmLong;
   var hstatus: AvCmHcertstat;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

// ������� ������������� ��� ��������� ������ ������� �����������

function AvCmGetCertStatusAttr(
   hstatus: AvCmHcertstat;
   attr_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

//������� ������������� ��� �������� ���

function AvCmVerifyRawDataSign(
   hcert: AvCmHcert;
   hash_and_sign_oid: PChar;
   data_to_be_verified: pointer;
   data_size: AvCmSize;
   sign_value: pointer;
   sign_size: AvCmSize;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';
   
function AvCmSetActiveWindow(
   hwnd: hwnd;
   flags: AvCmLong): AvCmResult;
   stdcall; external 'AvCryptMail.dll';


function AvCmSignFile(
   hc: AvCmHc;
   inFileName: PChar;
   outFileName: PChar;
   flags: AvCmLong): AvCmResult;
   stdcall; external 'AvCryptMail.dll';

function AvCmVerifyFile(
   hc: AvCmHc;
   inFileName: PChar;
   outFileName: PChar;
   dataFileName: PChar;
   var sign: AvCmHsign;
   flags: AvCmLong): AvCmResult;
   stdcall; external 'AvCryptMail.dll';

function AvCmEncryptFile(
   hc: AvCmHc;
   inFileName: PChar;
   outFileName: PChar;
   CompressionLevel: AvCmLong;
   cert_count: AvCmLong;
   certificates: pointer;
   flags: AvCmLong): AvCmResult;
   stdcall; external 'AvCryptMail.dll';

function AvCmDecryptFile(
   hc: AvCmHc;
   inFileName: PChar;
   outFileName: PChar;
   flags: AvCmLong): AvCmResult;
   stdcall; external 'AvCryptMail.dll';

Function AvCmMsgUpdate(
   hmsg: AvCmHmsg;
   in_data: pointer;//PByte;
   in_size: AvCmSize;
   var out_data: PByte;
   var out_size: AvCmSize;
   flags: AvCmLong): AvCmResult;
   stdcall; external 'AvCryptMail.dll';

Function AvCmMsgVerifySignAtIndexForDate(
   hmsg: AvCmHmsg;
   sign_index: AvCmLong;
   pDate: PSystemTime;
   flags: AvCmLong): AvCmResult;
   stdcall; external 'AvCryptMail.dll';

Function AvCmMsgSetAttribute(
  h: AvCmHandle;
  attr_id: AvCmLong;
  attr_param: pointer;
  input_buffer: pointer;
  input_size: AvCmSize;
  flags: AvCmLong): AvCmResult;
  stdcall; external 'AvCryptMail.dll';

function AvCmCheckCrlDP(
  hc: AvCmHc;
  CrlDPPath: PAnsiChar;
  flags: AvCmLong): AvCmResult;
  stdcall; external 'AvCryptMail.dll';

Function AvCmOpenCert(
  hc: AvCmHc;
  input_data: Pointer;
  input_size: AvCmSize;
  var handle: AvCmHandle;
  flags: DWORD): AvCmResult; stdcall; external 'AvCryptMail.dll';
Function AvCmOpenCRL(
  hc: AvCmHc;
  input_data: Pointer;
  input_size: AvCmSize;
  var handle: AvCmHandle;
  flags: DWORD): AvCmResult; stdcall; external 'AvCryptMail.dll';
function AvCmCheckCondition(
  handle: AvCmHandle;
  Condition: PAnsiChar;
  flags: DWORD): AvCmResult; stdcall; external 'AvCryptMail.dll';

Function AvCmMsgOCSPAddResponse(
  handle: AvCmHandle;
  sign_index: AvCmLong;
  hr: AvCmHandle;
  flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';

Function AvCmMsgOCSPGetResponseAttr(
  hr: AvCmHOCSP;
  attr_id: AvCmLong;
  attr_param: pointer;
  output_buffer: pointer;
  var output_size: AvCmSize;
  flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';

Function AvCmMsgOCSPGetResponse(
  handle: AvCmHandle;
  id: AvCmLong;
  var hr: AvCmHOCSP;
  flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';

Function AvCmCreateScep(
  hc: AvCmHc;
  URL: PAnsiChar;
  var hs: AvCmHandle;
  flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';

Function AvCmScepSet(
  hs: AvCmHandle;
  param_id: AvCmLong;
  in_data: Pointer;
  in_size: AvCmSize;
  flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';

Function AvCmScepGet(
  hs: AvCmHandle;
  param_id: AvCmLong;
  param_spec: Pointer;
  out_data: Pointer;
  var out_size: AvCmSize;
  flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';

Function AvCmScepExecute(
  hs: AvCmHandle;
  oper_id: AvCmLong;
  flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';

function AvCmOpenEnum(
  hc: AvCmHc;
  CryptSQL: Pointer;
  var hcert_enum: AvCmHcertEnum;
  ObjType, flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';


{Function AvCmXMLOpen(hc: AvCmHandle; in_data: Pointer; in_size: AvCmLong; var hmsg: AvCmHandle; flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';
Function AvCmXMLSign(hx: AvCmHandle; flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';
Function AvCmXMLGetAttr(hx: AvCmHandle; attr_id: AvCmLong; attr_param: pointer; output_data: Pointer; var output_size: AvCmLong; flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';
Function AvCmXMLVerifySignByID(hx: AvCmHandle; id: AvCmLong; flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';}

Function AvCmTLSCreateConnect(hc: AvCmHandle; conn_param_count: AvCmLong; conn_params: PAvCmConnectionParam; var htls: AvCmHandle; flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';
Function AvCmTlsGet(htsl: AvCmHandle; URL: PAnsiChar; var res_data: PByte; var res_size: AvCmLong; flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';
Function AvCmTlsPost(htsl: AvCmHandle; URL: PAnsiChar; data: PByte; data_size: AvCmLong; var res_data: PByte; var res_size: AvCmLong; flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';

Function AvCmDebugLog(App, msg, rem: PAnsiChar; flags: AvCmLong): AvCmResult; stdcall; external 'AvCryptMail.dll';

{$ENDIF}

{$IFDEF AVCRYPTMAIL_DYNAMIC}

var
   SaveExit: pointer;
   SupportACert: boolean = False;

Function _AvCmPrm3(p1, p2, p3: Pointer): AvCmResult; stdcall;
Begin
  Result := AVCMR_NOT_IMPLEMENTED;
End;

Function _AvCmPrm4(p1, p2, p3, p4: Pointer): AvCmResult; stdcall;
Begin
  Result := AVCMR_NOT_IMPLEMENTED;
End;

Function _AvCmPrm5(p1, p2, p3, p4, p5: Pointer): AvCmResult; stdcall;
Begin
  Result := AVCMR_NOT_IMPLEMENTED;
End;

Function _AvCmPrm6(p1, p2, p3, p4, p5, p6: Pointer): AvCmResult; stdcall;
Begin
  Result := AVCMR_NOT_IMPLEMENTED;
End;

Function _AvCmPrm7(p1, p2, p3, p4, p5, p6, p7: Pointer): AvCmResult; stdcall;
Begin
  Result := AVCMR_NOT_IMPLEMENTED;
End;

Function _AvCmShowObjectInfoExt(handle: AvCmHandle; h: HWND; var handle2: AvCmHandle; flags: AvCmLong): AvCmResult; stdcall;
Begin
  Result := AvCmShowObjectInfo(handle, '', '', '', flags);
End;

Function AvCmOpenCertEnum2(hc: AvCmHc; param_count: AvCmLong; params: PAvCmEnumGetParam; var hcert_enum: AvCmHcertEnum; flags: AvCmLong): AvCmResult; stdcall;
Begin
  if not SupportACert then begin
     if (param_count >= 1) and (params.param_id = AVCM_ATTRIBUTE_CERTS) then begin
        Result := AVCMR_NOT_IMPLEMENTED;
        Exit
     end;
  end;
  Result := _AvCmOpenCertEnum(hc, param_count, params, hcert_enum, flags);
End;

procedure NewExit(); far;
begin
   ExitProc := SaveExit;
   FreeLibrary(DLLHandle)
end {NewExit};

procedure FreeAvCryptMailDLL;
begin
   ExitProc := SaveExit;
   FreeLibrary(DLLHandle);
   DLLHandle := 0;
   DLLLoaded := false;
end;


Function AvCryptMailDLLPath: String;
var
    W: DWORD;
    PA: PChar;
Begin
  Result := '';
  if DLLHandle <> 0 Then begin
     W := MAX_PATH;
     GetMem(PA, W);
     GetModuleFileName(DLLHandle, PA, W);

     if GetLongPathName(PA, PA, W) = 0 Then begin
     end;
     Result := ExtractFilePath(PA);
     FreeMem(PA);
  end;
End;

{function GetWinError(ecode: HRESULT): AnsiString;
var
   message_buffer: pointer;
begin
  message_buffer := nil;

  FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_ALLOCATE_BUFFER
      or FORMAT_MESSAGE_IGNORE_INSERTS or FORMAT_MESSAGE_MAX_WIDTH_MASK,
      nil, ecode, MAKELANGID(LANG_NEUTRAL, SUBLANG_SYS_DEFAULT),
      @message_buffer, 0, nil );

  if message_buffer <> nil then begin
     result := AnsiString(PAnsiChar(message_buffer));
     LocalFree(HLOCAL(message_buffer));
   end else
     result := '';
end;
 }

procedure LoadAvCryptMailDLL(LibraryName: String);
var
       LN: String;
       Ver: String;
begin

   if DLLLoaded then
      exit;

   LN := LibraryName;
   if LN = '' then
      LN := 'AvCryptMail.dll';

   DLLHandle := LoadLibrary(PChar(LN));

   if DLLHandle >= 32 then  begin
      Ver := FileVersion(LN);
      CurVersion := Ver;
      DLLLoaded := true;
      SaveExit := ExitProc;
      ExitProc := @NewExit;

      @AvCmInit := GetProcAddress(DLLHandle, 'AvCmInit');
      Assert(@AvCmInit <> nil);

      @AvCmLogin := GetProcAddress(DLLHandle, 'AvCmLogin');
      @AvCmLogout := GetProcAddress(DLLHandle, 'AvCmLogout');
      @AvCmFlush := GetProcAddress(DLLHandle, 'AvCmFlush');
      @AvCmSign := GetProcAddress(DLLHandle, 'AvCmSign');
      @AvCmVerifySign := GetProcAddress(DLLHandle, 'AvCmVerifySign');
      @AvCmEncrypt := GetProcAddress(DLLHandle, 'AvCmEncrypt');
      @AvCmDecrypt := GetProcAddress(DLLHandle, 'AvCmDecrypt');
      @AvCmSignAndEncrypt := GetProcAddress(DLLHandle, 'AvCmSignAndEncrypt');
      @AvCmDecryptAndVerifySign := GetProcAddress(DLLHandle, 'AvCmDecryptAndVerifySign');
      @AvCmGetObjectInfo := GetProcAddress(DLLHandle, 'AvCmGetObjectInfo');
      @AvCmDuplicateHandle := GetProcAddress(DLLHandle, 'AvCmDuplicateHandle');
      @AvCmCloseHandle := GetProcAddress(DLLHandle, 'AvCmCloseHandle');
      @AvCmOpenMsg := GetProcAddress(DLLHandle, 'AvCmOpenMsg');
      @AvCmMsgUpdate := GetProcAddress(DLLHandle, 'AvCmMsgUpdate');
      @AvCmGetMsgParam := GetProcAddress(DLLHandle, 'AvCmGetMsgParam');
      @AvCmMsgSign := GetProcAddress(DLLHandle, 'AvCmMsgSign');
      @AvCmMsgVerifySign := GetProcAddress(DLLHandle, 'AvCmMsgVerifySign');
      @AvCmMsgEncrypt := GetProcAddress(DLLHandle, 'AvCmMsgEncrypt');
      @AvCmMsgDecrypt := GetProcAddress(DLLHandle, 'AvCmMsgDecrypt');
      @AvCmGetMsg := GetProcAddress(DLLHandle, 'AvCmGetMsg');
      @AvCmGetMsgContent := GetProcAddress(DLLHandle, 'AvCmGetMsgContent');
      @AvCmSetMsgContent := GetProcAddress(DLLHandle, 'AvCmSetMsgContent');
      @AvCmGetMsgSign := GetProcAddress(DLLHandle, 'AvCmGetMsgSign');
      @AvCmGetSignAttr := GetProcAddress(DLLHandle, 'AvCmGetSignAttr');
      @AvCmFindCertBySign := GetProcAddress(DLLHandle, 'AvCmFindCertBySign');
      @AvCmGetCertAttr := GetProcAddress(DLLHandle, 'AvCmGetCertAttr');

      @_AvCmOpenCertEnum := GetProcAddress(DLLHandle, 'AvCmOpenCertEnum');
      @AvCmOpenCertEnum := @AvCmOpenCertEnum2;

	    @AvCmEnumGet := GetProcAddress(DLLHandle, 'AvCmEnumGet');
      @AvCmGetErrorInfo := GetProcAddress(DLLHandle, 'AvCmGetErrorInfo');
      @AvCmMsgAddCert := GetProcAddress(DLLHandle, 'AvCmMsgAddCert');
      @AvCmMsgImportCerts := GetProcAddress(DLLHandle, 'AvCmMsgImportCerts');
      @AvCmMsgGetSTBSign := GetProcAddress(DLLHandle, 'AvCmMsgGetSTBSign');
      @AvCmShowObjectInfo := GetProcAddress(DLLHandle, 'AvCmShowObjectInfo');
      @AvCmEnumAddCerts := GetProcAddress(DLLHandle, 'AvCmEnumAddCerts');
      @AvCmMsgVerifySignAtIndex := GetProcAddress(DLLHandle, 'AvCmMsgVerifySignAtIndex');
      @AvCmInitEx := GetProcAddress(DLLHandle, 'AvCmInitEx');
      @AvCmOpenInnerMsg := GetProcAddress(DLLHandle, 'AvCmOpenInnerMsg');
      @AvCmEnumDlg := GetProcAddress(DLLHandle, 'AvCmEnumDlg');
      @AvCmImport := GetProcAddress(DLLHandle, 'AvCmImport');
      @AvCmFindCrl := GetProcAddress(DLLHandle, 'AvCmFindCrl');
      @AvCmGetCrlAttr := GetProcAddress(DLLHandle, 'AvCmGetCrlAttr');
      @AvCmGenerateRequest := GetProcAddress(DLLHandle, 'AvCmGenerateRequest');
      @AvCmGetRequestAttr := GetProcAddress(DLLHandle, 'AvCmGetRequestAttr');
      @AvCmFindRequest := GetProcAddress(DLLHandle, 'AvCmFindRequest');
      @AvCmPutCert := GetProcAddress(DLLHandle, 'AvCmPutCert');
      @AvCmPutCert := GetProcAddress(DLLHandle, 'AvCmPutCert');
      @AvCmSignRawData := GetProcAddress(DLLHandle, 'AvCmSignRawData');
      @AvCmVerifyCertStatus := GetProcAddress(DLLHandle, 'AvCmVerifyCertStatus');
      @AvCmGetCertStatusAttr := GetProcAddress(DLLHandle, 'AvCmGetCertStatusAttr');
      @AvCmVerifyRawDataSign := GetProcAddress(DLLHandle, 'AvCmVerifyRawDataSign');
      @AvCmSetActiveWindow := GetProcAddress(DLLHandle, 'AvCmSetActiveWindow');
      @AvCmOpenCert := GetProcAddress(DLLHandle, 'AvCmOpenCert');
      @AvCmOpenCRL := GetProcAddress(DLLHandle, 'AvCmOpenCRL');
      @AvCmCheckCondition := GetProcAddress(DLLHandle, 'AvCmCheckCondition');

  // 2.36.0
      if Ver > '2.36.0' then begin
         @AvCmMsgOCSPAddResponse := GetProcAddress(DLLHandle, 'AvCmMsgOCSPAddResponse');
         Assert(@AvCmMsgOCSPAddResponse <> nil);

         @AvCmMsgOCSPGetResponseAttr := GetProcAddress(DLLHandle, 'AvCmMsgOCSPGetResponseAttr');
         @AvCmMsgOCSPGetResponse := GetProcAddress(DLLHandle, 'AvCmMsgOCSPGetResponse');
      end else begin
         @AvCmMsgOCSPAddResponse := @_AvCmPrm4;
         @AvCmMsgOCSPGetResponseAttr := @_AvCmPrm6;
         @AvCmMsgOCSPGetResponse := @_AvCmPrm4;
      end;

  // 3.0.0
      if Ver > '3.0.0' then begin
         @AvCmCheckCrlDP := GetProcAddress(DLLHandle, 'AvCmCheckCrlDP');
         Assert(@AvCmCheckCrlDP <> nil);
      end else begin
         @AvCmCheckCrlDP := @_AvCmPrm4;
      end;

  //3.3.3.910
      if Ver > '3.3.3' then begin
         @AvCmMsgSetAttribute := GetProcAddress(DLLHandle, 'AvCmMsgSetAttribute');
         Assert(@AvCmMsgSetAttribute <> nil);
      end else begin
         @AvCmMsgSetAttribute := @_AvCmPrm6;
      end;


      if Ver > '3.4.0' then begin
         SupportACert := True;
         @AvCmCreateScep := GetProcAddress(DLLHandle, 'AvCmCreateScep');
         Assert(@AvCmCreateScep <> nil);

         @AvCmScepExecute := GetProcAddress(DLLHandle, 'AvCmScepExecute');
         @AvCmScepSet := GetProcAddress(DLLHandle, 'AvCmScepSet');
         @AvCmScepGet := GetProcAddress(DLLHandle, 'AvCmScepGet');
         @AvCmOpenEnum := GetProcAddress(DLLHandle, 'AvCmOpenEnum');
         @AvCmShowObjectInfoExt := GetProcAddress(DLLHandle, 'AvCmShowObjectInfoExt');

      end else begin
         @AvCmCreateScep := @_AvCmPrm4;
         @AvCmScepExecute := @_AvCmPrm3;
         @AvCmScepSet := @_AvCmPrm5;
         @AvCmScepGet := @_AvCmPrm6;
         @AvCmOpenEnum := @_AvCmPrm6;
         @AvCmShowObjectInfoExt := @_AvCmShowObjectInfoExt;
      end;

      if Ver > '4.0.0' then begin
         @AvCmTLSCreateConnect := GetProcAddress(DLLHandle, 'AvCmTLSCreateConnect');
         Assert(@AvCmTLSCreateConnect <> nil);
         @AvCmTlsGet := GetProcAddress(DLLHandle, 'AvCmTlsGet');
         @AvCmTlsPost := GetProcAddress(DLLHandle, 'AvCmTlsPost');
         @AvCmDebugLog := GetProcAddress(DLLHandle, 'AvCmDebugLog');
      end else begin
         @AvCmTLSCreateConnect := @_AvCmPrm5;
         @AvCmTlsGet := @_AvCmPrm5;
         @AvCmTlsPost := @_AvCmPrm7;
         @AvCmDebugLog := @_AvCmPrm4;
      end;
   end else begin
      DLLLoaded := false;
      raise Exception.Create(GetWinError(GetLastError));
    { Error: AvCryptMail.dll could not be loaded !! }
   end;
end {LoadDLL};

begin
//   LoadDLL;

   {$ENDIF}

end.

