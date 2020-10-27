unit fMsgList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uSmdo, dbFunc,
  DB, kbmMemTable, StdCtrls, Grids, DBGridEh, Dialogs, TB2Item, TB2Dock, FuncPr, fWarning, mPermit,
  TB2Toolbar;

type
  TfmMsgList = class(TForm)
    GridMsg: TDBGridEh;
    ds: TDataSource;
    MsgList: TkbmMemTable;
    MsgListSubject: TStringField;
    MsgListSize: TIntegerField;
    MsgListFrom: TStringField;
    MsgListDate: TDateField;
    MsgListStatus: TIntegerField;
    MsgListRun: TIntegerField;
    Button1: TButton;
    MsgListUID: TStringField;
    MsgListnomer: TIntegerField;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItemRun: TTBItem;
    TBItemDelAll: TTBItem;
    TBItemBack: TTBItem;
    TBItemDel: TTBItem;
    TBItemExit: TTBItem;
    TBItemNew: TTBItem;
    TBItemLoad: TTBItem;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridMsgGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemNewClick(Sender: TObject);
    procedure TBItemDelClick(Sender: TObject);
    procedure TBItemDelAllClick(Sender: TObject);
    procedure TBItemBackClick(Sender: TObject);
    procedure TBItemRunClick(Sender: TObject);
    procedure TBItemExitClick(Sender: TObject);
    procedure TBItemLoadClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FRun:Boolean;
    FReceive:Integer;
    function CheckIzm:Boolean;
    function CreateIzm : Boolean;
    procedure LoadStat;
    procedure CheckEnabled(lSet:Boolean);
  end;

var
  fmMsgList: TfmMsgList;

implementation

uses fMain;

{$R *.dfm}

const
  ST_READ=1;
  ST_NEW=0;
  RUN_NEW=1;
  RUN_DEL=2;

procedure TfmMsgList.Button1Click(Sender: TObject);
var
  i:Integer;
  s:String;
begin
  for i:=0 to 9 do begin
    MsgList.Append;
    s:=IntToStr(i);
    MsgListRun.AsInteger:=0;
    MsgListNomer.AsInteger:=i+20;
    if Odd(MsgListNomer.AsInteger)
      then MsgListStatus.AsInteger:=0
      else MsgListStatus.AsInteger:=1;
    MsgListSubject.AsString:=StringOfChar(s[1], 50);
    MsgListDate.AsDateTime:=Now;
    MsgListSize.AsInteger:=i+1*1000;
    MsgList.Post;
  end;
end;

procedure TfmMsgList.Button2Click(Sender: TObject);
begin
  if not CheckIzm and Problem('Получить письмо ['+MsgListnomer.AsString+'] ?') then begin
    FReceive:=MsgListnomer.AsInteger;
    ModalResult:=mrOk;
  end;
end;

procedure TfmMsgList.FormCreate(Sender: TObject);
begin
  CheckEnabled(false);
  Button1.Visible:=Role.SystemAdmin;
  Button2.Visible:=Role.SystemAdmin;
  FRun:=false;
  FReceive:=-1;
  if not MsgList.Active
    then MsgList.Open;
end;

procedure TfmMsgList.GridMsgGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (Column.FieldName='STATUS') and (MsgListStatus.AsInteger=0)
    then AFont.Style:=[fsBold];
  if MsgListRun.AsInteger>0
    then AFont.Color:=clBlue;
end;

procedure TfmMsgList.TBItemNewClick(Sender: TObject);
begin
  if (MsgListnomer.AsInteger>0) and (MsgListStatus.AsInteger=ST_READ) then begin
    EditDataSet(msgList);
    if MsgListRun.AsInteger=RUN_NEW
      then MsgListRun.AsInteger:=0
      else MsgListRun.AsInteger:=RUN_NEW;
    PostDataSet(msgList);
  end;
end;

procedure TfmMsgList.TBItemDelClick(Sender: TObject);
var
  lOk:Boolean;
begin
  if MsgListNomer.AsInteger>0 then begin
    if (MsgListStatus.AsInteger=ST_NEW) and (MsgListRun.AsInteger=0) then begin
      lOk:=OkWarning('Вы хотите удалить из почтового ящика'#13#10+'неполученное сообщение +ДА');
    end else begin
      lOk:=true;
    end;
    if lOk then begin
      EditDataSet(msgList);
      if MsgListRun.AsInteger=RUN_DEL
        then MsgListRun.AsInteger:=0
        else MsgListRun.AsInteger:=RUN_DEL;
      PostDataSet(msgList);
    end;
  end;
end;

procedure TfmMsgList.TBItemDelAllClick(Sender: TObject);
var
  sBookMark:String;
begin
  if Problem('Отметить все полученные сообщения для удаления ?',mtConfirmation,self) then begin
    MsgList.DisableControls;
    sBookMark:=MsgList.Bookmark;
    MsgList.First;
    while not MsgList.Eof do begin
      if MsgListStatus.AsInteger=ST_READ then begin
        MsgList.Edit;
        MsgListRun.AsInteger:=RUN_DEL;
        MsgList.Post;
      end;
      MsgList.Next;
    end;
    MsgList.Bookmark:=sBookMark;
    MsgList.EnableControls;
  end;
end;

procedure TfmMsgList.CheckEnabled(lSet:Boolean);
begin
  TBItemRun.Enabled:=lSet;
  TBItemDelAll.Enabled:=lSet;
  TBItemDel.Enabled:=lSet;
  TBItemBack.Enabled:=lSet;
  TBItemNew.Enabled:=lSet;
end;

function TfmMsgList.CheckIzm:Boolean;
var
  sBookMark:String;
begin
  Result:=false;
  MsgList.DisableControls;
  sBookMark:=MsgList.Bookmark;
  MsgList.First;
  while not MsgList.Eof do begin
    if MsgListRun.AsInteger>0 then begin
      Result:=true;
      break;
    end;
    MsgList.Next;
  end;
  MsgList.Bookmark:=sBookMark;
  MsgList.EnableControls;
end;

procedure TfmMsgList.TBItemBackClick(Sender: TObject);
begin
  if CheckIzm then begin
    if Problem(PadCStr('Отменить все действия ?',40,' '),mtConfirmation,self) then begin
      MsgList.DisableControls;
      MsgList.First;
      while not MsgList.Eof do begin
        MsgList.Edit;
        MsgListRun.AsInteger:=0;
        MsgList.Post;
        MsgList.Next;
      end;
      MsgList.First;
      MsgList.EnableControls;
    end;
  end else begin
    ShowMessage('Не создано ни одного действия');
  end;
end;

procedure TfmMsgList.TBItemRunClick(Sender: TObject);
begin
  if CheckIzm then begin
    if Problem('Выполнить отмеченные действия ?') then begin
      CreateIzm;
//      FRun:=true;
//       ModalResult:=mrOk;
//      end;
    end;
  end else begin
    ModalResult:=mrOk;
  end;
end;

procedure TfmMsgList.TBItemExitClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmMsgList.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
begin
  if (ModalResult=mrCancel) and CheckIzm then begin
    if Problem('Отказаться от отмеченных действий ?') then begin
      CanClose:=true;
    end else begin
      CanClose:=false;
    end;
  end;
end;
//-----------------------------------------------------------------------
function TfmMsgList.CreateIzm:Boolean;
var
  sBookMark:String;
  slPar:TStringList;
  lOk:Boolean;
  nCount,nCountErr,nCountUvd:Integer;
begin
  Result:=true;
  MsgList.DisableControls;
  MsgList.First;
  while not MsgList.Eof do begin
    if (MsgListRun.AsInteger=RUN_NEW) and (MsgListUID.AsString<>'') then begin
      SMDO.SeekUID(MsgListUID.AsString, true);
      if not SMDO.SeekUID(MsgListUID.AsString, false) then begin
        MsgList.Edit;
        MsgListRun.AsInteger:=0;
        MsgListStatus.AsInteger:=ST_NEW;
        MsgList.Post;
      end;
    end;
    MsgList.Next;
  end;
  MsgList.First;
  MsgList.EnableControls;
  // есть отмеченные сообщения для удаления
  if MsgList.Locate('RUN', RUN_DEL, []) then begin
    slPar:=TStringList.Create;
    slPar.Add('SHOWERROR=0');
    slPar.AddObject('DELETE=1', fmMsgList.MsgList);
    lOk:=SMDO.ReceiveMail(slPar,nCount,nCountErr,nCountUvd,0);
    if lOk then begin

    end else begin
      PutError(SMDO.LastErrorSMDO, self);
      Result:=false;
    end;
    slPar.Free;
    LoadStat;
  end;
end;

procedure TfmMsgList.TBItemLoadClick(Sender: TObject);
begin
  LoadStat;
end;

procedure TfmMsgList.LoadStat;
var
  slPar:TStringList;
  lOk:Boolean;
  nCount,nCountErr,nCountUvd:Integer;
begin
  MsgList.EmptyTable;
  TBItemLoad.Enabled:=false;
  slPar:=TStringList.Create;
  try
    slPar.Add('SHOWERROR=0');
    slPar.AddObject('HEADERS=1', fmMsgList.MsgList);
    lOk:=SMDO.ReceiveMail(slPar,nCount,nCountErr,nCountUvd,0);
    if lOk then begin
      if MsgList.RecordCount=0 then begin
        TBItemLoad.Enabled:=true;
        ShowMessageCont('Нет сообщений', self);
      end else begin
        MsgList.First;
        CheckEnabled(true);
        TBItemLoad.Enabled:=false;
      end;
    end else begin
      PutError(SMDO.LastErrorSMDO, self);
      TBItemLoad.Enabled:=true;
    end;
  finally
    slPar.Free;
  end;
end;


end.
