#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include <string.h>
#include <Windows.h>
#include "libnkitypes.h"

/**/
/*---------------------------------------------------------------------*
                              <<< Defines >>>
 *---------------------------------------------------------------------*/

#define PKCS11_LIBRARY          "libnki.dll"

/**/
/*---------------------------------------------------------------------*
                              <<< Globals >>>
 *---------------------------------------------------------------------*/

CK_FUNCTION_LIST_PTR    FunctionList            = {0};
CK_C_GetFunctionList    GetFunctionList         = NULL;

char           CBC_IVec[]             = "Данные для подписи";


void print(CK_CHAR_PTR buf, unsigned long len)
{
	unsigned long i = 0;
	for(i = 0; i < len; i++)
		printf("%x ", buf[i]);
	printf("\n");
}

/*---------------------------------------------------------------------*
   <<< main >>>
 *---------------------------------------------------------------------*/

int main
(
        int                     ArgCount,
        char                * * ArgVect
)
{
	HMODULE P11Library;
	CK_ULONG Session = 0;
	CK_CHAR sign[1024];
	unsigned long len_sign = 1024;
	unsigned long len_dec_data = 1024;
	unsigned long len_data = 1024;

	CK_SLOT_ID              SlotId =1;
	CK_FLAGS                flags = CKF_SERIAL_SESSION;
	CK_VOID_PTR             pApplication =0;
	CK_NOTIFY               Notify =0;

	P11Library = LoadLibraryA (PKCS11_LIBRARY);
	if (P11Library == NULL)
    {
		printf ("Cannot load DLL\n");
		return 1;
    }
	GetFunctionList = (CK_C_GetFunctionList) GetProcAddress (P11Library, "C_GetFunctionList");
	if (GetFunctionList == NULL)
	{
		printf ("Cannot load GetFunctionList\n");
		FreeLibrary (P11Library);
	} 

	printf ("GetFunctionList()\n");
	GetFunctionList (&FunctionList);

	//Первой всегда вызывается функция C_Initialize
	printf ("C_Initialize()\n");
	(*FunctionList).C_Initialize (NULL);

//------------------	C_OpenSession	----------------------------------------------

	/*C_OpenSession (тип сеанса, указатель куда передавать ответ, адрес функции обратно вызова уведомления, идентификатор для нового сеанса).
	Возвращаемое значение: выходными данными является сеанс между приложением и носителем, сообщение о результате выполнения функции и код сообщения*/
	printf ("C_OpenSession()\n");
	if((*FunctionList).C_OpenSession(SlotId,flags,pApplication,Notify,&Session) != CKR_OK)
			goto END;
	printf("\tOpenSession: %d\n", Session);

//------------------	C_Login	-----------------------------------------------------

	/*C_Login (регистрация на носителе) 
	
	Возвращаемое значение: сообщение о результате выполнения функции и код сообщения*/
	printf ("C_Login()\n");
	CK_USER_TYPE            userType =CKU_USER;
 	CK_CHAR               * UserPinCodeOK = (CK_CHAR *)"123456";

	if((*FunctionList).C_Login(Session,userType,UserPinCodeOK,strlen((const char *)UserPinCodeOK)) != CKR_OK)
		goto END;
	printf("\tLogin: OK\n");



//------------------	C_GetTokenInfo	----------------------------------------------
{
	printf ("C_GetTokenInfo()\n");
	CK_TOKEN_INFO tkn_info;
	/*C_GetToken_info (получает информацию о конкретном носителе)
	Возвращаемое значение: возвращает сообщение о результате выполнения функции и код сообщения*/
	if((*FunctionList).C_GetTokenInfo(SlotId, &tkn_info) != CKR_OK)
		goto END;
	printf("\tGetTokenInfo: OK\n");
}
//------------------	C_Find	----------------------------------------------
{
	CK_OBJECT_HANDLE Object;
	unsigned long tmp;
	CK_OBJECT_CLASS ClassObject = CKO_PRIVATE_KEY;
	CK_KEY_TYPE KeyType = CKK_STB_P_34_101_45_2011_BIGN_WITH_HBELT; //CKK_STB_P_34_101_45_2011_BIGN_WITH_HBELT, CKK_STB_11762_99_PRE_SIGN;
	CK_ATTRIBUTE attr[] =
    {
		{ CKA_CLASS,		&ClassObject,	sizeof (ClassObject)	},
		{ CKA_KEY_TYPE,		&KeyType,	sizeof (KeyType)	}
	};
	//инициализирует операцию поиска объекта
	printf ("C_FindObjectsInit()\n");
	if((*FunctionList).C_FindObjectsInit(Session,attr,2) != CKR_OK)
		goto END;
	//осуществляет операцию поиска объекта
	printf ("C_FindObjects()\n");
	if((*FunctionList).C_FindObjects(Session,&Object,1,&tmp) != CKR_OK)
		goto END;
	//завершает операцию поиска объекта
	printf ("C_FindObjectsFinal()\n");
	if((*FunctionList).C_FindObjectsFinal(Session) != CKR_OK)
		goto END;
	printf("\tPRIVATE_KEY Number Object=%d\n", Object);

//------------------	C_Sign	----------------------------------------------

	//Задать используемый механизм
	CK_MECHANISM mechanism;
	mechanism.mechanism = bign_with_hbelt; //stb11762pre_sign - 1176.2 ,bign_with_hbelt -34.101.45; 

	/*C_SignInit (идентификатор сеанса, механизм подписи, идентификатор ключа).
	Возвращаемое значение: сообщение о результате выполнения функции и код сообщения*/
	printf ("C_SignInit()\n");
	if((*FunctionList).C_SignInit(Session,&mechanism,Object) != CKR_OK)
		goto END;

	/*C_Sign (идентификатор сеанса, данные, длина данных, указатель на память куда передается подпись, указатель на память ,где хранится информация о длине подписи).
	Возвращаемое значение: подпись данных, а также сообщение о результате выполнения функции и код сообщения*/
	CK_ULONG len_data = sizeof(CBC_IVec);
	printf ("C_Sign()\n");
	if((*FunctionList).C_Sign(Session,(CK_BYTE_PTR)CBC_IVec,len_data,sign,&len_sign) != CKR_OK)
		goto END;
	printf("\tSignature: ");
	print(sign, len_sign);
}
//------------------	C_Find	----------------------------------------------
{
	CK_OBJECT_HANDLE Object;
	unsigned long tmp;
	//unsigned char arr[10240];
	CK_OBJECT_CLASS ClassObject = CKO_CERTIFICATE;
	CK_KEY_TYPE KeyType = CKK_STB_P_34_101_45_2011_BIGN_WITH_HBELT; //CKK_STB_P_34_101_45_2011_BIGN_WITH_HBELT, CKK_STB_11762_99_PRE_SIGN;
	CK_ATTRIBUTE attr[] =
	{
		{ CKA_CLASS,		&ClassObject,	sizeof (ClassObject)	},
		{ CKA_KEY_TYPE,		&KeyType,	sizeof (KeyType)	}
	};
	//инициализирует операцию поиска объекта
	printf ("C_FindObjectsInit()\n");
	if((*FunctionList).C_FindObjectsInit(Session,attr,2) != CKR_OK)
		goto END;
	//продолжает операцию поиска объекта
	printf ("C_FindObjects()\n");
	if((*FunctionList).C_FindObjects(Session,&Object,1,&tmp) != CKR_OK)
		goto END;
	//завершает операцию поиска объекта
	printf ("C_FindObjectsFinal()\n");
	if((*FunctionList).C_FindObjectsFinal(Session) != CKR_OK)
		goto END;
	printf("\tCERTIFICATE Number Object=%d\n", Object);

//------------------	C_Verify	----------------------------------------------

	CK_MECHANISM mechanism;
	mechanism.mechanism = bign_with_hbelt; //stb11762pre_sign - 1176.2 ,bign_with_hbelt -34.101.45; 
	/*C_VerifyInit (идентификатор сеанса, механизм подписи, идентификатор верификационного ключа).
	Возвращаемое значение: сообщение о результате выполнения функции и код сообщения*/
	printf ("C_VerifyInit()\n");
        if((*FunctionList).C_VerifyInit(Session,&mechanism,Object) != CKR_OK)
		goto END;

	/*C_Verify (идентификатор сеанса, данные, длина данных, указатель на память куда передается память, указатель на память ,где хранится информация о длине подписи).
	Возвращаемое значение: сообщение о действительности подписи или об ошибке и код сообщения*/
	CK_ULONG len_data = sizeof(CBC_IVec);
	printf ("C_Verify()\n");
        if((*FunctionList).C_Verify(Session,(CK_BYTE_PTR)CBC_IVec,len_data,sign,len_sign) != CKR_OK)
		goto END;
	printf("\tVerify: OK\n");
}

//------------------	C_GenerateRandom	----------------------------------------
{
	CK_ULONG len_rand = 32;
	CK_BYTE rand_data[32];
	/*C_GenerateRandom (идентификатор сеанса, указатель на память куда поместить случайные данные, длина случайных данных).
	Возвращаемое значение: случайные или псевдослучайные данные, сообщение о результате выполнения функции и код сообщения*/
	printf ("C_GenerateRandom()\n");
	if((*FunctionList).C_GenerateRandom(Session,rand_data,len_rand) != CKR_OK)
		goto END;
	printf("\tRandom: ");
	print(rand_data, len_rand);
}

END:
//------------------	C_CloseSession	----------------------------------------
	/*C_CloseSession (идентификатор сеанса).
	Возвращаемое значение: возвращает регистрационное состояние носителя по отношению к данному приложению в "открытые сеансы", сообщение о результате выполнения функции и код сообщения*/
	printf ("C_CloseSession()\n");
	if((*FunctionList).C_CloseSession(Session) != CKR_OK)
		return 1;
	printf("\tCloseSession: OK\n");

        printf ("C_Finalize(NULL)\n");
	//В конце всегда вызывается функция C_Finalize
        (*FunctionList).C_Finalize (NULL);

        printf ("Press Enter to exit...");
        getchar ();

        exit (0);
}
/**/
