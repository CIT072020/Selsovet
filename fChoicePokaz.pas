unit fChoicePokaz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, Menus;

type
  TfmChoicePokaz = class(TForm)
    cb: TCheckListBox;
    btOk: TButton;
    btCancel: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    FPokaz : TStringList;
  public
    procedure CreateList;
  end;

  function EditVisiblePokaz(slPokaz : TStringList) : Boolean;

var
  fmChoicePokaz: TfmChoicePokaz;

implementation

{$R *.DFM}

function EditVisiblePokaz(slPokaz : TStringList) : Boolean;
var
  i : Integer;
begin
  Result := false;
  fmChoicePokaz := TfmChoicePokaz.Create(nil);
  fmChoicePokaz.FPokaz := slPokaz;
  fmChoicePokaz.CreateList;
  try
    if fmChoicePokaz.ShowModal=mrOk then begin
      Result := true;
      for i:=0 to fmChoicePokaz.cb.Items.Count-1 do begin
        if fmChoicePokaz.cb.Checked[i] then begin
          slPokaz.Objects[i] := Pointer(1);
        end else begin
          slPokaz.Objects[i] := Pointer(0);
        end;
      end;
    end;
  finally
    fmChoicePokaz.Free;
  end;
end;

procedure TfmChoicePokaz.CreateList;
var
  i,j : Integer;
  strName : String;
begin
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

procedure TfmChoicePokaz.N1Click(Sender: TObject);
var
  i : Integer;
begin
  for i:=0 to cb.Items.Count-1 do begin
    cb.Checked[i] := false;
  end;
end;

procedure TfmChoicePokaz.N2Click(Sender: TObject);
var
  i : Integer;
begin
  for i:=0 to cb.Items.Count-1 do begin
    cb.Checked[i] := true;
  end;
end;

end.






