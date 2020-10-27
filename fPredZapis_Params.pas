unit fPredZapis_Params;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uProjectAll, ShellApi, FuncPr, MetaTask, uTypes,
  Dialogs, StdCtrls, Buttons, ExtCtrls, fPredZapis, Mask, DBCtrlsEh;

type
  TfmPredZapis_Params = class(TForm)
    ImBtClear: TImage;
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    cbCheckNomer: TDBCheckBoxEh;
    cbAutoRefresh: TDBCheckBoxEh;
    lbMin: TLabel;
    edMin: TDBNumberEditEh;
    cbRaschetDay: TDBCheckBoxEh;
    cbDay: TComboBox;
    lbDay: TLabel;
    cbOnlyWorkDays: TDBCheckBoxEh;
    cbTalon: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    edTel: TEdit;
    edTimeWork: TEdit;
    edPorProv: TEdit;
    Label3: TLabel;
    procedure cbAutoRefreshClick(Sender: TObject);
    procedure cbRaschetDayClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fm:TfmPredZapis;
    FRefresh:Boolean;
    function EditModal:Boolean;
    procedure CheckEnabled;
  end;

  function ParamsPredZapis(fmOwner:TfmPredZapis; var lRefresh:Boolean):Boolean;

implementation

uses dBase;

{$R *.dfm}

function ParamsPredZapis(fmOwner:TfmPredZapis; var lRefresh:Boolean):Boolean;
var
  f: TfmPredZapis_Params;
begin
  f:=TfmPredZapis_Params.Create(fmOwner);
  f.FRefresh:=false;
  f.fm:=fmOwner;
  Result:=f.EditModal;
  lRefresh:=f.FRefresh;
  f.Free;
end;

{ TfmPredZapis_Params }

function TfmPredZapis_Params.EditModal: Boolean;
var
  i:Integer;
begin
  Result:=false;
  cbCheckNomer.Checked:=fm.FCheckNomer;
  cbOnlyWorkDays.Checked:=fm.FOnlyWorkDays;
  cbAutoRefresh.Checked:=fm.AutoRefresh;
  cbRaschetDay.Checked:=fm.FRaschetDay;
  edMin.Value:=fm.FCountMinRefresh;
  edTel.Text:=fm.FTelefon;
  edTimeWork.Text:=fm.FTimeWork;
  edPorProv.Text:=fm.FPorProv;
  for i:=1 to 7 do
    cbDay.Items.Add( GetNameDayWeek(i, true));
  cbDay.ItemIndex:=fm.FVisitDay-1;

  CheckEnabled;
  if ShowModal=mrOk then begin
    Result:=true;
    if cbOnlyWorkDays.Checked<>fm.FOnlyWorkDays then begin
      FRefresh:=true;
    end;
    fm.FCheckNomer:=cbCheckNomer.Checked;
    fm.FOnlyWorkDays:=cbOnlyWorkDays.Checked;
    fm.FCountMinRefresh:=edMin.Value;
    fm.AutoRefresh:=cbAutoRefresh.Checked;
    fm.FRaschetDay:=cbRaschetDay.Checked;
    fm.FVisitDay:=cbDay.ItemIndex+1;
    fm.FTimeWork:=edTimeWork.Text;
    fm.FTelefon:=edTel.Text;
    fm.FPorProv:=edPorProv.Text;
  end;
end;

procedure TfmPredZapis_Params.CheckEnabled;
begin
  edMin.Enabled:=cbAutoRefresh.Checked;
  lbMin.Enabled:=cbAutoRefresh.Checked;
  cbDay.Enabled:=cbRaschetDay.Checked;
  lbDay.Enabled:=cbRaschetDay.Checked;
end;

procedure TfmPredZapis_Params.cbAutoRefreshClick(Sender: TObject);
begin
  CheckEnabled;
end;

procedure TfmPredZapis_Params.cbRaschetDayClick(Sender: TObject);
begin
  CheckEnabled;
end;

procedure TfmPredZapis_Params.Button1Click(Sender: TObject);
var
  sFile:String;
begin
  if fm.FTypeObj=_TypeObj_ZBrak
    then sFile:=NameFromExe('talon_dop.doc') // Globaltask.PathServiceMain+'talon_dop.doc';
    else sFile:=NameFromExe('talon_dop_rast.doc');
//  if not dmbase.IsMainComputer then begin
//    ShowMessage('Файл корретируется на главном компьютере.'#13'После корректировки перезапустите программу.');
//  end;
  ShellExecute(Application.Handle, nil, PChar(sFile), nil, nil, SW_SHOWNORMAL);
end;

end.
