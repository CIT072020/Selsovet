unit fClearZakl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FuncPr, Variants, uTypes,
  fSimpleDialog, StdCtrls, Buttons, ExtCtrls, CheckLst;

type
  TfmClearZakl = class(TfmSimpleDialog)
    clProp: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FRazdel:String;
    FTypeObj:Integer;
    slProp:TStringList;
    procedure CreateListProp;
    procedure UpdateActions; override;
  end;

var
  fmClearZakl: TfmClearZakl;

implementation

uses dBase;

{$R *.DFM}

{ TfmClearZakl }

procedure TfmClearZakl.UpdateActions;
var
  i:Integer;
  lOk:Boolean;
begin
  inherited;
  lOk:=false;
  for i:=0 to clProp.Count-1 do begin
    if clProp.Checked[i]
      then lOk:=true;
    if lOk then break;
  end;
  btOk.Enabled := lOk;
end;

procedure TfmClearZakl.CreateListProp;
var
  i,idRazdel : Integer;
  vKeyValues : Variant;
  arr : TArrStrings;
  s,sKod:String;
begin
  clProp.Items.Clear;
  StrToArr(FRazdel, arr, ',', true);
  for i:=Low(arr) to High(arr) do begin
    vKeyValues := VarArrayCreate( [0, 1], varOleStr );
    vKeyValues[0] := FTypeObj;
    vKeyValues[1] := StrToInt(arr[i]);
    if dmBase.SprRazdel.Locate('TYPEOBJ;NOMER', vKeyValues, []) then begin
      idRazdel := dmBase.SprRazdel.FieldByName('ID').AsInteger;
      caption:=dmBase.SprRazdel.FieldByName('FNAME').AsString;
      dmBase.SprProperty.IndexName := 'KEY_VIEW';
      dmBase.SprProperty.SetRange([FTypeObj,idRazdel],[FTypeObj,idRazdel]);
      try
        while not dmBase.SprProperty.Eof do begin
          s:=dmBase.SprProperty.FieldByName('FNAME').AsString;
          sKod:=dmBase.SprProperty.FieldByName('KOD').AsString;
          if (Pos('GOSAKT', sKod)=0) and (Trim(s)<>'') then begin
            if (dmBase.SprProperty.FieldByName('VID').AsString='1') then begin
              clProp.Items.Add(s);
              slProp.Add(sKod);
            end else begin
              clProp.Items.Add(s);
              clProp.Header[clProp.Count-1]:=true;
              slProp.Add('*');
            end;
          end;
          dmBase.SprProperty.Next;
        end;
      finally
        dmBase.SprProperty.CancelRange;
      end;
    end;
  end;
//  clProp.Header[1]:=true;
//  clProp.ItemEnabled[1]:=false;  !!!
end;

procedure TfmClearZakl.FormCreate(Sender: TObject);
begin
  FRazdel:='11';
  FTypeObj:=_TypeObj_Lich;
  slProp:=TStringList.Create;
end;

procedure TfmClearZakl.FormDestroy(Sender: TObject);
begin
  slProp.Free;
  inherited;
end;

end.
