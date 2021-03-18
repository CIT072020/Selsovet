unit fChoiceAdresS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, adsdata, adsfunc, adstable, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,uProjectAll,
  Buttons, FuncPr, AddEvents
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmChoiceAdresS = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btCancel: TBitBtn;
    btOk: TBitBtn;
    edPunkt: TDBLookupComboboxEh;
    edUL: TDBLookupComboboxEh;
    dsPunkt: TDataSource;
    dsUL: TDataSource;
    QueryUL: TAdsQuery;
    cbNotUL: TDBCheckBoxEh;
    tbDom: TAdsTable;
    dsDom: TDataSource;
    edDom: TDBLookupComboboxEh;
    tbDomDATE_FIKS: TDateField;
    tbDomID: TIntegerField;
    tbDomPUNKT: TIntegerField;
    tbDomUL: TIntegerField;
    tbDomDOM: TAdsStringField;
    tbDomKORP: TAdsStringField;
    tbDomKV: TAdsStringField;
    tbDomTIP: TIntegerField;
    tbDomNAME_ADRES: TStringField;
    tbDomNOT_DOM: TBooleanField;
    tbDomDOM1: TAdsStringField;
    tbDomDOM2: TAdsStringField;
    tbDomSPEC_UCH: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure edULEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edDomEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure tbDomNAME_ADRESGetText(Sender: TField; var Text: String;   DisplayText: Boolean);
    procedure edPunktChange(Sender: TObject);
    procedure cbNotULClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FClearKey : Boolean;
  public
    DateFiks : TDateTime;
    SeekLichSchet : Boolean;
    IDAdres : Integer;
    IDLich  : Integer;
    function EditAdres : Boolean;
    procedure UpdateActions; override;
  end;

var
  fmChoiceAdresS: TfmChoiceAdresS;

implementation

uses dBase, fAddUL, fAddAdres, fMain;

{$R *.DFM}

procedure TfmChoiceAdresS.FormCreate(Sender: TObject);
var
  strFilter : string;
begin
  QueryUL.Open;
  tbDom.Open;
  if fmMain.DateFiks=dmBase.GetDateCurrentSost then begin
    strFilter:='Empty(date_death)';
  end else begin
    strFilter:='Empty(date_death) or date_death>='+QStr(DTOS(fmMain.DateFiks,tdClipper));
  end;
  dmBase.LookUpPunkt.Filter:=strFilter;
  dmBase.LookUpPunkt.Filtered:=true;
  {
  tbPunkt.Filter:=strFilter;
  tbPunkt.Open;
  tbPunkt.Filtered:=true;
  }
  edPunktChange(nil);
  FClearKey := false;
end;

procedure TfmChoiceAdresS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmBase.LookUpPunkt.Filtered:=false;
  dmBase.LookUpPunkt.Filter:='';
end;         

// соберем все отдельно стоящие дома или населенный пункт без улиц
// Query.SQL.Text := 'SELECT * FROM БазаДомов WHERE PUNKT='+InttoStr(ti.ID)+
//    ' and DATE_FIKS='+''''+DTOS(DateFiks,tdAds)+'''' + ' and UL is null'+
//    ' ORDER BY dom,korp,kv';

//   Query.SQL.Text := 'SELECT * FROM БазаДомов WHERE PUNKT='+strPunkt+
//   ' and UL=' + InttoStr(ti.ID) +
//   ' and DATE_FIKS='+''''+DTOS(DateFiks,tdAds)+''''+
//   ' ORDER BY dom,korp,kv';

procedure TfmChoiceAdresS.edULEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  f : TfmAddUL;
begin
  f := TfmAddUL.Create(nil);
  try
    if f.ShowModal = mrOk then begin
      Handled := true;
      QueryUL.Close;
      QueryUL.Open;
      edUL.Value := f.idUL;
      edUL.Invalidate;
      edUL.Update;
    end;
  finally
    f.Free;
  end;
end;

procedure TfmChoiceAdresS.edDomEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  adr : TAdres;
  strErr : String;
  nUL,n : Integer;
begin
  if (edUL.Text='') or cbNotUL.Checked
    then nUL := -1
    else nUL := edUL.Value;
  adr.PunktKod:=edPunkt.Value;
  adr.UlicaInt:=nUL;
  adr.NDom:='';
  adr.Korp:='';
  adr.Kv:='';
  adr.NotDom:=false;
  adr.NameHouse:='';
  {$IFDEF GKH}
    if IsAccountRnGor
      then adr.RnGor:=GlobalTask.ParamAsInteger('RN_GOROD');
      else adr.RnGor:=0;
  {$ELSE}
    adr.RnGor:=0;
  {$ENDIF}
  n:=AddNewAdres2(dateFiks,adr,strErr);
  case n of
    // ошибка
    -1 : begin
           Beep;
           PutError(strErr);
         end;
    // все ok!
    0  : begin
           edDom.Value := adr.AdresID;
         end;
    // адрес уже существует
    1  : begin
           edDom.Value := adr.AdresID;
         end;
    // отказ от добавления
    2  : begin end;
  end;
end;

procedure TfmChoiceAdresS.tbDomNAME_ADRESGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  Text := dmBase.getDom(tbDom,true)
  {
  Text:='';
  if tbDomDOM.AsString <> '' then begin
    Text := 'дом '+tbDomDOM.AsString;
  end;
  if tbDomKORP.AsString<>'' then begin
    if Text = '' then Text := 'корп. '+tbDomKORP.AsString
                 else Text := Text + ', корп. '+tbDomKORP.AsString;
  end;
  if tbDomKV.AsString<>'' then begin
    if Text = '' then Text := 'кв. '+tbDomKV.AsString
                 else Text := Text + ', кв. '+tbDomKV.AsString;
  end;
  }
end;

procedure TfmChoiceAdresS.edPunktChange(Sender: TObject);
var
  old : TCursor;
begin
  IDAdres:=0;
  IDLich :=0;
  tbDom.DisableControls;
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  edDom.Value := null;
  if edPunkt.Text='' then begin
    edUL.Value   := null;
    edUL.Enabled := false;
    edDom.Value  := null;
    edDom.Enabled:= false;
  end else begin
    if cbNotUL.Checked then begin
//      tbDom.KeyFieldCount:=3;
      tbDom.SetRange([DateFiks,edPunkt.Value,null],[DateFiks,edPunkt.Value,null]);
      edDom.Enabled:= true;
    end else begin
      edUL.Enabled := true;
      if edUL.Text='' then begin
        edDom.Value  := null;
        edDom.Enabled:= false;
      end else begin
//        tbDom.KeyFieldCount:=3;
        tbDom.SetRange([DateFiks,edPunkt.Value,edUL.Value],[DateFiks,edPunkt.Value,edUL.Value]);
        edDom.Enabled:= true;
      end;
    end;
  end;
  Screen.Cursor := old;
  tbDom.EnableControls;
end;

procedure TfmChoiceAdresS.cbNotULClick(Sender: TObject);
begin
  if cbNotUL.Checked then begin
    edDom.Value := null;
    edUL.Value  := null;
    edUL.Enabled:= false;
  end else begin
    edUL.Enabled:=true;
  end;
  edPunktChange(Sender);
end;

procedure TfmChoiceAdresS.UpdateActions;
begin
  inherited;
  btOk.Enabled := (edDom.Text<>'');
end;

procedure TfmChoiceAdresS.btOkClick(Sender: TObject);
begin
  if not tbDomSPEC_UCH.IsNull and tbDomSPEC_UCH.AsBoolean then begin
    PutError('Адрес на специальном учете !');
    IDAdres:=0;
  end else begin
    IDAdres := edDom.Value;
    ModalResult := mrOk;
  end;
end;

function TfmChoiceAdresS.EditAdres: Boolean;
begin
  try
    if edPunkt.Text='' then begin
      ActiveControl := edPunkt;
    end else if edUL.Text='' then begin
      if cbNotUL.Checked then begin
        ActiveControl := edDom;
      end else begin
        ActiveControl := edUL;
      end;
    end else begin
      ActiveControl := edDom;
    end;
  except
    ActiveControl := edPunkt;
  end;
  Result := false;
  if ShowModal = mrOk then begin
    Result := true;
  end;
end;

procedure TfmChoiceAdresS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
 if (Key>0) and (Key=VK_F2) and btOk.Enabled then begin
   btOkClick(nil);
 end;
end;

procedure TfmChoiceAdresS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmChoiceAdresS.FormShow(Sender: TObject);
begin
  if not tbDom.Active   then  tbDom.Active   := true;
  if not QueryUL.Active then  QueryUL.Active := true;
end;


initialization
  fmChoiceAdresS := nil;
finalization
  if fmChoiceAdresS<>nil then begin
    FreeAndNil(fmChoiceAdresS);
  end;
end.


