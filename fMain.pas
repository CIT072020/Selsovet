//ЛАИС
unit fMain;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt, EncdDecd, VistaAltFixUnit, Math,
  MetaTask, mPermit, frRtfExp, frOLEExl, FR_Class, FR_E_HTML2, FR_DCtrl, FR_AdsDb, uDataSet2XML, JPEG, ComObj,
  ActnList, ImgList, TB2MDI, TB2Dock, TB2Toolbar, TB2Item, StdCtrls, Mask, DateUtils, MaskUtils,
  DBCtrlsEh, db, fChSS, fChRR, dBase, fExportStru, fmQueryEx, MainLibFr, reportTask, fTelnet,
  FR_VCCtrl, frCheckListBox, uPadegFIO, UserEvents, StrUtils, QStrings,
  fLichSchet, dLichSchet, fMen,dMen, adsset, adsdata, AdsDictionary,
  fGurnal, fGurnAlfKn, fGurnNasel, FuncPr, FuncEh,OLEUtils, kbmMemTable, fParamsGisun,
  kbmMemCSVStreamFormat, mFindInt, FR_DSet, FR_DBSet, SasaIniFile, adsTable,
  dbFunc, Grids, DBGridEh, {$IFNDEF EHLIB3 } GridsEh, {$ENDIF}
  TB2ToolWindow,fmSetUpAction,uUtilFiles,FileCtrl,
  {$IFDEF OBR_GRAG} mDRecInt, {$ENDIF}
  fSimpleD, uCheckbase, fParamQuest,ShellAPI, fLogon,
  {$IFDEF USE_TEMPLATE}  mTempl, mTplInt, {$ENDIF}
  {$IFDEF GISUN} uGisun, {$ENDIF}
  {$IFDEF SMDO} uSMDO, fGurnSMDO, uAvest, fSMDODoc, {$ENDIF}      // СМДО
  extctrls,buttons, act2rtf, sasadbgrid, RKP, fRunObrab, OpisEdit,uTypes,
 {$IFDEF VER150} Variants, {$ENDIF}
 {$IFDEF USE_FR3} MainLibFR3, frxAdsComponents, modify_components, {frx2xto30,}
  frxClass, frxDCtrl, frxDesgn, frxExportRTF, frxExportHTML, frxDBSet,
  frxExportMail, frxExportImage, frxExportXML, frxExportPDF, frxRich, frxChart, {$ENDIF}
  adscnnct, uPSComponent, fs_ichartrtti, fs_idbrtti, fs_iclassesrtti,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP, IdException, IdFTPCommon,
  ComCtrls, ZipForge, IdAntiFreezeBase, IdAntiFreeze, NativeXML, IdHTTP,
  RxGIF, Animate, GIFCtrl, IdThreadComponent, frxExportXLS, frxExportBIFF,
  frxBarcode, RXShell;

type
  TFormGurnal = class of TfmGurnal;

  TfmMain = class(TForm)
    TBDock1: TTBDock;
    TBToolbarMain: TTBToolbar;
    TBMDIHandler1: TTBMDIHandler;
    ImageList: TImageList;
    ActionList: TActionList;
    frADSComponents1: TfrADSComponents;
    frDialogControls1: TfrDialogControls;
    frReport: TfrReport;
    frHTML2Export1: TfrHTML2Export;
    frOLEExcelExport1: TfrOLEExcelExport;
    frRtfAdvExport1: TfrRtfAdvExport;
    TBSubmenuService: TTBSubmenuItem;
    TBItem1: TTBItem;
    acSetParameters: TAction;
    acAdminParameters: TAction;
    TBSubmenuAdmin: TTBSubmenuItem;
    TBItem2: TTBItem;
    acAlfKniga: TAction;
    acSprSOATO: TAction;
    TBSubmenuSpr: TTBSubmenuItem;
    TBSubmenuLich: TTBSubmenuItem;
    TBItem4: TTBItem;
    acTest: TAction;
    TBItemTest: TTBItem;
    acSQL: TAction;
    TBItem7: TTBItem;
    acDesignReport: TAction;
    TBItemReport: TTBItem;
    acPropertyObj: TAction;
    TBItem9: TTBItem;
    acAdres: TAction;
    TBItem10: TTBItem;
    acSprPunkt: TAction;
    TBItemPunks: TTBItem;
    acEditProg: TAction;
    TBItem12: TTBItem;
    acSprNac: TAction;
    acSprStran: TAction;
    TBItem3: TTBItem;
    TBItem13: TTBItem;
    acSprFormOb: TAction;
    acSprMestoOb: TAction;
    acSprLgot: TAction;
    TBItem16: TTBItem;                 
    acSprTypeUL: TAction;
    acSprUL: TAction;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    acSprEdIzm: TAction;
    TBItem19: TTBItem;
    acLichNewSchet: TAction;
    TBSubmenuCreate: TTBSubmenuItem;
    TBSubmenuHelp: TTBSubmenuItem;
    TBItemAbout: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    acSprPrNasel: TAction;
    acSprPrLich: TAction;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    acSprUchZaved: TAction;
    acSprOtnosh: TAction;
    TBItem23: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem24: TTBItem;
    acSprWork: TAction;
    acSprDolg: TAction;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    acStrTypePens: TAction;
    TBItem27: TTBItem;
    acSprTypeMigr: TAction;
    TBItem28: TTBItem;
    acSprMatSten: TAction;
    TBItem29: TTBItem;
    acSprPrSozd: TAction;
    acSprPrLikv: TAction;
    acSprTypeHouse: TAction;
    TBItem30: TTBItem;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItemExit: TTBItem;
    TBSubmenuItemDok: TTBSubmenuItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem20: TTBItem;
    acRsPasport: TAction;
    acReRogd: TAction;
    acReSmert: TAction;
    acReBrak: TAction;
    TBItem8: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    TBItem35: TTBItem;
    acZPasport: TAction;
    acZBrak: TAction;
    acZRogd: TAction;
    acZSmert: TAction;
    TBItem36: TTBItem;
    TBItem37: TTBItem;
    TBItem38: TTBItem;
    TBItem39: TTBItem;
    acUpdateBase: TAction;
    TBItemReindexBase: TTBItem;
    acNasel: TAction;
    TBItem41: TTBItem;
    acInstruct: TAction;
    TBItem42: TTBItem;
    mtOperFind: TkbmMemTable;
    kbmCSVStreamFormat1: TkbmCSVStreamFormat;
    mtOperFindName: TStringField;
    mtOperFindCaption: TStringField;
    mtOperFindSQL: TStringField;
    mtOperFindFieldKinds: TStringField;
    mtOperFindNeedValue: TBooleanField;
    mtOperFindTwoValue: TBooleanField;
    mtOperFindIgnoreCase: TBooleanField;
    acFindOper: TAction;
    TBItem43: TTBItem;
    mtReport: TkbmMemTable;
    frDBDataSetReport: TfrDBDataSet;
    mtSprRazdel: TkbmMemTable;
    mtSprProperty: TkbmMemTable;
    mtSprRazdelTYPEOBJ: TSmallintField;
    mtSprRazdelID: TIntegerField;
    mtSprRazdelNOMER: TSmallintField;
    mtSprRazdelNAME: TStringField;
    mtSprRazdelFNAME: TStringField;
    mtSprRazdelVISIBLE: TBooleanField;
    mtSprRazdelENABLED: TBooleanField;
    mtSprRazdelUSER: TStringField;
    mtSprRazdelLIST: TBooleanField;
    mtSprPropertyTYPEOBJ: TSmallintField;
    mtSprPropertyRAZDEL: TIntegerField;
    mtSprPropertyID: TIntegerField;
    mtSprPropertyNOMER: TSmallintField;
    mtSprPropertyKOD: TStringField;
    mtSprPropertyTIP: TStringField;
    mtSprPropertyVID: TSmallintField;
    mtSprPropertyNAME: TStringField;
    mtSprPropertyFNAME: TStringField;
    mtSprPropertyEDIZM: TStringField;
    mtSprPropertyEDITMASK: TStringField;
    mtSprPropertyVISIBLE: TBooleanField;
    mtSprPropertyENABLE: TBooleanField;
    mtSprPropertyUSER: TStringField;
    mtSprPropertyOPISEDIT: TStringField;
    mtSprPropertyFIELDNAME: TStringField;
    mtSprPropertyWHERESAVE: TSmallintField;
    mtSprPropertyWIDTH: TStringField;
    mtSprPropertyFONT_SIZE: TSmallintField;
    mtSprPropertyFONT_BOLD: TBooleanField;
    mtSprPropertyFONT_KURSIV: TBooleanField;
    mtSprPropertyFONT_PODCH: TBooleanField;
    mtSprPropertyDATE_CR: TDateField;
    mtSprPropertyDATE_DEL: TDateField;
    mtSprPropertyLINE_UP: TBooleanField;
    mtSprPropertyLINE_DOWN: TBooleanField;
    acSetDateFiks: TAction;
    TBItemDateFiks: TTBItem;
    acCreateSost: TAction;
    TBItemCreateSost: TTBItem;
    acDeleteSost: TAction;
    TBItemDelSost: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    acBackup: TAction;
    acRestore: TAction;
    TBItemBackup: TTBItem;
    TBItemRestore: TTBItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBDock2: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem44: TTBItem;
    TBToolWindowS: TTBToolWindow;
    TBItem45: TTBItem;
    edSost: TDBEditEh;
    mtOperFindMultiSel: TBooleanField;
    mtOperFindMultiOr: TBooleanField;
    mtOperFindOrder: TWordField;
    mtSprPropertyNAME_FLT: TStringField;
    mtSprPropertyDEFAULT_OP: TStringField;
    mtSprPropertyADD_FLT: TStringField;
    mtSprPropertyUROV: TIntegerField;
    mtSprPropertyFIELD_FLT: TStringField;
    ImageListMove: TImageList;
    mtOperFindVisible: TBooleanField;
    mtOperFindOwnValue: TBooleanField;
    mtOperFindOwnValName: TStringField;
    mtOperFindOwnValKind: TStringField;
    mtOperFindSprName: TStringField;
    TBItem40: TTBItem;
    TBItem46: TTBItem;
    TBItem47: TTBItem;
    acSetPassword: TAction;
    TBItem48: TTBItem;
    acFullUpdate: TAction;
    TBItem49: TTBItem;
    acFullClose: TAction;
    acFullOpen: TAction;
    TBItem50: TTBItem;
    acUstOtc: TAction;
    TBItem51: TTBItem;
    TBItem52: TTBItem;
    acReZUstOtc: TAction;
    TBSeparatorItem13: TTBSeparatorItem;
    TBItem53: TTBItem;
    acTalonPrib: TAction;
    acTalonUbit: TAction;
    TBSeparatorItem15: TTBSeparatorItem;
    TBItem54: TTBItem;
    TBItem55: TTBItem;
    TBSeparatorItem17: TTBSeparatorItem;
    TBSeparatorItem18: TTBSeparatorItem;
    TBItem56: TTBItem;
    TBItem57: TTBItem;
    acReTalonPrib: TAction;
    acReTalonUbit: TAction;
    TBItem58: TTBItem;
    TBItem59: TTBItem;
    acSetUpActions: TAction;
    TBItem60: TTBItem;
    mtTablesFields: TkbmMemTable;
    mtTablesFieldsTableName: TStringField;
    TBItemOpisTables: TTBItem;
    mtTablesFieldsFieldName: TStringField;
    mtTablesFieldsEnableF: TBooleanField;
    mtTablesFieldsCaption: TStringField;
    mtTablesFieldsGruppa: TStringField;
    mtTablesFieldsSpr_Filter: TStringField;
    mtTables: TkbmMemTable;
    mtTablesNomer: TIntegerField;
    mtTablesTableName: TStringField;
    mtTablesCaption: TStringField;
    mtTablesBaseName: TStringField;
    mtTablesFieldsNomer: TIntegerField;
    mtTablesIsExists: TBooleanField;
    mtTablesIsChange: TBooleanField;
    mtTablesIsNew: TBooleanField;
    acSprNalogi: TAction;
    TBItem61: TTBItem;
    mtTablesFieldsFTS: TBooleanField;
    acSprPrichSm: TAction;
    TBItem62: TTBItem;
    acVostZBrak: TAction;
    TBSeparatorItem20: TTBSeparatorItem;
    TBItem63: TTBItem;
    acVostZRogd: TAction;
    acVostZSmert: TAction;
    acZRast: TAction;
    acReRast: TAction;
    acZAdopt: TAction;
    TBItem70: TTBItem;
    acReAdopt: TAction;
    acReChName: TAction;
    acSprNamesM: TAction;
    TBItem75: TTBItem;
    acSprNamesG: TAction;
    TBItem76: TTBItem;
    acZPasportViza: TAction;
    TBItem78: TTBItem;
    acRePassportViza: TAction;
    TBItem79: TTBItem;
    acSprNames: TAction;
    TBItem80: TTBItem;
    acVigrZAGS: TAction;
    acLoadZAGS: TAction;
    TBItem81: TTBItem;
    TBItem82: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    mtTablesFieldsNotGroupBy: TBooleanField;
    TBItemRegisterProg: TTBItem;
    TBSeparatorItem14: TTBSeparatorItem;
    acAddReportZAGS: TAction;
    TBItemReportZags: TTBItem;
    acReindexBase: TAction;
    TBItemLoadLic: TTBItem;
    acExceptFIO: TAction;
    TBSeparatorItem16: TTBSeparatorItem;
    TBItem83: TTBItem;
    acSprIzbUch: TAction;
    TBSubmenuSysSpr: TTBSubmenuItem;
    TBItem84: TTBItem;
    TBSubmenuReports: TTBSubmenuItem;
    TBSubmenuWord: TTBSubmenuItem;
    acSprOsibOtm: TAction;
    acSprKomiss: TAction;
    TBSubmenuSprVUS: TTBSubmenuItem;
    TBItem85: TTBItem;
    TBItem86: TTBItem;
    acVUS: TAction;
    TBItem87: TTBItem;
    acRunObrab: TAction;
    TBItemRunObrab: TTBItem;
    acPropHouse: TAction;
    TBItem88: TTBItem;
    acSprOwners: TAction;
    acReOwners: TAction;
    TBItem90: TTBItem;
    frCurDok: TfrDBDataSet;
    mtTablesFieldsEnableH: TBooleanField;
    acEditIspor: TAction;
    TBItem91: TTBItem;
    acSprFamily: TAction;
    TBSubmenuFIO: TTBSubmenuItem;
    TBItem92: TTBItem;
    TBSubmenuAdd: TTBSubmenuItem;
    acSprPerevod: TAction;
    TBItemPerevod: TTBItem;
    TBSubmenuBlank: TTBSubmenuItem;
    acRunAutoRestore: TAction;
    TBItemAutoRestore: TTBItem;
    acSprIst: TAction;
    TBItem11: TTBItem;
    TBItem93: TTBItem;
    acShablon: TAction;
    TBItem94: TTBItem;
    TBItemWorkZAGS: TTBItem;
    acSprMestWork: TAction;
    TBSubmenuZAGS: TTBSubmenuItem;
    TBItemSeriaSvid: TTBItem;
    acSeriaSvid: TAction;
    acReSvidZAGS: TAction;
    TBItemSvid: TTBItem;
    acSprTypePunkt: TAction;
    acProvSvidZAGS: TAction;
    TBItemProvSvidZags: TTBItem;
    acAlfavitZAGS: TAction;
    TBItemAlfavitZAGS: TTBItem;
    acWordShtamp: TAction;
    TBItem6: TTBItem;
    TBItemNew: TTBItem;
    acGerbShamp: TAction;
    TBItem95: TTBItem;
    TBSeparatorItem23: TTBSeparatorItem;
    acViewLogFile: TAction;
    TBItem96: TTBItem;
    acSprPredst: TAction;
    TBItem97: TTBItem;
    TBSubmenuBlankZAGS: TTBSubmenuItem;
    acDBrak: TAction;
    TBItem98: TTBItem;
    TBSeparatorItem24: TTBSeparatorItem;
    acReDeclBrak: TAction;
    TBItemDeclBrak: TTBItem;
    ConnectExp: TAdsConnection;
    TBSubmenuVigr: TTBSubmenuItem;
    TBItem99: TTBItem;
    acUstMat: TAction;
    acReZUstMat: TAction;
    TBItem102: TTBItem;
    acSprRovd: TAction;
    acSprVoenkom: TAction;
    TBItem103: TTBItem;
    TBSeparatorItem26: TTBSeparatorItem;
    TBItem104: TTBItem;
    acSprMestRegistr: TAction;
    TBItem105: TTBItem;
    acSprPostOch: TAction;
    acSprSnOch: TAction;
    acReOchered: TAction;
    TBItemOchered: TTBItem;
    mtTablesFieldsEnableI: TBooleanField;
    TBItem108: TTBItem;
    TBSeparatorItem27: TTBSeparatorItem;
    TBItem109: TTBItem;
    acObrach: TAction;
    TBItemObr: TTBItem;
    acSprDocFolder: TAction;
    acSprDocOfficial: TAction;
    acSprDocFileList: TAction;
    acSprDocSubj: TAction;
    acSprDocManGroup: TAction;
    TBSubmenuSprObr: TTBSubmenuItem;
    TBItem107: TTBItem;
    TBItem110: TTBItem;
    TBItem111: TTBItem;
    TBItem112: TTBItem;
    TBItem113: TTBItem;
    acPriemGr: TAction;
    TBSeparatorItemObr1: TTBSeparatorItem;
    mtSprPropertyMINVALUE: TIntegerField;
    mtSprPropertyMAXVALUE: TIntegerField;
    mtSprPropertyDISPLAYFORMAT: TStringField;
    mtTablesFieldsCalc: TMemoField;
    acVigrBelGosStrax: TAction;
    TBItemVigrBelGosStrax: TTBItem;
    acUnionBase: TAction;
    TBItemUnionBase: TTBItem;
    TBItemViewFile: TTBItem;
    PSScript1: TPSScript;
    acSprDocGroup: TAction;
    TBItem114: TTBItem;
    acSetShare: TAction;
    TBItemSetShare: TTBItem;
    acDelShare: TAction;
    TBItemDelShare: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem29: TTBSeparatorItem;
    acPermitUsers: TAction;
    TBItemPermitUsers: TTBItem;
    mtActions: TkbmMemTable;
    mtActionsName: TStringField;
    mtActionsSubSystem: TSmallintField;
    mtActionsKod: TStringField;
    TBItemActions: TTBItem;
    mtActionsNomer: TSmallintField;
    acSeekAndRestore: TAction;
    TBItemSeekAndRestore: TTBItem;
    mtActionsTypeObj: TIntegerField;
    mtActionsNew: TBooleanField;
    acUchSprav: TAction;
    acVxodDokum: TAction;
    acIsxDokum: TAction;
    acAdminProcedur: TAction;
    TBItemVxodDokum: TTBItem;
    TBItemIsxodDokum: TTBItem;
    TBItemAdminProcedur: TTBItem;
    TBItemUchSprav: TTBItem;
    acLoadMRUListZAGS: TAction;
    TBItemLoadMRUListZAGS: TTBItem;
    acDesignReport3: TAction;
    TBItemReport3: TTBItem;
    acVigrStat: TAction;
    TBItem5: TTBItem;
    acSprDocAdmProc: TAction;
    TBItem14: TTBItem;
    acVigrRIAP: TAction;
    acViewVigrRIAP: TAction;
    TBSeparatorItem30: TTBSeparatorItem;
    TBItemJurnOper: TTBItem;
    TBItemVigrRIAP: TTBItem;
    fsDBRTTI1: TfsDBRTTI;
    fsChartRTTI1: TfsChartRTTI;
    fsClassesRTTI1: TfsClassesRTTI;
    acSprRodsName: TAction;
    TBItem15: TTBItem;
    TBItem89: TTBItem;
    acReDeclRegistr: TAction;
    TBItemReDeclRegistr: TTBItem;
    acDeclareRegistr: TAction;
    TBItemDeclRegistr: TTBItem;
    TBSeparatorItem31: TTBSeparatorItem;
    TBItemDeclareRegistr: TTBItem;
    IdFTP1: TIdFTP;
    pb: TProgressBar;
    Zip: TZipForge;
    acZVidGit: TAction;
    TBItemVidGit: TTBItem;
    TBItem66: TTBItem;
    IdAntiFreeze1: TIdAntiFreeze;
    btCancel: TButton;
    acCheckUpdate: TAction;
    TBSeparatorItem32: TTBSeparatorItem;
    TBItem68: TTBItem;
    acLoadChangeATE: TAction;
    TBItemLoadChangeATE: TTBItem;
    TBItemLoadSysPrichSm: TTBItem;
    acPackBase: TAction;
    TBItem69: TTBItem;
    acSetUserGIS: TAction;
    acClearUserGIS: TAction;
    acQueryListIN: TAction;
    acViewIN: TAction;
    TBItem72: TTBItem;
    TBItem73: TTBItem;
    TBItem100: TTBItem;
    TBItem106: TTBItem;
    TBSeparatorItem33: TTBSeparatorItem;
    IdHTTP1: TIdHTTP;
    GIFAnimator: TRxGIFAnimator;
    IdThreadComponent1: TIdThreadComponent;
    acSprDocAdmProcU: TAction;
    TBItem115: TTBItem;
    TBItem116: TTBItem;
    TBItemShablonPrigl: TTBItem;
    acVigrOch: TAction;
    TBItemVigrOch: TTBItem;
    TBItemXMLtoSPR: TTBItem;
    acGisunParams: TAction;
    TBItemNotGISUN: TTBItem;
    acParamsFTP: TAction;
    TBItemParamsFTP: TTBItem;
    acLoadFromBTI: TAction;
    TBItemLoadBTI: TTBItem;
    frxPDFExport: TfrxPDFExport;
    frxBIFFExport1: TfrxBIFFExport;
    frxXLSExport1: TfrxXLSExport;
    TBSeparatorItem34: TTBSeparatorItem;
    TBItemUpdateAdmProc: TTBItem;
    acUpdateAdmProc: TAction;
    TBSubmenuAddVigr: TTBSubmenuItem;
    frxReport: TfrxReport;
    TBItemOpenDok: TTBItem;
    acRunVigrZAH: TAction;
    TBItemRunVigrZAH: TTBItem;
    acAktZ: TAction;
    TBItemAktZ: TTBItem;
    TBSeparatorItem35: TTBSeparatorItem;
    acReAktZ: TAction;
    TBItemReAktZ: TTBItem;
    acSprZAH: TAction;
    TBItemSprZAH: TTBItem;
    acLoadZAH: TAction;
    TBItemLoadZAH: TTBItem;
    acWordShtampBel: TAction;
    TBItem64: TTBItem;
    acFileSvrZAGS: TAction;
    TBItemFileSvr: TTBItem;
    TBSubmenuDocs: TTBSubmenuItem;
    acSMDORunLoadSpr: TAction;
    acSMDOEditParams: TAction;
    TBItem117: TTBItem;
    acSMDOPost: TAction;
    TBItemGurnSMDO: TTBItem;
    TBSeparatorItem36: TTBSeparatorItem;
    TBSeparatorItem37: TTBSeparatorItem;
    TBSeparatorItem38: TTBSeparatorItem;
    acSMDOSprOrg: TAction;
    acSMDOSprKind: TAction;
    TBItemSMDOParams: TTBItem;
    acSMDORefreshCOC: TAction;
    acReZOpeka: TAction;
    acSprRazmer: TAction;
    TBItem65: TTBItem;
    TimerPKNCI: TTimer;
    acSMDORunWebLoadSpr: TAction;
    TBItem77: TTBItem;
    lbSost: TStaticText;
    acLoadClass: TAction;
    ImageList1: TImageList;
    TBSeparatorItem21: TTBSeparatorItem;
    TBItemVigrZah: TTBItem;
    TBItemZagrZah: TTBItem;
    TBItemSeek: TTBItem;
    pn: TPanel;
    sb: TStatusBar;
    frxBarCodeObject1: TfrxBarCodeObject;
    acUZRogd: TAction;
    acUZUstOtc: TAction;
    acUZSmert: TAction;
    TBSubmenuGurnZags: TTBSubmenuItem;
    TBItem118: TTBItem;
    TBItem119: TTBItem;
    TBItem120: TTBItem;
    TBSeparatorItem28: TTBSeparatorItem;
    acLoadSprOrgSMDO: TAction;
    TBItem67: TTBItem;
    TBItemGISUNParams: TTBItem;
    TBItemDefaultIni: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    acSprDocSubjG: TAction;
    TBItem71: TTBItem;
    acAddReportPU: TAction;
    TBItemReportPU: TTBItem;
    TBSubmenuExcel: TTBSubmenuItem;
    acSprWriteDecl: TAction;
    TBItem74: TTBItem;
    TBItemPropUsers: TTBItem;
    TBToolWindowE: TTBToolWindow;
    imgNewPost: TRxGIFAnimator;
    lbNewPost: TLabel;
    TimerNewPost: TTimer;
    acSaveCert: TAction;
    TBItemSaveCert: TTBItem;
    TBSeparatorVedArx: TTBSeparatorItem;
    TBItemDeloToVedomArx: TTBItem;
    TBItemNomekToVedomArx: TTBItem;
    TBItemNew2: TTBItem;
    TBItemLoadSysSpr: TTBItem;
    acReQueryGis: TAction;
    procedure acSetParametersExecute(Sender: TObject);
    procedure acAdminParametersExecute(Sender: TObject);

    procedure OnTemplateMenuClick(Sender: TObject);
    function OnBeforeTemplateAdd(Template:TTemplate):Boolean;
    procedure BuildToolbarMenu;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditSOATO_RR(Sender: TObject; var Handled: Boolean);
    procedure EditSOATO_SS(Sender: TObject; var Handled: Boolean);
    procedure Event_EditFormNomer(Sender: TObject; var Handled: Boolean);

    procedure EditSOATO_GES(Sender: TObject; var Handled: Boolean);
    procedure EditSOATO_Organ(Sender: TObject; var Handled: Boolean);
    procedure SOATO_GetText(Sender: TField; var Text: String; DisplayText : Boolean);
    procedure acAlfKnigaExecute(Sender: TObject);
    procedure acSprSOATOExecute(Sender: TObject);
    procedure acTestExecute(Sender: TObject);
    procedure acSQLExecute(Sender: TObject);
    procedure acDesignReportExecute(Sender: TObject);
    procedure acPropertyObjExecute(Sender: TObject);
    procedure acAdresExecute(Sender: TObject);
    procedure acSprPunktExecute(Sender: TObject);
    procedure acEditProgExecute(Sender: TObject);
    procedure acSprNacExecute(Sender: TObject);
    procedure acSprStranExecute(Sender: TObject);
    procedure acSprFormObExecute(Sender: TObject);
    procedure acSprMestoObExecute(Sender: TObject);
    procedure acSprLgotExecute(Sender: TObject);
    procedure acSprTypeULExecute(Sender: TObject);
    procedure acSprULExecute(Sender: TObject);
    procedure acSprEdIzmExecute(Sender: TObject);
    procedure acLichNewSchetExecute(Sender: TObject);
    procedure TBItemAboutClick(Sender: TObject);
    procedure acSprPrNaselExecute(Sender: TObject);
    procedure acSprPrLichExecute(Sender: TObject);
    procedure acSprUchZavedExecute(Sender: TObject);
    procedure acSprOtnoshExecute(Sender: TObject);
    procedure acSprWorkExecute(Sender: TObject);
    procedure acSprDolgExecute(Sender: TObject);
    procedure acStrTypePensExecute(Sender: TObject);
    procedure acSprTypeMigrExecute(Sender: TObject);
    procedure acSprMatStenExecute(Sender: TObject);
    procedure acSprPrSozdExecute(Sender: TObject);
    procedure acSprPrLikvExecute(Sender: TObject);
    procedure acSprTypeHouseExecute(Sender: TObject);
    procedure TBItemExitClick(Sender: TObject);
    procedure acRsPasportExecute(Sender: TObject);
    procedure acReRogdExecute(Sender: TObject);
    procedure acReSmertExecute(Sender: TObject);
    procedure acReBrakExecute(Sender: TObject);
    procedure acZPasportExecute(Sender: TObject);
    procedure acZBrakExecute(Sender: TObject);
    procedure acZRogdExecute(Sender: TObject);
    procedure acZSmertExecute(Sender: TObject);
    procedure acUpdateBaseExecute(Sender: TObject);
    procedure acNaselExecute(Sender: TObject);
    procedure acInstructExecute(Sender: TObject);
    procedure acFindOperExecute(Sender: TObject);
    procedure acSetDateFiksExecute(Sender: TObject);
    procedure acCreateSostExecute(Sender: TObject);
    procedure acDeleteSostExecute(Sender: TObject);
    procedure acBackupExecute(Sender: TObject);
    procedure acRestoreExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edSostClick(Sender: TObject);
    procedure acFullCloseExecute(Sender: TObject);
    procedure acFullOpenExecute(Sender: TObject);
    procedure acUstOtcExecute(Sender: TObject);
    procedure acReZUstOtcExecute(Sender: TObject);
    procedure acTalonPribExecute(Sender: TObject);
    procedure acTalonUbitExecute(Sender: TObject);
    procedure acReTalonPribExecute(Sender: TObject);
    procedure acReTalonUbitExecute(Sender: TObject);
    procedure acSetUpActionsExecute(Sender: TObject);
    procedure TBItemOpisTablesClick(Sender: TObject);
    procedure acSprNalogiExecute(Sender: TObject);
    procedure acSprPrichSmExecute(Sender: TObject);
    procedure acVostZBrakExecute(Sender: TObject);
    procedure acVostZRogdExecute(Sender: TObject);
    procedure acVostZSmertExecute(Sender: TObject);
    procedure acZRastExecute(Sender: TObject);
    procedure acZAdoptExecute(Sender: TObject);
    procedure acReAdoptExecute(Sender: TObject);
    procedure acZChNameExecute(Sender: TObject);
    procedure acSprNamesMExecute(Sender: TObject);
    procedure acSprNamesGExecute(Sender: TObject);
    procedure acZPasportVizaExecute(Sender: TObject);
    procedure acRePassportVizaExecute(Sender: TObject);
    procedure acSprNamesExecute(Sender: TObject);
    procedure acVigrZAGSExecute(Sender: TObject);
    procedure acLoadZAGSExecute(Sender: TObject);
    procedure TBItemRegisterProgClick(Sender: TObject);
    procedure acAddReportZAGSExecute(Sender: TObject);
    procedure acReindexBaseExecute(Sender: TObject);
    procedure TBItemLoadLicClick(Sender: TObject);
    procedure acExceptFIOExecute(Sender: TObject);
    procedure acSprIzbUchExecute(Sender: TObject);
    procedure acSprOsibOtmExecute(Sender: TObject);
    procedure acSprKomissExecute(Sender: TObject);
    procedure acVUSExecute(Sender: TObject);
    procedure acRunObrabExecute(Sender: TObject);
    procedure acPropHouseExecute(Sender: TObject);
    procedure acSprOwnersExecute(Sender: TObject);
    procedure acReOwnersExecute(Sender: TObject);
    procedure acEditIsporExecute(Sender: TObject);
    procedure acSprFamilyExecute(Sender: TObject);
    procedure acSprPerevodExecute(Sender: TObject);
    procedure acRunAutoRestoreExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acSprIstExecute(Sender: TObject);
    procedure acShablonExecute(Sender: TObject);
    procedure acSprMestWorkExecute(Sender: TObject);
    procedure acSeriaSvidExecute(Sender: TObject);
    procedure acReSvidZAGSExecute(Sender: TObject);
    procedure acSprTypePunktExecute(Sender: TObject);
    procedure acProvSvidZAGSExecute(Sender: TObject);
    procedure acAlfavitZAGSExecute(Sender: TObject);
    procedure acWordShtampExecute(Sender: TObject);
    procedure TBItemNewClick(Sender: TObject);
    procedure acGerbShampExecute(Sender: TObject);
    procedure acViewLogFileExecute(Sender: TObject);
    procedure acSprPredstExecute(Sender: TObject);
    procedure acDBrakExecute(Sender: TObject);
    procedure acReDeclBrakExecute(Sender: TObject);
    procedure acUstMatExecute(Sender: TObject);
    procedure acSprRovdExecute(Sender: TObject);
    procedure acSprVoenkomExecute(Sender: TObject);
    procedure acSprMestRegistrExecute(Sender: TObject);
    procedure acSprPostOchExecute(Sender: TObject);
    procedure acSprSnOchExecute(Sender: TObject);
    procedure acReOcheredExecute(Sender: TObject);
    procedure acObrachExecute(Sender: TObject);
    procedure acSprDocFolderExecute(Sender: TObject);
    procedure acSprDocOfficialExecute(Sender: TObject);
    procedure acSprDocFileListExecute(Sender: TObject);
    procedure acSprDocSubjExecute(Sender: TObject);
    procedure acSprDocManGroupExecute(Sender: TObject);
    procedure acPriemGrExecute(Sender: TObject);
    procedure acVigrBelGosStraxExecute(Sender: TObject);
    procedure acUnionBaseExecute(Sender: TObject);
    procedure TBItemViewFileClick(Sender: TObject);
    procedure acSprDocGroupExecute(Sender: TObject);
    procedure acSetShareExecute(Sender: TObject);
    procedure acDelShareExecute(Sender: TObject);
    procedure acSetPasswordExecute(Sender: TObject);
    procedure acPermitUsersExecute(Sender: TObject);
    procedure TBItemActionsClick(Sender: TObject);
    procedure acSeekAndRestoreExecute(Sender: TObject);
    procedure acUchSpravExecute(Sender: TObject);
    procedure acVxodDokumExecute(Sender: TObject);
    procedure acIsxDokumExecute(Sender: TObject);
    procedure acAdminProcedurExecute(Sender: TObject);
    procedure acLoadMRUListZAGSExecute(Sender: TObject);
    procedure acDesignReport3Execute(Sender: TObject);
    procedure acVigrStatExecute(Sender: TObject);
    procedure acSprDocAdmProcExecute(Sender: TObject);
    procedure acVigrRIAPExecute(Sender: TObject);
    procedure acViewVigrRIAPExecute(Sender: TObject);
    procedure acSprRodsNameExecute(Sender: TObject);
    procedure acReDeclRegistrExecute(Sender: TObject);
    procedure acDeclareRegistrExecute(Sender: TObject);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus; const AStatusText: String);
    procedure IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCountMax: Integer);
    procedure IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;   const AWorkCount: Integer);
    procedure acZVidGitExecute(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure acCheckUpdateExecute(Sender: TObject);
    procedure acLoadChangeATEExecute(Sender: TObject);
    procedure TBItemLoadSysPrichSmClick(Sender: TObject);
    procedure acPackBaseExecute(Sender: TObject);
    procedure acSetUserGISExecute(Sender: TObject);
    procedure acClearUserGISExecute(Sender: TObject);
    procedure acQueryListINExecute(Sender: TObject);
    procedure acViewINExecute(Sender: TObject);
    procedure IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;     const AWorkCount: Integer);
    procedure IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;   const AWorkCountMax: Integer);
    procedure IdHTTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdThreadComponent1Run(Sender: TIdCustomThreadComponent);
    procedure acSprDocAdmProcUExecute(Sender: TObject);
    procedure TBItem116Click(Sender: TObject);
    procedure TBItemShablonPriglClick(Sender: TObject);
    procedure acVigrOchExecute(Sender: TObject);
    procedure TBItemXMLtoSPRClick(Sender: TObject);
    procedure acGisunParamsExecute(Sender: TObject);
    procedure TBItemNotGISUNClick(Sender: TObject);
    procedure acParamsFTPExecute(Sender: TObject);
    procedure acLoadFromBTIExecute(Sender: TObject);
    procedure acUpdateAdmProcExecute(Sender: TObject);
    procedure TBItemOpenDokClick(Sender: TObject);
    procedure acRunVigrZAHExecute(Sender: TObject);
    procedure acAktZExecute(Sender: TObject);
    procedure acReAktZExecute(Sender: TObject);
    procedure acSprZAHExecute(Sender: TObject);
    procedure acLoadZAHExecute(Sender: TObject);
    procedure acWordShtampBelExecute(Sender: TObject);
    procedure acFileSvrZAGSExecute(Sender: TObject);
    procedure acSMDORunLoadSprExecute(Sender: TObject);
    procedure acSMDOEditParamsExecute(Sender: TObject);
    procedure acSMDOPostExecute(Sender: TObject);
    procedure acSMDOSprOrgExecute(Sender: TObject);
    procedure acSMDOSprKindExecute(Sender: TObject);
    procedure acSMDORefreshCOCExecute(Sender: TObject);
    procedure acReZOpekaExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acSprRazmerExecute(Sender: TObject);
    procedure TimerPKNCITimer(Sender: TObject);
    procedure acSMDORunWebLoadSprExecute(Sender: TObject);
    procedure lbSostClick(Sender: TObject);
    procedure lbSostDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure acLoadClassExecute(Sender: TObject);
    procedure TBItemVigrZahClick(Sender: TObject);
    procedure TBItemZagrZahClick(Sender: TObject);
    procedure TBItemSeekClick(Sender: TObject);
    procedure acUZRogdExecute(Sender: TObject);
    procedure acUZUstOtcExecute(Sender: TObject);
    procedure acUZSmertExecute(Sender: TObject);
    procedure acLoadSprOrgSMDOExecute(Sender: TObject);
    procedure TBItemDefaultIniClick(Sender: TObject);
    procedure acSprDocSubjGExecute(Sender: TObject);
    procedure acAddReportPUExecute(Sender: TObject);
    procedure acSprWriteDeclExecute(Sender: TObject);
    procedure TBItemPropUsersClick(Sender: TObject);
    procedure imgNewPostClick(Sender: TObject);
    procedure TimerNewPostTimer(Sender: TObject);
    procedure acSaveCertExecute(Sender: TObject);
    procedure TBItemNomekToVedomArxClick(Sender: TObject);
    procedure TBItemDeloToVedomArxClick(Sender: TObject);
    procedure TBItemNew2Click(Sender: TObject);
    procedure TBItemLoadSysSprClick(Sender: TObject);
    procedure acReQueryGisExecute(Sender: TObject);
//  protected
//    procedure CreateParams(var Params: TCreateParams);
  private
    { Private declarations }
    FCountIdle: Integer;
    FYearFiks: Integer;
    VistaAltFix:TVistaAltFix;
    FRunActivate : Boolean;
    FDateFiks: TDateTime;
    FFltOpList: TOperList;
    FFltSprList: TSprList;
    FLog_WriteException: Boolean;
    FLog_WriteOwner: Boolean;
    FEventsWordReports : TUserEvents;
    FEventsBlankReports : TUserEvents;
    FEventsBlankZAGSReports : TUserEvents;
    FEventsAddVigr : TUserEvents;
    {$IFDEF USE_TEMPLATE}
    FTemplateInterface : TTemplateInterface;
    {$ENDIF}
    procedure SaveToIni;
    procedure LoadFromIni;
    procedure SetDateFiks(const Value: TDateTime);
    procedure SetFltOpList(const Value: TOperList);
    procedure SetFltSprList(const Value: TSprList);
    procedure SetLog_WriteException(const Value: Boolean);
    procedure SetLog_WriteOwner(const Value: Boolean);
    function GetXMLZAH:String;
    procedure SetYearFiks(const Value: Integer);

    {$IFDEF USE_TEMPLATE}
    procedure SetTemplateInterface(const Value: TTemplateInterface);
    {$ENDIF}
  public
    Fds:TDataSet;
    ds2xml:TDataSets2XML;

    FRunAddMenu:Boolean;

    {$IFDEF USE_FR3}
    frxADSComponents:TfrxADSComponents;
//    frxReport: TfrxReport;
    frxChartObject:TfrxChartObject;
    frxRichObject: TfrxRichObject;
    frxDialogControls: TfrxDialogControls;
//    frxPDFExport: TfrxPDFExport;
    frxXMLExport: TfrxXMLExport;
    frxJPEGExport: TfrxJPEGExport;
    frxMailExport: TfrxMailExport;
    frxHTMLExport: TfrxHTMLExport;
    frxRTFExport: TfrxRTFExport;
    {$ENDIF}

    IDProg : String;
    IDLastMen : Integer;           // ID человека который корректировался послежним, заполняется после вызова EditDokument (EditForm)
    fmLichSchet : TfmLichSchet;
    fmMen : TfmMen;
    dmLichSchet : TdmLichSchet;
    dmMen : TdmMen;
    CurDok : TDataSet;
    FormCurrentDok  : TfmSimpleD;
    FOpenLic : Boolean;      // открыта форма лицевого счета
    {$IFDEF OBR_GRAG}
    DocRecord: TDocRecordInterface;
    {$ENDIF}
    ListParamsSpr : TStringList;
    {$IFDEF USE_TEMPLATE}
    property TemplateInterface : TTemplateInterface read FTemplateInterface write SetTemplateInterface;
    {$ENDIF}
    property YearFiks : Integer read FYearFiks write SetYearFiks;
    property DateFiks : TDateTime read FDateFiks write SetDateFiks;
    property FltOpList  : TOperList read FFltOpList write SetFltOpList;
    property FltSprList : TSprList read FFltSprList write SetFltSprList;

    procedure BeforeClose_ListIN( Grid : TSasaDbGrid; var lClose: Boolean);

    procedure BeforeSaveParamsEvent( Meta : TMetaTask; var lOk : boolean);
    procedure UpdateParamsEvent( Meta : TMetaTask; const strName : String);
    procedure AfterSaveParamsEvent( Meta : TMetaTask; const strName : String);
    procedure CheckFormLichSchet;
    procedure CheckFormMen;
    function IsGorSovet : Boolean;

    procedure SetRole;
    //---------------------------------------------------
    procedure DeleteFromListGurnal(strName: String);
    procedure ShowGurnal(ClassGurnal : TFormGurnal; strName : String);

    function RunReport(TypeObj: Integer; slPar:TStringList; strIDMen : String):Boolean;

    procedure SetDataSets_fmMen(dm:TdmMen);
    function EditDokument( ds : TdataSet; TypeObj : Integer; strFieldID : String; slPar : TStringList; lEnableSkip : Boolean; strKodGurnal : String) : Boolean;
    //---------------------------------------------------
    procedure LoadOpisReportTable;
    procedure LoadOpisTables;
    function GetTable_FindOper : TkbmMemTable;
    procedure SaveTable_FindOper;
    procedure MyHandleException(Sender: TObject; E: Exception);
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;

    property Log_WriteException : Boolean read FLog_WriteException write SetLog_WriteException;
    property Log_WriteOwner : Boolean read FLog_WriteOwner write SetLog_WriteOwner;
    function ShtampOrg( nID : Integer ) : String;
    function SprNameOrg( nID : Integer; strType : String; strPadeg : String; strNameZags:String='') : String;
    function SprNameOrg2( nID : Integer; strType : String; strPadeg : String) : String;
    function NameOrg( strType : String; strPadeg : String) : String;
    function NameRaion( strPadeg : String) : String;
    function OnlyNameRaion( strPadeg : String) : String;
    function NameObl( strPadeg : String) : String;
    function NameSS(sLang:String) : String;

    function GetPadeg( strWords : String; Padeg : String) : String;
//    function GetPadegWord( strWord : String; Padeg : String) : String;
    procedure CheckSubMenu;
    procedure SetUpActionsZAGS;
    procedure SetCurrentDokument( ds : TDataSet);
    function GetCurrentDokument : TDataSet;

    procedure ChangeParamGISUN;
    procedure CheckCaptionActiveGisun;
    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;
    procedure WMCheckUpdate(var Msg:TMessage); message WM_CHECKUPDATE;

    procedure CreateParamsOpisEditSpr;

    procedure BeforeEditSprWriteDecl( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure BeforeDeleteSprWriteDecl( Grid : TSasaDbGrid; var lDel : Boolean);

    procedure BeforeSaveSprWork( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure BeforeDeleteSprWork( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure EditRecordSprOwners( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure OnEditRecord_IzbUch( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure OnBeforeDelete_IzbUch( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure OnGetCellParams_IzbUch(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor;State: TGridDrawState);

    procedure OnExportEditSpr(Sender : TObject);
    procedure OnCheckEnableEditSpr(Opis:TOpisEdit; var nEnabled:Integer);
//    procedure BeforeDeleteSprUL( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure BeforeDeleteSprPunkt( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure EditRecordSprNames( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure BeforeDeleteSprNames( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure SprPunkt_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure SprOch_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure SprSeria_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);

    procedure RodsName_GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure RodsName_GridGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    function ChoiceZAGS(strSearch : String; var nID : Integer ) : Boolean;

    procedure RunAutoBackup;
    procedure RunAutoRestore;
    procedure RunSeekAndRestore(Sender: TObject);

    function RunProcScript(strFuncName: String; var vResult : Variant): Boolean;
    procedure CaptionProg(sUser:String);

    procedure UpdateActions; override;

    function GetAllLookupNamesForFilter : String;
    function GetAllListNamesForFilter : String;

    //------ ZAH ---------------------------------------
    {$IFDEF ADD_ZAH}
    procedure SprZAH_GridGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure SprZAH_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure BeforeDeleteSprZAH(Grid: TSasaDbGrid;  var lDel: Boolean);
    procedure EditRecordSprZAH( Grid:TSasaDbGrid; lAdd:Boolean; Ic:TIcon);
    {$ENDIF}

    //------ FTP ---------------------------------------
    function CheckVigrRIAP:Boolean;
//    function CheckUpdate(lRun:Boolean; lShow:Boolean; nTypeServer:Integer; lCheck:Boolean; var strFileUpdate:String):String;
    procedure CheckVisibleProgress(lVisible:Boolean; strCaption:String; lCancel:Boolean=true);
    procedure CheckVisibleGIF(lVisible:Boolean; strCaption:String; btVisible:Boolean=true);
    procedure SetCaptionPanel0(strCaption:String);

    function PutFileFTP(lShow:Boolean; strFileName:String; strDir:String=''):Boolean;
    procedure BaseToFTP;
    procedure FileToFTP(nTypeServer:Integer; strFileName:String; lArx:Boolean);

//    реализованы в uProject.pas
//    function GetFileFTP(lShow:Boolean; lCheck:Boolean; strFileName:String; strOutputDir:String; lDeleteFile:Boolean=false):Boolean;
//    function SetPropertyFPT(nTypeServerFTP:Integer; strTypeFile:String):Boolean;
//    function  ChoiceFileFTP:String;  // FTP
   //---------------------------------------------------
    procedure BaseToArxiv;
                        
    procedure ShowSeekMenGurnal(strName : String);

    //--------------- СМДО --------------------
    procedure SMDOCheckVisible;
    procedure SMDOCheckEnabled(lSet:Boolean);
    procedure WM_CheckSendMail(var rec:TMsg); message WM_SEND_MAIL;
    function SMDOReceive(lStart:Boolean; lVisible:Boolean; lCheck:Boolean; nPost:Integer):Integer;
    function SMDOCheckNSI(nTypeSpr:Integer; lRun:Boolean; lShow:Boolean; lCheck:Boolean):String;

    function AppHelp(Command: Word; Data: Longint; var CallHelp: Boolean): Boolean;

  end;

//  procedure DeleteFromListGurnal( strName : String);

var
  fmMain: TfmMain;
  ListGurnal : TStringList;

const
  IL_BRAK=51;   // индекс в ImageList для брака
  IL_ROGD=83;   // индекс в ImageList для рождений
  IL_CH_MEN=2;  //

  IL_EDIT=118;      //87;
  IL_SIGN=87;
  IL_ORG=89;        //места работы

  IL_ADD_CHILD=119; //87;
  IL_ADD_MEN=119;   //87;
  IL_ADD=119;   //87;

  IL_DEL_CHILD=120; //88;
  IL_DEL_MEN=120;   //88;
  IL_DEL=120; //88;

  IL_DATE=56;
  IL_REG_DOC=56;
  IL_OTKAZ=20;
  IL_INFO_CORR=161;

implementation

uses fPropertyObj, fAbout, fOperFind, fEditSpr, fChoiceZAGS,
     fChVigrZags, fChZagrZags, TasksEx, AsyncCalls,
     fPassport, fVidGit, fGurnPassport, fCreateFiks, fDeleteFiks, synacode,
     fGurnalAdres, fGurnZBrak, fGurnVUS, fGurnOchered, fGurnDBrak, fGurnDeclRegistr,
     NewDialogs, uFilter, fmDosFileView, uProjectAll, fMyNotify,
     fZapisBrak, fZapisRogd, fGurnZRogd, fZapisSmert, fGurnZSmert, fChVigrOch,
     {fZapisBrakV, fZapisRogdV, fZapisSmertV,}
     fZapisUstOtc, fGurnZUstOtc, fLoadFromBTI,{ fLoadIN_Mens,} fEditSprWork, fEditSprOff,
     fGurnUZRogd, fGurnUZSmert, fGurnUZUstOtc, fDeclRegRogd, fDeclRegUstOtc,
     {$IFDEF ADD_ZAH}
       fChVigrZAH, fChZagrZAH, fAktZ, fGurnAktZ, fEditRecSprZAH,
     {$ENDIF}
     {$IFDEF ADD_OPEKA}
       fZapisOpeka, fGurnZOpeka,
     {$ENDIF}
     fDeclRegistr, fParamsFTP, uSynapseObj,
     fTalonPrib, fGurnTalonPrib, mAdsObj, mDoc2Sel, mDRecData, uFuncRegDoc,
     fTalonUbit, fGurnTalonUbit, fDeclBrak, fActions, ifpii_dbfunc, uCreateXML, u2zags,
     fGurnPassportViza, fGurnOwners, fEditPerevod, fSimpleSeek,
     fSetPassword, fCopyData, fOpisTables, SelLibFr, uProject, fExpDs, mExport, fSeekBase,
     fAdres, dAdres, uObjectsScript, fIzbUch, fPropHouse, fAddSobstv, fWarning, fAccountSvid, uFindBase, fmChList,
     fPrintSSS, fShablon, fChoiceNasel, fTableGurnal, fRegGISUN, fListSvid, {fAlfavitZAGS,} fLoadLic, DsiWin32, mVerInfo,
     {$IFDEF SMDO} fSMDOZagrSpr, {$ENDIF}      // СМДО
     fQueryGisun, fEditMemo, fSetPropUsers, fChoiceAdres, uOcheredToXML;

{$R *.DFM}

procedure TfmMain.acSetParametersExecute(Sender: TObject);
begin
  if Role.CheckSubSystem(SS_PAR)=ptFull then begin
    GlobalTask.OnlyLocalParams:=false;
    GlobalTask.SetEditEventParameter('KOD', EditSOATO_SS, SOATO_GetText, nil);
    GlobalTask.SetEditEventParameter('VXOD_NOMER', Event_EditFormNomer, nil, nil);
    GlobalTask.SetEditEventParameter('ISXOD_NOMER', Event_EditFormNomer, nil, nil);
    GlobalTask.EditParameters;
  end else if Role.CheckSubSystem(SS_LOCALPAR)=ptFull then begin // доступна корректировака локальных параметров
    GlobalTask.OnlyLocalParams:=true;
    GlobalTask.SetEditEventParameter('KOD', EditSOATO_SS, SOATO_GetText, nil);
    GlobalTask.EditParameters;
  end else begin
    GlobalTask.ViewParameters;
  end;
end;

function TfmMain.IsGorSovet: Boolean;
begin
  if (Copy(GlobalTask.ParamAsString('KOD'),5,3) > '500') and (Copy(GlobalTask.ParamAsString('KOD'),5,3) < '600') then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

//---------- перед сохранением после корректировки параметров -----------------------
procedure TfmMain.BeforeSaveParamsEvent(Meta: TMetaTask; var lOk : Boolean);
var
  strID, strSOATO : String;
begin
  lOk := false;
  if oUpdate<>nil then begin
    if oUpdate.FRun=0 then
      FreeAndNil(oUpdate);
  end;
  if dmBase.SprSoato.Locate('KOD', Meta.ParamAsString('KOD'), []) then begin
    if not dmBase.SprNames.Locate('ID', dmBase.SprSoato.FieldByName('ID').AsInteger,[]) then begin
      dmBase.SprNames.Append;
    end else begin
      dmBase.SprNames.Edit;
    end;
    strID := dmBase.SprSoato.FieldByName('ID').AsString;
    strSOATO := Meta.ParamAsString('KOD');
    Meta.WriteParamAsString('ID', strID);
    lOk := true;
  end;
  if lOk then begin
    MemoWrite(NameFromExe('current_organ'),strSOATO);
    with  dmBase.SprNames do begin
      FieldByName('SOATO').AsString   := strSOATO;
      FieldByName('ID').AsString      := strID;
      FieldByName('SHTAMP').AsString  := Meta.ParamAsString('SHTAMP_ZAGS');
      FieldByName('NAME').AsString    := Meta.ParamAsString('NAME');
      FieldByName('NAME_B').AsString  := Meta.ParamAsString('NAME_B');
      FieldByName('KNAME').AsString   := Meta.ParamAsString('KNAME');
      FieldByName('KNAME_B').AsString := Meta.ParamAsString('KNAME_B');
    end;
    dmBase.SprNames.Post;
  end else begin
    PutError('Не найден код СОАТО '+'"'+Meta.ParamAsString('KOD')+'"');
  end;
end;

//------ дополнительная обработка перед сохранением параметров или при старте программы -------------------------------
procedure TfmMain.UpdateParamsEvent(Meta: TMetaTask; const strName: String);
var
  strTerr,s1,s2,strT4 : String;
  l:Boolean;
begin
  strTerr:=Meta.ParamAsString('KOD');
  dmBase.LookUpSoatoSovet.Filtered := false;
  // все деревни района
  if Copy(strTerr,5,1)='7' then begin // поселковый совет
    dmBase.LookUpSoatoSovet.Filter := 'Substr(KOD,1,4)='+''''+
      Copy(strTerr,1,4)+''''+' and Substr(KOD,8,3)<>'+
      ''''+'000'+''''+' or substr(kod,1,5)='+QStr(Copy(strTerr,1,4)+'5'); //+Copy(strTerr,6,5));
  end else if Copy(strTerr,2,1)='4' then begin // город обласного подчинения
    dmBase.LookUpSoatoSovet.Filter := 'KOD='+''''+strTerr+'''';
  end else if Copy(strTerr,5,1)='5' then begin // город районного подчинения
//      dmBase.LookUpSoatoSovet.Filter := 'Substr(KOD,1,7)='+''''+Copy(strTerr,1,7)+'''';
    dmBase.LookUpSoatoSovet.Filter := 'Substr(KOD,1,7)='+''''+Copy(strTerr,1,7)+''''+' or '+
    '(Substr(KOD,1,4)='+''''+Copy(strTerr,1,4)+''''+' and Substr(KOD,5,1)='+QStr('7')+')';
  end else begin
    dmBase.LookUpSoatoSovet.Filter := 'Substr(KOD,1,4)='+''''+Copy(strTerr,1,4)+''''+
    ' and (Substr(KOD,8,3)<>'+QStr('000')+' or (Substr(KOD,8,3)='+QStr('000')+
      ' and Substr(KOD,5,1)='+QStr('5')+' and Substr(KOD,6,2)<>'+QStr('00')+' and Substr(KOD,6,2)<>'+QStr('50')+'))';
  end;
  dmBase.LookUpSoatoSovet.Filtered := true;
//  ShowMessage(dmBase.LookUpSoatoSovet.Filter);
  {$IFDEF OBR_GRAG}
  DocRecord.UpdateParam;
  {$ENDIF}

//  if Meta.ParamAsInteger('VER_UCHET')=2 then begin
    Meta.WriteParamAsString('CALC_UROG', '0');
    Meta.WriteParamAsString('CALC_ZAGOT', '0');
    Meta.WriteParamAsString('KOEF_PLOD', '0');
//  end;
end;

//-------------------- после сохранения параметров --------------------------
procedure TfmMain.AfterSaveParamsEvent(Meta: TMetaTask; const strName: String);
begin
  {$IFDEF GISUN}
     if IsActiveGISUN and (Gisun.ConstMessageSource='') then begin
       Gisun.MessageSource:=SystemProg.MessageSourceGISUN(Meta);
       Gisun.RegInt.MessageSource:=SystemProg.MessageSourceGISUN(Meta);
     end;
  {$ENDIF}
  dmBase.FAteSS:=GetATESS(Meta.ParamAsInteger('ID'));
  GlobalFlat := Meta.ParamAsBoolean('FLAT');
  GlobalFontSizeE := Meta.ParamAsInteger('FONT_SIZE');
//  GlobalStepY:= 35;   !!!   сделать зависимым от размера GlobalFontSizeE
  TemplateInterface.OutputDir:=GetFolderMyDocument+'\';
//  Showmessage(TemplateInterface.OutputDir);
  if SMDOEnabled then begin
    SMDO.FPostEnabled:=Meta.ParamAsBoolean('ENABLED_POST');
  end;
  //------ найдем в справочнике должностных лиц руководителя и изменим
  //------ значения должности и фамилии для актуального варианта
  with dmBase.SprDocOfficial do begin
    try
      if Locate('IS_CHIEF;IS_ACTUAL', VarArrayOf([true,true]),[]) then begin
        Edit;
      end else begin
        Append;
        FieldByName('N_ORDER').AsInteger:=1;
        FieldByName('IS_CHIEF').AsBoolean:=true;
        FieldByName('IS_ACTUAL').AsBoolean:=true;
      end;
      FieldByName('FIO').AsString:=Meta.ParamAsString('ПРЕДСЕДАТЕЛЬ');
      FieldByName('POST').AsString:=Meta.ParamAsString('DOLG_RUKOV');
      FieldByName('NAME').AsString:=FieldByName('FIO').AsString+' - '+FieldByName('POST').AsString;
      Post;
    except
      PutError(' Ошибка обновления справочника должностных лиц');
    end;
  end;
end;

//--------------------------------------------------------------------
procedure TfmMain.acAdminParametersExecute(Sender: TObject);
begin
  GlobalTask.AdminParameters;
end;

function TfmMain.OnBeforeTemplateAdd(Template: TTemplate): Boolean;
begin
  Result:=true;
end;

procedure TfmMain.OnTemplateMenuClick(Sender: TObject);
var
  {$IFDEF USE_TEMPLATE}
   Template: TTemplate;
  {$ENDIF}
   sFunc:String;
   v:Variant;
begin
{$IFDEF USE_TEMPLATE}
  Template:=nil;
  if (Sender<>nil) then begin
    if (Sender is TComponent) then begin
      Template:=TTemplate(TComponent(Sender).Tag);
    end else begin
      Template:=TTemplate(Sender);
    end;
  end;

  if Template<>nil then begin
    sFunc:=Template.ScriptName+'_UserForm';
    v:=true;
    RunProcScript(sFunc,v);
    if (v=true) then begin
      TemplateInterface.SetParams(DateFiks,0,0);
      TemplateInterface.SetSimpleTemplate(Template.FullName);
    end;
//         fmMain.TemplateInterface.SetTemplate(fmMain.TemplateInterface.TemplateDir+Template.TemplateFile,
//         fmMain.TemplateInterface.DefaultDatabaseName, fmMain.TemplateInterface.DefaultScript, Template)
  end;
{$ENDIF}
end;

//-------------------------------------------------------------
procedure TfmMain.BuildToolbarMenu;
begin
  FEventsWordReports  := TUserEvents.Create;
  FEventsBlankReports := TUserEvents.Create;
  FEventsBlankZAGSReports := TUserEvents.Create;
  FEventsAddVigr := TUserEvents.Create;
  {$IFDEF ZAGS}
    SetUpActionsZAGS;
    FEventsWordReports.LoadEvents('MAIN_WORD_ZAGS', TBSubmenuWord);
    TBSubmenuBlankZAGS.Visible := false;
    FEventsBlankReports.LoadEvents('MAIN_BLANK_ZAGS', TBSubmenuBlank);
  {$ELSE}
    FEventsWordReports.LoadEvents('MAIN_WORD_SS', TBSubmenuWord);
    TemplateInterface.BuildMenu('MAIN_WORD_SS', TBSubmenuWord, false, OnTemplateMenuClick);
    FEventsBlankReports.LoadEvents('MAIN_BLANK_SS', TBSubmenuBlank);
    FEventsBlankZAGSReports.LoadEvents('MAIN_BLANKZAGS_SS', TBSubmenuBlankZags);
  {$ENDIF}
  {$IFDEF GKH}
    TBSubmenuBlankZAGS.Visible := false;
  {$ENDIF}
  FEventsAddVigr.LoadEvents('SS_ADD_VIGR', TBSubmenuAddVigr);
  TBSubmenuExcel.Visible:=BuildExcelMenu(TBSubmenuExcel,'Main',true);

  //  if not SystemProg.EnableOchered then begin
//    TBItemOchered.Visible:=false;
//  end;
  TBSeparatorItemObr1.Visible:=true;
  {$IFDEF ZAGS}
    TBSubmenuSprObr.Visible := false;
    TBItemObr.Visible := false;
    TBSeparatorItemObr2.Visible:=false;
  {$ELSE}
    {$IFDEF OBR_GRAG}
      TBSubmenuSprObr.Visible := true;
      TBItemObr.Visible := true;
      //TBItemPriemGr.Visible:=true;
    {$ELSE}
      TBSubmenuSprObr.Visible := false;
      TBItemObr.Visible := false;
      //TBItemPriemGr.Visible:=false;
      TBSeparatorItemObr2.Visible:=false;
    {$ENDIF}
  {$ENDIF}
  {$IFDEF LAIS}
//    TBItemNew.Visible:=false;
    TBSeparatorItem14.Visible:=false;
    TBItemRegisterProg.Visible:=false;
  {$ENDIF}
  {$IFDEF ADD_ZAH}
    acReAktZ.Visible:=true;
    acAktZ.Visible:=true;
    acSprZAH.Visible:=true;
  {$ELSE}
    acReAktZ.Visible:=false;
    acAktZ.Visible:=false;
    acSprZAH.Visible:=false;
  {$ENDIF}
  {$IFDEF ADD_OPEKA}
    acReZOpeka.Visible:=true;
  {$ELSE}
    acReZOpeka.Visible:=false;
  {$ENDIF}
end;

{     решения клавиши Alt для конкретной формы
procedure TfmMain.CreateParams(var Params: TCreateParams);
begin
inherited;
// This only works on Windows XP and above
if CheckWin32Version(5, 1) then
  Params.ExStyle := Params.ExStyle or WS_EX_COMPOSITED;
end;
}

procedure TfmMain.FormCreate(Sender: TObject);
var
  l:Boolean;
begin
  VistaAltFix:=TVistaAltFix.Create(Self);
  Application.OnHelp := AppHelp;
  {$IFDEF USE_FR3}
//    frxReport:=TfrxReport.Create(self);
    frxReport.PreviewForm.Caption:='Предварительный просмотр';
//    frxReport.OldStyleProgress:=true;
    frxReport.ShowProgress:=true;

    frxADSComponents:=TfrxADSComponents.create(self);
    frxChartObject:=TfrxChartObject.Create(self);
    frxDialogControls:=TfrxDialogControls.Create(self);
    frxRichObject:=TfrxRichObject.Create(self);
//    frxPDFExport:=TfrxPDFExport.Create(self);
    frxXMLExport:=TfrxXMLExport.Create(self);
    frxJPEGExport:=TfrxJPEGExport.Create(self);
    frxMailExport:=TfrxMailExport.Create(self);
    frxHTMLExport:=TfrxHTMLExport.Create(self);
    frxRTFExport:= TfrxRTFExport.Create(self);
  {$ENDIF}
  FCountIdle:=0;
  FYearFiks:=0;
  FOpenLic:=false;
  FRunActivate := false;
  fmLichSchet := nil;
  fmMen := nil;
  dmLichSchet := nil;
  dmMen := nil;
  LoadFromIni;
  TBToolWindowS.DockPos:=2000;
  CreateNotifyProg('');

  //------ ведомственный архив --
  TBSeparatorVedArx.Visible:=VEDOM_ARXIV;       // uTypes.pas
  TBItemNomekToVedomArx.Visible:=VEDOM_ARXIV;
  TBItemDeloToVedomArx.Visible:=VEDOM_ARXIV;
  //-----------------------------
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
 try
   FreeAndNil(VistaAltFix);
 except
 end;
 SaveToIni;
 {$IFDEF USE_FR3}
 FreeAndNil(frxReport);
 FreeAndNil(frxADSComponents);
 FreeAndNil(frxChartObject);
 FreeAndNil(frxRichObject);
 FreeAndNil(frxDialogControls);
// FreeAndNil(frxPDFExport);
 FreeAndNil(frxXMLExport);
 FreeAndNil(frxJPEGExport);
 FreeAndNil(frxMailExport);
 FreeAndNil(frxHTMLExport);
 FreeAndNil(frxRTFExport);
 {$ENDIF}
 FreeNotifyProg;
// if GlobalTask.ParamAsBoolean('VIGR_ACTIONS') then begin
//   ActionList2RTF(ActionList,GlobalTask.PathService+'act_list.rtf');
//   ImageList2RTF(ImageList,GlobalTask.PathService+'img_list.rtf');
// end;
 ClearDir(ExtractFilePath(Application.ExeName)+'$TEMP$',true);
 try
   if (GlobalTask<>nil) and (GlobalTask.LogFile<>nil)
     then GlobalTask.LogFile.WriteToLogFile('Завершен сеанс пользователя.');
 except         
 end;
 FEventsWordReports.Free;
 FEventsBlankReports.Free;       
 FEventsBlankZAGSReports.Free;
                
 fmMain := nil;


 // dmLichSchet.Free;
 // fmLichSchet.Free;
 // fmMen.Free;
 // dmMen.Free;
end;

function TfmMain.GetPadeg( strWords : String; Padeg : String) : String;
var
  arr : TArrStrings;
  i : Integer;
begin
  Result:='';
  FuncPr.StrToArr(Trim(strWords), arr, ' ', true);
  for i:=Low(arr) to High(arr) do begin
    Result := Result + GetPadegWord( arr[i], Padeg) + ' ';
  end;
  Result:=Trim(Result);
end;


function TfmMain.NameOrg( strType : String; strPadeg : String) : String;
var
  s : String;
  arr : TArrStrings;
  i : Integer;
  strName : String;
begin
  Result:='';
  strType:=Trim(ANSIUpperCase(strType));
  strName := 'NAME';
  if Copy(strType,1,2)='SS' then begin   // название с/с из справочника СОАТО (ATE)
    if (Pos('B', strType) > 0) or (Pos('Б', strType) > 0)
      then strName:=strName+'_B';
    if dmBase.SprSoato.Locate('ID', GlobalTask.ParamAsInteger('ID'), []) then begin
      s:=dmBase.SprSoato.FieldByName(strName).AsString;
      i:=Pos(' ',s);
      if i>0 then s:=Copy(s,1,i-1);
    end else begin
      if dmBase.AteSys.Locate('ATE_ID', GlobalTask.ParamAsInteger('ID'), []) then begin
        if dmBase.AteSys.FieldByName('CATEGORY').AsString='103' then begin
          s:=dmBase.AteSys.FieldByName(strName).AsString;
        end
      end;
    end;
  end else begin
    if strType <> '' then begin
      if (Pos('K', strType) > 0) or
         (Pos('К', strType) > 0) then begin
        strName := 'K'+strName;
      end;
      if (Pos('B', strType) > 0) or
         (Pos('Б', strType) > 0) then begin
        strName := strName+'_B';
      end;
    end;
    s:=Globaltask.ParamAsString(strName);
  end;
  if strPadeg <> '' then begin
    FuncPr.StrToArr(s,arr,' ',true);
    Result := '';
    for i:=Low(arr) to High(arr) do begin
      Result := Result + GetPadegWord(arr[i],strPadeg)+' ';
    end;
    Result := Trim(Result);
  end else begin
    Result := s;
  end;
end;

function  TfmMain.SprNameOrg2( nID : Integer; strType : String; strPadeg : String) : String;
begin
  if GlobalTask.ParamAsBoolean('NAME_ORGAN_ZAGS') then begin
    if (FormCurrentDok<>nil) and (FormCurrentDok.DokumentNAME_ZAGS.Asstring<>'') then begin
      if (Pos('B', strType) > 0) or (Pos('Б', strType) > 0) then begin
        Result := FormCurrentDok.DokumentNAME_ZAGS_B.Asstring;
      end else begin
        Result := FormCurrentDok.DokumentNAME_ZAGS.Asstring;
      end;
      if strPadeg<>'' then begin
        Result := GetPadeg(Result,strPadeg);
      end;
      exit;
    end;
  end;
  Result := SprNameOrg( nID, strType, strPadeg);
end;

function  TfmMain.SprNameOrg( nID : Integer; strType : String; strPadeg : String; strNameZags:String) : String;
var
  s : String;
  strName : String;
begin
  strType := Trim(ANSIUpperCase(strType));
  strName := 'NAME';
  if strType <> '' then begin
    if (Pos('K', strType) > 0) or
       (Pos('К', strType) > 0) then begin
      strName := 'K'+strName;
    end;
    if (Pos('B', strType) > 0) or
       (Pos('Б', strType) > 0) then begin
      strName := strName+'_B';
    end;
  end;
  s := '';
  if strNameZags='' then begin
    if dmBase.SprNames.Locate('ID', nID, []) then begin
      s := Trim(dmBase.SprNames.FieldByName(strName).AsString);
    end else begin
      if dmBase.SprZAGS.Locate('ID', nID, []) then begin
        s := dmBase.SprZAGS.FieldByName('NAME').AsString;
      end else begin
        if dmBase.SprSoato.Locate('ID', nID, []) then begin
          s := dmBase.SprSoato.FieldByName('NAME').AsString;
        end;
      end;
    end;
  end else begin
    s:=strNameZags;
  end;
  if strPadeg <> '' then begin
    Result := GetPadeg(s,strPadeg);
  end else begin
    Result := s;
  end;
end;

//------------------------------------------------------------------------------------------
// Штамп для документов ЗАГС
//------------------------------------------------------------------------------------------
function  TfmMain.ShtampOrg( nID : Integer ) : String;
begin
  {$IFDEF ZAGS}
    if GlobalTask.ParamAsBoolean('NAME_ORGAN_ZAGS') then begin
      if (FormCurrentDok<>nil) and (FormCurrentDok.DokumentNAME_ZAGS.AsString<>'') then begin
        Result := FormCurrentDok.DokumentNAME_ZAGS.Asstring;
        exit;
      end;
    end;
    if (nID>0) and dmBase.SprNames.Locate('ID', nID, []) then begin
      Result := dmBase.SprNames.FieldByName('SHTAMP').AsString;
    end else begin
      Result := GlobalTask.ParamAsString('SHTAMP_ZAGS');
    end;
    if Trim(Result)='' then begin
      Result:=SprNameOrg2( nID, '', '');
    end;
  {$ELSE}
    Result := GlobalTask.ParamAsString('SHTAMP_ZAGS');
    if Trim(Result)='' then begin
      Result:=SprNameOrg2( nID, '', '');
    end;
  {$ENDIF}
end;

//------------------------------------------------------------------------------------------
function  TfmMain.NameRaion( strPadeg : String) : String;
begin
  Result:=Trim(Globaltask.ParamAsString('RAION'));
  if Result<>'' then begin
    if Pos('.',Globaltask.ParamAsString('RAION'))=0 then begin
      Result := GetPadegWord( Globaltask.ParamAsString('RAION'), strPadeg) + ' ' +
           GetPadegWord( 'район', strPadeg );
    end else begin
      Result := GetPadegWord( Globaltask.ParamAsString('RAION'), strPadeg); // в качестве района город обласного подчинения
    end;
  end;
end;
//------------------------------------------------------------------------------------------
function  TfmMain.OnlyNameRaion( strPadeg : String) : String;
begin
  Result:=Trim(Globaltask.ParamAsString('RAION'));
  if Result<>'' then begin
    Result := GetPadegWord( Globaltask.ParamAsString('RAION'), strPadeg);
  end;
end;
//------------------------------------------------------------------------------------------
function  TfmMain.NameSS(sLang:String) : String;
var
  n:Integer;
begin
  Result:='';
  n:=Globaltask.ParamAsInteger('ID');
  if n>0 then begin
    if dmBase.SprSoato.Locate('ID', n, []) then begin
      n:=dmBase.SprSoato.FieldByName('ATE_ID').AsInteger;
      if n>0
        then Result:=dmBase.NameFromATE(n, sLang);
    end;    
  end;
end;
//------------------------------------------------------------------------------------------
function  TfmMain.NameObl( strPadeg : String) : String;
begin
  Result:=Trim(Globaltask.ParamAsString('OBL'));
  if Result<>'' then begin
    Result := GetPadegWord( Globaltask.ParamAsString('OBL'), strPadeg) + ' ' +
         GetPadegWord( 'область', strPadeg );
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmMain.EditSOATO_RR(Sender: TObject; var Handled: Boolean);
var
  Edit : TDbEditEh;
  f : TfmChRR;
  ds : TDataSet;
  s : String;
  i : Integer;
begin
  Handled := true;
  if Sender is TDbEditEh then begin
    Edit := TDbEditEh(Sender);
  end else begin
    Edit := TDbEditEh(TComponent(Sender).Owner);
  end;
  f := TfmChRR.Create(nil);
  {$IFDEF OCHERED}
  f.Caption:='Орган';
  {$ENDIF}
  f.IDZAGS := Edit.Field.AsString;
  if f.ShowModal=mrOk then begin
    Edit.Field.AsString := f.IDZAGS;
    ds := Edit.Field.DataSet;
    EditDataSet(ds);
    if ds.FindField('fld530') <> nil  then begin
      ds.FieldByName('fld530').AsString := f.NameZAGS;    // название ЗАГС
      ds.FieldByName('fld540').AsString := f.NameBelZAGS; // название ЗАГС по-белорусски
    end;
    if ds.FindField('fld215') <> nil  then begin
      s := Copy(f.ValueSOATO,1,1)+'000000000';
      if dmBase.SprSoato.Locate('KOD', s, []) then begin
        s := dmBase.SprSoato.FieldByName('NAME').AsString;
        i := Pos(' ', s);
        if i > 0 then s := Copy(s,1,i-1);
        ds.FindField('fld215').AsString := s;
      end;
      s := Copy(f.ValueSOATO,1,4)+'000000';
      if dmBase.SprSoato.Locate('KOD', s, []) then begin
        s := dmBase.SprSoato.FieldByName('NAME').AsString;
        i := Pos(' ', s);
        if i > 0 then s := Copy(s,1,i-1);
        ds.FindField('fld220').AsString := s;
      end;
    end;
  end;
  f.Free;
end;

procedure TfmMain.EditSOATO_GES(Sender: TObject; var Handled: Boolean);
begin
//
end;

procedure TfmMain.Event_EditFormNomer(Sender: TObject; var Handled: Boolean);
var
  Edit : TDbEditEh;
  s:String;
  slPar:TStringList;
begin
  Handled := true;
  if Sender is TDbEditEh
   then Edit:=TDbEditEh(Sender)
   else Edit:=TDbEditEh(TComponent(Sender).Owner);
   s:='Формула расчета индекса, можно использовать'#13#10+
     'любые текстовые символы, а так же следующие выражения:'#13#10+
     '  %инд     - индекс группы документов'#13#10+
     '  %год     - текущий год'#13#10+
     '  %кон     - константа из параметров'#13#10+
     '  %номер - № п/п'#13#10+
     '  %дело    - индекс дела';
  slPar:=TStringList.Create;
  slPar.Add('TYPE=3');
  slPar.Add('VALUE='+Edit.Field.AsString);
  if OkWarningPar(s, slPar) then begin
    EditDataSet(Edit.Field.DataSet);
    Edit.Field.AsString:=s;
  end;
end;

procedure TfmMain.EditSOATO_SS(Sender: TObject; var Handled: Boolean);
var
  Edit : TDbEditEh;
  f : TfmChSS;
  ds : TDataSet;
  s,sT : String;
  i : Integer;
begin
  Handled := true;
  if Sender is TDbEditEh then begin
    Edit := TDbEditEh(Sender);
  end else begin
    Edit := TDbEditEh(TComponent(Sender).Owner);
  end;
  f := TfmChSS.Create(nil);
  f.ValueSOATO := Edit.Field.AsString;
  if f.ShowModal=mrOk then begin
    Edit.Field.AsString := f.ValueSOATO;
    ds := Edit.Field.DataSet;
    EditDataSet(ds);
    if ds.FindField('fld215') <> nil  then begin
      s := Copy(f.ValueSOATO,1,1)+'000000000';
      if dmBase.SprSoato.Locate('KOD', s, []) then begin
        s := dmBase.SprSoato.FieldByName('NAME').AsString;
        i := Pos(' ', s);
        if i > 0 then s := Copy(s,1,i-1);
        ds.FindField('fld215').AsString := s;
      end;
      s := Copy(f.ValueSOATO,1,4)+'000000';
      if dmBase.SprSoato.Locate('KOD', s, []) then begin
        s := dmBase.SprSoato.FieldByName('NAME').AsString;
        sT:= dmBase.SprSoato.FieldByName('TYPEPUNKT').AsString;
        if sT<>'' then begin
          dmBase.TypePunkt.Locate('ID', sT, []);
          sT:= dmBase.TypePunkt.FieldByName('NAME').AsString;
          s:=sT+s;
        end;
        i := Pos(' ', s);
        if i > 0 then s := Copy(s,1,i-1);
        ds.FindField('fld220').AsString := s;
      end;
      s := f.ValueSOATO;
      if dmBase.SprSoato.Locate('KOD', s, []) then begin
        s:=dmBase.SprSoato.FieldByName('NAME').AsString;
        sT:= dmBase.SprSoato.FieldByName('TYPEPUNKT').AsString;
        if sT<>'' then begin
          dmBase.TypePunkt.Locate('ID', sT, []);
          sT:= dmBase.TypePunkt.FieldByName('NAME').AsString;
          s:=sT+s;
        end;
        ds.FindField('fld225').AsString := s;
        {$IFNDEF OCHERED}
        try
          ds.FindField('fld55').AsString := s;
        except
        end;
        {$ENDIF}
      end;
    end;
  end;
  f.Free;
end;

procedure TfmMain.EditSOATO_Organ(Sender: TObject; var Handled: Boolean);
var
  Edit : TDbEditEh;
  f : TfmChSS;
  ds : TDataSet;
  s,sT : String;
  i : Integer;
begin
  Handled := true;
  if Sender is TDbEditEh then begin
    Edit := TDbEditEh(Sender);
  end else begin
    Edit := TDbEditEh(TComponent(Sender).Owner);
  end;
  f := TfmChSS.Create(nil);
  f.ValueSOATO := Edit.Field.AsString;
  if f.ShowModal=mrOk then begin
    Edit.Field.AsString := f.ValueSOATO;
    ds := Edit.Field.DataSet;
    EditDataSet(ds);
    if ds.FindField('fld215') <> nil  then begin
      s := Copy(f.ValueSOATO,1,1)+'000000000';
      if dmBase.SprSoato.Locate('KOD', s, []) then begin
        s := dmBase.SprSoato.FieldByName('NAME').AsString;
        i := Pos(' ', s);
        if i > 0 then s := Copy(s,1,i-1);
        ds.FindField('fld215').AsString := s;
      end;
      s := Copy(f.ValueSOATO,1,4)+'000000';
      if dmBase.SprSoato.Locate('KOD', s, []) then begin
        s := dmBase.SprSoato.FieldByName('NAME').AsString;
        sT:= dmBase.SprSoato.FieldByName('TYPEPUNKT').AsString;
        if sT<>'' then begin
          dmBase.TypePunkt.Locate('ID', sT, []);
          sT:= dmBase.TypePunkt.FieldByName('NAME').AsString;
          s:=sT+s;
        end;
        i := Pos(' ', s);
        if i > 0 then s := Copy(s,1,i-1);
        ds.FindField('fld220').AsString := s;
      end;
      s := f.ValueSOATO;
      if dmBase.SprSoato.Locate('KOD', s, []) then begin
        s:=dmBase.SprSoato.FieldByName('NAME').AsString;
        sT:= dmBase.SprSoato.FieldByName('TYPEPUNKT').AsString;
        if sT<>'' then begin
          dmBase.TypePunkt.Locate('ID', sT, []);
          sT:= dmBase.TypePunkt.FieldByName('NAME').AsString;
          s:=sT+s;
        end;
        ds.FindField('fld225').AsString := s;
        try
          ds.FindField('fld55').AsString := s;
        except
        end;
      end;
    end;
  end;
  f.Free;
end;

procedure TfmMain.SOATO_GetText(Sender: TField; var Text: String;    DisplayText : Boolean);
var
  sNot, strType, strSOATO, strSS, strRN, strOBL, sID : String;
  ds:TDataSet;
begin
      strSOATO := Sender.AsString;
      if Length(strSOATO)<10 then begin
        Text := '';
      end else begin
        if dmBase.SprSoato.Locate('KOD',strSOATO,[]) then begin
          ds:=SeekATE(dmBase.SprSoato.FieldByName('ATE_ID').AsInteger);
          if dmBase.AteSys.Locate('KOD',strSOATO,[])
            then sNot:=''
            else sNot:='(нет в АТЕ)';
          sID := Trim(dmBase.SprSoato.FieldByName('ID').AsString);
          strSS := Trim(dmBase.SprSoato.FieldByName('NAME').AsString)+sNot;
          strType:=dmBase.SprSoato.FieldByName('TYPEPUNKT').AsString;
          if strType<>'' then begin
            dmBase.TypePunkt.Locate('ID',strType,[]);
            strType:=dmBase.TypePunkt.FieldByName('NAME').AsString;
          end;
          if strType<>'' then strSS:=strType+' '+strSS;
          if dmBase.SprSoato.Locate('KOD',Copy(strSOATO,1,4)+'000000',[]) then begin
            strRN := Trim(dmBase.SprSoato.FieldByName('NAME').AsString);
            strType:=dmBase.SprSoato.FieldByName('TYPEPUNKT').AsString;
            if strType<>'' then begin
              dmBase.TypePunkt.Locate('ID',strType,[]);
              strType:=dmBase.TypePunkt.FieldByName('NAME').AsString;
            end;
            if dmBase.SprSoato.Locate('KOD',Copy(strSOATO,1,1)+'000000000',[]) then begin
              strOBL := Trim(dmBase.SprSoato.FieldByName('NAME').AsString);
              if strType=''
                then Text := sID+'   ('+strSS + ', ' + strRN + ' р-н, ' + strOBL+')'
                else Text := sID+'   ('+strSS + ', ' + strType+strRN + ', ' + strOBL+')';
            end else begin
              Text := 'Некоррекное значение'
            end;
          end else begin
            Text := 'Некоррекное значение'
          end;
        end else begin
          Text := 'Некоррекное значение'
        end;
      end;
end;

//------------ алфавитная книга ----------------
procedure TfmMain.acAlfKnigaExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnAlfKn, 'fmGurnAlfKn');
end;

procedure TfmMain.acVUSExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnVUS, 'fmGurnVUS');
end;

//------------ заявления о регистрации -------------------------
procedure TfmMain.acReDeclRegistrExecute(Sender: TObject);
begin  ShowGurnal(TfmGurnDeclRegistr, 'fmGurnDeclRegistr'); end;

//------------ очередь на жилье -------------------------
procedure TfmMain.acReOcheredExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnOchered, 'fmGurnOchered');
end;

//------------- адресная книга -------------
procedure TfmMain.acAdresExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnalAdres, 'fmGurnalAdres');
end;

//------------ справочник территорий ----------------
procedure TfmMain.acSprSOATOExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SOATO', nil); end;

procedure TfmMain.acSprRovdExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_ROVD', nil); end;

procedure TfmMain.acSprVoenkomExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_VOENKOM', nil); end;

procedure TfmMain.acSprRazmerExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRRAZMER', nil); end;

procedure TfmMain.acSprRodsNameExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  Param := TParamsEditSpr.Create;
  Param.OnGetCellParams := RodsName_GridGetCellParams;
  Param.Col1 := 'POL';
  Param.GetCellParams_Col1 := RodsName_GridGetCellParams1;
  Globaltask.EditSpr('EDIT_RODSNAME', Param);
end;

procedure TfmMain.RodsName_GridGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if ANSIUpperCase(TDBGridColumnEh(Sender).Field.DataSet.FieldByName('OLD_NAME').AsString)<>'ГЛАВА'
      then Params.Text:='';
  end;
end;
procedure TfmMain.RodsName_GridGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if ANSIUpperCase(Column.Field.AsString)='ГЛАВА' then begin
    Afont.Style:=Afont.Style+[fsBold];
    Background:=clInfoBk;
  end
end;

//--- справочник улиц ---------------------------------------
procedure TfmMain.acSprULExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
//  Param := TParamsEditSpr.Create;
//  Param.OnBeforeDelete := BeforeDeleteSprUL;
  Param:=nil;
  Globaltask.EditSpr('EDIT_SPRUL', Param);
end;
{
procedure TfmMain.BeforeDeleteSprUL( Grid : TSasaDbGrid; var lDel : Boolean);
var
  nID : Integer;
begin
  nID := Grid.DataSource.DataSet.FieldByName('ID').AsInteger;
  if dmBase.tbAdres.Locate('UL', nID, []) then begin
    ShowMessageCont('Значение присутствует в базе. Удаление запрещено !',Grid);
    lDel := false;
  end;
end;
}
procedure TfmMain.SprPunkt_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  ds:TDataSet;
  old:String;
  l:Boolean;
begin
  ds:=Column.Field.DataSet;
  if (ds.FieldByName('KOD').AsString='') or (ds.FieldByName('SOATO').AsString='') then begin
    AFont.Color := clRed;
    exit;
  end;
  if (ds.FieldByName('KOD').AsString<>'') then begin
    old:=dmBase.SprSoato.IndexFieldNames;
    dmBase.SprSoato.IndexFieldNames:='ID';
    if not dmBase.SprSoato.FindKey([ds.FieldByName('KOD').AsInteger]) then begin
      AFont.Color := clRed;
    end else begin
      if ds.FieldByName('SOATO').AsString<>dmBase.SprSoato.FieldByName('KOD').asString then begin
        AFont.Color := clRed;
      end else begin
        if AnsiCompareStr( ds.FieldByName('NAME').AsString, dmBase.SprSoato.FieldByName('NAME').AsString)<>0 then begin
          AFont.Color := clBlue;
        end;
      end;
    end;
    dmBase.SprSoato.IndexFieldNames:=old;
  end;
  if not ds.FieldByName('DATE_DEATH').IsNull
    then Background:=clInfoBk;
end;

//------------ справочник населенных пунктов ----------------
procedure TfmMain.acSprPunktExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  Param := nil;
  Param := TParamsEditSpr.Create;
  Param.OnGetCellParams := SprPunkt_GridGetCellParams;
  Param.Quest_Delete:='   Удалить населенный пункт из базы ?   ';
  Param.OnBeforeDelete := BeforeDeleteSprPunkt;
  Globaltask.EditSpr('EDIT_PUNKT', Param);
  dmBase.SprPunkt.IndexName:='PR_KEY';
  {$IFDEF OBR_GRAG}
    DocRecord.UpdateSpr('SP_PLACE');
  {$ENDIF}
  dmBase.LookUpPunkt.Close;
  dmBase.LookUpPunkt.AdsCloseSQLStatement;
  dmBase.LookUpPunkt.Open;

  dmBase.WorkQuery.SQL.Text:='SELECT count(*) FROM СпрНасПунктов WHERE typepunkt is null or name is null';
  try
    dmBase.WorkQuery.Open;
    if dmBase.WorkQuery.Fields[0].AsInteger>0 then begin
      PutError(' Не у всех населенных пунктов заполнено наименование или тип');
    end;
  finally
    dmBase.WorkQuery.Close;
  end;
end;

procedure TfmMain.BeforeDeleteSprPunkt( Grid : TSasaDbGrid; var lDel : Boolean);
var
  nID : Integer;
  s:String;
  lOk:Boolean;
begin
  lDel:=false;
  if dmBase.IsMainComputer then begin
    nID:=Grid.DataSource.DataSet.FieldByName('ID').AsInteger;
    if dmBase.tbAdres.Locate('PUNKT', nID, []) then begin
      lOk:=true;
      if Globaltask.ParamAsBoolean('DELETE_PUNKT') then begin
        s := '';
        s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
        s := s + 'В результате удаления населенный пункт вместе с населением'#13;
        s := s + 'и лицевыми счетами будет удален из базы.'#13;
        s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
        s := s + 'введите слово ДА в поле ввода'#13;
        lOk:=OkWarning(s);
        if lOk then begin
          if dmBase.DeletePunkt(nID,dmBase.AdsConnection,true,false) then begin
            lDel := true;
          end;
        end;
      end;
      if not lDel and lOk then begin
        PutError('  Удаление текущего населенного пункта запрещено. ');
      end;
    end else begin
      lDel:=true;
    end;
  end else begin
    PutError('  Удаление разрешено только с главного компьютера. ');
  end;
end;

procedure TfmMain.acEditIsporExecute(Sender: TObject);
begin
{
  dmBase.IsporSvid.IndexName := 'EDIT_KEY';
  dmBase.IsporSvid.SetRange([SVID_ISPOR],[SVID_ISPOR]);
  dmBase.IsporSvid.BeforePost := dmBase.BeforePost_IsporSvid;
  try
    Globaltask.EditSpr('EDIT_ISPORSVID', nil);
  finally
    dmBase.IsporSvid.BeforePost:=nil;
    dmBase.IsporSvid.CancelRange;
  end;
}
end;

procedure TfmMain.acSeriaSvidExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
  Opis : TOpisEdit;
begin
  Param := TParamsEditSpr.Create;
  Param.OnGetCellParams := SprSeria_GridGetCellParams;
  Param.FreeOnExitSpr:=false;
  Globaltask.EditSpr('EDIT_SERIASVID', Param);
  FreeAndNil(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_SERIA_SVID');
  Opis.KeyListFromDataSet:=true;
end;
procedure TfmMain.SprSeria_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not CheckSeriaSvid(Column.Field.DataSet.FieldByName('SERIA').AsString)
    then AFont.Color := clRed;
//    then AFont.Style:=[fsBold];
end;

procedure TfmMain.acSprFamilyExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRFAMILY', nil); end;

procedure TfmMain.acSprIstExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRIST', nil); end;

procedure TfmMain.acSprPredstExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRPREDST', nil); end;

procedure TfmMain.acSprPostOchExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  Param := TParamsEditSpr.Create;
  Param.OnGetCellParams := SprOch_GridGetCellParams;
//  Param.Quest_Delete:='   Удалить населенный пункт из базы ?   ';
//  Param.OnBeforeDelete := BeforeDeleteSprPunkt;
  Globaltask.EditSpr('EDIT_SPRPOSTOCH', Param);
end;

procedure TfmMain.acSprSnOchExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  Param := TParamsEditSpr.Create;
  Param.OnGetCellParams := SprOch_GridGetCellParams;
//  Param.Quest_Delete:='   Удалить населенный пункт из базы ?   ';
//  Param.OnBeforeDelete := BeforeDeleteSprPunkt;
  Globaltask.EditSpr('EDIT_SPRSNOCH', Param);
end;

procedure TfmMain.SprOch_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  ds:TDataSet;
  old:String;
  l:Boolean;
begin
  ds:=Column.Field.DataSet;
  if ds.FieldByName('ISKL').AsBoolean or (not ds.FieldByName('ENDDATE').IsNull and (ds.FieldByName('ENDDATE').AsDateTime<Date)) then begin
    AFont.Color := clRed;
//    AFont.Style:=[fsStrikeOut]
  end;
end;

//---------------------------------------------------------
procedure TfmMain.acSprPerevodExecute(Sender: TObject);
begin
  EditPerevod;
  SetReloadAllMRUName;
end;
//---------------------------------------------------------
procedure TfmMain.acLoadSprOrgSMDOExecute(Sender: TObject);
{
var
  s,sSoob,sFile:String;
  lUpdate:Boolean;
  slPar:TStringList;
  dMax:TDateTime;
  }
begin
  RunLoadSprSMDO(pn);
  {
  if oUpdate=nil
    then oUpdate:=TSynapseObj.Create(pn);
  oUpdate.FMessages:='';
  slPar:=TStringList.Create;
  lUpdate:=false;
  if oUpdate.FDateSprOrgSMDO=0 then  begin // не определяли наличие обновления
    oUpdate.FTypeServer:=0;
    oUpdate.FThread:=false;
    oUpdate.FCheckMessages:=false;
    oUpdate.FCheckSpr:=true;
//    oUpdate.FCheckSpr:=Globaltask.ParamAsBoolean('CHECK_SMDO_SPR');
    oUpdate.CheckUpdate;
  end;
  sSoob:='';
  if oUpdate.FDateSprOrgSMDO>0 then begin
    slPar.Clear;
    dMax:=getMaxCreateDateSpr('smdosprorg'); // default 'smdosprorg'
    dMax:=Max(dMax, GlobalTask.GetLastValueAsDate('LAST_UPDATE_SPRORG',false));
    if oUpdate.FDateSprOrgSMDO>dMax then begin
      lUpdate:=true;
    end;
    if lUpdate then begin
      slPar.Add('FILE='+oUpdate.FFileSprOrg);
      oUpdate.FThread:=true;
//      oUpdate.FThread:=false;
      oUpdate.GetFileFTP(true,slPar);
      sFile:=CheckSleshN(oUpdate.FOutputDir)+oUpdate.FFileSprOrg;
      if sFile<>'' then begin
        RunZagrSprSMDO2(SMDO_SPR_ORG, oUpdate.FDateSprOrgSMDO, sFile);
      end;
    end else begin
      sSoob:=sSoob+'Обновление справочника организаций СМДО не требуется.'#13#10;
    end;
  end else begin
    sSoob:=sSoob+'Обновление справочника организаций СМДО не найдено.'#13#10;
  end;
  if oUpdate.FDateSprVidDokSMDO>0 then begin
    slPar.Clear;
    dMax:=getMaxCreateDateSpr('smdosprviddok'); // default 'smdosprorg'
    dMax:=Max(dMax, GlobalTask.GetLastValueAsDate('LAST_UPDATE_SPRVIDDOK',false));
    if oUpdate.FDateSprVidDokSMDO>dMax then begin
      slPar.Add('FILE='+oUpdate.FFileSprVidDok);
      oUpdate.FThread:=true;
//      oUpdate.FThread:=false;
      oUpdate.GetFileFTP(true,slPar);
      sFile:=CheckSleshN(oUpdate.FOutputDir)+oUpdate.FFileSprVidDok;
      if sFile<>'' then begin
        RunZagrSprSMDO2(SMDO_SPR_VIDDOK, oUpdate.FDateSprVidDokSMDO, sFile);
//      SMDO.RunLoadSysSpr;
      end;
    end else begin
      sSoob:=sSoob+'Обновление справочника видов документов СМДО не требуется.'#13#10;
    end;
  end else begin
    sSoob:=sSoob+'Обновление справочника видов документов СМДО не найдено.'#13#10;
  end;
  slPar.Free;
  if sSoob<>''
    then AddNotifyProg(Self, sSoob, false, true,0,0); }
end;
//---------------------------------------------------------
procedure TfmMain.acCheckUpdateExecute(Sender: TObject);
var
//  strMessages:String;
  lPath:Boolean;
begin
  {$IFDEF UPDATE_SYNA}
    acCheckUpdate.Enabled:=false;
    Application.ProcessMessages;
    try
      RunUpdateSyna(pn);
    finally
      acCheckUpdate.Enabled:=true;
    end;
  {$ELSE}
    CheckUpdate(IdFTP1, true, true, 0, true, s, lPath);
  {$ENDIF}
end;

//---------------------------------------------------------
{
function TfmMain.CheckUpdate(lRun:Boolean; lShow:Boolean; nTypeServer:Integer; lCheck:Boolean; var strFileUpdate:String):String;
var
  n,m,nn,nCurUpdate,FileAttrs,nUpdate,nCur:Integer;
  strFile,s,ss,strDir,strDirUpdate:String;
  VerInfo:TVerInfo;
  sr:TSearchRec;
  lOk:Boolean;
begin
  strFileUpdate:='';
  Result:='';      
  nUpdate:=0;
  if GlobalTask.ParamAsBoolean('CHECK_UPDATE') or lCheck then begin
    try
      VerInfo:=TVerInfo.Create(Application.ExeName);
      nCurUpdate:=StrToInt(VerInfo.Build);
      VerInfo.Free;
    except
      nCurUpdate:=0;
    end;
//    nCurUpdate:=125;   //для проверки

    if nTypeServer=0 then begin
      TypeServerFTP:=GlobalTask.ParamAsInteger('TYPE_UPDATE');   // 1-Брест  2-FTP  10-сетевой путь
    end else begin
      TypeServerFTP:=nTypeServer;   // 1-Брест  2-FTP
    end;
    if TypeServerFTP=0
      then TypeServerFTP:=SERVER_BREST;

    if TypeServerFTP=NET_PATH then begin
      strDir:=Trim(GlobalTask.ParamAsString('PATH_SEEK_UP'));
      if strDir<>'' then begin
        FileAttrs := SysUtils.faReadOnly+SysUtils.faArchive+SysUtils.faAnyFile;	//faDirectory;
        strDir:=CheckSleshN(strDir);
        if FindFirst( strDir+NAME_FILE_UPDATE+'*.exe', FileAttrs, sr) = 0 then begin
          nn:=Length(NAME_FILE_UPDATE)+1;
          ss:=sr.Name;
          while ss<>'' do begin
            m:=LastPos('.',ss);
            if m>0 then begin
              s:=Copy(ss,nn,m-nn);
              try
                nCur:=StrToInt(s);
              except
                nCur:=0;
              end;
              if (nCurUpdate>0) and (nCur>nCurUpdate) and (nCur>nUpdate) then begin
                nUpdate:=nCur;
                Result:=s;
                strFileUpdate:=ss;
              end;
            end;
            if FindNext(sr)=0  then ss:=sr.Name
                               else ss:='';
          end;
          FindClose(sr);
        end;
      end;
    end else begin
      SetPropertyFPT(TypeServerFTP,'update');
      if GetFileFTP(IdFTP1, true, lCheck, '','', false) then begin
//      if GetFileFTP(true, lCheck, '','', false) then begin
        for n:=0 to idFTP1.DirectoryListing.Count-1 do begin
          strFile:=idFTP1.DirectoryListing.Items[n].FileName;
          ss:=NAME_FILE_UPDATE; //'UPDATELAIS';
          nn:=Length(ss)+1;
          if Pos(ss,UpperCase(strFile))>0 then begin
            m:=LastPos('.',strFile);
            if m>0 then begin
              s:=Copy(strFile,nn,m-nn);
              try                                   
                nUpdate:=StrToInt(s);
              except
                nUpdate:=0;
              end;
              if (nCurUpdate>0) and (nUpdate>nCurUpdate) then begin
                Result:=s;
                strFileUpdate:=strFile;
              end;
            end;
          end;
        end;
      end else begin
        nUpdate:=-1;
      end;
    end;
  end;
  if lRun then begin // вфполнить загрузку обновления
    if (Result='')  then begin
      if (nUpdate<>-1) and lCheck then begin
        ShowMessage(' Обновление не найдено. ');
      end;
    end else if (Result<>'') then begin
      strDirUpdate:=CheckSleshN(GetFolderMyDocument)+'Обновления\';    // CreateTmpPath(0);
      ForceDirectories(strDirUpdate);
      ClearDir(strDirUpdate,false);
      if Problem('Найдено обновление "'+Result+'". Загрузить?') then begin
        if TypeServerFTP=NET_PATH then begin
          lOk:=CopyFile(PChar(strDir+strFileUpdate), PChar(strDirUpdate+strFileUpdate), false);
          if not lOk then begin
            PutError('Ошибка копирования файла : '+#13+
                     'откуда :'+strDir+strFileUpdate+#13+
                     'куда   :'+strDirUpdate+strFileUpdate+#13+
                     IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
          end;
        end else begin
          CheckVisibleProgress(true,'Загрузка обновления:');
          lOk:=GetFileFTP(IdFTP1, false, lCheck, strFileUpdate, strDirUpdate, false);
//          lOk:=GetFileFTP(false, lCheck, strFileUpdate, strDirUpdate, false);
          CheckVisibleProgress(false,'');
        end;
        if lOk then begin
          if Problem('Обновление загружено. Установить? ') then begin
            WinExec(PChar(strDirUpdate+strFileUpdate), SW_SHOWNORMAL);
            Application.Terminate;
  //          Close;
          end else begin
            ShellExecute(Application.Handle, PChar('explore'), PChar(strDirUpdate), nil, nil, SW_SHOWNORMAL);
          end;
        end;
      end;
    end;
  end;
end;
}
//---------------------------------------------------------
function TfmMain.CheckVigrRIAP:Boolean;
var
  s,strDir,strFile,strFileCheck:String;
  lRun:Boolean;
  n:Integer;
begin
  strFileCheck:='Vigr_Lais_'+Globaltask.ParamAsString('ID')+'.txt';
  Result:=false;
  TypeServerFTP:=SERVER_BREST;  // для тестирования
//  TypeServerFTP:=SERVER_RIAP;
  SetPropertyFPT(IdFTP1, TypeServerFTP,'data');
  lRun:=false;
  if GetFileFTP(IdFTP1,true, true, '','', false) then begin
//  if GetFileFTP(true, true, '','', false) then begin
    for n:=0 to idFTP1.DirectoryListing.Count-1 do begin
      strFile:=idFTP1.DirectoryListing.Items[n].FileName;
      if UpperCase(strFile)=UpperCase(strFileCheck) then begin
        lRun:=true;
      end;
    end;
  end;
  if lRun then begin // вфполнить загрузку обновления
    strDir:=CreateTmpPath(0);
    CheckVisibleProgress(true,'Загрузка:');
    if GetFileFTP(IdFTP1, false, true, strFileCheck,strDir,true) then begin
//    if GetFileFTP(false, true, strFileCheck,strDir,true) then begin
      MemoRead(strDir+'\'+strFileCheck,s);
      ShowMessage(Utf8ToAnsi(s));
    end;
    CheckVisibleProgress(false,'');
  end else begin
    ShowMessage('Файл результатов загрузки не обнаружен.');
  end;
end;

Function StrToFile(aFile: String; Const Str: AnsiString): boolean;
var
   hFile :THANDLE;
   dwWriten: DWORD;
//   FileStream: TFileStream;
Begin
  Result := False;
  hFile := CreateFile(PChar(aFile), GENERIC_WRITE, 0, Nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (hFile = INVALID_HANDLE_VALUE) then
     Exit;

  if not WriteFile(hFile, Str[1], Length(Str), dwWriten, Nil) Then
     Exit;
  CloseHandle(hFile);
  result := True;
End;
//-----------------------------------------------------
Function FileToStr(aFile: String): AnsiString;
var
    FileRead: TFileStream;
Begin
  FileRead := TFileStream.Create(aFile, fmOpenRead or fmShareDenyNone);
  SetLength(Result, FileRead.Size);
  FileRead.ReadBuffer(Result[1], FileRead.Size);
  FileRead.Free;
End;

//--------------------------------------------------------------
procedure TfmMain.acTestExecute(Sender: TObject);
var
//  fmParam:TfmParamQuest;
  n,m:Integer;
  s,ss,sCert:String;
//  par:TXMLParams;
  sl:TStringList;
  v:Variant;
  lOk:Boolean;
 // arr:TArrSmallAdres;
 guid:TGUID;
 FileRead: TFileStream;
// fs:TFormatSettings;
// sn:TSynapseObj;
// XL,sh:Variant;
// jpg:TJPEGImage;
// bmp:TBitmap;
  l:Boolean;
//  XMLDokument:TNativeXml;
//  node:TXMLNode;
  d:TDateTime;
  res:DWORD;
  p:PChar;
  fl : FLASHWINFO;
  da:TRegdoc2XML;
  fs:TFormatSettings;
  i:Integer;
const
  PPP_CONST='bd3141f9aed34f62a74c8a093a0b2ba9';
begin

  if not Role.SystemAdmin then exit;

  sl:=TStringList.Create;     
  RunQueryGISUN(-1, sl);
  sl.Free;
  exit;
  {
  sl:=TStringList.Create;
  try
    Http_GetText('https://nces.by/wp-content/uploads/certificates/pki/kuc.cer', sl);
    ShowStrings(sl,'');
  finally
    sl.Free;
  end;
  exit;
  }

  {   извлечение даты из произвольного формата
  GetLocaleFormatSettings(1049,fs);
  fs.DateSeparator:='-';
  fs.ShortDateFormat:='dd-mm-yyyy';
  fs.LongDateFormat:='dd-mm-yyyy';
  d:=StrToDate('12-02-2019',fs);
  ShowMessage(DateToSQL(d));
  exit;
  }

  {
  da:=TRegdoc2XML.Create;
  SetLength(da.arrTypeDok,2);
  da.arrTypeDok[0]:=3;
  da.arrTypeDok[1]:=4;
  if da.SetPathExport('D:\_ToArxiv\') then begin;   // !!! брать из параметров
//    OpenMessageEx('export');
//    da.AsAttribute:=false;
//    da.ExportSprFileDocList;
//    CloseMessage;
    da.FDelo:=200;
    da.DeloToArxiv;
  end;
  ShowStrings(da.FProtokol,'');
  da.Free;
   }
//    n:=Avest.RefreshCOC('avest', true, s, true);
//    if s<>'' then ShowMessage(s);
   {
  Application.Icon.Assign(image1.picture.icon);
  InvalidateRect(Application.Handle, nil, True);
  }
//  TBToolWindowE.Visible:=not TBToolWindowE.Visible;
//  imgNewPost.Animate:=TBToolWindowE.Visible;

  {===== разбор ЭЦП Авест из XML для ГИС РН  ==========================
  XMLDokument:=TNativeXml.Create();
  XMLDokument.LoadFromFile('Регистрация.xml');
 // node:=XMLDokument.Root.Nodes[0];
  node:=XMLDokument.Root.FindNode('Sign');
  if node<>nil then begin
    s:=node.ValueAsString;
    node:=XMLDokument.Root.FindNode('Key');
    if node<>nil then begin
      sCert:=DecodeString(node.ValueAsString);
    end;
    node:=XMLDokument.Root.FindNode('SOAP-ENV:Body');
    node:=node.Nodes[0];   // <decease_act> ... </decease_act>
    if node<>nil then begin
      ss:=node.WriteToString;
    end;
    res:=Avest.VerifyTextSimple(ss,DecodeString(s),sCert,false,'');
    if res<>0 then begin
      s:=Avest.ErrorInfo(res);
      PutError(s);
    end else begin
      showmessage('Ok!');
    end;
  end;
  XMLDokument.Free;
  ====================================================}

//  FileToFTP(0, NameFromExe('DocArxiv\EML\test.eml'), true);

//  ShowMessage('['+'[DATE_FIKS='''+']');
//  FindServers;
//   memowrite('pppp', XorEncode(PPP_CONST,'L0df4!B'));

//  showmessage(inttostr(xl.Workbooks.Count));

{
  sl:=TStringList.Create;
  m:=xl.Workbooks.Count;
  sl.Add('Workbooks='+inttostr(m));
  sl.Add('Worksheets='+inttostr(xl.Workbooks[m].Worksheets.Count));
  for n:=1 to xl.Workbooks[m].Worksheets.Count do begin
    sh:=xl.Workbooks[m].Worksheets[n];
    if sh.Visible
      then s:='Visible' else s:='Not Visible';
    sl.Add('Worksheets['+inttostr(n)+'].name='+sh.Name+' '+s);
    sl.Add('cells value='+vartostr(sh.cells.item[5,1].value));
    sl.Add('max rows='+vartostr(sh.UsedRange.Rows.Count));
  end;
  ShowStrings(sl,'');
  xl:=null;
  sl.Free;
  }

  {
  sn:=TSynapseObj.Create(pn);
  sn.FThread:=true;
  sn.FWinOwner:=pn;
  sn.FOutputDir:='E:\XXX';
  sn.FFileName:='UpdateLAIS163.exe';
  sn.FTypeServer:=SERVER_BREST;
  sn.GetFileFTP(true);
//  AddNotifyProg(fmMain, 'Файл '+CheckSleshN(sn.FOutputDir)+sn.FFileName, false, true,0,0);
//  if FileExists(CheckSleshN(sn.FOutputDir)+sn.FFileName)
//    then AddNotifyProg(fmMain, 'Файл загружен', false, true,0,0);
  sn.Free;
  }

  {
  sn.FThread:=true;
  sn.FCheckMessages:=true;
  if sn.CheckUpdate then begin
    ShowMessage(inttostr(sn.FUpdate)+'  '+sn.FFileName+'  '+inttostr(sn.FFileSize));
    sn.FThread:=true;
    sn.GetFileFTP(nil);
  end else begin
    ShowMessage('Обновление не найдено');
  end;
  if sn.FCheckMessages and (sn.FMessages<>'')
    then CheckMessagesProg(sn.FMessages);
//  sn.FThread:=true;
//  sn.GetFileFTP(nil);

  sn.Free;
  }
//  showmessage(IntToStrSep(456789354,','));

// showmessage(Format('INSERT INTO DocFile (DOC_ID,N_ORDER,STORE_KIND,DIR_YEAR,DIR_MONTH,DIR_NAME,NAME,PATH,READ_ONLY) '+
//             ' VALUES (%d,%d,%d,''%s'',''%s'',''%s'',''%s'',''%s'',1)',
//          [11,22,1,'2018','10','yyyymmdd_hhnnss_zzz.zip','www.doc','d:\',1]));

//   Gisun.GetChangeClassif(0, STOD(FIRST_DATE_CLASSIF,tdAds), true, true);

//   ShowMessage(ExpandUNCFileName(dmbase.AdsConnection.ConnectPath));
  //  EditTelnet('10.30.254.55',110);
//  RunWebSprSMDO(true);
//  s:=CalcMD5File( '!!!' );
//  ShowMessage(s+'   '+inttostr(length(s)));
//  ShowMessage(FormatdateTime('yyyy-mm-dd hh:nn:ss',  sdDateTimeFromString('2016-01-01T06:48:16Z', false))+chr(13)+chr(10)+
//              FormatdateTime('yyyy-mm-dd hh:nn:ss',  sdDateTimeFromString('2016-01-01T06:48:16Z', true)));
  {
  s:=EncodeQuotedPrintable('(Тема письма) Tema');
  ShowMessage(s+chr(13)+chr(10)+DecodeQuotedPrintable(s));
  s:=EncodeBase64('(Тема письма) Tema');
  ShowMessage(s+chr(13)+chr(10)+DecodeBase64(s));
  exit;  }
//  CreateGUID(Guid);
//  ShowMessage(GUIDToString(GUID)+chr(13)+getGUID(false)+chr(13)+getGUID(true));

//  ShowMessage(sdDateTimeToString(Now,true)+'     '+sdDateTimeToString(Now,false)+'   '+
//    Formatdatetime('yyyy-mm-dd',Now)+'T'+Formatdatetime('hh:nn:ss',Now)+'Z');
//  exit;

  {
  strtofile('photo.jpg',DecodeString(Filetostr('photo')));
  jpg:=TJPEGImage.Create;
  bmp:=TBitmap.Create;
  jpg.LoadFromFile('photo.jpg');
  bmp.Assign(jpg);
  bmp.SaveToFile('1.bmp');
  Image1.Picture.assign(bmp); //Bitmap.LoadfromFile('1.bmp');// loadFromFile('photo.jpg');
//  Image1.Picture.Bitmap.LoadfromFile('1.bmp');// loadFromFile('photo.jpg');
  bmp.Free;
  jpg.Free;
  }

//  Gisun.GetChangeClassif(-1, 0, true, true);

//  RunProcScript('RunTest',v)
//   ExecOneReport(2{'SprMGS'}, false, '5492', nil);  // ID=52

//  ChoiceLoadedAdres(sWhere, dmBase.AdsConnection, nil);
//  RunOchered2XML;
//  RunXML2Ochered;
//  Gisun.GetFullATE(1000);

 {   slPar:=TStringList.Create;
    s:=ExtractFilePath(Application.ExeName);
    DSiEnumFilesToSL(s+'\DocArxiv\*.zip', faAnyFile+faArchive	, slPar, true, true, 3);
    ShowStrings(slPar,'Files');
    ShowMessage(IntToStr(DSiGetFolderSize(s+'\DocArxiv', true)));}


//  ShowMessage(GetLocaleInformation(LOCALE_SDecimal));


  {
  Podpis_Init(5);
  showMessage('1'+chr(13)+podpis_dolg(1)+' '+podpis_fio(1)+chr(13)+podpis_dolg(2)+' '+podpis_fio(2)+chr(13)+podpis_dolg(3)+' '+podpis_fio(3));
  Podpis_Init('SpxNalLS');
  showMessage('2'+chr(13)+podpis_dolg(1)+' '+podpis_fio(1)+chr(13)+podpis_dolg(2)+' '+podpis_fio(2)+chr(13)+podpis_dolg(3)+' '+podpis_fio(3));
  }

end;
//var
//  v:Variant;
// si:TAdsServerInfo;
//begin

// ShowMessage(GetLocalIP);
// GetInstallInfo;
//  si:=GetAdsServerInfo(dmBase.AdsConnection);
//  showmessage(IntToStr(si.IpPort));

//  frxReport.DesignReport(true);


  {
  if Problem(' Удалить секции в именем "РОКАZ_" ?') then begin
    ini:=GlobalTask.IniFile('222222222');
    sl:=TStringList.Create;
    ini.ReadSections(sl);
    for i:=0 to sl.Count-1 do begin
      if Pos('POKAZ_',sl.Strings[i]) > 0 then begin
        ini.EraseSection(sl.Strings[i]);
      end;
    end;
    ini.UpdateFile;
    sl.Free;
  end;
  }
{
  sl:=TStringList(FindBase('', 'AutoBackup,Backup,AutoBackup2', false));
  if sl.Count=0 then begin
    PutError('Ничего не найдено.');
  end else begin
    i:=ChoiceFromList(sl,'Выберите базу');
  end;
//  ShowStrings(sl,'Базы');
}
//end;

procedure TfmMain.acSQLExecute(Sender: TObject);
begin
  ShowFormQuery( dmBase.GetPropertyAds, dmBase.IniSysParams, false);
end;

procedure TfmMain.acDesignReportExecute(Sender: TObject);
begin
  GlobalTask.DesignAllReports;
end;

procedure TfmMain.acDesignReport3Execute(Sender: TObject);
begin
{$IFDEF USE_FR3}
  GlobalTask.DesignAllReports3;
{$ENDIF}
end;


procedure TfmMain.acPropertyObjExecute(Sender: TObject);
var
  f : TfmPropertyObj;
begin
  f := TfmPropertyObj.Create(nil);
  try
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfmMain.acEditProgExecute(Sender: TObject);
begin
  if GlobalTask.EditScript then begin
    GlobalTask.CreateMainScript;
    if (GlobalTask.Script<>nil) and (Role.Status=rsAdmin) then begin
//      MainUserEvents.LoadEvents('MAIN',TBSubMenuObrab);
//    end else begin
//      TBSubMenuObrab.Visible:=false;
    end;
  end;
end;

procedure TfmMain.acSprTypePunktExecute(Sender: TObject);
//var
//  Param  : TParamsEditSpr;
begin
//  Param := TParamsEditSpr.Create;
//  Param.OnEditRecord := EditRecordSprNames;
//  Param.OnBeforeDelete := BeforeDeleteSprNames;
//  Param.OnGetCellParams := GridGetCellParams;
//  Globaltask.EditSpr('EDIT_SPRTYPEPUNKT', Param);
  Globaltask.EditSpr('EDIT_SPRTYPEPUNKT', nil);
//    Param.Free;  удаляется после уничтожения формы
end;

procedure TfmMain.acSprNamesExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  Param := TParamsEditSpr.Create;
  Param.OnEditRecord := EditRecordSprNames;
  Param.OnBeforeDelete := BeforeDeleteSprNames;
  Param.OnGetCellParams := GridGetCellParams;
  Globaltask.EditSpr('EDIT_SPRNAMES', Param);
//    Param.Free;  удаляется после уничтожения формы
end;

//  TEditRecordGridEvent = procedure( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon) of object;
//  TEditRecordGridEvent2 = procedure( Field : TField; Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon) of object;

procedure TfmMain.EditRecordSprNames( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
var
  f : TfmChoiceZAGS;
  strID : String;
  ds : TDataSet;
  nID : Integer;
begin
  ds := Grid.DataSource.DataSet;
  if (ds.State = dsEdit) or (ds.State = dsInsert) then begin
    ds.Cancel;
  end;
  strID := ds.FieldByName('ID').AsString;
  if not lAdd and (strID = GlobalTask.ParamAsString('ID')) then begin
    ShowMessage('Запись не подлежит корректировке !');
  end else begin
  f := TfmChoiceZAGS.Create(nil);
  try
    if lAdd then begin
      f.cbHandled.Checked := false;
      f.edSOATO.Text   := '';
      f.edNameRus.Text := '';
      f.edNameBel.Text := '';
      f.edShtamp.Text := '';
    end else begin
      if ds.FieldByName('HANDLED').AsBoolean then begin
        f.edSOATO.Text   := '';
        f.edSOATO.Enabled := false;
        f.edNameRus.Text := ds.FieldByName('NAME').AsString;
        f.edNameBel.Text := ds.FieldByName('NAME_B').AsString;
        f.edShtamp.Text  := ds.FieldByName('SHTAMP').AsString;
        f.cbHandled.Checked := ds.FieldByName('HANDLED').AsBoolean;
        f.ActiveControl  := f.edNameRus;
      end else begin
        if dmBase.SprSoato.Locate('ID',strID,[]) then begin
          f.edSOATO.Enabled := true;
          f.edSOATO.Text   := dmBase.SprSoato.FieldByName('KOD').AsString;
          f.cbHandled.Checked := ds.FieldByName('HANDLED').AsBoolean;
          f.edNameRus.Text := ds.FieldByName('NAME').AsString;
          f.edNameBel.Text := ds.FieldByName('NAME_B').AsString;
          f.edShtamp.Text  := ds.FieldByName('SHTAMP').AsString;
          f.ActiveControl  := f.edNameRus;
        end else begin
          PutError(' Не найдена территория с ИД='+strID);
        end;
      end;
    end;
    if (f.ShowModal = mrOk) then begin
      // сформировать новый ID
      if lAdd then begin
        nID := -1;
        if f.cbHandled.Checked then begin
          f.QuerySeek.Open;
          if f.QuerySeek.Eof then begin
            nID := 90000001;
          end else begin
            nID := f.QuerySeek.FieldByName('ID').AsInteger+1;
          end;
          f.QuerySeek.Close;
        end else begin
          if ((f.edSOATO.Text<>'') and dmBase.SprSoato.Locate('KOD',f.edSOATO.Text,[])) then begin
            nID := dmBase.SprSoato.FieldByName('ID').AsInteger;
          end;
        end;
      end else begin
        nID := dmBase.SprSoato.FieldByName('ID').AsInteger;
      end;
      if nID > -1 then begin
        if lAdd then begin
          ds.Append;
        end else begin
          ds.Edit;
        end;
        if lAdd then begin
          if f.cbHandled.Checked then begin
            ds.FieldByName('ID').AsInteger := nID;
          end else begin
            ds.FieldByName('ID').AsInteger := nID;
          end;
        end;
        if not f.cbHandled.Checked then begin
          ds.FieldByName('SOATO').AsString  := f.edSOATO.Text;
        end;
        ds.FieldByName('HANDLED').AsBoolean := f.cbHandled.Checked;
        ds.FieldByName('NAME').AsString   := f.edNameRus.Text;
        ds.FieldByName('NAME_B').AsString := f.edNameBel.Text;;
        ds.FieldByName('SHTAMP').AsString := f.edShtamp.Text;;
        ds.Post;
      end else begin
        ds.Cancel;
      end;
    end;
  finally
    f.Free;
  end;
  end;
end;

procedure TfmMain.GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if Column.Field.DataSet.FieldByName('HANDLED').AsBoolean then begin
    AFont.Color := clRed;
  end;
end;

procedure TfmMain.BeforeDeleteSprNames( Grid : TSasaDbGrid; var lDel : Boolean);
var
  nID : Integer;
begin
  nID := GlobalTask.ParamAsInteger('ID');
  if Grid.DataSource.DataSet.FieldByName('ID').AsInteger=nID then begin
    ShowMessage('  Удаление текущей записи запрещено ! ');
    lDel := false;
  end;
end;

procedure TfmMain.acSprOsibOtmExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPROSOBOTM', nil); end;

//------- один и тотже справочник SprKomiss--------------
procedure TfmMain.acSprKomissExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRKOMISS', nil); end;
procedure TfmMain.acSprMestRegistrExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRMESTREGISTR', nil); end;
//--------------------------------------------------------

procedure TfmMain.acSprNamesGExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRNAMESG', nil); end;

procedure TfmMain.acSprNamesMExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRNAMESM', nil); end;

procedure TfmMain.acSprPrichSmExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRPRICHSM', nil); end;

procedure TfmMain.acSprNalogiExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRNALOGI', nil); end;

procedure TfmMain.acSprNacExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRNAC', nil); end;

procedure TfmMain.acSprStranExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRSTRAN', nil); end;

procedure TfmMain.acSprFormObExecute(Sender: TObject);
begin
//Globaltask.EditSpr('EDIT_SPRFORMOB', nil);
end;

procedure TfmMain.acSprMestoObExecute(Sender: TObject);
begin
//Globaltask.EditSpr('EDIT_SPRMESTOB', nil);
end;

procedure TfmMain.acSprLgotExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRLGOT', nil); end;

procedure TfmMain.acSprTypeULExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRTYPEUL', nil); end;


procedure TfmMain.acSprEdIzmExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPREDIZM', nil); end;

procedure TfmMain.acSprPrNaselExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRPRNASEL', nil); end;

procedure TfmMain.acSprPrLichExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRPRLICH', nil); end;

procedure TfmMain.acSprUchZavedExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRUCHZAVED', nil); end;

procedure TfmMain.acSprOtnoshExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPROTNOSH', nil); end;

procedure TfmMain.acSprMestWorkExecute(Sender: TObject);
begin
  Globaltask.EditSpr('EDIT_WORK_ZAGS', nil);
end;

procedure TfmMain.acSprDolgExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRDOLG', nil); end;

procedure TfmMain.acStrTypePensExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRTYPEPENS', nil); end;

procedure TfmMain.acSprTypeMigrExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRTYPEMIGR', nil); end;

procedure TfmMain.acSprMatStenExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRMATSTEN', nil); end;

procedure TfmMain.acSprPrSozdExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRPRSOZD', nil); end;

procedure TfmMain.acSprPrLikvExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRPRLIKV', nil); end;

procedure TfmMain.acSprTypeHouseExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRTYPEHOUSE', nil); end;

//---------------------------------------------------------------
procedure TfmMain.acSprOwnersExecute(Sender: TObject);
//var
//  Param  : TParamsEditSpr;
begin
//  Param := TParamsEditSpr.Create;
//  Param.OnEditRecord := fmMain.EditRecordSprOwners;
//----------  Param.OnBeforeDelete := BeforeDeleteSprNames;
//----------  Param.OnGetCellParams := GridGetCellParams;
//  dmBase.SprOwners.Filter   := 'date_fiks=STOD('+ '''' +
//                             DTOS(fmMain.DateFiks,tdClipper)+''''+')';
//  dmBase.SprOwners.Filtered := true;
//  try
//    Globaltask.EditSpr('EDIT_SPROWNERS', Param);
//  finally
//    dmBase.SprOwners.Filter   := '';
//    dmBase.SprOwners.Filtered := false;
//  end;
end;

//---------------------------------------------------------------
procedure TfmMain.EditRecordSprOwners(Grid: TSasaDbGrid; lAdd: Boolean; Ic: TIcon);
//var
//  fmEditRecSprOwners: TfmEditRecSprOwners;
begin
//  fmEditRecSprOwners:=TfmEditRecSprOwners.Create(nil);
//  try
//    fmEditRecSprOwners.EditModal(Grid.DataSource.DataSet, lAdd);
//  except
//    fmEditRecSprOwners.Free;
//  end;
end;

//---------------------------------------------------------------
procedure TfmMain.BeforeSaveSprWork(Grid: TSasaDbGrid; lAdd: Boolean;  Ic: TIcon);
// !!! см. так же  fEditSprWork.pas: TfmEditSprWork.EditRecordSprWork( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);  !!!
var
  nID : Integer;
begin
  if lAdd then begin
    nID := dmBase.GetNewID(dmBase.TypeObj_Organ);
    if nID>-1 then begin
      Grid.DataSource.DataSet.FieldByName('ID').AsInteger:=nID;
    end;
  end;
  if (Grid.DataSource.DataSet.FieldByName('FNAME').AsString='') and (Grid.DataSource.DataSet.FieldByName('NAME').AsString<>'') then begin
    Grid.DataSource.DataSet.FieldByName('FNAME').AsString:=Grid.DataSource.DataSet.FieldByName('NAME').AsString;
  end;
end;

procedure TfmMain.BeforeDeleteSprWork(Grid: TSasaDbGrid;  var lDel: Boolean);
{$IFNDEF ZAGS}
var
  sId,sErr,oldInd:String;
{$ENDIF}
begin
  {$IFDEF ZAGS}
    lDel:=true; 
  {$ELSE}
    lDel:=true;
    sId:=Grid.DataSource.DataSet.FieldByName('ID').AsString;
    if sId<>'' then begin
      if dmBase.tbMens.Locate('WORK_SPR',StrToInt(sId),[]) then begin
        PutError('Текущее значение присутствует в таблице населения.',grid);
        lDel:=false;
      end;
      if lDel then begin
        oldInd:=dmBase.tbHouseOwners.IndexFieldNames;
        dmBase.tbHouseOwners.IndexFieldNames:='TYPEKOD;KOD';
        if dmBase.tbHouseOwners.FindKey([OWNER_ORG,StrToInt(sId)]) then begin
          PutError('Текущее значение присутствует в таблице собственников.',grid);
          lDel:=false;
        end;
        dmBase.tbHouseOwners.IndexFieldNames:=oldInd;
      end;
      if lDel then begin
        {$IFDEF OBR_GRAG}
           if DocRecord.CanDeleteOrg(StrToInt(sId),sErr) then begin
             PutError(sErr);
             lDel:=false;
           end;
        {$ENDIF}
      end;
    end;
  {$ENDIF}
end;

//--- типы заявлений о рождении ---------------------------------------
procedure TfmMain.acSprWriteDeclExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  Param := TParamsEditSpr.Create;
  Param.OnBeforeDelete := BeforeDeleteSprWriteDecl;
  Param.OnCheckEdit:=BeforeEditSprWriteDecl;
  Param.FreeOnExitSpr:=true;
  Globaltask.EditSpr('EDIT_SPRWRITEDECL', Param);
end;

procedure TfmMain.BeforeEditSprWriteDecl(Grid: TSasaDbGrid;  var lDel: Boolean);
var
  nID : Integer;
begin
  nID := Grid.DataSource.DataSet.FieldByName('ID').AsInteger;
  if (nID=1) or (nID=2) then begin
//    ShowMessageCont('  Корректировка и удаление текущей записи запрещено !',grid.Parent);
    lDel := false;
  end;
end;
procedure TfmMain.BeforeDeleteSprWriteDecl(Grid: TSasaDbGrid;  var lDel: Boolean);
var
  nID : Integer;
begin
  nID := Grid.DataSource.DataSet.FieldByName('ID').AsInteger;
  if dmBase.tbZapisRogd.Locate('ON_CHERN', nID, []) then begin
    ShowMessageCont('  Удаление текущей записи запрещено. #13  Значение присутствует в базе. ',grid.Parent);
    lDel := false;
  end;
end;
//--------------------------------------------------------------------

//---------------------------------------------------------------
procedure TfmMain.CreateParamsOpisEditSpr;
var
  Param  : TParamsEditSpr;
  Opis : TOpisEdit;
begin
  //------- справочник SprOwners (справочник собственников) --------------
//  Param:=TParamsEditSpr.Create;
//  Param.OnEditRecord:=fmMain.EditRecordSprOwners;
//  Param.FreeOnExitSpr:=false;
//  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPROWNERS');
//  Opis.ParamsEditSpr:=Param;
//  ListParamsSpr.AddObject(Opis.Caption, Param);
  //------- спраочник SprWork (справочник организаций) ------------------
//  Param:=TParamsEditSpr.Create;
//  Param.OnBeforeSave:=BeforeSaveSprWork;
  Param:=TParamsEditSpr.Create;
  Param.OnBeforeSave:=BeforeSaveSprWork;
  {$IFNDEF ZAGS}
    Param.OnBeforeDelete:=BeforeDeleteSprWork;
  {$ENDIF}
  Param.FreeOnExitSpr:=false;
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('EDIT_SPRWORK');      Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('EDIT_WORK_ZAGS');    Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK');       Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK2');      Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK_ZAGS');  Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK_NAME');  Opis.SetParamsEditSpr(Param);
  ListParamsSpr.AddObject(Opis.Caption, Param);
  //---------------------------------------------------------------------
  // подключаем экспорт для справочников
  GlobalEditSpr.OnExportSpr:=OnExportEditSpr;
end;

//-------------------------------------------------------
procedure TfmMain.CheckFormMen;
begin
  if fmMen = nil then begin
    dmMen := TdmMen.Create(nil);
    fmMen := TfmMen.Create(nil);

    Men.FdmMen     := dmMen;
    fmMen.Dokument := dmMen;

    fmMen.LoadFromIni;    
    SelLibFR.SetCurFormMen( fmMen );
  end;
end;

//-------------------------------------------------------
procedure TfmMain.CheckFormLichSchet;
begin
  if dmLichSchet = nil then begin
    dmLichSchet := TdmLichSchet.Create(nil);
    dmLichSchet.dmMens := nil;
    fmLichSchet := TfmLichSchet.Create(nil);
    fmLichSchet.Dokument := dmLichSchet;
    fmLichSchet.CreateRunTimeProperty;
    fmLichSchet.LoadFromIni;

    SelLibFR.SetCurFormLich( fmLichSchet );

  end;
  CheckFormMen;
  if dmLichSchet.dmMens = nil then begin
    dmLichSchet.dmMens := dmMen;
  end;
end;

//-------------------------------------------------------
procedure TfmMain.acLichNewSchetExecute(Sender: TObject);
var
  lOk:Boolean;
begin
  lOk:=true;
  if fmMain.DateFiks<>dmBase.GetDateCurrentSost then begin
    lOk:=Problem('Создать лицевой счет в состоянии на '+DatePropis(fmMain.DateFiks,3)+'г.');
  end;
  if lOk then begin
    CheckFormLichSchet;
    fmLichSchet.Dokument.DateFiks := fmMain.DateFiks; // !!! 10.02.2017 dmBase.GetDateCurrentSost;
    fmMen.Dokument.DateFiks := fmMain.DateFiks; //!!!dmBase.GetDateCurrentSost;
  //  fmLichSchet.lbSost.Caption := dmBase.NameSostFromDate(fmLichSchet.Dokument.DateFiks);
    fmLichSchet.Dokument.ReadDokument(-1);
    fmLichSchet.SkipDataSet:=nil;
    fmLichSchet.SetSubSystem(SS_HOZ_UCHET);
    fmLichSchet.EditForm(nil,'NULL');
  end;
end;

//----------------------------------------------------------------
function TfmMain.RunReport(TypeObj: Integer; slPar:TStringList; strIDMen : String):Boolean;
var
  ds:TDataSet;
  strID:String;
begin          
  Result:=false;
  if slPar.IndexOf('RUN_REPORT')=-1
    then slPar.Add('RUN_REPORT=1');              
  if dmBase.TypeObjForMens(TypeObj) then begin
    strID:='';
    ds:=dmBase.GetMen(fmMain.DateFiks,strIDMen);
    if ds<>nil then begin
      strID:=ds.FieldByName('ID').AsString;
      slPar.Add('ID_MEN='+strID);
      if TypeObj=dmBase.TypeObj_Lich then begin
        strID:=ds.FieldByName('LIC_ID').AsString;
      end else if TypeObj=dmBase.TypeObj_Adres then begin
        strID:=ds.FieldByName('ADRES_ID').AsString;
      end;
    end;
  end else begin
    strID:=strIDMen;
  end;
  if (strID<>'') and (strID<>'0') then begin
    Result:=EditDokument(nil,TypeObj,strID,slPar,false,'');
  end else begin
    PutError('Требуемый объект не найден.')
  end;
end;
//----------------------------------------------------------------
procedure TfmMain.SetDataSets_fmMen(dm:TdmMen);
begin
  fmMen.dsDokument.DataSet := dm.mtDokument;
  fmMen.dsLgot.DataSet     := dm.tbLgot;
  fmMen.dsPrizn.DataSet    := dm.tbPriznaki;
  fmMen.dsMigr.DataSet     := dm.tbMigr;
  fmMen.dsSostavSem.DataSet := dm.tbSostavSem;
  fmMen.dsOcheredLgot.DataSet:= dm.tbOcheredLgot;
  fmMen.dsOcheredResh.DataSet:= dm.tbOcheredResh;
  fmMen.dsSverki.DataSet:= dm.tbSverki;
end;
//----------------------------------------------------------------
function TfmMain.EditDokument(ds: TDataSet; TypeObj: Integer; strFieldID : String; slPar : TStringList; lEnableSkip : Boolean; strKodGurnal : String) : Boolean;
var
  nID : Integer;
  strID : String;
  Date_Fiks : TDateTime;
  fAdr : TfmAdres;
  dAdr : TdmAdres;
  l,lNew,lVosstan : Boolean;
  recID:TID;
begin
  recID.Men:=0;
  recID.Lic:=0;
  recID.Obj:=0;
  SystemProg.SetCurObj(0,recID);
  SystemProg.SetRunProcedure(0,0);

  IDLastDok:=0;     
  Result := false;
  lNew := false;
  if strFieldID=''
    then strFieldID:='ID';
  if IsAllDigit(strFieldID) or (strFieldID='-1') then begin // если передали ID документа
    strID:=strFieldID;
    nID:=StrToInt(strID);
  end else begin
    strID:=ds.FieldByName(strFieldID).AsString;
    nID:=ds.FieldByName(strFieldID).AsInteger;
  end;
  if ds=nil then begin
    Date_Fiks:=fmMain.DateFiks; // dmBase.GetDateCurrentSost;
    if (slPar<>nil) and (slPar.Count>0) then begin
      lVosstan:=(slPar.Values['VOSSTAN']='1');
    end else begin
      lVosstan:=false;
    end;
  end else begin
    if ds.FindField('DATE_FIKS')<>nil
      then Date_Fiks:=ds.FieldByName('DATE_FIKS').AsDateTime
      else Date_Fiks:=0;
    if ds.FindField('VOSSTAN')<>nil
      then lVosstan:=ds.FieldByName('VOSSTAN').AsBoolean
      else lVosstan:=false;
  end;
  //------------------ лицевой счет -----------------------------------------------------
  if TypeObj = dmBase.TypeObj_Lich then begin
    CheckFormLichSchet;
    fmLichSchet.Dokument.DateFiks := Date_Fiks;
    TdmMen(fmMen.Dokument).EditFromLichSchet  := true;
    TdmMen(fmMen.Dokument).EditFromAdres  := false;
    fmMen.Dokument.DateFiks  := Date_Fiks;
    {$IFNDEF OCHERED}
      fmMen.edOTNOSH.Enabled := true;
    {$ENDIF}
    fmMen.ActiveControl := fmMen.edFam;
//    fmLichSchet.lbSost.Caption := dmBase.NameSostFromDate(fmLichSchet.Dokument.DateFiks);
    fmLichSchet.Dokument.ReadDokument(nID, slPar);
    fmLichSchet.QueryExit:=false;
    fmLichSchet.FTmpWrite:=fmLichSchet.FEnableWrite;
    if (strFieldID='ID') and (ds<>nil) then begin
      fmLichSchet.SkipDataSet := ds;
    end else begin  // запретим перемещение если dataset не родной
      fmLichSchet.SkipDataSet := nil;
    end;
    if not lEnableSkip then fmLichSchet.SkipDataSet:=nil;
    fmLichSchet.SetSubSystem(SS_HOZ_UCHET);
    Result := fmLichSchet.EditForm(slPar,strKodGurnal);
  //------------------ человек -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_Nasel then begin
    CheckFormMen;
    fmMen.Dokument.DateFiks := Date_Fiks;
    TdmMen(fmMen.Dokument).EditFromLichSchet  := false;
    TdmMen(fmMen.Dokument).EditFromAdres  := false;
    l:=false;
    if nID=-1 then lNew:=true;
    if (slPar<>nil) and (slPar.Count>0) then begin
      if slPar.Values['MEN_ADD']='1' then begin
        lNew := true;
      end;
      if slPar.Values['MEN_NOTPROPIS']='1' then begin
        l:=true;
      end;
    end;
    fmMen.TBItemReLoad.Visible:=false;
    if lNew then begin
      nID:=-1;
      fmMen.Dokument.ReadDokument( -1 );
      fmMen.TBItemReLoad.Visible:=false;
      if l then begin
        fmMen.Dokument.mtDokument.Edit;
        TdmMen(fmMen.Dokument).mtDokumentPROPIS.AsBoolean:=false;
        TdmMen(fmMen.Dokument).mtDokumentNOTSELECT.AsBoolean:=true;
        fmMen.edPropis.Enabled:=false;
//        fmMen.edCanSelect.Enabled:=false;
        fmMen.Dokument.mtDokument.Post;
      end;
    end else begin
//      nID := ds.FieldByName(strFieldID).AsInteger;
      if nID>0 then begin
        fmMen.Dokument.ReadDokument( nID, slPar );
        if TdmMen(fmMen.Dokument).LicID=0 then begin
          // было
          {
          if (TdmMen(fmMen.Dokument).mtDokumentNOTSELECT.AsBoolean=false) or (TdmMen(fmMen.Dokument).mtDokumentPROPIS.AsBoolean=true) then begin
            fmMen.QueryExit:=true;
            fmMen.Dokument.mtDokument.Edit;
            TdmMen(fmMen.Dokument).mtDokumentPROPIS.AsBoolean:=false;
            TdmMen(fmMen.Dokument).mtDokumentNOTSELECT.AsBoolean:=true;
            fmMen.edPropis.Enabled:=false;
            fmMen.Dokument.mtDokument.Post;
          end;
          }
          // стало 09.02.2018
          if (TdmMen(fmMen.Dokument).mtDokumentPROPIS.AsBoolean=true) then begin
            fmMen.QueryExit:=true;
            fmMen.Dokument.mtDokument.Edit;
            TdmMen(fmMen.Dokument).mtDokumentPROPIS.AsBoolean:=false;
            fmMen.edPropis.Enabled:=false;
            fmMen.Dokument.mtDokument.Post;
          end;
        end;
      end;
    end;
    if lNew or (nID>0) then begin
      SetDataSets_fmMen(TdmMen(fmMen.Dokument));
//      fmMen.dsDokument.DataSet := TdmMen(fmMen.Dokument).mtDokument;
//      fmMen.dsLgot.DataSet     := TdmMen(fmMen.Dokument).tbLgot;
//      fmMen.dsPrizn.DataSet    := TdmMen(fmMen.Dokument).tbPriznaki;
//      fmMen.dsMigr.DataSet     := TdmMen(fmMen.Dokument).tbMigr;
//      fmMen.dsSostavSem.DataSet := TdmMen(fmMen.Dokument).tbSostavSem;
//      fmMen.dsOcheredLgot.DataSet:= TdmMen(fmMen.Dokument).tbOcheredLgot;
      {$IFNDEF OCHERED}
//        fmMen.edOTNOSH.Enabled := false;     пусть будет доступно всегда
      {$ENDIF}
      fmMen.TBItemWrite.Caption:='Записать';
      fmMen.TBItemWrite.Visible:=true;
      fmMen.TBItemCancel.Visible:=true;

  //    fmMen.TBItemPreView.Visible:=false;
  //    fmMen.TBItemPrint.Visible:=false;
      fmMen.CheckExit:=true;
      fmMen.QueryExit:=false;
      fmMen.FTmpWrite:=fmMen.FEnableWrite;
      fmMen.ActiveControl := fmMen.edFam;
      GlobalTask.CurrentOpisEdit.SetKeyForm(fmMen,nil);
      fmMen.pc.ActivePageIndex := 0;
      fmMen.ActiveControl := fmMen.edFam;
//      fmMen.cbVUS.Visible := true;
  //    fmMen.lbSost.Caption := dmBase.NameSostFromDate(fmMen.Dokument.DateFiks);
  //    fmMain.fmMen.edOTNOSH.Enabled:=true;
      if (strFieldID='ID') and not lNew and (ds<>nil) then begin
        fmMen.SkipDataSet := ds;
      end else begin  // запретим перемещение если dataset не родной
        fmMen.SkipDataSet := nil;
      end;

      if not lEnableSkip  then fmMen.SkipDataSet:=nil;

      if UpperCase(strKodGurnal)='FMGURNOCHERED' then begin
        fmMen.SetSubSystem(SS_OCHERED);
      end else if UpperCase(strKodGurnal)='FMGURNAKTZ' then begin
        fmMen.SetSubSystem(SS_ZAH);
      end else if UpperCase(strKodGurnal)='FMGURNVUS' then begin
        fmMen.SetSubSystem(SS_VUS);
      end else begin
        fmMen.SetSubSystem(SS_HOZ_UCHET);
      end;
      Result := fmMen.EditForm(slPar,strKodGurnal);
      IDLastMen:=fmMen.dmMen.mtDokumentID.AsInteger;
    end;
  //------------------ адрес -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_Adres then begin
    dAdr := TdmAdres.Create(nil);
    fAdr := TfmAdres.Create(nil);
    fAdr.Dokument := dAdr;
    fAdr.CreateRunTimeProperty;
    fAdr.LoadFromIni;
    fAdr.Dokument.DateFiks := Date_Fiks;
    fAdr.SkipDataSet := ds;
    CheckFormMen;
    if dAdr.dmMens = nil then begin
      dAdr.dmMens := dmMen;
    end;
    if not lEnableSkip or (ds=nil) then begin
      fAdr.SkipDataSet := nil;
    end;
    try
      fAdr.Dokument.ReadDokument(nID, slPar);
//      fAdr.Dokument.ReadDokument( ds.FieldByName(strFieldID).AsInteger, slPar );
      fAdr.CheckExit:=true;
      fAdr.QueryExit:=false;
      fAdr.FTmpWrite:=fAdr.FEnableWrite;
      fAdr.SetSubSystem(SS_HOZ_UCHET);
      Result := fAdr.EditForm(slPar,strKodGurnal);
    finally
      fAdr.Free;
      dAdr.Free;
    end;

  //------------------ паспорт -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_Passport then begin
    if not (strID='') then begin
//      nID := ds.FieldByName('ID').AsInteger;
      fmPassport := TfmPassport.Create(nil);
      try
        fmPassport.ReadDok( nID );
        Result := fmPassport.EditModal;
      finally
        fmPassport.Free;
        fmPassport:=nil;
      end;
    end;
  //------------------ заявление вид на жительство ----------------------------------
  end else if TypeObj = dmBase.TypeObj_VidGit then begin
    if not (strID='') then begin
//      nID := ds.FieldByName('ID').AsInteger;
      fmVidGit := TfmVidGit.Create(nil);
      try
        fmVidGit.ReadDok( nID );
        Result := fmVidGit.EditModal;
      finally
        fmVidGit.Free;
        fmVidGit:=nil;
      end;
    end;
  //----------------------------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_PassportViza then begin
//    if not (ds.FieldByName('ID').AsString='') then begin
//      nID := ds.FieldByName('ID').AsInteger;
//      Result := EditPasportViza(nID);
//    end;
  //------------------ заявление на брак -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_DBrak then begin
    if not (strID='') then begin
//      nID := ds.FieldByName(strFieldID).AsInteger;
      Result := EditDeclBrak(nID);
    end;
  //------------------ запись акта о браке -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZBrak then begin
    if not (strID='') then begin
//      nID := ds.FieldByName(strFieldID).AsInteger;
      if not lVosstan then begin
        result := EditZapisBrak(nID,false,nil);
      end else begin
//        result := EditZapisBrakV(nID);
      end;
    end;
  //------------------ запись акта о рождении -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZRogd then begin
    if not (strID='') then begin
//      nID := ds.FieldByName(strFieldID).AsInteger;
      if not lVosstan then begin
        Result := EditZapisRogd(nID,nil,false,slPar);
      end else begin
//        Result := EditZapisRogdV(nID);
      end;
    end;
  //------------------ запись акта о смерти -----------------------------------------------------
  end else if TypeObj = _TypeObj_ZSmert then begin
    if not (strID='') then begin
//      nID := ds.FieldByName(strFieldID).AsInteger;
      if not lVosstan then begin
        Result := EditZapisSmert(nID,l,false,slPar);
        if l then begin
          TalonUbitFromAktSmert(nID);
        end;
      end else begin
//        Result := EditZapisSmertV(nID);
      end;
    end;
  end else if TypeObj = _TypeObj_UZRogd then begin
    if not (strID='') then begin
      Result := EditDeclRegRogd(nID);
    end;
  end else if TypeObj = _TypeObj_UZSmert then begin
    if not (strID='') then begin
      Result := EditDeclRegRogd(nID,_TypeObj_UZSmert);
    end;
  end else if TypeObj = _TypeObj_UZUstOtc then begin
    if not (strID='') then begin
      Result := EditDeclRegUstOtc(nID);
    end;
  //------------------ акта о захоронении -----------------------------------------------------
  end else if TypeObj = _TypeObj_AktZAH then begin
    if not (strID='') then begin
       {$IFDEF ADD_ZAH}
         Result := EditAktZ(nID,slPar);
       {$ENDIF}
     end;
  end else if TypeObj = _TypeObj_Opeka then begin
    if not (strID='') then begin
      {$IFDEF ADD_OPEKA}
         Result := EditZapisOpeka(nID, slPar);
      {$ENDIF}
     end;
  //------------------ запись акта об установлении отцоавства -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZUstOtc then begin
    if not (strID='') then begin
//      nID := ds.FieldByName(strFieldID).AsInteger;
      Result := EditZapisUstOtc( nID, false, slPar );
    end;
  //------------------ SMDO СМДО -----------------------------------------------------
  end else if TypeObj = _TypeObj_SMDOPost then begin
    if not (strID='') then begin
      {$IFDEF SMDO}
         if StrToInt(ValueFromParams(slPar,'MSG_TYPE','1'))=MSG_TYPE_A then begin  // уведомление

         end else begin
           Result:=EditSMDODoc(nID, slPar);
         end;
      {$ENDIF}
    end;
  //------------------ талон прибытия -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_TalonPrib then begin
    if not (strID='') then begin
//      nID := ds.FieldByName('ID').AsInteger;
      fmTalonPrib := TfmTalonPrib.Create(nil);
      try
        if nID<=0
          then fmTalonPrib.NewDok(true)
          else fmTalonPrib.ReadDok(nID);
        Result := fmTalonPrib.EditModal;
        l := fmTalonPrib.FRunTalonUbit;
        nID := fmTalonPrib.DokumentID.AsInteger;
      finally
        fmTalonPrib.Free;
        fmTalonPrib:=nil;
      end;
      if l then begin
        TalonUbitFromTalonPrib(nID);
      end;
    end;
  //------------------ талон убытия -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_TalonUbit then begin
    if not (strID='') then begin
      fmTalonUbit := TfmTalonUbit.Create(nil);
      try
        if nID<=0
          then fmTalonUbit.NewDok(true)
          else fmTalonUbit.ReadDok( nID );
        Result := fmTalonUbit.EditModal;
      finally
        fmTalonUbit.Free;
        fmTalonUbit:=nil;
      end;
    end;
  //------------------ заявление на регистрацию -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_DeclareRegistr then begin
    if not (strID='') then begin
//      nID := ds.FieldByName('ID').AsInteger;
      fmDeclRegistr := TfmDeclRegistr.Create(nil);
      try
        fmDeclRegistr.ReadDok( nID );
        Result := fmDeclRegistr.EditModal;
      finally
        fmDeclRegistr.Free;
        fmDeclRegistr:=nil;
      end;
    end;
  end else begin
    PutError(' Неизвестный тип документа:'+IntToStr(TypeObj));
  end;

  SystemProg.CheckRunProcedure;

end;

//----------------------------------------------------------------
procedure TfmMain.TBItemAboutClick(Sender: TObject);
var
  s, ss, sss : String;
begin
  s:='';
  if dmBase.IsMainComputer then begin
    s := 'Полная установка';
  end else begin
    s := dmBase.AdsConnection.ConnectPath;
    if Pos(UpperCase(NAME_DICT),ANSIUpperCase(s))>0 then begin
      s := Copy(s,1,Length(s)-Length(NAME_DICT)-1);
    end;
    s := 'Путь к базе: '+s;
  end;
  if GlobalTask.DemoVersion then begin
     ss := 'ЛАИС+ (демо-версия)';
  end else begin
    {$IFDEF GISUN}
      if Gisun.Version=0
        then ss:='ЛАИС+'
        else ss:='ЛАИС+ (ГИС РН версия:'+IntToStr(Gisun.Version)+')';
    {$ELSE}
      ss:='ЛАИС+';
    {$ENDIF}
  end;
  sss:=dmBase.GetVersionZAGS(false);
  ShowAbout(dmBase.GetEngineVersion, 'Версия базы: '+dmBase.GetVersionBase(nil)+' ( ЗАГС '+sss+' )',ss,s);
end;

constructor TfmMain.Create(Owner: TComponent);
begin
  inherited;
  FRunAddMenu:=false;
  ListParamsSpr:=TStringList.Create;
  FFltOpList  := TOperList.Create;
  FFltSprList := TSprList.Create;
  FLog_WriteException := true;
  FLog_WriteOwner     := true;
  {$IFDEF USE_TEMPLATE}
  FTemplateInterface := TTemplateInterface.Create;
  {$ENDIF}
  {$IFDEF OBR_GRAG}
    DocRecord:=TDocRecordInterface.Create;
  {$ENDIF}
end;

destructor TfmMain.Destroy;
var
  i:Integer;
begin
  for i:=0 to ListParamsSpr.Count-1 do begin
    ListParamsSpr.Objects[i].Free;
  end;
  {$IFDEF USE_TEMPLATE}
  FTemplateInterface.Free;
  {$ENDIF}      
  fmMen.Free;
  dmMen.Free;                         
  fmLichSchet.Free;
  dmLichSchet.Free;
  FFltOpList.Free;
  FFltSprList.Free;
  {$IFDEF OBR_GRAG}
    DocRecord.Free;
  {$ENDIF}
  if GlobalTask<>nil
    then GlobalTask.UpdateIni;
  inherited;
end;
//----------------------------------------------------------------------------
procedure TfmMain.ShowGurnal(ClassGurnal : TFormGurnal; strName : String);
var
  i : Integer;
  Gurnal : TfmGurnal;
begin
  Gurnal := nil;
  strName := ANSIUpperCase(Trim(strName));
  for i:=0 to ListGurnal.Count-1 do begin
    if ListGurnal.Objects[i] is TfmGurnal and
       (ListGurnal.Strings[i] = strName) then begin
      Gurnal := TfmGurnal(ListGurnal.Objects[i]);
      break;
    end;
  end;
  if Gurnal = nil then begin
    if ClassGurnal.EnableOpen then begin
      Gurnal := ClassGurnal.Create(Self);
//      if Gurnal.EnableOpen then begin
  //    Gurnal := ClassGurnal.CreateChild;
        if ClassGurnal.ClassName=TfmGurnal.ClassName then begin
          Gurnal.Name   := strName;
          Gurnal.KodGurnal := Gurnal.Name;
        end else begin
          Gurnal.KodGurnal := Gurnal.Name;
        end;
        Gurnal.DateFiks := fmMain.DateFiks;
        if Gurnal.LoadQuery then begin
          Gurnal.LoadFromIni;
          Globaltask.CurrentOpisEdit.SetKeyForm(Gurnal,nil);
          ListGurnal.AddObject(strName, Gurnal);
        end else begin
          FreeAndNil(Gurnal);
        end;
//      end else begin
//        FreeAndNil(Gurnal);
//      end;
    end;
  end;
  if Gurnal<>nil then begin
    Gurnal.BringToFront;
    Gurnal.Show;
    SetRole;
  end;
end;

procedure TfmMain.DeleteFromListGurnal(strName: String);
var
  i : Integer;
begin
  strName := ANSIUpperCase(Trim(strName));
  for i:=0 to ListGurnal.Count-1 do begin
    if ANSIUpperCase(ListGurnal.Strings[i]) = strName then begin
      ListGurnal.Delete(i);
      break;
    end;
  end;
  SetRole;
end;

procedure TfmMain.SetDateFiks(const Value: TDateTime);
begin
  FDateFiks := Value;
  edSost.Text:=dmBase.NameSostFromDate(FDateFiks);
  lbSost.Caption:=dmBase.NameSostFromDate(FDateFiks);
  if (Role.Status = rsAdmin) or Role.SystemAdmin then begin
    acCreateSost.Enabled :=  FDateFiks=dmBase.GetDateCurrentSost;
    acDeleteSost.Enabled :=  FDateFiks=dmBase.GetDateCurrentSost;
  end;
end;

procedure TfmMain.TBItemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.SetRole;
var
  lEnabled : Boolean;
  i : Integer;
  s,sName:String;
begin
  CheckCaptionActiveGisun;
  SetFontParamQuest(11, false);         // размер шрифта для TfmParamQuest
  if not Role.SystemAdmin then begin
    acDesignReport.Visible  := false;
    acDesignReport3.Visible := false;
    TBSubmenuAdmin.Visible  := false;
    TBItemLoadLic.Visible   := false;
    TBItemSeek.Visible := false;
  end else begin
    TBItemSeek.Visible := true;
    {$IFDEF ZAGS}
      TBItemLoadLic.Visible := false;
    {$ELSE}
      {$IFDEF OCHERED}
        TBItemLoadLic.Visible := false;
      {$ELSE}
        TBItemLoadLic.Visible := true;
      {$ENDIF}
    {$ENDIF}

//    TBItemSeekAndRestore.Visible:=true;
  end;

  SMDOCheckVisible;  // СМДО
  if (Role.Status=rsAdmin) or (Role.CheckSubSystem(SS_SMDO)=ptFull) then begin
    acSMDOEditParams.Visible:=true;    // корректировка параметров СМДО
  end else begin
    acSMDOEditParams.Visible:=false;
  end;

  if EnableReport then begin
    acDesignReport.Visible := true;
    acDesignReport3.Visible := true;
  end;

  lEnabled := (ListGurnal.Count=0) and not FRunAddMenu;
  if lEnabled
    then lbSost.OnClick:=lbSostClick
    else lbSost.OnClick:=nil;

  TBItemDateFiks.Enabled:=lEnabled; // выбор состояния только при закрытых реестрах
  TBItemDefaultIni.Enabled:=lEnabled;

  if (Role.Status <> rsAdmin) then begin
    lEnabled := false;
  end;
  TBItemCreateSost.Enabled  := lEnabled;
  TBItemDelSost.Enabled     := lEnabled;
  TBItemBackup.Enabled      := lEnabled;
  TBItemRestore.Enabled     := lEnabled;
  TBItemReindexBase.Enabled := lEnabled;
  TBItemRunObrab.Enabled    := lEnabled;
  TBSubmenuAdd.Enabled      := lEnabled;
  TBItemJurnOper.Enabled    := lEnabled;
  TBItemVigrRIAP.Enabled    := lEnabled;
  {$IFDEF GISUN}
    if IsActiveGISUN and IsActiveWorkATE then begin
      TBItemLoadChangeATE.Enabled:= lEnabled;
    end else begin
      TBItemLoadChangeATE.Visible:=false;;
    end;
  {$ELSE}
    TBItemLoadChangeATE.Visible:=false;;
  {$ENDIF}
  if dmBase.IsMainComputer and (Role.Status=rsAdmin) then begin
    {$IFDEF GISUN}
      acGisunParams.Visible:=true;
    {$ELSE}
      acGisunParams.Visible:=false;
    {$ENDIF}
    TBSeparatorItem7.Visible:=true;
    acSetShare.Visible:=true;
    acDelShare.Visible:=true;
    sName:=GetNameSharedFolder(s);
    acSetShare.Caption:='Открыть общий доступ под именем: "'+sName+'"';
    if GlobalTask.ParamAsBoolean('ENABLE_SQL')
     then acSQL.Visible:=true
     else acSQL.Visible:=false;
  end else begin
    acGisunParams.Visible:=false;

    TBSeparatorItem7.Visible:=false;
    acSetShare.Visible:=false;
    acDelShare.Visible:=false;
    acSQL.Visible:=false;
  end;
  if Role.SystemAdmin then begin
    acSQL.Visible:=true;
  end;

  TBSubmenuSysSpr.Enabled   := lEnabled;
  TBItemPunks.Enabled       := lEnabled;

  acSetPassword.Visible := lEnabled;
  {$IFDEF ZAGS}
    acLoadZAGS.Enabled    := lEnabled;
    acVigrZAGS.Enabled    := lEnabled;
    acProvSvidZAGS.Enabled:= lEnabled;
    acPermitUsers.Visible := false;
  {$ELSE}
//    acLoadZAGS.Visible    := false;
    acPermitUsers.Visible := lEnabled;
  {$ENDIF}

  if GlobalTask.ParamAsInteger('AUTO_BACKUP')=0 then begin
    acRunAutoRestore.Enabled := false;
  end;
  if not dmBase.IsMainComputer and not Role.SystemAdmin then begin
    TBItemCreateSost.Enabled  := false;
    TBItemDelSost.Enabled     := false;
    TBItemBackup.Enabled      := false;
    TBItemRestore.Enabled     := false;
    TBItemReindexBase.Enabled := false;
    acRunAutoRestore.Enabled  := false;
    TBSubmenuAdd.Enabled      := false;
//    TBItemJurnOper.Enabled    := false;
//    TBItemVigrRIAP.Enabled    := false;
  end;
  {$IFDEF ZAGS}
  TBSubmenuSprVUS.Visible := false;
  TBItemUnionBase.Visible := false;
  acLoadMRUListZAGS.Visible:=true;
  {$ELSE}
  acLoadMRUListZAGS.Visible:=false;
  {$ENDIF}
  if dmBase.LastDatabaseError<>0 then begin
    TBSubmenuVigr.Enabled:=false;
//    for i:=0 to ActionList.ActionCount-1 do begin
//      TAction(ActionList.Actions[i]).Enabled:=false;
//    end;
  end else begin
    TBSubmenuVigr.Enabled:=true;
  end;
  {$IFDEF ZAGS}
    TBSubmenuVigr.Visible:=false;
  {$ENDIF}

  {$IFDEF GISUN}
    if IsActiveGISUN and (Gisun.PostUserName or Gisun.ActiveETSP) then begin
      if Gisun.DbUserAsGIS and not Gisun.ActiveETSP then begin
        acSetUserGIS.Visible:=false
      end else begin
        acSetUserGIS.Visible:=true;
      end;
    end else begin
      acSetUserGIS.Visible:=false;
    end;
  {$ELSE}
    acSetUserGIS.Visible:=false;
  {$ENDIF}
  acClearUserGIS.Visible:=acSetUserGIS.Visible;

  {$IFDEF SMDO}
    if SMDO<>nil
      then SMDO.CheckEnabledPost;
  {$ENDIF}

  {
  if not EnableWrite(Self) then begin
    for i:=0 to ActionList.ActionCount-1 do begin
      if ActionList.Actions[i].Category='Документы' then begin
        TAction(ActionList.Actions[i]).Enabled := false;
      end;
    end;
    acLichNewSchet.Enabled  := false;
    acSetParameters.Enabled := false;
  end;
 }
end;

// реестр заявлений на паспорт
procedure TfmMain.acRsPasportExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnPassport, 'fmGurnPassport');
end;


procedure TfmMain.acRePassportVizaExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnPassportViza, 'fmGurnPassportViza');
end;

procedure TfmMain.acReQueryGisExecute(Sender: TObject);
begin
// запросы в ГИС РН
  //ShowGurnal(TfmGurnQueryGis, 'fmGurnQueryGis');
end;

procedure TfmMain.acReRogdExecute(Sender: TObject);
begin
// реестр записей актов о рождении
  ShowGurnal(TfmGurnZRogd, 'fmGurnZRogd');
end;

procedure TfmMain.acReSmertExecute(Sender: TObject);
begin
// реестр записей актов о смерти
  ShowGurnal(TfmGurnZSmert, 'fmGurnZSmert');
end;

// реестр записей регистрации браков
procedure TfmMain.acReBrakExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnZBrak, 'fmGurnZBrak');
end;

// реестр заявлений на брак
procedure TfmMain.acReDeclBrakExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnDBrak, 'fmGurnDBrak');
end;

procedure TfmMain.acReZUstOtcExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnZUstOtc, 'fmGurnZUstOtc');
end;

procedure TfmMain.acUZRogdExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnUZRogd, 'fmGurnUZRogd');
end;

procedure TfmMain.acUZUstOtcExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnUZUstOtc, 'fmGurnUZUstOtc');
end;

procedure TfmMain.acUZSmertExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnUZSmert, 'fmGurnUZSmert');
end;

procedure TfmMain.acReAdoptExecute(Sender: TObject);
begin
end;

//  заявление на поспорт
procedure TfmMain.acZPasportExecute(Sender: TObject);
begin
  fmPassport := TfmPassport.Create(nil);
  try
    fmPassport.NewDok(true);
    fmPassport.EditModal;
  finally
    fmPassport.Free;
    fmPassport := nil;
  end;
end;

procedure TfmMain.acZPasportVizaExecute(Sender: TObject);
begin
//  EditPasportViza(-1);
end;

//--------- акт расторжения брака ---------------
procedure TfmMain.acZRastExecute(Sender: TObject);
begin
  {$IFDEF ZAGS}
//  EditRastBrak( -1 );
  {$ENDIF}
end;

//--------- акт усыновления (удочерения) ---------------
procedure TfmMain.acZAdoptExecute(Sender: TObject);
begin
  {$IFDEF ZAGS}
  EditZapisAdopt( -1 );
  {$ENDIF}
end;

procedure TfmMain.acZChNameExecute(Sender: TObject);
begin
{$IFDEF ZAGS}
  EditZapisChName( -1 );
{$ENDIF}
end;

//--------- акт заключения брака ---------------
procedure TfmMain.acZBrakExecute(Sender: TObject);
begin
  EditZapisBrak( -1, false,nil );
end;

//--------- заявление заключения брака ---------------
procedure TfmMain.acDBrakExecute(Sender: TObject);
begin
  EditDeclBrak( -1 );
end;

//----------------------------------------------
procedure TfmMain.acVostZBrakExecute(Sender: TObject);
begin
//  EditZapisBrakV( -1);
end;

procedure TfmMain.acVostZRogdExecute(Sender: TObject);
begin
//  EditZapisRogdV( -1);
end;

procedure TfmMain.acVostZSmertExecute(Sender: TObject);
begin
//  EditZapisSmertV( -1);
end;
//--------------------------------------------------------------
procedure TfmMain.acReZOpekaExecute(Sender: TObject);
begin
  {$IFDEF ADD_OPEKA}
    ShowGurnal(TfmGurnZOpeka, 'fmGurnZOpeka');
  {$ENDIF}
end;
//--------------------------------------------------------------
procedure TfmMain.acReAktZExecute(Sender: TObject);
begin
  {$IFDEF ADD_ZAH}
    ShowGurnal(TfmGurnAktZ, 'fmGurnAktZ');
  {$ENDIF}
end;
//--------------------------------------------------------------
procedure TfmMain.acAktZExecute(Sender: TObject);
var
  nID:Integer;
  slPar:TStringList;
begin
  slPar:=nil;
  nID:=-1;
  {$IFDEF ADD_ZAH}
    EditAktZ(nID,  slPar);
  {$ENDIF}
end;

//-------------------------------------------------------------------------
// SprWork - SMDOSprOrg  (события)   СМДО !!!
//-------------------------------------------------------------------------

procedure TfmMain.acSprWorkExecute(Sender: TObject);
begin
  EditSprWork;
  LoadOpisControlHouse;
  {$IFDEF OBR_GRAG}
    DocRecord.UpdateSpr('SP_CORR');
  {$ENDIF}
end;
//--end SprWork -----------------------------------------------------------------------

//-------------------------------------------------------------------------
// SprZAH  (события)
//-------------------------------------------------------------------------
procedure TfmMain.acSprZAHExecute(Sender: TObject);
{$IFDEF ADD_ZAH}
var
  Param  : TParamsEditSpr;
{$ENDIF}
begin
{$IFDEF ADD_ZAH}
  Param:=TParamsEditSpr.Create;
  Param.OnEditRecord := EditRecordSprZAH;
  Param.OnBeforeDelete:=BeforeDeleteSprZAH;
  Param.OnGetCellParams := SprZAH_GridGetCellParams;
  Param.Col1 := 'ATE';
  Param.GetCellParams_Col1 := SprZAH_GridGetCellParams1;
  Globaltask.EditSpr('EDIT_SPRZAH', Param);
//    Param.Free;  удаляется после уничтожения формы
{$ENDIF}
end;

{$IFDEF ADD_ZAH}
procedure TfmMain.SprZAH_GridGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  ATE:TATE;
  s:String;
begin
  if not EditMode and (Params.Text<>'') then begin
    ATE.ATE_ID:=StrToIntDef(Params.Text,0);
    if ATE.ATE_ID>0 then begin
      s:=FullNameFromATE(ATE,0,', ');
      if s=''
        then Params.Text:='неизвестный код '+Params.Text
        else Params.Text:=s;
    end else begin
      Params.Text:='';
    end;
  end;
end;
procedure TfmMain.SprZAH_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  ds:TDataSet;
  old:String;
begin
  ds:=Column.Field.DataSet;
  if (ds.FieldByName('ATE').AsString='') then begin
    AFont.Color := clRed;
  end;
  if ds.FieldByName('ID_GIS').AsInteger=0
    then Background:=clInfoBk;
end;

procedure TfmMain.BeforeDeleteSprZAH(Grid: TSasaDbGrid;  var lDel: Boolean);
begin
  dmBase.AdsConnection.Execute('DELETE FROM BaseProp WHERE typeobj='+IntToStr(_TypeObj_BookKlad)+
        ' and id='+Grid.DataSource.DataSet.FieldByName('ID').AsString);
//   дописать контроль на удаление   !!! !!!
end;

procedure TfmMain.EditRecordSprZAH( Grid:TSasaDbGrid; lAdd:Boolean; Ic:TIcon);
var
  strID : String;
  ds : TDataSet;
begin
  ds := Grid.DataSource.DataSet;
  if (ds.State = dsEdit) or (ds.State = dsInsert) then begin
    ds.Cancel;
  end;
  EditRecord_SprZAH(Grid, ds, lAdd, Ic);
end;
{$ENDIF}
//-------------------------------------------------------------------------
// SprZAH  (end)
//--------------------------------------------------------

//--------  акт о рождении -----------------------
procedure TfmMain.acZRogdExecute(Sender: TObject);
begin
  EditZapisRogd( -1, nil, false,nil );
end;

//----------------  акт о смерти ------------------
procedure TfmMain.acZSmertExecute(Sender: TObject);
begin
  EditDokument(nil,_TypeObj_ZSmert,'-1',nil,false,'');
end;

// установление отцовства
procedure TfmMain.acUstOtcExecute(Sender: TObject);
begin
  EditZapisUstOtc( -1, false, nil );
end;

// установление материнства
procedure TfmMain.acUstMatExecute(Sender: TObject);
begin
//  EditZapisUstMat( -1 );
end;


procedure TfmMain.acUpdateBaseExecute(Sender: TObject);
var
  strErr : String;
begin
  if not GlobalTask.UpdateParameters( Globaltask.PathService+'NewParams.tsk', true) then begin
    strErr := GlobalTask.LastError;
    if strErr = '' then begin
      strErr := 'Неизвестная ошибка обновления файла параметров.';
    end;
    Beep;
    PutError(strErr);
  end;
end;

procedure TfmMain.acNaselExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnNasel, 'fmGurnNasel');
end;

procedure TfmMain.acInstructExecute(Sender: TObject);
begin
//  Application.HelpFile := NameFromExe('sstut.hlp');
//  Application.HelpCommand(HELP_FINDER, 0);
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Об организации похозяйственного учета.doc')), nil, nil, SW_SHOWNORMAL);

//  OpenDocWord('Об организации похозяйственного учета.doc');
end;

function TfmMain.GetTable_FindOper: TkbmMemTable;
begin
  if not mtOperFind.Active then begin
    mtOperFind.Active := true;
  end;
  if mtOperFind.RecordCount=0 then begin
    try
      mtOperFind.LoadFromFile(GlobalTask.PathService+'FindOper.mtb');
    except
    end;
  end;
  Result := mtOperFind;
end;

procedure TfmMain.SaveTable_FindOper;
begin
  if mtOperFind.Active then begin
    mtOperFind.SaveToFile(GlobalTask.PathService+'FindOper.mtb');
  end;
end;

procedure TfmMain.acFindOperExecute(Sender: TObject);
var
  f : TfmOperFind;
begin
  f := TfmOperFind.Create(nil);
  f.ShowModal;
  f.Free;
end;

//----------------------------------------------------------
procedure TfmMain.LoadOpisReportTable;
var
  ini : TSasaIniFile;
  sl : TStringList;
  strName, strValues : String;
  strField, strFields, strDescFields : String;
  arr : TArrStrings;
  i,j, nSize, n : Integer;
  fldType : TFieldType;
  fldDef : TFieldDef;
  {$IFDEF USE_FR3}
    frt3 : TfrxDbDataSet;
  {$ENDIF}
begin
  sl := TStringList.Create;
  ini := TSasaIniFile.Create(GlobalTask.PathService+'ReportTable.ini');
  ini.ReadSectionValues('MAINTABLE', sl);
  if sl.Count > 0 then begin
    for i:=0 to sl.Count-1 do begin
      strName   := sl.Names[i];
      strValues := sl.Values[strName];
      FuncPr.StrToArr(strValues, arr,',',false);
      SetLength(arr,2);
      nSize := 0;
      if StringToFieldType( arr[0], fldType) then begin
        if arr[1]='' then begin
          nSize := 0;
        end else begin
          nSize := StrToInt(arr[1]);
        end;
      end;
      fldDef := mtReport.FieldDefs.AddFieldDef;
      fldDef.Name     := Trim(strName);
      fldDef.DataType := fldType;
      fldDef.Size     := nSize;
      fldDef.Required := false;
//      mtReport.FieldDefs.Add(Trim(strName), fldType, nSize, false);
    end;
    sl.Clear;
    ini.ReadSectionValues('MAINTABLE->INDEX', sl);
    mtReport.IndexDefs.Clear;
    if sl.Count > 0 then begin
      for i:=0 to sl.Count-1 do begin
        strFields := '';
        strDescFields := '';
        strName   := sl.Names[i];
        strValues := sl.Values[strName];
        FuncPr.StrToArr(strValues, arr,',',false);
        for j:=Low(arr) to High(arr) do begin
          n := Pos(' ', arr[j]);
          if n > 0 then begin
            strField := Trim(Copy(arr[j],1,n-1));
            if ANSIUpperCase(Trim(Copy(arr[j],n+1,100)))='DESC' then begin
              strDescFields := strDescFields + strField + ';';
            end;
          end else begin
            strField := Trim(arr[j]);
          end;
          strFields := strFields + strField + ';';
        end;
        with mtReport.IndexDefs do begin
          with AddIndexDef do begin
            Name := strName;
            Fields := strFields;
            Options := [];
            DescFields := strDescFields;
          end;
        end;
      end;
    end;
  end else begin
    PutError('Неизвестна структура таблицы mtReport');
  end;
  if mtReport.FieldDefs.Count > 0 then begin
    mtReport.Open;
  end;
  sl.Free;
  ini.Free;
  {$IFDEF USE_FR3}
    frt3 := TfrxDbDataSet.Create(Self);
    frt3.Name := 'fr3_' + mtReport.Name;
    frt3.DataSet := mtReport;
    frt3.UserName:='MainFR3';
    frt3.Description:='Вспомогательная таблица';
  {$ENDIF}
end;

//---------------------------------------------------------
procedure TfmMain.acSetDateFiksExecute(Sender: TObject);
var
  f : TfmDeleteFiks;
  lOk : Boolean;
  strDate : String;
  d : TDateTime;
begin
  f:=TfmDeleteFiks.Create(nil);
//  UstDropDownForm(f, TBToolWindowS);
  f.Caption := 'Выбрать состояние базы';
  dmBase.WorkQuery.Active := false;
  dmBase.WorkQuery.DataBaseName := 'AdsConnection';
  dmBase.WorkQuery.SQL.Text := 'SELECT date_fiks FROM ДатыФиксации ORDER BY date_fiks';
  dmBase.WorkQuery.Open;
  while not dmBase.WorkQuery.Eof do begin
    d := dmBase.WorkQuery.FieldByName('DATE_FIKS').AsDateTime;
    f.edYear.KeyItems.Add( DTOS(d,tdAds) );
    if d = dmBase.GetDateCurrentSost then begin
      f.edYear.Items.Add( 'Текущее' );
    end else begin
      f.edYear.Items.Add( Copy(DTOS(d,tdAds),1,4) );
    end;
    dmBase.WorkQuery.Next;
  end;
  dmBase.WorkQuery.Active := false;
  f.edYear.ItemIndex := -1;
  lOk := f.ShowModal=mrOk;
  strDate:='';
  if f.edYear.ItemIndex>-1 then begin
    strDate := f.edYear.KeyItems[f.edYear.ItemIndex];
  end;
  f.Free;
  if lOk and (strDate<>'') then begin
    fmMain.DateFiks := STOD(strDate, tdAds);
  end;
end;

procedure TfmMain.acCreateSostExecute(Sender: TObject);
var
  f : TfmCreateFiks;
  lOk : Boolean;
  nYear,nMonth,nDay : Word;
  strDate : String;
  lCreateCur : Boolean;
  strCaption : String;
  lFull : Boolean;
begin
  if StrToInt(FormatDateTime('mm',GlobalTask.CurrentDate)) <> 1 then begin
    PutError(' Создание состояния базы доступно только в январе !');
    exit;
  end;
  if ((Role.Status = rsAdmin) and GlobalTask.ParamAsBoolean('REST_CUR_SOST')) or
     Role.SystemAdmin then begin
    lFull := true;
  end else begin
    lFull := false;
  end;
  DecodeDate(Now,nYear,nMonth,nDay);
  f := TfmCreateFiks.Create(nil);
  f.ckCurSost.Visible := lFull;
  dmBase.WorkQuery.Active := false;
  dmBase.WorkQuery.DataBaseName := 'AdsConnection';
  dmBase.WorkQuery.SQL.Text := 'SELECT date_fiks FROM ДатыФиксации ORDER BY date_fiks desc';
  dmBase.WorkQuery.Open;
  if not lFull then begin
    if dmBase.WorkQuery.RecordCount > 1 then begin  // есть состояния кроме текущего
      f.edYear.MinValue := StrToInt(FormatDateTime('yyyy',dmBase.WorkQuery.FieldByNAme('DATE_FIKS').AsDateTime))+1;
      if f.edYear.MinValue > nYear then nYear := StrToInt(FloatToStr(f.edYear.MinValue));
    end;
  end;
  f.edYear.Value := nYear;
  dmBase.WorkQuery.Close;
  lOk := f.ShowModal=mrOk;
  if f.edYear.Value <> null then begin
    nYear := f.edYear.Value;
  end;
  lCreateCur := f.ckCurSost.Checked;  // восстановить текущее состояние базы
  f.Free;
  if lOk then begin
    if lCreateCur then begin
      strCaption := ' Вы хотите восстановить "текущее" состояние базы из состояния на '+'1 января '+IntToStr(nYear)+' года ? '
    end else begin
      strCaption := ' Вы хотите создать состояние базы на '+'1 января '+IntToStr(nYear)+' года ? '
    end;
    if Problem(strCaption) then begin
      strDate := IntToStr(nYear)+'-01-01';
      dmBase.CreateNewSostBase( STOD(strDate, tdAds), lCreateCur );
    end;
  end;
end;
//--------------------------------------------------------
procedure TfmMain.acDeleteSostExecute(Sender: TObject);
var
  f : TfmDeleteFiks;
  lOk : Boolean;
  nYear : Word;
  strDate : String;
  d : TDateTime;
begin
  nYear := 0;
  f := TfmDeleteFiks.Create(nil);
  dmBase.WorkQuery.Active := false;
  dmBase.WorkQuery.DataBaseName := 'AdsConnection';
  dmBase.WorkQuery.SQL.Text := 'SELECT date_fiks FROM ДатыФиксации ORDER BY date_fiks';
  dmBase.WorkQuery.Open;
  while not dmBase.WorkQuery.Eof do begin
    d := dmBase.WorkQuery.FieldByName('DATE_FIKS').AsDateTime;
    if d <> dmBase.GetDateCurrentSost then begin
      f.edYear.KeyItems.Add( Copy(DTOS(d,tdAds),1,4) );
      f.edYear.Items.Add( Copy(DTOS(d,tdAds),1,4) );
    end;
    dmBase.WorkQuery.Next;
  end;
  dmBase.WorkQuery.Active := false;
  f.edYear.ItemIndex := -1;
  lOk := f.ShowModal=mrOk;
  if f.edYear.ItemIndex>-1 then begin
    nYear := StrToInt(f.edYear.KeyItems[f.edYear.ItemIndex]);
  end;
  f.Free;
  if lOk and (nYear>0) then begin
    if Problem(' Удалить состояние базы на 1 января '+IntToStr(nYear)+' года ? ') then begin
      strDate := IntToStr(nYear)+'-01-01';
      dmBase.DeleteSostBase( STOD(strDate, tdAds) );
      if DateFiks = STOD(strDate, tdAds) then begin
        DateFiks := dmBase.GetDateCurrentSost;
      end;
    end;
  end;
end;

procedure TfmMain.RunAutoBackup;
begin
//  lAutoBackup := true;
  fmCopyData := TfmCopyData.Create(nil);
  fmCopyData.AutoBackup := true;
  fmCopyData.FullPath := false;  // имеет смысл если AutoBackup=fasle
  fmCopyData.Restore    := false;
  try
    fmCopyData.CopyData;
  finally
    fmCopyData.Free;
//    lAutoBackup := false;
  end;
end;

procedure TfmMain.RunAutoRestore;
begin
//  lAutoBackup := true;
  fmCopyData := TfmCopyData.Create(nil);
  fmCopyData.AutoBackup := true;
  fmCopyData.FullPath := false;  // имеет смысл если AutoBackup=fasle
  fmCopyData.Restore    := true;
  try
    fmCopyData.CopyData;    
  finally
    fmCopyData.Free;
//    lAutoBackup := false;
  end;
end;

procedure TfmMain.acBackupExecute(Sender: TObject);
begin
  fmCopyData := TfmCopyData.Create(nil);
  fmCopyData.AutoBackup:=false;
  fmCopyData.FullPath := false;  // имеет смысл если AutoBackup=fasle
  fmCopyData.Restore:=false;
  if Role.SystemAdmin then begin
    fmCopyData.cbArxiv.Visible:=true;
  end;
  try
    if fmCopyData.ShowModal=mrOk then begin
      fmCopyData.CopyData;
    end;
  finally
    fmCopyData.Free;
  end;
end;

procedure TfmMain.acRestoreExecute(Sender: TObject);
begin
  fmCopyData := TfmCopyData.Create(nil);
  fmCopyData.FullPath := false;  // имеет смысл если AutoBackup=fasle
  fmCopyData.AutoBackup:=false;
  fmCopyData.Restore:=true;
  try
    if fmCopyData.ShowModal=mrOk then begin
      fmCopyData.CopyData;
    end;
  finally
    fmCopyData.Free;
  end;
end;

procedure TfmMain.RunSeekAndRestore(Sender: TObject);
begin
end;

procedure TfmMain.acSeekAndRestoreExecute(Sender: TObject);
var
  lRun:Boolean;
  strPath:String;
  lEnabledParams:Boolean;
begin
  FRunAddMenu:=true;
  SetRole;
  try
  if fmSeekBase=nil then begin;
    fmSeekBase := TfmSeekBase.Create(nil);
    fmSeekBase.BaseName:=NAME_DICT;
    fmSeekBase.Password:=SYSTEM_PASSWORD;
    fmSeekBase.UserName:=SYSTEM_USER;
    fmSeekBase.MainConnection:=dmBase.AdsConnection;
    fmSeekBase.RunDataProcess:=RunSeekAndRestore;
  end;              
  if fmSeekBase.ShowModal=mrOk then begin
    strPath:=fmSeekBase.ResultPAth;
    lEnabledParams:=fmSeekBase.ResultParams;
    lRun:=true;
  end else begin
    lRun:=false;
    lEnabledParams:=true;
  end;
//  fmSeekBase.Free;
  if lRun then begin
    fmCopyData := TfmCopyData.Create(nil);
    fmCopyData.AutoBackup := false;
    fmCopyData.Restore    := true;
    fmCopyData.FullPath   := true;  // имеет смысл если AutoBackup=fasle
    fmCopyData.edPath.Text:=strPath;
    fmCopyData.edPath.EditButtons[0].Visible:=false;
    fmCopyData.edPath.ReadOnly:=true;
    fmCopyData.cbRestoreParams.Enabled:=lEnabledParams;
    try
      if fmCopyData.ShowModal=mrOk then begin
        fmCopyData.CopyData;
      end;
    finally
      fmCopyData.Free;
    end;
  end;
  finally
    FRunAddMenu:=false;
    SetRole;
  end;
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  TBToolWindowS.DockPos:=2000;
end;

procedure TfmMain.edSostClick(Sender: TObject);
begin
  acSetDateFiksExecute(nil);
end;
procedure TfmMain.lbSostClick(Sender: TObject);
begin
  acSetDateFiksExecute(nil);
end;
procedure TfmMain.lbSostDblClick(Sender: TObject);
begin
  acSetDateFiksExecute(nil);
end;

procedure TfmMain.SetFltOpList(const Value: TOperList);
begin
  FFltOpList := Value;
end;

procedure TfmMain.SetFltSprList(const Value: TSprList);
begin
  FFltSprList := Value;
end;

procedure TfmMain.acFullCloseExecute(Sender: TObject);
begin
  dmBase.CloseBase;
end;

procedure TfmMain.acFullOpenExecute(Sender: TObject);
begin
  dmBase.OpenBase;
end;

procedure TfmMain.SetLog_WriteException(const Value: Boolean);
begin
  FLog_WriteException := Value;
end;

procedure TfmMain.SetLog_WriteOwner(const Value: Boolean);
begin
  FLog_WriteOwner := Value;
end;

procedure TfmMain.MyHandleException(Sender: TObject; E: Exception);
var
  s : String;
  obj : TComponent;
begin
  s := '';
  if Sender is TComponent then begin
    obj := TComponent(Sender);
    while obj.Owner <> nil do begin
      if obj.Owner is TForm then begin
        s := TForm(obj.Owner).Name + '('+TForm(obj.Owner).ClassName+')'+' >> ';
        break;
      end else begin
        obj := obj.Owner;
      end;
    end;
  end;
  GlobalTask.LogFile.WriteToLogFile(s+E.Message);
  if (E is EADSDatabaseError) then begin
    if (EADSDatabaseError(E).ACEErrorCode=7057) and (EADSDatabaseError(E).TableName<>'') then begin
      s := 'Таблица: '+EADSDatabaseError(E).TableName+' ';
      s := s + 'Запись с введенным ключом уже существует.';
      PutError(s);
    end else begin
      Application.ShowException(E);
    end;
  end else begin
    Application.ShowException(E);
  end;
end;

procedure TfmMain.acTalonPribExecute(Sender: TObject);
begin
  EditDokument(nil,_TypeObj_TalonPrib,'-1',nil,false,'');
end;

procedure TfmMain.acTalonUbitExecute(Sender: TObject);
begin
  EditDokument(nil,_TypeObj_TalonUbit,'-1',nil,false,'');
end;

procedure TfmMain.acReTalonPribExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnTalonPrib, 'fmGurnTalonPrib');
end;
//----------------------------------------------------
procedure TfmMain.acReTalonUbitExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnTalonUbit, 'fmGurnTalonUbit');
end;
//----------------------------------------------------
procedure TfmMain.acReOwnersExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnOwners, 'fmGurnOwners');
end;
//----------------------------------------------------
procedure TfmMain.SaveToIni;
begin
// TBIniSavePositions(Self, GlobalTask.PathService+'Menu.ini', '');
end;
//----------------------------------------------------
procedure TfmMain.LoadFromIni;
begin
//  TBIniLoadPositions(Self, GlobalTask.PathService+'Menu.ini', '');
  LoadActionList(ActionList,GlobalTask.PathService+'Actions.ini');
end;
//----------------------------------------------------
procedure TfmMain.acSetUpActionsExecute(Sender: TObject);
var
  s : String;
begin
  SetupActions(ActionList,s);   //boolean
  CheckSubMenu;
  SaveActionList(ActionList,GlobalTask.PathService+'Actions.ini')
end;

procedure TfmMain.CheckSubMenu;
var
  m,j : Integer;
  lVisible : Boolean;
  sub : TTBSubmenuItem;
  sl : TStringList;
  pt:TPermitType;
begin
  sl := TStringList.Create;
  sl.AddObject('TBSubmenuFIO',TBSubmenuFIO);
  sl.AddObject('TBSubMenuSpr',TBSubMenuSpr);
  sl.AddObject('TBSubMenuLich',TBSubMenuLich);
  sl.AddObject('TBSubMenuItemDok',TBSubMenuItemDok);
  sl.AddObject('TBSubMenuCreate',TBSubMenuCreate);
  sl.AddObject('TBSubMenuZAGS',TBSubMenuZAGS);
  sl.AddObject('TBSubMenuGurnZAGS',TBSubMenuGurnZAGS);
  sl.AddObject('TBSubMenuSprVus',TBSubMenuSprVus);
  sl.AddObject('TBSubmenuWord',TBSubmenuWord);
  sl.AddObject('TBSubmenuExcel',TBSubmenuExcel);
  sl.AddObject('TBSubMenuBlank',TBSubMenuBlank);
  sl.AddObject('TBSubMenuBlankZags',TBSubMenuBlankZags);
  sl.AddObject('TBSubMenuReports',TBSubMenuReports);
  sl.AddObject('TBSubMenuSprObr',TBSubMenuSprObr);
  sl.AddObject('TBSubmenuSysSpr',TBSubmenuSysSpr);
  sl.AddObject('TBSubmenuAdd',TBSubmenuAdd);
  sl.AddObject('TBSubMenuService',TBSubMenuService);
  sl.AddObject('TBSubmenuAddVigr',TBSubmenuAddVigr);
  sl.AddObject('TBSubmenuDocs',TBSubmenuDocs);   // СМДО
  for m:=0 to sl.Count-1 do begin
    sub:=TTBSubMenuItem(sl.Objects[m]);
    lVisible := false;
    for j:=0 to sub.Count-1 do begin
      if not (sub.Items[j] is TTBSeparatorItem) and  (sub.Items[j].Visible and sub.Items[j].Enabled) then begin
        lVisible:=true;
        break;
      end;
    end;
    if not lVisible then sub.Visible:=lVisible;
    if Sub.Visible then begin
      pt:=Role.EnableMenu(sub.Name);
      if pt=ptDeniedAccess
        then sub.Visible:=false;
    end;
  end;
  sl.Free;
//  if not ( (Role.Status=rsAdmin) or (Role.SystemAdmin=true) ) then begin
//    TBSubmenuAdd.Visible:=false;
//  end;
  {
    lVisible := false;
    for j:=0 to TBSubMenuLich.Count-1 do begin
      if not (TBSubMenuLich.Items[j] is TTBSeparatorItem) and TBSubMenuLich.Items[j].Visible then begin
        lVisible:=true;
        break;
      end;
    end;
    if not lVisible then TBSubMenuLich.Visible:=lVisible;
   }
end;

procedure TfmMain.TBItemOpisTablesClick(Sender: TObject);
begin
  EditOpisTables;
end;

procedure TfmMain.LoadOpisTables;
var
 i:Integer;
 strAdd:String;
begin
  if FileExists(GlobalTask.PathService+'Tables.mtb') then begin
    CopyFile(PChar(GlobalTask.PathService+'Tables.mtb'),
             PChar(GlobalTask.PathService+'Tables.mtb.bak'),false);
  end;
  if FileExists(GlobalTask.PathService+'TablesFields.mtb') then begin
    CopyFile(PChar(GlobalTask.PathService+'TablesFields.mtb'),
             PChar(GlobalTask.PathService+'TablesFields.mtb.bak'),false);
  end;
  try
    mtTables.LoadFromFile(GlobalTask.PathService+'Tables.mtb');
  except
  end;
  try
    mtTablesFields.LoadFromFile(GlobalTask.PathService+'TablesFields.mtb');
  except
  end;
  try
    if FileExists(GlobalTask.PathService+'Actions.mtb')
      then mtActions.LoadFromFile(GlobalTask.PathService+'Actions.mtb');
  except
  end;
  try
    if Role.SystemAdmin then begin
    {
        while not mtActions.Eof do begin
          mtActions.Edit;
          mtActionsNew.AsBoolean:=false;
          mtActions.Post;
          mtActions.Next;
        end;
        mtActions.First;
        }
      {
      if mtActionsTypeObj.AsString='' then begin
        s:=mtActions.IndexName;
        mtActions.IndexName:='';
        mtActions.First;
        sl:=TStringList.Create;
        while not mtActions.Eof do begin
          mtActions.Edit;
          mtActionsTypeObj.AsInteger:=1;
          mtActions.Post;
          if mtActionsClassName.AsString<>'' then begin  // toolbar
            sl.Add('2,'+mtActionsSubSystem.AsString+','+mtActionsClassName.AsString+','+mtActionsName.AsString);
          end;
          if mtActionsTableName.AsString<>'' then begin  // tablename
            sl.Add('3,'+mtActionsSubSystem.AsString+','+mtActionsTableName.AsString+','+mtActionsName.AsString);
          end;
          mtActions.Next;
        end;
        for i:=0 to sl.Count-1 do begin
          mtActions.Append;
          FuncPr.StrToArr(sl.Strings[i],arr,',',false);
          mtActionsTypeObj.AsString:=arr[0];
          mtActionsSubSystem.AsString:=arr[1];
          mtActionsKod.AsString:=arr[2];
          mtActionsName.AsString:=arr[3];
          mtActions.Post;
        end;
        sl.Free;
      end;
      mtActions.IndexName:=s;
      }
      strAdd:='';
      for i:=0 to ActionList.ActionCount-1 do begin
        if not mtActions.Locate('TYPEOBJ;KOD', VarArrayOf([1,ActionList.Actions[i].Name]), [loCaseInsensitive]) then begin
          mtActions.Append;
          mtActionsTypeObj.AsInteger:=1;
          mtActionsSubSystem.AsInteger:=0;
          mtActionsKod.AsString:=ActionList.Actions[i].Name;
          mtActionsNomer.AsInteger:=100;
          mtActionsName.AsString:=TAction(ActionList.Actions[i]).Hint;
          if mtActionsName.AsString=''
            then mtActionsName.AsString:=TAction(ActionList.Actions[i]).Caption;
          mtActions.Post;
          strAdd:=strAdd+ActionList.Actions[i].Name+' '+TAction(ActionList.Actions[i]).Hint+#13#10;
        end;
      end;
      if strAdd<>'' then begin
        ShowMessage(' Добавилиcь акции:'+#13#10+strAdd);
      end;
      mtActions.First;
    end;
  except
  end;
end;

procedure TfmMain.SetUpActionsZAGS;
begin
  TBSubMenuLich.Visible := false;
  TBItem42.Visible      := false;
  TBToolWindowS.Visible := false;
  TBSubmenuZAGS.Caption := 'Дополнительно';
{
  ini := TSasaIniFile.Create(GlobalTask.PathService+'zags.ini');
  sl := TStringList.Create;
  ini.ReadSectionValues('NOT_VISIBLE_ACTIONS', sl);
  for i:=0 to sl.Count-1 do begin
    for j:=0 to ActionList.ActionCount-1 do begin
      if UpperCase(ActionList.Actions[j].Name)=UpperCase(sl.Strings[i]) then begin
        TAction(ActionList.Actions[j]).Visible := false;
      end;
    end;
  end;
  ini.Free;
  sl.Free;
}
end;

function TfmMain.GetCurrentDokument: TDataSet;
begin
  Result := CurDok;
end;

procedure TfmMain.SetCurrentDokument(ds: TDataSet);
begin
  CurDok := ds;
  frCurDok.DataSet := CurDok;
end;

function TfmMain.RunProcScript(strFuncName: String; var vResult : Variant): Boolean;
begin
  //vResult:=null;
  Result:=false;
  if (GlobalTask.Script<>nil) { and not FRun } then begin
//      FRun := true;
    try
      Result := GlobalTask.Script.RunEx(strFuncName,[],vResult);
    finally
//      FRun := false;
    end;
  end;
end;

procedure TfmMain.acFileSvrZAGSExecute(Sender: TObject);
begin
  RunVigrZags(2);
end;

procedure TfmMain.acVigrZAGSExecute(Sender: TObject);
begin
  RunVigrZags(0);
end;

procedure TfmMain.acRunVigrZAHExecute(Sender: TObject);
begin
  RunVigrZags(1);
end;

procedure TfmMain.acLoadZAGSExecute(Sender: TObject);
begin
  RunZagrZags;
end;

procedure TfmMain.acVigrOchExecute(Sender: TObject);
begin
  RunVigrOch(true);
end;

procedure TfmMain.TBItemRegisterProgClick(Sender: TObject);
{$IFDEF SMDO}
var
  CurKey : String;
{$ENDIF}
begin
{$IFDEF SMDO}
  if Smdo.Demo then begin
    if Copy(ReadKeyProg(CurKey,false),1,5)<>'ZGS10' then begin
//    GlobalTask.DemoVersion := true;
    end else begin
      Smdo.Demo:=false;
      WriteKeyProg(CurKey);
      TBItemRegisterProg.Visible:=false;
    end;
  end;
{$ENDIF}
end;
//------------------------------------------------------------------------------
{$IFDEF USE_TEMPLATE}
procedure TfmMain.SetTemplateInterface(const Value: TTemplateInterface);
begin
  FTemplateInterface := Value;
end;
{$ENDIF}
//------------------------------------------------------------------------------
procedure TfmMain.acAddReportZAGSExecute(Sender: TObject);
begin
//  ShowMessage( IntToStr(GlobalTask.CountReport('AddReportsZAGS')) );
  if Role.SystemAdmin
    then VisibleButtonDesignInChoice:=true;
  GlobalTask.PreViewReport('AddReportsZAGS_SS');
  VisibleButtonDesignInChoice:=false;
end;
//------------------------------------------------------------------------------
procedure TfmMain.acAddReportPUExecute(Sender: TObject);
begin
  if Role.SystemAdmin
    then VisibleButtonDesignInChoice:=true;
  GlobalTask.PreViewReport('AddReportsPU');
  VisibleButtonDesignInChoice:=false;
end;
//------------------------------------------------------------------------------
procedure TfmMain.acPackBaseExecute(Sender: TObject);
var
  lErr : Boolean;
begin
  FRunAddMenu:=true;
  SetRole;
  try
  if Problem('  Выполнить сжатие базы ?  ') then begin
    lErr := false;
    {$IFDEF ZAGS}
      try
        dmBase.tbZapisBrak.Active:=false;
        dmBase.tbZapisBrak.Exclusive:=true;
        dmBase.tbZapisBrak.Open;
      except
        lErr := true;
        PutError(' Невозможно заблокировать базу для операции сжатия ! ');
      end;
      dmBase.tbZapisBrak.Active:=false;
      dmBase.tbZapisBrak.Exclusive:=false;
      dmBase.tbZapisBrak.Open;
    {$ELSE}
      try
        dmBase.tbLich.Active:=false;
        dmBase.tbLich.Exclusive:=true;
        dmBase.tbLich.Open;
      except
        lErr := true;
        PutError(' Невозможно заблокировать базу для операции сжатия ! ');
      end;
      dmBase.tbLich.Active:=false;
      dmBase.tbLich.Exclusive:=false;
      dmBase.tbLich.Open;
    {$ENDIF}
    if not lErr then begin
      dmBase.PackBase(false,true);
    end;
  end;
  finally
    FRunAddMenu:=false;
    SetRole;
  end;
end;

procedure TfmMain.acReindexBaseExecute(Sender: TObject);
var
  lErr : Boolean;
begin
  dmBase.CloseBase;
  lErr := false;
  {$IFDEF ZAGS}
    try
      dmBase.tbZapisBrak.Exclusive:=true;
      dmBase.tbZapisBrak.Open;
    except
      lErr := true;
      PutError(' Невозможно заблокировать базу для операции индексации ! ');
    end;
    dmBase.tbZapisBrak.Active:=false;
    dmBase.tbZapisBrak.Exclusive:=false;
  {$ELSE}
    try
      dmBase.tbLich.Exclusive:=true;
      dmBase.tbLich.Open;
    except
      lErr := true;
      PutError(' Невозможно заблокировать базу для операции индексации ! ');
    end;
    dmBase.tbLich.Active:=false;
    dmBase.tbLich.Exclusive:=false;
  {$ENDIF}
  if not lErr then begin
//    dmBase.PackBase(true,true);
    DeleteFiles(CheckSleshN(dmBase.GetPathConnect)+ '*.adi');
  end;
  if not dmBase.OpenBase then begin
    Application.Terminate;
  end;
end;

procedure TfmMain.TBItemLoadLicClick(Sender: TObject);
var
  strBase, strDir : String;
begin
 FRunAddMenu:=true;
 SetRole;             
 try
 strDir := '';
 if SelectDirectory('Выберите папку c загружаемыми данными', '', strDir) then begin
   strBase := CheckSleshN(strDir) + NAME_DICT;
   if dmBase.IsDirBase( strBase, 0 ) then begin
     dmBase.LoadLichSchet(strBase);
   end else begin
     PutError(' Выбранная папка не является папкой с данными. ')
   end;
 end;
 finally
   FRunAddMenu:=false;
   SetRole;
 end;
end;

procedure TfmMain.acExceptFIOExecute(Sender: TObject);
begin
  EditExceptionsPadeg;
end;

procedure TfmMain.acSprIzbUchExecute(Sender: TObject);
var
  Param : TParamsEditSpr;
begin
  Param := TParamsEditSpr.Create;
  Param.OnEditRecord   := OnEditRecord_IzbUch;
  Param.OnBeforeDelete := OnBeforeDelete_IzbUch;
  Param.OnGetCellParams := OnGetCellParams_IzbUch;
//  Param.Col1 := 'POL';
//  Param.GetCellParams_Col1 := RodsName_GridGetCellParams1;
  GlobalTask.EditSpr('EDIT_IZBUCH',Param);
end;
procedure TfmMain.OnGetCellParams_IzbUch(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  ds:TDataSet;
begin
  ds:=Column.Field.DataSet;
  if ds.FieldByName('ACTIVE').AsBoolean then begin
    Afont.Style:=Afont.Style+[fsBold];
//    Background:=clInfoBk;
  end
end;
procedure TfmMain.OnBeforeDelete_IzbUch(Grid: TSasaDbGrid; var lDel: Boolean);
var
  ds : TDataSet;
begin
//  ShowMessage(' перед удалением изб. участка ');
  ds := Grid.DataSource.DataSet;
  if not ds.FieldByName('ID').IsNull then begin
    dmBase.SprIzbUch2.IndexName := 'PR_KEY';
    dmBase.SprIzbUch2.SetRange([ds.FieldByName('ID').AsInteger],[ds.FieldByName('ID').AsInteger]);
    try
      while not dmBase.SprIzbUch2.Eof do dmBase.SprIzbUch2.Delete;
    finally
      dmBase.SprIzbUch2.CancelRange;
    end;
  end;
  lDel := true;
end;

procedure TfmMain.OnEditRecord_IzbUch(Grid: TSasaDbGrid; lAdd: Boolean;
     Ic: TIcon);
var
  f : TfmIzbUch;
begin
  f := TfmIzbUch.Create(nil);
  dmBase.LookupPunkt.First;
  while not dmBase.LookupPunkt.Eof do begin
    f.cbPunkts.Items.Add(dmBase.LookupPunkt.FieldByName('NAME').AsString);
    f.FKeyItems.Add(dmBase.LookupPunkt.FieldByName('ID').AsString);
    dmBase.LookupPunkt.Next;
  end;
  dmBase.LookupPunkt.First;
  try
    f.EditRecord(Grid.DataSource.DataSet, lAdd);
  finally
    f.Free;
  end;
end;

procedure TfmMain.UpdateActions;
begin
  inherited;
//  if ListGurnal.Count=0 then begin
//    if acBackup.En
//  end else begin
//  end;
end;

procedure TfmMain.acRunObrabExecute(Sender: TObject);
begin
  FRunAddMenu:=true;
  SetRole;
  try
    RunObrab;
  finally
    FRunAddMenu:=false;
    SetRole;
  end;
end;

procedure TfmMain.acPropHouseExecute(Sender: TObject);
var
  opSpr : TSprItem;
  op : TOpisEdit;
begin
  CreateAddPriznaki('Признаки жилья', 'KEY_TYPE_HOUSE_CONST', 'KEY_TYPE_HOUSE',
                  dmBase.SprPropHouse, 100, false);
  opSpr := FFltSprList.ByName('KEY_TYPE_HOUSE');
  op := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPE_HOUSE');
  opSpr.KeyList.Assign( op.KeyList );
  opSpr.NameList.Assign( op.Items );
end;

procedure TfmMain.acRunAutoRestoreExecute(Sender: TObject);
begin
  FRunAddMenu:=true;
  SetRole;
  try
    RunAutoRestore;
  finally
    FRunAddMenu:=false;
    SetRole;
  end;
end;

procedure TfmMain.FormActivate(Sender: TObject);
var
  lShow, lPath : Boolean;
  cur:TCursor;
  s,strErr,sUpd:String;
  dMax:TDateTime;
begin
  if not FRunActivate then begin
//    pn.Visible:=true;

    Application.ProcessMessages;
    if dmBase.LastDatabaseError=0 then begin
      fmMain.RunAutoBackup;
    end;
    Application.ProcessMessages;

    if dmBase.LastDatabaseError=0 then begin
      // показать окно с невыполнеными обращениями граждан
      {$IFDEF OBR_GRAG}
      DocRecord.ShowInfoWin;
      {$ENDIF}
      {$IFDEF SMDO}
        if SMDOEnabled and acSMDOPost.Visible and  acSMDOPost.Enabled then begin
          SMDOReceive(true,true,true,0);
        end;
      {$ENDIF}
    end;
         
    FRunActivate := true;
//    CheckAndRunSprSMDO;

    {$IFDEF UPDATE_SYNA}
      if Globaltask.ParamAsBoolean('CHECK_UPDATE') then begin
        PostMessage(Handle,WM_CHECKUPDATE,0,0);
        {
        oUpdate:=TSynapseObj.Create(pn);
        oUpdate.FCheckMessages:=true;
        oUpdate.FCheckSpr:=Globaltask.ParamAsBoolean('SMDO_NSI_CH');
        oUpdate.FThread:=true;
        if oUpdate.CheckUpdate then begin
          AddNotifyProg(fmMain, 'Доступно обновление программы № '+IntToStr(oUpdate.FUpdate), false, true,0,0);
        end;
        if oUpdate.FDateSprOrgSMDO>0 then begin
          dMax:=getMaxCreateDateSpr('smdosprorg'); // default 'smdosprorg'
          dMax:=Max(dMax, GlobalTask.GetLastValueAsDate('LAST_UPDATE_SPRORG',false));
          if oUpdate.FDateSprOrgSMDO>dMax then
            AddNotifyProg(fmMain, 'Доступно обновление справочника организаций СМДО от '+FormatDateTime('dd.mm.yyyy г.',oUpdate.FDateSprOrgSMDO), false, true,0,0);
        end;
        if oUpdate.FDateSprVidDokSMDO>0 then begin
          dMax:=getMaxCreateDateSpr('smdosprviddok'); // default 'smdosprorg'
          dMax:=Max(dMax, GlobalTask.GetLastValueAsDate('LAST_UPDATE_SPRVIDDOK',false));
          if oUpdate.FDateSprVidDokSMDO>dMax then
            AddNotifyProg(fmMain, 'Доступно обновление справочника видов документов СМДО от '+FormatDateTime('dd.mm.yyyy г.',oUpdate.FDateSprVidDokSMDO), false, true,0,0);
        end;
        if oUpdate.FMessages<>''
          then CheckMessagesProg(oUpdate.FMessages);
        }
      end;
    {$ELSE}
      s:='?';
      sUpd:=CheckUpdate(IdFTP1, false, false, 0, false, s, lPath);
      if sUpd<>'' then begin
        AddNotifyProg(fmMain, 'Доступно обновление программы № '+sUpd+#13#10+'(Сервис->Дополнительно->Скачать обновление программы)', false, true,0,0);
  //      ShowMessage('Доступно обновление программы № '+sUpd)
      end;
      if s<>'' then begin
        MessagesProg:=s;  // !!!
        CheckMessagesProg(MessagesProg);  // !!!   обработка сообщений из файла messages
      end;
    {$ENDIF}
    if dmBase.LastDatabaseError=0 then begin
      if TBItemBackup.Enabled then begin
        dMax:=GlobalTask.GetLastValueAsDate('LAST_BACKUP_COPY', false);
        if (dMax=0) then begin
          dMax:=Date;
          GlobalTask.SetLastValueAsDate('LAST_BACKUP_COPY', dMax);
        end;
        if (IncMonth(Date,-1)>dMax) then begin
          AddNotifyProg(fmMain, 'Выполните резервную копию базы', false, true,0,0);
        end;  
      end;
      {$IFDEF LAIS}
      if GlobalTask.ParamAsBoolean('HINT_NEW_SOST') then begin
        lShow:=false;
        if FormatDateTime('mm',Date)='01' then begin
          dmBase.WorkQuery.SQL.Text := 'SELECT date_fiks FROM ДатыФиксации WHERE Year(date_fiks)='+FormatDateTime('yyyy',Date);
          dmBase.WorkQuery.Open;
          if dmBase.WorkQuery.Eof then lShow:=true;
          dmBase.WorkQuery.Close;
        end;
        if dmBase.IsMainComputer and not dmBase.tbLich.Eof and lShow then begin
          ShowMessage('  Не забудьте в январе создать состояние базы.  '); //#13'После создания всех '); !!!
        end;
      end;
      {$ENDIF}
      if IsActiveGISUN and not Role.SystemAdmin then begin
        if dmBase.GetCountIN <= 3 then begin
          AddNotifyProg(fmMain, 'Зарезервируйте идентификационные номера для записей актов о рождении', false, true,0,0);
//          ShowMessage('');
          acQueryListINExecute(nil);
        end;
      end;
    end;
  end;
end;

procedure TfmMain.acShablonExecute(Sender: TObject);
begin
  EditShablon;
end;

procedure TfmMain.acReSvidZAGSExecute(Sender: TObject);
begin
  ShowTableGurnal(TfmListSvid, 'fmListSvid');
end;

procedure TfmMain.acAlfavitZAGSExecute(Sender: TObject);
begin
//  ShowTableGurnal(TfmAlfavitZAGS, 'fmAlfavitZAGS');
end;


procedure TfmMain.acProvSvidZAGSExecute(Sender: TObject);
var
  f : TfmParamQuest;
  n  : Integer;
  d1,d2 : TDateTime;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите значения';
//  f.StepY:=17;
//  f.Flat:=false;
  f.AddParamEx(Now, 'Начальная дата' , 'DATE1','');
  f.AddParamEx(Now, 'Конечная дата' , 'DATE2','');
  f.AddButtons('Выполнить~Отказ',0);
  n := f.ShowQuest;
  d1 := f.GetValue('DATE1','D');
  d2 := f.GetValue('DATE2','D');
  f.Free;
  if (n=1) and (d1>0) and (d2>0) then begin
     dmBase.CheckAllSvid(d1,d2);
  end;
end;

function TfmMain.ChoiceZAGS(strSearch : String; var nID : Integer ) : Boolean;
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Result := false;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_NAMEORG');
  if Opis<>nil then begin
    v := null;
    if nID>0 then v:=nID;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      Result := true;
      nID := v;
    end;
  end;
end;

procedure TfmMain.acWordShtampExecute(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('shtamp.doc')), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmMain.acWordShtampBelExecute(Sender: TObject);
begin
  if not FileExists(NameFromExe('shtamp-bel.doc')) and FileExists(NameFromExe('shtamp.doc'))
    then CopyFile(PChar(NameFromExe('shtamp.doc')), PChar(NameFromExe('shtamp-bel.doc')), false);
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('shtamp-bel.doc')), nil, nil, SW_SHOWNORMAL);
end;


procedure TfmMain.TBItemNewClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Доработки ЛАИС.doc')), nil, nil, SW_SHOWNORMAL);
end;
procedure TfmMain.TBItemNew2Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Письмо в ответ на.doc')), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmMain.TBItemOpenDokClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Руководство пользователя ЛАИС.doc')), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmMain.acGerbShampExecute(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('shtamp_gerb.doc')), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmMain.acViewLogFileExecute(Sender: TObject);
begin
  ViewDOSFileEx( NameFromExe('Work\LogFile.txt'), false, 'Просмотр Log-файла' );
end;

function TfmMain.GetAllListNamesForFilter: String;
var
  s : String;
begin
  Result := '';
  mtTablesFields.First;
  while not mtTablesFields.Eof do begin
    s := UpperCase(Trim(mtTablesFieldsSpr_Filter.asString));
    if (s<>'') and (Copy(s,1,4)='KEY_') then begin
      if Pos(s+';',Result) = 0 then begin
        Result := Result + s + ';';
      end;
    end;
    mtTablesFields.Next;
  end;
  mtTablesFields.First;
  dmBase.SprProperty.First;
  with dmBase.SprProperty do begin
    while not Eof do begin
      s := UpperCase(Trim(FieldByName('OPISEDIT').asString));
      if (s<>'') and (Copy(s,1,4)='KEY_') then begin
        if Pos(s+';',Result) = 0 then begin
          Result := Result + s + ';';
        end;
      end;
      Next;
    end;
    First;
  end;
end;

function TfmMain.GetAllLookupNamesForFilter: String;
var
  s : String;
begin
  Result := '';
  mtTablesFields.First;
  while not mtTablesFields.Eof do begin
    s := UpperCase(Trim(mtTablesFieldsSpr_Filter.asString));
    if (s<>'') and (Copy(s,1,7)='LOOKUP_') then begin
      if Pos(s+';',Result) = 0 then begin
        Result := Result + mtTablesFieldsSpr_Filter.AsString+';';
      end;
    end;
    mtTablesFields.Next;
  end;
  mtTablesFields.First;
  dmBase.SprProperty.First;
  with dmBase.SprProperty do begin
    while not Eof do begin
      s := UpperCase(Trim(FieldByName('OPISEDIT').asString));
      if (s<>'') and (Copy(s,1,7)='LOOKUP_') then begin
        if Pos(s+';',Result) = 0 then begin
          Result := Result + s + ';';
        end;
      end;
      Next;
    end;
    First;
  end;
end;

procedure TfmMain.acObrachExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    DocRecord.EditDoc;
  {$ENDIF}
end;
//----------- справочники по обращениям граждан -------------
procedure TfmMain.acSprDocFolderExecute(Sender: TObject);
begin
  //Globaltask.EditSpr('EDIT_SPRDOCFOLDER', nil);
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_FOLDER');
  {$ENDIF}
end;

procedure TfmMain.acSprDocAdmProcExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_ADMPROC');
  {$ENDIF}
end;
//--------------------------------------------------
procedure TfmMain.acSprDocOfficialExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  EditSprDocOfficial;
  {$IFDEF OBR_GRAG}
    DocRecord.UpdateSpr('SP_OFFICIAL');
  {$ENDIF}

//  {$IFDEF OBR_GRAG}
//    DocRecord.EditSpr('SP_OFFICIAL');
//  {$ENDIF}
end;
{
procedure TfmMain.SprDocOfficial_DataChange( Field : TField; Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
var
  sFIO,sPost:String;
begin
  if (Field.FieldName='POST') or (Field.FieldName='FIO') then begin
    sFIO:=Field.DataSet.FieldByName('FIO').AsString;
    sPost:=Field.DataSet.FieldByName('POST').AsString;
    if (sFIO<>'') and (sPost<>'')
      then  Field.DataSet.FieldByName('NAME').AsString:=sFIO+' - '+sPost;
  end;
end;
procedure TfmMain.SprDocOfficial_NewRecord(DataSet: TDataSet);
var
  n:Integer;
begin
  dmbase.WorkQuery.SQL.Text:='SELECT MAX(N_ORDER) FROM SprDocOfficial';
  dmbase.WorkQuery.Open;
  n:=dmbase.WorkQuery.Fields[0].AsInteger+1;
  dmbase.WorkQuery.Close;
  DataSet.FieldByName('N_ORDER').AsInteger:=n;
end;
}
//--------------------------------------------------
procedure TfmMain.acSprDocFileListExecute(Sender: TObject);
begin
  //Globaltask.EditSpr('EDIT_SPRDOCFILELIST', nil);
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_FILELIST');
  {$ENDIF}
end;

procedure TfmMain.acSprDocSubjExecute(Sender: TObject);
begin
  //Globaltask.EditSpr('EDIT_SPRDOCSUBJ', nil);
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_SUBJ');
  {$ENDIF}
end;

procedure TfmMain.acSprDocSubjGExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    if dmBase._LockTypeObj(_TypeObj_SprDocSubjG_,'Другой пользователь корректирует классификатор ...') then begin
      try
        DocRecord.EditSpr('SP_SUBJG');
      finally
        dmBase._UnLockTypeObj(_TypeObj_SprDocSubjG_);
      end;
    end;
  {$ENDIF}
end;

procedure TfmMain.acSprDocManGroupExecute(Sender: TObject);
begin
  //Globaltask.EditSpr('EDIT_SPRDOCMAN', nil);
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_MANGROUP');
  {$ENDIF}
end;
//-----------------------------------------------------------

procedure TfmMain.TBItem116Click(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
  DocRecord.EditMeta;
  {$ENDIF}
end;

procedure TfmMain.acPriemGrExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
  DocRecord.EditVisitBook;
  {$ENDIF}
end;

procedure TfmMain.acVigrBelGosStraxExecute(Sender: TObject);
var
  v : Variant;
begin
  v:=null;
  if (GlobalTask.Script<>nil) then begin
    GlobalTask.Script.RunEx('Death2BelGosStrah',[],v);
  end;
//  RunProcScript('Death2BelGosStrah',v);
end;

procedure TfmMain.acVigrStatExecute(Sender: TObject);
var
  fmParam:TfmParamQuest;
  n:Integer;
  sPath,sFileName1,sFileName2:String;
  par:TXMLParams;
begin
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='Параметры';
  fmParam.AddParamEx(MonthOf(Now), 'Месяц' , 'MONTH' ,'TYPE=MONTH');
  fmParam.AddParamEx(YearOf(Now), 'Год' , 'GOD' ,'TYPE=LIST~DESC=KEY_YEARS');
  fmParam.AddButtons('Выполнить~Отказ',0);
  n:=fmParam.ShowQuest;
  if n=1 then begin
    par.Connection:=dmBase.AdsConnection;
    par.Year:=fmParam.GetValueN(1);
    par.Month:=fmParam.GetValueN(0);
    par.Name:=GlobalTask.ParamAsString('NAME');
    par.Soato:=GlobalTask.ParamAsString('KOD');
    par.PathReport:=GetFullNameReport('&zags2stat.fr3');
    sFileName1:='ST'+Copy(GlobalTask.ParamAsString('KOD'),1,4)+'_'+
               IntToStr(par.Year)+'_'+PadLstr(IntTostr(par.Month),2,'0')+'.xml';
    sFileName2:='ST'+Copy(GlobalTask.ParamAsString('KOD'),1,4)+'_'+
               IntToStr(par.Year)+'_'+PadLstr(IntTostr(par.Month),2,'0')+'.pdf';
    sPath:=GetFolderMyDocument+'\Выгрузка в статистику';
    par.PathXml:=sPath+'\'+sFileName1;
    if ForceDirectories(sPath) then begin
      DeleteFiles(sPath+'\*.*');
      if EDN2Xml([tbBirth,tbMarriages,tbDeath],par) then begin
//        ShowMessage('Сформированные файлы находиться в папке "Мои документы\Статистика":'+#13#10+sFileName1+#13#10+sFileName2);
        ShellExecute(0,'explore',PChar(sPath),nil,nil,SW_SHOWNORMAL);
      end else begin
        Puterror('Ошибка выгрузки');
      end;
    end else begin
      PutError('Ошибка сздания папки:'+sPath);
    end;
  end;
  fmParam.Free;
end;

procedure TfmMain.acUnionBaseExecute(Sender: TObject);
begin
  FRunAddMenu:=true;
  SetRole;
  try
    LoadLic;
  finally
    FRunAddMenu:=false;
    SetRole;
  end;
end;

procedure TfmMain.TBItemViewFileClick(Sender: TObject);
begin
  dmBase.ShowProtokolExecute;
end;


procedure TfmMain.acSprDocGroupExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_DOCGROUP');
  {$ENDIF}
end;

procedure TfmMain.acSetShareExecute(Sender: TObject);
var
  sName,sPath : String;
begin
  sName:=GetNameSharedFolder(sPath);
//  DSiUnShareFolder(sName);
{
    ACCESS_READ   — доступ на чтение;
    ACCESS_WRITE  — доступ на запись;
    ACCESS_CREATE — доступ на создание;
    ACCESS_EXEC   — доступ на выполнение;
    ACCESS_DELETE — доступ на удаление;
    ACCESS_ATRIB  — доступ на изменение атрибутов;
    ACCESSPERM    — доступ на изменение разрешений чтения, записи, создания, выполнения и удаления;
    ACCESS_ALL    — полный доступ;
}
  if DSiShareFolderMy(sPath,sName,'',ACCESS_ALL) then begin
    ShowMessage('Доступ успешно открыт.');
  end else begin
    PutError('Ошибка открытия доступа.');
  end;
end;

procedure TfmMain.acDelShareExecute(Sender: TObject);
var
  sPath,sName : String;
begin
  sName:=GetNameSharedFolder(sPath);
  if DSiUnShareFolder(sName) then begin
    ShowMessage('Доступ успешно закрыт.');
  end else begin
    PutError('Ошибка закрытия доступа.');
  end;
end;

procedure TfmMain.acSetPasswordExecute(Sender: TObject);
var
  f : TfmSetPassword;
begin
  f := TfmSetPassword.Create(nil);
  try
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfmMain.acPermitUsersExecute(Sender: TObject);
begin
  Role.Permit.QueryUsers;
  Role.Permit.Edit;
end;

procedure TfmMain.TBItemPropUsersClick(Sender: TObject);
begin
  EditPropUsers; //then begin
//
//    Gisun.SetParamsGISUN('');
//    end;
//  end;
//  CheckCaptionActiveGisun;
//  SetRole;
end;

procedure TfmMain.TBItemActionsClick(Sender: TObject);
begin
  fmActions:=TfmActions.Create(nil);
  fmActions.Init(ActionList, mtActions);
  try
    if fmActions.ShowModal=mrOk then begin
      mtActions.SaveToFile(GlobalTask.PathService+'Actions.mtb');
    end;
  finally
    fmActions.Free;
  end;
end;

procedure TfmMain.OnExportEditSpr(Sender : TObject);
var
  ExportColumns:TExportColumnList;
begin
  ExportColumns := TExportColumnList.Create;
  FillColumnList2(TfmEditSpr(Sender).Grid, ExportColumns);
  ExportDataSet('Экспорт', TfmEditSpr(Sender).Grid.Datasource.DataSet, efRtf, [], GetFolderMyDocument, False, False, ExportColumns);
  ExportColumns.Free;
end;

// контроль доступности корректировки справочников в зависипости от прав пользователя
// -1 - не определено, 0 - не разрешено, 1 - разрешено
procedure TfmMain.OnCheckEnableEditSpr(Opis: TOpisEdit; var nEnabled: Integer);
var
  strName:String;
  i:Integer;
begin
  if Role.SystemAdmin then begin
    nEnabled:=1;
    exit;
  end;
  if Opis.DataSet<>nil then begin
    if Opis.DataSet is TAdsTable then begin
      strName:= TAdsTable(Opis.DataSet).TableName;
      i:=Pos('.',strName);
      if i>0 then strName := Copy(strName,1,i-1);
      nEnabled:=Role.EnableEditTable(strName, 0);
    end else begin
      strName:= Opis.DataSet.Name;
      nEnabled:=Role.EnableEditTable(strName, 1);
    end;
  end;
end;

procedure TfmMain.TBItemSeekClick(Sender: TObject);
begin
  if TBItemSeek.Visible then begin
    ShowSeekMenGurnal('');
  end;  
end;

procedure TfmMain.ShowSeekMenGurnal(strName : String);
var
  i : Integer;
  Gurnal : TfmSimpleSeek;
begin
 Gurnal:=TfmSimpleSeek.Create(Self);
 Gurnal.ShowModal;
 Gurnal.Free;

 {
  Gurnal := nil;
  strName := ANSIUpperCase(Trim(strName));
  for i:=0 to ListGurnal.Count-1 do begin
    if ListGurnal.Objects[i] is TfmSeekAkt and
       (ListGurnal.Strings[i] = strName) then begin
      Gurnal := TfmSeekMen(ListGurnal.Objects[i]);
      break;
    end;
  end;
  if Gurnal = nil then begin
    Gurnal:=TfmSeekMen.Create(Self);
    Gurnal.Name:=strName;
    ListGurnal.AddObject(strName, Gurnal);
  end;
  if Gurnal<>nil then begin
    Gurnal.BringToFront;
    Gurnal.Show;
    SetRole;
  end;
  }
end;

procedure TfmMain.acUchSpravExecute(Sender: TObject);
begin
 {$IFDEF OBR_GRAG}
   DocRecord.EditInfoBook;
 {$ENDIF}
end;

procedure TfmMain.acVxodDokumExecute(Sender: TObject);
begin
 {$IFDEF OBR_GRAG}
   DocRecord.EditIncoming;
 {$ENDIF}
end;

procedure TfmMain.acIsxDokumExecute(Sender: TObject);
begin
 {$IFDEF OBR_GRAG}
   DocRecord.EditOutgoing;
 {$ENDIF}
end;

procedure TfmMain.acAdminProcedurExecute(Sender: TObject);
begin
 {$IFDEF OBR_GRAG}
   DocRecord.EditAdmProc;
 {$ENDIF}
end;

procedure TfmMain.acLoadMRUListZAGSExecute(Sender: TObject);
begin
  OpenMessage('Формирование списка мужских имен ...    ','',10);
  try
    GetMRUList_NameM(true);
    ChangeMessage('Формирование списка женских имен ...');
    GetMRUList_NameG(true);
    ChangeMessage('Формирование списка мужских отчеств ...');
    GetMRUList_OtchM(true);
    ChangeMessage('Формирование списка женских отчеств ...');
    GetMRUList_OtchG(true);
  finally
    CloseMessage;
  end;
end;

procedure TfmMain.acVigrRIAPExecute(Sender: TObject);
var
  tb:TAdsTable;
  s,sDir:String;
  lChoicePath:Boolean;
begin
  if GlobalTask.ParamAsBoolean('VIGR_LAIS') then begin
    s:='riap';
  end else begin
    s:='';
  end;
// s:='brest'  // для теста
  sDir:=Trim(GlobalTask.ParamAsString('PATH_VIGR_RIAP'));
  if sDir='' then begin
    lChoicePath:=true;
//    sDir:='&PATH_VIGR_RIAP';
  end else begin
    lChoicePath:=false;
  end;
  dmBase.AnyExport('Выгрузка для портала РИАП     ...','&Vigr_Lais',true,lChoicePath,sDir,s);
end;

procedure TfmMain.acViewVigrRIAPExecute(Sender: TObject);
begin
  Globaltask.EditSpr('EDIT_JURNOPER', nil);
end;

procedure TfmMain.acDeclareRegistrExecute(Sender: TObject);
begin
  fmDeclRegistr := TfmDeclRegistr.Create(nil);
  try
    fmDeclRegistr.NewDok(true);
    fmDeclRegistr.EditModal;
  finally
    fmDeclRegistr.Free;
    fmDeclRegistr := nil;
  end;
end;

//----------------------------------------------------------------------------------
//         FTP
//----------------------------------------------------------------------------------
function TfmMain.PutFileFTP(lShow:Boolean; strFileName:String;strDir:String):Boolean;
var
  s:String;
  cur:TCursor;
begin
  Result:=false;
  if strDir='' then begin
    strDir:=DirFTP; //'/WWW/bases';
  end;
  s:=GetNameServerFTP(TypeServerFTP);
  if s='' then s:=IdFTP1.Host;

  with IdFTP1 do begin
    try
      if lShow then OpenMessage('Подключение к серверу '+s,'',10);
      Connect;
      if lShow then CloseMessage;
    except
      on E: Exception do begin          // # 11001 Host not found
        if lShow then CloseMessage;
        cur:=Screen.Cursor;
        Screen.Cursor:=crDefault;
        PutError(s+chr(13)+chr(10)+E.Message);
        Screen.Cursor:=cur;
      end;
    end;
  end;

  if not IdFTP1.Connected then exit;

  try
    if strDir<>'' then IdFTP1.ChangeDir(strDir);
    IdFTP1.Put( strFileName, ExtractFileName(strFileName) );
    Result:=true;
  except
    on E: EIdNotConnected do begin
      cur:=Screen.Cursor;
      Screen.Cursor:=crDefault;
      ShowMessage('Загрузка прервана.');
      Screen.Cursor:=cur;
    end;
    on E:Exception do begin
      cur:=Screen.Cursor;
      Screen.Cursor:=crDefault;
      PutError(s+chr(13)+chr(10)+E.Message);
      Screen.Cursor:=cur;
    end;
  end;
  if IdFTP1.Connected then IdFTP1.Disconnect;
end;

{
function TfmMain.ChoiceFileFTP:String;
begin
  IdFTP1.Connect;
  // ...    выбор файла
end;
}
{
function TfmMain.GetFileFTP(lShow:Boolean; lCheck:Boolean; strFileName:String; strOutputDir:String; lDeleteFile:Boolean):Boolean;
var
  cur:TCursor;
  LS:TStringList;
  s,sErr:String;
  n,nTask,nErrCode:Integer;
  lErr:Boolean;
begin
  Result:=false;
  s:=GetNameServerFTP(TypeServerFTP);
  if s='' then s:=IdFTP1.Host;
  sErr:='';
  IdAntiFreeze1.Active:=false;
  if lShow
    then OpenMessage('Подключение к серверу '+s,'',10);
  n:=1;
  nErrCode:=0;
  while n=1 do begin
    if (nErrCode=421) then n:=2;  //  по второму разу
    lErr:=false;
    nErrCode:=0;
    sErr:='';
    with IdFTP1 do begin
      try
        Connect;
      except
        on E: EIdProtocolReplyError do begin
          nErrCode:=EIdProtocolReplyError(E).ReplyErrorCode; // 421
         // sErr:=StringReplace(E.Message, chr(13)+chr(10), ', ', [rfReplaceAll]);
          sErr:='Слишком много подключений. Попробуйте позже.';
          if RightStr(sErr,2)=', ' then sErr:=Copy(sErr,1,Length(sErr)-2);
          lErr:=true;
        end;
        on E: EIdSocketError do begin
          nErrCode:=EIdSocketError(E).LastError;
          sErr:=E.Message;
          lErr:=true;
        end;
        on E: Exception do begin          // # 11001 Host not found
          sErr:=E.Message;
          lErr:=true;
        end;
      end;
      if (nErrCode=421) and (n=1) then begin
        Sleep(2000);  // подожмем 2 секунды
      end else begin
        n:=2;
      end;
    end;
    if lErr then GlobalTask.LogFile.WriteToLogFile('Ошибка подключения к серверу обновлений '+IdFTP1.Host+'   ['+IntToStr(nErrCode)+'] '+sErr);
  end;

  if lShow
    then CloseMessage;
  if (sErr<>'') and lCheck then begin
//    if (nErrCode<>421) and lCheck then begin
    cur:=Screen.Cursor;
    Screen.Cursor:=crDefault;
    PutError(s+chr(13)+chr(10)+'['+IntToStr(nErrCode)+'] '+sErr);
    Screen.Cursor:=cur;
//    end;
  end;
  if not IdFTP1.Connected then exit;

  try
    if DirFTP<>'' then begin
      try
        IdFTP1.ChangeDir(DirFTP);
      except
        on E: Exception do begin
          cur:=Screen.Cursor;
          Screen.Cursor:=crDefault;
          PutError(s+chr(13)+chr(10)+E.Message);
          Screen.Cursor:=cur;
          if IdFTP1.Connected
            then IdFTP1.Disconnect;
          exit;
        end;
      end;
    end;
  //  IdFTP1.TransferType := ftASCII;
    LS:=TStringList.Create;
    IdFTP1.List(LS);
    LS.Free;
        
    //IdFTP1.TransferType := ftBinary;
    if strFileName='' then begin   // запрошен список файлов
      Result:=true;
    end else begin
      BytesToTransfer := IdFTP1.Size(strFileName);
      if strOutputDir<>'' then begin
        ForceDirectories(strOutputDir);
        strOutPutDir:=CheckSleshN(strOutPutDir);
      end;
      if FileExists(strOutPutDir+strFileName) then begin
        DeleteFile(strOutPutDir+strFileName);
      end;
      try
//        IdAntiFreeze1.Active:=true;
        nTask:=EnterWorkerThread;
        try
          IdFTP1.Get(strFileName, strOutPutDir+strFileName, false);
//          EnterMainThread;
//          try
//            fmMain.CheckVisibleGIF(false,'');
//          finally
//            LeaveMainThread;
//          end;
        finally
          LeaveWorkerThread;
        end;
        if FileExists(strOutPutDir+strFileName) then begin
          if lDeleteFile
            then IdFTP1.Delete(strFileName);
          Result:=true;
        end;
      except
        on E: EIdNotConnected do begin
          cur:=Screen.Cursor;
          Screen.Cursor:=crDefault;
          ShowMessage('Загрузка прервана.');
          Screen.Cursor:=cur;
        end;
        on E:Exception do begin
          cur:=Screen.Cursor;
          Screen.Cursor:=crDefault;
          PutError(E.Message);
          Screen.Cursor:=cur;
        end;
      end;
    end;
  finally
    IdAntiFreeze1.Active:=false;
    if IdFTP1.Connected
      then IdFTP1.Disconnect;
  end;

end;
}
procedure TfmMain.IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;  const AStatusText: String);
begin
//  DebugListBox.ItemIndex := DebugListBox.Items.Add(asStatusText);
//  StatusBar1.Panels[1].Text := asStatusText;
end;

//-----------------------------------------------
procedure TfmMain.IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  TransferrignData := true;
//  AbortButton.Visible := true;
  AbortTransfer := false;
  STime := Now;
  if AWorkCountMax > 0
    then pb.Max := AWorkCountMax
    else pb.Max := BytesToTransfer;
  AverageSpeed := 0;
end;

//-----------------------------------------------
procedure TfmMain.IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
//  AbortButton.Visible := false;
//  SB.Panels[1].Text := 'Загрузка окончена.';
  BytesToTransfer := 0;
  TransferrignData := false;
  if not IdFTP1.Connected
    then pb.Position := 0
    else pb.Position := pb.max;  //0
  AverageSpeed := 0;
end;

//-----------------------------------------------
procedure TfmMain.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
Var
  S: String;
  TotalTime: TDateTime;
//  RemainingTime: TDateTime;
  H, M, Sec, MS: Word;
  DLTime: Double;
begin
  TotalTime :=  Now - STime;
  DecodeTime(TotalTime, H, M, Sec, MS);
  Sec := Sec + M * 60 + H * 3600;
  DLTime := Sec + MS / 1000;
  if DLTime > 0 then
    AverageSpeed := {(AverageSpeed + } (AWorkCount / 1024) / DLTime {) / 2};

  {
  if AverageSpeed > 0 then begin
    Sec := Trunc(((PB.Max - AWorkCount) / 1024) / AverageSpeed);

    S := Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);

    S := 'время ' + S;
  end
  else S := '';

  S := FormatFloat('0.00 КБ/сек', AverageSpeed) + '; ' + S;
  case AWorkMode of
    wmRead: SB.Panels[1].Text := '------------------------------------- Скорость загрузки ' + S;
    wmWrite: SB.Panels[1].Text := '---------------------------------------- Скорость загрузки ' + S;
  end;
  }
  if AbortTransfer then begin
    IdFTP1.Disconnect;
    IdFTP1.Abort;
  end;

  PB.Position := AWorkCount;
  //AbortTransfer := false;
end;

//----------------------------------------------------------------------------------
//         FTP  (END)
//----------------------------------------------------------------------------------
{
function TfmMain.SetPropertyFPT(nTypeServerFTP:Integer; strTypeFile:String):Boolean;
var
  rFTP:TPropFTP;
  s:String;
  strUser, strPassword, strCaption:String;
begin
 Result:=true;
 IdFTP1.Disconnect;
 IdFTP1.Port:=21;
// if (TypeServerFTP<>SERVER_BREST) and (TypeServerFTP<>SERVER_RIAP)
//   then TypeServerFTP:=SERVER_BREST;
 rFTP.Ok:=false;
 //------ ВЦ БОУС ------------------------------
 if nTypeServerFTP=SERVER_BREST then begin             // uProjects.pas
   IdFTP1.Host:='vc.brest.by';
   IdFTP1.Username:='vc';
   IdFTP1.Password:=PSW_ADMIN_FTP; //'admin1106';
   if LowerCase(strTypeFile)='update'
     then DirFTP:='/www/vc.brest.by/download'  // uProjects.pas
     else DirFTP:='/www/vc.brest.by/bases';    //'/WWW/bases';
 //------  FTP сурвер НЦЕУ -----------
 end else if nTypeServerFTP=SERVER_NCES_UPD then begin
   IdFTP1.Host:='10.30.254.20';
   IdFTP1.Username:='belstatftpreader'; //'belstatftp';
   IdFTP1.Password:='123o!@#';          //'L0df4!B';
   DirFTP:='lais';  // uProjects.pas
 //------  портал АИС Месные Советы -----------
 end else if nTypeServerFTP=SERVER_RIAP then begin
   if LowerCase(Copy(strTypeFile,1,3))='upd'
     then s:='UPDATE'
     else s:='RIAP_DATA';
   rFTP:=GetPropertyFTP(s);
   if not rFTP.Ok then begin
     rFTP.Ok:=true;
     rFTP.Host:='10.101.1.108';   // msd.by
     rFTP.Port:=21;
     if LowerCase(Copy(strTypeFile,1,3))='upd' then begin
       rFTP.Username:='update';
       rFTP.Password:='zs34@M5';
       rFTP.Dir:='';                           // uProjects.pas
     end else begin
       rFTP.Username:='data';
       rFTP.Password:='up98!zte';
       if LowerCase(Copy(strTypeFile,1,4))='data' then rFTP.Dir:='/bases';
     end;
   end;
 end else if nTypeServerFTP=SERVER_OCHERED then begin
   rFTP:=GetPropertyFTP('OCHERED');
   Result:=rFTP.Ok;
 end else if nTypeServerFTP=SERVER_ZAGS then begin
   rFTP:=GetPropertyFTP('ZAGS');
   Result:=rFTP.Ok;
 end;
 if rFTP.Ok then begin
   TypeServerFTP:=nTypeServerFTP;
   IdFTP1.Port:=rFTP.Port;
   IdFTP1.Host:=rFTP.Host;
   IdFTP1.Username:=rFTP.Username;
   IdFTP1.Passive:=rFTP.Passive;
   if (rFTP.Password='') then begin
     strCaption:='Передача данных';
     strUser:=rFTP.Username;
     strPassword:='';
     if ShowLogon( strUser, strPassword, strCaption, -1,-1, 3, nil) then begin
       IdFTP1.Username:=strUser;
       IdFTP1.Password:=strPassword;
     end else begin
       Result:=false;
     end;
   end else begin
     if (rFTP.Password='*')
       then IdFTP1.Password:=''
       else IdFTP1.Password:=rFTP.Password;
   end;
   DirFTP:=rFTP.Dir;
 end;
end;
 }
//--------------------------------------------------------------------------------
procedure TfmMain.CheckVisibleProgress(lVisible:Boolean; strCaption:String; lCancel:Boolean);
begin
  if lVisible then begin
    pb.parent:=sb;
    pb.Left:=sb.Panels[0].Width+10;
    pb.Top:=2;
    pb.Visible:=true;
    if lCancel then begin
      btCancel.Parent:=sb;
      btCancel.Left:=pb.Left+pb.Width+10;
      btCancel.Top:=2;
      btCancel.Visible:=true;
    end;
    sb.Panels[0].Text:=strCaption;
//    sb.Visible:=true;
    pn.Visible:=true;
    Application.ProcessMessages;
  end else begin
    btCancel.Visible:=false;
    pn.Visible:=false;
//    sb.Visible:=false;
    pb.Visible:=false;
    sb.Panels[0].Text:='';
    Application.ProcessMessages;
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmMain.SetCaptionPanel0(strCaption:String);
begin
  sb.Panels[0].Text:=strCaption;
  Application.ProcessMessages;
end;
//--------------------------------------------------------------------------------
procedure TfmMain.CheckVisibleGIF(lVisible:Boolean; strCaption:String; btVisible:Boolean);
begin
  if lVisible then begin
    GIFAnimator.Parent:=sb;
    GIFAnimator.Left:=sb.Panels[0].Width-40;
    GIFAnimator.Top:=2;
    GIFAnimator.Visible:=true;
    GIFAnimator.Animate:=true;

    if btVisible then begin
      btCancel.Parent:=sb;
      btCancel.Left:=sb.Panels[0].Width+200;
      btCancel.Top:=2;
      btCancel.Visible:=true;
    end;

    sb.Panels[0].Text:=strCaption;
//    sb.Visible:=true;
    pn.Visible:=true;
    Application.ProcessMessages;
  end else begin
    btCancel.Visible:=false;
    pn.Visible:=false;
//    sb.Visible:=false;
    GIFAnimator.Visible:=false;
    GIFAnimator.Animate:=false;
    sb.Panels[0].Text:='';
    Application.ProcessMessages;
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmMain.FileToFTP(nTypeServer:Integer; strFileName:String; lArx:Boolean);
var
  cur:TCursor;
  ftpp:TPropFTP;
  sName,sPath,sPathE,sExt:String;
  n:Integer;
  lOk:Boolean;
begin
  lOk:=false;
  if FileExists(strFileName) then begin
    ftpp:=GetPropertyFTP_ForWrite(nTypeServer, 'data');
    if not ftpp.Ok then begin
      PutError('Ошибка чтения параметров FTP');
    end else begin
      IdFTP1.Host:=ftpp.Host;
      IdFTP1.Port:=ftpp.Port;
      IdFTP1.Username:=ftpp.Username;
      IdFTP1.Password:=ftpp.Password;
      IdFTP1.Passive:=ftpp.Passive;
      DirFTP:=ftpp.Dir;   // '/www/vc.brest.by/download'

      cur:=Screen.Cursor;
    //  Screen.Cursor:=crHourGlass;
      CheckVisibleProgress(true, '');
      Application.ProcessMessages;
      if lArx then begin
        sb.Panels[0].Text:='Архивирование файла...';
//        sb.Panels[1].Text:=strFileName;
        Application.ProcessMessages;
        sExt:=Copy(ExtractFileExt(strFileName),2,10);
        sName:=ExtractFileName(strFileName);
        n:=Pos('.',sName);
        sName:=Copy(sName,1,n-1);
        sPath:=ExtractFilePath(strFileName);
        sPathE:=ExtractFilePath(Application.ExeName)+'Export\';
        ForceDirectories(sPathE);
        ClearDir(sPathE,false);
        Zip.FileName:=sPathE+sExt+'_'+sName+'.zip';
        Zip.BaseDir :=sPath;
        Zip.OpenArchive(fmCreate);
        Zip.AddFiles(sName+'.'+sExt);
        Zip.CloseArchive;
        strFileName:=Zip.FileName;
      end;
      sb.Panels[0].Text:='Передача файла...';
//      sb.Panels[1].Text:=strFileName;
      Application.ProcessMessages;
      lOk:=false;
      try
        lOk:=PutFileFTP(true, strFileName);
      finally
        pb.Visible:=false;
        sb.Panels[0].Text:='';
        sb.Panels[1].Text:='';
        Screen.Cursor:=cur;
        CheckVisibleProgress(false, '');
        Application.ProcessMessages;
      end;
    end;
    if lOk
      then ShowMessage(PadCStr('Файл успешно передан',40,' '));
  end else begin
    PutError('Файл не найден '+strFileName);
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmMain.BaseToFTP;
var
  strPath:String;
  cur:TCursor;
begin
  if dmBase.LockBase then begin
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    CheckVisibleProgress(true, '');
    sb.Panels[0].Text:='Закрытие базы...';
    Application.ProcessMessages;
    dmBase.CloseBase;
    sb.Panels[0].Text:='Архивирование...';
    Application.ProcessMessages;

    strPath := ExtractFilePath(Application.ExeName)+'Export\';
    ForceDirectories(strPath);
    ClearDir(strPath,false);
    Zip.FileName := strPath+'data_'+IntToStr(GlobalTask.ParamasInteger('ID'))+'.zip';
    Zip.BaseDir  := dmBase.GetPathConnect;
    Zip.OpenArchive(fmCreate);
    Zip.AddFiles('*.*');
    Zip.CloseArchive;

  //  n := GetFileSize(Zip.FileName);

    sb.Panels[0].Text:='Передача файла...';
    Application.ProcessMessages;
    try
      PutFileFTP(true, Zip.FileName);
    finally
      pb.Visible:=false;
      Application.ProcessMessages;
      ClearDir(strPath,false);
      sb.Panels[0].Text:='Открытие базы...';
      Application.ProcessMessages;
      dmBase.OpenBase;
      Screen.Cursor:=cur;
      CheckVisibleProgress(false, '');
//    btFTP.Enabled:=true;
//    pb.Visible:=false;
    end;
  end else begin
    PutError('Невозможно заблокировать базу для проведения операции.');
  end;
end;

procedure TfmMain.BaseToArxiv;
var
  strPath:String;
  cur:TCursor;
begin
  if dmBase.LockBase then begin
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    OpenMessage('   Закрытие базы...   ','',10);
    Application.ProcessMessages;
    dmBase.CloseBase;
    ChangeMessage('   Архивирование...   ');
    Application.ProcessMessages;

    strPath := ExtractFilePath(Application.ExeName)+'Export\';
    ForceDirectories(strPath);
    ClearDir(strPath,false);
    Zip.FileName := strPath+'data_'+IntToStr(GlobalTask.ParamasInteger('ID'))+'.zip';
//    Zip.BaseDir  := dmBase.GetPathConnect;
    Zip.BaseDir  := ExtractFilePath(Application.Exename);
    Zip.OpenArchive(fmCreate);

    if ANSIUpperCase(Zip.BaseDir)=ANSIUpperCase(Copy(dmBase.GetPathConnect,1,Length(Zip.BaseDir)))
      then Zip.FileMasks.Add(Copy(dmBase.GetPathConnect,Length(Zip.BaseDir)+1,200)+'*.*')
      else Zip.FileMasks.Add(dmBase.GetPathConnect+'*.*');

    if ANSIUpperCase(Zip.BaseDir+'Service\')=ANSIUpperCase(GlobalTask.PathServiceMain)
      then Zip.FileMasks.Add('Service\Parameters.tsk')
      else Zip.FileMasks.Add(GlobalTask.PathServiceMain+'Parameters.tsk');

    if ANSIUpperCase(Zip.BaseDir+'Service\')=ANSIUpperCase(GlobalTask.PathServiceMain)
      then Zip.FileMasks.Add('Service\Parameters.tsk')
      else Zip.FileMasks.Add(GlobalTask.PathServiceMain+'Parameters.tsk');

    Zip.AddFiles;
    Zip.CloseArchive;

  //  n := GetFileSize(Zip.FileName);
    CloseMessage;
    Screen.Cursor:=cur;
    Application.ProcessMessages;
    dmBase.OpenBase;

    ShellExecute(Application.Handle, PChar('explore'), PChar(strPath), nil, nil, SW_SHOWNORMAL);

  end else begin
    PutError('Невозможно заблокировать базу для проведения операции.');
  end;
end;

//--------- вид на жительство ----------------------
procedure TfmMain.acZVidGitExecute(Sender: TObject);
begin
  fmVidGit := TfmVidGit.Create(nil);
  try
    fmVidGit.NewDok(true);
    fmVidGit.EditModal;
  finally
    fmVidGit.Free;
    fmVidGit := nil;
  end;
end;

procedure TfmMain.btCancelClick(Sender: TObject);
begin
  AbortTransfer:=true;
end;
  
//---------------------------------------------------------------------------------
procedure TfmMain.TBItemLoadSysPrichSmClick(Sender: TObject);
var
  s:String;
  lOk:Boolean;
begin
  lOk:=true;
  if dmBase.SprPrichSm.RecordCount>0 then begin
    s := '';
    s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
    s := s + 'Перед выполнением загрузки'#13;
    s := s + 'текущий справочник причин смерти будет очищен.'#13;
    s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
    s := s + 'введите слово ДА в поле ввода'#13;
    lOk:=OkWarning(s);
  end;
  if lOk then begin
    OpenMessage('Выполнение загрузки...','',10);
    dmBase.SprPrichSm.Active:=false;
    Application.ProcessMessages;
    try
      dmBase.AdsConnection.Execute('DELETE FROM SprPrichSm');
      dmBase.AdsConnection.Execute('INSERT INTO SprPrichSm (kod,name,name_b) SELECT kod,name,name_b FROM SysSpr.SprMkb10');
    except
      CloseMessage;
      PutError(' Ошибка загрузки. ');
    end;
    CloseMessage;
    dmBase.SprPrichSm.Active:=true;
  end;
end;

//---------------------------------------------------------------------------------
//  Загрузить изменения классификатора АТЕ
procedure TfmMain.acLoadChangeATEExecute(Sender: TObject);
{$IFDEF GISUN}
{$IFDEF GISUN2}
var
  d,d1,d2:TDateTime;
  nCount:Integer;
  ds:TDataSet;
{$ENDIF}
{$ENDIF}
begin
{$IFDEF GISUN}
{$IFDEF GISUN2}
  FRunAddMenu:=true;
  SetRole;
  try
  if IsActiveGISUN and IsActiveWorkATE then begin
    Screen.Cursor:=crHourGlass;
    ds := dbOpenSQL('select max(dateout) max_date1 ,max(datein) max_date2 from ate','');   // база по умолчанию на 02.10.2012 !!!
    if ds.FieldByName('MAX_DATE1').IsNull
      then d1:=STOD('2013-07-17',tdAds)
      else d1:=ds.FieldByName('MAX_DATE1').AsDateTime+1;
    if ds.FieldByName('MAX_DATE2').IsNull
      then d2:=STOD('2012-10-03',tdAds)
      else d2:=ds.FieldByName('MAX_DATE2').AsDateTime+1;
    if d1>d2
      then d:=d1
      else d:=d2;
    dbClose(ds);
    {
    try
      if GlobalTask.GetLastValueAsString('DATE_CHECK_ATE')='' then begin
        d:=STOD('2012-01-01',tdAds);
      end else begin
        d:=GlobalTask.GetLastValueAsDate('DATE_CHECK_ATE');
      end;
    except
      d:=STOD('2012-01-01',tdAds);
    end;
    }
    Application.ProcessMessages;
    nCount:=-3;
//    d:=stod('20120101',tdClipper);   для теста !!!
    try
      nCount:=Gisun.GetChangeATE(d);
    except
      on E: Exception do begin
        PutError(E.Message);
      end;
    end;
    Screen.Cursor:=crDefault;
    if nCount=0 then begin
      ShowMessage('Изменений АТЕ не было.');
    end else if nCount>0 then begin
      ShowMessage('Загружено изменений: '+IntToStr(nCount));
      GlobalTask.SetLastValueAsDate('DATE_CHECK_ATE',Date);
    end else if nCount=-1 then begin
      PutError('Обновление АТЕ не загружено.');
    end else if nCount=-2 then begin
      //;
    end;
  end;
  finally
    FRunAddMenu:=false;
    SetRole;
  end;
{$ENDIF}
{$ENDIF}
end;

procedure TfmMain.acQueryListINExecute(Sender: TObject);
var
  sl:TStringList;
  s,sDir:String;
  nID,i,n,m:Integer;
  Param  : TParamsEditSpr;
  d:TDateTime;
  f:TfmParamQuest;
begin
  n:=MaxCountIN;
//  n:=5;
  try
    dmBase.WorkQuery.Active:=false;
    dmBase.WorkQuery.SQL.Text:='select count(*) from BaseProp where typeobj='+IntToStr(_TypeObj_IN);
    dmBase.WorkQuery.Open;
    m:=dmBase.WorkQuery.Fields[0].AsInteger;
    m:=n-dmBase.WorkQuery.Fields[0].AsInteger;
  except
    m:=10;
  end;
  dmBase.WorkQuery.Active:=false;

  if m<=0 then begin
    ShowMessage('Зарезервированно максимальное количество ИН '+IntToStr(n));
    exit;
  end;

  f:=TfmParamQuest.Create(Self);
  f.Caption:='Запросить ИН';
  f.AddParamEx(0, 'Количество (максимум '+IntToStr(m)+')', 'KOLVO' ,'TYPE=INTEGER~MIN=0~MAX='+IntToStr(m)+'~WIDTH=50');
  f.AddButtons('Выполнить~Отказ',0);
  i:=f.ShowQuest;
  n:=0;
  if i=1 then begin
    n:=f.GetValue('KOLVO', 'N');
  end;
  f.Free;
  if n>0 then begin
    sl:=TStringList.Create;
    Gisun.GetOnlyIdentif(n, sl, true);
    if sl.Count>0 then begin
      with dmBase.tbSimpleProp do begin
        IndexName:='PR_KEY';
        SetRange([_TypeObj_IN],[_TypeObj_IN]);
        try
          Last;
          nID:=FieldByName('ID').AsInteger+1;
        finally
          CancelRange;
        end;
        d:=dmBase.getCurDate;
        for i:=0 to sl.Count-1 do begin
          Append;
          FieldByName('TYPEOBJ').AsInteger:=_TypeObj_IN;
          FieldByName('ID').AsInteger:=nID;
          FieldByName('POKAZ').AsString:='IN';
          FieldByName('DATES').AsDateTime:=d;
          FieldByName('VALUE').AsString:=sl.Strings[i];
          FieldByName('NVALUE').AsInteger:=1;
          Post;
          nID:=nID+1;
        end;
      end;
    end;
    sl.Free;
  end;
  Param:=TParamsEditSpr.Create;
    //Param.OnBeforeDelete := ;
  Param.OnCloseWindow:=BeforeClose_ListIN;
//  Param.OnGetCellParams
//    dmBase.tbSimpleProp.SetRange([_TypeObj_IN],[_TypeObj_IN]);
  GlobalTask.EditSpr('EDIT_LIST_IN', Param);
end;
//------------------------------------------------------------------------
procedure TfmMain.BeforeClose_ListIN(Grid: TSasaDbGrid; var lClose: Boolean);
begin
{
  if Problem('Закрыть ?',mtConfirmation,Grid) then begin
 //   dmBase.tbSimpleProp.CancelRange;
    lClose:=true;
  end else begin
    lClose:=false;
  end;
}
end;
//---------------------------------------------------------------
procedure TfmMain.acViewINExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  Param:=TParamsEditSpr.Create;
    //Param.OnBeforeDelete := ;
  Param.OnCloseWindow:=BeforeClose_ListIN;
//  Param.OnGetCellParams
//    dmBase.tbSimpleProp.SetRange([_TypeObj_IN],[_TypeObj_IN]);
  GlobalTask.EditSpr('EDIT_LIST_IN', Param);
end;
//-------------------------------------------------
procedure TfmMain.CaptionProg(sUser:String);
var
  ss,sOrg:String;
begin
  if IsActiveGISUN then begin
    if sUser<>'' then sUser:='ГИС РН   пользоватеь "'+sUser+'"'+'  ';
    if Gisun.ActiveETSP then begin
      ss:='(ЭЦП '+Gisun.NameETSP+')';
    end else begin
      ss:='';
    end;
    sOrg:='организация "'+Gisun.MessageSource+'"  ';
    Caption:='ЛАИС [ГИС РН '+sUser+sOrg+ss+']';
    acSaveCert.Visible:=(Gisun.TypeETSP=ETSP_AVEST);
  end;
end;

//-------------------------------------------------
procedure TfmMain.acSetUserGISExecute(Sender: TObject);
{$IFDEF GISUN}
var
 s,ss,sPIN:String;
 n:Integer;
{$ENDIF}
begin
  {$IFDEF GISUN}
//    if not Gisun.DbUserAsGIS then begin
      Gisun.ClearETSPSession;
      s:=Role.UserGIS;
      ss:='';
      sPIN:='';
      if Gisun.ActiveETSP then begin
        if Gisun.EnabledSimPin
          then n:=4   // доступность ввода символов в пин коде
          else n:=2;
      end else begin
        n:=1;
      end;
      if ShowLogon(s,ss,sPIN, -1,-1, n) then begin
        Gisun.SetUserNameToken(s,ss,sPIN);
        CaptionProg(s);
      end;
//    end;
  {$ENDIF}
end;
//--------------------------------------------------
procedure TfmMain.acClearUserGISExecute(Sender: TObject);
begin
  {$IFDEF GISUN}
//    if not Gisun.DbUserAsGIS then begin
      Gisun.SetUserNameToken('','','');
      Gisun.RegInt.PIN:='';
      Gisun.ClearETSPSession;
      GlobalTask.SetLastValueAsString('LAST_USER_GIS','');
      CaptionProg('');
//    end;
  {$ENDIF}
end;

//--------------------------------------------------------------------------------------------------
procedure TfmMain.IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
Var
  S: String;
  TotalTime: TDateTime;
//  RemainingTime: TDateTime;
  H, M, Sec, MS: Word;
  DLTime: Double;
begin
//  BytesToTransfer:=BytesToTransfer+AWorkCount;
  TotalTime :=  Now - STime;
  DecodeTime(TotalTime, H, M, Sec, MS);
  Sec := Sec + M * 60 + H * 3600;
  DLTime := Sec + MS / 1000;
//  if DLTime > 0 then
//    AverageSpeed := {(AverageSpeed + } (BytesToTransfer / 1024) / DLTime {) / 2};

  {
  if AverageSpeed > 0 then begin
    Sec := Trunc(((PB.Max - AWorkCount) / 1024) / AverageSpeed);

    S := Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);

    S := 'время ' + S;
  end
  else S := '';
  }
//  S := FormatFloat('0.00 КБ/сек', AverageSpeed) + '; ' + S;
{
  s:=floattostr(BytesToTransfer/1024);
  case AWorkMode of
    wmRead: SB.Panels[1].Text := '-------------------------------- ' + S;
    wmWrite: SB.Panels[1].Text := '------------------------------- ' + S;
  end;
}
  if AbortTransfer then begin
    TIdHTTP(Sender).Disconnect;
  end;

end;
//-----------------------------------------------------------------------------------------------------
procedure TfmMain.IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
var
  s:String;
begin
  BytesToTransfer:=BytesToTransfer+AWorkCountMax;
  TransferrignData := true;
//  AbortTransfer := false;
  STime := Now;
  AverageSpeed := 0;
  s:=FormatFloat('### ### ###.#',BytesToTransfer/1024)+'KB';
  SB.Panels[1].Text := S;
  if AbortTransfer then begin
    TIdHTTP(Sender).Disconnect;
  end;
end;
//-----------------------------------------------------------------------------------------------------
procedure TfmMain.IdHTTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  TransferrignData := false;
  AverageSpeed := 0;
end;

procedure TfmMain.IdThreadComponent1Run(Sender: TIdCustomThreadComponent);
//var
//  s,strErr:String;
//  rcs:TRTLCriticalSection;
//  l:Boolean;
begin
//  CheckUpdate(true, true, 0, true, strFileName);
{
  s:=Gisun.CheckUpdateProg('zags',strerr);
  EnterCriticalSection(rcs);
  if strErr=''
    then ShowMessage(s)
    else PutError(strErr);
  LeaveCriticalSection(rcs);
  if (strerr='') and (s<>'') then begin
    l:=Gisun.DowloadUpdateProg(s, strErr);
    EnterCriticalSection(rcs);
    if l
       then ShowMessage('Ок!')
       else PutError(strErr);
    LeaveCriticalSection(rcs);
  end;
  }
end;

{+}
procedure TfmMain.acSprDocAdmProcUExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_ADMPROC_U');
  {$ENDIF}
end;

//-------------------------------------------------------------------
procedure TfmMain.TBItemShablonPriglClick(Sender: TObject);
var
  s:String;
begin
  s:='Приглашение на выборы.doc';
  if FileExists(fmMain.TemplateInterface.UserTemplateDir+s)
    then s:=fmMain.TemplateInterface.UserTemplateDir+s
    else s:=fmMain.TemplateInterface.TemplateDir+s;
  ShellExecute(Application.Handle, nil, PChar(s), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmMain.TBItemXMLtoSPRClick(Sender: TObject);
var
  n:Integer;
begin
{$IFDEF GISUN}
  n := QuestionPos(' Какой справочник загрузить ? ',
          'ЗАГС;МКБ10;ATE;&Отказ;','',3,4,qtConfirmation,Self);
 if n=1 then begin
   Gisun.GetChangeClassif(CLASS_ORGAN_REG, STOD(FIRST_DATE_CLASSIF,tdAds),false);
 end else if n=2 then begin
   Gisun.GetChangeClassif(CLASS_MKB10, STOD(FIRST_DATE_CLASSIF,tdAds),false);
 end else if n=3 then begin
   Gisun.GetChangeATE(STOD('1899-12-30',tdAds),false);
 end;
{$ENDIF}
end;
//-----------------------------------------------------------------------
procedure TfmMain.ChangeParamGISUN;
var
  fmParamsGisun:TfmParamsGisun;
begin
  fmParamsGisun:=TfmParamsGisun.Create(nil);
  fmParamsGisun.SetTypeBase('LAIS');
  if fmParamsGisun.ShowModal=mrOk then begin
    Gisun.SetParamsGISUN('');
  end;
  fmParamsGisun.Free;
end;
//-----------------------------------------------------------------------
procedure TfmMain.acGisunParamsExecute(Sender: TObject);
begin
  if Role.Status=rsAdmin then begin
    ChangeParamGISUN;
  end;
end;
//------------------------------------------------------
procedure TfmMain.WMDEVICECHANGE(var Msg: TMessage);
begin
{$IFDEF GISUN}
  if Gisun<>nil then begin
    if Gisun.ActiveETSP and Gisun.CheckUSB then begin
      if Msg.Msg = WM_DEVICECHANGE then begin
        if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
          (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
          (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then begin
  //        ShowMessage('Change USB Volume');
        end else begin
          Gisun.RegInt.PIN:=''; // add close avest session !!!
          Gisun.ClearETSPSession;
        end;
      end;
    end;
  end;
{$ENDIF}
end;
//------------------------------------------------------
procedure TfmMain.WMCheckUpdate(var Msg: TMessage);
begin
  if Msg.Msg = WM_CHECKUPDATE then begin
    CheckUpdateSyna(pn);
  end;
end;
//------------------------------------------------------
procedure TfmMain.CheckCaptionActiveGisun;
begin
  if GlobalTask.GetLastValueAsBoolean('NOT_GISUN') then begin
    TBItemNotGISUN.Caption:='Включить работу с ГИС РН'
  end else begin
    TBItemNotGISUN.Caption:='Отключить работу с ГИС РН'
  end;
end;
//------------------------------------------------------
procedure TfmMain.TBItemNotGISUNClick(Sender: TObject);
begin
  if GlobalTask.GetLastValueAsBoolean('NOT_GISUN') then begin
    if Problem(' Включить работу с ГИС РН ? ') then begin
      GlobalTask.SetLastValueAsBoolean('NOT_GISUN',false);
      Gisun.SetParamsGISUN('');
    end;
  end else begin
    if Problem(' Отключить работу с ГИС РН ? ') then begin
      GlobalTask.SetLastValueAsBoolean('NOT_GISUN',true);
      Gisun.SetParamsGISUN('');
    end;
  end;
  CheckCaptionActiveGisun;
  SetRole;
end;

procedure TfmMain.acParamsFTPExecute(Sender: TObject);
begin
  EditParamsFTP;
end;

procedure TfmMain.acLoadFromBTIExecute(Sender: TObject);
begin
  LoadFromBTI;
end;

procedure TfmMain.acUpdateAdmProcExecute(Sender: TObject);
begin
  if Problem(' Обновить справочники административных процедур и тематик обращений ? ') then begin
    dmBase.CheckSprAdmProc('');
    dmBase.CheckSprAdmProc('U');
    dmBase.CheckSprTematic('1');
  end;
end;
//-----------------------------------------------------------------------------------------------
procedure TfmMain.acLoadZAHExecute(Sender: TObject);
var
  FFields:TStringList;
  tbDesc,tbSource:TDataSet;
  n,j,nLoad:Integer;
  f:TfmParamQuest;
  d1,d2:TDateTime;
begin
  f:=TfmParamQuest.Create(nil);
  f.Caption:='Загрузить з/а о смерти';
  f.AddParamEx(STOD('20130727',tdClipper), 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
  f.AddParamEx(dmBase.getCurDate, 'Конечная дата' , 'DATE2' ,'TYPE=DATE');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  d1:=0;
  d2:=0;
  if n=1 then begin
    d1:=f.GetValue('DATE1', 'D');
    d2:=f.GetValue('DATE2', 'D');
  end;
  f.Free;
  if (d1>0) and (d2>0) then begin
    if (d1>d2) then begin
      PutError('Неправильно введены даты.',nil);
    end else begin
      if Problem('Загрузить в учет захоронений з/а о смерти  за период с '+DatePropis(d1,3)+' по '+DatePropis(d2,3), mtConfirmation, nil) then begin
        nLoad:=0;
        FFields:=TStringList.Create;
        FFields.CommaText:='FAMILIA,NAME,OTCH,DATES,ONLYGOD,GRAG,DATER,ONLYGOD_R,SVID_SERIA,SVID_NOMER,DATESV,POL,VOZR'; //+
      //                'GT_GOSUD,GT_B_OBL,GT_OBL,GT_B_RN,GT_RAION,GT_B_GOROD,GT_GOROD,GT_GOROD_R,GT_DOM,GT_KORP,GT_KV';
        tbDesc:=dmBase.AktZ;
        tbSource:=dmBase.tbZapisSmert;
        try
          tbSource.Filter:='datez>=STOD('+QStr(DTOS(d1,tdClipper))+') and datez<=STOD('+QStr(DTOS(d2,tdClipper))+')';
          tbSource.Filtered:=true;
          tbSource.First;
          while not tbSource.Eof do begin
            tbDesc.Append;
            tbDesc.FieldByName('ZA_NOMER').AsString:=tbSource.FieldByName('NOMER').AsString;
            tbDesc.FieldByName('ZA_DATE').AsString:=tbSource.FieldByName('DATEZ').AsString;
            tbDesc.FieldByName('ID_ZAGS').AsInteger:=0;
            tbDesc.FieldByName('ID_SOURCE').AsInteger:=0;
            tbDesc.FieldByName('PODR').AsInteger:=0;
            tbDesc.FieldByName('ID_ZAGS').AsInteger:=0;
            tbDesc.FieldByName('SVID_SOURCE').AsString:='0';
            tbDesc.FieldByName('MOG_TYPE').AsInteger:=1;
            tbDesc.FieldByName('MOG_L').AsFloat:=2.3;
            tbDesc.FieldByName('MOG_W').AsFloat:=1.4;
        //      tbDesc.FieldByName('SVID_ZAGS').AsString:=IDZagsName;
            for j:=0 to FFields.Count-1 do begin
              tbDesc.FieldByName(FFields.Strings[j]).Value:=tbSource.FieldByName(FFields.Strings[j]).Value;
            end;
            tbDesc.FieldByName('ADD_FIELDS').AsString:=GetXMLZAH;
            if (tbSource.FieldByName('LICH_NOMER').AsString<>'') then
              tbDesc.FieldByName('LICH_NOMER').AsString:=tbSource.FieldByName('LICH_NOMER').AsString;

            if tbSource.FieldByName('DECL').AsString<>'' then begin
              j:=Pos(',', tbSource.FieldByName('DECL').AsString);
              if j>0 then
                tbDesc.FieldByName('DECL').AsString:=Copy(tbSource.FieldByName('DECL').AsString,1,j-1);
            end;

            tbDesc.Post;
            nLoad:=nLoad+1;
            tbSource.Next;
          end;
        finally
          tbSource.Filter:='';
          tbSource.Filtered:=false;
          FFields.Free;
        end;
        ShowMessage('Загружено записей: '+IntToStr(nLoad));
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------------------------------
function TfmMain.GetXMLZAH:String;
var
 s,sName:String;
 procedure FieldToXML(s1:String;fld:TField;s2:String);
 begin
   if not fld.IsNull then begin
     case fld.DataType of
       ftBoolean	: if fld.AsBoolean
                      then Result:=Result+s1+'1'+s2
                      else Result:=Result+s1+'0'+s2;
     else
       Result:=Result+s1+fld.AsString+s2;
     end;
   end;
 end;
begin
  sName:=GlobalTask.ParamAsString('NAME');
  Result:='<?xml version="1.0" encoding="UTF-8"?>'#13#10+
          '<DATASETS VERSION="1">'#13#10+
          '<DOKUMENT ONE_RECORD="1" RECORD_COUNT="1">'#13#10;
  with dmBase.tbZapisSmert do begin
    FieldToXML('<PR_OSN_NAME>'#13#10'<![CDATA[',FieldByName('PR_OSN_NAME'),']]>'#13#10'</PR_OSN_NAME>'#13#10);

    FieldToXML('<SM_GOSUD>',FieldByName('SM_GOSUD'),'</SM_GOSUD>'#13#10);
    FieldToXML('<SM_B_OBL>',FieldByName('SM_B_OBL'),'</SM_B_OBL>'#13#10);
    FieldToXML('<SM_OBL>',FieldByName('SM_OBL'),'</SM_OBL>'#13#10);
    FieldToXML('<SM_RAION>',FieldByName('SM_RAION'),'</SM_RAION>'#13#10);
    FieldToXML('<SM_B_GOROD>',FieldByName('SM_B_GOROD'),'</SM_B_GOROD>'#13#10);
    FieldToXML('<SM_GOROD>',FieldByName('SM_GOROD'),'</SM_GOROD>'#13#10);

    FieldToXML('<PR_OSN_NAME>'#13#10'<![CDATA[',FieldByName('PR_OSN_NAME'),']]>'#13#10'</PR_OSN_NAME>'#13#10);
    FieldToXML('<DOKUMENT>'#13#10'<![CDATA[',FieldByName('DOKUMENT'),']]>'#13#10'</DOKUMENT>'#13#10);

    FieldToXML('<RG_B_RESP>',FieldByName('RG_B_RESP'),'</RG_B_RESP>'#13#10);
    FieldToXML('<RG_GOSUD>',FieldByName('RG_GOSUD'),'</RG_GOSUD>'#13#10);
    FieldToXML('<RG_B_OBL>',FieldByName('RG_B_OBL'),'</RG_B_OBL>'#13#10);
    FieldToXML('<RG_OBL>',FieldByName('RG_OBL'),'</RG_OBL>'#13#10);
    FieldToXML('<RG_RAION>',FieldByName('RG_RAION'),'</RG_RAION>'#13#10);
    FieldToXML('<RG_B_GOROD>',FieldByName('RG_B_GOROD'),'</RG_B_GOROD>'#13#10);
    FieldToXML('<RG_GOROD>',FieldByName('RG_GOROD'),'</RG_GOROD>'#13#10);

    FieldToXML('<PR_GOSUD>',FieldByName('GT_GOSUD'),'</PR_GOSUD>'#13#10);
    FieldToXML('<PR_B_OBL>',FieldByName('GT_B_OBL'),'</PR_B_OBL>'#13#10);
    FieldToXML('<PR_OBL>',FieldByName('GT_OBL'),'</PR_OBL>'#13#10);
    FieldToXML('<PR_RAION>',FieldByName('GT_RAION'),'</PR_RAION>'#13#10);
    FieldToXML('<PR_B_GOROD>',FieldByName('GT_B_GOROD'),'</PR_B_GOROD>'#13#10);
    FieldToXML('<PR_GOROD>',FieldByName('GT_GOROD'),'</PR_GOROD>'#13#10);
    FieldToXML('<PR_GOROD_R>',FieldByName('GT_GOROD_R'),'</PR_GOROD_R>'#13#10);
    FieldToXML('<PR_DOM>',FieldByName('GT_DOM'),'</PR_DOM>'#13#10);
    FieldToXML('<PR_KORP>',FieldByName('GT_KORP'),'</PR_KORP>'#13#10);
    FieldToXML('<PR_KV>',FieldByName('GT_KV'),'</PR_KV>'#13#10);

    if dmBase.tbSimpleProp.Locate('TYPEOBJ;ID;POKAZ', VarArrayOf([_TypeObj_ZSmert, FieldByName('ID').AsInteger, 'TEXT_VOZR']), [])
      then Result:=Result+'<TEXT_VOZR>'+dmBase.tbSimpleProp.FieldByName('VALUE').AsString+'</TEXT_VOZR>'#13#10;
    if dmBase.tbSimpleProp.Locate('TYPEOBJ;ID;POKAZ', VarArrayOf([_TypeObj_ZSmert, FieldByName('ID').AsInteger, 'TEXT_DATES']), [])
      then Result:=Result+'<TEXT_DATES>'+dmBase.tbSimpleProp.FieldByName('VALUE').AsString+'</TEXT_DATES>'#13#10;
    Result:=Result+'<SVID_ZAGS>'+sName+'</SVID_ZAGS>'#13#10;
  end;
  Result:=Result+#13#10'</DOKUMENT>'#13#10'</DATASETS>';
end;

//=========================================================
//=================== СМДО ================================
//=========================================================
//---------------------------------------------------------
function TfmMain.SMDOCheckNSI(nTypeSpr:Integer; lRun:Boolean; lShow:Boolean; lCheck:Boolean):String;
//var
{$IFDEF SMDO}
{
  n,m,nn,nCurUpdate,FileAttrs,nUpdate,nCur:Integer;
  sKodSpr,strFile,s,ss,strDir,strDirUpdate:String;
  VerInfo:TVerInfo;
  sr:TSearchRec;
  lFtp,lOk:Boolean;
}
{$ENDIF}
begin
{$IFDEF SMDO}
{
  Result:='';
  sKodSpr:='smdospr_'+SMDO.NameTypeSpr(nTypeSpr,'KOD');
  if GlobalTask.ParamAsBoolean('SMDO_NSI_CH') or lCheck then begin
    strDir:=Trim(GlobalTask.ParamAsString('SMDO_NSI_PATH'));
    if MySameText(strDir, 'ftp') then lFtp:=true else lFtp:=false;
    //=== ищем файл в сети  ==============================================
    if not lFtp then begin  //
      if strDir<>'' then begin
        FileAttrs := SysUtils.faReadOnly+SysUtils.faArchive+SysUtils.faAnyFile;	//faDirectory;
        strDir:=CheckSleshN(strDir);
        if FindFirst( strDir+sKodSpr+'*.*', FileAttrs, sr) = 0 then begin
          ss:=sr.Name;
          while ss<>'' do begin
            // первая позиция цифры
            n:=Q_StrCSpn(sr.Name, '1234567890', 1);
            m:=Q_StrCSpn(sr.Name, '.', 1);
            if (n>0) and (m>0) then begin
              ss:=Copy(sr.Name,n,m-n);
              CharDel(ss,'-');
              try
                n:=StrToInt(ss);
              except
                n:=0;
              end;
              if n>GlobalTask.GetLastValueAsInteger(sKodSpr) then begin
                Result:=strDir+sr.Name;
                break;
              end;
            end;
            if FindNext(sr)=0  then ss:=sr.Name
                               else ss:='';
          end;
          FindClose(sr);
        end;
      end;
    end else begin
      SetPropertyFPT(SERVER_SMDO_NSI,'');
      if GetFileFTP(true, '','') then begin
        for n:=0 to idFTP1.DirectoryListing.Count-1 do begin
          strFile:=idFTP1.DirectoryListing.Items[n].FileName;
          if Pos(sKodSpr,UpperCase(strFile))>0 then begin
            nn:=Length(sKodSpr)+1
            m:=LastPos('.',strFile);
            if m>0 then begin
              ss:=Copy(strFile,nn,m-nn);
              CharDel(ss,'-');
              try
                n:=StrToInt(ss);
              except
                n:=0;
              end;
              if n>GlobalTask.GetLastValueAsInteger(sKodSpr) then begin
                Result:=strFile;
                break;
              end;
            end;
          end;
        end;
      end else begin
        nUpdate:=-1;
      end;
    end;
  end;
  if lRun then begin // вфполнить загрузку обновления
    if (Result='')  then begin
      if (nUpdate<>-1) and lCheck then begin
        ShowMessage(' Обновление не найдено. ');
      end;
    end else if (Result<>'') then begin
      strDirUpdate:=CheckSleshN(GetFolderMyDocument)+'Обновления\';    // CreateTmpPath(0);
      ForceDirectories(strDirUpdate);
      ClearDir(strDirUpdate,false);
      if Problem('Найдено обновление "'+Result+'". Загрузить?') then begin
        if TypeServerFTP=NET_PATH then begin
          lOk:=CopyFile(PChar(strDir+strFileUpdate), PChar(strDirUpdate+strFileUpdate), false);
          if not lOk then begin
            PutError('Ошибка копирования файла : '+#13+
                     'откуда :'+strDir+strFileUpdate+#13+
                     'куда   :'+strDirUpdate+strFileUpdate+#13+
                     IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
          end;
        end else begin
          CheckVisibleProgress(true,'Загрузка обновления:');
          lOk:=GetFileFTP(false, strFileUpdate, strDirUpdate);
          CheckVisibleProgress(false,'');
        end;
        if lOk then begin
          if Problem('Обновление загружено. Установить? ') then begin
            WinExec(PChar(strDirUpdate+strFileUpdate), SW_SHOWNORMAL);
            Application.Terminate;
  //          Close;
          end else begin
            ShellExecute(Application.Handle, PChar('explore'), PChar(strDirUpdate), nil, nil, SW_SHOWNORMAL);
          end;
        end;
      end;
    end;
  end;
  }
{$ENDIF}
end;
//--------------------------------------------------------------------
procedure TfmMain.acSMDORunWebLoadSprExecute(Sender: TObject);
begin
  RunWebSprSMDO(true);
end;
//----------------------------------------------------------
procedure TfmMain.TimerPKNCITimer(Sender: TObject);
begin
  RunWebSprSMDO(false);
end;
//--------------------------------------------------------------------
procedure TfmMain.SMDOCheckVisible;
var
  i:Integer;
//  lSet:Boolean;
begin
  {$IFDEF SMDO}
    {
    if SMDOEnabled
      then lSet:=true
      else lSet:=false;
    for i:=0 to ActionList.ActionCount-1 do begin
      if Pos('SMDO', ActionList.Actions[i].Name)>0 then begin
        if TAction(ActionList.Actions[i]).Visible
          then TAction(ActionList.Actions[i]).Visible:=lSet;
      end;
    end;  }
//    acSMDOEditParams.Visible:=((Role.Status=rsAdmin) or Role.SystemAdmin);
  {$ELSE}
    for i:=0 to ActionList.ActionCount-1 do begin
      if Pos('SMDO', ActionList.Actions[i].Name)>0 then begin
        then TAction(ActionList.Actions[i]).Visible:=false;
      end;
    end;
  {$ENDIF}
end;
//-------------------------------------------------------------
procedure TfmMain.SMDOCheckEnabled(lSet:Boolean);
{$IFDEF SMDO}
var
  i:Integer;
  l:Boolean;
{$ENDIF}
begin
  {$IFDEF SMDO}
    l:=acSMDOEditParams.Enabled;
    for i:=0 to ActionList.ActionCount-1 do begin
      if Pos('SMDO', ActionList.Actions[i].Name)>0 then begin
        if TAction(ActionList.Actions[i]).Enabled<>lSet
          then TAction(ActionList.Actions[i]).Enabled:=lSet;
      end;
    end;
    acSMDOEditParams.Enabled:=l; //((Role.Status=rsAdmin) or Role.SystemAdmin);
  {$ENDIF}
end;
//-------------------------------------------------------
procedure TfmMain.acSMDORunLoadSprExecute(Sender: TObject);
{$IFDEF SMDO}
begin  if SMDOEnabled then SMDO.RunLoadSysSpr; end;
{$ELSE}
begin  end;
{$ENDIF}
//-------------------------------------------------------
procedure TfmMain.acSMDOEditParamsExecute(Sender: TObject);
{$IFDEF SMDO}
begin  SMDO.EditParams; end;
{$ELSE}
begin  end;
{$ENDIF}
//---------------------------------------------------------------
procedure TfmMain.acSMDOPostExecute(Sender: TObject);
begin
{$IFDEF SMDO}
  if SMDOEnabled then begin
//    if SMDOFullEnabled then begin

//      m:=Avest.SMDOGetCOC(SMDO.FUrlCOC);  !!!
//      if m<>0
//        then PutError(Avest.ErrorInfo(m));

      ShowGurnal(TfmGurnSMDO, 'fmGurnSMDO');
//    end else begin
//      PutError('Не активирован НКИ "Авест"');
//    end;
  end;
{$ENDIF}
end;

procedure TfmMain.acSMDOSprOrgExecute(Sender: TObject);
begin
{$IFDEF SMDO}
//
{$ENDIF}
end;

procedure TfmMain.acSMDOSprKindExecute(Sender: TObject);
begin
{$IFDEF SMDO}
//
{$ENDIF}
end;
//------------------------------------------------------------------------
procedure TfmMain.WM_CheckSendMail(var rec:TMsg);
{$IFDEF SMDO}
var
  lOk:Boolean;
  slPar:TStringList;
{$ENDIF}
begin
{$IFDEF SMDO}
  // пока автоматически отправляем только уведомления
  slPar:=TStringList.Create;
  slPar.Add('SHOWERROR=0');
  slPar.Add('TYPERUN=1');
  slPar.Add('ONLY_ACK=1');    // только уведомления
  slPar.Add('CHECKCOUNT=0');  // при отсутствии непоказывать сообщение
  slPar.Add('CLEAR_LOG=0');   // не очищать локальный лог работы
  lOk:=SMDO.SendMail(nil,slPar);
  FreeAndNil(slPar);
  if Role.SystemAdmin
    then SMDO.ShowLocalLog(true)
    else if not lOk then SMDO.ShowError;
{$ENDIF}
end;
{
//------------------------------------------------------------------------
procedure TfmMain.acSMDOSendExecute(Sender: TObject);
var
  lOk:Boolean;
  slPar:TStringList;
begin
  if SMDOEnabled and acSMDOSend.Visible and acSMDOSend.Enabled then begin
    slPar:=TStringList.Create;
    slPar.Add('SHOWERROR=0');
//    slPar.Add('TYPERUN=1');
    lOk:=SMDO.SendMail(nil,slPar);
    FreeAndNil(slPar);                           
    if Role.SystemAdmin
      then SMDO.ShowLocalLog(true)
      else if not lOk then SMDO.ShowError;
    RefreshGurnalSMDO;
  end;
end;
//----------------------------------------------------------------
procedure TfmMain.acSMDOReceiveExecute(Sender: TObject);
begin
  if acSMDOReceive.Visible and acSMDOReceive.Enabled then begin
    SMDOReceive(false);
  end;
end;
}
//----------------------------------------------------------------
//
function TfmMain.SMDOReceive(lStart:Boolean; lVisible:Boolean; lCheck:Boolean; nPost:Integer):Integer;
{$IFDEF SMDO}
var
  n:DWORD;
  d:TDateTime;
  m:Integer;
  lOk,lRefreshCOC:Boolean;
  slPar:TStringList;
  sSoob,sTypeRun,s,sErr:String;
  nCountUvd,nCountErr,nCount:Integer;
{$ENDIF}
begin
{$IFDEF SMDO}     
  Result:=0;
  nCount:=0;
  if not SMDO.FPostEnabled then exit;
  lRefreshCOC:=false;
  slPar:=TStringList.Create;
  if lStart then begin
    lVisible:=true;
    if SMDOEnabled and Avest.IsActive then begin
      n:=0;
      sErr:='';
      if ((SMDO.FRefreshCOC=RF_COC_RECEIVE) or (SMDO.FRefreshCOC=RF_COC_START)) and SMDO.FCheckStart then begin // обновлять СОС перед получением почты
        n:=SMDO.RefreshCOC(false,sErr,true);
        lRefreshCOC:=true;
      end else begin
        {
        d:=GlobalTask.GetLastValueAsDate('LAST_DATE_COC', false);
        if (d=0) or (d<>Date) then begin
          GlobalTask.SetLastValueAsDate('LAST_DATE_COC', Date);
          n:=SMDO.RefreshCOC(not SMDO.FCheckRefreshCOC,sErr,true);
          lRefreshCOC:=true;
        end;
        }
        if (SMDO.FRefreshCOC=RF_COC_START) then begin // обновлять СОС пи старте программы
          d:=GlobalTask.GetLastValueAsDate('LAST_DATE_COC', false);
          if (d=0) or (d<>Date) then begin
            GlobalTask.SetLastValueAsDate('LAST_DATE_COC', Date);
            n:=SMDO.RefreshCOC(false,sErr,true);
            lRefreshCOC:=true;
          end;
        end;
      end;
      if (n=0) then begin
        // OK или "В справочнике списков отозванных сертификатов имеется более новый (такой же) СОС данного издателя" или "Объект уже существует"
      end else if (sErr<>'') then begin
        PutError(sErr);
      end;
    end;
  end;
  if SMDOFullEnabled then begin
    if not lStart or SMDO.FCheckStart then begin
      if lCheck
        then m:=SMDO.CheckReceiveMail(lVisible)
        else m:=1;
      if m>0 then begin
//        if not lRefreshCOC and SMDO.FRefreshCOCReceive then begin было
        if not lRefreshCOC and (SMDO.FRefreshCOC=RF_COC_RECEIVE) then begin // обновлять СОС перед получением почты
          SMDO.RefreshCOC(false,sErr,true);
        end;
        // забираем почту
        slPar.Add('SHOWERROR=0');
        if not lVisible
          then slPar.Add('TYPERUN=10');
        lOk:=SMDO.ReceiveMail(slPar,nCount,nCountErr,nCountUvd,nPost);
        Result:=nCount;
        if lVisible then begin
          if lOk then begin
            if nCount>0 then begin
              s:=' Получено сообщений : '+Inttostr(nCount);
              if nCountUvd>0 then s:=s+#13#10'    уведомлений     : '+Inttostr(nCountUvd);
              if nCountErr>0 then s:=s+#13#10'    ошибочных       : '+Inttostr(nCountErr);
              if SMDO.FCountAddFolder>0 then begin
                s:=s+#13#10' Дополнительных материалов : '+Inttostr(SMDO.FCountAddFolder);
                s:=s+#13#10'    записано        : '+Inttostr(SMDO.FWriteAddFolder);
              end;  
              ShowMessage(s);
            end else begin
              if nCount=0
                then ShowMessage('Нет новых сообщений');
            end;
          end else begin
            SMDO.ShowError;
          end;
        end;
        // если что-то получили сразу отправляем уведомления
        if Result>0 then begin
          slPar.Clear;
          slPar.Add('SHOWERROR=0');
          if not lVisible
            then slPar.Add('TYPERUN=10');
          slPar.Add('ONLY_ACK=1');    // только уведомления
          slPar.Add('CHECKCOUNT=0');  // при отсутствии непоказывать сообщение
          slPar.Add('CLEAR_LOG=0');   // не очищать локальный лог работы
          lOk:=SMDO.SendMail(nil,slPar);   // отправляем уведомления
          if lVisible then begin
            if Role.SystemAdmin
              then SMDO.ShowLocalLog(true)
              else if not lOk then SMDO.ShowError;
          end;
        end;
      end else if m=-1 then begin
        Result:=m;
        if lVisible then SMDO.ShowError;
      end else if m=-2 then begin
        // !!! отказ от получения почты !!!
        //if lVisible then SMDO.ShowError;
      end else begin
        if lVisible and (m=0) and not lStart //not SMDO.FCheckStart
          then ShowMessage('Нет новых сообщений');
      end;
    end;
  end else begin
    if not SMDO.ActiveAvest then begin
      if lVisible and not lStart //not SMDO.FCheckStart
        then ShowMessage('Авест не загружен');
    end;
  end;
  if lStart and SMDOEnabled then begin
    m:=SMDO.CheckSendMail(sSoob);
    if m>0 then begin
      ShowMessage(sSoob);
    end;
    if nCount>0 then begin  // есть полученная почта
      ShowGurnal(TfmGurnSMDO, 'fmGurnSMDO');
    end;
  end;
  FreeAndNil(slPar);
  if lVisible then
    RefreshGurnalSMDO;
{$ENDIF}
end;
//----------------------------------------------------------
procedure TfmMain.acSMDORefreshCOCExecute(Sender: TObject);
{$IFDEF SMDO}
var
  sErr:String;
  n:DWORD;
{$ENDIF}
begin
{$IFDEF SMDO}
  if SMDOEnabled then begin
    n:=SMDO.RefreshCOC(false,sErr, true);
    if (sErr<>'')
      then PutError(sErr);
  end;
{$ENDIF}
end;
//----------------------------------------------------------
procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if _WorkedThread_ then begin
    ShowMessage(PadCStr('Выполняется процесс ...',40,' '));
    CanClose:=false;
  end;
  if CanClose then begin
    if fmSMDOWebNCI<>nil then begin
      fmSMDOWebNCI.FRun:=true;
      CanClose:=Problem('Выполняется запрос классификатора СМДО! Выйти из программы ?');
      fmSMDOWebNCI.FRun:=false;
    end;
    if CanClose and (oUpdate<>nil) and (oUpdate.FRun>0) then begin
      CanClose:=Problem('Выполняется загрузка или проверка обновления! Выйти из программы ?');
      if CanClose then  begin
        try
          oUpdate.FTPClient.Abort;
        except
        end;
        oUpdate.FRun:=0;
      end;
    end;
  end;
end;
//--------------------------------------------------------------------------
procedure TfmMain.acLoadClassExecute(Sender: TObject);
begin
  if Role.Status=rsAdmin then begin
     Gisun.GetChangeClassif(0, STOD(FIRST_DATE_CLASSIF,tdAds), true, true);
  end;
end;
//--------------------------------------------------------------------------
procedure TfmMain.Button1Click(Sender: TObject);
var
  s:String;
  ds:TDataSet;
begin
  s:='TYPESPR,Integer;EXTCODE,Char,12;LEX1,Char,250;LEX2,Char,250;LEX3,Char,100;PARENT,Char,10;EXTTYPE,Integer;Active,Logical;'+
     'BEGINDATE,Date,0;ENDDATE,Date,0;';
  ds:=dbCreateMemTable(s,'');
  ds.Open;
  Fds:=ds;
end;
//--------------------------------------------------------------------------
procedure TfmMain.Button2Click(Sender: TObject);
var
  d2xml:TDataSet2XML;
begin
  ds2xml:=TDataSets2XML.Create;
  d2xml:=ds2xml.DS_Add(Fds,false);
  d2xml.NameRoot:='SPR134';
  if FileExists(d2xml.NameRoot+'.xml') then begin
    if ds2xml.FileToXML(d2xml.NameRoot+'.xml') then begin
      ds2xml.XMLToData;
    end;
  end;
//  DataSource1.DataSet:=fds;
end;
//--------------------------------------------------------------------------
procedure TfmMain.Button3Click(Sender: TObject);
begin
//  DataSource1.DataSet:=nil;
  ds2xml.Free;
  FreeAndNil(Fds);
end;
//--------------------------------------------------------------------------
procedure TfmMain.Button4Click(Sender: TObject);
var
  n:Integer;
begin
  fds.First;
  n:=0;
  fds.disablecontrols;
  while not fds.Eof do begin
    if fds.fieldbyname('active').AsBoolean=true then begin
      n:=n+1;
    end;
    fds.Next;
  end;
  fds.First;
  fds.enablecontrols;
  showmessage(inttostr(n));
end;

procedure TfmMain.TBItemVigrZahClick(Sender: TObject);
begin
  RunVigrZAH(0);
end;

procedure TfmMain.TBItemZagrZahClick(Sender: TObject);
begin
  RunZagrZAH;
end;

procedure TfmMain.SetYearFiks(const Value: Integer);
begin
  FYearFiks := Value;
  GlobalTask.SetWorkParam('YEARFIKS', FYearFiks);
end;

function TfmMain.AppHelp(Command: Word; Data: Longint; var CallHelp: Boolean): Boolean;
begin
  Application.HelpFile:=''; //Screen.ActiveForm.Name + '.hlp';
  CallHelp:=false;
  Result:=true;
end;

procedure TfmMain.TBItemDefaultIniClick(Sender: TObject);
var
  s:String;
  ini:TSasaIniFile;
  slPar:TStringList;
  TableView: TTableView;
  DBItem: TDBItem;
  Loader: TDBItemLoader;
  i,j:INteger;
begin
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'Будут восстановлены стандартные настройки реестров:'#13;
  s := s + 'порядок, ширина и высота граф.'#13;
  s := s + 'Если Вы уверены введите слово ДА в поле ввода'#13;
  slPar:=TStringList.Create;
  slPar.Add('WIDTH=420');
  slPar.Add('HEIGHT=220');
  if OkWarningPar(s,slPar) then begin
    GlobalTask.ClearIniFile('LOCAL');

    DocRecord.ClearLayoutIni;
    for i:=0 to DocRecord.DocDBItems.Count-1 do begin
      DBItem:=DocRecord.DocDBItems[i];
      for j:=0 to DBItem.LayoutList.Count-1 do begin
        DBItem.LayoutList.Item[j].ClearValueList;
      end;
      {
      Loader:=TDBItemLoader.Create;
      Loader.LoadFromIni(Doc2Sel.GetMetaFileName);
      TableView:=DBItem.ViewList.ByName(CDefaultTableViewName);
      if not DBItem.IsViewOpen then begin
        TableView.SetDefaultColView;
        Loader.InitTableView(DBItem.Name, TableView)
      end;
      Loader.Free;
      }
    end;
    ShowMessage('Необходимо перезапустить программу');
    {
    DBItem:=DocRecord.DocDBItems.ByName('DOC_MAIN');

    Loader:=TDBItemLoader.Create;
    Loader.LoadFromIni(Doc2Sel.GetMetaFileName);
    TableView:=DBItem.ViewList.ByName(CDefaultTableViewName);
    if not DBItem.IsViewOpen then begin
      TableView.SetDefaultColView;
      Loader.InitTableView('DOC_MAIN', TableView)
    end;
    Loader.Free;
    }
  end;
end;

procedure TfmMain.imgNewPostClick(Sender: TObject);
begin
  TBToolWindowE.Visible:=false;
end;

procedure TfmMain.TimerNewPostTimer(Sender: TObject);
begin
  if SMDO<>nil
    then SMDO.CheckMail_Syna;
end;

procedure TfmMain.acSaveCertExecute(Sender: TObject);
begin
  Gisun.SaveCertToSChannel;
end;
//--- Ведомственный архив -------------------------------------------------------
procedure TfmMain.TBItemNomekToVedomArxClick(Sender: TObject);
begin
  NomekToVedomArx;
end;
//---------------------
procedure TfmMain.TBItemDeloToVedomArxClick(Sender: TObject);
begin
  DeloToVedomArx;
end;
//---------------------
procedure TfmMain.TBItemLoadSysSprClick(Sender: TObject);
begin
  RunLoadSysSpr(pn);
end;

initialization
  ListGurnal := TStringList.Create;
finalization
  ListGurnal.Free;
end.
