unit fPrintGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, Mask, DBCtrlsEh, prndbgeh, dbGridEh;

type
  TfmPrintGrid = class(TForm)
    GroupBox1: TGroupBox;
    edTitle: TDBEditEh;
    GroupBox2: TGroupBox;
    chListGraf: TCheckListBox;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    PrintGrid: TPrintDBGridEh;
    Button1: TButton;
    Button2: TButton;
    procedure btOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    sl : TStringList;
    FGrid: TDbGridEh;
    procedure SetGrid(const Value: TDbGridEh);
  public
    property Grid : TDbGridEh read FGrid write SetGrid;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

var
  fmPrintGrid: TfmPrintGrid;

implementation

{$R *.DFM}

{ TfmPrintGrid }

constructor TfmPrintGrid.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  sl := TStringList.Create;
end;

destructor TfmPrintGrid.Destroy;
begin
  sl.Free;
  inherited;
end;

procedure TfmPrintGrid.SetGrid(const Value: TDbGridEh);
var
  i : Integer;
begin
  FGrid := Value;
  if FGrid<>nil then begin
    PrintGrid.DBGridEh := FGrid;
    chListGraf.Clear;
    for i:=0 to FGrid.Columns.Count-1 do begin
      if FGrid.Columns[i].Visible then begin
        chListGraf.Items.Add(StringReplace(FGrid.Columns[i].Title.Caption,'|',' ',[rfReplaceAll]));
        sl.Add(FGrid.Columns[i].FieldName+'='+IntToStr(i));
      end;
    end;
    for i:=0 to chListGraf.Items.Count-1 do begin
      chListGraf.Checked[i] := true;;
    end;
  end;
end;

//-----------------------------------------------------------------------
procedure TfmPrintGrid.btOkClick(Sender: TObject);
var
  i,i1,i2 : Integer;
begin
  i1 := FGrid.FrozenCols;
  i2 := FGrid.FooterRowCount;
  FGrid.FrozenCols:=0;
  FGrid.FooterRowCount:=0;
  for i:=0 to chListGraf.Items.Count-1 do begin
    if not chListGraf.Checked[i] then begin
      FGrid.Columns[StrToInt(sl.Values[sl.Names[i]])].Visible := false;
    end;
  end;
  PrintGrid.Title.Clear;
  PrintGrid.Title.Text := edTitle.Text;
  PrintGrid.DBGridEh := FGrid;
  PrintGrid.Preview;
  for i:=0 to chListGraf.Items.Count-1 do begin
    if not chListGraf.Checked[i] then begin
      FGrid.Columns[StrToInt(sl.Values[sl.Names[i]])].Visible := true;
    end;
  end;
  FGrid.FrozenCols:=i1;
  FGrid.FooterRowCount:=i2;
end;

procedure TfmPrintGrid.Button1Click(Sender: TObject);
begin
  PrintGrid.PrinterSetupDialog;
end;

procedure TfmPrintGrid.Button2Click(Sender: TObject);
var
  i : Integer;
begin
  for i:=0 to chListGraf.Items.Count-1 do begin
    chListGraf.Checked[i] := false;
  end;
end;

end.
