unit fChoiceGIS_ZAGS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uProjectAll, uTypes,
  Dialogs, fLookUp, ImgList, TB2Item, Menus, DB, TB2Dock, TB2Toolbar, FuncPr, dbFunc,
  ComCtrls, ExtCtrls, Grids, DBGridEh, SasaDBGrid;

type
  TfmChoiceGIS_Class = class(TfmLookUp)
    procedure btClrClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    FClass:Integer;
    FPar:TStringList;
    function SetAutoFilter( ParamFlt : TParamFieldFlt; var lExit : Boolean) : Boolean; override;
    procedure CreateNameSection( DataSet : TDataSet; strDop : String); override;
  end;

  function ChoiceGIS_Class( Control : TControl; strSeek : String; strFilter : String; var arrRec : TCurrentRecord; slPar:TStringList) : Boolean;


implementation

uses dBase;

{$R *.dfm}

function ChoiceGIS_Class( Control : TControl; strSeek : String; strFilter : String; var arrRec : TCurrentRecord; slPar:TStringList) : Boolean;
var
  v,old : Variant;
  lChoice : Boolean;
  f : TfmChoiceGIS_Class;
begin
  Result := false;
  v := null;
  f := TfmChoiceGIS_Class.Create(nil);
  f.FPar:=slPar;
  f.FClass:=StrToInt(ValueFromParams(slPar,'CLASS',IntToStr(ctZags)));
  f.Caption:=ValueFromParams(slPar,'NAME','Выбор органа регистрации');

  dmBase.AllSprGISUN.IndexName:=ValueFromParams(slPar,'INDEX','LEX3_KEY');
  dmBase.AllSprGISUN.SetRange([f.FClass],[f.FClass]);
  f.DataSource.DataSet:=dmBase.AllSprGISUN;

  old := v;
  if strFilter<>'' then begin
    dmBase.AllSprGISUN.Filter:=strFilter;
    dmBase.AllSprGISUN.Filtered:=true;
  end;
  f.Flat := GlobalFlat;
  f.EnableDetail :=false;
  f.OpisEdit     := nil; //Self;
  f.EnableEdit   := false;
  SetLength(arrRec,1);
  if strSeek<>'' then f.ActiveControl:=f.Grid;

  lChoice:=f.Execute(Control, dmBase.AllSprGISUN, 'EXTCODE', v, arrRec, '', nil);
  if lChoice then begin
    if (v<>null) then begin   // выбрали
      Result := true;
    end;
  end;
  f.Free;
  if strFilter<>'' then begin
    dmBase.AllSprGISUN.Filter:='';
    dmBase.AllSprGISUN.Filtered:=false;
  end;
  dmBase.AllSprGISUN.CancelRange;
  FreeAndNil(slPar);
//  if Params.lDestroy then begin
//    FreeAndNil(Params);
//  end;
end;


procedure TfmChoiceGIS_Class.btClrClick(Sender: TObject);
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

procedure TfmChoiceGIS_Class.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
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
function TfmChoiceGIS_Class.SetAutoFilter(ParamFlt: TParamFieldFlt;  var lExit: Boolean): Boolean;
begin
//  FActiceOnCahnge := true;
//  Result := SetFilterMens;
end;

//--------------------------------------------------------------------------
procedure TfmChoiceGIS_Class.CreateNameSection(DataSet: TDataSet; strDop: String);
var
  s : String;
begin
  if (OpisEdit<>nil) and (OpisEdit.ConfSection<>'') then begin
    s := OpisEdit.ConfSection;
  end else begin
    s:=ValueFromParams(FPar,'SECTION','GIS_ZAGS');
  end;
  FSection := s+strDop;
  FSectionDop :='Dop_'+s+strDop;
end;

procedure TfmChoiceGIS_Class.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
                                              State: TGridDrawState);
var
 s:String;
begin
  if FClass=ctZags then begin
    if Column.Field.FieldName='LEX1'then begin
      s:=Column.Field.DataSet.FieldByName('LEX3').AsString;
      if Copy(s,1,1)='8' then begin
        if Copy(s,2,9)='000000000' then begin
          AFont.Style:=[fsBold,fsUnderline];
        end;
      end else begin
        if Copy(s,2,9)='000000000' then begin
          AFont.Style:=[fsBold,fsUnderline];
        end else if (Copy(s,5,6)='000000') or (Copy(s,5,6)='501000') then begin
          AFont.Style:=[fsBold];
        end;
      end;
    end;
  end;
end;

end.

