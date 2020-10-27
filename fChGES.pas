unit fChGES;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dBase, Db, adsdata, adsfunc, adstable, ExtCtrls, StdCtrls, Mask, Variants,
  DBCtrlsEh, DBLookupEh, Buttons, AddEvents, FuncPr;

{$I Task.inc}

type
  TfmChGES = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btOk: TBitBtn;
    BitBtn2: TBitBtn;
    edObl: TDBLookupComboboxEh;
    edRn: TDBLookupComboboxEh;
    edSS: TDBLookupComboboxEh;
    Bevel1: TBevel;
    queryObl: TAdsQuery;
    queryRn: TAdsQuery;
    querySS: TAdsQuery;
    dsObl: TDataSource;
    dsRn: TDataSource;
    dsSS: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edOblChange(Sender: TObject);
    procedure edRnChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FValueSOATO: String;
    FClearKey : Boolean;
    FIDGES: String;
    procedure SetValueSOATO(const Value: String);
    procedure SetIDGES(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    NameGES : String;
    NameBelGES : String;
    property ValueSOATO : String read FValueSOATO write SetValueSOATO;
    property IDGES:String read FIDGES write SetIDGES;
  end;

var
  fmChGES: TfmChGES;

implementation

{$R *.DFM}

{ TfmChGES }

procedure TfmChGES.SetValueSOATO(const Value: String);
begin
  FValueSOATO := Value;
  if Value <> '' then begin
  {
    cur := Screen.Cursor;
    edObl.Value:= Copy(Value,1,1)+'000000000';
    edRn.Value := Copy(Value,1,4) + '000000';
//    edSS.Value := Copy(Value,1,7) +'000';
    queryObl.Open;
    queryRn.ParamByName('PAR_OBL').AsString := Copy(Value,1,1);
    queryRn.Open;
    querySS.ParamByName('PAR_RN').AsString := Copy(Value,1,4);
    querySS.Open;
    Screen.Cursor := cur;
   }
  end;
end;

procedure TfmChGES.FormCreate(Sender: TObject);
begin
  FClearKey := false;
end;

procedure TfmChGES.edOblChange(Sender: TObject);
var
  cur : TCursor;
begin
 cur := Screen.Cursor;
 queryRn.Close;
 if TDBLookupComboboxEh(Sender).Value=null then begin
   queryRn.ParamByName('PAR_OBL').AsString := '';
 end else begin
   queryRn.ParamByName('PAR_OBL').AsString := Copy(TDBLookupComboboxEh(Sender).Value,1,1);
 end;
 queryRn.Open;
 querySS.Close;
 Screen.Cursor:=cur;
end;

procedure TfmChGES.edRnChange(Sender: TObject);
var
  cur : TCursor;
begin
 cur := Screen.Cursor;
 querySS.Close;
 if TDBLookupComboboxEh(Sender).Value=null then begin
   querySS.ParamByName('PAR_RN').AsString := '';
 end else begin
   querySS.ParamByName('PAR_RN').AsString := Copy(TDBLookupComboboxEh(Sender).Value,1,4);
 end;
 querySS.Open;
 Screen.Cursor:=cur;
end;

procedure TfmChGES.btOkClick(Sender: TObject);
begin
//  FValueSoato := edSS.Value;
  if edSS.Value<>null then begin
    FIDGES:=edSS.Value;
    if dmBase.SprGES.Locate('ID', FIDGES, []) then begin
      FValueSOATO := dmBase.SprGES.FieldByName('SOATO').AsString;
      NameGES := dmBase.SprGES.FieldByName('NAME').AsString;
      NameBelGES := dmBase.SprGES.FieldByName('NAME_B').AsString;
    end;
  end;
end;

procedure TfmChGES.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      btOkClick(nil);
    end;
  end;
end;

procedure TfmChGES.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmChGES.SetIDGES(const Value: String);
var
  strSOATO:String;
begin
  FIDGES := Value;
  {$IFDEF GKH}
  if Value <> '' then begin
    if not dmBase.SprGES.Locate('ID', Value, []) then begin
      FIDGES:='1';  // ЖКХ Брестской области
      dmBase.SprGES.Locate('ID', FIDGES, []);
    end;
    strSOATO:=dmBase.SprGES.FieldByName('SOATO').AsString;
    NameGES := dmBase.SprGES.FieldByName('NAME').AsString;
    NameBelGES := dmBase.SprGES.FieldByName('NAME_B').AsString;
    edObl.Value := Copy(strSOATO,1,1)+'000000000';
    FValueSOATO := dmBase.SprGES.FieldByName('SOATO').AsString;
    edRn.Value  := Copy(strSOATO,1,4)+'000000';
    edSS.Value  := FIDGES;
    queryObl.Open;
    queryRn.Active:=false;;
    queryRn.ParamByName('PAR_OBL').AsString := Copy(strSOATO,1,1);
    queryRn.Open;
    querySS.Active:=false;;
    querySS.ParamByName('PAR_RN').AsString := Copy(strSOATO,1,4);
    querySS.Open;
  end;
  {$ENDIF}
end;

end.
