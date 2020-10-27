// Базовый заголовочный файл библиотеки AvCryptMail
// (C) AVEST plc., 2003-2005
// Версия: 2.23.4


#if !defined(AVCRYPTMAILBASE_H)
#define AVCRYPTMAILBASE_H

typedef unsigned long DWORD;

// ----- Типы, определяемые библиотекой AvCryptMail -----

// Тип возвращаемого библиотекой кода результата.
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

// ------- Флаги функций -------

// Для функции AvCmOpenCertEnum 
// Перебор не только корректных сертификатов, а всех сертификатов 
const DWORD AVCMF_ALL_CERT           = 0x8000;

// Для функции AvCmSign AvCmSignAndEncrypt AvCmMsgSign
// В выходное сообщение будут включены все необходимые сертификаты и СОС.
const DWORD AVCMF_ADD_ALL_CERT    = 0x80000;

// Для функции AvCmSign AvCmSignAndEncrypt AvCmMsgSign
// В выходное сообщение будет включен только сертификат подписавшего.
const DWORD AVCMF_ADD_SIGN_CERT   = 0x100000;

const DWORD AVCMF_ADD_ONLY_CERT = 0x40000;

// Содержимое сообщения не включается в экспортируемое сообщение
const DWORD AVCMF_DETACHED           = 0x2000000;

// Для функции AvCmInit
// данный флаг необходимо использовать для первоначальной инициализации библиотеки
const DWORD AVCMF_STARTUP         = 0x1;

// данный флаг необходимо использовать для освобождения ресурсов библиотеки 
// перед ее выгрузкой из адресного пространства процесса.
const DWORD AVCMF_SHUTDOWN        = 0x2;

// Для функции AvCmLogin
// Подключение без атентификации пользователя. 
const DWORD AVCMF_NO_AUTH         = 0x4; 

// AvCmLogin: контроль наличия вставленного носителя с личным ключом при авторизации
const DWORD AVCMF_FORCE_TOKEN_CONTROL = 0x10000;

// AvCmLogin: запрет контроля наличия вставленного носителя с личным ключом при авторизации
const DWORD AVCMF_DENY_TOKEN_CONTROL = 0x20000;

// AvCmLogin: Если передан этот флаг, то в том случае, если соответствующий СОС
// отсутствует, не выдавать ошибки и продолжать работу
const DWORD AVCMF_IGNORE_CRL_ABSENCE = 0x1;

// AvCmLogin: Если передан этот флаг, то в том случае, если соответствующий СОС
// истёк, не выдавать ошибки и продолжать работу
const DWORD AVCMF_IGNORE_CRL_EXPIRE = 0x8;




// AvCmOpenCertEnum: поиск не только среди сертификатов, но и проверка среди отказов на сертификат
const DWORD AVCMF_REQUEST_RESULT = 0x1;


// AvCmEnumDlg: перебор только сертификатов, предназначенных для шифрования 
const DWORD AVCMF_ONLY_ENCR_CERTS = 0x400;


// AvCmSign, AvCmSignAndEncrypt, AvCmMsgSign: повторный ввод пароля к контейнеру личных ключей перед выработкой ЭЦП
const DWORD AVCMF_REPEAT_AUTHENTICATION     = 0x800;


// AvCmMsgImportCerts: импортировать все сертификаты и СОС без вывода диалогового окна
const DWORD AVCMF_IMPORT_ALL_CERTS = 0x80000;

// AvCmMsgImportCerts, AvCmVerify и AvCmVerifySign: импортировать СОС из сообщения в
// хранилище (если в хранилище есть сертификат издателя СОСа)
const DWORD AVCMF_IMPORT_CRL = 0x40000;


// AvCmVerifySign: не проверять доверие к сертификату подписавшего
const DWORD AVCMF_NO_CERT_VERIFY = 0x8000000;


// Для функции AvCmVerifySign и AvCmDecryptAndVerifySign
// проверять ЭЦП на дату выработки 
const DWORD AVCMF_VERIFY_ON_SIGN_DATE          = 0x1;


// AvCmEncrypt: Игнорировать не подходящие сертификаты 
const DWORD AVCMF_IGNORE_BAD_CERTS = 0x20;

// AvCmGenerateRequest: после генерации запроса предложить пользователю сохранить запрос в файл
const DWORD AVCMF_ALLOW_TO_SELECT_FILE = 0x8;

// AvCmSignRawData, AvCmVerifyRawDataSign: подпись без ASN.1 кодирования
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


// ----- Атрибуты функции AvCmLogin -----
// Тип хранилища, в которой находятся справочники сертификатов/СОС
const DWORD   AVCM_DB_TYPE          = 0x1;

// Хранилище Microsoft в сиситемном реестре Windows.
const DWORD    AVCM_DBT_MS_REGISTRY = 0x100;

// Соединение с базой данных Oracle.
const DWORD    AVCM_DBT_ORACLE        = 0x101;

// База данных Sybase Anywhere, доступ к которой осуществляется 
// с использованием Sybase OpenClient.
const DWORD    AVCM_DBT_SYBASE      = 0x102;

// Соединение с файловым хранилищем.
const DWORD    AVCM_DBT_FILE        = 0x103;

// Соединение с архивным файловым хранилищем.
const DWORD    AVCM_DBT_ARCHIVE_FILE= 0x104;

// Соединение с архивным хранилищем в памяти
const DWORD    AVCM_DBT_ARCHIVE_MEMORY= 0x105;

// Соединение с пустым хранилищем в памяти на основе контейнера с ключом и сертификатом
const DWORD    AVCM_DBT_E_MEMORY= 0x107;

// Соединение с заданным #PKCS11 слотом
const DWORD    AVCM_SLOTID         = 0x10A;

// дескриптор открытого соединения с базой данных.
const DWORD AVCM_DB_HANDLE          = 0x2;

// DSN - имя базы данных.
const DWORD AVCM_DB_DSN             = 0x3;

// имя пользователя базы данных.
const DWORD AVCM_DB_UID             = 0x4;

// пароль пользователя базы данных.
const DWORD AVCM_DB_PWD             = 0x5;

// Имя хранилища сертификатов стандарта Microsoft в реестре Windows
const DWORD AVCM_DB_MS_NAME         = 0x6;

// Имя хранилища сертификатов доверенных ЦС стандарта Microsoft в реестре Windows
const DWORD AVCM_DB_MS_ROOT_NAME    = 0x7;

// Строка соединения с базой Oracle
const DWORD AVCM_DB_CONNECTSTR      = 0x4;

// Путь к файлам хранилища
const DWORD AVCM_DB_FILE_PATH       = 0x3;

// Путь к файлу архивного хранилища
const DWORD AVCM_DB_ARCHIVE_FILE_PATH = 0x3;

// Указатель на архивное хранилище
const DWORD AVCM_DB_ARCHIVE_PTR     = 0x6;

// Размер архивного хранилища в памяти
const DWORD AVCM_DB_ARCHIVE_SIZE    = 0x7;

// Пароль для доступа к контейнеру личных ключей
const DWORD AVCM_PASSWORD = 0x1030;

// атрибут CommonName субъекта сертификата
const DWORD AVCM_COMMON_NAME = 0x1031;


// ----- Атрибуты функций AvCmOpenCertEnum -----

// идентификатор открытого ключа издателя
const DWORD AVCM_AUTHORITY_KEY_IDENTIFIER = 0x100C;

// имя (X.509 Name) издателя подписавшего сертификата в виде строки
const DWORD AVCM_ISSUER_AS_STRING   = 0x100D;

// серийный номер подписавшего сертификата
const DWORD AVCM_SERIAL_AS_STRING   = 0x100E;

// идентификатор открытого ключа подписавшего.
const DWORD AVCM_PUB_KEY_ID         = 0x100F;

// серийный номер сертификата
const DWORD AVCM_SERIAL_AS_INTEGER  = 0x18;

// дата/время начала действия сертификата
const DWORD AVCM_NOT_BEFORE         = 0x1A;

// дата/время окончания действия сертификата
const DWORD AVCM_NOT_AFTER          = 0x1B;

// дата/время начала действия личного ключа
const DWORD AVCM_KEY_NOT_BEFORE         = 0x2A;

// дата/время окончания действия личного ключа
const DWORD AVCM_KEY_NOT_AFTER          = 0x2B;

// дата и время искомого сертификата должна быть 
// больше или равна указанной дате и времени.
const DWORD AVCM_D_GREATER          = 0x110;

// дата и время искомого сертификата должна быть 
// меньше или равна указанной дате и времени.
const DWORD AVCM_D_LESS          = 0x111;

// имя (X.509 Name) владельца сертификата в виде строки
const DWORD AVCM_SUBJECT_AS_STRING  = 0x101C;

// атрибут имени (X.509 Name) владельца сертификата в виде строки
const DWORD AVCM_SUBJECT_ATTR       = 0x101D;

// открытый ключ сертификата
const DWORD AVCM_PUB_KEY            = 0x1F;

// атрибут альтернативного имени (X.509 AltName) владельца сертификата в виде строки
const DWORD AVCM_SUBJ_ALT_NAME_ATTR = 0x1020;

// дополнение сертификата в виде строки 
const DWORD AVCM_EXT_AS_STRING      = 0x1024;

// аттрибут сертификата в виде строки 
const DWORD AVCM_ATTR_AS_STRING      = 0x1043;

// указывает предназначение искомых сертификатов
const DWORD AVCM_PURPOSE            = 0x25;

// поиск сертификатов, предназначенных для подписи.
const DWORD AVCM_P_SIGN             = 0x01;

// поиск сертификатов, предназначенных для зашифрования.
const DWORD AVCM_P_CRYPT            = 0x02;

// поиск неотзываемых сертификатов.
const DWORD AVCM_P_NON_REPUDIABLE   = 0x04;

// указывает тип искомого сертификата 
const DWORD AVCM_TYPE               = 0x26;

// перебор только личных сертификатов
const DWORD AVCM_TYPE_MY            = 0x10E;

// перебор сертификатов доверенных центров сертификации
const DWORD AVCM_TYPE_ROOT          = 0x10F;

// поиск по атрибуту имени (X.509 Name) издателя сертификата в виде строки
const DWORD AVCM_ISSUER_ATTR        = 0x1032;

// идентификатор объекта (OID) из списка ограничений применения ключа сертификата. 
// При этом необходима передача номера в списке (параметр attr_param). 
const DWORD AVCM_EXT_KEY_USAGE_OID  = 0x1027;

// поиск цепочки сертификов издателей. 
const DWORD AVCM_CERT_ISSUERS_CHAIN = 0x1029;

const DWORD AVCM_PUB_KEY_ALG_PARAMS = 0x31;

// ----- Атрибуты функции AvCmFindCrl -----

// поле Subject издателя СОС для функции AvCmImport и AvCmFindCrl
const DWORD AVCM_CRL_ISSUER_SUBJECT = 0x1;

// поиск по открытому сертификату издателя списка отозванных сертификатов в виде строки
const DWORD AVCM_CRL_ISSUER_CERT = 0x2;

// ----- Атрибуты функции AvCmGenerateRequest -----

// путь к файлу щаблона на сертификат для функции AvCmGenerateRequest
const DWORD AVCM_TEMPLATE = 0x2F;



// ---------- Причины недоверия сертификату ----------

/** Base code */
//! Базовый код причин недоверия
#define AVCM_CSR_BASE                           0x077B1000

// Сертификат отозван
const DWORD AVCM_CSR_REVOKED                    =  0x01 + AVCM_CSR_BASE;   

// Причина недоверия не определенеа
const DWORD AVCM_CSR_UNKNOWN                    =  0x02 + AVCM_CSR_BASE;   

// ---------- Коды ошибок ----------
// Успешное выполнение функции
const AvCmResult AVCMR_SUCCESS             =  0;   

/** Base error code for all AvCm errors */
//! Базовый код ошибок 
#define AVCMR_BASE                              0xE82A0100

// Ошибка при распределении памяти
const AvCmResult AVCMR_ALLOC_ERROR          =  0x01 + AVCMR_BASE;   

// Идентификатор атрибута неверен
const AvCmResult AVCMR_BAD_ATTR             =  0x02 + AVCMR_BASE;   

// Неверный формат сообщения
const AvCmResult AVCMR_BAD_FORMAT           =  0x03 + AVCMR_BASE;   

// Дескриптор объекта неверен
const AvCmResult AVCMR_BAD_HANDLE           =  0x04 + AVCMR_BASE;   

// Дескриптор соединения неверен
const AvCmResult AVCMR_BAD_HC               =  0x05 + AVCMR_BASE;   

// Дескриптор сертификата неверен
const AvCmResult AVCMR_BAD_HCERT            =  0x06 + AVCMR_BASE;   

// Дескриптор перебора сертификатов неверен
const AvCmResult AVCMR_BAD_HENUM        =  0x07 + AVCMR_BASE;   

// Дескриптор открытого сообщения неверен
const AvCmResult AVCMR_BAD_HMSG             =  0x08 + AVCMR_BASE;   

// Дескриптор подписи неверен
const AvCmResult AVCMR_BAD_HSIGN            =  0x09 + AVCMR_BASE;   

// В сообщении нет подписи с указанным номером
const AvCmResult AVCMR_BAD_NUMBER           = 0x0A + AVCMR_BASE;   

// Пароль неверен
const AvCmResult AVCMR_BAD_PASSWORD         = 0x0B + AVCMR_BASE; 

// Выходной буфер слишком мал  
const AvCmResult AVCMR_BUFFER_TOO_SMALL     = 0x0C + AVCMR_BASE;   

// Не найден личный сертификат
const AvCmResult AVCMR_CERT_NOT_FOUND       = 0x0D + AVCMR_BASE;   

// Подпись под сертификатом издателя неверна
const AvCmResult AVCMR_CERT_CA_INVALID      = 0x0E + AVCMR_BASE;   

// Сертификат издателя не найден
const AvCmResult AVCMR_CERT_CA_NOT_FOUND    = 0x0F + AVCMR_BASE;   

// Сертификат не предназначен для шифрования
const AvCmResult AVCMR_CERT_NOT_FOR_CRYPT   = 0x11 + AVCMR_BASE;   

// Сертификат не предназначен для подписи
const AvCmResult AVCMR_CERT_NOT_FOR_SIGN    = 0x12 + AVCMR_BASE;   

// Подпись под сертификатом неверна
const AvCmResult AVCMR_CERT_SIGN_INVALID    = 0x13 + AVCMR_BASE;   

// Не найдено или пусто хранилище сертификатов
const AvCmResult AVCMR_CERT_STORE_NOT_FOUND = 0x14 + AVCMR_BASE;   

// Не найден контейнер с личными ключами на носителе
const AvCmResult AVCMR_CONTAINER_NOT_FOUND  = 0x15 + AVCMR_BASE;   

// Подпись под СОС издателя неверна или СОС устарел
const AvCmResult AVCMR_CRL_INVALID          = 0x16 + AVCMR_BASE;   

// СОС издателя не найден
const AvCmResult AVCMR_CRL_NOT_FOUND        = 0x17 + AVCMR_BASE;   

// Невозможно подключится к базе данных
const AvCmResult AVCMR_DB_NOT_FOUND         = 0x18 + AVCMR_BASE;   

// Не найден носитель
const AvCmResult AVCMR_DEVICE_NOT_FOUND     = 0x19 + AVCMR_BASE;   

// Невозможно закрыть объект, объект занят
const AvCmResult AVCMR_BUSY                 = 0x1A + AVCMR_BASE;   

// Не указаны параметры подключения к базе данных
const AvCmResult AVCMR_NO_DB_PARAMS         = 0x1B + AVCMR_BASE;   

// Входное сообщение имеет нулевой размер
const AvCmResult AVCMR_NO_INPUT             = 0x1C + AVCMR_BASE;   

// Сообщение не имеет подписи, выработанной на ключа данного сертификата
const AvCmResult AVCMR_NO_SIGN              = 0x1D + AVCMR_BASE;   

// Повторная попытка инициализации библиотеки
const AvCmResult AVCMR_ALREADY_INITIALIZED  = 0x1E + AVCMR_BASE;   

// Библиотека не была инициализирована
const AvCmResult AVCMR_NOT_INITIALIZED      = 0x1F + AVCMR_BASE;   

// Формат даты/времени некорректен
const AvCmResult AVCMR_BAD_DATE             = 0x20 + AVCMR_BASE;   

// Функции переданы неверные флаги
const AvCmResult AVCMR_BAD_FLAGS            = 0x21 + AVCMR_BASE;   

// Попытка обратится к сессии, созданной в одном потоке, из другого потока
const AvCmResult AVCMR_BAD_THREAD           = 0x22 + AVCMR_BASE;   

// Дата не подходящая
const AvCmResult AVCMR_DATE_NOT_VALID       = 0x23 + AVCMR_BASE;   

// Внутренняя ошибка библиотеки
const AvCmResult AVCMR_INTERNAL_ERROR       = 0x24 + AVCMR_BASE;   

// Объект не найден
const AvCmResult AVCMR_NOT_FOUND            = 0x25 + AVCMR_BASE;   

// Функция не реализована
const AvCmResult AVCMR_NOT_IMPLEMENTED      = 0x26 + AVCMR_BASE;   

// Подпись неверна
const AvCmResult AVCMR_SIGN_INVALID         = 0x27 + AVCMR_BASE;   

// Сессия создана без авторизации пользователя
const AvCmResult AVCMR_USER_NO_AUTH         = 0x28 + AVCMR_BASE;   

// Параметр функции неверен
const AvCmResult AVCMR_BAD_PARAM            = 0x29 + AVCMR_BASE;   
    
// Неверный формат подписи СТБ
const AvCmResult AVCMR_BAD_FORMED_SIGN      = 0x2A + AVCMR_BASE;   

// Инициализация криптопровайдера Авест завершилась неудачно
const AvCmResult AVCMR_AVCSP_INIT_FAILED    = 0x2B + AVCMR_BASE;   
    
// Ошибка доступа к реестру Windows
const AvCmResult AVCMR_REGISTRY_ERROR       = 0x2C + AVCMR_BASE;   

// Произошла ошибка при вызове функций Win32
const AvCmResult AVCMR_WIN32_ERROR          = 0x2D + AVCMR_BASE;   

// Невозможно расшифровать сообщение: 
// среди сертификатов получателей сообщения отсутствует 
// личный сертификат аутентифицированного пользователя
const AvCmResult AVCMR_OTHER_RECIPIENT      = 0x2E + AVCMR_BASE; 

// Не найден СДЦС (список доверяемых центров сертификации)
const AvCmResult AVCMR_CTL_NOT_FOUND        = 0x2F + AVCMR_BASE;   

// Сертификат отозван
const AvCmResult AVCMR_CERT_REVOKED         = 0x30 + AVCMR_BASE;   

// Нет доверия сертификату
const AvCmResult AVCMR_CERT_NOT_TRUSTED     = 0x31 + AVCMR_BASE;   

// Срок действия СОС истек
const AvCmResult AVCMR_CRL_EXPIRED          = 0x32 + AVCMR_BASE;   

// Сертификат издателя СОС не найден
const AvCmResult AVCMR_CRL_ISSUER_NOT_FOUND = 0x33 + AVCMR_BASE;   

// Срок действия сертификата издателя СОС истек
const AvCmResult AVCMR_CRL_ISSUER_EXPIRED   = 0x34 + AVCMR_BASE;   

// Версия библиотеки не соответствует версии хранилища сертификатов.
const AvCmResult AVCMR_CERT_STORE_BAD_VERSION = 0x35 + AVCMR_BASE;

// В личном хранилище отсутствуют действующие сертификаты.
const AvCmResult AVCMR_MY_STORE_EMPTY = 0x36 + AVCMR_BASE;

// Действие отменено пользователем.
const AvCmResult AVCMR_USER_CANCEL = 0x37 + AVCMR_BASE;

// Сертификат содержит расширенное использование ключа не поддерживаемое центром регистрации
const AvCmResult AVCMR_RA_EXT_KEY_USAGE_NOT_ALLOWED = 0x38 + AVCMR_BASE;
   
// Сертификат содержит дополнение не поддерживаемое центром регистрации.
const AvCmResult AVCMR_RA_EXT_NOT_ALLOWED = 0x39 + AVCMR_BASE;

// В личном справочнике несколько действующих сертификатов 
const AvCmResult AVCMR_TOO_MANY_CERT  = 0x3A + AVCMR_BASE;  

// Параметр поиска не существует
const AvCmResult AVCMR_PARAM_SPEC_NOT_FOUND = 0x40 + AVCMR_BASE;   

// Сертификат не является сертификатом ЦР
const AvCmResult AVCMR_CERT_NOT_RA = 0x41 + AVCMR_BASE;   

// Объект уже существует
const AvCmResult AVCMR_ALREADY_EXISTS  = 0x42 + AVCMR_BASE;   

// Код ошибки неизвестен библиотеке 
const AvCmResult AVCMR_UNKNOWN_ERROR_CODE  = 0x43 + AVCMR_BASE;   

// Издатель СОС отличается от ожидаемого издателя, переданного параметром AVCM_CRL_ISSUER_SUBJECT 
const AvCmResult AVCMR_BAD_CRL_ISSUER  = 0x44 + AVCMR_BASE;  

// В справочнике списков отозванных сертификатов имеется более новый СОС данного издателя
const AvCmResult AVCMR_OLD_CRL  = 0x45 + AVCMR_BASE;  
 
// Дескриптор СОС неверен
const AvCmResult AVCMR_BAD_HCRL  = 0x46 + AVCMR_BASE;  

// Сертификат временно приостановлен
const AvCmResult AVCMR_CERT_TEMPORARY_REVOKED      = 0x47 + AVCMR_BASE;

// Ошибка подтверждения пароля при повторной аутентификации.
// Вставлен неверный носитель или неверно задан личный пароль.
const AvCmResult AVCMR_REPEAT_AUTHENTICATION_ERROR  = 0x48 + AVCMR_BASE;

// Нет прав доступа к базе сертификации.
const AvCmResult AVCMR_DB_AUTHENTICATION_ERROR  = 0x49 + AVCMR_BASE;
  
// Носитель с личным ключом не установлен
const AvCmResult AVCMR_TOKEN_NOT_FOUND  = 0x4A + AVCMR_BASE;
  
// Сообщение не имеет содержимого
const AvCmResult AVCMR_NO_CONTENT  = 0x4B + AVCMR_BASE;

// Срок действия сертификата неверен
// Ошибка удалена
//const AvCmResult AVCMR_CERT_EXPIRED         = 0x10 + AVCMR_BASE;   

// Срок действия сертификата не наступил
const AvCmResult AVCMR_CERT_NOT_VALID_YET         = 0x4C + AVCMR_BASE;   

// Срок действия сертификата истек
const AvCmResult AVCMR_CERT_ALREADY_EXPIRED         = 0x4D + AVCMR_BASE;   

// Носитель не зарегистрирован
const AvCmResult AVCMR_INVALID_TOKEN        = 0x4E + AVCMR_BASE;

// Ошибка расшифрования ключа
const AvCmResult AVCMR_BAD_KEY        = 0x4F + AVCMR_BASE;

// Ошибка записи на носитель
const AvCmResult AVCMR_TOKEN_WRITE_ERROR        = 0x50 + AVCMR_BASE;

// сертификат не найден, но найден отказ УЦ в выдаче сертификата по данному запросу
const AvCmResult AVCMR_REQUEST_DENIED           = 0x51 + AVCMR_BASE;

// Передан некорректный указатель на выходной буфер
const AvCmResult AVCMR_BAD_BUFFER_PTR           = 0x52 + AVCMR_BASE;

// Объект заблокирован другим приложением.
const AvCmResult AVCMR_OBJ_LOCKED = 0x53 + AVCMR_BASE;

// Отсутствуют получатели зашифрованного сообщения.
const AvCmResult AVCMR_NO_RECIPIENTS = 0x54 + AVCMR_BASE;

// Сертификат не отозван
const AvCmResult AVCMR_ALG_NOT_SUPPORTED        = 0x55 + AVCMR_BASE;   

// Сертификат не отозван
const AvCmResult AVCMR_CERT_NOT_REVOKED         = 0x56 + AVCMR_BASE;   

//  Невозможно зарегистрировать запрос на сертификат УЦ
const AvCmResult AVCMR_REQUEST_FOR_CA_DENIED = 0x57 + AVCMR_BASE;

//  Невозможно зарегистрировать запрос на сертификат УЦ
const AvCmResult AVCMR_REQUEST_FOR_RA_DENIED = 0x58 + AVCMR_BASE;

//  РЦ не имеет права на выполнение данной операции
const AvCmResult AVCMR_REQUEST_FOR_REVOKE_DENIED = 0x59 + AVCMR_BASE;

// УЦ не имеет права выдавать сертификаты или не может является конечным сертификатом.
const AvCmResult AVCMR_INVALID_BASIC_CONSTRAINTS = 0x5A + AVCMR_BASE;

// Синтаксическая ошибка AvCryptSQL.
const AvCmResult AVCMR_CRYPTSQL_SYNTAX_ERROR = 0x5B + AVCMR_BASE;

// Сертификат/СОС не удовлетворяет условиям отбора
const AvCmResult AVCMR_NOT_CONDITION = 0x5C + AVCMR_BASE;

// Не удалось проверить ЭЦП. Возможно, потеряно соединение с AvHSM.
const AvCmResult AVCMR_VERIFY_ERROR = 0x5D + AVCMR_BASE;

// Нарушена целостность входных данных.
const AvCmResult AVCMR_BAD_DATA = 0x5E + AVCMR_BASE;

// Не найден оригинальный файл для проверки подписи
const AvCmResult AVCMR_ORIGINAL_FILE_FOR_VERIFY_NOT_FOUND = 0x5F + AVCMR_BASE;

// Сертификат не предназначен для подписи сертификатов
const AvCmResult AVCMR_CERT_NOT_FOR_SIGN_CERT = 0x60 + AVCMR_BASE;

// Сертификат не предназначен для подписи СОС
const AvCmResult AVCMR_CERT_NOT_FOR_SIGN_CRL = 0x61 + AVCMR_BASE;

// Сертификат содержит неизвестное критическое дополнение.
const AvCmResult AVCMR_CERT_UNKNOWN_CRITICAL_EXT = 0x62 + AVCMR_BASE;

// СОС содержит неизвестное критическое дополнение.
const AvCmResult AVCMR_CRL_UNKNOWN_CRITICAL_EXT = 0x63 + AVCMR_BASE;

//Применение ключа задано неверно.
const AvCmResult AVCMR_INVALID_KEY_USAGE = 0x64 + AVCMR_BASE;

// Сертификат РЦ выпущен другим УЦ.
const AvCmResult AVCMR_INVALID_RACERT = 0x65 + AVCMR_BASE;

const AvCmResult AVCMR_CRLSERVER_ERROR = 0x66 + AVCMR_BASE;

// Ошибка загрузки библиотеки PKCS#11
const AvCmResult AVCMR_LOADLIBPKCS11_ERROR = 0x67 + AVCMR_BASE;

// Неверно задан путь к точкам распространения СОС
const AvCmResult AVCMR_CRLDP_BAD_PATH = 0x68 + AVCMR_BASE;

// Атрибуты запроса на сертификат имеют отличия от атрибутов продлеваемого сертификата
const AvCmResult AVCMR_RENEW_BAD_ATTR = 0x69 + AVCMR_BASE;


const AvCmResult AVCMR_POLICY_NOT_FOUND = 0x70 + AVCMR_BASE;
const AvCmResult AVCMR_POLICY_NOT_APPLY = 0x71 + AVCMR_BASE;

// Сертификат не предназначен для подписи атрибутных сертификатов
const AvCmResult AVCMR_CERT_NOT_FOR_SIGN_ACERT = 0x72 + AVCMR_BASE;

// Ошибка при обращении к OCSP серверу
const AvCmResult AVCMR_OCSP_ERROR = 0x73 + AVCMR_BASE;

// Срок личного ключа истек
const AvCmResult AVCMR_KEY_ALREADY_EXPIRED = 0x74 + AVCMR_BASE;

// Носитель не установлен
const AvCmResult AVCMR_PKCS11_TOKEN_NOT_PRESENTERROR = 0x75 + AVCMR_BASE;

// Ошибка при вызове функции PKCS#11
const AvCmResult AVCMR_PKCS11_ERROR = 0x76 + AVCMR_BASE;

// Не выбрано действие для сохранения объекта в LDAP
const AvCmResult AVCMR_LDAP_ACTION_NOT_FOUND = 0x77 + AVCMR_BASE;

//Запрос на сертификат ждет ручного утверждения
const AvCmResult AVCMR_SCEP_PENDING = 0x78 + AVCMR_BASE;

// Ошибка при обращении к серверу SCEP
const AvCmResult AVCMR_SCEP_ERROR = 0x79 + AVCMR_BASE;

#endif // !defined(AVCRYPTMAILBASE_H)
