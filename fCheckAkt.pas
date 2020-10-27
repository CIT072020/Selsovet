unit fCheckAkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, OpisEdit, MetaTask,
  Dialogs, fSimpleDialog, StdCtrls, CheckLst, Buttons, ExtCtrls, Mask, FuncPr, uProject, fWarning,
  DBCtrlsEh;

type
  TfmCheckAkt = class(TfmSimpleDialog)
    cbTypes: TCheckListBox;
    Label1: TLabel;
    lbDate1: TLabel;
    lbDate2: TLabel;
    edDate1: TDBDateTimeEditEh;
    edDate2: TDBDateTimeEditEh;
    cbRun: TCheckBox;
    cbDate: TCheckBox;
    lbZags: TLabel;
    cbZags: TCheckBox;
    edZags: TDBEditEh;
    lbPodr: TLabel;
    cbPodr: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edZagsEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure btOkClick(Sender: TObject);
    procedure cbDateClick(Sender: TObject);
    procedure cbZagsClick(Sender: TObject);
    procedure cbRunClick(Sender: TObject);
  private
    FRunType: Integer;
    FNameType:String;
    procedure SetRunType(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    FZAGS:Integer;
    FDate1:TDateTime;
    FDate2:TDateTime;
    slTypes:TStringList;
    slPodr:TStringList;
    property RunType:Integer read FRunType write SetRunType;
    procedure RunCheck;
    procedure RunDelete;
    procedure ReadNameZags(nID:Integer);

  end;

  procedure CheckDublAkt;
  procedure DeleteAkt;

implementation

{$R *.dfm}

uses dBase, fMain;

const
  RUN_DELETE=1;
  RUN_DUBLICATE=2;

//-----------------------------------------------------
procedure CheckDublAkt;
var
  fm: TfmCheckAkt;
begin
  fm:=TfmCheckAkt.Create(nil);
  fm.RunType:=RUN_DUBLICATE;
  try
    if fm.ShowModal=mrOk then begin
      fm.RunCheck;
    end;
  finally
    fm.Free;
  end;
end;
//-----------------------------------------------------
procedure DeleteAkt;
var
  fm: TfmCheckAkt;
begin
  fm:=TfmCheckAkt.Create(nil);
  fm.RunType:=RUN_DELETE;
  try
    if fm.ShowModal=mrOk then begin
      fm.RunDelete;
    end;
  finally
    fm.Free;
  end;
end;
//-----------------------------------------------------
procedure TfmCheckAkt.SetRunType(const Value: Integer);
var
  i:Integer;
  d1,d2:TDateTime;
begin
  FDate1:=0;
  FDate2:=0;
  FRunType:=Value;
  if Value=RUN_DELETE then begin
    FNameType:='DEL';
    Caption:='Удалить записи актов';
    cbRun.Caption:='Все записи';
    cbRun.Checked:=true;
  end else begin  // RUN_DUBLICATE
    FNameType:='DUBL';
    Caption:='Проверка дублирования записей актов';
    cbRun.Caption:='Удалить дубликаты';
    cbRun.Checked:=false;
    cbPodr.Visible:=false;
    lbPodr.Visible:=false;
  end;
  i:=GlobalTask.GetLastValueAsInteger('CHECK_'+FNameType+'_ZAGS');
  ReadNameZags(i);
  d1:=GlobalTask.GetLastValueAsDate('CHECK_'+FNameType+'_DATE1',false);
  d2:=GlobalTask.GetLastValueAsDate('CHECK_'+FNameType+'_DATE2',false);
  if (d1>0) and (d2>0) then begin
    edDate1.Value:=d1;
    edDate2.Value:=d2;
    FDate1:=d1;
    FDate2:=d2;
  end;
end;
//-----------------------------------------------------
procedure TfmCheckAkt.FormCreate(Sender: TObject);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  inherited;
  FZAGS:=0;
  slPodr:=TStringList.Create;
  slTypes:=TStringList.Create;
  cbTypes.Clear;
  Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL');
  for i:=0 to Opis.Items.Count-1 do begin
    cbTypes.Items.Add(Opis.Items[i]);
    cbTypes.Checked[i]:=true;
    slTypes.Add(Opis.KeyList[i]);
  end;
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_PODR_ZAGS');
  for i:=0 to Opis.Items.Count-1 do begin
    cbPodr.Items.Add(Opis.Items[i]);
    slPodr.Add(Opis.KeyList[i]);
  end;
end;

procedure TfmCheckAkt.FormDestroy(Sender: TObject);
begin
  slTypes.Free;
  slPodr.Free;
  inherited;
end;
//-----------------------------------------------------------
procedure TfmCheckAkt.RunDelete;
var
  sAkt,sTableName,sWhere,s,ss,sSQL,sSQLC:String;
  m,i,nTypeObj:Integer;
  slPar:TStringList;
begin
  if not dmBase.LoadSQL('Удаление_записей_актов', s) then begin
    PutError('Ошибка загрузки запроса на удаление.');
    exit;
  end;
  sSQL:='';
  sSQLC:='';
//  sAkt:='';
//  m:=0;
  for i:=0 to cbTypes.Items.Count-1 do begin
    if cbTypes.Checked[i] then begin
//      m:=m+1;
      nTypeObj:=StrToInt(slTypes.Strings[i]);
      sTableName:=dmBase.NameTableFromTypeObj(nTypeObj);
      sWhere:='';
      if (FDate1>0) and (FDate2>0) then
        sWhere:=sWhere+' and DATEZ>='+DateToSQL(FDate1)+' and DATEZ<='+DateToSQL(FDate2);
      if cbZags.Checked and (FZAGS>0) then
        sWhere:=sWhere+' and ID_ZAGS='+IntToStr(FZAGS);
      if not cbRun.Checked and (cbPodr.ItemIndex>-1) then
        sWhere:=sWhere + ' and PODR='+slPodr.Strings[cbPodr.ItemIndex];
      if sWhere<>'' then sWhere:=Copy(sWhere,5,Length(sWhere));
      ss:=s;
      ss:=StringReplace(ss, '&ADD_WHERE&', sWhere, [rfReplaceAll, rfIgnoreCase]);
      ss:=StringReplace(ss, '&TABLE_NAME&', sTableName, [rfReplaceAll, rfIgnoreCase]);
      ss:=StringReplace(ss, '&TYPE_OBJ&', IntToStr(nTypeObj), [rfReplaceAll, rfIgnoreCase]);
      sSQL:=sSQL+'//------ '+cbTypes.Items[i]+#13#10+ss+#13#10;
//      sAkt:=sAkt+cbTypes.Items[i]+', ';
      sSQLC:=sSQLC+'SELECT '+QStr(cbTypes.Items[i])+' stype , count(*) FROM '+sTableName+' WHERE '+sWhere+#13#10+' union all '+#13#10;
    end;
  end;
  OpenMessage('Поиск информации ...','');
  sSQLC:=Copy(sSQLC,1,Length(sSQLC)-13);
  MemoWrite('last.sql',sSQLC);
  sAkt:='';
  s:='';
  m:=0;
  try
    with dmBase.WorkQuery do begin
      SQL.Text:=sSQLC;
      Open;
      while not Eof do begin
//        if Fields[1].AsInteger>0 then  begin
        sAkt:=sAkt+Fields[0].AsString+': '+Fields[1].AsString+#13;
        m:=m+Fields[1].AsInteger;
//        end;
        Next;
      end;
      Close;
    end;
  except
    on E: Exception do begin
      s:='Ошибка подсчета количества'+Chr(13)+E.Message;
    end;
  end;
  CloseMessage;
  if s<>''
    then PutError(s);

  if m=0 then begin
    if s=''
      then ShowMessage('Для удаления не найдено ни одной записи.');
  end else begin
    s := '';
    s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
    s := s + 'Будут удалены записи актов в количестве: '#13+sAkt+#13;
    if (FDate1>0) and (FDate2>0)
      then s := s + 'За период: c '+DatePropis(FDate1,3)+' по '+DatePropis(FDate2,3)+#13;
    if cbZags.Checked and (FZags>0)
      then s := s + 'Орган ЗАГС: '+edZAGS.Text+#13;
    if not cbRun.Checked and (cbPodr.ItemIndex>-1)
      then s := s + 'Подразделение: '+cbPodr.Items[cbPodr.ItemIndex]+#13;
    slPar:=TStringList.Create;
    slPar.Add('HEIGHT=370');
    s:=s+'+lbYes';
    if OkWarningPar(s, slPar) then begin
      s:='';
      OpenMessage('Удаление информации из базы ...','');
      try
        MemoWrite('last.sql',sSQL);
        dmBase.AdsConnection.Execute(sSQL);
    //   sleep(1000);
      except
        on E: Exception do begin
          s:='Ошибка удаления информации'+Chr(13)+E.Message;
        end;
      end;
      CloseMessage;
      if s<>'' then PutError(s);
    end;
  end;
end;
//----------------------------------------------------------
procedure TfmCheckAkt.RunCheck;
var
  sl:TStringList;
  i,n:Integer;
begin
  sl:=TStringList.Create;
  for i:=0 to cbTypes.Items.Count-1 do begin
    if cbTypes.Checked[i] then begin
      sl.Add(slTypes.Strings[i]);
    end;
  end;
//  showmessage(sl.Text);
  if cbZags.Checked and (FZAGS>0)
    then n:=FZAGS else n:=0;
  dmBase.CheckDublZapis(sl, nil, n, cbRun.Checked, cbRun.Checked, true, FDate1, FDate2);
  sl.Free;
end;

procedure TfmCheckAkt.edZagsEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  nID:Integer;
begin
  if fmMain.ChoiceZAGS('', nID) then begin
    ReadNameZags(nID);
  end;
end;

procedure TfmCheckAkt.ReadNameZags(nID:Integer);
begin
  edZAGS.Text:='';
  FZAGS:=0;
  if (nID>0) then begin
    if dmBase.SprNames.Locate('ID', nID, []) then begin
      FZAGS:=nID;
      edZAGS.Text:=dmBase.SprNames.FieldByName('KNAME').AsString;
      if edZAGS.Text=''
        then edZAGS.Text:=dmBase.SprNames.FieldByName('NAME').AsString;
      edZAGS.Text:=IntToStr(nID)+' '+edZAGS.Text;
    end;
  end;
end;

procedure TfmCheckAkt.btOkClick(Sender: TObject);
var
  i:Integer;
  lOk:Boolean;
  sErr:String;
begin
  lOk:=false;
  for i:=0 to cbTypes.Count-1 do begin
    if cbTypes.Checked[i] then begin
      lOk:=true;
    end;
  end;
  if not lOk then begin
    PutError('Выберите типы актовых записей');
  end else begin
    sErr:='';
    if cbDate.Checked then begin
      if ((edDate1.Value=null) or (edDate2.Value=null)) then begin
        sErr:='Заполните период проверки';
      end else if edDate1.Value>edDate2.Value then begin
        sErr:='Неверный диапазон дат';
      end;
    end else if cbZags.Checked and (FZags=0) then begin
      sErr:='Выберите орган ЗАГС';
    end else if (FRunType=RUN_DELETE) then begin
      if not cbDate.Checked and not cbZags.Checked then begin
        sErr:='Заполните период или выберите ЗАГС';
      end else if not cbRun.Checked and (cbPodr.ItemIndex=-1) then begin
        sErr:='Выберите подразделение';
      end;
    end;
    if sErr<>'' then begin
      PutError(sErr);
      lOk:=false;
    end;
  end;
  if lOk then begin
    if cbDate.Checked then begin
      FDate1:=edDate1.Value;
      FDate2:=edDate2.Value;
    end else begin
      FDate1:=0;
      FDate2:=0;
    end;
    GlobalTask.SetLastValueAsInteger('CHECK_'+FNameType+'_ZAGS',FZAGS);
    GlobalTask.SetLastValueAsDate('CHECK_'+FNameType+'_DATE1',FDate1);
    GlobalTask.SetLastValueAsDate('CHECK_'+FNameType+'_DATE2',FDate2);
    ModalResult:=mrOk;
  end;
end;

procedure TfmCheckAkt.cbDateClick(Sender: TObject);
begin
  edDate1.Enabled:=cbDate.Checked;
  edDate2.Enabled:=cbDate.Checked;
  lbDate1.Enabled:=cbDate.Checked;
  lbDate2.Enabled:=cbDate.Checked;
end;

procedure TfmCheckAkt.cbZagsClick(Sender: TObject);
begin
  edZags.Enabled:=cbZags.Checked;
  lbZags.Enabled:=cbZags.Checked;
end;

procedure TfmCheckAkt.cbRunClick(Sender: TObject);
begin
  if FRunType=RUN_DELETE then begin
    lbPodr.Enabled:=not cbRun.Checked;
    cbPodr.Enabled:=not cbRun.Checked;
  end;  
end;

end.
