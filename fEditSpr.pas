unit fEditSpr;

{$I Task.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, ImgList, TypInfo, uTypes,
  Controls, Forms, Dialogs, IniFiles, Db,
  DbGridEh, SasaDbGrid, FuncEh, DataTask, DbFunc, OpisEdit, fLookUp, fRecordGrid,
  SasaUtils, Menus, Grids, GridSetUp, {$IFNDEF EHLIB3} GridsEh, {$ENDIF} StdCtrls, ExtCtrls, PrnDbgeh,
  UserEvents,ComCtrls, TB2Item, ActnList, TB2Dock, TB2Toolbar, fmStringSeek, mPermit
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

//  dm_main, , DopEvents
type

  TfmEditSpr = class(TForm)
    DataSource: TDataSource;
    Grid: TSasaDBGrid;
    PopupMenu: TPopupMenu;
    pmParam: TMenuItem;
    N2: TMenuItem;
    pmSaveParam: TMenuItem;
    mmTypeItem: TMenuItem;
    PrintGrid: TPrintDBGridEh;
    ImageList: TImageList;
    TBDock1: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemAdd: TTBItem;
    ActionList: TActionList;
    acClose: TAction;
    acPreView: TAction;
    acAdd: TAction;
    acEdit: TAction;
    TBItemEdit: TTBItem;
    TBItemPreView: TTBItem;
    TBItemExit: TTBItem;
    acPodchin: TAction;
    TBItemDetail: TTBSubmenuItem;
    pn: TPanel;
    StBar: TStatusBar;
    acClrFilter: TAction;
    tbClr: TTBItem;
    acDelete: TAction;
    TBItemDel: TTBItem;
    TBSubItemRun: TTBSubmenuItem;
    TBItemOneDetail: TTBItem;
    TBSubmenuSort: TTBSubmenuItem;
    TBItemExp: TTBItem;
    TBItemUp: TTBItem;
    TBItemDown: TTBItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure pmParamClick(Sender: TObject);
    procedure pmSaveParamClick(Sender: TObject);
    procedure mmTypeItemClick(Sender: TObject);
    procedure tbPreviewClick(Sender: TObject);
    procedure tbCloseClick(Sender: TObject);
    procedure StBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;  const Rect: TRect);
    procedure acPodchinExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure GridTitleBtnClick(Sender: TObject; ACol: Integer;    Column: TColumnEh);
    procedure acClrFilterExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemOneDetailClick(Sender: TObject);
    procedure TBItemExpClick(Sender: TObject);
    procedure DataSourceStateChange(Sender: TObject);
    procedure TBItemDownClick(Sender: TObject);
    procedure TBItemUpClick(Sender: TObject);
  private
    { Private declarations }
//    Grid : TSasaDbGrid;
    FErrorCode:String;
    FErrorName:String;
    FLoadForm: Boolean;
    FIniFile :  TCustomIniFile;
    FSection : String;
    FOpisEdit: TOpisEdit;
//    FOnEditRecord: TEditRecordGridEvent;
    FEnableDetail: Boolean;
    FOldIndex : String;
    FEvents : TUserEvents;
    strFirstFilter : String;
    strCurFilter  : String;
    strNameFilter : String;
    FEnableEdit: Boolean;
    FParamsEditSpr: TParamsEditSpr;
    FEditOnlyCard: Boolean;
    FModify: Boolean;
    FErrorEdit:String;
    FEnableFind: Boolean;
    FEnablePrint: Boolean;
    FCheckColumns:String;
    procedure SetOpisEdit(const Value: TOpisEdit);
//    procedure SetOnEditRecord(const Value: TEditRecordGridEvent);
    procedure SetEnableDetail(const Value: Boolean);
    function GetDataSet: TDataSet;
    procedure SetDataSet(const Value: TDataSet);
    procedure SetEnableEdit(const Value: Boolean);
    procedure SetParamsEditSpr(const Value: TParamsEditSpr);
    procedure SetEditOnlyCard(const Value: Boolean);
    procedure SetModify(const Value: Boolean);
    procedure SetEnableFind(const Value: Boolean);
    procedure SetEnablePrint(const Value: Boolean);
    procedure Event_ChangeCode(Sender:TObject);
    procedure Event_AddChangeCode(Sender:TObject);

    { Private declarations }
  public
    { Public declarations }  //
   FRun : Boolean;
   FAddIniFile : TCustomIniFile;
   property ErrorEdit:String read FErrorEdit write FErrorEdit;
   property ParamsEditSpr : TParamsEditSpr read FParamsEditSpr write SetParamsEditSpr;
   property Modify:Boolean read FModify write SetModify;
   property EnableEdit : Boolean read FEnableEdit write SetEnableEdit;
   property EditOnlyCard : Boolean read FEditOnlyCard write SetEditOnlyCard;
   property DataSet : TDataSet read GetDataSet write SetDataSet;
//   property OnEditRecord : TEditRecordGridEvent read FOnEditRecord write SetOnEditRecord;
   property EnableDetail : Boolean read FEnableDetail write SetEnableDetail;
   property EnableFind : Boolean read FEnableFind write SetEnableFind;
   property EnablePrint : Boolean read FEnablePrint write SetEnablePrint;
   procedure UpdateActions; override;
   procedure LoadFromIni(IniFile: TCustomIniFile; Section: string);
   procedure SaveToIni;
   procedure SaveParams;
   procedure LoadParams;
   procedure SetUpFields(Table : TDataSet);
   property OpisEdit : TOpisEdit read FOpisEdit write SetOpisEdit;
   procedure OnRunEditDetail(Sender: TObject);
   procedure OnRunChoiceSort(Sender: TObject);
   procedure SetDefault;
   procedure SetEnableOperation;
   procedure RecordUpDown(lUp:Boolean);
   constructor CreateChild( Owner : TComponent );
   constructor Create(Owner : TComponent); override;
   procedure CreateAll(Owner : TComponent);
   procedure Spr_BeforePost( ds : TDataSet);
   destructor Destroy; override;
  end;

//procedure EditSpr(strNameOpis : String; lModal : Boolean;
//            Owner : TComponent; ParamsEditSpr : TParamsEditSpr);

implementation

uses MetaTask, uProjectAll, {mPermit,} FuncPr, fWarning;

const
  INDEX_ADD  = 17;
  INDEX_CORR = 16;

{$R *.DFM}
{

procedure EditSpr(strNameOpis : String; lModal : Boolean;
            Owner : TComponent; ParamsEditSpr : TParamsEditSpr);

var
  ID,i : Integer;
  fmEditSpr : TfmEditSpr;
  lErr : Boolean;
  Opis : TOpisEdit;
begin
 try
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA(strNameOpis);
  if Opis=nil then begin
    PutError(' Не обнаружено описание с кодом '+strNameOpis);
    exit;
  end;
  if Opis.Caption='' then begin
    PutError(' У описания ' + strNameOpis + ' отсутствует Caption. ');
    exit;
  end;
  //------- может окно уже открыто
  ID := -1;
  for i:=0 to Screen.FormCount-1 do begin
    if Screen.Forms[i].Caption = Opis.Caption then begin
      ID := i;
      break;
    end;
  end;
  //------------------------------
  if ID = -1 then begin
    if lModal then begin
      fmEditSpr := TfmEditSpr.Create(Owner);
    end else begin
      fmEditSpr := TfmEditSpr.CreateChild(Owner);
    end;
    if ParamsEditSpr<>nil then begin
      fmEditSpr.ParamsEditSpr := ParamsEditSpr;
//      fmEditSpr.OnEditRecord := ParamsEditSpr.OnEditRecord;
    end;
    lErr := false;
    if Opis.DataSet=nil then begin
      PutError(' Источник данных неизвестен. ');
      lErr:=true;;
    end else begin
      fmEditSpr.OpisEdit := Opis;
      GlobalTask.CurrentOpisEdit.SetKeyForm(fmEditSpr, nil);
      fmEditSpr.LoadFromIni(GlobalTask.iniFile('SPR'),'');
    end;
    if lErr then begin
      fmEditSpr.Free;
    end else begin
      if lModal then begin
        fmEditSpr.ShowModal;
      end else begin
        fmEditSpr.Show;
        Application.ProcessMessages;
      end;
      fmEditSpr.ActiveControl := fmEditSpr.Grid;
    end;
  end else begin
    fmEditSpr := TfmEditSpr(Screen.Forms[i]);
    fmEditSpr.Grid.Refresh;
    fmEditSpr.SetFocus;
    fmEditSpr.BringToFront;
    fmEditSpr.ActiveControl := fmEditSpr.Grid;
  end;
 finally
//  LockWindowUpdate(0);
 end;
end;
}
procedure TfmEditSpr.SetDefault;
begin
  FLoadForm := True;
  tbClr.Visible := false;
end;

procedure TfmEditSpr.CreateAll(Owner: TComponent);
begin
  FErrorEdit:='Запись не подлежит корректировке.';
  SetDefault;
  FCheckColumns:='';
  FErrorCode:='';
  FErrorName:='';
  FEnableFind:=true;
  FEnablePrint:=true;
  Modify:=false;
  TBSubItemRun.Visible := false;
  TBItemDown.Visible:=false;
  TBItemUp.Visible:=false;
  FEvents := TUserEvents.Create;
  FParamsEditSpr := nil;
  FEnableEdit   := true;
  FEditOnlyCard := false;
  FRun := false;
  FIniFile:=nil;

  FAddIniFile:=Globaltask.iniFile('FORM');  // !!!

  if (GlobalEditSpr=nil) or not Assigned(GlobalEditSpr.OnExportSpr) then begin
    TBItemExp.Visible:=false;
  end else begin
    TBItemExp.Visible:=true;
  end;
  if not GlobalEditSpr.EnablePopupMenu then begin
    Grid.PopupMenu := nil;
  end;
end;

constructor TfmEditSpr.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  CreateAll(Owner);
end;

constructor TfmEditSpr.CreateChild(Owner: TComponent);
begin
  inherited Create(Owner);
  FormStyle:=fsMDIChild;
  CreateAll(Owner);
end;

destructor TfmEditSpr.Destroy;
begin
  if FIniFile<>nil then begin
    SaveParams;
    Grid.SaveLayoutToIni(FIniFile,FSection+'.Grid');
  end;
  if (FParamsEditSpr<>nil) and FParamsEditSpr.FreeOnExitSpr then begin
    FreeAndNil(FParamsEditSpr)
  end;
  if FOpisEdit <> nil then begin
    if not FOpisEdit.CloseOnCancel then begin
      if (FOldIndex<>'') then begin
        dbSetIndex(DataSet,FOldIndex);
      end;
      RestFilterDataSet(DataSet,strFirstFilter);
    end;
  end;
  if FOpisEdit<>nil then begin
    FOpisEdit.Cancel;
//    if FOpisEdit.RI<>nil then begin
//      DataSet.AfterEdit  := nil;
//      DataSet.BeforePost := nil;
//    end;
  end;

  FEvents.Free;
  inherited;
end;

procedure TfmEditSpr.UpdateActions;
begin
  inherited;
//  if Grid.DataSource.DataSet.State = dsEdit then begin
//  if Grid.EditorMode then begin
//    Label1.Caption:='Editing';
//  end else begin
//    Label1.Caption:='$$$$$$$$';
//  end
end;

procedure TfmEditSpr.SetUpFields( Table : TDataSet );
Var i  : integer;
    Col: TColumnEh;
begin
  for i:=0 to Table.FieldList.Count-1 do begin
    Col:=Grid.Columns.Add;
//    Col.Title.Caption:=Table.FieldList[i].FieldName;
    Col.FieldName:=Table.FieldList[i].FieldName;
  end;
end;

const
  PropForm = ',Left,Top,Width,Height,WindowState,';

procedure TfmEditSpr.LoadFromIni(IniFile: TCustomIniFile; Section: string);
var
 i,n:Integer;
 s,ss:String;
 col:TColumnEh;
begin
  FIniFile:=IniFile;
  if FAddIniFile=nil
    then FAddIniFile:=FIniFile;

  if (Section <> '') then FSection:=Section;
  //ParamPanel.Height:=IniFile.ReadInteger(Section,'ParamHeight',85);
  //If FControls<>Nil then FControls.SetIniFile(FIniFile,Section+'.Params');
  if FLoadForm then begin
    if not SetPosForm(Self, FAddIniFile.ReadString(FSection, 'FormPos', '') )
      then CompFromIni(Self,FIniFile,FSection+'.Form',PropForm);
  end;
  Grid.LoadFromIni(FIniFile,FSection+'.Grid');
  SetEnableOperation;

  if (FParamsEditSpr<>nil) and (FParamsEditSpr.VisibleColumns<>'') then begin
    s:=','+ANSIUpperCase(FParamsEditSpr.VisibleColumns)+',';
    for i:=0 to Grid.Columns.Count-1 do begin
      if Pos(','+ANSIUpperCase(Grid.Columns[i].FieldName)+',', s)>0
        then Grid.Columns[i].Visible:=true
        else Grid.Columns[i].Visible:=false;
    end;
  end;

  if ParamsEditSpr<>nil then begin
    for i:=0 to ParamsEditSpr.FormatList.Count-1 do begin
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
        Grid.FieldColumns[ParamsEditSpr.Col1].OnGetCellParams:=ParamsEditSpr.GetCellParams_Col1;
      except
      end;
    end;
    if ParamsEditSpr.Col2<>'' then begin
      try
        Grid.FieldColumns[ParamsEditSpr.Col2].OnGetCellParams:=ParamsEditSpr.GetCellParams_Col2;
      except
      end;
    end;
    if ParamsEditSpr.Col3<>'' then begin
      try
        Grid.FieldColumns[ParamsEditSpr.Col3].OnGetCellParams:=ParamsEditSpr.GetCellParams_Col3;
      except
      end;
    end;
    if ParamsEditSpr.Col4<>'' then begin
      try
        Grid.FieldColumns[ParamsEditSpr.Col4].OnGetCellParams:=ParamsEditSpr.GetCellParams_Col4;
      except
      end;
    end;
    if ParamsEditSpr.Col5<>'' then begin
      try
        Grid.FieldColumns[ParamsEditSpr.Col5].OnGetCellParams:=ParamsEditSpr.GetCellParams_Col5;
      except
      end;
    end;
  end;
  SetTitleGrid(Grid,GlobalTask.ParamAsString('GRID'));
  if GlobalFontNameG<>'' then begin
    Grid.Font.Name:=GlobalFontNameG;
    Grid.TitleFont.Name:=GlobalFontNameG;
  end;
//  Grid.RowSizingAllowed:=false;
  if GlobalFontSizeG>8
    then Grid.Font.Size:=GlobalFontSizeG;
  if GlobalFontSizeGT>8
    then Grid.TitleFont.Size:=GlobalFontSizeGT;
//  Grid.Font.Name:='Tahoma';
//  Grid.Font.Size:=10;

//  Grid.LoadFormat(FIniFile,FSection)
//  CompFromIni(Self,IniFile,Section,BoundsProps);
//  LoadFormPlacement(Self,FIniFile,Section);
end;

procedure TfmEditSpr.SaveToIni;
begin
  if WindowState = wsMaximized then begin
    CompToIni(Self,FIniFile,FSection+'.Form',',WindowState,');
  end else begin
    CompToIni(Self,FIniFile,FSection+'.Form',PropForm);
  end;
  {
  if (FCheckColumns<>'') then begin
    StrToArr(FCheckColumns,arr,',',true);
    for i:=Low(arr) to High(arr)  do begin
      col:=Grid.FieldColumns[arr[i]];
      if (col<>nil) then begin
        col.Visible:=true;      // вернем обратно видимость колонки перед сохранением
      end;
    end;
  end;
  }
  Grid.SaveToIni(FIniFile,FSection+'.Grid',true);
//  Grid.SaveFormat(FIniFile,FSection)
//  CompToIni(Self,IniFile,Section,BoundsProps);
//  SaveFormPlacement(Self,IniFile,Section);
//  FIniFile.UpdateFile;
end;

procedure TfmEditSpr.LoadParams;
var
  i : Integer;
  strName : String;
begin
  if FAddIniFile<>nil then begin
    if TBSubmenuSort.Visible then begin
      if (FOpisEdit<>nil) and (FOpisEdit.ListIndex<>nil) and
         (FOpisEdit.ListIndex.Count=TBSubmenuSort.Count) then begin
        strName := UpperCase(FAddIniFile.ReadString(FSection,'IndexName',''));
        if strName<>'' then begin
          for i:=0 to FOpisEdit.ListIndex.Count-1 do begin
            if UpperCase(FOpisEdit.ListIndex.Names[i])=strName then begin
              try
                dbSetIndex(DataSet, strName);
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

procedure TfmEditSpr.SaveParams;
var
  i : Integer;
begin
  if FAddIniFile<>nil then begin
    FAddIniFile.WriteString(FSection, 'FormPos', GetPosForm(Self));
    if TBSubmenuSort.Visible then begin
      for i:=0 to TBSubmenuSort.Count-1 do begin
        if TBSubmenuSort.Items[i].Checked then begin
          FAddIniFile.WriteString(FSection,'IndexName',FOpisEdit.ListIndex.Names[i]);
        end;
      end;
    end;
  end;
end;

procedure TfmEditSpr.FormClose(Sender: TObject; var Action: TCloseAction);
var
  lClose:Boolean;
begin
  lClose:=true;
  if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnCloseWindow) then begin
    ParamsEditSpr.OnCloseWindow( Grid, lClose);
  end;
  if lClose then begin
    SaveParams;
    if FormStyle=fsMDIChild then begin
      Action := caFree;
    end;
  end else begin
    Action := caNone;
  end;
end;

procedure TfmEditSpr.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if (Key=VK_F3) and ([ssAlt] = Shift) then begin
//  if (Key=VK_ESCAPE) then begin
//    Close;
//  end;
end;

procedure TfmEditSpr.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
//  if (Key=VK_F4) and ([ssAlt] = Shift) then begin
//  if (Key=VK_ESCAPE) then begin
//    Close;
//  end;
end;

procedure TfmEditSpr.FormDestroy(Sender: TObject);
begin
//  showmessage(' destroy spr ');
end;

procedure TfmEditSpr.pmParamClick(Sender: TObject);
begin
//  SetUpGrid(TDbGridEh(Grid));
  SetUpGrid(Grid,'',false);
  SetEnableOperation;
end;

procedure TfmEditSpr.pmSaveParamClick(Sender: TObject);
begin
  SaveToIni;
end;

procedure TfmEditSpr.mmTypeItemClick(Sender: TObject);
begin
 // ExecuteFilter( DataSet       : TDataSet;
 //                strNameFields : String);

end;
{

procedure TForm1.ppmSaveSelectionClick(Sender: TObject);
var ExpClass:TDBGridEhExportClass;
    Ext:String;
begin
  SaveDialog1.FileName := 'file1';
  if (ActiveControl is TDBGridEh) then
    if SaveDialog1.Execute then
    begin
      case SaveDialog1.FilterIndex of
        1: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
        2: begin ExpClass := TDBGridEhExportAsCSV; Ext := 'csv'; end;
        3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
        4: begin ExpClass := TDBGridEhExportAsRTF; Ext := 'rtf'; end;
        5: begin ExpClass := TDBGridEhExportAsXLS; Ext := 'xls'; end;
      else
        ExpClass := nil; Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if UpperCase(Copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-2,3)) <>
           UpperCase(Ext) then
          SaveDialog1.FileName := SaveDialog1.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass,TDBGridEh(ActiveControl),
             SaveDialog1.FileName,False);
      end;
    end;
end;


}
procedure TfmEditSpr.tbPreviewClick(Sender: TObject);
//var ExpClass:TDBGridEhExportClass;
begin
  PrintGrid.BeforeGridText.Clear;
  PrintGrid.BeforeGridText.Add(Self.Caption);
  PrintGrid.Preview;
end;

procedure TfmEditSpr.tbCloseClick(Sender: TObject);
begin
  PostDataSource(Grid.DataSource);
  Close;
end;

procedure TfmEditSpr.StBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  PutStrHelp(Panel.Text, StatusBar.Canvas, Rect);
end;

procedure TfmEditSpr.acPodchinExecute(Sender: TObject);
begin
  if FOpisEdit<>nil then
    FOpisEdit.EditDetail(0, DataSource);
end;

procedure TfmEditSpr.TBItemOneDetailClick(Sender: TObject);
begin
  if FOpisEdit<>nil then
    FOpisEdit.EditDetail(1, DataSource);
end;

procedure TfmEditSpr.OnRunEditDetail(Sender: TObject);
var
  n,i : Integer;
begin
  i:=Pos('_',TTbItem(Sender).Name);
  if i>0 then begin
    n := StrToInt(Copy(TTbItem(Sender).Name,i+1,20));
    FOpisEdit.EditDetail(n, DataSource);
  end;
end;

procedure TfmEditSpr.OnRunChoiceSort(Sender: TObject);
var
  n,i : Integer;
begin
  i:=Pos('_',TTbItem(Sender).Name);
  if i>0 then begin
    n := StrToInt(Copy(TTbItem(Sender).Name,i+1,20));
    dbSetIndex(DataSet, FOpisEdit.ListIndex.Names[n]);
    DataSet.First;
    for i:=0 to TBSubmenuSort.Count-1 do begin
      TBSubmenuSort.Items[i].Checked:=false;
    end;
    TTbItem(Sender).Checked:=true;
  end;
end;

procedure TfmEditSpr.SetOpisEdit(const Value: TOpisEdit);
var
 it : TTbItem;
 i : Integer;
 oldIndex : String;
 sep : TTbSeparatorItem;
begin
  FOpisEdit := Value;
  if (FOpisEdit<>nil) then begin
    if FOpisEdit.UpDownField<>'' then begin
      TBItemDown.Visible:=true;
      TBItemUp.Visible:=true;
    end;

    {$IFDEF USE_SCRIPT}
    //------ загрузим события для обработки --------------
    FEvents.LoadEvents(FOpisEdit.Section, TBSubItemRun);
    //----------------------------------------------------
    {$ENDIF}
    if FOpisEdit.IsChangeCode and (Role.Status=rsAdmin) then begin
      if TBSubItemRun.Count>0 then begin
        sep:=TTbSeparatorItem.Create(TBSubItemRun);
        TBSubItemRun.Add(sep);
      end;
      it:=TTbItem.Create(TBSubItemRun);
      it.Caption:='Отметить ошибочное значение';
      it.OnClick:=Event_AddChangeCode;
      TBSubItemRun.Add(it);
      TBSubItemRun.Visible:=true;

      it:=TTbItem.Create(TBSubItemRun);
      it.Caption:='Замена ошибочного значения';
      it.OnClick:=Event_ChangeCode;
      TBSubItemRun.Add(it);
      TBSubItemRun.Visible:=true;
    end;
    if TBItemExp.Visible then begin
      TBItemExp.Visible := FOpisEdit.EnableExport;
    end;
    FOldIndex:= '';
    DataSet  := FOpisEdit.DataSet;
    Caption  := FOpisEdit.Caption;

    // !!!!!!! -----------  17.02.2010
    // если в функцию EditSpr не передан ParamsEditSpr, а в OpisEdit он означен
    //  OpisEdit.ParamsEditSpr.FreeOnExitSpr должен быть установлен в FALSE <-----!!!!!!!
    if (FParamsEditSpr=nil) and (OpisEdit.ParamsEditSpr<>nil) then begin
      FParamsEditSpr:=OpisEdit.ParamsEditSpr;
// !!! 11.09.2018    OpisEdit.FParamsEditSpr.FreeOnExitSpr:=false;
    end;

//    if FOpisEdit.RI<>nil then begin
//      DataSet.AfterEdit  := FOpisEdit.OnAfterEditDataSet;
//      DataSet.BeforePost := FOpisEdit.OnBeforePostDataSet;
//    end;

    if FOpisEdit.NameSort<>'' then begin
      oldIndex := dbGetIndex(DataSet);
      if oldIndex<>FOpisEdit.NameSort then begin
        FOldIndex := oldIndex;
        dbSetIndex(DataSet,FOpisEdit.NameSort);
      end;
    end;
    if (FOpisEdit.ListIndex<>nil) and (FOpisEdit.ListIndex.Count>0) then begin
      for i:=0 to FOpisEdit.ListIndex.Count-1 do begin
        it := TTbItem.Create(TBSubmenuSort);
        it.Name:='TBItemSort_'+IntToStr(i);
        it.Caption:=FOpisEdit.ListIndex.Values[FOpisEdit.ListIndex.Names[i]];
        it.OnClick:=OnRunChoiceSort;
        it.ShortCut:=TextToShortCut('Alt+'+IntToStr(i+1));
        if UpperCase(FOpisEdit.ListIndex.Names[i])=UpperCase(dbGetIndex(DataSet)) then begin
          it.Checked:=true;
        end;
        TBSubmenuSort.Add(it);
      end;
      TBSubmenuSort.Visible:=true;
    end;    
    if Length(FOpisEdit.ConfSection)=0
      then FSection := 'FormSpr.'+FOpisEdit.DataSet.Name
      else FSection := 'FormSpr.'+FOpisEdit.ConfSection;
    if (FOpisEdit.ListDetail<>nil) and (FOpisEdit.ListDetail.Count>0) then begin
      EnableDetail := true;
      TBItemDetail.Clear;
      if FOpisEdit.ListDetail.Count=1 then begin
        TBItemDetail.Visible:=false;
        TBItemOneDetail.Caption := TOpisEdit(FOpisEdit.ListDetail.Items[0]).Caption;
        TBItemOneDetail.Visible:=true;
      end else begin
        TBItemDetail.Visible:=true;
        TBItemOneDetail.Visible:=false;
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
end;
//--------------------------------------
procedure TfmEditSpr.Event_AddChangeCode;
var
  sCode,sName:String;
begin
 if (FOpisEdit<>nil) and (FOpisEdit.ResultField<>'') then begin
   sCode:=DataSource.DataSet.FieldByName(FOpisEdit.ResultField).AsString;
   sName:=DataSource.DataSet.FieldByName(FOpisEdit.DisplayField).AsString;
   if FErrorCode='' then  begin
     FErrorCode:=sCode;
     FErrorName:=sName;
     Grid.Refresh;
   end else begin
     if FErrorCode=sCode then  begin
       FErrorCode:='';
       FErrorName:='';
       Grid.Refresh;
     end else begin
       PutError('В качестве ошибочного уже отмечено значение: "'+FErrorName+'"');
     end;
   end;
 end;
end;
//--------------------------------------
procedure TfmEditSpr.Event_ChangeCode;
var
  s,sError,sNewCode,sNewName:String;
  lOk:Boolean;
begin
  if FErrorCode='' then begin
    PutError('Необходимо отметить ошибочное значение',self);
  end else begin
    sNewCode:=DataSource.DataSet.FieldByName(FOpisEdit.ResultField).AsString;
    sNewName:=DataSource.DataSet.FieldByName(FOpisEdit.DisplayField).AsString;
    if sNewCode<>FErrorCode then begin
      s := '';
      s := s + 'Вы хотите изменить значение в базе'#13;
      s := s + 'с:'#13;
      s := s + '"'+FErrorName+'"'#13;
      s := s + 'на:'#13;
      s := s + '"'+DataSource.DataSet.FieldByName(FOpisEdit.DisplayField).AsString+'"'#13;
      s := s + '  '#13;
      s := s + 'Если Вы уверены введите слово ДА в поле ввода';
      if OkWarning(s) then begin
        sError:='';
        if (FParamsEditSpr<>nil) and Assigned(FParamsEditSpr.OnChangeCode) then begin
          FParamsEditSpr.OnChangeCode(FErrorCode, FErrorName, sNewCode, sNewName, sError);
          if sError<>''then lOk:=false else lOk:=true;
        end else begin
          lOk:=FOpisEdit.CheckAllRI(RI_CHANGE_AND_DEL, FErrorCode, true, true, self);
          if not lOk then sError:=FOpisEdit.LastError;
        end;
        if lOk then begin
          with DataSource.DataSet do begin
            DisableControls;
            s:=Bookmark;
            if Locate(FOpisEdit.ResultField{FOpisEdit.RI.Field_ID}, FErrorCode, [])
              then Delete;
            Bookmark:=s;
            EnableControls;
          end;
          FErrorCode:='';
          FErrorName:='';
          Grid.Refresh;
        end else begin
          PutError(sError,self);
        end;
      end;
    end;
  end;
end;
//--------------------------------------
procedure TfmEditSpr.acAddExecute(Sender: TObject);
var
  Ic : TIcon;
begin
  Ic := TIcon.Create;
  ImageList.GetIcon(INDEX_ADD,Ic);
  try
    if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnEditRecord) then begin
  //    if Assigned(FOnEditRecord) then begin
  //      FOnEditRecord(Grid,true, Ic);
      ParamsEditSpr.OnEditRecord(Grid,true, Ic);
    end else begin
      EditRecordGrid(Grid,true,Ic, ParamsEditSpr);
    end;
  finally
    Ic.Free;
  end;
end;
//--------------------------------------
procedure TfmEditSpr.SetEnableDetail(const Value: Boolean);
begin
  FEnableDetail := Value;
  if FEnableDetail then begin
    TBItemDetail.Visible:=true;
    TBItemDetail.Enabled:=true;
  end else begin
    TBItemDetail.Visible:=false;
    TBItemDetail.Enabled:=false;
    TBItemOneDetail.Visible:=false;
  end;
end;

procedure TfmEditSpr.acEditExecute(Sender: TObject);
var
  Ic : TIcon;
  lCheck:Boolean;
  fld:TField;
begin
{  if Grid.DataSource.DataSet.Eof and Grid.DataSource.DataSet.Bof then begin
    Beep;
    Exit;         
  end;   }
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
  lCheck:=true;
  if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnCheckEdit) then begin
    ParamsEditSpr.OnCheckEdit(Grid, lCheck);
  end;
  if not lCheck then begin  // запись запрещена к корректировке
    raise EMyError.Create(FErrorEdit);
  end else begin
    Ic := TIcon.Create;
    ImageList.GetIcon(INDEX_CORR,Ic);
    try
      if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnEditRecord) then begin
        ParamsEditSpr.OnEditRecord(Grid, false, Ic);
      end else begin
        if not Grid.ReadOnly then begin //and (dgEditing in Grid.Options) then begin
          EditRecordGrid(Grid, false, Ic, ParamsEditSpr);
        end;
      end;
    finally
      Ic.Free;
    end;
  end;
end;

procedure TfmEditSpr.GridKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  Grid.MyUserKeyDown(Sender,Key,Shift);
  if (Key=VK_F4) and (Shift=[]) then begin
    if Grid.SelectedIndex>-1 then begin
      GridTitleBtnClick(Grid, Grid.SelectedIndex,  Grid.Columns[Grid.SelectedIndex]);
    end;
  end;
end;

procedure TfmEditSpr.GridTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
var
  lReopen : Boolean;
  CurValue: TParamFieldFlt;
begin
  DataSource.DataSet.DisableControls;
  CurValue:=TParamFieldFlt.Create;
  CurValue.AOwner:=self;
  CurValue.Empty:=true;  // !!!   типа нет текущих значений для поиска
  if SetGridSeekColumn(Column, true, strFirstFilter, lReopen, CurValue) then begin
    strNameFilter:='ФИЛЬТР';
    tbClr.Visible := true;
    DataSource.DataSet.EnableControls;
    if lReopen then begin
      FLoadForm:=false;
      LoadFromIni(FIniFile,'');
      FLoadForm:=true;
    end;
  end else begin
    DataSource.DataSet.EnableControls;
  end;
  CurValue.Free;
end;

procedure TfmEditSpr.acClrFilterExecute(Sender: TObject);
//var
//  lReopen : Boolean;
begin
//  DataSet.Filtered:=false;
//  DataSet.Filter  :='';
  if strNameFilter<>'' then begin
    strNameFilter:='';
    if RestFilterDataSet(DataSet, strFirstFilter) then begin
      FLoadForm:=false;
      LoadFromIni(FIniFile,'');
      FLoadForm:=true;
    end;
//    FAdsDataSet.Filter  :=strCurFilter;
//    FAdsDataSet.Filtered:=true;
  end;
  tbClr.Visible := false;
end;

function TfmEditSpr.GetDataSet: TDataSet;
begin
  Result := Grid.DataSource.DataSet;
end;

procedure TfmEditSpr.Spr_BeforePost(ds: TDataSet);
begin     
  if ds.State=dsInsert
    then FParamsEditSpr.OnBeforeSave(Grid,true,nil)
    else FParamsEditSpr.OnBeforeSave(Grid,false,nil);
end;

procedure TfmEditSpr.SetDataSet(const Value: TDataSet);
begin
  strNameFilter := '';
  strCurFilter  := '';
  if Value = nil then begin
    Grid.DataSource.DataSet.Filter:=strFirstFilter;
    RestFilterDataSet(Grid.DataSource.DataSet,strFirstFilter);
    Grid.DataSource.DataSet := nil;
    strFirstFilter := '';
  end else begin
    Grid.DataSource.DataSet := Value;
    strFirstFilter := Value.Filter; // GetFilterDataSet( Value );
    if Grid.ReadOnly then begin
      acDelete.Visible:=false;
      acDelete.Enabled:=false;
    end;
  end;
  if Grid.DataSource.DataSet<>nil then begin
    SetDateEditMask(Grid.DataSource.DataSet);
//
//    if (FParamsEditSpr<>nil) and Assigned(FParamsEditSpr.OnBeforeSave) then begin
//      Grid.DataSource.DataSet.BeforePost:=Spr_BeforePost;
//    end;
  end;
end;

procedure TfmEditSpr.acDeleteExecute(Sender: TObject);
var
  lDel : Boolean;
  sDel:String;
begin
  if (ParamsEditSpr<>nil) and (ParamsEditSpr.Quest_Delete<>'')
    then sDel:=ParamsEditSpr.Quest_Delete
    else sDel:='   Удалить текущую запись ?   ';
  if Problem(sDel,mtConfirmation,self) then begin
    lDel := true;
    if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnCheckEdit) then begin
      ParamsEditSpr.OnCheckEdit(Grid, lDel);
      if not lDel then begin
        raise EMyError.Create(FErrorEdit);
      end;
    end;
    if FOpisEdit<>nil then begin
      lDel:=FOpisEdit.CheckAllRI(RI_DELETE,'',true,false,self);
    end;
    if lDel then begin
      if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnBeforeDelete) then begin
        ParamsEditSpr.OnBeforeDelete(Grid, lDel);
      end;
      if lDel then begin
        Modify:=true;
        if EnableDetail then begin
          if FOpisEdit.DeleteDetailRecords then begin
            DataSource.DataSet.Delete;
          end;
        end else begin
          DataSource.DataSet.Delete;
        end;
        if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnAfterDelete) then begin
          ParamsEditSpr.OnAfterDelete(Grid, lDel);
        end;
      end;
    end;
  end;
end;

//-----------------------------------------------------------
procedure TfmEditSpr.SetEnableOperation;
var
  s : String;
begin
  if FEnableEdit then begin
    s := '';
    if (alopInsertEh in Grid.AllowedOperations) or
       (alopAppendEh in Grid.AllowedOperations) then begin
      acAdd.ShortCut := TextToShortCut('INS');
      acAdd.Visible := true;
      s := s + ' <Ins> Добавить  ';
    end else begin
      acAdd.ShortCut := TextToShortCut('');
      acAdd.Visible := false;
    end;
    if alopDeleteEh in Grid.AllowedOperations then begin
      acDelete.Visible := true;
      acDelete.ShortCut := TextToShortCut('Ctrl+Del');
      s := s + '<Ctrl-Del> Удалить  ';
    end else begin
      acDelete.ShortCut := TextToShortCut('');
      acDelete.Visible := false;
    end;
    if (alopUpdateEh in Grid.AllowedOperations) then begin
      acEdit.ShortCut := TextToShortCut('F2');
      acEdit.Visible := true;
      s := s + '<F2>  Корректировать  ';
    end else begin
      acEdit.ShortCut := TextToShortCut('');
      acEdit.Visible := false;
    end;
    if FEnableFind then begin
      s := s + ' <F4> Отбор';
    end else begin
      tbClr.ShortCut:=TextToShortCut('');
      tbClr.Visible:=false;
    end;
    if FEnablePrint then begin
      s := s + ' <F5> Печать';
    end else begin
      acPreView.ShortCut:=TextToShortCut('');
      acPreView.Visible:=false;
      TBItemExp.ShortCut:=TextToShortCut('');
      TBItemExp.Visible:=false;
    end;
    StBar.Panels[0].Text := s;
  end;
end;

procedure TfmEditSpr.SetEnableEdit(const Value: Boolean);
begin
  FEnableEdit := Value;
  if GlobalEditSpr.OnlyRead then begin
    FEnableEdit:=false;
  end;
  if FEnableEdit then begin
    acAdd.ShortCut := TextToShortCut('INS');
    acDelete.ShortCut := TextToShortCut('Ctrl+Del');
    acEdit.ShortCut := TextToShortCut('F2');
    Grid.ReadOnly := false;
//    StBar.Panels[0].Text := ' <Ins> Добавить  <Ctrl-Del> Удалить  <F2>  Корректировать  <F4> Отбор  <F5> Печать';
    SetEnableOperation;
  end else begin
    StBar.Panels[0].Text := ' <F4> Отбор   <F5> Печать';
    acAdd.ShortCut := TextToShortCut('');
    acDelete.ShortCut := TextToShortCut('');
    acEdit.ShortCut := TextToShortCut('');
    Grid.ReadOnly := true;
  end;
  if TBSubItemRun.Count>0
    then TBSubItemRun.Visible:=FEnableEdit
    else TBSubItemRun.Visible:=false;
  acAdd.Visible := FEnableEdit;
  acDelete.Visible := FEnableEdit;
  acEdit.Visible := FEnableEdit;
end;

procedure TfmEditSpr.SetEditOnlyCard(const Value: Boolean);
begin
  FEditOnlyCard := Value;
  if FEditOnlyCard then begin
    Grid.ReadOnly := true;
  end else begin
    Grid.ReadOnly := false;
  end;
end;

procedure TfmEditSpr.SetParamsEditSpr(const Value: TParamsEditSpr);
begin
  FParamsEditSpr := Value;
end;

procedure TfmEditSpr.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
 if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnGetCellParams) then begin
   ParamsEditSpr.OnGetCellParams(Sender,Column,AFont,Background,State);
 end;
 // еслм отметили ошибочный код для замены значения
 if (FErrorCode<>'') and (FOpisEdit<>nil) and (FOpisEdit.ResultField<>'') then begin
   if FErrorCode=DataSource.DataSet.FieldByName(FOpisEdit.ResultField).AsString
     then AFont.Color:=clRed; // !!!
 end;
end;

procedure TfmEditSpr.DataSourceDataChange(Sender: TObject; Field: TField);
var
  lAdd:Boolean;
begin
  if Field <> nil then begin
    Modify:=true;
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

procedure TfmEditSpr.TBItemExpClick(Sender: TObject);
begin
  if (GlobalEditSpr<>nil) and Assigned(GlobalEditSpr.OnExportSpr) then begin
    GlobalEditSpr.OnExportSpr(Self);
  end;
end;


procedure TfmEditSpr.SetModify(const Value: Boolean);
begin
  FModify := Value;
end;

procedure TfmEditSpr.SetEnableFind(const Value: Boolean);
begin
  FEnableFind := Value;
end;

procedure TfmEditSpr.SetEnablePrint(const Value: Boolean);
begin
  FEnablePrint := Value;
end;

procedure TfmEditSpr.DataSourceStateChange(Sender: TObject);
var
  lCheck:Boolean;
begin
  if not FRun then begin
    lCheck:=true;
//  label1.Caption:=GetEnumName(TypeInfo(TDataSetState), Ord(DataSource.State));
    if (ParamsEditSpr<>nil) and Assigned(ParamsEditSpr.OnCheckEdit) then begin
      ParamsEditSpr.OnCheckEdit(Grid, lCheck);
    end;
    if (DataSource.State=dsEdit) and not lCheck then   // запись запрещена к корректировке
      raise EMyError.Create(FErrorEdit);
  end;
end;

procedure TfmEditSpr.RecordUpDown(lUp:Boolean);
var
  CurOrder: Integer;
  CurMark: string;
  NewOrder: Integer;
  Field:TField;
begin
   if FOpisEdit.UpDownField='' then exit;
   Field:=DataSet.FindField(FOpisEdit.UpDownField);
   if Field<>nil then begin
     CurMark:=DataSet.Bookmark;
     CurOrder:=Field.AsInteger;
     if lUp
       then DataSet.Prior
       else DataSet.Next;
     NewOrder:=Field.AsInteger;
     if NewOrder<>CurOrder then begin
        DataSet.Edit;
        Field.AsInteger:=CurOrder;
        DataSet.Post;
        DataSet.Bookmark:=CurMark;
        DataSet.Edit;
        Field.AsInteger:=NewOrder;
        DataSet.Post;
     end else begin
       DataSet.Bookmark:=CurMark;
     end;
   end;
end;

procedure TfmEditSpr.TBItemDownClick(Sender: TObject);
begin
  if DataSource.State=dsBrowse then begin
    RecordUpDown(false);
  end;
end;

procedure TfmEditSpr.TBItemUpClick(Sender: TObject);
begin
  if DataSource.State=dsBrowse then begin
    RecordUpDown(true);
  end;
end;

end.
