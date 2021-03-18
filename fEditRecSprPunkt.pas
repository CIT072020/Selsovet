//
unit fEditRecSprPunkt;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons, Db, AddEvents, adsdata, dbFunc, uGisun, uTypes,
  adsfunc, adstable, FuncPr, MetaTask, uProjectAll, Grids, DBGridEh, OpisEdit, ifpii_dbfunc, NewDialogs,
  ExtCtrls, kbmMemTable;
                                                                                              
type
  TfmEditRecSprPunkt = class(TForm)
    DataSource1: TDataSource;
    Query: TAdsQuery;
    QuerySeek: TAdsQuery;
    dsTypePunkt: TDataSource;
    mtEva: TkbmMemTable;
    DataSource: TDataSource;
    Panel1: TPanel;
    edOrgan: TDBEditEh;
    lbOrgan: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edNameB: TDBEditEh;
    edB_GOROD: TDBLookupComboboxEh;
    edName: TDBEditEh;
    Panel2: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    gbEva: TGroupBox;
    Grid: TDBGridEh;
    btAdd: TBitBtn;
    mtEvaUL: TIntegerField;
    mtEvaEVA: TIntegerField;
    Label1: TLabel;
    cbChern: TCheckBox;
    cbGorod: TCheckBox;
    cbNotStat: TCheckBox;
    cbNotRiap: TCheckBox;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    mtEvaUL_NAME: TStringField;
    edNomer: TDBNumberEditEh;
    edZona: TDBEditEh;
    edDateCreate: TDBDateTimeEditEh;
    edDateLikv: TDBDateTimeEditEh;
    mtEvaEVA_NAME: TStringField;
    mtEvaEVA_FNAME: TStringField;
    mtEvaUL_KNAME: TStringField;
    btSetSootv: TBitBtn;
    cbVxod: TCheckBox;
    procedure edOrganChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edOrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure btAddClick(Sender: TObject);
    procedure GridColEnter(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;    AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure btSetSootvClick(Sender: TObject);
    procedure edB_GORODUpdateData(Sender: TObject; var Handled: Boolean);
    procedure cbNotStatClick(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure btCancelClick(Sender: TObject);
    procedure cbVxodClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edOrganEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
    FClearKey : Boolean;
    FEnabledEVA: Boolean;
    FEnabledVxod: Boolean;
    procedure SetEnabledEVA(const Value: Boolean);
    procedure SetEnabledVxod(const Value: Boolean);
    function getSoato( nID:Integer):String;
    function getAteId( sSoato:String):Integer;
    function IsVxod:Boolean;
    procedure SetEnabledEdit(l:Boolean);

  public
    { Public declarations }
    ID : Integer;
    FRun : Boolean;
    FAdd : Boolean;
    FAte : integer;
    FRecAte:TAte;
    FQueryExit:Boolean;
    property EnabledEVA : Boolean read FEnabledEVA write SetEnabledEVA;
    property EnabledVxod : Boolean read FEnabledVxod write SetEnabledVxod;
    procedure CheckEva;
    procedure SetSootvEva;
    procedure LoadEva;
    procedure SaveEva;

  end;

  procedure EditRecord_SprPunkt( Owner:TDbGridEh; ds:TDataSet; lAdd:Boolean; Ic:TIcon);

implementation

uses dBase, fChPunktATE, uProject, fChoiceGIS_Class, fMain;

var
  lSetDecimal : Boolean;

{$R *.DFM}

procedure EditRecord_SprPunkt( Owner:TDbGridEh; ds:TDataSet; lAdd:Boolean; Ic:TIcon);
var
  f : TfmEditRecSprPunkt;
  strID:String;
  nID,n : Integer;
  lSeek:Boolean;
  nKod,nErrCode:Integer;
  d:TDateTime;
  s,strErr,strSOATO:String;
  dsATE:TDataSet;
begin
  ds:=Owner.DataSource.DataSet;
  if (ds.State = dsEdit) or (ds.State = dsInsert) then begin
    ds.Cancel;                          
  end;
  f := TfmEditRecSprPunkt.Create(Owner);
  f.mtEva.Open;
//  dmBase.SetDateFormat(f.mtEva);
  f.FRun:=true;
  f.FAdd:=lAdd;
  f.cbVxod.Checked:=false;
  f.cbVxod.Visible:=f.EnabledVxod;
  try
    if lAdd then begin
      f.FAte:=0; //  !!!!!!!!!!!!!!!!  изменить !!!!! GlobalTask.GetLastValueAsInteger('LAST_ATE');
      f.edB_GOROD.Value:=null;
      f.edName.Text:='';
      f.edNameB.Text:='';
      f.FRecAte.ate_id:=f.FAte;
      f.edOrgan.Text := FullNameFromATE(f.FRecAte,0,', ');
      if f.FRecAte.ate_id>0 then begin
        f.edName.Text  := f.FRecAte.Name;
        f.edB_Gorod.Value:=Category2TypePunkt(InttoStr(f.FRecAte.Category));
      end;
    end else begin
      f.FAte:=ds.FieldByName('ATE_ID').AsInteger;
      nKod:=ds.FieldByName('KOD').AsInteger;
      if (f.FAte=0) and (f.EnabledVxod or (ds.FieldByName('VXOD').AsString<>'')) then begin
        n:=f.getAteId(ds.FieldByName('VXOD').AsString); // из кода соато вернуть код ate
        if n>0 then begin
          f.FAte:=n;
          f.cbVxod.Visible:=true;
          f.EnabledVxod:=true;
          f.cbVxod.Checked:=true; // !!!
          f.SetEnabledEdit(false);
        end;
      end;
      if f.FAte=0 then begin
        if (nKod>0) and dmBase.SprSoato.Locate('ID', nKod, [])
          then f.FAte:=dmBase.SprSoato.FieldByName('ATE_ID').AsInteger;
      end;
      f.FRecAte.ate_id:=f.FAte;
      f.edOrgan.Text:=FullNameATE(f.FAte,0,', ');
      f.edB_GOROD.Value:=ds.FieldByName('TYPEPUNKT').AsInteger;
      f.edName.Text:=ds.FieldByName('NAME').AsString;
      f.edNameB.Text:=ds.FieldByName('NAME_B').AsString;
      f.edNomer.Text:=ds.FieldByName('NOMER').AsString;
      f.edZona.Text:=ds.FieldByName('CH_ZONA').AsString;
      f.edDateCreate.Value:= ds.FieldByName('DATE_BIRTH').Value;
      f.edDateLikv.Value:= ds.FieldByName('DATE_DEATH').Value;
      if ds.FieldByName('CHERN').IsNull    then f.cbChern.Checked:=false
                                           else f.cbChern.Checked:=ds.FieldByName('CHERN').AsBoolean;
      if ds.FieldByName('NOT_STAT').IsNull then f.cbNotStat.Checked:=false
                                           else f.cbNotStat.Checked:=ds.FieldByName('NOT_STAT').AsBoolean;
      if ds.FieldByName('GOROD').IsNull    then f.cbGorod.Checked:=false
                                           else f.cbGorod.Checked:=ds.FieldByName('GOROD').AsBoolean;
      if ds.FieldByName('NOT_RIAP').IsNull then f.cbNotRiap.Checked:=false
                                           else f.cbNotRiap.Checked:=ds.FieldByName('NOT_RIAP').AsBoolean;
      f.FRecAte.ate_id:=f.FAte;
      if not f.IsVxod then begin
        f.LoadEva;
        f.CheckEva;
      end;
//      f.edOrgan.Text := FullNameFromATE(f.FRecAte,0,', ');
//      f.SetRb;

    end;
    f.FRun:=false;
    f.FQueryExit:=false;
    if (f.FAte>0) and (Trim(f.edNameB.Text)='') then begin //or (Trim(f.edName.Text)='') ) then begin
      dsATE:=SeekATE(f.FAte);
      if dsATE<>nil then begin
//        f.edName.Text:=dsATE.FieldByName('NAME').AsString;
        f.edNameB.Text:=dsATE.FieldByName('NAME_B').AsString;
        f.FQueryExit:=true;
      end;
    end;
    if (f.ShowModal = mrOk) then begin
//      GlobalTask.SetLastValueAsInteger('LAST_ATE',f.FAte);
      // сформировать новый ID
      try
        if lAdd then begin
          ds.Append;
        end else begin
          ds.Edit;
        end;
        ds.FieldByName('SOATO').AsString:='';
        ds.FieldByName('KOD').AsString:='';
        ds.FieldByName('VXOD').AsString:='';
        if f.IsVxod then begin
          ds.FieldByName('VXOD').AsString:=f.getSoato(f.FAte);  // из кода ate вернуть код соато
          ds.FieldByName('ATE_ID').AsInteger:=0;
        end else begin
          ds.FieldByName('ATE_ID').AsInteger:=f.FATE;
          if (f.FATE>0) and dmBase.SprSoato.Locate('ATE_ID', f.FATE, []) then begin
            ds.FieldByName('SOATO').AsString:=dmBase.SprSoato.FieldByName('KOD').AsString;
            ds.FieldByName('KOD').AsInteger:=dmBase.SprSoato.FieldByName('ID').AsInteger;
          end;
        end;
        ds.FieldByName('EVA_ID').AsInteger:=0;

        if f.edB_GOROD.Value=null  then ds.FieldByName('TYPEPUNKT').AsString:=''
                                   else ds.FieldByName('TYPEPUNKT').AsString:=f.edB_GOROD.Value;
        ds.FieldByName('NAME').AsString := f.edName.Text;
        ds.FieldByName('NAME_B').AsString := f.edNameB.Text;
        ds.FieldByName('CH_ZONA').AsString:=f.edZona.Text;
        ds.FieldByName('NOMER').AsString:=f.edNomer.Text;
        ds.FieldByName('DATE_BIRTH').Value:=f.edDateCreate.Value;
        ds.FieldByName('DATE_DEATH').Value:=f.edDateLikv.Value;

        ds.FieldByName('CHERN').AsBoolean:=f.cbChern.Checked;
        ds.FieldByName('NOT_STAT').AsBoolean:=f.cbNotStat.Checked;
        ds.FieldByName('GOROD').AsBoolean:=f.cbGorod.Checked;
        ds.FieldByName('NOT_RIAP').AsBoolean:=f.cbNotRiap.Checked;
        ds.Post;
        f.SaveEva;
      except
        on E:Exception do begin
          strErr := E.Message;
          PutError('ОШИБКА: '+strErr, TWinControl(Owner));
          ds.Cancel;
        end;
      end;
    end;
  finally
    f.Free;
  end;
end;
//----------------------------------------
procedure TfmEditRecSprPunkt.FormCreate(Sender: TObject);
//var
//  s : String;
//  n,i:Integer;
begin
  fmMain.ImageList.GetBitmap(IL_ADD,btAdd.Glyph);
  fmMain.ImageList.GetBitmap(IL_SET_SOOTV,btSetSootv.Glyph);
  FAdd:=false;
  FAte:=0;
  ID:=-1;
  lSetDecimal:=false;
  FClearKey:=false;
  FQueryExit:=false;
  EnabledVxod:=GlobalTask.ParamAsBoolean('SPRNP_VXOD');
  EnabledEVA:=fmMain.EnabledEVA;
  cbVxod.Visible:=EnabledVxod;
  if not EnabledEVA then begin
    gbEva.Visible:=false;
    Height:=Height-gbEva.Height;
  end;
//  s:=GlobalTask.ParamAsString('KOD');
end;
//----------------------------------------
procedure TfmEditRecSprPunkt.SetEnabledEVA(const Value: Boolean);
begin
  FEnabledEVA := Value;
end;
//----------------------------------------
procedure TfmEditRecSprPunkt.SetEnabledVxod(const Value: Boolean);
begin
  FEnabledVxod := Value;
end;
//----------------------------------------
procedure TfmEditRecSprPunkt.LoadEva;
begin
  if (FAte=0) or not EnabledEVA then exit;
  Query.SQL.Text:=Format(' SELECT p.id as ate_id, p.pokaz as ul_id, cast(IFNULL(p.value,''0'') as SQL_INTEGER) as eva_id, e.name as eva_name, v.name as vid_name, typesave '+
    '   FROM BaseProp p'+
    '   LEFT JOIN sysspr.eva e ON e.ate_id=%d and cast(IFNULL(p.value,''0'') as SQL_INTEGER)=e.id'+
    '   LEFT JOIN sysspr.sprvideva v ON e.vid_id=v.id'+
    '   WHERE p.typeobj=%d and p.id=%d ',[FAte, _TypeObj_AteEva, FAte]);
  Query.Open;
  while not Query.Eof do begin
    mtEva.Append;
    mtEvaUL.AsInteger:=Query.FieldByName('ul_id').AsInteger;
    mtEvaEVA.AsInteger:=Query.FieldByName('eva_id').AsInteger;
    mtEvaEVA_NAME.AsString:=Query.FieldByName('eva_name').AsString;
    mtEvaEVA_FNAME.AsString:=AnsiLOwerCase(Trim(Query.FieldByName('vid_name').AsString))+' '+Trim(Query.FieldByName('eva_name').AsString);
    mtEva.Post;
    Query.Next;
  end;
  Query.Close;
end;
//----------------------------------------
procedure TfmEditRecSprPunkt.SaveEva;
var
  d:TDateTime;
begin
  if (FAte=0) or not EnabledEVA then exit;
  Query.AdsConnection.Execute( Format('DELETE FROM BaseProp WHERE typeobj=%d and id=%d', [_TypeObj_AteEva, FAte]) );
  mtEva.DisableControls;
  mtEva.First;
  d:=STOD('1900-01-01',tdAds);
  while not mtEva.Eof do begin
    Query.AdsConnection.Execute(Format('INSERT INTO BaseProp (typeobj, id, dates, pokaz, value, typesave) VALUES (%d, %d, %s, ''%d'', ''%d'', 0)',
                                [_TypeObj_AteEva, FAte, DateToSQL(d), mtEvaUL.AsInteger, mtEvaEVA.AsInteger]) );
    d:=d+1;
    mtEva.Next;
  end;
  mtEva.First;
  mtEva.EnableControls;
end;
//----------------------------------------
procedure TfmEditRecSprPunkt.CheckEva;
begin
  if (FAte=0) or not EnabledEVA then exit;
//  TYPEOBJ;ID;DATES;POKAZ
{     TYPEOBJ Short,        _TypeObj_AteEva
      ID Integer,           id пункта
      DATES Date,           1899-12-30
      POKAZ Char( 20 ),     код улицы в программе
      VALUE Char( 70 ),     код улицы в eva
      NVALUE Double( 0 ),
      TYPESAVE Short    }
  mtEva.DisableControls;
  Query.SQL.Text:='SELECT e.id, Trim(e.name) name, Trim(s.name) as vid_name, name_b FROM sysspr.Eva e LEFT JOIN sysspr.SprVidEva s ON e.vid_id=s.id WHERE ate_id='+InttoStr(FAte);
  Query.Open;
  {
   !!! возможно надо вставить проверку наличия в sysspr.eva присутствия значений из mtEva
   mtEva.First;
   while not mtEva.Eof do begin
     ...
     mtEva.Next;
   end;
  }
  while not Query.Eof do begin
    if mtEva.Locate('EVA', Query.FieldByName('ID').AsInteger, []) then begin
      mtEva.Edit;
    end else begin
      mtEva.Append;
      mtEvaEVA.AsInteger:=Query.FieldByName('ID').AsInteger;
    end;
    mtEvaEVA_NAME.AsString:=Query.FieldByName('NAME').AsString;
    mtEvaEVA_FNAME.AsString:=Query.FieldByName('NAME').AsString+' '+ANSILowerCase(Trim(Query.FieldByName('VID_NAME').AsString));
    mtEva.Post;
    Query.Next;
  end;
  Query.Close;
  mtEva.First;
  mtEva.EnableControls;
end;
//------------------------------------------------------
procedure TfmEditRecSprPunkt.btAddClick(Sender: TObject);
begin
  CheckEva;
end;
//----------------------------------------
procedure TfmEditRecSprPunkt.SetSootvEva;
var
  dsUl:TDataSet;
begin
  if (FAte=0) or not EnabledEVA then exit;
  mtEva.DisableControls;
  mtEva.First;
  dsUL:=dbOpenSQL2MemTable('select s.ID, replace(upper(trim(s.name)),''Ё'',''Е'') as NAME, replace(upper(trim(s.name)+'' ''+trim(isnull(tt.fname,''''))),''Ё'',''Е'') as FNAME '+
                           ' from спрУлиц s '+
                           ' left join СпрТипУлиц tt on s.tip=tt.id ','');
  while not mtEva.Eof do begin
    dsUL.Filter:='name='+QStr(StringReplace(ANSIUpperCase(mtEvaEVA_NAME.AsString),'Ё','Е',[rfReplaceAll]));
    dsUL.Filtered:=true;
    if dsUL.RecordCount=0 then begin
      //  нет совпадений
    end else if dsUL.RecordCount=1 then begin
      mtEva.Edit;
      mtEvaUL.AsInteger:=dsUl.FieldByName('ID').AsInteger;
      mtEva.Post;
    end else begin  //  более одного совпадения
      dsUL.Filter:='fname='+QStr(StringReplace(ANSIUpperCase(mtEvaEVA_FNAME.AsString),'Ё','Е',[rfReplaceAll]));
      dsUL.Filtered:=true;
      if dsUL.RecordCount=1 then begin
        mtEva.Edit;
        mtEvaUL.AsInteger:=dsUl.FieldByName('ID').AsInteger;
        mtEva.Post;
      end;
    end;
    mtEva.Next;
  end;
  dsUl.Free;
  mtEva.First;
  mtEva.EnableControls;
end;
//------------------------------------------------------
procedure TfmEditRecSprPunkt.btSetSootvClick(Sender: TObject);
begin
  if (FAte=0) then begin
    PutError(PadCStd('Не заполнен реквизит территория'));
  end else begin
    SetSootvEva;
    FQueryExit:=true;
  end;
end;
//------------------------------------------------------
procedure TfmEditRecSprPunkt.edOrganChange(Sender: TObject);
begin
  if not FRun then begin
  end;
end;
//--------------------------------------------
procedure TfmEditRecSprPunkt.btOkClick(Sender: TObject);
var
  lOk:Boolean;
  n:Integer;
  sErr:String;
begin
  mtEva.CheckBrowseMode;
  lOk:=true;
  sErr:='';
  if (FAte<=0) then begin
    if not Problem('Не выбрана территория. Продолжить ?')
//    sErr:='Выберите территорию';
      then lOk:=false;
  end else if (edName.Text='') or (edNameB.Text='') then begin
    sErr:='Заполните наименование';
    lOk:=false;
  end else if (VarToStr(edB_GOROD.Value)='') then begin
    sErr:='Заполните тип населенного пункта';
    lOk:=false;
  end;
  if lOk then begin
    ModalResult:=mrOk;
  end else begin
    if sErr<>''
      then PutError(PadCStd(sErr));
  end;
end;
//--------------------------------------------
procedure TfmEditRecSprPunkt.btCancelClick(Sender: TObject);
begin
  mtEva.CheckBrowseMode;
  Close;
  {
  if FQueryExit then begin
    n:=QuestionPos(' Сохранить запись ? ', 'Да;Нет; Продолжить ;','',-1,-1,qtConfirmation,Self);
    if n=1 then begin
      ModalResult:=mrOk;
    end else if n=2 then begin
      ModalResult:=mrCancel;
    end;
  end else begin
    ModalResult:=mrCancel;
  end;
  }
end;
procedure TfmEditRecSprPunkt.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
begin
//
end;

procedure TfmEditRecSprPunkt.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  n:Integer;   
begin
  if ModalResult=mrOk then begin
    Action:=Forms.caFree;
  end else if FQueryExit then begin
    n:=QuestionPos(' Сохранить запись ? ', 'Да;Нет; Продолжить ;','',-1,-1,qtConfirmation,Self);
    if n=1 then begin
      Action:=Forms.caFree;
      ModalResult:=mrOk;
    end else if n=2 then begin
      Action:=Forms.caFree;
      ModalResult:=mrCancel;
    end else begin
      Action:=Forms.caNone;
    end;
  end else begin
    Action:=Forms.caFree;
    ModalResult:=mrCancel;
  end;
end;

//--------------------------------------------
procedure TfmEditRecSprPunkt.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  l:Boolean;
begin
 lSetDecimal:=false;
 if Key = VK_DECIMAL then begin
   lSetDecimal:=true;
 end else if Key=VK_F2 then begin
    btOkClick(nil);
    Key:=0;
 end else if Key=VK_F10 then begin
    edOrganEditButtons0Click(nil,l);
    Key:=0;
 end;
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
end;

procedure TfmEditRecSprPunkt.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
  if lSetdecimal then begin
    Key := DecimalSeparator;
    lSetDecimal:=false;
  end;
end;

procedure TfmEditRecSprPunkt.edOrganEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  arrRec:TCurrentRecord;
  rAte:TAte;
  m:Integer;
  s:String;
  slPar:TStringList;
  lOk,lWriteEva:Boolean;
  ds:TDataSet;
begin
  slPar:=TStringList.Create;
  slPar.Add('TYPECHOICE=1'); // д.б. нас. пункт
  m:=FAte;
  if m<=0 then begin
    if dmBase.SprSoato.Locate('ID', MyID, []) and (dmBase.SprSoato.FieldByName('ATE_ID').AsInteger>0) then begin
      ds:=SeekATE(dmBase.SprSoato.FieldByName('ATE_ID').AsInteger);
      if ds<>nil then begin
        m:=ds.fieldbyName('ATE_ID').AsInteger;
      end;
    end;
  end;
  rAte:=ChoiceFromATE(nil,FAdd,m,slPar);
  slPar.Free;
  if rAte.ate_id>0 then begin
    if rAte.ate_id=FAte   // значение кода АТЕ не изменилось
      then lWriteEva:=false
      else lWriteEva:=true;
    if not FAdd and (FAte>0) and (rAte.ate_id<>FAte) and (mtEva.RecordCount>0)
      then lOk:=Problem(' Будет изменен список улиц. Продолжить ? ')
      else lOk:=true;
    if lOk then begin
      FRecAte:=rAte;
      FAte:=FRecAte.ate_id;
      if lWriteEva then mtEva.EmptyTable;
      FQueryExit:=true;
      edOrgan.Text:=FullNameATE(FAte, 0, ', ');
      if not IsVxod then begin
        if lWriteEva then CheckEva;
        s:='';
        if (FRecAte.Category>0) then begin
          m:=Category2TypePunkt(Inttostr(FRecAte.Category));
          edB_Gorod.Value:=dmbase.GetTypePunkt(inttostr(m),'',s);
        end else begin
          edB_Gorod.Value:=null;
        end;
        edName.Text:=FRecAte.NAME;
        edNameB.Text:=FRecAte.Name_B;
      end;
      ActiveControl:=edName;
    end;
//    showmessage(inttostr(ate.idPunkt));
//      showmessage(ate.Obl+#13+ate.raion+ate.ss+#13+s+' '+ate.name);
  end;
end;
procedure TfmEditRecSprPunkt.edOrganEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
 if (FAte>0) and Problem(' Очистить значение кода территории ? ') then begin
   FAte:=0;
   edOrgan.Text:='';
   mtEva.EmptyTable;
 end else begin
  //
 end;
end;

procedure TfmEditRecSprPunkt.GridColEnter(Sender: TObject);
begin
  if Grid.Col=1 then  Grid.Col:=2;
end;

procedure TfmEditRecSprPunkt.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;  State: TGridDrawState);
begin
  if mtEvaUL.AsInteger=0 then begin
    AFont.Color:=clBlue; //[fsBold];
  end else if not MySameText(mtEvaUL_KNAME.AsString,mtEvaEVA_NAME.AsString) then begin
    AFont.Color:=clRed;
  end
end;

procedure TfmEditRecSprPunkt.edB_GORODUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  FQueryExit:=true;
end;

procedure TfmEditRecSprPunkt.cbNotStatClick(Sender: TObject);
begin
  FQueryExit:=true;
end;

procedure TfmEditRecSprPunkt.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  if Field<>nil then FQueryExit:=true;
end;

function TfmEditRecSprPunkt.getSoato( nID:Integer):String;
var
  ds:TDataSet;
begin
  Result:='';
  if (nID>0) then begin
    ds:=SeekATE(nID);
    if ds<>nil
      then Result:=ds.FieldByName('KOD').AsString;
  end;
end;
function TfmEditRecSprPunkt.getAteId( sSoato:String):Integer;
begin
  Result:=0;
  if (Trim(sSoato)<>'') then begin
    Result:=SeekATEFromSoato(Trim(sSoato));
  end;
end;

function TfmEditRecSprPunkt.IsVxod:Boolean;
begin
  if EnabledVxod and cbVxod.Checked
    then Result:=true
    else Result:=false;
end;

procedure TfmEditRecSprPunkt.SetEnabledEdit(l:Boolean);
begin
  gbEva.Enabled:=l;
  Grid.Enabled:=l;
  btSetSootv.Enabled:=l;
end;

procedure TfmEditRecSprPunkt.cbVxodClick(Sender: TObject);
begin
  SetEnabledEdit(not cbVxod.Checked);
  mtEva.EmptyTable;
  FQueryExit:=true;
  if not IsVxod then begin
    LoadEva;
    CheckEva;
  end;
end;

end.
