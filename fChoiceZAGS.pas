unit fChoiceZAGS;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons, Db, AddEvents, adsdata,
  adsfunc, adstable, FuncPr, MetaTask;

type
  TfmChoiceZAGS = class(TForm)
    edSOATO: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edNameRus: TDBEditEh;
    edNameBel: TDBEditEh;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    DataSource1: TDataSource;
    cbHandled: TDBCheckBoxEh;
    Query: TAdsQuery;
    QuerySeek: TAdsQuery;
    Label4: TLabel;
    edShtamp: TMemo;
    procedure edSOATOChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cbHandledClick(Sender: TObject);
  private
    { Private declarations }
    FClearKey : Boolean;
  public
    { Public declarations }
  end;

var
  fmChoiceZAGS: TfmChoiceZAGS;

implementation

uses dBase;

var
  lSetDecimal : Boolean;

{$R *.DFM}

procedure TfmChoiceZAGS.edSOATOChange(Sender: TObject);
var
  strNew : String;
begin
  if (edSOATO.Text<>'') then begin
    strNew := edSOATO.Text;
    if dmBase.SprSoato.Locate('KOD', strNew, []) then begin
      edNameRus.Text := dmBase.SprSoato.FieldByName('NAME').AsString;
      edNameBel.Text := edNameRus.Text;
    end else begin
      edNameRus.Text := '';
      edNameBel.Text := '';
      edShtamp.Text  := '';
    end;
  end else begin
    edNameRus.Text := '';
    edNameBel.Text := '';
    edShtamp.Text  := '';
  end;
end;

procedure TfmChoiceZAGS.btOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmChoiceZAGS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 lSetDecimal:=false;
 if Key = VK_DECIMAL then begin
   lSetDecimal:=true;
 end;
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
end;

procedure TfmChoiceZAGS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
  if lSetdecimal then begin
    Key := DecimalSeparator;
    lSetDecimal:=false;
  end;
end;

procedure TfmChoiceZAGS.FormCreate(Sender: TObject);
var
  strSQL,s : String;
begin
  {$IFDEF OCHERED}
    cbHandled.Visible:=false;
    Caption:='Организация по учету';
  {$ENDIF}
  lSetDecimal:=false;
  FClearKey:=true;
  s := GlobalTask.ParamAsString('KOD');
  if (s='3401365000')  then begin
    Query.SQL.Text := 'SELECT *  FROM SysSpr.СпрСОАТО WHERE kod=''3401655000''';
  end else if (Copy(s,1,1)='5')  then begin  // для г.Минска выбор любого ЗАГС Минска
    Query.SQL.Text := 'SELECT soato as kod, name, id  FROM SysSpr.SprZags WHERE substring(soato,1,1)=''5''';
  end else begin
    if not dmBase.LoadSQL('Загсы района', strSQL) then begin
      strSQL := 'SELECT *  FROM SysSpr.СпрСОАТО '+
         ' WHERE Substring(kod,1,4)=:PAR_RN and '+
         ' Substring(kod,5,3)<>'+QStr('550')+' and '+
         ' (Substring(kod,5,1)='+QStr('8')+' or Substring(kod,5,1)='+QStr('7')+' or '+
         ' (Substring(kod,5,3)>'+QStr('500')+' and Substring(kod,5,3)<'+QStr('550')+' )) and '+
         ' Substring(kod,6,2)<>'+QStr('00')+' and Substring(kod,8,3)='+QStr('000')+' ';
    end;
    s := Copy(GlobalTask.ParamAsString('KOD'),1,4);
    Query.SQL.Text := strSQL;
    Query.Params[0].Value := s;
  end;
  Query.Open;
end;

procedure TfmChoiceZAGS.cbHandledClick(Sender: TObject);
begin
  if cbHandled.Checked then begin
    edSOATO.Value := '';
    edSOATO.Enabled := false;
  end else begin
    edSOATO.Enabled := true;
  end;
end;

end.
