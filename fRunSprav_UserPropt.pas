unit fRunSprav_UserPropt;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, FuncPr, uProject, uProjectAll,
  Dialogs, fSimpleDialog, StdCtrls, Mask, DBCtrlsEh, Buttons, ExtCtrls, DB;

type
  TfmRunSprav_UserProp = class(TfmSimpleDialog)
    gbUserPodr: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDolgPodp1: TDBComboBoxEh;
    edDolgPodp2: TDBComboBoxEh;
    edDolgPodp3: TDBComboBoxEh;
    DataSource: TDataSource;
    cbPodp2: TDBCheckBoxEh;
    cbPODP3: TDBCheckBoxEh;
    lbShtamp: TLabel;
    edShtamp: TDBComboBoxEh;
    blShtamp: TBevel;
    procedure cbPodp2Click(Sender: TObject);
    procedure cbPODP3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fds:TDataset;
    FdsUser:TDataSet;
    Fsl1:TStringList;
    Fsl2:TStringList;
    procedure CreateList;
  end;

function EditPropRecord(sl1,sl2:TStringList;ds,dsUser:TDataSet):Boolean;

implementation

{$R *.dfm}

function EditPropRecord(sl1,sl2:TStringList;ds,dsUser:TDataSet):Boolean;
var
  f:TfmRunSprav_UserProp;
begin
  f:=TfmRunSprav_UserProp.Create(nil);
  f.Fsl1:=sl1;
  f.Fsl2:=sl2;
  f.CreateList;
  f.Fds:=ds;
  f.FdsUser:=dsUser;
  f.DataSource.DataSet:=dsUser;
  if not (f.FdsUser.FieldByName('ID').AsInteger=f.Fds.FieldByName('ID').AsInteger) or  f.FdsUser.Eof then begin
    f.FdsUser.Append;
    f.FdsUser.FieldByName('ID').AsInteger:=f.Fds.FieldByName('ID').AsInteger;

    f.FdsUser.FieldByName('KOD').AsString:=f.Fds.FieldByName('KOD').AsString;
    f.FdsUser.FieldByName('ISVISIBLE').AsBoolean:=f.Fds.FieldByName('VISIBLE').AsBoolean;
    f.FdsUser.FieldByName('DOLG_PODP1').AsString:=f.Fds.FieldByName('DOLG_PODP1').AsString;
    f.FdsUser.FieldByName('DOLG_PODP2').AsString:=f.Fds.FieldByName('DOLG_PODP2').AsString;
    f.FdsUser.FieldByName('DOLG_PODP3').Asstring:=f.Fds.FieldByName('DOLG_PODP3').Asstring;
    f.FdsUser.FieldByName('PODP2').AsBoolean:=f.Fds.FieldByName('PODP2').AsBoolean;
    f.FdsUser.FieldByName('PODP3').AsBoolean:=f.Fds.FieldByName('PODP3').AsBoolean;

    f.FdsUser.FieldByName('PODP3').AsBoolean:=f.Fds.FieldByName('PODP3').AsBoolean;
    f.FdsUser.FieldByName('SHTAMP_CUR').AsInteger:=f.Fds.FieldByName('SHTAMP_CUR').AsInteger;

  end else begin
    f.FdsUser.Edit;
    f.FdsUser.FieldByName('KOD').AsString:=f.Fds.FieldByName('KOD').AsString;
  end;

  if f.FdsUser.FieldByName('SHTAMP_CUR').IsNull then f.FdsUser.FieldByName('SHTAMP_CUR').AsInteger:=0;

  if f.Fds.FieldByName('SHTAMP_CHOICE').AsInteger=0 then begin
    f.blShtamp.Visible:=false;
    f.lbShtamp.Visible:=false;
    f.edShtamp.Visible:=false;
    f.Height:=GetHeight(210);
    f.FdsUser.FieldByName('SHTAMP_CUR').AsInteger:=0;
  end else begin
    if f.Fds.FieldByName('SHTAMP_CHOICE').AsInteger=SHTAMP_CH3 then begin
      f.edShtamp.Items.CommaText:='"без штампа","штамп","гербовый штамп"';
      f.edShtamp.KeyItems.CommaText:='0,1,2';
    end;
    if f.Fds.FieldByName('SHTAMP_CHOICE').AsInteger=SHTAMP_CH2 then begin    // штамп обязательно должен быть
      f.edShtamp.Items.CommaText:='"штамп","гербовый штамп"';
      f.edShtamp.KeyItems.CommaText:='1,2';
      if f.FdsUser.FieldByName('SHTAMP_CUR').AsInteger=0
        then f.FdsUser.FieldByName('SHTAMP_CUR').AsInteger:=1;
    end;
  end;

  if f.Fds.FieldByName('PODP_COUNT').AsInteger<3 then begin
    f.edDolgPodp3.Visible:=false;
    f.cbPodp3.Visible:=false;
    f.Label3.Visible:=false;
    f.Height:=GetHeight(180);
  end;
  if f.Fds.FieldByName('PODP_COUNT').AsInteger<2 then begin
    f.edDolgPodp2.Visible:=false;
    f.cbPodp2.Visible:=false;
    f.Label2.Visible:=false;
    f.Label1.Caption:='Подпись';
    f.Height:=GetHeight(150);
  end;
  Result:=false;
  f.CreateList;
  f.edDolgPodp2.Enabled:=f.cbPodp2.Checked;
  f.edDolgPodp3.Enabled:=f.cbPodp3.Checked;
  if f.ShowModal=mrOk then begin
    try
      if (f.Fds.FieldByName('SHTAMP_CHOICE').AsInteger=SHTAMP_CH2) and    // штамп обязательно должен быть
         (f.edShtamp.ItemIndex=-1) then begin
        f.edShtamp.ItemIndex:=0;
      end;
      f.FdsUser.Post;
    except
      PutError('Ошибка записи.');
    end;
    Result:=true;
  end else begin
    f.FdsUser.Cancel;
  end;

  FreeAndNil(f);
end;

{ TfmRunSprav_UserProp }

procedure TfmRunSprav_UserProp.CreateList;
begin
  edDolgPodp1.Items.Assign(Fsl1);
  edDolgPodp1.KeyItems.Assign(Fsl2);
  edDolgPodp2.Items.Assign(Fsl1);
  edDolgPodp2.KeyItems.Assign(Fsl2);
  edDolgPodp3.Items.Assign(Fsl1);
  edDolgPodp3.KeyItems.Assign(Fsl2);
end;

procedure TfmRunSprav_UserProp.cbPodp2Click(Sender: TObject);
begin
  edDolgPodp2.Enabled:=cbPodp2.Checked;
end;

procedure TfmRunSprav_UserProp.cbPODP3Click(Sender: TObject);
begin
  edDolgPodp3.Enabled:=cbPodp3.Checked;
end;

end.
