unit fParamsAlfavit;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fMain, uTypes,
  TB2Dock, TB2Toolbar, StdCtrls, TB2Item, dBase, DBCtrlsEh, Db, DBLookupEh,
  Mask, OpisEdit, MetaTask, funcPr, Buttons
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

{$I Task.inc}

type
  TfmParamsAlfavit = class(TForm)
    lbType: TLabel;
    edTypeSvid: TDBComboBoxEh;
    Label1: TLabel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    edZAGS: TDBLookupComboboxEh;
    DataSource1: TDataSource;
    cbNomerCur: TDBCheckBoxEh;
    cbAutoAdd: TDBCheckBoxEh;
    Label2: TLabel;
    edYear: TDBNumberEditEh;
    cbOnlyYear: TDBCheckBoxEh;
    lbVosstan: TLabel;
    edVosstan: TDBComboBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure edTypeSvidEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edZAGSEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure btOkClick(Sender: TObject);
    procedure edTypeSvidChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function TypeSvid : Integer;
    function GetVosstan : Integer;
    procedure SetVosstan(n:Integer);
    function Year : Integer;
    function ZAGS_ID   : Integer;
    function ZAGS_NAME : String;
    procedure UpdateActions; override;
  end;

implementation

{$R *.DFM}


procedure TfmParamsAlfavit.FormCreate(Sender: TObject);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  {$IFDEF ZAGS}
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS');
  {$ELSE}
    Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEZAGS_S');
  {$ENDIF}
  for i:=0 to Opis.Items.Count-1 do begin
    edTypeSvid.Items.Add(Opis.Items[i]);
    edTypeSvid.KeyItems.Add(Opis.KeyList[i]);
  end;
end;

function TfmParamsAlfavit.TypeSvid: Integer;
begin
  if edTypeSvid.ItemIndex<0 then begin
    Result := 0;
  end else begin
    Result := StrToInt(edTypeSvid.KeyItems[edTypeSvid.ItemIndex]);
  end;
end;

procedure TfmParamsAlfavit.TBItem2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmParamsAlfavit.TBItem1Click(Sender: TObject);
var
  strErr,s1,s2 : String;
  d : TDateTime;
  n1,n2 : Integer;
begin
  strErr := '';
  if strErr='' then begin

  end;
  if strErr = '' then begin
    ModalResult := mrOk;
  end else begin
    PutError(strErr);
  end;
end;

procedure TfmParamsAlfavit.edTypeSvidEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  edTypeSvid.ItemIndex := -1;
end;

procedure TfmParamsAlfavit.edZAGSEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  edZAGS.Value:=null;
  edZAGS.Text:= '';
end;

function TfmParamsAlfavit.ZAGS_ID: Integer;
begin
  Result := 0;
  if edZAGS.Value<>null then Result := edZAGS.Value;
end;

function TfmParamsAlfavit.ZAGS_NAME: String;
begin
  Result := '';
  if edZAGS.Value=null then Result := Trim(edZAGS.Text);
end;

function TfmParamsAlfavit.Year: Integer;
begin
  try
    Result := StrToInt(edYear.Text);
  except
    Result := 0;
  end;
end;

procedure TfmParamsAlfavit.UpdateActions;
begin
  inherited;
  btOk.Enabled := (edZAGS.Text<>'') and (edYear.Text<>'') and (edTypeSvid.ItemIndex>-1);
end;

procedure TfmParamsAlfavit.btOkClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmParamsAlfavit.edTypeSvidChange(Sender: TObject);
var
  lOk:Boolean;
begin
  if (edTypeSvid.ItemIndex>-1) then begin
    if StrToInt(edTypeSvid.KeyItems[edTypeSvid.ItemIndex])=_TypeObj_ZRogd
      then lOk:=true
      else lOk:=false;
  end else begin
    lOk:=false;
  end;
  if lOk then begin
    edVosstan.Enabled:=true;
    lbVosstan.Enabled:=true;
  end else begin
    edVosstan.ItemIndex:=2;
    edVosstan.Enabled:=false;
    lbVosstan.Enabled:=false;
  end;
end;

function TfmParamsAlfavit.GetVosstan: Integer;
begin
  if edVosstan.ItemIndex>-1 then begin
    Result:=StrToInt(edVosstan.KeyItems[edVosstan.ItemIndex]);
  end else begin
    Result:=2;
  end;
end;

procedure TfmParamsAlfavit.SetVosstan(n:Integer);
begin
  if (n>=0) and (n<=2) then begin
    edVosstan.ItemIndex:=n;
  end else begin
    edVosstan.ItemIndex:=2;
  end;
end;

end.
