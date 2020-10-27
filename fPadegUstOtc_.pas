unit fPadegUstOtc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, FuncPr, DbFunc, Db, AddEvents, uPadegFIO;

type
  TfmPadegUstOtc = class(TForm)
    btOk: TButton;
    btCancel: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edFamilia: TDBEditEh;
    edOtch: TDBEditEh;
    edName: TDBEditEh;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edFamilia_B: TDBEditEh;
    edOtch_B: TDBEditEh;
    edName_B: TDBEditEh;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edONA_Familia: TDBEditEh;
    edONA_Otch: TDBEditEh;
    edONA_Name: TDBEditEh;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edONA_Familia_B: TDBEditEh;
    edONA_Otch_B: TDBEditEh;
    edONA_Name_B: TDBEditEh;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FIOUpdateData(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
    FClearKey : Boolean;
    slDefault : TStringList;
    slEmpty   : TStringList;
    FDataSet : TDataSet;
    procedure LoadData( ds : TdataSet);
    procedure SaveData;
    procedure CheckData;
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

  function EditPadegUstOtc( ds : TDataSet ) : Boolean;


implementation

var
 lSetDecimal : Boolean;

{$R *.DFM}

function EditPadegUstOtc( ds : TDataSet ) : Boolean;
var
  fmPadegUstOtc : TfmPadegUstOtc;
begin
  Result := false;
  fmPadegUstOtc := TfmPadegUstOtc.Create(nil);
  fmPadegUstOtc.LoadData( ds );
  if fmPadegUstOtc.ShowModal = mrOk then begin
    fmPadegUstOtc.SaveData;
    Result := true;
  end else begin
    fmPadegUstOtc.CheckData;
  end;
  fmPadegUstOtc.Free;
end;

{ TfmPadegRastBrak }

procedure TfmPadegUstOtc.FIOUpdateData(Sender: TObject; var Handled: Boolean);
var
  ed : TDbEditEh;
begin
  ed := TDbEditEh(Sender);
  ed.Text := ANSIUpperCase(Copy(ed.Text,1,1)) +
             ANSILowerCase(Copy(ed.Text,2,Length(ed.Text)-1));
end;

constructor TfmPadegUstOtc.Create(Owner : TComponent);
begin
  inherited Create(Owner);
  FClearKey := false;
  slDefault := TStringList.Create;
  slEmpty   := TStringList.Create;
  slDefault.Add('FAMILIA_P');
  slDefault.Add('NAME_P');
  slDefault.Add('OTCH_P');
  slDefault.Add('ONA_FAMILIA_P');
  slDefault.Add('ONA_NAME_P');
  slDefault.Add('ONA_OTCH_P');

  slDefault.Add('FAMILIA_B_P');
  slDefault.Add('NAME_B_P');
  slDefault.Add('OTCH_B_P');
  slDefault.Add('ONA_FAMILIA_B_P');
  slDefault.Add('ONA_NAME_B_P');
  slDefault.Add('ONA_OTCH_B_P');

//-----------------------------------------------------

  slEmpty.Add('FAMILIADO');
  slEmpty.Add('NAMEDO');
  slEmpty.Add('OTCHDO');
  slEmpty.Add('ONA_FAMILIA');
  slEmpty.Add('ONA_NAME');
  slEmpty.Add('ONA_OTCH');

  slEmpty.Add('FAMILIADO_B');
  slEmpty.Add('NAMEDO_B');
  slEmpty.Add('OTCHDO_B');
  slEmpty.Add('ONA_FAMILIA_B');
  slEmpty.Add('ONA_NAME_B');
  slEmpty.Add('ONA_OTCH_B');

end;

destructor TfmPadegUstOtc.Destroy;
begin
  slDefault.Free;
  slEmpty.Free;
  inherited;
end;

procedure TfmPadegUstOtc.LoadData(ds: TdataSet);
var
  sl : TStringList;
  lNew,lErr : Boolean;
  s : String;
  arr,arrf : TArrStrings;
begin
  FDataSet := ds;
  SetLength(arrf,6);
  with FDataSet do begin
    if (FieldByName('FAMILIA_P').AsString='') and
       (FieldByName('ONA_FAMILIA_P').AsString='') and
       (FieldByName('FAMILIA_B_P').AsString='') and
       (FieldByName('ONA_FAMILIA_B_P').AsString='') then begin
      sl := slEmpty;
      lNew := true;
    end else begin
      sl := slDefault;
      lNew := false;
    end;
    lErr := false;
    if lNew then begin
      s := FieldByName(sl[0]).AsString + ' ' + FieldByName(sl[1]).AsString + ' ' +
           FieldByName(sl[2]).AsString;
      s := GetPadegFIO(s,'ì','Ð');
      StrToArr(s,arr,' ',false);
      if (Length(arr)=0) or (Length(arr)>3) then lErr := true;
      if not lErr then begin
        SetLength(arr,3);
        arrf[0] := arr[0];
        arrf[1] := arr[1];
        arrf[2] := arr[2];
        s := FieldByName(sl[3]).AsString + ' ' + FieldByName(sl[4]).AsString + ' ' +
             FieldByName(sl[5]).AsString;
        s := GetPadegFIO(s,'æ','Ð');
        StrToArr(s,arr,' ',false);
        if Length(arr)>3 then lErr := true;
        if not lErr then begin
          arrf[3] := arr[0];
          arrf[4] := arr[1];
          arrf[5] := arr[2];
        end;
      end;
    end;
    if not lNew or lErr then begin
      arrf[0] := FieldByName(sl[0]).AsString;
      arrf[1] := FieldByName(sl[1]).AsString;
      arrf[2] := FieldByName(sl[2]).AsString;
      arrf[3] := FieldByName(sl[3]).AsString;
      arrf[4] := FieldByName(sl[4]).AsString;
      arrf[5] := FieldByName(sl[5]).AsString;
    end;

    edFamilia.Value      := arrf[0];
    edName.Value         := arrf[1];
    edOtch.Value         := arrf[2];
    edONA_Familia.Value  := arrf[3];
    edONA_Name.Value     := arrf[4];
    edONA_Otch.Value     := arrf[5];

    edFamilia_B.Value    := FieldByName(sl[6]).AsString;
    edName_B.Value       := FieldByName(sl[7]).AsString;
    edOtch_B.Value       := FieldByName(sl[8]).AsString;
    edONA_Familia_B.Value:= FieldByName(sl[9]).AsString;
    edONA_Name_B.Value   := FieldByName(sl[10]).AsString;
    edONA_Otch_B.Value   := FieldByName(sl[11]).AsString;
  end;
end;

procedure TfmPadegUstOtc.SaveData;
var
  sl : TStringList;
begin
  sl := slDefault;
  EditDataSet(FDataSet);
  with FDataSet do begin

    FieldByName(sl[0]).AsString := edFamilia.Value;
    FieldByName(sl[1]).AsString := edName.Value;
    FieldByName(sl[2]).AsString := edOtch.Value;
    FieldByName(sl[3]).AsString := edONA_Familia.Value;
    FieldByName(sl[4]).AsString := edONA_Name.Value;
    FieldByName(sl[5]).AsString := edONA_Otch.Value;

    FieldByName(sl[6]).AsString := edFamilia_B.Value;
    FieldByName(sl[7]).AsString := edName_B.Value;
    FieldByName(sl[8]).AsString := edOtch_B.Value;
    FieldByName(sl[9]).AsString := edONA_Familia_B.Value;
    FieldByName(sl[10]).AsString := edONA_Name_B.Value;
    FieldByName(sl[11]).AsString := edONA_Otch_B.Value;

  end;
end;

procedure TfmPadegUstOtc.CheckData;
var
  lCheck : Boolean;
begin
  with FDataSet do begin
    if (FieldByName('FAMILIA_P').AsString='') and
       (FieldByName('ONA_FAMILIA_P').AsString='') and
       (FieldByName('FAMILIA_B_P').AsString='') and
       (FieldByName('ONA_FAMILIA_B_P').AsString='') then begin
      lCheck := true;
    end else begin
      lCheck := false;
    end;
  end;
  if lCheck then SaveData;
end;

procedure TfmPadegUstOtc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 lSetDecimal:=false;
 if Key = VK_DECIMAL then begin
   lSetDecimal:=true;
 end;
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
end;

procedure TfmPadegUstOtc.FormKeyPress(Sender: TObject; var Key: Char);
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

end.
