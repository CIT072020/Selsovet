unit fDeleteAkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, OpisEdit, MetaTask, FuncPr, AdsTable,
  fWarning, ifpii_dbfunc, Dialogs, StdCtrls, DBCtrlsEh, Mask, Buttons;

type
  TfmDeleteAkt = class(TForm)
    Label1: TLabel;
    cbType: TComboBox;
    Label2: TLabel;
    edDate1: TDBDateTimeEditEh;
    Label3: TLabel;
    edDate2: TDBDateTimeEditEh;
    cbAll: TDBCheckBoxEh;
    lbPodr: TLabel;
    cbPodr: TComboBox;
    btOk: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    slType:TStringList;
    slPodr:TStringList;
    function GetWhere:String;
    function GetDate:String;
    function GetNAmeAkt:String;
    function GetPodr:String;
    function GetTableName:String;
    function GetTypeObj:String;
    procedure UpdateActions; override;
  end;

  procedure DeleteAkt;


implementation

uses dBase;

{$R *.dfm}

procedure DeleteAkt;
var
  fmDeleteAkt: TfmDeleteAkt;
  s,sSQL,sErr:String;
begin
  fmDeleteAkt:=TfmDeleteAkt.Create(nil);
  try
    if fmDeleteAkt.ShowModal=mrOk then begin
      if not dmBase.LoadSQL('Удаление_записей_актов', s) then begin
        PutError('Ошибка загрузки запроса на удаление.');
      end else begin
        s:=StringReplace(s, '&ADD_WHERE&', fmDeleteAkt.GetWhere, [rfReplaceAll, rfIgnoreCase]);
        s:=StringReplace(s, '&TABLE_NAME&', fmDeleteAkt.GetTableName, [rfReplaceAll, rfIgnoreCase]);
        s:=StringReplace(s, '&TYPE_OBJ&', fmDeleteAkt.GetTypeObj, [rfReplaceAll, rfIgnoreCase]);
        sSQL:=s;
        s := '';
        s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
        s := s + 'Будут удалены записи актов '+fmDeleteAkt.GetNameAkt+#13;
        s := s + 'За период: '+fmDeleteAkt.GetDate+#13;
        s := s + 'Подразделение: '+fmDeleteAkt.GetPodr+#13;
        s := s + 'Если Вы уверены в необходимости операции'#13;
        s := s + 'Введите слово ДА в поле ввода'#13;
        sErr:='';
        if OkWarning(s) then begin
          OpenMessage('Удаление информации из базы ...','');
          try
            MemoWrite('last.sql',sSQL);
            dmBase.AdsConnection.Execute(sSQL);
//   sleep(1000);
          except
            on E: Exception do begin
              sErr:='Таблица: '+fmDeleteAkt.GetTableName+Chr(13)+
                     'Ошибка удаления информации'+Chr(13)+
                     E.Message;
            end;
          end;
          CloseMessage;
          if sErr<>'' then PutError(sErr);
        end;
      end;
    end;
  finally
    fmDeleteAkt.Free;
  end;
end;

procedure TfmDeleteAkt.FormCreate(Sender: TObject);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  slType:=TStringList.Create;
  slPodr:=TStringList.Create;
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_FULL');
  for i:=0 to Opis.Items.Count-1 do begin
    cbType.Items.Add(Opis.Items[i]);
    slType.Add(Opis.KeyList[i]);
//    edType.KeyItems.Add(Opis.KeyList[i]);
  end;

  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_PODR_ZAGS');
  for i:=0 to Opis.Items.Count-1 do begin
    cbPodr.Items.Add(Opis.Items[i]);
    slPodr.Add(Opis.KeyList[i]);
//    edType.KeyItems.Add(Opis.KeyList[i]);
  end;
end;

procedure TfmDeleteAkt.FormDestroy(Sender: TObject);
begin
  slType.Free;
  slPodr.Free;
end;

procedure TfmDeleteAkt.UpdateActions;
begin
  inherited;
  btOk.Enabled:=(cbType.ItemIndex>-1) and (edDate1.Value<>null) and (edDate2.Value<>null) and (edDate1.Value<=edDate2.Value) and
                (cbAll.Checked or (cbPodr.ItemIndex>-1));
end;

function TfmDeleteAkt.GetWhere:String;
begin
  Result:='DATEZ>='+DateToSQL(edDate1.Value)+' and DATEZ<='+DateToSQL(edDate2.Value);
//  strWhere  := strWhere + ' and ID_SOURCE=' + IDZagsFile;
  if not cbAll.Checked and (cbPodr.ItemIndex>-1) then begin
    Result := Result + ' and PODR='+slPodr.Strings[cbPodr.ItemIndex];
  end;
end;

function TfmDeleteAkt.GetTableName: String;
var
  tb:TAdsTable;
begin
  tb:=dmBase.MainTableFromTypeObj(StrToInt(GetTypeObj));
  Result:=tb.TableName;
end;

function TfmDeleteAkt.GetTypeObj:String;
begin
  Result:=slType.Strings[cbType.itemindex];
end;

procedure TfmDeleteAkt.cbAllClick(Sender: TObject);
begin
  lbPodr.Enabled:=not cbAll.Checked;
  cbPodr.Enabled:=not cbAll.Checked;
end;

function TfmDeleteAkt.GetDate: String;
begin
  Result:='c '+DatePropis(edDate1.Value,3)+' по '+DatePropis(edDate2.Value,3);
end;

function TfmDeleteAkt.GetPodr: String;
begin
  if cbAll.Checked
    then Result:='без учета подразделения'
    else Result:=cbPodr.Items[cbPodr.ItemIndex];
end;

function TfmDeleteAkt.GetNameAkt: String;
begin
  Result:=cbType.Items[cbType.ItemIndex];
end;

end.
