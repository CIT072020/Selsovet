unit fSeekBase;

{$I DELPHIAREA.INC}

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Metatask, uProjectAll,
  Menus, StdCtrls, ExtCtrls, ComCtrls, FindFile, ImgList, adscnnct, DB, FuncPr, fShowPokaz,
  adsdata, adsfunc, adstable, TB2Item, TB2Dock, TB2Toolbar, Mask, DBCtrlsEh;

type

  TfmSeekBase = class(TForm)
    FindFile: TFindFile;
    FoundFiles: TListView;
    StatusBar: TStatusBar;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Attributes: TGroupBox;
    TabSheet3: TTabSheet;
    FileSize: TGroupBox;
    SizeMaxEdit: TEdit;
    SizeMinEdit: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    SizeMin: TUpDown;
    SizeMax: TUpDown;
    System: TCheckBox;
    Hidden: TCheckBox;
    Readonly: TCheckBox;
    Archive: TCheckBox;
    Directory: TCheckBox;
    Compressed: TCheckBox;
    Encrypted: TCheckBox;
    Offline: TCheckBox;
    SparseFile: TCheckBox;
    ReparsePoint: TCheckBox;
    Temporary: TCheckBox;
    Device: TCheckBox;
    Normal: TCheckBox;
    NotContentIndexed: TCheckBox;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    CreatedBeforeDate: TDateTimePicker;
    CreatedAfterDate: TDateTimePicker;
    CreatedBeforeTime: TDateTimePicker;
    CreatedAfterTime: TDateTimePicker;
    CBD: TCheckBox;
    CBT: TCheckBox;
    CAD: TCheckBox;
    CAT: TCheckBox;
    ModifiedBeforeDate: TDateTimePicker;
    ModifiedAfterDate: TDateTimePicker;
    ModifiedBeforeTime: TDateTimePicker;
    ModifiedAfterTime: TDateTimePicker;
    MBD: TCheckBox;
    MBT: TCheckBox;
    MAD: TCheckBox;
    MAT: TCheckBox;
    AccessedBeforeDate: TDateTimePicker;
    AccessedAfterDate: TDateTimePicker;
    AccessedBeforeTime: TDateTimePicker;
    AccessedAfterTime: TDateTimePicker;
    ABD: TCheckBox;
    ABT: TCheckBox;
    AAD: TCheckBox;
    AAT: TCheckBox;
    PopupMenu: TPopupMenu;
    OpenFileItem: TMenuItem;
    OpenFileLocationItem: TMenuItem;
    Virtual: TCheckBox;
    ProgressImageTimer: TTimer;
    ProgressImages: TImageList;
    SizeMinUnit: TComboBox;
    SizeMaxUnit: TComboBox;
    TabSheet7: TTabSheet;
    Filters: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Connection: TAdsConnection;
    Query: TAdsQuery;
    Panel1: TPanel;
    Threaded: TCheckBox;
    Label2: TLabel;
    edDisk: TComboBox;
    GroupBox1: TGroupBox;
    cbAutoBackup: TCheckBox;
    cbBackup: TCheckBox;
    ProgressImagePanel: TPanel;
    ProgressImage: TImage;
    ImageList1: TImageList;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    FindButton: TTBItem;
    StopButton: TTBItem;
    InfoButton: TTBItem;
    LoadButton: TTBItem;
    ExitButton: TTBItem;
    Label1: TLabel;
    edMaxLevel: TDBNumberEditEh;
    procedure FindButton1Click(Sender: TObject);
    procedure StopButton1Click(Sender: TObject);
    procedure FindFileFolderChange(Sender: TObject; const Folder: String;
      var IgnoreFolder: TFolderIgnore);
    procedure FindFileFileMatch(Sender: TObject; const FileInfo: TFileDetails);
    procedure FoundFilesColumnClick(Sender: TObject; Column: TListColumn);
    procedure FoundFilesCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure FindFileSearchFinish(Sender: TObject);
    procedure FoundFilesDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBDClick(Sender: TObject);
    procedure CBTClick(Sender: TObject);
    procedure CADClick(Sender: TObject);
    procedure CATClick(Sender: TObject);
    procedure MBDClick(Sender: TObject);
    procedure MBTClick(Sender: TObject);
    procedure MADClick(Sender: TObject);
    procedure MATClick(Sender: TObject);
    procedure ABDClick(Sender: TObject);
    procedure ABTClick(Sender: TObject);
    procedure AADClick(Sender: TObject);
    procedure AATClick(Sender: TObject);
    procedure FindFileSearchBegin(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OpenFileItemClick(Sender: TObject);
    procedure OpenFileLocationItemClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure ProgressImageTimerTimer(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure LoadButtonClick(Sender: TObject);
    procedure InfoButtonClick(Sender: TObject);
  private
    Folders: Integer;
    StartTime: DWord;
    SortedColumn: Integer;
    Descending: Boolean;
    FMainConnection: TAdsConnection;
    FRunDataProcess: TNotifyEvent;
    procedure SetMainConnection(const Value: TAdsConnection);
    procedure CreateListDisk;
    procedure SetRunDataProcess(const Value: TNotifyEvent);
  public
    Password : String;
    UserName : String;
    BaseName : String;
    ResultParams:Boolean;
    ResultPath:String;
    property RunDataProcess : TNotifyEvent read FRunDataProcess write SetRunDataProcess;
    property MainConnection : TAdsConnection read FMainConnection write SetMainConnection;
    procedure GetPokazBase(sl:TstringList; Conn:TAdsConnection; q:TAdsQuery);
    procedure ShowPokazBase(sl:TStringList);
  end;

var
  fmSeekBase: TfmSeekBase;

implementation

{$R *.DFM}

uses
//  {$IFDEF COMPILER7_UP} XPMan, {$ENDIF} 
  ShellAPI;

function GetAttributeStatus(CB: TCheckBox): TFileAttributeStatus;
begin
  case CB.State of
    cbUnchecked: Result := fsUnset;
    cbChecked: Result := fsSet;
  else
    Result := fsIgnore;
  end;
end;

procedure TfmSeekBase.FindButton1Click(Sender: TObject);
var
  s :String;
begin
  // Sets FileFile properties
  FindFile.Threaded := Threaded.Checked;
  // - Name & Location
  with FindFile.Criteria.Files do
  begin
    FileName := BaseName;
//    FileName := '';
//    Filters.Add('>*.add');
    Location := Copy(edDisk.Items.Strings[edDisk.ItemIndex],1,1)+':\'; // Self.Location.Text;
    Subfolders := true; //Subfolders.Checked;
    try
      MaxLevel:=edMaxLevel.Value;
    except
      edMaxLevel.Value:=0;
      MaxLevel:=0;
    end;
    Filters.Clear;
    Filters.Add('*\Newdata\*');
    if cbAutoBackup.Checked then begin
      Filters.Add('*\AutoBackup\*');
      Filters.Add('*\AutoBackup2\*');
    end;
    s:=ExtractFilePath(Application.ExeName);
    if cbBackup.Checked then begin
      Filters.Add('*\Backup\*');
      Filters.Add(s+'Backup\*');
    end;
    Filters.Add(s+'AutoBackup\*');
    Filters.Add(s+'AutoBackup2\*');
    Filters.Add(s+'Data\*');

    //Filters.Assign(Self.Filters.Lines);
  end;
  // - Containing Text
  with FindFile.Criteria.Content do
  begin
    Phrase := ''; //Self.Phrase.Text;
    Options := [];
    {
    if Self.CaseSenstitive.Checked then
      Options := Options + [csoCaseSensitive];
    if Self.WholeWord.Checked then
      Options := Options + [csoWholeWord];
    }
  end;
  // - Attributes
  with FindFile.Criteria.Attributes do
  begin
    Archive := GetAttributeStatus(Self.Archive);
    Readonly := GetAttributeStatus(Self.Readonly);
    Hidden := GetAttributeStatus(Self.Hidden);
    System := GetAttributeStatus(Self.System);
    Directory := GetAttributeStatus(Self.Directory);
    Compressed := GetAttributeStatus(Self.Compressed);
    Encrypted := GetAttributeStatus(Self.Encrypted);
    Offline := GetAttributeStatus(Self.Offline);
    ReparsePoint := GetAttributeStatus(Self.ReparsePoint);
    SparseFile := GetAttributeStatus(Self.SparseFile);
    Temporary := GetAttributeStatus(Self.Temporary);
    Device := GetAttributeStatus(Self.Device);
    Normal := GetAttributeStatus(Self.Normal);
    Virtual := GetAttributeStatus(Self.Virtual);
    NotContentIndexed := GetAttributeStatus(Self.NotContentIndexed);
  end;
  // - Size ranges
  with FindFile.Criteria.Size do
  begin
    Min := Self.SizeMin.Position;
    case Self.SizeMinUnit.ItemIndex of
      1: Min := Min * 1024;
      2: Min := Min * 1024 * 1024;
      3: Min := Min * 1024 * 1024 * 1024;
    end;
    Max := Self.SizeMax.Position;
    case Self.SizeMaxUnit.ItemIndex of
      1: Max := Max * 1024;
      2: Max := Max * 1024 * 1024;
      3: Max := Max * 1024 * 1024 * 1024;
    end;
  end;
  // - TimeStamp ranges
  with FindFile.Criteria.TimeStamp do
  begin
    Clear;
    // Created on
    if Self.CBD.Checked then
      CreatedBefore := Self.CreatedBeforeDate.Date;
    if Self.CBT.Checked then
      CreatedBefore := CreatedBefore + Self.CreatedBeforeTime.Time;
    if Self.CAD.Checked then
      CreatedAfter := Self.CreatedAfterDate.Date;
    if Self.CAT.Checked then
      CreatedAfter := CreatedAfter + Self.CreatedAfterTime.Time;
    // Modified on
    if Self.MBD.Checked then
      ModifiedBefore := Self.ModifiedBeforeDate.Date;
    if Self.MBT.Checked then
      ModifiedBefore := ModifiedBefore + Self.ModifiedBeforeTime.Time;
    if Self.MAD.Checked then
      ModifiedAfter := Self.ModifiedAfterDate.Date;
    if Self.MAT.Checked then
      ModifiedAfter := ModifiedAfter + Self.ModifiedAfterTime.Time;
    // Accessed on
    if Self.ABD.Checked then
      AccessedBefore := Self.AccessedBeforeDate.Date;
    if Self.ABT.Checked then
      AccessedBefore := AccessedBefore + Self.AccessedBeforeTime.Time;
    if Self.AAD.Checked then
      AccessedAfter := Self.AccessedAfterDate.Date;
    if Self.AAT.Checked then
      AccessedAfter := AccessedAfter + Self.AccessedAfterTime.Time;
  end;
  // Begins search
  FindFile.Execute;
end;

procedure TfmSeekBase.StopButton1Click(Sender: TObject);
begin
  FindFile.Abort;
  StatusBar.SimpleText := 'Окончание поиска, подождите пожалуйста...';
end;

procedure TfmSeekBase.FindFileSearchBegin(Sender: TObject);
begin
  Folders := 0;
  SortedColumn := -1;
  FoundFiles.SortType := stNone;
  FoundFiles.Items.BeginUpdate;
  FoundFiles.Items.Clear;
  FoundFiles.Items.EndUpdate;
  FindButton.Enabled := False;
  InfoButton.Enabled:=false;
  LoadButton.Enabled:=false;
  ExitButton.Enabled:=false;

  StopButton.Enabled := True;
  Threaded.Enabled := False;
  ProgressImagePanel.Visible := True;
  ProgressImageTimer.Enabled := True;
  StartTime := GetTickCount;
end;

procedure TfmSeekBase.ExitButtonClick(Sender: TObject);
begin
  Modalresult:=mrCancel;
  Close;
end;

procedure TfmSeekBase.LoadButtonClick(Sender: TObject);
begin
  if not FindFile.Busy then begin
    if (FoundFiles.Selected<>nil) then begin
      ResultPath:=FoundFiles.Selected.Caption;
      if ANSIUpperCase(FoundFiles.Selected.SubItems[1])='НЕТ' then begin
        ResultParams:=false;
      end else begin
        ResultParams:=true;
      end;
      Modalresult:=mrOk;
    end;
  end;
end;


procedure TfmSeekBase.GetPokazBase(sl:TstringList; Conn:TAdsConnection; q:TAdsQuery);
var
  n:Integer;
  sr:TSearchRec;
  sFileArxiv:String;
begin
  sFileArxiv:='';
  if FindFirst(ExtractFilePath(Conn.ConnectPath)+'data_*.zip', faAnyFile, sr)=0 then begin
    sFileArxiv:=sr.Name;
    FindClose(sr);
  end;
  if sFileArxiv<>'' then begin
    sl.Add('Архив базы данных=');
    exit;
  end;
  {$IFDEF OPEKA}
      try
        q.SQL.Text :='Select Max(datez), Count(*) from AktOpek';
        q.Open;
        if q.Fields[1].AsInteger=0 then begin
          sl.Add('Информация об опеке отсутствует=');
        end else begin
          sl.Add('Последняя опека='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
          sl.Add('Количество записей об опеке='+IntToStr(q.Fields[1].AsInteger));
        end;
        q.Close;
        Application.ProcessMessages;
      except
        sl.Add('Ошибка обращения к базе опеки=');
      end;

  {$ELSE}
  {$IFDEF POST}
      try
        q.SQL.Text :='Select Max(datepost), Count(*) from SMDOPost';
        q.Open;
        if q.Fields[1].AsInteger=0 then begin
          sl.Add('Почта СМДО отсутствует=');
        end else begin
          sl.Add('Последнее сообщение СМДО='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
          sl.Add('Количество сообщений в почте СМДО='+q.Fields[1].AsString);
        end;
        q.Close;
        Application.ProcessMessages;
      except
        sl.Add('Ошибка обращения к почте СМДО=');
      end;

      try
        q.SQL.Text :='Select top 1 reg_date from DocMain order by reg_date desc';
        q.Open;
        if q.Eof or (FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime)='30.12.1899') then begin
          sl.Add('Учет документов отсутствует=');
          n:=0;
        end else begin
          sl.Add('Последняя запись в учете документов='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
          n:=1;
        end;
        q.Close;
        Application.ProcessMessages;
        if n=1 then begin
          q.SQL.Text :='Select count(*) from DocMain';
          q.Open;
          sl.Add('Количество записей в учете документов='+q.Fields[0].AsString);
          q.Close;
          Application.ProcessMessages;
        end;
      except
        sl.Add('Ошибка обращения к учету документов=');
      end;

  {$ELSE}

    {$IFDEF ZAH}
      try
        q.SQL.Text :='Select Max(datez), Count(*) from AktZ';
        q.Open;
        if q.Fields[1].AsInteger=0 then begin
          sl.Add('Информация о захоронениях отсутствует=');
        end else begin
          sl.Add('Последняя запись о захоронении='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
          sl.Add('Количество записей о захоронениях='+IntToStr(q.Fields[1].AsInteger));
        end;
        q.Close;
        Application.ProcessMessages;
      except
        sl.Add('Ошибка обращения к базе захоронений=');
      end;

    {$ELSE}


    {$IFDEF ZAGS}

    {$ELSE}
  //---------------------------------------------------------------------------------
      {$IFDEF OCHERED}
        try
          q.SQL.Text :='Select count(*) from ochered where ochered_id=0 and id_base=0';
          q.Open;
          sl.Add('Количество в общей очереди='+q.Fields[0].AsString);
          q.Close;
          Application.ProcessMessages;
        except
          sl.Add('Ошибка обращения к таблице очередь');
        end;
        try
          q.SQL.Text :='Select max(dec_date) from ochered where id_base=0';
          q.Open;
          if q.Fields[0].IsNull
            then sl.Add('Последнее заявление=нет')
            else sl.Add('Последнее заявление='+DatePropis(q.Fields[0].AsDateTime,3));
          q.Close;
          Application.ProcessMessages;
        except
          sl.Add('Ошибка обращения к таблице очередь');
        end;
        try
          q.SQL.Text :='Select max(dater) from ocheredResh';
          q.Open;
          if q.Fields[0].IsNull
            then sl.Add('Последнее решение=нет')
            else sl.Add('Последнее решение='+DatePropis(q.Fields[0].AsDateTime,3));
          q.Close;
          Application.ProcessMessages;
        except
          sl.Add('Ошибка обращения к таблице очередь');
        end;

      {$ELSE}
        try
          q.SQL.Text :='Select count(*) from Население where date_fiks='+'''1899-12-30''';
          q.Open;
          sl.Add('Количество людей='+q.Fields[0].AsString);
          q.Close;
          Application.ProcessMessages;
        except
          sl.Add('Ошибка обращения к таблице лицевых счетов=');
        end;
        //---------------------------------------------------------------------------------
        try
          q.SQL.Text :='Select count(*) from ЛицевыеСчета where date_fiks='+'''1899-12-30''';
          q.Open;
          sl.Add('Лицевых счетов='+q.Fields[0].AsString);
          q.Close;
          Application.ProcessMessages;
        except
          sl.Add('Ошибка обращения к таблице населения=');
        end;
        //---------------------------------------------------------------------------------
        try
          q.SQL.Text :='Select Max(date_add) from СозданиеОбъекта where typeobj=3';
          q.Open;
          if q.Eof or (FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime)='30.12.1899') then begin

          end else begin
            sl.Add('Человек добавлялся в базу='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
          end;
          q.Close;
          Application.ProcessMessages;
        except
        end;
      {$ENDIF}
    {$ENDIF}

    //---------------------------------------------------------------------------------
    {$IFNDEF OCHERED}
    try
      q.SQL.Text :='Select Max(datez) from АктыСмертей';
      q.Open;
      if q.Eof or (FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime)='30.12.1899') then begin
        sl.Add('Актовые записи о смерти отсутствуют=');
      end else begin
        sl.Add('Последняя актовая запись о смерти='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
      end;
      q.Close;
      Application.ProcessMessages;
    except
      sl.Add('Ошибка обращения к актам о смерти=');
    end;
    //---------------------------------------------------------------------------------
    try
      q.SQL.Text :='Select Max(datez) from АктыРождений';
      q.Open;
      if q.Eof or (FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime)='30.12.1899') then begin
        sl.Add('Актовые записи о рождении отсутствуют=');
      end else begin
        sl.Add('Последняя актовая запись о рождении='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
      end;
      q.Close;
      Application.ProcessMessages;
    except
      sl.Add('Ошибка обращения к актам о рождении=');
    end;
    //---------------------------------------------------------------------------------
    try
      q.SQL.Text :='Select Max(datez) from ЗаключениеБраков';
      q.Open;
      if q.Eof or (FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime)='30.12.1899') then begin
        sl.Add('Актовые записи о браке отсутствуют=');
      end else begin
        sl.Add('Последняя актовая запись о браке='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
      end;
      q.Close;
      Application.ProcessMessages;
    except
      sl.Add('Ошибка обращения к актам о браке=');
    end;
    {$ENDIF}

    {$IFDEF SMDO}
      try
        q.SQL.Text :='Select Max(datepost), Count(*) from SMDOPost';
        q.Open;
        if q.Fields[1].AsInteger=0 then begin
          sl.Add('Почта СМДО отсутствует=');
        end else begin
          sl.Add('Последнее сообщение СМДО='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
          sl.Add('Количество сообщений в почте СМДО='+q.Fields[1].AsString);
        end;
        q.Close;
      except
        sl.Add('Ошибка обращения к почте СМДО=');
      end;

      try
        q.SQL.Text :='Select top 1 reg_date from DocMain order by reg_date desc';
        q.Open;
        if q.Eof or (FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime)='30.12.1899') then begin
          sl.Add('Учет документов отсутствует=');
          n:=0;
        end else begin
          sl.Add('Последняя запись в учете документов='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
          n:=1;
        end;
        q.Close;
        Application.ProcessMessages;
        if n=1 then begin
          q.SQL.Text :='Select count(*) from DocMain';
          q.Open;
          sl.Add('Количество записей в учете документов='+q.Fields[0].AsString);
          q.Close;
          Application.ProcessMessages;
        end;
      except
        sl.Add('Ошибка обращения к учету документов=');
      end;

    {$ENDIF}

    {$IFDEF ZAGS}
    //---------------------------------------------------------------------------------
    try
      q.SQL.Text :='Select Max(datez) from AktChangeName';
      q.Open;
      if q.Eof or (FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime)='30.12.1899') then begin
        sl.Add('Актовые записи о перемене имени отсутствуют=');
      end else begin
        sl.Add('Последняя актовая запись о перемене имени='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
      end;
      q.Close;
      Application.ProcessMessages;
    except
      sl.Add('Ошибка обращения к актам о перемене имени=');
    end;
    //---------------------------------------------------------------------------------
    try
      q.SQL.Text :='Select Max(datez) from AktAdopt';
      q.Open;
      if q.Eof or (FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime)='30.12.1899') then begin
        sl.Add('Актовые записи об усыновлении отсутствуют=');
      end else begin
        sl.Add('Последняя актовая запись об усыновлении='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
      end;
      q.Close;
      Application.ProcessMessages;
    except
      sl.Add('Ошибка обращения к актам об усыновлении=');
    end;
    //---------------------------------------------------------------------------------
    try
      q.SQL.Text :='Select Max(datez) from АктыУстОтцовства';
      q.Open;
      if q.Eof or (FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime)='30.12.1899') then begin
        sl.Add('Актовые записи об установлении отцовства отсутствуют=');
      end else begin
        sl.Add('Последняя актовая запись об установлении отцовства='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
      end;
      q.Close;
      Application.ProcessMessages;
    except
      sl.Add('Ошибка обращения к актам об установлении отцовства=');
    end;
    //---------------------------------------------------------------------------------
    try
      q.SQL.Text :='Select Max(datez) from АктыУстМатеринства';
      q.Open;
      if q.Eof or (FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime)='30.12.1899') then begin
        sl.Add('Актовые записи об установлении материнства отсутствуют=');
      end else begin
        sl.Add('Последняя актовая запись об установлении материнства='+FormatDateTime('dd.mm.yyyy',q.Fields[0].AsDateTime));
      end;
      q.Close;
      Application.ProcessMessages;
    except
      sl.Add('Ошибка обращения к актам об установлении материнства=');
    end;

    {$ENDIF}

    {$ENDIF}

  {$ENDIF}
  {$ENDIF}

  Application.ProcessMessages;
end;

procedure TfmSeekBase.ShowPokazBase(sl:TstringList);
var
  f:TfmShowPokaz;
  i:Integer;
begin
  f:=TfmShowPokaz.Create(nil);
  for i:=0 to sl.count-1 do begin
    with f.ListPokaz.Items.Add do
    begin
      Caption := sl.Names[i];
      SubItems.Add(sl.ValueFromIndex[i]);
    end;
  end;
  f.ShowModal;
  f.Free;
end;

procedure TfmSeekBase.InfoButtonClick(Sender: TObject);
var
  sl:TStringList;
  lOk:Boolean;
begin
  if not FindFile.Busy then begin
    if FoundFiles.Selected <> nil then begin
      ProgressImagePanel.Visible := True;
      ProgressImageTimer.Enabled := True;

      sl:=TStringList.Create;
      lOk:=true;
      try
        Connection.IsConnected:=false;
        Connection.ConnectPath:=FoundFiles.Selected.Caption+BaseName;
        Connection.IsConnected:=true;
      except
        lOk:=false;
        PutError('Ошибка подключения к базе.');
      end;
//---------------------------------------------------------------------------------
      if lOk then begin
        GetPokazBase(sl,Connection,Query);
        ProgressImagePanel.Visible := False;
        ProgressImageTimer.Enabled := false;
        Application.ProcessMessages;

        ShowPokazBase(sl);
        {
        s:='';
        for i:=0 to sl.Count-1 do begin
          s:=s+sl.Strings[i]+#13#10;
        end;
        ShowMessage(s);
        }
      end;
      sl.Free;
    end;
  end;
end;

procedure TfmSeekBase.FindFileSearchFinish(Sender: TObject);
begin
  StatusBar.SimpleText := Format('папок просмотрено: %d, найдено баз: %d    %.3f секунд',
    [Folders, FoundFiles.Items.Count, (GetTickCount - StartTime) / 1000]);
  if FindFile.Aborted then
    StatusBar.SimpleText := 'Поиск остановлен - ' + StatusBar.SimpleText;
  ProgressImageTimer.Enabled := False;
  ProgressImagePanel.Visible := False;
  Threaded.Enabled := True;
  StopButton.Enabled := False;
  FindButton.Enabled := True;
  InfoButton.Enabled:=True;
  LoadButton.Enabled:=True;
  ExitButton.Enabled:=True;

end;

procedure TfmSeekBase.FindFileFolderChange(Sender: TObject; const Folder: String;
  var IgnoreFolder: TFolderIgnore);
begin
  Inc(Folders);
  StatusBar.SimpleText := Folder;
  if not FindFile.Threaded then
    Application.ProcessMessages;
end;

procedure TfmSeekBase.FindFileFileMatch(Sender: TObject; const FileInfo: TFileDetails);
var
  strDir:String;
  i:Integer;
  lErr:Boolean;
begin
  with FoundFiles.Items.Add do
  begin
    Caption := FileInfo.Location; //FileInfo.Name;
//    SubItems.Add(FileInfo.Location);
//    if LongBool(FileInfo.Attributes and FILE_ATTRIBUTE_DIRECTORY) then begin
//      SubItems.Add('Folder')
//    end else begin
//      SubItems.Add(FormatFileSize(FileInfo.Size));
//    end;
//    SubItems.Add(DateTimeToStr(FileInfo.ModifiedTime));
    lErr:=false;
    try
      Connection.IsConnected:=false;
      Connection.ConnectPath:=FileInfo.Location+FileInfo.Name;
      Connection.IsConnected:=true;
    except
      lErr:=true;
    end;
    strDir:='';
    if lErr then begin
      SubItems.Add('Ошибка');
    end else begin
      Query.SQL.Text :='Select * from '+SysQuery('system.dictionary');
      Query.Open;
      SubItems.Add(PadlStr(Query.FieldByName('Version_Major').AsString+'.'+Query.FieldByName('Version_Minor').AsString,6,' '));
      Query.Close;
      Connection.IsConnected:=false;
      if Right(ANSIUpperCase(FileInfo.Location),13)='\КОПИЯДАННЫХ\' then begin
        i := Pos('\КОПИЯДАННЫХ\', ANSIUpperCase(FileInfo.Location));
        strDir := Copy(FileInfo.Location,1,i) + 'КопияСервис\';
      end else begin
        strDir:=Copy(FileInfo.Location,1,Length(FileInfo.Location)-1);
        i:=LastPos('\',strDir);
        if i>0 then begin
          strDir := Copy(strDir,1,i)+'Service\';
        end else begin
          strDir:='';
        end;
      end;
    end;
    if strDir<>'' then begin
      if not FileExists(strDir+Globaltask.NameFileTaskParameters) then begin
        strDir:='';
      end;
    end;
    if strDir='' then SubItems.Add('Нет') else SubItems.Add('Да');
  end;
  if not FindFile.Threaded then
    Application.ProcessMessages;
end;

procedure TfmSeekBase.CreateListDisk;
  var
  c : Char;
  d : DWORD;
  s : String;
  n,m : Integer;
begin
  d := GetLogicalDrives;
  edDisk.Items.Clear;
//  edDisk.KeyItems.Clear;
  m:=0;
  for c:='A' to 'Z' do begin
    if (d and 1)<>0 then begin
      n := GetDriveType(PChar(c + ':/'));
      s:=c;
      if (n=DRIVE_REMOVABLE) or (n=DRIVE_FIXED) then begin
//DRIVE_REMOVABLE – 2 : тип устройства определяется как съемный (дискета, флешка и т.д.)
//DRIVE_FIXED – 3 : тип устройства – фиксированный диск (жесткий диск)
//DRIVE_REMOTE – 4 : тип устройства – удаленный(сетевой) диск
//DRIVE_CDROM – 5 : это устройство CD-ROM
        case n of
          DRIVE_REMOVABLE:s:=s+':  съемный';
          DRIVE_CDROM:s:=s;
         DRIVE_FIXED:s:=s+':';
         end;
        edDisk.Items.Add(s);
        if (n=DRIVE_FIXED) and (m=0) then m:=edDisk.Items.Count-1;
      end;
    end;
    d := d shr 1;
  end;
  if edDisk.Items.Count > 0 then begin

  end else begin
    edDisk.Enabled := false;
  end;
  edDisk.ItemIndex:=m;
end;

procedure TfmSeekBase.FoundFilesColumnClick(Sender: TObject; Column: TListColumn);
begin
  if not FindFile.Busy then
  begin
    TListView(Sender).SortType := stNone;
    if Column.Index <> SortedColumn then
    begin
      SortedColumn := Column.Index;
      Descending := False;
    end
    else
      Descending := not Descending;
    TListView(Sender).SortType := stText;
  end
  else
    MessageDlg('Невозможно отсортировать пока идет поиск.', mtWarning, [mbOK], 0);
end;

procedure TfmSeekBase.FoundFilesCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else if SortedColumn > 0 then
    Compare := CompareText(Item1.SubItems[SortedColumn-1],
                           Item2.SubItems[SortedColumn-1]);
  if Descending then Compare := -Compare;
end;

procedure TfmSeekBase.FoundFilesDblClick(Sender: TObject);
begin
  OpenFileItemClick(nil);
end;

procedure TfmSeekBase.OpenFileItemClick(Sender: TObject);
begin
  if FoundFiles.Selected <> nil then
    with FoundFiles.Selected do
      ShellExecute(0, 'Open', PChar(BaseName), nil, PChar(Caption), SW_NORMAL);
end;

procedure TfmSeekBase.OpenFileLocationItemClick(Sender: TObject);
var
  Param: String;
begin
  if FoundFiles.Selected <> nil then
  begin
    with FoundFiles.Selected do
      Param := Format('/n,/select,"%s%s"', [Caption, BaseName]);
    ShellExecute(0, 'Open', 'explorer.exe', PChar(Param), nil, SW_NORMAL);
  end;
end;

procedure TfmSeekBase.PopupMenuPopup(Sender: TObject);
begin
  OpenFileItem.Enabled := (FoundFiles.Selected <> nil);
  OpenFileLocationItem.Enabled := (FoundFiles.Selected <> nil);
end;

procedure TfmSeekBase.FormCreate(Sender: TObject);
begin
  CreateListDisk;
  CreatedBeforeDate.Date := Date;
  CreatedBeforeDate.Time := 0;
  CreatedAfterDate.Date := Date;
  CreatedAfterDate.Time := 0;
  CreatedBeforeTime.Time := Time;
  CreatedBeforeTime.Date := 0;
  CreatedAfterTime.Time := Time;
  CreatedAfterTime.Date := 0;
  ModifiedBeforeDate.Date := Date;
  ModifiedBeforeDate.Time := 0;
  ModifiedAfterDate.Date := Date;
  ModifiedAfterDate.Time := 0;
  ModifiedBeforeTime.Time := Time;
  ModifiedBeforeTime.Date := 0;
  ModifiedAfterTime.Time := Time;
  ModifiedAfterTime.Date := 0;
  AccessedBeforeDate.Date := Date;
  AccessedBeforeDate.Time := 0;
  AccessedAfterDate.Date := Date;
  AccessedAfterDate.Time := 0;
  AccessedBeforeTime.Time := Time;
  AccessedBeforeTime.Date := 0;
  AccessedAfterTime.Time := Time;
  AccessedAfterTime.Date := 0;
  {$IFDEF COMPILER4_UP}
  ProgressImagePanel.DoubleBuffered := True;
  {$ENDIF}
  ProgressImages.GetBitmap(0, ProgressImage.Picture.Bitmap);
end;

procedure TfmSeekBase.CBDClick(Sender: TObject);
begin
  CreatedBeforeDate.Enabled := CBD.Checked;
end;

procedure TfmSeekBase.CBTClick(Sender: TObject);
begin
  CreatedBeforeTime.Enabled := CBT.Checked;
end;

procedure TfmSeekBase.CADClick(Sender: TObject);
begin
  CreatedAfterDate.Enabled := CAD.Checked;
end;

procedure TfmSeekBase.CATClick(Sender: TObject);
begin
  CreatedAfterTime.Enabled := CAT.Checked;
end;

procedure TfmSeekBase.MBDClick(Sender: TObject);
begin
  ModifiedBeforeDate.Enabled := MBD.Checked;
end;

procedure TfmSeekBase.MBTClick(Sender: TObject);
begin
  ModifiedBeforeTime.Enabled := MBT.Checked;
end;

procedure TfmSeekBase.MADClick(Sender: TObject);
begin
  ModifiedAfterDate.Enabled := MAD.Checked;
end;

procedure TfmSeekBase.MATClick(Sender: TObject);
begin
  ModifiedAfterTime.Enabled := MAT.Checked;
end;

procedure TfmSeekBase.ABDClick(Sender: TObject);
begin
  AccessedBeforeDate.Enabled := ABD.Checked;
end;

procedure TfmSeekBase.ABTClick(Sender: TObject);
begin
  AccessedBeforeTime.Enabled := ABT.Checked;
end;

procedure TfmSeekBase.AADClick(Sender: TObject);
begin
  AccessedAfterDate.Enabled := AAD.Checked;
end;

procedure TfmSeekBase.AATClick(Sender: TObject);
begin
  AccessedAfterTime.Enabled := AAT.Checked;
end;

procedure TfmSeekBase.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FindFile.Busy then FindFile.Abort;
end;

procedure TfmSeekBase.ProgressImageTimerTimer(Sender: TObject);
begin
  ProgressImages.Tag := (ProgressImages.Tag + 1) mod ProgressImages.Count;
  ProgressImages.GetBitmap(ProgressImages.Tag, ProgressImage.Picture.Bitmap);
  ProgressImage.Refresh;
end;

procedure TfmSeekBase.SetMainConnection(const Value: TAdsConnection);
begin
  FMainConnection := Value;
  Connection.AdsServerTypes := FMainConnection.AdsServerTypes;
//  Connection.ConnectPath := FMainConnection.ConnectPath;
  Connection.UserName := UserName;   // SYSTEM_USER;
  Connection.Password := Password;   //SYSTEM_PASSWORD;
//  Connection.IsConnected:=true;
end;


procedure TfmSeekBase.SetRunDataProcess(const Value: TNotifyEvent);
begin
  FRunDataProcess := Value;
end;

initialization
  fmSeekBase:=nil;
finalization
  FreeAndNil(fmSeekBase);
end.
