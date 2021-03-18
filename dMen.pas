unit dMen;
{ важные свойства MemTable
    AutoReposition=true    при изменении ключевых полей после post, dataset остается на текущей записи
    AutoReposition=false   при изменении ключевых полей после post, dataset может сменить текущую запись
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils, OpisEdit, uPadegFIO, ShellApi, kbmMemTable,
  dDokument, Db, dBase, uTypes, FuncPr, DbFunc, MetaTask, FR_DSet, mPermit, QStrings, uProject, uProjectAll, uUtilFiles,
  FR_DBSet
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

{$I Task.inc}

type
  TdmMen = class(TdmDokument)
    mtDokumentOTNOSH: TIntegerField;
    mtDokumentFAMILIA: TStringField;
    mtDokumentNAME: TStringField;
    mtDokumentOTCH: TStringField;
    mtDokumentPOL: TStringField;
    mtDokumentDATER: TDateField;
    mtDokumentAKT_ROGD_NOMER: TStringField;
    mtDokumentAKT_ROGD_DATE: TDateField;
    mtDokumentNATION: TIntegerField;
    mtDokumentOBRAZ: TIntegerField;
    mtDokumentSTUDENT: TSmallintField;
    mtDokumentSTUDENT_TYPE: TSmallintField;
    mtDokumentSTUDENT_SPR: TIntegerField;
    mtDokumentSTUD_PLACE: TStringField;
    mtDokumentSTUD_SITE: TStringField;
    mtDokumentKURS: TSmallintField;
    mtDokumentWORKSELO: TBooleanField;
    mtDokumentWORK_SPR: TIntegerField;
    mtDokumentWORK_NAME: TStringField;
    mtDokumentDOLG_SPR: TIntegerField;
    mtDokumentDOLG_NAME: TStringField;
    mtDokumentPRESENT: TBooleanField;
    mtDokumentDATEZ: TDateField;
    mtDokumentCOUNT_ZEK: TSmallintField;
    mtDokumentPASP_SERIA: TStringField;
    mtDokumentPASP_NOMER: TStringField;
    mtDokumentPASP_DATE: TDateField;
    mtDokumentPASP_VIDAN: TStringField;
    mtDokumentLICH_NOMER: TStringField;
    mtDokumentDATES: TDateField;
    mtDokumentAKT_SMER_NOMER: TStringField;
    mtDokumentAKT_SMER_DATE: TDateField;
    mtDokumentPENS_TIP: TIntegerField;
    mtDokumentPENS_DATE: TDateField;
    mtDokumentPENS_KNIGA: TStringField;
    mtDokumentCITIZEN: TIntegerField;
    tbMigr: TkbmMemTable;
    tbMigrDATE: TDateField;
    tbMigrPRICH: TIntegerField;
    tbMigrTALON: TIntegerField;
    tbMigrKOMM: TMemoField;
    tbPriznaki: TkbmMemTable;
    tbPriznakiKOD: TIntegerField;
    tbPriznakiNAME: TStringField;
    tbLgot: TkbmMemTable;
    tbLgotKOD: TIntegerField;
    tbLgotNAME: TStringField;
    Master: TDataSource;
    mtDokumentID_INTERNAL: TAutoIncField;
    tbPriznakiID_INTERNAL: TIntegerField;
    tbMigrID_INTERNAL: TIntegerField;
    tbLgotID_INTERNAL: TIntegerField;
    tbMigrPRICH_NAME: TStringField;
    tbMigrTIP: TSmallintField;
    tbMigrCONTANT: TSmallintField;
    mtDokumentNSTR: TIntegerField;
    mtDokumentCANDELETE: TBooleanField;
    mtDokumentFIRST: TBooleanField;
    mtDokumentSEM: TIntegerField;
    mtDokumentOTM_NATION: TStringField;
    frDBMens: TfrDBDataSet;
    frDBMigr: TfrDBDataSet;
    frDBLgot: TfrDBDataSet;
    frDBPriznaki: TfrDBDataSet;
    mtDokumentADD_INFO: TMemoField;
    mtDokumentDATEP: TDateField;
    tbMigrORGAN: TMemoField;
    mtDokumentDATEV: TDateField;
    mtDokumentTELEFON: TStringField;
    mtDokumentWORK_TELEF: TStringField;
    mtDokumentVUS: TBooleanField;
    mtDokumentDATESV_VK: TDateField;
    mtDokumentDATESV_LIC: TDateField;
    mtDokumentDATESV_F2: TDateField;
    mtDokumentNOMER_VUS: TStringField;
    mtDokumentZVAN: TSmallintField;
    mtDokumentGODEN: TSmallintField;
    mtDokumentKOMANDA: TStringField;
    mtDokumentJAVKA: TSmallintField;
    mtDokumentMARSHRUT: TSmallintField;
    mtDokumentGRAGSPEC: TStringField;
    mtDokumentKOMISS_DATE: TDateField;
    mtDokumentKOMISS: TSmallintField;
    mtDokumentKOMISS_GODEN: TSmallintField;
    mtDokumentKOMISS_STAT: TStringField;
    mtDokumentKOMISS_GRAFA: TStringField;
    mtDokumentKOMISS_PRIKAZ: TStringField;
    mtDokumentKOMISS_DATEPERE: TDateField;
    mtDokumentDATESOST: TDateField;
    mtDokumentVB_SERIA: TStringField;
    mtDokumentVB_NOMER: TStringField;
    mtDokumentVB_DATE: TDateField;
    mtDokumentPRIB_DATE: TDateField;
    mtDokumentPRIB_TEXT: TMemoField;
    mtDokumentPRIB_DATEVK: TDateField;
    mtDokumentUBIT_DATE: TDateField;
    mtDokumentUBIT_TEXT: TMemoField;
    mtDokumentUBIT_DATEVK: TDateField;
    mtDokumentSOSTAV_SEM: TMemoField;
    mtDokumentSPEC: TSmallintField;
    mtDokumentGRUPPA: TStringField;
    mtDokumentNOTSELECT: TBooleanField;
    mtDokumentPROPIS: TBooleanField;
    mtDokumentADRES_PROP: TStringField;
    mtDokumentISWORK: TSmallintField;
    mtDokumentSPEC_UCH: TBooleanField;
    mtDokumentPASP_UDOST: TSmallintField;
    mtDokumentDATE_SROK: TDateField;
    mtDokumentTYPE_KOMANDA: TSmallintField;
    mtDokumentADRES_ID: TIntegerField;
    mtDokumentVUS_SOSTAV: TSmallintField;
    mtDokumentVUS_PREDN: TStringField;
    mtDokumentVUS_MARKA_TS: TStringField;
    mtDokumentMR_B_RESP: TBooleanField;
    mtDokumentMR_GOSUD: TIntegerField;
    mtDokumentMR_B_OBL: TBooleanField;
    mtDokumentMR_OBL: TStringField;
    mtDokumentMR_RAION: TStringField;
    mtDokumentMR_B_GOROD: TSmallintField;
    mtDokumentMR_GOROD: TStringField;
    mtDokumentOCHERED: TBooleanField;
    mtDokumentDELO: TStringField;
    mtDokumentNOMER_OCH: TIntegerField;
    mtDokumentOLD_NOMER: TIntegerField;
    mtDokumentDEC_DATE: TDateField;
    mtDokumentDEC_TIME: TTimeField;
    mtDokumentPER_DATE: TDateField;
    mtDokumentKOLVO_PROPIS: TSmallintField;
    mtDokumentKOLVO_SOSTAV: TSmallintField;
    mtDokumentKOLVO_KOMN: TSmallintField;
    mtDokumentPLOSH_ALL: TFloatField;
    mtDokumentTYPEHOUSE: TSmallintField;
    mtDokumentUNP: TStringField;
    tbSostavSem: TkbmMemTable;
    tbOcheredLgot: TkbmMemTable;
    mtDokumentOCHERED_PRIM: TMemoField;
    tbSostavSemOTNOSH: TIntegerField;
    tbSostavSemMEMBER_ID: TIntegerField;
    tbOcheredLgotOCHERED_ID: TIntegerField;
    tbOcheredLgotNOMER_OCH: TIntegerField;
    tbOcheredLgotOLD_NOMER: TIntegerField;
    tbOcheredLgotDEC_DATE: TDateField;
    tbOcheredLgotDEC_TIME: TTimeField;
    tbOcheredLgotOCHERED_PRIM: TMemoField;
    tbSostavSemFAMILIA: TStringField;
    tbSostavSemNAME: TStringField;
    tbSostavSemOTCH: TStringField;
    tbSostavSemDATER: TDateField;
    tbSostavSemPOL: TStringField;
    tbSostavSemNOMER: TIntegerField;
    mtDokumentRESIDENCE: TIntegerField;
    mtDokumentNEW_PLOSH_ALL: TFloatField;
    mtDokumentNEW_KOLVO_KOMN: TSmallintField;
    mtDokumentKREDIT_DATE: TDateField;
    mtDokumentKREDIT_SUMMA: TFloatField;
    mtDokumentNEW_DATE: TDateField;
    mtDokumentISKL: TBooleanField;
    tbOcheredLgotREG_NOMER: TStringField;
    mtDokumentREG_NOMER: TStringField;
    tbOcheredLgotOTKAZ: TBooleanField;
    tbOcheredLgotISKL: TBooleanField;
    tbOcheredLgotOCHERED_DOK: TMemoField;
    mtDokumentOCHERED_DOK: TMemoField;
    mtDokumentNOTDELETE: TBooleanField;
    mtDokumentAPROP_OBL: TStringField;
    mtDokumentAPROP_RN: TStringField;
    mtDokumentAPROP_PN: TStringField;
    mtDokumentAPROP_UL: TStringField;
    mtDokumentAPROP_DOM: TStringField;
    mtDokumentAPROP_KORP: TStringField;
    mtDokumentAPROP_KV: TStringField;
    mtDokumentNEWSEM: TBooleanField;
    mtDokumentKATEG: TSmallintField;
    mtDokumentFIRST_NOTMY: TBooleanField;
    mtDokumentBEZADRESA: TBooleanField;
    tbOcheredLgotDELO: TStringField;
    mtDokumentADD_ADRES_GIT: TBooleanField;
    mtDokumentADRES_GIT: TMemoField;
    mtDokumentAGIT_OBL: TStringField;
    mtDokumentAGIT_RN: TStringField;
    mtDokumentAGIT_PN: TStringField;
    mtDokumentAGIT_UL: TStringField;
    mtDokumentAGIT_DOM: TStringField;
    mtDokumentAGIT_KORP: TStringField;
    mtDokumentAGIT_KV: TStringField;
    mtDokumentAGIT_TEL: TStringField;
    mtDokumentLIC_ID: TIntegerField;
    mtDokumentPRIZ: TBooleanField;
    tbMigrDATE_SROK: TDateField;
    mtDokumentPA_ID: TIntegerField;
    mtDokumentMA_ID: TIntegerField;
    mtDokumentNEW_ADRES_ID: TIntegerField;
    mtDokumentNEW_DOGOVOR: TStringField;
    mtDokumentSUBSID_DATE: TDateField;
    mtDokumentSUBSID_SUMMA: TFloatField;
    mtDokumentPA_FIO: TStringField;
    mtDokumentMA_FIO: TStringField;
    mtDokumentOP_B_RESP: TBooleanField;
    mtDokumentOP_GOSUD: TIntegerField;
    mtDokumentOP_B_OBL: TBooleanField;
    mtDokumentOP_OBL: TStringField;
    mtDokumentOP_RAION: TStringField;
    mtDokumentOP_B_GOROD: TSmallintField;
    mtDokumentOP_GOROD: TStringField;
    tbMigrOP_B_RESP: TBooleanField;
    tbMigrOP_GOSUD: TIntegerField;
    tbMigrOP_B_OBL: TBooleanField;
    tbMigrOP_OBL: TStringField;
    tbMigrOP_RAION: TStringField;
    tbMigrOP_B_GOROD: TSmallintField;
    tbMigrOP_GOROD: TStringField;
    mtDokumentVOENKOM: TIntegerField;
    mtDokumentGSK: TStringField;
    mtDokumentUCHASTOK: TBooleanField;
    mtDokumentSOCIAL: TSmallintField;
    mtDokumentOWNER_ID: TIntegerField;
    mtDokumentNOMER_SEM: TIntegerField;
    mtDokumentKOLVO_KOMN_PR: TSmallintField;
    mtDokumentIS_UCHASTOK: TBooleanField;
    mtDokumentAKT_ROGD_ORGAN: TMemoField;
    mtDokumentAKT_SMER_ORGAN: TMemoField;
    mtDokumentOP_DATE: TDateField;
    mtDokumentPASP_SROK: TDateField;
    mtDokumentSLUGEB_POMECH: TMemoField;
    mtDokumentDOP_OCHERED: TMemoField;
    mtDokumentDOP_DATE: TDateField;
    mtDokumentNEW_ID: TIntegerField;
    mtDokumentDATE_SROK_DN: TDateField;
    tbSostavSemLICH_NOMER: TStringField;
    mtDokumentADRES_ID_GIT: TIntegerField;
    mtDokumentTEXT_ADRES: TMemoField;
    mtDokumentNEW_PLOSH_GIL: TFloatField;
    mtDokumentNEW_PLOSH_SNP: TFloatField;
    mtDokumentNEW_KV: TStringField;
    mtDokumentGSK_ID: TIntegerField;
    mtDokumentPLOSH_GIL: TFloatField;
    tbOcheredResh: TkbmMemTable;
    tbOcheredReshOCHERED_ID: TIntegerField;
    tbOcheredReshNOMER: TStringField;
    tbOcheredReshOSNOV: TIntegerField;
    tbOcheredReshDATER: TDateField;
    tbOcheredReshOSNOV2: TIntegerField;
    tbOcheredReshOSNOV_TEXT2: TStringField;
    tbOcheredReshOSNOV_TEXT: TStringField;
    tbOcheredReshADDINFO: TMemoField;
    tbOcheredReshOTKAZ: TBooleanField;
    tbOcheredReshID1: TIntegerField;
    tbOcheredReshID2: TIntegerField;
    tbOcheredReshTEXTRESH: TMemoField;
    tbOcheredReshTIP: TSmallintField;
    tbOcheredReshAUTO_ID: TIntegerField;
    tbOcheredLgotLAST_RESH_DATE: TDateField;
    tbOcheredLgotLAST_RESH_OSNOV_TEXT: TMemoField;
    tbOcheredLgotLAST_RESH_NOMER: TStringField;
    tbOcheredReshDATE_SILA: TDateField;
    tbOcheredReshTEXTVIPIS: TMemoField;
    mtDokumentSIROTA: TBooleanField;
    tbOcheredReshPROV: TBooleanField;
    tbOcheredReshRAZD: TBooleanField;
    mtDokumentMR_GOROD_RN: TStringField;
    mtDokumentMR_TYPE_ULICA: TStringField;
    mtDokumentMR_ULICA: TStringField;
    mtDokumentMR_DOM: TStringField;
    mtDokumentMR_KORP: TStringField;
    mtDokumentMR_KV: TStringField;
    tbOcheredReshA: TkbmMemTable;
    mtDokumentKREDIT_NOMER: TStringField;
    mtDokumentRESIDENCE_DATE: TDateField;
    mtDokumentID_BASE: TIntegerField;
    tbOcheredReshDATE_SORT: TDateField;
    tbOcheredReshAUTO_SORT: TAutoIncField;
    tbOcheredLgotID_INTERNAL: TIntegerField;
    tbSostavSemID_INTERNAL: TIntegerField;
    tbOcheredReshID_INTERNAL: TIntegerField;
    tbOcheredReshPLAN: TBooleanField;
    tbOcheredSobstv: TkbmMemTable;
    tbOcheredSobstvID_INTERNAL: TIntegerField;
    tbOcheredSobstvMEMBER_ID: TIntegerField;
    tbOcheredSobstvKADASTR: TStringField;
    tbOcheredSobstvADRES: TStringField;
    tbOcheredSobstvDEST: TStringField;
    tbOcheredSobstvPLOSH_ALL: TFloatField;
    tbOcheredSobstvPRAVO: TStringField;
    tbOcheredSobstvTAIL: TStringField;
    tbOcheredSobstvDATER: TDateField;
    tbOcheredSobstvDATEP: TDateField;
    tbOcheredSobstvPRIM: TStringField;
    tbOcheredSobstvNOMER: TAutoIncField;
    tbOcheredSobstvFIO: TStringField;
    mtDokumentKREDIT_RESH: TStringField;
    mtDokumentSUBSID_RESH: TStringField;
    tbSostavSemPASP_UDOST: TSmallintField;
    tbSostavSemPASP_SERIA: TStringField;
    tbSostavSemPASP_NOMER: TStringField;
    tbSostavSemPASP_DATE: TDateField;
    tbSostavSemPASP_VIDAN: TStringField;
    tbSostavSemTEXT_ADRES: TMemoField;
    tbSostavSemISKL: TBooleanField;
    mtDokumentONLY: TBooleanField;
    tbOcheredLgotVNEOCH: TBooleanField;
    tbSostavSemCHECK: TBooleanField;
    mtDokumentTELEFON_M: TStringField;
    mtDokumentLGOT_DATE: TDateField;
    mtDokumentPRIME: TBooleanField;
    mtDokumentTAIL: TStringField;
    mtDokumentDOXOD_SUMMA: TFloatField;
    tbSostavSemDATEP: TDateField;
    mtDokumentEN_ADRES_ID: TIntegerField;
    mtDokumentEN_LIC_ID: TIntegerField;
    mtDokumentEN_LGOT_DATA: TDateField;
    mtDokumentIS_UCHASTOK_DATE: TDateField;
    mtDokumentNEWMEN: TBooleanField;
    mtDokumentDEC_DATE_REAL: TDateField;
    mtDokumentDEC_NOMER: TIntegerField;
    tbOcheredLgotDEC_DATE_REAL: TDateField;
    tbOcheredLgotDEC_NOMER: TIntegerField;
    tbOcheredLgotLAST_RESH_TIP: TIntegerField;
    mtDokumentA: TkbmMemTable;
    mtDokumentUCHASTOK_DATE: TDateField;
    tbSostavSemPRICH: TSmallintField;
    mtDokumentZVAN2: TSmallintField;
    mtDokumentUDOST_LGOT: TStringField;
    mtDokumentMNOGO_4: TBooleanField;
    mtDokumentMNOGO_I: TBooleanField;
    mtDokumentPODR_NAME: TStringField;
    mtDokumentSUPRUG_ID: TIntegerField;
    mtDokumentUCH_OBR_ALL: TMemoField;
    mtDokumentKVALIF: TStringField;
    mtDokumentAGIT_RODST: TMemoField;
    mtDokumentSUPRUG: TStringField;
    mtDokumentSUPRUG_DATER: TDateField;
    mtDokumentSPEC_TEXT: TMemoField;
    tbSverki: TkbmMemTable;
    tbSverkiDATE_SV: TDateField;
    tbSverkiNAME: TStringField;
    tbSverkiFIO: TStringField;
    tbSverkiID_INTERNAL: TIntegerField;
    mtDokumentVUS_ISKL: TBooleanField;
  private
    FCurMen : Integer;
    FEditFromLichSchet : Boolean;
    FEditFromAdres: Boolean;
    procedure ClearMens;
    procedure ClearDetailTables;
    procedure SetEditFromLichSchet( Value : Boolean);
    procedure SetEditFromAdres(const Value: Boolean);
    function  WriteOneMen(IDLich : Integer; IDFirst : Integer; IDAdres : Integer; var IDRealFirst : Integer; lCurr : Boolean) : Boolean;
  public
    {$IFDEF MEN_ADD_OWNERS}
    tbHouseOwners:TkbmMemTable;
    {$ENDIF}
    OchReshMod:Boolean;    // была корректировака таблицы решений
    OchSostavMod:Boolean;  // была корректировка сотава семьи
 //   OchLgotMod:Boolean;    // была корректировка  семьи
    DvigMod:Boolean;    // была корректировка списка движения
    CheckEn:Boolean;
    iii:Integer;
    LicID : Integer;
    TelefonFromLic:String;
    sDelMens:String;    // применяестя для очередников
    sChilds:String;     // список ID детей
    sSuprug:String;     // супруг главы лицевого сета
    sSuprugPOL:String;  // пол супруга главы лицевого сета
    Adres:TAdres;
//    AdresAndTelefon : String;
    property  EditFromLichSchet : Boolean read FEditFromLichSchet write SetEditFromLichSchet;
    property  EditFromAdres : Boolean read FEditFromAdres write SetEditFromAdres;
    function  GetAdresAndTelefon : String;
    function  GetAddAdresProp : String;
    procedure ClearAddAdresProp;
    procedure ClearMaster;
    procedure SetMaster;
    procedure AddRead(IDLich : Integer; ID : Integer);
    function  ReadOneMen( ID : Integer; lCurr : Boolean; slPar : TStringList ) : Boolean;
    function  ReadAllMens( IDLich : Integer; IDAdres : Integer; slMens : TStringList) : Boolean;
    function  ReadAllMensAdres(slLich : TStringList; IDAdres : Integer; slMens : TStringList): Boolean;
    function  ReadHistMens(nType:Integer; nIDLic:Integer; nIDAdres: Integer): Boolean;

    procedure SetAPROP(adr:TAdres);
    function  GetAPROP:TAdres;

    function  ReadDokument( ID : Integer; slPar : TStringList=nil) : Boolean; override;
    procedure ClearDokument; override;
    function  WriteAllMens( IDLich : Integer; IDFirst : Integer; IDAdres : Integer; var IDRealFirst : Integer) : Boolean;
    function  WriteDokument(f:TForm=nil) : Boolean; override;
    function  WriteDokumentForScript: Boolean;

    function  GetReshOch(resh:TReshOchMen;nTypeOch:Integer;nTypeResh:Integer): Boolean;
    function  AllReshOch(sl:TStringList; dDateR:TDateTime; sNomer:String): Boolean;

    function  ReadSobstvMen(ID: Integer; ID_INTERNAL: Integer): Boolean;
    function  WriteSobstvMen(ID: Integer): Boolean;
    function  ReadOchered( ID : Integer; IDInternal : Integer) : Boolean;
    function  WriteOchered( ID : Integer; nIDAdresMen:Integer) : Boolean;
    procedure writeCurResh(nID:Integer; lFirst:Boolean; nBase:Integer);
    function  SetIDResh(nOch:Integer):Boolean;
    procedure DeleteReshOch(nOcheredID:Integer);

    {$IFDEF MEN_ADD_OWNERS}
      procedure CreateHouseOwners;
    {$ENDIF}

    function  SostavToMens(dsSostavSem:TDataSet; nIDAdresMen:Integer):Boolean;
    function  PereofOchered(resh:TReshOchMen; nID:Integer; nNewID:Integer; strBookMarkMen:String; slBookMark:TStringList):Boolean;
    function  RazdelOchered(resh:TReshOchMen; nID:Integer; nNewID:Integer; strBookMarkMen:String; strBookMarkNew:String):Boolean;
    function  UnionOchered(resh:TReshOchMen; nID:Integer; nNewID:Integer; strBookMarkMen:String; sDelo:String):Boolean;

    function  ReadVUS( ID : Integer; IDInternal : Integer) : Boolean;
    function  WriteVUS( ID : Integer) : Boolean;
    procedure ReadSverki(nID:Integer; nIDInternal : Integer);
    procedure WriteSverki(nID:Integer);

    function  GetVoenkom(nTypeDate:Integer; sDelim:String):String;

    function  ReadMenAdd( ID : Integer) : Boolean;
    function  WriteMenAdd( ID : Integer) : Boolean;
    function  PostDokument : Boolean; override;
    function  CancelDokument : Boolean; override;

    function SostavSemToStr(strType:String; strRazd:String) : String;
    procedure CheckCountSostav;

    function  CheckPresentMen(var strerr:String; var strSoob:String) : Boolean;        //  !!!
    function  CheckListResh(var strerr:String) : Boolean;
    function VozvratMen(d:TDateTime; var sErr:String):Boolean;  // см. dBase
    function VipisMen(d:TDateTime; var sErr:String):Boolean;    // см. dBase

    function  IsKvartirant : Boolean;
    function  CheckMigr( var lPresent,lPropis:Boolean) : String;   //  !!!
    function  TypeReg : Integer;                                   //  !!!

    function  GetVid : String; override;
    procedure AfterCreateDokument; override;
    function AfterReadDokument : Boolean; override;
    function CheckDokument(var strErr : String) : Boolean; override;
    function CheckFIO_(nID:Integer;sFam,sName,sOtch:String) : Boolean;
    function CheckFIO(IDInternal:Integer; var strErr : String) : Boolean;

    procedure CheckMenAll;
    function IsLgotEN: Boolean;  // есть человек с льготой на электроэнергию
    function LastDvigMenS( strID : String) : String;
    function CheckTypeReg : String;
    function MustAdres : Boolean;
    function GetFIO : String;
    procedure ZaprosBank(lMain:Boolean; win:TWinControl);

    function ChoiceSprOch(lPost:Boolean;sField,sFieldText:String):Boolean;

    constructor Create(Owner : TComponent); override;


  end;

  // создает дополнительный TdmMen, прикрепляет его к fmMen, сохраняет ссылку на старый TdmMen;
  function CreateAdd_dmMen(var dmOld:TdmMen):TdmMen;
  // удаляет дополнительный TdmMen, возвращает ссылку на старый TdmMen;
  procedure DestroyAdd_dmMen(dmAdd:TdmMen; dmOld:TdmMen);

//var
//  dmMen: TdmMen;

implementation

uses fMain, StrUtils, fMen, uObjectsScript, fParamQuest;

{$R *.DFM}

//-------------------------------------------------------------------------------------------
// создает дополнительный TdmMen, прикрепляет его к fmMen, сохраняет ссылку на старый TdmMen;
//-------------------------------------------------------------------------------------------
function CreateAdd_dmMen(var dmOld:TdmMen):TdmMen;
begin
  dmOld:=nil;
  Result:=TdmMen.Create(nil);
  Result.iii:=1;
  {$IFNDEF ZAGS}
  if (fmMain.fmMen<>nil) then begin
    if (fmMain.fmMen.dmMen<>nil) then begin
      dmOld:=fmMain.fmMen.dmMen;
    end;
    Men.FdmMen:=Result;
    fmMain.fmMen.Dokument:=Result;
    fmMain.fmMen.dmMen:=Result;
  end;
  {$ENDIF}
end;

//-------------------------------------------------------------------------------------------
// удаляет дополнительный TdmMen, возвращает ссылку на старый TdmMen;
//-------------------------------------------------------------------------------------------
procedure DestroyAdd_dmMen(dmAdd:TdmMen; dmOld:TdmMen);
begin
  {$IFNDEF ZAGS}
  if (fmMain.fmMen<>nil) then begin
    Men.FdmMen:=dmOld;
    fmMain.fmMen.Dokument:=dmOld;
    fmMain.fmMen.dmMen:=dmOld;
  end;
  {$ENDIF}
end;


{ TdmMen }

constructor TdmMen.Create(Owner: TComponent);
begin
  inherited;
  iii:=0;
  FTypeObj:=_TypeObj_Nasel;
  OpenTableFactor;
  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,mtDokument,'Mens','Человек');
    CreatefrxDBdataSet(self,mtDokumentA,'MensAll','Все люди лицевого');
    CreatefrxDBdataSet(self,tbMigr,'Mens_Migr','Миграция человека');
    CreatefrxDBdataSet(self,tbLgot,'Mens_Lgot','Льготы человека');
    CreatefrxDBdataSet(self,tbPriznaki,'Mens_Priz','Признаки человека');
    CreatefrxDBdataSet(self,tbSostavSem,'Mens_SostavSem','Состав семьи человека');
    CreatefrxDBdataSet(self,tbOcheredLgot,'Mens_OcheredLgot','Льготная очередь на жилье');
    CreatefrxDBdataSet(self,tbOcheredResh,'Mens_OcheredResh','Очередь на жилье решения');
    CreatefrxDBdataSet(self,tbOcheredReshA,'Mens_OcheredReshA','Очередь на жилье решения без фильтра');
    CreatefrxDBdataSet(self,tbOcheredSobstv,'Mens_OcheredSobstv','Очередь на жилье собственность');
    CreatefrxDBdataSet(self,CurListDeti,'Mens_Child','Дети');
    CreatefrxDBdataSet(self,tbPropertys,'Mens_Factor','Показатели');
    CreatefrxDBdataSet(self,tbHistory,'Mens_History','История реквизитов');
    CreatefrxDBdataSet(self,tbResh,'Mens_Resh','Решения');
    CreatefrxDBdataSet(self,tbSverki,'Mens_Sverki','Список сверок ВУС');
  {$ENDIF}
  FMainTable:=dmBase.tbMens;
  mtDokumentA.Active:=true;
end;

procedure TdmMen.ClearMens;
begin
  IsReadDokument:=true;   // потому что срабатывают всякие нехорошие события
  ClearMaster;
  mtDokument.EmptyTable;
  if (mtDokument.State=dsEdit) or (mtDokument.State=dsInsert)  then mtDokument.Cancel;
  mtDokument.AutoIncMinValue:=1;
  mtDokument.ResetAutoInc;
  ClearDetailTables;
  DeleteAllFactor;
  FCurMen := -1;
  LicID:=0;
  TelefonFromLic:='';
  IsReadDokument:=false;
end;

procedure TdmMen.ClearDetailTables;
begin
  if not tbLgot.Active then begin
    tbLgot.Active := true;
  end;
  tbLgot.EmptyTable;
  if not tbMigr.Active then begin
    tbMigr.Active := true;
    dmBase.SetDateFormat(tbMigr);
  end;
  tbMigr.EmptyTable;
  if not tbPriznaki.Active then begin
    tbPriznaki.Active := true;
  end;
  tbPriznaki.EmptyTable;
  if not tbSostavSem.Active then begin
    tbSostavSem.Active := true;
  end;
  tbSostavSem.EmptyTable;
  if not tbOcheredLgot.Active then begin
    tbOcheredLgot.Active := true;
  end;
  tbOcheredLgot.EmptyTable;

  if not tbOcheredResh.Active then begin
    tbOcheredResh.Active := true;
  end;
  tbOcheredResh.EmptyTable;
  if not tbOcheredReshA.Active then begin
    tbOcheredReshA.Active := true;
  end;

  if not tbOcheredSobstv.Active then begin
    tbOcheredSobstv.Active := true;
  end;
  tbOcheredSobstv.EmptyTable;

  if not tbHistory.Active then begin
    tbHistory.Active := true;
  end;
  tbHistory.EmptyTable;

  if not tbResh.Active then begin
    tbResh.Active := true;
  end;
  tbResh.EmptyTable;
  if not tbSverki.Active then begin
    tbSverki.Active := true;
    dmBase.SetDateFormat(tbSverki);
  end;
  tbSverki.EmptyTable;
end;

procedure TdmMen.ClearMaster;
begin
//{$IFDEF OCHERED}
//  with tbOcheredResh do begin
//    Filter:='';
//    Filtered:=false;
//  end;
//{$ELSE}
  with tbLgot do begin
    MasterSource := nil;
    MasterFields := '';
  end;
  with tbMigr do begin
    MasterSource := nil;
    MasterFields := '';
  end;
  with tbPriznaki do begin
    MasterSource := nil;
    MasterFields := '';
  end;
  with tbSostavSem do begin
    MasterSource := nil;
    MasterFields := '';
  end;
  with tbOcheredLgot do begin
    MasterSource := nil;
    MasterFields := '';
  end;
  with tbOcheredResh do begin
    MasterSource := nil;
    MasterFields := '';
    Filter:='';
    Filtered:=false;
  end;
  with tbOcheredSobstv do begin
    MasterSource := nil;
    MasterFields := '';
  end;
  with tbHistory do begin
    MasterSource := nil;
    MasterFields := '';
  end;
  with tbResh do begin
    MasterSource := nil;
    MasterFields := '';
  end;
  with tbSverki do begin
    MasterSource := nil;
    MasterFields := '';
  end;
//{$ENDIF}
end;

procedure TdmMen.SetMaster;
begin
//{$IFDEF OCHERED}
//  with tbOcheredResh do begin
//    Filter:='ochered_id=0';
//    Filtered:=true;
//  end;
//{$ELSE}
  with tbLgot do begin
    MasterSource := Master;
    MasterFields := 'ID_INTERNAL';
    IndexName := IndexDefs[0].Name;
  end;
  with tbMigr do begin
    MasterSource := Master;
    MasterFields := 'ID_INTERNAL';
    IndexName := IndexDefs[0].Name;
  end;
  with tbPriznaki do begin
    MasterSource := Master;
    MasterFields := 'ID_INTERNAL';
    IndexName := IndexDefs[0].Name;
  end;
  with tbSostavSem do begin
    MasterSource := Master;
    MasterFields := 'ID_INTERNAL';
    IndexName := IndexDefs[0].Name;
  end;
  with tbOcheredLgot do begin
    MasterSource := Master;
    MasterFields := 'ID_INTERNAL';
    IndexName := IndexDefs[0].Name;
  end;
  with tbOcheredResh do begin
    MasterSource := Master;
    MasterFields := 'ID_INTERNAL';
    IndexName := IndexDefs[0].Name;
    Filter:='ochered_id=0';
    Filtered:=true;
  end;
  with tbOcheredSobstv do begin
    MasterSource := Master;
    MasterFields := 'ID_INTERNAL';
    IndexName := IndexDefs[0].Name;
  end;
  with tbHistory do begin
    MasterSource := Master;
    MasterFields := 'ID_INTERNAL';
    IndexName := IndexDefs[0].Name;
  end;
  with tbResh do begin
    MasterSource := Master;
    MasterFields := 'ID_INTERNAL';
    IndexName := IndexDefs[0].Name;
  end;
  with tbSverki do begin
    MasterSource := Master;
    MasterFields := 'ID_INTERNAL';
    IndexName := IndexDefs[0].Name;
  end;
//{$ENDIF}
end;

function TdmMen.ReadAllMens(IDLich: Integer; IDAdres : Integer; slMens : TStringList): Boolean;
var
  oldInd : String;
  sl : TStringList;
  i : Integer;
//  l1,l2:Boolean;
begin
  Result := true;
  ClearMens;
  oldInd := mtDokument.IndexFieldNames;
  dmBase.tbMens.IndexName := 'LIC_KEY';  // DATE_FIKS;LIC_ID
  {  было
  dmBase.tbMens.SetRange([DateFiks,IDLich],[DateFiks,IDLich]);
  while not dmBase.tbMens.Eof do begin
    Result := ReadOneMen(dmBase.tbMens.FieldByName('ID').AsInteger, true, nil);
    dmBase.tbMens.Next;
  end;
  dmBase.tbMens.CancelRange;
  }
  // стало
  sl := TStringList.Create;
  dmBase.tbMens.SetRange([DateFiks,IDLich],[DateFiks,IDLich]);
  while not dmBase.tbMens.Eof do begin
    sl.Add(dmBase.tbMens.Bookmark);
    dmBase.tbMens.Next;
  end;
  dmBase.tbMens.CancelRange;
//  l1:=dbDisableControls(mtDokument);
//  l2:=dbDisableControls(tbMigr);
  for i:=0 to sl.Count-1 do begin
    dmBase.tbMens.Bookmark:=sl.Strings[i];
    if slMens<>nil then slMens.Add(dmBase.tbMens.FieldByName('ID').AsString);
    Result := ReadOneMen(dmBase.tbMens.FieldByName('ID').AsInteger, true, nil);
  end;
//  dbEnableControls(mtDokument,l1);
//  dbEnableControls(tbMigr,l2);
  sl.Free;

  // при чтении проставим номера по порядку
  IsReadDokument:=true;
  FCurMen := 1;
  mtDokument.IndexFieldNames:='';
  mtDokument.First;
  while not mtDokument.Eof do begin
    mtDokument.Edit;
    mtDokumentNSTR.AsInteger := FCurMen;
    if IDAdres>0 then begin
      mtDokumentADRES_ID.AsInteger := IDAdres;
    end;
    mtDokument.Post;
    mtDokument.Next;
    FCurMen := FCurMen + 1;
  end;
  FCurMen := 1;
  LicID:=IDLich;
  AddRead(LicID,-1);
  if oldInd='' then oldInd:='NSTR';
  mtDokument.IndexFieldNames:=oldInd;
  mtDokument.First;
  SetMaster;
  IsReadDokument:=false;
  DvigMod:=false;
end;

//---------------------------------------------------------------------------------
// прочитать всех людей кто ранее проживал на лицевом счете
//---------------------------------------------------------------------------------
function TdmMen.ReadHistMens(nType:Integer; nIDLic:Integer; nIDAdres: Integer): Boolean;
var
  curLicID,n,nIDMen: Integer;
  l:Boolean;
  s,sBook:String;
  slPar:TStringList;
begin
  Result := true;
  l:=dbDisableControls(mtDokument);
  slPar:=TStringList.Create;
  slPar.Add('VUS=0');
  slPar.Add('OCH=0');
  sBook:=dmBase.tbMens.Bookmark;
  curLicID:=LicID; // !!!
  try
    mtDokument.Last;
    n:=mtDokumentNSTR.AsInteger;
    if nType=1
      then s:='adres_id='+IntToStr(nIDAdres) // по адресу
      else s:='lic_id='+IntToStr(nIDLic);   // по лицевому счету
    dmBase.WorkQuery.SQL.Text:='SELECT ID, DATE_FIKS FROM Население WHERE '+s+' and date_fiks<>'+DateToSQL(DateFiks)+' and lic_id>0 and adres_id>0'+
    ' ORDER BY date_fiks desc';
    dmBase.WorkQuery.Open;
    while not dmBase.WorkQuery.Eof do begin
      nIDMen:=dmBase.WorkQuery.FieldByName('ID').AsInteger;
      if not mtDokument.Locate('ID', nIDMen, []) then begin
        if dmBase.tbMens.Locate('DATE_FIKS;ID', VarArrayOf([dmBase.WorkQuery.FieldByName('DATE_FIKS').AsDateTime, nIDMen]),[]) then begin
          Result:=ReadOneMen(nIDMen, true, nil);
          if Result then begin
            Inc(n,1);
            EditDataSet(mtDokument);
//            mtDokumentOTNOSH.AsString:='';
            mtDokumentNSTR.AsInteger:=n;
            mtDokumentFIRST.AsBoolean:=false;
            if nIDAdres>0
              then mtDokumentADRES_ID.AsInteger:=nIDAdres;
            if nIDLic>0
              then mtDokumentLIC_ID.AsInteger:=nIDLic;
            PostDataSet(mtDokument);
          end;
        end;
      end;
      dmBase.WorkQuery.Next;
    end;
    dmBase.WorkQuery.Close;
    FCurMen := 1;
    mtDokument.First;
  finally
    dbEnableControls(mtDokument,l);
    slPar.Free;
    dmBase.tbMens.Bookmark:=sBook;
    LicID:=curLicID; // !!!
  end;
end;

//---------------------------------------------------------------------------------
// прочитать всех людей по адресу
//---------------------------------------------------------------------------------
function TdmMen.ReadAllMensAdres(slLich : TStringList; IDAdres : Integer; slMens : TStringList): Boolean;
var
  oldInd : String;
  sl : TStringList;
  i,j,IDLich : Integer;
begin
  Result := true;
  ClearMens;
  oldInd := mtDokument.IndexFieldNames;
  dmBase.tbMens.IndexName := 'ADRES_LIC_KEY';  // DATE_FIKS;ADRES_ID;LIC_ID;NSTR

  sl := TStringList.Create;
  for j:=0 to slLich.Count-1 do begin
    IDLich:=StrToInt(slLich.Strings[j]);
    dmBase.tbMens.SetRange([DateFiks,IDAdres,IDLich],[DateFiks,IDAdres,IDLich]);
    while not dmBase.tbMens.Eof do begin
      sl.Add(dmBase.tbMens.Bookmark);
      dmBase.tbMens.Next;
    end;
    dmBase.tbMens.CancelRange;
  end;

  for i:=0 to sl.Count-1 do begin
    dmBase.tbMens.Bookmark:=sl.Strings[i];
    if slMens<>nil then slMens.Add(dmBase.tbMens.FieldByName('ID').AsString);
    Result := ReadOneMen(dmBase.tbMens.FieldByName('ID').AsInteger, true, nil);
  end;

  sl.Free;

  // при чтении проставим номера по порядку
  IsReadDokument:=true;
  FCurMen := 1;
  mtDokument.IndexFieldNames:='';
  mtDokument.First;
  while not mtDokument.Eof do begin
    mtDokument.Edit;
    mtDokumentNSTR.AsInteger:=FCurMen;
    Inc(fCurMen,1);
    if mtDokumentLIC_ID.AsInteger=0 then begin
      mtDokumentNOMER.AsString:='';    // нет номера лиц. счета
    end else begin
      {$IFNDEF OCHERED}
      if dmBase.tbLich.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,mtDokumentLIC_ID.AsInteger]), []) then begin
        mtDokumentNOMER.AsString:=dmBase.tbLich.FieldByName('NOMER').AsString;
      end;
      {$ENDIF}
    end;

    if IDAdres>0 then begin
      mtDokumentADRES_ID.AsInteger := IDAdres;
    end;
    mtDokument.Post;
    mtDokument.Next;
  end;
  FCurMen := 1;
  LicID := -999;
  mtDokument.IndexFieldNames:='NSTR';
  mtDokument.First;
  SetMaster;
  IsReadDokument:=false;
  DvigMod:=false;
end;

function TdmMen.ReadDokument(ID: Integer; slPar : TStringList): Boolean;
//var
//  old : TCursor;
//  l1,l2:Boolean;
begin
//  old := Screen.Cursor;
//  Screen.Cursor := crHourGlass;
  try
  ClearMens;
//  l1:=dbDisableControls(mtDokument);
//  l2:=dbDisableControls(tbMigr);

  Result := ReadOneMen(ID,false,slPar);

//  dbEnableControls(mtDokument,l1);
//  dbEnableControls(tbMigr,l2);

  AddRead(LicID,ID);
  SetMaster;
  DvigMod:=false;
  finally
//  Screen.Cursor := old;
  end;
end;

function TdmMen.GetAdresAndTelefon : String;
begin
  Result:=mtDokumentADRES_GIT.AsString;
end;

procedure TdmMen.AddRead(IDLich : Integer; ID : Integer);
//var
//  adr : TAdres;
//  s : String;
begin
{
  AdresAndTelefon:='';
  if LicID>0 then begin
    adr := dmBase.AdresLic(DateFiks, IntToStr(IDLich) );
    // лицевой счет найден и в таблице ЛицевыхСчетов мы стоим на этой записи
    if (adr.LicID>0) and (adr.AdresID>0) then begin
      AdresAndTelefon := adr.Punkt + ', ' + adr.UlicaDom;
      s := dmBase.tbLich.FieldByName('TELEFON').AsString;
      if s<>''
        then AdresAndTelefon := AdresAndTelefon + ', телефон: ' + s;
    end;
  end;
}
end;

//----- реквизит ADRES_ID должен быть заполнен -----------------------
function TdmMen.MustAdres : Boolean;
begin
  // человек проживает или постоянно зарегистрирован на территории
  if mtDokumentKATEG.AsInteger=BEZ_ADRESA
    then Result:=false
    else Result:=true;
end;
//-----------------------------------------------------------------
function TdmMen.CheckTypeReg : String;
var
  s:String;
begin
  s:='';
  if not mtDokumentDATES.IsNull then begin
    if mtDokumentPOL.AsString='М' then s:='Умер' else s:='Умерла';
  end else begin
    if mtDokumentPROPIS.AsBoolean then begin
      if mtDokumentPRESENT.AsBoolean
        then s:='Зарегистрирован и проживает на территории совета'
        else s:='Зарегистрирован и временно отсутствует на территории совета';
    end else begin
      if mtDokumentPRESENT.AsBoolean
        then s:='Не зарегистрирован, но фактически проживает на территории совета'
        else s:='Не зарегистрирован и не проживает на территории совета';
    end;
    if mtDokumentPOL.AsString='Ж' then s:=StringReplace(s,'арегистрирован','арегистрирована',[rfIgnoreCase]);
  end;
  Result:=s;
end;
//-----------------------------------------------------------
procedure TdmMen.SetAPROP(adr:TAdres);
begin
  mtDokumentADRES_PROP.Value := adr.AdresPropis;
  mtDokumentAPROP_PN.Value   := adr.Punkt;
  mtDokumentAPROP_OBL.Value  := adr.Obl;
  mtDokumentAPROP_RN.Value   := adr.Raion;
  mtDokumentAPROP_UL.Value   := adr.Ulica;
  mtDokumentAPROP_DOM.Value  := adr.NDom;
  mtDokumentAPROP_KORP.Value := adr.Korp;
  mtDokumentAPROP_KV.Value   := adr.Kv;
end;
//-----------------------------------------------------------
function TdmMen.GetAPROP:TAdres;
begin
  Result.AdresPropis:=mtDokumentADRES_PROP.Value;
  Result.Punkt:=mtDokumentAPROP_PN.Value;
  Result.PunktN:=Result.Punkt;
  Result.Obl:=mtDokumentAPROP_OBL.Value;
  Result.Raion:=mtDokumentAPROP_RN.Value;
  Result.Ulica:=mtDokumentAPROP_UL.Value;
  Result.NDom:=mtDokumentAPROP_DOM.Value;
  Result.Korp:=mtDokumentAPROP_KORP.Value;
  Result.Kv:=mtDokumentAPROP_KV.Value;

  Result.Propis:=false;
  if (Result.AdresPropis='') or (Pos('не известен',ANSILowerCase(Result.AdresPropis) )>0) then begin
    Result.AdresPropis:='не известен';
    Result.OnlyText:=true;
  end else begin
    if Result.Ulica=''
      then Result.PunktUlica:=Result.Punkt
      else Result.PunktUlica:=Result.Punkt+', '+Result.Ulica;
    Result.Dom := dmBase.getDom(Result.NDom,Result.Korp,Result.Kv,'',false);
    Result.Dom2:= Result.Dom;
    if (Result.Dom='') and (Result.Punkt='') and (Result.Obl='') and (Result.Raion='')
      then Result.OnlyText:=true;
  end;
end;
//-------------------------------------------------------------------------------
function TdmMen.ReadOneMen(ID: Integer; lCurr : Boolean; slPar : TStringList): Boolean;
var
  vKeyValues : Variant;
  lFind,lErr : Boolean;
  lLoadMigr,lLoadAdd,lLoadVus,lLoadOch,lLoad_Pr_Lg_Hist,l:Boolean;
  IDInternal,i : Integer;
  IDAdres : Integer;
  s,sValue,sName:String;
  adr:Tadres;
  arrRec:TCurrentRecord;
begin
  Result:=true;

  lLoadMigr:=true;
  lLoadVus:=true;
  lLoadOch:=true;
  lLoadAdd:=true;
  lLoad_Pr_Lg_Hist:=true;
  if (slPar<>nil) and (slPar.Count>0) then begin
    for i:=0 to slPar.Count-1 do begin
      sValue := UpperCase(slPar.ValueFromIndex[i]);
      sName  := UpperCase(slPar.Names[i]);
      if sName='ALLADD' then begin
        if sValue='0' then begin
          lLoadMigr:=false;
          lLoadVus:=false;
          lLoadOch:=false;
          lLoadAdd:=false;
          lLoad_Pr_Lg_Hist:=false;
        end;
      end else if sName='MIGR' then begin
        if sValue='0' then lLoadMigr:=false;
      end else if sName='VUS' then begin
        if sValue='0' then lLoadVus:=false;
      end else if sName='OCH' then begin
        if sValue='0' then lLoadOch:=false;
      end else if sName='ADD' then begin
        if sValue='0' then lLoadAdd:=false;
      end else if sName='PR_LG_HIST' then begin
        if sValue='0' then lLoad_Pr_Lg_Hist:=false;
      end;
    end;
  end;
  IsReadDokument:=true;
  sDelMens:='';   // применяестя для очередников
  if lCurr then begin
    lFind := true;
    LicID:=dmBase.tbMens.FieldByNAme('LIC_ID').AsInteger;
  end else begin
    if ID>0 then begin
      vKeyValues := VarArrayCreate( [0, 1], varOleStr );
      vKeyValues[0] := DateFiks;
      vKeyValues[1] := ID;
      lFind := dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []);
      LicID:=dmBase.tbMens.FieldByNAme('LIC_ID').AsInteger;
    end else begin
      lFind := false;
      LicID:=0;
    end;
  end;
//  l:=dbDisableControls(mtDokument);
  try
  mtDokument.Append;
  mtDokumentDATE_FIKS.AsDateTime := DateFiks;
  mtDokumentID_BASE.AsInteger:=0;  // !!!!

  if lFind then begin
    with dmBase.tbMens do begin
      try
        lErr := false;
        mtDokumentNEWMEN.AsBoolean:=false;

        mtDokumentLIC_ID.AsInteger:=LicID;
        if FieldByName('ID_BASE').IsNull
          then mtDokumentID_BASE.AsInteger:=0
          else mtDokumentID_BASE.AsInteger:=FieldByName('ID_BASE').AsInteger;

        WriteDateField(mtDokumentDATE_FIKS,FieldByName('DATE_FIKS'));
        WriteField( mtDokumentID,  FieldByName('ID'), lErr );
        WriteField( mtDokumentNSTR,  FieldByName('NSTR'), lErr );
        WriteField( mtDokumentFIRST,   FieldByName('FIRST'), lErr );

//        if mtDokumentFIRST.AsBoolean=true then begin
//          mtDokumentOTNOSH.AsString:='';
//          mtDokumentNOMER_SEM.AsInteger:=0;
//        end else begin
          WriteField( mtDokumentOTNOSH,  FieldByName('OTNOSH'), lErr );
          WriteField( mtDokumentNOMER_SEM, FieldByName('NOMER_SEM'), lErr );
//        end;

        WriteField( mtDokumentSEM,  FieldByName('SEM'), lErr );
        WriteField( mtDokumentFAMILIA, FieldByName('FAMILIA'), lErr );
        WriteField( mtDokumentNAME,    FieldByName('NAME'), lErr );
        WriteField( mtDokumentOTCH,    FieldByName('OTCH'), lErr );
        WriteField( mtDokumentPOL, FieldByName('POL'), lErr );
        if mtDokumentPOL.AsString='' then mtDokumentPOL.AsString:='М';
        WriteField( mtDokumentDATER, FieldByName('DATER'), lErr );

        WriteField( mtDokumentPA_ID, FieldByName('PA_ID'), lErr );
        WriteField( mtDokumentMA_ID, FieldByName('MA_ID'), lErr );

        WriteField( mtDokumentNEW_ID, FieldByName('NEW_ID'), lErr );

        WriteField( mtDokumentOWNER_ID, FieldByName('OWNER_ID'), lErr );
//        if mtDokumentNOMER_SEM.IsNull      then mtDokumentNOMER_SEM.AsInteger:=0;
//        if mtDokumentNOMER_SEM.AsInteger>1 then mtDokumentNOMER_SEM.AsInteger:=1;

        WriteField( mtDokumentAKT_ROGD_NOMER, FieldByName('AKT_ROGD_NOMER'), lErr );
        WriteField( mtDokumentAKT_ROGD_DATE, FieldByName('AKT_ROGD_DATE'), lErr );
        WriteField( mtDokumentNATION, FieldByName('NATION'), lErr );
        WriteField( mtDokumentCITIZEN, FieldByName('CITIZEN'), lErr );
        WriteField( mtDokumentOBRAZ, FieldByName('OBRAZ'), lErr );
        WriteField( mtDokumentTELEFON, FieldByName('TELEFON'), lErr );
        WriteField( mtDokumentTELEFON_M, FieldByName('TELEFON_M'), lErr );
        WriteField( mtDokumentSTUDENT, FieldByName('STUDENT'), lErr );
        WriteField( mtDokumentSTUDENT_TYPE, FieldByName('STUDENT_TYPE'), lErr );
        WriteField( mtDokumentSTUDENT_SPR, FieldByName('STUDENT_SPR'), lErr );
        //WriteField( mtDokumentSTUD_PLACE, FieldByName('AKT_ROGD_DATE'), lErr );
        WriteField( mtDokumentKURS, FieldByName('KURS'), lErr );
        WriteField( mtDokumentISWORK, FieldByName('ISWORK'), lErr );
        WriteField( mtDokumentWORKSELO, FieldByName('WORKSELO'), lErr );
        WriteField( mtDokumentWORK_SPR, FieldByName('WORK_SPR'), lErr );
        WriteField( mtDokumentWORK_TELEF, FieldByName('WORK_TELEF'), lErr );
        //WriteField( mtDokumentWORK_NAME, FieldByName('WORK_NAME'), lErr );
        WriteField( mtDokumentDOLG_SPR, FieldByName('DOLG_SPR'), lErr );
        WriteField( mtDokumentDOLG_NAME, FieldByName('DOLG_NAME'), lErr );
        WriteField( mtDokumentCANDELETE, FieldByName('CANDELETE'), lErr );
        WriteField( mtDokumentDATEZ, FieldByName('DATEZ'), lErr );
        WriteField( mtDokumentCOUNT_ZEK, FieldByName('COUNT_ZEK'), lErr );
        WriteField( mtDokumentPASP_UDOST, FieldByName('PASP_UDOST'), lErr );
        WriteField( mtDokumentPASP_SERIA, FieldByName('PASP_SERIA'), lErr );
        WriteField( mtDokumentPASP_NOMER, FieldByName('PASP_NOMER'), lErr );
        WriteField( mtDokumentPASP_DATE, FieldByName('PASP_DATE'), lErr );
        WriteField( mtDokumentPASP_SROK, FieldByName('PASP_SROK'), lErr );
        //WriteField( mtDokumentPASP_VIDAN, FieldByName('PASP_NOMER'), lErr );
        WriteField( mtDokumentLICH_NOMER, FieldByName('LICH_NOMER'), lErr );
        WriteField( mtDokumentDATES, FieldByName('DATES'), lErr );
        WriteField( mtDokumentAKT_SMER_NOMER, FieldByName('AKT_SMER_NOMER'), lErr );
        WriteField( mtDokumentAKT_SMER_DATE, FieldByName('AKT_SMER_DATE'), lErr );
        WriteField( mtDokumentPENS_TIP, FieldByName('PENS_TIP'), lErr );
        WriteField( mtDokumentPENS_DATE, FieldByName('PENS_DATE'), lErr );
        WriteField( mtDokumentPENS_KNIGA, FieldByName('PENS_KNIGA'), lErr );
        WriteField( mtDokumentDATEP, FieldByName('DATEP'), lErr );
        WriteField( mtDokumentDATEV, FieldByName('DATEV'), lErr );
        WriteField( mtDokumentSPEC_UCH, FieldByName('SPEC_UCH'), lErr );

        WriteField( mtDokumentKATEG, FieldByName('KATEG'), lErr );
        if mtDokumentKATEG.IsNull then mtDokumentKATEG.Asinteger:=LIC_REG;

        WriteField( mtDokumentADRES_ID_GIT, FieldByName('ADRES_ID_GIT'), lErr );

        mtDokumentFIRST_NOTMY.AsBoolean:=(mtDokumentKATEG.Asinteger=FIRST_NOTMY);

        WriteDateField(mtDokumentDATE_SROK,FieldByName('DATE_SROK'));
        WriteDateField(mtDokumentDATE_SROK_DN,FieldByName('DATE_SROK_DN'));

        if mtDokumentSPEC_UCH.IsNull then mtDokumentSPEC_UCH.AsBoolean:=false;

        WriteField( mtDokumentNOTSELECT, FieldByName('NOTSELECT'), lErr );
        if mtDokumentNOTSELECT.IsNull then mtDokumentNOTSELECT.AsBoolean := false;

        WriteField( mtDokumentNOTDELETE, FieldByName('NOTDELETE'), lErr );
        if mtDokumentNOTDELETE.IsNull then mtDokumentNOTDELETE.AsBoolean := false;

        if mtDokumentPASP_UDOST.IsNull then mtDokumentPASP_UDOST.AsInteger := 1;

        WriteField( mtDokumentUNP, FieldByName('UNP'), lErr );

        // внутренний код
        IDInternal := mtDokumentID_INTERNAL.AsInteger;

        //---- очередь ------
        {$IFDEF OCHERED}
          mtDokumentOCHERED.AsBoolean := true;
        {$ELSE}
          WriteField( mtDokumentOCHERED, FieldByName('OCHERED'), lErr );
          if mtDokumentOCHERED.IsNull then mtDokumentOCHERED.AsBoolean := false;
        {$ENDIF}

        if lLoadOch
          then ReadOchered(mtDokumentID.AsInteger,IDInternal);

        //---- ВУС ------
        WriteField( mtDokumentVUS, FieldByName('VUS'), lErr );
        mtDokumentADD_ADRES_GIT.AsBoolean := false;  // дополнительный адрес жительства может быть введен для ВУС


        if lLoadAdd  // дополнительные сведения
          then ReadMenAdd(mtDokumentID.AsInteger);

        if lLoadVus
          then ReadVUS(mtDokumentID.AsInteger, IDInternal);

        //------------- прочитаем св-ва хранящиеся в базе свойств ----------
        // читаем из базы длинных строк
        mtDokumentPASP_VIDAN.Value := dmBase.ReadOneProp(DateFiks, ID, 'PASP_VIDAN', ftMemo);
//        mtDokumentWORK_NAME.Value  := dmBase.ReadOneProp(DateFiks, ID, 'WORK_NAME', ftMemo);
        // если заполнен код учебного заведения
        if mtDokumentSTUDENT_SPR.AsString<>'' then begin
          if dmBase.SprUchZaved.Locate('ID', mtDokumentSTUDENT_SPR.AsString, []) then begin
            mtDokumentSTUD_PLACE.AsString := dmBase.SprUchZaved.FieldByName('NAME').AsString;
          end else begin
            mtDokumentSTUD_PLACE.AsString := '';
          end;
        end else begin
          mtDokumentSTUD_PLACE.Value := dmBase.ReadOneProp(DateFiks, ID, 'STUD_PLACE', ftMemo);
        end;

        WriteField( mtDokumentPROPIS, FieldByName('PROPIS'), lErr );
        if mtDokumentPROPIS.IsNull then mtDokumentPROPIS.AsBoolean := true;

        WriteField( mtDokumentPRESENT, FieldByName('PRESENT'), lErr );
        if mtDokumentPRESENT.IsNull then mtDokumentPRESENT.AsBoolean:=true;
//        mtDokumentPRESENTex.AsBoolean := mtDokumentPRESENT.AsBoolean;   // !!!

        //------- человек живет на лицевом счете ---------
        if (LicID>0) and (mtDokumentCANDELETE.AsBoolean=false) then begin
          // человек состоящий на лицевом счете и не зарегистрированный на террироии ДОЛЖЕН ХОТЯБЫ ПРОЖИВАТЬ
          if not mtDokumentPROPIS.AsBoolean then begin
            if mtDokumentFIRST.AsBoolean and mtDokumentFIRST_NOTMY.AsBoolean then begin
              //  !!!    глава лицеаого счета может не проживать
            end else begin
              mtDokumentPRESENT.AsBoolean:=true;
            end;
//            mtDokumentPRESENTex.AsBoolean:=true;
          end;
        end else begin

        end;

        //======== прочитаем адрес ====================================
        {$IFDEF OCHERED}
          IDAdres:=FieldByName('ADRES_ID').AsInteger;
          adr:=dmBase.AdresMen(dmbase.GetDateCurrentSost,mtDokumentID.AsString,s,true,false);
          mtDokumentADRES_ID.AsInteger:=IDAdres;
          mtDokumentBEZADRESA.AsBoolean:=(IDAdres=0);
          if mtDokumentBEZADRESA.AsBoolean and (mtDokumentKATEG.AsInteger<>BEZ_ADRESA) then begin
            mtDokumentKATEG.AsInteger:=BEZ_ADRESA;
          end;
          if mtDokumentBEZADRESA.AsBoolean then begin
            if adr.OnlyText then begin
              mtDokumentTEXT_ADRES.AsString:=adr.AdresPropis;
            end else begin
              SetAPROP(adr);
              {
              mtDokumentADRES_PROP.Value := adr.AdresPropis;
              mtDokumentAPROP_PN.Value   := adr.Punkt;
              mtDokumentAPROP_OBL.Value  := adr.Obl;
              mtDokumentAPROP_RN.Value   := adr.Raion;
              mtDokumentAPROP_UL.Value   := adr.Ulica;
              mtDokumentAPROP_DOM.Value  := adr.NDom;
              mtDokumentAPROP_KORP.Value := adr.Korp;
              mtDokumentAPROP_KV.Value   := adr.Kv;
              }
            end;
          end;
        {$ELSE}
          IDAdres := 0;
          if LicID>0 then begin  // попробуем прочитать адрес из лицевого
            if (LicID=dmBase.tbLich.FieldByName('ID').AsInteger) or
               dmBase.tbLich.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,LicID]), []) then begin
              TelefonFromLic:=Trim(dmBase.tbLich.FieldByName('TELEFON').AsString);
              IDAdres:=dmBase.tbLich.FieldByName('ADRES_ID').AsInteger;
              // если человек не имеет отдельного адреса жительства, то прочитаем телефон из лиц.счета (для места жительства ВУС)
              if mtDokumentADD_ADRES_GIT.AsBoolean=false then begin
//                s := dmBase.tbLich.FieldByName('TELEFON').AsString;
//                if s<>'' then s:=', телефон: '+s;
                mtDokumentADRES_GIT.AsString:=dmBase.AdresFromIDEx(DateFiks,IntToStr(IDAdres),false, true);
                if mtDokumentAGIT_TEL.AsString=''
                  then mtDokumentAGIT_TEL.AsString:=TelefonFromLic;
              end;
            end;
          end;
          if (IDAdres=0) and (FieldByName('ADRES_ID').AsString<>'') then begin
            IDAdres := FieldByName('ADRES_ID').AsInteger;
          end;
          // если человек прописан на территории, то адрес прописки ADRES_PROP должен буть пустой
          if mtDokumentPROPIS.AsBoolean then begin
            mtDokumentADRES_PROP.Value := '';
          end else begin
            mtDokumentADRES_PROP.Value := dmBase.ReadOneProp(DateFiks, ID, 'ADRES_PROP', ftMemo);
            if mtDokumentADRES_PROP.AsString<>'' then begin
              mtDokumentAPROP_PN.Value   := dmBase.ReadOneProp(DateFiks, ID, 'APROP_PN', ftMemo);
              // если не введено название нас. пункта, то нечего дальше читать
              if mtDokumentAPROP_PN.AsString<>'' then begin
                mtDokumentAPROP_OBL.Value  := dmBase.ReadOneProp(DateFiks, ID, 'APROP_OBL', ftMemo);
                mtDokumentAPROP_RN.Value   := dmBase.ReadOneProp(DateFiks, ID, 'APROP_RN', ftMemo);
  //              mtDokumentAPROP_TP.Value   := dmBase.ReadPropAsInteger(DateFiks, ID, 'APROP_TP');
  //              mtDokumentAPROP_TU.Value   := dmBase.ReadPropAsInteger(DateFiks, ID, 'APROP_TU');
                mtDokumentAPROP_UL.Value   := dmBase.ReadOneProp(DateFiks, ID, 'APROP_UL', ftMemo);
                mtDokumentAPROP_DOM.Value  := dmBase.ReadPropAsString(DateFiks, ID, 'APROP_DOM');
                mtDokumentAPROP_KORP.Value := dmBase.ReadPropAsString(DateFiks, ID, 'APROP_KORP');
                mtDokumentAPROP_KV.Value   := dmBase.ReadPropAsString(DateFiks, ID, 'APROP_KV');
              end;
            end;
          end;
          mtDokumentADRES_ID.AsInteger:=IDAdres;
          mtDokumentBEZADRESA.AsBoolean:=(IDAdres=0);
          if mtDokumentBEZADRESA.AsBoolean and (mtDokumentKATEG.AsInteger<>BEZ_ADRESA) then begin
            mtDokumentKATEG.AsInteger:=BEZ_ADRESA;
          end;
        {$ENDIF}
        //========== end read adres ====================================

        if mtDokumentWORK_SPR.AsString<>'' then begin
          if dmBase.SprWork.Locate('ID', mtDokumentWORK_SPR.AsString, []) then begin
            mtDokumentWORK_NAME.AsString := dmBase.SprWork.FieldByName('NAME').AsString;
          end else begin
            mtDokumentWORK_NAME.AsString := '';
          end;
        end else begin
          mtDokumentWORK_NAME.Value := dmBase.ReadOneProp(DateFiks, ID, 'WORK_NAME', ftMemo);
        end;

        if mtDokumentDOLG_SPR.AsString<>'' then begin
          if dmBase.SprDolg.Locate('ID', mtDokumentDOLG_SPR.AsString, []) then begin
            mtDokumentDOLG_NAME.AsString := dmBase.SprDolg.FieldByName('NAME').AsString;
          end else begin
            mtDokumentDOLG_NAME.AsString := '';
          end;
        end;

        mtDokumentOTM_NATION.Value := dmBase.ReadOneProp(DateFiks, ID, 'OTM_NATION', ftMemo);
        mtDokumentADD_INFO.Value   := dmBase.ReadOneProp(DateFiks, ID, 'ADD_INFO', ftMemo);
       //-----движение человека ------------------------------------------------------
      //  tbMigr.EmptyTable;
        if lLoadMigr then begin
          with dmBase.tbMensDvig do begin
            IndexName := 'PR_KEY';
            SetRange([DateFiks,ID],[DateFiks,ID]);
            while not Eof do begin
              tbMigr.Append;
              tbMigrID_INTERNAL.AsInteger := IDInternal;
              WriteDateField(tbMigrDATE, FieldByName('DATE'));
              WriteDateField(tbMigrDATE_SROK,FieldByName('DATE_SROK'));
              tbMigrTIP.Value := FieldByName('TIP').Value;
              tbMigrPRICH.AsString := FieldByName('PRICH').AsString;
              tbMigrTALON.AsString := FieldByName('TALON').AsString;
              tbMigrCONTANT.AsString := FieldByName('CONTANT').AsString;
              tbMigrKOMM.Value := FieldByName('KOMM').Value;
              tbMigrORGAN.Value := FieldByName('ORGAN').Value;

              tbMigrOP_B_RESP.AsBoolean:=FieldByName('OP_B_RESP').asBoolean;
              tbMigrOP_GOSUD.AsString:=FieldByName('OP_GOSUD').AsString;
              tbMigrOP_B_OBL.AsBoolean:=FieldByName('OP_B_OBL').AsBoolean;
              tbMigrOP_OBL.AsString:=FieldByName('OP_OBL').AsString;
              tbMigrOP_RAION.AsString:=FieldByName('OP_RAION').AsString;
              tbMigrOP_B_GOROD.AsString:=FieldByName('OP_B_GOROD').AsString;
              tbMigrOP_GOROD.AsString:=FieldByName('OP_GOROD').AsString;

              tbMigr.Post;
              Next;
            end;
  //          if not tbMigr.Eof then begin
  //          end;
            CancelRange;
          end;
        end;

        // проверим корректность даты срока регистрации (убытия)  (добавлено 23.07.2010)
        if (tbMigr.RecordCount>0) and not mtDokumentDATE_SROK.IsNull then begin
          tbMigr.Last;
          // временно, и дата не заполнена
          if (tbMigrCONTANT.AsString='0') and tbMigrDATE_SROK.IsNull then begin
            tbMigr.Edit;
            tbMigrDATE_SROK.AsDateTime:=mtDokumentDATE_SROK.AsDateTime;
            tbMigr.Post;
          end;
        end;
        tbMigr.First;

        //---определим, что человек зарегестрирован постоянно и не умер ------------
//        lOk:=false;
//        if (mtDokumentDATES.AsString='') then begin
//          if mtDokumentPROPIS.AsBoolean and
//        end;
        //-------------------------------------------------------------------------
        if lLoad_Pr_Lg_Hist then begin
          //----- признаки ------------------------------------------------------
  //        tbPriznaki.EmptyTable;
          with dmBase.tbMensPr do begin
            IndexName := 'PR_KEY';
            SetRange([DateFiks,ID],[DateFiks,ID]);
            while not Eof do begin
              tbPriznaki.Append;
              tbPriznakiID_INTERNAL.AsInteger := IDInternal;
              tbPriznakiKOD.Value := FieldByName('KOD').Value;
              tbPriznaki.Post;
              Next;
            end;
            CancelRange;
          end;
          //----- льготы ------------------------------------------------------
          with dmBase.tbMensLgot do begin
            IndexName := 'PR_KEY';
            SetRange([DateFiks,ID],[DateFiks,ID]);
            while not Eof do begin
              tbLgot.Append;
              tbLgotID_INTERNAL.AsInteger := IDInternal;
              tbLgotKOD.Value := FieldByName('KOD').Value;
              tbLgot.Post;
              Next;
            end;
            CancelRange;
          end;
           //----- история ------------------------------------------------------
           ReadHistory(ID,IDinternal,dmBase.TypeObj_Nasel,false);
           //----- решения ------------------------------------------------------
           ReadReshObj(ID,IDinternal,dmBase.TypeObj_Nasel,false);
        end;
      except
        on E: Exception do begin
          PutError(E.Message);
          Result := false;
        end;
      end;
      if lErr then Result := false;
    end;
  end else begin
    Result := false;
  end;
  if mtDokumentID.AsInteger <= 0 then begin
    mtDokumentNEWMEN.AsBoolean:=true;
    AfterCreateDokument;
  end else begin
    mtDokumentNEWMEN.AsBoolean:=false;
    AfterReadDokument;
  end;
  mtDokumentPA_FIO.AsString:=dmBase.FIOMen(DateFiks,mtDokumentPA_ID.AsString);
  mtDokumentMA_FIO.AsString:=dmBase.FIOMen(DateFiks,mtDokumentMA_ID.AsString);
  if dmBase.getMenFields(DateFiks,mtDokumentSuprug_ID.AsString, '', arrRec) then begin
    mtDokumentSuprug.AsString:=GetValueFieldEx(arrRec, 'FIO', '');
    WriteDateFieldV(mtDokumentSuprug_DateR, GetValueFieldEx(arrRec, 'DATER', null));
  end;

  PostDataSet(mtDokument);
  finally
//    dbEnableControls(mtDokument,l);
  end;

  IsReadDokument:=false;
end;

//-----------------------------------------------------------------
// должен быть установлен Master\Detail на подчиненные списки
function TdmMen.WriteOneMen( IDLich : Integer; IDFirst : Integer; IDAdres : Integer; var IDRealFirst : Integer; lCurr : Boolean ): Boolean;
var
  vKeyValues : Variant;
  lErr, lFind : Boolean;
  ID : Integer;
  nCurIDAdres:Integer;
begin
  IsReadDokument:=true;
  Result := true;
  // не писать человека если фамилия пустая
  if mtDokumentFAMILIA.AsString = '' then begin
    Result := false;
    IsReadDokument:=false;
    exit;
  end;

  // в AfterCreateDokument уже вызывается dmBase.GetNewID( dmBase.TypeObj_Nasel )
  if mtDokumentID.IsNull or (mtDokumentID.AsInteger<1) then begin  // нет еще ID
    ID := dmBase.GetNewID( dmBase.TypeObj_Nasel );
    if ID > 0 then begin
      EditDataSet(mtDokument);
      mtDokumentID.AsInteger := ID;
      PostDataSet(mtDokument);
    end;
  end;
  ID := mtDokumentID.AsInteger;
  // ошибка при выдаче нового ID
  if ID<=0 then begin
    Result := false;
    IsReadDokument:=false;
    exit;
  end;
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  vKeyValues[0] := DateFiks;
  vKeyValues[1] := ID;
  lFind := dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []);
  if not lFind then begin
    dmBase.tbMens.Append;
    dmBase.tbMens.FieldByName('DATE_FIKS').AsDateTime := DateFiks;
    dmBase.tbMens.FieldByName('ID').AsInteger := ID;
  end else begin
    dmBase.tbMens.Edit;
  end;
  with dmBase.tbMens do begin
    try
      lErr := false;
      if IDLich < 0 then begin
        // не трогаем номер лицевого счета
        //FieldByName('LIC_ID').AsString := '';
      end else if IDLich=0 then begin
        FieldByName('LIC_ID').AsInteger := 0;
      end else begin
        FieldByName('LIC_ID').AsInteger := IDLich;
      end;

      //------ запишем адрес ------------------------------------
      if IDAdres<0 then begin
        // не трогаем адрес
      end else begin
        if MustAdres then FieldByName('ADRES_ID').AsInteger := IDAdres
                     else FieldByName('ADRES_ID').AsInteger := 0;
      end;

      nCurIDAdres:=FieldByName('ADRES_ID').AsInteger;

      if mtDokumentPROPIS.AsBoolean then begin  // человек зарегистрирован в совете
        if dmBase.DeleteProp(DateFiks, ID, 'ADRES_PROP', ftMemo) then begin
          dmBase.DeleteProp(DateFiks, ID, 'APROP_OBL', ftMemo);
          dmBase.DeleteProp(DateFiks, ID, 'APROP_RN', ftMemo);
          dmBase.DeleteProp(DateFiks, ID, 'APROP_PN', ftMemo);
          dmBase.DeleteProp(DateFiks, ID, 'APROP_UL', ftMemo);
          dmBase.DeleteProp(DateFiks, ID, 'APROP_DOM', ftString);
          dmBase.DeleteProp(DateFiks, ID, 'APROP_KORP', ftString);
          dmBase.DeleteProp(DateFiks, ID, 'APROP_KV', ftString);
        end;
      end else begin
        dmBase.WriteProp(DateFiks, ID, mtDokument, 'ADRES_PROP', dmBase.TypeObj_Nasel);
        if mtDokumentADRES_PROP.AsString<>'' then begin
          dmBase.WriteProp(DateFiks, ID, mtDokument, 'APROP_OBL', dmBase.TypeObj_Nasel);
          dmBase.WriteProp(DateFiks, ID, mtDokument, 'APROP_RN', dmBase.TypeObj_Nasel);
//          dmBase.WriteProp(DateFiks, ID, mtDokument, 'APROP_TP', dmBase.TypeObj_Nasel);
          dmBase.WriteProp(DateFiks, ID, mtDokument, 'APROP_PN', dmBase.TypeObj_Nasel);
//          dmBase.WriteProp(DateFiks, ID, mtDokument, 'APROP_TU', dmBase.TypeObj_Nasel);
          dmBase.WriteProp(DateFiks, ID, mtDokument, 'APROP_UL', dmBase.TypeObj_Nasel);
          dmBase.WriteProp(DateFiks, ID, mtDokument, 'APROP_DOM', dmBase.TypeObj_Nasel);
          dmBase.WriteProp(DateFiks, ID, mtDokument, 'APROP_KORP', dmBase.TypeObj_Nasel);
          dmBase.WriteProp(DateFiks, ID, mtDokument, 'APROP_KV', dmBase.TypeObj_Nasel);
        end;
      end;
      //---------------------------------------------------------

      // при записи списка людей из лиц. счета проставим по порядку номера
      if lCurr and (FCurMen>0) then begin
        FieldByName('NSTR').AsInteger := FCurMen;
      end else begin
        WriteField( FieldByName('NSTR'), mtDokumentNSTR, lErr );
      end;
      IF IDFirst > -1 then begin
        // пишем главу хозяйства
        IF IDFirst = mtDokumentID_INTERNAL.AsInteger then begin
          FieldByName('FIRST').AsBoolean := true;
          IDRealFirst := ID;
        end else begin
          FieldByName('FIRST').AsBoolean := false;
        end;
      end;
      //--- если глава лицевого счета ----
//      if FieldByName('FIRST').AsBoolean=true then begin
//        FieldByName('NOMER_SEM').AsInteger:=0;
//        FieldByName('OTNOSH').AsString:='';
//      end else begin
        WriteField( FieldByName('NOMER_SEM'), mtDokumentNOMER_SEM, lErr );
        WriteField( FieldByName('OTNOSH'), mtDokumentOTNOSH, lErr );
//      end;

      if mtDokumentID_BASE.IsNull
        then FieldByName('ID_BASE').AsInteger:=0
        else FieldByName('ID_BASE').AsInteger:=mtDokumentID_BASE.AsInteger;

      WriteField( FieldByName('FAMILIA'), mtDokumentFAMILIA, lErr );
      WriteField( FieldByName('NAME'),mtDokumentNAME, lErr );
      WriteField( FieldByName('OTCH'),mtDokumentOTCH, lErr );
      WriteField( FieldByName('POL'), mtDokumentPOL, lErr );
      WriteField( FieldByName('SEM'), mtDokumentSEM, lErr );
      WriteField( FieldByName('DATER'), mtDokumentDATER, lErr );

      WriteField( FieldByName('PA_ID'), mtDokumentPA_ID, lErr );
      WriteField( FieldByName('MA_ID'), mtDokumentMA_ID, lErr );

      WriteField( FieldByName('NEW_ID'), mtDokumentNEW_ID, lErr );

      WriteField( FieldByName('OWNER_ID'), mtDokumentOWNER_ID, lErr );

      WriteField( FieldByName('AKT_ROGD_NOMER'), mtDokumentAKT_ROGD_NOMER, lErr );
      WriteField( FieldByName('AKT_ROGD_DATE'), mtDokumentAKT_ROGD_DATE, lErr );
      WriteField( FieldByName('NATION'), mtDokumentNATION, lErr );
      WriteField( FieldByName('CITIZEN'), mtDokumentCITIZEN, lErr );
      WriteField( FieldByName('OBRAZ'), mtDokumentOBRAZ, lErr );
      WriteField( FieldByName('TELEFON'), mtDokumentTELEFON, lErr );
      WriteField( FieldByName('TELEFON_M'), mtDokumentTELEFON_M, lErr );
      WriteField( FieldByName('STUDENT'), mtDokumentSTUDENT, lErr );
      WriteField( FieldByName('STUDENT_TYPE'), mtDokumentSTUDENT_TYPE, lErr );
      WriteField( FieldByName('STUDENT_SPR'), mtDokumentSTUDENT_SPR, lErr );
      //WriteField( FieldByName('STUD_PLACE'), mtDokumentSTUD_PLACE, lErr );
      WriteField( FieldByName('KURS'), mtDokumentKURS, lErr );
      WriteField( FieldByName('ISWORK'), mtDokumentISWORK, lErr );
      WriteField( FieldByName('WORKSELO'), mtDokumentWORKSELO, lErr );
      WriteField( FieldByName('WORK_SPR'), mtDokumentWORK_SPR, lErr );
      WriteField( FieldByName('WORK_TELEF'), mtDokumentWORK_TELEF, lErr );
      //WriteField( mtDokumentWORK_NAME, FieldByName('WORK_NAME'), lErr );
      WriteField( FieldByName('DOLG_SPR'), mtDokumentDOLG_SPR, lErr );
      WriteField( FieldByName('DOLG_NAME'), mtDokumentDOLG_NAME, lErr );
      WriteField( FieldByName('PRESENT'), mtDokumentPRESENT, lErr );
      WriteField( FieldByName('CANDELETE'), mtDokumentCANDELETE, lErr );
      WriteField( FieldByName('DATEZ'), mtDokumentDATEZ, lErr );
      WriteField( FieldByName('COUNT_ZEK'), mtDokumentCOUNT_ZEK, lErr );
      WriteField( FieldByName('PASP_UDOST'), mtDokumentPASP_UDOST, lErr );
      WriteField( FieldByName('PASP_SERIA'), mtDokumentPASP_SERIA, lErr );
      WriteField( FieldByName('PASP_NOMER'), mtDokumentPASP_NOMER, lErr );
      WriteField( FieldByName('PASP_DATE'), mtDokumentPASP_DATE, lErr );
      WriteField( FieldByName('PASP_SROK'), mtDokumentPASP_SROK, lErr );
      WriteField( FieldByName('LICH_NOMER'), mtDokumentLICH_NOMER, lErr );
      WriteField( FieldByName('DATES'), mtDokumentDATES, lErr );
      WriteField( FieldByName('AKT_SMER_NOMER'), mtDokumentAKT_SMER_NOMER, lErr );
      WriteField( FieldByName('AKT_SMER_DATE'), mtDokumentAKT_SMER_DATE, lErr );
      WriteField( FieldByName('PENS_TIP'), mtDokumentPENS_TIP, lErr );
      WriteField( FieldByName('PENS_DATE'), mtDokumentPENS_DATE, lErr );
      WriteField( FieldByName('PENS_KNIGA'), mtDokumentPENS_KNIGA, lErr );
      WriteField( FieldByName('DATEP'), mtDokumentDATEP, lErr );
      WriteField( FieldByName('DATEV'), mtDokumentDATEV, lErr );
      WriteField( FieldByName('VUS'), mtDokumentVUS, lErr );
      WriteField( FieldByName('SPEC_UCH'), mtDokumentSPEC_UCH, lErr );
      WriteField( FieldByName('NOTSELECT'), mtDokumentNOTSELECT, lErr );
      WriteField( FieldByName('NOTDELETE'), mtDokumentNOTDELETE, lErr );
      WriteField( FieldByName('PROPIS'), mtDokumentPROPIS, lErr );
      WriteDateField(FieldByName('DATE_SROK'),mtDokumentDATE_SROK);
      WriteDateField(FieldByName('DATE_SROK_DN'),mtDokumentDATE_SROK_DN);
      WriteField( FieldByName('UNP'), mtDokumentUNP, lErr );
      WriteField( FieldByName('KATEG'), mtDokumentKATEG, lErr );
      WriteField( FieldByName('ADRES_ID_GIT'), mtDokumentADRES_ID_GIT, lErr );

      {$IFDEF OCHERED}
        FieldByName('OCHERED').AsBoolean:=true;
      {$ELSE}
        WriteField( FieldByName('OCHERED'), mtDokumentOCHERED, lErr );
      {$ENDIF}

      WriteVUS(ID);

      WriteMenAdd(ID);

      PostDataSet(dmBase.tbMens);

      if mtDokumentNEWMEN.AsBoolean then begin
        EditDataSet(mtDokument);
        mtDokumentNEWMEN.AsBoolean:=false;
        PostDataSet(mtDokument);
      end;

      //------------------------------------------------------------------------------
//      n:=GetTickCount;
//    {   если человек состоит в составе семьи на очереди
      dmBase.tbSostavSem.IndexName:='MEMBER_ID';
      dmBase.tbSostavSem.SetRange([ID],[ID]);
      try
        while not dmBase.tbSostavSem.Eof do begin
           dmBase.tbSostavSem.Edit;
           dmBase.tbSostavSem.FieldByName('FAMILIA').AsString:=mtDokumentFAMILIA.AsString;
           dmBase.tbSostavSem.FieldByName('NAME').AsString:=mtDokumentNAME.AsString;
           dmBase.tbSostavSem.FieldByName('OTCH').AsString:=mtDokumentOTCH.AsString;
           dmBase.tbSostavSem.FieldByName('POL').AsString:=mtDokumentPOL.AsString;
           dmBase.tbSostavSem.FieldByName('LICH_NOMER').AsString:=mtDokumentLICH_NOMER.AsString;

           dmBase.tbSostavSem.FieldByName('PASP_UDOST').AsString:=mtDokumentPASP_UDOST.AsString;
           dmBase.tbSostavSem.FieldByName('PASP_SERIA').AsString:=mtDokumentPASP_SERIA.AsString;
           dmBase.tbSostavSem.FieldByName('PASP_NOMER').AsString:=mtDokumentPASP_NOMER.AsString;
           dmBase.tbSostavSem.FieldByName('PASP_VIDAN').AsString:=mtDokumentPASP_VIDAN.AsString;
           WriteDateField(dmBase.tbSostavSem.FieldByName('PASP_DATE'), mtDokumentPASP_DATE);

           WriteDateField(dmBase.tbSostavSem.FieldByName('DATER'), mtDokumentDATER);
           dmBase.tbSostavSem.Post;
           dmBase.tbSostavSem.Next;
        end;
      finally
        dmBase.tbSostavSem.CancelRange;
        dmBase.tbSostavSem.IndexName := 'PR_KEY';
      end;
//      ShowMessage(intToStr(GetTickCount-n));
//      }
      //------------------------------------------------------------------------------

      //------------- запишем св-ва хранящиеся в базе свойств ----------
      // пишем в базу длинных строк
      dmBase.WriteProp(DateFiks, ID, mtDokument, 'PASP_VIDAN', dmBase.TypeObj_Nasel);
      dmBase.WriteProp(DateFiks, ID, mtDokument, 'WORK_NAME', dmBase.TypeObj_Nasel);

      // если не заполнен код учебного заведения
      if mtDokumentSTUDENT_SPR.AsString='' then begin
        dmBase.WriteProp(DateFiks, ID, mtDokument, 'STUD_PLACE', dmBase.TypeObj_Nasel);
      end else begin
        dmBase.DeleteProp(DateFiks, ID, 'STUD_PLACE', ftMemo);
      end;
      if mtDokumentWORK_SPR.AsString='' then begin
        dmBase.WriteProp(DateFiks, ID, mtDokument, 'WORK_NAME', dmBase.TypeObj_Nasel);
      end else begin
        dmBase.DeleteProp(DateFiks, ID, 'WORK_NAME', ftMemo);
      end;

      dmBase.WriteProp(DateFiks, ID, mtDokument, 'OTM_NATION', dmBase.TypeObj_Nasel);
      dmBase.WriteProp(DateFiks, ID, mtDokument, 'ADD_INFO', dmBase.TypeObj_Nasel);

      //-----движение человека ------------------------------------------------------
      if DvigMod then begin  // если была корректировка движения любого человека
        dmBase.DeleteFromList( dmBase.tbMensDvig, DateFiks, ID);
        tbMigr.First;
        tbMigr.IndexFieldNames:='ID_INTERNAL;DATE';
        tbMigr.SetRange([mtDokumentID_INTERNAL.AsInteger],[mtDokumentID_INTERNAL.AsInteger]);
        with dmBase.tbMensDvig do begin
          while not tbMigr.Eof do begin
            if not tbMigrDATE.IsNull then begin
              Append;
              FieldByName('DATE_FIKS').Value := DateFiks;
              FieldByName('ID').Value        := ID;
              WriteDateField(FieldByName('DATE'),tbMigrDATE);
              WriteDateField(FieldByName('DATE_SROK'),tbMigrDATE_SROK);
              FieldByName('TIP').Value  := tbMigrTIP.Value;
              FieldByName('PRICH').AsString:= tbMigrPRICH.AsString;
              FieldByName('TALON').AsString:=tbMigrTALON.AsString;
              FieldByName('KOMM').Value := tbMigrKOMM.Value;
              FieldByName('ORGAN').Value := tbMigrORGAN.Value;
              FieldByName('CONTANT').AsString := tbMigrCONTANT.AsString;

              FieldByName('OP_B_RESP').AsBoolean:=tbMigrOP_B_RESP.AsBoolean;
              FieldByName('OP_GOSUD').AsString:=tbMigrOP_GOSUD.AsString;
              FieldByName('OP_B_OBL').AsBoolean:=tbMigrOP_B_OBL.AsBoolean;
              FieldByName('OP_OBL').AsString:=tbMigrOP_OBL.AsString;
              FieldByName('OP_RAION').AsString:=tbMigrOP_RAION.AsString;
              FieldByName('OP_B_GOROD').AsString:=tbMigrOP_B_GOROD.AsString;
              FieldByName('OP_GOROD').AsString:=tbMigrOP_GOROD.AsString;

              try
                Post;
              except
                Cancel;
              end;
            end;
            tbMigr.Next;
          end;
        end;
        tbMigr.CancelRange;
        tbMigr.First;
      end;
      //----- признаки ------------------------------------------------------
      dmBase.DeleteFromList( dmBase.tbMensPr, DateFiks, ID);
      tbPriznaki.IndexFieldNames:='ID_INTERNAL';
      tbPriznaki.SetRange([mtDokumentID_INTERNAL.AsInteger],[mtDokumentID_INTERNAL.AsInteger]);
      tbPriznaki.First;
      with dmBase.tbMensPr do begin
        while not tbPriznaki.Eof do begin
          if not tbPriznakiKOD.IsNull then begin
            Append;
            FieldByName('DATE_FIKS').Value := DateFiks;
            FieldByName('ID').Value        := ID;
            FieldByName('KOD').Value := tbPriznakiKOD.Value;
            try
              Post;
            except
              Cancel;
            end;
          end;
          tbPriznaki.Next;
        end;
      end;
      tbPriznaki.CancelRange;
      tbPriznaki.First;
      //----- льготы ------------------------------------------------------
      dmBase.DeleteFromList( dmBase.tbMensLgot, DateFiks, ID);
//      {$IFDEF OCHERED}

//      {$ELSE}
      tbLgot.IndexFieldNames:='ID_INTERNAL';
      tbLgot.SetRange([mtDokumentID_INTERNAL.AsInteger],[mtDokumentID_INTERNAL.AsInteger]);
//      {$ENDIF}
      tbLgot.First;
      with dmBase.tbMensLgot do begin
        while not tbLgot.Eof do begin
          if not tbLgotKOD.IsNull then begin
            Append;
            FieldByName('DATE_FIKS').Value := DateFiks;
            FieldByName('ID').Value        := ID;
            FieldByName('KOD').Value := tbLgotKOD.Value;
            try
              Post;
            except
              Cancel;
            end;
          end;
          tbLgot.Next;
        end;
      end;
      tbLgot.CancelRange;
      tbLgot.First;
      //----- история ------------------------------------------------------
      WriteHistory(ID,mtDokumentID_INTERNAL.AsInteger,dmBase.TypeObj_Nasel);
      //----- решения ------------------------------------------------------
      WriteReshObj(ID,mtDokumentID_INTERNAL.AsInteger,dmBase.TypeObj_Nasel);

      //----- запись очереди ------------------------------------------------------
      WriteOchered(ID,nCurIDAdres);  // выполняется позиционирование по таблице "Население" в программе очередников

    except
      on E: Exception do begin
        PutError(E.Message);
        Result := false;
      end;
    end;
    if lErr then begin
      Result := false;
    end else begin
      GlobalTask.SetLastValueAsString('NATION',mtDokumentNATION.AsString);
    end;
  end;
  IsReadDokument:=false;
end;

//----------------------------------------------------------------------------------------
function TdmMen.AllReshOch(sl:TStringList; dDateR:TDateTime; sNomer:String): Boolean;
var
  sIsklID,sIDOb,sID2:String;
  lTwo:Boolean;
begin
  lTwo:=false;
  sIsklID:='';
  if sl.Count=1 then begin
    if sl.Strings[0]='2'
      then lTwo:=true
      else sIsklID:=Copy(sl.Strings[0],2,Length(sl.Strings[0]));   // типа -34, значит берем ID=34;
  end;
  sl.Clear;
  if not tbOcheredReshA.Active
    then tbOcheredReshA.Active:=true;        // attached таблица
  tbOcheredReshA.Filter:='';
  tbOcheredReshA.Filtered:=false;
  tbOcheredReshA.Refresh;
  tbOcheredReshA.First;
  if lTwo then begin
    sIDOb:=''; sID2:='';
    while not tbOcheredReshA.Eof do begin
      if (tbOcheredReshA.FieldByName('DATER').AsDateTime=dDateR) and
         (tbOcheredReshA.FieldByName('NOMER').AsString=sNomer) then begin
        if tbOcheredReshA.FieldByName('OCHERED_ID').AsInteger=0 then begin
          if sIDOb='' then sIDOb:=tbOcheredReshA.FieldByName('AUTO_ID').AsString;
        end else begin
          if sID2=''  then sID2:=tbOcheredReshA.FieldByName('AUTO_ID').AsString;
        end;
      end;
      tbOcheredReshA.Next;
    end;
    if sIDOb<>'' then sl.Add(sIDOb);
    if sID2<>''  then sl.Add(sID2);
  end else begin
    while not tbOcheredReshA.Eof do begin
      if (tbOcheredReshA.FieldByName('DATER').AsDateTime=dDateR) and
         (tbOcheredReshA.FieldByName('NOMER').AsString=sNomer) then begin
         if sl.IndexOf(tbOcheredReshA.FieldByName('AUTO_ID').AsString)=-1
           then sl.Add(tbOcheredReshA.FieldByName('AUTO_ID').AsString);
      end;
      tbOcheredReshA.Next;
    end;
  end;
  tbOcheredReshA.First;
  Result:=(sl.Count>0);
end;

//----------------------------------------------------------------------------------------
// nTypeOch=-4  tbOcheredReshA вернуть решение по AUTO_ID=nTypeResh, если nTypeResh<=0 то самое последнее решение
// nTypeOch=-3  tbOcheredReshA вернуть текущее решение (на котором стоим)
// nTypeOch=-2  tbOcheredResh вернуть текущее решение (на котором стоим)
// nTypeOch=-1  самое последнее решение для типа nTypeResh
// nTypeOch>-1  по типу очереди nTypeOch и типу решение nTypeResh
function TdmMen.GetReshOch(resh:TReshOchMen;nTypeOch:Integer;nTypeResh:Integer): Boolean;
{$IFDEF ZAGS}
begin
end;
{$ELSE}
var
 nTypeReshEx:Integer;
 nTypeReshEx2:Integer;
 strBM:String;
 procedure ClearResh_;
 begin
   Resh.FIDMen:=0;
   Resh.FTip:=-1;
   Resh.FAutoID:=-1;
   Resh.FOchered_Id:=0;
   Resh.FOtkaz:=false;
   Resh.FNomer:='';
   Resh.FDateR:=0;
   Resh.FDateSila:=0;
   Resh.FOsnov:=0;
   Resh.FOsnov2:=0;
   Resh.FOsnovText:='';
   Resh.FOsnovText2:='';
   Resh.FId1:=0;
   Resh.FId2:=0;
   Resh.FTextResh:='';
   Resh.FTextVipis:='';
   Resh.FAddInfo:='';
   Resh.FRazdel:=false;
   Resh.FProv:=true;
   Resh.FPlan:=false;
 end;
 procedure GetResh_(tb:TDataSet);
 begin
   Resh.FIDMen:=mtDokumentID.AsInteger ;
   Resh.FTip:=tb.FieldByName('TIP').AsInteger ;
   Resh.FAutoId:=tb.FieldByName('AUTO_ID').AsInteger;
   Resh.FOchered_Id:=tb.FieldByName('OCHERED_ID').AsInteger;
   Resh.FNomer:=tb.FieldByName('NOMER').AsString;
   if tb.FieldByName('OTKAZ').IsNull
     then Resh.FOtkaz:=false
     else Resh.FOtkaz:=tb.FieldByName('OTKAZ').AsBoolean;
   if tb.FieldByName('DATER').IsNull then Resh.FDateR:=0 else Resh.FDateR:=tb.FieldByName('DATER').AsDateTime;
   if tb.FieldByName('DATE_SILA').IsNull then Resh.FDateSILA:=0 else Resh.FDateSila:=tb.FieldByName('DATE_SILA').AsDateTime;

   if ReshIsPostanovka(Resh.FTip) and (Resh.FDateSILA=0) then begin // если в решении не заполнена дата постановки
     if (Resh.FOchered_Id=0) then begin
       if not mtDokumentDEC_DATE.IsNull then Resh.FDateSila:=mtDokumentDEC_DATE.AsDateTime;
     end else begin
       strBM:=tbOcheredLgot.Bookmark;
       if tbOcheredLgot.Locate('OCHERED_ID',Resh.FOchered_Id,[]) then begin
         if not tbOcheredLgotDEC_DATE.IsNull then Resh.FDateSila:=tbOcheredLgotDEC_DATE.AsDateTime;
       end;
       tbOcheredLgot.Bookmark:=strBM;
     end;
   end;

   Resh.FOsnov:=tb.FieldByName('OSNOV').AsInteger;
   Resh.FOsnov2:=tb.FieldByName('OSNOV2').AsInteger;
   Resh.FOsnovText:=tb.FieldByName('OSNOV_TEXT').AsString;
   Resh.FOsnovText2:=tb.FieldByName('OSNOV_TEXT2').AsString;
   Resh.FId1:=tb.FieldByName('ID1').AsInteger;
   Resh.FId2:=tb.FieldByName('ID2').AsInteger;
   Resh.FTextResh:=tb.FieldByName('TEXTRESH').AsString;
   Resh.FTextVipis:=tb.FieldByName('TEXTVIPIS').AsString;
   Resh.FAddInfo:=tb.FieldByName('ADDINFO').AsString;
   if tb.FieldByName('PROV').IsNull
     then Resh.FProv:=false
     else Resh.FProv:=tb.FieldByName('PROV').AsBoolean;
   if tb.FieldByName('PLAN').IsNull
     then Resh.FPlan:=false
     else Resh.FPlan:=tb.FieldByName('PLAN').AsBoolean;
   if tb.FieldByName('RAZD').IsNull
     then Resh.FRazdel:=false
     else Resh.FRazdel:=tb.FieldByName('RAZD').AsBoolean;
 end;              
begin
  Result:=false;
  try
    ClearResh_;         
    if not tbOcheredReshA.Active
      then tbOcheredReshA.Active:=true;        // attached таблица
    tbOcheredReshA.Filter:='';
    tbOcheredReshA.Filtered:=false;
    tbOcheredReshA.Refresh;
    tbOcheredReshA.First;

    if nTypeOch=-4 then begin               // tbOcheredReshA вернуть текущее решение по AUTO_ID=nTypeResh
      if nTypeResh>0 then begin
        if tbOcheredReshA.Locate('AUTO_ID', nTypeResh, []) then begin
          getResh_(tbOcheredReshA);
        end;
      end else begin
        getResh_(tbOcheredReshA);
      end
    end else if nTypeOch=-3 then begin      // tbOcheredReshA вернуть текущее решение (на котором стоим)
      getResh_(tbOcheredReshA);
    end else if nTypeOch=-2 then begin      // tbOcheredResh вернуть текущее решение (на котором стоим)
      getResh_(tbOcheredResh);
    end;
    if resh.Tip>-1 then begin
      Result:=true;
      exit;
    end;

    if nTypeOch>-2 then begin
      if nTypeOch=-1 then begin               // последнее решение для всех типов очередей
        tbOcheredReshA.Filter:='';
        tbOcheredReshA.Filtered:=false;
      end else begin
        if nTypeOch>999
          then tbOcheredReshA.Filter:='ochered_id>0'        // любая отдельная
          else tbOcheredReshA.Filter:='ochered_id='+IntToStr(nTypeOch);  // последнее решение для контретной очереди
        tbOcheredReshA.Filtered:=true;
      end;
      tbOcheredReshA.First;
      // если постановка, то будем еще искать и восстановление
      if nTypeResh=OCH_RESH_POST
        then nTypeReshEx:=OCH_RESH_VOST
        else nTypeReshEx:=-999;
      // если постановка, то будем еще искать и перенос
      if nTypeResh=OCH_RESH_POST
        then nTypeReshEx2:=OCH_RESH_PERENOS
        else nTypeReshEx2:=-999;
      while not tbOcheredReshA.Eof do begin
        // конктетный тип решения или просто последнее
        if (nTypeResh=-1) or (tbOcheredReshA.FieldByName('TIP').AsInteger=nTypeResh)
                          or (tbOcheredReshA.FieldByName('TIP').AsInteger=nTypeReshEx)
                          or (tbOcheredReshA.FieldByName('TIP').AsInteger=nTypeReshEx2) then begin
          getResh_(tbOcheredReshA);
          break;
        end;
        tbOcheredReshA.Next;
      end;
    end;

  finally
    tbOcheredReshA.Filter:='';
    tbOcheredReshA.Filtered:=false;
//    tbOcheredReshA.Active:=false;
//    if sFlt<>'' then tbOcheredResh.Filtered:=true;
//    tbOcheredResh.Bookmark:=sBook;
//    dbEnableControls(tbOcheredResh,l);
  end;
  if resh.Tip>-1 then Result:=true;
end;
{$ENDIF}

//--------------------------------------------------------------------------
function TdmMen.ReadSobstvMen(ID: Integer; ID_INTERNAL: Integer): Boolean;
var
  lErr:Boolean;
begin
  Result:=true;
  {$IFNDEF ZAGS}
  with dmBase.tbMensSobst do begin
    IndexName:='MEN_KEY';
    SetRange([ID],[ID]);
    try
      while not Eof do begin
        tbOcheredSobstv.Append;
        tbOcheredSobstv.FieldByName('ID_INTERNAL').AsInteger:=ID_INTERNAL;
        tbOcheredSobstv.FieldByName('MEMBER_ID').AsInteger:=FieldByName('ID').AsInteger;
        tbOcheredSobstv.FieldByName('TAIL').AsString:=FieldByName('TAIL').AsString;
        tbOcheredSobstv.FieldByName('DEST').AsString:=FieldByName('DEST').AsString;
        tbOcheredSobstv.FieldByName('PRAVO').AsString:=FieldByName('PRAVO').AsString;
        tbOcheredSobstv.FieldByName('KADASTR').AsString:=FieldByName('KADASTR').AsString;
        tbOcheredSobstv.FieldByName('ADRES').AsString:=FieldByName('ADRES').AsString;
        WriteField(tbOcheredSobstv.FieldByName('PLOSH_ALL'), FieldByName('PLOSH_ALL'),lErr);
        WriteDateField(tbOcheredSobstv.FieldByName('DATER'), FieldByName('DATER'));
        WriteDateField(tbOcheredSobstv.FieldByName('DATEP'), FieldByName('DATEP'));
        tbOcheredSobstv.FieldByName('PRIM').AsString:=FieldByName('PRIM').AsString;
        tbOcheredSobstv.Post;
        Next;
      end;
    finally
      CancelRange;
    end;
  end;
  {$ENDIF}
end;

//--------------------------------------------------------------------------
function TdmMen.WriteSobstvMen(ID: Integer): Boolean;
begin
  Result:=true;
end;

//--------------------------------------------------------------------------
function TdmMen.ReadOchered(ID: Integer; IDInternal : Integer): Boolean;
{$IFNDEF ZAGS}
var
  nIDMember,n : Integer;
  st : TSostTable;
  lFindIDMen,lErr : Boolean;
  tbSpr:TDataSet;
{$ENDIF}
begin
  Result := false;
{$IFNDEF ZAGS}
  // если доступ запрещен или человек не в очереди, то не читаем
  if (Role.CheckSubSystem(SS_OCHERED)=ptDeniedAccess) or not mtDokumentOCHERED.AsBoolean then exit;
  OchReshMod:=false;
  OchSostavMod:=false;
  if ID > 0 then begin
    with dmBase.tbOchered do begin
      tbOcheredSobstv.ResetAutoInc;
      tbOcheredSobstv.AutoIncMinValue:=1;
      mtDokumentKOLVO_SOSTAV.AsInteger:=1;

      if Locate('OCHERED_ID;ID', VarArrayOf([0,ID]), []) then begin
        Result := true;
        mtDokumentOCHERED.AsBoolean:=true;

        if FieldByName('ID_BASE').IsNull
          then mtDokumentID_BASE.AsInteger:=0
          else mtDokumentID_BASE.AsInteger:=FieldByName('ID_BASE').AsInteger;

        mtDokumentNEWSEM.AsBoolean:=FieldByName('NEWSEM').AsBoolean;  // молодая семья
        if mtDokumentNEWSEM.IsNull then mtDokumentNEWSEM.AsBoolean:=false;
        mtDokumentMNOGO_4.AsBoolean:=FieldByName('MNOGO_4').AsBoolean;  //
        mtDokumentMNOGO_I.AsBoolean:=FieldByName('MNOGO_I').AsBoolean;  //

        mtDokumentDELO.AsString := FieldByName('DELO').AsString;
        mtDokumentNOMER_OCH.AsString := FieldByName('NOMER_OCH').AsString;
        mtDokumentOLD_NOMER.AsString := FieldByName('OLD_NOMER').AsString;
        WriteDateField(mtDokumentDEC_DATE,FieldByName('DEC_DATE'));
        WriteDateField(mtDokumentDEC_DATE_REAL,FieldByName('DEC_DATE_REAL'));

        WriteDateField(mtDokumentDEC_TIME,FieldByName('DEC_TIME'));
        mtDokumentDEC_NOMER.AsString := FieldByName('DEC_NOMER').AsString;
        mtDokumentREG_NOMER.AsString := FieldByName('REG_NOMER').AsString;
        mtDokumentTAIL.AsString := FieldByName('TAIL').AsString;

        WriteDateField(mtDokumentPER_DATE,FieldByName('PER_DATE'));
        WriteDateField(mtDokumentRESIDENCE_DATE,FieldByName('RESIDENCE_DATE'));

        WriteField(mtDokumentPRIME,FieldByName('PRIME'),lErr);
        WriteDateField(mtDokumentLGOT_DATE,FieldByName('LGOT_DATE'));

        mtDokumentKOLVO_PROPIS.AsString := FieldByName('KOLVO_PROPIS').AsString;
        if FieldByName('KOLVO_SOSTAV').AsInteger>0
          then mtDokumentKOLVO_SOSTAV.AsInteger := FieldByName('KOLVO_SOSTAV').AsInteger;
        mtDokumentKOLVO_KOMN.AsString := FieldByName('KOLVO_KOMN').AsString;
        mtDokumentKOLVO_KOMN_PR.AsString := FieldByName('KOLVO_KOMN_PR').AsString;
        WriteField(mtDokumentPLOSH_ALL,FieldByName('PLOSH_ALL'),lErr);
        WriteField(mtDokumentPLOSH_GIL,FieldByName('PLOSH_GIL'),lErr);

        mtDokumentTYPEHOUSE.AsString := FieldByName('TYPEHOUSE').AsString;
        mtDokumentRESIDENCE.AsString := FieldByName('RESIDENCE').AsString;

        mtDokumentOCHERED_PRIM.AsString := FieldByName('OCHERED_PRIM').AsString;
        mtDokumentOCHERED_DOK.AsString  := FieldByName('OCHERED_DOK').AsString;

        mtDokumentNEW_ADRES_ID.AsString := FieldByName('NEW_ADRES_ID').AsString;
        mtDokumentNEW_DOGOVOR.AsString := FieldByName('NEW_DOGOVOR').AsString;
        mtDokumentNEW_PLOSH_ALL.AsString := FieldByName('NEW_PLOSH_ALL').AsString;
        mtDokumentNEW_PLOSH_GIL.AsString := FieldByName('NEW_PLOSH_GIL').AsString;
        mtDokumentNEW_PLOSH_SNP.AsString := FieldByName('NEW_PLOSH_SNP').AsString;
        mtDokumentNEW_KOLVO_KOMN.AsString := FieldByName('NEW_KOLVO_KOMN').AsString;
        mtDokumentNEW_KV.AsString := FieldByName('NEW_KV').AsString;
        WriteDateField(mtDokumentNEW_DATE,FieldByName('NEW_DATE'));

        mtDokumentSOCIAL.AsString := FieldByName('SOCIAL').AsString;  // тип предоставленного жилья
        mtDokumentGSK.AsString := FieldByName('GSK').AsString;
        if FieldByName('UCHASTOK').IsNull
          then mtDokumentUCHASTOK.AsBoolean := false
          else mtDokumentUCHASTOK.AsBoolean := FieldByName('UCHASTOK').AsBoolean;
        WriteDateField(mtDokumentUCHASTOK_DATE,FieldByName('UCHASTOK_DATE'));

        if FieldByName('IS_UCHASTOK').IsNull
          then mtDokumentIS_UCHASTOK.AsBoolean := false
          else mtDokumentIS_UCHASTOK.AsBoolean := FieldByName('IS_UCHASTOK').AsBoolean;
        WriteDateField(mtDokumentIS_UCHASTOK_DATE,FieldByName('IS_UCHASTOK_DATE'));

        if FieldByName('SIROTA').IsNull
          then mtDokumentSIROTA.AsBoolean := false
          else mtDokumentSIROTA.AsBoolean := FieldByName('SIROTA').AsBoolean;

        if FieldByName('ONLY').IsNull
          then mtDokumentONLY.AsBoolean := false
          else mtDokumentONLY.AsBoolean := FieldByName('ONLY').AsBoolean;

        mtDokumentDOXOD_SUMMA.AsString := FieldByName('DOXOD_SUMMA').AsString;
        WriteDateField(mtDokumentKREDIT_DATE,FieldByName('KREDIT_DATE'));
        mtDokumentKREDIT_SUMMA.AsString := FieldByName('KREDIT_SUMMA').AsString;
        mtDokumentKREDIT_NOMER.AsString := FieldByName('KREDIT_NOMER').AsString;
        mtDokumentKREDIT_RESH.AsString := FieldByName('KREDIT_RESH').AsString;
        WriteDateField(mtDokumentSUBSID_DATE,FieldByName('SUBSID_DATE'));
        mtDokumentSUBSID_SUMMA.AsString := FieldByName('SUBSID_SUMMA').AsString;
        mtDokumentSUBSID_RESH.AsString := FieldByName('SUBSID_RESH').AsString;

        mtDokumentSLUGEB_POMECH.AsString := FieldByName('SLUGEB_POMECH').AsString;
        mtDokumentDOP_OCHERED.AsString := FieldByName('DOP_OCHERED').AsString;
        WriteDateField(mtDokumentDOP_DATE,FieldByName('DOP_DATE'));

//        if FieldByName('OTKAZ').IsNull
//          then mtDokumentOTKAZ.AsBoolean := false
//          else mtDokumentOTKAZ.AsBoolean := FieldByName('OTKAZ').AsBoolean;

        mtDokumentISKL.AsBoolean  := FieldByName('ISKL').AsBoolean;

        //----- собственность человека ------------------------------------------------------
        ReadSobstvMen(ID,IDInternal);

        //----- решения по очереди ------------------------------------------------------
//        st := SaveSostTable(dmBase.tbOcheredResh,false,false);
        dmBase.tbOcheredResh.IndexName := 'PR_KEY';  // "ID;OCHERED_ID;Descend(DATER);Descend(AUTO_ID)"
        dmBase.tbOcheredResh.SetRange([ID],[ID]);
        dmBase.tbOcheredResh.Last;   // !!!
        tbOcheredResh.ResetAutoInc;
        tbOcheredResh.AutoIncMinValue:=1;
        try
//        while not dmBase.tbOcheredResh.Eof do begin
        // читаем в обратном порядке
        while not dmBase.tbOcheredResh.Bof do begin
          //----------- если не общая очередь
            try
              tbOcheredResh.Append;
              tbOcheredReshID_INTERNAL.AsInteger := IDInternal;
              tbOcheredReshOCHERED_ID.AsInteger:= dmBase.tbOcheredResh.FieldByName('OCHERED_ID').AsInteger;
              tbOcheredReshAUTO_ID.AsInteger  := dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
              tbOcheredReshTIP.AsInteger  := dmBase.tbOcheredResh.FieldByName('TIP').AsInteger;
              tbOcheredReshNOMER.AsString := dmBase.tbOcheredResh.FieldByName('NOMER').AsString;
              WriteDateField(tbOcheredReshDATER, dmBase.tbOcheredResh.FieldByName('DATER'));
              // записывает DATE_SORT в зависимости от значение DATER
              if tbOcheredReshDATER.IsNull
                then WriteDateField(tbOcheredReshDATE_SORT, dmBase.tbOcheredResh.FieldByName('DATE_SORT'))  // !!!
                else WriteDateField(tbOcheredReshDATE_SORT, tbOcheredReshDATER);                             // !!!

              WriteDateField(tbOcheredReshDATE_SILA, dmBase.tbOcheredResh.FieldByName('DATE_SILA'));
              if dmBase.tbOcheredResh.FieldByName('TIP').AsInteger=OCH_RESH_SN
                then tbSpr:=dmBase.SprSnOch
                else tbSpr:=dmBase.SprPostOch;
              ReadKodAndText(tbOcheredReshOSNOV,tbOcheredReshOSNOV_TEXT,
                             dmBase.tbOcheredResh.FieldByName('OSNOV'),dmBase.tbOcheredResh.FieldByName('OSNOV_TEXT'),
                             tbSpr);
              ReadKodAndText(tbOcheredReshOSNOV2,tbOcheredReshOSNOV_TEXT2,
                             dmBase.tbOcheredResh.FieldByName('OSNOV2'),dmBase.tbOcheredResh.FieldByName('OSNOV_TEXT2'),
                             tbSpr);
              tbOcheredReshADDINFO.AsString := dmBase.tbOcheredResh.FieldByName('ADDINFO').AsString;
              tbOcheredReshID1.AsInteger  := dmBase.tbOcheredResh.FieldByName('ID1').AsInteger;
              tbOcheredReshID2.AsInteger  := dmBase.tbOcheredResh.FieldByName('ID2').AsInteger;
              tbOcheredReshTEXTRESH.AsString := dmBase.tbOcheredResh.FieldByName('TEXTRESH').AsString;
              tbOcheredReshTEXTVIPIS.AsString := dmBase.tbOcheredResh.FieldByName('TEXTVIPIS').AsString;
              if dmBase.tbOcheredResh.FieldByName('PROV').IsNull
                then tbOcheredReshPROV.AsBoolean:=true
                else tbOcheredReshPROV.AsBoolean:=dmBase.tbOcheredResh.FieldByName('PROV').AsBoolean;

              if dmBase.tbOcheredResh.FieldByName('OTKAZ').IsNull
                then tbOcheredReshOTKAZ.AsBoolean := false
                else tbOcheredReshOTKAZ.AsBoolean := dmBase.tbOcheredResh.FieldByName('OTKAZ').AsBoolean;
              if dmBase.tbOcheredResh.FieldByName('PLAN').IsNull
                then tbOcheredReshPLAN.AsBoolean := false
                else tbOcheredReshPLAN.AsBoolean := dmBase.tbOcheredResh.FieldByName('PLAN').AsBoolean;
              if dmBase.tbOcheredResh.FieldByName('RAZD').IsNull
                then tbOcheredReshRAZD.AsBoolean := false
                else tbOcheredReshRAZD.AsBoolean := dmBase.tbOcheredResh.FieldByName('RAZD').AsBoolean;

              tbOcheredResh.Post;
            except
              on E: Exception do begin
                tbOcheredResh.Cancel;
                PutError(E.Message);
              end;
          end;
          dmBase.tbOcheredResh.Prior;
//          dmBase.tbOcheredResh.Next;
        end;
        finally
          dmBase.tbOcheredResh.CancelRange;
        end;
        //----- состав семьи ------------------------------------------------------
        dmBase.tbSostavSem.IndexName := 'PR_KEY';
        dmBase.tbSostavSem.SetRange([ID],[ID]);
        n:=0;
        while not dmBase.tbSostavSem.Eof do begin
          nIDMember := dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger;
          if nIDMember>0 then begin
            //----- собственность человека ------------------------------------------------------
            ReadSobstvMen(nIDMember,IDInternal);

            st := SaveSostTable(dmBase.tbMens, true, false);
            if dmBase.tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,nIDMember]), []) then begin
              lFindIDMen:=true;
              try
                tbSostavSem.Append;
                if dmBase.tbSostavSem.FieldByName('ISKL').IsNull
                  then tbSostavSemISKL.AsBoolean:=false
                  else tbSostavSemISKL.AsBoolean:=dmBase.tbSostavSem.FieldByName('ISKL').AsBoolean;
                if tbSostavSemISKL.AsBoolean then begin
                  tbSostavSemNOMER.AsString:='';
                end else begin
                  n:=n+1;
                  tbSostavSemNOMER.AsInteger:=n;
                end;
                tbSostavSemID_INTERNAL.AsInteger := IDInternal;
                tbSostavSemOTNOSH.AsString := dmBase.tbSostavSem.FieldByName('OTNOSH').AsString;
                WriteDateField(tbSostavSemDATEP, dmBase.tbSostavSem.FieldByName('DATEP'));
                tbSostavSemPRICH.AsString := dmBase.tbSostavSem.FieldByName('PRICH').AsString;
                tbSostavSemMEMBER_ID.AsInteger := nIDMember;
                tbSostavSemCHECK.AsBoolean := false;

                //--- запишем из таблицы "Население" -----
                tbSostavSemFAMILIA.AsString := dmBase.tbMens.FieldByName('FAMILIA').AsString;
                tbSostavSemNAME.AsString := dmBase.tbMens.FieldByName('NAME').AsString;
                tbSostavSemOTCH.AsString := dmBase.tbMens.FieldByName('OTCH').AsString;
                tbSostavSemPOL.AsString := dmBase.tbMens.FieldByName('POL').AsString;
                WriteDateField(tbSostavSemDATER, dmBase.tbMens.FieldByName('DATER'));
                tbSostavSemLICH_NOMER.AsString := dmBase.tbMens.FieldByName('LICH_NOMER').AsString;

                tbSostavSemPASP_UDOST.AsString := dmBase.tbMens.FieldByName('PASP_UDOST').AsString;
                tbSostavSemPASP_SERIA.AsString := dmBase.tbMens.FieldByName('PASP_SERIA').AsString;
                tbSostavSemPASP_NOMER.AsString := dmBase.tbMens.FieldByName('PASP_NOMER').AsString;
                tbSostavSemPASP_VIDAN.Value    := dmBase.ReadOneProp(DateFiks, nIDMember, 'PASP_VIDAN', ftMemo);
                {$IFDEF OCHERED}
                  if dmBase.tbMensAdd.Locate('ID', nIDMember, []) then begin
                    tbSostavSemTEXT_ADRES.AsString:=dmBase.tbMensAdd.FieldByName('TEXT_ADRES').AsString;
                  end;
                {$ENDIF}

                WriteDateField(tbSostavSemPASP_DATE, dmBase.tbMens.FieldByName('PASP_DATE'));

                //----------------------------------------

                tbSostavSem.Post;
              except
                on E: Exception do begin
                  tbSostavSem.Cancel;
                  PutError(E.Message);
                end;
              end;
              RestSostTable(dmBase.tbMens, st);
            end else begin
              lFindIDMen:=false;
            end;
          end else begin
            lFindIDMen:=false;
          end;
          //----- если человека не нашли, или его и не должно быть в базе населения ---
          if not lFindIDMen and (dmBase.tbSostavSem.FieldByName('FAMILIA').AsString<>'') then begin
            try
              tbSostavSem.Append;
              if dmBase.tbSostavSem.FieldByName('ISKL').IsNull
                then tbSostavSemISKL.AsBoolean:=false
                else tbSostavSemISKL.AsBoolean:=dmBase.tbSostavSem.FieldByName('ISKL').AsBoolean;
              if tbSostavSemISKL.AsBoolean then begin
                tbSostavSemNOMER.AsString:='';
              end else begin
                n:=n+1;
                tbSostavSemNOMER.AsInteger:=n;
              end;
              tbSostavSemID_INTERNAL.AsInteger := IDInternal;
              tbSostavSemOTNOSH.AsString := dmBase.tbSostavSem.FieldByName('OTNOSH').AsString;
              tbSostavSemPRICH.AsString := dmBase.tbSostavSem.FieldByName('PRICH').AsString;
              WriteDateField(tbSostavSemDATEP, dmBase.tbSostavSem.FieldByName('DATEP'));
              tbSostavSemMEMBER_ID.AsInteger := 0;
              tbSostavSemCHECK.AsBoolean := false;
              tbSostavSemFAMILIA.AsString := dmBase.tbSostavSem.FieldByName('FAMILIA').AsString;
              tbSostavSemNAME.AsString := dmBase.tbSostavSem.FieldByName('NAME').AsString;
              tbSostavSemOTCH.AsString := dmBase.tbSostavSem.FieldByName('OTCH').AsString;
              tbSostavSemPOL.AsString := dmBase.tbSostavSem.FieldByName('POL').AsString;
              tbSostavSemLICH_NOMER.AsString := dmBase.tbSostavSem.FieldByName('LICH_NOMER').AsString;
              WriteDateField(tbSostavSemDATER, dmBase.tbSostavSem.FieldByName('DATER'));

              tbSostavSemPASP_UDOST.AsString := dmBase.tbSostavSem.FieldByName('PASP_UDOST').AsString;
              tbSostavSemPASP_SERIA.AsString := dmBase.tbSostavSem.FieldByName('PASP_SERIA').AsString;
              tbSostavSemPASP_NOMER.AsString := dmBase.tbSostavSem.FieldByName('PASP_NOMER').AsString;
              tbSostavSemPASP_VIDAN.AsString := dmBase.tbSostavSem.FieldByName('PASP_VIDAN').AsString;
              WriteDateField(tbSostavSemPASP_DATE, dmBase.tbSostavSem.FieldByName('PASP_DATE'));
              {$IFDEF OCHERED}
                tbSostavSemTEXT_ADRES.AsString:=dmBase.tbSostavSem.FieldByName('TEXT_ADRES').AsString;
              {$ENDIF}

              tbSostavSem.Post;
            except
              on E: Exception do begin
                tbSostavSem.Cancel;
                PutError(E.Message);
              end;
            end;
          end;

          dmBase.tbSostavSem.Next;
        end;
        dmBase.tbSostavSem.CancelRange;

        //mtDokumentKOLVO_SOSTAV.AsInteger := n+1; //tbSostavSem.RecordCount+1;
        CheckCountSostav;

        //----- льготные очереди ------------------------------------------------------
        st := SaveSostTable(dmBase.tbOchered,false,false);
        dmBase.tbOchered.IndexName := 'MEN_KEY';  // "ID;OCHERED_ID"
        dmBase.tbOchered.SetRange([ID],[ID]);
        while not dmBase.tbOchered.Eof do begin
          //----------- если не общая очередь
          if dmBase.tbOchered.FieldByName('OCHERED_ID').AsInteger>0 then begin
            try
              tbOcheredLgot.Append;
              tbOcheredLgotID_INTERNAL.AsInteger := IDInternal;
              tbOcheredLgotOCHERED_ID.AsInteger:= dmBase.tbOchered.FieldByName('OCHERED_ID').AsInteger;
              tbOcheredLgotNOMER_OCH.AsInteger := dmBase.tbOchered.FieldByName('NOMER_OCH').AsInteger;
              tbOcheredLgotOLD_NOMER.AsInteger := dmBase.tbOchered.FieldByName('OLD_NOMER').AsInteger;

              if dmBase.tbOchered.FieldByName('SIMPLE').IsNull
                then tbOcheredLgotVNEOCH.AsBoolean := false
                else tbOcheredLgotVNEOCH.AsBoolean := dmBase.tbOchered.FieldByName('SIMPLE').AsInteger=0;

              WriteDateField(tbOcheredLgotDEC_DATE, dmBase.tbOchered.FieldByName('DEC_DATE'));
              WriteDateField(tbOcheredLgotDEC_TIME, dmBase.tbOchered.FieldByName('DEC_TIME'));
              WriteDateField(tbOcheredLgotDEC_DATE_REAL, dmBase.tbOchered.FieldByName('DEC_DATE_REAL'));
              tbOcheredLgotDEC_NOMER.AsString:=dmBase.tbOchered.FieldByName('DEC_NOMER').AsString;

//              if dmBase.tbOchered.FieldByName('OTKAZ').IsNull
//                then tbOcheredLgotOTKAZ.AsBoolean := false
//                else tbOcheredLgotOTKAZ.AsBoolean := dmBase.tbOchered.FieldByName('OTKAZ').AsBoolean;

              tbOcheredLgotISKL.AsBoolean  := dmBase.tbOchered.FieldByName('ISKL').AsBoolean;

              tbOcheredLgotOCHERED_PRIM.AsString := dmBase.tbOchered.FieldByName('OCHERED_PRIM').AsString;
              tbOcheredLgotOCHERED_DOK.AsString  := dmBase.tbOchered.FieldByName('OCHERED_DOK').AsString;
              // !!!
              tbOcheredResh.Filter:='ochered_id='+tbOcheredLgotOCHERED_ID.AsString;
              tbOcheredResh.Filtered:=true;
              //---
              WriteDateField(tbOcheredLgotLAST_RESH_DATE, tbOcheredReshDATER);
              tbOcheredLgotLAST_RESH_TIP.AsString:=tbOcheredReshTIP.AsString;
              tbOcheredLgotLAST_RESH_NOMER.AsString:=tbOcheredReshNOMER.AsString;
              tbOcheredLgotLAST_RESH_OSNOV_TEXT.AsString:=tbOcheredReshOSNOV_TEXT.AsString;
              //---
              tbOcheredResh.Filtered:=false;
              tbOcheredResh.Filter:='';
              // !!!

              tbOcheredLgot.Post;
            except
              on E: Exception do begin
                tbOcheredLgot.Cancel;
                PutError(E.Message);
              end;
            end;
          end;
          dmBase.tbOchered.Next;
        end;
        dmBase.tbOchered.CancelRange;
        RestSostTable(dmBase.tbOchered,st);
      end;
    end;                       
    OchSostavMod:=false;
  end;
{$ENDIF}
end;
//---------------------------------------------------------------------
procedure TdmMen.writeCurResh(nID:Integer; lFirst:Boolean; nBase:Integer);
begin
  {$IFNDEF ZAGS}

  dmBase.tbOcheredResh.FieldByName('ID').AsInteger:=nID;
  dmBase.tbOcheredResh.FieldByName('OCHERED_ID').AsInteger:=tbOcheredReshOCHERED_ID.AsInteger;
  dmBase.tbOcheredResh.FieldByName('TIP').AsInteger:=tbOcheredReshTIP.AsInteger;
  dmBase.tbOcheredResh.FieldByName('NOMER').AsString:=tbOcheredReshNOMER.AsString;
  WriteDateField(dmBase.tbOcheredResh.FieldByName('DATER'),tbOcheredReshDATER);
  WriteDateField(dmBase.tbOcheredResh.FieldByName('DATE_SORT'),tbOcheredReshDATE_SORT);
  WriteDateField(dmBase.tbOcheredResh.FieldByName('DATE_SILA'),tbOcheredReshDATE_SILA);

  dmBase.tbOcheredResh.FieldByName('OSNOV').AsInteger:=tbOcheredReshOSNOV.AsInteger;
  if tbOcheredReshOSNOV.AsInteger=0
    then dmBase.tbOcheredResh.FieldByName('OSNOV_TEXT').AsString:=tbOcheredReshOSNOV_TEXT.AsString
    else dmBase.tbOcheredResh.FieldByName('OSNOV_TEXT').AsString:='';

  dmBase.tbOcheredResh.FieldByName('OSNOV2').AsString:=tbOcheredReshOSNOV2.AsString;
  if tbOcheredReshOSNOV2.AsInteger=0
    then dmBase.tbOcheredResh.FieldByName('OSNOV_TEXT2').AsString:=tbOcheredReshOSNOV_TEXT2.AsString
    else dmBase.tbOcheredResh.FieldByName('OSNOV_TEXT2').AsString:='';

  dmBase.tbOcheredResh.FieldByName('ADDINFO').AsString:=tbOcheredReshADDINFO.AsString;
  dmBase.tbOcheredResh.FieldByName('ID1').AsInteger:=tbOcheredReshID1.AsInteger;
  dmBase.tbOcheredResh.FieldByName('ID2').AsInteger:=tbOcheredReshID2.AsInteger;
  dmBase.tbOcheredResh.FieldByName('TEXTRESH').AsString:=tbOcheredReshTEXTRESH.AsString;
  dmBase.tbOcheredResh.FieldByName('TEXTVIPIS').AsString:=tbOcheredReshTEXTVIPIS.AsString;
  dmBase.tbOcheredResh.FieldByName('OTKAZ').AsBoolean:=tbOcheredReshOTKAZ.AsBoolean;
  dmBase.tbOcheredResh.FieldByName('PLAN').AsBoolean:=tbOcheredReshPLAN.AsBoolean;
  dmBase.tbOcheredResh.FieldByName('RAZD').AsBoolean:=tbOcheredReshRAZD.AsBoolean;
  dmBase.tbOcheredResh.FieldByName('ID_BASE').AsInteger:=nBase;
  // не последнее решение всегда считаем проведенным
  if lFirst
    then dmBase.tbOcheredResh.FieldByName('PROV').AsBoolean:=tbOcheredReshPROV.AsBoolean
    else dmBase.tbOcheredResh.FieldByName('PROV').AsBoolean:=true;
  {$ENDIF}
end;
//----------------------------------------------------------------------
function TdmMen.SetIDResh(nOch:Integer):Boolean;
var
  nSn,nPost,nLast:Integer;
  sFilter,sOld:String;
  lFlt,l:Boolean;
begin
  Result:=true;
  nSn:=0; nPost:=0; nLast:=0;
  sFilter:='OCHERED_ID='+IntToStr(nOch);
  l:=dbDisableControls(tbOcheredResh);
  sOld:=tbOcheredResh.Filter;
  lFlt:=tbOcheredResh.Filtered;
  tbOcheredResh.Filter:=sFilter;
  tbOcheredResh.Filtered:=true;
  // !!! AUTO_ID д.б. обязательно заполнен !!!
  while not tbOcheredResh.Eof do begin
    if nLast=0
      then nLast:=tbOcheredReshAUTO_ID.AsInteger;
    if tbOcheredReshTIP.AsInteger=OCH_RESH_SN then begin
      if nSn=0   then nSn:=tbOcheredReshAUTO_ID.AsInteger;
    end else if ReshIsPostanovka(tbOcheredReshTIP.AsInteger) then begin
      if nPost=0 then nPost:=tbOcheredReshAUTO_ID.AsInteger;
    end;
{    case tbOcheredReshTIP.AsInteger of
      OCH_RESH_SN                 : if nSn=0   then nSn:=tbOcheredReshAUTO_ID.AsInteger;
      OCH_RESH_POST,OCH_RESH_VOST : if nPost=0 then nPost:=tbOcheredReshAUTO_ID.AsInteger;
    end; }
    tbOcheredResh.Next;
  end;
  if lFlt then begin
    tbOcheredResh.Filter:=sOld;
    tbOcheredResh.Filtered:=true;
  end else begin
    tbOcheredResh.Filter:='';
    tbOcheredResh.Filtered:=false;
  end;
  dbEnableControls(tbOcheredResh,l);

  with dmBase.tbOchered do begin
    FieldByName('ID_LAST_RESH').AsInteger:=nLast;
    FieldByName('ID_SN_RESH').AsInteger:=nSn;
    FieldByName('ID_POST_RESH').AsInteger:=nPost;
  end;

end;
//--------------------------------------------------------------------------------------
function TdmMen.WriteOchered(ID: Integer; nIDAdresMen:Integer): Boolean;
{$IFNDEF ZAGS}
var
  l : Boolean;
  n,i,IDInternal,nNewID,nDelo,nBase,nIDSostav : Integer;
  lErr,lIskl, lFull_Iskl,lCheck,lOtkaz,lFirst : Boolean;
  st : TSostTable;
  slBookMark:TStringList;
  strBookMark,strBookMarkNew,sFilter,s:String;
  sl:TStringList;
  resh:TReshOchMen;
  sDelo:String;
{$ENDIF}
{$IFDEF OCHERED}
  arr:TArrStrings;
{$ENDIF}
begin
  Result := true;
{$IFNDEF ZAGS}
  // если полный доступ и человек стоит в очереди
  if (Role.CheckSubSystem(SS_OCHERED)=ptFull) and mtDokumentOCHERED.AsBoolean  then begin
    IDInternal:=mtDokumentID_INTERNAL.AsInteger;
    nNewID:=-1;
    //----------------------
    // может необходимо провести последнее решение
    resh:=nil;
    sDelo:='';
    nBase:=0;
    if OchReshMod then begin                            // изменяли список решений
      l:=dbDisableControls(tbOcheredResh);
      sFilter:=tbOcheredResh.Filter;
      tbOcheredResh.Filter:='';
      tbOcheredResh.Filtered:=false;
      if tbOcheredResh.RecordCount>0 then begin
        tbOcheredResh.First;
        if (tbOcheredReshPROV.AsBoolean=false) and
           ((tbOcheredReshTIP.AsInteger=OCH_RESH_PERE) or (tbOcheredReshTIP.AsInteger=OCH_RESH_UNION) or (tbOcheredReshTIP.AsInteger=OCH_RESH_RAZD)) then begin
          resh:=TReshOchMen.Create;
          GetReshOch(resh,-2,0); // вернуть текущее решение (на котором стоим)
          nNewID:=resh.ID2;
          resh.FAutoID:=-1;  // на всякий случай сбросим, что-бы ниже записать
          resh.FBookmark:='';
        end;
      end;
      tbOcheredResh.Filter:=sFilter;
      tbOcheredResh.Filtered:=true;
      dbEnableControls(tbOcheredResh,l);
    end;
    //----------------------

    strBookMark:=dmBase.tbMens.Bookmark;
    slBookMark:=TStringList.Create;

    with dmBase.tbOchered do begin
      if not Locate('OCHERED_ID;ID', VarArrayOf([0,ID]), []) then begin
        Append;
        FieldByName('OCHERED_ID').AsInteger := 0;
        FieldByName('ID').AsInteger := ID;
      end else begin
        Edit;
      end;

      if mtDokumentID_BASE.IsNull
        then FieldByName('ID_BASE').AsInteger:=0
        else FieldByName('ID_BASE').AsInteger:=mtDokumentID_BASE.AsInteger;
      nBase:=FieldByName('ID_BASE').AsInteger;

      FieldByName('DELO').AsString := mtDokumentDELO.AsString;

      s:=Trim(mtDokumentDELO.AsString);
      sDelo:=s;
      // запишем числовой номер дела
      FieldByName('N_DELO').AsInteger:=CreateNDelo(sDelo);
      nDelo:=FieldByName('N_DELO').AsInteger;

      FieldByName('NOMER_OCH').AsString := mtDokumentNOMER_OCH.AsString;
      FieldByName('OLD_NOMER').AsString := mtDokumentOLD_NOMER.AsString;
      WriteDateField(FieldByName('DEC_DATE_REAL'),mtDokumentDEC_DATE_REAL);
      if mtDokumentDEC_DATE.IsNull
        then WriteDateField(FieldByName('DEC_DATE'),mtDokumentDEC_DATE_REAL)
        else WriteDateField(FieldByName('DEC_DATE'),mtDokumentDEC_DATE);
//      FieldByName('DEC_NOMER').AsString:=mtDokumentDEC_NOMER.AsString;

      WriteDateField(FieldByName('DEC_TIME'),mtDokumentDEC_TIME);
      FieldByName('REG_NOMER').AsString:=mtDokumentREG_NOMER.AsString;
      FieldByName('SLUGEB_POMECH').AsString:=mtDokumentSLUGEB_POMECH.AsString;
      FieldByName('DOP_OCHERED').AsString:=mtDokumentDOP_OCHERED.AsString;
      WriteField( FieldByName('PRIME'), mtDokumentPRIME, lErr );
      WriteDateField(FieldByName('LGOT_DATE'), mtDokumentLGOT_DATE);
      FieldByName('TAIL').AsString:=mtDokumentTAIL.AsString;

      WriteDateField(FieldByName('DOP_DATE'),mtDokumentDOP_DATE);
//!!!
      lFull_Iskl:=false;
      lIskl:=false;
      lOtkaz:=false;
      lCheck:=false;

      //----- решения по очереди ------------------------------------------------------
      if OchReshMod then begin
        l:=dbDisableControls(tbOcheredResh);
        sl:=TStringList.Create;
        lCheck:=true;
        sFilter:=tbOcheredResh.Filter;
        tbOcheredResh.SetRange([IDInternal],[IDInternal]);
        try
        tbOcheredResh.Filter:='ochered_id=0';
        tbOcheredResh.Filtered:=true;
        // если самое последнее (первая строка) решение: решение о снятии  с общей очереди или отказ от регистрации
        if not tbOcheredResh.Eof then begin
          if tbOcheredReshOTKAZ.AsBoolean
            then lOtkaz:=true;
          if (tbOcheredReshTIP.AsInteger=OCH_RESH_SN) or lOtkaz then begin
            lFull_Iskl:=true;
            lIskl:=true;
          end;
        end;
        tbOcheredResh.Filtered:=false;
        tbOcheredResh.First;

        //------- соберем ключи  -------------------
        dmBase.tbOcheredResh.IndexName := 'OCHERED_KEY';  // "ID;OCHERED_ID"
        dmBase.tbOcheredResh.SetRange([ID],[ID]);
        while not dmBase.tbOcheredResh.Eof do begin
          sl.Add(dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsString);
          dmBase.tbOcheredResh.Next;
        end;
        dmBase.tbOcheredResh.CancelRange;
        //------------------------------------------

        dmBase.tbOcheredResh.IndexName := 'AUTO_KEY';  // "AUTO_ID"
        lFirst:=true;
        // !!! пишем в обратном порядке для правильного присвоения AUTO_ID
        tbOcheredResh.Last;
//        while not tbOcheredResh.Eof do begin
        while not tbOcheredResh.Bof do begin
          if tbOcheredReshAUTO_ID.AsInteger>0 then begin
            // если нашли запись в базе
            if dmBase.tbOcheredResh.FindKey([tbOcheredReshAUTO_ID.AsInteger]) then begin
              dmBase.tbOcheredResh.Edit;
              writeCurResh(ID,lFirst,nBase);
              dmBase.tbOcheredResh.Post;
              i:=sl.IndexOf(tbOcheredReshAUTO_ID.AsString);  // удалим из списка ключей
              if i>-1 then sl.Delete(i);
            end else begin
              PutError('Не найдено решение '+tbOcheredReshNOMER.AsString);
            end;
          end else begin  // иначе добавляем запись в базу
            dmBase.tbOcheredResh.Append;
            writeCurResh(ID,lFirst,nBase);
            dmBase.tbOcheredResh.Post;

            // запишет AUTO_ID для  tbOcheredResh которая прочитана в памяти
            EditDataSet(tbOcheredResh);
            tbOcheredReshAUTO_ID.AsInteger:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;
            tbOcheredResh.Post;

          end;
          if lFirst and (resh<>nil) and (resh.FAutoID=-1) then begin  // если считывали решение для проведения, сохраним уникальный ключ решения
            resh.FAutoID:=tbOcheredReshAUTO_ID.AsInteger;
            resh.FBookmark:=dmBase.tbOcheredResh.Bookmark;
          end;
          lFirst:=false;
//          tbOcheredResh.Next;
          tbOcheredResh.Prior;
        end;
        //------- удалим оставшиеся в списке ---------
        for i:=0 to sl.Count-1 do begin
          if dmBase.tbOcheredResh.FindKey([StrToInt(sl.Strings[i])]) then begin
            dmBase.tbOcheredResh.Delete;
          end;
        end;
        //-------------------
        SetIDResh(0);  // запишем  ID_LAST_RESH ID_SN_RESH ID_POST_RESH   для основной очереди
        //-------------------

        finally
          sl.Free;
          tbOcheredResh.CancelRange;
          tbOcheredResh.Filter:=sFilter;
          if sFilter<>'' then begin
            tbOcheredResh.Filtered:=true;
          end;
          dbEnableControls(tbOcheredResh,l);
        end;
        //--------------------------------------------
      end;
      if lCheck then begin
        FieldByName('ISKL').AsBoolean:=lIskl;
        FieldByName('OTKAZ').AsBoolean:=lOtkaz;
      end;
      //-------конец записи решения --------------------------------------------------

      WriteDateField(FieldByName('PER_DATE'),mtDokumentPER_DATE);
      WriteDateField(FieldByName('RESIDENCE_DATE'),mtDokumentRESIDENCE_DATE);

      FieldByName('KOLVO_PROPIS').AsString:=mtDokumentKOLVO_PROPIS.AsString;
      FieldByName('KOLVO_SOSTAV').AsString:=mtDokumentKOLVO_SOSTAV.AsString;
//      FieldByName('KOLVO_SOSTAV').AsInteger := tbSostavSem.RecordCount+1;

      FieldByName('KOLVO_KOMN').AsString:=mtDokumentKOLVO_KOMN.AsString;
      FieldByName('KOLVO_KOMN_PR').AsString:=mtDokumentKOLVO_KOMN_PR.AsString;
      WriteField(FieldByName('PLOSH_ALL'),mtDokumentPLOSH_ALL,lErr);
      WriteField(FieldByName('PLOSH_GIL'),mtDokumentPLOSH_GIL,lErr);

      {$IFDEF OCHERED}
        if nIDAdresMen>-1 then begin
          dmBase.WriteValueProp('KOL_KOMN',mtDokumentKOLVO_KOMN_PR.AsInteger,DateFiks,nIDAdresMen,dmbase.TypeObj_Adres,ftInteger);
          dmBase.WriteValueProp('PLOSH_ALL',mtDokumentPLOSH_ALL.AsFloat,DateFiks,nIDAdresMen,dmbase.TypeObj_Adres,ftFloat);
          dmBase.WriteValueProp('PLOSH_GIL',mtDokumentPLOSH_GIL.AsFloat,DateFiks,nIDAdresMen,dmbase.TypeObj_Adres,ftFloat);
        end;
      {$ENDIF}

      FieldByName('SIMPLE').AsInteger:=1;
      FieldByName('TYPEHOUSE').AsString:=mtDokumentTYPEHOUSE.AsString;
      FieldByName('RESIDENCE').AsString:=mtDokumentRESIDENCE.AsString;
      FieldByName('OCHERED_PRIM').AsString:=mtDokumentOCHERED_PRIM.AsString;
      FieldByName('OCHERED_DOK').AsString:=mtDokumentOCHERED_DOK.AsString;
      FieldByName('NEW_ADRES_ID').AsString:=mtDokumentNEW_ADRES_ID.AsString;
      FieldByName('NEW_DOGOVOR').AsString:=mtDokumentNEW_DOGOVOR.AsString;
      FieldByName('NEW_PLOSH_ALL').AsString:=mtDokumentNEW_PLOSH_ALL.AsString;
      FieldByName('NEW_PLOSH_GIL').AsString:=mtDokumentNEW_PLOSH_GIL.AsString;
      FieldByName('NEW_PLOSH_SNP').AsString:=mtDokumentNEW_PLOSH_SNP.AsString;
      FieldByName('NEW_KOLVO_KOMN').AsString:=mtDokumentNEW_KOLVO_KOMN.AsString;
      FieldByName('NEW_KV').AsString:=mtDokumentNEW_KV.AsString;
      WriteDateField(FieldByName('NEW_DATE'),mtDokumentNEW_DATE);

      FieldByName('NEWSEM').AsBoolean := mtDokumentNEWSEM.AsBoolean;
      FieldByName('MNOGO_4').AsBoolean := mtDokumentMNOGO_4.AsBoolean;
      FieldByName('MNOGO_I').AsBoolean := mtDokumentMNOGO_I.AsBoolean;

      FieldByName('SOCIAL').AsString:=mtDokumentSOCIAL.AsString;   // тип предоставленного жилья KEY_OCHERED_SPOSOB
      FieldByName('GSK').AsString:=mtDokumentGSK.AsString;
      FieldByName('UCHASTOK').AsBoolean:=mtDokumentUCHASTOK.AsBoolean;
      FieldByName('IS_UCHASTOK').AsBoolean:=mtDokumentIS_UCHASTOK.AsBoolean;
      WriteDateField(FieldByName('IS_UCHASTOK_DATE'),mtDokumentIS_UCHASTOK_DATE);
      WriteDateField(FieldByName('UCHASTOK_DATE'),mtDokumentUCHASTOK_DATE);

      FieldByName('SIROTA').AsBoolean:=mtDokumentSIROTA.AsBoolean;
      FieldByName('ONLY').AsBoolean:=mtDokumentONLY.AsBoolean;

      FieldByName('DOXOD_SUMMA').AsString:=mtDokumentDOXOD_SUMMA.AsString;
      WriteDateField(FieldByName('KREDIT_DATE'),mtDokumentKREDIT_DATE);
      FieldByName('KREDIT_SUMMA').AsString:=mtDokumentKREDIT_SUMMA.AsString;
      FieldByName('KREDIT_NOMER').AsString:=mtDokumentKREDIT_NOMER.AsString;
      FieldByName('KREDIT_RESH').AsString:=mtDokumentKREDIT_RESH.AsString;
      WriteDateField(FieldByName('SUBSID_DATE'),mtDokumentSUBSID_DATE);
      FieldByName('SUBSID_SUMMA').AsString:=mtDokumentSUBSID_SUMMA.AsString;
      FieldByName('SUBSID_RESH').AsString:=mtDokumentSUBSID_RESH.AsString;
      Post;
    end;

    //----- состав семьи ------------------------------------------------------

    {$IFDEF OCHERED}
    //--- в строку sDelMens помещаются ID людей удаленных из состава семьи очередника --------------------------
    if OchSostavMod then begin
      if sDelMens<>'' then begin
        StrToArr(sDelMens,arr,',',true);
        for n:=0 to Length(arr)-1 do begin
          if arr[n]<>IntToStr(nNewID) then begin
            if dmBase.DeleteMen(DateFiks,arr[n],true) then begin

            end;
          end;
        end;
        sDelMens:='';
        SetLength(arr,0);
      end;
    end;
    //----------------------------------------------------------------------------------------------------------
    {$ENDIF}

    //--- если корректировали состав семьи или ввели какое-либо решение  ------
    if OchSostavMod or (resh<>nil) then begin
      dmBase.tbSostavSem.IndexName := 'PR_KEY';
      dmBase.tbSostavSem.SetRange([ID],[ID]);
      while not dmBase.tbSostavSem.Eof do begin
        dmBase.tbSostavSem.Delete;
      end;
      dmBase.tbSostavSem.CancelRange;
      n:=0;
      l:=dbDisableControls(tbSostavSem);
      tbSostavSem.First;
      tbSostavSem.IndexFieldNames:='ID_INTERNAL;NOMER';
      tbSostavSem.SetRange([IDInternal],[IDInternal]);

      while not tbSostavSem.Eof do begin
        try
          nIDSostav:=tbSostavSemMEMBER_ID.AsInteger;

          dmBase.tbSostavSem.Append;
          dmBase.tbSostavSem.FieldByName('ID').AsInteger:=ID;
          n:=n+1;
          dmBase.tbSostavSem.FieldByName('NOMER').AsInteger:=n;
          dmBase.tbSostavSem.FieldByName('OTNOSH').AsString:=tbSostavSemOTNOSH.AsString;
          dmBase.tbSostavSem.FieldByName('PRICH').AsString:=tbSostavSemPRICH.AsString;
          dmBase.tbSostavSem.FieldByName('ISKL').AsBoolean:=tbSostavSemISKL.AsBoolean;
          dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger:=nIDSostav;
          dmBase.tbSostavSem.FieldByName('FAMILIA').AsString:=tbSostavSemFAMILIA.AsString;
          dmBase.tbSostavSem.FieldByName('NAME').AsString:=tbSostavSemNAME.AsString;
          dmBase.tbSostavSem.FieldByName('OTCH').AsString:=tbSostavSemOTCH.AsString;
          dmBase.tbSostavSem.FieldByName('POL').AsString:=tbSostavSemPOL.AsString;
          WriteDateField(dmBase.tbSostavSem.FieldByName('DATER'), tbSostavSemDATER);
          WriteDateField(dmBase.tbSostavSem.FieldByName('DATEP'), tbSostavSemDATEP);

          dmBase.tbSostavSem.FieldByName('LICH_NOMER').AsString:=tbSostavSemLICH_NOMER.AsString;
          WriteDateField(dmBase.tbSostavSem.FieldByName('PASP_DATE'), tbSostavSemPASP_DATE);
          dmBase.tbSostavSem.FieldByName('PASP_UDOST').AsString:=tbSostavSemPASP_UDOST.AsString;
          dmBase.tbSostavSem.FieldByName('PASP_SERIA').AsString:=tbSostavSemPASP_SERIA.AsString;
          dmBase.tbSostavSem.FieldByName('PASP_NOMER').AsString:=tbSostavSemPASP_NOMER.AsString;
          dmBase.tbSostavSem.FieldByName('PASP_VIDAN').AsString:=tbSostavSemPASP_VIDAN.AsString;
          dmBase.tbSostavSem.FieldByName('TEXT_ADRES').AsString:=tbSostavSemTEXT_ADRES.AsString;
          dmBase.tbSostavSem.Post;

          slBookmark.Add(dmBase.tbSostavSem.Bookmark);

          if nNewID=nIDSostav then begin
            strBookMarkNew:=dmBase.tbSostavSem.Bookmark;
          end;

          SostavToMens(tbSostavSem,nIDAdresMen);
          {$IFDEF OCHERED}
          {
          //--------- запишем в таблицу 'Население' ---------------------------------------------------
          st:=SaveSostTable(dmBase.tbMens,false,false);
          try
            if dmBase.tbMens.Locate('DATE_FIKS;ID', VarArrayOf([dmBase.GetDateCurrentSost,nIDSostav]), []) then begin
              dmBase.tbMens.Edit;
            end else begin
              dmBase.tbMens.Append;
              dmBase.tbMens.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
              dmBase.tbMens.FieldByName('ID').AsInteger:=nIDSostav;
            end;
            dmBase.tbMens.FieldByName('FAMILIA').AsString:=tbSostavSemFAMILIA.AsString;
            dmBase.tbMens.FieldByName('NAME').AsString:=tbSostavSemNAME.AsString;
            dmBase.tbMens.FieldByName('OTCH').AsString:=tbSostavSemOTCH.AsString;
            dmBase.tbMens.FieldByName('OTNOSH').AsString:=tbSostavSemOTNOSH.AsString;
            dmBase.tbMens.FieldByName('POL').AsString:=tbSostavSemPOL.AsString;
            dmBase.tbMens.FieldByName('LICH_NOMER').AsString:=tbSostavSemLICH_NOMER.AsString;
            WriteDateField(dmBase.tbMens.FieldByName('PASP_DATE'), tbSostavSemPASP_DATE);
            dmBase.tbMens.FieldByName('PASP_UDOST').AsString:=tbSostavSemPASP_UDOST.AsString;
            dmBase.tbMens.FieldByName('PASP_SERIA').AsString:=tbSostavSemPASP_SERIA.AsString;
            dmBase.tbMens.FieldByName('PASP_NOMER').AsString:=tbSostavSemPASP_NOMER.AsString;
            dmBase.WriteProp(DateFiks, nIDSostav, tbSostavSem, 'PASP_VIDAN', dmBase.TypeObj_Nasel);

            if tbSostavSemTEXT_ADRES.AsString='' then begin         // дополнительный адрес пустой
              if dmBase.tbMensAdd.Locate('ID', nIDSostav, []) then begin
                dmBase.tbMensAdd.Delete;                            // !!!
              end;
            end else begin         // запишем дополнительны адрес члена семьи
              if not dmBase.tbMensAdd.Locate('ID', nIDSostav, []) then begin
                dmBase.tbMensAdd.Append;                            // !!!
                dmBase.tbMensAdd.FieldByName('ID').AsInteger:=nIDSostav;
              end else begin
                dmBase.tbMensAdd.Edit;                            // !!!
              end;
              dmBase.tbMensAdd.FieldByName('TEXT_ADRES').AsString:=tbSostavSemTEXT_ADRES.AsString;
              dmBase.tbMensAdd.Post;
            end;

            dmBase.tbMens.FieldByName('CITIZEN').AsInteger:=112;
            if nIDAdresMen>-1
              then dmBase.tbMens.FieldByName('ADRES_ID').AsInteger:=nIDAdresMen;
            WriteDateField(dmBase.tbMens.FieldByName('DATER'), tbSostavSemDATER);
            dmBase.tbMens.Post;
          finally
            RestSostTable(dmBase.tbMens,st);
          end;
          //---------------------------------------------------------------------------------------------------
          }
          {$ENDIF}
        except
          on E: Exception do begin
            dmBase.tbSostavSem.Cancel;
            PutError(E.Message);
          end;
        end;
        tbSostavSem.Next;
      end;
      tbSostavSem.CancelRange;
      tbSostavSem.First;
      dbEnableControls(tbSostavSem,l);
    end;

   //----- льготные очереди ------------------------------------------------------
    st:=SaveSostTable(dmBase.tbOchered, false,false);
    dmBase.tbOchered.IndexName := 'MEN_KEY';  // "ID;OCHERED_ID"
    dmBase.tbOchered.SetRange([ID],[ID]);
    while not dmBase.tbOchered.Eof do begin
      if dmBase.tbOchered.FieldByName('OCHERED_ID').AsInteger<>0
        then dmBase.tbOchered.Delete
        else dmBase.tbOchered.Next;
    end;
    dmBase.tbOchered.CancelRange;

    l:=dbDisableControls(tbOcheredLgot);
    tbOcheredLgot.First;
    tbOcheredLgot.IndexFieldNames:='ID_INTERNAL;DEC_DATE;OCHERED_ID';
    tbOcheredLgot.SetRange([IDInternal],[IDInternal]);

    while not tbOcheredLgot.Eof do begin
      try
        dmBase.tbOchered.Append;
        dmBase.tbOchered.FieldByName('ID').AsInteger:=ID;
        dmBase.tbOchered.FieldByName('ID_BASE').AsInteger:=nBase;
        dmBase.tbOchered.FieldByName('OCHERED_ID').AsInteger:=tbOcheredLgotOCHERED_ID.AsInteger;
        dmBase.tbOchered.FieldByName('NOMER_OCH').AsInteger:=tbOcheredLgotNOMER_OCH.AsInteger;
        dmBase.tbOchered.FieldByName('OLD_NOMER').AsInteger:=tbOcheredLgotOLD_NOMER.AsInteger;

        // только для социальной очереди или многодетной очереди
        if ((tbOcheredLgotOCHERED_ID.AsInteger=OCH_TYPE_SOCIAL) or (tbOcheredLgotOCHERED_ID.AsInteger=OCH_TYPE_MNOGO)) and tbOcheredLgotVNEOCH.AsBoolean
          then dmBase.tbOchered.FieldByName('SIMPLE').AsInteger:=0
          else dmBase.tbOchered.FieldByName('SIMPLE').AsInteger:=1;

        WriteDateField(dmBase.tbOchered.FieldByName('DEC_DATE_REAL'),tbOcheredLgotDEC_DATE_REAL);
        if tbOcheredLgotDEC_DATE.IsNull
          then WriteDateField(dmBase.tbOchered.FieldByName('DEC_DATE'),tbOcheredLgotDEC_DATE_REAL)
          else WriteDateField(dmBase.tbOchered.FieldByName('DEC_DATE'),tbOcheredLgotDEC_DATE);
        dmBase.tbOchered.FieldByName('DEC_NOMER').AsInteger:=tbOcheredLgotDEC_NOMER.AsInteger;
        WriteDateField(dmBase.tbOchered.FieldByName('DEC_TIME'),tbOcheredLgotDEC_TIME);

        dmBase.tbOchered.FieldByName('DELO').AsString:=sDelo;
        dmBase.tbOchered.FieldByName('N_DELO').AsInteger:=nDelo;

//        dmBase.tbOchered.FieldByName('OTKAZ').AsBoolean:=tbOcheredLgotOTKAZ.AsBoolean;
        //-----------------------------------------------------------------------
        if lFull_Iskl then begin
          dmBase.tbOchered.FieldByName('ISKL').AsBoolean:=true;
        end else begin
          dmBase.tbOchered.FieldByName('ISKL').AsBoolean:=tbOcheredLgotISKL.AsBoolean;
        end;

        dmBase.tbOchered.FieldByName('OCHERED_PRIM').AsString:=tbOcheredLgotOCHERED_PRIM.AsString;
        dmBase.tbOchered.FieldByName('OCHERED_DOK').AsString:=tbOcheredLgotOCHERED_DOK.AsString;

        dmBase.tbOchered.FieldByName('KOLVO_PROPIS').AsString:=mtDokumentKOLVO_PROPIS.AsString;
        dmBase.tbOchered.FieldByName('KOLVO_SOSTAV').AsString:=mtDokumentKOLVO_SOSTAV.AsString;
        dmBase.tbOchered.FieldByName('KOLVO_KOMN').AsString:=mtDokumentKOLVO_KOMN.AsString;
        dmBase.tbOchered.FieldByName('KOLVO_KOMN_PR').AsString:=mtDokumentKOLVO_KOMN_PR.AsString;
        dmBase.tbOchered.FieldByName('PLOSH_ALL').AsString:=mtDokumentPLOSH_ALL.AsString;

        dmBase.tbOchered.FieldByName('TYPEHOUSE').AsString:=mtDokumentTYPEHOUSE.AsString;
        dmBase.tbOchered.FieldByName('RESIDENCE').AsString:=mtDokumentRESIDENCE.AsString;
        WriteDateField(dmBase.tbOchered.FieldByName('LGOT_DATE'), mtDokumentLGOT_DATE);
        WriteDateField(dmBase.tbOchered.FieldByName('RESIDENCE_DATE'), mtDokumentRESIDENCE_DATE);
        WriteDateField(dmBase.tbOchered.FieldByName('LGOT_DATE'), mtDokumentLGOT_DATE);

        dmBase.tbOchered.FieldByName('NEWSEM').AsBoolean := mtDokumentNEWSEM.AsBoolean;
        dmBase.tbOchered.FieldByName('MNOGO_4').AsBoolean := mtDokumentMNOGO_4.AsBoolean;
        dmBase.tbOchered.FieldByName('MNOGO_I').AsBoolean := mtDokumentMNOGO_I.AsBoolean;

        dmBase.tbOchered.FieldByName('SOCIAL').AsString:=mtDokumentSOCIAL.AsString;   // тип предоставленного жилья KEY_OCHERED_SPOSOB
        dmBase.tbOchered.FieldByName('GSK').AsString:=mtDokumentGSK.AsString;
        dmBase.tbOchered.FieldByName('UCHASTOK').AsBoolean:=mtDokumentUCHASTOK.AsBoolean;
        dmBase.tbOchered.FieldByName('IS_UCHASTOK').AsBoolean:=mtDokumentIS_UCHASTOK.AsBoolean;
        WriteDateField(dmBase.tbOchered.FieldByName('IS_UCHASTOK_DATE'), mtDokumentIS_UCHASTOK_DATE);
        dmBase.tbOchered.FieldByName('SIROTA').AsBoolean:=mtDokumentSIROTA.AsBoolean;
        dmBase.tbOchered.FieldByName('ONLY').AsBoolean:=mtDokumentONLY.AsBoolean;

        dmBase.tbOchered.FieldByName('NEW_ADRES_ID').AsString:=mtDokumentNEW_ADRES_ID.AsString;
        dmBase.tbOchered.FieldByName('NEW_DOGOVOR').AsString:=mtDokumentNEW_DOGOVOR.AsString;
        dmBase.tbOchered.FieldByName('NEW_PLOSH_ALL').AsString:=mtDokumentNEW_PLOSH_ALL.AsString;
        dmBase.tbOchered.FieldByName('NEW_PLOSH_GIL').AsString:=mtDokumentNEW_PLOSH_GIL.AsString;
        dmBase.tbOchered.FieldByName('NEW_PLOSH_SNP').AsString:=mtDokumentNEW_PLOSH_SNP.AsString;
        dmBase.tbOchered.FieldByName('NEW_KOLVO_KOMN').AsString:=mtDokumentNEW_KOLVO_KOMN.AsString;
        dmBase.tbOchered.FieldByName('NEW_KV').AsString:=mtDokumentNEW_KV.AsString;
        WriteDateField(dmBase.tbOchered.FieldByName('NEW_DATE'),mtDokumentNEW_DATE);

        //-------------------
        SetIDResh(tbOcheredLgotOCHERED_ID.AsInteger);  // запишем  ID_LAST_RESH ID_SN_RESH ID_POST_RESH  для льготной очереди
        //-------------------

        dmBase.tbOchered.Post;
      except
        on E: Exception do begin
          dmBase.tbOchered.Cancel;
          PutError(E.Message);
        end;
      end;
      tbOcheredLgot.Next;
    end;
    tbOcheredLgot.CancelRange;
    tbOcheredLgot.First;
    dbEnableControls(tbOcheredLgot,l);
   
    if resh<>nil then begin  // необходима реорганизация
      n:=Globaltask.ParamAsInteger('RESH_PROV');
      if n>0 then begin
        if (n=2) or Problem('Провести '+globaltask.CurrentOpisEdit.SeekValue('KEY_TYPE_RESH',IntToStr(resh.Tip),false)+' очереди ? ') then begin
          l:=false;
          if resh.Tip=OCH_RESH_PERE then begin            // переоформление
            l:=PereofOchered(resh,ID,nNewID,strBookMark,slBookMark);
          end else if resh.Tip=OCH_RESH_RAZD then begin   // разделение
            l:=RazdelOchered(resh,ID,nNewID,strBookMark,strBookMarkNew);
          end else if resh.Tip=OCH_RESH_UNION then begin   // объединение
            l:=UnionOchered(resh,ID,nNewID,strBookMark,sDelo);
          end;
          if not l
            then PutError('Ошибка проведения опереции.')
            else ShowMessage('Операция успешно проведена.');
        end;
      end;
    end;

    slBookMark.Free;

    dmBase.tbMens.BookMark:=strBookMark;
    FreeAndNil(resh);
  end;
{$ENDIF}
end;
//-----------------------------------------------------------------------
// запишем в таблицу 'Население'
function TdmMen.SostavToMens(dsSostavSem:TDataSet; nIDAdresMen:Integer):Boolean;
{$IFDEF OCHERED}
var
  st:TSostTable;
  nIDSostav:Integer;
{$ENDIF}
begin
Result:=true;
{$IFDEF OCHERED}
nIDSostav:=dsSostavSem.FieldByName('MEMBER_ID').AsInteger;
st:=SaveSostTable(dmBase.tbMens,false,false);
try
  if dmBase.tbMens.Locate('DATE_FIKS;ID', VarArrayOf([dmBase.GetDateCurrentSost,nIDSostav]), []) then begin
    dmBase.tbMens.Edit;
  end else begin
    dmBase.tbMens.Append;
    dmBase.tbMens.FieldByName('DATE_FIKS').AsDateTime:=dmBase.GetDateCurrentSost;
    dmBase.tbMens.FieldByName('ID').AsInteger:=nIDSostav;
  end;
  dmBase.tbMens.FieldByName('FAMILIA').AsString:=dsSostavSem.FieldByName('FAMILIA').AsString;
  dmBase.tbMens.FieldByName('NAME').AsString:=dsSostavSem.FieldByName('NAME').AsString;
  dmBase.tbMens.FieldByName('OTCH').AsString:=dsSostavSem.FieldByName('OTCH').AsString;
  dmBase.tbMens.FieldByName('OTNOSH').AsString:=dsSostavSem.FieldByName('OTNOSH').AsString;
  dmBase.tbMens.FieldByName('POL').AsString:=dsSostavSem.FieldByName('POL').AsString;
  dmBase.tbMens.FieldByName('LICH_NOMER').AsString:=dsSostavSem.FieldByName('LICH_NOMER').AsString;
  WriteDateField(dmBase.tbMens.FieldByName('PASP_DATE'), dsSostavSem.FieldByName('PASP_DATE'));
  dmBase.tbMens.FieldByName('PASP_UDOST').AsString:=dsSostavSem.FieldByName('PASP_UDOST').AsString;
  dmBase.tbMens.FieldByName('PASP_SERIA').AsString:=dsSostavSem.FieldByName('PASP_SERIA').AsString;
  dmBase.tbMens.FieldByName('PASP_NOMER').AsString:=dsSostavSem.FieldByName('PASP_NOMER').AsString;
  dmBase.WriteProp(DateFiks, nIDSostav, dsSostavSem, 'PASP_VIDAN', dmBase.TypeObj_Nasel);

  if dsSostavSem.FieldByName('TEXT_ADRES').AsString='' then begin         // дополнительный адрес пустой
    if dmBase.tbMensAdd.Locate('ID', nIDSostav, []) then begin
      dmBase.tbMensAdd.Delete;                            // !!!
    end;
  end else begin         // запишем дополнительны адрес члена семьи
    if not dmBase.tbMensAdd.Locate('ID', nIDSostav, []) then begin
      dmBase.tbMensAdd.Append;                            // !!!
      dmBase.tbMensAdd.FieldByName('ID').AsInteger:=nIDSostav;
    end else begin
      dmBase.tbMensAdd.Edit;                            // !!!
    end;
    dmBase.tbMensAdd.FieldByName('TEXT_ADRES').AsString:=dsSostavSem.FieldByName('TEXT_ADRES').AsString;
    dmBase.tbMensAdd.Post;
  end;

  dmBase.tbMens.FieldByName('CITIZEN').AsInteger:=112;
  if nIDAdresMen>-1
    then dmBase.tbMens.FieldByName('ADRES_ID').AsInteger:=nIDAdresMen;
  WriteDateField(dmBase.tbMens.FieldByName('DATER'), dsSostavSem.FieldByName('DATER'));
  dmBase.tbMens.Post;
finally
  RestSostTable(dmBase.tbMens,st);
end;
//---------------------------------------------------------------------------------------------------
{$ENDIF}
end;

//---------------------------------------------------------------------
function TdmMen.PereofOchered(resh:TReshOchMen; nID:Integer; nNewID:Integer; strBookMarkMen:String; slBookMark:TStringList):Boolean;
var
  Opis:TOpisEdit;
  n:Integer;
  ds:TDataSet;
  s,sFIO,sOtn,sSQL:String;
begin
  sFIO:='';
  Result:=false;
  {$IFNDEF ZAGS}
  if dmBase.tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([0,nID]),[]) then begin
    try
    ds:=dmBase.GetMen(dmBase.GetDateCurrentSost,IntToStr(nNewID));
    ds.Edit;
    ds.FieldByName('OCHERED').AsBoolean:=true;   // теперь новый в очереди
    ds.Post;

    dmBase.tbMens.Bookmark:=strBookMarkMen;   // возвращаемся на текущего

    EditDataSet(dmBase.tbMens);
    dmBase.tbMens.FieldByName('OCHERED').AsBoolean:=false;  // старый хозяин теперь не стоит в очереди
    PostDataSet(dmBase.tbMens);
    //----------------------------------------
    sOtn:='';
    for n:=0 to slBookmark.Count-1 do begin
      dmBase.tbSostavSem.Bookmark:=slBookmark[n];
      if dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger=nNewID then begin // если нашли нового хозяина в списке состава семьи
        sOtn:=dmBase.tbSostavSem.FieldByName('OTNOSH').AsString;  // отношение нового к главе очереди
      end;
    end;
    //----------------------------------------

    for n:=0 to slBookmark.Count-1 do begin
      dmBase.tbSostavSem.Bookmark:=slBookmark[n];
      dmBase.tbSostavSem.Edit;
      dmBase.tbSostavSem.FieldByName('ID').AsInteger:=nNewID;   // переподчиним сосстав семьи на нового хозяина
      if dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger=nNewID then begin   // если нашли нового хозяина в списке состава семьи
        sFIO:=dmBase.tbSostavSem.FieldByName('FAMILIA').AsString+' '+
              dmBase.tbSostavSem.FieldByName('NAME').AsString+' '+
              dmBase.tbSostavSem.FieldByName('OTCH').AsString;
        dmBase.tbSostavSem.FieldByName('FAMILIA').AsString:=mtDokumentFAMILIA.AsString;
        dmBase.tbSostavSem.FieldByName('NAME').AsString:=mtDokumentNAME.AsString;
        dmBase.tbSostavSem.FieldByName('OTCH').AsString:=mtDokumentOTCH.AsString;
        dmBase.tbSostavSem.FieldByName('POL').AsString:=mtDokumentPOL.AsString;
        dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger:=nID;  // старый хозяин очереди становиться в состав семьи
        dmBase.tbSostavSem.FieldByName('LICH_NOMER').AsString:=mtDokumentLICH_NOMER.AsString;

        dmBase.tbSostavSem.FieldByName('PASP_UDOST').AsString:=mtDokumentPASP_UDOST.AsString;
        dmBase.tbSostavSem.FieldByName('PASP_SERIA').AsString:=mtDokumentPASP_SERIA.AsString;
        dmBase.tbSostavSem.FieldByName('PASP_NOMER').AsString:=mtDokumentPASP_NOMER.AsString;
        dmBase.tbSostavSem.FieldByName('PASP_VIDAN').AsString:=mtDokumentPASP_VIDAN.AsString;
        WriteDateField(dmBase.tbSostavSem.FieldByName('PASP_DATE'), mtDokumentPASP_DATE);

        if sOtn<>''
          then s:=GetOtnoshID(nNewID,sOtn,nID,'',mtDokumentPOL.AsString) else s:='';
        dmBase.tbSostavSem.FieldByName('OTNOSH').AsString:=s;
        if not mtDokumentDATER.IsNull
          then dmBase.tbSostavSem.FieldByName('DATER').AsDateTime:=mtDokumentDATER.AsDateTime
          else dmBase.tbSostavSem.FieldByName('DATER').AsString:='';
      end else begin
        if (sOtn<>'')
          then s:=GetOtnoshID(nNewID,sOtn,dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger,dmBase.tbSostavSem.FieldByName('OTNOSH').AsString,
                                 dmBase.tbSostavSem.FieldByName('POL').AsString)
          else s:='';
        dmBase.tbSostavSem.FieldByName('OTNOSH').AsString:=s;
      end;
      dmBase.tbSostavSem.Post;
    end;

  //------ поменяем хозяина всех очередей и решений
  sSQL:='UPDATE OcheredResh SET ID='+IntToStr(nNewID)+' WHERE ID='+intToStr(nID)+';'+#13#10+
        'UPDATE Ochered SET ID='+IntToStr(nNewID)+' WHERE ID='+intToStr(nID)+';';
  dmbase.AdsConnection.Execute(sSQL);
  //---------------------------------------------------------------------------------------
{   dmBase.tbOchered.Edit;
    dmBase.tbOchered.FieldByName('ID').AsInteger:=nNewID;
    dmBase.tbOchered.Post;

    // поменяем хозяина очереди в дополнительных очередях если он там есть
    Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEOCHERED');
    for n:=0 to Opis.KeyList.Count-1 do begin
      if dmBase.tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([Opis.KeyList.Strings[n],nID]),[]) then begin
        dmBase.tbOchered.Edit;
        dmBase.tbOchered.FieldByName('ID').AsInteger:=nNewID;
        dmBase.tbOchered.Post;
      end;
    end;
    // переподчиним все решения
    while dmBase.tbOcheredResh.Locate('ID',nID,[]) do begin
      dmBase.tbOcheredResh.Edit;
      dmBase.tbOcheredResh.FieldByName('ID').AsInteger:=nNewID;
      dmBase.tbOcheredResh.Post;
    end;       }
    // отметим проведение операции
    dmBase.tbOcheredResh.Bookmark:=resh.FBookmark;
    EditDataSet(dmBase.tbOcheredResh);
    dmBase.tbOcheredResh.FieldByName('PROV').AsBoolean:=true;
    dmBase.tbOcheredResh.FieldByName('ID1').AsInteger:=nID;
    PostDataSet(dmBase.tbOcheredResh);
    Result:=true;
    if FListPar<>nil then begin
      FListPar.Add('OPEN_DOK='+IntToStr(_TypeObj_Nasel));
      FListPar.Add('OPEN_ID='+IntToStr(nNewID));
    end;
    except
      on E:Exception do begin
        PutError(' Ошибка: '+E.Message);
      end;
    end;
  end;
  {$ENDIF}
end;

//---------------------------------------------------------------------
function TdmMen.RazdelOchered(resh:TReshOchMen; nID:Integer; nNewID:Integer; strBookMarkMen:String; strBookMarkNew:String):Boolean;
var
//  arrRec,arrRecResh:TCurrentRecord;
  arrRec:TCurrentRecord;
  ds:TDataSet;
  s,ss,sFIO,sFIO2:string;
  nIDResh:Integer;
begin
  sFIO:=GetFIO;
  sFIO:=GetPadegFIO(sFIO2,mtDokumentPOL.AsString,'Т');
  Result:=false;
  {$IFNDEF ZAGS}
  if dmBase.tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([0,nNewID]),[]) then begin
    // ошибка: человек с которым делят очередь уже есть в базе
    s:=dmBase.FIOMen(dmbase.GetDateCurrentSost, IntToStr(nNewID));
    PutError(s+' уже присутствует в базе очередников.');
    exit;
  end;                                       

  if dmBase.tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([0,nID]),[]) then begin
    try
    // удалим из состава семьи
    dmBase.tbSostavSem.Bookmark:=strBookmarkNew;
    with dmBase.tbSostavSem do begin
      sFIO2:=FieldByName('FAMILIA').AsString+' '+FieldByName('NAME').AsString+' '+FieldByName('OTCH').AsString;
      sFIO2:=GetPadegFIO(sFIO2,FieldByName('POL').AsString,'Т');
    end;
    dmBase.tbSostavSem.Delete;

    //---- скопируем решение в нового человека
    with dmBase.tbOcheredResh do begin
      Append;
      FieldByName('ID').AsInteger:=nNewID;
      FieldByName('TIP').AsInteger:=OCH_RESH_POST;
      FieldByName('NOMER').AsString:=resh.Nomer;
      FieldByName('OCHERED_ID').AsInteger:=0;
      if resh.DateR>0 then FieldByName('DATER').AsDateTime:=resh.DateR;
      if resh.DateSila>0 then FieldByName('DATE_SILA').AsDateTime:=resh.DateSila;
      FieldByName('OSNOV').AsInteger:=resh.Osnov;
      FieldByName('OSNOV_TEXT').AsString:=resh.OsnovText;
      FieldByName('OSNOV2').AsInteger:=resh.Osnov2;
      FieldByName('OSNOV_TEXT2').AsString:=resh.OsnovText2;
      FieldByName('ID2').AsInteger:=0;
      FieldByName('RAZD').AsBoolean:=true;
      Post;
    end;
    nIDResh:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;   // ID решения для нового человека

    // создадим для нового такую же очередь
    GetCurrentRecord(dmBase.tbOchered,'',arrRec);

    // умеьшим на 1 количественный состав семьи и запишем примечание
    dmBase.tbOchered.Edit;
    dmBase.tbOchered.FieldByName('KOLVO_SOSTAV').AsInteger:=dmBase.tbOchered.FieldByName('KOLVO_SOSTAV').AsInteger-1;
    s:=Trim(dmBase.tbOchered.FieldByName('OCHERED_PRIM').AsString);
    ss:=Format('Решением № %s от %s очередь разделена с %s',[resh.Nomer,DatePropis(resh.DateR,3),sFIO2]);
    if s=''
      then dmBase.tbOchered.FieldByName('OCHERED_PRIM').AsString:=ss
      else dmBase.tbOchered.FieldByName('OCHERED_PRIM').AsString:=s+Chr(13)+Chr(10)+ss;
    dmBase.tbOchered.Post;

    SetValueField(arrRec,'ID',nNewID);
    SetValueField(arrRec,'KOLVO_SOSTAV',1);
    SetValueField(arrRec,'ID_LAST_RESH',nIDResh);
    SetValueField(arrRec,'ID_LAST_POST',nIDResh);
    ss:=Format('Создана решением № %s от %s о разделении очереди с %s',[resh.Nomer, DatePropis(resh.DateR,3),sFIO]);
    SetValueField(arrRec,'OCHERED_PRIM',ss);
    AddCurrentRecord(dmBase.tbOchered,arrRec);

    // установим, что он теперь в очереди, и проставим решиня
    ds:=dmBase.GetMen(dmBase.GetDateCurrentSost,IntToStr(nNewID));
    ds.Edit;
    ds.FieldByName('OCHERED').AsBoolean:=true;   // теперь новый в очереди
    ds.Post;
    dmBase.tbMens.Bookmark:=strBookMarkMen;

    // отметим успешное проведение операции
    dmBase.tbOcheredResh.Bookmark:=resh.FBookmark;
    EditDataSet(dmBase.tbOcheredResh);
    dmBase.tbOcheredResh.FieldByName('PROV').AsBoolean:=true;
    PostDataSet(dmBase.tbOcheredResh);

    Result:=true;
    if FListPar<>nil then begin
      FListPar.Add('OPEN_DOK='+IntToStr(_TypeObj_Nasel));
      FListPar.Add('OPEN_ID='+IntToStr(nNewID));
    end;
    except
      on E:Exception do begin
        PutError(' Ошибка: '+E.Message);
      end;
    end;
  end;
  {$ENDIF}
end;

//---------------------------------------------------------------------
function TdmMen.UnionOchered(resh:TReshOchMen; nID:Integer; nNewID:Integer; strBookMarkMen:String; sDelo:String):Boolean;
var
//  Opis:TOpisEdit;
  n:Integer;
  ds:TDataSet;
//  curRec : TCurrentRecord;
  newMen : TCurrentRecord;
  arrRec : array of TCurrentRecord;
  v:Variant;
  nNomer, nIDResh, nOldID:Integer;
  ss,sSQL:String;
  lCopy:Boolean;
  sBookMark:TBookmarkStr;
  dDateAdd:TDateTime;
begin
  nIDResh:=0;
  Result:=false;
  {$IFNDEF ZAGS}
  //--- копировать человека при объединении очереди  ---
  // т.е. он будет скопирован к новому очереднику и в старой очереди помечен как исключенный
  {$IFDEF OCHERED}
    lCopy:=not GlobalTAsk.ParamAsBoolean('UNION_DELETE');
  {$ELSE}
    lCopy:=false;  // для ЛАИС пока так
  {$ENDIF}

  dDateAdd:=0;
  if resh.DateR>0    then dDateAdd:=resh.DateR;
  if resh.DateSila>0 then dDateAdd:=resh.DateSila;

  try
  // возьмем данные нового человека
  nOldID:=nNewID;
  ds:=dmBase.GetMen(dmBase.GetDateCurrentSost,IntToStr(nNewID));
  GetCurrentRecord(ds,'',newMen);

  ds.Edit;
  ds.FieldByName('OCHERED').AsBoolean:=false;   // теперь новый в не стоит в очереди
  ds.Post;

//  SetLength(arrRec, 1);
//  arrRec[0]:=newMen;

  dmBase.tbSostavSem.IndexName := 'PR_KEY';
  // возмьмем следующий номер для состава семьи
  dmBase.tbSostavSem.SetRange([nID],[nID]);
  dmBase.tbSostavSem.Last;
  nNomer:=dmBase.tbSostavSem.FieldByName('NOMER').AsInteger+1;
  dmBase.tbSostavSem.CancelRange;

  // соберем состав семьи добавляемого человека
  dmBase.tbSostavSem.SetRange([nNewID],[nNewID]);
  n:=0;
  while not dmBase.tbSostavSem.Eof do begin
    SetLength(arrRec, n+1);
    GetCurrentRecord(dmBase.tbSostavSem,'',arrRec[n]);
    if lCopy then begin           // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      SetValueField(arrRec[n], 'MEMBER_ID', dmBase.GetNewID( dmBase.TypeObj_Nasel ));  // новый ID для человека из состава семьи
      dmBase.tbSostavSem.Next;
    end else begin
      dmBase.tbSostavSem.Delete;  // удалим состав очереди, которого подключаем
    end;
    n:=n+1;
  end;
  dmBase.tbSostavSem.CancelRange;

  if lCopy then begin  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    nNewID := dmBase.GetNewID( dmBase.TypeObj_Nasel );
  end;

  // добавим самого нового человека к составу семьи текущего человека
  dmBase.tbSostavSem.Append;
  dmBase.tbSostavSem.FieldByName('ID').AsInteger:=nID;  // хозяин очереди
  dmBase.tbSostavSem.FieldByName('OTNOSH').AsString:='';
  dmBase.tbSostavSem.FieldByName('NOMER').AsInteger:=nNomer;
  nNomer:=nNomer+1;
  dmBase.tbSostavSem.FieldByName('FAMILIA').AsString:=GetValueFieldEx(newMen,'FAMILIA','');
  dmBase.tbSostavSem.FieldByName('NAME').AsString:=GetValueFieldEx(newMen,'NAME','');
  dmBase.tbSostavSem.FieldByName('OTCH').AsString:=GetValueFieldEx(newMen,'OTCH','');
  dmBase.tbSostavSem.FieldByName('POL').AsString:=GetValueFieldEx(newMen,'POL','');

  dmBase.tbSostavSem.FieldByName('LICH_NOMER').AsString:=GetValueFieldEx(newMen,'LICH_NOMER','');
  dmBase.tbSostavSem.FieldByName('PASP_UDOST').AsString:=GetValueFieldEx(newMen,'PASP_UDOST','');
  dmBase.tbSostavSem.FieldByName('PASP_SERIA').AsString:=GetValueFieldEx(newMen,'PASP_SERIA','');
  dmBase.tbSostavSem.FieldByName('PASP_NOMER').AsString:=GetValueFieldEx(newMen,'PASP_NOMER','');
  dmBase.tbSostavSem.FieldByName('PASP_VIDAN').AsString:=GetValueFieldEx(newMen,'PASP_VIDAN','');
  dmBase.tbSostavSem.FieldByName('PRICH').AsInteger:=PRICH_ADD_UNION;
  v:=GetValueField(newMen,'PASP_DATE');
  if v<>null then dmBase.tbSostavSem.FieldByName('PASP_DATE').AsDateTime:=v;
  if dDateAdd>0 then dmBase.tbSostavSem.FieldByName('DATEP').AsDateTime:=dDateAdd;

  dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger:=nNewID; //GetValueFieldEx(newMen,'ID',0);
  v:=GetValueField(newMen,'DATER');
  if v<>null then dmBase.tbSostavSem.FieldByName('DATER').AsDateTime:=v;
  dmBase.tbSostavSem.Post;
  if lCopy then begin  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    SostavToMens(dmBase.tbSostavSem,-1);
  end;

  // добавим состав семьи нового человека к составу семьи текущего человека
  for n:=0 to Length(arrRec)-1 do begin
    dmBase.tbSostavSem.Append;
    dmBase.tbSostavSem.FieldByName('ID').AsInteger:=nID;  // хозяин очереди
    dmBase.tbSostavSem.FieldByName('OTNOSH').AsString:='';
    dmBase.tbSostavSem.FieldByName('NOMER').AsInteger:=nNomer;
    nNomer:=nNomer+1;
    dmBase.tbSostavSem.FieldByName('FAMILIA').AsString:=GetValueFieldEx(arrRec[n],'FAMILIA','');
    dmBase.tbSostavSem.FieldByName('NAME').AsString:=GetValueFieldEx(arrRec[n],'NAME','');
    dmBase.tbSostavSem.FieldByName('OTCH').AsString:=GetValueFieldEx(arrRec[n],'OTCH','');
    dmBase.tbSostavSem.FieldByName('POL').AsString:=GetValueFieldEx(arrRec[n],'POL','');
    dmBase.tbSostavSem.FieldByName('LICH_NOMER').AsString:=GetValueFieldEx(arrRec[n],'LICH_NOMER','');

    dmBase.tbSostavSem.FieldByName('PASP_UDOST').AsString:=GetValueFieldEx(arrRec[n],'PASP_UDOST','');
    dmBase.tbSostavSem.FieldByName('PASP_SERIA').AsString:=GetValueFieldEx(arrRec[n],'PASP_SERIA','');
    dmBase.tbSostavSem.FieldByName('PASP_NOMER').AsString:=GetValueFieldEx(arrRec[n],'PASP_NOMER','');
    dmBase.tbSostavSem.FieldByName('PASP_VIDAN').AsString:=GetValueFieldEx(arrRec[n],'PASP_VIDAN','');
    v:=GetValueField(arrRec[n],'PASP_DATE');
    if v<>null then dmBase.tbSostavSem.FieldByName('PASP_DATE').AsDateTime:=v;
    if dDateAdd>0 then dmBase.tbSostavSem.FieldByName('DATEP').AsDateTime:=dDateAdd;
    dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger:=GetValueFieldEx(arrRec[n],'MEMBER_ID',0);
    v:=GetValueField(arrRec[n],'DATER');
    if v<>null then dmBase.tbSostavSem.FieldByName('DATER').AsDateTime:=v;
    dmBase.tbSostavSem.FieldByName('PRICH').AsInteger:=PRICH_ADD_UNION;
    dmBase.tbSostavSem.Post;
    if lCopy then begin  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      SostavToMens(dmBase.tbSostavSem,-1);
    end;  
  end;

  if lCopy then begin
    // если копируем, то занесем в решения присоединяемого очередника решеие о снятии всвязи с объединением
    with dmBase.tbOcheredResh do begin
      Append;
      FieldByName('ID').AsInteger:=nOldID;
      FieldByName('TIP').AsInteger:=OCH_RESH_SN;
      FieldByName('NOMER').AsString:='-'; //resh.Nomer;
      FieldByName('OCHERED_ID').AsInteger:=0;
      if resh.DateR>0 then FieldByName('DATER').AsDateTime:=resh.DateR;
      if resh.DateSila>0 then FieldByName('DATE_SILA').AsDateTime:=resh.DateSila;
      FieldByName('OSNOV_TEXT').AsString:='';
      FieldByName('OSNOV2').AsInteger:=0;
      FieldByName('OSNOV_TEXT2').AsString:='';
//      if OCH_PRICH_UNION>-1 then begin
        FieldByName('OSNOV').AsInteger:=OCH_PRICH_UNION;
//      end else begin
//        FieldByName('OSNOV').AsInteger:=0;
//        FieldByName('OSNOV_TEXT').AsString:='Объединение очереди';
//      end;
      if sDelo<>''
        then FieldByName('ADDINFO').AsString:='Номер объединенного дела '+sDelo;
      FieldByName('ID2').AsInteger:=0;
      FieldByName('RAZD').AsBoolean:=false;
      FieldByName('PROV').AsBoolean:=true;
      Post;
    end;
    nIDResh:=dmBase.tbOcheredResh.FieldByName('AUTO_ID').AsInteger;   // ID решения
  end else begin
    //----- удалим все решения и все очереди нового человека  ------------------------------
    sSQL:='DELETE FROM OcheredResh WHERE ID='+IntToStr(nNewID)+';'+#13#10+
          'DELETE FROM Ochered WHERE ID='+IntToStr(nNewID)+';';
    dmbase.AdsConnection.Execute(sSQL);
    //---------------------------------------------------------------------------------------
  end;

  dmBase.tbMens.Bookmark:=strBookMarkMen;

  // отметим успешное проведение операции
  dmBase.tbOcheredResh.Bookmark:=resh.FBookmark;
  EditDataSet(dmBase.tbOcheredResh);
  dmBase.tbOcheredResh.FieldByName('PROV').AsBoolean:=true;
  PostDataSet(dmBase.tbOcheredResh);

  if lCopy then begin   // снимем человека с очереди
    sBookMark:=dmBase.tbOchered.Bookmark;
    if dmBase.tbOchered.Locate('OCHERED_ID;ID', VarArrayOf([0,nOldID]),[]) then begin
      dmBase.tbOchered.Edit;
      dmBase.tbOchered.FieldByName('ISKL').AsBoolean:=true;
      dmBase.tbOchered.FieldByName('ID_SN_RESH').AsInteger:=nIDResh;
      dmBase.tbOchered.FieldByName('ID_LAST_RESH').AsInteger:=nIDResh;
      dmBase.tbOchered.Post;
      dmBase.AdsConnection.Execute('UPDATE Ochered SET ISKL=true WHERE ID='+IntToStr(nOldID));
    end;
    dmBase.tbOchered.Bookmark:=sBookMark;
  end;

  Result:=true;
  if FListPar<>nil then begin
    FListPar.Add('OPEN_DOK='+IntToStr(_TypeObj_Nasel));
    FListPar.Add('OPEN_ID='+IntToStr(nID));
  end;
  except
    on E:Exception do begin
      PutError(' Ошибка: '+E.Message);
    end;
  end;
  {$ENDIF}
end;

function TdmMen.ReadVUS(ID: Integer; IDInternal : Integer): Boolean;
{$IFNDEF ZAGS}
{$IFNDEF OCHERED}
var
  s:String;
  lErr:Boolean;
  n:Integer;
{$ENDIF}
{$ENDIF}
begin
{$IFNDEF ZAGS}
{$IFNDEF OCHERED}
  Result := false;
  if (Role.CheckSubSystem(SS_VUS)<>ptDeniedAccess) and mtDokumentVUS.AsBoolean then begin
    if (ID>0) and dmBase.tbVUS.Locate('ID',ID,[]) then begin
        Result := true;
        with dmBase.tbVUS do begin
          lErr := false;
          if FieldByName('PRIZ').IsNull
            then mtDokumentPRIZ.AsBoolean:=false
            else mtDokumentPRIZ.AsBoolean:=FieldByName('PRIZ').AsBoolean;
          if FieldByName('VUS_ISKL').IsNull
            then mtDokumentVUS_ISKL.AsBoolean:=false
            else mtDokumentVUS_ISKL.AsBoolean:=FieldByName('VUS_ISKL').AsBoolean;

          mtDokumentVOENKOM.AsString:=FieldByName('VOENKOM').AsString;
          if FieldByName('VOENKOM').IsNull and (GlobalTask.ParamAsInteger('ID_VOENKOM')>0) then begin
            mtDokumentVOENKOM.AsInteger:=GlobalTask.ParamAsInteger('ID_VOENKOM');
          end;

          WriteField( mtDokumentDATESV_VK       ,FieldByName('DATESV_VK'), lErr);
          WriteField( mtDokumentDATESV_LIC      ,FieldByName('DATESV_LIC'), lErr);
          WriteField( mtDokumentDATESV_F2       ,FieldByName('DATESV_F2'), lErr);
          WriteField( mtDokumentNOMER_VUS       ,FieldByName('NOMER_VUS'), lErr);
          WriteField( mtDokumentZVAN            ,FieldByName('ZVAN'), lErr);
          WriteField( mtDokumentZVAN2           ,FieldByName('ZVAN2'), lErr);
          WriteField( mtDokumentGODEN           ,FieldByName('GODEN'), lErr);
          WriteField( mtDokumentTYPE_KOMANDA    ,FieldByName('TYPE_KOMANDA'), lErr);
          if mtDokumentTYPE_KOMANDA.IsNull then mtDokumentTYPE_KOMANDA.AsString:='1';
          WriteField( mtDokumentKOMANDA         ,FieldByName('KOMANDA'), lErr);
          WriteField( mtDokumentJAVKA           ,FieldByName('JAVKA'), lErr);
          WriteField( mtDokumentMARSHRUT        ,FieldByName('MARSHRUT'), lErr);
          WriteField( mtDokumentGRAGSPEC        ,FieldByName('GRAGSPEC'), lErr);
          WriteField( mtDokumentKOMISS_DATE     ,FieldByName('KOMISS_DATE'), lErr);
          WriteField( mtDokumentKOMISS          ,FieldByName('KOMISS'), lErr);
          WriteField( mtDokumentKOMISS_GODEN    ,FieldByName('KOMISS_GODEN'), lErr);
          WriteField( mtDokumentKOMISS_STAT     ,FieldByName('KOMISS_STAT'), lErr);
          WriteField( mtDokumentKOMISS_GRAFA    ,FieldByName('KOMISS_GRAFA'), lErr);
          WriteField( mtDokumentKOMISS_PRIKAZ   ,FieldByName('KOMISS_PRIKAZ'), lErr);
          WriteField( mtDokumentKOMISS_DATEPERE ,FieldByName('KOMISS_DATEPERE'), lErr);
          WriteField( mtDokumentDATESOST        ,FieldByName('DATESOST'), lErr);
          WriteField( mtDokumentVB_SERIA        ,FieldByName('VB_SERIA'), lErr);
          WriteField( mtDokumentVB_NOMER        ,FieldByName('VB_NOMER'), lErr);
          WriteField( mtDokumentVB_DATE         ,FieldByName('VB_DATE'), lErr);
          WriteField( mtDokumentPRIB_DATE       ,FieldByName('PRIB_DATE'), lErr);
          WriteField( mtDokumentPRIB_TEXT       ,FieldByName('PRIB_TEXT'), lErr);
          WriteField( mtDokumentPRIB_DATEVK     ,FieldByName('PRIB_DATEVK'), lErr);
          WriteField( mtDokumentUBIT_DATE       ,FieldByName('UBIT_DATE'), lErr);
          WriteField( mtDokumentUBIT_TEXT       ,FieldByName('UBIT_TEXT'), lErr);
          WriteField( mtDokumentUBIT_DATEVK     ,FieldByName('UBIT_DATEVK'), lErr);
          WriteField( mtDokumentSOSTAV_SEM      ,FieldByName('SOSTAV_SEM'), lErr);
          WriteField( mtDokumentSPEC            ,FieldByName('SPEC'), lErr);
          WriteField( mtDokumentSPEC_TEXT       ,FieldByName('SPEC_TEXT'), lErr);
          WriteField( mtDokumentGRUPPA          ,FieldByName('GRUPPA'), lErr);

          WriteField( mtDokumentVUS_SOSTAV      ,FieldByName('VUS_SOSTAV'), lErr);
          WriteField( mtDokumentVUS_PREDN       ,FieldByName('VUS_PREDN'), lErr);
          WriteField( mtDokumentVUS_MARKA_TS    ,FieldByName('VUS_MARKA_TS'), lErr);

          ReadAddData(FieldByName('ADD_FIELDS').AsString, mtDokument);

          if FieldByName('AGIT_TEL').AsString<>''
            then mtDokumentAGIT_TEL.AsString:=FieldByName('AGIT_TEL').AsString;

          mtDokumentADRES_GIT.AsString:=FieldByName('ADRES_GIT').AsString;;
          if (mtDokumentADRES_GIT.AsString<>'') then begin   // введен другой адрес жительства
//            if mtDokumentAGIT_TEL.AsString=''   30.03.2020  что-бы небыло путаницы, т.к. в таблице VUS есть реквизит AGIT_TEL
//              then mtDokumentAGIT_TEL.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_TEL', ftString);
            mtDokumentAGIT_PN.Value := dmBase.ReadPropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_PN',ftMemo);
//            mtDokumentAGIT_PN.Value := dmBase.ReadOneProp(DateFiks, ID, 'AGIT_PN', ftMemo);
            // если не введено название нас. пункта, то нечего дальше читать
            if mtDokumentAGIT_PN.AsString<>'' then begin
              mtDokumentAGIT_OBL.Value  := dmBase.ReadPropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_OBL',ftMemo);
              mtDokumentAGIT_RN.Value   := dmBase.ReadPropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_RN', ftMemo);
              mtDokumentAGIT_UL.Value   := dmBase.ReadPropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_UL', ftMemo);
              mtDokumentAGIT_DOM.Value  := dmBase.ReadPropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_DOM', ftString);
              mtDokumentAGIT_KORP.Value := dmBase.ReadPropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_KORP', ftString);
              mtDokumentAGIT_KV.Value   := dmBase.ReadPropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_KV', ftString);
              mtDokumentADD_ADRES_GIT.AsBoolean := true;  // !!!
            end;
          end;
          ReadSverki(ID,IDInternal);
        end;
//      end;
    end;
  end;
{$ENDIF}
{$ENDIF}
end;

//------------------------------------------------------------
// Список дат сверки
procedure TdmMen.ReadSverki(nID:Integer; nIDInternal:Integer);
var
  arr:TArrStrings;
  i,j:Integer;
  strField,s:String;
  sInd:String;
begin
  with dmBase.tbSimplePropMemo do begin
    if nIDInternal<=0 then nIDInternal:=nID;
    sInd:=IndexName;
    IndexName:='POKAZ_KEY';  //  TYPEOBJ;ID;POKAZ;DATES
    SetRange([_TypeObj_Nasel,nID,'SVERKI'],[_TypeObj_Nasel,nID,'SVERKI']);
    try
      while not Eof do begin
        StrToArr(FieldByName('VALUE').AsString, arr,CRLF,true);
        if Length(arr)>0 then begin
          tbSverki.Append;
          tbSverkiID_INTERNAL.AsInteger:=nIDInternal;
          for i:=Low(arr) to High(arr) do begin
            j:=Pos('=',arr[i]);
            strField:=Copy(arr[i],1,j-1);
            s:=Copy(arr[i],j+1,Length(arr[i]));
            if s<>'' then begin
              try
               if strField='DATE_SV' then begin
                 tbSverkiDATE_SV.AsDateTime:=STOD(s,tdClipper); // !!!    20100101
               end else begin
                 tbSverki.FieldByName(strField).AsString:=s;
               end;
              except
              end;
            end;
          end;
          tbSverki.Post;
        end;
        Next;
      end;
    finally
      CancelRange;
      IndexName:=sInd;
    end;
  end;
end;
procedure TdmMen.WriteSverki(nID:Integer);
var
  s,strField,ss:String;
  nIDInternal,j,i:Integer;
  d:TDateTime;
begin
  s:='DELETE FROM BaseTextProp WHERE typeobj='+IntToStr(_TypeObj_Nasel)+' and id='+IntToStr(nID)+' and pokaz=''SVERKI'' ';
  dmBase.AdsConnection.Execute(s);
  nIDInternal:=mtDokumentID_INTERNAL.AsInteger;
  tbSverki.IndexFieldNames:='ID_INTERNAL;DATESV';
  tbSverki.SetRange([nIDInternal],[nIDInternal]);
  tbSverki.First;
  try
    j:=1;
    while not tbSverki.Eof do begin
      if tbSverkiDATE_SV.IsNull then ss:='' else ss:=DTOS(tbSverkiDATE_SV.AsDateTime, tdClipper);
      s:='NAME='+tbSverkiNAME.AsString+#13#10+'FIO='+tbSverkiFIO.AsString+#13#10+'DATE_SV='+ss;
      with dmBase.tbSimplePropMemo do begin
        Append;
        FieldByName('TYPEOBJ').AsInteger:=_TypeObj_Nasel;
        FieldByName('ID').AsInteger:=nID;
        d:=STOD('18991231',tdClipper)+j;
  //      d:=d+1;
        FieldByName('DATES').AsDateTime:=d;
        FieldByName('POKAZ').AsString:='SVERKI';
        FieldByName('VALUE').AsString:=s;
        Post;
      end;
      j:=j+1;
      tbSverki.Next;
    end;
  finally
    tbSverki.CancelRange;
    tbSverki.First;
  end;
end;

function TdmMen.WriteVUS(ID: Integer): Boolean;
{$IFNDEF ZAGS}
var
  lErr,lDel,lFind : Boolean;
  s,ss:String;
{$ENDIF}
begin
{$IFNDEF ZAGS}
{$IFNDEF OCHERED}
  Result := false;
  if (Role.CheckSubSystem(SS_VUS)=ptFull) and mtDokumentVUS.AsBoolean then begin
    lFind := dmBase.tbVUS.Locate('ID', ID, []);
    if not lFind then begin
      dmBase.tbVUS.Append;
      dmBase.tbVUS.FieldByName('ID').AsInteger:=ID;
    end else begin
      dmBase.tbVUS.Edit;
    end;
    with dmBase.tbVUS do begin
      lErr := false;

      if mtDokumentVOENKOM.IsNull or (mtDokumentVOENKOM.AsInteger=0) or (mtDokumentVOENKOM.AsInteger=GlobalTask.ParamAsInteger('ID_VOENKOM')) then begin
        FieldByName('VOENKOM').AsString:=''; // если равен вонкомату по умолчанию то запишем null;
      end else begin
        FieldByName('VOENKOM').AsInteger:=mtDokumentVOENKOM.AsInteger;
      end;

      WriteField( FieldByName('VUS_ISKL')       ,mtDokumentVUS_ISKL        , lErr);
      WriteField( FieldByName('PRIZ')           ,mtDokumentPRIZ            , lErr);
      WriteField( FieldByName('DATESV_VK')      ,mtDokumentDATESV_VK       , lErr);
      WriteField( FieldByName('DATESV_LIC')     ,mtDokumentDATESV_LIC      , lErr);
      WriteField( FieldByName('DATESV_F2')      ,mtDokumentDATESV_F2       , lErr);
      WriteField( FieldByName('NOMER_VUS')      ,mtDokumentNOMER_VUS       , lErr);
      WriteField( FieldByName('ZVAN')           ,mtDokumentZVAN            , lErr);
      WriteField( FieldByName('ZVAN2')          ,mtDokumentZVAN2           , lErr);
      WriteField( FieldByName('GODEN')          ,mtDokumentGODEN           , lErr);
      WriteField( FieldByName('KOMANDA')        ,mtDokumentKOMANDA         , lErr);
      WriteField( FieldByName('TYPE_KOMANDA')   ,mtDokumentTYPE_KOMANDA    ,lErr);
      WriteField( FieldByName('JAVKA')          ,mtDokumentJAVKA           , lErr);
      WriteField( FieldByName('MARSHRUT')       ,mtDokumentMARSHRUT        , lErr);
      WriteField( FieldByName('GRAGSPEC')       ,mtDokumentGRAGSPEC        , lErr);
      WriteField( FieldByName('KOMISS_DATE')    ,mtDokumentKOMISS_DATE     , lErr);
      WriteField( FieldByName('KOMISS')         ,mtDokumentKOMISS          , lErr);
      WriteField( FieldByName('KOMISS_GODEN')   ,mtDokumentKOMISS_GODEN    , lErr);
      WriteField( FieldByName('KOMISS_STAT')    ,mtDokumentKOMISS_STAT     , lErr);
      WriteField( FieldByName('KOMISS_GRAFA')   ,mtDokumentKOMISS_GRAFA    , lErr);
      WriteField( FieldByName('KOMISS_PRIKAZ')  ,mtDokumentKOMISS_PRIKAZ   , lErr);
      WriteField( FieldByName('KOMISS_DATEPERE'),mtDokumentKOMISS_DATEPERE , lErr);
      WriteField( FieldByName('DATESOST')       ,mtDokumentDATESOST        , lErr);
      WriteField( FieldByName('VB_SERIA')       ,mtDokumentVB_SERIA        , lErr);
      WriteField( FieldByName('VB_NOMER')       ,mtDokumentVB_NOMER        , lErr);
      WriteField( FieldByName('VB_DATE')        ,mtDokumentVB_DATE         , lErr);
      WriteField( FieldByName('PRIB_DATE')      ,mtDokumentPRIB_DATE       , lErr);
      WriteField( FieldByName('PRIB_TEXT')      ,mtDokumentPRIB_TEXT       , lErr);
      WriteField( FieldByName('PRIB_DATEVK')    ,mtDokumentPRIB_DATEVK     , lErr);
      WriteField( FieldByName('UBIT_DATE')      ,mtDokumentUBIT_DATE       , lErr);
      WriteField( FieldByName('UBIT_TEXT')      ,mtDokumentUBIT_TEXT       , lErr);
      WriteField( FieldByName('UBIT_DATEVK')    ,mtDokumentUBIT_DATEVK     , lErr);
      WriteField( FieldByName('SOSTAV_SEM')     ,mtDokumentSOSTAV_SEM      , lErr);
      WriteField( FieldByName('SPEC')           ,mtDokumentSPEC            , lErr);
      WriteField( FieldByName('SPEC_TEXT')      ,mtDokumentSPEC_TEXT       , lErr);
      WriteField( FieldByName('GRUPPA')         ,mtDokumentGRUPPA          , lErr);

      WriteField( FieldByName('VUS_SOSTAV')     ,mtDokumentVUS_SOSTAV      , lErr);
      WriteField( FieldByName('VUS_PREDN')      ,mtDokumentVUS_PREDN       , lErr);
      WriteField( FieldByName('VUS_MARKA_TS')   ,mtDokumentVUS_MARKA_TS    , lErr);

      if mtDokumentSUPRUG_ID.AsString=''
        then ss:=';SUPRUG;SUPRUG_DATER';
      s:=PrepareAddData(mtDokument, 'UCH_OBR_ALL;KVALIF;AGIT_RODST'+ss);
      FieldByName('ADD_FIELDS').AsString:=s;

      lDel:=false;

      FieldByName('ADRES_GIT').AsString:='';
      if ((TelefonFromLic='') or (TelefonFromLic<>mtDokumentAGIT_TEL.AsString)) and (mtDokumentAGIT_TEL.AsString<>'') then begin
        FieldByName('AGIT_TEL').AsString:=mtDokumentAGIT_TEL.AsString;
      end else begin
        FieldByName('AGIT_TEL').AsString:='';
      end;
      if mtDokumentADD_ADRES_GIT.AsBoolean then begin  // человек имет дополнительный адрес жительства
        FieldByName('ADRES_GIT').AsString:=mtDokumentADRES_GIT.AsString;
        if (mtDokumentADRES_GIT.AsString<>'') then begin
          dmBase.WritePropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_OBL', mtDokumentAGIT_OBL);
          dmBase.WritePropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_RN', mtDokumentAGIT_RN);
          dmBase.WritePropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_PN', mtDokumentAGIT_PN);
          dmBase.WritePropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_UL', mtDokumentAGIT_UL);
          dmBase.WritePropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_DOM', mtDokumentAGIT_DOM);
          dmBase.WritePropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_KORP', mtDokumentAGIT_KORP);
          dmBase.WritePropSimpleDok(dmBase.TypeObj_VUS,ID,dmBase.GetDateCurrentSost,'AGIT_KV', mtDokumentAGIT_KV);
        end else begin
          lDel:=true;
        end;
      end else begin
        lDel:=true;
      end;
      if lDel then begin
        dmBase.ErasePropSimpleDok(dmBase.TypeObj_VUS,ID,'ADRES_GIT');
        dmBase.ErasePropSimpleDok(dmBase.TypeObj_VUS,ID,'AGIT_OBL');
        dmBase.ErasePropSimpleDok(dmBase.TypeObj_VUS,ID,'AGIT_RN');
        dmBase.ErasePropSimpleDok(dmBase.TypeObj_VUS,ID,'AGIT_PN');
        dmBase.ErasePropSimpleDok(dmBase.TypeObj_VUS,ID,'AGIT_UL');
        dmBase.ErasePropSimpleDok(dmBase.TypeObj_VUS,ID,'AGIT_DOM');
        dmBase.ErasePropSimpleDok(dmBase.TypeObj_VUS,ID,'AGIT_KORP');
        dmBase.ErasePropSimpleDok(dmBase.TypeObj_VUS,ID,'AGIT_TEL');
      end;
    end;
    dmBase.tbVUS.Post;
    WriteSverki(ID);
  end;
{$ENDIF}
{$ENDIF}
end;

function TdmMen.ReadMenAdd(ID: Integer): Boolean;
var
  lErr : Boolean;
begin
  Result := false;
  if mtDokumentID.AsInteger > 0 then begin
    Result := true;
    with dmBase.tbMensAdd do begin
      if Locate('ID', ID, []) then begin
        lErr := false;
        WriteField( mtDokumentEN_LGOT_DATA, FieldByName('EN_LGOT_DATA') , lErr);
        WriteField( mtDokumentEN_ADRES_ID , FieldByName('EN_ADRES_ID')  , lErr);
        WriteField( mtDokumentEN_LIC_ID   , FieldByName('EN_LIC_ID')    , lErr);

        WriteField( mtDokumentTEXT_ADRES ,FieldByName('TEXT_ADRES') , lErr);
        WriteField( mtDokumentMR_B_RESP  ,FieldByName('MR_B_RESP') , lErr);
        WriteField( mtDokumentMR_GOSUD   ,FieldByName('MR_GOSUD')  , lErr);
        WriteField( mtDokumentMR_B_OBL   ,FieldByName('MR_B_OBL')  , lErr);
        WriteField( mtDokumentMR_OBL     ,FieldByName('MR_OBL')    , lErr);
        WriteField( mtDokumentMR_RAION   ,FieldByName('MR_RAION')  , lErr);
        WriteField( mtDokumentMR_B_GOROD ,FieldByName('MR_B_GOROD'), lErr);
        WriteField( mtDokumentMR_GOROD   ,FieldByName('MR_GOROD')  , lErr);
//        {$IFDEF OCHERED_UNION}
          WriteField( mtDokumentMR_GOROD_RN, FieldByName('MR_GOROD_RN')  , lErr);
          WriteField( mtDokumentMR_TYPE_ULICA ,FieldByName('MR_TYPE_ULICA')  , lErr);
          WriteField( mtDokumentMR_ULICA ,FieldByName('MR_ULICA')  , lErr);
          WriteField( mtDokumentMR_DOM   ,FieldByName('MR_DOM'), lErr);
          WriteField( mtDokumentMR_KORP  ,FieldByName('MR_KORP')  , lErr);
          WriteField( mtDokumentMR_KV    ,FieldByName('MR_KV')  , lErr);
//        {$ENDIF}
        WriteField( mtDokumentOP_B_RESP  ,FieldByName('OP_B_RESP') , lErr);
        WriteField( mtDokumentOP_GOSUD   ,FieldByName('OP_GOSUD')  , lErr);
        WriteField( mtDokumentOP_B_OBL   ,FieldByName('OP_B_OBL')  , lErr);
        WriteField( mtDokumentOP_OBL     ,FieldByName('OP_OBL')    , lErr);
        WriteField( mtDokumentOP_RAION   ,FieldByName('OP_RAION')  , lErr);
        WriteField( mtDokumentOP_B_GOROD ,FieldByName('OP_B_GOROD'), lErr);
        WriteField( mtDokumentOP_GOROD   ,FieldByName('OP_GOROD')  , lErr);
        WriteField( mtDokumentOP_DATE    ,FieldByName('OP_DATE')   , lErr);

        WriteField( mtDokumentAKT_ROGD_ORGAN ,FieldByName('AKT_ROGD_ORGAN')  , lErr);
        WriteField( mtDokumentAKT_SMER_ORGAN ,FieldByName('AKT_SMER_ORGAN')  , lErr);
        WriteField( mtDokumentUDOST_LGOT ,FieldByName('UDOST_LGOT')  , lErr);

        WriteField( mtDokumentSUPRUG_ID, FieldByName('SUPRUG_ID'), lErr );

        ReadAddData(FieldByName('ADD_FIELDS').AsString, mtDokument);

      end;
    end;
    if mtDokumentMR_B_OBL.IsNull and (mtDokumentMR_OBL.AsString='') then mtDokumentMR_B_OBL.AsBoolean:=true;
    if mtDokumentMR_B_RESP.IsNull and (mtDokumentMR_GOSUD.AsString='') then mtDokumentMR_B_RESP.AsBoolean:=true;
    if mtDokumentOP_B_OBL.IsNull and (mtDokumentOP_OBL.AsString='') then mtDokumentOP_B_OBL.AsBoolean:=true;
    if mtDokumentOP_B_RESP.IsNull and (mtDokumentOP_GOSUD.AsString='') then mtDokumentOP_B_RESP.AsBoolean:=true;
  end;
end;

function TdmMen.WriteMenAdd(ID: Integer): Boolean;
var
  lErr : Boolean;
  s:String;
begin
  Result := false;
  if mtDokumentID.AsInteger > 0 then begin
    Result := true;
    // !!! не забыть изменить условие если добавяться доп. данные     tbMensAdd
    if (mtDokumentEN_LGOT_DATA.AsString<>'') or (mtDokumentEN_ADRES_ID.AsInteger>0) or
       (mtDokumentTEXT_ADRES.AsString<>'') or (mtDokumentMR_GOSUD.AsInteger>0) or (mtDokumentMR_OBL.AsString<>'') or (mtDokumentMR_GOROD.AsString<>'') or
       (mtDokumentOP_GOSUD.AsInteger>0) or (mtDokumentOP_OBL.AsString<>'') or (mtDokumentOP_GOROD.AsString<>'') or
       not mtDokumentOP_DATE.IsNull or (mtDokumentSUPRUG_ID.AsString<>'') or
       (mtDokumentPODR_NAME.AsString<>'') or   //  !!! ADD_FIELDS !!!
       (mtDokumentAKT_ROGD_ORGAN.AsString<>'') or (mtDokumentAKT_SMER_ORGAN.AsString<>'') or (mtDokumentUDOST_LGOT.AsString<>'') then begin
      with dmBase.tbMensAdd do begin
        if not Locate('ID', ID, []) then begin
          Append;
          FieldByName('ID').AsInteger:=ID;
          Post;
        end;
        Edit;
        lErr := false;
        WriteField( FieldByName('EN_LGOT_DATA') ,mtDokumentEN_LGOT_DATA , lErr);
        WriteField( FieldByName('EN_ADRES_ID') ,mtDokumentEN_ADRES_ID , lErr);
        WriteField( FieldByName('EN_LIC_ID') ,mtDokumentEN_LIC_ID , lErr);

        WriteField( FieldByName('TEXT_ADRES') ,mtDokumentTEXT_ADRES , lErr);

        WriteField( FieldByName('MR_B_RESP') ,mtDokumentMR_B_RESP  , lErr);
        WriteField( FieldByName('MR_GOSUD')  ,mtDokumentMR_GOSUD   , lErr);
        WriteField( FieldByName('MR_B_OBL')  ,mtDokumentMR_B_OBL   , lErr);
        WriteField( FieldByName('MR_OBL')    ,mtDokumentMR_OBL     , lErr);
        WriteField( FieldByName('MR_RAION')  ,mtDokumentMR_RAION   , lErr);
        WriteField( FieldByName('MR_B_GOROD'),mtDokumentMR_B_GOROD , lErr);
        WriteField( FieldByName('MR_GOROD')  ,mtDokumentMR_GOROD   , lErr);

        WriteField( FieldByName('MR_GOROD_RN')  , mtDokumentMR_GOROD_RN   , lErr);
        WriteField( FieldByName('MR_TYPE_ULICA'), mtDokumentMR_TYPE_ULICA , lErr);
        WriteField( FieldByName('MR_ULICA')     , mtDokumentMR_ULICA      , lErr);
        WriteField( FieldByName('MR_DOM')       , mtDokumentMR_DOM        , lErr);
        WriteField( FieldByName('MR_KORP')      , mtDokumentMR_KORP       , lErr);
        WriteField( FieldByName('MR_KV')        , mtDokumentMR_KV         , lErr);

        WriteField( FieldByName('OP_B_RESP') ,mtDokumentOP_B_RESP  , lErr);
        WriteField( FieldByName('OP_GOSUD')  ,mtDokumentOP_GOSUD   , lErr);
        WriteField( FieldByName('OP_B_OBL')  ,mtDokumentOP_B_OBL   , lErr);
        WriteField( FieldByName('OP_OBL')    ,mtDokumentOP_OBL     , lErr);
        WriteField( FieldByName('OP_RAION')  ,mtDokumentOP_RAION   , lErr);
        WriteField( FieldByName('OP_B_GOROD'),mtDokumentOP_B_GOROD , lErr);
        WriteField( FieldByName('OP_GOROD')  ,mtDokumentOP_GOROD   , lErr);
        WriteField( FieldByName('OP_DATE')   ,mtDokumentOP_DATE    ,lErr);

        WriteField( FieldByName('AKT_ROGD_ORGAN'), mtDokumentAKT_ROGD_ORGAN ,lErr);
        WriteField( FieldByName('AKT_SMER_ORGAN'), mtDokumentAKT_SMER_ORGAN , lErr);
        WriteField( FieldByName('UDOST_LGOT'), mtDokumentUDOST_LGOT , lErr);
        WriteField( FieldByName('SUPRUG_ID'), mtDokumentSUPRUG_ID, lErr );

        s:=PrepareAddData(mtDokument, 'PODR_NAME');
        FieldByName('ADD_FIELDS').AsString:=s;

        Post;
      end;
    end else begin
      // если записывать нечего, а человек в доп. данных есть, то удалим его из доп. данных
      if dmBase.tbMensAdd.Locate('ID', ID, []) then begin
        dmBase.tbMensAdd.Delete;
      end;
    end;
  end;
end;
//----------------------------------------------------------
function TdmMen.WriteDokument(f:TForm): Boolean;
var
  n : Integer;
  old : TCursor;
  strErr,sSoob : String;
  recID:TID;
begin
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  CheckEn:=false;
  try
  Result := PostDokument;
  if Result then begin
    Result := CheckDokument(strErr);
    if not Result then begin
      Beep;
      if strErr<>'' then begin
        PutError(strErr,f);
      end;
    end else begin
      FCurMen := -1;
      n := -1;
      {$IFDEF OCHERED}
        Result := WriteOneMen(0,-1,mtDokumentADRES_ID.AsInteger ,n,false);
      {$ELSE}        
        if LicID=0 then begin // зарегестрированный, но не прописанный постоянно человек
          Result := WriteOneMen(LicID,-1,mtDokumentADRES_ID.AsInteger ,n,false);
        end else begin
          Result := WriteOneMen(-1,-1,-1,n,false);
        end;
        if DvigMod and IsLgotEN then begin
          if dmBase.CheckRunMen(_TypeObj_Nasel, CHECK_EN, mtDokumentID.AsInteger, recID, false) then begin
            CheckEn:=true;
            SystemProg.SetRunMenReport(recID, 2{'SprMGS'});
          end;
        end;
        if mtDokumentCANDELETE.AsBoolean then begin
          sSoob:='*';
          dmBase.CheckCloseLic(LicID, mtDokumentID.AsInteger, 0, sSoob);
        end;  
      {$ENDIF}
    end;
  end;
  finally
    Screen.Cursor := old;
  end;
end;

function TdmMen.WriteDokumentForScript: Boolean;
var
  n : Integer;
begin
  FCurMen := -1;
  n := -1;
  {$IFDEF OCHERED}
     Result := WriteOneMen(0,-1,mtDokumentADRES_ID.AsInteger ,n,false);
  {$ELSE}
     if LicID=0 then begin // зарегестрированный, но не прописанный постоянно человек
       Result := WriteOneMen(LicID,-1,mtDokumentADRES_ID.AsInteger ,n,false);
     end else begin
       Result := WriteOneMen(-1,-1,-1,n,false);
     end;
  {$ENDIF}
end;

function TdmMen.WriteAllMens( IDLich : Integer; IDFirst : Integer; IDAdres : Integer; var IDRealFirst : Integer ): Boolean;
var
  n : Integer;
  sName:String;
  recID:TID;
begin
  Result := true;
  CheckEn:=false;
  ClearMaster;
  mtDokument.First;
  FCurMen := 1;
  sChilds:='';  // ID детей главы лицевого счета через ','
  sSuprug:='';  // ID супруга лицевого счета
  while not mtDokument.Eof do begin
    n := IDRealFirst;
    Result := WriteOneMen(IDLich,IDFirst,IDAdres,n,true);
    if IDFirst>0 then begin // записали главу хозяйства
      IDRealFirst := n;
    end;
    if Globaltask.ParamAsBoolean('CHECK_CHILD_LIC')  then begin    // конроль родителей для детей лицевого счета
      if mtDokumentOTNOSH.AsString<>''  then begin
        if dmBase.SprOtnosh.Locate('ID', mtDokumentOTNOSH.AsInteger, []) then begin
          sName:=ANSILowerCase(dmBase.SprOtnosh.FieldByName('NAME').AsString);
          if (sName='сын') or (sName='дочь') then begin
            sChilds:=sChilds+mtDokumentID.AsString+',';
          end;
          if (sName='муж') or (sName='жена')then begin
            sSuprug:=mtDokumentID.AsString;
            sSuprugPOL:=mtDokumentPOL.AsString;
          end;
        end;
      end;
    end;
    mtDokument.Next;
    FCurMen := FCurMen + 1;
    if not Result then break;
  end;
  SetMaster;
  mtDokument.First;
end;

procedure TdmMen.ClearDokument;
begin
  inherited;
end;

procedure TdmMen.SetEditFromLichSchet(Value: Boolean);
begin
  FEditFromLichSchet := Value;
end;

function TdmMen.CancelDokument: Boolean;
begin
  Result := true;
end;

//---------------------------------------------------
//   квартирант
//---------------------------------------------------
function TdmMen.IsKvartirant : Boolean;
begin
  if (mtDokumentNOMER_SEM.AsInteger=0) or (mtDokumentFIRST.AsBoolean=true) then begin
    Result:=false;
  end else begin
    Result:=true;
  end;
end;

//---------------------------------------------------
//  проверим корректность заполнения миграции
//---------------------------------------------------
function TdmMen.CheckMigr( var lPresent,lPropis:Boolean) : String;
var
  dDateP,dDateV,dDateSrok,dDateSrokNew : TDateTime;
begin
  Result := '';
//  lClearDateProp:=false;  // чистить или нет дату прописки, которая может быть введена вручную
  if mtDokumentDATEP.IsNull
    then dDateP:=0
    else dDateP:=mtDokumentDATEP.AsDateTime;
//  dDateP:=0;
  dDateV:=0;
  if mtDokumentDATE_SROK.IsNull
    then dDateSrok:=0
    else dDateSrok:=mtDokumentDATE_SROK.AsDateTime;

  lPresent:=true;
  lPropis:=true;

  tbMigr.DisableControls;
  if tbMigr.RecordCount=0 then begin
    if dDateP>0 then begin
      tbMigr.Append;
      tbMigrID_INTERNAL.AsInteger := mtDokumentID_INTERNAL.AsInteger;
      tbMigrTIP.AsString:=MIGR_PRIB;
      tbMigrCONTANT.AsString:='1';
      tbMigrDATE.AsDateTime:=dDateP;
      tbMigr.Post;
    end;
  end else begin
    tbMigr.First;
    while not tbMigr.Eof do begin
      if tbMigrTIP.AsString='' then begin
        Result := 'Не заполнен тип миграции.';
      end;
      if tbMigrDATE.IsNull then begin
        Result := 'Не заполнена дата миграции.';
      end;
      if (tbMigrCONTANT.AsString='1') and not tbMigrDATE_SROK.IsNull then begin
        Result := 'Очистите дату срока.';
      end;
      if Result='' then begin
        if (tbMigrCONTANT.AsString='0') and not tbMigrDATE_SROK.IsNull then begin
          if not tbMigrDATE_SROK.IsNull then begin
            if tbMigrDATE_SROK.AsDateTime-tbMigrDATE.AsDateTime<=0 then begin
              Result := 'Неверный срок миграции.';
            end;
          end;
        end;
      end;

      if Result<>''  then break;

      if tbMigrTIP.AsString=MIGR_UBIL then begin
        if (dDateP=0) or (dDateP<tbMigrDATE.AsDateTime) then begin
          dDateV := tbMigrDATE.AsDateTime;   // последняя дата убытия
          if tbMigrCONTANT.AsString='1' then begin   // убыл постоянно
            dDateP:=0;
            lPropis:=false;
            lPresent:=false;
          end else begin                             // убыл временно
            lPropis:=true;
            lPresent:=false;
          end;
        end;
      end else if tbMigrTIP.AsString=MIGR_PRIB then begin
        dDateV:=0;
        if tbMigrCONTANT.IsNull or (tbMigrCONTANT.AsString='1') then begin   // прибыл постоянно
          lPropis:=true;
          lPresent:=true;
        end else begin
          lPropis:=false;
          lPresent:=true;
        end;
        if (dDateP=0) //or dDateP<tbMigrDATE.AsDateTime
          then dDateP:=tbMigrDATE.AsDateTime;   // последняя дата прибытия
      end;
      tbMigr.Next;
    end;
  end;
  if Result='' then begin
    dDateSrokNew:=0;
    //---  попробуем заполнить срок миграции ---------------
    tbMigr.Last;
    // заполнен срок миграции  и человек отсутствует
    if (tbMigrCONTANT.AsString='0') and not tbMigrDATE_SROK.IsNull then begin
      //       временно убыл                 временно прибыл
      if (lPropis and not lPresent) or (not lPropis and lPresent) then begin
        if not tbMigrDATE_SROK.IsNull then begin
          dDateSrokNew:=tbMigrDATE_SROK.AsDateTime;
        end;
      end;
    end;
    if dDateSrok<>dDateSrokNew then begin
      if mtDokument.State<>dsEdit then mtDokument.Edit;
      if dDateSrokNew=0
        then mtDokumentDATE_SROK.AsString:=''
        else mtDokumentDATE_SROK.AsDateTime:=dDateSrokNew;
    end;
    // если постоянная регистрация в списке миграции присутствует
    if dDateP<>0 then begin
      if mtDokumentDATEP.IsNull or (mtDokumentDATEP.AsDateTime<>dDateP) then begin
        if mtDokument.State<>dsEdit then mtDokument.Edit;
        mtDokumentDATEP.AsDateTime := dDateP;
      end;
    end;
    if (dDateV=0) or lPresent then begin   // если в списке миграции отсутствует дата выбытия или человек присутствует
      if mtDokument.State<>dsEdit then mtDokument.Edit;
      mtDokumentDATEV.AsString := '';
    end else begin
      // если дата прописки пустая или меньше даты выписки
      if mtDokumentDATEP.IsNull or (mtDokumentDATEP.AsDateTime<dDateV) then begin
        if mtDokumentDATEV.IsNull or (mtDokumentDATEV.AsDateTime<>dDateV) then begin
          if mtDokument.State<>dsEdit then mtDokument.Edit;
          mtDokumentDATEV.AsDateTime := dDateV;
        end;
      end else begin
        // если дата прописки больше чем дата выписки и она не пустая, то очистим дату выписки
        if not mtDokumentDATEV.IsNull then begin
          if mtDokument.State<>dsEdit then mtDokument.Edit;
          mtDokumentDATEV.AsString := '';
        end;
      end;
    end;
  end;
  tbMigr.First;
  tbMigr.EnableControls;

  // если дата регистрации не проставлена, то считаем, что квартирант не зарегистрирован
  if mtDokumentDATEP.IsNull and IsKvartirant then begin
    lPropis:=false;
  end;

end;

//-----------------------------------------------
function TdmMen.TypeReg : Integer;
var
  lPropis, lPresent : Boolean;
  strErr,s:String;
//  n:INteger;
begin
  Result:=MESTO_NOTREG;
  if mtDokumentADRES_ID.AsInteger>0 then begin  // если есть адрес на территории совета
//    n:=GetTickCount;
    CheckPresentMen(strErr,s);
//    showmessage(IntToStr(GetTickCount-n));
    lPropis:=mtDokumentPROPIS.AsBoolean;
    lPresent:=mtDokumentPRESENT.AsBoolean;
//    if CheckMigr(lPresent,lPropis)<>''
//      then Result:=-1;
  end else begin
    lPropis:=false;
    lPresent:=false;
  end;
  if Result=MESTO_NOTREG then begin
    if lPropis then begin
      Result:=MESTO_GIT;          // место жительства
    end else begin
      if lPresent then
        Result:=MESTO_PREB;       // место пребывания
    end;
  end;
end;

//-------------------------------------------------------
function TdmMen.CheckListResh(var strErr:String) : Boolean;
//var
//  l:Boolean;
//  n:Integer;
begin
  Result:=true;
  {
  l:=dbDisableControls(tbOcheredResh);
  tbOcheredResh.First;
  n:=0;
  while not tbOcheredResh.Eof do begin
    if tbOcheredReshPLAN.AsBoolean
      then Inc(n,1);
    tbOcheredResh.Next;
  end;
  tbOcheredResh.First;
  dbEnableControls(tbOcheredResh,l);
  if n>1 then begin
    strErr:='Проект решения по очереди может быть только один';
  end;
  }
end;

//-----------------------------------------------------------------------------
function TdmMen.VozvratMen(d:TDateTime; var sErr:String):Boolean;
begin
  Result:=false;
  tbMigr.Append;
  try
    tbMigrID_INTERNAL.AsInteger := mtDokumentID_INTERNAL.AsInteger;
    tbMigrCONTANT.AsInteger:=1;
    tbMigrTIP.AsString     := MIGR_PRIB;  // прибыл
    tbMigrTALON.AsInteger  := 0;
    tbMigrDATE.AsDateTime  := d;
    tbMigrPRICH.AsInteger  := GlobalTask.ParamAsInteger('PRICH_VOZVR');
    tbMigrORGAN.AsString   := '';
    tbMigr.Post;
    Result:=true;
  except
    tbMigr.Cancel;
  end;
  if Result then begin
    if mtDokument.State<>dsEdit then mtDokument.Edit;
    mtDokumentDATEV.AsString:='';   // дата выписки д.б. пуста
    mtDokumentDATE_SROK.AsString:='';
    mtDokumentCANDELETE.AsBoolean:=false;
  end else begin
    sErr:='Ошибка возвращения человека.';
  end;

end;

//-----------------------------------------------------------------------------
function TdmMen.VipisMen(d:TDateTime; var sErr:String):Boolean;
begin
  Result:=false;
  tbMigr.Append;
  try
    tbMigrID_INTERNAL.AsInteger:=mtDokumentID_INTERNAL.AsInteger;
    tbMigrTIP.AsString:=MIGR_UBIL;  // убыл
    tbMigrCONTANT.AsInteger:= 1;  // постоянно
    tbMigrTALON.AsInteger  := 0;
    tbMigrDATE.AsDateTime  := d;
    tbMigrPRICH.AsInteger  := 0;
    tbMigrORGAN.AsString   := '';
    tbMigr.Post;
    Result:=true;
  except
    tbMigr.Cancel;
  end;
  if Result then begin
    if mtDokument.State<>dsEdit then mtDokument.Edit;
    mtDokumentDATEV.AsDateTime    := d;
    mtDokumentDATE_SROK.AsString  := '';
    mtDokumentPRESENT.AsBoolean   := false;
    mtDokumentPROPIS.AsBoolean    := false;
    mtDokumentCANDELETE.AsBoolean := true;
  end else begin
    sErr:='Ошибка выписки человека.';
  end;
end;

//-------------------------------------------------------
function TdmMen.CheckPresentMen(var strErr:String; var strSoob:String) : Boolean;
var
  lOld, lOldC : Boolean;
  lNull, lNullC : Boolean;
  lCanDelete, lPresent, lRun : Boolean;
  lPropis,lAdres,lLic : Boolean;
  lChange,lCheckWriteOtkudaPrib:Boolean;
  nKateg:Integer;
  v:Variant;
begin
  strSoob:='';
//  значения для поля "kateg"
//  LIC_REG     = 0; //  человек на лицевом с регистрацией
//  LIC_NOTREG  = 1; //  человек на лицевом без регистрации
//  ADRES_NOTREG= 2; //  человек без регистр. и без лицевого, но фактически проживает
//  BEZ_ADRESA  = 3; //  человек не проживает и не зарегистрирован (чужой)
//  FIRST_NOTMY = 4; //  глава лиц. счета не мой  (для Минского района)
  lCanDelete:=false;
  nKateg:=0;
  Result := true;
  lAdres:=true;
  lLic:=true;    
  lCheckWriteOtkudaPrib:=dmBase.CheckWriteOtkudaPrib(mtDokument);
  if mtDokumentADRES_ID.AsInteger>0 then begin  // если есть адрес на территории совета, то доступна панель регистрации
    strErr:=CheckMigr(lPresent,lPropis);
    if strErr<>'' then Result:=false;
  end else begin
    lPropis:=false;
    lPresent:=false;
  end;
  if Result then begin
    // если корректируем из лицевого счета или LicID не пустой
    if EditFromLichSchet or (LicID>0) then begin
      if GetAddAdresProp='' then begin  // чужой адрес регистрации не введен
        nKateg:=LIC_REG;
        if not lPresent and not lPropis then begin
          lCanDelete:=true;
        end else begin
          lCanDelete:=false;
        end;
      end else begin       // человек зарегистрирован в другом месте,но нах-ся на лицевом счете
        nKateg:=LIC_NOTREG;
        lPropis:=false;
        lPresent:=true;
        lCanDelete:=false;
      end;
      if GlobalTask.ParamAsBoolean('FIRST_NOTMY') then begin
        if mtDokumentFIRST.AsBoolean and mtDokumentFIRST_NOTMY.AsBoolean then begin
          lPropis:=false;
          lPresent:=false;
          nKateg:=FIRST_NOTMY;
        end;
      end;
      if not mtDokumentDATES.IsNull then begin  // если человек умер
        lPropis:=false;
        lPresent:=false;
        lCanDelete:=true;
      end;
    end else if LicId=0 then begin  // человек без лицевого счета не может быть зарегистрированным
      {$IFDEF OCHERED}    // у задачи очередников
        if (mtDokumentADRES_ID.AsInteger=0) then begin
          lPropis:=false;
          nKateg:=BEZ_ADRESA;
        end else begin
          lPropis:=true;
          nKateg:=LIC_REG;
        end;
      {$ELSE}
        lPropis:=false;
        lCanDelete:=false;    // люди без лицевого счета автоматически не удаляются
        lLic:=false;
        if (mtDokumentADRES_ID.AsInteger=0) then begin
          if GetAddAdresProp='' then begin
            nKateg:=ADRES_NOTREG;
          end else begin
            lAdres:=false;    // человек без лицевого счета и адреса
            nKateg:=BEZ_ADRESA;
          end;
          lPresent:=false;
        end else begin
          nKateg:=ADRES_NOTREG;
          if not mtDokumentDATES.IsNull
            then lPresent:=false
            else lPresent:=true    // человек без лицевого счета и с адресом считаем, что фактически проживает
        end;
      {$ENDIF}
    end;
  end;
  if Result then begin
//    if lLic and (GetAddAdresProp='') then begin // миграция только для человека с лицевого счета
    if mtDokumentADRES_ID.AsInteger>0 then begin // миграция только для человека с адресом на территории совета
      if tbMigr.RecordCount > 0 then begin
        tbMigr.DisableControls;
        // посмотрим последнюю запись миграции
        tbMigr.Last;
        if tbMigrTIP.AsString=MIGR_UBIL then begin // убыл
          if not lPresent then begin
            if (tbMigrCONTANT.AsString='0') and not tbMigrDATE_SROK.IsNull then begin
              if dmBase.GetCurDate >= tbMigrDATE_SROK.AsDateTime then begin  // если срок отсутствия закончился
                lPresent := true;
                //--- добавим в список движения информацию, что человек вернулься ------------------
                Result:=VozvratMen(tbMigrDATE_SROK.AsDateTime, strErr);
                RunFuncScript('GetNameAsPol', ['вернулся', mtDokumentPOL.AsString], v, lRun);
//                if Result then strSoob:=GetFIO+' '+VarToStr(v)+' к прежнему месту жительства';
                if Result then ShowMessage(GetFIO+' '+VarToStr(v)+' к прежнему месту жительства.');
                //-----------------------------------------------------------------------------------
              end;
            end;
          end;
        end else begin  // прибыл
          //---- добавлено 7.02.2011 ------  поробуем записать откуда прибыл
          if tbMigrCONTANT.AsString='1' then begin  // прибыл на постоянно
            if lCheckWriteOtkudaPrib then begin
              // запишем откуда прибыл
              if mtDokument.State<>dsEdit then mtDokument.Edit;
              mtDokumentOP_B_RESP.AsBoolean:=tbMigrOP_B_RESP.AsBoolean;
              mtDokumentOP_GOSUD.AsString:=tbMigrOP_GOSUD.AsString;
              mtDokumentOP_B_OBL.AsBoolean:=tbMigrOP_B_OBL.AsBoolean;
              mtDokumentOP_OBL.AsString:=tbMigrOP_OBL.AsString;
              mtDokumentOP_RAION.AsString:=tbMigrOP_RAION.AsString;
              mtDokumentOP_B_GOROD.AsString:=tbMigrOP_B_GOROD.AsString;
              mtDokumentOP_GOROD.AsString:=tbMigrOP_GOROD.AsString;
              lChange:=true;
            end else begin
              // не трогаем откуда прибыл
            end;
          end;
          //-------------------------------
          if not tbMigrDATE_SROK.IsNull then begin
            if dmBase.GetCurDate >= tbMigrDATE_SROK.AsDateTime then begin  // если срок регистрации закончился
              lPresent   := false;
              lCanDelete := true;
              //--- добавим в список движения информацию, что человек уехал ------------------
              Result:=VipisMen(tbMigrDATE_SROK.AsDateTime, strErr);
              RunFuncScript('GetNameAsPol', ['убыл', mtDokumentPOL.AsString], v, lRun);
              if Result then ShowMessage(GetFIO+' '+VarToStr(v)+' к прежнему месту жительства');
              //-----------------------------------------------------------------------------------
            end;
          end;
        end;
        tbMigr.First;
        tbMigr.EnableControls;
      end else begin
        if not mtDokumentDATE_SROK.IsNull then begin
          if dmBase.GetCurDate >= mtDokumentDATE_SROK.AsDateTime then begin  // если срок регистрации закончился
            lPresent   := false;
            lCanDelete := true;
          end;
        end;
      end;
    end;

    if lPropis<>mtDokumentPROPIS.AsBoolean then begin
      if mtDokument.State<>dsEdit then mtDokument.Edit;
      mtDokumentPROPIS.AsBoolean := lPropis;
      lChange:=true;
    end;
    if lPresent<>mtDokumentPRESENT.AsBoolean then begin
      if mtDokument.State<>dsEdit then mtDokument.Edit;
      mtDokumentPRESENT.AsBoolean := lPresent;
      lChange:=true;
    end;
    if mtDokumentPRESENT.AsBoolean then begin  // если человек присутствует,а дата убытия или срок убытия не пустой
      {  06.06.2012
      if (mtDokumentDATE_SROK.AsString<>'') then begin
        if mtDokument.State<>dsEdit then mtDokument.Edit;
        mtDokumentDATE_SROK.AsString := '';
        lChange:=true;
      end;
      }
      if (mtDokumentDATEV.AsString<>'') then begin
        if mtDokument.State<>dsEdit then mtDokument.Edit;
        mtDokumentDATEV.AsString := '';
        lChange:=true;
      end;
    end;
    if lCanDelete<>mtDokumentCANDELETE.AsBoolean then begin
      if mtDokument.State<>dsEdit then mtDokument.Edit;
      mtDokumentCANDELETE.AsBoolean := lCanDelete;
      lChange:=true;
    end;
    if nKateg<>mtDokumentKATEG.AsInteger then begin
      if mtDokument.State<>dsEdit then mtDokument.Edit;
      mtDokumentKATEG.AsInteger := nKateg;
      lChange:=true;
    end;
//    if lChange then begin
  //    mtDokumentTYPEREG.AsString:=CheckTypeReg;
//    end;
    if mtDokument.State=dsEdit then mtDokument.Post;
  end;
end;

//--------------------------------------------------------------------------------------
function TdmMen.CheckFIO(IDInternal:Integer;var strErr : String) : Boolean;
var
  st:TSostTable;
  l:Boolean;
  sFam,sName,sOtch:String;
  nID:Integer;
  nCheck:Integer;
begin
  Result:=true;
  strErr:='';
  nCheck:=GlobalTask.ParamAsInteger('CHECK_FIO_MEN');   // 0-не контролировать, 1-только очередника, 2-конроль и состава семьи
  if nCheck=0 then exit;

  st:=SaveSostTable(dmBase.tbMens,true,false);
  dmBase.tbMens.IndexFieldNames:='FAMILIA;NAME;OTCH';
  try
    if (nCheck=1) or (nCheck=2) then begin
      Result:=CheckFIO_(mtDokumentID.AsInteger,mtDokumentFAMILIA.AsString,mtDokumentNAME.AsString,mtDokumentOTCH.AsString);
      if not Result then begin
        strErr:=strErr+mtDokumentFAMILIA.AsString+' '+mtDokumentNAME.AsString+' '+mtDokumentOTCH.AsString+' уже существует в базе.'+#13#10;
      end;
    end;
    if nCheck=2 then begin
      l:=dbDisableControls(tbSostavSem);
      try
        tbSostavSem.First;
        tbSostavSem.IndexFieldNames:='ID_INTERNAL;NOMER';
        tbSostavSem.SetRange([IDInternal],[IDInternal]);
        while not tbSostavSem.Eof do begin
          Result:=CheckFIO_(tbSostavSemMEMBER_ID.AsInteger,tbSostavSemFAMILIA.AsString,tbSostavSemNAME.AsString,tbSostavSemOTCH.AsString);
          if not Result then begin
            strErr:=strErr+tbSostavSemFAMILIA.AsString+' '+tbSostavSemNAME.AsString+' '+tbSostavSemOTCH.AsString+' уже существует в базе.'+#13#10;
          end;
          tbSostavSem.Next;
        end;
      finally
        tbSostavSem.CancelRange;
        dbEnableControls(tbSostavSem,l);
      end;
    end;
  finally
    RestSostTable(dmBase.tbMens,st);
  end;
end;
//--------------------------------------------------------------------------------------
function TdmMen.CheckFIO_(nID:Integer;sFam,sName,sOtch:String) : Boolean;
var
  st:TSostTable;
begin
  Result:=true;
  try
    dmBase.tbMens.SetRange([sFam,sName,sOtch],[sFam,sName,sOtch]);
    while not dmBase.tbMens.Eof do begin
      if Result then begin
        if nID<=0 then begin
          Result:=false;
        end else begin
          if nID<>dmBase.tbMens.FieldByName('ID').AsInteger then begin
            Result:=false;
          end;
        end;
      end;
      dmBase.tbMens.Next;
    end;
  finally
    dmBase.tbMens.CancelRange;
  end;
end;
//  Mens.IndexFieldNames:='DATE_FIKS;LICH_NOMER';    // IN_KEY
{
//---------------------------------------------------------------------------
function TdmMen.CheckLich_(nID:Integer; sIN:String):Boolean;
begin
  Result:=true;
  try
    dmBase.tbMens.SetRange([dmBase.GetDateCurrentSost,sIN],[dmBase.GetDateCurrentSost,sIN]);
    while not dmBase.tbMens.Eof do begin
      if Result then begin
        if nID<=0 then begin
          Result:=false;
        end else begin
          if nID<>dmBase.tbMens.FieldByName('ID').AsInteger then begin
            Result:=false;
          end;
        end;
      end;
      dmBase.tbMens.Next;
    end;
  finally
    dmBase.tbMens.CancelRange;
  end;
end;           }

//--------------------------------------------------------------------------------------
function TdmMen.CheckDokument(var strErr : String) : Boolean;
var
  st:TSostTable;
  strSoob, strTypeReg:String;
  n:Integer;
  lTmp:Boolean;
begin
  strSoob:='';
  Result:=inherited CheckDokument(strErr);
  {$IFDEF OCHERED}
  if Result and GlobalTask.DemoVersion then begin
    if (dmBase.tbOchered.RecordCount >= COUNT_OCHERED_MAX)  then begin
      strErr := 'В демо-версии невозможно записать более '+IntToStr(COUNT_OCHERED_MAX)+' человек !';
      Result := false;
    end;
  end;
  {$ENDIF}
  if Result then
    if not EditFromLichSchet and (mtDokumentFAMILIA.AsString='') then begin
      strErr:='Введите фамилию.';
      Result:=false;
    end;
  if Result then
    if not EditFromLichSchet and (mtDokumentNAME.AsString='') then begin
      strErr:='Введите имя.';
      Result:=false;
    end;
  if Result and (LicID=0) and (mtDokumentID_BASE.AsInteger=0) then begin
    if (mtDokumentBEZADRESA.AsBoolean=false) and (mtDokumentADRES_ID.AsInteger<=0) then begin
      strErr:='Введите адрес регистрации.';
      Result:=false;
    end;
  end;
  if Result then begin
    // если введено старое ообразование для человека моложе 18 лет
    if (mtDokumentOBRAZ.AsInteger>=20) and (mtDokumentOBRAZ.AsInteger<90) and (GetCountYearEx(dmBase.getCurDate,mtDokumentDATER, 99)<18) then begin
      strErr:='Возраст меньше 18. Выберите образование из новых значений.';
      Result:=false;
    end;
  end;
  if Result then begin
    {$IFDEF OCHERED}
      if (mtDokumentID_BASE.AsInteger=0) then begin
        if (GetAddAdresProp='') and (mtDokumentADRES_ID.AsInteger<=0) then begin
          strErr:='Введите адрес регистрации вне территории совета.';
          Result:=false;
        end;
      end;
      if (mtDokumentDEC_DATE_REAL.IsNull) then begin
        strErr:='Введите дату подачи заявления.';
        Result:=false;
      end;
      if not mtDokumentDEC_DATE_REAL.IsNull and (YearOf(mtDokumentDEC_DATE_REAL.AsDateTime)>YearOf(Now+1)) then begin
        strErr:='Неверный год подачи завления.';
        Result:=false;
      end;
    {$ELSE}
      Result:=CheckPresentMen(strErr, strSoob);
      if (LicID=0) then begin
        if Result then begin
          if (GetAddAdresProp='') then begin
            strErr:='Введите адрес регистрации вне территории совета.';
            Result:=false;
          end;
        end;
        if Result then begin
          if ( (mtDokumentKATEG.AsInteger=ADRES_NOTREG) and (mtDokumentADRES_ID.AsInteger<=0)) then begin
            strErr:='Выберите адрес проживания на территории совета.';
            Result:=false;
          end;
        end;
        if Result then begin
          if ( (mtDokumentKATEG.AsInteger<>BEZ_ADRESA) and (mtDokumentADRES_ID.AsInteger<=0)) or
             ( (mtDokumentKATEG.AsInteger=BEZ_ADRESA) and (GetAddAdresProp='') )  then begin
            strErr:='Выберите адрес проживания.';
            Result:=false;
          end;
        end;
      end else begin
        if mtDokumentFIRST.AsBoolean and (mtDokumentKATEG.AsInteger=FIRST_NOTMY) and (mtDokumentADRES_PROP.AsString='') then begin
          strErr:='Введите адрес регистрации для главы лицевого счета.';
          Result:=false;
        end;
      end;
    {$ENDIF}

    if Result then begin
      Result:=CheckListResh(strErr);
    end;
    if Result then begin
      GlobalTask.SetLastValueAsString('NATION',mtDokumentNATION.AsString);
    end;
  end;
  if Result then begin
    if not CheckFIO(mtDokumentID_INTERNAL.AsInteger,strErr) then begin
      if not Problem(strErr+#13#10+'Продолжить ?') then begin
        Result:=false;
        strErr:='';
      end;
    end;                                           
    {
    if Result and (strSoob<>'') then begin
      if not Problem(strSoob+#13#10+'Продолжить ?') then begin
        Result:=false;
        strErr:='';
      end;
    end;
    }
  end;
end;

//-------------------------------------------------------
function TdmMen.PostDokument: Boolean;
begin
  Result:=true;
  try
    PostDataSet(mtDokument);
    PostDataSet(tbLgot);
    PostDataSet(tbMigr);
    PostDataSet(tbPriznaki);
    PostDataSet(tbResh);
    PostDataSet(tbSverki);
    tbSostavSem.CheckBrowseMode;
    tbOcheredLgot.CheckBrowseMode;
    if tbDopProp.Active then begin
      PostDataSet(tbDopProp);
    end;
  except
    on E: Exception do begin
      PutError(E.Message);
      Result := false;
    end;
  end;
//  Result := CheckDokument(strErr);
//  if not Result then begin
//    Beep;
//    PutError(strErr);
//  end;
end;

function TdmMen.GetVid: String;
var
  n:Integer;
begin
  Result := 'MEN';
end;

procedure TdmMen.AfterCreateDokument;
begin
  // если новый человек, создадим для него ID
  if (mtDokumentID.AsString='') or (mtDokumentID.AsInteger<=0) then begin
    mtDokumentID.AsInteger:=dmBase.GetNewID(dmBase.TypeObj_Nasel);
  end;

  mtDokumentNSTR.AsInteger:=mtDokument.RecordCount + 1;
  mtDokumentVUS.AsBoolean:=false;
  mtDokumentCANDELETE.AsBoolean:=false;
  mtDokumentPRESENT.AsBoolean:=true;
  mtDokumentBEZADRESA.AsBoolean:=false;
  mtDokumentNOMER_SEM.AsInteger:=0;

  mtDokumentISKL.AsBoolean:=false;
//  mtDokumentOTKAZ.AsBoolean:=false;
  mtDokumentNEWSEM.AsBoolean:=false;
  if EditFromLichSchet
    then mtDokumentKATEG.AsInteger:=LIC_REG
    else mtDokumentKATEG.AsInteger:=ADRES_NOTREG;
  mtDokumentFIRST_NOTMY.AsBoolean:=false;
  inherited AfterCreateDokument;
  {$IFDEF OCHERED}
    mtDokumentOCHERED.AsBoolean:=true;
  {$ELSE}
    mtDokumentOCHERED.AsBoolean:=false;
  {$ENDIF}
end;

function TdmMen.AfterReadDokument : Boolean;
begin
  if mtDokumentVUS.IsNull then mtDokumentVUS.AsBoolean := false;
  if mtDokumentCANDELETE.IsNull then mtDokumentCANDELETE.AsBoolean := false;
  if mtDokumentPRESENT.IsNull then mtDokumentPRESENT.AsBoolean := true;
  if mtDokumentBEZADRESA.IsNull then  mtDokumentBEZADRESA.AsBoolean:=false;
  if mtDokumentFIRST_NOTMY.IsNull then  mtDokumentFIRST_NOTMY.AsBoolean:=false;
  if mtDokumentNOMER_SEM.IsNull then  mtDokumentNOMER_SEM.AsInteger:=0;

  if mtDokumentISKL.IsNull   then mtDokumentISKL.AsBoolean:=false;
//  if mtDokumentOTKAZ.IsNull  then mtDokumentOTKAZ.AsBoolean:=false;
  if mtDokumentNEWSEM.IsNull then mtDokumentNEWSEM.AsBoolean:=false;

  Result := inherited AfterReadDokument;
end;
             

//-----------------------------------------------------------------------------
procedure TdmMen.CheckMenAll;
begin
  if not mtDokumentA.Active
    then mtDokumentA.Active:=true
    else mtDokumentA.Refresh;
  mtDokumentA.First;
end;

//-----------------------------------------------------------------------------
function TdmMen.IsLgotEN: Boolean;
begin
  Result:=false;
  CheckMenAll;
  while not mtDokumentA.Eof do begin
    if mtDokumentA.FieldByName('EN_LIC_ID').AsInteger>0 then begin
      Result:=true;
    end;                  
    mtDokumentA.Next;
  end;
end;

//-----------------------------------------------------------------------------
function TdmMen.LastDvigMenS(strID: String): String;
var
  lDisable : Boolean;
  s,strPrich,old : String;
begin
  Result := '';
  lDisable := false;
  if not tbMigr.ControlsDisabled then begin
    tbMigr.DisableControls;
    lDisable := true;
  end;
  old := tbMigr.IndexFieldNames;
  tbMigr.IndexFieldNames:='ID_INTERNAL;DATE';
  tbMigr.SetRange([strID],[strID]);
  if not tbMigr.Eof then begin
    tbMigr.Last;
    if not tbMigrPRICH.IsNull and (tbMigrPRICH.AsInteger > 0) then begin
      if dmBase.SprTypeMigr.Locate('ID', tbMigrPRICH.AsInteger, []) then begin
        strPrich := dmBase.SprTypeMigr.FieldByName('NAME').AsString;
      end else begin
        strPrich := 'причина:'+IntToStr(tbMigrPRICH.AsInteger);
      end;
    end;
    if not tbMigrDATE.IsNull and not tbMigrTIP.IsNull then begin
      if tbMigrTIP.AsString = MIGR_PRIB then begin
        Result := 'прибыл ' + FormatDateTime('dd.mm.yyyy',tbMigrDATE.AsDateTime)+'г. '+
                  tbMigrKOMM.AsString+', '+strPrich;
      end else begin
        if tbMigrCONTANT.AsInteger = 1 then s := '(совсем) ' else s := '';
        Result := 'выбыл ' + s + FormatDateTime('dd.mm.yyyy',tbMigrDATE.AsDateTime)+'г. '+
                  tbMigrKOMM.AsString+', '+strPrich;
      end;
    end;
  end;
  tbMigr.IndexFieldNames:=old;
  tbMigr.CancelRange;
  if lDisable then begin
    tbMigr.EnableControls;
  end;
end;

function TdmMen.GetFIO: String;
begin
  Result:=mtDokumentFAMILIA.AsString+' '+mtDokumentNAME.AsString+' '+mtDokumentOTCH.AsString;
end;

function TdmMen.GetAddAdresProp: String;
begin
  Result:=Trim(mtDokumentADRES_PROP.AsString);
end;

procedure TdmMen.ClearAddAdresProp;
begin
  EditDataSet(mtDokument);
  mtDokumentADRES_PROP.AsString:='';
  mtDokumentAPROP_OBL.AsString:='';
  mtDokumentAPROP_RN.AsString:='';
//      mtDokumentAPROP_TP.AsInteger:=0;
  mtDokumentAPROP_PN.AsString:='';
//      mtDokumentAPROP_TU.AsInteger:=0;
  mtDokumentAPROP_UL.AsString:='';
  mtDokumentAPROP_DOM.AsString:='';
  mtDokumentAPROP_KORP.AsString:='';
  mtDokumentAPROP_KV.AsString:='';
end;

procedure TdmMen.SetEditFromAdres(const Value: Boolean);
begin
  FEditFromAdres := Value;           
end;

function TdmMen.GetVoenkom(nTypeDate:Integer; sDelim:String):String;
var
  n:Integer;
begin
  Result:='';
  if sDelim='' then sDelim:=Chr(13)+Chr(10);
  if mtDokumentVUS.AsBoolean then begin
    n:=mtDokumentVOENKOM.AsInteger;
    if n=0
      then n:=GlobalTask.ParamAsInteger('ID_VOENKOM');
    if dmBase.SprVoenkom.Locate('ID',n,[]) then begin
      Result:=dmBase.SprVoenkom.FieldByName('NAME').AsString;
    end else begin
      Result:='ВОЕННООБЯЗАННЫЙ';
    end;
    if not mtDokumentPRIB_DATE.IsNull then begin
      Result:=Result+sDelim+'принят на учет '+DATEPROPIS(mtDokumentPRIB_DATE.AsDateTime,nTypeDate);
    end;
    if not mtDokumentUBIT_DATE.IsNull then begin
      Result:=Result+sDelim+'снят с учета '+DATEPROPIS(mtDokumentUBIT_DATE.AsDateTime,nTypeDate);
    end;
  end else begin
    if mtDokumentPOL.AsString='М'
      then Result:='НЕ ВОЕННООБЯЗАННЫЙ';
  end;
end;
//-----------------------------------------------------------------------------------------
procedure TdmMen.CheckCountSostav;
var
  l:Boolean;
  m,n,nOld:Integer;
  s:String;
begin
{$IFDEF OCHERED}
  if Globaltask.ParamAsBoolean('SUM_SOSTAV') then begin
{$ENDIF}
    m:=0;
    if tbSostavSem.RecordCount>0 then begin
      s:=tbSostavSem.Bookmark;
      l:=dbDisableControls(tbSostavSem);
      tbSostavSem.First;
      while not tbSostavSem.Eof do begin
        if not tbSostavSemISKL.AsBoolean
          then m:=m+1;
        if tbSostavSemISKL.AsBoolean then begin
          if tbSostavSemNOMER.AsString<>'' then begin
            tbSostavSem.Edit;
            tbSostavSemNOMER.AsString:='';
            tbSostavSem.Post;
          end;
        end else if (tbSostavSemNOMER.AsInteger<>m) then begin
          tbSostavSem.Edit;
          tbSostavSemNOMER.AsInteger:=m;
          tbSostavSem.Post;
        end;
        tbSostavSem.Next;
      end;
      tbSostavSem.Bookmark:=s;
      dbEnableControls(tbSostavSem,l);
    end;
    EditDataSet(mtDokument);
    mtDokumentKOLVO_SOSTAV.AsInteger:=m+1;
{$IFDEF OCHERED}
  end;
{$ENDIF}
end;

//-------------------------------------------------------------------------------
function TdmMen.SostavSemToStr(strType:String; strRazd:String) : String;
var
 sCur,sIDNotRead,sOtn,sID : String;
 n,i:Integer;
 arr : TArrStrings;
 sBookmark : String;
 v:Variant;
 lPlusMen,lCheckOtn,lCheckOch:Boolean;
begin
 // 'NPP;FIO;OTN;YEAR;DATE'  +MEN добавить самого человека    -nID1,nID2     список ID которые не надо читать
  i:=Pos('+MEN',strType);
  if i>0 then lPlusMen:=true else lPlusMen:=false;
  strType:=StringReplace(strType,'+MEN','',[]);

  i:=Pos('+CHK_OTN',strType);
  if i>0 then lCheckOtn:=true else lCheckOtn:=false;
  strType:=StringReplace(strType,'+CHK_OTN','',[]);

  i:=Pos('+ALL',strType);
  if i>0 then lCheckOch:=false else lCheckOch:=true;     // контроль реквизита OCH-вхождение в состав семьи очередника
  strType:=StringReplace(strType,'+ALL','',[]);

  i:=Pos('-',strType);
  sIDNotRead:='';
  if i>0 then begin
    sIDNotRead:=Copy(strType,i+1,Length(strType));
    sIDNotRead:=StringReplace(sIDNotRead,';',',',[rfReplaceAll])+',';  // на всякий случай заменим ';' на ','
    strType:=Copy(strType,1,i-1);
  end;

  StrToArr(UpperCase(strType),arr,';',true);
  Result:='';
//  if (Pos('13',strRazd)>0) or (Pos('10',strRazd)>0) then strRazd:=Chr(13)+Chr(10);
  if strRazd='' then strRazd:=', ';

  sBookmark:=tbSostavSem.Bookmark;

  sOtn:='';
  sID:='';
  if (sIDNotRead<>'') and lCheckOtn then begin
    sID:=StringReplace(sIDNotRead,',','',[]);
    if tbSostavSem.Locate('MEMBER_ID', sID, []) then begin
      sOtn:=tbSostavSemOTNOSH.AsString;  // отношение к главе того для кого получаем состав семьи
    end;
  end;

  tbSostavSem.First;
  try
    n:=1;
    if lPlusMen then begin
      sCur:='';
      for i:=0 to Length(arr)-1 do begin
        try
          if arr[i]='NPP' then begin
            sCur:=sCur+'1. ';
          end else if arr[i]='FIO' then begin
            sCur:=sCur+GetFIO+' ';
          end else if Copy(arr[i],1,3)='OTN' then begin
//--------------------------------------------------------
// nIDKomu     - ID кому выдается справка
// sOtnoshKomu - КОД отношения к главе хоз-ва кому выдается справка
// nIDCur      - ID текущего человека
// sOthosh     - КОД отношения к главе хоз-ва для текущего человека
            if (sOtn<>'') and (sID<>'') then begin
              v:=GetOtnosh(StrToInt(sID),sOtn,mtDokumentID.AsInteger,'',mtDokumentPOL.AsString);
              if VarToStr(v)<>'' then begin
                sCur:=sCur+ANSILowerCase(VarToStr(v))+' ';
              end;
            end;
          end else if Copy(arr[i],1,3)='YEA' then begin
            if not mtDokumentDATER.IsNull
              then sCur:=sCur+IntToStr(YearOf(mtDokumentDATER.AsDateTime))+'г.р. ';
          end else if Copy(arr[i],1,3)='DAT' then begin
            if not tbSostavSem.FieldByName('DATER').IsNull then begin
              if Right(arr[i],1)='R' then begin
                n:=6;
              end else begin
                try
                  n:=StrToInt(Right(arr[i],1));
                except
                  n:=6;
                end;
              end;
              sCur:=sCur+DatePropis(tbSostavSem.FieldByName('DATER').AsDateTime,n)+' ';
            end;
          end;
        except
           // в случае ошибки ничего не добавляем
        end;
      end;
      Result:=Result+Trim(sCur);
      n:=2;
      if not tbSostavSem.Eof
        then Result:=Result+strRazd;
    end;
    while not tbSostavSem.Eof do begin
      sCur:='';
      if ( (sIDNotRead='') or (Pos(tbSostavSemMEMBER_ID.AsString+',',sIDNotRead)=0) ) and //then begin
         ( (lCheckOch=false) or (tbSostavSemISKL.AsBoolean=false)) then begin
        for i:=0 to Length(arr)-1 do begin
          try
            if arr[i]='NPP' then begin
              sCur:=sCur+IntToStr(n)+'. ';
            end else if arr[i]='FIO' then begin
              sCur:=sCur+Trim(tbSostavSem.FieldByName('FAMILIA').AsString+' '+tbSostavSem.FieldByName('NAME').AsString+' '+
                              tbSostavSem.FieldByName('OTCH').AsString)+' ';
            end else if Copy(arr[i],1,3)='OTN' then begin
              if sID<>'' then begin   // типа справка выдается не главе, а [sID]
//--------------------------------------------------------
// nIDKomu     - ID кому выдается справка
// sOtnoshKomu - КОД отношения к главе хоз-ва кому выдается справка
// nIDCur      - ID текущего человека
// sOthosh     - КОД отношения к главе хоз-ва для текущего человека
                if sOtn<>'' then begin
                  v:=GetOtnosh(StrToInt(sID),sOtn,tbSostavSemMEMBER_ID.AsInteger,tbSostavSemOTNOSH.AsString,tbSostavSemPOL.AsString);
                  if VarToStr(v)<>'' then begin
                    sCur:=sCur+ANSILowerCase(VarToStr(v))+' ';
                  end;
                end;
              end else begin
                v:=dmBase.SeekValueTable2(dmBase.SprOtnosh,'ID',tbSostavSem.FieldByName('OTNOSH').AsString,'NAME');
                if v<>null then begin
                  sCur:=sCur+ANSILowerCase(VarToStr(v))+' ';
                end;
              end;
            end else if Copy(arr[i],1,3)='YEA' then begin
              if not tbSostavSem.FieldByName('DATER').IsNull
                then sCur:=sCur+IntToStr(YearOf(tbSostavSem.FieldByName('DATER').AsDateTime))+' г.р. ';
            end else if Copy(arr[i],1,3)='DAT' then begin
              if not tbSostavSem.FieldByName('DATER').IsNull
                then sCur:=sCur+DatePropis(tbSostavSem.FieldByName('DATER').AsDateTime,6)+' ';
            end;
          except
             // в случае ошибки ничего не добавляем
          end;
        end;
      end;
      if sCur<>'' then begin
        Result:=Result+Trim(sCur);
        Inc(n);
      end;
      tbSostavSem.Next;
      if sCur<>'' then begin
        if not tbSostavSem.Eof then Result:=Result+strRazd;
      end;
    end;
  finally
    tbSostavSem.Bookmark:=sBookmark;
  end;
  if RightStr(Result,Length(strRazd))=strRazd then begin
    Result:=Copy(Result,1,Length(Result)-Length(strRazd));
  end;
end;
//---------------------------------------------------------------------------
function TdmMen.ChoiceSprOch(lPost:Boolean;sField,sFieldText:String):Boolean;
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  if sField='' then begin
    sField:='OSNOV';
    sFieldText:='OSNOV_TEXT';
  end;
  Result:=false;
  SetLength(arrRec,1);
  v := null;
  if lPost
    then Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRPOSTOCH')
    else Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRSNOCH');
  if Opis <> nil then begin
    if GlobalTask.ParamAsBoolean('ALL_PRICH') then begin
      // показывать все причины
    end else begin
      Opis.DataSet.Filter:='empty(enddate) or enddate>today()'; //'ISKL=.f.';
      Opis.DataSet.Filtered:=true;
    end;
    try
      if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
        if v <> null then begin
          Result:=true;
          EditDataSet(tbOcheredResh);
          tbOcheredResh.FieldByName(sField).AsInteger:=v;
          if sFieldText<>''
            then tbOcheredResh.FieldByName(sFieldText).AsString:=CreateNameOsnForEdit(GetValueField(arrRec, 'PUNKT'),
                                                                   GetValueField(arrRec, 'NAME'),
                                                                   GetValueField(arrRec, 'UKAZ'));
//            then tbOcheredResh.FieldByName(sFieldText).AsString:=GetValueField(arrRec, 'NAME');
        end;
      end;
    finally
      Opis.DataSet.Filtered:=false;
      Opis.DataSet.Filter:='';
    end;
  end;
end;

//---------------------------------------------------------------------------
procedure TdmMen.ZaprosBank(lMain:Boolean; win:TWinControl);
var
  sl:TStringList;
  s,sPath,sFile,sFam,sName,sOtch,sDateR,sNomer,sFIO,sTel:String;
  p:TPassport;
  f : TfmParamQuest;
  n:Integer;
  dDate:TDateTime;
begin
  if not lMain and (tbSostavSem.RecordCount=0) then begin
    PutError('В составе семь никого нет.',win);
    exit;
  end;
  mtDokument.CheckBrowseMode;
  f:=TfmParamQuest.Create(nil);
  f.Caption := 'Введите значения';
  f.AddParamEx(Globaltask.GetLastValueAsString('ZAP_OCH_FIO_ISP')  , 'ФИО исполнителя', 'FIO','WIDTH=200');
  f.AddParamEx(Globaltask.GetLastValueAsString('ZAP_OCH_TEL_ISP')  , 'Контактный телефон', 'TEL','WIDTH=200');
  f.AddParamEx(Globaltask.GetLastValueAsInteger('ZAP_OCH_NOMER')+1 , 'Номер запроса', 'NOMER','WIDTH=50');
  f.AddParamEx(Now    , 'Дата запроса' , 'DATEZ' ,'TYPE=DATE');
  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  if n = 1 then begin
    sFIO:=f.GetValue('FIO','S');
    sTEL:=f.GetValue('TEL','S');
    sNomer:=f.GetValue('NOMER','S');
    dDate:=f.GetValue('DATEZ','D');
    f.Free;
    Globaltask.SetLastValueAsString('ZAP_OCH_FIO_ISP',sFIO);
    Globaltask.SetLastValueAsString('ZAP_OCH_TEL_ISP',sTEL);
    Globaltask.SetLastValueAsString('ZAP_OCH_NOMER',sNomer);
    if lMain then begin
      p:=dmbase.PasportFromValues(mtDokumentPASP_UDOST.AsInteger, mtDokumentPASP_SERIA.AsString, mtDokumentPASP_NOMER.AsString,
                                  mtDokumentPASP_VIDAN.AsString,mtDokumentLICH_NOMER.AsString,mtDokumentPASP_DATE.Value);
      sFam:=mtDokumentFAMILIA.AsString;
      sName:=mtDokumentNAME.AsString;
      sOtch:=mtDokumentOTCH.AsString;
      sDateR:=DatePropis(mtDokumentDATER.AsDateTime,3);
    end else begin
      p:=dmbase.PasportFromValues(tbSostavSemPASP_UDOST.AsInteger, tbSostavSemPASP_SERIA.AsString, tbSostavSemPASP_NOMER.AsString,
                                  tbSostavSemPASP_VIDAN.AsString,tbSostavSemLICH_NOMER.AsString,tbSostavSemPASP_DATE.Value);
      sFam:=tbSostavSemFAMILIA.AsString;
      sName:=tbSostavSemNAME.AsString;
      sOtch:=tbSostavSemOTCH.AsString;
      sDateR:=DatePropis(tbSostavSemDATER.AsDateTime,3);
    end;
    sl:=TStringList.Create;
    sl.Add('[1:КЛИЕНТ-БАНК АСБ БЕЛАРУСБАНК');
    sl.Add('[2:173GF:s_opnlky.tpl:Сведения о получ. (неполуч.) льгот.кредита 13 указ]');
    sl.Add('[3:]');
    sl.Add('[4:]');
    sl.Add('[5:');
    sl.Add('<101>'+sFam);
    sl.Add('<102>'+sName);
    sl.Add('<103>'+sOtch);
    sl.Add('<601>'+sDateR);
    s:='';
    if p.UdostKod=1 then s:='паспорт гражданина РБ';
    if (p.UdostKod=2) or (p.UdostKod=3) then s:='вид на жительство в РБ';
    if s='' then begin
      sl.Add('<C01>');                 // какая буква русская или латиница ?
      sl.Add('<104>'+p.LichNomer);
      sl.Add('<105>');
      sl.Add('<106>');
      sl.Add('<107>');
      sl.Add('<602>');
    end else begin
      sl.Add('<C01>'+s);                 // какая буква русская или латиница ?
      sl.Add('<104>'+p.LichNomer);
      sl.Add('<105>'+p.Seria);
      sl.Add('<106>'+p.Nomer);
      sl.Add('<107>'+p.Organ);
      sl.Add('<602>'+p.sDate);
    end;

    sl.Add('<108>'+dmBase.Adres_PunktN);
    sl.Add('<109>'+dmBase.Adres_UL);
    sl.Add('<110>'+dmBase.Adres_NDom);
    sl.Add('<111>'+dmBase.Adres_Korp);
    sl.Add('<112>'+dmBase.Adres_Kv);

    sl.Add('<113>'+sFIO);
    sl.Add('<114>'+sTel);
    sl.Add('<116>'+sNomer);
    sl.Add('<603>'+DatePropis(dDate,3));
    sl.Add('~]');

    s:=ANSI2OEM(sl.Text);
    sPath:=ExtractFilePath(Application.ExeName)+'Export';
    ForceDirectories(sPath);
    sFile:=sFam+'_'+sName+'_'+sOtch+'.txt';
    try
      MemoWrite(CheckSleshN(sPath)+sFile,s);
      ShellExecute(Application.Handle, PChar('explore'), PChar(sPath), nil, nil, SW_SHOWNORMAL);
  //    ShellExecute(Application.Handle, nil, PChar(sFile), nil, nil, SW_SHOWNORMAL);
    finally
      sl.Free;
    end;
  end else begin
    f.Free;
  end;
end;

//---------------------------------------------------------------------------
procedure TdmMen.DeleteReshOch(nOcheredID:Integer);
var
  sFilter:String;
  lF,l:Boolean;
begin
  l:=dbDisableControls(tbOcheredResh);
  sFilter:=tbOcheredResh.Filter;
  lF:=tbOcheredResh.Filtered;
  tbOcheredResh.Filter:='';;
  tbOcheredResh.Filtered:=false;
  while tbOcheredResh.Locate('OCHERED_ID', nOcheredID, []) do begin
    tbOcheredResh.Delete;
  end;
  tbOcheredResh.Filter:=sFilter;
  tbOcheredResh.Filtered:=lF;
  dbEnableControls(tbOcheredResh,l);
end;

{$IFDEF MEN_ADD_OWNERS}
procedure TdmMen.CreateHouseOwners;
var
  fldDef:TFieldDef;
begin
  tbHouseOwners:=TkbmMemTable.Create(self);
//  Table.Active:=false;
//  Table.FieldDefs.Clear;
  fldDef := tbHouseOwners.FieldDefs.AddFieldDef;
  fldDef.Name     := 'NOMER';
  fldDef.DataType := ftSmallint;
  fldDef.Required := false;

  fldDef := tbHouseOwners.FieldDefs.AddFieldDef;
  fldDef.Name     := 'TYPEKOD';
  fldDef.DataType := ftSmallint;
  fldDef.Required := false;

  fldDef := tbHouseOwners.FieldDefs.AddFieldDef;
  fldDef.Name     := 'KOD';
  fldDef.DataType := ftInteger;
  fldDef.Required := false;

  fldDef := tbHouseOwners.FieldDefs.AddFieldDef;
  fldDef.Name     := 'TAIL';
  fldDef.DataType := ftString;
  fldDef.Size:=20;
  fldDef.Required := false;

  fldDef := tbHouseOwners.FieldDefs.AddFieldDef;
  fldDef.Name     := 'DATES';                             
  fldDef.DataType := ftDate;
  fldDef.Required := false;

  fldDef := tbHouseOwners.FieldDefs.AddFieldDef;
  fldDef.Name     := 'DATEP';
  fldDef.DataType := ftDate;
  fldDef.Required := false;

  fldDef := tbHouseOwners.FieldDefs.AddFieldDef;
  fldDef.Name     := 'PRIM';
  fldDef.DataType := ftMemo;
  fldDef.Required := false;

  fldDef := tbHouseOwners.FieldDefs.AddFieldDef;
  fldDef.Name     := 'ADRES';
  fldDef.DataType := ftString;
  fldDef.Size:=150;
  fldDef.Required := false;

  fldDef := tbHouseOwners.FieldDefs.AddFieldDef;
  fldDef.Name     := 'NAME';
  fldDef.DataType := ftString;
  fldDef.Size:=150;
  fldDef.Required := false;

  fldDef := tbHouseOwners.FieldDefs.AddFieldDef;
  fldDef.Name     := 'PROPIS';
  fldDef.DataType := ftBoolean;
  fldDef.Required := false;

  tbHouseOwners.CreateTable;
  tbHouseOwners.Active:=true;
end;
{$ENDIF}

end.
