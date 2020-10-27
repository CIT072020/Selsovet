unit fAddAdres;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uProjectAll,
  Db, adsdata, adsfunc, adstable, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, uProject, MetaTask,OpisEdit,
  Buttons, FuncPr, AddEvents, dBase
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmAddAdres = class(TForm)
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
    edDom: TDBEditEh;
    edKorp: TDBEditEh;
    edKv: TDBEditEh;
    lbKorp: TLabel;
    Label5: TLabel;
    cbNotDom: TDBCheckBoxEh;
    lbName: TLabel;
    edName: TDBEditEh;
    lbRnGor: TLabel;
    edRnGor: TDBComboBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure edULEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure tbDomNAME_ADRESGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure edPunktChange(Sender: TObject);
    procedure cbNotULClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure cbNotDomClick(Sender: TObject);
  private
    { Private declarations }
    FClearKey : Boolean;
    FAdd : Boolean;
    FResult : Integer;
    FType:Integer;
    FError:String;
  public
    NewID : Integer;
    DateFiks : TDateTime;
    SeekLichSchet : Boolean;
    IDAdres : Integer;
    function EditAdres : Boolean;
    procedure UpdateActions; override;
  end;

  // 0 Ok!;  1 адрес существует; 2 отказ от добавления;  -1 ошибка;
  function AddNewAdres2(dDateFiks : TDateTime; var adr : TAdres; var strErr:String; lCheckEnabled:Boolean=true; sCaption:String=''; f:TForm=nil) : Integer;

  function AddNewAdres(dDateFiks : TDateTime; var ID : Integer; var ds : TDataSet; nPunkt:Integer; nRnGor:Integer; nUl:Integer ) : Boolean;

implementation

uses fAddUL;

var
  fmAddAdres: TfmAddAdres;


{$R *.DFM}

function AddNewAdres( dDateFiks : TDateTime; var ID : Integer; var ds : TDataSet; nPunkt:Integer; nRnGor:Integer; nUl:Integer) : Boolean;
var
  vKeyValues : Variant;
begin
  ID := -1;
  fmAddAdres := TfmAddAdres.Create(nil);
  fmAddAdres.FType:=1;
  fmAddAdres.DateFiks := dDateFiks;

  if EnableNotDom then begin
    fmAddAdres.cbNotDom.Visible:=true;
  end else begin
    fmAddAdres.cbNotDom.Visible:=false;
    if not EnableNameHouse then begin
      fmAddAdres.lbName.Visible:=false;
      fmAddAdres.edName.Visible:=false;
    end;
  end;
  if nPunkt>0 then begin
    fmAddAdres.edPunkt.Value:=nPunkt;
    fmAddAdres.ActiveControl:=fmAddAdres.edUL;
  end;
  if nRnGor>0 then begin
    fmAddAdres.edRnGor.Value:=nRnGor;
  end;
  if nUL>0 then begin
    fmAddAdres.edUL.Value:=nUL;
    fmAddAdres.ActiveControl:=fmAddAdres.edDom;
  end;
  Result := false;
  try
    fmAddAdres.ShowModal;
    if fmAddAdres.FAdd then begin
      vKeyValues := VarArrayCreate( [0, 1], varOleStr );
      vKeyValues[0] := dDateFiks;
      vKeyValues[1] := fmAddAdres.NewID;
      if dmBase.tbAdres.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
        Result := fmAddAdres.FAdd;
        ID := fmAddAdres.NewID;
        ds := dmBase.tbAdres;
      end;
    end;
  finally
    fmAddAdres.Free;
  end;
end;

//-----------------------------------------------------------------------------------------------------------
function AddNewAdres2( dDateFiks : TDateTime; var adr:TAdres; var strErr:String; lCheckEnabled:Boolean; sCaption:String; f:TForm) : Integer;
var
  n:Integer;
begin
  Result:=2;

  adr.AdresID := -1;
  if adr.UlicaInt<=0
    then adr.UlicaInt:=0;

  fmAddAdres := TfmAddAdres.Create(f);
  fmAddAdres.FType:=2;
  fmAddAdres.DateFiks := dDateFiks;
  if sCaption<>'' then begin
    n:=Pos(';',sCaption);
    if n=0 then begin
      fmAddAdres.Caption:=sCaption;
    end else begin
      fmAddAdres.Caption:=Copy(sCaption,1,n-1);
      fmAddAdres.btOk.Caption:=Copy(sCaption,n+1,Length(sCaption));
    end;
  end;
  if EnableNotDom then begin
    fmAddAdres.cbNotDom.Visible:=true;
  end else begin
    fmAddAdres.cbNotDom.Visible:=false;
    if not EnableNameHouse then begin
      fmAddAdres.lbName.Visible:=false;
      fmAddAdres.edName.Visible:=false;
    end;
  end;

  if adr.PunktKod>0
    then fmAddAdres.edPunkt.Value:=adr.PunktKod
    else fmAddAdres.edPunkt.Value:=1;

  if adr.UlicaInt=0 then begin
    if lCheckEnabled
      then n:=0
      else n:=dmBase.SprUL.FieldByName('ID').AsInteger;
    if n=0 then begin
      fmAddAdres.edUL.Value:=null;
      fmAddAdres.cbNotUL.Checked:=true;
    end else begin
      adr.UlicaInt:=n;
      fmAddAdres.edUL.Value:=n;
      fmAddAdres.cbNotUL.Checked:=false;
    end;
  end else begin
    fmAddAdres.edUL.Value:=adr.UlicaInt;
    fmAddAdres.cbNotUL.Checked:=false;
  end;

  if lCheckEnabled then begin
    fmAddAdres.edPunkt.Enabled:=false;
    fmAddAdres.edUL.Enabled:=false;
    fmAddAdres.cbNotUL.Enabled:=false;
  end;

  if fmAddAdres.edDom.Enabled then
    fmAddAdres.ActiveControl:=fmAddAdres.edDom;
  if adr.NDom<>'' then begin
    fmAddAdres.edDom.text:=adr.NDom;
    if lCheckEnabled then
      fmAddAdres.edDom.Enabled:=false;;
    if fmAddAdres.edKv.Enabled then
      fmAddAdres.ActiveControl:=fmAddAdres.edKv;
  end;
  if adr.RnGor>0
    then fmAddAdres.edRnGor.Value:=adr.RnGor;
  if adr.Korp<>'' then begin
    fmAddAdres.edKorp.text:=adr.Korp;
    if lCheckEnabled then
      fmAddAdres.edKorp.Enabled:=false;;
    if fmAddAdres.edKv.Enabled then
      fmAddAdres.ActiveControl:=fmAddAdres.edKv;
  end;
  if adr.Kv<>'' then begin
    fmAddAdres.edKv.text:=adr.Kv;
    if fmAddAdres.edKv.Enabled then
      fmAddAdres.ActiveControl:=fmAddAdres.edKv;
  end;
  try
    if fmAddAdres.ShowModal=mrOk then begin
      strErr:=fmAddAdres.FError;
      Result := fmAddAdres.FResult;
      if fmAddAdres.FResult>-1 then begin
        adr.AdresID := fmAddAdres.NewID;
        adr.NotDom:=fmAddAdres.cbNotDom.Checked;
        adr.NDom:=Trim(fmAddAdres.edDom.Text);
        adr.Korp:=Trim(fmAddAdres.edKorp.Text);
        adr.Kv:=Trim(fmAddAdres.edKv.Text);
        adr.NameHouse:=Trim(fmAddAdres.edName.Text);
      end;
    end;
  finally
    fmAddAdres.Free;
  end;

end;

procedure TfmAddAdres.FormCreate(Sender: TObject);
{$IFDEF GKH}
var
  i:Integer;
{$ENDIF}
begin
  {$IFDEF GKH}
    if not IsAccountRnGor then begin
      edRnGor.Visible:=false;
      lbRnGor.Visible:=false;
    end else begin
      LoadComboboxFromOpis(edRnGor,'KEY_RNGOR');
    end;
  {$ELSE}
    edPunkt.Width:=edUl.Width;
    edRnGor.Visible:=false;
    lbRnGor.Visible:=false;
  {$ENDIF}
  QueryUL.Open;
//  tbDom.Open;
  edPunktChange(nil);
  FClearKey := false;
  FAdd := false;
  FError:='';
  FResult:=2;
end;

// соберем все отдельно стоящие дома или населенный пункт без улиц
// Query.SQL.Text := 'SELECT * FROM БазаДомов WHERE PUNKT='+InttoStr(ti.ID)+
//    ' and DATE_FIKS='+''''+DTOS(DateFiks,tdAds)+'''' + ' and UL is null'+
//    ' ORDER BY dom,korp,kv';

//   Query.SQL.Text := 'SELECT * FROM БазаДомов WHERE PUNKT='+strPunkt+
//   ' and UL=' + InttoStr(ti.ID) +
//   ' and DATE_FIKS='+''''+DTOS(DateFiks,tdAds)+''''+
//   ' ORDER BY dom,korp,kv';

procedure TfmAddAdres.edULEditButtons0Click(Sender: TObject;
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

procedure TfmAddAdres.tbDomNAME_ADRESGetText(Sender: TField;  var Text: String; DisplayText: Boolean);
begin
  Text := '';
  {
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
//-----------------------------------------------------------------------------------------------
procedure TfmAddAdres.edPunktChange(Sender: TObject);
var
  old : TCursor;
begin
  IDAdres := 0;
  if edPunkt.Text='' then begin
    edUL.Value   := null;
    edUL.Enabled := false;
    edDom.Text  := '';
    edDom.Enabled:= false;
    edKorp.Text  := '';
    edKorp.Enabled:= false;
    edKv.Text  := '';
    edKv.Enabled:= false;
    edName.Text  := '';
    edName.Enabled:= false;
    cbNotUL.Enabled:=false;
    cbNotDom.Enabled:=false;
  end else begin
    cbNotUl.Enabled:=true;

    if cbNotUL.Checked then begin
      edUL.Enabled:=false;
      if edUL.Value<>null then edUL.Value:=null;
    end else begin
      edUL.Enabled:=true;
    end;

    if cbNotUL.Checked or (edUL.Value<>null) then begin
      if cbNotDom.Visible then cbNotDom.Enabled:=true;
      if cbNotDom.Checked then begin
        edDom.Text  := '';
        edDom.Enabled:= false;
        edKorp.Text  := '';
        edKorp.Enabled:= false;
      end else begin
        edDom.Enabled := true;
        edKorp.Enabled:= true;
      end;
      edKv.Enabled  := true;
      edName.Enabled:= true;
    end else begin
      if cbNotDom.Visible then cbNotDom.Enabled:=false;
      edDom.Text  := '';
      edDom.Enabled:= false;
      edKorp.Text  := '';
      edKorp.Enabled:= false;
      edKv.Text  := '';
      edKv.Enabled:= false;
      edName.Text  := '';
      edName.Enabled:= false;
    end;
  end;
end;

procedure TfmAddAdres.cbNotULClick(Sender: TObject);
begin
  edPunktChange(Sender);
end;

procedure TfmAddAdres.cbNotDomClick(Sender: TObject);
begin
  edPunktChange(Sender);
end;


procedure TfmAddAdres.UpdateActions;
begin
  inherited;
  if cbNotDom.Checked then begin
    btOk.Enabled := (edName.Text<>'') and (VarToStr(edPunkt.Value)<>'');
  end else begin
    btOk.Enabled := (edDom.Text<>'') and (VarToStr(edPunkt.Value)<>'');
  end;
end;

function TfmAddAdres.EditAdres: Boolean;
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

procedure TfmAddAdres.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
 if (Key>0) and (Key=VK_F2) and btOk.Enabled then begin
   btOkClick(nil);
 end;
end;

procedure TfmAddAdres.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmAddAdres.FormShow(Sender: TObject);
begin
//  if not tbDom.Active   then  tbDom.Active   := true;
  if not QueryUL.Active then  QueryUL.Active := true;
end;

procedure TfmAddAdres.btOkClick(Sender: TObject);
var
  strErr : String;
  nUL,nNewId : Integer;
  adr:TAdres;
begin
  if (edUL.Text='') or cbNotUL.Checked
    then nUL := -1
    else nUL := edUL.Value;

  adr.PunktKod:=edPunkt.Value;
  adr.UlicaInt:=nUL;
  adr.Dom:=Trim(edDom.Text);
  adr.Korp:=Trim(edKorp.Text);
  adr.Kv:=Trim(edKv.Text);
  adr.NotDom:=cbNotDom.Checked;
  adr.NameHouse:=Trim(edName.Text);
  if adr.NotDom then begin
    adr.Dom:='';
    adr.Korp:='';
  end;

  {$IFDEF GKH}
    adr.RnGor:=0;
    if edRnGor.ItemIndex>-1 then begin
      adr.RnGor:=StrToInt(edRnGor.KeyItems[edRnGor.ItemIndex]);
    end;
  {$ELSE}
    adr.RnGor:=0;
  {$ENDIF}

  if FType=1 then begin
    if dmBase.AddAdres(DateFiks, adr, nNewID, strErr)=0 then begin
      FAdd   := true;
      NewID := nNewID;
      ModalResult := mrOk;
    end else begin
      Beep;
      PutError(strErr);
    end;
  end else begin // 2
    FResult:=dmBase.AddAdres(DateFiks, adr, nNewID, strErr);  // возвращет 0 Ok!; 1 уже существует; -1 ошибка
    FError:=strErr;
    NewID:=nNewID;
    ModalResult:=mrOk;
  end;
end;


initialization

finalization

end.


