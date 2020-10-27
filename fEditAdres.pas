unit fEditAdres;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MetaTask, uTypes,uProjectAll,
  Db, adsdata, adsfunc, adstable, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, uProject,OpisEdit,
  Buttons, FuncPr, AddEvents, dBase
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmEditAdres = class(TForm)
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
    tbDomDATE_FIKS: TDateField;
    tbDomID: TIntegerField;
    tbDomPUNKT: TIntegerField;
    tbDomUL: TIntegerField;
    tbDomDOM: TAdsStringField;
    tbDomKORP: TAdsStringField;
    tbDomKV: TAdsStringField;
    tbDomTIP: TIntegerField;
    tbDomNAME_ADRES: TStringField;
    edDom: TDBEditEh;
    edKorp: TDBEditEh;
    edKv: TDBEditEh;
    Label4: TLabel;
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
    FCount : Integer;
  public
    oldAdres  : TAdres;
    DateFiks : TDateTime;
    SeekLichSchet : Boolean;
    IDAdres : Integer;
    function EditAdres : Boolean;
    procedure UpdateActions; override;
  end;

  function EditAdres( ds : TDataSet ) : Boolean;

implementation

uses fAddUL, fMain;

var
  fmEditAdres: TfmEditAdres;


{$R *.DFM}

function EditAdres( ds : TDataSet ) : Boolean;
var
  s : String;
begin
   Result:=false;
  if ds.FieldByName('ID').AsString<>'' then begin
    fmEditAdres := TfmEditAdres.Create(nil);
    fmEditAdres.oldAdres:=dmBase.AdresForSeek(ds);
    fmEditAdres.oldAdres.NameHouse:=dmBase.NameBigHouse(fmEditAdres.oldAdres,fmMain.DateFiks);
    fmEditAdres.IDAdres := ds.FieldByName('ID').AsInteger;
    if EnableNotDom then begin
      fmEditAdres.cbNotDom.Visible:=true;
      fmEditAdres.cbNotDom.Checked:=fmEditAdres.oldAdres.NotDom;
    end else begin
      fmEditAdres.cbNotDom.Checked:=false;
      fmEditAdres.cbNotDom.Visible:=false;
      if not EnableNameHouse then begin
        fmEditAdres.lbName.Visible:=false;
        fmEditAdres.edName.Visible:=false;
      end;
    end;
    fmEditAdres.edPunkt.Value:=ds.FieldByName('PUNKT').AsInteger;
    s:=dmBase.UlicaAsStringForAdres(ds.FieldByName('UL').AsString,false);
    if s='' then begin
      fmEditAdres.cbNotUL.Checked :=true;
      fmEditAdres.edUL.Value:=null;
      fmEditAdres.edUL.Enabled:=false;
    end else begin
      fmEditAdres.cbNotUL.Checked :=false;
      fmEditAdres.edUL.Value:=s;
      fmEditAdres.edUL.Enabled:=true;
    end;
    fmEditAdres.edDom.Value:=Trim(ds.FieldByName('DOM').AsString);
    fmEditAdres.edKorp.Value:=Trim(ds.FieldByName('KORP').AsString);
    fmEditAdres.edKv.Value:=Trim(ds.FieldByName('KV').AsString);
    fmEditAdres.edName.Value:=fmEditAdres.oldAdres.NameHouse;
    Result := false;
    try
      if fmEditAdres.ShowModal=mrOk then begin
        Result:=true;
      end;
    finally
      fmEditAdres.Free;
    end;
  end;
end;

procedure TfmEditAdres.FormCreate(Sender: TObject);
{$IFDEF GKH}
var
  Opis : TOpisEdit;
  i:Integer;
{$ENDIF}
begin
  {$IFDEF GKH}
    Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_RNGOR');
    if Opis.Items.Count=0 then begin
      edRnGor.Visible:=false;
      lbRnGor.Visible:=false;
    end else begin
      for i:=0 to Opis.Items.Count-1 do begin
        edRnGor.Items.Add(Opis.Items[i]);
        edRnGor.KeyItems.Add(Opis.KeyList[i]);
      end;
    end;
  {$ELSE}
    edRnGor.Visible:=false;
    lbRnGor.Visible:=false;
  {$ENDIF}
  QueryUL.Open;
  tbDom.Open;
  edPunktChange(nil);
  FClearKey := false;
  FAdd := false;
  FCount := 0;
end;

procedure TfmEditAdres.edULEditButtons0Click(Sender: TObject;
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

procedure TfmEditAdres.tbDomNAME_ADRESGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := '';
  if tbDomDOM.AsString <> '' then begin
    Text := sokrDom+' '+tbDomDOM.AsString;
  end;
  if tbDomKORP.AsString<>'' then begin
    if Text = '' then Text := sokrKorp+' '+tbDomKORP.AsString
                 else Text := Text + ', '+sokrKorp+' '+tbDomKORP.AsString;
  end;
  if tbDomKV.AsString<>'' then begin
    if Text = '' then Text := sokrKv+' '+tbDomKV.AsString
                 else Text := Text + ', '+sokrKv+' '+tbDomKV.AsString;
  end;
end;

procedure TfmEditAdres.edPunktChange(Sender: TObject);
var
  old : TCursor;
begin
  tbDom.DisableControls;
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  if EnableNotDom then begin
    edDom.Visible:= not cbNotDom.Checked;
    edKorp.Visible:= not cbNotDom.Checked;
  end;

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
  end else begin
    if cbNotUL.Checked then begin
      edUL.Enabled := false;
      tbDom.SetRange([DateFiks,edPunkt.Value,null],[DateFiks,edPunkt.Value,null]);
      edDom.Enabled:= true;
      edKorp.Enabled:= true;
      edKv.Enabled:= true;
      edName.Enabled:= true;
    end else begin
      edUL.Enabled := true;
      if edUL.Text='' then begin
        edDom.Text  := '';
        edDom.Enabled:= false;
        edKorp.Text  := '';
        edKorp.Enabled:= false;
        edKv.Text  := '';
        edKv.Enabled:= false;
        edName.Text  := '';
        edName.Enabled:= false;
      end else begin
        tbDom.SetRange([DateFiks,edPunkt.Value,edUL.Value],[DateFiks,edPunkt.Value,edUL.Value]);
        edDom.Enabled:= true;
        edKorp.Enabled:= true;
        edKv.Enabled:= true;
        edName.Enabled:= true;
      end;
    end;
  end;
  Screen.Cursor := old;
  tbDom.EnableControls;
end;

procedure TfmEditAdres.cbNotULClick(Sender: TObject);
begin
  edPunktChange(Sender);
end;

procedure TfmEditAdres.cbNotDomClick(Sender: TObject);
begin
  edPunktChange(Sender);
end;


procedure TfmEditAdres.UpdateActions;
begin
  inherited;
  if cbNotDom.Checked then begin
    btOk.Enabled := (edName.Text<>'') and (VarToStr(edPunkt.Value)<>'');
  end else begin
    btOk.Enabled := (edDom.Text<>'') and (VarToStr(edPunkt.Value)<>'');
  end;
end;

function TfmEditAdres.EditAdres: Boolean;
begin
  try
    if edPunkt.Text='' then begin
      ActiveControl := edPunkt;
    end else if edUL.Text='' then begin
      if cbNotUL.Checked then begin
        if cbNotDom.Checked then begin
          ActiveControl := edPunkt;
        end else begin
          ActiveControl := edDom;
        end;
      end else begin
        ActiveControl := edUL;
      end;
    end else begin
      if cbNotDom.Checked then begin
        ActiveControl := edPunkt;
      end else begin
        ActiveControl := edDom;
      end;
    end;
  except
    ActiveControl := edPunkt;
  end;
  Result := false;
  if ShowModal = mrOk then begin
    Result := true;
  end;
end;

procedure TfmEditAdres.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
 if (Key>0) and (Key=VK_F2) and btOk.Enabled then begin
   btOkClick(nil);
 end;
end;

procedure TfmEditAdres.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmEditAdres.FormShow(Sender: TObject);
begin
  if not tbDom.Active   then  tbDom.Active   := true;
  if not QueryUL.Active then  QueryUL.Active := true;
end;

procedure TfmEditAdres.btOkClick(Sender: TObject);
var
  strErr,s1,s2 : String;
  nUL : Integer;
  newAdres : TAdres;
  lOk:Boolean;
begin
  if (edUL.Text='') or cbNotUL.Checked
    then nUL := 0
    else nUL := edUL.Value;
  newAdres.Punkt:=VarToStr(edPunkt.Value);
  newAdres.Ulica:=dmBase.UlicaAsStringForAdres(IntToStr(nUL),false);
  newAdres.UlicaInt:=nUL;
  newAdres.Dom:=dmBase.GetNomerDom(Trim(edDom.Text));
  newAdres.Korp:=dmBase.GetNomerDom(Trim(edKorp.Text));
  newAdres.Kv:=Trim(edKv.Text);
  newAdres.NameHouse:=Trim(edName.Text);
  if EnableNotDom and cbNotDom.Checked then begin
    ID2Str(IDAdres,SIZE_FIELD_DOM,s1,s2);
    newAdres.Dom:=s2;
    newAdres.Korp:=s1;
    newAdres.NotDom:=true;
  end else begin
    newAdres.NotDom:=false;
  end;
  {$IFDEF GKH}
    newAdres.RnGor:=0;
    if edRnGor.ItemIndex>-1 then begin
      newAdres.RnGor:=StrToInt(edRnGor.KeyItems[edRnGor.ItemIndex]);
    end;
  {$ELSE}
    newAdres.RnGor:=0;
  {$ENDIF}
  // может ничего не изменилось ?
  if (newAdres.Punkt=oldAdres.Punkt) and (newAdres.UlicaInt=oldAdres.UlicaInt) and
     (Trim(newAdres.Dom)=Trim(oldAdres.Dom)) and (Trim(newAdres.Korp)=Trim(oldAdres.Korp)) and
     (Trim(newAdres.Kv)=Trim(oldAdres.Kv)) then begin
    lOk:=true;
  end else begin
    lOk:=dmBase.ChangeAdres(fmMain.DateFiks, IDAdres, oldAdres,newAdres, strErr);
  end;
//  if dmBase.ChangeAdres(fmMain.DateFiks, IDAdres, oldAdres,newAdres, strErr) then begin
  if lOk then begin
    if newAdres.NameHouse<>oldAdres.NameHouse then begin
      dmBase.SaveNameBigHouse(newAdres.nameHouse,newadres,fmMain.DateFiks );
    end;
    ModalResult:=mrOk;
  end else begin
    Beep;
    PutError(strErr);
  end;
end;

initialization
finalization
end.


