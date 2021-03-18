//СМДО.ЛАИС
unit fMain;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbt,
  DB, FR_DSet, FR_DBSet, kbmMemTable, NativeXML, mMD5,
  kbmMemCSVStreamFormat, frRtfExp, frOLEExl, FR_Class, FR_E_HTML2,
  FR_DCtrl, FR_AdsDb, ActnList, ImgList, TB2MDI, StdCtrls, Mask, DBCtrlsEh,
  TB2ToolWindow, TB2Item, TB2Dock, TB2Toolbar,
  MetaTask, mPermit, StrUtils, DateUtils, fChSS, {fChRR,} dBase, fExportStru, fmQueryEx, MainLibFr, reportTask,
  FR_VCCtrl, frCheckListBox, uPadegFIO, UserEvents,
  fMen,dMen, fGurnNasel,
  adsset, adsdata, AdsDictionary,
  fGurnal,  FuncPr, FuncEh,OLEUtils, uTypes,
  uSMDO, fGurnSMDO, uAvest, fSMDODoc, fEditSprWork,   // СМДО
  mFindInt, SasaIniFile, adsTable,
  dbFunc, Grids, DBGridEh, {$IFNDEF EHLIB3 } GridsEh, {$ENDIF}
  fmSetUpAction,uUtilFiles,FileCtrl,
  {$IFDEF OBR_GRAG} mDRecInt, {$ENDIF}
  fSimpleD, uCheckbase, fParamQuest,ShellAPI,
  {$IFDEF USE_TEMPLATE}
    mTempl, mTplInt,
  {$ENDIF}
  extctrls,buttons, act2rtf, sasadbgrid, RKP, fRunObrab, OpisEdit,
 {$IFDEF VER150} Variants, {$ENDIF}
 {$IFDEF USE_FR3} MainLibFR3, frxAdsComponents, modify_components, //frx2xto30,
  frxClass, frxDCtrl, frxDesgn, frxExportRTF, frxExportHTML, frxDBSet,
  frxExportMail, frxExportImage, frxExportXLS, frxExportXML, frxExportPDF, frxRich, frxChart, {$ENDIF}
  adscnnct, uPSComponent, Animate, GIFCtrl, ComCtrls, fs_ichartrtti, mVerInfo,
  fs_idbrtti, fs_iclassesrtti, ZipForge, IdFTP, IdAntiFreezeBase,
  ftpSend,blcksock,pingsend,
  IdAntiFreeze, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,IdHTTP,
  cxGraphics;

type
  TFormGurnal = class of TfmGurnal;

  TfmMain = class(TForm)
    TBDock1: TTBDock;
    TBToolbarMain: TTBToolbar;
    TBMDIHandler1: TTBMDIHandler;
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
    acSprNac: TAction;
    acSprStran: TAction;
    TBItem3: TTBItem;
    TBItem13: TTBItem;
    acSprFormOb: TAction;
    acSprMestoOb: TAction;
    acSprLgot: TAction;
    acSprTypeUL: TAction;
    acSprUL: TAction;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    acSprEdIzm: TAction;
    TBSubmenuHelp: TTBSubmenuItem;
    TBItemAbout: TTBItem;
    acSprPrNasel: TAction;
    acSprPrLich: TAction;
    acSprUchZaved: TAction;
    acSprOtnosh: TAction;
    acSprWork: TAction;
    acSprDolg: TAction;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    acStrTypePens: TAction;
    acSprTypeMigr: TAction;
    acSprMatSten: TAction;
    acSprPrSozd: TAction;
    acSprPrLikv: TAction;
    acSprTypeHouse: TAction;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItemExit: TTBItem;
    TBSubmenuItemDok: TTBSubmenuItem;
    acUpdateBase: TAction;
    TBItemReindexBase: TTBItem;
    acNasel: TAction;
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
    TBSeparatorItem10: TTBSeparatorItem;
    acBackup: TAction;
    acRestore: TAction;
    TBItemBackup: TTBItem;
    TBItemRestore: TTBItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBDock2: TTBDock;
    TBToolbar1: TTBToolbar;
    TBToolWindowS: TTBToolWindow;
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
    acSprNalogi: TAction;
    mtTablesFieldsFTS: TBooleanField;
    acSprPrichSm: TAction;
    acSprNamesM: TAction;
    TBItem75: TTBItem;
    acSprNamesG: TAction;
    TBItem76: TTBItem;
    acSprNames: TAction;
    mtTablesFieldsNotGroupBy: TBooleanField;
    TBItemRegisterProg: TTBItem;
    TBSeparatorItem14: TTBSeparatorItem;
    acReindexBase: TAction;
    acExceptFIO: TAction;
    TBSeparatorItem16: TTBSeparatorItem;
    TBItem83: TTBItem;
    acSprIzbUch: TAction;
    TBSubmenuSysSpr: TTBSubmenuItem;
    TBSubmenuReports: TTBSubmenuItem;
    TBSubmenuWord: TTBSubmenuItem;
    acSprOsibOtm: TAction;
    acSprKomiss: TAction;
    acRunObrab: TAction;
    TBItemRunObrab: TTBItem;
    acPropHouse: TAction;
    acSprOwners: TAction;
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
    acSprIst: TAction;
    TBItem93: TTBItem;
    acShablon: TAction;
    TBItem94: TTBItem;
    TBItemWorkZAGS: TTBItem;
    acSprMestWork: TAction;
    acSeriaSvid: TAction;
    acSprTypePunkt: TAction;
    acWordShtamp: TAction;
    TBItem6: TTBItem;
    TBItemNew: TTBItem;
    acGerbShamp: TAction;
    TBItem95: TTBItem;
    TBSeparatorItem23: TTBSeparatorItem;
    acViewLogFile: TAction;
    TBItem96: TTBItem;
    acSprPredst: TAction;
    ConnectExp: TAdsConnection;
    TBItem99: TTBItem;
    acSprRovd: TAction;
    acSprVoenkom: TAction;
    TBItem103: TTBItem;
    TBSeparatorItem26: TTBSeparatorItem;
    TBItem104: TTBItem;
    acSprMestRegistr: TAction;
    acSprPostOch: TAction;
    acSprSnOch: TAction;
    mtTablesFieldsEnableI: TBooleanField;
    TBSeparatorItem27: TTBSeparatorItem;
    acObrach: TAction;
    TBItemObr: TTBItem;
    acSprDocFolder: TAction;
    acSprDocOfficial: TAction;
    acSprDocFileList: TAction;
    acSprDocSubj: TAction;
    acSprDocManGroup: TAction;
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
    acUnionBase: TAction;
    TBItemViewFile: TTBItem;
    PSScript1: TPSScript;
    acSprDocGroup: TAction;
    TBItem114: TTBItem;
    acSetShare: TAction;
    acDelShare: TAction;
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
    TBItemVxodDokum: TTBItem;
    TBItemIsxodDokum: TTBItem;
    TBItemAdminProcedur: TTBItem;
    acDesignReport3: TAction;
    TBItemReport3: TTBItem;
    acVigrStat: TAction;
    acSprDocAdmProc: TAction;
    TBItem14: TTBItem;
    pb: TProgressBar;
    btCancel: TButton;
    GIFAnimator: TRxGIFAnimator;
    IdHTTP1: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    IdFTP1: TIdFTP;
    Zip: TZipForge;
    fsClassesRTTI1: TfsClassesRTTI;
    fsDBRTTI1: TfsDBRTTI;
    fsChartRTTI1: TfsChartRTTI;
    acParamsFTP: TAction;
    TBItemParamsFTP: TTBItem;
    acCheckUpdate: TAction;
    TBItemCheckUpdate: TTBItem;
    TBItemLoadFireBird: TTBItem;
    TBItemLoadFireBird2: TTBItem;
    acUpdateAdmProc: TAction;
    TBItemUpdateAdmProc: TTBItem;
    acSprDocAdmProcU: TAction;
    TBItem40: TTBItem;
    TBItem46: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    acSMDORunWebLoadSpr: TAction;
    acSMDORunLoadSpr: TAction;
    acSMDOEditParams: TAction;
    acSMDOPost: TAction;
    acSMDOSprOrg: TAction;
    acSMDOSprKind: TAction;
    acSMDORefreshCOC: TAction;
    TBItemGurnSMDO: TTBItem;
    TBItemLoadSprSMDO: TTBItem;
    TBItemRefreshSprSMDO: TTBItem;
    TBItemSMDOParams: TTBItem;
    TBItemSMDORefreshCOC: TTBItem;
    TimerPKNCI: TTimer;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    ImageList: TImageList;
    TBItem4: TTBItem;
    pn: TPanel;
    sb: TStatusBar;
    acLoadSprSMDO: TAction;
    TBItem5: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    acSprDocSubjG: TAction;
    TBItem8: TTBItem;
    TBItemDefaultIni: TTBItem;
    TBControlItem1: TTBControlItem;
    TBToolWindowE: TTBToolWindow;
    imgNewPost: TRxGIFAnimator;
    lbNewPost: TLabel;
    TimerNewPost: TTimer;
    TBItemNew2: TTBItem;
    TBSeparatorVedArx: TTBSeparatorItem;
    TBItemNomekToVedomArx: TTBItem;
    TBItemDeloToVedomArx: TTBItem;
    ImageList24: TcxImageList;
    acDeloToVedomArx: TAction;
    acNomenToVedomArx: TAction;
    procedure acSetParametersExecute(Sender: TObject);
    procedure acAdminParametersExecute(Sender: TObject);

    procedure OnTemplateMenuClick(Sender: TObject);
    procedure BuildToolbarMenu;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
//    procedure EditSOATO_RR(Sender: TObject; var Handled: Boolean);
    procedure EditSOATO_SS(Sender: TObject; var Handled: Boolean);
//    procedure EditSOATO_Organ(Sender: TObject; var Handled: Boolean);
    procedure Event_EditFormNomer(Sender: TObject; var Handled: Boolean);
    procedure SOATO_GetText(Sender: TField; var Text: String; DisplayText : Boolean);
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
    procedure acSetUpActionsExecute(Sender: TObject);
    procedure TBItemOpisTablesClick(Sender: TObject);
    procedure acSprNalogiExecute(Sender: TObject);
    procedure acSprNamesMExecute(Sender: TObject);
    procedure acSprNamesGExecute(Sender: TObject);
    procedure acSprNamesExecute(Sender: TObject);
    procedure TBItemRegisterProgClick(Sender: TObject);
    procedure acAddReportOchExecute(Sender: TObject);
    procedure acReindexBaseExecute(Sender: TObject);
    procedure TBItemLoadLicClick(Sender: TObject);
    procedure acExceptFIOExecute(Sender: TObject);
    procedure acRunObrabExecute(Sender: TObject);
    procedure acSprFamilyExecute(Sender: TObject);
    procedure acSprPerevodExecute(Sender: TObject);
    procedure acRunAutoRestoreExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acSprIstExecute(Sender: TObject);
    procedure acShablonExecute(Sender: TObject);
    procedure acSprMestWorkExecute(Sender: TObject);
    procedure acSprTypePunktExecute(Sender: TObject);
    procedure acWordShtampExecute(Sender: TObject);
    procedure TBItemNewClick(Sender: TObject);
    procedure acGerbShampExecute(Sender: TObject);
    procedure acViewLogFileExecute(Sender: TObject);
    procedure acSprPredstExecute(Sender: TObject);
    procedure TBItemVigr_LaisClick(Sender: TObject);
    procedure acSprRovdExecute(Sender: TObject);
    procedure acSprVoenkomExecute(Sender: TObject);
    procedure acObrachExecute(Sender: TObject);
    procedure acSprDocFolderExecute(Sender: TObject);
    procedure acSprDocOfficialExecute(Sender: TObject);
    procedure acSprDocFileListExecute(Sender: TObject);
    procedure acSprDocSubjExecute(Sender: TObject);
    procedure acSprDocManGroupExecute(Sender: TObject);
    procedure TBItem106Click(Sender: TObject);
    procedure acPriemGrExecute(Sender: TObject);
    procedure acVigrBelGosStraxExecute(Sender: TObject);
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
    procedure TBItemClearBaseClick(Sender: TObject);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;    const AStatusText: String);
    procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;            const AWorkCount: Integer);
    procedure IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;       const AWorkCountMax: Integer);
    procedure IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure acParamsFTPExecute(Sender: TObject);
    procedure acCheckUpdateExecute(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure acUpdateAdmProcExecute(Sender: TObject);
    procedure acSprDocAdmProcUExecute(Sender: TObject);
    procedure acSMDORunWebLoadSprExecute(Sender: TObject);
    procedure acSMDORunLoadSprExecute(Sender: TObject);
    procedure acSMDOEditParamsExecute(Sender: TObject);
    procedure acSMDOPostExecute(Sender: TObject);
    procedure acSMDOSprOrgExecute(Sender: TObject);
    procedure acSMDOSprKindExecute(Sender: TObject);
    procedure acSMDORefreshCOCExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerPKNCITimer(Sender: TObject);
    procedure acLoadSprSMDOExecute(Sender: TObject);
    procedure acSprDocSubjGExecute(Sender: TObject);
    procedure TBItemDefaultIniClick(Sender: TObject);
    procedure imgNewPostClick(Sender: TObject);
    procedure TimerNewPostTimer(Sender: TObject);
    procedure TBItemNew2Click(Sender: TObject);
    procedure acDeloToVedomArxExecute(Sender: TObject);
    procedure acNomenToVedomArxExecute(Sender: TObject);
  private
    { Private declarations }
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
    procedure SetYearFiks(const Value: Integer);
    {$ENDIF}
  public
    slReports:TStringList;
    {$IFDEF USE_FR3}
    frxADSComponents:TfrxADSComponents;
    frxReport: TfrxReport;
    frxChartObject:TfrxChartObject;
    frxRichObject: TfrxRichObject;
    frxDialogControls: TfrxDialogControls;
    frxPDFExport: TfrxPDFExport;
    frxXMLExport: TfrxXMLExport;
    frxXLSExport: TfrxXLSExport;
    frxJPEGExport: TfrxJPEGExport;
    frxMailExport: TfrxMailExport;
    frxHTMLExport: TfrxHTMLExport;
    frxRTFExport: TfrxRTFExport;
    {$ENDIF}

    FOpenLic : Boolean;      // открыта форма лицевого счета

    IDProg : String;
    IDLastMen : Integer;           // ID человека который корректировался послежним, заполняется после вызова EditDokument (EditForm)
    fmMen : TfmMen;
    dmMen : TdmMen;
    CurDok : TDataSet;
    FormCurrentDok  : TfmSimpleD;
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
    procedure UpdateParamsEvent( Meta : TMetaTask; const strName : String);

    procedure BeforeSaveParamsEvent( Meta : TMetaTask; var lOk : boolean);
    procedure AfterSaveParamsEvent( Meta : TMetaTask; const strName : String);
    procedure CheckFormLichSchet;
    procedure CheckFormMen;
    function IsGorSovet : Boolean;

    procedure SetRole;
    //---------------------------------------------------
    procedure DeleteFromListGurnal(strName: String);
    procedure ShowGurnal(ClassGurnal : TFormGurnal; strName : String);
    function SeekGurnal(strName : String) : TfmGurnal;

    function RunReport(TypeObj: Integer; slPar:TStringList; strIDMen : String):Boolean;

    procedure SetDataSets_fmMen(dm:TdmMen);
    function EditDokument( ds : TdataSet; TypeObj : Integer; strFieldID : String; slPar : TStringList; lEnableSkip : Boolean; strKodGurnal : String) : Boolean;
    //---------------------------------------------------

    procedure WMDEVICECHANGE(var Msg : TMessage); message WM_DEVICECHANGE;
    procedure WMCheckUpdate(var Msg:TMessage); message WM_CHECKUPDATE;


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
    function SprNameOrg( nID : Integer; strType : String; strPadeg : String) : String;
    function SprNameOrg2( nID : Integer; strType : String; strPadeg : String) : String;
    function NameOrg( strType : String; strPadeg : String) : String;
    function NameRaion( strPadeg : String) : String;
    function OnlyNameRaion( strPadeg : String) : String;
    function NameObl( strPadeg : String) : String;
    function GetPadeg( strWords : String; Padeg : String) : String;
//    function GetPadegWord( strWord : String; Padeg : String) : String;
    procedure CheckSubMenu;
    procedure SetUpActionsZAGS;
    procedure SetCurrentDokument( ds : TDataSet);
    function GetCurrentDokument : TDataSet;

    procedure CreateParamsOpisEditSpr;
    procedure BeforeSaveSprWork( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure BeforeDeleteSprWork( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure OnExportEditSpr(Sender : TObject);
    procedure OnCheckEnableEditSpr(Opis:TOpisEdit; var nEnabled:Integer);
    procedure BeforeDeleteSprUL( Grid : TSasaDbGrid; var lDel : Boolean);
//    procedure BeforeDeleteSprPunkt( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure EditRecordSprNames( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure BeforeDeleteSprNames( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);

    procedure RunAutoBackup;
    procedure RunAutoRestore;
    procedure RunSeekAndRestore(Sender: TObject);

    function RunProcScript(strFuncName: String; var vResult : Variant): Boolean;

    procedure UpdateActions; override;

    function GetAllLookupNamesForFilter : String;
    function GetAllListNamesForFilter : String;
    //------ FTP ---------------------------------------
//    function CheckVigrRIAP:Boolean;
    procedure CheckVisibleProgress(lVisible:Boolean; strCaption:String; lCancel:Boolean=true);
    procedure CheckVisibleGIF(lVisible:Boolean; strCaption:String; btVisible:Boolean=true);
    function PutFileFTP(lShow:Boolean; strFileName:String; strDir:String=''):Boolean;
    procedure FileToFTP(nTypeServer:Integer; strFileName:String; lArx:Boolean);
    procedure SetCaptionPanel0(strCaption:String);

    procedure TestFTP;
    procedure Event_OnStatus(Sender: TObject; Response: Boolean;  const Value: string);

//    реализовано в uProject.pas
//    function GetFileFTP(lShow:Boolean; strFileName:String; strOutputDir:String; lDeleteFile:Boolean=false):Boolean;
//    function CheckUpdate(lRun:Boolean; lShow:Boolean; nTypeServer:Integer; lCheck:Boolean; var strFileUpdate:String):String;
//    function SetPropertyFPT(nTypeServerFTP:Integer; strTypeFile:String):Boolean;
//    function  ChoiceFileFTP:String;  // FTP
   //---------------------------------------------------

    procedure CreateSubMenu;
    procedure Event_SubMenuReports(Sender: TObject);

    //--------------- СМДО --------------------
    procedure SMDOCheckVisible;
    procedure SMDOCheckEnabled(lSet:Boolean);
    procedure WM_CheckSendMail(var rec:TMsg); message WM_SEND_MAIL;
    function SMDOReceive(lStart:Boolean; lVisible:Boolean; lCheck:Boolean; nPost:Integer):Integer;
    function SMDOCheckNSI(nTypeSpr:Integer; lRun:Boolean; lShow:Boolean; lCheck:Boolean):String;

  end;

//  procedure DeleteFromListGurnal( strName : String);

var
  fmMain: TfmMain;
  ListGurnal : TStringList;

const
  IL_BRAK=51;   // индекс в ImageList для брака
  IL_ROGD=83;   // индекс в ImageList для рождений
  IL_CH_MEN=2;  //
  IL_ADD_CHILD=119; //87;

  IL_EDIT=118; //87;
  IL_SIGN=87;
  IL_ORG=89;
  IL_ADD_MEN=119; //87;
  IL_ADD=119;
  IL_DEL_CHILD=120; //88;
  IL_DEL=120;
  IL_DEL_MEN=120; //88;

  IL_DATE=56;
  IL_REG_DOC=56;
  IL_OTKAZ=20;
  IL_INFO_CORR=161;

implementation

uses fPropertyObj, fAbout, fOperFind, fEditSpr,
     TasksEx, AsyncCalls, fMyNotify, uSynapseObj, uFuncRegDoc,
     fCreateFiks, fDeleteFiks, fGurnalAdres,  NewDialogs, uFilter, fmDosFileView, mAdsObj, mDRecData,
     fSMDOZagrSpr,   // СМДО
     fActions, ifpii_dbfunc, uCreateXML, fParamsFTP, fEditPerevod, fLogon,
     fSetPassword, fCopyData, fOpisTables, SelLibFr, uProject, uProjectAll, fExpDs, mExport, fSeekBase, fEditSprOff,
     fAdres, dAdres, uObjectsScript, fIzbUch, fPropHouse, fAddSobstv, fWarning, uFindBase, fmChList,
     fPrintSSS, fShablon, fChoiceNasel, fTableGurnal, DsiWin32;

{$R *.DFM}

procedure TfmMain.acSetParametersExecute(Sender: TObject);
begin
  if Role.CheckSubSystem(SS_PAR)=ptFull then begin
    GlobalTask.SetEditEventParameter('KOD', EditSOATO_SS, SOATO_GetText,nil);
    GlobalTask.SetEditEventParameter('VXOD_NOMER', Event_EditFormNomer, nil, nil);
    GlobalTask.SetEditEventParameter('ISXOD_NOMER', Event_EditFormNomer, nil, nil);
    GlobalTask.SetEditEventParameter('ADMIN_NOMER', Event_EditFormNomer, nil, nil);
    GlobalTask.EditParameters;
  end else begin
    GlobalTask.ViewParameters;
  end;
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

function TfmMain.IsGorSovet: Boolean;
begin
  if (Copy(GlobalTask.ParamAsString('KOD'),5,3) > '500') and (Copy(GlobalTask.ParamAsString('KOD'),5,3) < '600') then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

procedure TfmMain.UpdateParamsEvent(Meta: TMetaTask; const strName: String);
var
  strTerr : String;
begin            
  strTerr:=Meta.ParamAsString('KOD');
//  LoadOpisFromSoato('KEY_RN_OCH','','susbtr(kod,1,1)='+QStr(Copy(strTerr,1,1))+' and substr(kod,5,6)=''000000'' and substr(kod,2,3)<>''000'' ',1,4);
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
    dmBase.LookUpSoatoSovet.Filter := 'Substr(KOD,1,7)='+''''+Copy(strTerr,1,7)+'''';
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

//-------------------- после сохранения параметров --------------------------
procedure TfmMain.AfterSaveParamsEvent(Meta: TMetaTask; const strName: String);
begin
  TemplateInterface.OutputDir:=GetFolderMyDocument+'\';
  SetRole;
end;

//-------------------------------------------------
procedure TfmMain.BeforeSaveParamsEvent( Meta : TMetaTask; var lOk : boolean);
var
  strID, strSOATO : String;
begin
  GlobalFlat := Meta.ParamAsBoolean('FLAT');
  GlobalFontSizeE := Meta.ParamAsInteger('FONT_SIZE');
  if oUpdate<>nil then begin
    if not oUpdate.FRun=0 then
      FreeAndNil(oUpdate);
  end;
  if SMDOEnabled
    then SMDO.CheckEnabledPost; // FPostEnabled:=Meta.ParamAsBoolean('ENABLED_POST');

  lOk := false;
//  if dmBase.SprSoato.Locate('KOD', Meta.ParamAsString('KOD'), []) then begin

  if not dmBase.SprNames.Locate('ID', dmBase.SprSoato.FieldByName('ID').AsInteger,[]) then begin
    dmBase.SprNames.Append;
  end else begin
    dmBase.SprNames.Edit;
  end;
  strID := dmBase.SprSoato.FieldByName('ID').AsString;
  strSOATO := Meta.ParamAsString('KOD');
  Meta.WriteParamAsString('ID', strID);
  Meta.WriteParamAsString('NAME', Meta.ParamAsString('NAME_TERR') );
//    Meta.WriteParamAsString('NAME_TERR', dmBase.SprSoato.FieldByName('NAME').AsString);
end;

procedure TfmMain.acAdminParametersExecute(Sender: TObject);
begin
  GlobalTask.AdminParameters;
end;

procedure TfmMain.OnTemplateMenuClick(Sender: TObject);
var
   Template: TTemplate;
   sFunc:String;
   v:Variant;
begin
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
end;

//-------------------------------------------------------------
procedure TfmMain.BuildToolbarMenu;
begin
  FEventsWordReports  := TUserEvents.Create;
  FEventsBlankReports := TUserEvents.Create;

  FEventsWordReports.LoadEvents('MAIN_WORD_POST', TBSubmenuWord);
  TemplateInterface.BuildMenu('MAIN_WORD_POST', TBSubmenuWord, false, OnTemplateMenuClick);
  FEventsBlankReports.LoadEvents('MAIN_BLANK_POST', TBSubmenuBlank);

end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  slReports:=TStringList.Create;
  {$IFDEF USE_FR3}
    frxReport:=TfrxReport.Create(self);
    frxReport.PreviewForm.Caption:='Предварительный просмотр';
    frxADSComponents:=TfrxADSComponents.create(self);
    frxChartObject:=TfrxChartObject.Create(self);
    frxDialogControls:=TfrxDialogControls.Create(self);
    frxRichObject:=TfrxRichObject.Create(self);
    frxPDFExport:=TfrxPDFExport.Create(self);
    frxXMLExport:=TfrxXMLExport.Create(self);
    frxXLSExport:=TfrxXLSExport.Create(self);
    frxJPEGExport:=TfrxJPEGExport.Create(self);
    frxMailExport:=TfrxMailExport.Create(self);
    frxHTMLExport:=TfrxHTMLExport.Create(self);
    frxRTFExport:= TfrxRTFExport.Create(self);
    frxReport.ShowProgress:=true;
  {$ENDIF}
  FOpenLic:=false;
  FYearFiks:=0;

  FRunActivate := false;
  fmMen := nil;
  dmMen := nil;
  LoadFromIni;
  TBToolWindowS.DockPos:=2000;
  CreateNotifyProg('');
                            
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
 slReports.Free;
 SaveToIni;
 {$IFDEF USE_FR3}
 FreeAndNil(frxReport);
 FreeAndNil(frxADSComponents);
 FreeAndNil(frxChartObject);
 FreeAndNil(frxRichObject);
 FreeAndNil(frxDialogControls);
 FreeAndNil(frxPDFExport);
 FreeAndNil(frxXMLExport);
 FreeAndNil(frxJPEGExport);
 FreeAndNil(frxMailExport);
 FreeAndNil(frxHTMLExport);
 FreeAndNil(frxRTFExport);
 {$ENDIF}
{
 if GlobalTask.ParamAsBoolean('VIGR_ACTIONS') then begin
   ActionList2RTF(ActionList,GlobalTask.PathService+'act_list.rtf');
   ImageList2RTF(ImageList,GlobalTask.PathService+'img_list.rtf');
 end;
} 
 FreeNotifyProg;

 ClearDir(ExtractFilePath(Application.ExeName)+NameTmpDir(2),true);

 GlobalTask.WriteToLogFile('Завершен сеанс пользователя.');
 FEventsWordReports.Free;
 FEventsBlankReports.Free;
 FEventsBlankZAGSReports.Free;

 fmMain := nil;


 // dmLichSchet.Free;
 // fmLichSchet.Free;
 // fmMen.Free;
 // dmMen.Free;
end;

procedure TfmMain.SaveToIni;
begin
 if Role.SystemAdmin then begin
   SaveActionList(ActionList,GlobalTask.PathService+'ActionsPost.ini')
 end;
end;

procedure TfmMain.LoadFromIni;
begin
  LoadActionList(ActionList,GlobalTask.PathService+'ActionsPost.ini');
end;

function TfmMain.GetPadeg( strWords : String; Padeg : String) : String;
begin
  Result:=GetPadegWords(strWords, Padeg);
end;

function TfmMain.NameOrg( strType : String; strPadeg : String) : String;
var
  s : String;
  arr : TArrStrings;
  i : Integer;
  strName : String;
begin
  strType := Trim(ANSIUpperCase(strType));
  strName := 'NAME_TERR';     // !!! в других программах это 'NAME' !!!
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

function  TfmMain.SprNameOrg2( nID : Integer; strType : String; strPadeg : String) : String;
begin
{    нужно было для ЗАГС
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
}
  Result := SprNameOrg( nID, strType, strPadeg);
end;

function  TfmMain.SprNameOrg( nID : Integer; strType : String; strPadeg : String) : String;
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
  if dmBase.SprNames.Locate('ID', nID, []) then begin
    s := Trim(dmBase.SprNames.FieldByName(strName).AsString);
  end else begin
    if dmBase.SprSoato.Locate('ID', nID, []) then begin
      s := dmBase.SprSoato.FieldByName('NAME').AsString;
    end;
  end;
  if strPadeg <> '' then begin
    Result := GetPadeg(s,strPadeg);
  end else begin
    Result := s;
  end;
end;

function  TfmMain.ShtampOrg( nID : Integer ) : String;
begin
//      может потом будет такое поле
//    if (FormCurrentDok<>nil) and (FormCurrentDok.DokumentSHTAMP_ZAGS.Asstring<>'') then begin
//    end;
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
end;

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

function  TfmMain.OnlyNameRaion( strPadeg : String) : String;
begin
  Result:=Trim(Globaltask.ParamAsString('RAION'));
  if Result<>'' then begin
    Result := GetPadegWord( Globaltask.ParamAsString('RAION'), strPadeg);
  end;
end;

function  TfmMain.NameObl( strPadeg : String) : String;
begin
  Result:=Trim(Globaltask.ParamAsString('OBL'));
  if Result<>'' then begin
    Result := GetPadegWord( Globaltask.ParamAsString('OBL'), strPadeg) + ' ' +
         GetPadegWord( 'область', strPadeg );
  end;
end;

{
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
  //IFDEF OCHERED
  f.Caption:='Орган';
  //ENDIF
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
}
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
  {$IFDEF OCHERED}
    f.lbDetail.Caption:='Город';
  {$ENDIF}
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

{
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
}
//-------------------------------------------------------------------------------------
procedure TfmMain.SOATO_GetText(Sender: TField; var Text: String;  DisplayText : Boolean);
var
  strSOATO : String;
begin
  strSOATO := Sender.AsString;
  if Length(strSOATO)<10 then begin
    Text := '';
  end else begin
    Text:=dmBase.GetNameTerr(strSOATO, true, true, false);
    {
    strObl:='';
    strRN:='';
    if dmBase.SprSoato.Locate('KOD',strSOATO,[]) then begin

      strSS := Trim(dmBase.SprSoato.FieldByName('NAME').AsString);
      if Copy(strSOATO,2,9)='000000000' then begin  // область целиком

      end else begin
        if (Copy(strSOATO,5,6)='000000') and (Copy(strSoato,2,1)<>'4') then begin  // район целиком
          strSS:=strSS+' район';
        end else begin
          if (Copy(strSoato,5,1)<>'3') then begin  // район большого города
          strType:=dmBase.SprSoato.FieldByName('TYPEPUNKT').AsString;
          if strType<>'' then begin
            dmBase.TypePunkt.Locate('ID',strType,[]);
            strType:=dmBase.TypePunkt.FieldByName('NAME').AsString;
          end;
          if strType<>''
            then strSS:=strType+' '+strSS;

          if dmBase.SprSoato.Locate('KOD',Copy(strSOATO,1,4)+'000000',[]) then begin
            if strSOATO<>Copy(strSOATO,1,4)+'000000' then begin
              strRN := Trim(dmBase.SprSoato.FieldByName('NAME').AsString);
              strType:=dmBase.SprSoato.FieldByName('TYPEPUNKT').AsString;
              if strType<>'' then begin
                dmBase.TypePunkt.Locate('ID',strType,[]);
                strType:=dmBase.TypePunkt.FieldByName('NAME').AsString;
              end;
              if strType=''
                then strRN:=strRN+' район, '
                else strRN:=strType+' '+strRN;
            end;
          end;
        end;
        if dmBase.SprSoato.Locate('KOD',Copy(strSOATO,1,1)+'000000000',[]) then begin
          strOBL := Trim(dmBase.SprSoato.FieldByName('NAME').AsString);
        end;
      end;
      Text := strSS;
      if strRN<>''
        then Text:=Text + ', ' + strRN;
      if strObl<>''
        then Text:=Text + ', ' + strObl;
    end else begin
      Text := 'Некоррекное значение'
    end;
    }
  end;
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

//--- справочник улиц ---------------------------------------
procedure TfmMain.acSprULExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  Param := TParamsEditSpr.Create;
  Param.OnBeforeDelete := BeforeDeleteSprUL;
  Globaltask.EditSpr('EDIT_SPRUL', Param);
end;
procedure TfmMain.BeforeDeleteSprUL( Grid : TSasaDbGrid; var lDel : Boolean);
var
  nID : Integer;
begin
  nID := Grid.DataSource.DataSet.FieldByName('ID').AsInteger;
  if dmBase.tbAdres.Locate('UL', nID, []) then begin
    ShowMessageCont('  Удаление текущей записи запрещено ! ', grid.Parent);
    lDel := false;
  end;
end;

//------------ справочник населенных пунктов ----------------
procedure TfmMain.acSprPunktExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
  Param := nil;
 // Param := TParamsEditSpr.Create;
//  Param.OnBeforeDelete := BeforeDeleteSprPunkt;
  Globaltask.EditSpr('EDIT_PUNKT', Param);
  {$IFDEF OBR_GRAG}
    DocRecord.UpdateSpr('SP_PLACE');
  {$ENDIF}

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
{
procedure TfmMain.BeforeDeleteSprPunkt( Grid : TSasaDbGrid; var lDel : Boolean);
var
  nID : Integer;
begin
  lDel:=false;
  if dmBase.IsMainComputer then begin
    nID:=Grid.DataSource.DataSet.FieldByName('ID').AsInteger;
    lDel:=true;
    if dmBase.tbAdres.Locate('PUNKT', nID, []) then begin
      if dmBase.DeletePunkt(nID) then begin
        lDel := true;
      end else begin
        lDel := false;
        PutError('  Удаление текущей записи запрещено ! ');
      end;
    end;
  end;
end;
}

procedure TfmMain.acSprFamilyExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRFAMILY', nil); end;

procedure TfmMain.acSprIstExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRIST', nil); end;

procedure TfmMain.acSprPredstExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRPREDST', nil); end;

//---------------------------------------------------------
procedure TfmMain.acSprPerevodExecute(Sender: TObject);
begin
  EditPerevod;
end;
//---------------------------------------------------------
procedure TfmMain.acCheckUpdateExecute(Sender: TObject);
var
  strMessages:String;
  lPath:Boolean;
begin
  {$IFDEF UPDATE_SYNA}
    RunUpdateSyna(pn);
    {
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
      }
  {$ELSE}
    strMessages:='';
    CheckUpdate(IdFTP1, true, true, 0, true, strMessages, lPath);
  {$ENDIF}
end;
//---------------------------------------------------------
procedure TfmMain.acLoadSprSMDOExecute(Sender: TObject);
begin
  RunLoadSprSMDO(pn);
end;
//---------------------------------------------------------
procedure TfmMain.TimerPKNCITimer(Sender: TObject);
begin
  RunWebSprSMDO(false);
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
      if GetFileFTP(true, '','') then begin
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
end;
}
procedure TfmMain.Event_OnStatus(Sender: TObject; Response: Boolean;  const Value: string);
var
  s:String;
begin
  if Response then s:='О> ' else s:='З>';
//  FProtokol.Add(s+Value);
end;

procedure TfmMain.TestFTP;
var
  s:String;
  slPar:TstringList;
  nTask,i,n:Integer;
  rFTP:TPropFTP;
  FTPClient:TFTPSend;
begin
  rFTP:=GetPropertyFTP(SERVER_NCES_UPD, 'update');
  FTPClient:=TFTPSend.Create;
  FTPClient.TargetHost:=rFTP.Host;
  FTPClient.TargetPort:=IntToStr(rFTP.Port);
  FTPClient.UserName:=rFTP.UserName;
  FTPClient.Password:=rFTP.Password;
  FTPClient.PassiveMode:=rFTP.Passive;
  FTPClient.OnStatus:=Event_OnStatus;

  nTask:=EnterWorkerThread;
  n:=gettickcount();
  try
    if FTPClient.Login and FTPClient.ChangeWorkingDir(rFTP.Dir) then begin
      s:='Ok';
    end else begin
      s:='Error';
    end;
  finally
    memowrite('sss', s+' '+inttostr(gettickcount()-n));
    LeaveWorkerThread;
  end;
  Showmessage(s);
end;

procedure TfmMain.acTestExecute(Sender: TObject);
begin
//  if not Role.SystemAdmin then exit;

  CheckUpdateSyna(pn);

//  TestFTP;
//    MD5(const Value: AnsiString): AnsiString;
//    MemoWrite('E:\md5_2',MD5Print(MD5String(ANSIUppercase('Org8949'+'myfirstlove'+'Org8949'))));
//    Showmessage(MD5Print(MD5String(ANSIUppercase('Org8949'+'myfirstlove'+'Org8949'))));

    {
    oUpdate:=TSynapseObj.Create(pn);
    oUpdate.FTypeServer:=SERVER_BREST;
//    oUpdate.FThread:=false;
//    oUpdate.FWinOwner:=pn;
    if oUpdate.CheckUpdate then begin
      ShowMessage(oUpdate.FFileName+'  '+inttostr(oUpdate.FUpdate));
//      oUpdate.FOutputDir:=CheckSleshN(ExtractFilePath(Application.ExeName))+'Обновление\';    // CreateTmpPath(0);
      oUpdate.GetFileFTP(true);
    end;
    }



//    ShowNotifyProg;
//   Gisun.GetChangeClassif(0, STOD('1899-12-30',tdAds), false, true);

{  ShowMessage(
    FormatdateTime('yyyy-mm-dd hh:nn:ss',  sdDateTimeFromString('2016-01-01T06:48:16+05:00', true))+chr(13)+chr(10)+
    FormatdateTime('yyyy-mm-dd hh:nn:ss',  sdDateTimeFromString('2016-01-01T06:48:16Z', false))+chr(13)+chr(10)+
    FormatdateTime('yyyy-mm-dd hh:nn:ss',  sdDateTimeFromString('2016-01-01T06:48:16Z', true)));
}
{    slPar:=TstringList.Create;
    slPar.Add('FILE=!!!.000');
    slPar.Add('KEEP=1');
    slPar.Add('FREE=0');}
//    slPar.Free;

{    d:=Now;
    ShowMessage( string(SMDO.DateTimeToStringXML(d, false))+chr(13)+chr(10)+
                 string(SMDO.DateTimeToStringXML(d, true))+chr(13)+chr(10)+
                 string(SMDO.DateTimeToStringXML(d, not SMDO.FTimeAsGMT))+chr(13)+chr(10) ) ; }



//    LoadPinsk;
   {  LoadKam;  }

     //  frxReport.DesignReport(true);


  {
  if Problem(' Удалить секции в именем "РОКАZ_" ?') then begin
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
end;

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
// справочник организаций SprNames
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
//  Param.OnEditRecord := EditRecordSprNames;
  Param.OnBeforeDelete := BeforeDeleteSprNames;
  Param.OnGetCellParams := GridGetCellParams;
  Param.Quest_Delete:='Удалить организацию ?';
  Globaltask.EditSpr('EDIT_SPRNAMES_OCH', Param);
//    Param.Free;  удаляется после уничтожения формы
end;

//  TEditRecordGridEvent = procedure( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon) of object;
//  TEditRecordGridEvent2 = procedure( Field : TField; Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon) of object;

procedure TfmMain.EditRecordSprNames( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
begin
end;
//-------------------------------------------------------
procedure TfmMain.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if Column.Field.DataSet.FieldByName('HANDLED').AsBoolean then begin
    AFont.Color := clRed;
  end;
end;
//-------------------------------------------------------
procedure TfmMain.BeforeDeleteSprNames( Grid : TSasaDbGrid; var lDel : Boolean);
begin
end;

procedure TfmMain.acSprNamesGExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRNAMESG', nil); end;

procedure TfmMain.acSprNamesMExecute(Sender: TObject);
begin Globaltask.EditSpr('EDIT_SPRNAMESM', nil); end;

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
  EditSprWork;
  LoadOpisControlHouse;
  {$IFDEF OBR_GRAG}
    DocRecord.UpdateSpr('SP_CORR');
  {$ENDIF}
end;

procedure TfmMain.acSprMestWorkExecute(Sender: TObject);
begin
  Globaltask.EditSpr('EDIT_WORK_ZAGS', nil);
end;

procedure TfmMain.acSprDolgExecute(Sender: TObject);
begin
Globaltask.EditSpr('EDIT_SPRDOLG', nil);
end;

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
//---------------------------------------------------------------
procedure TfmMain.BeforeDeleteSprWork(Grid: TSasaDbGrid;  var lDel: Boolean);
//{$IFNDEF ZAGS}
//var
//  sId,sErr,oldInd:String;
//{$ENDIF}
begin
  dmBase.DeleteRecordSprWork(Grid,lDel);
//  {$IFDEF ZAGS}
//    lDel:=true;
//  {$ELSE}
//    lDel:=true;
//    sId:=Grid.DataSource.DataSet.FieldByName('ID').AsString;
//    if dmBase.tbMens.Locate('WORK_SPR',StrToInt(sId),[]) then begin
//      PutError('Текущее значение присутствует в таблице населения.');
//      lDel:=false;
//    end;
//    if lDel then begin
//      oldInd:=dmBase.tbHouseOwners.IndexFieldNames;
//      dmBase.tbHouseOwners.IndexFieldNames:='TYPEKOD;KOD';
//      if dmBase.tbHouseOwners.FindKey([OWNER_ORG,StrToInt(sId)]) then begin
//        PutError('Текущее значение присутствует в таблице собственников.');
//        lDel:=false;
//      end;
//      dmBase.tbHouseOwners.IndexFieldNames:=oldInd;
//    end;
//    if lDel then begin
//      {$IFDEF OBR_GRAG}
//         if DocRecord.CanDeleteOrg(StrToInt(sId),sErr) then begin
//           PutError(sErr);
//           lDel:=false;
//         end;
//      {$ENDIF}
//    end;
//  {$ENDIF}
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
  {$IFDEF ADD_MENS_PU}
    SelLibFR.SetCurFormMen( fmMen );
  {$ENDIF}

  end;
end;

//-------------------------------------------------------
procedure TfmMain.CheckFormLichSchet;
begin
  CheckFormMen;
end;

//-------------------------------------------------------
procedure TfmMain.acLichNewSchetExecute(Sender: TObject);
begin
  CheckFormLichSchet;
  fmMen.Dokument.DateFiks := dmBase.GetDateCurrentSost;
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
end;
//----------------------------------------------------------------
function TfmMain.EditDokument(ds: TDataSet; TypeObj: Integer; strFieldID : String; slPar : TStringList; lEnableSkip : Boolean; strKodGurnal : String) : Boolean;
var
  nID,nTypeObj,i : Integer;
  strID : String;
  Date_Fiks : TDateTime;
  fAdr : TfmAdres;
  dAdr : TdmAdres;
  l,lNew,lVosstan,lOch : Boolean;
begin
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
    Date_Fiks:=dmBase.GetDateCurrentSost;
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
  //------------------ SMDO СМДО -----------------------------------------------------
  if TypeObj = _TypeObj_SMDOPost then begin
    if not (strID='') then begin
      {$IFDEF SMDO}
         if StrToInt(ValueFromParams(slPar,'MSG_TYPE','1'))=MSG_TYPE_A then begin  // уведомление

         end else begin
           Result:=EditSMDODoc(nID, slPar);
         end;
      {$ENDIF}
    end;
  //------------------ человек -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_Nasel then begin
    CheckFormMen;
    fmMen.Dokument.DateFiks := Date_Fiks;
    TdmMen(fmMen.Dokument).EditFromLichSchet  := false;
    TdmMen(fmMen.Dokument).EditFromAdres  := false;
    l:=false;
    lOch:=false;
    if nID=-1 then lNew:=true;
    if (slPar<>nil) and (slPar.Count>0) then begin
      if slPar.Values['MEN_ADD']='1' then begin
        lNew := true;
      end;
      if slPar.Values['MEN_NOTPROPIS']='1' then begin
        l:=true;
      end;
      if slPar.Values['ENABLEOCHERED']='1' then begin
        lOch:=true;
      end;
    end;
    fmMen.TBItemReLoad.Visible:=false;
    if lNew then begin
      nID:=-1;
      fmMen.Dokument.ReadDokument( -1, slPar);
      fmMen.TBItemReLoad.Visible:=false;
      if l then begin
        fmMen.Dokument.mtDokument.Edit;
        TdmMen(fmMen.Dokument).mtDokumentPROPIS.AsBoolean:=false;
        TdmMen(fmMen.Dokument).mtDokumentNOTSELECT.AsBoolean:=true;
//        fmMen.edCanSelect.Enabled:=false;
        fmMen.Dokument.mtDokument.Post;
      end;
      if lOch then begin
        fmMen.Dokument.mtDokument.Edit;
        TdmMen(fmMen.Dokument).mtDokumentPROPIS.AsBoolean:=false;
        fmMen.Dokument.mtDokument.Post;
      end;
    end else begin
//      nID := ds.FieldByName(strFieldID).AsInteger;
      if nID>0 then begin
        fmMen.Dokument.ReadDokument( nID, slPar );
        if TdmMen(fmMen.Dokument).LicID=0 then begin
          fmMen.Dokument.mtDokument.Edit;
          TdmMen(fmMen.Dokument).mtDokumentPROPIS.AsBoolean:=false;
          TdmMen(fmMen.Dokument).mtDokumentNOTSELECT.AsBoolean:=true;
//          fmMen.edCanSelect.Enabled:=false;
          fmMen.Dokument.mtDokument.Post;
        end;
      end;
    end;
    if lNew or (nID>0) then begin
      SetDataSets_fmMen(TdmMen(fmMen.Dokument));
      {$IFNDEF OCHERED}
        fmMen.edOTNOSH.Enabled := false;
      {$ENDIF}
      fmMen.TBItemWrite.Caption:='Записать';
      fmMen.TBItemWrite.Visible:=true;
      fmMen.TBItemCancel.Visible:=true;

  //    fmMen.TBItemPreView.Visible:=false;
  //    fmMen.TBItemPrint.Visible:=false;
      fmMen.CheckExit:=true;
      fmMen.QueryExit:=false;
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
//    fAdr.lbSost.Caption := dmBase.NameSostFromDate(fAdr.Dokument.DateFiks);
    try
      fAdr.Dokument.ReadDokument(nID, slPar);
//      fAdr.Dokument.ReadDokument( ds.FieldByName(strFieldID).AsInteger, slPar );
      fAdr.CheckExit:=true;
      fAdr.QueryExit:=false;
      fAdr.SetSubSystem(SS_HOZ_UCHET);
      Result := fAdr.EditForm(nil,strKodGurnal);
    finally
      fAdr.Free;
      dAdr.Free;
    end;

  end else begin
    PutError(' Неизвестный тип документа:'+IntToStr(TypeObj));
  end;

  // открыть другой документ
  if (slPar<>nil) and (slPar.IndexOfName('OPEN_DOK')>-1) then begin
    i:=slPar.IndexOfName('OPEN_DOK');
    nTypeObj:=StrToInt(slPar.ValueFromIndex[i]);
    slPar.Delete(i);
    i:=slPar.IndexOfName('OPEN_ID');
    strID:=slPar.ValueFromIndex[i];
    slPar.Delete(i);
    fmMain.EditDokument(nil, nTypeObj, strID, slPar,false, '');
//    if Gurnal<>nil
//      then Gurnal.Refresh(false);
  end;

end;

//----------------------------------------------------------------
procedure TfmMain.TBItemAboutClick(Sender: TObject);
var
  s, ss : String;
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
    ss := 'ЛАИС.СМДО (демо-версия)';
  end else begin
    ss:='ЛАИС.СМДО';
  end;
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
  FFltOpList.Free;
  FFltSprList.Free;
  {$IFDEF OBR_GRAG}
    DocRecord.Free;
  {$ENDIF}
  GlobalTask.UpdateIni;
  inherited;
end;

function TfmMain.SeekGurnal(strName : String) : TfmGurnal;
var
  i : Integer;
begin
  Result := nil;
  strName := ANSIUpperCase(Trim(strName));
  for i:=0 to ListGurnal.Count-1 do begin
    if ListGurnal.Objects[i] is TfmGurnal and
       (ListGurnal.Strings[i] = strName) then begin
      Result := TfmGurnal(ListGurnal.Objects[i]);
      break;
    end;
  end;
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
end;

procedure TfmMain.TBItemExitClick(Sender: TObject);
begin
  Close;
end;
//----------------------------------------------------------------------------
procedure TfmMain.SetRole;
var
  lEnabled : Boolean;
  s:String;
begin
  SetFontParamQuest(10, false);         // размер шрифта для TfmParamQuest
  if not Role.SystemAdmin then begin
    acDesignReport.Visible  := false;
    acDesignReport3.Visible := false;
    TBSubmenuAdmin.Visible  := false;
  end;
  if EnableReport then begin
    acDesignReport.Visible := true;
    acDesignReport3.Visible := true;
  end;

  lEnabled := (ListGurnal.Count=0);

//  TBItemDateFiks.Enabled := lEnabled; // выбор состояния только при закрытых реестрах

//  TBItemClearBase.Visible:=false;
  if (Role.Status <> rsAdmin) then begin
    lEnabled := false;
  end;
  if EnableLoadOch and dmBase.OblBase then begin
//    TBItemClearBase.Visible:=true;
    acAdres.Visible:=false;
  end else begin
    acAdres.Visible:=true;
  end;

  TBItemBackup.Enabled      := lEnabled;
  TBItemRestore.Enabled     := lEnabled;
  TBItemReindexBase.Enabled := lEnabled;
  TBItemRunObrab.Enabled    := lEnabled;
  TBSubmenuAdd.Enabled      := lEnabled;

  acSQL.Visible:=false;
  if dmBase.IsMainComputer and (Role.Status=rsAdmin) then begin
//    TBSeparatorItem7.Visible:=true;
//    acSetShare.Visible:=true;
//    acDelShare.Visible:=true;
//    sName:=GetNameSharedFolder(s);
//    acSetShare.Caption:='Открыть общий доступ под именем: "'+sName+'"';
    if GlobalTask.ParamAsBoolean('ENABLE_SQL')
     then acSQL.Visible:=true
     else acSQL.Visible:=false;
  end else begin
//    TBSeparatorItem7.Visible:=false;
//    acSetShare.Visible:=false;
//    acDelShare.Visible:=false;
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
  end;

  if SMDO<>nil
    then SMDO.CheckEnabledPost;

  //------ ведомственный архив --
  l:=( (Role.Status=rsAdmin) or (Role.CheckSubSystem(SS_OBRACH)=ptFull) ) and GlobalTask.ParamAsBoolean('VEDOM_ARX');
  acDeloToVedomArx.Visible:=l;
  acNomenToVedomArx.Visible:=l;
  TBSeparatorVedArx.Visible:=l;
  //-----------------------------

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

  ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\РЕГУЛИРОВАНИЕ ЖИЛИЩНЫХ ОТНОШЕНИЙ.doc')), nil, nil, SW_SHOWNORMAL);

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
procedure TfmMain.acSetDateFiksExecute(Sender: TObject);
var
  f : TfmDeleteFiks;
  lOk : Boolean;
  strDate : String;
  d : TDateTime;
begin
  f := TfmDeleteFiks.Create(nil);
  f.Caption := 'Выберите состояние';
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
    PutError(' Создание состояний доступно только в январе !');
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
      strCaption := ' Вы хотите создать состояние базы на: '+'1 января '+IntToStr(nYear)+' года ? '
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
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  TBToolWindowS.DockPos:=1000;
end;

procedure TfmMain.edSostClick(Sender: TObject);
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
  sl.AddObject('TBSubMenuItemDok',TBSubMenuItemDok);
  sl.AddObject('TBSubmenuWord',TBSubmenuWord);
  sl.AddObject('TBSubMenuBlank',TBSubMenuBlank);
  sl.AddObject('TBSubMenuReports',TBSubMenuReports);
//  sl.AddObject('TBSubMenuSprObr',TBSubMenuSprObr);
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

procedure TfmMain.SetUpActionsZAGS;
begin
  TBToolWindowS.Visible := false;
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

procedure TfmMain.TBItemRegisterProgClick(Sender: TObject);
var
  CurKey : String;
begin
  if GlobalTask.DemoVersion then begin
    if Copy(ReadKeyProg(CurKey,false),1,5)<>'ZGS10' then begin
//    GlobalTask.DemoVersion := true;
    end else begin
      GlobalTask.SetEnablePrintReport(true);
      GlobalTask.DemoVersion:=false;
      if SMDO<>nil then
        SMDO.Demo:=GlobalTask.DemoVersion;
      WriteKeyProg(CurKey);
      TBItemRegisterProg.Visible := false;
    end;
  end;
end;

{$IFDEF USE_TEMPLATE}
procedure TfmMain.SetTemplateInterface(const Value: TTemplateInterface);
begin
  FTemplateInterface := Value;
end;
{$ENDIF}

procedure TfmMain.acAddReportOchExecute(Sender: TObject);
begin
//  ShowMessage( IntToStr(GlobalTask.CountReport('AddReportsZAGS')) );
  GlobalTask.PreViewReport('AddReportsOch');
end;

procedure TfmMain.acReindexBaseExecute(Sender: TObject);
var
  lErr : Boolean;
begin
  dmBase.CloseBase;
  lErr := false;
  {$IFDEF POST}
    try
      dmBase.SMDOPost.Exclusive:=true;
      dmBase.SMDOPost.Open;
    except
      lErr := true;
      PutError(' Невозможно заблокировать базу для операции индексации ! ');
    end;
    dmBase.SMDOPost.Active:=false;
    dmBase.SMDOPost.Exclusive:=false;
  {$ELSE}
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
  {$ENDIF}

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
  RunObrab;
end;

procedure TfmMain.acRunAutoRestoreExecute(Sender: TObject);
begin
  RunAutoRestore;
end;

procedure TfmMain.FormActivate(Sender: TObject);
var
//  lShow : Boolean;
  s,sUpd:String;
  lPath:Boolean;
  i:Integer;
begin
  Application.ProcessMessages;
  for i:=0 to Screen.FormCount-1 do begin
    if ANSIUpperCase(Screen.Forms[i].Name)='MESSAGE' then begin
      Screen.Forms[i].BringToFront;
    end;
  end;
  if not FRunActivate then begin
    if dmBase.LastDatabaseError=0 then begin
      fmMain.RunAutoBackup;
    end;
    Application.ProcessMessages;

    if dmBase.LastDatabaseError=0 then begin
      // показать окно с невыполнеными обращениями граждан
      {$IFDEF OBR_GRAG}
      DocRecord.ShowInfoWin;
      {$ENDIF}
      if SMDOEnabled and acSMDOPost.Visible and  acSMDOPost.Enabled then begin
        SMDOReceive(true,true,true,0);
      end;
    end;

    FRunActivate := true;

    if GlobalTask.ParamAsBoolean('OPEN_SMDO') and SMDOEnabled then begin
      ShowGurnal(TfmGurnSMDO, 'fmGurnSMDO');
    end;

    {$IFDEF UPDATE_SYNA}
      if Globaltask.ParamAsBoolean('CHECK_UPDATE') then begin
        PostMessage(Handle,WM_CHECKUPDATE,0,0);
      end;
    {$ELSE}
      s:='?';
      sUpd:=CheckUpdate(IdFTP1, false, false, 0, false, s, lPath);
      if sUpd<>'' then begin
        AddNotifyProg(fmMain, 'Доступно обновление программы № '+sUpd, false, true,0,0);
//        ShowMessage('Доступно обновление программы № '+sUpd)
      end;
      if s<>'' then begin
        MessagesProg:=s;  // !!!
        CheckMessagesProg(s);  // !!!   обрабо
      end;
    {$ENDIF}

  end;


end;

procedure TfmMain.acShablonExecute(Sender: TObject);
begin
  EditShablon;
end;

procedure TfmMain.acWordShtampExecute(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('shtamp.doc')), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmMain.TBItemNewClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Доработки ЛАИС.СМДО.doc')), nil, nil, SW_SHOWNORMAL);
end;
procedure TfmMain.TBItemNew2Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Письмо в ответ на.doc')), nil, nil, SW_SHOWNORMAL);
end;
procedure TfmMain.acGerbShampExecute(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('shtamp_gerb.doc')), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmMain.acViewLogFileExecute(Sender: TObject);
begin
  ViewDOSFileEx( NameFromExe('smdo.log'), false, 'Просмотр Log-файла' );
end;

procedure TfmMain.TBItemVigr_LaisClick(Sender: TObject);
begin
//  dmBase.AnyExport('Выгрузка для портала РИАП     ...','&Vigr_Lais',true,true);
//  dmBase.AnyExport('Выгрузка для выборочного обследования','Vib_Obsl',true,true);
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
procedure TfmMain.acSprDocAdmProcUExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_ADMPROC_U');
  {$ENDIF}
end;

procedure TfmMain.acSprDocOfficialExecute(Sender: TObject);
begin
  EditSprDocOfficial;
  {$IFDEF OBR_GRAG}
    DocRecord.UpdateSpr('SP_OFFICIAL');
  {$ENDIF}

  {$IFDEF OBR_GRAG}
//    DocRecord.EditSpr('SP_OFFICIAL');
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
//  RunProcScript('Death2BelGosStrah',v);
end;

procedure TfmMain.acVigrStatExecute(Sender: TObject);
var
  fmParam:TfmParamQuest;
  n:Integer;
  sFileName:String;
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
    sFileName:='ST'+Copy(GlobalTask.ParamAsString('KOD'),1,4)+'_'+
               IntToStr(par.Year)+'_'+PadLstr(IntTostr(par.Month),2,'0')+'.xml';
    par.PathXml:=GetFolderMyDocument+'\'+sFileName;
  end;
  fmParam.Free;
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

function TfmMain.RunReport(TypeObj: Integer; slPar:TStringList; strIDMen : String):Boolean;
var
  ds:TDataSet;
  strID:String;   
begin
  Result:=false;
  if slPar.IndexOf('RUN_REPORT')=-1
    then slPar.Add('RUN_REPORT=1');
  ds:=dmBase.GetMen(fmMain.DateFiks,strIDMen);
  if ds<>nil then begin
    strID:=ds.FieldByName('ID').AsString;
    slPar.Add('ID_MEN='+strID);
    if TypeObj=dmBase.TypeObj_Lich then begin
      strID:=ds.FieldByName('LIC_ID').AsString;
    end else if TypeObj=dmBase.TypeObj_Adres then begin
      strID:=ds.FieldByName('ADRES_ID').AsString;
    end;
    if (strID<>'') and (strID<>'0') then begin
      Result:=EditDokument(nil,TypeObj,strID,slPar,false,'');
    end else begin
      PutError('Требуемый объект не найден.')
    end;
  end;
end;

procedure TfmMain.WMDEVICECHANGE(var Msg: TMessage);
begin
  if Msg.Msg = WM_DEVICECHANGE then begin
    {
    if ((TWMDeviceChange(Msg).Event = DBT_DEVICEARRIVAL) or
      (TWMDeviceChange(Msg).Event = DBT_DEVICEREMOVECOMPLETE)) and
      (PDevBroadcastVolume(TWMDeviceChange(Msg).dwData)^.dbcv_devicetype = DBT_DEVTYP_VOLUME) then begin
      ShowMessage('Change USB Volume');
    end else begin
      ShowMessage('Change USB Device');
    end;
    }
  end;
end;

procedure TfmMain.WMCheckUpdate(var Msg: TMessage);
begin
  if Msg.Msg = WM_CHECKUPDATE then begin
    CheckUpdateSyna(pn);
  end;
end;

procedure TfmMain.TBItemClearBaseClick(Sender: TObject);
begin
  dmBase.ClearBase;
end;

//----------------------------------------------------------------------------------
//         FTP
//----------------------------------------------------------------------------------
procedure TfmMain.SetCaptionPanel0(strCaption:String);
begin
  sb.Panels[0].Text:=strCaption;
  Application.ProcessMessages;
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
{
function TfmMain.GetFileFTP(lShow:Boolean; strFileName:String; strOutputDir:String; lDeleteFile:Boolean):Boolean;
var
  nTask:Cardinal;
  cur:TCursor;
  LS:TStringList;
  s:String;
begin
  Result:=false;
  s:=GetNameServerFTP(TypeServerFTP);
  if s='' then s:=IdFTP1.Host;

  //IdAntiFreeze1.Active:=false;
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
        PutError(E.Message);
        Screen.Cursor:=cur;
      end;
    end;
  end;
  //IdAntiFreeze1.Active:=true;

  if not IdFTP1.Connected then exit;

  try
    if DirFTP<>'' then begin
      try
        IdFTP1.ChangeDir(DirFTP);
      except
        on E: Exception do begin
          cur:=Screen.Cursor;
          Screen.Cursor:=crDefault;
          PutError(E.Message);
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

        nTask:=EnterWorkerThread;
        try
          IdFTP1.Get(strFileName, strOutPutDir+strFileName, false);
          EnterMainThread;
          try
//            fmMain.CheckVisibleGIF(false,'');
          finally
            LeaveMainThread;
          end;
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
  pb.Position := pb.max;  //0
  AverageSpeed := 0;
end;

//-----------------------------------------------
procedure TfmMain.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;  const AWorkCount: Integer);
Var
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
  AbortTransfer := false;
end;
{
//--------------------------------------------------------------------------------------
function TfmMain.SetPropertyFPT(nTypeServerFTP:Integer; strTypeFile:String):Boolean;
var
  rFTP:TPropFTP;
  s:String;
  strUser, strPassword, strCaption:String;
begin
 Result:=true;
 IdFTP1.Disconnect;
 IdFTP1.Port:=21;
 TypeServerFTP:=nTypeServerFTP;
// if (TypeServerFTP<>SERVER_BREST) and (TypeServerFTP<>SERVER_RIAP)
//   then TypeServerFTP:=SERVER_BREST;
 rFTP.Ok:=false;
 //------ ВЦ БОУС ------------------------------
 if nTypeServerFTP=SERVER_BREST then begin             // uProjects.pas
   rFTP:=GetPropertyVCBrest('UPDATE');
 end else if nTypeServerFTP=SERVER_FTP then begin
   rFTP:=GetPropertyFTP('UPDATE');
   if not rFTP.Ok then begin
     rFTP:=GetPropertyVCBrest('UPDATE');
     TypeServerFTP:=SERVER_BREST;
   end;
 //------  портал АИС Месные Советы -----------
 end else if nTypeServerFTP=SERVER_RIAP then begin
   DirFTP:='';                           // uProjects.pas
   IdFTP1.Host:='10.101.1.108';   // msd.by
   if LowerCase(Copy(strTypeFile,1,3))='upd' then begin
     s:='UPDATE';
     IdFTP1.Username:='update';
     IdFTP1.Password:='zs34@M5';
   end else begin
     s:='RIAP_DATA';
     IdFTP1.Username:='data';
     IdFTP1.Password:='up98!zte';
     if LowerCase(Copy(strTypeFile,1,4))='data'
       then DirFTP:='/bases';
   end;
   rFTP:=GetPropertyFTP(s);
 end else if nTypeServerFTP=SERVER_OCHERED then begin
   rFTP:=GetPropertyFTP('OCHERED');
   Result:=rFTP.Ok;
 end else if nTypeServerFTP=SERVER_ZAGS then begin
   rFTP:=GetPropertyFTP('ZAGS');
   Result:=rFTP.Ok;
 end;
 if rFTP.Ok then begin
   IdFTP1.Port:=rFTP.Port;
   IdFTP1.Host:=rFTP.Host;
   IdFTP1.Username:=rFTP.Username;
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
    pb.Position:=0;
    pb.Visible:=true;
    if lCancel then begin
      btCancel.Parent:=sb;
      btCancel.Left:=pb.Left+pb.Width+10;
      btCancel.Top:=2;
      btCancel.Visible:=true;
    end;
    sb.Panels[0].Text:=strCaption;
    sb.Visible:=true;
    Application.ProcessMessages;
  end else begin
    btCancel.Visible:=false;
    sb.Visible:=false;
    pb.Visible:=false;
    pb.Position:=0;
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

//----------------------------------------------------------------------------------
//         FTP  (END)
//----------------------------------------------------------------------------------

procedure TfmMain.acParamsFTPExecute(Sender: TObject);
begin
  EditParamsFTP;
end;

procedure TfmMain.btCancelClick(Sender: TObject);
begin
  AbortTransfer:=true;
end;

procedure TfmMain.acUpdateAdmProcExecute(Sender: TObject);
begin
  if Problem(' Обновить справочники административных процедур и тематик обращений ? ') then begin
    dmBase.CheckSprAdmProc('');
    dmBase.CheckSprAdmProc('U');
    dmBase.CheckSprTematic('');
  end;
end;

procedure TfmMain.CreateSubMenu;
var
  tb:TTbItem;
  i:Integer;
begin
  Globaltask.ListReport('AddReportsPost', slReports);
//  ShowStrings(sl,'');
  if slReports.Count>0 then begin
    for i:=0 to slReports.Count-1 do begin
      Tb:=TTbItem.Create(TBSubmenuReports);
      Tb.Caption:=slReports.Names[i];
      tb.Tag:=i;
      Tb.OnClick:=Event_SubMenuReports;
      TBSubmenuReports.Add(Tb);
    end;
    TBSubmenuReports.Visible:=true;
  end;
end;

procedure TfmMain.Event_SubMenuReports(Sender: TObject);
begin
//  ShowMessage(Sender.ClassName);
  if role.SystemAdmin
    then GlobalTask.DesignTailReport(slReports.ValueFromIndex[TComponent(Sender).Tag])
    else GlobalTask.PreViewReport(slReports.ValueFromIndex[TComponent(Sender).Tag]);
end;

//-----------------------------------------------------------------------------------------------
function TfmMain.SMDOCheckNSI(nTypeSpr:Integer; lRun:Boolean; lShow:Boolean; lCheck:Boolean):String;
//var
{
  n,m,nn,nCurUpdate,FileAttrs,nUpdate,nCur:Integer;
  sKodSpr,strFile,s,ss,strDir,strDirUpdate:String;
  VerInfo:TVerInfo;
  sr:TSearchRec;
  lFtp,lOk:Boolean;
}
begin
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
end;
//--------------------------------------------------------------------
procedure TfmMain.acSMDORunWebLoadSprExecute(Sender: TObject);
begin
  if SMDOEnabled then
    RunWebSprSMDO(true);
end;
//--------------------------------------------------------------------
procedure TfmMain.SMDOCheckVisible;
begin
end;
//-------------------------------------------------------------
procedure TfmMain.SMDOCheckEnabled(lSet:Boolean);
var
  i:Integer;
  lEnabled:Boolean;
begin
  for i:=0 to ActionList.ActionCount-1 do begin
    if Pos('SMDO', ActionList.Actions[i].Name)>0 then begin
      if TAction(ActionList.Actions[i]).Enabled<>lSet
        then TAction(ActionList.Actions[i]).Enabled:=lSet;
    end;
  end;
  lEnabled:=( (Role.Status=rsAdmin) or Role.SystemAdmin );
  acSMDOEditParams.Enabled:=lEnabled;
  if acSMDORunWebLoadSpr.Enabled then begin
    acSMDORunWebLoadSpr.Enabled:=lEnabled;
    acSMDORunLoadSpr.Enabled:=lEnabled;
  end;
//    acSMDOEditParams.Enabled:=true; //((Role.Status=rsAdmin) or Role.SystemAdmin);
end;
//-------------------------------------------------------
procedure TfmMain.acSMDORunLoadSprExecute(Sender: TObject);
begin  if SMDOEnabled then SMDO.RunLoadSysSpr; end;
//-------------------------------------------------------
procedure TfmMain.acSMDOEditParamsExecute(Sender: TObject);
begin  SMDO.EditParams; end;
//---------------------------------------------------------------
procedure TfmMain.acSMDOPostExecute(Sender: TObject);
begin
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
end;

procedure TfmMain.acSMDOSprOrgExecute(Sender: TObject);
begin
//
end;

procedure TfmMain.acSMDOSprKindExecute(Sender: TObject);
begin
//
end;
//------------------------------------------------------------------------
procedure TfmMain.WM_CheckSendMail(var rec:TMsg);
var
  lOk:Boolean;
  slPar:TStringList;
begin
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
function TfmMain.SMDOReceive(lStart:Boolean; lVisible:Boolean; lCheck:Boolean; nPost:Integer):Integer;
var
  n:DWORD;
  d:TDateTime;
  m:Integer;
  lOk,lRefreshCOC:Boolean;
  slPar:TStringList;
  sSoob,sTypeRun,s,sErr:String;
  nCountUvd,nCountErr,nCount:Integer;
begin                          
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
end;
//----------------------------------------------------------
procedure TfmMain.acSMDORefreshCOCExecute(Sender: TObject);
var
  sErr:String;
begin
  if SMDOEnabled then begin
    SMDO.RefreshCOC(true,sErr, true);
    if sErr<>''
//      then PutError(sErr);
      then ShowMessageCont(sErr,nil);
  end;
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

{
procedure TfmMain.TBItemDefaultIniClick(Sender: TObject);
var
  s:String;
  ini:TSasaIniFile;
  slPar:TStringList;
begin
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'Сбросить настройти всех реестров.'#13;
  s := s + 'Будут сброшены в значения по умолчанию:'#13;
  s := s + 'порядок, ширина и высота граф.'#13;
  s := s + 'Если Вы уверены введите слово ДА в поле ввода'#13;
  slPar:=TStringList.Create;
  slPar.Add('WIDTH=350');
  slPar.Add('HEIGHT=220');
  if OkWarningPar(s,slPar) then begin
    DocRecord.ClearLayoutIni;
    GlobalTask.ClearIniFile('LOCAL');
  end;
end;
}

procedure TfmMain.acSprDocSubjGExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    if dmBase._LockTypeObj(_TypeObj_SprDocSubjG_,'') then begin
      try
        DocRecord.EditSpr('SP_SUBJG');
      finally
        dmBase._UnLockTypeObj(_TypeObj_SprDocSubjG_);
      end;
    end;
  {$ENDIF}
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

procedure TfmMain.SetYearFiks(const Value: Integer);
begin
  FYearFiks := Value;
  GlobalTask.SetWorkParam('YEARFIKS', FYearFiks);
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

//--- Ведомственный архив -------------------------------------------------------
procedure TfmMain.acDeloToVedomArxExecute(Sender: TObject);
begin
  DeloToVedomArx;
end;

procedure TfmMain.acNomenToVedomArxExecute(Sender: TObject);
begin
  NomekToVedomArx;
end;
//---------------------
{
procedure TfmMain.TBItemLoadSysSprClick(Sender: TObject);
begin
  RunLoadSysSpr(pn);
end;
}

initialization
  ListGurnal := TStringList.Create;
finalization
  ListGurnal.Free;
end.
