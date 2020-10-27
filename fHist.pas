unit fHist;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uProject,
  StdCtrls, Buttons, ExtCtrls, fSimpleD,
  {$IFDEF ADD_MENS_PU}
  fSimple,
  {$ENDIF}
  DBCtrlsEh, Db, Grids, DBGridEh,
  FuncPr;

type
  TfmHist = class(TForm)
    Panel1: TPanel;
    btDel: TBitBtn;
    btClose: TBitBtn;
    Grid: TDBGridEh;
    DataSource: TDataSource;
    procedure btDelClick(Sender: TObject);
  private
    { Private declarations }
    FComp : TCustomDbEditEh;
    form  : TfmSimpleD;
{$IFDEF ADD_MENS_PU}
    formDok: TfmSimple;
{$ELSE}
    formDok: TfmSimpleD;
{$ENDIF}
  public
    { Public declarations }
    function EditModal : Boolean;
    procedure UpdateActions; override;
  end;

  procedure ShowHist( f : TfmSimpleD; comp : TCustomDbEditEh);
{$IFDEF ADD_MENS_PU}
  procedure ShowHistDok( f : TfmSimple; comp : TCustomDbEditEh);
{$ELSE}
  procedure ShowHistDok( f : TfmSimpleD; comp : TCustomDbEditEh);
{$ENDIF}

implementation

var
  fmHist: TfmHist;

{$R *.DFM}

{$IFDEF ADD_MENS_PU}
procedure ShowHistDok( f : TfmSimple; comp : TCustomDbEditEh);
begin
  fmHist:=TfmHist.Create(nil);
  fmHist.DataSource.DataSet := f.Dokument.tbHistory;
  fmHist.DataSource.DataSet.Filter   := 'FieldName='+QStr(UpperCase(Comp.Field.FieldName));
  fmHist.DataSource.DataSet.Filtered := true;
  fmHist.FComp := Comp;
  fmHist.formdok:= f;
  fmHist.form :=nil;
  try
    fmHist.EditModal;
  finally
    fmHist.DataSource.DataSet.Filter   := '';
    fmHist.DataSource.DataSet.Filtered := false;
    fmHist.Free;
  end;
end;
{$ELSE}
procedure ShowHistDok( f : TfmSimpleD; comp : TCustomDbEditEh);
begin
{
  fmHist:=TfmHist.Create(nil);
  fmHist.DataSource.DataSet := f.Dokument.tbHistory;
  fmHist.DataSource.DataSet.Filter   := 'FieldName='+QStr(UpperCase(Comp.Field.FieldName));
  fmHist.DataSource.DataSet.Filtered := true;
  fmHist.FComp := Comp;
  fmHist.formdok:= f;
  fmHist.form :=nil;
  try
    fmHist.EditModal;
  finally
    fmHist.DataSource.DataSet.Filter   := '';
    fmHist.DataSource.DataSet.Filtered := false;
    fmHist.Free;
  end;
}
end;
{$ENDIF}

procedure ShowHist( f : TfmSimpleD; comp : TCustomDbEditEh);
begin
  fmHist:=TfmHist.Create(nil);
  fmHist.DataSource.DataSet := f.HistZAGS;
  fmHist.DataSource.DataSet.Filter   := 'FieldName='+QStr(UpperCase(Comp.Field.FieldName));
  fmHist.DataSource.DataSet.Filtered := true;
  fmHist.FComp := Comp;
  fmHist.form := f;
  fmHist.formdok:=nil;
  try
    fmHist.EditModal;
  finally
    fmHist.DataSource.DataSet.Filter   := '';
    fmHist.DataSource.DataSet.Filtered := false;
    fmHist.Free;
  end;
end;

{ TfmHist }

function TfmHist.EditModal: Boolean;
begin
  ActiveControl:=Grid;
  if ShowModal = mrOk then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

procedure TfmHist.btDelClick(Sender: TObject);
begin
  if Problem(' Удалить значение из истории ? ') then begin
    DataSource.DataSet.Delete;
    if form<>nil then form.QueryExit:=true;
    if formdok<>nil then formdok.QueryExit:=true;
    if DataSource.DataSet.Eof and DataSource.DataSet.Bof then begin
      SetPropertyObject( FComp, 'Color', COLOR_NORM);
    end;
    ActiveControl := Grid;
  end;
end;

procedure TfmHist.UpdateActions;
begin
  inherited;
  if DataSource.DataSet.Eof and DataSource.DataSet.Bof then begin
    btDel.Enabled := false;
  end else begin
    btDel.Enabled := true;
  end;
end;

end.




