// ������������ ���� ���������� AvCryptMail
// (C) AVEST plc., 2003-2005
// ������: 2.23.3


#if !defined(AVCRYPTMAIL_H)
#define AVCRYPTMAIL_H

#include "AvCryptMailBase.h"

// ----- ����, ������������ ����������� AvCryptMail -----

// ���������� ������� ����������.
typedef void* AvCmHandle;

// ���������� ��������������� ������������.
typedef AvCmHandle AvCmHc;

// ���������� ��������� ���������.
typedef AvCmHandle AvCmHmsg;

// ���������� ����� �� �������� ���������.
typedef AvCmHandle AvCmHsign;

// ���������� ��������� ����������.
typedef AvCmHandle AvCmHcert;

// ���������� ������� � ���������������� �����������,
// ���������� � ���������� ������ ������� �������� ���.
typedef AvCmHandle AvCmHsignCert;

// ���������� ��������� ��������� �������� ��������.
typedef AvCmHandle AvCmHenum;

// ���������� ��������� ��������� �������� ������������.
typedef AvCmHenum AvCmHcertEnum;

// ���������� ��������� ��������� �������� ���������� 
// � �������� � ��������������� ������������ ������������ ���������.
typedef AvCmHenum AvCmHsgnCertEnum;

// ���������� ��������� ������ ���������� ������������ 
typedef AvCmHandle AvCmHcrl;

// ���������� ��������� ������� �� ���������� 
typedef AvCmHandle AvCmHreq;

// ���������� ������� ����������.
typedef AvCmHandle AvCmHcertstat;

// ���������� ���������� � ������� �����������.
typedef AvCmHandle AvCmHOCSP;



#pragma pack(1)

// ������ ����������� ��� ����������� ��� ������������� ������������
// � ����������� � ������������ ������������/���.
// � ��������� ����� ����������� ���������
// ������������ ������������ � ���� ������.
struct AvCmConnectionParam {
     AvCmLong   param_id; // ������������� ���������
     const void  * param;    // �������� ���������
};
   
// �������� ������ ��������.
struct AvCmEnumGetParam {
   AvCmLong param_id;     // ������������� ���������
   const void * param_spec;  // ��������� ��������������
   const void * param;       // �������� ���������
};

// �������� ������� ��������.
struct AvCmImportParam {
   AvCmLong param_id;  // ������������� ���������
   void * param;    // �������� ���������
};

// ������ ������������ ��� ������ ������� ���������� ������������.
struct AvCmFindCrlParam {
   AvCmLong param_id;  // ������������� ���������
   void * param;    // �������� ���������
};

// ������ ������������ ��� ��������� ������� �� ����������.
struct AvCmGenReqParam {
   AvCmLong param_id;  // ������������� ���������
   void * param;    // �������� ���������
};

// ������ ������������ ��� ������ ������� �� ����������.
struct AvCmFindReqParam {
   AvCmLong param_id;  // ������������� ���������
   void * param;    // �������� ���������
};

// ������ ������������ ��� ������� ������� �����������
struct AvCmCertStatParam {
   AvCmLong param_id;  // ������������� ���������
   void * param;    // �������� ���������
};


#pragma pack( )



// ------- ����� ������� -------

// ��� ������� AvCmInit
// ������ ���� ���������� ������������ ��� �������������� ������������� ����������
// const AvCmLong AVCMF_STARTUP         = 0x1;

// AvCmInit: ������ ���� ���������� ������������ ��� ������������ �������� ���������� 
// ����� �� ��������� �� ��������� ������������ ��������.
// const AvCmLong AVCMF_SHUTDOWN        = 0x2;

// ��� ������� AvCmInit
// �������� ��������� ����� mac.ini
const AvCmLong AVCMF_CHECK_FILES_INTEGRITY = 0x4;

// ��� ������� AvCmOpenMsg
// ������� ������ ����� ��������� � �������� ��������� ��� PKCS#7 Data.
const AvCmLong AVCMF_IN_RAW_DATA        = 0x100;

// ��� ������� AvCmSign AvCmEncrypt AvCmDecrypt AvCmSignAndEncrypt AvCmOpenMsg  
// ������� ��������� � ������� PKCS#7.
const AvCmLong AVCMF_IN_PKCS7           = 0x200;

// ��� ������� AvCmPutCert
// ������ ���� ������������ � ������� ���������� ������������ �� ���������� ���������
const AvCmLong AVCMF_MESSAGE           = 0x1000;

// ��� ������� AvCmSign AvCmEncrypt AvCmDecrypt AvCmSignAndEncrypt AvCmGetMsg 
// �������� ��������� � ������� PKCS#7.
const AvCmLong AVCMF_OUT_PKCS7           = 0x2000;

// ��� ������� AvCmGetSignAttr AvCmGetCertAttr
// ������� �� ������.
const AvCmLong AVCMF_ATTR_BY_NUM     = 0x400000;


// ��� ������� AvCmGetSignAttr AvCmGetCertAttr 
// ������� �� ��� �������������� ������� (OID).
const AvCmLong AVCMF_ATTR_BY_OID     = 0x800000;


// ��� ������� AvCmEnumGet
// �������� ��������� �� ������� ������� ������������.
const AvCmLong AVCMF_NEXT            = 0x40;

// ��� ������� AvCmEnumGet
// ������ ������� ������������ � ������.
const AvCmLong AVCMF_START           = 0x80;

// ��� ������� AvCmOpenCertEnum
// �������� ����������� ����������� ��� ������� ���������� ������������
const AvCmLong AVCM_ATTRIBUTE_CERTS  = 0x323;

 
 
// ������� ������ �������������� ������������ ������
// ��� ��������� ��������� �������� Win32 API HeapAlloc,
// ����� ������������� ��������� ���������, ��������� ���������
// ������ �������������� �������� ���������� ������ �������� HeapFree.
const AvCmLong AVCMF_ALLOC           = 0x1000000;


// AvCmSetMsgContent: �������� ������ � ����������� ��������� 
const AvCmLong AVCMF_APPEND           = 0x4000000;

   




// AvCmImport: ������� ���������� �������, ���� �� ������������ � ������������
const AvCmLong AVCMF_RETURN_HANDLE_IF_EXISTS = 0x1;



// ��� ������� AvCmVerifySign AvCmDecryptAndVerifySign 
// �� ���������  �������� ���������
const AvCmLong AVCMF_NO_OUTPUT       = 0x200000;

// ��� ������� AvCmVerifySign � AvCmDecryptAndVerifySign
// ������ ����������� � ������ ���������� ������������ 
// �� ��������� � ��������� ������������. 
const AvCmLong AVCMF_IMPORT          = 0x10;

// ��� ������� AvCmImport
// ����� ������� ������������ ����������� ������� ������ ������ ���������� � ������ ������
const AvCmLong AVCMF_SELECT_MY_CERT        = 0x2;


// ��� ������� AvCmGetErrorInfo
// �������� ������ ������ �� �������������� ����������� ������.
const AvCmLong AVCMF_THREAD_ERROR    = 0x08;

// AvCmMsgVerifySign, AvCmMsgVerifySignAtIndex, AvCmVerifyRawDataSign 
// ������������ ���������� ����������� ���
const AvCmLong AVCMF_NO_CRL_VERIFY        = 0x20;



// ----- �������� ������� AvCmGetObjectInfo -----

// ��������� ����������� ������� �����������. 
const AvCmLong AVCM_MY_CERT            = 0x8;

// ��������� ���������� �������� ��������.
const AvCmLong AVCM_CHILDREN_COUNT     = 0x9;



// ----- �������� ������� AvCmGetMsgParam -----

// ��� ��������� ���������.
const AvCmLong AVCM_FORMAT             = 0xA;

// ������ �� ����� ��������� PKCS#7.
const AvCmLong AVCM_MF_RAW_DATA        = 0x103;

// ������ �� ����� ��������� PKCS#7.
const AvCmLong AVCM_MF_NONE        = 0x104;

// ����������� ��������� � ������� PKCS#7 SignedData.
const AvCmLong AVCM_MF_SIGNED_DATA     = 0x105;

// ������������� ��������� � ������� PKCS#7 EnvelopedData.
const AvCmLong AVCM_MF_ENVELOPED_DATA  = 0x106;

// ���������� �������� � ����������� ���������.
const AvCmLong AVCM_SIGN_COUNT         = 0x107;

// ������ � ������� ���������� ���������
const AvCmLong AVCM_INNER_FORMAT       = 0x108;


// ----- �������� ������� AvCmGetSignAttr AvCmGetCertAttr AvCmOpenCertEnum AvCmGetRequestAttr -----

// ���������� ��������� ����� (X.509 Name) ��������� �����������
const AvCmLong AVCM_SUBJECT_ATTR_COUNT            = 0x1;

// ���������� ��������� ����� (X.509 Name) �������� �����������
const AvCmLong AVCM_ISSUER_ATTR_COUNT            = 0x2;

// ������������� ������� (OID) �������� ����� ��������� ����������� � ���� ������
const AvCmLong AVCM_SUBJECT_ATTR_OID            = 0x1033;

// ������������� ������� (OID) �������� ����� ��������� ����������� � ���� ������
const AvCmLong AVCM_ISSUER_ATTR_OID            = 0x1034;

// �������� ���������� ����������� � ���� BLOB
const AvCmLong AVCM_EXT_BLOB            = 0x5;

// �������� �������� ����������� � ���� BLOB
const AvCmLong AVCM_ATTR_BLOB            = 0x325;

// ������������� ������������ �������� � ���� ������ ASCIIZ
const AvCmLong AVCM_AUTH_OID            = 0x1040; //0x6;

// ������������� �������������� �������� � ���� ������ ASCIIZ
const AvCmLong AVCM_UNAUTH_OID            = 0x1041; //0x7;

// �������� ������������ �������� � ���� BLOB
const AvCmLong AVCM_AUTH_BLOB            = 0x8;

// �������� �������������� �������� � ���� BLOB
const AvCmLong AVCM_UNAUTH_BLOB            = 0x9;

// ������ �������
const AvCmLong AVCM_VERSION            = 0xB;

// ������������� ��������� �����������
const AvCmLong AVCM_HASH_ALG_OID       = 0x1010;

// ������������� ��������� �������
const AvCmLong AVCM_SIGN_ALG_OID       = 0x1011;

// �������
const AvCmLong AVCM_SIGN               = 0x12;

// ���� � ����� ��������� �������, ������� ��������� � 
// ������ ����������� ��������� ���������.
const AvCmLong AVCM_SIGN_DATE_TIME     = 0x13;

// ���������� ����������� ���������
const AvCmLong AVCM_AUTH_COUNT         = 0x14;

// ���������� ���������� ������������� ���������
const AvCmLong AVCM_UNAUTH_COUNT       = 0x15;

// ����������� ������� � ���� ������ ASCIIZ
const AvCmLong AVCM_AUTH_AS_STRING     = 0x1016;

// ������������� ������� � ���� ������ ASCIIZ
const AvCmLong AVCM_UNAUTH_AS_STRING   = 0x1017;

// ��������� ������ �������� ������������ �����������
const AvCmLong AVCM_VALID            = 0x2C;

// DER-������������� �����������
const AvCmLong AVCM_BLOB              = 0x2D;

// ��������� ������ ���������������� ������� (������������� � MS CA).
const AvCmLong AVCM_MSCA_COMPATIBLE   = 0x30;

// ������������� ��������� ��������� ����� �����������
const AvCmLong AVCM_PUB_KEY_ALG_OID    = 0x101E;

// ���������� �������������� ���������
const AvCmLong AVCM_EXT_COUNT          = 0x21;

// ������������� ������� (OID) ����������
const AvCmLong AVCM_EXT_OID            = 0x1022;

// ������������ �������������� ������� (OID) ����������
const AvCmLong AVCM_EXT_OID_NAME       = 0x1026;

// ������� ����������� ����������
const AvCmLong AVCM_EXT_CRITICAL       = 0x23;

// ���������� ��������� � ������ ����������� ���������� ����� �����������
const AvCmLong AVCM_EXT_KEY_USAGE_COUNT  = 0x28;

// ������������ �������������� ������� (OID) �� ������ ����������� 
// ���������� ����� �����������, � ��� ������, 
// ���� ������ OID ��������������� � ������������ �������.  
// ��� ���� ���������� �������� ������ ���� �������������� � ������ (�������� attr_param).  
const AvCmLong AVCM_EXT_KEY_USAGE_NAME  = 0x1028;

// ���������� �������������� ���������
const AvCmLong AVCM_ATTR_COUNT          = 0x324;

// ������������� ������� (OID) ����������
const AvCmLong AVCM_ATTR_OID            = 0x1042;

// ������������ �������������� ������� (OID) ��������
const AvCmLong AVCM_ATTR_OID_NAME       = 0x1044;

// ��������� ������� AvCmGetErrorInfo 
// ������� �������� ������
const AvCmLong AVCM_SHORT_STRING = 0x1;

// ��������� �������� ������
const AvCmLong AVCM_DESCRIPTION = 0x2;

// ��� ������ ����������. 
// � ���� ������ � �������� ��������� �� ��������  ����� 
// ������ ���� ������� ��������� �� AvCmLong.
const AvCmLong AVCM_ERROR_CODE = 0x3;

// ������� ���������� ���������������� � ��������� �������
const AvCmLong AVCM_RESULT_HANDLE = 0x2;
 


// DER-������������� �����������
const AvCmLong AVCM_CERTIFICATE = 0x1;

// DER-������������� ������ ���������� ������������
const AvCmLong AVCM_CRL = 0x2;

// DER-������������� ������� �� ���������� � ������� PKCS#10
const AvCmLong AVCM_PKCS10_REQUEST = 0x4;

// DER-������������� ����������� ������ �� ���������� � ������� PKCS#7 SignedData
const AvCmLong AVCM_PKCS7_REQUEST = 0x5;

// DER-������������� ������� ������������ (p7b)
const AvCmLong AVCM_PKCS7_CHAIN = 0x8;

// DER-������������� ����������� �����������
const AvCmLong AVCM_ATTRIBUTE_CERTIFICATE = 0x9;

// ������������ ��������� � AvCmLogin:AVCM_DBT_E_MEMORY
const AvCmLong AVCM_STORES = 0xC9;

// ����/����� ������� ������ ����������  ������������
const AvCmLong AVCM_THIS_UPDATE = 0x1A;

// ����/����� ��������� �������� ������ ����������  ������������
const AvCmLong AVCM_NEXT_UPDATE = 0x1B;

// SHA-1 ��� �� DER-������������� ������ ���������� ������������
const AvCmLong AVCM_SHA1_HASH = 0x2E;

// ����/����� ������ �����������
const AvCmLong AVCM_CS_REVOCATION_TIME            = 0x301;

// ������� ������ �����������
const AvCmLong AVCM_CS_REVOCATION_REASON          = 0x302;

// ������� ��������� �����������
const AvCmLong AVCM_CS_UNTRUST_REASON             = 0x303;

// ����� �������� �������
const AvCmLong AVCM_CHECK_MODE                    = 0x401;

// �������� ������� � �������������� ���������� ���
const AvCmLong AVCM_CM_OFFLINE                    = 0x402;

// �������� ������� ����������� � ����������
const AvCmLong AVCM_CM_ONLINE                     = 0x403;

// ����� OCSP �������
const AvCmLong AVCM_RESPONDER_URL                 = 0x404;


// ������ ����� ��������������  ��� �� �����������
const AvCmLong AVCM_CRL_DISTRIBUTION_POINTS       = 0x1035;

// ������� �� ��������� ��� ������ �������������� �����
const AvCmLong AVCM_IMPORT_PATH       = 0x1036;

// ������� �� ��������� ��� ���������� ����� ���������� �������
const AvCmLong AVCM_EXPORT_PATH       = 0x1037;

// ��������� �� ������������� �������� ��������������� ����� � ��������� ����������� ��������. 
// ������ ���� � ��� ����� �������� ����������� ��������
const AvCmLong AVCM_OPERATION_REPORT       = 0x1038;


// AvCmGenerateRequest � ������������� ������ � ����������� ����������� �����������
const AvCmLong AVCM_CERT_PROLONGATION             = 0x405;

// AvCmImport - ������ ������������ �/��� ��� �� �����
const AvCmLong AVCM_ANY_FILE               = 0x406;


// ***************   O C S P ***********************************
const AvCmLong AVCM_OCSP_STATUS = 0x311;
const AvCmLong AVCM_OCSP_THIS_UPDATE = 0x312;
const AvCmLong AVCM_OCSP_NEXT_UPDATE = 0x313;
const AvCmLong AVCM_OCSP_REV_TIME = 0x314;
const AvCmLong AVCM_OCSP_REV_REASON_AS_DWORD = 0x315;
const AvCmLong AVCM_OCSP_RESPONSE_CERT = 0x316;

const AvCmLong AVCM_OCSP_SIGN_RESPONSE_COUNT = 0x321;
const AvCmLong AVCM_OCSP_SIGN_RESPONSE_BYNUM = 0x322;

const AvCmLong AVCM_CONST_BASE = 0xDA370100;

//   ������ ����������� OCSPSingleResponse

const AvCmLong AVCM_OCSP_STATUS_GOOD =       (AVCM_CONST_BASE + 1);
const AvCmLong AVCM_OCSP_STATUS_REVOKED =    (AVCM_CONST_BASE + 2);
const AvCmLong AVCM_OCSP_STATUS_UNKNOWN =    (AVCM_CONST_BASE + 3);
const AvCmLong AVCM_OCSP_STATUS_BAD =        (AVCM_CONST_BASE + 4);

// ***************   S C E P ***********************************
// ���������� ����������� �� ��������, ������� AvCmScepGet
const AvCmLong AVCM_CONTAINERCOUNT = 0x326;
// ������ �� ����������, ������� AvCmScepSet
const AvCmLong AVCM_SCEP_REQUEST = 0x327;
const AvCmLong AVCM_SCEP_PKCS_REQ = 0x328;
const AvCmLong AVCM_SCEP_GET_CERT_INITIAL = 0x329;
const AvCmLong AVCM_SCEP_LOGIN = 0x330;

// ������ �� ���������� ��� ������� AvCmGenerateRequest
const DWORD AVCM_TEMPLATE_DATA = 0x331;

// ������ �������� ��������� �����
const DWORD AVCM_CARDS_DATA = 0x332;

// ��������� CA ������� SCEP /AVCMF_SCEP_OFFLINE
const DWORD AVCM_SCEP_CACERT = 0x333;

// ���������/��������� ������ ��� ������� SCEP /AVCMF_SCEP_OFFLINE
const DWORD AVCM_SCEP_PKIOPERATION = 0x334;

const DWORD AVCM_SCEP_PKCS_REQ_PREPARE = 0x335;
const DWORD AVCM_SCEP_PKCS_REQ_ENROLL = 0x336;
const DWORD AVCM_REQUEST_STATE = 0x337;

// ��� ����������, ������� AvCmScepGet
const AvCmLong AVCM_CONTAINERNAME       = 0x1045;
const AvCmLong AVCM_SCEP_TRANSACTIONID  = 0x1046;

const AvCmLong AVCM_MSG_INI  = 0x1047;

// ��������� URL � SCEP /AvCmGetRequestAttr
const AvCmLong AVCM_SCEP_URL  = 0x1048;

// �� ������� �������
const AvCmLong AVCM_REQUEST_STATE_INBOX = 0x1;
// ���������
const AvCmLong AVCM_REQUEST_STATE_PROCESSED = 0x2;
// �������� � ������ �����������
const AvCmLong AVCM_REQUEST_STATE_REJECTED = 0x3;
// ��������� � ������ ���������
const AvCmLong AVCM_REQUEST_STATE_MANUALPROCESSING = 0x4;
// �������� ������ �������
const AvCmLong AVCM_REQUEST_STATE_SIGN_WAIT = 0x5;
// �������� ��������� �������� SCEP
const AvCmLong AVCM_REQUEST_STATE_PENDING = 0x6;

// ���������� ������� ������� �����������
const AvCmLong AVCM_POLICYINFO_COUNT = 0x338;
// �������� �������� �����������
const AvCmLong AVCM_POLICYINFO_OID = 0x1049;

const AvCmLong AVCM_VIEW_SIGN_ATTR = 0x339;

// ���� ������� � LDAP
const AvCmLong AVCM_LDAP_PATH = 0x1050;

// �������� ����� ��������� �����������, �� ��������� �������� ������� ����������
const AvCmLong AVCM_BASE_SERIAL_AS_STRING = 0x1051;
// ��� �������� ��������� �����������, �� ��������� �������� ������� ����������
const AvCmLong AVCM_BASE_ISSUER_AS_STRING = 0x1052;

// 4.0.0

const AvCmLong AVCM_HASH_VALUE = 0x402;
const AvCmLong AVCM_UNP = 0x1065;

// TLS + SOAP
const AvCmLong AVCM_HTTPS_URL = 0x410;
const AvCmLong AVCM_HTTPS_PROXY_VERSION = 0x411;
const AvCmLong AVCM_HTTPS_PROXY = 0x412;
const AvCmLong AVCM_TLS_CERT = 0x413;
const AvCmLong AVCM_TLS_TRUSTS_CERTS = 0x414;
const AvCmLong AVCM_HTTPS_USERAGENT = 0x415;
const AvCmLong AVCM_HTTPS_CONTENTTYPE = 0x416;

const AvCmLong AVCM_EXT_OR_SUBJECT = 0x1053;


//--------- ������� ���������� ---------
// ��� ������� ����������
#define AVCM_FUNCTION __declspec( dllimport ) AvCmResult __stdcall 


#if defined (__cplusplus)
extern "C"
{
#endif /* defined (__cplusplus) */

// ������������� ����������.
AVCM_FUNCTION AvCmInit(
    AvCmLong flags);

// ������� ����������� ������������ � �������� ������.
AVCM_FUNCTION  AvCmLogin(
    AvCmSize conn_param_count,
    const AvCmConnectionParam * conn_params,
    AvCmHc * hc, 
    AvCmLong flags);

// ������� �������� ������.
AVCM_FUNCTION AvCmLogout(
    AvCmHc hc, 
    AvCmLong flags);

// ������� ��� ������ ������ ������ 
AVCM_FUNCTION AvCmFlush(
    AvCmHc hc, 
    AvCmLong flags);

   
// ������� ��������� ������������ ���������.
AVCM_FUNCTION AvCmSign(
    AvCmHc hc, 
    const void * input_message,
    AvCmSize input_size,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� �������� ������� � ��������� ��������� ���������.
AVCM_FUNCTION AvCmVerifySign(
    AvCmHc hc, 
    const void * input_message,
    AvCmSize input_size,
    AvCmHsgnCertEnum * hsgn_cert_enum,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ������������ ���������.
AVCM_FUNCTION AvCmEncrypt(
    AvCmHc hc,
    const void * input_message,
    AvCmSize input_size,
    AvCmSize cert_count,
    const AvCmHcert * certificates,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ������������� ����������� �������������� ���������.
AVCM_FUNCTION AvCmDecrypt(
    AvCmHc hc,
    const void * input_message,
    AvCmSize input_size,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ��������� ������������ ��������� � ����������� ��� �������������.
AVCM_FUNCTION AvCmSignAndEncrypt(
    AvCmHc hc,
    const void * input_message,
    AvCmSize input_size,
    AvCmSize cert_count,
    const AvCmHcert * certificates,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ������������� ��������� � ����������� ��������� �������, 
// � ��������� ��������� ���������
AVCM_FUNCTION AvCmDecryptAndVerifySign(
    AvCmHc hc, 
    const void * input_message,
    AvCmSize input_size,
    AvCmHsgnCertEnum * hsgn_cert_enum,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ��������� ���������� �������� ������� ����������. 
AVCM_FUNCTION AvCmGetObjectInfo(
    AvCmHandle handle,
    AvCmLong param_id,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� �������� ����� �������, 
// ������������ ���������� ������������ ������� ����������.
AVCM_FUNCTION AvCmDuplicateHandle(
    AvCmHandle source_handle,
    AvCmHc dest_hc,
    AvCmHandle * copy_of_handle,
    AvCmLong flags);

// ������� �������� ����������� ������� ����������, 
// ����������� � ���������� ������ �� ������� ����������
AVCM_FUNCTION AvCmCloseHandle(
    AvCmHandle handle,
    AvCmLong flags);

// ������� �������� ��� �������� � ������� ������������ 
// ��� �������������� ���������.
AVCM_FUNCTION AvCmOpenMsg(
    AvCmHc hc,
    const void * message_data,
    AvCmSize message_size,
    AvCmHmsg * hmsg,
    AvCmLong flags);

// ������� ��������� ���������� ��������� ���������.
AVCM_FUNCTION AvCmGetMsgParam(
    AvCmHmsg hmsg,
    AvCmLong attr_id,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ��������� ������� ��� ����������.
AVCM_FUNCTION AvCmMsgSign(
    AvCmHmsg hmsg,
    AvCmLong flags);

// ������� �������� ������� � �������� ����������� ���������.
AVCM_FUNCTION AvCmMsgVerifySign(
    AvCmHmsg hmsg,
    AvCmHcert hcert,
    AvCmLong flags);

// ������� ������������ ��������� ���������.
AVCM_FUNCTION AvCmMsgEncrypt(
    AvCmHmsg hmsg,
    AvCmSize cert_count,
    const AvCmHcert * certificates,
    AvCmLong flags);

// ������� ������������� ��������� �������������� ���������.
AVCM_FUNCTION AvCmMsgDecrypt(
    AvCmHmsg hmsg,
    AvCmLong flags);

// ������� ��������� ���������������� ��������� 
// � ����� �� �������������� ��������.
AVCM_FUNCTION AvCmGetMsg(
    AvCmHmsg hmsg,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ���������� ����������� ���������.
AVCM_FUNCTION AvCmGetMsgContent(
    AvCmHmsg hmsg,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ��������� ����������� ���������.
AVCM_FUNCTION AvCmSetMsgContent(
    AvCmHmsg hmsg,
    void * input_buffer,
    AvCmSize input_size,
    AvCmLong flags);

// ������� ���������� ����� �� �������� ������� ������������ ���������.
AVCM_FUNCTION AvCmGetMsgSign(
    AvCmHmsg hmsg,
    AvCmSize sign_number,
    AvCmHsign * hsign,
    AvCmLong flags);

// ������� ���������� ��������� �������.
AVCM_FUNCTION AvCmGetSignAttr(
    AvCmHandle handle,
    AvCmLong attr_id,
    const void * attr_param,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ������ ����������� �� ��� �������.
AVCM_FUNCTION AvCmFindCertBySign(
    AvCmHsign hsign,
    AvCmHcert * hcert,
    AvCmLong flags);

// ������� ���������� ��������� �����������.
AVCM_FUNCTION AvCmGetCertAttr(
    AvCmHandle handle,
    AvCmLong attr_id,
    const void * attr_param,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� �������� ��������� ������ ����������� ����� 
// �������� ������������ ������������, 
// ��������������� ������������ ��������.
AVCM_FUNCTION AvCmOpenCertEnum(
    AvCmHc hc,
    AvCmSize param_count,
    const AvCmEnumGetParam * params,
    AvCmHcertEnum * hcert_enum,
    AvCmLong flags);

// ������� �������� �������� � �������� ������������.
AVCM_FUNCTION AvCmEnumGet(
    AvCmHenum henum,
    AvCmHandle * handle,
    AvCmLong flags);

// ������� ���������� ��������� ��������� ��������� 
// � �������� ������ ����� �� ������� ���������� ������.
AVCM_FUNCTION AvCmGetErrorInfo(
    AvCmHc hc, 
    AvCmResult error_code, 
    AvCmLong param_id,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ���������� ����������� � ���������
AVCM_FUNCTION AvCmMsgAddCert(
    AvCmHmsg hmsg,
    AvCmSize cert_count,
    const AvCmHandle * certificates,
    AvCmLong flags);

// ������� ������� ������������ �� ���������
AVCM_FUNCTION AvCmMsgImportCerts(AvCmHmsg HMsg, AvCmLong flags);

// ������� ��������� ���-�������
// deprecated
AVCM_FUNCTION AvCmMsgGetSTBSign(
    AvCmHmsg HMsg, 
    void* pBuffer, 
    AvCmSize* pBufferSize,
    AvCmLong flags);

  
// ������� ������ ���������� �� �������
AVCM_FUNCTION AvCmShowObjectInfo(
        AvCmHandle handle,
    const char* cpszDlgCaption,
    const char*  cpszLabel,
    const char* cpszOkButtonCaption,
    AvCmLong flags);

AVCM_FUNCTION AvCmShowObjectInfoExt(
	AvCmHandle handle,
	AvCmLong /*HWND*/ hwnd,
	AvCmHandle* handle2,
	AvCmLong flags);

// ������� ���������� ������������ � ��������
AVCM_FUNCTION AvCmEnumAddCerts(
    AvCmHcertEnum hcert_enum,
    AvCmSize param_count,
    const AvCmEnumGetParam * params,
    AvCmLong flags);

// ������� �������� ������� � �������� ����������� ��������� �� ������
AVCM_FUNCTION AvCmMsgVerifySignAtIndex(
    AvCmHmsg hmsg,
    AvCmSize sign_index,
    AvCmLong flags);

AVCM_FUNCTION AvCmMsgUpdate(
    AvCmHmsg hmsg,
    void* pBuffer,
    AvCmSize iBufferSize,
    void* pOut,
    AvCmSize* pOutSize,
    AvCmLong flags);

// ������� �������� ������� � �������� ����������� ��������� �� ������ �� �������� ����
/*AVCM_FUNCTION AvCmMsgVerifySignAtIndexForDate(
    AvCmHmsg hmsg,
    SystemTime* verifydate,	
    AvCmSize sign_index,
    AvCmLong flags);*/

// ������� ��������� �������������� ��������� ��������� ��������� ��� �������
AVCM_FUNCTION AvCmMsgSetAttribute(
	AvCmHmsg hmsg,
	AvCmLong attr_id,
	void* attr_param,
	void* input_buffer,
	AvCmSize input_size,
	AvCmLong flags);

// ������������� ���������� � ��������� �������� ��������.
AVCM_FUNCTION AvCmInitEx(
    const char* cpszWorkDir,
    AvCmLong flags);

// ������� �������� ���������� ���������
AVCM_FUNCTION AvCmOpenInnerMsg(
    AvCmHmsg hmsg,
    AvCmHmsg * hmsg_inner,
    AvCmLong flags);

// ������� ������� �������� ���������
AVCM_FUNCTION AvCmEnumDlg(
        AvCmHc hc,
        const char* cpszDlgCaption,
        const char* cpszLabel,
        const char* cpszOkButtonCaption,
        AvCmHcertEnum * hcert_enum,
    AvCmLong flags);

// ������� ������� ����������� ��� ������ ���������� ������������
AVCM_FUNCTION AvCmImport(
        AvCmHc hc,
        AvCmLong obj_type,
        const void * input_data,
        AvCmSize input_size,
        AvCmSize param_count,
        const AvCmImportParam * params,
        AvCmLong flags);

// ������� ������ � �������� ������ ���������� ������������
AVCM_FUNCTION AvCmFindCrl(
        AvCmHc hc,
        AvCmSize param_count,
        const AvCmFindCrlParam * params,
        AvCmHcrl * hcrl,
        AvCmLong flags);

// ������� ���������� ��������� ������ ���������� ������������. 
AVCM_FUNCTION AvCmGetCrlAttr(
    const AvCmHcrl hcrl,
    AvCmLong attr_id,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// ������� ������������� ��� ��������� ������� �� ����������.
AVCM_FUNCTION AvCmGenerateRequest(
        AvCmHc hc,
        AvCmSize param_count,
        const AvCmGenReqParam * params,
        AvCmHreq * hreq,
        AvCmLong flags);

// ������� ������������� ��� ���������� ��������� ������� �� ����������.
AVCM_FUNCTION AvCmGetRequestAttr(
        AvCmHreq hreq,
        AvCmLong attr_id,
        void * output_buffer,
        AvCmSize * output_size,
        AvCmLong flags);

//������� ������������� ��� ������ � �������� ������� �� ����������. 
AVCM_FUNCTION AvCmFindRequest(
        AvCmHc hc,
        AvCmSize param_count,
        const AvCmFindReqParam * params,
        const AvCmHreq * hreq,
        AvCmLong flags);

// ������� ������������� ��� ��������� �����������, ������������ �� ��������� � ���������� ������������. 
AVCM_FUNCTION AvCmPutCert(
        AvCmHandle handle,
        AvCmLong flags);

AVCM_FUNCTION AvCmPutCert(
        AvCmHandle handle,
        AvCmLong flags);


AVCM_FUNCTION AvCmSignRawData(
        AvCmHc hc,
        const char* hash_and_sign_oid,
        const void* data,
        AvCmSize data_size,
        void * output_buffer,
        AvCmSize * output_size,
        AvCmLong flags);

// ������� ������������� ��� �������� ������� �����������
AVCM_FUNCTION AvCmVerifyCertStatus(
    AvCmHandle handle,
    AvCmSize param_count,
        const AvCmCertStatParam * params,
        AvCmLong * status_ok,
    AvCmHcertstat * hstatus,
    AvCmLong flags);

// ������� ������������� ��� ��������� ������ ������� �����������
AVCM_FUNCTION AvCmGetCertStatusAttr(
    AvCmHcertstat hstatus,
    AvCmLong attr_id,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

//������� ������������� ��� �������� ��� 
AVCM_FUNCTION AvCmVerifyRawDataSign(
        AvCmHcert hcert,
        const char* hash_and_sign_oid,
        const void* data_to_be_verified,
        AvCmSize data_size,
        const void * sign_value,
        AvCmSize sign_size,
        AvCmLong flags);
    
//������� ��������� ����������� ����������
AVCM_FUNCTION AvCmSetActiveWindow(
        AvCmLong /*HWND*/ hwnd,
        AvCmLong flags);

//��������� ���������� � ������� �����������
AVCM_FUNCTION AvCmMsgOCSPGetResponse(
    AvCmHandle handle,
    AvCmLong sign_index,
    const AvCmHOCSP * hr,
    AvCmLong flags);

//���������� ��������� ���������� � ������� �����������
AVCM_FUNCTION AvCmMsgOCSPGetResponseAttr (
    AvCmHOCSP hr,
    AvCmLong attr_id,
    const void * attr_param,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

//���������� ���������� � ������� ����������� � ����������� ���������
AVCM_FUNCTION AvCmMsgOCSPAddResponse(
    AvCmHandle handle, 
    AvCmLong sign_index,
    AvCmHOCSP hr,
    AvCmLong flags);

AVCM_FUNCTION AvCmOpenCert(
    AvCmHc hc,
    const void * input_buffer,
    AvCmSize buffer_size,
    AvCmHandle* hcert,
    AvCmLong flags);

AVCM_FUNCTION AvCmOpenCRL(
    AvCmHc hc,
    const void * input_buffer,
    AvCmSize buffer_size,
    AvCmHandle* hcrl,
    AvCmLong flags);

AVCM_FUNCTION AvCmCreateScep(
    AvCmHc hc,
    const char* url,
    AvCmHandle* hscep,
    AvCmLong flags);

AVCM_FUNCTION AvCmScepExecute(
    AvCmHandle hscep,
    AvCmLong oper_id,
    AvCmLong flags);

AVCM_FUNCTION AvCmScepGet(
    AvCmHandle hscep,
    AvCmLong attr_id,
    const void * attr_param,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

AVCM_FUNCTION AvCmScepSet(
    AvCmHandle hscep,
    AvCmLong attr_id,
    const void * input_buffer,
    AvCmSize buffer_size,
    AvCmLong flags);

AVCM_FUNCTION AvCmOpenEnum(
    AvCmHc hc,
    const void* crypt_sql,
    AvCmHenum * henum,
    AvCmLong obj_type,
    AvCmLong flags);

AVCM_FUNCTION AvCmTLSCreateConnect(
	AvCmHc hc, 
	AvCmLong conn_param_count, 
	const AvCmConnectionParam * conn_params, 
	AvCmHandle * htls, 
	AvCmLong flags);

AVCM_FUNCTION AvCmTlsGet(
	AvCmHandle htsl, 
	const char * URL, 
	void * res_data, 
	AvCmSize * res_size, 
	AvCmLong flags);

AVCM_FUNCTION AvCmTlsPost(
	AvCmHandle htsl, 
	const char * URL, 
	const void * data, 
	AvCmSize data_size, 
	void * res_data, 
	AvCmSize * res_size, 
	AvCmLong flags);

AVCM_FUNCTION AvCmDebugLog(
	const char * app,
	const char * msg,
	const char * rem,
	AvCmLong flags);

#if defined (__cplusplus)
} /* extern "C" */
#endif /* defined (__cplusplus) */

#endif // !defined(AVCRYPTMAIL_H)
