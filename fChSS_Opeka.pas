unit fChSS_Opeka;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dBase, Db, adsdata, adsfunc, adstable, ExtCtrls, StdCtrls, Mask, Variants, uTypes, uProjectAll, uProject,
  DBCtrlsEh, DBLookupEh, Buttons, AddEvents, FuncPr;

{$I Task.inc}

type
  TfmChSS_Opeka = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lbDetail: TLabel;
    btOk: TBitBtn;
    BitBtn2: TBitBtn;
    edRn: TDBLookupComboboxEh;
    edSS: TDBLookupComboboxEh;
    Bevel1: TBevel;
    queryRn: TAdsQuery;
    querySS: TAdsQuery;
    dsRn: TDataSource;
    dsSS: TDataSource;
    cbObl: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure edRnChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbOblChange(Sender: TObject);
  private
    FValueCC: String;
    FValueName: String;
    FClearKey : Boolean;
    procedure SetValueCC(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property ValueName : String read FValueNAME;
    property ValueCC : String read FValueCC write SetValueCC;
    function getObl:String;
  end;

var
  fmChSS_Opeka: TfmChSS_Opeka;

implementation

{$R *.DFM}

{ TfmChSS }

procedure TfmChSS_Opeka.SetValueCC(const Value: String);
var
  cur : TCursor;
  rSpr:TRecSprGISUN;
  n : Integer;
  sRn:String;
begin
  if Value='' then exit;
  rSpr:=Locate_AllSprGISUN(ctZags, Value);
  if rSpr.Ok and (rSpr.Lex3<>'') then begin  // код соато не пустой
    cur := Screen.Cursor;
    n:=StrToInt(Copy(rSpr.Lex3,1,1));
    if n<6
      then cbObl.ItemIndex:=n-1
      else cbObl.ItemIndex:=n-2;                
    sRn:=Copy(rSpr.Lex3,1,4);
    queryRn.Close;
    queryRn.ParamByName('PAR_OBL').AsString:=getObl;
    queryRn.Open;
    edRn.Value:=sRn+'000000';
    querySS.Close;
    querySS.ParamByName('PAR_RN').AsString:=sRn;
    querySS.Open;
    edSS.Value:=Value;
    Screen.Cursor:=cur;
  end;
  FValueCC:=Value;
  {
  if Value <> '' then begin
    cur := Screen.Cursor;
    edObl.Value:= Copy(Value,1,1)+'000000000';
    queryObl.Open;
    queryRn.ParamByName('PAR_OBL').AsString := Copy(Value,1,1);
    queryRn.Open;
    querySS.ParamByName('PAR_RN').AsString := Copy(Value,1,4);
    querySS.Open;

    edRn.Value := Copy(Value,1,4) + '000000';
    edSS.Value := Copy(Value,1,7) +'000';

    Screen.Cursor := cur;
  end;
  }
end;

procedure TfmChSS_Opeka.FormCreate(Sender: TObject);
begin
  FClearKey := false;
  cbOblChange(nil);
end;

function TfmChSS_Opeka.getObl:String;
begin
{Брестская  0
 Витебская  1
 Гомельская 2
 Гродненская3
 !!! Минск
 Минская    4
 Могилёвская5 }
  if cbObl.ItemIndex=-1 then begin
    Result:='';
  end else begin
    if (cbObl.ItemIndex>=0) and (cbObl.ItemIndex<=3)
      then Result:=IntToStr(cbObl.ItemIndex+1)
      else Result:=IntToStr(cbObl.ItemIndex+2);
  end;
end;
//------------------------------------------------------
procedure TfmChSS_Opeka.cbOblChange(Sender: TObject);
var
  cur : TCursor;
begin
 cur := Screen.Cursor;
 queryRn.Close;
 queryRn.ParamByName('PAR_OBL').AsString := getObl;
 queryRn.Open;
 querySS.Close;
 Screen.Cursor:=cur;
end;

procedure TfmChSS_Opeka.edRnChange(Sender: TObject);
var
  cur : TCursor;
begin                      
 cur := Screen.Cursor;
 querySS.Close;
 if TDBLookupComboboxEh(Sender).Value=null then begin
   querySS.ParamByName('PAR_RN').AsString:='';
 end else begin
   querySS.ParamByName('PAR_RN').AsString:=Copy(TDBLookupComboboxEh(Sender).Value,1,4);
 end;
 querySS.Open;
 edSS.Value:=null;
 Screen.Cursor:=cur;
end;

procedure TfmChSS_Opeka.btOkClick(Sender: TObject);
var
  rSpr:TRecSprGISUN;
begin
  if edSS.Value<>null then begin
    FValueCC:=edSS.Value;
    rSpr:=Locate_AllSprGISUN(ctZags, FValueCC);
    if rSpr.Ok then begin
      FValueNAME:=rSpr.Lex1;
      ModalResult:=mrOk;
    end else begin
      PutError('Значение '+FValueCC+' не найдено в классификаторе ГИС РН');
    end;
  end else begin
    {
    if edRn.Value<>null then begin
      if Copy(VarToStr(edRn.Value),2,1)='4' then begin
        FValueSoato := edRn.Value;
        ModalResult:=mrOk;
      end;
    end;
    }
  end;
end;

procedure TfmChSS_Opeka.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      btOkClick(nil);
    end;
  end;
end;

procedure TfmChSS_Opeka.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;


end.
