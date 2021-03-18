unit fPovtorSvid;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, FuncPr, uProject,
  Dialogs, fTableGurnal, Menus, DB, adsdata, adsfunc, adstable, Grids, MetaTask,OpisEdit,
  DBGridEh, SasaDBGrid, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBCtrls,
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  TB2Item, TB2Dock, TB2Toolbar, ImgList;


type
  TfmPovtorSvid = class(TfmTableGurnal)
    pnFilter: TPanel;
    lbType: TLabel;
    edType: TDBComboBoxEh;
    ImageListGisun: TImageList;
    TBItemOpenAkt: TTBItem;
    TBItemOpenAkt24: TTBItem;
    procedure GridColumns4GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure FormCreate(Sender: TObject);
    procedure TBItemOpenAktClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edTypeChange(Sender: TObject);
    procedure edTypeEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure GridColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrepareMenu; override;
    procedure BeforeClearFilter; override;
    function BeforeChangeOrder : Boolean; override;
    procedure AfterChangeOrder; override;
  end;

var
  fmPovtorSvid: TfmPovtorSvid;

const
  COLUMN_GISRN=0;
  COLUMN_TYPESVID=1;

implementation

uses fMain,dBase;

{$R *.dfm}

procedure TfmPovtorSvid.GridColumns4GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  tb:TAdsTable;
  lOk:Boolean;
begin
  lOk:=false;
  tb:=dmBase.MainTableFromTypeObj(Table.FieldByName('SVID_TYPE').AsInteger);
  if tb<>nil then begin
    tb.IndexFieldNames:='ID';
    if tb.FindKey([Table.FieldByName('AKT_ID').AsInteger]) then begin
//    if tb.Locate('ID',Table.FieldByName('AKT_ID').AsInteger,[]) then begin
      lOk:=true;
      Params.Text:='№ '+tb.FieldByName('NOMER').AsString+' от '+DatePropis(tb.FieldByName('DATEZ').AsDateTime,3);
    end;
  end;
  if not lOk then begin
    Params.Text:='запись не найдена';
  end;
end;

procedure TfmPovtorSvid.FormCreate(Sender: TObject);
var
  Opis : TOpisEdit;
  i : Integer;                                                                          
begin
  inherited;
  FieldNotSeek:='AKT_ID;';   // поиск по колонке недоступен

  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS');
  for i:=0 to Opis.Items.Count-1 do begin
    Grid.Columns[COLUMN_TYPESVID].PickList.Add(Opis.Items[i]);
    Grid.Columns[COLUMN_TYPESVID].KeyList.Add(Opis.KeyList[i]);
    edType.Items.Add(Opis.Items[i]);
    edType.KeyItems.Add(Opis.KeyList[i]);
  end;
  Grid.Columns[COLUMN_GISRN].PickList.Add('Да');
  Grid.Columns[COLUMN_GISRN].KeyList.Add('1');
  Grid.Columns[COLUMN_GISRN].PickList.Add('Нет');
  Grid.Columns[COLUMN_GISRN].KeyList.Add('0');

  {
  dmBase.SvidSeria.First;
  while not dmBase.SvidSeria.Eof do begin
    Grid.Columns[COLUMN_SERIA].PickList.Add( dmBase.SvidSeria.FieldByName('SERIA').AsString );
    dmBase.SvidSeria.Next;
  end;
  }
//  dmBase.GetListOrganZAGS(Grid.Columns[COLUMN_ID_ZAGS].PickList, Grid.Columns[COLUMN_ID_ZAGS].KeyList,2);

end;

procedure TfmPovtorSvid.TBItemOpenAktClick(Sender: TObject);
var
  ds:TDataSet;
  slPar:TStringList;
begin
  if (Table.FieldByName('SVID_TYPE').AsInteger>0) and (Table.FieldByName('AKT_ID').AsInteger>0) then begin
    ds:=dmBase.MainTableFromTypeObj(Table.FieldByName('SVID_TYPE').AsInteger);
    if (ds<>nil) then begin
      if ds.Locate('ID',Table.FieldByName('AKT_ID').AsInteger,[]) then begin
        slPar:=nil;
        if (ds.FindField('VOSSTAN')<>nil) and ds.FieldByName('VOSSTAN').AsBoolean then begin
          slPar:=TStringList.Create;
          slPar.Add('VOSSTAN=1');
        end;
        fmMain.EditDokument(Table,Table.FieldByName('SVID_TYPE').AsInteger,'AKT_ID',slPar,false,'');
        FreeAndNil(slPar);
      end;
    end;
  end;
end;

procedure TfmPovtorSvid.FormActivate(Sender: TObject);
begin
  inherited;
  {$IFDEF GISUN}
    Grid.Columns[COLUMN_GISRN].Visible:=IsActiveGISUN;
  {$ELSE}
    Grid.Columns[COLUMN_GISRN].Visible:=false;
  {$ENDIF}
  Grid.Columns[COLUMN_TYPESVID].Alignment:=taLeftJustify;
end;
//----------------------------------------------------------------
procedure TfmPovtorSvid.edTypeChange(Sender: TObject);
begin
  if not FRunChange then begin
    FRunChange := true;
    try
      if (edType.Value<>null) and (edType.ItemIndex>-1) then begin
        FClearFilterControl:=false;
        ClearFilter;
        FClearFilterControl:=true;
        Table.SetRange([edType.KeyItems[edType.ItemIndex]],[edType.KeyItems[edType.ItemIndex]]);
        EnableItem(TBItemClrFlt, true);
      end else begin
        ClearFilter;
        EnableItem(TBItemClrFlt, false);
      end;
      SetCaptionGurnal(true,'');
    finally
      FRunChange := false;
    end;
  end;
end;
//----------------------------------------------------------------
procedure TfmPovtorSvid.edTypeEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edType.Value:='';
  edType.ItemIndex := -1;
  ClearFilter;
end;

procedure TfmPovtorSvid.BeforeClearFilter;
begin
  if FClearFilterControl then begin
    edType.Value:=null;
    edType.ItemIndex:=-1;
  end;
  Table.Scoped := false;
  Table.ScopeBegin:='';
  Table.ScopeEnd:='';
  Table.CancelRange;
  CurrentFilter:='';
  Table.OnFilterRecord:=nil;
  FSysFltCaption:='';
end;

function TfmPovtorSvid.BeforeChangeOrder: Boolean;
begin
  edType.Value  :='';
  edType.ItemIndex := -1;
  Result := true;
end;

procedure TfmPovtorSvid.AfterChangeOrder;
begin
  inherited;
  if FirstFieldInOrder('SVID_TYPE') then begin //Table.IndexName='SEEK_KEY'  then begin   // SVID_TYPE;SVID_DATE
    edType.Enabled:=true;
    lbType.Enabled:=true;
  end else begin
    edType.Enabled:=false;
    lbType.Enabled:=false;
  end;
end;

procedure TfmPovtorSvid.GridColumns0GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
{$IFDEF GISUN}
  if not EditMode then begin
    Params.ImageIndex:=Table.FieldByName('GISRN').AsInteger;
  end;
{$ENDIF}
end;

procedure TfmPovtorSvid.PrepareMenu;
begin
  CheckTbItems;
  pnFilter.Visible:=true;
end;

end.
