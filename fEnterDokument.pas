unit fEnterDokument;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fSimpleDialog, DB, kbmMemTable, DBCtrlsEh, StdCtrls, Mask,AddEvents,
  Buttons, ExtCtrls;

type
  TfmEnterDokument = class(TfmSimpleDialog)
    Label69: TLabel;
    edDOK_NAME: TDBEditEh;
    edDOK_TYPE: TDBComboBoxEh;
    edDOK_SERIA: TDBEditEh;
    edDOK_NOMER: TDBEditEh;
    edDOK_DATE: TDBDateTimeEditEh;
    tb: TkbmMemTable;
    tbDOK_TYPE: TSmallintField;
    tbDOK_SERIA: TStringField;
    tbDOK_NOMER: TStringField;
    tbDOK_ORGAN: TIntegerField;
    tbDOK_NAME: TMemoField;
    tbDOK_DATE: TDateField;
    DataSource: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edDOK_NAMEEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    FClearKey:Boolean;
    procedure SetEnableEdit( lEnabled : Boolean);
    function EditDokument : Boolean;
  end;

var
  fmEnterDokument: TfmEnterDokument;

implementation

uses MetaTask, fShablon;

{$R *.dfm}

procedure TfmEnterDokument.FormCreate(Sender: TObject);
begin
  if not tb.Active then tb.Active:=true;
  tb.Append;
  tb.Post;
  GlobalTask.CurrentOpisEdit.SetKeyForm(Self,nil);
end;

function TfmEnterDokument.EditDokument : Boolean;
begin
  Result:=false;
  if ShowModal=mrOk then begin
    tb.CheckBrowseMode;
    Result:=true;
  end else begin
    tb.Cancel;
  end;
end;

procedure TfmEnterDokument.SetEnableEdit(lEnabled: Boolean);
begin
  edDOK_TYPE.Enabled:=lEnabled;
  edDOK_SERIA.Enabled:=lEnabled;
  edDOK_NOMER.Enabled:=lEnabled;
  edDOK_DATE.Enabled:=lEnabled;
  edDOK_NAME.Enabled:=lEnabled;
end;

procedure TfmEnterDokument.edDOK_NAMEEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 s:String;
begin
 if edDOK_NAME.Enabled then begin
   s:=ChoiceFromShablon(SHABLON_ROVD,Trim(edDOK_NAME.Text));
   if s<>'' then begin
     edDOK_NAME.Text:=s;
   end;
 end;
end;

procedure TfmEnterDokument.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F2 then begin
    Modalresult:=mrOk;
  end else begin
    Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
  end;
end;

procedure TfmEnterDokument.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

end.
