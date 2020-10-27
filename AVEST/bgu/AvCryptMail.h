// Заголовочный файл библиотеки AvCryptMail
// (C) AVEST plc., 2003-2005
// Версия: 2.23.3


#if !defined(AVCRYPTMAIL_H)
#define AVCRYPTMAIL_H

#include "AvCryptMailBase.h"

// ----- Типы, определяемые библиотекой AvCryptMail -----

// Дескриптор объекта библиотеки.
typedef void* AvCmHandle;

// Дескриптор подключившегося пользователя.
typedef AvCmHandle AvCmHc;

// Дескриптор открытого сообщения.
typedef AvCmHandle AvCmHmsg;

// Дескриптор одной из подписей сообщения.
typedef AvCmHandle AvCmHsign;

// Дескриптор открытого серификата.
typedef AvCmHandle AvCmHcert;

// Дескриптор подписи и соответствующего сертификата,
// полученные в результате вызова функций проверки ЭЦП.
typedef AvCmHandle AvCmHsignCert;

// Дескриптор открытого контекста перебора объектов.
typedef AvCmHandle AvCmHenum;

// Дескриптор открытого контекста перебора сертификатов.
typedef AvCmHenum AvCmHcertEnum;

// Дескриптор открытого контекста перебора информации 
// о подписях и соответствующих сертификатах подписанного сообщения.
typedef AvCmHenum AvCmHsgnCertEnum;

// Дескриптор открытого списка отозванных сертификатов 
typedef AvCmHandle AvCmHcrl;

// Дескриптор открытого запроса на сертификат 
typedef AvCmHandle AvCmHreq;

// Дескриптор статуса серификата.
typedef AvCmHandle AvCmHcertstat;

// Дескриптор информации о статусе сертификата.
typedef AvCmHandle AvCmHOCSP;



#pragma pack(1)

// Данные необходимые при подключении для идентификации пользователя
// и подключения к справочникам сертификатов/СОС.
// В настоящее время планируется хранениие
// справочников сертификатов в базе данных.
struct AvCmConnectionParam {
     AvCmLong   param_id; // идентификатор параметра
     const void  * param;    // значение параметра
};
   
// Атрибуты поиска объектов.
struct AvCmEnumGetParam {
   AvCmLong param_id;     // идентификатор параметра
   const void * param_spec;  // уточнение идентификатора
   const void * param;       // значение параметра
};

// Атрибуты импорта объектов.
struct AvCmImportParam {
   AvCmLong param_id;  // идентификатор параметра
   void * param;    // значение параметра
};

// Данные используемые при поиске списков отозванных сертификатов.
struct AvCmFindCrlParam {
   AvCmLong param_id;  // идентификатор параметра
   void * param;    // значение параметра
};

// Данные используемые при генерации запроса на сертификат.
struct AvCmGenReqParam {
   AvCmLong param_id;  // идентификатор параметра
   void * param;    // значение параметра
};

// Данные используемые при поиске запроса на сертификат.
struct AvCmFindReqParam {
   AvCmLong param_id;  // идентификатор параметра
   void * param;    // значение параметра
};

// Данные используемые при запросе статуса сертификата
struct AvCmCertStatParam {
   AvCmLong param_id;  // идентификатор параметра
   void * param;    // значение параметра
};


#pragma pack( )



// ------- Флаги функций -------

// Для функции AvCmInit
// данный флаг необходимо использовать для первоначальной инициализации библиотеки
// const AvCmLong AVCMF_STARTUP         = 0x1;

// AvCmInit: данный флаг необходимо использовать для освобождения ресурсов библиотеки 
// перед ее выгрузкой из адресного пространства процесса.
// const AvCmLong AVCMF_SHUTDOWN        = 0x2;

// Для функции AvCmInit
// Проверка интегрити через mac.ini
const AvCmLong AVCMF_CHECK_FILES_INTEGRITY = 0x4;

// Для функции AvCmOpenMsg
// Входные данные будут вставлены в выходное сообщение как PKCS#7 Data.
const AvCmLong AVCMF_IN_RAW_DATA        = 0x100;

// Для функции AvCmSign AvCmEncrypt AvCmDecrypt AvCmSignAndEncrypt AvCmOpenMsg  
// Входное сообщение в формате PKCS#7.
const AvCmLong AVCMF_IN_PKCS7           = 0x200;

// Для функции AvCmPutCert
// Импорт всех сертификатов и списков отозванных сертификатов из указанного сообщения
const AvCmLong AVCMF_MESSAGE           = 0x1000;

// Для функции AvCmSign AvCmEncrypt AvCmDecrypt AvCmSignAndEncrypt AvCmGetMsg 
// Выходное сообщение в формате PKCS#7.
const AvCmLong AVCMF_OUT_PKCS7           = 0x2000;

// Для функции AvCmGetSignAttr AvCmGetCertAttr
// Атрибут по номеру.
const AvCmLong AVCMF_ATTR_BY_NUM     = 0x400000;


// Для функции AvCmGetSignAttr AvCmGetCertAttr 
// Атрибут по его идентификатору объекта (OID).
const AvCmLong AVCMF_ATTR_BY_OID     = 0x800000;


// Для функции AvCmEnumGet
// Получить следующий по порядку элемент перечисления.
const AvCmLong AVCMF_NEXT            = 0x40;

// Для функции AvCmEnumGet
// Начать перебор сертификатов с начала.
const AvCmLong AVCMF_START           = 0x80;

// Для функции AvCmOpenCertEnum
// Передача дескриптора сертификата для выборки атрибутных сертификатов
const AvCmLong AVCM_ATTRIBUTE_CERTS  = 0x323;

 
 
// Функция должна самостоятельно распределить память
// для выходного сообщения функцией Win32 API HeapAlloc,
// после использования выходного сообщения, вызвавшая программа
// должна самостоятельно очистить выделенную память функцией HeapFree.
const AvCmLong AVCMF_ALLOC           = 0x1000000;


// AvCmSetMsgContent: Добавить данные к содержимому сообщения 
const AvCmLong AVCMF_APPEND           = 0x4000000;

   




// AvCmImport: вернуть дескриптор объекта, если он присутствует в справочниках
const AvCmLong AVCMF_RETURN_HANDLE_IF_EXISTS = 0x1;



// Для функции AvCmVerifySign AvCmDecryptAndVerifySign 
// Не заполнять  выходное сообщение
const AvCmLong AVCMF_NO_OUTPUT       = 0x200000;

// Для функции AvCmVerifySign и AvCmDecryptAndVerifySign
// Импорт сертификаты и списки отозванных сертификатов 
// из сообщения в хранилище сертификатов. 
const AvCmLong AVCMF_IMPORT          = 0x10;

// Для функции AvCmImport
// после импорта сертификатов обязательно вывести диалог выбора контейнера с личным ключом
const AvCmLong AVCMF_SELECT_MY_CERT        = 0x2;


// Для функции AvCmGetErrorInfo
// Получить ошибку сессии по идентификатору вызывающего потока.
const AvCmLong AVCMF_THREAD_ERROR    = 0x08;

// AvCmMsgVerifySign, AvCmMsgVerifySignAtIndex, AvCmVerifyRawDataSign 
// Игнорировать отсутствие подходящего СОС
const AvCmLong AVCMF_NO_CRL_VERIFY        = 0x20;



// ----- Атрибуты функции AvCmGetObjectInfo -----

// Получение дескриптора личного сертификата. 
const AvCmLong AVCM_MY_CERT            = 0x8;

// Получение количество дочерних объектов.
const AvCmLong AVCM_CHILDREN_COUNT     = 0x9;



// ----- Атрибуты функции AvCmGetMsgParam -----

// вид открытого сообщения.
const AvCmLong AVCM_FORMAT             = 0xA;

// данные не имеют структуры PKCS#7.
const AvCmLong AVCM_MF_RAW_DATA        = 0x103;

// данные не имеют структуры PKCS#7.
const AvCmLong AVCM_MF_NONE        = 0x104;

// подписанное сообщение в формате PKCS#7 SignedData.
const AvCmLong AVCM_MF_SIGNED_DATA     = 0x105;

// зашифрованное сообщение в формате PKCS#7 EnvelopedData.
const AvCmLong AVCM_MF_ENVELOPED_DATA  = 0x106;

// количество подписей в подписанном сообщении.
const AvCmLong AVCM_SIGN_COUNT         = 0x107;

// данные о формате вложенного сообщения
const AvCmLong AVCM_INNER_FORMAT       = 0x108;


// ----- Атрибуты функций AvCmGetSignAttr AvCmGetCertAttr AvCmOpenCertEnum AvCmGetRequestAttr -----

// количество атрибутов имени (X.509 Name) владельца сертификата
const AvCmLong AVCM_SUBJECT_ATTR_COUNT            = 0x1;

// количество атрибутов имени (X.509 Name) издателя сертификата
const AvCmLong AVCM_ISSUER_ATTR_COUNT            = 0x2;

// идентификатор объекта (OID) атрибута имени владельца сертификата в виде строки
const AvCmLong AVCM_SUBJECT_ATTR_OID            = 0x1033;

// идентификатор объекта (OID) атрибута имени владельца сертификата в виде строки
const AvCmLong AVCM_ISSUER_ATTR_OID            = 0x1034;

// значение дополнения сертификата в виде BLOB
const AvCmLong AVCM_EXT_BLOB            = 0x5;

// значение атрибута сертификата в виде BLOB
const AvCmLong AVCM_ATTR_BLOB            = 0x325;

// идентификатор подписанного атрибута в виде строки ASCIIZ
const AvCmLong AVCM_AUTH_OID            = 0x1040; //0x6;

// идентификатор неподписанного атрибута в виде строки ASCIIZ
const AvCmLong AVCM_UNAUTH_OID            = 0x1041; //0x7;

// значение подписанного атрибута в виде BLOB
const AvCmLong AVCM_AUTH_BLOB            = 0x8;

// значение неподписанного атрибута в виде BLOB
const AvCmLong AVCM_UNAUTH_BLOB            = 0x9;

// версия подписи
const AvCmLong AVCM_VERSION            = 0xB;

// идентификатор алгоритма хэширования
const AvCmLong AVCM_HASH_ALG_OID       = 0x1010;

// идентификатор алгоритма подписи
const AvCmLong AVCM_SIGN_ALG_OID       = 0x1011;

// подпись
const AvCmLong AVCM_SIGN               = 0x12;

// дата и время выработки подписи, которые находятся в 
// списке подписанных атрибутов сообщения.
const AvCmLong AVCM_SIGN_DATE_TIME     = 0x13;

// количество подписанных атрибутов
const AvCmLong AVCM_AUTH_COUNT         = 0x14;

// количество количество неподписанных атрибутов
const AvCmLong AVCM_UNAUTH_COUNT       = 0x15;

// подписанный атрибут в виде строки ASCIIZ
const AvCmLong AVCM_AUTH_AS_STRING     = 0x1016;

// неподписанный атрибут в виде строки ASCIIZ
const AvCmLong AVCM_UNAUTH_AS_STRING   = 0x1017;

// Результат полной проверки корректности сертификата
const AvCmLong AVCM_VALID            = 0x2C;

// DER-представление сертификата
const AvCmLong AVCM_BLOB              = 0x2D;

// Получение режима сгенерированного запроса (совместимости с MS CA).
const AvCmLong AVCM_MSCA_COMPATIBLE   = 0x30;

// идентификатор алгоритма открытого ключа сертификата
const AvCmLong AVCM_PUB_KEY_ALG_OID    = 0x101E;

// количество дополнительных атрибутов
const AvCmLong AVCM_EXT_COUNT          = 0x21;

// идентификатор объекта (OID) дополнения
const AvCmLong AVCM_EXT_OID            = 0x1022;

// наименование идентификатора объекта (OID) дополнения
const AvCmLong AVCM_EXT_OID_NAME       = 0x1026;

// признак критичности дополнения
const AvCmLong AVCM_EXT_CRITICAL       = 0x23;

// количество элементов в списке ограничений применения ключа сертификата
const AvCmLong AVCM_EXT_KEY_USAGE_COUNT  = 0x28;

// наименование идентификатора объекта (OID) из списка ограничений 
// применения ключа сертификата, в том случае, 
// если данный OID зарегестрирован в операционной системе.  
// При этом необходима передача номера либо идентификатора в списке (параметр attr_param).  
const AvCmLong AVCM_EXT_KEY_USAGE_NAME  = 0x1028;

// количество дополнительных атрибутов
const AvCmLong AVCM_ATTR_COUNT          = 0x324;

// идентификатор объекта (OID) дополнения
const AvCmLong AVCM_ATTR_OID            = 0x1042;

// наименование идентификатора объекта (OID) атрибута
const AvCmLong AVCM_ATTR_OID_NAME       = 0x1044;

// Параметры функции AvCmGetErrorInfo 
// краткое описание ошибки
const AvCmLong AVCM_SHORT_STRING = 0x1;

// подробное описание ошибки
const AvCmLong AVCM_DESCRIPTION = 0x2;

// код ошибки библиотеки. 
// В этом случае в качестве указателя на выходной  буфер 
// должен быть передан указатель на AvCmLong.
const AvCmLong AVCM_ERROR_CODE = 0x3;

// вернуть дескриптор импортированного и открытого объекта
const AvCmLong AVCM_RESULT_HANDLE = 0x2;
 


// DER-представление сертификата
const AvCmLong AVCM_CERTIFICATE = 0x1;

// DER-представление списка отозванных сертификатов
const AvCmLong AVCM_CRL = 0x2;

// DER-представление запроса на сертификат в формате PKCS#10
const AvCmLong AVCM_PKCS10_REQUEST = 0x4;

// DER-представление подписанной заявки на сертификат в формате PKCS#7 SignedData
const AvCmLong AVCM_PKCS7_REQUEST = 0x5;

// DER-представление цепочки сертификатов (p7b)
const AvCmLong AVCM_PKCS7_CHAIN = 0x8;

// DER-представление атрибутного сертификата
const AvCmLong AVCM_ATTRIBUTE_CERTIFICATE = 0x9;

// Используется совместно с AvCmLogin:AVCM_DBT_E_MEMORY
const AvCmLong AVCM_STORES = 0xC9;

// дата/время издания списка отозванных  сертификатов
const AvCmLong AVCM_THIS_UPDATE = 0x1A;

// дата/время окончания действия списка отозванных  сертификатов
const AvCmLong AVCM_NEXT_UPDATE = 0x1B;

// SHA-1 хэш от DER-представление списка отозванных сертификатов
const AvCmLong AVCM_SHA1_HASH = 0x2E;

// дата/время отзыва сертификата
const AvCmLong AVCM_CS_REVOCATION_TIME            = 0x301;

// причина отзыва сертификата
const AvCmLong AVCM_CS_REVOCATION_REASON          = 0x302;

// причина недоверия сертификату
const AvCmLong AVCM_CS_UNTRUST_REASON             = 0x303;

// режим проверки статуса
const AvCmLong AVCM_CHECK_MODE                    = 0x401;

// проверка статуса с использованием локального СОС
const AvCmLong AVCM_CM_OFFLINE                    = 0x402;

// проверка статуса сертификата с обращением
const AvCmLong AVCM_CM_ONLINE                     = 0x403;

// адрес OCSP сервера
const AvCmLong AVCM_RESPONDER_URL                 = 0x404;


// Список точек распостранения  СОС из сертификата
const AvCmLong AVCM_CRL_DISTRIBUTION_POINTS       = 0x1035;

// Каталог по умолчанию для выбора импортируемого файла
const AvCmLong AVCM_IMPORT_PATH       = 0x1036;

// Каталог по умолчанию для сохранения файла созданного запроса
const AvCmLong AVCM_EXPORT_PATH       = 0x1037;

// Указывает на необходимость создания информационного файла с описанием выполненных операций. 
// Полный путь и имя файла описания выполненной операции
const AvCmLong AVCM_OPERATION_REPORT       = 0x1038;


// AvCmGenerateRequest – сгенерировать запрос в продолжение переданного сертификата
const AvCmLong AVCM_CERT_PROLONGATION             = 0x405;

// AvCmImport - импорт сертификатов и/или СОС из файла
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

//   Статус сертификата OCSPSingleResponse

const AvCmLong AVCM_OCSP_STATUS_GOOD =       (AVCM_CONST_BASE + 1);
const AvCmLong AVCM_OCSP_STATUS_REVOKED =    (AVCM_CONST_BASE + 2);
const AvCmLong AVCM_OCSP_STATUS_UNKNOWN =    (AVCM_CONST_BASE + 3);
const AvCmLong AVCM_OCSP_STATUS_BAD =        (AVCM_CONST_BASE + 4);

// ***************   S C E P ***********************************
// количество контейнеров на носителе, функция AvCmScepGet
const AvCmLong AVCM_CONTAINERCOUNT = 0x326;
// запрос на сертификат, функция AvCmScepSet
const AvCmLong AVCM_SCEP_REQUEST = 0x327;
const AvCmLong AVCM_SCEP_PKCS_REQ = 0x328;
const AvCmLong AVCM_SCEP_GET_CERT_INITIAL = 0x329;
const AvCmLong AVCM_SCEP_LOGIN = 0x330;

// шаблон на сертификат для функции AvCmGenerateRequest
const DWORD AVCM_TEMPLATE_DATA = 0x331;

// шаблон карточки открытого ключа
const DWORD AVCM_CARDS_DATA = 0x332;

// Установка CA сервера SCEP /AVCMF_SCEP_OFFLINE
const DWORD AVCM_SCEP_CACERT = 0x333;

// Установка/получение данных для сервера SCEP /AVCMF_SCEP_OFFLINE
const DWORD AVCM_SCEP_PKIOPERATION = 0x334;

const DWORD AVCM_SCEP_PKCS_REQ_PREPARE = 0x335;
const DWORD AVCM_SCEP_PKCS_REQ_ENROLL = 0x336;
const DWORD AVCM_REQUEST_STATE = 0x337;

// имя контейнера, функция AvCmScepGet
const AvCmLong AVCM_CONTAINERNAME       = 0x1045;
const AvCmLong AVCM_SCEP_TRANSACTIONID  = 0x1046;

const AvCmLong AVCM_MSG_INI  = 0x1047;

// Получение URL к SCEP /AvCmGetRequestAttr
const AvCmLong AVCM_SCEP_URL  = 0x1048;

// во входной очереди
const AvCmLong AVCM_REQUEST_STATE_INBOX = 0x1;
// обработан
const AvCmLong AVCM_REQUEST_STATE_PROCESSED = 0x2;
// отказано в выдаче сертификата
const AvCmLong AVCM_REQUEST_STATE_REJECTED = 0x3;
// переведен в ручную обработку
const AvCmLong AVCM_REQUEST_STATE_MANUALPROCESSING = 0x4;
// ожидание второй подписи
const AvCmLong AVCM_REQUEST_STATE_SIGN_WAIT = 0x5;
// ожидание обработки сервером SCEP
const AvCmLong AVCM_REQUEST_STATE_PENDING = 0x6;

// Количество пунктов политик сертификата
const AvCmLong AVCM_POLICYINFO_COUNT = 0x338;
// описание политики сертификата
const AvCmLong AVCM_POLICYINFO_OID = 0x1049;

const AvCmLong AVCM_VIEW_SIGN_ATTR = 0x339;

// Путь доступа к LDAP
const AvCmLong AVCM_LDAP_PATH = 0x1050;

// Серийный номер исходного сертификата, на основании которого выпущен атрибутный
const AvCmLong AVCM_BASE_SERIAL_AS_STRING = 0x1051;
// Имя издателя исходного сертификата, на основании которого выпущен атрибутный
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


//--------- Функции библиотеки ---------
// Тип функции библиотеки
#define AVCM_FUNCTION __declspec( dllimport ) AvCmResult __stdcall 


#if defined (__cplusplus)
extern "C"
{
#endif /* defined (__cplusplus) */

// Инициализация библиотеки.
AVCM_FUNCTION AvCmInit(
    AvCmLong flags);

// Функция авторизации пользователя и создания сессии.
AVCM_FUNCTION  AvCmLogin(
    AvCmSize conn_param_count,
    const AvCmConnectionParam * conn_params,
    AvCmHc * hc, 
    AvCmLong flags);

// Функция закрытия сессии.
AVCM_FUNCTION AvCmLogout(
    AvCmHc hc, 
    AvCmLong flags);

// Функция для сброса данных сессии 
AVCM_FUNCTION AvCmFlush(
    AvCmHc hc, 
    AvCmLong flags);

   
// Функция генерации подписанного сообщения.
AVCM_FUNCTION AvCmSign(
    AvCmHc hc, 
    const void * input_message,
    AvCmSize input_size,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция проверки подписи и получения исходного сообщения.
AVCM_FUNCTION AvCmVerifySign(
    AvCmHc hc, 
    const void * input_message,
    AvCmSize input_size,
    AvCmHsgnCertEnum * hsgn_cert_enum,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция зашифрования сообщения.
AVCM_FUNCTION AvCmEncrypt(
    AvCmHc hc,
    const void * input_message,
    AvCmSize input_size,
    AvCmSize cert_count,
    const AvCmHcert * certificates,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция расшифрования полученного зашифрованного сообщения.
AVCM_FUNCTION AvCmDecrypt(
    AvCmHc hc,
    const void * input_message,
    AvCmSize input_size,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция генерации подписанного сообщения с последующим его зашифрованием.
AVCM_FUNCTION AvCmSignAndEncrypt(
    AvCmHc hc,
    const void * input_message,
    AvCmSize input_size,
    AvCmSize cert_count,
    const AvCmHcert * certificates,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция расшифрования сообщения с последующей проверкой подписи, 
// и получения исходного сообщения
AVCM_FUNCTION AvCmDecryptAndVerifySign(
    AvCmHc hc, 
    const void * input_message,
    AvCmSize input_size,
    AvCmHsgnCertEnum * hsgn_cert_enum,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция получения параметров открытой объекта библиотеки. 
AVCM_FUNCTION AvCmGetObjectInfo(
    AvCmHandle handle,
    AvCmLong param_id,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция создания копии объекта, 
// управляемого переданным дескриптором объекта библиотеки.
AVCM_FUNCTION AvCmDuplicateHandle(
    AvCmHandle source_handle,
    AvCmHc dest_hc,
    AvCmHandle * copy_of_handle,
    AvCmLong flags);

// Функция закрытия дескриптора объекта библиотеки, 
// полученного в результате одного из вызовов библиотеки
AVCM_FUNCTION AvCmCloseHandle(
    AvCmHandle handle,
    AvCmLong flags);

// Функция создания или открытия и разбора подписанного 
// или зашифрованного сообщения.
AVCM_FUNCTION AvCmOpenMsg(
    AvCmHc hc,
    const void * message_data,
    AvCmSize message_size,
    AvCmHmsg * hmsg,
    AvCmLong flags);

// Функция получения параметров открытого сообщения.
AVCM_FUNCTION AvCmGetMsgParam(
    AvCmHmsg hmsg,
    AvCmLong attr_id,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция выработки подписи под сообщением.
AVCM_FUNCTION AvCmMsgSign(
    AvCmHmsg hmsg,
    AvCmLong flags);

// Функция проверки подписи в открытом подписанном сообщении.
AVCM_FUNCTION AvCmMsgVerifySign(
    AvCmHmsg hmsg,
    AvCmHcert hcert,
    AvCmLong flags);

// Функция зашифрования открытого сообщения.
AVCM_FUNCTION AvCmMsgEncrypt(
    AvCmHmsg hmsg,
    AvCmSize cert_count,
    const AvCmHcert * certificates,
    AvCmLong flags);

// Функция расшифрования открытого зашифрованного сообщения.
AVCM_FUNCTION AvCmMsgDecrypt(
    AvCmHmsg hmsg,
    AvCmLong flags);

// Функция получения сгенерированного сообщения 
// в одном из экспортируемых форматов.
AVCM_FUNCTION AvCmGetMsg(
    AvCmHmsg hmsg,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция извлечения содержимого сообщения.
AVCM_FUNCTION AvCmGetMsgContent(
    AvCmHmsg hmsg,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция установки содержимого сообщения.
AVCM_FUNCTION AvCmSetMsgContent(
    AvCmHmsg hmsg,
    void * input_buffer,
    AvCmSize input_size,
    AvCmLong flags);

// Функция извлечения одной из подписей данного подписанного сообщения.
AVCM_FUNCTION AvCmGetMsgSign(
    AvCmHmsg hmsg,
    AvCmSize sign_number,
    AvCmHsign * hsign,
    AvCmLong flags);

// Функция извлечения атрибутов подписи.
AVCM_FUNCTION AvCmGetSignAttr(
    AvCmHandle handle,
    AvCmLong attr_id,
    const void * attr_param,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция поиска сертификата по его подписи.
AVCM_FUNCTION AvCmFindCertBySign(
    AvCmHsign hsign,
    AvCmHcert * hcert,
    AvCmLong flags);

// Функция извлечения атрибутов сертификата.
AVCM_FUNCTION AvCmGetCertAttr(
    AvCmHandle handle,
    AvCmLong attr_id,
    const void * attr_param,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция создания контекста поиска сертификата путем 
// перебора подмножества сертификатов, 
// удовлетворяющих определенным условиям.
AVCM_FUNCTION AvCmOpenCertEnum(
    AvCmHc hc,
    AvCmSize param_count,
    const AvCmEnumGetParam * params,
    AvCmHcertEnum * hcert_enum,
    AvCmLong flags);

// Функция перебора объектов в открытом перечислении.
AVCM_FUNCTION AvCmEnumGet(
    AvCmHenum henum,
    AvCmHandle * handle,
    AvCmLong flags);

// Функция возвращает различные параметры возникшей 
// в процессе работы одной из функций библиотеки ошибки.
AVCM_FUNCTION AvCmGetErrorInfo(
    AvCmHc hc, 
    AvCmResult error_code, 
    AvCmLong param_id,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция добавления сертификата в сообщение
AVCM_FUNCTION AvCmMsgAddCert(
    AvCmHmsg hmsg,
    AvCmSize cert_count,
    const AvCmHandle * certificates,
    AvCmLong flags);

// Функция импорта сертификатов из сообщения
AVCM_FUNCTION AvCmMsgImportCerts(AvCmHmsg HMsg, AvCmLong flags);

// Функция генерации СТБ-подписи
// deprecated
AVCM_FUNCTION AvCmMsgGetSTBSign(
    AvCmHmsg HMsg, 
    void* pBuffer, 
    AvCmSize* pBufferSize,
    AvCmLong flags);

  
// Функция показа информации об объекте
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

// Функция добавления сертификатов в контекст
AVCM_FUNCTION AvCmEnumAddCerts(
    AvCmHcertEnum hcert_enum,
    AvCmSize param_count,
    const AvCmEnumGetParam * params,
    AvCmLong flags);

// Функция проверки подписи в открытом подписанном сообщении по номеру
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

// Функция проверки подписи в открытом подписанном сообщении по номеру на заданную дату
/*AVCM_FUNCTION AvCmMsgVerifySignAtIndexForDate(
    AvCmHmsg hmsg,
    SystemTime* verifydate,	
    AvCmSize sign_index,
    AvCmLong flags);*/

// Функция установки дополнительных атрибутов открытого сообщения для подписи
AVCM_FUNCTION AvCmMsgSetAttribute(
	AvCmHmsg hmsg,
	AvCmLong attr_id,
	void* attr_param,
	void* input_buffer,
	AvCmSize input_size,
	AvCmLong flags);

// Инициализация библиотеки с указанием рабочего каталога.
AVCM_FUNCTION AvCmInitEx(
    const char* cpszWorkDir,
    AvCmLong flags);

// Функция открытия вложенного сообщения
AVCM_FUNCTION AvCmOpenInnerMsg(
    AvCmHmsg hmsg,
    AvCmHmsg * hmsg_inner,
    AvCmLong flags);

// Функция диалога создания контекста
AVCM_FUNCTION AvCmEnumDlg(
        AvCmHc hc,
        const char* cpszDlgCaption,
        const char* cpszLabel,
        const char* cpszOkButtonCaption,
        AvCmHcertEnum * hcert_enum,
    AvCmLong flags);

// Функция импорта сертификата или списка отозванных сертификатов
AVCM_FUNCTION AvCmImport(
        AvCmHc hc,
        AvCmLong obj_type,
        const void * input_data,
        AvCmSize input_size,
        AvCmSize param_count,
        const AvCmImportParam * params,
        AvCmLong flags);

// Функция поиска и открытия списка отозванных сертификатов
AVCM_FUNCTION AvCmFindCrl(
        AvCmHc hc,
        AvCmSize param_count,
        const AvCmFindCrlParam * params,
        AvCmHcrl * hcrl,
        AvCmLong flags);

// Функция извлечения атрибутов списка отозванных сертификатов. 
AVCM_FUNCTION AvCmGetCrlAttr(
    const AvCmHcrl hcrl,
    AvCmLong attr_id,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

// Функция предназначена для генерации запроса на сертификат.
AVCM_FUNCTION AvCmGenerateRequest(
        AvCmHc hc,
        AvCmSize param_count,
        const AvCmGenReqParam * params,
        AvCmHreq * hreq,
        AvCmLong flags);

// Функция предназначена для извлечения атрибутов запроса на сертификат.
AVCM_FUNCTION AvCmGetRequestAttr(
        AvCmHreq hreq,
        AvCmLong attr_id,
        void * output_buffer,
        AvCmSize * output_size,
        AvCmLong flags);

//Функция предназначена для поиска и открытия запроса на сертификат. 
AVCM_FUNCTION AvCmFindRequest(
        AvCmHc hc,
        AvCmSize param_count,
        const AvCmFindReqParam * params,
        const AvCmHreq * hreq,
        AvCmLong flags);

// Функция предназначена для помещения сертификата, извлеченного из сообщения в справочник сертификатов. 
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

// Функция предназначена для проверки статуса сертификата
AVCM_FUNCTION AvCmVerifyCertStatus(
    AvCmHandle handle,
    AvCmSize param_count,
        const AvCmCertStatParam * params,
        AvCmLong * status_ok,
    AvCmHcertstat * hstatus,
    AvCmLong flags);

// Функция предназначена для получения данных статуса сертификата
AVCM_FUNCTION AvCmGetCertStatusAttr(
    AvCmHcertstat hstatus,
    AvCmLong attr_id,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

//Функция предназначена для проверки ЭЦП 
AVCM_FUNCTION AvCmVerifyRawDataSign(
        AvCmHcert hcert,
        const char* hash_and_sign_oid,
        const void* data_to_be_verified,
        AvCmSize data_size,
        const void * sign_value,
        AvCmSize sign_size,
        AvCmLong flags);
    
//Функция установки дескриптора приложения
AVCM_FUNCTION AvCmSetActiveWindow(
        AvCmLong /*HWND*/ hwnd,
        AvCmLong flags);

//Получение информации о статусе сертификата
AVCM_FUNCTION AvCmMsgOCSPGetResponse(
    AvCmHandle handle,
    AvCmLong sign_index,
    const AvCmHOCSP * hr,
    AvCmLong flags);

//Извлечение атрибутов информации о статусе сертификата
AVCM_FUNCTION AvCmMsgOCSPGetResponseAttr (
    AvCmHOCSP hr,
    AvCmLong attr_id,
    const void * attr_param,
    void * output_buffer,
    AvCmSize * output_size,
    AvCmLong flags);

//Добавление информации о статусе сертификата в подписанное сообщение
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
