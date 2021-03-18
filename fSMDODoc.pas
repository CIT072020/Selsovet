unit fSMDODoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uTypes, uProject, uProjectAll, DsiWin32, mMD5,
  Dialogs, fSimpleD, kbmMemTable, kbmMemCSVStreamFormat, ImgList, FR_DSet, dbFunc, FuncPr, MetaTask, ShellAPI, FileCtrl,
  FR_DBSet, DB, vchDBCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGridEh, OpisEdit, mAdsObj, fWarning, fParamQuest, uUtilFiles,
  ExtCtrls, DBCtrlsEh, Mask, TB2Item, TB2Dock, TB2Toolbar, TypInfo, uDataSet2XML, mPermit, ifpii_dbfunc, EncdDecd, QStrings,
  adsdata, adsfunc, adstable, ZipForge, DBCtrls, Menus;

type
  TfmSMDODoc = class(TfmSimpleD)
    DokumentDTSTAMP: TDateTimeField;
    DokumentDATEPOST: TDateTimeField;
    DokumentSUBJ_TYPE: TSmallintField;
    DokumentMSG_TYPE: TSmallintField;
    DokumentSENT: TSmallintField;
    DokumentSUBJ_FROM: TStringField;
    DokumentSUBJECT: TStringField;
    DokumentMSG_ID: TStringField;
    DokumentNAME: TStringField;
    DokumentSMDOCODE: TStringField;
    DokumentMSG_ACKNOW: TSmallintField;
    DokumentACK_MSG_ID: TStringField;
    DokumentACK_TYPE: TSmallintField;
    DokumentADR_REGNUMBER: TStringField;
    DokumentADR_REGDATE: TDateField;
    DokumentMY_REGNUMBER: TStringField;
    DokumentMY_REGDATE: TDateField;
    DokumentKOMM: TStringField;
    DokumentTEXT: TMemoField;
    DokumentDOC_ID: TIntegerField;
    tbTask: TkbmMemTable;
    tbTaskTASK_ID: TIntegerField;
    tbTaskNOMER: TSmallintField;
    tbTaskADD_TYPE: TSmallintField;
    tbTaskIDNUMBER: TStringField;
    tbTaskKIND: TStringField;
    tbTaskTEXT: TMemoField;
    tbTaskTASKDATE: TDateField;
    tbTaskTASKNUMBER: TStringField;
    tbTaskCONFIDENT: TStringField;
    tbTaskNUMCOPY: TSmallintField;
    tbTaskFLAG: TSmallintField;
    tbTaskDEADLINE: TDateField;
    tbFiles: TkbmMemTable;
    tbMens: TkbmMemTable;
    tbFilesPARENT_ID: TIntegerField;
    tbFilesFILE_ID: TIntegerField;
    tbFilesSTORE_KIND: TSmallintField;
    tbFilesNAME: TStringField;
    tbFilesPATH: TStringField;
    tbFilesVALUE: TMemoField;
    tbFilesKOMM: TStringField;
    tbFilesSIGNATURE: TMemoField;
    tbFilesSIGNINFO: TMemoField;
    tbFilesDATEC: TDateTimeField;
    tbFilesDATEM: TDateTimeField;
    tbMensPARENT_ID: TIntegerField;
    tbMensTIP: TSmallintField;
    tbMensORG: TStringField;
    tbMensFIO: TStringField;
    tbMensOFFICIAL: TStringField;
    tbMensRANK: TStringField;
    tbMensADRES: TStringField;
    tbMensTEL_WORK: TStringField;
    tbMensTEL_MOB: TStringField;
    tbMensEMAIL: TStringField;
    tbMensSIGNDATE: TDateField;
    tbMensSROK: TDateField;
    tbMensATTESTATION: TStringField;
    DokumentIDNUMBER: TStringField;
    DokumentKIND: TStringField;
    DokumentNUMCOPY: TSmallintField;
    DokumentFLAG: TSmallintField;
    DokumentPAGES: TSmallintField;
    DokumentPAR_IDNUMBER: TStringField;
    DokumentPAR_LASTMSG: TStringField;
    DokumentPAR_PARMSG: TStringField;
    DokumentDOC_TYPE: TSmallintField;
    pc: TPageControl;
    tsDoc: TTabSheet;
    tsTask: TTabSheet;
    tsAddDoc: TTabSheet;
    DokumentCONFIDENT: TStringField;
    tbFilesPOST_ID: TIntegerField;
    tbMensPOST_ID: TIntegerField;
    tbMensNOMER: TIntegerField;
    tbTaskPOST_ID: TIntegerField;
    dsFiles: TDataSource;
    tbFilesFILE_TYPE: TStringField;
    ImageList1: TImageList;
    gbFiles: TGroupBox;
    GridFiles: TDBGridEh;
    Panel2: TPanel;
    btAddFile: TBitBtn;
    btETSPFile: TBitBtn;
    btDelFile: TBitBtn;
    odFile: TOpenDialog;
    gbMens: TGroupBox;
    GridMens: TDBGridEh;
    Panel3: TPanel;
    btAddMen: TBitBtn;
    btEditMen: TBitBtn;
    btDelMen: TBitBtn;
    tbMensR: TkbmMemTable;
    dsMens: TDataSource;
    dsMensR: TDataSource;
    pnDoc: TPanel;
    Label10: TLabel;
    edFlag: TDBComboBoxEh;
    Label6: TLabel;
    edKind: TDBComboBoxEh;
    Label11: TLabel;
    edNumCopy: TDBNumberEditEh;
    edCONFIDENT: TDBEditEh;
    Label7: TLabel;
    edDocType: TDBComboBoxEh;
    Label8: TLabel;
    edPages: TDBNumberEditEh;
    edKomm: TDBEditEh;
    Label13: TLabel;
    DokumentPAR_REGNUMBER: TStringField;
    DokumentPAR_REGDATE: TDateField;
    tbMensAll: TkbmMemTable;
    TBItemRegIsx: TTBItem;
    pnTask: TPanel;
    dbNavigator: TDBNavigator;
    dsTask: TDataSource;
    StaticText1: TStaticText;
    edTaskNumber: TDBEditEh;
    StaticText2: TStaticText;
    edTaskDate: TDBDateTimeEditEh;
    N_F_DBCheckBoxEh1: TDBCheckBoxEh;
    N_F_DBCheckBoxEh2: TDBCheckBoxEh;
    StaticText11: TStaticText;
    edTaskText: TDBEditEh;
    StaticText12: TStaticText;
    edDeadLine: TDBDateTimeEditEh;
    Label1: TLabel;
    edTaskFlag: TDBComboBoxEh;
    Label2: TLabel;
    edTaskNUMCOPY: TDBNumberEditEh;
    edTaskCONFIDENT: TDBEditEh;
    tbFolder: TkbmMemTable;
    tbFolderPOST_ID: TIntegerField;
    tbFolderTASK_ID: TIntegerField;
    tbFolderNOMER: TSmallintField;
    tbFolderADD_TYPE: TSmallintField;
    tbFolderIDNUMBER: TStringField;
    tbFolderKIND: TStringField;
    tbFolderTEXT: TMemoField;
    tbFolderTASKDATE: TDateField;
    tbFolderTASKNUMBER: TStringField;
    tbFolderCONFIDENT: TStringField;
    tbFolderNUMCOPY: TSmallintField;
    tbFolderFLAG: TSmallintField;
    tbFolderDEADLINE: TDateField;
    dsFolder: TDataSource;
    tbTaskTASK_REG: TBooleanField;
    tbTaskTASK_COPY: TBooleanField;
    tbFolderTASK_REG: TBooleanField;
    tbFolderTASK_COPY: TBooleanField;
    pnFolder: TPanel;
    tbTaskCONTENTS: TMemoField;
    tbFolderCONTENTS: TMemoField;
    tbTaskPAGES: TIntegerField;
    tbFolderPAGES: TIntegerField;
    StaticText13: TStaticText;
    edFolderContens: TDBEditEh;
    Label3: TLabel;
    edAddType: TDBComboBoxEh;
    DBNavigator1: TDBNavigator;
    DokumentSUBJ_ERROR: TBooleanField;
    DokumentERROR_TEXT: TMemoField;
    Panel1: TPanel;
    lbSMDOCode: TvchDBText;
    lbAdresat: TStaticText;
    edName: TDBEditEh;
    lbKomu1: TStaticText;
    lbKomu: TStaticText;
    StaticText3: TStaticText;
    edSUBJECT: TDBEditEh;
    edMsgType: TDBComboBoxEh;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    edMsgAcknow: TDBComboBoxEh;
    gbAdrReg: TGroupBox;
    StaticText6: TStaticText;
    edAdrRegNumber: TDBEditEh;
    StaticText8: TStaticText;
    edAdrRegDate: TDBDateTimeEditEh;
    gbMyReg: TGroupBox;
    StaticText7: TStaticText;
    edMyRegNumber: TDBEditEh;
    StaticText9: TStaticText;
    edMyRegDate: TDBDateTimeEditEh;
    btKomu: TButton;
    DokumentSUBJ_SYSTEM: TSmallintField;
    Label9: TLabel;
    edTitle: TDBEditEh;
    edKindS: TDBEditEh;
    tbFilesMD5: TStringField;
    tbReferred: TkbmMemTable;
    tbReferredPOST_ID: TIntegerField;
    tbReferredPARENT_ID: TIntegerField;
    tbReferredREGDATE: TDateField;
    tbReferredREGNUMBER: TStringField;
    tbReferredIDNUMBER: TStringField;
    tbReferredRETYPE: TSmallintField;
    dsReferredAdd: TDataSource;
    Panel4: TPanel;
    tbReferredAdd: TkbmMemTable;
    tbReferredR: TkbmMemTable;
    dsReferredR: TDataSource;
    DataSource1: TDataSource;
    StaticText10: TStaticText;
    grReferredR: TDBGridEh;
    dsReferredTask: TDataSource;
    tbReferredTask: TkbmMemTable;
    pmFiles: TPopupMenu;
    pmFiles_Save: TMenuItem;
    pmFiles_Add: TMenuItem;
    N1: TMenuItem;
    pmFiles_Del: TMenuItem;
    pmFiles_ETSP: TMenuItem;
    pmFiles_Open: TMenuItem;
    pmMens: TPopupMenu;
    pmMens_Add: TMenuItem;
    pmMens_Del: TMenuItem;
    pmMens_Edit: TMenuItem;
    GroupBox1: TGroupBox;
    edNote: TDBMemo;
    GroupBox2: TGroupBox;
    grReferredAdd: TDBGridEh;
    GroupBox3: TGroupBox;
    grReferredTask: TDBGridEh;
    vchDBText1: TvchDBText;
    vchDBText2: TvchDBText;
    Button1: TButton;
    DokumentPAR_DELIVERY_TYPE: TSmallintField;
    DokumentPAR_PARORG: TStringField;
    lbOtvet1: TStaticText;
    edOtvet_DeliveryType: TDBComboBoxEh;
    lbOtvet2: TStaticText;
    edOtvet_Regnumber: TDBEditEh;
    lbOtvet3: TStaticText;
    edOtvet_Regdate: TDBDateTimeEditEh;
    lbdOtvet_PARORG: TvchDBText;
    pmFilesWithETSP64_Save: TMenuItem;
    tbFolderTASK_ID_SOURCE: TIntegerField;
    tbTaskTASK_ID_SOURCE: TIntegerField;
    DokumentISWRITE_REF: TBooleanField;
    ImAddMat: TImage;
    pmFilesWithETSP_Load: TMenuItem;
    DokumentADD_ACK: TMemoField;
    tsPrim: TTabSheet;
    edPrim: TDBMemo;
    edAddAck: TDBEditEh;
    lbAddAck: TStaticText;
    DokumentADD_TEXT: TStringField;
    Label4: TLabel;
    Label5: TLabel;
    btTestAck: TButton;
    btAdsSys: TButton;
    pmFilesWithETSP_Save: TMenuItem;
    DokumentDOC_STATUS: TSmallintField;
    pmFilesAll_SaveClick: TMenuItem;
    N2: TMenuItem;
    pmFilesWithETSPAll_Save: TMenuItem;
    btETSPFileAll: TBitBtn;
    pmFilesAll_ETSP: TMenuItem;
    procedure lbDtstampGetText(Sender: TObject; var Text: String);
    procedure lbDATEPOSTGetText(Sender: TObject; var Text: String);
    procedure TBItemAdresatClick(Sender: TObject);
    procedure GridFilesDocColumns0GetCellParams(Sender: TObject;   EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridFilesDblClick(Sender: TObject);
    procedure btDelFileClick(Sender: TObject);
    procedure btAddFileClick(Sender: TObject);
    procedure btETSPFileClick(Sender: TObject);
    procedure GridFilesGetCellParams(Sender: TObject; Column: TColumnEh;   AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure pcChange(Sender: TObject);
    procedure btAddMenClick(Sender: TObject);
    procedure btDelMenClick(Sender: TObject);
    procedure btEditMenClick(Sender: TObject);
    procedure lbDocParentGetText(Sender: TObject; var Text: String);
    procedure TBItemRegIsxClick(Sender: TObject);
    procedure tbMensRAfterInsert(DataSet: TDataSet);
    procedure btKomuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure vchDBText1GetText(Sender: TObject; var Text: String);
    procedure TBItemAddNewClick(Sender: TObject);
    procedure TBItemAddDelClick(Sender: TObject);
    procedure TBItemNotRegistrClick(Sender: TObject);
    procedure edNameEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure lbSMDOCodeClick(Sender: TObject);
    procedure tbTaskAfterScroll(DataSet: TDataSet);
    procedure dsFilesDataChange(Sender: TObject; Field: TField);
    procedure dsMensDataChange(Sender: TObject; Field: TField);
    procedure edNameEditButtons1Click(Sender: TObject;    var Handled: Boolean);
    procedure tbFolderAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure TBItemChoiceInClick(Sender: TObject);
    procedure TBItemChoiceOutClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure TBItemAddListClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tbReferredAfterPost(DataSet: TDataSet);
    procedure edMsgTypeChange(Sender: TObject);
    procedure grReferredRColumns0GetCellParams(Sender: TObject;        EditMode: Boolean; Params: TColCellParamsEh);
    procedure grReferredAddColumns0GetCellParams(Sender: TObject;      EditMode: Boolean; Params: TColCellParamsEh);
    procedure grReferredTaskColumns0GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
    procedure TBItemDelListClick(Sender: TObject);
    procedure pmFiles_SaveClick(Sender: TObject);
    procedure pmFiles_AddClick(Sender: TObject);
    procedure pmFiles_DelClick(Sender: TObject);
    procedure pmFiles_ETSPClick(Sender: TObject);
    procedure pmFiles_OpenClick(Sender: TObject);
    procedure pmMens_AddClick(Sender: TObject);
    procedure pmMens_DelClick(Sender: TObject);
    procedure pmMens_EditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure vchDBText2GetText(Sender: TObject; var Text: String);
    procedure Button1Click(Sender: TObject);
    procedure edOtvet_DeliveryTypeChange(Sender: TObject);
    procedure edOtvet_RegnumberEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edOtvet_RegnumberEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure pmFilesWithETSP64_SaveClick(Sender: TObject);
    procedure grReferredRDblClick(Sender: TObject);
    procedure grReferredAddDblClick(Sender: TObject);
    procedure pmFilesWithETSP_LoadClick(Sender: TObject);
    procedure edNameEditButtons2Click(Sender: TObject; var Handled: Boolean);
    procedure edTitleDblClick(Sender: TObject);
    procedure edKommDblClick(Sender: TObject);
    procedure edTaskTextChange(Sender: TObject);
    procedure edNoteDblClick(Sender: TObject);
    procedure edFolderContensDblClick(Sender: TObject);
    procedure edPrimDblClick(Sender: TObject);
    procedure btTestAckClick(Sender: TObject);
    procedure btAdsSysClick(Sender: TObject);
    procedure pmFilesWithETSP_SaveClick(Sender: TObject);
    procedure DokumentSMDOCODEChange(Sender: TField);
    procedure pmFilesAll_SaveClickClick(Sender: TObject);
    procedure btETSPFileAllClick(Sender: TObject);
    procedure pmFilesAll_ETSPClick(Sender: TObject);
  private
    { Private declarations }
    FActiveMensR:Boolean;
    FAckDeliver:Integer;
    FAckRegister:Integer;
    FCreateAckRegister:Boolean;
    FCreateAckDeliver:Boolean;
    TBItemRegister : TTbItem;
    TBItemNotRegistr : TTbItem;
    TbItemNotReady : TTbItem;
    TBItemChoiceIn: TTBItem;
    TBItemChoiceOut: TTBItem;
    TBItemAddNew: TTBItem;
    TBItemAddDel: TTBItem;
    TBSeparatoAdd:TTbSeparatorItem;
  public
    { Public declarations }
    FDeliver:TStringList;   // рассылка
    function GetVid : String; override;
    function CreateSubMenuRun: Boolean; override;
    procedure AddFile(sFileName:String; nPostID:Integer; nParentID:Integer; sSign:String; sSignInfo:String='');
    procedure EditKomu;
    procedure gbEnabled(gb:TWinControl; lSet:Boolean);
    procedure CheckEnabledDoc(lSet:Boolean);
    procedure CheckEnabledTask;
    procedure CheckEnabledFolder;
    function  SubjError(lShow:Boolean):Boolean;
    function WriteReferredToOsnDoc: Boolean;
    function WriteOneReferredToOsnDoc(nID:Integer; dsRef:TDataSet): Boolean;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    procedure SetAddFields(s:String);
    function GetAddFields:String;
    procedure AfterReadDok; override;
    procedure WriteSMDOCODE(sValue:String);
    procedure CheckControlOneWin(sValue:String);

    procedure CheckControl;
    function DocReadOnly:Boolean;

    procedure getKomu;
    function SubjIN: Boolean;    // входящее сообщение
    function SubjOUT: Boolean;   // исходящее сообщение
    function GetIndexFromExt(sEXT:String):Integer;
    procedure ViewFile(ds:TDataSet);
    function getCurrentTask:Integer;
    function getCurrentAddDoc:Integer;
    function getCurrentParent:Integer;
    function getFileName(ds:TDataSet):String;
    procedure Event_OnAddMens(Sender: TObject);
    procedure Event_NotRegister(Sender: TObject);
    procedure Event_Register(Sender: TObject);

    procedure SignAllFiles;

    procedure Event_DoMainGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure DocMain_ParamsEditSpr(Opis:TOpisEdit);
    function  SaveOneFile(ds:TDataSet; sDir:String):Boolean;

    procedure PostDokument; override;
    procedure File_Delete;
    procedure ChoiceFilesFromSMDO(nType:Integer);
    function ChoiceFromSMDO(nType:Integer; var arrRec:TCurrentRecord; sOrg:String):Integer;
    function getNameRef(ds:TDataSet):String;
    function getDocParentText: String;

    function BeforeEdit : Boolean; override;
    function SaveToIni : Boolean; override;
    procedure LoadFromIni; override;
    procedure SetCaptionForm;
    function CurrentTS:Integer;
    procedure CheckFilterTables(nCur:Integer=-1);
    function IsReady: Boolean;
    procedure ReadDataFromPost(nPostID:Integer; sRegNumber:String; dRegDate:TDateTime);
    procedure ChoiceOtvet;
    procedure CheckOtvet(nVisible:Integer; nEnabled:Integer; nReadOnly:Integer);
    procedure CheckLookupDocMain(nType:Integer);
    procedure ChoiceVxod;
    procedure OtvetNaClear;
    function getDeliveryType:Integer;
    procedure ReferredOpen(dsRef:TDataSet);


    procedure Check_slGrid;
    function CheckDokumentSimple(nType:Integer; lWriteDok:Boolean):Boolean; override;
    procedure AddCurList(Grid:TDbGridEh); override;

    procedure SaveFilesWithETSP(lBase64:Boolean);

    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

  function EditSMDODoc( var nID : Integer; slPar:TStringList) : Boolean;
  function CopySMDODoc( nID : Integer; lCopyFile:Boolean; sAdresat:String) : Integer;

const
  TS_DOCUMENT=0;
  TS_TASK=1;
  TS_ADDDOC=2;


implementation

uses dBase, uSMDO, fMain, fEditSign, fEditSpec, mDRecInt, fEditSpr, funcEh, SelLibFR, fShablon, uAvest,
     StrUtils;

{$R *.dfm}

function EditSMDODoc( var nID : Integer; slPar:TStringList) : Boolean;
var
  f: TfmSMDODoc;
  nAckID,n:Integer;
  lOk:Boolean;
  sl:TstringList;
begin
//  result := true;
  f:=TfmSMDODoc.Create(nil);
  f.AssignPar(slPar);
  f.btTestAck.Visible:=Role.SystemAdmin;
  f.btAdsSys.Visible:=Role.SystemAdmin;
  try
    f.IsReadDokument:=true;
    if nID=-1 then begin
      f.NewDok(true);
      f.SetCaptionForm;
      f.CheckEnabledNameOrgan(true);
    end else begin
      f.ReadDok( nID );
      f.TBItemZAGS.Visible:=false;
      f.CheckEnabledNameOrgan(false);
      f.SetCaptionForm;
    end;
    f.IsReadDokument:=false;
    {$IFDEF GISUN}
//      f.CheckAkt_GISUN(0);
//      f.BeforeEditFormGISUN;
    {$ELSE}

    {$ENDIF}

    f.CheckFilterTables;
    f.CheckControl;
    f.Check_slGrid;

    // если у входящего сообщения нет основного документа, то переключимся на доп. закладки
    if f.SubjIN and (f.DokumentIDNUMBER.AsString='') then begin
      if f.tsTask.TabVisible then
        f.pc.ActivePage:=f.tsTask
      else if f.tsAddDoc.TabVisible then
        f.pc.ActivePage:=f.tsAddDoc;
      f.pcChange(nil);
    end;

    Result:=f.EditModal;
    nID:=f.DokumentID.AsInteger;
    Application.ProcessMessages;
    // создать и отправить уведомление о регистрации
    if f.FCreateAckRegister then begin
      if MySametext( f.DokumentMY_REGNUMBER.AsString,NAME_NOT_REGISTER)
         or MySametext( f.DokumentMY_REGNUMBER.AsString,NAME_NOT_OTKAZ)
         or MySametext( f.DokumentMY_REGNUMBER.AsString,NAME_NOT_ETSP)
        then n:=DOC_NOT_REGISTER
        else n:=DOC_REGISTER;
      nAckID:=SMDO.CreateAckResult(n, nID, false, f.DokumentMSG_TYPE.AsInteger, f.DokumentADD_ACK.AsString);
      if (nAckID>0) and SMDO.FPostEnabled then begin
        sl:=TStringList.Create;
        sl.Add('SHOWERROR=0');
        sl.Add('TYPERUN=2');
        sl.Add('POST_ID='+inttostr(nAckID));
        sl.Add('SOOB=Отправка уведомления о регистрации ... ');
        lOk:=SMDO.SendMail(nil,sl);
        FreeAndNil(sl);
        if not lOk then SMDO.ShowError;
      end;
    end;
  finally
    f.Free;
    f:=nil;
  end;
end;
//------------------------------------------------------------------------
function CopySMDODoc(nID : Integer; lCopyFile:Boolean; sAdresat:String) : Integer;
var
  f: TfmSMDODoc;
  nAckID,n,nNewID:Integer;
  lOk:Boolean;
  sl:TstringList;
begin
  result:=0;
  f:=TfmSMDODoc.Create(nil);
  try
    f.IsReadDokument:=true;
    f.ReadDok( nID );
    f.IsReadDokument:=false;
    f.IsCheckDokument:=false;
    EditDataSet(f.Dokument);
    f.DokumentID.AsInteger:=dmBase.getNewID(_TypeObj_SMDOPost);
    nNewID:=f.DokumentID.AsInteger;
    f.DokumentMSG_ID.AsString:=GetGUID(false);
    f.DokumentSENT.AsInteger:=0;
    f.DokumentSUBJ_TYPE.AsInteger:=2;   // исходящий
//    f.DokumentMSG_ACKNOW.AsInteger:=2;  // требует уведомления
    f.DokumentACK_TYPE.AsInteger:=0;
    f.DokumentSUBJ_ERROR.AsBoolean:=false;
    f.DokumentSUBJ_SYSTEM.AsInteger:=0;
    if sAdresat<>'' then begin
      f.DokumentNAME.AsString:=sAdresat;
      f.WriteSMDOCODE(DELIVER_KEY);  // f.DokumentSMDOCODE.AsString:=DELIVER_KEY;
    end;
    f.FAddNewDok:=true;
    f.tbTask.EmptyTable;
    f.tbFiles.Filter:='';
    f.tbFiles.Filtered:=false;
    f.tbFiles.First;
    while not f.tbFiles.Eof do begin
      f.tbFiles.Edit;
      f.tbFilesPOST_ID.AsInteger:=nNewID;
      f.tbFilesPARENT_ID.AsInteger:=nNewID;
      if lCopyFile then begin
        // дописать потом
      end else begin   // для рассылки можно файлы не копировать
      end;
      f.tbFiles.Post;
      f.tbFiles.Next;
    end;
    f.tbFiles.First;
    f.tbMens.Filter:='';
    f.tbMens.Filtered:=false;
    f.tbMens.First;
    while not f.tbMens.Eof do begin
      f.tbMens.Edit;
      f.tbMensPOST_ID.AsInteger:=nNewID;
      f.tbMensPARENT_ID.AsInteger:=nNewID;
      f.tbMens.Post;
      f.tbMens.Next;
    end;
    f.tbMens.First;
    f.WriteDok;
    Result:=nNewID;
  finally
    f.Free;
    f:=nil;
  end;
end;
{
  sFileName:=NormDir(sFileName);
  sFile:=ExtractFileName(sFileName);
  sFileReal:=Trim(sFile);  // !!!   добавлено 21.08.2017

  //--- !!! ------------------------------------------------------------------------
  // $$$ заменить на dmBase.AddFileToSMDO(SMDO,sFileName,nPostID)
  sPath:=SMDO.GetPathAttach(1, nPostID);
  sPathReal:=SMDO.GetPathAttach(0, nPostID);
  if FileExists(sPathReal+sFileReal) then DeleteFile(sPathReal+sFileReal);
  if CopyFile(PChar(sFileName), PChar(sPathReal+sFileReal), true) then begin
    lCopy := true;
  end else begin
    PutError('Ошибка копирования файла : '+#13+'  '+
           sFileName+#13+' в '+
           sPathReal+sFile+#13+
           IntToStr(GetLastError)+' ('+SysErrorMessage(GetLastError)+') ');
  end;

}

{ TfmSMDODoc }

constructor TfmSMDODoc.Create(Owner: TComponent);
var
  icon:TIcon;
  d2xml:TDataSet2XML;
  n:Integer;
begin
  inherited;
//  btOtvetClear.Glyph:=ImBtClear.Picture.Bitmap;
//  edOtvet_Regnumber.EditButtons[1].Glyph:=ImBtClear.Picture.Bitmap;

  if not tbReferred.Active then tbReferred.Active:=true;

  d2xml:=ds2xml.DS_Add(tbReferred);
  d2xml.ExceptFields:='POST_ID;';

  TBItemAddList.Enabled:=false;
  TBItemDelList.Enabled:=false;

  slGrid:=TStringList.Create;
//  slGrid.AddObject('GRREFERREDADD', grReferredAdd);
//  slGrid.AddObject('GRREFERREDTASK', grReferredTask);
//  slGrid.AddObject('GRREFERREDR', grReferredR);

  FActiveMensR:=false;
  FAckDeliver:=0;
  FAckRegister:=0;

  if SMDO.VersionXML_OUT>=211 then begin
    CheckOtvet(-1,1,-1);
//    btOtvetNa.Enabled:=true;
  end else begin
    CheckOtvet(-1,0,-1);
//    btOtvetNa.Enabled:=false;
  end;

  pc.ActivePageIndex:=0;
  if not Dokument.Active  then Dokument.Active:=true;
  if not tbFiles.Active   then tbFiles.Active:=true;
  if not tbMens.Active    then tbMens.Active:=true;
  if not tbMensR.Active   then tbMensR.Active:=true;
  if not tbMensAll.Active then tbMensAll.Active:=true;
  if not tbTask.Active    then tbTask.Active:=true;
  if not tbFolder.Active    then tbFolder.Active:=true;
  FDeliver:=TStringList.Create;   // рассылка

  FQuestAsNew:=false;
  FPageControl:=pc;

//  fmMain.ImageList.GetBitmap(IL_ORG,Image1.Picture.Bitmap);
//  edName.EditButtons[2].Glyph.Assign(imOrg.Picture.Bitmap);
//  imOrg.Picture.GetBitmap(IL_ORG, imOrg.Picture.Bitmap);// edName.EditButtons[2].Glyph);
//  fmMain.ImageList.GetBitmap(IL_ORG, imOrg.Picture.Bitmap);// edName.EditButtons[2].Glyph);
  fmMain.ImageList.GetBitmap(IL_ADD_MEN,btAddFile.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_MEN,btDelFile.Glyph);

//  ImageList1.GetBitmap(13,SpeedButton1.Glyph);
//  ImageList1.GetBitmap(13,btEditFile.Glyph);


  fmMain.ImageList.GetBitmap(IL_EDIT,btEditMen.Glyph);
  fmMain.ImageList.GetBitmap(IL_ADD_MEN,btAddMen.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_MEN,btDelMen.Glyph);

//  icon:=TIcon.create;
//  Icon.Handle:=GetIcomFromExtFile('DOC');

// _TypeObj_SMDOPost=35;
// _TypeObj_SMDOPostUvd=36;
// _TypeObj_SMDOPostDoc=37;
  TypeObj := _TypeObj_SMDOPostDoc;
  FCheckLookupField:=false;
  FDokZAGS := false;
  FDokRegister := false;
  FAutoNum:=false;
  FMainTable := dmBase.SMDOPost;
//  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAdd.Glyph);

  SetLength(FArrChoiceRekv,1);
  n:=0;
  FArrChoiceRekv[n].nType:=SHABLON_OTKAZ_REG;
  FArrChoiceRekv[n].FieldName:='ADD_ACK';

{  FArrChoiceRekv[1].nType:=SHABLON_NAME_ZAGS;
  FArrChoiceRekv[1].FieldName:='SVID_ZAGS';  }

  {edFamilia.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateData;
  edOtch.OnUpdateData:=FIOUpdateData;
  edSM_GOROD.OnUpdateData:=CityUpdate; }

  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbTask,'Task','Задания');
    CreatefrxDBdataSet(self,tbFolder,'AddDoc','Материалы');
    CreatefrxDBdataSet(self,tbFiles,'Files','Файлы');
    CreatefrxDBdataSet(self,tbMens,'Mens','Люди');
    CreatefrxDBdataSet(self,tbMensAll,'MensAll','ЛюдиВсе');
  {$ENDIF}

end;
//----------------------------------------------
destructor TfmSMDODoc.Destroy;
begin
  FDeliver.Free;   // рассылка
  //
  inherited;
end;
//----------------------------------------------
function TfmSMDODoc.GetVid: String;
begin
  Result := GetVidFromTypeObj(_TypeObj_SMDOPostDoc); //
end;
//----------------------------------------------
function TfmSMDODoc.CreateSubMenuRun: Boolean;
var
 sep : TTbSeparatorItem;
 it  : TTbItem;
begin
  inherited CreateSubmenuRun;
  Result:=true;
  TBItemRegister:=nil;
  if DokumentSUBJ_SYSTEM.AsInteger=0 then begin
    if SMDO.FManual then begin
      TBItemRegister := TTbItem.Create(TBSubmenuRun);
      TBItemRegister.Caption:='Регистрация';
      TBItemRegister.ImageIndex:=IL_REG_DOC;
      TBItemRegister.OnClick:=Event_Register;
      TBSubmenuRun.Add(TBItemRegister);
    end;
  end;

  TBItemNotRegistr := TTbItem.Create(TBSubmenuRun);
  TBItemNotRegistr.Caption:='Отказ в регистрации';
//  TBItemNotRegistr.ImageIndex:=IL_OTKAZ;
  TBItemNotRegistr.OnClick:=TBItemNotRegistrClick;
  TBSubmenuRun.Add(TBItemNotRegistr);

  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);

  TbItemNotReady:=TTbItem.Create(TBSubmenuRun);
  TbItemNotReady.Caption:='Не готово к отправке';
  TbItemNotReady.AutoCheck:=true;
//  it.OnClick:=Event_NotReady;
  TBSubmenuRun.Add(TbItemNotReady);

  TBSeparatoAdd:=TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(TBSeparatoAdd);

  TBItemAddNew := TTbItem.Create(TBSubmenuRun);
  TBItemAddNew.Caption:='Добавить';
  TBItemAddNew.OnClick:=TBItemAddNewClick;
  TBSubmenuRun.Add(TBItemAddNew);

  TBItemAddDel := TTbItem.Create(TBSubmenuRun);
  TBItemAddDel.Caption:='Удалить';
  TBItemAddDel.OnClick:=TBItemAddDelClick;
  TBSubmenuRun.Add(TBItemAddDel);

  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);

  TBItemChoiceIn := TTbItem.Create(TBSubmenuRun);
  TBItemChoiceIn.Caption:='Выбрать файлы из входящего сообщения';
  TBItemChoiceIn.OnClick:=TBItemChoiceInClick;
  TBSubmenuRun.Add(TBItemChoiceIn);

  TBItemChoiceOut := TTbItem.Create(TBSubmenuRun);
  TBItemChoiceOut.Caption:='Выбрать файлы из исходящего сообщения';
  TBItemChoiceOut.OnClick:=TBItemChoiceOutClick;
  TBSubmenuRun.Add(TBItemChoiceOut);

end;
//-----------------------------------------------
procedure TfmSMDODoc.Event_Register(Sender: TObject);
var
  f:TfmParamQuest;
  n:INteger;
  s:String;
  d:TDateTime;
  lOk:Boolean;
begin
  if SubjError(false) then begin
    lOk:=OkWarning('Вы хотите зарегистрировать ОШИБОЧНЫЙ документ +ДА',self,false,true)
  end else begin
    lOk:=true;
  end;
  if lOk then begin
    f:=TfmParamQuest.Create(self);
    f.Caption:='Регистрация';
    f.AddParamEx('', '№', 'REG_IND' ,'TYPE=STRING~WIDTH=200');
    f.AddParamEx(Date, 'Дата' , 'REG_DATE' ,'TYPE=DATE~WIDTH=150');
    f.AddButtons('Записать~Отказ',0);
    n:=f.ShowQuest;
    if n=1 then begin
      d:=f.GetValue('REG_DATE', 'D');
      s:=f.GetValue('REG_IND', 'C');
      if (Trim(s)<>'') and (d>0) then begin
        EditDataSet(Dokument);
        DokumentMY_REGNUMBER.AsString:=s;
        DokumentMY_REGDATE.AsDateTime:=d;
      end;
    end;
    f.Free;
  end;
end;
//-----------------------------------------------
function TfmSMDODoc.SubjError(lShow:Boolean):Boolean;
begin
  Result:=DokumentSUBJ_ERROR.AsBoolean;
  if lShow and Result then PutError('Документ ошибочный');
end;
//-----------------------------------------------
procedure TfmSMDODoc.TBItemNotRegistrClick(Sender: TObject);
begin
  Event_NotRegister(Sender);
end;
//-----------------------------------------------
procedure TfmSMDODoc.Event_NotRegister(Sender: TObject);
var
  f:TfmParamQuest;
  n,m,i:Integer;
  dOt:TDateTime;
begin
  if SubjIN then begin
    f:=TfmParamQuest.Create(self);
    f.Caption:='Отказ в регистрации';
    m:=0;
    if DokumentMY_REGNUMBER.AsString=NAME_NOT_REGISTER then begin
      m:=1;
    end else if DokumentMY_REGNUMBER.AsString=NAME_NOT_OTKAZ then begin
      m:=2;
    end else if DokumentMY_REGNUMBER.AsString=NAME_NOT_ETSP then begin
      m:=3;
    end;
    f.AddParamEx(m, 'Тип отказа' , 'OTKAZ' ,'TYPE=LIST~DESC=KEY_OTKAZ_REGISTR~WIDTH=300');
    f.AddParamEx(Date, 'Дата' , 'DATEOT' ,'TYPE=DATE');
    f.AddButtons('Записать~Отказ',0);
    n:=f.ShowQuest;
    if n=1 then begin
      m:=f.GetValue('OTKAZ', 'N');
      dOt:=f.GetValue('DATEOT', 'D');
      if dOt=0
        then dOt:=Date;
      EditDataSet(Dokument);
//!!!      DokumentMY_REGDATE.AsString:='';   21.03.2018  обязательный атрибут
      DokumentMY_REGDATE.AsDateTime:=dOt;
      if m=0 then begin
        DokumentMY_REGNUMBER.AsString:='';
      end else if m=1 then begin
        DokumentMY_REGNUMBER.AsString:=NAME_NOT_REGISTER;
      end else if m=2 then begin
        DokumentMY_REGNUMBER.AsString:=NAME_NOT_OTKAZ;
      end else if m=3 then begin
        DokumentMY_REGNUMBER.AsString:=NAME_NOT_ETSP;
      end;
    end;
    f.Free;
  end;
end;
{
var
  lOk:Boolean;
  function CheckOk:Boolean;
  begin result:=OkWarning('Документ не подлежит регистрации ?'#13#13'Если Вы уверены введите слово ДА в поле ввода'); end;
begin
  if SubjIN then begin
    if not SubjError(true) then begin
      if CheckOk then begin
        EditDataSet(Dokument);
        DokumentMY_REGNUMBER.AsString:=NAME_NOT_REGISTER;
        DokumentMY_REGDATE.AsString:='';
      end;
    end;
  end;
end;
}

//-----------------------------------------------------------------
function TfmSMDODoc.SubjIN: Boolean;   // входящее сообщение
begin
  Result:=DokumentSUBJ_TYPE.AsInteger=1;
end;
//-----------------------------------------------------------------
function TfmSMDODoc.SubjOUT: Boolean;   // исходящее сообщение
begin
  Result:=DokumentSUBJ_TYPE.AsInteger=2;
end;
//-----------------------------------------------------------------
function TfmSMDODoc.NewDok(lAppend: Boolean): Boolean;
begin
  FAckDeliver:=0;
  FAckRegister:=0;
  FCreateAckRegister:=false;
  FCreateAckDeliver:=false;

  Dokument.EmptyTable;
  Dokument.Append;
  FAddNewDok:=true;
  FDeliver.Clear;
  DokumentPAR_DELIVERY_TYPE.AsInteger:=9;

  if lAppend then begin
    DokumentID.AsInteger:=dmBase.GetNewID(_TypeObj_SMDOPost);
    DokumentMSG_ID.AsString:=GetGUID(false);
    DokumentSENT.AsInteger:=0;
    DokumentSUBJ_TYPE.AsInteger:=2;   // исходящий
    DokumentMSG_ACKNOW.AsInteger:=2;  // требует уведомления
    DokumentMSG_TYPE.AsInteger:=MSG_TYPE_D;
    DokumentDOC_TYPE.AsInteger:=0;
    DokumentACK_TYPE.AsInteger:=0;
    DokumentSUBJ_ERROR.AsBoolean:=false;
    DokumentSUBJ_SYSTEM.AsInteger:=0;
    DokumentDOC_ID.AsInteger:=0;
    DokumentFLAG.AsInteger:=0;
    DokumentCONFIDENT.AsString:='Общий';
    DokumentISWRITE_REF.AsBoolean:=false;
  end;

  tbTask.EmptyTable;
  tbFolder.EmptyTable;
  tbMens.EmptyTable;
  tbFiles.EmptyTable;

  inherited NewDok(lAppend);

  QueryExit:=false;
  Result := true;
  getKomu;
end;
//-----------------------------------------------------------------
procedure TfmSMDODoc.Check_slGrid;
begin
  slGrid.Clear;
  if tbReferred.RecordCount=0 then begin
    slGrid.AddObject('GRREFERREDR', grReferredR);
    slGrid.AddObject('GRREFERREDADD', grReferredAdd);
    slGrid.AddObject('GRREFERREDTASK', grReferredTask);
  end else begin
    if tbReferredR.RecordCount>0 then begin
      slGrid.AddObject('GRREFERREDR', grReferredR);
    end else begin
      slGrid.AddObject('GRREFERREDADD', grReferredAdd);
      slGrid.AddObject('GRREFERREDTASK', grReferredTask);
    end;
  end;
end;
//-----------------------------------------------------------------
procedure TfmSMDODoc.CheckControl;
var
  nType,n,m:Integer;
  l,lTask,lAddDoc:Boolean;
  CC : array [1..16] of TComponent;
  s:String;                            
begin
  l:=not DocReadOnly;
              
  btAddFile.Enabled:=l;
  btDelFile.Enabled:=l;
  btETSPFileAll.Enabled:=l;
  pmFiles_Add.Enabled:=l;
  pmFiles_Del.Enabled:=l;
  pmFilesAll_ETSP.Enabled:=l;
  pmFilesWithETSP_Load.Enabled:=l;

  btAddMen.Enabled:=l;
  btDelMen.Enabled:=l;
  pmMens_Add.Enabled:=l;
  pmMens_Del.Enabled:=l;

  TBItemAddList.Visible:=l;
  TBItemDelList.Visible:=l;
//  TBItemAddList.Visible:=not l;
//  TBItemDelList.Visible:=not l;

  edName.EditButtons[0].Visible:=l;
  edName.EditButtons[1].Visible:=l;
  edName.EditButtons[2].Visible:=l;
  TBItemAdresat.Enabled:=l;
  TBItemRegIsx.Enabled:=l;
  btKomu.Visible:=l;

  if not FAddNewDok and (DokumentMSG_TYPE.AsInteger>0) and (DokumentMY_REGNUMBER.AsString<>'') then begin
    edMsgType.ReadOnly:=true;
    edMsgType.Color:=clInfoBk;
  end;

  if SMDO.MsgIsAddDoc(DokumentMSG_TYPE.AsInteger) or not l then begin
    CheckOtvet(-1,0,-1);
//    btOtvetNa.Enabled:=false;
  end else begin
    if SMDO.VersionXML_OUT>=211
      then CheckOtvet(-1,1,-1)
      else CheckOtvet(-1,0,-1); // btOtvetNa.Enabled:=false;
  end;
  if edOtvet_DeliveryType.Enabled then begin
    nType:=getDeliveryType;
    if nType=DELIVERY_TYPE_EMPTY then begin
      CheckOtvet(-1,-1,1);
    end else begin
      if nType=DELIVERY_TYPE_NOTSMDO  // не по почте СМДО
        then CheckOtvet(-1, -1, 0)     // ручной ввод номера и даты
        else CheckOtvet(-1, -1, 1);    // переключаем в ReadOnly
    end;
  end;
//  ShowMessage(varTostr(GetPropValue(edName, 'readOnly', false))+#13+
//  varTostr(GetPropValue(edName, 'readOnly', true)  ));
  Cc[1]:=edName; CC[2]:=edMsgType; CC[3]:=edMsgAcknow; CC[4]:=edSUBJECT; CC[5]:=nil; CC[6]:=nil;
  Cc[7]:=nil; CC[8]:=nil; CC[9]:=edTitle; CC[10]:=edFlag; CC[11]:=edKind; CC[12]:=edKomm;
  Cc[13]:=edDocType; CC[14]:=edNumCopy; CC[15]:=edCONFIDENT; CC[16]:=edPages; // ...

  for n:=Low(CC) to High(CC) do if CC[n]<>nil then SetPropValue( CC[n], 'ReadOnly', not l);

  edMyRegNumber.ReadOnly:=true;
  edMyRegDate.ReadOnly:=true;
  edAdrRegNumber.ReadOnly:=true;
  edAdrRegDate.ReadOnly:=true;
  edName.ReadOnly:=true;
  if not DocReadOnly
    then btKomu.Visible:=DokumentSMDOCODE.AsString<>DELIVER_KEY;

  lTask:=not tbTask.Eof;
  lAddDoc:=not tbFolder.Eof;

  if SubjIN or (SubjOUT and not SMDO.FAddTask) then  begin
    tsTask.TabVisible:=lTask;
    tsAddDoc.TabVisible:=lAddDoc;
  end else begin
    tsTask.TabVisible:=true;
    tsAddDoc.TabVisible:=true;
  end;
  tsPrim.TabVisible:=SubjIN and (DokumentADD_TEXT.AsString<>'');
  if SubjIN then begin
    lbAddAck.Hint:=edAddAck.Hint;
    lbAddAck.Visible:=true;
    edAddAck.Visible:=true;
    gbMyReg.Height:=edAddAck.Top+edAddAck.Height+10;
    gbAdrReg.Height:=gbMyReg.Height;
  end else begin
    lbAddAck.Visible:=false;
    edAddAck.Visible:=false;
    gbMyReg.Height:=edAdrRegDate.Top+edAdrRegDate.Height+10;
    gbAdrReg.Height:=gbMyReg.Height;
  end;

  if (SubjOUT and (DokumentSENT.AsInteger=1))  or                // исходящий уже отправлен
     (SubjIN  and (DokumentACK_TYPE.AsInteger=ACK_REGISTER)) or  // входящий и уведомление о регистрации отправлено
     (DokumentSUBJ_SYSTEM.AsInteger>0)                           // системное сообщение
  then begin
    if TBItemRegister<>nil
      then TBItemRegister.Enabled:=false;
    TBItemNotRegistr.Enabled:=false;
    TBItemChoiceIn.Enabled:=false;
    TBItemChoiceOut.Enabled:=false;
    TbItemNotReady.Enabled:=false;
  end else begin
    if TBItemRegister<>nil
      then TBItemRegister.Enabled:=true;
    TBItemNotRegistr.Enabled:=SubjIN;
    TBItemChoiceIn.Enabled:=true;
    TBItemChoiceOut.Enabled:=true;
    TbItemNotReady.Enabled:=true;
  end;

  l:=SubjIN or (SubjOUT and not SMDO.FAddTask);
  TBItemAddNew.Visible:=not l;
  TBItemAddDel.Visible:=not l;
  TBSeparatoAdd.Visible:=not l;
  TBItemAddNew.Enabled:=false;
  TBItemAddDel.Enabled:=false;

  lbAdresat.Caption:='Адресат';
  lbKomu1.Caption:='Кому';
  if SubjIN then begin   // входящий
    TBItemNotRegistr.Visible:=true;   // отказ в регистрации
    TBItemRegIsx.Visible:=false;      // выбрать исходящий документ
    TBItemChoiceIn.Visible:=false;
    TBItemChoiceOut.Visible:=false;
    TbItemNotReady.Visible:=false;
  end else begin
    TBItemNotRegistr.Visible:=false;  // отказ в регистрации
    TBItemRegIsx.Visible:=true;       // выбрать исходящий документ
    TBItemChoiceIn.Visible:=true;
    TBItemChoiceOut.Visible:=true;
    TbItemNotReady.Visible:=true;
  end;

//    TBItemNotRegistr.Visible:=true;
  if SubjOUT then begin
    edKindS.Visible:=false;
    edKind.Visible:=true;
  end else begin
    edKind.Visible:=false;
    edKindS.Left:=edKind.Left;
    edKindS.Width:=edKind.Width;
    edKindS.Visible:=true;

    {
    edKindS.MRUList.Active:=true;
    dmBase.SMDOSprVidDok.First;
    while dmBase.SMDOSprVidDok.Eof do begin
      edKindS.MRUList.Items.Add(dmBase.SMDOSprVidDok.FieldByNAme('NAME').AsString);
      dmBase.SMDOSprVidDok.Next;
    end;
    dmBase.SMDOSprVidDok.First;
    }                                                         
  end;

end;
//-----------------------------------------------------------------
function TfmSMDODoc.DocReadOnly:Boolean;
begin
  Result:=(SubjIN or (DokumentSENT.AsInteger=1) or (DokumentSUBJ_SYSTEM.AsInteger>0) );
end;
//-----------------------------------------------------------------
procedure TfmSMDODoc.WriteSMDOCODE(sValue:String);
begin
  DokumentSMDOCODE.AsString:=sValue;
  if SMDO.OrgIsDemand(sValue)
    then DokumentPAR_DELIVERY_TYPE.AsInteger:=DELIVERY_TYPE_SMDO;
  if tbReferred.Active then begin
    if tbReferred.RecordCount>0 then begin
      tbReferred.EmptyTable;  // при изменении организации чистим добавленные ссылки
      ShowMessageCont('Ссылки на ранее отправленные документы удалены !',self);
    end;
  end;
  edOtvet_DeliveryTypeChange(nil);
  CheckControlOneWin(sValue);
end;
//-----------------------------------------------------------------
procedure TfmSMDODoc.CheckControlOneWin(sValue:String);
begin
  edOtvet_DeliveryType.ReadOnly:=SMDO.OrgIsDemand(sValue);
  if edOtvet_DeliveryType.ReadOnly
    then edOtvet_DeliveryType.Color:=clInfoBk
    else edOtvet_DeliveryType.Color:=clWindow;
end;
//-----------------------------------------------------------------
procedure TfmSMDODoc.DokumentSMDOCODEChange(Sender: TField);
begin
//  label12.Caption:=DokumentSMDOCODE.AsString;
//  ShowMessage(DokumentSMDOCODE.AsString);
end;
//-----------------------------------------------------------------
function TfmSMDODoc.ReadDok(nID: Integer): Boolean;
var
  i,nTask : Integer;
  fld : TField;
  strField,s : String;
  sl:TStringList;
  ds:TDataSet;
begin
  Result := true;
  if not FMainTable.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  FRead:=true;

  try

  NewDok(false);
  FAddNewDok:=false;
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to FMainTable.FieldCount-1 do begin
    strField := FMainTable.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      WriteField(fld, FMainTable.Fields[i]);
    end;
  end;
  if FMainTable.FieldByName('DOC_STATUS').AsInteger=DOC_NOT_READ then begin  // сбросим флаг "еще не прочитан"
    try
      FMainTable.Edit;
      FMainTable.FieldByName('DOC_STATUS').AsInteger:=0;
      FMainTable.Post;
      FRefreshGurnal:=true;
      DokumentDOC_STATUS.AsInteger:=0;
    except
    end;
  end;

  SetAddFields(FMainTable.FieldByName('ACK_ADD_TEXT').AsString);

  if DokumentSUBJ_SYSTEM.IsNull       then DokumentSUBJ_SYSTEM.AsInteger:=0;
  if DokumentPAR_DELIVERY_TYPE.IsNull then DokumentPAR_DELIVERY_TYPE.AsInteger:=9;
  if DokumentISWRITE_REF.IsNull       then DokumentISWRITE_REF.AsBoolean:=false;

  FDeliver.Clear;
  if (DokumentSMDOCODE.AsString=DELIVER_KEY) then begin
//    dmBase.tbSimplePropMemo.IndexName:='PR_KEY';   // TYPEOBJ;ID;DATES;POKAZ
//    if dmBase.tbSimplePropMemo.FindKey([_TypeObj_SMDOPost,DokumentID.AsInteger,EmptyDate,DELIVER_KEY]) then begin
//      s:=dmBase.tbSimplePropMemo.FieldByName('VALUE').AsString;
    StrToStrings(DokumentNAME.AsString,FDeliver,',',true);
  end;

  with dmBase.SMDOTask do begin
    IndexName:='PR_KEY';
    SetRange([nID],[nID]);
    First;
    while not Eof do begin
      if FieldByName('NOMER').AsInteger<1000
        then ds:=tbTask
        else ds:=tbFolder;
      ds.Append;
      ds.FieldByName('POST_ID').AsInteger:=FieldByName('POST_ID').AsInteger;
      ds.FieldByName('TASK_ID').AsInteger:=FieldByName('TASK_ID').AsInteger;
      ds.FieldByName('TASK_ID_SOURCE').AsInteger:=FieldByName('TASK_ID_SOURCE').AsInteger;
      ds.FieldByName('NOMER').AsInteger:=FieldByName('NOMER').AsInteger;
      ds.FieldByName('ADD_TYPE').AsInteger:=FieldByName('ADD_TYPE').AsInteger;
      ds.FieldByName('IDNUMBER').AsString:=FieldByName('IDNUMBER').AsString;
      ds.FieldByName('KIND').AsString:=FieldByName('KIND').AsString;
      ds.FieldByName('TEXT').AsString:=FieldByName('TEXT').AsString;
      WriteDateField( ds.FieldByName('TASKDATE'), FieldByName('TASKDATE'));
      ds.FieldByName('TASKNUMBER').AsString:=FieldByName('TASKNUMBER').AsString;
      ds.FieldByName('TASK_COPY').AsString:=FieldByName('TASK_COPY').AsString;
      ds.FieldByName('CONFIDENT').AsString:=FieldByName('CONFIDENT').AsString;
      ds.FieldByName('CONTENTS').AsString:=FieldByName('CONTENTS').AsString;
      ds.FieldByName('NUMCOPY').AsString:=FieldByName('NUMCOPY').AsString;
      ds.FieldByName('FLAG').AsString:=FieldByName('FLAG').AsString;
      ds.FieldByName('PAGES').AsString:=FieldByName('PAGES').AsString;
      WriteDateField( ds.FieldByName('DEADLINE'), FieldByName('DEADLINE'));
      ds.FieldByName('TASK_REG').AsString:=FieldByName('TASK_REG').AsString;
      ds.Post;
      Next;
    end;
    CancelRange;
  end;

  with dmBase.SMDOFile do begin
    IndexName:='POST_KEY';
    SetRange([nID],[nID]);
    First;
    while not Eof do begin
      tbFiles.Append;
      tbFilesPOST_ID.AsInteger:=FieldByName('POST_ID').AsInteger;;
      tbFilesPARENT_ID.AsInteger:=FieldByName('PARENT_ID').AsInteger;;
      tbFilesFILE_ID.AsInteger:=FieldByName('FILE_ID').AsInteger;
      tbFilesSTORE_KIND.AsInteger:=FieldByName('STORE_KIND').AsInteger;
      tbFilesNAME.AsString:=FieldByName('NAME').AsString;
      tbFilesFILE_TYPE.AsString:=Trim(Copy(ANSIUpperCase(ExtractFileExt(tbFilesNAME.AsString)),2,100));
      tbFilesPATH.AsString:=FieldByName('PATH').AsString;
      tbFilesVALUE.AsString:=FieldByName('VALUE').AsString;
      tbFilesKOMM.AsString:=FieldByName('KOMM').AsString;
      tbFilesSIGNATURE.AsString:=FieldByName('SIGNATURE').AsString;
      tbFilesSIGNINFO.AsString:=FieldByName('SIGNINFO').AsString;
      tbFilesMD5.AsString:=FieldByName('MD5').AsString;
      WriteDateField( tbFilesDATEM, FieldByName('DATEM'));
      WriteDateField( tbFilesDATEC, FieldByName('DATEC'));
      tbFiles.Post;
      Next;
    end;
    CancelRange;
  end;

  with dmBase.SMDOMens do begin
    IndexName:='POST_KEY';
    SetRange([nID],[nID]);
    First;
    while not Eof do begin
      tbMens.Append;
      tbMensPOST_ID.AsInteger:=FieldByName('POST_ID').AsInteger;;
      tbMensPARENT_ID.AsInteger:=FieldByName('PARENT_ID').AsInteger;;
      tbMensNOMER.AsInteger:=FieldByName('NOMER').AsInteger;
      tbMensTIP.AsInteger:=FieldByName('TIP').AsInteger;
      tbMensORG.AsString:=FieldByName('ORG').AsString;
      tbMensFIO.AsString:=FieldByName('FIO').AsString;
      tbMensOFFICIAL.AsString:=FieldByName('OFFICIAL').AsString;
      tbMensRANK.AsString:=FieldByName('RANK').AsString;
      tbMensADRES.AsString:=FieldByName('ADRES').AsString;
      tbMensTEL_WORK.AsString:=FieldByName('TEL_WORK').AsString;
      tbMensTEL_MOB.AsString:=FieldByName('TEL_MOB').AsString;
      tbMensEMAIL.AsString:=FieldByName('EMAIL').AsString;
      tbMensATTESTATION.AsString:=FieldByName('ATTESTATION').AsString;
      WriteDateField( tbMensSROK, FieldByName('SROK'));
      WriteDateField( tbMensSIGNDATE, FieldByName('SIGNDATE'));
      tbMens.Post;
      Next;
    end;
    CancelRange;
  end;

  tbReferred.EmptyTable;
  SMDO.ReadAddDataSet(nID, ds2xml);
  // может нужно будет раскидать доп. материалы по другим сообщениям
  if tbReferred.RecordCount>0 then begin
    tbReferred.First;
    while not tbReferred.Eof do begin
      if (tbReferredIDNUMBER.AsString<>DokumentIDNUMBER.AsString) and (tbReferredIDNUMBER.AsString<>'') then begin
        QueryExit:=true;
      end;
      tbReferred.Next;
    end;
    tbReferred.First;
  end;
//  SetIDZags;

//  tbAddMen.EmptyTable;
//  tbAddMen.ResetAutoInc;

//  if DokumentDUBL_SPR.IsNull then DokumentDUBL_SPR.AsBoolean:=false;
//  if DokumentRESH_SUDA.IsNull then DokumentRESH_SUDA.AsBoolean:=false;

  {$IFDEF GISUN}
//    ReadMessageID;
  {$ENDIF}

  AdditiveReadDok;

  Dokument.Post;
  getKomu;
  CheckControlOneWin(DokumentSMDOCODE.AsString);

  QueryExit:=false;

  finally
    FRead:=false;
  end;
end;
//-----------------------------------------------------------------------------------
procedure TfmSMDODoc.SetAddFields(s:String);                
begin
//  '<ADD_TEXT>'  - ADD_TEXT    <ADD_ACK> - ADD_ACK_TEXT
  if s<>'' then begin
//    EditDataSet(Dokument);
    if (Pos('<ADD_TEXT>',s)=0) and (Pos('<ADD_ACK>',s)=0) then begin    // для старых записсей
      DokumentADD_TEXT.AsString:=s;
      DokumentADD_ACK.AsString:='';
    end else begin
      DokumentADD_TEXT.AsString:=NodeFromStr('ADD_TEXT', s);
      DokumentADD_ACK.AsString:=NodeFromStr('ADD_ACK', s);
    end;
  end;
end;
//-----------------------------------------------------------------------------------
function TfmSMDODoc.GetAddFields:String;
begin
  Result:='';
  if DokumentADD_TEXT.AsString<>'' then begin
    Result:=Result+'<ADD_TEXT>'+DokumentADD_TEXT.AsString+'</ADD_TEXT>'+#13#10;
  end;
  if DokumentADD_ACK.AsString<>'' then begin
    Result:=Result+'<ADD_ACK>'+DokumentADD_ACK.AsString+'</ADD_ACK>'+#13#10;
  end;
end;

//-----------------------------------------------------------------------------------
// записать материалы с ссылками на другие документы
function TfmSMDODoc.WriteReferredToOsnDoc: Boolean;
var
  s,sIdNumber,sRegNumber, sBMPost, sBMTask:String;
  dDate:TDateTime;
  nID,nType,nAdd:Integer;
  tbList:TDataSet;
  lErr:Boolean;
begin
  Result:=false;
  // [KEY_FOLDER_UPDATE]  1=по запросу   2=автоматически  3=никогда
  nType:=2; //GlobalTask.ParamAsInteger('FOLDER_UPDATE');
  // документ входящий и есть ссылки на другие документы
  if (DokumentISWRITE_REF.AsBoolean=false) and (DokumentSMDOCODE.AsString<>'') and SubjIN and (tbReferred.RecordCount>0) and (nType<>3) then begin
    lErr:=false;
    tbList:=dbCreateMemTable('PARENT_ID,Integer;IDNUMBER,Char,36;REGNUMBER,Char,30;REGDATE,Date,0;RETYPE,Integer;BOOKM,Char,50','');
    tbList.Name:='tbList';
    tbList.Open;
    sBMPost:=dmBase.SMDOPost.BookMark;  // !!!
    sBMTask:=dmBase.SMDOTask.BookMark;  // !!!

    nAdd:=0;
    tbTask.DisableControls;
    tbFolder.DisableControls;
    tbFolder.First;
    tbReferredR.First;
    sIdNumber:=DokumentIDNUMBER.AsString;
    try
      while not tbFolder.Eof do begin
//        if tbFolderADD_TYPE.AsInteger=ADD_TYPE_REF then begin
           if tbReferredAdd.Locate('PARENT_ID', tbFolderTASK_ID.AsInteger,[]) then begin
             if (sIdNumber='') or    // нет основного документа
                ((sIdNumber<>tbReferredAdd.FieldByName('IDNUMBER').AsString) and  // или это ссылка не на основной документ
                 (DokumentADR_REGNUMBER.AsString<>tbReferredAdd.FieldByName('REGNUMBER').AsString)) then begin
               tbList.Append;
               tbList.FieldByName('PARENT_ID').AsInteger:=tbReferredAdd.FieldByName('PARENT_ID').AsInteger;
               tbList.FieldByName('IDNUMBER').AsString:=tbReferredAdd.FieldByName('IDNUMBER').AsString;
               tbList.FieldByName('REGDATE').AsDateTime:=tbReferredAdd.FieldByName('REGDATE').AsDateTime;
               tbList.FieldByName('REGNUMBER').AsString:=tbReferredAdd.FieldByName('REGNUMBER').AsString;
//               tbList.FieldByName('BOOKM').AsString:=tbReferredAdd.Bookmark;
               tbList.Post;
             end;
           end else if tbReferredR.FieldByName('IDNUMBER').AsString<>'' then begin
             tbList.Append;
             tbList.FieldByName('PARENT_ID').AsInteger:=tbFolderTASK_ID.AsInteger;
             tbList.FieldByName('IDNUMBER').AsString:=tbReferredR.FieldByName('IDNUMBER').AsString;
             tbList.FieldByName('REGDATE').AsDateTime:=tbReferredR.FieldByName('REGDATE').AsDateTime;
             tbList.FieldByName('REGNUMBER').AsString:=tbReferredR.FieldByName('REGNUMBER').AsString;
             tbList.Post;
           end;
//        end;
        tbFolder.Next;
      end;
      tbList.First;

      if (tbList.RecordCount>0) and ((nType=2) or Problem('Добавить дополнительные материалы к основному документу ?',mtConfirmation,self)) then begin
        while not tbList.Eof do begin
  //        s:=s+'PARENT_ID='+tbList.FieldByName('PARENT_ID').AsString+', IDNUMBER='+tbList.FieldByName('IDNUMBER').AsString+
  //             ',REGDATE='+tbList.FieldByName('REGDATE').AsString+', REGNUMBER='+tbList.FieldByName('REGNUMBER').AsString;
          if dmBase.SMDOPost.Locate('SMDOCODE;IDNUMBER', VarArrayOf([DokumentSMDOCODE.AsString,tbList.FieldByName('IDNUMBER').AsString]), []) then begin
            nID:=dmBase.SMDOPost.FieldByName('ID').AsInteger;   // ID сообщения в которое нужно записать
            if (dmBase.SMDOPost.FieldByName('ADR_REGNUMBER').AsString=tbList.FieldByName('REGNUMBER').AsString) and
               (dmBase.SMDOPost.FieldByName('ADR_REGDATE').AsString=tbList.FieldByName('REGDATE').AsString) then begin
              if tbFolder.Locate('TASK_ID', tbList.FieldByName('PARENT_ID').AsInteger, []) then begin  // найдем нашу записываемую папку
                if not dmBase.SMDOTask.Locate('POST_ID;TASK_ID_SOURCE', VarArrayOf([nID,tbFolderTASK_ID.AsInteger]), []) then begin
                  if WriteOneReferredToOsnDoc(nID, tbList) then begin
                    EditDataSet(Dokument);
                    DokumentISWRITE_REF.AsBoolean:=true;
                    PostDataSet(Dokument);
                    Result:=true;
                    try
                      EditDataSet(dmBase.SMDOPost);
                      dmBase.SMDOPost.FieldByName('COUNT_FOLDER').AsInteger:=dmBase.SMDOPost.FieldByName('COUNT_FOLDER').AsInteger+1;
                      dmBase.SMDOPost.FieldByName('DOC_STATUS').AsInteger:=DOC_NOT_READ;
                      PostDataSet(dmBase.SMDOPost);
                      nAdd:=nAdd+1;
                    except
                    end;
                  end;
                end;
              end;
            end else begin
              // !!!  дата и номер регистрации не совпадают
              PutError('Не найдено сообщение для записи №'+tbList.FieldByName('REGNUMBER').AsString+' от '+tbList.FieldByName('REGDATE').AsString);
              lErr:=true;
            end;
          end else begin
            // !!!  не найден IDNUMBER
            PutError('Не найдено сообщение для записи с идентификатором '+tbList.FieldByName('IDNUMBER').AsString);
            lErr:=true;
          end;
  //        s:=s+'   >'+dmBase.SMDOPost.FieldByName('ADR_REGNUMBER').AsString+'<';
  //        s:=s+chr(13)+chr(10);
          tbList.Next;
        end;
  //      ShowMessage(s);
      end;
      if lErr then Result:=false;
      if nAdd>0 then begin
        ShowMessageCont('В соотв. документы добавлены дополнительные материалы: '+IntToStr(nAdd),self);
      end;
    finally
      dmBase.SMDOPost.BookMark:=sBMPost;
      dmBase.SMDOTask.BookMark:=sBMTask;
      dbClose(tbList);
      tbFolder.First;
      tbTask.First;
      tbTask.EnableControls;
      tbFolder.EnableControls;
    end;
  end;
end;
//-----------------------------------------------------------------------------------
// nID идентифиакатор сообщения к которому необходимо прикрепить ссылку
function TfmSMDODoc.WriteOneReferredToOsnDoc(nID:Integer; dsRef:TDataSet): Boolean;
var
  n,nDocID,nFolderID, nCurFolderID :Integer;
  sPath, sCurFile:String;
  lOk:Boolean;
begin
  Result:=false;
  try
    dmBase.WorkQuery.SQL.Text:='select max(nomer) from SmdoTask where post_id='+InttoStr(nID);
    dmBase.WorkQuery.Open;
    n:=dmBase.WorkQuery.Fields[0].AsInteger;
    dmBase.WorkQuery.Close;
    if n=0 then n:=1001 else n:=n+1;
    nCurFolderID:=tbFolder.FieldByName('TASK_ID').AsInteger;
//    nCurID:=DokumentID.AsInteger;
    with dmBase.SMDOTask do begin
      Append;
      FieldByName('POST_ID').AsInteger:=nID;
      nFolderID:=dmBase.GetNewID(_TypeObj_SMDOPost);
      FieldByName('TASK_ID').AsInteger:=nFolderID;
      FieldByName('TASK_ID_SOURCE').AsInteger:=nCurFolderID;
      FieldByName('NOMER').AsInteger:=n;
      FieldByName('ADD_TYPE').AsInteger:=ADD_TYPE_PRIL;
      FieldByName('IDNUMBER').AsString:=tbFolder.FieldByName('IDNUMBER').AsString;
      FieldByName('KIND').AsString:=tbFolder.FieldByName('KIND').AsString;
      FieldByName('TEXT').AsString:=tbFolder.FieldByName('TEXT').AsString;
      FieldByName('CONTENTS').AsString:=tbFolder.FieldByName('CONTENTS').AsString;
      Post;
      Result:=true;
    end;
    sPath:=SMDO.GetPathAttach(0, nID);   // реальный путь текущих файлов
    tbFiles.Filter:='parent_id='+IntToStr(nCurFolderID);
    tbFiles.Filtered:=true;
    while not tbFiles.Eof do begin
      lOk:=true;
      if tbFilesSTORE_KIND.AsInteger<>STORE_KIND_VALUE then begin   // не в поле VALUE в BASE64
        sCurFile:=CheckSleshN(NormDir(tbFiles.FieldByName('PATH').AsString))+tbFiles.FieldByName('NAME').AsString;
        //--- !!! ---------------------------------------------------------------------------
        // $$$ заменить на dmBase.AddFileToSMDO(SMDO,sFileName,nPostID)
        // скопируем файл в сообщение ссылку
        if CopyFile(PChar(sCurFile), PChar(sPath+tbFiles.FieldByName('NAME').AsString), false) then begin
        end else begin
          // ??? что делать ???
          lOk:=false;
          PutError('Ошибка копирования файла : '+#13+
                   'источник :'+sCurFile+#13+
                   'результат:'+sPath+tbFiles.FieldByName('NAME').AsString+#13+
                  IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
        end;
      end;
      //--- !!! ---------------------------------------------------------------------------
      with dmBase.SMDOFile do begin
        if lOk then begin
          Append;
          FieldByName('POST_ID').AsInteger:=nID;
          FieldByName('PARENT_ID').AsInteger:=nFolderID;
          //FieldByName('FILE_ID').AsInteger:=tbFilesFILE_ID.AsInteger; autoinc
          FieldByName('FILE_ID_SOURCE').AsInteger:=tbFilesFILE_ID.AsInteger;
          FieldByName('STORE_KIND').AsInteger:=tbFilesSTORE_KIND.AsInteger;
          FieldByName('NAME').AsString:=tbFilesNAME.AsString;
//          tbFilesFILE_TYPE.AsString:=Trim(Copy(ANSIUpperCase(ExtractFileExt(tbFilesNAME.AsString)),2,100));
          FieldByName('PATH').AsString:=SMDO.GetPathAttach(1,nID);   // относительный путь '&BASE&\DocArxiv'
          FieldByName('VALUE').AsString:=tbFilesVALUE.AsString;
          FieldByName('KOMM').AsString:=tbFilesKOMM.AsString;
          FieldByName('SIGNATURE').AsString:=tbFilesSIGNATURE.AsString;
          FieldByName('SIGNINFO').AsString:=tbFilesSIGNINFO.AsString;
          FieldByName('MD5').AsString:=tbFilesMD5.AsString;
          WriteDateField( FieldByName('DATEM'), tbFilesDATEM);
          WriteDateField( FieldByName('DATEC'), tbFilesDATEC);
          Post;
        end;
           
        //---- подсистема входящие DocMain и DocFile -------------------------
        dmBase.WorkQuery.SQL.Text:='select DOC_ID from DocMain where post_id='+InttoStr(nID);
        dmBase.WorkQuery.Open;
        nDocID:=dmBase.WorkQuery.Fields[0].AsInteger;
        dmBase.WorkQuery.Close;
        if nDocID>0 then begin // во входящих нашли запись
          dmBase.WorkQuery.SQL.Text:='select max(n_order) from DocFile where DOC_ID='+InttoStr(nDocID);
          dmBase.WorkQuery.Open;
          n:=dmBase.WorkQuery.Fields[0].AsInteger+1;
          dmBase.AdsConnection.Execute(Format('INSERT INTO DocFile (DOC_ID,N_ORDER,STORE_KIND,DIR_YEAR,DIR_MONTH,DIR_NAME,NAME,PATH,READ_ONLY) '+
             ' VALUES (%d,%d,%d,''%s'',''%s'',''%s'',''%s'',''%s'',1)',
          [nDocID,n,1,FormatDateTime('YYYY', Date),FormatDateTime('MM', Date),FormatDateTime('yyyymmdd_hhnnss_zzz', Now)+'.zip',
           tbFilesNAME.AsString, SMDO.GetPathAttach(1,nID), 1]));
        end;
        //-----------------------------

      end;
      tbFiles.Next;
    end;
  finally
    tbFiles.Filter:='';
    tbFiles.Filtered:=false;
  end;
end;
//-----------------------------------------------------------------------------------
function TfmSMDODoc.WriteDok: Boolean;
var
  i, nID, n : Integer;
  fld : TField;
  sID, sFlt,strField, strErr : String;
  lFlt, lFullWrite:Boolean;   // полная запись актовой записи
  dDate:TDateTime;
  ds:TDataSet;
begin
//  if SubjIN then begin    РЕГИСТРАЦИОННЫЙ НОМЕР !!!  НЕ ПОДЛЕЖИТ РЕГИТСРАЦИИ  !!!
//    ShowMessage('Входящее сообщение не подлежит записи.');
//    Result:=true;
//    exit;
//  end;
  AdditiveBeforeWriteDok;
  if IsCheckDokument then begin
    if SubjOUT and (DokumentSENT.AsInteger=1) then begin
      ShowMessage('Отправленное сообщение не подлежит записи.');
      Result:=true;
      exit;
    end;

    EditDataSet(Dokument);
    if Trim(DokumentMSG_ID.AsString)='' then begin
      DokumentMSG_ID.AsString:=GetGUID(false);
      ShowMessage('"'+DokumentMSG_ID.AsString+'"');
    end;
    if (DokumentPAR_DELIVERY_TYPE.AsInteger=DELIVERY_TYPE_NOTSMDO) and (DokumentSMDOCODE.AsString<>DELIVER_KEY)
      then DokumentPAR_PARORG.AsString:=DokumentSMDOCODE.AsString;

    PostDataSet(Dokument);
  end;

  Result:=CheckDokument(0,false,true,true);
  strErr:=FLastError;

//  if (strErr='') then begin
//    Result:=dmBase.CheckNomerAkt(_TypeObj_AktZAH, DokumentID_SOURCE.AsInteger,
//                   DokumentID.AsInteger, DokumentNOMER.AsInteger, DokumentDATEZ.AsDateTime, False, self);
//    if not Result then exit;
//  end;

  if strErr<>'' then begin
    PutError(strErr,self);
    Result := false;
    exit;
  end;
  FRun:=true;
  try
  if Result then begin
    nID:=DokumentID.AsInteger;
    if FMainTable.FieldByName('ID').AsInteger<>nID then begin
      if not FMainTable.Locate('ID', nID, []) then begin
        if FAddNewDok then begin
          FMainTable.Append;
          FMainTable.FieldByName('ID').AsInteger:=nID;
          FMainTable.FieldByName('MSG_ID').AsString:=DokumentMSG_ID.AsString;
          FMainTable.Post;
        end else begin
          PutError('Не найдено сообщение для записи!');
          Result:=false;
        end;
      end;
    end;
  end;

  if Result then  begin
    sID:=IntToStr(nID);

    WriteReferredToOsnDoc;

    FMainTable.Edit;

    FMainTable.FieldByName('ACK_ADD_TEXT').AsString:=GetAddFields;
    if SubjIN then begin
      FMainTable.FieldByName('MY_REGNUMBER').AsString:=DokumentMY_REGNUMBER.AsString;
      WriteDateField(FMainTable.FieldByName('MY_REGDATE'), DokumentMY_REGDATE);
      FMainTable.FieldByName('DOC_ID').AsInteger:=DokumentDOC_ID.AsInteger;
      FMainTable.FieldByName('ISWRITE_REF').AsBoolean:=DokumentISWRITE_REF.AsBoolean;
      // FMainTable.FieldByName('USER_CREATE').AsString:=Role.User;  д.б. записан при получении почты
      FMainTable.FieldByName('USER_EDIT').AsString:=Role.User;
    end else begin
      //--------------------------------------------
      for i:=1 to FMainTable.FieldCount-1 do begin
        strField := FMainTable.Fields[i].FieldName;
        fld := Dokument.FindField(strField);
        if fld <> nil then begin
          FMainTable.Fields[i].Value := fld.Value;
        end;
      end;
      FMainTable.FieldByName('COUNT_TASK').AsInteger:=tbTask.RecordCount;
      FMainTable.FieldByName('COUNT_FOLDER').AsInteger:=tbFolder.RecordCount;
      if FMainTable.FieldByName('USER_CREATE').AsString=''
        then FMainTable.FieldByName('USER_CREATE').AsString:=Role.User;
      FMainTable.FieldByName('USER_EDIT').AsString:=Role.User;
    end;

    FMainTable.Post;

//=======================
  if SubjOUT then begin  // пишем списки только для исходящего сообщения
    dmBase.AdsConnection.Execute(
      'DELETE FROM SMDOTask WHERE post_id='+sID+';'+#13+
      'DELETE FROM SMDOFile WHERE post_id='+sID+';'+#13+
      'DELETE FROM SMDOMens WHERE post_id='+sID+';'+#13
     );
    tbTask.DisableControls;
    tbFolder.DisableControls;
    try
      with dmBase.SMDOTask do begin
        for i:=1 to 2 do begin
          if i=1 then begin
            ds:=tbTask;
            n:=1;
          end else begin
            ds:=tbFolder;
            n:=1001;
          end;
          ds.First;
          while not ds.Eof do begin
            Append;
            FieldByName('POST_ID').AsInteger:=nID;
            FieldByName('TASK_ID').AsInteger:=ds.FieldByName('TASK_ID').AsInteger;
            FieldByName('TASK_ID_SOURCE').AsInteger:=ds.FieldByName('TASK_ID_SOURCE').AsInteger;
            FieldByName('NOMER').AsInteger:=n;
            FieldByName('ADD_TYPE').AsInteger:=ds.FieldByName('ADD_TYPE').AsInteger;
            FieldByName('IDNUMBER').AsString:=ds.FieldByName('IDNUMBER').AsString;
            FieldByName('KIND').AsString:=ds.FieldByName('KIND').AsString;
            FieldByName('TEXT').AsString:=ds.FieldByName('TEXT').AsString;
            FieldByName('CONTENTS').AsString:=ds.FieldByName('CONTENTS').AsString;
            if i=1 then begin
              WriteDateField(FieldByName('TASKDATE'), ds.FieldByName('TASKDATE'));
              FieldByName('TASKNUMBER').AsInteger:=n;
              FieldByName('CONFIDENT').AsString:=ds.FieldByName('CONFIDENT').AsString;
              FieldByName('NUMCOPY').AsString:=ds.FieldByName('NUMCOPY').AsString;
              FieldByName('PAGES').AsString:=ds.FieldByName('PAGES').AsString;
              FieldByName('FLAG').AsString:=ds.FieldByName('FLAG').AsString;
              WriteDateField(FieldByName('DEADLINE'), ds.FieldByName('DEADLINE'));
              FieldByName('TASK_REG').AsString:=ds.FieldByName('TASK_REG').AsString;
              FieldByName('TASK_COPY').AsString:=ds.FieldByName('TASK_COPY').AsString;
            end;
            Post;
            Inc(n,1);
            ds.Next;
          end;
        end;
      end;
    finally
      tbTask.First;
      tbFolder.First;
      tbTask.EnableControls;
      tbFolder.EnableControls;
    end;

    tbFiles.DisableControls;
    sFlt:=tbFiles.Filter;
    lFlt:=tbFiles.Filtered;
    tbFiles.Filtered:=false;
    try
      with dmBase.SMDOFile do begin
        tbFiles.First;
        while not tbFiles.Eof do begin
          Append;
          FieldByName('POST_ID').AsInteger:=nID;
          FieldByName('PARENT_ID').AsInteger:=tbFilesPARENT_ID.AsInteger;
          //FieldByName('FILE_ID').AsInteger:=tbFilesFILE_ID.AsInteger; autoinc
          FieldByName('STORE_KIND').AsInteger:=tbFilesSTORE_KIND.AsInteger;
          FieldByName('NAME').AsString:=tbFilesNAME.AsString;
//          tbFilesFILE_TYPE.AsString:=Trim(Copy(ANSIUpperCase(ExtractFileExt(tbFilesNAME.AsString)),2,100));
          FieldByName('PATH').AsString:=tbFilesPATH.AsString;
          FieldByName('VALUE').AsString:=tbFilesVALUE.AsString;
          FieldByName('KOMM').AsString:=tbFilesKOMM.AsString;
          FieldByName('SIGNATURE').AsString:=tbFilesSIGNATURE.AsString;
          FieldByName('SIGNINFO').AsString:=tbFilesSIGNINFO.AsString;
          FieldByName('MD5').AsString:=tbFilesMD5.AsString;
          WriteDateField( FieldByName('DATEM'), tbFilesDATEM);
          WriteDateField( FieldByName('DATEC'), tbFilesDATEC);
          Post;
          tbFiles.Next;
        end;
      end;
    finally
      tbFiles.Filter:=sFlt;
      tbFiles.Filtered:=lFlt;
      tbFiles.EnableControls;
    end;

    tbMens.DisableControls;
    sFlt:=tbMens.Filter;
    lFlt:=tbMens.Filtered;
    tbMens.Filtered:=false;
    try
      with dmBase.SMDOMens do begin
        tbMens.First;
        while not tbMens.Eof do begin
          Append;
          FieldByName('POST_ID').AsInteger:=nID;
          FieldByName('PARENT_ID').AsInteger:=tbMensPARENT_ID.AsInteger;
          FieldByName('NOMER').AsInteger:=tbMensNOMER.AsInteger;
          FieldByName('TIP').AsInteger:=tbMensTIP.AsInteger;
          FieldByName('ORG').AsString:=tbMensORG.AsString;
          FieldByName('FIO').AsString:=tbMensFIO.AsString;
          FieldByName('OFFICIAL').AsString:=tbMensOFFICIAL.AsString;
          FieldByName('RANK').AsString:=tbMensRANK.AsString;
          FieldByName('ADRES').AsString:=tbMensADRES.AsString;
          FieldByName('TEL_WORK').AsString:=tbMensTEL_WORK.AsString;
          FieldByName('TEL_MOB').AsString:=tbMensTEL_MOB.AsString;
          FieldByName('EMAIL').AsString:=tbMensEMAIL.AsString;
          FieldByName('ATTESTATION').AsString:=tbMensATTESTATION.AsString;
          WriteDateField( FieldByName('SROK'), tbMensSROK );
          WriteDateField( FieldByName('SIGNDATE'), tbMensSIGNDATE);
          Post;
          tbMens.Next;
        end;
      end;
    finally
      tbMens.Filter:=sFlt;
      tbMens.Filtered:=lFlt;
      tbMens.EnableControls;
    end;

  end;   // SubjIN


  //----- запишем таблицу tbReferred в BaseTextProp  в виде XML
  strErr:=SMDO.WriteAddDataSet(nID, ds2xml, tbReferred.RecordCount=0);
  if strErr<>''
    then PutError(ds2xml.LastError,self);

//=======================
  FMainTable.Edit;

  WriteForAllDok_BeforePost;

  FMainTable.Post;

  {$IFDEF GISUN}
//      WriteMessageID;
  {$ENDIF}

  AdditiveWriteDok;

//    if not DokumentON_ID.Isnull then begin
//      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
//                          DokumentON_ID.AsString);
  QueryExit:=false;
  Result := true;
  if Result then QueryExit:=false;

  end;

  if Result then FlushBuffers;

  finally
    FRun:=false;
  end;

end;
//-----------------------------------------------------------------------------------
function TfmSMDODoc.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;

//  if GlobalTask.ParamAsBoolean('SMERT_KOD') then begin
//    SetMRUList(ENG_edPrNep,20999,4,true,false,false,false); //FAddButtonMRUList);
//    SetMRUList(ENG_edPrOsn,20999,4,true,false,false,false); //FAddButtonMRUList);
//   end;

// в методе Create отключена проверка FCheckLookupField:=false
//  n:=LimitMRUList(3);
//  SetMRUList(edSM_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
//  SetMRUList(edRG_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
//  SetMRUList(edZH_GOROD,n,3,true,false,false,FAddButtonMRUList_Punkt);
end;
//-----------------------------------------------------------------------------------
procedure TfmSMDODoc.LoadFromIni;
begin
  inherited LoadFromIni;
  if not FEnableWrite then begin
    edName.EditButtons[0].Visible:=false;
    edName.EditButtons[1].Visible:=false;
    btKomu.Visible:=false;
    btAddFile.Visible:=false;
    btDelFile.Visible:=false;
    btETSPFile.Visible:=false;
    btAddMen.Visible:=false;
    btDelMen.Visible:=false;
    btEditMen.Visible:=false;
    CheckOtvet(-1,0,-1);
//    btOtvetNa.Visible:=false;
    TBSubmenuRun.Visible:=false;
  end;
//
end;
//-----------------------------------------------------------------------------------
function TfmSMDODoc.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
//
end;
//-----------------------------------------------------------------------------------
procedure TfmSMDODoc.lbDtstampGetText(Sender: TObject; var Text: String);
begin
  if DokumentDTSTAMP.IsNull
    then Text:=''
    else Text:='Создано: '+FormatDateTime('dd.mm.yyyy hh:mm', DokumentDTSTAMP.AsDateTime);
end;
//-----------------------------------------------------------------------------------
procedure TfmSMDODoc.lbDATEPOSTGetText(Sender: TObject; var Text: String);
begin
  if SubjIN  // входящий
    then Text:='Получено  : '
    else Text:='Отправлено: ';
  if DokumentDATEPOST.IsNull
    then Text:=Text+'нет'
    else Text:=Text+FormatDateTime('dd.mm.yyyy hh:mm', DokumentDATEPOST.AsDateTime);
end;
//--------------------------------------------------------------------
procedure TfmSMDODoc.FormCreate(Sender: TObject);
begin
  inherited;
  try
    CreateTmpPath(0);
  except
  end;
  TBItemAdresat.Visible:=true;
  TBItemAddLastDok.Visible:=false;
end;
//--------------------------------------------------------------------
procedure TfmSMDODoc.FormDestroy(Sender: TObject);
begin
  inherited;
  try
    CreateTmpPath(0);
  except
  end;
end;
//--------------------------------------------------------------------
procedure TfmSMDODoc.edNameEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  sCode,sName:String;
begin
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SMDOCODE');
  if Opis<>nil then begin
    v:=null;
    if Opis.ChoiceFromSprEx(edName, v, arrRec, nil) and (v<>null) then begin
      if v <> null then begin
        sName:=Trim(GetValueFieldEx(arrRec, 'NAME', ''));
        sCode:=GetValueFieldEx(arrRec, 'CODE', '');
        FDeliver.Clear;
        EditDataSet(Dokument);
        if sName='' then begin   // значения нет в справочнике
//          ShowMessage('Значение '+sCode+' отсутствует в справочнике');
          if dmBase.SMDOPost.Locate('SMDOCODE', sCode, []) then begin
            DokumentNAME.AsString:=dmBase.SMDOPost.FieldByName('NAME').AsString;
            WriteSMDOCODE(sCode); //  DokumentSMDOCODE.AsString:=sCode;
          end;
        end else begin
          DokumentNAME.AsString:=sName;
          WriteSMDOCODE(sCode); //  DokumentSMDOCODE.AsString:=sCode;
        end;
        if not DocReadOnly
          then btKomu.Visible:=true;
        getKomu;
      end;
    end;
  end;
end;
//--------------------------------------------------------------------
procedure TfmSMDODoc.edNameEditButtons2Click(Sender: TObject;  var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  sSmdo:String;
begin
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK');
  if Opis<>nil then begin
    v:=null;
    dmBase.SprWork.Filter:='not Empty(SMDOCODE)';
    dmBase.SprWork.Filtered:=true;
    try
      if Opis.ChoiceFromSprEx(edName, v, arrRec, nil) and (v<>null) then begin
        if v<>null then begin
          sSmdo:=GetValueFieldEx(arrRec, 'SMDOCODE', '');
          if sSmdo<>'' then begin
            if dmBase.SMDOSprOrg.Locate('SMDOCODE', sSmdo, []) then begin
              FDeliver.Clear;
              EditDataSet(Dokument);
              DokumentNAME.AsString:=dmBase.SMDOSprOrg.FieldByNAme('NAME').AsString; // GetValueFieldEx(arrRec, 'NAME', '');
              WriteSMDOCODE(sSmdo); //  DokumentSMDOCODE.AsString:=sSmdo;
              if not DocReadOnly
                then btKomu.Visible:=true;
              getKomu;
            end else begin
              PutError('Организация не найдена в системном справочником СМДО');
            end;
          end;
        end;
      end;
    finally
      dmBase.SprWork.Filter:='';
      dmBase.SprWork.Filtered:=false;
    end;
  end;
end;
//--------------------------------------------------------------------
procedure TfmSMDODoc.edNameEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRSMDO_NAME');
  if Opis<>nil then begin
    v:=null;
    if Opis.ChoiceFromSprEx(edName, v, arrRec, nil) and (v<>null) then begin
      if v <> null then begin
        FDeliver.Clear;
        EditDataSet(Dokument);
        DokumentNAME.AsString:=GetValueFieldEx(arrRec, 'NAME', '');
        WriteSMDOCODE(GetValueFieldEx(arrRec, 'SMDOCODE', '')); // DokumentSMDOCODE.AsString:=GetValueFieldEx(arrRec, 'SMDOCODE', '');
        if not DocReadOnly
          then btKomu.Visible:=true;
        getKomu;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------
procedure TfmSMDODoc.TBItemAdresatClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  arr:TArrStrings;
  s:String;
  n:Integer;
begin
//  nPostID:=DokumentID.AsInteger;
  SetLength(arrRec,1);
  //    dmBase.LookUpDocMain.SQL.Text    если понадобиться изменить запрос
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRSMDO_KOD');
  if Opis<>nil then begin
    v:=null;
    if (DokumentSMDOCODE.AsString=DELIVER_KEY) and (FDeliver.Count>0) then begin
      v:=edName.Text;
    end;
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      if (v<>null) and (VartoStr(v)<>'') then begin
        s:=VarToStr(v);
        if s='' then begin
          if FDeliver.Count>0 then begin   // была введена рассылка
            FDeliver.Clear;
            EditDataSet(Dokument);
            DokumentNAME.AsString:='';
            WriteSMDOCODE(''); //  DokumentSMDOCODE.AsString:='';
            if not DocReadOnly
              then btKomu.Visible:=true;
            getKomu;
          end;
        end else begin
          StrToStrings(s,FDeliver,#13#10,true);
          n:=100;  // максимальный размер рассылки
          if FDeliver.Count>n then begin
            while FDeliver.Count>n do FDeliver.Delete(n);
          end;
          EditDataSet(Dokument);
          DokumentNAME.AsString:=FDeliver.CommaText;
          WriteSMDOCODE(DELIVER_KEY); // DokumentSMDOCODE.AsString:=DELIVER_KEY;
          tbMensR.First;
          while not tbMensR.Eof do tbMensR.Delete;
          btKomu.Visible:=false;
          getKomu;
        end;
      end;
    end;
  end;
end;
procedure TfmSMDODoc.btKomuClick(Sender: TObject);
begin
  EditKomu;
end;
//-------------------------------------------------------------------
procedure TfmSMDODoc.EditKomu;
var
  f : TfmEditSpr;
//  Param : TParamsEditSpr;
begin
  f:=TfmEditSpr.Create(nil);
  f.DataSet := tbMensR;
  f.Caption:='Кому';
  tbMensR.BeforePost:=tbMensRAfterInsert;
  try
//    Param := TParamsEditSpr.Create;
//    Param.OnBeforeSave := fmEditPerevod.EditRecordSprPerevod;
//    f.ParamsEditSpr := Param;

    f.EnableDetail:=false;
    f.EnablePrint:=false;
    f.EnableFind:=false;
    f.ParamsEditSpr:=nil;
    f.LoadFromIni( Globaltask.iniFile('SPR'),'SMDO_tbMensR');
    f.ShowModal;
    tbMensR.First;
    while not tbMensR.Eof do begin
      if Trim(tbMensR.FieldByName('FIO').AsString)=''
        then tbMensR.Delete
        else tbMensR.Next;
    end;
     getKomu;
  finally
    tbMensR.AfterInsert:=nil;
    f.Free;
  end;
end;
//-------------------------------------------------------------------
procedure TfmSMDODoc.tbMensRAfterInsert(DataSet: TDataSet);
begin                                                  
  tbMensR.FieldByName('POST_ID').AsInteger:=DokumentID.AsInteger;
  tbMensR.FieldByName('PARENT_ID').AsInteger:=DokumentID.AsInteger;
  tbMensR.FieldByName('TIP').AsInteger:=MEN_RECEIVER;
end;
//-------------------------------------------------------------------
procedure TfmSMDODoc.SetCaptionForm;
var                                            
  s,ss:String;
begin
//  ImageList.GetBitmap(IL_ADD_CHILD,btAdd.Glyph);
  if DokumentDTSTAMP.IsNull
    then s:='  ( Создано: ...    '
    else s:='  ( Создано: '+FormatDateTime('dd.mm.yyyy hh:mm', DokumentDTSTAMP.AsDateTime)+'  ';
  if SubjIN
    then ss:='Получено: '
    else ss:='Отправлено: ';
  if DokumentDATEPOST.IsNull
    then ss:=ss+'нет'
    else ss:=ss+FormatDateTime('dd.mm.yyyy hh:mm', DokumentDATEPOST.AsDateTime);
  if SubjIN
    then Caption:='Входящее сообщение'+s+ss+' )'
    else Caption:='Исходящее сообщение'+s+ss+' )';
  if SubjIN and (DokumentISWRITE_REF.AsBoolean=true)
    then Caption:=Caption+', добавлено к основному сообщению';
end;
//--------------------------------------------------------------------------------
function TfmSMDODoc.GetIndexFromExt(sEXT:String):Integer;
begin
  Result:=0;
  if sEXT='PDF' then
    Result:=1
  else if (sEXT='DOC') or (sEXT='DOCX') then
    Result:=2
  else if (sEXT='XLS') or (sEXT='XLSX') then
    Result:=3
  else if sEXT='ODT' then
    Result:=4
  else if sEXT='CSV' then
    Result:=5
  else if sEXT='RTF' then
    Result:=6
  else if sEXT='TXT' then
    Result:=7
  else if sEXT='XML' then
    Result:=8
  else if (sEXT='HTML') or (sEXT='HTM') then
    Result:=9
  else if (sEXT='ZIP') or (sEXT='RAR') or (sEXT='ARJ') then
    Result:=10
  else if (sEXT='JPG') or (sEXT='BMP') or (sEXT='JPEG')  or (sEXT='PNG')  or (sEXT='ICO') or (sEXT='GIF') then
    Result:=11
  else if (Copy(sEXT,1,2)='DB') then
    Result:=12
  else if (sEXT='') then
    Result:=-1;
end;

//--------------------------------------------------------------------------------
procedure TfmSMDODoc.ViewFile(ds:TDataSet);
var
 sFile, sFileC:String;
begin
  sFile:=CheckSleshN(NormDir(ds.FieldByName('PATH').AsString))+ds.FieldByName('NAME').AsString;
  if FileExists(sFile) then begin
    sFileC:=CreateTmpPath(0)+'\'+ds.FieldByName('NAME').AsString;
    if CopyFile(PChar(sFile), PChar(sFileC), true) then begin
      ShellExecute(Application.Handle, nil, PChar(sFileC), nil, nil, SW_SHOWNORMAL);
    end else begin
      PutError('Ошибка копирования файла : '+#13+'  '+
             sFile+#13+' в '+
             sFileC+#13+
             IntToStr(GetLastError)+' ('+SysErrorMessage(GetLastError)+') ');
    end;
  end else begin;
    PutError('Файл "'+sFile+'" не найден.');
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmSMDODoc.GridFilesDocColumns0GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then
    Params.ImageIndex:=GetIndexFromExt(tbFilesFILE_TYPE.AsString);
end;
//------------------------------------------------------------
procedure TfmSMDODoc.GridFilesDblClick(Sender: TObject);
begin
  ViewFile(tbFiles);
end;
//------------------------------------------------------------
procedure TfmSMDODoc.btDelFileClick(Sender: TObject);
var
  lDel:Boolean;
begin
  if tbFilesNAME.AsString<>'' then begin                               
    lDel:=false;
    if Problem('Удалить файл из сообщения ?',mtConfirmation,self) then begin
      if tbFilesSIGNATURE.AsString<>'' then begin
         if Problem('Файл подписан ЭЦП. Удалить файл ?') then begin
           lDel:=true;
         end;
      end else begin
        lDel:=true;
      end;
    end;
    if lDel then begin
      QueryExit:=true;
      File_Delete;
    end;
  end;
end;
//------------------------------------------------------------
function TfmSMDODoc.getFileName(ds:TDataSet):String;
begin
  Result:=Trim(NormDir(ds.FieldByName('PATH').AsString))+ds.FieldByName('NAME').AsString;
end;
//------------------------------------------------------------
function TfmSMDODoc.getCurrentParent:Integer;
var
  n:Integer;
begin
  n:=CurrentTS;
  Result:=0;
  case n of
    TS_DOCUMENT: Result:=DokumentID.AsInteger;
    TS_TASK    : Result:=getCurrentTask;
    TS_ADDDOC  : Result:=getCurrentAddDoc;
  end;
end;
//------------------------------------------------------------
procedure TfmSMDODoc.btAddFileClick(Sender: TObject);
var
  nPostID,nParentID:Integer;
begin
  nPostID:=DokumentID.AsInteger;
  nParentID:=getCurrentParent;
  if (nPostID<=0) or (nParentID<=0) then begin
    PutError('Добавление файла в текущем режиме недоступно.');
    exit;
  end;
  if odFile.Execute and FileExists(odFile.FileName) then begin
    AddFile(odFile.FileName, nPostID, nParentID,'');
  end;
end;
//------------------------------------------------------------
procedure TfmSMDODoc.AddFile(sFileName:String; nPostID:Integer; nParentID:Integer; sSign:String; sSignInfo:String);
var
  s,sFile,sPath,sFileReal,sPathReal:String;
  lCopy:Boolean;
  dCreate, dLastA, dModifi:TDateTime;
begin
  lCopy:=true;
  sFileName:=NormDir(sFileName);
  sFile:=ExtractFileName(sFileName);
  sFileReal:=Trim(sFile);  // !!!   добавлено 21.08.2017
  s:=tbFiles.Bookmark;
  tbFiles.DisableControls;
  try
    tbFiles.First;
    while not tbFiles.Eof do begin
      if MySameText(sFileReal,tbFilesNAME.AsString) then begin
        PutError('Файл с именем "'+sFileReal+'" уже существует в сообщении !',Self);
        lCopy:=false;
      end;
      tbFiles.Next;
    end;
    tbFiles.Bookmark:=s;
  finally
    tbFiles.EnableControls;
  end;
  if lCopy then begin
    //--- !!! ------------------------------------------------------------------------
    // $$$ заменить на dmBase.AddFileToSMDO(SMDO,sFileName,nPostID)
    sPath:=SMDO.GetPathAttach(1, nPostID);
    sPathReal:=SMDO.GetPathAttach(0, nPostID);
    if FileExists(sPathReal+sFileReal) then DeleteFile(sPathReal+sFileReal);
    if CopyFile(PChar(sFileName), PChar(sPathReal+sFileReal), true) then begin
      lCopy := true;
    end else begin
      lCopy:=false;
      PutError('Ошибка копирования файла : '+#13+'  '+
             sFileName+#13+' в '+
             sPathReal+sFile+#13+
             IntToStr(GetLastError)+' ('+SysErrorMessage(GetLastError)+') ');
    end;
    //--- !!! ------------------------------------------------------------------------
  end;
  if lCopy then begin
    QueryExit:=true;
    tbFiles.Append;
    tbFilesPOST_ID.AsInteger:=nPostID;
    tbFilesPARENT_ID.AsInteger:=nParentID;
    tbFilesFILE_ID.AsInteger:=0;  // в базе autoinc
    tbFilesSTORE_KIND.AsInteger:=STORE_KIND_PATH;
    tbFilesNAME.AsString:=sFileReal;
    tbFilesFILE_TYPE.AsString:=Trim(Copy(ANSIUpperCase(ExtractFileExt(tbFilesNAME.AsString)),2,100));
    tbFilesPATH.AsString:=sPath;
    tbFilesVALUE.AsString:='';
    tbFilesKOMM.AsString:='';
    tbFilesSIGNATURE.AsString:='';
    tbFilesSIGNINFO.AsString:='';
    if sSign<>'' then begin
      if sSignInfo='' then begin
        SMDO.VerifySignFile(sPathReal+sFileReal,sSign,sSignInfo,true);
      end;
      tbFilesSIGNATURE.AsString:=sSign;
      tbFilesSIGNINFO.AsString:=sSignInfo;
    end;
    if DSiGetFileTimes(sPathReal+sFileReal, dCreate, dLastA, dModifi) then begin
      tbFilesDATEM.AsDateTime:=dModifi;
      tbFilesDATEC.AsDateTime:=dCreate;
    end;
    try
      tbFilesMD5.AsString:=CalcMD5File(sPathReal+sFile);
    except
      tbFilesMD5.AsString:='';
    end;
    tbFiles.Post;
  end;
end;

//------------------------------------------------------------
procedure TfmSMDODoc.Event_OnAddMens(Sender: TObject);
var
  sl:TStringList;
  sDolg, sFIO,sDate,sOrg:String;
  dDate:TDateTime;
  n:Integer;
begin
  if CurrentTS<>TS_ADDDOC then begin
    sl:=TStringList(Sender);
    sDolg:=ValueFromParams(sl,'DOLG','');
    sFIO:=ValueFromParams(sl,'FIO','');
    sORG:=ValueFromParams(sl,'ORG','');
    sDate:=ValueFromParams(sl,'SIGNDATE','');
    dDate:=Date;
    if sDate<>'' then begin    
      try
        dDate:=STOD( Copy(sDate,7,4)+Copy(sDate,4,2)+Copy(sDate,1,2),tdClipper);
      except
        dDate:=Date;
      end;
    end;
    if not tbMens.Locate('FIO', sFIO,[loCaseInsensitive]) then begin
      tbMens.Last;
      n:=tbMensNOMER.AsInteger;
      Inc(n,1);
      tbMens.Append;
      tbMensPOST_ID.AsInteger:=DokumentID.AsInteger;
      tbMensPARENT_ID.AsInteger:=getCurrentParent;
      tbMensTIP.AsInteger:=MEN_AUTHOR;
      tbMensORG.AsString:=sOrg;
      tbMensFIO.AsString:=sFIO;
      tbMensOFFICIAL.AsString:=sDolg;
      tbMensRANK.AsString:='';
      tbMensSIGNDATE.AsDateTime:=dDate;
      tbMensNOMER.AsInteger:=n;
      tbMens.Post;
    end;
  end;
end;
//------------------------------------------------------------
procedure TfmSMDODoc.btETSPFileClick(Sender: TObject);
var
  sFile,sSignature,sSignInfo:String;
  f:TfmEditSign;
begin
  if (tbFilesNAME.AsString<>'') then begin
    if SMDO.ActiveAvest then begin
      sFile:=getFileName(tbFiles);
      sSignature:=tbFilesSIGNATURE.AsString;
      sSignInfo:=tbFilesSIGNINFO.AsString;
      if FileExists(sFile) then begin
        f:=TfmEditSign.Create(nil);
        try
          if f.EditSign(SubjOut, sFile, sSignature, sSignInfo, Event_OnAddMens) then begin
            QueryExit:=true;
            EditDataSet(tbFiles);
            tbFilesSIGNATURE.AsString:=sSignature;
            tbFilesSIGNINFO.AsString:=sSignInfo;
            PostDataSet(tbFiles);
          end;
        finally
          f.Free;
        end;
      end else begin
        PutError('Не найден файл "'+sFile+'"', self);
      end;
    end else begin
      PutError(error_load_etsp, self);
    end;
  end;
end;
//---------------------------------------------------------------
procedure TfmSMDODoc.btETSPFileAllClick(Sender: TObject);
begin
  SignAllFiles;
end;
//---------------------------------------------------------------
procedure TfmSMDODoc.pmFilesAll_ETSPClick(Sender: TObject);
begin
  SignAllFiles;
end;
//---------------------------------------------------------------
procedure TfmSMDODoc.SignAllFiles;
var
  sDolg, sFile, sErr, sFIO, sOrg, sDate, sSign,sInfo:String;
  dSign:TDateTime;
  res:DWORD;
  i:Integer;
  CurKeyBoard:LongWord;
  slFiles,slSign,sl:TStringList;
begin
  sSign:='';
  sInfo:='';
  sFio:='';
  sDolg:='';
  Avest.FDeleteCRLF:=true;      // в ЭЦП будем удалять CRLF
  CurKeyBoard:=GetTypeKeyBoard;
  ActivateENGKeyboard;

  slSign:=TStringList.Create;
  slFiles:=TStringList.Create;
  tbFiles.First;
  while not tbFiles.Eof do begin
    if (tbFilesNAME.AsString<>'') then begin
      slFiles.Add(getFileName(tbFiles));
    end;
    tbFiles.Next;
  end;
  tbFiles.First;
  if slFiles.Count>0 then begin
    res:=Avest.SMDOSign(slFiles,slSign);
    if res=0 then begin
      sl:=TStringList.Create;
      sl.Add(slSign.Strings[0]);
      sFile:=ReadFileToString(slFiles.Strings[0], sErr);
      res:=Avest.SMDOVerify(sFile, sl, false, CHECK_CERT_DEFAULT);
      if res=0 then begin
        sDolg:=Avest.GetAttrSign(0,'dolg');
        sFIO:=Avest.GetAttrSign(0,'fio');
        sDate:=Avest.GetAttrSign(0,'signdate');
        sOrg:=Avest.GetAttrSign(0,'org');
        sInfo:=Trim(sDolg+' '+sFIO)+', '+sDate+', '+sOrg;
      end;
      sl.Clear;
      if (sInfo<>'') then begin
        sl.Add('FIO='+sFIO);
        sl.Add('DOLG='+sDolg);
        sl.Add('SIGNDATE='+sDate);
        sl.Add('ORG='+sOrg);
        Event_OnAddMens(TObject(sl));
        i:=0;
        tbFiles.First;
        if Pos(sFIO, tbFilesSIGNINFO.AsString)=0 then begin
          while not tbFiles.Eof do begin
            if (tbFilesNAME.AsString<>'') then begin
              EditDataSet(tbFiles);
              tbFilesSIGNATURE.AsString:=tbFilesSIGNATURE.AsString+slSign.Strings[i]+chr(13)+chr(10);
              tbFilesSIGNINFO.AsString:=tbFilesSIGNINFO.AsString+sInfo+chr(13)+chr(10);
              PostDataSet(tbFiles);
              inc(i,1);
            end;
            tbFiles.Next;
          end;
          tbFiles.First;
        end else begin
          PutError(sFIO+' уже подписал файл',self);
        end;
      end;
      sl.Free;
    end else begin
      PutError(Avest.ErrorInfo(res));
    end;
  end;
  slSign.Free;
  slFiles.Free;
  if CurKeyBoard>0 then
    ActivateKeyboardLayout(CurKeyBoard,KLF_ACTIVATE);
end;

//---------------------------------------------
function TfmSMDODoc.getCurrentAddDoc: Integer;
begin
  Result:=tbFolderTASK_ID.AsInteger;  // !!!
end;
//---------------------------------------------
function TfmSMDODoc.getCurrentTask: Integer;
begin
  Result:=tbTaskTASK_ID.AsInteger;  // !!!
end;
//------------------------------------------------------------
function TfmSMDODoc.CurrentTS: Integer;
begin
  Result:=TS_DOCUMENT;
  if pc.ActivePageIndex=0 then
    Result:=TS_DOCUMENT
  else if pc.ActivePageIndex=1 then
    Result:=TS_TASK
  else if pc.ActivePageIndex=2 then
    Result:=TS_ADDDOC;
end;
//------------------------------------------------------------
procedure TfmSMDODoc.GridFilesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not SubjIN and (tbFilesSIGNATURE.AsString='') then AFont.Color:=clRed;
end;
//------------------------------------------------------------
procedure TfmSMDODoc.CheckFilterTables(nCur:Integer);
var
  n:Integer;
  sID:String;
  lTask:Boolean;
begin
  if nCur=-1
    then n:=CurrentTS
    else n:=nCur;
  lTask:=false;
  if nCur=-1 then begin
    tbFiles.DisableControls;
    tbMens.DisableControls;
  end;
  case n of
    TS_DOCUMENT : sID:=DokumentID.AsString;
    TS_TASK     : begin
                    sID:=tbTaskTASK_ID.AsString;
                    lTask:=true;
                  end;
    TS_ADDDOC   : sID:=tbFolderTASK_ID.AsString;
  else
    // error
    PutError('ОШБКА (CheckFilterTables) CurrentTS='+inttostr(n));
  end;
  if (sID='')  then sID:='-1';
  tbFiles.Filter:='parent_id='+sID;
  tbMens.Filter:='parent_id='+sID+' and tip<>0';   // дополнительно исключаем  receiver men
  tbFiles.Filtered:=true;
  tbMens.Filtered:=true;

  if tbFolderTASK_ID.AsString<>''
    then tbReferredAdd.Filter:='parent_id='+tbFolderTASK_ID.AsString
    else tbReferredAdd.Filter:='parent_id=-9999';
  tbReferredAdd.Filtered:=true;
  if tbTaskTASK_ID.AsString<>''
    then tbReferredTask.Filter:='parent_id='+tbTaskTASK_ID.AsString
    else tbReferredTask.Filter:='parent_id=-9999';
  tbReferredTask.Filtered:=true;

//  определено в дизайнере
//  tbReferredR.Filter:='parent_id=0'; //+DokumentID.AsString;
//  tbReferredR.Filtered:=true;

  if nCur=-1 then begin
    tbFiles.EnableControls;
    tbMens.EnableControls;
  end;
end;
//--------------------------------------------------------------
procedure TfmSMDODoc.btAddMenClick(Sender: TObject);
var
  f:TfmEditSpec;
begin
  tbMens.Append;
  f:=TfmEditSpec.Create(nil);
  try
    if f.EditSpec(tbMens, CurrentTS, DocReadOnly) then begin
      QueryExit:=true;
      tbMensPOST_ID.AsInteger:=DokumentID.AsInteger;;
      tbMensPARENT_ID.AsInteger:=getCurrentParent;
      tbMens.Post;
    end else begin
      tbMens.Cancel;
    end;
  finally
    f.Free;
  end;
end;

procedure TfmSMDODoc.btDelMenClick(Sender: TObject);
begin
  if tbMens.RecordCount>0 then begin
    if Problem('Удалить специалиста: "'+tbMensFIO.AsString+'" из документа?',mtConfirmation,self) then begin
      QueryExit:=true;
      tbMens.Delete;
    end;
  end;
end;

procedure TfmSMDODoc.btEditMenClick(Sender: TObject);
var
  f:TfmEditSpec;
begin
  if tbMens.RecordCount>0 then begin
    tbMens.Edit;
    f:=TfmEditSpec.Create(nil);
    try
      if f.EditSpec(tbMens, CurrentTS, DocReadOnly) then begin
        QueryExit:=true;
        tbMens.Post;
      end else begin
        tbMens.Cancel;
      end;
    finally
      f.Free;
    end;
  end;
end;
//--------------------------------------------------------------
procedure TfmSMDODoc.getKomu;
var
  s:String;
begin
  s:='';
  tbMensR.First;
  while not tbMensR.Eof do begin
    s:=s+tbMensR.FieldByName('FIO').AsString+', ';
    tbMensR.Next;
  end;
  if s=''
    then s:='---'
    else s:=Copy(s,1,Length(s)-2);
  lbKomu.Caption:=s;
end;

//---------------------------------------------------------------------
procedure TfmSMDODoc.CheckLookupDocMain(nType:Integer);
begin
  dmBase.LookUpDocMain.SQL.Text:=ChangeWhere(dmBase.LookUpDocMain.SQL.Text, 'doc_type='+IntToStr(nType), false );
end;
//---------------------------------------------------------------------
// выбрать исходящий документ
procedure TfmSMDODoc.DocMain_ParamsEditSpr(Opis:TOpisEdit);
var
  Params:TParamsEditSpr;
begin
  //  ParamsEditSpr.FreeOnExitSpr=true, поэтому создаем каждый раз
  Params:=TParamsEditSpr.Create;
//  Opis.ParamsEditSpr.Col1:='SIGN_ORG';
//  Opis.ParamsEditSpr.GetCellParams_Col1:=Event_DoMainGetCellParams1;
//  Params.FormatList.Add('<FILEDNAME>=<DISPLAYFORMAT>~<ALIGN=C,L,R>');
  Params.FormatList.Add('REG_DATE=~C');
  Params.FormatList.Add('DOC_DATE=~C');
  Params.FormatList.Add('REQ_DATE=~C');
  Params.FreeOnExitSpr:=true;
  Opis.SetParamsEditSpr(Params);
end;
//---------------------------------------------------------------------
procedure TfmSMDODoc.Event_DoMainGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  s:String;
begin
  if (Params.Text<>'') and dmBase.SprWork.Locate('ID', Params.Text, []) then begin
    s:=dmBase.SprWork.FieldByName('SMDOCODE').AsString;
    Params.Text:=dmBase.SprWork.FieldByNAme('NAME').AsString;
    if Params.Text=''
      then Params.Text:=dmBase.SprWork.FieldByName('FNAME').AsString;
    if s<>''
      then Params.Text:=s+' '+Params.Text;
//                if dmBase.SMDOSprOrg.Locate('smdocode', sOrg,[])
//                  then sName:=dmBase.SMDOSprOrg.FieldByNAme('NAME').AsString
  end;
end;
//---------------------------------------------------------------------
//
procedure TfmSMDODoc.ReadDataFromPost(nPostID:Integer; sRegNumber:String; dRegDate:TDateTime);
var
  sSMDOCode:String;
  d:TDateTime;
begin
  if (nPostID>0) then begin
    dmBase.WorkQuery.SQL.Text:='SELECT SMDOCODE, IDNUMBER, PAR_PARMSG, ADR_REGNUMBER, ADR_REGDATE, MSG_ID, NAME '+
                               'FROM SMDOPost WHERE id='+IntToStr(nPostID);
    dmBase.WorkQuery.Open;
    if dmBase.WorkQuery.FieldByName('SMDOCODE').AsString<>'' then begin
      with dmBase.WorkQuery do begin
        EditDataSet(Dokument);
        sSmdoCode:=FieldByName('SMDOCODE').AsString;
        WriteSMDOCODE(sSmdoCode); // DokumentSMDOCODE.AsString:=sSmdoCode;
        if dmBase.SMDOSprOrg.Locate('SMDOCODE', sSmdoCode, [])
          then DokumentNAME.AsString:=dmBase.SMDOSprOrg.FieldByName('NAME').AsString
          else DokumentNAME.AsString:=FieldByName('NAME').AsString;
        DokumentPAR_DELIVERY_TYPE.AsInteger:=DELIVERY_TYPE_SMDO;
        //begin "в ответ на"   PAR_IDNUMBER, PAR_REGNUMBER, PAR_REGDATE,PAR_PARORG, PAR_LASTMSG, PAR_PARMSG
        DokumentPAR_IDNUMBER.AsString:=FieldByName('IDNUMBER').AsString;
        DokumentPAR_PARMSG.AsString:=FieldByName('PAR_PARMSG').AsString;
        DokumentPAR_PARORG.AsString:=sSmdoCode;
        DokumentPAR_REGDATE.AsString:='';    
        if sRegNumber='' then begin
          DokumentPAR_REGNUMBER.AsString:=FieldByName('ADR_REGNUMBER').AsString;
          d:=FieldByName('ADR_REGDATE').AsDateTime;
          if d>0 then DokumentPAR_REGDATE.AsDateTime:=d;
        end else begin
          DokumentPAR_REGNUMBER.AsString:=sRegNumber;
          if dRegDate>0 then DokumentPAR_REGDATE.AsDateTime:=dRegDate;
        end;
        DokumentPAR_LASTMSG.AsString:=FieldByName('MSG_ID').AsString;
        if DokumentPAR_PARMSG.AsString=''
          then DokumentPAR_PARMSG.AsString:=DokumentPAR_LASTMSG.AsString;
        //end "в ответ на"
      end;
    end;
    dmBase.WorkQuery.Close;
  end;
end;
//---------------------------------------------------------------------
// выбрать исходящий документ
procedure TfmSMDODoc.TBItemRegIsxClick(Sender: TObject);
var
  s, sDolg, sFIO, sName, sOrg,sErr,sTmpDir,sFileArx,sFileName,sRegNumber : String;
  dRegDate : TDateTime;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  nPostID, nPostOtvNa, i, n, nOrg, nDocID:Integer;
  ds:TAdsTable;
  lOk,lNotVid:Boolean;
  Enum: TEnumItem;
  arrID,arrName:TArrStrings;
begin
  lNotVid:=false;
  if SubjOUT then begin
    if (DokumentSENT.AsInteger=1) then begin
      PutError('Документ уже был отправлен');
      exit;
    end;
    nPostID:=DokumentID.AsInteger;
    SetLength(arrRec,1);
  //    dmBase.LookUpDocMain.SQL.Text    если понадобиться изменить запрос
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_DOCMAIN4');
    if Opis <> nil then begin
      DocMain_ParamsEditSpr(Opis);
      //---------------------------
      // !!! переоткрыть запрос !!!
      Opis.DataSet.Active:=false;
      CheckLookupDocMain(4);
      Opis.DataSet.Active:=true;
      //---------------------------
      v := null;
      try
        if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
          if v <> null then begin
            lOk:=true;
            sRegNumber:=GetValueFieldEx(arrrec, 'REG_IND', '');
            dRegDate:=GetValueFieldEx(arrrec, 'REG_DATE', 0);
            StrToArr(GetValueFieldEx(arrrec, 'IDEN_DATE', ''),arrID, ',',true);
            StrToArr(GetValueFieldEx(arrrec, 'IDEN_TEXT', ''),arrName, ',',true);
            nOrg:=GetValueFieldEx(arrrec, 'SIGN_ORG', 0);
            if (sRegNumber='') or (dRegDate=0) then begin
              PutError('Не заполнены исходящий индекс и дата регистрации');
              lOk:=false;
            end;
            if lOk and (nOrg=0) and (Length(arrID)=0) then begin
              PutError('Не заполнен корреспондент');
              lOk:=false;
            end;
            sOrg:='';
            if lOk then begin
              sErr:='';
              if dmBase.SprWork.Locate('ID', nOrg, []) then begin
                s:=dmBase.SprWork.FieldByNAme('SMDOCODE').AsString;
                sName:=dmBase.SprWork.FieldByName('NAME').AsString;
                if dmBase.SMDOSprOrg.Locate('smdocode', s,[]) then begin
                  sOrg:=s+',';
                  sName:=dmBase.SMDOSprOrg.FieldByName('NAME').AsString;
                end else begin
                  sErr:=sName+#13#10;
                end;
              end;
              for i:=0 to Length(arrID)-1 do begin
                if dmBase.SprWork.Locate('ID', arrID[i], []) then begin
                  s:=dmBase.SprWork.FieldByNAme('SMDOCODE').AsString;
                  if dmBase.SMDOSprOrg.Locate('smdocode', s,[]) then begin
                    sName:=dmBase.SMDOSprOrg.FieldByName('NAME').AsString;
                    sOrg:=sOrg+s+',';
                  end else begin
                    sErr:=sErr+arrName[i]+#13#10;
                  end;
                end;
              end;
              if sErr<>'' then PutError('нет в справочнике адресатов СМДО:'#13#10+sErr);
            end;
            if lOk and (sOrg<>'') then begin
              sOrg:=Copy(sOrg,1,Length(sOrg)-1);
              EditDataSet(Dokument);
              nDocID:=GetValueFieldEx(arrrec, 'DOC_ID', 0);
              DokumentDOC_ID.AsInteger:=nDocID;
              StrToArr(sOrg,arrID,',',true);
              FDeliver.Clear;
              if Length(arrID)=1 then begin // один корреспондент
                WriteSMDOCODE(sOrg); // DokumentSMDOCODE.AsString:=sOrg;;
                DokumentNAME.AsString:=sName;
              end else begin
                DokumentNAME.AsString:=sOrg;
                WriteSMDOCODE(DELIVER_KEY); // DokumentSMDOCODE.AsString:=DELIVER_KEY;
                StrToStrings(sOrg,FDeliver,',',true);
              end;
              Enum:=fmMain.DocRecord.EnumList.ByName('DOC_KIND');
              s:=Enum.GetName(GetValueFieldEx(arrrec, 'DOC_KIND', 0));
              if (s<>'') and dmBase.SMDOSprVidDok.Locate('NAME', s, []) then begin
                DokumentKIND.AsString:=s;
              end else begin
                DokumentKIND.AsString:='';
                lNotVid:=true;
              end;
              DokumentMY_REGNUMBER.AsString:=sRegNumber;
              DokumentMY_REGDATE.AsDateTime:=dRegDate;

              nPostOtvNa:=GetValueFieldEx(arrrec, 'POST_ID', 0);
              if SMDO.OrgIsDemand(sOrg) // одно окно
                then DokumentPAR_DELIVERY_TYPE.AsInteger:=DELIVERY_TYPE_SMDO;
              if (nPostOtvNa>0) and (FDeliver.Count=0) then begin // в исх. документе есть ссылка на почтовое сообщение СМДО, значит "в ответ на"
                ReadDataFromPost(nPostOtvNa, '', 0);
              end else begin
                s:=GetValueFieldEx(arrrec, 'REQ_IND', '');
                if (DokumentPAR_DELIVERY_TYPE.AsInteger<>DELIVERY_TYPE_SMDO) then begin
                  if (s<>'') and (DokumentPAR_REGNUMBER.AsString='') then begin
                    //begin  PAR_IDNUMBER, PAR_REGNUMBER, PAR_REGDATE,PAR_PARORG, PAR_LASTMSG, PAR_PARMSG
                    DokumentPAR_DELIVERY_TYPE.AsInteger:=DELIVERY_TYPE_NOTSMDO;
                    DokumentPAR_REGNUMBER.AsString:=GetValueFieldEx(arrrec, 'REQ_IND', '');
                    WriteDateFieldV(DokumentPAR_REGDATE, GetValueFieldEx(arrrec, 'REQ_DATE', 0));
                  end;
                end;
              end;

              DokumentPAGES.AsInteger:=GetValueFieldEx(arrrec, 'NUM_LIST', 0);
              DokumentTEXT.AsString:=GetValueFieldEx(arrrec, 'CONTENT', '');
              PostDataSet(Dokument);
              s:=GetValueFieldEx(arrrec, 'SIGN_NAME', '');  // кому
              if s<>'' then begin
                tbMensR.Last;
                n:=tbMensR.FieldByName('NOMER').AsInteger+1;
                tbMensR.Append;
                tbMensR.FieldByName('POST_ID').AsInteger:=nPostID;
                tbMensR.FieldByName('PARENT_ID').AsInteger:=nPostID;
                tbMensR.FieldByName('TIP').AsInteger:=MEN_RECEIVER;
                tbMensR.FieldByName('ORG').AsString:=''; // sName ???
                tbMensR.FieldByName('FIO').AsString:=s;
                tbMensR.FieldByName('NOMER').AsInteger:=n;
                tbMensR.Post;
                getKomu;
              end;
              s:=GetValueFieldEx(arrrec, 'RES_MAN', '');  // подписал
              if (s<>'') then begin
                sFIO:='+';  // по возможности полное ФИО
                if getDolgAndFIOFromSpr(s, sDolg, sFIO) then begin
                  tbMensR.Last;
                  n:=tbMensR.FieldByName('NOMER').AsInteger+1;
                  tbMensR.Append;
                  tbMensR.FieldByName('POST_ID').AsInteger:=nPostID;
                  tbMensR.FieldByName('PARENT_ID').AsInteger:=nPostID;
                  tbMensR.FieldByName('TIP').AsInteger:=MEN_AUTHOR;  // автор подписавший
                  tbMensR.FieldByName('ORG').AsString:=''; // sName ???
                  tbMensR.FieldByName('FIO').AsString:=sFIO;
                  tbMensR.FieldByName('OFFICIAL').AsString:=sDolg;
                  tbMensR.FieldByName('NOMER').AsInteger:=n;
                  tbMensR.Post;
                end;
              end;
              s:=GetValueFieldEx(arrrec, 'EXEC_MAN', '');   // исполнитель
              if (s<>'') then begin
                sFIO:='+';
                if getDolgAndFIOFromSpr(s, sDolg, sFIO) then begin
                  tbMensR.Last;
                  n:=tbMensR.FieldByName('NOMER').AsInteger+1;
                  tbMensR.Append;
                  tbMensR.FieldByName('POST_ID').AsInteger:=nPostID;
                  tbMensR.FieldByName('PARENT_ID').AsInteger:=nPostID;
                  tbMensR.FieldByName('TIP').AsInteger:=MEN_WRITER;  // исполнитель составитель
                  tbMensR.FieldByName('ORG').AsString:=''; // sName ???
                  tbMensR.FieldByName('FIO').AsString:=sFIO;
                  tbMensR.FieldByName('OFFICIAL').AsString:=sDolg;
                  tbMensR.FieldByName('NOMER').AsInteger:=n;
                  tbMensR.Post;
                end;
              end;
              sTmpDir:=CheckSleshN(CreateTmpPath(0));
              with dmBase.DocFile do begin
                try
                  IndexName:='PR_KEY';
                  SetRange([nDocID],[nDocID]);
                  while not Eof do begin
                    sFileName:='';
                    if FieldByName('STORE_KIND').AsInteger=stInFolder then begin
                      sFileArx:=GetDocArxivFolder(sErr,0)+FieldByName('DIR_YEAR').AsString+'\'+FieldByName('DIR_MONTH').AsString+'\'+FieldByName('DIR_NAME').AsString;
                      if FileExists(sFileArx) then begin
                        try
                          Zip.FileName:=sFileArx;
                          Zip.BaseDir:=sTmpDir;
                          Zip.OpenArchive;
                          Zip.ExtractFiles(FieldByName('NAME').AsString);
                          sFileName:=sTmpDir+FieldByName('NAME').AsString;
                        finally
                          Zip.CloseArchive;
                        end;
                      end else begin
                        PutError('Файл '+FieldByName('NAME').AsString+'('+sFileArx+') не найден в специальной папаке.',Self);
                      end;
                    end else begin
                      sFileName:=NormDir(ChecksleshN(FieldByName('PATH').AsString)+FieldByName('NAME').AsString);
                    end;
                    if sFileName<>'' then begin
                      if FileExists(sFileName) then begin
                        AddFile(sFileName, nPostID, nPostID, FieldByName('SIGNATURE').AsString, FieldByName('SIGNINFO').AsString);
                      end else begin
                        PutError('Файл '+sFileName+' не найден в исходящих документах.',Self);
                      end;
                    end;
                    Next;
                  end;
                finally
                  CancelRange;
                end;
              end;
            end;
          end;
        end;
      finally

      end;
      if lNotVid then ShowMessage(PadCStr('Выберите вид документа',STD_LEN,' '));
    end;
  end;
end;

//--------------------------------------------------------------
procedure TfmSMDODoc.edOtvet_RegnumberEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceOtvet;
  Handled:=true;
end;
//--------------------------------------------------------------
procedure TfmSMDODoc.ChoiceOtvet;
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  d:TDateTime;
  s,sSmdoCode:String;
begin
  if DocReadOnly then exit;
  if getDeliveryType=DELIVERY_TYPE_SMDO then  begin
    SetLength(arrRec,1);
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SMDOPOST');
    if Opis <> nil then begin
      v := null;
      if (DokumentSMDOCODE.AsString<>'') and (DokumentSMDOCODE.AsString<>DELIVER_KEY)
        then s:=' and SMDOCODE='+QStr(DokumentSMDOCODE.AsString)
        else s:='';
      dmBase.SMDOPost.Filter:='SUBJ_TYPE=1 and MSG_TYPE<>0'+s;   // входящее сообщение, не уведомление  +организавция
      dmBase.SMDOPost.Filtered:=true;
      try
        if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
          if v <> null then begin
            EditDataSet(Dokument);
            sSmdoCode:=GetValueFieldEx(arrrec, 'SMDOCODE', '');
            WriteSMDOCODE(sSmdoCode);  //  DokumentSMDOCODE.AsString:=sSmdoCode;
            if dmBase.SMDOSprOrg.Locate('SMDOCODE', sSmdoCode, []) then begin
              DokumentNAME.AsString:=dmBase.SMDOSprOrg.FieldByName('NAME').AsString;
            end else begin
              DokumentNAME.AsString:=GetValueFieldEx(arrrec, 'NAME', '');
            end;
            //begin "в ответ на"  PAR_IDNUMBER, PAR_REGNUMBER, PAR_REGDATE,PAR_PARORG, PAR_LASTMSG, PAR_PARMSG
            DokumentPAR_IDNUMBER.AsString:=GetValueFieldEx(arrrec, 'IDNUMBER', '');
            DokumentPAR_PARMSG.AsString:=GetValueFieldEx(arrrec, 'PAR_PARMSG', '');
            DokumentPAR_REGNUMBER.AsString:=GetValueFieldEx(arrrec, 'ADR_REGNUMBER', '');
            DokumentPAR_PARORG.AsString:=sSmdoCode;
            d:=GetValueFieldEx(arrrec, 'ADR_REGDATE', 0);
            if d>0
              then DokumentPAR_REGDATE.AsDateTime:=d;
            DokumentPAR_LASTMSG.AsString:=GetValueFieldEx(arrrec, 'MSG_ID', '');
            if DokumentPAR_PARMSG.AsString=''
              then DokumentPAR_PARMSG.AsString:=DokumentPAR_LASTMSG.AsString;
  //          PostDataSet(Dokument);
            //end "в ответ на"
          end;
        end;
      finally
        dmBase.SMDOPost.Filtered:=false;
      end;
    end;
  end else if getDeliveryType=DELIVERY_TYPE_NOTSMDO then  begin
    ChoiceVxod;
  end;
end;
//---------------------------------------------------------------------
// выбрать из входящих документ "в ответ на"
procedure TfmSMDODoc.ChoiceVxod;
var
  s, sName, sOrg,sErr,sTmpDir,sFileArx,sFileName,sRegNumber : String;
  dRegDate, d : TDateTime;
  Opis : TOpisEdit;               
  v : Variant;
  arrRec : TCurrentRecord;
  nPostOtvNa, nPostID, i, n, nDocID:Integer;
  ds:TAdsTable;
  lOk:Boolean;
  Enum: TEnumItem;
begin
  if SubjOUT then begin
    nPostID:=DokumentID.AsInteger;
    SetLength(arrRec,1);
  //    dmBase.LookUpDocMain.SQL.Text    если понадобиться изменить запрос
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_DOCMAIN3');
    if Opis <> nil then begin
      DocMain_ParamsEditSpr(Opis);
      //---------------------------
      // !!! переоткрыть запрос !!!
      Opis.DataSet.Active:=false;
      CheckLookupDocMain(3);
      Opis.DataSet.Active:=true;
      //---------------------------
      v := null;
      try
        if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
          if v <> null then begin
            lOk:=true;
            sRegNumber:=GetValueFieldEx(arrrec, 'REG_IND', '');
            dRegDate:=GetValueFieldEx(arrrec, 'REG_DATE', 0);
            if (sRegNumber='') or (dRegDate=0) then begin
              PutError('Не заполнены исходящий индекс и дата регистрации');
              lOk:=false;
            end;
            if lOk then begin
              sOrg:='';
              n:=GetValueFieldEx(arrrec, 'SIGN_ORG', 0);
              if dmBase.SprWork.Locate('ID', n, []) then begin
                sOrg:=dmBase.SprWork.FieldByNAme('SMDOCODE').AsString;
                if dmBase.SMDOSprOrg.Locate('smdocode', sOrg,[])
                  then sName:=dmBase.SMDOSprOrg.FieldByNAme('NAME').AsString
                  else lOk:=false;
              end;
              if not lOk then
                PutError('Организация не найдена в справочнике адресатов СМДО');
            end;
            if lOk then begin
              nPostOtvNa:=GetValueFieldEx(arrrec, 'POST_ID', 0);
              if SMDO.OrgIsDemand(sOrg) // одно окно
                then DokumentPAR_DELIVERY_TYPE.AsInteger:=DELIVERY_TYPE_SMDO;
              if (nPostOtvNa>0) and (FDeliver.Count=0) then begin // во вход. документе есть ссылка на почтовое сообщение СМДО, значит "в ответ на"
                ReadDataFromPost(nPostOtvNa, '', 0);
              end else begin
                s:=GetValueFieldEx(arrrec, 'DOC_IND', '');
                if (DokumentPAR_DELIVERY_TYPE.AsInteger<>DELIVERY_TYPE_SMDO) then begin
                  if (s<>'') and (DokumentPAR_REGNUMBER.AsString='') then begin
                    EditDataSet(Dokument);
                    DokumentPAR_DELIVERY_TYPE.AsInteger:=DELIVERY_TYPE_NOTSMDO;
                    //begin "в ответ на"  PAR_IDNUMBER, PAR_REGNUMBER, PAR_REGDATE,PAR_PARORG, PAR_LASTMSG, PAR_PARMSG
                    DokumentPAR_REGNUMBER.AsString:=GetValueFieldEx(arrrec, 'DOC_IND', '');
                    WriteDateFieldV(DokumentPAR_REGDATE, GetValueFieldEx(arrrec, 'DOC_DATE', 0));
                    DokumentPAR_IDNUMBER.AsString:='';
                    DokumentPAR_PARORG.AsString:='';
                    DokumentPAR_LASTMSG.AsString:='';
                    DokumentPAR_PARMSG.AsString:='';
                    //end "в ответ на"
                  end;
                end;
              end;
            end;
          end;
        end;
      finally

      end;
    end;
  end;
end;
//--------------------------------------------------------------
function TfmSMDODoc.getDeliveryType:Integer;
begin
  Result:=DELIVERY_TYPE_EMPTY;
  if (edOtvet_DeliveryType.ItemIndex=1) then begin
    Result:=DELIVERY_TYPE_SMDO;
  end else if (edOtvet_DeliveryType.ItemIndex=2) then begin
    Result:=DELIVERY_TYPE_NOTSMDO;
  end;
end;
//--------------------------------------------------------------
procedure TfmSMDODoc.edOtvet_DeliveryTypeChange(Sender: TObject);
var
  nType:Integer;
begin
  if not IsReadDokument then begin
    nType:=getDeliveryType;
    OtvetNaClear;
    if nType=DELIVERY_TYPE_EMPTY then begin
      EditDataSet(Dokument);
      DokumentMSG_TYPE.AsInteger:=MSG_TYPE_D;  // осн. документ
      CheckOtvet(-1,-1,1);
    end else begin
      EditDataSet(Dokument);
      DokumentMSG_TYPE.AsInteger:=MSG_TYPE_O;  // документ ответа
      if nType=DELIVERY_TYPE_NOTSMDO  // не по почте СМДО
        then CheckOtvet(-1, -1, 0)     // ручной ввод номера и даты
        else CheckOtvet(-1, -1, 1);    // переключаем в ReadOnly
    end;
  end;
end;
//--------------------------------------------------------------
procedure TfmSMDODoc.CheckOtvet(nVisible:Integer; nEnabled:Integer; nReadOnly:Integer);
var
  l:Boolean;
begin
  if nVisible>-1 then begin
    l:=(nVisible=1);
    lbOtvet1.Visible:=l;
    lbOtvet2.Visible:=l;
    lbOtvet3.Visible:=l;
    edOtvet_DeliveryType.Visible:=l;
    edOtvet_Regnumber.Visible:=l;
    edOtvet_Regdate.Visible:=l;
  end;
  if nEnabled>-1 then begin
    l:=(nEnabled=1);
    lbOtvet1.Enabled:=l;
    lbOtvet2.Enabled:=l;
    lbOtvet3.Enabled:=l;
    edOtvet_DeliveryType.Enabled:=l;
    edOtvet_Regnumber.Enabled:=l;
    edOtvet_Regdate.Enabled:=l;
  end;
  if nReadOnly>-1 then begin
    l:=(nReadOnly=1);            
    edOtvet_Regnumber.ReadOnly:=l;
    edOtvet_Regdate.ReadOnly:=l;
    if l then begin
      edOtvet_Regnumber.Color:=clInfoBk;
      edOtvet_Regdate.Color:=clInfoBk;
//      edOtvet_Regnumber.EditButtons[0].Visible:=true;
    end else begin
      edOtvet_Regnumber.Color:=clWindow;
      edOtvet_Regdate.Color:=clWindow;
//      edOtvet_Regnumber.EditButtons[0].Visible:=false;
    end;
  end;
end;
//--------------------------------------------------------------
procedure TfmSMDODoc.edOtvet_RegnumberEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
end;
//--------------------------------------------------------------
procedure TfmSMDODoc.OtvetNaClear;
begin
  EditDataSet(Dokument);
//  DokumentPAR_DELIVERY_TYPE.AsInteger:=9;
  DokumentPAR_PARORG.AsString:='';
  DokumentPAR_IDNUMBER.AsString:='';
  DokumentPAR_PARMSG.AsString:='';
  DokumentPAR_REGNUMBER.AsString:='';
  DokumentPAR_REGDATE.AsString:='';
  DokumentPAR_LASTMSG.AsString:='';
end;
//--------------------------------------------------------------
function TfmSMDODoc.getDocParentText: String;
var
  d:TDateTime;
begin
  if DokumentPAR_REGNUMBER.AsString='' then begin
    Result:=''
  end else begin
    if DokumentPAR_REGDATE.IsNull then d:=0 else d:=DokumentPAR_REGDATE.AsDateTime;
    Result:='исходящий № '+DokumentPAR_REGNUMBER.AsString;
    if d>0 then Result:=Result+' от '+FormatDateTime('dd.mm.yyyy',d);
  end;
end;
//--------------------------------------------------------------
procedure TfmSMDODoc.lbDocParentGetText(Sender: TObject;  var Text: String);
begin
  Text:=getDocParentText;
  if Text=''
    then Text:='---';
end;
function TfmSMDODoc.IsReady: Boolean;
begin
  Result:=not TBItemNotReady.Checked;
end;
//-------------------------------------------------------------------
function TfmSMDODoc.CheckDokumentSimple(nType: Integer;  lWriteDok: Boolean): Boolean;
var
  sMsgID,strErr,ss,sSubj:String;
  fld:TField;
  lBegin,l,lReadyReg:Boolean;
  n,m:Integer;
  procedure AddErr(s:String); begin
    if not lBegin then strErr:=strErr+'Заполните реквизит: '#13#10;
    strErr:=strErr+s+chr(13)+chr(10);
    lBegin:=true;
  end;
  procedure AddErrT(s:String); begin
    if not lBegin then strErr:=strErr+'Задание <'+tbTaskNOMER.AsString+'>: '#13#10;
    strErr:=strErr+s+chr(13)+chr(10);
    lBegin:=true;
  end;
  procedure AddErrF(s:String); begin
    if not lBegin then strErr:=strErr+'Доп. материал <'+InttoStr(tbFolderNOMER.AsInteger-999)+'>:'#13#10;
    strErr:=strErr+s+chr(13)+chr(10);
    lBegin:=true;
  end;
begin
  PostDokument;
  Result:=true;
  if SMDO.Demo then begin
    if (FMainTable.RecordCount >= SMDO.MaxCount)  then begin
      PutError('В демо-версии невозможно создать более '+IntToStr(SMDO.MaxCount)+' сообщений !');
      Result := false;
      exit;
    end;
  end;

  FAckDeliver:=0;
  FAckRegister:=0;
  FCreateAckRegister:=false;
  FCreateAckDeliver:=false;
  // входящее сообщение, рег. номер не пустой и уведомление не отправлялось
  if SubjIN and (DokumentMY_REGNUMBER.AsString<>'') and (DokumentACK_TYPE.AsInteger<>ACK_REGISTER) then begin
    with dmBase.WorkQuery do begin
      SQL.Text:='select * from smdoPost where ack_msg_id='+QStr(DokumentMSG_ID.AsString);  // уведомления для текущего документа
      Open;
      while not Eof do begin
        if FieldByName('ACK_TYPE').AsInteger=ACK_DELIVER then begin
          FAckDeliver:=FieldByName('ID').AsInteger;
        end;
        if FieldByName('ACK_TYPE').AsInteger=ACK_REGISTER then begin
          FAckRegister:=FieldByName('ID').AsInteger;
        end;
        Next;
      end;
      Close;
    end;
{   Dokument.Edit;
    if (FAckDeliver>0) and (DokumentACK_TYPE.AsInteger=0)
      then DokumentACK_TYPE.AsInteger:=ACK_DELIVER;
    if (FAckRegister>0) and (DokumentACK_TYPE.AsInteger<>ACK_REGISTER)
      then DokumentACK_TYPE.AsInteger:=ACK_REGISTER;
    Dokument.CheckBrowseMode; }

    if (FAckRegister=0) then begin  // не нашли уведомление
      FCreateAckRegister:=true;
    end;
  end;

  if SubjOUT and (DokumentSENT.AsInteger<>1) then begin   // исходящий

    strErr:='';
    lBegin:=false;

    tbTask.DisableControls;
    tbFolder.DisableControls;
    tbFiles.DisableControls;
    tbMens.DisableControls;
    lReadyReg:=true;
    sSubj:='';
    try

      if lWriteDok then begin
        //--- сформируем автоматически SUBJECT ----------------
        if SMDO.MsgIsAddDoc(DokumentMSG_TYPE.AsInteger) then begin
          tbReferred.Filtered:=false;
          tbReferred.First;
          sSubj:='';
          while not tbReferred.Eof do begin
            sSubj:=sSubj+getNameRef(tbReferred)+', ';
            tbReferred.Next;
          end;
          tbReferred.First;
          if sSubj='' then begin
            if Trim(DokumentTEXT.AsString)=''
              then AddErr('   Заголовок сообщения')
              else sSubj:=Trim(DokumentTEXT.AsString);
          end else begin
            sSubj:='дополнительно к исх. '+Copy(sSubj,1,Length(sSubj)-2);
          end;
        end else begin
          if Trim(DokumentMY_REGNUMBER.AsString)=''
            then sSubj:='документ не зарегистрирован'
            else sSubj:='исх. №'+Trim(DokumentMY_REGNUMBER.AsString)+' от '+FormatDateTime('dd.mm.yyyy',DokumentMY_REGDATE.AsDateTime)+'г.';
          ss:=getDocParentText;
          if ss<>'' then sSubj:=sSubj+' (в ответ на '+ss+')';
        end;
        //----------------------------------------------------

        if IsReady then begin

        if ((DokumentSMDOCODE.AsString=DELIVER_KEY) or (DokumentNAME.AsString=DELIVER_KEY)) then begin
          if FDeliver.Count=0  then AddErr('   Aдресат');
        end else begin
          if DokumentSMDOCODE.AsString='' then AddErr('   Aдресат');
        end;
        if DokumentMSG_ACKNOW.AsString='' then AddErr('   Требование ответа');
        if DokumentMSG_TYPE.AsString='' then  AddErr('   Тип');

        if DokumentPAR_DELIVERY_TYPE.AsString='' then begin
          AddErr('   В ответ на');
        end else begin
          m:=getDeliveryType;
          // считаем что для документа-ответа должен быть выбран "в ответ на"  (хотя по формату (2.1.1) это не обязательно)
          if (m=DELIVERY_TYPE_EMPTY) and (DokumentMSG_TYPE.AsInteger=MSG_TYPE_O)
            then AddErr('   Для типа "документ-ответа" не выбран "В ответ на"');

          if (m=DELIVERY_TYPE_SMDO) and (DokumentPAR_IDNUMBER.AsString='')
            then AddErr('   "В ответ на" не выбран документ');
          if ((m=DELIVERY_TYPE_NOTSMDO) or (m=DELIVERY_TYPE_SMDO)) and
             ((DokumentPAR_REGNUMBER.AsString='') or DokumentPAR_REGDATE.IsNull)
            then AddErr('   "В ответ на" не введен номер и дата документа');
        end;

        if SMDO.Demo and (tbFiles.RecordCount>1) then begin
          AddErr('В демо-версии не может быть более одного вложения');
        end;

        //---------- дополнения  ------------------------------------------------------------------
        if SMDO.MsgIsAddDoc(DokumentMSG_TYPE.AsInteger) then begin
          if DokumentMSG_TYPE.AsInteger=MSG_TYPE_DA then begin  // дополнение к документу
            if (tbTask.RecordCount=0) and (tbFolder.RecordCount=0)
              then AddErr('   "Задания" или "Доп. материалы" ');
          end else begin  // дополнение к документу ответа
            if (tbFolder.RecordCount=0)
              then AddErr('   "Доп. материалы" ');
          end;
          // КОНТРОЛЬ ССЫЛОК НА ДРУГИЕ ДОКУМЕНТЫ !!!
          tbReferred.Filtered:=false;
          tbReferred.First;
          if tbReferred.RecordCount=0
            then AddErr('   "Ссылки на ранее отправленные документы"');
        end else begin  //--- документ или докумен-ответа ------------------------------------------
          if Trim(DokumentMY_REGNUMBER.AsString)<>'' then begin  // проверяем докумен по полной

            if not MySameText(DokumentMY_REGNUMBER.AsString,NAME_NOT_REGISTER)
              then if DokumentMY_REGDATE.IsNull then AddErr('   Дата регистрации в СЭД');
            if DokumentDOC_TYPE.AsString=''   then AddErr('   Тип документа');
            if DokumentKIND.AsString=''  then begin
              AddErr('   Вид документа');
            end else begin
              if not dmBase.SMDOSprVidDok.Locate('NAME', DokumentKIND.AsString, []) then begin
                AddErr('   Вид документа');
              end;
            end;
            if DokumentPAGES.AsString=''      then AddErr('   Количество листов');
            if DokumentFLAG.AsString=''       then AddErr('   Тип органичения доступа');
            if DokumentCONFIDENT.AsString=''  then AddErr('   Органичение доступа(текст)');

            lBegin:=true;
            CheckFilterTables(TS_DOCUMENT);

            if tbFiles.RecordCount=0 then begin
              // если основной документ или документ ответа
              if not SMDO.MsgIsAddDoc(DokumentMSG_TYPE.AsInteger) then begin
                AddErr('Нет ни одного файла в документе');
              end;
            end else begin
              l:=false;
              while not tbFiles.Eof do begin
                if tbFilesSIGNATURE.AsString='' then l:=true;
                if not FileExists(getFileName(tbFiles))
                  then AddErr('Не найден файл "'+getFileName(tbFiles)+'"');
                tbFiles.Next;
              end;
              if l  then AddErr('Есть неподписанные файлы в документе');
            end;
            l:=false;
            if tbMens.RecordCount=0 then begin
              l:=true;
            end else begin
              l:=not tbMens.Locate('TIP', MEN_AUTHOR, []);
            end;
            if l then AddErr('Нет автора(подписавшего) документ');
          end else begin
            lReadyReg:=false;  // нет регистрации документа
          end;
        end;

        // КОНТРОЛЬ ЗАДАНИЙ и ДОП. ДОКУМЕНТОВ !!!
        //==========================================
        //======= КОНТРОЛЬ ЗАДАНИЙ
        //==========================================
        tbTask.CheckBrowseMode;
        tbTask.First;
        while not tbTask.Eof do begin
          lBegin:=false;
          CheckFilterTables(TS_TASK);
          if Trim(tbTaskNOMER.AsString)='' then AddErrT('  Заполните номер задания');
          if Trim(tbTaskTEXT.AsString)='' then AddErrT('   Заполните текст задания');
          if not tbMens.Locate('TIP', MEN_AUTHOR, []) then AddErrT('   Нет ни одного автора в задании');
          if tbTaskFLAG.AsString=''       then AddErrT('   Тип органичения доступа');
          if tbTaskCONFIDENT.AsString=''  then AddErrT('   Органичение доступа(текст)');
          if tbTaskDEADLINE.AsString=''   then AddErrT('   Срок исполнения');
          if tbFiles.RecordCount=0 then begin
            AddErrT('   Нет ни одного файла в задании');
          end else begin
            l:=false;
            while not tbFiles.Eof do begin
              if tbFilesSIGNATURE.AsString='' then l:=true;
              if not FileExists(getFileName(tbFiles))
                then AddErrT('Не найден файл "'+getFileName(tbFiles)+'"');
              tbFiles.Next;
            end;
            if l then AddErrT('   Есть неподписанные файлы в задании');
          end;
          l:=false;
          if tbMens.RecordCount=0 then begin
            l:=true;
          end else begin
            l:=not tbMens.Locate('TIP', MEN_AUTHOR, []);
          end;
          if l then AddErrT('Нет автора задания');
          tbTask.Next;
        end;
        tbTask.First;

        //==========================================
        //======= КОНТРОЛЬ FOLDER
        //==========================================
        tbFolder.First;
        while not tbFolder.Eof do begin
          lBegin:=false;
          CheckFilterTables(TS_ADDDOC);
          if tbFolderADD_TYPE.AsString=''       then AddErrF('  Тип папки');
          if Trim(tbFolderCONTENTS.AsString)='' then AddErrF('  Содержимое');
          if tbFiles.RecordCount>0 then begin
            l:=false;
            while not tbFiles.Eof do begin
              if tbFilesSIGNATURE.AsString='' then l:=true;
              if not FileExists(getFileName(tbFiles))
                then AddErrF('Не найден файл "'+getFileName(tbFiles)+'"');
              tbFiles.Next;
            end;
            if l then AddErrF('   Есть неподписанные файлы');
          end;
          // должны быть обязательно ссылки
          if (tbFolderADD_TYPE.AsInteger=ADD_TYPE_REF) and (tbReferredAdd.RecordCount=0) then begin
            AddErrF('   Необходима ссылка на документ');
          end;

          tbFolder.Next;
        end;
        tbFolder.First;

        if DokumentID.AsInteger<=0  then AddErr('Ошибка создания документа!');

        if strErr<>'' then begin
          FLastError:=strErr;
          Result:=false;
        end;

        end;  // IsRead

        EditDataSet(Dokument);
        DokumentSUBJECT.AsString:=sSubj;
        if Result and IsReady and lReadyReg then begin
          DokumentSENT.AsInteger:=0;   // готов к отправке
          DokumentDTSTAMP.AsDatetime:=Now;
        end else begin
          DokumentSENT.AsInteger:=-1;   // не готов к отправке
          DokumentDTSTAMP.Asstring:='';
        end;
        PostDataSet(Dokument);

      end;   // lWriteDok
    finally
      tbFiles.EnableControls;
      tbMens.EnableControls;
      tbTask.EnableControls;
      tbFolder.EnableControls;
      CheckFilterTables;
    end;

  end;  // SubjOut

end;
//---------------------------------------------------------------------
procedure TfmSMDODoc.TBItemChoiceInClick(Sender: TObject);
begin
  ChoiceFilesFromSMDO(1);
end;
//---------------------------------------------------------------------
procedure TfmSMDODoc.TBItemChoiceOutClick(Sender: TObject);
begin
  ChoiceFilesFromSMDO(2);
end;
//---------------------------------------------------------------------
procedure TfmSMDODoc.ChoiceFilesFromSMDO(nType:Integer);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  i,nID:Integer;
  nPostID, nParentID:Integer;
  sDate,sFile,sCode:String;
begin
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SMDOPOST');
  if Opis <> nil then begin
    v := null;
    if nType=1 then begin
      Opis.Caption:='Входящие сообщения';
    end else begin
      Opis.Caption:='Исходящие сообщения';
    end;
    if not Role.SystemAdmin
      then sDate:=' and datepost>CTOTS('+QStr(FormatDateTime(dmBase.AdsSettings.DateFormat+' hh:nn:ss',IncMonth(Now,-1)))+')'
      else sDate:='';
    if (DokumentSMDOCODE.AsString<>'') and (DokumentSMDOCODE.AsString<>DELIVER_KEY)
      then sCode:=' and SMDOCODE='+QStr(DokumentSMDOCODE.AsString)
      else sCode:='';
    // входящее или исходящее сообщение, не уведомление, не ошибочное за последний месяц
    dmBase.SMDOPost.Filter:='SUBJ_TYPE='+IntToStr(nType)+' and MSG_TYPE>0 '+sDate+sCode;
    dmBase.SMDOPost.Filtered:=true;
    try
      if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
        if v <> null then begin
          nID:=v;
          dmBase.SMDOFile.IndexName:='POST_KEY';
          dmBase.SMDOFile.SetRange([nID],[nID]);  // файлы документа   dmBase.SMDOFile.SetRange([nID,nID],[nID,nID])
          dmBase.SMDOFile.First;
          try
            while not dmBase.SMDOFile.Eof do begin
              sFile:=getFileName(dmBase.SMDOFile);
              if FileExists(sFile) then begin
                nPostID:=DokumentID.AsInteger;
                nParentID:=getCurrentParent;
                AddFile(sFile, nPostID, nParentID,'');
                EditDataSet(tbFiles);
                tbFilesSIGNATURE.AsString:=dmBase.SMDOFile.FieldByName('SIGNATURE').AsString;
                tbFilesSIGNINFO.AsString:=dmBase.SMDOFile.FieldByName('SIGNINFO').AsString;
                PostDataSet(tbFiles);
              end;
              dmBase.SMDOFile.Next;
            end;
          finally
            dmBase.SMDOFile.CancelRange;
          end;
        end;
      end;
    finally
      dmBase.SMDOPost.Filtered:=false;
    end;
  end;
end;
//---------------------------------------------------------------------
function TfmSMDODoc.ChoiceFromSMDO(nType:Integer; var arrRec:TCurrentRecord; sOrg:String):Integer;
var
  Opis : TOpisEdit;
  v : Variant;
//  arrRec : TCurrentRecord;
  i,nID:Integer;
  sAdd,sFile:String;
begin
  Result:=0;
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SMDOPOST');
  if Opis <> nil then begin
    v := null;
    if nType=1 then begin
      Opis.Caption:='Входящие сообщения';
      sAdd:='';
    end else begin
      Opis.Caption:='Исходящие сообщения';
      sAdd:=' and SENT=1';  // отправленные
    end;                                                     //  документ или  док.-ответа
    dmBase.SMDOPost.Filter:='SUBJ_TYPE='+IntToStr(nType)+' and (MSG_TYPE=1 or MSG_TYPE=3) and SUBJ_ERROR=false'+sAdd;   // входящее или исходящее сообщение, не дополнение, не уведомление, не ошибочное
    if sOrg<>''
      then dmBase.SMDOPost.Filter:=dmBase.SMDOPost.Filter+' and SMDOCODE='+QStr(sOrg);
    dmBase.SMDOPost.Filtered:=true;
    try
      if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
        Result:=v;
      end;
    finally
      dmBase.SMDOPost.Filtered:=false;
    end;
  end;
end;

//------------------------------------------------------------
procedure TfmSMDODoc.pcChange(Sender: TObject);
var
  n:Integer;
begin
  n:=CurrentTS;
  case n of
    TS_DOCUMENT : begin
                    gbFiles.Parent:=tsDoc;
                    gbMens.Parent:=tsDoc;
                  end;
    TS_TASK     : begin
                    gbFiles.Parent:=tsTask;
                    gbMens.Parent:=tsTask;
                  end;
    TS_ADDDOC   : begin
                    gbFiles.Parent:=tsAddDoc;
                    gbMens.Parent:=tsDoc;
                  end;
  end;
  CheckFilterTables;
  case n of
    TS_DOCUMENT : begin
                    TBItemAddNew.Enabled:=false;
                    TBItemAddDel.Enabled:=false;
                    if (edMsgType.ItemIndex>-1) and
                       SMDO.MsgIsAddDoc( StrToInt(edMsgType.KeyItems[edMsgType.ItemIndex]) ) then begin
                      CheckEnabledDoc(false);
                    end else begin
                      CheckEnabledDoc(true);
                    end;
                  end;
    TS_TASK     : begin
                    tbTask.First;
                    CheckEnabledTask;
                  end;
    TS_ADDDOC   : begin
                    tbFolder.First;
                    CheckEnabledFolder;
                  end;
  end;
end;
//-------------------------
procedure TfmSMDODoc.gbEnabled(gb:TWinControl; lSet:Boolean);
var
  i:Integer;
  l:Boolean;
begin
  gb.Enabled:=lSet;
  for i:=0 to gb.ControlCount-1 do begin
    gb.Controls[i].Enabled:=lSet;
    if gb.Controls[i] is TWinControl then begin
      gbEnabled(TWinControl(gb.Controls[i]),lSet);
    end;
  end;
  l:=not DocReadOnly;
  btAddFile.Enabled:=l;
  btDelFile.Enabled:=l;
  btAddMen.Enabled:=l;
  btDelMen.Enabled:=l;
end;
//-------------------------
procedure TfmSMDODoc.CheckEnabledDoc(lSet:Boolean);
begin
  pnDoc.Enabled:=lSet;
  gbEnabled(pnDoc,lSet);
  gbEnabled(gbFiles,lSet);
  gbEnabled(gbMens,lSet);
  tsDoc.Enabled:=lSet;

  if (SMDO.VersionXML_OUT>=211) and lSet
    then CheckOtvet(-1,1,-1)
    else CheckOtvet(-1,0,-1); //btOtvetNa.Enabled:=false;

  edMyRegNumber.Enabled:=lSet;
  edMyRegDate.Enabled:=lSet;
  if lSet then begin
    edMyRegNumber.Color:=clInfoBk;
    edMyRegDate.Color:=clInfoBk;
  end else begin
    edMyRegNumber.Color:=clBtnFace;
    edMyRegDate.Color:=clBtnFace;
  end;
end;
//-------------------------
procedure TfmSMDODoc.CheckEnabledTask;
var
  l:Boolean;
  i:Integer;
begin
  l:=(tbTask.RecordCount>0);
  pnTask.Enabled:=l;
  gbEnabled(pnTask,l);
  if gbFiles.Parent=tsTask then begin
    gbEnabled(gbFiles,l);
    gbEnabled(gbMens,l);
  end;
  TBItemAddNew.Caption:='Добавить задание';
  TBItemAddDel.Caption:='Удалить задание';
  TBItemAddNew.Enabled:=not DocReadOnly;
  TBItemAddDel.Enabled:=not DocReadOnly;
end;
procedure TfmSMDODoc.CheckEnabledFolder;
var
  l:Boolean;
begin
  l:=(tbFolder.RecordCount>0);
  pnFolder.Enabled:=l;
  gbEnabled(pnFolder,l);
  if gbFiles.Parent=tsAddDoc then begin
    gbEnabled(gbFiles,l);
  end;
  TBItemAddNew.Caption:='Добавить дополнительный материал';
  TBItemAddDel.Caption:='Удалить дополнительный материал';
  TBItemAddNew.Enabled:=not DocReadOnly;
  TBItemAddDel.Enabled:=not DocReadOnly;
end;
//-------------------------
procedure TfmSMDODoc.vchDBText1GetText(Sender: TObject; var Text: String);
begin
  if tbFolder.Active and (tbFolder.RecordCount>0) then begin
    Text:=Inttostr(tbFolder.RecNo)+'/'+Inttostr(tbFolder.RecordCount);
    if tbFolderTASK_ID_SOURCE.AsInteger>0  then begin
      ImAddMat.Visible:=true
    end else begin
      ImAddMat.Visible:=false;
    end;
  end else begin
    Text:='';
    ImAddMat.Visible:=false;
  end;
end;
//-------------------------
procedure TfmSMDODoc.vchDBText2GetText(Sender: TObject; var Text: String);
begin
  if tbTask.Active and (tbTask.RecordCount>0)
    then Text:=Inttostr(tbTask.RecNo)+'/'+Inttostr(tbTask.RecordCount)
    else Text:='';
end;

//---------------------------------------------------------------------
procedure TfmSMDODoc.TBItemAddNewClick(Sender: TObject);
var
  sErr:String;
  n:Integer;
begin
  PostDokument;
  sErr:='';
  if CurrentTS=TS_TASK then begin
    if tbTaskTASK_ID.AsInteger>0  then begin
      if Trim(tbTaskText.AsString)='' then begin
        sErr:='Заполните текст текущего задания';
      end;
      if sErr='' then begin
        if tbFiles.RecordCount=0 then begin
          sErr:='Нет ни одного файла в текущем задании';
        end;
      end;
      if sErr='' then begin
        if not tbMens.Locate('TIP', MEN_AUTHOR, []) then begin
          sErr:='Нет ни одного автора в текущем задании';
        end;
      end;
    end;
    if sErr='' then begin
      n:=tbTask.RecordCount+1;
      if Problem('  Добавить задание ?  ',mtConfirmation,self)  then begin
        tbTask.Append;
        tbTaskPOST_ID.AsInteger:=DokumentID.AsInteger;
        tbTaskTASK_ID.AsInteger:=dmBase.GetNewID(_TypeObj_SMDOPost);
        tbTaskNOMER.AsInteger:=n;
        tbTaskTASKNUMBER.AsInteger:=n;
        tbTaskTASKDATE.AsDateTime:=Date;
        tbTaskFLAG.AsInteger:=0;
        tbTaskCONFIDENT.AsString:='Общий';
        tbTaskTASK_REG.AsBoolean:=false;
        tbTaskTASK_COPY.AsBoolean:=false;
        tbTask.Post;
        QueryExit:=true;
      end;
    end else begin
      PutError(sErr);
    end;
    CheckEnabledTask;
    CheckFilterTables;
  end;
  if CurrentTS=TS_ADDDOC then begin
    if tbFolderTASK_ID.AsInteger>0  then begin
      if Trim(tbFolderCONTENTS.AsString)='' then begin
        sErr:='Заполните содержимое дополнительного материала';
      end;
    end;
    if sErr='' then begin
      n:=tbFolder.RecordCount+1001;
      if Problem('  Добавить дополнительный материал ?  ',mtConfirmation,self)  then begin
        tbFolder.Append;
        tbFolderPOST_ID.AsInteger:=DokumentID.AsInteger;
        tbFolderTASK_ID.AsInteger:=dmBase.GetNewID(_TypeObj_SMDOPost);
        tbFolderNOMER.AsInteger:=n;
        tbFolder.Post;
        QueryExit:=true;
      end;
    end else begin
      PutError(sErr);
    end;
    CheckEnabledFolder;
    CheckFilterTables;
  end;
end;
//---------------------------------------------------------------------
procedure TfmSMDODoc.tbTaskAfterScroll(DataSet: TDataSet);
begin
//  label4.Caption:=tbTaskNOMER.AsString;
  CheckEnabledTask;
  CheckFilterTables;
end;

procedure TfmSMDODoc.tbFolderAfterScroll(DataSet: TDataSet);
begin
  CheckEnabledFolder;
  CheckFilterTables;
end;
//---------------------------------------------------------------------
procedure TfmSMDODoc.TBItemAddDelClick(Sender: TObject);
begin
  PostDokument;
  if CurrentTS=TS_TASK then begin
    if tbTaskTASK_ID.AsInteger>0  then begin
      // удаление людей и файлов
      // должен стоять фильтр
      tbMens.First;
      while not tbMens.Eof do tbMens.Delete;
      tbReferredTask.First;
      while not tbReferredTask.Eof do tbReferredTask.Delete;
      tbFiles.First;
      while not tbFiles.Eof do File_Delete;
      tbTask.Delete;
      CheckEnabledTask;
      CheckFilterTables;
      QueryExit:=true;
    end;
  end;
  if CurrentTS=TS_ADDDOC then begin
    if tbFolderTASK_ID.AsInteger>0  then begin
      tbReferredAdd.First;
      while not tbReferredAdd.Eof do tbReferredAdd.Delete;
      tbFolder.Delete;
      // удаление файлов
      while not tbFiles.Eof do File_Delete;
      CheckEnabledFolder;
      CheckFilterTables;
      QueryExit:=true;
    end;
  end;
end;
//--------------------------------------------------
procedure TfmSMDODoc.File_Delete;
begin
  if tbFilesSTORE_KIND.AsInteger=STORE_KIND_PATH then begin
    DeleteFile(getFileName(tbFiles));
  end;
  tbFiles.Delete;
end;
//--------------------------------------------------
procedure TfmSMDODoc.PostDokument;
begin
  inherited;
  tbFolder.CheckBrowseMode;
  tbTask.CheckBrowseMode;
  tbMens.CheckBrowseMode;
  tbFiles.CheckBrowseMode;
end;

procedure TfmSMDODoc.lbSMDOCodeClick(Sender: TObject);
var
  sl, slShow:TStringList;
  i:INteger;
//  s:string;
begin
  if (DokumentSMDOCODE.AsString=DELIVER_KEY) then begin
    sl:=TStringList.Create;
    slShow:=TStringList.Create;
    sl.CommaText:=edName.Text;
//    s:='';
    for i:=0 to sl.Count-1 do begin
      if dmBase.SMDOSprOrg.Locate('smdocode', sl.Strings[i], []) then begin
//        s:=s+dmBase.SMDOSprOrg.FieldByName('shortname').AsString+#13#10;
        slShow.Add(sl.Strings[i]+' '+dmBase.SMDOSprOrg.FieldByName('shortname').AsString);
      end;
    end;
    sl.Free;
    if slShow.Count>0 then ShowMemo(slShow, 'Список рассылки', '50;50;700;600');
    slShow.Free;
  end;
end;

procedure TfmSMDODoc.dsFilesDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) and not FRun and not FRead
    then  QueryExit:=true;
end;

procedure TfmSMDODoc.dsMensDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) and not FRun and not FRead
    then  QueryExit:=true;
end;

procedure TfmSMDODoc.N1Click(Sender: TObject);
begin
//  AddReferred(3);
end;

procedure TfmSMDODoc.N2Click(Sender: TObject);
begin
//  DeleteReferred(3);
end;
//------------------------------------------------
procedure TfmSMDODoc.AddCurList(Grid: TDbGridEh);       //  fSimpleD
begin
//
end;
//---------------------------------------------------
function TfmSMDODoc.GetNameRef(ds:TDataSet):String;
var
  s:String;
begin
  if ds.FieldByName('REGNUMBER').AsString<>'' then  begin
    if ds.FieldByName('REGDATE').IsNull
      then s:=''
      else s:=' от '+DatePropis(ds.FieldByName('REGDATE').AsDateTime,3)+'г.';
    Result:='№ '+ds.FieldByName('REGNUMBER').AsString+s;
  end else begin
    Result:='';
  end;
end;
procedure TfmSMDODoc.grReferredAddColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=GetNameRef(tbReferredAdd);
end;
procedure TfmSMDODoc.grReferredTaskColumns0GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=GetNameRef(tbReferredTask);
end;
procedure TfmSMDODoc.grReferredRColumns0GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=GetNameRef(tbReferredR);
end;

procedure TfmSMDODoc.TBItemAddListClick(Sender: TObject);
var
  nID,n:Integer;
  arrRec:TCurrentRecord;
  d:TDateTime;
  lReceiver:Boolean;
  sOrg:String;
begin
//  ShowMessage(ActiveControl.Name);
  tbReferred.CheckBrowseMode;
  if MySameText( ActiveControl.Name, 'grReferredR') then begin
    lReceiver:=true;
    nID:=0;
  end else begin
    lReceiver:=false;
    nID:=getCurrentParent;
  end;
  tbReferred.First;
  n:=0;
  while not tbReferred.Eof do begin
    if tbReferredPARENT_ID.AsInteger=nID then begin
      n:=n+1;
    end;
    tbReferred.Next;
  end;
  tbReferred.First;
  if n>0 then begin
    ShowMessageCont('Допускается только одна ссылка',self);
    exit;
  end;
  if (DokumentSMDOCODE.AsString<>'') and  (DokumentSMDOCODE.AsString<>DELIVER_KEY)
    then sOrg:=DokumentSMDOCODE.AsString
    else sOrg:='';
  nID:=ChoiceFromSMDO(2, arrRec, sOrg);
  if (nID>0) and (DokumentSMDOCODE.AsString=DELIVER_KEY) then begin
    if GetValueFieldEx(arrRec, 'NAME', '*')<>DokumentNAME.AsString then begin
      nID:=0;
      ShowMessageCont('Адресаты выбранной и ранее отправленной рассылки не совпадпют:'+CRLF+
                      '"'+GetValueFieldEx(arrRec, 'NAME', '*')+'"'+CRLF+
                      '"'+DokumentNAME.AsString+'"',self);
    end;
  end;
  if nID>0 then begin
{      <Referred idnumber="ссылка на докум. пришедший в зоне Document или Task" retype="1-ссылка на док. 2-ссылка на задание" >
          <Regnumber regdate="YYYY-MM-DD" >регистрационный номер</Regnumber>  <!-- 0-1 или -->
          <TaskNumber taskdate="YYYY-MM-DD" >номер задания</TaskNumber>       <!-- 0-1 -->
        </Referred>  }
//    tbReferredPOST_ID.AsInteger:=DokumentID.AsInteger;
    if DokumentSMDOCODE.AsString='' then begin
      EditDataSet(Dokument);
      WriteSMDOCODE(GetValueFieldEx(arrRec, 'SMDOCODE', ''));
      DokumentNAME.AsString:=GetValueFieldEx(arrRec, 'NAME', '');
    end;
    tbReferred.Append;
    if lReceiver then begin
      tbReferredPARENT_ID.AsInteger:=0;  // !!!  для Receiver, для документа будет DokumentID.AsInteger
    end else begin
      tbReferredPARENT_ID.AsInteger:=getCurrentParent;
    end;
    d:=GetValueFieldEx(arrRec, 'MY_REGDATE', 0);
    if d>0
      then tbReferredREGDATE.AsDateTime:=d;
    tbReferredREGNUMBER.AsString:=GetValueFieldEx(arrRec, 'MY_REGNUMBER', 'без номера');
    tbReferredIDNUMBER.AsInteger:=nID;
    tbReferredRETYPE.AsInteger:=1;
    tbReferred.Post;

    Check_slGrid;
  end
end;
//---------------------------------------------------------
procedure TfmSMDODoc.TBItemDelListClick(Sender: TObject);
begin
  DestroyHint(H);
  if ActiveControl is TDbGridEh then begin
    if not TDbGridEh(ActiveControl).DataSource.DataSet.IsEmpty then begin
      if Problem(' Удалить ссылку ? ',mtConfirmation,Self) then begin
        QueryExit:=true;
        TDbGridEh(ActiveControl).DataSource.DataSet.Delete;
      end;
    end;
  end;
  Check_slGrid;
end;
//---------------------------------------------------------
procedure TfmSMDODoc.FormResize(Sender: TObject);
begin
  inherited;
//  StaticText14.Left:=Panel6.Left+2;
end;
//---------------------------------------------------------
procedure TfmSMDODoc.tbReferredAfterPost(DataSet: TDataSet);
begin
  grReferredR.VertScrollBar.Visible:=tbReferredR.RecordCount>0;
  grReferredAdd.VertScrollBar.Visible:=tbReferredAdd.RecordCount>0;
  grReferredTask.VertScrollBar.Visible:=tbReferredTask.RecordCount>0;
end;
//---------------------------------------------------------
procedure TfmSMDODoc.edMsgTypeChange(Sender: TObject);
begin
  pcChange(nil);
end;
//---------------------------------------------------------
procedure TfmSMDODoc.AfterReadDok;
begin
  TBItemZAGS.Visible:=false;
  {$IFDEF GISUN}
    CheckAkt_GISUN(0);
    BeforeEditFormGISUN;
  {$ENDIF}
end;
//-----------------------------------------------------------------------------
function TfmSMDODoc.SaveOneFile(ds:TDataSet; sDir:String):Boolean;
var
  sFile, sFileC:String;
begin
  Result:=false;
  sFile:=CheckSleshN(NormDir(ds.FieldByName('PATH').AsString))+ds.FieldByName('NAME').AsString;
  if FileExists(sFile) then begin
    sFileC:=CheckSleshN(sDir)+ds.FieldByName('NAME').AsString;
    if CopyFile(PChar(sFile), PChar(sFileC), true) then begin
      Result:=true;
//        ShellExecute(Application.Handle, nil, PChar(sFileC), nil, nil, SW_SHOWNORMAL);
    end else begin
      PutError('Ошибка копирования файла : '+#13+'  '+
             sFile+#13+' в '+
             sFileC+#13+
             IntToStr(GetLastError)+' ('+SysErrorMessage(GetLastError)+') ');
    end;
  end else begin;
    PutError('Файл "'+sFile+'" не найден.');
  end;
end;
//-----------------------------------------------------------------------------
procedure TfmSMDODoc.pmFiles_SaveClick(Sender: TObject);
var
  sFile, sFileC, sDir:String;
  ds:TDataSet;
begin
  ds:=tbFiles;
  if Trim(ds.FieldByName('NAME').AsString)=''
    then exit;
  sDir:=GlobalTask.GetLastValueAsString('LAST_SAVE_FOLDER');
  if sDir=''
    then sDir:=GetFolderMyDocument;
  if SelectDirectory('Выберите папку', '', sDir) then begin
    GlobalTask.SetLastValueAsString('LAST_SAVE_FOLDER', sDir);
    if SaveOneFile(ds, sDir)
      then ShellExecute(Application.Handle, PChar('explore'), PChar(sDir), nil, nil, SW_SHOWNORMAL);
  end;
end;
//-----------------------------------------------------------------------------
procedure TfmSMDODoc.pmFilesAll_SaveClickClick(Sender: TObject);
var
  sFile, sFileC, sDir:String;
  ds:TDataSet;
  l,lOk:Boolean;
begin
  ds:=tbFiles;
  sDir:=GlobalTask.GetLastValueAsString('LAST_SAVE_FOLDER');
  if sDir=''
    then sDir:=GetFolderMyDocument;
  if SelectDirectory('Выберите папку', '', sDir) then begin
    GlobalTask.SetLastValueAsString('LAST_SAVE_FOLDER', sDir);
    l:=dbDisableControls(ds);
    ds.First;
    lOk:=false;
    try
      while not ds.Eof do begin
        if Trim(ds.FieldByName('NAME').AsString)<>'' then begin
          lOk:=SaveOneFile(ds, sDir);
        end;
        ds.Next;
      end;
    finally
      ds.First;
      dbEnableControls(ds,l);
    end;
    if lOk
      then ShellExecute(Application.Handle, PChar('explore'), PChar(sDir), nil, nil, SW_SHOWNORMAL);
  end;
end;
//-----------------------------------------------------------------------------
procedure TfmSMDODoc.pmFilesWithETSP64_SaveClick(Sender: TObject);
begin
  SaveFilesWithETSP(true);
end;
//-----------------------------------------------------------------------------
procedure TfmSMDODoc.pmFilesWithETSP_SaveClick(Sender: TObject);
begin
  SaveFilesWithETSP(false);
end;
//-----------------------------------------------------------------------------
procedure TfmSMDODoc.SaveFilesWithETSP(lBase64:Boolean);
var
  s, sFile, sFileC, sPath, sDir:String;
  ds:TDataSet;
  slSign:TStringList;
  i:Integer;
begin
  ds:=tbFiles;
  if Trim(ds.FieldByName('NAME').AsString)=''
    then exit;
  sDir:=GlobalTask.GetLastValueAsString('LAST_SAVE_FOLDER');
  if sDir=''
    then sDir:=GetFolderMyDocument;
  if SelectDirectory('Выберите папку', '', sDir) then begin
    GlobalTask.SetLastValueAsString('LAST_SAVE_FOLDER', sDir);
    sPath:=CheckSleshN(NormDir(ds.FieldByName('PATH').AsString));
    sFile:=sPath+ds.FieldByName('NAME').AsString;
    if FileExists(sFile) then begin
      s:=ds.FieldByName('NAME').AsString;
      i:=LastPos('.', ds.FieldByName('NAME').AsString);
      if i>0
        then s:=Copy(s,1,i-1);
      sDir:=CheckSleshN(sDir)+s+'\'; //'Документ СМДО\';
      ForceDirectories(sDir);
      ClearDir(sDir,false);
      sFileC:=sDir+ds.FieldByName('NAME').AsString;
      MemoWrite(sDir+'информация о подписавших.txt', ds.FieldByName('SIGNINFO').AsString);
      slSign:=TStringList.Create;
      StrToStrings(ds.FieldByName('SIGNATURE').AsString, slSign, chr(13)+chr(10), false);
      if lBase64 then begin
        for i:=0 to slSign.Count-1 do begin
          MemoWrite(sDir+'эцп'+IntToStr(i+1)+'.txt', slSign.Strings[i]);  // ??? DecodeString(slSign.Strings[i])
        end;
      end else begin
        for i:=0 to slSign.Count-1 do begin
          MemoWrite(sDir+'эцп'+IntToStr(i+1)+'.p7s', DecodeString(slSign.Strings[i]));  // ??? DecodeString(slSign.Strings[i])
        end;
      end;
      slSign.Free;
      if CopyFile(PChar(sFile), PChar(sFileC), true) then begin
        ShellExecute(Application.Handle, PChar('explore'), PChar(sDir), nil, nil, SW_SHOWNORMAL);
//        ShellExecute(Application.Handle, nil, PChar(sFileC), nil, nil, SW_SHOWNORMAL);
      end else begin
        PutError('Ошибка копирования файла : '+#13+'  '+
               sFile+#13+' в '+
               sFileC+#13+
               IntToStr(GetLastError)+' ('+SysErrorMessage(GetLastError)+') ');
        ClearDir(sDir,true);
      end;
    end else begin;
      PutError('Файл "'+sFile+'" не найден.');
    end;
  end;
end;
//--------------------------------------------
procedure TfmSMDODoc.pmFilesWithETSP_LoadClick(Sender: TObject);
var
  i,nPostID,nParentID:Integer;
  slSign:TStringList;
  sSign,sPath,s:String;
  lOk:Boolean;
  Searchrec:TSearchRec;
begin
  nPostID:=DokumentID.AsInteger;
  nParentID:=getCurrentParent;
  if (nPostID<=0) or (nParentID<=0) then begin
    PutError('Добавление файла в текущем режиме недоступно.');
    exit;
  end;
  if odFile.Execute and FileExists(odFile.FileName) then begin
    slSign:=TStringList.Create;
    sPath:=CheckSleshN(ExtractFilePath(odFile.FileName));
    //---эцп в base64 ----------------------------------------------------------------------------------
    lOk:=FindFirst(sPath+'*.эцп', faAnyFile, SearchRec) = 0;
    if lOk then begin
      repeat
        if (SearchRec.Name[1] <> '.') and (SearchRec.Attr and faVolumeID <> faVolumeID) and (SearchRec.Attr and faDirectory <> faDirectory) then begin
          MemoRead(sPath+SearchRec.Name,s);
//          s:=Trim(s);
          DelChars(s,chr(13)+chr(10)+' ');
          if s<>''
            then slSign.Add(s);
        end;
      until FindNext(SearchRec) <> 0;
    end;
    FindClose(SearchRec);
    //---эцп в base64 ----------------------------------------------------------------------------------
    lOk:=FindFirst(sPath+'эцп*.*', faAnyFile, SearchRec) = 0;
    if lOk then begin
      repeat
        if (SearchRec.Name[1]<>'.') and (UpperCase(RightStr(SearchRec.Name,3))<>'P7S') and (SearchRec.Attr and faVolumeID<>faVolumeID) and (SearchRec.Attr and faDirectory<>faDirectory) then begin
          MemoRead(sPath+SearchRec.Name,s);
          DelChars(s,chr(13)+chr(10)+' ');
          if s<>''
            then slSign.Add(s);
        end;
      until FindNext(SearchRec) <> 0;
    end;
    FindClose(SearchRec);
    //---эцп в двоичном виде !!! ----------------------------------------------------------------------------------
    lOk:=FindFirst(sPath+'*.p7s', faAnyFile, SearchRec) = 0;
    if lOk then begin
      repeat
        if (SearchRec.Name[1]<>'.') and (SearchRec.Attr and faVolumeID <> faVolumeID) and (SearchRec.Attr and faDirectory <> faDirectory) then begin
          MemoRead(sPath+SearchRec.Name, s);
          s:=EncodeString(s);  // !!! переводим в Base64 !!!
          DelChars(s,chr(13)+chr(10)+' ');
          if s<>''
            then slSign.Add(s);
        end;
      until FindNext(SearchRec) <> 0;
    end;
    FindClose(SearchRec);
    sSign:='';
    for i:=0 to slSign.Count-1 do begin
      sSign:=sSign+slSign.Strings[i]+chr(13)+chr(10);
    end;
    if sSign='' then ShowMessage('Не найдено ни одного ЭЦП');
    AddFile(odFile.FileName, nPostID, nParentID, sSign);
    slSign.Free;
  end;
end;
//--------------------------------------------
procedure TfmSMDODoc.pmFiles_AddClick(Sender: TObject);
begin
  btAddFileClick(nil);
end;

procedure TfmSMDODoc.pmFiles_DelClick(Sender: TObject);
begin
  btDelFileClick(nil);
end;

procedure TfmSMDODoc.pmFiles_ETSPClick(Sender: TObject);
begin
  btETSPFileClick(nil);
end;

procedure TfmSMDODoc.pmFiles_OpenClick(Sender: TObject);
begin
  ViewFile(tbFiles);
end;

procedure TfmSMDODoc.pmMens_AddClick(Sender: TObject);
begin
  btAddMenClick(nil);
end;

procedure TfmSMDODoc.pmMens_DelClick(Sender: TObject);
begin
  btDelMenClick(nil);
end;

procedure TfmSMDODoc.pmMens_EditClick(Sender: TObject);
begin
  btEditMenClick(nil);
end;

procedure TfmSMDODoc.FormShow(Sender: TObject);
begin
  inherited;
//  FormResize(Sender);
end;


procedure TfmSMDODoc.Button1Click(Sender: TObject);
begin
  WriteReferredToOsnDoc;
end;

//------------------------------------------------------------------------------------------
procedure TfmSMDODoc.ReferredOpen(dsRef:TDataSet);
var
  nID:Integer;
  sName:String;
begin
  if dsRef.FieldByName('IDNUMBER').AsString<>'' then begin
    if dmBase.SMDOPost.Locate('SMDOCODE;IDNUMBER', VarArrayOf([DokumentSMDOCODE.AsString,dsRef.FieldByName('IDNUMBER').AsString]), []) then begin
      nID:=dmBase.SMDOPost.FieldByName('ID').AsInteger;   // ID сообщения в которое нужно записать
//      CheckUserName_frxDataSet;
      sName:=Self.Name;
      Self.Name:=sName+'_1';
      EditSMDODoc( nID, nil);
      Self.Name:=sName;
    end;
//    UnCheckUserName_frxDataSet;
    SetCurDok(Self);
  end;
end;

procedure TfmSMDODoc.grReferredRDblClick(Sender: TObject);
begin
  //ReferredOpen(tbReferredR);
end;

procedure TfmSMDODoc.grReferredAddDblClick(Sender: TObject);
begin
  //ReferredOpen(tbReferredAdd);
end;
//-----------------------------------------------------------
procedure TfmSMDODoc.edTitleDblClick(Sender: TObject);
begin
  TBItemEditMemo.Tag:=0;
  try
    inherited TBItemEditMemoClick(Sender);
  finally
    TBItemEditMemo.Tag:=0;
  end;
end;

procedure TfmSMDODoc.edKommDblClick(Sender: TObject);
begin edTitleDblClick(Sender); end;

procedure TfmSMDODoc.edTaskTextChange(Sender: TObject);
begin edTitleDblClick(Sender); end;

procedure TfmSMDODoc.edNoteDblClick(Sender: TObject);
begin edTitleDblClick(Sender); end;

procedure TfmSMDODoc.edFolderContensDblClick(Sender: TObject);
begin edTitleDblClick(Sender); end;

procedure TfmSMDODoc.edPrimDblClick(Sender: TObject);
begin edTitleDblClick(Sender); end;

procedure TfmSMDODoc.btTestAckClick(Sender: TObject);
var
  n:Integer;
begin
  if MySametext( DokumentMY_REGNUMBER.AsString,NAME_NOT_REGISTER)
     or MySametext( DokumentMY_REGNUMBER.AsString,NAME_NOT_OTKAZ)
     or MySametext( DokumentMY_REGNUMBER.AsString,NAME_NOT_ETSP)
    then n:=DOC_NOT_REGISTER
    else n:=DOC_REGISTER;
  SMDO.CreateAckResult(n, DokumentID.AsInteger, false, DokumentMSG_TYPE.AsInteger, DokumentADD_ACK.AsString);
end;
//----------------------------------------------------------------------------------------------------------
procedure TfmSMDODoc.btAdsSysClick(Sender: TObject);
begin
  edMyRegNumber.ReadOnly:=false;
  edMyRegDate.ReadOnly:=false;
  TBItemNotRegistr.Enabled:=true;
  TBItemRegIsx.Enabled:=true;
end;


end.
