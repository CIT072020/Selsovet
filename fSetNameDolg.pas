unit fSetNameDolg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleDialog, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh, OpisEdit, dbFunc, MetaTask
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmSetNameDolg = class(TfmSimpleDialog)
    Label1: TLabel;
    Label2: TLabel;
    edRuk: TDBEditEh;
    edSpec: TDBEditEh;
    procedure edRukEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSpecEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure btChoiceClick(Sender: TDbEditEh);
  end;

  function EditDolgZAGS( var strRuk, strSpec : String) : Boolean;


implementation

{$R *.DFM}

function EditDolgZAGS( var strRuk, strSpec : String) : Boolean;
var
  fmSetNameDolg: TfmSetNameDolg;
begin
  result := false;
  fmSetNameDolg := TfmSetNameDolg.Create(nil);
  fmSetNameDolg.edRuk.text  := strRuk;
  fmSetNameDolg.edSpec.text := strSpec;
  if fmSetNameDolg.ShowModal = mrOk then begin
    strRuk  := fmSetNameDolg.edRuk.text;
    strSpec := fmSetNameDolg.edSpec.text;
    result := true;
  end;
  fmSetNameDolg.Free;
end;

procedure TfmSetNameDolg.btChoiceClick(Sender: TdbEditEh);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  old  : TCursor;
  ed : Tdbediteh;
begin
  v := Sender.Text;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_DOLG_NAME_ZAGS');
  if Opis<>nil then begin
    SetLength(arrRec,1);
    if pos(' ',v)>0 then v:=null;

    if Opis.ChoiceFromSprEx(Sender, v, arrRec, nil) and (v<>null) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      v := GetValueField(arrRec, 'NAME');
      if v <> null then begin
        Sender.Text := v;
      end;
      Screen.Cursor := old;
    end;
  end;
end;


procedure TfmSetNameDolg.edRukEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  btChoiceClick(edRuk);
end;

procedure TfmSetNameDolg.edSpecEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  btChoiceClick(edSpec);
end;

end.
