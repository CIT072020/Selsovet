
{$WARN UNIT_PLATFORM OFF}
 
// ����������� �������� � ����� SQL
//{$DEFINE ENABLE_EXPORT}

{$DEFINE EHLIB3}

{$DEFINE USE_SCRIPT}
{$DEFINE USE_LOGFILE}
{$DEFINE USE_NEW_SPR}
{$DEFINE VER_LOOKUP_2}
{$DEFINE DATASET_AS_ADS}

{$DEFINE RO_SCRIPT}

{$DEFINE MY_PROJECT}

//{$DEFINE NOT_USE_REPORT}
{$DEFINE USE_FR2}
{$DEFINE USE_FR3}

{$DEFINE HUNSPELL}

//{$DEFINE DEBUG_GIS}
 
// ������ ��� ������������ � �����
//{$DEFINE TEST_GISUN}

{$DEFINE OBR_GRAG}
{$DEFINE OBR_GRAG_WITH_NASEL}

//-------- �������� ���������� ��� �������� ----------------
//{$DEFINE ZAGS}
{$DEFINE LAIS}
//{$DEFINE POST}
//{$DEFINE ZAH}
//{$DEFINE OPEKA}
//{$DEFINE OCHERED}
//{$DEFINE GKH}
//---------------------------------------------------------
	   
{$DEFINE GISUN4}
// �������� ����������� ����� � �����������
{$DEFINE ENABLE_LOCAL }
// �������� �������������� � ����
// ���������� ����� ����� ���������� Indy
{$DEFINE EMAIL_INDY }

{$IFDEF OCHERED}
  // ��� ������������� �����������
//  {$DEFINE OCHERED_UNION}
//  {$DEFINE LOAD_FIREBIRD}
//  {$DEFINE LOAD_ACCESS}
//  {$DEFINE LOAD_EXCEL}
{$ENDIF}

// �������������� ������� �����. ����
{$DEFINE ADD_MENS_PU}
{$DEFINE ADD_ZAGS}
{$DEFINE ADD_OCH}
{$DEFINE ADD_MKB10}

{$IF Defined(LAIS) or Defined(POST) }
  {$DEFINE ADD_VEDOM_ARXIV}
{$IFEND}
                
//����.����(POST)
{$IFDEF POST}
  {$DEFINE SMDO}
  {$DEFINE REGDOC_SIGN}
  {$DEFINE UPDATE_SYNA}
  {$UNDEF ADD_MENS_PU}
  {$UNDEF OBR_GRAG_WITH_NASEL}
  {$UNDEF ADD_ZAGS}
  {$UNDEF ADD_OCH}
  {$UNDEF ADD_MKB10}
{$ENDIF}

{$IFDEF ZAGS}
  {$DEFINE LOAD_ZAGS_XML}
  {$DEFINE GISUN}
  {$DEFINE QUERY_GIS}
  {$DEFINE UPDATE_SYNA}
  {$UNDEF ADD_MENS_PU}
  {$UNDEF OBR_GRAG_WITH_NASEL}
{$ELSE}
  {$IFDEF LAIS}
    {$DEFINE SMDO }
    {$DEFINE REGDOC_SIGN}
    {$DEFINE GISUN}
    {$DEFINE QUERY_GIS}
    {$DEFINE UPDATE_SYNA}
    {$DEFINE ADD_ZAH}
    {$DEFINE ADD_OPEKA}
    {$IFDEF GISUN4}
      {$DEFINE ADD_WS_LOCAL}
    {$ENDIF}
  {$ELSE}

    {$IFDEF ZAH}
      {$DEFINE UPDATE_SYNA}
      {$DEFINE GISUN}
      {$DEFINE ADD_ZAH}
      {$DEFINE ADD_WS_LOCAL}
      {$UNDEF ADD_MENS_PU}
      {$UNDEF ADD_ZAGS}
      {$UNDEF ADD_OCH}
      {$UNDEF OBR_GRAG}
//      {$UNDEF OBR_GRAG_WITH_NASEL}
    {$ENDIF}

    {$IFDEF GKH}
      {$UNDEF ADD_ZAGS}
    {$ENDIF}

    {$IFDEF OCHERED}
      {$DEFINE MEN_ADD_OWNERS}
      {$UNDEF ADD_ZAGS}
    {$ENDIF}
                
   {$IFDEF OPEKA}
      {$DEFINE GISUN}
      {$DEFINE UPDATE_SYNA}
      {$DEFINE ADD_OPEKA}
      {$DEFINE ADD_WS_LOCAL}
      {$UNDEF OBR_GRAG}
      {$UNDEF ADD_MENS_PU}
      {$UNDEF ADD_ZAGS}
      {$UNDEF ADD_OCH}
      {$UNDEF ADD_MKB10}
    {$ENDIF}

  {$ENDIF}
{$ENDIF}

{$IFDEF GISUN}
  {$DEFINE GISUN2}
  // ���������� � ������������ ������ � ���
  {$DEFINE SIGN}
  // ���������� � ������������ ������ � ��� "�����"
  {$DEFINE AVEST_GISUN}
  // �������� ��� �� ���������: "�����"
//  {$DEFINE DEFAULT_AVEST}
{$ENDIF}

// ����������� ������������� ��������
{$DEFINE USE_TEMPLATE}
{$DEFINE USE_WORD}

// ���� �������� �������� ���������� ���������� ������������ ��� �����������
// ���������� � ������ ������
{$DEFINE in_sel}




