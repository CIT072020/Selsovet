unit fChVigrSpr;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrlsEh, OpisEdit, MetaTask, FuncPr,
  adscnnct, adstable, dBase, DataTask, ZipForge, FileCtrl, uUtilFiles, Db,
  adsdata, adsfunc, sasaIniFile, mVerInfo, u2zags, uCreateXML, reportTask,
  ToolEdit;

type
  TfmChVigrSpr = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    AdsConnection: TAdsConnection;
    Zip: TZipForge;
    Label3: TLabel;
    tbDesc: TAdsTable;
    tbDescBaseProp: TAdsTable;
    tbDescBaseTextProp: TAdsTable;
    tbDescHistZAGS: TAdsTable;
    tbDescSvidPovtor: TAdsTable;
    tbDescSprNames: TAdsTable;
    edPath: TDirectoryEdit;
  private
    procedure GetStrDate( var strDate1, strDate2 : String);
    procedure GetDate( var d1, d2 : TDateTime);
  public
    FPath : String;
    constructor Create( Owner : TComponent); override;
    procedure UpdateActions; override;
    procedure CleateListDisk;
    function GetDiskFree(strDisk : String) : Int64;
    procedure CopyBaseFiles;
    function WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
  end;

  procedure RunVigrSpr;

implementation

var
  fmChVigrSpr: TfmChVigrSpr;

{$R *.DFM}

{ TfmChVigrSpr }

procedure RunVigrSpr;
begin
  fmChVigrSpr := TfmChVigrSpr.Create(nil);
  try
    if fmChVigrSpr.ShowModal = mrOk then begin
      fmChVigrSpr.CopyBaseFiles;
    end;
  finally
    fmChVigrSpr.Free;
  end;
end;

procedure TfmChVigrSpr.CopyBaseFiles;
var
  strVersionZAGS,strDate1,strDate2, strDisk : String;
  dDate1,dDate2:TDateTime;
  sl : TStringList;
  i,j : Integer;
  n,m : Int64;
  strPath,s,IDPodr,IDZags : String;
  lCopy,lAutoInc : Boolean;
  nFree : TLargeInteger;
  Ini : TSasaIniFile;
  VerInfo: TVerInfo;
  arrCountDok : array of Integer;
  fld : TField;
  strFieldName : String;
  slOpis, slType : TStringList;
  tbSource : TAdsTable;
  lCloseMessage:Boolean;
  function GetNameFile : String;
  begin
    Result:='ОбщиеСправочникиЖКХ.zip'
  end;
begin
  IDZags := GlobalTask.ParamAsString('ID');
  lCopy := false;
  slOpis := TStringList.Create;
  slType := TStringList.Create;
  for i:=0 to dmBase.SprMainBase.Count-1 do begin
    slOpis.AddObject(dmBase.SprMainBase.Strings[i], dmBase.GetTable(dmBase.SprMainBase.Strings[i]));
    slType.Add( IntToStr(dmBase.TypeObj_Spr) );
  end;
  SetLength(arrCountDok, dmBase.SprMainBase.Count);
  for i:=0 to Length(arrCountDok)-1 do begin
    arrCountDok[i]:= 0;
  end;
  GlobalTask.SetLastValueAsString('LAST_PATH_SPR', edPath.Text);

//  strPath := edPath.Text; // (Application.ExeName)+'Export';
  strPath := Application.ExeName+'Export';
  ForceDirectories(strPath);
  ClearDir(strPath,false);

  AdsConnection.ConnectPath := strPath;
  AdsConnection.IsConnected := true;
  lCloseMessage:=false;
  OpenMessage('Поиск информации ...        ','Выгрузка');
  try

    ChangeMessage('Выгрузка ...');
    for i:=0 to slOpis.Count-1 do begin
      dmBase.ScriptForCreateTable( TAdsTable(slOpis.Objects[i]).TableName, sl);
      AdsConnection.Execute( sl.Text );
    end;
    tbDesc.TableType := dmBase.tbMens.TableType;
    tbDesc.AdsTableOptions.AdsCharType := dmBase.tbMens.AdsTableOptions.AdsCharType;

    for i:=0 to slOpis.Count-1 do begin
      tbSource := TAdsTable(slOpis.Objects[i]);
      tbDesc.TableName := tbSource.TableName;
      tbDesc.Open;
      tbSource.Filtered:=false;
      if tbDesc.FieldByName('ID').DataType=ftAutoInc
        then lAutoInc:=true
        else lAutoInc:=false;
      while not tbSource.Eof do begin
        tbDesc.Append;
        arrCountDok[i] := arrCountDok[i] + 1;
        for j:=0 to tbDesc.FieldCount-1 do begin
          strFieldName := tbDesc.Fields[j].FieldName;
          if strFieldName='ID' then begin
            if not lAutoInc then begin
              tbDesc.Fields[j].Value:=tbSource.FieldByName('ID').Value;
            end;
          end else begin
            fld := tbSource.FindField(strFieldName);
            if (fld<>nil) and not fld.IsNull then begin
              tbDesc.Fields[j].Value:=fld.Value;
            end;
          end;
        end;
        tbDesc.Post;
        tbSource.Next;
      end;
      tbDesc.Close;
      tbSource.Filter:='';
      tbSource.Filtered:=false;
    end;
    AdsConnection.IsConnected:=false;
    j := 0;
    for i:=0 to slOpis.Count-1 do begin
      j := j + arrCountDok[i];
    end;
    if j > 0 then begin
      Ini := TSasaIniFile.Create(strPath+'\'+'spr.ini');
      Ini.WriteString('MAIN','KOD',GlobalTask.ParamAsString('ID'));
      Ini.WriteString('MAIN','DATE',DTOS(Now,tdClipper));
      Ini.WriteString('MAIN','TIME',FormatDateTime('hh:nn',Now));
      Ini.WriteString('MAIN','DATE1',strDate1);
      Ini.WriteString('MAIN','DATE2',strDate2);
      VerInfo:=TVerInfo.Create(Application.ExeName);
      Ini.WriteString('MAIN','VERSION',VerInfo.ProductVersion);
      Ini.WriteString('MAIN','BASE',dmBase.GetVersionBase(nil));
      Ini.WriteString('MAIN','VERSIONPROP','1');
      Ini.WriteString('MAIN','PODR',IDPodr);
      VerInfo.Free;
      for i:=0 to slOpis.Count-1 do begin
        Ini.WriteString('COUNT',TAdsTable(slOpis.Objects[i]).TableName,IntToStr(arrCountDok[i]));
      end;
      Ini.UpdateFile;
      Ini.Free;

      ChangeMessage('Архивирование ...');
      Zip.FileName := strPath+'\'+GetNameFile;
      Zip.BaseDir  := strPath;
      Zip.OpenArchive(fmCreate);
      Zip.AddFiles('*.*');
      Zip.CloseArchive;
      // копируем на носитель
      n := GetFileSize(Zip.FileName);
      if edPath.Enabled and (edPath.Text<>'') then begin
        ChangeMessage('Копирование на носитель ...');
//        strDisk := edDisk.Items[edDisk.ItemIndex];
        DeleteFiles(strPath+':\*.spr');
//        nFree := GetDiskFree(strDisk);
        if nFree < (n+m) then begin
          PutError(' На диске '+QStr(strDisk)+' не хватает места для размещения файла  !');
        end else begin
          if CopyFile(PChar(strPath+'\'+GetNameFile),
                      PChar(strDisk+':\'+GetNameFile), false) then begin
            lCopy := true;
          end else begin
            PutError('Ошибка копирования файла : '+strPath+'\'+GetNameFile+
                    #13+IntToStr(GetLastError)+'('+SysErrorMessage(GetLastError)+')');
          end;
        end;
      end;
      if lCopy then begin
        DeleteFiles(strPath+'\*.*');
        s :=' Выгрузка успешно завершена.';
      end else begin
        DeleteFiles(strPath+'\*.ini');
        DeleteFiles(strPath+'\*.adt');
        DeleteFiles(strPath+'\*.adm');
        DeleteFiles(strPath+'\*.adi');
        CloseMessage;
        lCloseMessage:=true;
      end;
    end else begin
      DeleteFiles(strPath+'\*.*');
    end;
  finally
    if not lCloseMessage
      then CloseMessage();
  end;
  slOpis.Free;
  if lCopy then begin
    ShowMessage(s);
  end;
end;

function TfmChVigrSpr.WriteProp( nIDSource, nIDDesc, nTypeObj : Integer) : Boolean;
begin
  Result := true;

  dmBase.tbSimpleProp.IndexName := 'PR_KEY';
  dmBase.tbSimpleProp.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not dmBase.tbSimpleProp.Eof do begin
    with tbDescBaseProp do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      FieldByName('DATES').AsDateTime := dmBase.GetDateCurrentSost;
      FieldByName('POKAZ').AsString := dmBase.tbSimpleProp.fieldByName('POKAZ').AsString;
      FieldByName('VALUE').AsString := dmBase.tbSimpleProp.fieldByName('VALUE').AsString;
      FieldByName('NVALUE').AsString := dmBase.tbSimpleProp.fieldByName('NVALUE').AsString;
      FieldByName('TYPESAVE').AsString := dmBase.tbSimpleProp.fieldByName('TYPESAVE').AsString;
      Post;
    end;
    dmBase.tbSimpleProp.Next;
  end;
  dmBase.tbSimpleProp.CancelRange;

  dmBase.tbSimplePropMemo.IndexName := 'PR_KEY';
  dmBase.tbSimplePropMemo.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not dmBase.tbSimplePropMemo.Eof do begin
    with tbDescBaseTextProp do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      FieldByName('DATES').AsDateTime := dmBase.GetDateCurrentSost;
      FieldByName('POKAZ').AsString := dmBase.tbSimplePropMemo.FieldByName('POKAZ').AsString;
      FieldByName('VALUE').AsString := dmBase.tbSimplePropMemo.FieldByName('VALUE').AsString;
      Post;
    end;
    dmBase.tbSimplePropMemo.Next;
  end;
  dmBase.tbSimplePropMemo.CancelRange;

  dmBase.tbHistoryZAGS.IndexName := 'PR_KEY';
  dmBase.tbHistoryZAGS.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not dmBase.tbHistoryZAGS.Eof do begin
    with tbDescHistZAGS do begin
      Append;
      FieldByName('TYPEOBJ').AsInteger := nTypeObj;
      FieldByName('ID').AsInteger := nIDDesc;
      FieldByName('DATEIZM').AsDateTime := dmBase.tbHistoryZAGS.fieldByName('DATEIZM').AsDateTime;
      FieldByName('FIELDNAME').AsString := dmBase.tbHistoryZAGS.fieldByName('FIELDNAME').AsString;
      FieldByName('VALUE').AsString := dmBase.tbHistoryZAGS.fieldByName('VALUE').AsString;
      FieldByName('NOMER').AsString := dmBase.tbHistoryZAGS.fieldByName('NOMER').AsString;
      FieldByName('DATEZ').AsDateTime := dmBase.tbHistoryZAGS.fieldByName('DATEZ').AsDateTime;
      Post;
    end;
    dmBase.tbHistoryZAGS.Next;
  end;
  dmBase.tbHistoryZAGS.CancelRange;

  dmBase.SvidPovtor.IndexName := 'PR_KEY';
  dmBase.SvidPovtor.SetRange([nTypeObj,nIDSource],[nTypeObj,nIDSource]);
  while not dmBase.SvidPovtor.Eof do begin
    with tbDescSvidPovtor do begin
      Append;
      FieldByName('SVID_TYPE').AsInteger  := nTypeObj;
      FieldByName('AKT_ID').AsInteger     := nIDDesc;
      FieldByName('SVID_DATE').AsDateTime := dmBase.SvidPovtor.fieldByName('SVID_DATE').AsDateTime;
      FieldByName('SVID_SERIA').AsString  := dmBase.SvidPovtor.fieldByName('SVID_SERIA').AsString;
      FieldByName('SVID_NOMER').AsString  := dmBase.SvidPovtor.fieldByName('SVID_NOMER').AsString;
      FieldByName('NAME_ZAGS').AsString   := dmBase.SvidPovtor.fieldByName('NAME_ZAGS').AsString;
      FieldByName('NAME_ZAGS_B').AsString := dmBase.SvidPovtor.fieldByName('NAME_ZAGS_B').AsString;
      Post;
    end;
    dmBase.SvidPovtor.Next;
  end;
  dmBase.SvidPovtor.CancelRange;

end;

function TfmChVigrSpr.GetDiskFree(strDisk : String) : TLargeInteger;
var
  FreeBytesAvailableToCaller: TLargeInteger;
  FreeSize: TLargeInteger;
  TotalSize: TLargeInteger;
begin
  GetDiskFreeSpaceEx(PChar(strDisk+':'),
    FreeBytesAvailableToCaller,
    Totalsize,
    @FreeSize);
  Result := FreeSize;
end;

constructor TfmChVigrSpr.Create(Owner: TComponent);
begin
  inherited;
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_YEARS',edGod.Items, edGod.KeyItems);
//  edGod.DropDownBox.Rows:=12;
//  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_MONTH',edNomerPeriod.Items, edNomerPeriod.KeyItems);
//  CleateListDisk;
end;

procedure TfmChVigrSpr.CleateListDisk;
  var
  c : Char;
  d : DWORD;
  s : String;
  n,i : Integer;
begin
{
  d := GetLogicalDrives;
  edDisk.Items.Clear;
  edDisk.KeyItems.Clear;
  i:=1;
  for c:='A' to 'Z' do begin
    if (d and 1)<>0 then begin
      n := GetDriveType(PChar(c + ':/'));
      if n=DRIVE_REMOVABLE then begin
        edDisk.Items.Add(c);
        edDisk.KeyItems.Add(IntToStr(i));
      end;
    end;
    d := d shr 1;
    Inc(i,1);
  end;
  if edDisk.Items.Count > 0 then begin
    s := GlobalTask.GetLastValueAsString('DISK_VIGR_ZAGS');
    edDisk.ItemIndex := 0;
    n := edDisk.Items.IndexOf(s);
    if n > -1 then begin
      edDisk.ItemIndex := n;
    end;
  end else begin
    edDisk.ItemIndex := -1;
    edDisk.Enabled := false;
  end;
}
end;

procedure TfmChVigrSpr.GetStrDate( var strDate1, strDate2 : String);
var
  s : String;
  strDay : String;
  n1, n2 : Integer;
begin
  strDate1 := '';
  strDate2 := '';
  {
  s := edGod.KeyItems[edGod.ItemIndex];
  if rbMonth.Checked then begin
    strDate1 := s + PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0') +
                '01';
    strDay := IntToStr(CountDays( s, edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex]));
    strDate2 := s + PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0')
                + strDay;
  end else if rbKv.Checked then begin
    n1 := (StrToInt(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex])-1)*3+1;
    n2 := n1 + 2;
    strDate1 := s + PadLInt(n1,2,'0') + '01';
    strDay := IntToStr(CountDays( s, n2));
    strDate2 := s + PadLInt(n2,2,'0') + strDay;
  end else if rbYear.Checked then begin
    strDate1 := s;
  end;
  }
end;

procedure TfmChVigrSpr.GetDate( var d1, d2 : TDateTime);
var
  s,s1,s2 : String;
  strDay : String;
  n1, n2 : Integer;
begin
{
  s := edGod.KeyItems[edGod.ItemIndex];
  if rbMonth.Checked then begin
    s1 := s + PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0') +
                '01';
    strDay := IntToStr(CountDays( s, edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex]));
    s2 := s + PadLStr(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex],2,'0')
                + strDay;
  end else if rbKv.Checked then begin
    n1 := (StrToInt(edNomerPeriod.KeyItems[edNomerPeriod.ItemIndex])-1)*3+1;
    n2 := n1 + 2;
    s1 := s + PadLInt(n1,2,'0') + '01';
    strDay := IntToStr(CountDays( s, n2));
    s2 := s + PadLInt(n2,2,'0') + strDay;
  end else if rbYear.Checked then begin
    s1 := s+'0101';
    s2 := s+'1231';
  end;
  d1 := STOD(s1,tdClipper);
  d2 := STOD(s2,tdClipper);
  }
end;

procedure TfmChVigrSpr.UpdateActions;
begin
  inherited;
end;

end.
