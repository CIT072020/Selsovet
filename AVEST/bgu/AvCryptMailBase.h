// ������� ������������ ���� ���������� AvCryptMail
// (C) AVEST plc., 2003-2005
// ������: 2.23.4


#if !defined(AVCRYPTMAILBASE_H)
#define AVCRYPTMAILBASE_H

typedef unsigned long DWORD;

// ----- ����, ������������ ����������� AvCryptMail -----

// ��� ������������� ����������� ���� ����������.
typedef DWORD AvCmResult;

#if _M_X64
typedef unsigned long                   AvCmResult;
typedef unsigned long long              AvCmLong;
typedef size_t                          AvCmSize;
#else
typedef unsigned long                   AvCmResult;
typedef unsigned long                   AvCmLong;
typedef size_t                          AvCmSize;
#endif

// ------- ����� ������� -------

// ��� ������� AvCmOpenCertEnum 
// ������� �� ������ ���������� ������������, � ���� ������������ 
const DWORD AVCMF_ALL_CERT           = 0x8000;

// ��� ������� AvCmSign AvCmSignAndEncrypt AvCmMsgSign
// � �������� ��������� ����� �������� ��� ����������� ����������� � ���.
const DWORD AVCMF_ADD_ALL_CERT    = 0x80000;

// ��� ������� AvCmSign AvCmSignAndEncrypt AvCmMsgSign
// � �������� ��������� ����� ������� ������ ���������� ������������.
const DWORD AVCMF_ADD_SIGN_CERT   = 0x100000;

const DWORD AVCMF_ADD_ONLY_CERT = 0x40000;

// ���������� ��������� �� ���������� � �������������� ���������
const DWORD AVCMF_DETACHED           = 0x2000000;

// ��� ������� AvCmInit
// ������ ���� ���������� ������������ ��� �������������� ������������� ����������
const DWORD AVCMF_STARTUP         = 0x1;

// ������ ���� ���������� ������������ ��� ������������ �������� ���������� 
// ����� �� ��������� �� ��������� ������������ ��������.
const DWORD AVCMF_SHUTDOWN        = 0x2;

// ��� ������� AvCmLogin
// ����������� ��� ������������� ������������. 
const DWORD AVCMF_NO_AUTH         = 0x4; 

// AvCmLogin: �������� ������� ������������ �������� � ������ ������ ��� �����������
const DWORD AVCMF_FORCE_TOKEN_CONTROL = 0x10000;

// AvCmLogin: ������ �������� ������� ������������ �������� � ������ ������ ��� �����������
const DWORD AVCMF_DENY_TOKEN_CONTROL = 0x20000;

// AvCmLogin: ���� ������� ���� ����, �� � ��� ������, ���� ��������������� ���
// �����������, �� �������� ������ � ���������� ������
const DWORD AVCMF_IGNORE_CRL_ABSENCE = 0x1;

// AvCmLogin: ���� ������� ���� ����, �� � ��� ������, ���� ��������������� ���
// ����, �� �������� ������ � ���������� ������
const DWORD AVCMF_IGNORE_CRL_EXPIRE = 0x8;




// AvCmOpenCertEnum: ����� �� ������ ����� ������������, �� � �������� ����� ������� �� ����������
const DWORD AVCMF_REQUEST_RESULT = 0x1;


// AvCmEnumDlg: ������� ������ ������������, ��������������� ��� ���������� 
const DWORD AVCMF_ONLY_ENCR_CERTS = 0x400;


// AvCmSign, AvCmSignAndEncrypt, AvCmMsgSign: ��������� ���� ������ � ���������� ������ ������ ����� ���������� ���
const DWORD AVCMF_REPEAT_AUTHENTICATION     = 0x800;


// AvCmMsgImportCerts: ������������� ��� ����������� � ��� ��� ������ ����������� ����
const DWORD AVCMF_IMPORT_ALL_CERTS = 0x80000;

// AvCmMsgImportCerts, AvCmVerify � AvCmVerifySign: ������������� ��� �� ��������� �
// ��������� (���� � ��������� ���� ���������� �������� ����)
const DWORD AVCMF_IMPORT_CRL = 0x40000;


// AvCmVerifySign: �� ��������� ������� � ����������� ������������
const DWORD AVCMF_NO_CERT_VERIFY = 0x8000000;


// ��� ������� AvCmVerifySign � AvCmDecryptAndVerifySign
// ��������� ��� �� ���� ��������� 
const DWORD AVCMF_VERIFY_ON_SIGN_DATE          = 0x1;


// AvCmEncrypt: ������������ �� ���������� ����������� 
const DWORD AVCMF_IGNORE_BAD_CERTS = 0x20;

// AvCmGenerateRequest: ����� ��������� ������� ���������� ������������ ��������� ������ � ����
const DWORD AVCMF_ALLOW_TO_SELECT_FILE = 0x8;

// AvCmSignRawData, AvCmVerifyRawDataSign: ������� ��� ASN.1 �����������
const DWORD AVCMF_RAW_SIGN = 0x40000;

const DWORD AVCMF_UPDATE_HASHVALUE    = 0x40000000;

// AvCmMsgUpdate
const DWORD AVCMF_UPDATE_FINAL        = 0x80000000;

// AvCmOpenMsg
const DWORD AVCMF_OPEN_FOR_SIGN           = 0x1000;
const DWORD AVCMF_OPEN_FOR_VERIFYSIGN     = 0x2000;
const DWORD AVCMF_OPEN_FOR_ENCRYPT        = 0x4000;
const DWORD AVCMF_OPEN_FOR_DECRYPT        = 0x8000;
  
const DWORD AVCMF_UNICODE             = 0x10000000;

//AvCmCreateScep
const DWORD AVCMF_SCEP_OFFLINE  = 0x1;

const DWORD AVCMF_RELOGIN            =      0x0100;
const DWORD AVCMF_OPEN_FOR_CALC_BELTHASH= 0x010000;
const DWORD AVCMF_OPEN_FOR_CALC_BHFHASH=  0x020000;


// ----- �������� ������� AvCmLogin -----
// ��� ���������, � ������� ��������� ����������� ������������/���
const DWORD   AVCM_DB_TYPE          = 0x1;

// ��������� Microsoft � ���������� ������� Windows.
const DWORD    AVCM_DBT_MS_REGISTRY = 0x100;

// ���������� � ����� ������ Oracle.
const DWORD    AVCM_DBT_ORACLE        = 0x101;

// ���� ������ Sybase Anywhere, ������ � ������� �������������� 
// � �������������� Sybase OpenClient.
const DWORD    AVCM_DBT_SYBASE      = 0x102;

// ���������� � �������� ����������.
const DWORD    AVCM_DBT_FILE        = 0x103;

// ���������� � �������� �������� ����������.
const DWORD    AVCM_DBT_ARCHIVE_FILE= 0x104;

// ���������� � �������� ���������� � ������
const DWORD    AVCM_DBT_ARCHIVE_MEMORY= 0x105;

// ���������� � ������ ���������� � ������ �� ������ ���������� � ������ � ������������
const DWORD    AVCM_DBT_E_MEMORY= 0x107;

// ���������� � �������� #PKCS11 ������
const DWORD    AVCM_SLOTID         = 0x10A;

// ���������� ��������� ���������� � ����� ������.
const DWORD AVCM_DB_HANDLE          = 0x2;

// DSN - ��� ���� ������.
const DWORD AVCM_DB_DSN             = 0x3;

// ��� ������������ ���� ������.
const DWORD AVCM_DB_UID             = 0x4;

// ������ ������������ ���� ������.
const DWORD AVCM_DB_PWD             = 0x5;

// ��� ��������� ������������ ��������� Microsoft � ������� Windows
const DWORD AVCM_DB_MS_NAME         = 0x6;

// ��� ��������� ������������ ���������� �� ��������� Microsoft � ������� Windows
const DWORD AVCM_DB_MS_ROOT_NAME    = 0x7;

// ������ ���������� � ����� Oracle
const DWORD AVCM_DB_CONNECTSTR      = 0x4;

// ���� � ������ ���������
const DWORD AVCM_DB_FILE_PATH       = 0x3;

// ���� � ����� ��������� ���������
const DWORD AVCM_DB_ARCHIVE_FILE_PATH = 0x3;

// ��������� �� �������� ���������
const DWORD AVCM_DB_ARCHIVE_PTR     = 0x6;

// ������ ��������� ��������� � ������
const DWORD AVCM_DB_ARCHIVE_SIZE    = 0x7;

// ������ ��� ������� � ���������� ������ ������
const DWORD AVCM_PASSWORD = 0x1030;

// ������� CommonName �������� �����������
const DWORD AVCM_COMMON_NAME = 0x1031;


// ----- �������� ������� AvCmOpenCertEnum -----

// ������������� ��������� ����� ��������
const DWORD AVCM_AUTHORITY_KEY_IDENTIFIER = 0x100C;

// ��� (X.509 Name) �������� ������������ ����������� � ���� ������
const DWORD AVCM_ISSUER_AS_STRING   = 0x100D;

// �������� ����� ������������ �����������
const DWORD AVCM_SERIAL_AS_STRING   = 0x100E;

// ������������� ��������� ����� ������������.
const DWORD AVCM_PUB_KEY_ID         = 0x100F;

// �������� ����� �����������
const DWORD AVCM_SERIAL_AS_INTEGER  = 0x18;

// ����/����� ������ �������� �����������
const DWORD AVCM_NOT_BEFORE         = 0x1A;

// ����/����� ��������� �������� �����������
const DWORD AVCM_NOT_AFTER          = 0x1B;

// ����/����� ������ �������� ������� �����
const DWORD AVCM_KEY_NOT_BEFORE         = 0x2A;

// ����/����� ��������� �������� ������� �����
const DWORD AVCM_KEY_NOT_AFTER          = 0x2B;

// ���� � ����� �������� ����������� ������ ���� 
// ������ ��� ����� ��������� ���� � �������.
const DWORD AVCM_D_GREATER          = 0x110;

// ���� � ����� �������� ����������� ������ ���� 
// ������ ��� ����� ��������� ���� � �������.
const DWORD AVCM_D_LESS          = 0x111;

// ��� (X.509 Name) ��������� ����������� � ���� ������
const DWORD AVCM_SUBJECT_AS_STRING  = 0x101C;

// ������� ����� (X.509 Name) ��������� ����������� � ���� ������
const DWORD AVCM_SUBJECT_ATTR       = 0x101D;

// �������� ���� �����������
const DWORD AVCM_PUB_KEY            = 0x1F;

// ������� ��������������� ����� (X.509 AltName) ��������� ����������� � ���� ������
const DWORD AVCM_SUBJ_ALT_NAME_ATTR = 0x1020;

// ���������� ����������� � ���� ������ 
const DWORD AVCM_EXT_AS_STRING      = 0x1024;

// �������� ����������� � ���� ������ 
const DWORD AVCM_ATTR_AS_STRING      = 0x1043;

// ��������� �������������� ������� ������������
const DWORD AVCM_PURPOSE            = 0x25;

// ����� ������������, ��������������� ��� �������.
const DWORD AVCM_P_SIGN             = 0x01;

// ����� ������������, ��������������� ��� ������������.
const DWORD AVCM_P_CRYPT            = 0x02;

// ����� ������������ ������������.
const DWORD AVCM_P_NON_REPUDIABLE   = 0x04;

// ��������� ��� �������� ����������� 
const DWORD AVCM_TYPE               = 0x26;

// ������� ������ ������ ������������
const DWORD AVCM_TYPE_MY            = 0x10E;

// ������� ������������ ���������� ������� ������������
const DWORD AVCM_TYPE_ROOT          = 0x10F;

// ����� �� �������� ����� (X.509 Name) �������� ����������� � ���� ������
const DWORD AVCM_ISSUER_ATTR        = 0x1032;

// ������������� ������� (OID) �� ������ ����������� ���������� ����� �����������. 
// ��� ���� ���������� �������� ������ � ������ (�������� attr_param). 
const DWORD AVCM_EXT_KEY_USAGE_OID  = 0x1027;

// ����� ������� ���������� ���������. 
const DWORD AVCM_CERT_ISSUERS_CHAIN = 0x1029;

const DWORD AVCM_PUB_KEY_ALG_PARAMS = 0x31;

// ----- �������� ������� AvCmFindCrl -----

// ���� Subject �������� ��� ��� ������� AvCmImport � AvCmFindCrl
const DWORD AVCM_CRL_ISSUER_SUBJECT = 0x1;

// ����� �� ��������� ����������� �������� ������ ���������� ������������ � ���� ������
const DWORD AVCM_CRL_ISSUER_CERT = 0x2;

// ----- �������� ������� AvCmGenerateRequest -----

// ���� � ����� ������� �� ���������� ��� ������� AvCmGenerateRequest
const DWORD AVCM_TEMPLATE = 0x2F;



// ---------- ������� ��������� ����������� ----------

/** Base code */
//! ������� ��� ������ ���������
#define AVCM_CSR_BASE                           0x077B1000

// ���������� �������
const DWORD AVCM_CSR_REVOKED                    =  0x01 + AVCM_CSR_BASE;   

// ������� ��������� �� �����������
const DWORD AVCM_CSR_UNKNOWN                    =  0x02 + AVCM_CSR_BASE;   

// ---------- ���� ������ ----------
// �������� ���������� �������
const AvCmResult AVCMR_SUCCESS             =  0;   

/** Base error code for all AvCm errors */
//! ������� ��� ������ 
#define AVCMR_BASE                              0xE82A0100

// ������ ��� ������������� ������
const AvCmResult AVCMR_ALLOC_ERROR          =  0x01 + AVCMR_BASE;   

// ������������� �������� �������
const AvCmResult AVCMR_BAD_ATTR             =  0x02 + AVCMR_BASE;   

// �������� ������ ���������
const AvCmResult AVCMR_BAD_FORMAT           =  0x03 + AVCMR_BASE;   

// ���������� ������� �������
const AvCmResult AVCMR_BAD_HANDLE           =  0x04 + AVCMR_BASE;   

// ���������� ���������� �������
const AvCmResult AVCMR_BAD_HC               =  0x05 + AVCMR_BASE;   

// ���������� ����������� �������
const AvCmResult AVCMR_BAD_HCERT            =  0x06 + AVCMR_BASE;   

// ���������� �������� ������������ �������
const AvCmResult AVCMR_BAD_HENUM        =  0x07 + AVCMR_BASE;   

// ���������� ��������� ��������� �������
const AvCmResult AVCMR_BAD_HMSG             =  0x08 + AVCMR_BASE;   

// ���������� ������� �������
const AvCmResult AVCMR_BAD_HSIGN            =  0x09 + AVCMR_BASE;   

// � ��������� ��� ������� � ��������� �������
const AvCmResult AVCMR_BAD_NUMBER           = 0x0A + AVCMR_BASE;   

// ������ �������
const AvCmResult AVCMR_BAD_PASSWORD         = 0x0B + AVCMR_BASE; 

// �������� ����� ������� ���  
const AvCmResult AVCMR_BUFFER_TOO_SMALL     = 0x0C + AVCMR_BASE;   

// �� ������ ������ ����������
const AvCmResult AVCMR_CERT_NOT_FOUND       = 0x0D + AVCMR_BASE;   

// ������� ��� ������������ �������� �������
const AvCmResult AVCMR_CERT_CA_INVALID      = 0x0E + AVCMR_BASE;   

// ���������� �������� �� ������
const AvCmResult AVCMR_CERT_CA_NOT_FOUND    = 0x0F + AVCMR_BASE;   

// ���������� �� ������������ ��� ����������
const AvCmResult AVCMR_CERT_NOT_FOR_CRYPT   = 0x11 + AVCMR_BASE;   

// ���������� �� ������������ ��� �������
const AvCmResult AVCMR_CERT_NOT_FOR_SIGN    = 0x12 + AVCMR_BASE;   

// ������� ��� ������������ �������
const AvCmResult AVCMR_CERT_SIGN_INVALID    = 0x13 + AVCMR_BASE;   

// �� ������� ��� ����� ��������� ������������
const AvCmResult AVCMR_CERT_STORE_NOT_FOUND = 0x14 + AVCMR_BASE;   

// �� ������ ��������� � ������� ������� �� ��������
const AvCmResult AVCMR_CONTAINER_NOT_FOUND  = 0x15 + AVCMR_BASE;   

// ������� ��� ��� �������� ������� ��� ��� �������
const AvCmResult AVCMR_CRL_INVALID          = 0x16 + AVCMR_BASE;   

// ��� �������� �� ������
const AvCmResult AVCMR_CRL_NOT_FOUND        = 0x17 + AVCMR_BASE;   

// ���������� ����������� � ���� ������
const AvCmResult AVCMR_DB_NOT_FOUND         = 0x18 + AVCMR_BASE;   

// �� ������ ��������
const AvCmResult AVCMR_DEVICE_NOT_FOUND     = 0x19 + AVCMR_BASE;   

// ���������� ������� ������, ������ �����
const AvCmResult AVCMR_BUSY                 = 0x1A + AVCMR_BASE;   

// �� ������� ��������� ����������� � ���� ������
const AvCmResult AVCMR_NO_DB_PARAMS         = 0x1B + AVCMR_BASE;   

// ������� ��������� ����� ������� ������
const AvCmResult AVCMR_NO_INPUT             = 0x1C + AVCMR_BASE;   

// ��������� �� ����� �������, ������������ �� ����� ������� �����������
const AvCmResult AVCMR_NO_SIGN              = 0x1D + AVCMR_BASE;   

// ��������� ������� ������������� ����������
const AvCmResult AVCMR_ALREADY_INITIALIZED  = 0x1E + AVCMR_BASE;   

// ���������� �� ���� ����������������
const AvCmResult AVCMR_NOT_INITIALIZED      = 0x1F + AVCMR_BASE;   

// ������ ����/������� �����������
const AvCmResult AVCMR_BAD_DATE             = 0x20 + AVCMR_BASE;   

// ������� �������� �������� �����
const AvCmResult AVCMR_BAD_FLAGS            = 0x21 + AVCMR_BASE;   

// ������� ��������� � ������, ��������� � ����� ������, �� ������� ������
const AvCmResult AVCMR_BAD_THREAD           = 0x22 + AVCMR_BASE;   

// ���� �� ����������
const AvCmResult AVCMR_DATE_NOT_VALID       = 0x23 + AVCMR_BASE;   

// ���������� ������ ����������
const AvCmResult AVCMR_INTERNAL_ERROR       = 0x24 + AVCMR_BASE;   

// ������ �� ������
const AvCmResult AVCMR_NOT_FOUND            = 0x25 + AVCMR_BASE;   

// ������� �� �����������
const AvCmResult AVCMR_NOT_IMPLEMENTED      = 0x26 + AVCMR_BASE;   

// ������� �������
const AvCmResult AVCMR_SIGN_INVALID         = 0x27 + AVCMR_BASE;   

// ������ ������� ��� ����������� ������������
const AvCmResult AVCMR_USER_NO_AUTH         = 0x28 + AVCMR_BASE;   

// �������� ������� �������
const AvCmResult AVCMR_BAD_PARAM            = 0x29 + AVCMR_BASE;   
    
// �������� ������ ������� ���
const AvCmResult AVCMR_BAD_FORMED_SIGN      = 0x2A + AVCMR_BASE;   

// ������������� ���������������� ����� ����������� ��������
const AvCmResult AVCMR_AVCSP_INIT_FAILED    = 0x2B + AVCMR_BASE;   
    
// ������ ������� � ������� Windows
const AvCmResult AVCMR_REGISTRY_ERROR       = 0x2C + AVCMR_BASE;   

// ��������� ������ ��� ������ ������� Win32
const AvCmResult AVCMR_WIN32_ERROR          = 0x2D + AVCMR_BASE;   

// ���������� ������������ ���������: 
// ����� ������������ ����������� ��������� ����������� 
// ������ ���������� �������������������� ������������
const AvCmResult AVCMR_OTHER_RECIPIENT      = 0x2E + AVCMR_BASE; 

// �� ������ ���� (������ ���������� ������� ������������)
const AvCmResult AVCMR_CTL_NOT_FOUND        = 0x2F + AVCMR_BASE;   

// ���������� �������
const AvCmResult AVCMR_CERT_REVOKED         = 0x30 + AVCMR_BASE;   

// ��� ������� �����������
const AvCmResult AVCMR_CERT_NOT_TRUSTED     = 0x31 + AVCMR_BASE;   

// ���� �������� ��� �����
const AvCmResult AVCMR_CRL_EXPIRED          = 0x32 + AVCMR_BASE;   

// ���������� �������� ��� �� ������
const AvCmResult AVCMR_CRL_ISSUER_NOT_FOUND = 0x33 + AVCMR_BASE;   

// ���� �������� ����������� �������� ��� �����
const AvCmResult AVCMR_CRL_ISSUER_EXPIRED   = 0x34 + AVCMR_BASE;   

// ������ ���������� �� ������������� ������ ��������� ������������.
const AvCmResult AVCMR_CERT_STORE_BAD_VERSION = 0x35 + AVCMR_BASE;

// � ������ ��������� ����������� ����������� �����������.
const AvCmResult AVCMR_MY_STORE_EMPTY = 0x36 + AVCMR_BASE;

// �������� �������� �������������.
const AvCmResult AVCMR_USER_CANCEL = 0x37 + AVCMR_BASE;

// ���������� �������� ����������� ������������� ����� �� �������������� ������� �����������
const AvCmResult AVCMR_RA_EXT_KEY_USAGE_NOT_ALLOWED = 0x38 + AVCMR_BASE;
   
// ���������� �������� ���������� �� �������������� ������� �����������.
const AvCmResult AVCMR_RA_EXT_NOT_ALLOWED = 0x39 + AVCMR_BASE;

// � ������ ����������� ��������� ����������� ������������ 
const AvCmResult AVCMR_TOO_MANY_CERT  = 0x3A + AVCMR_BASE;  

// �������� ������ �� ����������
const AvCmResult AVCMR_PARAM_SPEC_NOT_FOUND = 0x40 + AVCMR_BASE;   

// ���������� �� �������� ������������ ��
const AvCmResult AVCMR_CERT_NOT_RA = 0x41 + AVCMR_BASE;   

// ������ ��� ����������
const AvCmResult AVCMR_ALREADY_EXISTS  = 0x42 + AVCMR_BASE;   

// ��� ������ ���������� ���������� 
const AvCmResult AVCMR_UNKNOWN_ERROR_CODE  = 0x43 + AVCMR_BASE;   

// �������� ��� ���������� �� ���������� ��������, ����������� ���������� AVCM_CRL_ISSUER_SUBJECT 
const AvCmResult AVCMR_BAD_CRL_ISSUER  = 0x44 + AVCMR_BASE;  

// � ����������� ������� ���������� ������������ ������� ����� ����� ��� ������� ��������
const AvCmResult AVCMR_OLD_CRL  = 0x45 + AVCMR_BASE;  
 
// ���������� ��� �������
const AvCmResult AVCMR_BAD_HCRL  = 0x46 + AVCMR_BASE;  

// ���������� �������� �������������
const AvCmResult AVCMR_CERT_TEMPORARY_REVOKED      = 0x47 + AVCMR_BASE;

// ������ ������������� ������ ��� ��������� ��������������.
// �������� �������� �������� ��� ������� ����� ������ ������.
const AvCmResult AVCMR_REPEAT_AUTHENTICATION_ERROR  = 0x48 + AVCMR_BASE;

// ��� ���� ������� � ���� ������������.
const AvCmResult AVCMR_DB_AUTHENTICATION_ERROR  = 0x49 + AVCMR_BASE;
  
// �������� � ������ ������ �� ����������
const AvCmResult AVCMR_TOKEN_NOT_FOUND  = 0x4A + AVCMR_BASE;
  
// ��������� �� ����� �����������
const AvCmResult AVCMR_NO_CONTENT  = 0x4B + AVCMR_BASE;

// ���� �������� ����������� �������
// ������ �������
//const AvCmResult AVCMR_CERT_EXPIRED         = 0x10 + AVCMR_BASE;   

// ���� �������� ����������� �� ��������
const AvCmResult AVCMR_CERT_NOT_VALID_YET         = 0x4C + AVCMR_BASE;   

// ���� �������� ����������� �����
const AvCmResult AVCMR_CERT_ALREADY_EXPIRED         = 0x4D + AVCMR_BASE;   

// �������� �� ���������������
const AvCmResult AVCMR_INVALID_TOKEN        = 0x4E + AVCMR_BASE;

// ������ ������������� �����
const AvCmResult AVCMR_BAD_KEY        = 0x4F + AVCMR_BASE;

// ������ ������ �� ��������
const AvCmResult AVCMR_TOKEN_WRITE_ERROR        = 0x50 + AVCMR_BASE;

// ���������� �� ������, �� ������ ����� �� � ������ ����������� �� ������� �������
const AvCmResult AVCMR_REQUEST_DENIED           = 0x51 + AVCMR_BASE;

// ������� ������������ ��������� �� �������� �����
const AvCmResult AVCMR_BAD_BUFFER_PTR           = 0x52 + AVCMR_BASE;

// ������ ������������ ������ �����������.
const AvCmResult AVCMR_OBJ_LOCKED = 0x53 + AVCMR_BASE;

// ����������� ���������� �������������� ���������.
const AvCmResult AVCMR_NO_RECIPIENTS = 0x54 + AVCMR_BASE;

// ���������� �� �������
const AvCmResult AVCMR_ALG_NOT_SUPPORTED        = 0x55 + AVCMR_BASE;   

// ���������� �� �������
const AvCmResult AVCMR_CERT_NOT_REVOKED         = 0x56 + AVCMR_BASE;   

//  ���������� ���������������� ������ �� ���������� ��
const AvCmResult AVCMR_REQUEST_FOR_CA_DENIED = 0x57 + AVCMR_BASE;

//  ���������� ���������������� ������ �� ���������� ��
const AvCmResult AVCMR_REQUEST_FOR_RA_DENIED = 0x58 + AVCMR_BASE;

//  �� �� ����� ����� �� ���������� ������ ��������
const AvCmResult AVCMR_REQUEST_FOR_REVOKE_DENIED = 0x59 + AVCMR_BASE;

// �� �� ����� ����� �������� ����������� ��� �� ����� �������� �������� ������������.
const AvCmResult AVCMR_INVALID_BASIC_CONSTRAINTS = 0x5A + AVCMR_BASE;

// �������������� ������ AvCryptSQL.
const AvCmResult AVCMR_CRYPTSQL_SYNTAX_ERROR = 0x5B + AVCMR_BASE;

// ����������/��� �� ������������� �������� ������
const AvCmResult AVCMR_NOT_CONDITION = 0x5C + AVCMR_BASE;

// �� ������� ��������� ���. ��������, �������� ���������� � AvHSM.
const AvCmResult AVCMR_VERIFY_ERROR = 0x5D + AVCMR_BASE;

// �������� ����������� ������� ������.
const AvCmResult AVCMR_BAD_DATA = 0x5E + AVCMR_BASE;

// �� ������ ������������ ���� ��� �������� �������
const AvCmResult AVCMR_ORIGINAL_FILE_FOR_VERIFY_NOT_FOUND = 0x5F + AVCMR_BASE;

// ���������� �� ������������ ��� ������� ������������
const AvCmResult AVCMR_CERT_NOT_FOR_SIGN_CERT = 0x60 + AVCMR_BASE;

// ���������� �� ������������ ��� ������� ���
const AvCmResult AVCMR_CERT_NOT_FOR_SIGN_CRL = 0x61 + AVCMR_BASE;

// ���������� �������� ����������� ����������� ����������.
const AvCmResult AVCMR_CERT_UNKNOWN_CRITICAL_EXT = 0x62 + AVCMR_BASE;

// ��� �������� ����������� ����������� ����������.
const AvCmResult AVCMR_CRL_UNKNOWN_CRITICAL_EXT = 0x63 + AVCMR_BASE;

//���������� ����� ������ �������.
const AvCmResult AVCMR_INVALID_KEY_USAGE = 0x64 + AVCMR_BASE;

// ���������� �� ������� ������ ��.
const AvCmResult AVCMR_INVALID_RACERT = 0x65 + AVCMR_BASE;

const AvCmResult AVCMR_CRLSERVER_ERROR = 0x66 + AVCMR_BASE;

// ������ �������� ���������� PKCS#11
const AvCmResult AVCMR_LOADLIBPKCS11_ERROR = 0x67 + AVCMR_BASE;

// ������� ����� ���� � ������ ��������������� ���
const AvCmResult AVCMR_CRLDP_BAD_PATH = 0x68 + AVCMR_BASE;

// �������� ������� �� ���������� ����� ������� �� ��������� ������������� �����������
const AvCmResult AVCMR_RENEW_BAD_ATTR = 0x69 + AVCMR_BASE;


const AvCmResult AVCMR_POLICY_NOT_FOUND = 0x70 + AVCMR_BASE;
const AvCmResult AVCMR_POLICY_NOT_APPLY = 0x71 + AVCMR_BASE;

// ���������� �� ������������ ��� ������� ���������� ������������
const AvCmResult AVCMR_CERT_NOT_FOR_SIGN_ACERT = 0x72 + AVCMR_BASE;

// ������ ��� ��������� � OCSP �������
const AvCmResult AVCMR_OCSP_ERROR = 0x73 + AVCMR_BASE;

// ���� ������� ����� �����
const AvCmResult AVCMR_KEY_ALREADY_EXPIRED = 0x74 + AVCMR_BASE;

// �������� �� ����������
const AvCmResult AVCMR_PKCS11_TOKEN_NOT_PRESENTERROR = 0x75 + AVCMR_BASE;

// ������ ��� ������ ������� PKCS#11
const AvCmResult AVCMR_PKCS11_ERROR = 0x76 + AVCMR_BASE;

// �� ������� �������� ��� ���������� ������� � LDAP
const AvCmResult AVCMR_LDAP_ACTION_NOT_FOUND = 0x77 + AVCMR_BASE;

//������ �� ���������� ���� ������� �����������
const AvCmResult AVCMR_SCEP_PENDING = 0x78 + AVCMR_BASE;

// ������ ��� ��������� � ������� SCEP
const AvCmResult AVCMR_SCEP_ERROR = 0x79 + AVCMR_BASE;

#endif // !defined(AVCRYPTMAILBASE_H)
