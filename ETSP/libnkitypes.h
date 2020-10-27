#ifndef _PKCS11TYPES_H_
#define _PKCS11TYPES_H_

#ifdef __cplusplus
extern "C"
{
#endif

#ifndef FALSE
#define FALSE                           0
#endif

#ifndef TRUE
#define TRUE                            (!FALSE)
#endif

#define CK_PTR                          *

#define CK_CALLBACK_FUNCTION(r,n)       r (* n)

#ifndef NULL_PTR
#define NULL_PTR                        ((void *) NULL)
#endif

#define CK_ENTRY

/*---------------------------------------------------------------------*
   <<< ResVals - LSM Functions return codes >>>
 *---------------------------------------------------------------------*/

#define  CKR_OK                                 0x00000000
#define  CKR_CANCEL                             0x00000001
#define  CKR_HOST_MEMORY                        0x00000002
#define  CKR_SLOT_ID_INVALID                    0x00000003
#define  CKR_FLAGS_INVALID                      0x00000004      /* no from v2.0  */
#define  CKR_GENERAL_ERROR                      0x00000005      /* new for v2.0  */
#define  CKR_FUNCTION_FAILED                    0x00000006      /* new for v2.0  */
#define  CKR_ARGUMENTS_BAD                      0x00000007      /* new for v2.01 */
#define  CKR_NO_EVENT                           0x00000008      /* new for v2.01 */
#define  CKR_NEED_TO_CREATE_THREADS             0x00000009      /* new for v2.01 */
#define  CKR_CANT_LOCK                          0x0000000A

#define  CKR_ATTRIBUTE_READ_ONLY                0x00000010
#define  CKR_ATTRIBUTE_SENSITIVE                0x00000011
#define  CKR_ATTRIBUTE_TYPE_INVALID             0x00000012
#define  CKR_ATTRIBUTE_VALUE_INVALID            0x00000013

#define  CKR_DATA_INVALID                       0x00000020
#define  CKR_DATA_LEN_RANGE                     0x00000021

#define  CKR_DEVICE_ERROR                       0x00000030
#define  CKR_DEVICE_MEMORY                      0x00000031
#define  CKR_DEVICE_REMOVED                     0x00000032

#define  CKR_ENCRYPTED_DATA_INVALID             0x00000040
#define  CKR_ENCRYPTED_DATA_LEN_RANGE           0x00000041

#define  CKR_FUNCTION_CANCELED                  0x00000050
#define  CKR_FUNCTION_NOT_PARALLEL              0x00000051
#define  CKR_FUNCTION_NOT_SUPPORTED             0x00000054      /* new for v2.0  */

#define  CKR_KEY_HANDLE_INVALID                 0x00000060

#define  CKR_KEY_SENSITIVE                      0x00000061      /* no from v2.0  */
#define  CKR_KEY_SIZE_RANGE                     0x00000062
#define  CKR_KEY_TYPE_INCONSISTENT              0x00000063
#define  CKR_KEY_NOT_NEEDED                     0x00000064      /* new for v2.0  */
#define  CKR_KEY_CHANGED                        0x00000065      /* new for v2.0  */
#define  CKR_KEY_NEEDED                         0x00000066      /* new for v2.0  */
#define  CKR_KEY_INDIGESTIBLE                   0x00000067      /* new for v2.0  */
#define  CKR_KEY_FUNCTION_NOT_PERMITTED         0x00000068      /* new for v2.0  */
#define  CKR_KEY_NOT_WRAPPABLE                  0x00000069      /* new for v2.0  */
#define  CKR_KEY_UNEXTRACTABLE                  0x0000006A      /* new for v2.0  */

#define  CKR_MECHANISM_INVALID                  0x00000070
#define  CKR_MECHANISM_PARAM_INVALID            0x00000071

#define  CKR_OBJECT_CLASS_INCONSISTENT          0x00000080      /* no from v2.0  */
#define  CKR_OBJECT_CLASS_INVALID               0x00000081      /* no from v2.0  */
#define  CKR_OBJECT_HANDLE_INVALID              0x00000082

#define  CKR_OPERATION_ACTIVE                   0x00000090
#define  CKR_OPERATION_NOT_INITIALIZED          0x00000091

#define  CKR_PIN_INCORRECT                      0x000000A0
#define  CKR_PIN_INVALID                        0x000000A1
#define  CKR_PIN_LEN_RANGE                      0x000000A2
#define  CKR_PIN_EXPIRED                        0x000000A3      /* new for v2.0  */
#define  CKR_PIN_LOCKED                         0x000000A4      /* new for v2.0  */

#define  CKR_SESSION_CLOSED                     0x000000B0
#define  CKR_SESSION_COUNT                      0x000000B1
#define  CKR_SESSION_HANDLE_INVALID             0x000000B3
#define  CKR_SESSION_PARALLEL_NOT_SUPPORTED     0x000000B4
#define  CKR_SESSION_READ_ONLY                  0x000000B5
#define  CKR_SESSION_EXISTS                     0x000000B6
#define  CKR_SESSION_READ_ONLY_EXISTS           0x000000B7      /* new for v2.0  */
#define  CKR_SESSION_READ_WRITE_SO_EXISTS       0x000000B8      /* new for v2.0  */

#define  CKR_SIGNATURE_INVALID                  0x000000C0
#define  CKR_SIGNATURE_LEN_RANGE                0x000000C1

#define  CKR_TEMPLATE_INCOMPLETE                0x000000D0
#define  CKR_TEMPLATE_INCONSISTENT              0x000000D1

#define  CKR_TOKEN_NOT_PRESENT                  0x000000E0
#define  CKR_TOKEN_NOT_RECOGNIZED               0x000000E1
#define  CKR_TOKEN_WRITE_PROTECTED              0x000000E2

#define  CKR_UNWRAPPING_KEY_HANDLE_INVALID      0x000000F0
#define  CKR_UNWRAPPING_KEY_SIZE_RANGE          0x000000F1
#define  CKR_UNWRAPPING_KEY_TYPE_INCONSISTENT   0x000000F2

#define  CKR_USER_ALREADY_LOGGED_IN             0x00000100
#define  CKR_USER_NOT_LOGGED_IN                 0x00000101
#define  CKR_USER_PIN_NOT_INITIALIZED           0x00000102
#define  CKR_USER_TYPE_INVALID                  0x00000103
#define  CKR_USER_ANOTHER_ALREADY_LOGGED_IN     0x00000104      /* new for v2.01 */
#define  CKR_USER_TOO_MANY_TYPES                0x00000105      /* new for v2.01 */

#define  CKR_WRAPPED_KEY_INVALID                0x00000110
#define  CKR_WRAPPED_KEY_LEN_RANGE              0x00000112
#define  CKR_WRAPPING_KEY_HANDLE_INVALID        0x00000113
#define  CKR_WRAPPING_KEY_SIZE_RANGE            0x00000114
#define  CKR_WRAPPING_KEY_TYPE_INCONSISTENT     0x00000115

#define  CKR_RANDOM_SEED_NOT_SUPPORTED          0x00000120
#define  CKR_RANDOM_NO_RNG                      0x00000121      /* new for v2.0  */

#define  CKR_DOMAIN_PARAMS_INVALID              0x00000130      /* new for v2.11 */

#define  CKR_BUFFER_TOO_SMALL                   0x00000150

#define  CKR_SAVED_STATE_INVALID                0x00000160

#define  CKR_INFORMATION_SENSITIVE              0x00000170

#define  CKR_STATE_UNSAVEABLE                   0x00000180

#define  CKR_CRYPTOKI_NOT_INITIALIZED           0x00000190      /* new for v2.01 */
#define  CKR_CRYPTOKI_ALREADY_INITIALIZED       0x00000191      /* new for v2.01 */

#define  CKR_MUTEX_BAD                          0x000001A0
#define  CKR_MUTEX_NOT_LOCKED                   0x000001A1

#define  CKR_VENDOR_DEFINED                     0x80000000
#define  CKR_LSM_CONFIG_ERROR                   (CKR_VENDOR_DEFINED | 0x00000001)
#define  CKR_LSM_CONNECT_ERROR                  (CKR_VENDOR_DEFINED | 0x00000002)

#define  CKR_LSM_ILLEGAL_SLOT                   (CKR_VENDOR_DEFINED | 0x00000003)

/**/
/*---------------------------------------------------------------------*
                              <<< Types >>>
 *---------------------------------------------------------------------*/

typedef unsigned int            uint_32;
typedef int                     int_32;

typedef unsigned char           CK_BYTE;                /* unsigned 8-bit value                    */
typedef CK_BYTE                 CK_CHAR;                /* unsigned 8-bit character                */
typedef CK_BYTE                 CK_UTF8CHAR;            /* 8-bit UTF-8 character                   */
typedef CK_BYTE                 CK_BBOOL;               /* BYTE-sized Boolean flag                 */
typedef unsigned long int       CK_ULONG;               /* unsigned value, at least 32 bits long   */
typedef long int                CK_LONG;                /* signed value, same size as CK_ULONG     */
typedef CK_ULONG                CK_FLAGS;               /* at least 32 bits; each bit is a Boolean */

typedef CK_BYTE     CK_PTR      CK_BYTE_PTR;
typedef CK_CHAR     CK_PTR      CK_CHAR_PTR;
typedef CK_UTF8CHAR CK_PTR      CK_UTF8CHAR_PTR;
typedef CK_ULONG    CK_PTR      CK_ULONG_PTR;
typedef void        CK_PTR      CK_VOID_PTR;
typedef CK_VOID_PTR CK_PTR      CK_VOID_PTR_PTR;        /* ptr CK_VOID_PTR i.e. ptr ptr void       */

typedef CK_ULONG                CK_RV;
typedef CK_ULONG                CK_SLOT_ID;
typedef CK_ULONG                CK_NOTIFICATION;
typedef CK_ULONG                CK_USER_TYPE;

typedef CK_ULONG                CK_OBJECT_HANDLE;
typedef CK_OBJECT_HANDLE CK_PTR CK_OBJECT_HANDLE_PTR;

/*------------------------------------------------------*
        CK_SESSION_HANDLE is session identifier
 *------------------------------------------------------*/

typedef CK_ULONG                 CK_SESSION_HANDLE;
typedef CK_SESSION_HANDLE CK_PTR CK_SESSION_HANDLE_PTR;

/*
        flags: bit flags that provide capabilities of the session
*/

#define  CKF_RW_SESSION                         0x00000002      /* session is r/w */
#define  CKF_SERIAL_SESSION                     0x00000004      /* no parallel    */

/* user types */

#define CKU_SO                          0       /* Security Officer */
#define CKU_USER                        1       /* Normal user      */

/*------------------------------------------------------*
        CK_OBJECT_CLASS identifies the types of objects
 *------------------------------------------------------*/

typedef CK_ULONG                CK_OBJECT_CLASS;
typedef CK_OBJECT_CLASS CK_PTR  CK_OBJECT_CLASS_PTR;

/*------------------------------------------------------*
        OBJECT types
 *------------------------------------------------------*/

#define  CKO_DATA                               0x00000000
#define  CKO_CERTIFICATE                        0x00000001
#define  CKO_PUBLIC_KEY                         0x00000002
#define  CKO_PRIVATE_KEY                        0x00000003
#define  CKO_SECRET_KEY                         0x00000004
#define  CKO_HW_FEATURE                         0x00000005
#define  CKO_DOMAIN_PARAMETERS                  0x00000006
#define  CKO_VENDOR_DEFINED                     0x80000000

/*------------------------------------------------------*
        CK_KEY_TYPE identifies a key type
 *------------------------------------------------------*/

typedef CK_ULONG                CK_KEY_TYPE;

#define  CKK_RSA                                	0x00000000
#define  CKK_DSA                                	0x00000001
#define  CKK_DH                                 	0x00000002
#define  CKK_ECDSA                              	0x00000003
#define  CKK_EC                                 	0x00000003
#define  CKK_X9_42_DH                           	0x00000004
#define  CKK_KEA                                	0x00000005
#define  CKK_GENERIC_SECRET                     	0x00000010
#define  CKK_RC2                                	0x00000011
#define  CKK_RC4                                	0x00000012
#define  CKK_DES                                	0x00000013
#define  CKK_DES2                               	0x00000014
#define  CKK_DES3                               	0x00000015
#define  CKK_CAST                               	0x00000016
#define  CKK_CAST3                              	0x00000017
#define  CKK_CAST5                              	0x00000018
#define  CKK_CAST128                            	0x00000018      /* CAST128=CAST5 */
#define  CKK_RC5                                	0x00000019
#define  CKK_IDEA                               	0x0000001A
#define  CKK_SKIPJACK                           	0x0000001B
#define  CKK_BATON                              	0x0000001C
#define  CKK_JUNIPER                            	0x0000001D
#define  CKK_CDMF                               	0x0000001E
#define  CKK_AES                                	0x0000001F
#define  CKK_BELT                               	0x00000020	//-----------------
#define  CKK_GOST                               	0x00000021	//-----------------
#define  CKK_STB_11762_99_PRE_SIGN			0x00000022	//-----------------
#define  CKK_STB_P_34_101_45_2011_BIGN_WITH_HBELT	0x00000023	//-----------------
#define  CKK_VENDOR_DEFINED                     	0x80000000

/*------------------------------------------------------*
        CK_ATTRIBUTE_TYPE identifies an attribute type
 *------------------------------------------------------*/

typedef CK_ULONG                CK_ATTRIBUTE_TYPE;

#define  CKA_CLASS                              0x00000000
#define  CKA_TOKEN                              0x00000001
#define  CKA_PRIVATE                            0x00000002
#define  CKA_LABEL                              0x00000003
#define  CKA_APPLICATION                        0x00000010
#define  CKA_VALUE                              0x00000011
#define  CKA_OBJECT_ID                          0x00000012
#define  CKA_CERTIFICATE_TYPE                   0x00000080
#define  CKA_ISSUER                             0x00000081
#define  CKA_SERIAL_NUMBER                      0x00000082
#define  CKA_AC_ISSUER                          0x00000083
#define  CKA_OWNER                              0x00000084
#define  CKA_ATTR_TYPES                         0x00000085
#define  CKA_TRUSTED                            0x00000086
#define  CKA_KEY_TYPE                           0x00000100
#define  CKA_SUBJECT                            0x00000101
#define  CKA_ID                                 0x00000102
#define  CKA_SENSITIVE                          0x00000103
#define  CKA_ENCRYPT                            0x00000104
#define  CKA_DECRYPT                            0x00000105
#define  CKA_WRAP                               0x00000106
#define  CKA_UNWRAP                             0x00000107
#define  CKA_SIGN                               0x00000108
#define  CKA_SIGN_RECOVER                       0x00000109
#define  CKA_VERIFY                             0x0000010A
#define  CKA_VERIFY_RECOVER                     0x0000010B
#define  CKA_DERIVE                             0x0000010C
#define  CKA_START_DATE                         0x00000110
#define  CKA_END_DATE                           0x00000111
#define  CKA_MODULUS                            0x00000120
#define  CKA_MODULUS_BITS                       0x00000121
#define  CKA_PUBLIC_EXPONENT                    0x00000122
#define  CKA_PRIVATE_EXPONENT                   0x00000123
#define  CKA_PRIME_1                            0x00000124
#define  CKA_PRIME_2                            0x00000125
#define  CKA_EXPONENT_1                         0x00000126
#define  CKA_EXPONENT_2                         0x00000127
#define  CKA_COEFFICIENT                        0x00000128
#define  CKA_PRIME                              0x00000130
#define  CKA_SUBPRIME                           0x00000131
#define  CKA_BASE                               0x00000132
#define  CKA_PRIME_BITS                         0x00000133
#define  CKA_SUBPRIME_BITS                      0x00000134
#define  CKA_VALUE_BITS                         0x00000160
#define  CKA_VALUE_LEN                          0x00000161
#define  CKA_EXTRACTABLE                        0x00000162
#define  CKA_LOCAL                              0x00000163
#define  CKA_NEVER_EXTRACTABLE                  0x00000164
#define  CKA_ALWAYS_SENSITIVE                   0x00000165
#define  CKA_KEY_GEN_MECHANISM                  0x00000166
#define  CKA_MODIFIABLE                         0x00000170
#define  CKA_ECDSA_PARAMS                       0x00000180
#define  CKA_EC_PARAMS                          0x00000180
#define  CKA_EC_POINT                           0x00000181
#define  CKA_SECONDARY_AUTH                     0x00000200
#define  CKA_AUTH_PIN_FLAGS                     0x00000201
#define  CKA_HW_FEATURE_TYPE                    0x00000300
#define  CKA_RESET_ON_INIT                      0x00000301
#define  CKA_HAS_RESET                          0x00000302
#define  CKA_VENDOR_DEFINED                     0x80000000

/*------------------------------------------------------*
        CK_ATTRIBUTE provides info about an attribute
 *------------------------------------------------------*/

struct CK_ATTRIBUTE
{
        CK_ATTRIBUTE_TYPE       type;
        CK_VOID_PTR             pValue;
        CK_ULONG                ulValueLen;     /* in bytes */
};
typedef struct CK_ATTRIBUTE     CK_ATTRIBUTE;
typedef CK_ATTRIBUTE CK_PTR     CK_ATTRIBUTE_PTR;

/*------------------------------------------------------*
        CK_VERSION
 *------------------------------------------------------*/

struct s_CK_VERSION
{
        unsigned char           major;                  /* integer portion of version number  */
        unsigned char           minor;                  /* 1/100ths portion of version number */
};
typedef struct s_CK_VERSION     t_CK_VERSION;
typedef struct s_CK_VERSION     CK_VERSION;
typedef CK_VERSION CK_PTR       CK_VERSION_PTR;

/*------------------------------------------------------*
        CK_TOKEN_INFO provides information about a token
 *------------------------------------------------------*/

struct s_CK_TOKEN_INFO
{
        unsigned char           label[32];              /* blank padded         */
        unsigned char           manufacturerID[32];     /* blank padded         */
        unsigned char           model[16];              /* blank padded         */
        unsigned char           serialNumber[16];       /* blank padded         */
        unsigned long           flags;                  /* see below            */
        unsigned long           ulMaxSessionCount;      /* max open sessions    */
        unsigned long           ulSessionCount;         /* sess. now open       */
        unsigned long           ulMaxRwSessionCount;    /* max R/W sessions     */
        unsigned long           ulRwSessionCount;       /* R/W sess. now open   */
        unsigned long           ulMaxPinLen;            /* in bytes             */
        unsigned long           ulMinPinLen;            /* in bytes             */
        unsigned long           ulTotalPublicMemory;    /* in bytes             */
        unsigned long           ulFreePublicMemory;     /* in bytes             */
        unsigned long           ulTotalPrivateMemory;   /* in bytes             */
        unsigned long           ulFreePrivateMemory;    /* in bytes             */
        t_CK_VERSION            hardwareVersion;        /* version of hardware  */
        t_CK_VERSION            firmwareVersion;        /* version of firmware  */
        unsigned char           utcTime[16];            /* time                 */
};
typedef struct s_CK_TOKEN_INFO  t_CK_TOKEN_INFO;
typedef struct s_CK_TOKEN_INFO  CK_TOKEN_INFO;
typedef CK_TOKEN_INFO CK_PTR    CK_TOKEN_INFO_PTR;

/*------------------------------------------------------*
        CK_MECHANISM_TYPE identifies a mechanism type
 *------------------------------------------------------*/

typedef CK_ULONG                 CK_MECHANISM_TYPE;
typedef CK_MECHANISM_TYPE CK_PTR CK_MECHANISM_TYPE_PTR;

//Поддерживаемые механизмы

#define  CKM_RSA_PKCS_KEY_PAIR_GEN              0x00000000
#define  CKM_RSA_PKCS                           0x00000001
#define  CKM_RSA_9796                           0x00000002
#define  CKM_RSA_X_509                          0x00000003
#define  CKM_MD2_RSA_PKCS                       0x00000004
#define  CKM_MD5_RSA_PKCS                       0x00000005
#define  CKM_SHA1_RSA_PKCS                      0x00000006
#define  CKM_RIPEMD128_RSA_PKCS                 0x00000007
#define  CKM_RIPEMD160_RSA_PKCS                 0x00000008
#define  CKM_RSA_PKCS_OAEP                      0x00000009
#define  CKM_RSA_X9_31_KEY_PAIR_GEN             0x0000000A
#define  CKM_RSA_X9_31                          0x0000000B
#define  CKM_SHA1_RSA_X9_31                     0x0000000C
#define  CKM_RSA_PKCS_PSS                       0x0000000D
#define  CKM_SHA1_RSA_PKCS_PSS                  0x0000000E
#define  CKM_DSA_KEY_PAIR_GEN                   0x00000010
#define  CKM_DSA                                0x00000011
#define  CKM_DSA_SHA1                           0x00000012
#define  CKM_DH_PKCS_KEY_PAIR_GEN               0x00000020
#define  CKM_DH_PKCS_DERIVE                     0x00000021
#define  CKM_X9_42_DH_KEY_PAIR_GEN              0x00000030
#define  CKM_X9_42_DH_DERIVE                    0x00000031
#define  CKM_X9_42_DH_HYBRID_DERIVE             0x00000032
#define  CKM_X9_42_MQV_DERIVE                   0x00000033
#define  CKM_SHA256_RSA_PKCS_PSS                0x00000043
#define  CKM_RC2_KEY_GEN                        0x00000100
#define  CKM_RC2_ECB                            0x00000101
#define  CKM_RC2_CBC                            0x00000102
#define  CKM_RC2_MAC                            0x00000103
#define  CKM_RC2_MAC_GENERAL                    0x00000104
#define  CKM_RC2_CBC_PAD                        0x00000105
#define  CKM_RC4_KEY_GEN                        0x00000110
#define  CKM_RC4                                0x00000111
#define  CKM_DES_KEY_GEN                        0x00000120
#define  CKM_DES_ECB                            0x00000121
#define  CKM_DES_CBC                            0x00000122
#define  CKM_DES_MAC                            0x00000123
#define  CKM_DES_MAC_GENERAL                    0x00000124
#define  CKM_DES_CBC_PAD                        0x00000125
#define  CKM_DES2_KEY_GEN                       0x00000130
#define  CKM_DES3_KEY_GEN                       0x00000131
#define  CKM_DES3_ECB                           0x00000132
#define  CKM_DES3_CBC                           0x00000133
#define  CKM_DES3_MAC                           0x00000134
#define  CKM_DES3_MAC_GENERAL                   0x00000135
#define  CKM_DES3_CBC_PAD                       0x00000136
#define  CKM_CDMF_KEY_GEN                       0x00000140
#define  CKM_CDMF_ECB                           0x00000141
#define  CKM_CDMF_CBC                           0x00000142
#define  CKM_CDMF_MAC                           0x00000143
#define  CKM_CDMF_MAC_GENERAL                   0x00000144
#define  CKM_CDMF_CBC_PAD                       0x00000145
#define  CKM_MD2                                0x00000200
#define  CKM_MD2_HMAC                           0x00000201
#define  CKM_MD2_HMAC_GENERAL                   0x00000202
#define  CKM_MD5                                0x00000210
#define  CKM_MD5_HMAC                           0x00000211
#define  CKM_MD5_HMAC_GENERAL                   0x00000212
#define  CKM_SHA_1                              0x00000220
#define  CKM_SHA_1_HMAC                         0x00000221
#define  CKM_SHA_1_HMAC_GENERAL                 0x00000222
#define  CKM_RIPEMD128                          0x00000230
#define  CKM_RIPEMD128_HMAC                     0x00000231
#define  CKM_RIPEMD128_HMAC_GENERAL             0x00000232
#define  CKM_RIPEMD160                          0x00000240
#define  CKM_RIPEMD160_HMAC                     0x00000241
#define  CKM_RIPEMD160_HMAC_GENERAL             0x00000242
#define  CKM_SHA256                             0x00000250
#define  CKM_SHA256_HMAC                        0x00000251
#define  CKM_SHA256_HMAC_GENERAL                0x00000252
#define  CKM_CAST_KEY_GEN                       0x00000300
#define  CKM_CAST_ECB                           0x00000301
#define  CKM_CAST_CBC                           0x00000302
#define  CKM_CAST_MAC                           0x00000303
#define  CKM_CAST_MAC_GENERAL                   0x00000304
#define  CKM_CAST_CBC_PAD                       0x00000305
#define  CKM_CAST3_KEY_GEN                      0x00000310
#define  CKM_CAST3_ECB                          0x00000311
#define  CKM_CAST3_CBC                          0x00000312
#define  CKM_CAST3_MAC                          0x00000313
#define  CKM_CAST3_MAC_GENERAL                  0x00000314
#define  CKM_CAST3_CBC_PAD                      0x00000315
#define  CKM_CAST5_KEY_GEN                      0x00000320
#define  CKM_CAST128_KEY_GEN                    0x00000320
#define  CKM_CAST5_ECB                          0x00000321
#define  CKM_CAST128_ECB                        0x00000321
#define  CKM_CAST5_CBC                          0x00000322
#define  CKM_CAST128_CBC                        0x00000322
#define  CKM_CAST5_MAC                          0x00000323
#define  CKM_CAST128_MAC                        0x00000323
#define  CKM_CAST5_MAC_GENERAL                  0x00000324
#define  CKM_CAST128_MAC_GENERAL                0x00000324
#define  CKM_CAST5_CBC_PAD                      0x00000325
#define  CKM_CAST128_CBC_PAD                    0x00000325
#define  CKM_RC5_KEY_GEN                        0x00000330
#define  CKM_RC5_ECB                            0x00000331
#define  CKM_RC5_CBC                            0x00000332
#define  CKM_RC5_MAC                            0x00000333
#define  CKM_RC5_MAC_GENERAL                    0x00000334
#define  CKM_RC5_CBC_PAD                        0x00000335
#define  CKM_IDEA_KEY_GEN                       0x00000340
#define  CKM_IDEA_ECB                           0x00000341
#define  CKM_IDEA_CBC                           0x00000342
#define  CKM_IDEA_MAC                           0x00000343
#define  CKM_IDEA_MAC_GENERAL                   0x00000344
#define  CKM_IDEA_CBC_PAD                       0x00000345
#define  CKM_GENERIC_SECRET_KEY_GEN             0x00000350
#define  CKM_CONCATENATE_BASE_AND_KEY           0x00000360
#define  CKM_CONCATENATE_BASE_AND_DATA          0x00000362
#define  CKM_CONCATENATE_DATA_AND_BASE          0x00000363
#define  CKM_XOR_BASE_AND_DATA                  0x00000364
#define  CKM_EXTRACT_KEY_FROM_KEY               0x00000365
#define  CKM_SSL3_PRE_MASTER_KEY_GEN            0x00000370
#define  CKM_SSL3_MASTER_KEY_DERIVE             0x00000371
#define  CKM_SSL3_KEY_AND_MAC_DERIVE            0x00000372
#define  CKM_SSL3_MASTER_KEY_DERIVE_DH          0x00000373
#define  CKM_TLS_PRE_MASTER_KEY_GEN             0x00000374
#define  CKM_TLS_MASTER_KEY_DERIVE              0x00000375
#define  CKM_TLS_KEY_AND_MAC_DERIVE             0x00000376
#define  CKM_TLS_MASTER_KEY_DERIVE_DH           0x00000377
#define  CKM_SSL3_MD5_MAC                       0x00000380
#define  CKM_SSL3_SHA1_MAC                      0x00000381
#define  CKM_MD5_KEY_DERIVATION                 0x00000390
#define  CKM_MD2_KEY_DERIVATION                 0x00000391
#define  CKM_SHA1_KEY_DERIVATION                0x00000392
#define  CKM_SHA256_KEY_DERIVATION              0x00000393
#define  CKM_PBE_MD2_DES_CBC                    0x000003A0
#define  CKM_PBE_MD5_DES_CBC                    0x000003A1
#define  CKM_PBE_MD5_CAST_CBC                   0x000003A2
#define  CKM_PBE_MD5_CAST3_CBC                  0x000003A3
#define  CKM_PBE_MD5_CAST5_CBC                  0x000003A4
#define  CKM_PBE_MD5_CAST128_CBC                0x000003A4
#define  CKM_PBE_SHA1_CAST5_CBC                 0x000003A5
#define  CKM_PBE_SHA1_CAST128_CBC               0x000003A5
#define  CKM_PBE_SHA1_RC4_128                   0x000003A6
#define  CKM_PBE_SHA1_RC4_40                    0x000003A7
#define  CKM_PBE_SHA1_DES3_EDE_CBC              0x000003A8
#define  CKM_PBE_SHA1_DES2_EDE_CBC              0x000003A9
#define  CKM_PBE_SHA1_RC2_128_CBC               0x000003AA
#define  CKM_PBE_SHA1_RC2_40_CBC                0x000003AB
#define  CKM_PKCS5_PBKD2                        0x000003B0
#define  CKM_PBA_SHA1_WITH_SHA1_HMAC            0x000003C0
#define  CKM_KEY_WRAP_LYNKS                     0x00000400
#define  CKM_KEY_WRAP_SET_OAEP                  0x00000401
#define  CKM_SKIPJACK_KEY_GEN                   0x00001000
#define  CKM_SKIPJACK_ECB64                     0x00001001
#define  CKM_SKIPJACK_CBC64                     0x00001002
#define  CKM_SKIPJACK_OFB64                     0x00001003
#define  CKM_SKIPJACK_CFB64                     0x00001004
#define  CKM_SKIPJACK_CFB32                     0x00001005
#define  CKM_SKIPJACK_CFB16                     0x00001006
#define  CKM_SKIPJACK_CFB8                      0x00001007
#define  CKM_SKIPJACK_WRAP                      0x00001008
#define  CKM_SKIPJACK_PRIVATE_WRAP              0x00001009
#define  CKM_SKIPJACK_RELAYX                    0x0000100a
#define  CKM_KEA_KEY_PAIR_GEN                   0x00001010
#define  CKM_KEA_KEY_DERIVE                     0x00001011
#define  CKM_FORTEZZA_TIMESTAMP                 0x00001020
#define  CKM_BATON_KEY_GEN                      0x00001030
#define  CKM_BATON_ECB128                       0x00001031
#define  CKM_BATON_ECB96                        0x00001032
#define  CKM_BATON_CBC128                       0x00001033
#define  CKM_BATON_COUNTER                      0x00001034
#define  CKM_BATON_SHUFFLE                      0x00001035
#define  CKM_BATON_WRAP                         0x00001036
#define  CKM_ECDSA_KEY_PAIR_GEN                 0x00001040
#define  CKM_EC_KEY_PAIR_GEN                    0x00001040
#define  CKM_ECDSA                              0x00001041
#define  CKM_ECDSA_SHA1                         0x00001042
#define  CKM_ECDH1_DERIVE                       0x00001050
#define  CKM_ECDH1_COFACTOR_DERIVE              0x00001051
#define  CKM_ECMQV_DERIVE                       0x00001052
#define  CKM_JUNIPER_KEY_GEN                    0x00001060
#define  CKM_JUNIPER_ECB128                     0x00001061
#define  CKM_JUNIPER_CBC128                     0x00001062
#define  CKM_JUNIPER_COUNTER                    0x00001063
#define  CKM_JUNIPER_SHUFFLE                    0x00001064
#define  CKM_JUNIPER_WRAP                       0x00001065
#define  CKM_FASTHASH                           0x00001070
#define  CKM_AES_KEY_GEN                        0x00001080
#define  CKM_AES_ECB                            0x00001081
#define  CKM_AES_CBC                            0x00001082
#define  CKM_AES_MAC                            0x00001083
#define  CKM_AES_MAC_GENERAL                    0x00001084
#define  CKM_AES_CBC_PAD                        0x00001085
#define  CKM_DSA_PARAMETER_GEN                  0x00002000
#define  CKM_DH_PKCS_PARAMETER_GEN              0x00002001
#define  CKM_X9_42_DH_PARAMETER_GEN             0x00002002
#define  CKM_VENDOR_DEFINED                     0x80000000
#define  CKM_GOST_28147_89_KEY_GEN				0x00002003
#define  CKM_GOST_28147_89_ECB					0x00002004	//
#define  CKM_GOST_28147_89_OFB					0x00002005	//
#define  CKM_GOST_28147_89_CFB					0x00002006	//
#define  CKM_GOST_28147_89_MAC					0x00002007	//
#define  CKM_STB11761_99_HASH					0x00002008
#define  CKM_STB11762_99_KEY_PAIR_GEN				0x00002009
#define  CKM_STB11762_99_SIGN					0x0000200A
#define  CKM_STB_34_101_31_2011_KEY_GEN				0x0000200B
#define  CKM_STB_34_101_31_2011_BELT_ECB128			0x0000200C	//
#define  CKM_STB_34_101_31_2011_BELT_ECB192			0x0000200D	//
#define  CKM_STB_34_101_31_2011_BELT_ECB256			0x0000200E	//
#define  CKM_STB_34_101_31_2011_BELT_CBC128			0x0000200F	//
#define  CKM_STB_34_101_31_2011_BELT_CBC192			0x00002010	//
#define  CKM_STB_34_101_31_2011_BELT_CBC256			0x00002011	//
#define  CKM_STB_34_101_31_2011_BELT_CFB128			0x00002012	//
#define  CKM_STB_34_101_31_2011_BELT_CFB192			0x00002013	//
#define  CKM_STB_34_101_31_2011_BELT_CFB256			0x00002014	//
#define  CKM_STB_34_101_31_2011_BELT_CTR128			0x00002015	//
#define  CKM_STB_34_101_31_2011_BELT_CTR192			0x00002016	//
#define  CKM_STB_34_101_31_2011_BELT_CTR256			0x00002017	//
#define  CKM_STB_34_101_31_2011_BELT_MAC128			0x00002018	//
#define  CKM_STB_34_101_31_2011_BELT_MAC192			0x00002019	//
#define  CKM_STB_34_101_31_2011_BELT_MAC256			0x0000201A	//
#define  CKM_STB_34_101_31_2011_BELT_DATAWRAP128		0x0000201B	//
#define  CKM_STB_34_101_31_2011_BELT_DATAWRAP192		0x0000201C	//
#define  CKM_STB_34_101_31_2011_BELT_DATAWRAP256		0x0000201D	//
#define  CKM_STB_34_101_31_2011_BELT_KEWWRAP128			0x0000201E	//
#define  CKM_STB_34_101_31_2011_BELT_KEWWRAP192			0x0000201F	//
#define  CKM_STB_34_101_31_2011_BELT_KEWWRAP256			0x00002020	//
#define  CKM_STB_34_101_31_2011_BELT_HASH256			0x00002021
#define  CKM_BELT_HASH_STB11762_99_KEY_PAIR_GEN			0x00002022
#define  CKM_STB_11762_99_PRE_SIGN				0x00002023
#define  CKM_STB_P_34_101_45_2011_BIGN_GENKEYPAIR		0x00002024
#define  CKM_STB_P_34_101_45_2011_BIGN_WITH_HBELT		0x00002025
#define  CKM_HASH256_STB_P_34_101_45_2011_BIGN_GENKEYPAIR	0x00002026
#define  CKM_HASH256_STB_P_34_101_45_2011_BIGN_WITH_HBELT	0x00002027
#define  CKM_STB_34_101_47_2012_HMAC_HBELT			0x00002028
#define  CKM_STB_34_101_47_2012_BRNG_CTR_HBELT			0x00002029
#define  CKM_STB_34_101_47_2012_BRNG_HMAC_HBELT			0x0000202A
#define  CKM_STB_34_101_47_2012_BRNG_CTR_STB11761		0x0000202B



#define	stb11762_sign						0x010000
#define	stb11762pre_sign					0x010001
#define	bign_with_hbelt						0x010002

/*------------------------------------------------------*
        CK_MECHANISM provides info about a mechanism
 *------------------------------------------------------*/

struct CK_MECHANISM
{
        CK_MECHANISM_TYPE       mechanism;
        CK_VOID_PTR             pParameter;
        CK_ULONG                ulParameterLen; /* in bytes */
};
typedef struct CK_MECHANISM     CK_MECHANISM;
typedef CK_MECHANISM CK_PTR     CK_MECHANISM_PTR;

/*
        CK_FUNCTION_LIST is a structure holding a Cryptoki spec
        version and pointers of appropriate types to all the
        Cryptoki functions.
*/

typedef struct CK_FUNCTION_LIST         CK_FUNCTION_LIST;

typedef CK_FUNCTION_LIST CK_PTR         CK_FUNCTION_LIST_PTR;

typedef CK_FUNCTION_LIST_PTR CK_PTR     CK_FUNCTION_LIST_PTR_PTR;

typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_Initialize)       (CK_VOID_PTR pReserved);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_Finalize)         (CK_VOID_PTR pReserved);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_Terminate)        (void);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_GetFunctionList)  (CK_FUNCTION_LIST_PTR_PTR ppFunctionList);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_GetTokenInfo)     (CK_SLOT_ID slotID,
                                                         CK_TOKEN_INFO_PTR pInfo);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_OpenSession)      (CK_SLOT_ID slotID,
                                                         CK_FLAGS flags,
                                                         CK_VOID_PTR pApplication,
                                                         CK_RV (*CK_NOTIFY) (CK_SESSION_HANDLE hSession,
                                                                          CK_NOTIFICATION event,
                                                                          CK_VOID_PTR pApplication),
                                                         CK_SESSION_HANDLE_PTR phSession);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_CloseSession)     (CK_SESSION_HANDLE hSession);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_CloseAllSessions) (CK_SLOT_ID slotID);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_Login)            (CK_SESSION_HANDLE hSession,
                                                         CK_USER_TYPE userType,
                                                         CK_CHAR_PTR pPin,
                                                         CK_ULONG usPinLen);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_CreateObject)     (CK_SESSION_HANDLE hSession,
                                                         CK_ATTRIBUTE_PTR pTemplate,
                                                         CK_ULONG usCount,
                                                         CK_OBJECT_HANDLE_PTR phObject);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_CopyObject)       (CK_SESSION_HANDLE hSession,
                                                         CK_OBJECT_HANDLE hObject,
                                                         CK_ATTRIBUTE_PTR pTemplate,
                                                         CK_ULONG usCount,
                                                         CK_OBJECT_HANDLE_PTR phNewObject);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_GetAttributeValue)(CK_SESSION_HANDLE hSession,
                                                         CK_OBJECT_HANDLE hObject,
                                                         CK_ATTRIBUTE_PTR pTemplate,
                                                         CK_ULONG usCount);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_FindObjectsInit)  (CK_SESSION_HANDLE hSession,
                                                         CK_ATTRIBUTE_PTR pTemplate,
                                                         CK_ULONG usCount);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_FindObjects)      (CK_SESSION_HANDLE hSession,
                                                         CK_OBJECT_HANDLE_PTR phObject,
                                                         CK_ULONG usMaxObjectCount,
                                                         CK_ULONG_PTR pusObjectCount);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_FindObjectsFinal) (CK_SESSION_HANDLE hSession);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_EncryptInit)      (CK_SESSION_HANDLE hSession,
                                                         CK_MECHANISM_PTR pMechanism,
                                                         CK_OBJECT_HANDLE hKey);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_Encrypt)          (CK_SESSION_HANDLE hSession,
                                                         CK_BYTE_PTR pData,
                                                         CK_ULONG usDataLen,
                                                         CK_BYTE_PTR pEncryptedData,
                                                         CK_ULONG_PTR pusEncryptedDataLen);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_DecryptInit)      (CK_SESSION_HANDLE hSession,
                                                         CK_MECHANISM_PTR pMechanism,
                                                         CK_OBJECT_HANDLE hKey);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_Decrypt)          (CK_SESSION_HANDLE hSession,
                                                         CK_BYTE_PTR pEncryptedData,
                                                         CK_ULONG usEncryptedDataLen,
                                                         CK_BYTE_PTR pData,
                                                         CK_ULONG_PTR pusDataLen);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_DigestInit)       (CK_SESSION_HANDLE hSession,
                                                         CK_MECHANISM_PTR pMechanism);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_Digest)           (CK_SESSION_HANDLE hSession,
                                                         CK_BYTE_PTR pData,
                                                         CK_ULONG usDataLen,
                                                         CK_BYTE_PTR pDigest,
                                                         CK_ULONG_PTR pusDigestLen);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_SignInit)         (CK_SESSION_HANDLE hSession,
                                                         CK_MECHANISM_PTR pMechanism,
                                                         CK_OBJECT_HANDLE hKey);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_Sign)             (CK_SESSION_HANDLE hSession,
                                                         CK_BYTE_PTR pData,
                                                         CK_ULONG usDataLen,
                                                         CK_BYTE_PTR pSignature,
                                                         CK_ULONG_PTR pusSignatureLen);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_VerifyInit)       (CK_SESSION_HANDLE hSession,
                                                         CK_MECHANISM_PTR pMechanism,
                                                         CK_OBJECT_HANDLE hKey);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_Verify)           (CK_SESSION_HANDLE hSession,
                                                         CK_BYTE_PTR pData,
                                                         CK_ULONG usDataLen,
                                                         CK_BYTE_PTR pSignature,
                                                         CK_ULONG usSignatureLen);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_C_GenerateRandom)   (CK_SESSION_HANDLE hSession,
                                                         CK_BYTE_PTR pRandomData,
                                                         CK_ULONG usRandomLen);
typedef CK_RV CK_ENTRY  (CK_PTR  CK_NOTIFY)             (CK_SESSION_HANDLE hSession,
                                                         CK_NOTIFICATION event,
                                                         CK_VOID_PTR pApplication);

struct CK_FUNCTION_LIST
{
        CK_VERSION                      version;
        CK_C_Initialize                 C_Initialize;
        CK_C_Finalize                   C_Finalize;
        CK_C_GetFunctionList            C_GetFunctionList;
        CK_C_GetTokenInfo               C_GetTokenInfo;
        CK_C_OpenSession                C_OpenSession;
        CK_C_CloseSession               C_CloseSession;
        CK_C_CloseAllSessions           C_CloseAllSessions;
        CK_C_Login                      C_Login;
        CK_C_CreateObject               C_CreateObject;
        CK_C_CopyObject                 C_CopyObject;
        CK_C_GetAttributeValue          C_GetAttributeValue;
        CK_C_FindObjectsInit            C_FindObjectsInit;
        CK_C_FindObjects                C_FindObjects;
        CK_C_FindObjectsFinal           C_FindObjectsFinal;
        CK_C_EncryptInit                C_EncryptInit;
        CK_C_Encrypt                    C_Encrypt;
        CK_C_DecryptInit                C_DecryptInit;
        CK_C_Decrypt                    C_Decrypt;
        CK_C_DigestInit                 C_DigestInit;
        CK_C_Digest                     C_Digest;
        CK_C_SignInit                   C_SignInit;
        CK_C_Sign                       C_Sign;
        CK_C_VerifyInit                 C_VerifyInit;
        CK_C_Verify                     C_Verify;
        CK_C_GenerateRandom             C_GenerateRandom;
};

/**/
/*---------------------------------------------------------------------*
                    <<< PKCS11 actual procedures >>>
 *---------------------------------------------------------------------*/

CK_RV CK_ENTRY C_CloseAllSessions       (CK_SLOT_ID);
CK_RV CK_ENTRY C_CloseSession           (CK_SESSION_HANDLE);
CK_RV CK_ENTRY C_CopyObject             (CK_SESSION_HANDLE, CK_OBJECT_HANDLE, CK_ATTRIBUTE_PTR, CK_ULONG, CK_OBJECT_HANDLE_PTR);
CK_RV CK_ENTRY C_CreateObject           (CK_SESSION_HANDLE, CK_ATTRIBUTE_PTR, CK_ULONG, CK_OBJECT_HANDLE_PTR);
CK_RV CK_ENTRY C_Decrypt                (CK_SESSION_HANDLE, CK_BYTE_PTR, CK_ULONG, CK_BYTE_PTR, CK_ULONG_PTR);
CK_RV CK_ENTRY C_DecryptInit            (CK_SESSION_HANDLE, CK_MECHANISM_PTR, CK_OBJECT_HANDLE);
CK_RV CK_ENTRY C_DestroyObject          (CK_SESSION_HANDLE, CK_OBJECT_HANDLE);
CK_RV CK_ENTRY C_Digest                 (CK_SESSION_HANDLE, CK_BYTE_PTR, CK_ULONG, CK_BYTE_PTR, CK_ULONG_PTR);
CK_RV CK_ENTRY C_DigestInit             (CK_SESSION_HANDLE, CK_MECHANISM_PTR);
CK_RV CK_ENTRY C_Encrypt                (CK_SESSION_HANDLE, CK_BYTE_PTR, CK_ULONG, CK_BYTE_PTR, CK_ULONG_PTR);
CK_RV CK_ENTRY C_EncryptInit            (CK_SESSION_HANDLE, CK_MECHANISM_PTR, CK_OBJECT_HANDLE);
CK_RV CK_ENTRY C_Finalize               (CK_VOID_PTR);
CK_RV CK_ENTRY C_FindObjects            (CK_SESSION_HANDLE, CK_OBJECT_HANDLE_PTR, CK_ULONG, CK_ULONG_PTR);
CK_RV CK_ENTRY C_FindObjectsFinal       (CK_SESSION_HANDLE);
CK_RV CK_ENTRY C_FindObjectsInit        (CK_SESSION_HANDLE, CK_ATTRIBUTE_PTR, CK_ULONG);
CK_RV CK_ENTRY C_GenerateRandom         (CK_SESSION_HANDLE, CK_BYTE_PTR, CK_ULONG);
CK_RV CK_ENTRY C_GetAttributeValue      (CK_SESSION_HANDLE, CK_OBJECT_HANDLE, CK_ATTRIBUTE_PTR, CK_ULONG);
CK_RV CK_ENTRY C_GetFunctionList        (CK_FUNCTION_LIST_PTR_PTR);
CK_RV CK_ENTRY C_GetTokenInfo           (CK_SLOT_ID, CK_TOKEN_INFO_PTR);
CK_RV CK_ENTRY C_Initialize             (CK_VOID_PTR);
CK_RV CK_ENTRY C_Login                  (CK_SESSION_HANDLE, CK_USER_TYPE, CK_CHAR_PTR, CK_ULONG);
CK_RV CK_ENTRY C_OpenSession            (CK_SLOT_ID, CK_FLAGS, CK_VOID_PTR, CK_NOTIFY, CK_SESSION_HANDLE_PTR);
CK_RV CK_ENTRY C_Sign                   (CK_SESSION_HANDLE, CK_BYTE_PTR, CK_ULONG, CK_BYTE_PTR, CK_ULONG_PTR);
CK_RV CK_ENTRY C_SignInit               (CK_SESSION_HANDLE, CK_MECHANISM_PTR, CK_OBJECT_HANDLE);
CK_RV CK_ENTRY C_Verify                 (CK_SESSION_HANDLE, CK_BYTE_PTR, CK_ULONG, CK_BYTE_PTR, CK_ULONG);
CK_RV CK_ENTRY C_VerifyInit             (CK_SESSION_HANDLE, CK_MECHANISM_PTR, CK_OBJECT_HANDLE);

#ifdef __cplusplus
}
#endif

#endif // _PKCS11TYPES_H_

/* end of pkcs11types.h */
