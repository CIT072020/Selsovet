unit fZapisAdopt;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uPadegFIO,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uProject,uProjectAll,uTypes,
  ExtCtrls, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, dBase, funcPr, dbFunc, fEnterDokument,
  MetaTAsk, OpisEdit, vchDBCtrls, FR_DSet, FR_DBSet, DBCtrls, Grids,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  {$IFDEF USE_FR3} frxClass, frxDBSet, {$ENDIF}
  DBGridEh, TB2ExtItems, Buttons, ImgList, kbmMemCSVStreamFormat, ZipForge;

type
  TfmZapisAdopt = class(TfmSimpleD)
    pn: TPanel;
    pc: TPageControl;
    tsChild: TTabSheet;
    tsFaser: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    edDateR_Do: TDBDateTimeEditEh;
    edPol: TDBComboBoxEh;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edON_Familia: TDBEditEh;
    edON_Name: TDBEditEh;
    edON_OTCH: TDBEditEh;
    edON_DATER: TDBDateTimeEditEh;
    edON_GOSUD: TDBLookupComboboxEh;
    edON_GOROD: TDBEditEh;
    edON_NATION: TDBLookupComboboxEh;
    edON_GRAG: TDBLookupComboboxEh;
    edON_B_OBL: TDBCheckBoxEh;
    Label11: TLabel;
    edONA_Familia: TDBEditEh;
    edONA_Name: TDBEditEh;
    edONA_OTCH: TDBEditEh;
    edONA_DATER: TDBDateTimeEditEh;
    edONA_GOSUD: TDBLookupComboboxEh;
    edONA_GOROD: TDBEditEh;
    edONA_NATION: TDBLookupComboboxEh;
    edONA_GRAG: TDBLookupComboboxEh;
    edONA_B_OBL: TDBCheckBoxEh;
    lbNomer: TLabel;
    edNomer: TDBEditEh;
    Label8: TLabel;
    edDateZ: TDBDateTimeEditEh;
    lbSvid: TLabel;
    edSvid_Nomer: TDBEditEh;
    N_F_1: TDBCheckBoxEh;
    dsNation: TDataSource;
    dsStran: TDataSource;
    edON_GOROD_R: TDBEditEh;
    Label53: TLabel;
    edONA_GOROD_R: TDBEditEh;
    TBItemClearLich: TTBItem;
    Label55: TLabel;
    Label6: TLabel;
    edFamiliaDo: TDBEditEh;
    Label24: TLabel;
    edNameDo: TDBEditEh;
    Label25: TLabel;
    edOtchDo: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    edFamiliaPosle: TDBEditEh;
    edNamePosle: TDBEditEh;
    edOtchPosle: TDBEditEh;
    tsAdopt: TTabSheet;
    Label28: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    edOTEC_Familia: TDBEditEh;
    Label47: TLabel;
    edOTEC_Name: TDBEditEh;
    edOTEC_Otch: TDBEditEh;
    edOTEC_DateR: TDBDateTimeEditEh;
    edOTEC_NATION: TDBLookupComboboxEh;
    edOTEC_GRAG: TDBLookupComboboxEh;
    edOTEC_GOSUD: TDBLookupComboboxEh;
    edOTEC_GOROD: TDBEditEh;
    edOTEC_GOROD_R: TDBEditEh;
    edOTEC_B_OBL: TDBCheckBoxEh;
    Label48: TLabel;
    edMAT_FAMILIA: TDBEditEh;
    edMAT_Name: TDBEditEh;
    edMAT_Otch: TDBEditEh;
    edMAT_DateR: TDBDateTimeEditEh;
    edMAT_NATION: TDBLookupComboboxEh;
    edMAT_GRAG: TDBLookupComboboxEh;
    edMAT_GOSUD: TDBLookupComboboxEh;
    edMAT_GOROD: TDBEditEh;
    edMAT_GOROD_R: TDBEditEh;
    edMAT_B_OBL: TDBCheckBoxEh;
    edDateR_Posle: TDBDateTimeEditEh;
    Label33: TLabel;
    edGOSUD: TDBLookupComboboxEh;
    Label30: TLabel;
    Label34: TLabel;
    edB_OBL_DO: TDBCheckBoxEh;
    edGOROD: TDBEditEh;
    tsAdd: TTabSheet;
    Label23: TLabel;
    edOtmetka: TDBEditEh;
    edSPEC: TDBEditEh;
    edRukov: TDBEditEh;
    Label22: TLabel;
    Label37: TLabel;
    lbOsnov: TLabel;
    edSUD_NAME: TDBEditEh;
    edSUD_DATE: TDBDateTimeEditEh;
    Label49: TLabel;
    edGOSUD_POSLE: TDBLookupComboboxEh;
    edB_OBL_POSLE: TDBCheckBoxEh;
    edGOROD_POSLE: TDBEditEh;
    Label26: TLabel;
    edMestoNomer: TDBEditEh;
    Label3: TLabel;
    edMestoDate: TDBDateTimeEditEh;
    edMesto: TDBEditEh;
    Label50: TLabel;
    Label51: TLabel;
    edREG_NOMER_POSLE: TDBEditEh;
    Label52: TLabel;
    edREG_DATE_POSLE: TDBDateTimeEditEh;
    edREG_MESTO_POSLE: TDBEditEh;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    edBRAK_NAME: TDBEditEh;
    edBRAK_DATE: TDBDateTimeEditEh;
    edBRAK_NOMER: TDBEditEh;
    Label59: TLabel;
    Label60: TLabel;
    edIsRodit: TDBComboBoxEh;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentSVID_SERIA: TStringField;
    DokumentSVID_NOMER: TStringField;
    DokumentFamiliaDo: TStringField;
    DokumentNameDo: TStringField;
    DokumentOtchDo: TStringField;
    DokumentFamiliaPosle: TStringField;
    DokumentNamePosle: TStringField;
    DokumentOtchPosle: TStringField;
    DokumentPOL: TStringField;
    DokumentDateR_DO: TDateField;
    DokumentGOSUD_DO: TIntegerField;
    DokumentOBL_DO: TStringField;
    DokumentRAION_DO: TStringField;
    DokumentGOROD_DO: TStringField;
    DokumentREG_NOMER_DO: TStringField;
    DokumentREG_DATE_DO: TDateField;
    DokumentREG_MESTO_DO: TMemoField;
    DokumentOTEC_Familia: TStringField;
    DokumentOTEC_Name: TStringField;
    DokumentOTEC_Otch: TStringField;
    DokumentOTEC_DateR: TDateField;
    DokumentOTEC_NATION: TIntegerField;
    DokumentOTEC_GRAG: TIntegerField;
    DokumentOTEC_SOATO: TStringField;
    DokumentOTEC_GOSUD: TIntegerField;
    DokumentOTEC_OBL: TStringField;
    DokumentOTEC_RAION: TStringField;
    DokumentOTEC_GOROD: TStringField;
    DokumentOTEC_GOROD_R: TStringField;
    DokumentOTEC_B_RESP: TBooleanField;
    DokumentOTEC_B_OBL: TBooleanField;
    DokumentMAT_Familia: TStringField;
    DokumentMAT_Name: TStringField;
    DokumentMAT_Otch: TStringField;
    DokumentMAT_DateR: TDateField;
    DokumentMAT_NATION: TIntegerField;
    DokumentMAT_GRAG: TIntegerField;
    DokumentMAT_SOATO: TStringField;
    DokumentMAT_GOSUD: TIntegerField;
    DokumentMAT_OBL: TStringField;
    DokumentMAT_RAION: TStringField;
    DokumentMAT_GOROD: TStringField;
    DokumentMAT_GOROD_R: TStringField;
    DokumentMAT_B_RESP: TBooleanField;
    DokumentMAT_B_OBL: TBooleanField;
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
    DokumentONA_B_RESP: TBooleanField;
    DokumentONA_B_OBL: TBooleanField;
    DokumentBRAK_M: TBooleanField;
    DokumentBRAK_DATE: TDateField;
    DokumentBRAK_NAME: TMemoField;
    DokumentSUD_NAME: TMemoField;
    DokumentSUD_DATE: TDateField;
    DokumentISRODIT: TBooleanField;
    DokumentOTMETKA: TMemoField;
    DokumentISPRAV: TMemoField;
    DokumentRUKOV: TStringField;
    DokumentRUKOV_B: TStringField;
    DokumentB_RESP_DO: TBooleanField;
    DokumentB_OBL_DO: TBooleanField;
    DokumentLICH_ID: TIntegerField;
    DokumentCHILD_ID: TIntegerField;
    DokumentPROV: TBooleanField;
    DokumentSPEC: TStringField;
    DokumentID_ZAGS: TIntegerField;
    DokumentID_SOURCE: TIntegerField;
    DokumentDateR_POSLE: TDateField;
    DokumentGOSUD_POSLE: TIntegerField;
    DokumentOBL_POSLE: TStringField;
    DokumentRAION_POSLE: TStringField;
    DokumentGOROD_POSLE: TStringField;
    DokumentREG_NOMER_POSLE: TStringField;
    DokumentREG_DATE_POSLE: TDateField;
    DokumentREG_MESTO_POSLE: TMemoField;
    DokumentB_RESP_POSLE: TBooleanField;
    DokumentB_OBL_POSLE: TBooleanField;
    DokumentFamiliaDo_B: TStringField;
    DokumentNameDo_B: TStringField;
    DokumentOtchDo_B: TStringField;
    DokumentFamiliaPosle_B: TStringField;
    DokumentNamePosle_B: TStringField;
    DokumentOtchPosle_B: TStringField;
    DokumentOBL_DO_B: TStringField;
    DokumentRAION_DO_B: TStringField;
    DokumentGOROD_DO_B: TStringField;
    DokumentON_Familia_B: TStringField;
    DokumentON_Name_B: TStringField;
    DokumentON_Otch_B: TStringField;
    DokumentONA_Familia_B: TStringField;
    DokumentONA_Name_B: TStringField;
    DokumentONA_Otch_B: TStringField;
    DokumentFirst_Ekz: TBooleanField;
    Label29: TLabel;
    DokumentVOSSTAN: TBooleanField;
    N_F_rgBRAK_M: TDBRadioGroup;
    DokumentDATESV: TDateField;
    edDateSV: TDBDateTimeEditEh;
    Label61: TLabel;
    DokumentOTHER: TMemoField;
    DokumentIZMEN: TMemoField;
    Label62: TLabel;
    Label63: TLabel;
    edOther: TDBEditEh;
    edIzmen: TDBEditEh;
    dsGragd: TDataSource;
    DokumentCOPIA: TBooleanField;
    edCopy: TDBCheckBoxEh;
    DokumentIZV_NOMER: TStringField;
    DokumentIZV_DATE: TDateField;
    Label65: TLabel;
    edIzvNomer: TDBEditEh;
    edIzvDate: TDBDateTimeEditEh;
    DokumentON_WORK: TStringField;
    DokumentON_OBRAZ: TIntegerField;
    DokumentONA_WORK: TStringField;
    DokumentONA_OBRAZ: TIntegerField;
    Label66: TLabel;
    edON_OBRAZ: TDBComboBoxEh;
    edONA_OBRAZ: TDBComboBoxEh;
    Label67: TLabel;
    edON_WORK: TDBEditEh;
    edONA_WORK: TDBEditEh;
    Label68: TLabel;
    Label69: TLabel;
    edR_SVID_SERIA: TDBEditEh;
    Label70: TLabel;
    edR_SVID_NOMER: TDBEditEh;
    DokumentR_SVID_SERIA: TStringField;
    DokumentR_SVID_NOMER: TStringField;
    SpeedButton: TSpeedButton;
    Button1: TButton;
    edAdresIzvech: TDBEditEh;
    DokumentAdresIzvech: TMemoField;
    edSVID_SERIA: TDBLookupComboboxEh;
    tsPovtor: TTabSheet;
    BLR_edOBL: TDBEditEh;
    BLR_edRAION: TDBEditEh;
    DokumentON_FAMILIA_P: TStringField;
    DokumentON_NAME_P: TStringField;
    DokumentON_OTCH_P: TStringField;
    DokumentON_FAMILIA_B_P: TStringField;
    DokumentON_NAME_B_P: TStringField;
    DokumentON_OTCH_B_P: TStringField;
    DokumentONA_FAMILIA_P: TStringField;
    DokumentONA_NAME_P: TStringField;
    DokumentONA_OTCH_P: TStringField;
    DokumentONA_FAMILIA_B_P: TStringField;
    DokumentONA_NAME_B_P: TStringField;
    DokumentONA_OTCH_B_P: TStringField;
    btPadeg: TButton;
    ImageGISUN: TImage;
    TBSubmenuGISUN: TTBSubmenuItem;
    TBItemStep1: TTBItem;
    TBItemStep2: TTBItem;
    N_F_cbBelorus: TDBCheckBoxEh;
    DokumentOTEC_B_GOROD: TSmallintField;
    DokumentMAT_B_GOROD: TSmallintField;
    DokumentON_B_GOROD: TSmallintField;
    DokumentONA_B_GOROD: TSmallintField;
    DokumentB_GOROD_DO: TSmallintField;
    DokumentB_GOROD_POSLE: TSmallintField;
    DokumentOTEC_STATUS: TStringField;
    DokumentOTEC_IDENTIF: TStringField;
    DokumentOTEC_M_B_RESP: TBooleanField;
    DokumentOTEC_M_GOSUD: TIntegerField;
    DokumentOTEC_M_B_OBL: TBooleanField;
    DokumentOTEC_M_OBL: TStringField;
    DokumentOTEC_M_B_GOROD: TSmallintField;
    DokumentOTEC_M_RAION: TStringField;
    DokumentSTATUS: TStringField;
    DokumentTYPEMESSAGE: TStringField;
    DokumentPOLE_GRN: TSmallintField;
    DokumentMAT_M_B_RESP: TBooleanField;
    DokumentMAT_M_GOSUD: TIntegerField;
    DokumentMAT_M_OBL: TStringField;
    DokumentMAT_M_RAION: TStringField;
    DokumentMAT_M_B_GOROD: TSmallintField;
    DokumentMAT_M_GOROD: TStringField;
    DokumentMAT_STATUS: TStringField;
    DokumentMAT_IDENTIF: TStringField;
    DokumentON_STATUS: TStringField;
    DokumentON_IDENTIF: TStringField;
    DokumentON_M_B_RESP: TBooleanField;
    DokumentON_M_GOSUD: TIntegerField;
    DokumentON_M_B_OBL: TBooleanField;
    DokumentON_M_OBL: TStringField;
    DokumentON_M_RAION: TStringField;
    DokumentON_M_B_GOROD: TSmallintField;
    DokumentON_M_GOROD: TStringField;
    DokumentONA_STATUS: TStringField;
    DokumentONA_IDENTIF: TStringField;
    DokumentONA_M_B_RESP: TBooleanField;
    DokumentONA_M_GOSUD: TIntegerField;
    DokumentONA_M_OBL: TStringField;
    DokumentONA_M_RAION: TStringField;
    DokumentONA_M_B_GOROD: TSmallintField;
    DokumentONA_M_GOROD: TStringField;
    edON_B_GOROD: TDBLookupComboboxEh;
    edONA_B_GOROD: TDBLookupComboboxEh;
    ENG_edONA_IDENTIF: TDBEditEh;
    ENG_edON_IDENTIF: TDBEditEh;
    Label27: TLabel;
    Label41: TLabel;
    Label54: TLabel;
    Label64: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    edON_M_GOSUD: TDBLookupComboboxEh;
    edON_M_GOROD: TDBEditEh;
    edON_M_B_OBL: TDBCheckBoxEh;
    edONA_M_GOSUD: TDBLookupComboboxEh;
    edONA_M_GOROD: TDBEditEh;
    edONA_M_B_OBL: TDBCheckBoxEh;
    edON_M_B_GOROD: TDBLookupComboboxEh;
    edONA_M_B_GOROD: TDBLookupComboboxEh;
    Label73: TLabel;
    ENG_edOTEC_IDENTIF: TDBEditEh;
    ENG_edMAT_IDENTIF: TDBEditEh;
    edOTEC_B_GOROD: TDBLookupComboboxEh;
    edMAT_B_GOROD: TDBLookupComboboxEh;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    edOTEC_M_GOSUD: TDBLookupComboboxEh;
    edOTEC_M_GOROD: TDBEditEh;
    edOTEC_M_B_OBL: TDBCheckBoxEh;
    edMAT_M_GOSUD: TDBLookupComboboxEh;
    edMAT_M_GOROD: TDBEditEh;
    edMAT_M_B_OBL: TDBCheckBoxEh;
    edOTEC_M_B_GOROD: TDBLookupComboboxEh;
    edMAT_M_B_GOROD: TDBLookupComboboxEh;
    lbIdentif: TLabel;
    ENG_edIDENTIF_DO: TDBEditEh;
    ENG_edIDENTIF_POSLE: TDBEditEh;
    DokumentIDENTIF_DO: TStringField;
    DokumentIDENTIF_POSLE: TStringField;
    DokumentGRAG_DO: TIntegerField;
    DokumentGRAG_POSLE: TIntegerField;
    edB_GOROD: TDBLookupComboboxEh;
    edB_GOROD_POSLE: TDBLookupComboboxEh;
    DokumentONA_M_B_OBL: TBooleanField;
    DokumentMAT_M_B_OBL: TBooleanField;
    DokumentOTEC_M_GOROD: TStringField;
    DokumentSPEC_B: TStringField;
    edRAION: TDBEditEh;
    edOBL: TDBEditEh;
    edOBL_POSLE: TDBEditEh;
    edRAION_POSLE: TDBEditEh;
    edOTEC_M_OBL: TDBEditEh;
    edOTEC_M_RAION: TDBEditEh;
    edMAT_M_OBL: TDBEditEh;
    edMAT_M_RAION: TDBEditEh;
    edOTEC_OBL: TDBEditEh;
    edOTEC_RAION: TDBEditEh;
    edMAT_OBL: TDBEditEh;
    edMAT_RAION: TDBEditEh;
    edON_M_OBL: TDBEditEh;
    edON_M_RAION: TDBEditEh;
    edONA_M_OBL: TDBEditEh;
    edONA_M_RAION: TDBEditEh;
    edON_OBL: TDBEditEh;
    edON_RAION: TDBEditEh;
    edONA_OBL: TDBEditEh;
    edONA_RAION: TDBEditEh;
    DokumentRN_B_GOROD_DO: TStringField;
    DokumentRN_ON_M_B_GOROD: TStringField;
    DokumentRN_ON_B_GOROD: TStringField;
    DokumentRN_ONA_M_B_GOROD: TStringField;
    DokumentRN_ONA_B_GOROD: TStringField;
    DokumentRN_B_GOROD_POSLE: TStringField;
    DokumentRN_OTEC_M_B_GOROD: TStringField;
    DokumentRN_OTEC_B_GOROD: TStringField;
    DokumentRN_MAT_M_B_GOROD: TStringField;
    DokumentRN_MAT_B_GOROD: TStringField;
    DokumentOBL_POSLE_B: TStringField;
    DokumentRAION_POSLE_B: TStringField;
    DokumentGOROD_POSLE_B: TStringField;
    Label80: TLabel;
    edSUD_DATEV: TDBDateTimeEditEh;
    DokumentSUD_DATEV: TDateField;
    DokumentARX_ADRESAT: TMemoField;
    tsSvid: TTabSheet;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
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
    edFamilia_Sv: TDBEditEh;
    edName_Sv: TDBEditEh;
    edOtch_Sv: TDBEditEh;
    edGorod_Sv: TDBEditEh;
    edTypeGorod_Sv: TDBLookupComboboxEh;
    BLR_edGosud_Sv_B: TDBLookupComboboxEh;
    edOBL_Sv: TDBEditEh;
    edRAION_Sv: TDBEditEh;
    cbB_RESP: TDBCheckBoxEh;
    cbB_OBL: TDBCheckBoxEh;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    edON_Familia_Sv: TDBEditEh;
    edON_Name_Sv: TDBEditEh;
    edON_Otch_Sv: TDBEditEh;
    BLR_edON_Familia_B_Sv: TDBEditEh;
    BLR_edON_Name_B_Sv: TDBEditEh;
    BLR_edON_Otch_B_Sv: TDBEditEh;
    Label93: TLabel;
    Label94: TLabel;
    edONA_Familia_Sv: TDBEditEh;
    edONA_Name_Sv: TDBEditEh;
    edONA_Otch_Sv: TDBEditEh;
    BLR_edONA_Familia_B_Sv: TDBEditEh;
    BLR_edONA_Name_B_Sv: TDBEditEh;
    BLR_edONA_Otch_B_Sv: TDBEditEh;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    edFamiliaPosle_Sv: TDBEditEh;
    edNamePosle_Sv: TDBEditEh;
    edOtchPosle_Sv: TDBEditEh;
    BLR_edFamiliaPosle_B_Sv: TDBEditEh;
    BLR_edNamePosle_B_Sv: TDBEditEh;
    BLR_edOtchPosle_B_Sv: TDBEditEh;
    Label102: TLabel;
    edRukov_Sv: TDBEditEh;
    BLR_edRukov_Sv_B: TDBEditEh;
    BLR_edFamiliaDo: TDBEditEh;
    BLR_edNameDo: TDBEditEh;
    BLR_edOtchDo: TDBEditEh;
    BLR_edFamiliaPosle: TDBEditEh;
    BLR_edNamePosle: TDBEditEh;
    BLR_edOtchPosle: TDBEditEh;
    BLR_edGosud: TDBLookupComboboxEh;
    BLR_edB_GOROD: TDBLookupComboboxEh;
    BLR_edGorod: TDBEditEh;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    BLR_edOBL_Posle: TDBEditEh;
    BLR_edRaion_Posle: TDBEditEh;
    BLR_edGosud_Posle: TDBLookupComboboxEh;
    BLR_edB_GOROD_Posle: TDBLookupComboboxEh;
    BLR_edGorod_Posle: TDBEditEh;
    BLR_edON_Familia: TDBEditEh;
    BLR_edON_Name: TDBEditEh;
    BLR_edON_Otch: TDBEditEh;
    BLR_edONA_Familia: TDBEditEh;
    BLR_edONA_Name: TDBEditEh;
    BLR_edONA_Otch: TDBEditEh;
    N_F_cbPovtor: TDBCheckBoxEh;
    lbDolgRuk: TvchDBText;
    lbDolgSpec: TvchDBText;
    DokumentID_AKT_ROGD: TIntegerField;
    btAktRogd: TBitBtn;
    Label7: TLabel;
    edON_DOK: TDBEditEh;
    edONA_DOK: TDBEditEh;
    DokumentON_DOK_TYPE: TIntegerField;
    DokumentON_DOK_DATE: TDateField;
    DokumentON_DOK_SERIA: TStringField;
    DokumentON_DOK_NOMER: TStringField;
    DokumentON_DOK_NAME: TStringField;
    DokumentON_DOKUMENT: TStringField;
    DokumentONA_DOK_TYPE: TIntegerField;
    DokumentONA_DOK_DATE: TDateField;
    DokumentONA_DOK_SERIA: TStringField;
    DokumentONA_DOK_NOMER: TStringField;
    DokumentONA_DOK_NAME: TStringField;
    DokumentONA_DOKUMENT: TStringField;
    DokumentON_DOK_ORGAN: TIntegerField;
    DokumentONA_DOK_ORGAN: TIntegerField;
    DokumentBRAK_NOMER: TStringField;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure TBItemClearLichClick(Sender: TObject);
    procedure edFamilaDoEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure N_F_cbBelorusClick(Sender: TObject);
    procedure edFamiliaDoEnter(Sender: TObject);
    procedure edNameDoEnter(Sender: TObject);
    procedure edOtchDoEnter(Sender: TObject);
    procedure edON_FamiliaEnter(Sender: TObject);
    procedure edON_NameEnter(Sender: TObject);
    procedure edON_OTCHEnter(Sender: TObject);
    procedure edONA_FamiliaEnter(Sender: TObject);
    procedure edONA_NameEnter(Sender: TObject);
    procedure edONA_OTCHEnter(Sender: TObject);
    procedure edFamiliaPosleEnter(Sender: TObject);
    procedure edNamePosleEnter(Sender: TObject);
    procedure edOtchPosleEnter(Sender: TObject);
    procedure edFamiliaDoCheckDrawRequiredState(Sender: TObject;      var DrawState: Boolean);
    procedure edRukovEnter(Sender: TObject);
    procedure SpeedButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edAdresIzvechEnter(Sender: TObject);
    procedure edOBL_RNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure edRaion_RNotInList(Sender: TObject; NewText: String;      var RecheckInList: Boolean);
    procedure btPadegClick(Sender: TObject);
    procedure TBItemStep1Click(Sender: TObject);
    procedure TBItemStep2Click(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure edDateR_DoUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edMAT_FAMILIAEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edRukovEditButtons0Click(Sender: TObject;            var Handled: Boolean);
    procedure edRukov_SvEditButtons0Click(Sender: TObject;         var Handled: Boolean);
    procedure edSPECEditButtons0Click(Sender: TObject;             var Handled: Boolean);
    procedure btAktRogdClick(Sender: TObject);
    procedure edON_DOKEditButtons0Click(Sender: TObject;           var Handled: Boolean);
    procedure edONA_DOKEditButtons0Click(Sender: TObject;          var Handled: Boolean);
    procedure edON_DOKEditButtons1Click(Sender: TObject;           var Handled: Boolean);
    procedure edONA_DOKEditButtons1Click(Sender: TObject;          var Handled: Boolean);
  private
//    H : THintWindow;
    procedure OnDestroyHint(Sender : TObject);
//    procedure SetIDZags;
  public
    procedure CheckValueSvid;
    function BeforeReport:Boolean; override;
    function CreateSubMenuRun: Boolean; override;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure AdditiveNewDok; override;
    procedure AdditiveReadDok; override;
    procedure UpdateActions; override;
    function BeforeEdit : Boolean; override;
    procedure CheckControlSvid;
    function CheckFIO: String; override;
    procedure SetOnlyPovtorSvid(lOnlyPovtor:Boolean;pc:TPageControl; ts:TWinControl; NonVisibleControls : array of TVarRec; lbSvid,lbNomer:TLabel); override;
    procedure EditDokUdost(st:String);
    procedure ClearDokUdost(st:String);
    function  CheckDateEditGIS:Boolean; override;   // корректировались или нет поля отправляемые в регистр
    procedure WriteAfterRegister_GISUN; override;


    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;

  end;

  function EditZapisAdopt( nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;

var
  fmZapisAdopt: TfmZapisAdopt;

implementation

uses fMain, fChoiceNasel, fShablon, fPadegAdopt, fZapisRogd, fZapisRogdV, SelLibFR;

{$R *.DFM}
{$I Task.inc}

function EditZapisAdopt( nID : Integer; lOnlyPovtor:Boolean; slPar:TStringList) : Boolean;
begin
//  Result := true;
  fmZapisAdopt := TfmZapisAdopt.Create(nil);
  fmZapisAdopt.IsCreateForm:=false;
  fmZapisAdopt.AssignPar(slPar);
  try
    with fmZapisAdopt do begin
      SetOnlyPovtorSvid(lOnlyPovtor, pc, tsSvid, [ N_F_1, N_F_edTypeEkz, N_F_cbPovtor, N_F_cbBelorus ], lbSvid,lbNomer);
      {$IFDEF ZAGS}
      if not lOnlyPovtor then begin
        TBItemSprAkt.Visible:=true;      // доступность получения справки о записи акта
//        TBItemDeclSvid.Visible:=true;
      end;
      {$ENDIF}
    end;
    fmZapisAdopt.IsReadDokument:=true;
    if nID=-1 then begin
      fmZapisAdopt.NewDok(true);
      fmZapisAdopt.SetIDZags;
      fmZapisAdopt.CheckEnabledNameOrgan(true);
    end else begin
      fmZapisAdopt.ReadDok( nID );
      fmZapisAdopt.TBItemZAGS.Visible:=false;
      fmZapisAdopt.CheckEnabledNameOrgan(false);
    end;
    fmZapisAdopt.IsReadDokument:=false;
    {$IFDEF GISUN}
      fmZapisAdopt.CheckAkt_GISUN(0);
//      Gisun.CheckAdopt(fmZapisAdopt);
//      fmZapisAdopt.CheckImageGisun(fmZapisAdopt.DokumentPOLE_GRN,fmZapisAdopt.ImageGISUN);
      fmZapisAdopt.BeforeEditFormGISUN;
    {$ENDIF}
    Result := fmZapisAdopt.EditModal;
  finally
    fmZapisAdopt.Free;
    fmZapisAdopt := nil;
  end;
end;

{ TfmZapisAdopt }

constructor TfmZapisAdopt.Create(Owner: TComponent);
var
  n:Integer;
begin
  inherited;
  FCheckLookupField:=false;   // так как все поля (область,район,город) переделаны на DbEditEh.MRUList;
  FDokZAGS := true;
  TypeObj := dmBase.TypeObj_ZAdopt;
  FUpdatingObj:=GetUpdatingObj(TypeObj);

  SetLength(FArrChoiceRekv,11);

  if FPrintSpecSvid then begin
    edRukov_Sv.DataField:='SPEC';
    BLR_edRukov_Sv_B.DataField:='SPEC_B';
  end;

  FFieldDolgRuk:='RUKOV_D';
  FFieldDolgSpec:='SPEC_D';

  FArrChoiceRekv[0].nType:=0;
  FArrChoiceRekv[0].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[0].FieldName:='ON_WORK';

  FArrChoiceRekv[1].nType:=0;
  FArrChoiceRekv[1].nTypeSpr:=_SHABLON_WORK_DOLG;
  FArrChoiceRekv[1].FieldName:='ONA_WORK';

  FArrChoiceRekv[2].nType:=SHABLON_SUD;
  FArrChoiceRekv[2].FieldName:='SUD_NAME';

  FArrChoiceRekv[3].nType:=SHABLON_NATION;
  FArrChoiceRekv[3].FieldName:='OTMETKA';

  FArrChoiceRekv[4].nType:=SHABLON_REG;
  FArrChoiceRekv[4].FieldName:='BRAK_NAME';

  FArrChoiceRekv[5].nType:=SHABLON_REG;
  FArrChoiceRekv[5].FieldName:='REG_MESTO_DO';

  FArrChoiceRekv[6].nType:=SHABLON_REG;
  FArrChoiceRekv[6].FieldName:='REG_MESTO_POSLE';

  FArrChoiceRekv[7].nType:=0;
  FArrChoiceRekv[7].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[7].FieldName:='OTEC_GOROD_R';

  FArrChoiceRekv[8].nType:=0;
  FArrChoiceRekv[8].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[8].FieldName:='MAT_GOROD_R';

  FArrChoiceRekv[9].nType:=0;
  FArrChoiceRekv[9].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[9].FieldName:='ON_GOROD_R';

  FArrChoiceRekv[10].nType:=0;
  FArrChoiceRekv[10].nTypeSpr:=_SHABLON_UL;
  FArrChoiceRekv[10].FieldName:='ONA_GOROD_R';

  AddButton_LoadIdentif(ENG_edIDENTIF_DO);
  AddButton_LoadIdentif(ENG_edON_IDENTIF);
  AddButton_LoadIdentif(ENG_edONA_IDENTIF);
  AddButton_LoadIdentif(ENG_edMAT_IDENTIF);
  AddButton_LoadIdentif(ENG_edOTEC_IDENTIF);

  FAutoNum := IsAutoNumZAGS;
  FMainTable := dmBase.tbZapisAdopt;
  Dokument.Open;
  dsGragd.DataSet := dmBase.SprGragd;
  FPageControl := pc;
  pc.ActivePageIndex:=0;
//  fmMain.SetCurrentDokument(Dokument);

  edFamiliaDo.OnExit := OnDestroyHint;
  edNameDo.OnExit := OnDestroyHint;
  edOtchDo.OnExit := OnDestroyHint;
  edFamiliaPosle.OnExit := OnDestroyHint;
  edNamePosle.OnExit := OnDestroyHint;
  edOtchPosle.OnExit := OnDestroyHint;
  edRukov.OnExit   := OnDestroyHint;

  edON_Familia.OnExit := OnDestroyHint;
  edON_Name.OnExit := OnDestroyHint;
  edON_Otch.OnExit := OnDestroyHint;
  edONA_Familia.OnExit := OnDestroyHint;
  edONA_Name.OnExit := OnDestroyHint;
  edONA_Otch.OnExit := OnDestroyHint;

//  edONA_Familia.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;
//  edFamiliaDo.EditButtons[0].Glyph := edON_Familia.EditButtons[0].Glyph;

  edFamiliaDO.EditButtons.Items[0].Visible:=true;
  {$IFDEF ZAGS}
    edON_Familia.EditButtons.Items[0].Visible:=false;
    edOTEC_Familia.EditButtons.Items[0].Visible:=false;
//    TBItemAddSvid.Visible := true;
  {$ELSE}
    edCopy.Visible := false;
    N_F_cbPovtor.Visible := false;
  {$ENDIF}

  SetControlFIOUpdate([
      edFamilia_Sv, edName_Sv, edOtch_Sv,
      BLR_edFamiliaB_Sv, BLR_edNameB_Sv, BLR_edOtchB_Sv,
      edFamiliaPosle_Sv, edNamePosle_Sv, edOtchPosle_Sv,
      BLR_edFamiliaPosle_B_Sv, BLR_edNamePosle_B_Sv, BLR_edOtchPosle_B_Sv, edON_Familia_Sv, edON_Name_Sv, edON_Otch_Sv,
      edONA_Familia_Sv, edONA_Name_Sv, edONA_Otch_Sv,
      BLR_edON_Familia_B_Sv, BLR_edON_Name_B_Sv, BLR_edON_Otch_B_Sv,
      BLR_edONA_Familia_B_Sv, BLR_edONA_Name_B_Sv, BLR_edONA_Otch_B_Sv,
      edFamiliaDo, edNameDo, edOtchDo, edFamiliaPosle, edNamePosle, edOtchPosle,
      BLR_edFamiliaDo, BLR_edNameDo, BLR_edOtchDo, BLR_edFamiliaPosle, BLR_edNamePosle, BLR_edOtchPosle,
      edOTEC_Familia, edOTEC_Name, edOTEC_Otch,
      edMAT_Familia, edMAT_Name, edMAT_Otch,
      edON_Familia, edON_Name, edON_Otch,
      edONA_Familia, edONA_Name, edONA_Otch,
      BLR_edON_Familia, BLR_edON_Name, BLR_edON_Otch,
      BLR_edONA_Familia, BLR_edONA_Name, BLR_edONA_Otch
     ],false);

  SetControlCityUpdate([
    edOBL, edOBL_POSLE, edRAION, edRAION_POSLE,
    BLR_edOBL, BLR_edOBL_POSLE,  BLR_edRAION, BLR_edRAION_POSLE,
    edGOROD, edGOROD_POSLE, BLR_edGorod, BLR_edGorod_Posle,
    edOTEC_M_OBL, edOTEC_M_RAION, edOTEC_M_GOROD, edMAT_M_OBL, edMAT_M_RAION, edMAT_M_GOROD,
    edOTEC_OBL, edOTEC_RAION, edOTEC_GOROD, edMAT_OBL, edMAT_RAION, edMAT_GOROD,
    edON_M_OBL, edON_M_RAION, edON_M_GOROD, edON_M_OBL, edON_M_RAION, edON_M_GOROD,
    edONA_M_OBL, edONA_M_RAION, edONA_M_GOROD, edONA_M_OBL, edONA_M_RAION, edONA_M_GOROD,
    edOBL_Sv, edRAION_Sv, edGorod_Sv, BLR_edOBLB_Sv, BLR_edRAIONB_Sv, BLR_edGorodB_Sv
    ]);

  ENG_edOna_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edOn_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edOtec_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edMat_Identif.OnUpdateData:=IN_UpdateData;
  ENG_edIdentif_Do.OnUpdateData:=IN_UpdateData;
  ENG_edIdentif_Posle.OnUpdateData:=IN_UpdateData;

  if not FEnabledSpecBel then begin
    edSpec.OnCheckDrawRequiredState:=nil;
    edSpec.OnEnter:=nil;
  end;

  n:=14;
  SetLength(FArrAddProperty,n);
  // в творительном падеже
  SetAddProperty(0, 'ON_FAMILIA_P', '', ftMemo);
  SetAddProperty(1, 'ON_NAME_P', '', ftMemo);
  SetAddProperty(2, 'ON_OTCH_P', '', ftMemo);
  SetAddProperty(3, 'ON_FAMILIA_B_P', '', ftMemo);
  SetAddProperty(4, 'ON_NAME_B_P', '', ftMemo);
  SetAddProperty(5, 'ON_OTCH_B_P', '', ftMemo);
  SetAddProperty(6, 'ONA_FAMILIA_P', '', ftMemo);
  SetAddProperty(7, 'ONA_NAME_P', '', ftMemo);
  SetAddProperty(8, 'ONA_OTCH_P', '', ftMemo);
  SetAddProperty(9, 'ONA_FAMILIA_B_P', '', ftMemo);
  SetAddProperty(10, 'ONA_NAME_B_P', '', ftMemo);
  SetAddProperty(11, 'ONA_OTCH_B_P', '', ftMemo);

  SetAddProperty(12, 'OTHER', '', ftMemo);
  SetAddProperty(13, 'IZMEN', '', ftMemo);
  {$IFDEF GISUN}
    // типы нас. пунктов в кодах ГИС РН
    SetLength(FArrAddProperty,n+10);
    SetAddProperty(n,   'RN_B_GOROD_DO', '', ftString);
    SetAddProperty(n+1, 'RN_B_GOROD_POSLE', '', ftString);

    SetAddProperty(n+2, 'RN_OTEC_M_B_GOROD', '', ftString);
    SetAddProperty(n+3, 'RN_OTEC_B_GOROD', '', ftString);
    SetAddProperty(n+4, 'RN_MAT_M_B_GOROD', '', ftString);
    SetAddProperty(n+5, 'RN_MAT_B_GOROD', '', ftString);

    SetAddProperty(n+6, 'RN_ON_M_B_GOROD', '', ftString);
    SetAddProperty(n+7, 'RN_ON_B_GOROD', '', ftString);
    SetAddProperty(n+8, 'RN_ONA_M_B_GOROD', '', ftString);
    SetAddProperty(n+9, 'RN_ONA_B_GOROD', '', ftString);
  {$ENDIF}

  SetcbBel(N_F_cbBelorus);
  if GlobalTask.ParamAsBoolean('HIST_ZAGS') then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;
  SetLength(FArrCheckBelField,6);
  WriteToArrCheck(0,  1, false, 'OBL_DO'      , 'OBL_DO_B');
  WriteToArrCheck(1,  2, false, 'RAION_DO'    , 'RAION_DO_B');
  WriteToArrCheck(2,  3, true, 'GOROD_DO'    , 'GOROD_DO_B');

  WriteToArrCheck(3,  1, false, 'OBL_POSLE'   , 'OBL_POSLE_B');
  WriteToArrCheck(4,  2, false, 'RAION_POSLE' , 'RAION_POSLE_B');
  WriteToArrCheck(5,  3, true, 'GOROD_POSLE' , 'GOROD_POSLE_B');

  SetLength(FArrCheckField,10);
  WriteToArrCheck(0,  1, false, 'OBL_POSLE'   );
  WriteToArrCheck(1,  2, false, 'RAION_POSLE' );
  WriteToArrCheck(2,  1, false, 'OTEC_OBL'    );
  WriteToArrCheck(3,  2, false, 'OTEC_RAION'  );
  WriteToArrCheck(4,  1, false, 'MAT_OBL'     );
  WriteToArrCheck(5,  2, false, 'MAT_RAION'   );
  WriteToArrCheck(6,  1, false, 'ON_OBL'      );
  WriteToArrCheck(7,  2, false, 'ON_RAION'    );
  WriteToArrCheck(8,  1, false, 'ONA_OBL'     );
  WriteToArrCheck(9,  2, false, 'ONA_RAION'   );

  CheckControlSvid;

  SetPanelPovtor(tsPovtor, N_F_cbPovtor,nil,nil);

  SetVisibleNomerEkz(pn, edDateSv, N_F_1);

  {$IFDEF GISUN}
    FImageGisun:=ImageGISUN;
    FPoleGRN:=DokumentPOLE_GRN;
    ImageGISUN.Visible := IsActiveGISUN;
    // з/а об усыновлении не проводиться в регистре
    TBSubmenuGISUN.Visible:=false; //IsActiveSubMenuGISUN; //   ???
    FSubmenuGISUN:=TBSubmenuGISUN;
    CheckMenuGISUN;
    TBItemGetDataGISUN.Visible:=true;   // для доступности запроса данных
    AfterCreateFormGISUN;
  {$ELSE}
    TBSubmenuGISUN.Visible:=false;
    ImageGISUN.Visible := false;
  {$ENDIF}
  TBItemHistCorr.Visible:=FUpdatingObj;

end;

function TfmZapisAdopt.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_ZAdopt); //
end;
{
procedure TfmZapisAdopt.SetIDZags;
begin
  if DokumentID_ZAGS.IsNull then begin
    DokumentID_ZAGS.AsString := GlobalTask.ParamAsString('ID');
  end;
  Caption := Caption + '  ( ' + fmMain.SprNameOrg(DokumentID_ZAGS.AsInteger,'','') + ' )';
end;
}
function TfmZapisAdopt.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentPOVTOR.AsBoolean:=false;
  DokumentCOPIA.AsBoolean:=false;
  DokumentFIRST_EKZ.AsBoolean:=true;
//  DokumentBRAK_M.AsBoolean:=true;
  DokumentPOL.AsString:='М';
  DokumentB_OBL_DO.AsBoolean:=true;
  DokumentB_OBL_POSLE.AsBoolean:=true;
  DokumentON_B_OBL.AsBoolean:=true;
  DokumentONA_B_OBL.AsBoolean:=true;
  DokumentOTEC_B_OBL.AsBoolean:=true;
  DokumentMAT_B_OBL.AsBoolean:=true;
  DokumentON_M_B_OBL.AsBoolean:=true;
  DokumentONA_M_B_OBL.AsBoolean:=true;
  DokumentOTEC_M_B_OBL.AsBoolean:=true;
  DokumentMAT_M_B_OBL.AsBoolean:=true;
  DokumentVOSSTAN.AsBoolean := false;
  DokumentID_AKT_ROGD.AsInteger:=0;

  DokumentB_GOROD_DO.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentB_GOROD_POSLE.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentOTEC_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentMAT_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentON_M_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentONA_M_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentOTEC_M_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');
  DokumentMAT_M_B_GOROD.AsInteger:=GlobalTask.ParamAsInteger('TYPEPUNKT');

  inherited NewDok(lAppend);

  CheckForAll_Bel(DokumentOBL_DO);
  CheckForAll_Bel(DokumentRAION_DO);

  QueryExit:=false;
  Result := true;
end;

function TfmZapisAdopt.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
//  arr : TArrStrings;
//  sl  : TStringList;
begin
  Result := true;
  if not dmBase.tbZapisAdopt.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbZapisAdopt.FieldCount-1 do begin
    strField := dmBase.tbZapisAdopt.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, dmBase.tbZapisAdopt.Fields[i]);
    end;
  end;

  SetIDZags;
  ReadDopProperty(dmBase.TypeObj_ZAdopt, DokumentID.AsInteger,
          STOD('1899-12-30',tdAds));
  DokumentCOPIA.AsBoolean:=false;
  if DokumentPOVTOR.IsNull then DokumentPOVTOR.AsBoolean:=false;
  if DokumentID_AKT_ROGD.IsNull then DokumentID_AKT_ROGD.AsInteger:=0;
  {$IFDEF GISUN}
    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;
  ReadHistory(nID, dmBase.TypeObj_ZAdopt);

  //  {$IFDEF ZAGS}
//  ReadListRepeat( dmBase.TypeObj_ZAdopt, DokumentID.AsInteger);
//  {$ENDIF}
end;

function TfmZapisAdopt.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  sSeria,sNomer,sRukov,sRukovB,sSpec,sSpecB,strField, strErr : String;
  vKeyValues : Variant;
  {$IFNDEF ZAGS}
  dLastSost : TDateTime;
  {$ENDIF}
  nIdChild : Integer;
  s : String;
  dDate : TDateTime;
  lFullWrite : Boolean;
  arr:TArrStrings;
  procedure AddErr(s:String); begin  strErr:=strErr+s+chr(13)+chr(10); end;
begin
  PostDataSet(Dokument);
  AdditiveBeforeWriteDok;

  EditDataSet(Dokument);
  WriteOtherData(Dokument, 'OTHER', 'RUKOV_D;SPEC_D;ON_DOK_NAME;ON_DOKUMENT;ONA_DOK_NAME;ONA_DOKUMENT;');
  PostDataSet(Dokument);

  Result := true;
  lFullWrite:=true;   // полная запись актовой записи
  sSeria:='';
  sNomer:='';
  sRukov:='';
  sRukovB:='';
  sSpec:='';
  sSpecB:='';
  dDate:=0;
  //--------------- проверка на ошибки ввода -------------
  Result:=inherited CheckDokumentSimple(0, true);
  strErr:=FLastError;
//  strErr := '';
  if DokumentDATEZ.IsNull then begin
    AddErr(' Заполните дату записи акта. ');
  end else if DokumentNOMER.AsString='' then begin
    AddErr(' Заполните номер записи акта. ');
  end else if (DokumentDATER_DO.AsString='') then begin
    AddErr(' Заполните дату рождения. ');
  end else if not FOnlySvid and (DokumentDATER_POSLE.AsString='') then begin
    AddErr(' Заполните дату рождения после усыновления. ');
  end else if DokumentPOL.AsString='' then begin
    AddErr(' Заполните пол. ');
  end else if (DokumentFAMILIAPosle.AsString='') or (DokumentNAMEPosle.AsString='') or
              (DokumentOTCHPosle.AsString='')then begin
    AddErr(' Заполните Фамилию, Имя, Отчество после усыновления. ');
  end;
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
      Result:=dmBase.CheckNomerAkt(dmBase.TypeObj_ZAdopt, DokumentID_ZAGS.AsInteger,
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
    dmBase.tbZapisAdopt.Append;
    dmBase.tbZapisAdopt.Post;
    nID := dmBase.tbZapisAdopt.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.tbZapisAdopt.Locate('ID', nID, []) then begin
      Result := false;
    end;

    if Result and not lFullWrite and FOnlySvid then begin   // запись нашли и пишем только свидетельство
       with FMainTable do begin
         if not MySameText(FieldByName('FAMILIAPOSLE').AsString,DokumentFamiliaPOSLE.AsString) or
            not MySameText(FieldByName('NAMEPOSLE').AsString,DokumentNamePOSLE.AsString) or
            not MySameText(FieldByName('OTCHPOSLE').AsString,DokumentOtchPOSLE.AsString) or
            (FieldByName('DateR_DO').AsVariant<>DokumentDateR_DO.AsVariant) then begin
            PutError('Данные о ребенке не совпадают с данными из актовой записи.'#13+
                CreateFIO(FMainTable,'POSLE;E')+' '+DatePropis(FieldByName('DateR_DO').AsDateTime,3)+chr(13)+
                CreateFIO(Dokument,'POSLE;E')+ ' '+DatePropis(DokumentDateR_DO.AsDateTime,3),self);
            Result:=false;
         end;
         {
         if Result and (FieldByName('IDENTIF').AsString<>'') and
            not MySameText(FieldByName('IDENTIF').AsString,DokumentIDENTIF.AsString) then begin
            PutError('Идентификационный номер ребенка не совпадает с данными из актовой записи.'#13+
              '"'+FieldByName('IDENTIF').AsString+'"'+chr(13)+'"'+DokumentIDENTIF.AsString+'"',self);
            Result:=false;
         end;
         }
       end;
    end;

  end;
  if Result then  begin
    FCheckEditGIS:=CheckDateEditGIS;  // функция д.б. своя для каждого типа документа !!!

    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    dmBase.tbZapisAdopt.Edit;

    if lFullWrite then begin
      for i:=1 to dmBase.tbZapisAdopt.FieldCount-1 do begin
        strField := dmBase.tbZapisAdopt.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          dmBase.tbZapisAdopt.Fields[i].Value := fld.Value;
        end;
      end;
      WriteDopProperty(dmBase.TypeObj_ZAdopt, DokumentID.AsInteger,
                        STOD('1899-12-30',tdAds));

      WriteHistory(nID, dmBase.TypeObj_ZAdopt);

      {$IFDEF GISUN}
        WriteMessageID;
      {$ENDIF}

      if not FPrintSpecSvid
        then dmBase.tbZapisAdopt.FieldByName('SPEC_B').AsString:='';
    end;

    WriteDateIzm;
    WriteForAllDok_BeforePost;
//    dmBase.tbZapisAdopt.FieldByName('B_RESP').AsBoolean:=FCheckEditGIS;  !!! в регистр не передается !!!

    dmBase.tbZapisAdopt.Post;

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
    end;

//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);
    QueryExit:=false;
    Result := true;
    if FCheckBelName and FCheckFamily then begin
      dmBase.CheckBelFamily( DokumentON_Familia.AsString, DokumentON_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentONA_Familia.AsString, DokumentONA_Familia_B.AsString);
      dmBase.CheckBelFamily( DokumentFamiliaDo.AsString, DokumentFamiliaDo_B.AsString);
      dmBase.CheckBelFamily( DokumentFamiliaPosle.AsString, DokumentFamiliaPosle_B.AsString);
      WriteForAll_Bel;
    end;
    {$IFNDEF ZAGS}
    dLastSost := dmBase.LastDateSost;
    if (DokumentLICH_ID.AsString<>'') and
       ((dLastSost = dmBase.GetDateCurrentSost) or
        (DokumentDATEZ.AsDateTime >= dLastSost)) then begin
      vKeyValues := VarArrayCreate( [0, 1], varOleStr );
      vKeyValues[0] := dmBase.GetDateCurrentSost;
      vKeyValues[1] := 0;
      // у ребенка должен быть ID
      if DokumentCHILD_ID.AsString <> '' then begin
        nIdChild := DokumentCHILD_ID.AsInteger;
        vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, nIdChild);
        if dmBase.tbMens.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
          dmBase.tbMens.Edit;
          with dmBase.tbMens do begin
            FieldByName('FAMILIA').AsString  := DokumentFamiliaPosle.AsString;
            FieldByName('NAME').AsString     := DokumentNamePosle.AsString;
            FieldByName('OTCH').AsString     := DokumentOtchPosle.AsString;
            Post;
          end;
          if DokumentPOL.AsString='М' then s := 'откорректирован' else s := 'откорректирована';
          ShowMessage(DokumentFamiliaPosle.AsString+' '+DokumentNamePosle.AsString+' '+
                      DokumentOtchPosle.AsString+#13+' '+s+' в базе населения.');
        end;
      end;
    end;
    {$ENDIF}
//    {$IFDEF ZAGS}
//      if Result then begin
//        WriteListRepeat( dmBase.TypeObj_ZAdopt, nID);
//      end;
//    {$ENDIF}
    if Result then QueryExit:=false;
  end;
  if Result then FlushBuffers;
end;

procedure TfmZapisAdopt.edFamilaDoEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  l:Boolean;
begin
//  if ExitAsGISUN(true) then exit;

  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_AKT_ROGD');
  if Opis<>nil then begin
    if edFamiliaDo.Text<>'' then begin
      Opis.DataSet.Filter := 'FAMILIA='+QStr(edFamiliaDo.Text);
    end;
    Opis.DataSet.Filtered := true;
    SetLength(arrRec,1);
    v := null;
    if Opis.ChoiceFromSprEx(edFamiliaDo, v, arrRec, nil) and (v<>null) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      FRun:=true;
      l:=dbDisableControls(Dokument);
      try
        EditDataSet(Dokument);
  //      FIDAktRogd := v;
        QueryExit:=true;
        DokumentID_AKT_ROGD.AsInteger:=GetValueFieldEx(arrRec, 'ID',0);

   //----------  РЕБЕНОК --------------------------------------------------------------------
        DokumentFAMILIADO.AsString := GetValueFieldEx(arrRec, 'FAMILIA','');
        DokumentNAMEDO.AsString    := GetValueFieldEx(arrRec, 'NAME','');
        DokumentOTCHDO.AsString    := GetValueFieldEx(arrRec, 'OTCH', '');
        DokumentIDENTIF_DO.AsString:= GetValueFieldEx(arrRec, 'IDENTIF', '');
        DokumentPOL.AsString    := GetValueFieldEx(arrRec, 'POL', '');
        v := GetValueField(arrRec, 'DATER');
        if v = null then DokumentDateR_Do.AsString:='' else DokumentDateR_Do.Value := v;

        DokumentGOSUD_DO.AsString    := GetValueFieldEx(arrRec, 'GOSUD','');
        DokumentB_OBL_DO.AsBoolean   := true;
        DokumentOBL_DO.AsString      := GetValueFieldEx(arrRec, 'OBL', '');
        DokumentRAION_DO.AsString    := GetValueFieldEx(arrRec, 'RAION','');
        DokumentGOROD_DO.AsString := GetValueFieldEx(arrRec, 'GOROD','');
        DokumentB_GOROD_DO.AsString:= GetValueFieldEx(arrRec, 'B_GOROD','');

        DokumentREG_NOMER_DO.AsString:= GetValueFieldEx(arrRec, 'NOMER','');
        v:=GetValueField(arrRec, 'DATEZ');
        if v<>null then DokumentREG_DATE_DO.Value:=v;
        DokumentREG_MESTO_DO.AsString:=fmMain.SprNameOrg(GetValueFieldEx(arrRec, 'IDS_ZAGS',0),'','');

   //----------  МАТЬ --------------------------------------------------------------------
        DokumentMAT_FAMILIA.AsString := GetValueFieldEx(arrRec, 'ONA_FAMILIA','');
        DokumentMAT_NAME.AsString    := GetValueFieldEx(arrRec, 'ONA_NAME','');
        DokumentMAT_OTCH.AsString    := GetValueFieldEx(arrRec, 'ONA_OTCH', '');
        v := GetValueField(arrRec, 'ONA_DATER');
        if v = null then DokumentMAT_DateR.AsString := '' else DokumentMAT_DateR.Value := v;

        DokumentMAT_NATION.AsInteger := GetValueFieldEx(arrRec, 'ONA_NATION',0);
        DokumentMAT_GRAG.AsInteger := GetValueFieldEx(arrRec, 'ONA_GRAG',0);
        DokumentMAT_IDENTIF.AsString  := GetValueFieldEx(arrRec, 'ONA_IDENTIF', '');

        DokumentMAT_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_GOSUD','');
        DokumentMAT_OBL.AsString   := GetValueFieldEx(arrRec, 'ONA_OBL','');
        v := GetValueField(arrRec, 'ONA_B_RN');
        if (v=null) or (v=true) then begin
          v := GetValueField(arrRec, 'ONA_RAION');
          if v = null then DokumentMAT_RAION.AsString := '' else DokumentMAT_RAION.Value    := v;
        end;
        //------------ место жительства ------------------------
        DokumentMAT_GOROD.AsString   := GetValueFieldEx(arrRec, 'ONA_GOROD','');
        DokumentMAT_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ONA_GOROD_R','');
        DokumentMAT_B_OBL.AsBoolean   := GetValueFieldEx(arrRec, 'ONA_B_OBL', true);
        DokumentMAT_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_B_GOROD', '');
        //------------ место рождения ------------------------
        DokumentMAT_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOSUD','');
        DokumentMAT_M_OBL.AsString   := GetValueFieldEx(arrRec, 'ONA_M_OBL', '');
        DokumentMAT_M_RAION.AsString := GetValueFieldEx(arrRec, 'ONA_M_RAION','');
        DokumentMAT_M_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_M_GOROD','');
        DokumentMAT_M_B_OBL.AsBoolean := GetValueFieldEx(arrRec, 'ONA_M_B_OBL',true);
        DokumentMAT_M_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ONA_M_B_GOROD','');

   //----------  ОТЕЦ --------------------------------------------------------------------
        DokumentOTEC_FAMILIA.AsString := GetValueFieldEx(arrRec, 'ON_FAMILIA','');
        DokumentOTEC_NAME.AsString    := GetValueFieldEx(arrRec, 'ON_NAME','');
        DokumentOTEC_OTCH.AsString    := GetValueFieldEx(arrRec, 'ON_OTCH', '');
        v := GetValueField(arrRec, 'ON_DATER');
        if v = null then DokumentOTEC_DateR.AsString := '' else DokumentOTEC_DateR.Value := v;

        DokumentOTEC_NATION.AsInteger := GetValueFieldEx(arrRec, 'ON_NATION',0);
        DokumentOTEC_GRAG.AsInteger := GetValueFieldEx(arrRec, 'ON_GRAG',0);
        DokumentOTEC_IDENTIF.AsString  := GetValueFieldEx(arrRec, 'ON_IDENTIF', '');

        DokumentOTEC_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_GOSUD','');
        DokumentOTEC_OBL.AsString   := GetValueFieldEx(arrRec, 'ON_OBL','');
        v := GetValueField(arrRec, 'ON_B_RN');
        if (v=null) or (v=true) then begin
          v := GetValueField(arrRec, 'ON_RAION');
          if v = null then DokumentOTEC_RAION.AsString := '' else DokumentOTEC_RAION.Value    := v;
        end;
        //------------ место жительства ------------------------
        DokumentOTEC_GOROD.AsString   := GetValueFieldEx(arrRec, 'ON_GOROD','');
        DokumentOTEC_GOROD_R.AsString := GetValueFieldEx(arrRec, 'ON_GOROD_R','');
        DokumentOTEC_B_OBL.AsBoolean   := GetValueFieldEx(arrRec, 'ON_B_OBL', true);
        DokumentOTEC_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_B_GOROD', '');
        //------------ место рождения ------------------------
        DokumentOTEC_M_GOSUD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOSUD','');
        DokumentOTEC_M_OBL.AsString   := GetValueFieldEx(arrRec, 'ON_M_OBL', '');
        DokumentOTEC_M_RAION.AsString := GetValueFieldEx(arrRec, 'ON_M_RAION','');
        DokumentOTEC_M_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_M_GOROD','');
        DokumentOTEC_M_B_OBL.AsBoolean := GetValueFieldEx(arrRec, 'ON_M_B_OBL',true);
        DokumentOTEC_M_B_GOROD.AsString := GetValueFieldEx(arrRec, 'ON_M_B_GOROD','');
      finally
        FRun:=false;
        dbEnableControls(Dokument,l);
        PostDataSet(Dokument);
        Screen.Cursor := old;
      end;
    end;
    Opis.DataSet.Filter   := '';
    Opis.DataSet.Filtered := false;
  end;
end;

procedure TfmZapisAdopt.dsDokumentDataChange(Sender: TObject;
  Field: TField);
var
  strField : String;
  Pol : TPol;
  lCheck : Boolean;

begin
  inherited;
  if (Field<>nil) and not FRun and not IsReadDokument then begin
    FRun := true;
    strField:=UpperCase(Field.FieldName);
    if strField='ONA_FAMILIA' then begin
      DokumentONA_Familia_P.AsString := '';
      DokumentONA_Familia_B_P.AsString := '';
    end else if strField='ON_FAMILIA' then begin
      DokumentON_Familia_P.AsString := '';
      DokumentON_Familia_B_P.AsString := '';
    end else if strField='ONA_NAME' then begin
      DokumentONA_NAME_P.AsString := '';
      DokumentONA_NAME_B_P.AsString := '';
    end else if strField='ON_NAME' then begin
      DokumentON_NAME_P.AsString := '';
      DokumentON_NAME_B_P.AsString := '';
    end else if strField='ONA_OTCH' then begin
      DokumentONA_OTCH_P.AsString := '';
      DokumentONA_OTCH_B_P.AsString := '';
    end else if strField='ON_OTCH' then begin
      DokumentON_OTCH_P.AsString := '';
      DokumentON_OTCH_B_P.AsString := '';
    end;
    if FCheckBelName then begin
      EditDataSet(Dokument);
      Pol := tpNone;
      lCheck := false;
      if strField='NAMEDO' then begin
          DokumentNameDo_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
          lCheck := true;
      end else if strField='OTCHDO' then begin
          DokumentOtchDo_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
          lCheck := true;
      end else if strField='FAMILIADO' then begin
          DokumentFamiliaDo_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end else if strField='NAMEPOSLE' then begin
        if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentNameDo.AsString)) and (DokumentNameDo_B.AsString<>'')
          then DokumentNamePosle_B.AsString := DokumentNameDo_B.AsString
          else DokumentNamePosle_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
          lCheck := true;
      end else if strField='OTCHPOSLE' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentOtchDo.AsString)) and (DokumentOtchDo_B.AsString<>'')
            then DokumentOtchPosle_B.AsString := DokumentOtchDo_B.AsString
            else DokumentOtchPosle_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
          lCheck := true;
      end else if strField='FAMILIAPOSLE' then begin
          if (ANSIUpperCase(Field.AsString)=ANSIUpperCase(DokumentFamiliaDo.AsString)) and (DokumentFamiliaDo_B.AsString<>'')
            then DokumentFamiliaPosle_B.AsString := DokumentFamiliaDo_B.AsString
            else DokumentFamiliaPosle_B.AsString := dmBase.GetBelFamily( Field.AsString );
      end else if strField='ON_NAME' then begin
//        if DokumentON_Name_B.AsString='' then begin
          DokumentON_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
//        end;
      end else if strField='ON_OTCH' then begin
//        if DokumentON_Otch_B.AsString='' then begin
          DokumentON_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
//        end;
      end else if strField='ONA_NAME' then begin
//        if DokumentONA_Name_B.AsString='' then begin
          DokumentONA_Name_B.AsString := dmBase.CheckNameBel(Pol, Field.Value);
//        end;
      end else if strField='ONA_OTCH' then begin
//        if DokumentONA_Otch_B.AsString='' then begin
          DokumentONA_Otch_B.AsString := dmBase.CheckOtchBel(Pol, Field.Value);
//        end;
      end else if strField='ON_FAMILIA' then begin
//        if DokumentON_Familia_B.AsString='' then begin
          DokumentON_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
//        end;
      end else if strField='ONA_FAMILIA' then begin
//        if DokumentONA_Familia_B.AsString='' then begin
          DokumentONA_Familia_B.AsString := dmBase.GetBelFamily( Field.AsString );
//        end;
      end;
      CheckForAll_Bel(Field);
      if lCheck and (Pol <> tpNone) then begin
        if Pol = tpM then begin
          DokumentPOL.AsString := 'М';
        end else begin
          DokumentPOL.AsString := 'Ж';
        end;
      end;
    end;
    FRun := false;
  end;
end;

procedure TfmZapisAdopt.TBItemClearLichClick(Sender: TObject);
begin
  EditDataSet(Dokument);
  DokumentLICH_ID.AsString := '';
  PostDataSet(Dokument);
end;

procedure TfmZapisAdopt.UpdateActions;
begin
  inherited;
  {$IFNDEF ZAGS}
  TBItemClearLich.Enabled:=DokumentLICH_ID.AsString<>'';
  {$ENDIF}
  {$IFDEF ZAGS}
    TBItemDolg.Enabled := edCopy.Checked;
  {$ENDIF}
  btAktRogd.Enabled := (DokumentID_AKT_ROGD.AsInteger>0);
end;


procedure TfmZapisAdopt.N_F_cbBelorusClick(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then begin
    CheckForAll_Bel( nil );
    ActivateBLRKeyboard;
    edRukov.DataField       := 'RUKOV_B';
    edZAGS.DataField := 'NAME_ZAGS_B';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC_B';
    end;
  end else begin
    ActivateRUSKeyboard;
    edRukov.DataField       := 'RUKOV';
    edZAGS.DataField := 'NAME_ZAGS';
    if FEnabledSpecBel then begin
      edSpec.DataField   := 'SPEC';
    end;
  end;
end;

procedure TfmZapisAdopt.OnDestroyHint(Sender: TObject);
begin
  DestroyHint(H);
end;

destructor TfmZapisAdopt.Destroy;
begin
  DestroyHint(H);
  inherited;
end;

procedure TfmZapisAdopt.edFamiliaDoEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaDo,DokumentFamiliaDo.AsString+' ');
end;

procedure TfmZapisAdopt.edNameDoEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edNameDo,DokumentNameDo.AsString+' ');
end;

procedure TfmZapisAdopt.edOtchDoEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edOtchDo,DokumentOtchDo.AsString+' ');
end;

procedure TfmZapisAdopt.edON_FamiliaEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edON_Familia,DokumentON_Familia.AsString+' ');
end;

procedure TfmZapisAdopt.edON_NameEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edON_Name,DokumentON_Name.AsString+' ');
end;

procedure TfmZapisAdopt.edON_OTCHEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edON_OTCH,DokumentON_Otch.AsString+' ');
end;

procedure TfmZapisAdopt.edONA_FamiliaEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Familia,DokumentONA_Familia.AsString+' ');
end;

procedure TfmZapisAdopt.edONA_NameEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edONA_Name,DokumentONA_Name.AsString+' ');
end;

procedure TfmZapisAdopt.edONA_OTCHEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edONA_OTCH,DokumentONA_Otch.AsString+' ');
end;

procedure TfmZapisAdopt.edFamiliaPosleEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edFamiliaPosle,DokumentFamiliaPosle.AsString+' ');
end;

procedure TfmZapisAdopt.edNamePosleEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edNamePosle,DokumentNamePosle.AsString+' ');
end;

procedure TfmZapisAdopt.edOtchPosleEnter(Sender: TObject);
begin
  if N_F_cbBelorus.Checked then CreateHint(H,edOtchPosle,DokumentOtchPosle.AsString+' ');
end;

procedure TfmZapisAdopt.edFamiliaDoCheckDrawRequiredState(Sender: TObject;
  var DrawState: Boolean);
begin
  DrawState := N_F_cbBelorus.Checked;
end;

procedure TfmZapisAdopt.edRukovEnter(Sender: TObject);
begin  if N_F_cbBelorus.Checked then CreateHint(H,edRukov,DokumentRUKOV.AsString+' '); end;

procedure TfmZapisAdopt.SpeedButtonClick(Sender: TObject);
{$IFDEF GISUN}
var
  s,sType,sName,sNameBel:String;
{$ENDIF}
begin
  Dokument.CheckBrowseMode;
  Dokument.Edit;
  if not DokumentDateR_Do.IsNull then DokumentDateR_Posle.AsDateTime:=DokumentDateR_Do.AsDateTime;

  DokumentGOSUD_Posle.AsString:=DokumentGOSUD_DO.AsString;

  DokumentOBL_Posle.AsString:=DokumentOBL_DO.AsString;
  DokumentRAION_Posle.AsString:=DokumentRAION_DO.AsString;

  DokumentOBL_Posle_B.AsString:=DokumentOBL_DO_B.AsString;
  DokumentRAION_Posle_B.AsString:=DokumentRAION_DO_B.AsString;

  DokumentB_OBL_Posle.AsString:=DokumentB_OBL_DO.AsString;

  {$IFDEF GISUN}
    if DokumentRN_B_GOROD_DO.AsString<>'' then begin
      sType:=DokumentRN_B_GOROD_DO.AsString;
      sName:=DokumentGOROD_DO.AsString;
      sNameBel:=DokumentGOROD_DO_B.AsString;
      if dmBase.AllSprGISUN.Locate('TYPESPR;EXTCODE', VarArrayOf([CLASS_TYPEPUNKT_MR, sType]),[]) then begin
        s:=ANSIUpperCase(dmBase.AllSprGISUN.fieldByName('LEX1').AsString)+' '; // наименование типа по-русски
        if ANSIUpperCase(Copy(sName,1,Length(s)))=s
          then sName:=Copy(sName,Length(s)+1,Length(sName));
        s:=ANSIUpperCase(dmBase.AllSprGISUN.fieldByName('LEX2').AsString)+' '; // наименование типа по-белорусски
        if ANSIUpperCase(Copy(sNameBel,1,Length(s)))=s
          then sNameBel:=Copy(sNameBel,Length(s)+1,Length(sNameBel));
        if dmBase.TypePunkt.Locate('GISUN68',sType,[]) then begin
          sType:=dmBase.TypePunkt.FieldByName('ID').AsString;   // тип нас. пункта
        end else begin
          sType:='';
        end;
      end else begin
        sType:='';
      end;
      DokumentRN_B_GOROD_POSLE.AsString:='';
      DokumentB_GOROD_Posle.AsString:=sType;
      DokumentGOROD_Posle.AsString:=sName;
      DokumentGOROD_Posle_B.AsString:=sNameBel;
    end else begin
      DokumentB_GOROD_Posle.AsString:=DokumentB_GOROD_DO.AsString;
      DokumentGOROD_Posle_B.AsString:=DokumentGOROD_DO_B.AsString;
      DokumentGOROD_Posle.AsString:=DokumentGOROD_DO.AsString;
    end;
  {$ELSE}
     DokumentB_GOROD_Posle.AsString:=DokumentB_GOROD_DO.AsString;
     DokumentGOROD_Posle_B.AsString:=DokumentGOROD_DO_B.AsString;
     DokumentGOROD_Posle.AsString:=DokumentGOROD_DO.AsString;
  {$ENDIF}

  if not DokumentIDENTIF_DO.IsNull then DokumentIDENTIF_Posle.AsString:=DokumentIDENTIF_DO.AsString;
  if not DokumentREG_NOMER_DO.IsNull then DokumentREG_NOMER_Posle.AsString:=DokumentREG_NOMER_DO.AsString;
  if not DokumentREG_DATE_Do.IsNull then DokumentREG_DATE_Posle.AsDateTime:=DokumentREG_DATE_Do.AsDateTime;
  if not DokumentREG_MESTO_DO.IsNull then DokumentREG_MESTO_Posle.AsString:=DokumentREG_MESTO_DO.AsString;
  Dokument.Post;
end;

procedure TfmZapisAdopt.Button1Click(Sender: TObject);
begin
  edOTMETKA.AutoSelect:=false;
  edOTMETKA.Value := edOTMETKA.Value + '#';
  ActiveControl := edOTMETKA;
  edOTMETKA.SelStart := Length(edOTMETKA.Value);
  edOTMETKA.SelLength:= 1;
end;

procedure TfmZapisAdopt.edAdresIzvechEnter(Sender: TObject);
begin
  if DokumentAdresIzvech.AsString='' then begin
    Dokument.CheckBrowseMode;
    Dokument.Edit;
    DokumentAdresIzvech.AsString := GlobalTask.ParamAsString('ADRES_IZVECH');
  end;
end;

procedure TfmZapisAdopt.AdditiveNewDok;
begin
  inherited AdditiveNewDok;
  AddSvid;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisAdopt.AdditiveReadDok;
begin
  inherited;
  {$IFDEF ZAGS}
  if dmBase.OblArxivZAGS then begin
    N_F_1.Checked := false;
  end;
  {$ENDIF}
end;

procedure TfmZapisAdopt.edOBL_RNotInList(Sender: TObject; NewText: String;
  var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmZapisAdopt.edRaion_RNotInList(Sender: TObject;
  NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmZapisAdopt.btPadegClick(Sender: TObject);
begin
  if EditPadegAdopt( Dokument ) then begin
    QueryExit := true;
  end;
end;

procedure TfmZapisAdopt.TBItemStep1Click(Sender: TObject);
begin
{$IFDEF GISUN}
  GetDataFrom_GISUN(0);
//  Gisun.GetAdopt(Self);
//  Gisun.CheckAdopt(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisAdopt.TBItemStep2Click(Sender: TObject);
begin
{$IFDEF GISUN}
  RegisterAkt_GISUN(0);
//  Gisun.RegisterAdopt(Self);
//  Gisun.CheckAdopt(Self);
//  CheckImageGisun(DokumentPOLE_GRN,ImageGISUN);
{$ENDIF}
end;

procedure TfmZapisAdopt.pcChange(Sender: TObject);
begin
  inherited;
  if pc.ActivePageIndex>-1 then begin
    if pc.Pages[pc.ActivePageIndex].Name='tsSvid' then begin
      CheckForAll_Bel( nil );
      CheckValueSvid;
    end else begin
      N_F_cbBelorus.Parent:=pc.Pages[pc.ActivePageIndex];
    end;
  end;
end;

procedure TfmZapisAdopt.edDateR_DoUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckValueDateZAGS(TDbDateTimeEditEh(Sender).Value,TDbDateTimeEditEh(Sender), 13);
end;

//------------------------------------------------------------------------------------------
function TfmZapisAdopt.CreateSubMenuRun: Boolean;
var
 it : TTbItem;
// sep : TTbSeparatorItem;
begin
  inherited CreateSubmenuRun;
  Result:=true;

  AddSubmenu_CheckFIO;

  it := TTbItem.Create(TBSubmenuRun);
  it.Caption:='Аннулирование актовой записи';
  it.OnClick:=Event_Annulir;
  TBSubmenuRun.Add(it);

  AddSubmenu_ReadDolg;

end;

procedure TfmZapisAdopt.edMAT_FAMILIAEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
//
end;

function TfmZapisAdopt.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edGOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edGOROD_POSLE,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edGOROD_Sv,n,3,true,false,false,FAddButtonMRUList_Punkt);

  SetMRUList(edOTEC_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edOTEC_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edMAT_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edMAT_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edON_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edON_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edONA_M_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
  SetMRUList(edONA_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edOBL_POSLE,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edOBL_Sv,n,1,true,false,false,FAddButtonMRUList);

  SetMRUList(edOTEC_M_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edOTEC_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edMAT_M_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edMAT_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_M_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_M_OBL,n,1,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_OBL,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edRAION_POSLE,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edRAION_Sv,n,2,true,false,false,FAddButtonMRUList);

  SetMRUList(edOTEC_M_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edOTEC_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edMAT_M_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edMAT_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_M_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edON_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_M_RAION,n,2,true,false,false,FAddButtonMRUList);
  SetMRUList(edONA_RAION,n,2,true,false,false,FAddButtonMRUList);

end;

//----------------------------------------------------------------------------------
procedure TfmZapisAdopt.CheckValueSvid;
var
  s:String;
  arr:TArrStrings;
begin
  // в творительном падеже по русски
  if DokumentON_Familia_P.AsString='' then begin
    s := DokumentON_Familia.AsString+' '+DokumentON_NAME.AsString+' '+DokumentON_OTCH.AsString;

    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
//      s := GetPadegFIO(s,'м','Т');
      s := GetPadegFIO3(DokumentON_Familia.AsString,DokumentON_NAME.AsString,DokumentON_OTCH.AsString,'м','Т');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end;

    StrToArr(s,arr,' ',false);
    SetLength(arr,3);
    DokumentON_Familia_P.AsString:=arr[0];
    DokumentON_NAME_P.AsString:=arr[1];
    DokumentON_OTCH_P.AsString:=arr[2];
  end;
  if DokumentONA_Familia_P.AsString='' then begin
    s := DokumentONA_Familia.AsString+' '+DokumentONA_NAME.AsString+' '+DokumentONA_OTCH.AsString;
    if SvidInPadeg(TypeObj) then begin  // свидетельство в падеже
//      s := GetPadegFIO(s,'ж','Т');
      s := GetPadegFIO3(DokumentONA_Familia.AsString,DokumentONA_NAME.AsString,DokumentONA_OTCH.AsString,'ж','Т');
      if not LastSimIsLower(s) then s:=ANSIUpperCase(s);
    end;
    StrToArr(s,arr,' ',false);
    SetLength(arr,3);
    DokumentONA_Familia_P.AsString:=arr[0];
    DokumentONA_NAME_P.AsString:=arr[1];
    DokumentONA_OTCH_P.AsString:=arr[2];
  end;
  // по-бел в родительном падеже
  if DokumentON_Familia_B_P.AsString='' then begin
    DokumentON_Familia_B_P.AsString:=DokumentON_Familia_B.AsString;
    DokumentON_NAME_B_P.AsString:=DokumentON_NAME_B.AsString;
    DokumentON_OTCH_B_P.AsString:=DokumentON_OTCH_B.AsString;
  end;
  if DokumentONA_Familia_B_P.AsString='' then begin
    DokumentONA_Familia_B_P.AsString:=DokumentONA_Familia_B.AsString;
    DokumentONA_NAME_B_P.AsString:=DokumentONA_NAME_B.AsString;
    DokumentONA_OTCH_B_P.AsString:=DokumentONA_OTCH_B.AsString;
  end;
end;

function TfmZapisAdopt.BeforeReport: Boolean;
begin
  Result:=inherited BeforeReport;
  if Result then begin
    CheckForAll_Bel( nil );
    CheckValueSvid;
  end;
end;

//------------------------------------------------------------------------
procedure TfmZapisAdopt.CheckControlSvid;
var
  n:Integer;
begin
  if GlobalTask.ParamAsBoolean('INVERT_SVID') then begin
    Init_ArrCheckControl(24);
    n:=0;
    FArrCheckControl[n].Cont1:=edFamilia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edFamiliaB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edName_Sv;
    FArrCheckControl[n].Cont2:=BLR_edNameB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edOtch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOtchB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=Label81;
    FArrCheckControl[n].Cont2:=Label89; Inc(n);
    FArrCheckControl[n].Cont1:=Label91;
    FArrCheckControl[n].Cont2:=Label92; Inc(n);
    FArrCheckControl[n].Cont1:=Label93;
    FArrCheckControl[n].Cont2:=Label94; Inc(n);
    FArrCheckControl[n].Cont1:=Label99;
    FArrCheckControl[n].Cont2:=Label96; Inc(n);
    FArrCheckControl[n].Cont1:=Label100;
    FArrCheckControl[n].Cont2:=Label97; Inc(n);
    FArrCheckControl[n].Cont1:=Label101;
    FArrCheckControl[n].Cont2:=Label98; Inc(n);

    FArrCheckControl[n].Cont1:=edGosud_Sv;
    FArrCheckControl[n].Cont2:=BLR_edGosud_Sv_B; Inc(n);   //10

    FArrCheckControl[n].Cont1:=edObl_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOblB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edRAION_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRaionB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edGorod_Sv;
    FArrCheckControl[n].Cont2:=BLR_edGorodB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edTypeGorod_Sv;
    FArrCheckControl[n].Cont2:=BLR_edTypeGorodB_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edRukov_Sv;
    FArrCheckControl[n].Cont2:=BLR_edRukov_Sv_B; Inc(n);

    FArrCheckControl[n].Cont1:=edON_Familia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_Familia_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_Name_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_Name_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edON_Otch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edON_Otch_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edONA_Familia_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_Familia_B_Sv; Inc(n);
    FArrCheckControl[n].Cont1:=edONA_Name_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_Name_B_Sv; Inc(n);   // 20
    FArrCheckControl[n].Cont1:=edONA_Otch_Sv;
    FArrCheckControl[n].Cont2:=BLR_edONA_Otch_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edFamiliaPosle_Sv;
    FArrCheckControl[n].Cont2:=BLR_edFamiliaPosle_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edNamePosle_Sv;
    FArrCheckControl[n].Cont2:=BLR_edNamePosle_B_Sv; Inc(n);

    FArrCheckControl[n].Cont1:=edOtchPosle_Sv;
    FArrCheckControl[n].Cont2:=BLR_edOtchPosle_B_Sv; Inc(n);    //24

  end;
end;
//------------------------------------------------------------
procedure TfmZapisAdopt.edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceSpecD(edRukov);
end;
procedure TfmZapisAdopt.edRukov_SvEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edRukov_Sv);
end;
procedure TfmZapisAdopt.edSPECEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSpecD(edSpec);
end;
//------------------------------------------------------------
function TfmZapisAdopt.CheckFIO: String;
begin
  Result:=CheckOneFIO('До усыновления: ',DokumentFamiliaDo.AsString, DokumentNameDo.AsString, DokumentOtchDo.AsString);
  if Result='' then begin
    Result:=CheckOneFIO('После усыновления: ',DokumentFamiliaPosle.AsString, DokumentNamePosle.AsString, DokumentOtchPosle.AsString);
  end;
end;

procedure TfmZapisAdopt.SetOnlyPovtorSvid(lOnlyPovtor: Boolean;  pc: TPageControl; ts: TWinControl; NonVisibleControls: array of TVarRec;  lbSvid, lbNomer: TLabel);
begin
  inherited SetOnlyPovtorSvid(lOnlyPovtor,pc,ts,NonVisibleControls,lbSvid,lbNomer);
  if lOnlyPovtor then begin
    TBItemSeekAkt.Visible:=true;
//    TBItemArxSpr.Visible:=false;
//  TBSubmenuGISUN.Visible:=false;
//    TBItemStep2.Caption:='Зарегистрировать свидетельство';

//    lbIdentif.Parent:=tsSvid;
//    lbIDENTIF.Top:=Label51.Top;
//    lbIDENTIF.Left:=edDateR_Sv.Left+edDateR_Sv.Width+50;
//    lbIDENTIF.Caption:='Иден. номер';
//    ENG_edIDENTIF.Parent:=tsSvid;
//    ENG_edIDENTIF.Top:=edDateR_Sv.Top;
//    ENG_edIDENTIF.Left:=lbIDENTIF.Left+lbIDENTIF.Width+50;
  end;
end;

procedure TfmZapisAdopt.btAktRogdClick(Sender: TObject);
var
  i:Integer;
  s:String;
begin
  if DokumentID_AKT_ROGD.AsInteger>0 then begin
    CheckUserName_frxDataSet;
    if dmBase.tbZapisRogd.Locate('ID', DokumentID_AKT_ROGD.AsInteger, []) then begin
      if dmBase.tbZapisRogd.FieldByName('VOSSTAN').IsNUll or not dmBase.tbZapisRogd.FieldByName('VOSSTAN').AsBoolean then begin
        EditZapisRogd( DokumentID_AKT_ROGD.AsInteger, Dokument, false, nil );
      end else begin
    //    EditZapisRogdV( DokumentID_AKT_ROGD.AsInteger, Dokument, false,nil );
        PutError('Нельзя внести изменения в восстановленную запись акта.',self)
      end;
    end else begin
      PutError('Запись акта о рождении не найдена.',self)
    end;

    UnCheckUserName_frxDataSet;
    SetCurDok(Self);
  end;
end;
//-----------------------------------------------------------------------
procedure TfmZapisAdopt.ClearDokUdost(st:String);
begin
  EditDataSet(Dokument);
  Dokument.FieldByName(st+'_DOK_TYPE').AsString:='';
  Dokument.FieldByName(st+'_DOK_SERIA').AsString:='';
  Dokument.FieldByName(st+'_DOK_NOMER').AsString:='';
//      Dokument.FieldByName(st+'_DOK_ORGAN.AsString:=tbDOK_ORGAN.AsString;
  Dokument.FieldByName(st+'_DOK_NAME').AsString:='';
  Dokument.FieldByName(st+'_DOK_DATE').AsString:='';
  Dokument.FieldByName(st+'_DOKUMENT').AsString:='';
  PostDataSet(Dokument);
end;
//-----------------------------------------------------------------------
procedure TfmZapisAdopt.EditDokUdost(st:String);
var
 p : TPassport;
 s : String;
begin
  fmEnterDokument:=TfmEnterDokument.Create(self);
  with fmEnterDokument do begin
    tb.Edit;
    tbDOK_TYPE.AsString:=Dokument.FieldByName(st+'_DOK_TYPE').AsString;
    tbDOK_SERIA.AsString:=Dokument.FieldByName(st+'_DOK_SERIA').AsString;
    tbDOK_NOMER.AsString:=Dokument.FieldByName(st+'_DOK_NOMER').AsString;
    tbDOK_NAME.AsString:=Dokument.FieldByName(st+'_DOK_NAME').AsString;
    WriteDateField(tbDOK_DATE,Dokument.FieldByName(st+'_DOK_DATE'));
    {$IFDEF GISUN}
//    if IsActiveGISUN and ((GISUN.GetPoleGrnSub( DokumentPOLE_GRN.AsInteger) and bPerson)=bPerson) then begin
//      SetEnableEdit(false);
//    end else begin
//      SetEnableEdit(true);
//    end;
    {$ENDIF}
    SetEnableEdit(true);
    if EditDokument then begin
      Application.ProcessMessages;
      EditDataSet(Dokument);
      Dokument.FieldByName(st+'_DOK_TYPE').AsString:=tbDOK_TYPE.AsString;
      Dokument.FieldByName(st+'_DOK_SERIA').AsString:=tbDOK_SERIA.AsString;
      Dokument.FieldByName(st+'_DOK_NOMER').AsString:=tbDOK_NOMER.AsString;
//      Dokument.FieldByName(st+'_DOK_ORGAN.AsString:=tbDOK_ORGAN.AsString;
      Dokument.FieldByName(st+'_DOK_NAME').AsString:=tbDOK_NAME.AsString;
      WriteDateField(Dokument.FieldByName(st+'_DOK_DATE'),tbDOK_DATE);
      p := dmBase.PasportFromValues(tbDOK_TYPE.AsInteger, tbDOK_SERIA.AsString, tbDOK_NOMER.AsString,
                           tbDOK_NAME.AsString, '', tbDOK_DATE.Value);
      s := dmBase.PasportToText(p,0);
      if s<>'' then begin
        Dokument.FieldByName(st+'_DOKUMENT').AsString:=s;
      end;
      PostDataSet(Dokument);
    end;
  end;
end;
//-----------------------------------------------------------------------
procedure TfmZapisAdopt.edON_DOKEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  EditDokUdost('ON');
end;
//-----------------------------------------------------------------------
procedure TfmZapisAdopt.edONA_DOKEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  EditDokUdost('ONA');
end;

procedure TfmZapisAdopt.edON_DOKEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  ClearDokUdost('ON');
end;

procedure TfmZapisAdopt.edONA_DOKEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  ClearDokUdost('ONA');
end;

function TfmZapisAdopt.CheckDateEditGIS: Boolean;
begin
  Result:=false;   //  !!! не передается в ГИС РН
{
  if (DokumentNOMER.AsString<>FMainTable.FieldByName('NOMER').AsString) or
     (DokumentDATEZ.AsString<>FMainTable.FieldByName('DATEZ').AsString) or
     (DokumentSVID_SERIA.AsString<>FMainTable.FieldByName('SVID_SERIA').AsString) or
     (DokumentSVID_NOMER.AsString<>FMainTable.FieldByName('SVID_NOMER').AsString) or
     (DokumentDATESV.AsString<>FMainTable.FieldByName('DATESV').AsString) or
     (DokumentIDENTIF.AsString<>FMainTable.FieldByName('IDENTIF').AsString) or
     (DokumentDATER.AsString<>FMainTable.FieldByName('DATER').AsString) or

     (DokumentFamiliaPosle_B.AsString<>FMainTable.FieldByName('FamiliaPosle_B').AsString) or
     (DokumentNamePosle_B.AsString<>FMainTable.FieldByName('NamePosle_B').AsString) or
     (DokumentOtchPosle_B.AsString<>FMainTable.FieldByName('OtchPosle_B').AsString) or
     (DokumentFamiliaPosle.AsString<>FMainTable.FieldByName('FamiliaPosle').AsString) or
     (DokumentNamePosle.AsString<>FMainTable.FieldByName('NamePosle').AsString) or
     (DokumentOtchPosle.AsString<>FMainTable.FieldByName('OtchPosle').AsString) or

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
    }
end;
//-----------------------------------------------------------
procedure TfmZapisAdopt.WriteAfterRegister_GISUN;
begin
//
end;



end.
