unit fGurnDIzm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uTypes,
  TB2Item, TB2Dock, TB2Toolbar, dBase, ImgList, Menus, ComCtrls, ExtCtrls;

type
  TfmGurnDIzm = class(TfmGurnal)
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Event_CheckPropertyGridColumns(Sender:TObject);
    procedure GridColumnsST1(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
  end;

var
  fmGurnDIzm: TfmGurnDIzm;

implementation

uses fMain;

{$R *.DFM}

{ fmGurnDIzm }

constructor TfmGurnDIzm.Create(Owner: TComponent);
begin
  TypeEditObj := _TypeObj_DIzm;
  inherited;
end;

function TfmGurnDIzm.LoadQuery: Boolean;
var
  c : TColumnEh;
begin
  Result := inherited LoadQuery;
  try
    c := Grid.FieldColumns['DOKUMENT'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsDOKUMENT;
    end;
  except
  end;
  CreateSysFlt_GISUN;
end;

procedure TfmGurnDIzm.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
//var
//  fld : TField;
begin
{
  fld := Query.FindField('VOSSTAN');
  if (fld <> nil) and not fld.IsNull and fld.AsBoolean then begin
    AFont.Color := Grid.Color1;
  end;
  fld := Query.FindField('DATE_ANUL');
  if (fld <> nil) and not fld.IsNull then begin
    AFont.Color := clRed;
  end;
}
end;
//------------------------------------------------
procedure TfmGurnDIzm.Event_CheckPropertyGridColumns(Sender: TObject);
var
  c : TColumnEh;
  sField:String;
begin
//  grid.Hi nt:='1111111111';
  c:=TColumnEh(Sender);
  sField:=UpperCase(c.FieldName);
  if sField='ST21_INT' then begin
    c.OnGetCellParams:=GridColumnsST1;
    c.ImageList:=fmMain.ImageList;
    c.ToolTips:=true;
  end;
end;
//-------------------------------------
procedure TfmGurnDIzm.GridColumnsST1(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  Params.ImageIndex:=-1;
  if not EditMode then begin
    if Query.FieldByName('ST21_INT').AsInteger=1 then begin
      Params.ImageIndex:=IL_DECL_IZM_21;
    end else begin
      Params.ImageIndex:=IL_DECL_IZM;
    end;
  end;
end;
//-------------------------------------
procedure TfmGurnDIzm.FormCreate(Sender: TObject);
begin
  inherited;
  FEventCheckGrid:=Event_CheckPropertyGridColumns;
end;

end.
