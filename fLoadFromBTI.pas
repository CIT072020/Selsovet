unit fLoadFromBTI;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uProject, uCheckKod, uTypes,
  Dialogs, DB, adsdata, adsfunc, adstable, adscnnct, StdCtrls, Mask, funcPr, QStrings, Consts,
  DBCtrlsEh, ComObj, kbmMemTable, Grids, DBGrids, ToolEdit, ExtCtrls, Metatask,
  ComCtrls, ValEdit;

type
  TfmLoadFromBTI = class(TForm)
    ChFile: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cbCheckExit: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    edFile: TDBEditEh;
    gbProtokol: TGroupBox;
    edDebug: TMemo;
    Panel2: TPanel;
    Button1: TButton;
    lbZagr: TLabel;
    lbProp: TLabel;
    vlGrafs: TValueListEditor;
    edRow1: TDBNumberEditEh;
    Label4: TLabel;
    Label5: TLabel;
    edRow2: TDBNumberEditEh;
    Label6: TLabel;
    Label7: TLabel;
    edGraf1: TDBEditEh;
    edGraf2: TDBEditEh;
    Button2: TButton;
    Panel3: TPanel;
    btCopyToClipboard: TButton;
    Button3: TButton;
    cbDeleteAll: TCheckBox;
    cbSeekFIO: TCheckBox;
    cbLoadError: TCheckBox;
    cbShowExcel: TCheckBox;
    cbNotIN_SeekFIO: TCheckBox;
    cbDelMen: TCheckBox;
    cbWriteIN: TCheckBox;
    cbTypeDateR: TComboBox;
    Label2: TLabel;
    cbLoadEmpty: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure edFileEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure vlGrafsValidate(Sender: TObject; ACol,  ARow: Integer; const KeyName, KeyValue: String);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCopyToClipboardClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cbDeleteAllClick(Sender: TObject);
    procedure cbNotIN_SeekFIOClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    grNomer,grFam,grName,grOtch,grDateR,grIN,grKadastr,grAdres,grPlosh,grDest,grPravo,grTail,grDateRP,grDatePP,grPrim:Integer;
    sNomer,sFam,sName,sOtch,sDateR,sIN,sKadastr,sAdres,sPlosh,sDest,sPravo,sTail,sDateRP,sDatePP,sPrim:String;
    dDateR,dDateRP,dDatePP:TDateTime;
    FLoadAll:Boolean;
    sError:String;
    FExit:Boolean;
    FError:Boolean;
    XL:Variant;
    FCount:Integer;
    FListSeek:TStringList;
    Mens:TAdsTable;
    Ochered:TAdsTable;
    FDeleteMens:TStringList;
    procedure SetNomerGraf;
    function SeekMenFIO(var lSeek:Boolean):Boolean;
    function SeekMen(var lSeek:Boolean):Boolean;
    function GetDate(sDate:String; var dDate : TDateTime):Boolean;
    function LoadOne:Boolean;
    function AddMenToBase(sMen:String):Boolean;
  end;

  procedure LoadFromBTI;

implementation

uses fMain, dBase, DateUtils;

{$R *.dfm}

//-----------------------------------------------------------
procedure LoadFromBTI;
var
  fmLoad: TfmLoadFromBTI;
begin
  fmLoad:=TfmLoadFromBTI.Create(nil);
  fmLoad.Mens:=dmBase.tbMens;
  fmLoad.Ochered:=dmBase.tbOchered;
  try
    fmLoad.ShowModal;
  finally
    fmLoad.Free;
  end;
end;

//-----------------------------------------------------------
procedure TfmLoadFromBTI.FormCreate(Sender: TObject);
begin
  FListSeek:=TStringList.Create;
  FDeleteMens:=TStringList.Create;
end;

//-----------------------------------------------------------
procedure TfmLoadFromBTI.FormDestroy(Sender: TObject);
begin
  FListSeek.Free;
  FDeleteMens.Free;
end;

//-----------------------------------------------------------
procedure TfmLoadFromBTI.SetNomerGraf;
  function getN(i:Integer):Integer;
    begin result:=StrToInt(vlGrafs.Strings.ValueFromIndex[i]) end;
begin
  grNomer:=getN(0);
  grFam:=getN(1);
  grName:=getN(2);
  grOtch:=getN(3);
  grDateR:=getN(4);
  grIN:=getN(5);
  grKadastr:=getN(6);
  grAdres:=getN(7);
  grPlosh:=getN(8);
  grDest:=getN(9);
  grPravo:=getN(10);
  grTail:=getN(11);
  grDateRP:=getN(12);
  grDatePP:=getN(13);
  grPrim:=getN(14);
end;

//-----------------------------------------------------------
procedure TfmLoadFromBTI.Button1Click(Sender: TObject);
var
  arr,v:Variant;
  n,i,j,t,nn,nProp,nLoad:Integer;
  c:String;
  lErr,lDel:Boolean;
                 
begin
  {$IFDEF OCHERED}
    FLoadAll:=true;
  {$ELSE}
    FLoadAll:=false;
  {$ENDIF}
  if (edFile.Text='') then begin
    PutError('Введите имя файла загрузуи',self);
    exit;
  end;
  if not FileExists(edFile.Text) then begin
    PutError('Файл '+edFile.Text+' не найден',self);
    exit;
  end;

  try
    try XL := GetActiveOleObject('Excel.Application');
    except XL := CreateOleObject('Excel.Application');
  end;
    except
      raise Exception.Create('Hе могy запyстить Excel');
  end;
  edDebug.Clear;
  FDeleteMens.Clear;

  try
    xl.Workbooks.Add(edFile.Text);
  except
    on E: Exception do begin
      PutError('Ошибка открытия файла'+#13#10+E.Message,self);
      lErr:=true;
      edDebug.Lines.Add(E.Message);
    end;
  end;

  if cbShowExcel.Checked
    then xl.Visible:=true;
  lErr:=false;
  try
    arr:=XL.Range[Trim(edGraf1.Text)+Trim(edRow1.Text)+':'+Trim(edGraf2.Text)+Trim(edRow2.Text)].value;
  except
    on E: Exception do begin
      lErr:=true;
      edDebug.Lines.Add(E.Message);
    end;
  end;
  if lErr then exit;

  n := VarArrayDimCount(arr);
  if n <> 2 then begin
    lErr:=true;
  end;
  if lErr then exit;

  SetNomerGraf;

  if cbDeleteAll.Checked then begin
    dmBase.tbMensSobst.Active:=false;
    dmBase.AdsConnection.CloseCachedTables;
    try
      GlobalTask.LogFile.WriteToLogFile('Удаление списка собственников из БТИ.');
      lDel:=false;
      try
        dmBase.AdsConnection.Execute('EXECUTE PROCEDURE sp_ZapTable('+QStr('НаселениеСобств')+')'); //'DELETE FROM НаселениеСобств');
        lDel:=true;
      except
      end;
      if not lDel then begin
        dmBase.AdsConnection.Execute('DELETE FROM НаселениеСобств');
      end;
      GlobalTask.LogFile.WriteToLogFile('Список собственников из БТИ удален.');
    finally
      dmBase.tbMensSobst.Active:=true;
    end;
  end;
  lbZagr.Caption:='Загружено 0     ';
  lbProp.Caption:='Пропущено 0     ';
  Application.ProcessMessages;
  Application.BringToFront;
  nProp:=0;
  nLoad:=0;
  FExit:=false;
  nn:=0;
  GlobalTask.LogFile.WriteToLogFile('Начало загрузки списка собственников из БТИ.');
  for i:=VarArrayLowBound(arr,1) to VarArrayHighBound(arr,1) do begin
    c := inttostr(i)+'=  ';
    sError:='';
    for j:=VarArrayLowBound(arr,2) to VarArrayHighBound(arr,2) do begin
      t := VarType(arr[i,j]);
      if (t=VarNull) or (t=VarEmpty) then begin
        v:=null;
      end else begin
        v:=arr[i,j];
      end;
      if (v=null) or (trim(vartostr(v))='') then begin
        v:='';
      end else begin
        v:=VarToStr(arr[i,j]);
      end;
      if      j=grNomer then    //1
        sNomer:=v
      else if j=grFam then      //2
        sFam:=v
      else if j=grName then    //3
        sNAME:=v
      else if j=grOtch then    //4
        sOTCH:=v
      else if j=grDATER then   //5
        sDATER:=trim(v)
      else if j=grIN then      //6
        sIN:=CheckRus2(trim(v))
      else if j=grKADASTR then  //7
        sKADASTR:=Trim(v)
      else if j=grAdres then    //8
        sADRES:=v
      else if j=grPlosh then    //9         
        sPLOSH:=v
      else if j=grDest then    //10
        sDEST:=v
      else if j=grPravo then   //11
        sPRAVO:=v
      else if j=grTail then    //12
        sTAIL:=v
      else if j=grDateRP then  //13
        sDATERP:=v
      else if j=grDatePP then  //14
        sDATEPP:=v
      else if j=grPrim then    //15
        sPRIM:=v;
//      c := c + '('+ inttostr(t) + ') '+v + ';';
    end;
//    if (j=grDateRP) and (sdaterp<>'') then begin
//      edDebug.Lines.add(sdaterp);
//    end;
    if LoadOne then begin
      nLoad:=nLoad+1;
    end else begin
      if not FExit then begin
        if sError<>'' then  edDebug.Lines.Add(sError);
        nProp:=nProp+1;
      end else begin
        break;
      end;
    end;
    nn:=nn+1;
    if nn>100 then begin
      lbZagr.Caption:='Загружкно '+IntToStr(nLoad);
      lbProp.Caption:='Пропущено '+IntToStr(nProp);
      Application.ProcessMessages;
    end;

//    edDebug.Lines.Add(c);
//    edDebug.Lines.Add('--------------------');
  end;
  lbZagr.Caption:='Загружкно '+IntToStr(nLoad);
  lbProp.Caption:='Пропущено '+IntToStr(nProp);
  Application.ProcessMessages;
  GlobalTask.LogFile.WriteToLogFile('Окончание загрузки списка собственников из БТИ.');
  xl:=null;
end;

{
      if (j=grKADASTR) then begin
        ss:=VarToStr(arr[i,j]);
        if not IsAllDigit(copy(ss,1,1)) and (ss<>'') then begin
//          m:=edDebug.Lines.IndexOf(AnsiUppercase(trim(ss)));
          m:=-1;
          for n:=0 to edDebug.Lines.Count-1 do begin
            if MySameText( edDebug.Lines.Strings[n], Trim(ss)) then begin
              m:=n;
              break;
            end;
          end;
          if m=-1 then begin
            edDebug.Lines.Add(ss);
            lbZagr.Caption:=inttostr(i);
            Application.ProcessMessages;
          end;
        end;
      end;
}
//------------------------------------------------------------------------------------
function TfmLoadFromBTI.SeekMenFIO(var lSeek:Boolean):Boolean;
var
  sID:String;
  lAdd:Boolean;
begin
  Result:=false;
  FListSeek.Clear;
  Mens.IndexFieldNames:='FAMILIA;NAME;OTCH';     // FIO_KEY
  Mens.SetRange([sFam,sName,sOtch], [sFam,sName,sOtch]);
  lSeek:=false;
  while not Mens.Eof do begin
    lAdd:=false;
    {$IFDEF OCHERED}
      if Mens.FieldByName('ID_BASE').AsInteger=0 then begin
        sID:=Mens.FieldByName('ID').AsString;
        lAdd:=true;
      end;
    {$ELSE}
       sID:=Mens.FieldByName('ID').AsString;
       if Mens.FieldByName('OCHERED').AsBoolean or FLoadAll then begin
         lAdd:=true;
       end else begin
         if dmBase.tbSostavSem.Locate('MEMBER_ID', sID, []) then begin
           lAdd:=true;
         end;
       end;
    {$ENDIF}
    if lAdd then begin
      if (dDateR>0) and not Mens.FieldByName('DATER').IsNull then begin
        case cbTypeDateR.ItemIndex of
          //полное совпадение
          0: if Mens.FieldByName('DATER').AsDateTime=dDateR then lAdd:=true else lAdd:=false;
          //только год
          1: if YearOf(Mens.FieldByName('DATER').AsDateTime)=YearOf(dDateR) then lAdd:=true else lAdd:=false;
          //не проверять
          2: lAdd:=true;
        end;
      end;
    end;
    if lAdd then begin
      lSeek:=true;
      FListSeek.Add(sID);
    end;
    Mens.Next;
  end;
  Mens.CancelRange;
  if FListSeek.Count>0
    then Result:=true;
end;
//---------------------------------------------------------------------------
function TfmLoadFromBTI.SeekMen(var lSeek:Boolean):Boolean;
begin
  Result:=false;
  lSeek:=false;
  FListSeek.Clear;
  Mens.IndexFieldNames:='DATE_FIKS;LICH_NOMER';    // IN_KEY
  Mens.SetRange([dmBase.GetDateCurrentSost,sIN],[dmBase.GetDateCurrentSost,sIN]);
  while not Mens.Eof do begin
    {$IFDEF OCHERED}
      if Mens.FieldByName('ID_BASE').AsInteger=0 then begin
        lSeek:=true;
        FListSeek.Add(Mens.FieldByName('ID').AsString);
      end;
    {$ELSE}
      lSeek:=true;
      if Mens.FieldByName('OCHERED').AsBoolean or FLoadAll then begin
        FListSeek.Add(Mens.FieldByName('ID').AsString);
      end else begin
        if dmBase.tbSostavSem.Locate('MEMBER_ID', Mens.FieldByName('ID').AsInteger, []) then begin
          FListSeek.Add(Mens.FieldByName('ID').AsString);
        end;
      end;
    {$ENDIF}
    Mens.Next;
  end;
  Mens.CancelRange;
  if FListSeek.Count>0
    then Result:=true;
end;

//------------------------------------------------------------------------------------
function TfmLoadFromBTI.GetDate(sDate:String; var dDate : TDateTime):Boolean;
begin
  Result:=false;
  if (sDate<>'') and IsAllDigit(Copy(sDate,1,2)) then begin
    try
      dDate:=EncodeDate(StrToInt(copy(sDate,7,4)),StrToInt(copy(sDate,4,2)),StrToInt(copy(sDate,1,2)));
      Result:=true;
    except
      dDate:=0;
       // ???
    end;
  end else begin
    dDate:=0;
  end;
end;
//-----------------------------------------------------------
function TfmLoadFromBTI.AddMenToBase(sMen:String):Boolean;
var
  i:Integer;
  nID:Integer;
  f:Extended;
  lErr:Boolean;
begin
  Result:=true;

  if Result then begin
    if IsAllDigit(Copy(sKadastr,1,1)) then begin  // реальный кадастровый номер

    end else begin   // какой-то текст
      sPrim:=sKadastr;
      sKadastr:='-';
    end;

    if not cbDeleteAll.Checked and cbDelMen.Checked then begin
      for i:=0 to FListSeek.Count-1 do begin
        // если еще не удаляли информацию по человеку
        if FDeleteMens.IndexOf(FListSeek.Strings[i])=-1 then begin
          try
            dmBase.AdsConnection.Execute('delete from НаселениеСобств where id='+FListSeek.Strings[i]);
            FDeleteMens.Add(FListSeek.Strings[i]);  // если у человека несколько строк в excel-файле что-бы удалять только один раз
          except
            on E: Exception do begin
              edDebug.Lines.Add(E.Message);
            end;
          end;
        end;
      end;
    end;

    for i:=0 to FListSeek.Count-1 do begin
      nID:=StrToInt(FListSeek.Strings[i]);
      dmBase.tbMensSobst.IndexFieldNames:='ID;KADASTR';
      if dmBase.tbMensSobst.FindKey([nID,sKadastr]) then begin
        dmBase.tbMensSobst.Edit;
      end else begin
        dmBase.tbMensSobst.Append;
        dmBase.tbMensSobst.FieldByName('ID').AsInteger:=nID;
        dmBase.tbMensSobst.FieldByName('KADASTR').AsString:=sKadastr;
      end;
      dmBase.tbMensSobst.FieldByName('PRAVO').AsString:=sPravo;
      dmBase.tbMensSobst.FieldByName('PRIM').AsString:=sPrim;
      dmBase.tbMensSobst.FieldByName('ADRES').AsString:=sAdres;
      dmBase.tbMensSobst.FieldByName('DEST').AsString:=sDest;
      dmBase.tbMensSobst.FieldByName('TAIL').AsString:=sTail;
      if dDateRP>0 then dmBase.tbMensSobst.FieldByName('DATER').AsDateTime:=dDateRP;
      if dDatePP>0 then dmBase.tbMensSobst.FieldByName('DATEP').AsDateTime:=dDatePP;
      if sPlosh<>'' then begin
        lErr:=false;
        f:=0;
        try
          f:=StrToFloatMy(sPlosh, '.');
        except
          lErr:=true;
        end;
        if lErr then begin
          lErr:=false;
          try
            f:=StrToFloatMy(sPlosh, ',');
          except
            lErr:=true;
          end;
        end;
        if not lErr then
          dmBase.tbMensSobst.FieldByName('PLOSH_ALL').AsFloat:=f;
      end;
      dmBase.tbMensSobst.Post;

      if cbWriteIN.Checked and cbWriteIN.Enabled and (sIN<>'') then begin
        if Mens.Locate('DATE_FIKS;ID', VarArrayOf([dmBase.GetDateCurrentSost,nID]),[]) then begin
          if Mens.FieldByName('LICH_NOMER').AsString='' then begin
            Mens.Edit;
            Mens.FieldByName('LICH_NOMER').AsString:=sIN;
            Mens.Post;
            dmBase.AdsConnection.Execute('update SostavSem SET LICH_NOMER='+QStr(sIN)+' where MEMBER_ID='+IntToStr(nID));
            edDebug.Lines.Add('>>записан базу ИН:'+sMen);
          end;
        end;

      end;

    end;
  end;
end;
{
function TForm1.GetLocaleInformation(Flag: Integer): string;
var
  pcLCA: array [0..20] of Char;
begin
  if GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, Flag, pcLCA, 19) <= 0 then
    pcLCA[0] := #0;
  Result := pcLCA;
end;
}
{
в базе данных информации не найдено
не указан идентификационный номер!
ошибка в поле "Идентификационный номер": идентификационный номер должен иметь размер 14 символов!
не указана дата рождения!
ошибка: в поле "Фамилия" содержится недопустимый символ! (запрос на добрачную фамилию должен оформляться отдельной строкой)
}
{  sNomer sFam sNAME sOTCH sDATER sIN sKADASTR sADRES sPLOSH sDEST sPRAVO sTAIL sDATERP sDATEPP sPRIM }
//-----------------------------------------------------------
function TfmLoadFromBTI.LoadOne:Boolean;
var
  d:TDateTime;
  s:String;
  lSeek:Boolean;
begin
  sError:='';
  Result:=true;
  FListSeek.Clear;
  FError:=false;

  // контроль конца данных
  if cbCheckExit.Checked then begin
    if (sNomer='') and (sFam='') and (sOtch='') then begin
      FExit:=true;
      Result:=false;
      exit;
    end;
  end;

  if (Copy(sKadastr,1,7)='не указ') or (Copy(sKadastr,1,6)='ошибка') then begin
    FError:=true;
  end;

  s:=sNomer+' '+sFam+' '+sName+' '+sOtch+' '+sDateR+' '+sIN+' ';

  if GetDate(sDateR , d)  then dDateR:=d   else dDateR:=0;
  if GetDate(sDateRP, d)  then dDateRP:=d  else dDateRP:=0;
  if GetDate(sDatePP, d)  then dDatePP:=d  else dDatePP:=0;

  if not cbLoadEmpty.Checked then begin
    if Pos('не найдено', AnsiLowerCase(sKadastr))>0 then begin
      sError:='не загружен    : '+s+sKadastr;
      Result:=false;
      exit;
    end;
    if dDatePP>0 then begin
      sError:='не загружен    : '+s+', дата прекращения '+DatePropis(dDatePP,3);
      Result:=false;
      exit;
    end;
  end;

  if FError and not cbLoadError.Checked then begin   // если строка sKadastr содержит ошибку, и ошибки грузить не надо
    sError:='не загружен    : '+s+sKadastr;
    Result:=false;
    exit;
  end;

  if (sIN='') or (sIN='нет данных') then begin  // нет номера идентификации
    if cbSeekFIO.Checked then begin
      if SeekMenFIO(lSeek) then begin
        if lSeek then
          AddMenToBase(s);
      end else begin
        sError:='не наден по ФИО: '+s+sKadastr;
        Result:=false;
      end;
    end else begin
      sError:='отсутствует ИН : '+s+sKadastr;
      Result:=false;
      {
      if (sTail='') and (sAdres='') and (sDest='') and (sPravo='') then begin
        sError:=sKadastr;
        Result:=false;
        exit;
      end;
      }
    end;

  end else begin
    if SeekMen(lSeek) then begin
      if lSeek then AddMenToBase(s);
    end else begin
      if cbNotIN_SeekFIO.Checked and not lSeek then begin
        if SeekMenFIO(lSeek) then begin
          if lSeek then AddMenToBase(s);
        end else begin
          sError:='не наден по ИН и ФИО: '+s+sKadastr;
          Result:=false;
        end;
      end else begin
        sError:='не наден по ИН : '+s+sKadastr;
        Result:=false;
      end;
      {
      if (sTail='') and (sAdres='') and (sDest='') and (sPravo='') then begin
        sError:=s+sKadastr;
        Result:=false;
      end else begin
        sError:=s+sKadastr;
        Result:=false;
      end;
      }
    end;
  end;
end;

//-----------------------------------------------------------
procedure TfmLoadFromBTI.edFileEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if ChFile.Execute then begin
    edFile.Text:=ChFile.FileName;
//    s:=ExtractFileName(ChFile.FileName);
  end;
end;

//-----------------------------------------------------------
procedure TfmLoadFromBTI.vlGrafsValidate(Sender: TObject; ACol, ARow: Integer; const KeyName, KeyValue: String);
var
  n:Integer;
begin
  try
    n:=StrToInt(KeyValue);
  except
    n:=0
  end;
  if (n<=0) or (n>30) then begin
    raise EMyError.Create('Неверное значение <'+KeyValue+'>');
  end;
end;

//-----------------------------------------------------------
procedure TfmLoadFromBTI.Button2Click(Sender: TObject);
begin
  SetNomerGraf;
end;

//-----------------------------------------------------------
procedure TfmLoadFromBTI.btCopyToClipboardClick(Sender: TObject);
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


procedure TfmLoadFromBTI.Button3Click(Sender: TObject);
begin
  Label4.Enabled:=true;
  Label5.Enabled:=true;
  Label6.Enabled:=true;
  Label7.Enabled:=true;
  edGraf1.Enabled:=true;
  edGraf2.Enabled:=true;
  edRow1.Enabled:=true;
  edRow2.Enabled:=true;
  cbCheckExit.Enabled:=true;
  vlGrafs.Enabled:=true;
end;

procedure TfmLoadFromBTI.cbDeleteAllClick(Sender: TObject);
begin
  cbDelMen.Enabled:=not cbDeleteAll.Checked;
end;

procedure TfmLoadFromBTI.cbNotIN_SeekFIOClick(Sender: TObject);
begin
  cbWriteIN.Enabled:=cbNotIN_SeekFIO.Checked;
end;

end.
