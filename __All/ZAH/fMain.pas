//Захоронения
unit fMain;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt,
  MetaTask, mPermit, frRtfExp, frOLEExl, FR_Class, FR_E_HTML2, FR_DCtrl, FR_AdsDb, StrUtils,
  ActnList, ImgList, TB2MDI, TB2Dock, TB2Toolbar, TB2Item, StdCtrls, Mask, DateUtils,
  DBCtrlsEh, db, {fChGKX,} dBase, fExportStru, fmQueryEx, MainLibFr, reportTask, uTypes,fMyNotify,
  FR_VCCtrl, frCheckListBox, uPadegFIO, UserEvents, fParamsGisun,
  {fLichSchet, dLichSchet, fMen,dMen,} adsset, adsdata, AdsDictionary,
  fGurnal, FuncPr, FuncEh,OLEUtils, kbmMemTable,
  kbmMemCSVStreamFormat, mFindInt, FR_DSet, FR_DBSet, SasaIniFile, adsTable,
  dbFunc, Grids, DBGridEh, {$IFNDEF EHLIB3 } GridsEh, {$ENDIF}
  TB2ToolWindow,fmSetUpAction,uUtilFiles,FileCtrl,
  {$IFDEF OBR_GRAG}
    mDRecInt,
  {$ENDIF}
  fSimpleD, uCheckbase, fParamQuest,ShellAPI, IdHTTP, IdComponent,
  {$IFDEF USE_TEMPLATE}
    mTempl, mTplInt,
  {$ENDIF}                             
  extctrls,buttons, act2rtf, sasadbgrid, RKP, fRunObrab, OpisEdit,  mVerInfo,
 {$IFDEF VER150} Variants, {$ENDIF}
 {$IFDEF GISUN} uGisun, {$ENDIF}
 {$IFDEF USE_FR3} MainLibFR3, frxAdsComponents, modify_components, {frx2xto30,}
  frxClass, frxDCtrl, frxDesgn, frxExportRTF, frxExportHTML, frxDBSet,
  frxExportMail, frxExportImage, frxExportXML, frxExportPDF, frxRich, frxChart, frxRes, {$ENDIF}
  adscnnct, uPSComponent,NativeXML, ComCtrls, Animate, GIFCtrl,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, InvokeRegistry, Rio,
  SOAPHTTPClient, IdTCPConnection, IdTCPClient, frxExportXLS, frxExportCSV,
  frxExportBIFF, IdFTP, cxGraphics;

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
    acSprSOATO: TAction;
    TBSubmenuSpr: TTBSubmenuItem;
    acTest: TAction;
    TBItemTest: TTBItem;
    acSQL: TAction;
    TBItem7: TTBItem;
    acDesignReport: TAction;
    TBItemReport: TTBItem;
    acPropertyObj: TAction;
    TBItem9: TTBItem;
    acAdres: TAction;
    acSprPunkt: TAction;
    TBItemPunks: TTBItem;
    acEditProg: TAction;
    TBItem12: TTBItem;
    acSprStran: TAction;
    acSprTypeUL: TAction;
    acSprUL: TAction;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBSubmenuCreate: TTBSubmenuItem;
    TBSubmenuHelp: TTBSubmenuItem;
    TBItemAbout: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    acSprWork: TAction;
    acSprDolg: TAction;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItemExit: TTBItem;
    TBSubmenuItemDok: TTBSubmenuItem;
    acReSmert: TAction;
    TBItem34: TTBItem;
    acZSmert: TAction;
    TBItem39: TTBItem;
    acUpdateBase: TAction;
    TBItemReindexBase: TTBItem;
    acInstruct: TAction;
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
    TBSeparatorItem10: TTBSeparatorItem;
    acBackup: TAction;
    acRestore: TAction;
    TBItemBackup: TTBItem;
    TBItemRestore: TTBItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBDock2: TTBDock;
    TBToolbar1: TTBToolbar;
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
    TBItem47: TTBItem;
    acSetPassword: TAction;
    TBItem48: TTBItem;
    acFullUpdate: TAction;
    TBItem49: TTBItem;
    acFullClose: TAction;
    acFullOpen: TAction;
    TBItem50: TTBItem;
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
    mtTablesFieldsFTS: TBooleanField;
    acSprPrichSm: TAction;
    TBItem62: TTBItem;
    acSprNamesM: TAction;
    TBItem75: TTBItem;
    acSprNamesG: TAction;
    TBItem76: TTBItem;
    acSprNames: TAction;
    acVigrZAH: TAction;
    acLoadZAGS: TAction;
    mtTablesFieldsNotGroupBy: TBooleanField;
    TBItemRegisterProg: TTBItem;
    TBSeparatorItem14: TTBSeparatorItem;
    acAddReportZAGS: TAction;
    TBItemReportZags: TTBItem;
    acReindexBase: TAction;
    acExceptFIO: TAction;
    TBSeparatorItem16: TTBSeparatorItem;
    TBItem83: TTBItem;
    TBSubmenuSysSpr: TTBSubmenuItem;
    TBSubmenuReports: TTBSubmenuItem;
    TBSubmenuWord: TTBSubmenuItem;
    acRunObrab: TAction;
    TBItemRunObrab: TTBItem;
    acPropHouse: TAction;
    frCurDok: TfrDBDataSet;
    mtTablesFieldsEnableH: TBooleanField;
    acSprFamily: TAction;
    TBSubmenuFIO: TTBSubmenuItem;
    TBItem92: TTBItem;
    TBSubmenuAdd: TTBSubmenuItem;
    acSprPerevod: TAction;
    TBSubmenuBlank: TTBSubmenuItem;
    acRunAutoRestore: TAction;
    TBItemAutoRestore: TTBItem;
    TBItem93: TTBItem;
    acShablon: TAction;
    TBItem94: TTBItem;
    acSprOrganiz: TAction;
    TBItemSeriaSvid: TTBItem;
    acSeriaSvid: TAction;
    acSprTypePunkt: TAction;
    acProvSvidZAGS: TAction;
    acWordShtamp: TAction;
    TBItem6: TTBItem;
    TBItemNew: TTBItem;
    acGerbShamp: TAction;
    TBItem95: TTBItem;
    TBSeparatorItem23: TTBSeparatorItem;
    acViewLogFile: TAction;
    TBItem96: TTBItem;
    ConnectExp: TAdsConnection;
    TBSubmenuVigr: TTBSubmenuItem;
    TBItem99: TTBItem;
    TBItem103: TTBItem;
    TBSeparatorItem26: TTBSeparatorItem;
    acSprZAH: TAction;
    TBItem105: TTBItem;
    mtTablesFieldsEnableI: TBooleanField;
    acObrach: TAction;
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
    mtSprPropertyMINVALUE: TIntegerField;
    mtSprPropertyMAXVALUE: TIntegerField;
    mtSprPropertyDISPLAYFORMAT: TStringField;
    mtTablesFieldsCalc: TMemoField;
    acVigrBelGosStrax: TAction;
    acUnionBase: TAction;
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
    acLoadMRUListZAGS: TAction;
    acDesignReport3: TAction;
    TBItemReport3: TTBItem;
    acVigrStat: TAction;
    acSprDocAdmProc: TAction;
    TBItem14: TTBItem;
    acVigrRIAP: TAction;
    acViewVigrRIAP: TAction;
    acVigrSocZ: TAction;
    TBToolWindowSpec: TTBToolWindow;
    edSpec: TStaticText;
    frxReport: TfrxReport;
    acSprRnGorod: TAction;
    TBItemRnGorod: TTBItem;
    TBSubmenuTune: TTBSubmenuItem;
    TBItemBrakLastDataZ: TTBItem;
    acLoadChangeATE: TAction;
    acSimpleSeekAkt: TAction;
    kbmCSVStreamFormat2: TkbmCSVStreamFormat;
    Dokument: TkbmMemTable;
    SvidPovtor: TkbmMemTable;
    HistZAGS: TkbmMemTable;
    tbRnGor: TkbmMemTable;
    tbRnGorID: TIntegerField;
    tbRnGorKOD: TStringField;
    tbRnGorNAME: TStringField;
    acSetUserGIS: TAction;
    TBSeparatorItem9: TTBSeparatorItem;
    TBItem54: TTBItem;
    acClearUserGIS: TAction;
    TBItem55: TTBItem;
    acCheckUpdate: TAction;
    TBSeparatorItem21: TTBSeparatorItem;
    TBItemCheckUpdate: TTBItem;
    GIFAnimator: TRxGIFAnimator;
    pb: TProgressBar;
    btCancel: TButton;
    IdAntiFreeze: TIdAntiFreeze;
    HTTPRIO1: THTTPRIO;
    TBItemGISClass: TTBItem;
    acSeekAkt: TAction;
    TBItemXMLtoSPR: TTBItem;
    frxBIFFExport1: TfrxBIFFExport;
    frxCSVExport1: TfrxCSVExport;
    frxXLSExport1: TfrxXLSExport;
    TBItemNotGISUN: TTBItem;
    IdFTP1: TIdFTP;
    acParamsFTP: TAction;
    TBItem78: TTBItem;
    frxPDFExport: TfrxPDFExport;
    acLoadClass: TAction;
    TBItemLoadFromZAGS: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItemPerevod: TTBItem;
    acZagrZAH: TAction;
    TBItemZagrZAH: TTBItem;
    TBItemVigrZAH: TTBItem;
    acSprRazmer: TAction;
    TBItemSprRazmer: TTBItem;
    TBItemLoad_IN_Gis: TTBItem;
    pn: TPanel;
    sb: TStatusBar;
    acLoadCSV: TAction;
    TBItemLoadCSV: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItemLoadSCV_M: TTBItem;
    TBItemPropUsers: TTBItem;
    acGisunParams: TAction;
    TBItemGISUNParams: TTBItem;
    acRefreshCOC: TAction;
    TBItemRefreshCOC: TTBItem;
    acSaveCert: TAction;
    TBItemSaveCert: TTBItem;
    TBItemEditUrl: TTBItem;
    TBItemLoadSysSpr: TTBItem;
    ImageList24: TcxImageList;
    procedure acSetParametersExecute(Sender: TObject);
    procedure acAdminParametersExecute(Sender: TObject);

    procedure OnTemplateMenuClick(Sender: TObject);
    function OnBeforeTemplateAdd(Template:TTemplate):Boolean;
    procedure BuildToolbarMenu;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit_MessageSource(Sender: TObject; var Handled: Boolean);
    procedure GetText_MessageSource(Sender: TField; var Text: String; DisplayText : Boolean);
//    procedure EditSOATO_GES(Sender: TObject; var Handled: Boolean);
//    procedure SOATO_GetText(Sender: TField; var Text: String; DisplayText : Boolean);
    procedure acSprSOATOExecute(Sender: TObject);
    procedure acTestExecute(Sender: TObject);
    procedure acSQLExecute(Sender: TObject);
    procedure acDesignReportExecute(Sender: TObject);
    procedure acPropertyObjExecute(Sender: TObject);
    procedure acAdresExecute(Sender: TObject);
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
    procedure acReSmertExecute(Sender: TObject);
    procedure acReBrakExecute(Sender: TObject);
    procedure acZBrakExecute(Sender: TObject);
    procedure acZRogdExecute(Sender: TObject);
    procedure acZSmertExecute(Sender: TObject);
    procedure acUpdateBaseExecute(Sender: TObject);
    procedure acNaselExecute(Sender: TObject);
    procedure acInstructExecute(Sender: TObject);
    procedure acFindOperExecute(Sender: TObject);
    procedure acCreateSostExecute(Sender: TObject);
    procedure acBackupExecute(Sender: TObject);
    procedure acRestoreExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure acFullCloseExecute(Sender: TObject);
    procedure acFullOpenExecute(Sender: TObject);
    procedure acUstOtcExecute(Sender: TObject);
    procedure acReTalonPribExecute(Sender: TObject);
    procedure acReTalonUbitExecute(Sender: TObject);
    procedure acSetUpActionsExecute(Sender: TObject);
    procedure TBItemOpisTablesClick(Sender: TObject);
    procedure acSprNalogiExecute(Sender: TObject);
    procedure acSprPrichSmExecute(Sender: TObject);
    procedure acVostZSmertExecute(Sender: TObject);
    procedure acZRastExecute(Sender: TObject);
    procedure acZChNameExecute(Sender: TObject);
    procedure acSprNamesMExecute(Sender: TObject);
    procedure acSprNamesGExecute(Sender: TObject);
    procedure acZPasportVizaExecute(Sender: TObject);
    procedure acRePassportVizaExecute(Sender: TObject);
    procedure acSprNamesExecute(Sender: TObject);
    procedure acVigrZAHExecute(Sender: TObject);
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
    procedure acSprOwnersExecute(Sender: TObject);
    procedure acReOwnersExecute(Sender: TObject);
    procedure acSprFamilyExecute(Sender: TObject);
    procedure acSprPerevodExecute(Sender: TObject);
    procedure acRunAutoRestoreExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acSprIstExecute(Sender: TObject);
    procedure acShablonExecute(Sender: TObject);
    procedure acSprOrganizExecute(Sender: TObject);
    procedure acSeriaSvidExecute(Sender: TObject);
    procedure acSprTypePunktExecute(Sender: TObject);
    procedure acWordShtampExecute(Sender: TObject);
    procedure TBItemNewClick(Sender: TObject);
    procedure acGerbShampExecute(Sender: TObject);
    procedure acViewLogFileExecute(Sender: TObject);
    procedure acSprPredstExecute(Sender: TObject);
    procedure acDBrakExecute(Sender: TObject);
    procedure acReDeclBrakExecute(Sender: TObject);
    procedure acSprRovdExecute(Sender: TObject);
    procedure acSprVoenkomExecute(Sender: TObject);
    procedure acSprZAHExecute(Sender: TObject);
    procedure acSprPostOchExecute(Sender: TObject);
    procedure acSprSnOchExecute(Sender: TObject);
    procedure acReOcheredExecute(Sender: TObject);
    procedure acObrachExecute(Sender: TObject);
    procedure acSprDocFolderExecute(Sender: TObject);
    procedure acSprDocOfficialExecute(Sender: TObject);
    procedure acSprDocFileListExecute(Sender: TObject);
    procedure acSprDocSubjExecute(Sender: TObject);
    procedure acSprDocManGroupExecute(Sender: TObject);
    procedure TBItem106Click(Sender: TObject);
    procedure acPriemGrExecute(Sender: TObject);
    procedure acVigrBelGosStraxExecute(Sender: TObject);
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
    procedure acSprDocAdmProcExecute(Sender: TObject);
    procedure acVigrRIAPExecute(Sender: TObject);
    procedure acViewVigrRIAPExecute(Sender: TObject);
    procedure acVigrSocZExecute(Sender: TObject);
    procedure TBItemLoadSysPrichSmClick(Sender: TObject);
    procedure edSpecClick(Sender: TObject);
    procedure edSpecDblClick(Sender: TObject);
    procedure acSprRnGorodExecute(Sender: TObject);
    procedure TBItemBrakLastDataZClick(Sender: TObject);
    procedure acLoadChangeATEExecute(Sender: TObject);
    procedure acGurnNaklExecute(Sender: TObject);
    procedure acSimpleSeekAktExecute(Sender: TObject);
    procedure acQueryListINExecute(Sender: TObject);
    procedure acViewINExecute(Sender: TObject);
    procedure acSetUserGISExecute(Sender: TObject);
    procedure acClearUserGISExecute(Sender: TObject);
    procedure acCheckUpdateExecute(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure acUZUstOtcExecute(Sender: TObject);
    procedure TBItemGISClassClick(Sender: TObject);
    procedure acSeekAktExecute(Sender: TObject);
    procedure TBItemGISClass81Click(Sender: TObject);
    procedure TBItemXMLtoSPRClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acGisynParamsExecute(Sender: TObject);
    procedure TBItemNotGISUNClick(Sender: TObject);

    procedure IdHTTP1Status(ASender: TObject; const AStatus: TIdStatus;    const AStatusText: String);

    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;    const AStatusText: String);
    procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;           const AWorkCount: Integer);
    procedure IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;      const AWorkCountMax: Integer);
    procedure IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure acParamsFTPExecute(Sender: TObject);
    procedure acRePredZapisExecute(Sender: TObject);
    procedure acSprPunktExecute(Sender: TObject);
    procedure acLoadClassExecute(Sender: TObject);
    procedure acZagrZAHExecute(Sender: TObject);
    procedure acSprRazmerExecute(Sender: TObject);
    procedure TBItemLoad_IN_GisClick(Sender: TObject);
    procedure acLoadCSVExecute(Sender: TObject);
    procedure TBItemPropUsersClick(Sender: TObject);
    procedure acGisunParamsExecute(Sender: TObject);
    procedure acRefreshCOCExecute(Sender: TObject);
    procedure acSaveCertExecute(Sender: TObject);
    procedure TBItemEditUrlClick(Sender: TObject);
    procedure TBItemLoadSysSprClick(Sender: TObject);
  private
    FYearFiks: Integer;
    FRunActivate : Boolean;
    FDateFiks: TDateTime;
    FFltOpList: TOperList;
    FFltSprList: TSprList;
    FLog_WriteException: Boolean;
    FLog_WriteOwner: Boolean;
    FEventsWordReports : TUserEvents;
    FEventsBlankReports : TUserEvents;
    FEventsBlankZAGSReports : TUserEvents;
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
    {$IFDEF USE_TEMPLATE}
    procedure SetTemplateInterface(const Value: TTemplateInterface);
    {$ENDIF}
    procedure SetYearFiks(const Value: Integer);
  public
    FRunAddMenu:Boolean;
    {$IFDEF USE_FR3}
    frxADSComponents:TfrxADSComponents;
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
    IDLastMen : Integer;  // ID человека который корректировался послежним, заполняется после вызова EditDokument (EditForm)

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


    procedure IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
    procedure IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;   const AWorkCountMax: Integer);
    procedure IdHTTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);

    procedure UpdateParamsEvent( Meta : TMetaTask; const strName : String);
    procedure LoadKeyRnGor(strSOATO:String);
    procedure AfterSaveParamsEvent( Meta : TMetaTask; const strName : String);
    procedure BeforeSaveParamsEvent( Meta : TMetaTask; var lOk : boolean);

    procedure CheckFormLichSchet;
    procedure CheckFormMen;

    function  IsGorSovet : Boolean;
    function CheckSprRnGorod(strTerr:String; sID:String):Boolean;
    function SetVisibleRnGorod:Boolean;

    procedure SetRole;
    //---------------------------------------------------
    procedure DeleteFromListGurnal(strName: String);
    procedure ShowGurnal(ClassGurnal : TFormGurnal; strName : String);
    procedure ShowSeekAktGurnal(strName : String);
    procedure ShowPredZapisGurnal(nType:Integer; strName : String);

    function RunReport(TypeObj: Integer; slPar:TStringList; strID : String):Boolean;

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
    function GetPadeg( strWords : String; Padeg : String) : String;
//    function GetPadegWord( strWord : String; Padeg : String) : String;
    procedure CheckSubMenu;
    procedure SetUpActionsZAH;
    procedure SetCurrentDokument( ds : TDataSet);
    function GetCurrentDokument : TDataSet;

    procedure ChangeParamGISUN;
    procedure CheckCaptionActiveGisun;
    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;
    procedure WMCheckUpdate(var Msg:TMessage); message WM_CHECKUPDATE;

    procedure CreateParamsOpisEditSpr;
    procedure BeforeSaveSprWork( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure BeforeDeleteSprZAH(Grid: TSasaDbGrid;  var lDel: Boolean);
    procedure BeforeDeleteSprWork( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure BeforeClose_ListIN( Grid : TSasaDbGrid; var lClose: Boolean);

    procedure EditRecordSprOwners( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure OnEditRecord_IzbUch( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure OnBeforeDelete_IzbUch( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure OnExportEditSpr(Sender : TObject);
    procedure OnCheckEnableEditSpr(Opis:TOpisEdit; var nEnabled:Integer);
    procedure BeforeDeleteSprUL( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure BeforeDeleteSprPunkt( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure EditRecordSprZAH( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure EditRecordSprNames( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure BeforeDeleteSprNames( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure SprPunkt_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure SprZAH_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure SprZAH_GridGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    function ChoiceZAGS(strSearch : String; var nID : Integer ) : Boolean;

    procedure RunAutoBackup;
    procedure RunAutoRestore;
    procedure RunSeekAndRestore(Sender: TObject);

    function RunProcScript(strFuncName: String; var vResult : Variant): Boolean;
    procedure CaptionProg(sUser:String);

    procedure UpdateActions; override;

    function GetAllLookupNamesForFilter : String;
    function GetAllListNamesForFilter : String;

    //------ FTP ---------------------------------------
//    function CheckUpdate(lRun:Boolean; lShow:Boolean; nTypeServer:Integer;lCheck:Boolean; var strFileUpdate:String):Integer;
    procedure CheckVisibleProgress(lVisible:Boolean; strCaption:String);
    procedure CheckVisibleGIF(lVisible:Boolean; strCaption:String; btVisible:Boolean=true);
    function PutFileFTP(lShow:Boolean; strFileName:String; strDir:String=''):Boolean;
//    function GetFileFTP(lShow:Boolean; strFileName:String; strOutputDir:String; lDeleteFile:Boolean=false):Boolean;
//    function SetPropertyFPT(nTypeServerFTP:Integer; strTypeFile:String):Boolean;
//    function CheckUpdate(lRun:Boolean; lShow:Boolean; nTypeServer:Integer; lCheck:Boolean; var strFileUpdate:String):String;
   //---------------------------------------------------
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

  IL_ADD_CHILD=119;
  IL_ADD_MEN=119;
  IL_ADD=119;
  IL_DEL_CHILD=120;
  IL_DEL_MEN=120;
  IL_DEL=120;

  IL_INFO_CORR=148;

implementation

uses TasksEx, AsyncCalls,
     fPropertyObj, fAbout, fOperFind, fEditSpr, fParamsFTP, fLoadZAH_CSV,
     fChZagrZags2ZAH,  uSynapseObj, uBase,
     fChVigrZAH, fChZagrZAH, fLoad_IN_GIS,
     {fPassport, fGurnPassport, fCreateFiks, fDeleteFiks,}
     NewDialogs, uFilter, fmDosFileView,
     fAktZ, fGurnAktZ, fSetPropUsers,
     {$IFDEF AVEST_GISUN}
     uAvest,
     {$ENDIF}
     uSock,
     fLogon, uProjectAll, fActions, ifpii_dbfunc,
     fEditPerevod, fEditMemo, fChoiceGIS_Class,
     fSetPassword, fCopyData, fOpisTables, SelLibFr, uProject, fExpDs, mExport, fSeekBase,
     uObjectsScript, fWarning, uFindBase, fmChList,
     fRegGISUN, fSeekAkt, fChPunktATE, fEditRecSprZAH,
     fShablon, fChoiceNasel, fTableGurnal, DsiWin32;

{$R *.DFM}

procedure TfmMain.acSetParametersExecute(Sender: TObject);
begin
  if Role.CheckSubSystem(SS_PAR)=ptFull then begin
    GlobalTask.SetEditEventParameter('ID', Edit_MessageSource, GetText_MessageSource, nil);
    GlobalTask.EditParameters;
    edSpec.Caption:=FIOSpec; // 'специалист: '+
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

//-------------------------------------------------------------------------------
function TfmMain.SetVisibleRnGorod:Boolean;
var
  l:Boolean;
  s:String;
begin
  l:=false;
  if (EnabledRnGorod and (Globaltask.ParamAsString('GOROD_FOR_RN')<>'')) then begin
    s:=Globaltask.ParamAsString('KOD');
    if (Pos(Copy(s,1,4)+',', GOROD_WITH_RN) >0) or (Copy(s,1,1)='5') then begin
      l:=true;
    end;
  end;
  acSprRnGorod.Visible:=l;
  Result:=l;
end;

//-------------------------------------------------------------------------------
function TfmMain.CheckSprRnGorod(strTerr:String; sID:String):Boolean;
begin
  Result:=false;
end;

//-------------------------------------------------------------------------------
procedure TfmMain.UpdateParamsEvent(Meta: TMetaTask; const strName: String);
var
  strTerr : String;
begin
  GlobalTask.SetEnabledDuplex( Meta.ParamAsBoolean('DUPLEX') );
  if dmBase.SprZAGS.Active then begin   // вызывается при старте программы когда база закрыта
    if dmBase.SprZAGS.Locate('ID', Meta.ParamAsString('ID'), []) then begin
      strTerr := dmBase.SprZAGS.FieldByName('SOATO').AsString;
      Meta.WriteParamAsString('KOD', strTerr);
    end;
  end;
  strTerr:=Meta.ParamAsString('KOD');
  dmBase.LookUpSoatoSovet.Filtered := false;
  if Role.Status=rsAdmin then begin
    CheckSprRnGorod(strTerr,Meta.ParamAsString('ID'));
  end;
  SetVisibleRnGorod;
{
  dmBase.LookUpSoatoSovet.Filtered := false;
  // все деревни района
  if Copy(strTerr,5,1)='7' then begin // поселковый совет
    dmBase.LookUpSoatoSovet.Filter := 'Substr(KOD,1,4)='+''''+
      Copy(strTerr,1,4)+''''+' and Substr(KOD,8,3)<>'+
      ''''+'000'+''''+' or kod='+QStr(Copy(strTerr,1,4)+'5'+Copy(strTerr,6,5));
  end else if Copy(strTerr,2,1)='4' then begin // город обласного подчинения
    dmBase.LookUpSoatoSovet.Filter := 'KOD='+''''+strTerr+'''';
  end else if Copy(strTerr,5,1)='5' then begin // город районного подчинения
    dmBase.LookUpSoatoSovet.Filter := 'Substr(KOD,1,7)='+''''+Copy(strTerr,1,7)+''''+' or '+
      '(Substr(KOD,1,4)='+''''+Copy(strTerr,1,4)+''''+' and Substr(KOD,5,1)='+QStr('7')+')';
  end else begin
    dmBase.LookUpSoatoSovet.Filter := 'Substr(KOD,1,4)='+''''+
      Copy(strTerr,1,4)+''''+' and (Substr(KOD,8,3)<>'+
      QStr('000')+' or (Substr(KOD,8,3)='+QStr('000')+
      ' and Substr(KOD,5,1)='+QStr('5')+' and Substr(KOD,7,1)<>'+QStr('0')+'))';
  end;
  dmBase.LookUpSoatoSovet.Filtered := true;
}
  {$IFDEF OBR_GRAG}
  DocRecord.UpdateParam;
  {$ENDIF}
end;

//-------------------------------------------------------------------------------
procedure TfmMain.LoadKeyRnGor(strSOATO:String);
//var
//  s,strFilter : String;
begin
{
  s:='';
  if Copy(strSOATO,1,1)='5' then begin
    s:='5';
    strFilter:='substr(kod,3,2)<>''00''';
  end else if Copy(strSOATO,2,1)='4' then begin
    s:=Copy(strSOATO,1,4);
    strFilter:='substr(kod,7,1)<>''0''';
  end;
  if s<>'' then begin
    LoadRnMyGor('KEY_RN_MYGOR',s,strFilter);
  end;
  }
end;

//---------- перед сохранением после корректировки параметров -----------------------
procedure TfmMain.BeforeSaveParamsEvent(Meta: TMetaTask; var lOk : Boolean);
begin
  if oUpdate<>nil then begin 
    if not oUpdate.FRun>0 then
      FreeAndNil(oUpdate);
  end;
end;

//-------------------------------------------------------------------------------
procedure TfmMain.AfterSaveParamsEvent(Meta: TMetaTask; const strName: String);
var
  lOk : Boolean;
  strSOATO : String;
  nID:Integer;
begin
 GlobalFlat := Meta.ParamAsBoolean('FLAT');
// acQueryListIN.Visible:=IsMID(Meta);

 GlobalFontSizeE := Meta.ParamAsInteger('FONT_SIZE');
 lOk := false;
 strSOATO:='';

 nID:=Meta.ParamAsInteger('ID');

 {$IFDEF GISUN}
   if IsActiveGISUN and (Gisun.ConstMessageSource='') then begin
     Gisun.MessageSource:=SystemProg.MessageSourceGISUN(Meta);
     Gisun.RegInt.MessageSource:=SystemProg.MessageSourceGISUN(Meta);
     CaptionProg('');
   end;
 {$ENDIF}

 if dmBase.SprSoato.Locate('ID', nID,[]) then begin
   strSOATO:=dmBase.SprSoato.FieldByNAme('KOD').AsString;
 end;
 if not dmBase.SprNames.Locate('ID', nID,[]) then begin
   dmBase.SprNames.Append;
 end else begin
   dmBase.SprNames.Edit;
 end;

// LoadKeyRnGor(strSOATO);

// MemoWrite(NameFromExe('current_organ'),strSOATO);
 with  dmBase.SprNames do begin
   FieldByName('SOATO').AsString   := strSOATO;
   FieldByName('ID').AsInteger     := nID;
   FieldByName('SHTAMP').AsString  := Meta.ParamAsString('SHTAMP_ZAGS');
   FieldByName('NAME').AsString    := Meta.ParamAsString('NAME');
   FieldByName('NAME_B').AsString  := Meta.ParamAsString('NAME_B');
   FieldByName('KNAME').AsString   := Meta.ParamAsString('KNAME');
   FieldByName('KNAME_B').AsString := Meta.ParamAsString('KNAME_B');
 end;
 dmBase.SprNames.Post;

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
      FieldByName('FIO').AsString:=Meta.ParamAsString('RUKOV');
      FieldByName('POST').AsString:=Meta.ParamAsString('DOLG_RUKOV');
      FieldByName('NAME').AsString:=FieldByName('FIO').AsString+' - '+FieldByName('POST').AsString;
      Post;
    except
      PutError(' Ошибка обновления справочника должностных лиц');
    end;
  end;
  SetRole;
end;

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

  SetUpActionsZAH;
  FEventsWordReports.LoadEvents('MAIN_WORD_ZAH', TBSubmenuWord);
//  TBSubmenuBlankZAGS.Visible := false;
  FEventsBlankReports.LoadEvents('MAIN_BLANK_ZAH', TBSubmenuBlank);

  //  if not SystemProg.EnableOchered then begin
//    TBItemOchered.Visible:=false;
//  end;
  TBSubmenuSprObr.Visible := false;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  {$IFDEF USE_FR3}
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
  Application.OnHelp:=AppHelp;
  FOpenLic:=false;
  FRunActivate := false;
  LoadFromIni;
  TBToolWindowSpec.DockPos:=2000;
  FYearFiks:=0;
  CreateNotifyProg('');
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
 SaveToIni;
 {$IFDEF USE_FR3}
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
// if GlobalTask.ParamAsBoolean('VIGR_ACTIONS') then begin
//   ActionList2RTF(ActionList,GlobalTask.PathService+'act_list.rtf');
//   ImageList2RTF(ImageList,GlobalTask.PathService+'img_list.rtf');
// end;
 ClearDir(ExtractFilePath(Application.ExeName)+NameTmpDir(2),true);
 GlobalTask.WriteToLogFile('Завершен сеанс пользователя.');
 FEventsWordReports.Free;
 FEventsBlankReports.Free;
 FEventsBlankZAGSReports.Free;
 FreeNotifyProg;

 fmMain := nil;


 // dmLichSchet.Free;
 // fmLichSchet.Free;
 // fmMen.Free;
 // dmMen.Free;
end;

procedure TfmMain.SaveToIni;
begin
// TBIniSavePositions(Self, GlobalTask.PathService+'Menu.ini', '');
 if Role.SystemAdmin then begin
   SaveActionList(ActionList,GlobalTask.PathService+'ActionsZAH.ini')
 end;
end;

procedure TfmMain.LoadFromIni;
begin
  LoadActionList(ActionList,GlobalTask.PathService+'ActionsZAH.ini');
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
  Result := Trim(Result);
end;

//-----------------------------------------------------------------------------------------------------------
function TfmMain.NameOrg( strType : String; strPadeg : String) : String;
var
  s : String;
  arr : TArrStrings;
  i : Integer;
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
  s := Globaltask.ParamAsString(strName);
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

//-----------------------------------------------------------------------------------------------------------
function  TfmMain.SprNameOrg2( nID : Integer; strType : String; strPadeg : String) : String;
begin
  if GlobalTask.ParamAsBoolean('NAME_ORGAN_ZAGS') then begin
    if (FormCurrentDok<>nil) and (FormCurrentDok.DokumentNAME_ZAGS.Asstring<>'') then begin
//      if FormCurrentDok.DokumentID.AsInteger=GlobalTask.ParamAsInteger(ID) then begin   А ЕСЛИ В ПРОЦЕССЕ РАБОТЫ ПОМЕНЯЮТ КОД ОРГАНА ЗАГС ???
        if (Pos('B', strType) > 0) or (Pos('Б', strType) > 0) then begin
          Result := FormCurrentDok.DokumentNAME_ZAGS_B.Asstring;
        end else begin
          Result := FormCurrentDok.DokumentNAME_ZAGS.Asstring;
        end;
        if strPadeg<>'' then begin
          Result := GetPadeg(Result,strPadeg);
        end;
        exit;
//      end;
    end;
  end;
  Result := SprNameOrg( nID, strType, strPadeg);
end;

//-----------------------------------------------------------------------------------------------------------
function  TfmMain.SprNameOrg( nID : Integer; strType : String; strPadeg : String; strNameZags:String) : String;
var
  s : String;
  strName : String;
begin
  strType := Trim(ANSIUpperCase(strType));
  strName := 'NAME';
  if strType <> '' then begin
    if (Pos('K', strType) > 0) or (Pos('.', strType) > 0) or
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
    if nID<=0 then begin
      s := Trim(GlobalTask.ParamAsString('NAME'));
    end else begin
      if dmBase.SprNames.Locate('ID', nID, []) then begin
        s := Trim(dmBase.SprNames.FieldByName(strName).AsString);
      end else begin
        s := 'орган выписки неизвестен';
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
  Result := GlobalTask.ParamAsString('SHTAMP_ZAGS');
  if Trim(Result)='' then begin
    Result:=SprNameOrg2( nID, '', '');
  end;
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
function  TfmMain.NameObl( strPadeg : String) : String;
begin
  Result:=Trim(Globaltask.ParamAsString('OBL'));
  if Result<>'' then begin
    Result := GetPadegWord( Globaltask.ParamAsString('OBL'), strPadeg) + ' ' +
         GetPadegWord( 'область', strPadeg );
  end;
end;
//---------------------------------------------------------------------------
procedure TfmMain.Edit_MessageSource(Sender: TObject; var Handled: Boolean);
var
  Edit : TDbEditEh;
  ds : TDataSet;
  sCode,sName : String;
  i : Integer;
  fld1:TField;
  ed:TDBComboBoxEh;
  arrRec:TCurrentRecord;
  slPar:TStringList;
begin
  Handled := true;
  if Sender is TDbEditEh then begin
    Edit := TDbEditEh(Sender);
  end else begin
    Edit := TDbEditEh(TComponent(Sender).Owner);
  end;
  slPar:=TStringList.Create;
  slPar.Add('CLASS='+IntToStr(ctGKX));
//  EXTCODE_KEY -> TYPESPR;PADL(TRIM(EXTCODE),10,' ')
//  LEX3_KEY    -> TYPESPR;LEX3 )
  slPar.Add('INDEX=EXTCODE_KEY');
  if ChoiceGIS_Class( Edit, Edit.Field.AsString, 'VAL(EXTCODE)>0', arrRec, slPar) then begin
    sCode:=GetValueField(arrRec,'EXTCODE');
    sName:=GetValueField(arrRec,'LEX1');
    ds:=Edit.Field.DataSet;
    Edit.Field.AsString:=sCode;
    fld1:=GlobalTask.GetParamFieldFromKod('NAME'); // название организации
    fld1.AsString:=sName;
  end;
end;
//---------------------------------------------------------------------------
procedure TfmMain.GetText_MessageSource(Sender: TField; var Text: String; DisplayText : Boolean);
var
  sID : String;
  rs:TRecSprGISUN;
begin
  sID:=Sender.AsString;
  rs:=Locate_AllSprGisun(ctGKX {TYPESOURCE_ZAH}, sID);  // uProjectAll
  if rs.Ok then begin
    Text:=sID+'   '+rs.Lex1;
  end else begin
    Text:='Некоррекное значение';
  end;
end;
//---------------------------------------------------------------------------
{
procedure TfmMain.EditSOATO_GES(Sender: TObject; var Handled: Boolean);
var
  Edit : TDbEditEh;
  f : TfmChGKX;
  ds : TDataSet;
  s : String;
  i : Integer;
  fld1,fld2:TField;
  ed:TDBComboBoxEh;
begin
  Handled := true;
  if Sender is TDbEditEh then begin
    Edit := TDbEditEh(Sender);
  end else begin
    Edit := TDbEditEh(TComponent(Sender).Owner);
  end;
  f := TfmChGKX.Create(nil);
  f.IDGES := Edit.Field.AsString;
  if f.ShowModal=mrOk then begin
    Edit.Field.AsString := f.IDGES;
    ds := Edit.Field.DataSet;
    EditDataSet(ds);
    // название организации
    fld1:=GlobalTask.GetParamFieldFromKod('NAME');
    fld2:=nil; //GlobalTask.GetParamFieldFromKod('NAME_B');
    if fld1<>nil  then begin
      fld1.AsString := f.NameGES;    // название
//      fld2.AsString := f.NameBelGES; // название по-белорусски
    end;
    // название области
    fld1:=GlobalTask.GetParamFieldFromKod('OBL');
    fld2:=GlobalTask.GetParamFieldFromKod('RAION');
    if fld1<>nil  then begin
      s := Copy(f.ValueSOATO,1,1)+'000000000';
      if dmBase.SprSoato.Locate('KOD', s, []) then begin
        s := dmBase.SprSoato.FieldByName('NAME').AsString;
        i := Pos(' ', s);
        if i > 0 then s := Copy(s,1,i-1);
        fld1.AsString := s;
      end;
    end;
    if fld2<>nil then begin
      // название района
      if Copy(f.ValueSOATO,2,1)<>'4' then begin
        s := Copy(f.ValueSOATO,1,4)+'000000';
        if dmBase.SprSoato.Locate('KOD', s, []) then begin
          s := dmBase.SprSoato.FieldByName('NAME').AsString;
          i := Pos(' ', s);
          if i > 0 then s := Copy(s,1,i-1);
          fld2.AsString := s;
        end;
      end else begin
        fld2.AsString := '';
      end;
    end;
    fld1:=GlobalTask.GetParamFieldFromKod('RN_GOROD');
    if fld1<>nil then begin
      ed:=TDBComboBoxEh(GlobalTask.GetParamEditFromKod('RN_GOROD'));
      if ed<>nil then begin
        if Copy(f.ValueSOATO,2,1)='4' then begin
          LoadOpisFromSOATO('KEY_RNGOR', Copy(f.ValueSOATO,1,4),'substr(kod,5,3)<>''000'' and substr(kod,7,1)<>''0'' ');
          LoadComboboxFromOpis(ed, 'KEY_RNGOR');
          if Copy(f.ValueSOATO,5,3)='000' then begin
            fld1.AsString:='';
            ed.Enabled:=false;
          end else begin
            ed.Enabled:=true;
            fld1.AsString:=Copy(f.ValueSOATO,5,3);
          end;
        end else begin
          ClearOpis('KEY_RNGOR');
          LoadComboboxFromOpis(ed, 'KEY_RNGOR');
          fld1.AsString:='';
          ed.Enabled:=false;
        end;
      end;
    end;
  end;
  f.Free;
end;
//------------------------------------------------
procedure TfmMain.SOATO_GetText(Sender: TField; var Text: String;  DisplayText : Boolean);
var
  strID, strOBL : String;
begin
  strID := Sender.AsString;
  if dmBase.SprGES.Locate('ID',Sender.AsString,[]) then begin
    strObl := Copy(dmBase.SprGES.FieldByName('SOATO').AsString,1,1);
    Text := Trim(dmBase.SprGES.FieldByName('NAME').AsString);
    Text := strID+'   '+Text + ', '+GlobalTask.CurrentOpisEdit.SeekValue('KEY_OBL', strObl, false);
  end else begin
    Text := 'Некоррекное значение';
  end;
end;
}
//------------ алфавитная книга ----------------
procedure TfmMain.acVUSExecute(Sender: TObject);
begin
end;

//------------ очередь на жилье -------------------------
procedure TfmMain.acReOcheredExecute(Sender: TObject);
begin
end;

//------------- адресная книга -------------
procedure TfmMain.acAdresExecute(Sender: TObject);
begin
end;

//------------ справочник территорий ----------------
procedure TfmMain.acSprSOATOExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SOATO', nil); end;

procedure TfmMain.acSprRovdExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_ROVD', nil); end;

procedure TfmMain.acSprVoenkomExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_VOENKOM', nil); end;

procedure TfmMain.acSprRnGorodExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_RNGOROD', nil); end;

procedure TfmMain.acSprRazmerExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRRAZMER', nil); end;


//--- справочник улиц ---------------------------------------
procedure TfmMain.acSprULExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  {$IFDEF ZAGS}
    Param := nil;
  {$ELSE}
    Param := TParamsEditSpr.Create;
    Param.OnBeforeDelete := BeforeDeleteSprUL;
  {$ENDIF}
  Globaltask.EditSpr('EDIT_SPRUL', Param);
end;
procedure TfmMain.BeforeDeleteSprUL( Grid : TSasaDbGrid; var lDel : Boolean);
//var
//  nID : Integer;
begin
  lDel:=true;
{
  nID := Grid.DataSource.DataSet.FieldByName('ID').AsInteger;
  if dmBase.tbAdres.Locate('UL', nID, []) then begin
    ShowMessage('  Удаление текущей записи запрещено ! ');
    lDel := false;
  end;
  }
end;

procedure TfmMain.SprPunkt_GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  ds:TDataSet;
  old:String;
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
procedure TfmMain.BeforeDeleteSprPunkt( Grid : TSasaDbGrid; var lDel : Boolean);
begin
end;

procedure TfmMain.acSeriaSvidExecute(Sender: TObject);
var
  Opis : TOpisEdit;
begin
  Globaltask.EditSpr('EDIT_SERIASVID', nil);
  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_SERIA_SVID');
  Opis.KeyListFromDataSet:=true;
end;

procedure TfmMain.acSprFamilyExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRFAMILY', nil); end;

procedure TfmMain.acSprIstExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRIST', nil); end;

procedure TfmMain.acSprPredstExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRPREDST', nil); end;

procedure TfmMain.acSprPostOchExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRPOSTOCH', nil); end;

procedure TfmMain.acSprSnOchExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRSNOCH', nil); end;

//---------------------------------------------------------
procedure TfmMain.acSprPerevodExecute(Sender: TObject);
begin
  EditPerevod;
  SetReloadAllMRUName;
end;

//var
//  f:TfmZapisRogd;
//-------------------------------------------------------------------
procedure TfmMain.ChangeParamGISUN;
var
  fmParamsGisun:TfmParamsGisun;
begin
  fmParamsGisun:=TfmParamsGisun.Create(nil);
  fmParamsGisun.SetTypeBase('ZAH');
  if fmParamsGisun.ShowModal=mrOk then begin
    Gisun.SetParamsGISUN('');
  end;
  fmParamsGisun.Free;
end;

procedure TfmMain.acGisunParamsExecute(Sender: TObject);
begin
  if Role.Status=rsAdmin then begin
    ChangeParamGISUN;
  end;
end;
//-------------------------------------------------------------------
procedure TfmMain.acTestExecute(Sender: TObject);
var
//  fmParam:TfmParamQuest;
  strSQL:String;
//  par:TXMLParams;
//  sl:TStringList;
  n:Integer;
  ds:TDataSet;
//  info:TInfoSaveDok;
//  f:TfmSeekAkt;
  s:String;
//  d:TDateTime;
begin
  if not Role.SystemAdmin then exit;

  {  кодирование + запись
  s:=XorEncode(PPP_CONST, 'NOT=WW1234567,100135770,');
  dmBase.ExecuteSQL('UPDATE help SET text='+QStr(s)+' WHERE kod=''ADD63''', dmBase.AdsSharedConnection);
  }

  // чтение
  dmBase.WorkQueryS.SQL.text:='SELECT text FROM help WHERE kod=''ADD63''';
  dmBase.WorkQueryS.Open;
  s:=XorDecode(PPP_CONST, trim(dmBase.WorkQueryS.Fields[0].AsString));
  dmBase.WorkQueryS.Close;
  ShowMessage(s);


//    Gisun.SaveCertToSChannel;

//  n:=17030;

//  ShowMessage(inttostr(dmBase.getATEsys(nil,'Гомельская','Петриковский','Грабовский','','')));
  {
  while n>0 do begin
    ate:=ChoiceFromATE(nil,false,n);
    n:=ate.ate_id;
    if n>0 then begin
      s:='';
      if ate.Category>0 then begin
        m:=Category2TypePunkt(Inttostr(ate.Category));
        dmbase.GetTypePunkt(inttostr(m),'',s);
      end;
      showmessage(ate.Obl+#13+ate.raion+ate.ss+#13+s+' '+ate.name);
    end;
  end;
  }
//  LoadPinsk;

//   Gisun.GetChangeClassif(CLASS_STRAN, STOD(FIRST_DATE_CLASSIF,tdAds), true, false);

//    ShowMessage(inttostr(Gisun.GetFullATE(1000)));

//    ShowPredZapisGurnal(_TypeObj_ZBrak, 'fmPredZapis');


//  ChangeParamGISUN;
//  CheckRegisterAkt(1);

//  showmessage(datepropis(Gisun.GetLastDateChangeClassif(35),3));

//  ShowMessage(dmBase.LoadSQLEx('алфавит|БРАК'));
//  frxReport.PreviewPages.ModifyPage();
  {
  sl:=TStringList.Create;

  sl.Add('NAME_REPORT=fmZapisSmert.ARXIV');
  RunReport(_TypeObj_ZSmert,sl,'88');
  sl.Free;
  }
//  slPar.Add('NAME_REPORT=Лицевой Счет.frf');

{
  slPar.Add('NAME_REPORT=@PrintSSS');  // ???
  slPar.Add('TYPE_REPORT=FR');

//  EditZAGS_ZaklAddIN(-1);

//  showmessage(inttostr(Gisun.GetChangeClassif(CLASS_ORGAN_REG, STOD('19990101',tdClipper))));

 // showmessage(inttostr((3021 div 1000) + 5));

  {
  if not Assigned(f) then  begin
    f:=TfmZapisRogd.Create(nil);
  end else begin
//   f.Dokument.EmptyTable;
//   f.SvidPovtor.EmptyTable;
//   f.HistZAGS.EmptyTable;
  end;

  Dokument.Active:=false;
  SvidPovtor.Active:=false;
  HistZAGS.Active:=false;
  Dokument.FieldDefs.Clear;
  Dokument.Fields.Clear;
  SvidPovtor.FieldDefs.Clear;
  SvidPovtor.Fields.Clear;
  HistZAGS.FieldDefs.Clear;
  HistZAGS.Fields.Clear;


  if PromptForFileName(sFile, '*.sav', '*.sav', 'Choice File SAV', ExtractFilePath(Application.ExeName)+'SaveDok', False) then begin
    info:=f.LoadDokumentFromFile(sFile);
    if info.Error<>'' then begin
//    if not LoadDokumentFromFile([Dokument,SvidPovtor,HistZags], sFile, s, kbmCSVStreamFormat2) then begin
      PutError(info.Error);
    end;
  end;
  ShowMessage(IntToStr(f.Dokument.RecordCount)+#13+
              f.Dokument.FieldByName('Familia').AsString+#13+DatePropis(f.Dokument.FieldByName('Dater').AsDateTime,1)+#13+
              f.Dokument.FieldByName('ON_Familia').AsString+#13+
              f.Dokument.FieldByName('ONA_Familia').AsString);

}


//  f.Free;


//  f:=TfmSeekAkt.Create(Self);
//  f.Show;

//  EnumInterfaces(s);
//  ShowMessage(s+chr(13)+GetLocalIP);
//   ShowXMLError(NameFromExe('GISUN\Err\SOAPResponse.xml'));

//  fmRegGISUN:=TfmRegGISUN.Create(nil);
//  fmRegGISUN.Show;

//  ShowMessage('PathMainData='+GlobalTask.PathMainData+#13+
//              'PathParam='+GlobalTask.PathParam+#13+
//              'MainDataBaseName='+GlobalTask.MainDataBaseName+#13+
//              'PathService='+GlobalTask.PathService+#13);
//  slPar:=TStringList.Create;

  //------лицевой счет--------------
  //slPar.Add('NAME_REPORT=fmLichSchet.SpxNalLS');
//  slPar.Add('NAME_REPORT=Лицевой Счет.frf');

{
  slPar.Add('NAME_REPORT=@PrintSSS');  // ???
  slPar.Add('TYPE_REPORT=FR');
  RunReport(dmBase.TypeObj_Lich,slPar,'405');
}


//  FreeAndNil(slPar);
//  ShowMessage(DSiGetLongPathName('F:\Projects\Selsovet7\Lais.exe'));
//  ShowMessage('"'+GetDocArxivFolder(sfilename)+'"');
  {
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='Параметры';
  fmParam.AddParamEx(Now, 'Дата1' , 'DATE1' ,'TYPE=DATE');
  fmParam.AddParamEx(Now, 'Дата2' , 'DATE2' ,'TYPE=DATE');
  fmParam.AddButtons('Выполнить~Отказ',0);
  n:=fmParam.ShowQuest;
  if n=1 then begin
    par.Connection:=dmBase.AdsConnection;
    par.firstDate:=fmParam.GetValue('DATE1', 'D');
    par.lastDate:=fmParam.GetValue('DATE2', 'D');
    par.Name:=GlobalTask.ParamAsString('NAME');
    par.Soato:=GlobalTask.ParamAsString('KOD');
    par.ID:=GlobalTask.ParamAsString('ID');
    par.PathReport:=GetFullNameReport('&ss2zags_report.fr3');
    par.PathIni:=Globaltask.PathService+'\field2xml.ini';
    par.ExceptList:='sys';
    sFileName:='Z'+Copy(GlobalTask.ParamAsString('KOD'),1,4)+'_'+'.xml';
    par.PathXml:=GetFolderMyDocument+'\'+sFileName;
    if ZAGS2Xml([tbBirth,tbMarriages,tbDeath,tbPaternity],par) then begin
      ShowMessage('Сформированный файл находиться в папке "Мои документы" под именем:'+#13#10+sFileName);
    end else begin
      Puterror('Ошибка выгрузки');
    end;
  end;
  fmParam.Free;
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
begin
end;
//----------------------------------------------------------------------------------------------------------------------------
procedure TfmMain.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if Column.Field.DataSet.FieldByName('HANDLED').AsBoolean then begin
    AFont.Color := clRed;
  end else begin
    if not Gisun.SeekClassGisun(CLASS_ORGAN_REG,Column.Field.DataSet.FieldByName('ID').AsString) then begin
      AFont.Color := clBlue;
    end;
  end;
end;

//-----------------------------------------------------------------------------------------------------------------------------
procedure TfmMain.BeforeDeleteSprNames( Grid : TSasaDbGrid; var lDel : Boolean);
var
  nID : Integer;
begin
  nID := GlobalTask.ParamAsInteger('ID');
  if Grid.DataSource.DataSet.FieldByName('ID').AsInteger=nID then begin
    ShowMessageCont('  Удаление текущей записи запрещено ! ',Self);
    lDel := false;
  end;
end;

procedure TfmMain.acSprOsibOtmExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPROSOBOTM', nil); end;

//------- один и тотже справочник SprKomiss--------------
procedure TfmMain.acSprKomissExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRKOMISS', nil); end;
//-------------------------------------------------------------------------
// SprZAH  (события)
//-------------------------------------------------------------------------
procedure TfmMain.acSprZAHExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  Param:=TParamsEditSpr.Create;
  Param.OnEditRecord := EditRecordSprZAH;
  Param.OnBeforeDelete:=BeforeDeleteSprZAH;
  Param.OnGetCellParams := SprZAH_GridGetCellParams;
  Param.Col1 := 'ATE';
  Param.GetCellParams_Col1 := SprZAH_GridGetCellParams1;
  Globaltask.EditSpr('EDIT_SPRZAH', Param);
//    Param.Free;  удаляется после уничтожения формы
end;
procedure TfmMain.SprZAH_GridGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  ATE:TATE;
begin
  if not EditMode and (Params.Text<>'') then begin
    ATE.ATE_ID:=StrToIntDef(Params.Text,0);
    if ATE.ATE_ID>0 then begin
      Params.Text:=FullNameFromATE(ATE,0,', ');
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
//-------------------------------------------------------------------------
// SprZAH  (end)
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

procedure TfmMain.acSprWorkExecute(Sender: TObject);
begin
  Globaltask.EditSpr('EDIT_SPRWORK', nil);
  {$IFDEF OBR_GRAG}
//    DocRecord.UpdateSpr('SP_CORR');
  {$ENDIF}
end;

procedure TfmMain.acSprOrganizExecute(Sender: TObject);
begin
  Globaltask.EditSpr('EDIT_WORK_ZAGS', nil);
  {$IFDEF OBR_GRAG}
    DocRecord.UpdateSpr('SP_CORR');
  {$ENDIF}
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
  if (Grid.DataSource.DataSet.FieldByName('NAME').AsString='') and (Grid.DataSource.DataSet.FieldByName('FNAME').AsString<>'') then begin
    Grid.DataSource.DataSet.FieldByName('NAME').AsString:=Grid.DataSource.DataSet.FieldByName('FNAME').AsString;
  end;
end;

procedure TfmMain.BeforeDeleteSprWork(Grid: TSasaDbGrid;  var lDel: Boolean);
var
  sErr:String;
  nID:Integer;
begin
  lDel:=true;
  nID:=Grid.DataSource.DataSet.FieldByName('ID').AsInteger;
  if nID>0 then begin
   if dmBase.AktZ.Locate('USLUG_SPR',nID,[]) then begin
     PutError('Текущее значение присутствует в базе.',grid.Parent);
     lDel:=false;
   end;
   if lDel then begin
      {$IFDEF OBR_GRAG}
         if DocRecord.CanDeleteOrg(nID,sErr) then begin
           PutError(sErr,grid.Parent);
           lDel:=false;
         end;
      {$ENDIF}
    end;
  end;
end;

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
  Param:=TParamsEditSpr.Create;
  Param.OnBeforeSave:=BeforeSaveSprWork;
  Param.OnBeforeDelete:=BeforeDeleteSprWork;
  Param.FreeOnExitSpr:=false;
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('EDIT_SPRWORK');      Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('EDIT_WORK_ZAGS');    Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK');       Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK2');      Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK_ZAGS');  Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK_NAME');  Opis.SetParamsEditSpr(Param);
  Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPR_USLUG');  Opis.SetParamsEditSpr(Param);
  ListParamsSpr.AddObject(Opis.Caption, Param);
  //---------------------------------------------------------------------
  // подключаем экспорт для справочников
  GlobalEditSpr.OnExportSpr:=OnExportEditSpr;
end;

//-------------------------------------------------------
procedure TfmMain.CheckFormMen;
begin
{
  if fmMen = nil then begin
    dmMen := TdmMen.Create(nil);
    fmMen := TfmMen.Create(nil);

    Men.FdmMen     := dmMen;
    fmMen.Dokument := dmMen;

    fmMen.LoadFromIni;
    SelLibFR.SetCurMen( fmMen );
  end;
}
end;

//-------------------------------------------------------
procedure TfmMain.CheckFormLichSchet;
begin
{
  if dmLichSchet = nil then begin
    dmLichSchet := TdmLichSchet.Create(nil);
    dmLichSchet.dmMens := nil;
    fmLichSchet := TfmLichSchet.Create(nil);
    fmLichSchet.Dokument := dmLichSchet;
    fmLichSchet.CreateRunTimeProperty;
    fmLichSchet.LoadFromIni;
    SelLibFR.SetCurLich( fmLichSchet );
  end;
  CheckFormMen;
  if dmLichSchet.dmMens = nil then begin
    dmLichSchet.dmMens := dmMen;
  end;
}
end;

//-------------------------------------------------------
procedure TfmMain.acLichNewSchetExecute(Sender: TObject);
begin
// EditDokument(nil,dmbase.TypeObj_ZSmert,'-1',nil,false,'');
end;

//----------------------------------------------------------------
function TfmMain.RunReport(TypeObj: Integer; slPar:TStringList; strID : String):Boolean;
begin
  Result:=false;
  if slPar.IndexOf('RUN_REPORT')=-1
    then slPar.Add('RUN_REPORT=1');
  if (strID<>'') and (strID<>'0') then begin
    Result:=EditDokument(nil,TypeObj,strID,slPar,false,'');
  end else begin
    PutError('Требуемый объект не найден.')
  end;
end;

//----------------------------------------------------------------
function TfmMain.EditDokument(ds: TDataSet; TypeObj: Integer; strFieldID : String; slPar : TStringList; lEnableSkip : Boolean; strKodGurnal : String) : Boolean;
var
  nID : Integer;
  strID : String;
//  Date_Fiks : TDateTime;
  l,lVosstan : Boolean;
begin
  IDLastDok:=0;
  Result := false;

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
//    Date_Fiks:=dmBase.GetDateCurrentSost;
    if (slPar<>nil) and (slPar.Count>0) then begin
      lVosstan:=(slPar.Values['VOSSTAN']='1');
    end else begin
      lVosstan:=false;
    end;
  end else begin
//    if ds.FindField('DATE_FIKS')<>nil
//      then Date_Fiks:=ds.FieldByName('DATE_FIKS').AsDateTime
//      else Date_Fiks:=0;
    if ds.FindField('VOSSTAN')<>nil
      then lVosstan:=ds.FieldByName('VOSSTAN').AsBoolean
      else lVosstan:=false;
  end;
  //------------------ лицевой счет -----------------------------------------------------
  if TypeObj = dmBase.TypeObj_Lich then begin
  //------------------ человек -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_Nasel then begin
  //------------------ акта о захоронении -----------------------------------------------------
  end else if TypeObj = _TypeObj_AktZAH then begin
    if not (strID='') then begin
       Result := EditAktZ(nID,slPar);
     end;
  end else if TypeObj = _TypeObj_UZUstOtc then begin
  end else begin
    PutError(' Неизвестный тип документа:'+IntToStr(TypeObj));
  end;

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
    ss := NAME_PROG+' (демо-версия)';
  end else begin
     ss:=NAME_PROG;
    {$IFDEF GISUN}
      if Gisun.Version=0
        then ss:=NAME_PROG
        else ss:=NAME_PROG+' (ГИС РН '+IntToStr(Gisun.Version)+')';
    {$ELSE}
      ss:=NAME_PROG;
    {$ENDIF}
  end;
  sss:=dmBase.GetVersionZAH(false);
//  ShowAbout(dmBase.GetEngineVersion, 'Версия базы: '+sss,ss,s);
  ShowAbout(dmBase.GetEngineVersion, 'Версия базы: '+dmBase.GetVersionBase(nil),ss,s);
end;

constructor TfmMain.Create(Owner: TComponent);
begin
  inherited;
  ListParamsSpr:=TStringList.Create;
  FFltOpList  := TOperList.Create;
  FFltSprList := TSprList.Create;
  FLog_WriteException := true;
  FLog_WriteOwner     := true;
  FRunAddMenu:=false;
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
  obj:TObject;
begin
  for i:=0 to ListParamsSpr.Count-1 do begin
    obj:=ListParamsSpr.Objects[i];
    if obj<>nil
      then obj.Free;
  end;
  {$IFDEF USE_TEMPLATE}
  FTemplateInterface.Free;
  {$ENDIF}
  FFltOpList.Free;
  FFltSprList.Free;
  {$IFDEF OBR_GRAG}
    DocRecord.Free;
  {$ENDIF}
  GlobalTask.UpdateIni;
  inherited;
end;

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
          Gurnal.PrepareMenu;
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

procedure TfmMain.ShowSeekAktGurnal(strName : String);
var
  i : Integer;
  Gurnal : TfmSeekAkt;
begin
  Gurnal := nil;
  strName := ANSIUpperCase(Trim(strName));
  for i:=0 to ListGurnal.Count-1 do begin
    if ListGurnal.Objects[i] is TfmSeekAkt and
       (ListGurnal.Strings[i] = strName) then begin
      Gurnal := TfmSeekAkt(ListGurnal.Objects[i]);
      break;
    end;
  end;
  if Gurnal = nil then begin
    Gurnal:=TfmSeekAkt.Create(Self);
    Gurnal.Name:=strName;
    ListGurnal.AddObject(strName, Gurnal);
  end;
  if Gurnal<>nil then begin
    Gurnal.BringToFront;
    Gurnal.Show;
    SetRole;
  end;
end;

procedure TfmMain.ShowPredZapisGurnal(nType:Integer; strName : String);
begin
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
//  edSost.Text := dmBase.NameSostFromDate(FDateFiks);
  if (Role.Status = rsAdmin) or Role.SystemAdmin then begin
//    acCreateSost.Enabled :=  FDateFiks=dmBase.GetDateCurrentSost;
//    acDeleteSost.Enabled :=  FDateFiks=dmBase.GetDateCurrentSost;
  end;
end;

procedure TfmMain.TBItemExitClick(Sender: TObject);
begin
  Close;
end;

//--------------------------------------------------------
procedure TfmMain.SetRole;
var
  lEnabled : Boolean;
  s,sName:String;
begin
  CheckCaptionActiveGisun;
  SetFontParamQuest(10, false);         // размер шрифта для TfmParamQuest

//  acQueryListIN.Visible:=IsMID;
  if GlobalTask.ParamAsInteger('PODR')>0 then begin
    acZagrZAH.Visible:=false;
    acVigrZAH.Visible:=true;
  end else begin
    acZagrZAH.Visible:=true;
    acVigrZAH.Visible:=false;
  end;
  acLoadCSV.Visible:=GlobalTask.ParamAsBoolean('ENABLE_LOAD_CSV');

  if not Role.SystemAdmin then begin
    acDesignReport.Visible  := false;
    acDesignReport3.Visible := false;
    TBSubmenuAdmin.Visible  := false;
  end else begin

//    TBItemSeekAndRestore.Visible:=true;
  end;
  if EnableReport then begin
    acDesignReport.Visible := true;
    acDesignReport3.Visible := true;
  end;

  lEnabled := (ListGurnal.Count=0) and not FRunAddMenu;

  if (Role.Status <> rsAdmin) then begin
    lEnabled := false;
  end;
  acReSmert.Enabled:=(ListGurnal.Count=0);

  TBItemBackup.Enabled      := lEnabled;
  TBItemRestore.Enabled     := lEnabled;
  TBItemReindexBase.Enabled := lEnabled;
  TBItemRunObrab.Enabled    := lEnabled;
  TBSubmenuAdd.Enabled      := lEnabled;
//  TBItemJurnOper.Enabled    := lEnabled;
//  TBItemVigrRIAP.Enabled    := lEnabled;

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

  acPermitUsers.Visible := lEnabled;

  if GlobalTask.ParamAsInteger('AUTO_BACKUP')=0 then begin
    acRunAutoRestore.Enabled := false;
  end;
  if not dmBase.IsMainComputer and not Role.SystemAdmin then begin
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
  SetVisibleRnGorod;

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
//  ShowGurnal(TfmGurnPassport, 'fmGurnPassport');
end;


procedure TfmMain.acRePassportVizaExecute(Sender: TObject);
begin
//  ShowGurnal(TfmGurnPassportViza, 'fmGurnPassportViza');
end;

procedure TfmMain.acReSmertExecute(Sender: TObject);
begin
// реестр записей актов о смерти
  ShowGurnal(TfmGurnAktZ, 'fmGurnAktZ');
end;

// реестр записей регистрации браков
procedure TfmMain.acReBrakExecute(Sender: TObject);
begin
end;

// реестр заявлений на брак
procedure TfmMain.acReDeclBrakExecute(Sender: TObject);
begin
end;

// реестр записей расторжения браков
procedure TfmMain.acUZUstOtcExecute(Sender: TObject);
begin
end;

//  заявление на поспорт
procedure TfmMain.acZPasportVizaExecute(Sender: TObject);
begin
end;

//--------- акт расторжения брака ---------------
procedure TfmMain.acZRastExecute(Sender: TObject);
begin
end;

//--------- акт усыновления (удочерения) ---------------
procedure TfmMain.acZChNameExecute(Sender: TObject);
begin
end;

//--------- акт заключения брака ---------------
procedure TfmMain.acZBrakExecute(Sender: TObject);
begin
end;

//--------- заявление заключения брака ---------------
procedure TfmMain.acDBrakExecute(Sender: TObject);
begin
end;

//----------------------------------------------
procedure TfmMain.acVostZSmertExecute(Sender: TObject);
begin
end;

//--------  акт о рождении -----------------------
procedure TfmMain.acZRogdExecute(Sender: TObject);
begin
end;

//----------------  акт о смерти ------------------
procedure TfmMain.acZSmertExecute(Sender: TObject);
var
  nID : Integer;
  slPar:TStringList;
begin
  nID:=-1;
  slPar:=nil;
  if EditAktZ(nID, slPar)
    then RefreshGurnalAktZ;
end;

// установление отцовства
procedure TfmMain.acUstOtcExecute(Sender: TObject);
begin
end;

// установление материнства
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
//  ShowGurnal(TfmGurnNasel, 'fmGurnNasel');
end;

procedure TfmMain.acInstructExecute(Sender: TObject);
begin
  Application.HelpFile := NameFromExe('sstut.hlp');
  Application.HelpCommand(HELP_FINDER, 0);
//  OpenDocWord('Указания.doc');
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
procedure TfmMain.acCreateSostExecute(Sender: TObject);
begin
end;
//--------------------------------------------------------
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
  TBToolWindowSpec.DockPos:=2000;
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
  GlobalTask.WriteToLogFile(s+E.Message);
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

procedure TfmMain.acReTalonPribExecute(Sender: TObject);
begin
//  ShowGurnal(TfmGurnTalonPrib, 'fmGurnTalonPrib');
end;

procedure TfmMain.acReTalonUbitExecute(Sender: TObject);
begin
//  ShowGurnal(TfmGurnTalonUbit, 'fmGurnTalonUbit');
end;

procedure TfmMain.acReOwnersExecute(Sender: TObject);
begin
//  ShowGurnal(TfmGurnOwners, 'fmGurnOwners');
end;

procedure TfmMain.acSetUpActionsExecute(Sender: TObject);
var
  s : String;
begin
  SetupActions(ActionList,s);   //boolean
  CheckSubMenu;
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
//  sl.AddObject('TBSubMenuLich',TBSubMenuLich);
  sl.AddObject('TBSubMenuItemDok',TBSubMenuItemDok);
  sl.AddObject('TBSubMenuCreate',TBSubMenuCreate);
//  sl.AddObject('TBSubMenuZAGS',TBSubMenuZAGS);
//  sl.AddObject('TBSubMenuSprVus',TBSubMenuSprVus);
  sl.AddObject('TBSubmenuWord',TBSubmenuWord);
  sl.AddObject('TBSubMenuBlank',TBSubMenuBlank);
  sl.AddObject('TBSubMenuReports',TBSubMenuReports);
  sl.AddObject('TBSubMenuSprObr',TBSubMenuSprObr);
  sl.AddObject('TBSubmenuSysSpr',TBSubmenuSysSpr);
  sl.AddObject('TBSubmenuAdd',TBSubmenuAdd);
  sl.AddObject('TBSubMenuService',TBSubMenuService);
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
  if FileExists(GlobalTask.PathService+Tables_Fields+'.mtb') then begin
    CopyFile(PChar(GlobalTask.PathService+Tables_Fields+'.mtb'),
             PChar(GlobalTask.PathService+Tables_Fields+'.mtb.bak'),false);
  end;
  try
    mtTables.LoadFromFile(GlobalTask.PathService+'Tables.mtb');
  except
  end;
  try
    mtTablesFields.LoadFromFile(GlobalTask.PathService+Tables_Fields+'.mtb');
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

procedure TfmMain.SetUpActionsZAH;
begin

//  TBToolWindowS.Visible := false;
//  TBSubmenuZAGS.Caption := 'Дополнительно';
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

procedure TfmMain.acVigrZAHExecute(Sender: TObject);
begin
  RunVigrZAH(0);
end;

procedure TfmMain.acZagrZAHExecute(Sender: TObject);
begin
  RunZagrZAH;
end;

procedure TfmMain.acLoadZAGSExecute(Sender: TObject);
begin
  RunZagrZags2ZAH;
end;

procedure TfmMain.TBItemRegisterProgClick(Sender: TObject);
var
  s,CurKey:String;
  lDemo:Boolean;
begin
  if GlobalTask.DemoVersion then begin
    if GlobalTask.ParamAsString('ID')='' then begin
      lDemo:=true;
    end else begin
      lDemo:=ReadNotKeyProg('ADD63', GlobalTask.ParamAsString('ID'), s);
      if lDemo and Role.SystemAdmin
        then AddNotifyProg(fmMain, 'Текущий ключ:"'+s+'"', false, true,0,0);
    end;
    if not lDemo then begin
      if Copy(ReadKeyProg(CurKey,false),1,5)<>'ZGS10' then begin
  //    GlobalTask.DemoVersion := true;
      end else begin
        GlobalTask.SetEnablePrintReport(true);
        GlobalTask.DemoVersion:=false;
        WriteKeyProg(CurKey);
        TBItemRegisterProg.Visible:=false;
      end;
    end;
  end;
end;

{$IFDEF USE_TEMPLATE}
procedure TfmMain.SetTemplateInterface(const Value: TTemplateInterface);
begin
  FTemplateInterface := Value;
end;
{$ENDIF}

procedure TfmMain.acAddReportZAGSExecute(Sender: TObject);
begin
  if Role.SystemAdmin
    then VisibleButtonDesignInChoice:=true;
  GlobalTask.PreViewReport('AddReportsZAGS');
  VisibleButtonDesignInChoice:=false;
end;

procedure TfmMain.acReindexBaseExecute(Sender: TObject);
var
  lErr : Boolean;
begin
  dmBase.CloseBase;
  lErr := false;
  try
    dmBase.AktZ.Exclusive:=true;
    dmBase.AktZ.Open;
  except
    lErr := true;
    PutError(' Невозможно заблокировать базу для операции индексации ! ');
  end;
  dmBase.AktZ.Active:=false;
  dmBase.AktZ.Exclusive:=false;
  if not lErr then begin
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
 strDir := '';
 if SelectDirectory('Выберите папку c загружаемыми данными', '', strDir) then begin
   strBase := CheckSleshN(strDir) + NAME_DICT;
   if dmBase.IsDirBase( strBase, 0 ) then begin
     dmBase.LoadLichSchet(strBase);
   end else begin
     PutError(' Выбранная папка не является папкой с данными. ')
   end;
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
  GlobalTask.EditSpr('EDIT_IZBUCH',Param);
end;

procedure TfmMain.OnBeforeDelete_IzbUch(Grid: TSasaDbGrid; var lDel: Boolean);
begin
end;

procedure TfmMain.OnEditRecord_IzbUch(Grid: TSasaDbGrid; lAdd: Boolean;  Ic: TIcon);
begin
end;

procedure TfmMain.UpdateActions;
begin
  inherited;
  if ListGurnal.Count=0 then begin
//    if acBackup.En
  end else begin
  end;                      
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
  s:String;
  cur:TCursor;
  strErr,sUpd:string;
  i:Integer;
  lPath:Boolean;
begin
  Application.ProcessMessages;
  for i:=0 to Screen.FormCount-1 do begin
    if ANSIUpperCase(Screen.Forms[i].Name)='MESSAGE' then begin
      Screen.Forms[i].BringToFront;
    end;
  end;
  if not FRunActivate then begin
    FRunActivate := true;

    if dmBase.LastDatabaseError=0 then begin
      fmMain.RunAutoBackup;
    end;

    if dmBase.LastDatabaseError=0 then begin
      // показать окно с невыполнеными обращениями граждан
      {$IFDEF OBR_GRAG}
      DocRecord.ShowInfoWin;
      {$ENDIF}
    end;

    edSpec.Caption:=FIOSpec;     //'специалист: '+

    Application.ProcessMessages;

    {$IFDEF UPDATE_SYNA}
      if Globaltask.ParamAsBoolean('CHECK_UPDATE') then begin
        PostMessage(Handle,WM_CHECKUPDATE,0,0);
      end;
    {$ELSE}
      s:='?';
      sUpd:=CheckUpdate(IdFTP1, false, false, 0, false, s, lPath);
      if sUpd<>'' then begin
        AddNotifyProg(fmMain, 'Доступно обновление программы № '+sUpd, false, true,0,0);
  //      ShowMessage('Доступно обновление программы № '+sUpd)
      end;
      if s<>'' then begin
        MessagesProg:=s;  // !!!
        CheckMessagesProg(MessagesProg);  // !!!   обработка сообщений из файла messages
      end;
    {$ENDIF}

{
    sUpd:=CheckUpdate(IdFTP1, false, false, 0, false, s);
    if sUpd<>'' then begin
      ShowMessage('Доступно обновление программы № '+sUpd)
    end;
}
  end;
end;

procedure TfmMain.acShablonExecute(Sender: TObject);
begin
  EditShablon;
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

procedure TfmMain.TBItemNewClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Доработки Учет захоронений.doc')), nil, nil, SW_SHOWNORMAL);
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
      if (s<>'') and (Copy(s,1,7)='KEY_') then begin
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

procedure TfmMain.acSprDocOfficialExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_OFFICIAL');
  {$ELSE}
    Globaltask.EditSpr('EDIT_SPRDOCOFFICIAL', nil);
  {$ENDIF}
end;

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

procedure TfmMain.acSprDocManGroupExecute(Sender: TObject);
begin
  //Globaltask.EditSpr('EDIT_SPRDOCMAN', nil);
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_MANGROUP');
  {$ENDIF}
end;
//-----------------------------------------------------------

procedure TfmMain.TBItem106Click(Sender: TObject);
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
end;

procedure TfmMain.acVigrSocZExecute(Sender: TObject);
var
  v : Variant;
begin
  v:=null;
  if (GlobalTask.Script<>nil) then begin
    GlobalTask.Script.RunEx('Death2SocZachita',[],v);
  end;
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
  DSiUnShareFolder(sName);
  if DSiShareFolder(sPath,sName,'') then begin
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
//var
//  tb:TAdsTable;
begin
  if dmBase.AnyExport('Выгрузка для портала РИАП     ...','&Vigr_Lais',true,true,'','') then begin

  end;
end;

procedure TfmMain.acViewVigrRIAPExecute(Sender: TObject);
begin
  Globaltask.EditSpr('EDIT_JURNOPER', nil);
end;

procedure TfmMain.TBItemLoadSysPrichSmClick(Sender: TObject);
var
  s:String;
  lOk:Boolean;
begin
  FRunAddMenu:=true;
  SetRole;
  try
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
  finally
    FRunAddMenu:=false;
    SetRole;
  end;
end;

procedure TfmMain.acGurnNaklExecute(Sender: TObject);
begin
end;

//----------------------------------------------------------------
procedure TfmMain.edSpecClick(Sender: TObject);
var
  sDolg,sFIO,sFIO_B:String;
begin
  if ChoiceSpec(sDolg,sFIO,sFIO_B,TBToolWindowSpec) then begin
    GlobalTask.WriteParamAsString('SPEC', sFIO);
//    if sFIO_B='' then begin
//      PutError('Не заполнена ФИО специалиста по-белорусски.');
//    end;
//    GlobalTask.WriteParamAsString('SPEC_B', sFIO_B);
    GlobalTask.WriteParamAsString('DOLG_SPEC', sDolg);
    GlobalTask.SaveParameters;
    edSpec.Caption:=FIOSpec;  // 'специалист: '+
  end;
end;

procedure TfmMain.edSpecDblClick(Sender: TObject);
begin
  edSpecClick(Sender);
end;

procedure TfmMain.TBItemBrakLastDataZClick(Sender: TObject);
begin
  TBItemBrakLastDataZ.Checked:=not TBItemBrakLastDataZ.Checked;
  GlobalTask.SetLastValueAsBoolean('BrakLastDataZ',TBItemBrakLastDataZ.Checked);
end;

//---------------------------------------------------------------------------------
//  Загрузить изменения классификатора АТЕ
procedure TfmMain.acLoadChangeATEExecute(Sender: TObject);
{$IFDEF GISUN}
{$IFDEF GISUN2}
var
  d:TDateTime;
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
        ds := dbOpenSQL('select max(datein) max_date from ate','');   // база по умолчанию на 02.10.2012 !!!
        if ds.FieldByName('MAX_DATE').IsNull
          then d:=STOD('2012-10-03',tdAds)
          else d:=ds.FieldByName('MAX_DATE').AsDateTime+1;
        dbClose(ds);
        Screen.Cursor:=crDefault;
      if Problem('Загрузить изменения классификатора АТЕ (c '+DatePropis(d,3)+') ?') then begin
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
//        Screen.Cursor:=crHourGlass;
        try
          nCount:=Gisun.GetChangeATE(d);
        except
          on E: Exception do begin
            PutError(E.Message);
          end;
        end;
//        Screen.Cursor:=crDefault;
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
    end;
  finally
    FRunAddMenu:=false;
    SetRole;
  end;
{$ENDIF}
{$ENDIF}
end;

procedure TfmMain.acSeekAktExecute(Sender: TObject);
begin
  ShowSeekAktGurnal('fmSeekAkt');
end;

//-----------------------------------------------------------------------
procedure TfmMain.acSimpleSeekAktExecute(Sender: TObject);
begin
end;
//-----------------------------------------------------------------------
procedure TfmMain.acQueryListINExecute(Sender: TObject);
var
  sl:TStringList;
//  sDir:String;
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
    Gisun.GetOnlyIdentifList(n, sl, false);
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
    //Param.OnBeforeDelete := BeforeDeleteSprUL;
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
    //Param.OnBeforeDelete := BeforeDeleteSprUL;
  Param.OnCloseWindow:=BeforeClose_ListIN;
//  Param.OnGetCellParams
//    dmBase.tbSimpleProp.SetRange([_TypeObj_IN],[_TypeObj_IN]);
  GlobalTask.EditSpr('EDIT_LIST_IN', Param);
end;
//-------------------------------------------------
procedure TfmMain.CaptionProg(sUser:String);
var
  ss,sOrg:String;
//  sUtf8:Utf8String;
begin
  if IsActiveGISUN then begin
    if sUser<>'' then begin
      sUser:=' пользоватеь "'+sUser+'"'+'  ';
    end else begin
      if gisun.RegInt.Username=''
        then sUser:=' пользоватеь не установлен '
        else sUser:=' пользоватеь "'+gisun.RegInt.Username+'"'+'  ';
    end;
    if Gisun.ActiveETSP then begin
      ss:='(ЭЦП '+Gisun.NameETSP+')';
    end else begin
      ss:='';
    end;
    sOrg:='организация "'+Gisun.MessageSource+'"  ';
    Caption:='Учет захоронений [ГИС РН '+sUser+sOrg+ss+']';
//    Caption:='['+StrToHex('организация "', ' ')+']';
    acRefreshCOC.Visible:=(Gisun.TypeETSP=ETSP_AVEST);
    acSaveCert.Visible:=(Gisun.TypeETSP=ETSP_AVEST);
  end;
//  MemoWrite('fANSI', Caption);
//  sUtf8:=AnsiToUtf8(Caption);
//  MemoWrite('fUft8', sUtf8);
//  WideString2File('fWide', UTF8Decode(sUtf8));
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
      if Gisun.DbUserAsGIS and (Gisun.RegInt.Password<>'') and (Gisun.RegInt.Username<>'') then begin
        s:=Gisun.RegInt.UserName;
        ss:=Gisun.RegInt.Password;
      end else begin
        s:=Role.UserGIS;
        ss:='';
      end;
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

procedure TfmMain.acCheckUpdateExecute(Sender: TObject);
var
  s,strMessages:String;
  lPath:Boolean;
begin
  {$IFDEF UPDATE_SYNA}
    if oUpdate=nil
      then oUpdate:=TSynapseObj.Create(pn);
    oUpdate.FMessages:='';
    if oUpdate.FUpdate=0 then  begin // не определяли наличие обновления
      oUpdate.FTypeServer:=0;
      oUpdate.FThread:=false;
      oUpdate.FCheckMessages:=true;
      if oUpdate.CheckUpdate then begin
        if Problem('Доступно обновление программы № '+IntToStr(oUpdate.FUpdate)+'. Загрузить?') then begin  //Доступно обновление
          oUpdate.FThread:=true;
          oUpdate.GetFileFTP(true);
          oUpdate.RunFileFTP;
        end;
      end else begin
        if oUpdate.FError=''
          then ShowMessage(PADCStr('Обновление не найдено.',40,' '))
          else PutError(oUpdate.FError);
      end;
    end else begin
      oUpdate.FTypeServer:=0;
      oUpdate.GetFileFTP(true);
      oUpdate.RunFileFTP;
    end;
    if oUpdate.FMessages<>''
      then CheckMessagesProg(oUpdate.FMessages);
  {$ELSE}
//    CheckUpdate(IdFTP1, true, true, 0, true, s, lPath);
  {$ENDIF}
end;

//--------------------------------------------------------------------------------------------------
procedure TfmMain.IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
Var
//  S: String;
  TotalTime: TDateTime;
//  RemainingTime: TDateTime;
  H, M, Sec, MS: Word;
//  DLTime: Double;
begin
//  BytesToTransfer:=BytesToTransfer+AWorkCount;
  TotalTime :=  Now - STime;
  DecodeTime(TotalTime, H, M, Sec, MS);
  Sec := Sec + M * 60 + H * 3600;
//  DLTime := Sec + MS / 1000;
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
//  ID: Cardinal;
begin
  BytesToTransfer:=BytesToTransfer+AWorkCountMax;
  TransferrignData := true;
//  AbortTransfer := false;
  STime := Now;
  AverageSpeed := 0;
  s:=FormatFloat('### ### ###',BytesToTransfer/1024)+'KB';
//  ID := GetCurrentThreadId;
  EnterMainThread;
//  ID := GetCurrentThreadId;
  try
    SB.Panels[1].Text := S;             
    if AbortTransfer then begin              
      TIdHTTP(Sender).Disconnect;
    end;
  finally
    LeaveMainThread;
  end;
//  ID := GetCurrentThreadId;
end;
//-----------------------------------------------------------------------------------------------------
procedure TfmMain.IdHTTP1Status(ASender: TObject; const AStatus: TIdStatus;  const AStatusText: String);
begin
end;
//-----------------------------------------------------------------------------------------------------
procedure TfmMain.IdHTTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  TransferrignData := false;
  AverageSpeed := 0;
end;

procedure TfmMain.btCancelClick(Sender: TObject);
begin
  AbortTransfer:=true;
end;

procedure TfmMain.TBItemGISClassClick(Sender: TObject);
begin
{$IFDEF GISUN}
  FRunAddMenu:=true;
  SetRole;
  try
    if IsActiveGISUN then begin
      Gisun.GetChangeClassif(-999, STOD(FIRST_DATE_CLASSIF,tdAds),true);
    end;
  finally
    FRunAddMenu:=false;
    SetRole;
  end;
{$ENDIF}
end;

procedure TfmMain.TBItemGISClass81Click(Sender: TObject);
begin
{$IFDEF GISUN}
  FRunAddMenu:=true;
  SetRole;
  try
    if IsActiveGISUN then begin
      if Problem('Обновить справочник причин смерти по МКБ10 ?') then
        Gisun.GetChangeClassif(CLASS_MKB10, STOD(FIRST_DATE_CLASSIF,tdAds),true);
    end;
  finally
    FRunAddMenu:=false;
    SetRole;
  end;
{$ENDIF}
end;

procedure TfmMain.TBItemXMLtoSPRClick(Sender: TObject);
var
  n:Integer;
begin
{$IFDEF GISUN}
  n := QuestionPos(' Какой справочник загрузить ? ',
          'Органы;Места зах.;ATE;&Отказ;','',3,4,qtConfirmation,Self);
 if n=1 then begin
   Gisun.GetChangeClassif(ctGKX, STOD(FIRST_DATE_CLASSIF,tdAds),false);
 end else if n=2 then begin
   Gisun.GetChangeClassif(ctZah, STOD(FIRST_DATE_CLASSIF,tdAds),false);
 end else if n=3 then begin
   Gisun.GetChangeATE(STOD('1899-12-30',tdAds),false);
 end;
{$ENDIF}
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Globaltask.ParamAsBoolean('CHECK_POLE_GRN') then begin
    CanClose:=CheckRegisterAkt(1);
  end else begin
    CanClose:=true;
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

procedure TfmMain.acGisynParamsExecute(Sender: TObject);
begin
  if Role.Status=rsAdmin then begin
    ChangeParamGISUN;
  end;
end;

procedure TfmMain.WMDEVICECHANGE(var Msg: TMessage);
begin
{$IFDEF GISUN}
  if Gisun<>nil then begin
    if Gisun.ActiveETSP and Gisun.CheckUSB then begin
      if Msg.Msg = WM_DEVICECHANGE then begin
    //    Gisun.RegInt.PIN:='';
        if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
          (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
          (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then begin
  //        ShowMessage('Change USB Volume');
        end else begin
          Gisun.RegInt.PIN:=''; // SetUserNameToken('','','');
          Gisun.ClearETSPSession;
        end;
      end;
    end;
  end;
{$ENDIF}
end;

procedure TfmMain.WMCheckUpdate(var Msg:TMessage);
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
        s:=E.Message;
        PutError(s);
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
      PutError(E.Message);
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
  pb.Position := pb.max;  //0
  AverageSpeed := 0;
end;

//-----------------------------------------------
procedure TfmMain.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
Var
//  S: String;
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
//    IdFTP1.Abort;
  end;

  PB.Position := AWorkCount;
  AbortTransfer := false;
end;

//----------------------------------------------------------------------------------
//         FTP  (END)
//----------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------
procedure TfmMain.CheckVisibleProgress(lVisible:Boolean; strCaption:String);
begin
  if lVisible then begin
    pb.parent:=sb;
    pb.Left:=sb.Panels[0].Width+10;
    pb.Top:=2;
    pb.Visible:=true;
    btCancel.Parent:=sb;
    btCancel.Left:=pb.Left+pb.Width+10;
    btCancel.Top:=2;
    btCancel.Visible:=true;

    sb.Panels[0].Text:=strCaption;
    sb.Visible:=true;
    Application.ProcessMessages;
  end else begin
    btCancel.Visible:=false;
    sb.Visible:=false;
    pb.Visible:=false;
    sb.Panels[0].Text:='';
    Application.ProcessMessages;
  end;
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
    sb.Visible:=true;
    Application.ProcessMessages;
  end else begin
    btCancel.Visible:=false;
    sb.Visible:=false;
    GIFAnimator.Visible:=false;
    GIFAnimator.Animate:=false;
    sb.Panels[0].Text:='';
    Application.ProcessMessages;
  end;
end;

procedure TfmMain.acParamsFTPExecute(Sender: TObject);
begin
  EditParamsFTP;
end;

procedure TfmMain.acRePredZapisExecute(Sender: TObject);
begin
//  ShowPredZapisGurnal(_TypeObj_ZBrak, 'fmPredZapis');
end;

procedure TfmMain.acSprPunktExecute(Sender: TObject);
begin
//
end;

procedure TfmMain.acLoadClassExecute(Sender: TObject);
begin
  if Role.Status=rsAdmin then begin
     Gisun.GetChangeClassif(0, STOD(FIRST_DATE_CLASSIF,tdAds), true, true);
  end;
end;

procedure TfmMain.TBItemLoad_IN_GisClick(Sender: TObject);
begin
  RunLoad_IN_GIS;
end;

function TfmMain.AppHelp(Command: Word; Data: Longint; var CallHelp: Boolean): Boolean;
begin
  Application.HelpFile:=''; //Screen.ActiveForm.Name + '.hlp';
  CallHelp:=false;
  Result:=true;
end;
//---------------------
procedure TfmMain.acLoadCSVExecute(Sender: TObject);
begin
  LoadZAH_CSV;
end;
//---------------------
procedure TfmMain.SetYearFiks(const Value: Integer);
begin
  FYearFiks := Value;
  GlobalTask.SetWorkParam('YEARFIKS', FYearFiks);
end;
//---------------------
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
//---------------------
procedure TfmMain.acRefreshCOCExecute(Sender: TObject);
var
  n:Integer;
  s:String;
begin
  n:=Avest.RefreshCOC(getURLCOC, true, s, true);
  if s<>''
    then ShowMessage(s);
end;
//------------------------------------------
procedure TfmMain.TBItemEditUrlClick(Sender: TObject);
begin
  Gisun.EditUrlCOC;
end;
//---------------------
procedure TfmMain.acSaveCertExecute(Sender: TObject);
begin
  Gisun.SaveCertToSChannel;
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
