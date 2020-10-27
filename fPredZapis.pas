unit fPredZapis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DateUtils, fParamQuest, FuncPr, FuncEh, fWarning, SasaUtils,
  mTempl, MetaTask, OpisEdit, dbFunc, uDate, uProject, uProjectAll,uTypes,
  Dialogs, Grids, DBGridEh, TB2Dock, TB2Toolbar, DB, kbmMemTable, TB2Item,
  ImgList, ExtCtrls, adstable, adsdata, adsfunc, TB2ToolWindow, StdCtrls,
  Mask, DBCtrlsEh, DBLookupEh, DBCtrls, frxClass, frxDBSet, Menus;


const
  COLOR_BLUE=$00FFDFBF;
  COLOR_RED=$00CACAFF;
  COLOR_DECL=clYellow;

  ROLE_SYSADMIN=-1;
  ROLE_ADMIN=0;
  ROLE_EDIT=1;
  ROLE_READ=2;
  ROLE_NOT=3;
  name_tbitem='tbitemmonth_';
//  KEY_VIEW='TYPEOBJ;MESTO;GOD;MONTH;DAY;BEGINR';
  KEY_VIEW='OTKAZ;TYPEOBJ;MESTO;GOD;MONTH;DAY;BEGINR';
  COL_DAY1=1;     // номер колонки в гриде с первым днем
  COLTB_DAY1=1;   // номер поля с первым днем в таблице

type

  TObrabCurDay = procedure(fld:TField; nDay:integer; nDayWeek:Integer) of object;
  TObrabPrep   = procedure(var lOk:Boolean) of object;

  TParDay=record
    FDay:Integer;
    FActive:Boolean;
    nTimeWB:TDateTime;
    nTimeWE:TDateTime;
    nTimeOB:TDateTime;
    nTimeOE:TDateTime;
  end;
  TArrParDay = array[1..7] of TParDay;
//  TParMonth=class(TObject)
//  end;

  TfmPredZapis = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    dsTable: TDataSource;
    table: TkbmMemTable;
    ImageList: TImageList;
    TBImageList1: TTBImageList;
    TBItemEdit: TTBItem;
    TBItemCreateMonth: TTBItem;
    tbPredZapis: TAdsTable;
    Query: TAdsQuery;
    dsMesto: TDataSource;
    TBItemMesto: TTBItem;
    TBSubmenuMonth: TTBSubmenuItem;
    pnCaption: TPanel;
    tbView: TkbmMemTable;
    tbEdit: TkbmMemTable;
    tbViewID: TIntegerField;
    tbViewDAY: TIntegerField;
    tbViewBEGINR: TTimeField;
    tbViewLONGR: TIntegerField;
    tbViewDECL_ID: TIntegerField;
    tbViewAKT_ID: TIntegerField;
    tbViewDATER: TDateTimeField;
    tbViewDATEB: TDateField;
    tbViewOPIS: TMemoField;
    tbViewSPEC: TStringField;
    tbViewOPIS_DECL: TMemoField;
    tbViewOPIS_AKT: TMemoField;
    tbEditID: TIntegerField;
    tbEditDAY: TIntegerField;
    tbEditBEGINR: TTimeField;
    tbEditLONGR: TIntegerField;
    tbEditDECL_ID: TIntegerField;
    tbEditAKT_ID: TIntegerField;
    tbEditDATER: TDateTimeField;
    tbEditDATEB: TDateField;
    tbEditOPIS: TMemoField;
    tbEditSPEC: TStringField;
    tbEditOPIS_DECL: TMemoField;
    tbEditOPIS_AKT: TMemoField;
    tbViewNOMER_Z: TIntegerField;
    tbViewDATE_Z: TDateField;
    tbEditNOMER_Z: TIntegerField;
    tbEditDATE_Z: TDateField;
    TBItemClear: TTBItem;
    tbViewTELEFON: TStringField;
    tbEditTELEFON: TStringField;
    dsView: TDataSource;
    TBItemDeleteMonth_: TTBItem;
    TBItemPreView: TTBItem;
    TBItemExit: TTBItem;
    TBItemPerevod: TTBItem;
    frxPredZapis: TfrxDBDataset;
    frxTable: TfrxDBDataset;
    frxView: TfrxDBDataset;
    TBItemDesignReport: TTBItem;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    tbViewON_FIO: TStringField;
    tbViewONA_FIO: TStringField;
    tbViewFIRST_BRAK: TBooleanField;
    tbEditON_FIO: TStringField;
    tbEditONA_FIO: TStringField;
    tbEditFIRST_BRAK: TBooleanField;
    TBSubmenuItemRefresh: TTBSubmenuItem;
    TBItemAutoRefresh: TTBItem;
    Timer1: TTimer;
    TBItemRefresh2: TTBItem;
    cbMesto: TComboBox;
    cbMonth: TComboBox;
    cbGod: TComboBox;
    lbMesto: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    TBItemSeek: TTBItem;
    tbViewNOMER: TIntegerField;
    tbEditNOMER: TIntegerField;
    TBItemFullDelete: TTBItem;
    TBSubmenuRun: TTBSubmenuItem;
    TBItemRenumber: TTBItem;
    TBItemZCh: TTBItem;
    TBItemZ: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSubmenuItemPreView: TTBSubmenuItem;
    TBItemW1: TTBItem;
    tbViewYEAR: TSmallintField;
    tbViewMONTH: TSmallintField;
    tbViewDATE_BRAK: TDateField;
    tbEditYEAR: TSmallintField;
    tbEditMONTH: TSmallintField;
    tbEditDATE_BRAK: TDateField;
    TBSeparatorItem2: TTBSeparatorItem;
    pnGrafic: TPanel;
    Grid: TDBGridEh;
    pnView: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbON: TLabel;
    lbONA: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edBegin: TDBDateTimeEditEh;
    edDateSost: TDBDateTimeEditEh;
    edSpec: TDBEditEh;
    edTelefon: TDBEditEh;
    edLong: TDBEditEh;
    edDateZ: TDBDateTimeEditEh;
    edNomerZ: TDBEditEh;
    edON: TDBEditEh;
    edONA: TDBEditEh;
    cbFirstBrak: TDBCheckBoxEh;
    edNomer: TDBNumberEditEh;
    pnGurnal: TPanel;
    dsGurnal: TDataSource;
    Gurnal: TAdsQuery;
    GridGurn: TDBGridEh;
    TBItemWorkTime: TTBItem;
    tbViewMESTO: TIntegerField;
    tbEditMESTO: TIntegerField;
    TBItemParams: TTBItem;
    TBItemViewGurnal: TTBItem;
    lbDay: TLabel;
    cbDay: TComboBox;
    tbViewDATE_DECL: TDateField;
    tbEditDATE_DECL: TDateField;
    lbDateDecl: TLabel;
    edDateDecl: TDBDateTimeEditEh;
    TBItemDeleteMonth: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemEditClick(Sender: TObject);
    procedure TBItemChMonthClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBItemCreateMonthClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TBItemMestoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GridColumns1GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColEnter(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure TBItemClearClick(Sender: TObject);
    procedure dsTableDataChange(Sender: TObject; Field: TField);
    procedure TBItemDeleteMonth_Click(Sender: TObject);
    procedure TBItemPerevodClick(Sender: TObject);
    procedure TBSubmenuItemZClick(Sender: TObject);
    procedure TBItemZChClick(Sender: TObject);
    procedure TBItemDesignReportClick(Sender: TObject);
    procedure TBItemPreViewClick(Sender: TObject);
    procedure TBItemExitClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure TBSubmenuItemRefreshClick(Sender: TObject);
    procedure TBItemAutoRefreshClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TBItemRefresh2Click(Sender: TObject);
    procedure cbMestoClick(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure cbGodChange(Sender: TObject);
    procedure GridTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
    procedure TBItemSeekClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edONEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure TBItemFullDeleteClick(Sender: TObject);
    procedure TBItemRenumberClick(Sender: TObject);
    procedure TBItemZClick(Sender: TObject);
    procedure TBItemW1Click(Sender: TObject);
    procedure TBItemWorkTimeClick(Sender: TObject);
    procedure TBItemParamsClick(Sender: TObject);
    procedure TBItemViewGurnalClick(Sender: TObject);
    procedure GridGurnGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridGurnDblClick(Sender: TObject);
    procedure GridGurnColumns8GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
  private
    FMinYear:Integer;
    FCountDays: Integer;
    FAutoRefresh: Boolean;
    procedure SetCountDays(const Value: Integer);
    procedure SetAutoRefresh(const Value: Boolean);
  public
    FCurYear:Integer;
    FCurMonth:Integer;
    FTypeObj:Integer;
    FMesto:Integer;
    FMestoName:String;
    FCurLong:Integer;
    FNotWorkDays:String;
    FNotWorkTime:TStringList;
    FPrazdniki:TArrInteger;
    FTypeShow:Integer;
    FRole:Integer;
    FBase:Boolean;
    FErrorOpen:Boolean;
    FTableDeclare:TAdsTable;
    FLastDateCorr:TDateTime;
    FRun:Boolean;
    FWorkCount:Integer;
    FCurDay:Integer;
    FListMestID:TStringList;
    FSeek:TStringList;
    FFiksation:Boolean;
    FOnlyDeclare:Boolean;  // без карточки предв. записи, сразу заявление

    FOnlyWorkDays:Boolean;
    FCheckNomer:Boolean;
    FVisitDay:Integer;
    FCountMinRefresh:Integer;
    FRaschetDay:Boolean;
    FTelefon:String;
    FTimeWork:String;
    FPorProv:String;
    slReport:TStringList;
    slReportPar:TStringList;
    FArrDays:TArrParDay;
    property AutoRefresh:Boolean read FAutoRefresh write SetAutoRefresh;
    property CountDays:Integer read FCountDays write SetCountDays;
    function DayOfWeek_(nDay:Integer):Integer;
    function SetCurMonth(lBookmark:Boolean):Boolean;
    function ReadCurMonth:Boolean;
    function InitTime(dW1:TDateTime; dW2:TDateTime; nCountMin:Integer):Boolean;
    function GetID(fld:TField):Integer;
    procedure ClearID(fld:TField);
    procedure SetID(nNomer:Integer; fld:TField; nID:Integer; dBegin:TDateTime; var nRealLong:Integer; sDecl:String);

    procedure EditPredZapis;
    procedure EditPredZapisGurnal;
    procedure GurnalRefresh(nID:Integer);

    function GetCurDayField:TField;
    function GetCurDateGrid(fld:TField):TDateTime;
    function GetCurDayFromField(fld:TField):Integer;
    function GetCurTimeAsString:String;

    function GetTime(sTime:String; nType:Integer):TDateTime;
    function MonthExists(nMonth:Integer):Integer;
    function WriteMetaMonth(nMonth:Integer; arr:TArrParDay; nLong:Integer; sAddDays:String; aNotWorkTime:TStringList ):Boolean;
    function ReadMetaMonth(nMonth:Integer; var arrDays:TArrParDay; var nLong:Integer; var sAddDays:String; aNotWorkTime:TStringList ):Integer;
    procedure ClearPredZapis(lEdit:Boolean);
    procedure EditDeclare;
    procedure EditDeclare_Brak;
    procedure EditDeclare_Rast;

    function ObrabCurMonth(Obrab:TObrabCurDay; ObrBegin,ObrEnd:TObrabPrep):Boolean;
    procedure Obrab_FindZ(fld:TField; nDay:integer; nDayWeek:Integer);
    procedure ObrabBegin_FindZ(var lOk:Boolean);
    procedure ObrabEnd_FindZ(var lOk:Boolean);
    procedure LoadAllDeclare;
    procedure LoadAllDeclareRast;

    function PredZapisFromDeclare(fld:TField; var arrRec: TCurrentRecord; nNomer:Integer):Boolean;
    function PredZapisFromDeclare_Rast(fld:TField; var arrRec: TCurrentRecord; nNomer:Integer):Boolean;
    procedure CheckDateCorCurMonth;
    function GetDateCorCurMonth:TDateTime;

    function ReadPredZapis(ID:Integer; lEdit:Boolean; lFull:Boolean) : Boolean;
    function CalcDateDecl(DateBrak:TDateTime):TDateTime;

    function PredZapisExists(nDay:Integer; dBegin:TDateTime; lOtkaz:Boolean): Boolean;
    function WritePredZapis(lEdit:Boolean; fld:TField):Boolean;
    function DeletePredZapis(fld:TField): Boolean;
    function FullDeletePredZapis(fld:TField; nID:Integer): Boolean;

    function WriteDeclID(nID:Integer; nDeclID:Integer): Boolean;

    procedure SaveMainParams;

    procedure CreateSubMenuReport;
    procedure Event_PreviewReport(Sender:TObject);

    function getAddName: String;
    function Prepare(nTypeObj:Integer; nGod:Integer; nMonth:Integer; nTypeEdit:Integer):Boolean;
    procedure CheckItemMonths;
    procedure CheckValues(nID:Integer=0);
    procedure Event_ChMonth(Sender:TObject);
    procedure SaveToIni;
    procedure LoadFromIni;
    function BeforeReport:Boolean;
    function SetNewNomerDok(fld:TField; lRunLock:Boolean=true):Integer;
    procedure RenumberGurnal;
    function SeekPredZapis(sCaption:String; var arrRec : TCurrentRecord; nDay:Integer):Integer;
    procedure Mesto_GridGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure ViewFullGurnal;
    function IsGrafic:Boolean;

  end;

//var
//  fmPredZapis: TfmPredZapis;

implementation

uses dBase, fMain, fDeclBrak, fDeclRast, fPredZapis_Perenos, fPredZapis_Params, fPredZapis_Edit, fPredZapis_Month, StrUtils;

{$R *.dfm}

procedure TfmPredZapis.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
begin
  if not FErrorOpen then SaveToIni;
  CanClose:=true;                        
end;
procedure TfmPredZapis.FormClose(Sender: TObject;  var Action: TCloseAction);
var
 sAdd:String;
begin
  Action:=caFree;
  sAdd:=getAddName;
//  if FTypeObj=_TypeObj_ZBrak then sAdd:='BRAK' else sAdd:='ALL';
  //-- сохраним параметры
  GlobalTask.SetLastValueAsInteger('PRED_'+sAdd+'_MESTO',FMesto);
  GlobalTask.SetLastValueAsInteger('PRED_'+sAdd+'_GOD',FCurYear);
  GlobalTask.SetLastValueAsInteger('PRED_'+sAdd+IntToStr(FCurYear),FCurMonth);
  SaveMainParams;
end;

//----------------------------------------------------------
procedure TfmPredZapis.SaveMainParams;
var
 sAdd:String;
begin
  sAdd:=getAddName; //if FTypeObj=_TypeObj_ZBrak then sAdd:='BRAK' else sAdd:='ALL';
  GlobalTask.SetMainParam('PRED_'+sAdd, 'CHECKNOMER', 'L', FCheckNomer);
  GlobalTask.SetMainParam('PRED_'+sAdd, 'AUTOREFRESH', 'L', FAutoRefresh);
  GlobalTask.SetMainParam('PRED_'+sAdd, 'COUNTMIN', 'N', FCountMinRefresh);
  GlobalTask.SetMainParam('PRED_'+sAdd, 'RASCHETDAY', 'L', FRaschetDay);
  GlobalTask.SetMainParam('PRED_'+sAdd, 'VISITDAY', 'N', FVisitDay);
  GlobalTask.SetMainParam('PRED_'+sAdd, 'ONLYWORK', 'L', FOnlyWorkDays);
  GlobalTask.SetMainParam('PRED_'+sAdd, 'TELEFON', 'C', FTelefon);
  GlobalTask.SetMainParam('PRED_'+sAdd, 'PORPROV', 'C', FPorProv);
  GlobalTask.SetMainParam('PRED_'+sAdd, 'TIMEWORK', 'C', FTimeWork);
end;

//----------------------------------------------------------
procedure TfmPredZapis.FormCreate(Sender: TObject);
var
  i:Integer;
  it:TTBItem;
  fldDef:TFieldDef;
begin
  slReport:=TStringList.Create;
  slReportPar:=TStringList.Create;
  FSeek:=TStringList.Create;
  FListMestID:=TStringList.Create;
  FNotWorkTime:=TStringList.Create;
  SetLength(FPrazdniki,0);
  FCurDay:=0;
  FFiksation:=true;
  FOnlyDeclare:=false;

  FOnlyWorkDays:=false;
  FCheckNomer:=true;
  FVisitDay:=3;
  FCountMinRefresh:=1;
  FRaschetDay:=true;
  FAutoRefresh:=false;
  FTelefon:='';
  FTimeWork:='';

  FErrorOpen:=true;
  Table.Active:=false;
  Table.FieldDefs.Clear;
  fldDef := Table.FieldDefs.AddFieldDef;
  fldDef.Name     := 'TIME';
  fldDef.DataType := ftString;
  fldDef.Size     := 20;
  fldDef.Required := false;
  for i:=1 to 31 do begin
    fldDef := Table.FieldDefs.AddFieldDef;
    fldDef.Name     := 'DAY'+IntToStr(i);
    fldDef.DataType := ftInteger; // ftString;
//    fldDef.Size     := 10;
    fldDef.Required := false;
  end;
  for i:=1 to 31 do begin
    fldDef := Table.FieldDefs.AddFieldDef;
    fldDef.Name     := 'N'+IntToStr(i);
    fldDef.DataType := ftSmallint; // ftString;
    fldDef.Required := false;
  end;
  for i:=1 to 31 do begin
    fldDef := Table.FieldDefs.AddFieldDef;
    fldDef.Name     := 'Z'+IntToStr(i);
    fldDef.DataType := ftInteger; // ftString;
    fldDef.Required := false;
  end;
  fldDef := Table.FieldDefs.AddFieldDef;
  fldDef.Name     := 'REAL_TIME';
  fldDef.DataType := ftTime;
//  fldDef.Size     := 10;
  fldDef.Required := false;
  table.CreateTable;
  table.Active:=true;

  dsMesto.DataSet:=dmBase.SprKomiss;
  TBSubmenuMonth.Clear;
  for i:=1 to 12 do begin
    it:=TTbItem.Create(TBSubmenuMonth);
    it.Name:=name_tbitem+inttostr(i);
//    it.Images:=ImageListGisun;
//    it.ImageIndex:=3;
    it.Enabled:=false;
    it.Checked:=false;
    it.Caption:=NameM1[1][i];
    it.OnClick:=Event_ChMonth;
    TBSubmenuMonth.Add(it);
  end;

//  pnGurnal.Visible:=false;
//  pnGrafic.Align:=alClient;

//  pnGurnal.Align:=alClient;
//  pnGrafic.Visible:=false;

end;
//-----------------------------------------------------------
procedure TfmPredZapis.FormDestroy(Sender: TObject);
begin
  slReport.Free;
  slReportPar.Free;
  FSeek.Free;
  FListMestID.Free;
  if fmMain<>nil then
    fmMain.DeleteFromListGurnal(Self.Name);
end;
//----------------------------------------------------------
function TfmPredZapis.InitTime(dW1:TDateTime; dW2:TDateTime; nCountMin:Integer):Boolean;
var
  nHour,nMin,nS,nMS:Word;
  tableTIME,tableREAL_TIME:TField;
begin
  Result:=true;
  if not table.Active then table.Active:=true;
  table.EmptyTable;
  tableTIME:=table.FindField('TIME');
  tableREAL_TIME:=table.FindField('REAL_TIME');
  nMin:=0;
  while dW1<dW2 do begin
    table.Append;
    DecodeTime(dW1,nHour,nMin,nS,nMS);
    tableTIME.AsString:=PADLstr(IntToStr(nHour),2,' ')+':'+PADLstr(Inttostr(nMin),2,'0');
    tableREAL_TIME.AsDateTime:=dW1; // EncodeTime(nHour1,nMin,0,0);
    nMin:=nMin+nCountMin;
    if nMin>=60 then begin
      nMin:=nMin-60;
      nHour:=nHour+1;
    end;
    dW1:=EncodeTime(nHour,nMin,0,0);
//    tableTIME.AsString:=tableTIME.AsString+' - '+PADLstr(IntToStr(nHour),2,' ')+':'+PADLstr(Inttostr(nMin),2,'0');
    table.Post;
  end;
end;
//----------------------------------------------------------
procedure TfmPredZapis.SetCountDays(const Value: Integer);
begin
  FCountDays := Value;
end;

//----------------------------------------------------------------------------
function TfmPredZapis.DayOfWeek_(nDay:Integer):Integer;
begin
  Result:=DayOfWeek( EncodeDate(FCurYear,FCurMonth,nDay) );
  if Result=1 then Result:=7 else Result:=Result-1;
end;

//----------------------------------------------------------------------------
function TfmPredZapis.SetCurMonth(lBookmark:Boolean):Boolean;
var
  i,j,m,k,nMonth : Integer;
  nDay,nCol_ : Integer;
  dW1,dW2,dTime_,t:TDateTime;
  tableREAL_TIME,fld:TField;
  l:Boolean;
  col:TColumnEh;
//  n0,n1,n2,n3:Integer;
begin
  Result:=false;
  if FCurMonth=0 then exit;
  fld:=GetCurDayField;
  nCol_:=0;
  dTime_:=0;
  if (fld<>nil) and (FCurMonth>0) and lBookmark then begin
    nCol_:=Grid.Col;
    dTime_:=table.FieldByName('REAL_TIME').AsDateTime;
  end;
  nMonth:=FCurMonth;
  FCurMonth:=0;
  FNotWorkDays:='';
  FNotWorkTime.Clear;
  SetLEngth(FPrazdniki,0);
  if nMonth>0 then begin
    nMonth:=ReadMetaMonth(nMonth, FarrDays, FCurLong, FNotWorkDays, FNotWorkTime);
    if (nMonth>0) and (nMonth<=12) then begin
      FCurMonth:=nMonth;
      {
      for i:=0 to 11 do begin
        if TBSubmenuMonth.Items[i].Enabled and (nMonth=i+1) then begin
          TBSubmenuMonth.Items[i].Checked:=true;
          FCurMonth:=nMonth;
        end else begin
          TBSubmenuMonth.Items[i].Checked:=false;
        end;
      end;
      }
    end;
  end;

  FCountDays := 31;
  if (FCurMonth>0) and (FCurMonth<=12) then begin
    tableREAL_TIME:=Table.FindField('REAL_TIME');
    case FCurMonth of
      1,3,5,7,8,10,12 : begin
                          Grid.FieldColumns['DAY29'].Visible := true;
                          Grid.FieldColumns['DAY30'].Visible := true;
                          Grid.FieldColumns['DAY31'].Visible := true;
                        end;
      2               : begin
                          if IsLeapYear(FCurYear) then begin
                            Grid.FieldColumns['DAY29'].Visible := true;
                            FCountDays := 29;
                          end else begin
                            Grid.FieldColumns['DAY29'].Visible := false;
                            FCountDays := 28;
                          end;
                            Grid.FieldColumns['DAY30'].Visible := false;
                            Grid.FieldColumns['DAY31'].Visible := false;
                          end;
      4,6,9,11        : begin
                          Grid.FieldColumns['DAY29'].Visible := true;
                          Grid.FieldColumns['DAY30'].Visible := true;
                          Grid.FieldColumns['DAY31'].Visible := false;
                          FCountDays := 30;
                        end;

    end;

    cbDay.Items.Clear;
    cbDay.Items.Add('Все');
    for i:=1 to FCountDays do begin
      cbDay.Items.Add(IntToStr(i));
    end;
    cbDay.ItemIndex:=0;

    //    n0:=GetTickCount;
//    Grid.Visible:=false;
    if (FNotWorkDays<>'') then begin
      FNotWorkDays:=','+FNotWorkDays;
      if (RightStr(FNotWorkDays,1)<>',')
        then FNotWorkDays:=FNotWorkDays+',';
    end else begin
      FNotWorkDays:=',';
    end;
    for i:=1 to FCountDays do begin
      j := DayOfWeek_(i);

      if not FarrDays[j].FActive
        then FNotWorkDays:=FNotWorkDays+IntToStr(i)+',';    // соберем все нерабочие дни

      col:=Grid.FieldColumns['DAY'+IntToStr(i)];

      col.Title.Caption:=IntToStr(i)+chr(13)+chr(10)+GetNameDayWeek(j,false);
      if (j=6) or (j=7) then begin
        col.Title.Font.Color:=clRed;
      end else begin
        if IsPrazdnik(EncodeDate(FCurYear,FCurMonth,i))
          then col.Title.Font.Color:=clRed
          else col.Title.Font.Color:=clBlack;
      end;

      if FOnlyWorkDays then begin
        if Pos(','+IntToStr(i)+',',FNotWorkDays)>0
          then col.Visible:=false
          else col.Visible:=true;
      end else begin
        col.Visible:=true;
      end;

    end;
    dW1:=0;
    dW2:=0;
    for i:=Low(FarrDays) to High(FarrDays) do begin
      if FarrDays[i].FActive then begin
        if FarrDays[i].nTimeWB>dW1 then dW1:=FarrDays[i].nTimeWB;
        if FarrDays[i].nTimeWE>dW2 then dW2:=FarrDays[i].nTimeWE;
      end;
    end;
    l:=dbDisableControls(table);
    InitTime(dW1,dW2,FCurLong);
    table.First;
//    n1:=GetTickCount;
    m:=COLTB_DAY1+FCountDays-1;
    while not table.Eof do begin
      table.Edit;
      nDay:=1;
      for i:=COLTB_DAY1 to m do begin
        if Pos(','+IntToStr(nDay)+',',FNotWorkDays)=0 then begin
          j:=DayOfWeek_(nDay);
          t:=tableREAL_TIME.AsDateTime;
          if FarrDays[j].FActive then begin
            table.Fields[i].AsString:='0';
            if (tableREAL_TIME.AsDateTime<FarrDays[j].nTimeWB) or
               (tableREAL_TIME.AsDateTime>=FarrDays[j].nTimeWE) then begin
              table.Fields[i].AsString:='';
            end;
            if (FarrDays[j].nTimeOB>0) and (FarrDays[j].nTimeOE>0) then begin  // есть обеденное время
              if (tableREAL_TIME.AsDateTime>=FarrDays[j].nTimeOB) and
                 (tableREAL_TIME.AsDateTime<FarrDays[j].nTimeOE)
                then table.Fields[i].AsString:='';
            end;
            if FNotWorkTime.Count>0 then begin
              for k:=0 to FNotWorkTime.Count-1 do begin
                if (StrToInt(FNotWorkTime.Names[k])=i) and (STOT(FNotWorkTime.VAlueFromIndex[k])=t) then begin
                  table.Fields[i].AsString:='';
                end;
              end;
            end;
          end;
        end;
        Inc(nDay,1);
      end;
      table.Post;
      table.Next;
    end;
    dbEnableControls(table,l);
//    n2:=GetTickCount;
    ReadCurMonth;
//    n3:=GetTickCount;
    table.First;
    Grid.Visible:=FCurMonth>0;
    result:=true;
    if (FCurMonth>0) and (nCol_>0) then begin
      Grid.Col:=nCol_;
      if not Table.Locate('REAL_TIME', dTime_, [])
        then table.First;
    end;
//    showmessage(inttostr(n1-n0)+chr(13)+inttostr(n2-n1)+chr(13)+inttostr(n3-n2));
  end else begin

    Grid.Visible:=false;
  end;
end;
//---------------------------------------------------------------------------------------
procedure TfmPredZapis.TBSubmenuItemRefreshClick(Sender: TObject);
begin
  SetCurMonth(true);
//  ReadCurMonth;
end;
procedure TfmPredZapis.TBItemRefresh2Click(Sender: TObject);
begin
  SetCurMonth(true);
//  ReadCurMonth;
end;

//---------------------------------------------------------------------------------------
procedure TfmPredZapis.TBItemAutoRefreshClick(Sender: TObject);
begin
end;
//---------------------------------------------------------------------------------------
procedure TfmPredZapis.Timer1Timer(Sender: TObject);
var
  d:TDateTime;
begin
  if FAutoRefresh and (FCurMonth>0) and not FRun and (FLastDateCorr>0) then begin
    if (Screen.ActiveForm=self) and (ActiveControl=Grid) and pnGrafic.Visible then begin
      d:=GetDateCorCurMonth;
      if d<>FLastDateCorr then begin
        SetCurMonth(true);
      end;
    end;
  end;
end;
//---------------------------------------------------------------------------------------
procedure TfmPredZapis.SetAutoRefresh(const Value: Boolean);
begin
  FAutoRefresh:=Value;
  Timer1.Interval:=FCountMinRefresh*60*1000;
  Timer1.Enabled:=FAutoRefresh;
end;

//---------------------------------------------------------------------------------------
function TfmPredZapis.ReadCurMonth:Boolean;
var
  sFldDay:String;
  fldDecl,fldDay,fldTime,fldLong,fldID:TField;
  nLong,nDay,nNomer:Integer;
  cur:TCursor;
  l:Boolean;
begin
  FLastDateCorr:=0;
  Result:=false;
  if FCurMonth>0 then begin
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    Result:=true;

    FLastDateCorr:=GetDateCorCurMonth;

    tbPredZapis.SetRange([false,FTypeObj,FMesto,FCurYear,FCurMonth,1],[false,FTypeObj,FMesto,FCurYear,FCurMonth,31]);
    l:=dbDisableControls(table);
    try
      fldDay:=tbPredZapis.FindField('DAY');
      fldDecl:=tbPredZapis.FindField('DECL_ID');
      fldTime:=tbPredZapis.FindField('BEGINR');
      fldLong:=tbPredZapis.FindField('LONGR');
      fldID:=tbPredZapis.FindField('ID');
      nDay:=-1;
      nNomer:=0;
      tbPredZapis.First;
      while not tbPredZapis.Eof do begin
        sFldDay:='DAY'+fldDay.AsString;
        if nDay<>fldDay.AsInteger then begin
          nDay:=fldDay.AsInteger;
          nNomer:=0;
        end;
        Inc(nNomer,1);
        nLong:=fldLong.AsInteger;
        SetID( nNomer, table.FindField(sFldDay), fldID.AsInteger, fldTime.AsDateTime, nLong, fldDecl.AsString);
        tbPredZapis.Next;
      end;
    finally
      ClearPredZapis(false);
      Screen.Cursor:=cur;
      tbPredZapis.CancelRange;
      dbEnableControls(table,l);
      ReadPredZapis(Grid.Columns[Grid.SelectedIndex].Field.AsInteger,false,true);
    end;
  end;
end;

//---------------------------------------------------------------------------------------
function TfmPredZapis.ObrabCurMonth(Obrab:TObrabCurDay; ObrBegin,ObrEnd:TObrabPrep):Boolean;
var
//  sFldDay:String;
//  fldDecl,fldDay,fldTime,fldLong,fldID:TField;
  m,nDay,i,j:Integer;
  cur:TCursor;
  l,l2,lOk:Boolean;
begin
  lOk:=false;
  if (FCurMonth>0) and Assigned(Obrab) then begin
    cur:=crDefault;
    l:=dbDisableControls(table);
    l2:=dbDisableControls(tbView);
    lOk:=true;
    if Assigned(ObrBegin)
      then ObrBegin(lOk);
    try
      if lOk then begin
        cur:=Screen.Cursor;
        Screen.Cursor:=crHourGlass;
        OpenMessage('Выполняется обработка ...','',0);
        table.First;
        m:=COLTB_DAY1+FCountDays-1;
        while not table.Eof do begin
          nDay:=1;
          for i:=COLTB_DAY1 to m do begin
            if Pos(','+IntToStr(nDay)+',',FNotWorkDays)=0 then begin
              j:=DayOfWeek_(nDay);
              Obrab(table.Fields[i], nDay, j);
            end;
            Inc(nDay,1);
          end;
          table.Next;
          Application.ProcessMessages;
        end;
      end;
    finally
      if lOk then begin
        CloseMessage;
        Screen.Cursor:=cur;
        table.First;
      end;
      dbEnableControls(table,l);
      dbEnableControls(tbView,l2);
    end;
    if lOk then begin
      if Assigned(ObrEnd) then ObrEnd(lOk);
    end;  
  end;
  Result:=lOk;
end;

//---------------------------------------------------------------------------------------
procedure TfmPredZapis.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then begin
    if (Shift=[]) then begin
      EditPredZapis;
    end else if (Shift=[ssCtrl])  then begin
      EditDeclare;
    end;
    Key:=0;
  end else if (Key = VK_SPACE) then begin
    EditDeclare;
    Key:=0;
  end;
  if (Key=VK_F3) and (Shift=[]) then begin
    if Grid.Selection.DataCellSelected(Grid.Columns[0].Index,Grid.DataSource.Dataset.Bookmark) then begin
      Grid.Selection.Rows.CurrentRowSelected:=false;
      Grid.Selection.Refresh;
    end else begin
      Grid.Selection.Rows.CurrentRowSelected:=true;
      Grid.Selection.Refresh;
    end;
    Key:=VK_DOWN;
  end;
end;

procedure TfmPredZapis.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if pnGrafic.Visible then begin
    if Key=VK_PRIOR then begin
      if cbMonth.ItemIndex>0 then begin
        cbMonth.ItemIndex:=cbMonth.ItemIndex-1;
        FCurMonth:=cbMonth.ItemIndex+1;
        CheckValues;
        if Grid.Visible then ActiveControl:=Grid;
      end;
      Key:=0;
    end else if Key=VK_NEXT then begin
      if cbMonth.ItemIndex<11 then begin
        cbMonth.ItemIndex:=cbMonth.ItemIndex+1;
        FCurMonth:=cbMonth.ItemIndex+1;
        CheckValues;
        if Grid.Visible then ActiveControl:=Grid;
      end;
      Key:=0;
    end;
  end;
end;

//-----------------------------------------------------------------
procedure TfmPredZapis.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
var
  s,ss:String;
  dDecl:TDateTime;
//  n:Integer;
//  lSeek:Boolean;
begin
  if Copy(Column.FieldName,1,3)='DAY' then begin
    s:=Column.Field.AsString;
    if s='0' then begin
      Background:=$00E9E9E9 //   clSilver; //clInfoBk;
    end else if s='' then begin
      //Background:=clblue;
    end else begin
//      lSeek:=false;
//      if FSeek.Count>0 then begin
//        n:=FSeek.IndexOf(s);
//        if n>-1 then begin
//          Background:=clBlue;
//          lSeek:=true;
//        end;
//      end;
//      if not lSeek then begin
        ss:=Copy(Column.FieldName,4,5);
        if table.FieldByName('Z'+ss).AsInteger> 0 then begin   // подано заявление
          Background:=COLOR_RED;
        end else begin
          dDecl:=CalcDateDecl( EncodeDate(FCurYear,FCurMonth,StrToInt(ss)) );
          if Date>dDecl then begin  // просрочена дата подачи заявления
            Background:=COLOR_DECL;
          end else begin
            if table.FieldByName('N'+ss).AsInteger mod 2 > 0
              then Background:=$008BFF64 //clGreen
              else Background:=$00BCFFA6; //clBlue;
          end;
        end;
//      end;
    end;
  end;
end;
//-----------------------------------------------------------------
procedure TfmPredZapis.GridColumns1GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  //TDBGridColumnEh
  if FRole=ROLE_SYSADMIN then begin
    if Params.Text=''
      then Params.Text:='-'
      else Params.Text:=Params.Text+'-'+table.FieldByName('N'+Copy(TColumnEh(Sender).FieldName,4,5)).AsString; //Params.Text+'<'+Sender.ClassName+'>';
  end else begin
    if Params.Text=''
      then Params.Text:='-'
      else Params.Text:=table.FieldByName('N'+Copy(TColumnEh(Sender).FieldName,4,5)).AsString;
  end;
end;
//-----------------------------------------------------------------
procedure TfmPredZapis.TBItemEditClick(Sender: TObject);
//var
//  fld:TField;
begin
//  fld:=GetCurDayField;
//
//  ShowMessage(InttoStr(DayOfTheWeek(GetCurDateGrid(fld))));
  if pnGrafic.Visible then begin
    EditPredZapis;
  end else begin
    EditPredZapisGurnal;
  end;
end;
procedure TfmPredZapis.GridDblClick(Sender: TObject);
begin
  EditPredZapis;
end;

procedure TfmPredZapis.GridGurnDblClick(Sender: TObject);
begin
  EditPredZapisGurnal;
end;

//-----------------------------------------------------------------
procedure TfmPredZapis.TBItemChMonthClick(Sender: TObject);
begin
end;

//-----------------------------------------------------------------
// 0-нет данных   1-только метоинформация   2-метоинформация и данные
function TfmPredZapis.MonthExists(nMonth:Integer):Integer;
begin
  Result:=0;
  tbPredZapis.IndexFieldNames:=KEY_VIEW; //'OTKAZ;TYPEOBJ;MESTO;GOD;MONTH;DAY;BEGINR';
  tbPredZapis.SetRange([false,FTypeObj,FMesto,FCurYear,nMonth,0],[false,FTypeObj,FMesto,FCurYear,nMonth,31]);
  try
    tbPredZapis.First;
    if not tbPredZapis.Eof then begin
      if tbPredZapis.FieldByName('DAY').AsInteger=0
        then Result:=1
        else Result:=2;   // вообще-то  первая запись всегда должна содержать "ноль"
      tbPredZapis.Next;
      if tbPredZapis.FieldByName('DAY').AsInteger>0 then Result:=2;    // есть уже записанные люди
    end;
  finally
    tbPredZapis.CancelRange;
  end;
end;
//-----------------------------------------------------------------
// записать метаинформацию по месяцу
function TfmPredZapis.WriteMetaMonth(nMonth:Integer; arr:TArrParDay; nLong:Integer; sAddDays:String; aNotWorkTime:TStringList ):Boolean;
var
  ss,sOpis:String;
  h,m,s,ms:Word;
  i,n:Integer;
  slOpis:TStringList;
begin
  Result:=true;
  tbPredZapis.IndexFieldNames:=KEY_VIEW; //'TYPEOBJ;MESTO;GOD;MONTH;DAY;BEGINR;OTKAZ';
  if not tbPredZapis.Locate('OTKAZ;TYPEOBJ;MESTO;GOD;MONTH;DAY', VarArrayOf([false,FTypeObj,FMesto,FCurYear,nMonth,0]),[]) then begin
    if aNotWorkTime<>nil
      then exit;
    with tbPredZapis do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger:=FTypeObj;
      FieldByName('MESTO').AsInteger:=FMesto;
      FieldByName('GOD').AsInteger:=FCurYear;
      FieldByName('MONTH').AsInteger:=nMonth;
      FieldByName('DAY').AsInteger:=0;
      FieldByName('BEGINR').AsString:='';
      FieldByName('OTKAZ').AsBoolean:=false;
      Post;
    end;
  end;
  if aNotWorkTime=nil then begin   // пишем без
    sOpis:='';
    for i:=1 to 7 do begin
      ss:='';
      if arr[i].FActive then begin
        ss:=IntToStr(arr[i].FDay)+'=W(';
        DecodeTime(arr[i].nTimeWB,h,m,s,ms);
        ss:=ss+IntToStr(h)+':'+IntToStr(m)+'-';
        DecodeTime(arr[i].nTimeWE,h,m,s,ms);
        ss:=ss+IntToStr(h)+':'+IntToStr(m)+') ';
        DecodeTime(arr[i].nTimeOB,h,m,s,ms);
        ss:=ss+'L('+IntToStr(h)+':'+IntToStr(m)+'-';
        DecodeTime(arr[i].nTimeOE,h,m,s,ms);
        ss:=ss+IntToStr(h)+':'+IntToStr(m)+') ';
        sOpis:=sOpis+ss+chr(13)+chr(10);
      end;
    end;
    sOpis:=sOpis+'11='+IntToStr(nLong)+chr(13)+chr(10);
    sOpis:=sOpis+'12='+sAddDays+chr(13)+chr(10);
    sOpis:=sOpis+'13='+chr(13)+chr(10);
  end else begin                       // пишем только
    slOpis:=TStringList.Create;
    slOpis.Text:=tbPredZapis.FieldByName('OPIS').AsString;
    n:=slOpis.IndexOfName('13');
    ss:='';
    if aNotWorkTime.Count>0 then begin
      for i:=0 to aNotWorkTime.Count-1 do begin
        ss:=ss+StringReplace(aNotWorkTime.Strings[i],'=','/',[])+',';
      end;
    end;
    if n>-1 then slOpis.Strings[n]:='13='+ss else slOpis.Add('13='+ss);
    sOpis:=slOpis.Text;
    slOpis.Free;
  end;

  with tbPredZapis do begin
    Edit;
    FieldByName('OPIS').AsString:=sOpis;
    Post;
  end;
end;
//-----------------------------------------------------------------
// прочитать метаинформацию по месяцу
function TfmPredZapis.ReadMetaMonth(nMonth:Integer; var arrDays:TArrParDay; var nLong:Integer; var sAddDays:String; aNotWorkTime:TStringList ):Integer;
var
  ss,sOpis:String;
  m:Word;
  i,n,k,x:Integer;
  arr,arrT:TArrStrings;
begin
  Result:=0;
  tbPredZapis.IndexFieldNames:=KEY_VIEW;        //OTKAZ;TYPEOBJ;MESTO;GOD;MONTH;DAY;BEGINR
  aNotWorkTime.Clear;
  if nMonth<=0 then begin  // найдем последний актуальный месяц в базе
    tbPredZapis.SetRange([false,FTypeObj,FMesto,FCurYear],[false,FTypeObj,FMesto,FCurYear]);
    try
      tbPredZapis.Last;   // типа последний созданный месяц
      nMonth:=tbPredZapis.FieldByName('MONTH').AsInteger;
    finally
      tbPredZapis.CancelRange;
    end;
  end;
  if nMonth>0 then begin
    if tbPredZapis.FindKey([false,FTypeObj,FMesto,FCurYear,nMonth,0]) then begin
      ss:=tbPredZapis.FieldByName('OPIS').AsString;
      StrToArr(ss,arr,chr(13)+chr(10),true);
      Result:=nMonth;
      for i:=1 to 7 do begin
        arrDays[i].FDay:=i;
        arrDays[i].FActive:=false;
      end;
      if ss<>'' then begin
        try
          for i:=0 to Length(arr)-1 do begin
            n:=Pos('=',arr[i]);
            if (arr[i]<>'') and (n>0) then begin
              try
                m:=StrToInt(Copy(arr[i],1,n-1));
              except
                m:=9999;
              end;
              sOpis:=Copy(arr[i],n+1,Length(arr[i]));
              if sOpis<>'' then begin
                if m<=7 then begin
                  arrDays[m].FActive:=true;
                  n:=Pos('W(',sOpis)+2;
                  k:=StrScanPos( sOpis,')',n);
                  ss:=Copy(sOpis,n,k-n);
                  arrDays[m].nTimeWB:=GetTime(ss,1);
                  arrDays[m].nTimeWE:=GetTime(ss,2);
                  n:=Pos('L(',sOpis)+2;
                  k:=StrScanPos(sOpis,')',n);
                  ss:=Copy(sOpis,n,k-n);
                  arrDays[m].nTimeOB:=GetTime(ss,1);
                  arrDays[m].nTimeOE:=GetTime(ss,2);
                end else begin
                  if m=11 then begin  //
                    nLong:=StrToInt(sOpis);
                  end else if m=12 then begin
                    sAddDays:=Trim(sOpis);
                  end else if m=13 then begin
                    StrToArr(sOpis,arrT,',',true);
                    for x:=0 to Length(arrT)-1 do begin
                      arrT[x]:=StringReplace(arrT[x],'/','=',[]);
                      aNotWorkTime.Add(arrT[x]);
                    end;
                  end;
                end;
              end;
            end;
          end;
        except
          on E:Exception do begin
            PutError('Ошибка чтения параметров:'+E.Message);
          end;
        end;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------
function TfmPredZapis.GetTime(sTime:String; nType:Integer):TDateTime;
var
  arr:TArrStrings;
  hh,mm:Word;
begin
  arr:=StrToArr(sTime,'-',false);
  arr:=StrToArr(arr[nType-1],':',false);
  hh:=StrToInt(Trim(arr[0]));
  mm:=StrToInt(Trim(arr[1]));
  Result:=EncodeTime(hh,mm,0,0);
end;
//-----------------------------------------------------------------
function TfmPredZapis.GetID(fld:TField):Integer;
var
  s:String;
begin
  s:=fld.AsString;
  if s='' then begin
    Result:=0;
  end else begin
    Result:=StrToInt(s);
  end;
end;
//-----------------------------------------------------------------
procedure TfmPredZapis.SetID(nNomer:Integer; fld:TField; nID:Integer; dBegin:TDateTime; var nRealLong:Integer; sDecl:String);
var
  i,nCount,nCurID:Integer;
  sBookmark,sID,sDay:String;
  lBreak,lRenumber,lFirst:Boolean;
  fldNomer,fldDecl:TField;
  procedure WriteID(nnn:String;sss:String;ddd:String);
  begin
    table.Edit;
    fldNomer.AsString:=nnn;
    fld.AsString:=sss;
    if ddd<>'*'
      then fldDecl.AsString:=ddd;
    table.Post;
  end;
begin
//  l:=dbDisableControls(table);
  sBookmark:=table.Bookmark;
  table.CheckBrowseMode;
  sDay:=Copy(fld.FieldName,4,5);
  fldNOMER:=table.FindField('N'+sDay);
  fldDECL:=table.FindField('Z'+sDay);
  nCount:=Trunc(nRealLong/FCurLong);   // количество записей для записи
  sID:=IntToStr(nID);
  if nNomer>0 then lRenumber:=false else lRenumber:=true;
//  if nNomer>0 then begin  // передан номер по порядку, при чтении всего месяца
    if table.Locate('REAL_TIME', dBegin, []) then begin
      lBreak:=false;
      lFirst:=true;
      for i:=1 to nCount do begin
        if lFirst or (fld.AsString=sID) or (fld.AsString='0') or (fld.AsString='') then begin
          lFirst:=false;
          WriteID(IntToStr(nNomer),sID,sDecl);
          table.Next;
          if table.Eof then begin
            if i<nCount
              then nRealLong:=i*FCurLong;  // неоходимо уменьшить время регистрации
            lBreak:=true;
            break;
          end;
        end else begin            // если забрались на чужую регистрацию
          nRealLong:=(i-1)*FCurLong;  // неоходимо уменьшить время регистрации
          lBreak:=true;
          break;
        end;
      end;
      if not lBreak then begin
        while (fld.AsString=sID) and not table.Eof do begin
          if Pos(','+sDay+',',FNotWorkDays)>0
            then WriteID('','','')
            else WriteID('','0','');
          table.Next;
        end;
      end;
    end else begin
    // !!! ERROR !!!
    end;
  if lRenumber then begin
    table.First;
    nNomer:=0;
    nCurID:=0;
    while not table.Eof do begin
      nID:=GetID(fld);
      if nID>0 then begin
        if nCurID<>nID then begin
          nCurID:=nID;
          Inc(nNomer,1);
        end;
        WriteID(InttoStr(nNomer),IntToStr(nID),'*');
      end;
      table.Next;
    end;
  end;
  table.Bookmark:=sBookmark;
//  dbEnableControls(table,l);
end;
//-----------------------------------------------------------------
procedure TfmPredZapis.ClearID(fld:TField);
var
  nCurID,nID,nNomer:Integer;
  sBookmark,sDay:String;
  l:Boolean;
  fldNomer,fldDecl:TField;
  procedure WriteID(nnn:String;sss:String;ddd:String);
  begin
    table.Edit;
    fldNomer.AsString:=nnn;
    fld.AsString:=sss;
    if ddd<>'*' then fldDecl.AsString:=ddd;
    table.Post;
  end;
begin
  l:=dbDisableControls(table);
  sBookmark:=table.Bookmark;
  table.CheckBrowseMode;
  sDay:=Copy(fld.FieldName,4,5);
  fldNOMER:=table.FindField('N'+sDay);
  fldDECL:=table.FindField('Z'+sDay);
  nID:=fld.AsInteger;
  if table.Locate(fld.FieldName, fld.AsInteger, []) then begin
    while fld.AsInteger=nID do begin
      if Pos(','+sDay+',',FNotWorkDays)>0
        then WriteID('','','')
        else WriteID('','0','');
      table.Next;
    end;
    table.First;
    nNomer:=0;
    nCurID:=0;
    while not table.Eof do begin
      nID:=GetID(fld);
      if nID>0 then begin
        if nCurID<>nID then begin
          nCurID:=nID;
          Inc(nNomer,1);
        end;
        WriteID(IntToStr(nNomer),IntToStr(nID),'*');
      end;
      table.Next;
    end;
  end;
  table.Bookmark:=sBookmark;
  dbEnableControls(table,l);
  table.refresh;
//  Grid.Refresh;
end;

//-----------------------------------------------------------------
function TfmPredZapis.GetCurDateGrid(fld:TField):TDateTime;
begin
  if fld=nil then begin
    Result:=0;
  end else begin
    Result:=STOD( IntToStr(FCurYear)+PadLStr( IntToStr(FCurMonth), 2, '0')+PadLStr( Copy(fld.FieldName,4,5), 2, '0'),tdClipper);
  end;
end;
//--------------------------------------------------------------
function TfmPredZapis.GetCurTimeAsString:String;
begin
  Result:=FormatDateTime('HH:NN',table.FieldByName('REAL_TIME').AsDateTime);
end;
//-----------------------------------------------------------------
function TfmPredZapis.GetCurDayFromField(fld:TField):Integer;
begin
  if fld=nil
    then Result:=0
    else Result:=StrToInt(Copy(fld.FieldName,4,5));
end;
//-----------------------------------------------------------------
function TfmPredZapis.GetCurDayField:TField;
var
  fld:TField;
begin
  Result:=nil;
  if (FCurMonth>0) and Grid.Visible and  (Grid.SelectedIndex>0) then begin
    fld:=Grid.Columns[Grid.SelectedIndex].Field;
    if Copy(fld.FieldName,1,3)='DAY' then begin
      Result:=fld;
    end;
  end;
end;

//-----------------------------------------------------------------
procedure TfmPredZapis.EditPredZapis;
var
  nDay,nID,nNomer:Integer;
  s:String;
  fld:TField;
  lOk,lAdd:Boolean;
begin
  if (FCurMonth>0) and Grid.Visible and  (Grid.SelectedIndex>0) then begin
    fld:=Grid.Columns[Grid.SelectedIndex].Field;
    s:=fld.FieldName;        
    nID:=GetID(fld);
    if Copy(s,1,3)='DAY' then begin
      lOk:=true;
      if fld.AsString='' then begin
        if not Problem(' Нерабочее время. Продолжить ? ',mtConfirmation,self) then lOk:=false;
      end;
      if lOk then begin
        nDay:=StrToInt(Copy(s,4,10)) ; //StrToInt(Grid.Columns[Grid.SelectedIndex].Title.Caption);
        nNomer:=0;
        lAdd:=false;
        if FOnlyDeclare then begin
          EditDeclare;
        end else begin
          if nID=0 then begin
            nNomer:=SetNewNomerDok(fld,true);
            nID:=GetID(fld);   // возможно сформировали запись в графике, если включена фиксация
            if nNomer=0 then begin      // ошибка
              lOk:=false;
            end else begin
              if nID>0 then lAdd:=true;  // типа запись уже добавлена
            end;
          end;
          if lOk then begin
            if EditPredZapis_(lAdd, nID, nNomer, nDay, table.FieldByName('REAL_TIME').AsDateTime, self) then begin
              WritePredZapis(true,fld);
            end else begin
              if lAdd then begin
                // вышли без сохранения, а запись была принудительно добавлена
                if tbPredZapis.Locate('ID', tbEditID.AsInteger, []) then begin
                  tbPredZapis.Delete;
                  ClearID(fld);
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;
//-----------------------------------------------------------------
procedure TfmPredZapis.EditPredZapisGurnal;
var
  nDay,nID,nNomer:Integer;
begin
  if (FCurMonth>0) and GridGurn.Visible then begin
    nID:=Gurnal.FieldByName('ID').AsInteger;
    nDay:=Gurnal.fieldbyName('DAY').AsInteger;
    nNomer:=Gurnal.fieldbyName('NOMER').AsInteger;
    if nID>0 then begin
      if EditPredZapis_(false, nID, nNomer, nDay, Gurnal.fieldbyName('BEGINR').AsDateTime, self) then begin
        WritePredZapis(true,nil);
        GurnalRefresh(nID);
      end;
    end;
  end;
end;
//-----------------------------------------------------------------
procedure TfmPredZapis.GurnalRefresh(nID:Integer);
var
  nFirstID,Row:Integer;
begin
//  if nID=0 then
//     nID:=Gurnal.FieldByName('ID').AsInteger;
  Row:=GridGurn.Row;
  Gurnal.DisableControls;
  try
    Gurnal.MoveBy(-Pred(Row));
    nFirstID:=Gurnal.FieldByName('ID').AsInteger;
    Gurnal.Close;
    Gurnal.Open;

    if Gurnal.Locate('ID', nFirstID, []) then begin
      //теперь первая строка окажется посередине экрана поэтому надо ее поднять вверх и вернуться обратно
      Gurnal.MoveBy(Pred(GridGurn.VisibleRowCount));
      Gurnal.MoveBy(Row-GridGurn.VisibleRowCount);
    end
  finally
    Gurnal.EnableControls;
  end;
end;
//-----------------------------------------------------------------
procedure TfmPredZapis.TBItemClearClick(Sender: TObject);
var
  fld:TField;
begin
  if (FCurMonth>0) and Grid.Visible and  (Grid.SelectedIndex>0) then begin
    fld:=Grid.Columns[Grid.SelectedIndex].Field;
    DeletePredZapis(fld);
  end;
end;
//------------------------------------------------------------------
procedure TfmPredZapis.TBItemFullDeleteClick(Sender: TObject);
var
  fld:TField;
//  s:String;
  nID,nFirstID,Row:Integer;
begin
  if pnGrafic.Visible then begin
    if (FCurMonth>0) and Grid.Visible and  (Grid.SelectedIndex>0) then begin
      fld:=Grid.Columns[Grid.SelectedIndex].Field;
      FullDeletePredZapis(fld, GetID(fld));
    end;
  end else begin
    if (FCurMonth>0) and Gurnal.Active and (Gurnal.FieldByName('ID').AsInteger>0) then begin
      nID:=Gurnal.FieldByName('ID').AsInteger;

      Row:=GridGurn.Row;
      Gurnal.DisableControls;
      try
        Gurnal.MoveBy(-Pred(Row));
        nFirstID:=Gurnal.FieldByName('ID').AsInteger;
//        s:=Gurnal.Bookmark;

        FullDeletePredZapis(nil, nID);
        Gurnal.Close;
        Gurnal.Open;

        if Gurnal.Locate('ID', nFirstID, []) then begin
          //теперь первая строка окажется посередине экрана поэтому надо ее поднять вверх и вернуться обратно
          Gurnal.MoveBy(Pred(GridGurn.VisibleRowCount));
          Gurnal.MoveBy(Row-GridGurn.VisibleRowCount);
        end

{        if Gurnal.BookmarkValid(TBookmark(s)) then begin
          Gurnal.Bookmark:=s;
          //теперь первая строка окажется посередине экрана поэтому надо ее поднять вверх и вернуться обратно
          Gurnal.MoveBy(Pred(GridGurn.VisibleRowCount));
          Gurnal.MoveBy(Row-GridGurn.VisibleRowCount);
        end}
      finally
        Gurnal.EnableControls;
      end;
    end;
  end;
end;

procedure TfmPredZapis.CreateSubMenuReport;
var
  i:Integer;
  it : TTbItem;
//  sl:TStringList;
//  sep : TTbSeparatorItem;
begin
  {it := TTbItem.Create(TBSubItemRun);
  it.Caption:='Талон приглашение';
  it.OnClick:=Event_CheckErrorMens;
  TBSubItemRun.Add(it);

  sep := TTbSeparatorItem.Create(TBSubmenuRun);
  TBSubmenuRun.Add(sep);  }

  if FTypeObj=_TypeObj_ZRast then begin
    TBItemW1.Visible:=false;
    TBSeparatorItem2.Visible:=false;
  end;
  slReport.Clear;
  slReportPar.Clear;
  Globaltask.ListReport(Name, slReport); //,slReportPar);
  for i:=0 to slReport.Count-1 do begin
    it := TTbItem.Create(TBSubmenuItemPreView);
    it.Caption:=slReport.Names[i];
    it.Name:='Item_FR_'+IntToStr(i);
    it.Tag:=i;
    it.OnClick:=Event_PreviewReport;
    TBSubmenuItemPreView.Add(it);
  end;
//  TBSubmenuItemPreView.Visible:=(slReport.Count>0);
end;
//------------------------------------------------------------------
procedure TfmPredZapis.Event_PreviewReport(Sender:TObject);
var
  s:String;
  l:Boolean;
  n:Integer;
begin
  n:=TTBItem(Sender).Tag;
  s:=slReport.ValueFromIndex[n];
//  sPar:=slReportPar.ValueFromIndex[n];
//  if sPar<>'' then begin
//    GlobalTask.SetLastValueAsString('REPORT_PAR',sPar);
//  end;
  GlobalTask.SetLastValueAsString('REPORT_NAME', TTBItem(Sender).Caption);
  if s<>'' then begin
    if BeforeReport then begin
      l:=dbDisableControls(table);
      try
        GlobalTask.PreViewReport(s);
      finally
        dbEnableControls(table,l);
      end;
    end;
  end;
end;
//------------------------------------------------------------------
function TfmPredZapis.getAddName: String;
begin
   case FTypeObj of
    _TypeObj_ZBrak: Result:='BRAK';
    _TypeObj_ZRast: Result:='RAST';
  else
    Result:='ALL';
  end;
end;
//------------------------------------------------------------------
function TfmPredZapis.Prepare(nTypeObj:Integer; nGod:Integer; nMonth:Integer; nTypeEdit:Integer): Boolean;
var
  old,sAdd:String;
  i,nMesto:Integer;
begin
  Result:=false;
  FRun:=false;
  FListMestID.Clear;
  FTableDeclare:=nil;
  FRole:=nTypeEdit;
  FCurLong:=0;
  FNotWorkDays:='';
  FNotWorkTime.Clear;
  SetLength(FPrazdniki,0);
  FTypeShow:=0;
  FMestoName:='';
  FBase:=true;
  tbView.Active:=true;
  tbView.Append;
  tbView.Post;
  tbEdit.Active:=true;
  tbEdit.Append;
  tbEdit.Post;
  LoadFromIni;

  if nTypeEdit>0 then begin  // режим не администратора
    TBItemDeleteMonth.Visible:=false;
    TBItemCreateMonth.Visible:=false;
    TBItemFullDelete.Visible:=false;
    TBItemParams.Visible:=false;
    TBItemViewGurnal.Visible:=false;
  end;
  if nTypeEdit<>ROLE_SYSADMIN then
    TBItemDesignReport.Visible:=false;

  FTypeObj:=nTypeObj;  // !!!
  if FTypeObj=_TypeObj_ZBrak
    then FOnlyDeclare:=false
    else FOnlyDeclare:=true;

  sAdd:=getAddName;

  try
    tbPredZapis.Active:=true;
  except
    on E:Exception do begin
      PutError('Ошибка открытия таблицы:'+E.Message);
      exit;
    end;
  end;
  old:=tbPredZapis.IndexName;
//  tbPredZapis.IndexName:='REAL_KEY';
  tbPredZapis.IndexFieldNames:='TYPEOBJ;GOD;ID';
  tbPredZapis.SetRange([FTypeObj],[FTypeObj]);
  tbPredZapis.First;
  FMinYear:=tbPredZapis.FieldByName('GOD').AsInteger;
  if (FMinYear=0) or (FMinYear<2010)
    then FMinYear:=YearOf(Now)-1;
  tbPredZapis.CancelRange;
  tbPredZapis.IndexName:=old;
  tbPredZapis.First;

  FCheckNomer:=GlobalTask.GetMainParam('PRED_'+sAdd, 'CHECKNOMER', 'L', true);
  FCountMinRefresh:=GlobalTask.GetMainParam('PRED_'+sAdd, 'COUNTMIN', 'N', 1);
  AutoRefresh:=GlobalTask.GetMainParam('PRED_'+sAdd, 'AUTOREFRESH', 'L', false);
  FRaschetDay:=GlobalTask.GetMainParam('PRED_'+sAdd, 'RASCHETDAY', 'L', true);
  FVisitDay:=GlobalTask.GetMainParam('PRED_'+sAdd, 'VISITDAY', 'N', 3);
  FOnlyWorkDays:=GlobalTask.GetMainParam('PRED_'+sAdd, 'ONLYWORK', 'L', false);
  FTimeWork:=GlobalTask.GetMainParam('PRED_'+sAdd, 'TIMEWORK', 'C', 'с 9.00 до 13.00 / с 14.00 до 18.00 ч.');
  FTelefon:=GlobalTask.GetMainParam('PRED_'+sAdd, 'TELEFON', 'C', '25-71-53');
  FPorProv:=GlobalTask.GetMainParam('PRED_'+sAdd, 'PORPROV', 'C', 'фойе ДГО в 18.00');

  if FTypeObj=_TypeObj_ZBrak
    then nMesto:=GlobalTask.GetLastValueAsInteger('PRED_'+sAdd+'_MESTO')
    else nMesto:=0;

  if nGod=0   then nGod:=GlobalTask.GetLastValueAsInteger('PRED_'+sAdd+'_GOD');
  if nGod=0   then nGod:=YearOf(Now);
  if nMonth=0 then nMonth:=GlobalTask.GetLastValueAsInteger('PRED_'+sAdd+IntToStr(nGod));
  if (nMonth<=1) or (nMonth>12) then nMonth:=1;
//------ cbMesto ----------------------------------------------------
  dmBase.SprKomiss.First;
  while not dmBase.SprKomiss.Eof do begin
    if dmBase.SprKomiss.FieldByName('NAME').AsString<>'' then begin
      cbMesto.Items.Add(dmBase.SprKomiss.FieldByName('NAME').AsString);
      FListMestID.Add(dmBase.SprKomiss.FieldByName('ID').AsString);
    end;
    dmBase.SprKomiss.Next;
  end;
  dmBase.SprKomiss.First;
  cbMesto.Items.Add('ЗАГС');
  FListMestID.Add('0');
  i:=FListMestID.IndexOf(IntToStr(nMesto));
  if i>-1 then begin
    cbMesto.ItemIndex:=i;
  end else begin
    cbMesto.ItemIndex:=cbMesto.Items.Count-1;
  end;
  FMestoName:=cbMesto.Items[cbMesto.ItemIndex];
  FMesto:=StrToInt(FListMestID.Strings[cbMesto.ItemIndex]);
//--------------------------------------------------------------
  for i:=1 to 12 do begin
    cbMonth.Items.Add(LowerCase(NameM1[1][i]));
  end;
  cbMonth.ItemIndex:=nMonth-1;
//--------------------------------------------------------------
  for i:=FMinYear to YearOf(Now)+1 do begin
    cbGod.Items.Add(IntToStr(i));
  end;
  i:=cbGod.Items.IndexOf(IntToStr(nGod));
  if i=-1 then begin
    cbGod.ItemIndex:=0;
    nGod:=StrToInt(cbGod.Items[cbGod.ItemIndex]);
  end else begin
    cbGod.ItemIndex:=i;
  end;

//--------------------------------------------------------------
  FCurYear:=nGod;
  FCurMonth:=nMonth;

  if nTypeObj=_TypeObj_ZBrak then begin   // брак
    FTableDeclare:=dmBase.tbDeclBrak;
    CheckValues;
    CreateSubMenuReport;
    Caption:='График предварительной записи';
    Result:=true;
  end else begin                         // расторжение
    fmMain.ImageList.GetIcon(IL_PRED_ZAP_RAST,Icon);
    TBItemZ.ImageIndex:=58;
    FTableDeclare:=dmBase.DeclareTermMarriage;
    cbFirstBrak.Visible:=false;
    edDateDecl.Visible:=false;
    lbDateDecl.Visible:=false;
    lbON.Caption:='Он';
    lbONA.Caption:='Онa';
 //   Grid.FieldColumns['DATE_BRAK'].Title.Caption:='Расторжение брака|Дата';
    GridGurn.Columns[1].Title.Caption:='Расторжение брака|Дата';
    GridGurn.Columns[2].Title.Caption:='Расторжение брака|Время';
    GridGurn.Columns[3].Title.Caption:='Он';
    GridGurn.Columns[4].Title.Caption:='Она';

    cbMesto.Visible:=false;
    lbMesto.Visible:=false;

    CheckValues;
    CreateSubMenuReport;
    Caption:='График предварительной записи на расторжение брака';

    TBItemEdit.Visible:=false;
    TBItemEdit.ShortCut:=TextToShortCut('');
    TBItemClear.Visible:=false;
    TBItemClear.ShortCut:=TextToShortCut('');
    TBItemFullDelete.Visible:=false;
    TBItemFullDelete.ShortCut:=TextToShortCut('');

    Result:=true;
  end;
end;
//------------------------------------------------------------------
procedure TfmPredZapis.TBItemCreateMonthClick(Sender: TObject);
var
  lCreate:Boolean;
begin
  if (FRole=ROLE_SYSADMIN) or (FRole=ROLE_ADMIN) then begin
    if MonthPredZapis(self, lCreate) then begin
      CheckValues;
    end else if lCreate then begin
      FCurMonth:=cbMonth.ItemIndex+1;
      CheckValues;
//      CheckItemMonths;
    end;
  end;
end;
//------------------------------------------------------------------
procedure TfmPredZapis.FormResize(Sender: TObject);
begin
end;
//------------------------------------------------------------------
procedure TfmPredZapis.TBItemMestoClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRMESTREGISTR');
  if Opis<>nil then begin
    v := FMesto;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      FMesto:=v;
      FMestoName:=GetValueFieldEx(arrRec,'NAME','---');
      CheckValues;
    end;
  end;
end;
//------------------------------------------------------------------
procedure TfmPredZapis.Event_ChMonth(Sender:TObject);
var
  s:String;
  i:Integer;
begin
  s:=Copy(TComponent(Sender).Name,Length(name_tbitem)+1,5);
  FCurMonth:=StrToInt(s);
  for i:=0 to 11 do begin
    if (FCurMonth>0) and (FCurMonth=i+1) then begin
      TBSubmenuMonth.Items[i].Checked:=true;
    end else begin
      TBSubmenuMonth.Items[i].Checked:=false;
    end;
  end;
  CheckValues;
end;
//------------------------------------------------------------------
procedure TfmPredZapis.CheckItemMonths;
var
  i,n:Integer;
begin
  Query.SQL.Text:='SELECT DISTINCT typeobj,mesto,god,month FROM PredZapis WHERE typeobj='+IntToStr(FTypeObj)+
                  ' and mesto='+IntToStr(FMesto)+' and god='+IntToStr(FCurYear)+' and month>0 and day=0';
  Query.Open;
  for i:=0 to 11 do begin
    TBSubmenuMonth.Items[i].Enabled:=false;
    TBSubmenuMonth.Items[i].Checked:=false;
  end;
  while not Query.Eof do begin
    n:=Query.FieldByName('MONTH').AsInteger;
    if (n>0) and (n<=12) then begin
      TBSubmenuMonth.Items[n-1].Enabled:=true;
    end;
    Query.Next;
  end;
  Query.Close;
end;

//------------------------------------------------------------------
procedure TfmPredZapis.CheckValues(nID:Integer);
begin
  FRun:=true;
  try
    if pnGrafic.Visible then begin
      if Gurnal.Active then Gurnal.Active:=false;
      ClearPredZapis(false);
      SetCurMonth(false);
    end else begin
      if Gurnal.Active then Gurnal.Active:=false;
      Gurnal.ParamByName('par_god').AsInteger:=StrToInt(cbGod.Items[cbGod.ItemIndex]);
      Gurnal.ParamByName('par_month').AsInteger:=cbMonth.Itemindex+1;
      Gurnal.ParamByName('par_mesto').AsInteger:=FMesto;
      Gurnal.ParamByName('par_typeobj').AsInteger:=FTypeobj;
      if cbDay.Visible then begin
        if cbDay.ItemIndex>0 then begin
          Gurnal.ParamByName('par_day').AsInteger:=cbDay.ItemIndex;
          Gurnal.ParamByName('par_all').AsBoolean:=false;
        end else begin
          Gurnal.ParamByName('par_day').AsInteger:=999;
          Gurnal.ParamByName('par_all').AsBoolean:=true;
        end;
      end;
//      Gurnal.Prepare;
      Gurnal.Active:=true;
      if nID>0 then begin
        Gurnal.Locate('ID', nID, []);
      end;
    end;
    FErrorOpen:=false;
  finally
    FRun:=false;
  end;
end;
//-----------------------------------------------------------
procedure TfmPredZapis.GridColEnter(Sender: TObject);
begin
  if Grid.Col=1 then  Grid.Col:=2;
  if tbView.Active then begin
    ReadPredZapis(Grid.Columns[Grid.SelectedIndex].Field.AsInteger,false,true);
  end;
end;

procedure TfmPredZapis.dsTableDataChange(Sender: TObject; Field: TField);
begin
  if tbView.Active then begin
    ReadPredZapis(Grid.Columns[Grid.SelectedIndex].Field.AsInteger,false,true);
  end;
end;
//----выбрать из другой предварительной записи ---------------------------
procedure TfmPredZapis.TBItemPerevodClick(Sender: TObject);
var
//  Opis : TOpisEdit;
//  v : Variant;
  arrRec : TCurrentRecord;
  nLong,nCol,nID,nDay,nOldDay:Integer;
  dOldTime:TDateTime;
  fld,fldMesto:TField;
  sDate:String;
  l:Boolean;
  sBookMark:String;
  lAddHistiry:Boolean;
begin
  fld:=GetCurDayField;
  if fld<>nil then begin
    if GetID(fld)=0 then begin
      nDay:=GetCurDayFromField(fld);
      sDate:=DatePropis(GetCurDateGrid(fld),5);
//      nID:=ChoicePerenos('Перенести регистрацию на '+FormatDateTime('HH:NN',table.FieldByName('REAL_TIME').AsDateTime)+' '+sDate, self);
      nID:=SeekPredZapis('',arrRec, 0);
      if nID>0 then begin
        if tbPredZapis.Locate('ID', nID, []) then begin
          nOldDay:=0;
          dOldTime:=0;
          with tbPredZapis do begin
            if (FieldByName('MESTO').AsInteger=FMesto) and (FieldByName('GOD').AsInteger=FCurYear)
               and (FieldByName('MONTH').AsInteger=FCurMonth) then begin
              nOldDay:=FieldByName('DAY').AsInteger;
              dOldTime:=FieldByName('BEGINR').AsDateTime;
            end;
            if (FieldByName('GOD').AsInteger=FCurYear) and (FieldByName('MONTH').AsInteger=FCurMonth) and (FieldByName('DAY').AsInteger=nDay)
              then lAddHistiry:=false     // если не изменился день, не заносим в историю  (15.03.2018)
              else lAddHistiry:=true;
            Edit;
            FieldByName('MESTO').AsInteger:=FMesto;
            FieldByName('GOD').AsInteger:=FCurYear;
            FieldByName('MONTH').AsInteger:=FCurMonth;
            FieldByName('DAY').AsInteger:=nDay;
            FieldByName('BEGINR').AsDateTime:=table.FieldByName('REAL_TIME').AsDateTime;
            FieldByName('LONGR').AsInteger:=FCurLong;
            Post;
            if FieldByName('DECL_ID').AsInteger>0 then begin
              if FTableDeclare.Locate('ID', FieldByName('DECL_ID').AsInteger, []) then begin
                FTableDeclare.Edit;
                if lAddHistiry then begin
                  dmBase.DateBrakToHist(FieldByName('DECL_ID').AsInteger, FTableDeclare.FieldByName('NOMER').AsInteger,
                                        FTableDeclare.FieldByName('DATEZ').AsDateTime, FTableDeclare.FieldByName('DATEB').AsDateTime,
                                        FTableDeclare.FieldByName('TIMEB').AsDateTime);
                end;
                fldMesto:=FTableDeclare.FindField('MESTO');
                if fldMesto<>nil
                  then fldMesto.AsInteger:=FMesto;
                FTableDeclare.FieldByName('DATEB').AsDateTime:=STOD(IntToStr(FCurYear)+PadLStr(InttoStr(FCurMonth),2,'0')+PadLStr(IntToStr(nDay),2,'0') ,tdClipper);
                FTableDeclare.FieldByName('TIMEB').AsDateTime:=FieldByName('BEGINR').AsDateTime;
                FTableDeclare.Post;
              end;
            end;
            nCol:=grid.Col;
            sBookMark:=table.Bookmark;
            ReadPredZapis(FieldByName('ID').AsInteger,false,true);
            l:=dbDisableControls(table);
            if nOldDay>0 then begin
//              nRow:=Grid.Row;
//              table.MoveBy(-Pred(nRow));
              if table.Locate('REAL_TIME', dOldTime, []) then begin
                ClearID(table.FindField('DAY'+IntToStr(nOldDay)));
              end;
              //теперь первая строка окажется посередине экрана поэтому надо ее поднять вверх и вернуться обратно
//              table.MoveBy(Pred(Grid.VisibleRowCount));
//              table.MoveBy(nRow-Grid.VisibleRowCount);
            end;
            table.Bookmark:=sBookMark;
            Grid.Col:=nCol;
            nLong:=FCurLong;
            SetID(0,fld,nID,table.FieldByName('REAL_TIME').AsDateTime,nLong,FieldByName('DECL_ID').AsString);
            dbEnableControls(table,l);
          end;
        end;
      end;
    end else begin
      PutError('Время занято.',self)
    end;
  end;
  {
  Globaltask.SetLastValueAsString('WHERE_PREDZAPIS',' god='+IntToStr(FCurYear)+' and ');
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_PREDZAPIS');
  if Opis<>nil then begin
    v := null;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
//      FMesto:=v;
//      FMestoName:=GetValueFieldEx(arrRec,'NAME','---');
//      CheckValues;
    end;
  end;
  }
end;
//---- выписать или открыть заявление ------------------------------------
procedure TfmPredZapis.TBSubmenuItemZClick(Sender: TObject);
begin
end;
//---- выписать заявление ------------------------------------------------
procedure TfmPredZapis.TBItemZClick(Sender: TObject);
begin
  EditDeclare;
end;
//---- выписать заявление ------------------------------------------------
procedure TfmPredZapis.EditDeclare;
begin
  if FTypeObj=_TypeObj_ZBrak then begin
    EditDeclare_Brak;
  end else begin
    EditDeclare_Rast;
  end;
end;
//---- выписать заявление о браке ------------------------------------------------
procedure TfmPredZapis.EditDeclare_Brak;
var
  fld:TField;
  nDeclID,nNomer,nID,nMesto:Integer;
  slPar:TStringList;
  lOk:Boolean;
  dBrak:TDateTime;
  s,sOld:String;
begin
  fld:=GetCurDayField;
  if (fld<>nil) then begin
//    nDay:=GetCurDayFromField(fld);
//    fldDecl:=table.FindField('Z'+IntToStr(nDay));
//    nID:=fld.AsInteger;
    FRun:=true;
    try
      nNomer:=0;
      nID:=GetID(fld);

      if (nID=0) and not FOnlyDeclare then begin  // если FOnlyDeclare номер возьмем из номера заявления
        nNomer:=SetNewNomerDok(fld,true);
        nID:=GetID(fld);
        if nNomer=0 then begin
          exit; //    PutError('Ошибка формирования нового номера')
        end;
      end;

      ReadPredZapis(nID,false,true);
      dBrak:=GetCurDateGrid(fld);

      if tbViewDECL_ID.AsInteger=0 then begin
        sOld:=FTableDeclare.IndexFieldNames;
        FTableDeclare.IndexFieldNames:='DATEB;TIMEB';
        try
          FTableDeclare.SetRange([dBrak,table.FieldByName('REAL_TIME').AsDateTime],[dBrak,table.FieldByName('REAL_TIME').AsDateTime]);
          while not FTableDeclare.Eof do begin
            nMesto:=FTableDeclare.FieldByName('MESTO').AsInteger;
            if (nMesto=FMesto) and not FTableDeclare.FieldByName('OTKAZ').AsBoolean then begin
              EditDataSet(tbView);
              tbViewDECL_ID.AsInteger:=FTableDeclare.FieldByName('ID').AsInteger;
              PostDataSet(tbView);
            end;
            FTableDeclare.Next;
          end;
        finally
          FTableDeclare.CancelRange;
          FTableDeclare.IndexFieldNames:=sOld;
        end;
      end;

      SetLength(CurRecDok,1);   // !!!   для того что-бы заполнить редактируемый документ  fSimpleD.AdditeveWriteDok
      nDeclID:=0;
      IDLastDok:=0;
      slPar:=TStringList.Create;
      slPar.Add('FLD_DATE='+DTOS(GetCurDateGrid(fld),tdAds));
      slPar.Add('FLD_TIME='+FormatDateTime('HH:NN', table.FieldByName('REAL_TIME').AsDateTime));
      slPar.Add('FLD_MESTO='+IntToStr(FMesto));
      slPar.Add('FLD_ON='+tbViewON_FIO.AsString);
      slPar.Add('FLD_ONA='+tbViewONA_FIO.AsString);
      if FOnlyDeclare then s:='1' else s:='0';
      slPar.Add('FLD_ONLY='+s);
      if tbViewDECL_ID.AsInteger=0 then begin
        lOk:=true;
        if (GetID(fld)=0) and not FOnlyDeclare then begin
          if not Problem(' Нерабочее время. Продолжить ? ',mtConfirmation,self) then lOk:=false;
        end;
        if lOk then begin
          if EditDeclBrak(-1,slPar) and (IDLastDok>0) then begin
            nDeclID:=IDLastDok;
          end;
        end;
      end else begin
        if FTableDeclare.Locate('ID', tbViewDECL_ID.AsInteger, []) then begin
          nDeclID:=tbViewDECL_ID.AsInteger;
          EditDeclBrak(tbViewDECL_ID.AsInteger);
        end else begin
          if Problem(' Заявление не найдено. Выписать новое заявление ? ',mtConfirmation,self) then begin
            if EditDeclBrak(-1,slPar) and (IDLastDok>0) then begin
              nDeclID:=IDLastDok;
            end;
          end;
        end;
      end;
      if nDeclID>0 then begin
        PredZapisFromDeclare(fld,CurRecDok,nNomer);
  {
        WriteDeclID(nID, tbViewDECL_ID.AsInteger);
        EditDataSet(table);
        fldDecl.AsInteger:=tbViewDECL_ID.AsInteger;
        PostDataSet(table);  }
      end;

    finally
      FRun:=false;
    end;
  end;
end;
//---- выписать заявление о расторжении ------------------------------------------------
procedure TfmPredZapis.EditDeclare_Rast;
var
  fld:TField;
  nDeclID,nNomer,nID:Integer;
//  nMesto:Integer;
  slPar:TStringList;
  lOk:Boolean;
  dBrak:TDateTime;
  s,sOld:String;
begin
  fld:=GetCurDayField;
  if (fld<>nil) then begin
//    nDay:=GetCurDayFromField(fld);
//    fldDecl:=table.FindField('Z'+IntToStr(nDay));
//    nID:=fld.AsInteger;
    FRun:=true;
    try
      nNomer:=0;
      nID:=GetID(fld);

      if (nID=0) and not FOnlyDeclare then begin  // если FOnlyDeclare номер возьмем из номера заявления
        nNomer:=SetNewNomerDok(fld,true);
        nID:=GetID(fld);
        if nNomer=0 then begin
          exit; //    PutError('Ошибка формирования нового номера')
        end;
      end;

      ReadPredZapis(nID,false,true);
      dBrak:=GetCurDateGrid(fld);

      if tbViewDECL_ID.AsInteger=0 then begin
        sOld:=FTableDeclare.IndexFieldNames;
        FTableDeclare.IndexFieldNames:='DATEB;TIMEB';
        try
          FTableDeclare.SetRange([dBrak,table.FieldByName('REAL_TIME').AsDateTime],[dBrak,table.FieldByName('REAL_TIME').AsDateTime]);
          while not FTableDeclare.Eof do begin
            if FTableDeclare.FieldByName('OTKAZ').AsInteger=0 then begin   // числовой реквизит 1-отказ 2-неявка
              EditDataSet(tbView);
              tbViewDECL_ID.AsInteger:=FTableDeclare.FieldByName('ID').AsInteger;
              PostDataSet(tbView);
            end;
            FTableDeclare.Next;
          end;
        finally
          FTableDeclare.CancelRange;
          FTableDeclare.IndexFieldNames:=sOld;
        end;
      end;

      SetLength(CurRecDok,1);   // !!!   для того что-бы заполнить редактируемый документ  fSimpleD.AdditeveWriteDok
      nDeclID:=0;
      IDLastDok:=0;
      slPar:=TStringList.Create;
      slPar.Add('FLD_DATE='+DTOS(GetCurDateGrid(fld),tdAds));
      slPar.Add('FLD_TIME='+FormatDateTime('HH:NN', table.FieldByName('REAL_TIME').AsDateTime));
//      slPar.Add('FLD_MESTO='+IntToStr(FMesto));
      slPar.Add('FLD_ON='+tbViewON_FIO.AsString);
      slPar.Add('FLD_ONA='+tbViewONA_FIO.AsString);
      if FOnlyDeclare then s:='1' else s:='0';
      slPar.Add('FLD_ONLY='+s);
      if tbViewDECL_ID.AsInteger=0 then begin
        lOk:=true;
        if fld.AsString='' then begin
          if not Problem(' Нерабочее время. Продолжить ? ',mtConfirmation,self) then lOk:=false;
        end;
        if lOk then begin
          if EditDeclRast(-1,slPar) and (IDLastDok>0) then begin
            nDeclID:=IDLastDok;
          end;
        end;                           
      end else begin
        if FTableDeclare.Locate('ID', tbViewDECL_ID.AsInteger, []) then begin
          nDeclID:=tbViewDECL_ID.AsInteger;
          slPar.Clear;
          if FOnlyDeclare then s:='1' else s:='0';
          slPar.Add('FLD_ONLY='+s);
          EditDeclRast(tbViewDECL_ID.AsInteger,slPar);
        end else begin
          if Problem(' Заявление не найдено. Выписать новое заявление ? ',mtConfirmation,self) then begin
            if EditDeclRast(-1,slPar) and (IDLastDok>0) then begin
              nDeclID:=IDLastDok;
            end;
          end;
        end;
      end;
      if nDeclID>0 then begin
        PredZapisFromDeclare_Rast(fld,CurRecDok,nNomer);
  {
        WriteDeclID(nID, tbViewDECL_ID.AsInteger);
        EditDataSet(table);
        fldDecl.AsInteger:=tbViewDECL_ID.AsInteger;
        PostDataSet(table);  }
      end;

    finally
      FRun:=false;
    end;
  end;
end;
// ------- выбрать заявление ---------------------------------
procedure TfmPredZapis.ObrabBegin_FindZ(var lOk:Boolean);
begin
  if Problem('Произвести поиск всех заявлений ? ',mtConfirmation,self)  then begin
    lOk:=true;
    FTableDeclare.IndexFieldNames:='DATEB;TIMEB';
    FWorkCount:=0;
  end else begin
    lOk:=false;
  end;
end;
procedure TfmPredZapis.ObrabEnd_FindZ(var lOk:Boolean);
begin
  if FWorkCount>0 then begin
    ShowMessageCont('Найдено заявлений: '+IntToStr(FWorkCount),self);
  end else begin
    ShowMessageCont('Не найдено ни одного заявления.',self);
  end;
end;
//---------------------------------------------
procedure TfmPredZapis.Obrab_FindZ(fld:TField; nDay:integer; nDayWeek:Integer);
var
  d,t:TDateTime;
  nID,nMesto:Integer;
begin
  d:=GetCurDateGrid(fld);
  t:=Table.FieldByName('REAL_TIME').AsDateTime;
  FTableDeclare.SetRange([d,t],[d,t]);
  try
    while not FTableDeclare.Eof do begin
      nMesto:=FTableDeclare.FieldByName('MESTO').AsInteger;
      if (nMesto=FMesto) and (FTableDeclare.FieldByName('OTKAZ').AsBoolean=false) then begin
        nID:=fld.AsInteger;
  //      GetCurrentRecord(FTableDeclare, '', arrRec);

        ReadPredZapis(nID, false, true);
        EditDataSet(tbView);
        if tbViewID.AsInteger=0 then begin
          tbViewDAY.AsInteger:=nDay;
          if (FTableDeclare.FieldByName('ON_SEM').AsInteger=2) and (FTableDeclare.FieldByName('ONA_SEM').AsInteger=2)
            then tbViewFIRST_BRAK.AsBoolean:=true
            else tbViewFIRST_BRAK.AsBoolean:=false;
          tbViewBEGINR.AsDateTime:=t;
          tbViewLONGR.AsInteger:=FCurLong;
          tbViewDATER.AsDateTime:=Now;
          tbViewDATEB.AsString:='';
          tbViewSPEC.AsString:=GlobalTask.ParamAsString('СПЕЦ_ЗАГС');
        end;
        with FTableDeclare do begin
          tbViewDECL_ID.AsInteger:=FieldByName('ID').AsInteger;
          tbViewNOMER_Z.AsString:=FieldByName('NOMER').AsString;
          tbViewDATE_Z.AsDateTime:=FieldByName('DATEZ').AsDateTime;
          tbViewON_FIO.AsString:=FirstUpper(FieldByName('ON_FAMILIA').AsString+' '+FieldByName('ON_NAME').AsString+' '+FieldByName('ON_OTCH').AsString);
          tbViewONA_FIO.AsString:=FirstUpper(FieldByName('ONA_FAMILIA').AsString+' '+FieldByName('ONA_NAME').AsString+' '+FieldByName('ONA_OTCH').AsString);
        end;

        PostDataSet(tbView);
        WritePredZapis(false, fld);

        Inc(FWorkCount,1);
        break;
      end;
      FTableDeclare.Next;
    end;
  finally
    FTableDeclare.CancelRange;
  end;
end;
//---------------------------------------------
procedure TfmPredZapis.LoadAllDeclareRast;
var
  d,t,d1,d2,dDateR:TDateTime;
  nID,nDay,nNomer:Integer;
  l:Boolean;
  sBookmark:String;
  fld:TField;
  cur:TCursor;
begin
  if not Problem('Подключить заявления в которых дата расторжения брака: '+NameM1[1][FCurMonth]+' '+IntToStr(FCurYear)+' года ? ',mtConfirmation,self) then begin
    exit;
  end;
  FWorkCount:=0;
//  d:=GetCurDateGrid(fld);
//  t:=Table.FieldByName('REAL_TIME').AsDateTime;
  d1:=EncodeDate(FCurYear,FCurMonth,1);
  d2:=EndOfTheMonth(d1);

  if LockOperation_(_TypeObj_PredZapis_,'') then begin
    FRun:=true;
    FTableDeclare.IndexFieldNames:='DATEB;TIMEB';
    FTableDeclare.SetRange([d1],[d2]);
    sBookMark:=table.Bookmark;
    l:=dbDisableControls(table);
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;

    try
      while not FTableDeclare.Eof do begin
//        nMesto:=FTableDeclare.FieldByName('MESTO').AsInteger;
        if (FTableDeclare.FieldByName('OTKAZ').AsInteger=0) then begin
          d:=FTableDeclare.FieldByName('DATEB').AsDateTime;
          t:=FTableDeclare.FieldByName('TIMEB').AsDateTime;
          nDay:=DayOf(d);
          fld:=table.FindField('DAY'+IntToStr(nDay));
          if table.Locate('REAL_TIME', t, []) then begin
            nID:=fld.AsInteger;
    //      GetCurrentRecord(FTableDeclare, '', arrRec);

            ReadPredZapis(nID, true, true);
            EditDataSet(tbEdit);
            if tbEditID.AsInteger=0 then begin
              if FOnlyDeclare then begin
                nNomer:=FTableDeclare.FieldByName('NOMER').AsInteger;
                dDateR:=FTableDeclare.FieldByName('DATEZ').AsDateTime;
              end else begin
                nNomer:=SetNewNomerDok(fld,false);
                dDateR:=Now;
  //              nID:=GetID(fld);   // возможно сформировали запись в графике
              end;
              EditDataSet(tbEdit);
              tbEditDAY.AsInteger:=nDay;
              tbEditNOMER.AsInteger:=nNomer;
              tbEditDATER.AsDateTime:=dDateR;
              tbEditBEGINR.AsDateTime:=t;
              tbEditLONGR.AsInteger:=FCurLong;
              tbEditDATEB.AsString:='';
              tbEditSPEC.AsString:=GlobalTask.ParamAsString('СПЕЦ_ЗАГС');
            end;
            with FTableDeclare do begin
              tbEditDECL_ID.AsInteger:=FieldByName('ID').AsInteger;
              tbEditNOMER_Z.AsString:=FieldByName('NOMER').AsString;
              tbEditDATE_Z.AsDateTime:=FieldByName('DATEZ').AsDateTime;
              tbEditON_FIO.AsString:=FirstUpper(FieldByName('ON_FAMILIA').AsString+' '+FieldByName('ON_NAME').AsString+' '+FieldByName('ON_OTCH').AsString);
              tbEditONA_FIO.AsString:=FirstUpper(FieldByName('ONA_FAMILIA').AsString+' '+FieldByName('ONA_NAME').AsString+' '+FieldByName('ONA_OTCH').AsString);
            end;

            PostDataSet(tbEdit);
            WritePredZapis(true, fld);

            Inc(FWorkCount,1);
          end;
        end;
        FTableDeclare.Next;
      end;
    finally
      Screen.Cursor:=cur;
      dbEnableControls(table,l);
      FTableDeclare.CancelRange;
      UnLockOperation_(_TypeObj_PredZapis_);
      FRun:=false;
    end;

    if FWorkCount>0 then begin
      ShowMessageCont('Найдено заявлений: '+IntToStr(FWorkCount),self);
    end else begin
      ShowMessageCont('Не найдено ни одного заявления.',self);
    end;

  end;

end;
//-------------------------------------------
procedure TfmPredZapis.LoadAllDeclare;
var
  d,t,d1,d2,dDateR:TDateTime;
  nID,nMesto,nDay,nNomer:Integer;
  l:Boolean;
  sBookmark:String;
  fld:TField;
  cur:TCursor;
begin
  if not Problem('Подключить заявления в которых дата заключения брака: '+NameM1[1][FCurMonth]+' '+IntToStr(FCurYear)+' года ? ',mtConfirmation,self) then begin
    exit;
  end;
  FWorkCount:=0;
//  d:=GetCurDateGrid(fld);
//  t:=Table.FieldByName('REAL_TIME').AsDateTime;
  d1:=EncodeDate(FCurYear,FCurMonth,1);
  d2:=EndOfTheMonth(d1);

  if LockOperation_(_TypeObj_PredZapis_,'') then begin
    FRun:=true;
    FTableDeclare.IndexFieldNames:='DATEB;TIMEB';
    FTableDeclare.SetRange([d1],[d2]);
    sBookMark:=table.Bookmark;
    l:=dbDisableControls(table);
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;

    try
      while not FTableDeclare.Eof do begin
        nMesto:=FTableDeclare.FieldByName('MESTO').AsInteger;
        if (nMesto=FMesto) and (FTableDeclare.FieldByName('OTKAZ').AsBoolean=false) then begin
          d:=FTableDeclare.FieldByName('DATEB').AsDateTime;
          t:=FTableDeclare.FieldByName('TIMEB').AsDateTime;
          nDay:=DayOf(d);
          fld:=table.FindField('DAY'+IntToStr(nDay));
          if table.Locate('REAL_TIME', t, []) then begin
            nID:=fld.AsInteger;
    //      GetCurrentRecord(FTableDeclare, '', arrRec);

            ReadPredZapis(nID, true, true);
            EditDataSet(tbEdit);
            if tbEditID.AsInteger=0 then begin
              if FOnlyDeclare then begin
                nNomer:=FTableDeclare.FieldByName('NOMER').AsInteger;
                dDateR:=FTableDeclare.FieldByName('DATEZ').AsDateTime;
              end else begin
                nNomer:=SetNewNomerDok(fld,false);
                dDateR:=Now;
  //              nID:=GetID(fld);   // возможно сформировали запись в графике
              end;
              EditDataSet(tbEdit);
              tbEditDAY.AsInteger:=nDay;
              if (FTableDeclare.FieldByName('ON_SEM').AsInteger=2) and (FTableDeclare.FieldByName('ONA_SEM').AsInteger=2)
                then tbEditFIRST_BRAK.AsBoolean:=true
                else tbEditFIRST_BRAK.AsBoolean:=false;

              tbEditNOMER.AsInteger:=nNomer;
              tbEditDATER.AsDateTime:=dDateR;

              tbEditBEGINR.AsDateTime:=t;
              tbEditLONGR.AsInteger:=FCurLong;
              tbEditDATEB.AsString:='';
              tbEditSPEC.AsString:=GlobalTask.ParamAsString('СПЕЦ_ЗАГС');
            end;
            with FTableDeclare do begin
              tbEditDECL_ID.AsInteger:=FieldByName('ID').AsInteger;
              tbEditNOMER_Z.AsString:=FieldByName('NOMER').AsString;
              tbEditDATE_Z.AsDateTime:=FieldByName('DATEZ').AsDateTime;
              tbEditON_FIO.AsString:=FirstUpper(FieldByName('ON_FAMILIA').AsString+' '+FieldByName('ON_NAME').AsString+' '+FieldByName('ON_OTCH').AsString);
              tbEditONA_FIO.AsString:=FirstUpper(FieldByName('ONA_FAMILIA').AsString+' '+FieldByName('ONA_NAME').AsString+' '+FieldByName('ONA_OTCH').AsString);
            end;

            PostDataSet(tbEdit);
            WritePredZapis(true, fld);

            Inc(FWorkCount,1);
          end;
        end;
        FTableDeclare.Next;
      end;
    finally
      Screen.Cursor:=cur;
      dbEnableControls(table,l);
      FTableDeclare.CancelRange;
      UnLockOperation_(_TypeObj_PredZapis_);
      FRun:=false;
    end;

    if FWorkCount>0 then begin
      ShowMessageCont('Найдено заявлений: '+IntToStr(FWorkCount),self);
    end else begin
      ShowMessageCont('Не найдено ни одного заявления.',self);
    end;

  end;

end;

//--------------------------------------------------------------------------------------
function TfmPredZapis.PredZapisFromDeclare(fld:TField; var arrRec: TCurrentRecord; nNomer:Integer):Boolean;
var
  nDay,nID:Integer;
  t:TDateTime;
begin
  Result:=false;
  if Length(arrRec)>1 then begin
    Result:=true;
    if GetValueFieldEx(arrRec,'OTKAZ',false) then begin  // отказ от регистрации
      nID:=GetID(fld);
      if nID > 0 then begin
        if tbPredZapis.Locate('ID', nID, []) then begin
          tbPredZapis.Edit;
          tbPredZapis.FieldByName('OTKAZ').AsBoolean:=true;
          tbPredZapis.FieldByName('DECL_ID').AsString:='';
          tbPredZapis.Post;
          ClearID(fld);
        end else begin

        end;
      end;
    end else begin
      t:=Table.FieldByName('REAL_TIME').AsDateTime;
      nDay:=GetCurDayFromField(fld);
      EditDataSet(tbView);
      if tbViewID.AsInteger=0 then begin
        tbViewNOMER.AsInteger:=nNomer;
        tbViewDAY.AsInteger:=nDay;
        tbViewBEGINR.AsDateTime:=t;
        tbViewLONGR.AsInteger:=FCurLong;
        tbViewDATER.AsDateTime:=Now;
        tbViewDATEB.AsString:='';
        tbViewSPEC.AsString:=GlobalTask.ParamAsString('СПЕЦ_ЗАГС');
      end;
      if (GetValueFieldEx(arrRec,'ON_SEM',0)=2) and (GetValueFieldEx(arrRec,'ONA_SEM',0)=2)
        then tbViewFIRST_BRAK.AsBoolean:=true
        else tbViewFIRST_BRAK.AsBoolean:=false;
      tbViewDECL_ID.AsInteger:=GetValueFieldEx(arrRec,'ID',0);
      tbViewNOMER_Z.AsString:= GetValueFieldEx(arrRec,'NOMER','');
      tbViewDATE_Z.AsDateTime:=GetValueFieldEx(arrRec,'DATEZ',0);
      if FOnlyDeclare then begin
        tbViewNOMER.AsString:= GetValueFieldEx(arrRec,'NOMER','');
        tbViewDATER.AsDateTime:=GetValueFieldEx(arrRec,'DATEZ',0);
      end;
      tbViewON_FIO.AsString:=FirstUpper(GetValueFieldEx(arrRec,'ON_FAMILIA','')+' '+GetValueFieldEx(arrRec,'ON_NAME','')+' '+GetValueFieldEx(arrRec,'ON_OTCH',''));
      tbViewONA_FIO.AsString:=FirstUpper(GetValueFieldEx(arrRec,'ONA_FAMILIA','')+' '+GetValueFieldEx(arrRec,'ONA_NAME','')+' '+GetValueFieldEx(arrRec,'ONA_OTCH',''));
      if FOnlyDeclare or (tbViewTELEFON.AsString='') then begin
        tbViewTELEFON.AsString:=Concat2Str(GetValueFieldEx(arrRec,'ON_TELEFON',''), GetValueFieldEx(arrRec,'ONA_TELEFON',''), ', ');
      end;
      PostDataSet(tbView);
      WritePredZapis(false, fld);
    end;
    // что-бы изменилось поле DATE_CORR для текущего месяца
    CheckDateCorCurMonth;
  end;
end;
//--------------------------------------------------------------------------------------
function TfmPredZapis.PredZapisFromDeclare_Rast(fld:TField; var arrRec: TCurrentRecord; nNomer:Integer):Boolean;
var
  nDay,nID:Integer;
  t:TDateTime;
begin
  Result:=false;
  if Length(arrRec)>1 then begin
    Result:=true;
    if GetValueFieldEx(arrRec,'OTKAZ',0)>0 then begin  // отказ от регистрации
      nID:=GetID(fld);
      if nID > 0 then begin
        if tbPredZapis.Locate('ID', nID, []) then begin
          tbPredZapis.Edit;
          tbPredZapis.FieldByName('OTKAZ').AsBoolean:=true;
          tbPredZapis.FieldByName('DECL_ID').AsString:='';
          tbPredZapis.Post;
          ClearID(fld);
        end else begin

        end;
      end;
    end else begin
      t:=Table.FieldByName('REAL_TIME').AsDateTime;
      nDay:=GetCurDayFromField(fld);
      EditDataSet(tbView);
      if tbViewID.AsInteger=0 then begin
        tbViewNOMER.AsInteger:=nNomer;
        tbViewDAY.AsInteger:=nDay;
        tbViewBEGINR.AsDateTime:=t;
        tbViewLONGR.AsInteger:=FCurLong;
        tbViewDATER.AsDateTime:=Now;
        tbViewDATEB.AsString:='';
        tbViewSPEC.AsString:=GlobalTask.ParamAsString('СПЕЦ_ЗАГС');
      end;
      if (GetValueFieldEx(arrRec,'ON_SEM',0)=2) and (GetValueFieldEx(arrRec,'ONA_SEM',0)=2)
        then tbViewFIRST_BRAK.AsBoolean:=true
        else tbViewFIRST_BRAK.AsBoolean:=false;
      tbViewDECL_ID.AsInteger:=GetValueFieldEx(arrRec,'ID',0);
      tbViewNOMER_Z.AsString:= GetValueFieldEx(arrRec,'NOMER','');
      tbViewDATE_Z.AsDateTime:=GetValueFieldEx(arrRec,'DATEZ',0);
      if FOnlyDeclare then begin
        tbViewNOMER.AsString:= GetValueFieldEx(arrRec,'NOMER','');
      end;
      tbViewON_FIO.AsString:=FirstUpper(GetValueFieldEx(arrRec,'ON_FAMILIA','')+' '+GetValueFieldEx(arrRec,'ON_NAME','')+' '+GetValueFieldEx(arrRec,'ON_OTCH',''));
      tbViewONA_FIO.AsString:=FirstUpper(GetValueFieldEx(arrRec,'ONA_FAMILIA','')+' '+GetValueFieldEx(arrRec,'ONA_NAME','')+' '+GetValueFieldEx(arrRec,'ONA_OTCH',''));
      if FOnlyDeclare or (tbViewTELEFON.AsString='') then begin
        tbViewTELEFON.AsString:=Concat2Str(GetValueFieldEx(arrRec,'ON_TELEFON',''), GetValueFieldEx(arrRec,'ONA_TELEFON',''), ', ');
      end;
      PostDataSet(tbView);
      WritePredZapis(false, fld);
    end;
    // что-бы изменилось поле DATE_CORR для текущего месяца
    CheckDateCorCurMonth;
  end;
end;

// ------- выбрать заявление ---------------------------------
procedure TfmPredZapis.TBItemZChClick(Sender: TObject);
//var
//  Obrab:TObrabCurDay;
//  ObrBegin,ObrEnd:TObrabPrep;
begin
  if FCurMonth>0 then begin
    if FTypeObj=_TypeObj_ZBrak then begin
      LoadAllDeclare;
    end else begin
      LoadAllDeclareRast;
    end;
  end;
  {
  Obrab:=Obrab_FindZ;
  ObrBegin:=ObrabBegin_FindZ;
  ObrEnd:=ObrabEnd_FindZ;
  ObrabCurMonth(Obrab,ObrBegin,ObrEnd);
  }
end;

//-----------------------------------------------------------
procedure TfmPredZapis.ClearPredZapis(lEdit:Boolean);
var
  ds:TDataSet;
  i:Integer;
begin
  if lEdit then ds:=tbEdit else ds:=tbView;
  EditDataSet(ds);
  for i:=0 to ds.FieldCount-1 do begin
    ds.Fields[i].AsString:='';
  end;
  ds.FieldByName('ID').AsInteger:=0;
  {
  ds.FieldByName('DAY').AsInteger:=nDay;
  ds.FieldByName('FIRST_BRAK').AsBoolean:=true;
  ds.FieldByName('BEGINR').AsDateTime:=tm;
  ds.FieldByName('LONGR').AsInteger:=FCurLong;
  ds.FieldByName('DATER').AsDateTime:=Now;
  ds.FieldByName('DATEB').AsString:='';
  ds.FieldByName('SPEC').AsString:=GlobalTask.ParamAsString('СПЕЦ_ЗАГС');
  }
  PostDataSet(ds);
end;
//-----------------------------------------------------------
function TfmPredZapis.CalcDateDecl(DateBrak:TDateTime):TDateTime;
var
  d:TDateTime;
  n:Integer;
begin
  Result:=0;
  if FRaschetDay and (DateBrak>0) then begin
    d:=IncMonth(DateBrak,-3);
    n:=DayOfTheWeek(d);
    while n<>FVisitDay do begin
      d:=IncDay(d,1);
      n:=DayOfTheWeek(d);
    end;
    if IsPrazdnik(d) then d:=IncDay(d,7);
    Result:=d;
  end;
end;
//-----------------------------------------------------------
function TfmPredZapis.ReadPredZapis(ID:Integer; lEdit:Boolean; lFull:Boolean): Boolean;
var
  ds:TDataSet;
begin
  if lEdit then ds:=tbEdit else ds:=tbView;
  edDateDecl.Color:=clWindow;
  if ID<=0 then begin
    Result:=true;
    ClearPredZapis(lEdit);          
    exit;
  end;
  if (ID=tbPredZapis.FieldByName('ID').AsInteger) or tbPredZapis.Locate('ID', ID, []) then begin
    Result:=true;
    EditDataSet(ds);
    with tbPredZapis do begin
      ds.FieldByName('ID').AsInteger:=ID;
      ds.FieldByName('NOMER').AsInteger:=FieldByName('NOMER').AsInteger;
      ds.FieldByName('DAY').AsInteger:=FieldByName('DAY').AsInteger;
      ds.FieldByName('BEGINR').AsDateTime:=FieldByName('BEGINR').AsDateTime;
      ds.FieldByName('LONGR').AsInteger:=FieldByName('LONGR').AsInteger;
      ds.FieldByName('DECL_ID').AsInteger:=FieldByName('DECL_ID').AsInteger;
      ds.FieldByName('AKT_ID').AsInteger:=FieldByName('AKT_ID').AsInteger;
      ds.FieldByName('OPIS').AsString:=FieldByName('OPIS').AsString;
      if not lEdit then ds.FieldByName('OPIS').AsString:=Replace_CRLF(ds.FieldByName('OPIS').AsString,true);
      ds.FieldByName('DATER').AsDateTime:=FieldByName('DATER').AsDateTime;
      ds.FieldByName('DATEB').AsDateTime:=FieldByName('DATEB').AsDateTime;
      ds.FieldByName('TELEFON').AsString:=FieldByName('TELEFON').AsString;
      ds.FieldByName('ON_FIO').AsString:=FieldByName('ON_FIO').AsString;
      ds.FieldByName('ONA_FIO').AsString:=FieldByName('ONA_FIO').AsString;
      ds.FieldByName('FIRST_BRAK').AsBoolean:=FieldByName('FIRST_BRAK').AsBoolean;
      ds.FieldByName('SPEC').AsString:=FieldByName('SPEC').AsString;

      ds.FieldByName('YEAR').AsInteger:=FCurYear ;
      ds.FieldByName('MONTH').AsInteger:=FCurMonth;
      ds.FieldByName('DATE_BRAK').AsDateTime:=EncodeDate(FCurYear,FCurMonth,FieldByName('DAY').AsInteger);
      ds.FieldByName('MESTO').AsInteger:=FMesto;
      ds.FieldByName('DATE_Z').AsString:='';
      ds.FieldByName('NOMER_Z').AsString:='';
      ds.FieldByName('DATE_DECL').AsString:='';
    end;
 //=========================================================
    if FRaschetDay and not ds.FieldByName('DATE_BRAK').IsNull then begin
      ds.FieldByName('DATE_DECL').AsDateTime:=CalcDateDecl(ds.FieldByName('DATE_BRAK').AsDateTime);
    end;
//=========================================================
    if lFull and FBase then begin
      if ds.FieldByName('DECL_ID').AsInteger>0 then begin
        if FTableDeclare.Locate('ID', ds.FieldByName('DECL_ID').AsInteger, []) then begin
          ds.FieldByName('NOMER_Z').AsString:=FTableDeclare.FieldByName('NOMER').AsString;
          if not FTableDeclare.FieldByName('DATEZ').IsNull
            then ds.FieldByName('DATE_Z').AsDateTime:=FTableDeclare.FieldByName('DATEZ').AsDateTime;
        end;
      end;
//      if ds.FieldByName('AKT_ID').AsInteger>0 then begin

//      end;
    end;
    PostDataSet(ds);
    if ds.FieldByName('NOMER_Z').AsString='' then begin
      edNomerZ.Color:=clWindow;
      edDateZ.Color:=clWindow;
      if FTypeObj=_TypeObj_ZBrak then begin
        if ds.FieldByName('DATE_DECL').IsNull then begin
          lbDateDecl.Visible:=false;
          edDateDecl.Visible:=false;
        end else begin
          if Date>ds.FieldByName('DATE_DECL').AsDateTime
            then edDateDecl.Color:=COLOR_DECL;
          lbDateDecl.Visible:=true;
          edDateDecl.Visible:=true;
        end;
      end;
    end else begin
      edNomerZ.Color:=COLOR_RED;
      edDateZ.Color:=COLOR_RED;
      lbDateDecl.Visible:=false;
      edDateDecl.Visible:=false;
    end;
  end else begin
    Result:=false;
    ClearPredZapis(lEdit);
  end;
end;
//-------------------------------------------------------------------
function TfmPredZapis.WriteDeclID(nID:Integer; nDeclID:Integer): Boolean;
begin
  if tbPredZapis.Locate('ID', nID, []) then begin
    tbPredZapis.Edit;
    tbPredZapis.FieldByName('DECL_ID').AsInteger:=nDeclID;
    tbPredZapis.Post;
    result:=true;
  end else begin
    result:=false;
    PutError('Ошибка записи. Строка не найдена.',self);
  end;
end;
//-------------------------------------------------------------------
function TfmPredZapis.PredZapisExists(nDay:Integer; dBegin:TDateTime; lOtkaz:Boolean): Boolean;
begin
  result:=false;
  tbPredZapis.IndexFieldNames:=KEY_VIEW; //OTKAZ;TYPEOBJ;MESTO;GOD;MONTH;DAY;BEGINR
  if tbPredZapis.FindKey([lOtkaz,FTypeObj,FMesto,FCurYear,FCurMonth,nDay,dBegin]) then begin
    // кто-то уже записал
    if (tbPredZapis.FieldByName('ID').AsInteger>0) then begin
      result:=true;
    end else begin
      result:=false;
    end;
  end;
end;
//-------------------------------------------------------------------
function TfmPredZapis.WritePredZapis(lEdit:Boolean; fld:TField): Boolean;
var
  ds,dsWrite:TDataSet;
  lOk:Boolean;
  nLong:Integer;
  l:Boolean;
begin                   
  if lEdit then ds:=tbEdit else ds:=tbView;
  lOk:=false;
  if (ds.FieldByName('DAY').AsInteger>0) and (ds.FieldByName('BEGINR').AsDateTime>0) then begin
    if ds.FieldByName('ID').AsInteger=0 then begin
      tbPredZapis.IndexFieldNames:=KEY_VIEW; //OTKAZ;TYPEOBJ;MESTO;GOD;MONTH;DAY;BEGINR
      if tbPredZapis.FindKey([false,FTypeObj,FMesto,FCurYear,FCurMonth,ds.FieldByName('DAY').AsInteger,ds.FieldByName('BEGINR').AsDateTime]) then begin
        // кто-то уже записал
        if tbPredZapis.FieldByName('ID').AsInteger>0 then begin
          PutError('Время занято. Специалист: '+tbPredZapis.FieldByName('SPEC').AsString+' дата и время: '+
                             FormatDateTime('dd.mm.yyyy  hh:nn',tbPredZapis.FieldByName('DATER').AsDateTime));
        end else begin
          lOk:=true;
        end;
      end else begin
        lOk:=true;
        tbPredZapis.Append;
        tbPredZapis.FieldByName('TYPEOBJ').AsInteger:=FTypeObj;
        tbPredZapis.FieldByName('MESTO').AsInteger:=FMesto;
        tbPredZapis.FieldByName('GOD').AsInteger:=FCurYear;
        tbPredZapis.FieldByName('MONTH').AsInteger:=FCurMonth;
        tbPredZapis.FieldByName('DAY').AsInteger:=ds.FieldByName('DAY').AsInteger;
        tbPredZapis.FieldByName('BEGINR').AsDateTime:=ds.FieldByName('BEGINR').AsDateTime;
        tbPredZapis.FieldByName('OTKAZ').AsBoolean:=false;
        tbPredZapis.Post;
      end;
      if lOk then begin
        EditDataSet(ds);
        ds.FieldByName('ID').AsInteger:=tbPredZapis.FieldByName('ID').AsInteger;
        PostDataSet(ds);
      end;
    end else begin
      if tbPredZapis.Locate('ID', ds.FieldByName('ID').AsInteger, []) then begin
        lOk:=true;
      end else begin
        PutError('Ошибка записи. Строка не найдена.',self);
      end;
    end;
    if lOk then begin
//      if IsGrafic then begin
      dsWrite:=tbPredZapis;
//      end else begin
//        dsWrite:=Gurnal;
//      end;
      with dsWrite do begin
        Edit;
        FieldByName('NOMER').AsInteger:=ds.FieldByName('NOMER').AsInteger;
        FieldByName('LONGR').AsInteger:=ds.FieldByName('LONGR').AsInteger;
        FieldByName('DECL_ID').AsInteger:=ds.FieldByName('DECL_ID').AsInteger;
        FieldByName('AKT_ID').AsInteger:=ds.FieldByName('AKT_ID').AsInteger;
        FieldByName('OPIS').AsString:=ds.FieldByName('OPIS').AsString;
        FieldByName('DATER').AsDateTime:=ds.FieldByName('DATER').AsDateTime;
        FieldByName('DATEB').AsDateTime:=ds.FieldByName('DATEB').AsDateTime;
        FieldByName('TELEFON').AsString:=ds.FieldByName('TELEFON').AsString;
        FieldByName('ON_FIO').AsString:=ds.FieldByName('ON_FIO').AsString;
        FieldByName('ONA_FIO').AsString:=ds.FieldByName('ONA_FIO').AsString;
        FieldByName('FIRST_BRAK').AsBoolean:=ds.FieldByName('FIRST_BRAK').AsBoolean;
        FieldByName('SPEC').AsString:=ds.FieldByName('SPEC').AsString;
        Post;
      end;
      // для режима графика
      if pnGrafic.Visible then begin
        EditDataSet(ds);
        ds.FieldByName('ID').AsInteger:=tbPredZapis.FieldByName('ID').AsInteger;
        PostDataSet(ds);
        l:=dbDisableControls(table);
        try
          if fld<>nil then begin
            nLong:=ds.FieldByName('LONGR').AsInteger;
            SetID(0,fld,ds.FieldByName('ID').AsInteger,ds.FieldByName('BEGINR').AsDateTime,nLong,ds.FieldByName('DECL_ID').AsString);
            // если пришлось уменьшить время
            if ds.FieldByName('LONGR').AsInteger<>nLong then begin
              tbPredZapis.Edit;
              tbPredZapis.FieldByName('LONGR').AsInteger:=nLong;
              tbPredZapis.Post;
              ShowMessageCont('Время регистрации уменьшено до '+intToStr(nLong)+' минут.', self);
            end;
          end;
          // что-бы изменилось поле DATE_CORR для текущего месяца
          CheckDateCorCurMonth;
        finally
          dbEnableControls(table,l);
        end;
      end else begin
      // для режима реестра
        // что-бы изменилось поле DATE_CORR для текущего месяца
        CheckDateCorCurMonth;
      end;
    end;
    Result:=lOk;
  end else begin
    Result:=false;
  end;
end;
//-------------------------------------------------------------------
procedure TfmPredZapis.TBItemDeleteMonth_Click(Sender: TObject);
var
  s:String;
  lOk:Boolean;
begin
  lOk:=true;
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'Вы хотите удалить предварительную запись за месяц ?'#13;
  s := s + 'ДАННЫЕ БУДУТ УТЕРЯНЫ БЕЗВОЗВРАТНО.'#13;
  s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
  s := s + 'введите слово ДА в поле ввода'#13;
  if not OkWarning(s) then begin
    lOk:=false;
  end;
  if lOk then begin
    Query.SQL.Text:='DELETE FROM PredZapis WHERE otkaz=false and typeobj='+IntToStr(FTypeObj)+
                    ' and mesto='+IntToStr(FMesto)+' and god='+IntToStr(FCurYear)+' and month='+IntToStr(FCurMonth)+';'+
                    'DELETE FROM PredZapis WHERE otkaz=true and typeobj='+IntToStr(FTypeObj)+
                    ' and mesto='+IntToStr(FMesto)+' and god='+IntToStr(FCurYear)+' and month='+IntToStr(FCurMonth)+';';
    Query.ExecSQL;
   // FCurMonth:=0;
    CheckValues;
  end;
end;
//---------------------------------------------------------
procedure TfmPredZapis.CheckDateCorCurMonth;
var
  lErr,lRefresh:Boolean;
begin
  // что-бы изменилось поле DATE_CORR для текущего месяца
  tbPredZapis.IndexFieldNames:=KEY_VIEW;
  if tbPredZapis.FindKey([false,FTypeObj,FMesto,FCurYear,FCurMonth,0]) then begin
    lErr:=false;
    lRefresh:=false;
    try
      if FLastDateCorr<>tbPredZapis.FieldByName('DATE_CORR').AsDateTime then begin
        lRefresh:=true;
      end;
      tbPredZapis.Edit;
      tbPredZapis.FieldByName('DAY').AsInteger:=0;
      tbPredZapis.Post;

      tbPredZapis.Edit;
      FLastDateCorr:=tbPredZapis.FieldByName('DATE_CORR').AsDateTime;
      tbPredZapis.Cancel;
    except
      lErr:=true;
    end;
    if not lErr and lRefresh then begin
      SetCurMonth(true);
    end;
  end;
end;
//---------------------------------------------------------
function TfmPredZapis.GetDateCorCurMonth:TDateTime;
begin
  Result:=0;
  tbPredZapis.IndexFieldNames:=KEY_VIEW;
  if tbPredZapis.FindKey([false,FTypeObj,FMesto,FCurYear,FCurMonth,0]) then begin
    Result:=tbPredZapis.FieldByName('DATE_CORR').AsDateTime;
  end;
end;
//-------------------------------------------------------------------
function TfmPredZapis.DeletePredZapis(fld:TField): Boolean;
var
  nID:Integer;
begin
  Result:=false;
  nID:=GetID(fld);
  if nID>0 then begin
    if tbPredZapis.Locate('ID', nID, []) then begin
      if Problem('Освободить время предварительной записи на '+
                 FormatDateTime('HH:NN',tbPredZapis.FieldByName('BEGINR').AsDateTime)+' '+
                 tbPredZapis.FieldByName('DAY').AsString+' ' +NameM[1][FCurMonth]+' ?',mtConfirmation,self) then begin
        tbPredZapis.Edit;
        tbPredZapis.FieldByName('OTKAZ').AsBoolean:=true;
        tbPredZapis.FieldByName('DECL_ID').AsString:='';
        tbPredZapis.Post;
        ClearID(fld);
        Result:=true;
        // что-бы изменилось поле DATE_CORR для текущего месяца
        CheckDateCorCurMonth;
      end;
    end else begin
      PutError('Запись в базе не найдена');
    end;
  end;
end;
//-------------------------------------------------------------------
function TfmPredZapis.FullDeletePredZapis(fld:TField; nID:Integer): Boolean;
var
//  nID:Integer;
  lOk:Boolean;
  s:String;
begin
  Result:=false;
//  nID:=GetID(fld);
  if nID>0 then begin
    if tbPredZapis.Locate('ID', nID, []) then begin
      lOk:=true;
      s := '';
      s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
      s := s + 'Вы хотите полностью удалить данные на '#13;
      s := s + TTOS(tbPredZapis.FieldByName('BEGINR').AsDateTime)+'   '+tbPredZapis.FieldByName('DAY').AsString+' ' +NameM[1][FCurMonth]+chr(13);
      s := s + 'Если Вы уверены в необходимости удаления,'#13;
      s := s + 'введите слово ДА в поле ввода'#13;
      if not OkWarning(s) then begin
        lOk:=false;
      end;
      if lOk then begin
        tbPredZapis.Delete;
        if IsGrafic and (fld<>nil) then begin
          ClearID(fld);
        end;
        Result:=true;
        // что-бы изменилось поле DATE_CORR для текущего месяца
        CheckDateCorCurMonth;
      end;
    end else begin
      PutError('Запись в базе не найдена');
    end;
  end;
end;

//-------------------------------------------------------------------------
procedure TfmPredZapis.SaveToIni;
begin
  CompToIni(Self,GlobalTask.IniFile('FORM'),Name,GlobalTask.PropForm,true);
end;
//-------------------------------------------------------------------------
procedure TfmPredZapis.LoadFromIni;
begin
  CompFromIni(Self,GlobalTask.IniFile('FORM'),Name,GlobalTask.PropForm);
  if (Self.WindowState=wsNormal) then begin
    if (Self.Left<1) or (Self.Left>600) or (Self.Top<1) or (Self.Top>300) then begin
      Self.Left:=5;
      Self.Top:=5;
    end;
    if (Self.Width<800) then Self.Width:=800;
    if (Self.Height<600) then Self.Height:=600;
  end;
end;
//-------------------------------------------------
function TfmPredZapis.BeforeReport:Boolean;
var
  fld:TField;
  dDate:TDateTime;
  nDay,i:Integer;
  s:String;
begin
  fld:=GetCurDayField;
  if fld=nil then begin
    Result:=false;
  end else begin
    nDay:=GetCurDayFromField(fld);
    dDate:=GetCurDateGrid(fld);
    Result:=true;
    GlobalTask.SetLastValueAsDate('DATE',dDate);
    GlobalTask.SetLastValueAsInteger('DAY',nDay);
    GlobalTask.SetLastValueAsInteger('YEAR',FCurYear);
    GlobalTask.SetLastValueAsInteger('MONTH',FCurMonth);
    GlobalTask.SetLastValueAsInteger('MESTO',FMesto);
    GlobalTask.SetLastValueAsString('MESTONAME',FMestoName);
    GlobalTask.SetLastValueAsInteger('TYPEOBJ',FTypeObj);
    GlobalTask.SetLastValueAsInteger('COUNTDAYS',FCountDays);
    GlobalTask.SetLastValueAsString('NOTWORKDAYS',FNotWorkDays);
    GlobalTask.SetLastValueAsInteger('TYPESHOW',FTypeShow);
    GlobalTask.SetLastValueAsBoolean('ONLYDECLARE',FOnlyDeclare);

    s:='';
    if Grid.Selection.SelectionType=gstColumns then begin
      for i:=0 to Grid.Selection.Columns.Count-1 do begin
        fld:=Grid.Selection.Columns.Items[i].Field;
        if Copy(fld.FieldName,1,3)='DAY' then begin
          s:=s+Trim(Copy(fld.FieldName,4,5))+','
        end;
      end;
      if s<>'' then s:=Copy(s,1,Length(s)-1);
    end;
    GlobalTask.SetLastValueAsString('SELECTED',s);
    GlobalTask.SetWorkParam('RASCHET_DAY', FRaschetDay);
    GlobalTask.SetWorkParam('VISIT_DAY', FVisitDay);
    GlobalTask.SetWorkParam('TELEFON', FTelefon);
    GlobalTask.SetWorkParam('TIMEWORK', FTimeWork);
    GlobalTask.SetWorkParam('PORPROV', FPorProv);

  end;
end;

procedure TfmPredZapis.TBItemDesignReportClick(Sender: TObject);
begin
  if BeforeReport then
    GlobalTask.DesignTailReport(Name);
end;

procedure TfmPredZapis.TBItemPreViewClick(Sender: TObject);
begin
  if BeforeReport then
    GlobalTask.PreViewReport(Name);
end;

procedure TfmPredZapis.TBItemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPredZapis.N1Click(Sender: TObject);
begin
  Self.WindowState:=wsNormal;
  Application.ProcessMessages;
  Self.Top    := 5;
  Self.Left   := 5;
  Self.Width  := fmMain.ClientWidth-30;
  Self.Height := fmMain.ClientHeight-70;
end;

procedure TfmPredZapis.cbMestoClick(Sender: TObject);
begin
  FMestoName:=cbMesto.Items[cbMesto.ItemIndex];
  FMesto:=StrToInt(FListMestID.Strings[cbMesto.ItemIndex]);
  FCurMonth:=cbMonth.ItemIndex+1;
  CheckValues;
end;

procedure TfmPredZapis.cbMonthChange(Sender: TObject);
var
  i,n:Integer;
begin
  FCurMonth:=cbMonth.ItemIndex+1;
  n:=funcPr.CountDays(FCurYear,FCurMonth);
  cbDay.Items.Clear;
  cbDay.Items.Add('Все');
  for i:=1 to n do begin
    cbDay.Items.Add(IntToStr(i));
  end;
  cbDay.ItemIndex:=0;
  CheckValues;
end;

procedure TfmPredZapis.cbGodChange(Sender: TObject);
begin
  FCurYear:=StrToInt(cbGod.Items[cbGod.ItemIndex]);
  FCurMonth:=cbMonth.ItemIndex+1;
  CheckValues;
end;

//------------------------------------------------------------------------
procedure TfmPredZapis.GridTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
//
end;
{
var
  strFilter : String;
  CurValue:TParamFieldFlt;
begin
  CurValue:=TParamFieldFlt.Create;
  CurValue.AOwner:=self;
  CurValue.Empty:=true;  // !!!   типа нет текущих значений для поиска
  strFilter := GridSeekColumn(Column, true, false, CurValue);
  CurValue.Free;
  if Length(strFilter)>0 then begin
    Gurnal.Filter := strFilter;
    Gurnal.Filtered := true;
    TBItemClrFlt.Enabled:=true;
  end;
end;
}
procedure TfmPredZapis.Mesto_GridGetCellParams1(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  i:Integer;
begin
  i:=FListMestID.IndexOf(Params.Text);
  if i>-1 then begin
    Params.Text:=cbMesto.Items[i];
  end else begin
    Params.Text:='';
  end;
end;

function TfmPredZapis.SeekPredZapis(sCaption:String; var arrRec : TCurrentRecord; nDay:Integer):Integer;
var
  Opis : TOpisEdit;
  v : Variant;
  Params:TParamsEditSpr;
  s:String;                        
begin             
  Result:=0;
  if (FCurMonth<4) and (nDay=0) then begin
    s:='typeobj='+IntToStr(FTypeObj)+' and (god='+IntToStr(FCurYear)+' or (god='+IntToStr(FCurYear-1)+' and month>8)) and otkaz=false and ';
  end else begin
    s:='typeobj='+IntToStr(FTypeObj)+' and god='+IntToStr(FCurYear)+' and otkaz=false and ';
  end;
  if nDay>0
    then s:=s+' day='+IntToStr(nDay)+' and ';
  Globaltask.SetLastValueAsString('WHERE_PREDZAPIS',s);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_PREDZAPIS');
  if Opis<>nil then begin
    if FTypeObj=_TypeObj_ZBrak
      then Opis.ConfSection:='LOOKUP_PREDZAPIS'
      else Opis.ConfSection:='LOOKUP_PREDZAPIS_RAST'; //  !!!
    LoadOpis('KEY_MESTOREG', TStringList(cbMesto.Items), FListMestID );
    v := null;
    SetLength(arrRec,1);
    Params:=TParamsEditSpr.create;
    Params.FormatList.Add('MONTH=~L');
    Params.FormatList.Add('BEGINR=HH:NN~C');
    Params.FormatList.Add('DATE_BRAK=~C');
//    Params.FormatList.Add('DATER=DD.MM.YYYY HH:NN~C');
    Params.FormatList.Add('DATER=~C');
    Params.FormatList.Add('MESTO=~L');
    if sCaption=''
      then opis.Caption:='Выберите предварительную запись для переноса'
      else opis.Caption:=sCaption;
//    Params.Col1 := 'MESTO';
//    Params.GetCellParams_Col1:=Mesto_GridGetCellParams1;
    Opis.SetParamsEditSpr(Params);
    Opis.ParamsEditSpr.FreeOnExitSpr:=true;

    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      Result:=v;
    end;
  end;
end;

procedure TfmPredZapis.TBItemSeekClick(Sender: TObject);
var
  arrRec : TCurrentRecord;
  nMesto,i,nDay:Integer;
  nTime:TDateTime;
  lChange:Boolean;
begin
  if FCurMonth>0 then begin
    if SeekPredZapis('Найти запись',arrRec, 0)>0 then begin
      lChange:=false;
      nTime:=GetValueFieldEx(arrRec,'BEGINR',0);
      nDay:=GetValueFieldEx(arrRec,'DAY',1);
      if FCurMonth<>GetValueFieldEx(arrRec,'MONTH',1) then begin
        lChange:=true;
        FCurMonth:=GetValueFieldEx(arrRec,'MONTH',1);
        cbMonth.ItemIndex:=FCurMonth-1;
      end;
      nMesto:=GetValueFieldEx(arrRec,'MESTO',0);
      if FMesto<>nMesto then begin
        lChange:=true;
        i:=FListMestID.IndexOf(IntToStr(nMesto));
        if i>-1 then begin
          cbMesto.ItemIndex:=i;
        end else begin
          cbMesto.ItemIndex:=cbMesto.Items.Count-1;
        end;
        FMestoName:=cbMesto.Items[cbMesto.ItemIndex];
        FMesto:=StrToInt(FListMestID.Strings[cbMesto.ItemIndex]);
      end;
      if lChange
        then CheckValues;
      if FCurMonth>0 then begin
        if table.Locate('REAL_TIME',nTime,[]) then begin
          Grid.Col:=nDay+1;
          if tbView.Active then begin
            ReadPredZapis(Grid.Columns[Grid.SelectedIndex].Field.AsInteger,false,true);
          end;
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------
procedure TfmPredZapis.edONEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
end;

//----------------------------------------------------------------------
procedure TfmPredZapis.RenumberGurnal;
var
  d1:TDateTime;
  f:TfmParamQuest;
  n,m:Integer;
  s,sOld,sYear,sDate:String;
begin
//  CreateKeyYearsTemp('0#2');  = YearOf(Now);YearOf(Now)+1   KEY_YEARS_TEMP

  f:=TfmParamQuest.Create(Self);
  f.Caption:='Перенумеровать журнал';
  f.AddParamEx(dmBase.getCurDate, 'С какой даты' , 'DATE1' ,'TYPE=DATE');
//  f.AddParamEx(YearOf(Now), 'Год журнала' , 'YEAR1' ,'TYPE=LIST~DESC=KEY_YEARS_TEMP~WIDTH=100');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  d1:=0;
  if n=1 then begin
    d1:=f.GetValue('DATE1', 'D');
  end;
  f.Free;
  if (d1>0) then begin //and (d2>0) then begin
    sDate:=QStr(DTOS(d1,tdADS)+' 00:00:00');
    //---------------------------------------------------------------------
    sYear:=IntToStr(YearOf(d1));
    s:='SELECT TOP 1 NOMER FROM PredZapis WHERE typeobj='+IntToStr(FTypeObj)+' and day>0 and god='+IntToStr(FCurYear)+
                                                ' and dater<'+sDate+' and Year(dater)='+sYear+' '+
       'ORDER BY NOMER DESC';
    dmBase.WorkQuery.SQL.Text:=s;
    dmBase.WorkQuery.Open;
    m:=dmBase.WorkQuery.Fields[0].AsInteger+1;
    dmBase.WorkQuery.Close;
    //---------------------------------------------------------------------
    if Problem('Начальный номер: <'+IntToStr(m)+'>. Перенумеровать журнал за '+IntToStr(FCurYear)+' год, период с '+DatePropis(d1,3)+' ? ', mtConfirmation, self) then begin
      if dmBase._LockTypeObj(_TypeObj_PredZapis_,'') then begin
        try
          OpenMessage('Перенумерация ...', '', 0);
          s:='UPDATE PredZapis SET new_nomer=null WHERE TYPEOBJ='+IntToStr(FTypeObj)+' and day>0 and god='+IntToStr(FCurYear)+
                                                      ' and dater>='+sDate+' and new_nomer is not null;';
          dmBase.WorkQuery.SQL.Text:=s;
          dmBase.WorkQuery.ExecSQL;
          dmBase.WorkQuery.Close;
          sOld:=tbPredZapis.IndexFieldNames;
          tbPredZapis.IndexFieldNames:='TYPEOBJ;GOD;ID';
          tbPredZapis.SetRange([FTypeObj,FCurYear],[FTypeObj,FCurYear]);
          tbPredZapis.Filter:='day>0 and dater>=STOTS('+QStr(DTOS(d1,tdClipper)+' 00:00.00')+' ) ';
          tbPredZapis.Filtered:=true;
          tbPredZapis.First;
          while not tbPredZapis.Eof do begin
            tbPredZapis.Edit;
            tbPredZapis.FieldByName('NEW_NOMER').AsInteger:=m;
            Inc(m,1);
            tbPredZapis.Post;
            tbPredZapis.Next;
          end;

          s:='UPDATE PredZapis SET nomer=new_nomer WHERE TYPEOBJ='+IntToStr(FTypeObj)+' and day>0 and god='+IntToStr(FCurYear)+
                               ' and dater>='+sDate+' and Year(dater)='+sYear+' and new_nomer is not null;';
          dmBase.WorkQuery.SQL.Text:=s;
          dmBase.WorkQuery.ExecSQL;
          dmBase.WorkQuery.Close;

        finally
          tbPredZapis.Filter:='';
          tbPredZapis.Filtered:=false;
          tbPredZapis.CancelRange;
          tbPredZapis.IndexFieldNames:=sOld;
          CloseMessage;
          dmBase._UnLockTypeObj(_TypeObj_PredZapis_);
        end;
      end;
    end;
  end;
end;

//------------------------------------------------------------------
function TfmPredZapis.SetNewNomerDok(fld:TField; lRunLock:Boolean):Integer;
var
//  cur : TCursor;
  lLock:Boolean;
  nDay:Integer;
  sOld:String;
  t:TDateTime;
begin
  Result:=0;
  if FOnlyDeclare then exit;
  nDay:=GetCurDayFromField(fld);
  t:=table.FieldByName('REAL_TIME').AsDateTime;
  if PredZapisExists(nDay,t,false) then begin
//    PutError('Время занято. Специалист: '+tbPredZapis.FieldByName('SPEC').AsString+' дата и время: '+
//             FormatDateTime('dd.mm.yyyy  hh:nn',tbPredZapis.FieldByName('DATER').AsDateTime));
    PutError('Время занято.',self);
    SetCurMonth(true);
    exit;
  end;

  //-------------------------------------------------
  if lRunLock
    then lLock:=LockOperation_(_TypeObj_PredZapis_,'')
    else lLock:=true;
  //-------------------------------------------------
  if not lLock then begin
    exit;
  end;
//  cur:=Screen.Cursor;
//  Screen.Cursor:=crHourGlass;
  sOld:=tbPredZapis.IndexFieldNames;
  try

    tbPredZapis.IndexFieldNames:='TYPEOBJ;GOD;NOMER';
    tbPredZapis.SetRange([FTypeObj,FCurYear],[FTypeObj,FCurYear]);
    tbPredZapis.Last;
    Result:=tbPredZapis.FieldByName('NOMER').AsInteger+1;

  finally
    tbPredZapis.CancelRange;
    tbPredZapis.IndexFieldNames:=sOld;
//    Screen.Cursor:=cur;
  end;

  if (Result>0) and FFiksation then begin
    ClearPredZapis(true);
    EditDataSet(tbEdit);
    tbEditNOMER.AsInteger:=Result;
    tbEditID.AsInteger:=0;
    tbEditDAY.AsInteger:=nDay;
    tbEditBEGINR.AsDateTime:=t;
    tbEditLONGR.AsInteger:=FCurLong;
    tbEditDECL_ID.AsString:='';
    tbEditAKT_ID.AsString:='';
    tbEditDATER.AsDateTime:=Now;
    tbEditFIRST_BRAK.AsBoolean:=true;
    tbEditDATEB.AsString:='';
    tbEditSPEC.AsString:=GlobalTask.ParamAsString('СПЕЦ_ЗАГС');
    tbEdit.Post;
    WritePredZapis(true,fld);
  end;

  if lRunLock then UnLockOperation_(_TypeObj_PredZapis_);

end;

procedure TfmPredZapis.TBItemRenumberClick(Sender: TObject);
begin
  if FCurMonth>0 then
    RenumberGurnal;
end;

procedure TfmPredZapis.TBItemW1Click(Sender: TObject);
var
  Template:TTemplate;
begin
  Template:=fmMain.TemplateInterface.GetTemplate('fmPredZapis_Talon');
  if Template=nil then begin
    PutError('Не найден Word-шаблон.');
  end else begin
    if BeforeReport
      then fmMain.OnTemplateMenuClick(Template);
  end;
end;

procedure TfmPredZapis.TBItemWorkTimeClick(Sender: TObject);
var
  fld:TField;
  i,nDay:Integer;
  t:TDateTime;
  nSeek:Integer;
  lChange,lOk:Boolean;
begin
  fld:=GetCurDayField;
  if (FCurMonth>0) and (fld<>nil) then begin
    lChange:=false;
    if GetID(fld)=0 then begin        // дата пустая
      t:=table.FieldByName('REAL_TIME').AsDateTime;
      nDay:=GetCurDayFromField(fld);
      nSeek:=-1;
      for i:=0 to FNotWorkTime.Count-1 do begin
        lOk:=false;
        try
          if (StrToInt(FNotWorkTime.Names[i])=nDay) and (STOT(FNotWorkTime.ValueFromIndex[i])=t)
            then lOk:=true else lOk:=false;
        except
        end;
        if lOk then begin
          nSeek:=i;
          break;
        end;
      end;
      if nSeek>-1 then begin
        if fld.AsString='' then begin   // возвращаем в работу
          FNotWorkTime.Delete(i);
          EditdataSet(table);
          fld.AsString:='0';
          table.Post;
          lChange:=true;
        end else begin          // какая-то ошибочная информация
          FNotWorkTime.Delete(i);
          lChange:=true;
        end;
      end else begin
        if fld.AsString<>'' then begin   // будем удалять из рабочего времени
          EditdataSet(table);
          fld.AsString:='';
          table.Post;
          FNotWorkTime.Add(IntToStr(nDay)+'='+TTOS(t));
          lChange:=true;
        end;
      end;
    end;
    if lChange then begin
      WriteMetaMonth(FCurMonth, FArrDays, FCurLong, '', FNotWorkTime);
    end;
  end;
end;
//-----------------------------------------------------------
procedure TfmPredZapis.TBItemParamsClick(Sender: TObject);
var
  lRefresh:Boolean;
begin
  if ParamsPredZapis(self, lRefresh) then begin
    SaveMainParams;
    if lRefresh then
      SetCurMonth(false);
  end;
end;
//-----------------------------------------------------------
procedure TfmPredZapis.ViewFullGurnal;
var
  l:Boolean;
  fld:TField;
  nID:Integer;
begin
  if pnGurnal.Visible then begin
    // переключение в режим графика
    nID:=0;
    pnGrafic.Visible:=true;
    pnGurnal.Visible:=false;
    tbView.EnableControls;
    l:=true;
    Caption:='График предварительной записи';
    TBItemViewGurnal.Caption:='Журнал';
    TBItemViewGurnal.Hint:=TBItemViewGurnal.Caption;
  end else begin
    // переключение в режим журнала
    fld:=GetCurDayField;
    if fld=nil
      then nID:=0
      else nID:=GetID(fld);
    pnGurnal.Align:=alClient;
    pnGrafic.Visible:=false;
    pnGurnal.Visible:=true;
    tbView.DisableControls;
    l:=false;
    Caption:='Журнал предварительной записи';
    TBItemViewGurnal.Caption:='График';
    TBItemViewGurnal.Hint:=TBItemViewGurnal.Caption;
  end;
  cbDay.Visible:=not l;
  lbDay.Visible:=not l;

  TBSubmenuItemPreView.Visible:=l;
  TBItemSeek.Visible:=l;

  TBItemCreateMonth.Visible:=l;
  TBItemDeleteMonth.Visible:=l;

  TBItemZ.Visible:=l;
  TBItemClear.Visible:=l;
  TBItemPerevod.Visible:=l;
  TBItemRefresh2.Visible:=l;
  TBSubmenuRun.Visible:=l;
  TBItemParams.Visible:=l;
  TBItemViewGurnal.Checked:=not l;

  CheckValues(nID);
end;

//-----------------------------------------------------------
procedure TfmPredZapis.TBItemViewGurnalClick(Sender: TObject);
begin
  ViewFullGurnal;
end;

procedure TfmPredZapis.GridGurnGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
//   $00F4F4F4
//   $00ECFFFF
//  if Gurnal.FieldByName('DAY').AsInteger mod 2 = 0
//    then Background:=$00F4F4F4
//    else Background:=$00ECFFFF;
  if Gurnal.FieldByName('OTKAZ').AsBoolean
    then AFont.Color:=clRed;
end;


function TfmPredZapis.IsGrafic: Boolean;
begin
  Result:=pnGrafic.Visible;
end;

procedure TfmPredZapis.GridGurnColumns8GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
//  params.Text:=cbMesto.Items[FListMestID.IndexOf(params.Text)];
end;

end.
