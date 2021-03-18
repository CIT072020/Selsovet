unit fmQueryEx;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, AdsData, AdsFunc, AdsTable,
  {TB97Ctls, TB97, TB97Tlbr,}
  Grids, DBGridEh, ExtCtrls, StdCtrls,
  AdsUtils, SasaDbGrid, ImgList, ADSCNNCT,
  IniFiles, SasaIniFile, DbFunc, SynEditHighlighter, SynHighlighterSQL,
  SynEdit, Buttons, TB2Item, TB2Dock, TB2Toolbar, ShellApi,
  {$IFDEF ENABLE_EXPORT} mExport, fExpDS, {$ENDIF}
  OpisEdit, MetaTask, uTypes, fmQueryParamsEditor, fmQueryUserParamsEditor, FuncPr;

type
  TFormQuery = class(TForm)
    Panel1: TPanel;
    Splitter: TSplitter;
    Panel2: TPanel;
    Grid: TDBGridEh;
    Query: TAdsQuery;
    DataSource: TDataSource;
    OutPut: TMemo;
    ImageList: TImageList;
    pnSave: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    MemoSQL: TSynEdit;
    SynSQLSyn1: TSynSQLSyn;
    TBDock: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemRun: TTBItem;
    TBItemOpen: TTBItem;
    TBItemSave: TTBItem;
    TBItemExit: TTBItem;
    TBControlItem1: TTBControlItem;
    Lb: TLabel;
    TBItemHelp: TTBItem;
    TBItemExport: TTBItem;
    TBItemLastQuery: TTBItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRunClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure TBItemHelpClick(Sender: TObject);
    procedure TBItemExportClick(Sender: TObject);
    procedure TBItemLastQueryClick(Sender: TObject);
  private
    FRowsAffected : Integer;
    FParamScript: TParamADS;
    FPropertyAds : TPropertyAds;
    FListOpisEdit : TListOpisEdit;
    FCheckUserParams: Boolean;
    procedure SetParamScript(const Value: TParamADS);
    procedure GetParameters;
    procedure CheckUserParameters;
    procedure SetCheckUserParams(const Value: Boolean);
    { Private declarations }
  public
    {$IFDEF ENABLE_EXPORT}
      ExportColumns: TExportColumnList;
    {$ENDIF}
    property ParamScript : TParamADS read FParamScript write SetParamScript;
    property CheckUserParams : Boolean read FCheckUserParams write SetCheckUserParams;
    procedure CreateParams(var Params: TCreateParams); override;
    { Public declarations }
  end;

  function ExecuteFormQuery( PropADS : TPropertyAds;
                             IniFile : TCustomIniFile;
                             lShowSave : Boolean=false;
                             strCurQuery : String='') : String;
  procedure ShowFormQuery( PropADS : TPropertyAds;
                           IniFile : TCustomIniFile;
                           lShowSave : Boolean=false;
                           strCurQuery : String=''; lModal:Boolean=false; slTables:TStringList=nil);

var
  FormQuery: TFormQuery;

implementation

var
  strLastQuery: String;

{$R *.DFM}

function ExecuteFormQuery( PropADS : TPropertyAds;
                           IniFile : TCustomIniFile;
                           lShowSave : Boolean;
                           strCurQuery : String) : String;
var
  fQuery : TFormQuery;
begin
  fQuery := TFormQuery.Create(Application);
  with fQuery do begin
    if lShowSave then begin
      pnSave.Visible:=true;
      TBItemExit.Visible:=false;
    end else begin
      pnSave.Visible:=false;
      TBItemExit.Visible:=true;
    end;
    FPropertyAds := PropAds;
    if iniFile<>nil then begin
      FParamScript := ReadSysParams(IniFile,'SYS_PAR_QUERY');
      FParamScript.Connect := FPropertyAds.Connection;
    end else begin
      FParamScript.CancelError := true;
      FParamScript.TableType   := PropAds.TableType;
      FParamScript.CharType    := PropAds.AdsCharType;
      FParamScript.Exclusive   := false;
      FParamScript.CancelError := true;
      FParamScript.Connect     := FPropertyAds.Connection;
    end;
    Query.AdsTableOptions.AdsCharType := ParamScript.CharType;
    Query.SourceTableType := ParamScript.TableType;
    if FPropertyAds.Connection<>nil then
      Query.DatabaseName := FPropertyAds.Connection.Name;
    if strCurQuery<>'' then begin
      MemoSQL.Text:=strCurQuery;
    end;
  end;
  if fQuery.ShowModal=mrOk then begin
    Result := fQuery.MemoSQL.Text;
  end else begin
    Result := '';
  end;
end;

procedure ShowFormQuery( PropADS : TPropertyAds;
                           IniFile : TCustomIniFile;
                           lShowSave : Boolean;
                           strCurQuery : String; lModal:Boolean; slTables:TStringList);
begin
  if FormQuery=nil then begin
    FormQuery := TFormQuery.Create(Application.MainForm);
//    FormQuery.Parent := Application.MainForm;
    with FormQuery do begin
      if lShowSave then begin
        pnSave.Visible:=true;
        TBItemExit.Visible:=false;
      end else begin
        pnSave.Visible:=false;
        TBItemExit.Visible:=true;
      end;
      FPropertyAds := PropAds;
      FParamScript := ReadSysParams(IniFile,'SYS_PAR_QUERY');
      FParamScript.Connect := FPropertyAds.Connection;
      Query.AdsTableOptions.AdsCharType := ParamScript.CharType;
      Query.SourceTableType := ParamScript.TableType;
      Query.DatabaseName := FPropertyAds.Connection.Name;
      if strCurQuery<>'' then begin
        MemoSQL.Text:=strCurQuery;
      end;
    end;
    if slTables<>nil then begin
     FormQuery.SynSQLSyn1.TableNames.Assign(slTables);
    end;
    if lModal then begin
      FormQuery.ShowModal;
      FormQuery.Free;
      FormQuery:=nil;
    end else begin
      FormQuery.Show;
    end;
  end else begin
    if FormQuery.Visible=false then FormQuery.Visible:=true;
    FormQuery.BringToFront;
  end;
end;


procedure TFormQuery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Query.Active then begin
    Query.Active := false;
  end;
  Action := caFree;
end;

procedure TFormQuery.FormDestroy(Sender: TObject);
begin
  if Query.Active then begin
    Query.Active := false;
  end;
  FormQuery:=nil;
end;

procedure TFormQuery.CheckUserParameters;
begin
  if CharCount('&',Query.SQL.Text)>1 then begin
    with TfQueryUserParamsEditor.Create( nil ) do begin
      try
        Position := poOwnerFormCenter;
        InitUserValues( Query );
        ShowModal;
      finally
        free;
      end;
    end;
  end;
end;

procedure TFormQuery.GetParameters;
begin
   if ( Query.Params.Count > 0 ) then begin
     with TfQueryParamsEditor.Create( nil ) do begin
       try
         Position := poOwnerFormCenter;
         InitValues( Query );
         {
         InitValues( TComponent( poQuery ) );
         // form is written with D3, which has no OnChange event, so fire it this way
         lbParams.ItemIndex := 0;
         lbParamsClick( self );
         Caption := 'Ввод параметров запроса';
         }
         ShowModal;
       finally
         free;
       end;
     end;
   end;
end;

procedure TFormQuery.tbRunClick(Sender: TObject);
var
  old : TCursor;
  i : Integer;
  lErr:Boolean;
begin
  lb.Caption:='';
  if Length(Trim(MemoSQL.Lines.Text)) > 0 then begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Assign(MemoSQL.Lines);
    if FCheckUserParams then
      CheckUserParameters;
    GetParameters;
    old := Screen.Cursor;
    Screen.Cursor := crHourglass;
    try
      i := GetTickCount;
      Grid.Align     := alClient;;
      Grid.Visible   := true;
      OutPut.Visible := false;
      FRowsAffected  := -1;
      //---проверим &SHARED& и &LOCAL&-----------------------------------
      Query.SQL.Text := CheckBaseSQL(Query.SQL.Text, FPropertyAds);
      GlobalTask.WriteToLogFile(Query.SQL.Text, nil, LOG_SQL);
      //-----------------------------------------------------------------
      try
        OutPut.Lines.Text:='Выполнение...';
        lErr:=false;
        Query.Open;
        OutPut.Lines.Text:='Выполнено.';
//        Query.ExecSQL;
      except
        on E : Exception do begin
          if( Pos( 'The SQL statement did not generate a cursor handle.  Use TAdsQuery.ExecSQL to ' +
                  'execute SQL statements that are not SELECT statements', E.Message ) = 0 ) then begin
            lErr:=true;
            OutPut.Lines.Text:=E.Message;
          end else begin
            lErr:=true;
            OutPut.Lines.Text:='Выполнено.';
            FRowsAffected := Query.RowsAffected;
            if FRowsAffected>-1 then begin
              OutPut.Lines.Add('Обработано '+IntToStr(FRowsAffected)+' записей');
            end;
          end;
        end;
      end;
      if lErr then begin
        Grid.Visible   := false;
        OutPut.Align   := alClient;
        OutPut.Visible := true;
      end else begin
        strLastQuery:=MemoSQL.Text;
        Grid.Align     := alClient;;
        Grid.Visible   := true;
        OutPut.Visible := false;
        if FListOpisEdit<>nil then
           FListOpisEdit.SetKeyForm(Self,nil);
      end;
    finally
      Screen.Cursor := old;
    end;
    i := Integer(GetTickCount) - i;
    lb.Caption := '  Выролнялось '+FormatFloat('###0.###',i/1000)+' секунд';
//    lb.Caption := '  Выролнялось '+Format('%5d', [ i ]) +' тиков';
  end;
end;

procedure TFormQuery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if length(lb.caption)>0 then
    lb.Caption:='';
  case Key of
    VK_F2 : btSaveClick(Sender);
    VK_F3 : btOpenClick(Sender);
    VK_F9 : tbRunClick(Sender);
  end;
end;

procedure TFormQuery.SetParamScript(const Value: TParamADS);
begin
  FParamScript := Value;
end;

procedure TFormQuery.FormCreate(Sender: TObject);
begin
  Grid.Visible   := false;
  OutPut.Visible := false;
  FCheckUserParams := true;
  {$IFDEF ENABLE_EXPORT}
     TBItemExport.Visible:=true;
  {$ELSE}
     TBItemExport.Visible:=false;
  {$ENDIF}
end;

procedure TFormQuery.btOpenClick(Sender: TObject);
var
  Open : TOpenDialog;
  old  : string;
begin
  lb.Caption:='';
  old  := GetCurrentDir;
  Open := TOpenDialog.Create(self);
  Open.Filter := 'SQL-файлы *.sql|*.SQL';
  Open.InitialDir := ExtractFilePath(Application.ExeName)+'SQL';
  if Open.Execute then begin
    try
      if FileExists(Open.FileName) then begin
        MemoSQL.Lines.Clear;
        MemoSQL.Lines.LoadFromFile(Open.FileName);
      end;
    except
      SetCurrentDir(old);
    end;
  end;
  SetCurrentDir(old);
end;

procedure TFormQuery.btSaveClick(Sender: TObject);
var
  Save : TSaveDialog;
  old  : string;
begin
  lb.Caption:='';
  old  := GetCurrentDir;
  Save := TSaveDialog.Create(self);
  Save.Filter := 'SQL-файлы *.sql|*.SQL';
  Save.InitialDir := ExtractFilePath(Application.ExeName)+'SQL';
  if Save.Execute then begin
    try
      if Pos('.',Save.FileName) = 0 then begin
        Save.FileName := Save.FileName + '.SQL';
      end;
      MemoSQL.Lines.SaveToFile(Save.FileName);
    except
      SetCurrentDir(old);
    end;
  end;
  SetCurrentDir(old);
end;

procedure TFormQuery.btExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormQuery.TBItemHelpClick(Sender: TObject);
begin
  ShellExecute(0, 'Open', PChar('Advantage.hlp'), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormQuery.SetCheckUserParams(const Value: Boolean);
begin
  FCheckUserParams := Value;
end;

procedure TFormQuery.TBItemExportClick(Sender: TObject);
begin
//
{$IFDEF ENABLE_EXPORT}
  ExportColumns := TExportColumnList.Create;
  try
    FillColumnList2(Grid, ExportColumns);
//    ExportColumns.HideAll;
    ExportDataSet('Экспорт', Query, efRtf, [], GetFolderMyDocument, True, True, ExportColumns);
  finally
    FreeAndNil(ExportColumns);
  end;
{$ENDIF}
end;

procedure TFormQuery.TBItemLastQueryClick(Sender: TObject);
begin
  if strLastQuery<>'' then
    MemoSQL.Lines.Text:=strLastQuery;
end;

procedure TFormQuery.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
//  Params.ExStyle := Params.ExStyle or WS_EX_TRANSPARENT;
end;

initialization
  FormQuery:=nil;
  strLastQuery:='';
end.
