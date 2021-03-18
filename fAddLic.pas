unit fAddLic;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleDialog, StdCtrls, Buttons, ExtCtrls, dBase, OpisEdit, MetaTask, dbFunc, NewDialogs,
  Db, DBLookupEh, Mask, DBCtrlsEh, FuncPr
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmAddLic = class(TfmSimpleDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbOwnerHouse: TDBCheckBoxEh;
    Label4: TLabel;
    edLic: TDBEditEh;
    edNomerKn: TDBEditEh;
    edNomerStr: TDBEditEh;
    edTypeHouse: TDBLookupComboboxEh;
    dsSprTypeHouse: TDataSource;
    edDateSozd: TDBDateTimeEditEh;
    Label5: TLabel;
    procedure edTypeHouseEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edLicEditButtons1Click(Sender: TObject;          var Handled: Boolean);
    procedure edLicEditButtons0Click(Sender: TObject;          var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateActions; override;
    function CheckOk : Boolean; override;
  end;

  function AddLic( strAdres : String; dDateSozd : TDateTime ): Integer;

implementation

uses fChoiceAdres;

{$R *.DFM}


function AddLic( strAdres : String; dDateSozd : TDateTime ): Integer;
var
  fmAddLic: TfmAddLic;
  ID : Integer;
  d : TDateTime;
begin
  Result:=0;
  ID:=0;
  try
    d := dDateSozd;
  except
    d := dmBase.GetCurDate;
  end;
  fmAddLic := TfmAddLic.Create(nil);
  fmAddLic.edDateSozd.Value:=d;
  if GlobalTask.ParamAsInteger('MIN_TWO_NOMER')>0 then begin
    fmAddLic.edLic.EditButtons[0].Visible:=true;
  end else begin
    fmAddLic.edLic.EditButtons[0].Visible:=false;
  end;
  if fmAddLic.EditModal then begin
    try
      d := fmAddLic.edDateSozd.Value;
    except
      d := dmBase.GetCurDate;
    end;
    ID := dmBase.GetNewID( dmBase.TypeObj_Lich );
  end;
  if (ID>0) then begin
    try
      dmBase.tbLich.Append;
      dmBase.tbLich.FieldByName('DATE_FIKS').AsDateTime := dmBase.GetDateCurrentSost;
      dmBase.tbLich.FieldByName('ID').AsInteger   := ID;
      dmBase.tbLich.FieldByName('CANDELETE').AsBoolean  := false;
      dmBase.tbLich.FieldByName('PRESENT').AsBoolean    := true;
      dmBase.tbLich.FieldByName('NOMER').AsString := fmAddLic.edLic.Text;
      dmBase.tbLich.FieldByName('KNIGA_NOMER').AsString := trim(fmAddLic.edNomerKn.Text);
      dmBase.tbLich.FieldByName('KNIGA_STR').AsString   := trim(fmAddLic.edNomerStr.Text);
      dmBase.tbLich.FieldByName('OWN_HOUSE').AsBoolean  := fmAddLic.cbOwnerHouse.Checked;
      dmBase.tbLich.FieldByName('TYPEHOUSE').AsString   := VarToStr(fmAddLic.edTypeHouse.Value);
      dmBase.tbLich.FieldByName('ADRES_ID').AsString    := strAdres;
      dmBase.tbLich.FieldByName('DATE_SOZD').AsDateTime := d;
      dmBase.tbLich.Post;
    except
      ID:=0;
      dmBase.tbLich.Cancel;
    end;
  end;
  FreeAndNil(fmAddLic);
  if (ID>0) then begin
    Result:=ID;
    RefreshChoiceAdres;
  end;
end;

procedure TfmAddLic.edTypeHouseEditButtons0Click(Sender: TObject; var Handled: Boolean);
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
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_TYPEHOUSE');
  finally
    Screen.Cursor := old;
  end;
  if Opis <> nil then begin
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      if v <> null then begin
        edTypeHouse.Value := v;
      end;
      Screen.Cursor := old;
    end;
  end;
end;

procedure TfmAddLic.UpdateActions;
begin
  btOk.Enabled := (Trim(edLic.Text)<>'') and IsAllDigit(Trim(edLic.Text));
end;

procedure TfmAddLic.edLicEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edLic.text := IntToStr(dmBase.GetLastNomerLicFirst+1);
end;

procedure TfmAddLic.edLicEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  n:Int64;
begin
  // двойной учет
  if GlobalTask.ParamAsInt64('MIN_TWO_NOMER')>0 then begin
    n:=dmBase.GetLastNomerLic;
    if n=0 // из второй части нет лицевых счетов
      then n:=GlobalTask.ParamAsInt64('MIN_TWO_NOMER')
      else n:=n+1;
    edLic.Text:=IntToStr(n);
  end else begin
    edLic.Text:=IntToStr(dmBase.GetLastNomerLic+1);
  end;
end;

function TfmAddLic.CheckOk: Boolean;
var
  sSoob,sNom:String;
  n:Integer;
begin
  Result:=false;
  sNom:=Trim(edLic.Text);
  if (sNom<>'') then begin
    if not IsAllDigit(sNom) then begin
      PutError(' В номере могут быть только цифры');
    end else if Length(sNom)>11 then begin    // поле в базе NOMER(12,0)
      PutError(' Количество цифр не может быть больше 11');
    end else begin
      Result:=dmBase.CheckNomerLich(dmBase.GetDateCurrentSost,-1, sNom, true);
    end;
  end;
end;


end.
