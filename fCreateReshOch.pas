unit fCreateReshOch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, fGurnal, FuncPr, dbFunc, ifpii_dbfunc,
  Dialogs, fSimpleDialog, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh, DB, fLookUp, fWarning, MetaTask,
  adsdata, adsfunc, adstable;

type
  TfmCreateReshOch = class(TfmSimpleDialog)
    edNewDate: TDBDateTimeEditEh;
    edDate: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    edNomer: TDBEditEh;
    edNewNomer: TDBEditEh;
    lbType: TLabel;
    cbIzmNomer: TCheckBox;
    cbIzmDate: TCheckBox;
    QueryChoiceResh: TAdsQuery;
    Query: TAdsQuery;
    cbPlan: TCheckBox;
    edType: TDBComboBoxEh;
    procedure cbIzmNomerClick(Sender: TObject);
    procedure cbIzmDateClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edNomerEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FPar:TStringList;
    FOnlyNomerDate:Boolean;
  public
    { Public declarations }
    function GetParam(sParam,sDefault: String): String;
    function AddIdBase:String;
    procedure UpdateActions; override;
  end;

  function Run_CREATERESHOCH(Gurnal:TfmGurnal; strParams:String) : Variant;

implementation

uses dBase;

{$R *.dfm}

function Run_CREATERESHOCH(Gurnal:TfmGurnal; strParams:String) : Variant;
var
  f: TfmCreateReshOch;
begin
  Result:=false;
  f:=TfmCreateReshOch.Create(Gurnal);
  f.FOnlyNomerDate:=false;
  if strParams<>'' then begin
    f.FPar:=TStringList.Create;
    StrToStrings(strParams,f.FPar,';',true);
  end else begin
    f.FPar:=nil;
  end;
  f.edNomer.Text:=GlobalTask.GetLastValueAsString('NOMER_RESH');
  if GlobalTask.GetLastValueAsString('DATE_RESH')<>'' then begin
    try
      f.edDate.Value:=GlobalTask.GetLastValueAsDate('DATE_RESH');
    except
    end;
  end;
  if f.GetParam('ONLY_NOMER_DATE','0')='1' then begin  // запрос только номера и даты
    f.Caption:='Решение';
    f.FOnlyNomerDate:=true;
    f.cbIzmNomer.Visible:=false;
    f.cbIzmDate.Visible:=false;
    f.cbPlan.Visible:=false;
    f.cbPlan.Checked:=false;
    f.edNewDate.Visible:=false;
    f.edNewNomer.Visible:=false;
    f.btOk.Caption:='Выполнить';
    f.Height:=180;
  end else begin
    f.lbType.Visible:=false;
    f.edType.Visible:=false;
  end;
  if f.ShowModal=mrOk then begin
    if f.edType.ItemIndex>-1
      then GlobalTask.SetLastValueAsString('TYPE_RESH', f.edType.KeyItems[f.edType.ItemIndex])
      else GlobalTask.SetLastValueAsString('TYPE_RESH', '0');
    if f.cbIzmNomer.Checked
      then GlobalTask.SetLastValueAsString('NEW_NOMER_RESH', f.edNewNomer.Text)
      else GlobalTask.SetLastValueAsString('NEW_NOMER_RESH', '');
    if f.cbIzmDate.Checked
      then GlobalTask.SetLastValueAsDate('NEW_DATE_RESH', f.edNewDate.Value)
      else GlobalTask.SetLastValueAsDate('NEW_DATE_RESH', 0);
    GlobalTask.SetLastValueAsString('NOMER_RESH', f.edNomer.Text);
    if f.edDate.Value=null
      then GlobalTask.SetLastValueAsString('DATE_RESH', '')
      else GlobalTask.SetLastValueAsDate('DATE_RESH', f.edDate.Value);
    if f.cbPlan.Checked
      then GlobalTask.SetLastValueAsString('CHECK_PLAN', '1')
      else GlobalTask.SetLastValueAsString('CHECK_PLAN', '0');
    Result:=true;
  end;
  f.Free;
end;

procedure TfmCreateReshOch.cbIzmNomerClick(Sender: TObject);
begin
  edNewNomer.Enabled:=cbIzmNomer.Checked;
  if not edNewNomer.Enabled then edNewNomer.Text:='';
end;

procedure TfmCreateReshOch.cbIzmDateClick(Sender: TObject);
begin
  edNewDate.Enabled:=cbIzmDate.Checked;
  if not edNewDate.Enabled then edNewDate.Value:=null;
end;

function TfmCreateReshOch.GetParam(sParam,sDefault: String): String;
begin
  Result:=sDefault;
  if (FPar<>nil) and (FPar.Count>0) then begin
    Result:=FPar.Values[sParam];
    if Result=''
      then Result:=sDefault;
  end;
end;

//------------------------------------------------------------
function TfmCreateReshOch.AddIdBase:String;
begin
  Result:=' and o.id_base=0 ';
end;
//------------------------------------------------------------
procedure TfmCreateReshOch.btOkClick(Sender: TObject);
var
  strErr,s:String;
  lOk:Boolean;
begin
  lOk:=true;
  strErr:='';
  if cbIzmNomer.Checked and (Trim(edNewNomer.Text)='') then begin
    strErr:='Заполните новый номер решения.';
  end;
  if (cbIzmDate.Checked and (edNewDate.Value=null))  then begin
//   or ((edDate.Value=null) and not cbIzmDate.Checked) then begin
    strErr:='Заполните новую дату решения.';
  end;
  if (edNomer.Text<>'') and  (edDate.Value<>null) then begin
    Query.SQL.Text:='SELECT distinct dater, nomer FROM OcheredResh r '+#13#10+
            'LEFT JOIN Ochered o ON o.ochered_id=r.ochered_id and o.id=r.id'+#13#10+
            'WHERE r.nomer='+QStr(Trim(edNomer.Text))+' and r.dater='+DateToSQL(edDate.Value)+AddIdBase;
    Query.Open;
    if Query.RecordCount=0 then begin
//    if not dmBase.tbOcheredResh.Locate('NOMER;DATER', VarArrayOf([edNomer.Text,edDate.Value]),[]) then begin
      strErr:='Решение №'+edNomer.Text+' от '+DatePropis(edDate.Value,3)+' не найдено.';
    end;
  end else if (edNomer.Text<>'') then begin
    Query.SQL.Text:='SELECT distinct dater, nomer FROM OcheredResh r '+#13#10+
            'LEFT JOIN Ochered o ON o.ochered_id=r.ochered_id and o.id=r.id'+#13#10+
            'WHERE r.nomer='+QStr(Trim(edNomer.Text))+AddIdBase; //' and o.id_base=0 ';
//    Query.SQL.Text:='SELECT distinct nomer, dater from ocheredResh where nomer='+QStr(Trim(edNomer.Text));
    Query.Open;
    if Query.RecordCount>1 then begin
      if not Problem('Найдено несколько дат для решения № '+edNomer.Text+'. Продолжить ?',mtConfirmation,self) then begin
        lOk:=false;
      end;
 //     strErr:='Найдено более одного решения №'+edNomer.Text;
    end;
  end;
  if strErr<>''
    then lOk:=false;
  if lOk then begin
    if cbIzmNomer.Checked or cbIzmDate.Checked then begin
      s := '';
      s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
      s := s + 'При формировании решения будут произведены изменения:'#13;
      if cbIzmNomer.Checked then
      s := s + 'Номер решения с "'+edNomer.Text+'" на "'+edNewNomer.Text+'"'+#13;
      if cbIzmDate.Checked then
        if edDate.Value=null
          then s := s + 'Новая дата решения "'+DatePropis(edNewDate.Value,3)+'"'+#13
          else s := s + 'Дата решения с "'+DatePropis(edDate.Value,3)+'" на "'+DatePropis(edNewDate.Value,3)+'"'+#13;
      lOk:=OkWarning(s);
    end;
    if lOk
      then ModalResult:=mrOk;
  end;
  if strErr<>''
    then PutError(strErr,self);
end;
//--------------------------------------------------------------
procedure TfmCreateReshOch.edNomerEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  v,old : Variant;
  lChoice : Boolean;
  f : TfmLookUp;
  arrRec : TCurrentRecord;
begin
  if not QueryChoiceResh.Active then begin
    QueryChoiceResh.SQL.Text:='SELECT distinct dater, nomer FROM OcheredResh r '+#13#10+
                 'LEFT JOIN Ochered o ON o.ochered_id=r.ochered_id and o.id=r.id'+#13#10+
                 'WHERE r.nomer is not null '+AddIdBase+#13#10+
                 'ORDER BY dater desc ';
    QueryChoiceResh.Active:=true;
  end;
  v := null;
  f := TfmLookup.Create(nil);
  f.Flat := GlobalFlat;
  f.EnableDetail :=false;
  f.OpisEdit     := nil; //Self;
  f.EnableEdit   := false;
  SetLength(arrRec,1);
  QueryChoiceResh.First;
  lChoice:=f.Execute(edNomer, QueryChoiceResh, 'NOMER', v, arrRec, '', nil);
  f.Free;
  if (v<>null) and lChoice then begin //(old<>v) then begin
    edNomer.Text:=GetValueField(arrRec,'NOMER');
    edDate.Value:=GetValueField(arrRec,'DATER');
  end;
end;

procedure TfmCreateReshOch.UpdateActions;
begin
  inherited;
  btOk.Enabled:=(edNomer.Text<>'');
end;

procedure TfmCreateReshOch.FormCreate(Sender: TObject);
begin
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_TYPE_RESH', edType.Items, edType.KeyItems);
end;

end.
