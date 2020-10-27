unit fGurnPassportViza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid,
  TB2Item, TB2Dock, TB2Toolbar, ImgList, Menus;

type
  TfmGurnPassportViza = class(TfmGurnal)
  private
    { Private declarations }
  public
    function  LoadQuery : Boolean; override;
    constructor Create(Owner : TComponent); override;
  end;

var
  fmGurnPassportViza: TfmGurnPassportViza;

implementation

uses dBase;

{$R *.DFM}

{ TfmGurnPassport }

constructor TfmGurnPassportViza.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_PassportViza ;
  inherited;
  QuestDel := '  Удалить заявление ?  ';
end;

function TfmGurnPassportViza.LoadQuery: Boolean;
begin
  Result := inherited LoadQuery;
end;

end.
