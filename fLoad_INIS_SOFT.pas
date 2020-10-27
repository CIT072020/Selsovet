unit fLoad_INIS_SOFT;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uProject, uCheckKod, uTypes,
  Dialogs, DB, adsdata, adsfunc, adstable, adscnnct, StdCtrls, Mask, funcPr, QStrings, Consts,
  DBCtrlsEh, ComObj, kbmMemTable, Grids, DBGrids, ToolEdit, ExtCtrls, Metatask, fWarning,
  ComCtrls, ValEdit;

type
  TfmLoad_INIS_SOFT = class(TForm)
    ChFile: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    edFile: TDBEditEh;
    gbProtokol: TGroupBox;
    edDebug: TMemo;
    Panel2: TPanel;
    Button1: TButton;
    lbZagr: TLabel;
    lbProp: TLabel;
    cbDeleteAll: TCheckBox;
    cbSeekID: TCheckBox;
    cbNotIN_SeekFIO: TCheckBox;
    cbRewrite: TCheckBox;
    cbTypeDateR: TComboBox;
    Label2: TLabel;
    cbSeekIN: TCheckBox;
    cbWriteAdres: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure edFileEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCopyToClipboardClick(Sender: TObject);
    procedure cbSeekIDClick(Sender: TObject);
    procedure cbSeekINClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FProp:Integer;
    FLoad:Integer;
    FNew:Integer;
    sError:String;
    FExit:Boolean;
    FError:Boolean;
    FCount:Integer;
    FListSeek:TStringList;
    Mens:TAdsTable;
    Ochered:TAdsTable;
    FDeleteMens:TStringList;
    procedure CheckControl;
    procedure Event_LoadOneOpeka(nAll:Integer; nWrite:Integer; nNew:Integer; nCur:Integer);
  end;

  procedure Load_INIS_SOFT;

implementation

uses fMain, dBase, DateUtils, uOpekaToXML;

{$R *.dfm}

//-----------------------------------------------------------
procedure Load_INIS_SOFT;
var
  fmLoad: TfmLoad_INIS_SOFT;
begin
  fmLoad:=TfmLoad_INIS_SOFT.Create(nil);
  try
    fmLoad.ShowModal;
  finally
    fmLoad.Free;
  end;
end;

//-----------------------------------------------------------
procedure TfmLoad_INIS_SOFT.FormCreate(Sender: TObject);
begin
  FListSeek:=TStringList.Create;
  FDeleteMens:=TStringList.Create;
end;
//-----------------------------------------------------------
procedure TfmLoad_INIS_SOFT.FormDestroy(Sender: TObject);
begin
  FListSeek.Free;
  FDeleteMens.Free;
end;
//-----------------------------------------------------------
procedure TfmLoad_INIS_SOFT.Event_LoadOneOpeka(nAll:Integer; nWrite:Integer; nNew:Integer; nCur:Integer);
begin
  FCount:=FCount+1;
  FLoad:=nWrite;
  FProp:=nCur-nWrite;
  FNew:=nNew;
  {
  if FCount>100 then begin
    lbZagr.Caption:='Загружкно '+IntToStr(nWrite);
    lbProp.Caption:='Пропущено '+IntToStr(nSkip);
    Application.ProcessMessages;
    FCount:=0;
  end;
  }
end;
//-----------------------------------------------------------
procedure TfmLoad_INIS_SOFT.Button1Click(Sender: TObject);
var
  n,i,j,t:Integer;
  s:String;
  lOnlyNew,lErr,lDel:Boolean;
  ex:TOpeka2XML;
begin
  if (edFile.Text='') then begin
    PutError('Введите имя файла загрузуи',self);
    exit;
  end;
  if not FileExists(edFile.Text) then begin
    PutError('Файл '+edFile.Text+' не найден',self);
    exit;
  end;

  s:='ВНИМАНИЕ!'#13+
     'Будет произведена загрузка информации из программы ИНИС-СОФТ'+#13+
     'Рекомендуется сделать резервное копирование базы!'+#13+
     'Если Вы хотите продолжить, введите слово ДА в поле ввода'#13;
  if not OkWarning(s,nil) then exit;

  edDebug.Clear;
  lErr:=false;


  if cbDeleteAll.Checked then begin
    dmBase.WorkQuery.SQL.Text:='SELECT Count(*) FROM AktOpek WHERE EXTERNAL_ID is not null and EXTERNAL_ID<>'''' ';
    dmBase.WorkQuery.Open;
    n:=dmBase.WorkQuery.Fields[0].AsInteger;
    dmBase.WorkQuery.Close;
    if n>0 then begin
      dmBase.AdsConnection.Execute('DELETE FROM AktOpek WHERE EXTERNAL_ID is not null and EXTERNAL_ID<>'''' ');
      GlobalTask.LogFile.WriteToLogFile('Удаление из таблицы ОПЕКА ранее загруженных людей из программы ИНИС-СОФТ');
      edDebug.Lines.Add('удалено: '+IntToStr(n));
    end;
  end;

  lbZagr.Caption:='Загружено 0     ';
  lbProp.Caption:='Пропущено 0     ';
  Application.ProcessMessages;
  Application.BringToFront;
  FExit:=false;
  FProp:=0;
  FLoad:=0;
  FCount:=0;
  GlobalTask.LogFile.WriteToLogFile('Начало загрузки списка из программы ИНИС-СОФТ');

  ex:=TOpeka2XML.Create;
  ex.NameExportFile:=edFile.Text;
  ex.Protokol:=edDebug.Lines;
  ex.OnLoadOneOpeka:=Event_LoadOneOpeka;
  if not cbRewrite.Enabled then begin
    lOnlyNew:=false;
  end else begin
    lOnlyNew:=not cbRewrite.Checked;
  end;
  ex.RunImport(false, false, lOnlyNew, cbSeekID.Checked, cbSeekIN.Checked, cbWriteAdres.Checked);
//  ShowStrings(ex.FProtokol,'Протокол');
  ex.Free;
  lbZagr.Caption:='Загружкно '+IntToStr(FLoad);
  lbProp.Caption:='Пропущено '+IntToStr(FProp);
  Application.ProcessMessages;
  GlobalTask.LogFile.WriteToLogFile('Окончание загрузки списка из программы ИНИС-СОФТ');
end;

//-----------------------------------------------------------
procedure TfmLoad_INIS_SOFT.edFileEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if ChFile.Execute then begin
    edFile.Text:=ChFile.FileName;
//    s:=ExtractFileName(ChFile.FileName);
  end;
end;

//-----------------------------------------------------------
procedure TfmLoad_INIS_SOFT.btCopyToClipboardClick(Sender: TObject);
var
  Data: THandle;
  DataPtr: Pointer;
  text:String;
begin
  ActivateRUSKeyboard;
  Application.ProcessMessages;
  text:=edDebug.Lines.Text;
  if OpenClipBoard(0) then
  begin
    try
      Data := GlobalAlloc(GMEM_MOVEABLE+GMEM_DDESHARE, Length(text) + 1);
      try
        DataPtr := GlobalLock(Data);
        try
          Move(PChar(Text)^, DataPtr^, Length(Text) + 1);
          EmptyClipBoard;
          SetClipboardData(CF_TEXT, Data);
        finally
          GlobalUnlock(Data);
        end;
      except
        GlobalFree(Data);
        raise;
      end;
    finally
      CloseClipBoard;
    end;
  end
  else
    raise Exception.CreateRes(@SCannotOpenClipboard);
end;

//-----------------------------------------------------------------
procedure TfmLoad_INIS_SOFT.CheckControl;
begin
  cbRewrite.Enabled:=cbSeekID.Checked or cbSeekIN.Checked;
end;
//-----------------------------------------------------------------
procedure TfmLoad_INIS_SOFT.cbSeekIDClick(Sender: TObject);
begin
  CheckControl;
end;
//-----------------------------------------------------------------
procedure TfmLoad_INIS_SOFT.cbSeekINClick(Sender: TObject);
begin
  CheckControl;
end;

end.
