struct attribute
{	
	//значение
	unsigned char* pValue;
	//длина значения
	unsigned int ulValueLen;
};
//получение сертификата
//alg = 1 - 45
//alg = 0 - 76
//Resultult возвращаемый сертификат
int GetSOK( int alg, struct attribute*  Resultult, char* pPin);
//расчет хэш-значения
//   data_len - длина передаваемых данных
//   data	- данные
//   alg  - 0 - СТБ 1176.1
//	 alg  - 1 - СТБ 34.101.31
//	выходные
//	digest_len - длина хэш-значения
//  pdigest - хэш-значениу
int Hash(int data_len, char * data, int alg, unsigned int* digest_len, char * pdigest, char* pPin);
//подписание данных
//   data_len - длина передаваемых данных
//   data	- данные
//   alg  - 0 - stb11762_sign
//	 	- 1 - stb11762pre_sign
//	 	- 2 - bign_with_hbelt
//	выходные
//	len_sign - длина подписи
//  sign - значение подписи
int Sign(int data_len, char * data, int alg, unsigned int* len_sign, char * sign, char* pPin);
//проверка подписи под данными
//   data_len - длина передаваемых данных
//   data	- данные
//   alg  - 0 - stb11762_sign
//	 	- 1 - stb11762pre_sign
//	 	- 2 - bign_with_hbelt
//	len_sign - длина подписи
//  sign - значение подписи
int Verify1(int data_len, char * data, int alg, int len_sign, char * sign , char* pPin);
//проверка подписи под данными
//   data_len - длина передаваемых данных
//   data	- данные
//   alg  - 0 - stb11762_sign
//	 	- 1 - stb11762pre_sign
//	 	- 2 - bign_with_hbelt
//	len_sign - длина подписи
//  sign - значение подписи
//  lenSOK - длина буфера сертификата
//  bufSOK - сертификат
int Verify(int data_len, char * data, int alg, int len_sign, char * sign, char *bufSOK, int lenSOK, char* pPin );