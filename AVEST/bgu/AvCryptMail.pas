// Заголовочный файл библиотеки AvCryptMail
// (C) AVEST, 2003-2005
// Версия: 3.0.0
unit AvCryptMail;

interface

/// Define AVCRYPTMAIL_DYNAMIC to use dynamic import!

//{$AVCRYPTMAIL_DYNAMIC}

uses Windows;

// ----- Типы, определяемые библиотекой AvCryptMail -----
type

{$IFDEF WIN64}
   // тип возвращаемого библиотекой кода результата.
   AvCmResult = DWORD;
   AvCmLong = Int64;
   // Размер блока данных
   AvCmSize = Int64;
   // Дескриптор объекта библиотеки.
   AvCmHandle = Pointer;
{$ELSE}
   // тип возвращаемого библиотекой кода результата.
   AvCmResult = DWORD;
   AvCmLong = DWORD;
   // Размер блока данных
   AvCmSize = DWORD;
   // Дескриптор объекта библиотеки.
   AvCmHandle = Pointer;
{$ENDIF}

   PAvCmHandle = ^AvCmHandle;

   // Дескриптор подключившегося пользователя.
   AvCmHc = AvCmHandle;

   // Дескриптор открытого сообщения.
   AvCmHmsg = AvCmHandle;

   // Дескриптор одной из подписей сообщения.
   AvCmHsign = AvCmHandle;

   // Дескриптор открытого серификата.
   AvCmHcert = AvCmHandle;
   PAvCmHcert = ^AvCmHcert;

   // Дескриптор подписи и соответствующего сертификата,
   // полученные в результате вызова функций проверки ЭЦП.
   AvCmHsignCert = AvCmHandle;

   // Дескриптор открытого контекста перебора объектов.
   AvCmHenum = AvCmHandle;

   // Дескриптор открытого контекста перебора сертификатов.
   AvCmHcertEnum = AvCmHenum;

   // Дескриптор открытого контекста перебора информации
   // о подписях и соответствующих сертификатах подписанного сообщения.
   AvCmHsgnCertEnum = AvCmHenum;

   // Дескриптор открытого списка отозванных сертификатов
   AvCmHcrl = AvCmHenum;

   // Дескриптор открытого запроса на сертификат
   AvCmHreq = AvCmHenum;

   // Дескриптор статуса серификата.
   AvCmHcertstat = AvCmHandle;

   AvCmHOCSP = AvCmHandle;

   // Данные необходимые при подключении для идентификации пользователя
   // и подключения к справочникам сертификатов/СОС.
   // В настоящее время планируется хранениие
   // справочников сертификатов в базе данных.
   AvCmConnectionParam = packed record
      param_id: AvCmLong; // идентификатор параметра
      param: pointer; // значение параметра
   end;
   PAvCmConnectionParam = ^AvCmConnectionParam;

   // Атрибуты поиска объектов.
   AvCmEnumGetParam = packed record
      param_id: AvCmLong; // идентификатор параметра
      param_spec: pointer; // уточнение идентификатора
      param: pointer; // значение параметра
   end;
   PAvCmEnumGetParam = ^AvCmEnumGetParam;


   // Атрибуты импорта объектов.
   AvCmImportParam = packed record
      param_id: AvCmLong; // идентификатор параметра
      param: pointer; // значение параметра
   end;
   PAvCmImportParam = ^AvCmImportParam;

   // Данные используемые при поиске списков отозванных сертификатов.
   AvCmFindCrlParam = packed record
      param_id: AvCmLong; // идентификатор параметра
      param: pointer; // значение параметра
   end;
   PAvCmFindCrlParam = ^AvCmFindCrlParam;

   // Данные используемые при генерации запроса на сертификат.
   AvCmGenReqParam = packed record
      param_id: AvCmLong; // идентификатор параметра
      param: pointer; // значение параметра
   end;
   PAvCmGenReqParam = ^AvCmGenReqParam;

   // Данные используемые при поиске запроса на сертификат.
   AvCmFindReqParam = packed record
      param_id: AvCmLong; // идентификатор параметра
      param: pointer; // значение параметра
   end;
   PAvCmFindReqParam = ^AvCmFindReqParam;

   // Данные используемые при запросе статуса сертификата
   AvCmCertStatParam = packed record
      param_id: AvCmLong; // идентификатор параметра
      param: pointer; // значение параметра
   end;
   PAvCmCertStatParam = ^AvCmCertStatParam;



   //-------- Флаги ----------

   // Для функции AvCmInit
   // данный флаг необходимо использовать для первоначальной инициализации библиотеки
const
   AVCMF_STARTUP = $1;
AVCMF_OPEN_ATTR_CERT = $1;

   // данный флаг необходимо использовать для освобождения ресурсов библиотеки
   // перед ее выгрузкой из адресного пространства процесса.
const
   AVCMF_SHUTDOWN = $2;

// Для функции AvCmInit
// Проверка интегрити через mac.ini
const 
   AVCMF_CHECK_FILES_INTEGRITY = $4; 

   // Для функции AvCmLogin
   // Подключение без атентификации пользователя.
const
   AVCMF_NO_AUTH = $4;

// Для функции AvCmVerifySign и AvCmDecryptAndVerifySign
// Импорт сертификаты и списки отозванных сертификатов
// из сообщения в хранилище сертификатов.
const
   AVCMF_IMPORT = $10;

// Для функции AvCmOpenMsg
// Входные данные будут вставлены в выходное сообщение как PKCS#7 Data.
const
   AVCMF_IN_RAW_DATA = $100;

// Для функции AvCmSign AvCmEncrypt AvCmDecrypt AvCmSignAndEncrypt AvCmOpenMsg
// Входное сообщение в формате PKCS#7.
const
   AVCMF_IN_PKCS7 = $200;

// Для функции AvCmSign AvCmEncrypt AvCmDecrypt AvCmSignAndEncrypt AvCmGetMsg
// Выходное сообщение в формате PKCS#7.
const
   AVCMF_OUT_PKCS7 = $2000;

// Для функции AvCmPutCert
// Импорт всех сертификатов и списков отозванных сертификатов из указанного сообщения
const
   AVCMF_MESSAGE = $1000;

  // Для функции AvCmOpenCertEnum
// Перебор не только корректных сертификатов, а всех сертификатов
const
   AVCMF_ALL_CERT = $8000;

   // Для функции AvCmSign AvCmSignAndEncrypt AvCmMsgSign
   // В выходное сообщение будут включены все необходимые сертификаты и СОС.
const
   AVCMF_ADD_ALL_CERT = $80000;

   // Для функции AvCmSign AvCmSignAndEncrypt AvCmMsgSign
   // В выходное сообщение будет включен только сертификат подписавшего.
const
   AVCMF_ADD_SIGN_CERT = $100000;
   AVCMF_ADD_ONLY_CERT = $40000;


   // Для функции AvCmVerifySign AvCmDecryptAndVerifySign
   // Не заполнять  выходное сообщение
const
   AVCMF_NO_OUTPUT = $200000;

   // Для функции AvCmGetMsgContent
   // Функция должна вернуть содержимое сообщения по переданному указателю блока памяти.
const
   AVCMF_EXTRACT = $10;

   // Для функции AvCmGetSignAttr AvCmGetCertAttr
   // Атрибут по номеру.
const
   AVCMF_ATTR_BY_NUM = $400000;

   // Для функции AvCmGetSignAttr AvCmGetCertAttr
   // Атрибут по его идентификатору объекта (OID).
const
   AVCMF_ATTR_BY_OID = $800000;

   // Для функции AvCmEnumGet
   // Получить следующий по порядку элемент перечисления.
const
   AVCMF_NEXT = $40;

   // Для функции AvCmEnumGet
   // Начать перебор сертификатов с начала.
const
   AVCMF_START = $80;

   // Для функции AvCmGetErrorInfo
   // Получить ошибку сессии по идентификатору вызывающего потока.
const
   AVCMF_THREAD_ERROR = $08;

 // Для функции AvCmMsgSign
// Текущее сообщение будет вставлено в новое сообщение в качестве содержания сообщения и затем подписано.
const
   AVCMF_AS_NEW_MESSAGE = $800;

// Функция должна самостоятельно распределить память
   // для выходного сообщения функцией Win32 API HeapAlloc,
   // после использования выходного сообщения, вызвавшая программа
   // должна самостоятельно очистить выделенную память функцией HeapFree.
const
   AVCMF_ALLOC = $1000000;

   // Содержимое сообщения не включается в экспортируемое сообщение
const
   AVCMF_DETACHED = $2000000;

// Добавить данные к содержимому сообщения (для функции AvCmSetMsgContent)
const
   AVCMF_APPEND = $4000000;

// Игнорировать не подходящие сертификаты (для функции AvCmEncrypt)
const
   AVCMF_IGNORE_BAD_CERTS = $20;

// перебор только сертификатов, предназначенных для шифрования (для функции AvCmEnumDlg)
const
   AVCMF_ONLY_ENCR_CERTS = $400;

// не проверять доверие к сертификату подписавшего
const
   AVCMF_NO_CERT_VERIFY = $8000000;

// повторный ввод пароля к контейнеру личных ключей перед выработкой ЭЦП
const
   AVCMF_REPEAT_AUTHENTICATION = $800;

// контроль наличия вставленного носителя с личным ключом при авторизации
const
   AVCMF_FORCE_TOKEN_CONTROL = $10000;

// запрет контроля наличия вставленного носителя с личным ключом при авторизации
const
   AVCMF_DENY_TOKEN_CONTROL = $20000;

// AvCmLogin: Если передан этот флаг, то в том случае, если соответствующий СОС
// отсутствует, не выдавать ошибки и продолжать работу
const
   AVCMF_IGNORE_CRL_ABSENCE = $1;

// AvCmLogin: Если передан этот флаг, то в том случае, если соответствующий СОС
// истёк, не выдавать ошибки и продолжать работу
const
   AVCMF_IGNORE_CRL_EXPIRE = $8;


// AvCmMsgImportCerts: импортировать все сертификаты и СОС без вывода диалогового окна
const
   AVCMF_IMPORT_ALL_CERTS = $80000;


// AvCmMsgImportCerts, AvCmVerify и AvCmVerifySign: импортировать СОС из сообщения в
// хранилище (если в хранилище есть сертификат издателя СОСа)
const
   AVCMF_IMPORT_CRL = $40000;

// AvCmOpenCertEnum: поиск не только среди сертификатов, но и проверка среди отказов на сертификат
const
   AVCMF_REQUEST_RESULT = $1;

// AvCmImport: вернуть дескриптор объекта, если он присутствует в справочниках
const
   AVCMF_RETURN_HANDLE_IF_EXISTS = $1;

// Для функции AvCmVerifySign и AvCmDecryptAndVerifySign
// проверять ЭЦП на дату выработки
const
   AVCMF_VERIFY_ON_SIGN_DATE = $1;

// AvCmGenerateRequest: после генерации запроса предложить пользователю сохранить запрос в файл
const 
   AVCMF_ALLOW_TO_SELECT_FILE = $8;
   
// AvCmSignRawData, AvCmVerifyRawDataSign: подпись без ASN.1 кодирования
const 
   AVCMF_RAW_SIGN = $40000;
   
// AvCmMsgVerifySign, AvCmMsgVerifySignAtIndex, AvCmVerifyRawDataSign 
// Игнорировать отсутствие подходящего СОС   
const AVCMF_NO_CRL_VERIFY        = $20;
   
// Для функции AvCmImport
// после импорта сертификатов обязательно вывести диалог выбора контейнера с личным ключом
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

  // для получения PKCS#7 (сертификаты, СОС) без выполнения ЭЦП
  AVCMF_PREPARE_CERT_CHAIN =      $8000;




   // ----- Атрибуты функции AvCmLogin -----
   // Тип хранилища, в которой находятся справочники сертификатов/СОС
const
   AVCM_DB_TYPE = $1;

   // Хранилище Microsoft в сиситемном реестре Windows.
const
   AVCM_DBT_MS_REGISTRY = $100;

   // Соединение с базой данных ORACLE (ADO).
   AVCM_DBT_ORACLE = $101;

   // Соединение с базой данных Sybase (ADO ODBC).
   AVCM_DBT_SYBASE = $102;

   // Файловое хранилище.
   AVCM_DBT_FILE = $103;

   // Архивное файловое хранилище.
   AVCM_DBT_ARCHIVE_FILE = $104;

   // Архивное хранилище в памяти.
   AVCM_DBT_ARCHIVE_MEMORY = $105;

   // Соединение с пустым хранилищем в памяти на основе контейнера с ключом и сертификатом
   AVCM_DBT_E_MEMORY = $107;

   // дескриптор открытого соединения с базой данных.
const
   AVCM_DB_HANDLE = $2;

   // DSN - имя базы данных.
const
   AVCM_DB_DSN = $3;

   // имя пользователя базы данных.
const
   AVCM_DB_UID = $4;

   // пароль пользователя базы данных.
const
   AVCM_DB_PWD = $5;


   // Строка соединения с базой данных.
const
   AVCM_DB_CONNECTSTR = $4;

   // Путь к файлам хранилища
const
   AVCM_DB_FILE_PATH = $3;

   // Путь к файлу архивного хранилища
const
   AVCM_DB_ARCHIVE_FILE_PATH = $3;

   // Указатель на архивное хранилище
const
   AVCM_DB_ARCHIVE_PTR = $6;

   // Размер архивного хранилища в памяти
const
   AVCM_DB_ARCHIVE_SIZE = $7;

   // Пароль для доступа к контейнеру личных ключей
const
   AVCM_PASSWORD = $1030;

const
   AVCM_COMMON_NAME = $1031;

   // Соединение с заданным #PKCS11 слотом
   AVCM_SLOTID   = $10A;



// ----- Атрибуты функции AvCmGetObjectInfo -----

// Получение дескриптора личного сертификата.
const
   AVCM_MY_CERT = $8;

   // Получение количество дочерних объектов.
const
   AVCM_CHILDREN_COUNT = $9;



   // ----- Атрибуты функции AvCmGetMsgParam -----

   // вид открытого сообщения.
const
   AVCM_FORMAT = $A;

   // данные не имеют структуры PKCS#7.
const
   AVCM_MF_RAW_DATA = $103;

// данные не имеют структуры PKCS#7.
const
   AVCM_MF_NONE = $104;

   // подписанное сообщение в формате PKCS#7 SignedData.
const
   AVCM_MF_SIGNED_DATA = $105;

   // зашифрованное сообщение в формате PKCS#7 EnvelopedData.
const
   AVCM_MF_ENVELOPED_DATA = $106;

   // количество подписей в подписанном сообщении.
const
   AVCM_SIGN_COUNT = $107;

   // данные о формате вложенного сообщения
const
   AVCM_INNER_FORMAT = $108;

//   AVCM_SIGN_CERT_ENUM = $109;


  // путь к файлу щаблона на сертификат для функции AvCmGenerateRequest
  AVCM_TEMPLATE = $2F;


// ----- Атрибуты функций AvCmGetSignAttr AvCmGetCertAttr AvCmOpenCertEnum AvCmGetRequestAttr -----

// количество атрибутов имени (X.509 Name) владельца сертификата
const
   AVCM_SUBJECT_ATTR_COUNT = $1;

// количество атрибутов имени (X.509 Name) издателя сертификата
const
   AVCM_ISSUER_ATTR_COUNT = $2;

// идентификатор объекта (OID) атрибута имени владельца сертификата в виде строки
const
   AVCM_SUBJECT_ATTR_OID = $1033;

// идентификатор объекта (OID) атрибута имени владельца сертификата в виде строки
const
   AVCM_ISSUER_ATTR_OID = $1034;

// значение дополнения сертификата в виде BLOB
const
   AVCM_EXT_BLOB = $5;

// идентификатор подписанного атрибута в виде строки ASCIIZ
const
   AVCM_AUTH_OID = $1040;//$6;

// идентификатор неподписанного атрибута в виде строки ASCIIZ
const
   AVCM_UNAUTH_OID = $1041;//$7;

// значение подписанного атрибута в виде BLOB
const
   AVCM_AUTH_BLOB = $8;

// значение неподписанного атрибута в виде BLOB
const
   AVCM_UNAUTH_BLOB = $9;

// версия подписи
const
   AVCM_VERSION = $B;

// Идентификатор ключа центра сертификатов
   AVCM_AUTHORITY_KEY_IDENTIFIER = $100C; 

// имя (X.509 Name) издателя подписавшего сертификата в виде строки
const
   AVCM_ISSUER_AS_STRING = $100D;

// серийный номер подписавшего сертификата
const
   AVCM_SERIAL_AS_STRING = $100E;

// идентификатор открытого ключа подписавшего.
const
   AVCM_PUB_KEY_ID = $100F;

// идентификатор алгоритма хэширования
const
   AVCM_HASH_ALG_OID = $1010;

// идентификатор алгоритма подписи
const
   AVCM_SIGN_ALG_OID = $1011;

// подпись
const
   AVCM_SIGN = $12;

// дата и время выработки подписи, которые находятся в
// списке подписанных атрибутов сообщения.
const
   AVCM_SIGN_DATE_TIME = $13;

// количество подписанных атрибутов
const
   AVCM_AUTH_COUNT = $14;

// количество количество неподписанных атрибутов
const
   AVCM_UNAUTH_COUNT = $15;

// подписанный атрибут в виде строки ASCIIZ
const
   AVCM_AUTH_AS_STRING = $1016;

// неподписанный атрибут в виде строки ASCIIZ
const
   AVCM_UNAUTH_AS_STRING = $1017;

// серийный номер сертификата
const
   AVCM_SERIAL_AS_INTEGER = $18;

// дата/время начала действия сертификата
const
   AVCM_NOT_BEFORE = $1A;

// дата/время окончания действия сертификата
const
   AVCM_NOT_AFTER = $1B;

// дата/время начала действия личного ключа
const
   AVCM_KEY_NOT_BEFORE = $2A;

// дата/время окончания действия личного ключа
const
   AVCM_KEY_NOT_AFTER = $2B;

// Результат полной проверки корректности сертификата
const
   AVCM_VALID = $2C;

// DER-представление сертификата
const
   AVCM_BLOB = $2D;

// Получение режима сгенерированного запроса (совместимости с MS CA).
const
   AVCM_MSCA_COMPATIBLE = $30;

// дата и время искомого сертификата должна быть
// больше или равна указанной дате и времени.
const
   AVCM_D_GREATER = $110;

// дата и время искомого сертификата должна быть
// меньше или равна указанной дате и времени.
const
   AVCM_D_LESS = $111;

// имя (X.509 Name) владельца сертификата в виде строки
const
   AVCM_SUBJECT_AS_STRING = $101C;

// атрибут имени (X.509 Name) владельца сертификата в виде строки
const
   AVCM_SUBJECT_ATTR = $101D;

// идентификатор алгоритма открытого ключа сертификата
const
   AVCM_PUB_KEY_ALG_OID = $101E;

// открытый ключ сертификата
const
   AVCM_PUB_KEY = $1F;

// атрибут альтернативного имени (X.509 AltName) владельца сертификата в виде строки
const
   AVCM_SUBJ_ALT_NAME_ATTR = $1020;

// количество дополнительных атрибутов
const
   AVCM_EXT_COUNT = $21;

// идентификатор объекта (OID) дополнения
const
   AVCM_EXT_OID = $1022;

// наименование идентификатора объекта (OID) дополнения
const
   AVCM_EXT_OID_NAME = $1026;

// признак критичности дополнения
const
   AVCM_EXT_CRITICAL = $23;

// дополнение сертификата в виде строки
const
   AVCM_EXT_AS_STRING = $1024;

// указывает предназначение искомых сертификатов
const
   AVCM_PURPOSE = $25;

// поиск сертификатов, предназначенных для подписи.
const
   AVCM_P_SIGN = $01;

// поиск сертификатов, предназначенных для зашифрования.
const
   AVCM_P_CRYPT = $02;

  // поиск неотзываемых сертификатов.
   AVCM_P_NON_REPUDIABLE = $04;

// указывает тип искомого сертификата
const
   AVCM_TYPE = $26;

// перебор только личных сертификатов
const
   AVCM_TYPE_MY = $10E;

// перебор сертификатов доверенных центров сертификации
const
   AVCM_TYPE_ROOT = $10F;

// поиск по атрибуту имени (X.509 Name) издателя сертификата в виде строки
const
   AVCM_ISSUER_ATTR = $1032;

// количество элементов в списке ограничений применения ключа сертификата
const
   AVCM_EXT_KEY_USAGE_COUNT = $28;

// идентификатор объекта (OID) из списка ограничений применения ключа сертификата.
// При этом необходима передача номера в списке (параметр attr_param).
const
   AVCM_EXT_KEY_USAGE_OID = $1027;

// наименование идентификатора объекта (OID) из списка ограничений
// применения ключа сертификата, в том случае,
// если данный OID зарегестрирован в операционной системе.
// При этом необходима передача номера либо идентификатора в списке (параметр attr_param).
const
   AVCM_EXT_KEY_USAGE_NAME = $1028;


// поиск цепочки сертификов издателей.
const
   AVCM_CERT_ISSUERS_CHAIN = $1029;
   
   
// Список точек распостранения  СОС из сертификата
const AVCM_CRL_DISTRIBUTION_POINTS = $1035;

// Каталог по умолчанию для выбора импортируемого файла
const AVCM_IMPORT_PATH       = $1036;

// Каталог по умолчанию для сохранения файла созданного запроса
const AVCM_EXPORT_PATH       = $1037;


// Указывает на необходимость создания информационного файла с описанием выполненных операций. 
// Полный путь и имя файла описания выполненной операции
const AVCM_OPERATION_REPORT       = $1038;


   

// Параметры функции AvCmGetErrorInfo
// краткое описание ошибки
const
   AVCM_SHORT_STRING = $1;

// подробное описание ошибки
const
   AVCM_DESCRIPTION = $2;

// код ошибки библиотеки.
// В этом случае в качестве указателя на выходной  буфер
// должен быть передан указатель на AvCmLong.
const
   AVCM_ERROR_CODE = $3;

// поиск по открытому сертификату издателя списка отозванных сертификатов в виде строки
const
   AVCM_CRL_ISSUER_CERT = $2;

// поле Subject издателя СОС
const
   AVCM_CRL_ISSUER_SUBJECT = $1;

// вернуть дескриптор импортированного и открытого объекта
const
   AVCM_RESULT_HANDLE = $2;


// DER-представление сертификата
const
   AVCM_CERTIFICATE = $1;

// DER-представление списка отозванных сертификатов
const
   AVCM_CRL = $2;

// DER-представление запроса на сертификат в формате PKCS#10
const
   AVCM_PKCS10_REQUEST = $4;

// DER-представление подписанной заявки на сертификат в формате PKCS#7 SignedData
const
   AVCM_PKCS7_REQUEST = $5;

// DER-представление цепочки сертификатов (p7b)
   AVCM_PKCS7_CHAIN = $8;

// Используется совместно с AvCmLogin:AVCM_DBT_E_MEMORY
const
   AVCM_STORES = $201;


// дата/время отзыва сертификата
const
   AVCM_CS_REVOCATION_TIME = $301;

// причина отзыва сертификата
const
   AVCM_CS_REVOCATION_REASON = $302;

// причина недоверия сертификату
const
   AVCM_CS_UNTRUST_REASON = $303;




// режим проверки статуса
const
   AVCM_CHECK_MODE = $401;

// проверка статуса с использованием локального СОС
const
   AVCM_CM_OFFLINE = $402;

// проверка статуса сертификата с обращением
const
   AVCM_CM_ONLINE = $403;

// адрес OCSP сервера
const
   AVCM_RESPONDER_URL = $404;

   
// AvCmGenerateRequest – сгенерировать запрос в продолжение переданного сертификата
const 
   AVCM_CERT_PROLONGATION = $405;
   
// AvCmImport - импорт сертификатов и/или СОС из файла
const 
   AVCM_ANY_FILE = $406;   
   
   

// ---------- Причины недоверия сертификату ----------

//! Базовый код причин недоверия
const
   AVCM_CSR_BASE = $077B1000;

// Сертификат отозван
const
   AVCM_CSR_REVOKED = $01 + AVCM_CSR_BASE;

// Причина недоверия не определенеа
const
   AVCM_CSR_UNKNOWN = $02 + AVCM_CSR_BASE;


   // ---------- Коды ошибок ----------
   // Успешное выполнение функции
const
   AVCMR_SUCCESS = 0;

   //! Базовый код ошибок
const
   AVCMR_BASE = $E82A0100;

   // Ошибка при распределении памяти
const
   AVCMR_ALLOC_ERROR = $01 + AVCMR_BASE;

   // Идентификатор атрибута неверен
const
   AVCMR_BAD_ATTR = $02 + AVCMR_BASE;

   // Неверный формат сообщения
const
   AVCMR_BAD_FORMAT = $03 + AVCMR_BASE;

   // Дескриптор объекта неверен
const
   AVCMR_BAD_HANDLE = $04 + AVCMR_BASE;

   // Дескриптор соединения неверен
const
   AVCMR_BAD_HC = $05 + AVCMR_BASE;

   // Дескриптор сертификата неверен
const
   AVCMR_BAD_HCERT = $06 + AVCMR_BASE;

   // Дескриптор перебора сертификатов неверен
const
   AVCMR_BAD_HENUM = $07 + AVCMR_BASE;

   // Дескриптор открытого сообщения неверен
const
   AVCMR_BAD_HMSG = $08 + AVCMR_BASE;

   // Дескриптор подписи неверен
const
   AVCMR_BAD_HSIGN = $09 + AVCMR_BASE;

   // В сообщении нет подписи с указанным номером
const
   AVCMR_BAD_NUMBER = $0A + AVCMR_BASE;

   // Пароль неверен
const
   AVCMR_BAD_PASSWORD = $0B + AVCMR_BASE;

   // Выходной буфер слишком мал
const
   AVCMR_BUFFER_TOO_SMALL = $0C + AVCMR_BASE;

   // Не найден личный сертификат
const
   AVCMR_CERT_NOT_FOUND = $0D + AVCMR_BASE;

   // Подпись под сертификатом издателя неверна
const
   AVCMR_CERT_CA_INVALID = $0E + AVCMR_BASE;

   // Сертификат издателя не найден
const
   AVCMR_CERT_CA_NOT_FOUND = $0F + AVCMR_BASE;

   // Срок действия личного ключа сертификата неверен
const
   AVCMR_CERT_EXPIRED = $10 + AVCMR_BASE;

   // Сертификат не предназначен для шифрования
const
   AVCMR_CERT_NOT_FOR_CRYPT = $11 + AVCMR_BASE;

   // Сертификат не предназначен для подписи
const
   AVCMR_CERT_NOT_FOR_SIGN = $12 + AVCMR_BASE;

   // Подпись под сертификатом неверна
const
   AVCMR_CERT_SIGN_INVALID = $13 + AVCMR_BASE;

   // Не найдено или пусто хранилище сертификатов
const
   AVCMR_CERT_STORE_NOT_FOUND = $14 + AVCMR_BASE;

   // Не найден контейнер с личными ключами на носителе
const
   AVCMR_CONTAINER_NOT_FOUND = $15 + AVCMR_BASE;

   // Подпись под СОС издателя неверна или СОС устарел
const
   AVCMR_CRL_INVALID = $16 + AVCMR_BASE;

   // СОС издателя не найден
const
   AVCMR_CRL_NOT_FOUND = $17 + AVCMR_BASE;

   // Невозможно подключится к базе данных
const
   AVCMR_DB_NOT_FOUND = $18 + AVCMR_BASE;

   // Не найден носитель
const
   AVCMR_DEVICE_NOT_FOUND = $19 + AVCMR_BASE;

   // Невозможно закрыть объект, объект занят
const
   AVCMR_BUSY = $1A + AVCMR_BASE;

   // Не указаны параметры подключения к базе данных
const
   AVCMR_NO_DB_PARAMS = $1B + AVCMR_BASE;

   // Входное сообщение имеет нулевой размер
const
   AVCMR_NO_INPUT = $1C + AVCMR_BASE;

   // Сообщение не имеет подписи, выработанной на ключа данного сертификата
const
   AVCMR_NO_SIGN = $1D + AVCMR_BASE;

   // Повторная попытка инициализации библиотеки
const
   AVCMR_ALREADY_INITIALIZED = $1E + AVCMR_BASE;

   // Библиотека не была инициализирована
const
   AVCMR_NOT_INITIALIZED = $1F + AVCMR_BASE;

   // Формат даты/времени некорректен
const
   AVCMR_BAD_DATE = $20 + AVCMR_BASE;

   // Функции переданы неверные флаги
const
   AVCMR_BAD_FLAGS = $21 + AVCMR_BASE;

   // Попытка обратится к сессии, созданной в одном потоке, из другого потока
const
   AVCMR_BAD_THREAD = $22 + AVCMR_BASE;

   // Дата не подходящая
const
   AVCMR_DATE_NOT_VALID = $23 + AVCMR_BASE;

   // Внутренняя ошибка библиотеки
const
   AVCMR_INTERNAL_ERROR = $24 + AVCMR_BASE;

   // Объект не найден
const
   AVCMR_NOT_FOUND = $25 + AVCMR_BASE;

   // Функция не реализована
const
   AVCMR_NOT_IMPLEMENTED = $26 + AVCMR_BASE;

   // Подпись неверна
const
   AVCMR_SIGN_INVALID = $27 + AVCMR_BASE;

   // Сессия создана без авторизации пользователя
const
   AVCMR_USER_NO_AUTH = $28 + AVCMR_BASE;

// Параметр функции неверен
const
   AVCMR_BAD_PARAM = $29 + AVCMR_BASE;

// Неверный формат подписи СТБ
const
   AVCMR_BAD_FORMED_SIGN = $2A + AVCMR_BASE;

// Инициализация криптопровайдера Авест завершилась неудачно
const
   AVCMR_AVCSP_INIT_FAILED = $2B + AVCMR_BASE;

// Ошибка доступа к реестру Windows
const
   AVCMR_REGISTRY_ERROR = $2C + AVCMR_BASE;

// Произошла ошибка при вызове функций Win32
const
   AVCMR_WIN32_ERROR = $2D + AVCMR_BASE;


// Невозможно расшифровать сообщение:
// среди сертификатов получателей сообщения отсутствует
// личный сертификат аутентифицированного пользователя
const
   AVCMR_OTHER_RECIPIENT = $2E + AVCMR_BASE;


// Не найден СДЦС (список доверяемых центров сертификации)
const
   AVCMR_CTL_NOT_FOUND = $2F + AVCMR_BASE;

// Сертификат отозван
const
   AVCMR_CERT_REVOKED = $30 + AVCMR_BASE;

// Нет доверия сертификату
const
   AVCMR_CERT_NOT_TRUSTED = $31 + AVCMR_BASE;

// Срок действия СОС истек
const
   AVCMR_CRL_EXPIRED = $32 + AVCMR_BASE;

// Сертификат издателя СОС не найден
const
   AVCMR_CRL_ISSUER_NOT_FOUND = $33 + AVCMR_BASE;

// Срок действия сертификата издателя СОС истек
const
   AVCMR_CRL_ISSUER_EXPIRED = $34 + AVCMR_BASE;

// Версия библиотеки не соответствует версии хранилища сертификатов.
const
   AVCMR_CERT_STORE_BAD_VERSION = $35 + AVCMR_BASE;

// В личном хранилище отсутствуют действующие сертификаты.
const
   AVCMR_MY_STORE_EMPTY = $36 + AVCMR_BASE;

// Действие отменено пользователем.
const
   AVCMR_USER_CANCEL = $37 + AVCMR_BASE;

// Сертификат содержит расширенное использование ключа не поддерживаемое центром регистрации
const
   AVCMR_RA_EXT_KEY_USAGE_NOT_ALLOWED = $38 + AVCMR_BASE;

// Сертификат содержит дополнение не поддерживаемое центром регистрации.
const
   AVCMR_RA_EXT_NOT_ALLOWED = $39 + AVCMR_BASE;

// В личном справочнике несколько действующих сертификатов
const
   AVCMR_TOO_MANY_CERT = $3A + AVCMR_BASE;


// Параметр поиска не существует
const
   AVCMR_PARAM_SPEC_NOT_FOUND = $40 + AVCMR_BASE;

// Сертификат не является сертификатом ЦР
const
   AVCMR_CERT_NOT_RA = $41 + AVCMR_BASE;

// Объект уже существует
const
   AVCMR_ALREADY_EXISTS = $42 + AVCMR_BASE;

// Код ошибки неизвестен библиотеке
const
   AVCMR_UNKNOWN_ERROR_CODE = $43 + AVCMR_BASE;

// Издатель СОС отличается от ожидаемого издателя, переданного параметром AVCM_CRL_ISSUER_SUBJECT
const
   AVCMR_BAD_CRL_ISSUER = $44 + AVCMR_BASE;

// В справочнике списков отозванных сертификатов имеется более новый СОС данного издателя
const
   AVCMR_OLD_CRL = $45 + AVCMR_BASE;

// Дескриптор СОС неверен
const
   AVCMR_BAD_HCRL = $46 + AVCMR_BASE;

// Сертификат временно приостановлен
const
   AVCMR_CERT_TEMPORARY_REVOKED = $47 + AVCMR_BASE;

// Ошибка подтверждения пароля при повторной аутентификации.
// Вставлен неверный носитель или неверно задан личный пароль.
const
   AVCMR_REPEAT_AUTHENTICATION_ERROR = $48 + AVCMR_BASE;

// Нет прав доступа к базе сертификации.
const
   AVCMR_DB_AUTHENTICATION_ERROR = $49 + AVCMR_BASE;

// Носитель с личным ключом не установлен
const
   AVCMR_TOKEN_NOT_FOUND = $4A + AVCMR_BASE;

// Сообщение не имеет содержимого
const
   AVCMR_NO_CONTENT = $4B + AVCMR_BASE;

// Срок действия сертификата неверен
// Ошибка удалена
//const AVCMR_CERT_EXPIRED         = $10 + AVCMR_BASE;

// Срок действия сертификата не наступил
const
   AVCMR_CERT_NOT_VALID_YET = $4C + AVCMR_BASE;

// Срок действия сертификата истек
const
   AVCMR_CERT_ALREADY_EXPIRED = $4D + AVCMR_BASE;

// Носитель не зарегистрирован
const
   AVCMR_INVALID_TOKEN = $4E + AVCMR_BASE;

// Ошибка расшифрования ключа
const
   AVCMR_BAD_KEY = $4F + AVCMR_BASE;

// Ошибка записи на носитель
const
   AVCMR_TOKEN_WRITE_ERROR = $50 + AVCMR_BASE;

// сертификат не найден, но найден отказ УЦ в выдаче сертификата по данному запросу
const
   AVCMR_REQUEST_DENIED = $51 + AVCMR_BASE;

// Передан некорректный указатель на выходной буфер
const
   AVCMR_BAD_BUFFER_PTR = $52 + AVCMR_BASE;

// Объект заблокирован другим приложением.
const
   AVCMR_OBJ_LOCKED = $53 + AVCMR_BASE;

// Отсутствуют получатели зашифрованного сообщения.
const
   AVCMR_NO_RECIPIENTS = $54 + AVCMR_BASE;

// Алгоритм не поддерживается
const
   AVCMR_ALG_NOT_SUPPORTED = $55 + AVCMR_BASE;

// Сертификат не отозван
const
   AVCMR_CERT_NOT_REVOKED = $56 + AVCMR_BASE;

  //  Невозможно зарегистрировать запрос на сертификат УЦ
  AVCMR_REQUEST_FOR_CA_DENIED = $57 + AVCMR_BASE;

  //  Невозможно зарегистрировать запрос на сертификат УЦ
  AVCMR_REQUEST_FOR_RA_DENIED = $58 + AVCMR_BASE;

  //  РЦ не имеет права на выполнение данной операции
  AVCMR_REQUEST_FOR_REVOKE_DENIED = $59 + AVCMR_BASE;

  // УЦ не имеет права выдавать сертификаты или не может является конечным сертификатом.
  AVCMR_INVALID_BASIC_CONSTRAINTS = $5A + AVCMR_BASE;

  // Синтаксическая ошибка AvCryptSQL.
  AVCMR_CRYPTSQL_SYNTAX_ERROR = $5B + AVCMR_BASE;

  // Сертификат/СОС не удовлетворяет условиям отбора
  AVCMR_NOT_CONDITION = $5C + AVCMR_BASE;
  sAVCMR_NOT_CONDITION = 'Сертификат/СОС не удовлетворяет условиям отбора.';

  // Не удалось проверить ЭЦП. Возможно, потеряно соединение с AvHSM.
  AVCMR_VERIFY_ERROR = $5D + AVCMR_BASE;

  // Нарушена целостность входных данных.
  AVCMR_BAD_DATA = $5E + AVCMR_BASE;

  // Не найден оригинальный файл для проверки подписи
  AVCMR_ORIGINAL_FILE_FOR_VERIFY_NOT_FOUND = $5F + AVCMR_BASE;

  // Сертификат не предназначен для подписи сертификатов
  AVCMR_CERT_NOT_FOR_SIGN_CERT = $60 + AVCMR_BASE;

  // Сертификат не предназначен для подписи СОС
  AVCMR_CERT_NOT_FOR_SIGN_CRL = $61 + AVCMR_BASE;

  // Сертификат содержит неизвестное критическое дополнение.
  AVCMR_CERT_UNKNOWN_CRITICAL_EXT = $62 + AVCMR_BASE;

  // СОС содержит неизвестное критическое дополнение.
  AVCMR_CRL_UNKNOWN_CRITICAL_EXT = $63 + AVCMR_BASE;

  //Применение ключа задано неверно.
  AVCMR_INVALID_KEY_USAGE = $64 + AVCMR_BASE;

  // Сертификат РЦ выпущен другим УЦ.
  AVCMR_INVALID_RACERT = $65 + AVCMR_BASE;

  AVCMR_CRLSERVER_ERROR = $66 + AVCMR_BASE;

  // Ошибка загрузки библиотеки PKCS#11
  AVCMR_LOADLIBPKCS11_ERROR = $67 + AVCMR_BASE;

  // Неверно задан путь к точкам распространения СОС
  AVCMR_CRLDP_BAD_PATH = $68 + AVCMR_BASE;

  // Атрибуты запроса на сертификат имеют отличия от атрибутов продлеваемого сертификата
  AVCMR_RENEW_BAD_ATTR = $69 + AVCMR_BASE;


  AVCMR_POLICY_NOT_FOUND = $70 + AVCMR_BASE;
  AVCMR_POLICY_NOT_APPLY = $71 + AVCMR_BASE;

  // Сертификат не предназначен для подписи атрибутных сертификатов
  AVCMR_CERT_NOT_FOR_SIGN_ACERT = $72 + AVCMR_BASE;

  // Ошибка при обращении к OCSP серверу
  AVCMR_OCSP_ERROR = $73 + AVCMR_BASE;

  // Срок личного ключа истек
  AVCMR_KEY_ALREADY_EXPIRED = $74 + AVCMR_BASE;

  // Носитель не установлен
  AVCMR_PKCS11_TOKEN_NOT_PRESENTERROR = $75 + AVCMR_BASE;

  // Ошибка при вызове функции PKCS#11
  AVCMR_PKCS11_ERROR = $76 + AVCMR_BASE;

  // Не выбрано действие для сохранения объекта в LDAP
  AVCMR_LDAP_ACTION_NOT_FOUND = $77 + AVCMR_BASE;

  //Запрос на сертификат ждет ручного утверждения
  AVCMR_SCEP_PENDING = $78 + AVCMR_BASE;

  // Ошибка при обращении к серверу SCEP
  AVCMR_SCEP_ERROR = $79 + AVCMR_BASE;

  // OCSP сервис для данного сертификата не задан
  AVCMR_OCSP_NOT_DEFINED = $80 + AVCMR_BASE;

  // Ошибка дополнительной проверки.
  AVCMR_EXTERNALCHECKS_ERROR2 = $81 + AVCMR_BASE;

  //Второй СОС для архивной проверки не найден.
  AVCMR_CRL2_NOT_FOUND = $82 + AVCMR_BASE;

  // Сертификат отправителя не найден.
  AVCMR_ORIGINATOR_NOT_FOUND = $83 + AVCMR_BASE;

  // Шифрования заданным алгоритмом не поддерживается для данного сертификата.
  AVCMR_ENC_ALG_BAD = $84 + AVCMR_BASE;

  // В выдаче сертификата отказано сервером SCEP
  AVCMR_SCEP_ERROR2 = $85 + AVCMR_BASE;

  // OCSP-серверу не удалось определить статус сертификата
  AVCMR_OCSP_BAD_STATUS = $86 + AVCMR_BASE;

  // Ошибка HTTP
  AVCMR_HTTP_ERROR = $87 + AVCMR_BASE;

  //Ответ сервера:
  AVCMR_SERVER_ERROR = $88 + AVCMR_BASE;

  //Сервер запросил аутентификацию клиента, но переданный мандат не содержит требуемый сертификат клиента.
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

//    Значения статуса OCSPSingleResponse

  AVCM_OCSP_STATUS_GOOD =       (AVCM_CONST_BASE + 1);
  AVCM_OCSP_STATUS_REVOKED =    (AVCM_CONST_BASE + 2);
  AVCM_OCSP_STATUS_UNKNOWN =    (AVCM_CONST_BASE + 3);
  AVCM_OCSP_STATUS_BAD =        (AVCM_CONST_BASE + 4);


// Attribute Certificate
  AVCM_ATTRIBUTE_CERTS = $323;

  // количество дополнительных атрибутов
  AVCM_ATTR_COUNT = $324;

  AVCM_ATTR_BLOB = $325;

  // идентификатор объекта (OID) атрибута
  AVCM_ATTR_OID            = $1042;

  // значение атрибута сертификата в виде строки
  AVCM_ATTR_AS_STRING      = $1043;

  // наименование идентификатора объекта (OID) атрибута
  AVCM_ATTR_OID_NAME       = $1044;

  // количество контейнеров на носителе, функция AvCmScepGet
  AVCM_CONTAINERCOUNT = $326;

  // запрос на сертификат, функция AvCmScepSet
  AVCM_SCEP_REQUEST = $327;

  AVCM_SCEP_PKCS_REQ = $328;

  AVCM_SCEP_GET_CERT_INITIAL = $329;

  AVCM_SCEP_LOGIN = $330;


  // щаблон на сертификат для функции AvCmGenerateRequest
  AVCM_TEMPLATE_DATA = $331;
  // шаблон карточки открытого ключа
  AVCM_CARDS_DATA = $332;

  AVCM_CERT_DATA = $332;

  // Установка CA сервера SCEP /AVCMF_SCEP_OFFLINE
  AVCM_SCEP_CACERT = $333;

  // Установка/получение данных для сервера SCEP /AVCMF_SCEP_OFFLINE
  AVCM_SCEP_PKIOPERATION = $334;

  AVCM_SCEP_PKCS_REQ_PREPARE = $335;
  AVCM_SCEP_PKCS_REQ_ENROLL =  $336;

  AVCM_STORE_TYPE = $337;

  AVCM_REQUEST_STATE   =       $337;

  // Результат
  AVCM_REQUEST_STATE_INBOX = 1;
  // в входной очереди
  AVCM_REQUEST_STATE_PROCESSED = 2;
  // обработан
  AVCM_REQUEST_STATE_REJECTED = 3;
  // отказано в выдаче сертификата
  AVCM_REQUEST_STATE_MANUALPROCESSING = 4;
  // переведен в ручную обработку
  AVCM_REQUEST_STATE_SIGN_WAIT = 5;
  // ожидание второй подписи
  AVCM_REQUEST_STATE_PENDING = 6;
  // ожидание обработки сервером SCEP


  // имя контейнера, функция AvCmScepGet
  AVCM_CONTAINERNAME       = $1045;

  AVCM_SCEP_TRANSACTIONID  = $1046;

 //
  AVCM_MSG_INI  = $1047;

  // Получение URL к SCEP /AvCmGetRequestAttr
  AVCM_SCEP_URL  = $1048;

  // Количество пунктов политик сертификата
  AVCM_POLICYINFO_COUNT = $338;
  // описание политики сертификата
  AVCM_POLICYINFO_OID = $1049;
  AVCM_VIEW_SIGN_ATTR = $339;


  // Путь доступа к LDAP
  AVCM_LDAP_PATH = $1050;

  // Серийный номер исходного сертификата, на основании которого выпущен атрибутный
  AVCM_BASE_SERIAL_AS_STRING = $1051;
  // Имя издателя исходного сертификата, на основании которого выпущен атрибутный
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
  //AVCM_IMPORT_CRL_FILENAME = $422; - пока не используется
  //AVCM_IMPORT_CA_FILENAME = $422; - пока не используется (подчиненный)

  // countersignature
  AVCM_COUNTERSIGNATURE_COUNT = $430;
  AVCM_COUNTERSIGNATURE_BYNUM = $431;
  AVCM_MSGSIGN_VALID          = $432;

//
//--------- Функции библиотеки ---------


{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmSetWorkDir:
   function(
      WorkDir: PChar): AvCmResult; stdcall;
   {$ELSE}
function AvCmSetWorkDir(
   WorkDir: PChar): AvCmResult; stdcall;
{$ENDIF}

// Инициализация библиотеки.
{$IFDEF AVCRYPTMAIL_DYNAMIC}
var
   AvCmInit: function(
      flags: AvCmLong): AvCmResult; stdcall;
   {$ELSE}
function AvCmInit(
   flags: AvCmLong): AvCmResult; stdcall;
{$ENDIF}


// Функция авторизации пользователя.
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


// Функция отключения пользователя
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

// Функция для сброса данных сессии
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


// Функция генерации подписанного сообщения.
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


// Функция проверки подписи и получения исходного сообщения.
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


// Функция зашифрования сообщения.
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


// Функция расшифрования полученного зашифрованного сообщения.
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


// Функция генерации подписанного сообщения с последующим его зашифрованием.
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


// Функция расшифрования сообщения с последующей проверкой подписи;
// и получения исходного сообщения
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


// Функция получения параметров открытой объекта библиотеки.
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


// Функция создания копии объекта;
// управляемого переданным дескриптором объекта библиотеки.
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


// Функция закрытия дескриптора объекта библиотеки;
// полученного в результате одного из вызовов библиотеки
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


// Функция создания или открытия и разбора подписанного
// или зашифрованного сообщения.
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


// Функция получения параметров открытого сообщения.
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


// Функция выработки подписи под сообщением.
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


// Функция проверки подписи в открытом подписанном сообщении.
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


// Функция зашифрования открытого сообщения.
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


// Функция расшифрования открытого зашифрованного сообщения.
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


// Функция получения сгенерированного сообщения
// в одном из экспортируемых форматов.
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


// Функция извлечения содержимого сообщения.
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


// Функция извлечения одной из подписей данного подписанного сообщения.
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


// Функция извлечения атрибутов подписи.
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


// Функция поиска сертификата по его подписи.
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


// Функция извлечения атрибутов сертификата.
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


// Функция создания контекста поиска сертификата путем
// перебора подмножества сертификатов;
// удовлетворяющих определенным условиям.
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


// Функция перебора объектов в открытом перечислении.
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


// Функция возвращает различные параметры возникшей
// в процессе работы одной из функций библиотеки ошибки.
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


// Функция установки содержимого сообщения.
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


// Функция диалога создания контекста
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


// Функция добавления сертификата в сообщение
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


// Функция импорта сертификатов из сообщения
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


// Функция генерации СТБ-подписи
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


// Функция показа информации об объекте
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

// Функция показа информации об объекте
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


// Функция добавления сертификатов в контекст
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


// Функция проверки подписи в открытом подписанном сообщении по номеру
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


// Инициализация библиотеки с указанием рабочего каталога.
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


// Функция открытия вложенного сообщения
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


// Функция предназначена для генерации запроса на сертификат
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


// Функция предназначена для извлечения атрибутов запроса на сертификат
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


// Функция предназначена для поиска и открытия запроса на сертификат.
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


// Функция предназначена для поиска и открытия списка отозванных сертификатов в справочниках сертификатов/СОС.
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


// Функция предназначена для извлечения атрибутов списка отозванных сертификатов.
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


// Функция AvCmImport предназначена для импорта сертификата или списка отозванных сертификатов
// в соответствующие справочники сертификатов/СОС.
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


// Функция предназначена для помещения сертификата, извлеченного из сообщения в справочник сертификатов.
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


// Функция предназначена для проверки статуса сертификата
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


// Функция предназначена для получения данных статуса сертификата
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


//Функция предназначена для проверки ЭЦП
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


//Функция установки дескриптора приложения
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


// Функция подписи файла
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


// Функция проверки подписи файла
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


// Функция зашифрования файла
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


// Функция расшифрования файла
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


// Инициализация библиотеки.

function AvCmInit(
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция авторизации пользователя.

function AvCmLogin(
   conn_param_count: AvCmLong;
   conn_params: PAvCmConnectionParam;
   var hc: AvCmHc;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция отключения пользователя

function AvCmLogout(
   hc: AvCmHc;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


function AvCmFlush(
   hc: AvCmHc;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// Функция генерации подписанного сообщения.

function AvCmSign(
   hc: AvCmHandle;
   input_message: pointer;
   input_size: AvCmSize;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция проверки подписи и получения исходного сообщения.

function AvCmVerifySign(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   var hsgn_cert_enum: AvCmHsgnCertEnum;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция зашифрования сообщения.

function AvCmEncrypt(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   cert_count: AvCmLong;
   certificates: PAvCmHcert;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция расшифрования полученного зашифрованного сообщения.

function AvCmDecrypt(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция генерации подписанного сообщения с последующим его зашифрованием.

function AvCmSignAndEncrypt(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   cert_count: AvCmLong;
   certificates: PAvCmHcert;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция расшифрования сообщения с последующей проверкой подписи;
// и получения исходного сообщения

function AvCmDecryptAndVerifySign(
   hc: AvCmHc;
   input_message: pointer;
   input_size: AvCmSize;
   var hsgn_cert_enum: AvCmHsgnCertEnum;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция получения параметров открытой объекта библиотеки.

function AvCmGetObjectInfo(
   handle: AvCmHandle;
   param_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция создания копии объекта;
// управляемого переданным дескриптором объекта библиотеки.

function AvCmDuplicateHandle(
   source_handle: AvCmHandle;
   dest_hc: AvCmHc;
   var copy_of_handle: AvCmHandle;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция закрытия дескриптора объекта библиотеки;
// полученного в результате одного из вызовов библиотеки

function AvCmCloseHandle(
   handle: AvCmHandle;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция создания или открытия и разбора подписанного
// или зашифрованного сообщения.

function AvCmOpenMsg(
   hc: AvCmHc;
   message_data: pointer;
   message_size: AvCmSize;
   var hmsg: AvCmHmsg;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция получения параметров открытого сообщения.

function AvCmGetMsgParam(
   hmsg: AvCmHmsg;
   attr_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция выработки подписи под сообщением.

function AvCmMsgSign(
   hmsg: AvCmHmsg;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция проверки подписи в открытом подписанном сообщении.

function AvCmMsgVerifySign(
   hmsg: AvCmHmsg;
   hcert: AvCmHcert;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция зашифрования открытого сообщения.

function AvCmMsgEncrypt(
   hmsg: AvCmHmsg;
   cert_count: AvCmLong;
   certificates: PAvCmHcert;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция расшифрования открытого зашифрованного сообщения.

function AvCmMsgDecrypt(
   hmsg: AvCmHmsg;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция получения сгенерированного сообщения
// в одном из экспортируемых форматов.

function AvCmGetMsg(
   hmsg: AvCmHmsg;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция извлечения содержимого сообщения.

function AvCmGetMsgContent(
   hmsg: AvCmHmsg;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция извлечения одной из подписей данного подписанного сообщения.

function AvCmGetMsgSign(
   hmsg: AvCmHmsg;
   sign_number: AvCmLong;
   var hsign: AvCmHsign;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция извлечения атрибутов подписи.

function AvCmGetSignAttr(
   handle: AvCmHandle;
   attr_id: AvCmLong;
   attr_param: pointer;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция поиска сертификата по его подписи.

function AvCmFindCertBySign(
   hsign: AvCmHsign;
   var hcert: AvCmHcert;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция извлечения атрибутов сертификата.

function AvCmGetCertAttr(
   handle: AvCmHandle;
   attr_id: AvCmLong;
   attr_param: pointer;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция создания контекста поиска сертификата путем
// перебора подмножества сертификатов;
// удовлетворяющих определенным условиям.

function AvCmOpenCertEnum(
   hc: AvCmHc;
   param_count: AvCmLong;
   params: PAvCmEnumGetParam;
   var hcert_enum: AvCmHcertEnum;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция перебора объектов в открытом перечислении.

function AvCmEnumGet(
   henum: AvCmHenum;
   var handle: AvCmHandle;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция возвращает различные параметры возникшей
// в процессе работы одной из функций библиотеки ошибки.

function AvCmGetErrorInfo(
   hc: AvCmHc;
   error_code: AvCmResult;
   param_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция проверки даты и времени выработки ЭЦП;
// полученной от функции AvCmGetSignAttr.

function AvCmCheckDate(
   test_date: SYSTEMTIME;
   sign_date_time: SYSTEMTIME;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// Функция установки содержимого сообщения.

function AvCmSetMsgContent(
   hmsg: AvCmHmsg;
   input_buffer: PByte;
   input_size: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// Функция диалога создания контекста

function AvCmEnumDlg(Hc: AvCmHc; //Wnd: HWnd;
   cpszDlgCaption, cpszLabel, cpszOkButtonCaption: PAnsiChar; var henum:
   AvCmHenum; flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция добавления сертификата в сообщение

function AvCmMsgAddCert(
   hmsg: AvCmHMsg;
   cert_count: AvCmSize;
   const certificates: PAvCmHandle;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// Функция импорта сертификатов из сообщения

function AvCmMsgImportCerts(
   HMsg: AvCmHMsg;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция получения СТБ-подписи

function AvCmMsgGetSTBSign(
   HMsg: AvCmHMsg;
   pBuffer: Pointer;
   var pBufferSize: AvCmSize;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция показа информации об объекте

function AvCmShowObjectInfo(
   handle: AvCmHandle;
   const cpszDlgCaption: PChar;
   const cpszLabel: PChar;
   const cpszOkButtonCaption: PChar;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция показа информации об объекте
function AvCmShowObjectInfoExt(
      handle: AvCmHandle;
      h: HWND; var handle2: AvCmHandle;
      flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';


// Функция добавления сертификатов в контекст

function AvCmEnumAddCerts(
   hcert_enum: AvCmHcertEnum;
   param_count: AvCmLong;
   const params: PAvCmEnumGetParam;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция проверки подписи в открытом подписанном сообщении по номеру

function AvCmMsgVerifySignAtIndex(
   hmsg: AvCmHMsg;
   sign_index: AvCmLong;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Инициализация библиотеки с указанием рабочего каталога.

function AvCmInitEx(
   const cpszWorkDir: PChar;
   flags: AvCmLong): AvCmResult; far; stdcall; external 'AvCryptMail.dll';

// Функция открытия вложенного сообщения

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

// Функция предназначена для проверки статуса сертификата

function AvCmVerifyCertStatus(
   handle: AvCmHandle;
   param_count: AvCmLong;
   const params: PAvCmCertStatParam;
   var status_ok: AvCmLong;
   var hstatus: AvCmHcertstat;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

// Функция предназначена для получения данных статуса сертификата

function AvCmGetCertStatusAttr(
   hstatus: AvCmHcertstat;
   attr_id: AvCmLong;
   output_buffer: pointer;
   var output_size: AvCmSize;
   flags: AvCmLong): AvCmResult;
   far; stdcall; external 'AvCryptMail.dll';

//Функция предназначена для проверки ЭЦП

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

