unit fChoiceAkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fLookUp, ImgList, TB2Item, Menus, DB, TB2Dock, TB2Toolbar, FuncPr, dbFunc, OpisEdit,
  ComCtrls, ExtCtrls, Grids, DBGridEh, SasaDBGrid;

type
  TfmChoiceAkt = class(TfmLookUp)
    procedure btClrClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function SetAutoFilter( ParamFlt : TParamFieldFlt; var lExit : Boolean) : Boolean; override;
    function SetRangeAkt:Boolean;
    procedure CreateNameSection( DataSet : TDataSet; strDop : String); override;
  end;

  function ChoiceAkt(Opis:TOpisEdit; Control:TControl; var CurValue: Variant; var arrRec : TCurrentRecord; ParamFlt : TParamFieldFlt): Boolean;


implementation

{$R *.dfm}

function ChoiceAkt(Opis:TOpisEdit; Control:TControl; var CurValue: Variant; var arrRec : TCurrentRecord; ParamFlt : TParamFieldFlt): Boolean;
var
  v,old : Variant;
  lChoice : Boolean;
  f : TfmChoiceAkt;
begin
  Result := false;
  if (Opis.DataSet<>nil) and Opis.DataSet.Active then begin
    v := CurValue;
    old := v;
    lChoice:=true;
    f := TfmChoiceAkt.Create(nil);
    f.Flat:=GlobalFlat;
    f.EnableDetail:=false;
    f.OpisEdit := Opis;
    f.EnableEdit:=Opis.EnableEditSpr;
    try
//         if MultiSelect then begin
//           s := VarToStr(v);
//           if Control = nil then begin
//             lChoice:=f.ExecuteMultiSelect(nil, DataSet, ResultField, s, NameSort);
//           end else begin
//             lChoice:=f.ExecuteMultiSelect(Control, DataSet, ResultField, s, NameSort);
//           end;
//           v := s;
//         end else begin
        if ParamFlt = nil then begin
          lChoice:=f.ExecuteSelect(Control, Opis.DataSet, Opis.ResultField, v, arrRec, Opis.NameSort, nil);
        end else begin
          lChoice:=f.Execute(Control, Opis.DataSet, Opis.ResultField, v, arrRec, Opis.NameSort, ParamFlt);
        end;
//         end;
   finally
     f.Free;
   end;
   if (v<>null) and lChoice then begin //(old<>v) then begin
     Result := true;
     CurValue := v;
   end;
  end;
end;
//-------------------------------------------------------------------------
function TfmChoiceAkt.SetRangeAkt : Boolean;
var
  s : String;
  n : Integer;
//  ParamFlt : TParamFieldFlt;
begin
  Result := false;
end;
//-------------------------------------------------------------------------
procedure TfmChoiceAkt.btClrClick(Sender: TObject);
begin
  inherited;
{
  if FilterIsTemp then begin
    if strConstFilter=''
      then strFirstFilter:=''
      else strFirstFilter:=strConstFilter;
    FilterIsTemp:=false;
  end;

//  if FilterIsTemp then begin
//    strFirstFilter:='';
//    FilterIsTemp:=false;
//  end;
  strNameFilter:='';
  edFam.Text:='';
  tbClr.Visible := false;
  SetFilterMens;
  }
end;

procedure TfmChoiceAkt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key=VK_RETURN) and (Shift=[]) then begin
     if not Grid.EditorMode then begin
       TBItemChoiceClick(Sender);
       Key := 0;
     end;
  end else if (Key=VK_ESCAPE) and (Shift=[]) then begin
    SpeedButton2Click(Sender);
    Key := 0;
  end else if (Key=VK_F4) and (Shift=[]) then begin
    if Grid.SelectedIndex>-1 then begin
      GridTitleBtnClick(Grid, Grid.SelectedIndex,
        Grid.Columns[Grid.SelectedIndex]);
      Key := 0;
    end;
  end;
  Grid.MyUserKeyDown(Sender,Key,Shift);
end;

//--------------------------------------------------------------------------
function TfmChoiceAkt.SetAutoFilter(ParamFlt: TParamFieldFlt;  var lExit: Boolean): Boolean;
begin
  Result:=inherited SetAutoFilter(ParamFlt,lExit);
//  FActiceOnCahnge := true;
//  Result := SetFilterMens;
end;

//--------------------------------------------------------------------------
procedure TfmChoiceAkt.CreateNameSection(DataSet: TDataSet; strDop: String);
var
  s : String;
begin
  if (OpisEdit<>nil) and (OpisEdit.ConfSection<>'') then begin
    s := OpisEdit.ConfSection;
  end else begin
    s := DataSet.Name
  end;
  FSection := s+strDop;
  FSectionDop :='Dop_'+s+strDop;
end;

end.

