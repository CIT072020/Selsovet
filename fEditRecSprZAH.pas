// модуль вместо fChoiceZAGS для ЗАГС
unit fEditRecSprZAH;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons, Db, AddEvents, adsdata, dbFunc, uGisun, uTypes,
  adsfunc, adstable, FuncPr, MetaTask, uProjectAll, Grids, DBGridEh, OpisEdit,
  ExtCtrls, kbmMemTable;
                                                                                              
type
  TfmEditRecSprZAH = class(TForm)
    DataSource1: TDataSource;
    Query: TAdsQuery;
    QuerySeek: TAdsQuery;
    dsTypePunkt: TDataSource;
    mtBooks: TkbmMemTable;
    DataSource: TDataSource;
    mtBooksBOOK: TIntegerField;
    mtBooksBOOK_DATE: TDateField;
    mtBooksBOOK_DATE_END: TDateField;
    Panel1: TPanel;
    cbHandled: TDBCheckBoxEh;
    edOrgan: TDBEditEh;
    lbOrgan: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    lbBook: TLabel;
    Label7: TLabel;
    edAdd: TDBEditEh;
    edBook: TDBNumberEditEh;
    edNameGIS: TDBEditEh;
    edGIS: TDBNumberEditEh;
    edName: TDBEditEh;
    edB_GOROD: TDBLookupComboboxEh;
    edGOROD: TDBEditEh;
    edSS: TDBEditEh;
    edRaion: TDBEditEh;
    edObl: TDBEditEh;
    Panel2: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    GroupBox1: TGroupBox;
    GridBooks: TDBGridEh;
    rbObl: TRadioButton;
    rbRn: TRadioButton;
    rbSS: TRadioButton;
    rbPunkt: TRadioButton;
    GroupBox2: TGroupBox;
    cbSector: TCheckBox;
    cbRad: TCheckBox;
    cbUch: TCheckBox;
    cbMog: TCheckBox;
    cbSecUch: TCheckBox;
    btAdd: TBitBtn;
    mtBooksZH_TYPE: TSmallintField;
    procedure edOrganChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cbHandledClick(Sender: TObject);
    procedure edOrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edGISEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edGISEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure btAddClick(Sender: TObject);
  private
    { Private declarations }
    FClearKey : Boolean;
    FZhType:Boolean;
  public
    { Public declarations }
    ID : Integer;
    FRun : Boolean;
    FAdd : Boolean;
    FAte : integer;
    FRecAte:TAte;
    FQueryExit:Boolean;
    procedure ChoiceSysSprZah;
    procedure ChoiceGisunSprZah;
    procedure SetRb;
  end;

  procedure EditRecord_SprZAH( Owner:TDbGridEh; ds:TDataSet; lAdd:Boolean; Ic:TIcon);

implementation

uses dBase, fChPunktATE, uProject, fChoiceGIS_Class, fMain;

var
  lSetDecimal : Boolean;

{$R *.DFM}

procedure EditRecord_SprZAH( Owner:TDbGridEh; ds:TDataSet; lAdd:Boolean; Ic:TIcon);
var
  f : TfmEditRecSprZAH;
  dsBook : TDataSet;
  strID:String;
  nID,n : Integer;
  lSeek:Boolean;
  nErrCode:Integer;
  d:TDateTime;
  s,strErr,strSOATO:String;
begin
  ds := Owner.DataSource.DataSet;
  if (ds.State = dsEdit) or (ds.State = dsInsert) then begin
    ds.Cancel;
  end;
  f := TfmEditRecSprZAH.Create(Owner);
  f.mtBooks.Open;
  dmBase.SetDateFormat(f.mtBooks);
  f.FRun:=true;
  f.FAdd:=lAdd;
  try
    if lAdd then begin
      f.FAte:=GlobalTask.GetLastValueAsInteger('LAST_ATE');
      f.edRaion.Text := '';
      f.edB_GOROD.Value:=null;
      f.edGorod.Text := '';
      f.edSS.Text := '';
      f.edName.Text:='';
      f.edAdd.Text:='';
      f.edBook.Value:=1;
      f.edGIS.Value:=0;
      f.FRecAte.ate_id:=f.FAte;
      f.edOrgan.Text := FullNameFromATE(f.FRecAte,0,', ');
      f.cbSector.Checked:=true;
      f.cbRad.Checked:=true;
      f.cbMog.Checked:=true;
      f.cbUch.Checked:=true;
      f.cbSecUch.Checked:=false;
      if f.FRecAte.ate_id>0 then begin
        f.edObl.Text := f.FRecAte.Obl;
        f.edRaion.Text := f.FRecAte.Raion;
        f.edSS.Text := f.FRecAte.ss;
        f.edGorod.Text  := f.FRecAte.Name;
        f.edB_Gorod.Value:=Category2TypePunkt(InttoStr(f.FRecAte.Category));
      end;
      f.SetRb;
    end else begin
      f.FAte:=ds.FieldByName('ATE').AsInteger;
      f.FRecAte.ate_id:=f.FAte;
      f.edOrgan.Text := FullNameFromATE(f.FRecAte,0,', ');
      //-----------------------------------------------
      // было
      {
        f.edObl.Text := ds.FieldByName('OBL').AsString;
        f.edRaion.Text := ds.FieldByName('RAION').AsString;
        f.edSS.Text := ds.FieldByName('SS').AsString;
        f.edGorod.Text  := ds.FieldByName('GOROD').AsString;
        f.edB_Gorod.Value  := ds.FieldByName('B_GOROD').AsInteger;
      }
      // стало   02.06.2020    читаем значения из АТЕ
      if f.FRecAte.ate_id>0 then begin
        f.edObl.Text := f.FRecAte.Obl;
        f.edRaion.Text := f.FRecAte.Raion;
        f.edSS.Text := f.FRecAte.ss;
        if f.FRecAte.idPunkt>0 then begin
          f.edGorod.Text  := f.FRecAte.Name;
          f.edB_Gorod.Value:=Category2TypePunkt(InttoStr(f.FRecAte.Category));
        end else begin
          f.edGorod.Text  := ds.FieldByName('GOROD').AsString;
          f.edB_Gorod.Value  := ds.FieldByName('B_GOROD').AsInteger;
        end;
      end else begin
        f.edObl.Text := ds.FieldByName('OBL').AsString;
        f.edRaion.Text := ds.FieldByName('RAION').AsString;
        f.edSS.Text := ds.FieldByName('SS').AsString;
        f.edGorod.Text  := ds.FieldByName('GOROD').AsString;
        f.edB_Gorod.Value  := ds.FieldByName('B_GOROD').AsInteger;
      end;
      //-----------------------------------------------------------------
      f.edName.Text:=ds.FieldByName('NAME').AsString;
      f.edGIS.Value:=ds.FieldByName('ID_GIS').AsInteger;
      if ds.FieldByName('SECTOR').IsNull
        then f.cbSecUch.Checked:=false
        else f.cbSecUch.Checked:=ds.FieldByName('SECTOR').AsBoolean;
      if ds.FieldByName('IS_SECTOR').IsNull
        then f.cbSector.Checked:=false
        else f.cbSector.Checked:=ds.FieldByName('IS_SECTOR').AsBoolean;
      if ds.FieldByName('IS_RAD').IsNull
        then f.cbRad.Checked:=false
        else f.cbRad.Checked:=ds.FieldByName('IS_RAD').AsBoolean;
      if ds.FieldByName('IS_MOG').IsNull
        then f.cbMog.Checked:=true
        else f.cbMog.Checked:=ds.FieldByName('IS_MOG').AsBoolean;
      if ds.FieldByName('IS_UCH').IsNull
        then f.cbUch.Checked:=true
        else f.cbUch.Checked:=ds.FieldByName('IS_UCH').AsBoolean;
      if ds.FieldByName('ID_GIS').AsInteger>0 then begin
        if dmBase.SysSprZah.Locate('ID', ds.FieldByName('ID_GIS').AsString, []) then begin
          f.edNameGIS.Text:=dmBase.SysSprZah.FieldByName('NAME').AsString;
        end;
      end;
      if ds.FieldByName('BOOK').IsNull
        then f.edBook.Value:=null  else f.edBook.Value:=ds.FieldByName('BOOK').AsInteger;
//      if not ds.FieldByName('BOOK_DATE').IsNull
//        then f.edBookDate.Value:=ds.FieldByName('BOOK_DATE').Value;
      f.edAdd.Text:=ds.FieldByName('ADRES').AsString;
      f.FRecAte.ate_id:=f.FAte;
//      f.edOrgan.Text := FullNameFromATE(f.FRecAte,0,', ');
      f.SetRb;

      dsBook:=BookKlad_SetDataSet(ds.FieldByName('ID').AsInteger, nil);
      try
        while not dsBook.Eof do begin      // tbSimpleProp
          f.mtBooks.Append;
          f.mtBooksBOOK.AsInteger:=StrToInt(dsBook.FieldByName('POKAZ').AsString);
          f.mtBooksBOOK_DATE.AsDateTime:=dsBook.FieldByName('DATES').AsDateTime;
          s:=dsBook.FieldByName('VALUE').AsString;
          n:=Pos('-',s);
          d:=0;
          try
            if n>0
              then d:=STOD(Copy(s,n+1,Length(s)),tdStd);
          except
          end;
          if d>0
            then f.mtBooksBOOK_DATE_END.AsDateTime:=d;
          f.mtBooksZH_TYPE.AsInteger:=dsBook.FieldByName('TYPESAVE').AsInteger;
//          if f.mtBooksZH_TYPE.AsInteger<=0 then f.mtBooksZH_TYPE.AsInteger:=1;
          f.mtBooks.Post;
          dsBook.Next;
        end;
      finally
        BookKlad_ClearDataSet;
      end;

    end;
    f.FRun:=false;
    f.mtBooks.First;
    f.FQueryExit:=false;
    if (f.ShowModal = mrOk) then begin
      GlobalTask.SetLastValueAsInteger('LAST_ATE',f.FAte);
      // сформировать новый ID
      if lAdd then begin
        ds.Append;
      end else begin
        ds.Edit;
      end;
      ds.FieldByName('NAME').AsString := f.edName.Text;
      ds.FieldByName('ATE').AsInteger := f.FATE;
      ds.FieldByName('OBL').AsString := f.edObl.Text;
      ds.FieldByName('RAION').AsString := f.edRaion.Text;
      ds.FieldByName('SS').AsString := f.edSS.Text;
      ds.FieldByName('GOROD').AsString := f.edGOROD.Text;
      ds.FieldByName('ADRES').AsString := f.edAdd.Text;
      ds.FieldByName('SECTOR').AsBoolean := f.cbSecUch.Checked;
      ds.FieldByName('IS_SECTOR').AsBoolean := f.cbSector.Checked;
      ds.FieldByName('IS_RAD').AsBoolean := f.cbRad.Checked;
      ds.FieldByName('IS_MOG').AsBoolean := f.cbMog.Checked;
      ds.FieldByName('IS_UCH').AsBoolean := f.cbUch.Checked;
      if f.edGIS.Value=null
        then ds.FieldByName('ID_GIS').AsInteger := 0
        else ds.FieldByName('ID_GIS').AsInteger := f.edGIS.Value;
      if f.edB_GOROD.Value=null
        then ds.FieldByName('B_GOROD').AsString := ''
        else ds.FieldByName('B_GOROD').AsString := f.edB_GOROD.Value;
      if f.edBook.Value=null
        then ds.FieldByName('BOOK').AsString  := ''
        else ds.FieldByName('BOOK').AsInteger := f.edBook.Value;
      try
        ds.Post;
      except
        on E:Exception do begin
          strErr := E.Message;
          PutError('ОШИБКА: '+strErr, TWinControl(Owner));
          ds.Cancel;
        end;
      end;
      BookKlad_SetDataSet(ds.FieldByName('ID').AsInteger, f.mtBooks);
    end;
  finally
    f.Free;
  end;
end;


procedure TfmEditRecSprZAH.edOrganChange(Sender: TObject);
begin
  if not FRun then begin
  end;
end;

procedure TfmEditRecSprZAH.btOkClick(Sender: TObject);
var
  lOk,lDefBook:Boolean;
  n:Integer;
begin
  lDefBook:=GlobalTask.ParamAsBoolean('DEFAULT_BOOK');

  mtBooks.CheckBrowseMode;
  try
    n:=edBook.Value;
  except
    n:=0;
  end;
  lOk:=true;
  if (FAte<=0) then begin
    PutError('Выберите территорию',self);
    lOk:=false;
  end else if (edName.Text='') then begin
    PutError('Заполните наименование',self);
    lOk:=false;
  end else if n=0 then begin
    if lDefBook then begin
      PutError('Заполните номер текущей книги',self);
      lOk:=false;
    end;
  end else begin
    mtBooks.First;
    if mtBooksBOOK_DATE.IsNull then begin
      PutError('Заполните список книг',self);
      lOk:=false;
    end;
  end;
  if lOk then begin
    mtBooks.DisableControls;
    try
      mtBooks.First;
      while not mtBooks.Eof do begin
         if (mtBooksBOOK.AsInteger=0) then begin
           PutError('Заполните все номера',self);
           lOk:=false;
         end;
         if lOk and mtBooksBOOK_DATE.IsNull then begin //or (FZhType and (mtBooksZH_TYPE.Asinteger<=0)) then begin
           PutError('Заполните дату начала ведения книги №'+mtBooksBOOK.AsString,self);
           lOk:=false;
         end;
         if lOk and not mtBooksBOOK_DATE_END.IsNull then begin
           if mtBooksBOOK_DATE.AsDateTime>=mtBooksBOOK_DATE_END.AsDateTime then begin
             PutError('Дата начала ведения книги №'+mtBooksBOOK.AsString+' больше даты окончания',self);
             lOk:=false;
           end;
         end;
         if not lOk
           then break;
         mtBooks.Next;
      end;
    finally
      mtBooks.EnableControls;
    end;
  end;
  if lOk then begin
    if (n>0) and not mtBooks.Locate('BOOK', n, []) then begin
      PutError('В списке книг отсутствует текущая книга',self);
      lOk:=false;
    end;
  end;
  if lOk then begin
    FQueryExit:=false;
    ModalResult:=mrOk;
  end;
end;

procedure TfmEditRecSprZAH.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 lSetDecimal:=false;
 if Key = VK_DECIMAL then begin
   lSetDecimal:=true;
 end;
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
end;

procedure TfmEditRecSprZAH.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfmEditRecSprZAH.FormCreate(Sender: TObject);
var
  strSQL,s : String;
  n,i:Integer;
  Col:TColumnEh;
  Opis:TOpisEdit;
begin
  fmMain.ImageList.GetBitmap(119,btAdd.Glyph);

  Col:=GridBooks.FieldColumns['ZH_TYPE'];
  if GlobalTask.ParamAsBoolean('ENABLE_LOAD_CSV') then begin
    Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_ZH_TYPE');
    for i:=0 to Opis.Items.Count-1 do begin
      Col.PickList.Add(Opis.Items[i]);
      Col.KeyList.Add(Opis.KeyList[i]);
    end;
    Col.Visible:=true;
    GridBooks.FieldColumns['BOOK_DATE_END'].Visible:=true;
    FZhType:=true;
  end else begin
    Col.Visible:=false;
    GridBooks.FieldColumns['BOOK_DATE_END'].Visible:=false;
    FZhType:=false;
  end;

{
  n:=LimitMRUList(3);
  SetMRUList(edGOROD,n,3,true,false,false,true);
  n:=LimitMRUList(1);
  SetMRUList(edOBL,n,1,true,false,false,true);
  n:=LimitMRUList(2);
  SetMRUList(edRAION,n,2,true,false,false,true);
}
  FAdd:=false;
  FAte:=0;
  ID:=-1;
  lSetDecimal:=false;
  FClearKey:=false;
{$IFDEF ZAH}
//  lbBook.Caption:='Номер текущей книги';
//  lbBookDate.Visible:=false;
//  edBookDate.Visible:=false;
{$ELSE}

{$ENDIF}

{
  if not GlobalTask.ParamAsBoolean('EDIT_ZH') then begin
    edObl.ReadOnly:=true;
    edRaion.ReadOnly:=true;
    edSS.ReadOnly:=true;
    edB_GOROD.ReadOnly:=true;
    edGOROD.ReadOnly:=true;
    edObl.Color:=GetDisableColor;
    edRaion.Color:=edObl.Color;
    edSS.Color:=edObl.Color;
    edB_GOROD.Color:=edObl.Color;
    edGOROD.Color:=edObl.Color;
  end;
}
  s := GlobalTask.ParamAsString('KOD');
  {
  if (s='3401365000')  then begin
    Query.SQL.Text := 'SELECT *  FROM SysSpr.СпрСОАТО WHERE kod=''3401655000''';
  end else if (Copy(s,2,1)='4')  then begin  // большой город
    Query.SQL.Text := 'SELECT soato as kod, name, id  FROM SysSpr.SprZags WHERE substring(soato,1,4)='+QStr(Copy(s,1,4));
  end else if (Copy(s,1,1)='5')  then begin  // для г.Минска выбор любого ЗАГС Минска
    Query.SQL.Text := 'SELECT soato as kod, name, id  FROM SysSpr.SprZags WHERE substring(soato,1,1)=''5''';
  end else if (Copy(s,1,1)='8')  then begin  // для г.Минска выбор любого ЗАГС Минска
    Query.SQL.Text := 'SELECT soato as kod, name, id  FROM SysSpr.SprZags WHERE substring(soato,1,1)=''8''';
  end else begin
    if not dmBase.LoadSQL('Загсы района', strSQL) then begin
      strSQL := 'SELECT *  FROM SysSpr.СпрСОАТО '+
         ' WHERE Substring(kod,1,4)=:PAR_RN and '+
         ' Substring(kod,5,3)<>'+QStr('550')+' and '+
         ' (Substring(kod,5,1)='+QStr('8')+' or Substring(kod,5,1)='+QStr('7')+' or '+
         ' (Substring(kod,5,3)>'+QStr('500')+' and Substring(kod,5,3)<'+QStr('550')+' )) and '+
         ' Substring(kod,6,2)<>'+QStr('00')+' and Substring(kod,8,3)='+QStr('000')+' ';
    end;
    s := Copy(GlobalTask.ParamAsString('KOD'),1,4);
    Query.SQL.Text := strSQL;
    Query.Params[0].Value := s;
  end;
  Query.Open;
  }
end;

procedure TfmEditRecSprZAH.cbHandledClick(Sender: TObject);
begin
  if cbHandled.Checked then begin
    ID:=-1;
    edOrgan.Text := '';
    edOrgan.Enabled := false;
    lbOrgan.Enabled := false;
  end else begin
    edOrgan.Enabled := true;
    lbOrgan.Enabled := true;
  end;
end;

procedure TfmEditRecSprZAH.edOrganEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  arrRec:TCurrentRecord;            
  rAte:TAte;
  m:Integer;
  s:String;
begin
  rAte:=ChoiceFromATE(nil,FAdd,FAte);
  if rAte.ate_id>0 then begin
    FRecAte:=rAte;
    FAte:=FRecAte.ate_id;
    s:='';
    if (FRecAte.Category>0) then begin
      m:=Category2TypePunkt(Inttostr(FRecAte.Category));
      edB_Gorod.Value:=dmbase.GetTypePunkt(inttostr(m),'',s);
    end else begin
      edB_Gorod.Value:=null;
    end;
    edOrgan.Text:=FullNameFromATE(FRecAte, 0, ', ');
    edObl.Text:=FRecAte.Obl;
    edRaion.Text:=FRecAte.Raion;
    edSS.Text:=FRecAte.SS;
    edGorod.Text:=FRecAte.NAME;
    SetRb;
    ActiveControl:=edName;
//    showmessage(inttostr(ate.idPunkt));
//      showmessage(ate.Obl+#13+ate.raion+ate.ss+#13+s+' '+ate.name);
  end;
end;
//-------------------------------------------------------------------------------------------------
procedure TfmEditRecSprZAH.edGISEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSysSprZah;
end;

procedure TfmEditRecSprZAH.edGISEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  ChoiceSysSprZah;
end;
//---------------------------------------------
procedure TfmEditRecSprZAH.ChoiceSysSprZah;
var
  arrRec:TCurrentRecord;
  Opis:TOpisEdit;
  v:Variant;
  lChoice,lOk:Boolean;
  n, nPunktID:Integer;
  s:String;
begin
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SYSSPRZAH');
  if Opis <> nil then begin
    if FAte=0 then begin
      ShowMessage('Выберите территорию');
    end else begin
      lOk:=false;
      lChoice:=false;
      v := null;
      OpenMessage('Поиск информации ... ','');
      try
        if rbPunkt.Checked and (edGorod.Text<>'') then begin
          dmBase.SysSprZah.AdsTableOptions.AdsFilterOptions:=RESPECT_WHEN_COUNTING;
          if FAte=ATEID_MnGor
            then dmBase.SysSprZah.Filter:='substr(id,1,1)=''7'''  // !!!
            else dmBase.SysSprZah.Filter:='ate_punkt='+intToStr(FAte);
          dmBase.SysSprZah.Filtered:=true;
          n:=dmBase.SysSprZah.RecordCount;
          lOk:=true;
          if n=0 then begin
            lOk:=false;
          end else if n=1 then begin
            lChoice:=true;
            v:=dmBase.SysSprZah.FieldByName('ID').AsString;
            GetCurrentRecord(dmBase.SysSprZah,'',arrRec);
          end;
        end;
        if (not lOk or rbSS.Checked) and (FRecAte.idSS>0) then begin
          dmBase.SysSprZah.Filter:='ate_ss='+IntToStr(FRecAte.idSS);
          dmBase.SysSprZah.Filtered:=true;
          lOk:=not dmBase.SysSprZah.Eof;
        end;
        if (not lOk or rbRn.Checked) and (FRecAte.idRaion>0) then begin
          dmBase.SysSprZah.Filter:='ate_rn='+IntToStr(FRecAte.idRaion);
          dmBase.SysSprZah.Filtered:=true;
          lOk:=not dmBase.SysSprZah.Eof;
        end;
        if (not lOk or rbObl.Checked) and (FRecAte.idObl>0) then begin
          dmBase.SysSprZah.Filter:='ate_obl='+IntToStr(FRecAte.idObl);
          dmBase.SysSprZah.Filtered:=true;
          lOk:=not dmBase.SysSprZah.Eof;
        end;
      finally
        CloseMessage();
      end;
      try
        if (lChoice or Opis.ChoiceFromSprEx(nil, v, arrRec, nil)) and (v<>null) then begin
          s:='';
          if (edGIS.Text<>'') and (edGIS.Text<>'0') and not FAdd then begin
            if edGIS.Text=GetValueField(arrRec,'ID')
              then s:='Обновить значение'
              else s:='Изменить значение';
          end;
          if s<>''
            then lChoice:=Problem(s,mtConfirmation,nil)
            else lChoice:=true;
          if lChoice then begin
            edGIS.Text:=GetValueFieldEx(arrRec,'ID',0);
            edName.Text:=GetValueField(arrRec,'NAME');
            edNameGIS.Text:=edName.Text;
            nPunktID:=GetValueFieldEx(arrRec,'ATE_PUNKT',0);
            if (nPunktID>0) and not rbPunkt.Checked then begin
              FAte:=nPunktID;
              FRecAte.ATE_ID:=FAte;
              edOrgan.Text:=FullNameFromATE(FRecAte, 0, ', ');
              if edOrgan.Text='' then begin
                PutError('Несоответствие классификаторов АТЕ и "Мест захоронений".'#13#10' Обратитесь к разработчикам.')
              end;
              n:=Category2TypePunkt(Inttostr(FRecAte.Category));
              if n>0 then edB_Gorod.Value:=dmBase.GetTypePunkt(inttostr(n),'',s) else edB_Gorod.Value:=null;
              edObl.Text:=FRecAte.Obl;
              edRaion.Text:=FRecAte.Raion;
              edSS.Text:=FRecAte.SS;
              edGorod.Text:=FRecAte.NAME;
              SetRb;
            end;
            if (nPunktID=0) then begin
              edGorod.Text:='';
              edB_GOROD.Value:=null;
            end;
          end;
        end;
      finally
        dmBase.SysSprZah.Filtered:=false;
        dmBase.SysSprZah.Filter:='';
      end;
    end;
  end;
end;
//---------------------------------------------
procedure TfmEditRecSprZAH.ChoiceGisunSprZah;
var
  arrRec:TCurrentRecord;
  slPar:TStringList;
begin
  slPar:=TStringList.Create;
  slPar.Add('CLASS='+IntToStr(ctZah));
//  EXTCODE_KEY -> TYPESPR;PADL(TRIM(EXTCODE),10,' ')
//  LEX3_KEY    -> TYPESPR;LEX3 )
  slPar.Add('INDEX=EXTCODE_KEY');
  if ChoiceGIS_Class( edOrgan, edGIS.Text, 'VAL(EXTCODE)>0', arrRec, slPar) then begin
    edGIS.Text:=GetValueField(arrRec,'EXTCODE');
    edName.Text:=GetValueField(arrRec,'LEX1');
    edNameGIS.Text:=edName.Text;
  end;
end;
//---------------------------------------------
procedure TfmEditRecSprZAH.SetRb;
begin
  if FRecAte.idPunkt>0 then
    rbPunkt.Checked:=true
  else if FRecAte.idSS>0 then
    rbSS.Checked:=true
  else if FRecAte.idRaion>0 then
    rbRn.Checked:=true
  else if FRecAte.idObl>0 then
    rbObl.Checked:=true;
  rbPunkt.Enabled:=FRecAte.idPunkt>0;
  rbSS.Enabled:=FRecAte.idSS>0;
  rbRn.Enabled:=FRecAte.idRaion>0;
  rbObl.Enabled:=FRecAte.idObl>0;
end;

procedure TfmEditRecSprZAH.btAddClick(Sender: TObject);
var
  n:Integer;
begin
  mtBooks.CheckBrowseMode;
  if Problem(PADCStr('Добавить новую книгу ?',40,' ')) then begin
    mtBooks.DisableControls;
    mtBooks.First;
    n:=0;
    while not mtBooks.Eof do begin
      if mtBooksBOOK.AsInteger>n
        then n:=mtBooksBOOK.AsInteger;
      mtBooks.Next;
    end;
    n:=n+1;
    try
      mtBooks.Append;
      try
        mtBooksBOOK.AsInteger:=n;
        mtBooksBOOK_DATE.AsDateTime:=Date;
        mtBooks.Post;
      except
        mtBooks.Cancel;
        mtBooks.Last;
      end;
    finally
      mtBooks.EnableControls;
    end;
  end;
end;

end.
