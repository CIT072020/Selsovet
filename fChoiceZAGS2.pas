// модуль вместо fChoiceZAGS для ЗАГС
unit fChoiceZAGS2;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants, uTypes,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons, Db, AddEvents, adsdata, dbFunc, uGisun, uProject,
  adsfunc, adstable, FuncPr, MetaTask;

type
  TfmChoiceZAGS2 = class(TForm)
    lbOrgan: TLabel;
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
    edOrgan: TDBEditEh;
    procedure edOrganChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cbHandledClick(Sender: TObject);
    procedure edOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edOrganEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
    FClearKey : Boolean;
  public
    { Public declarations }
    ID : String;
    FRun : Boolean;
    function ChoiceZAGS(Control : TControl; strSeek : String;  var arrRec : TCurrentRecord) : Boolean;
  end;

var
  fmChoiceZAGS2: TfmChoiceZAGS2;

implementation

uses dBase, fChoiceGIS_Class, fLookup;

var
  lSetDecimal : Boolean;

{$R *.DFM}

procedure TfmChoiceZAGS2.edOrganChange(Sender: TObject);
begin
  if not FRun then begin
    if (edOrgan.Text<>'') then begin
      if Gisun.SeekClassGisun(CLASS_ORGAN_REG,ID) then begin
        edNameRus.Text := VarToStr(Gisun.GetValueClassGisun('NAME')); //  dmBase.AllSprGISUN.FieldByName('LEX1').AsString;
        edNameBel.Text := VarToStr(Gisun.GetValueClassGisun('NAME_B'));
        if edNameBel.Text='' then edNameBel.Text:=edNameRus.Text;
      end else if dmBase.SprSoato.Locate('ID', ID, []) then begin
        edNameRus.Text := dmBase.SprSoato.FieldByName('NAME').AsString;
        edNameBel.Text := edNameRus.Text;
      end else if dmBase.SprZAGS.Locate('ID', ID, []) then begin
        edNameRus.Text := dmBase.SprZAGS.FieldByName('NAME').AsString;
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
end;

procedure TfmChoiceZAGS2.btOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmChoiceZAGS2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 lSetDecimal:=false;
 if Key = VK_DECIMAL then begin
   lSetDecimal:=true;
 end;
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
end;

procedure TfmChoiceZAGS2.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfmChoiceZAGS2.FormCreate(Sender: TObject);
var
  strSQL,s : String;
begin
  ID:='';
  {$IFDEF OCHERED}
    cbHandled.Visible:=false;
    Caption:='Организация по учету';
  {$ENDIF}
  lSetDecimal:=false;
  FClearKey:=false;
  s := GlobalTask.ParamAsString('KOD');
  if (s='3401365000')  then begin
    Query.SQL.Text := 'SELECT *  FROM SysSpr.СпрСОАТО WHERE kod=''3401655000''';
  end else if (Copy(s,2,1)='4')  then begin  // большой город
    Query.SQL.Text := 'SELECT soato as kod, name, id  FROM SysSpr.SprZags WHERE substring(soato,1,4)='+QStr(Copy(s,1,4));
  end else if (Copy(s,1,1)='5')  then begin  // для г.Минска выбор любого ЗАГС Минска
    Query.SQL.Text := 'SELECT soato as kod, name, id  FROM SysSpr.SprZags WHERE substring(soato,1,1)=''5''';
  end else if (Copy(s,1,1)='8')  then begin  // для г.Минска выбор любого ЗАГС Минска
    Query.SQL.Text := 'SELECT soato as kod, name, id  FROM SysSpr.SprZags WHERE substring(soato,1,1)=''8''';
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

procedure TfmChoiceZAGS2.cbHandledClick(Sender: TObject);
begin
  if cbHandled.Checked then begin
    ID:='';
    edOrgan.Text := '';
    edOrgan.Enabled := false;
    lbOrgan.Enabled := false;
  end else begin
    edOrgan.Enabled := true;
    lbOrgan.Enabled := true;
  end;
end;

function TfmChoiceZAGS2.ChoiceZAGS(Control : TControl; strSeek : String;  var arrRec : TCurrentRecord) : Boolean;
var
  v,old : Variant;
  lChoice : Boolean;
  f : TfmLookUp;
begin
  Result := false;
  v := null;
  f := TfmLookup.Create(nil);
  f.Flat := GlobalFlat;
  f.EnableDetail :=false;
  f.OpisEdit     := nil; //Self;
  f.EnableEdit   := false;
  SetLength(arrRec,1);
  Query.First;
  lChoice:=f.Execute(Control, Query, 'ID', v, arrRec, '', nil);
  f.Free;
  if (v<>null) and lChoice then begin //(old<>v) then begin
    Result := true;
  end;
end;

procedure TfmChoiceZAGS2.edOrganEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  arrRec:TCurrentRecord;
begin
  if ChoiceZAGS(edOrgan, '', arrRec) then begin
    ID:=GetValueField(arrRec,'ID');
    edOrgan.Text:=GetValueField(arrRec,'NAME');
  end;
end;

procedure TfmChoiceZAGS2.edOrganEditButtons1Click(Sender: TObject; var Handled: Boolean);
var
  arrRec:TCurrentRecord;
  slPar:TStringList;
  s:String;
begin
  slPar:=TStringList.Create;
  slPar.Add('CLASS='+IntToStr(ctZags));
//  slPar.Add('CLASS=133');
  if ChoiceGIS_Class( edOrgan, '', 'VAL(EXTCODE)>0', arrRec, slPar) then begin
    s:=GetValueField(arrRec,'EXTCODE');
    SystemProg.CheckKodGISRN_to_ZAGS(s); // ищем в справочнике SysSpr.SprZags  по коду ГИСРН(GISRN), и если находим возвращаем ID
    ID:=s;
    edOrgan.Text:=GetValueField(arrRec,'LEX1');
  end;
end;

end.
