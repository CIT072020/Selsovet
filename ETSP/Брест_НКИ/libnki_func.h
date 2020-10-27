struct attribute
{	
	//��������
	unsigned char* pValue;
	//����� ��������
	unsigned int ulValueLen;
};
//��������� �����������
//alg = 1 - 45
//alg = 0 - 76
//Resultult ������������ ����������
int GetSOK( int alg, struct attribute*  Resultult, char* pPin);
//������ ���-��������
//   data_len - ����� ������������ ������
//   data	- ������
//   alg  - 0 - ��� 1176.1
//	 alg  - 1 - ��� 34.101.31
//	��������
//	digest_len - ����� ���-��������
//  pdigest - ���-��������
int Hash(int data_len, char * data, int alg, unsigned int* digest_len, char * pdigest, char* pPin);
//���������� ������
//   data_len - ����� ������������ ������
//   data	- ������
//   alg  - 0 - stb11762_sign
//	 	- 1 - stb11762pre_sign
//	 	- 2 - bign_with_hbelt
//	��������
//	len_sign - ����� �������
//  sign - �������� �������
int Sign(int data_len, char * data, int alg, unsigned int* len_sign, char * sign, char* pPin);
//�������� ������� ��� �������
//   data_len - ����� ������������ ������
//   data	- ������
//   alg  - 0 - stb11762_sign
//	 	- 1 - stb11762pre_sign
//	 	- 2 - bign_with_hbelt
//	len_sign - ����� �������
//  sign - �������� �������
int Verify1(int data_len, char * data, int alg, int len_sign, char * sign , char* pPin);
//�������� ������� ��� �������
//   data_len - ����� ������������ ������
//   data	- ������
//   alg  - 0 - stb11762_sign
//	 	- 1 - stb11762pre_sign
//	 	- 2 - bign_with_hbelt
//	len_sign - ����� �������
//  sign - �������� �������
//  lenSOK - ����� ������ �����������
//  bufSOK - ����������
int Verify(int data_len, char * data, int alg, int len_sign, char * sign, char *bufSOK, int lenSOK, char* pPin );