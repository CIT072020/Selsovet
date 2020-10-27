unit fEnterAdresat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MetaTask, OpisEdit, FuncPr, dbFunc,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfmEnterAdresat = class(TForm)
    ed: TMemo;
    Panel1: TPanel;
    btOrg: TBitBtn;
    btShablon: TBitBtn;
    btVoenkom: TBitBtn;
    btROVD: TBitBtn;
    Panel2: TPanel;
    btOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure btShablonClick(Sender: TObject);
    procedure btOrgClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btVoenkomClick(Sender: TObject);
    procedure btROVDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FShablon:Integer;
    procedure ChoiceSpr(strName:String; strField:String; lCur:Boolean);
  end;

  function EnterAdresat(nLeft,nTop:Integer; strAdresat:String; slPar:TStringList):String;

implementation

uses fShablon;

{$R *.dfm}

//---------------------------------------------------------------
function EnterAdresat(nLeft,nTop:Integer; strAdresat:String; slPar:TStringList):String;
var
  fmEnterAdresat: TfmEnterAdresat;
  s:String;
begin
  Result:='';
  fmEnterAdresat:=TfmEnterAdresat.Create(nil);
  fmEnterAdresat.FShablon:=SHABLON_ADRESAT;

  s:=slPar.Values['CAPTION'];
  if s<>'' then fmEnterAdresat.Caption:=s;

  s:=slPar.Values['SHABLON'];
  if s<>'' then fmEnterAdresat.FShablon:=StrToInt(s);

  s:=slPar.Values['CAPTION_SHABLON'];
  if s<>'' then fmEnterAdresat.btShablon.Caption:=s;

  s:=slPar.Values['ONLY_SHABLON'];
  if s='1' then begin
    fmEnterAdresat.btShablon.Left:=fmEnterAdresat.btOrg.Left;
    fmEnterAdresat.btOrg.Visible:=false;
    fmEnterAdresat.btROVD.Visible:=false;
    fmEnterAdresat.btVoenkom.Visible:=false;
  end;

  fmEnterAdresat.ed.Text:=strAdresat;
  if nLeft>0 then fmEnterAdresat.Left:=nLeft;
  if nTop>0  then fmEnterAdresat.Top:=nTop;
  if fmEnterAdresat.ShowModal=mrOk then begin
    Result:=fmEnterAdresat.ed.Text;
  end else begin
    Result:=strAdresat;
  end;
  FreeAndNil(fmEnterAdresat);
end;

//---------------------------------------------------------------
procedure TfmEnterAdresat.btShablonClick(Sender: TObject);
var
 s,s1,s2:String;
 n:Integer;
begin
  s := Trim(ed.Text);
  if (s<>'') and (Pos(' ',s)=0) then begin

  end else begin
    s:='';
  end;
  s:=ChoiceFromShablon(FShablon);
  if s<>'' then begin
    n:=ed.SelStart;
    ed.SelStart:=0;
    ed.SelLength:=0;
    s1:=Copy(ed.Text,1,n);
    s2:=Copy(ed.Text,n+1,Length(ed.Text));
    ed.Text := s1+s+s2;
    ed.SelStart:=Length(s1+s);
  end;
  Activecontrol:=ed;
end;


//---------------------------------------------------------------
procedure TfmEnterAdresat.ChoiceSpr(strName:String; strField:String; lCur:Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ParamFlt : TParamFieldFlt;
  s,s1,s2:String;
  n:Integer;
begin
  if strField='' then strField:='NAME';
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA(strName);
  if Opis<>nil then begin
    SetLength(arrRec,1);
    ParamFlt := TParamFieldFlt.Create;
    s := Trim(ed.Text);
    if (s<>'') and (Pos(' ',s)=0) then begin
      Opis.AutoFilter:=true;
      with ParamFlt do begin
        TypeSr:=tsAt;
        Value1:=s;
        CICharacter:=true;
        FieldName:=strField; //Opis.ResultField;
        OnlySet:=true;
      end;
    end;
    v:=null;
    if Opis.ChoiceFromSprEx(ed, v, arrRec, ParamFlt) then begin
      if lCur then begin
        v:='';
        s:=GetValueFieldEx(arrRec, '_CURFIELD_','XXX');
        if (s<>'') then begin
          v:=GetValueField(arrRec, s);
        end;
        s:=VarToStr(v);
        if (s='') or IsAllDigit(s) then begin
          v := GetValueField(arrRec, Opis.ResultField);
          if (VarToStr(v)='') or IsAllDigit(VarToStr(v))
            then v := GetValueField(arrRec, strField);
        end else begin
          v:=s;
        end;
      end else begin
        v := GetValueField(arrRec, Opis.ResultField);
        if (VarToStr(v)='') or IsAllDigit(VarToStr(v))
          then v := GetValueField(arrRec, strField);
      end;
      if v <> null then begin
        s:=VarToStr(v);
        n:=ed.SelStart;
        ed.SelStart:=0;
        ed.SelLength:=0;
        s1:=Copy(ed.Text,1,n);
        s2:=Copy(ed.Text,n+1,Length(ed.Text));
        ed.Text := s1+s+s2;
        ed.SelStart:=Length(s1+s);
      end;
    end;
    ParamFlt.Free;
    Activecontrol:=ed;
  end;
end;

//---------------------------------------------------------------
procedure TfmEnterAdresat.btOrgClick(Sender: TObject);
begin
  ChoiceSpr('LOOKUP_WORK_ZAGS', 'NAME', true);
end;

procedure TfmEnterAdresat.btVoenkomClick(Sender: TObject);
begin
  ChoiceSpr('LOOKUP_VOENKOM', 'NAME', true);
end;

procedure TfmEnterAdresat.btROVDClick(Sender: TObject);
begin
  ChoiceSpr('LOOKUP_ROVD', 'NAME', true);
end;

//---------------------------------------------------------------
procedure TfmEnterAdresat.btOkClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmEnterAdresat.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key=VK_F2 then begin
    ModalResult:=mrOk;
  end else if Key=VK_ESCAPE then begin
    ModalResult:=mrCancel;
  end else if Key=VK_F9 then begin
    btOrgClick(nil);
  end else if Key=VK_F10 then begin
    btShablonClick(nil);
  end else if Key=VK_F11 then begin
    btVoenkomClick(nil);
  end else if Key=VK_F12 then begin
    btROVDClick(nil);
  end;
end;

procedure TfmEnterAdresat.FormKeyPress(Sender: TObject; var Key: Char);
begin
//
end;


end.
