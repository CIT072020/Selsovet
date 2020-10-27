unit fHistory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Metatask,
  StdCtrls, CheckLst, Menus;

type
  TfmHistory = class(TForm)
    cb: TCheckListBox;
    btOk: TButton;
    btCancel: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cbClear: TCheckBox;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FPokaz : TStringList;
    FControl : TStringList;
  public
    procedure CreateList;
  end;

  function EditAddHistory(slPokaz : TStringList; var nTypeRun:Integer; var lClear:Boolean) : Boolean;

implementation

{$R *.DFM}

function EditAddHistory(slPokaz : TStringList; var nTypeRun:Integer; var lClear:Boolean) : Boolean;
var
  i : Integer;
  fmHistory: TfmHistory;
begin
  nTypeRun:=0;
  Result := false;
  fmHistory := TfmHistory.Create(nil);
  fmHistory.FPokaz := slPokaz;
  fmHistory.CreateList;
  fmHistory.cbClear.Checked:=GlobalTask.GetLastValueAsBoolean('ADD_CLEAR_HIST');
  for i:=0 to slPokaz.Count-1 do begin
    if slPokaz.Objects[i]<>nil then begin
      fmHistory.cb.Checked[i]:=Integer(slPokaz.Objects[i])=1;
    end;
  end;
  try
    if fmHistory.ShowModal=mrOk then begin
      GlobalTask.SetLastValueAsBoolean('ADD_CLEAR_HIST',fmHistory.cbClear.Checked);
      lClear:=fmHistory.cbClear.Checked;
      Result := true;
      for i:=0 to fmHistory.cb.Items.Count-1 do begin
        if fmHistory.cb.Checked[i] then begin
          slPokaz.Objects[i] := Pointer(1);
        end else begin
          slPokaz.Objects[i] := Pointer(0);
        end;
      end;
    end;
  finally
    fmHistory.Free;
  end;
end;

procedure TfmHistory.CreateList;
var
  i,j : Integer;
  strName : String;
begin
  FControl:=TStringList.Create;
  for i:=0 to FPokaz.Count-1 do begin
    j := Pos('=',FPokaz.Strings[i]);
    if j>0 then begin
      strName := Copy(FPokaz.Strings[i],j+1,200);
    end else begin
      strName := FPokaz.Strings[i];
    end;
    cb.Items.Add(strName);
    j := cb.Items.Count-1;
    cb.Checked[j] := Integer(FPokaz.Objects[i])=1;
  end;
end;

procedure TfmHistory.N1Click(Sender: TObject);
var
  i : Integer;
begin
  for i:=0 to cb.Items.Count-1 do begin
    cb.Checked[i] := false;
  end;
end;

procedure TfmHistory.N2Click(Sender: TObject);
var
  i : Integer;
begin
  for i:=0 to cb.Items.Count-1 do begin
    cb.Checked[i] := true;
  end;
end;

procedure TfmHistory.FormDestroy(Sender: TObject);
begin
  FControl.Free;
end;

end.






