unit fChoiceNomen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, kbmMemTable, TB2Item, TB2Dock, TB2Toolbar, ImgList,
  dBase, FuncPr, uProjectAll,
  StdCtrls, Mask, DBCtrlsEh, TB2ToolWindow;

type
  TfmChoiceNomen = class(TForm)
    ImageList: TImageList;
    TBDock1: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemRefresh: TTBItem;
    TBItemOk: TTBItem;
    TBItemCancel: TTBItem;
    tbSubMenuProp: TTBSubmenuItem;
    TBItemCheckKv: TTBItem;
    TBItemReloadLic: TTBItem;
    TBItemClear: TTBItem;
    tbSpr: TkbmMemTable;
    Grid: TDBGridEh;
    DataSource: TDataSource;
    tbSprID: TIntegerField;
    tbSprPARENT_ID: TIntegerField;
    tbSprNAME: TStringField;
    tbSprIS_NODE: TBooleanField;
    tbSprDATE_BEGIN: TDateField;
    tbSprDATE_END: TDateField;
    tbSprFILE_IND: TStringField;
    tbSprFILE_IND1: TIntegerField;
    tbSprFILE_IND2: TIntegerField;
    TBToolWindowSeek: TTBToolWindow;
    TBControlItem1: TTBControlItem;
    lbSeek: TLabel;
    edSeek: TDBEditEh;
    Label1: TLabel;
    procedure edSeekChange(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure TBItemOkClick(Sender: TObject);
    procedure TBItemCancelClick(Sender: TObject);
    procedure TBItemRefreshClick(Sender: TObject);
    procedure edSeekKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
  private
    { Private declarations }
    FFilter:String;
    FDefFilter:String;
    FCheckDate:Integer;
    FAddFolder:Boolean;
    FChFolder:Boolean;
  public
    { Public declarations }
    function PrepareTable:Boolean;
    procedure FilterRecordSpr1(DataSet: TDataSet; var Accept: Boolean);
    procedure FilterRecordSpr2(DataSet: TDataSet; var Accept: Boolean);
  end;

  function ChoiceNomen(nTypeCheck:Integer; lAddFolder:Boolean; lChFolder:Boolean; sFilter:String):Integer;

var
  fmChoiceNomen: TfmChoiceNomen;
  fmChoiceNomen_Refresh:Boolean;


implementation

{$R *.dfm}

function ChoiceNomen(nTypeCheck:Integer; lAddFolder:Boolean; lChFolder:Boolean; sFilter:String):Integer;
var
  fm: TfmChoiceNomen;
begin
  Result:=0;
//  if fmChoiceNomen=nil then begin
    fm:=TfmChoiceNomen.Create(nil);
//  end else begin
//    fm:=fmChoiceNomen;
//  end;
  fm.FDefFilter:=sFilter;
  fm.FCheckDate:=nTypeCheck;
  fm.FAddFolder:=lAddFolder;
  fm.FChFolder:=lChFolder;
  fm.edSeek.OnChange:=nil;
  fm.edSeek.Text:='';
  fm.PrepareTable;
  fm.edSeek.OnChange:=fm.edSeekChange;
  if fm.ShowModal=mrOk then begin
    Result:=fm.tbSprID.AsInteger;
  end;
  fm.Free;
end;

{ TfmChoiceNomen }

function TfmChoiceNomen.PrepareTable: Boolean;
var
  sInd,s,s1,s2:String;
  nID,n:Integer;
  dNow,dBegin,dEnd:TDateTime;
  lOk:Boolean;
begin
  Result:=false;
  if not tbSpr.Active then tbSpr.Open;
//  if fmChoiceNomen_Refresh or (tbSpr.RecordCount=0) then begin
  if (tbSpr.RecordCount=0) then begin
//  showmessage('refresh');
    fmChoiceNomen_Refresh:=false;
    with dmBase.WorkQuery do begin
      if FDefFilter<>'' then s:='WHERE '+FDefFilter else s:='';
      SQL.Text:='SELECT * FROM SprDocFileList '+s+' ORDER BY FILE_IND';
      Open;
      tbSpr.DisableControls;
      try
        tbSpr.EmptyTable;
        while not Eof do begin
          nID:=FieldByName('ID').AsInteger;
          n:=dmBase.GetDateDelo(0, nID, dBegin, dEnd, s);
          if (FieldByName('IS_NODE').AsInteger=1) and not FAddFolder   // если папка и папки не включаем
            then lOk:=false
            else lOk:=true;
          if lOk then begin
            if FCheckDate=1 then begin
              dNow:=Date;
              if n>0 then begin
                if (dBegin>0) and (dNow<dBegin) then lOk:=false;
                if (dEnd>0) and (dNow>dEnd) then lOk:=false;
              end;
            end else if FCheckDate=2 then begin   // ищем только закрытые, с не пустой датой открытия и закрытия
              if n<2 then lOk:=false;
            end;
          end;
          if lOk then begin
            tbSpr.Append;
            tbSprID.AsInteger:=nID;
            tbSprPARENT_ID.AsInteger:=FieldByName('PARENT_ID').AsInteger;
            sInd:=Trim(FieldByName('FILE_IND').AsString);
            tbSprFILE_IND.AsString:=sInd;
            tbSprNAME.AsString:=FieldByName('NAME').AsString;
            tbSprIS_NODE.AsBoolean:=(FieldByName('IS_NODE').AsInteger=1);
            if (dEnd>0) then begin
              s:=' - '+DatePropis(dEnd,3)+')';
              if (dBegin>0)
                then s:='('+DatePropis(dEnd,3)+s
                else s:='(...'+DatePropis(dEnd,3)+s;
            end;
            n:=Pos('-', sInd);
            if n>0 then begin
              s1:=Trim(Copy(sInd,1,n-1));
              s2:=Trim(Copy(sInd,n+1,Length(sInd)));
            end else begin
              s1:=sInd;
              s2:='0';
            end;
            KeepChars(s1,'0123456789');   // оставить только цифры
            if s1='' then s1:='0';
            KeepChars(s2,'0123456789');
            if s2='' then s2:='0';
            tbSprFILE_IND1.AsInteger:=StrToIntDef(s1,0);
            tbSprFILE_IND2.AsInteger:=StrToIntDef(s2,0);
            tbSpr.Post;
            Result:=true;
          end;
          Next;
        end;
      finally
        Close;
        tbSpr.EnableControls;
      end;
    end;
  end;
  tbSpr.First;
end;

procedure TfmChoiceNomen.FilterRecordSpr1(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept:=( Copy(tbSprFILE_IND.AsString,1,Length(FFilter))=FFilter );
end;
procedure TfmChoiceNomen.FilterRecordSpr2(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept:=( ANSIUpperCase(Copy(tbSprNAME.AsString,1,Length(FFilter)))=ANSIUpperCase(FFilter) ) or
          ( Pos(' '+ANSIUpperCase(FFilter), ANSIUpperCase(tbSprNAME.AsString))>0 );
end;

procedure TfmChoiceNomen.edSeekChange(Sender: TObject);
begin
  FFilter:=Trim(edSeek.Text);
  tbSpr.DisableControls;
  try
  if FFilter='' then begin
    tbSpr.Filter:='';
    tbSpr.Filtered:=false;
  end else begin
    tbSpr.Filtered:=false;
    tbSpr.Filter:='';
    if Pos(Copy(FFilter,1,1),'0123456789')>0 then begin
//      tbSpr.Filter:='FILE_IND LIKE '+''''+s+'*'+'''';
//      tbSpr.Filter:='Substring(FILE_IND,1,'+InttoStr(Length(s))+')='+''''+s+'''';
      tbSpr.OnFilterRecord:=FilterRecordSpr1;
    end else begin
      tbSpr.OnFilterRecord:=FilterRecordSpr2;
//      Filter:='Substring(Trim(Upper(Name)),1,'+InttoStr(Length(s))+')='+''''+ANSIUppercase(s)+'''';
//      tbSpr.Filter:='NAME LIKE '+''''+'*'+s+'*'+'''';
    end;
    tbSpr.Filtered:=true;
    tbSpr.First;
  end;
  finally
    tbSpr.EnableControls;
  end;
//  Label1.Caption:='"'+tbSpr.Filter+'"';
end;

procedure TfmChoiceNomen.GridGetCellParams(Sender: TObject;  Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
begin
  if tbSprFILE_IND2.AsInteger=0 then begin
    Background:=clInfoBk;
  end;
end;

procedure TfmChoiceNomen.FormCreate(Sender: TObject);
begin
  FFilter:='';
  FCheckDate:=1;
end;

procedure TfmChoiceNomen.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Key=VK_RETURN) and (Shift=[]) then begin
    TBItemOkClick(Sender);
    Key := 0;
  end else if (Key=VK_ESCAPE) and (Shift=[]) then begin
    TBItemCancelClick(Sender);
    Key := 0;
  end else if (Key=VK_F4) and (Shift=[]) then begin

  end;
end;
procedure TfmChoiceNomen.edSeekKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Key=VK_DOWN) and (Shift=[]) then begin
    Key:=0;
    ActiveControl:=Grid;
//    BackWard:=0;
//    Perform(WM_NEXTDLGCTL, 0{BackWard}, 0);
  end;
end;

procedure TfmChoiceNomen.TBItemOkClick(Sender: TObject);
begin
  if not FChFolder and tbSprIS_NODE.AsBoolean then begin
    Beep;
    PutError(PadCStd('Папку выбирать нельзя.'));
  end else begin
    ModalResult:=mrOk;
  end;
end;

procedure TfmChoiceNomen.TBItemCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmChoiceNomen.TBItemRefreshClick(Sender: TObject);
begin
  fmChoiceNomen_Refresh:=true;
  PrepareTable;
end;


initialization
  fmChoiceNomen:=nil;
  fmChoiceNomen_Refresh:=true;
finalization
  FreeAndNil(fmChoiceNomen);
end.
