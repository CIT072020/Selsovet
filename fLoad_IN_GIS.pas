unit fLoad_IN_GIS;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uProject, uCheckKod, uTypes,
  Dialogs, DB, adsdata, adsfunc, adstable, adscnnct, StdCtrls, Mask, funcPr, QStrings, Consts,
  DBCtrlsEh, ComObj, kbmMemTable, Grids, DBGrids, ToolEdit, ExtCtrls, Metatask, fWarning, NativeXml,
  ComCtrls, ValEdit;

type
  TfmLoad_IN_GIS = class(TForm)
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
    cbTypeDateR: TComboBox;
    Label2: TLabel;
    cbNotLoad: TCheckBox;
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
    procedure RunImport;
    procedure AddProtokol(s:String);

  end;

  procedure RunLoad_IN_GIS;

implementation

uses fMain, dBase, DateUtils;

{$R *.dfm}

//-----------------------------------------------------------
procedure RunLoad_IN_GIS;
var
  fmLoad: TfmLoad_IN_GIS;
begin
  fmLoad:=TfmLoad_IN_GIS.Create(nil);
  try
    fmLoad.ShowModal;
  finally
    fmLoad.Free;
  end;
end;

//-----------------------------------------------------------
procedure TfmLoad_IN_GIS.FormCreate(Sender: TObject);
begin
  FListSeek:=TStringList.Create;
  FDeleteMens:=TStringList.Create;
end;
//-----------------------------------------------------------
procedure TfmLoad_IN_GIS.FormDestroy(Sender: TObject);
begin
  FListSeek.Free;
  FDeleteMens.Free;
end;
//-----------------------------------------------------------
procedure TfmLoad_IN_GIS.Button1Click(Sender: TObject);
var
  n,i,j,t:Integer;
  s:String;
  lOnlyNew,lErr,lDel:Boolean;
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
     'Будет произведена загрузка информации из файла ГИС РН'+#13+
     'Рекомендуется сделать резервное копирование базы!'+#13+
     'Если Вы хотите продолжить, введите слово ДА в поле ввода'#13;
  if not OkWarning(s,nil) then exit;

  edDebug.Clear;
  lErr:=false;


  lbZagr.Caption:='Загружено 0     ';
  lbProp.Caption:='Пропущено 0     ';
  Application.ProcessMessages;
  Application.BringToFront;
  FExit:=false;
  FProp:=0;
  FLoad:=0;
  FCount:=0;
  GlobalTask.LogFile.WriteToLogFile('Начало загрузки ИН из файла ГИС РН '+edFile.Text);

  RunImport;

  lbZagr.Caption:='Загружкно '+IntToStr(FLoad);
  lbProp.Caption:='Пропущено '+IntToStr(FProp);
  Application.ProcessMessages;
  GlobalTask.LogFile.WriteToLogFile('Окончание загрузки ИН из файла ГИС РН');
end;

//-----------------------------------------------------------
procedure TfmLoad_IN_GIS.edFileEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if ChFile.Execute then begin
    edFile.Text:=ChFile.FileName;
//    s:=ExtractFileName(ChFile.FileName);
  end;
end;

//-----------------------------------------------------------
procedure TfmLoad_IN_GIS.btCopyToClipboardClick(Sender: TObject);
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
procedure TfmLoad_IN_GIS.CheckControl;
begin
end;
//-----------------------------------------------------------------
procedure TfmLoad_IN_GIS.cbSeekIDClick(Sender: TObject);
begin
  CheckControl;
end;
//-----------------------------------------------------------------
procedure TfmLoad_IN_GIS.cbSeekINClick(Sender: TObject);
begin
  CheckControl;
end;
//------------------------------------------------
procedure TfmLoad_IN_GIS.AddProtokol(s:String);
begin
  edDebug.Lines.Add(s);
  Application.ProcessMessages;
end;
//------------------------------------------------
procedure TfmLoad_IN_GIS.RunImport;
var
  XMLDokument:TNativeXml;
  node,node_data:TXMLNode;
  nCount,nNew,i,n,m:Integer;
  dDate:TDateTime;
  lOk:Boolean;
  sNameExportFile:String;
  s, ss, sFind, sErr, sIN, sFam, sName, sOtch:String;
begin
  sNameExportFile:=edFile.Text;
  XMLDokument:=TNativeXml.Create;
  XMLDokument.Clear;
  XMLDokument.Root.Name:='ROOT';
  edDebug.Clear;
  FProp:=0;
  FLoad:=0;
  lOk:=true;
  try
    AddProtokol('Открытие файла '+sNameExportFile+' ... ');
    XMLDokument.LoadFromFile(sNameExportFile);
  except
    on E: Exception do begin
      AddProtokol('Ошибка: '+E.Message);
      lOk:=false;
    end;
  end;
  if lOk and (XMLDokument.Root.FindNode('UN_LIST_DATA')=nil) then begin
    AddProtokol('XML документ не соответствует по структуре');
    lOk:=false;
  end;
  if not lOk then begin
    XMLDokument.Free;
    exit;
  end;

  for i:=0 to XMLDokument.Root.NodeCount-1 do begin
    node_data:=XMLDokument.Root.Nodes[i];
    if node_data.Name='UN_LIST_DATA' then begin
      lOk:=true;
      sIN:='';
      sErr:='';
{ <LIST_SURNAME>ЕФИМОВ</LIST_SURNAME>
  <LIST_NAME>СЕРГЕЙ</LIST_NAME>
  <LIST_SNAME>ВАЛЕРЬЕВИЧ</LIST_SNAME>
  <LIST_BDATE>28.05.1982</LIST_BDATE>  }
      try
        s:='LIST_SURNAME';
        sFam:=Utf8ToAnsi(node_data.FindNode(s).ValueAsString);
        s:='LIST_NAME';
        sName:=Utf8ToAnsi(node_data.FindNode(s).ValueAsString);
        s:='LIST_SNAME';
        sOtch:=Utf8ToAnsi(node_data.FindNode(s).ValueAsString);
        s:='LIST_BDATE';
        ss:=node_data.FindNode(s).ValueAsString;
        if ss=''
          then dDate:=0
          else dDate:=STOD(ss, tdVigr);
        node:=node_data.FindNode('UN_PERSON');
        if node<>nil then begin
          sIN:=Utf8ToAnsi(node.FindNode('IDENTIF').ValueAsString);
        end else begin
          node:=node_data.FindNode('UN_LIST_DATA_ERRORS');
          if node<>nil then begin
            sErr:=Utf8ToAnsi(node.FindNode('ERROR').ValueAsString);
            lOk:=false;
          end;
        end;
        sFind:=sFam+' '+sName+' '+sOtch+' '+ss+' '+sIN+sErr+' ';
        if node=nil then begin
          lOk:=false;
          AddProtokol('Отсутствуют данные с результатом');
        end;
      except
        on E:Exception do begin
          lOk:=false;
          AddProtokol('Ошибка чтения данных: '+E.Message);
        end;
      end;
      if lOk then begin
        if sIN<>'' then begin
          if dmBase.AktZ.Locate('FAMILIA;NAME;OTCH;DATER', VarArrayOf([sFam,sName,sOtch,dDate]),[]) then begin
            try
              dmBase.AktZ.Edit;
              dmBase.AktZ.FieldByName('LICH_NOMER').AsString:=sIN;
              dmBase.AktZ.Post;
              if not cbNotLoad.Checked
                then AddProtokol('+ '+sFind);
            except
              on E:Exception do begin
                lOk:=false;
                AddProtokol(sFind+' '+E.Message);
              end;
            end;
          end else begin
            AddProtokol('Человек не найден в базе: '+sFind);
            lOk:=false;
          end;
        end else begin
          AddProtokol('Отсутствует ИН: '+sFind);
        end;
      end;
      if sErr<>''
        then AddProtokol(sFind);
      if lOk
        then Inc(FLoad,1)
        else Inc(FProp,1);
      lbZagr.Caption:='Загружено '+IntToStr(FLoad);
      lbProp.Caption:='Пропущено '+IntToStr(FProp);
      Application.ProcessMessages;
    end;
  end;


  XMLDokument.Free;
end;

end.
