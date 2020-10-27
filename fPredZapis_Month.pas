unit fPredZapis_Month;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dBase,
  fPredZapis, uDate, FuncPr, uProjectAll, Dialogs, DB, kbmMemTable, Grids, DBGridEh, StdCtrls, Mask,
  DBCtrlsEh, DBLookupEh, Buttons;

type

  TRecDay = record
    cbDay: TCheckBox;
    dWB: TDBDateTimeEditEh;
    dWE: TDBDateTimeEditEh;
    dOB: TDBDateTimeEditEh;
    dOE: TDBDateTimeEditEh;
  end;
  TArrRecDay = array[1..7] of TRecDay;
  
  TfmPredZapis_Month = class(TForm)
    gbAdmin: TGroupBox;
    Label1: TLabel;
    cbMinTime: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cbMonth1: TComboBox;
    CheckBox1: TCheckBox;
    ed1WB: TDBDateTimeEditEh;
    Label4: TLabel;
    ed1WE: TDBDateTimeEditEh;
    Label5: TLabel;
    Label6: TLabel;
    ed1OB: TDBDateTimeEditEh;
    Label7: TLabel;
    ed1OE: TDBDateTimeEditEh;
    CheckBox2: TCheckBox;
    ed2WB: TDBDateTimeEditEh;
    Label8: TLabel;
    ed2WE: TDBDateTimeEditEh;
    Label9: TLabel;
    Label10: TLabel;
    ed2OB: TDBDateTimeEditEh;
    Label11: TLabel;
    ed2OE: TDBDateTimeEditEh;
    CheckBox3: TCheckBox;
    ed3WB: TDBDateTimeEditEh;
    Label12: TLabel;
    ed3WE: TDBDateTimeEditEh;
    Label13: TLabel;
    Label14: TLabel;
    ed3OB: TDBDateTimeEditEh;
    Label15: TLabel;
    ed3OE: TDBDateTimeEditEh;
    CheckBox4: TCheckBox;
    ed4WB: TDBDateTimeEditEh;
    Label16: TLabel;
    ed4WE: TDBDateTimeEditEh;
    Label17: TLabel;
    Label18: TLabel;
    ed4OB: TDBDateTimeEditEh;
    Label19: TLabel;
    ed4OE: TDBDateTimeEditEh;
    Label20: TLabel;
    cbMonth2: TComboBox;
    CheckBox5: TCheckBox;
    ed5WB: TDBDateTimeEditEh;
    Label21: TLabel;
    ed5WE: TDBDateTimeEditEh;
    Label22: TLabel;
    Label23: TLabel;
    ed5OB: TDBDateTimeEditEh;
    Label24: TLabel;
    ed5OE: TDBDateTimeEditEh;
    CheckBox6: TCheckBox;
    ed6WB: TDBDateTimeEditEh;
    Label25: TLabel;
    ed6WE: TDBDateTimeEditEh;
    Label26: TLabel;
    Label27: TLabel;
    ed6OB: TDBDateTimeEditEh;
    Label28: TLabel;
    ed6OE: TDBDateTimeEditEh;
    CheckBox7: TCheckBox;
    ed7WB: TDBDateTimeEditEh;
    Label29: TLabel;
    ed7WE: TDBDateTimeEditEh;
    Label30: TLabel;
    Label31: TLabel;
    ed7OB: TDBDateTimeEditEh;
    Label32: TLabel;
    ed7OE: TDBDateTimeEditEh;
    Label34: TLabel;
    Label35: TLabel;
    btDown1: TBitBtn;
    btDown3: TBitBtn;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    lbAddDays: TLabel;
    edAddDays: TDBEditEh;
    procedure btDown1Click(Sender: TObject);
    procedure btDown2Click(Sender: TObject);
    procedure btDown3Click(Sender: TObject);
    procedure btDownClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure cbMonth1Change(Sender: TObject);
    procedure cbMonth2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FResult:Boolean;
    FRun:Boolean;
    FCreate:Boolean;
    fm:TfmPredZapis;
    arrRecDay:TArrRecDay;
    aNotWorkTime:TStringList;
    function CheckSave:Boolean;

    function EditModal:Boolean;
  end;

  function MonthPredZapis(fmOwner:TfmPredZapis; var lCreate:Boolean):Boolean;


implementation

{$R *.dfm}

//----------------------------------------------------
function MonthPredZapis(fmOwner:TfmPredZapis; var lCreate:Boolean):Boolean;
var
  f: TfmPredZapis_Month;
begin
  f:=TfmPredZapis_Month.Create(fmOwner);
  f.FResult:=false;
  f.FCreate:=false;
  f.FRun:=false;
  f.fm:=fmOwner;
  Result:=f.EditModal;
  lCreate:=f.FCreate;
  f.Free;
end;
//----------------------------------------------------
function TfmPredZapis_Month.EditModal:Boolean;
var
  i,nMonth,nLong:Integer;
  sAddDays:String;
  arrDays:TArrParDay;
begin

//  SetLength(arrRecDay,7);
  arrRecDay[1].cbDay:=CheckBox1;  arrRecDay[1].dWB:=ed1WB;  arrRecDay[1].dWE:=ed1WE;  arrRecDay[1].dOB:=ed1OB;  arrRecDay[1].dOE:=ed1OE;
  arrRecDay[2].cbDay:=CheckBox2;  arrRecDay[2].dWB:=ed2WB;  arrRecDay[2].dWE:=ed2WE;  arrRecDay[2].dOB:=ed2OB;  arrRecDay[2].dOE:=ed2OE;
  arrRecDay[3].cbDay:=CheckBox3;  arrRecDay[3].dWB:=ed3WB;  arrRecDay[3].dWE:=ed3WE;  arrRecDay[3].dOB:=ed3OB;  arrRecDay[3].dOE:=ed3OE;
  arrRecDay[4].cbDay:=CheckBox4;  arrRecDay[4].dWB:=ed4WB;  arrRecDay[4].dWE:=ed4WE;  arrRecDay[4].dOB:=ed4OB;  arrRecDay[4].dOE:=ed4OE;
  arrRecDay[5].cbDay:=CheckBox5;  arrRecDay[5].dWB:=ed5WB;  arrRecDay[5].dWE:=ed5WE;  arrRecDay[5].dOB:=ed5OB;  arrRecDay[5].dOE:=ed5OE;
  arrRecDay[6].cbDay:=CheckBox6;  arrRecDay[6].dWB:=ed6WB;  arrRecDay[6].dWE:=ed6WE;  arrRecDay[6].dOB:=ed6OB;  arrRecDay[6].dOE:=ed6OE;
  arrRecDay[7].cbDay:=CheckBox7;  arrRecDay[7].dWB:=ed7WB;  arrRecDay[7].dWE:=ed7WE;  arrRecDay[7].dOB:=ed7OB;  arrRecDay[7].dOE:=ed7OE;

  for i:=Low(NameM1[1]) to High(NameM1[1]) do begin
    cbMonth1.Items.Add(NameM1[1][i]);
    cbMonth2.Items.Add(NameM1[1][i]);
  end;
  FRun:=true;
  nMonth:=fm.ReadMetaMonth(0, arrDays, nLong, sAddDays, aNotWorkTime );
  if nMonth=0 then begin
    cbMonth1.ItemIndex:=0;
    cbMonth2.ItemIndex:=0;
  end else begin
    i:=cbMinTime.Items.IndexOf(IntToStr(nLong));
    if i=-1 then cbMinTime.ItemIndex:=2 else cbMinTime.ItemIndex:=i;
    if nMonth=12 then nMonth:=nMonth-1;
    cbMonth1.ItemIndex:=nMonth;
    cbMonth2.ItemIndex:=nMonth;
    for i:=1 to 7 do begin
      arrRecDay[i].cbDay.Checked:=arrDays[i].FActive;
      if arrRecDay[i].cbDay.Checked then begin
        arrRecDay[i].dWB.Value:=arrDays[i].nTimeWB;
        arrRecDay[i].dWE.Value:=arrDays[i].nTimeWE;
        if arrDays[i].nTimeOB>0 then arrRecDay[i].dOB.Value:=arrDays[i].nTimeOB;
        if arrDays[i].nTimeOE>0 then arrRecDay[i].dOE.Value:=arrDays[i].nTimeOE;
      end;
    end;
  end;
  if (fm.FCurMonth=0) and (fm.cbMonth.ItemIndex>-1) then begin
    cbMonth1.ItemIndex:=fm.cbMonth.ItemIndex;
    cbMonth2.ItemIndex:=fm.cbMonth.ItemIndex;
  end;
  FRun:=false;
  ShowModal;
  Result:=FResult;
end;
//---------------------------------------------------------------------
procedure TfmPredZapis_Month.cbMonth1Change(Sender: TObject);
var
  i,nLong,nMonth:Integer;
  sAddDays:String;
  arrDays:TArrParDay;
begin
  if not FRun then begin
    cbMonth2.ItemIndex:=cbMonth1.ItemIndex;
    if cbMonth1.ItemIndex=cbMonth2.ItemIndex then begin
      lbAddDays.Enabled:=true;
      edAddDays.Enabled:=true;
    end else begin
      lbAddDays.Enabled:=false;
      edAddDays.Enabled:=false;
    end;
    nMonth:=fm.ReadMetaMonth(cbMonth1.ItemIndex+1, arrDays, nLong, sAddDays, aNotWorkTime);
    if nMonth>0 then begin
      i:=cbMinTime.Items.IndexOf(IntToStr(nLong));
      if i=-1 then cbMinTime.ItemIndex:=2 else cbMinTime.ItemIndex:=i;
      edAddDays.Text:=sAddDays;
      for i:=1 to 7 do begin
        arrRecDay[i].cbDay.Checked:=arrDays[i].FActive;
        if arrRecDay[i].cbDay.Checked then begin
          arrRecDay[i].dWB.Value:=arrDays[i].nTimeWB;
          arrRecDay[i].dWE.Value:=arrDays[i].nTimeWE;
          if arrDays[i].nTimeOB>0 then arrRecDay[i].dOB.Value:=arrDays[i].nTimeOB;
          if arrDays[i].nTimeOE>0 then arrRecDay[i].dOE.Value:=arrDays[i].nTimeOE;
        end else begin
          arrRecDay[i].dWB.Value:=null;
          arrRecDay[i].dWE.Value:=null;
          arrRecDay[i].dOB.Value:=null;
          arrRecDay[i].dOE.Value:=null;
        end;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------------------------
procedure TfmPredZapis_Month.btDown1Click(Sender: TObject);
var
  d:TDateTime;
  i,j:Integer;
  lOk:Boolean;
begin
  lOk:=false;
  d:=0;
  for i:=1 to 7 do begin
    if arrRecDay[i].dWB.Value<>null then begin
      d:=arrRecDay[i].dWB.Value;
      lOk:=true;
      break;
    end;
  end;
  if lOk then begin
    for j:=i to 7 do begin
      arrRecDay[j].dWB.Value:=d;
    end;
  end;
  lOk:=false;
  for i:=1 to 7 do begin
    if arrRecDay[i].dWE.Value<>null then begin
      d:=arrRecDay[i].dWE.Value;
      lOk:=true;
      break;
    end;
  end;
  if lOk then begin
    for j:=i to 7 do begin
      arrRecDay[j].dWE.Value:=d;
    end;
  end;
end;
//--------------------------------------------------------------------------------------------
procedure TfmPredZapis_Month.btDown2Click(Sender: TObject);
begin
end;
//--------------------------------------------------------------------------------------------
procedure TfmPredZapis_Month.btDown3Click(Sender: TObject);
var
  d:TDateTime;
  i,j:Integer;
  lOk:Boolean;
begin
  lOk:=false;
  d:=0;
  for i:=1 to 7 do begin
    if arrRecDay[i].dOB.Value<>null then begin
      d:=arrRecDay[i].dOB.Value;
      lOk:=true;
      break;
    end;
  end;
  if lOk then begin
    for j:=i to 7 do begin
      arrRecDay[j].dOB.Value:=d;
    end;
  end;
  lOk:=false;
  for i:=1 to 7 do begin
    if arrRecDay[i].dOE.Value<>null then begin
      d:=arrRecDay[i].dOE.Value;
      lOk:=true;
      break;
    end;
  end;
  if lOk then begin
    for j:=i to 7 do begin
      arrRecDay[j].dOE.Value:=d;
    end;
  end;
end;
//--------------------------------------------------------------------------------------------
procedure TfmPredZapis_Month.btDownClick(Sender: TObject);
begin
end;
//--------------------------------------------------------------------------------------------
function TfmPredZapis_Month.CheckSave:Boolean;
var
  sErr,s:String;
  i,n:Integer;
begin
  Result:=false;
  if (cbMonth1.ItemIndex>-1) and (cbMonth1.ItemIndex<=cbMonth2.ItemIndex) then begin
    sErr:='';
    n:=0;
    for i:=1 to 7 do begin
      if arrRecDay[i].cbDay.Checked then begin
        n:=n+1;
      end;
    end;
    if n=0 then begin
      sErr:='Не отмечен ни один день.';
    end;
    if (sErr='') and (edAddDays.Text<>'') then begin
      s:=edAddDays.Text;
      DelChars(s,' 1234567890,');
      if s<>'' then begin
        sErr:='Недопустимые символы: '+s;
      end;
    end;
    if sErr='' then begin
      for i:=1 to 7 do begin
        s:=arrRecDay[i].cbDay.Caption;
        if arrRecDay[i].cbDay.Checked then begin
          if (arrRecDay[i].dWB.Value=null) or (arrRecDay[i].dWE.Value=null) then begin
            sErr:=s+': заполните время работы.';
            break;
          end else begin
            if (arrRecDay[i].dWB.Value>arrRecDay[i].dWE.Value) then begin
              sErr:=s+': время начала работы меньше времени окончания.';
              break;
            end;
          end;
          if ( (arrRecDay[i].dOB.Value=null) and (arrRecDay[i].dOE.Value<>null) or
               (arrRecDay[i].dOB.Value<>null) and (arrRecDay[i].dOE.Value=null) ) then begin
            sErr:=s+': некорректное время обеда.';
            break;
          end;
          if (arrRecDay[i].dOB.Value<>null) and (arrRecDay[i].dOE.Value<>null) and
             ( (arrRecDay[i].dOB.Value>=arrRecDay[i].dOE.Value) or
               (arrRecDay[i].dWB.Value>=arrRecDay[i].dOB.Value) or
               (arrRecDay[i].dWE.Value<=arrRecDay[i].dOE.Value)
             ) then begin
            sErr:=s+': некорректное время обеда.';
            break;
          end;
        end;
      end;
    end;
    if sErr='' then begin
      Result:=true;
    end else begin
      PutError(sErr,self);
    end;
  end else begin
    PutError('Заполните корректно месяц.',self);
  end;
end;
//--------------------------------------------------------------------------------------------
procedure TfmPredZapis_Month.btOkClick(Sender: TObject);
var
  n,i,m,nCount:Integer;
  arr:TArrParDay;
  s:String;
begin
  if CheckSave then begin
    nCount:=0;
    for m:=cbMonth1.ItemIndex+1 to cbMonth2.ItemIndex+1 do begin
      n:=fm.MonthExists(m);
      if n<2 then begin
        if (fm.FCurMonth=0) and (fm.cbMonth.ItemIndex=m-1)   // текущий месяц пустой но создаем месяц выбранный на главной форме
          then FCreate:=true;
        if m=fm.FCurMonth        // если изменили профиль текущего месяца
          then FResult:=true;
        for i:=1 to 7 do begin
          arr[i].FDay:=i;
          arr[i].FActive:=false;
          if arrRecDay[i].cbDay.Checked then begin
            arr[i].FActive:=true;
            arr[i].nTimeWB:=arrRecDay[i].dWB.Value;
            arr[i].nTimeWE:=arrRecDay[i].dWE.Value;
            if arrRecDay[i].dOB.Value<>null then arr[i].nTimeOB:=arrRecDay[i].dOB.Value else arr[i].nTimeOB:=0;
            if arrRecDay[i].dOE.Value<>null then arr[i].nTimeOE:=arrRecDay[i].dOE.Value else arr[i].nTimeOE:=0;
          end;
        end;
        if edAddDays.Enabled
          then s:=edAddDays.Text
          else s:='';
        fm.WriteMetaMonth(m,arr,StrToInt(cbMinTime.Items[cbMinTime.ItemIndex]),s,nil );
        nCount:=nCount+1;
      end else begin
        PutError('за '+cbMonth1.Items[m-1]+' уже существуют данные о регистрации.',self);
      end;
    end;
    if nCount>0 then begin
      ShowMessageCont('Записано месяцев: '+IntToStr(nCount),self);
//      ModalResult:=mrOk;
    end;
  end;
end;

procedure TfmPredZapis_Month.cbMonth2Change(Sender: TObject);
begin
  if cbMonth1.ItemIndex=cbMonth2.ItemIndex then begin
    lbAddDays.Enabled:=true;
    edAddDays.Enabled:=true;
  end else begin
    lbAddDays.Enabled:=false;
    edAddDays.Enabled:=false;
  end;
end;

procedure TfmPredZapis_Month.FormCreate(Sender: TObject);
begin
  aNotWorkTime:=TStringList.Create;
end;

procedure TfmPredZapis_Month.FormDestroy(Sender: TObject);
begin
  aNotWorkTime.Free;
end;

end.
