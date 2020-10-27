unit fSimple;

interface
                                
{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBCtrls,
  ExtCtrls, StdCtrls, Buttons, TB2Dock, TB2Toolbar, MetaTask, mPermit,ToolCtrlsEh, TypInfo,
  SasaUtils, SasaIniFile, DbFunc, FuncPr, Db, TB2Item, Mask, DBCtrlsEh, DBLookupEh,
  ComCtrls, GridSetUp, SasaDbGrid, OpisEdit, {VCLUtils,} AddEvents,
  {$IFDEF USE_TEMPLATE}
    mTempl, mTplInt,
  {$ENDIF}
  NewDialogs, dDokument,ifpii_vadfunc, ReportTask{fmreport}, Grids,
  DBGridEh, {$IFNDEF EHLIB3 } GridsEh, {$ENDIF}
  AdsTable, Script, CreateControls, kbmMemTable,{$IFDEF EHLIB3 } dbGrids, {$ENDIF} UserEvents
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TRecErrorDate=record
    FFieldName:String;
    FType:Integer;
    FVal1:TDateTime;
    FVal2:TDateTime;
  end;
  TArrErrorDate=array of TRecErrorDate;

  TfmSimple = class(TForm)
    TBDock: TTBDock;
    sb: TScrollBox;
    TBToolbar: TTBToolbar;
    StBar: TStatusBar;
    TBItemPrint: TTBItem;
    TBItemWrite: TTBItem;
    TBItemCancel: TTBItem;
    TBItemReLoad: TTBItem;
    TBItemSetUp: TTBItem;
    TBItemPreView: TTBItem;
    TBItemDesignReport: TTBItem;
    dsDokument: TDataSource;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItemDelList: TTBItem;
    TBSubmenuTmp: TTBSubmenuItem;
    dsObl: TDataSource;
    dsRN: TDataSource;
    dsGorod: TDataSource;
    dsStran: TDataSource;
    dsTypeGorod: TDataSource;
    TBToolbarMove: TTBToolbar;
    TBItemFirst: TTBItem;
    TBItemPrev: TTBItem;
    TBItemNext: TTBItem;
    TBItemLast: TTBItem;
    TBItemNonQuery: TTBItem;
    TBItemAddHist: TTBItem;
    TBItemHist: TTBItem;
    TBSubmenuRun: TTBSubmenuItem;
    ImBtClear: TImage;
    ImBtRun: TImage;
    procedure TBItemSetUpClick(Sender: TObject);
    procedure TBItemDesignReportClick(Sender: TObject);
    procedure StBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;   const Rect: TRect);
    procedure TBItemPereklClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBItemReLoadClick(Sender: TObject);
    procedure TBItemWriteClick(Sender: TObject);
    procedure TBItemCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TBItemCopyClick(Sender: TObject);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure TBItemCalcClick(Sender: TObject);
    procedure TBItemFirstClick(Sender: TObject);
    procedure TBItemPrevClick(Sender: TObject);
    procedure TBItemNextClick(Sender: TObject);
    procedure TBItemLastClick(Sender: TObject);
    procedure TBItemDelListClick(Sender: TObject);
    procedure TBItemPreViewClick(Sender: TObject);
    procedure TBItemPrintClick(Sender: TObject);
    procedure TBItemAddHistClick(Sender: TObject);
    procedure TBItemHistClick(Sender: TObject);
  private
      { Private declarations }
    FCheckKeyboard:Boolean;
    FSubSystem : Integer;
    FCreateCont : TCreateControls;
    FQueryExit: Boolean;
    FClearKey : Boolean;
    FDokument: TdmDokument;
    FActionForClose: TCloseAction;
    FCheckExit: Boolean;
    FSkipDataSet: TDataSet;
    FListRekvVisibleParam : String;
    FOnSetDokument: TNotifyEvent;
    procedure SetQueryExit(const Value: Boolean);
    procedure SetDokument(const Value: TdmDokument);
    procedure SetActionForClose(const Value: TCloseAction);
    procedure SetCheckExit(const Value: Boolean);
    procedure SetSkipDataSet(const Value: TDataSet);
    procedure SetOnSetDokument(const Value: TNotifyEvent);
  public
    FCheckAutoSum:Boolean;
    FFieldsAutoSum_All:TStringList;
    FFieldsAutoSum_My:TStringList;
    CheckQueryExit : Boolean;
    FRunProcess:Boolean;
    FCancelProcess:Boolean;
    FPar : TStringList;
    FHistFields  :TStringList;
    FEnableWrite:Boolean;
    FTmpWrite:Boolean;
    FEvents : TUserEvents;
    FGrid     : TSasaDbGrid;
    FOldControl : TWinControl;
    FRun : Boolean;
    FCheckBelName : Boolean;
    ListDopRazdel : TStringList;
    FGurnal : String; // журнал из которого открыти форму
    FSubType : String; // подтип формы для fmMen(населения) : LIC,NAS,VUS,OCH
    FArrZakl : TArrStrings; // массив видимых закладок
    FArrErrorDate : TArrErrorDate;
    procedure ActiveControlChanged(Sender: TObject);
    procedure SetSubSystem( nSS : Integer);
    procedure CheckMenuReport;
    function  GetSubSystem : Integer;
    property SkipDataSet : TDataSet read FSkipDataSet write SetSkipDataSet;
    property CheckExit : Boolean read FCheckExit write SetCheckExit;
    property ActionForClose : TCloseAction read FActionForClose write SetActionForClose;
    property Dokument : TdmDokument read FDokument write SetDokument;
    // пока константы но в будущем надо использовать
    property QueryExit : Boolean read FQueryExit write SetQueryExit;
    constructor Create( Owner : TComponent); override;
    destructor Destroy; override;
    function SaveToIni : Boolean; virtual;
    function EditForm(slPar : TStringList; strGurnal:String) : Boolean; virtual; abstract;
    procedure LoadFromIni; virtual;
    procedure SetFlat( lFlat : Boolean);
    procedure SetReadOnly( lSet : Boolean);
    procedure SetRole;
    function  GetNameReport : String; virtual;
    procedure UpdateActions; override;
    function RunProcScript( strFuncName : String; var vResult : Variant ) : Boolean;
    function RunFuncScript(strFuncName: String; ArrPar : array of Variant; var vResult : Variant): Boolean;
//    function WriteDok : Boolean; virtual; abstract;
    procedure ReadDopValues; virtual;
    procedure CreateDopControls( TypeObj : Integer; Control : TWinControl; strRazdel : String; MyColor:TColor; AddCreateControl:TEventCreateControl=nil);
    procedure RunCalc;
    function LoadTemplate( strKod : String) : Boolean;
    procedure OnTemplateMenuClick(Sender: TObject);

    procedure WriteToDebug(arr:array of Variant);

    procedure SetUpdateDate;
    procedure SetErrorDateControl(n:Integer;sField:String; nType:Integer; nVal1:Integer; nVal2:Integer);
    procedure UpdateDateControl(Sender: TObject; var Handled: Boolean);

    //----------------------------------------------------
    procedure AssignPar(slPar:TStringList);     // прочить в переменную FPar список slPar
    function GetParam(sParam,sDefault:String):String; // вернуть значение параметра из FPar
    function RunReport:Integer;                 // выполнить отчет переданный в списке slPar
    function RunReportSkip(sNameReport:String; ds: TDataSet): Integer;            // выполнить отчет со skip по базе
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);

    function IsShowEdit:Boolean;                // откравать или нет форму для просмотра и корректировки или тихо выйти
    //----------------------------------------------------
    procedure GetProperty( prop : TPropControl; lNext : Boolean );
    function GetParamVisible( strKod : String ) : Boolean;
    procedure AddFieldsDopTable(nTypeObj:Integer);
    function CreateRunTimeProperty : Boolean; virtual; abstract;
    //----------------------------------------------------
    procedure GetStruDok;
    function GetdsDopProp : TDataSource; virtual; abstract;
    procedure AfterConstruction; override;
    function BeforeSkip : Boolean;
    procedure AfterSkip;
    procedure UserAfterSkip; virtual;
    procedure DisableControls;
    procedure EnableControls;
    function BeforeReport : Boolean; virtual;
    procedure AfterReport; virtual;

    procedure CreateEditPriznak( wc : TWinControl; ds : TDataSource; strOpis : String; strFieldName : String);
    procedure OnClickAddPriznak( Sender : TObject );
    procedure OnClickDelPriznak( Sender : TObject );
    procedure ChoiceFromLookupSpr( strNameOpis : String; strFieldName : String; lString : Boolean; ds:TDataSet=nil );

    procedure CheckListObl(Sender: TObject; NewText: String; var RecheckInList: Boolean);
    procedure CheckListRaion(Sender: TObject; NewText: String; var RecheckInList: Boolean);

    procedure CheckControlHist;
    function FieldAddHist(fld : TField; ActControl : TWinControl; var strErr : String) : Boolean;
    function EnableHistoryField(strFieldName: String): Boolean;
    procedure LoadHistFields;

    procedure SetMRUList(ed:TDbEditEh;nLimit:Integer;nType:Integer;lAll:Boolean;lReload:Boolean;lBel:Boolean;lAddButton:Boolean;lPunktFromSpr:Boolean=false);
    procedure MRUListOpen(Sender: TObject;  var Handled: Boolean);
    property  OnSetDokument : TNotifyEvent read FOnSetDokument write SetOnSetDokument;

  end;

  TMyLookUpComboBox = class(TDBLookupComboboxEh)
  public
    property ListActive;
  end;
  TMyDateTimeEdit = class(TDBDateTimeEditEh)
  public
    property DropDownCalendar;
  end;

implementation

uses fMain, dBase, fHist,
     {$IFDEF ADD_MENS_PU}
     dLichSchet, dAdres,
     {$ENDIF}
     uProject;

{$R *.DFM}

var
  lSetDecimal : Boolean;

{ TfmSimple }

constructor TfmSimple.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FCheckAutoSum:=false;;
  FFieldsAutoSum_All:=TStringList.Create;
  FFieldsAutoSum_My:=TStringList.Create;

  FRunProcess:=false;
  FCancelProcess:=false;
  FPar:=TStringList.Create;
  FSubType:='';
  SetLength(FArrZakl,0);
  SetLength(FArrErrorDate,0);
  FGurnal:='';
  FEvents:=nil;
  FGrid:=nil;
  FClearKey:=false;
  FDokument := nil;
  SetRole;
  FCreateCont := TCreateControls.Create;
  FCreateCont.Owner := Self;
  FActionForClose := caFree;
  FCheckExit := true;
  ListDopRazdel := TStringList.Create;
  FHistFields := TStringList.Create;
  SkipDataSet:=nil;
  FCheckBelName := GlobalTask.ParamAsBoolean('CHECK_BEL_NAME');
  FCheckKeyboard:=GlobalTask.ParamAsBoolean('KEYBOARD');
//  if not GlobalTask.ParamAsBoolean('FLAT') then begin
  SetFlat(GlobalFlat);
//  end;
  TBSubmenuTmp.Visible:=false;
  TBItemAddHist.Visible:=false;
  TBItemHist.Visible:=false;
  FListRekvVisibleParam := GlobalTask.ParamAsString('LISTREKV_V');
end;

const
  PropForm = ',Left,Top,Width,Height,WindowState,';
  PropSP   = ',Top,';

destructor TfmSimple.Destroy;
begin
  FPar.Free;
  FEvents.Free;
  SaveToIni;
  FCreateCont.Free;
  ListDopRazdel.Free;
  FHistFields.Free;
  FFieldsAutoSum_All.Free;
  FFieldsAutoSum_My.Free;
  inherited Destroy;
end;

procedure TfmSimple.CheckListObl(Sender: TObject; NewText: String;  var RecheckInList: Boolean);
var
  tb : TAdsTable;
begin
  if Trim(NewText)<>'' then begin
    tb := TAdsTable(TDBLookupComboboxEh(Sender).ListSource.DataSet);
    if ANSIUpperCase(tb.TableName) = 'SPRPEREVOD' then begin
      tb.Append;
      tb.FieldByName('TIP').AsInteger := 1;
      tb.FieldByName(TDBLookupComboboxEh(Sender).KeyField).AsString := NewText;
      tb.Post;
      RecheckInList:=true;
    end;
  end;
end;

procedure TfmSimple.CheckListRaion(Sender: TObject; NewText: String; var RecheckInList: Boolean);
var
  tb : TAdsTable;
begin
  if Trim(NewText)<>'' then begin
    tb := TAdsTable(TDBLookupComboboxEh(Sender).ListSource.DataSet);
    if ANSIUpperCase(tb.TableName) = 'SPRPEREVOD' then begin
      tb.Append;
      tb.FieldByName('TIP').AsInteger := 2;
      tb.FieldByName(TDBLookupComboboxEh(Sender).KeyField).AsString := NewText;
      tb.Post;
      RecheckInList:=true;
    end;
  end;
end;

function TfmSimple.GetSubSystem: Integer;
begin
  Result:=FSubSystem;
end;

procedure TfmSimple.SetSubSystem(nSS: Integer);
var
  pt : TPermitType;
begin
  FSubSystem:=nSS;
  pt:=Role.CheckSubSystem(nSS);
  if pt=ptFull
    then FEnableWrite:=true
    else FEnableWrite:=false;
  FTmpWrite:=FEnableWrite;
  CheckToolBar(TBToolbar,FEnableWrite);
end;

procedure TfmSimple.LoadFromIni;
var
 ListOpis : TListOpisEdit;
begin
  ListOpis:=GlobalTask.CurrentOpisEdit;
  if ListOpis<>nil then                 
    ListOpis.SetKeyForm(Self,nil);
  CompFromIni(Self,GlobalTask.iniFile('FORM'), Name, PropForm);
  if (WindowState<>wsNormal) and (WindowState<>wsMaximized) then WindowState:=wsNormal;
//  if WindowState=wsMinimized then WindowState:=wsNormal;
  if WindowState<>wsMaximized then begin
    if (Left<2) or (Top<2) or (Top+Height>Screen.Height) or (Left+Width>Screen.Width) then begin
      Left:=10;
      Top:=10;
      Width:=Screen.Width-20;
      Height:=Screen.Height-20;
    end;
  end;
  CompFromIni(sb,GlobalTask.iniFile('FORM'), Name+'.Панель', ',Height,');
  QueryExit:=false;            
  CheckQueryExit:=false;

//  if not Dokument.EnableWrite then begin
//    TBItemWrite.Enabled := false;
//  end;

end;

function TfmSimple.SaveToIni : Boolean;
var
  ini : TSasaIniFile;
begin
  if GlobalTask<>nil then begin
    ini := GlobalTask.iniFile('FORM');
    CompToIni(Self, ini, Name, PropForm);
    CompToIni(sb, ini, Name+'.Панель', ',Height,');
  end;
  Result := true;
end;

//------------------------------------------------------------------
procedure TfmSimple.SetReadOnly(lSet: Boolean);
var
  i  : Integer;
begin
  for i:=0 to ComponentCount-1 do begin
    if (Components[i] is TCustomDbEditEh) then begin
      TCustomDbEditEh(Components[i]).ReadOnly := lSet;
    end else if (Components[i] is TDbGridEh) then begin
      TDbGridEh(Components[i]).ReadOnly := lSet;
    end;
//    SetPropertyObject( Components[i], 'Flat', lFlat);
  end;
end;

//------------------------------------------------------------------
procedure TfmSimple.SetFlat( lFlat : Boolean);
var
  i  : Integer;
  fn : TFont;
begin
  for i:=0 to ComponentCount-1 do begin
//    if IsHaveProperty(Components[i],'DataSource') and not (Components[i] is TCustomDbEditEh)
//      then ss:=ss+Components[i].name+',';
    if (Components[i] is TCustomDbEditEh) or (Components[i] is TDbCheckBoxEh) then begin
//      SetPropertyObject( Components[i], 'ReadOnly', false);
//      if TCustomDbEditEh(Components[i]).ReadOnly=true then begin
//        s:=s+TCustomDbEditEh(Components[i]).Name+',';
//      end;
      TCustomDbEditEh(Components[i]).Flat := lFlat;
      if (Copy(Components[i].Name,1,4)='N_F_') then begin

      end else begin
        fn := GetFont(Components[i],'Font');
        fn.Size:=GlobalFontSizeE;
      end;
    end else if (Components[i] is TDbMemo) then begin
      TDbMemo(Components[i]).Font.Size:=GlobalFontSizeE;
    end else if (Components[i] is TDbGridEh) then begin
      SetOptionsGrid(TDbGridEh(Components[i]),Self,false);
//      if TDbGridEh(Components[i]).ReadOnly then
//        s:=s+TDbGridEh(Components[i]).Name+',';
    end;
  end;
//if (s<>'') or (ss<>'') then showmessage(s+'  '+IntToStr(n2-n1)+'   not Eh:'+ss);
end;

procedure TfmSimple.TBItemSetUpClick(Sender: TObject);
begin
  if ActiveControl is TSasaDbGrid then begin
    SetUpGrid(TSasaDBGrid(ActiveControl),'',true);
  end;
end;

procedure TfmSimple.SetRole;
begin
  TBItemSetUp.Visible:=Role.SystemAdmin or EnableReport; //Role.Enabled(toConfig);
  TBItemDesignReport.Visible:=Role.SystemAdmin or EnableReport; // or Role.Enabled(toDesignReport);
end;

//--------------------------------------------------------------
procedure TfmSimple.WriteToDebug(arr:array of Variant);
var
// lRun:Boolean;
 v:Variant;
begin
  RunFuncScript('WriteDebug_',arr,v);
end;

procedure TfmSimple.TBItemDesignReportClick(Sender: TObject);
var
  s : String;
begin
  s := GetNameReport;
  if s='' then begin
    s := '&Empty.frf';
  end;
  GlobalTask.DesignTailReport( s );
end;

procedure TfmSimple.StBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  PutStrHelp(Panel.Text, StatusBar.Canvas, Rect);
end;

procedure TfmSimple.TBItemPereklClick(Sender: TObject);
begin
  if FGrid<>nil then begin
    if ActiveControl is TSasaDbGrid then begin
      ActiveControl:=FOldControl;
    end else begin
      FOldControl:=ActiveControl;
      ActiveControl:=FGrid;
    end;
  end;
end;

procedure TfmSimple.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
//  BackWard : Integer;
//  lHand : Boolean;
begin
 lSetDecimal:=false;
 if Key = VK_DECIMAL then begin
   lSetDecimal:=true;
 end;
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
 if (Key > 0) and (Key=VK_F12) and (Shift = [ssShift]) then begin
   GetStruDok;
 end;
 if (Key > 0) and (Key=VK_ESCAPE) and FRunProcess then begin
   FCancelProcess:=true;
 end;
end;

procedure TfmSimple.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
  if lSetdecimal then begin
    Key := DecimalSeparator;
    lSetDecimal:=false;
  end;
//    TDBDateTimeEditEh(ActiveControl). CalendarVisible:=true;
//    SendMessage(TDBDateTimeEditEh(ActiveControl).Handle, CB_SHOWDROPDOWN, 1, 0);
//  end;
end;

procedure TfmSimple.SetQueryExit(const Value: Boolean);
begin
  FQueryExit := Value;
end;

procedure TfmSimple.UpdateActions;
begin
  inherited;
  if ActiveControl is TSasaDbGrid then begin
    if ActiveControl.Name = 'GridMens' then begin
      TBItemDelList.Enabled:=false;
    end else begin
      TBItemDelList.Enabled:=true;
    end;
  end else begin
    TBItemDelList.Enabled:=false;
  end;
end;

function TfmSimple.RunProcScript(strFuncName: String; var vResult : Variant): Boolean;
begin
  //vResult:=null;
  Result:=false;
  if (GlobalTask.Script<>nil) and not FRun then begin
    FRun:=true;
    try
      Result := GlobalTask.Script.RunEx(strFuncName,[],vResult);
    finally
      FRun := false;
    end;
  end;
end;

function TfmSimple.RunFuncScript(strFuncName: String; ArrPar : array of Variant;  var vResult : Variant): Boolean;
begin
  //vResult:=null;
  Result:=false;
  if (GlobalTask.Script<>nil) and not FRun then begin
    FRun:=true;
    try
      Result := GlobalTask.Script.Run(strFuncName,ArrPar,vResult);
    finally
      FRun := false;
    end;
  end;
end;

procedure TfmSimple.FormClose(Sender: TObject; var Action: TCloseAction);
var
  n : Integer;
  strErr : String;
begin
  Action:=FActionForClose;
  if not FEnableWrite or not FTmpWrite then begin
    exit;
  end;
  if Dokument=nil then begin
    exit;
  end;
  if CheckExit then begin
    if Dokument.PostDokument then begin
      if QueryExit then begin
        n := QuestionPos(' Сохранить документ ? ',
          'Да;Нет; Продолжить ;','',-1,-1,qtConfirmation,Self);
        if n=3 then begin
          Action:=caNone;
          exit;
        end;
        //-------------------------------------------------
        if n=1 then begin //Problem('    Сохранить документ ?    ') then begin
          if not Dokument.WriteDokument(self) then begin
            Action:=caNone;
          end else begin
            CheckQueryExit:=true;
          end;
        end else begin
          QueryExit:=false;
        end;
      end;
      // если выходим без сохранения и документ был новый проверим
      // попробуем отвернуть значение для автонумерации
      if (Action <> caFree) and (Dokument.mtDokumentID.IsNull or (Dokument.mtDokumentID.AsInteger=-1)) then begin
        Dokument.SetNextNumber( '' );
      end;
    end;
  end else begin
    if not Dokument.PostDokument then begin
      Action:=caNone;
    end else begin
      if not Dokument.CheckDokument(strErr) then begin
        Beep;
        PutError(strErr,self);
        Action:=caNone;
      end;
    end;
  end;
end;

procedure TfmSimple.TBItemReLoadClick(Sender: TObject);
//var
//  v : Variant;
begin
//  RunProcScript('CURRENTDOK',v);
  Dokument.ReadDokument( Dokument.mtDokumentID.AsInteger );
  QueryExit:=false;
  CheckQueryExit:=false;
end;

procedure TfmSimple.ReadDopValues;
begin
//
end;

procedure TfmSimple.TBItemWriteClick(Sender: TObject);
begin
  if not FEnableWrite or not FTmpWrite  then begin
//    ModalResult := mrCancel;
    ModalResult := mrNone;
  end else begin
    if CheckExit then begin
      if Dokument.WriteDokument(self) then begin
        CheckQueryExit:=QueryExit;
        QueryExit := false;
        ModalResult := mrOK;
      end;
    end else begin
      if Dokument.PostDokument then begin
        CheckQueryExit:=QueryExit;
        QueryExit := false;
        ModalResult := mrOK;
      end;
    end;
  end;
end;

procedure TfmSimple.TBItemCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSimple.FormCreate(Sender: TObject);
begin
//
end;

procedure TfmSimple.TBItemCopyClick(Sender: TObject);
var
  arrRec : TCurrentRecord;
  Grid : TSasaDbGrid;
begin
  if ActiveControl is TSasaDbGrid then begin
    Grid := TSasaDbGrid(ActiveControl);
    if not Grid.EditorMode then begin
      GetCurrentRecord(Grid.DataSource.DataSet, '', arrRec);
      AddCurrentRecord(Grid.DataSource.DataSet, arrRec);
      Grid.SelectedIndex:=Grid.VisibleColumns.Items[0].Index;
    end;
  end;
end;

function TfmSimple.GetNameReport: String;
var
  v : Variant;
  s : String;
  i : Integer;
begin
  if (GlobalTask.Script<>nil) then begin
    v:=null;
    v:='';   
    ClearReports;
    if FSubType='' then begin
      GlobalTask.Script.RunEx(Dokument.GetVid+'_REPORT',[],v);
    end else begin
      s:='';
      for i:=0 to Length(FArrZakl)-1
        do s:=s+FArrZakl[i]+';';
      GlobalTask.Script.RunEx(Dokument.GetVid+'_REPORT',[FSubType,s],v);
    end;
    if (v<>null) and (VarToStr(v)<>'') then begin
      Result := v;
    end else begin
      Result := ''; //'&Empty.frf';
    end;
  end;
end;

function TfmSimple.LoadTemplate( strKod : String) : Boolean;
var
  s : String;
  l1,l3,ll : Boolean;
  i:Integer;
begin
  {$IFDEF OCHERED}
  FEvents := TUserEvents.Create;
  FEvents.LoadEvents2(strKod, TBSubmenuTmp,true);
  s:='_'+Copy(GlobalTask.ParamAsString('KOD'),1,1);
  FEvents.LoadEvents2(strKod+s, TBSubmenuTmp,false);
  s:=Copy(GlobalTask.ParamAsString('KOD'),1,4);
  FEvents.LoadEvents2(strKod+s, TBSubmenuTmp,false);

  // !!! грузим только для [fmMen_OTD_OCH]

//  !!! l1:=fmMain.TemplateInterface.BuildMenu(Self.Name, TBSubmenuTmp, false, fmMain.OnTemplateMenuClick);

  if FSubType<>'' then begin
//  !!!  ll:=fmMain.TemplateInterface.BuildMenu(Self.Name+'_'+FSubType, TBSubmenuTmp, false, fmMain.OnTemplateMenuClick);
    if not l1 then l1:=ll;
    if Length(FArrZakl)>0 then begin
      for i:=0 to Length(FArrZakl)-1 do begin
        ll:=fmMain.TemplateInterface.BuildMenu(Self.Name+'_'+FSubType+'_'+FArrZakl[i], TBSubmenuTmp, false, OnTemplateMenuClick);
        if not l1 then l1:=ll;
      end;
    end;
  end;

  {$ELSE}
  FEvents := TUserEvents.Create;
  FEvents.LoadEvents2(strKod, TBSubmenuTmp,true);
  s:='_'+Copy(GlobalTask.ParamAsString('KOD'),1,1);
  FEvents.LoadEvents2(strKod+s, TBSubmenuTmp,false);
  s:=Copy(GlobalTask.ParamAsString('KOD'),1,4);
  FEvents.LoadEvents2(strKod+s, TBSubmenuTmp,false);
  l1:=fmMain.TemplateInterface.BuildMenu(Self.Name, TBSubmenuTmp, false, OnTemplateMenuClick);
  if FSubType<>'' then begin
    ll:=fmMain.TemplateInterface.BuildMenu(Self.Name+'_'+FSubType, TBSubmenuTmp, false, OnTemplateMenuClick);
    if not l1 then l1:=ll;
    if Length(FArrZakl)>0 then begin
      for i:=0 to Length(FArrZakl)-1 do begin
        ll:=fmMain.TemplateInterface.BuildMenu(Self.Name+'_'+FSubType+'_'+FArrZakl[i], TBSubmenuTmp, false, OnTemplateMenuClick);
        if not l1 then l1:=ll;
      end;
    end;
  end;
//--------- загрузим для области ------------
//  s:='_'+Copy(GlobalTask.ParamAsString('KOD'),1,1);
//  l2:=fmMain.TemplateInterface.BuildMenu(Self.Name+s, TBSubmenuTmp, false, nil);
//  if FSubType<>'' then l2:=fmMain.TemplateInterface.BuildMenu(Self.Name+'_'+FSubType+s, TBSubmenuTmp, false, nil);
//-------- загрузим для района --------------
  s:='_'+Copy(GlobalTask.ParamAsString('KOD'),1,4);
  l3:=fmMain.TemplateInterface.BuildMenu(Self.Name+s, TBSubmenuTmp, false, OnTemplateMenuClick);
//  if FSubType<>'' then begin
//    ll:=fmMain.TemplateInterface.BuildMenu(Self.Name+s+'_'+FSubType, TBSubmenuTmp, false, nil);
//    if not l3 then l3:=ll;
//  end;
//-------------------------------------------
  {$ENDIF}

  if l1 or l3 then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

procedure TfmSimple.OnTemplateMenuClick(Sender: TObject);
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
      fmMain.TemplateInterface.SetParams(fmMain.DateFiks,0,0);
      fmMain.TemplateInterface.SetSimpleTemplate(Template.FullName);
    end;
//         fmMain.TemplateInterface.SetTemplate(fmMain.TemplateInterface.TemplateDir+Template.TemplateFile,
//         fmMain.TemplateInterface.DefaultDatabaseName, fmMain.TemplateInterface.DefaultScript, Template)
  end;
{$ENDIF}
end;

procedure TfmSimple.dsDokumentDataChange(Sender: TObject; Field: TField);
var
  v : Variant;
begin
  if (Field<>nil) and (Dokument<>nil) then begin
    if not Dokument.IsReadDokument then begin
      CheckQueryExit:=true;
      QueryExit := true;
      RunProcScript(Dokument.GetVid+'_'+UpperCase(Field.FieldName),v);
    end;
  end;
end;

procedure TfmSimple.CheckMenuReport;
begin
  if GetNameReport='' then begin
    TBItemPreView.Enabled:=false;
    TBItemPrint.Enabled:=false;
  end else begin
    TBItemPreView.Enabled:=true;
    TBItemPrint.Enabled:=true;
  end;
end;

procedure TfmSimple.SetDokument(const Value: TdmDokument);
begin
  FDokument := Value;
  TBItemPreView.Visible:=true;
  TBItemPrint.Visible:=true;
  if Assigned(FOnSetDokument) then begin
    FOnSetDokument(Value);
  end;
end;

procedure TfmSimple.RunCalc;
Var
//  w1: Word;
  p1,p2: array[0..100] of Char;
begin
  StrPcopy(p1,'CALC');
  IF GetModuleHandle(p1)=0 THEN begin
    StrPcopy(p2,'Calc.exe');
//    w1:=WinExec(p2,SW_Restore);
    WinExec(p2,SW_Restore);
  end;

  {
  ShellExecute(0 ,                 //hWnd: HWND;
               'open',                //Operation,
               'calc.exe', //FileName,
               Nil,                //Parameters,
               Nil,                //Directory: PChar;
               0                   //ShowCmd: Integer
                    );             //: HINST; stdcall;
  }
end;

{
  if FDokument.EnableNDS or FDokument.EnableAccount or FDokument.EnableConnDok then begin
    if FDokument.MakeStdList then begin
    end;
  end;
}

procedure TfmSimple.TBItemCalcClick(Sender: TObject);
begin
  RunCalc;
end;

{
procedure TfmSimple.SetPrint;
var
 it : TTbItem;
 i : Integer;
begin
    if FOpisEdit.ListDetail.Count > 0 then begin
      EnableDetail := true;
      TBItemDetail.Clear;
      if FOpisEdit.ListDetail.Count=1 then begin
        TBItemDetail.Visible:=false;
        TBItemOneDetail.Caption := TOpisEdit(FOpisEdit.ListDetail.Items[0]).Caption;
        TBItemOneDetail.Visible:=true;
      end else begin
        TBItemDetail.Visible:=true;
        TBItemOneDetail.Visible:=false;
        TBItemDetail.DropdownCombo:=true;
        for i:=0 to FOpisEdit.ListDetail.Count-1 do begin
          it := TTbItem.Create(TBItemDetail);
          it.Name:='TBItemDetail_'+IntToStr(i);
          it.Caption:=TOpisEdit(FOpisEdit.ListDetail.Items[i]).Caption;
          it.OnClick:=OnRunEditDetail;
          it.ShortCut:=TextToShortCut('Ctrl+'+IntToStr(i+1));
          TBItemDetail.Add(it);
        end;
      end;
    end else begin
      EnableDetail := false;
    end;
  end else begin
    EnableDetail := false;
  end;
end;

procedure TfmSimple.OnRunEditDetail(Sender: TObject);
var
  n,i : Integer;
begin
  i:=Pos('_',TTbItem(Sender).Name);
  if i>0 then begin
    n := StrToInt(Copy(TTbItem(Sender).Name,i+1,20));
    FRunSetUp := true;
    FOpisEdit.EditDetail(n, DataSource);
    FRunSetUp := false;
  end;
end;
}

procedure TfmSimple.AddFieldsDopTable(nTypeObj:Integer);
var
//  tb : TkbmMemTable;
  sName, sRazdel : String;
  nDataType  : TFieldType;
  iSize     : Integer;
  bRequired : Boolean;
  fldDef : TFieldDef;
begin
  sRazdel := dmBase.SprRazdel.FieldByName('NOMER').AsString;
  dmBase.SprProperty.First;
  with dmBase.SprProperty do begin
//    tb := TkbmMemTable.Create(Dokument);
//    tb.Name := Dokument.Name + sRazdel;
    while not Eof do begin
      // если не константа
      if FieldByName('VID').AsString<>'3' then begin
        sName := FieldByName('KOD').AsString;
        nDataType := dmBase.StrTypeAsDataType( FieldByName('TIP').AsString );
        bRequired := false;
        iSize := 0;
        {TODO 1 : Сделать изменение значности}
        if nDataType = ftString then begin
          iSize := 30;
        end;
        fldDef := Dokument.tbDopProp.FieldDefs.AddFieldDef;
        fldDef.Name := sName;
        fldDef.DataType := nDataType;
        fldDef.Size := iSize;
        fldDef.Required := bRequired;
//        fldDef.DisplayName:=fldDef.DisplayName+'_TYPEOBJ_'+IntToStr(nTypeObj);
//        Dokument.tbDopProp.FieldDefs.Add(sName,nDataType,iSize,bRequired);
      end;
      Next;
    end;
//    tb.Open;
//    tb.Append;
//    tb.Post;
  end;
//  with TDataSource.Create(Self) do begin
//    Parent  := Self;
//    Name    := 'Razdel' + sRazdel;
//    DataSet := tb;
//  end;
end;

procedure TfmSimple.CreateDopControls( TypeObj : Integer; Control : TWinControl; strRazdel : String; MyColor:TColor;
                                       AddCreateControl:TEventCreateControl=nil );
var
  idRazdel : Integer;
  vKeyValues : Variant;
begin
  FCreateCont.OnGetProperty := GetProperty;
  FCreateCont.OnCreateControl := AddCreateControl;
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  vKeyValues[0] := TypeObj;
  vKeyValues[1] := StrToInt(strRazdel);
  if dmBase.SprRazdel.Locate('TYPEOBJ;NOMER', vKeyValues, []) then begin                                            
    idRazdel := dmBase.SprRazdel.FieldByName('ID').AsInteger;
    dmBase.SprProperty.IndexName := 'KEY_VIEW';
    dmBase.SprProperty.SetRange([TypeObj,idRazdel],[TypeObj,idRazdel]);
    try
      FCreateCont.Owner  := Self;
      FCreateCont.Parent := Control;
      FCreateCont.LabelColor := MyColor;
      AddFieldsDopTable(TypeObj);
      FCreateCont.CreateControls;
    finally
      dmBase.SprProperty.CancelRange;
    end;
  end;
  FCreateCont.OnGetProperty := nil;
  FCreateCont.OnCreateControl := nil;
end;


procedure TfmSimple.GetProperty( prop : TPropControl; lNext : Boolean );
var
  sss : String;
  sType, sVid, sOpisEdit : String;
  i : Integer;
//  ds : TDataSource;
begin
  if Prop = nil then begin
    dmBase.SprProperty.First;
  end else begin
    if lNext then begin
      dmBase.SprProperty.Next;
    end;
//    ds := dsDopProp; // TDataSource(FindComponent('Razdel'+IntToStr(dmBase.SprProperty.FieldByName('RAZDEL').AsInteger)));
    with dmBase.SprProperty do begin
      Prop.Eof := Eof;
      Prop.DataSource := GetdsDopProp;
      Prop.DataField  := FieldByName('KOD').AsString;
      Prop.Caption := FieldByName('FNAME').AsString;
      Prop.CaptionShort := FieldByName('NAME').AsString;
      Prop.AsLabel:=false;
      if Pos('[AS_LABEL]', Prop.CaptionShort) >0 then begin
        Prop.CaptionShort:=StringReplace(Prop.CaptionShort, '[AS_LABEL]', '', [rfReplaceAll,rfIgnoreCase]);
        Prop.AsLabel:=true;
      end;
      Prop.Visible := FieldByName('VISIBLE').AsBoolean;
      if Prop.Visible then begin
        Prop.Visible := GetParamVisible(Prop.DataField);
      end;
      Prop.Enabled := FieldByName('ENABLE').AsBoolean;
      Prop.EditMask:= FieldByName('EDITMASK').AsString;
      Prop.DisplayFormat:= FieldByName('DISPLAYFORMAT').AsString;
      if FieldByName('MINVALUE').AsString='' then Prop.MinValue:=-1 else  Prop.MinValue:= FieldByName('MINVALUE').AsInteger;
      if FieldByName('MAXVALUE').AsString='' then Prop.MaxValue:=-1 else  Prop.MaxValue:= FieldByName('MAXVALUE').AsInteger;
      sType     := FieldByName('TIP').AsString;
      sVid      := FieldByName('VID').AsString;
      sOpisEdit := FieldByName('OPISEDIT').AsString;
      Prop.PropType := tpString;
      if sVid = '2' then begin           // название значения
        Prop.PropType := tpCaption;
      end else if sVid = '3' then begin  // константа
        Prop.PropType := tpConst;
      end else begin
        if sOpisEdit<>'' then begin
          Prop.PropType := tpOpisEdit;
          Prop.NameOpisEdit := sOpisEdit;
        end else begin
          if sType = 'C' then begin
            Prop.PropType := tpString;
          end else if sType = 'I' then begin
            Prop.PropType := tpNumber;
          end else if sType = 'N' then begin
            Prop.PropType := tpNumber;
          end else if sType = 'L' then begin
            Prop.PropType := tpBoolean;
          end else if sType = 'D' then begin
            Prop.PropType := tpDate;
          end else if sType = 'M' then begin
            Prop.PropType := tpMemo;
          end;
        end;
      end;
      // !!! реквизиты с ед. изм. гектар, для насторойки автосуммирования земли !!!
      if FCheckAutoSum and Prop.Visible and not Prop.AsLabel and (Prop.PropType=tpNumber) and (FieldByName('EDIZM').AsString='059') then begin
        if FFieldsAutoSum_All.IndexOfName(Prop.DataField)=-1
          then FFieldsAutoSum_All.Add(Prop.DataField+'='+Prop.Caption);    // FFieldsAutoSum_My
      end;
      sss := FieldByName('WIDTH').AsString;
      i := Pos(';' , sss);
      try
        if i > 0 then begin
          Prop.PropWidth    := StrToInt(Copy(sss,1,i-1));
          Prop.PropWidthSpr := StrToInt(Copy(sss,i+1,30));
        end else begin
          if sss = '' then begin
            Prop.PropWidth    := 100;
          end else begin
            Prop.PropWidth    := StrToInt(sss);
          end;
          if Prop.PropWidth = 0 then Prop.PropWidth:=100;
          Prop.PropWidthSpr:=300;
        end;
        if not FieldByName('FONT_SIZE').IsNull and (FieldByName('FONT_SIZE').AsInteger>0) then begin
          Prop.FontSize := FieldByName('FONT_SIZE').AsInteger;
        end;
        if not FieldByName('FONT_BOLD').IsNull then begin
          Prop.FontBold := FieldByName('FONT_BOLD').AsBoolean;
        end;
        if not FieldByName('FONT_KURSIV').IsNull then begin
          Prop.FontItalic := FieldByName('FONT_KURSIV').AsBoolean;
        end;
        if not FieldByName('FONT_PODCH').IsNull then begin
          Prop.FontUnderline := FieldByName('FONT_PODCH').AsBoolean;
        end;
      except
        Prop.PropWidth    := 100;
        Prop.PropWidthSpr := 200;
      end;
    end;
  end;
end;

function TfmSimple.GetParamVisible(strKod: String): Boolean;
var
  s : String;
begin
  Result := true;
  // видимостью OCEN_GOD будет управлять V_OCEN_STOIM
  if strKod='OCEN_GOD' then strKod:='OCEN_STOIM';
  if Pos(strKod+';',FListRekvVisibleParam) > 0 then begin
    s := GlobalTask.ParamAsString('V_'+strKod);
    if (s<>'') and (s='0') then begin
      Result := false;
    end;
  end;
end;

procedure TfmSimple.SetActionForClose(const Value: TCloseAction);
begin
  FActionForClose := Value;
end;

procedure TfmSimple.GetStruDok;
var
  f  : TForm;
  i,j  : Integer;
  sl : TStringList;
  m  : TMemo;
  tb : TkbmMemTable;
  fld : TField;
  strType,strSize : String;
  lOpen : Boolean;
begin
  sl := TStringList.Create;
  if Dokument<>nil then begin
    for i:=0 to Dokument.ComponentCount-1 do begin
      if Dokument.Components[i] is TkbmMemTable then begin
        tb := TkbmMemTable(Dokument.Components[i]);
        lOpen := false;
        if not tb.Active then begin
          tb.Open;
          lOpen := true;
        end;
        sl.Add(StringOfChar('-',50));
        sl.Add('таблица: '+ tb.Name);
        sl.Add(' ');
        for j:=0 to tb.FieldCount-1 do begin
          fld := tb.Fields[j];
          FieldTypeToString(fld.DataType, strType);
          if fld.DataType = ftString then begin
            strSize := ', '+IntToStr(fld.Size);
          end else begin
            strSize := '';
          end;
          sl.Add('   '+ fld.FieldName + '     '+strType + strSize);
        end;
        if lOpen then tb.Close;
      end;
    end;
  end;
  if sl.Count > 0 then begin
    f := TForm.Create(nil);
    f.Left := 10;
    f.Top  := 10;
    f.Width  := 500;
    f.Height := 400;
    m := TMemo.Create(f);
    m.Parent := f;
    m.Align := alClient;
    for i:=0 to sl.Count-1 do begin
      m.Lines.Add( sl[i] );
    end;
    f.ShowModal;
    f.Free;
  end;
  sl.Free;
end;

procedure TfmSimple.SetCheckExit(const Value: Boolean);
begin
  FCheckExit := Value;
end;

procedure TfmSimple.AfterConstruction;
begin
  inherited;
  Visible := false;
end;

procedure TfmSimple.SetSkipDataSet(const Value: TDataSet);
begin
  FSkipDataSet := Value;
  if Value = nil then begin
    TBToolbarMove.Visible:=false;
//    TBItemFirst.Visible:=false;
//    TBItemPrev.Visible :=false;
//    TBItemNext.Visible :=false;
//    TBItemLast.Visible :=false;
//    TBItemNonQuery.Visible :=false;
  end else begin
    TBToolbarMove.Visible:=true;
//    TBItemFirst.Visible:=true;
//    TBItemPrev.Visible :=true;
//    TBItemNext.Visible :=true;
//    TBItemLast.Visible :=true;
//    TBItemNonQuery.Visible :=true;
  end;
end;

function TfmSimple.BeforeSkip : Boolean;
var
  n : Integer;
begin
  if not FEnableWrite or not FTmpWrite then begin
    Result:=true;
    exit;
  end;
  Dokument.PostDokument;
//  Dokument.mtDokument.CheckBrowseMode;
  // когда документ новый перемещаться нельзя
  if Dokument.mtDokumentID.AsInteger=-1 then begin
    Result := false;
  end else begin
    Result := true;
  end;
  if Result then begin
    if CheckExit then begin
      if QueryExit then begin
        CheckQueryExit:=true;
        if TBItemNonQuery.Checked then begin
          n := 1;
        end else begin
          n := QuestionPos(' Сохранить документ ? ',
            'Да;Нет; Продолжить ;','',-1,-1,qtConfirmation,Self);
          if n=3 then begin
            Result := false;
            exit;
          end;
        end;
        //-------------------------------------------------
        if n=1 then begin //Problem('    Сохранить документ ?    ') then begin
          if not Dokument.WriteDokument(self) then begin
            Result := false;
          end;
        end else begin
          QueryExit:=false;
        end;
      end;
    end else begin
      if not Dokument.PostDokument then begin
        Result := false;;
      end;
    end;
  end;
end;

procedure TfmSimple.AfterSkip;
var
  fld:TField;
begin
  EditDataSet(Dokument.mtDokument);
  Dokument.mtDokumentID.AsInteger := SkipDataSet.FieldByName('ID').AsInteger;
  PostDataSet(Dokument.mtDokument);
  DisableControls;
  fld:=SkipDataSet.FindField('DATE_FIKS');
  if (fld<>nil) and not fld.IsNull
    then Dokument.DateFiks:=fld.AsDateTime;
  Dokument.ReadDokument( Dokument.mtDokumentID.AsInteger );
  EnableControls;
  UserAfterSkip;
  QueryExit:=false;
  FTmpWrite:=FEnableWrite;
  CheckQueryExit:=false;
end;

procedure TfmSimple.TBItemFirstClick(Sender: TObject);
begin
  if SkipDataSet<>nil then begin
    if BeforeSkip then begin
      SkipDataSet.First;
      AfterSkip;
    end;
  end;
end;

procedure TfmSimple.TBItemPrevClick(Sender: TObject);
begin
  if SkipDataSet<>nil then begin
    if BeforeSkip then begin
      SkipDataSet.Prior;
      if not SkipDataSet.Bof then begin
        AfterSkip;
      end;
    end;
  end;
end;

procedure TfmSimple.TBItemNextClick(Sender: TObject);
begin
  if SkipDataSet<>nil then begin
    if BeforeSkip then begin
      SkipDataSet.Next;
      if not SkipDataSet.Eof then begin
        AfterSkip;
      end;
    end;
  end;
end;

procedure TfmSimple.TBItemLastClick(Sender: TObject);
begin
  if SkipDataSet<>nil then begin
    if BeforeSkip then begin
      SkipDataSet.Last;
      AfterSkip;
    end;
  end;                                                 
end;

procedure TfmSimple.TBItemDelListClick(Sender: TObject);
begin
  if ActiveControl is TDbGridEh then begin
    if (TDbGridEh(ActiveControl).DataSource.DataSet.State=dsBrowse) and
       not TDbGridEh(ActiveControl).DataSource.DataSet.IsEmpty then begin
//    if TDbGridEh(ActiveControl).DataSource.DataSet.RecordCount>0
//       not TDbGridEh(ActiveControl).DataSource.DataSet.Bof then begin
      if Problem(' Удалить запись ? ',mtConfirmation,self) then begin
        TDbGridEh(ActiveControl).DataSource.DataSet.Delete;
        CheckQueryExit:=true;
        QueryExit := true;
      end;
    end;
  end;
end;

procedure TfmSimple.UserAfterSkip;
begin
//
end;

procedure TfmSimple.DisableControls;
var
  i : Integer;
begin
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TDataSource then begin
      if TDataSource(Components[i]).DataSet <> nil then begin
        TDataSource(Components[i]).DataSet.DisableControls;
      end;
    end;
  end;
end;

procedure TfmSimple.EnableControls;
var
  i : Integer;
begin
  for i:=0 to ComponentCount-1 do begin
    if Components[i] is TDataSource then begin
      if TDataSource(Components[i]).DataSet <> nil then begin
        TDataSource(Components[i]).DataSet.EnableControls;
      end;
    end;
  end;
end;

procedure TfmSimple.TBItemPreViewClick(Sender: TObject);
var
  strReport : String;
begin
  strReport := GetNameReport;
  if strReport<>'' then begin
    if BeforeReport then begin
      try
        GlobalTask.PreViewReport(strReport);
      finally
        AfterReport;
      end;
    end;
  end;
end;

procedure TfmSimple.TBItemPrintClick(Sender: TObject);
var
  strReport : String;
begin
  strReport := GetNameReport;
  if strReport<>'' then begin
    if BeforeReport then begin
      try
        GlobalTask.PrintReport(strReport);
      finally
        AfterReport;
      end;
    end;
  end;
end;

procedure TfmSimple.AfterReport;
begin
//
end;

function TfmSimple.BeforeReport: Boolean;
begin
  Result := true;
end;

procedure TfmSimple.CreateEditPriznak(wc: TWinControl; ds: TDataSource; strOpis: String; strFieldName : String);
var
  p : TPanel;
  gr : TDbGridEh;
  c : TColumnEh;
begin
  p := TPanel.Create(wc);
  with p do begin
    TabStop := false;
    Parent := wc;
    Width  := 27;
    Align  := alRight;
    BevelOuter := bvNone;
  end;
  with TSpeedButton.Create(wc) do begin
    Parent  := p;
    TabStop := false;
    Left    := 2;
    Width   := 24;
    Height  := 24;
    OnClick := OnClickAddPriznak;
    fmMain.ImageList.GetBitmap(IL_ADD_MEN,Glyph);
    Hint := 'Новое значение';
    Flat := true;
  end;
  with TSpeedButton.Create(wc) do begin
    TabStop := false;
    Parent  := p;
    Top := 28;
    Left    := 2;
    Width   := 24;
    Height  := 24;
    OnClick := OnClickDelPriznak;
    fmMain.ImageList.GetBitmap(IL_DEL_MEN,Glyph);
    Hint := 'Удалить значение';
    Flat := true;
  end;
  gr := TDbGridEh.Create(wc);
  gr.TabStop := false;
  gr.Columns.Clear;
  c := gr.Columns.Add;
  c.FieldName := strFieldName;
  c.Title.Caption := strOpis;
//  c.OnGetCellParams
  with gr do begin
    Flat := true;
    ParentFont := false;
    Parent := wc;
    Width  := 200;
    Align  := alClient;
    DataSource := ds;
    ReadOnly   := true;
    try
      Options := Options - [dgTitles];
    except
    end;
    try
      Options := Options + [dgAlwaysShowSelection];
    except
    end;
  end;
end;

procedure TfmSimple.OnClickAddPriznak(Sender: TObject);
var
  wc : TWinControl;
  i : Integer;
  strOpis : String;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ds : TDataSet;
begin
  strOpis := '';
  ds := nil;
  wc := TWinControl(Sender).Parent.Parent;
  for i:=0 to wc.ControlCount-1 do begin
    if wc.Controls[i] is TDbGridEh then begin
      strOpis := TDbGridEh(wc.Controls[i]).Columns[0].Title.Caption;
      ds := TDbGridEh(wc.Controls[i]).DataSource.DataSet;
    end;
  end;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA(strOpis);
  if Opis<>nil then begin
    v := null;
    if Opis.ChoiceFromSprEx(nil, v, arrrec, nil) and (v<>null) then begin
      if ds.Locate('KOD',v,[]) then begin
        ShowMessage('  Значение уже существует !  ');
      end else begin
        ds.Append;
        ds.FieldByName('KOD').Value := v;
        ds.Post;
      end;
    end;
  end;
end;

procedure TfmSimple.OnClickDelPriznak(Sender: TObject);
var
  wc : TWinControl;
  ds : TDataSet;
  i : Integer;
begin
  ds := nil;
  wc := TWinControl(Sender).Parent.Parent;
  for i:=0 to wc.ControlCount-1 do begin
    if wc.Controls[i] is TDbGridEh then begin
      ds := TDbGridEh(wc.Controls[i]).DataSource.DataSet;
    end;
  end;
  if not ds.IsEmpty then begin
    if Problem(' Удалить текущую запись ? ',mtConfirmation,self) then begin
      CheckQueryExit:=true;
      QueryExit := true;
      ds.Delete;
    end;
  end;
end;

procedure TfmSimple.ChoiceFromLookupSpr( strNameOpis : String; strFieldName : String; lString : Boolean; ds:TDataSet);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
begin
  SetLength(arrRec,1);
  v := null;
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA(strNameOpis);
  finally
    Screen.Cursor := old;
  end;
  if Opis <> nil then begin
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      if v <> null then begin
        if ds=nil then begin
          EditDataSet(Dokument.mtDokument);
          if lString
           then Dokument.mtDokument.FieldByName(strFieldName).AsString  := v
           else Dokument.mtDokument.FieldByName(strFieldName).AsInteger := v;
        end else begin
          EditDataSet(ds);
          if lString
           then ds.FieldByName(strFieldName).AsString  := v
           else ds.FieldByName(strFieldName).AsInteger := v;
        end;
      end;
      Screen.Cursor := old;
    end;
  end;
end;

procedure TfmSimple.SetOnSetDokument(const Value: TNotifyEvent);
begin
  FOnSetDokument := Value;
end;

//-------------------------------------------------------------
function TfmSimple.GetParam(sParam,sDefault: String): String;
begin
  Result:=sDefault;
  if (FPar<>nil) and (FPar.Count>0) then begin
    Result:=FPar.Values[sParam];
    if Result=''
      then Result:=sDefault;
  end;
end;

//-------------------------------------------------------------
function TfmSimple.RunReport: Integer;
var
  sNameReport,sType,sIDMen,sDS,sOne,sAll:String;
  lAll,l:Boolean;
  ds:TDataSet;
  {$IFDEF USE_TEMPLATE}
  Template:TTemplate;
  {$ENDIF}
begin
  Result:=0;
  if GetParam('ALL','0')='1'
    then lAll:=true
    else lAll:=false;
  sOne:=ANSIUpperCase(Trim(GetParam('NAME_REPORT','')));
  sAll:=ANSIUpperCase(Trim(GetParam('NAME_REPORT_ALL','')));
  if lAll and (sAll<>'')
    then sNameReport:=sAll
    else sNameReport:=sOne;
  if (Right(sNameReport,4)='.FR3') or (Right(sNameReport,4)='.FRF') then begin
    sType:='FR';
  end else begin
    sType:=GetParam('TYPE_REPORT','DOC');
  end;
  sDS:=GetParam('DATASET','');
  if sNameReport<>'' then begin
    if sDS<>''
      then ds:=TDataSet(StrToInt(sDS))
      else ds:=nil;
    if (sDS<>'') and (sType='FR') then begin
      RunReportSkip(sNameReport,ds);
    end else begin
      sIDMen:=GetParam('ID_MEN','');
      {$IFDEF ADD_MENS_PU}
      if sIDMen<>'' then begin
        if Dokument is TdmLichSchet then begin
          TdmLichSchet(Dokument).dmMens.mtDokument.Locate('ID',sIDMen,[])
        end else if Dokument is TdmAdres then begin
          TdmAdres(Dokument).dmMens.mtDokument.Locate('ID',sIDMen,[])
        end;
      end;
      {$ENDIF}
      if sType='DOC' then begin    // Template
        {$IFDEF USE_TEMPLATE}
        Template:=fmMain.TemplateInterface.GetTemplate(sNameReport);
        {$ELSE}
        Template:=nil;
        {$ENDIF}
        if Template=nil then begin
          Result:=-1;
        end else begin
          l:=false;
          if ds<>nil then begin
            l:=dbDisableControls(ds);
          end;                         
          fmMain.OnTemplateMenuClick(Template);
          if l then begin
            dbEnableControls(ds,l);
          end;
          Result:=1;
        end;
      end else begin                                 // FastReport
        if (Copy(sNameReport,1,1)<>'&') and ((Right(sNameReport,4)='.FR3') or (Right(sNameReport,4)='.FRF')) then begin
          sNameReport:='&'+sNameReport;
        end;
        GlobalTask.PreViewReport(sNameReport);
      end;
    end;
  end;
end;

//-------------------------------------------------------------
function TfmSimple.RunReportSkip(sNameReport:String; ds : TDataSet): Integer;
var
  sIDMen,cReport:String;
  lOk,lClear:Boolean;
begin
  Result:=0;
  if (ds<>nil) and (sNameReport<>'') then begin
    if (Copy(sNameReport,1,1)<>'&') and ((Right(sNameReport,4)='.FR3') or (Right(sNameReport,4)='.FRF')) then begin
      sNameReport:='&'+sNameReport;
    end;
    ds.First;
    sNameReport:=ReportTask.RunReportEx_Init(0, sNameReport, fmMain.frxReport, GlobalTask.Script);
//    OpenMessage('Формирование отчета ...       ','');
    OpenMessageEx('Формирование отчета ...       ','Подождите пожалуйста',10,'  Прервать  ');
//    Application.OnMessage:=AppMessage;
//    FCancelProcess:=false;
    lClear:=true;
    try
      repeat
        ChangeMessage('Формирование отчета  '+IntToStr(Result+1));
        Dokument.ReadDokument( ds.FieldByName('ID').AsInteger );
        lOk:=ReportTask.RunReportEx_Print(lClear, sNameReport, fmMain.frxReport);
        lClear:=false;
        ds.Next;
        Dokument.ReadDokument( ds.FieldByName('ID').AsInteger );
        Inc(Result,1);
        if GetResultMessage=0 then begin // нажата кнопка "Прервать"   FCancelProcess then begin
          break;
        end;
      until ds.Eof;
    finally
//      FCancelProcess:=false;
//      Application.OnMessage:=nil;
      CloseMessage;
      ReportTask.RunReportEx_Result(fmMain.frxReport);
    end;
  end;
end;
//-------------------------------------------------------------
procedure TfmSimple.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.message = WM_CHAR then begin
    if Msg.wParam=VK_ESCAPE then
      FCancelProcess:=true;
//      WriteToDebug(['1111']);
  end;
end;
//-------------------------------------------------------------
procedure TfmSimple.AssignPar(slPar: TStringList);
begin
  FPar.Clear;
  if (slPar<>nil) and (slPar.Count>0) then begin
    FPar.Assign(slPar);
  end;
end;

//-------------------------------------------------------------
// исп-ся при открытии формы только для получения отчета
function TfmSimple.IsShowEdit: Boolean;
begin
  Result:=true;
  if (GetParam('RUN_REPORT','0')='1') then begin    // если открываем для получения отчета
    if (GetParam('EDIT_AFTER_REPORT','0')='1') then begin // открыть форму после отчета

    end else begin
      Result:=false;
    end;
  end;
end;

//-------------------------------------------------------------------------------------------------
//---------   ИСТОРИЯ   (НАЧАЛО)
//-------------------------------------------------------------------------------------------------
procedure TfmSimple.CheckControlHist;
var
  i : Integer;
  c :TColor;
begin
  for i:=0 to FHistFields.Count-1 do begin
    if FHistFields.Objects[i] is TDbEditEh then begin
      c:=TDbEditEh(FHistFields.Objects[i]).Color;
    end else begin
      c:=-1;
    end;
//    c:=-1; //TColor(GetPropValue(TComponent(FHistFields.Objects[i]),'Color'));
    if Dokument.tbHistory.Locate('FIELDNAME', FHistFields.Strings[i], [loCaseInsensitive]) then begin
      if c<>COLOR_HIST then
        SetPropertyObject( TComponent(FHistFields.Objects[i]), 'Color', COLOR_HIST);
    end else begin
      if c<>COLOR_NORM then
        SetPropertyObject( TComponent(FHistFields.Objects[i]), 'Color', COLOR_NORM);
    end;
  end;
end;
//-------------------------------------------------------------------------------------------------
function TfmSimple.EnableHistoryField(strFieldName: String): Boolean;
var
  s : String;
  i : Integer;
begin
  Result := false;
  strFieldName:=UpperCase(strFieldName);
  for i:=0 to FHistFields.Count-1 do begin
    if FHistFields.Strings[i]=strFieldName then begin
      Result := true;
      break;
    end;
  end;
end;

//-------------------------------------------------------------------------------------------------
procedure TfmSimple.LoadHistFields;
var
  s,sFieldName : String;
  i : Integer;
  c:TControl;
begin
  FHistFields.Clear;
  if Dokument.FMainTable<>nil then begin
    s := Dokument.FMainTable.TableName;
    i := Pos('.',s);
    if i=0 then s := Dokument.FMainTable.TableName
           else s := Copy(Dokument.FMainTable.TableName,1,i-1);
    fmMain.mtTablesFields.IndexFieldNames:='TableName;FieldName';
    fmMain.mtTablesFields.SetRange([s],[s]);
    fmMain.mtTablesFields.First;
    while not fmMain.mtTablesFields.Eof do begin
      if fmMain.mtTablesFieldsEnableH.AsBoolean=true then begin
        sFieldName:=UpperCase(fmMain.mtTablesFieldsFieldName.AsString);
        for i:=0 to ComponentCount-1 do begin
          if Components[i] is TCustomDbEditEh then begin
            if UpperCase(TCustomDbEditEh(Components[i]).DataField)=sFieldName then begin
              FHistFields.AddObject(sFieldName, Components[i]);
              break;
            end;
          end;
        end;
      end;
      fmMain.mtTablesFields.Next;
    end;
    fmMain.mtTablesFields.CancelRange;
  end;
  if FHistFields.Count>0 then begin
    TBItemAddHist.Visible:=true;
    TBItemHist.Visible:=true;
  end;
end;
//-------------------------------------------------------------------------------------------------
function TfmSimple.FieldAddHist(fld : TField; ActControl : TWinControl; var strErr : String) : Boolean;
var
  s,ss,sAddB,sAddE,sAdd : String;
  i : Integer;
  aw : TWinControl;
  ac : TAddControl;
  dtIzm : TDateTime;
begin
  Result := false;
  if fld.IsNull then begin
    strErr := ' Пустое значение нельзя помещать в историю ! ';
    exit;
  end;
  dtIzm:=dmBase.getCurDate;
  if Dokument.tbHistory.Locate('FIELDNAME;DATEIZM', VarArrayOf([fld.FieldName,dtIzm]), [loCaseInsensitive]) then begin
    Dokument.tbHistory.Edit;
  end else begin
    Dokument.tbHistory.Append;
  end;
  case fld.DataType of
    ftDate : begin
               s  := DTOS(fld.AsDateTime,tdAds);
               ss := DatePropis(fld.AsDateTime,1);
             end;
    ftTime : begin
               s  := FormatDateTime('HH:NN:SS',fld.AsDateTime);
               ss := FormatDateTime('HH часов NN минут',fld.AsDateTime);
             end;
  else
    s  := fld.AsString;
    ss := s;
    sAddB:='';
    sAddE:='';
    sAdd:='';
    //---------- если прикреплен еще один контрол ------------------
    if ActControl.Tag>0 then begin
      if TObject(ActControl.Tag) is TAddControl then begin
        ac := TAddControl(Pointer(ActControl.Tag));
        if ac.EControl=nil then begin
          if ac.FirstWord then sAddB:=' '+ac.ConstStr  else sAddE:=' '+ac.ConstStr;
        end else begin
          aw := TWinControl(ac.EControl);
          if (aw is TDBLookupComboboxEh ) then begin
            sAdd := TDBLookupComboboxEh(aw).Text+' ';
    //         if TDbLookupComboboxEh(aw).ListSource.DataSet.Locate(TDBLookupComboboxEh(aw).KeyField, TDBLookupComboboxEh(aw).Field.AsString , [])
    //          then sAdd := TDBLookupComboboxEh(aw).ListSource.DataSet.FieldByName(TDBLookupComboboxEh(aw).ListField).AsString;
          end else if (aw is TDBCheckBoxEh ) then begin
            // поле "область(край)"
            if not (aw as TDBCheckBoxEh).Field.IsNull and (Pos('OBL',(aw as TDBCheckBoxEh).DataField) > 0) then begin
              if (aw as TDBCheckBoxEh).Checked
                then sAdd:=' '+ac.ValueTrue
                else sAdd:=' '+ac.ValueFalse;
            end;
          end;
          if ac.FirstWord then sAddB:=sAdd else sAddE:=sAdd;
        end;
      end;
    end;
    //--------------------------------------------------------------
    if (ActControl is TDBLookupComboboxEh ) then begin
      if TDbLookupComboboxEh(ActControl).ListSource.DataSet.Locate(TDBLookupComboboxEh(ActControl).KeyField, s, [])
        then ss := TDBLookupComboboxEh(ActControl).ListSource.DataSet.FieldByName(TDBLookupComboboxEh(ActControl).ListField).AsString;
    end else if (ActControl is TDBComboBoxEh ) then begin
      i := TDBComboBoxEh(ActControl).KeyItems.IndexOf(s);
      if i > -1 then ss := TDBComboBoxEh(ActControl).Items.Strings[i];
    end;
  end;
  Dokument.tbHistoryFieldName.AsString := UpperCase(fld.FieldName);
  Dokument.tbHistoryValue.AsString := s;
  Dokument.tbHistoryStringValue.AsString := sAddB+ss+sAddE; // ss;
  Dokument.tbHistoryDateIzm.AsDateTime := dtIzm; //GlobalTask.CurrentDate;
  Dokument.tbHistory.Post;
  SetPropertyObject( ActControl, 'Color', COLOR_HIST);
  QueryExit:=true;
  Result := true;
end;

//--------------------------------------------------------------------------
procedure TfmSimple.TBItemAddHistClick(Sender: TObject);
var
  strErr : String;
  fld : TField;
begin
  if Dokument.tbHistory.Active and (ActiveControl is TCustomDbEditEh) then begin
    fld := TCustomDbEditEh(ActiveControl).Field;
    fld.DataSet.CheckBrowseMode;
    if EnableHistoryField(fld.FieldName) then begin
      if fld.IsNull or (fld.AsString='') then begin
        PutError(' Пустое значение нельзя помещать в историю ! ',self);
        exit;
      end;
      if FieldAddHist(fld, ActiveControl, strErr) then begin
        ShowMessage(' Значение добавлено в историю. ');
      end;
    end else begin
      Beep;
      ShowMessage(' Для текущего реквизита история не поддерживается ! ');
    end;
  end;
end;

//--------------------------------------------------------------------------
procedure TfmSimple.TBItemHistClick(Sender: TObject);
var
  fld : TField;
begin
  if ActiveControl is TCustomDbEditEh then begin
    fld := TCustomDbEditEh(ActiveControl).Field;
    {$IFNDEF ZAGS}
    if EnableHistoryField(fld.FieldName) then begin
      {$IFDEF ADD_MENS_PU}
      ShowHistDok( Self,TCustomDbEditEh(ActiveControl) );
      {$ENDIF}
    end;
    {$ENDIF}
  end;
end;
//-------------------------------------------------------------------------------------------------
//---------   ИСТОРИЯ   (КОНЕЦ)
//-------------------------------------------------------------------------------------------------

procedure TfmSimple.SetMRUList(ed: TDbEditEh; nLimit, nType: Integer; lAll, lReload, lBel, lAddButton, lPunktFromSpr: Boolean);
var
  bt : TEditButtonEh;
begin
  if (nType=3) and lPunktFromSpr then begin  // загружать населенные путкты из спраочника нас. пунктов
    ed.MRUList.Items:=GetMRUName_Punkt(lBel,lReload);
  end else begin
    ed.MRUList.Items:=GetMRUName(nType,lAll,lReload,lBel);
  end;
  if ed.MRUList.Items.Count>0 then begin
    ed.MRUList.Rows:=15;
    ed.MRUList.Active:=true;
    ed.MRUList.AutoAdd:=false;
    if nLimit>0 then  ed.MRUList.Limit:=nLimit;
    if lAddButton then begin
      bt := ed.EditButtons.Add;
      bt.OnClick := MRUListOpen;
      bt.Visible := true;
    end;
  end;
end;

procedure TfmSimple.MRUListOpen(Sender: TObject; var Handled: Boolean);
begin
  if Sender is TDbEditEh then begin
    if not TDbEditEh(Sender).MRUList.DroppedDown
      then TDbEditEh(Sender).MRUList.DropDown
      else TDbEditEh(Sender).MRUList.CloseUp(false);
  end else begin
    if not TDbEditEh(TControl(Sender).Parent).MRUList.DroppedDown
      then TDbEditEh(TControl(Sender).Parent).MRUList.DropDown
      else TDbEditEh(TControl(Sender).Parent).MRUList.CloseUp(false);
  end;
end;

procedure TfmSimple.ActiveControlChanged(Sender: TObject);
var
  lOk:Boolean;
  kb:LongWord;
begin
  lOk:=false;
  if (Screen.ActiveForm is TfmSimple) and (Screen.ActiveForm.ActiveControl<>nil) then begin
    if (ActiveControl is TCustomDbEditEh) then begin
      if EnableHistoryField(TCustomDbEditEh(ActiveControl).DataField) then begin
        lOk:=true;
      end;
    end;
    if FCheckKeyboard then begin
      kb:=GetTypeKeyBoard;
      if Copy(Screen.ActiveForm.ActiveControl.Name,1,4)='BLR_' then begin
        if kb<>BLR_LCID then ActivateBLRKeyboard;
      end else if Copy(Screen.ActiveForm.ActiveControl.Name,1,4)='ENG_' then begin
        if kb<>ENG_LCID then ActivateENGKeyboard;
      end else begin
        if kb<>RUS_LCID then ActivateRUSKeyboard;
      end;
    end;
    TBItemAddHist.Enabled:=lOk;
    TBItemHist.Enabled:=lOk;
  end;
end;

//------------------------------------------------------------------
procedure TfmSimple.SetUpdateDate;
var
  i,j  : Integer;                          
begin
  for i:=0 to ComponentCount-1 do begin
    if (Components[i] is TDbDateTimeEditEh) then begin
      for j:=0 to Length(FArrErrorDate)-1 do begin
        if SameText(TDbDateTimeEditEh(Components[i]).DataField, FArrErrorDate[j].FFieldName) then begin
          TDbDateTimeEditEh(Components[i]).OnUpdateData:=UpdateDateControl;
        end;
      end;          
    end;
  end;
end;
//--------------------------------------------------------------------------------------------
procedure TfmSimple.SetErrorDateControl(n:Integer; sField:String; nType:Integer; nVal1:Integer; nVal2:Integer);
begin
  FArrErrorDate[n].FFieldName:=sField;
  FArrErrorDate[n].FType:=nType;
  FArrErrorDate[n].FVal1:=nVal1;
  FArrErrorDate[n].FVal2:=nVal2;
end;

//--------------------------------------------------------------------------------------------
procedure TfmSimple.UpdateDateControl(Sender: TObject; var Handled: Boolean);
var
  i:Integer;
begin
  if not FRun and (Length(FArrErrorDate)>0) then begin
    for i:=0 to Length(FArrErrorDate)-1 do begin
      if SameText(TDbDateTimeEditEh(Sender).Field.FieldName, FArrErrorDate[i].FFieldName) then begin
        CheckErrorDate(TDbDateTimeEditEh(Sender).Value, FArrErrorDate[i].FType , FArrErrorDate[i].FVal1, FArrErrorDate[i].FVal2);
      end;
    end;
  end;
end;

end.
