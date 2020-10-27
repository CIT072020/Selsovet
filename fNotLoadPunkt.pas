unit fNotLoadPunkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CheckLst, Db, FuncPr;

type
  TfmNotLoadPunkt = class(TForm)
    chList: TCheckListBox;
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function NotLoadPunkts(ds:TDataSet; sl:TStringList) : Boolean;

implementation

{$R *.dfm}

function NotLoadPunkts(ds:TDataSet; sl:TStringList) : Boolean;
var
  f   : TfmNotLoadPunkt;
  i:Integer;
begin
  f:=TfmNotLoadPunkt.Create(nil);
  ds.First;
  while not ds.Eof do begin
    f.chList.AddItem(ds.FieldByName('FULLNAME').AsString, Pointer(ds.FieldByName('PUNKT').AsInteger));
    ds.Next;
  end;
  for i:=0 to f.chList.Count-1 do f.chList.Checked[i]:=true;
  sl.Clear;
  if f.ShowModal=mrOk then begin
    for i:=0 to f.chList.Count-1 do begin
      if not f.chList.Checked[i] then begin
        sl.Add(intToStr(Integer(f.chList.Items.Objects[i])));
      end;
    end;
    if f.chList.Count=sl.Count
      then Result:=false
      else Result:=true;
  end else begin
    Result:=false;
  end;
  f.Free;
end;

end.
