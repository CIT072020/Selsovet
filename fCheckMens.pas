unit fCheckMens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, db, funcPr,
  Dialogs, StdCtrls, CheckLst, Buttons, ExtCtrls;

type
  TfmCheckMens = class(TForm)
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    ckList: TCheckListBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    TypeDate:Integer;
    NotID:String;
    FField:String;
    Mens : TDataSet;
    procedure ReadList(lAddOtnosh:Boolean);
    procedure WriteCheck;
    procedure ClearCheck;
  end;

  function CheckMens(ds:TDataSet; lAddOtnosh:Boolean; nTypeDate:Integer):Boolean;
  function CheckMens2(ds:TDataSet; lClearCheck:Boolean; sIsklID:String; lAddOtnosh:Boolean; nTypeDate:Integer):Boolean;

implementation

uses dBase;

{$R *.dfm}

function CheckMens(ds:TDataSet; lAddOtnosh:Boolean; nTypeDate:Integer):Boolean;
var
  fmCheckMens: TfmCheckMens;
begin
  Result:=false;
  ds.First;
  if ds.RecordCount>0 then begin
    fmCheckMens:=TfmCheckMens.Create(nil);
    fmCheckMens.ckList.Clear;
    fmCheckMens.Mens:=ds;
    fmCheckMens.TypeDate:=nTypeDate;
    fmCheckMens.ReadList(lAddOtnosh);
    if fmCheckMens.ShowModal=mrOk then begin
      fmCheckMens.WriteCheck;
      Result:=true;
    end;
    FreeAndNil(fmCheckMens);
  end;
end;

function CheckMens2(ds:TDataSet; lClearCheck:Boolean; sIsklID:String; lAddOtnosh:Boolean; nTypeDate:Integer):Boolean;
var
  fmCheckMens: TfmCheckMens;
  n:Integer;
begin
  Result:=false;
  ds.First;
  if ds.RecordCount>0 then begin
    fmCheckMens:=TfmCheckMens.Create(nil);
    fmCheckMens.ckList.Clear;
    fmCheckMens.Mens:=ds;
    if sIsklID<>'' then begin
      n:=Pos('->',sIsklID);
      if n>0 then begin
        sIsklID:=Copy(sIsklID,7,Length(sIsklID));
        fmCheckMens.FField:=Copy(sIsklID,1,n-1);
      end;
      fmCheckMens.NotID:=';'+sIsklID+';';
    end;
    if lClearCheck then fmCheckMens.ClearCheck;
    fmCheckMens.TypeDate:=nTypeDate;
    fmCheckMens.ReadList(lAddOtnosh);
    if fmCheckMens.ShowModal=mrOk then begin
      fmCheckMens.WriteCheck;
      Result:=true;
    end;
    FreeAndNil(fmCheckMens);
  end;
end;

{ TfmCheckMens }

procedure TfmCheckMens.ReadList(lAddOtnosh:Boolean);
var
  s,s2:String;
//  i:Integer;
begin
  Mens.First;
//  i:=0;
  while not Mens.Eof do begin
    if (NotID='') or (Pos(';'+Mens.FieldByName('ID').AsString+';',NotID)=0) then begin
      if lAddOtnosh
        then s:=dmBase.GetOtnoshMen(Mens.FieldByName('OTNOSH').AsInteger)+' '
        else s:='';
      s2:='';
      if TypeDate>-1 then begin
        case TypeDate of
          0 : s2:=' '+FormatDateTime('YYYY',Mens.FieldByName('DATER').AsDateTime)+'г.р.'; // год рождения
          1 : s2:=' '+FormatDateTime('DD.MM.YYYY',Mens.FieldByName('DATER').AsDateTime)+'';  // дата рождения
          2 : s2:=' '+GetVozrast(Mens.FieldByName('AGE').AsInteger, true); // возраст
        end;
      end;
      ckList.Items.Add(s+Mens.FieldByName('FAMILIA').AsString+' '+Mens.FieldByName('NAME').AsString+' '+Mens.FieldByName('OTCH').AsString+s2);
      ckList.Checked[ckList.Items.Count-1]:=Mens.FieldByName('CHECK').AsBoolean;
    end;
    Mens.Next;
//    i:=i+1;
  end;
  Mens.First;
end;

procedure TfmCheckMens.WriteCheck;
var
  i:Integer;
begin
  Mens.First;
  i:=0;
  while not Mens.Eof do begin
    if (NotID='') or (Pos(';'+Mens.FieldByName('ID').AsString+';',NotID)=0) then begin
      Mens.Edit;
      Mens.FieldByName('CHECK').AsBoolean:=ckList.Checked[i];
      Mens.Post;
      i:=i+1;
    end;
    Mens.Next;
  end;
  Mens.First;
end;

procedure TfmCheckMens.ClearCheck;
begin
  Mens.First;
  while not Mens.Eof do begin
    Mens.Edit;
    Mens.FieldByName('CHECK').AsBoolean:=false;
    Mens.Post;
    Mens.Next;
  end;
  Mens.First;
end;


procedure TfmCheckMens.FormCreate(Sender: TObject);
begin
  NotID:='';
  FField:='MEMBER_ID';
end;

end.

