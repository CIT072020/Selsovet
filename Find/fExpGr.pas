unit fExpGr; // select export graf
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
   ComCtrls, StdCtrls, mExport, Menus;

type
   TSelectKind=(skAll, skClear, skChange);

   TfmExpGr=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      lvCol: TListView;
      pmSelecte: TPopupMenu;
      miSelAll: TMenuItem;
      miSelClear: TMenuItem;
      miSelChange: TMenuItem;
      stSelected: TStaticText;
      procedure FormResize(Sender: TObject);
      procedure miSelAllClick(Sender: TObject);
      procedure miSelClearClick(Sender: TObject);
      procedure miSelChangeClick(Sender: TObject);
      procedure lvColDblClick(Sender: TObject);
      procedure lvColKeyPress(Sender: TObject; var Key: Char);
      procedure lvColCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
      procedure lvColChange(Sender: TObject; Item: TListItem; Change: TItemChange);
   private
      FDataSet: TDataSet;
      FExportColumns: TExportColumnList;
   private
      procedure ShowFields(ExportColumns: TExportColumnList);
      procedure SetListWidth;
      procedure Select(Kind: TSelectKind);
      procedure UpdateSelected;
   public
      procedure UpdateFields;
      procedure Init(DataSet: TDataSet; ExportColumns: TExportColumnList);
   end;

function SelectColumn(Header: string; DataSet: TDataSet; ExportColumns: TExportColumnList): Boolean;

implementation

{$R *.DFM}

function SelectColumn(Header: string; DataSet: TDataSet; ExportColumns: TExportColumnList): Boolean;
begin
   Result:=False;
   with TfmExpGr.Create(nil) do begin
      try
         Caption:=Format(Caption, [Header]);
         Init(DataSet, ExportColumns);
         ShowModal;
         if ModalResult=mrOk then begin
            UpdateFields;
            Result:=True;
         end;
      finally
         Free;
      end;
   end;
end;


{ TfmExpGr }

procedure TfmExpGr.UpdateFields;
var
   I: Integer;
begin
   for I:=0 to Pred(lvCol.Items.Count) do begin
      TExportColumn(lvCol.Items[I].Data).Visible:=lvCol.Items[I].Checked;
   end;
end;

procedure TfmExpGr.Init(DataSet: TDataSet; ExportColumns: TExportColumnList);
begin
   FDataSet:=DataSet;
   ShowFields(ExportColumns);
   SetListWidth;
end;

procedure TfmExpGr.ShowFields(ExportColumns: TExportColumnList);
var
   I: Integer;
   ListItem: TListItem;
begin
   FExportColumns:=ExportColumns;
   lvCol.Items.BeginUpdate;
   lvCol.Items.Clear;
   for I:=0 to Pred(ExportColumns.Count) do begin
      ListItem:=lvCol.Items.Add;
      ListItem.Caption:=ExportColumns[I].DisplayName;
      ListItem.Checked:=ExportColumns[I].Visible;
      ListItem.Data:=ExportColumns[I];
   end;
   lvCol.Items.EndUpdate;
end;

procedure TfmExpGr.FormResize(Sender: TObject);
begin
   SetListWidth;
end;

procedure TfmExpGr.SetListWidth;
begin
   lvCol.Columns[0].Width:=lvCol.ClientWidth-GetSystemMetrics(SM_CXVSCROLL);
end;

procedure TfmExpGr.Select(Kind: TSelectKind);
var
   I: Integer;
begin
   lvCol.Items.BeginUpdate;
   for I:=0 to Pred(lvCol.Items.Count) do begin
      case Kind of
         skAll: lvCol.Items[I].Checked:=True;
         skClear: lvCol.Items[I].Checked:=False;
         skChange: lvCol.Items[I].Checked:=not lvCol.Items[I].Checked;
      end;
   end;
   lvCol.Items.EndUpdate;
end;

procedure TfmExpGr.miSelAllClick(Sender: TObject);
begin
   Select(skAll);
end;

procedure TfmExpGr.miSelClearClick(Sender: TObject);
begin
   Select(skClear);
end;

procedure TfmExpGr.miSelChangeClick(Sender: TObject);
begin
   Select(skChange);
end;

procedure TfmExpGr.lvColDblClick(Sender: TObject);
var
   pt: TPoint;
begin
   GetCursorPos(pt);
   pt:=lvCol.ScreenToClient(pt);
   if (lvCol.Selected<>nil) and (lvCol.Selected=lvCol.GetItemAt(pt.x, pt.y)) then begin
      lvCol.Selected.Checked:=not lvCol.Selected.Checked;
   end;
end;

procedure TfmExpGr.lvColKeyPress(Sender: TObject; var Key: Char);
var
   I: Integer;
begin
   if Key=#32 then begin
      if lvCol.Selected<>nil then begin
         I:=lvCol.Selected.Index;
         if (I<Pred(lvCol.Items.Count)) then begin
            lvCol.Selected:=lvCol.Items[Succ(I)];
            lvCol.ItemFocused:=lvCol.Items[Succ(I)];
            lvCol.Selected.MakeVisible(False);
         end;
      end;
      Key:=#0;
   end;
end;

procedure TfmExpGr.lvColCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
   if Item.Checked then begin
      lvCol.Canvas.Brush.Color:=clBtnFace;//clAqua;
      lvCol.Canvas.Font.Color:=clBlack;
   end
   else begin
      lvCol.Canvas.Brush.Color:=clWindow;
      lvCol.Canvas.Font.Color:=clWindowText;
   end;
end;

procedure TfmExpGr.lvColChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
   UpdateSelected;
end;

procedure TfmExpGr.UpdateSelected;
var
   I: Integer;
   Count: Integer;
begin
   Count:=0;
   for I:=0 to Pred(lvCol.Items.Count) do begin
      if lvCol.Items[I].Checked then begin
         Inc(Count);
      end;
   end;
   stSelected.Caption:=Format('Выбрано %d из %d', [Count, lvCol.Items.Count]);
end;

end.
