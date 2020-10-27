unit fZapisRogd;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, QStrings, uDataSet2XML, mPermit, NewDialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, sndKey32, fEnterDokument, HunSpellDbMemo, Menus,
  ImgList, FR_DSet, FR_DBSet, ExtCtrls, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, dBase, funcPr, dbFunc, uCheckKod, uTypes,
  MetaTAsk, OpisEdit, uProjectAll,vchDBCtrls, TB2ExtItems, adsdata,adsfunc, adstable,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  Buttons, DBCtrls, Grids, DBGridEh, DateUtils, kbmMemCSVStreamFormat,
  ZipForge;

type
  TfmZapisRogd = class(TfmSimpleD)
    pn: TPanel;
    pc: TPageControl;
    tsChild: TTabSheet;
    tsFaser: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    Label5: TLabel;
    edDateR: TDBDateTimeEditEh;
    edPol: TDBComboBoxEh;
    Label6: TLabel;
    Label9: TLabel;
    lbON: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbDater_Rodit: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edON_Familia: TDBEditEh;
    edON_Name: TDBEditEh;                   
    edON_OTCH: TDBEditEh;
    edON_DATER: TDBDateTimeEditEh;
    edON_GOSUD: TDBLookupComboboxEh;
    edON_GOROD: TDBEditEh;
    edON_NATION: TDBLookupComboboxEh;
    edON_GRAG: TDBLookupComboboxEh;
    edON_WORK: TDBEditEh;
    edON_B_OBL: TDBCheckBoxEh;
    lbONA: TLabel;
    edONA_Familia: TDBEditEh;
    edONA_Name: TDBEditEh;
    edONA_OTCH: TDBEditEh;
    edONA_DATER: TDBDateTimeEditEh;
    edONA_GOSUD: TDBLookupComboboxEh;
    edONA_GOROD: TDBEditEh;
    edONA_NATION: TDBLookupComboboxEh;
    edONA_GRAG: TDBLookupComboboxEh;
    edONA_WORK: TDBEditEh;
    edONA_B_OBL: TDBCheckBoxEh;
    edGivorogd: TDBComboBoxEh;
    edTypeRod: TDBComboBoxEh;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    gbSved: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    edGOSUD: TDBLookupComboboxEh;
    BLR_edOBL: TDBEditEh;
    lbObl: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edGOROD: TDBEditEh;
    BLR_edRAION: TDBEditEh;
    Label35: TLabel;
    tsAdd: TTabSheet;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    edON_SVID: TDBEditEh;
    edONA_SVID: TDBEditEh;
    edDecl: TDBEditEh;
    edSVED: TDBComboBoxEh;
    edSVED_SVID: TDBEditEh;
    lbNomer: TLabel;
    edNomer: TDBEditEh;
    Label8: TLabel;
    edDateZ: TDBDateTimeEditEh;
    lbSvid: TLabel;
    edSvid_Nomer: TDBEditEh;
    edSP_J: TDBDateTimeEditEh;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    edSP_C: TDBDateTimeEditEh;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentSVID_NOMER: TStringField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentDateR: TDateField;
    DokumentGOSUD: TIntegerField;
    DokumentOBL: TStringField;
    DokumentRAION: TStringField;
    DokumentGOROD: TStringField;
    DokumentPOL: TStringField;
    DokumentTYPEROD: TSmallintField;
    DokumentGIVOROGD: TBooleanField;
    DokumentSCHET: TSmallintField;
    DokumentOSTAT: TSmallintField;
    DokumentMASSA: TSmallintField;
    DokumentSP_A: TSmallintField;
    DokumentSP_B: TSmallintField;
    DokumentSP_C: TDateField;
    DokumentSP_D: TSmallintField;
    DokumentSP_E: TSmallintField;
    DokumentSP_F: TSmallintField;
    DokumentSP_G: TSmallintField;
    DokumentSP_H: TSmallintField;
    DokumentSP_I: TSmallintField;
    DokumentSP_J: TDateField;
    DokumentSP_K: TSmallintField;
    DokumentDOKUMENT: TMemoField;
    DokumentON_ID: TIntegerField;
    DokumentON_Familia: TStringField;
    DokumentON_Name: TStringField;
    DokumentON_Otch: TStringField;
    DokumentON_DateR: TDateField;
    DokumentON_NATION: TIntegerField;
    DokumentON_GRAG: TIntegerField;
    DokumentON_SOATO: TStringField;
    DokumentON_GOSUD: TIntegerField;
    DokumentON_OBL: TStringField;
    DokumentON_RAION: TStringField;
    DokumentON_GOROD: TStringField;
    DokumentON_GOROD_R: TStringField;
    DokumentON_WORK: TStringField;
    DokumentON_OBRAZ: TIntegerField;
    DokumentON_DOKUMENT: TMemoField;
    DokumentOTMETKA: TMemoField;
    DokumentON_B_RESP: TBooleanField;
    DokumentON_B_OBL: TBooleanField;
    DokumentONA_ID: TIntegerField;
    DokumentONA_Familia: TStringField;
    DokumentONA_Name: TStringField;
    DokumentONA_Otch: TStringField;
    DokumentONA_DateR: TDateField;
    DokumentONA_NATION: TIntegerField;
    DokumentONA_GRAG: TIntegerField;
    DokumentONA_SOATO: TStringField;
    DokumentONA_GOSUD: TIntegerField;
    DokumentONA_OBL: TStringField;
    DokumentONA_RAION: TStringField;
    DokumentONA_GOROD: TStringField;
    DokumentONA_GOROD_R: TStringField;
    DokumentONA_WORK: TStringField;
    DokumentONA_OBRAZ: TIntegerField;
    DokumentONA_DOKUMENT: TMemoField;
    DokumentONA_B_RESP: TBooleanField;
    DokumentONA_B_OBL: TBooleanField;
    DokumentSVED: TSmallintField;
    DokumentSVED_SVID: TMemoField;
    DokumentON_SVID: TStringField;
    DokumentONA_SVID: TStringField;
    DokumentRUKOV: TStringField;
    DokumentB_RESP: TBooleanField;
    DokumentB_OBL: TBooleanField;
    N_F_1: TDBCheckBoxEh;
    DokumentFirst_Ekz: TBooleanField;
    edSchet: TDBNumberEditEh;
    edOstat: TDBNumberEditEh;
    edMassa: TDBNumberEditEh;
    edDlina: TDBNumberEditEh;
    edDokument: TDBEditEh;
    dsNation: TDataSource;
    dsStran: TDataSource;
    edTimeR: TDBDateTimeEditEh;
    DokumentTimeR: TTimeField;
    edON_GOROD_R: TDBEditEh;
    Label53: TLabel;
    edONA_GOROD_R: TDBEditEh;
    DokumentLICH_ID: TIntegerField;
    gbLich: TGroupBox;
    lbLich: TvchDBText;
    DokumentCHILD_ID: TIntegerField;
    TBItemClearLich: TTBItem;
    DokumentSVID_SERIA: TStringField;
    Label55: TLabel;
    edRukov: TDBEditEh;
    DokumentPROV: TBooleanField;
    cbProvDvig: TDBCheckBoxEh;
    DokumentName_B: TStringField;
    DokumentOtch_B: TStringField;
    DokumentOBL_B: TStringField;
    DokumentRAION_B: TStringField;
    DokumentGOROD_B: TStringField;
    DokumentON_Familia_B: TStringField;
    DokumentON_Name_B: TStringField;
    DokumentON_Otch_B: TStringField;
    DokumentONA_Familia_B: TStringField;
    DokumentONA_Name_B: TStringField;
    DokumentONA_Otch_B: TStringField;
    DokumentRukov_B: TStringField;
    DokumentFamilia_B: TStringField;
    edDateSv: TDBDateTimeEditEh;
    Label56: TLabel;
    DokumentDateSV: TDateField;
    DokumentSPEC: TStringField;
    DokumentVOSSTAN: TBooleanField;
    edSpec: TDBEditEh;
    DokumentID_ZAGS: TIntegerField;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    edIzmen: TDBEditEh;
    Label59: TLabel;
    dsGragd: TDataSource;
    DokumentON_ONLYGOD: TBooleanField;
    DokumentONA_ONLYGOD: TBooleanField;
    cbOnlyGodON: TDBCheckBoxEh;
    cbOnlyGodONA: TDBCheckBoxEh;
    N_F_edCopy: TDBCheckBoxEh;
    DokumentCOPIA: TBooleanField;
    DokumentFIRSTWEEK: TBooleanField;
    N_F_cbFirstWeek: TDBCheckBoxEh;
    DokumentDATES: TDateField;
    lbDateS: TLabel;
    edDateS: TDBDateTimeEditEh;
    tsSprav: TTabSheet;
    DokumentARX_TYPE: TSmallintField;
    DokumentARX_NOMER: TStringField;
    DokumentARX_DATE: TDateField;
    DokumentARX_ADRESAT: TMemoField;
    DokumentARX_TEXT: TMemoField;
    Label62: TLabel;
    Label63: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    edTypeSpr1: TDBComboBoxEh;
    edAddTextArx: TDBEditEh;
    edDateArxSpr: TDBDateTimeEditEh;
    edNomerArxSpr: TDBEditEh;
    edAdresat: TDBEditEh;
    TBItemArxSpr: TTBItem;
    DokumentSP_J_GOD: TStringField;
    edSP_J_GOD: TDBEditEh;
    DokumentSPRAV_NOMER: TStringField;
    DokumentSPRAV_DATE: TDateField;
    Label37: TLabel;
    edSprav_Nomer: TDBEditEh;
    Label68: TLabel;
    edSprav_Date: TDBDateTimeEditEh;
    edSVID_SERIA: TDBLookupComboboxEh;
    Label54: TLabel;
    SpeedButton: TSpeedButton;
    tsPovtor: TTabSheet;
    DokumentON_VOZR: TSmallintField;
    DokumentONA_VOZR: TSmallintField;
    TBItemVozrast: TTBItem;
    edON_VOZR: TDBNumberEditEh;
    edONA_VOZR: TDBNumberEditEh;
    DokumentDLINA: TFloatField;
    TBItemUstOtc: TTBItem;
    DokumentON_RNGOROD: TStringField;
    DokumentONA_RNGOROD: TStringField;
    edON_RNGOROD: TDBLookupComboboxEh;
    edONA_RNGOROD: TDBLookupComboboxEh;
    DokumentON_B_RN: TBooleanField;
    DokumentONA_B_RN: TBooleanField;
    DokumentGRAG: TIntegerField;
    DokumentON_IDENTIF: TStringField;
    DokumentONA_IDENTIF: TStringField;
    DokumentIDENTIF: TStringField;
    DokumentSTATUS: TStringField;
    DokumentONA_STATUS: TStringField;
    DokumentON_STATUS: TStringField;
    DokumentPOLE_GRN: TSmallintField;
    Label14: TLabel;
    ENG_edON_IDENTIF: TDBEditEh;
    ENG_edONA_IDENTIF: TDBEditEh;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    DokumentB_GOROD: TIntegerField;
    DokumentONA_B_GOROD: TIntegerField;
    DokumentON_B_GOROD: TIntegerField;
    edB_GOROD: TDBLookupComboboxEh;
    edON_B_GOROD: TDBLookupComboboxEh;
    edONA_B_GOROD: TDBLookupComboboxEh;
    N_F_cbBelorus: TDBCheckBoxEh;
    DokumentTYPEREG: TSmallintField;
    Label32: TLabel;
    btOtm: TButton;
    edOTMETKA: TDBEditEh;
    DokumentON_DOK_TYPE: TIntegerField;
    DokumentON_DOK_SERIA: TStringField;
    DokumentON_DOK_NOMER: TStringField;
    DokumentON_DOK_ORGAN: TIntegerField;
    DokumentON_DOK_DATE: TDateField;
    DokumentONA_DOK_TYPE: TIntegerField;
    DokumentONA_DOK_SERIA: TStringField;
    DokumentONA_DOK_NOMER: TStringField;
    DokumentONA_DOK_ORGAN: TIntegerField;
    DokumentONA_DOK_DATE: TDateField;
    DokumentTypeMessage: TStringField;
    ImageGISUN: TImage;
    DokumentON_M_B_RESP: TBooleanField;
    DokumentON_M_GOSUD: TIntegerField;
    DokumentON_M_B_OBL: TBooleanField;
    DokumentON_M_OBL: TStringField;
    DokumentON_M_RAION: TStringField;
    DokumentON_M_B_GOROD: TIntegerField;
    DokumentON_M_GOROD: TStringField;
    DokumentONA_M_B_RESP: TBooleanField;
    DokumentONA_M_GOSUD: TIntegerField;
    DokumentONA_M_B_OBL: TBooleanField;
    DokumentONA_M_OBL: TStringField;
    DokumentONA_M_RAION: TStringField;
    DokumentONA_M_B_GOROD: TIntegerField;
    DokumentONA_M_GOROD: TStringField;
    Label60: TLabel;
    Label61: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    edON_M_B_OBL: TDBCheckBoxEh;
    edON_M_GOSUD: TDBLookupComboboxEh;
    edON_M_B_GOROD: TDBLookupComboboxEh;
    edON_M_GOROD: TDBEditEh;
    edONA_M_B_OBL: TDBCheckBoxEh;
    edONA_M_GOSUD: TDBLookupComboboxEh;
    edONA_M_B_GOROD: TDBLookupComboboxEh;
    edONA_M_GOROD: TDBEditEh;
    Label75: TLabel;
    Label69: TLabel;
    edON_DOKUMENT: TDBEditEh;
    edON_DOK_TYPE: TDBComboBoxEh;
    edON_DOK_SERIA: TDBEditEh;
    edON_DOK_NOMER: TDBEditEh;
    edON_DOK_DATE: TDBDateTimeEditEh;
    Label70: TLabel;
    edONA_DOKUMENT: TDBEditEh;
    edONA_DOK_TYPE: TDBComboBoxEh;
    edONA_DOK_SERIA: TDBEditEh;
    edONA_DOK_NOMER: TDBEditEh;
    edONA_DOK_DATE: TDBDateTimeEditEh;
    lbIDENTIF: TLabel;
    ENG_edIDENTIF: TDBEditEh;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItemOtmena: TTBItem;
    TBItemNotOtmena: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItemRegPovtor: TTBItem;
    tsSvid: TTabSheet;
    Label76: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    BLR_edFamiliaB_Sv: TDBEditEh;
    BLR_edNameB_Sv: TDBEditEh;
    BLR_edOtchB_Sv: TDBEditEh;
    edDateR_Sv: TDBDateTimeEditEh;
    edPol_Sv: TDBComboBoxEh;
    edGosud_Sv: TDBLookupComboboxEh;
    BLR_edOblB_Sv: TDBEditEh;
    BLR_edGorodB_Sv: TDBEditEh;
    BLR_edRaionB_Sv: TDBEditEh;
    BLR_edTypeGorodB_Sv: TDBLookupComboboxEh;
    Label88: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    BLR_edON_FamiliaB_Sv: TDBEditEh;
    BLR_edON_NameB_Sv: TDBEditEh;
    BLR_edON_OtchB_Sv: TDBEditEh;
    BLR_edONA_FamiliaB_Sv: TDBEditEh;
    BLR_edOna_NameB_Sv: TDBEditEh;
    BLR_edOna_OtchB_Sv: TDBEditEh;
    Label77: TLabel;
    edFamilia_Sv: TDBEditEh;
    edName_Sv: TDBEditEh;
    edOtch_Sv: TDBEditEh;
    Label78: TLabel;
    edON_Nation_Sv: TDBLookupComboboxEh;
    edONA_Nation_Sv: TDBLookupComboboxEh;
    Label86: TLabel;
    Label87: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    edGorod_Sv: TDBEditEh;
    edTypeGorod_Sv: TDBLookupComboboxEh;
    edON_Familia_Sv: TDBEditEh;
    edON_Name_Sv: TDBEditEh;
    edON_Otch_Sv: TDBEditEh;
    edOna_Familia_Sv: TDBEditEh;
    edOna_Name_Sv: TDBEditEh;
    edOna_Otch_Sv: TDBEditEh;
    Label95: TLabel;
    edRukov_Sv: TDBEditEh;
    BLR_edRukovB_Sv: TDBEditEh;
    DokumentVIRT_ON_OTMETKA: TMemoField;
    DokumentVIRT_ONA_OTMETKA: TMemoField;
    lbVIRT_ON: TLabel;
    lbVIRT_ONA: TLabel;
    edVIRT_ONA_OTMETKA: TDBEditEh;
    edVIRT_ON_OTMETKA: TDBEditEh;
    BLR_edON_NATION_SV_B: TDBLookupComboboxEh;
    BLR_edONA_NATION_SV_B: TDBLookupComboboxEh;
    BLR_edGosud_Sv_B: TDBLookupComboboxEh;
    DokumentSPEC_B: TStringField;
    edSved_DateB: TDBDateTimeEditEh;
    DokumentSVED_DATEB: TDateField;
    lbSved_DateB: TLabel;
    DokumentNOTPRINT29: TBooleanField;
    Label96: TLabel;
    edON_SOATO: TDBEditEh;
    edONA_SOATO: TDBEditEh;
    lbON_SOATO: TvchDBText;
    lbONA_SOATO: TvchDBText;
    DokumentSVED_UST: TBooleanField;
    DokumentON_DATE_LR: TDateField;
    DokumentONA_DATE_LR: TDateField;
    lbRodPravON: TvchDBText;
    lbRidPravONA: TvchDBText;
    edOBL: TDBEditEh;
    edRaion: TDBEditEh;
    edON_M_OBL: TDBEditEh;
    edON_M_RAION: TDBEditEh;
    edONA_M_OBL: TDBEditEh;
    edONA_M_RAION: TDBEditEh;
    edOBL_Sv: TDBEditEh;
    edRAION_Sv: TDBEditEh;
    edON_OBL: TDBEditEh;
    edONA_OBL: TDBEditEh;
    edON_RAION: TDBEditEh;
    edONA_RAION: TDBEditEh;
    TBItemChoiceBrak: TTBItem;
    DokumentDECL: TMemoField;
    DokumentRN_B_GOROD: TStringField;
    DokumentRN_ON_M_B_GOROD: TStringField;
    DokumentRN_ON_B_GOROD: TStringField;
    DokumentRN_ONA_M_B_GOROD: TStringField;
    DokumentRN_ONA_B_GOROD: TStringField;
    edSvedAkt: TDBEditEh;
    lbSvedAkt: TLabel;
    lbOrganBrak: TLabel;
    DokumentON_DOM: TStringField;
    DokumentON_KORP: TStringField;
    DokumentON_KV: TStringField;
    DokumentONA_DOM: TStringField;
    DokumentONA_KORP: TStringField;
    DokumentONA_KV: TStringField;
    Label23: TLabel;
    edON_OBRAZ: TDBComboBoxEh;
    edONA_OBRAZ: TDBComboBoxEh;
    Label10: TLabel;
    Label11: TLabel;
    Label31: TLabel;
    Label74: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    edON_DOM: TDBEditEh;
    edON_KORP: TDBEditEh;
    edON_KV: TDBEditEh;
    edONA_DOM: TDBEditEh;
    edONA_KORP: TDBEditEh;
    edONA_KV: TDBEditEh;
    TBItemChoiceRogd: TTBItem;
    DokumentDUBL_SPR: TBooleanField;
    N_F_cbDublSpr: TDBCheckBoxEh;
    edSP_A: TDBNumberEditEh;
    edSP_F: TDBNumberEditEh;
    edSP_B: TDBNumberEditEh;
    edSP_G: TDBNumberEditEh;
    edSP_I: TDBNumberEditEh;
    edSP_D: TDBNumberEditEh;
    edSP_E: TDBNumberEditEh;
    edSP_K: TDBNumberEditEh;
    edSP_H: TDBNumberEditEh;
    gbON_LR: TGroupBox;
    Label99: TLabel;
    edON_SUDD_LR: TDBDateTimeEditEh;
    Label100: TLabel;
    edON_SUD_LR: TDBEditEh;
    Label101: TLabel;
    edON_DATE_LR: TDBDateTimeEditEh;
    DokumentON_SUD_LR: TMemoField;
    DokumentONA_SUD_LR: TMemoField;
    DokumentON_SUDD_LR: TDateField;
    DokumentONA_SUDD_LR: TDateField;
    gbONA_LR: TGroupBox;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    edONA_SUDD_LR: TDBDateTimeEditEh;
    edONA_SUD_LR: TDBEditEh;
    edONA_DATE_LR: TDBDateTimeEditEh;
    DokumentSVED_NOT_SVID: TBooleanField;
    N_F_SVED_NOT_SVID: TDBCheckBoxEh;
    DokumentSVED_AKT: TStringField;
    DokumentSOATO_ID: TIntegerField;
    DokumentATE_FULLNAME: TMemoField;
    Button1: TButton;
    Button2: TButton;
    DokumentTARIF: TFloatField;
    edDecl_Adres: TDBEditEh;
    Label106: TLabel;
    edDecl_Dok: TDBEditEh;
    Label107: TLabel;
    DokumentDECL_ADRES: TMemoField;
    DokumentDECL_DOK: TMemoField;
    lbTwoDecl: TLabel;
    edTwoDecl: TDBEditEh;
    DokumentTWO_DECL: TMemoField;
    DokumentDECL_ID: TIntegerField;
    cbObl: TDBCheckBoxEh;
    lbBLRFam: TLabel;
    BLR_edFamilia: TDBEditEh;
    lbBLRName: TLabel;
    BLR_edName: TDBEditEh;
    lbBLROtch: TLabel;
    BLR_edOtch: TDBEditEh;
    lbATE2: TLabel;
    btSetATE: TBitBtn;
    btClearATE: TBitBtn;
    lbATE: TvchDBText;
    BLR_edGorod: TDBEditEh;
    edGosud_B: TDBLookupComboboxEh;
    BLR_edON_Name: TDBEditEh;
    BLR_edON_Otch: TDBEditEh;
    BLR_edONA_Name: TDBEditEh;
    BLR_edONA_Otch: TDBEditEh;
    BLR_edON_Familia: TDBEditEh;
    BLR_edONA_Familia: TDBEditEh;
    N_F_cbPovtor: TDBCheckBoxEh;
    lbON_Sv: TLabel;
    lbONA_Sv: TLabel;
    DokumentZAKL_IN_NOMER: TStringField;                         
    DokumentZAKL_IN_DATE: TDateField;
    Label7: TLabel;                                                       
    edZaklINNomer: TDBEditEh;
    Label40: TLabel;
    edZaklINDate: TDBDateTimeEditEh;
    DokumentON_GRAG_ADD: TMemoField;
    DokumentONA_GRAG_ADD: TMemoField;
    DokumentON_VOENKOM: TIntegerField;
    DokumentONA_VOENKOM: TIntegerField;
    Label89: TLabel;
    edON_Voenkom: TDBLookupComboboxEh;
    edONA_VOENKOM: TDBLookupComboboxEh;
    DokumentONLYGOD: TBooleanField;
    edSP_C_GOD: TDBEditEh;
    DokumentSP_C_GOD: TStringField;
    DokumentIS_WRITE: TBooleanField;
    DokumentON_CHERN: TSmallintField;
    DokumentONA_CHERN: TSmallintField;
    DokumentADD_SPR: TMemoField;
    edAddSpr: TDBEditEh;
    DokumentTYPE_SPRAV: TSmallintField;
    N_F_cbTypeSprav: TDBComboBoxEh;
    DokumentVERNO: TBooleanField;
    DokumentSVIDNOT: TBooleanField;
    dsWriteDecl: TDataSource;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    TBItemAdopt: TTBItem;
    BLR_edB_GOROD: TDBLookupComboboxEh;
    btLR_ONA: TSpeedButton;
    btLR_ON: TSpeedButton;
    TBItemStep2NotSvid: TTBItem;
    N_F_lbON_Status: TvchDBText;
    N_F_lbONA_Status: TvchDBText;
    DokumentTORGESTV: TSmallintField;
    lbTypeReg: TLabel;
    edTypeReg: TDBComboBoxEh;
    edON_DOPSVED: TDBEditEh;
    edONA_DOPSVED: TDBEditEh;
    lbDopSved: TLabel;
    DokumentONA_DOPSVED: TStringField;
    DokumentON_DOPSVED: TStringField;
    N_F_cbIsWrite: TDBCheckBoxEh;
    lbWriteDecl: TLabel;
    edWriteDecl: TDBLookupComboboxEh;
    edSvedMat: TDBComboBoxEh;
    edTorgestv: TDBComboBoxEh;
    Label105: TLabel;
    edTarif: TDBNumberEditEh;
    Label30: TLabel;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    DokumentCHERN: TSmallintField;
    DokumentON_ATEID: TIntegerField;
    DokumentONA_ATEID: TIntegerField;
    TBItemGetChild: TTBItem;
    procedure edON_FamiliaEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edONA_FamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure lbLichGetText(Sender: TObject; var Text: String);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure TBItemClearLichClick(Sender: TObject);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edFamiliaEnter(Sender: TObject);
    procedure edNameEnter(Sender: TObject);
    procedure edOtchEnter(Sender: TObject);
    procedure edON_FamiliaEnter(Sender: TObject);
    procedure edON_NameEnter(Sender: TObject);
    procedure edON_OTCHEnter(Sender: TObject);
    procedure edONA_FamiliaEnter(Sender: TObject);
    procedure edONA_NameEnter(Sender: TObject);
    procedure edONA_OTCHEnter(Sender: TObject);
    procedure edFamiliaCheckDrawRequiredState(Sender: TObject;   var DrawState: Boolean);
    procedure edRukovEnter(Sender: TObject);
    procedure cbOnlyGodONClick(Sender: TObject);
    procedure edDeclEnter(Sender: TObject);
    procedure btOtmClick(Sender: TObject);
    procedure TBItemArxSprClick(Sender: TObject);
    procedure edTypeSpr1Change(Sender: TObject);
    procedure edSP_JEditButtons0Click(Sender: TObject;          var Handled: Boolean);
    procedure edSP_J_GODEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edRAION_BChange(Sender: TObject);
//    procedure edOBL_RNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
    procedure SpeedButtonClick(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure TBItemVozrastClick(Sender: TObject);
    procedure edRaion_RNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure TBItemUstOtcClick(Sender: TObject);
    procedure edON_RNGORODNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure edSVED_SVIDEnter(Sender: TObject);
    procedure TBItemStep11Click(Sender: TObject);
    procedure TBItemStep22Click(Sender: TObject);
    procedure edON_M_OBLNotInList(Sender: TObject; NewText: String;        var RecheckInList: Boolean);
    procedure edONA_M_OBLNotInList(Sender: TObject; NewText: String;       var RecheckInList: Boolean);
    procedure TBItemOtmenaClick(Sender: TObject);
    procedure TBItemNotOtmenaClick(Sender: TObject);
    procedure TBItemRegPovtorClick(Sender: TObject);
    procedure edSprav_NomerEnter(Sender: TObject);
    procedure edSpecEnter(Sender: TObject);
    procedure edDateRUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSVEDChange(Sender: TObject);
    procedure lbON_SOATOGetText(Sender: TObject; var Text: String);
    procedure lbONA_SOATOGetText(Sender: TObject; var Text: String);
    procedure edON_SOATOClick(Sender: TObject);
    procedure edONA_SOATOClick(Sender: TObject);
    procedure edDeclEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edON_DATERUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edONA_DATERUpdateData(Sender: TObject; var Handled: Boolean);
    procedure TBItemChoiceBrakClick(Sender: TObject);
    procedure TBItemChoiceRogdClick(Sender: TObject);
    procedure lbATEGetText(Sender: TObject; var Text: String);
    procedure edOBLUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edDeclEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure edDeclEditButtons2Click(Sender: TObject; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure btSetATEClick(Sender: TObject);
    procedure btClearATEClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edDokumentEnter(Sender: TObject);
    procedure edDecl_DokEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure N_F_cbTorgestClick(Sender: TObject);
    procedure edTwoDeclEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edTwoDeclEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure edON_GOSUDUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edONA_GOSUDUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSP_AUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edMassaUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edDlinaUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSchetUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSP_BUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSP_DUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSP_EUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSP_FUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSP_GUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSP_HUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSP_IUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edSP_KUpdateData(Sender: TObject; var Handled: Boolean);
    procedure ENG_edIDENTIFEditButtons0Click(Sender: TObject;     var Handled: Boolean);
    procedure edON_FamiliaEditButtons1Click(Sender: TObject;    var Handled: Boolean);
    procedure edON_DATERCheckDrawRequiredState(Sender: TObject;   var DrawState: Boolean);
    procedure ENG_edONA_IDENTIFCheckDrawRequiredState(Sender: TObject;  var DrawState: Boolean);
    procedure edDecl_AdresEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edRukov_SvEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure N_F_cbFirstWeekClick(Sender: TObject);
    procedure edON_VoenkomEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edON_VoenkomEditButtons1Click(Sender: TObject;    var Handled: Boolean);
    procedure edON_VoenkomEditButtons2Click(Sender: TObject;    var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure edONA_VOENKOMEditButtons2Click(Sender: TObject;   var Handled: Boolean);
    procedure edSP_C_GODEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSP_CEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure N_F_cbDublSprClick(Sender: TObject);
    procedure N_F_cbTypeSpravChange(Sender: TObject);
    procedure edOTMETKADblClick(Sender: TObject);
    procedure TBItemEditMemoClick(Sender: TObject);
    procedure edSpecEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure TBItemAdoptClick(Sender: TObject);
    procedure btLR_ONAClick(Sender: TObject);
    procedure btLR_ONClick(Sender: TObject);
    procedure TBItemStep2NotSvidClick(Sender: TObject);
    procedure cbOblClick(Sender: TObject);
    procedure N_F_lbONA_StatusGetText(Sender: TObject; var Text: String);
    procedure N_F_lbON_StatusGetText(Sender: TObject; var Text: String);
    procedure N_F_lbON_StatusClick(Sender: TObject);
    procedure N_F_lbONA_StatusClick(Sender: TObject);
    procedure edTorgestvChange(Sender: TObject);
    procedure edTypeRegChange(Sender: TObject);
    procedure edWriteDeclChange(Sender: TObject);
    procedure TBItemGetChildClick(Sender: TObject);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    TbItemQueryIN : TTbItem;
    TbItemSpecSved: TTbItem;
    TbItemSvidNot: TTbItem;
    FNewSved : Boolean;
    FOnOtnosh:Integer;
    FOnaOtnosh:Integer;
    FOnLic:Integer;
    FOnaLic:Integer;
    FOnCheckSOATO:Boolean;
    FOnaCheckSOATO:Boolean;
    FQueryINChild:Boolean;
//    FTrueSpecSved:Boolean;

    function BeforeReport:Boolean; override;
    function SvidNotFromDeclID(n:Integer):Boolean;
    procedure ValuesFromDeclID;
    function ValuesToDeclID:Integer;
    procedure SetColorChild(c:TColor);

    procedure Event_QyeryINChild(Sender: TObject);
    procedure Event_TrueSpecSved(Sender: TObject);
    procedure Event_RodPravON(Sender: TObject);
    procedure Event_Clear_(s:String);
    procedure Event_ClearOtec(Sender: TObject);
    procedure Event_ClearMat(Sender: TObject);
    procedure Event_RodPravONA(Sender: TObject);
    procedure Event_DateS(Sender: TObject);
    procedure Event_SvidNot(Sender: TObject);
    procedure Event_Torgest(Sender: TObject);
    procedure Event_Not30(Sender: TObject);

    procedure CheckControlSved(lBrak:Boolean);
    procedure CheckNewSved;

    procedure btLRClick(ss:String);

    procedure SetOnlyPovtorSvid(lOnlyPovtor:Boolean;pc:TPageControl; ts:TWinControl; NonVisibleControls : array of TVarRec; lbSvid,lbNomer:TLabel); override;
    function CheckDokumentSimple(nType:Integer; lWriteDok:Boolean):Boolean; override;

    procedure CheckSOATOAkt(lOn,lOna:Boolean; lCheckVoenkom:Boolean; strParam:String; nAteID:Integer; strSoato:String);
    function SpravEnabled:Boolean;

    function CreateSubMenuRun:Boolean; override;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure UpdateActions; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    function BeforeEdit : Boolean; override;
    procedure CheckOnlyGod;
    procedure ReadLastAddDok; override;

    procedure CheckOnlyVozrast(lClear : Boolean);
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure CheckRnGorod;
//    function CheckAddPanel(var Text : String):Boolean; override;
    procedure CheckasNew; override;
    procedure WriteDvigChild( nIDMen : Integer; dDateP:TDateTime);
    function EmptyIzm: String; override;
    function GetAddPROP(sProp:String):Variant; override;
    function DefaultNewSved:Boolean;
    procedure CheckLishRodPrav;
    function getDecl(lMale:Boolean; var arr:TArrStrings):String;
    procedure CheckControlSvid;
    function CheckFIO:String; override;
    procedure AfterReadDok; override;

    procedure ClearATE;
    procedure CityUpdate2(Sender: TObject; var Handled: Boolean);
    procedure GetATE;
    procedure CheckATE;
    procedure AddUserHist; override;
    procedure FieldAddHistDop(fld : TField; ActControl:TWinControl); override;
    function EnableHistoryControl(ActControl:TWinControl):Boolean; override;
    procedure SetSimpleVvod(sName:String); override;

    procedure WriteVOENKOM(nType:Integer; lCheckVozr:Boolean);
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;

  end;

  function EditZapisRogd( nID : Integer; dsUstOtc : TDataSet; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;

var
  fmZapisRogd: TfmZapisRogd;
  FCreateAkt:Boolean;

implementation

uses fMain, fChoiceNasel, fShablon, uProject, fVvodDecl, fHistory, fGetGISUN1,
  StrUtils;

{$R *.DFM}
{$I Task.inc}

function EditZapisRogd( nID : Integer; dsUstOtc : TDataSet; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;
//var
//  s:String;
begin
  result := false;
  try
    if FCreateAkt then begin   // уже находимся в режиме создания з/а
      exit;
    end;
    FCreateAkt:=true;
  //  AsChild:=true;
  //  fmZapisRogd := TfmZapisRogd.Create(nil);
    if AsChild
      then fmZapisRogd:=TfmZapisRogd.CreateMDI(Application)
      else fmZapisRogd:=TfmZapisRogd.Create(nil);
    fmZapisRogd.IsCreateForm:=false;

  //  fmZapisRogd.writetodebug([inttostr(nID)+' '+inttostr(gettickcount)]);
//    Globaltask.LogFile.WriteToLogFile(inttostr(gettickcount));
    fmZapisRogd.AssignPar(slPar);
    fmZapisRogd.TBItemUstOtc.Visible:=false;
    fmZapisRogd.TBItemAdopt.Visible:=false;
    if dsUstOtc<>nil then begin
      if dsUstOtc.FindField('BRAK_M')<>nil then begin  // значит из усыновления
        fmZapisRogd.TBItemAdopt.Visible:=true;
        fmZapisRogd.FTypeNewDataSet := _TypeObj_ZAdopt;
      end else begin
        fmZapisRogd.TBItemUstOtc.Visible:=true;
        fmZapisRogd.FTypeNewDataSet := _TypeObj_ZUstOtc;
      end;
      fmZapisRogd.pc.ActivePageIndex:=1;
    end;
    fmZapisRogd.FNewDataSet := dsUstOtc;

    with fmZapisRogd do begin
      SetOnlyPovtorSvid(lOnlyPovtor, pc, tsSvid, [ N_F_1, N_F_edTypeEkz, N_F_cbPovtor, N_F_cbBelorus ], lbSvid,lbNomer);
      {$IFDEF ZAGS}
        if not lOnlyPovtor and (dsUstOtc=nil)  then begin
          TBItemSprAkt.Visible:=true;      // доступность получения справки о записи акта
          TBItemDeclSvid.Visible:=true;
        end;
        TBItemGetChild.Visible:=true;
      {$ELSE}
        TBItemGetChild.Visible:=false;
      {$ENDIF}
    end;

    if GlobalTask.ParamAsBoolean('ENABLE_GOD') then begin
      fmZapisRogd.cbOnlyGodON.Visible:=true;
      fmZapisRogd.cbOnlyGodONA.Visible:=true;
    end else begin
      fmZapisRogd.cbOnlyGodON.Visible:=false;
      fmZapisRogd.cbOnlyGodONA.Visible:=false;
    end;
    try
      fmZapisRogd.IsReadDokument:=true;
      if nID=-1 then begin
        fmZapisRogd.NewDok(true);
        fmZapisRogd.SetIDZags;
        fmZapisRogd.CheckEnabledNameOrgan(true);
      end else begin
        fmZapisRogd.ReadDok( nID );

        {    !!! для возможности печати не открывая документ !!!
        s:=fmZapisRogd.GetNameReport;
        s:=GlobalTask.MenuReport(s);
        if s<>'' then begin
          GlobalTask.PreViewReport(s);
        end;
        }

        fmZapisRogd.TBItemZAGS.Visible:=false;
        fmZapisRogd.CheckEnabledNameOrgan(false);
      end;
      fmZapisRogd.IsReadDokument:=false;
      with fmZapisRogd do begin
        CheckOtmenka_Load(edOtmetka,edVirt_ON_Otmetka,edVirt_ONA_Otmetka,
                          'OTMETKA','VIRT_ON_OTMETKA','VIRT_ONA_OTMETKA',lbVIRT_ON,lbVIRT_ONA,btOtm);
        QueryExit:=false;
      end;
      {$IFDEF GISUN}
        fmZapisRogd.CheckAkt_GISUN(0);
  //      Gisun.CheckAkt(fmZapisRogd);
  //      fmZapisRogd.CheckImageGisun(fmZapisRogd.DokumentPOLE_GRN,fmZapisRogd.ImageGISUN);
        fmZapisRogd.BeforeEditFormGISUN;
  //      fmZapisRogd.lbATE.Visible:=IsActiveGISUN;
      {$ELSE}
  //      fmZapisRogd.lbATE.Visible:=false;
      {$ENDIF}

      if AsChild then begin
        fmZapisRogd.EditChild;
      end else begin
        result := fmZapisRogd.EditModal;
      end;
    finally
      if not AsChild then begin
        fmZapisRogd.Free;
        fmZapisRogd := nil;
      end;
    end;
  finally
    FCreateAkt:=false;
  end;
  Application.ProcessMessages;
end;

{ TfmZapisRogd }

constructor TfmZapisRogd.Create(Owner: TComponent);
var
  aw : TAddControl;
  l:Boolean;
  n:Integer;
//  bmp:TBitmap;
  s:String;
//  h:THunSpellDbMemo;
begin
  inherited;
  dsWriteDecl.DataSet:=dmBase.SprWriteDecl;
  {$IFDEF ZAGS}
    FCheckPol:=GlobalTask.ParamAsBoolean('AUTO_POL');
//    lbWriteDecl.Visible:=true;
//    edWriteDecl.Visible:=true;
  {$ELSE}
    FCheckPol:=true;
//    edWriteDecl.Visible:=false;
//    GlobalTask.CurrentOpisEdit.GetListOpis('KEY_', edWriteDeclL.Items, edWriteDeclL.KeyItems);
//    ShablonToList(SHABLON_WRITEDECL, edWriteDeclL.Items, edWriteDeclL.KeyItems);  // fShablon.pas
//    TBItemStep2NotSvid.Visible:=false;
    edRukov_Sv.EditButtons[0].Visible:=false;
    edRukov.EditButtons[0].Visible:=false;
    edSpec.EditButtons[0].Visible:=false;
    lbTypeReg.Visible:=false;
    edTypeReg.Visible:=false;
//    N_F_cbIsWrite.Top:=lbTypeReg.Top;
  {$ENDIF}

  lbDopSved.Hint:='Заполняется для оставленного в организации здравоохранения';
  edON_DOPSVED.Hint:=lbDopSved.Hint;
  edONA_DOPSVED.Hint:=lbDopSved.Hint;

  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';

  slGo:=TStringList.Create;
  slGo.Add('down->BLR_edGorod=edTypeRod');
  slGo.Add('up->BLR_edOBL=edTimeR');

  AddStdDataSetToXML;

  FCheckLookupField:=false;   // так как все поля (область,район,город) переделаны на DbEditEh.MRUList;
  FNewSved:=DefaultNewSved;       // сведения по новому;
  FCheckKeyGrid:=true;
  TypeObj := dmBase.TypeObj_ZRogd;
  FUpdatingObj:=GetUpdatingObj(TypeObj);

  CreateButtonAddGrag(edON_GRAG);
//  edON_GRAG_TEXT.Left:=edON_GRAG.Left;
//  edON_GRAG_TEXT.Width:=edON_GRAG.Width-edON_GRAG.EditButtons[0].Width;

  CreateButtonAddGrag(edONA_GRAG);

  //  FCharCase:=1;     // 0-ecNormal, 1-ecUpperCase, 2-ecLowerCase
  FFirstControl:=edNomer;

  if FPrintSpecSvid then begin
    edRukov_Sv.DataField:='SPEC';
    BLR_edRukovB_Sv.DataField:='SPEC_B';
  end;

  // ребенок
  FOnOtnosh:=0;
  FOnaOtnosh:=0;
  FOnLic:=0;
  FOnaLic:=0;
  SetFieldAddPanel('DATES');

  aw := TAddControl.Create(cbObl); // ('область');
  edOBL.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(cbObl); // ('область');
  aw.ValueTrue:='вобласць';
  BLR_edOBL.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(edB_GOROD);
  aw.FirstWord:=true;
  edGOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(BLR_edB_GOROD);
  aw.FirstWord:=true;
  BLR_edGOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);

  // папа
  aw := TAddControl.Create(edON_M_B_OBL);
  edON_M_OBL.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(edON_M_B_GOROD);
  aw.FirstWord:=true;
  edON_M_GOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(edON_B_OBL);
  edON_OBL.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(edON_B_GOROD);
  aw.FirstWord:=true;
  edON_GOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(cbOnlyGodON);
  edON_DATER.Tag:=Integer(aw);
  RelationControl.Add(aw);

  // мама
  aw := TAddControl.Create(edONA_M_B_OBL);
  edONA_M_OBL.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(edONA_M_B_GOROD);
  aw.FirstWord:=true;
  edONA_M_GOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(edONA_B_OBL);
  edONA_OBL.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(edONA_B_GOROD);
  aw.FirstWord:=true;
  edONA_GOROD.Tag:=Integer(aw);
  RelationControl.Add(aw);

  aw := TAddControl.Create(cbOnlyGodONA);
  edONA_DATER.Tag:=Integer(aw);
  RelationControl.Add(aw);


  FDokZAGS := true;
  {$IFDEF ZAGS}
    n:=21;
  {$ELSE}
    n:=20;
  {$ENDIF}
  SetLength(FArrChoiceRekv,n);
  FArrChoiceRekv[0].nType:=1;
  FArrChoiceRekv[0].FieldName:='ON_DOKUMENT';
  FArrChoiceRekv[1].nType:=1;
  FArrChoiceRekv[1].FieldName:='ONA_DOKUMENT';

  FArrChoiceRekv[2].nType:=SHABLON_NATION;  //2;
  FArrChoiceRekv[2].FieldName:='OTMETKA';

  FArrChoiceRekv[3].nType:=SHABLON_OTEC; //3;
  FArrChoiceRekv[3].FieldName:='SVED_SVID';

//  FArrChoiceRekv[3].nType:=0;
//  FArrChoiceRekv[3].nTypeSpr:=_SHABLON_ZAGS;
//  FArrChoiceRekv[3].FieldName:='NAME_ZAGS';
//  FArrChoiceRekv[3].sPadeg:='';


  FArrChoiceRekv[4].nType:=0;
  FArrChoiceRekv[4].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[4].FieldName:='ON_WORK';
  FArrChoiceRekv[5].nType:=0;
  FArrChoiceRekv[5].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[5].FieldName:='ONA_WORK';

  FArrChoiceRekv[6].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[6].FieldName:='IZMEN';

  FArrChoiceRekv[7].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[7].FieldName:='ONA_GOROD_R';
  FArrChoiceRekv[8].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[8].FieldName:='ON_GOROD_R';

  FArrChoiceRekv[9].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[9].FieldName:='ON_GOSUD';
  FArrChoiceRekv[10].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[10].FieldName:='ONA_GOSUD';
  FArrChoiceRekv[11].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[11].FieldName:='ON_GRAG';
  FArrChoiceRekv[12].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[12].FieldName:='ONA_GRAG';
  FArrChoiceRekv[13].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[13].FieldName:='ON_M_GOSUD';
  FArrChoiceRekv[14].nTypeSpr:=_SHABLON_STRANA;
  FArrChoiceRekv[14].FieldName:='ONA_M_GOSUD';

  FArrChoiceRekv[15].nType:=SHABLON_DOK_ROGD;
  FArrChoiceRekv[15].FieldName:='DOKUMENT';

  FArrChoiceRekv[16].nType:=SHABLON_ADRESAT;
  FArrChoiceRekv[16].FieldName:='ARX_ADRESAT';

  FArrChoiceRekv[17].nType:=SHABLON_ISPRAV;
  FArrChoiceRekv[17].FieldName:='ARX_TEXT';

  FArrChoiceRekv[18].nType:=SHABLON_SUD;
  FArrChoiceRekv[18].FieldName:='ON_SUD_LR';

  FArrChoiceRekv[19].nType:=SHABLON_SUD;
  FArrChoiceRekv[19].FieldName:='ONA_SUD_LR';

  n:=20;
  {$IFDEF ZAGS}
  FArrChoiceRekv[n].nType:=SHABLON_DECL_ROGD;
  FArrChoiceRekv[n].FieldName:='DECL';
  FArrChoiceRekv[n].AddFieldsName:='DECL_ADRES#DECL_DOK';
  {$ENDIF}

  CheckControlSvid;

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisRogd;
  GlobalTask.SetEnablePrintReport(true);
  TBItemPrint.Enabled := true;
  dsGragd.DataSet := dmBase.SprGragd;

//  bmp:=Tbitmap.Create;
//  fmMain.ImageList.GetBitmap(IL_BRAK,bmp);
//  edON_Familia.EditButtons[0].Glyph.Assign(bmp);
//  edON_Familia.EditButtons[0].Glyph:=bmp;
//  bmp.Free;

//  fmMain.ImageList.GetBitmap(99, ENG_edON_IDENTIF.EditButtons[0].Glyph);

  edONA_Familia.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;

  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edONA_IDENTIF);
  AddButton_LoadIdentif(ENG_edIDENTIF);

  FPageControl := pc;
  pc.ActivePageIndex:=0;
  if GlobalTask.ParamAsBoolean('AUTO_ROGD') then begin
    cbProvDvig.Visible := true;
    cbProvDvig.Checked := true;
  end else begin
    cbProvDvig.Visible := false;
    cbProvDvig.Checked := false;
  end;
  edFamilia.OnExit := OnDestroyHint;
  edName.OnExit := OnDestroyHint;
  edOtch.OnExit := OnDestroyHint;
  edON_Familia.OnExit := OnDestroyHint;
  edON_Name.OnExit := OnDestroyHint;
  edON_Otch.OnExit := OnDestroyHint;
  edONA_Familia.OnExit := OnDestroyHint;
  edONA_Name.OnExit := OnDestroyHint;
  edONA_Otch.OnExit := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;
  edSpec.OnExit   := OnDestroyHint;
  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;

//  fmMain.SetCurrentDokument(Dokument);
  tsSprav.TabVisible := false;
  {$IFDEF ZAGS}
    edON_Familia.EditButtons.Items[0].Visible:=false;
    edONA_Familia.EditButtons.Items[0].Visible:=false;
    edDecl.EditButtons.Items[0].Visible:=false;
    cbProvDvig.Visible := false;
    cbProvDvig.Checked := false;
    gbLich.Visible:=false;
    TBItemClearLich.Visible:=false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
//    TBItemChoiceBrak.Visible:=false;
    TBItemArxSpr.Visible:=false;
    TBItemVozrast.Visible:=false;
    N_F_edCopy.Visible := false;
    N_F_cbPovtor.Visible := false;
  {$ENDIF}

  edFamilia.OnKeyPress:=KeyPress_RU;
  edName.OnKeyPress:=KeyPress_RU;
  edOtch.OnKeyPress:=KeyPress_RU;

  BLR_edFamilia.OnKeyPress:=KeyPress_BLR;
  BLR_edName.OnKeyPress:=KeyPress_BLR;
  BLR_edOtch.OnKeyPress:=KeyPress_BLR;

  SetControlFIOUpdate([
    edFamilia, edName, edOtch, BLR_edFamilia, BLR_edName, BLR_edOtch, edFamilia_Sv, edName_Sv, edOtch_Sv, edON_Familia, edON_Familia_Sv,
    BLR_edON_FamiliaB_Sv, edON_Name, edON_Name_Sv, BLR_edON_NameB_Sv, edON_Otch, edON_Otch_Sv, BLR_edON_OtchB_Sv, edONA_Familia,
    edOna_Familia_Sv, BLR_edOna_FamiliaB_Sv, edONA_Name, edOna_Name_Sv, BLR_edOna_NameB_Sv, edONA_Otch, edOna_Otch_Sv, BLR_edOna_OtchB_Sv,
    BLR_edONA_Familia, BLR_edONA_Name, BLR_edONA_Otch, BLR_edON_Familia, BLR_edON_Name, BLR_edON_Otch
     ],false);
  edName.OnUpdateData:=FIOUpdateDataP;  // !!! для расчета пола
  edOtch.OnUpdateData:=FIOUpdateDataP;  // !!! для расчета пола


  SetControlCityUpdate([
    edOBL, edRaion, edGOROD, BLR_edOBL, BLR_edRaion, BLR_edGOROD,
    edOBL_Sv, edRaion_Sv, edGOROD_Sv, BLR_edOblB_Sv, BLR_edRaionB_Sv, BLR_edGorodB_Sv,
    edON_OBL, edON_Raion, edON_GOROD, edON_M_OBL, edON_M_Raion, edON_M_GOROD,
    edONA_OBL, edONA_Raion, edONA_GOROD, edONA_M_OBL, edONA_M_Raion, edONA_M_GOROD,
    edGOROD_SV, BLR_edGORODB_SV
    ]);
  edGOROD.OnUpdateData:=CityUpdate2;

  ENG_edOna_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edOn_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edIdentif.OnUpdateData:=IN_UpdateData;

  {$IFDEF GISUN2}
    l:=IsActiveWorkATE;
    btSetAte.Visible:=l;
    btClearAte.Visible:=l;
    lbATE.Visible:=l;
    lbATE2.Visible:=l;
  {$ELSE}
    //gbAte.Visible:=false;
  {$ENDIF}

  n:=12;
  SetLength(FArrAddProperty,n);
  SetAddProperty(0, 'OTHER', '', ftMemo);
  SetAddProperty(1, 'IZMEN', '', ftMemo);

  SetAddProperty(2, 'ON_SUD_LR', '', ftMemo);
  SetAddProperty(3, 'ON_SUDD_LR', '', ftDate);
  SetAddProperty(4, 'ONA_SUD_LR', '', ftMemo);
  SetAddProperty(5, 'ONA_SUDD_LR', '', ftDate);

  SetAddProperty(6, 'ZAKL_IN_NOMER', '', ftString);
  SetAddProperty(7, 'ZAKL_IN_DATE', '', ftDate);

  SetAddProperty(8, 'ON_GRAG_ADD', '', ftMemo);    // ОН  дополлнительно к гражданству
  SetAddProperty(9, 'ONA_GRAG_ADD', '', ftMemo);   // ОНА дополлнительно к гражданству

  SetAddProperty(10, 'ON_ATEID', '', ftInteger);   // ОНА дополлнительно к гражданству
  SetAddProperty(11, 'ONA_ATEID', '', ftInteger);   // ОНА дополлнительно к гражданству

  {$IFDEF GISUN}
    SetLength(FArrAddProperty,n+1);
    SetAddProperty(n, 'ATE_FULLNAME', '', ftMemo);

    // типы нас. пунктов в кодах ГИС РН
    {
    SetLength(FArrAddProperty,n+6);
    SetAddProperty(n,   'RN_B_GOROD', '', ftString);
    SetAddProperty(n+1, 'RN_ON_M_B_GOROD', '', ftString);
    SetAddProperty(n+2, 'RN_ON_B_GOROD', '', ftString);
    SetAddProperty(n+3, 'RN_ONA_M_B_GOROD', '', ftString);
    SetAddProperty(n+4, 'RN_ONA_B_GOROD', '', ftString);
    }
  {$ENDIF}

  SetcbBel(N_F_cbBelorus);
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
    {$IFDEF ZAGS}
      TBItemCreateHist.Visible:=true;
    {$ENDIF}
    {$IFDEF LAIS}
      TBItemCreateHist.Visible:=true;
    {$ENDIF}
  end;
  SetLength(FArrCheckBelField,3);
  WriteToArrCheck(0,  1, false, 'OBL'    , 'OBL_B');
  WriteToArrCheck(1,  2, false, 'RAION'  , 'RAION_B');
  WriteToArrCheck(2,  3, true,  'GOROD'  , 'GOROD_B');
  SetLength(FArrCheckField,6);
  WriteToArrCheck(0,  1, false, 'ON_OBL');
  WriteToArrCheck(1,  1, false, 'ONA_OBL');
  WriteToArrCheck(2,  2, false, 'ON_RAION');
  WriteToArrCheck(3,  2, false, 'ONA_RAION');
  WriteToArrCheck(4,  4, false, 'ON_RNGOROD');
  WriteToArrCheck(5,  4, false, 'ONA_RNGOROD');
//  WriteToArrCheck(4,  3, false, 'ON_GOROD');
//  WriteToArrCheck(5,  3, false, 'ONA_GOROD');

  SetPanelPovtor(tsPovtor, N_F_cbPovtor, nil, nil);

//  tsSvid.TabVisible:=GlobalTask.ParamAsBoolean('TS_SVID');
  SetVisibleNomerEkz(pn, edDateSv, N_F_1);

  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := IsActiveGISUN;
//    lbIDENTIF.Visible:=IsActiveGISUN;
//    ENG_edIDENTIF.Visible:=IsActiveGISUN;
    TBSubmenuGISUN.Visible:=IsActiveSubMenuGISUN; //   ???
    if TBSubmenuGISUN.Visible then TBItemStep2.ShortCut:=TextToShortCut('Ctrl+F1');

    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN;
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
//    lbIDENTIF.Visible:=false;
//    ENG_edIDENTIF.Visible:=false;
  {$ENDIF}
  TBItemHistCorr.Visible:=FUpdatingObj;

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
  s:=GlobalTask.GetLastValueAsString('QUERY_IN_CHILD');
  if (s='') or (s='1')
    then FQueryINChild:=true
    else FQueryINChild:=false;
  TbItemQueryIN.Checked:=FQueryINChild;
//  FTrueSpecSved:=false;

//  AddButton_ChoiceSpec([edRukov,edRukov_Sv,edSpec]);  для выбора из справочника

end;

destructor TfmZapisRogd.Destroy;
begin
  slGo.Free;
  GlobalTask.SetLastValueAsBoolean('QUERY_IN_CHILD',FQueryINChild);
  DestroyHint(H);
  inherited;
end;

{
function TfmZapisRogd.GetNameReport: String;
begin
  Result := '&Свидетельство о рождении.frf';
//  Result := '&Запись акта о рождении.frf';
end;
}
function TfmZapisRogd.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_ZRogd); //
end;
{
procedure TfmZapisRogd.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  if Pos('(', Caption) = 0 then begin
    Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
  end;
end;
}
function TfmZapisRogd.NewDok( lAppend : Boolean ): Boolean;
//var
//  n:Integer;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  if FQueryINChild
    then DokumentCHERN.AsInteger:=1        // запрашивать ИН для ребенка
    else DokumentCHERN.AsInteger:=0;
  DokumentIS_WRITE.AsBoolean:=false;
  DokumentGIVOROGD.AsBoolean:=true;
  DokumentFIRST_EKZ.AsBoolean:=true;

  DokumentTYPE_SPRAV.AsInteger:=1;     // !!! нет реального реквизита     1-выдается 2-не выдавалась
  DokumentDUBL_SPR.AsBoolean:=false;

  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  // DokumentPOL.AsString:='М';  // было до 02.11.2015
  if FCheckPol  // автоматически определять пол
    then DokumentPOL.AsString:='М'
    else DokumentPOL.AsString:='';

  DokumentSVED_UST.AsBoolean:=false;
  DokumentON_ONLYGOD.AsBoolean:=false;
  DokumentONA_ONLYGOD.AsBoolean:=false;
  DokumentONLYGOD.AsBoolean:=false;

  DokumentB_RESP.AsBoolean:=false;   // после отправки в ГИС РН корректировались определенные реквизиты

  DokumentB_OBL.AsBoolean:=true;
  DokumentON_B_OBL.AsBoolean:=true;
  DokumentONA_B_OBL.AsBoolean:=true;
  DokumentON_M_B_OBL.AsBoolean:=true;
  DokumentONA_M_B_OBL.AsBoolean:=true;

  DokumentB_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_M_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_M_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');

  DokumentPROV.AsBoolean := false;
  DokumentVOSSTAN.AsBoolean  := false;
  DokumentSVED_NOT_SVID.AsBoolean  := true;

  DokumentTORGESTV.AsInteger:=0;
  lbTwoDecl.Visible:=false;
  edTwoDecl.Visible:=false;
  edAddSpr.Visible:=false;

  DokumentFIRSTWEEK.AsBoolean := false;
  DokumentNOTPRINT29.AsBoolean := false;
  if lAppend then begin
    CheckRnGorod;
  end;
  inherited NewDok(lAppend);
  if lAppend then begin
//    n:=GetTickCount;
    EditDataSet(Dokument);
    CheckSOATOAkt(true,false,true,'{SS}',0,'');
    DokumentONA_SOATO.AsString:=DokumentON_SOATO.AsString;
//    ShowMessage(inttostr(gettickcount-n));
  end;
  FOnCheckSOATO:=false;
  FOnaCheckSOATO:=false;

  CheckForAll_Bel(DokumentOBL);
  CheckForAll_Bel(DokumentRAION);

  DokumentSOATO_ID.AsInteger:=-1;
  DokumentATE_FULLNAME.AsString:='';
  DokumentDECL_ID.AsInteger:=0;
  DokumentVERNO.AsBoolean:=false;   // true=запись акта верна
  DokumentSVIDNOT.AsBoolean:=false;   // true=сведетельство не выдавать


  FNewSved:=DefaultNewSved;
  CheckControlSved(true);
  CheckLishRodPrav;
  QueryExit:=false;
  Result := true;
end;
       
//----------------------------------------------------------------------------------
procedure TfmZapisRogd.CheckNewSved;
begin
  // если по умолчанию "дополнит. сведения" по новому
  if DefaultNewSved then begin
    if (DokumentSVED.AsString='1') then begin
      if (DokumentSVED_AKT.AsString<>'') or (DokumentSVED_SVID.AsString='') or (Copy(DokumentSVED_SVID.AsString,Length(DokumentSVED_SVID.AsString),1)=Chr(9)) then begin
        FNewSved:=true;
        while RightStr(DokumentSVED_SVID.AsString,1)=Chr(9) do
          DokumentSVED_SVID.AsString:=Copy(DokumentSVED_SVID.AsString,1,Length(DokumentSVED_SVID.AsString)-1);
      end else begin
        FNewSved:=false;
      end;
    end else begin
      FNewSved:=true;
    end;
  end else begin
    FNewSved:=false;
  end;
end;

//----------------------------------------------------------------------------------
procedure TfmZapisRogd.CheckControlSved(lBrak:Boolean);
var
  nLeft,nTop,nDef:Integer;
begin
  nLeft:=edDecl.Left;
  nTop:=edSved.Top+CONTROL_STEP;    //  CONTROL_STEP(26) определен в uProject.pas
  nDef:=10;
  if lBrak then begin
    if FNewSved then begin
      N_F_SVED_NOT_SVID.Visible:=true;
      edSvedMat.Visible:=false;
      lbSvedAkt.Visible:=true;
      edSvedAkt.Visible:=true;
      lbSved_DateB.Visible:=true;
      edSved_DateB.Visible:=true;
      lbSved_DateB.Caption:=' от ';

      edSved_DateB.Left:=(edOTMETKA.Left+edOTMETKA.Width)-edSved_DateB.Width;               // control для даты
      edSved_DateB.Top:=nTop;
      lbSved_DateB.Left:=edSved_DateB.Left-lbSved_DateB.Width-nDef;         // от
      lbSved_DateB.Top:=lbSvedAkt.Top;
      edSvedAkt.Left:=lbSved_DateB.Left-edSvedAkt.Width-nDef;               // control номера записи
      lbSvedAkt.Left:=edSvedAkt.Left-lbSvedAkt.Width-nDef;                  // запись №
      edSVED_SVID.Width:=lbSvedAkt.Left-edSVED_SVID.Left-nDef;
      edSVED_SVID.Hint:='Место регистрации брака';

      {$IFDEF ZAGS}
        FArrChoiceRekv[3].nType:=0;
        FArrChoiceRekv[3].nTypeSpr:=_SHABLON_ZAGS;
        FArrChoiceRekv[3].sPadeg:='';
      {$ELSE}
        FArrChoiceRekv[3].nType:=SHABLON_NAME_ZAGS;
        FArrChoiceRekv[3].FieldName:='SVED_SVID';
      {$ENDIF}

      {
      lbSvedAkt.Left:=nLeft;                  // запись №
      nLeft:=nLeft+lbSvedAkt.Width+nDef;
      edSvedAkt.Left:=nLeft;                  // control номера записи
      nLeft:=nLeft+edSvedAkt.Width+nDef;
      lbSved_DateB.Left:=nLeft;               // от
      lbSved_DateB.Top:=lbSvedAkt.Top;
      nLeft:=nLeft+lbSved_DateB.Width+nDef;

      edSved_DateB.Left:=nLeft;               // control для даты
      edSved_DateB.Top:=nTop;

      nLeft:=nLeft+edSved_DateB.Width+nDef;
      edSVED_SVID.Left:=nLeft;
      edSVED_SVID.Width:=ClientWidth-(nLeft+20);
      edSVED_SVID.Anchors:=[akLeft,akTop,akRight];
}
    end else begin
      N_F_SVED_NOT_SVID.Visible:=false;
      lbSvedAkt.Visible:=false;
      edSvedAkt.Visible:=false;
      lbSved_DateB.Visible:=true;
      edSved_DateB.Visible:=true;
      lbSved_DateB.Caption:='дата брака';

      lbSved_DateB.Left:=edSved.Left+edSved.Width+nDef;                 //
      lbSved_DateB.Top:=Label36.Top;
      edSved_DateB.Left:=lbSved_DateB.Left+lbSved_DateB.Width+nDef;               // control для даты
      edSved_DateB.Top:=edSved.Top;
      edSVED_SVID.Left:=edDecl.Left;
      edSVED_SVID.Width:=ClientWidth-(nLeft+20);
      edSVED_SVID.Anchors:=[akLeft,akTop,akRight];
      edSVED_SVID.Hint:='';

      FArrChoiceRekv[3].nType:=SHABLON_OTEC;
      FArrChoiceRekv[3].nTypeSpr:=0;

    end;
  end else begin      // заявление матери
    N_F_SVED_NOT_SVID.Visible:=false;
    lbSvedAkt.Visible:=false;
    edSvedAkt.Visible:=false;
    lbSved_DateB.Visible:=false;
    edSved_DateB.Visible:=false;
    edSVED_SVID.Left:=edDecl.Left;
    edSVED_SVID.Width:=ClientWidth-(nLeft+20);
    edSVED_SVID.Anchors:=[akLeft,akTop,akRight];
    edSVED_SVID.Hint:='';

    edSvedMat.Left:=N_F_SVED_NOT_SVID.Left;
    edSvedMat.Visible:=true;

    FArrChoiceRekv[3].nType:=3;
    FArrChoiceRekv[3].nTypeSpr:=0;
  end;
end;
//----------------------------------------------------------------------------------
procedure TfmZapisRogd.AfterReadDok;
begin
  inherited;
  CheckOtmenka_Load(edOtmetka,edVirt_ON_Otmetka,edVirt_ONA_Otmetka,
              'OTMETKA','VIRT_ON_OTMETKA','VIRT_ONA_OTMETKA',lbVIRT_ON,lbVIRT_ONA,btOtm);
  SetColorChild(GetControlColor);
  QueryExit:=false;
end;
//----------------------------------------------------------------------------------
function TfmZapisRogd.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
  l:Boolean;
  arr : TArrStrings;
//  s:String;
//  sl  : TStringList;
begin
  Result := true;
  l:=dbDisableControls(Dokument);
  if not FMainTable.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;                  
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to FMainTable.FieldCount-1 do begin
    strField := FMainTable.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, FMainTable.Fields[i]);
    end;
  end;
  SetIDZags;

  ReadDopProperty(dmBase.TypeObj_ZRogd, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));

  if (DokumentON_DOK_TYPE.AsString='1') and (DokumentON_GRAG.AsInteger=0) then DokumentON_DOK_TYPE.AsString:='';
//  if DokumentONA_DOK_TYPE.AsString='' then DokumentONA_DOK_TYPE.AsString:='1';
  if DokumentIS_WRITE.IsNull then DokumentIS_WRITE.AsBoolean:=false;
  if DokumentGIVOROGD.IsNull then DokumentGIVOROGD.AsBoolean:=true;
  if DokumentCHERN.IsNull    then DokumentCHERN.AsInteger:=0
                             else if DokumentCHERN.AsInteger>1 then DokumentCHERN.AsInteger:=1;
  if DokumentDECL_ID.IsNUll  then DokumentDECL_ID.AsInteger:=0;
  ValuesFromDeclID;

  if DokumentSPRAV_NOMER.AsString<>'' then begin
    DokumentTYPE_SPRAV.AsInteger:=1;
  end else if DokumentSPRAV_NOMER.AsString='' then begin
    DokumentDUBL_SPR.AsBoolean:=false;
    DokumentTYPE_SPRAV.AsInteger:=2;
    DokumentSPRAV_DATE.AsString:='';
  end;
  if DokumentDUBL_SPR.IsNull then DokumentDUBL_SPR.AsBoolean:=false;
  if DokumentSVED_UST.IsNull then DokumentSVED_UST.AsBoolean:=false;
  if DokumentON_ONLYGOD.IsNull then DokumentON_ONLYGOD.AsBoolean:=false;
  if DokumentONA_ONLYGOD.IsNull then DokumentONA_ONLYGOD.AsBoolean:=false;
  if DokumentONLYGOD.IsNull then DokumentONLYGOD.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentFIRSTWEEK.IsNull then DokumentFIRSTWEEK.AsBoolean:=false;
  if DokumentVOSSTAN.IsNull then DokumentVOSSTAN.AsBoolean:=false;
  if DokumentSVED_NOT_SVID.IsNull then DokumentSVED_NOT_SVID.AsBoolean:=false;
  if DokumentSOATO_ID.IsNull then DokumentSOATO_ID.AsInteger:=-1;

  DokumentON_IDENTIF.AsString:=CheckRUS2(DokumentON_IDENTIF.AsString);
  DokumentONA_IDENTIF.AsString:=CheckRUS2(DokumentONA_IDENTIF.AsString);

  // --------- в торжественной обстановке --------------------
  DokumentTORGESTV.AsInteger:=0;
  if not DokumentVOSSTAN.AsBoolean and (FMainTable.FieldByName('SUD_DATE').AsString<>'') then begin
// было   if dmBase.tbZapisRogd.FieldByName('SUD_DATE').AsDateTime=STOD('1900-01-01',tdAds)
//      then DokumentTORGESTV.AsBoolean := true;
    DokumentTORGESTV.AsInteger:=DayOf( FMainTable.FieldByName('SUD_DATE').AsDateTime );
    if DokumentTORGESTV.AsInteger>2 then DokumentTORGESTV.AsInteger:=0;
  end;
  //----------------------------------------------------------
  DokumentON_RNGOROD.AsString  := '';
  DokumentONA_RNGOROD.AsString := '';
  if DokumentON_B_RN.IsNull then DokumentON_B_RN.AsBoolean:=true;
  if not DokumentON_B_RN.AsBoolean then begin
    DokumentON_RNGOROD.AsString := DokumentON_RAION.AsString;
    DokumentON_RAION.AsString   := '';
  end;
  if DokumentONA_B_RN.IsNull then DokumentONA_B_RN.AsBoolean:=true;
  if not DokumentONA_B_RN.AsBoolean then begin
    DokumentONA_RNGOROD.AsString := DokumentONA_RAION.AsString;
    DokumentONA_RAION.AsString   := '';
  end;

  CheckCaretDokument(DokumentON_DOK_NOMER,DokumentON_DOKUMENT);
  CheckCaretDokument(DokumentONA_DOK_NOMER,DokumentONA_DOKUMENT);
{
  if DokumentSP_J.AsString<>'' then begin  // если заполнена дата
    edSP_J_GOD.EditMask:='00.00.0000;1';
    DokumentSP_J_GOD.AsString:=FormatDateTime('dd.mm.yyyy', DokumentSP_J.AsDateTime);
    DokumentSP_J.AsString:='';
  end else begin                          // если заполнен произвольный текст
    edSP_J_GOD.EditMask:='';
  end;
}

  if DokumentSP_J_GOD.AsString<>'' then begin
    edSP_J_GOD.Left := edSP_J.Left;
    edSP_J.Visible     := false;
    edSP_J_GOD.Visible := true;
    DokumentSP_J.AsString := '';
  end;
  if DokumentSP_C_GOD.AsString<>'' then begin
    edSP_C_GOD.Left := edSP_C.Left;
    edSP_C.Visible     := false;
    edSP_C_GOD.Visible := true;
    DokumentSP_C.AsString := '';
  end;

  DokumentADD_SPR.AsString:='';
  if Pos(chr(13)+chr(10),DokumentDECL.AsString)>0 then begin
    StrToArr(DokumentDECL.AsString,arr,chr(13)+chr(10),false);
    SetLength(arr,5);
    DokumentDECL.AsString:=arr[0];
    DokumentDECL_ADRES.AsString:=arr[1];
    DokumentDECL_DOK.AsString:=arr[2];
    if arr[3]<>'' then begin
      DokumentTWO_DECL.AsString:=arr[3];
      if DokumentTORGESTV.AsInteger=0
        then DokumentTORGESTV.AsInteger:=1;
    end;
    if arr[4]<>'' then begin
      DokumentADD_SPR.AsString:=arr[4];
    end;
  end;

  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  CheckNewSved;

  Dokument.Post;

  CheckRnGorod;

  TbItemSpecSved.Checked := DokumentVERNO.AsBoolean;
  TbItemSvidNot.Checked := DokumentSVIDNOT.AsBoolean;

  ReadHistory(nID, dmBase.TypeObj_ZRogd);

  edON_GRAG.Hint:=DokumentON_GRAG_ADD.AsString;
  edONA_GRAG.Hint:=DokumentONA_GRAG_ADD.AsString;

  {$IFDEF ZAGS}
    TBItemVozrast.Checked := ((DokumentON_DateR.AsString='') and (DokumentON_VOZR.AsString<>''));
    if TBItemVozrast.Checked then CheckOnlyVozrast(false);
  {$ENDIF}

  dbEnableControls(Dokument,l);
  if DokumentSVED.AsString='3'   // заявление матери
    then CheckControlSved(false)
    else CheckControlSved(true);
  CheckLishRodPrav;
  CheckATE;
  N_F_cbTypeSpravChange(nil);
  edTypeRegChange(nil);
end;

//----------------------------------------------------------------------------------
function TfmZapisRogd.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr,s, strDecl : String;
  {$IFNDEF ZAGS}
  dLastSost : TDateTime;
  nAdresID : Integer;
  vKeyValues : Variant;
  d : TDateTime;
  nIdChild : Integer;
  lCheckEn, lAdd,lBeAdd,lErr : Boolean;
  strLich,sKodOtnosh,strIDFirst,sBookmarkChild,sOn_ID,sONA_ID,sLic_ID : String;
  nCurNomer:Integer;
  recID:TID;
  {$ENDIF}
//  lAdd,lBeAdd : Boolean;
  lFullWrite : Boolean;
//  SOATO:TSOATO;
  arr:TArrStrings;
  sAdd,sSeria,sNomer,sRukov,sRukovB,sSpec,sSpecB:String;
  dDate:TdateTime;
  Pol:TPol;
begin
  Dokument.CheckBrowseMode;
  AdditiveBeforeWriteDok;

  EditDataSet(Dokument);
  // для записи длинных имен и отчеств
  sAdd:='';
  if Length(DokumentON_Name.AsString)>30    then sAdd:=sAdd+'ON_NAME;';
  if Length(DokumentON_Otch.AsString)>30    then sAdd:=sAdd+'ON_OTCH;';
  if Length(DokumentON_Name_B.AsString)>30  then sAdd:=sAdd+'ON_NAME_B;';
  if Length(DokumentON_Otch_B.AsString)>30  then sAdd:=sAdd+'ON_OTCH_B;';
  if Length(DokumentSVED_AKT.AsString)>15  then sAdd:=sAdd+'SVED_AKT;';
  WriteOtherData(Dokument, 'OTHER', sAdd+'RUKOV_D;SPEC_D;ON_DOPSVED;ONA_DOPSVED;');
  DokumentDECL_ID.AsInteger:=ValuesToDeclID;
  if DokumentVOSSTAN.IsNull then DokumentVOSSTAN.AsBoolean:=false;
  PostDataSet(Dokument);

  Result:=CheckDokument(0,false,true,true);
  strErr:=FLastError;
  {$IFNDEF ZAGS}
    lCheckEn:=false;
    dLastSost:=dmBase.LastDateSost;
  {$ENDIF}
  lFullWrite:=true;   // полная запись актовой записи
  sSeria:='';
  sNomer:='';
  sRukov:='';
  sRukovB:='';
  sSpec:='';
  sSpecB:='';
  dDate:=0;
  if (DokumentIDENTIF.AsString<>'') then begin
    s:=FMainTable.Bookmark;
    if FMainTable.Locate('IDENTIF', DokumentIDENTIF.AsString, []) then begin
      if (FMainTable.FieldByName('ID').AsInteger<>DokumentID.AsInteger) then begin
        i := QuestionPos('Запись с идентификационным номером "'+DokumentIDENTIF.AsString+'" существует: №'+
           FMainTable.FieldByName('NOMER').AsString+' от '+DatePropis(FMainTable.FieldByName('DATER').AsDateTime,3)+'.'+#13+' Продолжить запись ? ',
            'Да;&Нет','',-1,2,qtConfirmation, Self);
        if i<>1 then begin
          Result:=false;
          exit;
        end;
      end;
    end;
    FMainTable.Bookmark:=s;
  end;

  if (strErr='') then begin
    if FOnlySvid then begin
      if DokumentID.AsInteger=-1 then  begin  // запись не выбирали
        arr:=dmBase.SeekAkt(TypeObj, DokumentID_ZAGS.AsInteger,
                            DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime, DokumentVOSSTAN.AsBoolean);
        if Length(arr)=0 then begin
//         DokumentID.AsInteger = -1  будем добавлять запсиь в базу
        end else begin
         // SeekAkt уже установил на нужную запись
           EditDataSet(Dokument);
           DokumentID.AsInteger:=FMainTable.FieldByName('ID').AsInteger;
           // SvidNotFromDeclID(FMainTable.FieldByName('DECL_ID').AsInteger)
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
      Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZRogd, DokumentID_ZAGS.AsInteger,
                    DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime);
      if not Result then exit;
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
    FMainTable.Append;
    FMainTable.Post;
    nID := FMainTable.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if FMainTable.FieldByName('ID').AsInteger<>nID then begin
      if not FMainTable.Locate('ID', nID, []) then begin
        Result := false;
      end;
    end;

    // добавил 31.10.2014 ,  если кто-то другой сохранил з/а с ИН, а в этой копии он пустой
    if Result and (Gisun.GetPoleGrn(FPoleGrn)=rPost) then begin
      if (Trim(FMainTable.FieldByName('IDENTIF').AsString)<>'') and (Trim(DokumentIDENTIF.AsString)='') then begin
        PutError('В базе данных ИН ребенка не пустой.',self);
        Result:=false;
      end;
    end;

    if Result and not lFullWrite and FOnlySvid then begin   // запись нашли и пишем только свидетельство
       with FMainTable do begin
           if not MySameText(FieldByName('FAMILIA').AsString,DokumentFamilia.AsString) or
              not MySameText(FieldByName('NAME').AsString,DokumentName.AsString) or
              not MySameText(FieldByName('OTCH').AsString,DokumentOtch.AsString) or
              (FieldByName('DATER').AsVariant<>DokumentDateR.AsVariant) then begin
              PutError('Данные о ребенке не совпадают с данными из актовой записи.'#13+
                  CreateFIO(FMainTable,'')+' '+DatePropis(FieldByName('DATER').AsDateTime,3)+chr(13)+
                  CreateFIO(Dokument,'')+ ' '+DatePropis(DokumentDateR.AsDateTime,3),self);
              Result:=false;
           end;
           if Result and (FieldByName('IDENTIF').AsString<>'') and
              not MySameText(FieldByName('IDENTIF').AsString,DokumentIDENTIF.AsString) then begin
              PutError('Идентификационный номер ребенка не совпадает с данными из актовой записи.'#13+
                '"'+FieldByName('IDENTIF').AsString+'"'+chr(13)+'"'+DokumentIDENTIF.AsString+'"',self);
              Result:=false;
           end;
       end;
//       EditDataSet(Dokument);        !!!!  может сделать так ?   может нашли не ту запись, а я уже привязался к ней, а если я ее выбрал ?
//       DokumentID.AsInteger:=-1;
//       PostDataSet(Dokument);
    end;
  end;
  if Result then  begin
    FCheckEditGIS:=CheckDateEditGIS;  // функция д.б. своя для каждого типа документа !!!

    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;

    if (DokumentDECL_ADRES.AsString<>'') or (DokumentDECL_DOK.AsString<>'') or (DokumentTWO_DECL.AsString<>'') or (DokumentADD_SPR.AsString<>'') then begin
      strDecl:=DokumentDECL.AsString+chr(13)+chr(10)+Trim(DokumentDECL_ADRES.AsString)+chr(13)+chr(10)+Trim(DokumentDECL_DOK.AsString)+
               chr(13)+chr(10)+Trim(DokumentTWO_DECL.AsString)+chr(13)+chr(10)+Trim(DokumentADD_SPR.AsString);
    end else begin
      strDecl:=DokumentDECL.AsString;
    end;


    {$IFNDEF ZAGS}
      sOn_ID:='';
      sOna_ID:='';
      sLic_ID:='';
      //----------- попробуем найти родителей --------------------
      if (DokumentON_IDENTIF.AsString<>'') and (DokumentON_ID.AsString='') then begin
        if dmBase.tbMens.Locate('DATE_FIKS;LICH_NOMER', VarArrayOf([dmBase.GetDateCurrentSost, DokumentON_IDENTIF.AsString]),[]) then begin
          sOn_ID:=dmBase.tbMens.FieldByName('ID').AsString;
          if DokumentLICH_ID.AsString=''
            then sLic_ID:=dmBase.tbMens.FieldByName('LIC_ID').AsString;    // лицевой счет папы
        end;
      end;
      if (DokumentONA_IDENTIF.AsString<>'') and (DokumentONA_ID.AsString='') then begin
        if dmBase.tbMens.Locate('DATE_FIKS;LICH_NOMER', VarArrayOf([dmBase.GetDateCurrentSost, DokumentONA_IDENTIF.AsString]),[]) then begin
          sOna_ID:=dmBase.tbMens.FieldByName('ID').AsString;
          if (DokumentLICH_ID.AsString='')
            then sLic_ID:=dmBase.tbMens.FieldByName('LIC_ID').AsString;   // лицевой счет мамы
        end;
      end;
      if (sOn_ID<>'') or (sOna_ID<>'') or (sLic_ID<>'') then begin
        if sOn_ID<>''  then DokumentON_ID.AsString:=sOn_ID;
        if sOna_ID<>'' then DokumentONA_ID.AsString:=sOna_ID;
        if (sLic_ID<>'') and (sLic_ID<>'0') then DokumentLICH_ID.AsString:=sLic_ID;
      end;
      if DokumentLICH_ID.AsString<>'' then begin
        cbProvDvig.Enabled:=true;
        Application.ProcessMessages;
      end;
      //--------------------------------------------------------
    {$ENDIF}

    //-------- SP_J -------------------------------------------------------------------
//    d:=GetDateFromStr(DokumentSP_J_GOD.AsString,s);
//    if d>0 then begin   // типа дата
//      DokumentSP_J.AsDateTime:=d;
//    end;

    if DokumentSVED.AsString='' then DokumentSVED.AsString:='1';
    if FNewSved and (DokumentSVED.AsString='1') and (DokumentSVED_SVID.AsString<>'') and
       (RightStr(DokumentSVED_SVID.AsString,1)<>Chr(9))
      then DokumentSVED_SVID.AsString:=DokumentSVED_SVID.AsString+Chr(9);

    if not DokumentGIVOROGD.AsBoolean then DokumentFIRSTWEEK.AsBoolean:=false;
//    if not DokumentFIRSTWEEK.AsBoolean then DokumentDateS.AsString:='';

    if (DokumentSVED.AsString='3') and not DokumentON_DateR.IsNull then begin
      DokumentSVED_UST.AsBoolean:=true;
    end else begin
      DokumentSVED_UST.AsBoolean:=false;
    end;
    if (DokumentON_CHERN.AsInteger>0) and (DokumentIS_WRITE.AsBoolean=false) then begin   // выбрано значение для письменного заявления
      DokumentIS_WRITE.AsBoolean:=true;
    end;
    Dokument.Post;
//    AddEditSvid(strBookMark);

    FMainTable.Edit;
    if not lFullWrite then begin  // пишем данные только для свидетельства  в существующую запись
      FMainTable.FieldByName('IDENTIF').AsString := DokumentIDENTIF.AsString;
    end else begin
      for i:=1 to FMainTable.FieldCount-1 do begin
        strField := FMainTable.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          if (fld.IsNull) or (fld.AsString='')
            then FMainTable.Fields[i].AsString := ''
            else FMainTable.Fields[i].Value := fld.Value;
        end;
      end;
      if DokumentON_RNGOROD.AsString<>'' then begin
        FMainTable.FieldByName('ON_B_RN').AsBoolean := false;
        FMainTable.FieldByName('ON_RAION').AsString := DokumentON_RNGOROD.AsString;
      end else begin
        FMainTable.FieldByName('ON_B_RN').AsBoolean := true;
      end;
      if DokumentONA_RNGOROD.AsString<>'' then begin
        FMainTable.FieldByName('ONA_B_RN').AsBoolean := false;
        FMainTable.FieldByName('ONA_RAION').AsString := DokumentONA_RNGOROD.AsString;
      end else begin
        FMainTable.FieldByName('ONA_B_RN').AsBoolean := true;
      end;

      if DokumentTYPE_SPRAV.AsInteger=2 then begin // справка не выдавалась
        FMainTable.FieldByName('DUBL_SPR').Value:=null;
      end;

      // --------- в торжественной обстановке --------------------
      if DokumentTORGESTV.AsInteger>0 then begin
        FMainTable.FieldByName('SUD_DATE').AsDateTime:=STOD('1900-01-'+PADLStr(DokumentTORGESTV.AsString,2,'0'),tdAds);
      end else begin
        FMainTable.FieldByName('SUD_DATE').AsString:='';
      end;
      // --------- письменное заявление --------------------
      if (DokumentSVED.AsInteger=3) and (DokumentON_CHERN.IsNull) then begin
        FMainTable.FieldByName('ON_CHERN').AsInteger:=1;
//        FMainTable.FieldByName('IS_WRITE').AsBoolean:=true;
      end;
      //----------------------------------------------------------
      //
      if not FPrintSpecSvid
        then FMainTable.FieldByName('SPEC_B').AsString:='';

      if FOnaCheckSOATO and not FOnlySvid then begin
        CheckSOATOAkt(false,true,false,'{SS}',0,'');
      end;

      if FOnCheckSOATO and not FOnlySvid  then begin
        CheckSOATOAkt(true,false,false,'{SS}',0,'');
      end;

      FMainTable.FieldByName('DECL').AsString:=strDecl;   // !!! см. выше
    end; // <<<< lFullWrite

    WriteDateIzm;
    WriteForAllDok_BeforePost;
    if FMainTable.FieldByName('B_RESP').AsBoolean=false
      then FMainTable.FieldByName('B_RESP').AsBoolean:=FCheckEditGIS;
    FMainTable.Post;

    if lFullWrite then begin
      WriteDopProperty(dmBase.TypeObj_ZRogd, nID,  STOD('1899-12-30',tdAds));
      WriteHistory(nID, dmBase.TypeObj_ZRogd);
    end;

    {$IFDEF GISUN}
      WriteMessageID;
    {$ENDIF}

    AdditiveWriteDok;         // пишем в том числе повторные свидетельства

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
    end;

//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);

    {$IFDEF GISUN}
//      s:=dmBase.tbSimpleProp.IndexName;
//      dmBase.tbSimpleProp.IndexName:='SEEK_POKAZ_KEY';   // TYPEOBJ;POKAZ;VALUE
//      if dmBase.tbSimpleProp.FindKey([_TypeObj_IN,'IN',DokumentIDENTIF.AsString]) then begin
//        dmBase.tbSimpleProp.Delete;
//      end;
//      dmBase.tbSimpleProp.IndexName:=s;
    {$ENDIF}

    QueryExit:=false;
    Result := true;

    if FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentFamilia.AsString, DokumentFamilia_B.AsString);
    end;
    if FCheckBelName then begin
      if DokumentPOL.AsString='М' then Pol:=tpM else Pol:=tpG;
      dmBase.CheckNameBel(Pol,FirstUpper(DokumentName.AsString), FirstUpper(DokumentName_B.AsString) );
    end;
    WriteForAll_Bel;


    {$IFNDEF ZAGS}

    if cbProvDvig.Visible and cbProvDvig.Checked and ((dLastSost=dmBase.GetDateCurrentSost) or (DokumentDATEZ.AsDateTime >= dLastSost)) then begin

      //---------------------------------------
      //запись ИН для мамы и папы  и определение LICH_ID если он пустой   !!!
      //---------------------------------------
      {
      dmBase.GetMen(dmBase.GetDateCurrentSost,DokumentON_ID.AsString);
      if (DokumentON_IDENTIF.AsString<>'') and (DokumentON_ID.AsString='') and ((dLastSost = dmBase.GetDateCurrentSost) or (DokumentDATEZ.AsDateTime >= dLastSost)) then begin
        if dmBase.tbMens.Locate('DATE_FIKS;LICH_NOMER', VarArrayOf([dmBase.GetDateCurrentSost,DokumentON_IDENTIF.AsString]), []) then begin
          EditDataSet(Dokument);
          DokumentMEN_ID.AsString:=dmBase.tbMens.FieldByName('ID').AsString;
          PostDataSet(Dokument);
        end;
      end;
      }

      if DokumentLICH_ID.AsInteger>0 then begin
        vKeyValues := VarArrayCreate( [0, 1], varOleStr );
        vKeyValues[0] := dmBase.GetDateCurrentSost;
        vKeyValues[1] := 0;
        lAdd   := false;
        lBeAdd := false;
        // если у ребенка еще нет ид.
        if (DokumentCHILD_ID.AsString='') or (DokumentCHILD_ID.AsString='0') then begin
          nIdChild := dmBase.GetNewID(dmBase.TypeObj_Nasel);
          if nIdChild > 0 then begin
            EditdataSet(Dokument);
            DokumentCHILD_ID.AsInteger := nIdChild;
            DokumentPROV.AsBoolean := true;
            PostDataSet(Dokument);
            lAdd := true;
          end;
        end else begin
          lBeAdd := true;  // ребенок уже был когда-то записан и у него есть ID
        end;
        lErr := false;
        if DokumentCHILD_ID.AsString <> '' then begin
          nIdChild := DokumentCHILD_ID.AsInteger;
          strLich:='';
          strIDFirst:='';
          nAdresID := 0;

          vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, DokumentLICH_ID.AsInteger);
          if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
            nAdresID := dmBase.tbLich.FieldByName('ADRES_ID').AsInteger;
            strLich:=dmBase.tbLich.FieldByName('NOMER').AsString;
            strIDFirst:=dmBase.tbLich.FieldByName('FIRST').AsString;
          end;

          vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, nIdChild);
          if not dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
            if lBeAdd then begin
              //  ошибка значит человека уже удалили из базы
              lErr := true;
            end else begin
              nCurNomer:=dmBase.CountMensEx(dmBase.GetDateCurrentSost, DokumentLICH_ID.AsString,'000',nil);
              dmBase.tbMens.Append;
              dmBase.tbMens.FieldByName('DATE_FIKS').AsDateTime := dmBase.GetDateCurrentSost;
              dmBase.tbMens.FieldByName('ID').AsInteger := nIdChild;
              dmBase.tbMens.FieldByName('NSTR').AsInteger := nCurNomer+1;
            end;
          end else begin
            dmBase.tbMens.Edit;
          end;
          if not lErr then begin
            sBookmarkChild:='';
            with dmBase.tbMens do begin
              FieldByName('LIC_ID').AsString   := DokumentLICH_ID.AsString;
              if nAdresID > 0 then begin
                FieldByName('ADRES_ID').AsInteger := nAdresID;
              end;
              FieldByName('AKT_ROGD_NOMER').AsString := DokumentNOMER.AsString;
              FieldByName('AKT_ROGD_DATE').AsDateTime:= DokumentDateZ.AsDateTime;
              FieldByName('DATER').AsDateTime        := DokumentDateR.AsDateTime;

              if (DokumentIDENTIF.AsString<>'')
                then FieldByName('LICH_NOMER').AsString:=DokumentIDENTIF.AsString;

              //----- дата регистрации по месту жит. равна дате рождения ??? --------
              FieldByName('DATEP').AsDateTime:=DokumentDateZ.AsDateTime;
              WriteDvigChild(nIdChild,DokumentDateZ.AsDateTime);
              //---------------------------------------------------------------------

              FieldByName('POL').AsString            := DokumentPOL.AsString;
              FieldByName('FAMILIA').AsString        := DokumentFamilia.AsString;
              FieldByName('NAME').AsString           := DokumentName.AsString;
              FieldByName('OTCH').AsString           := DokumentOtch.AsString;

              if not DokumentDATESV.IsNull and (DokumentSVID_NOMER.AsString<>'') then begin
                FieldByName('PASP_UDOST').AsInteger:=SVID_ROG;  // uTypes.pas
                FieldByName('PASP_SERIA').AsString:=DokumentSVID_SERIA.AsString;
                FieldByName('PASP_NOMER').AsString:=DokumentSVID_NOMER.AsString;
                FieldByName('PASP_DATE').AsDateTime:=DokumentDATESV.AsDateTime;
                dmBase.WriteValueProp('PASP_VIDAN', GlobalTask.ParamAsString('NAME'), dmBase.GetDateCurrentSost, nIdChild, _TypeObj_Nasel, ftMemo);
              end;

              FieldByName('PRESENT').AsBoolean  := true;
              FieldByName('PROPIS').AsBoolean   := true;
              FieldByName('CANDELETE').AsBoolean:= false;

//              FieldByName('CITIZEN').AsString:=DokumentONA_GRAG.AsString;
              //  если ребенок записывается на лицевой счет то считаем, что он атоматически получает гражданство РБ
              FieldByName('CITIZEN').AsInteger:=MY_GRAG;

              // если папа или мама глава лиц. счета, то ребенок должн иметь отношение как: сын, дочь
              if (strIDFirst<>'') and ((strIDFirst=DokumentON_ID.AsString) or (strIDFirst=DokumentONA_ID.AsString)) then begin
                sKodOtnosh:='';
                if DokumentPOL.AsString='М' then begin
                  if dmBase.SprOtnosh.Locate('NAME','сын',[loCaseInsensitive])
                    then sKodOtnosh:=dmBase.SprOtnosh.FieldByName('ID').AsString;
                end else begin
                  if dmBase.SprOtnosh.Locate('NAME','дочь',[loCaseInsensitive])
                    then sKodOtnosh:=dmBase.SprOtnosh.FieldByName('ID').AsString;
                end;
                if sKodOtnosh<>''
                  then dmBase.tbMens.FieldByName('OTNOSH').AsString := sKodOtnosh;
              end else begin
//                i:=GetOtnoshForChild(DokumentPOL,);
//                if i>0 then begin
//
//                end;
              end;

              // запишем родителей
              FieldByName('PA_ID').AsString  := DokumentON_ID.AsString;
              FieldByName('MA_ID').AsString  := DokumentONA_ID.AsString;

              Post;
              sBookmarkChild:=dmBase.tbMens.Bookmark;
            end;
            //----------- попробуем подправить ИН у родителей --------------------
            if (DokumentON_IDENTIF.AsString<>'') and (DokumentON_ID.AsString<>'') then begin
              if dmBase.tbMens.Locate('DATE_FIKS;ID', VarArrayOf([dmBase.GetDateCurrentSost, DokumentON_ID.AsString]),[]) then begin
                dmBase.tbMens.Edit;
                dmBase.tbMens.FieldByName('LICH_NOMER').AsString:=DokumentON_IDENTIF.AsString;
                dmBase.tbMens.Post;
              end;
            end;
            if (DokumentONA_IDENTIF.AsString<>'') and (DokumentONA_ID.AsString<>'') then begin
              if dmBase.tbMens.Locate('DATE_FIKS;ID', VarArrayOf([dmBase.GetDateCurrentSost, DokumentONA_ID.AsString]),[]) then begin
                dmBase.tbMens.Edit;
                dmBase.tbMens.FieldByName('LICH_NOMER').AsString:=DokumentONA_IDENTIF.AsString;
                dmBase.tbMens.Post;
              end;
            end;
            //--- возвращаемся на запись ребенка --------
            if (sBookmarkChild<>'')
              then dmBase.tbMens.Bookmark:=sBookmarkChild;

            //----------------- запишем место рождения -------------------
            with dmBase.tbMensAdd do begin
              if not Locate('ID', nIdChild, []) then begin
                Append;
                FieldByName('ID').AsInteger := nIdChild;
              end else begin
                Edit;
              end;
              WriteField( FieldByName('MR_GOSUD')  , DokumentGOSUD   );
              WriteField( FieldByName('MR_B_OBL')  , DokumentB_OBL   );
              WriteField( FieldByName('MR_OBL')    , DokumentOBL     );
              WriteField( FieldByName('MR_RAION')  , DokumentRAION   );
              WriteField( FieldByName('MR_B_GOROD'), DokumentB_GOROD );
              WriteField( FieldByName('MR_GOROD')  , DokumentGOROD   );
              FieldByName('AKT_ROGD_ORGAN').AsString := fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','');
              Post;
            end;
            //--------- запишем ID ребенка в базу актов о рождении -------------
            if FMainTable.FieldByName('ID').AsInteger = DokumentID.AsInteger then begin
              FMainTable.Edit;
              FMainTable.FieldByName('CHILD_ID').AsInteger := nIdChild;
              FMainTable.FieldByName('PROV').AsBoolean := DokumentPROV.AsBoolean;
              FMainTable.Post;
            end else begin
              PutError(' Ошибка записи акта рождений! ',self);
            end;

            if lAdd then begin
              if DokumentPOL.AsString='М' then s := 'добавлен' else s := 'добавлена';
              ShowMessageCont(DokumentFamilia.AsString+' '+DokumentName.AsString+' '+
                          DokumentOtch.AsString+#13+' '+s+' на лицевой счет <'+strLich+'>',self);
            end else begin
              if DokumentPOL.AsString='М' then s := 'откорректирован' else s := 'откорректирована';
              ShowMessageCont(DokumentFamilia.AsString+' '+DokumentName.AsString+' '+
                          DokumentOtch.AsString+#13+' '+s+' на лицевом счете <'+strLich+'>',self);
            end;

            //------------------------------------------------------
            //  человека еще не добавляли в базу и нет ошибки
            if not lBeAdd and lAdd and not lErr
              then lCheckEn:=dmBase.CheckRunMen(_TypeObj_ZRogd,CHECK_EN,nIDChild,recID);
            //-------------------------------------------------------

          end;
        end;
      end;
    end;
    {$ENDIF}
    if Result then QueryExit:=false;
  end;
  if Result then FlushBuffers;

  {$IFNDEF ZAGS}
    if lCheckEn then begin
      SystemProg.SetRunMenReport(recID, 2{'SprMGS'});
    end;
  {$ENDIF}

end;

//-----------------------------------------------------------
// записать движение ребенка
procedure TfmZapisRogd.WriteDvigChild( nIDMen : Integer; dDateP:TDateTime);
begin
  if not dmBase.tbMensDvig.Locate('DATE_FIKS;ID;DATE', VarArrayOf([dmBase.GetDateCurrentSost,nIdMen,dDateP]),[]) then begin
    dmBase.tbMensDvig.Append;
    dmBase.tbMensDvig.FieldByName('DATE_FIKS').AsDateTime := dmBase.GetDateCurrentSost;
    dmBase.tbMensDvig.FieldByName('ID').AsInteger         := nIdMen;
    dmBase.tbMensDvig.FieldByName('DATE').AsDateTime      := dDateP;

    dmBase.tbMensDvig.FieldByName('TIP').AsInteger    := 1;  // прибыл
    dmBase.tbMensDvig.FieldByName('PRICH').AsString   := '';
    dmBase.tbMensDvig.FieldByName('TALON').AsString   := '';
    dmBase.tbMensDvig.FieldByName('ORGAN').AsString   := fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','');
    dmBase.tbMensDvig.FieldByName('CONTANT').AsString:='1';
    dmBase.tbMensDvig.FieldByName('DATE_SROK').AsString:='';
    dmBase.tbMensDvig.Post;
  end;
end;

//---------------------------------------------------------------------
procedure TfmZapisRogd.TBItemChoiceRogdClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  ParamFlt:TParamFieldFlt;
  sNomer,sSvidSeria,sNomerSvid,sNomerSprav:String;
  sRuk,sRukB,sSpec,sSpecB,sDok:String;
  sRukDolg,sSpecDolg:String;
  dDateAkt,dDateSvid,dDateSprav:TDateTime;
  nID,nID_ZAGS:Integer;
  lNew,l,lPovt:Boolean;
begin
//  if ExitAsGISUN(true) then exit;

//  ParamFlt:=nil;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ROGD');
  if Opis<>nil then begin

    ParamFlt:=CreateParamFlt(edONA_Familia.Text,'ONA_FAMILIA');
    if ParamFlt<>nil then Opis.AutoFilter:=true;

    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edONA_Familia, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      FRun:=true;
      l:=dbDisableControls(Dokument);
      try
        IsReadDokument:=true;

        lNew:=FAddNewDok;
        nID:=DokumentID.AsInteger;
        nID_ZAGS:=DokumentID_ZAGS.AsInteger;
        sDok:=DokumentDOKUMENT.AsString;
        sNomer:=DokumentNOMER.AsString;
        sSvidSeria:=DokumentSVID_SERIA.AsString;
        sNomerSvid:=DokumentSVID_NOMER.AsString;
        if DokumentSPRAV_DATE.IsNull
          then dDateSprav:=0 else dDateSprav:=DokumentSPRAV_DATE.AsDateTime;
        sNomerSprav:=DokumentSPRAV_NOMER.AsString;
        dDateAkt:=DokumentDATEZ.AsDateTime;
        dDateSvid:=DokumentDateSv.AsDateTime;
        sRuk:=DokumentRUKOV.AsString;
        sRukB:=DokumentRUKOV_B.AsString;
        sSpec:=DokumentSPEC.AsString;
        sSpecB:=DokumentSPEC_B.AsString;
        sRukDolg:=DokumentRUKOV_D.AsString;
        sSpecDolg:=DokumentSPEC_D.AsString;

        lPovt:=DokumentPOVTOR.AsBoolean;

        ReadDok(GetValueField(arrRec, 'ID'));
        if SvidPovtor.Active then SvidPovtor.EmptyTable;
        if HistZAGS.Active then HistZAGS.EmptyTable;

        EditDataSet(Dokument);
        CheckHistory(true);
        FAddNewDok:=lNew;
        DokumentID_ZAGS.AsInteger := nID_ZAGS;
        DokumentNAME_ZAGS.AsString:='';
        DokumentNAME_ZAGS_B.AsString:='';
        SetIDZags(0);
        if dDateSprav>0
         then DokumentSPRAV_DATE.AsDateTime:=dDateSprav else DokumentSPRAV_DATE.AsString:='';
        DokumentSPRAV_NOMER.AsString  := sNomerSprav;

        DokumentPOLE_GRN.AsInteger:=0;
        DokumentIDENTIF.AsString:='';
        DokumentFamilia.AsString:='';
        DokumentName.AsString:='';
        DokumentOtch.AsString:='';
        DokumentFamilia_B.AsString:='';
        DokumentName_B.AsString:='';
        DokumentOtch_B.AsString:='';
        DokumentDateR.AsString:='';
        DokumentDLINA.AsString:='';
        DokumentMASSA.AsString:='';
        DokumentSCHET.AsString:='';
        DokumentOSTAT.AsString:='';
        DokumentSP_A.AsString:='';
        DokumentSP_B.AsString:='';
        DokumentSP_C.AsString:='';
        DokumentSP_D.AsString:='';
        DokumentSP_E.AsString:='';
        DokumentSP_F.AsString:='';
        DokumentSP_G.AsString:='';
        DokumentSP_H.AsString:='';
        DokumentSP_I.AsString:='';
        DokumentSP_J.AsString:='';
        DokumentSP_K.AsString:='';
        DokumentSP_J_GOD.AsString:='';
        DokumentSP_C_GOD.AsString:='';
        DokumentTYPEROD.AsString:='1';
        DokumentGIVOROGD.AsString:='1';
        DokumentDATES.AsString:='';
        DokumentSOATO_ID.AsInteger:=-1;
        DokumentATE_FULLNAME.AsString:='';
        DokumentPOVTOR.AsBoolean:=lPovt;

        DokumentID.AsInteger:=nID;
        DokumentCHILD_ID.AsString:='';
        DokumentPOLE_GRN.AsString:='';
        DokumentNOMER.AsString:=sNomer;
        DokumentSVID_SERIA.AsString:=sSvidSeria;
        DokumentSVID_NOMER.AsString:=sNomerSvid;
        DokumentDATEZ.AsDateTime:=dDateAkt;
        DokumentDateSv.AsDateTime:=dDateSvid;

        DokumentDOKUMENT.AsString:=sDok;
        DokumentRUKOV.AsString:=sRuk;
        DokumentRUKOV_B.AsString:=sRukB;
        DokumentSPEC.AsString:=sSpec;
        DokumentSPEC_B.AsString:=sSpecB;
        DokumentRUKOV_D.AsString:=sRukDolg;
        DokumentSPEC_D.AsString:=sSpecDolg;

        PostDataSet(Dokument);
        IsReadDokument:=false;
      finally
        FRun:=false;
        dbEnableControls(Dokument,l);
        Screen.Cursor := old;
      end;
    end;
  end;
end;

//---------------------------------------------------------------------
procedure TfmZapisRogd.TBItemChoiceBrakClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
//  nID : Integer;
//  adr : TAdres;
  old : TCursor;
  strName : String;
//  f : TfmSimpleD;
  lCheck : Boolean;
//  SOATO:TSOATO;
  ParamFlt:TParamFieldFlt;
//  l:Boolean;
begin
//  if ExitAsGISUN(true) then exit;

  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_BRAK');
  if Opis<>nil then begin

//    if edON_Familia.Text<>'' then begin
//      Opis.DataSet.Filter := 'ON_FAMILIAP='+QStr(edON_Familia.Text);
//    end;
//    Opis.DataSet.Filtered := true;

    ParamFlt:=CreateParamFlt(edON_Familia.Text,'ON_FAMILIAP');
    if ParamFlt<>nil then Opis.AutoFilter:=true;

    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edON_Familia, v, arrRec, ParamFlt) and (v<>null) then begin
      old := Screen.Cursor;
      lCheck:=dbDisableControls(Dokument);
      Screen.Cursor := crHourGlass;
      FRun:=true;
      try
        EditDataSet(Dokument);
        s := GetValueField(arrRec, 'NAME_ZAGS');
        if s= '' then begin
          v := GetValueField(arrRec, 'ID_ZAGS');
          if dmBase.SprNames.Locate('ID', v, []) then begin
            s := dmBase.SprNames.FieldByName('NAME').AsString;
          end;
        end;
        strName := s;
        DokumentSVED_SVID.AsString    := strName;
        v := GetValueField(arrRec, 'DATEZ');       //  ???
        try
          DokumentSVED_DATEB.AsDateTime := v;
        except
          DokumentSVED_DATEB.Asstring := '';
        end;
        DokumentSVED_AKT.AsString := GetValueFieldEx(arrRec, 'NOMER','');
        DokumentSVED_NOT_SVID.AsBoolean:=true;

//        strName := fmMain.GetPadeg(s,'Т');
//        s := VarToStr(GetValueField(arrRec, 'NOMER'));
//        s := 'запись акта о заключении брака №'+s;
//        if v <> null then begin
//          s := s + ' совершена ' + FormatDateTime('dd.mm.yyyy', v)+'г. '+strName;
//          s := s + ' совершена '+strName;   дата сейчас добавляется автоматом в конец
//        end;

        DokumentON_ID.AsInteger := GetValueFieldEx(arrRec, 'ON_ID', 0);



        v := GetValueField(arrRec, 'ON_FAMILIAP');
        if v = null then DokumentON_FAMILIA.AsString := ''
                    else DokumentON_FAMILIA.AsString := v;
        v := GetValueField(arrRec, 'ON_NAME');
        if v = null then DokumentON_NAME.AsString := ''
                    else DokumentON_NAME.AsString := v;
        v := GetValueField(arrRec, 'ON_OTCH');
        if v = null then DokumentON_OTCH.AsString := ''
                    else DokumentON_OTCH.AsString := v;

        v := GetValueField(arrRec, 'ON_FAMILIAP_B');
        if v = null then DokumentON_FAMILIA_B.AsString := ''
                    else DokumentON_FAMILIA_B.AsString := v;
        v := GetValueField(arrRec, 'ON_NAME_B');
        if v = null then DokumentON_NAME_B.AsString := ''
                    else DokumentON_NAME_B.AsString := v;
        v := GetValueField(arrRec, 'ON_OTCH_B');
        if v = null then DokumentON_OTCH_B.AsString := ''
                    else DokumentON_OTCH_B.AsString := v;

        v := GetValueField(arrRec, 'ON_DATER');
        if v = null then DokumentON_DateR.AsString := ''
                    else DokumentON_DateR.Value    := v;
        v := GetValueField(arrRec, 'ON_NATION');
        if v = null then DokumentON_NATION.AsInteger:= 0
                    else DokumentON_NATION.Value    := v;
        v := GetValueField(arrRec, 'ON_GRAG');
        if v = null then DokumentON_GRAG.AsInteger:= 0
                    else DokumentON_GRAG.Value    := v;
        v := GetValueField(arrRec, 'ON_OBRAZ');
        if v = null then DokumentON_OBRAZ.AsString := ''
                    else DokumentON_OBRAZ.Value    := v;

        DokumentON_DOK_TYPE.AsString := GetValueFieldEx(arrRec, 'ON_DOK_TYPE','888');
        DokumentON_DOK_SERIA.AsString:= GetValueFieldEx(arrRec, 'ON_DOK_SERIA','');
        DokumentON_DOK_NOMER.AsString:= GetValueFieldEx(arrRec, 'ON_DOK_NOMER','');
        DokumentON_DOK_ORGAN.AsString:= GetValueFieldEx(arrRec, 'ON_DOK_ORGAN','');
        v := GetValueField(arrRec, 'ON_DOK_DATE');
        if v = null then DokumentON_DOK_DATE.AsString := ''
                    else DokumentON_DOK_DATE.Value    := v;
        DokumentON_DOKUMENT.AsString := GetValueFieldEx(arrRec, 'ON_DOKUMENT','');

        DokumentON_IDENTIF.AsString := CheckRUS2(GetValueFieldEx(arrRec, 'ON_IDENTIF',''));

        //  в браках: место рождения ON_...   в рождениях: место рождения ON_M_...
        DokumentON_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_GOSUD','');
        v := GetValueField(arrRec, 'ON_B_OBL');
        if v = null then DokumentON_M_B_OBL.AsString := ''
                    else DokumentON_M_B_OBL.Value    := v;
        v := GetValueFieldEx(arrRec, 'ON_OBL','');
        if v = null then DokumentON_M_OBL.AsString := ''
                    else DokumentON_M_OBL.Value    := v;
        DokumentON_M_RAION.AsString := GetValueFieldEx(arrRec, 'ON_RAION','');
        DokumentON_M_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_B_GOROD','');
        DokumentON_M_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_GOROD','');

        //  в браках: место жительства ON_M_...   в рождениях: место рождения ON_...
        DokumentON_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOSUD','');
        v := GetValueField(arrRec, 'ON_M_B_OBL');
        if v = null then DokumentON_B_OBL.AsString := ''
                    else DokumentON_B_OBL.Value    := v;
        v := GetValueFieldEx(arrRec, 'ON_M_OBL','');
        if v = null then DokumentON_OBL.AsString := ''
                    else DokumentON_OBL.Value    := v;

        DokumentON_RAION.AsString := GetValueFieldEx(arrRec, 'ON_M_RAION','');
        v:=GetValueFieldEx(arrRec, 'ON_M_B_RN',false);
        if v=true then begin
          DokumentON_RNGOROD.AsString := '';
        end else begin
          DokumentON_RNGOROD.AsString := DokumentON_RAION.AsString;
          DokumentON_RAION.AsString := '';
        end;

        DokumentON_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_M_B_GOROD','');
        DokumentON_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOROD','');

        DokumentON_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ON_M_GOROD_R','');
        DokumentON_DOM.AsString := GetValueFieldEx(arrRec, 'ON_M_DOM','');
        DokumentON_KORP.AsString := GetValueFieldEx(arrRec, 'ON_M_KORP','');
        DokumentON_KV.AsString := GetValueFieldEx(arrRec, 'ON_M_KV','');

        v := GetValueField(arrRec, 'ON_WORK');
        if v = null then DokumentON_WORK.AsString := ''
                    else DokumentON_WORK.Value    := v;

        DokumentONA_ID.AsInteger := GetValueFieldEx(arrRec, 'ONA_ID', 0);
        v := GetValueField(arrRec, 'ONA_FAMILIAP');
        if v = null then DokumentONA_FAMILIA.AsString := ''
                    else DokumentONA_FAMILIA.AsString := v;
        v := GetValueField(arrRec, 'ONA_NAME');
        if v = null then DokumentONA_NAME.AsString := ''
                    else DokumentONA_NAME.AsString := v;
        v := GetValueField(arrRec, 'ONA_OTCH');
        if v = null then DokumentONA_OTCH.AsString := ''
                    else DokumentONA_OTCH.AsString := v;

        v := GetValueField(arrRec, 'ONA_FAMILIAP_B');
        if v = null then DokumentONA_FAMILIA_B.AsString := ''
                    else DokumentONA_FAMILIA_B.AsString := v;
        v := GetValueField(arrRec, 'ONA_NAME_B');
        if v = null then DokumentONA_NAME_B.AsString := ''
                    else DokumentONA_NAME_B.AsString := v;
        v := GetValueField(arrRec, 'ONA_OTCH_B');
        if v = null then DokumentONA_OTCH_B.AsString := ''
                    else DokumentONA_OTCH_B.AsString := v;

        v := GetValueField(arrRec, 'ONA_DATER');
        if v = null then DokumentONA_DateR.AsString := ''
                    else DokumentONA_DateR.Value    := v;
        v := GetValueField(arrRec, 'ONA_NATION');
        if v = null then DokumentONA_NATION.AsInteger:= 0
                    else DokumentONA_NATION.Value    := v;
        v := GetValueField(arrRec, 'ONA_GRAG');
        if v = null then DokumentONA_GRAG.AsInteger:= 0
                    else DokumentONA_GRAG.Value    := v;
        v := GetValueField(arrRec, 'ONA_OBRAZ');
        if v = null then DokumentONA_OBRAZ.AsString := ''
                    else DokumentONA_OBRAZ.Value    := v;

        DokumentONA_DOK_TYPE.AsString := GetValueFieldEx(arrRec, 'ONA_DOK_TYPE','888');
        DokumentONA_DOK_SERIA.AsString:= GetValueFieldEx(arrRec, 'ONA_DOK_SERIA','');
        DokumentONA_DOK_NOMER.AsString:= GetValueFieldEx(arrRec, 'ONA_DOK_NOMER','');
        DokumentONA_DOK_ORGAN.AsString:= GetValueFieldEx(arrRec, 'ONA_DOK_ORGAN','');
        v := GetValueField(arrRec, 'ONA_DOK_DATE');
        if v = null then DokumentONA_DOK_DATE.AsString := ''
                    else DokumentONA_DOK_DATE.Value    := v;
        DokumentONA_DOKUMENT.AsString := GetValueFieldEx(arrRec, 'ONA_DOKUMENT','');

        DokumentONA_IDENTIF.AsString := CheckRUS2(GetValueFieldEx(arrRec, 'ONA_IDENTIF',''));

        //  в браках: место рождения ONA_...   в рождениях: место рождения ONA_M_...
        DokumentONA_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_GOSUD','');
        v := GetValueField(arrRec, 'ONA_B_OBL');
        if v = null then DokumentONA_M_B_OBL.AsString := ''
                    else DokumentONA_M_B_OBL.Value    := v;
        v := GetValueFieldEx(arrRec, 'ONA_OBL','');
        if v = null then DokumentONA_M_OBL.AsString := ''
                    else DokumentONA_M_OBL.Value    := v;
        DokumentONA_M_RAION.AsString := GetValueFieldEx(arrRec, 'ONA_RAION','');
        DokumentONA_M_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_B_GOROD','');
        DokumentONA_M_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_GOROD','');

        //  в браках: место жительства ONA_M_...   в рождениях: место рождения ONA_...
        DokumentONA_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOSUD','');
        v := GetValueField(arrRec, 'ONA_M_B_OBL');
        if v = null then DokumentONA_B_OBL.AsString := ''
                    else DokumentONA_B_OBL.Value    := v;
        v := GetValueFieldEx(arrRec, 'ONA_M_OBL','');
        if v = null then DokumentONA_OBL.AsString := ''
                    else DokumentONA_OBL.Value    := v;

        DokumentONA_RAION.AsString := GetValueFieldEx(arrRec, 'ONA_M_RAION','');
        v:=GetValueFieldEx(arrRec, 'ONA_M_B_RN',false);
        if v=true then begin
          DokumentONA_RNGOROD.AsString := '';
        end else begin
          DokumentONA_RNGOROD.AsString := DokumentONA_RAION.AsString;
          DokumentONA_RAION.AsString := '';
        end;
        DokumentONA_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_M_B_GOROD','');
        DokumentONA_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOROD','');

        DokumentONA_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOROD_R','');
        DokumentONA_DOM.AsString := GetValueFieldEx(arrRec, 'ONA_M_DOM','');
        DokumentONA_KORP.AsString := GetValueFieldEx(arrRec, 'ONA_M_KORP','');
        DokumentONA_KV.AsString := GetValueFieldEx(arrRec, 'ONA_M_KV','');

        v := GetValueField(arrRec, 'ONA_WORK');
        if v = null then DokumentONA_WORK.AsString := ''
                    else DokumentONA_WORK.Value    := v;

        v := GetValueField(arrRec, 'OTMETKA');
        if v = null then begin    // если отметка в з/а о браке пустая, не затирать текущее значение
          //DokumentOTMETKA.AsString := ''
        end else if Trim(DokumentOTMETKA.AsString)='' then begin  // только если отметка пустая в з/а о рождении
          WriteOTMETKA('OTMETKA', VarToStr(v), '');
        end;
        CheckSOATOAkt(true,true,true,'{SS}',0,'');
        PostDataSet(Dokument);
      finally
        Screen.Cursor := old;
        FRun:=false;
        dbEnableControls(Dokument,lCheck);
      end;
    end;
//    Opis.DataSet.Filter   := '';
//    Opis.DataSet.Filtered := false;
  end;
end;

{$IFDEF ZAGS}
procedure TfmZapisRogd.edON_FamiliaEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
//
end;
{$ELSE}
procedure TfmZapisRogd.edON_FamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  nID : Integer;
  adr : TAdres;
  old : TCursor;
  strName : String;
  p : TPassport;
  lCheck : Boolean;
  Pol:TPol;
  SOATO:TSOATO;
begin
  if ChoiceMen( edON_Familia, Trim(edON_FAMILIA.Text), 'POL='+QStr('М'), arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      lCheck:=dbDisableControls(Dokument);
      try
        EditDataSet(Dokument);
        v := GetValueField(arrRec, 'ID');
        DokumentON_ID.AsInteger := v;
        FOnOtnosh:=GetValueFieldEx(arrRec, 'OTNOSH',0);
        FOnLic:=GetValueFieldEx(arrRec, 'LIC_ID',0);
        // место рождения
        if dmBase.tbMensAdd.Locate('ID',v,[]) then begin
          WriteField( DokumentON_M_GOSUD, dmBase.tbMensAdd.FieldByName('MR_GOSUD') );
          WriteField( DokumentON_M_B_OBL, dmBase.tbMensAdd.FieldByName('MR_B_OBL') );
          WriteField( DokumentON_M_OBL, dmBase.tbMensAdd.FieldByName('MR_OBL') );
          WriteField( DokumentON_M_RAION, dmBase.tbMensAdd.FieldByName('MR_RAION') );
          WriteField( DokumentON_M_B_GOROD, dmBase.tbMensAdd.FieldByName('MR_B_GOROD') );
          WriteField( DokumentON_M_GOROD, dmBase.tbMensAdd.FieldByName('MR_GOROD') );
        end;

        DokumentON_FAMILIA.AsString:=GetValueFieldEx(arrRec, 'FAMILIA','');
        DokumentON_NAME.AsString:=GetValueFieldEx(arrRec, 'NAME','');
        DokumentON_OTCH.AsString:=GetValueFieldEx(arrRec, 'OTCH','');
        Pol:=tpM;
        DokumentON_Name_B.AsString:=dmBase.CheckNameBel(Pol, DokumentON_Name.Value);
        DokumentON_Otch_B.AsString:=dmBase.CheckOtchBel(Pol, DokumentON_Otch.AsString);
        DokumentON_Familia_B.AsString:=dmBase.GetBelFamily(DokumentON_Familia.AsString);

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
        nID := DokumentON_ID.AsInteger;
        s := dmBase.GetWork(nID, arrRec);
        if s <> '' then s:=s+', ';
        DokumentON_WORK.AsString := s + dmBase.GetDolg(nID, arrRec);
        DokumentON_DOKUMENT.AsString := dmBase.GetPasport(nID, arrRec);
        p := dmBase.GetRecPasport(nID, arrRec);
        if p.Nomer <> '' then begin
          DokumentON_DOK_TYPE.AsInteger := p.UdostKod;
          DokumentON_DOK_SERIA.AsString := p.Seria;
          DokumentON_DOK_NOMER.AsString := p.Nomer;
          DokumentON_DOKUMENT.AsString  := p.Organ;
          DokumentON_IDENTIF.AsString   := CheckRus2(p.LichNomer);
          DokumentON_DOK_DATE.AsDateTime:= p.Date;
        end;
        adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
        if adr.Punkt <> '' then DokumentON_GOROD.AsString := adr.PunktN;
        if adr.PunktTK>0 then DokumentON_B_GOROD.AsInteger:= adr.PunktTK;
//        if adr.UlicaDom <> '' then DokumentON_GOROD_R.AsString := adr.UlicaDom;
        if adr.Ulica<>'' then DokumentON_GOROD_R.AsString := adr.Ulica;
        if adr.NDom<>'' then DokumentON_DOM.AsString := adr.NDom;
        if adr.Korp<>'' then DokumentON_KORP.AsString := adr.Korp;
        if adr.Kv<>'' then DokumentON_KV.AsString := adr.Kv;

        s := dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'OTM_NATION', ftMemo);
        if s <> '' then begin
          WriteOTMETKA('OTMETKA', s, 'М');
  //        if DokumentOTMETKA.AsString<>'' then ss:=#13 else ss:='';
  //        DokumentOTMETKA.AsString := DokumentOTMETKA.AsString + ss + s;
        end;
        v := GetValueField(arrRec, 'LIC_ID');
        if v=null then DokumentLICH_ID.AsString := ''
                  else DokumentLICH_ID.AsString := v;

        CheckSoatoAkt(true,false,true,'{SS}{CHOICE}', 0,'');
        PostDataSet(Dokument);
      finally
        dbEnableControls(Dokument,lCheck);
        Screen.Cursor := old;
      end;
  end;
end;
{$ENDIF}

procedure TfmZapisRogd.edONA_FamiliaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
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
  Pol:TPol;
//  SOATO:TSOATO;
begin
  if ChoiceMen( edONA_Familia, Trim(edONA_FAMILIA.Text), 'POL='+QStr('Ж'), arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      lCheck:=dbDisableControls(Dokument);
      try
        EditDataSet(Dokument);
        v := GetValueField(arrRec, 'ID');
        DokumentONA_ID.AsInteger := v;
        FOnaOtnosh:=GetValueFieldEx(arrRec, 'OTNOSH',0);
        FOnaLic:=GetValueFieldEx(arrRec, 'LIC_ID',0);

        // место рождения
        if dmBase.tbMensAdd.Locate('ID',v,[]) then begin
          WriteField( DokumentONA_M_GOSUD, dmBase.tbMensAdd.FieldByName('MR_GOSUD') );
          WriteField( DokumentONA_M_B_OBL, dmBase.tbMensAdd.FieldByName('MR_B_OBL') );
          WriteField( DokumentONA_M_OBL, dmBase.tbMensAdd.FieldByName('MR_OBL') );
          WriteField( DokumentONA_M_RAION, dmBase.tbMensAdd.FieldByName('MR_RAION') );
          WriteField( DokumentONA_M_B_GOROD, dmBase.tbMensAdd.FieldByName('MR_B_GOROD') );
          WriteField( DokumentONA_M_GOROD, dmBase.tbMensAdd.FieldByName('MR_GOROD') );
        end;

        DokumentONA_FAMILIA.AsString:=GetValueFieldEx(arrRec, 'FAMILIA','');
        DokumentONA_NAME.AsString:=GetValueFieldEx(arrRec, 'NAME','');
        DokumentONA_OTCH.AsString := GetValueFieldEx(arrRec, 'OTCH','');
        Pol:=tpG;
        DokumentONA_Name_B.AsString := dmBase.CheckNameBel(Pol, DokumentONA_Name.Value);
        DokumentONA_Otch_B.AsString := dmBase.CheckOtchBel(Pol, DokumentONA_Otch.AsString);
        DokumentONA_Familia_B.AsString := dmBase.GetBelFamily(DokumentONA_Familia.AsString);

        v := GetValueField(arrRec, 'DATER');
        if v = null then DokumentONA_DateR.AsString := ''
                    else DokumentONA_DateR.Value    := v;
        v := GetValueField(arrRec, 'NATION');
        if v = null then DokumentONA_NATION.AsInteger:= 0
                    else DokumentONA_NATION.Value    := v;
        v := GetValueField(arrRec, 'CITIZEN');
        if v = null then DokumentONA_GRAG.AsInteger:= 0
                    else DokumentONA_GRAG.Value    := v;
        v := GetValueField(arrRec, 'OBRAZ');
        if v = null then DokumentONA_OBRAZ.AsString := ''
                    else DokumentONA_OBRAZ.Value    := v;
        s := dmBase.GetWork(DokumentONA_ID.AsInteger, arrRec);
        if s <> '' then s:=s+', ';
        nID := DokumentONA_ID.AsInteger;
        DokumentONA_WORK.AsString := s + dmBase.GetDolg(nID, arrRec);
        DokumentONA_DOKUMENT.AsString := dmBase.GetPasport(nID, arrRec);
        p := dmBase.GetRecPasport(nID, arrRec);
        if p.Nomer <> '' then begin
          DokumentONA_DOK_TYPE.AsInteger := p.UdostKod;
          DokumentONA_DOK_SERIA.AsString := p.Seria;
          DokumentONA_DOK_NOMER.AsString := p.Nomer;
          DokumentONA_DOKUMENT.AsString  := p.Organ;
          DokumentONA_IDENTIF.AsString   := CheckRus2(p.LichNomer);
          DokumentONA_DOK_DATE.AsDateTime:= p.Date;
        end;
        adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
        if adr.Punkt <> '' then DokumentONA_GOROD.AsString := adr.PunktN;
        if adr.PunktTK>0 then DokumentONA_B_GOROD.AsInteger:= adr.PunktTK;
//        if adr.UlicaDom <> '' then DokumentONA_GOROD_R.AsString := adr.UlicaDom;
        if adr.Ulica<>'' then DokumentONA_GOROD_R.AsString := adr.Ulica;
        if adr.NDom<>'' then DokumentONA_DOM.AsString := adr.NDom;
        if adr.Korp<>'' then DokumentONA_KORP.AsString := adr.Korp;
        if adr.Kv<>'' then DokumentONA_KV.AsString := adr.Kv;

        s := dmBase.ReadOneProp( dmBase.GetDateCurrentSost, nID, 'OTM_NATION', ftMemo);
        if s <> '' then begin
          WriteOTMETKA('OTMETKA', s, 'Ж');
  //        if DokumentOTMETKA.AsString<>'' then ss:=#13 else ss:='';
  //        DokumentOTMETKA.AsString := DokumentOTMETKA.AsString + ss + s;
        end;
        v := GetValueField(arrRec, 'LIC_ID');
        if v=null then DokumentLICH_ID.AsString := ''
                  else DokumentLICH_ID.AsString := v;

        CheckSoatoAkt(false,true,true,'{SS}{CHOICE}',0,'');
        PostDataSet(Dokument);
      finally
        dbEnableControls(Dokument,lCheck);
        Screen.Cursor := old;
      end;
  end;
end;

procedure TfmZapisRogd.lbLichGetText(Sender: TObject; var Text: String);
{$IFNDEF ZAGS}
var
  vKeyValues : Variant;
{$ENDIF}
begin
  Text := '';
  {$IFNDEF ZAGS}
  if DokumentLICH_ID.AsString<>'' then begin
    vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, DokumentLICH_ID.AsInteger);
    if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
      Text := dmBase.tbLich.FieldByName('NOMER').AsString;
    end;
  end;
  if Text<>'' then begin
    gbLich.Font.Color:=clBlue;
    gbLich.Font.Style:=gbLich.Font.Style+[fsBold];
  end else begin
    gbLich.Font.Color:=clBlack;
    gbLich.Font.Style:=gbLich.Font.Style-[fsBold];
  end;
  {$ENDIF}
end;
//-----------------------------------------------------------------------------
procedure TfmZapisRogd.CheckSOATOAkt(lOn,lOna:Boolean; lCheckVoenkom:Boolean; strParam:String; nAteID:Integer; strSoato:String);
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
      ATE:=dmBase.GetATEAkt(Dokument, 'ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_RNGOROD;ON_GOROD,ON_B_GOROD', strParam);
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
    FOnCheckSOATO:=false;
    if lCheckVoenkom and FAutoVus then begin  // определение военкомата по СОАТО места жительства
      n:=getVoenkomat(sSOATO, DokumentDATEZ, DokumentON_DATER, true, DokumentON_GRAG.AsInteger);
      if n>0 then begin
        EditDataSet(Dokument);
        DokumentON_VOENKOM.AsInteger:=n;
      end;
    end;
    nAteID:=0;     // !!! что-бы не влияло на маму, если lOn=true и lOna=true
    sSoato:='';
  end;
  if lOna then begin //and (DokumentSVED.AsInteger=3) then begin
    if nAteID>0 then begin
      sSoato:=strSoato;
    end else begin
      ATE:=dmBase.GetATEAkt(Dokument, 'ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION,ONA_RNGOROD;ONA_GOROD,ONA_B_GOROD', strParam);
      if ATE.ATE_ID>0 then begin
        sSoato:=ATE.Kod;
        nAteID:=ATE.ATE_ID;
      end else begin
        sSoato:='9000000000';
        nAteID:=0;
      end;
    end;
//    SOATO:=dmBase.GetSoatoAkt(Dokument,
//           'ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION,ONA_RNGOROD;ONA_GOROD,ONA_B_GOROD',true,FLenSoato);
    EditDataSet(Dokument);
    DokumentONA_SOATO.AsString:=sSOATO;
    DokumentONA_ATEID.AsInteger:=nAteID;
    FOnaCheckSOATO:=false;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmZapisRogd.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol:TPol;
  lCheck : Boolean;
//  SOATO:TSOATO;
//  d:TDateTime;
begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    strField := UpperCase(Field.FieldName);
    FRun := true;
    try
      if strField = 'FAMILIA' then begin
        if (Field.AsString<>'') then begin
          if DokumentON_Familia.AsString=''  then begin
            DokumentON_Familia.AsString:=CheckRegisterText(FTypeCheckRegistr,Field.AsString);
            DokumentON_Familia_B.AsString :=CheckRegisterText(FTypeCheckRegistr, dmBase.GetBelFamily( Field.AsString ));
          end;
          if DokumentONA_Familia.AsString='' then begin
            DokumentONA_Familia.AsString:=CheckRegisterText(FTypeCheckRegistr,Field.AsString);
            DokumentONA_Familia_B.AsString :=CheckRegisterText(FTypeCheckRegistr, dmBase.GetBelFamily( Field.AsString ));
          end;
        end;
      end else if strField = 'OTCH' then begin
        if (Field.AsString<>'') then begin
          if DokumentON_Name.AsString=''  then begin
            if DokumentPOL.AsString='Ж'  then begin
              if dmBase.SprNamesM.Locate('SUBNAME_G', Field.AsString,[]) then begin
                DokumentON_Name.AsString   := CheckRegisterText(FTypeCheckRegistr,dmBase.SprNamesM.FieldByName('NAME').AsString);
                DokumentON_Name_B.AsString := CheckRegisterText(FTypeCheckRegistr,dmBase.SprNamesM.FieldByName('NAME_B').AsString);
              end;
            end else begin
              if dmBase.SprNamesM.Locate('SUBNAME_M', Field.AsString,[]) then begin
                DokumentON_Name.AsString   := CheckRegisterText(FTypeCheckRegistr,dmBase.SprNamesM.FieldByName('NAME').AsString);
                DokumentON_Name_B.AsString := CheckRegisterText(FTypeCheckRegistr,dmBase.SprNamesM.FieldByName('NAME_B').AsString);
              end;
            end;
          end;
        end;
      end else if strField = 'FAMILIA_B' then begin
        if (Field.AsString<>'') and  (DokumentON_Familia_B.AsString='') then begin
          if DokumentON_Familia.AsString=DokumentFamilia.AsString
            then DokumentON_Familia_B.AsString := CheckRegisterText(FTypeCheckRegistr,Field.AsString);
        end;
        if (Field.AsString<>'') and  (DokumentONA_Familia_B.AsString='') then begin
          if Copy(DokumentONA_Familia.AsString,1,Length(DokumentFamilia.AsString))=DokumentFamilia.AsString
            then DokumentONA_Familia_B.AsString := CheckRegisterText(FTypeCheckRegistr,Field.AsString);
        end;
      end else if strField = 'ONA_FAMILIA' then begin
        if Field.AsString = '' then begin
  //        DokumentLICH_ID.AsString:='';
          DokumentONA_ID.AsString:='';
        end;
      end else if strField = 'ON_FAMILIA' then begin
        if Field.AsString = '' then begin
          DokumentON_ID.AsString:='';
        end;
      end else if strField = 'SCHET' then begin
        DokumentOSTAT.AsINteger:=DokumentSCHET.AsInteger;
      end else if (strField = 'ON_GRAG') or (strField = 'ONA_GRAG') then begin
        if (Dokument.FieldByName(strField).AsInteger>0) and  (Dokument.FieldByName(strField).AsInteger<>MY_GRAG) and DokumentON_CHERN.IsNUll then
          DokumentON_CHERN.AsInteger:=2; // иностранный гражданин
      end else if (strField = 'SVED') then begin
        if (DokumentSVED.AsString='3') and DokumentON_CHERN.IsNUll then
          DokumentON_CHERN.AsInteger:=1; // заявление матери
      end else if strField = 'SP_J_GOD' then begin
  //      d:=GetDateFromStr(DokumentSP_J_GOD.AsString,s);
  //      if d=0 then begin
  //        DokumentSP_J_GOD.AsString:=s;

  //      end;
      end else if (strField='ON_GOROD') or (strField='ON_RNGOROD') then begin
        if (strField='ON_RNGOROD') and (Field.AsString<>'')
          then DokumentON_RAION.AsString:='';
        {$IFDEF LAIS}
          CheckSOATOAkt(true,false,true,'{SS}',0,'');
        {$ELSE}
          CheckSOATOAkt(true,false,true,'{CHOICE}',0,'');
        {$ENDIF}
      end else if (strField='ONA_GOROD') or (strField='ONA_RNGOROD') then begin
        if (strField='ONA_RNGOROD') and (Field.AsString<>'')
          then DokumentONA_RAION.AsString:='';
        {$IFDEF LAIS}
          CheckSOATOAkt(false,true,true,'{SS}',0,'');
        {$ELSE}
          CheckSOATOAkt(false,true,true,'{CHOICE}',0,'');
        {$ENDIF}
      end else if (strField='ON_RAION') then begin
        if (Field.AsString<>'')
          then DokumentON_RNGOROD.AsString:='';
      end else if (strField='ONA_RAION') then begin
        if (Field.AsString<>'')
          then DokumentONA_RNGOROD.AsString:='';
      end;
      CheckSOATOAkt(FOnCheckSOATO,FOnaCheckSOATO,true,'{SS}',0,'');
      if FCheckBelName then begin
        EditDataSet(Dokument);
        Pol := tpNone;
        lCheck := false;
        if strField='NAME' then begin
          DokumentName_B.AsString := dmBase.CheckNameBel(Pol, Field.AsString);
          lCheck := true;
        end else if strField='OTCH' then begin
          DokumentOtch_B.AsString := dmBase.CheckOtchBel(Pol, Field.AsString);
          lCheck := true;
        end else if strField='ON_NAME' then begin
          DokumentON_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.AsString);
        end else if strField='ON_OTCH' then begin
          DokumentON_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.AsString);
        end else if strField='ONA_NAME' then begin
          DokumentONA_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.AsString);
        end else if strField='ONA_OTCH' then begin
          DokumentONA_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.asString);
        end else if strField='FAMILIA' then begin
          DokumentFamilia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end else if strField='ON_FAMILIA' then begin
          DokumentON_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end else if strField='ONA_FAMILIA' then begin
          DokumentONA_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
        end;
        CheckForAll_Bel(Field);
        {    см. FIOUpdateDataP
        if lCheck and (Pol <> tpNone) then begin
          if Pol = tpM then begin
            DokumentPOL.AsString := 'М';
          end else begin
            DokumentPOL.AsString := 'Ж';
          end;
        end;
        }
      end;
    finally
      FRun := false;
    end;
  end;
end;

procedure TfmZapisRogd.TBItemClearLichClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentLICH_ID.AsString := '';
  PostDataSet(Dokument);
end;

procedure TfmZapisRogd.UpdateActions;
begin
  inherited;
  TBItemClearLich.Enabled:=DokumentLICH_ID.AsString<>'';
  if N_F_cbFirstWeek.Checked then  begin
    edGivorogd.Color:=$009D9DFF;
    edDateS.Color:=$009D9DFF;
    lbDateS.Enabled := true;
    edDateS.Enabled := true;
  end else begin
    edGivorogd.Color:=clWindow;
    edDateS.Color:=clWindow;
    lbDateS.Enabled := false;
    edDateS.Enabled := false;
  end;
  {$IFDEF ZAGS}
  TBItemDolg.Enabled := N_F_edCopy.Checked;
  {$ELSE}
  if cbProvDvig.Visible then begin
    if DokumentLICH_ID.AsString='' then begin
      cbProvDvig.Enabled := false;
    end else begin
      cbProvDvig.Enabled := true;
    end;
  end;
  {$ENDIF}
end;

function TfmZapisRogd.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
//  dsObl.DataSet := nil;
//  dsObl.DataSet := dmBAse.LookupObl;
  {$IFNDEF ZAGS}
  if Result then begin
    cbProvDvig.Checked := not DokumentPROV.AsBoolean;
  end;
  {$ENDIF}

// в методе Create отключена проверка FCheckLookupField:=false
  if FOnlySvid then begin
    n:=LimitMRUList(3);
    SetMRUList(edGOROD_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);
    n:=LimitMRUList(1);
    SetMRUList(edOBL_Sv,n,1,true,false,false,FAddButtonMRUList);
    n:=LimitMRUList(2);
    SetMRUList(edRAION_Sv,n,2,true,false,false,FAddButtonMRUList);
  end else begin
    n:=LimitMRUList(3);
    SetMRUList(edGOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edON_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edON_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edONA_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    SetMRUList(edONA_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
    if tsSvid.TabVisible
      then SetMRUList(edGorod_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);
                          
    n:=LimitMRUList(1);
    SetMRUList(edOBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edON_M_OBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edON_OBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_M_OBL,n,1,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_OBL,n,1,true,false,false,FAddButtonMRUList);
    if tsSvid.TabVisible
      then  SetMRUList(edOBL_Sv,n,1,true,false,false,FAddButtonMRUList);

    n:=LimitMRUList(2);
    SetMRUList(edRAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edON_M_RAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edON_RAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_M_RAION,n,2,true,false,false,FAddButtonMRUList);
    SetMRUList(edONA_RAION,n,2,true,false,false,FAddButtonMRUList);
    if tsSvid.TabVisible
      then  SetMRUList(edRAION_Sv,n,2,true,false,false,FAddButtonMRUList);
  end;

end;

procedure TfmZapisRogd.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked  then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;

    edRukov.DataField   := 'RUKOV_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
    edZAGS.DataField := 'NAME_ZAGS_B';
    edON_NATION.ListField := 'NAME_M_B';
    edONA_NATION.ListField := 'NAME_G_B';
  end else begin
    ActivateRUSKeyboard;

    edRukov.DataField   := 'RUKOV';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
    edZAGS.DataField := 'NAME_ZAGS';
    edON_NATION.ListField := 'NAME_M';
    edONA_NATION.ListField := 'NAME_G';
  end;
end;

procedure TfmZapisRogd.edFamiliaEnter(Sender: TObject);
begin
 // if N_F_cbBelorus.Checked then CreateHint(H,edFamilia,DokumentFamilia.AsString+' ');
end;

procedure TfmZapisRogd.edNameEnter(Sender: TObject);
begin
 // if N_F_cbBelorus.Checked then CreateHint(H,edName,DokumentName.AsString+' ');
end;

procedure TfmZapisRogd.edOtchEnter(Sender: TObject);
begin
 // if N_F_cbBelorus.Checked then CreateHint(H,edOtch,DokumentOtch.AsString+' ');
end;

procedure TfmZapisRogd.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

procedure TfmZapisRogd.edON_FamiliaEnter(Sender: TObject);
begin
 // if N_F_cbBelorus.Checked then CreateHint(H,edON_Familia,DokumentON_Familia.AsString+' ');
end;

procedure TfmZapisRogd.edON_NameEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edON_Name,DokumentON_Name.AsString+' ');
end;

procedure TfmZapisRogd.edON_OTCHEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edON_Otch,DokumentON_Otch.AsString+' ');
end;

procedure TfmZapisRogd.edONA_FamiliaEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Familia,DokumentONA_Familia.AsString+' ');
end;

procedure TfmZapisRogd.edONA_NameEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Name,DokumentONA_Name.AsString+' ');
end;

procedure TfmZapisRogd.edONA_OTCHEnter(Sender: TObject);
begin
//  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Otch,DokumentONA_Otch.AsString+' ');
end;

procedure TfmZapisRogd.edFamiliaCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmZapisRogd.edRukovEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

procedure TfmZapisRogd.edSpecEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edSpec,DokumentSPEC.AsString+' '); end;

procedure TfmZapisRogd.CheckOnlyGod;
begin
  if cbOnlyGodON.Checked then begin
    edON_DATER.EditButton.Visible:=false;
    edON_DATER.EditFormat:='YYYY';
  end else begin
    edON_DATER.EditButton.Visible:=true;
    edON_DATER.EditFormat:='DD.MM.YYYY';
  end;
  if cbOnlyGodONA.Checked then begin
    edONA_DATER.EditButton.Visible:=false;
    edONA_DATER.EditFormat:='YYYY';
  end else begin
    edONA_DATER.EditButton.Visible:=true;
    edONA_DATER.EditFormat:='DD.MM.YYYY';
  end;
end;

procedure TfmZapisRogd.cbOnlyGodONClick(Sender: TObject);
begin
  CheckOnlyGod;
end;

procedure TfmZapisRogd.edSVED_SVIDEnter(Sender: TObject);
begin
  if DokumentSVED_SVID.AsString='' then begin
    if (DokumentSVED.AsString='3') and not DokumentDATEZ.IsNull then begin
      EditDataSet(Dokument);
      DokumentSVED_SVID.AsString := FormatDateTime('dd.mm.yyyy', DokumentDATEZ.AsDateTime); //+' г.';
    end;
  end;
end;

procedure TfmZapisRogd.btOtmClick(Sender: TObject);
begin
  edOTMETKA.AutoSelect:=false;
  edOTMETKA.Value := edOTMETKA.Value + '#';
  ActiveControl := edOTMETKA;
  edOTMETKA.SelStart := Length(edOTMETKA.Value);
  edOTMETKA.SelLength:= 1;
end;

procedure TfmZapisRogd.TBItemArxSprClick(Sender: TObject);
begin
  tsSprav.TabVisible := TBItemArxSpr.Checked;
//  if tsSprav.TabVisible
//    then edAddTextArx.Text := EmptyIzm+'.';
end;

procedure TfmZapisRogd.edTypeSpr1Change(Sender: TObject);
//var
//  s1,s2 : string;
begin
//  if (edTypeSpr.ItemIndex > -1) and not IsReadDokument then begin

//    s1:=GetPadegFIO(DokumentON_FamiliaP.Asstring+' '+DokumentON_Name.Asstring+' '+DokumentON_Otch.Asstring,'м','Т');
//    s2:=GetPadegFIO(DokumentONA_FamiliaP.Asstring+' '+DokumentONA_Name.Asstring+' '+DokumentONA_Otch.Asstring,'ж','Т');

//    if edTypeSpr.ItemIndex=1 then begin   // форма № 2
//      edAddTextArx.Text := 'Запись об отце произведена на основании заявления матери, не состоящей в браке, '+
//      'в соответствии со статьёй 55 Кодекса Республики Беларусь о браке и семье.'+Chr(13)+Chr(10)+
//      'Изменения, исправления, дополнения в запись акта о рождении не вносились.';
//    end else begin   // на основании записи акта о раст. брака
//      edAddTextArx.Text := 'Изменения, исправления, дополнения в запись акта о рождении не вносились.';
//    end;
//  end;
end;

procedure TfmZapisRogd.edSP_JEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edSP_J_GOD.Left := edSP_J.Left;
  edSP_J.Visible     := false;
  edSP_J_GOD.Visible := true;
  Dokument.CheckBrowseMode;
  Dokument.Edit;
  DokumentSP_J.AsString := '';
  ActiveControl:=edSP_J_GOD;
end;

procedure TfmZapisRogd.edSP_J_GODEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
// edSP_J_GOD.EditMask:='00.00.0000;1'
  edSP_J_GOD.Visible := false;
  edSP_J.Visible     := true;
  Dokument.CheckBrowseMode;
  Dokument.Edit;
  DokumentSP_J_GOD.AsString := '';
  ActiveControl:=edSP_J;
end;

procedure TfmZapisRogd.edSP_CEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edSP_C_GOD.Left := edSP_C.Left;
  edSP_C.Visible     := false;
  edSP_C_GOD.Visible := true;
  Dokument.CheckBrowseMode;
  Dokument.Edit;
  DokumentSP_C.AsString := '';
  ActiveControl:=edSP_C_GOD;
end;

procedure TfmZapisRogd.edSP_C_GODEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edSP_C_GOD.Visible := false;
  edSP_C.Visible     := true;
  Dokument.CheckBrowseMode;
  Dokument.Edit;
  DokumentSP_C_GOD.AsString := '';
  ActiveControl:=edSP_C;
end;

procedure TfmZapisRogd.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  AddSvid;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisRogd.edRAION_BChange(Sender: TObject);
//var
//  vKeyValues : Variant;
//  n : Integer;
begin
{
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  vKeyValues[0] := 2;
  vKeyValues[1] := Trim(edRaion.text);
  n := Length(Trim(edRaion.text));
  if dmBase.SprPerevod.Locate('TIP;R_NAME',vKeyValues,[loPartialKey]) then begin
    edRAION.Text:=dmBase.SprPerevod.FieldByName('R_NAME').AsString;
    edRAION.SelStart:=n;
    edRAION.SelLength:=200;
  end;
  }
end;

//procedure TfmZapisRogd.edOBL_RNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
//begin
//  CheckListObl(Sender,NewText,RecheckInList);
//end;

procedure TfmZapisRogd.edRaion_RNotInList(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisRogd.edON_RNGORODNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListRnGor(Sender,NewText,RecheckInList);
end;

procedure TfmZapisRogd.SpeedButtonClick(Sender: TObject);
begin
  Dokument.CheckBrowseMode;
  Dokument.Edit;

  DokumentONA_GOSUD.AsString   := DokumentON_GOSUD.AsString;
  DokumentONA_OBL.AsString     := DokumentON_OBL.AsString;
  DokumentONA_RAION.AsString   := DokumentON_RAION.AsString;
  DokumentONA_GOROD.AsString   := DokumentON_GOROD.AsString;
  DokumentONA_GOROD_R.AsString := DokumentON_GOROD_R.AsString;
  DokumentONA_RNGOROD.AsString := DokumentON_RNGOROD.AsString;

  DokumentONA_DOM.AsString := DokumentON_DOM.AsString;
  DokumentONA_KORP.AsString := DokumentON_KORP.AsString;
  DokumentONA_KV.AsString := DokumentON_KV.AsString;

  DokumentONA_B_GOROD.AsString := DokumentON_B_GOROD.AsString;
  DokumentONA_B_OBL.AsString := DokumentON_B_OBL.AsString;

  Dokument.Post;
end;

procedure TfmZapisRogd.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisRogd.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then begin

    if pc.Pages[pc.ActivePageIndex].Name='tsSvid'
      then CheckForAll_Bel( nil )
      else N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];

//    if (pc.ActivePageIndex=2) or (pc.Pages[pc.ActivePageIndex].Name='tsSvid')
//      then N_F_cbPovtor.Parent:=pc.Pages[pc.ActivePageIndex];

  end;
  if pc.ActivePageIndex=2 then begin
    if SpravEnabled and (DokumentDATEZ.AsString<>'') and (DokumentSPRAV_DATE.AsString='') then begin
      Dokument.CheckBrowseMode;
      Dokument.Edit;
      DokumentSPRAV_DATE.AsDateTime := DokumentDATEZ.AsDateTime;
      DokumentSPRAV_NOMER.AsString  := DokumentNOMER.AsString;
    end;
  end;
end;

procedure TfmZapisRogd.edSprav_NomerEnter(Sender: TObject);
begin
  if SpravEnabled and (DokumentDATEZ.AsString<>'') and (DokumentSPRAV_DATE.AsString='') then begin
    if Dokument.State<>dsEdit then Dokument.Edit;
    DokumentSPRAV_DATE.AsDateTime := DokumentDATEZ.AsDateTime;
    DokumentSPRAV_NOMER.AsString  := DokumentNOMER.AsString;
  end;
end;

procedure TfmZapisRogd.TBItemVozrastClick(Sender: TObject);
begin
  CheckOnlyVozrast(true);
end;

procedure TfmZapisRogd.CheckOnlyVozrast(lClear: Boolean);
begin
  if TBItemVozrast.Checked then begin
    lbDateR_Rodit.Caption := '18. Возраст';
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
  end else begin
    lbDateR_Rodit.Caption := '18. Дата рождения';
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
  end;
end;
//---------------------------------------------------------------------------
procedure TfmZapisRogd.TBItemAdoptClick(Sender: TObject);
{$IFDEF ZAGS}
var
  strErr : String;
  l:Boolean;
  p:TPassport;
{$ENDIF}
begin
{$IFDEF ZAGS}
  if not Problem('Внести изменения из записи акта об усыновлении(удочерении) ?',mtConfirmation,self) then exit;
  FRun:=true;
  l:=dbDisableControls(Dokument);
  try
  EditDataSet(Dokument);

  if (FNewDataSet.FieldByName('ON_FAMILIA').AsString<>'') and (Copy(FNewDataSet.FieldByName('ON_FAMILIA').AsString,1,1)<>'-') then begin
    FieldsAddHist([edON_Familia, edON_Name, edON_Otch, BLR_edON_Familia, BLR_edON_Name, BLR_edON_Otch, edON_NATION,
    ENG_edON_IDENTIF, edON_DATER, edON_M_GOSUD, edON_M_B_OBL, edON_M_RAION, edON_M_GOROD, edON_GRAG, edON_OBRAZ,
    edON_GOSUD, edON_OBL, edON_RAION, edON_GOROD, edON_RNGOROD, edON_GOROD_R, edON_DOM, edON_KORP, edON_KV, edON_WORK],true);

    CopyRecordEx(FNewDataSet, Dokument, 'ON_Familia;ON_Name;ON_Otch;ON_Familia_B;ON_Name_B;ON_Otch_B;ON_NATION;ON_IDENTIF;ON_DATER;'+
      'ON_M_GOSUD;ON_M_B_OBL;ON_M_OBL;ON_M_RAION;ON_M_B_GOROD;ON_M_GOROD;'+
      'ON_GOSUD;ON_B_OBL;ON_OBL;ON_RAION;ON_B_GOROD;ON_GOROD;ON_RNGOROD;'+
      'ON_OBRAZ;ON_GRAG;ON_WORK');
    DokumentON_GOROD_R.AsString := FNewDataSet.FieldByName('ON_GOROD_R').AsString;
    CheckSOATOAkt(true,false,false,'{SS}',0,'');

    p:=dmBase.GetPasportAkt('','DOC=ON_DOKUMENT;TYPE=ON_DOK_TYPE;SERIA=ON_DOK_SERIA;NOMER=ON_DOK_NOMER;DATE=ON_DOK_DATE',0,Dokument);
    DokumentON_DOKUMENT.AsString:=ANSIUpperCase(dmBase.PasportToText(p,0));
    FieldAddHist(DokumentON_DOKUMENT, edON_DOKUMENT, strErr);
    DokumentON_DOKUMENT.AsString:='';
    DokumentON_DOK_TYPE.AsString:='';
    DokumentON_DOK_DATE.AsString:='';
    DokumentON_DOK_SERIA.AsString:='';
  end;

  if (FNewDataSet.FieldByName('ONA_FAMILIA').AsString<>'') and (Copy(FNewDataSet.FieldByName('ONA_FAMILIA').AsString,1,1)<>'-') then begin
    FieldsAddHist([edONA_Familia, edONA_Name, edONA_Otch, BLR_edONA_Familia, BLR_edONA_Name, BLR_edONA_Otch, edONA_NATION,
    ENG_edONA_IDENTIF, edONA_DATER, edONA_M_GOSUD, edONA_M_B_OBL, edONA_M_RAION, edONA_M_GOROD, edONA_GRAG, edONA_OBRAZ,
    edONA_GOSUD, edONA_OBL, edONA_RAION, edONA_GOROD, edONA_RNGOROD, edONA_GOROD_R, edONA_DOM, edONA_KORP, edONA_KV, edONA_WORK],true);

    CopyRecordEx(FNewDataSet, Dokument, 'ONA_Familia;ONA_Name;ONA_Otch;ONA_Familia_B;ONA_Name_B;ONA_Otch_B;ONA_NATION;ONA_IDENTIF;ONA_DATER;'+
      'ONA_M_GOSUD;ONA_M_B_OBL;ONA_M_OBL;ONA_M_RAION;ONA_M_B_GOROD;ONA_M_GOROD;'+
      'ONA_GOSUD;ONA_B_OBL;ONA_OBL;ONA_RAION;ONA_B_GOROD;ONA_GOROD;ONA_RNGOROD;'+
      'ONA_OBRAZ;ONA_GRAG;ONA_WORK');
    DokumentONA_GOROD_R.AsString := FNewDataSet.FieldByName('ONA_GOROD_R').AsString;
    CheckSOATOAkt(false, true,false, '{SS}', 0, '');

    p:=dmBase.GetPasportAkt('','DOC=ONA_DOKUMENT;TYPE=ONA_DOK_TYPE;SERIA=ONA_DOK_SERIA;NOMER=ONA_DOK_NOMER;DATE=ONA_DOK_DATE',0,Dokument);
    DokumentONA_DOKUMENT.AsString:=ANSIUpperCase(dmBase.PasportToText(p,0));
    FieldAddHist(DokumentONA_DOKUMENT, edONA_DOKUMENT, strErr);
    DokumentONA_DOKUMENT.AsString:='';
    DokumentONA_DOK_TYPE.AsString:='';
    DokumentONA_DOK_DATE.AsString:='';
    DokumentONA_DOK_SERIA.AsString:='';

  end;

  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIADO').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIAPOSLE').AsString)) then begin
    FieldAddHist(DokumentFamilia, edFamilia, strErr);
    DokumentFamilia.AsString := FNewDataSet.FieldByName('FAMILIAPOSLE').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEDO').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEPOSLE').AsString)) then begin
    FieldAddHist(DokumentName, edName, strErr);
    DokumentName.AsString := FNewDataSet.FieldByName('NAMEPOSLE').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHDO').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHPOSLE').AsString)) then begin
    FieldAddHist(DokumentOtch, edOtch, strErr);
    DokumentOtch.AsString := FNewDataSet.FieldByName('OTCHPOSLE').AsString;
  end;

  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIADO_B').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIAPOSLE_B').AsString)) then begin
    FieldAddHist(DokumentFamilia_B, BLR_edFamilia, strErr);
    DokumentFamilia_B.AsString := FNewDataSet.FieldByName('FAMILIAPOSLE_B').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEDO_B').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEPOSLE_B').AsString)) then begin
    FieldAddHist(DokumentName_B, BLR_edName, strErr);
    DokumentName_B.AsString := FNewDataSet.FieldByName('NAMEPOSLE_B').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHDO_B').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHPOSLE_B').AsString)) then begin
    FieldAddHist(DokumentOtch_B, BLR_edOtch, strErr);
    DokumentOtch_B.AsString := FNewDataSet.FieldByName('OTCHPOSLE_B').AsString;
  end;

  if (FNewDataSet.FieldByName('IDENTIF_POSLE').AsString<>'') and
     not MySameText(FNewDataSet.FieldByName('IDENTIF_DO').AsString,FNewDataSet.FieldByName('IDENTIF_POSLE').AsString) then begin
    FieldAddHist(DokumentIDENTIF, ENG_edIDENTIF, strErr);
    DokumentIDENTIF.AsString:=FNewDataSet.FieldByName('IDENTIF_POSLE').AsString;
  end;
  if FNewDataSet.FieldByName('DATER_DO').AsDateTime<>FNewDataSet.FieldByName('DATER_POSLE').AsDateTime then begin
    FieldAddHist(DokumentDATER, edDateR, strErr);
    DokumentDATER.AsDateTime:=FNewDataSet.FieldByName('DATER_POSLE').AsDateTime;
  end;
  {
  if not MySameText(DokumentGOSUD.AsString,FNewDataSet.FieldByName('GOSUD_POSLE').AsString) or
     not MySameText(DokumentOBL.AsString,FNewDataSet.FieldByName('OBL_POSLE').AsString) or
     not MySameText(DokumentRAION.AsString,FNewDataSet.FieldByName('RAION_POSLE').AsString) or
     not MySameText(DokumentGOROD.AsString,FNewDataSet.FieldByName('GOROD_POSLE').AsString) then begin
    FieldAddHist(DokumentGOSUD, edGOSUD, strErr);
    FieldAddHist(DokumentOBL, edOBL, strErr);
    FieldAddHist(DokumentRAION, edRaion, strErr);
    FieldAddHist(DokumentGOROD, edGorod, strErr);
    FieldAddHist(DokumentOBL_B, BLR_edOBL, strErr);
    FieldAddHist(DokumentRAION_B, BLR_edRaion, strErr);
    FieldAddHist(DokumentGOROD_B, BLR_edGorod, strErr);

    DokumentGOSUD.AsString:=FNewDataSet.FieldByName('GOSUD_POSLE').AsString;
    DokumentOBL.AsString:=FNewDataSet.FieldByName('OBL_POSLE').AsString;
    DokumentB_OBL.AsString:=FNewDataSet.FieldByName('B_OBL_POSLE').AsString;
    DokumentRAION.AsString:=FNewDataSet.FieldByName('RAION_POSLE').AsString;
    DokumentB_GOROD.AsString:=FNewDataSet.FieldByName('B_GOROD_POSLE').AsString;
    DokumentGOROD.AsString:=FNewDataSet.FieldByName('GOROD_POSLE').AsString;
    DokumentOBL_B.AsString:=FNewDataSet.FieldByName('OBL_POSLE_B').AsString;
    DokumentRAION_B.AsString:=FNewDataSet.FieldByName('RAION_POSLE_B').AsString;
    DokumentGOROD_B.AsString:=FNewDataSet.FieldByName('GOROD_POSLE_B').AsString;
  end;
  }
{  if DokumentIZMEN.AsString<>''
    then DokumentIZMEN.AsString:=DokumentIZMEN.AsString+#13;
  DokumentIZMEN.AsString := DokumentIZMEN.AsString+'з/а об установлении отцовства № '+FNewDataSet.FieldByName('NOMER').AsString+' от '+
                            FormatDateTime('dd.mm.yyyy', FNewDataSet.FieldByName('DATEZ').AsDateTime)+' г.';

  if DokumentDATEZ.AsString=FNewDataSet.FieldByName('DATEZ').AsString then begin
    DokumentIZMEN.AsString := DokumentIZMEN.AsString+' и выдано первичное свидетельство о рождении '+DokumentSVID_SERIA.AsString+' №'+DokumentSVID_NOMER.AsString;
  end; }
//  if FNewDataSet.FieldByName('ZAMETKA').AsString<>'' then
//    WriteOTMETKA('OTMETKA', FNewDataSet.FieldByName('ZAMETKA').AsString, '');

  PostDataSet(Dokument);
  finally
    FRun:=false;
    dbEnableControls(Dokument,l);
    TBItemAdopt.Enabled:=false;
    FNewDataSet:=nil;
  end;
{$ENDIF}
end;
//---------------------------------------------------------------------------
procedure TfmZapisRogd.TBItemUstOtcClick(Sender: TObject);
var
  s,sFam, sFamNew, strErr, sIzm : String;
  l:Boolean;
  slIzm:TStringList;
  i:Integer;
begin
  if not Problem('Внести изменения из записи акта об установлении отцовства ?',mtConfirmation,self) then exit;
  FRun:=true;
  l:=dbDisableControls(Dokument);
  slIzm:=TStringList.Create;
  try
  EditDataSet(Dokument);
  FieldAddHist(DokumentON_Familia, edON_Familia, strErr);
  FieldAddHist(DokumentON_Name, edON_Name, strErr);
  FieldAddHist(DokumentON_Otch, edON_OTCH, strErr);
  FieldAddHist(DokumentON_Familia_B, BLR_edON_Familia, strErr);
  FieldAddHist(DokumentON_Name_B, BLR_edON_Name, strErr);
  FieldAddHist(DokumentON_Otch_B, BLR_edON_OTCH, strErr);
  if DokumentON_NATION.AsString<>'' then
    FieldAddHist(DokumentON_NATION, edON_NATION, strErr);

  if (FNewDataSet.FieldByName('ON_IDENTIF').AsString<>'') and (DokumentON_IDENTIF.AsString<>'') then begin
    FieldAddHist(DokumentON_IDENTIF, ENG_edON_IDENTIF, strErr);
    DokumentON_IDENTIF.AsString := CheckRUS2(FNewDataSet.FieldByName('ON_IDENTIF').AsString);
  end;     
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIADO').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIAPOSLE').AsString)) then begin
    FieldAddHist(DokumentFamilia, edFamilia, strErr);
    slIzm.Add('фамилия ребёнка с '+FNewDataSet.FieldByName('FAMILIADO').AsString+' на '+FNewDataSet.FieldByName('FAMILIAPOSLE').AsString);
    DokumentFamilia.AsString := FNewDataSet.FieldByName('FAMILIAPOSLE').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEDO').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEPOSLE').AsString)) then begin
    FieldAddHist(DokumentName, edName, strErr);
    slIzm.Add('имя ребёнка с '+FNewDataSet.FieldByName('NAMEDO').AsString+' на '+FNewDataSet.FieldByName('NAMEPOSLE').AsString);
    DokumentName.AsString := FNewDataSet.FieldByName('NAMEPOSLE').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHDO').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHPOSLE').AsString)) then begin
    FieldAddHist(DokumentOtch, edOtch, strErr);
    slIzm.Add('отчество ребёнка с '+FNewDataSet.FieldByName('OTCHDO').AsString+' на '+FNewDataSet.FieldByName('OTCHPOSLE').AsString);
    DokumentOtch.AsString := FNewDataSet.FieldByName('OTCHPOSLE').AsString;
  end;

  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIADO_B').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('FAMILIAPOSLE_B').AsString)) then begin
    FieldAddHist(DokumentFamilia_B, BLR_edFamilia, strErr);
    DokumentFamilia_B.AsString := FNewDataSet.FieldByName('FAMILIAPOSLE_B').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEDO_B').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('NAMEPOSLE_B').AsString)) then begin
    FieldAddHist(DokumentName_B, BLR_edName, strErr);
    DokumentName_B.AsString := FNewDataSet.FieldByName('NAMEPOSLE_B').AsString;
  end;
  if ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHDO_B').AsString))<>
     ANSIUpperCase(Trim(FNewDataSet.FieldByName('OTCHPOSLE_B').AsString)) then begin
    FieldAddHist(DokumentOtch_B, BLR_edOtch, strErr);
    DokumentOtch_B.AsString := FNewDataSet.FieldByName('OTCHPOSLE_B').AsString;
  end;

  sFam:=DokumentONA_Familia.AsString;
  //-------- если фамилия мамы после брака не пустая и она не та что в актовой записи о рождении ------
  sFamNew:=FNewDataSet.FieldByName('ONA_FAMILIA_BRAK').AsString;
  if (sFamNew<>'') and not MySameText(sFam, sFamNew) then begin
    FieldAddHist(DokumentONA_Familia, edONA_Familia, strErr);
    DokumentONA_Familia.AsString := sFamNew;
    if FNewDataSet.FieldByName('ONA_FAMILIA_BRAK_B').AsString<>'' then begin
      FieldAddHist(DokumentONA_Familia_B, BLR_edONA_Familia, strErr);
      DokumentONA_Familia_B.AsString := FNewDataSet.FieldByName('ONA_FAMILIA_BRAK_B').AsString;
    end;
  end;
  //-------------------------------------------------------------------------------------

  DokumentON_Familia.AsString := FNewDataSet.FieldByName('ON_FAMILIA').AsString;
  DokumentON_Name.AsString := FNewDataSet.FieldByName('ON_NAME').AsString;
  DokumentON_Otch.AsString := FNewDataSet.FieldByName('ON_OTCH').AsString;
  DokumentON_Familia_B.AsString := FNewDataSet.FieldByName('ON_FAMILIA_B').AsString;
  DokumentON_Name_B.AsString := FNewDataSet.FieldByName('ON_NAME_B').AsString;
  DokumentON_Otch_B.AsString := FNewDataSet.FieldByName('ON_OTCH_B').AsString;
  WriteDateField(DokumentON_DateR, FNewDataSet.FieldByName('ON_DATER'));
  DokumentON_NATION.AsString := FNewDataSet.FieldByName('ON_NATION').AsString;
  DokumentON_GRAG.AsString := FNewDataSet.FieldByName('ON_GRAG').AsString;

  //------ место жительства ---------------------

  DokumentON_GOSUD.AsString := FNewDataSet.FieldByName('ON_GOSUD').AsString;
  DokumentON_RAION.AsString := FNewDataSet.FieldByName('ON_RAION').AsString;

  DokumentON_B_OBL.AsVariant := FNewDataSet.FieldByName('ON_B_OBL').AsVariant;

  DokumentON_OBL.AsString := FNewDataSet.FieldByName('ON_OBL').AsString;
  DokumentON_B_GOROD.AsString := FNewDataSet.FieldByName('ON_B_GOROD').AsString;
  DokumentON_GOROD.AsString := FNewDataSet.FieldByName('ON_GOROD').AsString;
  DokumentON_GOROD_R.AsString := FNewDataSet.FieldByName('ON_GOROD_R').AsString;
  DokumentON_RNGOROD.AsString := FNewDataSet.FieldByName('ON_RNGOROD').AsString;
  DokumentON_DOM.AsString := FNewDataSet.FieldByName('ON_DOM').AsString;
  DokumentON_KORP.AsString := FNewDataSet.FieldByName('ON_KORP').AsString;
  DokumentON_KV.AsString := FNewDataSet.FieldByName('ON_KV').AsString;

  DokumentON_WORK.AsString := FNewDataSet.FieldByName('ON_WORK').AsString;
  DokumentON_OBRAZ.AsString := FNewDataSet.FieldByName('ON_OBRAZ').AsString;
  DokumentON_DOK_TYPE.AsString := FNewDataSet.FieldByName('ON_DOK_TYPE').AsString;
  DokumentON_DOK_SERIA.AsString := FNewDataSet.FieldByName('ON_DOK_SERIA').AsString;
  DokumentON_DOK_NOMER.AsString := FNewDataSet.FieldByName('ON_DOK_NOMER').AsString;

  DokumentON_IDENTIF.AsString  :=  CheckRUS2(FNewDataSet.FieldByName('ON_IDENTIF').AsString);

  //------ место рождения ---------------------
  DokumentON_M_GOSUD.AsString  := FNewDataSet.FieldByName('ON_M_GOSUD').AsString;
  DokumentON_M_B_OBL.AsVariant := FNewDataSet.FieldByName('ON_M_B_OBL').AsVariant;
  DokumentON_M_OBL.AsString    := FNewDataSet.FieldByName('ON_M_OBL').AsString;
  DokumentON_M_RAION.AsString  := FNewDataSet.FieldByName('ON_M_RAION').AsString;
  DokumentON_M_GOROD.AsString  := FNewDataSet.FieldByName('ON_M_GOROD').AsString;
  DokumentON_M_B_GOROD.AsString:= FNewDataSet.FieldByName('ON_M_B_GOROD').AsString;

  if FNewDataSet.FieldByName('ON_DOK_DATE').AsString<>''
    then DokumentON_DOK_DATE.AsDateTime := FNewDataSet.FieldByName('ON_DOK_DATE').AsDateTime
    else DokumentON_DOK_DATE.AsString   := '';
  DokumentON_DOK_ORGAN.AsString := FNewDataSet.FieldByName('ON_DOK_ORGAN').AsString;
  DokumentON_DOKUMENT.AsString := FNewDataSet.FieldByName('ON_DOKUMENT').AsString;

  // для передачи в регистр статуса
  try
    DokumentON_STATUS.AsString:=FNewDataSet.FieldByName('ON_STATUS').AsString;   // !!! 12.09.2017
  except
    DokumentON_STATUS.AsString:='';
  end;

  if DokumentIZMEN.AsString<>''
    then DokumentIZMEN.AsString:=DokumentIZMEN.AsString+#13;

  if slIzm.Count>0 then begin
    if slIzm.Count=1 then sIzm:='Изменена ' else sIzm:='Изменены ';
    for i:=0 to slIzm.Count-1 do begin
      sIzm:=sIzm+slIzm.Strings[i]+'; ';
    end;
    sIzm:=Copy(sIzm,1,Length(sIzm)-2)+' и внесены ';
  end else begin
    sIzm:='Внесены ';
  end;
  sIzm:=sIzm+'сведения об отце на основании записи акта об установлении отцовства № '+FNewDataSet.FieldByName('NOMER').AsString+' от '+
              FormatDateTime('dd.mm.yyyy', FNewDataSet.FieldByName('DATEZ').AsDateTime)+', совершенной в '+
              fmMain.SprNameOrg(FNewDataSet.FieldByName('ID_ZAGS').AsInteger,'','П',FNewDataSet.FieldByName('NAME_ZAGS').AsString)+'.';

  if (sFamNew<>'') then begin  // мать вступила в брак
    s:='Мать ребенка вступила в брак с отцом ребенка и ';
    if MySameText(sFam, sFamNew)
      then s:=s+'осталась на добрачной фамилии'
      else s:=s+'приняла фамилию '+sFamNew;
    if (FNewDataSet.FieldByName('ZBRAK_NOMER').AsString<>'') and (FNewDataSet.FieldByName('ZBRAK_DATE').AsString<>'')
      then s:=s+', запись акта о браке № '+FNewDataSet.FieldByName('ZBRAK_NOMER').AsString+' от '+
           FormatDateTime('dd.mm.yyyy', FNewDataSet.FieldByName('ZBRAK_DATE').AsDateTime)+' совершенная в '+
           fmMain.GetPadeg(FNewDataSet.FieldByName('ZBRAK_ORGAN').AsString, 'П');
    sIzm:=sIzm+#13#10+s;
  end;

  if DokumentIZMEN.AsString<>''
    then sIzm:=DokumentIZMEN.AsString+#13#10+sIzm;
  DokumentIZMEN.AsString:=sIzm;

//  if DokumentDATEZ.AsString=FNewDataSet.FieldByName('DATEZ').AsString then begin
//    DokumentIZMEN.AsString := DokumentIZMEN.AsString+', выдано первичное свидетельство о рождении '+DokumentSVID_SERIA.AsString+' №'+DokumentSVID_NOMER.AsString;
//  end;

//  if FNewDataSet.FieldByName('ZAMETKA').AsString<>'' then
//    WriteOTMETKA('OTMETKA', FNewDataSet.FieldByName('ZAMETKA').AsString, '');

  PostDataSet(Dokument);
  finally
    FRun:=false;
    dbEnableControls(Dokument,l);
    TBItemUstOtc.Enabled:=false;
    FNewDataSet:=nil;
    slIzm.Free;
  end;
end;
//-----------------------------------------------------------------
procedure TfmZapisRogd.Event_ClearOtec(Sender: TObject);
begin
  Event_Clear_('ON');
end;
//-----------------------------------------------------------------
procedure TfmZapisRogd.Event_ClearMat(Sender: TObject);
begin
  Event_Clear_('ONA');
end;
//-----------------------------------------------------------------
procedure TfmZapisRogd.Event_Clear_(s:String);
var
  ss:String;
begin
  if s='ONA' then ss:='о матери' else ss:='об отце';
  if Dokument.FieldByName(s+'_Familia').AsString<>'' then begin
    if not Problem(' Удалить данные '+ss+' ? ',mtConfirmation,self) then begin
      exit;
    end;
  end;
  EditdataSet(Dokument);
  Dokument.DisableControls;
  try
  if s='ON' then begin
    DokumentSVED.AsString:='3';   // заявление матери
  end;
  Dokument.FieldByName(s+'_DateR').AsString := '';;
  Dokument.FieldByName(s+'_VOZR').AsString := '';;
  Dokument.FieldByName(s+'_GRAG').AsString := '';

  Dokument.FieldByName(s+'_M_GOSUD').AsString := '';
  Dokument.FieldByName(s+'_M_RAION').AsString := '';
  Dokument.FieldByName(s+'_M_OBL').AsString := '';
  Dokument.FieldByName(s+'_M_B_GOROD').AsString := '';
  Dokument.FieldByName(s+'_M_GOROD').AsString := '';

  Dokument.FieldByName(s+'_GOSUD').AsString := '';
  Dokument.FieldByName(s+'_RAION').AsString := '';
  Dokument.FieldByName(s+'_OBL').AsString := '';
  Dokument.FieldByName(s+'_B_GOROD').AsString := '';
  Dokument.FieldByName(s+'_GOROD').AsString := '';
  Dokument.FieldByName(s+'_RNGOROD').AsString := '';
  Dokument.FieldByName(s+'_GOROD_R').AsString := '';
  Dokument.FieldByName(s+'_DOM').AsString := '';
  Dokument.FieldByName(s+'_KORP').AsString := '';
  Dokument.FieldByName(s+'_KV').AsString := '';
  Dokument.FieldByName(s+'_SOATO').AsString := '';

  Dokument.FieldByName(s+'_WORK').AsString := '';
  Dokument.FieldByName(s+'_OBRAZ').AsString := '';
  Dokument.FieldByName(s+'_DOKUMENT').AsString := '';
  Dokument.FieldByName(s+'_DOK_TYPE').AsString := '';
  Dokument.FieldByName(s+'_DOK_SERIA').AsString := '';
  Dokument.FieldByName(s+'_DOK_NOMER').AsString := '';
  Dokument.FieldByName(s+'_DOK_ORGAN').AsString := '';
  Dokument.FieldByName(s+'_DOK_DATE').AsString := '';
  Dokument.FieldByName(s+'_IDENTIF').AsString := '';
  Dokument.FieldByName(s+'_ID').AsString := '';
  Dokument.FieldByName(s+'_STATUS').AsString := '';
  finally
  Dokument.EnableControls;
  end;
end;

procedure TfmZapisRogd.CheckRnGorod;
var
  nW,nL,nT : Integer;
const
  nMaxWidth=290;  // !!!!!   максимальная длина  ("название района" + "название улицы")
begin
  if EnabledRnGorod or
     (not DokumentON_B_RN.IsNull and not DokumentON_B_RN.AsBoolean) then begin
    nL := edON_Work.Left;
    nT := edON_GOROD_R.Top;
    nW := edON_RNGOROD.Width;
    edON_RNGOROD.Left  := nL;
    edON_RNGOROD.Top   := nT;
    edON_GOROD_R.Width := nMaxWidth - nW - 5;
    edON_GOROD_R.Left  := nL + nW + 5;
    edON_RNGOROD.Visible := true;
  end else begin
    edON_RNGOROD.Visible := false;
    edON_GOROD_R.Width := edON_RAION.Width;
  end;

  if EnabledRnGorod or
     (not DokumentONA_B_RN.IsNull and not DokumentONA_B_RN.AsBoolean) then begin
    nL := edONA_Work.Left;
    nT := edONA_GOROD_R.Top;
    nW := edONA_RNGOROD.Width;
    edONA_RNGOROD.Left  := nL;
    edONA_RNGOROD.Top   := nT;
    edONA_GOROD_R.Width := nMaxWidth - nW - 5;
    edONA_GOROD_R.Left  := nL + nW + 5;
    edONA_RNGOROD.Visible := true;
  end else begin
    edONA_RNGOROD.Visible := false;
    edONA_GOROD_R.Width := edONA_RAION.Width;
  end;

end;

procedure TfmZapisRogd.edON_M_OBLNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisRogd.edONA_M_OBLNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;
                                  

// 1. Получить идентификатор ребенка
procedure TfmZapisRogd.TBItemStep11Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetIdentifChild(Self);
//  Gisun.CheckAkt(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

// 2. Зарегистрировать ребенка
procedure TfmZapisRogd.TBItemStep22Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterChild( Self);
//  Gisun.CheckAkt(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisRogd.TBItemStep2NotSvidClick(Sender: TObject);
{$IFDEF GISUN}
var
  Par:TParRegGISUN;
{$ENDIF}
begin
{$IFDEF GISUN}
  if DokumentSVED.AsString=SVED_MATER then begin  // заявление матери
    if Problem('Передать в ГИС РН запись акта без свидетельства ?',mtConfirmation,self) then begin
      Par:=TParRegGISUN.Create;
      Par.SetPar('EMPTY_SVID',true);
      RegisterAkt_GISUN(0,Par);
      Par.Free;
    end;
  end else begin
    ShowMessage('Без свидетельства можно передавать только по заявлению матери');
  end;
{$ENDIF}
end;

procedure TfmZapisRogd.TBItemOtmenaClick(Sender: TObject);
begin
{$IFDEF GISUN}
  Gisun.OtmenaAkt(Self);
  Gisun.CheckAkt(Self);
  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisRogd.TBItemNotOtmenaClick(Sender: TObject);
begin
{$IFDEF GISUN}
  Gisun.NotOtmenaAkt(Self);
  Gisun.CheckAkt(Self);
  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisRogd.TBItemRegPovtorClick(Sender: TObject);
begin
{$IFDEF GISUN}
  Gisun.RegisterPovtorAkt(Self);
  Gisun.CheckAkt(Self);
  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisRogd.edDateRUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender),1);
end;

procedure TfmZapisRogd.edON_DATERUpdateData(Sender: TObject; var Handled: Boolean);
begin CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender),12); end;

procedure TfmZapisRogd.edONA_DATERUpdateData(Sender: TObject; var Handled: Boolean);
begin CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender),11); end;

procedure TfmZapisRogd.edSVEDChange(Sender: TObject);
begin
  if edSved.ItemIndex=0 then begin
//    lbSved_DateB.Enabled:=true;
//    edSved_DateB.Enabled:=true;
    CheckControlSved(true);
    edSvedMat.Value:=0;  // 
  end else begin
//    lbSved_DateB.Enabled:=false;
//    edSved_DateB.Enabled:=false;
    CheckControlSved(false);
    edSvedMat.Value:=2;  // в браке не состоит
    edSved_DateB.Value:=null;
    edSvedAkt.Value:=null;
  end;
end;

procedure TfmZapisRogd.lbON_SOATOGetText(Sender: TObject; var Text: String);
var
  ATE:TAte;
begin
// было Text:=dmBase.GetNameTerr(DokumentON_SOATO.AsString,false,true);
{
    if nType>0 then begin
      if ate.obl='-' then lObl:=false;
      if ate.raion='-'  then lRn:=false;
      if ate.ss='-'  then lSS:=false;
      if ate.category=1 then lPost:=true;
    end;
}
//???  DokumentAteID
  ATE.ATE_ID:=0;
  ATE.Kod:=DokumentON_SOATO.AsString;
  ATE.Obl:='-';
  ATE.Category:=1;
  Text:=FullNameFromATE(ATE, 1, ', ');
end;

procedure TfmZapisRogd.lbONA_SOATOGetText(Sender: TObject; var Text: String);
var
  ATE:TAte;
begin
//  Text:=dmBase.GetNameTerr(DokumentONA_SOATO.AsString,false,true);
  ATE.ATE_ID:=0;
  ATE.Kod:=DokumentONA_SOATO.AsString;
  ATE.Obl:='-';
  ATE.Category:=1;
  Text:=FullNameFromATE(ATE, 1, ', ');
end;

procedure TfmZapisRogd.edON_SOATOClick(Sender: TObject);
begin
  if IsEmptySOATO(DokumentON_SOATO.AsString) or QuerySoato(FQuerySOATO)
    then CheckSoatoAkt(true,false,true,'{CHOICE}', 0,'');
end;

procedure TfmZapisRogd.edONA_SOATOClick(Sender: TObject);
//var
//  SOATO:TSOATO;
begin
  if IsEmptySOATO(DokumentONA_SOATO.AsString) or QuerySoato(FQuerySOATO)
    then CheckSoatoAkt(false,true,true,'{CHOICE}', 0,'');
//  SOATO:=dmBase.GetSoatoAkt(Dokument,
//    'ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION,ONA_RNGOROD;ONA_GOROD,ONA_B_GOROD',true,FLenSoato);
//  edONA_SOATO.Value:=SOATO.Kod;
//  FOnaCheckSOATO:=false;
end;

//-----------------------------------------------------------------------
function TfmZapisRogd.getDecl(lMale:Boolean; var arr:TArrStrings):String;
var
  strDecl,s,sss,ss : String;
  p : TPassport;
begin
  SetLength(arr,3);
  sss:='DOC=ON_DOKUMENT;TYPE=ON_DOK_TYPE;SERIA=ON_DOK_SERIA;NOMER=ON_DOK_NOMER;DATE=ON_DOK_DATE;LICH=ON_IDENTIF;';
  ss:='ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_RNGOROD,0;ON_GOROD,ON_B_GOROD;ON_GOROD_R,ON_*';  // <.> для краткого
  if lMale then begin
    strDecl := DokumentON_Familia.AsString+' '+DokumentON_Name.AsString+' '+DokumentON_Otch.AsString+' ';
    s:=dmBase.GetAdresAkt3(Dokument,ss,1);
    arr[0]:=Trim(strDecl);
    arr[1]:=Trim(s);
    strDecl := strDecl + ', '+s;

    p:=dmBase.GetPasportAkt(Self.Name+'.Dokument',sss,0);
    s:=dmBase.PasportToText(p,0);
    arr[2]:=Trim(s);
    if s<>'' then
      strDecl := strDecl + ', ' + s;

    Result := strDecl;
  end else begin
    strDecl := DokumentONA_Familia.AsString+' '+DokumentONA_Name.AsString+' '+DokumentONA_Otch.AsString+' ';
    arr[0]:=Trim(strDecl);

    sss:=StringReplace(sss,'ON_','ONA_',[rfReplaceAll]);
    ss:=StringReplace(ss,'ON_','ONA_',[rfReplaceAll]);

    s:=dmBase.GetAdresAkt3(Dokument,ss,1);
    arr[1]:=Trim(s);
    strDecl:=strDecl+', '+s;

    p:=dmBase.GetPasportAkt(Self.Name+'.Dokument',sss,0);
    s:=dmBase.PasportToText(p,0);
    arr[2]:=Trim(s);
    if s<>'' then
      strDecl:=strDecl+', '+s;

    Result := strDecl;
  end;
end;
//--------------------------------------------------------
procedure TfmZapisRogd.edDeclEnter(Sender: TObject);
var
  arr:TArrStrings;
  lMale:Boolean;
begin
  if DokumentDECL.AsString='' then begin
    EditDataSet(Dokument);
    if DokumentSVED.IsNull or (DokumentSVED.AsString='1') then begin
      lMale:=true;
    end else begin
      lMale:=false;
    end;
    getDecl(lMale,arr);
    DokumentDECL.AsString       := arr[0];
    DokumentDECL_ADRES.AsString := arr[1];
    DokumentDECL_DOK.AsString   := arr[2];
  end;
end;
//--------------------------------------------------------
procedure TfmZapisRogd.edDeclEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  arr:TArrStrings;
begin
  getDecl(true,arr);
  edDecl.Text      :=arr[0];
  edDecl_Adres.Text:=arr[1];
  edDecl_Dok.Text  :=arr[2];
end;
//--------------------------------------------------------
procedure TfmZapisRogd.edDeclEditButtons2Click(Sender: TObject; var Handled: Boolean);
var
  arr:TArrStrings;
begin
  getDecl(false,arr);
  edDecl.Text      :=arr[0];
  edDecl_Adres.Text:=arr[1];
  edDecl_Dok.Text  :=arr[2];
end;

procedure TfmZapisRogd.edDeclEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  s : String;
  adr : TAdres;
  nID : Integer;
  strName : String;
  lCheck : Boolean;
begin
  if ChoiceMen( edDecl, '', '', arrRec) then begin
      lCheck:=dbDisableControls(Dokument);
      try
        EditDataSet(Dokument);
        v := GetValueField(arrRec, 'ID');
        nID := StrToInt(VarToStr(v));

        edDecl.Text:=Trim(GetValueFieldEx(arrRec, 'FAMILIA','')+' '+GetValueFieldEx(arrRec, 'NAME','')+' '+GetValueFieldEx(arrRec, 'OTCH',''));

        s:='';
        adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
        if adr.Punkt <> ''    then s := adr.Punkt;
        if adr.UlicaDom <> '' then s := s + ', '+ adr.UlicaDom;
        if adr.Kv<>'' then s:=s+', '+SokrKV+adr.Kv;
        edDecl_Adres.Text:=s;

        edDecl_Dok.Text:=dmBase.GetPasport(nID, arrRec,', ');

      finally
        dbEnableControls(Dokument,lCheck);
      end;
  end;
end;

//----------------------------------------------------------------
function TfmZapisRogd.CreateSubMenuRun: Boolean;
var
 it : TTbItem;
 sep : TTbSeparatorItem;
begin
  inherited CreateSubmenuRun;
  Result:=true;

  TbItemQueryIN := TTbItem.Create(TBSubmenuRun);
  TbItemQueryIN.Caption:='Предлагать запрос ИН для ребенка (по умолчанию)';
  TbItemQueryIN.OnClick:=Event_QyeryINChild;
  TBSubmenuRun.Add(TbItemQueryIN);

  AddSubmenu_CheckFIO;

  TbItemSpecSved := TTbItem.Create(TBSubmenuRun);
  TbItemSpecSved.Caption:='Запись акта верна';
  TbItemSpecSved.OnClick:=Event_TrueSpecSved;
  TBSubmenuRun.Add(TbItemSpecSved);

  TbItemSvidNot := TTbItem.Create(TBSubmenuRun);
  TbItemSvidNot.Caption:='Запретить выдачу свидетельства';
  TbItemSvidNot.OnClick:=Event_SvidNot;
  TBSubmenuRun.Add(TbItemSvidNot);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Не печатать графу 30';
  it.OnClick:=Event_Not30;
  TBSubmenuRun.Add(it);

  AddSubmenu_ReadDolg;

  {$IFDEF LAIS}
//  TbItemSvidNot.Visibe:=false;
  {$ENDIF}

  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Удалить данные об отце';
  it.OnClick:=Event_ClearOtec;
  TBSubmenuRun.Add(it);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Удалить данные о матери';
  it.OnClick:=Event_ClearMat;
  TBSubmenuRun.Add(it);

  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Лишение родительских прав отца';
  it.OnClick:=Event_RodPravON;
  TBSubmenuRun.Add(it);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Лишение родительских прав матери';
  it.OnClick:=Event_RodPravONA;
  TBSubmenuRun.Add(it);

  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Ввести дату смерти';
  it.OnClick:=Event_DateS;
  TBSubmenuRun.Add(it);

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Аннулирование актовой записи';
  it.OnClick:=Event_Annulir;
  TBSubmenuRun.Add(it);

end;

procedure TfmZapisRogd.Event_DateS(Sender: TObject);
begin
  EnterDate(DokumentDATES, 'Дата смерти','Вы хотите отменить ввод даты смерти ?');
  EditDataSet(Dokument);
  DokumentDATE_ANUL.AsString:=DokumentDATE_ANUL.AsString;
end;

procedure TfmZapisRogd.Event_SvidNot(Sender: TObject);
var
  s:String;
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  DokumentSVIDNOT.AsBoolean:=TTbItem(Sender).Checked;
  pnAdd.Visible:=CheckAddPanel(s);
  lbAnnulir.Field.AsString:=lbAnnulir.Field.AsString;
end;

procedure TfmZapisRogd.Event_RodPravON(Sender: TObject);
begin
  EnterDate(DokumentON_DATE_LR, 'Дата лишения прав отца','Вы хотите отменить лишение родительских прав отца ?');
  EditDataSet(Dokument);
  DokumentON_SUDD_LR.Value:=DokumentON_DATE_LR.Value;
  Dokument.CheckBrowseMode;
  CheckLishRodPrav;
end;

procedure TfmZapisRogd.Event_RodPravONA(Sender: TObject);
begin
  EnterDate(DokumentONA_DATE_LR, 'Дата лишения прав матери','Вы хотите отменить лишение родительских прав матери ?');
  EditDataSet(Dokument);
  DokumentONA_SUDD_LR.Value:=DokumentONA_DATE_LR.Value;
  Dokument.CheckBrowseMode;
  CheckLishRodPrav;
end;

procedure TfmZapisRogd.Event_QyeryINChild(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  FQueryINChild:=TTbItem(Sender).Checked;
end;

procedure TfmZapisRogd.Event_TrueSpecSved(Sender: TObject);
begin
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  EditDataSet(Dokument);
  DokumentVERNO.AsBoolean:=TTbItem(Sender).Checked;
end;

{
function TfmZapisRogd.CheckAddPanel(var Text: String):Boolean;
begin
  Result:= inherited CheckAddPanel(Text);
//  if not DokumentDateS.IsNull then begin
//    if Text=''
//      then Result:=true;
//    Text:=Text+' Дата смерти '+FormatDateTime('dd.mm.yyyy',DokumentDateS.AsDateTime)+'г.'
//  end;
end;
}

// записать как новый
procedure TfmZapisRogd.CheckAsNew;
begin
  inherited CheckAsNew;
  EditDataSet(Dokument);
  DokumentCHILD_ID.AsString:='';    // обнулим ребенка
  Dokument.Post;
end;

//--------------------------------------------------------------
function TfmZapisRogd.EmptyIzm: String;
begin
  Result:=SprRogd_EmptyIzm;  // uProject
end;

//--------------------------------------------------------------
function TfmZapisRogd.GetAddPROP(sProp: String): Variant;
begin
  sProp:=UpperCase(sProp);
  if sProp='NEWSVED' then begin
    if FNewSved
      then Result:=true
      else Result:=false;
  end else begin
    Result:='';
  end;
end;

//---------------------------------------------------------------
function TfmZapisRogd.DefaultNewSved: Boolean;
begin
  Result:=true;
end;

//---------------------------------------------------------------
procedure TfmZapisRogd.CheckLishRodPrav;
begin
  if DokumentONA_DATE_LR.IsNull then begin
    if not DokumentON_DATE_LR.IsNull then begin
      gbON_LR.Top:=gbONA_LR.Top;
    end;
  end else begin
    gbON_LR.Top:=gbONA_LR.Top+55;
  end;

  if DokumentON_DATE_LR.IsNull then begin
    gbON_LR.Visible:=false;
  end else begin
    gbON_LR.Visible:=true;
  end;
  if DokumentONA_DATE_LR.IsNull then begin
    gbONA_LR.Visible:=false;
  end else begin
    gbONA_LR.Visible:=true;
  end;
end;
//-----------------------------------------------------------
procedure TfmZapisRogd.CheckATE;
{$IFDEF GISUN}
{$IFDEF GISUN2}
{var
  ATE:TATE;
  s,ss:String;
  sTypePunkt:String;
  n:Integer;
  c:TColor;
  lReadOnly:Boolean; }
{$ENDIF}
{$ENDIF}
begin
  {$IFDEF GISUN}
    {$IFDEF GISUN2}
      if IsActiveGISUN and IsActiveWorkATE then begin
         {
         if DokumentSOATO_ID.AsInteger>-1 then begin
           lReadOnly:=true;
           c:=GetDisableColor;
         end else begin
           lReadOnly:=false;
           c:=GetControlColor;
         end;
         edGOSUD.ReadOnly:=lReadOnly;
         edObl.ReadOnly:=lReadOnly;
         BLR_edObl.ReadOnly:=lReadOnly;
         edRaion_R.ReadOnly:=lReadOnly;
         edRaion_B.ReadOnly:=lReadOnly;
         edB_Gorod.ReadOnly:=lReadOnly;
         edGorod.ReadOnly:=lReadOnly;
         edGOSUD.Color:=c;
         edOBL_R.Color:=c;
         edOBL_B.Color:=c;
         edRAION_R.Color:=c;
         edRAION_B.Color:=c;
         edB_GOROD.Color:=c;
         edGOROD.Color:=c;
         }
      end;
    {$ENDIF}
  {$ENDIF}
end;
//-----------------------------------------------------------------
procedure TfmZapisRogd.GetATE;
{$IFDEF GISUN}
{$IFDEF GISUN2}
var
  ATE:TATE;
  s,ss:String;
  sTypePunkt:String;
  n:Integer;
{$ENDIF}
{$ENDIF}
begin
  {$IFDEF GISUN}
    {$IFDEF GISUN2}
      if IsActiveGISUN and IsActiveWorkATE then begin
        Dokument.CheckBrowseMode;
        ATE:=dmBase.GetATEAkt(Dokument, 'GOSUD,FName;OBL,B_OBL;RAION;GOROD,B_GOROD', '{NOT_RNGOR}{SS}{CHOICE}');
//        lbATE.Caption:=ATE.error+ATE.kod+chr(13)+chr(10)+ate.namec+' '+ate.name;
        Dokument.Edit;
        if ATE.ATE_ID>0 then begin
          DokumentSOATO_ID.AsInteger:=ATE.ATE_ID;
          if (Copy(ATE.Kod,2,1)='4') or (Copy(ATE.Kod,1,1)='5') then begin
            s:='';   // область не нужна
          end else begin
            s:=ATE.Obl;
            if s='' then s:=ATE.Raion else s:=s+' область'+chr(13);
            ss:=ATE.Raion;
            if ss<>'' then s:=s+ss+' район'+chr(13);
          end;
          s:=s+ATE.namec+' '+ATE.name;
          DokumentATE_FULLNAME.AsString:=s;

          sTypePunkt:=Gisun.Decode35_My_TypePunkt2(IntToStr(ATE.Category));
          try
            n:=StrToInt(sTypePunkt);
          except
            n:=0;
          end;

          GetATECheck;    // прочитаем значения исключений

          // область Брестская - Брест  ???
          if CheckIsClearATE(1, ATE.name, n, ATE.Obl) then begin
            DokumentOBL.AsString:='';
            DokumentOBL_B.AsString:='';
          end else begin
            DokumentOBL.AsString:=CheckEE(ATE.Obl,DokumentOBL.AsString);
            DokumentOBL_B.AsString:=ATE.Obl_B;
          end;

          // район Кобринский - Кобрин  ???
          if CheckIsClearATE(2, ATE.name, n, ATE.Raion) then begin
            DokumentRAION.AsString:='';
            DokumentRAION_B.AsString:='';
          end else begin
            DokumentRAION.AsString:=CheckEE(ATE.Raion,DokumentRAION.AsString);
            DokumentRAION_B.AsString:=ATE.Raion_B;
          end;

          DokumentGOROD.AsString:=CheckEE(ATE.Name,DokumentGOROD.AsString);
          DokumentGOROD_B.AsString:=ATE.Name_B;
          DokumentB_GOROD.AsString:=sTypePunkt;
        end else begin
          DokumentSOATO_ID.AsInteger:=0;
          DokumentATE_FULLNAME.AsString:='';
        end;
        PostDataSet(Dokument);
        CheckATE;
      end;
    {$ENDIF}
  {$ENDIF}
end;
//------------------------------------------------------------------------
procedure TfmZapisRogd.lbATEGetText(Sender: TObject; var Text: String);
begin
  {$IFDEF GISUN}
  {$IFDEF GISUN2}
  if IsActiveGISUN and IsActiveWorkATE then begin
    if DokumentSOATO_ID.AsInteger=-1 then begin
      Text:='Значение АТЕ не УСТАНОВЛЕНО';
    end else if DokumentSOATO_ID.AsInteger=0 then begin
      Text:='Значение АТЕ не найдено';
    end else begin
      Text:=DokumentATE_FULLNAME.AsString;
    end;
  end;
  {$ENDIF}
  {$ENDIF}
end;
//------------------------------------------------------------------------
procedure TfmZapisRogd.btSetATEClick(Sender: TObject);
begin
  GetATE;
end;

procedure TfmZapisRogd.btClearATEClick(Sender: TObject);
begin
  ClearATE;
end;

//------------------------------------------------------------------------
procedure TfmZapisRogd.ClearATE;
begin
  {$IFDEF GISUN}
  {$IFDEF GISUN2}
  if IsActiveGISUN and IsActiveWorkATE then begin
    if not FRun and not IsReadDokument then begin
      FRun:=true;
      EditDataSet(Dokument);
      DokumentSOATO_ID.AsInteger:=-1;
      DokumentATE_FULLNAME.AsString:='';
      FRun:=false;
      CheckATE;
    end;
  end;
  {$ENDIF}
  {$ENDIF}
end;
//------------------------------------------------------------------------
procedure TfmZapisRogd.CityUpdate2(Sender: TObject; var Handled: Boolean);
begin
  CityUpdate(Sender, Handled);
  ClearATE;
end;
//------------------------------------------------------------------------
procedure TfmZapisRogd.edOBLUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  ClearATE;
end;

procedure TfmZapisRogd.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if FOnlySvid then begin
    if (Shift=[ssCtrl]) then begin //and (Chr(Key=Chr( Asc('A') then begin
//      lbOn_sv.Caption:=inttostr(key);
      if (Key=74) or (Key=79) then begin  // Ctrl-O   на русском или английском
        ActiveControl:=edON_DateR;
      end;
      if (Key=77) or (Key=86) then begin  // Ctrl-М   на русском или английском
        ActiveControl:=edONA_DateR;
      end;
      if (Key=73) or (Key=66) then begin  // Ctrl-I Ctrl-И
        ActiveControl:=ENG_edIDENTIF;
      end;
    end;
  end else begin
    if (Shift=[]) and (Key=VK_F12) then begin //and (Chr(Key=Chr( Asc('A') then begin
      GetATE;
    end;
    if (Shift=[ssCtrl]) and (Key=VK_F12) then begin //and (Chr(Key=Chr( Asc('A') then begin
      ClearATE;
    end;
  end;
end;

//var
//  sss:String;

procedure TfmZapisRogd.Button1Click(Sender: TObject);
var
  s:String;
begin
  if edObl.EditButtons.Count>0
    then if edObl.EditButtons[0].Visible then s:='visible' else s:='not visible'
    else s:='-----';
  Showmessage(inttostr(edObl.EditButtons.Count)+'  '+s+'  '+inttostr(edObl.EditButtons[0].Width)+' Sys:'+Inttostr(GetSystemMetrics(SM_CXVSCROLL)));
//  SaveDokumentToFile;
end;

procedure TfmZapisRogd.Button2Click(Sender: TObject);
var
  sFile:String;
begin
  if PromptForFileName(sFile, '*.xml', '*.xml', 'Choice File XML', ExtractFilePath(Application.ExeName)+'SaveDok', False) then begin
    LoadDokumentFromFile(sFile);
    CheckHistory;
  end;
end;

procedure TfmZapisRogd.edDokumentEnter(Sender: TObject);
begin
  SendKeys('{END}', false);
end;

procedure TfmZapisRogd.edDecl_DokEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 p : TPassport;
 s : String;
begin
  fmEnterDokument:=TfmEnterDokument.Create(nil);
  with fmEnterDokument do begin
    tb.Edit;
    {
    tbDOK_TYPE.AsString:=DokumentDOK_TYPE.AsString;
    tbDOK_SERIA.AsString:=DokumentDOK_SERIA.AsString;
    tbDOK_NOMER.AsString:=DokumentDOK_NOMER.AsString;
    tbDOK_ORGAN.AsString:=DokumentDOK_ORGAN.AsString;
    tbDOK_NAME.AsString:=DokumentDOK_NAME.AsString;
    WriteDateField(tbDOK_DATE,DokumentDOK_DATE);
    }
    if EditDokument then begin
      Application.ProcessMessages;
      EditDataSet(Dokument);
      p := dmBase.PasportFromValues(tbDOK_TYPE.AsInteger, tbDOK_SERIA.AsString, tbDOK_NOMER.AsString,
                           tbDOK_NAME.AsString, '', tbDOK_DATE.Value);
      s := dmBase.PasportToText(p,0);
      if s<>'' then begin
        DokumentDECL_DOK.AsString:=s;
      end;
      PostDataSet(Dokument);
    end;
  end;
end;

//------------------------------------------------------------------------
procedure TfmZapisRogd.CheckControlSvid;
var
  n:Integer;
begin
  if GlobalTask.ParamAsBoolean('INVERT_SVID') then begin
    Init_ArrCheckControl(18);
    n:=0;
    FArrCheckControl[n].Cont1:=edFamilia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edFamiliaB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edName_Sv;
    FArrCheckControl[n].Cont2:=BLR_edNameB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edOtch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOtchB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=Label76;
    FArrCheckControl[n].Cont2:=Label77; Inc(n);

    FArrCheckControl[n].Cont1:=edGosud_Sv;
    FArrCheckControl[n].Cont2:=BLR_edGosud_Sv_B; Inc(n);

    FArrCheckControl[n].Cont1:=edObl_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOblB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edRAION_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRaionB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edGorod_Sv;
    FArrCheckControl[n].Cont2:=BLR_edGorodB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edTypeGorod_Sv;
    FArrCheckControl[n].Cont2:=BLR_edTypeGorodB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edRukov_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRukovB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edON_Familia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_FamiliaB_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_Name_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_NameB_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_Otch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_OtchB_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_Nation_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_NATION_SV_B; Inc(n);

    FArrCheckControl[n].Cont1:=edONA_Familia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_FamiliaB_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_Name_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_NameB_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_Otch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_OtchB_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_Nation_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_NATION_SV_B;
    //Inc(n);
  end;
end;
//---------------------------------------------------------------------------------
procedure TfmZapisRogd.Event_Torgest(Sender: TObject);
begin
//
end;
//---------------------------------------------------------------------------------
procedure TfmZapisRogd.Event_Not30(Sender: TObject);
begin
  EditDataSet(Dokument);
  TTbItem(Sender).Checked:=not TTbItem(Sender).Checked;
  DokumentNOTPRINT29.AsBoolean:=TTbItem(Sender).Checked;
  PostDataSet(Dokument);
end;
//---------------------------------------------------------------------------------
procedure TfmZapisRogd.N_F_cbTorgestClick(Sender: TObject);
begin
//  lbTwoDecl.Visible:=N_F_cbTorgest.Checked;
//  edTwoDecl.Visible:=N_F_cbTorgest.Checked;
//  edTwoDecl.Text:='';
end;
procedure TfmZapisRogd.edTorgestvChange(Sender: TObject);
begin
  lbTwoDecl.Visible:=edTorgestv.ItemIndex>0;
  edTwoDecl.Visible:=edTorgestv.ItemIndex>0;
  edTwoDecl.Text:='';
end;
//------------------------------------------------------------------------------------------
procedure TfmZapisRogd.edTwoDeclEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  arr:TArrStrings;
begin
  getDecl(true,arr);
  edTwoDecl.Text:=arr[0]+', '+arr[1]+', '+arr[2];
end;
//------------------------------------------------------------------------------------------
procedure TfmZapisRogd.edTwoDeclEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  arr:TArrStrings;
begin
  getDecl(false,arr);
  edTwoDecl.Text:=arr[0]+', '+arr[1]+', '+arr[2];
end;

//------------------------------------------------------------------------------------------
procedure TfmZapisRogd.SetOnlyPovtorSvid(lOnlyPovtor:Boolean;pc:TPageControl; ts:TWinControl; NonVisibleControls : array of TVarRec; lbSvid,lbNomer:TLabel);
begin
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
  if lOnlyPovtor then begin
    TBItemSeekAkt.Visible:=true;
//  TBSubmenuGISUN.Visible:=false;
    TBItemStep2.Caption:='Зарегистрировать свидетельство';
    TBItemArxSpr.Visible:=false;
    TBItemChoiceBrak.Visible:=false;
    TBItemChoiceRogd.Visible:=false;
    TBItemVozrast.Visible:=false;
    lbIdentif.Parent:=tsSvid;
    lbIDENTIF.Top:=Label80.Top;
    lbIDENTIF.Left:=edDateR_Sv.Left+edDateR_Sv.Width+50;
    lbIDENTIF.Caption:='Иден. номер';
    ENG_edIDENTIF.Parent:=tsSvid;
    ENG_edIDENTIF.Top:=edDateR_Sv.Top;
    ENG_edIDENTIF.Left:=lbIDENTIF.Left+lbIDENTIF.Width+50;

    edON_DATER.Parent:=tsSvid;
    edON_DATER.Top:=edON_Familia_Sv.Top-26;
    edON_DATER.Left:=lbON_Sv.Left+lbON_Sv.Width+30;
//    edON_DATER.Left:=edON_Familia_Sv.Left;
//    edON_DATER.Font.Color:=clBlue;
    edON_DATER.TabOrder:=200;

    ENG_edON_IDENTIF.Parent:=tsSvid;
    ENG_edON_IDENTIF.Top:=BLR_edON_FamiliaB_Sv.Top-26;
    ENG_edON_IDENTIF.Left:=edON_DATER.Left+edON_DATER.Width+30;
//    ENG_edON_IDENTIF.Left:=BLR_edON_FamiliaB_Sv.Left;
//    ENG_edON_IDENTIF.Font.Color:=clBlue;
    ENG_edON_IDENTIF.TabOrder:=201;

    edONA_DATER.Parent:=tsSvid;
    edONA_DATER.Top:=edONA_Familia_Sv.Top-26;
    edONA_DATER.Left:=lbONA_Sv.Left+lbONA_Sv.Width+30;
//    edONA_DATER.Left:=edONA_Familia_Sv.Left;
//    edONA_DATER.Font.Color:=clBlue;
    edONA_DATER.TabOrder:=202;

    ENG_edONA_IDENTIF.Parent:=tsSvid;
    ENG_edONA_IDENTIF.Top:=BLR_edONA_FamiliaB_Sv.Top-26;
    ENG_edONA_IDENTIF.Left:=edONA_DATER.Left+edONA_DATER.Width+30;
//    ENG_edONA_IDENTIF.Left:=BLR_edONA_FamiliaB_Sv.Left;
//    ENG_edONA_IDENTIF.Font.Color:=clBlue;
    ENG_edONA_IDENTIF.TabOrder:=203;

  end;
end;

//------------------------------------------------------------------------------------------
function TfmZapisRogd.CheckDokumentSimple(nType: Integer; lWriteDok:Boolean): Boolean;
var
  strErr,s,ss,sss:String;
  lVerno:Boolean;
  dChild:TDateTime;
  n:Integer;
  procedure AddErr(s:String);
  begin
    strErr:=strErr+s+chr(13)+chr(10);
  end;
  function isFullCheck:Boolean;
  begin
    if (DokumentDateZ.AsDateTime>IncDay(dmBase.GetCurDate,-31))
      then result:=true
      else result:=false;
  end;
const
  strSpec='Специальные сведения ';
begin
  lVerno:=DokumentVERNO.AsBoolean;
//  if Role.SystemAdmin then begin
//    Result:=true;
//    exit;
//  end;
  Result:=inherited CheckDokumentSimple(nType, lWriteDok);
  if Result then begin
    strErr := '';
    if DokumentDATEZ.IsNull then begin
      AddErr('Дата акта о рождении. ');
    end else if DokumentNOMER.AsString='' then begin
      AddErr('Номер акта о рождении.');
//  end else if DokumentSVID_NOMER.AsString='' then begin
//    strErr := ' Заполните номер свидетельства о рождении. ';
    end else if DokumentDATER.AsString='' then begin
      AddErr('Дата рождения ребенка.');
    end else if DokumentPOL.AsString='' then begin
      if DokumentGIVOROGD.AsBoolean=true
        then AddErr('Пол ребенка.');
    end else if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then begin
      if DokumentGIVOROGD.AsBoolean=true
        then AddErr('Заполните Фамилию, Имя ребенка.');
    end else if IsFullCheck and (DokumentTYPEROD.AsString='') or (DokumentGIVOROGD.AsString='') then begin
      if not FOnlySvid  then AddErr(' Заполните 8 и 9 пункт. ');
    end;
    if not Grag_Dok(DokumentON_GRAG.Asstring,DokumentON_DOK_TYPE.Asstring,ss) then begin
      if not lVerno and not FOnlySvid and (DokumentPOVTOR.AsBoolean=false) then begin
        AddErr('Отец, несоответствие: '+ss);
      end;
    end;
    if not Grag_Dok(DokumentONA_GRAG.Asstring,DokumentONA_DOK_TYPE.AsString,ss) then begin
      if not lVerno and not FOnlySvid and (DokumentPOVTOR.AsBoolean=false) then begin
        AddErr('Мать, несоответствие: '+ss);
      end;
    end;
    if (FAddNewDok {DokumentID.AsInteger=-1}) and (DokumentSVED.AsInteger=1) and (DokumentSVED_DATEB.IsNull) then begin
      if not FOnlySvid and (DokumentPOVTOR.AsBoolean=false) and (DokumentTYPEREG.AsInteger=1) then begin
        if (DokumentON_GRAG.AsString=MY_GRAG_STR) and (DokumentONA_GRAG.AsString=MY_GRAG_STR) then begin
          if YearOf(DokumentDATEZ.AsDateTime)>=YearOf(dmBase.GetCurDate)-1
            then AddErr('Заполните дату заключения брака.');
        end;
      end;
    end;
    ss:=CheckRUS2(DokumentIDENTIF.AsString);
    sss:=CheckRUS2(DokumentONA_IDENTIF.AsString);
    if (ss<>'') and (sss<>'') and (ss=sss) then AddErr('ИН матери совпадает с ИН ребенка.');
    sss:=CheckRUS2(DokumentON_IDENTIF.AsString);
    if (ss<>'') and (sss<>'') and (ss=sss) then AddErr('ИН отца совпадает с ИН ребенка.');

    if not DokumentDATEZ.IsNull then begin
      n:=YearOf(DokumentDATEZ.AsDateTime);
      if (n<getMinYear) or (n>getMaxYear)
        then AddErr('Дата записи акта: "'+DatePropis(DokumentDATEZ.AsDateTime,5)+'"');
    end;

    if (DokumentPOVTOR.AsBoolean=false) then begin    // дата первичного свидетельства не может быть меньше текущей даты
      if FWriteBeforeGisun and (Trim(DokumentSVID_NOMER.AsString)<>'') then begin
        s:=CheckFieldDate(DokumentDATESV,-1,YearOf(dmbase.getCurDate),false,'<',DokumentDATEZ);
        if s<>'' then  AddErr('Дата выдачи свидетельства '+s);
      end;
    end;

    if not DokumentSVED_DATEB.IsNull then begin
      n:=YearOf(DokumentSVED_DATEB.AsDateTime);
      if (n<getMinYear) or (n>getMaxYear)
        then AddErr('Год заключения брака: "'+IntToStr(n)+'"');
    end;
    if not DokumentDATER.IsNull then begin
      n:=YearOf(DokumentDATER.AsDateTime);
      if not lVerno and ((n<getMinYear) or (n>getMaxYear))
        then AddErr('Год рождения ребенка: '+IntToStr(n));
    end;

    if not FOnlySvid and (DokumentPOVTOR.AsBoolean=false) and (DokumentVOSSTAN.AsBoolean=false) then begin
//      d:=Dokument.FieldByName('DATEZ').AsDateTime;
      dChild:=DokumentDateR.AsDateTime;

      if not DokumentVERNO.AsBoolean then begin
        if dChild>DokumentDATEZ.AsDateTime then begin
          AddErr('Дата рождения ребенка больше даты записи акта.');
        end;
      end;

      if not DokumentVERNO.AsBoolean then begin
        if not DokumentON_DateR.IsNull then begin
          n:=GetCountYear(dChild,DokumentON_DateR.AsDateTime);
          if (n<10) or (n>90) then AddErr('Возраст отца: '+IntToStr(n));
        end;
        if not DokumentONA_DateR.IsNull then begin
          n:=GetCountYear(dChild,DokumentONA_DateR.AsDateTime);
          if (n<10) or (n>65) then AddErr('Возраст матери: '+IntToStr(n));
        end;
        if DokumentGIVOROGD.AsBoolean=true and (DokumentMASSA.AsString<>'') then begin
          if (DokumentMASSA.AsInteger<=0) or (DokumentMASSA.AsInteger>11000) then AddErr('Вес ребенка.');
        end;
      end;

      if (FAddNewDok {DokumentID.AsInteger=-1}) and (DokumentTYPEREG.AsInteger=1)  then begin // запись акта еще не сохранялась  и не подкидыш и не отказник
        if not DokumentVERNO.AsBoolean and (DokumentDateZ.AsDateTime>IncDay(dmBase.GetCurDate,-31)) then begin

          s:=CheckRnBigGorod(DokumentON_GOROD, DokumentON_RAION, DokumentON_RNGOROD);
          if s<>'' then AddErr('Отец, '+s);
          s:=CheckRnBigGorod(DokumentONA_GOROD, DokumentONA_RAION, DokumentONA_RNGOROD);
          if s<>'' then AddErr('Мать, '+s);

          if (DokumentON_GOSUD.AsInteger=MY_GRAG) and (DokumentSVED.AsString='1') then begin
            if (DokumentON_SOATO.AsString='') or (Copy(DokumentON_SOATO.AsString,2,6)='000000') or
               ( (Pos( Copy(DokumentON_SOATO.AsString,1,4)+',',GOROD_WITH_RN)>0) and (Copy(DokumentON_SOATO.AsString,5,3)='000'))
              then AddErr('Не определен код территории места жительства отца.')
          end;
          if (DokumentONA_GOSUD.AsInteger=MY_GRAG)  then begin
            if (DokumentONA_SOATO.AsString='') or (Copy(DokumentONA_SOATO.AsString,2,6)='000000') or
               ( (Pos( Copy(DokumentONA_SOATO.AsString,1,4)+',',GOROD_WITH_RN)>0) and (Copy(DokumentONA_SOATO.AsString,5,3)='000'))
              then AddErr('Не определен код территории места жительства матери.')
          end;
          if DokumentSVED.AsInteger=1 then begin // брак зарегистрирован
            if DokumentON_DateR.IsNull  then AddErr('Дата рождения отца.');
            if DokumentON_NATION.IsNull then AddErr('Национальность отца.');
            if DokumentON_OBRAZ.IsNull  then AddErr('Образование отца.');
          end;
          if DokumentONA_DateR.IsNull  then AddErr('Дата рождения матери.');
          if DokumentONA_NATION.IsNull then AddErr('Национальность матери.');
          if DokumentONA_OBRAZ.IsNull  then AddErr('Образование матери.');
          // специальные сведения
          if (DokumentSP_D.AsString<>'') and (DokumentGIVOROGD.AsBoolean=true) then begin
             if (DokumentSP_D.AsInteger<150) or (DokumentSP_D.AsInteger>330)
               then AddErr(strSpec+'D)');
          end;      
          if (DokumentSCHET.AsInteger>0) and (DokumentSP_B.AsInteger>0) then begin // 14
             if (DokumentSP_F.AsInteger>0) and (DokumentSCHET.AsInteger>DokumentSP_B.AsInteger)
               then AddErr(strSpec+'В)');
             if (DokumentSP_F.AsInteger=0) and (DokumentSCHET.AsInteger<DokumentSP_B.AsInteger)
               then AddErr(strSpec+'F)');
          end;
          if (DokumentSP_A.AsInteger>0) then begin // 23
             if (DokumentSCHET.AsInteger<DokumentSP_E.AsInteger)
               then AddErr(strSpec+'E)');
             if (DokumentSCHET.AsInteger<DokumentSP_I.AsInteger)
               then AddErr(strSpec+'I)');
          end;
          if (DokumentSP_A.AsInteger<DokumentSP_B.AsInteger) or ((DokumentSP_A.AsInteger=1) and (DokumentSP_B.AsInteger<>1)) // 25
            then AddErr(strSpec+'A) B)');
          if (DokumentSP_A.AsInteger>1) then begin  // 26
            if ((DokumentSP_E.AsInteger+DokumentSP_F.AsInteger+DokumentSP_G.AsInteger+DokumentSP_H.AsInteger)<>(DokumentSP_A.AsInteger-1)) then begin
              if ((DokumentSP_E.AsInteger+DokumentSP_F.AsInteger+DokumentSP_H.AsInteger)<>(DokumentSP_A.AsInteger-1)) then begin
                AddErr(strSpec+'A) E) F) G) H)');
              end;      
            end;        
            if ((DokumentSP_E.AsInteger+DokumentSP_F.AsInteger)<>(DokumentSP_B.AsInteger-1))
              then AddErr(strSpec+'A) E) F)');
            if (DokumentSP_K.AsInteger=0)
              then AddErr(strSpec+'K) ');
          end;
        end;
      end;
    end;
    FLastError:=strErr;
    if FLastError<>'' then Result:=false;
  end;
end;

procedure TfmZapisRogd.edON_GOSUDUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if not FRun then begin
    FOnCheckSOATO:=true;
  end;
end;

procedure TfmZapisRogd.edONA_GOSUDUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if not FRun then begin
    FOnaCheckSOATO:=true;
  end;
end;

procedure TfmZapisRogd.edSP_AUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueInteger(1,1,10,15,edSP_A,1);
end;

procedure TfmZapisRogd.edMassaUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueInteger(500,500,4500,6000,edMassa,1);
end;

procedure TfmZapisRogd.edDlinaUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  CheckValueInteger(10,20,60,100,edDlina,1);
end;

procedure TfmZapisRogd.edSchetUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueInteger(0,0,5,10,edSchet,1);
end;

procedure TfmZapisRogd.edSP_BUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueInteger(1,1,5,10,edSP_B,1);
end;

procedure TfmZapisRogd.edSP_DUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueInteger(210,265,300,320,edSP_D,1);
end;

procedure TfmZapisRogd.edSP_EUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueInteger(1,1,5,10,edSP_E,1);
end;

procedure TfmZapisRogd.edSP_FUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueInteger(0,0,5,10,edSP_F,1);
end;

procedure TfmZapisRogd.edSP_GUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueInteger(0,0,5,10,edSP_G,1);
end;

procedure TfmZapisRogd.edSP_HUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueInteger(0,0,5,10,edSP_H,1);
end;

procedure TfmZapisRogd.edSP_IUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  CheckValueInteger(0,0,5,10,edSP_I,1);
end;

procedure TfmZapisRogd.edSP_KUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueInteger(1,1,4,4,edSP_K,1);
end;
//-------------------------------------------------------------------------------------------
procedure TfmZapisRogd.ENG_edIDENTIFEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  if (Gisun.GetPoleGrn(FPoleGrn)=rPost) then begin
    PutError('Взаимодействие с ГИС РН завершено.',self)
  end else begin
    if (ENG_edIDENTIF.Text='') then begin
      if LockOperation(_TypeOper_ChoiceIN,'') then begin
        try
          if ChoiceFromLookupSpr('LOOKUP_LIST_IN', 'IDENTIF', true,ENG_edIDENTIF) then begin
            dmBase.AdsConnection.Execute('DELETE FROM BaseProp WHERE typeobj='+IntToStr(_TypeObj_IN)+' and pokaz='+QStr('IN')+' and value='+QStr(ENG_edIDENTIF.Text));
            GlobalTask.LogFile.WriteToLogFile('Выдан зарезервированный #ИН '+QStr(ENG_edIDENTIF.Text));
          end;
        finally
          UnLockOperation(_TypeOper_ChoiceIN);
        end;
      end;
    end else begin
      PutError('ИН должен быть пуст.',self)
    end;
  end;
end;

procedure TfmZapisRogd.edON_FamiliaEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Event_ClearOtec(Sender);
end;

//---------------------------------
procedure TfmZapisRogd.edON_DATERCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin DrawState:=FOnlySvid; end;
//---------------------------------
procedure TfmZapisRogd.ENG_edONA_IDENTIFCheckDrawRequiredState(Sender: TObject; var DrawState: Boolean);
begin DrawState:=FOnlySvid;  end;
//-------------------------------------------------------
procedure TfmZapisRogd.edDecl_AdresEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  adr : TAdres;
  s : String;
  sFIO:String;
begin
  sFIO:='';
  s:=VvodDecl(false,false,sFIO,adr);
  if s<>'' then begin
    EditDataSet(Dokument);
    DokumentDECL_ADRES.AsString := s;
    PostDataSet(Dokument);
  end;
end;
//-------------------------------------------------------
procedure TfmZapisRogd.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;
//-------------------------------------------------------
procedure TfmZapisRogd.edRukov_SvEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov_Sv);
end;
//-------------------------------------------------------
procedure TfmZapisRogd.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;
//-------------------------------------------------------
procedure TfmZapisRogd.ReadLastAddDok;
begin
  DokumentName.AsString:='';
  DokumentName_B.AsString:='';
  DokumentDLINA.AsString:='';
  DokumentMASSA.AsString:='';
end;
//-------------------------------------------------------
procedure TfmZapisRogd.N_F_cbFirstWeekClick(Sender: TObject);
begin
{
  if not FRun and not IsReadDokument then begin
    FRun:=true;
    if DokumentFIRSTWEEK.AsBoolean then begin
      EditDataSet(Dokument);
      DokumentFIRSTWEEK.AsBoolean:=false;
    end else begin
      if Problem('Ребенок умер в течение первых шести дней жизни ?') then begin
        EditDataSet(Dokument);
        DokumentFIRSTWEEK.AsBoolean:=true;
      end;
    end;
    FRun:=false;
  end;
}
end;

//----------------------------------------------------------------------
procedure TfmZapisRogd.edON_VoenkomEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edON_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
end;
procedure TfmZapisRogd.edON_VoenkomEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  edON_Voenkom.Value:=null;
end;
procedure TfmZapisRogd.edON_VoenkomEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  WriteVOENKOM(1,false);
end;
//----------------------------------------------------------------------
procedure TfmZapisRogd.edONA_VOENKOMEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if GlobalTask.ParamAsString('ID_VOENKOM')<>''
    then edONA_Voenkom.Value:=GlobalTask.ParamAsString('ID_VOENKOM');
end;
procedure TfmZapisRogd.edONA_VOENKOMEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  edONA_Voenkom.Value:=null;
end;
procedure TfmZapisRogd.edONA_VOENKOMEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  WriteVOENKOM(2,false);
end;
//----------------------------------------------------------------------
procedure TfmZapisRogd.WriteVOENKOM(nType:Integer; lCheckVozr:Boolean);
var
  sSOATO:String;
  n:Integer;
  fld:TField;
begin
  if nType=1 then begin
    sSOATO:=DokumentON_SOATO.AsString;
//     dmBase.GetSoatoAkt(Dokument,
//           'ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_RNGOROD;ON_GOROD,ON_B_GOROD',true,FLenSoato);
  end else begin
    sSOATO:=DokumentONA_SOATO.AsString;
//    SOATO:=dmBase.GetSoatoAkt(Dokument,
//           'ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION,ONA_RNGOROD;ONA_GOROD,ONA_B_GOROD',true,FLenSoato);
  end;
  if nType=1
    then fld:=DokumentON_VOENKOM
    else fld:=DokumentONA_VOENKOM;
  n:=dmBase.VoenkomFromSOATO(sSOATO);
  if n>0 then begin
    EditDataSet(Dokument);
    fld.AsInteger:=n;
  end else if fld.AsInteger>0 then begin
    EditDataSet(Dokument);
    fld.AsString:='';
  end;
end;
//------------------------------------------------------------
function TfmZapisRogd.CheckFIO: String;
begin
  Result:=CheckOneFIO('Ребенок: ',DokumentFamilia.AsString, DokumentName.AsString, DokumentOtch.AsString);
  if Result='' then begin
    Result:=CheckOneFIO('Отец: ',DokumentON_Familia.AsString, DokumentON_Name.AsString, DokumentON_Otch.AsString);
  end;
  if Result='' then begin
    Result:=CheckOneFIO('Мать: ',DokumentONA_Familia.AsString, DokumentONA_Name.AsString, DokumentONA_Otch.AsString);
  end;
end;

procedure TfmZapisRogd.N_F_cbDublSprClick(Sender: TObject);
begin
  edAddSpr.Visible:=N_F_cbDublSpr.Checked;
end;

function TfmZapisRogd.SpravEnabled:Boolean;
begin
  if (N_F_cbTypeSprav.ItemIndex=-1) or (N_F_cbTypeSprav.ItemIndex=0) then  begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

procedure TfmZapisRogd.N_F_cbTypeSpravChange(Sender: TObject);
begin
  if SpravEnabled then begin
    N_F_cbDublSpr.Enabled:=true;
    edSprav_Nomer.Enabled:=true;
    edSprav_Date.Enabled:=true;
  end else begin
    EditDataSet(Dokument);
    DokumentSprav_Nomer.AsString:='';
    DokumentSprav_Date.AsString:='';
    DokumentADD_SPR.AsString:='';
    DokumentDUBL_SPR.AsBoolean:=false;
    edSprav_Nomer.Enabled:=false;
    edSprav_Date.Enabled:=false;
    N_F_cbDublSpr.Enabled:=false;
  end;
end;
//-------------------------------------------------------------
function TfmZapisRogd.EnableHistoryControl(ActControl:TWinControl):Boolean;
begin
  if ActControl=edGosud_B
    then Result:=false
    else Result:=true;
end;
//-------------------------------------------------------------
procedure TfmZapisRogd.FieldAddHistDop(fld : TField; ActControl:TWinControl);
//var
//  s:String;
begin
{
  if fld.FieldName='OBL' then begin
    FieldAddHist(DokumentOBL_B, BLR_edOBL, s);
  end else if fld.FieldName='RAION' then begin
    FieldAddHist(DokumentRAION_B, BLR_edRaion, s);
  end else if fld.FieldName='GOROD' then begin
    FieldAddHist(DokumentGOROD_B, BLR_edGorod, s);
  end;
  }
end;
//-----------------------------------------------
procedure TfmZapisRogd.AddUserHist;
var
  slPokaz:TStringList;
  nType:Integer;
  lClear:Boolean;
begin
  slPokaz:=TStringList.Create;
  slPokaz.AddObject('Фамилия ребёнка, ФИО+нац. отца', Pointer(1));
  slPokaz.AddObject('Фамилия,отчество ребёнка', Pointer(0));
  slPokaz.AddObject('ФИО отца+национальность', Pointer(0));
  slPokaz.AddObject('Фамилия матери', Pointer(0));
  slPokaz.AddObject('Место рождения ребенка', Pointer(0));
  if EditAddHistory(slPokaz, nType,lClear) then begin
    if Integer(slPokaz.Objects[0])=1 then begin
      FieldsAddHist([edFamilia, edON_Familia, edON_Name, edON_Otch, BLR_edFamilia, BLR_edON_Familia, BLR_edON_Name, BLR_edON_Otch, edON_NATION],lClear);
    end;
    if Integer(slPokaz.Objects[1])=1 then begin
      if Integer(slPokaz.Objects[0])=1 then begin
        FieldsAddHist([edOtch, BLR_edOtch],lClear);
      end else begin
        FieldsAddHist([edFamilia, edOtch, BLR_edFamilia, BLR_edOtch],lClear);
      end;
    end;
    if (Integer(slPokaz.Objects[2])=1) and (Integer(slPokaz.Objects[0])=0) then begin
      FieldsAddHist([edON_Familia, edON_Name, edON_Otch, BLR_edON_Familia, BLR_edON_Name, BLR_edON_Otch, edON_NATION],lClear);
    end;
    if Integer(slPokaz.Objects[3])=1 then begin
      FieldsAddHist([edONA_Familia, BLR_edONA_Familia],lClear);
    end;
    if Integer(slPokaz.Objects[4])=1 then begin
      FieldsAddHist([edGosud, edObl, edRaion, edGorod, BLR_edObl, BLR_edRaion, BLR_edGorod ],lClear);
    end;
  end;
  slPokaz.Free;
end;


procedure TfmZapisRogd.edOTMETKADblClick(Sender: TObject);
begin
  TBItemEditMemo.Tag:=3;
  try
    inherited TBItemEditMemoClick(Sender);
  finally
    TBItemEditMemo.Tag:=0;
  end;
end;
//-----------------------------------------------------------------
procedure TfmZapisRogd.TBItemEditMemoClick(Sender: TObject);
begin
  if ActiveControl=edOTMETKA then TBItemEditMemo.Tag:=3;
  try
    inherited TBItemEditMemoClick(Sender);
  finally
    TBItemEditMemo.Tag:=0;
  end;
end;
//-----------------------------------------------------------------
function TfmZapisRogd.SvidNotFromDeclID(n:Integer):Boolean;
var
  s:String;
begin
  s:=PadLStr(inttostr(n),2,'0');
  Result:=(Copy(s,1,1)='1');
end;

//-----------------------------------------------------------------
procedure TfmZapisRogd.ValuesFromDeclID;
var
  s:String;
begin
  DokumentSVIDNOT.AsBoolean:=SvidNotFromDeclID(DokumentDECL_ID.AsInteger);
  s:=PadLStr(inttostr(DokumentDECL_ID.AsInteger),2,'0');
  DokumentVERNO.AsBoolean:=(Copy(s,2,1)='1');
end;
//------------------------------------------------------------------
function TfmZapisRogd.ValuesToDeclID:Integer;
begin
  if DokumentVERNO.AsBoolean then Result:=1 else Result:=0;
  if DokumentSVIDNOT.AsBoolean then Result:=Result+10;
end;
//------------------------------------------------------------------
function TfmZapisRogd.BeforeReport: Boolean;
var
  arr:TArrStrings;
begin
  Result:=inherited BeforeReport;
  if Result then begin
    if FOnlySvid and (DokumentID.AsInteger=-1) then begin  // запись не выбирали
      arr:=dmBase.SeekAkt(TypeObj, DokumentID_ZAGS.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime, DokumentVOSSTAN.AsBoolean);
      if Length(arr)>0 then begin
        // SeekAkt уже установил на нужную запись
        EditDataSet(Dokument);
//        DokumentID.AsInteger:=FMainTable.FieldByName('ID').AsInteger;
        DokumentSVIDNOT.AsBoolean:=SvidNotFromDeclID(FMainTable.FieldByName('DECL_ID').AsInteger);
        PostDataSet(Dokument);
      end;
    end;
  end;
end;
//---------------------------------------------------------------
procedure TfmZapisRogd.btLRClick(ss:String);
var
  sa,s,sON,sONA:String;
  arr:TArrStrings;
begin
  if not Dokument.FieldByName(ss+'_DATE_LR').IsNull and Problem('Добавить лишение родительских прав в отметку ?',mtConfirmation,self) then begin
    s:=''; sON:=''; sONA:='';
    sa:=getResource('SPR_'+ss+'_LR',0)+' '+DatePropis(Dokument.FieldByName(ss+'_DATE_LR').AsDateTime,6);
    Dokument.CheckBrowseMode;
    if not Dokument.FieldByName(ss+'_SUDD_LR').IsNull
      then sa:=sa+' решением суда '+Dokument.FieldByName(ss+'_SUD_LR').AsString+' от '+DatePropis(Dokument.FieldByName(ss+'_SUDD_LR').AsDateTime,6);
    if DokumentOTMETKA.AsString<>'' then begin
      StrToArr(DokumentOTMETKA.AsString,arr,'#',false);
      if Length(arr)=1 then begin
        s:=DokumentOTMETKA.AsString;
      end else if Length(arr)=2 then begin
        sON:=arr[0];
        sONA:=arr[1];
      end else if Length(arr)=3 then begin
        s:=arr[0];
        sON:=arr[1];
        sONA:=arr[2];
      end;
    end;
    if s='' then s:=sa else s:=s+CRLF+sa;
    EditDataSet(Dokument);
    if (sON='') and (sONA='') then begin
      DokumentOTMETKA.AsString:=s;
    end else begin
      DokumentOTMETKA.AsString:=s+' #'+sON+' #'+sONA;
    end;
  end;
end;
//---------------------------------------------------------------
procedure TfmZapisRogd.btLR_ONAClick(Sender: TObject);
begin
  btLRClick('ONA');
end;
//---------------------------------------------------------------
procedure TfmZapisRogd.btLR_ONClick(Sender: TObject);
begin
  btLRClick('ON');
end;
//-----------------------------------------------------------
procedure TfmZapisRogd.SetSimpleVvod(sName:String);
var
  lSetEnabled:Boolean;
begin
  inherited;
  lSetEnabled:=(sName='');
  if sName='DEFAULT' then begin
    SetEnabledControls( [
    lbBLRFam, BLR_edFamilia, lbBLRName, BLR_edName, lbBLROtch, BLR_edOtch, gbSved, lbIDENTIF, ENG_edIDENTIF,
    label6, edTypeRod, label54, edGivorogd, N_F_cbFirstWeek,
    label24, edSchet, label25, edOstat,
    label26, edMassa, label27, edDlina, lbDateS, eddateS,
    label14, ENG_edON_IDENTIF, ENG_edONA_IDENTIF,
    label22, edON_WORK, edONA_WORK,  label23, edON_OBRAZ, edONA_OBRAZ,
    label75, edON_DOK_TYPE, edON_DOK_SERIA, edON_DOK_NOMER, edON_DOK_DATE, label69, edON_DOKUMENT,
             edONA_DOK_TYPE, edONA_DOK_SERIA, edONA_DOK_NOMER, edONA_DOK_DATE, label70, edONA_DOKUMENT,
    label89, edON_Voenkom, edONA_Voenkom,   label38, label107, N_F_cbIsWrite, edTypeReg, edWriteDecl,edTorgestv, edTarif, edDecl, edDecl_Adres, label106, edDecl_Dok, lbTwoDecl,
    edTwoDecl, N_F_cbTypeSprav, edSprav_Nomer, label68, edSprav_Date, N_F_cbDublSpr, edAddSpr, label39, edON_SVID, edONA_SVID
    ], lSetEnabled);
  end;
  if lSetEnabled then begin
    edONA_KV.HelpContext:=0;
    edDokument.HelpContext:=999;
  end else begin
    edONA_KV.HelpContext:=999;

    EditDataSet(Dokument);
    DokumentVERNO.AsBoolean:=true;
    TbItemSpecSved.Checked:=DokumentVERNO.AsBoolean;
    PostDataSet(Dokument);
  end;

end;

procedure TfmZapisRogd.cbOblClick(Sender: TObject);
begin
  case cbOBL.State of
    cbChecked  : lbOBL.Caption:='область';
    cbUnchecked: lbOBL.Caption:='край';
    cbGrayed   : lbOBL.Caption:='';
  end;
end;

procedure TfmZapisRogd.N_F_lbONA_StatusGetText(Sender: TObject;  var Text: String);
begin Text:=GetStatus(DokumentONA_STATUS); end;

procedure TfmZapisRogd.N_F_lbON_StatusGetText(Sender: TObject;  var Text: String);
begin Text:=GetStatus(DokumentON_STATUS); end;

procedure TfmZapisRogd.N_F_lbON_StatusClick(Sender: TObject);
begin ClearStatus(DokumentON_STATUS); end;

procedure TfmZapisRogd.N_F_lbONA_StatusClick(Sender: TObject);
begin ClearStatus(DokumentONA_STATUS); end;

procedure TfmZapisRogd.edTypeRegChange(Sender: TObject);
var
  l:Boolean;
begin
  if (edTypeReg.ItemIndex>0) and (edTypeReg.KeyItems[edTypeReg.ItemIndex]='3') // оствлен в орг. здравоохр.   KEY_SPEC_ROGD
    then l:=true
    else l:=false;
  lbDopSved.Enabled:=l;
  edON_DopSved.Enabled:=l;
  edONA_DopSved.Enabled:=l;
end;

procedure TfmZapisRogd.edWriteDeclChange(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentIS_WRITE.AsBoolean:=edWriteDecl.Value<>null;
end;

function TfmZapisRogd.CheckDateEditGIS: Boolean;
begin
  Result:=false;
  if Gisun.GetPoleGrn(DokumentPOLE_GRN)=rPost then begin
  // номер и дата записи, свидетельство, ФИО, дата рождения, место рождения
  if (DokumentNOMER.AsString<>FMainTable.FieldByName('NOMER').AsString) or
     (DokumentDATEZ.AsString<>FMainTable.FieldByName('DATEZ').AsString) or
     (DokumentSVID_SERIA.AsString<>FMainTable.FieldByName('SVID_SERIA').AsString) or
     (DokumentSVID_NOMER.AsString<>FMainTable.FieldByName('SVID_NOMER').AsString) or
     (DokumentDATESV.AsString<>FMainTable.FieldByName('DATESV').AsString) or
     (DokumentIDENTIF.AsString<>FMainTable.FieldByName('IDENTIF').AsString) or
     (DokumentDATER.AsString<>FMainTable.FieldByName('DATER').AsString) or
     (ce_fio(DokumentFamilia_B.AsString)<>ce_fio(FMainTable.FieldByName('Familia_B').AsString)) or
     (ce_fio(DokumentName_B.AsString)<>ce_fio(FMainTable.FieldByName('Name_B').AsString)) or
     (ce_fio(DokumentOtch_B.AsString)<>ce_fio(FMainTable.FieldByName('Otch_B').AsString)) or
     (ce_fio(DokumentFamilia.AsString)<>ce_fio(FMainTable.FieldByName('Familia').AsString)) or
     (ce_fio(DokumentName.AsString)<>ce_fio(FMainTable.FieldByName('Name').AsString)) or
     (ce_fio(DokumentOtch.AsString)<>ce_fio(FMainTable.FieldByName('Otch').AsString)) or
     (DokumentGOSUD.AsString<>FMainTable.FieldByName('GOSUD').AsString) or
     (DokumentOBL.AsString<>FMainTable.FieldByName('OBL').AsString) or
     (DokumentRAION.AsString<>FMainTable.FieldByName('RAION').AsString) or
     (DokumentGOROD.AsString<>FMainTable.FieldByName('GOROD').AsString) or
     (DokumentB_GOROD.AsString<>FMainTable.FieldByName('B_GOROD').AsString) or
     (DokumentOBL_B.AsString<>FMainTable.FieldByName('OBL_B').AsString) or
     (DokumentRAION_B.AsString<>FMainTable.FieldByName('RAION_B').AsString) or
     (DokumentGOROD_B.AsString<>FMainTable.FieldByName('GOROD_B').AsString) or
     (DokumentON_IDENTIF.AsString<>FMainTable.FieldByName('ON_IDENTIF').AsString) or
     (DokumentONA_IDENTIF.AsString<>FMainTable.FieldByName('ONA_IDENTIF').AsString)
    then Result:=true
    else Result:=false;
  end;
end;
//-----------------------------------------------------------
procedure TfmZapisRogd.WriteAfterRegister_GISUN;
begin
  try
    EditDataSet(Dokument);
    DokumentB_RESP.AsBoolean:=false;
    Dokument.Post;
    FMainTable.FieldByName('B_RESP').AsBoolean:=false;
  except
  end;
end;
//-----------------------------------------------------------
procedure TfmZapisRogd.SetColorChild(c:TColor);
begin
  SetColorControls([edFamilia,edName,edOtch,BLR_edFamilia,BLR_edName,BLR_edOtch,edDateR,edPol,
       edGOSUD,edOBL,edRaion,edGOROD,edB_GOROD,BLR_edOBL,BLR_edRaion,BLR_edGOROD], c);
end;
//-----------------------------------------------------------
procedure TfmZapisRogd.TBItemGetChildClick(Sender: TObject);
var
  cur:TCursor;
  sl:TStringList;
  ds:TDataSet;
  n:Integer;
begin
{$IFDEF GISUN}
  n:=Gisun.GetPoleGrn(Dokument);
  if (n=rPost) then begin
    PutError(ERR_REG_GIS,self);
    exit;
  end;
  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  Gisun.CurAkt:=Self;    // !!! важно
  try
    if GetInfoGISUN1(Self,'IDENTIF', '') then begin
      sl:=TStringList.Create;
      sl.Add('CHILD='+ENG_edIDENTIF.Text);
      Gisun.RegInt.FObrPersonalData:=nil;  // дополнительная обработка при запросе данных для каждого лица
      ds:=Gisun.LoadIdentifData(sl,Dokument,nil);
      if ds<>nil then begin
        ds.First;
        FRun:=true;
        EditDataSet(Dokument);
        try
          if ds.FieldByName('IDENTIF').AsString=ENG_edIDENTIF.Text then begin
            DokumentFamilia.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA').AsString);
            DokumentNAME.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME').AsString);
            DokumentOTCH.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH').AsString);
            DokumentFamilia_B.AsString:=Gisun.CaseFIO(ds.FieldByName('FAMILIA_B').AsString);
            DokumentNAME_B.AsString:=Gisun.CaseFIO(ds.FieldByName('NAME_B').AsString);
            DokumentOTCH_B.AsString:=Gisun.CaseFIO(ds.FieldByName('OTCH_B').AsString);
            WriteField(DokumentDATER,ds.FieldByName('DATER'));
            DokumentPOL.AsString:=Gisun.CaseFIO(ds.FieldByName('POL').AsString);
//      ???      DokumentGRAG.AsString:=ds.FieldByName('GRAG').AsString;

            DokumentGOSUD.AsString:=ds.FieldByName('GOSUD_R').AsString;
//            DokumentB_OBL.AsString:=ds.FieldByName('B_OBL_R').AsString; // !!!
            DokumentOBL.AsString:=ds.FieldByName('OBL_R').AsString;
            DokumentOBL_B.AsString:=ds.FieldByName('OBL_B_R').AsString;
            DokumentRAION.AsString:=ds.FieldByName('RAION_R').AsString;
            DokumentRAION_B.AsString:=ds.FieldByName('RAION_B_R').AsString;
            DokumentB_GOROD.AsString:=ds.FieldByName('TYPE_GOROD_R').AsString;
            DokumentGOROD.AsString:=ds.FieldByName('GOROD_R').AsString;
            DokumentGOROD_B.AsString:=ds.FieldByName('GOROD_B_R').AsString;
          end;
          PostDataSet(Dokument);
          SetColorChild(GetDisableColorGIS);
        finally
          FRun:=false;
        end;
        ds.Free;
      end;
      sl.Free;
    end;
  finally
    Gisun.CurAkt:=nil;
    Screen.Cursor:=cur;
  end;
{$ENDIF}
//
end;

initialization
  FCreateAkt:=false;
end.
