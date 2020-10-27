unit fGurnPassport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid,
  TB2Item, TB2Dock, TB2Toolbar, ImgList, Menus, ComCtrls, ExtCtrls;

type
  TfmGurnPassport = class(TfmGurnal)
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    function  LoadQuery : Boolean; override;
    procedure GridColumnsGetTypeDok(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    constructor Create(Owner : TComponent); override;
  end;

var
  fmGurnPassport: TfmGurnPassport;

implementation

uses dBase;

{$R *.DFM}

{ TfmGurnPassport }

constructor TfmGurnPassport.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_Passport;
  inherited;
  QuestDel := '  Удалить текущий документ ?  ';
  FInterObj:=true;
end;

//------------------------------------------------------------------------------------------------------
function TfmGurnPassport.LoadQuery: Boolean;
var
  c : TColumnEh;
  itDop : TTbItem;
begin
  Result := inherited LoadQuery;
  try
    c := Grid.FieldColumns['TYPEDOK'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsGetTypeDok;
    end;
  except
  end;
end;
//------------------------------------------------------------------------------------------------------
procedure TfmGurnPassport.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  fld : TField;
begin
  fld := Query.FindField('TYPEDOK');
  if (fld<>nil) and not fld.IsNull and (fld.AsInteger=dmBase.TypeObj_VidGit) then begin
    AFont.Color := clBlue;
  end;
end;
//------------------------------------------------------------------------------------------------------
procedure TfmGurnPassport.GridColumnsGetTypeDok(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  fld : TField;
begin
  fld := Query.FindField('TYPEDOK');
  if (fld<>nil) and (fld.AsInteger=dmBase.TypeObj_VidGit)
    then Params.text:='вид на жительство'
    else Params.text:='паспорт';
end;

end.
