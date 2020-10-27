unit fMenDvig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dBase, dMen, AddEvents,
  fShablon,uProject,DateUtils, uTypes, ToolCtrlsEh,
  ExtCtrls, DBCtrlsEh, StdCtrls, Mask, DBLookupEh, DB,  Dialogs, Buttons, MetaTask,OpisEdit, uFunc, dbFunc;

type
  TfmMenDvig = class(TForm)
    dsRN: TDataSource;
    dsObl: TDataSource;
    dsStran: TDataSource;
    dsTypeGorod: TDataSource;
    dsMigr: TDataSource;
    gbOtkudaPrib: TGroupBox;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    edOP_B_GOROD: TDBLookupComboboxEh;
    edOP_GOROD: TDBEditEh;
    edOP_RAION1: TDBLookupComboboxEh;
    edOP_OBL1: TDBLookupComboboxEh;
    cbOP_B_OBL: TDBCheckBoxEh;
    cbOP_B_RESP: TDBCheckBoxEh;
    edOP_GOSUD: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edDate: TDBDateTimeEditEh;
    edType: TDBComboBoxEh;
    edContant: TDBComboBoxEh;
    edDateSrok: TDBDateTimeEditEh;
    edPrich: TDBLookupComboboxEh;
    edOrgan: TDBEditEh;
    Panel1: TPanel;
    btOk: TBitBtn;
    BitBtn2: TBitBtn;
    dsTypeMigr: TDataSource;
    edOP_OBL: TDBEditEh;
    edOP_RAION: TDBEditEh;
    procedure edPrichEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edContantChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edTypeChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edDateUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edDateSrokUpdateData(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
    FClearKey:Boolean;
  public
    { Public declarations }
    procedure SetMRUList(ed:TDbEditEh;nLimit:Integer;nType:Integer;lAll:Boolean;lReload:Boolean;lBel:Boolean;lAddButton:Boolean;lPunktFromSpr:Boolean=false);
    procedure MRUListOpen(Sender: TObject;  var Handled: Boolean);
    procedure UpdateActions; override;
  end;

var
  fmMenDvig: TfmMenDvig;

implementation

{$R *.dfm}

procedure TfmMenDvig.edPrichEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  Opis:TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_TYPEMIGR');
  if Opis <> nil then begin
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      edPrich.Value:=v;
      Handled:=true;
    end;
  end;
end;

procedure TfmMenDvig.edContantChange(Sender: TObject);
begin
  try
    if edContant.Value=true then begin
      edDateSrok.Value:=null;
      edDateSrok.Enabled:=false;
    end else begin
      edDateSrok.Enabled:=true;
    end;
  except
    edDateSrok.Enabled:=true;
  end;
end;

procedure TfmMenDvig.btOkClick(Sender: TObject);
begin
  if not ((edDate.Value=null) or (edContant.Text='') or (edType.Text='')) then begin
    ModalResult:=mrOk;
  end;
end;

procedure TfmMenDvig.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key = VK_F2 then begin
    btOkClick(nil);
  end;
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift, nil);
end;

procedure TfmMenDvig.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;

procedure TfmMenDvig.UpdateActions;
begin
  inherited;
  if ((edDate.Value=null) or (edContant.Text='') or (edType.Text='')) then begin
    btOk.Enabled:=false;
  end else begin
    btOk.Enabled:=true;
  end;
end;

procedure TfmMenDvig.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  FClearKey:=false;
  LoadPosForm( Self );

  i:=LimitMRUList(1);
  SetMRUList(edOP_OBL,i,1,true,false,false,true); //FAddButtonMRUList);

  i:=LimitMRUList(2);
  SetMRUList(edOP_RAION,i,2,true,false,false,true); //FAddButtonMRUList);

  i:=LimitMRUList(3);
  SetMRUList(edOP_GOROD,i,3,true,false,false,true);
end;

procedure TfmMenDvig.SetMRUList(ed: TDbEditEh; nLimit, nType: Integer; lAll, lReload, lBel: Boolean;lAddButton:Boolean; lPunktFromSpr:Boolean);
var
  bt : TEditButtonEh;
begin
  if (nType=3) and lPunktFromSpr then begin  // загружать населенные путкты из спраочника нас. пунктов
    ed.MRUList.Items:=GetMRUName_Punkt(lBel,lReload);
  end else if (nType=4) then begin  //
    ed.MRUList.Items:=GetMRU_MKB10(false);
  end else begin
    ed.MRUList.Items:=GetMRUName(nType,lAll,lReload,lBel);
  end;
  if ed.MRUList.Items.Count>0 then begin
//    ed.OnChange:=DbEditMRUList_Change;
    ed.MRUList.Rows:=15;
    ed.MRUList.Active:=true;
    ed.MRUList.AutoAdd:=false;
    if nLimit>0 then  ed.MRUList.Limit:=nLimit;
    if lAddButton then begin
      if ed.EditButtons.Count=0 then begin
        bt := ed.EditButtons.Add;
      end else begin
        bt := ed.EditButtons[0];
      end;
      bt.OnClick := MRUListOpen;
      bt.Visible := true;
    end else begin
    end;
  end;
end;

//--------------------------------------------------------------------------
procedure TfmMenDvig.MRUListOpen(Sender: TObject;  var Handled: Boolean);
begin
  if Sender is TDbEditEh then begin
    if not TDbEditEh(Sender).MRUList.DroppedDown
      then TDbEditEh(Sender).MRUList.DropDown
      else TDbEditEh(Sender).MRUList.CloseUp(false);
  end else begin
    if not TDbEditEh(TControl(Sender).Parent).MRUList.DroppedDown
      then TDbEditEh(TControl(Sender).Parent).MRUList.DropDown
      else TDbEditEh(TControl(Sender).Parent).MRUList.CloseUp(false);
  end;
end;

procedure TfmMenDvig.edOrganEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD,Trim(edOrgan.Text));
 if s<>'' then begin
   edOrgan.Text:=s;
 end;
end;

procedure TfmMenDvig.edTypeChange(Sender: TObject);
begin
  if edType.ItemIndex=1
    then gbOtkudaPrib.Caption:=' Куда убыл '
    else gbOtkudaPrib.Caption:=' Откуда прибыл ';
end;

procedure TfmMenDvig.FormDestroy(Sender: TObject);
begin
  SavePosForm( Self );
end;

procedure TfmMenDvig.edDateUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  CheckErrorDate(edDate.Value, _TypeObj_TalonPrib, 0, 0 );
end;

procedure TfmMenDvig.edDateSrokUpdateData(Sender: TObject; var Handled: Boolean);
begin
  CheckErrorDate(edDateSrok.Value, 0, IncYear(Date,-10), IncYear(Date,25) );
  if (edDateSrok.Value<>null) and (edDate.Value<>null) then begin
    if (edDateSrok.Value<edDate.Value) then begin
      raise EMyError.Create('Дата срока не может быть меньше даты прибытия(убытия).');
    end;
  end;
end;

end.
