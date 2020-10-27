unit fListSvid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dbFunc,
  fTableGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, fWarning, mPermit, uTypes,
  SasaDBGrid, TB2Item, TB2Dock, TB2Toolbar, OpisEdit, MetaTask, FuncPr, NewDialogs,
  ExtCtrls, DBCtrls, Menus, StdCtrls, Mask, DBCtrlsEh, ImgList
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

{$I Task.inc}

type
  TfmListSvid = class(TfmTableGurnal)
    TBItemPrixodSvid: TTBItem;
    TableSVID_TYPE: TSmallintField;
    TableSVID_SERIA: TAdsStringField;
    TableSVID_NOMER: TAdsStringField;
    TableDATEP: TDateField;
    TableDATER: TDateField;
    TableSOST: TSmallintField;
    TableAKT_NOMER: TSmallintField;
    TableAKT_ID: TIntegerField;
    TableID_ZAGS: TIntegerField;
    TableAKT_DATE: TDateField;
    TBItemDeleteSvid: TTBItem;
    ImageList1: TImageList;
    TBItemPerexod: TTBItem;
    TBItemToSS: TTBItem;
    TBSubmenuNakl: TTBSubmenuItem;
    TBItemEditNakl: TTBItem;
    TableID_NAKL: TIntegerField;
    TableLOOKUP_ID_ZAGS: TStringField;
    TableLOOKUP_NAKL: TStringField;
    TBItemDelNakl: TTBItem;
    TBItemClearStr: TTBItem;
    TBItemOpenAkt: TTBItem;
    pnFilter: TPanel;
    lbType: TLabel;
    edType: TDBComboBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure TBItemPrixodSvidClick(Sender: TObject);
    procedure TableBeforePost(DataSet: TDataSet);
    procedure GridColumns2UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBItemDeleteSvidClick(Sender: TObject);
    procedure TBItemPerexodClick(Sender: TObject);
    procedure TBItemToSSClick(Sender: TObject);
    procedure TBItemEditNaklClick(Sender: TObject);
    procedure TBItemNewNaklClick(Sender: TObject);
    procedure TBSubmenuNaklClick(Sender: TObject);
    procedure GridColumnsGetCellParams_NAKL(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsUpdateData_ID_ZAGS(Sender: TObject; var Text: String;  var Value: Variant; var UseText, Handled: Boolean);
    procedure GridColumnsUpdateData_SOST(Sender: TObject; var Text: String;  var Value: Variant; var UseText, Handled: Boolean);
    procedure TBItemDelNaklClick(Sender: TObject);
    procedure TBItemClearStrClick(Sender: TObject);
    procedure TBItemOpenAktClick(Sender: TObject);
    procedure edTypeChange(Sender: TObject);
  private
    { Private declarations }
    FOper     : Integer;
    FOpisSvid : TOPisEdit;
    FNameOpis : String;
  public
    FDate     : TDateTime;
    FTypeSvid : Integer;
    FSeria    : String;
    FNomer1   : String;
    FNomer2   : String;
    FIDZAGS   : Integer;
    function EnableSeekColumn(Column : TColumnEh) : Boolean; override;
    function UserSeekColumn( Column : TColumnEh; var strSeek:String) : Boolean; override;
    function DateR_IsEmpty : Boolean;
    function Sost_IsEmpty : Boolean;
    procedure Transact_Prixod;
    procedure Transact_Delete(lFull : Boolean);
    procedure Transact_DeleteFull;
    procedure Transact_Perexod;
    procedure Transact_Rasxod;
    function GetNomers(var n1,n2 : Integer) : Boolean;
    procedure UpdateActions; override;
    procedure BeforeClearFilter; override;
    function BeforeChangeOrder : Boolean; override;
    procedure AfterChangeOrder; override;

  end;


var
  fmListSvid: TfmListSvid;

implementation

uses dBase, fDeleteSvid, fPrixodSvid, fPerexodSvid, fRasxodSvid,uProject, fMain,
     fParamQuest, fmStringSeek, fRasxodSvidNakl;

{$R *.DFM}

var
  strLastSeek:String;
  CurValueNakl : TValuesFlt;

const
  COLUMN_TYPESVID = 0;
  COLUMN_SERIA    = 1;
  COLUMN_SOST     = 5;
  COLUMN_ID_ZAGS  = 9;
//  COLUMN_NAME_ZAGS  = 10;
  COLUMN_NAKL  = 10;

procedure TfmListSvid.FormCreate(Sender: TObject);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  inherited;
  {$IFDEF ZAGS}
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS');
    Grid.Columns[COLUMN_ID_ZAGS].Visible:=true;
    TBItemToSS.Visible:=false;
    Grid.Columns[COLUMN_ID_ZAGS].OnUpdateData:=GridColumnsUpdateData_ID_ZAGS;
    Grid.Columns[COLUMN_SOST].OnUpdateData:=GridColumnsUpdateData_SOST;
    Grid.Columns[COLUMN_NAKL].Visible:=true;
  {$ELSE}
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_S');
    Grid.Columns[COLUMN_ID_ZAGS].Visible:=false;
    Grid.Columns[COLUMN_NAKL].Visible:=false;
    TBItemToSS.Visible:=false;
    TBSubmenuNakl.Visible:=false;
    TBItemClearStr.Visible:=false;
  {$ENDIF}
  for i:=0 to Opis.Items.Count-1 do begin
    Grid.Columns[COLUMN_TYPESVID].PickList.Add(Opis.Items[i]);
    Grid.Columns[COLUMN_TYPESVID].KeyList.Add(Opis.KeyList[i]);
    edType.Items.Add(Opis.Items[i]);
    edType.KeyItems.Add(Opis.KeyList[i]);
  end;
  {$IFDEF ZAGS}
    FNameOpis := 'KEY_SOST_SVID_Z';
    FOpisSvid := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_SOST_SVID_Z');
  {$ELSE}
    FNameOpis := 'KEY_SOST_SVID_SS';
    FOpisSvid := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_SOST_SVID_SS');
  {$ENDIF}
  for i:=0 to FOpisSvid.Items.Count-1 do begin
    Grid.Columns[COLUMN_SOST].PickList.Add(FOpisSvid.Items[i]);
    Grid.Columns[COLUMN_SOST].KeyList.Add(FOpisSvid.KeyList[i]);
  end;
  dmBase.SvidSeria.First;
  while not dmBase.SvidSeria.Eof do begin
    Grid.Columns[COLUMN_SERIA].PickList.Add( dmBase.SvidSeria.FieldByName('SERIA').AsString );
    dmBase.SvidSeria.Next;
  end;

  dmBase.GetListOrganZAGS(Grid.Columns[COLUMN_ID_ZAGS].PickList, Grid.Columns[COLUMN_ID_ZAGS].KeyList,2);

  i:=Role.EnableEditTable(Table.TableName,0);
  if (i=0) then begin
    TBItemPrixodSvid.Enabled := false;
    TBItemDeleteSvid.Enabled := false;
    TBItemPerexod.Enabled := false;
    TBItemToSS.Enabled := false;
  end;
end;

procedure TfmListSvid.TableBeforePost(DataSet: TDataSet);
var
  strErr,s,ss : String;
begin
  strErr := '';
  if TableSOST.AsString='' then begin
    TableSOST.AsInteger := 0;
  end;
  if TableSVID_TYPE.AsString='' then begin
    strErr := 'Заполните тип свидетельства';
  end else if TableSVID_SERIA.AsString='' then begin
    strErr := 'Заполните серию свидетельства';
  end else if TableSVID_NOMER.AsString='' then begin
    strErr := 'Заполните номер свидетельства';
  end else if TableDATEP.AsString='' then begin
    strErr := 'Заполните дату прихода';
  end else if DATER_IsEmpty and not SOST_IsEmpty then begin
    strErr := 'Заполните дату расхода';
  end else if not DATER_IsEmpty and SOST_IsEmpty then begin
    strErr := 'Заполните состояние свидетельства';
  end else if not DATER_IsEmpty and (TableDATEP.AsDateTime>TableDATER.AsDateTime ) then begin
    strErr := 'Дата расхода не может быть меньше даты прихода';
  end;
  if strErr='' then begin
    s  := Trim(TableSVID_NOMER.AsString);
    ss := s;
    CharDel(ss,'0');
    if Pos(' ',s) > 0 then begin
      strErr := 'Ошибочный номер свидетельства';
    end else if Length(ss)=0 then begin
      strErr := 'Ошибочный номер свидетельства';
    end else begin
      s := Trim(TableSVID_NOMER.AsString);
      if Length(s) < SVID_LEN then begin
        s := PadLStr(s,SVID_LEN,'0');
        TableSVID_NOMER.AsString := s;
      end;
    end;
  end;
  if strErr<>'' then begin
    PutError(strErr);
    abort;
  end;
end;

procedure TfmListSvid.GridColumns2UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  Handled := false;
  UseText := true;
  if Length(Trim(Text)) < SVID_LEN then begin
    Text := PadLStr(Trim(Text),SVID_LEN,'0');
  end;
end;

procedure TfmListSvid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Grid.SelectedIndex>-1 then begin
    if Key=VK_SPACE then begin
      if Grid.Columns[Grid.SelectedIndex].FieldName='SOST' then begin
        if Grid.Columns[Grid.SelectedIndex].Field.AsString='' then begin
//          Grid.Columns[Grid.SelectedIndex].Index
        end else begin

        end;
      end;
    end;
  end;
end;

procedure TfmListSvid.Transact_DeleteFull;
var
  old,s : String;
  lDelete : Boolean;
  cur : TCursor;
begin
  lDelete:=true;
  if FDate=0 then begin
    lDelete:=false;
    s := FOpisSvid.ListOpisEdit.SeekValue(FNameOpis,IntToStr(FTypeSvid),false);
    if Problem('Вы хотите удалить все свидетельста с типом: <'+s+'>') then begin
      lDelete:=true;
    end;
  end;
  if lDelete then begin
    cur := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    with dmBase.ListSvid do begin
      try
        old := IndexName;
        IndexName:='PRIXOD_KEY';
        if FDate=0 then begin
          SetRange([FTypeSvid],[FTypeSvid])
        end else begin
          SetRange([FTypeSvid,FDate],[FTypeSvid,FDate])
        end;
        while not Eof do Delete;
      finally
        CancelRange;
        EnableControls;
        IndexName:=old;
        Screen.Cursor := cur;
      end;
    end;
  end;
end;

procedure TfmListSvid.Transact_Delete(lFull : Boolean);
var
  s : String;
  cur : TCursor;
begin
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'Будет произведено удаление из базы свидетельств'#13;
//  s := s + 'всех записей израсходованных до 1 января '+DatePropis(FDate,7)+' года. '#13;
  s := s + 'Если Вы хотите произвести операцию'#13;
  s := s + 'введите слово ДА в поле ввода.'#13;
  s := s + 'Иначе действие не будет выполнено.'#13;
  if OkWarning(s) then begin
    cur := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      dmBase.AdsConnection.Execute('DELETE FROM ListSvid WHERE svid_type='+IntToStr(FTypeSvid)+
                  ' and datep='+QStr(DTOS(FDate,tdAds)) );
    finally
      Screen.Cursor := cur;
    end;
  end;
end;

procedure TfmListSvid.Transact_Prixod;
var
  n1,n2,i,j : Integer;
//  vKeyValues : Variant;
begin
//  strErr := '';
//  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
//  vKeyValues[0] := FTypeSvid;
//  vKeyValues[1] := FDate;
  GetNomers(n1,n2);
  for i:=n1 to n2 do begin
    j:=1;
    with dmBase.ListSvid do begin
      try
        Append;
        FieldByName('DATEP').AsDateTime    := FDate;
        FieldByName('SVID_TYPE').AsInteger := FTypeSvid;
        FieldByName('SVID_SERIA').AsString := FSeria;
        FieldByName('SVID_NOMER').AsString := PadLInt(i,SVID_LEN,'0');
        Post;
      except
        on E:EADSDatabaseError do begin
          Cancel;
          j:=Question('Запись со значениями: '+FSeria+' '+PadLInt(i,SVID_LEN,'0')+' уже существует',
                      '  Продолжить  ;  Прервать  ','Ошибка добавления',1,2,qtError);
        end;
      end;
    end;
    if j=2 then break;
  end;
end;

function TfmListSvid.GetNomers(var n1,n2 : Integer) : Boolean;
var
  s : String;
begin
  Result := true;
  s := Trim(FNomer1);
  while Copy(s,1,1)='0' do s:=Copy(s,2,SVID_LEN);
  n1 := StrToInt(s);
  s := Trim(FNomer2);
  while Copy(s,1,1)='0' do s:=Copy(s,2,SVID_LEN);
  n2 := StrToInt(s);
end;

function TfmListSvid.DateR_IsEmpty: Boolean;
begin
  Result:=false;
  if TableDateR.IsNull or (DTOS(TableDateR.AsDateTime,tdAds)='1000-01-01') then begin
    Result:=true;
  end;
end;

function TfmListSvid.Sost_IsEmpty: Boolean;
begin
  Result:=false;
  if TableSost.IsNull or (TableSost.AsString='0') then begin
    Result:=true;
  end;
end;

procedure TfmListSvid.TBItemPrixodSvidClick(Sender: TObject);
var
  f : TfmPrixodSvid;
  lRun : Boolean;
begin
  Table.CheckBrowseMode;
  lRun := false;
  f := TfmPrixodSvid.Create(nil);
  if f.ShowModal=mrOk then begin
    FDate     := f.Date;
    FTypeSvid := f.TypeSvid;
    FSeria    := f.Seria;
    FNomer1   := f.Nomer1;
    FNomer2   := f.Nomer2;
    lRun := true;
  end;
  f.Free;
  if lRun then begin
    Transact_Prixod;
  end;
  table.Refresh;
end;

procedure TfmListSvid.TBItemToSSClick(Sender: TObject);
var
  f : TfmRasxodSvid;
  lRun : Boolean;
begin
  Table.CheckBrowseMode;
  lRun := false;
  f := TfmRasxodSvid.Create(nil);
  if f.ShowModal=mrOk then begin
    FDate     := f.Date;
    FTypeSvid := f.TypeSvid;
    FSeria    := f.Seria;
    FNomer1   := f.Nomer1;
    FNomer2   := f.Nomer2;
    lRun := true;
  end;
  f.Free;
  if lRun then begin
    Transact_Rasxod;
  end;
  table.Refresh;
end;
//------------------------------------------------------------------
procedure TfmListSvid.Transact_Rasxod;
var
  n1,n2,i,j : Integer;
  vKeyValues : Variant;
begin
  GetNomers(n1,n2);
  vKeyValues := VarArrayCreate( [0, 2], varOleStr );
  for i:=n1 to n2 do begin
    j:=1;
    with dmBase.ListSvid do begin
      vKeyValues[0] := FTypeSvid;
      vKeyValues[1] := FSeria;
      vKeyValues[2] := PadLInt(i,SVID_LEN,'0');;
      if Locate('SVID_TYPE;SVID_SERIA;SVID_NOMER', vKeyValues, []) then begin
        try
          Edit;
          FieldByName('DATER').AsDateTime   := FDate;
          FieldByName('AKT_NOMER').AsString := '';
          FieldByName('AKT_DATE').AsString  := '';
          FieldByName('SOST').AsInteger     := 6;        // передано в сельисполком
          FieldByName('ID_ZAGS').AsInteger  := FIdZAGS;  // ID ЗАГС куда передано
          Post;
        except
          break;
        end;
      end else begin
          j:=Question('Запись со значениями: '+FSeria+' '+PadLInt(i,SVID_LEN,'0')+' не найдена',
                      '  Продолжить  ;  Прервать  ','Ошибка проведения',1,2,qtError);
      end;
    end;
    if j=2 then break;
  end;
end;
//-------------------------------------------------------------------------
procedure TfmListSvid.TBItemEditNaklClick(Sender: TObject);
var
  sNomer:String;
begin
  sNomer:=Table.FieldByName('ID_NAKL').AsString;
  if sNomer='' then begin
    PutError('Не заполнен номер накладной.')
  end else begin
    if dmBase.tbDokuments.Locate('ID_AUTO', sNomer ,[]) then begin
      if EditRasxodSvidNakl(Table.FieldByName('ID_NAKL').AsInteger) then begin
        Table.Refresh;
        Grid.Refresh;
      end;
    end else begin
      PutError('Накладная не найдена.')
    end;
  end;
end;

//-------------------------------------------------------------------------
procedure TfmListSvid.TBItemDelNaklClick(Sender: TObject);
var
  sNomer,s:String;
begin
  sNomer:=Table.FieldByName('ID_NAKL').AsString;
  if sNomer='' then begin
    PutError('Не заполнен номер накладной.')
  end else begin
    if dmBase.tbDokuments.Locate('ID_AUTO', sNomer ,[]) then begin
      s:=dmBase.tbDokuments.FieldByName('NOMER').AsString;
      if Problem('Удалить накладную № '+s+' вместе с информацией о выдаче ?') then begin
        dmBase.AdsConnection.Execute('UPDATE ListSvid SET ID_NAKL=null,ID_ZAGS=null,DATER=null,SOST=0 WHERE ID_NAKL='+sNomer);
        dmBase.DeleteDokument(dmBase.tbDokuments, dmBase.TypeObj_RasxNaklSvid,false);
        Table.Refresh;
        Grid.Refresh;
      end;
    end else begin
      PutError('Накладная не найдена.')
    end;
  end;
end;

//-------------------------------------------------------------------------
procedure TfmListSvid.TBItemClearStrClick(Sender: TObject);
begin
  if Problem('Очистить информацию о выдаче ?') then begin
    EditDataSet(Table);
    TableSOST.AsInteger:=0;
    TableDATER.AsString:='';
    TableID_ZAGS.AsString:='';
    TableID_NAKL.AsString:='';
    TableAKT_NOMER.AsString:='';
    TableAKT_ID.AsString:='';
    TableAKT_DATE.AsString:='';
    PostDataSet(Table);
    Grid.Refresh;
  end;
end;

//-------------------------------------------------------------------------
procedure TfmListSvid.TBItemNewNaklClick(Sender: TObject);
begin
  if EditRasxodSvidNakl(-1) then begin
    Table.Refresh;
    Grid.Refresh;
  end;
end;

//-------------------------------------------------------------------------
procedure TfmListSvid.TBSubmenuNaklClick(Sender: TObject);
//var
//  fmParam:TfmParamQuest;
//  n:Integer;
//  sSeek:String;
begin
  TBItemNewNaklClick(nil);
  {
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.Caption:='Введите номер накладной';
  fmParam.AddParamEx(strLastSeek, 'Номер накладной', 'NOMER' ,'');
  fmParam.AddButtons('Найти~Отказ',0);
  n:=fmParam.ShowQuest;
  sSeek:='';
  if n=1 then begin
    sSeek:=Trim(fmParam.GetValueAsText('NOMER'));
  end;
  fmParam.Free;
  if sSeek<>'' then begin
//    dmBAse.tbDokuments.Locate('NOMER')

  end;
  }
end;

procedure TfmListSvid.TBItemDeleteSvidClick(Sender: TObject);
var
  f : TfmDeleteSvid;
  lRun : Boolean;
begin
  Table.CheckBrowseMode;
  lRun := false;
  f := TfmDeleteSvid.Create(nil);
  if f.ShowModal=mrOk then begin
    FTypeSvid := f.TypeSvid;
    FOper  := f.GetOper;
    FDate  := f.Date;
    lRun := true;
  end;
  f.Free;
  if lRun then begin
    case FOper of
      DELETE_FULL   : Transact_Delete(true);
      DELETE_CLOSED : Transact_Delete(false);
    end;
  end;
  table.Refresh;
end;

procedure TfmListSvid.TBItemPerexodClick(Sender: TObject);
var
  f : TfmPerexodSvid;
  lRun : Boolean;
begin
  Table.CheckBrowseMode;
  lRun := false;
  f := TfmPerexodSvid.Create(nil);
  if f.ShowModal=mrOk then begin
    FDate     := f.Date;
    lRun := true;
  end;
  f.Free;
  if lRun then begin
    Transact_Perexod;
  end;
  table.Refresh;
end;

procedure TfmListSvid.Transact_Perexod;
var
  s,strSQL,sType : String;
  cur : TCursor;
  c:TColumnEh;
  i:Integer;
begin
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'Будет произведено удаление из базы свидетельств'#13;
//  s := s + 'всех записей израсходованных до 1 января '+DatePropis(FDate,7)+' года. '#13;
  s := s + 'Если Вы хотите произвести операцию'#13;
  s := s + 'введите слово ДА в поле ввода.'#13;
  s := s + 'Иначе действие не будет выполнено.'#13;
  if OkWarning(s) then begin
    cur := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    c:=Grid.Columns[COLUMN_TYPESVID];
    try
      for i:=0 to c.KeyList.Count-1 do begin
        sType:=c.KeyList.Strings[i];
        strSQL := 'DELETE FROM ListSvid WHERE svid_type='+sType+' and datep NOT IN ( '+Chr(13)+Chr(10)+
          ' select distinct datep from ListSvid '+Chr(13)+Chr(10)+
          ' where svid_type='+sType+' and (sost=0 or (sost<>0 and dater>='+QStr(DTOS(FDate,tdAds))+'))    )';
        dmBase.AdsConnection.Execute(strSQL);
      end;
    finally
      Screen.Cursor := cur;
    end;
  end;
end;

function TfmListSvid.EnableSeekColumn(Column: TColumnEh): Boolean;
//var
//  strName : String;
begin
  Result := true;
  {
  strName := UpperCase(Column.FieldName);
  if (strName='NAME_ZAGS') or (strName='FAMILIA') or (strName='AKT_TYPE')
    then Result:=false;
  }
end;

function TfmListSvid.UserSeekColumn(Column: TColumnEh; var strSeek:String): Boolean;
var
  st:TSostTable;
  s:String;
begin
  if Column.FieldName='ID_NAKL' then begin
    Result:=true;
    if CurValueNakl.FieldName='' then begin
      CurValueNakl.Value1:='';
      CurValueNakl.Registr:=true;
      CurValueNakl.FieldName:='NOMER';
    end;
    s:=VvodStringSeek('Накладная', 'NOMER', CurValueNakl, '0');
    strSeek:='';
    if CurValueNakl.TypeSr=tsEmpty then begin
      strSeek:='Empty(ID_NAKL)';
    end else if CurValueNakl.TypeSr=tsNotEmpty then begin
      strSeek:='not Empty(ID_NAKL)';
    end else if s<>'' then begin
      st:=SaveSostTable(dmBase.tbDokuments,false,false);
      dmBase.tbDokuments.Filter:='typeobj='+IntToStr(dmBase.TypeObj_RasxNaklSvid)+' and ('+s+')';
      dmBase.tbDokuments.Filtered:=true;
      while not dmBase.tbDokuments.Eof do begin
         if Length(strSeek)>0 then strSeek:=strSeek+' or ';
         strSeek:=strSeek+'ID_NAKL='+dmBase.tbDokuments.FieldByName('ID_AUTO').AsString;
         dmBase.tbDokuments.Next;
      end;
      if strSeek<>''
        then strSeek:='('+strSeek+')'
        else strSeek:='ID_NAKL=-999999';
      RestSostTable(dmBase.tbDokuments, st);
    end;
  end else begin
    Result:=inherited UserSeekColumn(Column,strSeek);
  end;
end;

procedure TfmListSvid.GridColumnsGetCellParams_NAKL(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  Params.Background:=GetDisableColor;
  if Params.Text<>'' then begin
    if dmBase.tbDokuments.Locate('ID_AUTO',Params.Text,[]) then begin
      Params.Text:=dmBase.tbDokuments.FieldByName('NOMER').AsString;
    end else begin
      Params.Text:='не найдена';
    end;
  end;
end;

procedure TfmListSvid.GridColumnsUpdateData_ID_ZAGS(Sender: TObject; var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  // если состояние не равно "выдано в сельисполком" то очмстим значение
  if (Value<>null) and (Table.FieldByName('SOST').AsInteger<>6) then begin
    Value:=null;
  end;
end;

procedure TfmListSvid.GridColumnsUpdateData_SOST(Sender: TObject; var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  // если состояние не равно "выдано в сельисполком" то очистим значение ID_ZAGS
  if (VarToStr(Value)<>'6') then begin
    EditDataSet(Table);
    Table.FieldByName('ID_ZAGS').AsInteger:=0;
  end;
end;

procedure TfmListSvid.TBItemOpenAktClick(Sender: TObject);
begin
  if (TableSVID_TYPE.AsInteger>0) and (TableAKT_ID.AsInteger>0) then begin
    fmMain.EditDokument(Table,TableSVID_TYPE.AsInteger,'AKT_ID',nil,false,'');
  end;
end;

procedure TfmListSvid.UpdateActions;
begin
  inherited;
//  TBItemOpenAkt.Enabled:=(TableAKT_ID.AsInteger>0);
end;

procedure TfmListSvid.edTypeChange(Sender: TObject);
begin
  if not FRunChange then begin
    FRunChange := true;
    try
      if (edType.Value<>null) and (edType.ItemIndex>-1) then begin
        Table.Filtered:=false;
        Table.SetRange([edType.KeyItems[edType.ItemIndex]],[edType.KeyItems[edType.ItemIndex]]);
        TBItemClrFlt.Enabled:=true;
      end else begin
        TBItemClrFlt.Enabled:=false;
        ClearFilter;
      end;
    finally
    FRunChange := false;
    end;
  end;
end;

procedure TfmListSvid.AfterChangeOrder;
begin
  inherited;
  if FirstFieldInOrder('SVID_TYPE') then begin //Table.IndexName='SEEK_KEY'  then begin   // SVID_TYPE;SVID_DATE
    edType.Enabled:=true;
    lbType.Enabled:=true;
  end else begin
    edType.Enabled:=false;
    lbType.Enabled:=false;
  end;
end;

function TfmListSvid.BeforeChangeOrder: Boolean;
begin
  edType.Value  :='';
  edType.ItemIndex := -1;
  Result := true;
end;

procedure TfmListSvid.BeforeClearFilter;
begin
  edType.Value:=null;
  edType.ItemIndex:=-1;
  Table.Scoped := false;
  Table.ScopeBegin:='';
  Table.ScopeEnd:='';
  Table.CancelRange;
  CurrentFilter:='';
  Table.OnFilterRecord:=nil;
  FSysFltCaption:='';
end;

initialization
  strLastSeek:='';
  CurValueNakl.FieldName:='';
end.
