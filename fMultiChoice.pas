unit fMultiChoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, FuncPr, uFunc,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, CheckLst, DBCtrlsEh;

type
  TfmMultiChoice = class(TForm)
    cbChoice: TCheckListBox;
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel2: TPanel;
    cbNot: TDBCheckBoxEh;
    lbCount: TLabel;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbChoiceClickCheck(Sender: TObject);
  private
    { Private declarations }
    FShowCount:Boolean;
    procedure SetShowCount(const Value: Boolean);
    function CountToStr:String;
  public
    { Public declarations }
    FDelim:String;
    FFieldName:String;
    FType:String;
    FKeyValues:TStringList;
    procedure SetValues(sKeys:String; sDelim:String=';');
    procedure SetNotValues(sKeys:String; sDelim:String=';');
    function GetValues:String;
    function GetNotValues: String;
    function GetValuesAsText(sDelim:String=','):String;
    function GetValuesForWhere:String;
    function GetValuesForFilter:String;
    procedure AddValue(sKey: String; sName:String);
    property ShowCount:Boolean read FShowCount write SetShowCount;

  end;

var
  fmMultiChoice: TfmMultiChoice;

implementation

{$R *.dfm}

//------------------------------------------------------------
procedure TfmMultiChoice.FormCreate(Sender: TObject);
begin
  LoadPosForm(Self);
  FKeyValues:=TStringList.Create;
  FType:='N';  // по умолчанию тип значения: число
  FFieldName:='ID';  // по умолчанию наименование поля
  FDelim:=';';
  FShowCount:=true;
end;

//------------------------------------------------------------
function TfmMultiChoice.GetValuesForFilter: String;
begin
  Result:=GetValuesForWhere;
end;

//------------------------------------------------------------
function TfmMultiChoice.GetValuesForWhere: String;
var
  i:Integer;
  s:String;
begin
  Result:='';
  for i:=0 to cbChoice.Count-1 do begin
    if cbChoice.Checked[i] then begin
      s:=FKeyValues.Strings[i];
      if (FType='C') or (FType='S') or (FType='') then begin
        s:=QStr(s);
      end;
      if Result=''
        then Result:=FFieldName+'='+s
        else Result:=Result+' or '+FFieldName+'='+s
    end;
  end;
end;

//------------ выбрать все ----------------------
procedure TfmMultiChoice.N1Click(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to cbChoice.Count-1 do begin
    cbChoice.Checked[i]:=true;
  end;
  lbCount.Caption:=CountToStr;
end;
//------------ отменить выбор --------------------
procedure TfmMultiChoice.N2Click(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to cbChoice.Count-1 do begin
    cbChoice.Checked[i]:=false;
  end;
  lbCount.Caption:=CountToStr;
end;

//---------------------------------------------------
procedure TfmMultiChoice.SetValues(sKeys: String; sDelim:String);
var
  i:Integer;
  s:String;
begin
  FDelim:=sDelim;
  sKeys:=FDelim+sKeys+FDelim;
  for i:=0 to cbChoice.Count-1 do begin
    s:=FKeyValues.Strings[i];
    if Pos(FDelim+s+FDelim,sKeys)>0 then begin
      cbChoice.Checked[i]:=true;
    end;
  end;
  lbCount.Caption:=CountToStr;
end;
//---------------------------------------------------
procedure TfmMultiChoice.SetNotValues(sKeys: String; sDelim:String);
var
  i:Integer;
  s:String;
begin
  FDelim:=sDelim;
  for i:=0 to cbChoice.Count-1 do begin
    s:=FKeyValues.Strings[i];
    if Pos(FDelim+s+FDelim,sKeys)=0 then begin
      cbChoice.Checked[i]:=true;
    end;
  end;
  lbCount.Caption:=CountToStr;
end;

//---------------------------------------------------
procedure TfmMultiChoice.AddValue(sKey: String; sName:String);
begin
  cbChoice.Items.Add(sName);
  FKeyValues.Add(sKey);
end;

//---------------------------------------------------
function TfmMultiChoice.GetValues: String;
var
  i:Integer;
begin
  Result:='';
  for i:=0 to cbChoice.Count-1 do begin
    if cbChoice.Checked[i] then begin
      Result:=Result+FKeyValues.Strings[i]+FDelim;
    end;
  end;
  if Result<>'' then Result:=FDelim+Result;
end;
//---------------------------------------------------
function TfmMultiChoice.GetNotValues: String;
var
  i:Integer;
begin
  Result:='';
  for i:=0 to cbChoice.Count-1 do begin
    if not cbChoice.Checked[i] then begin
      Result:=Result+FKeyValues.Strings[i]+FDelim;
    end;
  end;
  if Result<>'' then Result:=FDelim+Result;
end;
//---------------------------------------------------
function TfmMultiChoice.GetValuesAsText(sDelim:String=','):String;
var
  i:Integer;
begin
  Result:='';
  for i:=0 to cbChoice.Count-1 do begin
    if cbChoice.Checked[i] then begin
      Result:=Result+cbChoice.Items[i]+sDelim;
    end;
  end;
  if Result<>'' then Result:=Copy(Result,1, Length(Result)-Length(sDelim));
end;
//---------------------------------------------------
procedure TfmMultiChoice.FormDestroy(Sender: TObject);
begin
  SavePosForm(Self);
end;

procedure TfmMultiChoice.cbChoiceClickCheck(Sender: TObject);
begin
  lbCount.Caption:=CountToStr;
end;

function TfmMultiChoice.CountToStr:String;
var
  i,n:Integer;
begin
  n:=0;
  for i:=0 to cbChoice.Count-1 do begin
    if cbChoice.Checked[i] then begin
      Inc(n,1);
    end;
  end;
  Result:='[ '+InttoStr(n)+' ]';
end;

procedure TfmMultiChoice.SetShowCount(const Value: Boolean);
begin
  FShowCount:=Value;
  lbCount.Visible:=Value;
end;

end.
