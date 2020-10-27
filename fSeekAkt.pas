unit fSeekAkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MetaTask, OpisEdit,ifp_SelSovet, SasaIniFile,
  Dialogs, DB, adsdata, adsfunc, adstable, Grids, DBGridEh, DBCtrlsEh, FuncPr, dbFunc, dBase, mPermit,fExpDs, mExport,uTypes,
  { QueryThread,}
  TasksEx, AsyncCalls,
  uProject, fmStringSeek, StdCtrls, Mask, ExtCtrls, CheckLst, ImgList, TB2Item, TB2Dock, TB2Toolbar, uProjectAll,
  ComCtrls, kbmMemTable, ActnList, DBLookupEh, TB2ToolWindow, Buttons;

type
  TCurTypeSeek=record
    TypeObj:Integer;
    Name:String;
    arrN: array[0..4] of String;
    arrC: array[0..4] of Boolean;
  end;

  TfmSeekAkt = class(TForm)
    pnSeek: TPanel;
    edFamilia: TDBEditEh;
    lbName: TLabel;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    lbPol: TLabel;
    edPol: TDBComboBoxEh;
    edDateR1: TDBDateTimeEditEh;
    edDateR2: TDBDateTimeEditEh;
    lbDateR1: TLabel;
    lbDateR2: TLabel;
    Query: TAdsQuery;
    DataSource: TDataSource;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    FindButton: TTBItem;
    StopButton: TTBItem;
    OpenButton: TTBItem;
    LoadButton: TTBItem;
    ExitButton: TTBItem;
    ProgressImages: TImageList;
    ImageList1: TImageList;
    ProgressImageTimer: TTimer;
    Grid: TDBGridEh;
    ProgressImagePanel: TPanel;
    lbYear: TLabel;
    edYear1: TDBNumberEditEh;
    edYear2: TDBNumberEditEh;
    Label8: TLabel;
    gbType: TGroupBox;
    lbType: TCheckListBox;
    pbOpen: TProgressBar;
    tbSeek: TkbmMemTable;
    tbSeekNOMER: TIntegerField;
    tbSeekTYPEAKT: TIntegerField;
    tbSeekDATEZ: TDateField;
    tbSeekFAMILIA: TStringField;
    tbSeekNAME: TStringField;
    tbSeekOTCH: TStringField;
    tbSeekPOL: TStringField;
    tbSeekIDENTIF: TStringField;
    tbSeekDATER: TDateField;
    tbSeekKOMM: TStringField;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Table: TAdsTable;
    DataSource1: TDataSource;
    tbSeekID: TIntegerField;
    tbSeekVOSSTAN: TBooleanField;
    edOrgan: TDBLookupComboboxEh;
    Label7: TLabel;
    ProgressImage: TImage;
    Label1: TLabel;
    gbAddPar: TGroupBox;
    Label2: TLabel;
    Bevel1: TBevel;
    cbHist: TDBCheckBoxEh;
    Label3: TLabel;
    cbChild: TDBCheckBoxEh;
    cbON: TDBCheckBoxEh;
    cbONA: TDBCheckBoxEh;
    cbONu: TDBCheckBoxEh;
    cbONAu: TDBCheckBoxEh;
    Label4: TLabel;
    TBItemLog: TTBItem;
    TableHist: TAdsTable;
    TBItemExport: TTBItem;
    TBItemCheckZAGS: TTBItem;
    GridZAGS: TDBGridEh;
    DataSource2: TDataSource;
    tbZAGS: TAdsQuery;
    pnZAGS: TPanel;
    ed: TDBEditEh;
    SpeedButton1: TSpeedButton;
    imZAGS: TImage;
    TBItemCount: TTBItem;
    tbSeekNPP: TIntegerField;
    cbAll: TCheckBox;
    pnNotFound: TPanel;
    procedure ProgressImageTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure FindButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbAllClick(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure edOrganEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edOrganEditButtons1Click(Sender: TObject;   var Handled: Boolean);
    procedure edFamiliaChange(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure lbTypeClickCheck(Sender: TObject);
    procedure cbChildClick(Sender: TObject);
    procedure lbTypeDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure gbAddParClick(Sender: TObject);
    procedure TBItemLogClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure TBItemExportClick(Sender: TObject);
    procedure TBItemCheckZAGSClick(Sender: TObject);
    procedure GridZAGSTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure edChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure imZAGSClick(Sender: TObject);
    procedure edOrganUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edOrganChange(Sender: TObject);
    procedure TBItemCountClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edOrganEditButtons2Click(Sender: TObject;  var Handled: Boolean);
    procedure pnNotFoundClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
   // FValues_ZAGS:String;
    FFilter_ZAGS:String;
    slLog:TStringList;
    ArrCB : array[0..4] of TDbCheckBoxEh;
    ArrTS : array[0..7] of TCurTypeSeek;

    sID:String;
    sPol:String;
    sFam:String;
    sNomer:String;
    CurInd:Integer;
    bCancel:Boolean;
    FCountRecord:Integer;
    FCountStr:Integer;
//    poQueryThread : TQueryThread;
    arrType : TArrInteger;
    function  CheckVisibleAddPar:Boolean;
    function  CheckAddPar(nTypeObj:Integer; nInd:Integer):Boolean;
    function  YearToDate(n:Integer; lBegin:Boolean):TDate; //Time;
    function  YearToStr(n:Integer; lBegin:Boolean):String;
    function CreateFilterTable(nType:Integer; nTypeSeek:Integer; lHist:Boolean=false):Boolean;
    procedure CreateWhereQuery;
    function  GetTypeAktFromIndex(i:Integer):Integer;
    function  ItemEnabled(nInd:Integer): Boolean;
    function  CheckSeek:Boolean;
    function  GetIndexChecked:Integer;
    function  CheckedCount:Integer;
    procedure FinishedSQL( oStartTime, oEndTime: TDateTime; oException: Exception; iRowsAffected : integer );
    procedure SaveToIni;
    procedure LoadFromIni;
    procedure CheckButton(lRun:Boolean);
    procedure CheckVisible;
    procedure CheckEnabledScreen(lSet:Boolean);
    destructor Destroy; override;

  end;

//var
//  FindWindowList:TStringList;

implementation

uses fMain, StrUtils, IniFiles, fMultiChoice;

{$R *.dfm}

procedure TfmSeekAkt.FinishedSQL( oStartTime, oEndTime: TDateTime; oException: Exception;
                                  iRowsAffected : integer );
var
   SavedMessage  : TStringList;
   iLine         : integer;
   iColumn       : integer;
   i             : Integer;
begin
   // This procedure is called when the query execution in our query thread
   // is finished and the thread is just about to be freed

   try
      // If oException is nil then all is well, o/w we got an exception
      if ( oException = nil ) then begin
         StatusBar1.Panels[ 0 ].Text := ''; //GetTimeDelta( oStartTime, oEndTime );
         ProgressImageTimer.Enabled:=true;
         ProgressImage.Visible:=true;
         while not Query.Eof do begin
           tbSeek.Append;
           tbSeekFAMILIA.AsString:=Query.FieldByName('FAMILIA').AsString;
           tbSeek.Post;
           Query.Next;
         end;
         ProgressImageTimer.Enabled:=false;
         ProgressImage.Visible:=false;
      end else begin
         // parse the error string to see if this query was canceled by the user
         if ( pos( '7209', oException.Message) <> 0 ) then begin
            StatusBar1.Panels[ 0 ].Text := 'Запрос отменен';
         end else begin
            StatusBar1.Panels[ 0 ].Text := 'Ошибка выполнения';
            StatusBar1.Panels[ 1 ].Text := oException.Message;
         end;
      end;

//      poQuery.AdsRegisterCallbackFunction( @SQLCallback,
//                                             iChildID );
      // clear the cancel flag
      bCancel := false;

      // hide the progress bar becuase it looks funny when it doesn't quite
      // make it to 100 percent.
//      pb.Visible := FALSE;
   finally
//      FbExecutingQuery := False;

   end;
end;

//--------------------------------------------------------------
function TfmSeekAkt.GetTypeAktFromIndex(i:Integer):Integer;
var
  m:Integer;
begin
  m:=0;
  case i of
    0 : m := dmBase.TypeObj_ZBrak;
    1 : m := dmBase.TypeObj_ZRast;
    2 : m := dmBase.TypeObj_ZRogd;
    3 : m := dmBase.TypeObj_ZSmert;
    4 : m := dmBase.TypeObj_ZUstOtc;
    5 : m := dmBase.TypeObj_ZAdopt;
    6 : m := dmBase.TypeObj_ZChName;
    7 : m := dmBase.TypeObj_ZUstMat;
  end;
  Result:=m;
end;

//--------------------------------------------------------------
function TfmSeekAkt.ItemEnabled(nInd:Integer): Boolean;
var
 j,nTypeObj,n : integer;
begin
  Result:=false;
  if nInd>-1 then begin
    if lbType.Checked[nInd] then begin
      nTypeObj:=GetTypeAktFromIndex(nInd);
      if (nTypeObj=_TypeObj_ZSmert) or (nTypeObj=_TypeObj_ZChName) then begin
        Result:=true;
      end else begin
        for j:=0 to Length(arrTS)-1 do begin
          if arrTS[j].TypeObj=nTypeObj then begin
            for n:=0 to Length(arrTS[j].arrC)-1 do begin
              if arrTS[j].arrC[n]=true then begin
                Result:=true;
                break;
              end;
            end;
            break;
          end;
        end;
      end;
    end;
  end;
end;
//--------------------------------------------------------------
function TfmSeekAkt.CheckSeek: Boolean;
var
 lOk, lCheckOne, lCheckValue : Boolean;
 i,m,j,nTypeObj,n : integer;
 s : String;
begin
  lOk := true;
  lCheckOne:=false;
  slLog.Clear;

  for i:=0 to lbType.Items.Count-1 do begin
    if lbType.Checked[i] then begin
      lCheckOne:=false;
      nTypeObj:=GetTypeAktFromIndex(i);
      if (nTypeObj=_TypeObj_ZSmert) or (nTypeObj=_TypeObj_ZChName) then begin
        lCheckOne:=true;
        break;
      end else begin
        for j:=0 to Length(arrTS)-1 do begin
          if arrTS[j].TypeObj=nTypeObj then begin
            for n:=0 to Length(arrTS[j].arrC)-1 do begin
              if arrTS[j].arrC[n]=true then begin
                lCheckOne:=true;
                break;
              end;
            end;
          end;
        end;
      end;
      if not lCheckOne
        then break;   // !!!
    end;
  end;
  if ( (Trim(edFamilia.Text)='') and (Trim(edName.Text)='') and (Trim(edOtch.Text)='') and (edDateR1.Value=null) and (edDateR2.Value=null) ) then begin
    if ( (edOrgan.Value=null) and (FFilter_ZAGS='') ) then begin
      lCheckValue:=false;
      lOk:=false;
      PutError('Отсутствуют обязательные условия поиска.',self);
    end;
  end else begin
    lCheckValue:=true;
  end;

  SetLength(arrType,8);
  j:=0;
  for i:=0 to lbType.Items.Count-1 do begin
    if cbAll.Checked or lbType.Checked[i] then begin
      arrType[j]:=GetTypeAktFromIndex(i);
      Inc(j,1);
    end;
  end;
  SetLength(arrType,j);

  if lOk and not cbAll.Checked and not lCheckOne then begin
    lOk := false;
    PutError('Выберите тип актовой записи и дополнительное условие.',self)
  end;
  if lOk then begin
    if (edDateR1.Value<>null) and (edDateR2.Value<>null) then begin
      if edDateR1.Value > edDateR2.Value then begin
        PutError('Конечная дата рождения не может быть меньше начальной.',self);
        lOk := false;
      end;
    end;
  end;
  if lOk then begin
    if (edYear1.Value<>null) and (edYear2.Value<>null) then begin
      if edYear1.Value > edYear2.Value then begin
        PutError('Конечный год не может быть меньше начального.',self);
        lOk := false;
      end;
    end;
  end;
  if lOk then begin
    sFam:='';
    sNomer:='';
    sPol:='';
    if (Trim(edFamilia.Text)<>'')
      then sFam:=Trim(edFamilia.Text);
//    if edPol.ItemIndex>-1
//      then sPol:=edPol.KeyItems[edPol.ItemIndex];
  end;
  if lOk and cbHist.Checked and (sFam='') then begin
     PutError('Для поика по истории необходима фамилия.',self);
     lOk:=false;
  end;
  Result:=lOk;
end;

//---------------------------------------------------------------------------
procedure TfmSeekAkt.ProgressImageTimerTimer(Sender: TObject);
begin
  ProgressImages.Tag := (ProgressImages.Tag + 1) mod ProgressImages.Count;
  ProgressImages.GetBitmap(ProgressImages.Tag, ProgressImage.Picture.Bitmap);
  ProgressImage.Refresh;
end;

//---------------------------------------------------------------------------
procedure TfmSeekAkt.FormCreate(Sender: TObject);
var
  i,j:Integer;
  Opis:TOpisEdit;
begin
//  FValues_ZAGS:='';
  FFilter_ZAGS:='';
  tbZAGS.DisableControls;
  try
    dmBase.AdsConnection.Execute('DROP TABLE #tmp_zags_seek;');
  except
  end;
  try
    dmBase.AdsConnection.Execute('SELECT ID,NAME,false as CHECK INTO #tmp_zags_seek FROM SprNames;');
  except
  end;
  tbZAGS.SQL.Text:='SELECT * FROM #tmp_zags_seek ORDER BY name';
  tbZAGS.Open;
  tbZAGS.EnableControls;

  TBItemLog.Visible:=Role.SystemAdmin;

  slLog:=TStringList.Create;

  ArrCB[0]:=cbChild;
  ArrCB[1]:=cbON;
  ArrCB[2]:=cbONA;
  ArrCB[3]:=cbONu;
  ArrCB[4]:=cbONAu;

  for i:=0 to Length(arrTS)-1 do begin
    for j:=0 to Length(arrTS[i].arrN)-1 do begin
      arrTS[i].arrN[j]:='';
      arrTS[i].arrC[j]:=false;
    end;
  end;

  arrTS[0].TypeObj:=_TypeObj_ZBrak;
  arrTS[0].arrN[0]:='он';
  arrTS[0].arrN[1]:='она';

  arrTS[1].TypeObj:=_TypeObj_ZRast;
  arrTS[1].arrN[0]:='он';
  arrTS[1].arrN[1]:='она';

  arrTS[2].TypeObj:=_TypeObj_ZRogd;
  arrTS[2].arrN[0]:='ребёнок';
  arrTS[2].arrN[1]:='отец';
  arrTS[2].arrN[2]:='мать';

  arrTS[3].TypeObj:=_TypeObj_ZSmert;

  arrTS[4].TypeObj:=_TypeObj_ZUstOtc;
  arrTS[4].arrN[0]:='ребёнок';
  arrTS[4].arrN[1]:='отец';
  arrTS[4].arrN[2]:='мать';

  arrTS[5].TypeObj:=_TypeObj_ZAdopt;
  arrTS[5].arrN[0]:='ребёнок';
  arrTS[5].arrN[1]:='отец';
  arrTS[5].arrN[2]:='мать';
  arrTS[5].arrN[3]:='усыновитель';
  arrTS[5].arrN[4]:='усыновительница';

  arrTS[6].TypeObj:=_TypeObj_ZChName;

  arrTS[7].TypeObj:=_TypeObj_ZUstMat;
  arrTS[7].arrN[0]:='ребёнок';
  arrTS[7].arrN[1]:='отец';
  arrTS[7].arrN[2]:='мать';

  lbType.ItemIndex:=0;
  LoadFromIni;
  CheckVisibleAddPar;

  ProgressImagePanel.Visible:=false;
//  Width:=900;
  if (Self.WindowState=wsNormal) then begin
    if (Self.Left<1) or (Self.Left>600) then Self.Left:=5;
    if (Self.Top<1) or (Self.Top>300) then Self.Top:=5;
    if (Self.Width<800) then Self.Width:=900;
    if (Self.Height<300) then Self.Height:=300;
  end;
  bCancel:=false;
  Query.AdsConnection:=dmBase.AdsConnection;
  {
  i:=FindWindowList.Count;
  if i=0
    then Tag:=1
    else Tag:=StrToInt(FindWindowList.Strings[i-1])+1;
  FindWindowList.AddObject(IntToStr(Tag),Self);
  }
//  edOrgan.Enabled:= not cbAllOrgan.Checked;
//  lbType.Enabled:= not cbAll.Checked;
  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS');   // KEY_TYPEZAGS_FULL
  for i:=0 to Opis.Items.Count-1 do begin
    Grid.FieldColumns['TYPEAKT'].PickList.Add(Opis.Items[i]);
    Grid.FieldColumns['TYPEAKT'].KeyList.Add(Opis.KeyList[i]);
  end;
  pnNotFound.Visible:=false;
  ActiveControl:=edFamilia;
end;

procedure TfmSeekAkt.FormDestroy(Sender: TObject);
var
  i:Integer;
begin
  tbZAGS.Active:=false;
  slLog.Free;
  if fmMain<>nil then
    fmMain.DeleteFromListGurnal(Self.Name);
end;

//---------------------------------------------------------------------------
procedure TfmSeekAkt.StopButtonClick(Sender: TObject);
begin
  bCancel:=true;
end;

//----------------------------------------------------
procedure TfmSeekAkt.CreateWhereQuery;
begin
//
end;

//----------------------------------------------------
function TfmSeekAkt.YearToDate(n:Integer; lBegin:Boolean):TDate; //Time;
var
  s:String;
begin
  if lBegin then s:='0101' else s:='1231';
  Result:=STOD(PadLInt(n,4,'0')+s,tdClipper);
end;

//----------------------------------------------------
function TfmSeekAkt.YearToStr(n:Integer; lBegin:Boolean):String;
var
  s:String;
begin
  if lBegin then s:='-01-01' else s:='-12-31';
  Result:=QStr(PadLInt(n,4,'0')+s);
end;

const
  SEEK_MAIN=1;
  SEEK_MAIN_P=2;
  SEEK_ON=3;
  SEEK_ONA=4;
  SEEK_ON_P=5;
  SEEK_ONA_P=6;
  SEEK_OTEC=7;
  SEEK_MAT=8;

//----------------------------------------------------
function TfmSeekAkt.CreateFilterTable(nType:Integer; nTypeSeek:Integer; lHist:Boolean):Boolean;
var
  tb:TAdsTable;
  lRange:Boolean;
  sFldDate,s,ss,sNameField,sIndex,sName,sOtch:String;
  sRetFields,sFilter:String;
  d1,d2:TDateTime;
  slSQL:TstringList;
  //-------------
  {
  function GetNameFromType(nType:Integer; sName:String):String;
  begin
    case nTypeSeek of
      SEEK_MAIN : sIndex:=sName;
      SEEK_ON   : sIndex:='ON_'+sName;
      SEEK_ONA  : sIndex:='ONA_'+sName;
      SEEK_MAT  : sIndex:='MAT_'+sName;
      SEEK_OTEC : sIndex:='OTEC_'+sName;
    end;
  end;
  }
  //-------------
  procedure AddToFilter(sField:String;sAdd:String);
  var
    sss:String;
  begin
    sAdd:=Trim(sAdd);
    if sAdd<>'' then begin
      if RightStr(sAdd,1)='*'
        then sss:=sField+' LIKE '+QStr(Copy(sAdd,1,Length(sAdd)-1)+'%')
        else sss:=sField+'='+QStr(sAdd);
      if sFilter=''
        then sFilter:=sss
        else sFilter:=sFilter+' and '+sss;
    end;
  end;
  //-------------
  procedure AddDateToFilter;
  begin
    if (edDateR1.Value<>null) and (edDateR2.Value<>null) then begin
      ss:=sFldDate+'>='+DateToSQL(edDateR1.Value) +' and '+sFldDate+'<='+ DateToSQL(edDateR2.Value);
    end else if (edDateR1.Value<>null) then begin
      ss:=sFldDate+'>='+DateToSQL(edDateR1.Value);
    end else if (edDateR2.Value<>null) then begin
      ss:=sFldDate+'<='+DateToSQL(edDateR2.Value);
    end;
    if sFilter='' then sFilter:=ss else sFilter:=sFilter+' and '+ss;
  end;
  //-------------
begin
//  поиск по истории
//   HistoryZAGS    SEEK_KEY = TYPEOBJ;FIELDNAME
  Result:=true;
  if (Trim(edName.Text)<>'') then sName:=Trim(edName.Text) else sName:='';
  if (Trim(edOtch.Text)<>'') then sOtch:=Trim(edOtch.Text) else sOtch:='';

  tb:=dmBase.MainTableFromTypeObj(nType);
//  Table.TableName:=tb.TableName;
//  Table.Open;
  slLog.Add(tb.TableName);
  slLog.Add('------------------------------');
  sRetFields:='';
  sFilter:='';
  sID:='';  // !!!
  //-------------- актовая запись о рождении или смерти --------------------------------
  if (nType=dmBase.TypeObj_ZRogd) or (nType=dmBase.TypeObj_ZSmert) then begin
    sRetFields:='ID,NOMER,DATEZ,VOSSTAN,ID_ZAGS,POL,*FAMILIA,*NAME,*OTCH,*DATER,';
    if nType=dmBase.TypeObj_ZSmert then sRetFields:=sRetFields+'LICH_NOMER'
                                   else sRetFields:=sRetFields+'*IDENTIF';
    case nTypeSeek of
      SEEK_MAIN   : sRetFields:=StringReplace(sRetFields, '*', '', [rfReplaceAll])+',DATES';
      SEEK_ON     : sRetFields:=StringReplace(sRetFields, '*', 'ON_', [rfReplaceAll]);
      SEEK_ONA    : sRetFields:=StringReplace(sRetFields, '*', 'ONA_', [rfReplaceAll]);
    end;
    if lHist then begin  // фамилия не может быть пустой !!!
      case nTypeSeek of
        SEEK_MAIN   : sIndex:='FAMILIA';
        SEEK_ON     : sIndex:='ON_FAMILIA';
        SEEK_ONA    : sIndex:='ONA_FAMILIA';
      end;
      sFilter:='typeobj='+IntToStr(nType)+' and fieldname='+QStr(sIndex);
      AddToFilter('value',sFam);
      sFilter:='id IN (SELECT id FROM HistoryZAGS WHERE '+sFilter+')';
    end else begin
      if sFam<>'' then begin
        case nTypeSeek of
          SEEK_MAIN   : sIndex:='FAMILIA';
          SEEK_ON     : sIndex:='ON_FAMILIA';
          SEEK_ONA    : sIndex:='ONA_FAMILIA';
        end;
        AddToFilter(sIndex,sFam);
      end;
    end;
    if sName<>'' then begin
      case nTypeSeek of
        SEEK_MAIN : s:='NAME';
        SEEK_ON   : s:='ON_NAME';
        SEEK_ONA  : s:='ONA_NAME';
      end;
      AddToFilter(s,sName);
    end;
    if sOtch<>'' then begin
      case nTypeSeek of
        SEEK_MAIN : s:='OTCH';
        SEEK_ON   : s:='ON_OTCH';
        SEEK_ONA  : s:='ONA_OTCH';
      end;
      AddToFilter(s,sOtch);
    end;
    if (sPol<>'') and (nTypeSeek=SEEK_MAIN) then begin
      AddToFilter('POL',sPol);
    end;
    // дата рождения
    if (edDateR1.Value<>null) or (edDateR2.Value<>null) then begin
      case nTypeSeek of
        SEEK_MAIN : sFldDate:='DATER';
        SEEK_ON   : sFldDate:='ON_DATER';
        SEEK_ONA  : sFldDate:='ONA_DATER';
      end;
      AddDateToFilter;
    end;
  //-----установление отцовства и маиеринства ------------------------------------------------------------------------
  end else if (nType=dmBase.TypeObj_ZUstOtc) or (nType=dmBase.TypeObj_ZUstMat) then begin
    sRetFields:='ID,NOMER,DATEZ,ID_ZAGS,POL,';
    case nTypeSeek of
      SEEK_MAIN   : sRetFields:=sRetFields+'FAMILIADO,NAMEDO,OTCHDO,DATER,IDENTIF';
      SEEK_MAIN_P : sRetFields:=sRetFields+'FAMILIAPOSLE,NAMEPOSLE,OTCHPOSLE,DATER,IDENTIF';
      SEEK_ON     : sRetFields:=sRetFields+'ON_FAMILIA,ON_NAME,ON_OTCH,ON_DATER,ON_IDENTIF';
      SEEK_ONA    : sRetFields:=sRetFields+'ONA_FAMILIA,ONA_NAME,ONA_OTCH,ONA_DATER,ONA_IDENTIF';
    end;
    if sFam<>'' then begin
      case nTypeSeek of
        SEEK_MAIN   : sIndex:='FAMILIADO';
        SEEK_MAIN_P : sIndex:='FAMILIAPOSLE';
        SEEK_ON     : sIndex:='ON_FAMILIA';
        SEEK_ONA    : sIndex:='ONA_FAMILIA';
      end;
      AddToFilter(sIndex,sFam);
    end;
    if sName<>'' then begin
      case nTypeSeek of
        SEEK_MAIN   : s:='NAMEDO';
        SEEK_MAIN_P : s:='NAMEPOSLE';
        SEEK_ON     : s:='ON_NAME';
        SEEK_ONA    : s:='ONA_NAME';
      end;
      AddToFilter(s,sName);
    end;
    if sOtch<>'' then begin
      case nTypeSeek of
        SEEK_MAIN   : s:='OTCHDO';
        SEEK_MAIN_P : s:='OTCHPOSLE';
        SEEK_ON     : s:='ON_OTCH';
        SEEK_ONA    : s:='ONA_OTCH';
      end;
      AddToFilter(s,sOtch);
    end;
    if (sPol<>'') and ((nTypeSeek=SEEK_MAIN) or (nTypeSeek=SEEK_MAIN_P)) then begin
      AddToFilter('POL',sPol);
    end;
    // дата рождения
    if (edDateR1.Value<>null) or (edDateR2.Value<>null) then begin
      case nTypeSeek of
        SEEK_MAIN,SEEK_MAIN_P : sFldDate:='DATER';
        SEEK_ON     : sFldDate:='ON_DATER';
        SEEK_ONA    : sFldDate:='ONA_DATER';
      end;
      AddDateToFilter;
    end;
  //-----перемена имени и усыновление ------------------------------------------------------------------------
  end else if (nType=dmBase.TypeObj_ZChName) or (nType=dmBase.TypeObj_ZAdopt) then begin
    sRetFields:='ID,NOMER,DATEZ,ID_ZAGS,POL,';
    if (nType=dmBase.TypeObj_ZChName) then begin
      case nTypeSeek of
        SEEK_MAIN   : sRetFields:=sRetFields+'FAMILIADO,NAMEDO,OTCHDO,DATER,IDENTIF';
        SEEK_MAIN_P : sRetFields:=sRetFields+'FAMILIAPOSLE,NAMEPOSLE,OTCHPOSLE,DATER,IDENTIF';
      end;
    end else begin
      case nTypeSeek of
        SEEK_MAIN   : sRetFields:=sRetFields+'FAMILIADO,NAMEDO,OTCHDO,DATER_DO,IDENTIF_DO';
        SEEK_MAIN_P : sRetFields:=sRetFields+'FAMILIAPOSLE,NAMEPOSLE,OTCHPOSLE,DATER_POSLE,IDENTIF_POSLE';
        SEEK_ON     : sRetFields:=sRetFields+'ON_FAMILIA,ON_NAME,ON_OTCH,ON_DATER,ON_IDENTIF';
        SEEK_ONA    : sRetFields:=sRetFields+'ONA_FAMILIA,ONA_NAME,ONA_OTCH,ONA_DATER,ONA_IDENTIF';
        SEEK_OTEC   : sRetFields:=sRetFields+'OTEC_FAMILIA,OTEC_NAME,OTEC_OTCH,OTEC_DATER,OTEC_IDENTIF';
        SEEK_MAT    : sRetFields:=sRetFields+'MAT_FAMILIA,MAT_NAME,MAT_OTCH,MAT_DATER,MAT_IDENTIF';
      end;
    end;
    if sFam<>'' then begin
      case nTypeSeek of
        SEEK_MAIN   : sIndex:='FAMILIADO';
        SEEK_MAIN_P : sIndex:='FAMILIAPOSLE';
        SEEK_ON     : sIndex:='ON_FAMILIA';
        SEEK_ONA    : sIndex:='ONA_FAMILIA';
        SEEK_OTEC   : sIndex:='OTEC_FAMILIA';
        SEEK_MAT    : sIndex:='MAT_FAMILIA';
      end;
      AddToFilter(sIndex,sFam);
    end;
    if sName<>'' then begin
      case nTypeSeek of
        SEEK_MAIN   : s:='NAMEDO';
        SEEK_MAIN_P : s:='NAMEPOSLE';
        SEEK_ON     : s:='ON_NAME';
        SEEK_ONA    : s:='ONA_NAME';
        SEEK_OTEC   : s:='OTEC_NAME';
        SEEK_MAT    : s:='MAT_NAME';
      end;
      AddToFilter(s,sName);
    end;
    if sOtch<>'' then begin
      case nTypeSeek of
        SEEK_MAIN   : s:='OTCHDO';
        SEEK_MAIN_P : s:='OTCHPOSLE';
        SEEK_ON     : s:='ON_OTCH';
        SEEK_ONA    : s:='ONA_OTCH';
        SEEK_OTEC   : s:='OTEC_OTCH';
        SEEK_MAT    : s:='MAT_OTCH';
      end;
      AddToFilter(s,sOtch);
    end;
    if (sPol<>'') and ((nTypeSeek=SEEK_MAIN) or (nTypeSeek=SEEK_MAIN_P)) then begin
      AddToFilter('POL',sPol);
    end;
    // дата рождения
    if (edDateR1.Value<>null) or (edDateR2.Value<>null) then begin
      case nTypeSeek of
        SEEK_MAIN   : if nType=dmBase.TypeObj_ZChName then sFldDate:='DATER' else sFldDate:='DATER_DO';
        SEEK_MAIN_P : if nType=dmBase.TypeObj_ZChName then sFldDate:='DATER' else sFldDate:='DATER_POSLE';
        SEEK_ON     : sFldDate:='ON_DATER';
        SEEK_ONA    : sFldDate:='ONA_DATER';
        SEEK_OTEC   : sFldDate:='OTEC_DATER';
        SEEK_MAT    : sFldDate:='MAT_DATER';
      end;
      AddDateToFilter;
    end;

  //-----брак и развод ------------------------------------------------------------------------
  end else if (nType=dmBase.TypeObj_ZBrak) or (nType=dmBase.TypeObj_ZRast) then begin
    sRetFields:='ID,NOMER,DATEZ,ID_ZAGS,';
    case nTypeSeek of
      SEEK_ON     : sRetFields:=sRetFields+'ON_FAMILIA,ON_NAME,ON_OTCH,ON_DATER,ON_IDENTIF';
      SEEK_ONA    : sRetFields:=sRetFields+'ONA_FAMILIA,ONA_NAME,ONA_OTCH,ONA_DATER,ONA_IDENTIF';
      SEEK_ON_P   : sRetFields:=sRetFields+'ON_FAMILIAP,ON_NAME,ON_OTCH,ON_DATER,ON_IDENTIF';
      SEEK_ONA_P  : sRetFields:=sRetFields+'ONA_FAMILIAP,ONA_NAME,ONA_OTCH,ONA_DATER,ONA_IDENTIF';
    end;
    if sFam<>'' then begin
      case nTypeSeek of
        SEEK_ON     : sIndex:='ON_FAMILIA';
        SEEK_ONA    : sIndex:='ONA_FAMILIA';
        SEEK_ON_P   : sIndex:='ON_FAMILIAP';
        SEEK_ONA_P  : sIndex:='ONA_FAMILIAP';
      end;
      if lHist then begin  // фамилия не может быть пустой !!!
        sFilter:='typeobj='+IntToStr(nType)+' and fieldname='+QStr(sIndex);
        AddToFilter('value',sFam);
        sFilter:='id IN (SELECT id FROM HistoryZAGS WHERE '+sFilter+')';
      end else begin
        AddToFilter(sIndex,sFam);
      end;
    end;
    if sName<>'' then begin
      case nTypeSeek of
        SEEK_ON,SEEK_ON_P   : s:='ON_NAME';
        SEEK_ONA,SEEK_ONA_P : s:='ONA_NAME';
      end;
      AddToFilter(s,sName);
    end;
    if sOtch<>'' then begin
      case nTypeSeek of
        SEEK_ON,SEEK_ON_P   : s:='ON_OTCH';
        SEEK_ONA,SEEK_ONA_P : s:='ONA_OTCH';
      end;
      AddToFilter(s,sOtch);
    end;
    // дата рождения
    if (edDateR1.Value<>null) or (edDateR2.Value<>null) then begin
      case nTypeSeek of
        SEEK_ON,SEEK_ON_P   : sFldDate:='ON_DATER';
        SEEK_ONA,SEEK_ONA_P : sFldDate:='ONA_DATER';
      end;
      AddDateToFilter;
    end;
  end;

  //----- ID загса --------------------------------------------------------------------
  if (edOrgan.Value<>null) then begin
    ss:='ID_ZAGS='+VarToStr(edOrgan.Value);
    if sFilter='' then sFilter:=ss else sFilter:=sFilter+' and '+ss;
  end else begin
    if FFilter_ZAGS<>'' then begin
      if sFilter='' then sFilter:=FFilter_ZAGS else sFilter:=sFilter+' and '+FFilter_ZAGS;
    end;
  end;
  //----- дата актовой записи --------------------------------------------------------------------
  if (edYear1.Value<>null) or (edYear2.Value<>null) then begin
    if (edYear1.Value<>null) and (edYear2.Value<>null) then begin
      s:='datez>='+YearToStr(edYear1.Value,true) +' and datez<='+ YearToStr(edYear2.Value,false);
    end else if (edYear1.Value<>null) then begin
      s:='datez>='+YearToStr(edYear1.Value,true) +' and datez<='+ YearToStr(edYear1.Value,false);
    end else if (edYear2.Value<>null) then begin
      s:='datez>='+YearToStr(edYear2.Value,true) +' and datez<='+ YearToStr(edYear1.Value,false);
    end;
    if sFilter='' then sFilter:=s else sFilter:=sFilter+' and '+s;
  end;
//  StatusBar1.Panels[1].Text:=sFilter;
  slLog.Add('WHERE="'+sFilter+'"');
  if (sFilter='') then begin
    Result:=false;
  end;
  if sFilter<>'' then begin
    Query.Close;
    Query.SQL.Text:='SELECT '+sRetFields+' FROM '+tb.TableName+' WHERE '+sFilter;
    slLog.Add('SQL='+Query.SQL.Text);

    try
//      Self.Enabled:=false; // CheckEnabledScreen(false);
      OwnerForm:=Self;
      OpenMessage(PadCStr('Выпонение запроса ...',40,' '));
//      EnterWorkerThread;
//      _WorkedThread_:=true;
      try
        Query.Open;
      except
        on E: Exception do begin
          slLog.Add(tb.TableName+'  '+E.Message);
        end;
      end;
    finally
//      _WorkedThread_:=false;
//      LeaveWorkerThread;
//      Enabled:=true; //CheckEnabledScreen(true);
      CloseMessage;
    end;

  end;
end;

//-------------------------------------------------------------------------
function TfmSeekAkt.CheckedCount:Integer;
var
  i:Integer;
begin
  Result:=0;
  for i:=0 to lbType.Items.Count-1 do begin
    if cbAll.Checked or lbType.Checked[i] then begin
      Inc(Result,1);
    end;
  end;
end;
//-------------------------------------------------------------------------
function TfmSeekAkt.GetIndexChecked:Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=0 to lbType.Items.Count-1 do begin
    if lbType.Checked[i] then begin
      Result:=i;
      exit;
    end;
  end;
end;

//-------------------------------------------------------------------------
procedure TfmSeekAkt.cbChildClick(Sender: TObject);
var
  n,m:Integer;
begin
  n:=lbType.ItemIndex;
  m:=TComponent(Sender).Tag;
  arrTS[n].arrC[m]:=TDBCheckBoxEh(Sender).Checked;
end;

//-------------------------------------------------------------------------
function TfmSeekAkt.CheckVisibleAddPar:Boolean;
var
  lOld,lNew,lVisible:Boolean;
  nType,i,n:Integer;
  arr:TArrStrings;
begin
  Label4.Caption:=IntToStr(lbType.ItemIndex);
  n:=lbType.ItemIndex;

  cbHist.Visible:=(lbType.Checked[2] or lbType.Checked[1] or lbType.Checked[0]);
  cbHist.Enabled:=n<=2;

  gbAddPar.Enabled:=lbType.Checked[n];
  for i:=0 to length(arrCB)-1 do begin
    if arrTS[n].arrN[i]<>'' then begin
      arrCB[i].Caption:=arrTS[n].arrN[i];
      arrCB[i].Visible:=true;
    end else begin
      arrCB[i].Visible:=false;
    end;
    arrCB[i].Checked:=arrTS[n].arrC[i];
    arrCB[i].Enabled:=gbAddPar.Enabled;
  end;
end;

//-------------------------------------------------------------------------
function TfmSeekAkt.CheckAddPar(nTypeObj:Integer; nInd:Integer):Boolean;
var
  i,j:Integer;
begin
  Result:=false;
  for i:=0 to Length(arrTS)-1 do begin
    if arrTS[i].TypeObj=nTypeObj then begin
      if arrTS[i].arrC[nInd]=true then begin
        Result:=true;
      end;
      break;
    end;
  end;
  if CheckedCount=1 then begin // отмечен только один тип актовой записи
    if (nTypeObj=dmBase.TypeObj_ZRogd) then begin
     {
      if (lbAddPar.Checked[nInd]) then begin
        Result:=true;
      end else begin
        Result:=false;
      end;
     }
    end;
  end;
end;

//-------------------------------------------------------------------------
procedure TfmSeekAkt.FindButtonClick(Sender: TObject);
var
  i,j,n,v,nMax:Integer;
  arrSeek:TArrInteger;
  lAdd,lOk:Boolean;
  lHist:Boolean;
  s,ss:String;
  function cStr(s:String):String;
  begin
    Result:=FirstUpper(s);
  end;
  function StdAppend(nType:Integer):Boolean;
  begin
    Result:=true;
    tbSeek.Append;
    tbSeekID.AsInteger:=Query.FieldByName('ID').AsInteger;
    if Query.FindField('VOSSTAN')<>nil then tbSeekVOSSTAN.AsBoolean:=Query.FieldByName('VOSSTAN').AsBoolean;
    tbSeekNOMER.AsString:=Query.FieldByName('NOMER').AsString;
    tbSeekTYPEAKT.AsInteger:=nType;
    WriteDateField(tbSeekDATEZ, Query.FieldByName('DATEZ'));
  end;
  function StdPost:Boolean;
  begin
    Result:=true;
    tbSeek.Post;
    FCountRecord:=FCountRecord+1;
    Application.ProcessMessages;
    if FCountRecord=1000 then begin
      ProgressImagePanel.Visible:=false;
      if Problem('Найдено 1000 записей. Продолжить ?',mtConfirmation,self) then begin
        ProgressImagePanel.Visible:=true;
      end else begin
         bCancel:=true;
      end;
    end;
    if bCancel=true then begin
      ProgressImagePanel.Visible:=false;
      PutError('Выполнеие прервано пользователем.',self);
    end;
  end;
begin
  pnNotFound.Visible:=false;

  tbZAGS.DisableControls;
  ed.Text:='';
  tbZAGS.Filter:='';
  tbZAGS.Filtered:=false;
  tbZAGS.First;

  FFilter_ZAGS:='';
  while not tbZAGS.Eof do begin
    if tbZAGS.FieldByName('CHECK').AsBoolean then begin
      FFilter_ZAGS:=FFilter_ZAGS+' id_zags='+tbZAGS.FieldByName('ID').AsString+' or ';
    end;
    tbZAGS.Next;
  end;
  if FFilter_ZAGS<>'' then begin
    FFilter_ZAGS:='('+Copy(FFilter_ZAGS,1,Length(FFilter_ZAGS)-4)+')';
  end;
  tbZAGS.First;
  tbZAGS.EnableControls;

  if CheckSeek then begin
//    Memo1.Text:='';
    tbZAGS.CheckBrowseMode;
    TBItemCheckZAGS.Checked:=false;
    CheckVisible;
    Application.ProcessMessages;

    FCountRecord:=0;
    FCountStr:=0;
    bCancel:=false;
    lHist:=cbHist.Checked and cbHist.Visible;

    tbSeek.Active:=true;
    tbSeek.EmptyTable;
    Query.Close;
    Query.Close;
    ProgressImagePanel.Visible:=true;
    ProgressImageTimer.Enabled:=true;
    CheckButton(true);
    for i:=0 to Length(arrType)-1 do begin
      //--- рождения ----------------------------------------------------------
      if arrType[i]=dmBase.TypeObj_ZRogd then begin

        n:=0;
        if CheckAddPar(arrType[i],0) then begin  //ребенок
          SetLength(arrSeek,n+1);
          arrSeek[n]:=SEEK_MAIN;
          Inc(n,1);
        end;
        if ((sPol='') or (sPol='М')) and CheckAddPar(arrType[i],1) then begin
          SetLength(arrSeek,n+1);
          arrSeek[n]:=SEEK_ON;
          Inc(n,1);
        end;
        if ((sPol='') or (sPol='Ж')) and CheckAddPar(arrType[i],2) then begin
          SetLength(arrSeek,n+1);
          arrSeek[n]:=SEEK_ONA;
          Inc(n,1);
        end;

        for j:=0 to Length(arrSeek)-1 do begin
          for v:=1 to IIFI(lHist,2,1) do begin
            lOk:=CreateFilterTable(dmBase.TypeObj_ZRogd, arrSeek[j],v=2);
            if lOk then begin
              if v=2 then ss:='(история)' else ss:='';
              Query.First;
              while not Query.Eof do begin
                lAdd:=true;
                if lAdd then begin
                  StdAppend(dmBase.TypeObj_ZRogd);
                  if arrSeek[j]=SEEK_MAIN then begin
                    tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('FAMILIA').AsString);
                    tbSeekNAME.AsString:=cStr(Query.FieldByName('NAME').AsString);
                    tbSeekOTCH.AsString:=cStr(Query.FieldByName('OTCH').AsString);
                    WriteDateField(tbSeekDATER, Query.FieldByName('DATER'));
                    tbSeekPOL.AsString:=Query.FieldByName('POL').AsString;
                    tbSeekIDENTIF.AsString:=Query.FieldByName('IDENTIF').AsString;
                    tbSeekKOMM.AsString:='ребёнок'+ss;
                  end else if arrSeek[j]=SEEK_ON then begin
                    WriteDateField(tbSeekDATER, Query.FieldByName('ON_DATER'));
                    tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('ON_FAMILIA').AsString);
                    tbSeekNAME.AsString:=cStr(Query.FieldByName('ON_NAME').AsString);
                    tbSeekOTCH.AsString:=cStr(Query.FieldByName('ON_OTCH').AsString);
                    tbSeekPOL.AsString:='М';
                    tbSeekIDENTIF.AsString:=Query.FieldByName('ON_IDENTIF').AsString;
                    tbSeekKOMM.AsString:='отец'+ss;
                  end else if arrSeek[j]=SEEK_ONA then begin
                    WriteDateField(tbSeekDATER, Query.FieldByName('ONA_DATER'));
                    tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('ONA_FAMILIA').AsString);
                    tbSeekNAME.AsString:=cStr(Query.FieldByName('ONA_NAME').AsString);
                    tbSeekOTCH.AsString:=cStr(Query.FieldByName('ONA_OTCH').AsString);
                    tbSeekPOL.AsString:='Ж';
                    tbSeekIDENTIF.AsString:=Query.FieldByName('ONA_IDENTIF').AsString;
                    tbSeekKOMM.AsString:='мать'+ss;
                  end;
                  StdPost;
                end;
                if bCancel=true then break;
                Query.Next;
              end;
            end;
          end;
          if bCancel=true then break;
        end;
      //-----------------------------------------------------------------------
      //------- установление отцовства материнства ----------------------------
      //-----------------------------------------------------------------------
      end else if (arrType[i]=dmBase.TypeObj_ZUstOtc) or (arrType[i]=dmBase.TypeObj_ZUstMat) then begin

        n:=0;
        if CheckAddPar(arrType[i],0) then begin  //ребенок
          SetLength(arrSeek,n+2);
          arrSeek[n]:=SEEK_MAIN;
          arrSeek[n+1]:=SEEK_MAIN_P;
          Inc(n,2);
        end;
        if ((sPol='') or (sPol='М')) and CheckAddPar(arrType[i],1) then begin
          SetLength(arrSeek,n+1);
          arrSeek[n]:=SEEK_ON;
          Inc(n,1);
        end;
        if ((sPol='') or (sPol='Ж')) and CheckAddPar(arrType[i],2) then begin
          SetLength(arrSeek,n+1);
          arrSeek[n]:=SEEK_ONA;
          Inc(n,1);
        end;

        for j:=0 to Length(arrSeek)-1 do begin
          CreateFilterTable(arrType[i], arrSeek[j]);
          Query.First;
          while not Query.Eof do begin
            lAdd:=false;
            //------- чтоб не добавлять совпадающие фио до и после ----------
            if arrSeek[j]=SEEK_MAIN_P then begin
              if tbSeek.Locate('FAMILIA;NAME;OTCH;ID',VarArrayOf([cStr(Query.FieldByName('FAMILIAPOSLE').AsString),
                                                                  cStr(Query.FieldByName('NAMEPOSLE').AsString),
                                                                  cStr(Query.FieldByName('OTCHPOSLE').AsString),
                                                                  Query.FieldByName('ID').AsInteger]),[loCaseInsensitive]) then begin
                tbSeek.Edit;
                tbSeekKOMM.AsString:='ребёнок (до и после)';
                tbSeek.Post;
              end else begin
                lAdd:=true;
              end ;
            end else begin
              lAdd:=true;
            end;
            if lAdd then begin
              StdAppend(arrType[i]);
              if arrSeek[j]=SEEK_MAIN then begin
                tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('FAMILIADO').AsString);
                tbSeekNAME.AsString:=cStr(Query.FieldByName('NAMEDO').AsString);
                tbSeekOTCH.AsString:=cStr(Query.FieldByName('OTCHDO').AsString);
                WriteDateField(tbSeekDATER, Query.FieldByName('DATER'));
                tbSeekPOL.AsString:=Query.FieldByName('POL').AsString;
                tbSeekIDENTIF.AsString:=Query.FieldByName('IDENTIF').AsString;
                tbSeekKOMM.AsString:='ребёнок (до)';
              end else if arrSeek[j]=SEEK_MAIN_P then begin
                tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('FAMILIAPOSLE').AsString);
                tbSeekNAME.AsString:=cStr(Query.FieldByName('NAMEPOSLE').AsString);
                tbSeekOTCH.AsString:=cStr(Query.FieldByName('OTCHPOSLE').AsString);
                WriteDateField(tbSeekDATER, Query.FieldByName('DATER'));
                tbSeekPOL.AsString:=Query.FieldByName('POL').AsString;
                tbSeekIDENTIF.AsString:=Query.FieldByName('IDENTIF').AsString;
                tbSeekKOMM.AsString:='ребёнок (после)';
              end else if arrSeek[j]=SEEK_ON then begin
                WriteDateField(tbSeekDATER, Query.FieldByName('ON_DATER'));
                tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('ON_FAMILIA').AsString);
                tbSeekNAME.AsString:=cStr(Query.FieldByName('ON_NAME').AsString);
                tbSeekOTCH.AsString:=cStr(Query.FieldByName('ON_OTCH').AsString);
                tbSeekPOL.AsString:='М';
                tbSeekIDENTIF.AsString:=Query.FieldByName('ON_IDENTIF').AsString;
                tbSeekKOMM.AsString:='отец';
              end else if arrSeek[j]=SEEK_ONA then begin
                WriteDateField(tbSeekDATER, Query.FieldByName('ONA_DATER'));
                tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('ONA_FAMILIA').AsString);
                tbSeekNAME.AsString:=cStr(Query.FieldByName('ONA_NAME').AsString);
                tbSeekOTCH.AsString:=cStr(Query.FieldByName('ONA_OTCH').AsString);
                tbSeekPOL.AsString:='Ж';
                tbSeekIDENTIF.AsString:=Query.FieldByName('ONA_IDENTIF').AsString;
                tbSeekKOMM.AsString:='мать';
              end;
              StdPost;
            end;
            if bCancel=true then break;
            Query.Next;
          end;
          if bCancel=true then break;
        end;

      //-----------------------------------------------------------------------
      //------- перемена имени и усыновление ----------------------------------
      //-----------------------------------------------------------------------
      end else if (arrType[i]=dmBase.TypeObj_ZChName) or (arrType[i]=dmBase.TypeObj_ZAdopt) then begin

        n:=0;
        if (arrType[i]=dmBase.TypeObj_ZChName) or CheckAddPar(arrType[i],0) then begin  //ребенок
          SetLength(arrSeek,n+2);
          arrSeek[n]:=SEEK_MAIN;
          arrSeek[n+1]:=SEEK_MAIN_P;
          Inc(n,2);
        end;
        if (arrType[i]=dmBase.TypeObj_ZAdopt) then begin
          if ((sPol='') or (sPol='М')) and CheckAddPar(arrType[i],1) then begin
            SetLength(arrSeek,n+1);
            arrSeek[n]:=SEEK_OTEC;
            Inc(n,1);
          end;
          if ((sPol='') or (sPol='Ж')) and CheckAddPar(arrType[i],2) then begin
            SetLength(arrSeek,n+1);
            arrSeek[n]:=SEEK_MAT;
            Inc(n,1);
          end;
          if ((sPol='') or (sPol='М')) and CheckAddPar(arrType[i],3) then begin
            SetLength(arrSeek,n+1);
            arrSeek[n]:=SEEK_ON;
            Inc(n,1);
          end;
          if ((sPol='') or (sPol='Ж')) and CheckAddPar(arrType[i],4) then begin
            SetLength(arrSeek,n+1);
            arrSeek[n]:=SEEK_ONA;
            Inc(n,1);
          end;
        end;

        for j:=0 to Length(arrSeek)-1 do begin
          CreateFilterTable(arrType[i], arrSeek[j]);
          Query.First;
          while not Query.Eof do begin
            lAdd:=false;
            //------- чтоб не добавлять совпадающие фио до и после ----------
            if arrSeek[j]=SEEK_MAIN_P then begin
              if tbSeek.Locate('FAMILIA;NAME;OTCH;ID',VarArrayOf([cStr(Query.FieldByName('FAMILIAPOSLE').AsString),
                                                                  cStr(Query.FieldByName('NAMEPOSLE').AsString),
                                                                  cStr(Query.FieldByName('OTCHPOSLE').AsString),
                                                                  Query.FieldByName('ID').AsInteger]),[loCaseInsensitive]) then begin
                tbSeek.Edit;
                if (arrType[i]=dmBase.TypeObj_ZAdopt)
                  then tbSeekKOMM.AsString:='ребёнок (до и после)';
                tbSeek.Post;
              end else begin
                lAdd:=true;
              end ;
            end else begin
              lAdd:=true;
            end;
            if lAdd then begin
              StdAppend(arrType[i]);
              if arrSeek[j]=SEEK_MAIN then begin
                tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('FAMILIADO').AsString);
                tbSeekNAME.AsString:=cStr(Query.FieldByName('NAMEDO').AsString);
                tbSeekOTCH.AsString:=cStr(Query.FieldByName('OTCHDO').AsString);
                tbSeekPOL.AsString:=Query.FieldByName('POL').AsString;
                if (arrType[i]=dmBase.TypeObj_ZAdopt) then begin
                  WriteDateField(tbSeekDATER, Query.FieldByName('DATER_DO'));
                  tbSeekIDENTIF.AsString:=Query.FieldByName('IDENTIF_DO').AsString;
                  tbSeekKOMM.AsString:='ребёнок (до)';
                end else begin
                  WriteDateField(tbSeekDATER, Query.FieldByName('DATER'));
                  tbSeekIDENTIF.AsString:=Query.FieldByName('IDENTIF').AsString;
                  tbSeekKOMM.AsString:='до перемены';
                end;
              end else if arrSeek[j]=SEEK_MAIN_P then begin
                tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('FAMILIAPOSLE').AsString);
                tbSeekNAME.AsString:=cStr(Query.FieldByName('NAMEPOSLE').AsString);
                tbSeekOTCH.AsString:=cStr(Query.FieldByName('OTCHPOSLE').AsString);
                tbSeekPOL.AsString:=Query.FieldByName('POL').AsString;
                if (arrType[i]=dmBase.TypeObj_ZAdopt) then begin
                  tbSeekIDENTIF.AsString:=Query.FieldByName('IDENTIF_POSLE').AsString;
                  WriteDateField(tbSeekDATER, Query.FieldByName('DATER_POSLE'));
                  tbSeekKOMM.AsString:='ребёнок (после)';
                end else begin
                  tbSeekIDENTIF.AsString:=Query.FieldByName('IDENTIF').AsString;
                  WriteDateField(tbSeekDATER, Query.FieldByName('DATER'));
                  tbSeekKOMM.AsString:='после перемены';
                end;
              end else if arrSeek[j]=SEEK_ON then begin
                WriteDateField(tbSeekDATER, Query.FieldByName('ON_DATER'));
                tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('ON_FAMILIA').AsString);
                tbSeekNAME.AsString:=cStr(Query.FieldByName('ON_NAME').AsString);
                tbSeekOTCH.AsString:=cStr(Query.FieldByName('ON_OTCH').AsString);
                tbSeekPOL.AsString:='М';
                tbSeekIDENTIF.AsString:=Query.FieldByName('ON_IDENTIF').AsString;
                tbSeekKOMM.AsString:='усыновитель';
              end else if arrSeek[j]=SEEK_ONA then begin
                WriteDateField(tbSeekDATER, Query.FieldByName('ONA_DATER'));
                tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('ONA_FAMILIA').AsString);
                tbSeekNAME.AsString:=cStr(Query.FieldByName('ONA_NAME').AsString);
                tbSeekOTCH.AsString:=cStr(Query.FieldByName('ONA_OTCH').AsString);
                tbSeekPOL.AsString:='Ж';
                tbSeekIDENTIF.AsString:=Query.FieldByName('ONA_IDENTIF').AsString;
                tbSeekKOMM.AsString:='усыновительница';
              end else if arrSeek[j]=SEEK_OTEC then begin
                WriteDateField(tbSeekDATER, Query.FieldByName('OTEC_DATER'));
                tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('OTEC_FAMILIA').AsString);
                tbSeekNAME.AsString:=cStr(Query.FieldByName('OTEC_NAME').AsString);
                tbSeekOTCH.AsString:=cStr(Query.FieldByName('OTEC_OTCH').AsString);
                tbSeekPOL.AsString:='М';
                tbSeekIDENTIF.AsString:=Query.FieldByName('OTEC_IDENTIF').AsString;
                tbSeekKOMM.AsString:='отец';
              end else if arrSeek[j]=SEEK_MAT then begin
                WriteDateField(tbSeekDATER, Query.FieldByName('MAT_DATER'));
                tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('MAT_FAMILIA').AsString);
                tbSeekNAME.AsString:=cStr(Query.FieldByName('MAT_NAME').AsString);
                tbSeekOTCH.AsString:=cStr(Query.FieldByName('MAT_OTCH').AsString);
                tbSeekPOL.AsString:='Ж';
                tbSeekIDENTIF.AsString:=Query.FieldByName('MAT_IDENTIF').AsString;
                tbSeekKOMM.AsString:='мать';
              end;
              StdPost;
            end;
            if bCancel=true then break;
            Query.Next;
          end;
          if bCancel=true then break;
        end;

      //---- смерть ---------------------------------------------------------
      end else if arrType[i]=dmBase.TypeObj_ZSmert then begin
        CreateFilterTable(dmBase.TypeObj_ZSmert, SEEK_MAIN);
        Query.First;
        while not Query.Eof do begin
          StdAppend(dmBase.TypeObj_ZSmert);
          WriteDateField(tbSeekDATER, Query.FieldByName('DATER'));
          tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('FAMILIA').AsString);
          tbSeekNAME.AsString:=cStr(Query.FieldByName('NAME').AsString);
          tbSeekOTCH.AsString:=cStr(Query.FieldByName('OTCH').AsString);
          tbSeekPOL.AsString:=Query.FieldByName('POL').AsString;
          tbSeekIDENTIF.AsString:=Query.FieldByName('LICH_NOMER').AsString;
          tbSeekKOMM.AsString:='';
          StdPost;
          if bCancel=true then break;
          Query.Next;
        end;
      //---- брак ---------------------------------------------------------
      end else if (arrType[i]=dmBase.TypeObj_ZBrak) or (arrType[i]=dmBase.TypeObj_ZRast) then begin
        SetLength(arrSeek,0);
        n:=0;
        if CheckAddPar(arrType[i],0) then begin  //он
          SetLength(arrSeek,n+2);
          arrSeek[n]:=SEEK_ON;
          arrSeek[n+1]:=SEEK_ON_P;
          Inc(n,2);
        end;
        if CheckAddPar(arrType[i],1) then begin  //она
          SetLength(arrSeek,n+2);
          arrSeek[n]:=SEEK_ONA;
          arrSeek[n+1]:=SEEK_ONA_P;
        end;
        for j:=0 to Length(arrSeek)-1 do begin
          for v:=1 to IIFI(lHist,2,1) do begin
            lOk:=CreateFilterTable(arrType[i], arrSeek[j], v=2);
            if lOk then begin
              if v=2 then ss:='(история)' else ss:='';
              Query.First;
              while not Query.Eof do begin
                lAdd:=false;
                s:='';
                //------- чтоб не добавлять совпвдающие фамилии до и после брака ----------
                if arrSeek[j]=SEEK_ON_P then begin
                  if tbSeek.Locate('FAMILIA;ID;POL',VarArrayOf([Query.FieldByName('ON_FAMILIAP').AsString,Query.FieldByName('ID').AsInteger,'М']),[loCaseInsensitive]) then begin
                    tbSeek.Edit;
                    tbSeekKOMM.AsString:='он (до и после)'+ss;
                    tbSeek.Post;
                  end else begin
                    lAdd:=true;
                    s:='P';
                  end ;
                end else if arrSeek[j]=SEEK_ONA_P then begin
                  if tbSeek.Locate('FAMILIA;ID;POL',VarArrayOf([Query.FieldByName('ONA_FAMILIAP').AsString,Query.FieldByName('ID').AsInteger,'Ж']),[loCaseInsensitive]) then begin
                    tbSeek.Edit;
                    tbSeekKOMM.AsString:='она (до и после)'+ss;
                    tbSeek.Post;
                  end else begin
                    lAdd:=true;
                    s:='P';
                  end;
                end else begin
                  lAdd:=true;
                end;
                if lAdd then begin
                  StdAppend(arrType[i]);
                  if (arrSeek[j]=SEEK_ON) or (arrSeek[j]=SEEK_ON_P) then begin
                    WriteDateField(tbSeekDATER, Query.FieldByName('ON_DATER'));
                    tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('ON_FAMILIA'+s).AsString);
                    tbSeekNAME.AsString:=cStr(Query.FieldByName('ON_NAME').AsString);
                    tbSeekOTCH.AsString:=cStr(Query.FieldByName('ON_OTCH').AsString);
                    tbSeekPOL.AsString:='М';
                    tbSeekIDENTIF.AsString:=Query.FieldByName('ON_IDENTIF').AsString;
                    if s='' then tbSeekKOMM.AsString:='он (до)'+ss else tbSeekKOMM.AsString:='он (после)'+ss;
                  end else if (arrSeek[j]=SEEK_ONA) or (arrSeek[j]=SEEK_ONA_P) then begin
                    WriteDateField(tbSeekDATER, Query.FieldByName('ONA_DATER'));
                    tbSeekFAMILIA.AsString:=cStr(Query.FieldByName('ONA_FAMILIA'+s).AsString);
                    tbSeekNAME.AsString:=cStr(Query.FieldByName('ONA_NAME').AsString);
                    tbSeekOTCH.AsString:=cStr(Query.FieldByName('ONA_OTCH').AsString);
                    tbSeekPOL.AsString:='Ж';
                    tbSeekIDENTIF.AsString:=Query.FieldByName('ONA_IDENTIF').AsString;
                    if s='' then tbSeekKOMM.AsString:='она (до)'+ss else tbSeekKOMM.AsString:='она (после)'+ss;
                  end;
                  StdPost;
                end;
                if bCancel=true then break;
                Query.Next;
              end;
            end;
            if bCancel=true then break;
          end;
        end;
      end;
      //-------------------------------------------------------------


      if bCancel=true then begin
        break;
      end;
    end;

    tbSeek.First;

    if tbSeek.Active and (tbSeek.RecordCount=0)
      then  pnNotFound.Visible:=true;
  end;
  CheckButton(false);
  ProgressImageTimer.Enabled:=false;
  ProgressImagePanel.Visible:=false;
  Query.Active:=false;
  bCancel:=false;

  {
  if ( Assigned( poQueryThread ) ) then
     FreeAndNil( poQueryThread );
  poQueryThread := TQueryThread.Create( True, Query, pbOpen );
  poQueryThread.Resume( Query );
  }
end;

//-----------------------------------------------------------------
procedure TfmSeekAkt.cbAllClick(Sender: TObject);
var
  i:Integer;
begin
//  lbType.Enabled:= not cbAll.Checked;
  for i:=0 to lbType.Items.Count-1 do begin
    lbType.Checked[i]:=cbAll.Checked;
  end;
  lbType.ItemIndex:=0;
  CheckVisibleAddPar;
end;

procedure TfmSeekAkt.lbTypeClickCheck(Sender: TObject);
begin
  CheckVisibleAddPar;
end;

procedure TfmSeekAkt.OpenButtonClick(Sender: TObject);
var
  slPar:TStringList;
begin
  if (CheckedCount=1) and (tbSeek.Active) and (tbSeek.RecordCount>1) then begin
    slPar:=TStringList.Create;
    slPar.Add('ENABLE_SKIP=1');
    slPar.Add('SKIP_POINTER='+IntToStr(Integer(tbSeek)));
  end else begin
    slPar:=nil;
  end;
  fmMain.EditDokument( tbSeek, tbSeekTypeAkt.AsInteger, tbSeekID.AsString, slPar, false, '');
  try
    if slPar<>nil then FreeAndNil(slPar);
  except
  end;
end;
//-----------------------------------------------------------------------
procedure TfmSeekAkt.GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if tbSeekVOSSTAN.AsBoolean then begin
    AFont.Color:=clBlue;
  end else begin

  end;
end;
//-----------------------------------------------------------------------
procedure TfmSeekAkt.edOrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_NAMEORG');
  if Opis<>nil then begin
    v := edOrgan.Value;
    SetLength(arrRec,0);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      edOrgan.Value:=v;
    end;
  end;
end;
//-----------------------------------------------------------------------
procedure TfmSeekAkt.edOrganEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  edOrgan.Value:=GlobalTask.ParamAsInteger('ID');
end;
//-----------------------------------------------------------------------
procedure TfmSeekAkt.edOrganEditButtons2Click(Sender: TObject;  var Handled: Boolean);
begin
  edOrgan.Value:=null;
end;
//-----------------------------------------------------------------------
procedure TfmSeekAkt.edFamiliaChange(Sender: TObject);
begin
//  if Trim(edFamilia.Text)<>'' then begin
//    if IsAllDigit(edFamilia.Text)
//      then edTypeSeek.ItemIndex:=1 else edTypeSeek.ItemIndex:=0;
//    edTypeSeekChange(nil);
//  end;
end;

procedure TfmSeekAkt.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSeekAkt.LoadFromIni;
var
  ini : TSasaIniFile;
  s,ss : String;
  l : Boolean;
  i,j,n,m,nTypeObj:Integer;
begin
  ini:=GlobalTask.iniFile('FORM');
  cbAll.Checked:=false; //ini.ReadBool('SEEKAKT', 'ALL', false);
  s:=ini.ReadString('SEEKAKT', 'TYPEOBJ', '');
  ss:=ini.ReadString('SEEKAKT', 'ADDFIELD', '');
  m:=-1;
  for i:=0 to Length(arrTS)-1 do begin
    lbType.Checked[i]:= (Copy(s,i+1,1)='1');
    nTypeObj:=GetTypeAktFromIndex(i);
    if lbType.Checked[i] and ((nTypeObj=_TypeObj_ZSmert) or (nTypeObj=_TypeObj_ZChName)) then begin
      if m=-1 then m:=i;
    end else begin
      n:=Length(arrTS[i].arrC);
      for j:=0 to n-1 do begin
        arrTS[i].arrC[j]:=(Copy(ss,i*n+j+1,1)='1');
        if lbType.Checked[i] and arrTS[i].arrC[j] then begin
          if m=-1 then m:=i;
        end;
      end;
    end;
  end;
  if m>-1
    then lbType.ItemIndex:=m;
end;

procedure TfmSeekAkt.SaveToIni;
var
  ini : TSasaIniFile;
  s,ss : String;
  l : Boolean;
  i,j:Integer;
begin
  ini := GlobalTask.iniFile('FORM');
  if ini <>nil then begin
    ini.WriteBool('SEEKAKT', 'ALL', cbAll.Checked);
    s:='';
    ss:='';
    for i:=0 to Length(arrTS)-1 do begin
      if lbType.Checked[i] then s:=s+'1' else s:=s+'0';
      for j:=0 to Length(arrTS[i].arrC)-1 do begin
        if arrTS[i].arrC[j] then ss:=ss+'1' else ss:=ss+'0';
      end;
    end;
    ini.WriteString('SEEKAKT', 'TYPEOBJ', s);
    ini.WriteString('SEEKAKT', 'ADDFIELD', ss);
  end;
end;

procedure TfmSeekAkt.lbTypeDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
	Bitmap: TBitmap;      { temporary variable for the item’s bitmap }
	Offset: Integer;      { text offset width }
begin
	with (Control as TCheckListBox).Canvas do begin { draw on control canvas, not on the form }
    FillRect(Rect);       { clear the rectangle }
    Offset := 5;          { provide default offset }
    if ItemEnabled(Index)
      then Font.Style:=[fsBold]
      else Font.Style:=[];
    Bitmap := nil; //TBitmap((Control as TListBox).Items.Objects[Index]);  { get the bitmap }
  //	Bitmap := TBitmap((Control as TListBox).Items.Objects[Index]);  { get the bitmap }
    if Bitmap <> nil then begin
      BrushCopy(Bounds(Rect.Left + Offset, Rect.Top, Bitmap.Width, Bitmap.Height),
        Bitmap, Bounds(0, 0, Bitmap.Width, Bitmap.Height), clRed);  {render bitmap}
      Offset := Bitmap.width + 6;    { add four pixels between bitmap and text}
    end;
    TextOut(Rect.Left + Offset, Rect.Top, (Control as TCheckListBox).Items[Index]);  { display the text }
  end;
end;

procedure TfmSeekAkt.gbAddParClick(Sender: TObject);
begin
  lbType.Repaint;
end;

procedure TfmSeekAkt.TBItemLogClick(Sender: TObject);
begin
  ShowMemo(slLog,'Лог работы','');
end;

procedure TfmSeekAkt.GridDblClick(Sender: TObject);
begin
  OpenButtonClick(nil);
end;

procedure TfmSeekAkt.CheckButton(lRun: Boolean);
begin
  OpenButton.Enabled:=not lRun;
  FindButton.Enabled:=not lRun;
  ExitButton.Enabled:=not lRun;
  StopButton.Enabled:=lRun;
end;

procedure TfmSeekAkt.TBItemExportClick(Sender: TObject);
var
  ExportColumns:TExportColumnList;
begin
  if not Grid.Datasource.DataSet.Eof then begin
    ExportColumns := TExportColumnList.Create;
    FillColumnList2(Grid, ExportColumns);
    ExportDataSet('Экспорт', Grid.Datasource.DataSet, efRtf, [], GetFolderMyDocument, False, False, ExportColumns);
    ExportColumns.Free;
  end;
end;

//--------------------------------------------------------------------
procedure TfmSeekAkt.CheckVisible;
begin
  if TBItemCheckZAGS.Checked then begin
    pnZAGS.Visible:=true;
    GridZAGS.Visible:=true;
    Grid.Visible:=false;
    imZAGS.Visible:=false;
  end else begin
    pnZAGS.Visible:=false;
    GridZAGS.Visible:=false;
    Grid.Visible:=true;
    if edOrgan.Value=null then begin
      imZAGS.Visible:=tbZAGS.Locate('CHECK',true,[]);
    end else begin
      imZAGS.Visible:=false;
    end;
  end;
end;
//--------------------------------------------------------------------
procedure TfmSeekAkt.TBItemCheckZAGSClick(Sender: TObject);
//var
//  f:TfmMultiChoice;
//  s:String;
begin
  TBItemCheckZAGS.Checked:=not TBItemCheckZAGS.Checked;
  CheckVisible;
{
  f := TfmMultiChoice.Create(Self);
  f.FFieldName:='id_zags';
  dmBase.SprNames.First;
  while not dmBase.SprNames.Eof do begin
    f.cbChoice.Items.Add(dmBase.SprNames.FieldByName('NAME').AsString);
    f.FKeyValues.Add(dmBase.SprNames.FieldByName('ID').AsString);
    dmBase.SprNames.Next;
  end;
  dmBase.SprNames.First;
  f.SetValues(FValues_ZAGS);
  if f.ShowModal=mrOk then begin
    s:=f.GetValuesForFilter;
    if s=''
      then FFilter_ZAGS:=''
      else FFilter_ZAGS:='('+f.GetValuesForFilter+')';
    FValues_ZAGS:=f.GetValues;
  end;
  f.Free;
  Application.ProcessMessages;}
end;

procedure TfmSeekAkt.GridZAGSTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
//var
//  lReopen:Boolean;
 // CurValue: TParamFieldFlt;
begin
{
  DataSource2.DataSet.Filter:='';
  DataSource2.DataSet.Filtered:=false;
  DataSource2.DataSet.DisableControls;
  CurValue:=TParamFieldFlt.Create;
  CurValue.AOwner:=self;
  CurValue.Empty:=true;  // !!!   типа нет текущих значений для поиска
  if SetGridSeekColumn(Column, true, '', lReopen, CurValue) then begin
   // tbClr.Visible := true;
    DataSource2.DataSet.EnableControls;
  end else begin
    DataSource2.DataSet.EnableControls;
  end;
  CurValue.Free;       }
end;

procedure TfmSeekAkt.edChange(Sender: TObject);
var
 arr:TArrStrings;
 i:Integer;
 s:String;
begin
  if ed.Text='' then begin
    tbZAGS.Filter:='';
    tbZAGS.Filtered:=false;
  end else begin
    if Pos('+',ed.Text)=0 then begin
      tbZAGS.Filter:='At('+QStr(ANSIUpperCase(ed.text))+',Upper(name))>0';
      tbZAGS.Filtered:=true;
    end else begin
      funcPr.StrToArr(ed.Text,arr,'+',true);
      if Length(arr)>0 then begin
        s:='';
        for i:=Low(arr) to HIGH(arr) do begin
          s:=s+'At('+QStr(ANSIUpperCase(arr[i]))+',Upper(name))>0 and ';
        end;
        s:=Trim(Copy(s,1,Length(s)-5));
        if s='' then begin
          tbZAGS.Filter:='';
          tbZAGS.Filtered:=false;
        end else begin
          tbZAGS.Filter:=s;
          tbZAGS.Filtered:=true;
        end;
      end;
    end;
  end;
end;

procedure TfmSeekAkt.SpeedButton1Click(Sender: TObject);
begin
  tbZAGS.CheckBrowseMode;
  dmbase.AdsConnection.Execute('UPDATE #tmp_zags_seek set check=false;');
  tbZAGS.First;
  GridZAGS.Refresh;
end;

procedure TfmSeekAkt.imZAGSClick(Sender: TObject);
begin
//  if not TBItemCheckZAGS.Checked
//    TBItemCheckZAGSClick(nil);
end;

procedure TfmSeekAkt.edOrganUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckVisible;
end;

procedure TfmSeekAkt.edOrganChange(Sender: TObject);
begin
  CheckVisible;
end;

procedure TfmSeekAkt.TBItemCountClick(Sender: TObject);
begin
  if tbSeek.Active and (tbSeek.RecordCount>0) then
    ShowMessageCont('   '+IntToStr(tbSeek.RecordCount)+'    ',self);
end;

destructor TfmSeekAkt.Destroy;
begin
  if fmMain<>nil then
    fmMain.DeleteFromListGurnal(Self.Name);
  inherited;
end;

procedure TfmSeekAkt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{
   if ( Assigned( poQueryThread ) ) then
   begin
      // Tell the thread to cancel and then wait for it to be called.
      bCancelSQL := True;
      poQueryThread.WaitFor;

      // Destroy the thread object now
      FreeAndNil( poQueryThread );
   end;
 }
   Action := caFree;
  try
    dmBase.AdsConnection.Execute('DROP TABLE #tmp_zags_seek;');
  except
  end;

end;

procedure TfmSeekAkt.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=true;
  SaveToIni;
end;

//-----------------------------------------------------------------------
procedure TfmSeekAkt.CheckEnabledScreen(lSet:Boolean);
var
  I:Integer;
begin
{
  for I:=0 to Pred(Screen.FormCount) do begin
    if (Screen.Forms[I]<>MessageForm) then begin
      Screen.Forms[I].Enabled:=lSet;
    end;
  end;
  }
end;

procedure TfmSeekAkt.pnNotFoundClick(Sender: TObject);
begin
  pnNotFound.Visible:=false;
end;

procedure TfmSeekAkt.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if pnNotFound.Visible
    then pnNotFound.Visible:=false;
end;

initialization
//   FindWindowList:=TStringList.Create;
finalization
//   FindWindowList.Free;
end.
