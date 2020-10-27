unit fVvodAdres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dBase, AddEvents,uProjectAll,
  Dialogs, ExtCtrls, StdCtrls, DB, DBLookupEh, Mask, DBCtrlsEh, Buttons;

type
  TfmVvodAdres = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    edObl: TDBEditEh;
    edRaion: TDBEditEh;
    edTypePunkt: TDBLookupComboboxEh;
    edTypeUL: TDBLookupComboboxEh;
    edPunkt: TDBEditEh;
    edUL: TDBEditEh;
    edDom: TDBEditEh;
    edKorp: TDBEditEh;
    edKv: TDBEditEh;
    dsTypeGorod: TDataSource;
    dsTypeUL: TDataSource;
    Label4: TLabel;
    Label8: TLabel;
    cbNoneAdres: TDBCheckBoxEh;
    edTelefon: TLabeledEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    FClearKey : Boolean;
    procedure SetEdit(adr : TAdres);
    procedure GetEdit(var adr : TAdres);
    procedure UpdateActions; override;
  end;

  function VvodAdres(var adr : TAdres) : Boolean;
  function VvodAdresTel(var adr : TAdres; var strTelefon : String) : Boolean;
  function GetListRaion : TStringList;

var
  ListRaion : TStringList;

implementation

{$R *.dfm}

function VvodAdres( var adr : TAdres) : Boolean;
var
  fmVvodAdres: TfmVvodAdres;
begin
  Result:=false;
  fmVvodAdres:=TfmVvodAdres.Create(nil);
  fmVvodAdres.SetEdit(adr);
  fmVvodAdres.FClearKey:=false;
  fmVvodAdres.edRaion.MRUList.Items:=GetListRaion;
  if fmVvodAdres.ShowModal=mrOk then begin
    fmVvodAdres.GetEdit(adr);
    Result:=true;
  end;
  fmVvodAdres.Free;
end;

function VvodAdresTel( var adr : TAdres; var strTelefon : String) : Boolean;
var
  fmVvodAdres: TfmVvodAdres;
begin
  Result:=false;
  fmVvodAdres:=TfmVvodAdres.Create(nil);
  fmVvodAdres.SetEdit(adr);
  fmVvodAdres.FClearKey:=false;
  fmVvodAdres.edRaion.MRUList.Items:=GetListRaion;
  fmVvodAdres.cbNoneAdres.Visible:=false;
//  fmVvodAdres.edTelefon.Left:=fmVvodAdres.Label5.Left;
  if strTelefon='not visible'
    then fmVvodAdres.edTelefon.Visible:=false
    else fmVvodAdres.edTelefon.Visible:=true;
  if fmVvodAdres.ShowModal=mrOk then begin
    fmVvodAdres.GetEdit(adr);
    if fmVvodAdres.edTelefon.Visible
      then strTelefon:=fmVvodAdres.edTelefon.Text;
    Result:=true;
  end;
  fmVvodAdres.Free;
end;

function GetListRaion : TStringList;
begin
  if ListRaion.Count=0 then begin
    dmBase.LookupRN.First;
    while not dmBase.LookupRN.Eof do begin
      if (dmBase.LookupRN.FieldByName('R_NAME').AsString<>'') and
         (dmBase.LookupRN.FieldByName('NOTCHANGE').AsBoolean=true) then begin
      end;
      ListRaion.Add(dmBase.LookupRN.FieldByName('R_NAME').AsString);
      dmBase.LookupRN.Next;
    end;
    dmBase.LookupRN.First;
  end;
  Result := ListRaion;
end;

{ TfmVvodAdres }

procedure TfmVvodAdres.GetEdit(var adr: TAdres);
begin
  if cbNoneAdres.Checked=true then begin
    adr.AdresPropis:='не известен';
    adr.Obl:='';
    adr.Raion:='';
    adr.Punkt:='';
    adr.Ulica:='';
    adr.NDom:='';
    adr.Korp:='';
    adr.Kv:='';
  end else begin
    adr.AdresPropis:='';
    adr.Obl:=edObl.Text;
    adr.Raion:=edRaion.Text;
    adr.Punkt:=edPunkt.Text;
    adr.Ulica:=edUl.Text;
    adr.NDom:=edDom.Text;
    adr.Korp:=edKorp.Text;
    adr.Kv:=edKv.Text;
  end;
end;

procedure TfmVvodAdres.SetEdit(adr: TAdres);
begin
  if ANSILowerCase(Trim(adr.AdresPropis))='не известен' then begin
    cbNoneAdres.Checked:=true;
  end else begin
    cbNoneAdres.Checked:=false;
    edObl.Text:=adr.Obl;
    edRaion.Text:=adr.Raion;
    edPunkt.Text:=adr.Punkt;
    edUl.Text:=adr.Ulica;
    edDom.Text:=adr.NDom;
    edKorp.Text:=adr.Korp;
    edKv.Text:=adr.Kv;
  end;
end;

procedure TfmVvodAdres.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmVvodAdres.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
end;

procedure TfmVvodAdres.UpdateActions;
begin
  inherited;
// было до 25.08.2011  btOk.Enabled:= ( (edPunkt.text<>'') and (edDom.text<>'')) or cbNoneAdres.Checked;
  btOk.Enabled:= (edPunkt.Text<>'') or cbNoneAdres.Checked;
end;

initialization
  ListRaion := TStringList.Create;
finalization
  ListRaion.Free;
end.



