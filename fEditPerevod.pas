unit fEditPerevod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fEditSpr, ActnList, ImgList, PrnDbgeh, Menus, Db, ComCtrls, ExtCtrls,
  TB2Item, TB2Dock, TB2Toolbar, Grids, DBGridEh, SasaDBGrid, StdCtrls, MetaTask;

type
  TfmEditPerevod = class(TfmEditSpr)
    Panel1: TPanel;
    rbObl: TRadioButton;
    rbRn: TRadioButton;
    rbPunkt: TRadioButton;
    rbRnGor: TRadioButton;
    procedure rbOblClick(Sender: TObject);
    procedure rbRnClick(Sender: TObject);
    procedure rbPunktClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure TBItemOneDetailClick(Sender: TObject);
    procedure rbRnGorClick(Sender: TObject);
  private
    { Private declarations }
    FRange : Integer;
  public
    { Public declarations }
    procedure SetNewRange( n : Integer );
    procedure EditRecordSprPerevod( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
  end;

  procedure EditPerevod;

implementation

uses dBase, uProject, FuncEh, mPermit;

{$R *.DFM}

procedure EditPerevod;
var
  fmEditPerevod : TfmEditPerevod;
  Param : TParamsEditSpr;
  n:Integer;
begin
  try
    dmBase.SprPerevod.IndexName := 'PR_KEY';
    fmEditPerevod := TfmEditPerevod.Create(Application.MainForm);
    fmEditPerevod.DataSet := dmBase.SprPerevod;
    Param := TParamsEditSpr.Create;
    Param.OnBeforeSave := fmEditPerevod.EditRecordSprPerevod;
    fmEditPerevod.ParamsEditSpr := Param;
    fmEditPerevod.LoadFromIni( Globaltask.iniFile('SPR'),'');

    n:=Role.EnableEditTable(dmBase.SprPerevod.TableName,0);
    if (n=-1) or (n=1)
      then fmEditPerevod.EnableEdit:=true
      else fmEditPerevod.EnableEdit:=false;

    fmEditPerevod.ShowModal;
    fmEditPerevod.Free;
  finally
    dmBase.SprPerevod.CancelRange;
  end;
end;

procedure TfmEditPerevod.rbOblClick(Sender: TObject);
begin
  SetNewRange(1);
end;

procedure TfmEditPerevod.rbRnClick(Sender: TObject);
begin
  SetNewRange(2);
end;

procedure TfmEditPerevod.rbRnGorClick(Sender: TObject);
begin
  SetNewRange(4);
end;

procedure TfmEditPerevod.rbPunktClick(Sender: TObject);
begin
  SetNewRange(3);
end;

procedure TfmEditPerevod.FormCreate(Sender: TObject);
begin
  SetNewRange(3);
end;

procedure TfmEditPerevod.SetNewRange(n: Integer);
begin
  FRange := n;
  dmBase.SprPerevod.DisableControls;
  dmBase.SprPerevod.CancelRange;
  dmBase.SprPerevod.SetRange([n],[n]);
  dmBase.SprPerevod.EnableControls;
  ActiveControl := Grid;
end;

procedure TfmEditPerevod.EditRecordSprPerevod( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
begin
  dmBase.SprPerevod.FieldByName('TIP').AsInteger := FRange;
end;

procedure TfmEditPerevod.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  inherited;
  if (Key=49) and (Shift=[]) then begin
    rbObl.Checked:=true;
  end;
  if (Key=50) and (Shift=[]) then begin
    rbRn.Checked:=true;
  end;
  if (Key=51) and (Shift=[]) then begin
    rbRnGor.Checked:=true;
  end;
  if (Key=52) and (Shift=[]) then begin
    rbPunkt.Checked:=true;
  end;

end;

procedure TfmEditPerevod.TBItemOneDetailClick(Sender: TObject);
begin
//
end;


end.
