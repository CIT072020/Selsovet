{
 неоходимо создать наследника от TfmGurnal
   означить св-ва:
    QuestDel    : String   запрос на удаление журнала
    QuestDelFlt
    TypeEditObj : Integer  тип корр. обекта из журнала или -1
                   ( dmBase.TypeObj_Lich,dmBase.TypeObj_Nasel,dmBase.TypeObj_Adres )
    TypeEditObj_Akt  !!!

    KodGurnal   : String   название секции в ini-файле журналов
    DateFiks    : TDateTime  на какую дату показывается журнал(книга)
    SybSystem   : подситема к которой принадлежит журнал

    CheckGodGurnal    :  контролировать год журнала
    CurGodGurnal      :  текущий год журнала

    FCheckEmptyGurnal : открывать журнал без отбора пустым   -> SELECT TOP 0   !!! убирать из запроса ORDER BY  !!!
    FSelectionIsSet   : отбор установлен !!! проложить присвоение переменной !!!

    [ADD]
    UPDATE_COL=1  в ini-файле журнала для обновления граф при установке обновления
}

unit fGurnal;

{$I Task.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils, IniFiles, sndkey32,
  Db, adsdata, adsfunc, adstable, Grids, DBGridEh, fSimpleD, fEditMemo, uPadegFIO,fWarning,fChoiceAdres,
  {$IFNDEF EHLIB3 } GridsEh, {$ENDIF} SasaDBGrid, TB2Dock,
  TB2Toolbar, TB2Item, GridSetUp, MetaTask, mPermit, SasaUtils, SasaIniFile,fMultiChoice, fParamQuest,
  {$IFDEF USE_FR3} frxClass, frxDBSet, frxPreView, {$ENDIF}
  fmStringSeek, dbFunc, fmChList, UserEvents, mFindInt, uFilter, PrnDbgeh, uTypes, uProjectAll,
  {$IFDEF EHLIB3 } dbGrids, {$ENDIF} fExpDs, mExport, mTempl, FuncPr, FuncEh, OpisEdit, DBGridEhImpExp, Menus,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  ImgList, ComCtrls, ExtCtrls;

type

  TFormDokument=class of TfmSimpleD;

  TChageType = record
    Kod     : String;
    NewKods : String;
  end;
  TArrChageType = array of TChageType;

  TFilterJurnal = class;

  TfmGurnal = class(TForm)
    TBDock: TTBDock;
    TBToolbarMenu: TTBToolbar;
    Grid: TSasaDBGrid;
    DataSource: TDataSource;
    TBItemClose: TTBItem;
    TBItemSetUpGrid: TTBItem;
    TBItemRefresh: TTBItem;
    TBItemEdit: TTBItem;
    TBItemDelDok: TTBItem;
    TBItemPreView: TTBItem;
    TBItemPrint: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItemClrFlt: TTBItem;
    Query: TAdsQuery;
    TBSubItemRun: TTBSubmenuItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSubChoiceFlt: TTBSubmenuItem;
    TBItemFlt: TTBItem;
    TBItemPrintGrid: TTBItem;
    TBItemOrder: TTBItem;
    TBItemRepeatFilter: TTBItem;
    TBItemQuery: TTBItem;
    TBItemGrupOne: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItemExport: TTBItem;
    TBItemCount: TTBItem;
    TBItemPokaz: TTBItem;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    TmpQuery: TAdsQuery;
    TBSubSysFlt: TTBSubmenuItem;
    ImageListGisun: TImageList;
    TBSubmenuTmp: TTBSubmenuItem;
    TBItemSysFlt: TTBItem;
    ImageListISKL: TImageList;
    ImageParent: TImageList;
    TBItemGrantSprav: TTBItem;
    TBExcelReport: TTBSubmenuItem;
    ImageListFirst: TImageList;
    TBItemDesignReport: TTBItem;
    TBItemLastSvid: TTBItem;
    StBar: TStatusBar;
    TBItemAddDok: TTBItem;
    TBItemYear: TTBItem;
    TBItemDelayRegister: TTBItem;
    TBSubmenuPunkts: TTBSubmenuItem;
    TBItemClearPunkts: TTBItem;
    imSeek: TImage;
    ImBtClear: TImage;
    ImBtRun: TImage;
    TBItemIsklOtbor: TTBItem;
    TBSeparatorIskl1: TTBSeparatorItem;
    TBSeparatorIskl2: TTBSeparatorItem;
    TBItemAddOtbor: TTBItem;
    N2: TMenuItem;
    Image1: TImage;
    pmSQL: TMenuItem;
    TBItemSum: TTBItem;
    TBSubmenuGroup: TTBSubmenuItem;
    saveDialog: TSaveDialog;
    TBItemWriteSavedFilter: TTBItem;
    TBDock24: TTBDock;
    TBToolbarMenu24: TTBToolbar;
    TBItemAddDok24: TTBItem;
    TBItemEdit24: TTBItem;
    TBItemDelDok24: TTBItem;
    TBItemPreView24: TTBItem;
    TBItemPrint24: TTBItem;
    TBItemGrantSprav24: TTBItem;
    TBItemExport24: TTBItem;
    TBItemFlt24: TTBItem;
    TBItemRepeatFilter24: TTBItem;
    TBItemClrFlt24: TTBItem;
    TBItemOrder24: TTBItem;
    TBSeparatorItem24_5: TTBSeparatorItem;
    TBSeparatorItem24_6: TTBSeparatorItem;
    TBSeparatorIskl24_1: TTBSeparatorItem;
    TBItemAddOtbor24: TTBItem;
    TBItemIsklOtbor24: TTBItem;
    TBItemWriteSavedFilter24: TTBItem;
    TBSeparatorItem24_8: TTBSeparatorItem;
    TBItemQuery24: TTBItem;
    TBItemGrupOne24: TTBItem;
    TBItemCount24: TTBItem;
    TBItemSum24: TTBItem;
    TBItemRefresh24: TTBItem;
    TBItemSetUpGrid24: TTBItem;
    TBItemDesignReport24: TTBItem;
    TBItemClose24: TTBItem;
    TBExcelReport24: TTBSubmenuItem;
    TBSubmenuTmp24: TTBSubmenuItem;
    TBItemDelayRegister24: TTBItem;
    TBItemPrintGrid24: TTBItem;
    TBSubmenuPunkts24: TTBSubmenuItem;
    TBSubSysFlt24: TTBSubmenuItem;
    TBItemSysFlt24: TTBItem;
    TBSubChoiceFlt24: TTBSubmenuItem;
    TBSubmenuGroup24: TTBSubmenuItem;
    TBSeparatorIskl24_2: TTBSeparatorItem;
    TBItemPokaz24: TTBItem;
    TBItemYear24: TTBItem;
    TBSeparatorItem24_10: TTBSeparatorItem;
    TBItemLastSvid24: TTBItem;
    TBSubItemRun24: TTBSubmenuItem;
    procedure TBItemCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBItemSetUpGridClick(Sender: TObject);
    procedure TBItemRefreshClick(Sender: TObject);
    procedure TBItemEditClick(Sender: TObject);
    procedure TBItemDelDokClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure TBItemPreViewClick(Sender: TObject);
    procedure TBItemPrintClick(Sender: TObject);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure TBItemWhereClick(Sender: TObject);
    procedure TBItemClrFltClick(Sender: TObject);
    function  GridSeekZAGS(var sZAGS:String):String;
    function ChoiceBASE(var nCurID:Integer):String;

    procedure GridTitleBtnClick(Sender: TObject; ACol: Integer;   Column: TColumnEh);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure TBItemSetFilterClick(Sender: TObject);
    procedure TBSubmenuItemFilterClick(Sender: TObject);
    procedure TBItemPrintGridClick(Sender: TObject);
    procedure TBItemOrderClick(Sender: TObject);
    procedure TBItemRepeatFilterClick(Sender: TObject);
    procedure TBItemQueryClick(Sender: TObject);
    procedure TBItemGrupOneClick(Sender: TObject);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure QueryBeforeOpen(DataSet: TDataSet);
    procedure TBItemExportClick(Sender: TObject);
    procedure TBItemCountClick(Sender: TObject);
    procedure TBItemPokazClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure TBItemSysFltClick(Sender: TObject);
    procedure TBItemGrantSpravClick(Sender: TObject);
    procedure TBItemDesignReportClick(Sender: TObject);
    procedure TBItemLastSvidClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure StBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;  const Rect: TRect);
    procedure TBItemAddDokClick(Sender: TObject);
    procedure TBItemYearClick(Sender: TObject);
    procedure TBItemDelayRegisterClick(Sender: TObject);
    procedure TBItemClearPunktsClick(Sender: TObject);
    procedure TBSubmenuPunktsClick(Sender: TObject);
    procedure TBItemIsklOtborClick(Sender: TObject);
    procedure TBItemAddOtborClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure pmSQLClick(Sender: TObject);
    procedure TBItemSumClick(Sender: TObject);
    procedure TBItemWriteSavedFilterClick(Sender: TObject);
  private
    FIdOrgan:String;      // GlobalTask.ParamAsInteger('ID')
    FErrorOpen : Boolean;
    FPokaz : TStringList;
    FKodGurnal: String;
    FArrChangeType : TArrChageType;
    FSourceTable : String;
    FEvents : TUserEvents;
    FTypeEditObj: Integer;
    FFilterInterface: TFilterInterface;
    FOrderList : TFindList;
    FDefCountExport: Integer;  // для ORDER BY
    FCheckGodGurnal:Boolean;
    FCurGodGurnal:Integer;
    FCurBase:Integer;
    FCheckEmptyGurnal:Boolean;
    FSelectionIsSet:Boolean;

    procedure SetKodGurnal(const Value: String);
    procedure CreateEvents( strNameSect : String);
//    procedure AfterConstruction;
    procedure SetTypeEditObj(const Value: Integer);
    procedure SetCurGodGurnal(const Value: Integer);
    procedure SetFilterInterface(const Value: TFilterInterface);
    procedure SetDefCountExport(const Value: Integer);
  public
    AdditiveWhere_for_FilterInterface:Boolean;
    AdditiveWhere_Check:Integer;
    FRegisterNotRequired:Boolean; // доступность установки значения "взаимодействие с ГИС РН не трубуется"
    FUserFilter:Boolean;
    FBookmarkDel:Boolean;  // доступно групповое удаление
    FilterInterface_CurrentSQL:String;
    OpisRnGor : TOpisEdit;    // для районов города Брест  ЖКХ
    FEnableAll:Boolean;
    FCheckDateFiks:Boolean;
    FEnabledUnionFIO:Boolean;
    FUnionFIO:Boolean;
    FEnabledUnionAdres:Boolean;
    FEnabledUnionPasp:Boolean;
    FUnionAdres:Boolean;
    FUnionPasp:Boolean;
    FGurnalZAGS:Boolean;      // журнал документов ЗАГС
    FIDZAGS:Integer;          // ID загса из параметров
    FLenSoato:Integer;
    formChoiceAdres:TfmChoiceAdres;
    //--- только для журналов с людьми  и алфав. книга -----
    FTypeVisibleMens:Integer;
    FRed:Boolean;
    FBlue:Boolean;
    FGreen1:Boolean;
    FGreen2:Boolean;
    FUnderline:Boolean;
    FOldCopyMen:Boolean;
    FRiap:Boolean;
    FFirstID:Boolean;      // =true для алфавитной книги
    FIgnoreCheck:Boolean;  // =true для реестра населения  ( игнорировать невозможность удаления )
    FFilter_Punkt:String;
    FValues_Punkt:String;
    FVisibleBASE : Boolean;
    //--------------------------------------
    FFilterJurnal : TFilterJurnal;
    FEnableWrite : Boolean;
    FDemo : Boolean;
    ExportColumns: TExportColumnList;
    FKeyValues2 : Variant;
    FEventCheckGrid: TNotifyEvent;

    FMaincaption : String;
    FSysFltCaption : String;
    FFltCaption : String;
    FSeekAsQuery : Boolean;
    FSeekAsQuery_Active : Boolean;
    FSeekAsQuery_Ready  : Boolean;
    FSeekEnter:Boolean;
    FFTSFields : String;
    FListPar  : TStringList;
    FNewSQL   : String;
    FRun:Boolean;
    FRunExport:Boolean;
    FInterObj : Boolean;   // разные объекты в журнале
//    FWhere    : String;
    FID       : String;
    FSubType  : String;
    DateFiks  : TDateTime;
    iniGurnal : TSasaIniFile;
    iniLocal  : TSasaIniFile;

    QuestDel   : String;   // запрос на удаление журнала
    QuestDelFlt: String;
    property  DefCountExport : Integer read FDefCountExport write SetDefCountExport;
    property  TypeEditObj : Integer read FTypeEditObj write SetTypeEditObj;
    property  CurGodGurnal : Integer read FCurGodGurnal write SetCurGodGurnal;

    property  KodGurnal : String read FKodGurnal write SetKodGurnal;
    property  FilterInterface : TFilterInterface read FFilterInterface write SetFilterInterface;

    procedure SetCurBase(Value : Integer); virtual;
    function  GetCurBase:Integer;

    function  GetTypeEditObj : Integer; virtual;
    procedure CheckGurnalZAGS;
    function  GetStrSystemFilter(lWhere: Boolean): String;

    function  getYearWhere: String; virtual;
    function  getDefaultAddWhere : String; virtual;
    function  getAdditiveWhere : String; virtual;
    function  getAdditiveFilter  : String; virtual; // д.б. реализовано в наследниках где есть  Query.Filter:=...
    function  setAdditiveFilter  : Boolean; virtual;

    procedure ShowWinQuery;
    procedure WriteToDebug(arr:array of Variant);
    procedure CheckMouseMessage(var Msg: tagMSG; var Handled: Boolean);
    function  SetSysFilter(vPar:Variant):Boolean; virtual;
    procedure SetListParEditForm; virtual;
    procedure SetListParAddForm; virtual;
    procedure SetRole; virtual;
    procedure SaveToIni; virtual;
    procedure LoadFromIni; virtual;
    function  InitGurnal:Boolean; virtual;
    procedure CheckPropertyGridColumns; virtual;
    procedure CheckPropertyUnionFIO;
    procedure CheckPropertyUnionAdres;
    procedure CheckPropertyUnionPasp;

    procedure CheckOper(var s:String);

    procedure CheckExport;
    function  CheckDelete(var strErr : string; var lQuest:Boolean; arr:TArrStrings=nil) : Boolean; virtual;
    function  getID:String; virtual;

    procedure WM_Refresh(var rec:TMsg); message WM_REFRESH;

    procedure CreateSysFlt_GISUN(slPar:TStringList=nil);
    function  IsRegisterGisun : Boolean; virtual;   // разрешена или нет регистрация в ГИС РН

    procedure Event_POLE_GRN_3(Sender: TObject);
    procedure Event_POLE_GRN_2(Sender: TObject);
    procedure Event_POLE_GRN_1(Sender: TObject);
    procedure Event_POLE_GRN_0(Sender: TObject);
    procedure Event_Check_Corr_GRN(Sender: TObject);
    procedure Event_ClearPoleGRN(Sender: TObject);
    function  RunDelete(nCount:Integer):Boolean; virtual;
    procedure Event_RunDelete(Sender: TObject);
    function  ClassDokFromTypeObj:TFormDokument;
    procedure DelayRegister(nType:Integer);
    procedure AddRunDelete;

    function  LoadQuery : Boolean; virtual;

    procedure PrepareMenu; virtual;
    procedure CheckTbItems;
    procedure AfterCheckTbItems; virtual;


    function  IsGurnOchered : Boolean;
    function  IsGurnAdres : Boolean;

    function  GetNameTmpIdTable:String;
    procedure SetQueryDateFiks( dDateFiks : TDateTime; lReopen : Boolean );
    procedure SetQueryParam(p : TParam); virtual;
    function  SetQueryParamDef(p : TParam):Boolean;
    procedure Refresh(lFull : Boolean=false; ID:String=''); virtual;
    procedure FullRefresh(lReopen:Boolean=false; strOrderBy:String=''; ID:String=''); virtual;
    procedure UpdateActions; override;
    procedure AddUpdateActions; virtual;
    procedure GridColumnsGetTypeRast(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetParents(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetPoleGrn(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsPokaz(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetAdres(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure GridColumnsGetNamePunkt(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetRnGor(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetNameUL(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetPribUbil(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetSelRow(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetZAGS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsDOKUMENT(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetSource(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsNumber(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsWorkName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsFamilia(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsDolgName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetBool(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsISKL(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsCANDELETE_FIRST(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsFIRST(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetAdresOwners(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetPasp(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetGES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetID_BASE(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    function SetRunActive:Boolean;
    procedure RestRun(lSet:Boolean);

    procedure AfterConstruction; override;
    procedure BeforeReport; virtual;
    procedure AfterReport; virtual;
    procedure TestFilterSQL(Sender: TObject);
    procedure ClickSetFilter(SenderObj : TObject; Sender: TFindList);
    function  InitFilter( var strErr : String ) : Boolean; virtual;
    procedure SetSearchRangeGurnal;

    procedure BuildMenuChoiceFlt;

    procedure InitOrderBy;
    function  GetBeginSQL : String;
//    function GetNameReport( strID : String) : String; virtual;
    function LoadTemplate( strKod : String) : Boolean;

    function LoadExcelReport(Menu:TTBSubmenuItem; strKod : String) : Boolean;
    function OnUserOper(Oper: TOperItem; FindField: TFindFieldItem; RelItem: TRelItem; FullFieldName, Value1, Value2, OperVal: string; var Expr: string): Boolean;
    procedure OnMenuGroupClick(Sender: TObject);

    function CreateAdditiveWhere(strAddSQL : String) : String;
    procedure AddWhereEvent(Sender:TFilterInterface; SQL:TStringList);

    function ClrFltEnabled:Boolean;
    procedure SetClearFilter(lSet:Boolean);
    function IsDateFiks:Boolean;
    function IsSetFilter:Boolean;
    function CreateAdditiveWhere2Refresh:Boolean;
    function GetCurrentWhere: String;
    function GetBookmark(sl:TStringList):Boolean;
    function BookmarkToFilter(sField:String):Boolean;
    function BookmarkToValues(sField:String; sDelim:String):String;

    function BeforeEdit:Boolean; virtual;

    function FilterChoiceSpr(Spr: TSprItem; Ini: TCustomIniFile; Section: string; AutoSave: Boolean; var Value, ValCaption: string): Boolean;

    procedure SetCaptionGurnal;
    procedure ClickPunkts;
    procedure ClearPunkts;
    procedure OnTemplateMenuClick(Sender: TObject);
    function  RunFuncScript(strFuncName: String; ArrPar : array of Variant; var vResult : Variant): Boolean;
    function  GetProperty(sName:String; vDef:Variant):Variant;
    procedure GridColumnsGetLgotMen(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    function  GetPropertyDef(sName:String; var vVal:Variant):Boolean; virtual;
    function  GetParam(slPar:TStringList; sParam,sDefault: String): String;
    function  CreateIDForTmpTable(slPar:TStringList):Boolean; virtual;

    function IsSetUserFilter:Boolean; virtual;
    procedure BeforeClearFilter; virtual;
    procedure ClearFilter;
    procedure SetQueryFiltered(l:Boolean);
    procedure CheckAddOtbor;

    procedure RunTest; virtual;

    {$IF Defined(ZAGS) or Defined(LAIS) }
    procedure CheckDecl_GurnalUZ(nTypeAkt:Integer; var arr:TarrStrings; tb:TDataSet);
    procedure LoadAkt_GurnalUZ(nTypeAkt:Integer);
    procedure EditAktFromGurnalUZ(nTypeAkt:Integer);
    procedure Renumber_GurnalUZ;
    {$IFEND}

    function IsRecordOkObrab(nType:Integer):Boolean; virtual;
    function GetRecordsForObrab(nType:Integer; sl:TStringList; var sID:String; lCheckFilter:Boolean=true):Boolean;

    procedure CheckMenuSavedFilter(sub:TTBSubmenuItem);
    procedure Event_OpenSavedFilter(Sender: TObject);
    function FiltersSavedDir:String;
    function ReadSavedFilter(sNameFilter:String):Boolean;
    procedure WriteSavedFilter;
    procedure CreateParSavedFilter(sl:TStringList); virtual;
    function ReadParSavedFilter(sl:TStringList):Boolean; virtual;

    procedure VisibleItem(TBItem: TTBCustomItem; lSet:Boolean);
    procedure VisibleItems(arrControls: array of TVarRec; lSet:Boolean);
    procedure EnableItem(TBItem: TTBCustomItem; lSet:Boolean);

    class function EnableOpen : Boolean; virtual;
    procedure CreateForAll;
    constructor Create(Owner : TComponent); override;
    constructor CreateChild;
    procedure CreateParams(var Params: TCreateParams); override;
    destructor Destroy; override;
  end;

  TOrderField = class(TObject)
  public
    Caption   : String;
    Alias     : String;
    FieldName : String;
    TypeField : TFindFieldKinds;
    CaseSensitive : Boolean;
  end;

  TFilterJurnal = class(TObject)
  private
    FArrFlt : TArrValuesFlt;
    FJurnal : TfmGurnal;
    FWhere  : String;
    FOrderList : TList;
    FDefaultOrderBy: String;
    FDefaultWhere: String;
//    FAdditiveWhere: String;
//    procedure SetAdditiveWhere(const Value: String);
  public
    procedure ClearOrders;
    function CountOrders : Integer;
    function GetOrder( I : Integer ) : TOrderField;
    procedure AddOrder( Caption : String; Alias : String; FieldName: String;
                        TypeField : TFindFieldKinds; CaseSensitive : Boolean );
//    property AdditiveWhere : String read FAdditiveWhere write SetAdditiveWhere;
    property DefaultWhere  : String read FDefaultWhere write FDefaultWhere;
    property DefaultOrderBy: String read FDefaultOrderBy write FDefaultOrderBy;

    property Where  : String read FWhere write FWhere;
    property Jurnal : TfmGurnal read FJurnal;
    property ArrFlt : TArrValuesFlt read FArrFlt write FArrFlt;   // не используется
    function GetDefaultWhere : String;
//    function SetFilter : TModalResult;
    procedure AddEl;                                              // не используется

    constructor Create( Jurnal : TfmGurnal);
    destructor Destroy; override;
  end;

  function PropCurGurnal(sName:String; vDef:Variant):Variant;
  function DataSetCurGurnal:TDataSet;

var
  CurGurnal:TfmGurnal;


implementation

uses fMain, dBase, SelLibFr, fmQueryEx, fVisibleMensGurnal, fChoiceNasel, fMyNotify,
     fPrintGrid, fChoicePokaz, uProject, fCallBackQuery,fRunSprav, fShablon,
     {$IFDEF ADD_MENS_PU}
     dDokument,
     {$ENDIF}
     {$IFDEF ADD_ZAH}
       fAktZ,
     {$ENDIF}
     {$IFDEF ADD_OPEKA}
       fZapisOpeka,
     {$ENDIF}
     {$IFDEF ADD_ZAGS}
       fZapisBrak, fZapisRogd, fZapisSmert, fZapisUstOtc,
       {$IFDEF ZAGS} fRastBrak,fZapisUstMat, fZapisChName, {$ENDIF}
     {$ENDIF}
     StrUtils;

{$R *.DFM}


function PropCurGurnal(sName:String; vDef:Variant):Variant;
begin
  if CurGurnal=nil then begin
    Result:=vDef;
  end else begin
    Result:=CurGurnal.GetProperty(sName,vDef);
  end;
end;

function DataSetCurGurnal:TDataSet;
begin
  if CurGurnal=nil then begin
    Result:=nil;
  end else begin
    Result:=CurGurnal.Query;
  end;
end;

function TfmGurnal.RunFuncScript(strFuncName: String; ArrPar : array of Variant; var vResult : Variant): Boolean;
var
  l:Boolean;
begin
  Result:=false;
  if (GlobalTask.Script<>nil) and not FRun then begin
    l:=SetRunActive;
//    FRun:=true;
    try
      Result := GlobalTask.Script.Run(strFuncName,ArrPar,vResult);
    finally
//      FRun := false;
      RestRun(l);
    end;
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmGurnal.OnTemplateMenuClick(Sender: TObject);
var
   Template: TTemplate;
   sFunc:String;
   v:Variant;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      Template:=TTemplate(TComponent(Sender).Tag);
      if Template<>nil then begin
         sFunc:=Template.ScriptName+'_UserForm';
         v:=true;
         RunFuncScript(sFunc,[],v);
         if (v=true) then begin
           fmMain.TemplateInterface.SetSimpleTemplate(Template.FullName);
         end;
//         fmMain.TemplateInterface.SetTemplate(fmMain.TemplateInterface.TemplateDir+Template.TemplateFile,
//         fmMain.TemplateInterface.DefaultDatabaseName, fmMain.TemplateInterface.DefaultScript, Template)
      end;
   end;
end;
//-------------------------------------------------------------------------------
function TfmGurnal.LoadTemplate( strKod : String) : Boolean;
var
  s : String;
  l1,l2,l3,l4 : Boolean;
begin
  l1:=fmMain.TemplateInterface.BuildMenu(Self.Name, TBSubmenuTmp, false, OnTemplateMenuClick);
  s:='';
  {$IFDEF ZAGS}
    s:='_ZAGS';
  {$ENDIF}
  {$IFDEF LAIS}
    s:='_SS';
  {$ENDIF}
  {$IFDEF OCHERED}
    s:='_OCH';
  {$ENDIF}
  {$IFDEF GKH}
    s:='_GKH';
  {$ENDIF}
  {$IFDEF ZAH}
    s:='_ZAH';
  {$ENDIF}
  {$IFDEF POST}
    s:='_POST';
  {$ENDIF}
  if s<>''
    then l2:=fmMain.TemplateInterface.BuildMenu(Self.Name+s, TBSubmenuTmp, false, OnTemplateMenuClick)
    else l2:=false;
  // загрузим для области
  s:='_'+Copy(GlobalTask.ParamAsString('KOD'),1,1);
  l3:=fmMain.TemplateInterface.BuildMenu(Self.Name+s, TBSubmenuTmp, false, OnTemplateMenuClick);
  // загрузим для района
  s:='_'+Copy(GlobalTask.ParamAsString('KOD'),1,4);
  l4:=fmMain.TemplateInterface.BuildMenu(Self.Name+s, TBSubmenuTmp, false, OnTemplateMenuClick);

  if l1 or l2 or l3 or l4 then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

function TfmGurnal.LoadExcelReport(Menu:TTBSubmenuItem; strKod: String): Boolean;
begin
  Result:=BuildExcelMenu(Menu,strKod,true);
end;

procedure TfmGurnal.CreateEvents( strNameSect : String);
var
  s : String;
begin
  FEvents := TUserEvents.Create;
  FEvents.LoadEvents2(strNameSect, TBSubItemRun,true);
  s:='_'+Copy(GlobalTask.ParamAsString('KOD'),1,1);
  FEvents.LoadEvents2(strNameSect+s, TBSubItemRun,false);
  s:=Copy(GlobalTask.ParamAsString('KOD'),1,4);
  FEvents.LoadEvents2(strNameSect+s, TBSubItemRun,false);
//  FEvents := TUserEvents.Create;
//  FEvents.LoadEvents(strNameSect, TBSubItemRun);
  VisibleItem(TBSubItemRun, (TBSubItemRun.Count>0) );
//  TBSubItemRun.Visible:=TBSubItemRun.Count>0;
  if not FEnableWrite then begin
//    TBSubItemRun.Visible := false;
    VisibleItem(TBSubItemRun, false);
  end;
end;

procedure TfmGurnal.GridColumnsPokaz(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
var
  strNameOpis : String;
  te : TTypeEdit;
  Opis : TOpisEdit;
  j : Integer;
  v : Variant;
  cTip, strPokaz, strID : String;
begin
  // POKAZ_<Код показателя>   или   POKAZ_<Поле ID>#<Код показателя>
  strPokaz:=Copy(TDbGridColumnEh(Sender).FieldName,7,50);
  j := Pos('#', strPokaz);
  if j=0 then begin
    strID := 'ID';
  end else begin
    strID := Copy(strPokaz,1,j-1);
    strPokaz:=Copy(strPokaz,j+1,50);
  end;
  v := dmBase.ReadOneProp( DateFiks,
              Query.FieldByName(strID).AsInteger, strPokaz, ftUnknown);
  if v=null then begin
    Params.Text := '';
  end else begin
//    if dmBase.SprProperty.Locate( 'TYPEOBJ;KOD', VarArrayOf([TypeEditObj,strPokaz]), [] ) then begin
    if dmBase.SprProperty.Locate( 'KOD', strPokaz, [] ) then begin
      strNameOpis := Trim(dmBase.SprProperty.FieldByName('OpisEdit').AsString);
      if (dmBase.SprProperty.FieldByName('Tip').AsString<>'M') and
         (strNameOpis<>'') then begin
        te := GetTypeOpisFromName( strNameOpis );
        if te = teList then begin
          Opis := GlobalTask.CurrentOpisEdit.GetListOpisA(strNameOpis);
          Params.Text := Opis.Naim(v, false);
        end else if te = teSpr then begin
          Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA(strNameOpis);
          Params.Text := Opis.Naim(v, false);
        end;
      end else begin
        cTip := dmBase.SprProperty.FieldByName('Tip').AsString;
        if cTip = 'L' then begin
          if v=true then Params.Text:='Да' else Params.Text:='Нет';
        end else if cTip = 'D' then begin
          Params.Text := FormatDateTime('dd.mm.yyyy',VarToDateTime(v))
        end else if cTip = 'N' then begin
          if v=null
           then Params.Text:=''
           else Params.Text := FloatToStr(v);
        end else begin
          Params.Text := VarToStr(v);
        end;
      end;
    end else begin
      if v=null then v:='';
      Params.Text := VarToStr(v);
    end;
  end;
end;

procedure TfmGurnal.GridColumnsGetMR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    Params.Text := dmBase.GetMestoMen(0,Query.FieldByName('ID').AsString, false, 0, nil);
  end;
end;

procedure TfmGurnal.GridColumnsGetSelRow(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  i:Integer;
begin
  if not EditMode then begin
    Params.Text:=' ';
    if Grid.Selection.Rows.Count > 0 then begin
      for i:=0 to Grid.Selection.Rows.Count-1 do begin
        if Query.Bookmark=Grid.Selection.Rows[i] then begin
          Params.Text:=IntToStr(i);
          break;
        end;
      end;
    end;
  end;
end;

procedure TfmGurnal.GridColumnsGetPribUbil(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  ld : TLastDvig;
begin
  if not EditMode then begin
    ld := dmBase.LastDvigMen(Query.FieldByName('DATE_FIKS').AsDateTime,Query.FieldByName('ID').AsString );
    Params.Text := ld.komm ;
  end;
end;

{$IFDEF ZAH}
procedure TfmGurnal.GridColumnsGetAdres(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
end;
{$ELSE}

{$IFDEF OPEKA}
procedure TfmGurnal.GridColumnsGetAdres(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
end;
{$ELSE}
procedure TfmGurnal.GridColumnsGetAdres(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  fld  : TField;
 {$IFDEF OCHERED}
  fldB : TField;
  nBase:Integer;
 {$ENDIF}
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      fld := Query.FindField('DATE_FIKS');
      if (Trim(Params.Text)='0') then begin
        {$IFDEF OCHERED}
          fldB:=Query.FindField('ID_BASE');
          if fldB=nil then nBase:=0 else nBase:=fldB.AsInteger;
          if nBase>0 then begin
            if dmBase.tbMensAdd.Locate('ID',Query.FieldByName('ID').AsInteger,[])
              then Params.Text := dmBase.GetAdresAkt3(dmBase.tbMensAdd,';MR_OBL,MR_B_OBL;MR_RAION,MR_GOROD_RN;MR_GOROD,MR_B_GOROD;MR_ULICA,MR_*',1);
          end else begin
            Params.Text := Trim(dmBase.ReadOneProp(DateFiks, Query.FieldByName('ID').AsInteger,'ADRES_PROP',ftMemo));
            if (Params.Text='') then begin
              if dmBase.tbMensAdd.Locate('ID',Query.FieldByName('ID').AsInteger,[])
                then Params.Text := dmBase.tbMensAdd.FieldByName('TEXT_ADRES').AsString;
            end;
          end;
        {$ELSE}
           Params.Text := Trim(dmBase.ReadOneProp(DateFiks, Query.FieldByName('ID').AsInteger,'ADRES_PROP',ftMemo));
           if (Params.Text='') then begin
             if dmBase.tbMensAdd.Locate('ID',Query.FieldByName('ID').AsInteger,[])
               then Params.Text := dmBase.tbMensAdd.FieldByName('TEXT_ADRES').AsString;
           end;
        {$ENDIF}
      end else begin
        if (Trim(Params.Text)='') or not IsAllDigit(Trim(Params.text)) then begin
//  ОШИБКА !!!    ShowMessage('"'+Query.FieldByName('ID').AsString+'"');
//          ShowMessage('"'+Query.FieldByName('ID').AsString+'"');
        end else begin
          if fld=nil
            then Params.Text := dmBase.AdresFromIDEx(dmBase.GetDateCurrentSost, Params.Text, true, true)
            else Params.Text := dmBase.AdresFromIDEx(Query.FieldByName('DATE_FIKS').AsDateTime, Params.Text, true, true);
        end;
      end;
    end;
  end;
end;
{$ENDIF}
{$ENDIF}

procedure TfmGurnal.GridColumnsGetNamePunkt(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      if dmBase.LookupPunkt.Locate('ID', Query.FieldByName('PUNKT').AsInteger, []) then begin
        Params.Text := dmBase.LookupPunkt.FieldByName('NAME').AsString;
      end;
    end;
  end;
end;

procedure TfmGurnal.GridColumnsGetRnGor(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      if OpisRnGor=nil then begin
       OpisRnGor:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_RNGOR');
      end;
      if OpisRnGor<>nil then begin
        Params.Text := OpisRnGor.Naim(Params.Text);
      end;
    end;
  end;
end;

procedure TfmGurnal.GridColumnsGetNameUL(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      Params.Text := dmBase.getUL(Query.FieldByName('UL').AsInteger);
    end;
  end;
end;

procedure TfmGurnal.GridColumnsGetTypeRast(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
{$IFDEF ZAGS}
  if not EditMode then begin
    if Query.FieldByName('TYPE_RAST').AsInteger=1
      then Params.ImageIndex:=-1
      else Params.ImageIndex:=IL_RESH_SUD;
  end;
{$ENDIF}
end;

procedure TfmGurnal.GridColumnsGetPoleGrn(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  n:Integer;
begin
{$IFDEF GISUN}
  if not EditMode then begin
    n:=Gisun.GetPoleGrn(Query.FieldByName('POLE_GRN'));
    Params.ImageIndex:=n;
    if not IsRegisterGisun
      then Params.ImageIndex:=6;
  end;
{$ENDIF}
end;

procedure TfmGurnal.GridColumnsGetParents(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
//    Query.FieldByName('PA_ID').AsInteger;
//    Query.FieldByName('MA_ID').AsInteger;
    Params.ImageIndex:=0;
  end;
end;

//---------------------------------------------------------------------------------------------------
procedure TfmGurnal.GridColumnsDOKUMENT(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  s,ss : String;
  p :TPassport;
begin
  s:=TColumnEh(Sender).FieldName;
  if s='ON_DOKUMENT' then begin
    try
      with Query do begin
        // 'ON_INENTIF'
        p := dmBase.PasportFromValues(FieldByName('ON_DOK_TYPE').AsInteger,FieldByName('ON_DOK_SERIA').AsString,
                                      FieldByName('ON_DOK_NOMER').AsString,FieldByName('ON_DOKUMENT').AsString,'',
                                      FieldByName('ON_DOK_DATE').AsDateTime);
      end;
      ss := dmBase.PasportToText(p,1);
      if ss<>'' then begin
        Params.Text := ss;
      end else begin
        Params.Text := StringReplace(Params.Text,Chr(10),'',[rfReplaceAll]);
        Params.Text := StringReplace(Params.Text,Chr(13),' ',[rfReplaceAll]);
      end;
    except
    end;
  end else if s='ONA_DOKUMENT' then begin
    try
      with Query do begin
        // 'ONA_INENTIF'
        p := dmBase.PasportFromValues(FieldByName('ONA_DOK_TYPE').AsInteger,FieldByName('ONA_DOK_SERIA').AsString,
                                      FieldByName('ONA_DOK_NOMER').AsString,FieldByName('ONA_DOKUMENT').AsString,'',
                                      FieldByName('ONA_DOK_DATE').Value);
      end;
      ss := dmBase.PasportToText(p,1);
      if ss<>'' then begin
        Params.Text := ss;
      end else begin
        Params.Text := StringReplace(Params.Text,Chr(10),'',[rfReplaceAll]);
        Params.Text := StringReplace(Params.Text,Chr(13),' ',[rfReplaceAll]);
      end;
    except
    end;
  end else if s='DOKUMENT' then begin
    try
      with Query do begin
        // 'ON_INENTIF'
        p := dmBase.PasportFromValues(FieldByName('DOK_TYPE').AsInteger,FieldByName('DOK_SERIA').AsString,
                                      FieldByName('DOK_NOMER').AsString,FieldByName('DOKUMENT').AsString,'',
                                      FieldByName('DOK_DATE').Value);
      end;
      ss := dmBase.PasportToText(p,1);
      if ss<>'' then begin
        Params.Text := ss;
      end else begin
        Params.Text := StringReplace(Params.Text,Chr(10),'',[rfReplaceAll]);
        Params.Text := StringReplace(Params.Text,Chr(13),' ',[rfReplaceAll]);
      end;
    except
    end;
  end else if s='TALON_DOK' then begin
    try
      with Query do begin
        // 'LICH_NOMER'
        p := dmBase.PasportFromValues(FieldByName('PASP_UDOST').AsInteger,FieldByName('PASP_SERIA').AsString,
                                      FieldByName('PASP_NOMER').AsString,FieldByName('PASP_VIDAN').AsString,'',
                                      FieldByName('PASP_DATE').Value);
      end;
      ss := dmBase.PasportToText(p,1);
      if ss<>'' then begin
        Params.Text := ss;
      end else begin
        Params.Text := StringReplace(Params.Text,Chr(10),'',[rfReplaceAll]);
        Params.Text := StringReplace(Params.Text,Chr(13),' ',[rfReplaceAll]);
      end;
    except
    end;
  end else begin

  end
end;

procedure TfmGurnal.GridColumnsGetZAGS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  fld : TField;
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      fld := Query.FindField('NAME_ZAGS');
      if (fld<>nil) and (fld.AsString<>'') then begin
        Params.Text := fld.AsString;
        if FIdZAGS=Query.FieldByName('ID_ZAGS').AsInteger    // ЗАГС мой и введено наименование
          then Params.Background:=clInfoBk;
      end else begin
        if dmBase.SprNames.Locate('ID', Params.Text, []) then begin
          Params.Text := dmBase.SprNames.FieldByName('NAME').AsString;
        end else begin
          {$IFDEF ZAGS}
            if dmBase.SprZAGS.Locate('ID', Params.Text, []) then begin
              Params.Text := dmBase.SprZAGS.FieldByName('NAME').AsString;
            end else begin
              if dmBase.SprSoato.Locate('ID', Params.Text, []) then begin
                Params.Text := dmBase.SprSoato.FieldByName('NAME').AsString;
              end;
            end;
          {$ELSE}
            if dmBase.SprSoato.Locate('ID', Params.Text, []) then begin
              Params.Text := dmBase.SprSoato.FieldByName('NAME').AsString;
            end;
          {$ENDIF}
        end;
      end;
    end;
  end;
end;

procedure TfmGurnal.GridColumnsGetSource(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      if dmBase.SprNames.Locate('ID', Params.Text, []) then begin
        Params.Text := dmBase.SprNames.FieldByName('NAME').AsString;
      end else begin
        {$IFDEF ZAGS}
          if dmBase.SprZAGS.Locate('ID', Params.Text, []) then begin
            Params.Text := dmBase.SprZAGS.FieldByName('NAME').AsString;
          end else begin
            if dmBase.SprSoato.Locate('ID', Params.Text, []) then begin
              Params.Text := dmBase.SprSoato.FieldByName('NAME').AsString;
            end;
          end;
        {$ELSE}
          if dmBase.SprSoato.Locate('ID', Params.Text, []) then begin
            Params.Text := dmBase.SprSoato.FieldByName('NAME').AsString;
          end;
        {$ENDIF}
      end;
    end;
  end;
end;

procedure TfmGurnal.GridColumnsNumber(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  Params.Text := IntToStr(Query.RecNo);
end;

procedure TfmGurnal.GridColumnsGetBool(Sender: TObject; EditMode: Boolean;
          Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      Params.Text := Sender.ClassName;
    end;
  end;
end;

procedure TfmGurnal.GridColumnsWorkName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  d : TDateTime;
  i : Integer;
begin
  if Query.FieldByName('WORK_SPR').AsString='' then begin
    d := Query.FieldByName('DATE_FIKS').AsDateTime;
    if FFirstID
      then i := Query.FieldByName('FIRST').AsInteger
      else i := Query.FieldByName('ID').AsInteger;
    Params.Text := dmBase.ReadOneProp(d, i, 'WORK_NAME', ftMemo);
  end else begin
    if dmBase.SprWork.Locate('ID', Query.FieldByName('WORK_SPR').AsInteger,[]) then begin
      Params.Text := dmBase.SprWork.FieldByName('NAME').AsString;
    end
  end;
end;

procedure TfmGurnal.GridColumnsFamilia(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=Params.Text+' '+Query.FieldByName('Name').AsString+' '+Query.FieldByName('Otch').AsString;
end;

procedure TfmGurnal.GridColumnsDolgName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('DOLG_SPR').AsString='' then begin
    Params.Text := Query.FieldByName('DOLG_NAME').AsString;
  end else begin
    if dmBase.SprDolg.Locate('ID', Query.FieldByName('DOLG_SPR').AsInteger,[]) then begin
      Params.Text := dmBase.SprDolg.FieldByName('NAME').AsString;
    end
  end;
end;

procedure TfmGurnal.TBItemCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGurnal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not FErrorOpen and (iniGurnal<>nil) then SaveToIni;
{
  try
    TmpQuery.AdsCloseSQLStatement;
    TmpQuery.SQL.Text:='drop table '+GetNameTmpIdTable;
    TmpQuery.ExecSQL;
  except
  end;
}  
  CanClose:=true;
  FRun:=true;
end;

procedure TfmGurnal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;   
  FRun:=true;
//  if Caption = Trade_Caption then GurnalTrade:=nil;
end;

procedure TfmGurnal.TBItemSetUpGridClick(Sender: TObject);
begin
  SetUpGrid(Grid,'',true);
end;
//--------------------------------------------------------
procedure TfmGurnal.SetRole;
begin
  if Role.SystemAdmin  then begin
    N2.Visible:=true;
    pmSQL.Visible:=true;
    VisibleItem(TBItemSetUpGrid, true);
    VisibleItem(TBItemDesignReport, true);
//    TBItemSetUpGrid.Visible:=true;
//    TBItemDesignReport.Visible:=true;
  end else begin
    N2.Visible:=false;
    pmSQL.Visible:=false;
    VisibleItem(TBItemSetUpGrid, false);
    VisibleItem(TBItemDesignReport, false);
//    TBItemSetUpGrid.Visible:=false;
//    TBItemDesignReport.Visible:=false;
  end;
//  if not FEnableWrite then begin
//    TBItemDelDok.Enabled := false;
//  end;

//  TBItemSetUpGrid.Visible:=Role.Enabled(toConfig);
//  TBItemWhere.Visible:=Role.Enabled(toConfig);
end;
//--------------------------------------------------------
function TfmGurnal.InitGurnal:Boolean;
begin
  CreateEvents(KodGurnal);
//  AddRunDelete;
  Result:=true;
end;
//--------------------------------------------------------
procedure TfmGurnal.SaveToIni;
var
  i,j : Integer;
  s : String;
begin
  if iniLocal<>nil then begin
    iniLocal.EraseSection(KodGurnal+'.VISIBLE_POKAZ');
    for j:=0 to FPokaz.Count-1 do begin             
      if Integer(FPokaz.Objects[j])=1 then begin
        iniLocal.WriteString(KodGurnal+'.VISIBLE_POKAZ',FPokaz.Names[j],'1');
      end;
    end;
    CompToIni(Self,iniLocal,KodGurnal,GlobalTask.PropForm,true);  // было 'GURNAL'   Work\Local.ini - локальный
    if Role.SystemAdmin then begin
//    if Role.Status = rsAdmin then begin
   //!!!   Grid.SaveToIni( GlobalTask.iniFile('GURNAL'),KodGurnal+'.Grid',true);

      Grid.SaveToIni( iniGurnal, KodGurnal+'.Grid',true); // !!!
      iniGurnal.UpdateFile;

      Grid.SaveLayoutToIni(iniLocal,KodGurnal+'.Grid'); // !!!  Work\Local.ini - локальный
    end else begin
// было  29.10.2018    Grid.SaveLayoutToIni(GlobalTask.iniFile('GURNAL'),KodGurnal+'.Grid');
      Grid.SaveLayoutToIni(iniLocal,KodGurnal+'.Grid'); // !!!  Work\Local.ini - локальный
    end;
    s:='';
    if ExportColumns<>nil then begin
      for i:=0 to ExportColumns.Count-1 do begin
        if ExportColumns[i].Visible then begin
          s := s + IntToStr(i) + ',';
        end;
      end;
    end;
    iniLocal.WriteString(KodGurnal+'.Add','EXPORTCOLUMNS',s);

    iniLocal.UpdateFile;
  end;
  if (TypeEditObj = dmBase.TypeObj_Nasel) or (TypeEditObj = dmBase.TypeObj_Lich) then begin
    GlobalTask.SetLastValueAsInteger(KodGurnal+'_TYPEVISIBLEMENS',FTypeVisibleMens);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_RED',FRed);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_BLUE',FBlue);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_GREEN1',FGreen1);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_GREEN2',FGreen2);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_UNDERLINE',FUnderline);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_OLDCOPYMEN',FOldCopyMen);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_RIAP',FRiap);
  end;
end;
//--------------------------------------------------------
procedure TfmGurnal.LoadFromIni;
var
//  ini : TSasaIniFile;
  lUpdateCol:Boolean;
//  n:Cardinal;
begin
// было 29.10.2018  CompFromIni(Self,GlobalTask.IniFile('GURNAL'),KodGurnal,GlobalTask.PropForm);
//n:=GetTickCount;
  CompFromIni(Self,IniLocal,KodGurnal,GlobalTask.PropForm);  // !!!  Work\Local.ini - локальный
  if (Self.WindowState=wsNormal) then begin
    if (Self.Left<1) or (Self.Left>600) then Self.Left:=5;
    if (Self.Top<1) or (Self.Top>300) then Self.Top:=5;
    if (Self.Width<300) then Self.Width:=300;
    if (Self.Height<300) then Self.Height:=300;
  end;

//  Grid.LoadFromIni( GlobalTask.iniFile('GURNAL'),KodGurnal+'.Grid');
  Grid.LoadFromIni( iniGurnal, KodGurnal+'.Grid');

  lUpdateCol:=iniGurnal.ReadBool('ADD', 'UPDATE_COL',false);
  if lUpdateCol then begin    // !!! необходимо обновление граф журнала без чтения локально сохраненных значений !!!
    iniGurnal.WriteBool('ADD', 'UPDATE_COL', false);
    iniGurnal.UpdateFile;
    GlobalTask.WriteToLogFile('Обновление граф журнала: '+KodGurnal);
  end else begin
    Grid.LoadLayoutFromIni(iniLocal, KodGurnal+'.Grid'); // !!!  Work\Local.ini - локальный
  end;

  if not (dgAlwaysShowSelection in Grid.Options) then begin
    Grid.Options := Grid.Options + [dgAlwaysShowSelection]
  end;
  if not (dgColumnResize in Grid.Options) then begin
    Grid.Options := Grid.Options + [dgColumnResize]
  end;
  Grid.DrawMemoText:=true;
  CheckPropertyGridColumns;
  SetOptionsGrid(Grid, Self, true);

//  AddNotifyProg(fmMain, INttoStr(GetTickCount-n), false, true,0,0);

//  if dmBase.AdsConnection.Username='ADSSYS'
//    then dmbase.AdsConnection.Execute('EXECUTE PROCEDURE sp_EnableQueryLogging(''QueryLog'', false, false, 0, '''');');

end;
//--------------------------------------------------------------------
function TfmGurnal.LoadQuery : Boolean;
var
//  strFields,strFrom,strWhere,strWhereAll,strWhereUser,
  strSect,strFilter,strFrom,s,ss,strPokaz : String;
  strKod,strTip,strP : String;
  i,j,m : Integer;
  sl : TStringList;
  arr : TArrStrings;
  lCS,lAdd : Boolean;
  nCheckOrder:Integer;
  sTypeOrder:String;
  ini:TSasaIniFile;
begin
  Result:=InitGurnal;
  if not Result then exit;
  FCheckGodGurnal:=false;
  FCheckEmptyGurnal:=false;
  FSelectionIsSet:=false;
  FCurGodGurnal:=-1;
  FNewSQL:='';
  strKod := KodGurnal;
  FOrderList     := nil;
  SetLength(FArrChangeType,0);
  if iniGurnal=nil then begin
    try
      iniGurnal := TSasaIniFile.Create(GlobalTask.PathService+KodGurnal+'.ini');
    except
      Result:=false;
      PutError(' Ошибка загрузки файла описания журналов. ',self);
    end;
  end;
  if iniLocal=nil
    then iniLocal:=GlobalTask.iniFile('LOCAL');
  //---------------------------------------
  strSect := 'FIELDS_ORDERBY';
  sl := TStringList.Create;
  iniGurnal.ReadSectionValues(strSect,sl);
  for i:=0 to sl.Count-1 do begin
    s  := Trim(sl.Names[i]);
    ss := sl.Values[sl.Names[i]];
    j:=Pos('.',s);
    lAdd:=true;
    {$IFDEF OCHERED}
      if IsGurnOchered then begin
        if dmBase.OblBase  then begin
          if (Copy(s,1,2)='a.') or (Copy(s,1,2)='u.')
            then lAdd:=false;
        end else begin
          if Pos('SOATO', ANSIUpperCase(s))>0
            then lAdd:=false;
        end;
      end;
    {$ELSE}
      if IsGurnOchered then begin
        if Pos('SOATO', ANSIUpperCase(s))>0
          then lAdd:=false;
      end;
    {$ENDIF}
    if lAdd then begin
      if j > 0 then begin
        StrToArr(ss,arr,',',false);   // 0-Caption 1-FieldType 2-CS
        if Length(arr)>2 then begin
          lCS := (ANSIUpperCase(Copy(arr[2],1,1))='T');
          FFilterJurnal.AddOrder(Trim(arr[0]), Copy(s,1,j-1), Copy(s,j+1,100),
                    GetKindFromString(arr[1]), lCS);
        end else begin
          PutError(' Ошибка чтения описания полей для ORDER BY ',self);
        end;
      end else begin
        StrToArr(ss,arr,',',false);   // 0-Caption 1-FieldType 2-CS
        if Length(arr)>2 then begin
          lCS := (ANSIUpperCase(Copy(arr[2],1,1))='T');
          FFilterJurnal.AddOrder(Trim(arr[0]), '', s,
                    GetKindFromString(arr[1]), lCS);
        end else begin
          PutError(' Ошибка чтения описания полей для ORDER BY ',self);
        end;
  //      PutError(' Ошибка чтения описания полей для ORDER BY ');
      end;
    end;
  end;
  InitOrderBy;
  FFilterJurnal.DefaultWhere   := '';
//  FFilterJurnal.AdditiveWhere  := '';
  FFilterJurnal.DefaultOrderBy := '';

  if (TypeEditObj = dmBase.TypeObj_Nasel) or (TypeEditObj = dmBase.TypeObj_Lich) then begin
    FTypeVisibleMens:=GlobalTask.GetLastValueAsInteger(KodGurnal+'_TYPEVISIBLEMENS');
    FRed:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_RED');
    FBlue:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_BLUE');
    FGreen1:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_GREEN1');
    FGreen2:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_GREEN2');
    FUnderline:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_UNDERLINE');
    FOldCopyMen:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_OLDCOPYMEN');
    FRiap:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_RIAP');
  end;

  //---------------------------------------
  strSect := 'QUERY';
  sl.Free;
//  FWhere := '';
  if Result then begin
    sl := TStringList.Create;
    Query.DatabaseName:=GlobalTask.MainDataBaseName;
    iniGurnal.ReadSectionValues(strSect,sl);
    for i:=0 to sl.Count-1 do begin
      if Copy(sl.Names[i],1,3)='SQL' then begin
        s := Trim(sl.ValueFromIndex[i]);
        if Copy(sl.Names[i],4,1)='_' then begin
          ss:=Trim(Copy(sl.Names[i],5,20));
          //---- !!!  если строка не для текущей программы, то игнорируем ее !!! -------
          if ss<>fmMain.IDProg
            then s:='';
          //----------------------------------------------------------------------------
        end;
        if s<>'' then begin
          if Copy(s,1,1)='"'   then s:=Copy(s,2,Length(s));
          if RightStr(s,1)='"' then s:=Copy(s,1,Length(s)-1);
          s:=Trim(s);
          {$IFDEF OCHERED}
            if dmBase.OblBase and IsGurnOchered then begin
              if Pos('LEFT JOIN БАЗАДОМОВ', ANSIUpperCase(s))>0 then begin
                s:='';
              end;
              if Pos('LEFT JOIN СПРУЛИЦ', ANSIUpperCase(s))>0 then begin
                s:='';
              end;
            end;
          {$ELSE}
//            if IsGurnOchered then begin
//              if Pos('LEFT JOIN НАСЕЛЕНИЕ N', ANSIUpperCase(s))>0 then begin
//                s:=s+' and n.date_fiks='+QStr(CURRENT_SOST);
//              end;
//            end;
          {$ENDIF}
          if s<>'' then begin
            Query.SQL.Add(s);
            j:=Pos('WHERE', ANSIUpperCase(s));
            if j > 0 then begin
              s:=Copy(s,j+5,Length(s));
//          FWhere := s;
              FFilterJurnal.DefaultWhere := s;
            end;
            j:=Pos('ORDER BY', ANSIUpperCase(s));
            if j>0 then begin
              s:=Copy(s,j+8,Length(s));
              FFilterJurnal.DefaultOrderBy := s;
            end;
          end;
        end;
      end;
    end;
    sl.Free;
    strFrom := iniGurnal.ReadString(strSect,'TABLENAME','');
    nCheckOrder:=iniGurnal.ReadInteger(strSect,'CHECK_ORDER',0);

    FCheckEmptyGurnal:=iniGurnal.ReadBool(strSect,'CHECK_EMPTY',false);  // !!!
    FCheckGodGurnal:=false;
    {$IFDEF ZAGS}
      FCheckGodGurnal:=GlobalTask.ParamAsBoolean('CHECK_GOD'); // в параметрах загса установлен параметр CHECK_GOD=true
      if FCheckGodGurnal then begin
        // для журнала доступна установка "года"
        if Pos(IntToStr(TypeEditObj), ';'+GlobalTask.ParamAsString('CHECK_GOD_V')+';')>0 then begin
          FCurGodGurnal:=fmMain.YearFiks;
          if FCurGodGurnal=1 then FCurGodGurnal:=YearOf(Date);
          if FCurGodGurnal=0 then
            FCheckGodGurnal:=false;
        end else begin
          FCheckGodGurnal:=false;
        end;
      end;
      {
      if FFilterJurnal.DefaultWhere=''
        then  FFilterJurnal.DefaultWhere:=getYearWhere
        else  FFilterJurnal.DefaultWhere:=FFilterJurnal.DefaultWhere+'('+getYearWhere+')';
      }
    {$ELSE}

    {$ENDIF}
    VisibleItem(TBItemYear, false);
//    TBItemYear.Visible:=false;

    if (strFrom <> '') and (nCheckOrder>0) then begin
    // !!!  CheckOrderBy(KodGurnal:String,nCheckOrder:Integer,var SQL:String):Boolean; virtual;
      if IsGurnAdres then begin
        j:=GlobalTask.ParamAsInteger('CH_ADRES');
        // если j=0 сортировка по коду
        if j=1 then begin
          FFilterJurnal.DefaultOrderBy:=StringReplace(FFilterJurnal.DefaultOrderBy, 'a.punkt', 'p.nomer',[]);
          Query.SQL.Text:=ChangeOrderBy(Query.SQL.Text, FFilterJurnal.DefaultOrderBy);
        end;
      end else if nCheckOrder=1 then begin
        sTypeOrder:=GlobalTask.ParamAsString('GURNAL_DATEIZM'); // KEY_SORT_GURN (0-Год+Номер 1-Дата изменения 2-Дата+Номер)
        if sTypeOrder='0' then begin            // год + номер
//          if FCheckGodGurnal then begin
//            Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, 'nomer DESC');
//            FFilterJurnal.DefaultOrderBy := 'nomer DESC';
//          end;
        end else if sTypeOrder='1' then begin   // дата изменения
          Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, 'dateizm desc');
          FFilterJurnal.DefaultOrderBy := 'dateizm DESC';
        end else if sTypeOrder='2' then begin   // дата записи + номер записи
          Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, 'datez desc, nomer desc');
          FFilterJurnal.DefaultOrderBy := 'datez desc, nomer desc';
        end;
      end else if nCheckOrder=2 then begin
        if IsGurnOchered then begin
          sTypeOrder:=GlobalTask.ParamAsString('OCHERED_ORDER');
          //0=номер в очереди
          //1=дата заявления
          //2=фамилия
          if (sTypeOrder='0') or (sTypeOrder='') then begin

          end else begin
            if sTypeOrder='1' then begin
              FFilterJurnal.DefaultOrderBy := 'dec_date DESC';
              Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, FFilterJurnal.DefaultOrderBy);
            end else if sTypeOrder='2' then begin
              FFilterJurnal.DefaultOrderBy := 'n.familia';
              Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, FFilterJurnal.DefaultOrderBy);
            end else if sTypeOrder='3' then begin
              FFilterJurnal.DefaultOrderBy := 'oc.n_delo';
              Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, FFilterJurnal.DefaultOrderBy);
            end;
          end;
        end;
      end;
    end;
    // поля для полнотекстового поиска
    FFTSFields:=iniGurnal.ReadString(strSect,'FTS_FIELDS','');

    strFilter  := iniGurnal.ReadString(strSect,'FILTER','');
//    s := iniGurnal.ReadString(strSect,'ADDITIVE_WHERE','');
//    CharDel(s,'"');
//    FFilterJurnal.AdditiveWhere  := s;

    s:=CreateAdditiveWhere(getAdditiveWhere);
//    WriteToDebug([s]);
//    WriteToDebug([Query.SQL.Text,'---']);
    if s<>'' then begin
      Query.SQL.Text := ChangeWhere(Query.SQL.Text, s, false);
    end;
//    WriteToDebug([Query.SQL.Text,'---']);

    FID := iniGurnal.ReadString(strSect,'ID','ID');

    iniGurnal.ReadSectionValues('ENABLE_POKAZ',FPokaz);
    if FPokaz.Count>0 then begin
      strPokaz:='';
      for j:=0 to FPokaz.Count-1 do begin
        FPokaz.Objects[j] := Pointer(0);
        m := Pos('#', FPokaz.Names[j]);
        if m=0 then begin
          s :=FPokaz.Names[j];
        end else begin
          s := Copy(FPokaz.Names[j],m+1,50);
        end;
//        if dmBase.SprProperty.Locate( 'TYPEOBJ;KOD', VarArrayOf([TypeEditObj,s]), [] ) then begin
        strP:='';
        if dmBase.SprProperty.Locate( 'KOD', s, [] ) then begin
          strTip := Trim(dmBase.SprProperty.FieldByName('Tip').AsString);
          if (dmBase.SprProperty.FieldByName('OpisEdit').AsString<>'') then begin
            strP := ','+QStr('')+' POKAZ_';
          end else if (strTip='I') or (strTip='N') then begin
            strP := ',0 POKAZ_';
          end else begin
            strP := ','+QStr('')+' POKAZ_';
          end;
        end;
        if strP<>''
          then strPokaz := strPokaz + strP + FPokaz.Names[j];
      end;
      Query.SQL.Text := StringReplace(Query.SQL.Text,'&POKAZ&',strPokaz,[rfReplaceAll]);
      sl := TStringList.Create;

      ini:=GlobalTask.iniFile('LOCAL');
      ini.ReadSectionValues(KodGurnal+'.VISIBLE_POKAZ',sl);
      for i:=0 to sl.Count-1 do begin
        s  := Trim(sl.Names[i]);
        ss := sl.Values[sl.Names[i]];
        if ss='1' then begin   // показатель доступен
          for j:=0 to FPokaz.Count-1 do begin
            if FPokaz.Names[j]=s then begin
              FPokaz.Objects[j] := Pointer(1);
            end;
          end;
        end;
      end;
      sl.Free;
    end;
    {
    strFields  := iniGurnal.ReadString(strKod,'FIELDS','ID,TYPEDOK,DATED');
    strWhere   := iniGurnal.ReadString(strKod,'WHERE','');
    strWhereAll:= iniGurnal.ReadString(strKod,'WHERE_ALL','');
    strWhereUser:= iniGurnal.ReadString(strKod,'WHERE_'+GlobalTask.UserID,'');
    }

    FSourceTable := '';
    if strFrom<>'' then begin
      FSourceTable := strFrom;
    end;
  //  Query.ReadOnly :=true;

    try
      TmpQuery.SQL.Add('try DROP TABLE '+GetNameTmpIdTable+'; catch all end;');
      TmpQuery.SQL.Add('try CREATE TABLE '+GetNameTmpIdTable+' (ID Integer, KOLVO Integer); catch all end;');
      TmpQuery.SQL.Add('DELETE FROM '+GetNameTmpIdTable+';');
      TmpQuery.ExecSQL;
    except
      on E:Exception do begin
        PutError('Ошибка создания временной таблицы: '+#13+E.Message,self);
      end;
    end;

    try

      if FFilterJurnal.GetDefaultWhere<>FFilterJurnal.DefaultWhere then begin
        Query.SQL.Text := ChangeWhere(Query.SQL.Text, FFilterJurnal.GetDefaultWhere, false);
      end;
//      MemoWrite('last.sql',Query.SQL.Text);
      SetQueryDateFiks( DateFiks, true );  // !!! выполняется Query.Open !!!

      if strFilter<>'' then begin
        Query.Filter:=strFilter;
        Query.Filtered:=true;
      end;

    except
      on E:Exception do begin
        Result := false;
        FErrorOpen:=true;
        Screen.Cursor := crDefault;
        Query.Close;
        PutError(E.Message,self);
        GlobalTask.WriteToLogFile('Журнал '+KodGurnal+', Ошибка открытия запроса: '+E.Message+chr(13)+chr(10)+Query.SQL.Text);
      end;
    end;
    SetCaptionGurnal;
    if Result
      then GlobalTask.WriteToLogFile('Открытие журнала '+KodGurnal+' ('+Caption+')');
  end;
end;
//------------------------------------------------------------------------------
procedure TfmGurnal.PrepareMenu;
begin
  CheckTbItems;
end;
//--------------------------------------------------------
procedure TfmGurnal.AfterCheckTbItems;
begin
//
end;
//--------------------------------------------------------
procedure TfmGurnal.CheckTbItems;
var
  s:String;
  i,j,m:Integer;
  item:TTBCustomItem;
  sm:TTBSubmenuItem;
//  n:INteger;
begin
  if not EnabledMenu24 then begin
    TBDock.Visible:=true;
    TBDock24.Visible:=false;
    Application.ProcessMessages;
    exit;
  end;
//  n:=GetTickCount;
  TBDock.BeginUpdate;
  TBDock24.BeginUpdate;
  TBToolbarMenu24.BeginUpdate;
  for i:=0 to TBToolbarMenu.Items.Count-1 do begin
    item:=TBToolbarMenu.Items[i];
    s:=TBToolbarMenu.Items[i].Name+'24';
    for j:=0 to TBToolbarMenu24.Items.Count-1 do begin
      if MySameText(s, TBToolbarMenu24.Items[j].Name ) then begin
        if TBToolbarMenu24.Items[j].Visible<>item.Visible
          then TBToolbarMenu24.Items[j].Visible:=item.Visible;
        if TBToolbarMenu24.Items[j].Enabled<>item.Enabled
          then TBToolbarMenu24.Items[j].Enabled:=item.Enabled;
        TBToolbarMenu24.Items[j].Hint:=item.Hint;
        TBToolbarMenu24.Items[j].OnClick:=item.OnClick;
        TBToolbarMenu24.Items[j].Tag:=Integer(Pointer(item));
        item.Tag:=Integer(Pointer(TBToolbarMenu24.Items[j]));
        if item is TTBSubmenuItem then begin
          sm:=TTBSubmenuItem(item);
          for m:=0 to sm.Count-1 do begin
            if sm.Items[m].Images=nil
              then sm.Items[m].Images:=sm.Images;
          end;

          TTBSubmenuItem(TBToolbarMenu24.Items[j]).LinkSubitems:=item; // Clear;
          {
          TTBSubmenuItem(TBToolbarMenu24.Items[j]).:=
          for m:=0 to sm.Count-1 do begin
            TTBSubmenuItem(TBToolbarMenu24.Items[j]).Add(sm.Items[m]);
          end;
          }
          {
  TbItemVerno := TTbItem.Create(TBSubmenuRun);
  TbItemVerno.Caption:='Запись верна';
  TbItemVerno.OnClick:=Event_TrueAkt;
  TBSubmenuRun.Add(TbItemVerno);
          }
        end;
      end;
    end;
  end;
  AfterCheckTbItems;
  TBToolbarMenu24.EndUpdate;
  if Menu24(2) then begin
    TBDock24.Visible:=true;
    TBDock.Visible:=false;
  end else begin
    TBDock24.Visible:=false;
    TBDock.Visible:=true;
  end;

  TBDock.EndUpdate;
  TBDock24.EndUpdate;
  Application.ProcessMessages;
//  Showmessage(inttostr(GetTickCount-n));
end;
//-------------------------------------------
procedure TfmGurnal.VisibleItem(TBItem: TTBCustomItem; lSet:Boolean);
begin
  TBItem.Visible:=lSet;
  if (TBItem.Tag>0)
    then TTBCustomItem(TBItem.Tag).Visible:=lSet;
end;
//------------------------------------------
procedure TfmGurnal.VisibleItems(arrControls: array of TVarRec; lSet:Boolean);
var
  i : Integer;
begin
  for i:=Low(arrControls) to High(arrControls) do begin
    with arrControls[i] do begin
      if VObject is TTBCustomItem
        then TTBCustomItem(VObject).Visible:=lSet;
    end;
  end;
end;
//-------------------------------------------
procedure TfmGurnal.EnableItem(TBItem: TTBCustomItem; lSet:Boolean);
begin
  TBItem.Enabled:=lSet;
  if (TBItem.Tag>0)
    then TTBCustomItem(TBItem.Tag).Enabled:=lSet;
end;                
//--------------------------------------------------------
procedure TfmGurnal.CheckOper(var s:String);
var
  ss:String;
//  n:Integer;
begin
  s:=Trim(s);
  ss:=ANSIUpperCase(s);
  if Copy(ss,1,6)='БОЛЬШЕ' then begin
    s:='>'+Trim(Copy(s,7,Length(s)));
  end else if Copy(ss,1,6)='МЕНЬШЕ' then begin
    s:='<'+Trim(Copy(s,7,Length(s)));
  end else if (Copy(ss,1,5)='РАВНО') or (Copy(ss,1,5)='РАВЕН') then begin
    s:='='+Trim(Copy(s,6,Length(s)));
  end;
end;

//-------------------------------------------------------------
procedure TfmGurnal.CheckPropertyGridColumns;
var
  i,j : Integer;
  sField,sPokaz:String;
begin

//      p := dmBase.PasportFromValues(tbDOK_TYPE.AsInteger, tbDOK_SERIA.AsString, tbDOK_NOMER.AsString,
//                           tbDOK_NAME.AsString, '', tbDOK_DATE.Value);
//      pasp:=dmBase.PasportMen(dateFiks,tbHouseOwnersHistKOD.AsString);
//      tbHouseOwnersHistPASSPORT.AsString:=dmBase.PasportToText(pasp,0);


  for i:=0 to Grid.Columns.Count-1 do begin
    sField:=UpperCase(Grid.Columns[i].FieldName);
    if (sField='ADRES_ID') or (sField='NEW_ADRES_ID') then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetAdres;  //!!!
    end else if sField='ID_BASE' then begin    //
      {$IFDEF GKH}
        if dmBase.IsMainBase and dmBase.IsDistributeBase then begin
          Grid.Columns[i].Visible:=true;
          Grid.Columns[i].OnGetCellParams := GridColumnsGetGES;
        end else begin
          Grid.Columns[i].Visible:=false;
        end;
      {$ELSE}
//        {$IFDEF OCHERED}
//          Grid.Columns[i].Visible:=FVisibleBASE;
//          Grid.Columns[i].OnGetCellParams := GridColumnsGetID_BASE;   устанавливается в fGurnOchered
//        {$ELSE}
          Grid.Columns[i].Visible:=false;
//        {$ENDIF}
      {$ENDIF}
    end else if sField='ADRES_OWNERS' then begin    // собственники
      Grid.Columns[i].OnGetCellParams := GridColumnsGetAdresOwners;
    end else if sField='UNION_PASP' then begin    // док. удост. личность
      Grid.Columns[i].OnGetCellParams := GridColumnsGetPasp;
    end else if sField='PUNKT' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetNamePunkt;
    end else if sField='RNGOR' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetRnGor;
    end else if sField='WORK_SPR' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsWorkName;
    end else if sField='DOLG_SPR' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsDolgName;
    end else if sField='UL' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetNameUL;
    end else if sField='MEN_PRIB_UBIL' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetPribUbil;
    end else if (sField='MEN_MR') or (sField='MR_GOROD') then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetMR;
    end else if Grid.Columns[i].FieldName='N_ISKL' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsISKL;
      Grid.Columns[i].ImageList:=ImageListISKL;
    end else if Grid.Columns[i].FieldName='NFIRST' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsFIRST;
      Grid.Columns[i].ImageList:=ImageListFirst;
    end else if Grid.Columns[i].FieldName='CANDELETE_FIRST' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsCANDELETE_FIRST;
      Grid.Columns[i].ImageList:=ImageListISKL;
{    end else if sField='SEL_ROW' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetSelRow; }
    end else if sField='POLE_GRN' then begin
      {$IFDEF GISUN}
         Grid.Columns[i].Visible := IsActiveGISUN;
         if Grid.Columns[i].Visible then begin
           Grid.Columns[i].Title.Caption:=_GIS_;
           Grid.Columns[i].ImageList:=ImageListGisun;
           Grid.Columns[i].OnGetCellParams := GridColumnsGetPoleGrn;
         end;
      {$ELSE}
         Grid.Columns[i].Visible := false;
      {$ENDIF}
    end else if sField='POLE_M_P' then begin   // поле для вывода картинки с мамой и папой
       Grid.Columns[i].ImageList:=ImageParent;
       Grid.Columns[i].OnGetCellParams := GridColumnsGetParents;
    end else if sField='ID_ZAGS' then begin
      {$IFDEF ZAGS}
        Grid.Columns[i].Visible := true;
        Grid.Columns[i].OnGetCellParams := GridColumnsGetZAGS;
        Grid.Columns[i].Title.Caption := 'Орган регистрации';
      {$ELSE}
        Grid.Columns[i].Visible := false;
      {$ENDIF}
    end else if sField='ID_SOURCE' then begin
      {$IFDEF ZAGS}
        if dmBase.GetTypeZags=ZAGS_OBL_ARXIV then begin
          Grid.Columns[i].Visible := true;
          Grid.Columns[i].Title.Caption := 'Откуда загружено';
          Grid.Columns[i].OnGetCellParams := GridColumnsGetSource;
        end else begin
          Grid.Columns[i].Visible := false;
        end;
      {$ELSE}
        Grid.Columns[i].Visible := false;
      {$ENDIF}
    {
    end else if sField='TYPE_RAST' then begin
       if Grid.Columns[i].Visible then begin
         Grid.Columns[i].ImageList:=fmMain.ImageList;
         Grid.Columns[i].OnGetCellParams:=GridColumnsGetTypeRast;
       end;
       }
    end else if sField='REC_NUMBER' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsNumber;
    end else if Copy(sField,1,6)='POKAZ_' then begin
      sPokaz:=Copy(Grid.Columns[i].FieldName,7,50);
      try
        j:=FPokaz.IndexOfName(sPokaz);
        if j > -1 then begin
          if Integer(FPokaz.Objects[j])=1 then begin
            Grid.Columns[i].Title.Caption := FPokaz.ValueFromIndex[j];
            Grid.Columns[i].Visible := true;
            Grid.Columns[i].OnGetCellParams := GridColumnsPokaz;
            if Grid.Columns[i].Width<60 then Grid.Columns[i].Width:=60;
          end else begin
            Grid.Columns[i].Visible := false;
            Grid.Columns[i].OnGetCellParams := nil;
          end;
        end else begin
          Grid.Columns[i].Visible := false;
          Grid.Columns[i].OnGetCellParams := nil;
        end;
      except
        Grid.Columns[i].Visible := false;
        Grid.Columns[i].OnGetCellParams := nil;
      end;
    end else if Grid.Columns[i].Field.DataType=ftTime then begin
      Grid.Columns[i].DisplayFormat:='hh:mm';
    end else if Grid.Columns[i].Field.DataType=ftDateTime	then begin
      Grid.Columns[i].DisplayFormat:='dd.mm.yyyy hh:mm';
    end else begin
      if Assigned(FEventCheckGrid)
        then  FEventCheckGrid(Grid.Columns[i]);
    end;
  end;

  CheckExport;
end;

//----------------------------------------------------------------
procedure TfmGurnal.CheckPropertyUnionFIO;
var
  col:TColumnEh;
begin
  if FEnabledUnionFIO then begin
    col:=Grid.FieldColumns['FAMILIA'];
    if col<>nil then begin
      if FUnionFIO then begin
        col.OnGetCellParams := GridColumnsFamilia;
        col.Title.Caption:='Фамилия Имя Отчество';
//        col.Width:=GetTextWidth('', Grid.Font.Size, Grid.Font.Name, false);
//        col.Width:=GetTextWidth('Абрурахивов Мухамед Ибрагимович ЧЧЧЧ', Grid.Font.Size, Grid.Font.Name, true);
        col.Width:=250; //GetTextWidth('Абрурахивов Мухамед Ибрагимович ччч', col.Font.Size, col.Font.Name, false);
        Grid.FieldColumns['NAME'].Visible:=false;
        Grid.FieldColumns['OTCH'].Visible:=false;
      end else begin
        col.OnGetCellParams := nil;
        Grid.FieldColumns['FAMILIA'].Width:=Grid.FieldColumns['OTCH'].Width;
        col.Title.Caption:='Фамилия';
        Grid.FieldColumns['NAME'].Visible:=true;
        Grid.FieldColumns['OTCH'].Visible:=true;
      end;
    end;
  end;
end;
//----------------------------------------------------------------
procedure TfmGurnal.CheckPropertyUnionAdres;
var
  col:TColumnEh;
begin
  if FEnabledUnionAdres then begin
    col:=Grid.FieldColumns['ADRES_ID'];
    if col<>nil then begin
      col.Visible:=FUnionAdres;
      Grid.FieldColumns['PUNKT'].Visible:=not FUnionAdres;
      Grid.FieldColumns['UL'].Visible:=not FUnionAdres;
      Grid.FieldColumns['DOM'].Visible:=not FUnionAdres;
      Grid.FieldColumns['KORP'].Visible:=not FUnionAdres;
      Grid.FieldColumns['KV'].Visible:=not FUnionAdres;
    end;
  end;
end;
//----------------------------------------------------------------
procedure TfmGurnal.CheckPropertyUnionPasp;
var
  col:TColumnEh;
begin          
  if FEnabledUnionPasp then begin
    col:=Grid.FieldColumns['UNION_PASP'];
    if col<>nil then begin
      col.Visible:=FUnionPasp;
      Grid.FieldColumns['Pasp_Seria'].Visible:=not FUnionPasp;
      Grid.FieldColumns['Pasp_Nomer'].Visible:=not FUnionPasp;
      Grid.FieldColumns['Pasp_Date'].Visible:=not FUnionPasp;
      Grid.FieldColumns['PAsp_Vidan'].Visible:=not FUnionPasp;
    end;
  end;
end;
//----------------------------------------------------------------
procedure TfmGurnal.CheckExport;
var
  i : Integer;
  s : String;
begin
  if ExportColumns=nil then begin
    s := iniLocal.ReadString(KodGurnal+'.Add','EXPORTCOLUMNS','');
  end else begin
    s:='';
    for i:=0 to ExportColumns.Count-1 do begin
      if ExportColumns[i].Visible then begin
        s := s + IntToStr(i) + ',';
      end;
    end;
    ExportColumns.Free;
  end;
  ExportColumns := TExportColumnList.Create;
  FillColumnList2(Grid, ExportColumns);
  if (Grid.VisibleColumns.Count>0) and (Grid.VisibleColumns[0].ImageList<>nil)
    then ExportColumns.Delete(0);   // удалить графу с картинкой
  ExportColumns.HideAll;
  if s='' then begin
    for i:=0 to ExportColumns.Count-1 do begin
      if i < FDefCountExport then begin
        ExportColumns[i].Show;
      end else if i >= FDefCountExport then begin
        break;
      end;
    end;
  end else begin
    s:=','+s;
    for i:=0 to ExportColumns.Count-1 do begin
      if Pos(','+IntToStr(i)+',',s)>0 then begin
        ExportColumns[i].Show;
      end;
    end;
  end;
end;
//----------------------------------------------------
function TfmGurnal.FilterChoiceSpr(Spr: TSprItem; Ini: TCustomIniFile; Section: string; AutoSave: Boolean; var Value, ValCaption: string): Boolean;
var
//  fld : TField;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
//  i:Integer;
begin
  Result:=false;
  try
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA(Spr.Name);
    if Opis<>nil then begin
      if Value='' then v:=null else v:=Value;
      SetLength(arrRec,1);
      if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
        Value:=v;
        ValCaption:=GetValueFieldEx(arrRec,Spr.NameFieldName,'');
        Result:=true;
      end;                  
    end;
  except
    on E:Exception do begin
      Value:='';
      ValCaption:='';
      PutError('Ошибка выбора из справочника '+QStr(Spr.Caption)+#13+E.Message,self);
    end;
  end;
end;

//----------------------------------------------------
procedure TfmGurnal.CreateForAll;
var
  strErr : String;
  n:Integer;
begin
{
    TBItemDelayRegister.Visible:=true;
    TBItemDelayRegister.Visible:=false;
}
  VisibleItems([TBItemAddDok, TBItemGrantSprav, TBItemWriteSavedFilter, TBItemIsklOtbor, TBItemAddOtbor,
                TBItemSum, TBSeparatorIskl1, TBSeparatorIskl2, TBItemYear], false);

  FEnableAll:=false;
  FRegisterNotRequired:=false;  // доступность установки значения "взаимодействие с ГИС РН не требуется"
  FBookmarkDel:=false;
  FilterInterface_CurrentSQL:='';
  AdditiveWhere_for_FilterInterface:=false;
  AdditiveWhere_Check:=0;
  SetGlobalFilterPunkt('');    // очистим фильтрацию по населенным пунктам
  formChoiceAdres:=nil;
  OpisRnGor:=nil;

//!!!  StBar.Visible:=false;
  FUserFilter:=false;
  FUnionFIO:=false;
  FUnionAdres:=false;
  FUnionPasp:=false;
  FCheckDateFiks:=false;
  FEnabledUnionFIO:=false;
  FEnabledUnionAdres:=false;
  FEnabledUnionPasp:=false;

  FSeekAsQuery:=false;
  FSeekAsQuery_Active:=false;
  FSeekAsQuery_Ready:=false;
  FSeekEnter:=GlobalTask.ParamAsBoolean('SEEK_ENTER');

  FIdOrgan:=GlobalTask.ParamAsString('ID');  // !!!

  if Role.SystemAdmin  then TBItemGrantSprav.Visible:=true;

  FVisibleBASE:=EnableLoadOch;;
  FCurBase:=-1;
  FGurnalZAGS:=false;   // журнал документов ЗАГС
  FFilter_Punkt:='';
  FValues_Punkt:='';
  FInterObj:=false;
  FFirstID:=false;  // =true для алфавитной книги
  FIgnoreCheck:=false; // =true для реестра населения
  FRun:=false;
  FRunExport:=false;
  FPokaz := TStringList.Create;
  FListPar := TStringList.Create;
  FSubType := '';

  FFilterInterface := TFilterInterface.Create( fmMain.FltOpList, fmMain.FltSprList );
  FFilterInterface.OnAddWhereEvent:=AddWhereEvent;
  FFilterInterface.OnSelectFindValue:=FilterChoiceSpr;

  dmBase.SetDefaultParam( Query );
  EnableItem(TBItemClrFlt, false);
//  TBItemClrFlt.Enabled:=false;
  SetRole;
  FNewSQL:='';
  FEvents:=nil;
  iniGurnal:=nil;
  iniLocal:=nil;

  FDefCountExport := 3;
  FLenSoato:=getLenSoato;
  InitFilter(strErr);
  QuestDel := '  Удалить текущий документ ?  ';
  QuestDelFlt :='Удалить документы по oтбору';
  FMainCaption := Self.Caption;
  FFltCaption:='';
  FSysFltCaption:='';
  FKeyValues2 := VarArrayCreate( [0, 1], varOleStr );
  ExportColumns:=nil;
  FErrorOpen := false;

  n:=Role.EnableEditForm(Self.Name,'');
  if (n=0)
    then FEnableWrite:=false
    else FEnableWrite:=true;

// свойство  TTbItem.HelpContext=1  - отключить
  CheckToolBar(TBToolbarMenu,FEnableWrite);
  {$IFDEF GISUN}
    TBItemDelayRegister.Visible:=(FEnableWrite and IsActiveGISUN and Gisun.IsEnableTypeAkt(TypeEditObj, false));
  {$ELSE}
    TBItemDelayRegister.Visible:=false;
  {$ENDIF}

  FDemo:=false;
  TBSubmenuTmp.Visible:=LoadTemplate(Self.Name);
  TBExcelReport.Visible:=LoadExcelReport(TBExcelReport, Self.Name);
  CheckGurnalZAGS;
  FFilterJurnal  := TFilterJurnal.Create(Self);

//  CreateEvents(Self.Name);
end;

constructor TfmGurnal.Create(Owner: TComponent);
begin
  inherited;
  CreateForAll;
end;

constructor TfmGurnal.CreateChild;
begin
  inherited Create(nil);
  Visible := false;
  CreateForAll;
end;

destructor TfmGurnal.Destroy;
begin
//  ShowMessage('Destroy  '+FKodGurnal);
//  if not FErrorOpen and (iniGurnal<>nil) then SaveToIni;
  SetGlobalFilterPunkt('');    // очистим фильтрацию по населенным пунктам
  if FEvents<>nil then begin
    FEvents.Free;
  end;
  FFilterJurnal.Free;     
  FOrderList.Free;
  Query.Close;
  // при выходе из программы если есть открытые реестры,
  // вызывается destroy на главную форму, а затем на дочерние
  // fmMain=nil устанавливается в fmMain.FormDestroy
  if fmMain<>nil then
    fmMain.DeleteFromListGurnal(Self.Name);
//  if not FErrorOpen and (iniGurnal<>nil) then iniGurnal.UpdateFile;
  if iniGurnal<>nil
    then iniGurnal.Free;
  FFilterInterface.Free;
  if FListPar<>nil
    then FreeAndNil(FListPar);
  if FPokaz<>nil        then FPokaz.Free;
  if ExportColumns<>nil then ExportColumns.Free;
  if formChoiceAdres<>nil then FreeAndNil(formChoiceAdres);
  inherited;
end;

procedure TfmGurnal.SetKodGurnal(const Value: String);
var
  strID : String;
begin
  FKodGurnal := Value;
//  strID := GetNameReport(FKodGurnal);
  strID := FKodGurnal;
  if GlobalTask.CountReport(strID) = 0 then begin
    TBItemPreView.Visible := false;
    TBItemPrint.Visible   := false;
  end else begin
    TBItemPreView.Visible := true;
    TBItemPrint.Visible   := true;
  end;
end;

//--------------------------------------------------------------------
procedure TfmGurnal.SetQueryDateFiks( dDateFiks : TDateTime; lReopen : Boolean );
var
  lDisable : Boolean;
  i : Integer;
  sBase:String;
begin
  lDisable := false;
  if not Query.ControlsDisabled then begin
    lDisable := true;
    Query.DisableControls;
  end;
  if Query.Active
    then Query.Close;  
  Query.SQL.Text := StringReplace( Query.SQL.Text, '&datefiks&', QStr(DTOS(dDateFiks,tdAds)),[rfReplaceAll, rfIgnoreCase]);
  Query.SQL.Text := StringReplace( Query.SQL.Text, '&tmp&', GetNameTmpIdTable,[rfReplaceAll, rfIgnoreCase]);

  {$IFDEF OCHERED}
    Query.SQL.Text := StringReplace( Query.SQL.Text, '&set_datefiks&', '',[rfReplaceAll, rfIgnoreCase]);
  {$ELSE}
    Query.SQL.Text := StringReplace( Query.SQL.Text, '&set_datefiks&', 'n.date_fiks='+QStr(DTOS(dDateFiks,tdAds))+' and ',[rfReplaceAll, rfIgnoreCase]);
  {$ENDIF}
  if FCurBase=-1
    then sBase:=''
    else sBase:='id_base='+IntToStr(FCurBase)+' and ';
  Query.SQL.Text := StringReplace( Query.SQL.Text, '&id_base&', sBase,[rfReplaceAll, rfIgnoreCase]);
  for i:=0 to Query.ParamCount-1 do begin
    if AnsiCompareText(Query.Params[i].Name, 'DATEFIKS') = 0 then begin
      try
        Query.Params[i].AsDateTime := dDateFiks;
//        Query.Params[i].AsString := FormatDateTime('yyyy-mm-dd',dDateFiks);
      except
      end;
    end else begin
      SetQueryParam(Query.Params[i]);
    end;
  end;
//  Query.Prepare;
//  Query.Open;
  if lReopen  then Query.Open;
  if lDisable then Query.EnableControls;
end;

//---------------------------------------------------
procedure TfmGurnal.SetQueryParam(p : TParam);
begin
//
end;

//---------------------------------------------------
function TfmGurnal.SetQueryParamDef(p : TParam):Boolean;
var
  l2 : Boolean;
  b1:Integer;
begin
  Result:=false;
  //  "BASE1"  "BASE2"
  if Copy(UpperCase(p.Name),1,4)='BASE' then begin
    if GetCurBase=-1 then begin
      b1:=-1;
      l2:=true;
    end else begin
      b1:=GetCurBase;
      l2:=false;
    end;
    if Copy(p.Name,5,1)='1' then begin
      p.AsInteger:=b1;
    end else begin
      p.AsBoolean:=l2;
    end;
    Result:=true;
  end else if UpperCase(p.Name)='ADD_ID' then begin
    if FSeekAsQuery then begin
      p.AsBoolean:=not FSeekAsQuery_Active;
    end else begin
      p.AsBoolean:=true;
    end;
    Result:=true;
  end;
end;

//---------------------------------------------------
function TfmGurnal.GetBeginSQL : String;
begin
  Result := 'SELECT * FROM [MMM] WHERE '+#13;
  if TypeEditObj = dmBase.TypeObj_Lich then begin
    Result := 'SELECT * FROM ЛицевыеСчета '+AliasLichSchet+#13+
              ' LEFT JOIN БазаДомов a on l.date_fiks=a.date_fiks and l.adres_id=a.id '+#13+
              ' LEFT JOIN Население n ON l.date_fiks=n.date_fiks and l.first=n.id '+#13+
              ' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_Nasel then begin
    if UpperCase(KodGurnal)='FMGURNOCHERED' then begin
      Result := 'SELECT * FROM Ochered oc'+#13+
                ' LEFT JOIN Население n on n.id=oc.id '+#13+
                ' LEFT JOIN OcheredResh ocr on oc.id_last_resh=ocr.auto_id '+#13+
                ' LEFT JOIN БазаДомов a on n.date_fiks=''1899-12-30'' and n.adres_id=a.id '+#13+
                ' WHERE '+#13;
    end else begin
      Result := 'SELECT * FROM Население '+AliasMens+#13+
                ' LEFT JOIN БазаДомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id '+#13+
                ' LEFT JOIN НаселениеДоп d on n.id=d.id '+#13+
                ' LEFT JOIN VUS v on n.id=v.id '+#13+
                ' LEFT JOIN Ochered oc on oc.ochered_id=0 and n.id=oc.id '+#13+
                ' WHERE '+#13;
    end;
  end else if TypeEditObj = dmBase.TypeObj_Adres then begin
    Result := 'SELECT * FROM БазаДомов '+AliasAdres+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZBrak then begin
    Result := 'SELECT * FROM ЗаключениеБраков '+AliasZBrak+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_DBrak then begin
    Result := 'SELECT * FROM DeclareMarriage '+AliasDBrak+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_DRast then begin
    Result := 'SELECT * FROM DeclareTermMarriage '+AliasDRast+' WHERE '+#13;
  end else if TypeEditObj = _TypeObj_DChName then begin
    Result := 'SELECT * FROM DeclareChName '+AliasDChName+' WHERE '+#13;
  end else if TypeEditObj = _TypeObj_DIzm then begin
    Result := 'SELECT * FROM DeclareIzm '+AliasDIzm+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_Passport then begin
    Result := 'SELECT * FROM Паспорт '+AliasPassport+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZRogd then begin
    Result := 'SELECT * FROM АктыРождений '+AliasZRogd+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZSmert then begin
    Result := 'SELECT * FROM АктыСмертей '+AliasZSmert+' WHERE '+#13;
  end else if TypeEditObj = _TypeObj_AktZah then begin
    Result := 'SELECT * FROM AktZ '+AliasZah+' WHERE '+#13;
  end else if TypeEditObj = _TypeObj_Opeka then begin
    Result := 'SELECT * FROM AktOpek '+AliasOpeka+' WHERE '+#13;
  end else if TypeEditObj = _TypeObj_SMDOPost then begin
    Result := 'SELECT * FROM SMDOPost '+AliasSMDO+' WHERE '+#13;
  end else if TypeEditObj = _TypeObj_QueryGIS then begin
    Result := 'SELECT * FROM QueryGIS '+AliasQueryGIS+' WHERE '+#13;
  end else if (TypeEditObj = _TypeObj_RegDogN) then begin
    Result := 'SELECT * FROM RegDogN '+AliasRegDogN+' WHERE typeobj=103'+#13;
  end else if (TypeEditObj = _TypeObj_RegDogN2) then begin
    Result := 'SELECT * FROM RegDogN '+AliasRegDogN+' WHERE typeobj=104'+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZAdopt then begin
    Result := 'SELECT * FROM AktAdopt '+AliasZAdopt+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZRast then begin
    Result := 'SELECT * FROM AktTermMarriage '+AliasZRast+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_UZRogd then begin
    Result := 'SELECT * FROM GurnalRegistr '+AliasUZRogd+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZChName then begin
    Result := 'SELECT * FROM AktChangeName '+AliasZChName+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZUstOtc then begin
    Result := 'SELECT * FROM АктыУстОтцовства '+AliasZUstOtc+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZUstMat then begin
    Result := 'SELECT * FROM АктыУстМатеринства '+AliasZUstMat+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_TalonPrib then begin
    Result := 'SELECT * FROM ТалоныПрибытия '+AliasTalonPrib+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_TalonUbit then begin
    Result := 'SELECT * FROM ТалоныУбытия '+AliasTalonUbit+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_DeclareRegistr then begin
    Result := 'SELECT * FROM DeclareRegistr '+AliasDeclRegistr+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZAGS_AddDok then begin
    Result := 'SELECT * FROM AddDokZAGS '+AliasAddDokZAGS+' WHERE '+#13;
  end;
end;

//-----------------------------------------------------------
procedure TfmGurnal.SetCaptionGurnal;
var
  s,ss : String;
begin
  s:=FMainCaption;
  if (FSysFltCaption<>'') and (FSysFltCaption<>'*')
    then s:=s+' '+FSysFltCaption+' ';
  if FFilter_Punkt<>'' then begin
    s:=s+' [НАС. ПУНКТЫ]';
  end;
  if FCheckGodGurnal and (AdditiveWhere_Check=0) then begin
    if fmMain.YearFiks=1
      then ss:=' (текущий)'
      else ss:='';
    s:=s+' [ '+inttostr(FCurGodGurnal)+' год'+ss+' ]';
  end;
  if (FFltCaption<>'') then begin
    if FFltCaption='*' then ss:=' установлен отбор'
                       else ss:=' установлен отбор: '+FFltCaption;
    s:=s+ss;
  end;
  Self.Caption:=s;
end;

//----------------------------------------------------
procedure TfmGurnal.ClickSetFilter(SenderObj : TObject; Sender: TFindList);
var
  strSQL : String;
  strOrderBy : String;
begin
//  sender[0].Value1.NumVal
//  Showmessage(IntToStr(sender[0].Value1.NumVal));
//  ShowStrings(Sender.ParamCtrl,'');
  strSQL := FilterInterface.GetSQL( Sender );
  if Trim(Sender.Caption)='' then FFltCaption:='*'
                             else FFltCaption:=Sender.Caption;
  SetCaptionGurnal;
  strOrderby := FilterInterface.GetCurrentOrderBy;
  if strOrderBy='' then begin
    strOrderBy := FFilterJurnal.DefaultOrderBy;
  end;
  if strSQL <> '' then begin
    strSQL  := ChangeWhere(Query.SQL.Text, strSQL, false);
    if strOrderBy<>'' then begin
      strSQL  := ChangeOrderBy(strSQL, strOrderBy);
    end;
    FNewSQL := strSQL;
    Refresh(true);
    FNewSQL:='';
    EnableItem(TBItemClrFlt, true);
//    TBItemClrFlt.Enabled:=true;
    CheckAddOtbor;
  end;
end;

//--------------------------------------------------
procedure TfmGurnal.TestFilterSQL(Sender: TObject);
var
  strSQL : String;
begin
  strSQL := GetBeginSQL;
  ExecuteFormQuery( dmBase.GetPropertyAds, dmBase.IniSysParams, false,
                    strSQL + FilterInterface.GetSQL(TFindList(Sender)));
end;
//-------------------------------------------------------------------------
procedure TfmGurnal.SetSearchRangeGurnal;
begin
  if fmMain.DateFiks<>dmBase.GetDateCurrentSost then begin
    FilterInterface.SearchRange:=srYear;
  end else begin
    FilterInterface.SearchRange:=srCurrent;  //srAllYear, srYear
  end;
end;
//-------------------------------------------------------------------------
function TfmGurnal.InitFilter( var strErr : String ) : Boolean;
var
  strCaption : String;
  strDir     : String;
  strAl      : String;
  lVisible : Boolean;
  it : TTbItem;
begin
  Result := true;
  FilterInterface.AdminUser := Role.SystemAdmin;
  if not FilterInterface.AdminUser then begin
    FilterInterface.UserRights := [];
    // работа с дизайнером форм                            urDesigner
    // тестирование запроса                                urTestSQL
    // проверка ошибок инициализации интерфейса фильтра    urTestError
    // настройка дерева полей                              urFieldTree
    if Role.Status = rsAdmin then begin
      FilterInterface.UserRights := FilterInterface.UserRights + [urDesigner];
    end;
  end;
  FilterInterface.AddWhere:='';
  FilterInterface.UseYear := true;
  if fmMain.DateFiks=dmBase.GetDateCurrentSost then begin
    FilterInterface.CurrentSearchDate:=fmMain.DateFiks;   // !!!
    FilterInterface.SearchDate:=fmMain.DateFiks;   // !!!
  end else begin
    FilterInterface.CurrentSearchDate:=IncYear(fmMain.DateFiks,-1);   // !!!   потому что в фильтре запрос "за год ХХХХ"
    FilterInterface.SearchDate:=IncYear(fmMain.DateFiks,-1);;   // !!!
  end;
  FilterInterface.MainConnect:=dmBase.AdsConnection.Name;
  if TypeEditObj = dmBase.TypeObj_Lich then begin
    strCaption := 'Лицевые счета';
    strDir := 'ЛицевыеCчета';
    strAl := AliasLichSchet;
    FilterInterface.MainTableName  := 'Лицевыесчета';
    FilterInterface.MainTableAlias := AliasLichSchet;
    FilterInterface.MainTableJoin  := ' LEFT JOIN БазаДомов a on l.date_fiks=a.date_fiks and l.adres_id=a.id '#13+
                                      ' LEFT JOIN Население n ON l.date_fiks=n.date_fiks and l.first=n.id ';
    FilterInterface.AliasJoin:='a';
  end else if TypeEditObj = dmBase.TypeObj_Nasel then begin
    if FSubType <> '' then begin
      strCaption := FSubType;
      strDir := FSubType;
      FilterInterface.UseYear := false;
    end else begin
      strCaption := 'Население';
      strDir := 'Население';
    end;
    strAl := AliasMens;
    FilterInterface.MainTableName  := 'Население';
    FilterInterface.MainTableAlias := AliasMens;
    FilterInterface.MainTableJoin  := ' LEFT JOIN БазаДомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id ';
    FilterInterface.AliasJoin:='a';
    {$IFDEF OCHERED}
      FilterInterface.UseYear := false;
    {$ENDIF}
  end else if TypeEditObj = dmBase.TypeObj_Adres then begin
    strCaption := 'Дома';
    strDir := 'Дома';
    strAl := AliasAdres;
    FilterInterface.MainTableName  := 'БазаДомов';
    FilterInterface.MainTableAlias := AliasAdres;
  end else if TypeEditObj = dmBase.TypeObj_ZBrak then begin
    strCaption := 'Заключение браков';
    strDir := 'ЗаключениеБраков';
    strAl := AliasZBrak;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'ЗаключениеБраков';
    FilterInterface.MainTableAlias := AliasZBrak;
  end else if TypeEditObj = dmBase.TypeObj_DBrak then begin
    strCaption := 'Заявления о заключении брака';
    strDir := 'DeclareMarriage';
    strAl := AliasDBrak;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'DeclareMarriage';
    FilterInterface.MainTableAlias := AliasDBrak;
  end else if TypeEditObj = dmBase.TypeObj_DRast then begin
    strCaption := 'Заявления о расторжении брака';
    strDir := 'DeclareTermMarriage';
    strAl := AliasDRast;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'DeclareTermMarriage';
    FilterInterface.MainTableAlias := AliasDRast;
  end else if TypeEditObj = _TypeObj_DChName then begin
    strCaption := 'Заявления о перемене ФИО';
    strDir := 'DeclareChName';
    strAl := AliasDChName;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'DeclareChName';
    FilterInterface.MainTableAlias := AliasDChName;
  end else if TypeEditObj = _TypeObj_DIzm then begin
    strCaption := 'Заявления о внесении изменений';
    strDir := 'DeclareIzm';
    strAl := AliasDIzm;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'DeclareIzm';
    FilterInterface.MainTableAlias := AliasDIzm;
  end else if TypeEditObj = dmBase.TypeObj_ZRogd then begin
    strCaption := 'Акты рождений';
    strDir := 'АктыРождений';
    strAl := AliasZRogd;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'АктыРождений';
    FilterInterface.MainTableAlias := AliasZRogd;
  end else if TypeEditObj = dmBase.TypeObj_ZSmert then begin
    strCaption := 'Акты смерти';
    strDir := 'АктыСмертей';
    strAl := AliasZSmert;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'АктыСмертей';
    FilterInterface.MainTableAlias := AliasZSmert;
  end else if TypeEditObj = _TypeObj_AktZah then begin
    strCaption := 'Захоронения';
    strDir := 'AktZ';
    strAl := AliasZah;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'AktZ';
    FilterInterface.MainTableAlias := AliasZah;
  end else if TypeEditObj = _TypeObj_Opeka then begin
    strCaption := 'Опека';
    strDir := 'AktOpek';
    strAl := AliasOpeka;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'AktOpek';
    FilterInterface.MainTableAlias := AliasOpeka;
  end else if TypeEditObj = _TypeObj_SMDOPost then begin
    strCaption := 'Почта СМДО';
    strDir := 'SMDOPost';
    strAl := AliasSMDO;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'SMDOPost';
    FilterInterface.MainTableAlias := AliasSMDO;
  end else if TypeEditObj = _TypeObj_QueryGIS then begin
    strCaption := 'Запросы в ГИС РН';
    strDir := 'QueryGIS';
    strAl := AliasQueryGIS;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'QueryGIS';
    FilterInterface.MainTableAlias := AliasQueryGIS;
  end else if TypeEditObj = _TypeObj_RegDogN then begin
    strCaption := 'Регистрация договоров найма';
    strDir := 'RegDogN';
    strAl := AliasRegDogN;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'RegDogN';
    FilterInterface.MainTableAlias := AliasRegDogN;
  end else if TypeEditObj = _TypeObj_RegDogN2 then begin
    strCaption := 'Регистрация договоров найма';
    strDir := 'RegDogN2';
    strAl := AliasRegDogN;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'RegDogN';
    FilterInterface.MainTableAlias := AliasRegDogN;
  end else if TypeEditObj = dmBase.TypeObj_ZUstOtc then begin
    strCaption := 'Акты установления отцовства';
    strDir := 'АктыУстОтцовства';
    strAl := AliasZUStOtc;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'АктыУстОтцовства';
    FilterInterface.MainTableAlias := AliasZUstOtc;
  end else if TypeEditObj = dmBase.TypeObj_ZUstMat then begin
    strCaption := 'Акты установления материнства';
    strDir := 'АктыУстМатеринства';
    strAl := AliasZUStMat;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'АктыУстМатеринства';
    FilterInterface.MainTableAlias := AliasZUstMat;
  end else if TypeEditObj = dmBase.TypeObj_ZAdopt then begin
    strCaption := 'Акты усыновления (удочерения)';
    strDir := 'АктыУсыновления';
    strAl := AliasZAdopt;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'AktAdopt';
    FilterInterface.MainTableAlias := AliasZAdopt;
  end else if TypeEditObj = dmBase.TypeObj_ZRast then begin
    strCaption := 'Расторжение браков';
    strDir := 'РасторжениеБраков';
    strAl := AliasZRast;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'AktTermMarriage';
    FilterInterface.MainTableAlias := AliasZRast;
  end else if TypeEditObj = dmBase.TypeObj_UZRogd then begin
    strCaption := 'Журнал учета заявлений о регистрации рождения';
    strDir := 'Журнал учета заявлений о регистрации рождения';
    strAl := AliasUZRogd;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'GurnalRegistr';
    FilterInterface.MainTableAlias := AliasUZRogd;
  end else if TypeEditObj = dmBase.TypeObj_ZChName then begin
    strCaption := 'Акты изменения имени';
    strDir := 'ИзменениеИмени';
    strAl := AliasZChName;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'AktChangeName';
    FilterInterface.MainTableAlias := AliasZChName;
  end else if TypeEditObj = dmBase.TypeObj_Passport then begin
    strCaption := 'Заявление на паспорт';
    strDir := 'Паспорт';
    strAl := AliasPassport;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'Паспорт';
    FilterInterface.MainTableAlias := AliasPassport;
  end else if TypeEditObj = dmBase.TypeObj_TalonPrib then begin
    strCaption := 'Талоны прибытия';
    strDir := 'ТалоныПрибытия';
    strAl := AliasTalonPrib;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'ТалоныПрибытия';
    FilterInterface.MainTableAlias := AliasTalonPrib;
  end else if TypeEditObj = dmBase.TypeObj_TalonUbit then begin
    strCaption := 'Талоны убытия';
    strDir := 'ТалоныУбытия';
    strAl := AliasTalonUbit;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'ТалоныУбытия';
    FilterInterface.MainTableAlias := AliasTalonUbit;
  end else if TypeEditObj = dmBase.TypeObj_DeclareRegistr then begin
    strCaption := 'Заявления о регистрации';
    strDir := 'ЗаявленияРегисрации';
    strAl := AliasDeclRegistr;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'DeclareRegistr';
    FilterInterface.MainTableAlias := AliasDeclRegistr;
  end else if TypeEditObj = dmBase.TypeObj_ZAGS_AddDok then begin
    strCaption := 'Дополнительный документы';
    strDir := 'ДополнительныйДокументы';
    strAl := AliasAddDokZAGS;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'AddDokZAGS';
    FilterInterface.MainTableAlias := AliasAddDokZAGS;
  end;
  FilterInterface.RootCaption := strCaption;
  FilterInterface.Ini := GlobalTask.iniFile('CONF');
  FilterInterface.Section  :='fFind';
  FilterInterface.AutoSave := true;
  FilterInterface.BaseDir := NameFromExe('Filters\'+strDir);

  if FilterInterface.UseYear then begin
    SetSearchRangeGurnal;
    {
    if fmMain.DateFiks <> dmBase.GetDateCurrentSost then begin
      FilterInterface.SearchRange:=srYear;
      // чтобы в фильтре красиво подсвечивался год
//      FilterInterface.SearchDate:=fmMain.DateFiks;
//???      FilterInterface.SearchDate :=  IncMonth( fmMain.DateFiks, -12) ;
    end else begin
      FilterInterface.SearchRange:=srCurrent;  //srAllYear, srYear
//      FilterInterface.SearchDate :=  dmBase.GetDateCurrentSost;
    end;
    }
    FilterInterface.DateTimeFormat :='yyyy-mm-dd';
    FilterInterface.DateFieldName := strAl + '.Date_Fiks';
    {
    if TypeEditObj = dmBase.TypeObj_ZRogd then begin
      FilterInterface.SearchRange    := srYear;
      FilterInterface.DateTimeFormat :='yyyy';
      FilterInterface.DateFieldName  := 'Year('+strAl + '.datez)';
    end;
    }
  end;

  FilterInterface.DoFieldSort := true;

  CreateRelList( FilterInterface.RelList, TypeEditObj );
  if not FilterInterface.LoadFieldList( NameFileOpisFilter(TypeEditObj) ) then begin
    LoadFields(FilterInterface.FindFieldList, TypeEditObj );
    FilterInterface.SaveFieldList( NameFileOpisFilter(TypeEditObj) );
  end;

  if TypeEditObj = dmBase.TypeObj_Nasel then begin
    // если "ВУС" недоступен то отключим реквизиты отвечающие за ВУС
    lVisible := not (Role.CheckSubSystem(SS_VUS)=ptDeniedAccess);
    FFilterInterface.FindFieldList.SetVisible('ВУС', lVisible);
    if FFilterInterface.FindFieldList.ByPath('FLD_VUS')<>nil then begin
       FFilterInterface.FindFieldList.ByPath('FLD_VUS').Visible:=lVisible;
    end;
    // если "Очередь на жильё" недоступена то отключим реквизиты отвечающие за нее
    lVisible := not (Role.CheckSubSystem(SS_OCHERED)=ptDeniedAccess);
    FFilterInterface.FindFieldList.SetVisible('Очередь на жильё', lVisible);
    if FFilterInterface.FindFieldList.ByPath('FLD_OCHERED')<>nil then begin
       FFilterInterface.FindFieldList.ByPath('FLD_OCHERED').Visible:=lVisible;
    end;
  end;

  FilterInterface.OnTestSQL      :=TestFilterSQL;
  FilterInterface.OnFilterEvent  :=ClickSetFilter;
  FilterInterface.OnUserOperEvent:=OnUserOper;

  BuildMenuChoiceFlt; //  FilterInterface.BuildFilterMenu2(TBSubChoiceFlt,nil);
  FilterInterface.BuildGroupMenu2(TBSubmenuGroup, OnMenuGroupClick);

end;
//---------------------------------------------
procedure TfmGurnal.BuildMenuChoiceFlt;
var
//  it : TTbItem;
  sub: TTBSubmenuItem;
begin
  FilterInterface.BuildFilterMenu2(TBSubChoiceFlt,nil);
  sub:=TTBSubmenuItem.Create(TBSubChoiceFlt);
  CheckMenuSavedFilter(sub);
  TBSubChoiceFlt.Insert(0,sub);
end;
//---------------------------------------------
procedure TfmGurnal.OnMenuGroupClick(Sender: TObject);
var
   GroupName: TFilterName;
//   Err: string;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      GroupName:=FilterInterface.GroupNameList[TComponent(Sender).Tag];
      if not GroupName.IsFolder then begin
         FilterInterface.RunGroupBy(GroupName.FullFileName, ClrFltEnabled);
      end;
   end;         
end;

// вставка для возможности поиска по выражению  "case fieldname is null or fieldname=0 then false else true end"
// см. также модуль uFilter функция LoadNasel()
function TfmGurnal.OnUserOper(Oper: TOperItem; FindField: TFindFieldItem; RelItem: TRelItem; FullFieldName, Value1, Value2, OperVal: string; var Expr: string): Boolean;
begin
   Result:=False;
   if (FindField<>nil) and (Oper.Name='EQUAL_L') and
      ((FindField.RealName='LIC_ID') or (FindField.RealName='ADRES_ID') or (FindField.RealName='ADRES_ID_GIT') or (FindField.RealName='NEW_ADRES_ID')) then begin
     Expr:=Format('case when %0:s is null or %0:s=0 then false else true end=%1:s', [FullFieldName, Value1]);
     Result:=true;
   end;
   if (FindField<>nil) and (FindField.RealName='DOM1') then begin
//     if Pos(';'+Oper.Name+';', ';EQUAL_N_R;NOT_EQUAL_N_R;GREAT_N_R;GREAT_EQUAL_N_R;LOWER_N_R;LOWER_EQUAL_N_R;BETWEEN_N_R;')>0  then begin
     if Pos(';'+Oper.Name+';', ';EQUAL_N;NOT_EQUAL_N;GREAT_N;GREAT_EQUAL_N;LOWER_N;LOWER_EQUAL_N;BETWEEN_N;')>0  then begin
//       Expr:=Format('CAST( %0:s as SQL_INTEGER)=%1:s', [FullFieldName, Value1]);
       Expr:=StringReplace(Expr, FullFieldName, Format('CAST( %0:s as SQL_INTEGER)', [FullFieldName]),[rfReplaceAll, rfIgnoreCase]);
       Result:=true;
     end;
   end;
end;

//------------------------------------------------------------------------
procedure TfmGurnal.InitOrderBy;
var
  i : Integer;
  Order : TOrderField;
  Field : TFindFieldItem;
begin
  if FFilterJurnal.CountOrders > 0 then begin
    for i:=0 to FFilterJurnal.CountOrders-1 do begin
      Order := FFilterJurnal.GetOrder(i);
      Field := FilterInterface.FindFieldList.ByRealName(nil, Order.Alias, Order.FieldName);
      if Field=nil then begin
        FilterInterface.FindFieldList.AddNew('ORDER_'+Order.Alias+'_'+Order.FieldName, Order.FieldName,
              Order.Caption, '', Order.Alias, Order.TypeField, false, Order.CaseSensitive,
              false, '', nil, 0, '', '', '', sekDefault);
        FilterInterface.OrderFields.Add('ORDER_'+Order.Alias+'_'+Order.FieldName);
      end else begin
        FilterInterface.OrderFields.Add(Field.Name);
      end;
    end;
    FOrderList := TFindList.Create('','','',false);
  end else begin
    TBItemOrder.Visible := false;
  end;
end;

//-------------------------------------------------------------------
// создать условие для фильтра, которое должно добавляться всегда
//-------------------------------------------------------------------
function TfmGurnal.CreateAdditiveWhere(strAddSQL : String): String;
begin
  FilterInterface.AddWhere:=''; // Trim(FFilterJurnal.AdditiveWhere);
  strAddSQL:=Trim(strAddSQL);
  if strAddSQL<>'' then begin
    FilterInterface.AddWhere:=strAddSQL;
    Result:=strAddSQL;
  end else begin
    Result:='';
  end;
end;
//-------------------------------------------------------------------
procedure TfmGurnal.AddWhereEvent(Sender:TFilterInterface; SQL:TStringList);
begin
  AdditiveWhere_for_FilterInterface:=true;
  AdditiveWhere_Check:=0;
  try
    {$IFDEF ZAGS}
      if (FCurGodGurnal>0) and (Pos('DATEZ', SQL.Text)>0) then begin
        AdditiveWhere_Check:=1; // !!!
      end;
    {$ENDIF}
    FilterInterface.AddWhere:=CreateAdditiveWhere(getAdditiveWhere);
  finally
    AdditiveWhere_for_FilterInterface:=false;
    //AdditiveWhere_Check:=0; сбрасываем в clearFilter !!!
  end;
end;
//-------------------------------------------------------------------
function TfmGurnal.ClrFltEnabled:Boolean;
begin
  if TBDock.Visible
    then Result:=TBItemClrFlt.Enabled
    else Result:=TBItemClrFlt24.Enabled;
end;
//-------------------------------------------------------------------
// установить доступность TBItemClrFlt
procedure TfmGurnal.SetClearFilter(lSet:Boolean);
begin
  TBItemClrFlt.Enabled:=lSet;
  TBItemClrFlt24.Enabled:=lSet;
end;
//-------------------------------------------------------------------
// в текущем фильтре используется поле date_fiks
function TfmGurnal.IsDateFiks:Boolean;
var
  s:String;
begin
  Result:=false;
  if ClrFltEnabled or FCheckDateFiks then begin // установлен фильтр
    s := FilterInterface_CurrentSQL;
//    s := FilterInterface.GetCurrentSQL;   @@@
    if (Pos('DATE_FIKS=''', ANSIUpperCase(s))>0) or  (Pos('DATE_FIKS=:DATE_FIKS', ANSIUpperCase(s))>0) then begin
      Result:=true;
    end;
  end;
end;                       
//-------------------------------------------------------------------
function TfmGurnal.IsSetFilter:Boolean;
begin
  Result:=false;
  if ClrFltEnabled then begin // установлен фильтр
    Result:=true;
  end;
end;
//-------------------------------------------------------------------
function TfmGurnal.CreateAdditiveWhere2Refresh:Boolean;
var
  s:String;
//  strSQL:String;
begin
  Result:=true;
  s:=CreateAdditiveWhere(getAdditiveWhere);
//  if s<>'' then begin
    FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
//  end;
  FullRefresh;
  SetCaptionGurnal;        
{
  CreateAdditiveWhere(getAdditiveWhere);
  if TBItemClrFlt.Enabled then begin // установлен фильтр
    strSQL := FilterInterface.GetCurrentSQL;
    if (FilterInterface.GetCurrentSQL<>'') then begin
      TBItemRepeatFilterClick(nil);
    end;
  end else begin
    TBItemClrFltClick(nil);
  end;
 }
end;

//-------------------------------------------------------------------
//-------------------------------------------------------------------
function TfmGurnal.GetCurrentWhere: String;
begin
  if IsSetFilter then begin //TBItemClrFlt.Enabled then begin  // если установлен отбор
//    Result:=FilterInterface.GetCurrentSQL;
    Result:=FilterInterface_CurrentSQL;   // @@@
  end else begin                      // иначе where по умолчпнию
    Result:=CreateAdditiveWhere(getAdditiveWhere);
  end;
end;
//--------------------------------------------------------------------
function TfmGurnal.GetBookmark(sl:TStringList):Boolean;
var
  arrB:TArrStrings;
  i:Integer;
begin
  SelectionToArr(Grid, arrB);
  sl.Clear;
  if Length(arrB)>0 then begin
    for i:=0 to Length(arrB)-1 do begin
//      Query.Bookmark:=;
      sl.Add(arrB[i]);
    end;
  end;
  Result:=sl.Count>0;
end;
//---------------------------------------------------------------
function TfmGurnal.BookmarkToFilter(sField:String):Boolean;
var
  sl:TStringList;
  i:integer;
  s:String;
begin
  sl:=TStringList.Create;
  GetBookmark(sl);
  if sl.Count>0 then begin
    s:=';';
    for i:=0 to sl.Count-1 do begin
      Query.Bookmark:=sl.Strings[i];
      s:=s+Query.FieldByName(sField).AsString+';';
    end;
    Query.Filter:='at('';''+alltrim(str('+sField+'))+'';'','+QStr(s)+')>0';
    Query.Filtered:=true;
    Result:=true;
  end else begin
    Result:=false;
  end;
  sl.Free;
end;
//---------------------------------------------------------------
// отмеченные записи текущего журнала в список значений поля sField
function TfmGurnal.BookmarkToValues(sField:String; sDelim:String):String;
var
  sl:TStringList;
  i:integer;
begin
  Result:='';   
  sl:=TStringList.Create;
  GetBookmark(sl);
  if sl.Count>0 then begin
    for i:=0 to sl.Count-1 do begin
      Query.Bookmark:=sl.Strings[i];
      Result:=Result+Query.FieldByName(sField).AsString+sDelim;
    end;
    Result:=Copy(Result,1,Length(Result)-1);
  end;
  sl.Free;
end;

//--------------------------------------------------------------------
function TfmGurnal.GetNameTmpIdTable:String;
begin
  Result:='#tmp_'+KodGurnal;
end;

//--------------------------------------------------------------------
procedure TfmGurnal.AddRunDelete;
var
  it : TTbItem;
 sep : TTbSeparatorItem;
begin
  if TBSubItemRun.Count>0 then begin
    sep := TTbSeparatorItem.Create(TBSubItemRun);
    TBSubItemRun.Add(sep);
  end;
  it := TTbItem.Create(TBSubItemRun);
  it.Caption:=QuestDelFlt;
  it.OnClick:=Event_RunDelete;
  TBSubItemRun.Add(it);
end;
//--------------------------------------------------------------------
function TfmGurnal.IsGurnOchered : Boolean;
begin
  Result:=(UpperCase(KodGurnal)='FMGURNOCHERED');
end;
function TfmGurnal.IsGurnAdres : Boolean;
begin
  Result:=(UpperCase(KodGurnal)='FMGURNALADRES');
end;
//------------------------------------------------------------------------------
procedure TfmGurnal.FullRefresh(lReopen:Boolean; strOrderBy:String; ID:String);
var
  strSQL : String;
//  strOrderBy : String;
begin
  strSQL:='';
  if IsSetFilter //TBItemClrFlt.Enabled
    then strSQL:=FilterInterface.GetCurrentSQL;
  FilterInterface_CurrentSQL:=strSQL;
  if lReopen or (strSQL<>'') then begin
    FFltCaption:='';
//    SetCaptionGurnal;
    if FilterInterface.Filter.Caption='' then FFltCaption:='*'
                                         else FFltCaption:=FilterInterface.Filter.Caption;
    SetCaptionGurnal;
    if strSQL<>''
      then strSQL:=ChangeWhere(Query.SQL.Text, strSQL , false);
    if strOrderBy<>'' then begin
      strSQL:=ChangeOrderBy(strSQL, strOrderBy);
    end;
    FNewSQL := strSQL;
    Refresh(true, ID);
    FNewSQL:='';
    EnableItem(TBItemClrFlt, true);
//    TBItemClrFlt.Enabled:=true;
    CheckAddOtbor;
  end else begin
    Refresh(true, ID);
    FNewSQL:='';
  end;
end;
//------------------------------------------------------------------------------
procedure TfmGurnal.Refresh(lFull : Boolean; ID:String);
var
  old    : TCursor;
  oldSQL : String;
  lErr,lCancel,lSeekID,l  : Boolean;
  fld : TField;
  BookMark : TBookMarkStr;
  Row: Integer;
//  oldEvent: TMessageEvent;
begin        
  old := Screen.Cursor;
  Application.ProcessMessages;
  l:=dbDisableControls(Query);
//  oldEvent:=Application.OnMessage;
//  Application.OnMessage:=CheckMouseMessage;
  try
//  Query.DisableControls;
  if (ID='') then begin
    lSeekID:=false;
    fld := Query.FindField('ID');
    ID  := '';
    if fld <> nil then begin
      ID := fld.AsString;
    end;
  end else begin
    lSeekID:=true;
  end;

//запомнить первую видиму строку
  Row:=Grid.Row;
  Query.MoveBy(-Pred(Row));
  Bookmark:=Query.Bookmark;

//  BookMark:=Query.Bookmark;

  if (FNewSQL='') and Query.CanModify and not lFull then begin
//  if (FNewSQL='') and not lFull then begin
    Query.Refresh;

    if Query.BookmarkValid(TBookmark(Bookmark)) then begin
      Query.Bookmark:=Bookmark;
      //теперь первая строка окажется посередине экрана поэтому надо ее поднять вверх и вернуться обратно
      Query.MoveBy(Pred(Grid.VisibleRowCount));
      Query.MoveBy(Row-Grid.VisibleRowCount);
    end;

  end else begin
    Query.Close;
    oldSQL := Query.SQL.Text;
    if FNewSQL<>'' then Query.SQL.Text:=FNewSQL;
    SetQueryDateFiks( DateFiks, false );
    lErr    := false;
    lCancel := false;

//    WriteToDebug([Query.SQL.Text,'----']);

//    Screen.Cursor := crHourGlass;
    try
      try
//        RegisterCallback(Query,1);
//        if Screen.Cursor = crHourGlass then ShowMessage('222222222');
        memoWrite( 'last.sql', Query.SQL.Text);
        Query.Open;
//        lCancel := IsCloseCallback;
//        ClearCallback;
      except
        on E:Exception do begin
          lErr := true;
          PutError('Ошибка открытия: '+#13+E.Message,self);
        end;
      end;
      if lErr or lCancel then begin
        Query.SQL.Text := oldSQL;
        Query.Open;
      end;
      if not lFull or lSeekID then begin
        try

//----- было ------------------
//         Query.Bookmark := Bookmark;

//----- стало ------------------
          if Query.BookmarkValid(TBookmark(Bookmark)) then begin
            Query.Bookmark:=Bookmark;
            //теперь первая строка окажется посередине экрана поэтому надо ее поднять вверх и вернуться обратно
            Query.MoveBy(Pred(Grid.VisibleRowCount));
            Query.MoveBy(Row-Grid.VisibleRowCount);
          end;
//-------------------------------

          if (ID<>'') and (ID<>Query.FieldByName('ID').AsString) then begin
            if not Query.Locate('ID',ID,[]) then begin
              Query.First;
            end;
          end;
        except
        end;
      end;
    finally
      Screen.Cursor := old;
    end;
  end;
//  Query.EnableControls;
  finally
    dbEnableControls(Query,l);
//    Application.OnMessage:=oldEvent;
  end;
  FNewSQL:='';
 // Grid.Invalidate;
end;

procedure TfmGurnal.TBItemRefreshClick(Sender: TObject);
begin
  FullRefresh;
end;
//-------------------------------------------------------------
procedure TfmGurnal.TBItemEditClick(Sender: TObject);
var
  l:Boolean;
begin
  if not Query.FieldByName('ID').IsNull then begin
    {tb:=dmBase.MainTableFromTypeObj(TypeEditObj);
    if tb<>nil then begin
         !!!  поиск с date_fiks или нет   !!!
      if tb.Locate('ID', Query.FieldByName('ID').AsInteger, []) then begin

      end;
    end; }
//    FRun:=true;
    l:=SetRunActive;
    try
      if BeforeEdit then begin
        SetListParEditForm;   // заполнить FListPar
        if fmMain.EditDokument(Query, GetTypeEditObj,'ID',FListPar,true, KodGurnal) then begin
          Refresh(false);
        end;
        FListPar.Clear;
      end;
    finally
      RestRun(l);
//      FRun:=false;
    end;
  end;
end;
//------------------------------------------------------------------------
procedure TfmGurnal.TBItemDelDokClick(Sender: TObject);
var
  i:Integer;
  arr : TArrStrings;
  strErr : String;
  sBookMark,s:String;
  lCheck,lQuest:Boolean;
begin
  if ActiveControl<>Grid then exit;
  
  FRun:=true;
  try         

  if not Query.FieldByName('ID').IsNull and (QuestDel<>'') then begin
  //  PrintTable.ShowReport;
    SetLength(arr,0);
    SelectionToArr(Grid,arr);
    strErr:='';
    lQuest:=true;
    if Length(arr)=0 then begin
      if CheckDelete(strErr,lQuest) then begin
        if not lQuest or Problem(QuestDel,mtConfirmation,grid) then begin
          lCheck:=dbDisableControls(Query);
          s:=Query.Bookmark;
          sBookMark:='';

          Query.Next;
          if Query.Eof then begin
            Query.Prior;
            if not Query.Bof
              then sBookMark:=Query.Bookmark;
          end else begin
            sBookMark:=Query.Bookmark;
          end;
          Query.Bookmark:=s;
          if dmBase.DeleteDokument(Query, GetTypeEditObj, FIgnoreCheck) then begin
            if sBookMark<>'' then begin
              Query.Bookmark:=sBookMark;
            end;
            dbEnableControls(Query,lCheck);
            Refresh(false);
          end else begin
            dbEnableControls(Query,lCheck);
            strErr:=dmBase.LastErrorDelete;
          end;
        end;
      end;
      if strErr<>'' then PutError(strErr,self);
    end else begin
      if FBookmarkDel then begin
        if CheckDelete(strErr,lQuest,arr) then begin
          if not lQuest or Problem(QuestDelFlt,mtConfirmation,self) then begin
            OpenMessage('Удаление ... 1/'+inttostr(length(arr)));
            lCheck:=dbDisableControls(Query);
            try
              s:=Query.Bookmark;
              for i:=0 to Length(arr)-1 do begin
                ChangeMessage('Удаление ... '+inttostr(i)+'/'+inttostr(length(arr)));
                Query.Bookmark:=arr[i];
                if not dmBase.DeleteDokument(Query, GetTypeEditObj, FIgnoreCheck) then begin
                  strErr:=dmBase.LastErrorDelete;
                  break;
                end;
              end;
              try
                Query.Bookmark:=s;
              except
                Query.First;
              end;
            finally
              CloseMessage;
              dbEnableControls(Query,lCheck);
              Grid.Selection.Clear;
              Refresh(false);
            end;
          end;
        end;
        if strErr<>'' then PutError(strErr,self);
      end;
    end;
  end;

  finally
    FRun:=false;
  end;
end;

function TfmGurnal.CheckDelete(var strErr : string; var lQuest:Boolean; arr:TArrStrings) : Boolean;
var
  fld:TField;
  s:String;
  lCheck:Boolean;
  i:Integer;
begin
  strErr:='';
  Result:=true;
  {$IFDEF GISUN}
  fld:=Query.FindField('POLE_GRN');
  if (fld<>nil) then begin // and not Role.SystemAdmin then begin
    if arr=nil then begin
      if (Gisun.GetPoleGrn(fld)=3) and (Query.FieldByName('DATEZ').AsDateTime>STOD('20130725',tdClipper) ) then begin
        s:='ВНИМАНИЕ!'#13+
           'Запись зарегистрирована в '+_GIS_ +#13+
           'Об удалении сообщите в подразделение регистра.'#13+
           'Если Вы уверены в необходимости удаления,'#13+
           'введите слово ДА в поле ввода'#13;
        if OkWarning(s,self) then begin
          lQuest:=false;
        end else begin
          Result:=false;
        end;
      end;
    end else begin
      OpenMessage('Прооверка возможности улаления ...', '', 0);
      lCheck:=dbDisableControls(Query);
      try
        s:=Query.Bookmark;
        for i:=0 to Length(arr)-1 do begin
          Query.Bookmark:=arr[i];
          if (Gisun.GetPoleGrn(fld)=3) and (Query.FieldByName('DATEZ').AsDateTime>STOD('20130725',tdClipper) ) then begin
            strErr:='Среди отмеченных записей есть отправленные в '+_GIS_ +'. Удаление невозмодно!';
            Result:=false;
            break;
          end;
        end;
        Query.Bookmark:=s;
      finally
        CloseMessage;
        dbEnableControls(Query,lCheck);
      end;
    end;
  end;
  {$ENDIF}
end;
//---------------------------------------------------
function TfmGurnal.SetRunActive:Boolean;
begin
  if FRun then begin
    Result:=false;   // FRun уже включет, ничего не меняем
  end else begin
    FRun:=true;
    Result:=true;    // значение устанавилось, значит нужно будет сбросить
  end;
end;
procedure TfmGurnal.RestRun(lSet:Boolean);
begin
  if lSet then begin  // значение устанавливалось, значит нужно сбросить
    FRun:=false;
  end;
end;
//---------------------------------------------------
procedure TfmGurnal.GridDblClick(Sender: TObject);
begin
  TBItemEditClick(nil);
end;

procedure TfmGurnal.TBItemPreViewClick(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.PreViewReport(KodGurnal);
  AfterReport;
end;

procedure TfmGurnal.TBItemPrintClick(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.PrintReport(KodGurnal);
  AfterReport;
end;

procedure TfmGurnal.TBItemDesignReportClick(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.DesignTailReport(KodGurnal);
  AfterReport;
end;

procedure TfmGurnal.TBItemWhereClick(Sender: TObject);
begin
//
end;

//------------------------------------------------------------------------
function TfmGurnal.GridSeekZAGS(var sZAGS:String):String;
var
//  fld : TField;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
//  i:Integer;
begin
  Result:='';
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_NAMEORG');
  if Opis<>nil then begin
//    v := fld.Value;
    if sZAGS='' then  v:=null else v:=sZAGS;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      sZags:=VarToStr(v);
      Result:='ID_ZAGS='+sZags;
    end else begin
      sZags:='';
    end;
  end;
end;

//------------------------------------------------------------------------
function TfmGurnal.ChoiceBASE(var nCurID:Integer):String;
var
//  fld : TField;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
//  i:Integer;
begin
  Result:='';
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_NAMEORG_OCH');
  if Opis<>nil then begin
    if nCurID=0 then v:=null else v:=nCurID;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      Result:=GetValueFieldEx(arrRec,'KNAME','');
      nCurID:=v;
    end;
  end;
end;
//------------------------------------------------------------------------
procedure TfmGurnal.GridTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
var
  sZags,strFilter,sField : String;
  CurValue:TParamFieldFlt;
//  tb : TAdsTable;
begin
 // FRunSetUp:=true;
//  tb:=nil;
 if (DataSource.DataSet is TAdsTable) or (DataSource.DataSet is TAdsQuery) then begin
   CurValue:=nil;
   sField:=UpperCase(Column.FieldName);
   if sField='ID_ZAGS' then begin
     sZags:=Column.Field.AsString;
     strFilter:=GridSeekZAGS(sZags);
     if sZAGS<>'' then begin
       CurValue:=TParamFieldFlt.Create;
       CurValue.Empty:=true;  // !!!   типа нет текущих значений для поиска
       CurValue.Value1:=sZAGS;
       CurValue.TypeSr:=tsRavno;
       CurValue.Registr:=false;
     end;
   end else if sField='WORK_SPR' then begin
     CurValue:=TParamFieldFlt.Create;
     CurValue.AOwner:=self;
     CurValue.Empty:=true;  // !!!   типа нет текущих значений для поиска
     CurValue.OpisEdit:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK');
     strFilter := GridSeekColumn(Column, true, false, CurValue);
//     CurValue.Free;
   end else if sField='DOLG_SPR' then begin
     CurValue:=TParamFieldFlt.Create;
     CurValue.AOwner:=self;
     CurValue.Empty:=true;  // !!!   типа нет текущих значений для поиска
     CurValue.OpisEdit:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_DOLG');
     strFilter := GridSeekColumn(Column, true, false, CurValue);
//     CurValue.Free;
   end else begin
     CurValue:=TParamFieldFlt.Create;
     CurValue.AOwner:=self;
     CurValue.Empty:=true;  // !!!   типа нет текущих значений для поиска
     strFilter := GridSeekColumn(Column, true, false, CurValue);
//     CurValue.Free;
   end;
   if Length(strFilter)>0 then begin
     GlobalTask.WriteToLogFile(KodGurnal+' set filter='+strFilter, nil, LOG_SQL);  // LOG_FILTER ???
     Query.Filter:=strFilter;
     Query.Filtered:=true;
     EnableItem(TBItemClrFlt, true);
//     TBItemClrFlt.Enabled:=true;
   end;
   if CurValue<>nil
     then CurValue.Free;
 end;
 // FRunSetUp:=false;
end;

procedure TfmGurnal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if (Key=VK_F4) and (Shift=[]) then begin
//    if Grid.SelectedIndex>-1 then begin
//      GridTitleBtnClick(Grid, Grid.SelectedIndex,
//        Grid.Columns[Grid.SelectedIndex]);
//    end;
  if (Key=VK_F11) and (Shift=[ssShift]) then begin
    ShowWinQuery;
  end;
end;
procedure TfmGurnal.ShowWinQuery;
var
  s:String;
begin
  if Role.SystemAdmin=true then begin
    if not MemoRead('last.sql',s) then s:='';
    ShowFormQuery( dmBase.GetPropertyAds, dmBase.IniSysParams, true, s,false,nil);
  end;
end;
//----------------------------------------------------------
procedure TfmGurnal.TBItemClrFltClick(Sender: TObject);
begin
  ClearFilter;
end;
//----------------------------------------------------------
procedure TfmGurnal.BeforeClearFilter;
begin
 // !!!
end;
//----------------------------------------------------------
procedure TfmGurnal.SetQueryFiltered(l:Boolean);
begin
  Query.Filtered:=l;
  if l
    then GlobalTask.WriteToLogFile(KodGurnal+' set filter='+Query.Filter, nil, LOG_SQL);
end;

procedure TfmGurnal.ClearFilter;
var
  strSQL : String;
begin
  BeforeClearFilter;
  AdditiveWhere_Check:=0;
  strSQL := ChangeWhere(Query.SQL.Text, FFilterJurnal.GetDefaultWhere, false);
  if FFilterJurnal.DefaultOrderBy<>'' then begin
    strSQL := ChangeOrderBy(strSQL, FFilterJurnal.DefaultOrderBy);
  end;
  FFltCaption:='';
  SetCaptionGurnal;
  FNewSQL:=strSQL;
  Query.Filter:='';
  Query.OnFilterRecord := nil;
  Refresh(true);
  FNewSQL:='';
  EnableItem(TBItemClrFlt, false);
//  TBItemClrFlt.Enabled:=false;
  CheckAddOtbor;
end;

procedure TfmGurnal.TBItemOrderClick(Sender: TObject);
var
  strOrder : String;
  strSQL : String;
  fl : TFindList;
begin
  FRun:=true;
  try

  if IsSetFilter then begin //TBItemClrFlt.Enabled then begin
     fl := FFilterInterface.Filter;
  end else begin
     fl := FFilterInterface.Filter;
//     fl := FOrderList;
  end;
  if fl <> nil then begin
//    fl.OrderList.AddNew('ORDER_N_FAMILIA',true,false);   vadim
//    fl.OrderList.AddNew('ORDER_N_NAME',true,false);
    if FFilterInterface.EditOrderBy( fl ) then begin
      strOrder := FFilterInterface.GetOrderBy( fl );
      if strOrder <> '' then begin
        strOrder:= StringReplace(strOrder,'*.','',[rfReplaceAll]);  // !!!  fmGurnAlKn
        strSQL  := ChangeOrderBy(Query.SQL.Text, strOrder);
        FNewSQL := strSQL;
        Refresh(true);
        FNewSQL:='';
      end;
    end;
//    FFilterInterface.GetCurrentOrderByName;
  end;

  finally
    FRun:=false;
  end;
end;

procedure TfmGurnal.TBItemRepeatFilterClick(Sender: TObject);
var
  strSQL : String;
  strOrderBy : String;
begin
  FRun:=true;
  try

  strSQL := FilterInterface.GetCurrentSQL;
  FilterInterface_CurrentSQL:=strSQL;
  FFltCaption:='';
  SetCaptionGurnal;
  if strSQL <> '' then begin
    if FilterInterface.Filter.Caption='' then FFltCaption:='*'
                                         else FFltCaption:=FilterInterface.Filter.Caption;
    SetCaptionGurnal;
    strSQL  := ChangeWhere(Query.SQL.Text, strSQL , false);
    if strOrderBy<>'' then begin
      strSQL  := ChangeOrderBy(strSQL, strOrderBy);
    end;
    FNewSQL := strSQL;
    Refresh(true);
    FNewSQL:='';
    EnableItem(TBItemClrFlt, true);
//    TBItemClrFlt.Enabled:=true;
    CheckAddOtbor;
  end;

  finally
    FRun:=false;
  end;
end;

procedure TfmGurnal.TBSubmenuItemFilterClick(Sender: TObject);
var
  strSQL : String;
  strOrderBy : String;
begin
  FRun:=true;
  try

  if FilterInterface.Edit then begin
    strOrderby := FilterInterface.GetCurrentOrderBy;
    if strOrderBy='' then begin
      strOrderBy := FFilterJurnal.DefaultOrderBy;
    end;
    FCheckDateFiks:=true;                    //       !!!
    CreateAdditiveWhere(getAdditiveWhere);   // vadim !!!
    FCheckDateFiks:=false;                   //       !!!

    strSQL := FilterInterface.GetCurrentSQL;
    FilterInterface_CurrentSQL:=strSQL;

    if FilterInterface.Filter.Caption='' then FFltCaption:='*'
                                         else FFltCaption:=FilterInterface.Filter.Caption;
    SetCaptionGurnal;
    if strSQL <> '' then begin
      strSQL  := ChangeWhere(Query.SQL.Text, strSQL , false);
      if strOrderBy<>'' then begin
        strSQL  := ChangeOrderBy(strSQL, strOrderBy);
      end;
      FNewSQL := strSQL;
      Refresh(true);
      FNewSQL:='';
      EnableItem(TBItemClrFlt, true);
//      TBItemClrFlt.Enabled:=true;
      CheckAddOtbor;
    end;
  end;
  BuildMenuChoiceFlt; //FilterInterface.BuildFilterMenu2(TBSubChoiceFlt,nil);
  finally
    FRun:=false;
  end;
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnal.TBItemSetFilterClick(Sender: TObject);
var
  strSQL : String;
  strOrderBy : String;
begin
  FRun:=true;
  try

  if FilterInterface.Edit then begin
    strOrderby := FilterInterface.GetCurrentOrderBy;
    if strOrderBy='' then begin
      strOrderBy := FFilterJurnal.DefaultOrderBy;
    end;
    FCheckDateFiks:=true;                    //       !!!
    CreateAdditiveWhere(getAdditiveWhere);   // vadim !!!
    FCheckDateFiks:=false;                   //       !!!

    strSQL := FilterInterface.GetCurrentSQL;
    FilterInterface_CurrentSQL:=strSQL;

    if FilterInterface.Filter.Caption='' then FFltCaption:='*'
                                         else FFltCaption:=FilterInterface.Filter.Caption;
    SetCaptionGurnal;
    if strSQL <> '' then begin
      strSQL  := ChangeWhere(Query.SQL.Text, strSQL , false);
      if strOrderBy<>'' then begin
        strSQL  := ChangeOrderBy(strSQL, strOrderBy);
      end;
      FNewSQL := strSQL;
      Refresh(true);
      FNewSQL:='';
      EnableItem(TBItemClrFlt, true);
//      TBItemClrFlt.Enabled:=true;
      CheckAddOtbor;
    end;
  end;
  BuildMenuChoiceFlt; //FilterInterface.BuildFilterMenu2(TBSubChoiceFlt,nil);

  finally
    FRun:=false;
  end;
end;
//-----------------------------------------
procedure TfmGurnal.CheckAddOtbor;
var
  l:Boolean;
begin
  if TBItemIsklOtbor.Visible then begin
    l:=ClrFltEnabled and FSeekAsQuery_Active;
    EnableItem(TBItemAddOtbor, l);
    EnableItem(TBItemIsklOtbor, l);
//    TBItemAddOtbor.Enabled:=TBItemClrFlt.Enabled and FSeekAsQuery_Active;
//    TBItemIsklOtbor.Enabled:=TBItemClrFlt.Enabled and FSeekAsQuery_Active;
  end;
end;

{ TFilterJurnal }

procedure TFilterJurnal.AddEl;
begin
  SetLength(FArrFlt, Length(FArrFlt)+1);
end;

procedure TFilterJurnal.AddOrder(Caption, Alias, FieldName: String;  TypeField : TFindFieldKinds; CaseSensitive: Boolean);
var
  Order : TOrderField;
begin
  Order := TOrderField.Create;
  Order.Caption   := Caption;
  Order.Alias     := Alias;
  Order.FieldName := FieldName;
  Order.TypeField := TypeField;
  Order.CaseSensitive := CaseSensitive;
  FOrderList.Add( Order );
end;
//------------------------------------------------------
procedure TFilterJurnal.ClearOrders;
var
  i : Integer;
begin
  for i:=0 to CountOrders-1 do begin
    TOrderField(FOrderList.Items[i]).Free;
    FOrderList.Items[i] := nil;
  end;
  FOrderList.Clear;
end;
//------------------------------------------------------
function TFilterJurnal.CountOrders: Integer;
begin
  Result := FOrderList.Count;
end;
//------------------------------------------------------
constructor TFilterJurnal.Create(Jurnal: TfmGurnal);
begin
  FOrderList := TList.Create;
  SetLength(FArrFlt,0);
  FJurnal := Jurnal;
  FWhere := '';
end;
//------------------------------------------------------
destructor TFilterJurnal.Destroy;
var
  i : Integer;
begin
  for i:=0 to CountOrders-1 do begin
    TOrderField(FOrderList.Items[i]).Free;
  end;
  FOrderList.Free;
  SetLength(FArrFlt,0);
  inherited;
end;

function TFilterJurnal.GetDefaultWhere: String;
var
  s:String;
begin
  Result:=FDefaultWhere;
  if Jurnal<>nil then begin
    s:=Jurnal.getDefaultAddWhere;
    if s<>'' then begin
      if Result='' then Result:=s
                   else Result:=Result+' and ('+s+')';
    end;
  end;
end;

function TFilterJurnal.GetOrder( I : Integer) : TOrderField;
begin
  Result := nil;
  if I < CountOrders then begin
    Result := TOrderField(FOrderList.Items[i]);
  end;
end;

//procedure TFilterJurnal.SetAdditiveWhere(const Value: String);
//begin
//  FAdditiveWhere := Value;
//end;

//function TFilterJurnal.SetFilter: TModalResult;
//begin
//  Result := SetFilterJurnal(Self);
//end;


//---------------------------------------------------------------------------------
procedure TfmGurnal.SetTypeEditObj(const Value: Integer);
begin
  FTypeEditObj := Value;
end;
//---------------------------------------------------------------------------------
procedure TfmGurnal.SetCurGodGurnal(const Value: Integer);
begin
  FCurGodGurnal:=Value;
end;
//---------------------------------------------------------------------------------
procedure TfmGurnal.CheckGurnalZAGS;
begin
{$IFDEF ZAGS}
  FIdZAGS:=GlobalTask.ParamAsInteger('ID');
  if (TypeEditObj=dmBase.TypeObj_ZBrak) or (TypeEditObj=dmBase.TypeObj_ZRast) or (TypeEditObj=dmBase.TypeObj_ZRogd) or
     (TypeEditObj=dmBase.TypeObj_ZSmert) or (TypeEditObj=dmBase.TypeObj_ZUstOtc) or (TypeEditObj=dmBase.TypeObj_ZAdopt) or
     (TypeEditObj=dmBase.TypeObj_ZChName) or (TypeEditObj=dmBase.TypeObj_ZUstMat) then begin
    FGurnalZAGS:=true;
    TBItemLastSvid.Visible:=true;
  end else begin
    TBItemLastSvid.Visible:=false;
  end;
{$ELSE}
  FIdZAGS:=0;
  TBItemLastSvid.Visible:=false;
{$ENDIF}
end;

//---------------------------------------------------------------------------------
function TfmGurnal.GetTypeEditObj: Integer;
var
  fld:TField;
  nType:Integer;
begin
  if FInterObj then begin
    nType:=0;
    fld:=Query.FindField('TYPEOBJ');
    if fld<>nil then begin
      nType:=fld.AsInteger;
    end else begin
      fld:=Query.FindField('TYPEDOK');
      if fld<>nil then begin
        nType:=fld.AsInteger;
      end;
    end;
    if nType=0 then begin
      nType:=FTypeEditObj;
    end;                             
    Result:=nType;
  end else begin
    Result:=FTypeEditObj;
  end;
end;

//---------------------------------------------------------------------------------
procedure TfmGurnal.QueryAfterScroll(DataSet: TDataSet);
begin
  if not FRun then begin
    if Query.Eof and Query.Bof then begin
      EnableItem(TBItemEdit, false);
      EnableItem(TBItemDelDok, false);
//      TBItemEdit.Enabled:=false;
//      TBItemDelDok.Enabled:=false;
    end else begin
      EnableItem(TBItemEdit, true);
      EnableItem(TBItemDelDok, FEnableWrite and not FDemo);
//      TBItemEdit.Enabled:=true;
//      TBItemDelDok.Enabled:=FEnableWrite and not FDemo;
    end;
  end;
end;

procedure TfmGurnal.UpdateActions;
begin
  inherited;
  EnableItem(TBItemRepeatFilter, ClrFltEnabled);
//  TBItemRepeatFilter.Enabled := TBItemClrFlt.Enabled;
  AddUpdateActions;
end;

procedure TfmGurnal.AfterConstruction;
begin
  inherited;
end;

//--------------------------------------------------
// после получения отчета
procedure TfmGurnal.AfterReport;
begin
//
end;

//--------------------------------------------------
// перед получением отчета
procedure TfmGurnal.BeforeReport;
begin
  SetDateFiksReport(DateFiks);
end;

procedure TfmGurnal.SetFilterInterface(const Value: TFilterInterface);
begin
  FFilterInterface := Value;
end;

procedure TfmGurnal.TBItemPrintGridClick(Sender: TObject);
var
  f : TfmPrintGrid;
begin
  f := TfmPrintGrid.Create(nil);
  f.Grid := Grid;
  try
    f.ShowModal;
  finally
    f.Free;
  end;
end;

//----------------------------------------------------------
//function TfmGurnal.GetNameReport(strID: String): String;
//begin
//  Result := strID;
//end;

//-----------------------------------------------------------
procedure TfmGurnal.TBItemQueryClick(Sender: TObject);
begin
  FFilterInterface.EditCurrentGroupBy( ClrFltEnabled );
  FilterInterface.BuildGroupMenu2(TBSubmenuGroup, OnMenuGroupClick);
end;

//-----------------------------------------------------------
procedure TfmGurnal.TBItemGrupOneClick(Sender: TObject);
var
  sField:String;
begin
  if Grid.SelectedField<>nil then begin
    if Grid.SelectedField.FieldName='TRUD' then begin
      sField:='FLD_IS_TRUD';
    end else begin
      sField:=Grid.SelectedField.FieldName;
    end;
    FFilterInterface.ShowFieldGroupBy(sField, ClrFltEnabled, Grid.Columns[Grid.SelectedIndex].Width);
    FilterInterface.BuildGroupMenu2(TBSubmenuGroup, OnMenuGroupClick);
  end;
end;

procedure TfmGurnal.QueryAfterOpen(DataSet: TDataSet);
begin
  Screen.Cursor := crDefault;
end;

procedure TfmGurnal.QueryBeforeOpen(DataSet: TDataSet);
begin
  Screen.Cursor := crHourGlass;
  GlobalTask.WriteToLogFile(KodGurnal+' '+Query.SQL.Text, nil, LOG_SQL);
end;

procedure TfmGurnal.TBItemExportClick(Sender: TObject);
var
  strBookmark:String;
  sl:TStringList;
begin
  FRun:=true;
  FRunExport:=true;
  sl:=TStringList.Create;
  GetBookmark(sl);
  try
    CheckExport;
    strBookmark:=Query.Bookmark;
    ExportDataSet('Экспорт;'+KodGurnal, Query, efRtf, [], GetFolderMyDocument, False, False, ExportColumns, sl);
    try
      Query.Bookmark:=strBookmark;
    except
      Query.First;
    end;
  finally
    FRun:=false;
    FRunExport:=false;
    sl.Free;
  end;
end;                                                     

procedure TfmGurnal.AddUpdateActions;
begin
//
end;

procedure TfmGurnal.SetDefCountExport(const Value: Integer);
begin
  FDefCountExport := Value;
end;

procedure TfmGurnal.TBItemCountClick(Sender: TObject);
var
  cur : TCursor;
  i,n : Integer;
  bm : String;
begin
  FRun:=true;
  try
  
  cur := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  if Query.Filtered then begin
    Query.DisableControls;
    bm := Query.Bookmark;
    Query.First;
    i:=0;
    while not Query.Eof do begin
      Inc(i,1);
      Query.Next;
    end;
    Query.Bookmark := bm;
    Query.EnableControls;
  end else begin
    n:=Pos('FROM ',Query.SQL.Text);
    if n>0 then begin
      TmpQuery.SQL.Text:='SELECT Count(*) '+Copy(Query.SQL.Text, n, Length(Query.SQL.Text));
      n:=LastPos('ORDER BY ',TmpQuery.SQL.Text);
      if n>0 then begin
        TmpQuery.SQL.Text:=Copy(TmpQuery.SQL.Text, 1, n-1);
      end;
      for i:=0 to TmpQuery.ParamCount-1 do begin
        if AnsiCompareText(TmpQuery.Params[i].Name, 'DATEFIKS') = 0 then begin
          try
            TmpQuery.Params[i].AsDateTime := DateFiks;
          except
          end;
        end else begin
          SetQueryParam(TmpQuery.Params[i]);
        end;
      end;
      TmpQuery.Open;
      i:=TmpQuery.Fields[0].AsInteger;
      TmpQuery.Close;
    end else begin
      i := Query.RecordCount;
    end;
  end;
  Screen.Cursor := cur;
  Application.BringToFront;
  ShowMessageCont(IntToStr(i),self);
  finally
    FRun:=false;
  end;
end;

procedure TfmGurnal.TBItemPokazClick(Sender: TObject);
begin
  if EditVisiblePokaz(FPokaz) then begin
    CheckPropertyGridColumns;
  end;
end;

procedure TfmGurnal.N1Click(Sender: TObject);
begin
  Self.WindowState:=wsNormal;
  Application.ProcessMessages;
  Self.Top    := 5;
  Self.Left   := 5;
  Self.Width  := fmMain.ClientWidth-30;
  Self.Height := fmMain.ClientHeight-70;
end;

class function TfmGurnal.EnableOpen: Boolean;
begin
  Result := true;
end;

procedure TfmGurnal.SetListParEditForm;
begin
  FListPar.Clear;
end;
procedure TfmGurnal.SetListParAddForm;
begin
  FListPar.Clear;
end;

function TfmGurnal.GetStrSystemFilter(lWhere:Boolean) : String;
begin    
  Result:='';
  if lWhere then begin
    if FTypeVisibleMens=0 then begin // исключить
      if (TypeEditObj = dmBase.TypeObj_Nasel) then begin
        if FRed    then Result:=Result+'and n.candelete=false ';
        if FBlue   then Result:=Result+'and not (n.propis=true and n.candelete=false and n.present=false) ';
        if FGreen1 then Result:=Result+'and not (n.propis=false and n.candelete=false and n.adres_id=0) ';
        if FGreen2 then Result:=Result+'and not (n.propis=false and n.candelete=false and n.adres_id>0) ';
        if FUnderline  then Result:=Result+'and not (n.candelete=false and n.propis=true and n.present=true and n.date_srok_dn is not null)';
        if FOldCopyMen then Result:=Result+'and (n.new_id=0 or n.candelete=false)';
//        if FRiap   then Result:=Result+'and (new_id=0 and (not_riap is null or not_riap=false))';
//        if FRiap   then Result:=Result+'and (n.adres_id>0 and n.lic_id>0 and (not_riap is null or not_riap=false))';
      end else begin  // для алфавитной книги
        if FRed    then Result:=Result+'and l.candelete=false ';
        if FBlue   then Result:=Result+'and not (n.propis=true and n.candelete=false and n.present=false) ';
        if FGreen2 then Result:=Result+'and not (n.propis=false and n.candelete=false) ';
        if FGreen1 then Result:=Result+'and (n.candelete=false or l.candelete=true) ';
      end;
    end else begin       //
      if (TypeEditObj = dmBase.TypeObj_Nasel) then begin
        if FRed    then Result:=Result+'or  n.candelete=true ';
        if FBlue   then Result:=Result+'or  (n.propis=true and n.candelete=false and n.present=false) ';
        if FGreen1 then Result:=Result+'or  (n.propis=false and n.candelete=false and n.adres_id=0) ';
        if FGreen2 then Result:=Result+'or  (n.propis=false and n.candelete=false and n.adres_id>0) ';
        if FUnderline  then Result:=Result+'or  (n.candelete=false and n.propis=true and n.present=true and n.date_srok_dn is not null)';
        if FOldCopyMen then Result:=Result+'or  (n.new_id>0 and n.candelete=true)';
//        if FRiap   then Result:=Result+'and not (new_id=0 and (not_riap is null or not_riap=false))';
      end else begin  // для алфавитной книги
        if FRed    then Result:=Result+'or  l.candelete=true ';
        if FBlue   then Result:=Result+'or  (n.propis=true and n.candelete=false and n.present=false) ';
        if FGreen2 then Result:=Result+'or  (n.propis=false and n.candelete=false) ';
        if FGreen1 then Result:=Result+'or  ((n.candelete=true or n.candelete is null) and l.candelete=false) ';    //
      end;
    end;
    if Result<>'' then Result:='( '+Trim(Copy(Result,5,Length(Result)))+' )';
  end else begin
    if FTypeVisibleMens=0 then begin // исключить
      if FRed    then Result:=Result+'.and. candelete=.f.';
      if FBlue   then Result:=Result+'.and. .not.(propis=.t. .and. candelete=.f. .and. present=.f.)';
      if (TypeEditObj = dmBase.TypeObj_Nasel) then begin
        if FGreen1 then Result:=Result+'.and. .not.(propis=.f. .and. candelete=.f. .and. adres_id=0)';
        if FGreen2 then Result:=Result+'.and. .not.(propis=.f. .and. candelete=.f. .and. adres_id>0)';
        if FUnderline then  Result:=Result+'.and. .not.(propis=.t. .and. present=.t. .and. candelete=.f. .and. !empty(date_srok_dn))';
        if FOldCopyMen then Result:=Result+'.and. (new_id=0 .or. candelete=.f.) )';
//        if FRiap   then Result:=Result+'.and. (new_id=0  .and. empty(not_riap))';
      end else begin  // для алфавитной книги
        if FGreen1 then Result:=Result+'.and. .not.(propis=.f. .and. candelete=.f.)';
      end;
    end else begin       //
      if FRed    then Result:=Result+'.or.  candelete=.t.';
      if FBlue   then Result:=Result+'.or.  (propis=.t. .and. candelete=.f. .and. present=.f.)';
      if (TypeEditObj = dmBase.TypeObj_Nasel) then begin
        if FGreen1 then Result:=Result+'.or.  (propis=.f. .and. candelete=.f. .and. adres_id=0)';
        if FGreen2 then Result:=Result+'.or.  (propis=.f. .and. candelete=.f. .and. adres_id>0)';
        if FUnderline then  Result:=Result+'.or.  (propis=.t. .and. present=.t. .and. candelete=.f. .and. !empty(date_srok_dn))';
        if FOldCopyMen then Result:=Result+'.or.  (new_id>0 .and. candelete=.t.)';
//        if FRiap   then Result:=Result+'.and. .not. (new_id=0 .and. empty(not_riap))';
      end else begin  // для алфавитной книги
        if FGreen1 then Result:=Result+'.or.  (propis=.f. .and. candelete=.f.)';
      end;
    end;
    if Result<>'' then Result:='( '+Trim(Copy(Result,7,Length(Result)))+' )';
  end;
  if Result='' then FSysFltCaption:=''
               else FSysFltCaption:='[ВКЛ.СИСТЕМ.ОТБОР]';
end;

procedure TfmGurnal.TBItemSysFltClick(Sender: TObject);
var
  f : TfmVisibleMensGurnal;
  lCheck:Boolean;
begin
  f := TfmVisibleMensGurnal.Create(Self);
  if KodGurnal='fmGurnAlfKn' then begin
    f.cbCanDelete.Caption:='Ликвидированные лицевые счета';
    f.cbTmpUbit.Caption:='Глава лицевого счета временно отсутствует';
    f.cbGreenMy.Caption:='Глава лицевого счета не зарегистрирован';
    f.cbGreenNotMy.Visible:=true;
    f.Image1.Visible:=true;
    f.RxLabel1.Color:=clBtnFace;
    f.RxLabel1.Left:=f.Image1.Left+25;
    f.RxLabel1.Caption:='Нет главы лицевого счета';
    f.cbZaregSrok.Visible:=false;
    f.cbOldCopyMen.Visible:=false;
    f.ClientHeight:=f.cbGreenNotMy.Top+f.cbGreenNotMy.Height+f.Panel1.Height+5;
  end;
  f.edType.ItemIndex:=FTypeVisibleMens;
  f.cbCanDelete.Checked:=FRed;
  f.cbTmpUbit.Checked:=FBlue;
  f.cbGreenNotMy.Checked:=FGreen1;
  f.cbGreenMy.Checked:=FGreen2;
  f.cbZaregSrok.Checked:=FUnderline;
  f.cbOldCopyMen.Checked:=FOldCopyMen;
//  f.cbRiap.Checked:=FRiap;
  lCheck:=false;
  try
    f.cbGreenNotMy.Color:=clInfoBk;
    if f.ShowModal = mrOk then begin
      if f.edType.ItemIndex=-1 then f.edType.ItemIndex:=0;
      FTypeVisibleMens:=f.edType.ItemIndex;
      FRed:=f.cbCanDelete.Checked;
      FBlue:=f.cbTmpUbit.Checked;
      FGreen1:=f.cbGreenNotMy.Checked;
      FGreen2:=f.cbGreenMy.Checked;
      FUnderline:=f.cbZaregSrok.Checked;
      FOldCopyMen:=f.cbOldCopyMen.Checked;
//      FRiap:=f.cbRiap.Checked;
//      strFilter:=GetStrSystemFilter(true);
      lCheck:=true;
    end;
  finally
    f.Free;
  end;
  Application.ProcessMessages;  
  if lCheck then begin
    CreateAdditiveWhere2Refresh;
  end;
  Application.ProcessMessages;
end;

//---------------------------------------------------------------------
function TfmGurnal.getYearWhere: String;
var
  n:Integer;
begin
// если AdditiveWhere_Check=1  ,то в тексте условия WHERE фильтра есть использование DATEZ !!!
  if (AdditiveWhere_Check=0) and FCheckGodGurnal then begin
    n:=FCurGodGurnal;
    if n<=0 then n:=YearOf(dmBase.getCurDate);
    Result:='Year(datez)='+IntToStr(n);
  end else begin
    Result:='';
  end;
end;

function TfmGurnal.getAdditiveWhere: String;
begin
  Result:=getYearWhere;
end;
function TfmGurnal.getDefaultAddWhere: String;
begin
  Result:=getYearWhere;
end;

procedure TfmGurnal.GridColumnsISKL(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
{$IFDEF OCHERED}
var
  fld:TField;
{$ENDIF}
begin
  if not EditMode then begin
    Params.ImageIndex:=Query.FieldByName('N_ISKL').AsInteger; //StrToInt(Params.Text);
  end;
end;

procedure TfmGurnal.GridColumnsFIRST(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if not EditMode then begin
    Params.ImageIndex:=Query.FieldByName('NFIRST').AsInteger-1;
  end;
end;

procedure TfmGurnal.GridColumnsCANDELETE_FIRST(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if not EditMode then begin
    Params.ImageIndex:=Query.FieldByName('CANDELETE_FIRST').AsInteger;
    if (Params.ImageIndex=1) or Query.FieldByName('CANDELETE').AsBoolean then begin
      Params.ImageIndex:=-1;
    end;
  end;
end;

function TfmGurnal.getID:String;
var
  fld:TField;
begin
  Result:='';
  fld:=Query.FindField('ID');
  if fld<>nil then begin
    Result:=fld.AsString;
  end;
end;
//-----------------------------------------------
// дополнительная проверка на доступность регистрации
function TfmGurnal.IsRegisterGisun : Boolean;
begin
  Result:=true;
end;
//---------------------------------------------------------------------
procedure TfmGurnal.CreateSysFlt_GISUN(slPar:TStringList);
{$IFDEF GISUN}
var
  itDop : TTbItem;
{$ENDIF}
begin
  {$IFDEF GISUN}
  if IsActiveGISUN then begin
//       if Gisun.IsEnableTypeAkt(FTypeObj,IsAktVosstan) then begin

    if TBSubSysFlt.Count>0 then begin
      TBSubSysFlt.Add(TTbSeparatorItem.Create(TBSubSysFlt));
    end;

    itDop := TTbItem.Create(TBSubSysFlt);
    itDop.Images:=ImageListGisun;
    itDop.ImageIndex:=3;
    itDop.Caption:= 'Данные отправлены в '+_GIS_;
    itDop.OnClick:=Event_POLE_GRN_3;
    TBSubSysFlt.Add(itDop);

    itDop := TTbItem.Create(TBSubSysFlt);
    itDop.Images:=ImageListGisun;
    itDop.ImageIndex:=2;
    itDop.Caption:= 'Осуществлен только запрос данных из '+_GIS_;
    itDop.OnClick:=Event_POLE_GRN_2;
    TBSubSysFlt.Add(itDop);

    if FRegisterNotRequired then begin
      itDop := TTbItem.Create(TBSubSysFlt);
      itDop.Images:=ImageListGisun;
      itDop.ImageIndex:=1;
      itDop.Caption:= 'Не подлежит отправке в '+_GIS_;
      itDop.OnClick:=Event_POLE_GRN_1;
      TBSubSysFlt.Add(itDop);
    end;

    itDop := TTbItem.Create(TBSubSysFlt);
    itDop.Images:=ImageListGisun;
    itDop.ImageIndex:=0;
    itDop.Caption:= 'Взаимодействие с '+_GIS_+' не осуществлялось';
    itDop.OnClick:=Event_POLE_GRN_0;
    TBSubSysFlt.Add(itDop);

    if FGurnalZAGS then begin
      itDop := TTbItem.Create(TBSubSysFlt);
      itDop.Images:=ImageListGisun;
  //    itDop.ImageIndex:=0;
      itDop.Caption:= 'Корректировка после взаимодействия с '+_GIS_;
      itDop.OnClick:=Event_Check_Corr_GRN;
      TBSubSysFlt.Add(itDop);
    end;

  end;
  {$ENDIF}
end;
//----------------------------------------------------------------------
procedure TfmGurnal.Event_Check_Corr_GRN(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'EDIT_GIS=1';
  Query.Filtered := true;
  EnableItem(TBItemClrFlt, true);
//  TBItemClrFlt.Enabled:=true;
end;
//----------------------------------------------------------------------
procedure TfmGurnal.Event_POLE_GRN_1(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'pole_grn=1000';
  Query.Filtered := true;
  EnableItem(TBItemClrFlt, true);
//  TBItemClrFlt.Enabled:=true;
end;
//----------------------------------------------------------------------
procedure TfmGurnal.Event_POLE_GRN_2(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'pole_grn>=2000 and pole_grn<3000';
  Query.Filtered := true;
  EnableItem(TBItemClrFlt, true);
//  TBItemClrFlt.Enabled:=true;
end;
//----------------------------------------------------------------------
procedure TfmGurnal.Event_POLE_GRN_3(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'pole_grn>=3000 and pole_grn<4000';
  Query.Filtered := true;
  EnableItem(TBItemClrFlt, true);
//  TBItemClrFlt.Enabled:=true;
end;
//----------------------------------------------------------------------
procedure TfmGurnal.Event_POLE_GRN_0(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'pole_grn<1000 or Empty(pole_grn)';
  Query.Filtered := true;
  EnableItem(TBItemClrFlt, true);
//  TBItemClrFlt.Enabled:=true;
end;
//----------------------------------------------------------------------
procedure TfmGurnal.Event_RunDelete(Sender: TObject);
var
  n:Integer;
  cur:TCursor;
begin
  if ClrFltEnabled then begin
    if Problem(QuestDelFlt+' ?',mtConfirmation,self) then begin
      cur:=Screen.Cursor;
      Screen.Cursor:=crHourGlass;
      OpenMessage('Подсчет количества ...', '', 0);
      Query.DisableControls;
      Query.First;
      n:=0;
      try
        dmBase.AdsConnection.Execute('DELETE FROM Временная');
        while not Query.Eof do begin
          dmBase.AdsConnection.Execute('INSERT INTO Временная (ID) VALUES ('+Query.FieldByName('ID').AsString+')');
          Query.Next;
          n:=n+1;
          Application.ProcessMessages;
        end;
      finally
        Query.First;
        Query.EnableControls;
        CloseMessage;
        Screen.Cursor:=cur;
      end;
      if n>0 then begin
        if RunDelete(n) then begin
          TBItemClrFltClick(nil);
        end;
      end;
    end;
  end;
end;
//--------------------------------------------------------------------
function TfmGurnal.RunDelete(nCount:Integer):Boolean;
var
  sl:TStringList;
begin
  Result:=true;
  sl:=TStringList.Create;
  sl.Add(intToStr(nCount));
  sl.Add('------------------');
  dmBase.WorkQuery.SQL.Text:='select * from временная';
  dmBase.WorkQuery.Open;
  while not dmBase.WorkQuery.Eof do begin
    sl.Add(dmBase.WorkQuery.FieldByName('ID').AsString);
    dmBase.WorkQuery.next;
  end;
  dmBase.WorkQuery.Close;
  ShowStrings(sl,'');
  sl.Free;
end;
//----------------------------------------------------------------------
procedure TfmGurnal.Event_ClearPoleGRN(Sender: TObject);
var
  tb :TAdsTable;
begin
  if not Query.FieldByName('DATEZ').IsNull and (Query.FieldByName('DATEZ').AsDateTime<STOD('2013-07-26',tdAds)) then begin
    if Problem('Очистить поле взаимодействия с '+_GIS_+' ?',mtConfirmation,self) then begin
      tb:=dmBase.MainTableFromTypeObj(TypeEditObj);
      if tb.Locate('ID', Query.FieldByName('ID').AsInteger, []) then begin
        tb.Edit;
        tb.FieldByName('POLE_GRN').AsInteger:=0;
        tb.Post;
        Refresh(false);
      end;
    end;
  end else begin
    PutError('После 26.07.2013г. поле очистить нельзя.',self);
  end;
end;

procedure TfmGurnal.TBItemGrantSpravClick(Sender: TObject);
var
  par : TParamGrantSprav;
  fld:TField;
  n,m:Integer;
begin
  if TBItemGrantSprav.Visible then begin
    par:=TParamGrantSprav.Create;
    if Role.SystemAdmin
      then par.EnableEdit:=true
      else par.EnableEdit:=false;
    par.TypeEditObj:=GetTypeEditObj;
    par.Caption:='';
    par.KodGurnal:=KodGurnal;

    par.VUS:=false;
    fld:=Query.FindField('VUS');
    if fld<>nil then par.VUS:=fld.AsBoolean;
    if UpperCase(KodGurnal)='FMGURNVUS' then par.VUS:=true;

    par.OCHERED:=false;
    fld:=Query.FindField('OCHERED');
    if fld<>nil then par.OCHERED:=fld.AsBoolean;
    if UpperCase(KodGurnal)='FMGURNOCHERED' then par.OCHERED:=true;

//    {$IFDEF ZAGS}
//      n:=par.TypeEditObj;
//    {$ELSE}
//      n:=0;
//    {$ENDIF}
    m:=GetTypeEditObj;
    if dmBase.TypeObjForMens(m) then begin
      n:=0;
    end else begin
      n:=par.TypeEditObj;
    end;
    if n>0 then begin
      par.Caption:='Получить отчет';
    end;
    ExecSprav(getID,par,n,self,FEnableAll);
  end;
end;

//------------------------------------------------
{
procedure TfmGurnal.ClickPunkts;
var
  f:TfmMultiChoice;
  strSQL,s:String;
begin
  f := TfmMultiChoice.Create(Self);
  f.FFieldName:='punkt';
  dmBase.LookupPunkt.First;
  while not dmBase.LookupPunkt.Eof do begin
    f.cbChoice.Items.Add(dmBase.LookupPunkt.FieldByName('NAME').AsString);
    f.FKeyValues.Add(dmBase.LookupPunkt.FieldByName('ID').AsString);
    dmBase.LookupPunkt.Next;
  end;
  dmBase.LookupPunkt.First;
  f.SetValues(FValues_Punkt);
    if f.ShowModal=mrOk then begin      
    s:=f.GetValuesForFilter;
    if s=''
      then FFilter_Punkt:=''
      else FFilter_Punkt:='('+f.GetValuesForFilter+')';
    SetGlobalFilterPunkt(FFilter_Punkt);
    FValues_Punkt:=f.GetValues;
    CreateAdditiveWhere(getAdditiveWhere);
    if TBItemClrFlt.Enabled then begin // установлен фильтр
      strSQL := FilterInterface.GetCurrentSQL;
      if (strSQL<>'') then begin
        TBItemRepeatFilterClick(nil);
      end;
    end else begin
      TBItemClrFltClick(nil);
    end;
  end;
  f.Free;
  Application.ProcessMessages;
end;
}

procedure TfmGurnal.ClickPunkts;
var
  s,ss:String;
begin
  if formChoiceAdres=nil then begin
    formChoiceAdres:=CreateFormChoiceAdres(TYPE_CHOICE_CHECKBOX,dmBase.AdsConnection,false);
    formChoiceAdres.Al:='a.';
  end;
  ChoiceLoadedAdres(s, ss,dmBase.AdsConnection, formChoiceAdres);  // !!! исп-ся как константа alias 'a'
  if s<>'' then begin
    FFilter_Punkt:='('+s+')';                
    SetGlobalFilterPunkt(FFilter_Punkt);
//    FValues_Punkt:=f.GetValues;
    CreateAdditiveWhere2Refresh;
  end;
  Application.ProcessMessages;
end;
//------------------------------------------------------------------------------------------
procedure TfmGurnal.ClearPunkts;
begin
  if FFilter_Punkt<>'' then begin
    FFilter_Punkt:='';
    SetGlobalFilterPunkt(FFilter_Punkt);
    CreateAdditiveWhere2Refresh;
    Application.ProcessMessages;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmGurnal.TBItemLastSvidClick(Sender: TObject);
var
  s1,s2,s3,s4:String;
  tb :TAdsTable;
  st:TSostTable;
begin
  tb:=dmBase.MainTableFromTypeObj(TypeEditObj);
  if TypeEditObj=dmBase.TypeObj_ZRast then begin
    {$IFDEF ZAGS}
    dmBase.GetNewNomerSvidR(s1, s2,s3,s4);
    {$ENDIF}
  end else begin
    dmBase.GetNewNomerSvid(TypeEditObj, tb , s1, s2);
  end;
  if dmBase.FSeekID>0 then begin
    st:=SaveSostTable(tb, false,false);
    if tb.Locate('ID',dmBase.FSeekID,[]) then begin
      if BeforeEdit then begin
        SetListParEditForm;   // заполнить FListPar
        if fmMain.EditDokument(tb, GetTypeEditObj,'ID',FListPar,true, KodGurnal) then begin

        end;
        FListPar.Clear;
      end;
    end else begin
      ShowMessageCont('Свидетельство не найдено.',self);
    end;
    RestSostTable(tb, st);
  end else begin
    ShowMessageCont('Свидетельство не найдено.',self);
  end;
end;

procedure TfmGurnal.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
end;

procedure TfmGurnal.FormDestroy(Sender: TObject);
begin
  CurGurnal:=nil;

//  ShowMessage('FormDestroy  '+FKodGurnal);
end;

procedure TfmGurnal.FormDeactivate(Sender: TObject);
begin
//  ShowMessage('Deactivate  '+FKodGurnal);
        // для показа по дате корретировки записи
          // для показа по дате корретировки записи
end;

procedure TfmGurnal.FormActivate(Sender: TObject);
begin
  CurGurnal:=Self;
//  WriteToDebug([name]);
end;

//--------------------------------------------------------------
procedure TfmGurnal.WriteToDebug(arr:array of Variant);
var
 v:Variant;
 i:Integer;
begin
  for i:=0 to Length(arr)-1 do begin
    RunFuncScript('WriteDebug_',[ arr[i] ],v);
  end;  
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnal.GridColumnsGetPasp(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  p:TPassport;
begin
  p:=dmBase.PasportMen(Query.FieldByName('DATE_FIKS').AsDateTime,Query.FieldByName('ID').AsString);
  Params.Text:=dmBase.PasportToText(p,0);
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnal.GridColumnsGetAdresOwners(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.fieldByName('ADRES_OWNERS').AsString<>'' then begin
//    Params.Text := dmBase.HouseOwners2(Query.FieldByName('date_fiks').AsDateTime,
//                       Query.FieldByName('id').AsString, 1, nil);
    Params.Text := dmBase.HouseOwners(Query.FieldByName('date_fiks').AsDateTime,
                       Query.FieldByName('ADRES_OWNERS').AsString,nil, 1, nil, nil, nil);
  end;
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnal.GridColumnsGetGES(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  {$IFDEF GKH}
  if (Params.Text='') or (Params.Text='0') then begin
    Params.Text:='';
  end else begin
    if dmBase.SprGES.Locate('PARENT;ID_BASE', VarArrayOf([FIdOrgan, Params.Text]), [] ) then begin
      Params.Text:=dmBase.SprGES.FieldByName('NAME').AsString;
    end;
  end;
  {$ENDIF}
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnal.GridColumnsGetID_BASE(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if (Params.Text='') or (Params.Text='0') then begin
    Params.Text:='';
  end else begin
    Params.Text:=fmMain.SprNameOrg( StrToInt(Params.Text), 'К', '');
  end;
end;

procedure TfmGurnal.StBarDrawPanel(StatusBar: TStatusBar;  Panel: TStatusPanel; const Rect: TRect);
begin
  PutStrHelp(Panel.Text, StatusBar.Canvas ,Rect);
end;
//---------------------------------------------------------------------------------------
procedure TfmGurnal.TBItemAddDokClick(Sender: TObject);
var
//  slPar:TStringList;
  sID:String;
begin
  if TBItemAddDok.Visible then begin
    FRun:=true;
    try
      if BeforeEdit then begin
//        slPar:=nil;
        SetListParAddForm;   // заполнить FListPar
        if fmMain.EditDokument(nil, GetTypeEditObj, '-1', FListPar, false, KodGurnal) then begin
          if IDLastDok>0
            then sID:=IntToStr(IDLastDok)
            else sID:='';
          Refresh(true,sID);
        end;
      end;
    finally
      FRun:=false;
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmGurnal.TBItemYearClick(Sender: TObject);
begin
//
end;

{$IF Defined(ZAGS) or Defined(LAIS) }
//--------------------------------------------------------------------------------
//   Журналы учета заявлений ...
//--------------------------------------------------------------------------------

procedure TfmGurnal.EditAktFromGurnalUZ(nTypeAkt:Integer);
var
  slPar:TStringList;
  sID:String;
  tb:TadsTable;
  fldV:TField;
begin
  tb:=dmBase.MainTableFromTypeObj(nTypeAkt);

  if Query.FieldByName('AKT_ID').AsInteger=0 then begin
    PutError(' Запись акта неизвестна. ',self);
  end else begin
    sID:=Query.FieldByName('AKT_ID').aSString;
    if Tb.Locate('ID', sID,[]) then begin
      if BeforeEdit then begin
        fldV:=Tb.FindField('VOSSTAN');
        if (fldV<>nil) and not fldV.IsNull and (fldV.AsBoolean=true) then begin
          slPar:=TStringList.Create;
          slPar.Add('VOSSTAN=1');
        end else begin
          slPar:=nil;
        end;
        fmMain.EditDokument( nil, nTypeAkt, sID, slPar, false, KodGurnal);
        FreeAndNil(slPar);
      end;
    end else begin
      PutError(' Запись акта не найдена. ',self);
    end;
  end;
end;

procedure TfmGurnal.CheckDecl_GurnalUZ(nTypeAkt:Integer; var arr:TarrStrings; tb:TDataSet);
var
  p:TPassport;
  s,s0,s1,s2,s3,s4,s5:String;
begin
  if nTypeAkt=_TypeObj_ZRogd then begin
    CheckDecl(arr,tb.FieldByName('DECL').AsString);
  end else if nTypeAkt=_TypeObj_ZSmert then begin
    s:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZSmert, tb.FieldByName('ID').AsInteger, STOD('1899-12-30',tdAds),
                                  'DECL_DOK', ftMemo);
    CheckDecl(arr,tb.FieldByName('DECL').AsString,s);
  end else if nTypeAkt=_TypeObj_ZUstOtc then begin
//[KEY_UST_FASER]
//1=совместное заявление родителей
//2=решение суда
    SetLength(arr,3);

    s0:=GetPadegFIO( CreateFIO(tb, 'ONA_'), 'Ж', 'И');
    s1:=dmBase.GetAdresAkt3(tb,'ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION,ONA_B_RN;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',1);
    p := dmBase.PasportFromValues(tb.FieldByName('ONA_DOK_TYPE').AsInteger, tb.FieldByName('ONA_DOK_SERIA').AsString,
                                  tb.FieldByName('ONA_DOK_NOMER').AsString, tb.FieldByName('ONA_DOKUMENT').AsString,
                                  '', tb.FieldByName('ONA_DOK_DATE').Value);
    s := dmBase.PasportToText(p,0);
    s2:=s;

    if tb.FieldByName('OSNOV').AsString='1' then begin   // соместное заявление
      SetLength(arr,6);
      arr[0]:=GetPadegFIO( CreateFIO(tb, 'ON_'), 'М', 'И');
      arr[1]:=dmBase.GetAdresAkt3(tb,'ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_B_RN;ON_GOROD,ON_B_GOROD;ON_GOROD_R,ON_*',1);
      p := dmBase.PasportFromValues(tb.FieldByName('ON_DOK_TYPE').AsInteger, tb.FieldByName('ON_DOK_SERIA').AsString,
                                    tb.FieldByName('ON_DOK_NOMER').AsString, tb.FieldByName('ON_DOKUMENT').AsString,
                                    '', tb.FieldByName('ON_DOK_DATE').Value);
      s := dmBase.PasportToText(p,0);
      arr[2]:=s;
      arr[3]:=s0;
      arr[4]:=s1;
      arr[5]:=s2;
    end else begin   // решение суда
      arr[0]:=s0;
      arr[1]:=s1;
      arr[2]:=s2;
    end;                                            
  end else if nTypeAkt=_TypeObj_ZAdopt then begin  // усыновление
    s0:=GetPadegFIO( CreateFIO(tb, 'ON_'), 'М', 'И');
    if s0=''
      then s1:=''
      else s1:=dmBase.GetAdresAkt3(tb,'ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION;ON_GOROD,ON_B_GOROD;ON_GOROD_R',1);
//    p := dmBase.PasportFromValues(tb.FieldByName('ON_DOK_TYPE').AsInteger, tb.FieldByName('ON_DOK_SERIA').AsString,
//                                  tb.FieldByName('ON_DOK_NOMER').AsString, tb.FieldByName('ON_DOK_NAME').AsString,
//                                  '', tb.FieldByName('ON_DOK_DATE').Value);
//    s2:=dmBase.PasportToText(p,0);
    s2:='';
    s3:=GetPadegFIO( CreateFIO(tb, 'ONA_'), 'Ж', 'И');
    if s3=''
      then s4:=''
      else s4:=dmBase.GetAdresAkt3(tb,'ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R',1);
//    p := dmBase.PasportFromValues(tb.FieldByName('ONA_DOK_TYPE').AsInteger, tb.FieldByName('ONA_DOK_SERIA').AsString,
//                                  tb.FieldByName('ONA_DOK_NOMER').AsString, tb.FieldByName('ON_DOK_NAME').AsString,
//                                  '', tb.FieldByName('ONA_DOK_DATE').Value);
//    s5:=dmBase.PasportToText(p,0);
    s5:='';
    if (s0<>'') and (s3<>'') then begin
      SetLength(arr,6);
      arr[0]:=s0; arr[1]:=s1; arr[2]:=s2; arr[3]:=s3; arr[4]:=s4; arr[5]:=s5;
// ???     if s1=s2 then arr[4]:=''  // один и тот же адрес проживания
    end else begin
      SetLength(arr,3);
      if (s0='') then begin   // есть только усыновителца
        arr[0]:=s3; arr[1]:=s4; arr[2]:=s5;
      end else begin          // есть только усыновитель
        arr[0]:=s0; arr[1]:=s1; arr[2]:=s2;
      end;
    end;
  end;
end;
//-------------------------------------------------------------------------------------
procedure TfmGurnal.LoadAkt_GurnalUZ(nTypeAkt:Integer);
var
  d1,d2:TDateTime;
  f:TfmParamQuest;
  n,nYear,nCurNomer,nID:Integer;
  s,sOld:String;
  arr:TArrStrings;
  v:Variant;
  tb:TAdsTable;
  fldV,fld1:TField;
  lPis:Boolean;
begin
  tb:=dmBase.MainTableFromTypeObj(nTypeAkt);

  nID:=MyID;
  f:=TfmParamQuest.Create(Self);
  f.Caption:='Загрузить записи актов';
  f.AddParamEx(dmBase.getCurDate, 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
  f.AddParamEx(dmBase.getCurDate, 'Конечная дата' , 'DATE2' ,'TYPE=DATE');
  lPis:=false;
  if nTypeAkt=_TypeObj_ZSmert
    then f.AddParamEx(GlobalTask.GetLastValueAsBoolean('SM_PIS_PRICH'), 'Только с письменным заявлением' , 'ONLY_WRITE' ,'');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  d1:=0;
  d2:=0;
  if n=1 then begin
    d1:=f.GetValue('DATE1', 'D');
    d2:=f.GetValue('DATE2', 'D');
    if nTypeAkt=_TypeObj_ZSmert then begin
      lPis:=f.GetValue('ONLY_WRITE', 'L');
      GlobalTask.SetLastValueAsBoolean('SM_PIS_PRICH', lPis);
    end;
  end;
  f.Free;
  if (d1>0) and (d2>0) then begin
    if (d1>d2) or (YearOf(d1)<>YearOf(d2)) then begin
      PutError('Неправильно введены даты.',Self);
    end else begin
      if Problem('Загрузить в журнал записи актов за период с '+DatePropis(d1,3)+' по '+DatePropis(d2,3), mtConfirmation, self) then begin
        if dmBase._LockTypeObj(TypeEditObj,'') then begin
          try   
            s:='FROM GurnalRegistr WHERE TYPEOBJ='+IntToStr(TypeEditObj)+
                                       ' and datez>='+QStr(DTOS(d1,tdADS))+' and datez<='+QStr(DTOS(d2,tdADS))+ ' and handled=false';
            dmBase.WorkQuery.SQL.Text:='SELECT Count(*) '+s;
            dmBase.WorkQuery.Open;
            n:=dmBase.WorkQuery.Fields[0].AsInteger;
            dmBase.WorkQuery.Close;
            if n>0 then begin
              if Problem('Найдено '+IntToStr(n)+' записи за установленный период. Удалить их ?',mtConfirmation, Self) then begin
                dmBase.WorkQuery.SQL.Text:='DELETE '+s;
                dmBase.WorkQuery.ExecSQL;
              end;
            end;
            dmBase.WorkQuery.AdsCloseSQLStatement;

            nYear:=YearOf(d1);
            //-------- получить новый номер -----
            sOld:=dmBase.GurnalRegistr.IndexName;
            dmBase.GurnalRegistr.IndexName:='KEY_VIEW';    // typeobj;god;descend(nomer)
            dmBase.GurnalRegistr.SetRange([TypeEditObj,nYear],[TypeEditObj,nYear]);
            dmBase.GurnalRegistr.First;
            nCurNomer:=dmBase.GurnalRegistr.FieldByName('NOMER').AsInteger+1;
            dmBase.GurnalRegistr.CancelRange;
            dmBase.GurnalRegistr.IndexName:=sOld;
            //-----------------------------------
            fld1:=nil;
            if nTypeAkt=_TypeObj_ZRogd then begin
              fld1:=tb.FindField('IS_WRITE');
            end else if (nTypeAkt=_TypeObj_ZSmert) then begin
              fld1:=tb.FindField('TYPEREG');
            end;

            n:=0;
            try
              OpenMessage('Загрузка ...', '', 0);
              tb.IndexName:='DATEZ';
              tb.Filter:='datez>=STOD('+QStr(DTOS(d1,tdClipper))+') and datez<=STOD('+QStr(DTOS(d2,tdClipper))+')';
              if (nTypeAkt=_TypeObj_ZSmert) and lPis then begin  // только письменные заявления
                tb.Filter:=tb.Filter + ' and typereg>0';
              end;
              tb.Filtered:=true;
              SetWorkDataSet(Tb, 'CUR_DS');   // в скрипте доступна функция GetWorkDataSet(sName):TDataSet
              fldV:=tb.FindField('VOSSTAN');
              while not tb.Eof do begin  
                // dmBase.WriteAktToGurnal(tb,nCurNomer)
                //-----------------------------
                if (IsMyID(nID, tb.FieldByName('ID_ZAGS').AsInteger) or Role.SystemAdmin) and
                   ((fldV=nil) or fldV.IsNUll or (fldV.AsBoolean=false)) then begin
                  with dmBase.GurnalRegistr do begin
                    Append;

                    CheckDecl_GurnalUZ(nTypeAkt,arr,tb);
                    FieldByName('FIO').AsString:=arr[0];
                    FieldByName('ADRES').AsString:=arr[1];
                    FieldByName('DOKUMENT').AsString:=arr[2];
                    if Length(arr)>3 then begin
                      FieldByName('FIO2').AsString:=arr[3];
                      FieldByName('ADRES2').AsString:=arr[4];
                      FieldByName('DOKUMENT2').AsString:=arr[5];
                    end;
                    FieldByName('AKT_ID').AsInteger:=tb.FieldByName('ID').AsInteger;
                    FieldByName('AKT_NOMER').AsInteger:=tb.FieldByName('NOMER').AsInteger;
                    FieldByName('ID_ZAGS').AsInteger:=nID;
                    FieldByName('TYPEOBJ').AsInteger:=TypeEditObj;
                    FieldByName('GOD').AsInteger:=YearOf(tb.FieldByName('DATEZ').AsDateTime);
                    FieldByName('NOMER').AsInteger:=nCurNomer;
                    FieldByName('DATEZ').AsDateTime:=tb.FieldByName('DATEZ').AsDateTime;
                    FieldByName('OTMETKA').AsString:=AktToOtm(tb.FieldByName('NOMER').AsString,tb.FieldByName('DATEZ').AsDateTime);
                    if (nTypeAkt=_TypeObj_ZRogd) and (fld1<>nil) then begin
                      if fld1.AsBoolean=true then begin
                        FieldByName('PRIM').AsString:='письменное заявление';
                      end;
                    end else if (nTypeAkt=_TypeObj_ZSmert) and (fld1<>nil) then begin
                      if not fld1.IsNull then begin
                        if dmBase.Shablon.Locate('KOD;ID', VarArrayOf([SHABLON_SM_PIS_PRICH,fld1.AsInteger]),[])
                          then FieldByName('PRIM').AsString:=dmBase.Shablon.FieldByName('NAME').AsString
                          else FieldByName('PRIM').AsString:='письменное заявление';
                      end;
                    end else if (nTypeAkt=_TypeObj_ZUstOtc) then begin
                      if tb.FieldByName('OSNOV').AsInteger=2 then begin // решение суда
                        FieldByName('PRIM').AsString:='Решение суда '+dmBase.ReadPropSimpleDok(_TypeObj_ZUstOtc, tb.FieldByName('ID').AsInteger, STOD('1899-12-30',tdAds),
                                                    'RESHSUD', ftMemo);
                        if not tb.FieldByName('DateDecl').IsNull
                          then FieldByName('PRIM').AsString:=FieldByName('PRIM').AsString+' от '+DatePropis(tb.FieldByName('DateDecl').AsDateTime,3);
//                        if not tb.FieldByName('DATE_VST').IsNull
//                          then FieldByName('PRIM').AsString:=FieldByName('PRIM').AsString+' вступившее в силу '+DatePropis(tb.FieldByName('DATE_VST').AsDateTime,3);
                      end;
                    end;
                    FieldByName('HANDLED').AsBoolean:=false;
                    v:=null;
                    RunFuncScript(Self.Name+'_LoadRecord',[],v);
                    Inc(nCurNomer,1);
                    Inc(n,1);
                    Post;
                  end;
                end;
                //-----------------------------
                tb.Next;
              end;
            finally
              tb.Filtered:=false;
              tb.Filter:='';
              tb.IndexName:='PR_KEY';
              //tb.CancelRange;
              SetWorkDataSet(nil, 'CUR_DS');
              CloseMessage;
            end;

            Query.DisableControls;
            Query.Close;
            Query.Open;
            Query.First;
            Query.EnableControls;
            ShowMessageCont('Загружено '+IntToStr(n)+' записей.',self);
          finally
            dmBase._UnLockTypeObj(TypeEditObj);
          end;
        end;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------
procedure TfmGurnal.Renumber_GurnalUZ;
var
  d1:TDateTime;
  f:TfmParamQuest;
  n,m:Integer;
  s,sOld,sYear:String;
begin
//  nID:=MyID;
  f:=TfmParamQuest.Create(Self);
  f.Caption:='Перенумеровать журнал';
  f.AddParamEx(dmBase.getCurDate, 'С какой даты' , 'DATE1' ,'TYPE=DATE');
//  f.AddParamEx(1, 'Использвать' , 'ISP' ,'TYPE=LIST~DESC=KEY_RENUMBER~WIDTH=200');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  d1:=0;
  m:=0;
  if n=1 then begin
    d1:=f.GetValue('DATE1', 'D');
    m:=1; //f.GetValue('ISP', 'N');
  end;
  f.Free;
  if (d1>0) then begin //and (d2>0) then begin
    //---------------------------------------------------------------------
    sYear:=IntToStr(YearOf(d1));
    if m=1 then begin  // предыдущий номер
      s:='SELECT TOP 1 NOMER FROM GurnalRegistr WHERE TYPEOBJ='+IntToStr(TypeEditObj)+
                                                      ' and datez<'+QStr(DTOS(d1,tdADS))+' and Year(datez)='+sYear+' '+
          'ORDER BY NOMER DESC';
    end else begin
      s:='SELECT Count(*) NOMER FROM GurnalRegistr WHERE TYPEOBJ='+IntToStr(TypeEditObj)+
                                                      ' and datez<'+QStr(DTOS(d1,tdADS))+' and Year(datez)='+sYear;
    end;
    dmBase.WorkQuery.SQL.Text:=s;
    dmBase.WorkQuery.Open;
    m:=dmBase.WorkQuery.Fields[0].AsInteger+1;
    dmBase.WorkQuery.Close;
    //---------------------------------------------------------------------
      if Problem('Начальный номер: <'+IntToStr(m)+'>. Перенумеровать журнал за период с '+DatePropis(d1,3)+' ? ', mtConfirmation, self) then begin
        if dmBase._LockTypeObj(TypeEditObj,'') then begin
          try
            OpenMessage('Перенумерация ...', '', 0);
            s:='UPDATE GurnalRegistr SET new_nomer=null WHERE TYPEOBJ='+IntToStr(TypeEditObj)+
                                                      ' and datez>='+QStr(DTOS(d1,tdADS))+' and Year(datez)='+sYear+' and new_nomer is not null;';
            dmBase.WorkQuery.SQL.Text:=s;
            dmBase.WorkQuery.ExecSQL;
            dmBase.WorkQuery.Close;
            sOld:=dmBase.GurnalRegistr.IndexName;
            dmBase.GurnalRegistr.IndexName:='KEY_VIEW';
            dmBase.GurnalRegistr.SetRange([TypeEditObj, sYear],[TypeEditObj, sYear]);
            dmBase.GurnalRegistr.Filter:='datez>=STOD('+QStr(DTOS(d1,tdClipper))+')';
            dmBase.GurnalRegistr.Filtered:=true;

            dmBase.GurnalRegistr.Last;
            while not dmBase.GurnalRegistr.Bof do begin
              dmBase.GurnalRegistr.Edit;
              dmBase.GurnalRegistr.FieldByName('NEW_NOMER').AsInteger:=m;
              Inc(m,1);
              dmBase.GurnalRegistr.Post;
              dmBase.GurnalRegistr.Prior;
            end;

            s:='UPDATE GurnalRegistr SET nomer=new_nomer WHERE TYPEOBJ='+IntToStr(TypeEditObj)+
                                                      ' and datez>='+QStr(DTOS(d1,tdADS))+' and Year(datez)='+sYear+' and new_nomer is not null;';
            dmBase.WorkQuery.SQL.Text:=s;
            dmBase.WorkQuery.ExecSQL;
            dmBase.WorkQuery.Close;

            Query.DisableControls;
            Query.Close;
            Query.Open;
            Query.First;
            Query.EnableControls;

          finally
            dmBase.GurnalRegistr.Filter:='';
            dmBase.GurnalRegistr.Filtered:=false;
            dmBase.GurnalRegistr.CancelRange;
            dmBase.GurnalRegistr.IndexName:=sOld;
            CloseMessage;
            dmBase._UnLockTypeObj(TypeEditObj);
          end;
        end;
      end;
//    end;
  end;

end;
{$IFEND}

// отдоженная регистрация в регистре
function TfmGurnal.ClassDokFromTypeObj:TFormDokument;
begin
Result:=nil;
{$IFDEF ZAH}
  case TypeEditObj of
    _TypeObj_AktZAH : Result:=TfmAktZ;
  end;
{$ELSE}
{$IFDEF OPEKA}
  case TypeEditObj of
    _TypeObj_Opeka : Result:=TfmZapisOpeka;
  end;
{$ELSE}
  {$IFDEF GISUN}
    case TypeEditObj of
      _TypeObj_ZBrak  : Result:=TfmZapisBrak;
      _TypeObj_ZRogd  : Result:=TfmZapisRogd;
      _TypeObj_ZSmert : Result:=TfmZapisSmert;
      _TypeObj_ZUstOtc: Result:=TfmZapisUstOtc;
      {$IFDEF ADD_ZAH}
      _TypeObj_AktZAH : Result:=TfmAktZ;
      {$ENDIF}
      {$IFDEF ZAGS}
      _TypeObj_ZRast  : Result:=TfmRastBrak;
      _TypeObj_ZUstMat: Result:=TfmZapisUstMat;
      _TypeObj_ZChName: Result:=TfmZapisChName;
      {$ENDIF}
    end;
  {$ENDIF}
{$ENDIF}
{$ENDIF}
end;

//--- отдоженная регистрация (или запрос данных) в регистре -------------------------------
// nType=1  регистрация
// nType=2  запрос данных
procedure TfmGurnal.DelayRegister(nType:Integer);
var
  ClassDok:TFormDokument;
  f:TfmSimpleD;
  nID,i,n,m:Integer;
  fld:TField;
  sSoob,s,ss,sID,sRazd:String;
  sl:TStringList;
  arrB:TArrStrings;
  lOk,lMes:Boolean;
  par:TParRegGisun;
  nSleep,nSleepCount:Integer;
begin
{$IFDEF GISUN}
  Query.DisableControls;
  s:=Query.Bookmark;
  fld:=Query.FindField('ID');
  if fld<>nil
    then sID:=fld.AsString
    else sID:='';
  sl:=TStringList.Create;
  lMes:=true;
  Query.First;
  //------------ соберем для всех отмеченных записей ID --------------
  SelectionToArr(Grid, arrB);
  if Length(arrB)>0 then begin
    ss:='отмеченной';
    OpenMessage(' Соберем информацию для регистрации ...','',0);
    for i:=0 to Length(arrB)-1 do begin
      Query.Bookmark:=arrB[i];
      n:=Gisun.GetPoleGrn(Query.FieldByName('POLE_GRN').AsInteger);
      lOk:=(n<>rPost);
      {$IF Defined(OPEKA) or Defined(ZAH) }
      if (n=rPost) and (Query.FieldByName('DATE_EDIT_GIS').AsDateTime>Query.FieldByName('DATE_POST_GIS').AsDateTime) then begin
        lOk:=true;
      end;
      {$IFEND}
      if lOk and (n<>rNotRequired) and IsRegisterGisun then begin
        sl.Add(Query.FieldByName('ID').AsString);
      end;
    end;
    CloseMessage;
  end else begin
    if IsSetFilter then begin
      ss:='';
      if Problem('Собрать информацию по отправке в регистр', mtConfirmation, self) then begin
        OpenMessage(' Соберем информацию для регистрации ...','',0);
        while not Query.Eof do begin
          n:=Gisun.GetPoleGrn(Query.FieldByName('POLE_GRN').AsInteger);
          lOk:=(n<>rPost);
          {$IF Defined(OPEKA) or Defined(ZAH) }
          if (n=rPost) and (Query.FieldByName('DATE_EDIT_GIS').AsDateTime>Query.FieldByName('DATE_POST_GIS').AsDateTime) then begin
            lOk:=true;
          end;
          {$IFEND}
          if lOk and (n<>rNotRequired) and IsRegisterGisun then begin
            sl.Add(Query.FieldByName('ID').AsString);
          end;
          Query.Next;
        end;
        Query.First;
        CloseMessage;
      end;
    end else begin
      ShowMessageCont('Необходимо отметить записи или установить отбор',self);
      lMes:=false;
    end;
  end;
  Query.Bookmark:=s;
  Query.EnableControls;
  if (sl.Count=0) then begin
    sl.Free;
    if lMes
      then ShowMessageCont('Не найдено ни одной '+ss+' записи для регистрации.',self);
    exit;
  end;
  sSoob:='';
  if Problem(' Вы хотите зарегистрировать в '+_GIS_+' записи в количестве: '+IntToStr(sl.Count), mtConfirmation, self)  then begin
    nSleep:=GlobalTask.ParamAsInteger('SLEEP_GIS_TIME');
    nSleepCount:=GlobalTask.ParamAsInteger('SLEEP_GIS_COUNT');
    sRazd:=StringOfChar('-',50);
    ClassDok:=ClassDokFromTypeObj;
    f:=ClassDok.Create(nil);
    Gisun.HandleErrorToString:=true;
    Gisun.ErrorString:='';
    {$IFDEF OPEKA}
      if nType=1 then begin // регистрация
        ss:='';
        for i:=0 to sl.Count-1 do ss:=ss+sl.Strings[i]+',';
        ss:=Copy(ss,1,Length(ss)-1);
        sl.Clear;
        with dmBase.WorkQuery do begin
          SQL.Text:='SELECT ID FROM AktOpek WHERE ID in ('+ss+') ORDER BY datez';
          // !!! соберем в порядке даты установления опеки, для случая если отправляем две карточки на одного человека
          Open;
          while not Eof do begin
            sl.Add(FieldByName('ID').AsString);
            Next;
          end;
          Close;
        end;
      end;  
    {$ENDIF}
    m:=0;
    for i:=0 to sl.Count-1 do begin
      nID:=StrToInt(sl.Strings[i]);
      ss:='';
      if f.FMainTable.Locate('ID', nID, []) then begin
        try
          if TypeEditObj=_TypeObj_Opeka then begin
            ss:=CreateFIO(f.FMainTable, '')+' ИН:'+f.FMainTable.FieldByName('IDENTIF').AsString+' ';;
          end else if TypeEditObj=_TypeObj_AktZAH then begin
            ss:=CreateFIO(f.FMainTable, '')+' ИН:'+f.FMainTable.FieldByName('LICH_NOMER').AsString+' ';
          end else begin
            ss:='з/а № '+f.FMainTable.FieldByName('NOMER').AsString+' от '+DatePropis(f.FMainTable.FieldByName('DATEZ').AsDateTime,8)+' ';
          end;
        except
          ss:='';
        end;
     //   if Gisun.GetPoleGrn(f.FMainTable.FieldByName('POLE_GRN').AsInteger)<>rPost then begin
        f.NewDok(false);
        f.ReadDok(nID);
        par:=f.CreateParamRegistr;
        if nType=2 then begin     // запрос
          f.GetDataFrom_GISUN(1);
        end else begin            // регистрация
          f.RegisterAkt_GISUN(1,par);
        end;
        if par<>nil
          then par.Free;
        if Gisun.ErrorString='' then begin
          sSoob:=sSoob+sRazd+CRLF+ss+' '+Gisun.GetMessageOk+CRLF;
        end else begin
          sSoob:=sSoob+sRazd+CRLF+ss+CRLF+Gisun.ErrorString+CRLF;
        end;
//        end;
       Inc(m,1);
       if (nType=1) and (nSleep>0) and (nSleepCount>0) then begin
         if m>=nSleepCount then begin
           m:=0;
           OpenMessage('Пауза в регистрации на '+IntToStr(nSleep)+'мин. ... ','',0);
           try
             sSoob:=sSoob+sRazd+CRLF+'>>>>>>>> пауза в регистрации на '+IntToStr(nSleep)+'мин.  тек. время:'+
                    FormatDateTime('hh:nn',Now)+' ... ';
             Sleep(nSleep*60*1000);
             if not Gisun.ReloadETSP then begin    // !!! перезагрузим библиотеку ЭЦП   параметр gisun.ini  ADMIN, ETSP_RELOAD=1
               sSoob:=sSoob+' ОШИБКА перезагрузки библиотеки ЭЦП <<<<<<<<<<'+CRLF;
             end else begin
               sSoob:=sSoob+' возобновление регистрации '+FormatDateTime('hh:nn',Now)+' <<<<<<<<<<'+CRLF;
             end;
           finally
             CloseMessage;
           end;
         end;
       end;
      end;
    end;
    Gisun.HandleErrorToString:=false;
    Gisun.ErrorString:='';
    f.Free;
    sl.Free;
  end;

  if sSoob<>'' then begin
    EditMemo(sSoob, 'Отчет о регистрации;;Выход', nil, 800);
    if sID=''
      then FullRefresh
      else Refresh(true, sID);
  end;

{$ENDIF}
end;
//-------------------------------------------------------------------------
procedure TfmGurnal.TBItemDelayRegisterClick(Sender: TObject);
begin
  DelayRegister(1);
end;
//-------------------------------------------------------------------------
// запись подходит для групповой обработки
function TfmGurnal.IsRecordOkObrab(nType:Integer):Boolean;
{$IFDEF GISUN}
var
  fld:TField;
{$ENDIF}
begin
{$IFDEF GISUN}
  if nType=0 then begin
    fld:=Query.FindField('POLE_GRN');
    if fld=nil
      then Result:=true
      else Result:=((Gisun.GetPoleGrn(Query.FieldByName('POLE_GRN').AsInteger)<>rPost) and IsRegisterGisun);
  end else begin
    Result:=true;
  end;
{$ELSE}
  Result:=true;
{$ENDIF}
end;
//-------------------------------------------------------------------------
function TfmGurnal.GetRecordsForObrab(nType:Integer; sl:TStringList; var sID:String; lCheckFilter:Boolean):Boolean;
var
  i:Integer;
  fld:TField;
  s,ss:String;
  arrB:TArrStrings;
  l:Boolean;
begin
  Result:=false;
  Query.DisableControls;
  s:=Query.Bookmark;
  fld:=Query.FindField('ID');
  if fld<>nil
    then sID:=fld.AsString
    else sID:='';
  Query.First;
  l:=false;
  //------------ соберем для всех отмеченных записей ID --------------
  SelectionToArr(Grid, arrB);
  if Length(arrB)>0 then begin
    ss:='отмеченной';
    OpenMessage(' Соберем информацию ...','',0);
    for i:=0 to Length(arrB)-1 do begin
      Query.Bookmark:=arrB[i];
      if IsRecordOkObrab(nType) then begin
        sl.Add(Query.FieldByName('ID').AsString);
//        l:=true;
      end;
    end;
    CloseMessage;
  end else begin
    if IsSetFilter or not lCheckFilter then begin
      ss:='';
//      if Problem('Собрать информацию по отобранным записям ?', mtConfirmation, self) then begin
        OpenMessage(' Соберем информацию ...','',0);
        while not Query.Eof do begin
          if IsRecordOkObrab(nType) then begin
            sl.Add(Query.FieldByName('ID').AsString);
//            l:=true;
          end;
          Query.Next;
        end;
        Query.First;
        CloseMessage;
//      end;
    end else begin
      ShowMessageCont('Необходимо отметить записи или установить отбор',self);
      l:=true;
    end;
  end;
  Query.Bookmark:=s;
  Query.EnableControls;
  if (sl.Count>0) then begin
    Result:=true;
  end else begin
    if not l
      then ShowMessageCont('Не найдено ни одной записи.',self);
  end;
end;
//-------------------------------------------------------------------------
// д.б. реализовано в наследниках где есть  Query.Filter:=...
function TfmGurnal.getAdditiveFilter: String;
begin
  Result:='';
end;
//-------------------------------------------------------------------------
function TfmGurnal.setAdditiveFilter: Boolean;
var
  sFlt:String;
  cur:TCursor;
begin
  Result:=true;
  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
    sFlt:=getAdditiveFilter;
    if sFlt='' then begin
      if Query.Filter<>'' then begin
        Query.Filter:='';
        if Query.Active
          then Query.Filtered:=false;
      end;
    end else begin
      Query.Filter:=sFlt;
      if Query.Active
        then Query.Filtered:=true;
    end;
  finally
    Screen.Cursor:=cur;
  end;
end;

procedure TfmGurnal.TBItemClearPunktsClick(Sender: TObject);
begin
  ClearPunkts;
end;

procedure TfmGurnal.TBSubmenuPunktsClick(Sender: TObject);
begin
  ClickPunkts;
end;

procedure TfmGurnal.SetCurBase(Value : Integer);
begin
  FCurBase:=Value;
end;

function TfmGurnal.GetCurBase : Integer;
begin
  Result:=FCurBase;
end;

procedure TfmGurnal.GridColumnsGetLgotMen(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
{$IFDEF ADD_MENS_PU}
  if Params.Text<>'' then begin
    Params.Text:=dmBase.LgotMen(dmBase.tbMensLgot, Query.FieldByName('DATE_FIKS').AsDateTime,
                                      Query.FieldByName('FIRST').AsString, ', ');
  end;
{$ELSE}

{$ENDIF}
end;

function TfmGurnal.GetProperty(sName: String; vDef:Variant): Variant;
var
  v:Variant;
  j:Integer;
begin
  sName:=UpperCase(Trim(sName));
  if GetPropertyDef(sName, v) then begin
    Result:=v;
  end else begin
    if sName='SQL' then begin
      Result:=Query.SQL.Text;
    end else if sName='WHERE' then begin
      Result:=GetCurrentWhere;
    end else if Copy(sName,1,5)='ORDER' then begin
      j:=Pos('ORDER BY', ANSIUpperCase(Query.SQL.Text));
      if j>0
        then Result:=Copy(Query.SQL.Text,j+8,Length(Query.SQL.Text))
        else Result:='';
    end else if sName='FILTER' then begin
      Result:=Query.Filter;
    end else if sName='TYPEEDITOBJ' then begin
      Result:=TypeEditObj;
    end else if sName='TYPEEDITOBJ' then begin
      Result:=TypeEditObj;
    end else begin
      Result:=vDef;
    end;
  end;
end;

function TfmGurnal.GetPropertyDef(sName: String; var vVal:Variant): Boolean;
begin
  Result:=false;
end;

procedure TfmGurnal.CheckMouseMessage(var Msg: tagMSG; var Handled: Boolean);
begin
  Handled := (msg.wParam = vk_lButton) or
             (msg.wParam = vk_rButton) or
             (msg.wParam = vk_mButton);
  if Handled then begin
    Caption:=IntToStr(GetTickCount);
    Application.ProcessMessages;
  end;
end;

//-------------------------------------------------------------
function TfmGurnal.GetParam(slPar:TStringList; sParam,sDefault: String): String;
begin
  Result:=sDefault;
  if (slPar<>nil) and (slPar.Count>0) then begin
    Result:=slPar.Values[sParam];
    if Result=''
      then Result:=sDefault;
  end;
end;

// &tmp&
function TfmGurnal.CreateIDForTmpTable(slPar: TStringList): Boolean;
begin
  Result:=false;
end;

function TfmGurnal.SetSysFilter(vPar: Variant): Boolean;
var
  s:String;
begin
  Result:=false;
  s:=VarToStr(vPar);
  if Copy(s,1,1)='&' then begin
    Result:=true;
    FilterInterface.LoadAndRunFilter(Copy(vPar,2,Length(vPar)-1));
  end;
end;
//-----------------------------------------------------------------------------
procedure TfmGurnal.TBItemIsklOtborClick(Sender: TObject);
begin
  if TBItemIsklOtbor.Visible and TBItemIsklOtbor.Enabled then begin
    try
      TmpQuery.SQL.Text:='DELETE FROM &tmp& WHERE id='+Query.FieldByName('ID').AsString;
      TmpQuery.SQL.Text:=StringReplace( TmpQuery.SQL.Text, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);
      TmpQuery.ExecSQL;
      Query.Prior;
//      FullRefresh(true);
      Refresh(false);
    except
    end;
  end;
end;

procedure TfmGurnal.TBItemAddOtborClick(Sender: TObject);
var
  sID:string;
  arrRec : TCurrentRecord;
begin
  if TBItemAddOtbor.Visible and TBItemAddOtbor.Enabled then begin
    if ChoiceMen( nil, '', '', arrRec) then begin
       sID:=GetValueFieldEx(arrRec, 'ID', '0');
       TmpQuery.SQL.Text:='INSERT INTO &tmp& (ID) VALUES ('+sID+')';
       TmpQuery.SQL.Text:=StringReplace( TmpQuery.SQL.Text, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);
       TmpQuery.ExecSQL;
//       FullRefresh(true, sID);
       Refresh(false, sID);
    end;
  end;
end;

procedure TfmGurnal.FormCreate(Sender: TObject);
begin
  FEventCheckGrid:=nil;
  CreatefrxDBdataSet(self,Query,'CurQuery','Текущий журнал');
  CreatefrxDBdataSet(self,TmpQuery,'TmpQuery','Временный запрос');
end;

procedure TfmGurnal.N2Click(Sender: TObject);
begin
  if Role.SystemAdmin
    then RunTest;
end;
procedure TfmGurnal.pmSQLClick(Sender: TObject);
var
  s:String;
begin
  if Role.SystemAdmin then begin
    s:=Query.SQL.text;
    if EditMemo(s,'SQL',nil,800) then begin
      Query.Active:=false;
      Query.SQL.text:=s;
      Query.Active:=True;
      Grid.Refresh;
    end;
  end;
end;

procedure TfmGurnal.RunTest;
begin
//
end;

function TfmGurnal.BeforeEdit: Boolean;
begin
  Result:=true;
end;
//----------------------------------------------------------
procedure TfmGurnal.WM_Refresh(var rec: TMsg);
begin
  FullRefresh;
end;
//-----------------------------------------------------
function TfmGurnal.IsSetUserFilter: Boolean;
begin
  Result:=false;
end;
//-----------------------------------------------------
procedure TfmGurnal.TBItemSumClick(Sender: TObject);
begin
  Grid.SumGraf;
end;
//-----------------------------------------------------
function TfmGurnal.FiltersSavedDir:String;
begin
   Result:=StringReplace(FilterInterface.BaseDir, '\Filters\', '\FiltersSaved\', []);
end;
//-----------------------------------------------------
procedure TfmGurnal.CheckMenuSavedFilter(sub:TTBSubmenuItem);
var
  i:Integer;
  it:TTbItem;
  sr:TSearchRec;
  s:String;
  sl:TStringList;
begin
  sub.Caption:='Сохраненнные отборы';
  sub.clear;
  sub.Visible:=false;
  sl:=TStringList.Create;
  if FindFirst( CheckSleshN(FiltersSavedDir)+'*.ifl', faAnyFile, sr) = 0 then begin
    s:=sr.Name;
    while s<>'' do begin
      sl.Add(Copy(s,1,Length(s)-4));
      if FindNext(sr)=0  then s:=sr.Name
                         else s:='';
    end;
    FindClose(sr);
  end;
  if sl.Count>0 then begin
    for i:=0 to sl.Count-1 do begin
      it := TTbItem.Create(sub);
      it.Caption:=sl.Strings[i];
      it.OnClick:=Event_OpenSavedFilter;
      it.Name:='TBITEM_SV_FLT_'+IntToStr(i);
      if sub.Images<>nil
        then it.Images:=sub.Images;
      sub.Add(it);
    end;
    sub.Visible:=true;
  end;
  sl.Free;
end;
//-----------------------------------------------------
procedure TfmGurnal.Event_OpenSavedFilter(Sender: TObject);
begin
  if ReadSavedFilter(TTbItem(Sender).Caption) then begin
    FSeekAsQuery:=true;
    FSeekAsQuery_Active:=true;

    FSeekAsQuery_Ready:=true;   // таблица #tmp уже заполнена ранее
    try
      setAdditiveFilter;
    finally
      FSeekAsQuery_Ready:=false;
    end;
  end;
end;
//-----------------------------------------------------
function TfmGurnal.ReadSavedFilter(sNameFilter:String):Boolean;
var
   FileName: string;
   sErr, s : string;
   sl,slPar:TStringList;
   nID,i:Integer;
begin
   Result:=false;
//   sDir:=FiltersSavedDir;
   FileName:=CheckSleshN(FiltersSavedDir)+sNameFilter+'.ifl';
//   ForceDirectories(sDir);
//   openDialog.InitialDir:=sDir;
//   openDialog.DefaultExt:='.ifl';
//   openDialog.Filter:='Запросы (*.ifl)|*.ifl';
//   if openDialog.Execute then begin
//      FileName:=ExpandFileName(ChangeFileExt(openDialog.FileName, '.ifl'));
   if FileExists(FileName) then begin
      sErr:='';
      sl:=TStringList.Create;
      if MemoRead(FileName, s) then begin
        StrToStrings(s,sl,#13#10,true);
        if sl.Count>1 then begin
          s:=Trim(sl.Strings[0]);
          if s<>'empty' then begin
            slPar:=TStringList.Create;
            slPar.CommaText:=s;
            ReadParSavedFilter(slPar);
            slPar.Free;
          end;
          s:='';
          TmpQuery.SQL.Clear;
          TmpQuery.SQL.Add('DELETE FROM &tmp&;');

          for i:=1 to sl.Count-1 do begin
            try
              nID:=StrToInt(sl.Strings[i]);
              TmpQuery.SQL.Add('INSERT INTO &tmp& (ID) VALUES ('+IntToStr(nID)+');');
            except
              on E:Exception do begin
                sErr:=Format('Ошибка чтения фильтра из файла "%s"'#13#10'%s', [FileName, sl.Strings[i]+': '+E.Message]);
              end;
            end;
          end;
        end else begin
        end;
      end else begin
        sErr:='Ошибка чтения фильтра из файла '+FileName;
      end;
      if sErr='' then begin
        TmpQuery.SQL.Text:=StringReplace( TmpQuery.SQL.Text, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);
        memowrite('last_tmp.sql',TmpQuery.SQL.Text);
        TmpQuery.ExecSQL;
        TmpQuery.SQL.Text:='SELECT COUNT(*) FROM '+GetNameTmpIdTable;
        TmpQuery.Open;
        if TmpQuery.Fields[0].AsInteger>0 then  begin
          Result:=true;
        end;
        TmpQuery.Close;
      end else begin
        PutError(sErr,self);
      end;
      sl.Free;
   end else begin
     PutError('Файл не найден: "'+FileName+'"',self);
   end;
end;

procedure TfmGurnal.WriteSavedFilter;
var
   FileName: string;
   sDir, s, ss: string;
//   fld:TField;
   sl:TStringList;
begin
//   fld:=Query.FindField('ID');
   sDir:=FiltersSavedDir;
   ForceDirectories(sDir);
   saveDialog.InitialDir:=sDir;
   saveDialog.DefaultExt:='.ifl';
   saveDialog.Filter:='Запросы (*.ifl)|*.ifl';
   if saveDialog.Execute then begin
     FileName:=ExpandFileName(ChangeFileExt(saveDialog.FileName, '.ifl'));
     OpenMessage('Запись отбора в файл ...');
     try
       Query.DisableControls;
       Query.First;
       s:='';
       while not Query.Eof do begin
         s:=s+Query.FieldByName('ID').AsString+#13#10;
         Query.Next;
       end;
       if s<>'' then begin
         sl:=TStringList.Create;
         CreateParSavedFilter(sl);
         if sl.Count=0
           then ss:='empty'
           else ss:=sl.CommaText;
         memowrite(FileName,ss+#13#10+s);
         sl.Free;
       end;
     finally
       Query.First;
       Query.EnableControls;
       CloseMessage;
     end;
     BuildMenuChoiceFlt;
   end;
end;

procedure TfmGurnal.CreateParSavedFilter(sl:TStringList);
begin
//
end;
function TfmGurnal.ReadParSavedFilter(sl:TStringList):Boolean;
begin
  Result:=true;
end;

procedure TfmGurnal.TBItemWriteSavedFilterClick(Sender: TObject);
begin
  WriteSavedFilter;
end;

initialization

  CurGurnal:=nil;

end.
