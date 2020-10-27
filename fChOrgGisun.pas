unit fChOrgGisun;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dBase, Db, adsdata, adsfunc, adstable, ExtCtrls, StdCtrls, Mask, Variants,
  DBCtrlsEh, DBLookupEh, Buttons, AddEvents, FuncPr;

{$I Task.inc}

type
  TfmChOrgGisun = class(TForm)
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FValueSOATO: String;
    FClearKey : Boolean;
    FIDORG: String;
    procedure SetValueSOATO(const Value: String);
    procedure SetIDORG(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    NameGES : String;
    NameBelGES : String;
    property ValueSOATO : String read FValueSOATO write SetValueSOATO;
    property IDORG:String read FIDORG write SetIDORG;
  end;

var
  fmChOrgGisun: TfmChOrgGisun;

implementation

{$R *.DFM}

{ TfmChOrgGisun }

procedure TfmChOrgGisun.SetValueSOATO(const Value: String);
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

procedure TfmChOrgGisun.FormCreate(Sender: TObject);
begin
  FClearKey := false;
end;

procedure TfmChOrgGisun.edOblChange(Sender: TObject);
var
  cur : TCursor;
  sObl : String;
begin
 cur := Screen.Cursor;
 queryRn.Close;
 querySS.Close;
 edRN.Value:=null;
 edSS.Value:=null;
 if TDBLookupComboboxEh(Sender).Value=null then begin
   sObl:='';
 end else begin
   sObl:=Copy(TDBLookupComboboxEh(Sender).Value,1,1);
 end;
 if sObl='5' then begin
   querySS.ParamByName('PAR_RN').AsString := '****';
   querySS.ParamByName('PAR_MINSK').AsString := sObl;
   querySS.Open;
 end else begin
   queryRn.ParamByName('PAR_OBL').AsString := sObl;
   queryRn.Open;
 end;
 Screen.Cursor:=cur;
end;

procedure TfmChOrgGisun.edRnChange(Sender: TObject);
var
  cur : TCursor;
begin
 cur := Screen.Cursor;
 edSS.Value:=null;
 querySS.Close;
 if TDBLookupComboboxEh(Sender).Value=null then begin
   querySS.ParamByName('PAR_RN').AsString := '';
   querySS.ParamByName('PAR_MINSK').AsString := '*';
 end else begin
   querySS.ParamByName('PAR_RN').AsString := Copy(TDBLookupComboboxEh(Sender).Value,1,4);
   querySS.ParamByName('PAR_MINSK').AsString := '*';
 end;
 querySS.Open;
 Screen.Cursor:=cur;
end;

procedure TfmChOrgGisun.btOkClick(Sender: TObject);
begin
//  FValueSoato := edSS.Value;
  if edSS.Value<>null then begin
    FIDORG:=edSS.Value;
    ModalResult:=mrOk;
    {
    if dmBase.SprGES.Locate('ID', FIDGES, []) then begin
      FValueSOATO := dmBase.SprGES.FieldByName('SOATO').AsString;
      NameGES := dmBase.SprGES.FieldByName('NAME').AsString;
      NameBelGES := dmBase.SprGES.FieldByName('NAME_B').AsString;
    end;
    }
  end;
end;

procedure TfmChOrgGisun.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      btOkClick(nil);
    end;
  end;
end;

procedure TfmChOrgGisun.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmChOrgGisun.SetIDORG(const Value: String);
var
  strSOATO:String;
  sObl:String;
begin
  FIDORG := Value;
  if Value <> '' then begin
    {
    if not dmBase.SprGES.Locate('ID', Value, []) then begin
      FIDGES:='1';  // ЖКХ Брестской области
      dmBase.SprGES.Locate('ID', FIDGES, []);
    end;

    strSOATO:=dmBase.SprGES.FieldByName('SOATO').AsString;
    NameGES := dmBase.SprGES.FieldByName('NAME').AsString;
    NameBelGES := dmBase.SprGES.FieldByName('NAME_B').AsString;
    FValueSOATO := dmBase.SprGES.FieldByName('SOATO').AsString;
    }
    sObl:=Copy(strSOATO,1,1);
    edObl.Value := sObl+'000000000';
    queryObl.Open;
    queryRn.Active:=false;;

    if sObl='5' then begin
      edRn.Value:=null;
    end else begin
      edRn.Value  := Copy(strSOATO,1,4)+'000000';
      queryRn.ParamByName('PAR_OBL').AsString := Copy(strSOATO,1,1);
      queryRn.Open;
    end;

    querySS.Active:=false;;
    edSS.Value  := FIDORG;
    if sObl='5' then begin
      querySS.ParamByName('PAR_RN').AsString := '****';
      querySS.ParamByName('PAR_MINSK').AsString := '5';
    end else begin
      querySS.ParamByName('PAR_RN').AsString := Copy(strSOATO,1,4);
      querySS.ParamByName('PAR_MINSK').AsString := '*';
    end;
    querySS.Open;

  end;
end;

end.
