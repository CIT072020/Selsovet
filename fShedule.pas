unit fShedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uTypes, FuncPr, MetaTask,
  Dialogs, fSimpleDialog, DB, Grids, DBGridEh, kbmMemTable, StdCtrls, Buttons, ExtCtrls;

type
  TfmShedule = class(TfmSimpleDialog)
    tbShedule: TkbmMemTable;
    tbSheduleDAY: TIntegerField;
    tbSheduleTIME1: TTimeField;
    tbSheduleTIME2: TTimeField;
    Grid: TDBGridEh;
    DataSource1: TDataSource;
    tbSheduleCOMM: TStringField;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FRunVigr:Boolean;
    FTask:Integer;
    function Read(var arrDate:TArrDate):Boolean;
    function Write:Boolean;
  end;

  function EditShedule(nTaskID:Integer; var arrDate:TArrDate; lTimer:Boolean):Boolean;
  function ReadShedule(nTaskID:Integer; var arrDate:TArrDate):Boolean;


implementation

uses dBase, DateUtils;

{$R *.dfm}
//-------------------------------------------------
function ReadShedule(nTaskID:Integer; var arrDate:TArrDate):Boolean;
var
  fmShedule: TfmShedule;
begin
  fmShedule:=TfmShedule.Create(nil);
  fmShedule.Read(arrDate);
  Result:=(Length(arrDate)>0);
  fmShedule.Free;
end;

//-------------------------------------------------
function EditShedule(nTaskID:Integer; var arrDate:TArrDate; lTimer:Boolean):Boolean;
var
  fmShedule: TfmShedule;
begin
  Result:=lTimer;   // текущее значение TTimer.Enabled
  fmShedule:=TfmShedule.Create(nil);
  fmShedule.Read(arrDate);
  if lTimer then begin
    fmShedule.Label1.Caption:='Таймер выгрузки ЗАПУЩЕН';
  end else begin
    fmShedule.Label1.Caption:='Таймер выгрузки не запущен';
  end;
  if fmShedule.ShowModal=mrOk then begin
    fmShedule.Write;
    fmShedule.Read(arrDate);
    Result:=(Length(arrDate)>0);
  end;
  fmShedule.Free;
end;

procedure TfmShedule.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  FRunVigr:=GlobalTask.ParamAsBoolean('AUTO_VIGR_OCH');
  for i:=1 to 31 do begin
    Grid.Columns[0].PickList.Add(inttostr(i));
    Grid.Columns[0].KeyList.Add(inttostr(i));
  end;
//
end;

function TfmShedule.Read(var arrDate:TArrDate): Boolean;
var
  s:String;
  arr:TArrStrings;
  d :TDateTime;
  n, nDay:Integer;
  nHour, nMin, nSec, nMSec:Word;
begin
  SetLength(arrDate,0);
  Result:=true;
  dmBase.tbSimpleProp.IndexName := 'PR_KEY';
  dmBase.tbSimpleProp.SetRange([_TypeObj_Shedule,FTask],[_TypeObj_Shedule,FTask]);
  while not dmBase.tbSimpleProp.Eof do begin
    s:=dmBase.tbSimpleProp.FieldByName('POKAZ').AsString;
    if s<>'' then begin
      StrToArr(s,arr,';',false);
      SetLength(arr,3);
      with tbShedule do begin
        Append;
        nDay:=StrToInt(arr[0]);
        FieldByName('DAY').AsInteger:=nDay;
        if Copy(arr[1],1,1)='-' then begin
          FieldByName('TIME1').AsString:='';
        end else begin
          arr[1]:=StringReplace(arr[1], ':', TimeSeparator, []);
          FieldByName('TIME1').AsDateTime:=StrToTime(arr[1]);
        end;        //  DaysInAMonth
        n:=DaysInAMonth(YearOf(Date), MonthOf(Date));   // количество дней в текущем месяце
        if nDay>n
          then nDay:=n;
        DecodeTime(FieldByName('TIME1').AsDateTime, nHour, nMin, nSec, nMSec);
        d:=EncodeDateTime(YearOf(Date), MonthOf(Date), nDay, nHour, nMin, 0, 0);
        if FRunVigr then begin
          SetLength(arrDate, Length(arrDate)+1);
          arrDate[Length(arrDate)-1]:=d;
        end;
        if Copy(arr[2],1,1)='-' then begin
          FieldByName('TIME2').AsString:='';
        end else begin
          arr[2]:=StringReplace(arr[2], ':', TimeSeparator, []);
          FieldByName('TIME2').AsDateTime:=StrToTime(arr[2]);
        end;
        FieldByName('COMM').AsString := dmBase.tbSimpleProp.fieldByName('VALUE').AsString;
        Post;
      end;
    end;
    dmBase.tbSimpleProp.Next;
  end;
  dmBase.tbSimpleProp.CancelRange;
  {
  s:='#'#13#10;
  for n:=0 to Length(arrDate)-1 do begin
    s:=s+FormatDateTime('dd.mm.yyyy hh:nn', arrdate[n])+#13#10;
  end;
  ShowMessage(s);
  }
end;
//---------------------------------------------------------------
function TfmShedule.Write: Boolean;
var
  s1,s2:String;
begin
  Result:=true;
  dmBase.tbSimpleProp.IndexName := 'PR_KEY';
  try
    dmBase.tbSimpleProp.SetRange([_TypeObj_Shedule,FTask],[_TypeObj_Shedule,FTask]);
    while not dmBase.tbSimpleProp.Eof do begin
      dmBase.tbSimpleProp.Delete;
      dmBase.tbSimpleProp.First;
    end;
  finally
    dmBase.tbSimpleProp.CancelRange;
  end;
  tbShedule.First;
  while not tbShedule.Eof do begin
    with dmBase.tbSimpleProp do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger := _TypeObj_Shedule;
      FieldByName('ID').AsInteger := FTask;
      FieldByName('DATES').AsDateTime := dmBase.GetDateCurrentSost;
      if tbSheduleTIME1.IsNull then begin
        s1:='--:--';
      end else begin
        s1:=FormatDateTime('HH:NN', tbSheduleTIME1.AsDateTime);
        s1:=StringReplace(s1, TimeSeparator, ':', []);
      end;
      if tbSheduleTIME2.IsNull then begin
        s2:='--:--';
      end else begin
        s2:=FormatDateTime('HH:NN', tbSheduleTIME2.AsDateTime);
        s2:=StringReplace(s2, TimeSeparator, ':', []);
      end;
      FieldByName('POKAZ').AsString := PadLStr(tbSheduleDAY.AsString,2,'0')+';'+s1+';'+s2+';';
      FieldByName('VALUE').AsString := tbSheduleCOMM.AsString;
      FieldByName('NVALUE').AsString := '';
      FieldByName('TYPESAVE').AsString := '';
      Post;
    end;
    tbShedule.Next;
  end;
  tbShedule.First;
end;

procedure TfmShedule.btOkClick(Sender: TObject);
var
  lOK:Boolean;
begin
  lOk:=true;
  tbShedule.CheckBrowseMode;
  tbShedule.DisableControls;
  try
    tbShedule.First;
    while not tbShedule.Eof do begin
       if tbSheduleTIME1.IsNull then begin
         PutError('Заполните время');
         lOk:=false;
         break;
       end;
       if tbSheduleDAY.IsNull then begin
         PutError('Заполните день');
         lOk:=false;
         break;
       end;
       tbShedule.Next;
    end;
  finally
    tbShedule.First;
    tbShedule.EnableControls;
  end;
  if lOk then ModalResult:=mrOk;
end;

end.
