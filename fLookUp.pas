unit fLookUp;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  {$IFDEF VER150} Variants, {$ENDIF}
  Forms, Dialogs, Grids, DBGridEh, Buttons, ExtCtrls, ComCtrls,
  DB, kbmMemTable, ImgList, TB2Item, Menus, TB2Dock, TB2Toolbar,
  GridSetUp, IniFiles, SasaDBGrid, FuncPr, FuncEh, DbFunc,
  StdCtrls, {$IFDEF EHLIB3 } dbGrids, {$ENDIF} DBCtrlsEh, SasaUtils,
  fRecordGrid, OpisEdit, fmStringSeek, uCheckTreeView;

type

//  перенесены в SasaDbGrid
//  TEditRecordGridEvent = procedure( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon) of object;
//  TEditRecordGridEvent2 = procedure( Field : TField; Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon) of object;
//  TEditRecordGridEvent3 = procedure( Grid : TSasaDbGrid; var lDel : Boolean) of object;

  TSaveCur = record
    Visible : Boolean;
    Caption : String;
    Width   : Integer;
  end;

  TfmLookUp = class(TForm)
    DataSource: TDataSource;
    puMenu: TPopupMenu;
    mSetUpGrid: TMenuItem;
    mSave: TMenuItem;
    Grid: TSasaDBGrid;
    pn: TPanel;
    mPodp: TMenuItem;
    TBDock: TTBDock;
    TBToolbar: TTBToolbar;
    ImageList: TTBImageList;
    TBItemAdd: TTBItem;
    TBItemCorr: TTBItem;
    mTextForButton: TMenuItem;
    TBItemChoice: TTBItem;
    TBItemCancel: TTBItem;
    tbClr: TTBItem;
    StBar: TStatusBar;
    TBItemDetail: TTBSubmenuItem;
    TBItemDelete: TTBItem;
    TBItemOneDetail: TTBItem;
    TBSubmenuSort: TTBSubmenuItem;
    TBItemSeek: TTBItem;
    Splitter: TSplitter;
    TBItemAddSelect: TTBItem;
    DataSource1: TDataSource;
    GridSelect: TSasaDBGrid;
    tbSelect: TkbmMemTable;
    tbSelectID: TStringField;
    tbSelectNAME: TStringField;
    TBItemSave: TTBItem;
    TBItemLoad: TTBItem;
    odMultichoice: TOpenDialog;
    sdMultichoice: TSaveDialog;
    ImGISUN: TImageList;
//    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridColWidthsChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mSetUpGridClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure mSaveClick(Sender: TObject);
    procedure btFilterClick(Sender: TObject);
    procedure btSetClick(Sender: TObject);
    procedure btClrClick(Sender: TObject);
    procedure GridColEnter(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure mPodpClick(Sender: TObject);
    procedure GridTitleBtnClick(Sender: TObject; ACol: Integer;   Column: TColumnEh);
    procedure TBItemAddClick(Sender: TObject);
    procedure TBItemCorrClick(Sender: TObject);
    procedure mTextForButtonClick(Sender: TObject);
    procedure TBItemChoiceClick(Sender: TObject);
    procedure TBItemCancelClick(Sender: TObject);
    procedure StBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;  const Rect: TRect);
    procedure TBItemDetailClick(Sender: TObject);
    procedure TBItemDeleteClick(Sender: TObject);
    procedure TBItemOneDetailClick(Sender: TObject);
    procedure TBItemSeekClick(Sender: TObject);
    procedure TBItemAddSelectClick(Sender: TObject);
    procedure GridSelectKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure TBItemSaveClick(Sender: TObject);
    procedure TBItemLoadClick(Sender: TObject);
    procedure GridSelectColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
  private
//    FFlat : Boolean;
    FSetParamsFromOpis:Boolean;
    FFileMultichoice:String;
    FModal:Boolean;
    FRun      : Boolean;
    FFirst    : Boolean;
    FRunSetUp : Boolean;
//    FAdsDataSet : TAdsDataSet;
    FDataSet : TDataSet;
    FCurIndex   : String;
    HControl    : TControl;
    FChoiceZnach  : Variant;
    FNameField    : String;
    FEnableEdit: Boolean;
    FEnableDetail: Boolean;
    FOpisEdit: TOpisEdit;
    FFlat: Boolean;
    FTitleButton: Boolean;
//    arrSave     : array of TSaveCur;
    procedure OnActivate(var msg: TWMActivate); message WM_ACTIVATE;
    procedure _SetTitleButton;
    procedure SetEnableEdit(const Value: Boolean);
    procedure SetEnableDetail(const Value: Boolean);
    procedure SetOpisEdit(const Value: TOpisEdit);
    procedure OnRunEditDetail(Sender: TObject);
    procedure SetFlat(const Value: Boolean);
    procedure SetTitleButton(const Value: Boolean);
    procedure SetRunSetUp(const Value: Boolean);
  public
    FIniFile    : TCustomIniFile;
    FAddIniFile    : TCustomIniFile;
    ParamsEditSpr : TParamsEditSpr;
    FSection    : String;
    FSectionDop : String;
    FilterIsTemp: Boolean;
    strConstFilter: String;  // постоянный не сбрасываемый фильтр
    strFirstFilter: String;
    strNameFilter : String;
    MultiChoiceDir:String;
    MultiChoiceFilter:String;
    MultiChoiceShowID:Boolean;
    property NotCloseWin : Boolean read FRunSetUp write SetRunSetUp;
    property TitleButton : Boolean read FTitleButton write SetTitleButton;
    property Flat : Boolean read FFlat write SetFlat;
    procedure CreateNameSection( DataSet : TDataSet; strDop : String); virtual;
    function SetAutoFilter( ParamFlt : TParamFieldFlt; var lExit : Boolean) : Boolean; virtual;
    procedure SetDataSet( DataSet : TDataSet);
    procedure ClearDataSet;
    procedure SetCaptionForm;
    procedure CreateTableFilter;
    function Execute(HostControl: TControl; DataSet : TDataSet; const NameField : String; var Znach: Variant; var arrRec : TCurrentRecord;
              NameSort : String; ParamFlt : TParamFieldFlt) : Boolean;
    function ExecuteMultiSelect(HostControl: TControl; DataSet : TDataSet; const NameField : String; var Znach: String; NameSort : String=''):Boolean;
    function ExecuteSelect(HostControl: TControl; DataSet : TDataSet;   const NameField : String;
                           var Znach: Variant; var arrRec : TCurrentRecord; NameSort : String=''; ParamFlt : TParamFieldFlt=nil):Boolean;
    procedure SetBorderStyleWin;
    procedure SetFileConf( Ini : TCustomIniFile);
    procedure SetClientWidth;
    function CheckAddParamsCol(nameCol:String):String;
    procedure SaveToIni(lForm : Boolean=false);
    procedure LoadFromIni(lForm : Boolean=true);
    property  EnableEdit : Boolean read FEnableEdit write SetEnableEdit;
    property  EnableDetail : Boolean read FEnableDetail write SetEnableDetail;
    property  OpisEdit : TOpisEdit read FOpisEdit write SetOpisEdit;
    procedure SetNewIndex(strIndex : String);
    procedure SetOldIndex;
    procedure SetEnableOperation;
    procedure LoadParams;
    procedure SaveParams;
    procedure OnRunChoiceSort(Sender: TObject);
    constructor Create( Owner : TComponent ); override;
    destructor Destroy; override;
  end;

const
  constLoadForm : Boolean = true;

implementation

uses MetaTask{, mPermit}, StrUtils;

{$R *.DFM}

{   Использование формы FormLookUp

procedure TForm1.DBGridEh2EditButtonClick(Sender: TObject);
var vn,vs:String;
begin
  vn := Query1.FieldByName('VNo').AsString;
  if FormLookUp.Execute(DBGridEh2.InplaceEditor,AdsTable1,'KOD',vn) then begin
    Query1.Edit;
    Query1.FieldByName('VNo').AsString := vn;
    Query1.Post;
  end;
end;

}


{ TFormLookUp }

procedure AdjustDropDownForm(AControl : TControl; HostControl: TControl);
var
   WorkArea: TRect;
   HostP, PDelpta: TPoint;
begin
   if (AControl=nil) or (HostControl=nil) then exit;
   SystemParametersInfo(SPI_GETWORKAREA,0,@WorkArea,0);
   HostP := HostControl.ClientToScreen(Point(0,0));
   PDelpta := AControl.ClientToScreen(Point(0,0));

   if HostControl.Height>100 then begin
     AControl.Left := HostP.x + 50;
     AControl.Top := HostP.y + 20;
   end else begin
     AControl.Left := HostP.x;
     AControl.Top := HostP.y + HostControl.Height + 1;
   end;

   if (AControl.Width > WorkArea.Right - WorkArea.Left) then
     AControl.Width := WorkArea.Right - WorkArea.Left;

   if (AControl.Left + AControl.Width > WorkArea.Right) then
     AControl.Left := WorkArea.Right - AControl.Width;
   if (AControl.Left < WorkArea.Left) then
     AControl.Left := WorkArea.Left;


   if (AControl.Top + AControl.Height > WorkArea.Bottom) then
   begin
     if (HostP.y - WorkArea.Top > WorkArea.Bottom - HostP.y - HostControl.Height) then
       AControl.Top := HostP.y - AControl.Height;
   end;

   if (AControl.Top < WorkArea.Top) then
   begin
     AControl.Height := AControl.Height - (WorkArea.Top - AControl.Top);
     AControl.Top := WorkArea.Top;
   end;

   if (AControl.Top + AControl.Height > WorkArea.Bottom) then
   begin
     AControl.Height := WorkArea.Bottom - AControl.Top;
   end;
   AControl.Repaint;
end;

//----------------------------------------------------------------------------
procedure TfmLookUp.SetDataSet( DataSet : TDataSet);
var
  ListOpis : TListOpisEdit;
begin
//  TkbmMemTableCopyTableOption = (mtcpoStructure,mtcpoOnlyActiveFields,mtcpoProperties,mtcpoLookup,mtcpoCalculated,mtcpoAppend,mtcpoFieldIndex);
//  TkbmMemTableCopyTableOptions = set of TkbmMemTableCopyTableOption;
  FIniFile:=GlobalTask.iniFile('LOOKUP');    // затирается обновлением
  FAddIniFile:=GlobalTask.iniFile('FORM');   // что бы не затирать обновлением
  FModal:=false;
  FFileMultichoice:='';
  FChoiceZnach:= null;
  FDataSet := DataSet;
  DataSource.DataSet := FDataSet;
  CreateTableFilter;
  strNameFilter := '';
  tbClr.Visible:=false;
  strFirstFilter := FDataSet.Filter; // GetFilterDataSet(FDataSet);
  if (strFirstFilter<>'') and FilterIsTemp then begin
    tbClr.Visible:=true;
  end;
  // при первом входе для того, чтобы при установке фильтра пересоздать MemTable
  FFirst := true;
  ListOpis := Globaltask.CurrentOpisEdit;
  if ListOpis<>nil then
    ListOpis.SetKeyForm(Self, nil);
//  if FOpisEdit<>nil then begin
//    if FOpisEdit.RI<>nil then begin
//      FDataSet.AfterEdit  := FOpisEdit.OnAfterEditDataSet;
//      FDataSet.BeforePost := FOpisEdit.OnBeforePostDataSet;
//    end;
//  end;
end;

procedure TfmLookUp.ClearDataSet;
begin
  if strNameFilter<>'' then begin // был установлен пользовательский фильтр
    FDataSet.Filter := strFirstFilter;
//    RestFilterDataSet(FDataSet, strFirstFilter);
    strNameFilter:='';
  end;
  if FOpisEdit<>nil then begin
    FOpisEdit.Cancel;
//    if FOpisEdit.RI<>nil then begin
//      DataSet.AfterEdit  := nil;
//      DataSet.BeforePost := nil;
//    end;
  end;
  FDataSet := nil;
  DataSource.DataSet := nil;
end;

procedure TfmLookUp.CreateTableFilter;
begin
{  btSet.Visible:=false;
  btClr.Visible:=false;
  tbFilter.CreateTableAs(FAdsDataSet,[mtcpoStructure]);
  tbFilter.Active := true;
  tbFilter.Insert;
  tbFilter.Post;    }
end;

procedure TfmLookUp.SetNewIndex(strIndex : String);
var
  oldIndex : String;
  it : TTBItem;
  i : Integer;
begin
  FCurIndex := '';
  if (Length(strIndex)>0) then begin
    oldIndex := dbGetIndex(FDataSet);
    if (strIndex<>oldIndex) then begin
      FCurIndex:=oldIndex;
      dbSetIndex(FDataSet, strIndex);
    end;
  end;
  if (FOpisEdit<>nil) and (FOpisEdit.ListIndex<>nil) and (FOpisEdit.ListIndex.Count>0) then begin
    for i:=0 to FOpisEdit.ListIndex.Count-1 do begin
      it := TTbItem.Create(TBSubmenuSort);
      it.Name:='TBItemSort_'+IntToStr(i);
      it.Caption:=FOpisEdit.ListIndex.Values[FOpisEdit.ListIndex.Names[i]];
      it.OnClick:=OnRunChoiceSort;
      it.ShortCut:=TextToShortCut('Alt+'+IntToStr(i+1));
      if UpperCase(FOpisEdit.ListIndex.Names[i])=UpperCase(dbGetIndex(FDataSet)) then begin
        it.Checked:=true;
      end;
      TBSubmenuSort.Add(it);
    end;
    TBSubmenuSort.Visible:=true;
    LoadParams;
  end;
end;

procedure TfmLookUp.SetOldIndex;
begin
  if FCurIndex<>'' then begin
    dbSetIndex(FDataSet, FCurIndex);
  end;
end;

procedure TfmLookUp.CreateNameSection( DataSet : TDataSet; strDop : String);
var
  s : String;
begin
  if (OpisEdit<>nil) and (OpisEdit.ConfSection<>'') then begin
    s := OpisEdit.ConfSection;
  end else begin
    s := DataSet.Name;      
  end;
  FSection := s+strDop;
  FSectionDop :='Dop_'+s+strDop;
end;
//----------------------------------------------------
function TfmLookUp.Execute(HostControl: TControl; DataSet : TDataSet;  const NameField : String; var Znach: Variant; var arrRec : TCurrentRecord;
        NameSort : String; ParamFlt : TParamFieldFlt ) : Boolean;
var
  old : TFormBorderStyle;
  lExit, lOK, lFIO : Boolean;
//  t1,t2,t3 : LongInt;
begin
  SetDataSet(DataSet);
  try
//  t1:=GetTickCount;
  HControl := HostControl;
  if FIniFile <> nil then begin
    CreateNameSection(DataSet,'');
    LoadFromIni;
    _SetTitleButton;
  end;
//  t2:=GetTickCount;
//  t1:=t2-t1;
  SetNewIndex(NameSort);

  old := BorderStyle;
  SetBorderStyleWin;

  if not SetAutoFilter(ParamFlt, lExit) then begin
    if (Znach <> null) and (VarToStr(Znach)<>'') then begin
      if not FDataSet.Locate(NameField,Znach,[]) then begin
        FDataSet.First;
      end
    end else begin
      FDataSet.First;
    end;
  end;

  FNameField := NameField;
  FRunSetUp  := false;

  SetClientWidth;   // вычислим необходимый размер окна
  AdjustDropDownForm(Self,HostControl); // разместим правильно на экране

  Result := False;

  FModal:=false;
  if (ParamsEditSpr<>nil) and ParamsEditSpr.ModalWin and not FModal
    then FModal:=true;

  if FModal then begin
    lOk:=(ShowModal=mrOk);
  end else begin
    Visible := True;
    ModalResult := mrCancel;
    while (Visible) do Application.ProcessMessages;
    lOk:=(ModalResult=mrOk);
  end;
  if lOk then begin
    if Length(arrRec)>0 then begin
      if FChoiceZnach<>FDataSet.FieldByName(FNameField).Value then begin
        FDataSet.Locate(FNameField,FChoiceZnach,[]);
      end;
      if arrRec[0].FieldName='FIO' then lFIO:=true else lFIO:=false;
      GetCurrentRecord(FDataSet,'',arrRec);
      if Grid.SelectedField<>nil then begin
        SetLength(arrRec,Length(arrRec)+1);
        arrRec[Length(arrRec)-1].FieldName:='_CURFIELD_';
        arrRec[Length(arrRec)-1].Value:=Grid.SelectedField.FieldName;
      end;
      if lFIO then begin
        SetLength(arrRec,Length(arrRec)+1);
        arrRec[Length(arrRec)-1].FieldName:='FIO';
        arrRec[Length(arrRec)-1].Value:=Trim(FDataSet.FieldByName('FAMILIA').AsString+' '+FDataSet.FieldByName('NAME').AsString+' '+FDataSet.FieldByName('OTCH').AsString);
      end;
    end;
    Znach := FChoiceZnach; //FAdsDataSet.FieldByName(NameField).Value;
    Result := True;
  end;
  SetOldIndex;
  finally
    ClearDataSet;
  end;
  BorderStyle:=old;
end;

function TfmLookUp.ExecuteMultiSelect(HostControl: TControl; DataSet : TDataSet; const NameField : String; var Znach: String; NameSort : String) : Boolean;
var
  old : TFormBorderStyle;
  arr : TArrStrings;
  i : Integer;
  lOk:Boolean;
begin
  old := BorderStyle;
  SetBorderStyleWin;
//  BorderStyle := bsSizeable;
  Caption := 'Выберите значения';

  HControl := nil; //HostControl;
  SetDataSet(DataSet);
  try
  if FIniFile <> nil then begin
    CreateNameSection(DataSet,'_M');
    LoadFromIni(true);
    _SetTitleButton;
  end;
  SetNewIndex(NameSort);

//  if not SetAutoFilter(ParamFlt, lExit) then begin
    FDataSet.DisableControls;
    try
      if (Znach<>null) and (VarToStr(Znach)<>'') and (OpisEdit<>nil) then begin
        SetLength(arr,0);
        if Pos(',', Znach)>0    then arr:=StrToArr(Znach,',',true);
        if Pos(#13#10, Znach)>0 then arr:=StrToArr(Znach,#13#10,true);
        for i:=0 to Length(arr)-1 do begin
          if FDataSet.Locate(OpisEdit.ResultField, arr[i], []) then begin
            tbSelect.Append;
            tbSelectID.AsString:=arr[i];
            tbSelectNAME.AsString:=arr[i]+' '+FDataSet.FieldByName(OpisEdit.DisplayField).AsString;
            tbSelect.Post;
            tbSelect.First;
          end;
        end;
      end;
    finally
      FDataSet.First;
      FDataSet.EnableControls;
    end;

  FRunSetUp := false;
  FNameField:=NameField;
//  Grid.Options   := Grid.Options + [dgRowSelect];

//  Grid.Options   := Grid.Options + [dgMultiSelect,dgRowSelect];
//  Grid.OptionsEh := Grid.OptionsEh - [dghHighlightFocus];
//  Grid.OptionsEh := Grid.OptionsEh - [dghClearSelection];
//  Grid.OptionsS  := Grid.OptionsS  - [dgsSelectCurrentColor];

 //SetClientWidth;   // вычислим необходимый размер окна
 // AdjustDropDownForm(Self,HostControl); // разместим правильно на экране

  Result := False;
  FModal:=((OpisEdit<>nil) and OpisEdit.MultiSelect);
  if (ParamsEditSpr<>nil) and ParamsEditSpr.ModalWin and not FModal
    then FModal:=true;
  if FModal then begin
    lOk:=ShowModal=mrOk;
  end else begin
    Visible := True;
    ModalResult := mrCancel;
    while (Visible) do Application.ProcessMessages;
    lOk:=ModalResult=mrOk;
  end;
  if lOk then begin
    if tbClr.Visible then begin
      btClrClick(nil);
    end;
    tbSelect.First;
    Znach:='';
    while not tbSelect.Eof do begin
      Znach:=Znach+tbSelectID.AsString+#13#10;
      tbSelect.Next;
    end;
    tbSelect.First;
//    Znach := SelectionToString(Grid,NameField); //FChoiceZnach
    Result := True;
  end;
  SetOldIndex;
  finally
    ClearDataSet;
  end;
  BorderStyle := old;
end;

//-------------------------------------------------------
procedure TfmLookUp.SetBorderStyleWin;
begin
//  BorderStyle := bsSizeable;
  BorderStyle := bsSizeable;
//  BorderStyle:=bsSizeToolWin;
end;

//-------------------------------------------------------
function TfmLookUp.ExecuteSelect(HostControl: TControl; DataSet : TDataSet; const NameField : String; var Znach: Variant;
                             var arrRec : TCurrentRecord; NameSort : String; ParamFlt : TParamFieldFlt ) : Boolean;
var
  old : TFormBorderStyle;
  nLeft,nTop : Integer;
  lExit,lOk:Boolean;
begin
  Result:=False;

  old := BorderStyle;
  SetBorderStyleWin;
  Caption := 'Выберите значения';

  HControl := nil;  //HostControl;
  SetDataSet(DataSet);
  try
  nLeft:=999;
  nTop:=0;
  if FIniFile <> nil then begin
    CreateNameSection( DataSet, '_M');
    LoadFromIni(true);
    nLeft := Left;
    nTop := Top;
    _SetTitleButton;
  end;
  SetNewIndex(NameSort);

  if not SetAutoFilter(ParamFlt, lExit) then begin
    if (Znach <> null) and (VarToStr(Znach)<>'') then begin
      if not FDataSet.Locate(NameField,Znach,[]) then begin
        FDataSet.First;
      end
    end else begin
      FDataSet.First;
    end;
  end;

  FRunSetUp  := false;
  FNameField := NameField;

//  SetClientWidth;   // вычислим необходимый размер окна
//  AdjustDropDownForm(Self,HostControl); // разместим правильно на экране

  Visible := True;
  if nLeft<>999 then begin
    Left := nLeft;
    Top := nTop;
  end;

  FModal:=false;
  if (ParamsEditSpr<>nil) and ParamsEditSpr.ModalWin and not FModal
    then FModal:=true;

  if FModal then begin
    lOk:=(ShowModal=mrOk);
  end else begin
    ModalResult:=mrCancel;
    while (Visible) do Application.ProcessMessages;
    lOk:=(ModalResult=mrOk);
  end;

  if lOk then begin
    if Length(arrRec)>0 then begin
      if FChoiceZnach<>FDataSet.FieldByName(FNameField).Value then begin
        FDataSet.Locate(FNameField,FChoiceZnach,[]);
      end;
      GetCurrentRecord(FDataSet,'',arrRec);
      if Grid.SelectedField<>nil then begin
        SetLength(arrRec,Length(arrRec)+1);
        arrRec[Length(arrRec)-1].FieldName:='_CURFIELD_';
        arrRec[Length(arrRec)-1].Value:=Grid.SelectedField.FieldName;
      end;
    end;
    Znach:=FChoiceZnach; //FAdsDataSet.FieldByName(NameField).Value;
    Result:=true;
  end;
  SetOldIndex;
  finally
    ClearDataSet;
  end;
  BorderStyle := old;
end;

procedure TfmLookUp.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmLookUp.GridDblClick(Sender: TObject);
begin
  TBItemChoiceClick(Sender);
end;

procedure TfmLookUp.OnActivate(var msg: TWMActivate);
begin
  inherited;
  if (msg.Active=WA_INACTIVE) and not FRunSetUp then
    if not FModal then Close;
end;

procedure TfmLookUp.GridColWidthsChanged(Sender: TObject);
begin
  SetClientWidth;
end;

procedure TfmLookUp.FormShow(Sender: TObject);
begin
  if (OpisEdit<>nil) and (OpisEdit.Caption<>'') then begin
    Caption:=OpisEdit.Caption;
  end;
  SetClientWidth;
end;

procedure TfmLookUp.SetClientWidth;
var
  i : integer;
  m : integer;
begin
  if (Grid.DataSource <> nil) and (HControl<>nil) then begin
    m := 0;
    for i:=0 to Grid.Columns.Count-1 do begin
      if Grid.Columns[i].Visible then begin
        m := m + Grid.Columns[i].Width
      end;
    end;
    m := m + (Grid.Width-Grid.ClientWidth)+15;
//                   Panel1.Width + 3;
    if m > 900 then m:=900;
    if ClientWidth <> m then ClientWidth:=m;
  end;
end;

procedure TfmLookUp.mSetUpGridClick(Sender: TObject);
begin
  FRunSetUp:=true;
  SetUpGrid(Grid, 'Параметры');
  SetEnableOperation;
  FRunSetUp:=false;
end;

procedure TfmLookUp.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_RETURN) and (Shift=[]) then begin
     if not Grid.EditorMode then begin
       TBItemChoiceClick(Sender);
       Key := 0;
     end;
  end else if (Key=VK_ESCAPE) and (Shift=[]) then begin
    SpeedButton2Click(Sender);
    Key := 0;
  end else if (Key=VK_F4) and (Shift=[]) then begin
    if Grid.SelectedIndex>-1 then begin
      GridTitleBtnClick(Grid, Grid.SelectedIndex,
        Grid.Columns[Grid.SelectedIndex]);
      Key := 0;
    end;
  end else if (Key=VK_F3) and (Shift=[]) then begin
    if TBItemAddSelect.Visible then begin
      tbSelect.DisableControls;
      if tbSelect.Locate('ID', FDataSet.FieldByName(OpisEdit.ResultField).AsString, []) then begin
        tbSelect.Delete;
      end else begin
        TBItemAddSelectClick(nil);
      end;
      tbSelect.First;
      tbSelect.EnableControls;
      Key:=VK_DOWN;
    end;
  end else if (Key=VK_F3) and (Shift=[ssCtrl]) then begin
    if TBItemAddSelect.Visible then begin
      tbSelect.EmptyTable;
      Grid.Refresh;
      Key:=0;
    end;
  end;
  Grid.MyUserKeyDown(Sender,Key,Shift);
end;

procedure TfmLookUp.GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  v:Variant;
begin
 if (OpisEdit<>nil) and OpisEdit.MultiSelect then begin
   v:=tbSelect.Lookup('ID', FDataSet.FieldByName(OpisEdit.ResultField).AsString, 'ID');
   if v<>null then begin
     AFont.Style:=[fsBold];
   end;
 end;
 if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnGetCellParams) then begin
   ParamsEditSpr.OnGetCellParams(Sender,Column,AFont,Background,State);
 end;
end;

procedure TfmLookUp.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  // запись текущая
{
  if (Rect.Top = Grid.CellRect(Grid.Col,Grid.Row).Top) and
     ((Grid.Canvas.Brush.Color=Column.Color) or not Grid.Focused)
  then begin
    Grid.Canvas.Brush.Color:=clLime;
  end;
  if Grid.DataSource.DataSet.State=dsInsert then begin
    Canvas.Brush.Color:=clAqua;
  end;
  Grid.DefaultDrawColumnCell(Rect,DataCol,Column,State);
}
end;

procedure TfmLookUp.SetFileConf(Ini: TCustomIniFile);
begin
  FIniFile := Ini;
end;

procedure TfmLookUp.mSaveClick(Sender: TObject);
begin
  if FIniFile <> nil then begin
    if HControl=nil then begin
      SaveToIni(true);
    end else begin
      SaveToIni(true);
    end;
  end;
end;


procedure TfmLookUp.btFilterClick(Sender: TObject);
{type
  TCur = record
    Visible : Boolean;
    Caption : String;
    Width   : Integer;
  end;
var
  a : array of TCur;
  i : integer;  }
begin
 { SetLength(a, Grid.Columns.Count);
  for i:=0 to Grid.Columns.Count-1 do begin
    a[i].Visible := Grid.Columns[i].Visible;
    a[i].Caption := Grid.Columns[i].Title.Caption;
    a[i].Width   := Grid.Columns[i].Width;
  end;
  DataSource.DataSet := tbFilter;
  for i:=0 to Grid.Columns.Count-1 do begin
    Grid.Columns[i].Visible := a[i].Visible;
    Grid.Columns[i].Title.Caption := a[i].Caption;
    Grid.Columns[i].Width := a[i].Width;
  end;
  btSet.Visible := true;
  btSet.Enabled := true;
  btClr.Visible := true;
  btClr.Enabled := true;
  btFilter.Enabled := false;  }
//
end;
{
procedure TFormLookUp.btFilterClick(Sender: TObject);
var
  i,x,y, dx, dy : integer;
  l : TLabel;
//  ed : TDbEditEh;
  AOwner : TComponent;
  s : String;
begin
  x:=0;
  y:=0;
  dy := 20;
  dx := 100;
  AOwner := self;
  DataSource.DataSet := tbFilter;
  for i:=0 to Grid.Columns.Count-1 do begin
    if Grid.Columns[i].Visible then begin
      l := TLabel.Create(AOwner);
      l.Parent := TWinControl(AOwner);
      l.Left := x;
      l.Top  := y;
      s := Grid.Columns[i].Title.Caption;
      CharDel(s,'|');
      l.Caption := Trim(s);
      with TDbEditEh.Create(AOwner) do begin
        Parent := TWinControl(AOwner);
        Left  := x + dx;
        Top   := y;
        Width := Grid.Columns[i].Width;
      end;
      Inc(y, dy);
    end;
  end;
  btSet.Visible := true;
  btSet.Enabled := true;
  btClr.Visible := true;
  btClr.Enabled := true;
  btFilter.Enabled := false;
  Grid.Visible:=False;
//
end;
}
procedure TfmLookUp.btSetClick(Sender: TObject);
begin
{
  Grid.Visible:=true;
  btSet.Enabled    := false;
  btFilter.Enabled := true;
  DataSource.DataSet := FAdsDataSet;
  }
end;

procedure TfmLookUp.btClrClick(Sender: TObject);
begin
  if FilterIsTemp then begin
    if strConstFilter=''
      then strFirstFilter:=''
      else strFirstFilter:=strConstFilter;
  end;
  if strFirstFilter='' then begin
    FDataSet.Filtered:=false;
    FDataSet.Filter  :='';
  end else begin
    FDataSet.Filter   := strFirstFilter;
    FDataSet.Filtered := true;
//    RestFilterDataSet(FDataSet, strFirstFilter);
    strNameFilter:=''
  end;
  tbClr.Visible := false;
end;

function TfmLookUp.SetAutoFilter( ParamFlt : TParamFieldFlt; var lExit : Boolean) : Boolean;
var
  i,n: Integer;
  lReopen : Boolean;
begin
  Result := false;
  lExit  := false;
  if (OpisEdit<>nil) and (OpisEdit.AutoFilter=true) and
     (ParamFlt<>nil) and (VarToStr(ParamFlt.Value1)<>'') and
     ParamFlt.OnlySet then begin
    n:=-1;
    if ParamFlt.FieldName<>'' then begin
      for i:=0 to Grid.Columns.Count-1 do begin
        if UpperCase(Grid.Columns[i].FieldName)=UpperCase(ParamFlt.FieldName) then begin
          n:=i;
        end;
      end;
    end else begin
      for i:=0 to Grid.Columns.Count-1 do begin
        if UpperCase(Grid.Columns[i].FieldName)=UpperCase(OpisEdit.ResultField) then begin
          n:=i;
        end;
      end;
    end;
    if n>-1 then begin
      if SetGridSeekColumn(Grid.Columns[n], true, strFirstFilter, lReopen, ParamFlt) then begin
        Result := true;
        strNameFilter:='ФИЛЬТР';
        SetCaptionForm;
        tbClr.Visible := true;
        DataSource.DataSet.EnableControls;
        if lReopen then begin
          LoadFromIni;
        end;
      end else begin
        DataSource.DataSet.EnableControls;
      end;
    end;
  end;
end;

procedure TfmLookUp.GridTitleBtnClick(Sender: TObject; ACol: Integer;  Column: TColumnEh);
var
  lReopen : Boolean;
  CurValue: TParamFieldFlt;
//  lWhere : Boolean;
//  strFilter : String;
//  tb : TAdsTable;
begin
  FRunSetUp:=true;
//  tb:=nil;
  DataSource.DataSet.DisableControls;
  CurValue:=TParamFieldFlt.Create;
  CurValue.AOwner:=self;
  CurValue.Empty:=true;  // !!!   типа нет текущих значений для поиска
  if Column.Field.DataType=ftMemo
    then CurValue.Memo:=true
    else CurValue.Memo:=false;
  if SetGridSeekColumn(Column, true, strFirstFilter, lReopen, CurValue) then begin
    strNameFilter:='ФИЛЬТР';
    SetCaptionForm;
    tbClr.Visible := true;
    DataSource.DataSet.EnableControls;
    if lReopen then begin
      LoadFromIni;
    end;
  end else begin
    DataSource.DataSet.EnableControls;
  end;
  CurValue.Free;
  {
  if (DataSource.DataSet is TAdsTable) or (DataSource.DataSet is TAdsQuery) then begin
    if DataSource.DataSet is TAdsTable then begin
      tb := TAdsTable(DataSource.DataSet);
      lWhere := false;
    end else begin
      lWhere := true;
    end;
    if not lWhere then begin
      strFilter := GridSeekColumn(Column, true, false);
//      strFilter := GridSetFilter(Column, strNameFilter);
      if Length(strFilter)>0 then begin
        strNameFilter:='ФИЛЬТР';
        if tb.Filtered then begin
          tb.Filtered:=false;
        end;
        tb.Filter  := strFilter;
        tb.Filtered:=true;
        tb.First;
        SetCaptionForm;
        tbClr.Visible := true;
      end;
    end else begin
    end;
  end;
  }
  FRunSetUp:=false;
end;

procedure TfmLookUp.SetCaptionForm;
begin
//
end;

procedure TfmLookUp.GridColEnter(Sender: TObject);
begin
//
end;

procedure TfmLookUp.GridEnter(Sender: TObject);
begin
//
end;

procedure TfmLookUp.DataSourceDataChange(Sender: TObject; Field: TField);
var
  lAdd:Boolean;
begin
//  lb.Caption:=Grid.SelectedField.AsString;
  if Field <> nil then begin
    if (OpisEdit<>nil) and not FRun then begin
      if (OpisEdit.RI<>nil) and (OpisEdit.RI.Field_ID=UpperCase(Field.FieldName)) then begin
        if VarToStr(Field.OldValue)<>'' then begin
          FRun := true;
          try
            Field.Value := Field.OldValue;
          finally
            FRun := false;
          end;
        end;
      end;
    end;
    if not FRun then begin
      if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnDataChange) then begin
        lAdd:=Grid.DataSource.State=dsInsert;
        ParamsEditSpr.OnDataChange(Field, Grid, lAdd, nil);
      end;
    end;
  end;
end;

procedure TfmLookUp.mPodpClick(Sender: TObject);
begin
  if mPodp.Checked then begin
    mPodp.Checked:=false;
    pn.Visible:=false;
//    sp.Visible:=false;
  end else begin
    mPodp.Checked:=true;
    pn.Visible:=true;
//    sp.Visible:=true;
  end;
end;

procedure TfmLookUp.mTextForButtonClick(Sender: TObject);
var
  i : Integer;
begin
  mTextForButton.Checked := not mTextForButton.Checked;
  for i:=0 to TbToolBar.Items.Count-1 do begin
    if not mTextForButton.Checked
      then TbToolBar.Items[i].DisplayMode:=nbdmImageAndText
      else TbToolBar.Items[i].DisplayMode:=nbdmDefault;
  end;
end;


procedure TfmLookUp.LoadFromIni(lForm : Boolean);
var
  i,n : Integer;
  s,ss:String;
begin
//  CompFromIni(Self,FConfMainForm,  Section, PropForm);
  if lForm then begin
    CompFromIni(Self,FIniFile,FSection+'_FORM',',Height,Width,Top,Left,');
  end;
  Grid.LoadFromIni(FIniFile,FSection);
  mPodp.Checked := FIniFile.ReadBool(FSectionDop,'ShowPodp',false);
  mTextForButton.Checked := FIniFile.ReadBool(FSectionDop,'TextButton',false);
  for i:=0 to TbToolBar.Items.Count-1 do begin
    if not mTextForButton.Checked
      then TbToolBar.Items[i].DisplayMode:=nbdmImageAndText
      else TbToolBar.Items[i].DisplayMode:=nbdmDefault;
  end;
  SetEnableOperation;
  if mPodp.Checked then begin
    pn.Visible:=true;
 //   sp.Visible:=true;
  end else begin
    pn.Visible:=false;
 //   sp.Visible:=false;
  end;
  SetTitleGrid(Grid,GlobalTask.ParamAsString('GRID'));
  if GlobalFontNameG<>'' then begin
    Grid.Font.Name:=GlobalFontNameG;
    Grid.TitleFont.Name:=GlobalFontNameG;
  end;
  if GlobalFontSizeG>8
    then Grid.Font.Size:=GlobalFontSizeG;
  if GlobalFontSizeGT>8
    then Grid.TitleFont.Size:=GlobalFontSizeGT;

  if ParamsEditSpr<>nil then begin
    for i:=0 to ParamsEditSpr.FormatList.Count-1 do begin
//    <FILEDNAME>=<DISPLAYFORMAT>~<ALIGN=C,L,R>
      s:=ParamsEditSpr.FormatList.Names[i];
      ss:=ParamsEditSpr.FormatList.ValueFromIndex[i];
      n:=Pos('~',ss);
      if n=0 then begin
        Grid.FieldColumns[s].DisplayFormat:=ss;
        Grid.FieldColumns[s].EditMask:=ss;
      end else begin
        //taLeftJustify, taRightJustify, taCenter
        Grid.FieldColumns[s].DisplayFormat:=Copy(ss,1,n-1);
        Grid.FieldColumns[s].EditMask:=Copy(ss,1,n-1);
        if Copy(ss,n+1,1)='C' then
          Grid.FieldColumns[s].Alignment:=taCenter
        else if Copy(ss,n+1,1)='R' then
          Grid.FieldColumns[s].Alignment:=taRightJustify
        else if Copy(ss,n+1,1)='L' then
          Grid.FieldColumns[s].Alignment:=taLeftJustify;
      end;
    end;
    if ParamsEditSpr.Col1<>'' then begin
      try
        ParamsEditSpr.Col1:=CheckAddParamsCol(ParamsEditSpr.Col1);
        Grid.FieldColumns[ParamsEditSpr.Col1].OnGetCellParams:=ParamsEditSpr.GetCellParams_Col1;
      except
      end;
    end;
    if ParamsEditSpr.Col2<>'' then begin
      try
        ParamsEditSpr.Col2:=CheckAddParamsCol(ParamsEditSpr.Col2);
        Grid.FieldColumns[ParamsEditSpr.Col2].OnGetCellParams:=ParamsEditSpr.GetCellParams_Col2;
      except
      end;
    end;
    if ParamsEditSpr.Col3<>'' then begin
      try
        ParamsEditSpr.Col3:=CheckAddParamsCol(ParamsEditSpr.Col3);
        Grid.FieldColumns[ParamsEditSpr.Col3].OnGetCellParams:=ParamsEditSpr.GetCellParams_Col3;
      except
      end;
    end;
    if ParamsEditSpr.Col4<>'' then begin
      try
        ParamsEditSpr.Col4:=CheckAddParamsCol(ParamsEditSpr.Col4);
        Grid.FieldColumns[ParamsEditSpr.Col4].OnGetCellParams:=ParamsEditSpr.GetCellParams_Col4;
      except
      end;
    end;
    if ParamsEditSpr.Col5<>'' then begin
      try
        ParamsEditSpr.Col5:=CheckAddParamsCol(ParamsEditSpr.Col5);
        Grid.FieldColumns[ParamsEditSpr.Col5].OnGetCellParams:=ParamsEditSpr.GetCellParams_Col5;
      except
      end;
    end;
  end;

end;
//---------------------------------------------------
function TfmLookUp.CheckAddParamsCol(nameCol:String):String;
var
  n:Integer;
begin
  n:=Pos('{',NameCol);
  if n>0 then begin
    if Pos('{IMAGE}',NameCol)>0 then begin
      NameCol:=StringReplace(NameCol, '{IMAGE}', '', []);
      Grid.FieldColumns[nameCol].ImageList:=ImageList;
    end;
    if Pos('{IMAGEG}',NameCol)>0 then begin
      NameCol:=StringReplace(NameCol, '{IMAGEG}', '', []);
      Grid.FieldColumns[nameCol].ImageList:=ImGisun;
    end;
  end;
  Result:=NameCol;
end;
//---------------------------------------------------
procedure TfmLookUp.SaveToIni(lForm : Boolean);
begin
  if lForm then begin
    CompToIni(Self,FIniFile,FSection+'_FORM',',Height,Width,Top,Left,');
  end;
  Grid.SaveToIni(FIniFile,FSection);
  FIniFile.WriteBool(FSectionDop,'ShowPodp',mPodp.Checked);
  FIniFile.WriteBool(FSectionDop,'TextButton',mTextForButton.Checked);
//  CompToIni(Self,FConfMainForm,  Section, PropForm);
end;

procedure TfmLookUp._SetTitleButton;
var
  i : Integer;
begin
  for i:=0 to Grid.Columns.Count-1 do begin
    Grid.Columns[i].Title.TitleButton:=TitleButton;
  end;
end;

const
  INDEX_ADD  = 4;
  INDEX_CORR = 3;

procedure TfmLookUp.TBItemAddClick(Sender: TObject);
var
  Ic : TIcon;
begin
  FRunSetUp:=true;
  Ic := TIcon.Create;
  ImageList.GetIcon(INDEX_ADD,Ic);
  try
    if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnEditRecord) then begin
      ParamsEditSpr.OnEditRecord(Grid,true, Ic);
    end else begin
      EditRecordGrid(Grid,true,Ic,ParamsEditSpr);
    end;
  finally
    Ic.Free;
    FRunSetUp:=false;
  end;
end;

procedure TfmLookUp.TBItemCorrClick(Sender: TObject);
var
  Ic : TIcon;
  fld: TField;
begin
  fld:=nil;
  if (FOpisEdit<>nil) and (FOpisEdit.ResultField<>'') then begin
    fld:=Grid.DataSource.DataSet.FindField(FOpisEdit.ResultField);
  end;
  if fld=nil then begin
    if Grid.DataSource.DataSet.Eof then begin
      Beep;
      Exit;
    end;
  end else begin
    if fld.IsNull then begin
      Beep;
      Exit;
    end;
  end;
  FRunSetUp:=true;
  Ic := TIcon.Create;
  ImageList.GetIcon(INDEX_CORR,Ic);
  try
    if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnEditRecord) then begin
      ParamsEditSpr.OnEditRecord(Grid,false, Ic);
    end else begin
      EditRecordGrid(Grid,false,Ic,ParamsEditSpr);
    end;
  finally
    Ic.Free;
    FRunSetUp:=false;
  end;
end;

//-----------------------------------------------------------
procedure TfmLookUp.SetEnableOperation;
var
  s : String;     
begin
  if FEnableEdit then begin
    s := '';
    if (alopInsertEh in Grid.AllowedOperations) or
       (alopAppendEh in Grid.AllowedOperations) then begin
      TBItemAdd.ShortCut := TextToShortCut('INS');
      TBItemAdd.Visible := true;
      s := s + ' <Ins> Добавить  ';
    end else begin
      TBItemAdd.ShortCut := TextToShortCut('');
      TBItemAdd.Visible := false;
    end;
    if alopDeleteEh in Grid.AllowedOperations then begin
      TBItemDelete.Visible := true;
      TBItemDelete.ShortCut := TextToShortCut('Ctrl+Del');
      s := s + '<Ctrl-Del> Удалить  ';
    end else begin
      TBItemDelete.ShortCut := TextToShortCut('');
      TBItemDelete.Visible := false;
    end;
    if (alopUpdateEh in Grid.AllowedOperations) then begin
      TBItemCorr.ShortCut := TextToShortCut('F2');
      TBItemCorr.Visible := true;
      s := s + '<F2> Корректировать  ';
    end else begin
      TBItemCorr.ShortCut := TextToShortCut('');
      TBItemCorr.Visible := false;
    end;
    if (OpisEdit<>nil) and OpisEdit.MultiSelect then begin
      s := s + ' <F3> Добавить в выбор  <Ctrl-F3> Отменить выбор  ';
    end;
    s := s + ' <F4> Поиск по графе';
    StBar.Panels[0].Text := s;
  end else begin
    stBar.Panels[0].Text := ' <Enter> Выбрать   <ESC> Отказ   <F4> Поиск   ';
    if (OpisEdit<>nil) and OpisEdit.MultiSelect then begin
      stBar.Panels[0].Text:=stBar.Panels[0].Text + '<F3> Добавить в выбор  <Ctrl-F3> Отменить выбор  ';
    end;
  end;
end;

procedure TfmLookUp.SetEnableEdit(const Value: Boolean);
begin
  FEnableEdit := Value;
  if GlobalEditSpr.OnlyRead then begin
    FEnableEdit:=false;
  end;
  if FEnableEdit then begin
    stBar.Panels[0].Text := '<Ins> Добавить   <Ctrl-Del> Удалить   <F2> Корректировать   <F4> Поиск   <Enter> Выбрать   <ESC> Отказ';
    TBItemAdd.Visible:=true;
    TBItemCorr.Visible:=true;
    TBItemDelete.Visible:=true;
    TBItemAdd.Enabled:=true;
    TBItemCorr.Enabled:=true;
    TBItemDelete.Enabled:=true;
    TBItemAdd.ShortCut := TextToShortCut('INS');
    TBItemCorr.ShortCut := TextToShortCut('F2');
    TBItemDelete.ShortCut := TextToShortCut('Ctrl+Del');
    SetEnableOperation;
  end else begin
    stBar.Panels[0].Text := ' <Enter> Выбрать   <ESC> Отказ   <F4> Поиск   ';
    if (OpisEdit<>nil) and OpisEdit.MultiSelect then begin
      stBar.Panels[0].Text:=stBar.Panels[0].Text + '<F3> Добавить в выбор  <Ctrl-F3> Отменить выбор  ';
    end;
    TBItemAdd.ShortCut := TextToShortCut('');
    TBItemCorr.ShortCut := TextToShortCut('');
    TBItemDelete.ShortCut := TextToShortCut('');
    TBItemAdd.Visible:=false;
    TBItemCorr.Visible:=false;
    TBItemDelete.Visible:=false;
    TBItemAdd.Enabled:=false;
    TBItemCorr.Enabled:=false;
    TBItemDelete.Enabled:=false;
  end;
end;

procedure TfmLookUp.TBItemChoiceClick(Sender: TObject);
begin
  FChoiceZnach:=FDataSet.FieldByName(FNameField).Value;
  ModalResult:=mrOk;
  if not FModal then Close;
end;

procedure TfmLookUp.TBItemCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
  if not FModal then Close;
end;

procedure TfmLookUp.StBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
//  if EnableEdit then begin
    PutStrHelp(Panel.Text, StatusBar.Canvas, Rect);
//  end else begin
//    PutStrHelp(' <Enter> Выбрать  <ESC> Отказ  <F4>  Поиск', StatusBar.Canvas, Rect);
//  end;
end;

procedure TfmLookUp.TBItemDetailClick(Sender: TObject);
begin
  FRunSetUp := true;
  FOpisEdit.EditDetail(0, DataSource);
  FRunSetUp := false;
end;

procedure TfmLookUp.SetEnableDetail(const Value: Boolean);
begin
  FEnableDetail := Value;
  if FEnableDetail then begin
    TBItemDetail.Visible:=true;
    TBItemDetail.Enabled:=true;
  end else begin
    TBItemDetail.Visible:=false;
    TBItemDetail.Enabled:=false;
  end;
end;

procedure TfmLookUp.OnRunChoiceSort(Sender: TObject);
var
  n,i : Integer;
begin
  i:=Pos('_',TTbItem(Sender).Name);
  if i>0 then begin
    n := StrToInt(Copy(TTbItem(Sender).Name,i+1,20));
    dbSetIndex(FDataSet, FOpisEdit.ListIndex.Names[n]);
    FDataSet.First;
    for i:=0 to TBSubmenuSort.Count-1 do begin
      TBSubmenuSort.Items[i].Checked:=false;
    end;
    TTbItem(Sender).Checked:=true;
  end;
end;

procedure TfmLookUp.SetOpisEdit(const Value: TOpisEdit);
var
 it : TTbItem;
 i : Integer;
 lVisible:Boolean;
begin
//  ParamsEditSpr:=nil;
  FSetParamsFromOpis:=false;
  FOpisEdit := Value;
  if (FOpisEdit<>nil) then begin
    if FOpisEdit.TreeViewSoato<>'' then begin
//      tvSoato.Visible:=true;
//      Splitter.Visible:=true;
    end;

    if FOpisEdit.MultiSelectDir<>''
      then MultiChoiceDir:=FOpisEdit.MultiSelectDir;
    if FOpisEdit.MultiSelectFilter<>''
      then MultiChoiceFilter:=FOpisEdit.MultiSelectFilter;
    MultiChoiceShowID:=FOpisEdit.MultiSelectShowID;
    GridSelect.Visible:=FOpisEdit.MultiSelect;
    Splitter.Visible:=FOpisEdit.MultiSelect;
    TBItemAddSelect.Visible:=FOpisEdit.MultiSelect;
    lVisible:=(FOpisEdit.MultiSelectDir<>'not') and FOpisEdit.MultiSelect;
    TBItemSave.Visible:=lVisible;
    TBItemLoad.Visible:=lVisible;
//      tvSoato.Visible:=true;
//      Splitter.Visible:=true;
    if FOpisEdit.ParamsEditSpr<>nil then begin
      ParamsEditSpr:=FOpisEdit.ParamsEditSpr;
      FSetParamsFromOpis:=true;
    end;
    if (FOpisEdit.ListDetail<>nil) then begin
      if FOpisEdit.ListDetail.Count > 0 then begin
        EnableDetail := true;
        TBItemDetail.Clear;
        if FOpisEdit.ListDetail.Count=1 then begin
          TBItemDetail.Visible:=false;
          TBItemOneDetail.Caption := TOpisEdit(FOpisEdit.ListDetail.Items[0]).Caption;
          TBItemOneDetail.Visible:=true;
        end else begin
          TBItemDetail.Visible:=true;
          TBItemOneDetail.Visible:=false;
          TBItemDetail.DropdownCombo:=true;
          for i:=0 to FOpisEdit.ListDetail.Count-1 do begin
            it := TTbItem.Create(TBItemDetail);
            it.Name:='TBItemDetail_'+IntToStr(i);
            it.Caption:=TOpisEdit(FOpisEdit.ListDetail.Items[i]).Caption;
            it.OnClick:=OnRunEditDetail;
            it.ShortCut:=TextToShortCut('Ctrl+'+IntToStr(i+1));
            TBItemDetail.Add(it);
          end;
        end;
      end else begin
        EnableDetail := false;
      end;
    end else begin
      EnableDetail := false;
    end;
  end else begin
    EnableDetail := false;
  end;
end;

procedure TfmLookUp.OnRunEditDetail(Sender: TObject);
var
  n,i : Integer;
begin
  i:=Pos('_',TTbItem(Sender).Name);
  if i>0 then begin
    n := StrToInt(Copy(TTbItem(Sender).Name,i+1,20));
    FRunSetUp := true;
    FOpisEdit.EditDetail(n, DataSource);
    FRunSetUp := false;
  end;
end;

procedure TfmLookUp.TBItemOneDetailClick(Sender: TObject);
begin
  FRunSetUp := true;
  FOpisEdit.EditDetail(1, DataSource);
  FRunSetUp := false;
end;

procedure TfmLookUp.SetFlat(const Value: Boolean);
begin
  FFlat := Value;
end;

procedure TfmLookUp.SetTitleButton(const Value: Boolean);
begin
  FTitleButton := Value;
end;

procedure TfmLookUp.LoadParams;
var
  i : Integer;
  strName : String;
begin
  if FAddIniFile<>nil then begin
    if TBSubmenuSort.Visible then begin
      if (FOpisEdit<>nil) and (FOpisEdit.ListIndex<>nil) and
         (FOpisEdit.ListIndex.Count=TBSubmenuSort.Count) then begin
        strName := UpperCase(FAddIniFile.ReadString(FSection,'INDEXNAME',''));
        if strName<>'' then begin
          for i:=0 to FOpisEdit.ListIndex.Count-1 do begin
            if UpperCase(FOpisEdit.ListIndex.Names[i])=strName then begin
              try
                dbSetIndex(FDataSet, strName);
                TBSubmenuSort.Items[i].Checked := true;
              except
                PutError('Ошибка установки сортировки: '+strName,self);
              end;
            end else begin
              TBSubmenuSort.Items[i].Checked := false;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmLookUp.SaveParams;
var
  i : Integer;
begin
  if FAddIniFile<>nil then begin
    if TBSubmenuSort.Visible then begin
      for i:=0 to TBSubmenuSort.Count-1 do begin
        if TBSubmenuSort.Items[i].Checked then begin
          FAddIniFile.WriteString(FSection,'INDEXNAME',FOpisEdit.ListIndex.Names[i]);
        end;
      end;
    end;
  end;
end;

constructor TfmLookUp.Create(Owner: TComponent);
begin
  inherited;
//  tvSoato.CheckBox:=true;
//  tvSoato.Visible:=false;
  ParamsEditSpr:=nil;
  FSetParamsFromOpis:=false;

  MultiChoiceDir:='Mailing';
  MultiChoiceFilter:='Рассылки (*.adr)|*.adr';
  MultiChoiceShowID:=true;

  TBItemLoad.Visible:=false;
  TBItemSave.Visible:=false;

  Splitter.Visible:=false;
  GridSelect.Visible:=false;
  TBItemAddSelect.Visible:=false;
  FilterIsTemp:=false;
  strConstFilter:='';
  TBItemOneDetail.Visible:=false;
  FTitleButton:=true;
  FRun := false;
  Grid.TypeSave:=TypeSaveGridLookUp; // переменная из FuncPr.pas, исп-ся также в MetaTask.pas
  if not GlobalEditSpr.EnablePopupMenu then begin
    Grid.PopupMenu := nil;
  end;
end;

destructor TfmLookUp.Destroy;
begin
  if FIniFile<>nil then begin
    SaveParams;
    Grid.SaveLayoutToIni(FIniFile,FSection);
  end;
  inherited;
  if (ParamsEditSpr<>nil) and ParamsEditSpr.FreeOnExitSpr then begin
    if (FOpisEdit<>nil) and (FOpisEdit.ParamsEditSpr<>nil) then begin
      FOpisEdit.SetParamsEditSpr(nil); // !!!
    end;
    FreeAndNil(ParamsEditSpr);
  end;
end;

procedure TfmLookUp.TBItemDeleteClick(Sender: TObject);
var
  lDelete : Boolean;
  sDel:String;
begin
 if Grid.DataSource.DataSet.Eof then begin
   Beep;
   Exit;
 end;
 FRunSetUp:=true;
 if (ParamsEditSpr<>nil) and (ParamsEditSpr.Quest_Delete<>'')
   then sDel:=ParamsEditSpr.Quest_Delete
   else sDel:='   Удалить текущую запись ?   ';
 if Problem(sDel,mtConfirmation,self) then begin
   lDelete := true;
   if FOpisEdit<>nil then begin
     lDelete := FOpisEdit.CheckAllRI(RI_DELETE,'',true,false);
   end;
   if lDelete then begin
     if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnBeforeDelete) then begin
       ParamsEditSpr.OnBeforeDelete(Grid, lDelete);
     end;
     if lDelete then begin
       if EnableDetail then begin
         if FOpisEdit.DeleteDetailRecords then begin
           DataSource.DataSet.Delete;
         end;        
       end else begin
         DataSource.DataSet.Delete;
       end;
       if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnAfterDelete) then begin
         ParamsEditSpr.OnAfterDelete(Grid, lDelete);
       end;
     end;
   end;
 end;
 FRunSetUp:=false;
end;

procedure TfmLookUp.SetRunSetUp(const Value: Boolean);
begin
  FRunSetUp := Value;
end;

procedure TfmLookUp.TBItemSeekClick(Sender: TObject);
begin
  if Grid.SelectedIndex>-1 then begin
    GridTitleBtnClick(Grid, Grid.SelectedIndex, Grid.Columns[Grid.SelectedIndex]);
  end;
end;

procedure TfmLookUp.TBItemAddSelectClick(Sender: TObject);
var
  sID:String;
begin
  sID:=FDataSet.FieldByName(OpisEdit.ResultField).AsString;
  if tbSelect.Lookup('ID', sID, 'ID' )=null then begin
    tbSelect.Append;
    tbSelectID.AsString:=sID;
    tbSelectNAME.AsString:=sID+' '+FDataSet.FieldByName(OpisEdit.DisplayField).AsString;
    tbSelect.Post;
    tbSelect.First;
    Grid.Refresh;
  end;
end;

procedure TfmLookUp.GridSelectKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key=VK_DELETE) then begin //and (Shift=[]) then begin
     Key := 0;
     if tbSelectID.AsString<>'' then
       tbSelect.Delete;
     Grid.Refresh;
  end;
{
  end else if (Key=VK_ESCAPE) and (Shift=[]) then begin
    SpeedButton2Click(Sender);
    Key := 0;
  end else if (Key=VK_F4) and (Shift=[]) then begin
    if Grid.SelectedIndex>-1 then begin
      GridTitleBtnClick(Grid, Grid.SelectedIndex,
        Grid.Columns[Grid.SelectedIndex]);
      Key := 0;
    end;
  end; }
//  Grid.MyUserKeyDown(Sender,Key,Shift);
end;

const
  ZAG='MUILTICHOICE='#13#10;

procedure TfmLookUp.TBItemSaveClick(Sender: TObject);
var
   FileName: string;
   s,sDir, Err: string;
   n:Integer;
begin
//  MultiChoiceDir:='Mailing';
//  MultiChoiceFilter:='Рассылки (*.adr)|*.adr';
//  MultiChoiceShowID:=true;

   if tbSelect.RecordCount=0 then exit;
   FRunSetUp:=true;
   sDir:=CheckSleshN(ExtractFilePath(Application.ExeName))+MultiChoiceDir+'\';
   ForceDirectories(sDir);
//   GetGroup;
   sdMultichoice.FileName:=ChangeFileExt(FFileMultichoice, '');
   sdMultichoice.InitialDir:=sDir;
//   sdMultichoice.DefaultExt:='.adr';
   sdMultichoice.DefaultExt:=RightStr(MultiChoiceFilter,4);
   sdMultichoice.Filter:=MultiChoiceFilter; //'Рассылки (*.adr)|*.adr';
   if sdMultichoice.Execute then begin
      FileName:=ExpandFileName(ChangeFileExt(sdMultichoice.FileName, sdMultichoice.DefaultExt)); // '.adr'
      Err:='';
      tbSelect.DisableControls;
      tbSelect.First;
      s:=ZAG;
      while not tbSelect.Eof do begin
        s:=s+tbSelectNAME.AsString+#13#10;
        tbSelect.Next;
      end;
      tbSelect.First;
      tbSelect.EnableControls;
      MemoWrite(FileName, s);
   end;
   FRunSetUp:=false;
end;

procedure TfmLookUp.TBItemLoadClick(Sender: TObject);
var
   FileName: string;
   sDir, Err, s, sOrg: string;
   arr:TArrStrings;
   i,n:Integer;
begin
   FRunSetUp:=true;
   sDir:=CheckSleshN(ExtractFilePath(Application.ExeName))+MultiChoiceDir+'\';
   ForceDirectories(sDir);
   sdMultichoice.FileName:='';
   odMultichoice.InitialDir:=sDir;
   odMultichoice.DefaultExt:=RightStr(MultiChoiceFilter,4);
   odMultichoice.Filter:=MultiChoiceFilter; //'Рассылки (*.adr)|*.adr';
   if odMultichoice.Execute then begin
      FileName:=ExpandFileName(ChangeFileExt(odMultichoice.FileName, odMultichoice.DefaultExt));
      Err:='';
      MemoRead(FileName, s);
      if (s<>'') and (ANSIUpperCase(Copy(s,1,Length(ZAG)))=ZAG) then begin
        s:=Copy(s,Length(ZAG)+1,Length(s));
        GridSelect.SumList.Active:=false;
        tbSelect.DisableControls;
        tbSelect.EmptyTable;
        StrToArr(s,arr,#13#10,true);
        for i:=0 to Length(arr)-1 do begin
          n:=Pos(' ',arr[i]);
          if n>0 then begin
            sOrg:=Copy(arr[i],1,n-1);
            if FDataSet.Locate(OpisEdit.ResultField, sOrg, []) and not tbSelect.Locate('ID', sOrg, [loCaseInsensitive]) then begin
              tbSelect.Append;
              tbSelectID.AsString:=sOrg;
              tbSelectNAME.AsString:=arr[i];
              tbSelect.Post;
            end;
          end;
        end;
        tbSelect.First;
        tbSelect.EnableControls;
        GridSelect.SumList.Active:=true;
        Grid.Refresh;
        GridSelect.Refresh;
        FFileMultichoice:=FileName;
      end else begin
        PutError('Ошибка открытия');
      end;
   end;
   FRunSetUp:=false;
end;

procedure TfmLookUp.GridSelectColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  n:Integer;
begin
  if not MultiChoiceShowID then begin
    n:=Pos(' ',Params.Text);
    Params.Text:=Copy(Params.Text,n+1,Length(Params.Text));
  end;
end;

initialization
finalization
end.
