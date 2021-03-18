unit fGurnZUstMat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid,
  TB2Item, TB2Dock, TB2Toolbar, ImgList, Menus, ComCtrls, ExtCtrls;

type
  TfmGurnZUstMat = class(TfmGurnal)
  private
    { Private declarations }
  public
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
  end;

var
  fmGurnZUstMat: TfmGurnZUstMat;

implementation

uses dBase;

{$R *.DFM}

{ TfmGurnZUstMat }

constructor TfmGurnZUstMat.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_ZUstMat;
  inherited;
  VisibleItems([TBItemAddDok], true);
  VisibleItems([TBItemGrantSprav], false);
end;

function TfmGurnZUstMat.LoadQuery: Boolean;
begin
  Result := inherited LoadQuery;
  CreateSysFlt_GISUN;
end;

end.
