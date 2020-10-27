unit fChRR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dBase, Db, adsdata, adsfunc, adstable, ExtCtrls, StdCtrls, Mask,
  DBCtrlsEh, DBLookupEh, Buttons, AddEvents, MetaTask, OpisEdit;

type
  TfmChRR = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btOk: TBitBtn;
    BitBtn2: TBitBtn;
    edRn: TDBLookupComboboxEh;
    Bevel1: TBevel;
    queryObl: TAdsQuery;
    queryRn: TAdsQuery;
    dsObl: TDataSource;
    dsRn: TDataSource;
    dsSS: TDataSource;
    edObl: TDBComboBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure edOblChange(Sender: TObject);
    procedure edRnChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FClearKey : Boolean;
    FIDZAGS: String;
    FValueSOATO: String;
    procedure SetIDZAGS(const Value: String);
    procedure SetValueSOATO(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    NameZAGS : String;
    NameBelZAGS : String;
    property ValueSOATO : String read FValueSOATO write SetValueSOATO;
    property IDZAGS : String read FIDZAGS write SetIDZAGS;
//    property ValueSOATO : String read FValueSOATO write SetValueSOATO;
  end;

var
  fmChRR: TfmChRR;

implementation

{$R *.DFM}

{ TfmChRR }

procedure TfmChRR.FormCreate(Sender: TObject);
begin
  FClearKey := false;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_OBL',edObl.Items,edObl.KeyItems);
  edObl.KeyItems.Add('8');
  edObl.Items.Add('Министерство иностранных дел РБ');
end;

procedure TfmChRR.edOblChange(Sender: TObject);
var
  cur : TCursor;
begin
 if edObl.ItemIndex>-1 then begin
   cur := Screen.Cursor;
   queryRn.Close;
   queryRn.ParamByName('PAR_OBL').AsString := edObl.KeyItems[edObl.ItemIndex];;
   queryRn.Open;
   Screen.Cursor:=cur;
 end;
end;

procedure TfmChRR.edRnChange(Sender: TObject);
//var
//  cur : TCursor;
begin
// cur := Screen.Cursor;
// querySS.Close;
// querySS.ParamByName('PAR_RN').AsString := Copy(TDBLookupComboboxEh(Sender).Value,1,4);
// querySS.Open;
// Screen.Cursor:=cur;
end;

procedure TfmChRR.btOkClick(Sender: TObject);
begin
//  FValueSoato := edSS.Value;
  IDZAGS := edRN.Value;
end;

procedure TfmChRR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      btOkClick(nil);
    end;
  end;
end;

procedure TfmChRR.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmChRR.SetIDZAGS(const Value: String);
var
  cur : TCursor;
begin
  FIDZAGS := Value;
  if Value <> '' then begin
    cur := Screen.Cursor;
    if dmBase.SprZAGS.Locate('ID', Value, []) then begin
      NameZAGS := dmBase.SprZAGS.FieldByName('NAME').AsString;
      NameBelZAGS := dmBase.SprZAGS.FieldByName('NAME_B').AsString;
      edObl.Value := Copy(dmBase.SprZAGS.FieldByName('SOATO').AsString,1,1);
      FValueSOATO := dmBase.SprZAGS.FieldByName('SOATO').AsString;
      edRn.Value  := FIDZAGS;
      queryRn.ParamByName('PAR_OBL').AsString := edObl.Value;
      queryRn.Open;
      Screen.Cursor := cur;
    end;
  end;
end;

procedure TfmChRR.SetValueSOATO(const Value: String);
begin
  FValueSOATO := Value;
end;

end.
