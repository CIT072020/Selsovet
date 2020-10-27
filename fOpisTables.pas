unit fOpisTables;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB2Item, ComCtrls, ExtCtrls, TB2Dock, TB2Toolbar, Grids, uProject, uProjectAll,
  DBGridEh, db, FuncPr, StdCtrls, fParamQuest
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmOpisTables = class(TForm)
    GridTables: TDBGridEh;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    Sp: TSplitter;
    PageControl1: TPageControl;
    tsFields: TTabSheet;
    TBItemWrite: TTBItem;
    TBItemExit: TTBItem;
    TBItemAddTables: TTBItem;
    dsTables: TDataSource;
    dsFields: TDataSource;
    GridFields: TDBGridEh;
    TBItemCheck: TTBItem;
    TBItemDelTable: TTBItem;
    TBItemReNum: TTBItem;
    procedure TBItemExitClick(Sender: TObject);
    procedure TBItemWriteClick(Sender: TObject);
    procedure TBItemAddTablesClick(Sender: TObject);
    procedure dsTablesDataChange(Sender: TObject; Field: TField);
    procedure TBItemCheckClick(Sender: TObject);
    procedure TBItemDelTableClick(Sender: TObject);
    procedure GridTablesGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemReNumClick(Sender: TObject);
  private
    procedure SetMaster;
    procedure ClearMaster;
  public
    procedure UpdateActions; override;
  end;

  procedure EditOpisTables;

implementation

uses fMain, dBase, MetaTask;

var
  fmOpisTables: TfmOpisTables;

{$R *.DFM}

procedure EditOpisTables;
begin
  fmOpisTables := TfmOpisTables.Create(nil);
  fmMain.mtTables.First;
  while not fmMain.mtTables.Eof do begin
    fmMain.mtTables.Edit;
    fmMain.mtTablesIsExists.AsBoolean:=true;
    fmMain.mtTablesIsChange.AsBoolean:=false;
    fmMain.mtTablesIsNew.AsBoolean:=false;
    fmMain.mtTables.Next;
  end;
  fmMain.mtTables.First;
  fmOpisTables.SetMaster;
  fmOpisTables.ShowModal;
  fmOpisTables.ClearMaster;
  fmOpisTables.Free;
end;


procedure TfmOpisTables.SetMaster;
begin
  fmMain.mtTablesFields.IndexFieldNames:='TableName;Nomer';
  fmMain.mtTablesFields.MasterSource := dstables;;
  fmMain.mtTablesFields.MasterFields := 'tableName';
end;

procedure TfmOpisTables.ClearMaster;
begin
  fmMain.mtTablesFields.MasterSource := nil;
  fmMain.mtTablesFields.MasterFields := '';
end;

procedure TfmOpisTables.TBItemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmOpisTables.TBItemWriteClick(Sender: TObject);
begin
  fmMain.mtTables.SaveToFile(GlobalTask.PathService+'Tables.mtb');
  fmMain.mtTablesFields.SaveToFile(GlobalTask.PathService+Tables_Fields+'.mtb');
end;

procedure TfmOpisTables.TBItemAddTablesClick(Sender: TObject);
var
  s : String;
  arr : TArrStrings;
  vKeyValues : Variant;
begin
  ClearMaster;                        

  dmBase.WorkQuery.Active:=false;
  dmBase.WorkQuery.SQL.Text:='select name, comment from '+SysQuery('system.tables')+' order by name';
  dmBase.WorkQuery.Active:=true;
  fmMain.mtTables.Last;
  while not dmBase.WorkQuery.Eof do begin
    if not fmMain.mtTables.Locate('TableName',
       dmBase.WorkQuery.Fields[0].AsString,[loCaseInsensitive]) then begin
      fmMain.mtTables.Append;
      fmMain.mtTablesTableName.AsString := dmBase.WorkQuery.Fields[0].AsString;
      fmMain.mtTablesCaption.AsString   := dmBase.WorkQuery.Fields[1].AsString;
      fmMain.mtTablesIsExists.AsBoolean := true;
      fmMain.mtTablesIsNew.AsBoolean := true;
      fmMain.mtTables.Post;
    end;
    dmBase.WorkQuery.Next;
  end;
  dmBase.WorkQuery.Active:=false;
  fmMain.mtTables.First;
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  while not fmMain.mtTables.Eof do begin
    dmBase.WorkQuery.SQL.Text:='select name,comment from '+SysQuery('system.columns')+
             ' where parent=' + QStr(fmMain.mtTablesTableName.AsString);
    dmBase.WorkQuery.Active:=true;
    vKeyValues[0] := fmMain.mtTablesTableName.AsString;
    while not dmBase.WorkQuery.Eof do begin
      s := dmBase.WorkQuery.Fields[1].AsString;
      StrToArr(s,arr,Chr(13)+Chr(10),true);
      vKeyValues[1] := dmBase.WorkQuery.Fields[0].AsString;
      if fmMain.mtTablesFields.Locate('TableName;FieldName', vKeyValues, [loCaseInsensitive]) then begin
//        fmMain.mtTablesFields.Edit;
      end else begin
        fmMain.mtTablesFields.Append;
        fmMain.mtTablesFieldsTableName.AsString := fmMain.mtTablesTableName.AsString;
        fmMain.mtTablesFieldsFieldName.AsString := dmBase.WorkQuery.Fields[0].AsString;
        fmMain.mtTablesFieldsEnableF.AsBoolean  := false;

        if not fmMain.mtTablesIsNew.AsBoolean then begin
          fmMain.mtTables.Edit;
          fmMain.mtTablesIsChange.AsBoolean := true;
          fmMain.mtTables.Post;
        end;
      end;
      dmBase.WorkQuery.Next;
    end;
    dmBase.WorkQuery.Active:=false;
    fmMain.mtTables.Next;
  end;
  fmMain.mtTables.First;
  SetMaster;
end;

procedure TfmOpisTables.dsTablesDataChange(Sender: TObject; Field: TField);
begin
  if Field<>nil then begin
//    Label1.Caption:=Field.FieldName+'     '+Field.AsString;
  end;
end;

procedure TfmOpisTables.TBItemCheckClick(Sender: TObject);
var
  sSoob : String;
begin
  ClearMaster;
  sSoob := '';
  dmBase.WorkQuery.Active:=false;
  dmBase.WorkQuery.SQL.Text:='select name, comment from '+SysQuery('system.tables')+' order by name';
  dmBase.WorkQuery.Active:=true;
  while not dmBase.WorkQuery.Eof do begin
    if not fmMain.mtTables.Locate('TableName',
       dmBase.WorkQuery.Fields[0].AsString,[loCaseInsensitive]) then begin
      if sSoob='' then sSoob := 'Необходимо добавить: '+#13;
      sSoob := sSoob + dmBase.WorkQuery.Fields[0].AsString;
    end;
    dmBase.WorkQuery.Next;
  end;
  fmMain.mtTables.First;
  while not fmMain.mtTables.Eof do begin
    fmMain.mtTables.Edit;
    fmMain.mtTablesIsExists.Value := true;
    if not dmBase.WorkQuery.Locate('name', fmMain.mtTablesTableName.AsString, [loCaseInsensitive]) then begin
      fmMain.mtTablesIsExists.Value := false;
    end;
    fmMain.mtTables.Next;
  end;
  dmBase.WorkQuery.Active:=false;
  fmMain.mtTables.First;
  SetMaster;
  if sSoob<>'' then
    ShowMessage(sSoob);
end;

//-------------------------------------------------------------
procedure TfmOpisTables.TBItemDelTableClick(Sender: TObject);
begin
  if ActiveControl = GridTables then begin
    if Problem(' Удалить описание таблицы ' + '"' + fmMain.mtTablesTableName.AsString + '"') then begin
      fmMain.mtTablesFields.First;
      while not fmMain.mtTablesFields.Eof do begin
        fmMain.mtTablesFields.Delete;
      end;
      fmMain.mtTables.Delete;
    end;
  end else if ActiveControl = GridFields then begin
    if Problem(' Удалить описание поля ' + '"' + fmMain.mtTablesFieldsFieldName.AsString + '"') then begin
      fmMain.mtTablesFields.Delete;
    end;
  end;
end;

//-------------------------------------------------------------
procedure TfmOpisTables.UpdateActions;
begin
  inherited;
  TBItemDelTable.Enabled := (ActiveControl = GridTables) or
                            (ActiveControl = GridFields);
end;

procedure TfmOpisTables.GridTablesGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if not fmMain.mtTablesIsExists.AsBoolean then begin
    AFont.Color := clRed;
  end;
  if fmMain.mtTablesIsChange.AsBoolean then begin
    AFont.Color := clBlue;
  end;
  if fmMain.mtTablesIsNew.AsBoolean then begin
    AFont.Color := clPurple;
  end;
end;

procedure TfmOpisTables.TBItemReNumClick(Sender: TObject);
var
  f : TfmParamQuest;
  i,n,m, nInd, nCur : Integer;
  lClear : Boolean;
  arrBookmark : array[1..500] of String;
begin
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Введите значения';
//  f.StepY:=17;
//  f.Flat:=false;
//  f.AddParamEx(1  , 'Налог'               , 'NALOG','TYPE=LOOKUP~DESC=LOOKUP_NALOGI~WIDTH=250');
  f.AddParamEx(5, 'Шаг перенумерации' , 'STEP','FORMAT=###');
  f.AddParamEx(true, 'Сброс номеров не участвующих' , 'CLEAR','');
  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  m := f.GetValue('STEP','N');
  lClear := f.GetValue('CLEAR','L');
  f.Free;
  if (n = 1) and (m > 0) then begin
    with fmMain.mtTablesFields do begin
      First;
      nInd := 0;
      while not Eof do begin
        Inc(nInd,1);
        arrBookMark[nInd] := Bookmark;
        Next;
      end;
      nCur := 1;
      for i:=1 to nInd do begin
        BookMark := arrBookMark[i];
        Edit;
        if fmMain.mtTablesFieldsEnableF.AsBoolean then begin
          fmMain.mtTablesFieldsNomer.AsInteger := nCur;
          nCur := nCur + m;
        end else begin
          if lClear then begin
            fmMain.mtTablesFieldsNomer.AsString := '';
          end;
        end;
        Post;
      end;
      First;
    end;
  end;
end;

end.
