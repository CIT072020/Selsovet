unit fWarning;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uProjectAll,
  StdCtrls, Mask, DBCtrlsEh, Buttons, FuncPr, ExtCtrls;

type
  TfmWarning = class(TForm)
    lbText: TLabel;
    edMemo: TMemo;
    edYes: TDBEditEh;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    pn: TPanel;
    lbYes: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FWidth:Integer;
    FType:Integer;
    FMemo:Boolean;
    FCheckYes:Boolean;
    procedure SetTextWarning( strCaption : String );
    procedure CheckTextAndParam(var s:String);
    procedure UpdateActions; override;
  end;

  function OkWarningScript( strText : String) : Boolean;       // OkWarning для скрипта
  function OkWarning( strText : String; fOwner:TWinControl=nil; lMemo:Boolean=false; lCheckYes:Boolean=true) : Boolean;
  function OkWarningEx( var strText : String; nType:Integer; fOwner:TWinControl=nil; lMemo:Boolean=false) : Boolean;
  function OkWarningPar( var strText : String; slPar:TStringList) : Boolean;

implementation

uses StrUtils;

//----------------------------------------------------------------------------
function OkWarningScript( strText : String) : Boolean;
begin
  Result:=OkWarning( strText, nil, false, true);
end;

//----------------------------------------------------------------------------
function OkWarning( strText : String; fOwner:TWinControl; lMemo:Boolean; lCheckYes:Boolean ) : Boolean;
var
  fmWarning: TfmWarning;
begin
  Result := false;
  fmWarning := TfmWarning.Create(fOwner);
  fmWarning.FType:=0;
  fmWarning.FMemo:=lMemo;
  fmWarning.FCheckYes:=lCheckYes;
  fmWarning.CheckTextAndParam(strText);
  if not lCheckYes then fmWarning.edYes.Visible:=false;
  if strText<>'' then
    fmWarning.SetTextWarning(strText);
  if fmWarning.ShowModal=mrOk then begin
    Result := true;
  end;
  fmWarning.Free;
  Application.ProcessMessages;
end;

//----------------------------------------------------------------------------
function OkWarningPar( var strText : String; slPar:TStringList) : Boolean;
var
  fmWarning: TfmWarning;
  n:Integer;
  sCaption,sValue:String;
begin
  Result := false;
  fmWarning := TfmWarning.Create(nil);
  if slPar<>nil then begin
//    fmWarning.lbText.Align:=alClient;

    n:=StrToInt(ValueFromParams(slPar,'HEIGHT','0'));
    if (n>100) and (n<1000) then
      fmWarning.Height:=n;;
    n:=StrToInt(ValueFromParams(slPar,'WIDTH','0'));
    if (n>100) and (n<2000) then
      fmWarning.Width:=n;;
    sCaption:=ValueFromParams(slPar,'CAPTION','');
    sValue:=ValueFromParams(slPar,'VALUE','');
    if sValue<>'' then fmWarning.edYes.Text:=sValue;
    fmWarning.FType:=StrToInt(ValueFromParams(slPar,'TYPE','0'));
    fmWarning.FMemo:=(ValueFromParams(slPar,'MEMO','0')='1');
    fmWarning.FCheckYes:=(ValueFromParams(slPar,'CHECK','1')='1');
    n:=StrToInt(ValueFromParams(slPar,'EDIT_WIDTH','0'));
    if (n>100) and (n<2000) then
      fmWarning.FWidth:=n;;
  end else begin
    fmWarning.FType:=0;
    fmWarning.FMemo:=false;
    fmWarning.FCheckYes:=true;
  end;
  if not fmWarning.FCheckYes
    then fmWarning.edYes.Visible:=false;
  fmWarning.CheckTextAndParam(strText);
  if strText<>'' then
    fmWarning.SetTextWarning(strText);
  if sCaption<>'' then
    fmWarning.Caption:=sCaption;
  strText:='';
  if fmWarning.ShowModal=mrOk then begin
    Result := true;
    strText:=fmWarning.edYes.Text;
  end;
  fmWarning.Free;
  Application.ProcessMessages;
  if slPar<>nil then FreeAndNil(slPar);
end;

function OkWarningEx( var strText : String; nType:Integer; fOwner:TWinControl=nil; lMemo:Boolean=false) : Boolean;
var
  fmWarning: TfmWarning;
begin
  Result := false;
  if nType=3 then lMemo:=false;
  fmWarning := TfmWarning.Create(fOwner);
  fmWarning.CheckTextAndParam(strText);
  fmWarning.FType:=nType;
  fmWarning.FMemo:=lMemo;
  fmWarning.FCheckYes:=true;
  if nType=2 then fmWarning.edYes.PasswordChar:='*';
  fmWarning.CheckTextAndParam(strText);
  if strText<>'' then
    fmWarning.SetTextWarning(strText);
  strText:='';
  if fmWarning.ShowModal=mrOk then begin
    strText:=fmWarning.edYes.Text;
    Result := true;
  end;
  fmWarning.Free;
  Application.ProcessMessages;
end;

{$R *.DFM}

procedure TfmWarning.SetTextWarning(strCaption: String);
begin
  if FMemo then begin
    lbText.Visible:=false;
    edMemo.Text:=strCaption;
    edMemo.Align:=alClient;
    edMemo.Visible:=true;
  end else begin
    lbText.Caption := strCaption;
  end;
end;
//----------------------------------------------------------------------------
procedure TfmWarning.CheckTextAndParam(var s:String);
begin
  if RightStr(s,3)='+ДА' then begin
    s:=Copy(s,1,Length(s)-3)+#13+
       'Если Вы уверены в необходимости операции,'#13+
       'введите слово ДА в поле ввода';
  end else if LowerCase(RightStr(s,6))='+lbyes' then begin
    lbYes.Visible:=true;
    s:=Copy(s,1,Length(s)-6);
  end;
  if FType=3 then begin
    Caption:='Значение';
    btOk.Caption:='Сохранить';
    edYes.Visible:=true;
    edYes.Width:=FWidth;
    edYes.CharCase:=ecNormal;
//    edYes.Top:=edYes.Top-10;
//    lbText.Anchors:=[akLeft,akTop,akRight];
//    lbText.Height:=lbText.Height-20;
    edMemo.Visible:=false;
    lbYes.Visible:=false;
  end;
end;

procedure TfmWarning.UpdateActions;
begin
  inherited;
  if FType=3 then begin
    btOk.Enabled := true;
  end else begin
    if FCheckYes then begin
      if Trim(edYes.Text)='' then begin
        btOk.Enabled := false;
      end else begin
        if FType=1 then begin
          btOk.Enabled := IsAllDigit(Trim(edYes.Text));
        end else if FType=2 then begin
          btOk.Enabled := Trim(edYes.Text)<>'';
        end else begin
          btOk.Enabled := ( ANSIUpperCase(edYes.Text)='ДА' );
        end;
      end;
    end else begin
      btOk.Enabled := true;
    end;
  end;
end;

procedure TfmWarning.FormCreate(Sender: TObject);
begin
  FWidth:=300;
  FType:=0;
end;

end.
