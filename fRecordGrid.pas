unit fRecordGrid;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, SasaDbGrid, DbCtrlsEh, DbGridEh, DBLookupEh,
  Db, Math, dbFunc,FuncPr, FuncEh, ToolCtrlsEh, AddEvents, fEditMemo, vchDBCtrls;

type

  TTypeColumnEh = ( tcNone, tcString, tcNumber, tcBoolean, tcDate, tcPickList, tcSpr, tcMemo, tcLookup, tcChoiceMen);

  TfmRecordGrid = class(TForm)
    pn: TPanel;
    sb: TScrollBox;
    btCancel: TBitBtn;
    btOk: TBitBtn;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FGrid : TSasaDbGrid;
    FAdd  : Boolean;
    FFlat : Boolean;
    FStepY: Integer;
    FClearKey : Boolean;
    FParam : TParamsEditSpr;
//    function GetTypeColumn( Grid : TSasaDbGrid; i : Integer) : TTypeColumnEh;
    procedure OnEditMemo( Sender : TObject; var Handled: Boolean);
    procedure DBTextGetText(Sender: TObject; var Text: String);
  public
    procedure CreateControls;
    function IsEnableEditing( nCol : Integer) : Boolean;
    procedure Event_ChoiceMen(Sender: TObject; var Handled: Boolean);
  end;

//  function EditRecordGrid( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon; lFlat : Boolean) : Boolean;
  function EditRecordGrid( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon;  Param : TParamsEditSpr ) : Boolean;
  function GetTypeColumn( Grid : TSasaDbGrid; i : Integer; Param : TParamsEditSpr) : TTypeColumnEh;

implementation

uses OpisEdit ,uProjectAll
    {$IFNDEF UPDATEPROG}
      {$IFDEF ADD_MENS_PU}
        ,fChoiceNasel
      {$ENDIF}
    {$ENDIF}
     ;
//var
//  fmRecordGrid: TfmRecordGrid;

{$R *.DFM}

function EditRecordGrid( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon; Param : TParamsEditSpr) : Boolean;
var
  f : TfmRecordGrid;
begin
  Result:=true;
  f := TfmRecordGrid.Create(Grid.Owner);
  if (Ic<>nil) and not Ic.Empty then begin
    f.Icon:=Ic;
  end;
  if lAdd
    then f.Caption:='Введите новую запись'
    else f.Caption:='Корректировка текущей записи';
  f.FParam := Param;
  f.FFlat := GlobalFlat;
  f.FStepY:= GlobalStepY;
  f.FGrid := Grid;
  f.FAdd  := lAdd;
  f.CreateControls;
  try
    f.ShowModal;
  finally
    FreeAndNil(f);
  end;
end;

function GetTypeColumn( Grid : TSasaDbGrid; i : Integer; Param : TParamsEditSpr) : TTypeColumnEh;
var
  Column : TColumnEh;
  n:Integer;
begin
  Column:=Grid.Columns[i];
  Result:=tcNone;
  if (Param<>nil) and (Param.FormatList<>nil)then begin
    for n:=0 to Param.FormatList.Count-1 do begin
      if MySameText(Param.FormatList.Names[n],Column.FieldName) then begin
        if Param.FormatList.ValueFromIndex[n]='CHOICE_MEN'
          then Result:=tcChoiceMen; // !!!
      end;
    end;
  end;
  if Result<>tcNone
    then exit;
  Result:=tcString;
  if Column.PickList.Count > 0 then begin
    Result := tcPickList;
  end else if Column.Field.FieldKind=fkLookup then begin
    Result := tcLookup;
  end else if Column.ButtonStyle=cbsEllipsis then begin
    Result := tcSpr;
  end else begin
    case Column.Field.DataType of
    {
      ftString : begin
                   if Column.EditButtons.Count = 0 then begin
                     n := 1;
                   end else begin
                     n:=0;
                   end;
                 end;
                 }
      ftBoolean                   : Result := tcBoolean;
      ftMemo                      : Result := tcMemo;
      ftDate                      : Result := tcDate;
      ftAutoInc,ftInteger,ftWord,ftSmallint : Result := tcNumber;
      ftFloat,ftCurrency          : Result := tcNumber;
    end;
  end;
end;

function TfmRecordGrid.IsEnableEditing( nCol : Integer ) : Boolean;
begin
  if FGrid.Columns[nCol].Visible and
     ((FGrid.Columns[nCol].Field.FieldKind=fkdata) or (FGrid.Columns[nCol].Field.FieldKind=fkLookup))
     and (FGrid.Columns[nCol].Field.DataType<>ftAutoinc) then begin
    if FGrid.ReadOnly then begin // для совместимости с формой LookUp
      Result := true;
    end else begin
      // если не режим добавления и корректировка колонки запрещена
      if not FAdd and FGrid.Columns[nCol].ReadOnly then begin
        Result := false;
      end else begin
        Result := true;
      end;
    end;
  end else begin
    Result := false;
  end;
end;

procedure TfmRecordGrid.CreateControls;
var
  i : Integer;
  nLabelSize,nSmech,nFontSize,nTop,nLeft, nMaxWidth,nTopStep : Integer;
  tc : TTypeColumnEh;
  ed : TDbEditEh;
  edL : TDbLookupComboBoxEh;
  bt : TEditButtonEh;
  lCheck,lFirst : Boolean;
  Contr,cc : TWinControl;
  nLastPos : Integer;
  Opis : TOpisEdit;
  tt : TvchDbText;
  lb:TStaticText;
begin
  FClearKey:=false;
  Contr := nil;
  nLeft:=10;
  nMaxWidth:=50;
  nLastPos:=200;
  nTop:=10;
  nFontSize:=GlobalFontSizeE;
  ParamsFromFontSize(nFontSize,nTopStep,nSmech,nLabelSize);
  for i:=0 to FGrid.Columns.Count-1 do begin
    if IsEnableEditing(i) then begin
      lb:=TStaticText.Create(sb);
      with lb do begin
        ParentFont:=false;
        ParentColor:=true;
        Transparent:=false;
        Parent  := sb;
        Caption := StringReplace( FGrid.Columns[i].Title.Caption, '|', ' ', [rfReplaceAll]);
        Name := 'Label' + IntToStr(i);
        Font.Size:=nLabelSize;
        if FFlat then begin
          Top := nTop+nSmech-1;
        end else begin
          Top := nTop+nSmech;
        end;
        Left := nLeft;
        nMaxWidth := Max(nMaxWidth,Width);
      end;
      nTop:=nTop+nTopStep;
    end;
  end;
  nTop:=10;
  lFirst := false;
  for i:=0 to FGrid.Columns.Count-1 do begin
    if IsEnableEditing(i) then begin
      tc := GetTypeColumn( FGrid, i, FParam );
      case tc of
       tcPickList:begin
                    with TDbComboBoxEh.Create(sb) do begin
                      KeyItems.Assign(FGrid.Columns[i].KeyList);
                      Items.Assign(FGrid.Columns[i].PickList);
                      Parent  := sb;
                      DataSource := FGrid.DataSource;
                      DataField  := FGrid.Columns[i].FieldName;
                      Name := 'Edit' + IntToStr(i);
                      Top := nTop;
                      Left := nLeft+20+nMaxWidth;
                      Width := FGrid.Columns[i].Width+50;
                      Flat := FFlat;
                      Font.Size:=nFontSize;
                    end;
                  end;
       tcString : begin
                    ed := TDbEditEh.Create(sb);
                    with ed do begin
                      Text:='';
                      Parent  := sb;
                      DataSource := FGrid.DataSource;
                      DataField  := FGrid.Columns[i].FieldName;
                      Name := 'Edit' + IntToStr(i);
                      Top := nTop;
                      Left := nLeft+20+nMaxWidth;
                      Width := FGrid.Columns[i].Width+50;
                      Flat := FFlat;
                      Font.Size:=nFontSize;
                    end;
                  end;
        tcDate  :  begin
                    with TDBDateTimeEditEh.Create(sb) do begin
                      Parent  := sb;
                      DataSource := FGrid.DataSource;
                      DataField  := FGrid.Columns[i].FieldName;
                      Name := 'Edit' + IntToStr(i);
                      Top := nTop;
                      Left := nLeft+20+nMaxWidth;
                      Width := FGrid.Columns[i].Width+50;
                      Flat := FFlat;
                      Font.Size:=nFontSize;
                    end;
                  end;
        tcNumber:  begin
                    with TDBNumberEditEh.Create(sb) do begin
                      Parent  := sb;
                      DataSource := FGrid.DataSource;
                      DataField  := FGrid.Columns[i].FieldName;
                      Name := 'Edit' + IntToStr(i);
                      Top := nTop;
                      Left := nLeft+20+nMaxWidth;
                      Width := FGrid.Columns[i].Width+50;
                      Flat := FFlat;
                      Font.Size:=nFontSize;
                    end;
                  end;
        tcBoolean: begin
                     with TDbComboBoxEh.Create(sb) do begin
                        Items.Add('Да');
                        Items.Add('Нет');
                        KeyItems.Add('1');
                        KeyItems.Add('0');
                        DataSource := FGrid.DataSource;
                        DataField  := FGrid.Columns[i].FieldName;
//                        if FGrid.Columns[i].Field.AsBoolean=true
//                          then ItemIndex:=1
//                          else ItemIndex:=0;
                        Parent  := sb;
                        Name := 'Edit' + IntToStr(i);
                        Top := nTop;
                        Left := nLeft+20+nMaxWidth;
                        Width := 70;
                        Font.Size:=nFontSize;
                        Flat := FFlat;
                     end;
        {
                    with TDBCheckBoxEh.Create(sb) do begin
                      Parent  := sb;
                      DataSource := FGrid.DataSource;
                      DataField  := FGrid.Columns[i].FieldName;
                      Name := 'Edit' + IntToStr(i);
                      Top := nTop;
                      Left := nLeft+20+nMaxWidth;
                      Width := FGrid.Columns[i].Width;
                      Flat := FFlat;
                    end;
          }
                  end;
        tcChoiceMen : begin
                        ed := TDbEditEh.Create(sb);
                        bt := ed.EditButtons.Add;
                        bt.Visible:=true;
                        bt.OnClick := Event_ChoiceMen;
                        bt.OnDown  := nil; //Event_ChoiceMen;
                        bt.Visible := true;
                        with ed do begin
                          Parent  := sb;
                          DataSource:=FGrid.DataSource;
                          DataField :=FGrid.Columns[i].FieldName;
                          Name:='Edit' + IntToStr(i);
                          Top:=nTop;
                          Left:=nLeft+20+nMaxWidth;
                          Width:=Max(200,FGrid.Columns[i].Width);
                          Font.Size:=nFontSize;
                          Font.Style:=[fsBold];
                          ReadOnly:=true;
                          Flat := FFlat;
                        end;
                      end;
        tcSpr   : begin
                    edL  := nil;
                    Opis := nil;
                    if TObject(FGrid.Columns[i].Tag) is TOpisEdit then begin
                      Opis := TOpisEdit(FGrid.Columns[i].Tag);
                      if Opis.TypeEditSpr=tesLookup then begin
                        edL := TDbLookupComboboxEh.Create(sb);
                        edL.Tag := FGrid.Columns[i].Tag;
                        with edL do begin
                          Parent  := sb;
                          DataSource := FGrid.DataSource;
                          DataField  := FGrid.Columns[i].FieldName;
                          Name := 'Edit' + IntToStr(i);
                          Top := nTop;
                          Left := nLeft+20+nMaxWidth;
                          Width := FGrid.Columns[i].Width+70;
                          Flat := FFlat;
                          Font.Size:=nFontSize;
                          Opis.ListSource.DataSet := Opis.DataSet;
                          ListSource := Opis.ListSource;
                          ListField  := Opis.DisplayField;
                          ListFieldIndex := 0;
                          KeyField := Opis.ResultField;
                        end;
                      end;
                    end;
                    if edL=nil then begin
                      ed := TDbEditEh.Create(sb);
                      bt := ed.EditButtons.Add;
                      bt.Visible:=true;
                      if Opis<>nil then begin
                        ed.Tag := FGrid.Columns[i].Tag;
                        bt.OnClick := TEvents.EditButtons_OnClick;
                        bt.OnDown  := TEvents.EditButtons_OnDown;
                        bt.Visible := true;
                      //TOpisEdit(FGrid.Columns[i].Tag).
                      end;
                      with ed do begin
                        Parent  := sb;
                        DataSource := FGrid.DataSource;
                        DataField  := FGrid.Columns[i].FieldName;
                        Name := 'Edit' + IntToStr(i);
                        Top := nTop;
                        Left := nLeft+20+nMaxWidth;
                        Width := 60; //FGrid.Columns[i].Width;
                        Flat := FFlat;
                      end;
                      if Opis<>nil then begin
                        tt := TvchDbText.Create(sb);
                        tt.Parent := sb;
                        tt.Name := 'dbText' + IntToStr(i);
                        tt.Tag := FGrid.Columns[i].Tag;
                        tt.OnGetText := DBTextGetText;
                        tt.DataField := FGrid.Columns[i].FieldName;
                        tt.DataSource:= FGrid.DataSource;
                        if FFlat then begin
                          tt.Top := nTop+2;
                        end else begin
                          tt.Top := nTop+3;
                        end;
                        tt.Width := FGrid.Columns[i].Width+20;
                        tt.Left  := ed.Left + ed.Width + 5;
                      end;
                    end;
                  end;

        tcLookup : begin
                     edL := TDbLookupComboboxEh.Create(sb);
                     edL.Tag := FGrid.Columns[i].Tag;
                     with edL do begin
                       Parent  := sb;
                       DataSource := FGrid.DataSource;
                       DataField  := FGrid.Columns[i].FieldName;
                       Name := 'Edit' + IntToStr(i);
                       Top := nTop;
                       Left := nLeft+20+nMaxWidth;
                       Width := FGrid.Columns[i].Width+70;
                       Flat := FFlat;
                       Font.Size:=nFontSize;
                     end;
                  end;
        tcMemo   : begin
                    ed := TDbEditEh.Create(sb);
                    bt := ed.EditButtons.Add;
                    bt.Visible:=true;
                    bt.OnClick := OnEditMemo;
                    with ed do begin
                      Parent  := sb;
                      DataSource := FGrid.DataSource;
                      DataField  := FGrid.Columns[i].FieldName;
                      Name := 'Edit' + IntToStr(i);
                      Top := nTop;
                      Left := nLeft+20+nMaxWidth;
                      Width := FGrid.Columns[i].Width+70;
                      Font.Size:=nFontSize;
                      Flat := FFlat;
                    end;
                  end;
      end;
      cc := TWinControl(sb.Controls[sb.ControlCount-1]);
      if ((cc.Left+cc.Width)>nLastPos) then begin
        nLastPos:=cc.Left+cc.Width;
      end;
      if not lFirst then begin
        lFirst := true;
        Contr := cc;
      end;
      nTop:=nTop+nTopStep;
    end;
  end;
  if Contr <> nil then begin
    ActiveControl:=Contr;
    ActiveControl.HelpContext:=888;
    TWinControl(sb.Controls[sb.ControlCount-1]).HelpContext:=999;
  end;
  ClientHeight := Min(550,nTop+60);
  ClientWidth  := Max(260,nLastPos+5);
//  ShowMessage(intToStr(FGrid.Parent.Left));
  if FAdd then begin
    FGrid.DataSource.DataSet.Append;
    if (FParam<>nil) and Assigned(FParam.OnAfterAppend) then begin
      FParam.OnAfterAppend(FGrid,lCheck);
//      if not lCheck then begin
//        raise EMyError.Create(FErrorEdit);
    end;
  end else begin
    FGrid.DataSource.DataSet.Edit;
  end;
end;

procedure TfmRecordGrid.Event_ChoiceMen(Sender: TObject; var Handled: Boolean);
{$IFNDEF UPDATEPROG}
var
  old:TCursor;
  ed:TDbEditEh;
  arrRec:TCurrentRecord;
{$ENDIF}
begin
{$IFNDEF UPDATEPROG}
 {$IFDEF ADD_MENS_PU}
//  ShowMessage(Sender.ClassName);
  ed:=TDbEditEh(TEditButtonControlEh(sender).Owner);
  if ChoiceMen( ed, '', '', arrRec) then begin
    ed.Value:=GetValueField(arrRec, 'ID');
  end;
 {$ENDIF}
{$ENDIF}
end;

procedure TfmRecordGrid.btCancelClick(Sender: TObject);
begin
  FGrid.DataSource.DataSet.Cancel;
  ModalResult:=mrCancel;
end;

procedure TfmRecordGrid.btOkClick(Sender: TObject);
var
  lErr : Boolean;
  strErr:String;
begin
  lErr := false;
  try
    if (FParam<>nil) and Assigned(FParam.OnBeforeSave) then begin
      FParam.OnBeforeSave(FGrid,FAdd,Icon);
    end;
    FGrid.DataSource.DataSet.Post;
  except
    on E:Exception do begin
      lErr:=true;
      if Pos('7057', E.Message) > 0 then begin
        strErr := ' Дублирующее значение. ';
      end else begin
        strErr := E.Message;
      end;
      PutError(strErr);
    end;
  end;
  if not lErr then begin
    ModalResult:=mrOk;
  end;
end;

procedure TfmRecordGrid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      btOkClick(nil);
    end;
  end;
end;

procedure TfmRecordGrid.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmRecordGrid.OnEditMemo(Sender: TObject; var Handled: Boolean);
var
  ds : TDataSet;
  strField : String;
  ed : TDbEditEh;
  c : TComponent;
  s : String;
begin
  if Sender is TDbEditEh then begin
    ed := TDbEditEh(Sender);
  end else begin
    ed := TDbEditEh(TComponent(Sender).Owner);
  end;
  s:='Label'+Trim(Copy(ed.Name,5,20));
  c := sb.FindComponent(s);
  s:='';
  if c<>nil then begin
    s :=TStaticText(c).Caption;
  end;
  ds := ed.DataSource.DataSet;
  strField := ed.Field.FieldName;
  if EditMemo(ds, strField, s) then begin
    Handled := true;
  end;
end;

procedure TfmRecordGrid.DBTextGetText(Sender: TObject; var Text: String);
var
  Opis : TOpisEdit;
  ds   : TDataSet;
  ss   : String;
begin
  if TObject(TComponent(Sender).Tag) is TOpisEdit then begin
    Opis := TOpisEdit(TComponent(Sender).Tag);
    if Opis.DataSet<>nil then begin
      ds := TvchDBText(Sender).DataSource.DataSet;
      ss := TvchDBText(Sender).DataField;
      if ds.FieldByName(ss).IsNull or (ds.FieldByName(ss).AsString='') then begin
        Text := '';
      end else begin
        if Opis.FieldForNaim<>'' then begin
          if Opis.DataSet.Locate(Opis.ResultField,ds.FieldByName(ss).AsString,[]) then begin
            Text := Opis.DataSet.FieldByName(Opis.FieldForNaim).AsString;
          end else begin
            Text := '';
          end;
        end else begin
          Text := ''
        end;
      end;
    end;
  end;
end;

procedure TfmRecordGrid.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action:=caFree;
  try
    if (FGrid.DataSource.DataSet.State=dsInsert)	or
       (FGrid.DataSource.DataSet.State=dsEdit) then  FGrid.DataSource.DataSet.Cancel;
  except
  end;
end;

end.
