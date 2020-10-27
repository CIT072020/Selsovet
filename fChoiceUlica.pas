unit fChoiceUlica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fLookUp, ImgList, TB2Item, Menus, Db, TB2Dock, TB2Toolbar, ComCtrls,
  ExtCtrls, Grids, DBGridEh, SasaDBGrid, StdCtrls, Mask, DBCtrlsEh, dBase, dbFunc, FuncPr
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmChoiceUlica = class(TfmLookUp)
    Panel1: TPanel;
    Label2: TLabel;
    edUL: TDBEditEh;
  private
    FActiceOnCahnge : Boolean;
  public
    function SetFilterUlica : Boolean;
  end;

  function ChoiceUlica( Control : TControl; strSeek : String;
           var arrRec : TCurrentRecord) : Boolean;


implementation

{$R *.DFM}

function ChoiceUlica( Control : TControl; strSeek : String;
         var arrRec : TCurrentRecord) : Boolean;
var
  st : TSostTable;
  v,old : Variant;
  lChoice : Boolean;
  f : TfmChoiceUlica;
begin
  st := SaveSostTable(dmBase.SprUL,true,false);
  dmBase.SprUL.IndexName := 'NAME_KEY';
  Result := false;
  v := null;
  old := v;
  f := TfmChoiceUlica.Create(nil);
  f.FActiceOnCahnge := false;
  f.edUL.Text      := strSeek;
  f.Flat := GlobalFlat;
  f.EnableDetail :=false;
  f.OpisEdit     := nil; //Self;
  f.EnableEdit   := false;
  SetLength(arrRec,1);
  lChoice:=f.Execute(Control, dmBase.SprUL, 'ID', v, arrRec, '', nil);
  f.Free;
  if (v<>null) and lChoice then begin //(old<>v) then begin
    Result := true;
  end;
  dmBase.SprUL.Filter   := '';
  dmBase.SprUL.Filtered := false;
  RestSostTable(dmBase.SprUL, st);
end;

function TfmChoiceUlica.SetFilterUlica : Boolean;
var
  s : String;
begin
  Result := false;
  if FActiceOnCahnge then begin
    if Trim(edUL.Text)<>'' then begin
      s := Trim(edUL.Text);
      dmBase.SprUL.Filter   := 'SUBSTR(name,1,'+IntToStr(Length(s))+')='+QStr(s);
      dmBase.SprUL.Filtered := true;
      strNameFilter:='‘»À‹“–';
      SetCaptionForm;
      tbClr.Visible := true;
      Result := true;
    end else begin
      dmBase.SprUL.Filter   := '';
      dmBase.SprUL.Filtered := false;
      strNameFilter:='';
      SetCaptionForm;
      tbClr.Visible := false;
    end;
  end;
end;

end.
