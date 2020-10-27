unit fChSS;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dBase, Db, adsdata, adsfunc, adstable, ExtCtrls, StdCtrls, Mask, Variants,
  DBCtrlsEh, DBLookupEh, Buttons, AddEvents, FuncPr;

{$I Task.inc}

type
  TfmChSS = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lbDetail: TLabel;
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
    procedure SetValueSOATO(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property ValueSOATO : String read FValueSOATO write SetValueSOATO;
  end;

var
  fmChSS: TfmChSS;

implementation

{$R *.DFM}

{ TfmChSS }

procedure TfmChSS.SetValueSOATO(const Value: String);
var
  cur : TCursor;
begin
  {$IFDEF OCHERED}
    lbDetail.Caption:='Город';
    querySS.SQL.Text:=
     'SELECT *  FROM СпрСОАТО s '+
     '  WHERE Substring(kod,1,4)=:PAR_RN and '+
     ' (Substring(kod,5,1)=''3'' or ( ((Substring(kod,5,1)=''5'' and Substring(kod,7,1)<>''0'') or (Substring(kod,5,2)=''51'')) '+
     ' and Substring(kod,8,3)='+QStr('000')+' and Substring(kod,2,1)<>'+QStr('4')+'))';
    edSS.DropDownBox.Rows:=5;
  {$ENDIF}                         
  FValueSOATO := Value;
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
end;

procedure TfmChSS.FormCreate(Sender: TObject);
begin
  {$IFDEF OCHERED}
    Caption:='Территория';
  {$ENDIF}
  FClearKey := false;
end;

procedure TfmChSS.edOblChange(Sender: TObject);
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

procedure TfmChSS.edRnChange(Sender: TObject);
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
 edSS.Value:=null;
 Screen.Cursor:=cur;
end;

procedure TfmChSS.btOkClick(Sender: TObject);
begin
  if edSS.Value<>null then begin
    FValueSoato := edSS.Value;
    ModalResult:=mrOk;
  end else begin
    if edRn.Value<>null then begin
      {$IFDEF OCHERED}
        FValueSoato := edRn.Value;
        ModalResult:=mrOk;
      {$ELSE}
        if Copy(VarToStr(edRn.Value),2,1)='4' then begin
          FValueSoato := edRn.Value;
          ModalResult:=mrOk;
        end;
      {$ENDIF}
    end else begin
      {$IFDEF OCHERED}
        if edObl.Value<>null then begin
          FValueSoato := edObl.Value;
          ModalResult:=mrOk;
        end;
     {$ENDIF}
    end;
  end;
end;

procedure TfmChSS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      btOkClick(nil);
    end;
  end;
end;

procedure TfmChSS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;


end.
