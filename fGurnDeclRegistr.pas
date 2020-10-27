unit fGurnDeclRegistr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, FuncPr,
  TB2Item, TB2Dock, TB2Toolbar, FR_PTabl, ImgList, Menus, StdCtrls, Mask,
  DBCtrlsEh, vchDBCtrls, TB2ToolWindow;

type
  TfmGurnDeclRegistr = class(TfmGurnal)
    TBToolWindow1: TTBToolWindow;
    lbSost: TLabel;
    edSeek: TDBEditEh;
    Label1: TLabel;
    procedure FormResize(Sender: TObject);
    procedure edSeekEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSeekChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CheckPropertyGridColumns; override;
    procedure GridColumnsGetOtkuda(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure SetFilter;

    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
  end;

var
  fmGurnDeclRegistr: TfmGurnDeclRegistr;

implementation

uses dBase;

{$R *.DFM}

{ TfmGurnTalonPrib }

constructor TfmGurnDeclRegistr.Create(Owner: TComponent);
begin
  TypeEditObj := dmBase.TypeObj_DeclareRegistr;
  inherited;
  QuestDel := '  Удалить текущее заявление ?  ';
end;

function TfmGurnDeclRegistr.LoadQuery: Boolean;
begin
  Result := inherited LoadQuery;
end;

//-------------------------------------------------------------
procedure TfmGurnDeclRegistr.CheckPropertyGridColumns;
var
  c : TColumnEh;
begin
  try
    c := Grid.FieldColumns['OTKUDA'];
    if c<>nil then c.OnGetCellParams := GridColumnsGetOtkuda;
  except
  end;
  inherited;
end;

procedure TfmGurnDeclRegistr.GridColumnsGetMestoR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
//
end;

procedure TfmGurnDeclRegistr.GridColumnsGetOtkuda(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := dmBase.GetAdresAkt3(Query,'GOSUD_O,FName;OBL_O,B_OBL_O;RAION_O;GOROD_O,GOROD_O_B;',1,true);
//  Params.Text := '';
//  if dmBase.tbTalonPrib.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
//    Params.Text := dmBase.GetAdresAkt3(dmBase.tbTalonPrib,'GOSUD_O,FName;OBL_O,B_OBL_O;RAION_O;GOROD_O,GOROD_O_B;',1);
//  end;
end;

procedure TfmGurnDeclRegistr.FormResize(Sender: TObject);
begin
  TBToolWindow1.DockPos:=1400;
end;

procedure TfmGurnDeclRegistr.SetFilter;
var
  ss, strFilter : String;
  n,nLen : Integer;
begin
  if (edSeek.Text = '') then begin
    Query.Filtered := false;
  end else begin
    strFilter := '';
    if (edSeek.Text <> '') then begin
      ss:=Trim(edSeek.Text);
      nLen := Length(ss);
      if nLen>0 then begin
        n:=Pos(' ',ss);
        if n>0 then begin
          strFilter := 'SUBSTR(FAMILIA,1,'+IntToStr(n-1)+')='+QStr(Copy(ss,1,n-1))+
                          '.and. SUBSTR(NAME,1,'+IntToStr(nLen-n)+')='+QStr(Copy(ss,n+1,20));
        end else begin
          strFilter := 'SUBSTR(FAMILIA,1,'+IntToStr(nLen)+')='+QStr(ss);
        end;
      end;
    end;
    if strFilter='' then begin
      Query.Filtered := false
    end else begin
      Query.Filter   := strFilter;
      Query.Filtered := true;
    end;
  end;
end;

procedure TfmGurnDeclRegistr.edSeekEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edSeek.Text:='';
end;

procedure TfmGurnDeclRegistr.edSeekChange(Sender: TObject);
begin
  SetFilter;
end;

end.
