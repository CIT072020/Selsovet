unit fTableGurnal;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fMain,
  TB2Item, TB2Dock, TB2Toolbar, dBase, Db, adsdata, adsfunc, adstable, fExpDs, mExport, uProjectAll,
  Grids, DBGridEh, {$IFNDEF EHLIB3 } GridsEh, {$ENDIF}
  {$IFDEF EHLIB3 } dbGrids, {$ENDIF} SasaDBGrid, SasaUtils, MetaTask, mPermit, FuncPr, FuncEh, fmStringSeek, dbFunc,
  ExtCtrls, DBCtrls, Menus, StdCtrls, Mask, DBCtrlsEh, SasaIniFile;

type
                                      
  TfmTableGurnal = class;

  TFormTableGurnal = class of TfmTableGurnal;

  TfmTableGurnal = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItemExit: TTBItem;
    Grid: TSasaDBGrid;
    DataSource: TDataSource;
    Table: TAdsTable;
    TBItemRefresh: TTBItem;
    TBItemClrFlt: TTBItem;
    TBItemRepeatFilter: TTBItem;
    TBItemColumnFilter: TTBItem;
    TBToolbarMove: TTBToolbar;
    TBControlItem1: TTBControlItem;
    DBNavigator: TDBNavigator;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    TBItemDel: TTBItem;
    TBToolbar2: TTBToolbar;
    TBItemCount: TTBItem;
    TBItemPreview: TTBItem;
    TBItemPrint: TTBItem;
    TBItemReport: TTBItem;
    TBItemExport: TTBItem;
    TBSubmenuRun: TTBSubmenuItem;
    TBSubmenuSysFilter: TTBSubmenuItem;
    cbOrderBy: TComboBox;
    TBControlItem3: TTBControlItem;
    procedure TBItemRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TBItemExitClick(Sender: TObject);
    procedure TBItemDelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure GridTitleBtnClick(Sender: TObject; ACol: Integer;  Column: TColumnEh);
    procedure TBItemClrFltClick(Sender: TObject);
    procedure TBItemColumnFilterClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure TBItemRepeatFilterClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure cbOrderBy1Change(Sender: TObject);
    procedure TBItemCountClick(Sender: TObject);
    procedure TBItemPreviewClick(Sender: TObject);
    procedure TBItemPrintClick(Sender: TObject);
    procedure TBItemReportClick(Sender: TObject);
    procedure TBItemExportClick(Sender: TObject);
  private
    FKodGurnal: String;
    FQuestDel: String;
    FBeginFilter: String;
    FLastFilter: String;
    FCurrentFilter: String;
    FQuestDelArr: String;
    procedure SetKodGurnal(const Value: String);
    procedure SetQuestDel(const Value: String);
    procedure SetBeginFilter(const Value: String);
    procedure SetLastFilter(const Value: String);
    procedure SetCurrentFilter(const Value: String);
    procedure SetQuestDelArr(const Value: String);
    { Private declarations }
  public
//    procedure SetRole;
    FieldNotSeek:String;  // имена полей поиск по которым недоступен (в верхнем регистре, через ';')
    ArrBookmark:TArrStrings;
    slKeyItems:TStringList;
    ExportColumns:TExportColumnList;
    FRunChange : Boolean;
    FSysFltCaption:String;
    FMainCaption:String;
    FAddSection  : String;
    FIndexFieldNames : TStringList;
    property  CurrentFilter : String read FCurrentFilter write SetCurrentFilter;
    property  BeginFilter : String read FBeginFilter write SetBeginFilter;
    property  LastFilter  : String read FLastFilter write SetLastFilter;
    property  KodGurnal : String read FKodGurnal write SetKodGurnal;
    property  QuestDel : String read FQuestDel write SetQuestDel;
    property  QuestDelArr : String read FQuestDelArr write SetQuestDelArr;
//    procedure GridColumnsGetZAGS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure SaveToIni; virtual;
    procedure LoadFromIni; virtual;
    procedure CheckPropertyGridColumns;
    procedure Refresh(lFull : Boolean=false);
    procedure FullRefresh;
    function  BeforeDelete : Boolean; virtual;
    procedure SetCaptionGurnal( lClear : Boolean; strAddName : String ); virtual;
    procedure UpdateActions; override;
    function GetFullFilter : String;
    function ChangeIndex(strIndexName : String) : Boolean;
    function BeforeChangeOrder : Boolean; virtual;
    procedure AfterChangeOrder; virtual;
    procedure BeforeClearFilter; virtual;
    function EnableSeekColumn(Column : TColumnEh) : Boolean; virtual;
    function UserSeekColumn( Column : TColumnEh; var strSeek:String) : Boolean; virtual;
    procedure ClearFilter;
    procedure BeforeReport; virtual;
    procedure AfterReport; virtual;
    function CheckExportColumns:Boolean; virtual;
    function FirstFieldInOrder(sField:String):Boolean;
  end;

  procedure ShowTableGurnal(ClassGurnal : TFormTableGurnal; strName : String);

var
  fmTableGurnal: TfmTableGurnal;

implementation

uses uProject;

{$R *.DFM}

procedure ShowTableGurnal(ClassGurnal : TFormTableGurnal; strName : String);
var
  i : Integer;
  Gurnal : TfmTableGurnal;
begin
  Gurnal := nil;
  strName := ANSIUpperCase(Trim(strName));
  for i:=0 to Screen.FormCount-1 do begin
    if Screen.Forms[i] is TfmTableGurnal then begin
      if ANSIUpperCase(Screen.Forms[i].Name) = strName then begin
        Gurnal := TfmTableGurnal(Screen.Forms[i]);
        break;
      end;
    end;
  end;
  if Gurnal = nil then begin
    Gurnal := ClassGurnal.Create(fmMain);
//    Gurnal := ClassGurnal.CreateChild;
    if ClassGurnal.ClassName=TfmTableGurnal.ClassName then begin
      Gurnal.Name      := strName;
      Gurnal.KodGurnal := Gurnal.Name;
    end else begin
      Gurnal.KodGurnal := Gurnal.Name;
    end;
    Gurnal.LoadFromIni;
    Globaltask.CurrentOpisEdit.SetKeyForm(Gurnal,nil);
  end;
  Gurnal.BringToFront;
  Gurnal.Show;
end;

procedure TfmTableGurnal.FormCreate(Sender: TObject);
var
  n:Integer;
begin
  slKeyItems:=TStringList.Create;
  FieldNotSeek:='';
  FSysFltCaption:='';
  FMainCaption:=Caption;
  SetLength(ArrBookmark,0);
  FRunChange:=false;
  FIndexFieldNames := TStringList.Create;
  FMainCaption := Caption;
  QuestDel := '  Удалить текущую запись ?  ';
  QuestDelArr := '  Удалить отмеченные записи ?  ';
  TBItemClrFlt.Enabled := false;
  n:=Role.EnableEditTable(Table.TableName,0);
  if (n=0) then begin
    TBItemDel.Enabled := false;
    Table.ReadOnly := true;
  end;
  SetDateEditMask(Table);
  if GlobalTask.CountReport(Self.Name)=0 then begin
    TBItemPreview.Visible:=false;
    TBItemPrint.Visible:=false;
  end;
  TBItemReport.Visible:=Role.SystemAdmin;
end;

procedure TfmTableGurnal.FormDestroy(Sender: TObject);
begin
  SetLength(ArrBookmark,0);
  FIndexFieldNames.Free;
//  SaveToIni;
end;

procedure TfmTableGurnal.SaveToIni;
var
  ini : TSasaIniFile;      
begin                                    
  if KodGurnal<>'' then begin
    ini := GlobalTask.IniFile('FORM');
    CompToIni(Self,ini,KodGurnal,GlobalTask.PropForm,true);
    Grid.SaveLayoutToIni(ini,KodGurnal+'.Grid');
    if FAddSection<>'' then begin
//      ini.WriteInteger(FAddSection,'Width_OrderBy',cbOrderBy.DropDownBox.Width);
      ini.WriteInteger(FAddSection,'Index_OrderBy',cbOrderBy.ItemIndex);
    end;
  end;
end;

procedure TfmTableGurnal.LoadFromIni;
var
  i : Integer;
  s,sName : String;
  ini : TSasaIniFile;
begin
  FAddSection := '';
  FRunChange := true;
  if KodGurnal<>'' then begin
    FAddSection := KodGurnal + '.Add';
    ini := GlobalTask.IniFile('FORM');
    CompFromIni(Self,ini,KodGurnal,GlobalTask.PropForm);
    if (Self.WindowState=wsNormal) then begin
      if (Self.Left<1) or (Self.Left>600) then Self.Left:=5;
      if (Self.Top<1) or (Self.Top>300) then Self.Top:=5;
      if (Self.Width<300) then Self.Width:=300;
      if (Self.Height<300) then Self.Height:=300;
    end;

    Grid.LoadLayoutFromIni(ini,KodGurnal+'.Grid');
    if not (dgAlwaysShowSelection in Grid.Options) then begin
      Grid.Options := Grid.Options + [dgAlwaysShowSelection]
    end;

    i := ini.ReadInteger(FAddSection,'Width_OrderBy',0);
    if (i>30) and (i<500) then begin
      cbOrderBy.Width := i;
//      cbOrderBy.DropDownBox.Width:=i;
    end;

    i := Pos('.',Table.TableName);
    if i=0 then s := Table.TableName
           else s := Copy(Table.TableName,1,i-1);
    dmBase.WorkQuery.SQL.Text := 'select comment, name, index_expression from '+SysQuery('system.indexes')+
                                 ' where parent='+QStr(s)+' and comment<>'+QStr('');
    dmBase.WorkQuery.AdsConnection := dmBase.AdsConnection;
    dmBase.WorkQuery.Open;
    i:=-1;
    slKeyItems.Clear;
    cbOrderBy.Items.Clear;
//    cbOrderBy.KeyItems.Clear;
    while not dmBase.WorkQuery.Eof do begin
      sName:=dmBase.WorkQuery.Fields[0].AsString;
      if Pos('(-)', sName)=0 then  begin   // (-)  - означает, что индекс не надо включать в выбор
        cbOrderBy.Items.Add(sName);
        slKeyItems.Add(dmBase.WorkQuery.Fields[1].AsString);
//      cbOrderBy.KeyItems.Add( dmBase.WorkQuery.Fields[1].AsString );
        FIndexFieldNames.Add( dmBase.WorkQuery.Fields[2].AsString );
        if ANSIUpperCase(dmBase.WorkQuery.Fields[1].AsString)='VIEW_KEY' then begin
          i := cbOrderBy.Items.Count-1;
        end;
      end;
      dmBase.WorkQuery.Next;
    end;
    if i>-1 then cbOrderBy.ItemIndex := i;
    i := ini.ReadInteger(FAddSection,'Index_OrderBy',-1);
    if (i>-1) and (i<cbOrderBy.Items.Count) then begin
      cbOrderBy.ItemIndex:=i;
    end;
    if cbOrderBy.Items.Count=0 then TBToolbar2.Visible:=false;
    CheckPropertyGridColumns;
  end;
  FRunChange := false;
  BeginFilter   := Table.Filter;
  LastFilter    := '';
  CurrentFilter := '';
  cbOrderBy1Change(nil)
end;

procedure TfmTableGurnal.cbOrderBy1Change(Sender: TObject);
var
  i : Integer;
begin
  if not FRunChange then begin
    FRunChange:=true;
    try
      if (slKeyItems.Count>0) then begin
//      if (cbOrderBy.KeyItems.Count>0) then begin
        if BeforeChangeOrder then begin
          if (cbOrderBy.ItemIndex>-1) and (cbOrderBy.Text<>'') then begin
            i := cbOrderBy.ItemIndex;
          end else begin
            cbOrderBy.ItemIndex := 0;
            i := 0;
          end;
          ClearFilter;
//          Table.IndexName := cbOrderBy.KeyItems.Strings[i];
          Table.IndexName := slKeyItems.Strings[i];
          Table.First;
          AfterChangeOrder;
          TBItemClrFlt.Enabled:=false;
        end;
      end;
    finally
      FRunChange:=false;
    end;
  end;
end;

//-----------------------------------------------------------
procedure TfmTableGurnal.SetCaptionGurnal( lClear : Boolean; strAddName : String );
var
  s : String;
begin
  if lClear or (Copy(strAddName,1,1)='?') then begin
    s := FMainCaption;
  end else begin
    s := FMainCaption;
    if Table.Filter<>''   then s:=s+' (установлен отбор) ';
    if FSysFltCaption<>'' then s:=s+' '+FSysFltCaption;
//    if strAddName='' then strAddName:='без имени';
//    s := FMainCaption + '( доп. отбор: '+strAddName+' )';
  end;
  Self.Caption := s;
end;

procedure TfmTableGurnal.CheckPropertyGridColumns;
var
  i : Integer;
begin
  for i:=0 to Grid.Columns.Count-1 do begin
    if Grid.Columns[i].FieldName='ADRES_ID' then begin
//      Grid.Columns[i].OnGetCellParams := GridColumnsGetAdres;
//    end else if Grid.Columns[i].FieldName='ID_ZAGS' then begin
//      Grid.Columns[i].OnGetCellParams := GridColumnsGetZAGS;
    end;
  end;
end;

procedure TfmTableGurnal.FullRefresh;
begin
  Refresh(true);
end;

procedure TfmTableGurnal.Refresh(lFull: Boolean);
var
  old    : TCursor;
  BookMark : TBookMarkStr;
begin
  old := Screen.Cursor;
  Application.ProcessMessages;
  Table.DisableControls;
  BookMark:=Table.Bookmark;
  Table.Refresh;
  Screen.Cursor := old;
  Table.EnableControls;
end;

procedure TfmTableGurnal.SetKodGurnal(const Value: String);
begin
  FKodGurnal := Value;
end;

{
procedure TfmTableGurnal.GridColumnsGetZAGS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  fld : TField;
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      fld := DataSource.DataSet.FindField('NAME_ZAGS');
      if (fld<>nil) and (fld.AsString<>'') then begin
        Params.Text := fld.AsString;
      end else begin
        if dmBase.SprNames.Locate('ID', Params.Text, []) then begin
          Params.Text := dmBase.SprNames.FieldByName('NAME').AsString;
        end else begin
          if dmBase.SprZAGS.Locate('ID', Params.Text, []) then begin
            Params.Text := dmBase.SprZAGS.FieldByName('NAME').AsString;
          end;
        end;
      end;
    end;
  end;
end;
}
procedure TfmTableGurnal.TBItemRefreshClick(Sender: TObject);
begin
  Table.CheckBrowseMode;
  FullRefresh;
end;

procedure TfmTableGurnal.TBItemExitClick(Sender: TObject);
begin
  table.CheckBrowseMode;
  Close;
end;

procedure TfmTableGurnal.SetQuestDel(const Value: String);
begin
  FQuestDel := Value;
end;

function TfmTableGurnal.BeforeDelete: Boolean;
begin
  Result := true;
end;

procedure TfmTableGurnal.TBItemDelClick(Sender: TObject);
var
  i:Integer;
begin
  Table.CheckBrowseMode;
  if TBItemDel.Enabled then begin
    SetLength(ArrBookmark,0);
    SelectionToArr(Grid,ArrBookmark);
    if Length(ArrBookmark)=0 then begin
      if Problem(QuestDel,mtConfirmation,self) then begin
        if BeforeDelete then begin
          try
            Table.Delete;
          except
            on E:Exception do begin
              PutError(' Ошибка удаления записи. '+Chr(13)+E.Message,self);
            end;
          end;
          Refresh;
        end;
      end;
    end else begin
      if Problem(QuestDelArr,mtConfirmation,self) then begin
        if BeforeDelete then begin
          try
            for i:=0 to Length(ArrBookmark)-1 do begin
              Table.Bookmark:=ArrBookmark[i];
              Table.Delete;
            end;
          except
            on E:Exception do begin
              PutError(' Ошибка удаления. '+Chr(13)+E.Message,self);
            end;
          end;
          Refresh;
        end;
      end;
    end;
  end;
end;

procedure TfmTableGurnal.FormActivate(Sender: TObject);
begin
  try
    if not Table.Active then Table.Open;
  except
    on E:Exception do begin
      PutError(' Ошибка открытия таблицы: '+Table.TableName+Chr(13)+E.Message,self);
    end;
  end;
end;

procedure TfmTableGurnal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmTableGurnal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  SaveToIni;
  CanClose := true;
end;

function TfmTableGurnal.GetFullFilter : String;
begin
  if BeginFilter='' then begin
    Result := LastFilter;
  end else begin
    Result := '('+LastFilter+') .and. ('+BeginFilter+')';
  end;
  if CurrentFilter<>'' then begin
    Result := '(' + CurrentFilter + ') .and. ' + Result;
  end;
end;

procedure TfmTableGurnal.GridTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
var
  strFilter:String;
  lOk:Boolean;
begin
  if EnableSeekColumn(Column) then begin
    lOk:=UserSeekColumn(Column,strFilter);
    if not lOk then begin
      strFilter:=GridSeekColumn(Column, true, false, nil);
    end;
    if strFilter<>'' then begin
      LastFilter     := strFilter;
      Table.Filter   := GetFullFilter;
      Table.Filtered := true;
      TBItemClrFlt.Enabled:=true;
      SetCaptionGurnal(false,'');
    end;
  end;
end;

procedure TfmTableGurnal.TBItemRepeatFilterClick(Sender: TObject);
begin
  Table.CheckBrowseMode;
  if LastFilter<>'' then begin
    TBItemClrFlt.Enabled := true;
    Table.Filter   := GetFullFilter;
    Table.Filtered := true;
    SetCaptionGurnal(false,'');
  end;
end;

procedure TfmTableGurnal.ClearFilter;
begin
  Table.CheckBrowseMode;
  BeforeClearFilter;
  if BeginFilter<>'' then begin
    Table.Filter   := BeginFilter;
    Table.Filtered := true;
  end else begin
    Table.Filtered := false;
  end;
  SetCaptionGurnal(true,'');
end;

procedure TfmTableGurnal.TBItemClrFltClick(Sender: TObject);
begin
  ClearFilter;
  Refresh;
  TBItemClrFlt.Enabled:=false;
end;

procedure TfmTableGurnal.UpdateActions;
begin
  inherited;
  TBItemRepeatFilter.Enabled := LastFilter<>'';
  TBItemDel.Enabled := not (Table.Eof and Table.Bof);
end;

procedure TfmTableGurnal.TBItemColumnFilterClick(Sender: TObject);
begin
  Table.CheckBrowseMode;
  if Grid.SelectedIndex>-1 then begin
    if Pos(UpperCase(Grid.Columns[Grid.SelectedIndex].FieldName)+';', FieldNotSeek)=0 then begin
      GridTitleBtnClick(Grid, Grid.SelectedIndex, Grid.Columns[Grid.SelectedIndex]);
    end else begin
      ShowMessageCont('Поиск по колонке недоступен.',self);
    end;
  end;
end;

procedure TfmTableGurnal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
end;

procedure TfmTableGurnal.SetBeginFilter(const Value: String);
begin
  FBeginFilter := Value;
end;

procedure TfmTableGurnal.SetLastFilter(const Value: String);
begin
  FLastFilter := Value;
end;

procedure TfmTableGurnal.N1Click(Sender: TObject);
begin
  Self.WindowState:=wsNormal;
  Application.ProcessMessages;
  Self.Top    := 5;
  Self.Left   := 5;
  Self.Width  := fmMain.ClientWidth-30;
  Self.Height := fmMain.ClientHeight-70;
end;

procedure TfmTableGurnal.TBItemCountClick(Sender: TObject);
var
  cur : TCursor;
  i : Integer;
//  bm : String;
begin
  cur := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  {
  if (Query.Filter<>'') and Query.Filtered then begin
    Query.DisableControls;
    bm := Query.Bookmark;
    Query.First;
    i:=0;
    while not Query.Eof do begin
      Inc(i,1);
      Query.Next;
    end;
    Query.Bookmark := bm;
    Query.EnableControls;
  end else begin
  }
    i := Table.RecordCount;
//  end;
  Screen.Cursor := cur;
  ShowMessageCont(IntToStr(i),self);
end;

function TfmTableGurnal.ChangeIndex(strIndexName : String): Boolean;
var
  i : Integer;
  KeyItems:TStrings;
begin
  KeyItems:=slKeyItems;
  FRunChange := true;
  try
  Result := false;
//  for i:=0 to cbOrderBy.KeyItems.Count-1 do begin
  for i:=0 to KeyItems.Count-1 do begin
//    if cbOrderBy.KeyItems.Strings[i]=strIndexName then begin
    if KeyItems.Strings[i]=strIndexName then begin
      cbOrderBy.ItemIndex:=i;
      if Table.IndexName<>KeyItems.Strings[i] then begin
        Table.IndexName := KeyItems.Strings[cbOrderBy.ItemIndex];
      end;
      Result := true;
      break;
    end;
  end;
  if not Result then begin
    PutError(' Не найден индекс с именем: '+strIndexName,self);
  end;
  finally
  FRunChange := false;
  end;
end;

procedure TfmTableGurnal.AfterChangeOrder;
begin
//
end;

function TfmTableGurnal.BeforeChangeOrder : Boolean;
begin
  Result := true;
end;

procedure TfmTableGurnal.BeforeClearFilter;
begin
//
end;

procedure TfmTableGurnal.SetCurrentFilter(const Value: String);
begin
  FCurrentFilter := Value;
end;


function TfmTableGurnal.EnableSeekColumn(Column: TColumnEh): Boolean;
begin
  Result := true;
end;

function TfmTableGurnal.UserSeekColumn(Column: TColumnEh; var strSeek:String): Boolean;
begin
  strSeek:='';
  Result:=false;
end;

procedure TfmTableGurnal.TBItemPreviewClick(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.PreViewReport(Self.Name);
  AfterReport;
end;

procedure TfmTableGurnal.TBItemPrintClick(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.PrintReport(Self.Name);
  AfterReport;
end;

procedure TfmTableGurnal.TBItemReportClick(Sender: TObject);
//var
//  s : String;
begin
//  s := GetNameReport;
//  if s='' then begin
//    s := '&Empty.frf';
//  end;
  GlobalTask.DesignTailReport( Self.Name );
end;

procedure TfmTableGurnal.AfterReport;
begin
//
end;

procedure TfmTableGurnal.BeforeReport;
begin
//
end;

procedure TfmTableGurnal.TBItemExportClick(Sender: TObject);
var
  i:Integer;
begin
  ExportColumns := TExportColumnList.Create;
  FillColumnList2(Grid, ExportColumns);
  if not CheckExportColumns then begin  // если наследник сам не "почекал"
    for i:=0 to ExportColumns.Count-1 do begin
      if (ExportColumns.Item[0].DisplayName='') or (Trim(ExportColumns.Item[0].DisplayName)='*') then begin
        ExportColumns.Item[0].Hide;
      end;
    end;
    ExportColumns.DeleteHided;
  end;
  ExportDataSet('Экспорт', Grid.Datasource.DataSet, efRtf, [], GetFolderMyDocument, False, False, ExportColumns);
  ExportColumns.Free;
end;

function TfmTableGurnal.CheckExportColumns:Boolean;
begin
  Result:=false;
end;

procedure TfmTableGurnal.SetQuestDelArr(const Value: String);
begin
  FQuestDelArr := Value;
end;

function TfmTableGurnal.FirstFieldInOrder(sField: String): Boolean;
var
  i,n:Integer;
  s:String;
begin
  Result:=false;
  Table.IndexDefs.Update;
  for i:=0 to Table.IndexDefs.Count-1 do begin
    if Table.IndexDefs[i].Name=Table.IndexName then begin
      n:=Pos(';',Table.IndexDefs[i].Fields);
      if n=0  then s:=Table.IndexDefs[i].Fields
              else s:=Copy(Table.IndexDefs[i].Fields,1,n-1);
      if Pos(sField,s)>0
        then Result:=true;
    end;
  end;
end;

end.
