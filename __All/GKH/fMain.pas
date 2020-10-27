//ЖКХ
unit fMain;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MetaTask, mPermit, frRtfExp, frOLEExl, FR_Class, FR_E_HTML2, FR_DCtrl, FR_AdsDb,
  ActnList, ImgList, TB2MDI, TB2Dock, TB2Toolbar, TB2Item, StdCtrls, Mask, DateUtils,
  DBCtrlsEh, db, fChGes, dBase, fExportStru, fmQueryEx, MainLibFr, reportTask, uTypes,
  FR_VCCtrl, frCheckListBox, uPadegFIO, UserEvents,
  fLichSchet, dLichSchet, fMen,dMen, adsset, adsdata, AdsDictionary,
  fGurnal, fGurnAlfKn, fGurnNasel, FuncPr, FuncEh,OLEUtils, kbmMemTable,
  kbmMemCSVStreamFormat, mFindInt, FR_DSet, FR_DBSet, SasaIniFile, adsTable,
  dbFunc, Grids, DBGridEh, {$IFNDEF EHLIB3 } GridsEh, {$ENDIF}
  TB2ToolWindow,fmSetUpAction,uUtilFiles,FileCtrl,
  {$IFDEF OBR_GRAG} mDRecInt, {$ENDIF}
  fSimpleD, uCheckbase, fParamQuest,ShellAPI,
  {$IFDEF USE_TEMPLATE}
    mTempl, mTplInt,
  {$ENDIF}
  extctrls,buttons, act2rtf, sasadbgrid, RKP, fRunObrab, OpisEdit,
 {$IFDEF VER150} Variants, {$ENDIF}
 {$IFDEF USE_FR3} MainLibFR3, frxAdsComponents, modify_components, {frx2xto30, }
  frxClass, frxDCtrl, frxDesgn, frxExportRTF, frxExportHTML, frxDBSet,
  frxExportMail, frxExportImage, frxExportXML, frxExportPDF, frxRich, frxChart, {$ENDIF}
  adscnnct, uPSComponent;

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
    acZPasport: TAction;
    acZBrak: TAction;
    acZRogd: TAction;
    acZSmert: TAction;
    TBItem37: TTBItem;
    acUpdateBase: TAction;
    TBItemReindexBase: TTBItem;
    acNasel: TAction;
    TBItem41: TTBItem;
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
    acSetDateFiks: TAction;
    TBItemDateFiks: TTBItem;
    acCreateSost: TAction;
    TBItemCreateSost: TTBItem;
    acDeleteSost: TAction;
    TBItemDelSost: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
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
    acSetPassword: TAction;
    TBItem48: TTBItem;
    acFullUpdate: TAction;
    TBItem49: TTBItem;
    acFullClose: TAction;
    acFullOpen: TAction;
    TBItem50: TTBItem;
    acUstOtc: TAction;
    acReZUstOtc: TAction;
    acTalonPrib: TAction;
    acTalonUbit: TAction;
    TBItem54: TTBItem;
    TBItem55: TTBItem;
    TBSeparatorItem17: TTBSeparatorItem;
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
    acVostZRogd: TAction;
    acVostZSmert: TAction;
    acZRast: TAction;
    acReRast: TAction;
    acZAdopt: TAction;
    acReAdopt: TAction;
    acZChName: TAction;
    acReChName: TAction;
    acSprNamesM: TAction;
    TBItem75: TTBItem;
    acSprNamesG: TAction;
    TBItem76: TTBItem;
    acZPasportViza: TAction;
    TBItem77: TTBItem;
    TBItem78: TTBItem;
    acRePassportViza: TAction;
    TBItem79: TTBItem;
    acSprNames: TAction;
    TBItem80: TTBItem;
    acVigrZAGS: TAction;
    acLoadZAGS: TAction;
    TBSeparatorItem9: TTBSeparatorItem;
    mtTablesFieldsNotGroupBy: TBooleanField;
    TBItemRegisterProg: TTBItem;
    TBSeparatorItem14: TTBSeparatorItem;
    acAddReportZAGS: TAction;
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
    acSprFamily: TAction;
    TBSubmenuFIO: TTBSubmenuItem;
    TBItem92: TTBItem;
    TBSubmenuAdd: TTBSubmenuItem;
    acSprPerevod: TAction;
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
    acSeriaSvid: TAction;
    acReSvidZAGS: TAction;
    acSprTypePunkt: TAction;
    acProvSvidZAGS: TAction;
    acAlfavitZAGS: TAction;
    TBSeparatorItem22: TTBSeparatorItem;
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
    acDBrak: TAction;
    acReDeclBrak: TAction;
    ConnectExp: TAdsConnection;
    TBSubmenuVigr: TTBSubmenuItem;
    TBItem99: TTBItem;
    acUstMat: TAction;
    acReZUstMat: TAction;
    acSprRovd: TAction;
    acSprVoenkom: TAction;
    TBItem103: TTBItem;
    TBSeparatorItem26: TTBSeparatorItem;
    TBItem104: TTBItem;
    acSprMestRegistr: TAction;
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
    TBSeparatorItem28: TTBSeparatorItem;
    TBSeparatorItemObr1: TTBSeparatorItem;
    mtSprPropertyMINVALUE: TIntegerField;
    mtSprPropertyMAXVALUE: TIntegerField;
    mtSprPropertyDISPLAYFORMAT: TStringField;
    mtTablesFieldsCalc: TMemoField;
    acVigrBelGosStrax: TAction;
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
    TBSeparatorItem21: TTBSeparatorItem;
    TBItemVxodDokum: TTBItem;
    TBItemIsxodDokum: TTBItem;
    TBItemAdminProcedur: TTBItem;
    TBItemUchSprav: TTBItem;
    acLoadMRUListZAGS: TAction;
    acDesignReport3: TAction;
    TBItemReport3: TTBItem;
    acVigrStat: TAction;
    acSprDocAdmProc: TAction;
    TBItem14: TTBItem;
    acVigrRIAP: TAction;
    acViewVigrRIAP: TAction;
    acDeclareRegistr: TAction;
    TBItemDeclRegistr: TTBItem;
    TBItem5: TTBItem;
    acReDeclRegistr: TAction;
    TBItemReDeclRegistr: TTBItem;
    acSprRodsName: TAction;
    TBToolWindowSpec: TTBToolWindow;
    edSpec: TStaticText;
    TBItem15: TTBItem;
    acZVidGit: TAction;
    TBItemVidGit: TTBItem;
    TBItem36: TTBItem;
    TBItem38: TTBItem;
    acSprDocAdmProcU: TAction;
    TBItem33: TTBItem;
    TBItemDeleteFilter: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItemUpdateAdminProc: TTBItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBItemUpdateAdmProc: TTBItem;
    acSprDocSubjG: TAction;
    TBItem34: TTBItem;
    TBItemDefaultIni: TTBItem;
    procedure acSetParametersExecute(Sender: TObject);
    procedure acAdminParametersExecute(Sender: TObject);

    procedure OnTemplateMenuClick(Sender: TObject);
    function OnBeforeTemplateAdd(Template:TTemplate):Boolean;
    procedure BuildToolbarMenu;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditSOATO_GES(Sender: TObject; var Handled: Boolean);
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
    procedure acReRastExecute(Sender: TObject);
    procedure acZAdoptExecute(Sender: TObject);
    procedure acReAdoptExecute(Sender: TObject);
    procedure acZChNameExecute(Sender: TObject);
    procedure acReChNameExecute(Sender: TObject);
    procedure acSprNamesMExecute(Sender: TObject);
    procedure acSprNamesGExecute(Sender: TObject);
    procedure acZPasportVizaExecute(Sender: TObject);
    procedure acRePassportVizaExecute(Sender: TObject);
    procedure acSprNamesExecute(Sender: TObject);
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
    procedure acSprTypePunktExecute(Sender: TObject);
    procedure acWordShtampExecute(Sender: TObject);
    procedure TBItemNewClick(Sender: TObject);
    procedure acGerbShampExecute(Sender: TObject);
    procedure acViewLogFileExecute(Sender: TObject);
    procedure acSprPredstExecute(Sender: TObject);
    procedure acDBrakExecute(Sender: TObject);
    procedure acReDeclBrakExecute(Sender: TObject);
    procedure acUstMatExecute(Sender: TObject);
    procedure acReZUstMatExecute(Sender: TObject);
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
    procedure TBItem106Click(Sender: TObject);
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
    procedure acDeclareRegistrExecute(Sender: TObject);
    procedure acReDeclRegistrExecute(Sender: TObject);
    procedure acSprRodsNameExecute(Sender: TObject);
    procedure edSpecEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSpecClick(Sender: TObject);
    procedure edSpecDblClick(Sender: TObject);
    procedure acZVidGitExecute(Sender: TObject);
    procedure acSprDocAdmProcUExecute(Sender: TObject);
    procedure TBItemDeleteFilterClick(Sender: TObject);
    procedure TBItemUpdateAdminProcClick(Sender: TObject);
    procedure TBItemUpdateAdmProcClick(Sender: TObject);
    procedure acSprDocSubjGExecute(Sender: TObject);
    procedure TBItemDefaultIniClick(Sender: TObject);
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
    procedure SetYearFiks(const Value: Integer);
    {$IFDEF USE_TEMPLATE}
    procedure SetTemplateInterface(const Value: TTemplateInterface);
    {$ENDIF}
  public
    {$IFDEF USE_FR3}
    frxADSComponents:TfrxADSComponents;
    frxReport: TfrxReport;
    frxChartObject:TfrxChartObject;
    frxRichObject: TfrxRichObject;
    frxDialogControls: TfrxDialogControls;
    frxPDFExport: TfrxPDFExport;
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
    FOpenLic:Boolean;   // открыта или нет форма лицевого счета
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

    procedure CheckOpenFormParams(Sended:TObject);
    procedure UpdateParamsEvent( Meta : TMetaTask; const strName : String);
    procedure BeforeEditParamsEvent( Meta : TMetaTask; var lOk : boolean);
    procedure BeforeSaveParamsEvent( Meta : TMetaTask; var lOk : boolean);
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
    function EditDokument( ds : TdataSet; TypeObj : Integer; strFieldID : String;
                     slPar : TStringList; lEnableSkip : Boolean; strKodGurnal : String) : Boolean;
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
    procedure EditRecordSprOwners( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure OnEditRecord_IzbUch( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure OnBeforeDelete_IzbUch( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure OnExportEditSpr(Sender : TObject);
    procedure OnCheckEnableEditSpr(Opis:TOpisEdit; var nEnabled:Integer);
    procedure OnCheckEnableEditSprGKH(Opis:TOpisEdit; var nEnabled:Integer);
    procedure BeforeDeleteSprUL( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure BeforeDeleteSprPunkt( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure EditRecordSprNames( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure BeforeDeleteSprNames( Grid : TSasaDbGrid; var lDel : Boolean);
    procedure SprPunkt_GridGetCellParams(Sender: TObject; Column: TColumnEh;
                   AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);

    procedure RodsName_GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure RodsName_GridGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    function ChoiceZAGS(strSearch : String; var nID : Integer ) : Boolean;

    procedure RunAutoBackup;
    procedure RunAutoRestore;
    procedure RunSeekAndRestore(Sender: TObject);

    function RunProcScript(strFuncName: String; var vResult : Variant): Boolean;

    procedure UpdateActions; override;

    function GetAllLookupNamesForFilter : String;
    function GetAllListNamesForFilter : String;
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

  IL_EDIT=118;      //87;
  IL_SIGN=87;
  IL_ORG=89;        //места работы
  IL_ADD_MEN=119;   //87;
  IL_DEL_CHILD=120; //88;
  IL_DEL_MEN=120;   //88;
  IL_INFO_CORR=161;

  IL_DATE=56;
  IL_REG_DOC=56;
  IL_OTKAZ=20;

implementation

uses fPropertyObj, fAbout, fOperFind, fEditSpr, fChoiceZAGS,
     fPassport, fGurnPassport, fCreateFiks, fDeleteFiks, fVidGit,
     fGurnalAdres, fGurnVUS, fGurnOchered, fGurnDeclRegistr,
     NewDialogs, uFilter, fmDosFileView,
     fTalonPrib, fGurnTalonPrib,
     fTalonUbit, fGurnTalonUbit, fActions, ifpii_dbfunc, uCreateXML, u2zags,
     fDeclRegistr, fChoiceAdres,
     fGurnPassportViza, fGurnOwners, fEditPerevod,
     fSetPassword, fCopyData, fOpisTables, SelLibFr, uProject, uProjectAll, fExpDs, mExport, fSeekBase,
     fAdres, dAdres, uObjectsScript, fIzbUch, fPropHouse, fAddSobstv, fWarning, uFindBase, fmChList,
     mAdsObj, mDRecData,
     fPrintSSS, fShablon, fChoiceNasel, fTableGurnal, fLoadLicGES, DsiWin32,
     StrUtils;

{$R *.DFM}

function TfmMain.IsGorSovet: Boolean;
begin
  if (Copy(GlobalTask.ParamAsString('KOD'),5,3) > '500') and (Copy(GlobalTask.ParamAsString('KOD'),5,3) < '600') then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;


procedure TfmMain.acSetParametersExecute(Sender: TObject);
begin
  if Role.CheckSubSystem(SS_PAR)=ptFull then begin
    GlobalTask.SetEditEventParameter('ID', EditSOATO_GES, SOATO_GetText, nil);
    GlobalTask.SetEventParameter('BeforeOpenForm', CheckOpenFormParams );
    GlobalTask.EditParameters;
    edSpec.Caption:=DolgSpec+' '+FIOSpec;
  end else begin
    GlobalTask.ViewParameters;
  end;
end;

// перед открытием формы для корр. параметров
procedure TfmMain.CheckOpenFormParams(Sended:TObject);
var
  Opis:TOpisEdit;
  ed:TDBComboBoxEh;
begin
  Opis:=Globaltask.CurrentOpisEdit.GetListOpisA('KEY_RNGOR');
  if Opis.Items.Count=0 then begin
    ed:=TDBComboBoxEh(GlobalTask.GetParamEditFromKod('RN_GOROD'));
    if ed<>nil then begin
      ed.Enabled:=false;
    end;
  end;
end;

//----------- после чтения, обновления, записи --------------------
procedure TfmMain.UpdateParamsEvent(Meta: TMetaTask; const strName: String);
var
  strTerr : String;
begin
  strTerr:=Meta.ParamAsString('KOD');
  dmBase.LookUpSoatoSovet.Filtered := false;
  dmBase.LookUpSoatoSovet.Filter := 'Substr(KOD,1,4)='+''''+Copy(strTerr,1,4)+''''; //+' and '+
  dmBase.LookUpSoatoSovet.Filtered := true;
  {$IFDEF OBR_GRAG}
  DocRecord.UpdateParam;
  {$ENDIF}
end;

var
  oldID_BASE:String;  // ID базы перед корректировкой параметров
  oldID_GES:String;   // ID ЖЭС  перед корректировкой параметров
  oldSOATO_GES:String;

// перед корректировков параметров
procedure TfmMain.BeforeEditParamsEvent(Meta: TMetaTask; var lOk : Boolean);
begin
  lOk:=true;
  oldID_GES:=Meta.ParamAsString('ID');
  oldSOATO_GES:=Meta.ParamAsString('KOD');
  if dmBase.SprGES.Locate('ID', Meta.ParamAsString('ID'), []) then begin
    oldID_Base:=Trim(dmBase.SprGES.FieldByName('ID_BASE').AsString);
  end else begin
    oldID_Base:='';
  end;
end;

// перед сохранением после корректировки параметров
procedure TfmMain.BeforeSaveParamsEvent(Meta: TMetaTask; var lOk : Boolean);
var
  strID, strSOATO : String;
  strIDBase,s1,s2,s3,ss:String;
begin
  lOk := false;
  strID    := '0';
  strSOATO := '';
  strIDBase:= '';
  Meta.WriteParamAsString('NAME_TERR', Meta.ParamAsString('NAME') );
  if dmBase.SprGES.Locate('ID', Meta.ParamAsString('ID'), []) then begin
    strID    := Meta.ParamAsString('ID');
    strSOATO := dmBase.SprGES.FieldByName('SOATO').AsString;
    strIDBase:= Trim(dmBase.SprGES.FieldByName('ID_BASE').AsString);
    Meta.WriteParamAsString('KOD', strSOATO);
    lOk := true;
    if not dmBase.SprNames.Locate('ID', strID,[]) then begin
      dmBase.SprNames.Append;
    end else begin
      dmBase.SprNames.Edit;
    end;
  end else begin
    PutError('Не найдена выбранная организация.');
  end;
  if lOk then begin
{
    if strIDBase<>'' then begin
      dmBase.AdsConnection.Execute('delete from global');
      oldID_GES:='*';   // для заполнения таблицы GLOBAL
   // так нельзя будет ошибка при сохр. параметров   PutError('Для изменения организации база должна быть пуста.');
    end;
}
    if (strIDBase<>oldID_Base) or ( (strIDBase<>'') and (oldID_GES<>Meta.ParamAsString('ID')) ) then begin
      lOk:=( dmBase.tbAdres.Eof and dmBase.tbMens.Eof );
      if Role.SystemAdmin=true  // для ADSSYS можно менять
        then lOk:=true;
      if lOk then begin
        dmBase.AdsConnection.Execute('delete from global');
        if (strIDBase<>'') then begin
          s2:='3';   // пока так  (количество символов)
          if dmBase.SprGES.FieldByName('PODR').AsBoolean=false then begin // главная база
            s1:='0';
            s3:='true';
          end else begin
            s1:=strIDBase;
            s3:='false';
          end;
          dmBase.ClearIdBase;
          ss:='insert into global (id_base,count_sim,main_base) values ('+
               s1+','+s2+','+s3+')';
          dmBase.AdsConnection.Execute(ss);
        end;
      end else begin
        lOk:=false;
        Meta.WriteParamAsString('ID', oldID_GES);
        Meta.WriteParamAsString('KOD', oldSOATO_GES);
        PutError('Для изменения организации база должна быть пуста.');
      end;
    end;
    if lOk then begin
      if strIDBase='' then begin   // без распределенной базы
        dmBase.AdsConnection.Execute('delete from global');
      end;
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
    end;
  end else begin
    PutError('Не найден код СОАТО '+'"'+Meta.ParamAsString('KOD')+'"');
  end;

end;

// после успешного сохранения при корректировке параметров
procedure TfmMain.AfterSaveParamsEvent(Meta: TMetaTask; const strName:String);
begin
  GlobalFlat := Meta.ParamAsBoolean('FLAT');
  GlobalFontSizeE := Meta.ParamAsInteger('FONT_SIZE');
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

  FEventsWordReports.LoadEvents('MAIN_WORD_SS', TBSubmenuWord);
  TemplateInterface.BuildMenu('MAIN_WORD_SS', TBSubmenuWord, false, OnTemplateMenuClick);
  FEventsBlankReports.LoadEvents('MAIN_BLANK_SS', TBSubmenuBlank);

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
//      TBSeparatorItemObr2.Visible:=true;
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
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  {$IFDEF USE_FR3}
    frxReport:=TfrxReport.Create(self);
    frxADSComponents:=TfrxADSComponents.create(self);
    frxChartObject:=TfrxChartObject.Create(self);
    frxDialogControls:=TfrxDialogControls.Create(self);
    frxRichObject:=TfrxRichObject.Create(self);
    frxPDFExport:=TfrxPDFExport.Create(self);
    frxXMLExport:=TfrxXMLExport.Create(self);
    frxJPEGExport:=TfrxJPEGExport.Create(self);
    frxMailExport:=TfrxMailExport.Create(self);
    frxHTMLExport:=TfrxHTMLExport.Create(self);
    frxRTFExport:= TfrxRTFExport.Create(self);
  {$ENDIF}
  FYearFiks:=0;
  FOpenLic:=false;
  FRunActivate := false;
  fmLichSchet := nil;
  fmMen := nil;
  dmLichSchet := nil;
  dmMen := nil;
  LoadFromIni;
  TBToolWindowS.DockPos:=2000;
  TBToolWindowSpec.DockPos:=2000;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
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
// if GlobalTask.ParamAsBoolean('VIGR_ACTIONS') then begin
//   ActionList2RTF(ActionList,GlobalTask.PathService+'act_list.rtf');
//   ImageList2RTF(ImageList,GlobalTask.PathService+'img_list.rtf');
// end;
 ClearDir(ExtractFilePath(Application.ExeName)+'$TEMP$',true);
 GlobalTask.LogFile.WriteToLogFile('Завершен сеанс пользователя.');
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
// TBIniSavePositions(Self, GlobalTask.PathService+'Menu.ini', '');
 {$IFDEF OCHERED}
   if Role.SystemAdmin then begin
     SaveActionList(ActionList,GlobalTask.PathService+'ActionsOchered.ini')
   end;
 {$ELSE}
   {$IFDEF ZAGS}
     if Role.SystemAdmin then begin
       SaveActionList(ActionList,GlobalTask.PathService+'ActionsZags.ini')
     end;
   {$ELSE}
     {$IFDEF GKH}
       if Role.SystemAdmin then begin
         SaveActionList(ActionList,GlobalTask.PathService+'ActionsGKH.ini')
       end;
     {$ELSE}
       if Role.SystemAdmin then begin
         SaveActionList(ActionList,GlobalTask.PathService+'Actions.ini')
       end;
     {$ENDIF}
   {$ENDIF}
 {$ENDIF}
end;

procedure TfmMain.LoadFromIni;
begin
//  TBIniLoadPositions(Self, GlobalTask.PathService+'Menu.ini', '');
 {$IFDEF OCHERED}
   LoadActionList(ActionList,GlobalTask.PathService+'ActionsOchered.ini');
 {$ELSE}
   {$IFDEF ZAGS}
      LoadActionList(ActionList,GlobalTask.PathService+'ActionsZags.ini');
   {$ELSE}
     {$IFDEF GKH}
        LoadActionList(ActionList,GlobalTask.PathService+'ActionsGKH.ini');
     {$ELSE}
        LoadActionList(ActionList,GlobalTask.PathService+'Actions.ini');
     {$ENDIF}
   {$ENDIF}
 {$ENDIF}
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
    if dmBase.SprZAGS.Locate('ID', nID, []) then begin
      s := dmBase.SprZAGS.FieldByName('NAME').AsString;
    end else begin
      if dmBase.SprSoato.Locate('ID', nID, []) then begin
        s := dmBase.SprSoato.FieldByName('NAME').AsString;
      end;
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

procedure TfmMain.EditSOATO_GES(Sender: TObject; var Handled: Boolean);
var
  Edit : TDbEditEh;
  f : TfmChGES;
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
  f := TfmChGES.Create(nil);
  f.IDGES := Edit.Field.AsString;
  if f.ShowModal=mrOk then begin
    Edit.Field.AsString := f.IDGES;
    ds := Edit.Field.DataSet;
    EditDataSet(ds);
    // название организации
    fld1:=GlobalTask.GetParamFieldFromKod('NAME');
    fld2:=GlobalTask.GetParamFieldFromKod('NAME_B');
    if fld1<>nil  then begin
      fld1.AsString := f.NameGES;    // название
      fld2.AsString := f.NameBelGES; // название по-белорусски
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

procedure TfmMain.SOATO_GetText(Sender: TField; var Text: String;  DisplayText : Boolean);
begin
  if dmBase.SprGES.Locate('ID',Sender.AsString,[]) then begin
    Text := Trim(dmBase.SprGES.FieldByName('NAME').AsString);
  end else begin
    Text := 'Некоррекное значение';
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

//------------ очередь на жилье -------------------------
procedure TfmMain.acReOcheredExecute(Sender: TObject);
begin  ShowGurnal(TfmGurnOchered, 'fmGurnOchered'); end;

//------------ заявления о регистрации -------------------------
procedure TfmMain.acReDeclRegistrExecute(Sender: TObject);
begin  ShowGurnal(TfmGurnDeclRegistr, 'fmGurnDeclRegistr'); end;

//------------- адресная книга -------------
procedure TfmMain.acAdresExecute(Sender: TObject);
begin ShowGurnal(TfmGurnalAdres, 'fmGurnalAdres'); end;

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
  {$IFDEF ZAGS}
    Param := nil;
  {$ELSE}
    Param := TParamsEditSpr.Create;
    Param.OnBeforeDelete := BeforeDeleteSprUL;
  {$ENDIF}
  Globaltask.EditSpr('EDIT_SPRUL', Param);
end;
procedure TfmMain.BeforeDeleteSprUL( Grid : TSasaDbGrid; var lDel : Boolean);
var
  nID : Integer;      
begin
  nID := Grid.DataSource.DataSet.FieldByName('ID').AsInteger;
  if dmBase.tbAdres.Locate('UL', nID, []) then begin
    ShowMessage('  Удаление текущей записи запрещено ! ');
    lDel := false;
  end;
end;

procedure TfmMain.SprPunkt_GridGetCellParams(Sender: TObject; Column: TColumnEh;
             AFont: TFont; var Background: TColor; State: TGridDrawState);
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
procedure TfmMain.acSprPunktExecute(Sender: TObject);
var
  Param  : TParamsEditSpr;
begin
//  Param := nil;
  Param := TParamsEditSpr.Create;
  Param.OnGetCellParams := SprPunkt_GridGetCellParams;
  Param.Quest_Delete:='   Удалить населенный пункт из базы ?   ';
  Param.OnBeforeDelete := BeforeDeleteSprPunkt;
  Globaltask.EditSpr('EDIT_PUNKT', Param);
//  RefreshChoiceAdres;
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
begin Globaltask.EditSpr('EDIT_SERIASVID', nil); end;

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
end;

procedure TfmMain.acTestExecute(Sender: TObject);
var
//  fmParam:TfmParamQuest;
//  n:Integer;
  sWhere,sPunkt:String;
//  par:TXMLParams;
//  slPar:TStringList;
begin
//  showmessage(intToStr(dmBase.GetNewID(1)));

//  dmBase.SetIDLastReshOchered;

  if ChoiceLoadedAdres(sWhere, sPunkt, dmBase.AdsConnection, NIL)
    then ShowMessage(sWhere);

  {
  slPar:=TStringList.Create;

  //------лицевой счет--------------
  //slPar.Add('NAME_REPORT=fmLichSchet.SpxNalLS');
//  slPar.Add('NAME_REPORT=Лицевой Счет.frf');
  slPar.Add('NAME_REPORT=@PrintSSS');  // ???
  slPar.Add('TYPE_REPORT=FR');
  RunReport(dmBase.TypeObj_Lich,slPar,'405');
  }

  //------человек--------------
//  slPar.Add('NAME_REPORT=ВУС карточка первичного учета.frf');
//  RunReport(dmBase.TypeObj_Nasel,slPar,'405');

  //------адрес--------------
//  slPar.Add('NAME_REPORT=Поквартирная карточка.fr3');
//  RunReport(dmBase.TypeObj_Adres,slPar,'405');

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
procedure TfmMain.RodsName_GridGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
begin
  if ANSIUpperCase(Column.Field.AsString)='ГЛАВА' then begin
    Afont.Style:=Afont.Style+[fsBold];
    Background:=clInfoBk;
  end
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
            ds.FieldByName('SOATO').AsString  := IntToStr(nID)+'00';
          end else begin
            ds.FieldByName('ID').AsInteger := nID;
            ds.FieldByName('SOATO').AsString  := f.edSOATO.Text;
          end;
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

procedure TfmMain.GridGetCellParams(Sender: TObject; Column: TColumnEh;
             AFont: TFont; var Background: TColor; State: TGridDrawState);
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

procedure TfmMain.acSprWorkExecute(Sender: TObject);
begin
  Globaltask.EditSpr('EDIT_SPRWORK', nil);
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
        PutError('Текущее значение присутствует в таблице населения.');
        lDel:=false;
      end;
      if lDel then begin
        oldInd:=dmBase.tbHouseOwners.IndexFieldNames;
        dmBase.tbHouseOwners.IndexFieldNames:='TYPEKOD;KOD';
        if dmBase.tbHouseOwners.FindKey([OWNER_ORG,StrToInt(sId)]) then begin
          PutError('Текущее значение присутствует в таблице собственников.');
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
begin
  CheckFormLichSchet;
  fmLichSchet.Dokument.DateFiks := dmBase.GetDateCurrentSost;
  fmMen.Dokument.DateFiks := dmBase.GetDateCurrentSost;
//  fmLichSchet.lbSost.Caption := dmBase.NameSostFromDate(fmLichSchet.Dokument.DateFiks);
  fmLichSchet.Dokument.ReadDokument(-1);
  fmLichSchet.SkipDataSet:=nil;
  fmLichSchet.SetSubSystem(SS_HOZ_UCHET);
  fmLichSchet.EditForm(nil,'NULL');
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
function TfmMain.EditDokument(ds: TDataSet; TypeObj: Integer; strFieldID : String;
          slPar : TStringList; lEnableSkip : Boolean; strKodGurnal : String) : Boolean;
var
  nID : Integer;
  strID : String;
  Date_Fiks : TDateTime;
  fAdr : TfmAdres;
  dAdr : TdmAdres;
  l,lNew : Boolean;
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
//    if (slPar<>nil) and (slPar.Count>0) then begin
//      lVosstan:=(slPar.Values['VOSSTAN']='1');
//    end else begin
//      lVosstan:=false;
//    end;
  end else begin
    if ds.FindField('DATE_FIKS')<>nil
      then Date_Fiks:=ds.FieldByName('DATE_FIKS').AsDateTime
      else Date_Fiks:=0;
//    if ds.FindField('VOSSTAN')<>nil
//      then lVosstan:=ds.FieldByName('VOSSTAN').AsBoolean
//      else lVosstan:=false;
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
      fmMen.N_F_cbKvartirant.Visible:=true;
      fmMen.N_F_cbKvartirant.Enabled:=true;
    {$ENDIF}
    fmMen.ActiveControl := fmMen.edFam;
//    fmLichSchet.lbSost.Caption := dmBase.NameSostFromDate(fmLichSchet.Dokument.DateFiks);
    fmLichSchet.Dokument.ReadDokument(nID, slPar);
    fmLichSchet.QueryExit:=false;
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
          fmMen.Dokument.mtDokument.Edit;
          TdmMen(fmMen.Dokument).mtDokumentPROPIS.AsBoolean:=false;
          TdmMen(fmMen.Dokument).mtDokumentNOTSELECT.AsBoolean:=true;
          fmMen.edPropis.Enabled:=false;
//          fmMen.edCanSelect.Enabled:=false;
          fmMen.Dokument.mtDokument.Post;
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
        fmMen.edOTNOSH.Enabled := false;
//        fmMen.cbKvartirant.Visible:=false;
      {$ENDIF}
      fmMen.TBItemWrite.Caption:='Записать';
      fmMen.TBItemWrite.Hint:='Записать';
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
    try
      fAdr.Dokument.ReadDokument(nID, slPar);
//      fAdr.Dokument.ReadDokument( ds.FieldByName(strFieldID).AsInteger, slPar );
      fAdr.CheckExit:=true;
      fAdr.QueryExit:=false;
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
  //------------------ заявление на вид жительства -----------------------------------------------------
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
//      Result := EditDeclBrak(nID);
    end;
  //------------------ запись акта о браке -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZBrak then begin
  //------------------ запись акта о расторжении брака -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZRast then begin
  //------------------ запись акта о рождении -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZRogd then begin
  //------------------ запись акта о смерти -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZSmert then begin
  //------------------ запись акта об установлении отцоавства -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZUstOtc then begin
  //------------------ запись акта об установлении материнства -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZUstMat then begin
  //------------------ запись акта об усыновлении -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZAdopt then begin
  //------------------ запись акта о смене имени -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_ZChName then begin
  //------------------ талон прибытия -----------------------------------------------------
  end else if TypeObj = dmBase.TypeObj_TalonPrib then begin
    if not (strID='') then begin
//      nID := ds.FieldByName('ID').AsInteger;
      fmTalonPrib := TfmTalonPrib.Create(nil);
      try
        fmTalonPrib.ReadDok( nID );
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
//      nID := ds.FieldByName('ID').AsInteger;
      fmTalonUbit := TfmTalonUbit.Create(nil);
      try
        fmTalonUbit.ReadDok( nID );
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
    {$IFDEF ZAGS}
      ss := 'ЗАГС (демо-версия)';
    {$ELSE}
      {$IFDEF LAIS}
        ss := 'ЛАИС (демо-версия)';
      {$ELSE}
        {$IFDEF GKH}
          ss := 'ЖКХ (демо-версия)';
        {$ELSE}
          ss := 'Сельский Совет (демо-версия)';
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  end else begin
    {$IFDEF ZAGS}
      ss:='ЗАГС';
    {$ELSE}
      {$IFDEF LAIS}
        ss:='ЛАИС';
      {$ELSE}
        {$IFDEF GKH}
          ss:='ЖКХ';
        {$ELSE}
          ss:='Сельский Совет';
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  end;
  {$IFDEF OCHERED}
    ss:='Учет очередников';
  {$ENDIF}
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
  fmLichSchet.Free;
  dmLichSchet.Free;
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
  edSost.Text := dmBase.NameSostFromDate(FDateFiks);
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
  s,sName:String;
begin
  if not Role.SystemAdmin then begin
    acDesignReport.Visible  := false;
    acDesignReport3.Visible := false;
    TBSubmenuAdmin.Visible  := false;
//    TBItemLoadLic.Visible   := false;
  end else begin
//    TBItemLoadLic.Visible := true;
  end;
  if EnableReport then begin
    acDesignReport.Visible := true;
    acDesignReport3.Visible := true;
  end;

  lEnabled := (ListGurnal.Count=0);

  TBItemDateFiks.Enabled := lEnabled; // выбор состояния только при закрытых реестрах

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

  if dmBase.IsMainComputer and (Role.Status=rsAdmin) then begin
    TBSeparatorItem7.Visible:=true;
    acSetShare.Visible:=true;
    acDelShare.Visible:=true;
    sName:=GetNameSharedFolder(s);
    acSetShare.Caption:='Открыть общий доступ под именем: "'+sName+'"';
    if GlobalTask.ParamAsBoolean('ENABLE_SQL')
     then acSQL.Visible:=true
     else acSQL.Visible:=false;
  end else begin
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
    acLoadZAGS.Visible    := false;
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
  end;
  acLoadMRUListZAGS.Visible:=false;
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


procedure TfmMain.acReRogdExecute(Sender: TObject);
begin
// реестр записей актов о рождении
end;

procedure TfmMain.acReSmertExecute(Sender: TObject);
begin
// реестр записей актов о смерти
end;

// реестр записей регистрации браков
procedure TfmMain.acReBrakExecute(Sender: TObject);
begin
end;

// реестр заявлений на брак
procedure TfmMain.acReDeclBrakExecute(Sender: TObject);
begin
//  ShowGurnal(TfmGurnDBrak, 'fmGurnDBrak');
end;

// реестр записей расторжения браков
procedure TfmMain.acReRastExecute(Sender: TObject);
begin
//  ShowGurnal(TfmGurnZRast, 'fmGurnZRast');
end;

procedure TfmMain.acReZUstOtcExecute(Sender: TObject);
begin
//  ShowGurnal(TfmGurnZUstOtc, 'fmGurnZUstOtc');
end;

procedure TfmMain.acReZUstMatExecute(Sender: TObject);
begin
//  ShowGurnal(TfmGurnZUstMat, 'fmGurnZUstMat');
end;

procedure TfmMain.acReChNameExecute(Sender: TObject);
begin
//  ShowGurnal(TfmGurnZChName, 'fmGurnZChName');
end;

procedure TfmMain.acReAdoptExecute(Sender: TObject);
begin
//  ShowGurnal(TfmGurnZAdopt, 'fmGurnZAdopt');
end;

//------ заявление на поспорт --------------------
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

procedure TfmMain.acZPasportVizaExecute(Sender: TObject);
begin
//  EditPasportViza(-1);
end;

//--------- акт расторжения брака ---------------
procedure TfmMain.acZRastExecute(Sender: TObject);
begin
//  EditRastBrak( -1 );
end;

//--------- акт усыновления (удочерения) ---------------
procedure TfmMain.acZAdoptExecute(Sender: TObject);
begin
//  EditZapisAdopt( -1 );
end;

procedure TfmMain.acZChNameExecute(Sender: TObject);
begin
//  EditZapisChName( -1 );
end;

//--------- акт заключения брака ---------------
procedure TfmMain.acZBrakExecute(Sender: TObject);
begin
//  EditZapisBrak( -1 );
end;

//--------- заявление заключения брака ---------------
procedure TfmMain.acDBrakExecute(Sender: TObject);
begin
//  EditDeclBrak( -1 );
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

//--------  акт о рождении -----------------------
procedure TfmMain.acZRogdExecute(Sender: TObject);
begin
//  EditZapisRogd( -1, nil );
end;

//----------------  акт о смерти ------------------
procedure TfmMain.acZSmertExecute(Sender: TObject);
begin
end;

// установление отцовства
procedure TfmMain.acUstOtcExecute(Sender: TObject);
begin
//  EditZapisUstOtc( -1 );
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
procedure TfmMain.acSetDateFiksExecute(Sender: TObject);
var
  f : TfmDeleteFiks;
  lOk : Boolean;
  strDate : String;
  d : TDateTime;
begin
  f := TfmDeleteFiks.Create(nil);
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
  TBToolWindowS.DockPos:=2000;
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
var
  l : Boolean;
  nID : Integer;
begin
  fmTalonPrib := TfmTalonPrib.Create(nil);
  try
    fmTalonPrib.NewDok(true);
    fmTalonPrib.EditModal;
    l := fmTalonPrib.FRunTalonUbit;
    nID := fmTalonPrib.DokumentID.AsInteger;
  finally
    fmTalonPrib.Free;
    fmTalonPrib := nil;
  end;
  if l then begin
    TalonUbitFromTalonPrib(nID);
  end;
end;

procedure TfmMain.acTalonUbitExecute(Sender: TObject);
begin
  fmTalonUbit := TfmTalonUbit.Create(nil);
  try
    fmTalonUbit.NewDok(true);
    fmTalonUbit.EditModal;
  finally
    fmTalonUbit.Free;
    fmTalonUbit := nil;
  end;
end;

procedure TfmMain.acReTalonPribExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnTalonPrib, 'fmGurnTalonPrib');
end;

procedure TfmMain.acReTalonUbitExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnTalonUbit, 'fmGurnTalonUbit');
end;

procedure TfmMain.acReOwnersExecute(Sender: TObject);
begin
  ShowGurnal(TfmGurnOwners, 'fmGurnOwners');
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
  sl.AddObject('TBSubMenuLich',TBSubMenuLich);
  sl.AddObject('TBSubMenuItemDok',TBSubMenuItemDok);
  sl.AddObject('TBSubMenuCreate',TBSubMenuCreate);
  sl.AddObject('TBSubMenuSprVus',TBSubMenuSprVus);
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
      GlobalTask.DemoVersion := false;
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

procedure TfmMain.acAddReportZAGSExecute(Sender: TObject);
begin
//  ShowMessage( IntToStr(GlobalTask.CountReport('AddReportsZAGS')) );
  {$IFDEF ZAGS}
    GlobalTask.PreViewReport('AddReportsZAGS');
  {$ELSE}
    GlobalTask.PreViewReport('AddReportsZAGS_SS');
  {$ENDIF}
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
  if ListGurnal.Count=0 then begin
//    if acBackup.En
  end else begin
  end;
end;

procedure TfmMain.acRunObrabExecute(Sender: TObject);
begin
  RunObrab;
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
  RunAutoRestore;
end;

procedure TfmMain.FormActivate(Sender: TObject);
{$IFNDEF ZAGS}
var
  lShow : Boolean;
{$ENDIF}
begin
  Application.ProcessMessages;
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
    end;

    FRunActivate := true;
    edSpec.Caption:=DolgSpec+' '+FIOSpec;
    if dmBase.LastDatabaseError=0 then begin
      {$IFNDEF ZAGS}
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
    end;
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
  ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Доработки ЖКХ.doc')), nil, nil, SW_SHOWNORMAL);
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
//------------------------------------------------------------------------------------
procedure TfmMain.acSprDocAdmProcExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_ADMPROC');
  {$ENDIF}
end;
//------------------------------------------------------------------------------------
procedure TfmMain.acSprDocAdmProcUExecute(Sender: TObject);
begin
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_ADMPROC_U');
  {$ENDIF}
end;
//------------------------------------------------------------------------------------
procedure TfmMain.acSprDocOfficialExecute(Sender: TObject);
begin
  //Globaltask.EditSpr('EDIT_SPRDOCOFFICIAL', nil);
  {$IFDEF OBR_GRAG}
    DocRecord.EditSpr('SP_OFFICIAL');
  {$ENDIF}
end;
//------------------------------------------------------------------------------------
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
    if EDN2Xml([tbBirth,tbMarriages,tbDeath],par) then begin
      ShowMessage('Сформированный файл находиться в папке "Мои документы" под именем:'+#13#10+sFileName);
    end else begin
      Puterror('Ошибка выгрузки');
    end;
  end;
  fmParam.Free;
end;

procedure TfmMain.acUnionBaseExecute(Sender: TObject);
begin
  LoadLicGES;
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

// контроль доступности корректировки справочников в зависипости от прав пользователя
// -1 - не определено, 0 - не разрешено, 1 - разрешено
procedure TfmMain.OnCheckEnableEditSprGKH(Opis: TOpisEdit; var nEnabled: Integer);
var
  strName:String;
  i:Integer;
  lEnable:Boolean;
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
//      nEnabled:=Role.EnableEditTable(strName, 0);
      lEnable:=true;
//      lEnable:=dmBase.EnableEditSpr(strName);
    end else begin
      strName:= Opis.DataSet.Name;
      lEnable:=true;
//      lEnable:=dmBase.EnableEditSpr(strName);
//      nEnabled:=Role.EnableEditTable(strName, 1);
    end;
    if lEnable
      then nEnabled:=1
      else nEnabled:=0;
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
begin
  if dmBase.AnyExport('Выгрузка для портала РИАП     ...','&Vigr_Lais',true,true,'','') then begin

  end;
end;

procedure TfmMain.acViewVigrRIAPExecute(Sender: TObject);
begin
  Globaltask.EditSpr('EDIT_JURNOPER', nil);
end;

//-------------------------------------------------------------------------------------
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

procedure TfmMain.edSpecEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
end;

//------------------------------------------------------------------------------------
procedure TfmMain.edSpecClick(Sender: TObject);
var
  i,nID : Integer;
  List : TStringList;
  Opis:TOpisEdit;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_PERSONAL');
  if Opis<>nil then begin
    List := TStringList.Create;
    Opis.DataSet.First;
    while not Opis.DataSet.Eof do begin
      if Opis.DataSet.FieldByName('IS_SPEC').AsBoolean then begin
         List.AddObject(Opis.DataSet.FieldByName('POST').AsString+' '+Opis.DataSet.FieldByName('FIO').AsString,
                        Pointer(Opis.DataSet.FieldByName('ID').AsInteger) );
      end;
      Opis.DataSet.Next;
    end;
    if List.Count=0 then begin
      PutError('В справочнике должностных лиц не найдено ни одного специалиста.');
    end else begin
      // для общего случая надо использовать ClientToScreen
//      y:=Top+(Self.Height-Self.ClientHeight)+TBDock2.Top+TBDock2.Height+2;
//      x:=Left+(Self.Width-Self.ClientWidth)+TBToolWindowSpec.Left;
//      i := ChoiceFromList(List,'Выберите специалиста', x, y);
      i := ChoiceFromList(List,'Выберите специалиста', TBToolWindowSpec);
      if (i>-1)  then begin
        nID := Integer(List.Objects[i]);
        if Opis.DataSet.Locate('ID',nID,[]) then begin
          GlobalTask.WriteParamAsString('РУК_ПАСП',  Opis.DataSet.FieldByName('FIO').AsString);
          GlobalTask.WriteParamAsString('DOLG_PASP', Opis.DataSet.FieldByName('POST').AsString);
          GlobalTask.SaveParameters;
          edSpec.Caption:=DolgSpec+' '+FIOSpec;
        end;
      end;
    end;
    FreeAndNil(List);
  end;
end;
//------------------------------------------------------------------------------------
procedure TfmMain.edSpecDblClick(Sender: TObject);
begin
  edSpecClick(Sender);
end;

procedure TfmMain.TBItemDeleteFilterClick(Sender: TObject);
begin
  dmBase.DeleteFromBaseFilter;
end;

procedure TfmMain.TBItemUpdateAdminProcClick(Sender: TObject);
begin
  if Problem(' Обновить справочники административных процедур и тематик обращений ? ') then begin
    dmBase.CheckSprAdmProc('');
    dmBase.CheckSprAdmProc('U');
    dmBase.CheckSprTematic('');
  end;
end;

procedure TfmMain.TBItemUpdateAdmProcClick(Sender: TObject);
begin
  if Problem(' Обновить справочники административных процедур и тематик обращений ? ') then begin
    dmBase.CheckSprAdmProc('');
    dmBase.CheckSprAdmProc('U');
    dmBase.CheckSprTematic('');
  end;
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

procedure TfmMain.SetYearFiks(const Value: Integer);
begin
  FYearFiks := Value;
  GlobalTask.SetWorkParam('YEARFIKS', FYearFiks);
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

initialization
  ListGurnal := TStringList.Create;
finalization
  ListGurnal.Free;
end.
