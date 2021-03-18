unit fGurnNakl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, uProject,
  TB2Item, TB2Dock, TB2Toolbar, dBase, Menus, ImgList, DBCtrlsEh, StdCtrls, MetaTask, OpisEdit, FuncPr,
  Mask, TB2ToolWindow, ComCtrls, ExtCtrls;

type
  TfmGurnNakl = class(TfmGurnal)
    pnFilter: TPanel;
    Label4: TLabel;
    edTip: TDBComboBoxEh;
    Label3: TLabel;
    edFamilia: TDBEditEh;
    procedure edTipEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edTipChange(Sender: TObject);
    procedure edFamiliaChange(Sender: TObject);
    procedure edFamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure CheckPropertyGridColumns; override;
    procedure GridColumnsAdresat(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure GridColumnsGT_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsRG_ADRES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    constructor Create(Owner : TComponent); override;
    function  LoadQuery : Boolean; override;
    procedure QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure SetFilter;
//    function getAdditiveWhere: String; override;
    function getDefaultAddWhere: String; override;

  end;

var
  fmGurnNakl: TfmGurnNakl;

implementation

{$R *.DFM}

{ TfmGurnNakl }

constructor TfmGurnNakl.Create(Owner: TComponent);
var
  Opis:TOpisEdit;
  i:Integer;
begin
  TypeEditObj := dmBase.TypeObj_RasxNaklSvid;
  inherited;
  FInterObj:=true;
  {
  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_ADDDOK_ZAGS');
  if Opis.Items.Count=0 then begin
    edTip.Visible:=false;
  end else begin
    for i:=0 to Opis.Items.Count-1 do begin
      edTip.Items.Add(Opis.Items[i]);
      edTip.KeyItems.Add(Opis.KeyList[i]);
    end;
  end;
  }
end;

function TfmGurnNakl.LoadQuery: Boolean;
var
  c : TColumnEh;
begin
  Result := inherited LoadQuery;
  {
  try
    c := Grid.FieldColumns['GT_ADRES'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsGT_ADRES;
    end;
  except
  end;
  try
    c := Grid.FieldColumns['RG_ADRES'];
    if c<>nil then begin
      c.OnGetCellParams := GridColumnsRG_ADRES;
    end;
  except
  end;
  }
end;
//function TfmGurnNakl.getAdditiveWhere: String;
//begin
//end;

function TfmGurnNakl.getDefaultAddWhere: String;
begin
  Result:='typeobj=26';
//  Result:=getAdditiveWhere;
end;

procedure TfmGurnNakl.QueryFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
end;

procedure TfmGurnNakl.GridColumnsGT_ADRES(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := '';
//  if dmBase.tbDeclBrak.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
//    Params.Text := dmBase.GetAdresAkt3(dmBase.tbDeclBrak,
//    'GT_GOSUD,FName;GT_OBL,GT_B_OBL;GT_RAION;GT_GOROD,GT_B_GOROD;GT_GOROD_R',1);
//  end;
end;

procedure TfmGurnNakl.GridColumnsRG_ADRES(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text := '';
//  if dmBase.tbDeclBrak.Locate('ID', Query.FieldByName('ID').AsInteger,[]) then begin
//    Params.Text := dmBase.GetAdresAkt3(dmBase.tbDeclBrak,
//    'RG_GOSUD,FName;RG_OBL,RG_B_OBL;RG_RAION;RG_GOROD,RG_B_GOROD;RG_GOROD_R',1);
//  end;
end;

procedure TfmGurnNakl.CheckPropertyGridColumns;
//var
//  c : TColumnEh;
begin
//  try
//    c := Grid.FieldColumns['ADRESAT'];
//    if c<>nil then c.OnGetCellParams := GridColumnsAdresat;
//  except
//  end;
  inherited;
end;

//--------------------------------------------------------------------
procedure TfmGurnNakl.SetFilter;
var
  s, strFilter : String;
  nLen,n : Integer;
begin
  if (edTip.ItemIndex = -1) and (edFamilia.Text = '')  then begin
    Query.Filtered := false;
  end else begin
    strFilter := '';

    if (edTip.ItemIndex > -1) then begin
      s:='typedok='+edTip.KeyItems[edTip.ItemIndex];
      if strFilter=''
        then strFilter := s
        else strFilter := strFilter + ' and ' + s;
    end;

    strFilter:=AddFilter_FAMILIA_NAME(strFilter,edFamilia.Text);
 {
    if (Trim(edFamilia.Text) <> '') then begin
      s:=Trim(edFamilia.Text);
      nLen:=Length(s);
      n:=Pos(' ',s);
      if n>0 then begin
        s := 'FAMILIA='+QStr(Copy(s,1,n-1)+'*')+
                        'and NAME='+QStr(Copy(s,n+1,20)+'*');
      end else begin
        s := 'FAMILIA='+QStr(s+'*');
      end;
      if strFilter=''
        then strFilter := s
        else strFilter := strFilter + ' and ' + s;
    end;
 }
    if strFilter='' then begin
      Query.Filtered := false
    end else begin
      Query.Filter   := strFilter;
      Query.Filtered := true;
    end;
  end;
end;

procedure TfmGurnNakl.edTipEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edTip.ItemIndex:=-1;
end;

procedure TfmGurnNakl.edTipChange(Sender: TObject);
begin  SetFilter; end;

procedure TfmGurnNakl.edFamiliaChange(Sender: TObject);
begin  SetFilter; end;

procedure TfmGurnNakl.edFamiliaEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edFamilia.Text:='';
end;

procedure TfmGurnNakl.GridColumnsAdresat(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Text:=StringReplace(Params.Text,'#',' ',[rfReplaceAll]);
  Params.Text:=StringReplace(Params.Text,chr(13),' ',[rfReplaceAll]);
end;

end.
