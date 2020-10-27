unit fLoadZAH_CSV;

interface

//{$DEFINE TEST_MINSK}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, FileCtrl, Consts,
  db, funcPr, dbFunc, uCheckKod, uTypes, fWarning, uProject, uProjectAll, mPermit, MetaTask, NewDialogs, uGisun,
  fmChList, StdCtrls, Mask, DBCtrlsEh, Dialogs, ExtCtrls, ComCtrls,
  kbmMemTable;

type

  TfmLoadZAH_CSV=class(TForm)
    pnFile: TPanel;
    ChFile: TOpenDialog;
    Label1: TLabel;
    edPathLoad: TDBEditEh;
    pnDebug: TPanel;
    edDebug: TMemo;
    btLoad: TButton;
    lbCountAll: TLabel;
    lbCount: TLabel;
    btCancel: TButton;
    Button2: TButton;
    btCopyToClipboard: TButton;
    Panel1: TPanel;
    pb: TProgressBar;
    lbCountFiles: TLabel;
    btUpdate: TButton;
    cbIN: TCheckBox;
    Label2: TLabel;
    edPathSave: TDBEditEh;
    cbSeekMen: TComboBox;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Bevel2: TBevel;
    cbTest: TCheckBox;
    cbSetBook: TCheckBox;
    cbFullProt: TCheckBox;
    edInfo: TMemo;
    cbAutoNum: TCheckBox;
    mtBooks: TkbmMemTable;
    mtBooksBOOK: TIntegerField;
    mtBooksBOOK_DATE: TDateField;
    mtBooksKLAD: TIntegerField;
    mtBooksZH_TYPE: TSmallintField;
    mtBooksBOOK_DATE_END: TDateField;
    cbDateZ: TCheckBox;
    procedure edFileEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure btLoadClick(Sender: TObject);
    procedure edFileEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btCopyToClipboardClick(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
    procedure cbTestClick(Sender: TObject);
    procedure edPathSaveEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure cbSetBookClick(Sender: TObject);
  private
    { Private declarations }
    FSource:String;
    FCancel:Boolean;
    FLastError:String;
    FLoadError:String;
    FTest:Boolean;
    FCount:Integer;
    FCountAll:Integer;
    FList:TArrStrings;
    FAutoNum:Boolean;
    FTypeNewNum:Integer;
    FPathLoad:String;
    FPathSave:String;
    FIdLoad:Integer;
    FDateLoad:TDateTime;
  public
//    procedure ReadAllBooks;
//    function GetNumberBook(var Info:TOneRecZah; var sSoob:String):Integer;
    procedure LoadAllFiles(lUpdate:Boolean);
    procedure LoadOneFile(sFile:String; lUpdate:Boolean);
    procedure AddProtokol(s:String);
    //-----------------------------------------------------------
    function OpenFile(sFile:String):Boolean;
    function CountRecord:Integer;
    function ReadString(n:Integer):TOneRecZah;
    function WriteOneRec(var Info:TOneRecZah):Boolean;
    procedure OpenInfoMen(var Info:TOneRecZah);
    procedure CloseInfoMen;

    procedure FindFilesCSV(sPath:String; slFile:TStringList);

  end;

  procedure LoadZAH_CSV;

implementation

uses dBase, StrUtils, StdConvs;

{$R *.dfm}

//------------------------------------------------
procedure LoadZAH_CSV;
var
  f:TfmLoadZAH_CSV;
  s:String;
//  nZags:Integer;
begin
  f:=TfmLoadZAH_CSV.Create(nil);
//  nZags:=GlobalTask.ParamAsInteger('ID');
  try
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfmLoadZAH_CSV.btCopyToClipboardClick(Sender: TObject);
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
//------------------------------------------------
{
procedure TfmLoadZAH_CSV.ReadAllBooks;
var
  dsBook:TDataSet;
  n,nID:Integer;
begin
  dmBase.SprZAH.First;
  mtBooks.EmptyTable;
  while not dmBase.SprZAH.Eof do begin
    nID:=dmBase.SprZAH.FieldByName('ID').AsInteger;
    dsBook:=BookKlad_SetDataSet(nID, nil);
    try
      while not dsBook.Eof do begin      // tbSimpleProp
        mtBooks.Append;
        mtBooksKLAD.AsInteger:=nID;
        mtBooksBOOK.AsInteger:=StrToInt(dsBook.FieldByName('POKAZ').AsString);
        mtBooksBOOK_DATE.AsDateTime:=dsBook.FieldByName('DATES').AsDateTime;
        try
          n:=dsBook.FieldByName('TYPESAVE').AsInteger;
        except
          n:=0;
        end;
        mtBooksZH_TYPE.AsInteger:=n;
        mtBooks.Post;
        dsBook.Next;
      end;
    finally
      BookKlad_ClearDataSet;
    end;
    dmBase.SprZAH.Next;
  end;
  dmBase.SprZAH.First;
  mtBooks.First;
end;
function TfmLoadZAH_CSV.GetNumberBook(var Info:TOneRecZah; var sSoob:String):Integer;
var
  dsBook:TDataSet;
  nID:Integer;
begin
  sSoob:='';
  Result:=0;
  if cbSetBook.Checked then begin  // определять номер книги
    if (Info.DateZah>0) then begin
      mtBooks.Filter:='klad='+Info.Klad;
      mtBooks.Filtered:=true;
      mtBooks.Last;
      while not mtBooks.Bof do begin
        if Info.Tip=mtBooksZH_TYPE.AsInteger then begin
          if Info.DateZah>=mtBooksBOOK_DATE.AsDateTime then begin
            Result:=mtBooksBOOK.AsInteger;
            break;
          end;
        end;
        mtBooks.Prior;
      end;
      mtBooks.Filtered:=false;
      if Result=0 then begin
        sSoob:='№ книги не определен';
      end else begin
        sSoob:='книга № '+IntToStr(Result);
      end;
    end else begin
      sSoob:='№ книги не определен, нет даты';
    end;
  end;
end;
}
//------------------------------------------------
procedure TfmLoadZAH_CSV.FormCreate(Sender: TObject);
var
  n:Integer;
begin
  mtBooks.Active:=true;
  edDebug.Align:=alClient;
  edInfo.Align:=alClient;
  lbCount.Caption:='';
  lbCountAll.Caption:='';
  btCancel.Enabled:=false;
  SetLength(FList,0);
  FIdLoad:=0;
  FAutoNum:=GlobalTask.ParamAsBoolean('AUTO_NUM_ZAH'); //IsAutoNumZAGS;
  cbAutoNum.Visible:=FAutoNum;
  cbAutoNum.Checked:=FAutoNum;
  n:=GlobalTask.ParamAsInteger('ZAH_TYPENUM');
  if n=0
    then FTypeNewNum:=NUM_KLAD_BOOK
    else FTypeNewNum:=n;
  edPathLoad.Text:=GlobalTask.GetLastValueAsString('PATH_LOAD_FILE_ZAH');
  edPathSave.Text:=GlobalTask.GetLastValueAsString('PATH_SAVE_FILE_ZAH');
  cbIN.Checked:=(GlobalTask.GetLastValueAsString('CHECK_IN_FILE_ZAH')='1');
  cbSeekMen.ItemIndex:=GlobalTask.GetLastValueAsInteger('SEEKMEN_FILE_ZAH');
  cbAutoNum.Checked:=(GlobalTask.GetLastValueAsString('AUTONUM_FILE_ZAH')='1');
  cbFullProt.Checked:=(GlobalTask.GetLastValueAsString('FULLPROT_FILE_ZAH')='1');
  cbSetBook.Checked:=(GlobalTask.GetLastValueAsString('SETBOOK_FILE_ZAH')<>'0');
  cbDateZ.Checked:=(GlobalTask.GetLastValueAsString('DATEZ_FILE_ZAH')='1');
end;
//------------------------------------------------
procedure TfmLoadZAH_CSV.FormDestroy(Sender: TObject);
begin
  SetLength(FList,0);
end;
//------------------------------------------------
procedure TfmLoadZAH_CSV.edFileEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  sDir:String;
begin
  if SelectDirectory('Выберите папку с файлами для загрузки', '', sDir) then begin
    Handled:=true;
    edPathLoad.Text:=sDir;
  end;
//  if ChFile.Execute then begin
//    edPathLoad.Text:=ChFile.FileName;
end;
//------------------------------------------------
procedure TfmLoadZAH_CSV.edPathSaveEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  sDir:String;
begin
  if SelectDirectory('Выберите папку', '', sDir) then begin
    Handled:=true;
    edPathSave.Text:=sDir;
  end;
end;
//------------------------------------------------
procedure TfmLoadZAH_CSV.edFileEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
end;
//------------------------------------------------
procedure TfmLoadZAH_CSV.AddProtokol(s:String);
begin
  edDebug.Lines.Add(s);
  Application.ProcessMessages;
end;
//-----------------------------------------------------------
procedure TfmLoadZAH_CSV.LoadAllFiles(lUpdate:Boolean);
var
  s,sPath:String;
  i,nCount,nCountAll:Integer;
  lOk,lErr:Boolean;
  slFile:TStringList;
  tt:TDateTime;
begin
  FTest:=cbTest.Checked;
  if dmBase._LockTypeObj(_TypeObj_AktZah, 'База занята другим пользователем ...', true) then begin
    btCancel.Enabled:=true;
    try
      if (edPathLoad.Text='') then begin
        PutError('Выберите папку для загрузки',self);
        exit;
      end;
      FPathSave:=Trim(edPathSave.Text);
      if (FPathSave='') then begin
        PutError('Выберите папку для сохранения загруженных файлов',self);
        exit;
      end else begin
        ForceDirectories(FPathSave);
        if SaveStringToFile(CheckSleshN(FPathSave)+'1', 'test_write') then begin
          DeleteFile(CheckSleshN(FPathSave)+'1');
        end else begin
          PutError('Ошибка записи в папку '+FPathSave);
          exit;
        end;
      end;
      dmBase.WorkQuery.SQL.Text:='SELECT Max(ID) FROM BaseProp WHERE typeObj='+IntToStr(_TypeObj_LoadZah);
      dmBase.WorkQuery.Open;
      FIdLoad:=dmBase.WorkQuery.Fields[0].AsInteger+1;
      dmBase.WorkQuery.Close;

      FPathLoad:=Trim(edPathLoad.Text);
      GlobalTask.SetLastValueAsString('PATH_SAVE_FILE_ZAH',FPathSave);
      GlobalTask.SetLastValueAsString('PATH_LOAD_FILE_ZAH',FPathLoad);
      if cbIN.Checked then s:='1' else s:='0';       GlobalTask.SetLastValueAsString('CHECK_IN_FILE_ZAH',s);
      GlobalTask.SetLastValueAsInteger('SEEKMEN_FILE_ZAH', cbSeekMen.ItemIndex);
      if cbAutoNum.Checked  then s:='1' else s:='0';  GlobalTask.SetLastValueAsString('AUTONUM_FILE_ZAH',s);
      if cbFullProt.Checked then s:='1' else s:='0';  GlobalTask.SetLastValueAsString('FULLPROT_FILE_ZAH',s);
      if cbSetBook.Checked  then s:='1' else s:='0';  GlobalTask.SetLastValueAsString('SETBOOK_FILE_ZAH',s);
      if cbDateZ.Checked    then s:='1' else s:='0';  GlobalTask.SetLastValueAsString('DATEZ_FILE_ZAH', s);

      FPathLoad:=CheckSleshN(FPathLoad);
      FPathSave:=CheckSleshN(FPathSave);

      FAutoNum:=cbAutoNum.Checked;

      slFile:=TStringList.Create;
      lbCount.Caption:='';
      lbCountAll.Caption:='';
      FCount:=0;
      FCountAll:=0;
      if FileExists(edPathLoad.Text) then begin
        slFile.Add(edPathLoad.Text);
      end else begin
        if DirectoryExists(edPathLoad.Text) then begin
          sPath:=CheckSleshN(edPathLoad.Text);
          FindFilesCSV(sPath, slFile);
          if slFile.Count=0 then begin
            PutError('По пути "'+edPathLoad.Text+'" не найдено ни одного файла для загрузки');
          end;
        end else begin
          PutError('Файл "'+edPathLoad.Text+'" не найден');
        end;
      end;
      if slFile.Count>0 then begin
        edDebug.Clear;
        for i:=0 to slFile.Count-1 do begin
          AddProtokol(slFile.Strings[i]);
        end;
        FCancel:=false;
        if FTest then begin
          lOk:=true;
        end else begin
          s:='ВНИМАНИЕ!'#13+
             'Будет произведена загрузка информации из '+IntToStr(slFile.Count)+' файлов'#13+
             'Если Вы хотите продолжить, введите слово ДА в поле ввода'#13;
          lOk:=OkWarning(s,nil)
        end;
        if lOk then begin
          tt:=Now;
          FDateLoad:=tt;
          edDebug.Clear;
          if FTest
            then AddProtokol('НАЧАЛО ТЕСТИРОВАНИЯ: '+FormatDateTime('hh:nn:ss',tt))
            else AddProtokol('НАЧАЛО ЗАГРУЗКИ: '+FormatDateTime('hh:nn:ss',tt));
          lErr:=false;
          {
          pb.Min:=0;
          pb.Max:=slFile.Count-1;
          pb.Position:=0;
          pb.Visible:=true;
          lbCountFiles.Visible:=true;
          }
          Application.ProcessMessages;
          Application.BringToFront;
          mtBooks.EmptyTable;
          ReadListAllBooks(mtBooks,0);  // uProjectAll.pas
          for i:=0 to slFile.Count-1 do begin
//            pb.Position:=i+1;
//            lbCountFiles.Caption:=IntToStr(i+1)+'/'+IntToStr(slFile.Count);
            Application.ProcessMessages;
            AddProtokol(StringOfChar('-',80));
            LoadOneFile(slFile.Strings[i], lUpdate);
            if FCancel then break;
          end;
          AddProtokol(StringOfChar('-',80));
          if FTest then begin
            AddProtokol('ТЕСТИРОВАНИЕ ОКОНЧЕНО: '+FormatDateTime('hh:nn:ss',Now));
          end else begin
            AddProtokol('ЗАГРУЗКА ОКОНЧЕНА: '+FormatDateTime('hh:nn:ss',Now));
            s:=QStr(FormatDateTime('dd mmmm yyyy hh:nn', FDateLoad));
            dmBase.AdsConnection.Execute(
            'MERGE BaseProp ON ( typeobj='+inttostr(_TypeObj_LoadZah)+' and id='+inttostr(FIdLoad)+')'+
            ' WHEN MATCHED THEN UPDATE SET DATES='+DateToSQL(FDateLoad)+', VALUE='+s+
            ' WHEN NOT MATCHED THEN INSERT ( typeobj, id, dates, pokaz, value) VALUES ( '+inttostr(_TypeObj_LoadZah)+','+inttostr(FIdLoad)+','+DateToSQL(FDateLoad)+',''DATE_LOAD'', '+s+');');
            edDebug.Lines.SaveToFile(FPathSave+'загрузка '+FormatDateTime('yyyy-mm-dd hh-nn-ss', FDateLoad)+'.txt');
          end;
//          AddProtokol('ВРЕМЯ: '+FormatDateTime('hh:nn:ss',Now-tt));
    //      pb.Visible:=false;
//          lbCountFiles.Visible:=false;

          Application.ProcessMessages;
        end;
      end;
      slFile.Free;
    finally
      btCancel.Enabled:=false;
      dmBase._UnLockTypeObj(_TypeObj_AktZah);
    end;
  end;
end;
//-----------------------------------------------------------
function TfmLoadZAH_CSV.OpenFile(sFile:String):Boolean;
var
  s,sErr:String;
begin
  Result:=true;
  SetLength(FList,0);
  try
    AddProtokol('Файл '+ExtractFileName(sFile));
    s:=ReadFileToString(sFile, sErr);
    if sErr<>'' then begin
      AddProtokol('Ошибка: '+sErr);
      Result:=false;
    end;
  except
    on E: Exception do begin
      AddProtokol('Ошибка: '+E.Message);
      Result:=false;
    end;
  end;
  if Result then begin
    StrToArr(s, FList, #13#10, true);
    if Length(FList)=0 then begin
      AddProtokol('Ошибка: файл пуст');
      Result:=false;
    end;
  end;
end;
//-----------------------------------------------------------
function TfmLoadZAH_CSV.CountRecord:Integer;
begin
  Result:=Length(FList);
end;
//-----------------------------------------------------------
function TfmLoadZAH_CSV.ReadString(n:Integer):TOneRecZah;
var
  arr:TArrStrings;
  sErr,ss,sWar:String;
  m:Integer;
  procedure AddErr(s:String);
  begin  if sErr='' then sErr:=s else sErr:=sErr+', '+s; end;
  function AddWar(s:String):Boolean;
  begin
    Result:=true;
    if sWar='' then sWar:=s else sWar:=sWar+', '+s;
  end;
begin
  Result.Error:='';
  Result.Warning:=false;
  Result.LichNomer:='';
  Result.DateZah:=0;
  Result.Klad_GIS:='';
  Result.Klad:='';
  Result.Sector:='';
  Result.Rad:='';
  Result.Uch:='';
  Result.Mog:='';
  Result.St_Klum:='';
  Result.Klum:='';
  Result.Stakan:='';
  Result.Sklep:='';
  Result.Book:='';
  Result.Full:=PadLInt(n,3,' ')+') '+FList[n-1];   // !!!
  sErr:='';
  sWar:='';
  StrToArr(FList[n-1], arr, ';', false);
  if Length(arr)>=8 then begin   // мин. длина массива
    Result.LichNomer:=Trim(arr[1]);
    Result.LichNomer:=CheckLichNom(true, Result.LichNomer);
    if cbIN.Checked then begin
      sErr:=GetErrorCheck;
    end;
    Result.Familia:=Trim(arr[2]);
    Result.Name:=Trim(arr[3]);
    Result.Otch:=Trim(arr[4]);
    if Trim(arr[5])<>'' then begin
      try
        Result.DateZah:=STOD(Trim(arr[5]),tdStd);
        Result.sDateZah:=DTOS(Result.DateZah, tdStd);
      except
      end;
    end;
    try
      Result.Tip:=StrToIntDef(Trim(arr[0]),0);
    except
      AddErr('неизвестный тип: '+arr[0]);
    end;
    Result.Klad_GIS:=Trim(arr[6]);
    m:=StrToIntDef(Result.Klad_GIS,0);
    if dmBase.SprZAH.Locate('ID_GIS', m, []) then begin
      Result.Klad:=dmBase.SprZAH.FieldByName('ID').AsString;
      if cbSetBook.Checked
        then m:=GetNumberBook(mtBooks,Result, ss)
        else m:=0;
      if m>0
        then Result.Book:=IntToStr(m);
      if ss<>''
        then Result.Warning:=AddWar(ss);
    end else begin
      AddErr('кладбище не найдено: '+Result.Klad_GIS);
    end;
    case Result.Tip of
      1,5: begin   // гроб,могила   урна,могила
           if Length(arr)<11 then begin
             AddErr('количество элементов меньше 11');
           end else begin
             Result.Sector:=Trim(arr[7]);
             Result.Rad:=Trim(arr[8]);
             Result.Uch:=Trim(arr[9]);
             Result.Mog:=Trim(arr[10]);
           end;
         end;
      2: begin   // колумбарная стена
           if Length(arr)<10 then begin
             AddErr('количество элементов меньше 10');
           end else begin
             Result.St_Klum:=Trim(arr[7]);
             Result.Rad:=Trim(arr[8]);
             Result.Klum:=Trim(arr[9]);
           end;
         end;
      3: begin  // колумбарный стакан
           if Length(arr)<10 then begin
             AddErr('количество элементов меньше 10');
           end else begin
             Result.Sector:=Trim(arr[7]);
             Result.Rad:=Trim(arr[8]);
             Result.Stakan:=Trim(arr[9]);
           end;
         end;
      4: Result.Sklep:=Trim(arr[7]);
    else
      Result.Tip:=0;
      AddErr('неизвестный тип: '+arr[0]);
    end;
  end else begin
    AddErr('количество элементов меньше 8');
  end;
  if Result.Warning then
    Result.Full:=Result.Full+' ('+sWar+') ';
  if sErr<>'' then
     Result.Error:=Result.Full+' '+sErr;
end;

//-----------------------------------------------------------
procedure TfmLoadZAH_CSV.OpenInfoMen(var Info:TOneRecZah);
var
  lSeek:Boolean;
  n,nType:Integer;
begin
  edInfo.Clear;
  edInfo.Lines.Add('ЗАГРУЗКА:');
  edInfo.Lines.Add(StringOfChar('-',40));
  edInfo.Lines.Add(Info.Familia+' '+Info.Name+' '+Info.Otch);
  edInfo.Lines.Add('БАЗА:');
  edInfo.Lines.Add(StringOfChar('-',40));
  with dmBase.WorkQuery do begin
    SQL.Text:='SELECT Familia,Name,Otch,DateR,DateS FROM AktZ WHERE lich_nomer='+QStr(Info.LichNomer);
    Open;
    while not Eof do begin
      edInfo.Lines.Add(FieldByName('Familia').AsString+' '+FieldByName('Name').AsString+' '+FieldByName('Otch').AsString+
                       '    дата рожд.:'+DatePropis(FieldByName('DateR').AsDateTime,3)+'    дата смерти:'+DatePropis(FieldByName('DateS').AsDateTime,3));
      Next;
    end;
    Close;
  end;
  edDebug.Visible:=false;
  edInfo.Visible:=true;
  Application.ProcessMessages;
end;
//-----------------------------------------------------------
procedure TfmLoadZAH_CSV.CloseInfoMen;
begin
  edDebug.Visible:=true;
  edInfo.Visible:=false;
  Application.ProcessMessages;
end;
//-----------------------------------------------------------
function TfmLoadZAH_CSV.WriteOneRec(var Info:TOneRecZah):Boolean;
var
  lSeek:Boolean;
  n,nType:Integer;
  function GetCountMen_:Integer;
  begin
    dmBase.WorkQuery.SQL.Text:='SELECT Count(*) FROM AktZ WHERE lich_nomer='+QStr(Info.LichNomer);
    dmBase.WorkQuery.Open;
    Result:=dmBase.WorkQuery.Fields[0].AsInteger;
    dmBase.WorkQuery.Close;
  end;
begin
  Result:=true;
  lSeek:=dmBase.AktZ.Locate('LICH_NOMER', Info.LichNomer, []);
  nType:=cbSeekMen.ItemIndex; // 0-Запрос на действие  1-Добавить новую запись  2-Перезаписать найденную запись  3-Отказ от записи
  //------------ человек найден в базе --------------------
  if lSeek then begin
    // запись уже отправлена в регистр
    if (Gisun.GetPoleGrn(dmBase.AktZ.FieldByName('POLE_GRN'))=rPost) then begin
      AddProtokol(Info.Full+' человек с ИН: '+Info.LichNomer+' отправлен в регистр, отказ в записи');
      Result:=false;
    end else begin
      //----- 0-Запрос на действие --------------------------
      if nType=0 then begin   //
        n:=GetCountMen_;
        if n>1 then begin  // найдено более 1 человека
          OpenInfoMen(Info);
          n:=QuestionPosXY(' человек c ИН '+Info.LichNOmer+' найден в базе ('+inttostr(n)+').',' Добавить;Отказ от записи;','',1,2,qtConfirmation, Self.Left+30, Self.Top+20);
          CloseInfoMen;
          if n=1 then begin
            AddProtokol(Info.Full+' человек найден в базе в количестве'+inttostr(n)+', добавлена новая запись');
            lSeek:=false;  // типа не найден, будем добавлять
          end else begin
            AddProtokol(Info.Full+' человек найден в базе в количестве'+inttostr(n)+', отказ от записи');
            Result:=false;
          end;
        end else begin
          OpenInfoMen(Info);
          n:=QuestionPosXY(' Человек с ИН '+Info.LichNomer+' найден в базе.', 'Добавить;Перезаписать;Отказ от записи;','',1,3,qtConfirmation, Self.Left+30, Self.Top+20);
          CloseInfoMen;
          //-------------------------------------------------
          if n=1 then begin
            AddProtokol(Info.Full+' человек найден в базе, добавлена новая запись');
            lSeek:=false;  // типа не найден, будем добавлять
          end else if n=2 then begin
            AddProtokol(Info.Full+' человек найден в базе, запись перезаписана');  // перезапись будем корректировать
          end else begin
            AddProtokol(Info.Full+' человек найден в базе, отказ от записи');
            Result:=false;
          end;
        end;
      //----- 1-Добавить новую запись --------------------------
      end else if (nType=1) then begin
        AddProtokol(Info.Full+' человек найден в базе, добавлена новая запись');
        lSeek:=false;
      end else if (nType=2) then begin  // 2-Перезаписать найденную запись
        AddProtokol(Info.Full+' человек найден в базе, запись откорректирована');
      end else if (nType=3) then begin  // 3-Отказ от записи;
        AddProtokol(Info.Full+' человек найден в базе, отказ от записи');
        Result:=false;
      end;
    end;
  end else begin
    if cbFullProt.Checked or Info.Warning
      then AddProtokol(Info.Full+'  человек не найден, добавлена новая запись');
  end;
  //--------------------------------------------------------------
  if Result and not FTest then begin
    with dmBase.AktZ do begin
      if lSeek then begin
        Edit;
        if FAutoNum and (FieldByName('ZH_KLAD').AsString<>Info.Klad) then begin
           n:=dmBase.GetNewNomerZah(Info.Klad, Info.Book, Info.DateZah, FTypeNewNum);
           if n>0
             then FieldByName('NOMER').AsInteger:=n;
        end;
      end else begin
        Append;
        if FAutoNum then begin
           n:=dmBase.GetNewNomerZah(Info.Klad, Info.Book, Info.DateZah, FTypeNewNum);
           if n>0
             then FieldByName('NOMER').AsInteger:=n;
        end;
      end;
      FieldByName('FAMILIA').AsString:=Info.Familia;
      FieldByName('NAME').AsString:=Info.Name;
      FieldByName('OTCH').AsString:=Info.Otch;
      FieldByName('LICH_NOMER').AsString:=Info.LichNomer;
      FieldByName('LOAD_CHECK').AsInteger:=0;   // не проверено
      FieldByName('STATUS').AsString:='';
      FieldByName('ID_LOAD').AsInteger:=FIdLoad;
      if cbDateZ.Checked then begin   // дата записи равна дате захоронения
        if Info.DateZah>0
          then FieldByName('DATEZ').AsDateTime:=Info.DateZah
          else FieldByName('DATEZ').AsDateTime:=Date;
      end else begin
        FieldByName('DATEZ').AsDateTime:=Date;
      end;
      if Info.DateZah>0
        then FieldByName('DATEZH').AsDateTime:=Info.DateZah;
      FieldByName('ZH_KLAD').AsString:=Info.Klad;
      FieldByName('BOOK').AsString:=Info.Book;
      FieldByName('ZH_TYPE').AsInteger:=Info.Tip;
      FieldByName('ZH_UCH').AsString:=Info.Sector;
      FieldByName('ZH_RAD').AsString:=Info.Rad;
      FieldByName('ZH_UCH2').AsString:=Info.Uch;
      FieldByName('ZH_MOG').AsString:=Info.Mog;

      FieldByName('ZH_ST_KLUM').AsString:=Info.St_Klum;
      FieldByName('ZH_KLUM').AsString:=Info.Klum;
      FieldByName('ZH_STAKAN').AsString:=Info.Stakan;
      FieldByName('ZH_SKLEP').AsString:=Info.Sklep;
      Post;
    end;
  end;
end;
//-----------------------------------------------------------
procedure TfmLoadZAH_CSV.LoadOneFile(sFile:String; lUpdate:Boolean);
var
  nType,nCount,nNew,i,j,n,m:Integer;
  dBegin, dEnd:TDateTime;
  lOk:Boolean;
  sName,sNameType:String;
  s, ss:String;
  Info:TOneRecZah;
begin
  FTest:=cbTest.Checked;
  FCount:=0;
  lOk:=OpenFile(sFile);
  if lOk then begin
    nCount:=CountRecord;
    for i:=1 to nCount do begin
      Info:=ReadString(i);
      if Info.Error='' then begin
        if WriteOneRec(Info) then begin
          FCount:=FCount+1;
        end;
      end else begin
        AddProtokol(Info.Error);
      end;
      Application.ProcessMessages;
      if FCancel then break;
    end;
    if not FTest then begin
      if CopyFile(PChar(sFile), PChar(FPathSave+ExtractFileName(sFile)), false) then begin
        DeleteFile(sFile);
      end else begin
        AddProtokol('Ошибка копирования файла : '+sFile+' '+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
      end;
    end;
  end;
end;
//-----------------------------------------------------------
procedure TfmLoadZAH_CSV.FindFilesCSV(sPath:String; slFile:TStringList);
var
//  n,i,j,t:Integer;
//  s,sFile:String;
  lOk:Boolean;
  SearchRec: TSearchRec;
begin
  sPath:=CheckSleshN(sPath);
  lOk:=FindFirst(CheckSleshN(sPath)+'*.*', faAnyFile, SearchRec) = 0;
  if lOk then begin
    repeat
      if (SearchRec.Name[1] <> '.') and
         (SearchRec.Attr and faVolumeID <> faVolumeID) and
         (SearchRec.Attr and faDirectory <> faDirectory) then begin
         if RightStr(SearchRec.Name,4)='.csv' then begin
           slFile.Add(sPath+SearchRec.Name);
         end;
      end else if (SearchRec.Name[1] <> '.') and (SearchRec.Attr and faDirectory = faDirectory) then begin
        FindFilesCSV(sPath+SearchRec.Name, slFile);
      end;
    until FindNext(SearchRec) <> 0;
  end;
end;
//-----------------------------------------------------------
procedure TfmLoadZAH_CSV.btLoadClick(Sender: TObject);
begin
 LoadAllFiles(false);
end;
procedure TfmLoadZAH_CSV.btUpdateClick(Sender: TObject);
var
  n:Cardinal;
  i:Integer;
  d:TDateTime;
begin
  mtBooks.EmptyTable;
  ReadListAllBooks(mtBooks,0);
  n:=GetTickCount;
  for i:=1 to 100 do begin
    mtBooks.Filter:='klad='+inttostr(i);
    mtBooks.Filtered:=true;
    mtBooks.First;
    while not mtBooks.Eof do begin
      d:=mtBooksBOOK_DATE.AsDateTime;
      d:=d-1;
      mtBooks.next;
    end;
    mtBooks.Filtered:=false;
  end;
  ShowMessage(inttostr(mtBooks.RecordCount)+'  '+inttostr(GetTickCount-n));
end;

//-------------------------------------------------------------------
procedure TfmLoadZAH_CSV.btCancelClick(Sender: TObject);
begin
  if btCancel.Enabled then begin
    if Problem(PadCStr('Прервать загрузку ?',40,' ')) then
      FCancel:=true;
  end;    
end;
//-------------------------------------------------------------------
procedure TfmLoadZAH_CSV.Button2Click(Sender: TObject);
var
  nCount,i,nID : Integer;
  List : TStringList;
  s:String;
begin
  List := TStringList.Create;
  OpenMessage('Сбор информации ...','');
  with dmBase.WorkQuery do begin
    SQL.Text:='SELECT TOP 20 ID,DATES,VALUE FROM BaseProp WHERE typeObj='+IntToStr(_TypeObj_LoadZah)+' ORDER BY ID DESC';
    Open;
    while not Eof do begin
      if FieldByName('ID').AsInteger>0 then begin
        List.AddObject(FieldByName('VALUE').AsString, Pointer(FieldByName('ID').AsInteger));
      end;
      Next;
    end;
    Close;
  end;
  CloseMessage;
  i:=ChoiceFromList(List,'Выберите дату', Button2);
  if (i>-1)  then begin
    // !!! POLE_GRN ???
    nID:=Integer(List.Objects[i]);
    with dmBase.WorkQuery do begin
      SQL.Text:='SELECT Count(*) FROM AktZ WHERE id_load='+IntToStr(nID);
      Open;
      nCount:=Fields[0].AsInteger;
      Close;
    end;
    if nCount=0 then begin
      ShowMessage('Для удаления в базе ничего не найдено');
    end else begin
      s:='ВНИМАНИЕ!'#13+
         'Операция предназначена для удаления неверной загрузки'#13+
         'Будет удалено '+IntToStr(nCount)+' записей в базе загругруженых '+List.Strings[i]+#13+
         'Если Вы хотите выполнить, введите слово ДА в поле ввода'#13;
      if OkWarning(s,nil) then begin
        OpenMessage('Удаление информации ...','');
        dmBase.AdsConnection.Execute('DELETE FROM AktZ WHERE id_load='+inttostr(nID));
        CloseMessage;
      end;
    end;
    dmBase.AdsConnection.Execute('DELETE FROM BaseProp WHERE typeobj='+inttostr(_TypeObj_LoadZah)+'and  id='+inttostr(nID));
  end;
  List.Free;
end;

procedure TfmLoadZAH_CSV.cbTestClick(Sender: TObject);
begin
  if cbTest.Checked
    then btLoad.caption:='Проверить'
    else btLoad.caption:='Загрузить';
end;

procedure TfmLoadZAH_CSV.cbSetBookClick(Sender: TObject);
begin
  if cbSetBook.Checked and not cbFullProt.Checked
    then cbFullProt.Checked:=true;
end;

end.
