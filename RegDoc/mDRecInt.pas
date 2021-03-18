unit mDRecInt;

interface

{$I Task.inc}

uses
   Classes, SysUtils, Controls, Dialogs, IniFiles, ComCtrls, DB, Menus, Windows,
   ShellApi, Messages, DateUtils, Graphics, Variants,
   ROPasScript, uPSRuntime, uPSCompiler, FuncPr, fChoiceNomen,
   {$IFDEF SMDO}  uSMDO, {$ENDIF}
   DBGridEh, DBCtrlsEh, DBLookupEh,
   AdsTable, kbmMemTable, ZipForge, uProject, uProjectAll, uUtilFiles,
   mAdsObj, mTplInt, mTempl, mFindInt, fTblEdit, fSprEdit, fDocInfo, dDocImg,
   fWait;

type
   TControlArray=array of TControl;

   TDocMain=class;
   TVisitBook=class;
   TInfoBook=class;
   TIncomingDoc=class;
   TOutgoingDoc=class;
   TAdmProcDoc=class;
   TSpAdmProc=class;
   TSpAdmProcU=class;{+}

   // ���� �������������� �����
   TDocInfo=(
      // ������ ������
      diBlank,
      // ����� ���������������� ���������, ��������� ������������
      diTotalExec,
      // �������� ������������� ���� ����������
      diSkipTerm,
      // ���� ���������� �������� ����� N ���� (N - �������� ���������� ParNextDay)
      diExpireTerm,
      // ��������� ����� �� ������
      diWaitAnswer,
      // ��������� �� ��������
      diCheck,
      // ��������� ����������� ��������������� �������, ��������� ������
      diNeedAnswer
   );

   // ��������� ���������� "06 ��������� �������"
   TDocRecordInterface=class(TObject)
   public
      //��� ���� ������ - ������������� ��� ��������
      FDatabaseName: string;
      //�������� ������:
      // ������ ������������ �����
      FEnumList: TEnumList;
      // ������ ���� �������� � ������������
      FDBList: TDBList;
      // ��� �����������
      FSprDBItems: TDBItemList;
      // ��� ������� (�������)
      FDocDBItems: TDBItemList;
      //�������:
      // �������� (��������� �������)
      FDocMain: TDocMain;
      // ������ ����� ������ �����������
      FVisitBook: TVisitBook;
      // ������ ����� �������� �������
      FInfoBook: TInfoBook;
      // ������ ����������� �������� ����������
      FDocIn: TIncomingDoc;
      // ������ ����������� ��������� ����������
      FDocOut: TOutgoingDoc;
      // ������ ����������� ���������������� ��������
      FAdmProc: TAdmProcDoc;
      //���������:
      // �����
      FFormLayoutIni: TMemIniFile;
      // �������
      FTableViewIni: TMemIniFile;
      // �����
      FFindIni: TMemIniFile;
      //�����:
      // ������ ��������
      FFindOperList: TOperList;
      // ������ ������������
      FFindSprList: TSprList;
      //��������� ����������:
      // ���������� �������� ������ ��� ������ (���������) - �� ��������� False
      FAdmOnlyRead: Boolean;
      //����������:
      // ��������� ������� � �������� ����������
      FTemplateInterface: TTemplateInterface;
   private
      // �������/�������
      function Open(DatabaseName: string): Boolean;
      procedure Close;
      // �������� ������
      procedure ShowDBItem(DBItem: TDBItem);
      //�����:
      procedure InitFindSprList(SprItems: TDBItemList; Enums: TEnumList);
      procedure InitFilterInterface(DBItem: TDBItem; BaseDir, RootCaption: string; ShowGroup: Boolean);
      //�������:
      function OnSelectFindValue(Spr: TSprItem; Ini: TCustomIniFile; Section: string; AutoSave: Boolean; var Value, ValCaption: string): Boolean;
   public
      constructor Create;
      destructor Destroy; override;
      //CreateDocRecordInterface - �������� � ������ mDRecData
      procedure BeforeClose;
      function AfterOpen(DatabaseName: string): Boolean;
      //�������� ������� ��������� �������
      procedure EditDoc;
      //�������� ������� ����� ������ �����������
      procedure EditVisitBook;
      //�������� ������� ����� �������� �������
      procedure EditInfoBook;
      //�������� ������� ����������� �������� ����������
      procedure EditIncoming;
      //�������� ������� ����������� ��������� ����������
      procedure EditOutgoing;
      //�������� ������ ����������� ���������������� ��������
      procedure EditAdmProc;
      //�������������� ��������������
      procedure EditMeta;
      //�������� �������������� ����
      procedure ShowInfoWin;
      //����� �������������� �����������
      procedure EditSpr(Name: string); overload;
      procedure EditSpr(SprItem: TDBItem); overload;
      //��������:
      // ����������� �������� � �������� � ����� ���������� ���������
      procedure RegisterScript;
      procedure SetTemplateInterface(TemplateInterface: TTemplateInterface);
      //��������� ����������:
      // ���������� �������������� ������ � ������� ����� ������� - DR_SHOW_INFO
      function GetParShowInfo: Boolean;
      // ������������� �� ���������� �������, ���� ���������� ������� �������� ����� ���� - DR_NEXT_DAY
      function GetParNextDay: Integer;
      // ������������� � ����������� ������ ���������� ��� ������� ��������� - DR_SHOW_WIN
      function GetParShowWin: Boolean;
      // �������� � ��� ������� ���������� ��������� - DR_PRINT_IND
      function GetParPrintInd: Boolean;
      // �� ����������� ������������� ������ ���������� ��� ������ ��������� - DR_ID_BY_GROUP
      // (������������ ������������� ������� ������ � ������� ������)
      function GetParUseGroupIdFromLook: Boolean;
      //����������:
      // ���������� ���������� ����������
      procedure UpdateParam;
      // ���������� ������������ ����������
      procedure UpdateSpr(Name: string); overload;
      procedure UpdateSpr(SprItem: TDBItem); overload;
      //�������� ��������:
      // ��������� - ���������.ID
      function CanDeleteMan(Id: Integer; var Err: string): Boolean;
      // ������ - ���������.ID
      function CanDeleteAdr(Id: Integer; var Err: string): Boolean;
      // ����������� - �������������.ID
      function CanDeleteOrg(Id: Integer; var Err: string): Boolean;
      // ���������� ������ - �������������.ID
      function CanDeleteNasPunkt(Id: Integer; var Err: string): Boolean;
   public
      property DBList: TDBList read FDBList;
      property DatabaseName: string read FDatabaseName;
      property EnumList: TEnumList read FEnumList;
      property SprDBItems: TDBItemList read FSprDBItems;
      property DocDBItems: TDBItemList read FDocDBItems;
      property FindOperList: TOperList read FFindOperList;
      //��������� ����������:
      property ParShowInfo: Boolean read GetParShowInfo;
      property ParNextDay: Integer read GetParNextDay;
      property ParShowWin: Boolean read GetParShowWin;
      property ParPrintInd: Boolean read GetParPrintInd;
      //��������� ���������� (�����������������):
      property AdmOnlyRead: Boolean read FAdmOnlyRead write FAdmOnlyRead;

      procedure ClearLayoutIni;

      //����������:
      property TemplateInterface: TTemplateInterface read FTemplateInterface;
      procedure Event_OnAfterAddRecord(Sender: TDBItem; IsNew: Boolean);
   end;

   //===========================================================================
   // TDBDocument    ����� ������ ��� ����������
   // TDocWork       ��� ������������
   // TDocMain       ��������
   // TVisitBook     ������ ����� ������ �����������
   // TInfoBook      ������ ����� �������� �������
   // TIncomingDoc   ������ ����������� �������� ����������
   // TOutgoingDoc   ������ ����������� ��������� ����������
   // TAdmProcDoc    ������ ����������� ���������������� ��������
   //---------------------------------------------------------------------------
   // TDBSpr         ����� ������ ��� ������������
   // TSpFolder      ���������� "����� ����������"
   // TSpOfficial    ���������� "����������� ����"
   // TSpAdmProc     ���������� "���������������� ��������� ��� �������"
   // TSpAdmProcU    ���������� "���������������� ��������� ��� �����������"
   // TSpDocGroup    ���������� "������ ����������"
   //---------------------------------------------------------------------------

   //����� ������ ��� ����������
   TDBDocument=class(TDBControl)
   private
      // ������ �� ����� ���������
      FRecInt: TDocRecordInterface;
      // ������� ��� ���������
      FDocType: Integer;
      // ������� ������� ������ ����������
      FGroupKind: Integer;
      // ������� ������ ����������
      FGroupId: Integer;
      // ������� ������� �������
      FGroupFormula: String;
      // �������, ��������� � ������� ������, ������ ����������
      // ������������ ��� ������ ������� ���� � ������� ������
      FGroupIdFromLook: Integer;
      // ��������� ��������� ��� ���������� ������ ����������
      FGroupIdLastSel: Integer;
      // ������: ����� ������ ����� �������������� ��� ������� ���� ����������
      FGroupFilter: string;
      //������� ������ ���� �� ����������� ���������� (��� GetLookByExecTerm)
      FNotExec: string;
      // ������ ���������� � ������� �������� �� ������������ ���������
      FdsDocInfo: TkbmMemTable;
      FMyValue:String;   // �����-�� ��������� �������� ��� ���������� �����
   private
      // ����������/�������� �������� �� ������ ���������� � ������� �������� �� ������������ ��������� - FdsDocInfo
      function GetDocInfo(DocInfo: TDocInfo): Integer; virtual;
      //--procedure SetDocInfo(Id: TDocInfo; const Value: Integer);
      function GetDocInfoName(DocInfo: TDocInfo): string; virtual;
      // ��������� ���� ������ ��������� � ������� �������� �� ������������ ��������� - FdsDocInfo
      function FillDocInfo: Boolean; virtual;
      //���������� ������������ ����������
      //--procedure UpdateDocInfoName(Id: TDocInfo);
      //�������:
      // ������� ��� ������ ���� � ������ ��������� (������� ������)
      function OnApplyFilter(LookTree: TLookTree; LookItem: TLookItem): Boolean;
      //��������� (������� ������):
      // �� ������� ����������
      function GetLookByGroup(Name: string; LookTree: TLookTree): Boolean;
      // �� ������
      function GetLookByFolder(Name: string; LookTree: TLookTree): Boolean;
      // �� ������������
      function GetLookByExecMan(Name: string; LookTree: TLookTree): Boolean;
      // �� ������������
      function GetLookByVisitMan(Name: string; LookTree: TLookTree): Boolean;
      // �� ���� �����������
      function GetLookByRegDate(Name: string; LookTree: TLookTree): Boolean;
      // �� ��������� ���������
      function GetLookBySubj(Name: string; LookTree: TLookTree): Boolean;
      // �� ������������ ���
      function GetLookByFile(Name: string; LookTree: TLookTree): Boolean;
      // �� ������ ����������
      function GetLookByExecTerm(Name: string; LookTree: TLookTree): Boolean;
   protected
      procedure AddEnumToLook(RootItem: TLookItem; EnumName, FieldName: string);
      // ������������ ��������� �� �������
      procedure DoTemplate(Template: TTemplate); override;
      //�������:
      procedure OnAfterReadRecord(Sender: TDBItem); override;
      procedure OnBeforeClose(Sender: TDBItem); override;
      function OnBeforeNewRecord(Sender: TDBItem): Boolean; override;
      procedure OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean); override;
      procedure OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);  override;
   public
      constructor Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
      destructor Destroy; override;
      // ��������� ���������� �����������
      procedure UpdateSpr(SprItem: TDBItem); override;
      // �������� ��������� ��������������� ����� ���������
      function GetLastRegNum(DocType, GroupId: Integer): Integer;
      function GetRegInd(DocType, GroupId: Integer; sNamePar:String; lCheckDelo:Boolean):String;

      procedure SetGroupFormula(sF: String);

      // ������� ������� ������������� ���������
      function GetDocId: Integer;
      // ����� �������
      procedure SelectGroup;
      //�����:
      // �������� ������ �� �����
      procedure ClearAdrId;
      // ����� ������
      function SelectAdres: Boolean;
      //���������:
      // �������� ������ �� ���������
      procedure ClearSign;
      // ����� ��������� (���������� ��� �����������)
      function SelectSign(SignKind, SignType: Integer): Boolean;
      // ����� ����������
      function SelectMan: Boolean;
      // ����� �����������
      function SelectOrg: Boolean;
      // ������� ���������� ���������� ��������� ������� ���������
      function GetCountSignSQL(SignType, SignKind, DocId, SubjId: Integer): string; virtual;
      function AutoCountSign(SignType, SignKind, DocId, SubjId: Integer): Integer; overload; virtual;
      function AutoCountSign(SignType, SignKind: Integer): Integer; overload; virtual;
      function AutoCountSubj(SignType, SignKind: Integer): Integer; overload; virtual;
      function AutoCountSubj(SignType, SignKind, SubjId: Integer): Integer; overload; virtual;
      // �������������� ������������ ������ ��� ���� "7. ����, ������� ��������� ���������"
      function GetRepeatText(ds: TDataSet; var Count: Integer): string;
      // ����� ������� ������ ���������� ����������
      function SelectDocument(var Query: TAdsQuery; Bookmark: TStringList): Boolean; virtual;
      // ����� ������� �������������� �����
      function EditDocLink(DBItem: TDBItem; DataSet: TDataSet; DataSource: TDataSource; ViewMode: TViewMode): Boolean; virtual;
   public
      property RecInt: TDocRecordInterface read FRecInt;
      property DocType: Integer read FDocType;
      property GroupKind: Integer read FGroupKind;
      property GroupId: Integer read FGroupId;
      property dsDocInfo: TkbmMemTable read FdsDocInfo;
      property DocInfo[DocInfo: TDocInfo]: Integer read GetDocInfo {--write SetDocInfo};
   end;

   // ��� ������������
   TDocWork=class(TDBControl)
   private
      FRecInt: TDocRecordInterface;
   protected
      //�������:
      function OnBeforeNewRecord(Sender: TDBItem): Boolean; override;
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnSetDefaultValue(Sender: TDBItem); override;
   public
      constructor Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
      destructor Destroy; override;
   public
      property RecInt: TDocRecordInterface read FRecInt;
   end;

   TDocFile=class(TDBControl)
   private
      // ������ ���� � �������������� �����
      FFileName: string;
      // ������ �� ����� ���������
      FRecInt: TDocRecordInterface;
   private
      // ������� ������ ���� � ����� ����� � ����������� �����
      function GetAttachName: string;
   protected
      //�������:
      function OnBeforeNewRecord(Sender: TDBItem): Boolean; override;
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnSetDefaultValue(Sender: TDBItem); override;
      function OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean; override;
   public
      constructor Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
      destructor Destroy; override;
      function DetailAdd: Boolean; override;
      function DetailDelete: Boolean; override; {+}
      function getTempPath(lCreate:Boolean):String;
      procedure deleteTempPath;
      function ExtractFile(sErr:String):String;
      // ����������� ����
      procedure ViewFile;
      // ������� ����������� ������������� ���� ����� ����������� � ������ ������
      function SetAttachFile: Boolean;
      procedure DeleteAttach(AttachName: string);
   public
      property FileName: string read FFileName write FFileName;
   end;

   // ��������� �������
   TDocMain=class(TDBDocument)
   private
      // ��������: ��� ������������
      FWorkItem: TDBItem;
      FDocWork: TDocWork;
      // ��������: �����
      FLinkItem: TDBItem;
      // ��������: �����
      FFileItem: TDBItem;
      FDocFile: TDocFile;

   private
      //��������� (������� ������):
      // �� ������ ����������
      //--function GetLookByExecTerm(Name: string; LookTree: TLookTree): Boolean;
      // �� ��������� ����� ���������
      function GetLookByAnyType(Name: string; LookTree: TLookTree): Boolean;
   protected
      //�������:
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnEditButtonClick(Sender: TObject; var Handled: Boolean); override;
      procedure OnBeforeClose(Sender: TDBItem); override;
      procedure OnSetDefaultValue(Sender: TDBItem); override;
      function OnUpdateTopInfo(Sender: TDBItem; RichEdit: TRichEdit; var TopInfo: string): Boolean; override;
      procedure OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent); override;
      function AddInTemplateMenu(Template: TTemplate): Boolean; override;
      procedure OnExecAction(Sender: TDBItem); override;
      procedure OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean); override;
      procedure OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh); override; // vadim 16.08.2018
   public
      constructor Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
      destructor Destroy; override;
      //
      procedure UpdateSpr(SprItem: TDBItem); override;
      //��������� ���������� ����������
      procedure UpdateParam;
      // ����� ������� ������ ���������� ����������
      function SelectDocument(var Query: TAdsQuery; Bookmark: TStringList): Boolean; override;
      // ����� ������� �������������� �����
      function EditDocLink(DBItem: TDBItem; DataSet: TDataSet; DataSource: TDataSource; ViewMode: TViewMode): Boolean; override;
      //
      procedure OnTemplateMenuClick(Sender: TObject); override;
   public
      property WorkItem: TDBItem read FWorkItem;
      property DocWork: TDocWork read FDocWork;
      property LinkItem: TDBItem read FLinkItem;
      property FileItem: TDBItem read FFileItem;
      property DocFile: TDocFile read FDocFile;
   end;

   // ������ ����� ������ �����������
   TVisitBook=class(TDBDocument)
   private
      // �������� ��������� ��������������� ����� ���������
      function GetLastVisitNum(DocType: Integer): Integer;
   protected
      //�������:
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnSetDefaultValue(Sender: TDBItem); override;
      procedure OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent); override;
   public
      constructor Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
      destructor Destroy; override;
   end;

   // ������ ����� �������� �������
   TInfoBook=class(TDBDocument)
   private
      // ��������: �����
      FFileItem: TDBItem;
      FDocFile: TDocFile;
   protected
      //�������:
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnSetDefaultValue(Sender: TDBItem); override;
      procedure OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent); override;
      procedure OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean); override;
   public
      constructor Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
      destructor Destroy; override;
   public
      property FileItem: TDBItem read FFileItem;
      property DocFile: TDocFile read FDocFile;
   end;

   // ������ ����������� �������� ����������
   TIncomingDoc=class(TDBDocument)
   private
      // ��������: �����
      FFileItem: TDBItem;
      FDocFile: TDocFile;
   private
      //��������� (������� ������):
      // �� ��������� ����� ����������
      function GetLookByAnyType(Name: string; LookTree: TLookTree): Boolean;
   protected
      function AddInTemplateMenu(Template: TTemplate): Boolean; override;
      //�������:
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnSetDefaultValue(Sender: TDBItem); override;
      procedure OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent); override;
      procedure OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean); override;
      function OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean; override;
      procedure OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh); override;
   public
      constructor Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
      destructor Destroy; override;
   public
      property FileItem: TDBItem read FFileItem;
      property DocFile: TDocFile read FDocFile;
   end;

   // ������ ����������� ��������� ����������
   TOutgoingDoc=class(TDBDocument)
   private
      // ��������: �����
      FFileItem: TDBItem;
      FDocFile: TDocFile;
   private
      //��������� (������� ������):
      // �� ��������� ����� ����������
      function GetLookByAnyType(Name: string; LookTree: TLookTree): Boolean;
   protected
      function AddInTemplateMenu(Template: TTemplate): Boolean; override;
      //�������:
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnSetDefaultValue(Sender: TDBItem); override;
      procedure OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent); override;
      procedure OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean); override;
      function OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean; override;
      function SelectDocument(var Query: TAdsQuery; Bookmark: TStringList): Boolean; override;
   public
      constructor Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
      destructor Destroy; override;
   public
      property FileItem: TDBItem read FFileItem;
      property DocFile: TDocFile read FDocFile;
   end;

   // ������ ����������� ���������������� ��������
   TAdmProcDoc=class(TDBDocument)
   private
      // ��������: ��� ������������
      FWorkItem: TDBItem;
      FDocWork: TDocWork;
      // ��������: �����
      FLinkItem: TDBItem;
      // ��������: �����
      FFileItem: TDBItem;
      FDocFile: TDocFile;
   private
      function GetDocInfo(DocInfo: TDocInfo): Integer; override;
      function GetDocInfoName(DocInfo: TDocInfo): string; override;
      function FillDocInfo: Boolean; override;
      //��������� (������� ������):
      // �� ��������� �����
      function GetLookByAnyType(Name: string; LookTree: TLookTree): Boolean;
      // �� ���������������� ����������
      function GetLookByAdmProc_(SprName: string; Name: string; LookTree: TLookTree): Boolean;{+}
      // �� ���������������� ���������� �������
      function GetLookByAdmProc(Name: string; LookTree: TLookTree): Boolean;{+}
      // �� ���������������� ���������� �����������
      function GetLookByAdmProcU(Name: string; LookTree: TLookTree): Boolean;{+}
   protected
      //�������:
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnSetDefaultValue(Sender: TDBItem); override;
      procedure OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent); override;
      procedure OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean); override;
      procedure OnExecAction(Sender: TDBItem); override;
      {+}procedure OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh); override;
   public
      constructor Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
      destructor Destroy; override;
      //
      procedure OnEditButtonClick(Sender: TObject; var Handled: Boolean); override;
      // ����� ������� ������ ���������� ����������
      function SelectDocument(var Query: TAdsQuery; Bookmark: TStringList): Boolean; override;
      // ����� ������� �������������� �����
      function EditDocLink(DBItem: TDBItem; DataSet: TDataSet; DataSource: TDataSource; ViewMode: TViewMode): Boolean; override;
      // ������� ���������� ���������� ��������� ������� ���������
      function GetCountSignSQL(SignType, SignKind, DocId, SubjId: Integer): string; override;
      function AutoCountSubj(SignType, SignKind: Integer): Integer; overload; override;
      function OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean; override;
   public
      property FileItem: TDBItem read FFileItem;
      property LinkItem: TDBItem read FLinkItem;
      property DocFile: TDocFile read FDocFile;
      property WorkItem: TDBItem read FWorkItem;
      property DocWork: TDocWork read FDocWork;
   end;

   // ��������� ��� ��������� ���������� �� ��������
   TDoc2Template=class(TObject)
   private
      FDBItem: TDBItem;
      FDataSet: TDataSet;
      FDetailList: TDBItemList;
      FFieldList: TFieldList;
      FSprDBItems: TDBItemList;
   public
      constructor Create;
      destructor Destroy; override;
      procedure SetDBItem(DBItem: TDBItem; SprDBItems: TDBItemList);
      function Field(FieldName: string): TField;
      function DataSet(TableName: string): TDataSet;
      function PickName(FieldName: string; CaseKind: Char): string;
      function FromSpr(FieldName, GetName: string; CaseKind: Char): string;
      function FromSpr2(FieldName, SprName, GetName: string; CaseKind: Char): string;{+}
      function ParamAsString(ParamName: string): string;
      function ParamAsFloat(ParamName: string): Extended;
      function ParamAsInteger(ParamName: string): Integer;
      function ParamAsBoolean(ParamName: string): Boolean;
   end;

   // �����������
   TDBSpr=class(TDBControl)
   private
      // ������ �� ����� ���������
      FRecInt: TDocRecordInterface;
   protected
      //�������:
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean); override;
      function OnBeforeNewRecord(Sender: TDBItem): Boolean; override;
      procedure OnSetDefaultValue(Sender: TDBItem); override;
      function OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean; override;
   public
      constructor Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
      destructor Destroy; override;
   end;

   // ���������� "����� ����������"
   TSpFolder=class(TDBSpr)
      procedure OnSetDefaultValue(Sender: TDBItem); override;
      function OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean; override;
   end;

   // ���������� "����������� ����"
   TSpOfficial=class(TDBSpr)
      procedure OnSetDefaultValue(Sender: TDBItem); override;
      procedure OnEnter(Sender: TObject; FieldItem: TFieldItem); override;
   end;

   // ���������� "���������������� ��������� ��� �������"
   TSpAdmProc=class(TDBSpr)
   protected
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh); override;
   end;

   // ���������� "���������������� ��������� ��� �����������"
   {+}
   TSpAdmProcU=class(TDBSpr)
   protected
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
      procedure OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh); override;
   end;

   // ���������� "������ ����������"
   TSpDocGroup=class(TDBSpr)
      function OnBeforeNewRecord(Sender: TDBItem): Boolean; override;
      function OnBeforeEditRecord(Sender: TDBItem; KeyValues: string): Boolean; override;
      function OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean; override;
   end;

   // vadim 21.01.2019 ���������� "��������������� �������� ��������� �������"
   TSpDocSubjG=class(TDBSpr)
   protected
      procedure OnSetDefaultValue(Sender: TDBItem); override;
   end;

var
   // ������ �������� MDI ���� (��������)
   FMDIList: TStringList;

const
   // ���������� �������� ��/��� - LOGICAL
   lYes         = 1;  // ��
   lNo          = 2;  // ���

   // �������� ������ ���������� - CHECK
   chYes        = 1;  // ��
   chNo         = 2;  // ���
   chOk         = 3;  // ����

   // ������ ���������
   cdNo         = 0;  //
   cdIzm        = 1;  // �������

   // ��� ��������� - DOC_TYPE
   dtPetition   = 1;  // ��������� �������
   dtInfo       = 2;  // �������
   gtIncoming   = 3;  // �������� ���������
   gtOutgoing   = 4;  // ��������� ���������
   gtAdmProc    = 5;  // ���������������� ���������

   // ������� ������ ���������� (���������� ��� ���) - GROUP_KIND
   gkIncoming   = 1;  // ��������
   gkOutgoing   = 2;  // ���������
   gkInternal   = 3;  // ����������
   gkPetition   = 4;  // ��������� �������
   gkAdmProc    = 5;  // ���������������� ���������
   gkInfo       = 6;  // �������

   {
   // �������� ���������
   dcNone       = 1;  // �� ����������� ��������
   dcCheck      = 2;  // ����������� ��������
   dcComplete   = 3;  // �������� ���� � ��������
   }

   {
   // ��� ��������
   akOrganization  = 1; // �����������
   akCitizen       = 2; // ���������
   akOfficial      = 3; // ����������� ����
   }

   {
   // ��� ����� ����� �����������
   lkDirect        = 1; // ������
   lkBack          = 2; // ��������
   }

   // ���� ������ ����� ����������� (�����������������/���������) - LINK_TYPE
   ltRepeat        = 1; // ����������/���������
   ltFirst         = 2; // ������/���������
   //ltAnswer        = 3; // ������/�����

   // ���� ������ ����� ����������� - LINK_KIND
   lkDirect        = 1;  // ������
   lkBack          = 2;  // ��������

   // ��� �������������� ����������������� ������ - CORR_TYPE
   tcHigh   = 1; // ����������� ��������������� �����
   tcMedia  = 2; // ���
   tcOther  = 9; // ������
   //? � ��� ������������ ����������� �����

   // ����� ����������� ��������� - APP_FORM
   stWriting  = 1; // ���������
   //--stVisit    = 2; // � ������� ������ NB: ??? ��������� ???
   stVerbal   = 3; // �����
   stElect    = 2; // ���������� 20.10.2016 vadim

   // ���� ��������� ������� - APP_KIND
   dcProposal       = 1; // �����������
   dcClaim          = 2; // ���������
   dcComplaint      = 3; // ������
   dcConsultant     = 4; // ������������;

   //? ������ (�������)
   //? ������� ������������ (��������������) ���������

   // ��� ������� ��������� - SIGN_TYPE
   stIndividual = 10; // ��������������
   //--skUL         = 11; // ��������������: ��
   //--skIP         = 12; // ��������������: ��
   stGroup      = 20; // ������������
   //--stGroup30    = 21; // ������������: 30 � ����� �������
   stAnonym     = 30; // ���������

   // ��� ��������� - SIGN_KIND
   skMan        = 1; // ���������
   skUL         = 2; // ����������� ����
   skIP         = 3; // �������������� ���������������

   // ��� ����������������� ������ - COVER_TYPE
   ctJob     = 1; // ���������
   ctDirect  = 2; // �����������
   ctCover   = 3; // ���������������� ������
   //? - �������������

   // ��� ��������� ������� - ANS_KIND
   rtSatisfy  = 1; // �������������
   rtRefuse   = 2; // ��������
   rtExplain  = 3; // ����������
   rtReturn   = 4; // ����������
   rtPerform  = 5; // ������������

   //����� ����������
   dfCommon   = 1; // �����

   // ������ �������� ������ - STORE_KIND
   stOnlyLink = 1; // ������ ������ �� ����
   stInFolder = 2; // � ����������� �����
   stInBase   = 3; // � ���� ������

   // ��� ��������� - DOC_KIND
   dk1   =   1;  // ������
   dk2   =   2;  // �������������
   dk3   =   3;  // ������������
   dk4   =   4;  // �������
   dk5   =   5;  // ��������
   dk6   =   6;  // ������
   dk7   =   7;  // ���������
   dk8   =   8;  // ��������
   dk9   =   9;  // ���
   dk10  =  10;  // ��������� �������
   dk11  =  11;  // �������
   dk12  =  12;  // ������
   dk13  =  13;  // ��������������
   dk14  =  14;  // ����������
   dk15  =  15;  // ����
   dk16  =  16;  // �������������
   dk17  =  17;  // �����������
   dk18  =  18;  // ���������
   dk19  =  19;  // �������
   dk20  =  20;  // ���������
   dk99  =  99;  // ������

   //--dk999 = 999;  // ������

   // ������ �������� (��������) - DELIV_KIND
   dkPost     =  1; // �����
   dkFax      =  2; // ����
   dkMailgov  =  3; // ����������� ����� ����������
   dkTelegram =  4; // ��������
   dkEmail    =  5; // ����������� �����
   dkCourier  =  6; // �������� (��������)
   dkSMDO     =  7; // ����
   dkPerson   = 90; // ������ �����
   dkNone     = 99; // ������
   //�� ������ ������

   // ��� ��������� ���������������� ��������� - PROC_RES
   prInfo     =  1; // ������ �������
   prDecision =  2; // �������� �������
   prNone     =  9; // ������

const
   // ������� ���
   CRedBackground=$00DDDDFF;
   // ������� ���
   CGreenBackground=$00D8FCDA;
   // ����� ���
   CNavyBackground=$00FCE8CD;

const
   CMaxRow=15;

   // �������������� ������ �� ���������� �������
   CDocInfoStr: array [1..7] of record
      DI: TDocInfo;
      N: string;
      Fg: TColor;
      Bg: TColor;
   end=(
      (DI: diTotalExec;  N:'����� ���������������� ���������, ��������� ������������'; Fg:clNavy; Bg:CNavyBackground;),
      (DI: diBlank;      N:'�� ���:'; Fg:0; Bg:0;),
      (DI: diSkipTerm;   N:'   �������� ������������� ���� ����������'; Fg:clRed; Bg:CRedBackground;),
      (DI: diExpireTerm; N:'   ���� ���������� �������� ����� %d %s'; Fg:clGreen; Bg:CGreenBackground;),
      (DI: diWaitAnswer; N:'   ��������� ����� �� ������'; Fg:clGreen; Bg:CGreenBackground;),
      (DI: diCheck;      N:'   ��������� �� ��������'; Fg:clGreen; Bg:CGreenBackground;),
      (DI: diNeedAnswer; N:'   ��������� ����������� ��������������� �������, ��������� ������'; Fg:clGreen; Bg:CGreenBackground;)
   );

//      diExpireTerm: Result:=Format('   ���� ���������� �������� ����� %d %s', [FRecInt.ParNextDay, DeclensionDay(FRecInt.ParNextDay)]);

   // �������������� ������ �� ���������������� ����������
   CAdmProcStr: array [1..6] of record
      DI: TDocInfo;
      N: string;
      Fg: TColor;
      Bg: TColor;
   end=(
      (DI: diTotalExec;  N:'����� ���������������� ���������, ��������� ������������'; Fg:clNavy; Bg:CNavyBackground;),
      (DI: diBlank;      N:'�� ���:'; Fg:0; Bg:0;),
      (DI: diSkipTerm;   N:'   �������� ������������� ���� ����������'; Fg:clRed; Bg:CRedBackground;),
      (DI: diExpireTerm; N:'   ���� ���������� �������� ����� %d %s'; Fg:clGreen; Bg:CGreenBackground;),
      (DI: diWaitAnswer; N:'   ��������� ����� �� ������'; Fg:clGreen; Bg:CGreenBackground;),
      (DI: diCheck;      N:'   ��������� �� ��������'; Fg:clGreen; Bg:CGreenBackground;)
   );


//NB: ��� ������� ������ ���� ���������� � ������ ��������������� ��������
procedure CopyDocLink(src, dst: TDataSet; Order: Integer);

//��������������� �������: NB: !!! ��������� � ������ mCommon

//procedure AddString(var S: string; AddS, Delimeter: string); - mAdsObj
function CreateMemTable(FieldList: array of const; AutoCreate, AutoOpen: Boolean): TkbmMemTable;
function QueryIntegerValue(DatabaseName, SQL: string; const Args: array of const; DefaultValue: Integer): Integer;
procedure QueryEnumValue(Enum: TEnumItem; DatabaseName, SQL: string; const Args: array of const);
function OneCap(S: string): string;
function OneCap2(S: string): string;
procedure ConfigGridColumn(Grid: TDBGridEh; FieldList: array of const);
procedure SetControlVisible(Arr: TControlArray; Visible: Boolean);
procedure InitControlArray(var Arr: TControlArray; Arg: array of const);

procedure SIRegisterDoc2Template(Cl: TIFPSPascalCompiler);
procedure RIRegisterDoc2Template(Cl: TIFPSRuntimeClassImporter);

function UpdatePerInch(I: Integer): Integer;

function GetExtIcon(AExt: string): HICON;


implementation
uses
   Forms,
   fEditRec, fEdWork, mDoc2Sel, mDRecData, fEdMeta, fEdVBook, fEdInfo, fSelGrp,
   fEdFile, fEdIn, fEdOut, fEdAProc, fSpAdm, fSpAdmU{+}, fSprRec, fSelDoc, fSelDoc2, fSelDoc3,
   fEdLink, fEdLink2,
   {+}dBase, MetaTask, adsdata;

var
   // ��������� ��� ������� � ���������� �� ����� ���������
   // (��� ��������� ���������� �� ��������)
   Doc2Template: TDoc2Template;

function GetExtIcon(AExt: string): HICON;
var
   Info: SHFileInfo;
begin
   SHGetFileInfo(PChar('*.'+AExt),
      FILE_ATTRIBUTE_NORMAL,
      Info,
      SizeOf(Info),
      SHGFI_ICON or SHGFI_USEFILEATTRIBUTES);
   Result:=Info.hIcon;
end;


function UpdatePerInch(I: Integer): Integer;
begin
   Result:=Round(I*(Screen.PixelsPerInch/96)-0.5);
end;

procedure InitControlArray(var Arr: TControlArray; Arg: array of const);
var
   I: Integer;
begin
   SetLength(Arr, Length(Arg));
   for I:=Low(Arg) to High(Arg) do begin
      if Arg[I].VType=vtObject then begin
         Arr[I]:=TControl(Arg[I].VObject);
      end
      else begin
         Arr[I]:=nil;
      end;
   end;
end;

procedure SetControlVisible(Arr: TControlArray; Visible: Boolean);
var
   I: Integer;
begin
   for I:=Low(Arr) to High(Arr) do begin
      Arr[I].Visible:=Visible;
   end;
end;

procedure CopyDocLink(src, dst: TDataSet; Order: Integer);
begin
   dst.Append;
   //������� ��������� ������
   dst.FieldByName('N_ORDER').AsInteger:=Order;
   //��� �����
   dst.FieldByName('LINK_TYPE').AsInteger:=ltRepeat;
   //��� �����
   dst.FieldByName('LINK_KIND').AsInteger:=lkDirect;
   //������������� ���������� ���������
   dst.FieldByName('LINK_DOC').AsInteger:=src.FieldByName('DOC_ID').AsInteger;
   //��� ���������� ���������
   dst.FieldByName('DOC_TYPE').AsInteger:=src.FieldByName('DOC_TYPE').AsInteger;
   //������ ���������
   dst.FieldByName('GROUP_ID').AsInteger:=src.FieldByName('GROUP_ID').AsInteger;
   //��� ������� ������ ���������
   dst.FieldByName('GROUP_KIND').AsInteger:=src.FieldByName('GROUP_KIND').AsInteger;
   //���� ����������� ���������� ���������
   dst.FieldByName('REG_DATE').AsString:=src.FieldByName('REG_DATE').AsString;
   //��������������� ������ ���������� ���������
   dst.FieldByName('REG_IND').AsString:=src.FieldByName('REG_IND').AsString;
   //��������� �������� � ����
   dst.FieldByName('IN_BASE').AsInteger:=lYes;
   //�������� � ���
   dst.FieldByName('IS_PRINT').AsInteger:=lYes;
   dst.Post;
end;

procedure ConfigGridColumn(Grid: TDBGridEh; FieldList: array of const);
var
   I: Integer;
   Column: TColumnEh;
   FieldName: string;
   DisplayLabel: string;
begin
   Grid.Columns.BeginUpdate;
   Grid.FrozenCols:=0;
   Grid.Columns.Clear;
   try
      for I:=Low(FieldList) to High(FieldList) div 3 do begin
         if FieldList[I*3].VType=vtAnsiString then begin
            FieldName:=FieldList[I*3].VPChar;
            if FieldList[Succ(I*3)].VType in [vtAnsiString, vtChar] then begin
               case FieldList[Succ(I*3)].VType of
                  vtAnsiString: DisplayLabel:=FieldList[Succ(I*3)].VPChar;
                  vtChar: DisplayLabel:=FieldList[Succ(I*3)].VChar;
               end;
               //
               Column:=Grid.Columns.Add;
               Column.FieldName:=FieldName;
               Column.Title.Caption:=DisplayLabel;
               Column.Width:=UpdatePerInch(FieldList[Succ(Succ(I*3))].VInteger);
            end;
         end;
      end;
   finally
      Grid.Columns.EndUpdate;
   end;
end;

function OneCap(S: string): string;
begin
   if S<>'' then begin
      Result:=AnsiLowerCase(S);
      Result[1]:=AnsiUpperCase(Result[1])[1];
   end
   else begin
      Result:=S;
   end;
end;

function OneCap2(S: string): string;
begin
   if S<>'' then begin
      Result:=AnsiUpperCase(Copy(S,1,1))+Copy(S,2,Length(S));
//      Result[1]:=AnsiUpperCase(Result[1])[1];
   end
   else begin
      Result:=S;
   end;
end;

function DeclensionDay(DayCount: Integer): string;
var
   S: string;
begin
   //�����
   S:='0'+IntToStr(DayCount);
   S:=Copy(S, Length(S)-1, 2);
   if (S[2]='1') and (S[1]<>'1') then Result:='����' // =1 <>11 ����
   else if (S[2] in ['2'..'4']) and (S[1]<>'1') then Result:='���' //=2..4 <>12..14 ���
   else Result:='����';
end;

function DeclensionDay2(DayCount: Integer): string;
begin
   //������
   if ((DayCount>10) and (DayCount<20)) or ((DayCount mod 10)=0) then Result:='-�� ����'
   else if (DayCount mod 10)=1 then Result:='-��� ���'
   else if (DayCount mod 10)<5 then Result:='-� ����'
   else Result:='-�� ����';
end;

function CreateMemTable(FieldList: array of const; AutoCreate, AutoOpen: Boolean): TkbmMemTable;
var
   I: Integer;
   FieldName: string;
   FieldType: TFieldType;
   FieldSize: Integer;
   FieldDef: TFieldDef;

   function GetString(var VarRec: TVarRec): string;
   begin
      case VarRec.VType of
         vtAnsiString: Result:=VarRec.VPChar;
         vtChar: Result:=VarRec.VChar;
      else
         Result:='';
      end;
   end;

begin
   Result:=nil;
   if Length(FieldList) mod 3=0 then begin
      Result:=TkbmMemTable.Create(nil);
      for I:=Low(FieldList) to High(FieldList) div 3 do begin
         FieldName:=GetString(FieldList[I*3]);
         FieldType:=TFieldType(FieldList[I*3+1].VInteger);
         FieldSize:=FieldList[I*3+2].VInteger;
         FieldDef:=Result.FieldDefs.AddFieldDef;
         FieldDef.Name:=FieldName;
         FieldDef.DataType:=FieldType;
         // [2007.05.30] ����������� ������ "Invalid field size"
         if FieldType<>ftBoolean then begin
            FieldDef.Size:=FieldSize;
         end;
      end;
      if AutoCreate then begin
         Result.CreateTable;
         if AutoOpen then begin
            Result.Open;
         end;
      end;
   end;
end;

procedure QueryEnumValue(Enum: TEnumItem; DatabaseName, SQL: string; const Args: array of const);
var
   Query: TAdsQuery;
begin
   Query:=TAdsQuery.Create(nil);
   try
      try
         Query.DatabaseName:=DatabaseName;
         Query.SQL.Text:=Format(SQL, Args);
         Query.Open;
         Query.First;
         while not Query.Eof do begin
            Enum.Add(Query.Fields[0].AsString, Query.Fields[1].AsString);
            Query.Next;
         end;
      except
      end;
   finally
      Query.Free;
   end;
end;

function QueryIntegerValue(DatabaseName, SQL: string; const Args: array of const; DefaultValue: Integer): Integer;
var
   Query: TAdsQuery;
begin
   Result:=DefaultValue;
   Query:=TAdsQuery.Create(nil);
   try
      try
         Query.DatabaseName:=DatabaseName;
         Query.SQL.Text:=Format(SQL, Args);
         Query.Open;
         Query.First;
         if not Query.Eof then begin
            Result:=Query.Fields[0].AsInteger;
         end;
      except
      end;
   finally
      Query.Free;
   end;
end;

{ TDocRecordInterface }

constructor TDocRecordInterface.Create;
var
   I: Integer;
begin
   //�������� ������:
   // ������ ������������ �����
   FEnumList:=TEnumList.Create;
   // ������ ���� �������� � ������������
   FDBList:=TDBList.Create;
   // ��� �����������
   FSprDBItems:=FDBList.AddItem('SPR', nil);
   // ��� ������� (�������)
   FDocDBItems:=FDBList.AddItem('DOC', nil);
   //�����:
   // ������ ��������
   FFindOperList:=TOperList.Create;
   // ������ ������������
   FFindSprList:=TSprList.Create;
   //������������ �������� � ������������� ������ (�������, �����������, ������������ ����)
   CreateDocRecordInterface(Self);
   //�������:
   // ��������
   FDocMain:=TDocMain.Create(FDocDBItems.ByName('DOC_MAIN'), Self);
   // ������ ����� ������ �����������
   FVisitBook:=TVisitBook.Create(FDocDBItems.ByName('VISIT_BOOK'), Self);
   // ������ ����� �������� �������
   FInfoBook:=TInfoBook.Create(FDocDBItems.ByName('INFO_BOOK'), Self);
   // ������ ����������� �������� ����������
   FDocIn:=TIncomingDoc.Create(FDocDBItems.ByName('DOC_IN'), Self);
   FDocIn.DBItem.OnAfterAddRecord:=Event_OnAfterAddRecord;

   // ������ ����������� ��������� ����������
   FDocOut:=TOutgoingDoc.Create(FDocDBItems.ByName('DOC_OUT'), Self);
   // ������ ����������� ���������������� ��������
   FAdmProc:=TAdmProcDoc.Create(FDocDBItems.ByName('ADM_PROC'), Self);
   //�����������:                               
   // ���������� "����� ����������"
   TSpFolder.Create(FSprDBItems.ByName('SP_FOLDER'), Self);
   // c��������� "����������� ����"                           
   TSpOfficial.Create(FSprDBItems.ByName('SP_OFFICIAL'), Self);
   // ���������� "���������������� ��������� ��� �������"
   TSpAdmProc.Create(FSprDBItems.ByName('SP_ADMPROC'), Self);
   // ���������� "���������������� ��������� ��� �����������"
   TSpAdmProcU.Create(FSprDBItems.ByName('SP_ADMPROC_U'), Self);{+}
   // ���������� "������ ����������"
   TSpDocGroup.Create(FSprDBItems.ByName('SP_DOCGROUP'), Self);

   // ���������� "������ ����������"
   TSpDocSubjG.Create(FSprDBItems.ByName('SP_SUBJG'), Self);

   // ��� ��������� ������������ �� ��������� ��������������� �����
   // ��������������� �������� ���� ��������������
   for I:=0 to Pred(FSprDBItems.Count) do begin
      if FSprDBItems[I].Control=nil then begin
         TDBSpr.Create(FSprDBItems[I], Self);
      end;
   end;
   //���������:
   // �����
   FFormLayoutIni:=TMemIniFile.Create(Doc2Sel.GetLayoutFileName);
   // �������
   FTableViewIni:=TMemIniFile.Create(Doc2Sel.GetViewFileName);
   // �����
   FFindIni:=TMemIniFile.Create(Doc2Sel.GetFindFileName);
   // ���������� ���������� - ��������� ������� � ���������� �� ����� ��������
   Doc2Template:=TDoc2Template.Create;
   // ������ �������� MDI ���� (��������)
   FMDIList:=TStringList.Create;
   //��������� �� ���������
   FAdmOnlyRead:=False;
end;
//----------------------------------------------------------
// vadim
procedure TDocRecordInterface.ClearLayoutIni;
begin
  if FFormLayoutIni<>nil
    then FFormLayoutIni.Free;
  SysUtils.DeleteFile(Doc2Sel.GetLayoutFileName);
  FFormLayoutIni:=TMemIniFile.Create(Doc2Sel.GetLayoutFileName);
end;
//----------------------------------------------------------
// vadim
procedure TDocRecordInterface.Event_OnAfterAddRecord(Sender: TDBItem; IsNew: Boolean);
{$IFDEF SMDO}
var
  fld:TField;
  sRegNomer,sRegNomerC:String;
  nDocID:Integer;
  dRegDate,dRegDateC:TDateTime;
  lOk:Boolean;
{$ENDIF}
begin
  {$IFDEF SMDO}
  if SMDOEnabled then begin
    fld:=Sender.EditTable.FindField('POST_ID');
    if (fld<>nil) and (fld.AsInteger>0) then begin
      sRegNomer:=Trim(Sender.EditTable.FieldByName('REG_IND').AsString);
      if Sender.EditTable.FieldByName('REG_DATE').IsNull
        then dRegDate:=0
        else dRegDate:=Sender.EditTable.FieldByName('REG_DATE').AsDateTime;
      if (dRegDate=0) or (sRegNomer='') then begin
         PutError('��������! �� ��������� ���� � �������� ������ ��� ����������� � ����');
      end else begin
        with dmBase.SMDOPost do begin
          if Locate('ID', fld.AsInteger, []) then begin
            lOk:=true;
            //---- ������ �������������� ����������� ------------------
            dmBase.WorkQuery.SQL.Text:='select * from smdoPost where ack_msg_id='+QStr(FieldByName('MSG_ID').AsString);  // ����������� ��� �������� ���������
            dmBase.WorkQuery.Open;
            while not dmBase.WorkQuery.Eof do begin
              if dmBase.WorkQuery.FieldByName('ACK_TYPE').AsInteger=ACK_REGISTER then
                lOk:=false; // ����������� � ����������� ��� ���� � ���� !!!
              dmBase.WorkQuery.Next;
            end;
            dmBase.WorkQuery.Close;
            //---------------------------------------------------------
            if lOk then begin
              sRegNomerC:=Trim(FieldByName('MY_REGNUMBER').AsString);
              if sRegNomerC<>'' then begin
                // ���� �������� ��� ���������������� ��� ������ �������
                if not MySameText(sRegNomer,sRegNomerC) then begin
                  lOk:=Problem('������ � ����������� ���� � ����� ����. ��������?');
                end;
              end;
            end;
            if lOk then begin
              nDocID:=Sender.Table.fieldByName('DOC_ID').AsInteger;   // �������� DOC_ID � ����
              if not SMDO.RegDocInSED(nDocID, fld.AsInteger,sRegNomer,dRegDate) then begin
                fld.DataSet.CheckBrowseMode;
                fld.DataSet.Edit;
                fld.AsString:='';
                fld.DataSet.Post;
                PutError('������ ������������ ����������� � �����������.');
              end else begin
                RefreshGurnalSMDO;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  {$ENDIF}
end;
//----------------------------------------------------------
destructor TDocRecordInterface.Destroy;
var
   I: Integer;
begin
   //�������
   FDocMain.Free;
   FVisitBook.Free;
   FInfoBook.Free;
   FDocIn.Free;
   FDocOut.Free;
   FAdmProc.Free;
   //�����������
   for I:=0 to Pred(FSprDBItems.Count) do begin
      if FSprDBItems[I].Control<>nil then begin
         FSprDBItems[I].Control.Free;
      end;
   end;
   //\\
   FDBList.Free;
   FEnumList.Free;
   // ini-�����
   FFindIni.UpdateFile;
   FFindIni.Free;
   FTableViewIni.UpdateFile;
   FTableViewIni.Free;
   FFormLayoutIni.UpdateFile;
   FFormLayoutIni.Free;
   // �����
   FFindSprList.Free;
   FFindOperList.Free;
   // ���������� ����������
   Doc2Template.Free;
   // ������ �������� MDI ���� (��������)
   // NB: !!! ??? ���� �� ���� ��������� ��� �������� ������
   FMDIList.Free;
   inherited;
end;

procedure TDocRecordInterface.Close;
var
   I: Integer;
   n,m:Cardinal;
begin
   // NB: !!! ������� ���� ��� �������
   for I:=0 to Pred(FMDIList.Count) do begin
      FMDIList[I]:='';
      TfmTblEdit(FMDIList.Objects[I]).Free;
   end;
   FMDIList.Clear;
   //
   FDatabaseName:='';
   FDBList.SaveFormLayoutToIni(FFormLayoutIni);
   //NB: !!! �������� �������� ���������� !!!
//   n:=GetTickCount;
//   FDBList.SaveTableViewToIni(FTableViewIni);
//   m:=GetTickCount-n;
//   ShowMessage(IntToStr(m));
   FDBList.Close;
end;

function TDocRecordInterface.Open(DatabaseName: string): Boolean;
var
   ErrMsg: string;
   AdmProc, Obr: TDBItem;{+}
   Src: TFindFieldItem;{+}
   Spr: TSprItem;{+}
   LinkSpr: TDBItem;{+}
begin
   FDatabaseName:=DatabaseName;
   FDBList.LoadFormLayoutFromIni(FFormLayoutIni);
//   IniSysParams
   FDBList.LoadTableViewFromIni(FTableViewIni);
   FDBList.RestoreLinks(FSprDBItems, FEnumList);
   FDBList.SetDatabaseName(DatabaseName);
   if FDBList.Open(ErrMsg) then begin
      Result:=True;
   end
   else begin
      Result:=False;
      MessageDlgR(ErrMsg, mtError, [mbCancel], 0);
   end;
   // ������ ���������� ����������� ����� ����������, �������������� ��������
   QueryEnumValue(
      FEnumList.ByName('PROV_TYPE'),
      DatabaseName,
      'select id, name from sysspr.SprTypeDok order by id',
      []
   );
   // ������������� ������
   if Result then begin
      InitFindSprList(FSprDBItems, EnumList);
      InitFilterInterface(FDocDBItems.ByName('DOC_MAIN'), '���������', '��������� �������', True);
      InitFilterInterface(FDocDBItems.ByName('VISIT_BOOK'), '����������', '���� �����������', True);
      InitFilterInterface(FDocDBItems.ByName('INFO_BOOK'), '�������', '���� �������� �������', True);
      InitFilterInterface(FDocDBItems.ByName('DOC_IN'), '��������', '�������� ���������', True);
      InitFilterInterface(FDocDBItems.ByName('DOC_OUT'), '���������', '��������� ���������', True);
      InitFilterInterface(FDocDBItems.ByName('ADM_PROC'), '���������', '���������������� ���������', True);
      //-- vadim 16.08.2018 -------------------------
      Obr:=FDocDBItems.ByName('DOC_MAIN');
      Src:=Obr.FilterInterface.FindFieldList.ByPath('SUBJ_ID');
      Src.SetCaption('��������� ���������� �������');
      Spr:=Obr.FilterInterface.SprList.ByName('SP_SUBJG');
      LinkSpr:=FSprDBItems.ByName('SP_SUBJG');
      Obr.FilterInterface.FindFieldList.InsertNew('SUBJ_ID',
         Src.Name+'G', Src.RealName, '�����. ������������� �������', '�����. ������������� �������', Src.Alias, Src.Kinds, Src.Visible, Src.CaseSensitive,
         Src.IsUpper, 'SP_SUBJG', Src.Owner, Src.Order+1, Src.Group, Src.DefaultOp, Src.RelName, Src.SprEditKind
      );
      //----------------------------------------------
      {+}
      AdmProc:=FDocDBItems.ByName('ADM_PROC');
      Src:=AdmProc.FilterInterface.FindFieldList.ByPath('ADM_PROC');
      Spr:=AdmProc.FilterInterface.SprList.ByName('SP_ADMPROC_U2');
      LinkSpr:=FSprDBItems.ByName('SP_ADMPROC_U2');
      AdmProc.FilterInterface.FindFieldList.InsertNew('ADM_PROC',
         Src.Name+'_U', Src.RealName, '��������� �����������', '��������� �����������', Src.Alias, Src.Kinds, Src.Visible, Src.CaseSensitive,
         Src.IsUpper, 'SP_ADMPROC_U2', Src.Owner, Src.Order+1, Src.Group, Src.DefaultOp, Src.RelName, Src.SprEditKind
      );
      LinkSpr.GetKeyPickList(Spr.KeyList, Spr.NameList, LinkSpr.PickFieldNames);
   end;
end;

procedure TDocRecordInterface.EditDoc;
begin
   ShowDBItem(FDocDBItems.ByName('DOC_MAIN'));
end;

function TDocRecordInterface.AfterOpen(DatabaseName: string): Boolean;
begin
   Result:=Open(DatabaseName);
end;

procedure TDocRecordInterface.BeforeClose;
begin
   Close;
end;

procedure TDocRecordInterface.InitFilterInterface(DBItem: TDBItem; BaseDir, RootCaption: string; ShowGroup: Boolean);
begin
   DBItem.InitFilter(FFindOperList, FFindSprList);
   DBItem.FilterInterface.ShowButtons:=ShowGroup;
   DBItem.FilterInterface.ShowGroups:=ShowGroup;
   DBItem.FilterInterface.ShowMiddleSpace:=True;
   DBItem.FilterInterface.BaseDir:=Doc2Sel.GetFilterDirName+BaseDir;
   DBItem.FilterInterface.RootCaption:=RootCaption;
   DBItem.FilterInterface.Section:=DBItem.Name;           
   DBItem.FilterInterface.Ini:=FFindIni;
   DBItem.FilterInterface.AdminUser:=Doc2Sel.IsSystemAdmin;
   DBItem.FilterInterface.OnSelectFindValue:=OnSelectFindValue;
   //������ ����������
   DBItem.InitOrderList(DBItem.FilterInterface.Filter.OrderList);
end;

procedure TDocRecordInterface.InitFindSprList(SprItems: TDBItemList; Enums: TEnumList);
var
   I: Integer;
   DBItem: TDBItem;
   EnumItem: TEnumItem;
begin
   FFindSprList.Clear;
   if SprItems<>nil then begin
      for I:=0 to Pred(SprItems.Count) do begin
         DBItem:=SprItems[I];
         if bsSpr in DBItem.Style then begin
            FFindSprList.AddNew(
               DBItem.Name,
               DBItem.Caption,
               skDataSet,
               DBItem.Table,
               nil{DBItem.KeyList},
               nil{DBItem.PickList.ByName(DBItem.NameFieldName)},
               DBItem.CodeFieldName,
               DBItem.NameFieldName,
               '',
               sekDefault,
               ''
            );
         end;
      end;
   end;
   if Enums<>nil then begin
      for I:=0 to Pred(Enums.Count) do begin
         EnumItem:=Enums[I];
         FFindSprList.AddNew(
            'ENUM_'+EnumItem.Name,
            EnumItem.Caption,
            skStringList,
            nil,
            EnumItem.KeyList,
            EnumItem.PickList,
            '',
            '',
            '',
            sekDefault,
            ''
         );
      end;
   end;
end;

function TDocRecordInterface.OnSelectFindValue(Spr: TSprItem; Ini: TCustomIniFile; Section: string; AutoSave: Boolean; var Value, ValCaption: string): Boolean;
var
   DBItem: TDBItem;
begin
   Result:=False;
   DBItem:=FSprDBItems.FindTable(Spr.Name);
   if (DBItem<>nil) and (Spr.KeyFieldName=DBItem.CodeFieldName) then begin
      if SelectSprValue(DBItem, Value, Spr.KeyFieldName) then begin
         ValCaption:=DBItem.GetFieldValue(Value, Spr.NameFieldName);
         Result:=True;
      end;
   end;
end;

procedure TDocRecordInterface.EditMeta;
begin
   if fEdMeta.EditMeta then begin
      //NB: ���� ������ ������������������� ������� ��������������
   end;
end;

function TDocRecordInterface.GetParNextDay: Integer;
begin
   Result:=Doc2Sel.ParamAsInteger('DR_NEXT_DAY');
end;

function TDocRecordInterface.GetParPrintInd: Boolean;
begin
   Result:=Doc2Sel.ParamAsBoolean('DR_PRINT_IND');
end;

function TDocRecordInterface.GetParShowInfo: Boolean;
begin
   Result:=Doc2Sel.ParamAsBoolean('DR_SHOW_INFO');
end;

function TDocRecordInterface.GetParShowWin: Boolean;
begin
   Result:=Doc2Sel.ParamAsBoolean('DR_SHOW_WIN');
end;

procedure TDocRecordInterface.ShowInfoWin;
begin
   if ParShowWin then begin
      //NB: !!! ������������� ���������� �� ���������� ��� ���� ��������
      if FDocMain.FillDocInfo then begin
         ShowDocInfo(FDocMain.dsDocInfo, ' ������� ��������� ������ �� ���������� �������:');
      end;
      if FAdmProc.FillDocInfo then begin
         ShowDocInfo(FAdmProc.dsDocInfo, ' ������� ��������� ������ �� ���������������� ����������:');
      end;
   end;
end;

procedure TDocRecordInterface.UpdateParam;
var
   I: Integer;
begin
   FDocMain.UpdateParam;
   for I:=0 to Pred(Screen.FormCount) do begin
      if Screen.Forms[I] is TfmTblEdit then begin
         SendMessage(Screen.Forms[I].Handle, WM_USER_UPD_PARAM, 0, 0);
      end;
   end;
end;

procedure TDocRecordInterface.RegisterScript;
begin
   RegisterScriptVar('Doc2Tpl', 'TDoc2Template', Doc2Template);
   RegisterScriptClass(SIRegisterDoc2Template, RIRegisterDoc2Template);
end;

procedure TDocRecordInterface.SetTemplateInterface(TemplateInterface: TTemplateInterface);
begin
   FTemplateInterface:=TemplateInterface;
end;

procedure TDocRecordInterface.EditVisitBook;
begin
   ShowDBItem(FDocDBItems.ByName('VISIT_BOOK'));
end;

procedure TDocRecordInterface.ShowDBItem(DBItem: TDBItem);
var
   GurnalName: string;
   GurnalForm: TfmTblEdit;
begin
   GurnalName:='G_'+DBItem.Name;
   // ���� ������ �� ������
   if FMDIList.IndexOf(GurnalName)=-1 then begin
//SendMessage(fmTest.Handle, WM_SETREDRAW, Ord(False), 0);

///////////////////      DBItem.OpenView;

      GurnalForm:=TfmTblEdit.CreateMDI;
      GurnalForm.AdmOnlyRead:=FAdmOnlyRead;
      GurnalForm.GurnalName:=GurnalName;
      FMDIList.AddObject(GurnalName, GurnalForm);
      Doc2Sel.AddGurnal(GurnalName, GurnalForm);
      GurnalForm.AfterCreate(DBItem, False);
//SendMessage(fmTest.Handle, WM_SETREDRAW, Ord(True), 0);
//fmTest.Invalidate;
//fmTest.Update;
//RedrawWindow(fmTest.Handle, nil, 0, RDW_INVALIDATE);//or RDW_UPDATENOW
      GurnalForm.Show;
   end
   else begin
      {$IFDEF in_sel}
      Doc2Sel.ShowGurnal(GurnalName);
      {$ELSE}
      GurnalForm:=TfmTblEdit(FMDIList.Objects[FMDIList.IndexOf(GurnalName)]);
      GurnalForm.BringToFront;
      GurnalForm.Show;
      {$ENDIF}
   end;
end;

procedure TDocRecordInterface.UpdateSpr(Name: string);
begin
   UpdateSpr(FSprDBItems.ByName(Name));
end;

procedure TDocRecordInterface.EditSpr(Name: string);
begin
   EditSpr(FSprDBItems.ByName(Name));
   if Name='SP_FILELIST'
     then fmChoiceNomen_Refresh:=true;
end;

procedure TDocRecordInterface.UpdateSpr(SprItem: TDBItem);
begin
   if SprItem<>nil then begin
      SprItem.UpdateSpr;
      FDocMain.UpdateSpr(SprItem);
      //FVisitBook.UpdateSpr(SprItem);
      FInfoBook.UpdateSpr(SprItem);
      FDocIn.UpdateSpr(SprItem);
      FDocOut.UpdateSpr(SprItem);
      FAdmProc.UpdateSpr(SprItem);
   end;
end;

procedure TDocRecordInterface.EditSpr(SprItem: TDBItem);
begin
   if SprItem<>nil then begin
      if SprItem.HaveStyle(bsClearFilter) then begin
         SprItem.Table.Filtered:=False;
      end;
      fSprEdit.EditSpr(SprItem, FAdmOnlyRead);
      if SprItem.HaveStyle(bsClearFilter) then begin
         SprItem.Table.Filtered:=True;
      end;
      if not FAdmOnlyRead then begin
         //NB: ??? ������ �������� ���������� ���� ���� �� ���� ������� ��������� � ����������� ???
         UpdateSpr(SprItem);
      end;
   end;
end;

function TDocRecordInterface.CanDeleteAdr(Id: Integer; var Err: string): Boolean;
begin
   //NB: !!! ��������� �������
   //���������.ID >> ADR_ID 
   Result:=FDocMain.DBItem.Table.Locate('ADR_ID', Id, []);
   if Result then begin
      Err:='�� ������� ������ ���� ����������������� ���������.'; //��������� �������
   end;
end;

function TDocRecordInterface.CanDeleteMan(Id: Integer; var Err: string): Boolean;
begin
   //NB: !!! ��������� �������
   //���������.ID >> SIGN_MAN 
   Result:=FDocMain.DBItem.Table.Locate('SIGN_MAN', Id, []);
   if Result then begin
      Err:='�� ������� ���������� ���� ����������������� ���������.'; //���������
   end;
end;

function TDocRecordInterface.CanDeleteNasPunkt(Id: Integer; var Err: string): Boolean;
begin
   //NB: !!! ��������� �������
   //�������������.ID >> SIGN_PLACE 
   Result:=FDocMain.DBItem.Table.Locate('SIGN_PLACE', Id, []);
   if Result then begin
      Err:='�� ������� ����������� ������ ���� ����������������� ���������.'; //��������� �������
   end;
end;

function TDocRecordInterface.CanDeleteOrg(Id: Integer; var Err: string): Boolean;
begin
   //NB: !!! ��������� �������
   //�������������.ID >> SIGN_ORG, COVER_CORR, EXEC_ORG, ORDER_ORG
   Result:=FDocMain.DBItem.Table.Locate('SIGN_ORG', Id, []);
   Result:=Result or FDocMain.DBItem.Table.Locate('COVER_CORR', Id, []);
   Result:=Result or FDocMain.DBItem.Table.Locate('EXEC_ORG', Id, []);
   Result:=Result or FDocMain.DBItem.Table.Locate('ORDER_ORG', Id, []);
   if Result then begin
      Err:='�� ������ ����������� ���� ����������������� ���������.';//���������
   end;
end;

function TDocRecordInterface.GetParUseGroupIdFromLook: Boolean;
begin
   Result:=Doc2Sel.ParamAsBoolean('DR_ID_BY_GROUP');
end;

procedure TDocRecordInterface.EditInfoBook;
begin
   ShowDBItem(FDocDBItems.ByName('INFO_BOOK'));
end;

procedure TDocRecordInterface.EditIncoming;
begin
   ShowDBItem(FDocDBItems.ByName('DOC_IN'));
end;

procedure TDocRecordInterface.EditOutgoing;
begin
   ShowDBItem(FDocDBItems.ByName('DOC_OUT'));
end;

procedure TDocRecordInterface.EditAdmProc;
begin
   ShowDBItem(FDocDBItems.ByName('ADM_PROC'));
end;

{ TDocMain }

constructor TDocMain.Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
begin
   inherited Create(DBItem, RecInt);
   LayoutName:='TfmEditRec';
   TemplateGroup:='DOC_MAIN';
   FDocType:=dtPetition;
   FGroupFilter:=Format('IS_NODE=%d or KIND=%d', [iNode, gkPetition]);
        
   FFileItem:=DBItem.DetailList.ByName('DOC_FILE');
   Assert(FFileItem<>nil, '�� ������ ������ � ����� "DOC_FILE".');
   FDocFile:=TDocFile.Create(FFileItem, RecInt);

   FWorkItem:=DBItem.DetailList.ByName('DOC_WORK');
   Assert(FWorkItem<>nil, '�� ������ ������ � ����� "DOC_WORK".');
   FDocWork:=TDocWork.Create(FWorkItem, RecInt);
   FLinkItem:=DBItem.DetailList.ByName('DOC_LINK');
   Assert(FLinkItem<>nil, '�� ������ ������ � ����� "DOC_LINK".');
   // ������ ���������� � ������� �������� �� ������������ ���������
   FdsDocInfo:=CreateMemTable([
      'DOC_TYPE', Integer(ftInteger), 0,   // ��� ���������
      'ID',       Integer(ftInteger), 0,   // ��� �������� ������
      'NAME',     Integer(ftString),  100, // ������������ ��������
      'VALUE',    Integer(ftInteger), 0,   // ��������
      'FG_COLOR', Integer(ftInteger), 0,   // ���� ������ ��������
      'BG_COLOR', Integer(ftInteger), 0    // ����� ���� ��������
   ], True, True);
   // ������������� "����������"
   //--DBItem.Look.AddItem('BY_GROUP', '�� �������', CDefaultTableViewName, DBItem, GetLookByGroup, OnApplyFilter, dmDocImg.imDocs);
   //--DBItem.Look.AddItem('BY_FOLDER', '�� ������', CDefaultTableViewName, DBItem, GetLookByFolder, OnApplyFilter, dmDocImg.imDocs);
   //--DBItem.Look.AddItem('BY_REG_DATE', '�� ���� �����������', CDefaultTableViewName, DBItem, GetLookByRegDate, OnApplyFilter, dmDocImg.imDocs);
   FNotExec:=Format('%s.EXEC_FACT is null', [DBItem.TableAlias]);
   DBItem.Look.AddItem('BY_EXEC_TERM', '�� ������ ����������', CDefaultTableViewName, DBItem, GetLookByExecTerm, OnApplyFilter, dmDocImg.imDocs, '');
   DBItem.Look.AddItem('BY_SUBJG', '�� �����. ��������� ���������', CDefaultTableViewName, DBItem, GetLookBySubj, OnApplyFilter, nil, 'SP_SUBJG');
   DBItem.Look.AddItem('BY_SUBJ', '�� ��������� ��������� ���������', CDefaultTableViewName, DBItem, GetLookBySubj, OnApplyFilter, nil, 'SP_SUBJ');
   DBItem.Look.AddItem('BY_ANY_TYPE', '�� ����� ���������', CDefaultTableViewName, DBItem, GetLookByAnyType, OnApplyFilter, dmDocImg.imDocs, '');
   DBItem.Look.AddItem('BY_FILE', '�� ������������ ���', CDefaultTableViewName, DBItem, GetLookByFile, OnApplyFilter, nil, 'SP_FILELIST');
end;

destructor TDocMain.Destroy;
begin
   FDocWork.Free;
   FDocFile.Free;
   FdsDocInfo.Free;
   inherited;
end;

procedure TDocMain.OnSetDefaultValue(Sender: TDBItem);
begin
   Sender.SetDestField([
      //����������� ������ �� �������
      'REG_NUM',       GetLastRegNum(FDocType, FGroupId)+1,
      'GROUP_ID',      FGroupId,
      'GROUP_KIND',    FGroupKind,
      //��������� ����� �� ���������
      'DOC_TYPE',      FDocType,             {--dtPetition,}
      'FOLDER_ID',     dfCommon,
      //�����
      'ADR_IN',        False,
      'IS_REPEAT',     False,
      'REQ_ANS',       False,
      'REQ_CHECK',     lNo,
      'VISIT_CHIEF',   False,
      'VISIT_OUT',     False,
      'CHECK_OUT',     False,
      'IN_FILE',       False,
      'FROM_VISIT',    False,
      'TEL_LINE',      False,
      //���� ����������� � ������ ������ ���� ������ ����� ���� �����������
      'REG_DATE',      Date,
      'IN_DATE',       Date,
      'VISIT_DATE',    Date,
      'NOT_EXP',       False         // �� ���������
   ]);
   {
   //����������� ������ �� �������
   Sender.FieldList.ByName('REG_NUM').DestField.AsInteger:=GetLastRegNum(FDocType, FGroupId)+1;
   Sender.FieldList.ByName('GROUP_ID').DestField.AsInteger:=FGroupId;
   Sender.FieldList.ByName('GROUP_KIND').DestField.AsInteger:=FGroupKind;
   //��������� ����� �� ���������
   Sender.FieldList.ByName('DOC_TYPE').DestField.AsInteger:=dtPetition;
   // ����� ������ ��� ������ ������������ �� ������ ���������
   //--Sender.FieldList.ByName('SIGN_TYPE').DestField.AsInteger:=stIndividual;
   //--Sender.FieldList.ByName('APP_FORM').DestField.AsInteger:=stWriting;
   // NB: !!! ���� ������� ���, ��� �� ����� � ����� 1 ������ ���� ������� �� �����������
   Sender.FieldList.ByName('FOLDER_ID').DestField.AsInteger:=dfCommon;
   // �����
   Sender.FieldList.ByName('ADR_IN').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('IS_REPEAT').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('REQ_ANS').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('REQ_CHECK').DestField.AsInteger:=lNo;
   Sender.FieldList.ByName('VISIT_CHIEF').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('VISIT_OUT').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('CHECK_OUT').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('IN_FILE').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('FROM_VISIT').DestField.AsBoolean:=False;
   // ���� ����������� � ������ ������ ���� ������ ����� ���� �����������
   Sender.FieldList.ByName('REG_DATE').DestField.AsDateTime:=Date;
   Sender.FieldList.ByName('IN_DATE').DestField.AsDateTime:=Date;
   Sender.FieldList.ByName('VISIT_DATE').DestField.AsDateTime:=Date;
   }
end;

function TDocMain.OnUpdateTopInfo(Sender: TDBItem; RichEdit: TRichEdit; var TopInfo: string): Boolean;
var
   DayCount: Integer;
   DocCount: Integer;
   DocStr: string;
begin
   Result:=False;
   // �������� ���������� � ����������� ������ ���������� ��������� �������
   if FRecInt.ParShowInfo then begin
      DayCount:=FRecInt.ParNextDay;
      //��������� ����� ��������������� ���������
      DocCount:=GetDocInfo(diExpireTerm);
      if DocCount<>0 then begin
         Result:=True;
         if DocCount=1 then DocStr:='���������' else DocStr:='���������';
         TopInfo:=Format('������� ���������: ����� %d %s �������� ���� ���������� %d %s', [DayCount, DeclensionDay(DayCount), DocCount, DocStr]);
      end;
   end;
end;

procedure TDocMain.OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);
var
   //I: Integer;
   //Template: TTemplate;
   MenuItem: TMenuItem;
begin
   inherited;
   case MenuKind of
      // ���� �������� ����������
      mkWordTemplate: begin
         {Menu.Items.Clear;
         for I:=0 to Pred(FRecInt.TemplateInterface.Engine.TemplateList.Count) do begin
            Template:=FRecInt.TemplateInterface.Engine.TemplateList[I];
            if (Template<>nil) and (AnsiCompareText(TemplateGroup, Template.Group)=0) then begin
               if not SameText(Template.Name, 'RKK_2') and not SameText(Template.Name, 'RKK_4') then begin
                  MenuItem:=TMenuItem.Create(Menu.Owner);
                  MenuItem.Tag:=Integer(Template);
                  MenuItem.Caption:=Template.Caption;
                  if Assigned(OnClick) then begin
                     MenuItem.OnClick:=OnClick;
                  end
                  else begin
                     MenuItem.OnClick:=OnTemplateMenuClick;
                  end;
                  Menu.Items.Add(MenuItem);
               end;
            end;
         end;}
      end;
      // ��������� �������
      mkSysFilter: begin
         Menu.Items.Clear;
         MenuItem:=TMenuItem.Create(Menu.Owner);
         MenuItem.Tag:=0;
         MenuItem.Caption:='������� ���';
         MenuItem.OnClick:=OnClick;
         Menu.Items.Add(MenuItem);
         MenuItem:=TMenuItem.Create(Menu.Owner);
         MenuItem.Tag:=1;
         MenuItem.Caption:='�� �����������';
         MenuItem.OnClick:=OnClick;
         Menu.Items.Add(MenuItem);
      end;
   end;
end;

procedure TDocMain.OnTemplateMenuClick(Sender: TObject);
var
   Template: TTemplate;
   TemplateName: string;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      Template:=TTemplate(TComponent(Sender).Tag);
      if Template<>nil then begin
         {--[2015.01.10] ����� ���� ��� � ����������� �� �������� ���������� �������� ����� ������ � ������� (��. DoTemplate)
         //����� ��� �� ���� ���������
         if SameText(Template.Name, 'RKK_ALL') then begin
            //��������� "����� ����������� ���������"
            case DBItem.EditTable.FieldByName('APP_FORM').AsInteger of
               // ���������
               stWriting: TemplateName:='DOC_MAIN.RKK_2';
               // ���������: � ������� ������
               //--stVisit: TemplateName:='DOC_MAIN.RKK_4';
               // �����
               stVerbal: TemplateName:='DOC_MAIN.RKK_4';
            else
               TemplateName:='';
            end;
            Template:=RecInt.TemplateInterface.Engine.TemplateList.GetByName(TemplateName);
         end;
         --}
         DoTemplate(Template);
      end;
   end;
end;

function TDocMain.GetLookByAnyType(Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
   //--EnumItem: TLookItem;
   //--LookItem: TLookItem;
begin
   Result:=True;
   LookTree.DoExpand:=True;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('��� ���������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:='';
   AddEnumToLook(RootItem, 'APP_FORM', 'APP_FORM');
   AddEnumToLook(RootItem, 'COVER_TYPE', 'COVER_TYPE');
   //NB: ??? ��� �������������� ����������������� ������ - CORR_TYPE
   AddEnumToLook(RootItem, 'APP_KIND', 'APP_KIND');
   AddEnumToLook(RootItem, 'SIGN_TYPE', 'SIGN_TYPE');
   AddEnumToLook(RootItem, 'SIGN_KIND', 'SIGN_KIND');
   AddEnumToLook(RootItem, 'ANS_KIND', 'ANS_KIND');
(*--
   Result:=True;
   //NB: !!! !!! ���������� �� �������������� ��������� �� ������ Enum !!! !!!
   LookTree.DoExpand:=True;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('��� ���������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:='';
   //����� ����������� ���������
   EnumItem:=RootItem.Child.AddItem('����� ����������� ���������',  True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   EnumItem.Value:=Format('d.APP_FORM is not null', []);
   LookItem:=EnumItem.Child.AddItem('���������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.APP_FORM=%d', [stWriting]);
   LookItem:=EnumItem.Child.AddItem('�����', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.APP_FORM=%d', [stVerbal]);
   //--LookItem:=EnumItem.Child.AddItem('� ������� ������', False, True, False, -1, -1, -1);
   //--LookItem.Value:=Format('d.APP_FORM=%d', [stVisit]);
   LookItem:=EnumItem.Child.AddItem('�� ����������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.APP_FORM is null', []);
   //��� ����������������� ������
   EnumItem:=RootItem.Child.AddItem('��� ����������������� ������',  True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   EnumItem.Value:=Format('d.COVER_TYPE is not null', []);
   LookItem:=EnumItem.Child.AddItem('������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.COVER_TYPE=%d', [ctCover]);
   LookItem:=EnumItem.Child.AddItem('���������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.COVER_TYPE=%d', [ctJob]);
   LookItem:=EnumItem.Child.AddItem('�����������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.COVER_TYPE=%d', [ctDirect]);
   LookItem:=EnumItem.Child.AddItem('�� ����������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.COVER_TYPE is null', [ctDirect]);
   //NB: ??? ���������
   {
   // ��� �������������� ����������������� ������ - CORR_TYPE
   tcHigh   = 1; // ����������� ��������������� �����
   tcMedia  = 2; // ���
   tcOther  = 9; // ������
   }
   //��� ���������
   EnumItem:=RootItem.Child.AddItem('��� ���������',  True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   EnumItem.Value:=Format('d.APP_KIND is not null', []);
   LookItem:=EnumItem.Child.AddItem('�����������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.APP_KIND=%d', [dcProposal]);
   LookItem:=EnumItem.Child.AddItem('���������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.APP_KIND=%d', [dcClaim]);
   LookItem:=EnumItem.Child.AddItem('������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.APP_KIND=%d', [dcComplaint]);
   LookItem:=EnumItem.Child.AddItem('�� ����������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.APP_KIND is null', [dcComplaint]);
   //��� �������
   EnumItem:=RootItem.Child.AddItem('��� �������',  True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   EnumItem.Value:=Format('d.SIGN_TYPE is not null', []);
   LookItem:=EnumItem.Child.AddItem('��������������', False, True, False, -1, -1, -1, -1);
   //--LookItem.Value:=Format('d.SIGN_TYPE in (%d, %d, %d)', [stIndividual, skUL, skIP]);
   LookItem.Value:=Format('d.SIGN_TYPE=%d', [stIndividual{--, skUL, skIP}]);
   //--LookItem.Child.AddItem('��', False, True, False, -1, -1, -1).Value:=Format('d.SIGN_TYPE=%d', [stIndividual]);
   //--LookItem.Child.AddItem('��', False, True, False, -1, -1, -1).Value:=Format('d.SIGN_TYPE=%d', [skUL]);
   //--LookItem.Child.AddItem('��', False, True, False, -1, -1, -1).Value:=Format('d.SIGN_TYPE=%d', [skIP]);
   LookItem:=EnumItem.Child.AddItem('������������', False, True, False, -1, -1, -1, -1);
   //--LookItem.Value:=Format('d.SIGN_TYPE in (%d, %d)', [stGroup, stGroup30]);
   LookItem.Value:=Format('d.SIGN_TYPE=%d', [stGroup{--, stGroup30}]);
   LookItem:=EnumItem.Child.AddItem('���������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.SIGN_TYPE=%d', [stAnonym]);
   //��� ��������� �������
   EnumItem:=RootItem.Child.AddItem('��� ��������� �������',  True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   EnumItem.Value:=Format('d.ANS_KIND is not null', []);
   LookItem:=EnumItem.Child.AddItem('�������������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.ANS_KIND=%d', [rtSatisfy]);
   LookItem:=EnumItem.Child.AddItem('��������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.ANS_KIND=%d', [rtRefuse]);
   LookItem:=EnumItem.Child.AddItem('����������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.ANS_KIND=%d', [rtExplain]);
   LookItem:=EnumItem.Child.AddItem('�� ����������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('d.ANS_KIND is null', []);
*)
end;

{--function TDocMain.GetLookByExecTerm(Name: string; LookTree: TLookTree): Boolean;
var
   I: Integer;
   S: string;
   NotExecWhere: string;
   NextDay: Integer;
   RootItem: TLookItem;
   ChildItem: TLookItem;
begin
   Result:=True;
   // NB: !!! ��� ���������� (� �.�. �������)
   NotExecWhere:=Format('d.EXEC_FACT is null and d.EXEC_TERM is not null', []);
   NextDay:=FRecInt.ParNextDay;
   if NextDay<=0 then NextDay:=7 else if NextDay>31 then NextDay:=31;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('���� ����������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:='d.EXEC_FACT is null';
   //
   ChildItem:=RootItem.Child.AddItem('�� ����������', False, True, True, DI_RegDate, -1, -1, -1);
   ChildItem.Value:='d.EXEC_FACT is null and d.EXEC_TERM is null';
   //
   ChildItem:=RootItem.Child.AddItem('��������', False, True, True, DI_RegDate, -1, -1, -1);
   //--ChildItem.Value:=Format('%s and curdate()>isnull(d.EXT_TERM, d.EXEC_TERM)', [NotExecWhere]);
   ChildItem.Value:=Format('%s and curdate()>d.EXEC_TERM', [NotExecWhere]);
   //
   ChildItem:=RootItem.Child.AddItem('�������', False, True, True, DI_RegDate, -1, -1, -1);
   //--ChildItem.Value:=Format('%s and curdate()=isnull(d.EXT_TERM, d.EXEC_TERM)', [NotExecWhere]);
   ChildItem.Value:=Format('%s and curdate()=d.EXEC_TERM', [NotExecWhere]);
   //
   //--S:='�������';
   S:='�����';
   for I:=1 to NextDay do begin
      ChildItem:=RootItem.Child.AddItem(Format('%s %d %s', [S, I, DeclensionDay(I)]), False, True, True, DI_RegDate, -1, -1, -1);
      //--ChildItem.Value:=Format('%s and isnull(d.EXT_TERM, d.EXEC_TERM)-curdate()=%d', [NotExecWhere, I]);
      ChildItem.Value:=Format('%s and d.EXEC_TERM-curdate()=%d', [NotExecWhere, I]);
      //--S:='��������';
   end;
   //
   if ((NextDay>10) and (NextDay<20)) or ((NextDay mod 10)=0) then S:='-�� ����'
   else if (NextDay mod 10)=1 then S:='-��� ���'
   else if (NextDay mod 10)<5 then S:='-� ����'
   else S:='-�� ����';
   ChildItem:=RootItem.Child.AddItem(Format('������ %d%s', [NextDay, S]), False, True, True, DI_RegDate, -1, -1, -1);
   //--ChildItem.Value:=Format('%s and isnull(d.EXT_TERM, d.EXEC_TERM)-curdate()>%d', [NotExecWhere, NextDay]);
   ChildItem.Value:=Format('%s and d.EXEC_TERM-curdate()>%d', [NotExecWhere, NextDay]);
end;}

procedure TDocMain.UpdateSpr(SprItem: TDBItem);
{--
const
   CSpr2LookTree: array [1..4] of record
      SprName: string;
      LookName: string;
   end=(
      (SprName: 'SP_FOLDER';   LookName: 'BY_FOLDER'),  // ����� ����������
      (SprName: 'SP_FILELIST'; LookName: 'BY_FILE'),    // ������������ ���
      (SprName: 'SP_SUBJ';     LookName: 'BY_SUBJ'),    // ��������
      (SprName: 'SP_DOCGROUP'; LookName: 'BY_GROUP')    // ������ ����������
   );
var
   I: Integer;
   LookTree: TLookTree;
}
begin
{--
   // ���� ��������� ����������, ��������� � ������� �������
   for I:=Low(CSpr2LookTree) to High(CSpr2LookTree) do begin
      if SameText(SprItem.Name, CSpr2LookTree[I].SprName) then begin
         LookTree:=DBItem.Look.ByName(CSpr2LookTree[I].LookName);
         if LookTree<>nil then begin
            LookTree.Rebuild:=True;
         end;
         Break;
      end;
   end;
}
   inherited;
end;

procedure TDocMain.UpdateParam;
var
   LookTree: TLookTree;
begin
   //���������� ������ ��������� diExpireTerm
   //--UpdateDocInfoName(diExpireTerm);
   //���������� "�� ������ ����������"
   LookTree:=DBItem.Look.ByName('BY_EXEC_TERM');
   if LookTree<>nil then begin
      LookTree.Rebuild:=True;
   end;
end;

procedure TDocMain.OnExecAction(Sender: TDBItem);
begin
   if FillDocInfo then begin
      ShowDocInfo(FdsDocInfo, ' ������� ��������� ������ �� ���������� �������:');
   end;
end;

procedure TDocMain.OnBeforeClose(Sender: TDBItem);
begin
   inherited;
   FdsDocInfo.EmptyTable;
   //NB: !!! ??? !!! ??? FillDocInfo;
end;

function TDocMain.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
var
   fm: TfmEditRec;
begin
   Result:=False;
   if inherited OnViewRecord(Sender, ViewMode) then begin
      FDocWork.ViewMode:=ViewMode;
      //
      fm:=TfmEditRec.Create(nil);
      OnSetControl:=fm.SetControl;
      OnResetControl:=fm.ResetControl;
      OnSetControlEvent:=fm.SetControlEvent;
      OnClearControlEvent:=fm.ClearControlEvent;
      OnInvokeControlEvent:=fm.InvokeControlEvent;
      OnUpdateEnabledAction:=fm.UpdateEnabledAction;
      OnSetControlPosition:=fm.SetControlPosition;
      try
         fm.Doc:=Self;
         Result:=Edit(fm);
      finally
         fm.Free;
      end;
   end;
end;
procedure TDocMain.OnEditButtonClick(Sender: TObject; var Handled: Boolean);
var
   FieldItem: TFieldItem;
   KeyValue: string;
   LinkSpr: TDBItem;
   SignKind: TFieldItem;{+}
   SprName: string;
   n:Integer;
begin
   if (Screen.ActiveControl is TDBLookupComboboxEh) and (DBItem.FieldList.ByName('SUBJ_ID')=TFieldItem(TDBLookupComboboxEh(Screen.ActiveControl).Tag)) then begin
      FieldItem:=TFieldItem(TDBLookupComboboxEh(Screen.ActiveControl).Tag);
//      SignKind:=DBItem.FieldList.ByName('SIGN_KIND');
      KeyValue:=FieldItem.DestField.AsString;
      SprName:='SP_SUBJ'+Def_SprDocSubj; //'SP_SUBJG'��� 'SP_SUBJ'
      if (KeyValue<>'') then begin
        n:=StrToIntDef(KeyValue, 0);
        if (n>0) then begin
          if (n<10000)
            then SprName:='SP_SUBJ'
            else SprName:='SP_SUBJG';
        end;
      end;
      LinkSpr:=FRecInt.SprDBItems.ByName(SprName);
      if LinkSpr<>nil then begin
         if SelectSprValue(LinkSpr, KeyValue, LinkSpr.CodeFieldName) then begin
            if FieldItem.CanEdit then begin
               FieldItem.DBItem.EditTable.Edit;
               FieldItem.DestField.AsString:=KeyValue;
            end;
         end;
      end;
      Handled:=True;
   end
   else begin
      inherited;
   end;
end;

procedure TDocMain.OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean);
begin
   inherited;
   Sender.SetSrcField([
      'VISIT_DATE',   EditField['REG_DATE'].AsDateTime
   ]);
end;

procedure TDocMain.OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh); // vadim 16.08.2018
var
   ObrId: Integer;
begin
   if SameText(TColumnEh(Sender).FieldName, 'SUBJ_ID') then begin
      ObrId:=TColumnEh(Sender).Field.AsInteger;
      if ObrId>10000 then begin
         if dmBase.SprDocSubjG.Locate('ID', ObrId, []) then begin
            Params.Text:=Trim(dmBase.SprDocSubjG.FieldByName('CODE').AsString)+' '+Trim(dmBase.SprDocSubjG.FieldByName('NAME').AsString);
         end
      end
      else begin
         if dmBase.SprDocSubj.Locate('ID', ObrId, []) then begin
            Params.Text:=Trim(dmBase.SprDocSubj.FieldByName('CODE').AsString)+' '+Trim(dmBase.SprDocSubj.FieldByName('NAME').AsString);
         end
      end;
   end;
end;

function TDocMain.SelectDocument(var Query: TAdsQuery; Bookmark: TStringList): Boolean;
begin
   Result:=fSelDoc.SelectDocument(Self, Query, Bookmark)
end;

function TDocMain.EditDocLink(DBItem: TDBItem; DataSet: TDataSet; DataSource: TDataSource; ViewMode: TViewMode): Boolean;
begin
    Result:=fEdLink.EditDocLink (DBItem, DataSet, DataSource, ViewMode, FDocType);
end;

function TDocMain.AddInTemplateMenu(Template: TTemplate): Boolean;
begin
   {--[2015.01.10]
   Result:=False;
   if inherited AddInTemplateMenu(Template) then begin
      Result:=not SameText(Template.Name, 'RKK_2') and
              not SameText(Template.Name, 'RKK_4');
   end;
   --}
   Result:=inherited AddInTemplateMenu(Template);
end;

{ TDoc2Template }

constructor TDoc2Template.Create;
begin
end;

function TDoc2Template.DataSet(TableName: string): TDataSet;
var
   DBItem: TDBItem;
begin
   Result:=nil;
   DBItem:=FDetailList.ByName(TableName);
   if DBItem<>nil then begin
      Result:=DBItem.EditTable;
   end;
end;

destructor TDoc2Template.Destroy;
begin
   inherited;
end;

function TDoc2Template.Field(FieldName: string): TField;
begin
   Result:=FDataSet.FieldByName(FieldName);
end;

procedure SIRegisterDoc2Template(Cl: TIFPSPascalCompiler);
begin
   //����� ����������� ��������� - APP_FORM
   Cl.AddConstantN('stWriting', 'Integer').Value.ts32 := stWriting;
   Cl.AddConstantN('stVerbal', 'Integer').Value.ts32 := stVerbal;
   Cl.AddConstantN('stElect', 'Integer').Value.ts32 := stElect;
   //��� ��������� - SIGN_KIND
   Cl.AddConstantN('skMan', 'Integer').Value.ts32 := skMan;
   Cl.AddConstantN('skUL', 'Integer').Value.ts32 := skUL;
   Cl.AddConstantN('skIP', 'Integer').Value.ts32 := skIP;
   with Cl.AddClassN(cl.FindClass('TDOC2TEMPLATE'), 'TDOC2TEMPLATE') do begin
      RegisterMethod('function Field(FieldName: string): TField;');
      RegisterMethod('function PickName(FieldName: string; CaseKind: Char): string;');
      RegisterMethod('function FromSpr(FieldName, GetName: string; CaseKind: Char): string;');
      RegisterMethod('function FromSpr2(FieldName, SprName, GetName: string; CaseKind: Char): string;');
      RegisterMethod('function DataSet(TableName: string): TDataSet;');
      RegisterMethod('function ParamAsString(ParamName: string): string;');
      RegisterMethod('function ParamAsFloat(ParamName: string): Extended;');
      RegisterMethod('function ParamAsInteger(ParamName: string): Integer;');
      RegisterMethod('function ParamAsBoolean(ParamName: string): Boolean;');
   end;
end;

procedure RIRegisterDoc2Template(Cl: TIFPSRuntimeClassImporter);
begin
   with Cl.Add(TDoc2Template) do begin
      RegisterMethod(@TDoc2Template.Field, 'FIELD');
      RegisterMethod(@TDoc2Template.DataSet, 'DATASET');
      RegisterMethod(@TDoc2Template.PickName, 'PICKNAME');
      RegisterMethod(@TDoc2Template.FromSpr, 'FROMSPR');
      RegisterMethod(@TDoc2Template.FromSpr2, 'FROMSPR2');
      RegisterMethod(@TDoc2Template.ParamAsString, 'PARAMASSTRING');
      RegisterMethod(@TDoc2Template.ParamAsFloat, 'PARAMASFLOAT');
      RegisterMethod(@TDoc2Template.ParamAsInteger, 'PARAMASINTEGER');
      RegisterMethod(@TDoc2Template.ParamAsBoolean, 'PARAMASBOOLEAN');
   end;
end;

function TDoc2Template.FromSpr(FieldName, GetName: string; CaseKind: Char): string;
var
   FieldItem: TFieldItem;
   Spr: TDBItem;
begin
   Result:=Field(FieldName).AsString;
   FieldItem:=FFieldList.ByName(FieldName);
   if (FieldItem<>nil) and (FieldItem.LinkStyle=lsLinkSpr) and (Result<>'') then begin
      Spr:=FieldItem.LinkSpr;
      if Spr.Table.Locate(Spr.KeyFieldNames, Result, []) then begin
         Result:=Spr.Table.FieldByName(GetName).AsString;
         case CaseKind of
            'F': Result:=OneCap2(Result);
            'O': Result:=OneCap(Result);
            'L': Result:=AnsiLowerCase(Result);
            'U': Result:=AnsiUpperCase(Result);
         end;
      end;
   end;
end;

function TDoc2Template.FromSpr2(FieldName, SprName, GetName: string; CaseKind: Char): string;
var
   FieldItem: TFieldItem;
   Spr: TDBItem;
begin
   Result:=Field(FieldName).AsString;
   FieldItem:=FFieldList.ByName(FieldName);
   Spr:=FSprDBItems.ByName(SprName);
   if (FieldItem<>nil) and (Spr<>nil) and (Result<>'') then begin
      if Spr.Table.Locate(Spr.KeyFieldNames, Result, []) then begin
         Result:=Spr.Table.FieldByName(GetName).AsString;
         case CaseKind of
            'F': Result:=OneCap2(Result);
            'O': Result:=OneCap(Result);
            'L': Result:=AnsiLowerCase(Result);
            'U': Result:=AnsiUpperCase(Result);
         end;
      end;
   end;
end;

function TDoc2Template.ParamAsBoolean(ParamName: string): Boolean;
begin
   Result:=Doc2Sel.ParamAsBoolean(ParamName);
end;

function TDoc2Template.ParamAsFloat(ParamName: string): Extended;
begin
   Result:=Doc2Sel.ParamAsFloat(ParamName);
end;

function TDoc2Template.ParamAsInteger(ParamName: string): Integer;
begin
   Result:=Doc2Sel.ParamAsInteger(ParamName);
end;

function TDoc2Template.ParamAsString(ParamName: string): string;
begin
   Result:=Doc2Sel.ParamAsString(ParamName);
end;

function TDoc2Template.PickName(FieldName: string; CaseKind: Char): string;
var
   FieldItem: TFieldItem;
begin
   Result:=Field(FieldName).AsString;
   FieldItem:=FFieldList.ByName(FieldName);
   if FieldItem<>nil then begin
      case FieldItem.LinkStyle of
         // ��� �����������
         lsNone:;
         // ���� ������������ ����������
         lsLinkSpr: begin
            //NB: !!!
         end;
         // ���� ������������ ������������ ��������
         lsLinkEnum: begin
            Result:=FieldItem.LinkEnum.GetName(Result);
         end;
         // ���� ����������� ������ �������� (NB: ��� ����������� ���� �� ��������)
         lsOwnPickList:;
      end;
      case CaseKind of
         'F': Result:=OneCap2(Result);
         'O': Result:=OneCap(Result);
         'L': Result:=AnsiLowerCase(Result);
         'U': Result:=AnsiUpperCase(Result);
      end;
   end;
end;

procedure TDoc2Template.SetDBItem(DBItem: TDBItem; SprDBItems: TDBItemList);
begin
   FDBItem:=DBItem;
   if DBItem<>nil then begin
      FDetailList:=DBItem.DetailList;
      FFieldList:=DBItem.FieldList;
      FDataSet:=DBItem.EditTable;
      FSprDBItems:=SprDBItems;
   end
   else begin
      FDetailList:=nil;
      FFieldList:=nil;
      FDataSet:=nil;
      FSprDBItems:=nil;
   end;
end;

{ TVisitBook }

constructor TVisitBook.Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
begin
   inherited Create(DBItem, RecInt);
   LayoutName:='TfmEdVBook';
   FDocType:=dtPetition;
end;

destructor TVisitBook.Destroy;
begin
   inherited;
end;

function TVisitBook.GetLastVisitNum(DocType: Integer): Integer;
begin
   Result:=QueryIntegerValue(
      'select top 1 v.VISIT_NUM from DOCMAIN v '+
      //--'where v.DOC_TYPE=%d and (v.APP_FORM=%d or v.APP_FORM=%d) '+
      'where v.DOC_TYPE=%d and v.APP_FORM=%d '+
      'order by v.VISIT_PLAN desc, v.VISIT_NUM desc',
      [FDocType, {--stVisit,} stVerbal], 0
   );
end;

procedure TVisitBook.OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);
var
   MenuItem: TMenuItem;
begin
   case MenuKind of
      // ���� �������� ����������
      mkWordTemplate: begin
      end;
      // ��������� �������
      mkSysFilter: begin
         Menu.Items.Clear;
         MenuItem:=TMenuItem.Create(Menu.Owner);
         MenuItem.Tag:=0;
         MenuItem.Caption:='������� ���';
         MenuItem.OnClick:=OnClick;
         Menu.Items.Add(MenuItem);
      end;
   end;
end;

procedure TVisitBook.OnSetDefaultValue(Sender: TDBItem);
begin
   Sender.SetDestField([
      //����������� ������ �� �������
      'VISIT_NUM',    GetLastVisitNum(FDocType)+1,
      //����������� ������ �� �������
      'REG_NUM',      GetLastRegNum(FDocType, -1)+1,
      //��������� ����� �� ���������
      'DOC_TYPE',     FDocType,                     {--dtPetition,}
      'GROUP_KIND',   gkPetition,
      'SIGN_TYPE',    stIndividual,
      'APP_FORM',     stVerbal,
      'FOLDER_ID',    dfCommon,
      // �����
      'ADR_IN',       False,
      'IS_REPEAT',    False,
      'REQ_ANS',      False,
      'REQ_CHECK',    lNo,
      'VISIT_CHIEF',  False,
      'VISIT_OUT',    False,
      'CHECK_OUT',    False,
      'IN_FILE',      False,
      // ���� ������ �� �����
      'VISIT_PLAN',   Date,
      //���� �����������
      'REG_DATE',     Date,
      'IN_DATE',      Date,
      'NOT_EXP',      False         // �� ���������
   ]);
   {
   //����������� ������ �� �������
   Sender.FieldList.ByName('VISIT_NUM').DestField.AsInteger:=GetLastVisitNum(dtPetition)+1;
   //����������� ������ �� �������
   Sender.FieldList.ByName('REG_NUM').DestField.AsInteger:=GetLastRegNum(dtPetition)+1;
   //��������� ����� �� ���������
   Sender.FieldList.ByName('DOC_TYPE').DestField.AsInteger:=dtPetition;
   Sender.FieldList.ByName('GROUP_KIND').DestField.AsInteger:=gkPetition;
   Sender.FieldList.ByName('SIGN_TYPE').DestField.AsInteger:=stIndividual;
   Sender.FieldList.ByName('APP_FORM').DestField.AsInteger:=stVerbal;
   // NB: !!! ���� ������� ���, ��� �� ����� � ����� 1 ������ ���� ������� �� �����������
   Sender.FieldList.ByName('FOLDER_ID').DestField.AsInteger:=dfCommon;
   // �����
   Sender.FieldList.ByName('ADR_IN').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('IS_REPEAT').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('REQ_ANS').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('REQ_CHECK').DestField.AsInteger:=lNo;
   Sender.FieldList.ByName('VISIT_CHIEF').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('VISIT_OUT').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('CHECK_OUT').DestField.AsBoolean:=False;
   Sender.FieldList.ByName('IN_FILE').DestField.AsBoolean:=False;
   // ���� ������ �� �����
   Sender.FieldList.ByName('VISIT_PLAN').DestField.AsDateTime:=Date;
   //���� �����������
   Sender.FieldList.ByName('REG_DATE').DestField.AsDateTime:=Date;
   Sender.FieldList.ByName('IN_DATE').DestField.AsDateTime:=Date;
   }
end;

function TVisitBook.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
begin
   Result:=False;
   if inherited OnViewRecord(Sender, ViewMode) then begin
//      FormLayout:=GetLayout('TfmEdVBook');
//      Result:=EditVisitBook(Self);
   end;
end;

{ TInfoBook }

constructor TInfoBook.Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
begin
   inherited Create(DBItem, RecInt);
   LayoutName:='TfmEdInfo';
   FDocType:=dtInfo;
   FGroupFilter:=Format('IS_NODE=%d or KIND=%d', [iNode, gkInfo]);
   FFileItem:=DBItem.DetailList.ByName('DOC_FILE');
   Assert(FFileItem<>nil, '�� ������ ������ � ����� "DOC_FILE".');
   FDocFile:=TDocFile.Create(FFileItem, RecInt);
   // ������������� "����������"
   //--DBItem.Look.AddItem('BY_GROUP', '�� �������', CDefaultTableViewName, DBItem, GetLookByGroup, OnApplyFilter, dmDocImg.imDocs);
end;

destructor TInfoBook.Destroy;
begin
   FDocFile.Free;
   inherited;
end;

procedure TInfoBook.OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean);
begin
   inherited;
   Sender.SetSrcField([
      'VISIT_DATE',   EditField['REG_DATE'].AsDateTime,
      'ANS_DATE',      EditField['EXEC_FACT'].AsDateTime
   ]);
end;

procedure TInfoBook.OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);
var
   MenuItem: TMenuItem;
begin
   case MenuKind of
      // ���� �������� ����������
      mkWordTemplate: begin
      end;
      // ��������� �������
      mkSysFilter: begin
         Menu.Items.Clear;
         MenuItem:=TMenuItem.Create(Menu.Owner);
         MenuItem.Tag:=0;
         MenuItem.Caption:='������� ���';
         MenuItem.OnClick:=OnClick;
         Menu.Items.Add(MenuItem);
      end;
   end;
end;

procedure TInfoBook.OnSetDefaultValue(Sender: TDBItem);
begin
   //? REG_IND - ���������������� ������
   //��������� �������� ����� �� ���������
   Sender.SetDestField([
      'DOC_TYPE',    FDocType,     // ��� ��������� - �������
      'APP_FORM',    stVerbal,     // ����� ����������� ��������� - �����
      'APP_KIND',    dcClaim,      // ��� ��������� - ���������
      'SIGN_TYPE',   stIndividual, // ��� ������� ��������� - ��������������
      //'COVER_TYPE'               // ��� ����������������� ������
      //'CORR_TYPE'                // ��������� ��������� ��
      'REQ_CHECK',   lNo,          // ����: �������� - ���
      //'ANS_KIND'                 // ��� ��������� �������
      'SIGN_KIND',   skMan,        // ��� ���������
      'ADR_IN',      False,        // ����: �� ���������� ��������� - ���
      'IS_REPEAT',   False,        // ����: ��������� ��������� - ���
      'REQ_ANS',     True,         // ����: ��������� ����� - ��
      'CHECK_OUT',   False,        // ����: c���� � �������� ��� ��������� - ���
      'IN_FILE',     False,        // ����: � ���� - ���
      'VISIT_OUT',   False,        // ����: ����� �������� ��� � ��������� - ���
      'VISIT_CHIEF', False,        // ����: ����� ��� ������������ - ���
      'FROM_VISIT',  False,        // ����: � ������� ������ - ���
      'FOLDER_ID',   dfCommon,     // ������� ����� ��������� - �����
      'SIGN_NUM',    1,            // ���������� �������
      // ���� ����������� � ������ ������ ���� ������ ����� ���� �����������
      'REG_DATE',    Date,         // ���� �����������
      'IN_DATE',     Date,         // [=REG_DATE] ���� �����������
      'VISIT_DATE',  Date,         // [=REG_DATE] ����������� ���� � ����� ������
      //����������� ������ �� �������
      'REG_NUM',     GetLastRegNum(FDocType, FGroupId)+1,
      //������ ����������
      'GROUP_ID',    FGroupId,     // ������ ���������
      'GROUP_KIND',  FGroupKind,   // ������� ������ ���������
      'PAYMENT',     0,            // ������ �����
      'NOT_EXP',     False         // �� ���������
   ]);
end;

function TInfoBook.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
var
   fm: TfmEdInfo;
begin
   Result:=False;
   if inherited OnViewRecord(Sender, ViewMode) then begin
      FDocFile.ViewMode:=ViewMode;
      //
      fm:=TfmEdInfo.Create(nil);
      OnSetControl:=fm.SetControl;
      OnResetControl:=fm.ResetControl;
      OnSetControlEvent:=fm.SetControlEvent;
      OnClearControlEvent:=fm.ClearControlEvent;
      OnInvokeControlEvent:=fm.InvokeControlEvent;
      OnUpdateEnabledAction:=fm.UpdateEnabledAction;
      OnSetControlPosition:=fm.SetControlPosition;
      //OnClearModified:=fm.ClearModified;
      //OnSaveLayout:=fm.SaveLayout;
      //OnLoadLayout:=fm.LoadLayout;
      try
         fm.Doc:=Self;
         Result:=Edit(fm);
      finally
         fm.Free;
      end;
   end;
end;

{ TDBDocument }

constructor TDBDocument.Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
begin
   inherited Create(DBItem);
   FMyValue:='';
   FRecInt:=RecInt;
   FDocType:=-1;
   FGroupKind:=-1;
   FGroupId:=-1;
   FGroupIdFromLook:=-1;
   FGroupIdLastSel:=-1;
   FGroupFilter:='';
   FGroupFormula:='';
   // ������������� "����������"
   DBItem.Look.AddItem('BY_GROUP', '�� �������', CDefaultTableViewName, DBItem, GetLookByGroup, OnApplyFilter, dmDocImg.imDocs, 'SP_DOCGROUP');
   DBItem.Look.AddItem('BY_FOLDER', '�� ������', CDefaultTableViewName, DBItem, GetLookByFolder, OnApplyFilter, dmDocImg.imDocs, 'SP_FOLDER');
   DBItem.Look.AddItem('BY_REG_DATE', '�� ���� �����������', CDefaultTableViewName, DBItem, GetLookByRegDate, OnApplyFilter, dmDocImg.imDocs, '');
   DBItem.Look.AddItem('BY_EXEC_MAN', '�� ������������', CDefaultTableViewName, DBItem, GetLookByExecMan, OnApplyFilter, dmDocImg.imDocs, 'SP_OFFICIAL');
   DBItem.Look.AddItem('BY_VISIT_MAN', '�� ������������', CDefaultTableViewName, DBItem, GetLookByVisitMan, OnApplyFilter, dmDocImg.imDocs, 'SP_OFFICIAL');
end;

destructor TDBDocument.Destroy;
begin
   inherited;
end;

function TDBDocument.GetLastRegNum(DocType, GroupId: Integer): Integer;
begin
   Result:=QueryIntegerValue(
      'select top 1 d.REG_NUM from DOCMAIN d '+
      'where d.DOC_TYPE=%d and d.GROUP_ID=%d '+
      'order by d.REG_DATE desc, d.REG_NUM desc ',
      [FDocType, GroupId], 0
   );
end;

function TDBDocument.GetRegInd(DocType, GroupId: Integer; sNamePar:String; lCheckDelo:Boolean):String;
var
  sDelo,sGrup,sFormula:String;
  lDelo:Boolean;
begin       // ???
  if (GroupId>0) and dmBase.SprDocGroup.Locate('ID', GroupID, []) then begin
    sFormula:=GlobalTask.ParamAsString(sNamePar);
    sGrup:=dmBase.SprDocGroup.FieldByName('IND').AsString;
    if Pos('%', sGrup)>0  then begin  // � sGrup �� ���������, � ������� !!!
      sFormula:=sGrup;
      sGrup:='';
    end;
    if (Pos('%����',ANSILowerCase(sFormula))=0)
      then lDelo:=false
      else lDelo:=true;
    if not lDelo or not lCheckDelo then begin
      sDelo:='?';
      if lDelo then begin
        if (EditField['FILE_ID'].AsString<>'') and dmBase.SprDocFileList.Locate('ID', EditField['FILE_ID'].AsString, [])
          then sDelo:=dmBase.SprDocFileList.FieldByName('FILE_IND').AsString;
      end;
      Result:=sFormula;
      Result:=StringReplace(Result,'%����',sDelo,[rfReplaceAll,rfIgnoreCase]);
      Result:=StringReplace(Result,'%���',sGrup,[rfReplaceAll,rfIgnoreCase]);
      Result:=StringReplace(Result,'%���',IntToStr(YearOf(Date)),[rfReplaceAll,rfIgnoreCase]);
      if Pos('%���',ANSILowerCase(Result))>0
        then  Result:=StringReplace(Result,'%���',GlobalTask.ParamAsString('CONST_IND'),[rfReplaceAll,rfIgnoreCase]);
      Result:=StringReplace(Result,'%�����',EditField['REG_NUM'].AsString,[rfReplaceAll,rfIgnoreCase]);
    end;
  end;
end;

procedure TDBDocument.OnAfterReadRecord(Sender: TDBItem);
begin
   //������ ���������� ���������, ������� ������ ��������
   FGroupKind:=DBItem.FieldList.ByName('GROUP_KIND').DestField.AsInteger;
   FGroupId:=DBItem.FieldList.ByName('GROUP_ID').DestField.AsInteger;
end;

procedure TDBDocument.OnBeforeClose(Sender: TDBItem);
begin
   FGroupId:=-1;
   FGroupKind:=-1;
   FGroupIdFromLook:=-1;
   FGroupIdLastSel:=-1;
end;

function TDBDocument.OnApplyFilter(LookTree: TLookTree; LookItem: TLookItem): Boolean;
begin
   Result:=True;
   if SameText(LookTree.Name, 'BY_GROUP') then begin
      FGroupIdFromLook:=LookItem.Id;
   end
   else begin
      FGroupIdFromLook:=-1;
   end;
end;

function TDBDocument.OnBeforeNewRecord(Sender: TDBItem): Boolean;
var
   GroupSpr: TDBItem;
   KeyValue: string;
begin
   Result:=False;
   KeyValue:='';
   GroupSpr:=DBItem.FieldList.ByName('GROUP_ID').LinkSpr;
   if GroupSpr<>nil then begin
      if FRecInt.GetParUseGroupIdFromLook and (FGroupIdFromLook>0) then begin
         if GroupSpr.Table.Locate('ID', FGroupIdFromLook, []) then begin
            FGroupId:=FGroupIdFromLook;
            FGroupKind:=GroupSpr.Table.FieldByName('KIND').AsInteger;
            Result:=(FGroupId>0) and (FGroupKind>0);
         end;
      end;
      if not Result then begin
         FGroupIdLastSel:=fSelGrp.SelectGroup(DBItem.Look.ByName('BY_GROUP'), FGroupIdLastSel, DBItem.LayoutList);
         if FGroupIdLastSel<>-1 then begin
            FGroupId:=FGroupIdLastSel;
            FGroupKind:=StrToIntDef(GroupSpr.GetFieldValue(IntToStr(FGroupId), 'KIND'), -1);
            Result:=(FGroupId>0) and (FGroupKind>0);
            if (FGroupKind<=0) and (FGroupId>0) then begin
               if GroupSpr.Table.Locate('ID', FGroupId, []) then begin
                  MessageDlgR(Format('���� ���������� "��� ���" � ����������� "������ ����������", ��� �� �������� �������� � ������ "%s"', [GroupSpr.Table.FieldByName(GroupSpr.NameFieldName).AsString]), mtWarning, [mbOK], 0);
               end;
            end;
         end;
      end;
   end;
end;

function TDBDocument.GetLookByGroup(Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
   DataSet: TDataSet;
   IdField: TField;
   ParentIdField: TField;
   IsNodeField: TField;
   NameField: TField;
   GroupSpr: TDBItem;
   SaveFilter: string;

   procedure AddToTree(RootId: Integer; OwnerItem: TLookItem);
   var
      LookItem: TLookItem;
      Bookmark: string;
      S: string;
   begin
      // NB: !!! ����� �� ����������� ������ ���������� ������
      DataSet.First;
      while not DataSet.Eof do begin
         if ParentIdField.AsInteger=RootId then begin
            if IsNodeField.AsInteger=iNode then begin
               S:=GroupSpr.GetIdList(IdField.AsInteger);
               if S<>'' then begin
                  LookItem:=OwnerItem.Child.AddItem(NameField.AsString, True, S<>'', True, -1, DI_FolderOpen, DI_FolderClose, -1);
                  LookItem.Value:=Format('%s.GROUP_ID in (%s)', [DBItem.TableAlias, S]);
                  Bookmark:=DataSet.Bookmark;
                  AddToTree(IdField.AsInteger, LookItem);
                  DataSet.Bookmark:=Bookmark;
               end;
            end
            else begin
               LookItem:=OwnerItem.Child.AddItem(NameField.AsString, False, True, False, DI_Blank, -1, -1, IdField.AsInteger);
               LookItem.Value:=Format('%s.GROUP_ID=%d', [DBItem.TableAlias, IdField.AsInteger]);
            end;
         end;
         DataSet.Next;
      end;
   end;

begin
   Result:=True;
   GroupSpr:=DBItem.FieldList.ByName('GROUP_ID').LinkSpr;
   LookTree.DoExpand:=True;
   LookTree.Root.Clear;
   RootItem:=LookTree.Root.AddItem('��� ���������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:='';
   //
   if (GroupSpr<>nil) and GroupSpr.HaveStyle(bsTree) then begin
      DataSet:=GroupSpr.Table;
      IdField:=GroupSpr.CodeField;
      ParentIdField:=GroupSpr.ParentIdField;
      IsNodeField:=GroupSpr.IsNodeField;
      NameField:=GroupSpr.ShortNameField; //--GroupSpr.NameField;
      DataSet.DisableControls;
      SaveFilter:=DataSet.Filter;
      DataSet.Filter:=FGroupFilter;
      DataSet.Filtered:=True;
      try
         AddToTree(0, RootItem);
      finally
         DataSet.Filter:=SaveFilter;
         DataSet.Filtered:=SaveFilter<>'';
         DataSet.EnableControls;
      end;
   end;
end;

procedure TDBDocument.UpdateSpr(SprItem: TDBItem);
begin
   // �������� ������ ���������, ��������� � ���������� ������������
   DBItem.Look.UpdateSpr(SprItem.Name);
   // �������������� ��������� ��� ����������� ����� ����������
   if SameText(SprItem.Name, 'SP_DOCGROUP') then begin
      FGroupIdFromLook:=-1;
      FGroupIdLastSel:=-1;
   end;
end;

function TDBDocument.GetDocInfo(DocInfo: TDocInfo): Integer;
begin
   Result:=0;
   //NB: !!! ��� ������� ���������� !!! ��-�� �������� ����������� ���� ����������
   //NB: !!! ���� ������� ���������� ������������� ���� ������
   case DocInfo of
      // 1. ����� ���������������� ���������, ��������� ������������
      diTotalExec: begin
         //������������ ���������� ������������� ���������, �.�. ���� EXEC_FACT ������
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            'where d.DOC_TYPE=%d and d.EXEC_FACT is null',
            [FDocType], 0
         );
      end;
      // 2. �������� ������������� ���� ����������
      diSkipTerm: begin
         //������������ ���������� ��������� (�������������, �.�. ���� EXEC_FACT ������)
         //� ����������� ������ ����������
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            'where d.DOC_TYPE=%d and d.EXEC_FACT is null and d.EXEC_TERM is not null and '+
                  //--'curdate()>isnull(d.EXT_TERM, d.EXEC_TERM)',
                  'curdate()>d.EXEC_TERM',
            [FDocType], 0
         );
      end;
      // 3. ���� ���������� �������� ����� N ���� (N - �������� ����������)
      diExpireTerm: begin
         //������������ ���������� ��������� (�������������, �.�. ���� EXEC_FACT ������)
         //�� ��������� ����� ����������, ������� �������� �������� ���������� ����
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            'where d.DOC_TYPE=%d and d.EXEC_FACT is null and d.EXEC_TERM is not null and '+
                  //--'isnull(d.EXT_TERM, d.EXEC_TERM)-curdate() between 0 and %d',
                  'd.EXEC_TERM-curdate() between 0 and %d',
            [FDocType, FRecInt.ParNextDay], 0
         );
      end;
      // 4. ��������� ����� �� ������
      diWaitAnswer: begin
         //������������ ���������� ���������
         //� ������� � ���� ������������ ���� �� ������ ������� � ��������
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            'left join ( '+
            '   select distinct w.DOC_ID from DOCWORK w '+
            //2010.02.14'   where w.CHECK_DATE is not null and w.CHECK_OUT=False '+
            '   where w.CHECK_OUT=%d '+
            ') w on w.DOC_ID=d.DOC_ID '+
            //--'where d.DOC_TYPE=%d and d.EXEC_FACT is null and w.DOC_ID is not null',
            'where d.DOC_TYPE=%d and w.DOC_ID is not null',
            [chYes, FDocType], 0
         );
      end;
      // 5. ��������� �� ��������
      diCheck: begin
         //������������ ���������� ���������
         //� ������� ����� ������� "��������" (REQ_CHECK=lYes)
         //� �� ����� ������� � ������ � �������� (CHECK_OUT=False)
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            //--'where d.DOC_TYPE=%d and d.EXEC_FACT is null and d.REQ_CHECK=True',
            'where d.DOC_TYPE=%d and d.REQ_CHECK=%d and d.CHECK_OUT=False',
            [FDocType, lYes], 0
         );
      end;
      // 6. ��������� ����������� ��������������� �������, ��������� ������
      diNeedAnswer: begin
         //������������ ���������� ���������
         //� ������� ����� ������� "��������� �����" (REQ_ANS=True) � �� ����������
         //�������� "���� ������" (REQ_DATE)
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            //--'where d.DOC_TYPE=%d and d.EXEC_FACT is null and d.REQ_ANS=True and d.REQ_DATE is null',
            'where d.DOC_TYPE=%d and d.REQ_ANS=True and d.REQ_DATE is null',
            [FDocType], 0
         );
      end;
   end;
   //--SetDocInfo(Id, Result);
   {--if FdsDocInfo.Locate('ID', Id, []) then begin
      //--Result:=FdsDocInfo.FieldByName('VALUE').AsInteger;
      FdsDocInfo.Edit;
      FdsDocInfo.FieldByName('VALUE').AsInteger:=Result;
      FdsDocInfo.Post;
   end;
   --}
end;

{--procedure TDBDocument.SetDocInfo(Id: TDocInfo; const Value: Integer);
begin
   if FdsDocInfo.Locate('ID', Id, []) then begin
      FdsDocInfo.Edit;
      FdsDocInfo.FieldByName('VALUE').AsInteger:=Value;
      FdsDocInfo.Post;
   end;
end;}

function TDBDocument.FillDocInfo: Boolean;
var
   I: Integer;
   Res: Integer;
begin
   (*--
   if FdsDocInfo.IsEmpty then begin
      {--//2010.02.15
      FdsDocInfo.AppendRecord([diTotalExec,  '����� ���������������� ���������, ��������� ������������', 0]);
      FdsDocInfo.AppendRecord([diBlank,      '�� ���:', 0]);
      FdsDocInfo.AppendRecord([diSkipTerm,   '   �������� ������������� ���� ����������', 0]);
      FdsDocInfo.AppendRecord([diExpireTerm, Format('   ���� ���������� �������� ����� %d %s', [FRecInt.ParNextDay, DeclensionDay(FRecInt.ParNextDay)]), 0]);
      FdsDocInfo.AppendRecord([diWaitAnswer, '   ��������� ����� �� ������', 0]);
      FdsDocInfo.AppendRecord([diCheck,      '   ��������� �� ��������', 0]);
      FdsDocInfo.AppendRecord([diNeedAnswer, '   ��������� ����������� ��������������� �������, ��������� ������', 0]);
      --}
      FdsDocInfo.AppendRecord([FDocType, Ord(diTotalExec),  GetDocInfoName(diTotalExec), 0, clNavy, CNavyBackground]);
      FdsDocInfo.AppendRecord([FDocType, Ord(diBlank),      GetDocInfoName(diBlank), 0, 0, 0]);
      FdsDocInfo.AppendRecord([FDocType, Ord(diSkipTerm),   GetDocInfoName(diSkipTerm), 0, clRed, CRedBackground]);
      FdsDocInfo.AppendRecord([FDocType, Ord(diExpireTerm), GetDocInfoName(diExpireTerm), 0, clGreen, CGreenBackground]);
      FdsDocInfo.AppendRecord([FDocType, Ord(diWaitAnswer), GetDocInfoName(diWaitAnswer), 0, clGreen, CGreenBackground]);
      FdsDocInfo.AppendRecord([FDocType, Ord(diCheck),      GetDocInfoName(diCheck), 0, clGreen, CGreenBackground]);
      FdsDocInfo.AppendRecord([FDocType, Ord(diNeedAnswer), GetDocInfoName(diNeedAnswer), 0, clGreen, CGreenBackground]);
   end;
   Res:=0;
   FdsDocInfo.First;
   while not FdsDocInfo.Eof do begin
      if FdsDocInfo.FieldByName('ID').AsInteger<>Ord(diBlank) then begin
         Res:=Res+GetDocInfo(TDocInfo(FdsDocInfo.FieldByName('ID').AsInteger));
      end;
      FdsDocInfo.Next;
   end;
   Result:=Res<>0;
   --*)
   Res:=0;
   FdsDocInfo.EmptyTable;
   for I:=Low(CDocInfoStr) to High(CDocInfoStr) do begin
      FdsDocInfo.AppendRecord([
         FDocType,
         Ord(CDocInfoStr[I].DI),
         GetDocInfoName(CDocInfoStr[I].DI),
         GetDocInfo(CDocInfoStr[I].DI),
         CDocInfoStr[I].Fg,
         CDocInfoStr[I].Bg
      ]);
      Res:=Res+FdsDocInfo.FieldByName('VALUE').AsInteger;
   end;
   Result:=Res<>0;
end;

function TDBDocument.GetDocInfoName(DocInfo: TDocInfo): string;
var
   I: Integer;
begin
   Result:='';
   for I:=Low(CDocInfoStr) to High(CDocInfoStr) do begin
      if CDocInfoStr[I].DI=DocInfo then begin
         Result:=CDocInfoStr[I].N;
         // ���� ���������� �������� ����� ...
         if DocInfo=diExpireTerm then begin
            Result:=Format(Result, [FRecInt.ParNextDay, DeclensionDay(FRecInt.ParNextDay)]);
         end;
         Break;
      end;
   end;
   {--
   case Id of
      diTotalExec : Result:='����� ���������������� ���������, ��������� ������������';
      diBlank     : Result:='�� ���:';
      diSkipTerm  : Result:='   �������� ������������� ���� ����������';
      diExpireTerm: Result:=Format('   ���� ���������� �������� ����� %d %s', [FRecInt.ParNextDay, DeclensionDay(FRecInt.ParNextDay)]);
      diWaitAnswer: Result:='   ��������� ����� �� ������';
      diCheck     : Result:='   ��������� �� ��������';
      diNeedAnswer: Result:='   ��������� ����������� ��������������� �������, ��������� ������';
   else
      Result:='';
   end
   --}
end;

{--procedure TDBDocument.UpdateDocInfoName(Id: TDocInfo);
begin
   if FdsDocInfo.Locate('ID', diExpireTerm, []) then begin
      FdsDocInfo.Edit;
      FdsDocInfo.FieldByName('NAME').AsString:=GetDocInfoName(diExpireTerm);
      FdsDocInfo.Post;
   end;
end;}

function TDBDocument.GetDocId: Integer;
begin
   if ViewMode=vmAdd then begin
      Result:=-1;
   end
   else begin
      Result:=EditField['DOC_ID'].AsInteger;
   end;
end;

procedure TDBDocument.OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean);
begin
   Sender.SetSrcField([
      'IN_DATE',      EditField['REG_DATE'].AsDateTime
   ]);
end;

procedure TDBDocument.ClearAdrId;
begin
   //������� ������ �� ����� � ���� �������
   DBItem.SetDestField([
      'ADR_ID',      -1,      // ������������� ������
      'ADR_TEXT',    '',      // ����� ����� ���������� ���������
      'ADR_IN',      False,   // �� ���������� ���������
      'SIGN_PLACE',  -1,      // ������������� ����������� ������
      'ADR_PLACE',   ''       // ������������ ����������� ������
   ]);
end;

function TDBDocument.SelectAdres: Boolean;
begin
   Result:=False;
   if Doc2Sel.SelectAdres then begin
      DBItem.SetDestField([
         'ADR_ID',       Doc2Sel.SignAdresId,  // ������������� ������
         'ADR_TEXT',     Doc2Sel.SignAdres,    // ����� ����� ���������� ���������
         'ADR_IN',       Doc2Sel.AdrIn,        // �� ���������� ���������
         'SIGN_PLACE',   Doc2Sel.SignPlaceId,  // ������������� ����������� ������
         'ADR_PLACE',    Doc2Sel.AdrPlace      // ������������ ����������� ������
      ]);
      Result:=True;
   end;
end;

procedure TDBDocument.ClearSign;
begin
   //������� ������ �� ��������� (���������� ��� �����������)
   DBItem.SetDestField([
      'SIGN_ORG',    -1,   // ������������� ������������ ����
      'SIGN_MAN',    -1,   // ������������� ���������
      'SIGN_NAME',   ''    // ���������
   ]);
end;

function TDBDocument.SelectMan: Boolean;
var
  vProvDate:Variant;
  vProvType:Variant;
begin
   Result:=False;
   if Doc2Sel.SelectMan then begin
      if Doc2Sel.ProvDate=0
        then vProvDate:=null
        else vProvDate:=Doc2Sel.ProvDate;
      if Doc2Sel.ProvNum=''
        then vProvType:=null
        else vProvType:=Doc2Sel.ProvType;          
      DBItem.SetDestField([
         'SIGN_ORG',      -1,                     // ������������� ������������ ����
         'SIGN_MAN',      Doc2Sel.SignId,         // ������������� ���������
         'ADR_ID',        Doc2Sel.SignAdresId,    // ������������� ������
         'SIGN_NAME',     Doc2Sel.SignName,       // ���������
         'SIGN_PLACE',    Doc2Sel.SignPlaceId,    // ������������� ����������� ������
         'ADR_PLACE',     Doc2Sel.AdrPlace,       // ������������ ����������� ������
         'ADR_TEXT',      Doc2Sel.SignAdres,      // ����� ����� ���������� ���������
         'ADR_PHONE',     Doc2Sel.SignTelefon,    // ���������� �������
         'ADR_IN',        Doc2Sel.AdrIn,          // �� ���������� ���������
         'PROV_TYPE',     vProvType,              // ��� ���������
         'PROV_SER',      Doc2Sel.ProvSer,        // �����
         'PROV_NUM',      Doc2Sel.ProvNum,        // �����
         'PROV_DATE',     vProvDate,              // ���� ������
         'PROV_ORG',      Doc2Sel.ProvOrg,        // ����� ������
         'PERSON_ID',     Doc2Sel.PersonId,       // ����� �������������
         'ACC_ID',        Doc2Sel.AccId,          // ������������� �������� �����
         'ACC_NUM',       Doc2Sel.AccNum          // ����� �������� �����
      ]);
      Result:=True;
   end;
end;

function TDBDocument.SelectOrg: Boolean;
begin
   Result:=False;
   Doc2Sel.SignId:=EditField['SIGN_ORG'].AsInteger;
   if Doc2Sel.SelectOrg then begin
      Doc2Sel.SignAdresId:=-1;
      DBItem.SetDestField([
         'SIGN_ORG',      Doc2Sel.SignId,        // ������������� ������������ ����
         'SIGN_MAN',      -1,                    // ������������� ���������
         'ADR_ID',        -1,                    // ������������� ������
         'SIGN_NAME',     Doc2Sel.SignName,      // ���������
         'SIGN_PLACE',    -1,                    // ������������� ����������� ������
         'ADR_PLACE',     '',                    // ������������ ����������� ������
         'ADR_TEXT',      Doc2Sel.SignAdres,     // ����� ����� ���������� ���������
         'ADR_PHONE',     Doc2Sel.SignTelefon,   // ���������� �������
         'ADR_IN',        Doc2Sel.AdrIn,         // �� ���������� ���������
         'PROV_TYPE',     -1,                    // ��� ���������
         'PROV_SER',      '',                    // �����
         'PROV_NUM',      '',                    // �����
         'PROV_DATE',     0,                     // ���� ������
         'PROV_ORG',      '',                    // ����� ������
         'PERSON_ID',     '',                    // ����� �������������
         'ACC_ID',        -1,                    // ������������� �������� �����
         'ACC_NUM',       -1                     // ����� �������� �����
      ]);
      Result:=True;
   end;
end;

function TDBDocument.SelectSign(SignKind, SignType: Integer): Boolean;
begin
   Result:=False;
   if SignKind=skUL then begin
      Result:=SelectOrg;
   end
   else if SignType in [stIndividual, stGroup] then begin
      Result:=SelectMan;
   end;
end;

procedure TDBDocument.SelectGroup;
var
   GroupId: Integer;
   GroupKind: Integer;
   GroupSpr: TDBItem;
begin
   //NB: ����� GroupSpr - !!! ������ !!!
   GroupId:=fSelgrp.SelectGroup(DBItem.Look.ByName('BY_GROUP'), EditField['GROUP_ID'].AsInteger, DBItem.LayoutList);
   if GroupId<>-1 then begin
      GroupSpr:=DBItem.FieldList.ByName('GROUP_ID').LinkSpr;
      GroupKind:=StrToIntDef(GroupSpr.GetFieldValue(IntToStr(GroupId), 'KIND'), -1);
      if GroupKind<=0 then begin
         if GroupSpr.Table.Locate('ID', GroupId, []) then begin
            MessageDlgR(Format('���� ���������� "��� ���" � ����������� "������ ����������", ��� �� �������� �������� � ������ "%s"', [GroupSpr.Table.FieldByName(GroupSpr.NameFieldName).AsString]), mtWarning, [mbOK], 0);
         end;
      end
      else begin
         EditField['GROUP_ID'].AsInteger:=GroupId;
         EditField['GROUP_KIND'].AsInteger:=GroupKind;;
         FGroupId:=GroupId;
         FGroupKind:=GroupKind;
      end;
   end;
end;

function TDBDocument.GetLookByFolder(Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
   LookItem: TLookItem;
   DataSet: TDataSet;
   FolderSpr: TDBItem;
   IdField: TField;
   NameField: TField;
begin
   Result:=True;
   //NB: !!! ���� ���������� ����� ������ �� �� DataSet � �� PickList
   FolderSpr:=DBItem.FieldList.ByName('FOLDER_ID').LinkSpr;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('��� ���������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:='';
   if FolderSpr<>nil then begin
      DataSet:=FolderSpr.Table;
      IdField:=FolderSpr.CodeField;
      NameField:=FolderSpr.NameField;
      DataSet.DisableControls;
      try
         DataSet.First;
         while not DataSet.Eof do begin
            LookItem:=RootItem.Child.AddItem(NameField.AsString, True, True, True, -1, DI_FolderClose, DI_FolderClose, IdField.AsInteger);
            LookItem.Value:=Format('%s.FOLDER_ID=%d', [DBItem.TableAlias, IdField.AsInteger]);
            DataSet.Next;
         end;
      finally
         DataSet.EnableControls;
      end;
   end;
end;

function TDBDocument.GetLookByExecMan(Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
   LookItem: TLookItem;
   DataSet: TDataSet;
   FolderSpr: TDBItem;
   IdField: TField;
   NameField: TField;
begin
   Result:=True;
   //NB: !!! ���� ���������� ����� ������ �� �� DataSet � �� PickList
   FolderSpr:=DBItem.FieldList.ByName('EXEC_MAN').LinkSpr;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('��� ���������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:='';
   if FolderSpr<>nil then begin
      DataSet:=FolderSpr.Table;
      IdField:=FolderSpr.CodeField;
      NameField:=FolderSpr.NameField;
      DataSet.DisableControls;
      try
         DataSet.First;
         while not DataSet.Eof do begin
           if DataSet.FieldByName('IS_ACTUAL').AsBoolean then begin
             LookItem:=RootItem.Child.AddItem(NameField.AsString, True, True, True, -1, DI_FolderClose, DI_FolderClose, IdField.AsInteger);
             LookItem.Value:=Format('%s.EXEC_MAN=%d or CONTAINS(%s.IDEN_DATE,%s)', [DBItem.TableAlias, IdField.AsInteger, DBItem.TableAlias, ''''+IdField.AsString+'''']);
//             Showmessage(LookItem.Value);
           end;
           DataSet.Next;
         end;
      finally
         DataSet.EnableControls;
      end;
   end;
end;

function TDBDocument.GetLookByVisitMan(Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
   LookItem: TLookItem;
   DataSet: TDataSet;
   FolderSpr: TDBItem;
   IdField: TField;
   NameField: TField;
begin
   Result:=True;
   //NB: !!! ���� ���������� ����� ������ �� �� DataSet � �� PickList
   FolderSpr:=DBItem.FieldList.ByName('VISIT_MAN').LinkSpr;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('��� ���������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:='';
   if FolderSpr<>nil then begin
      DataSet:=FolderSpr.Table;
      IdField:=FolderSpr.CodeField;
      NameField:=FolderSpr.NameField;
      DataSet.DisableControls;
      try
         DataSet.First;
         while not DataSet.Eof do begin
           if DataSet.FieldByName('IS_ACTUAL').AsBoolean then begin
             LookItem:=RootItem.Child.AddItem(NameField.AsString, True, True, True, -1, DI_FolderClose, DI_FolderClose, IdField.AsInteger);
             LookItem.Value:=Format('%s.VISIT_MAN=%d', [DBItem.TableAlias, IdField.AsInteger]);
//             Showmessage(LookItem.Value);
           end;
           DataSet.Next;
         end;
      finally
         DataSet.EnableControls;
      end;
   end;
end;

function TDBDocument.GetLookByFile(Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
   LookItem: TLookItem;
   DataSet: TDataSet;
   FileSpr: TDBItem;
   IdField: TField;
   NameField: TField;
   IndexField: TField;
   IsNodeField: TField;
   ParentIdField: TField;

   procedure AddToTree(RootId: Integer; OwnerItem: TLookItem);
   var
      LookItem: TLookItem;
      Bookmark: string;
      S: string;
   begin
      // NB: !!! ����� �� ����������� ������ ���������� ������
      DataSet.First;
      while not DataSet.Eof do begin
         if ParentIdField.AsInteger=RootId then begin
            if IsNodeField.AsInteger=iNode then begin
               S:=FileSpr.GetIdList(IdField.AsInteger);
               LookItem:=OwnerItem.Child.AddItem(NameField.AsString, True, S<>'', True, -1, -1, -1, IdField.AsInteger);
               if S<>'' then begin
                  LookItem.Value:=Format('%s.FILE_ID in (%s)', [DBItem.TableAlias, S]);
               end;
               Bookmark:=DataSet.Bookmark;
               AddToTree(IdField.AsInteger, LookItem);
               //DataSet.Bookmark:=Bookmark;
               SetBookmark(DataSet, Bookmark);
            end
            else begin
               LookItem:=OwnerItem.Child.AddItem(IndexField.AsString+' '+NameField.AsString, False, True, False, -1, -1, -1, IdField.AsInteger);
               LookItem.Value:=Format('%s.FILE_ID=%d', [DBItem.TableAlias, IdField.AsInteger]);
            end;
         end;
         DataSet.Next;
      end;
   end;

begin
   Result:=True;
   FileSpr:=DBItem.FieldList.ByName('FILE_ID').LinkSpr;
   LookTree.DoExpand:=True;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('���� �� ������������', True, True, True, -1, -1, -1, -1);
   RootItem.Value:='';
   LookItem:=RootItem.Child.AddItem('�� ������ � ����', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('%s.IN_FILE=False', [DBItem.TableAlias]);
   if FileSpr<>nil then begin
      DataSet:=FileSpr.Table;
      IdField:=FileSpr.CodeField;
      NameField:=FileSpr.FieldList.ByName('NAME').SrcField;;
      IndexField:=FileSpr.FieldList.ByName('FILE_IND').SrcField;
      ParentIdField:=FileSpr.ParentIdField;
      IsNodeField:=FileSpr.IsNodeField;
      DataSet.DisableControls;
      try
         AddToTree(0, RootItem);
         {--
         DataSet.First;
         while not DataSet.Eof do begin
            LookItem:=RootItem.Child.AddItem(IndexField.AsString+' '+NameField.AsString, False, True, False, -1, -1, -1);
            LookItem.Value:=Format('d.FILE_ID=%d and d.IN_FILE=True', [IdField.AsInteger]);
            DataSet.Next;
         end;
         --}
      finally
         DataSet.EnableControls;
      end;
   end;
end;

function TDBDocument.GetLookByRegDate(Name: string; LookTree: TLookTree): Boolean;
var
   I: Integer;
   Day: Word;
   Month: Word;
   Year: Word;
   N: Word;
   {--
   Week: Word;
   FieldName: string;
   Query: TAdsQuery;
   }
   LookItem: TLookItem;
   RegDate: TDateTime;
   S: string;

   {--
   function DayOfWeek(D: TDateTime): Word;
   begin
      Result:=Pred(SysUtils.DayOfWeek(D));
      if Result=0 then begin
         Result:=7;
      end;
   end;
   }

begin
   Result:=True;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   {--
   FieldName:=Format('%s.%s', [FDBItem.TableAlias, 'REG_DATE']);
   Day:=DayOfWeek(Date);
   for I:=1 to Day do begin
      case I of
         1: begin
            S:='�������';
            RegDate:=Date;
         end;
         2: begin
            S:='�����';
            RegDate:=Date-1;
         end;
      else
         RegDate:=Date-Pred(I);
         S:=FormatDateTime('dddd', RegDate);
         if Length(S)>0 then begin
            S[1]:=AnsiUpperCase(S[1])[1];
         end;
      end;
      LookItem:=LookTree.Root.AddItem(S, False, True, True, DI_RegDate, -1, -1);
      LookItem.Value:=Format('%s=''%s''', [FieldName, FormatDateTime('YYYY-MM-DD', RegDate)]);
   end;
   }
   LookItem:=LookTree.Root.AddItem('�������', False, True, True, DI_RegDate, -1, -1, -1);
   LookItem.Value:=Format('%s.REG_DATE=curdate()', [DBItem.TableAlias]);;
   LookItem:=LookTree.Root.AddItem('�� ��������� 30 ����', False, True, True, DI_RegDate, -1, -1, -1);
   LookItem.Value:=Format('curdate()-%s.REG_DATE<=30', [DBItem.TableAlias]);
   DecodeDate(Date, Year, Month, Day);
   LookItem:=LookTree.Root.AddItem('�� ������� �����', False, True, True, DI_RegDate, -1, -1, -1);
   LookItem.Value:=Format('%s.REG_DATE between ''%s'' and curdate()', [DBItem.TableAlias, FormatDateTime('YYYY-MM-DD', EncodeDate(Year, Month, 1))]);
   {--
   Week:=(Day+DayOfWeek(Date-Pred(Day))-DayOfWeek(Date)) div 7;
   for I:=1 to Week do begin
      if I=1 then begin
         S:='�� ������� ������';
      end
      else begin
         S:=Format('%d ������ �����', [I]);
      end;
      LookItem:=LookTree.Root.AddItem(S, False, True, True, DI_RegDate, -1, -1);
      RegDate:=Date-DayOfWeek(Date)-I*7;
      LookItem.Value:=Format('%s>''%s'' and %s<=''%s''', [FieldName, FormatDateTime('YYYY-MM-DD', RegDate), FieldName, FormatDateTime('YYYY-MM-DD', RegDate+7)]);
   end;
   }
   for I:=1 to Pred(Month) do begin
      RegDate:=EncodeDate(Year, Month-I, 1);
      {--
      if I=1 then begin
         S:='�� ������� �����';
      end
      else begin
      }
         S:=FormatDateTime('mmmm', RegDate);
      {--
      end;
      }
      LookItem:=LookTree.Root.AddItem(S, False, True, True, DI_RegDate, -1, -1, -1);
      LookItem.Value:=Format('%s.REG_DATE>=''%s'' and %s.REG_DATE<''%s''', [DBItem.TableAlias, FormatDateTime('YYYY-MM-DD', RegDate), DBItem.TableAlias, FormatDateTime('YYYY-MM-DD', EncodeDate(Year, Succ(Month-I), 1))]);
   end;
   N:=QueryIntegerValue(
      'select year(min(REG_DATE)) as min_date from %s where DOC_TYPE=%d',
      [DBItem.TableName, FDocType], 0
   );
   {--
   Query:=TAdsQuery.Create(nil);
   try
      Query.DatabaseName:=FDBItem.DatabaseName;
      Query.SQL.Text:=Format('select year(min(%s)) as min_date from %s', ['REG_DATE', FDBItem.TableName]);
      Query.Open;
      Query.First;
      if not Query.Eof then begin
         N:=Query.Fields[0].AsInteger;
         }
         if N<>0 then begin
            N:=Year-N;
         end;
         for I:=1 to N do begin
            RegDate:=Encodedate(Year-I, 1, 1);
            {--
            if I=1 then begin
               S:='�� ������� ���';
            end
            else begin
            }
               S:=FormatDateTime('YYYY', RegDate);
            {--
            end;
            }
            LookItem:=LookTree.Root.AddItem(S, False, True, True, DI_RegDate, -1, -1, -1);
            LookItem.Value:=Format('%s.REG_DATE>=''%s'' and %s.REG_DATE<''%s''', [DBItem.TableAlias, FormatDateTime('YYYY-MM-DD', RegDate), DBItem.TableAlias, FormatDateTime('YYYY-MM-DD', EncodeDate(Succ(Year-I), 1, 1))]);
         end;
         {--
      end;
   finally
      Query.Free;
   end;
   }
end;

function TDBDocument.GetLookBySubj(Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
   LookItem: TLookItem;
   DataSet: TDataSet;
   SubjSpr: TDBItem;
   IdField: TField;
   NameField: TField;
   IsNodeField: TField;
   ParentIdField: TField;

   procedure AddToTree(RootId: Integer; OwnerItem: TLookItem);
   var
      LookItem: TLookItem;
      Bookmark: string;
      S: string;
   begin
      // NB: !!! ����� �� ����������� ������ ���������� ������
      DataSet.First;
      while not DataSet.Eof do begin
         if ParentIdField.AsInteger=RootId then begin
            if IsNodeField.AsInteger=iNode then begin
               S:=SubjSpr.GetIdList(IdField.AsInteger);
               AddString(S, IdField.AsString, ',');
               LookItem:=OwnerItem.Child.AddItem(NameField.AsString, True, S<>'', True, -1, -1, -1, IdField.AsInteger);
               if S<>'' then begin
                  // NB: !!! ����������
                  LookItem.Value:=Format('%s.SUBJ_ID in (%s)', [DBItem.TableAlias, S]);
               end;
               Bookmark:=DataSet.Bookmark;
               AddToTree(IdField.AsInteger, LookItem);
               //DataSet.Bookmark:=Bookmark;
               SetBookmark(DataSet, Bookmark)
            end
            else begin
               LookItem:=OwnerItem.Child.AddItem(NameField.AsString, False, True, False, -1, -1, -1, IdField.AsInteger);
               // NB: !!! ����������
               LookItem.Value:=Format('%s.SUBJ_ID=%d', [DBItem.TableAlias, IdField.AsInteger]);
            end;
         end;
         DataSet.Next;
      end;
   end;

begin
   // NB: !!! ��������� GetByFileIdLook
   Result:=True;
   //------ vadim 16.08.2018 -----
   if LookTree.SprNames.Count>0
     then SubjSpr:=FRecInt.SprDBItems.ByName(LookTree.SprNames.Strings[0])
     else SubjSpr:=DBItem.FieldList.ByName('SUBJ_ID').LinkSpr;
// ���� SubjSpr:=DBItem.FieldList.ByName('SUBJ_ID').LinkSpr;
   //------------------------------
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('������������ �������', True, True, True, -1, -1, -1, -1);
   RootItem.Value:='';
   LookItem:=RootItem.Child.AddItem('��� ��������', False, True, False, -1, -1, -1, -1);
   LookItem.Value:=Format('%s.SUBJ_ID is null or %s.SUBJ_ID<=0', [DBItem.TableAlias, DBItem.TableAlias]);
   if SubjSpr<>nil then begin
      DataSet:=SubjSpr.Table;
      IdField:=SubjSpr.CodeField;
      NameField:=SubjSpr.NameField;
      ParentIdField:=SubjSpr.ParentIdField;
      IsNodeField:=SubjSpr.IsNodeField;
      DataSet.DisableControls;
      try
         AddToTree(0, RootItem);
         {--
         DataSet.First;
         while not DataSet.Eof do begin
            LookItem:=RootItem.Child.AddItem(NameField.AsString, False, True, False, -1, -1, -1);
            LookItem.Value:=Format('d.SUBJ_ID=%d', [IdField.AsInteger]);
            DataSet.Next;
         end;
         --}
      finally
         DataSet.EnableControls;
      end;
   end;
end;

function TDBDocument.GetLookByExecTerm(Name: string; LookTree: TLookTree): Boolean;
var
   I: Integer;
   NextDay: Integer;
   RootItem: TLookItem;
   ChildItem: TLookItem;
   //������� ������ �� ����������� ���������� � ������������� ������ ���������� (��� GetLookByExecTerm)
   NotExecTerm: string;

   procedure AddChildItem(Caption, Value: string; const Args: array of const);
   begin
      ChildItem:=RootItem.Child.AddItem(Caption, False, True, True, DI_RegDate, -1, -1, -1);
      ChildItem.Value:=Format(Value, Args);
   end;

begin
   NotExecTerm:=Format('%s and %s.EXEC_TERM is not null', [FNotExec, DBItem.TableAlias]);
   Result:=True;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('���� ����������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:=FNotExec;
   AddChildItem('�� ����������', '%s and %s.EXEC_TERM is null', [FNotExec, DBItem.TableAlias]);
   AddChildItem('��������', '%s and curdate()>%s.EXEC_TERM', [NotExecTerm, DBItem.TableAlias]);
   AddChildItem('�������', '%s and curdate()=%s.EXEC_TERM', [NotExecTerm, DBItem.TableAlias]);
   // ���������� � ����������, ����� ���������� ������� ��������� ����� ��������
   // ������ ���������� ���������� ����
   NextDay:=FRecInt.ParNextDay;
   if NextDay<=0 then NextDay:=7 else if NextDay>31 then NextDay:=31;
   for I:=1 to NextDay do begin
      AddChildItem(Format('����� %d %s', [I, DeclensionDay(I)]), '%s and %s.EXEC_TERM-curdate()=%d', [NotExecTerm, DBItem.TableAlias, I]);
   end;
   // � ����� ��������� ���������� ����
   AddChildItem(Format('������ %d%s', [NextDay, DeclensionDay2(NextDay)]), '%s and %s.EXEC_TERM-curdate()>%d', [NotExecTerm, DBItem.TableAlias, NextDay]);
end;

procedure TDBDocument.AddEnumToLook(RootItem: TLookItem; EnumName, FieldName: string);
var
   I: Integer;
   Enum: TEnumItem;
   EnumItem: TLookItem;
   LookItem: TLookItem;
begin
   Enum:=FRecInt.EnumList.ByName(EnumName);
   if (RootItem<>nil) and (Enum<>nil) then begin
      EnumItem:=RootItem.Child.AddItem(Enum.Caption,  True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
      EnumItem.Value:=Format('%s.%s is not null', [DBItem.TableAlias, FieldName]);
      for I:=0 to Pred(Enum.PickList.Count) do begin
         LookItem:=EnumItem.Child.AddItem(Enum.PickList[I], False, True, False, -1, -1, -1, -1);
         LookItem.Value:=Format('%s.%s=%s', [DBItem.TableAlias, FieldName, Enum.KeyList[I]]);
      end;
      LookItem:=EnumItem.Child.AddItem('�� ����������', False, True, False, -1, -1, -1, -1);
      LookItem.Value:=Format('%s.%s is null', [DBItem.TableAlias, FieldName]);
   end;
end;

function TDBDocument.GetRepeatText(ds: TDataSet; var Count: Integer): string;
var
   S: string;
   IncludeInd: Boolean;
   Year: Word;
begin
   IncludeInd:=FRecInt.GetParPrintInd;
   Year:=YearOf(EditField['REG_DATE'].AsDateTime);
   S:='';
   //ds.First;
   ds.Last;
   Count:=0;
   while not ds.Bof{ds.Eof} do begin
      if
         //NB: !!! LINK_KIND: 1 � "������", 2 � "��������"
         (ds.FieldByName('LINK_TYPE').AsInteger in [ltRepeat, ltFirst]) and
         (ds.FieldByName('IS_PRINT').AsInteger=lYes)
      then begin
         if IncludeInd or (Year<>YearOf(ds.FieldByName('REG_DATE').AsDateTime)) then begin
            AddString(S,
               ds.FieldByName('REG_DATE').AsString+' �'+
               ds.FieldByName('REG_IND').AsString, ', '
            );
         end
         else begin
            AddString(S, ds.FieldByName('REG_DATE').AsString, ', ');
         end;
      end;
      Inc(Count);
      {ds.Next;}
      ds.Prior;
   end;
   Result:=S;
end;

function TDBDocument.SelectDocument(var Query: TAdsQuery; Bookmark: TStringList): Boolean;
begin
   Result:=False;
end;

procedure TDBDocument.DoTemplate(Template: TTemplate);
var
   TemplateName: Variant;
begin
   if Template<>nil then begin
      if (DBItem.Control<>nil) and (DBItem.Control.Form<>nil) then begin
         DBItem.Control.Form.Perform(WM_NEXTDLGCTL, 0, 0);
         DBItem.Control.Form.Perform(WM_NEXTDLGCTL, 1, 0);
      end
      else begin
         DBItem.CheckEditMode;
      end;
      // ���������� ���������� - ��������� ������� � ���������� �� ����� ��������
      Doc2Template.SetDBItem(DBItem, FRecInt.SprDBItems);
      try
         //[2015.01.10] ����� ������� � ����������� �� �������� ���������� ��������
         //���� ���� ������� �� �����, �� ������� ������� ������ ���������� ��� �������
         if Template.TemplateFile='' then begin
            TemplateName:=Null;
            RecInt.TemplateInterface.DefaultScript.RunEx(Template.ScriptName, [], TemplateName);
            if TemplateName<>Null then begin
               Template:=FRecInt.TemplateInterface.Engine.TemplateList.GetByName(TemplateName);
               if Template=nil then Exit;
            end;
         end;
         //\\
         if Trim(RecInt.TemplateInterface.DefaultParameterIniFile)<>'' then begin
            RecInt.TemplateInterface.SetTemplate(RecInt.TemplateInterface.DefaultParameterIniFile, RecInt.TemplateInterface.DefaultDatabaseName, RecInt.TemplateInterface.DefaultScript, Template)
         end
         else begin
            RecInt.TemplateInterface.SetTemplate(RecInt.TemplateInterface.GetFullNameFile(Template), RecInt.TemplateInterface.DefaultDatabaseName, RecInt.TemplateInterface.DefaultScript, Template)
//            RecInt.TemplateInterface.SetTemplate(RecInt.TemplateInterface.TemplateDir+Template.TemplateFile, RecInt.TemplateInterface.DefaultDatabaseName, RecInt.TemplateInterface.DefaultScript, Template)
         end;
      finally
         if not (DBItem.EditTable.State in [dsEdit, dsInsert]) and not DBItem.EditTable.ReadOnly then begin
            DBItem.EditTable.Edit;
         end;
         Doc2Template.SetDBItem(nil, nil)
      end;
   end;
end;

function TDBDocument.EditDocLink(DBItem: TDBItem; DataSet: TDataSet; DataSource: TDataSource; ViewMode: TViewMode): Boolean;
begin
   Result:=False;
end;

function TDBDocument.AutoCountSign(SignType, SignKind: Integer): Integer;
begin
   Result:=AutoCountSign(SignType, SignKind, GetDocId, 0);
end;

function TDBDocument.AutoCountSign(SignType, SignKind, DocId, SubjId: Integer): Integer;
begin
   Result:=QueryIntegerValue(GetCountSignSQL(SignType, SignKind, DocId, SubjId), [], 0);
end;

function TDBDocument.GetCountSignSQL(SignType, SignKind, DocId, SubjId: Integer): string;
var
   SignName: string;
   SignMan: Integer;
   SignOrg: Integer;
begin
   Result:='';
   // ������������ ������ �������������� ���������
   if SignType=stIndividual then begin
      SignName:=AnsiUpperCase(Trim(EditField['SIGN_NAME'].AsString));
      case SignKind of
         // ���������
         skMan,
         // �������������� ���������������
         skIP: begin
            SignMan:=EditField['SIGN_MAN'].AsInteger;
            if SignMan>0 then begin
               Result:=Format(
                  'select count(*) from DOCMAIN '+
                  'where DOC_TYPE=%d and SIGN_TYPE=%d and SIGN_KIND in (%d, %d) and SIGN_MAN=%d and DOC_ID<>%d',
                  [FDocType, stIndividual, skMan, skIP, SignMan, DocId]
               );
            end
            else if SignName<>'' then begin
               Result:=Format(
                  'select count(*) from DOCMAIN '+
                  'where DOC_TYPE=%d and SIGN_TYPE=%d and SIGN_KIND in (%d, %d) and upper(SIGN_NAME)=''%s'' and DOC_ID<>%d',
                  [FDocType, stIndividual, skMan, skIP, SignName, DocId]
               );
            end;
         end;
         // ����������� ����
         skUL: begin
            SignOrg:=EditField['SIGN_ORG'].AsInteger;
            if SignOrg>0 then begin
               Result:=Format(
                  'select count(*) from DOCMAIN '+
                  'where DOC_TYPE=%d and SIGN_TYPE=%d and SIGN_KIND=%d and SIGN_ORG=%d and DOC_ID<>%d',
                  [FDocType, stIndividual, skUL, SignOrg, DocId]
               );
            end
            else if SignName<>'' then begin
               Result:=Format(
                  'select count(*) from DOCMAIN '+
                  'where DOC_TYPE=%d and SIGN_TYPE=%d and SIGN_KIND=%d and upper(SIGN_NAME)=''%s'' and DOC_ID<>%d',
                  [FDocType, stIndividual, skUL, SignName, DocId]
               );
            end;
         end;
      end;
      // ���� ���������� ��������� ���������� �������� �������� ���������
      if (SubjId>0) and (Result<>'') then begin
         Result:=Result+Format(' and SUBJ_ID=%d', [SubjId]);
      end;
   end;
end;

function TDBDocument.AutoCountSubj(SignType, SignKind: Integer): Integer;
begin
   Result:=AutoCountSubj(SignType, SignKind, EditField['SUBJ_ID'].AsInteger);
end;

function TDBDocument.AutoCountSubj(SignType, SignKind, SubjId: Integer): Integer;
begin
   Result:=0;
   if SubjId>0 then begin
      Result:=AutoCountSign(SignType, SignKind, GetDocId, SubjId);
   end;
end;

procedure TDBDocument.OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);
var
   I: Integer;
   MenuItem: TMenuItem;
   Template: TTemplate;
begin
   case MenuKind of
      // ���� �������� ����������
      mkWordTemplate: begin
         Menu.Items.Clear;
         for I:=0 to Pred(FRecInt.TemplateInterface.Engine.TemplateList.Count) do begin
            Template:=FRecInt.TemplateInterface.Engine.TemplateList[I];
            if AddInTemplateMenu(Template) then begin
               MenuItem:=TMenuItem.Create(Menu.Owner);
               MenuItem.Tag:=Integer(Template);
               MenuItem.Caption:=Template.Caption;
               if Assigned(OnClick) then begin
                  MenuItem.OnClick:=OnClick;
               end
               else begin
                  MenuItem.OnClick:=OnTemplateMenuClick;
               end;
               Menu.Items.Add(MenuItem);
            end;
         end;
      end;
   end;
end;

procedure TDBDocument.SetGroupFormula(sF: String);
begin
  FGroupFormula:=sF;
end;

{ TDocWork }

constructor TDocWork.Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
begin
   inherited Create(DBItem);
   FRecInt:=RecInt;
end;

destructor TDocWork.Destroy;
begin
   inherited;
end;

function TDocWork.OnBeforeNewRecord(Sender: TDBItem): Boolean;
begin
   Result:=True;
   LastOrder:=DBItem.GetLastOrder(skEdit);
end;

procedure TDocWork.OnSetDefaultValue(Sender: TDBItem);
begin
   Sender.SetDestField([
      DBItem.OrderFieldName,   Succ(LastOrder),
      'CHECK_OUT',             chNo
   ]);
end;

function TDocWork.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
var
   fm: TfmEdWork;
begin
   Result:=False;
   if inherited OnViewRecord(Sender, ViewMode) then begin
      fm:=TfmEdWork.Create(nil);
      OnSetControl:=fm.SetControl;
      try
         fm.Doc:=Self;
         Result:=Edit(fm);
      finally
         fm.Free;
      end;
   end;
end;

{ TDocFile }

function TDocFile.GetAttachName: string;
var
   AttachDir: string;
begin
   Result:='';
   AttachDir:=Doc2Sel.GetAttachDir;
   if AttachDir<>'' then begin
      Result:=AttachDir+EditField['DIR_YEAR'].AsString+'\'+EditField['DIR_MONTH'].AsString+'\'+EditField['DIR_NAME'].AsString;
   end;
end;

constructor TDocFile.Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
begin
   inherited Create(DBItem);
   FRecInt:=RecInt;
   FFileName:='';
end;

destructor TDocFile.Destroy;
begin
   inherited;
end;

function TDocFile.OnBeforeNewRecord(Sender: TDBItem): Boolean;
var
  ds:TDataSet;
  sB:String;
begin
   Result:=True;
   ds:=DBItem.EditTable;
   sB:=ds.Bookmark;
   ds.First;
   ds.DisableControls;
   try
     while not ds.Eof do begin
       if SameText(ds.FieldByName('NAME').AsString, ExtractFileName(FileName)) then begin
         PutError('���� � ������ "'+ExtractFileName(FileName)+'" ��� ���������� � ������!');
         Result:=false;
         break;
       end;
       ds.Next;
     end;
   finally
     ds.Bookmark:=sB;
     ds.EnableControls;
   end;
   if Result
     then LastOrder:=DBItem.GetLastOrder(skEdit);
end;

procedure TDocFile.OnSetDefaultValue(Sender: TDBItem);
begin
   Sender.SetDestField([
      DBItem.OrderFieldName,   Succ(LastOrder),              // ������� ��������� �������
      // ������ ��������
      'STORE_KIND',            Doc2Sel.ParamAsInteger('DR_STORE_KIND') ,
      'NAME',                  ExtractFileName(FFileName),   // ��� �����
      'PATH',                  ExtractFilePath(FFileName),   // ���� � �����
      'READ_ONLY',             lYes,                         // ������ ��� ������
      'DIR_YEAR',              FormatDateTime('YYYY', Date), // ���
      'DIR_MONTH',             FormatDateTime('MM', Date),   // �����
      // ��� ����� � ����������� �����
      'DIR_NAME',              FormatDateTime('yyyymmdd_hhnnss_zzz', Now)+'.zip'
   ]);
end;

function TDocFile.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
var
   fm: TfmEdFile;
begin
   Result:=False;
   if inherited OnViewRecord(Sender, ViewMode) then begin
      fm:=TfmEdFile.Create(nil);
      try
         fm.Doc:=Self;
         Result:=Edit(fm);
      finally
         fm.Free;
      end;
   end;
end;
{  vadim  ��������� ���� �������
function NormDir(Dir: string): string;
begin
   if (Length(Dir)>0) and (Dir[Length(Dir)]<>'\') then begin
      Result:=Dir+'\';
   end
   else begin
      Result:=Dir;
   end;
end;
}
function TDocFile.SetAttachFile: Boolean;
var
   AttachName, sB: string;
   Zip: TZipForge;
   Wait: TfmWait;
begin
   DBItem.EditTable.CheckBrowseMode;
   Result:=False;
   {
   sB:=DBItem.EditTable.Bookmark;
   if DBItem.EditTable.Locate('NAME', ExtractFileName(FFileName), [loCaseInsensitive]) then begin
     PutError('���� � ������ "'+ExtractFileName(FFileName)+'" ��� ����������!');
     DBItem.EditTable.Bookmark:=sB;
     exit;
   end;
   DBItem.EditTable.Bookmark:=sB;
   }
   case EditField['STORE_KIND'].AsInteger of
      // ������ ������ �� ����
      stOnlyLink: begin
         Result:=True;
      end;
      // � ����������� �����
      stInFolder: begin
         AttachName:=GetAttachName;
         if AttachName<>'' then begin
            if not DirectoryExists(ExtractFilePath(AttachName)) then begin
               ForceDirectories(ExtractFilePath(AttachName));
            end;
            if FileExists(FileName) and DirectoryExists(ExtractFilePath(AttachName)) then begin
               Zip:=TZipForge.Create(nil);
               Wait:=ShowWait('����������� ����� � �����', FFileName, False);
               try
                  Zip.Options.Recurse:=false;
                  Zip.FileName:=AttachName;
                  Zip.BaseDir:=ExtractFilePath(FFileName);
                  Zip.OpenArchive(fmCreate);
                  Zip.AddFiles(ExtractFileName(FFileName));
                  Result:=True;
               finally
                  Zip.CloseArchive;
                  Zip.Free;
                  Wait.Free;
               end;
            end;
         end;
       end;
      // � ����
      stInBase:;
   end;
   // ������� ������ ���� �� ������ ���������� ����
   if not Result then begin
      DBItem.EditTable.Delete;
   end;
end;

function TDocFile.getTempPath(lCreate:Boolean):String;
begin
  Result:=ExtractFilePath(Application.ExeName)+NameTmpDir(2)+'\'; // ��. uProject.pas    '$temp$\';
  if lCreate and not DirectoryExists(Result) then begin
    ForceDirectories(Result);
  end;
end;

procedure TDocFile.deleteTempPath;
var
  sDir:String;
begin
  sDir:=getTempPath(false);
  ClearDir(sDir,true);
end;
//------------------------------------------------
function TDocFile.ExtractFile(sErr:String):String;
var
   AttachName: string;
   Zip: TZipForge;
   Wait: TfmWait;
   TempDir: string;
   lErr:Boolean;
begin
  sErr:='';
  Result:='';
//   FRecInt.PathFile !!!  vadim
   //--DBItem.EditTable.CheckBrowseMode;
   case EditField['STORE_KIND'].AsInteger of
      // ������ ������ �� ����
      stOnlyLink: begin
         FFileName:=NormDir(EditField['PATH'].AsString)+EditField['NAME'].AsString;
         if FileExists(FFileName) then begin
           if PathInBase(EditField['PATH'].AsString) then begin   // � ����� ���� DocArxiv
             TempDir:=getTempPath(true);
             AttachName:=TempDir+EditField['NAME'].AsString;
             if CopyFile(PChar(FFileName), PChar(AttachName), false) then begin
               Result:=AttachName;
             end else begin
               sErr:='������ ����������� ����� '+FFileName+' � '+AttachName+' '+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')';
             end;
           end else begin      // ������ ������ �� ����
             Result:=FFileName;
           end;
         end else begin
           sErr:=Format('���� "%s" �� ������.', [FFileName]);
         end;
      end;
      // � ����������� �����
      stInFolder: begin
         AttachName:=GetAttachName;
         if AttachName<>'' then begin
           TempDir:=getTempPath(true);
           if not FileExists(AttachName) then begin
             sErr:=Format('���� "%s" �� ������.', [AttachName]);
           end else if not DirectoryExists(TempDir) then begin
             sErr:=Format('����� "%s" �� �������.', [TempDir]);
           end else begin
             Zip:=TZipForge.Create(nil);
             Wait:=ShowWait('������ ����� �� ������', EditField['NAME'].AsString, False);
             try
               Zip.FileName:=AttachName;
               //Zip.BaseDir:=ExtractFilePath(AttachName);
               Zip.BaseDir:=TempDir;
               Zip.OpenArchive;
               Zip.ExtractFiles(EditField['NAME'].AsString);
             finally
               Zip.CloseArchive;
               Zip.Free;
               Wait.Free;
             end;
             //
             Result:=TempDir+EditField['NAME'].AsString;
           end;
         end;
      end;
      // � ����
      stInBase:;
   end;
end;
//------------------------------------------------
procedure TDocFile.ViewFile;
var
   AttachName: string;
   Zip: TZipForge;
   Wait: TfmWait;
   TempDir: string;
   lErr:Boolean;
begin
//   FRecInt.PathFile !!!  vadim
   //--DBItem.EditTable.CheckBrowseMode;
   case EditField['STORE_KIND'].AsInteger of
      // ������ ������ �� ����
      stOnlyLink: begin
         FFileName:=NormDir(EditField['PATH'].AsString)+EditField['NAME'].AsString;
         if FileExists(FFileName) then begin
           lErr:=false;
           if PathInBase(EditField['PATH'].AsString) then begin   // � ����� ���� DocArxiv
             TempDir:=getTempPath(true);
             {TempDir:=ExtractFilePath(Application.ExeName)+'$temp$\';
             if not DirectoryExists(TempDir) then begin
               ForceDirectories(TempDir);
             end;}
             AttachName:=TempDir+EditField['NAME'].AsString;
             if not CopyFile(PChar(FFileName), PChar(AttachName), false) then begin
               lErr:=true;
               PutError('������ ����������� ����� : '+#13+
                        '������ :'+FFileName+#13+
                        '����   :'+AttachName+#13+
                        IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
             end;
           end else begin      // ������ ������ �� ����
             AttachName:=FFileName;
           end;
           if not lErr then begin
             if not Doc2Sel.ShowReport(AttachName) then begin
               ShellExecute(Application.Handle, nil, PChar(AttachName), nil, nil, SW_SHOWNORMAL);
             end;
           end;
         end
         else begin
            MessageDlgR(Format('���� "%s" �� ������.', [FFileName]), mtError, [mbOk], 0);
         end;
      end;
      // � ����������� �����
      stInFolder: begin
         AttachName:=GetAttachName;
         if AttachName<>'' then begin
            TempDir:=getTempPath(true);
            {TempDir:=ExtractFilePath(Application.ExeName)+'$temp$\';
            if not DirectoryExists(TempDir) then begin
               ForceDirectories(TempDir);
            end;}
            //
            if not FileExists(AttachName) then begin
               MessageDlgR(Format('���� "%s" �� ������.', [AttachName]), mtError, [mbOk], 0);
            end
            else if not DirectoryExists(TempDir) then begin
               MessageDlgR(Format('����� "%s" �� �������.', [TempDir]), mtError, [mbOk], 0);
            end
            else begin
               Zip:=TZipForge.Create(nil);
               Wait:=ShowWait('������ ����� �� ������', EditField['NAME'].AsString, False);
               try
                  Zip.FileName:=AttachName;
                  //Zip.BaseDir:=ExtractFilePath(AttachName);
                  Zip.BaseDir:=TempDir;
                  Zip.OpenArchive;
                  Zip.ExtractFiles(EditField['NAME'].AsString);
               finally
                  Zip.CloseArchive;
                  Zip.Free;
                  Wait.Free;
               end;
               //
               AttachName:=TempDir+EditField['NAME'].AsString;
               if not Doc2Sel.ShowReport(AttachName) then begin
                  ShellExecute(Application.Handle, nil, PChar(AttachName), nil, nil, SW_SHOWNORMAL);
               end;
            end;
         end;
      end;
      // � ����
      stInBase:;
   end;
end;

procedure TDocFile.DeleteAttach;
begin
   if (AttachName<>'') and FileExists(AttachName) then begin
      DeleteFile(PChar(AttachName));
   end;
end;

function TDocFile.DetailAdd: Boolean;
begin
   Result:=inherited DetailAdd;
   if Result then begin
      Result:=SetAttachFile;
   end;
end;

function TDocFile.DetailDelete: Boolean;
var
   AttachName: string;
begin
   AttachName:=GetAttachName;
   Result:=inherited DetailDelete;
   if Result then begin
      {+}//DeleteAttach(AttachName);
   end;
end;

function TDocFile.OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean;
begin
   Result:=inherited OnBeforeDeleteRecord(Sender, KeyValues);{+}
end;

{ TIncomingDoc }

function TIncomingDoc.AddInTemplateMenu(Template: TTemplate): Boolean;
begin
   Result:=False;
   if inherited AddInTemplateMenu(Template) then begin
      Result:=(
         //��������������-����������� �������� (A5, ��� �������)
         (Doc2Sel.ParamAsBoolean('DR_RKK_A5')   and SameText(Template.Name, 'RKK_A5')) or
         //��������������-����������� �������� (A4, ��� �������)
         (Doc2Sel.ParamAsBoolean('DR_RKK_A4V1') and SameText(Template.Name, 'RKK_A4_V1')) or
         //��������������-����������� �������� (A4)
         (Doc2Sel.ParamAsBoolean('DR_RKK_A4V2') and SameText(Template.Name, 'RKK_A4_V2')) or
         //��������������-����������� �������� (A4, ��� �����)
         (Doc2Sel.ParamAsBoolean('DR_RKK_A4V3') and SameText(Template.Name, 'RKK_A4_V3')) or
         //��������������-����������� �������� ����������������
         (Doc2Sel.ParamAsBoolean('DR_RKK_USER') and SameText(Template.Name, 'RKK_USER'))
      );
   end;
end;

constructor TIncomingDoc.Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
begin
   inherited Create(DBItem, RecInt);
   FGroupFormula:='';
   LayoutName:='TfmEdIn';
   TemplateGroup:='IN_DOC';
   FDocType:=gtIncoming;
   FGroupFilter:=Format('IS_NODE=%d or KIND=%d', [iNode, gkIncoming]);
   FFileItem:=DBItem.DetailList.ByName('DOC_FILE');
   Assert(FFileItem<>nil, '�� ������ ������ � ����� "DOC_FILE".');
   FDocFile:=TDocFile.Create(FFileItem, RecInt);
   // ������������� "����������"
   //--DBItem.Look.AddItem('BY_GROUP', '�� �������', CDefaultTableViewName, DBItem, GetLookByGroup, OnApplyFilter, dmDocImg.imDocs);
   FNotExec:=Format('%s.EXEC_FACT is null', [DBItem.TableAlias]);
   DBItem.Look.AddItem('BY_EXEC_TERM', '�� ������ ����������', CDefaultTableViewName, DBItem, GetLookByExecTerm, OnApplyFilter, dmDocImg.imDocs, '');
   DBItem.Look.AddItem('BY_SUBJ', '�� ��������� ����������', CDefaultTableViewName, DBItem, GetLookBySubj, OnApplyFilter, nil, 'SP_SUBJ');
   DBItem.Look.AddItem('BY_ANY_TYPE', '�� ����� ����������', CDefaultTableViewName, DBItem, GetLookByAnyType, OnApplyFilter, dmDocImg.imDocs, '');
   DBItem.Look.AddItem('BY_FILE', '�� ������������ ���', CDefaultTableViewName, DBItem, GetLookByFile, OnApplyFilter, nil, 'SP_FILELIST');
end;

destructor TIncomingDoc.Destroy;
begin
   FDocFile.Free;
   inherited;
end;

function TIncomingDoc.GetLookByAnyType(Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
begin
   Result:=True;
   LookTree.DoExpand:=True;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('��� ���������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:='';
   AddEnumToLook(RootItem, 'DOC_KIND', 'DOC_KIND');
   AddEnumToLook(RootItem, 'DELIV_KIND', 'DELIV_KIND');
end;

//---------------------------------------------------------------------------------------------
function proc_OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean;
var
  sFile:String;
begin              
   Result:=true;
   dmBase.DocFile.IndexName:='PR_KEY';
   dmBase.DocFile.SetRange([KeyValues],[KeyValues]);
   try
     with dmBase.DocFile do begin
       while not Eof do begin
         if FieldByName('STORE_KIND').AsInteger=stInFolder then begin
           sFile:=Doc2Sel.GetAttachDir+FieldByName('DIR_YEAR').AsString+'\'+FieldByName('DIR_MONTH').AsString+'\'+FieldByName('DIR_NAME').AsString;
           if FileExists(sFile) then begin
             SysUtils.DeleteFile(sFile);
           end;
         end;
         Next;
       end;
     end;
   finally
     dmBase.DocFile.CancelRange;
   end;
   {
   Query:=TAdsQuery.Create(nil);
   try
      Query.DatabaseName:=Sender.DatabaseName;
      Query.SQL.Text:=Format('select dir_year+''\''+dir_month+''\''+dir_name as file_name from DocFile where doc_id=%s and store_kind=%d', [KeyValues, stInFolder]);
      Query.Open;
      //��������� �� ������ ������ � �������, ���� ���� ����������
      //������ ���� � ����� - Doc2Sel.GetAttachDir+file_name

   finally
      Query.Close;
      Query.AdsCloseSQLStatement;
      Query.Free
   end;
   }
end;

function TIncomingDoc.OnBeforeDeleteRecord(Sender: TDBItem;  KeyValues: string): Boolean;
begin
  Result:=inherited OnBeforeDeleteRecord(Sender, KeyValues);
  if Result then begin
    Result:=proc_OnBeforeDeleteRecord(Sender,KeyValues);
  end;
end;

procedure TIncomingDoc.OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean);
begin
   inherited;
end;

procedure TIncomingDoc.OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);
var
   MenuItem: TMenuItem;
begin
   inherited;
   case MenuKind of
      // ���� �������� ����������
      mkWordTemplate: begin
      end;
      // ��������� �������
      mkSysFilter: begin
         Menu.Items.Clear;
         MenuItem:=TMenuItem.Create(Menu.Owner);
         MenuItem.Tag:=0;
         MenuItem.Caption:='������� ���';
         MenuItem.OnClick:=OnClick;
         Menu.Items.Add(MenuItem);
      end;
   end;
end;

procedure TIncomingDoc.OnSetDefaultValue(Sender: TDBItem);
begin
   //? REG_IND - ���������������� ������
   //��������� �������� ����� �� ���������
   Sender.SetDestField([
      'DOC_TYPE',    FDocType,     // ��� ��������� - �������� ���������
      'GROUP_ID',    FGroupId,     // ������ ���������
      'GROUP_KIND',  FGroupKind,   // ������� ������ ��������� - ��������
      'FOLDER_ID',   dfCommon,     // ������� ����� ��������� - �����
      'APP_FORM',    stVerbal,     // ����� ����������� ��������� - stWriting
      'REQ_CHECK',   lNo,          // ����: �������� - ���
      //'ANS_KIND'                 // ��� ��������� �������
      'CHECK_OUT',   False,        // ����: c���� � �������� ��� ��������� - ���
      'IN_FILE',     False,        // ����: � ���� - ���
      // ���� ����������� � ������ ������ ���� ������ ����� ���� �����������
      'REG_DATE',    Date,         // ���� �����������
      'IN_DATE',     Date,         // [=REG_DATE] ���� �����������
      //����������� ������ �� �������
      'REG_NUM',     GetLastRegNum(FDocType, FGroupId)+1,
      'NOT_EXP',     False         // �� ���������
   ]);
   //��������� ��������� ������
   EditField['REG_IND'].AsString:=GetRegInd(FDocType, FGroupId, 'VXOD_NOMER', true);
end;

procedure TIncomingDoc.OnGetCellParams(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if ViewField['DOC_STATUS'].AsInteger=cdIzm
    then Params.Font.Style:=[fsBold];
end;

function TIncomingDoc.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
var
   fm: TfmEdIn;
begin
   Result:=False;
   if inherited OnViewRecord(Sender, ViewMode) then begin
      if TableField['DOC_STATUS'].AsInteger=cdIzm{1} then begin  // vadim 11.01.2019
        //DBItem.Table.CheckBrowseMode;
        DBItem.Table.Edit;
        TableField['DOC_STATUS'].AsInteger:=cdNo{0};
        DBItem.Table.Post;
        DBItem.RefreshView;
        //ShowMessage('1111111111111');
      end;

      FDocFile.ViewMode:=ViewMode;
      //
      fm:=TfmEdIn.Create(nil);
      OnSetControl:=fm.SetControl;
      OnResetControl:=fm.ResetControl;
      OnSetControlEvent:=fm.SetControlEvent;
      OnClearControlEvent:=fm.ClearControlEvent;
      OnInvokeControlEvent:=fm.InvokeControlEvent;
      OnUpdateEnabledAction:=fm.UpdateEnabledAction;
      OnSetControlPosition:=fm.SetControlPosition;
      //OnClearModified:=fm.ClearModified;
      //OnSaveLayout:=fm.SaveLayout;
      //OnLoadLayout:=fm.LoadLayout;
      try
         fm.Doc:=Self;
         Result:=Edit(fm);
      finally
         fm.Free;
      end;
   end;
end;

{ TOutgoingDoc }

function TOutgoingDoc.AddInTemplateMenu(Template: TTemplate): Boolean;
begin
   //todo: ������ ������ ������ ������� TIncomingDoc.AddInTemplateMenu
   Result:=False;
   if inherited AddInTemplateMenu(Template) then begin
      Result:=(
         //��������������-����������� �������� (A5, ��� �������)
         (Doc2Sel.ParamAsBoolean('DR_RKK_A5')   and SameText(Template.Name, 'RKK_A5')) or
         //��������������-����������� �������� (A4, ��� �������)
         (Doc2Sel.ParamAsBoolean('DR_RKK_A4V1') and SameText(Template.Name, 'RKK_A4_V1')) or
         //��������������-����������� �������� (A4)
         (Doc2Sel.ParamAsBoolean('DR_RKK_A4V2')   and SameText(Template.Name, 'RKK_A4_V2')) or
         //��������������-����������� �������� (A4, ��� �����)
         (Doc2Sel.ParamAsBoolean('DR_RKK_A4V3')   and SameText(Template.Name, 'RKK_A4_V3')) or
         //��������������-����������� �������� ����������������
         (Doc2Sel.ParamAsBoolean('DR_RKK_USER') and SameText(Template.Name, 'RKK_USER'))
      );
   end;
end;

constructor TOutgoingDoc.Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
begin
   inherited Create(DBItem, RecInt);
   LayoutName:='TfmEdOut';
   TemplateGroup:='OUT_DOC';
   FDocType:=gtOutgoing;
   FGroupFilter:=Format('IS_NODE=%d or KIND=%d', [iNode, gkOutgoing]);
   FFileItem:=DBItem.DetailList.ByName('DOC_FILE');
   Assert(FFileItem<>nil, '�� ������ ������ � ����� "DOC_FILE".');
   FDocFile:=TDocFile.Create(FFileItem, RecInt);
   // ������������� "����������"
   //--DBItem.Look.AddItem('BY_GROUP', '�� �������', CDefaultTableViewName, DBItem, GetLookByGroup, OnApplyFilter, dmDocImg.imDocs);
   DBItem.Look.AddItem('BY_SUBJ', '�� ��������� ����������', CDefaultTableViewName, DBItem, GetLookBySubj, OnApplyFilter, nil, 'SP_SUBJ');
   DBItem.Look.AddItem('BY_ANY_TYPE', '�� ����� ����������', CDefaultTableViewName, DBItem, GetLookByAnyType, OnApplyFilter, dmDocImg.imDocs, '');
   DBItem.Look.AddItem('BY_FILE', '�� ������������ ���', CDefaultTableViewName, DBItem, GetLookByFile, OnApplyFilter, nil, 'SP_FILELIST');
end;

destructor TOutgoingDoc.Destroy;
begin
   FDocFile.Free;
   inherited;
end;

function TOutgoingDoc.GetLookByAnyType(Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
begin
   Result:=True;
   LookTree.DoExpand:=True;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('��� ���������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:='';
   AddEnumToLook(RootItem, 'DOC_KIND', 'DOC_KIND');
   AddEnumToLook(RootItem, 'DELIV_KIND', 'DELIV_KIND');
end;

function TOutgoingDoc.OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean;
begin
  Result:=inherited OnBeforeDeleteRecord(Sender, KeyValues);
  if Result then begin
    Result:=proc_OnBeforeDeleteRecord(Sender,KeyValues);
  end;
end;


procedure TOutgoingDoc.OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean);
begin
   inherited;
end;

procedure TOutgoingDoc.OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);
var
   MenuItem: TMenuItem;
begin
   inherited;
   case MenuKind of
      // ���� �������� ����������
      mkWordTemplate: begin
      end;
      // ��������� �������
      mkSysFilter: begin
         Menu.Items.Clear;
         MenuItem:=TMenuItem.Create(Menu.Owner);
         MenuItem.Tag:=0;
         MenuItem.Caption:='������� ���';
         MenuItem.OnClick:=OnClick;
         Menu.Items.Add(MenuItem);
      end;
   end;
end;

procedure TOutgoingDoc.OnSetDefaultValue(Sender: TDBItem);
begin
   //? REG_IND - ���������������� ������
   //��������� �������� ����� �� ���������
   Sender.SetDestField([
      'DOC_TYPE',    FDocType,     // ��� ��������� - ��������� ���������
      'GROUP_ID',    FGroupId,     // ������ ���������
      'GROUP_KIND',  FGroupKind,   // ������� ������ ��������� - ���������
      'FOLDER_ID',   dfCommon,     // ������� ����� ��������� - �����
      'APP_FORM',    stVerbal,     // ����� ����������� ��������� - stWriting
      'REQ_CHECK',   lNo,          // ����: �������� - ���
      //'ANS_KIND'                 // ��� ��������� �������
      'CHECK_OUT',   False,        // ����: c���� � �������� ��� ��������� - ���
      'IN_FILE',     False,        // ����: � ���� - ���
      // ���� ����������� � ������ ������ ���� ������ ����� ���� �����������
      'REG_DATE',    Date,         // ���� �����������
      'IN_DATE',     Date,         // [=REG_DATE] ���� �����������
      //����������� ������ �� �������
      'REG_NUM',     GetLastRegNum(FDocType, FGroupId)+1,
      'NOT_EXP',     False         // �� ���������
   ]);
   //��������� ��������� ������
   EditField['REG_IND'].AsString:=GetRegInd(FDocType, FGroupId, 'ISXOD_NOMER', true);
end;

function TOutgoingDoc.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
var
   fm: TfmEdOut;
begin
   Result:=False;
   if inherited OnViewRecord(Sender, ViewMode) then begin
      FDocFile.ViewMode:=ViewMode;
      //
      fm:=TfmEdOut.Create(nil);
      OnSetControl:=fm.SetControl;
      OnResetControl:=fm.ResetControl;
      OnSetControlEvent:=fm.SetControlEvent;
      OnClearControlEvent:=fm.ClearControlEvent;
      OnInvokeControlEvent:=fm.InvokeControlEvent;
      OnUpdateEnabledAction:=fm.UpdateEnabledAction;
      OnSetControlPosition:=fm.SetControlPosition;
      //OnClearModified:=fm.ClearModified;
      //OnSaveLayout:=fm.SaveLayout;
      //OnLoadLayout:=fm.LoadLayout;
      try
         fm.Doc:=Self;
         Result:=Edit(fm);
      finally
         fm.Free;
      end;
   end;
end;

function TOutgoingDoc.SelectDocument(var Query: TAdsQuery;  Bookmark: TStringList): Boolean;
begin
   Result:=fSelDoc3.SelectDocument3(Self, Query, Bookmark);
end;

{ TAdmProcDoc }

function TAdmProcDoc.AutoCountSubj(SignType, SignKind: Integer): Integer;
begin
   Result:=AutoCountSubj(SignType, SignKind, EditField['ADM_PROC'].AsInteger);
end;

constructor TAdmProcDoc.Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
begin
   inherited Create(DBItem, RecInt);
   LayoutName:='TfmEdAProc';
   TemplateGroup:='ADM_PROC';
   FDocType:=gtAdmProc;
   FGroupFilter:=Format('IS_NODE=%d or KIND=%d', [iNode, gkAdmProc]);
   FFileItem:=DBItem.DetailList.ByName('DOC_FILE');
   Assert(FFileItem<>nil, '�� ������ ������ � ����� "DOC_FILE".');
   FDocFile:=TDocFile.Create(FFileItem, RecInt);
   FWorkItem:=DBItem.DetailList.ByName('DOC_WORK');
   Assert(FWorkItem<>nil, 'Ia iaeaai iauaeo n eiaii "DOC_WORK".');
   FDocWork:=TDocWork.Create(FWorkItem, RecInt);
   FLinkItem:=DBItem.DetailList.ByName('DOC_LINK');
   Assert(FLinkItem<>nil, '�� ������ ������ � ����� "DOC_LINK".');
   // ������������� "����������"
   //--DBItem.Look.AddItem('BY_GROUP', '�� �������', CDefaultTableViewName, DBItem, GetLookByGroup, OnApplyFilter, dmDocImg.imDocs);
   FNotExec:=Format('%s.ANS_KIND is null', [DBItem.TableAlias]);
   DBItem.Look.AddItem('BY_EXEC_TERM', '�� ������ ����������', CDefaultTableViewName, DBItem, GetLookByExecTerm, OnApplyFilter, dmDocImg.imDocs, '');
   DBItem.Look.AddItem('BY_ADMPROC', '�� ���������������� ���������� �������', CDefaultTableViewName, DBItem, GetLookByAdmProc, OnApplyFilter, nil, 'SP_ADMPROC');
   DBItem.Look.AddItem('BY_ADMPROC_U', '�� ���������������� ���������� �����������', CDefaultTableViewName, DBItem, GetLookByAdmProcU, OnApplyFilter, nil, 'SP_ADMPROC_U');{+}
   DBItem.Look.AddItem('BY_ANY_TYPE', '�� ����� ���������', CDefaultTableViewName, DBItem, GetLookByAnyType, OnApplyFilter, dmDocImg.imDocs, '');
   DBItem.Look.AddItem('BY_FILE', '�� ������������ ���', CDefaultTableViewName, DBItem, GetLookByFile, OnApplyFilter, nil, 'SP_FILELIST');
   // ������ ���������� � ������� �������� �� ������������ ��������� �������
   FdsDocInfo:=CreateMemTable([
      'DOC_TYPE', Integer(ftInteger), 0,   // ��� ���������
      'ID',       Integer(ftInteger), 0,   // ��� �������� ������
      'NAME',     Integer(ftString),  100, // ������������ ��������
      'VALUE',    Integer(ftInteger), 0,   // ��������
      'FG_COLOR', Integer(ftInteger), 0,   // ���� ������ ��������
      'BG_COLOR', Integer(ftInteger), 0    // ����� ���� ��������
   ], True, True);
end;

destructor TAdmProcDoc.Destroy;
begin
   FDocWork.Free;
   FDocFile.Free;
   FdsDocInfo.Free;
   inherited;
end;

function TAdmProcDoc.EditDocLink(DBItem: TDBItem; DataSet: TDataSet; DataSource: TDataSource; ViewMode: TViewMode): Boolean;
begin
    Result:=fEdLink2.EditDocLink2(DBItem, DataSet, DataSource, ViewMode, FDocType);
end;

function TAdmProcDoc.FillDocInfo: Boolean;
var
   I: Integer;
   Res: Integer;
begin
   Res:=0;
   FdsDocInfo.EmptyTable;
   for I:=Low(CAdmProcStr) to High(CAdmProcStr) do begin
      FdsDocInfo.AppendRecord([
         FDocType,
         Ord(CAdmProcStr[I].DI),
         GetDocInfoName(CAdmProcStr[I].DI),
         GetDocInfo(CAdmProcStr[I].DI),
         CAdmProcStr[I].Fg,
         CAdmProcStr[I].Bg
      ]);
      Res:=Res+FdsDocInfo.FieldByName('VALUE').AsInteger;
   end;
   Result:=Res<>0;
end;

function TAdmProcDoc.GetCountSignSQL(SignType, SignKind, DocId, SubjId: Integer): string;
begin
   Result:=inherited GetCountSignSQL(SignType, SignKind, DocId, 0);
   // ���� ���������� ��������� ���������� �������� �������� ���������
   if (SubjId>0) and (Result<>'') then begin
      Result:=Result+Format(' and ADM_PROC=%d', [SubjId]);
   end;
end;

function TAdmProcDoc.GetDocInfo(DocInfo: TDocInfo): Integer;
begin
   Result:=0;
   case DocInfo of
      // 1. ����� ���������������� ���������, ��������� ������������
      diTotalExec: begin
         //������������ ���������� ������������� ���������,
         //�.�. �� ���������� ���� ���������� ������� - ANS_KIND
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            'where d.DOC_TYPE=%d and d.ANS_KIND is null',
            [FDocType], 0
         );
      end;
      // 2. �������� ������������� ���� ����������
      diSkipTerm: begin
         //������������ ���������� ��������� (�������������, �.�. ��� ������� ANS_KIND ������)
         //� ����������� ������ ����������
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            'where d.DOC_TYPE=%d and d.ANS_KIND is null and d.EXEC_TERM is not null and '+
                  'curdate()>d.EXEC_TERM',
            [FDocType], 0
         );
      end;
      // 3. ���� ���������� �������� ����� N ���� (N - �������� ����������)
      diExpireTerm: begin
         //������������ ���������� ��������� (�������������, �.�. ��� ������� ANS_KIND ������)
         //�� ��������� ����� ����������, ������� �������� �������� ���������� ����
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            'where d.DOC_TYPE=%d and d.ANS_KIND is null and d.EXEC_TERM is not null and '+
                  'd.EXEC_TERM-curdate() between 0 and %d',
            [FDocType, FRecInt.ParNextDay], 0
         );
      end;
      // 4. ��������� ����� �� ������
      diWaitAnswer: begin
         //������������ ���������� ��������� (�������������, �.�. ��� ������� ANS_KIND ������)
         //� ������� � ���� ������������ ���� �� ������ ������� � ��������
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            'left join ( '+
            '   select distinct w.DOC_ID from DOCWORK w '+
            '   where w.CHECK_OUT=%d '+
            ') w on w.DOC_ID=d.DOC_ID '+
            'where d.DOC_TYPE=%d and d.ANS_KIND is null and w.DOC_ID is not null',
            [chYes, FDocType], 0
         );
      end;
      // 5. ��������� �� ��������
      diCheck: begin
         //������������ ���������� ��������� (�������������, �.�. ��� ������� ANS_KIND ������)
         //� ������� ����� ������� "��������" (REQ_CHECK=lYes)
         //� �� ����� ������� � ������ � �������� (CHECK_OUT=False)
         Result:=QueryIntegerValue(
            'select count(*) from DOCMAIN d '+
            'where d.DOC_TYPE=%d and d.ANS_KIND is null and d.REQ_CHECK=%d and d.CHECK_OUT=False',
            [FDocType, lYes], 0
         );
      end;
   end;
end;

function TAdmProcDoc.GetDocInfoName(DocInfo: TDocInfo): string;
var
   I: Integer;
begin
   Result:='';
   for I:=Low(CAdmProcStr) to High(CAdmProcStr) do begin
      if CAdmProcStr[I].DI=DocInfo then begin
         Result:=CAdmProcStr[I].N;
         // ���� ���������� �������� ����� ...
         if DocInfo=diExpireTerm then begin
            Result:=Format(Result, [FRecInt.ParNextDay, DeclensionDay(FRecInt.ParNextDay)]);
         end;
         Break;
      end;
   end;
end;

function TAdmProcDoc.GetLookByAdmProc(Name: string; LookTree: TLookTree): Boolean;
begin
   Result:=GetLookByAdmProc_('SP_ADMPROC', Name, LookTree);
end;

function TAdmProcDoc.GetLookByAdmProcU(Name: string; LookTree: TLookTree): Boolean;
begin
   Result:=GetLookByAdmProc_('SP_ADMPROC_U', Name, LookTree);
end;

function TAdmProcDoc.GetLookByAdmProc_(SprName, Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
   DataSet: TDataSet;
   IdField: TField;
   ParentIdField: TField;
   IsNodeField: TField;
   NameField: TField;
   ProcNoField: TField;
   AdmProcSpr: TDBItem;
   SaveFilter: string;

   procedure AddToTree(RootId: Integer; OwnerItem: TLookItem);
   var
      LookItem: TLookItem;
      Bookmark: string;
      S: string;
   begin
      // NB: !!! ����� �� ����������� ������ ���������� ������
      DataSet.First;
      while not DataSet.Eof do begin
         if ParentIdField.AsInteger=RootId then begin
            if IsNodeField.AsInteger=iNode then begin
               S:=AdmProcSpr.GetIdList(IdField.AsInteger);
               if S<>'' then begin
                  LookItem:=OwnerItem.Child.AddItem(ProcNoField.AsString+' '+NameField.AsString, True, S<>'', True, -1, -1, -1, -1);
                  LookItem.Value:=Format('%s.ADM_PROC in (%s)', [DBItem.TableAlias, S]);
                  Bookmark:=DataSet.Bookmark;
                  AddToTree(IdField.AsInteger, LookItem);
                  DataSet.Bookmark:=Bookmark;
               end;
            end
            else begin
               LookItem:=OwnerItem.Child.AddItem(ProcNoField.AsString+' '+NameField.AsString, False, True, False, -1, -1, -1, IdField.AsInteger);
               LookItem.Value:=Format('%s.ADM_PROC=%d', [DBItem.TableAlias, IdField.AsInteger]);
            end;
         end;
         DataSet.Next;
      end;
   end;

begin
   Result:=True;
   AdmProcSpr:=FRecInt.SprDBItems.ByName(SprName);
   LookTree.DoExpand:=True;
   LookTree.Root.Clear;
   RootItem:=LookTree.Root.AddItem('��� ���������', True, True, True, -1, -1, -1, -1);
   RootItem.Value:='';
   //
   if (AdmProcSpr<>nil) and AdmProcSpr.HaveStyle(bsTree) then begin
      DataSet:=AdmProcSpr.Table;
      IdField:=AdmProcSpr.CodeField;
      ParentIdField:=AdmProcSpr.ParentIdField;
      IsNodeField:=AdmProcSpr.IsNodeField;
      NameField:=AdmProcSpr.NameField;
      ProcNoField:=AdmProcSpr.Table.FindField('PROC_NO');
      DataSet.DisableControls;
      SaveFilter:=DataSet.Filter;
      DataSet.Filter:=AdmProcSpr.TableFilter;
      DataSet.Filtered:=True;
      try
         AddToTree(0, RootItem);
      finally
         DataSet.Filter:=SaveFilter;
         DataSet.Filtered:=SaveFilter<>'';
         DataSet.EnableControls;
      end;
   end;
end;

function TAdmProcDoc.GetLookByAnyType(Name: string; LookTree: TLookTree): Boolean;
var
   RootItem: TLookItem;
begin
   Result:=True;
   LookTree.DoExpand:=True;
   LookTree.Root.Clear;
   LookTree.Rebuild:=False;
   RootItem:=LookTree.Root.AddItem('��� ���������', True, True, True, -1, DI_FolderOpen, DI_FolderClose, -1);
   RootItem.Value:='';
   AddEnumToLook(RootItem, 'APP_FORM', 'APP_FORM');
   AddEnumToLook(RootItem, 'SIGN_KIND1', 'SIGN_KIND');
   AddEnumToLook(RootItem, 'APP_KIND1', 'APP_KIND');
   AddEnumToLook(RootItem, 'ANS_KIND1', 'ANS_KIND');
   //NB: ???  �����������
end;

function TAdmProcDoc.OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean;
begin
  Result:=inherited OnBeforeDeleteRecord(Sender, KeyValues);
  if Result then begin
    Result:=proc_OnBeforeDeleteRecord(Sender,KeyValues);
  end;
end;

procedure TAdmProcDoc.OnBuildMenu(Sender: TDBItem; Menu: TMenu; MenuKind: TBuildMenuKind; OnClick: TNotifyEvent);
var
   //I: Integer;
   //Template: TTemplate;
   MenuItem: TMenuItem;
begin
   inherited;
   case MenuKind of
      // ���� �������� ����������
      mkWordTemplate: begin
         {Menu.Items.Clear;
         for I:=0 to Pred(FRecInt.TemplateInterface.Engine.TemplateList.Count) do begin
            Template:=FRecInt.TemplateInterface.Engine.TemplateList[I];
            if (Template<>nil) and (AnsiCompareText(TemplateGroup, Template.Group)=0) then begin
               MenuItem:=TMenuItem.Create(Menu.Owner);
               MenuItem.Tag:=Integer(Template);
               MenuItem.Caption:=Template.Caption;
               if Assigned(OnClick) then begin
                  MenuItem.OnClick:=OnClick;
               end
               else begin
                  MenuItem.OnClick:=OnTemplateMenuClick;
               end;
               Menu.Items.Add(MenuItem);
            end;
         end;}
      end;
      // ��������� �������
      mkSysFilter: begin
         Menu.Items.Clear;
         MenuItem:=TMenuItem.Create(Menu.Owner);
         MenuItem.Tag:=0;
         MenuItem.Caption:='������� ���';
         MenuItem.OnClick:=OnClick;
         Menu.Items.Add(MenuItem);
      end;
   end;
end;

procedure TAdmProcDoc.OnEditButtonClick(Sender: TObject; var Handled: Boolean);
var
   FieldItem: TFieldItem;
   KeyValue: string;
   LinkSpr: TDBItem;
   SignKind: TFieldItem;{+}
   SprName: string;
begin
   if (Screen.ActiveControl is TDBComboboxEh) and (DBItem.FieldList.ByName('ADM_PROC')=TFieldItem(TDBComboboxEh(Screen.ActiveControl).Tag)) then begin
      FieldItem:=TFieldItem(TDBComboboxEh(Screen.ActiveControl).Tag);
      SignKind:=DBItem.FieldList.ByName('SIGN_KIND');{+}
      KeyValue:=FieldItem.DestField.AsString;
      {+}
      SprName:='SP_ADMPROC';
      if KeyValue='' then begin
         if SignKind.DestField.AsInteger=2 then SprName:='SP_ADMPROC_U';
      end
      else if StrToIntDef(KeyValue, 1)>10000 then SprName:='SP_ADMPROC_U';
      {+}
      LinkSpr:=FRecInt.SprDBItems.ByName(SprName);
      if LinkSpr<>nil then begin
         if SelectSprValue(LinkSpr, KeyValue, LinkSpr.CodeFieldName) then begin
            if FieldItem.CanEdit then begin
               FieldItem.DBItem.EditTable.Edit;
               FieldItem.DestField.AsString:=KeyValue;
            end;
         end;
      end;
      Handled:=True;
   end
   else begin
      inherited;
   end;
end;

procedure TAdmProcDoc.OnExecAction(Sender: TDBItem);
begin
   if FillDocInfo then begin
      ShowDocInfo(FdsDocInfo, ' ������� ��������� ������ �� ���������������� ����������:');
   end;
end;

procedure TAdmProcDoc.OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
   ProcId: Integer;
begin
   if SameText(TColumnEh(Sender).FieldName, 'ADM_PROC_R') then begin
      ProcId:=TColumnEh(Sender).Field.AsInteger;
      if ProcId>10000 then begin
         if dmBase.SprDocAdmProcU.Locate('ID', ProcId, []) then begin
            Params.Text:=Trim(dmBase.SprDocAdmProcU.FieldByName('PROC_NO').AsString)+' '+Trim(dmBase.SprDocAdmProcU.FieldByName('NAME').AsString);
         end
      end
      else begin
         if dmBase.SprDocAdmProc.Locate('ID', ProcId, []) then begin
            Params.Text:=Trim(dmBase.SprDocAdmProc.FieldByName('PROC_NO').AsString)+' '+Trim(dmBase.SprDocAdmProc.FieldByName('NAME').AsString);
         end
      end;
   end;
end;

procedure TAdmProcDoc.OnSetDefaultValue(Sender: TDBItem);
var
  n:Integer;      
begin
   n:=stVerbal;           // vadim
   //? REG_IND - ���������������� ������
   //��������� �������� ����� �� ���������
   Sender.SetDestField([
      'DOC_TYPE',    FDocType,     // ��� ��������� - ���������������� ���������
      'GROUP_ID',    FGroupId,     // ������ ���������
      'GROUP_KIND',  FGroupKind,   // ������� ������ ��������� - ���������������� ���������
      'FOLDER_ID',   dfCommon,     // ������� ����� ��������� - �����
      'SIGN_TYPE',   stIndividual, // ��� ������� ��������� - ��������������
      'SIGN_NUM',    1,            // ���������� �������
      'SIGN_KIND',   skMan,        // ��� ��������� - ���������
      'APP_FORM',    n, // stWriting,    // ����� ����������� ��������� stWriting-���������  stVerbal-�����
      'APP_KIND',    dcClaim,      // ��� ��������� - ���������
      'REQ_CHECK',   lNo,          // ����: �������� - ���
      //'ANS_KIND'                 // ��� ��������� �������
      'CHECK_OUT',   False,        // ����: c���� � �������� ��� ��������� - ���
      'IN_FILE',     False,        // ����: � ���� - ���
      'IS_REPEAT',   False,        // ���������� ��������� - ���
      // ���� ����������� � ������ ������ ���� ������ ����� ���� �����������
      'REG_DATE',    Date,         // ���� �����������
      'IN_DATE',     Date,         // [=REG_DATE] ���� �����������
      //����������� ������ �� �������
      'REG_NUM',     GetLastRegNum(FDocType, FGroupId)+1,
      'NOT_EXP',     False         // �� ���������
   ]);
   //��������� ��������� ������
//   EditField['REG_IND'].AsString:=GetRegInd(FDocType, FGroupId, 'ADMIN_NOMER', true);
end;

procedure TAdmProcDoc.OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean);
begin
   inherited;
//   ShowMessage(EditField['APP_FORM'].Asstring);  vadim       ����� ������������ dmBase ��� ���������� �������� �� ���������
   //�������� ������ � ������������ � ����� ���������
   if EditField['SIGN_KIND'].AsInteger=skUL then begin
      Sender.SetSrcField([
         'SIGN_MAN',      -1
      ]);
   end
   else begin
      Sender.SetSrcField([
         'SIGN_ORG',      -1
      ]);
   end;
end;

function TAdmProcDoc.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
var
   fm: TfmEdAProc;
begin
   Result:=False;
   if inherited OnViewRecord(Sender, ViewMode) then begin
      FDocFile.ViewMode:=ViewMode;
      //
      fm:=TfmEdAProc.Create(nil);
      OnSetControl:=fm.SetControl;
      OnResetControl:=fm.ResetControl;
      OnSetControlEvent:=fm.SetControlEvent;
      OnClearControlEvent:=fm.ClearControlEvent;
      OnInvokeControlEvent:=fm.InvokeControlEvent;
      OnUpdateEnabledAction:=fm.UpdateEnabledAction;
      OnSetControlPosition:=fm.SetControlPosition;
      //OnClearModified:=fm.ClearModified;
      //OnSaveLayout:=fm.SaveLayout;
      //OnLoadLayout:=fm.LoadLayout;
      try
         fm.Doc:=Self;
         Result:=Edit(fm);
      finally
         fm.Free;
      end;
   end;
end;

function TAdmProcDoc.SelectDocument(var Query: TAdsQuery; Bookmark: TStringList): Boolean;
begin
  Result:=fSelDoc2.SelectDocument2(Self, Query, Bookmark);
end;

{ TSpAdmProc }

procedure TSpAdmProc.OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
   if not TableField['EXCL_DATE'].IsNull then begin
      Params.Font.Color:=clRed;
      Params.Font.Style:=[fsStrikeOut];
   end;
end;

function TSpAdmProc.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
var
   fm: TfmSpAdm;
begin
   Result:=False;
   if Sender=DBItem then begin
      Self.ViewMode:=ViewMode;
      fm:=TfmSpAdm.Create(nil);
      OnSetControl:=fm.SetControl;
      try
         fm.Spr:=Self;
         Result:=Edit(fm);
      finally
         fm.Free;
      end;
   end;
end;

{ TDBSpr }

constructor TDBSpr.Create(DBItem: TDBItem; RecInt: TDocRecordInterface);
begin
   inherited Create(DBItem);
   FRecInt:=RecInt;
end;

destructor TDBSpr.Destroy;
begin
   inherited;
end;

//SprDocAdmProc.ID   >>  NB: ??? ADM_PROC
//SprDocAdmProcU.ID  >>  NB: ??? ADM_PROC
//SprDocFileList.ID  >>  FILE_ID
//SprDocFolder.ID    >>  FOLDER_ID
//SprDocGroup.ID     >>  GROUP_ID
//SprDocManGroup.ID  >>  SIGN_GROUP
//SprDocOfficial.ID  >>  RES_MAN, EXEC_MAN, CHECK_MAN, VISIT_MAN
//SprDocSubj.ID      >>  SUBJ_ID
//NB: ??? ACC_ID     >>  ������������.ID
function TDBSpr.OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean;
var
   I: Integer;
   List: TList;
   sl: TStringList;
   S: string;
   FieldItem: TFieldItem;
begin
   //NB: - ���������� �������� ����������� ��������� ����������, ������� ��������� �� ������
   //    - �������������� ��� �� ����������� ������� � �������� �� ������� ����������� Locate
   //    - FindLinkSpr ����� ���������� ��������� ������ �� ���� � ���� ���� ������� (������ �������, ���������� ���� � ���� �������)
   //    - ��������������, ��� ���� � ����������� ������ ������� �� ������ ����
   Result:=True;
   if DBItem.HaveStyle(bsSpr) then begin
      List:=TList.Create;
      sl:=TStringList.Create;
      try
         if FRecInt.DBList.FindLinkSpr(DBItem, List) then begin
            for I:=0 to Pred(List.Count) do begin
               FieldItem:=TFieldItem(List[I]);
               if FieldItem<>nil then begin
                  S:=Format('%s.%s', [FieldItem.DBItem.TableName, FieldItem.FieldName]);
                  if sl.IndexOf(S)=-1 then begin
                     sl.Add(S);
                     if FieldItem.DBItem.Table.Locate(FieldItem.FieldName, KeyValues, []) then begin
                        if IsTree and (IsNode=iNode) then begin
                           DlgResult:=MessageDlgR(Format('������ ������� ������ "%s"!'#13#10'������ �������� �������������� ��� ����������� ����������.', [DBItem.NameField.AsString]), mtWarning, [mbOk], 0);
//                           DlgResult:=MessageDlgR(Format('������ ������� ������ "%s"!'#13#10'������ �������� �������������� ��� ����������� ����������.', [DBItem.NameField.AsString]), mtWarning, [mbOk, mbCancel], 0);
                        end
                        else begin
                           DlgResult:=MessageDlgR('������ ������� ������� ������!'#13#10'������ �������� �������������� ��� ����������� ����������.', mtWarning, [mbOk], 0);
                        end;
                        Result:=False;
                        Break;
                     end;                
                  end;
               end;
            end;
         end;
      finally
         sl.Free;
         List.Free;
      end;
   end;
end;

function TDBSpr.OnBeforeNewRecord(Sender: TDBItem): Boolean;
begin
   Result:=True;
   if IsOrder then begin
      LastOrder:=DBItem.GetLastOrder(skTable);
   end;
end;

procedure TDBSpr.OnBeforeUpdateRecord(Sender: TDBItem; IsNew: Boolean);
begin
   inherited;
end;

procedure TDBSpr.OnSetDefaultValue(Sender: TDBItem);
begin
   if IsOrder then begin
      EditField[DBItem.OrderFieldName].AsInteger:=Succ(LastOrder);
      //DBItem.OrderField.AsInteger:=Succ(LastOrder);
   end;
   if IsTree then begin
      EditField[DBItem.IsNodeFieldName].AsInteger:=IsNode;
      //DBItem.IsNodeField.AsInteger:=IsNode;
      EditField[DBItem.ParentIdFieldName].AsInteger:=ParentId;
      //DBItem.ParentIdField.AsInteger:=ParentId;
   end;
end;

function TDBSpr.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
var
   fm: TfmSprRec;
begin
   Result:=False;
   if inherited OnViewRecord(Sender, ViewMode) then begin
      fm:=TfmSprRec.Create(nil);
      OnSetControl:=fm.SetControl;
      try
         fm.Spr:=Self;
         Result:=Edit(fm);
      finally
         fm.Free;    
      end;
   end;
end;

{ TSpFolder }

function TSpFolder.OnBeforeDeleteRecord(Sender: TDBItem; KeyValues: string): Boolean;
begin
   if TableField['IS_USER'].AsInteger=lNo then begin
      MessageDlgR('������ ������� ������� ������!'#13#10'��� �������� �������� ������ ����� ������������.', mtWarning, [mbOk], 0);
      Result:=False;
   end
   else begin
      Result:=inherited OnBeforeDeleteRecord(Sender, KeyValues);
   end;
end;

procedure TSpFolder.OnSetDefaultValue(Sender: TDBItem);
begin
   inherited;
   EditField['IS_USER'].AsInteger:=lYes;
end;

{ TSpOfficial }

procedure TSpOfficial.OnEnter(Sender: TObject; FieldItem: TFieldItem);
begin
   if SameText(FieldItem.FieldName, 'NAME') then begin
      if FieldItem.DestField.IsNull or (Trim(FieldItem.DestField.AsString)='') then begin
         FieldItem.DestField.AsString:=Trim(EditField['FIO'].AsString)+' - '+AnsiLowerCase(Trim(EditField['POST'].AsString));
      end;
   end;
end;

procedure TSpOfficial.OnSetDefaultValue(Sender: TDBItem);
begin
   inherited;
   Sender.SetDestField([
      // ������������
      'IS_CHIEF',       False,
      // ���������� ������
      'IS_ACTUAL',      True
   ]);
end;

{ TSpDocGroup }

function TSpDocGroup.OnBeforeEditRecord(Sender: TDBItem; KeyValues: string): Boolean;
var
   DocMain: TDBItem;
begin
   // ���� ������ ������ ��� �������������� ��� �����������, �� ������ ������� ��� ���
   DocMain:=FRecInt.DocDBItems.ByName('DOC_MAIN');
   if not DocMain.Table.Locate('GROUP_ID', KeyValues, []) then begin
      DBItem.FieldList.ByName('KIND').ExcludeStyle(fsReadOnly);
   end;
   Result:=True;
end;

function TSpDocGroup.OnBeforeNewRecord(Sender: TDBItem): Boolean;
begin
   Result:=inherited OnBeforeNewRecord(Sender);
   DBItem.FieldList.ByName('KIND').ExcludeStyle(fsReadOnly);
end;

function TSpDocGroup.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
begin
   Result:=inherited OnViewRecord(Sender, ViewMode);
   //NB: ??? �������� ����� � ������ ������� ���������
   DBItem.FieldList.ByName('KIND').IncludeStyle(fsReadOnly);
end;

{ TSpAdmProcU }

procedure TSpAdmProcU.OnGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
   if not TableField['EXCL_DATE'].IsNull then begin
      Params.Font.Color:=clRed;
      Params.Font.Style:=[fsStrikeOut];
   end;
end;

function TSpAdmProcU.OnViewRecord(Sender: TDBItem; ViewMode: TViewMode): Boolean;
var
   fm: TfmSpAdmU;
begin
   Result:=False;
   if Sender=DBItem then begin
      Self.ViewMode:=ViewMode;
      fm:=TfmSpAdmU.Create(nil);
      OnSetControl:=fm.SetControl;
      try
         fm.Spr:=Self;
         Result:=Edit(fm);
      finally
         fm.Free;
      end;
   end;
end;

{ TSpDocSubjG }

procedure TSpDocSubjG.OnSetDefaultValue(Sender: TDBItem);
var
  old,bm:String;
  nID,nOrd:Integer;
begin
  inherited OnSetDefaultValue(Sender);
  old:=dmbase.SprDocSubjG.IndexName;
  bm:=dmbase.SprDocSubjG.Bookmark;
  dmBase.SprDocSubjG.IndexName:='PR_KEY';
  dmBase.SprDocSubjG.Last;
  nID:=dmBase.SprDocSubjG.FieldByName('ID').AsInteger;
  nOrd:=dmBase.SprDocSubjG.FieldByName('N_ORDER').AsInteger;

  EditField['ID'].AsInteger:=nID+1;
  EditField['DATEIZM'].AsDateTime:=Date;
  EditField['N_ORDER'].AsInteger:=nOrd+100;
  EditField['HANDLED'].AsBoolean:=True;

  dmbase.SprDocSubjG.IndexName:=old;
  dmbase.SprDocSubjG.Bookmark:=bm;
end;

end.

