unit fZapisBrak;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, ROPasScript, DateUtils,
  ExtCtrls, OpisEdit, dbFunc, MetaTask, DBLookupEh, DBCtrlsEh, StdCtrls, fEditMemo, uCheckKod, uTypes, uDataSet2XML,
  Mask, Grids, DBGridEh, FuncPr, FR_DSet, FR_DBSet, TB2ExtItems, uPadegFIO, uProject, uProjectAll, fShablon,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  DBCtrls, Buttons, ImgList, vchDBCtrls, kbmMemCSVStreamFormat, ZipForge, frxPrinter;

type
  TfmZapisBrak = class(TfmSimpleD)
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentON_Familia: TStringField;
    DokumentON_Otch: TStringField;
    DokumentON_Name: TStringField;
    DokumentON_DateR: TDateField;
    DokumentON_GOSUD: TIntegerField;
    DokumentON_OBL: TStringField;
    DokumentON_RAION: TStringField;
    DokumentON_GOROD: TStringField;
    DokumentON_WORK: TStringField;
    DokumentON_OBRAZ: TIntegerField;
    DokumentON_M_GOSUD: TIntegerField;
    DokumentON_M_OBL: TStringField;
    DokumentON_M_RAION: TStringField;
    DokumentON_M_GOROD: TStringField;
    DokumentON_M_GOROD_R: TStringField;
    DokumentON_SEM: TIntegerField;
    DokumentON_DOKUMENT: TStringField;
    DokumentON_SVID: TStringField;
    DokumentOTMETKA: TMemoField;
    DokumentONA_Familia: TStringField;
    DokumentONA_Otch: TStringField;
    DokumentONA_Name: TStringField;
    DokumentONA_DateR: TDateField;
    DokumentONA_GOSUD: TIntegerField;
    DokumentONA_OBL: TStringField;
    DokumentONA_RAION: TStringField;
    DokumentONA_GOROD: TStringField;
    DokumentONA_WORK: TStringField;
    DokumentONA_OBRAZ: TIntegerField;
    DokumentONA_M_GOSUD: TIntegerField;
    DokumentONA_M_OBL: TStringField;
    DokumentONA_M_RAION: TStringField;
    DokumentONA_M_GOROD: TStringField;
    DokumentONA_M_GOROD_R: TStringField;
    DokumentONA_SEM: TIntegerField;
    DokumentONA_DOKUMENT: TStringField;
    DokumentONA_SVID: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentDETI: TMemoField;
    TBItemChoiceMen: TTBItem;
    DokumentON_FamiliaP: TStringField;
    DokumentONA_FamiliaP: TStringField;
    pc: TPageControl;
    tsTail1: TTabSheet;
    Label1: TLabel;
    edON_Familia: TDBEditEh;
    edONA_Familia: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edON_FamiliaP: TDBEditEh;
    edONA_FamiliaP: TDBEditEh;
    Label5: TLabel;
    Label6: TLabel;
    lbDateR_Rodit: TLabel;
    edON_Name: TDBEditEh;
    edON_OTCH: TDBEditEh;
    edONA_Name: TDBEditEh;
    edONA_OTCH: TDBEditEh;
    edON_DATER: TDBDateTimeEditEh;
    edONA_DATER: TDBDateTimeEditEh;
    Label8: TLabel;
    edON_GOSUD: TDBLookupComboboxEh;
    edONA_GOSUD: TDBLookupComboboxEh;
    BLR_edON_OBL: TDBEditEh;
    BLR_edONA_OBL: TDBEditEh;
    BLR_edON_RAION: TDBEditEh;
    BLR_edONA_RAION: TDBEditEh;
    edON_GOROD: TDBEditEh;
    edONA_GOROD: TDBEditEh;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edON_NATION: TDBLookupComboboxEh;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edON_M_GOSUD: TDBLookupComboboxEh;
    edON_M_GOROD: TDBEditEh;
    Label22: TLabel;
    edON_GRAG: TDBLookupComboboxEh;
    edON_WORK: TDBEditEh;
    edON_OBRAZ: TDBComboBoxEh;
    Label23: TLabel;
    edON_M_GOROD_R: TDBEditEh;
    edONA_NATION: TDBLookupComboboxEh;
    edONA_M_GOSUD: TDBLookupComboboxEh;
    edONA_M_GOROD: TDBEditEh;
    edONA_GRAG: TDBLookupComboboxEh;
    edONA_WORK: TDBEditEh;
    edONA_OBRAZ: TDBComboBoxEh;
    edONA_M_GOROD_R: TDBEditEh;
    tsTail2: TTabSheet;
    Label24: TLabel;
    pnMain: TPanel;
    lbNomer: TLabel;
    edNomer: TDBEditEh;
    Label28: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label31: TLabel;
    edON_DOKUMENT: TDBEditEh;
    edONA_DOKUMENT: TDBEditEh;
    Label32: TLabel;
    edOTMETKA: TDBEditEh;
    Label33: TLabel;
    edON_SVID: TDBEditEh;
    edONA_SVID: TDBEditEh;
    gbDeti: TGroupBox;
    GridDeti: TDBGridEh;
    edON_SEM: TDBComboBoxEh;
    edONA_SEM: TDBComboBoxEh;
    dsDeti: TDataSource;
    tbDeti: TkbmMemTable;
    tbDetiFAMILIA: TStringField;
    tbDetiNAME: TStringField;
    tbDetiOTCH: TStringField;
    tbDetiGOD_ROG: TIntegerField;
    DokumentRUKOV: TStringField;
    DokumentON_B_RESP: TBooleanField;
    DokumentON_B_OBL: TBooleanField;
    DokumentON_M_B_RESP: TBooleanField;
    DokumentON_M_B_OBL: TBooleanField;
    DokumentONA_B_RESP: TBooleanField;
    DokumentONA_B_OBL: TBooleanField;
    DokumentONA_M_B_RESP: TBooleanField;
    DokumentONA_M_B_OBL: TBooleanField;
    edON_B_OBL: TDBCheckBoxEh;
    edONA_B_OBL: TDBCheckBoxEh;
    edON_M_B_OBL: TDBCheckBoxEh;
    edONA_M_B_OBL: TDBCheckBoxEh;
    dsNation: TDataSource;
    dsStran: TDataSource;
    DokumentON_ID: TIntegerField;
    DokumentONA_ID: TIntegerField;
    DokumentFirst_Ekz: TBooleanField;
    N_F_1: TDBCheckBoxEh;
    lbSvid: TLabel;
    edSvid_Nomer: TDBEditEh;
    Label55: TLabel;
    DokumentSVID_SERIA: TStringField;
    edRukov: TDBEditEh;
    edDateSV: TDBDateTimeEditEh;
    Label29: TLabel;
    DokumentDATESV: TDateField;
    DokumentON_Familia_B: TStringField;
    DokumentON_FamiliaP_B: TStringField;
    DokumentON_Name_B: TStringField;
    DokumentON_Otch_B: TStringField;
    DokumentON_OBL_B: TStringField;
    DokumentON_RAION_B: TStringField;
    DokumentON_GOROD_B: TStringField;
    DokumentONA_Familia_B: TStringField;
    DokumentONA_FamiliaP_B: TStringField;
    DokumentONA_Name_B: TStringField;
    DokumentONA_Otch_B: TStringField;
    DokumentONA_OBL_B: TStringField;
    DokumentONA_RAION_B: TStringField;
    DokumentONA_GOROD_B: TStringField;
    DokumentRUKOV_B: TStringField;
    DokumentOSNOV: TBooleanField;
    DokumentSUD_NAME: TMemoField;
    DokumentSUD_DATE: TDateField;
    DokumentSUD_BRAK: TMemoField;
    DokumentZAVIT: TMemoField;
    DokumentVOSSTAN: TBooleanField;
    edSpec: TDBEditEh;
    DokumentSPEC: TStringField;
    DokumentID_ZAGS: TIntegerField;
    Label34: TLabel;
    edPoshlina: TDBEditEh;
    DokumentPOSHLINA: TStringField;
    DokumentDATEB: TDateField;
    lbDateBrak: TLabel;
    edDateBrak: TDBDateTimeEditEh;
    edIzmen: TDBEditEh;
    Label42: TLabel;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    dsGragd: TDataSource;
    cbOnlyGodON: TDBCheckBoxEh;
    cbOnlyGodONA: TDBCheckBoxEh;
    DokumentON_ONLYGOD: TBooleanField;
    DokumentONA_ONLYGOD: TBooleanField;
    DokumentCOPIA: TBooleanField;
    N_F_edCopy: TDBCheckBoxEh;
    btRazdel: TButton;
    tsSprav: TTabSheet;
    edTypeSpr: TDBComboBoxEh;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label43: TLabel;
    edAddTextArx: TDBEditEh;
    edDateArxSpr: TDBDateTimeEditEh;
    edNomerArxSpr: TDBEditEh;
    edAdresat: TDBEditEh;
    Label44: TLabel;
    DokumentARX_ADRESAT: TStringField;
    DokumentARX_DATE: TDateField;
    DokumentARX_NOMER: TStringField;
    DokumentARX_TEXT: TMemoField;
    TBItemArxSpr: TTBItem;
    DokumentON_GODPR: TSmallintField;
    DokumentONA_GODPR: TSmallintField;
    DokumentON_VOZR: TSmallintField;
    DokumentONA_VOZR: TSmallintField;
    edSVID_SERIA: TDBLookupComboboxEh;
    tsPovtor: TTabSheet;
    TBItemVozrast: TTBItem;
    edON_VOZR: TDBNumberEditEh;
    edONA_VOZR: TDBNumberEditEh;
    edON_M_RNGOROD: TDBLookupComboboxEh;
    DokumentON_M_RNGOROD: TStringField;
    DokumentONA_M_RNGOROD: TStringField;
    edONA_M_RNGOROD: TDBLookupComboboxEh;
    DokumentON_M_B_RN: TBooleanField;
    DokumentONA_M_B_RN: TBooleanField;
    N_F_cbTorgest: TDBCheckBoxEh;
    TBItemChoiceDeclare: TTBItem;
    btV18: TButton;
    DokumentPOLE_GRN: TSmallintField;
    DokumentON_B_GOROD: TSmallintField;
    DokumentONA_B_GOROD: TSmallintField;
    DokumentON_M_B_GOROD: TSmallintField;
    DokumentONA_M_B_GOROD: TSmallintField;
    DokumentON_IDENTIF: TStringField;
    DokumentONA_IDENTIF: TStringField;
    DokumentON_STATUS: TStringField;
    DokumentONA_STATUS: TStringField;
    DokumentON_DOK_TYPE: TSmallintField;
    DokumentON_DOK_SERIA: TStringField;
    DokumentON_DOK_NOMER: TStringField;
    DokumentON_DOK_DATE: TDateField;
    DokumentON_DOK_ORGAN: TIntegerField;
    DokumentONA_DOK_TYPE: TSmallintField;
    DokumentONA_DOK_SERIA: TStringField;
    DokumentONA_DOK_NOMER: TStringField;
    DokumentONA_DOK_DATE: TDateField;
    DokumentONA_DOK_ORGAN: TIntegerField;
    DokumentTYPEMESSAGE: TStringField;
    edON_B_GOROD: TDBLookupComboboxEh;
    edONA_B_GOROD: TDBLookupComboboxEh;
    edON_M_B_GOROD: TDBLookupComboboxEh;
    edONA_M_B_GOROD: TDBLookupComboboxEh;
    edON_DOK_TYPE: TDBComboBoxEh;
    edON_DOK_SERIA: TDBEditEh;
    edON_DOK_NOMER: TDBEditEh;
    Label69: TLabel;
    edON_DOK_DATE: TDBDateTimeEditEh;
    edONA_DOK_SERIA: TDBEditEh;
    edONA_DOK_TYPE: TDBComboBoxEh;
    edONA_DOK_NOMER: TDBEditEh;
    Label70: TLabel;
    edONA_DOK_DATE: TDBDateTimeEditEh;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    ImageGISUN: TImage;
    lbIN: TLabel;
    ENG_edON_IDENTIF: TDBEditEh;
    ENG_edONA_IDENTIF: TDBEditEh;
    N_F_cbBelorus: TDBCheckBoxEh;
    DokumentBRAK_RAST: TBooleanField;
    N_F_cbRast: TDBCheckBoxEh;
    lbBrakRast: TvchDBText;
    Label25: TLabel;
    edON_Voenkom: TDBLookupComboboxEh;
    DokumentON_VOENKOM: TIntegerField;
    DokumentONA_VOENKOM: TIntegerField;
    edONA_VOENKOM: TDBLookupComboboxEh;
    DokumentON_VUS: TBooleanField;
    DokumentONA_VUS: TBooleanField;
    cbON_VUS: TDBCheckBoxEh;
    cbONA_VUS: TDBCheckBoxEh;
    Label26: TLabel;
    edMestoRegistr: TDBLookupComboboxEh;
    DokumentMESTO: TIntegerField;
    dsMesto: TDataSource;
    DokumentSPEC_B: TStringField;
    tsSvid: TTabSheet;
    edON_Familia_Sv: TDBEditEh;
    edON_Name_Sv: TDBEditEh;
    edON_Otch_Sv: TDBEditEh;
    Label77: TLabel;
    Label76: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    edON_DateR_Sv: TDBDateTimeEditEh;
    cbOnlyGodON_Sv: TDBCheckBoxEh;
    edON_VOZR_SV: TDBNumberEditEh;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    edON_B_OBL_Sv: TDBCheckBoxEh;
    edON_GOSUD_Sv: TDBLookupComboboxEh;
    edON_B_GOROD_Sv: TDBLookupComboboxEh;
    edON_Gorod_Sv: TDBEditEh;
    edONA_Familia_Sv: TDBEditEh;
    edONA_Name_Sv: TDBEditEh;
    edONA_Otch_Sv: TDBEditEh;
    edONA_DateR_Sv: TDBDateTimeEditEh;
    cbOnlyGodONA_Sv: TDBCheckBoxEh;
    edONA_VOZR_SV: TDBNumberEditEh;
    edONA_B_OBL_Sv: TDBCheckBoxEh;
    edONA_GOSUD_Sv: TDBLookupComboboxEh;
    edONA_B_GOROD_Sv: TDBLookupComboboxEh;
    edONA_Gorod_Sv: TDBEditEh;
    Label54: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    edRukov_Sv: TDBEditEh;
    edON_FamiliaP_Sv: TDBEditEh;
    edONA_FamiliaP_Sv: TDBEditEh;
    BLR_edON_Familia_B_Sv: TDBEditEh;
    BLR_edON_Name_B_Sv: TDBEditEh;
    BLR_edON_Otch_B_Sv: TDBEditEh;
    edON_GOSUD_B_Sv: TDBLookupComboboxEh;
    BLR_edON_Gorod_B_Sv: TDBEditEh;
    BLR_edONA_Familia_B_Sv: TDBEditEh;
    BLR_edONA_Name_B_Sv: TDBEditEh;
    BLR_edONA_Otch_B_Sv: TDBEditEh;
    edONA_GOSUD_B_Sv: TDBLookupComboboxEh;
    BLR_edONA_Gorod_B_Sv: TDBEditEh;
    BLR_edON_FamiliaP_B_Sv: TDBEditEh;
    BLR_edONA_FamiliaP_B_Sv: TDBEditEh;
    BLR_edRukov_Sv_B: TDBEditEh;
    BLR_edONA_OBL_R_B_Sv: TDBEditEh;
    BLR_edONA_RAION_R_B_Sv: TDBEditEh;
    BLR_edON_OBL_R_B_Sv: TDBEditEh;
    BLR_edON_RAION_R_B_Sv: TDBEditEh;
    edPrich18: TDBComboBoxEh;
    DokumentPRICH18: TIntegerField;
    DokumentSOKR_REG: TIntegerField;
    edSokrReg: TDBComboBoxEh;
    Label65: TLabel;
    DokumentDETI_COUNT: TSmallintField;
    pnDeti: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    edON_OBL: TDBEditEh;
    edON_RAION: TDBEditEh;
    edON_M_OBL: TDBEditEh;
    edON_M_RAION: TDBEditEh;
    edONA_M_OBL: TDBEditEh;
    edONA_M_RAION: TDBEditEh;
    edONA_OBL: TDBEditEh;
    edONA_RAION: TDBEditEh;
    edON_OBL_R_Sv: TDBEditEh;
    edON_RAION_R_Sv: TDBEditEh;
    edONA_OBL_R_Sv: TDBEditEh;
    edONA_RAION_R_Sv: TDBEditEh;
    DokumentRN_ON_M_B_GOROD: TStringField;
    DokumentRN_ON_B_GOROD: TStringField;
    DokumentRN_ONA_M_B_GOROD: TStringField;
    DokumentRN_ONA_B_GOROD: TStringField;
    DokumentTYPE_RAST: TIntegerField;
    DokumentS_NOMER: TStringField;
    DokumentS_DATE: TDateField;
    DokumentS_ZAGS: TStringField;
    DokumentS_ZAGS_B: TStringField;
    DokumentR_NOMER: TStringField;
    DokumentR_DATE: TDateField;
    DokumentR_ZAGS: TStringField;
    DokumentR_ZAGS_B: TStringField;
    DokumentSUDNAME: TStringField;
    DokumentSUDNAME_B: TStringField;
    DokumentSUDRESH: TDateField;
    DokumentSUDSILA: TDateField;
    tsRast: TTabSheet;
    Panel2: TPanel;
    gbSud: TGroupBox;
    lb10: TLabel;
    lb11: TLabel;
    edSudResh: TDBDateTimeEditEh;
    edSudName: TDBEditEh;
    edSudSila: TDBDateTimeEditEh;
    gbZap: TGroupBox;
    lb7: TLabel;
    lb8: TLabel;
    lb9: TLabel;
    edR_NOMER: TDBEditEh;
    edR_DATE: TDBDateTimeEditEh;
    edR_ZAGS: TDBEditEh;
    gbSmert: TGroupBox;
    lb14: TLabel;
    lb15: TLabel;
    lb13: TLabel;
    lb12: TLabel;
    edS_NOMER: TDBEditEh;
    edS_DATE: TDBDateTimeEditEh;
    edS_ZAGS: TDBEditEh;
    rbSmert: TRadioButton;
    rbSud: TRadioButton;
    rbZap: TRadioButton;
    DokumentSUM_POSHLINA: TFloatField;
    edSumPoshlina: TDBNumberEditEh;
    DokumentON_M_DOM: TStringField;
    DokumentON_M_KORP: TStringField;
    DokumentON_M_KV: TStringField;
    DokumentONA_M_DOM: TStringField;
    DokumentONA_M_KORP: TStringField;
    DokumentONA_M_KV: TStringField;
    Label66: TLabel;
    edON_M_DOM: TDBEditEh;
    Label67: TLabel;
    edON_M_KORP: TDBEditEh;
    Label68: TLabel;
    edON_M_KV: TDBEditEh;
    Label71: TLabel;
    edONA_M_DOM: TDBEditEh;
    Label72: TLabel;
    edONA_M_KORP: TDBEditEh;
    Label73: TLabel;
    edONA_M_KV: TDBEditEh;
    DokumentDATE_OTM_RAST: TDateField;
    edDateOtmRast: TDBDateTimeEditEh;
    Label74: TLabel;
    DokumentOTM_RAST: TStringField;
    edOtmRast: TDBEditEh;
    DokumentON_FAM_R: TStringField;
    DokumentONA_FAM_R: TStringField;
    edON_FAM_R: TDBEditEh;
    Label75: TLabel;
    edONA_FAM_R: TDBEditEh;
    Label78: TLabel;
    Label79: TLabel;
    Label45: TLabel;
    edON_GODPR: TDBNumberEditEh;
    edONA_GODPR: TDBNumberEditEh;
    rbNed: TRadioButton;
    Label80: TLabel;
    edTarif: TDBNumberEditEh;
    DokumentTARIF: TFloatField;
    DokumentON_GRAG_ADD: TMemoField;
    DokumentONA_GRAG_ADD: TMemoField;
    DokumentON_GRAG: TIntegerField;
    DokumentON_NATION: TIntegerField;
    DokumentONA_GRAG: TIntegerField;
    DokumentONA_NATION: TIntegerField;
    Label36: TLabel;
    BLR_edON_FamiliaP: TDBEditEh;
    BLR_edON_Name: TDBEditEh;
    BLR_edON_Otch: TDBEditEh;
    BLR_edON_Familia: TDBEditEh;
    BLR_edONA_FamiliaP: TDBEditEh;
    BLR_edONA_Name: TDBEditEh;
    BLR_edONA_Otch: TDBEditEh;
    BLR_edONA_Familia: TDBEditEh;
    BLR_edON_GOSUD: TDBLookupComboboxEh;
    BLR_edONA_Gosud: TDBLookupComboboxEh;
    BLR_edON_Gorod: TDBEditEh;
    BLR_edONA_Gorod: TDBEditEh;
    DokumentON_SOATO: TStringField;
    DokumentONA_SOATO: TStringField;
    DokumentDECL_ID: TIntegerField;
    edON_SOATO: TDBEditEh;
    edONA_SOATO: TDBEditEh;
    DokumentDECLARE_ID: TIntegerField;
    N_F_cbPovtor: TDBCheckBoxEh;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    BLR_edON_B_GOROD: TDBLookupComboboxEh;
    BLR_edONA_B_GOROD: TDBLookupComboboxEh;
    DokumentDETIasSTR: TBooleanField;
    edDeti: TDBEditEh;
    DokumentON_REG_DATE_TILL: TDateField;
    DokumentON_REG_DATE: TDateField;
    tsReshSud: TTabSheet;
    GridRS: TDBGridEh;
    dsReshSud: TDataSource;
    DokumentONA_REG_DATE_TILL: TDateField;
    DokumentONA_REG_DATE: TDateField;
    lbON_REG_DATE_TILL: TvchDBText;
    lbONA_REG_DATE_TILL: TvchDBText;
    N_F_lbON_Status: TvchDBText;
    N_F_lbONA_Status: TvchDBText;
    DokumentON_SEM_DOK: TMemoField;
    DokumentONA_SEM_DOK: TMemoField;
    N_F_lbON_SEM: TvchDBText;
    N_F_lbONA_SEM: TvchDBText;
    TBItemChName: TTBItem;
    ImCondIN_ON: TImage;
    ImCondIN_ONA: TImage;
    DokumentON_IDENTIF_GIS: TStringField;
    DokumentONA_IDENTIF_GIS: TStringField;
    DokumentON_ATEID: TIntegerField;
    DokumentONA_ATEID: TIntegerField;
    procedure FormResize(Sender: TObject);
    procedure edON_FamiliaEditButtons0Click(Sender: TObject;           var Handled: Boolean);
    procedure edONA_FamiliaEditButtons0Click(Sender: TObject;          var Handled: Boolean);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edON_FamiliaEnter(Sender: TObject);
    procedure edON_FamiliaPEnter(Sender: TObject);
    procedure edON_OTCHEnter(Sender: TObject);
    procedure edON_NameEnter(Sender: TObject);
    procedure edONA_FamiliaEnter(Sender: TObject);
    procedure edONA_FamiliaPEnter(Sender: TObject);
    procedure edONA_NameEnter(Sender: TObject);
    procedure edONA_OTCHEnter(Sender: TObject);
    procedure edON_FamiliaCheckDrawRequiredState(Sender: TObject;      var DrawState: Boolean);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edRukovEnter(Sender: TObject);
    procedure cbOnlyGodONClick(Sender: TObject);
    procedure btRazdelClick(Sender: TObject);
    procedure TBItemArxSprClick(Sender: TObject);
    procedure TBItemVozrastClick(Sender: TObject);
    procedure edON_OBL_RNotInList(Sender: TObject; NewText: String;       var RecheckInList: Boolean);
    procedure edON_RAION_RNotInList(Sender: TObject; NewText: String;       var RecheckInList: Boolean);
    procedure edON_M_RNGORODNotInList(Sender: TObject; NewText: String;       var RecheckInList: Boolean);
    procedure TBItemChoiceDeclareClick(Sender: TObject);
    procedure btV18Click(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure lbBrakRastGetText(Sender: TObject; var Text: String);
    procedure edON_VoenkomChange(Sender: TObject);
    procedure edON_VoenkomEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edON_VoenkomEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edONA_VOENKOMChange(Sender: TObject);
    procedure edON_DATERUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edON_DATEREnter(Sender: TObject);
    procedure edONA_DATEREnter(Sender: TObject);
    procedure edSpecEnter(Sender: TObject);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure edOTMETKADblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N_F_cbRastClick(Sender: TObject);
    procedure rbSmertClick(Sender: TObject);
    procedure rbSudClick(Sender: TObject);
    procedure rbZapClick(Sender: TObject);
    procedure tsRastEnter(Sender: TObject);
    procedure tsSpravEnter(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBEditEh1EditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure Label25Click(Sender: TObject);
    procedure edON_VoenkomEditButtons2Click(Sender: TObject;  var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons2Click(Sender: TObject; var Handled: Boolean);
    procedure rbNedClick(Sender: TObject);
    procedure edDateSVEnter(Sender: TObject);
    procedure edON_GRAGEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure edONA_GRAGEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edON_M_GOSUDUpdateData(Sender: TObject;         var Handled: Boolean);
    procedure edONA_M_GOSUDUpdateData(Sender: TObject;        var Handled: Boolean);
    procedure edON_SOATOClick(Sender: TObject);
    procedure edON_SOATODblClick(Sender: TObject);
    procedure edONA_SOATOClick(Sender: TObject);
    procedure edONA_SOATODblClick(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edRukov_SvEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edONA_FamiliaPUpdateData(Sender: TObject;   var Handled: Boolean);
    procedure BLR_edONA_FamiliaPUpdateData(Sender: TObject;     var Handled: Boolean);
    procedure edSpecEditButtons0Click(Sender: TObject;         var Handled: Boolean);
    procedure TBItemEditMemoClick(Sender: TObject);
    procedure cbOnlyGodON_SvClick(Sender: TObject);
    procedure GridRSGetCellParams(Sender: TObject; Column: TColumnEh;   AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure lbON_REG_DATE_TILLGetText(Sender: TObject; var Text: String);
    procedure lbONA_REG_DATE_TILLGetText(Sender: TObject;    var Text: String);
    procedure N_F_lbON_StatusClick(Sender: TObject);
    procedure N_F_lbON_StatusGetText(Sender: TObject; var Text: String);
    procedure N_F_lbONA_StatusClick(Sender: TObject);
    procedure N_F_lbONA_StatusGetText(Sender: TObject; var Text: String);
    procedure N_F_lbON_SEMGetText(Sender: TObject; var Text: String);
    procedure N_F_lbONA_SEMGetText(Sender: TObject; var Text: String);
    procedure TBItemChNameClick(Sender: TObject);
    procedure dsDetiDataChange(Sender: TObject; Field: TField);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
    function CheckVozrast(strField : String; var strAddText : String) : Integer;
  public
    FOnCheckSOATO:Boolean;
    FOnaCheckSOATO:Boolean;

    TbItemCondIN_ON: TTbItem;
    TbItemCondIN_ONA: TTbItem;
    TBItemDateBrak:TTBItem;
    TbItemVerno: TTbItem;
    function CreateSubMenuRun: Boolean; override;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
    procedure CheckOnlyGod(lSv:Boolean);
    procedure CheckOnlyVozrast(lClear : Boolean);
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure ReadDeti(strDeti : String);
    function EmptyIzm: String; override;

    procedure WriteVOENKOM(nType:Integer);
    procedure CheckBrakRast;
    procedure CheckRnGorod;

    procedure AfterCheckAkt_GISUN(nType:Integer); override;

    function BeforeEdit : Boolean; override;
    function  BeforeReport : Boolean; override;
//    function GetNameReport : String; override;
    procedure UpdateActions; override;
    procedure CheckControls;
    procedure CheckControlRast;
    procedure CheckControlDeti;

    procedure CheckArxText(lON:Boolean);
    procedure CheckSOATOAkt(lOn,lOna:Boolean; lCheckVoenkom:Boolean; strParam:String; nAteID:Integer; strSoato:String);

    function EnableHistoryControl(ActControl:TWinControl):Boolean; override;
    procedure FieldAddHistDop(fld : TField; ActControl:TWinControl); override;

    procedure CheckControlSvid;
    function CheckDokumentSimple(nType:Integer; lWriteDok:Boolean):Boolean; override;
    procedure SetOnlyPovtorSvid(lOnlyPovtor:Boolean;pc:TPageControl; ts:TWinControl; NonVisibleControls : array of TVarRec; lbSvid,lbNomer:TLabel); override;
    function CheckFIO: String; override;
    procedure SetSimpleVvod(sName:String); override;
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;

    procedure Event_DateBrak(Sender:TObject);
    procedure Event_TrueAkt(Sender: TObject);
    procedure Event_CondIN_ON(Sender: TObject);
    procedure Event_CondIN_ONA(Sender: TObject);

    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

function EditZapisBrak( nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;

var
  fmZapisBrak: TfmZapisBrak;

implementation


uses dBase, fMain, fChoiceNasel, fEnterAdresat, fChoiceAkt;

{$R *.DFM}
{$I Task.inc}

{ TfmZapisBrak }

function EditZapisBrak( nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;
var
  obj:TObject;
begin
//  Result := true;
  fmZapisBrak := TfmZapisBrak.Create(nil);
  fmZapisBrak.IsCreateForm:=false;
  fmZapisBrak.TBItemChName.Visible:=false;
  fmZapisBrak.AssignPar(slPar);
//old  obj:=ObjectFromParams(slPar,'DATASET_CHNAME');
  obj:=ObjectFromParams(slPar,'DATASET_DECL_IZM');
  if obj<>nil then begin
    fmZapisBrak.FNewDataSet:=TDataSet(Obj);
//old    fmZapisBrak.FTypeNewDataSet:=_TypeObj_DChName;
    fmZapisBrak.FTypeNewDataSet:=_TypeObj_DIzm;
    fmZapisBrak.TBItemChName.Visible:=true;
  end;
  with fmZapisBrak do begin
    SetOnlyPovtorSvid(lOnlyPovtor, pc, tsSvid, [ N_F_1, N_F_edTypeEkz, N_F_cbPovtor, N_F_cbBelorus ], lbSvid,lbNomer);
    {$IFDEF ZAGS}
    if not lOnlyPovtor then begin
       TBItemSprAkt.Visible:=true;      // доступность получения справки о записи акта
       TBItemDeclSvid.Visible:=true;
     end;
    {$ENDIF}
  end;
  if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
    fmZapisBrak.cbOnlyGodON.Visible:=true;
    fmZapisBrak.cbOnlyGodONA.Visible:=true;
  end else begin
    fmZapisBrak.cbOnlyGodON.Visible:=false;
    fmZapisBrak.cbOnlyGodONA.Visible:=false;
  end;
  try
    fmZapisBrak.IsReadDokument:=true;
    if nID=-1 then begin
      fmZapisBrak.NewDok(true);
      fmZapisBrak.SetIDZags;
      fmZapisBrak.CheckEnabledNameOrgan(true);
    end else begin
      fmZapisBrak.ReadDok( nID );
      fmZapisBrak.TBItemZAGS.Visible:=false;
      fmZapisBrak.CheckEnabledNameOrgan(false);
    end;
    fmZapisBrak.IsReadDokument:=false;
    {$IFDEF GISUN}
      fmZapisBrak.CheckAkt_GISUN(0);
//      Gisun.CheckMarriage(fmZapisBrak);
//      fmZapisBrak.CheckImageGisun(fmZapisBrak.DokumentPOLE_GRN,fmZapisBrak.ImageGISUN);
      fmZapisBrak.BeforeEditFormGISUN;
    {$ENDIF}
    Result := fmZapisBrak.EditModal;
  finally
    fmZapisBrak.Free;
    fmZapisBrak := nil;
  end;
end;

function TfmZapisBrak.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_ZBrak);
end;

function TfmZapisBrak.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentDETIasSTR.AsBoolean:=false;

  DokumentON_VUS.AsBoolean:=true;
  DokumentONA_VUS.AsBoolean:=false;
  DokumentOSNOV.AsBoolean:=true;

  DokumentDECL_ID.AsInteger:=0;   // полный контроль записи акта
  DokumentDECLARE_ID.AsInteger:=0;  // ссылка на заявление о браке
  DokumentON_ONLYGOD.AsBoolean:=false;
  DokumentONA_ONLYGOD.AsBoolean:=false;
  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;

  DokumentON_B_RESP.AsBoolean     := false; // после отправки в ГИС РН корректировались определенные реквизиты
  
  DokumentON_B_OBL.AsBoolean      := true;
  DokumentON_M_B_OBL.AsBoolean    := true;
  DokumentONA_B_OBL.AsBoolean     := true;
  DokumentONA_M_B_OBL.AsBoolean   := true;
  DokumentON_B_GOROD.AsInteger    := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_M_B_GOROD.AsInteger  := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_B_GOROD.AsInteger   := GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_M_B_GOROD.AsInteger := GlobalTask.ParamAsInteger('TYPEPUNKT');

  DokumentFirst_Ekz.AsBoolean:=true;
  DokumentVOSSTAN.AsBoolean:=false;
  DokumentBRAK_RAST.AsBoolean:=false;
  N_F_cbBelorus.Checked:=False;
//  if dmBase.GetNewNomerSvid(dmBase.tbZapisBrak, strNewNomer) then begin
//    DokumentSVID_NOMER.AsString := strNewNomer;
//  end;
  if lAppend then begin
    CheckRnGorod;
  end;
  inherited NewDok( lAppend );

  CheckForAll_Bel(DokumentON_OBL);
  CheckForAll_Bel(DokumentON_RAION);
  CheckForAll_Bel(DokumentONA_OBL);
  CheckForAll_Bel(DokumentONA_RAION);
  if lAppend then begin
    CheckSOATOAkt(true,false,true,'{SS}',0,'');
    DokumentONA_SOATO.AsString:=DokumentON_SOATO.AsString;
  end;

  QueryExit:=false;
  Result := true;
end;
{
procedure TfmZapisBrak.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
procedure TfmZapisBrak.ReadDeti( strDeti : String);
var
  i: Integer;
  arr,arrR: TArrStrings;
//  sl : TStringList;
  s:String;
begin
  tbDeti.EmptyTable;
  if Copy(strDeti,1,1)='#' then begin  // список детей ввиде строки
    EditDataSet(Dokument);
    DokumentDETI.AsString:=Copy(strDeti,2,Length(strDeti));
    DokumentDETIasSTR.AsBoolean:=true;
  end else begin
    StrToArr(strDeti, arr, Chr(13), true);
  //  sl := TStringList.Create;
    for i:=Low(arr) to High(arr) do begin
     // sl.CommaText := arr[i];
      s:=arr[i];
      CharDel(s,'"');
      StrToArr(s, arrR, ',', false);
      SetLength(arrR,4);
      try               
        tbDeti.Append;
        tbDetiFAMILIA.AsString := arrR[0];
        tbDetiNAME.AsString    := arrR[1];
        tbDetiOTCH.AsString    := arrR[2];
        tbDetiGOD_ROG.AsString := arrR[3];

  //    for j:=0 to sl.Count-1 do begin
  //     tbDeti.Fields[j].AsString := sl.Strings[j];
  //    end;
        tbDeti.Post;
      except
        PutError('Ошибка чтения списка детей: "'+s+'"',self);
      end;
    end;
  end;
//  sl.Free;
end;

//-------------------------------------------------------------------------
function TfmZapisBrak.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField,s : String;
begin
  Result := true;
  if not dmBase.tbZapisBrak.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  IsReadDokument := true;
  NewDok(false);

  edON_SOATO.Hint:='';
  edONA_SOATO.Hint:='';

  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbZapisBrak.FieldCount-1 do begin
    strField := dmBase.tbZapisBrak.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.tbZapisBrak.Fields[i]);
    end;
  end;

  SetIDZags;

  ds2xml.StringToXML(dmBase.tbZapisBrak.FieldByName('SUD_BRAK').AsString); // ZAVIT  SUD_BRAK  SUD_NAME
  ds2xml.XMLToData;
  tbReshSud.First;

  ReadDopProperty(dmBase.TypeObj_ZBrak, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));

  DokumentON_M_RNGOROD.AsString  := '';
  DokumentONA_M_RNGOROD.AsString := '';
  if DokumentON_M_B_RN.IsNull then DokumentON_M_B_RN.AsBoolean:=true;
  if not DokumentON_M_B_RN.AsBoolean then begin
    DokumentON_M_RNGOROD.AsString := DokumentON_M_RAION.AsString;
    DokumentON_M_RAION.AsString   := '';
  end;
  if DokumentONA_M_B_RN.IsNull then DokumentONA_M_B_RN.AsBoolean:=true;
  if not DokumentONA_M_B_RN.AsBoolean then begin
    DokumentONA_M_RNGOROD.AsString := DokumentONA_M_RAION.AsString;
    DokumentONA_M_RAION.AsString   := '';
  end;

  CheckCaretDokument(DokumentON_DOK_NOMER,DokumentON_DOKUMENT);
  CheckCaretDokument(DokumentONA_DOK_NOMER,DokumentONA_DOKUMENT);

  if DokumentDECL_ID.IsNUll or (DokumentDECL_ID.AsInteger>1) then DokumentDECL_ID.AsInteger:=0;

  if DokumentON_ONLYGOD.IsNull then DokumentON_ONLYGOD.AsBoolean:=false;
  if DokumentONA_ONLYGOD.IsNull then DokumentONA_ONLYGOD.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentBRAK_RAST.IsNull then DokumentBRAK_RAST.AsBoolean:=false;
  if DokumentOSNOV.IsNull  then DokumentOSNOV.AsBoolean:=false;

  if DokumentON_VUS.IsNull  then DokumentON_VUS.AsBoolean:=true;
  if DokumentONA_VUS.IsNull then DokumentONA_VUS.AsBoolean:=false;

  // потому что при перекачке из Греся записались оба реквизита
  if DokumentON_DateR.AsString<>''  then DokumentON_VOZR.AsString:='';
  if DokumentONA_DateR.AsString<>'' then DokumentONA_VOZR.AsString:='';

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  CheckControlRast;

  Dokument.Post;

  if DokumentDATEB.IsNull then begin
    TbItemDateBrak.Checked:=false;
    edDateBrak.Visible:=false;
    lbDateBrak.Visible:=false;
  end else begin
    TbItemDateBrak.Checked:=true;
    edDateBrak.Visible:=true;
    lbDateBrak.Visible:=true;
  end;

  CheckRnGorod;

  ReadHistory(nID, dmBase.TypeObj_ZBrak);

  ReadDeti(dmBase.tbZapisBrak.FieldByName('DETI').AsString);
  CheckControlDeti;

  edON_GRAG.Hint:=DokumentON_GRAG_ADD.AsString;
  edONA_GRAG.Hint:=DokumentONA_GRAG_ADD.AsString;

  {$IFDEF ZAGS}
  TBItemVozrast.Checked := ((DokumentON_DateR.AsString='') and (DokumentON_VOZR.AsString<>''));
  if TBItemVozrast.Checked then CheckOnlyVozrast(false);
  {$ENDIF}

  TbItemVerno.Checked := DokumentDECL_ID.AsInteger=1;

  i:=CheckVozrast('XXX',s);
  if i>-1 then begin
    btV18.Enabled:=(i=1);
    edPrich18.Enabled:=(i=1);
  end;

  {$IFDEF ZAGS}
    s:=DokumentON_IDENTIF_GIS.AsString;
    TbItemCondIN_ON.Checked:=(s='1');
    CheckImageCondIN_(ENG_edON_IDENTIF, s, ImCondIN_ON);
    s:=DokumentONA_IDENTIF_GIS.AsString;
    TbItemCondIN_ONA.Checked:=(s='1');
    CheckImageCondIN_(ENG_edONA_IDENTIF, s, ImCondIN_ONA);
  {$ELSE}
    ImCondIN_ON.Visible:=false;
    ImCondIN_ONA.Visible:=false;
  {$ENDIF}

  IsReadDokument := false;
  //---------------------------------------
end;

function TfmZapisBrak.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr,s : String;
  lNomerS, lNomerR, lFullWrite:Boolean;   // полная запись актовой записи
  sAdd,sSeria,sNomer,sRukov,sRukovB,sSpec,sSpecB:String;
  dDate:TDateTime;
  strRec, strDeti : String;
  arr:TArrStrings;
  {$IFNDEF ZAGS}
  vKeyValues : Variant;
  dLastSost : TDateTime;
  {$ENDIF}
begin
  Dokument.CheckBrowseMode;
  tbDeti.CheckBrowseMode;
  AdditiveBeforeWriteDok;

  EditDataSet(Dokument);
  sAdd:='';
  //------ если поля с номерами записей не Integer + см. ниже (слишком сложно, но неохота реорганизовывать базу) --------
  if (Length(DokumentS_NOMER.AsString)>9) or not IsAllDigit(DokumentS_NOMER.AsString) then lNomerS:=true else lNomerS:=false;
  if (Length(DokumentR_NOMER.AsString)>9) or not IsAllDigit(DokumentR_NOMER.AsString) then lNomerR:=true else lNomerR:=false;
  if lNomerS then sAdd:=sAdd+'S_NOMER;';
  if lNomerR then sAdd:=sAdd+'R_NOMER;';
  //-------------------------------------------------------
  WriteOtherData(Dokument, 'OTHER', sAdd+'RUKOV_D;SPEC_D;ON_IDENTIF_GIS;ONA_IDENTIF_GIS');
  PostDataSet(Dokument);

  Result:=CheckDokument(0,false,true,true);
  strErr:=FLastError;
  lFullWrite:=true;   // полная запись актовой записи

  sSeria:='';
  sNomer:='';
  sRukov:='';
  sRukovB:='';
  sSpec:='';
  sSpecB:='';
  dDate:=0;

  if (strErr='') then begin
    if FOnlySvid then begin
      if DokumentID.AsInteger=-1 then  begin  // запись не выбирали
        arr:=dmBase.SeekAkt(TypeObj, DokumentID_ZAGS.AsInteger,
                            DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime, false);
        if Length(arr)=0 then begin
//         DokumentID.AsInteger = -1  будем добавлять запсиь в базу
        end else begin
        // SeekAkt уже установил на нужную запись
          EditDataSet(Dokument);
          DokumentID.AsInteger:=FMainTable.FieldByName('ID').AsInteger;
          PostDataSet(Dokument);
        end;
      end;
      if DokumentID.AsInteger>0 then begin  // выбирали по кнопке или нашли актовую запись
        if not FCheckNewNomerAkt then begin
          FAddNewDok:=false;
          lFullWrite:=false;  // будем писать только свидетельство
        end;
        if FMainTable.FieldByName('ID').AsInteger<>DokumentID.AsInteger then begin
          if not FMainTable.Locate('ID', DokumentID.AsInteger, []) then begin
            strErr:='Запись акта не найдена.';
          end;
        end;
        if strErr='' then begin
          // сохраним текущие значения для первичного свидетельства
          sSeria:=FMainTable.FieldByName('SVID_SERIA').AsString;
          sNomer:=FMainTable.FieldByName('SVID_NOMER').AsString;
          dDate:=FMainTable.FieldByName('DATESV').AsDateTime;
          sRukov:=FMainTable.FieldByName('RUKOV').AsString;
          sRukovB:=FMainTable.FieldByName('RUKOV_B').AsString;
          sSpec:=FMainTable.FieldByName('SPEC').AsString;
          sSpecB:=FMainTable.FieldByName('SPEC_B').AsString;
        end;
      end;
    end else begin
      if (strErr='') then begin
         Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZBrak, DokumentID_ZAGS.AsInteger,
                        DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime);
         if not Result then exit;
      end;
    end;
  end;

  if strErr<>'' then begin
    PutError(strErr,self);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbZapisBrak.Append;
    dmBase.tbZapisBrak.Post;
    nID := dmBase.tbZapisBrak.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if dmBase.tbZapisBrak.FieldByName('ID').AsInteger<>nID then begin
      if not dmBase.tbZapisBrak.Locate('ID', nID, []) then begin
        Result := false;
      end;
    end;
    if Result and not lFullWrite and FOnlySvid then begin   // запись нашли и пишем только свидетельство
       with dmBase.tbZapisBrak do begin
         if not MySameText(FieldByName('ON_FAMILIA').AsString,DokumentON_Familia.AsString) or
            not MySameText(FieldByName('ON_NAME').AsString,DokumentON_Name.AsString) or
            not MySameText(FieldByName('ON_OTCH').AsString,DokumentON_Otch.AsString) or
            not MySameText(FieldByName('ON_FAMILIAP').AsString,DokumentON_FAMILIAP.AsString) or
            (FieldByName('ON_DATER').AsVariant<>DokumentON_DateR.AsVariant) then begin
            PutError('ФИО и дата рождения жениха не совпадают с данными из актовой записи.',self);
            Result:=false;
         end;
         if not MySameText(FieldByName('ONA_FAMILIA').AsString,DokumentONA_Familia.AsString) or
            not MySameText(FieldByName('ONA_NAME').AsString,DokumentONA_Name.AsString) or
            not MySameText(FieldByName('ONA_OTCH').AsString,DokumentONA_Otch.AsString) or
            not MySameText(FieldByName('ONA_FAMILIAP').AsString,DokumentONA_FAMILIAP.AsString) or
            (FieldByName('ONA_DATER').AsVariant<>DokumentONA_DateR.AsVariant) then begin
            PutError('ФИО и дата рождения невесты не совпадают с данными из актовой записи.',self);
            Result:=false;
         end;
       end;
    end;
  end;
  if Result then  begin
    FCheckEditGIS:=CheckDateEditGIS;  // функция д.б. своя для каждого типа документа !!!

    EditDataSet(Dokument);
    //----------------------------------
    CheckBrakRast;
    //----------------------------------
    DokumentID.AsInteger := nID;
    Dokument.Post;

//    AddEditSvid(strBookMark);

    dmBase.tbZapisBrak.Edit;

    if lFullWrite then begin
      for i:=1 to dmBase.tbZapisBrak.FieldCount-1 do begin
        strField := dmBase.tbZapisBrak.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          if (fld.FieldName='S_NOMER') or (fld.FieldName='R_NOMER') then begin
            //
          end else begin
            if fld.IsNull or (fld.AsString='')
              then dmBase.tbZapisBrak.Fields[i].AsString := ''
              else dmBase.tbZapisBrak.Fields[i].Value := fld.Value;
          end;
        end;
      end;
      //------ см. выше !!! если поля с номерами записей Integer --------
      with dmBase.tbZapisBrak do begin
        if not lNomerS and (DokumentS_NOMER.AsString<>'')
          then FieldByName('S_NOMER').AsInteger:=StrToInt(DokumentS_NOMER.AsString)
          else FieldByName('S_NOMER').AsString:='';
        if not lNomerR and (DokumentR_NOMER.AsString<>'')
          then FieldByName('R_NOMER').AsInteger:=StrToInt(DokumentR_NOMER.AsString)
          else FieldByName('R_NOMER').AsString:='';
      end;
      //-------------------------------------------------------
      strDeti := '';
      if DokumentDETIasSTR.AsBoolean then begin   // !!!   список детей ввиде строки
        strDeti:='#'+DokumentDETI.AsString;       // !!!
        i:=1;
      end else begin
        tbDeti.First;
        i:=0;
        while not tbDeti.Eof do begin
          s:=ANSIUpperCase(Trim(tbDetiFAMILIA.AsString+tbDetiNAME.AsString+tbDetiOTCH.AsString));
          if (s<>'') then begin
            if (s<>'НЕТ') and (s<>'НЕ ИМЕЮТ') then begin
              Inc(i,1);
            end;
            strRec := '"'+tbDetiFAMILIA.AsString+'",'+
                      '"'+tbDetiNAME.AsString+'",'+
                      '"'+tbDetiOTCH.AsString+'",'+
                      '"'+tbDetiGOD_ROG.AsString+'"'+Chr(13);
            strDeti := strDeti + strRec;
          end;
          tbDeti.Next;
        end;
      end;
      dmBase.tbZapisBrak.FieldByName('DETI').AsString:=strDeti;
      dmBase.tbZapisBrak.FieldByName('DETI_COUNT').AsInteger:=i;
      dmBase.tbZapisBrak.FieldByName('VOSSTAN').AsBoolean:=false;

      dmBase.tbZapisBrak.FieldByName('OSNOV').AsBoolean := DokumentOSNOV.AsBoolean;  // в торжественной обстановке

      if DokumentON_M_RNGOROD.AsString<>'' then begin
        dmBase.tbZapisBrak.FieldByName('ON_M_B_RN').AsBoolean := false;
        dmBase.tbZapisBrak.FieldByName('ON_M_RAION').AsString := DokumentON_M_RNGOROD.AsString;
      end else begin
        dmBase.tbZapisBrak.FieldByName('ON_M_B_RN').AsBoolean := true;
      end;
      if DokumentONA_M_RNGOROD.AsString<>'' then begin
        dmBase.tbZapisBrak.FieldByName('ONA_M_B_RN').AsBoolean := false;
        dmBase.tbZapisBrak.FieldByName('ONA_M_RAION').AsString := DokumentONA_M_RNGOROD.AsString;
      end else begin
        dmBase.tbZapisBrak.FieldByName('ONA_M_B_RN').AsBoolean := true;
      end;

      if not FPrintSpecSvid
        then dmBase.tbZapisBrak.FieldByName('SPEC_B').AsString:='';

//      if FCheckSOATO and not FOnlySvid then begin
//        WriteSoato(dmBase.tbZapisBrak.FieldByName('ON_SOATO'),false);
//        WriteSoato(dmBase.tbZapisBrak.FieldByName('ONA_SOATO'),false);
//      end;

    end;    // <<<< lFullWrite

    WriteDateIzm;
    WriteForAllDok_BeforePost;
    if dmBase.tbZapisBrak.FieldByName('ON_B_RESP').AsBoolean=false
      then dmBase.tbZapisBrak.FieldByName('ON_B_RESP').AsBoolean:=FCheckEditGIS;

    if ds2xml.DataToXML then begin
      dmBase.tbZapisBrak.FieldByName('SUD_BRAK').AsString:=ds2xml.XMLToString;
    end else begin
      PutError(ds2xml.LastError,self);
    end;

    dmBase.tbZapisBrak.Post;

    if lFullWrite then begin
      if FAddNewDok and (DokumentDATEZ.AsDateTime>=dmBase.GetCurDate(true)) then GlobalTask.SetLastValueAsDate('LAST_DATEZ_ZBRAK',DokumentDATEZ.AsDateTime);
      WriteDopProperty(dmBase.TypeObj_ZBrak, DokumentID.AsInteger, STOD('1899-12-30',tdAds));
      WriteHistory(nID, dmBase.TypeObj_ZBrak);
    end;

    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    AdditiveWriteDok;

    if FOnlySvid then begin   // вернем старые данные о первичном свидетельстве, если они были
      FMainTable.Edit;
      FMainTable.FieldByName('SVID_SERIA').AsString:=sSeria;
      FMainTable.FieldByName('SVID_NOMER').AsString:=sNomer;
      FMainTable.FieldByName('RUKOV').AsString:=sRUKOV;
      FMainTable.FieldByName('RUKOV_B').AsString:=sRUKOVB;
      FMainTable.FieldByName('SPEC').AsString:=sSpec;
      FMainTable.FieldByName('SPEC_B').AsString:=sSpecB;
      if dDate=0
        then FMainTable.FieldByName('DATESV').AsString:=''
        else FMainTable.FieldByName('DATESV').AsdateTime:=dDate;
      FMainTable.Post;
    end else begin
      CheckSOATOAkt(FOnCheckSOATO, FOnaCheckSOATO, false, '{SS}', 0, '');
      //------ запись в базу заявлений --------------------------
      if DokumentDECLARE_ID.AsInteger>0 then begin
        if dmBase.tbDeclBrak.FieldByName('ID').AsInteger<>DokumentDECLARE_ID.AsInteger then begin
          dmBase.tbDeclBrak.Locate('ID',DokumentDECLARE_ID.AsInteger,[]);
        end;
        if dmBase.tbDeclBrak.FieldByName('ID').AsInteger=DokumentDECLARE_ID.AsInteger then begin
          try
            dmBase.tbDeclBrak.Edit;
            dmBase.tbDeclBrak.FieldByName('BRAK_ID').AsInteger:=DokumentDECLARE_ID.AsInteger;
            dmBase.tbDeclBrak.FieldByName('OTMETKA_ISP').AsString:=AktToOtm(DokumentNOMER.AsString,DokumentDATEZ.AsDateTime);
            dmBase.tbDeclBrak.Post;
          except
            PutError('Ошибка записи отметки в заявлении.',self);
          end;
        end;
      end;

    end;

    QueryExit:=false;
    Result := true;
    if FCheckBelName and FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentON_FamiliaP.AsString, DokumentON_FamiliaP_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_FamiliaP.AsString, DokumentONA_FamiliaP_B.AsString);

      WriteForAll_Bel;
    end;
  {$IFNDEF ZAGS}
    dLastSost := dmBase.LastDateSost;
    if (dLastSost = dmBase.GetDateCurrentSost) or
       (DokumentDATEZ.AsDateTime >= dLastSost) then begin
      vKeyValues := VarArrayCreate( [0, 1], varOleStr );
      vKeyValues[0] := dmBase.GetDateCurrentSost;
      vKeyValues[1] := 0;
      if DokumentON_ID.AsString<>'' then begin
        // проставим у мужчины семейное положение
        vKeyValues[1] := DokumentON_ID.AsInteger;
        if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
          dmBase.tbMens.Edit;
          dmBase.tbMens.FieldByName('SEM').AsInteger := 1;
          if GlobalTask.ParamAsBoolean('AUTO_FAM_BRAK') then begin
            dmBase.WriteFamiliaHistoty(DokumentON_ID.Asstring,dmBase.tbMens.FieldByName('FAMILIA').AsString,
                  DokumentON_FamiliaP.AsString,DokumentDATEZ.AsDateTime,'');
            dmBase.tbMens.FieldByName('FAMILIA').AsString := DokumentON_FamiliaP.AsString;
          end;
          dmBase.tbMens.Post;
        end;
      end;
      if DokumentONA_ID.AsString<>'' then begin
        // проставим у мужчины семейное положение
        vKeyValues[1] := DokumentONA_ID.AsInteger;
        if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
          dmBase.tbMens.Edit;
          dmBase.tbMens.FieldByName('SEM').AsInteger := 1;
          if GlobalTask.ParamAsBoolean('AUTO_FAM_BRAK') then begin
            dmBase.WriteFamiliaHistoty(DokumentONA_ID.AsString,dmBase.tbMens.FieldByName('FAMILIA').AsString,
                  DokumentONA_FamiliaP.AsString,DokumentDATEZ.AsDateTime,'');
            dmBase.tbMens.FieldByName('FAMILIA').AsString := DokumentONA_FamiliaP.AsString;
          end;
          dmBase.tbMens.Post;
        end;
      end;
    end;
  {$ENDIF}
  end;
  if Result then FlushBuffers;
end;
//-------------------------------------------------------------
procedure TfmZapisBrak.FormResize(Sender: TObject);
begin
//  gbDeti.Width := Self.ClientWidth;
end;
//-------------------------------------------------------------
constructor TfmZapisBrak.Create(Owner: TComponent);
var
  n:Integer;
  aw : TAddControl;
  d2xml:TDataSet2XML;
begin
  inherited;
//  Dokument.Active:=true;
//  tbDeti.Active:=true;
  if not Dokument.Active  then Dokument.Active:=true;
  if not tbDeti.Active    then tbDeti.Active:=true;
  if not tbReshSud.Active then tbReshSud.Active:=true;

  FMainTable := dmBase.tbZapisBrak;

  GridRS.Color:=clInfoBk;

  d2xml:=ds2xml.DS_Add(Dokument,true);
  d2xml.FClearRecord:=false;
  d2xml.FWriteNull:=false;
  d2xml.SetWriteFields('ON_REG_DATE_TILL;ON_REG_DATE;ONA_REG_DATE_TILL;ONA_REG_DATE');
  ds2xml.DS_Add(tbReshSud,false);

//  FCharCase:=1;     // 0-ecNormal, 1-ecUpperCase, 2-ecLowerCase
  FFirstControl:=edNomer;
  FCheckKeyGrid:=true;

  {$IFDEF LAIS}
  edRukov_Sv.EditButtons[0].Visible:=false;
  edRukov.EditButtons[0].Visible:=false;
  edSpec.EditButtons[0].Visible:=false;
  {$ENDIF}

  if FPrintSpecSvid then begin
    edRukov_Sv.DataField:='SPEC';
    BLR_edRukov_Sv_B.DataField:='SPEC_B';
  end;

  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';

  FActiveOn:=false;
  FCheckLookupField:=false;
  FDokZAGS:=true;
  TypeObj:=dmBase.TypeObj_ZBrak;
  FUpdatingObj:=GetUpdatingObj(TypeObj);
  FAutoNum:=IsAutoNumZAGS;

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);


  CreateHistRel(edON_B_OBL, edON_OBL);
  aw:=CreateHistRel(edON_B_OBL, BLR_edON_OBL);
  aw.ValueTrue:='вобласць';
  CreateHistRel(edON_M_B_OBL, edON_M_OBL);

  aw:=CreateHistRel(edON_M_B_GOROD, edON_M_GOROD);
  aw.FirstWord:=true;
  aw:=CreateHistRel(edON_B_GOROD, edON_GOROD);
  aw.FirstWord:=true;
  aw:=CreateHistRel(BLR_edON_B_GOROD, BLR_edON_GOROD);
  aw.FirstWord:=true;

  CreateHistRel(edONA_B_OBL, edONA_OBL);
  aw:=CreateHistRel(edONA_B_OBL, BLR_edONA_OBL);
  aw.ValueTrue:='вобласць';
  CreateHistRel(edONA_M_B_OBL, edONA_M_OBL);

  aw:=CreateHistRel(edONA_M_B_GOROD, edONA_M_GOROD);
  aw.FirstWord:=true;
  aw:=CreateHistRel(edONA_B_GOROD, edONA_GOROD);
  aw.FirstWord:=true;
  aw:=CreateHistRel(BLR_edONA_B_GOROD, BLR_edONA_GOROD);
  aw.FirstWord:=true;

  {$IFDEF ZAGS}
  SetLength(FArrChoiceRekv,22);  // !!!
  {$ELSE}
  SetLength(FArrChoiceRekv,20);  // !!!
  {$ENDIF}
  FArrChoiceRekv[0].nType:=1;
  FArrChoiceRekv[0].FieldName:='ON_DOKUMENT';
  FArrChoiceRekv[1].nType:=1;
  FArrChoiceRekv[1].FieldName:='ONA_DOKUMENT';
  FArrChoiceRekv[2].nType:=2;
  FArrChoiceRekv[2].FieldName:='OTMETKA';
  FArrChoiceRekv[3].nType:=0;
  FArrChoiceRekv[3].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[3].FieldName:='ON_WORK';
  FArrChoiceRekv[4].nType:=0;
  FArrChoiceRekv[4].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[4].FieldName:='ONA_WORK';
  FArrChoiceRekv[5].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[5].FieldName:='ONA_M_GOROD_R';
  FArrChoiceRekv[6].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[6].FieldName:='ON_M_GOROD_R';

  FArrChoiceRekv[7].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[7].FieldName:='IZMEN';

  FArrChoiceRekv[8].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[8].FieldName:='ON_GOSUD';
  FArrChoiceRekv[9].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[9].FieldName:='ONA_GOSUD';
  FArrChoiceRekv[10].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[10].FieldName:='ON_GRAG';
  FArrChoiceRekv[11].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[11].FieldName:='ONA_GRAG';
  FArrChoiceRekv[12].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[12].FieldName:='ON_M_GOSUD';
  FArrChoiceRekv[13].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[13].FieldName:='ONA_M_GOSUD';

  FArrChoiceRekv[14].nType:=0;
  FArrChoiceRekv[14].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[14].FieldName:='S_ZAGS';
  FArrChoiceRekv[14].sPadeg:='П';

  FArrChoiceRekv[15].nType:=0;
  FArrChoiceRekv[15].nTypeSpr:=_SHABLON_ZAGS;
  FArrChoiceRekv[15].FieldName:='R_ZAGS';
  FArrChoiceRekv[15].sPadeg:='П';

  FArrChoiceRekv[16].nType:=SHABLON_SUD;
  FArrChoiceRekv[16].FieldName:='SUDNAME';

  FArrChoiceRekv[17].nType:=SHABLON_ADRESAT;
  FArrChoiceRekv[17].FieldName:='ARX_ADRESAT';

  FArrChoiceRekv[18].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[18].FieldName:='ARX_TEXT';

  FArrChoiceRekv[19].nType:=SHABLON_BANK;
  FArrChoiceRekv[19].FieldName:='POSHLINA';

  {$IFDEF ZAGS}
  FArrChoiceRekv[20].nType:=SHABLON_SVID_Z;
  FArrChoiceRekv[20].FieldName:='ON_SVID';

  FArrChoiceRekv[21].nType:=SHABLON_SVID_Z;
  FArrChoiceRekv[21].FieldName:='ONA_SVID';
  {$ENDIF}

  CheckControlSvid;

//  tsSvid.TabVisible:=GlobalTask.ParamAsBoolean('TS_SVID');
  SetVisibleNomerEkz(pnMain, edDateSv, N_F_1);

  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edONA_IDENTIF);

  dsGragd.DataSet := dmBase.SprGragd;
  edONA_Familia.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;
  FPageControl := pc;
  pc.ActivePageIndex:=0;
  edON_Familia.OnExit := OnDestroyHint;
  edON_FamiliaP.OnExit := OnDestroyHint;
  edON_Name.OnExit := OnDestroyHint;
  edON_Otch.OnExit := OnDestroyHint;
  edONA_Familia.OnExit := OnDestroyHint;
  edONA_FamiliaP.OnExit := OnDestroyHint;
  edONA_Name.OnExit := OnDestroyHint;
  edONA_Otch.OnExit := OnDestroyHint;
  edON_DATER.OnExit  := OnDestroyHint;
  edONA_DATER.OnExit := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;
  edSpec.OnExit   := OnDestroyHint;
  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;
//  fmMain.SetCurrentDokument(Dokument);
  tsSprav.TabVisible := false;
  {$IFDEF ZAGS}
//    TBItemAddSvid.Visible := true;
    edON_Familia.EditButtons.Items[0].Visible:=false;
    edONA_Familia.EditButtons.Items[0].Visible:=false;
//    cbProvDvig.Visible := false;
//    cbProvDvig.Checked := false;
//    gbLich.Visible:=false;
  {$ELSE}
     TBItemArxSpr.Visible:=false;
     TBItemVozrast.Visible:=false;
     N_F_edCopy.Visible     := false;
     N_F_cbPovtor.Visible   := false;
     //------- место регистрации ---------
     Label26.Visible:=false;
     edMestoRegistr.Visible:=false;
     //-----------------------------------
  {$ENDIF}

  edON_FamiliaP.OnKeyPress:=KeyPress_RU;
  BLR_edON_FamiliaP.OnKeyPress:=KeyPress_BLR;

  edONA_FamiliaP.OnKeyPress:=KeyPress_RU;
  BLR_edONA_FamiliaP.OnKeyPress:=KeyPress_BLR;

  SetControlFIOUpdate([
    edON_Familia, edON_FamiliaP, edON_Name, edON_Otch, edON_Familia_Sv, edON_FamiliaP_Sv, edON_Name_Sv, edON_Otch_Sv,
    edONA_Familia, edONA_FamiliaP, edONA_Name, edONA_Otch, edONA_Familia_Sv, edONA_FamiliaP_Sv, edONA_Name_Sv, edONA_Otch_Sv,
    BLR_edONA_Familia, BLR_edONA_FamiliaP, BLR_edONA_Name, BLR_edONA_Otch, BLR_edON_Familia, BLR_edON_FamiliaP,
    BLR_edON_Name, BLR_edON_Otch, BLR_edONA_Familia_B_Sv, BLR_edONA_FamiliaP_B_Sv, BLR_edONA_Name_B_Sv, BLR_edONA_Otch_B_Sv
  ],false);
  edONA_FamiliaP.OnUpdateData:=edONA_FamiliaPUpdateData;  // !!!
  BLR_edONA_FamiliaP.OnUpdateData:=BLR_edONA_FamiliaPUpdateData;  // !!!

  SetControlCityUpdate([
    edON_M_GOROD, edONA_M_GOROD, edON_GOROD, edONA_GOROD, BLR_edON_GOROD, BLR_edONA_GOROD, edON_GOROD_Sv, edONA_GOROD_Sv,
    edON_RAION, edONA_RAION, BLR_edON_RAION, BLR_edONA_RAION, edON_RAION_R_Sv, BLR_edON_RAION_R_B_Sv, edONA_RAION_R_Sv,
    edON_M_RAION, edON_M_RNGOROD, edONA_M_RAION, edONA_M_RNGOROD, edON_M_OBL, edONA_M_OBL,
    BLR_edONA_RAION_R_B_Sv, edON_OBL, edONA_OBL, BLR_edON_OBL, BLR_edONA_OBL, edON_OBL_R_Sv, BLR_edON_OBL_R_B_Sv, edONA_OBL_R_Sv,
    BLR_edONA_OBL_R_B_Sv
  ]);

  n:=15;
  SetLength(FArrAddProperty,n);
  SetAddProperty(0, 'OTHER', '', ftMemo);
  SetAddProperty(1, 'IZMEN', '', ftMemo);
  SetAddProperty(2, 'SUDNAME', '', ftMemo);
  SetAddProperty(3, 'S_ZAGS', '', ftMemo);
  SetAddProperty(4, 'R_ZAGS', '', ftMemo);
  SetAddProperty(5, 'OTM_RAST', '', ftMemo);
  SetAddProperty(6, 'ON_FAM_R', '', ftMemo);    // ОН  фамилия после расторжения брака
  SetAddProperty(7, 'ONA_FAM_R', '', ftMemo);   // ОНА фамилия после расторжения брака

  SetAddProperty(8, 'ON_GRAG_ADD', '', ftMemo);    // ОН  дополлнительно к гражданству
  SetAddProperty(9, 'ONA_GRAG_ADD', '', ftMemo);   // ОНА дополлнительно к гражданству

  SetAddProperty(10, 'SUDNAME_B', '', ftMemo);
  SetAddProperty(11, 'S_ZAGS_B', '', ftMemo);
  SetAddProperty(12, 'R_ZAGS_B', '', ftMemo);

  SetAddProperty(13, 'ON_ATEID', '', ftInteger);
  SetAddProperty(14, 'ONA_ATEID', '', ftInteger);

  {$IFDEF GISUN}
    // типы нас. пунктов в кодах ГИС РН
    {
    SetLength(FArrAddProperty,n+4);
    SetAddProperty(n+0, 'RN_ON_M_B_GOROD', '', ftString);
    SetAddProperty(n+1, 'RN_ON_B_GOROD', '', ftString);
    SetAddProperty(n+2, 'RN_ONA_M_B_GOROD', '', ftString);
    SetAddProperty(n+3, 'RN_ONA_B_GOROD', '', ftString);
    }
  {$ENDIF}

  SetcbBel(N_F_cbBelorus);
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;
  SetLength(FArrCheckBelField,6);
  WriteToArrCheck(0,  1, false, 'ON_OBL'      , 'ON_OBL_B');
  WriteToArrCheck(1,  1, false, 'ONA_OBL'     , 'ONA_OBL_B');
  WriteToArrCheck(2,  2, false, 'ON_RAION'    , 'ON_RAION_B');
  WriteToArrCheck(3,  2, false, 'ONA_RAION'   , 'ONA_RAION_B');
  WriteToArrCheck(4,  3, true, 'ON_GOROD'    , 'ON_GOROD_B');
  WriteToArrCheck(5,  3, true, 'ONA_GOROD'   , 'ONA_GOROD_B');

  SetLength(FArrCheckField,6);
  WriteToArrCheck(0,  1, false, 'ON_M_OBL');
  WriteToArrCheck(1,  1, false, 'ONA_M_OBL');
  WriteToArrCheck(2,  2, false, 'ON_M_RAION');
  WriteToArrCheck(3,  2, false, 'ONA_M_RAION');
  WriteToArrCheck(4,  3, false, 'ON_M_RNGOROD');
  WriteToArrCheck(5,  3, false, 'ONA_M_RNGOROD');

  SetPanelPovtor(tsPovtor, N_F_cbPovtor, nil, nil);

  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := IsActiveGISUN;
    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN;
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
  TBItemHistCorr.Visible:=FUpdatingObj;

  dsMesto.DataSet:=dmBase.SprKomiss;

  //------- пока только для загс -----------
  {$IFDEF ZAGS}
    edON_Name.MRUList.Items:=GetMRUList_NameM(false);
    edON_Name.MRUList.Active:=(edON_Name.MRUList.Items.Count>0);
    edON_Name.MRUList.AutoAdd:=false;
    edON_Name.MRUList.Limit:=500;
    edON_Name_Sv.MRUList.Items:=GetMRUList_NameM(false);
    edON_Name_Sv.MRUList.Active:=(edON_Name_Sv.MRUList.Items.Count>0);
    edON_Name_Sv.MRUList.AutoAdd:=false;
    edON_Name_Sv.MRUList.Limit:=500;
    edON_Otch.MRUList.Items:=GetMRUList_OtchM(false);
    edON_Otch.MRUList.Active:=(edON_Otch.MRUList.Items.Count>0);
    edON_Otch.MRUList.AutoAdd:=false;
    edON_Otch.MRUList.Limit:=500;
    edON_Otch_Sv.MRUList.Items:=GetMRUList_OtchM(false);
    edON_Otch_Sv.MRUList.Active:=(edON_Otch_Sv.MRUList.Items.Count>0);
    edON_Otch_Sv.MRUList.AutoAdd:=false;
    edON_Otch_Sv.MRUList.Limit:=500;

    edONA_Name.MRUList.Items:=GetMRUList_NameG(false);
    edONA_Name.MRUList.Active:=(edONA_Name.MRUList.Items.Count>0);
    edONA_Name.MRUList.AutoAdd:=false;
    edONA_Name.MRUList.Limit:=500;
    edONA_Name_Sv.MRUList.Items:=GetMRUList_NameG(false);
    edONA_Name_Sv.MRUList.Active:=(edONA_Name_Sv.MRUList.Items.Count>0);
    edONA_Name_Sv.MRUList.AutoAdd:=false;
    edONA_Name_Sv.MRUList.Limit:=500;
    edONA_Otch.MRUList.Items:=GetMRUList_OtchG(false);
    edONA_Otch.MRUList.Active:=(edONA_Otch.MRUList.Items.Count>0);
    edONA_Otch.MRUList.AutoAdd:=false;
    edONA_Otch.MRUList.Limit:=500;
    edONA_Otch_Sv.MRUList.Items:=GetMRUList_OtchG(false);
    edONA_Otch_Sv.MRUList.Active:=(edONA_Otch_Sv.MRUList.Items.Count>0);
    edONA_Otch_Sv.MRUList.AutoAdd:=false;
    edONA_Otch_Sv.MRUList.Limit:=500;
  {$ENDIF}
  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbDeti,'Deti','Общие дети');
  {$ENDIF}
  //cbON_VUS.AllowGrayed
  edON_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;  // utypes.pas
  edONA_DOK_TYPE.DropDownBox.Rows:=TYPEDOK_ROWS;  // utypes.pas
  edON_DOK_TYPE.DropDownBox.Width:=TYPEDOK_Width;  // utypes.pas
  edONA_DOK_TYPE.DropDownBox.Width:=TYPEDOK_Width;  // utypes.pas

end;

destructor TfmZapisBrak.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZapisBrak.edON_FamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
{$IFNDEF ZAGS}
var
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  adr : TAdres;
  nID : Integer;
  old : TCursor;
  strName : String;
  p : TPassport;
  lCheck : Boolean;
  pol:TPol;
{$ENDIF}
begin
  if ExitAsGISUN(true) then exit;
{$IFNDEF ZAGS}
  if ChoiceMen( edON_FAMILIA, Trim(edON_FAMILIA.Text), 'POL='+QStr('М')+' .and. (SEM<>1 .or. Empty(SEM))', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      lCheck:=dbDisableControls(Dokument);
      try
        EditDataSet(Dokument);
        v := GetValueField(arrRec, 'ID');
        DokumentON_ID.AsInteger := v;

        // место рождения
        if dmBase.tbMensAdd.Locate('ID',v,[]) then begin
          WriteField( DokumentON_GOSUD, dmBase.tbMensAdd.FieldByName('MR_GOSUD') );
          WriteField( DokumentON_B_OBL, dmBase.tbMensAdd.FieldByName('MR_B_OBL') );
          WriteField( DokumentON_OBL, dmBase.tbMensAdd.FieldByName('MR_OBL') );
          DokumentON_OBL_B.AsString:='';
          WriteField( DokumentON_RAION, dmBase.tbMensAdd.FieldByName('MR_RAION') );
          DokumentON_RAION_B.AsString:='';
          WriteField( DokumentON_B_GOROD, dmBase.tbMensAdd.FieldByName('MR_B_GOROD') );
          WriteField( DokumentON_GOROD, dmBase.tbMensAdd.FieldByName('MR_GOROD') );
          DokumentON_GOROD_B.AsString:='';
          if not dmBase.tbMensAdd.FieldByName('OP_DATE').IsNull
            then DokumentON_GODPR.AsString:=IntToStr(YearOf(dmBase.tbMensAdd.FieldByName('OP_DATE').AsDateTime));
        end;

        DokumentON_FAMILIA.AsString:=GetValueFieldEx(arrRec, 'FAMILIA','');
        DokumentON_FAMILIAP.AsString:=DokumentON_FAMILIA.AsString;
        DokumentON_NAME.AsString:=GetValueFieldEx(arrRec, 'NAME','');
        DokumentON_OTCH.AsString:=GetValueFieldEx(arrRec, 'OTCH','');
        Pol:=tpM;
        DokumentON_Name_B.AsString:=dmBase.CheckNameBel(Pol, DokumentON_Name.Value);
        DokumentON_Otch_B.AsString:=dmBase.CheckOtchBel(Pol, DokumentON_Otch.AsString);
        DokumentON_Familia_B.AsString:=dmBase.GetBelFamily(DokumentON_Familia.AsString);
        DokumentON_FamiliaP_B.AsString:=DokumentON_Familia_B.AsString;

        v := GetValueField(arrRec, 'DATER');
        if v = null then DokumentON_DateR.AsString := ''
                    else DokumentON_DateR.Value    := v;
        v := GetValueField(arrRec, 'NATION');
        if v = null then DokumentON_NATION.AsInteger:= 0
                    else DokumentON_NATION.Value    := v;
        v := GetValueField(arrRec, 'CITIZEN');
        if v = null then DokumentON_GRAG.AsInteger:= 0
                    else DokumentON_GRAG.Value    := v;
        v := GetValueField(arrRec, 'OBRAZ');
        if v = null then DokumentON_OBRAZ.AsString := ''
                    else DokumentON_OBRAZ.Value    := v;
        s := dmBase.GetWork(DokumentON_ID.AsInteger, arrRec);
        if s <> '' then s:=s+', ';
        nID := DokumentON_ID.AsInteger;
        DokumentON_WORK.AsString := s + dmBase.GetDolg(nID, arrRec);
        p := dmBase.GetRecPasport(nID, arrRec);
        DokumentON_IDENTIF.AsString   := CheckRus2(p.LichNomer);
        if p.Nomer <> '' then begin
          DokumentON_DOK_TYPE.AsInteger := p.UdostKod;
          DokumentON_DOK_SERIA.AsString := p.Seria;
          DokumentON_DOK_NOMER.AsString := p.Nomer;
          DokumentON_DOKUMENT.AsString  := p.Organ;
          DokumentON_DOK_DATE.AsDateTime:= p.Date;
        end;
        adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
        if adr.PunktN <> '' then DokumentON_M_GOROD.AsString := adr.PunktN;
        if adr.PunktTK>0 then DokumentON_M_B_GOROD.AsInteger:= adr.PunktTK;
//        if adr.UlicaDom <> '' then DokumentON_M_GOROD_R.AsString := adr.UlicaDom;
        if adr.Ulica<>'' then DokumentON_M_GOROD_R.AsString := adr.Ulica;
        if adr.NDom<>'' then DokumentON_M_DOM.AsString := adr.NDom;
        if adr.Korp<>'' then DokumentON_M_KORP.AsString := adr.Korp;
        if adr.Kv<>'' then DokumentON_M_KV.AsString := adr.Kv;
        DokumentOTMETKA.AsString := DokumentOTMETKA.AsString+#13+dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'OTM_NATION', ftMemo);
        CheckControls;
        PostDataSet(Dokument);
      finally
        dbEnableControls(Dokument,lCheck);
        Screen.Cursor := old;
      end;
  end;
{$ENDIF}
end;

procedure TfmZapisBrak.edONA_FamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
{$IFNDEF ZAGS}
var
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  adr : TAdres;
  nID : Integer;
  old : TCursor;
  strName : String;
  p : TPassport;
  lCheck : Boolean;
  pol:TPol;
{$ENDIF}
begin
  if ExitAsGISUN(true) then exit;
{$IFNDEF ZAGS}
  if ChoiceMen( edONA_FAMILIA, Trim(edONA_FAMILIA.Text), 'POL='+QStr('Ж')+' .and. (SEM<>1 .or. Empty(SEM))', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      lCheck:=dbDisableControls(Dokument);
      try
        EditDataSet(Dokument);
        v := GetValueField(arrRec, 'ID');
        DokumentONA_ID.AsInteger := v;

        // место рождения
        if dmBase.tbMensAdd.Locate('ID',v,[]) then begin
          WriteField( DokumentONA_GOSUD, dmBase.tbMensAdd.FieldByName('MR_GOSUD') );
          WriteField( DokumentONA_B_OBL, dmBase.tbMensAdd.FieldByName('MR_B_OBL') );
          WriteField( DokumentONA_OBL, dmBase.tbMensAdd.FieldByName('MR_OBL') );
          DokumentONA_OBL_B.AsString:='';
          WriteField( DokumentONA_RAION, dmBase.tbMensAdd.FieldByName('MR_RAION') );
          DokumentONA_RAION_B.AsString:='';
          WriteField( DokumentONA_B_GOROD, dmBase.tbMensAdd.FieldByName('MR_B_GOROD') );
          WriteField( DokumentONA_GOROD, dmBase.tbMensAdd.FieldByName('MR_GOROD') );
          DokumentONA_GOROD_B.AsString:='';
          if not dmBase.tbMensAdd.FieldByName('OP_DATE').IsNull
            then DokumentONA_GODPR.AsString:=IntToStr(YearOf(dmBase.tbMensAdd.FieldByName('OP_DATE').AsDateTime));
        end;

  // неправильное добавление окончания  DokumentONA_FAMILIAP.AsString := DokumentON_FAMILIA.AsString;
        DokumentONA_FAMILIA.AsString:=GetValueFieldEx(arrRec, 'FAMILIA','');
        DokumentONA_NAME.AsString:=GetValueFieldEx(arrRec, 'NAME','');
        DokumentONA_OTCH.AsString:=GetValueFieldEx(arrRec, 'OTCH','');
        Pol:=tpG;
        DokumentONA_Name_B.AsString:=dmBase.CheckNameBel(Pol, DokumentONA_Name.Value);
        DokumentONA_Otch_B.AsString:=dmBase.CheckOtchBel(Pol, DokumentONA_Otch.AsString);
        DokumentONA_Familia_B.AsString:=dmBase.GetBelFamily(DokumentONA_Familia.AsString);

        v := GetValueField(arrRec, 'DATER');
        if v = null then DokumentONA_DateR.AsString := ''
                    else DokumentONA_DateR.Value    := v;
        v := GetValueField(arrRec, 'NATION');
        if v = null then DokumentONA_NATION.AsInteger := 0
                    else DokumentONA_NATION.Value    := v;
        v := GetValueField(arrRec, 'CITIZEN');
        if v = null then DokumentONA_GRAG.AsString := ''
                    else DokumentONA_GRAG.Value    := v;
        v := GetValueField(arrRec, 'OBRAZ');
        if v = null then DokumentONA_OBRAZ.AsString := ''
                    else DokumentONA_OBRAZ.Value    := v;
        s := dmBase.GetWork(DokumentONA_ID.AsInteger, arrRec);
        if s <> '' then s:=s+', ';
        nID := DokumentONA_ID.AsInteger;
        DokumentONA_WORK.AsString := s + dmBase.GetDolg(nID, arrRec);
        p := dmBase.GetRecPasport(nID, arrRec);
        DokumentONA_IDENTIF.AsString   := CheckRus2(p.LichNomer);
        if p.Nomer <> '' then begin
          DokumentONA_DOK_TYPE.AsInteger := p.UdostKod;
          DokumentONA_DOK_SERIA.AsString := p.Seria;
          DokumentONA_DOK_NOMER.AsString := p.Nomer;
          DokumentONA_DOKUMENT.AsString  := p.Organ;
          DokumentONA_DOK_DATE.AsDateTime:= p.Date;
        end;
        adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
        if adr.PunktN <> '' then DokumentONA_M_GOROD.AsString := adr.PunktN;
        if adr.PunktTK>0 then DokumentONA_M_B_GOROD.AsInteger:= adr.PunktTK;
//        if adr.UlicaDom <> '' then DokumentONA_M_GOROD_R.AsString := adr.UlicaDom;
        if adr.Ulica<>'' then DokumentONA_M_GOROD_R.AsString := adr.Ulica;
        if adr.NDom<>'' then DokumentONA_M_DOM.AsString := adr.NDom;
        if adr.Korp<>'' then DokumentONA_M_KORP.AsString := adr.Korp;
        if adr.Kv<>'' then DokumentONA_M_KV.AsString := adr.Kv;
        DokumentOTMETKA.AsString := DokumentOTMETKA.AsString+#13+dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'OTM_NATION', ftMemo);
        CheckControls;
        PostDataSet(Dokument);
      finally
        dbEnableControls(Dokument,lCheck);
        Screen.Cursor := old;
      end;
  end;
{$ENDIF}
end;

procedure TfmZapisBrak.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;
    edRukov.DataField       := 'RUKOV_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
    edZAGS.DataField := 'NAME_ZAGS_B';
    edS_ZAGS.DataField:='S_ZAGS_B';
    edR_ZAGS.DataField:='R_ZAGS_B';
    edSudName.DataField:='SUDNAME_B';
  end else begin
    ActivateRUSKeyboard;
    edRukov.DataField := 'RUKOV';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
    edZAGS.DataField := 'NAME_ZAGS';
    edS_ZAGS.DataField:='S_ZAGS';
    edR_ZAGS.DataField:='R_ZAGS';
    edSudName.DataField:='SUDNAME';
  end;
end;

procedure TfmZapisBrak.OnDestroyHint(Sender : TObject);
begin
  DestroyHint(H);
end;

procedure TfmZapisBrak.edON_FamiliaEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edON_Familia,DokumentON_Familia.AsString+' ');
end;

procedure TfmZapisBrak.edON_FamiliaPEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CreateHint(H,edON_FamiliaP,DokumentON_FamiliaP.AsString+' ');
    if edON_Familia.Text<>'' then edON_FamiliaP.Text:=edON_Familia.Text;
  end;
end;

procedure TfmZapisBrak.edON_OTCHEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edON_OTCH,DokumentON_OTCH.AsString+' ');
end;

procedure TfmZapisBrak.edON_NameEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edON_Name,DokumentON_Name.AsString+' ');
end;

procedure TfmZapisBrak.edONA_FamiliaEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CreateHint(H,edONA_Familia,DokumentONA_Familia.AsString+' ');
  end;
end;

procedure TfmZapisBrak.edONA_FamiliaPEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CreateHint(H,edONA_FamiliaP,DokumentONA_FamiliaP.AsString+' ');
    if (edON_FamiliaP.Text<>'') and  (edONA_FamiliaP.Text='') then begin
      if DokumentONA_Familia.AsString <> DokumentONA_FamiliaP.AsString then begin
        edONA_FamiliaP.Text:=edON_FamiliaP.Text;
      end;
    end;
  end;
end;

procedure TfmZapisBrak.edONA_NameEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edONA_NAME,DokumentONA_NAME.AsString+' ');
end;

procedure TfmZapisBrak.edONA_OTCHEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edONA_OTCH,DokumentONA_OTCH.AsString+' ');
end;

procedure TfmZapisBrak.edON_FamiliaCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmZapisBrak.btV18Click(Sender: TObject);
var
  s : String;
begin
  if CheckVozrast('XXX', s) > -1 then begin
    if edOTMETKA.Text='' then edOTMETKA.Text:=s else edOTMETKA.Text:=s+Chr(13)+Chr(10)+edOTMETKA.Text;
    ActiveControl:=edOTMETKA;
  end;
end;

function TfmZapisBrak.CheckVozrast(strField : String; var strAddText : String) : integer;
var
  fldDateB : TField;
  nYear,nMonth,nDay : Integer;
  s1,s2 : String;
begin
  strAddText:='';
  s1:='';
  s2:='';
  Result:=-1;
  if (strField='XXX') or (strField='DATESV') or
     (strField='ON_DATER') or (strField='ONA_DATER') or (strField='DATEB') then begin
    Result:=0;
    if DokumentDATEB.IsNull then fldDateB:=DokumentDATEZ else fldDateB:=DokumentDATEB;
    if not fldDateB.IsNull then begin
      if not DokumentON_DateR.IsNull then begin
         if SubDateEx(18,fldDateB.AsDateTime,DokumentON_DateR.AsDateTime,nYear,nMonth,nDay) then begin
           Result:=1;
           s1:='Брачный возраст жениха снижен на '+SubDatePropisEx(18,fldDateB.AsDateTime,DokumentON_DateR.AsDateTime,0)+'.';
         end;
      end;
      if not DokumentONA_DateR.IsNull then begin
         if SubDateEx(18,fldDateB.AsDateTime,DokumentONA_DateR.AsDateTime,nYear,nMonth,nDay) then begin
           Result:=1;
           s2:='Брачный возраст невесты снижен на '+SubDatePropisEx(18,fldDateB.AsDateTime,DokumentONA_DateR.AsDateTime,0)+'.';
         end;
      end;
      if s1<>'' then strAddText:=s1;
      if s2<>'' then
        if strAddText='' then strAddText:='#'+s2 else strAddText:=strAddText+Chr(13)+Chr(10)+'#'+s2;
    end;
  end;
end;

//--------------------------------------------------------
procedure TfmZapisBrak.CheckControls;
var
  i:Integer;
  s:String;
begin
  i:=CheckVozrast('XXX',s);
  if i>-1 then begin
    btV18.Enabled:=(i=1);
    edPrich18.Enabled:=(i=1);
  end;
  CheckValueDateZAGS(DokumentON_DateR.Value, edON_DATER, 12);
  CheckValueDateZAGS(DokumentONA_DateR.Value, edONA_DATER, 12);
end;

//--------------------------------------------------------
procedure TfmZapisBrak.dsDokumentDataChange(Sender: TObject; Field: TField);
var
  strField,s : String;
  Pol : TPol;
  i : Integer;
begin
  if (Field<>nil) and not FRun and not IsReadDokument  then begin
    FRun := true;
    strField := UpperCase(Field.FieldName);
    i:=CheckVozrast(strField,s);
    if i>-1 then begin
      btV18.Enabled:=(i=1);
      edPrich18.Enabled:=(i=1);
    end;
    if FCheckBelName then begin
      EditDataSet(Dokument);
      if strField='ON_NAME' then begin
        Pol := tpM;
//        if DokumentON_Name_B.AsString='' then begin
          DokumentON_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
//        end;
      end else if strField='ON_OTCH' then begin
        Pol := tpM;
//        if DokumentON_Otch_B.AsString='' then begin
          DokumentON_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
//        end;
      end else if strField='ON_FAMILIA' then begin

        if (DokumentON_FamiliaP.AsString='')  then DokumentON_FamiliaP.AsString:=DokumentON_Familia.AsString;
        if (DokumentONA_FamiliaP.AsString='') then DokumentONA_FamiliaP.AsString:=DokumentON_Familia.AsString;

//        if DokumentON_Familia_B.AsString='' then begin
          DokumentON_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
          if DokumentON_Familia.AsString=DokumentON_FamiliaP.AsString then begin
            DokumentON_FamiliaP_B.AsString := DokumentON_Familia_B.AsString;
//          end;
          end;            
//        if DokumentONA_Familia_B.AsString='' then begin
//          DokumentONA_Familia_B.AsString := DokumentON_Familia_B.AsString;
//        end;
      end else if strField='ONA_FAMILIA' then begin
//        if DokumentONA_Familia_B.AsString='' then begin
          DokumentONA_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
//        end;
      end else if strField='ON_FAMILIAP' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentON_Familia.AsString)) and (DokumentON_Familia_B.AsString<>'')
            then DokumentON_FamiliaP_B.AsString := DokumentON_Familia_B.AsString
            else DokumentON_FamiliaP_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end else if strField='ONA_FAMILIAP' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentONA_Familia.AsString)) and (DokumentONA_Familia_B.AsString<>'')
            then DokumentONA_FamiliaP_B.AsString := DokumentONA_Familia_B.AsString
            else DokumentONA_FamiliaP_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end;
      CheckForAll_Bel(Field);
      if strField='ONA_NAME' then begin
        Pol := tpG;
//        if DokumentONA_Name_B.AsString='' then begin
          DokumentONA_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
//        end;
      end else if strField='ONA_OTCH' then begin
        Pol := tpG;
//        if DokumentONA_Otch_B.AsString='' then begin
          DokumentONA_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
//        end;
      end else if (strField='ON_M_GOROD') or (strField='ON_M_RNGOROD') then begin
        if (strField='ON_M_RNGOROD') and (Field.AsString<>'')
          then DokumentON_M_RAION.AsString:='';
        {$IFDEF LAIS}
          CheckSOATOAkt(true,false,true,'{SS}',0,'');
        {$ELSE}
          CheckSOATOAkt(true,false,true,'{CHOICE}',0,'');
        {$ENDIF}
      end else if (strField='ONA_M_GOROD') or (strField='ONA_M_RNGOROD') then begin
        if (strField='ONA_M_RNGOROD') and (Field.AsString<>'')
          then DokumentONA_M_RAION.AsString:='';
        {$IFDEF LAIS}
          CheckSOATOAkt(false,true,true,'{SS}',0,'');
        {$ELSE}
          CheckSOATOAkt(false,true,true,'{CHOICE}',0,'');
        {$ENDIF}
      end else if (strField='ON_M_RAION') then begin
        if (Field.AsString<>'')
          then DokumentON_M_RNGOROD.AsString:='';
      end else if (strField='ONA_M_RAION') then begin
        if (Field.AsString<>'')
          then DokumentONA_M_RNGOROD.AsString:='';
      end else if strField='MESTO' then begin
        if (DokumentTARIF.AsString='') and (DokumentMESTO.AsString<>'') then begin
          if dmBase.SprKomiss.Locate('ID', DokumentMESTO.AsString, []) then begin
            if dmBase.SprKomiss.FieldByName('TARIF').AsString<>'' then begin
              DokumentTARIF.AsFloat:=dmBase.SprKomiss.FieldByName('TARIF').AsFloat;
            end;
          end;
        end;
      end;
    end;
    CheckSOATOAkt(FOnCheckSOATO,FOnaCheckSOATO,true,'{SS}',0,'');
    FRun := false;
    inherited;
  end;
//  showmessage(IntToStr(n2-n1)+'  '+IntToStr(n3-n2)+'  '+IntToStr(n4-n3));
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.edRukovEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.CheckOnlyVozrast(lClear : Boolean);
begin
  if TBItemVozrast.Checked then begin
    lbDateR_Rodit.Caption := '5. Возраст';
    edON_VOZR.Left      := edON_DATER.Left;
    edONA_VOZR.Left     := edONA_DATER.Left;
    cbOnlyGodON.Visible := false;
    cbOnlyGodONA.Visible:= false;
    edON_DATER.Visible  := false;
    edONA_DATER.Visible := false;
    edON_VOZR.Visible   := true;
    edONA_VOZR.Visible  := true;
    if lClear then begin
      edON_DATER.Value  := null;
      edONA_DATER.Value := null;
    end;
    if tsSvid.Visible=true then begin
      edON_VOZR_Sv.Left      := edON_DATER_SV.Left;
      edONA_VOZR_Sv.Left     := edONA_DATER_SV.Left;
      cbOnlyGodON_Sv.Visible := false;
      cbOnlyGodONA_Sv.Visible:= false;
      edON_DATER_SV.Visible  := false;
      edONA_DATER_SV.Visible := false;
      edON_VOZR_Sv.Visible   := true;
      edONA_VOZR_Sv.Visible  := true;
      if lClear then begin
        edON_DATER_Sv.Value  := null;
        edONA_DATER_Sv.Value := null;
      end;
    end;
  end else begin
    lbDateR_Rodit.Caption := '5. Дата рождения';
    edON_DATER.Visible  := true;
    edONA_DATER.Visible := true;
    cbOnlyGodON.Visible := true;
    cbOnlyGodONA.Visible:= true;
    edON_VOZR.Visible   := false;
    edONA_VOZR.Visible  := false;
    if lClear then begin
      edON_VOZR.Value   := null;
      edONA_VOZR.Value  := null;
    end;

    if tsSvid.Visible=true then begin
      edON_DATER_SV.Visible  := true;
      edONA_DATER_SV.Visible := true;
      cbOnlyGodON_SV.Visible := true;
      cbOnlyGodONA_SV.Visible:= true;
      edON_VOZR_SV.Visible   := false;
      edONA_VOZR_SV.Visible  := false;
      if lClear then begin
        edON_VOZR_SV.Value   := null;
        edONA_VOZR_SV.Value  := null;
      end;
    end;

  end;
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.CheckOnlyGod(lSv:Boolean);
var
  cb:TDbCheckBoxEh;
begin
  if lSv then cb:=cbOnlyGodON_Sv else cb:=cbOnlyGodON;
  if cb.Checked then begin
    edON_DATER.EditButton.Visible:=false;
    edON_DATER.EditFormat:='YYYY';
    edON_DATER_SV.EditButton.Visible:=false;
    edON_DATER_SV.EditFormat:='YYYY';
  end else begin
    edON_DATER.EditButton.Visible:=true;
    edON_DATER.EditFormat:='DD.MM.YYYY';
    edON_DATER_SV.EditButton.Visible:=true;
    edON_DATER_SV.EditFormat:='DD.MM.YYYY';
  end;
  if lSv then cb:=cbOnlyGodONA_Sv else cb:=cbOnlyGodONA;
  if cb.Checked then begin
    edONA_DATER.EditButton.Visible:=false;
    edONA_DATER.EditFormat:='YYYY';
    edONA_DATER_SV.EditButton.Visible:=false;
    edONA_DATER_SV.EditFormat:='YYYY';
  end else begin
    edONA_DATER.EditButton.Visible:=true;
    edONA_DATER.EditFormat:='DD.MM.YYYY';
    edONA_DATER_SV.EditButton.Visible:=true;
    edONA_DATER_SV.EditFormat:='DD.MM.YYYY';
  end;
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.cbOnlyGodONClick(Sender: TObject);
begin
  CheckOnlyGod(false);
end;
procedure TfmZapisBrak.cbOnlyGodON_SvClick(Sender: TObject);
begin
  CheckOnlyGod(true);
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.btRazdelClick(Sender: TObject);
begin
  edOTMETKA.AutoSelect:=false;
  edOTMETKA.Value := edOTMETKA.Value + '#';
  ActiveControl := edOTMETKA;
  edOTMETKA.SelStart := Length(edOTMETKA.Value);
  edOTMETKA.SelLength:= 1;
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.TBItemArxSprClick(Sender: TObject);
begin
  if ANSIUpperCase(Copy(ActiveControl.Name,1,5))='EDON_' then begin
//    FActiveON:=true;
  end else begin
//    FActiveON:=false;
  end;
  tsSprav.TabVisible := TBItemArxSpr.Checked;
  if tsSprav.TabVisible then begin
    CheckArxText(FActiveON);
    pc.ActivePage:=tsSprav;
  end;
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.CheckArxText(lON:Boolean);
var
  s1,s2 : string;
  nD:Integer;
begin
  if not IsReadDokument then begin
    Dokument.CheckBrowseMode;
    nD:=6;
    s1:=GetPadegFIO3(DokumentON_FamiliaP.Asstring,DokumentON_Name.Asstring,DokumentON_Otch.Asstring,'м','Т');
    s2:=GetPadegFIO3(DokumentONA_FamiliaP.Asstring,DokumentONA_Name.Asstring,DokumentONA_Otch.Asstring,'ж','Т');
    if N_F_cbRast.Checked then begin
      if DokumentTYPE_RAST.AsInteger=2 then begin   // на основании решения суда
        edAddTextArx.Text := ' Брак между ' +s1+' и '+s2+ ' расторгнут на основании решения суда '+DokumentSUDNAME.AsString+
        ' от '+DatePropis(DokumentSUDRESH.AsDateTime,nD)+', вступившего в законную силу '+DatePropis(DokumentSUDSILA.AsDateTime,nD);
        edNomerArxSpr.Text := '';
      end else if DokumentTYPE_RAST.AsInteger=4 then begin   // признан недействительным
        edAddTextArx.Text := ' Брак между ' +s1+' и '+s2+ ' признан недействительным на основании решения суда '+DokumentSUDNAME.AsString+
        ' от '+DatePropis(DokumentSUDRESH.AsDateTime,nD)+', вступившего в законную силу '+DatePropis(DokumentSUDSILA.AsDateTime,nD);
        edNomerArxSpr.Text := '';
      end else if DokumentTYPE_RAST.AsInteger=3 then begin   // на основании записи акта о раст. брака
        edAddTextArx.Text := ' Брак между ' +s1+' и '+s2+ ' расторгнут на основании записи акта о расторжении брака № '+DokumentR_NOMER.AsString+
        ' от '+DatePropis(DokumentR_DATE.AsDateTime,nD)+' совершенной в '+DokumentR_ZAGS.AsString;
        edNomerArxSpr.Text := '';
      end else if DokumentTYPE_RAST.AsInteger=1 then begin   // прекращен в связи со смертью супруга
        edAddTextArx.Text := ' Брак между ' +s1+' и '+s2+ ' прекращен в связи со смертью супруга, '+
        'запись акта о смерти № '+DokumentS_NOMER.AsString+' от '+DatePropis(DokumentS_DATE.AsDateTime,nD)+' совершена в '+DokumentS_ZAGS.AsString;
        edNomerArxSpr.Text := '';
      end;
    end else begin  // для постановки на учет нужд. в жилье
      if (DokumentON_SEM.AsString='2') and (DokumentONA_SEM.AsString='2') then begin
        edAddTextArx.Text := '   В записи акта о заключении брака супруги значатся как вступившие в брак впервые.'+Chr(13)+Chr(10)+
        '  Справка выдана для постановки на учет граждан, нуждающихся в улучшении жилищных условий.';
      end;
    end;
    if (DokumentIZMEN.AsString='')
      then edAddTextArx.Text := edAddTextArx.Text + Chr(13)+Chr(10)+'   Изменения, исправления, дополнения в запись акта о заключении брака не вносились.'
      else edAddTextArx.Text := edAddTextArx.Text + Chr(13)+Chr(10)+'   '+DokumentIZMEN.AsString;
    if lON then begin
      edAdresat.Text := edON_FamiliaP.Text+' '+edON_Name.Text+' '+edON_Otch.Text+Chr(13)+Chr(10)+
      dmBase.GetAdresAkt2('fmZapisBrak.Dokument', ';ON_M_OBL,ON_M_B_OBL;ON_M_RAION;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R',3);
//      dmBase.GetAdresAkt('fmZapisBrak.Dokument', ';;;ON_M_GOROD;ON_M_GOROD_R',1)+Chr(13)+Chr(10)+
//      dmBase.GetAdresAkt('fmZapisBrak.Dokument', ';ON_M_OBL,ON_M_B_OBL;ON_M_RAION;;',1);
    end else begin
      edAdresat.Text := edONA_FamiliaP.Text+' '+edONA_Name.Text+' '+edONA_Otch.Text+Chr(13)+Chr(10)+
      dmBase.GetAdresAkt2('fmZapisBrak.Dokument', ';ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R',3);
//      dmBase.GetAdresAkt('fmZapisBrak.Dokument', ';;;ONA_M_GOROD;ONA_M_GOROD_R',1)+Chr(13)+Chr(10)+
//      dmBase.GetAdresAkt('fmZapisBrak.Dokument', ';ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION;;',1);
    end;
  end;
end;

//--------------------------------------------------------------------------------
procedure TfmZapisBrak.Button3Click(Sender: TObject);
begin
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  AddSvid;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.UpdateActions;
begin
  inherited;
  {$IFDEF ZAGS}
    TBItemDolg.Enabled := N_F_edCopy.Checked;
  {$ENDIF}
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.TBItemVozrastClick(Sender: TObject);
begin CheckOnlyVozrast(true); end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.edON_OBL_RNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin CheckListObl(Sender,NewText,RecheckInList); end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.edON_RAION_RNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin  CheckListRaion(Sender,NewText,RecheckInList); end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.edON_M_RNGORODNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin CheckListRnGor(Sender,NewText,RecheckInList); end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.CheckRnGorod;
//var
//  nW,nL,nT, nW1 : Integer;
begin
{
  if EnabledRnGorod or
     (not DokumentON_M_B_RN.IsNull and not DokumentON_M_B_RN.AsBoolean) then begin
    if not edON_M_RNGOROD.Visible then begin
      nW  := edON_M_GOROD_R.Width;
      nL  := edON_M_RAION.Left;
      nT  := edON_M_GOROD_R.Top;
      nW1 := edON_M_RNGOROD.Width;
      edON_M_RNGOROD.Left  := nL;
      edON_M_RNGOROD.Top   := nT;
      edON_M_GOROD_R.Width := nW - nW1 - 5;
      edON_M_GOROD_R.Left  := nL + nW1 + 5;
      edON_M_RNGOROD.Visible := true;
    end;
  end else begin
    edON_M_RNGOROD.Visible := false;
    edON_M_GOROD_R.Width := edON_M_RAION.Width;
  end;

  if EnabledRnGorod or
     (not DokumentONA_M_B_RN.IsNull and not DokumentONA_M_B_RN.AsBoolean) then begin
    nW  := edONA_M_GOROD_R.Width;
    nL  := edONA_M_RAION.Left;
    nT  := edONA_M_GOROD_R.Top;
    nW1 := edONA_M_RNGOROD.Width;
    edONA_M_RNGOROD.Left  := nL;
    edONA_M_RNGOROD.Top   := nT;
    edONA_M_GOROD_R.Width := nW - nW1 - 5;
    edONA_M_GOROD_R.Left  := nL + nW1 + 5;
    edONA_M_RNGOROD.Visible := true;
  end else begin
    edONA_M_RNGOROD.Visible := false;
    edONA_M_GOROD_R.Width := edONA_M_RAION.Width;
  end;
}
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.TBItemChoiceDeclareClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  sON,sONA,s : String;
  old : TCursor;
  lCheck:Boolean;
  nSum:Extended;
  ParamFlt:TParamFieldFlt;
//  nIDDecl:Integer;
begin
//  if ExitAsGISUN(true) then exit;
  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_DECL_BRAK');
  if Opis<>nil then begin

    ParamFlt:=CreateParamFlt(edON_Familia.Text,'ON_FAMILIA');
    if ParamFlt<>nil then Opis.AutoFilter:=true;
    Opis.DataSet.Filter := 'otkaz=false or empty(otkaz)';
    Opis.DataSet.Filtered := true;

//    if edON_Familia.Text<>'' then begin
//      Opis.DataSet.Filter := 'ON_FAMILIA='+QStr(edON_Familia.Text);
//    end;
//   Opis.DataSet.Filtered := true;

    try
    SetLength(arrRec,1);
    v := null;
//    if ChoiceAkt(Opis, nil, v, arrRec, ParamFlt)  and (v<>null) then begin
    if Opis.ChoiceFromSprEx(nil, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      lCheck:=dbDisableControls(Dokument);

      FRun:=true;
      try
        EditDataSet(Dokument);

        DokumentDeclare_ID.AsInteger:=GetValueFieldEx(arrRec,'ID',0);

        DokumentOSNOV.AsBoolean := GetValueFieldEx(arrRec, 'OSNOV', false);

        DokumentON_ID.AsString := GetValueFieldEx(arrRec, 'ON_ID','');

        DokumentON_FAMILIA.AsString  := GetValueFieldEx(arrRec, 'ON_FAMILIA','');
        DokumentON_FAMILIAP.AsString := GetValueFieldEx(arrRec, 'ON_FAMILIAP','');
        DokumentON_NAME.AsString     := GetValueFieldEx(arrRec, 'ON_NAME','');
        DokumentON_OTCH.AsString     := GetValueFieldEx(arrRec, 'ON_OTCH','');

        DokumentON_Familia_B.AsString  := GetValueFieldEx(arrRec, 'ON_FAMILIA_B','');
        DokumentON_FamiliaP_B.AsString := GetValueFieldEx(arrRec, 'ON_FAMILIAP_B','');
        DokumentON_NAME_B.AsString     := GetValueFieldEx(arrRec, 'ON_NAME_B','');
        DokumentON_OTCH_B.AsString     := GetValueFieldEx(arrRec, 'ON_OTCH_B','');

        v := GetValueField(arrRec, 'ON_DATER');
        if v = null then DokumentON_DateR.AsString := ''
                    else DokumentON_DateR.Value    := v;
        DokumentON_NATION.AsString := GetValueFieldEx(arrRec, 'ON_NATION', '0');
        DokumentON_GRAG.AsString   := GetValueFieldEx(arrRec, 'ON_GRAG', '0');
        DokumentON_OBRAZ.AsString  := GetValueFieldEx(arrRec, 'ON_OBRAZ', '0');
        DokumentON_IDENTIF.AsString  := GetValueFieldEx(arrRec, 'ON_IDENTIF', '');

        DokumentON_DOK_TYPE.AsString := GetValueFieldEx(arrRec,'ON_DOK_TYPE','0');
        DokumentON_DOK_SERIA.AsString := GetValueFieldEx(arrRec,'ON_DOK_SERIA','');
        DokumentON_DOK_NOMER.AsString := GetValueFieldEx(arrRec,'ON_DOK_NOMER','');
        try
          if DokumentON_DOK_NOMER.AsString<>'' then
            DokumentON_DOK_DATE.AsDateTime := GetValueFieldEx(arrRec,'ON_DOK_DATE',0);
        except
          DokumentON_DOK_DATE.AsString := '';
        end;
        DokumentON_DOKUMENT.AsString := GetValueFieldEx(arrRec,'ON_DOKUMENT','');

        DokumentON_GRAG_ADD.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_DBrak, GetValueFieldEx(arrRec, 'ID', 0), STOD('1899-12-30',tdAds),
                                      'ON_GRAG_ADD', ftMemo);
        edON_GRAG.Hint:=DokumentON_GRAG_ADD.AsString;
        DokumentONA_GRAG_ADD.AsString:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_DBrak, GetValueFieldEx(arrRec, 'ID', 0), STOD('1899-12-30',tdAds),
                                      'ONA_GRAG_ADD', ftMemo);
        edONA_GRAG.Hint:=DokumentONA_GRAG_ADD.AsString;
        //----------- для заполнения пункта 18.Отметка -----------------
        sON:='';
        sONA:='';

        if Trim(GetValueFieldEx(arrRec,'ON_NATION_DOK',''))<>'' then
          sON:=GetValueFieldEx(arrRec,'ON_NATION_DOK','');
        if Trim(GetValueFieldEx(arrRec,'ONA_NATION_DOK',''))<>'' then
          sONA:=GetValueFieldEx(arrRec,'ONA_NATION_DOK','');

        if (GetValueFieldEx(arrRec,'ON_SEM',0)=3) or (GetValueFieldEx(arrRec,'ON_SEM',0)=4) then begin
          s:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_DBrak, GetValueFieldEx(arrRec, 'ID', 0), STOD('1899-12-30',tdAds),'ON_SEM_DOK', ftMemo);
          if s<>'' then
            if sON='' then sON:=s else sON:=sON+', '+s;
        end;
        {
        s:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_DBrak, GetValueFieldEx(arrRec, 'ID', 0), STOD('1899-12-30',tdAds),'ON_DOK_OTM', ftMemo);
        if s<>'' then
          if sON='' then sON:=s else sON:=sON+', '+s;
        }
        if (GetValueFieldEx(arrRec,'ONA_SEM',0)=3) or (GetValueFieldEx(arrRec,'ONA_SEM',0)=4) then begin
          s:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_DBrak, GetValueFieldEx(arrRec, 'ID', 0), STOD('1899-12-30',tdAds),'ONA_SEM_DOK', ftMemo);
          if s<>'' then
            if sONA='' then sONA:=s else sONA:=sONA+', '+s;
        end;
        {
        s:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_DBrak, GetValueFieldEx(arrRec, 'ID', 0), STOD('1899-12-30',tdAds),'ONA_DOK_OTM', ftMemo);
        if s<>'' then
          if sONA='' then sONA:=s else sONA:=sONA+', '+s;
        }
        if sONA='' then begin
          if sON<>''
            then DokumentOTMETKA.AsString:=sON+Chr(13)+Chr(10)+'#';
        end else begin
          if sON=''
            then DokumentOTMETKA.AsString:='#'+sONA
            else DokumentOTMETKA.AsString:=sON+Chr(13)+Chr(10)+'#'+sONA;
        end;
        //----------------------------------------------------------------

        DokumentON_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_GOSUD', '');
        DokumentON_OBL.AsString   := GetValueFieldEx(arrRec, 'ON_OBL', '');
        DokumentON_RAION.AsString   := GetValueFieldEx(arrRec, 'ON_RAION', '');
        DokumentON_B_GOROD.AsString   := GetValueFieldEx(arrRec, 'ON_B_GOROD', '');
        DokumentON_GOROD.AsString   := GetValueFieldEx(arrRec, 'ON_GOROD', '');
        GetValueFieldEx2(arrRec, 'ON_B_OBL', DokumentON_B_OBL);

        DokumentON_OBL_B.AsString   := GetValueFieldEx(arrRec, 'ON_OBL_B', '');
        DokumentON_RAION_B.AsString   := GetValueFieldEx(arrRec, 'ON_RAION_B', '');
        DokumentON_GOROD_B.AsString   := GetValueFieldEx(arrRec, 'ON_GOROD_B', '');

        DokumentON_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOSUD', '');
        DokumentON_M_OBL.AsString   := GetValueFieldEx(arrRec, 'ON_M_OBL', '');

        DokumentON_M_RNGOROD.AsString:= '';
        DokumentON_M_RAION.AsString := GetValueFieldEx(arrRec, 'ON_M_RAION', '');
        // проверяем, только если значение района в заявлении не пусто
        if DokumentON_M_RAION.AsString<>'' then begin
          DokumentON_M_B_RN.AsBoolean := GetValueFieldEx(arrRec, 'ON_M_B_RN', true);
          if not DokumentON_M_B_RN.AsBoolean then begin
             DokumentON_M_RNGOROD.AsString := DokumentON_M_RAION.AsString;
             DokumentON_M_RAION.AsString   := '';
          end;
        end;

        DokumentON_M_B_GOROD.AsString   := GetValueFieldEx(arrRec, 'ON_M_B_GOROD', '');
        DokumentON_M_GOROD.AsString   := GetValueFieldEx(arrRec, 'ON_M_GOROD', '');
        DokumentON_M_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ON_M_GOROD_R', '');

        DokumentON_M_DOM.AsString := GetValueFieldEx(arrRec, 'ON_M_DOM', '');
        DokumentON_M_KORP.AsString := GetValueFieldEx(arrRec, 'ON_M_KORP', '');
        DokumentON_M_KV.AsString := GetValueFieldEx(arrRec, 'ON_M_KV', '');

        GetValueFieldEx2(arrRec, 'ON_M_B_OBL', DokumentON_M_B_OBL);

        DokumentON_GODPR.AsString     := GetValueFieldEx(arrRec, 'ON_GODPR', '');
        DokumentON_WORK.AsString := GetValueFieldEx(arrRec, 'ON_WORK', '');
        DokumentON_SVID.AsString := GetValueFieldEx(arrRec, 'ON_SVID', '');
        DokumentON_SEM.AsString := GetValueFieldEx(arrRec, 'ON_SEM', '');

        //--------- ОНА -------------------
        DokumentONA_ID.AsString := GetValueFieldEx(arrRec, 'ONA_ID','');

        DokumentONA_FAMILIA.AsString  := GetValueFieldEx(arrRec, 'ONA_FAMILIA','');
        DokumentONA_FAMILIAP.AsString := GetValueFieldEx(arrRec, 'ONA_FAMILIAP','');
        DokumentONA_NAME.AsString     := GetValueFieldEx(arrRec, 'ONA_NAME','');
        DokumentONA_OTCH.AsString     := GetValueFieldEx(arrRec, 'ONA_OTCH','');

        DokumentONA_Familia_B.AsString  := GetValueFieldEx(arrRec, 'ONA_FAMILIA_B','');
        DokumentONA_FamiliaP_B.AsString := GetValueFieldEx(arrRec, 'ONA_FAMILIAP_B','');
        DokumentONA_NAME_B.AsString     := GetValueFieldEx(arrRec, 'ONA_NAME_B','');
        DokumentONA_OTCH_B.AsString     := GetValueFieldEx(arrRec, 'ONA_OTCH_B','');

        v := GetValueField(arrRec, 'ONA_DATER');
        if v = null then DokumentONA_DateR.AsString := ''
                    else DokumentONA_DateR.Value    := v;
        DokumentONA_NATION.AsString := GetValueFieldEx(arrRec, 'ONA_NATION', '0');
        DokumentONA_GRAG.AsString   := GetValueFieldEx(arrRec, 'ONA_GRAG', '0');
        DokumentONA_OBRAZ.AsString  := GetValueFieldEx(arrRec, 'ONA_OBRAZ', '0');
        DokumentONA_IDENTIF.AsString  := GetValueFieldEx(arrRec, 'ONA_IDENTIF', '');

        DokumentONA_DOK_TYPE.AsString := GetValueFieldEx(arrRec,'ONA_DOK_TYPE','0');
        DokumentONA_DOK_SERIA.AsString := GetValueFieldEx(arrRec,'ONA_DOK_SERIA','');
        DokumentONA_DOK_NOMER.AsString := GetValueFieldEx(arrRec,'ONA_DOK_NOMER','');
        try
          if DokumentONA_DOK_NOMER.AsString<>'' then
            DokumentONA_DOK_DATE.AsDateTime := GetValueFieldEx(arrRec,'ONA_DOK_DATE',0);
        except
          DokumentONA_DOK_DATE.AsString := '';
        end;
        DokumentONA_DOKUMENT.AsString := GetValueFieldEx(arrRec,'ONA_DOKUMENT','');

        DokumentONA_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_GOSUD', '');
        DokumentONA_OBL.AsString   := GetValueFieldEx(arrRec, 'ONA_OBL', '');
        DokumentONA_RAION.AsString   := GetValueFieldEx(arrRec, 'ONA_RAION', '');
        DokumentONA_B_GOROD.AsString   := GetValueFieldEx(arrRec, 'ONA_B_GOROD', '');
        DokumentONA_GOROD.AsString   := GetValueFieldEx(arrRec, 'ONA_GOROD', '');
        GetValueFieldEx2(arrRec, 'ONA_B_OBL', DokumentONA_B_OBL);

        DokumentONA_OBL_B.AsString   := GetValueFieldEx(arrRec, 'ONA_OBL_B', '');
        DokumentONA_RAION_B.AsString   := GetValueFieldEx(arrRec, 'ONA_RAION_B', '');
        DokumentONA_GOROD_B.AsString   := GetValueFieldEx(arrRec, 'ONA_GOROD_B', '');

        DokumentONA_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOSUD', '');
        DokumentONA_M_OBL.AsString   := GetValueFieldEx(arrRec, 'ONA_M_OBL', '');

        DokumentONA_M_RNGOROD.AsString:= '';
        DokumentONA_M_RAION.AsString  := GetValueFieldEx(arrRec, 'ONA_M_RAION', '');
        // проверяем, только если значение района в заявлении не пусто
        if DokumentONA_M_RAION.AsString<>'' then begin
          DokumentONA_M_B_RN.AsBoolean := GetValueFieldEx(arrRec, 'ONA_M_B_RN', true);
          if not DokumentONA_M_B_RN.AsBoolean then begin
             DokumentONA_M_RNGOROD.AsString := DokumentONA_M_RAION.AsString;
             DokumentONA_M_RAION.AsString   := '';
          end;
        end;

        DokumentONA_M_B_GOROD.AsString   := GetValueFieldEx(arrRec, 'ONA_M_B_GOROD', '');
        DokumentONA_M_GOROD.AsString   := GetValueFieldEx(arrRec, 'ONA_M_GOROD', '');
        DokumentONA_M_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOROD_R', '');

        DokumentONA_M_DOM.AsString := GetValueFieldEx(arrRec, 'ONA_M_DOM', '');
        DokumentONA_M_KORP.AsString := GetValueFieldEx(arrRec, 'ONA_M_KORP', '');
        DokumentONA_M_KV.AsString := GetValueFieldEx(arrRec, 'ONA_M_KV', '');

        GetValueFieldEx2(arrRec, 'ONA_M_B_OBL', DokumentONA_M_B_OBL);

        DokumentONA_GODPR.AsString     := GetValueFieldEx(arrRec, 'ONA_GODPR', '');
        DokumentONA_WORK.AsString := GetValueFieldEx(arrRec, 'ONA_WORK', '');
        DokumentONA_SVID.AsString := GetValueFieldEx(arrRec, 'ONA_SVID', '');
        DokumentONA_SEM.AsString  := GetValueFieldEx(arrRec, 'ONA_SEM', '');

        DokumentON_VUS.AsBoolean   := GetValueFieldEx(arrRec, 'ON_VUS', false);
        DokumentON_VOENKOM.AsString:= GetValueFieldEx(arrRec, 'ON_VOENKOM', '');
        DokumentONA_VUS.AsBoolean  := GetValueFieldEx(arrRec, 'ONA_VUS', false);
        DokumentONA_VOENKOM.AsString:=GetValueFieldEx(arrRec, 'ONA_VOENKOM', '');

        DokumentMESTO.AsString:=GetValueFieldEx(arrRec, 'MESTO', '');
        DokumentTARIF.AsString:=GetValueFieldEx(arrRec, 'TARIF', '');

        nSum:=GetValueFieldEx(arrRec, 'SUM_POSHLINA', 0);
        if nSum>0 then begin
          DokumentSUM_POSHLINA.AsFloat := nSum; //GetValueFieldEx(arrRec, 'SUM_POSHLINA', '0');
          DokumentPOSHLINA.AsString := GetValueFieldEx(arrRec, 'POSHLINA', '');
        end;

        ds2xml.StringToXML(GetValueFieldEx(arrRec, 'SUD_BRAK', '')); // ZAVIT  SUD_BRAK  SUD_NAME
        ds2xml.XMLToData;
        tbReshSud.First;
        tsReshSud.TabVisible:=(tbReshSud.RecordCount>0);

        CheckSOATOAkt(true,true,true,'{SS}',0,'');

//        GetValueFieldEx2(arrRec, 'DATEB', DokumentDATESV);
        CheckControls;

        PostDataSet(Dokument);
        ReadDeti(GetValueFieldEx(arrRec, 'DETI', ''));
        CheckControlDeti;
      finally
        FRun:=false;
        dbEnableControls(Dokument,lCheck);
        Screen.Cursor := old;
      end;
    end;
    finally
      Opis.DataSet.Filter   := '';
      Opis.DataSet.Filtered := false;
    end;
  end;
  if ParamFlt<>nil then FreeAndNil(ParamFlt);
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.TBItem1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetMarriage(Self);
//  Gisun.CheckMarriage(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.TBItem2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterMarriage(Self);
//  Gisun.CheckMarriage(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then begin
    if pc.Pages[pc.ActivePageIndex]<>tsReshSud then begin
      if pc.Pages[pc.ActivePageIndex]=tsSvid
        then CheckForAll_Bel( nil )
        else N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
    end;
//    if (pc.ActivePageIndex=1) or (pc.Pages[pc.ActivePageIndex].Name='tsSvid')
//      then N_F_cbPovtor.Parent:=pc.Pages[pc.ActivePageIndex];
  end;
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.lbBrakRastGetText(Sender: TObject;  var Text: String);
begin
  if N_F_cbRast.Checked then begin
 // if DokumentBRAK_RAST.AsBoolean then begin
    if DokumentTYPE_RAST.AsInteger=1 then begin           // смерть
      text := 'Брак'+#13+'прекращен';
    end else if DokumentTYPE_RAST.AsInteger=4 then begin
      text := 'Брак'+#13+'признан'+#13+'недействительным';
    end else begin
      text := 'Брак'+#13+'расторгнут';
    end;
  end else begin
    text := '';
  end;
end;
//--------------------------------------------------------------------
procedure TfmZapisBrak.WriteVOENKOM(nType:Integer);
var
  SOATO:TSOATO;
  n:Integer;
  fld:TField;
begin
  if nType=1 then begin
    SOATO:=dmBase.GetSoatoAkt(Dokument,
           'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD',true,FLenSoato);
  end else begin
    SOATO:=dmBase.GetSoatoAkt(Dokument,
           'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD',true,FLenSoato);
  end;
  if nType=1
    then fld:=DokumentON_VOENKOM
    else fld:=DokumentONA_VOENKOM;
  n:=dmBase.VoenkomFromSOATO(SOATO.Kod);
  if n>0 then begin
    EditDataSet(Dokument);
    fld.AsInteger:=n;
  end else if fld.AsInteger>0 then begin
    EditDataSet(Dokument);
    fld.AsString:='';
  end;
end;

//---------------------------------------------------------------------------------
procedure TfmZapisBrak.edON_VoenkomChange(Sender: TObject);
begin
  if edON_Voenkom.Value<>null
    then cbON_VUS.Checked:=true;
end;
//----------------------------------------------------------------------
procedure TfmZapisBrak.edON_VoenkomEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edON_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
  cbON_VUS.Checked:=true;
end;
//----------------------------------------------------------------------
procedure TfmZapisBrak.edON_VoenkomEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  edON_Voenkom.Value:=null;
  cbON_VUS.Checked:=false;
end;
//----------------------------------------------------------------------
procedure TfmZapisBrak.edON_VoenkomEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  WriteVOENKOM(1);
end;
//----------------------------------------------------------------------
procedure TfmZapisBrak.edONA_VOENKOMChange(Sender: TObject);
begin
  if edONA_Voenkom.Value<>null
    then cbONA_VUS.Checked:=true;
end;

procedure TfmZapisBrak.edONA_VOENKOMEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edONA_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
  cbONA_VUS.Checked:=true;
end;

procedure TfmZapisBrak.edONA_VOENKOMEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  edONA_Voenkom.Value:=null;
  cbONA_VUS.Checked:=false;
end;

procedure TfmZapisBrak.edON_DATERUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value, TDbDateTimeEditEh(Sender), 14);
end;

procedure TfmZapisBrak.edON_DATEREnter(Sender: TObject);
var
  fldDateB : TField;
  nYear,nMonth,nDay : Integer;
begin
  if DokumentDATEB.IsNull then fldDateB:=DokumentDATESV else fldDateB:=DokumentDATEB;
  if not fldDateB.IsNull then begin
    if not DokumentON_DateR.IsNull then begin
      if SubDateEx(18,fldDateB.AsDateTime,DokumentON_DateR.AsDateTime,nYear,nMonth,nDay) then begin
        CreateHint(H,edON_DATER,SubDatePropis(fldDateB.AsDateTime,DokumentON_DateR.AsDateTime,0)+' ');
      end;
    end;
  end;
end;

procedure TfmZapisBrak.edONA_DATEREnter(Sender: TObject);
var
  fldDateB : TField;
  nYear,nMonth,nDay : Integer;
//  s1,s2 : String;
begin
  if DokumentDATEB.IsNull then fldDateB:=DokumentDATESV else fldDateB:=DokumentDATEB;
  if not fldDateB.IsNull then begin
    if not DokumentONA_DateR.IsNull then begin
      if SubDateEx(18,fldDateB.AsDateTime,DokumentONA_DateR.AsDateTime,nYear,nMonth,nDay) then begin
        CreateHint(H,edONA_DATER,SubDatePropis(fldDateB.AsDateTime,DokumentONA_DateR.AsDateTime,0)+' ');
      end;
    end;
  end;
end;

function TfmZapisBrak.BeforeReport: Boolean;
var
  fldDateB : TField;
begin
  Result:=inherited BeforeReport;
  if Result then begin
    FVozrastPropisON:='возраст не известен';
    FVozrastPropisONA:='возраст не известен';
    Fdo18ON:='';
    Fdo18ONA:='';
    if DokumentDATEB.IsNull then fldDateB:=DokumentDATESV else fldDateB:=DokumentDATEB;
    if not fldDateB.IsNull then begin
      if not DokumentON_DateR.IsNull then begin
        FVozrastPropisON:=SubDatePropis(fldDateB.AsDateTime,DokumentON_DateR.AsDateTime,0);
        Fdo18ON:=SubDatePropisEx(18,fldDateB.AsDateTime,DokumentON_DateR.AsDateTime,0);
      end;
      if not DokumentONA_DateR.IsNull then begin
        FVozrastPropisONA:=SubDatePropis(fldDateB.AsDateTime,DokumentONA_DateR.AsDateTime,0);
        Fdo18ONA:=SubDatePropisEx(18,fldDateB.AsDateTime,DokumentONA_DateR.AsDateTime,0);
      end;
    end;
  end;
end;

procedure TfmZapisBrak.edSpecEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edSpec,DokumentSPEC.AsString+' '); end;

//------------------------------------------------------------------------------------------
function TfmZapisBrak.CreateSubMenuRun: Boolean;
var
 it : TTbItem;
 sep : TTbSeparatorItem;
begin
  inherited CreateSubmenuRun;
  Result:=true;

  AddSubmenu_CheckFIO;

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Аннулирование актовой записи';
  it.OnClick:=Event_Annulir;
  TBSubmenuRun.Add(it);

  TBItemDateBrak := TTbItem.Create(TBSubmenuRun);
  TBItemDateBrak.Caption:='Дата брака и з/а не совпадают';
  TBItemDateBrak.Name:='TBItemDateBrak';
//  it.AutoCheck:=true;
  TBItemDateBrak.OnClick:=Event_DateBrak;
  TBSubmenuRun.Add(TBItemDateBrak);

  TbItemVerno := TTbItem.Create(TBSubmenuRun);
  TbItemVerno.Caption:='Запись акта верна';
  TbItemVerno.OnClick:=Event_TrueAkt;
  TBSubmenuRun.Add(TbItemVerno);

  AddSubmenu_ReadDolg;

  {$IFDEF ZAGS}
  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);
  TbItemCondIN_ON := TTbItem.Create(TBSubmenuRun);
  TbItemCondIN_ON.Caption:='Идентификационный номер жениха не подлежит печати';
  TbItemCondIN_ON.OnClick:=Event_CondIN_ON;
  TBSubmenuRun.Add(TbItemCondIN_ON);

  TbItemCondIN_ONA := TTbItem.Create(TBSubmenuRun);
  TbItemCondIN_ONA.Caption:='Идентификационный номер невесты не подлежит печати';
  TbItemCondIN_ONA.OnClick:=Event_CondIN_ONA;
  TBSubmenuRun.Add(TbItemCondIN_ONA);
  {$ENDIF}

end;

procedure TfmZapisBrak.btAddChildClick(Sender: TObject);
begin
  QueryExit:=true;
  tbDeti.Append;
  ActiveControl:=GridDeti;
end;

procedure TfmZapisBrak.btDelChildClick(Sender: TObject);
begin
  if tbDeti.RecordCount>0 then begin
    QueryExit:=true;
    tbDeti.Delete;
    ActiveControl:=GridDeti;
  end;
end;


procedure TfmZapisBrak.edOTMETKADblClick(Sender: TObject);
var
  ed : TDbEditEh;
  sValue : String;
begin
  if Sender is TDbEditEh then begin
    ed := TDbEditEh(Sender);
  end else begin
    ed := TDbEditEh(TComponent(Sender).Owner);
  end;
  sValue := ed.Text;
  if EditMemo(sValue, 'Значение', ed, ed.Width+50) then begin
    ed.Text := sValue;
//    if (ed.DataSource<>nil) and (ed.DataSource.DataSet<>nil) and
//        (ed.DataField<>'') then begin
//      ds := ed.DataSource.DataSet;
//      if (ds.State<>dsEdit) and (ds.State<>dsInsert) then begin
//        ds.Edit;
//      end;
//      ds.FieldByName(ed.DataField).AsString := sValue;
//    end;
  end;
end;

function TfmZapisBrak.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
  {$IFNDEF ZAGS}
//  if Result then begin
//    cbProvDvig.Checked := not DokumentPROV.AsBoolean;
//  end;
  {$ENDIF}

// в методе Create отключена проверка FCheckLookupField:=false
  if FOnlySvid then begin
    n:=LimitMRUList(3);
    SetMRUList(edON_Gorod_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edONA_Gorod_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);
    n:=LimitMRUList(1);
    SetMRUList(edON_OBL_R_Sv,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_OBL_R_Sv,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edON_RAION_R_Sv,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_RAION_R_Sv,n,2,true,false,false,FAddButtonMRUList);
  end else begin
    n:=LimitMRUList(3);
    SetMRUList(edON_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  //  SetMRUList(edON_Gorod_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edON_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edONA_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  //  SetMRUList(edONA_Gorod_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edONA_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

    if tsSvid.TabVisible then begin
       SetMRUList(edON_Gorod_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);
       SetMRUList(edONA_Gorod_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);
    end;

    n:=LimitMRUList(1);
    SetMRUList(edON_M_OBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edON_OBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_M_OBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_OBL,n,1,true,false,false,FAddButtonMRUList);
    if tsSvid.TabVisible then begin
       SetMRUList(edON_OBL_R_Sv,n,1,true,false,false,FAddButtonMRUList);
       SetMRUList(edONA_OBL_R_Sv,n,1,true,false,false,FAddButtonMRUList);
    end;

    n:=LimitMRUList(2);
    SetMRUList(edON_M_RAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edON_RAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_M_RAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_RAION,n,2,true,false,false,FAddButtonMRUList);
    if tsSvid.TabVisible then begin
       SetMRUList(edON_RAION_R_Sv,n,2,true,false,false,FAddButtonMRUList);
       SetMRUList(edONA_RAION_R_Sv,n,2,true,false,false,FAddButtonMRUList);
    end;
  end;

end;

function TfmZapisBrak.EmptyIzm: String;
begin
  Result:=SprBrak_EmptyIzm;  // uProject
end;

//-------------------------------------------------------------------
procedure TfmZapisBrak.CheckBrakRast;
begin
 EditDataSet(Dokument);
 if DokumentBRAK_RAST.AsBoolean then begin
//  DokumentTYPE_RAST.AsInteger:=pcRast.ActivePageIndex+1;
  if DokumentTYPE_RAST.AsInteger=1 then begin           // смерть
    DokumentSUDNAME.AsString:='';
    DokumentSUDNAME_B.AsString:='';
    DokumentSUDRESH.AsString:='';
    DokumentSUDSILA.AsString:='';

    DokumentR_NOMER.AsString:='';
    DokumentR_DATE.AsString:='';
    DokumentR_ZAGS.AsString:='';
    DokumentR_ZAGS_B.AsString:='';
  end else if (DokumentTYPE_RAST.AsInteger=2) or (DokumentTYPE_RAST.AsInteger=4) then begin  // решение суда
    DokumentS_NOMER.AsString:='';
    DokumentS_DATE.AsString:='';
    DokumentS_ZAGS.AsString:='';
    DokumentS_ZAGS_B.AsString:='';

    DokumentR_NOMER.AsString:='';
    DokumentR_DATE.AsString:='';
    DokumentR_ZAGS.AsString:='';
    DokumentR_ZAGS_B.AsString:='';
  end else if DokumentTYPE_RAST.AsInteger=3 then begin  // актовая запись
    DokumentS_NOMER.AsString:='';
    DokumentS_DATE.AsString:='';
    DokumentS_ZAGS.AsString:='';
    DokumentS_ZAGS_B.AsString:='';

    DokumentSUDNAME.AsString:='';
    DokumentSUDNAME_B.AsString:='';
    DokumentSUDRESH.AsString:='';
    DokumentSUDSILA.AsString:='';
  end;
 end else begin
   DokumentTYPE_RAST.AsInteger:=0;
   DokumentSUDNAME.AsString:='';
   DokumentSUDRESH.AsString:='';
   DokumentSUDSILA.AsString:='';
   DokumentR_NOMER.AsString:='';
   DokumentR_DATE.AsString:='';
   DokumentR_ZAGS.AsString:='';
   DokumentR_ZAGS_B.AsString:='';
   DokumentS_NOMER.AsString:='';
   DokumentS_DATE.AsString:='';
   DokumentS_ZAGS.AsString:='';
   DokumentS_ZAGS_B.AsString:='';
 end;
end;

procedure TfmZapisBrak.Button2Click(Sender: TObject);
{
var
  oldTypeRast:Integer;
  oldSudName:String;
  oldSudResh:TDateTime;
  oldSudSila:TDateTime;
  oldR_NOMER:String;
  oldR_DATE:TDateTime;
  oldR_ZAGS:String;
  oldS_NOMER:String;
  oldS_DATE:TDateTime;
  oldS_ZAGS:String;
  oldRast:Boolean;
}
begin
{
  oldRast:=DokumentBRAK_RAST.AsBoolean;
  oldTypeRast:=DokumentTYPE_RAST.AsInteger;
  oldSudName:=DokumentSUDNAME.ASString;
  if DokumentSUDRESH.IsNull then oldSudResh:=0 else oldSudResh:=DokumentSUDRESH.AsDateTime;
  if DokumentSUDSILA.IsNull then oldSudSila:=0 else oldSudSila:=DokumentSUDSILA.AsDateTime;
  oldR_NOMER:=DokumentR_NOMER.AsString;
  if DokumentR_DATE.IsNull then oldR_DATE:=0 else oldR_DATE:=DokumentR_DATE.AsDateTime;
  oldR_ZAGS:=DokumentR_ZAGS.AsString;
  oldS_NOMER:=DokumentS_NOMER.AsString;
  if DokumentS_DATE.IsNull then oldS_DATE:=0 else oldS_DATE:=DokumentS_DATE.AsDateTime;
  oldS_ZAGS:=DokumentS_ZAGS.AsString;

  fmZapisBrak_Add:=TfmZapisBrak_Add.Create(Self);
  EditDataSet(Dokument);
  if  DokumentTYPE_RAST.AsInteger>0 then begin
    fmZapisBrak_Add.pcRast.ActivePageIndex:=DokumentTYPE_RAST.AsInteger-1;
  end else begin
    fmZapisBrak_Add.pcRast.ActivePageIndex:=1;
  end;
  if fmZapisBrak_Add.EditModal then begin
    if fmZapisBrak_Add.cbBrak.Checked then begin
      DokumentTYPE_RAST.AsInteger:=fmZapisBrak_Add.pcRast.ActivePageIndex+1;
      if DokumentTYPE_RAST.AsInteger=1 then begin           // смерть
        DokumentSUDNAME.AsString:='';
        DokumentSUDRESH.AsString:='';
        DokumentSUDSILA.AsString:='';

        DokumentR_NOMER.AsString:='';
        DokumentR_DATE.AsString:='';
        DokumentR_ZAGS.AsString:='';
      end else if DokumentTYPE_RAST.AsInteger=2 then begin  // решение суда
        DokumentS_NOMER.AsString:='';
        DokumentS_DATE.AsString:='';
        DokumentS_ZAGS.AsString:='';

        DokumentR_NOMER.AsString:='';
        DokumentR_DATE.AsString:='';
        DokumentR_ZAGS.AsString:='';
      end else if DokumentTYPE_RAST.AsInteger=3 then begin  // актовая запись
        DokumentS_NOMER.AsString:='';
        DokumentS_DATE.AsString:='';
        DokumentS_ZAGS.AsString:='';

        DokumentSUDNAME.AsString:='';
        DokumentSUDRESH.AsString:='';
        DokumentSUDSILA.AsString:='';
      end;
    end else begin
      DokumentTYPE_RAST.AsInteger:=0;
      DokumentSUDNAME.AsString:='';
      DokumentSUDRESH.AsString:='';
      DokumentSUDSILA.AsString:='';
      DokumentR_NOMER.AsString:='';
      DokumentR_DATE.AsString:='';
      DokumentR_ZAGS.AsString:='';
      DokumentS_NOMER.AsString:='';
      DokumentS_DATE.AsString:='';
      DokumentS_ZAGS.AsString:='';
    end;
  end else begin
    DokumentBRAK_RAST.AsBoolean:=oldRast;
    DokumentTYPE_RAST.AsInteger:=oldTypeRast;
    DokumentSUDNAME.AsString:=oldSudName;
    if oldSudResh>0 then DokumentSUDRESH.AsDateTime:=oldSudResh else DokumentSUDRESH.AsString:='';
    if oldSudSila>0 then DokumentSUDSILA.AsDateTime:=oldSudSila else DokumentSUDSILA.AsString:='';
    DokumentR_NOMER.AsString:=oldR_NOMER;
    if oldR_DATE>0 then DokumentR_DATE.AsDateTime:=oldR_DATE else DokumentR_DATE.AsString:='';
    DokumentR_ZAGS.AsString:=oldR_ZAGS;
    DokumentS_NOMER.AsString:=oldS_NOMER;
    if oldS_DATE>0 then DokumentS_DATE.AsDateTime:=oldS_DATE else DokumentS_DATE.AsString:='';
    DokumentS_ZAGS.AsString:=oldS_ZAGS;
  end;
  fmZapisBrak_Add.Free;
}
end;

procedure TfmZapisBrak.N_F_cbRastClick(Sender: TObject);
begin
  tsRast.TabVisible:=N_F_cbRast.Checked;
  if N_F_cbRast.Checked then begin
    if (DokumentTYPE_RAST.AsInteger=0) or (DokumentTYPE_RAST.AsInteger>4) then begin
      rbSudClick(nil);
//      EditDataSet(Dokument);
//      DokumentTYPE_RAST.AsInteger:=2;
//      CheckControlRast;
    end;
    if not IsReadDokument then begin
      Application.ProcessMessages;
      pc.ActivePage:=tsRast;
    end;
  end;
end;
//--------------------------------------------------------
procedure TfmZapisBrak.CheckControlDeti;
begin
  if DokumentDETIasSTR.AsBoolean then begin
    GridDeti.Visible:=false;
    pnDeti.Visible:=false;
    edDeti.Align:=alClient;
    edDeti.Visible:=true;
  end else begin
    GridDeti.Visible:=true;
    pnDeti.Visible:=true;
    edDeti.Visible:=false;
  end;

end;
//--------------------------------------------------------
procedure TfmZapisBrak.CheckControlRast;
begin
  lb7.Enabled:=false;
  lb8.Enabled:=false;
  lb9.Enabled:=false;
  lb10.Enabled:=false;
  lb11.Enabled:=false;
  lb12.Enabled:=false;
  lb13.Enabled:=false;
  lb14.Enabled:=false;
  lb15.Enabled:=false;
  if DokumentTYPE_RAST.AsInteger=1 then begin
    rbSmert.Checked:=true;
    lb12.Enabled:=true;
    lb13.Enabled:=true;
    lb14.Enabled:=true;
    lb15.Enabled:=true;
    edS_NOMER.Enabled:=true;
    edS_DATE.Enabled:=true;
    edS_ZAGS.Enabled:=true;
    edSudName.Enabled:=false;
    edSudResh.Enabled:=false;
    edSudSila.Enabled:=false;
    edR_NOMER.Enabled:=false;
    edR_DATE.Enabled:=false;
    edR_ZAGS.Enabled:=false;
  end else if DokumentTYPE_RAST.AsInteger=2 then begin
    rbSud.Checked:=true;
    lb10.Enabled:=true;
    lb11.Enabled:=true;
    edS_NOMER.Enabled:=false;
    edS_DATE.Enabled:=false;
    edS_ZAGS.Enabled:=false;
    edSudName.Enabled:=true;
    edSudResh.Enabled:=true;
    edSudSila.Enabled:=true;
    edR_NOMER.Enabled:=false;
    edR_DATE.Enabled:=false;
    edR_ZAGS.Enabled:=false;
  end else if DokumentTYPE_RAST.AsInteger=4 then begin
    rbNed.Checked:=true;
    lb10.Enabled:=true;
    lb11.Enabled:=true;
    edS_NOMER.Enabled:=false;
    edS_DATE.Enabled:=false;
    edS_ZAGS.Enabled:=false;
    edSudName.Enabled:=true;
    edSudResh.Enabled:=true;
    edSudSila.Enabled:=true;
    edR_NOMER.Enabled:=false;
    edR_DATE.Enabled:=false;
    edR_ZAGS.Enabled:=false;
  end else if DokumentTYPE_RAST.AsInteger=3 then begin
    rbZap.Checked:=true;
    lb7.Enabled:=true;
    lb8.Enabled:=true;
    lb9.Enabled:=true;
    edS_NOMER.Enabled:=false;
    edS_DATE.Enabled:=false;
    edS_ZAGS.Enabled:=false;
    edSudName.Enabled:=false;
    edSudResh.Enabled:=false;
    edSudSila.Enabled:=false;
    edR_NOMER.Enabled:=true;
    edR_DATE.Enabled:=true;
    edR_ZAGS.Enabled:=true;
  end;
end;

procedure TfmZapisBrak.rbSmertClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentTYPE_RAST.AsInteger:=1;
  CheckControlRast;
end;

procedure TfmZapisBrak.rbSudClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentTYPE_RAST.AsInteger:=2;
  CheckControlRast;
end;

procedure TfmZapisBrak.rbNedClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentTYPE_RAST.AsInteger:=4;
  CheckControlRast;
end;

procedure TfmZapisBrak.rbZapClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentTYPE_RAST.AsInteger:=3;
  CheckControlRast;
end;

procedure TfmZapisBrak.tsRastEnter(Sender: TObject);
begin
  CheckControlRast;
end;

procedure TfmZapisBrak.tsSpravEnter(Sender: TObject);
begin
//  CheckArxText(FActiveON);
end;

procedure TfmZapisBrak.DBEditEh1EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  sDolg,sFIO,sFIO_B:String;
begin
  if ChoiceSpec(sDolg,sFIO,sFIO_B,edOtmRast) then begin
    edOtmRast.Text:=sDolg+' '+sFIO;
    Handled:=true;
  end;
end;
//----------------------------------------------------------------------
procedure TfmZapisBrak.Label25Click(Sender: TObject);
begin
end;

//----------------------------------------------------------------------
procedure TfmZapisBrak.edONA_VOENKOMEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  WriteVOENKOM(2);
end;

procedure TfmZapisBrak.edDateSVEnter(Sender: TObject);
begin
  if (edDateSV.Value=null) and (DokumentDATEZ.AsString<>'') then begin
    edDateSV.Value:=DokumentDATEZ.Value;
  end;
end;

//------------------------------------------------------------------------
procedure TfmZapisBrak.CheckControlSvid;
var
  n:Integer;
begin
  if GlobalTask.ParamAsBoolean('INVERT_SVID') then begin
    Init_ArrCheckControl(19);
    n:=0;

    FArrCheckControl[n].Cont1:=Label76;
    FArrCheckControl[n].Cont2:=Label77; Inc(n);
    FArrCheckControl[n].Cont1:=Label46;
    FArrCheckControl[n].Cont2:=Label47; Inc(n);

    FArrCheckControl[n].Cont1:=edON_GOSUD_Sv;
    FArrCheckControl[n].Cont2:=edON_GOSUD_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edON_OBL_R_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_OBL_R_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edON_RAION_R_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_RAION_R_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edON_B_GOROD_Sv;                // тип нас. пункта на русском
    FArrCheckControl[n].Cont2:=BLR_edON_Gorod_B_Sv;           // нас. пункт на белорусском
    FArrCheckControl[n].Cont1_:=edON_Gorod_Sv; Inc(n);         // нас. пункт на русском

    FArrCheckControl[n].Cont1:=edONA_GOSUD_Sv;
    FArrCheckControl[n].Cont2:=edONA_GOSUD_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edONA_OBL_R_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_OBL_R_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edONA_RAION_R_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_RAION_R_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edONA_B_GOROD_Sv;                // тип нас. пункта на русском
    FArrCheckControl[n].Cont2:=BLR_edONA_Gorod_B_Sv;            // нас. пункт на белорусском
    FArrCheckControl[n].Cont1_:=edONA_Gorod_Sv; Inc(n);         // нас. пункт на русском


    FArrCheckControl[n].Cont1:=edRukov_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRukov_Sv_B; Inc(n);  //11

    FArrCheckControl[n].Cont1:=edON_FamiliaP_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_FamiliaP_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_Familia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_Familia_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_Name_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_Name_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_Otch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_Otch_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edONA_FamiliaP_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_FamiliaP_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_Familia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_Familia_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_Name_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_Name_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_Otch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_Otch_B_Sv; //Inc(n);   // 19
  end;
end;
//-------------------------------------------------------------------
procedure TfmZapisBrak.Event_CondIN_ON(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  if TTbItem(Sender).Checked
    then DokumentON_IDENTIF_GIS.AsString:='1'
    else DokumentON_IDENTIF_GIS.AsString:='0';
  CheckImageCondIN_(ENG_edON_IDENTIF, DokumentON_IDENTIF_GIS.AsString, ImCondIN_ON);
end;
//-------------------------------------------------------------------
procedure TfmZapisBrak.Event_CondIN_ONA(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  if TTbItem(Sender).Checked
    then DokumentONA_IDENTIF_GIS.AsString:='1'
    else DokumentONA_IDENTIF_GIS.AsString:='0';
  CheckImageCondIN_(ENG_edONA_IDENTIF, DokumentONA_IDENTIF_GIS.AsString, ImCondIN_ONA);
end;

//----------------------------------------------------------------------------------------
procedure TfmZapisBrak.Event_DateBrak(Sender: TObject);
begin
  if edDateBrak.Visible then begin
    TBItemDateBrak.Checked:=false;
    edDateBrak.Value:=null;
    edDateBrak.Visible:=false;
    lbDateBrak.Visible:=false;
  end else begin
    TBItemDateBrak.Checked:=true;
    edDateBrak.Visible:=true;
    lbDateBrak.Visible:=true;
  end;
end;

//-------------------------------------------------------------------
procedure TfmZapisBrak.Event_TrueAkt(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  if TTbItem(Sender).Checked
    then DokumentDECL_ID.AsInteger:=1
    else DokumentDECL_ID.AsInteger:=0;
end;
//-------------------------------------------------------------------
procedure TfmZapisBrak.edON_GRAGEditButtons0Click(Sender: TObject; var Handled: Boolean);
//var
//  sValue:String;
//  slPar:TStringList;
begin
//  WriteDebug(sender.className);
//  showmessage(TEditButtonControlEh(sender).Owner.Name);
  EditAddGrag(edON_GRAG);   // !!!    проверить и переделать для edONA_GRAG
  {
  slPar:=TStringList.Create;
  slPar.Add('CAPTION=Дополнительное гражданство');
  slPar.Add('ONLY_SHABLON=1');
  slPar.Add('SHABLON='+IntToStr(SHABLON_ADD_GRAG));
  sValue:=DokumentON_GRAG_ADD.AsString;
  sValue:= EnterAdresat(edON_GRAG.Left,edON_GRAG.Top+20, sValue,slPar);
  slPar.Free;

  //sValue := Trim(InputBox('ОН', 'Дополнительное гражданство', DokumentON_GRAG_ADD.AsString));
  EditDataSet(Dokument);
  DokumentON_GRAG_ADD.AsString:=sValue;
  edON_GRAG.Hint:=sValue;
  }
end;

procedure TfmZapisBrak.edONA_GRAGEditButtons0Click(Sender: TObject;  var Handled: Boolean);
//var
//  sValue:String;
//  slPar:TStringList;
begin
  EditAddGrag(edONA_GRAG);   
  {
  slPar:=TStringList.Create;
  slPar.Add('CAPTION=Дополнительное гражданство');
  slPar.Add('ONLY_SHABLON=1');
  slPar.Add('SHABLON='+IntToStr(SHABLON_ADD_GRAG));
  sValue:=DokumentONA_GRAG_ADD.AsString;
  sValue:= EnterAdresat(edONA_GRAG.Left,edONA_GRAG.Top+20, sValue,slPar);
  slPar.Free;
//  sValue := Trim(InputBox('ОНА', 'Дополнительное гражданство', DokumentONA_GRAG_ADD.AsString));
  EditDataSet(Dokument);
  DokumentONA_GRAG_ADD.AsString:=sValue;
  edONA_GRAG.Hint:=sValue;
  }
end;

//-----------------------------------------------------------------------------
procedure TfmZapisBrak.AfterCheckAkt_GISUN(nType:Integer);
//var
// s:String;
begin
  dmBase.CheckBelFamily(DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);  // занесем в справочник правильные значения перевода
  dmBase.CheckBelFamily(DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);  // занесем в справочник правильные значения перевода
  EditDataSet(Dokument);
  if (DokumentON_FamiliaP.AsString='')  then begin
    DokumentON_FamiliaP.AsString:=DokumentON_Familia.AsString;
    DokumentON_FamiliaP_B.AsString:=DokumentON_Familia_B.AsString;
  end;
  if (DokumentONA_FamiliaP.AsString='')  then begin
    DokumentONA_FamiliaP.AsString:=DokumentONA_Familia.AsString;
    DokumentONA_FamiliaP_B.AsString:=DokumentONA_Familia_B.AsString;
  end;
  {
  if (DokumentONA_FamiliaP.AsString='') then begin
    DokumentONA_FamiliaP.AsString:=DokumentON_Familia.AsString;
  end;
//  s:=dmBase.GetBelFamily(DokumentON_Familia.AsString)
//  if s<>'' then begin
    DokumentON_Familia_B.AsString := dmBase.GetBelFamily(DokumentON_Familia.AsString);
    if DokumentON_Familia.AsString=DokumentON_FamiliaP.AsString then begin
      DokumentON_FamiliaP_B.AsString := DokumentON_Familia_B.AsString;
    end;
//  end;
}
  CheckControls;
end;

//-----------------------------------------------------------------------------
procedure TfmZapisBrak.CheckSOATOAkt(lOn,lOna:Boolean; lCheckVoenkom:Boolean; strParam:String; nAteID:Integer; strSoato:String);
var
//  SOATO:TSOATO;
  sSoato:String;
  n:Integer;
  ATE:TATE;
begin
  if lOn then begin
    if nAteID>0 then begin
      sSoato:=strSoato;
    end else begin
      ATE:=dmBase.GetATEAkt(Dokument, 'ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD', strParam);
      if ATE.ATE_ID>0 then begin
        sSoato:=ATE.Kod;
        nAteID:=ATE.ATE_ID;
      end else begin
        sSoato:='9000000000';
        nAteID:=0;
      end;
    end;
//    SOATO:=dmBase.GetSoatoAkt(Dokument,
//           'ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_RNGOROD;ON_GOROD,ON_B_GOROD',true,FLenSoato);
    EditDataSet(Dokument);
    DokumentON_SOATO.AsString:=sSOATO;
    DokumentON_ATEID.AsInteger:=nAteID;
    edON_SOATO.Hint:=ATE.FullName; // dmBase.GetNameTerr(DokumentON_SOATO.AsString,false,true);
    FOnCheckSOATO:=false;
    if lCheckVoenkom and FAutoVus then begin  // определение военкомата по СОАТО места жительства
      n:=getVoenkomat(sSOATO, DokumentDATEZ, DokumentON_DATER, true, DokumentON_GRAG.AsInteger);
      if n>0 then begin
        EditDataSet(Dokument);
        DokumentON_VOENKOM.AsInteger:=n;
      end;
    end;
    nAteID:=0;     // !!! что-бы не влияло на невесту, если lOn=true и lOna=true
    sSoato:='';
  end;
  if lOna then begin
    if nAteID>0 then begin
      sSoato:=strSoato;
    end else begin
      ATE:=dmBase.GetATEAkt(Dokument, 'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD', strParam);
      if ATE.ATE_ID>0 then begin
        sSoato:=ATE.Kod;
        nAteID:=ATE.ATE_ID;
      end else begin
        sSoato:='9000000000';
        nAteID:=0;
      end;
    end;
//    SOATO:=dmBase.GetSoatoAkt(Dokument,
//           'ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD',true,FLenSoato);
    EditDataSet(Dokument);
    DokumentONA_SOATO.AsString:=sSOATO;
    DokumentONA_ATEID.AsInteger:=nAteID;
    edONA_SOATO.Hint:=ATE.FullName; // dmBase.GetNameTerr(DokumentONA_SOATO.AsString,false,true);
    FOnaCheckSOATO:=false;
  end;
end;

//------------------------------------------------------------------------------------
function TfmZapisBrak.CheckDokumentSimple(nType: Integer; lWriteDok:Boolean): Boolean;
var
  strErr,s,ss:String;
//  d :TDateTime;
  n,obr:Integer;
  procedure AddErr(s:String); begin  strErr:=strErr+s+chr(13)+chr(10); end;
begin
  Result:=inherited CheckDokumentSimple(nType,lWriteDok);
  if Result then begin
    n:=0;
    strErr := '';
    if DokumentDATEZ.IsNull then AddErr('Заполните дату акта о браке. ');
    if DokumentNOMER.AsString='' then AddErr('Заполните номер акта о браке.');

//    if DokumentDATEZ.IsNull then dZ:=0 else dZ:=DokumentDATEZ.AsDateTime;

    if not FOnlySvid then begin

      if FWriteBeforeGisun and (Trim(DokumentSVID_NOMER.AsString)<>'') then begin
        s:=CheckFieldDate(DokumentDATESV,-1,YearOf(dmBase.GetCurDate),false,'<', DokumentDATEZ);
        if s<>'' then  AddErr('Дата выдачи свидетельства '+s);
      end;

      if DokumentID.AsInteger=-1 then begin // запись акта еще не сохранялась
        if (DokumentDECL_ID.AsInteger=0) then begin

          s:=CheckRnBigGorod(DokumentON_M_GOROD, DokumentON_M_RAION, DokumentON_M_RNGOROD);
          if s<>'' then AddErr('Жених, '+s);
          s:=CheckRnBigGorod(DokumentONA_M_GOROD, DokumentONA_M_RAION, DokumentONA_M_RNGOROD);
          if s<>'' then AddErr('Невеста, '+s);
          if (DokumentON_FAMILIA.AsString='') or (DokumentON_NAME.AsString='') then AddErr('Заполните Фамилия, Имя жениха');
          if (DokumentONA_FAMILIA.AsString='') or (DokumentONA_NAME.AsString='') then AddErr('Заполните Фамилия, Имя невесты');

          if not Grag_Dok(DokumentON_GRAG.Asstring,DokumentON_DOK_TYPE.Asstring,ss) then AddErr('Жених, несоответствие: '+ss);
          if not Grag_Dok(DokumentONA_GRAG.Asstring,DokumentONA_DOK_TYPE.AsString,ss) then AddErr('Невеста, несоответствие: '+ss);
          if not DokumentON_DateR.IsNull then begin
            n:=GetCountYear(DokumentDATEZ.AsDateTime,DokumentON_DateR.AsDateTime);
            if (n<15) or (n>100) then AddErr('Возраст жениха: '+IntToStr(n));
          end;
          obr:=DokumentON_OBRAZ.AsInteger;
          if (obr>0) and (obr<9) then begin
            if ((n<16) and (obr<5)) or ((n<20) and (obr<2))
              then AddErr('Несоответствие возраст-образование жениха');
          end;
          if not DokumentONA_DateR.IsNull then begin
            n:=GetCountYear(DokumentDATEZ.AsDateTime,DokumentONA_DateR.AsDateTime);
            if (n<15) or (n>100) then AddErr('Возраст невесты: '+IntToStr(n));
          end;
          obr:=DokumentONA_OBRAZ.AsInteger;
          if (obr>0) and (obr<9) then begin
            if ((n<16) and (obr<5)) or ((n<20) and (obr<2))
              then AddErr('Несоответствие возраст-образование невесты');
          end;
          if (DokumentON_M_GOSUD.AsInteger=MY_GRAG) then begin
            if (DokumentON_SOATO.AsString='') or (Copy(DokumentON_SOATO.AsString,2,6)='000000') or
               ( (Pos( Copy(DokumentON_SOATO.AsString,1,4)+',',GOROD_WITH_RN)>0) and (Copy(DokumentON_SOATO.AsString,5,3)='000'))
              then AddErr('Не определен код территории места жительства жениха.')
          end;
          if (DokumentONA_M_GOSUD.AsInteger=MY_GRAG)  then begin
            if (DokumentONA_SOATO.AsString='') or (Copy(DokumentONA_SOATO.AsString,2,6)='000000') or
               ( (Pos( Copy(DokumentONA_SOATO.AsString,1,4)+',',GOROD_WITH_RN)>0) and (Copy(DokumentONA_SOATO.AsString,5,3)='000'))
              then AddErr('Не определен код территории места жительства невесты.')
          end;


        end;
      end;
    end else begin
      if lWriteDok and (Trim(DokumentSVID_NOMER.AsString)<>'') then begin
        s:=CheckFieldDate(DokumentDATESV,-1,YearOf(dmBase.GetCurDate),false,'<',DokumentDATEZ);
        if s<>'' then  AddErr('Дата выдачи свидетельства '+s);
      end;
    end;

    if not DokumentDATEZ.IsNull then begin
      n:=YearOf(DokumentDATEZ.AsDateTime);
      if (n<getMinYear) or (n>getMaxYear)
        then AddErr('Год записи акта: '+IntToStr(n));
    end;

    FLastError:=strErr;
    if FLastError<>'' then Result:=false;
  end;
end;
//-------------------------------------------------
procedure TfmZapisBrak.SetOnlyPovtorSvid(lOnlyPovtor: Boolean; pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;
              lbSvid, lbNomer: TLabel);
begin
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
  if lOnlyPovtor then begin
    TBItemSeekAkt.Visible:=true;
//  TBSubmenuGISUN.Visible:=false;
    TBItem2.Caption:='Зарегистрировать свидетельство';
    TBItemArxSpr.Visible:=false;
    TBItemChoiceDeclare.Visible:=false;

    ENG_edON_IDENTIF.Parent:=tsSvid;
    ENG_edON_IDENTIF.Top:=edON_DateR_Sv.Top;
    ENG_edON_IDENTIF.Left:=edON_DateR_Sv.Left+edON_DateR_Sv.Width+200;
    ENG_edON_IDENTIF.TabOrder:=201;

    ENG_edONA_IDENTIF.Parent:=tsSvid;
    ENG_edONA_IDENTIF.Top:=edONA_DateR_Sv.Top;
    ENG_edONA_IDENTIF.Left:=edONA_DateR_Sv.Left+edONA_DateR_Sv.Width+200;
    ENG_edONA_IDENTIF.TabOrder:=203;

  end;
end;

procedure TfmZapisBrak.edON_M_GOSUDUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  if not FRun then begin
    FOnCheckSOATO:=true;
  end;
end;

procedure TfmZapisBrak.edONA_M_GOSUDUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  if not FRun then begin
    FOnaCheckSOATO:=true;
  end;
end;

procedure TfmZapisBrak.edON_SOATOClick(Sender: TObject);
begin
  if IsEmptySOATO(DokumentON_SOATO.AsString) or QuerySoato(FQuerySOATO)
    then CheckSOATOAkt(true,false,true,'{CHOICE}',0,'');
end;

procedure TfmZapisBrak.edON_SOATODblClick(Sender: TObject);
begin
  if IsEmptySOATO(DokumentON_SOATO.AsString) or QuerySoato(FQuerySOATO)
    then CheckSOATOAkt(true,false,true,'{CHOICE}',0,'');
end;

procedure TfmZapisBrak.edONA_SOATOClick(Sender: TObject);
begin
  if IsEmptySOATO(DokumentONA_SOATO.AsString) or QuerySoato(FQuerySOATO)
    then CheckSOATOAkt(false,true,true,'{CHOICE}',0,'');
end;

procedure TfmZapisBrak.edONA_SOATODblClick(Sender: TObject);
begin
  if IsEmptySOATO(DokumentONA_SOATO.AsString) or QuerySoato(FQuerySOATO)
    then  CheckSOATOAkt(false,true,true,'{CHOICE}',0,'');
end;

procedure TfmZapisBrak.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;

procedure TfmZapisBrak.edRukov_SvEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov_Sv);
end;

procedure TfmZapisBrak.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;

//------------------------------------------------------------
function TfmZapisBrak.CheckFIO: String;
begin
  Result:=CheckOneFIO('Жених: ',DokumentON_Familia.AsString, DokumentON_Name.AsString, DokumentON_Otch.AsString);
  if Result='' then begin
    Result:=CheckOneFIO('Жених после брака: ',DokumentON_FamiliaP.AsString, '', '');
  end;
  if Result='' then begin
    Result:=CheckOneFIO('Невеста: ',DokumentONA_Familia.AsString, DokumentONA_Name.AsString, DokumentONA_Otch.AsString);
    if Result='' then begin
      Result:=CheckOneFIO('Невеста после брака: ',DokumentONA_FamiliaP.AsString, '', '');
    end;
  end;
end;

procedure TfmZapisBrak.edONA_FamiliaPUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  FIOUpdateData(Sender,Handled);
//  if (edONA_FamiliaP.Color=COLOR_HIST) or (edONA_FamiliaP.Color=GetDisableColorGIS) then exit;
  if (edON_FamiliaP.Text<>'') and (edONA_FamiliaP.Text<>'') then begin
    if MySameText(edONA_Familia.Text,edONA_FamiliaP.Text) then begin
      edONA_FamiliaP.Color:=clWindow;
    end else begin     
      if not CheckFamilia_ON_ONA(ANSIUpperCase(edON_FamiliaP.Text), ANSIUpperCase(edONA_FamiliaP.Text))
        then edONA_FamiliaP.Color:=colorWarning
        else edONA_FamiliaP.Color:=clWindow;
    end;
  end else begin
    edONA_FamiliaP.Color:=clWindow;
  end;
end;               
                                      
procedure TfmZapisBrak.BLR_edONA_FamiliaPUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  FIOUpdateData(Sender,Handled);
//  if (BLR_edONA_FamiliaP.Color=COLOR_HIST) or (BLR_edONA_FamiliaP.Color=GetDisableColorGIS) then exit;
  if (BLR_edON_FamiliaP.Text<>'') and (BLR_edONA_FamiliaP.Text<>'') then begin
    if MySameText(BLR_edONA_Familia.Text,BLR_edONA_FamiliaP.Text) then begin
      BLR_edONA_FamiliaP.Color:=clWindow;
    end else begin
      if not CheckFamilia_ON_ONA_Bel(ANSIUpperCase(BLR_edON_FamiliaP.Text), ANSIUpperCase(BLR_edONA_FamiliaP.Text))
        then BLR_edONA_FamiliaP.Color:=colorWarning
        else BLR_edONA_FamiliaP.Color:=clWindow;
    end;
  end else begin
    BLR_edONA_FamiliaP.Color:=clWindow;
  end;
end;


procedure TfmZapisBrak.TBItemEditMemoClick(Sender: TObject);
begin
  if ActiveControl=edOtmetka then TBItemEditMemo.Tag:=3;
  try
    inherited TBItemEditMemoClick(Sender);
  finally
    TBItemEditMemo.Tag:=0;
  end;
end;
//-------------------------------------------------------------
function TfmZapisBrak.EnableHistoryControl(ActControl:TWinControl):Boolean;
begin
  if (ActControl=BLR_edON_GOSUD) or (ActControl=BLR_edONA_GOSUD)
    then Result:=false
    else Result:=true;
end;
//-------------------------------------------------------------
procedure TfmZapisBrak.FieldAddHistDop(fld : TField; ActControl:TWinControl);
//var
//  s:String;
begin
{
  if fld.FieldName='ON_OBL' then begin
    FieldAddHist(DokumentON_OBL_B, BLR_edON_OBL, s);
  end else if fld.FieldName='ON_RAION' then begin
    FieldAddHist(DokumentON_RAION_B, BLR_edON_Raion, s);
  end else if fld.FieldName='ON_GOROD' then begin
    FieldAddHist(DokumentON_GOROD_B, BLR_edON_Gorod, s);

  end else if fld.FieldName='ONA_OBL' then begin
    FieldAddHist(DokumentONA_OBL_B, BLR_edONA_OBL, s);
  end else if fld.FieldName='ONA_RAION' then begin
    FieldAddHist(DokumentONA_RAION_B, BLR_edONA_Raion, s);
  end else if fld.FieldName='ONA_GOROD' then begin
    FieldAddHist(DokumentONA_GOROD_B, BLR_edONA_Gorod, s);

  end;
}
end;

//-----------------------------------------------------------
procedure TfmZapisBrak.SetSimpleVvod(sName:String);
var
  lSetEnabled:Boolean;
begin
  inherited;
  lSetEnabled:=(sName='');
  if sName='DEFAULT' then begin
    SetEnabledControls( [
    lbIN, ENG_edON_IDENTIF, ENG_edONA_IDENTIF,
    label15, edON_WORK, edONA_WORK, label16, edON_OBRAZ, edONA_OBRAZ,
    label31, edON_DOK_TYPE, edON_DOK_SERIA, edON_DOK_NOMER, edON_DOK_DATE, label69, edON_DOKUMENT,
             edONA_DOK_TYPE, edONA_DOK_SERIA, edONA_DOK_NOMER, edONA_DOK_DATE, label70, edONA_DOKUMENT,
    label25, cbON_VUS,  edON_Voenkom, cbONA_VUS,  edONA_Voenkom,
    label33, edON_SVID, edONA_SVID, gbDeti
    ], lSetEnabled);
  end;
  if lSetEnabled then begin

  end else begin
    TbItemVerno.Checked:=true;
    EditDataSet(Dokument);
    DokumentDECL_ID.AsInteger:=1;
    PostDataSet(Dokument);
  end;
end;

procedure TfmZapisBrak.GridRSGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not tbReshSudCANCEL.IsNull and (tbReshSudCANCEL.AsBoolean=false)
    then AFont.Color:=clRed;
end;

procedure TfmZapisBrak.lbON_REG_DATE_TILLGetText(Sender: TObject;  var Text: String);
begin
  if DokumentON_REG_DATE_TILL.IsNull
    then Text:=''
    else Text:='убыл '+DatePropis(DokumentON_REG_DATE_TILL.AsDateTime,3)+'г.';
end;

procedure TfmZapisBrak.lbONA_REG_DATE_TILLGetText(Sender: TObject; var Text: String);
begin
  if DokumentONA_REG_DATE_TILL.IsNull
    then Text:=''
    else Text:='убыла '+DatePropis(DokumentONA_REG_DATE_TILL.AsDateTime,3)+'г.';
end;

procedure TfmZapisBrak.N_F_lbON_StatusClick(Sender: TObject);
begin  ClearStatus(DokumentON_STATUS); end;

procedure TfmZapisBrak.N_F_lbON_StatusGetText(Sender: TObject; var Text: String);
begin Text:=GetStatus(DokumentON_STATUS); end;

procedure TfmZapisBrak.N_F_lbONA_StatusClick(Sender: TObject);
begin ClearStatus(DokumentONA_STATUS); end;

procedure TfmZapisBrak.N_F_lbONA_StatusGetText(Sender: TObject;  var Text: String);
begin Text:=GetStatus(DokumentONA_STATUS);  end;

procedure TfmZapisBrak.N_F_lbON_SEMGetText(Sender: TObject; var Text: String);
begin
  if DokumentON_SEM.AsInteger=SEM_BRAK  // состоит в браке
    then Text:='СОСТОИТ В БРАКЕ!'
    else Text:='';
end;

procedure TfmZapisBrak.N_F_lbONA_SEMGetText(Sender: TObject;  var Text: String);
begin
  if DokumentONA_SEM.AsInteger=SEM_BRAK  // состоит в браке
    then Text:='СОСТОИТ В БРАКЕ!'
    else Text:='';
end;

procedure TfmZapisBrak.TBItemChNameClick(Sender: TObject);
var
  s, strErr, sIzm : String;
  slIzm:TStringList;
  l:Boolean;
  i:Integer;
begin
  if not FNewDataSet.FieldByName('Z_DATE').IsNull then begin
//old    ShowMessage('В заявлении о перемене ФИО уже заполнена дата внесения изменений!');
    ShowMessage('В заявлении об изменении фамилии уже заполнена дата внесения изменений!');
    exit;
  end;

//old  if not Problem('Внести изменения из заявления о перемени ФИО ?',mtConfirmation,self) then exit;
  if not Problem('Внести изменения из заявления об изменении фамилии ?',mtConfirmation,self) then exit;
  FRun:=true;
  l:=dbDisableControls(Dokument);
  slIzm:=TStringList.Create;
  try

    EditDataSet(Dokument);
    if (FNewDataSet.FieldByName('POL').AsString='Ж') then begin
      s:='невесты';
      FieldAddHist(DokumentONA_FamiliaP, edONA_FamiliaP, strErr);
      FieldAddHist(DokumentONA_FamiliaP_B, BLR_edONA_FamiliaP, strErr);
      FieldAddHist(DokumentONA_FamiliaP_B, BLR_edONA_FamiliaP, strErr);
//old      DokumentONA_FamiliaP.AsString:=FNewDataSet.FieldByName('FamiliaPosle').AsString;
//old      DokumentONA_FamiliaP_B.AsString:=FNewDataSet.FieldByName('FamiliaPosle_B').AsString;
      DokumentONA_FamiliaP.AsString:=FNewDataSet.FieldByName('FamiliaNa').AsString;
      DokumentONA_FamiliaP_B.AsString:=FNewDataSet.FieldByName('FamiliaNa_B').AsString;
    end else begin
      s:='жениха';
      FieldAddHist(DokumentON_FamiliaP, edON_FamiliaP, strErr);
      FieldAddHist(DokumentON_FamiliaP_B, BLR_edON_FamiliaP, strErr);
//old      DokumentON_FamiliaP.AsString:=FNewDataSet.FieldByName('FamiliaPosle').AsString;
//old      DokumentON_FamiliaP_B.AsString:=FNewDataSet.FieldByName('FamiliaPosle_B').AsString;
      DokumentON_FamiliaP.AsString:=FNewDataSet.FieldByName('FamiliaNa').AsString;
      DokumentON_FamiliaP_B.AsString:=FNewDataSet.FieldByName('FamiliaNa_B').AsString;
    end;
//old    slIzm.Add('фамилия '+s+' с '+FNewDataSet.FieldByName('FAMILIADO').AsString+' на '+FNewDataSet.FieldByName('FAMILIAPOSLE').AsString);
    slIzm.Add('фамилия '+s+' с '+FNewDataSet.FieldByName('FAMILIA').AsString+' на '+FNewDataSet.FieldByName('FAMILIANA').AsString);

    //-------------------------------------------------------------------------------------
    if slIzm.Count>0 then begin
      if DokumentIZMEN.AsString<>''
        then DokumentIZMEN.AsString:=DokumentIZMEN.AsString+#13;
      if slIzm.Count=1 then sIzm:='Изменена ' else sIzm:='Изменены ';
      for i:=0 to slIzm.Count-1 do begin
        sIzm:=sIzm+slIzm.Strings[i]+'; ';
      end;
      sIzm:=Copy(sIzm,1,Length(sIzm)-2);
//old      sIzm:=sIzm+' на основании записи акта о перемене фамилии, имени, отчества № '+FNewDataSet.FieldByName('NOMER').AsString+' от '+
//                FormatDateTime('dd.mm.yyyy', FNewDataSet.FieldByName('DATEZ').AsDateTime)+', совершенной в '+
//                fmMain.SprNameOrg(FNewDataSet.FieldByName('ID_ZAGS').AsInteger,'','П',FNewDataSet.FieldByName('NAME_ZAGS').AsString)+'.';
//ЗАЯВЛЕНИЕ СОСТАВЛЕНО ???
      sIzm:=sIzm+' на основании заявления об изменении фамилии, избранной при заключении брака № '+FNewDataSet.FieldByName('NOMER').AsString+' от '+
      FormatDateTime('dd.mm.yyyy', FNewDataSet.FieldByName('DATEZ').AsDateTime)+', составленного в '+
      fmMain.SprNameOrg(FNewDataSet.FieldByName('ID_ZAGS').AsInteger,'','П',FNewDataSet.FieldByName('NAME_ZAGS').AsString)+'.';
      if DokumentIZMEN.AsString<>''
        then sIzm:=DokumentIZMEN.AsString+sIzm;
      DokumentIZMEN.AsString:=sIzm;
    end;

    PostDataSet(Dokument);

    // запишем дату внесения изменений в заявление о перемене ФИО
    EditDataSet(FNewDataSet);
    FNewDataSet.FieldByName('Z_DATE').AsDateTime:=Date;
    PostDataSet(FNewDataSet);

  finally
    FRun:=false;
    dbEnableControls(Dokument,l);
    TBItemChName.Enabled:=false;
    FNewDataSet:=nil;
    slIzm.Free;
  end;
end;

function TfmZapisBrak.CheckDateEditGIS: Boolean;
begin
  Result:=false;
  if Gisun.GetPoleGrn(DokumentPOLE_GRN)=rPost then begin
// номер и дата записи, свидетельство, ИН, фамилия после брака
  if (DokumentNOMER.AsString<>FMainTable.FieldByName('NOMER').AsString) or
     (DokumentDATEZ.AsString<>FMainTable.FieldByName('DATEZ').AsString) or
     (DokumentSVID_SERIA.AsString<>FMainTable.FieldByName('SVID_SERIA').AsString) or
     (DokumentSVID_NOMER.AsString<>FMainTable.FieldByName('SVID_NOMER').AsString) or
     (DokumentDATESV.AsString<>FMainTable.FieldByName('DATESV').AsString) or
     (ce_fio(DokumentON_FamiliaP.AsString)<>ce_fio(FMainTable.FieldByName('ON_FamiliaP').AsString)) or
     (ce_fio(DokumentON_FamiliaP_B.AsString)<>ce_fio(FMainTable.FieldByName('ON_FamiliaP_B').AsString)) or
     (ce_fio(DokumentONA_FamiliaP.AsString)<>ce_fio(FMainTable.FieldByName('ONA_FamiliaP').AsString)) or
     (ce_fio(DokumentONA_FamiliaP_B.AsString)<>ce_fio(FMainTable.FieldByName('ONA_FamiliaP_B').AsString)) or
     (DokumentON_IDENTIF.AsString<>FMainTable.FieldByName('ON_IDENTIF').AsString) or
     (DokumentONA_IDENTIF.AsString<>FMainTable.FieldByName('ONA_IDENTIF').AsString)
    then Result:=true
    else Result:=false;
  end;
end;
//-----------------------------------------------------------
procedure TfmZapisBrak.WriteAfterRegister_GISUN;
begin
  try
    EditDataSet(Dokument);
    DokumentON_B_RESP.AsBoolean:=false;
    Dokument.Post;
    FMainTable.FieldByName('ON_B_RESP').AsBoolean:=false;
  except
  end;
end;

procedure TfmZapisBrak.dsDetiDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) and not IsReadDokument then begin
    QueryExit:=true;
  end;
end;

end.
