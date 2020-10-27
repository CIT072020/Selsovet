unit fZapisBrak_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fSimpleDialog, StdCtrls, Buttons, ExtCtrls, fZapisBrak,
  DBCtrlsEh, Mask, ComCtrls,fShablon;

type
  TfmZapisBrak_Add = class(TfmSimpleDialog)
    pcRast: TPageControl;
    tsSmert: TTabSheet;
    lb14: TLabel;
    lb15: TLabel;
    lb13: TLabel;
    lb12: TLabel;
    edS_NOMER: TDBEditEh;
    edS_DATE: TDBDateTimeEditEh;
    edS_ZAGS: TDBEditEh;
    tsRast: TTabSheet;
    lb10: TLabel;
    lb11: TLabel;
    edSudResh: TDBDateTimeEditEh;
    edSudName: TDBEditEh;
    edSudSila: TDBDateTimeEditEh;
    tsAkt: TTabSheet;
    lb6: TLabel;
    lb7: TLabel;
    lb8: TLabel;
    lb9: TLabel;
    edR_NOMER: TDBEditEh;
    edR_DATE: TDBDateTimeEditEh;
    edR_ZAGS: TDBEditEh;
    Panel2: TPanel;
    cbBrak: TDBCheckBoxEh;
    procedure edS_ZAGSEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edR_ZAGSEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSudNameEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    procedure CheckControl;
  end;

var
  fmZapisBrak_Add: TfmZapisBrak_Add;

implementation

{$R *.dfm}

procedure TfmZapisBrak_Add.edS_ZAGSEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  fmZapisBrak.ChoiceShablonZAGS(nil,'S_ZAGS','Ï','');
end;

procedure TfmZapisBrak_Add.edR_ZAGSEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  fmZapisBrak.ChoiceShablonZAGS(nil,'R_ZAGS','Ï','');
end;

procedure TfmZapisBrak_Add.edSudNameEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
 s,s1,s2:String;
 n:Integer;
begin
  s:=ChoiceFromShablon(SHABLON_SUD);
  if s<>'' then begin
    n:=edSudName.SelStart;
    edSudName.SelStart:=0;
    edSudName.SelLength:=0;
    s1:=Copy(edSudName.Text,1,n);
    s2:=Copy(edSudName.Text,n+1,Length(edSudName.Text));
    edSudName.Text := s1+s+s2;
    edSudName.SelStart:=Length(s1+s);
  end;
end;

//--------------------------------------------------------
procedure TfmZapisBrak_Add.CheckControl;
var
  l:Boolean;
begin
  if cbBrak.Checked then begin
    l:=true;
  end else begin
    l:=false;
  end;
  pcRast.Enabled:=l;
  edS_NOMER.Enabled:=l;
  edS_DATE.Enabled:=l;
  edS_ZAGS.Enabled:=l;
  edR_NOMER.Enabled:=l;
  edR_DATE.Enabled:=l;
  edR_ZAGS.Enabled:=l;
  edSudName.Enabled:=l;
  edSudResh.Enabled:=l;
  edSudSila.Enabled:=l;
  lb6.Enabled:=l;
  lb7.Enabled:=l;
  lb8.Enabled:=l;
  lb9.Enabled:=l;
  lb10.Enabled:=l;
  lb11.Enabled:=l;
  lb12.Enabled:=l;
  lb13.Enabled:=l;
  lb14.Enabled:=l;
  lb15.Enabled:=l;
end;

end.
