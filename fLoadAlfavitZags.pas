unit fLoadAlfavitZags;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uProject,
  fSimpleDialog, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh, CheckLst, dBase, FuncPr, fWarning,
  MetaTask
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmLoadAlfavitZags = class(TfmSimpleDialog)
    gbType: TGroupBox;
    lbType: TCheckListBox;
    cbAll: TCheckBox;
    GroupBox1: TGroupBox;
    edDateBegin: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    edDateEnd: TDBDateTimeEditEh;
    GroupBox2: TGroupBox;
    rbCur: TRadioButton;
    rbAll: TRadioButton;
    cbHand: TDBCheckBoxEh;
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    arrType : TArrInteger;
    procedure UpdateActions; override;
  end;

var
  fmLoadAlfavitZags: TfmLoadAlfavitZags;

implementation

{$R *.DFM}

procedure TfmLoadAlfavitZags.btOkClick(Sender: TObject);
var
 lOk, lCheckOne : Boolean;
 i,m,j : integer;
 s : String;
begin
  lOk := true;
  lCheckOne := false;
  for i:=0 to lbType.Items.Count-1 do begin
    if lbType.Checked[i] then begin
      lCheckOne := true;
      break;
    end;
  end;
  SetLength(arrType,8);
  j:=0;
  for i:=0 to lbType.Items.Count-1 do begin
    if cbAll.Checked or lbType.Checked[i] then begin
      case i of
        0 : m := dmBase.TypeObj_ZBrak;
        1 : m := dmBase.TypeObj_ZRogd;
        2 : m := dmBase.TypeObj_ZSmert;
        3 : m := dmBase.TypeObj_ZUstOtc;
        4 : m := dmBase.TypeObj_ZRast;
        5 : m := dmBase.TypeObj_ZAdopt;
        6 : m := dmBase.TypeObj_ZChName;
        7 : m := dmBase.TypeObj_ZUstMat;
      end;
      arrType[j]:=m;
      Inc(j,1);
    end;
  end;
  SetLength(arrType,j);
  if not cbAll.Checked and not lCheckOne then begin
    lOk := false;
    PutError('Выберите хотя бы один тип актовой записи.')
  end;
  if lOk then begin
    if (edDateBegin.Value=null) then begin
      lOk := false;
      PutError('Заполните начальную дату обработки.')
    end;
  end;
  if lOk then begin
    if (edDateEnd.Value=null) then begin
      lOk := false;
      PutError('Заполните конечную дату обработки.')
    end;
  end;
  if lOk then begin
    if edDateBegin.Value > edDateEnd.Value then begin
      PutError('Конечная дата не может быть меньше начальной.');
      lOk := false;
    end;
  end;
  if lOk and cbHand.Checked then begin
    s := '';
    s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
    s := s + 'Записи введенные в алфавитную книгу вручную будут удалены!'#13;
//    s := s + 'за период:'+FormatDateTime +' будут удалены!'#13;
    s := s + 'Если Вы уверены в необходимости проведения операции,'#13;
    s := s + 'введите слово ДА в поле ввода'#13;
    lOk:=OkWarning(s);
  end;
  if lOk then ModalResult := mrOk;
end;

procedure TfmLoadAlfavitZags.UpdateActions;
begin
  inherited;
  lbType.Enabled:= not cbAll.Checked;
end;

procedure TfmLoadAlfavitZags.FormCreate(Sender: TObject);
begin
  inherited;
  rbCur.Caption := MyName;
end;

end.
