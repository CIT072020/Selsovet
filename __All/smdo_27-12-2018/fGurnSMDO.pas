unit fGurnSMDO;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils, uTypes, uSMDO, uUtilFiles, ShellAPI, Types,
  TasksEx, AsyncCalls,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, fmChList, uProject, fInitField,
  TB2Item, TB2Dock, TB2Toolbar, StdCtrls, Mask, DBCtrlsEh, TB2ToolWindow, FuncPr, fParamQuest, mPermit, fmDosFileView,
  DbFunc, vchDBCtrls, PrnDbgeh, Menus, metatask, SasaIniFile, ImgList, Variants, OpisEdit, fWarning, uProjectAll,
  fMsgList, fEditMemo,
  ComCtrls, ExtCtrls, Animate, GIFCtrl, ZipForge;

type
  TfmGurnSMDO = class(TfmGurnal)
    TBToolWindow1: TTBToolWindow;
    edSeek: TDBEditEh;
    TBItemEditLic: TTBItem;
    Label2: TLabel;
    cbMailType: TComboBox;                           
    cbMsgType: TComboBox;
    Label3: TLabel;
    edTypeSeek: TComboBox;
    TBItemLgot: TTBItem;
    TBItemPrizn: TTBItem;
    Label1: TLabel;
    cbDocStatus: TComboBox;
    ImageListEx: TImageList;
    pnInfo: TPanel;
    gbInfo: TGroupBox;
    vchDBText1: TvchDBText;
    tbSMDOPost: TAdsTable;
    miXmltoSMDO: TMenuItem;
    OpenDialog: TOpenDialog;
    miEMLtoSMDO: TMenuItem;
    TBItemReceive: TTBItem;
    TBItemSend: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    Timer: TTimer;
    GIFAnimator: TRxGIFAnimator;
    Zip: TZipForge;
    miDokOk: TMenuItem;
    GridUvd: TDBGridEh;
    dsUvd: TDataSource;
    PopupMenu2: TPopupMenu;
    mDelUvd: TMenuItem;
    miClearSend: TMenuItem;
    N3: TMenuItem;
    TBItemLog: TTBItem;
    mLog: TMemo;
    TBSubmenuReceive: TTBSubmenuItem;
    TBItemReceiveOne: TTBItem;
    TBItemMsgList: TTBItem;
    TBSubmenuMailing: TTBSubmenuItem;
    TBItemMailing1: TTBItem;
    TBItemMailing2: TTBItem;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemAddClick(Sender: TObject);
    procedure cbMailTypeChange(Sender: TObject);
    procedure cbMsgTypeChange(Sender: TObject);
    procedure TBItemTypeMensClick(Sender: TObject);
    procedure TBItemAddNewMenClick(Sender: TObject);
    procedure Fgu(Sender: TObject;   var Handled: Boolean);
    procedure edSeekKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edSeekEditButtonsBeginClick(Sender: TObject;  var Handled: Boolean);
    procedure TBSubmenuSourceClick(Sender: TObject);
    procedure TBItemClearSourceClick(Sender: TObject);
    procedure TBItemMySourceClick(Sender: TObject);
    procedure edSeekExit(Sender: TObject);
    procedure edSeekEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure edSeekChange(Sender: TObject);
    procedure cbDocStatusChange(Sender: TObject);
    procedure cbMailTypeDrawItem(Control: TWinControl; Index: Integer;   Rect: TRect; State: TOwnerDrawState);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure vchDBText1GetText(Sender: TObject; var Text: String);
    procedure TBItemAddDokClick(Sender: TObject);
    procedure miXmltoSMDOClick(Sender: TObject);
    procedure miEMLtoSMDOClick(Sender: TObject);
    procedure TBItemReceiveClick(Sender: TObject);
    procedure TBItemSendClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miDelETSP(Sender: TObject);
    procedure GridUvdColumns1GetCellParams(Sender: TObject;      EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridUvdColumns2GetCellParams(Sender: TObject;      EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridUvdGetCellParams(Sender: TObject; Column: TColumnEh;    AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure mDelUvdClick(Sender: TObject);
    procedure GridUvdDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure miClearSendClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure TBItemLogClick(Sender: TObject);
    procedure TBSubmenuReceiveClick(Sender: TObject);
    procedure TBItemReceiveOneClick(Sender: TObject);
    procedure TBItemMsgListClick(Sender: TObject);
    procedure TBSubmenuMailingClick(Sender: TObject);
    procedure TBItemMailing1Click(Sender: TObject);
    procedure TBItemMailing2Click(Sender: TObject);
  private
    { Private declarations }
  public
    TBItemPereof: TTBItem;
    TBItemRazdel: TTBItem;
    TBItemSetVozrast : TTbItem;
    FThreadW:THandle;

    FVisibleLgot:Boolean;
    FVisibleSobstv:Boolean;
    FVisibleListMens:Boolean;
    FAddOtnosh:Boolean;
    FAddDateR:Boolean;
    FAddPasp:Boolean;
    FAddBTI:Boolean;
    FRunTimer:Boolean;
    FRunPost:Integer;
    FMailType : Integer;   // все 1-входящие 2-исходящие  SUBJ_TYPE
    FMsgType  : Integer;   // все 0-уведомления 1-осн. документ 2-доп. к осн. док 3-док.ответа 4-доп. к док ответа
    FDocstatus:Integer;    // 0-принят к обрабртке 1-зарегистрирован 2-не подлежит рег. 3-ошибочный
//    FVklMens  : Boolean;

    constructor Create(Owner : TComponent); override;
//    function LoadQuery : Boolean; override;
    function InitGurnal : Boolean; override;

    function  GetTypeEditObj: Integer; override;
    function  BeforeEdit: Boolean; override;
    procedure LoadFromIni; override;
    procedure SaveToIni; override;
    function  InitFilter( var strErr : String ) : Boolean; override;
    procedure AddUpdateActions; override;

    procedure Event_VklMens(Sender: TObject);

    procedure Event_InitFields(Sender: TObject);
    procedure Event_ClearSend(Sender: TObject);
    procedure Event_CreateArxivEML(Sender: TObject);
    procedure Event_OpenXML(Sender: TObject);
    procedure Event_CheckETSP(Sender: TObject);
    procedure Event_ViewLog(Sender: TObject);
    procedure Event_ViewMsgList(Sender: TObject);
    procedure Event_CreateCopyDok(Sender: TObject);
    procedure Event_RunRefreshCOC(Sender: TObject);

    procedure Event_CheckPropertyGridColumns(Sender:TObject);
    procedure GridColumnsSubjType(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
    procedure GridColumnsMsgType(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
    procedure GridColumnsDocStatus(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
    procedure GridColumnsText(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);

    procedure Refresh(lFull : Boolean=false; ID:String=''); override;
    procedure FullRefresh(lReopen:Boolean=false; strOrderBy:String=''; ID:String=''); override;

    procedure SetListParEditForm; override;
    procedure SetQueryParam(p : TParam); override;
    function GetPropertyDef(sName: String; var vVal:Variant): Boolean; override;

    function getAdditiveWhere : String; override;
    function  getDefaultAddWhere: String; override;
    procedure ClearSeek;

    function  CheckDelete(var strErr : string; var lQuest:Boolean; arr:TArrStrings=nil) : Boolean; override;
    procedure BeforeReport; override;
    procedure ParamsGridForAck(ds:TDataSet; Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);

    function CheckValueFilter(nType:Integer;strFilter:String; var s1,s2:String):Boolean;
    function getIDForTmpTable(nType:Integer;strFilter:String):Boolean;
    function getIDForFilter(nType:Integer;strFilter:String):String;
    function  getAdditiveFilter:String; override;
    function  setAdditiveFilter:Boolean; override;
    procedure RunTest; override;
    procedure ArxivEML(sFile:String; sGUID:String; nSubjType:Integer);
    function getNameProcess:String;
    procedure AddToMemoLog(d:TDateTime);
    procedure UpdateGbInfo;
    procedure ReceiveMailClick(Sender: TObject; nPost:Integer);
    procedure CreateMailing(nType:Integer);

  end;

const
  TYPESEEK_FIO=0;
  TYPESEEK_FIO_SS=1;
  TYPESEEK_IN=2;
  TYPESEEK_DELO=3;
  TYPESEEK_LASTRESH=4;
  TYPESEEK_BTI=5;
  TYPESEEK_VOZR=6;

var
  fmGurnSMDO: TfmGurnSMDO;

implementation

uses fMain, dBase, fChoiceNasel, fSMDODoc;

{$R *.DFM}

{ TfmGurnSMDO }


constructor TfmGurnSMDO.Create(Owner: TComponent);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  TypeEditObj := _TypeObj_SMDOPost;
  inherited;
  FBookmarkDel:=true; // доступно удаление отмеченных записей
  FEnableAll:=true;
  StBar.Visible:=true;
  TBItemRazdel:=nil;
  TBItemPereof:=nil;

//  TBItemGrantSprav.Visible:=true;

  FMailType:=0;
//  FMsgType:=0;
  FMsgType:=2;
  cbMsgType.ItemIndex:=FMsgType;

  FDocstatus:=0;
  FRun:=true;
  cbMailType.ItemIndex:=0;
//  cbMsgType.ItemIndex:=0;
  FRun:=false;
  cbDocStatus.ItemIndex:=0;
  QuestDel := '  Удалить сообщение ?  ';
  QuestDelFlt := '  Удалить отобранные сообщения ?  ';
  miXmltoSMDO.Visible:=Role.SystemAdmin;
  miEmltoSMDO.Visible:=Role.SystemAdmin;
  miClearSend.Visible:=Role.SystemAdmin;       
  miDokOk.Visible:=Role.SystemAdmin;
  TBSubmenuMailing.Visible:=Role.SystemAdmin;
  if not Role.SystemAdmin then begin
//    TBItemReceive.Visible:=
    TBSubmenuReceive.Visible:=SMDO.FPostEnabled;
    TBItemSend.Visible:=SMDO.FPostEnabled;
  end;

end;            
//---------------------------------------------------------------------------------
function TfmGurnSMDO.GetTypeEditObj: Integer;
begin
  Result:=0;
  if Query.Active then begin
    Result:=_TypeObj_SMDOPost
//    if Query.FieldByName('MSG_TYPE').AsInteger=MSG_TYPE_A
//      then Result:=_TypeObj_SMDOPostUvd
//      else Result:=_TypeObj_SMDOPostDoc;
  end;
end;
//---------------------------------------------------------------------------------
function TfmGurnSMDO.BeforeEdit: Boolean;
begin
  if Query.FieldByName('MSG_TYPE').AsInteger=MSG_TYPE_A then begin
    Result:=false;
    ShowMessage('Уведомление не подлежит корректировке.');
  end else begin
    Result:=true;
  end;
end;
//---------------------------------------------------------------------------------
function TfmGurnSMDO.InitFilter(var strErr: String): Boolean;
begin
  FSubType := 'Почта СМДО';
  Result := inherited InitFilter(strErr);
end;

procedure TfmGurnSMDO.SaveToIni;
var
  ini : TSasaIniFile;
begin
  inherited SaveToIni;
  ini := GlobalTask.iniFile('LOCAL');
  {
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_SOBSTV',FVisibleSobstv);
  ini.WriteInteger(KodGurnal+'.Add','TYPE_ISKL',FTypeISKL);
  }
end;

procedure TfmGurnSMDO.LoadFromIni;
var
  i : Integer;
  ini : TSasainiFile;
  c:TColumnEh;
begin
  inherited LoadFromIni;
  ini := GlobalTask.iniFile('LOCAL');

  if FEnableWrite and (SMDO.FAutoCheck>0) and SMDO.FPostEnabled then begin
    Timer.Interval:=SMDO.FAutoCheck*1000*60;
    Timer.Enabled:=true;
  end else begin
    Timer.Enabled:=false;
  end;
  FThreadW:=0;

  {
  FVisibleLgot:=ini.ReadBool(KodGurnal+'.Add','VISIBLE_LGOT_MEN',false);
  FVozrast2  := ini.ReadInteger(KodGurnal+'.Add','VOZRAST2',17);
  }
  {
  edTypeSeek.Items.Strings[TYPESEEK_VOZR]:='Количество в составе ('+GetNameVozrast_+')';
  edTypeSeek.Update;
  }

//  for i:=0 to Grid.Columns.Count-1 do begin
    {
    if Grid.Columns[i].FieldName='SOSTAV_SEM' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsSostavSem;
    end else if Grid.Columns[i].FieldName='SOBSTV' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsSOBSTV;
    end else if Grid.Columns[i].FieldName='REG_OSNOV_TEXT' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsREGOSNOV;
    end else if Grid.Columns[i].FieldName='ISK_OSNOV_TEXT' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsISKOSNOV;
    end;
    }
//  end;

end;

//------------------------------------------------------------------------
function TfmGurnSMDO.InitGurnal: Boolean;
var
  it  : TTbItem;
  ini : TSasainiFile;
  sep : TTbSeparatorItem;
  pt:TPermitType;
//  c : TColumnEh;
begin
  Result:=inherited InitGurnal;
  if not Result then exit;
  Result:=true;
  ini := GlobalTask.iniFile('LOCAL');
//  FVklMens := false;
//  FTypeISKL:=ini.ReadInteger(KodGurnal+'.Add','TYPE_ISKL',0);

//  if FTypeISKL>0 then cbTypeISKL.ItemIndex:=FTypeISKL;

//  SetTypeOchered(ini.ReadInteger(KodGurnal+'.Add','TYPE_OCHERED',0));
//  if FTypeOchered>0 then cbTypeOchered.ItemIndex:=FTypeOchered;

  pt:=Role.CheckSubSystem(SS_SMDO);
  if pt=ptFull then begin

  end;

  FSeekAsQuery:=true;   // !!!
//  FSeekAsQuery:=false;

  CreateAdditiveWhere(getAdditiveWhere);

  // если не областная база и доступна загрузка включим мою базу

  TBSubItemRun.Visible:=true;
  it := TTbItem.Create(TBSubItemRun);
  it.Caption:='Контроль точек распределения СОС';
  it.OnClick:=Event_RunRefreshCOC;
  TBSubItemRun.Add(it);

  if (SMDO.FPostEnabled and (Role.Status=rsAdmin)) or Role.SystemAdmin then begin
    TBItemMsgList.Enabled:=true;
  end else begin
    TBItemMsgList.Enabled:=false;
  end;

  if (Role.Status=rsAdmin) or Role.SystemAdmin then begin
    if TBSubItemRun.Count>0 then begin
      sep := TTbSeparatorItem.Create(TBSubItemRun);
      TBSubItemRun.Add(sep);
    end;

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Сохранить сообщение в файл';
    it.OnClick:=Event_CreateArxivEML;
    TBSubItemRun.Add(it);

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Открыть XML-файл сообщения';
    it.OnClick:=Event_OpenXML;
    TBSubItemRun.Add(it);

    { !!! доделать позже !!!
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Контроль ошибочного ЭЦП';
    it.OnClick:=Event_CheckETSP;
    TBSubItemRun.Add(it);
    }

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Просмотр Log-файла';
    it.OnClick:=Event_ViewLog;
    TBSubItemRun.Add(it);

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Получить информацию о сообщениях';
    it.OnClick:=Event_ViewMsgList;
    TBSubItemRun.Add(it);

    {
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Создать копию сообщения';
    it.OnClick:=Event_CreateCopyDok;
    TBSubItemRun.Add(it);
    }


  end;
  if Smdo.Demo and not Role.SystemAdmin then begin
    FDemo:=true;
    TBItemDelDok.Enabled:=false;
    TBSubItemRun.Enabled:=false;
    cbMailType.Enabled:=false;
  end;

//  sep := TTbSeparatorItem.Create(TBSubItemRun);
//  TBSubItemRun.Add(sep);
                                 
  {                     
  if (Role.Status=rsAdmin) then begin
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Изменить значение реквизита в базе';
    it.OnClick:=Event_InitFields;
    TBSubItemRun.Add(it);
  end;
  }

end;
//-----------------------------------------------------------------------------------
procedure TfmGurnSMDO.Event_RunRefreshCOC;
var
  sErr:String;
begin
  if SMDOEnabled then begin
    SMDO.RefreshCOC(true, sErr, true);
    if sErr<>''
      then ShowMessageCont(sErr,nil);
//      then PutError(sErr);
  end;
end;
//-------------------------------------------------------------------------
procedure TfmGurnSMDO.Event_CheckPropertyGridColumns(Sender:TObject);
var
  c : TColumnEh;
  i:Integer;
  sField:String;
begin
//  grid.Hi nt:='1111111111';
  c:=TColumnEh(Sender);
  sField:=UpperCase(c.FieldName);
  if sField='SUBJ_TYPE' then begin
    c.OnGetCellParams:=GridColumnsSubjType;
    c.ImageList:=ImageListEx;
    c.ToolTips:=true;
  end else if sField='MSG_TYPE' then begin
    c.OnGetCellParams:=GridColumnsMsgType;
    c.ImageList:=ImageListEx;
    c.ToolTips:=true;
  end else if sField='DOC_STATUS' then begin
    c.OnGetCellParams:=GridColumnsDocStatus;
    c.ImageList:=ImageListEx;
    c.ToolTips:=true;
    c.ShowImageAndText:=true;
  end else if sField='TEXT' then begin
    c.OnGetCellParams:=GridColumnsText;
//    c.ToolTips:=true;
//  end else if sField='SUBJECT' then begin
//    c.ToolTips:=true;
//  end else if sField='NAME' then begin
//    c.ToolTips:=true;
//    c.ShowImageAndText:=true;
  end;
end;
//------------------------------------------------
procedure TfmGurnSMDO.GridColumnsSubjType(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Query.FieldByName('SUBJ_TYPE').IsNull then begin
      Params.ImageIndex:=-1;
    end else begin
      case Query.FieldByName('SUBJ_TYPE').AsInteger of
        1 : Params.ImageIndex:=0;
        2 : if Query.FieldByName('SENT').AsInteger=-1 then Params.ImageIndex:=2 else Params.ImageIndex:=1
      else
        Params.ImageIndex:=-1;
      end;
    end;
  end;
end;
//------------------------------------------------
procedure TfmGurnSMDO.GridColumnsMsgType(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if not EditMode then begin
    try
      if Query.FieldByName('MSG_TYPE').IsNull then begin
        Params.ImageIndex:=-1;
      end else begin
        case Query.FieldByName('MSG_TYPE').AsInteger of
          0 : Params.ImageIndex:=3;
          1,3 : if Query.FieldByName('COUNT_TASK').AsInteger+Query.FieldByName('COUNT_FOLDER').AsInteger=0 then begin
                  Params.ImageIndex:=4;    //один большой лист
                end else begin
                  if Query.FieldByName('ISWRITE_REF').AsString='1'
                    then Params.ImageIndex:=7    //два листка  обработанное
                    else Params.ImageIndex:=5;   //два листка
                end;
{          2,4 : begin
                  if Query.FieldByName('ISWRITE_REF').AsString='1' then begin
                    Params.ImageIndex:=8;
                  end else begin
                    Params.ImageIndex:=6;
                  end;
                end;   }
          2,4 : if Query.FieldByName('ISWRITE_REF').AsString='1'
                     then Params.ImageIndex:=8   // +доп. к документу  один маленький лист  обработанное
                     else Params.ImageIndex:=6;  // +доп. к документу  один маленький лист
          // если толко доп.материалы Params.ImageIndex:=6;
        end;
      end;
    except
      Params.ImageIndex:=-1;
    end;
  end;
end;
//------------------------------------------------
procedure TfmGurnSMDO.GridColumnsDocStatus(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
{
  if not EditMode then begin
    if Query.FieldByName('DOC_STATUS').IsNull then begin
      Params.ImageIndex:=-1;
    end else begin
      case Query.FieldByName('DOC_STATUS').AsInteger of
        DOC_CREATE       : Params.ImageIndex:=5;
        DOC_PRESENT      : begin
                             Params.ImageIndex:=6;
                             if Query.FieldByName('SUBJ_TYPE').AsInteger=1
                               then Params.Text:='получен' else Params.Text:='отправлен'
                           end;
        DOC_DELIVER      : Params.ImageIndex:=7;
        DOC_REGISTER     : if Query.FieldByName('DOC_REG').AsBoolean then Params.ImageIndex:=12 else Params.ImageIndex:=8;
        DOC_NOT_REGISTER : if Query.FieldByName('DOC_REG').AsBoolean then Params.ImageIndex:=11 else Params.ImageIndex:=8;
        DOC_ERROR        : Params.ImageIndex:=10;
      else
        Params.ImageIndex:=-1;
      end;
    end;
  end;
  }
end;
//------------------------------------------------
procedure TfmGurnSMDO.GridColumnsText(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Query.FieldByName('MSG_TYPE').AsInteger=MSG_TYPE_A then begin
      Params.Text:=Query.FieldByName('SUBJECT').AsString;
    end else begin
      Params.Text:=Query.FieldByName('TEXT').AsString;
    end;
  end;
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.Event_InitFields(Sender: TObject);
var
  lFilter : Boolean;
begin
  if TBItemClrFlt.Enabled or Query.Filtered then begin
    lFilter := true;
  end else begin
    lFilter := false;
  end;
//  if RunInitRekvisit(Self, Query, dmBase.tbMens, 'DATE_FIKS;ID', lFilter, 'OCHERED') then Refresh(true);
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.edSeekChange(Sender: TObject);
begin
  if (Trim(edSeek.Text)='') and not FRun then begin
    SetAdditiveFilter;
    ActiveControl:=edSeek;
  end;
end;

procedure TfmGurnSMDO.edSeekEnter(Sender: TObject);
begin
  if (edTypeSeek.ItemIndex=TYPESEEK_IN) or (edTypeSeek.ItemIndex=TYPESEEK_BTI) or (edTypeSeek.ItemIndex=TYPESEEK_VOZR) then begin
    ActivateENGKeyboard;
  end else begin
    ActivateRUSKeyboard;
  end;
end;
procedure TfmGurnSMDO.edSeekExit(Sender: TObject);
begin
  ActivateRUSKeyboard;
end;

//----------------------------------------------------------------------------------
procedure TfmGurnSMDO.ClearSeek;
begin
  FRun:=true;
  edSeek.Text:='';
  FRun:=false;
  setAdditiveFilter;
end;
//----------------------------------------------------------------------------------
procedure TfmGurnSMDO.Fgu(Sender: TObject;  var Handled: Boolean);
begin
  ClearSeek;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.Event_VklMens(Sender: TObject);
begin
//  FVklMens := not FVklMens;
//  CreateAdditiveWhere(getAdditiveWhere);
end;


//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.AddUpdateActions;
begin
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.SetListParEditForm;
begin
  inherited;
  if Query.Active then begin
    FListPar.Add('SUBJ_TYPE='+Query.FieldByName('SUBJ_TYPE').AsString);
    FListPar.Add('MSG_TYPE='+Query.FieldByName('MSG_TYPE').AsString);
  end;
end;

//-----------------------------------------------------------------------------------------
// регистрация в очереди
procedure TfmGurnSMDO.TBItemAddClick(Sender: TObject);
begin
end;
//------------------------------------------------------------------------
procedure TfmGurnSMDO.TBItemAddNewMenClick(Sender: TObject);
begin
end;
//--------------------------------------------------------------------------
function TfmGurnSMDO.GetPropertyDef(sName: String; var vVal:Variant): Boolean;
var
  s1,s2:String;
begin
  Result:=false;
  if sName='TYPEFILTER' then begin
    Result:=true;
    vVal:=-1;
    if FSeekAsQuery_Active and (edTypeSeek.ItemIndex>-1) then begin
      vVal:=edTypeSeek.ItemIndex;
    end;
  end else if sName='VALUEFILTER' then begin
    Result:=true;
    vVal:='';
    if FSeekAsQuery_Active and (edTypeSeek.ItemIndex>-1) then begin
      vVal:=edSeek.Text;
    end;
  end else if sName='VALUEFILTER1' then begin
    Result:=true;
    vVal:='';
    if FSeekAsQuery_Active and (edTypeSeek.ItemIndex>-1) then begin
      if (edTypeSeek.ItemIndex=TYPESEEK_LASTRESH) then begin  // номер последнего решения
        CheckValueFilter(TYPESEEK_LASTRESH, edSeek.Text, s1,s2);
        vVal:=s1;
      end;
    end;
  end else if sName='VALUEFILTER2' then begin
    Result:=true;
    vVal:='';
    if FSeekAsQuery_Active and (edTypeSeek.ItemIndex>-1) then begin
      if (edTypeSeek.ItemIndex=TYPESEEK_LASTRESH) then begin  // номер последнего решения
        CheckValueFilter(TYPESEEK_LASTRESH, edSeek.Text, s1,s2);
        vVal:=s2;
      end;
    end;
  end;
end;

//----------------------------------------------------------------
function TfmGurnSMDO.getDefaultAddWhere: String;                      
begin
  Result:=getAdditiveWhere;
end;
//-----------------------------------------------------------------------------------------
function TfmGurnSMDO.getAdditiveWhere : String;
var
  n:Integer;
  procedure AddWhere(ss:String);
  begin if result='' then result:=ss else result:=result+' and '+ss; end;
begin
// FMailType : SUBJ_TYPE  все 1-входящие 2-исходящие
// FMsgType  : MSG_TYPE   0-Все  1-Уведомления  2-Документы  3-Необработанные
// FDocStatus: DOC_STATUS 0-принят к обработке 1-зарегистрирован 2-не подлежит рег. 3-ошибочный
  Result:='';
  if (FMailType=1) or (FMailType=2)
    then addWhere('smd.subj_type='+IntToStr(FMailType));
  case FMsgType of
//  0:  все
    1: addWhere('smd.msg_type=0');   // уведомления
    2: addWhere('smd.msg_type<>0');  // все документы
    3: addWhere(SMDO.WorkReq(0,true));  // требующие обработки
    4,5,6,7: addWhere('smd.msg_type='+IntToStr(FMsgType-3));  // документы по типу  1,2,3,4
  end;
//  if FDocStatus>0 then
//    addWhere('smd.doc_status='+IntToStr(FDocStatus-1));

  {if FSeekAsQuery and FSeekAsQuery_Active then begin
    Result:=Result+' and pos_id in (select id from '+GetNameTmpIdTable+')';
  end;}
  {if Result='' then begin
    Result:=FFilter_Punkt;
  end else begin
    if FFilter_Punkt<>'' then begin
      Result:=Result+' and '+FFilter_Punkt;
    end;
  end;}
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.SetQueryParam(p: TParam);
var
  l1,l2 : Boolean;
  b1:Integer;
begin
  l1:=false;
  l2:=false;
  if not SetQueryParamDef(p) then begin
    if UpperCase(p.Name)='TYPEOCHERED' then begin
//      p.DataType:=ftInteger;
//      p.ParamType:=ptInput;
      //p.AsInteger:=FTypeOchered;
    end else if Copy(UpperCase(p.Name),1,4)='ISKL' then begin
      if Copy(p.Name,5,1)='1' then begin
        p.AsBoolean:=l1;
      end else begin
        p.AsBoolean:=l2;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.cbMailTypeChange(Sender: TObject);
var
  s:String;
begin
  if not FRun then begin
    FMailType:=cbMailType.ItemIndex;
    s:=CreateAdditiveWhere(getAdditiveWhere);
//  if s<>'' then begin
      FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
//  end;
    FullRefresh;
  end;
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.cbMsgTypeChange(Sender: TObject);
var
  s:String;
begin
  if not FRun then begin
    FMsgType:=cbMsgType.ItemIndex;
    s:=CreateAdditiveWhere(getAdditiveWhere);
//  if s<>'' then begin
    FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
//  end;
    FullRefresh;
    SetCaptionGurnal;
  end;
end;
//------------------------------------------------------------------------
procedure TfmGurnSMDO.cbDocStatusChange(Sender: TObject);
var
  s:String;
begin
  if not FRun then begin
    FDocStatus:=cbDocStatus.ItemIndex;
    s:=CreateAdditiveWhere(getAdditiveWhere);
//  if s<>'' then begin
      FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
//  end;
    FullRefresh;
    SetCaptionGurnal;
  end;
end;

//------------------------------------------------------------------------
procedure TfmGurnSMDO.TBItemClearSourceClick(Sender: TObject);
begin
end;
//------------------------------------------------------------------------
procedure TfmGurnSMDO.TBItemMySourceClick(Sender: TObject);
begin
end;
//--------------------------------------------------------------------------
procedure TfmGurnSMDO.TBSubmenuSourceClick(Sender: TObject);
begin
end;

//-----------------------------------------------------------------------------------------
function TfmGurnSMDO.CheckDelete(var strErr : string; var lQuest:Boolean; arr:TArrStrings) : Boolean;
begin
  lQuest:=true;
  strErr:='';
  Result:=true;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.BeforeReport;
begin
  inherited BeforeReport;
  GlobalTask.SetLastValueAsInteger('MAIL_TYPE', FMailType);
  GlobalTask.SetLastValueAsInteger('MSG_TYPE', FMsgType);
//  GlobalTask.SetLastValueAsInteger('DOC_STATUS', FDocStatus);
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.TBItemTypeMensClick(Sender: TObject);
begin
{
  f := TfmTypeMensOchered.Create(nil);
  f.cbLgot.Checked:=FVisibleLgot;
  f.cbSobstv.Checked:=FVisibleSobstv;
  f.cbListMens.Checked:=FVisibleListMens;
  f.cbOtnosh.Checked:=FAddOtnosh;
  f.cbDateR.Checked:=FAddDateR;
  f.cbPasp.Checked:=FAddPasp;
  f.cbAddBTI.Checked:=FAddBTI;
  if f.ShowModal=mrOk then begin
    FVisibleListMens:=f.cbListMens.Checked;
    FVisibleLgot:=f.cbLgot.Checked;
    FVisibleSobstv:=f.cbSobstv.Checked;
    FAddOtnosh:=f.cbOtnosh.Checked;
    FAddDateR:=f.cbDateR.Checked;
    FAddPasp:=f.cbPasp.Checked;
    FAddBTI:=f.cbAddBTI.Checked;
    Grid.FieldColumns['SOSTAV_SEM'].Visible:=FVisibleListMens;
    Grid.FieldColumns['LGOT'].Visible:=FVisibleLgot;
    Grid.FieldColumns['SOBSTV'].Visible:=FVisibleSobstv;
  end;
  f.Free;
}
end;

procedure TfmGurnSMDO.edSeekKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Key=VK_RETURN) and (Shift=[]) then begin
    SetAdditiveFilter;
  end else if (Key=VK_TAB) and (Shift=[]) then begin
    ActiveControl := Grid;
    Key:=0;
  end;
end;

procedure TfmGurnSMDO.FormCreate(Sender: TObject);
var
  s:String;
begin
  inherited;
  FEventCheckGrid:=Event_CheckPropertyGridColumns;
  FRunTimer:=false;
  FRunPost:=0;
  s:=GlobalTask.ParamAsString('NAME_DELO');
  if s='' then s:='Номер дела';
  edTypeSeek.Items.Add(s);
  edTypeSeek.Items.Add('Номер посл. реш. за год');

  edTypeSeek.Items.Add('Собственность из БТИ');
  edTypeSeek.Items.Add('Количество в составе');
  if not tbSMDOPost.Active
    then tbSMDOPost.Active:=true;

end;
//--------------------------------------------------------------------------------------------
procedure TfmGurnSMDO.edSeekEditButtonsBeginClick(Sender: TObject; var Handled: Boolean);
begin
  SetAdditiveFilter;
end;

//--------------------------------------------------------------------------------------------
function TfmGurnSMDO.CheckValueFilter(nType:Integer;strFilter:String; var s1,s2:String):Boolean;
var
  n:Integer;
begin
  Result:=true;
  n:=Pos('?',strFilter);
  if n=0 then n:=Pos('*',strFilter);
  if n=0 then n:=Pos('+',strFilter);

  if n>0 then begin
    s1:=Copy(strFilter,1,n-1);
    try
      s2:=IntToStr(StrToInt(Copy(strFilter,n+1,Length(strFilter))));
    except
      s2:='';
      Result:=false;
    end;
  end else begin
    s1:=strFilter;
    s2:=IntToStr(YearOf(Now));
  end;
end;

//--------------------------------------------------------------------------------------------
function TfmGurnSMDO.getIDForTmpTable(nType:Integer;strFilter:String):Boolean;
var
  slSQL:TStringList;
  sFam,sName,sOper,sOp,s1,s2,sNot:String;
  sMonth, sYear:String;
  n:Integer;
  function getWhere(sFam,sName:String):String;
  begin
    if sOper='*' then Result:='FAMILIA LIKE '+QStr(sFam+'%')
                 else Result:='FAMILIA='+QStr(sFam);

    if sName<>'' then begin
      if sOper='*' then Result:=Result+' and NAME LIKE '+QStr(sName+'%')
                   else Result:=Result+' and NAME='+QStr(sName);

    end;
  end;
begin
  Result:=false;
  OpenMessage('    Поиск ...     ','',10);
  sNot:='';
  try
    slSQL:=TStringList.Create;
    slSQL.Add('DELETE FROM &tmp&;');
    sOper:=Copy(strFilter,1,1);
//    if (sOper='=') or (sOper='<') or (sOper='>') or (sOper='*')
    if (sOper='=') or (sOper='*') or (sOper='<') or (sOper='>') or (sOper='-')
      then strFilter:=Copy(strFilter,2,Length(strFilter))
      else sOper:='*';

    n:=Pos(' ',strFilter);

    if n>0 then begin
      sFam:=Copy(strFilter,1,n-1);
      sName:=Copy(strFilter,n+1,30);
    end else begin
      sFam:=strFilter;
      sName:='';
    end;
    if (nType=TYPESEEK_FIO) or (nType=TYPESEEK_FIO_SS) then begin
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM Население WHERE '+getWhere(sFam,sName)+';');
      if (nType=TYPESEEK_FIO_SS) then begin   // + состав семьи
        slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM SostavSem WHERE '+getWhere(sFam,sName)+';');
      end;
      if GlobalTask.ParamAsBoolean('SEEK_WITH_HIST') then begin
        if sOper='*' then s1:='VALUE LIKE '+QStr(sFam+'%')
                     else s1:='VALUE='+QStr(sFam);
        slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM HistoryZags WHERE '+
                  'typeobj='+IntToStr(_TypeObj_Nasel)+' and fieldname='+QStr('FAMILIA')+' and '+s1+';');
      end;
    end else if (nType=TYPESEEK_IN) then begin        // личный номер
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM Население WHERE LICH_NOMER='+QStr(strFilter)+';');
    end  else if (nType=TYPESEEK_DELO) then begin     // номер дела
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM Ochered WHERE DELO='+QStr(strFilter)+';');
    end else if (nType=TYPESEEK_LASTRESH) then begin  // номер последнего решения
      CheckValueFilter(TYPESEEK_LASTRESH, strFilter, s1,s2);
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT oc.ID FROM Ochered oc LEFT JOIN OcheredResh ocr ON oc.id_last_resh=ocr.auto_id WHERE ocr.NOMER='+QStr(s1)+' and Year(ocr.DATER)='+s2+';');
    end else if (nType=TYPESEEK_BTI) then begin       // есть собственность из БТИ
      if (sOper='-') then begin
        sNot:=' not ';
        s1:='';
      end else begin
        if IsAllDigitEx(Trim(strFilter),1) and (Trim(strFilter)<>'') then begin
          if (sOper='*') or (sOper='=') or (sOper='')
            then sOp:='='
            else sOp:=sOper;
          n:=Pos('.', strFilter);
          if n=0 then begin
            s1:=' where Year(dater)'+sOp+strFilter;
          end else begin
            sMonth:=Copy(strFilter,1,n-1);
            sYear:=Copy(strFilter,n+1,20);
            s1:=' where Year(dater)'+sOp+sYear+' and Month(dater)'+sOp+sMonth;
          end;
        end else begin
          s1:='';
        end;
      end;
      s2:=' insert into &tmp& (ID) SELECT ID FROM ochered where id '+sNot+'in ( '#13+
          '   select distinct id from ( '+
          '   select id from sostavsem where member_id in (select id from НаселениеСобств '+s1+' ) '#13+
          '     union all '#13+
          '   select id from ochered where id in (select id from НаселениеСобств '+s1+') ) aaa);';
      slSQL.Add(s2);
    end else if (nType=TYPESEEK_VOZR) then begin
    end;

    TmpQuery.SQL.Text:=StringReplace( slSQL.Text, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);
    slSQL.Free;
    memowrite('last_tmp.sql',TmpQuery.SQL.Text);
    TmpQuery.ExecSQL;
    TmpQuery.SQL.Text:='SELECT COUNT(*) FROM '+GetNameTmpIdTable;
    TmpQuery.Open;
    if TmpQuery.Fields[0].AsInteger>0 then  begin
      Result:=true;
    end;
    TmpQuery.Close;
    CloseMessage;
//    TmpQuery.Sql.Text:='select count(*) from '+GetNameTmpIdTable;
//    TmpQuery.Open;
//    ShowMessage(TmpQuery.Fields[0].AsString);
//    TmpQuery.Close;
  except
    on E:Exception do begin
      CloseMessage;
      PutError('Ошибка поиска: '+#13+E.Message,self);
      Result:=false;
    end;
  end;
end;
//--------------------------------------------------------------------------------------------
function TfmGurnSMDO.getIDForFilter(nType:Integer;strFilter:String):String;
var
  n:Integer;
  s,sID,sAdd:String;
  st:TSostTable;
begin
  Result:='';
  OpenMessage('Поиск ... ','',10);
  if Copy(strFilter,1,1)='='
    then sAdd:=''
    else sAdd:='*';
  try
    if nType=1 then begin
      n:=Pos(' ',strFilter);
      if n>0 then begin
//        s:='FAMILIA='+QStr(Copy(strFilter,1,n-1)+'*')+
//           'and NAME='+QStr(Copy(strFilter,n+1,20)+'*');
        s:='FAMILIA='+QStr(Copy(strFilter,1,n-1)+sAdd)+
           'and NAME='+QStr(Copy(strFilter,n+1,20)+sAdd);
      end else begin
        s:='FAMILIA='+QStr(strFilter+sAdd);
//        s:='FAMILIA='+QStr(strFilter+'*');
      end;
    end else if nType=2 then begin
      s:='LICH_NOMER='+QStr(strFilter);
    end;

    st:=SaveSostTable(dmBase.tbMens,true,false);
    dmBase.tbMens.Filter:=s;
    dmBase.tbMens.Filtered:=true;
    sID:=';';
    while not dmBase.tbMens.Eof do begin
      if dmbase.tbOchered.Locate('ID',dmBase.tbMens.FieldByName('ID').AsInteger,[]) then begin
        sID:=sID+dmBase.tbMens.FieldByName('ID').AsString+';';
      end;
      dmBase.tbMens.Next;
    end;
    dmBase.tbMens.Filtered:=false;
    RestSostTable(dmBase.tbMens,st);

    st:=SaveSostTable(dmBase.tbSostavSem,true,false);
    dmBase.tbSostavSem.Filter:=s;
    dmBase.tbSostavSem.Filtered:=true;
    while not dmBase.tbSostavSem.Eof do begin
      sID:=sID+dmBase.tbSostavSem.FieldByName('ID').AsString+';';
      dmBase.tbSostavSem.Next;
    end;
    dmBase.tbSostavSem.Filtered:=false;
    RestSostTable(dmBase.tbSostavSem,st);
  finally
    CloseMessage;
  end;
  if sID<>';' then begin
    Result:='At('';''+alltrim(str(id))+'';'', '+QStr(sID)+')>0';
  end else begin
    ShowMessageCont('Данные не найдены.',Self);
  end;
end;

//--------------------------------------------------------------------------------------------
function TfmGurnSMDO.getAdditiveFilter:String;
var
  strFilter,sAdd,s : String;
  nLen,n : Integer;
//  st:TSostTable;
begin
  strFilter:=Trim(edSeek.Text);
  nLen:=Length(strFilter);
  if FSeekAsQuery then begin
    if nLen=0 then begin
      Result:='';
      FSeekAsQuery_Active:=false;
    end else begin
      Result:='';
      if getIDForTmpTable(edTypeSeek.ItemIndex,strFilter) then begin

      end;
      FSeekAsQuery_Active:=true;
    end;
    s:=CreateAdditiveWhere(getAdditiveWhere);
    if s<>'' then begin
      FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
    end;
  end else begin
    if nLen=0 then begin
      Result:='';
    end else begin
      if Copy(strFilter,1,1)='='
        then sAdd:=''
        else sAdd:='*';
      case edTypeSeek.ItemIndex of
        0: begin
             n:=Pos(' ',strFilter);
             if n>0 then begin
               Result:='FAMILIA='+QStr(Copy(strFilter,1,n-1)+sAdd)+
                         'and NAME='+QStr(Copy(strFilter,n+1,20)+sAdd);
             end else begin
               Result:='FAMILIA='+QStr(strFilter+sAdd);
             end;
           end;
  //      1: Result:='EVENT1';
        1: Result:=getIDForFilter(1,strFilter);
        2: Result:=getIDForFilter(2,strFilter);
        3: begin // поиск по номеру дела
  //        if IsAllDigit(strFilter) then begin
            Result:='DELO='+QStr(strFilter);
  //        end else begin
  //          Beep;
  //        end;
           end;
        4: begin // поиск по номеру решения
  //        if IsAllDigit(strFilter) then begin
            Result:='REG_RESH='+QStr(strFilter);
  //        end else begin
  //          Beep;
  //        end;
           end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------
function TfmGurnSMDO.setAdditiveFilter: Boolean;
var
  strFilter : String;
//  n:Integer;
  l:Boolean;
  cur:TCursor;
begin
  result:=true;
  if FSeekAsQuery then begin
    getAdditiveFilter;
    FullRefresh(false);
  end else begin
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    strFilter:=getAdditiveFilter;
    l:=dbDisableControls(Query);
    try
      if strFilter='' then begin
        Query.Filter := '';
        Query.Filtered := false;
        Query.OnFilterRecord:=nil;
      end else begin
        if strFilter='EVENT1' then begin
        {
          Query.Filter := '';
          strFilter:=Trim(edSeek.Text);
          n:=Pos(' ',strFilter);
          if n>0 then begin
            FSeekFamMen:=Copy(strFilter,1,n-1);
            FSeekNameMen:=Copy(strFilter,n+1,20);
          end else begin
            FSeekFamMen:=strFilter;
            FSeekNameMen:='';
          end;
          Query.OnFilterRecord:=QueryFilterRecord;
          Query.Filtered := true;
          }
        end else begin
          Query.Filter := strFilter;
          Query.OnFilterRecord:=nil;
          Query.Filtered := true;
        end;
      end;
    finally
      dbEnableControls(Query,l);
      Screen.Cursor:=cur;
    end;
  end;
  if not Query.Eof then begin
    ActiveControl := Grid;
  end;
end;

procedure TfmGurnSMDO.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
  n:Integer;
  slMsg:TStringList;
begin
  if (Shift=[ssCtrl]) then begin
    case Key of
      83: begin           // Ctrl-S
            ActiveControl:=edSeek;
            Key:=0;
          end;
      69: begin           // Ctrl-E
            ClearSeek;
            Key:=0;
          end;
    end;
  end else if (Shift=[ssShift]) then begin
    case Key of
      VK_F2: begin
                // отправить одно текущеее сообщение
                if (Query.FieldByName('SUBJ_TYPE').AsInteger=SUBJ_OUT) then begin
                  n:=Query.FieldByName('SENT').AsInteger;
                  if n=-1 then begin
                    PutError('Сообщение неготово к отправке');
                  end else if n=1 then begin
                    PutError('Сообщение уже было отправлено');
                  end else if n=0 then begin
                    slMsg:=TStringList.Create;
                    slMsg.Add(Query.FieldByName('ID').AsString);
                    try
                      TBItemSendClick(slMsg);
                    finally
                      slMsg.Free;
                    end;
                  end;
                end;  
                Key:=0;
             end;
    end;
  end;
  inherited;
end;

procedure TfmGurnSMDO.cbMailTypeDrawItem(Control: TWinControl; Index: Integer;  Rect: TRect; State: TOwnerDrawState);
//var
//  ComboBox: TComboBox;
//  bitmap: TBitmap;
begin
{
  ComboBox := (Control as TComboBox);
  Bitmap := TBitmap.Create;
  try
    ImageListEx.GetBitmap(Index, Bitmap);
    with ComboBox.Canvas do
    begin
      FillRect(Rect);
      if Bitmap.Handle <> 0 then Draw(Rect.Left + 2, Rect.Top, Bitmap);
      Rect := Bounds(Rect.Left + ComboBox.ItemHeight + 2, Rect.Top, Rect.Right - Rect.Left, Rect.Bottom - Rect.Top);
      DrawText(handle, PChar(ComboBox.Items[Index]), length(ComboBox.Items[index]), Rect, DT_VCENTER+DT_SINGLELINE);
    end;
  finally
    Bitmap.Free;
  end;
  }
end;
//------------------------------------------------------------------------------
procedure TfmGurnSMDO.UpdateGbInfo;
begin
  if TBItemLog.Checked and TBItemLog.Visible then begin
    gbInfo.Caption:=' [Лог работы] ';
  end else begin
    if Query.FieldByName('MSG_TYPE').AsInteger=MSG_TYPE_A then begin
      gbInfo.Caption:=' [Уведомление] ';
    end else begin
      if Query.FieldByName('SUBJ_TYPE').AsInteger=SUBJ_IN then begin
        gbInfo.Caption:=' [Входящий  документ] '
      end else begin
        gbInfo.Caption:=' [Исходящий документ] ';
        case Query.FieldByName('SENT').AsInteger of
          -1 : gbInfo.Caption:=gbInfo.Caption+' к отправке не готов';
           0 : gbInfo.Caption:=gbInfo.Caption+' готов к отправке';
        else
          gbInfo.Caption:=gbInfo.Caption+' отправлен';
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmGurnSMDO.QueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if TBItemLog.Checked then begin
    TBItemLog.Checked:=false;
  end;
  UpdateGbInfo;
end;
//-------------------------------------------------------------------------
procedure TfmGurnSMDO.GridUvdColumns1GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  n:Integer;
begin
  n:=Pos('=',Params.Text);
  if n=0
    then Params.Text:=''
    else Params.Text:=Trim(Copy(Params.Text,1,n-1));
end;
procedure TfmGurnSMDO.GridUvdColumns2GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=SMDO.Text2Text(Params.Text,';');
//  SMDO.Text2AckResult(Params.Text);
//  Params.Text:=SMDO.AckResult2Text(';', false);
end;
//---------------------------------------
procedure TfmGurnSMDO.ParamsGridForAck(ds:TDataSet; Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
var
  n,m,nAckType:Integer;
begin
  nAckType:=ds.FieldByName('ACK_TYPE').AsInteger;
  n:=Pos('=',ds.FieldByNAme('TEXT').AsString);
  m:=0;
  if n>0 then begin
    try
      m:=StrToInt(Copy(ds.FieldByNAme('TEXT').AsString,1,n-1));
    except
    end;
  end;
  if nAckType=ACK_DELIVER then begin
    if m<>0 then AFont.Color:=clRed;
  end else if nAckType=ACK_REGISTER then begin
    if m=3 then AFont.Color:=clRed;
//  end else if nAckType=ACK_REZERV then begin
//  end else if nAckType=ACK_USER then begin
  end;
  if ( (nAckType>=100) or (ds.FieldByName('SUBJ_SYSTEM').AsInteger>0) ) then begin
    AFont.Color:=clBlue;
  end;
  // не отправлено исходящее уведомление
  if (ds.FieldByNAme('SUBJ_TYPE').AsInteger=SUBJ_OUT) and ds.FieldByNAme('DATEPOST').IsNull then begin
    AFont.Style:=AFont.Style+[fsBold];
  end;
end;
procedure TfmGurnSMDO.GridUvdGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
begin
  ParamsGridForAck(tbSMDOPost, Sender, Column, AFont, Background, State);
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if SMDO.MsgIsAck(Query.FieldByName('MSG_TYPE').AsInteger) then begin
    ParamsGridForAck(Query, Sender, Column, AFont, Background, State);
  end else begin
    if Query.FieldByName('SUBJ_ERROR').AsBoolean then begin
      AFont.Color:=clRed;
    end else if Query.FieldByName('SUBJ_SYSTEM').AsInteger>0 then begin
      AFont.Color:=clBlue;
    end;
    // для входящих если не отправил уведомление о регистрации
    // для исходящих если не отправил
    if (((Query.FieldByName('SUBJ_TYPE').AsInteger=SUBJ_IN) and (Query.FieldByName('ACK_TYPE').AsInteger<>2)) or
       ((Query.FieldByName('SUBJ_TYPE').AsInteger=SUBJ_OUT) and (Query.FieldByName('SENT').AsInteger<>1)) )
      then AFont.Style:=[fsBold];
  end;
end;
//---------------------------------------------------------------------------------------------------------
procedure TfmGurnSMDO.mDelUvdClick(Sender: TObject);
//var
//  p:TPoint;
begin
  if tbSMDOPost.FieldByName('ID').AsString<>'' then begin // not tbSMDOPost.Eof and not tbSMDOPost.Bof then begin
//    p:=GridUvd.Parent.ClientToScreen(Point(0,0));
//    if ProblemXY('Удалить текущее уведомление ?', p.x+200, p.y+20,mtConfirmation)  then begin
    if Problem('Удалить текущее уведомление ?', mtConfirmation, GridUvd)  then begin
      tbSMDOPost.Delete;
    end;
  end;
end;
procedure TfmGurnSMDO.GridUvdDblClick(Sender: TObject);
var
  p:TPoint;
  s:String;
  sl:TStringList;
begin
  sl:=TStringList.Create;
//  SMDO.Text2AckResult(tbSMDOPost.FieldByName('TEXT').AsString);
 // ShowStrings(SMDO.FAckResult,'Уведомление');
  P:=GridUvd.ClientToScreen(Point(0,0));
  s:=InttoStr(p.x)+';'+InttoStr(p.y)+';'+InttoStr(GridUvd.Width)+';'+InttoStr(GridUvd.Height)+';'+InttoStr(GridUvd.Font.Size);
  SMDO.Text2Text(DelCharsR( tbSMDOPost.FieldByName('TEXT').AsString, chr(0) ), chr(13)+chr(10), sl);
  ShowMemo(sl,'Уведомление', s);
  sl.Free;
end;
//-------------------------------------------------------------------------
procedure TfmGurnSMDO.vchDBText1GetText(Sender: TObject; var Text: String);
var
  nAck,nSent,nTypeSubj:Integer;
  sMsgID,s,ss:String;
  function getError:String;
  begin
    result:='';
    if Query.FieldByName('ERROR_TEXT').AsString<>'' then begin
//      SMDO.Text2AckResult(Query.FieldByName('ERROR_TEXT').AsString);
//      result:=SMDO.AckResult2Text(',',false);
      result:=SMDO.Text2Text(Query.FieldByName('ERROR_TEXT').AsString,',');
    end;
  end;
begin
  if not TBItemLog.Checked and Query.Active then begin  // !!!
    nTypeSubj:=Query.FieldByName('SUBJ_TYPE').AsInteger;
    Text:=Query.FieldByName('TEXT').AsString;
    if Query.FieldByName('MSG_TYPE').AsInteger=MSG_TYPE_A then begin
      GridUvd.Visible:=false;
      vchDBText1.Align:=alClient;
      vchDBText1.Visible:=true;
//      SMDO.Text2AckResult(Text);
//      Text:=SMDO.AckResult2Text(chr(13)+chr(10), false);
      Text:=SMDO.Text2Text(Text,chr(13)+chr(10));

  //    if Query.FieldByName('SUBJ_ERROR').AsBoolean then begin
  //      Text:=Text+chr(13)+chr(10)+'УВЕДОМЛЕНИЕ ОШИБОЧНОЕ: '+getError;
  //    end;
    end else begin
      GridUvd.Visible:=true;
      vchDBText1.Visible:=false;
    end;
  end;
  {
    sMsgID:=Query.FieldByName('MSG_ID').AsString;
    nAck:=Query.FieldByName('ACK_TYPE').AsInteger;
    nSent:=Query.FieldByName('SENT').AsInteger;
    ss:='';
    //=====================================
    // ОШИБОЧНЫЙ
    if Query.FieldByName('SUBJ_ERROR').AsBoolean then begin
      ss:='ДОКУМЕНТ ОШИБОЧНЫЙ';
      if Query.FieldByName('ERROR_TEXT').AsString<>'' then begin
        SMDO.Text2AckResult(Query.FieldByName('ERROR_TEXT').AsString);
        ss:=ss+': '+SMDO.AckResult2Text(',',false);
      end;
      if nTypeSubj=SUBJ_OUT then begin
        if nAck=0 then  begin
          ss:=ss+#13#10'Уведомление не получено';
        end else begin
          ss:=ss+#13#10'Уведомление о доставке получено';
        end;
      end else begin
        if nAck=0 then  begin
          ss:=ss+#13#10'Уведомление о доставке не отправлено';
        end else if nAck=ACK_DELIVER then  begin
          ss:=ss+#13#10'Уведомление о доставке отправлено';
        end;
      end;
    end else begin
      //=====================================
      // ИСХОДЯЩИЙ
      if nTypeSubj=SUBJ_OUT then begin
        if nAck=0 then  begin
          ss:='Уведомления не получены ';
        end else if nAck=ACK_DELIVER then  begin
          ss:='Уведомление о доставке получено';
        end else if nAck=ACK_REGISTER then  begin
          ss:='Уведомление о регистрации получено';
        end;
      end else begin
      //=====================================
      // ВХОДЯЩИЙ
        if Query.FieldByName('SUBJ_SYSTEM').AsInteger=0 then begin
          if nAck=0 then  begin
            ss:='Уведомления не отправлены ';
          end else if nAck=ACK_DELIVER then  begin
            ss:='Уведомления о доствке отправлено';
          end else if nAck=ACK_REGISTER then  begin
            ss:='Уведомления о регистрации отправлено';
          end;
        end else begin
          ss:='Уведомление не требуется';
        end;
      end;
    end;
  end;
  if ss<>'' then Text:=Text+#13#10+ss;
  }
end;

procedure TfmGurnSMDO.TBItemAddDokClick(Sender: TObject);
var
  slPar:TStringList;
  sID:String;
begin
  if TBItemAddDok.Visible then begin
    slPar:=nil;
    FRun:=true;                                           
    try
      if fmMain.EditDokument(nil, _TypeObj_SMDOPost, '-1', slPar, false, KodGurnal) then begin
        if IDLastDok>0
          then sID:=IntToStr(IDLastDok)
          else sID:='';
        Refresh(true,sID);
      end;
    finally
      FRun:=false;
    end;
  end;
end;

procedure TfmGurnSMDO.miXmltoSMDOClick(Sender: TObject);
var
  sFile:String;
begin
  OpenDialog.FilterIndex:=1;
  if OpenDialog.Execute then begin
    sFile := OpenDialog.FileName;
    SMDO.FCheckMyOrg:=false;
    SMDO.FAckResult.Clear;
    SMDO.FFilesMail.Clear;
    SMDO.XML.Clear;
    SMDO.FTmpPath:=CheckSleshN( ExtractFilePath(sFile) );
    SMDO.XML.LoadFromFile(sFile);
    SMDO.XmlToSMDO('','');
    SMDO.FCheckMyOrg:=true;
    if SMDO.FAckResult.Count>0 then begin
      ShowMessage( SMDO.AckResult2Text(#13#10,false) );
    end;
    SMDO.FAckResult.Clear;
    SMDO.FFilesMail.Clear;
  end;                                    
end;        

procedure TfmGurnSMDO.miEMLtoSMDOClick(Sender: TObject);
var
  sFile:String;
begin
  OpenDialog.FilterIndex:=3;
  if OpenDialog.Execute then begin
    sFile := OpenDialog.FileName;
    SMDO.FCheckMyOrg:=false;
//    SMDO.LoadEML(sFile);
    SMDO.LoadEML_syna(sFile);
    SMDO.FCheckMyOrg:=true;
  end;
end;                     
//--------------------------------------------------------------------
procedure TfmGurnSMDO.TBSubmenuReceiveClick(Sender: TObject);
begin
  if TBSubmenuReceive.Visible and TBSubmenuReceive.Enabled then begin
    ReceiveMailClick(Sender, 0);
  end;
end;
//--------------------------------------------------------------------
procedure TfmGurnSMDO.TBItemReceiveOneClick(Sender: TObject);
begin
  if TBItemReceiveOne.Visible and TBItemReceiveOne.Enabled then begin
    ReceiveMailClick(Sender, 1);
  end;
end;
//--------------------------------------------------------------------
procedure TfmGurnSMDO.TBItemReceiveClick(Sender: TObject);
begin
  if TBItemReceive.Visible and TBItemReceive.Enabled then begin
    ReceiveMailClick(Sender, 0);
  end;
end;
//--------------------------------------------------------------------
procedure TfmGurnSMDO.ReceiveMailClick(Sender: TObject; nPost:Integer);
var
  d:TDateTime;                              
  sErr:String;
  m:Integer;
begin
  if SMDO.CheckParamsConnect then begin
    if SMDOFullEnabled then begin
      if FRun then begin
        ShowMessage(PadCStr('Идет процесс ...',40,' '));
      end else begin
        FRun:=true;
        FRunPost:=SUBJ_IN;
        d:=Now;
        try
          fmMain.SMDOReceive(false,true,true,nPost);
        finally
          FRun:=false;
          FRunPost:=0;
        end;
        AddToMemoLog(d);
      end;
    end else begin
      if not SMDO.ActiveAvest
        then ShowMessage('Авест не загружен');
    end;
  end else begin
    SMDO.ShowError;
  end;
end;

//--------------------------------------------------------------------
procedure TfmGurnSMDO.TBItemSendClick(Sender: TObject);
var
  lOk:Boolean;
  slMsg,slPar:TStringList;
  d:TDateTime;
begin
  if TBItemSend.Visible and TBItemSend.Enabled then begin
    if FRun then begin
      ShowMessage(PadCStr('Идет процесс ...',40,' '));
    end else begin
      if Sender is TStringList
        then slMsg:=TStringList(Sender)
        else slMsg:=nil;
      FRun:=true;
      FRunPost:=SUBJ_OUT;      
      d:=Now;
      try
//        Self.Enabled:=false;
        TBItemDelDok.Enabled:=false;
        TBItemAddDok.Enabled:=false;
        TBItemEdit.Enabled:=false;
        TBItemReceive.Enabled:=false;
        TBSubmenuReceive.Enabled:=false;
        TBItemSend.Enabled:=false;
        cbMailType.Enabled:=false;
        cbMsgType.Enabled:=false;
        cbDocStatus.Enabled:=false;
        slPar:=TStringList.Create;
        slPar.Add('SHOWERROR=0');
    //    slPar.Add('TYPERUN=1');
        lOk:=SMDO.SendMail(slMsg,slPar);
        FreeAndNil(slPar);
        {
        if Role.SystemAdmin
          then SMDO.ShowLocalLog(true)
          else if not lOk then SMDO.ShowError;
          }
        if not lOk then SMDO.ShowError;
        AddToMemoLog(d);
    //    RefreshGurnalSMDO;
      finally
//        Self.Enabled:=true;
        FRun:=false;
        FRunPost:=0;
        TBItemDelDok.Enabled:=true;
        TBItemAddDok.Enabled:=true;
        TBItemEdit.Enabled:=true;
        TBItemReceive.Enabled:=true;
        TBSubmenuReceive.Enabled:=true;
        TBItemSend.Enabled:=true;
        cbMailType.Enabled:=true;
        cbMsgType.Enabled:=true;
        cbDocStatus.Enabled:=true;
      end;
      if lOk then begin
        Refresh(true);
      end;
    end;
  end;
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.TimerTimer(Sender: TObject);
var
  lOk:Boolean;
  n,m:Integer;                             
  d:TDateTime;
  sErr:String;
begin
  if TBSubmenuReceive.Visible and TBSubmenuReceive.Enabled then begin
   if not FRun then begin
    GIFAnimator.Animate:=true;
    GIFAnimator.Visible:=true;
    FRun:=true;
    FRunTimer:=true;
    FRunPost:=SUBJ_IN;
    d:=Now;
    n:=0;
    try
      FThreadW:=EnterWorkerThread;
      _WorkedThread_:=true;
      try
  //    n:=GetTickCount;
//        CheckAbort;
//        sleep(30000);
//        CheckAbort;
        n:=fmMain.SMDOReceive(false,false,true,0);
  //    n:=GetTickCount-n;
      finally
        LeaveWorkerThread;
        _WorkedThread_:=false;
        FThreadW:=0;
        FRun:=false;
        FRunTimer:=false;
        FRunPost:=0;
        GIFAnimator.Visible:=false;
        GIFAnimator.Animate:=false;
      end;
    except
      on EExternalAbort do Exit; // Work was aborted by user

    end;
    if n>0 then Refresh(false);
    AddToMemoLog(d);
//    Showmessage(inttostr(n));
   end;
  end;
end;
//--------------------------------------------------------------
function TfmGurnSMDO.getNameProcess:String;
begin
  Result:='';
  if FRunPost=SUBJ_IN then begin
    Result:=PadCStr('Идет процесс получения почты',40,' ');
  end else if FRunPost=SUBJ_OUT then begin
    Result:=PadCStr('Идет процесс отправки почты',40,' ');
  end;
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
begin
  if FRunTimer or (FRunPost>0) then begin
    ShowMessage(getNameProcess);
    CanClose:=false;
  end else begin
    inherited FormCloseQuery(Sender, CanClose);
  end;
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.FormResize(Sender: TObject);
begin
  inherited;
  GIFAnimator.Left:=ClientWidth-30;
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.ArxivEML(sFile:String; sGUID:String; nSubjType:Integer);
var
  strPath:String;
begin
  if nSubjType=SUBJ_OUT
    then sGUID:='OUT_'+sGUID
    else sGUID:='IN_'+sGUID;
  if FileExists(SMDO.GetPathEML+sGUID+'.eml') then begin
    strPath:=ExtractFilePath(Application.ExeName)+'Export\';
    ForceDirectories(strPath);
    ClearDir(strPath,false);
    Zip.FileName := strPath+sFile;
    Zip.BaseDir  := SMDO.GetPathEML;
    Zip.OpenArchive(fmCreate);
    Zip.AddFiles(sGUID+'.eml');
    Zip.CloseArchive;
    ShellExecute(Application.Handle, PChar('explore'), PChar(strPath), nil, nil, SW_SHOWNORMAL);
  end else begin
    PutError('Не найлен файл '+sGUID+'.EML');
  end;
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.Event_CreateArxivEML(Sender: TObject);
var
  sFile,sGUID:String;
begin
  sGUID:=Query.FieldByName('MSG_ID').AsString;
  if (Query.FieldByName('ID').AsString<>'') and (sGUID<>'') then begin
    sFile:='EML_'+Query.FieldByName('ID').AsString+'.zip';
    ArxivEML(sFile,sGUID,Query.FieldByName('SUBJ_TYPE').AsInteger);
  end;
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.Event_OpenXML(Sender: TObject);
var
  sPath,sMask,sFile,sFileS,sGUID:String;
  SearchRec:TSearchRec;
  lOk:Boolean;
begin
  sGUID:=Query.FieldByName('MSG_ID').AsString;
  if (Query.FieldByName('MSG_TYPE').AsInteger=MSG_TYPE_A)
    then sMask:='ack'
    else sMask:='data';
  sFile:=sGUID+'_'+sMask+'.xml';
  if FileExists(SMDO.GetPathAttach(0,Query.FieldByName('ID').AsInteger)+sFile) then begin
    ShellExecute(Application.Handle, nil, PChar(SMDO.GetPathAttach(0,Query.FieldByName('ID').AsInteger)+sFile), nil, nil, SW_SHOWNORMAL);
  end else begin
    if FileExists(SMDO.GetPathXML('')+sFile) then begin
      ShellExecute(Application.Handle, nil, PChar(SMDO.GetPathXML('')+sFile), nil, nil, SW_SHOWNORMAL);
    end else begin;
      sFileS:='';
      sPath:=SMDO.GetPathAttach(0,Query.FieldByName('ID').AsInteger);
      lOk:=FindFirst(sPath+'*.xml', faAnyFile, SearchRec) = 0;
      if lOk then begin
        sFileS:=SearchRec.Name;
      end;
      FindClose(SearchRec);
      if (sFileS<>'') and FileExists(sPath+sFileS) then begin
        ShellExecute(Application.Handle, nil, PChar(sPath+sFileS), nil, nil, SW_SHOWNORMAL);
      end else begin
        PutError('Файл "'+sFile+'" не найден.');
      end;
    end;  
  end;
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.Event_CheckETSP(Sender: TObject);
var
  sFileName, sSignature, sSignInfo:String;
begin
  SMDO.VerifySignFile(sFileName, sSignature, sSignInfo, true)

end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.Event_ViewLog(Sender: TObject);
//var
//  sl:TStringList;
//  i:Integer;
begin
//  sl:=TStringList.Create;
//  sl.LoadFromFile(NameFromExe('smdo.log'));
//  for i:=sl.Count-1 downto 0 do begin
//  end;
//  EditMe
//  MemoWrite(get)
//  MemoRead(NameFromExe('smdo.log'), )
  ViewDOSFileEx( NameFromExe('smdo.log'), false, 'Просмотр Log-файла' );
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.Event_ViewMsgList(Sender: TObject);
var
  l:Boolean;
  n:Integer;
begin
  if FRun then begin                                                                                           
    ShowMessage(PadCStr('Идет процесс ...',40,' '));
  end else begin
    n:=-1;
    FRun:=true;
    l:=TBSubmenuReceive.Enabled;
    TBSubmenuReceive.Enabled:=false;
    try
      fmMsgList:=TfmMsgList.Create(nil);
      if fmMsgList.ShowModal=mrOk then begin
        n:=fmMsgList.FReceive;
      end;
      FreeAndNil(fmMsgList);
    finally
      FRun:=false;
      TBSubmenuReceive.Enabled:=l;
    end;
    Application.ProcessMessages;
    if n>0 then begin
      ReceiveMailClick(Sender, n);
    end;
  end;
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.TBItemMsgListClick(Sender: TObject);
begin
  Event_ViewMsgList(Sender);
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.N3Click(Sender: TObject);
var
  sMask,sFile,sGUID:String;
begin
  sGUID:=tbSMDOPost.FieldByName('MSG_ID').AsString;
  sMask:='ack';
//  if (tbSMDOPost.FieldByName('MSG_TYPE').AsInteger=MSG_TYPE_A)
//    then sMask:='ack'
//    else sMask:='data';
  sFile:=sGUID+'_'+sMask+'.xml';
  if FileExists(SMDO.GetPathXML('')+sFile) then begin
    ShellExecute(Application.Handle, nil, PChar(SMDO.GetPathXML('')+sFile), nil, nil, SW_SHOWNORMAL);
  end else begin;
    PutError('Файл "'+sFile+'" не найден.');
  end;
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnSMDO.Event_CreateCopyDok(Sender: TObject);
begin
  if (Query.FieldByName('MSG_TYPE').AsInteger<>MSG_TYPE_A) and
     (Query.FieldByName('SUBJ_TYPE').AsInteger=SUBJ_OUT) then begin
    CopySMDODoc(Query.FieldByName('ID').AsInteger,false,'');
    { !!! PARENT_ID   getNewID

      dsTask.FieldByName('POST_ID').AsInteger:=FieldByName('POST_ID').AsInteger;
      dsTask.FieldByName('TASK_ID').AsInteger:=FieldByName('TASK_ID').AsInteger;

      tbFilesPOST_ID.AsInteger:=FieldByName('POST_ID').AsInteger;;
      tbFilesPARENT_ID.AsInteger:=FieldByName('PARENT_ID').AsInteger;;

      tbMensPOST_ID.AsInteger:=FieldByName('POST_ID').AsInteger;;
      tbMensPARENT_ID.AsInteger:=FieldByName('PARENT_ID').AsInteger;;

    }
    // !!! копирование прикрепленных файлов !!!
    FullRefresh;
  end;
end;

//--------------------------------------------------------------
procedure TfmGurnSMDO.miDelETSP(Sender: TObject);
begin
  if (Query.FieldByName('ID').AsString<>'') then begin
    dmBase.WorkQuery.SQL.Text:='UPDATE SMDOFile set signature='''', signinfo='''' WHERE post_id='+Query.FieldByName('ID').AsString;
    dmBase.WorkQuery.ExecSQL;
    Refresh(false);
    {
    if dmBase.SMDOPost.Locate('ID', Query.FieldByName('ID').AsString, []) then begin
      dmBase.SMDOPost.Edit;
      dmBase.SMDOPost.FieldByName('SENT').AsInteger:=0;
      dmBase.SMDOPost.FieldByName('DTSTAMP').AsDateTime:=Now;
      dmBase.SMDOPost.Post;
    end;
    }
  end;
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.Event_ClearSend(Sender: TObject);
begin
  miClearSendClick(nil);
end;
//-----------------------------------------------------------------
procedure TfmGurnSMDO.miClearSendClick(Sender: TObject);
var
  sID,sSQL,sMsgID,sNewMsgID:String;
begin
  if (Query.FieldByName('ID').AsString<>'') and (Query.FieldByName('MSG_ID').AsString<>'') then begin
    if (Query.FieldByName('SUBJ_TYPE').AsInteger=SUBJ_OUT) and SMDO.MsgIsDoc( Query.FieldByName('MSG_TYPE').AsInteger ) then begin
      sID:=Query.FieldByName('ID').AsString;
      sMsgID:=Query.FieldByName('MSG_ID').AsString;
      sNewMsgID:=getGUID(false);
      if Problem('Отметить текущее сообщение как неотправленное ?') then begin
        sSQL:='UPDATE SMDOPost set sent=0, subj_error=false, datepost=null, msg_id='+QStr(sNewMsgID)+' WHERE id='+sID+';';
        if Problem('Удалить все полученные для сообщения уведомления ?') then begin
          sSQL:=sSQL+#13#10+'DELETE FROM SMDOPost WHERE ack_msg_id='+QStr(sMsgID)+' and msg_type=0;';  // !!! + все уведомления сообщения !!!
        end else begin
          sSQL:=sSQL+#13#10+'UPDATE SMDOPost set ack_msg_id='+QStr(sNewMsgID)+' WHERE ack_msg_id='+QStr(sMsgID)+' and msg_type=0;';  // !!! + все уведомления сообщения !!!
        end;
        dmBase.WorkQuery.SQL.Text:=sSQL;
        try
          dmBase.WorkQuery.ExecSQL;
          Refresh(false);
        except
          on E:Exception do begin
            PutError(E.Message,self);
          end;
        end;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------
procedure TfmGurnSMDO.RunTest;
begin
  SMDO.FTmpPath:=CheckSleshN(CreateTmpPath(1));
  SMDO.SMDOtoXML(Query.FieldByName('ID').AsInteger);
  SMDO.FTmpPath:=CheckSleshN(CreateTmpPath(0));
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.FormDestroy(Sender: TObject);
begin
  if (fmMain<>nil) and Assigned(fmMain) then begin
    try
      fmMain.acSMDOEditParams.Enabled:=true;
    except
    end;
  end;
  inherited;
end;
//--------------------------------------------------------------
procedure TfmGurnSMDO.FormActivate(Sender: TObject);
begin
  inherited;
  if (fmMain<>nil) and Assigned(fmMain) then begin
    try
      fmMain.acSMDOEditParams.Enabled:=false;
    except
    end;
  end;
end;
//-------------------------------------------------------------------------
procedure TfmGurnSMDO.FullRefresh(lReopen: Boolean; strOrderBy,  ID: String);
begin
  tbSMDOPost.Close;
  inherited FullRefresh(lReopen, strOrderBy, ID);
  tbSMDOPost.Open;
  tbSMDOPost.First;
end;
//-----------------------------------------------------------------------------------
procedure TfmGurnSMDO.Refresh(lFull: Boolean; ID: String);
begin
  tbSMDOPost.Close;
  inherited Refresh(lFull, ID);
  tbSMDOPost.Open;
  tbSMDOPost.First;
end;
//-----------------------------------------------------------------------------------
procedure TfmGurnSMDO.AddToMemoLog(d:TDateTime);
var
  i:Integer;
begin
  if (SMDO.FLocalLog.Count>0) and (d>0) then begin
    if Copy(SMDO.FLocalLog.Strings[0],1,3)='===' then begin
      SMDO.FLocalLog.Strings[0]:=FormatDateTime('dd.mm.yyyy hh:nn:ss',d); //+' '+SMDO.FLocalLog.Strings[0];
    end;
  end;
  for i:=0 to SMDO.FLocalLog.Count-1 do begin
    mLog.Lines.Add(SMDO.FLocalLog.Strings[i]);
  end;
end;
//-----------------------------------------------------------------------------------
procedure TfmGurnSMDO.TBItemLogClick(Sender: TObject);
var
  i:Integer;
begin
  TBItemLog.Checked:=not TBItemLog.Checked;
  if TBItemLog.Checked then begin
    mLog.Align:=alClient;
//    mLog.Clear;
//    for i:=0 to SMDO.FLocalLog.Count-1 do begin
//      mLog.Lines.Add(SMDO.FLocalLog.Strings[i]);
//    end;
    mLog.Visible:=true;
    GridUvd.Visible:=false;
    vchDBText1.Visible:=false;
  end else begin
    mLog.Visible:=false;
    GridUvd.Visible:=true;
    vchDBText1.Visible:=true;
  end;
  UpdateGbInfo;
end;

//--------------------------------------------------------------------------
procedure TfmGurnSMDO.CreateMailing(nType:Integer);
var
  sl:TStringList;
  s,sFilter:String;
  i,n:Integer;
begin
  if (Query.FieldByName('SUBJ_TYPE').AsInteger=2) and (Query.FieldByName('SENT').AsInteger=0) then begin
    s:='Создать рассылку для пользователей ';
    case nType of
      0 : begin
            s:=s+'ЛАИС и ЛАИС.СМДО ?';
            sFilter:='';
//  typesedrowid='2ec937bf-b89a-4d01-b4d3-355e220e32ff'
          end;
      1 : begin
            s:=s+'ЛАИС ?';
            sFilter:='and at(''управл'',name)=0 and (at(''сель'',name)>0 or at(''посел'',name)>0) and at(''испол'',name)>0';
//  typesedrowid='2ec937bf-b89a-4d01-b4d3-355e220e32ff' and (at('управл',name)=0 and (at('сель',name)>0 or at('посел',name)>0) and at('испол',name)>0)
          end;
      2 : begin
            s:=s+'ЛАИС.СМДО ?';
            sFilter:=' and not (at(''управл'',name)=0 and (at(''сель'',name)>0 or at(''посел'',name)>0) and at(''испол'',name)>0)';
//  typesedrowid='2ec937bf-b89a-4d01-b4d3-355e220e32ff' and not (at('управл',name)=0 and (at('сель',name)>0 or at('посел',name)>0) and at('испол',name)>0)
          end;
    end;
    if Problem(s) then begin
      OpenMessage(PadCStr('Создание рассылки ...',40,' '),'',10);
      sl:=TStringList.Create;
      try
        with dmBase.SMDOSprOrg do begin
          Filter:='typesedrowid='+QStr(SEDVALUE_LAIS)+sFilter;
          Filtered:=true;
          s:='';
          i:=0;
          n:=0;
          while not Eof do begin
            s:=s+FieldByName('SMDOCODE').AsString+',';
            Inc(i,1);
            Inc(n,1);
            if i>95 then begin
              sl.Add(Copy(s,1,Length(s)-1));
              s:='';
              i:=0;
            end;
            Next;
          end;
          if s<>'' then sl.Add(Copy(s,1,Length(s)-1));
          Filtered:=false;
          Filter:='';
        end;
  //        i:=0;
  //        s:=inttostr(n)+#13#10+inttostr(sl.Count)+#13#10+sl.Strings[i];
  //        EditMemo(s,'');
        for i:=0 to sl.Count-1 do begin
          CopySMDODoc(Query.FieldByName('ID').AsInteger, false, sl.Strings[i]);
        end;
      finally
        sl.Free;
        CloseMessage;
        FullRefresh(false);
      end;
    end;
  end else begin
    PutError('Документ не подходит по условию: исходящий,готов к отправке,не отправлен.',self);
  end;
end;

//--------------------------------------------------------------------------
procedure TfmGurnSMDO.TBSubmenuMailingClick(Sender: TObject);
begin
  CreateMailing(0);
end;

procedure TfmGurnSMDO.TBItemMailing1Click(Sender: TObject);
begin
  CreateMailing(1);
end;

procedure TfmGurnSMDO.TBItemMailing2Click(Sender: TObject);
begin
  CreateMailing(2);
end;

end.


