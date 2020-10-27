unit fPadegAdopt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, FuncPr, DbFunc, Db, AddEvents, uPadegFIO;

type
  TfmPadegAdopt = class(TForm)
    btOk: TButton;
    btCancel: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edON_Familia: TDBEditEh;
    edON_Otch: TDBEditEh;
    edON_Name: TDBEditEh;
    edONA_Name: TDBEditEh;
    edONA_Otch: TDBEditEh;
    edONA_Familia: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edON_Familia_B: TDBEditEh;
    edON_Otch_B: TDBEditEh;
    edON_Name_B: TDBEditEh;
    edONA_Name_B: TDBEditEh;
    edONA_Otch_B: TDBEditEh;
    edONA_Familia_B: TDBEditEh;
    Label9: TLabel;
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

  function EditPadegAdopt( ds : TDataSet ) : Boolean;


implementation

var
 lSetDecimal : Boolean;

{$R *.DFM}

function EditPadegAdopt( ds : TDataSet ) : Boolean;
var
  fmPadegAdopt : TfmPadegAdopt;
begin
  Result := false;
  fmPadegAdopt := TfmPadegAdopt.Create(nil);
  fmPadegAdopt.LoadData( ds );
  if fmPadegAdopt.ShowModal = mrOk then begin
    fmPadegAdopt.SaveData;
    Result := true;
  end else begin
    fmPadegAdopt.CheckData;
  end;
  fmPadegAdopt.Free;
end;

{ TfmPadegAdopt }

procedure TfmPadegAdopt.FIOUpdateData(Sender: TObject; var Handled: Boolean);
var
  ed : TDbEditEh;
begin
  ed := TDbEditEh(Sender);
  ed.Text := ANSIUpperCase(Copy(ed.Text,1,1)) +
             ANSILowerCase(Copy(ed.Text,2,Length(ed.Text)-1));
end;

constructor TfmPadegAdopt.Create(Owner : TComponent);
begin
  inherited Create(Owner);
  FClearKey := false;
  slDefault := TStringList.Create;
  slEmpty   := TStringList.Create;
  slDefault.Add('ON_FAMILIA_P');
  slDefault.Add('ON_NAME_P');
  slDefault.Add('ON_OTCH_P');
  slDefault.Add('ONA_FAMILIA_P');
  slDefault.Add('ONA_NAME_P');
  slDefault.Add('ONA_OTCH_P');

  slDefault.Add('ON_FAMILIA_B_P');
  slDefault.Add('ON_NAME_B_P');
  slDefault.Add('ON_OTCH_B_P');
  slDefault.Add('ONA_FAMILIA_B_P');
  slDefault.Add('ONA_NAME_B_P');
  slDefault.Add('ONA_OTCH_B_P');

//-----------------------------------------------------

  slEmpty.Add('ON_FAMILIA');
  slEmpty.Add('ON_NAME');
  slEmpty.Add('ON_OTCH');
  slEmpty.Add('ONA_FAMILIA');
  slEmpty.Add('ONA_NAME');
  slEmpty.Add('ONA_OTCH');

  slEmpty.Add('ON_FAMILIA_B');
  slEmpty.Add('ON_NAME_B');
  slEmpty.Add('ON_OTCH_B');
  slEmpty.Add('ONA_FAMILIA_B');
  slEmpty.Add('ONA_NAME_B');
  slEmpty.Add('ONA_OTCH_B');

end;

destructor TfmPadegAdopt.Destroy;
begin
  slDefault.Free;
  slEmpty.Free;
  inherited;
end;

procedure TfmPadegAdopt.LoadData(ds: TdataSet);
var
  sl : TStringList;
  lNew,lErr : Boolean;
  s : String;
  arr : TArrStrings;
  arrf : TArrStrings;
begin
  FDataSet := ds;
  setLength(arrf,12);
  with FDataSet do begin
    if (FieldByName('ON_FAMILIA_P').AsString='') and
       (FieldByName('ONA_FAMILIA_P').AsString='') and
       (FieldByName('ON_FAMILIA_B_P').AsString='') and
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
      s := GetPadegFIO(s,'ì','Ò');
      StrToArr(s,arr,' ',false);
      if (Length(arr)=0) or (Length(arr)>3) then lErr := true;
      if not lErr then begin
        SetLength(arr,3);
        arrf[0] := arr[0];
        arrf[1] := arr[1];
        arrf[2] := arr[2];
        s := FieldByName(sl[3]).AsString + ' ' + FieldByName(sl[4]).AsString + ' ' +
             FieldByName(sl[5]).AsString;
        s := GetPadegFIO(s,'æ','Ò');
        StrToArr(s,arr,' ',false);
        if (Length(arr)=0) or (Length(arr)>3) then lErr := true;
        if not lErr then begin
          SetLength(arr,3);
          arrf[3] := arr[0];
          arrf[4] := arr[1];
          arrf[5] := arr[2];
        end;
      end;
      if not lErr then begin
        arrf[6]  := FieldByName(sl[6]).AsString;
        arrf[7]  := FieldByName(sl[7]).AsString;
        arrf[8]  := FieldByName(sl[8]).AsString;
        arrf[9]  := FieldByName(sl[9]).AsString;
        arrf[10] := FieldByName(sl[10]).AsString;
        arrf[11] := FieldByName(sl[11]).AsString;
      end;
    end;
  end;
  
  with FDataSet do begin
    if not lNew or lErr then begin
      arrf[0] := FieldByName(sl[0]).AsString;
      arrf[1] := FieldByName(sl[1]).AsString;
      arrf[2] := FieldByName(sl[2]).AsString;
      arrf[3] := FieldByName(sl[3]).AsString;
      arrf[4] := FieldByName(sl[4]).AsString;
      arrf[5] := FieldByName(sl[5]).AsString;

      arrf[6]  := FieldByName(sl[6]).AsString;
      arrf[7]  := FieldByName(sl[7]).AsString;
      arrf[8]  := FieldByName(sl[8]).AsString;
      arrf[9]  := FieldByName(sl[9]).AsString;
      arrf[10] := FieldByName(sl[10]).AsString;
      arrf[11] := FieldByName(sl[11]).AsString;

    end;
  end;
    edON_Familia.Value     := arrf[0];
    edON_Name.Value        := arrf[1];
    edON_Otch.Value        := arrf[2];
    edONA_Familia.Value    := arrf[3];
    edONA_Name.Value       := arrf[4];
    edONA_Otch.Value       := arrf[5];

    edON_Familia_B.Value   := arrf[6];
    edON_Name_B.Value      := arrf[7];
    edON_Otch_B.Value      := arrf[8];
    edONA_Familia_B.Value  := arrf[9];
    edONA_Name_B.Value     := arrf[10];
    edONA_Otch_B.Value     := arrf[11];

end;

procedure TfmPadegAdopt.SaveData;
var
  sl : TStringList;
begin
  sl := slDefault;
  EditDataSet(FDataSet);
  with FDataSet do begin

    FieldByName(sl[0]).AsString := edON_Familia.Value;
    FieldByName(sl[1]).AsString := edON_Name.Value;
    FieldByName(sl[2]).AsString := edON_Otch.Value;
    FieldByName(sl[3]).AsString := edONA_Familia.Value;
    FieldByName(sl[4]).AsString := edONA_Name.Value;
    FieldByName(sl[5]).AsString := edONA_Otch.Value;

    FieldByName(sl[6]).AsString := edON_Familia_B.Value;
    FieldByName(sl[7]).AsString := edON_Name_B.Value;
    FieldByName(sl[8]).AsString := edON_Otch_B.Value;
    FieldByName(sl[9]).AsString := edONA_Familia_B.Value;
    FieldByName(sl[10]).AsString := edONA_Name_B.Value;
    FieldByName(sl[11]).AsString := edONA_Otch_B.Value;

  end;
end;

procedure TfmPadegAdopt.CheckData;
var
  lCheck : Boolean;
begin
  with FDataSet do begin
    if (FieldByName('ON_FAMILIA_P').AsString='') and
       (FieldByName('ONA_FAMILIA_P').AsString='') and
       (FieldByName('ON_FAMILIA_B_P').AsString='') and
       (FieldByName('ONA_FAMILIA_B_P').AsString='') then begin
      lCheck := true;
    end else begin
      lCheck := false;
    end;
  end;
  if lCheck then SaveData;
end;

procedure TfmPadegAdopt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 lSetDecimal:=false;
 if Key = VK_DECIMAL then begin
   lSetDecimal:=true;
 end;
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
end;

procedure TfmPadegAdopt.FormKeyPress(Sender: TObject; var Key: Char);
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
