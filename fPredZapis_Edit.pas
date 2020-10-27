unit fPredZapis_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uDate, FuncPr, dbFunc, MetaTask, fPredZapis, uTypes, Dialogs, StdCtrls, Mask, DBCtrlsEh, Buttons, DBCtrls,
  DB;

type
  TfmPredZapis_Edit = class(TForm)
    Label1: TLabel;
    edBegin: TDBDateTimeEditEh;
    Label2: TLabel;
    Label3: TLabel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    DataSource: TDataSource;
    Label4: TLabel;
    edDateSost: TDBDateTimeEditEh;
    cbLong: TDBComboBoxEh;
    edSpec: TDBEditEh;
    Label5: TLabel;
    edTelefon: TDBEditEh;
    lbOn: TLabel;
    edON: TDBEditEh;
    edONA: TDBEditEh;
    lbOna: TLabel;
    edOpis: TDBEditEh;
    cbFirstBrak: TDBCheckBoxEh;
    Label8: TLabel;
    Label9: TLabel;
    edNomer: TDBNumberEditEh;
    Label10: TLabel;
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure edONUpdateData(Sender: TObject; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FAdd:Boolean;
    fm:TfmPredZapis;
    function EditModal:Boolean;
  end;

  function EditPredZapis_(lAdd:Boolean; nID:Integer; nNomer:Integer; nDay:Integer; tm:TDateTime; fmOwner:TfmPredZapis):Boolean;


implementation

{$R *.dfm}

//----------------------------------------------------
function EditPredZapis_(lAdd:Boolean; nID:Integer; nNomer:Integer; nDay:Integer; tm:TDateTime; fmOwner:TfmPredZapis):Boolean;
var
  f: TfmPredZapis_Edit;
  i,m:Integer;
begin
  f:=TfmPredZapis_Edit.Create(fmOwner);
  f.FAdd:=lAdd;
  f.DataSource.DataSet:=fmOwner.tbEdit;
  if fmOwner.FTypeObj=_TypeObj_ZRast then begin
    f.cbFirstBrak.Visible:=false;
    f.lbOn.Caption:='Он';
    f.lbOna.Caption:='Она';
  end;
  if nID>0 then begin
    if lAdd then begin
      f.Caption:='Создана предварительная запись: ';
//      f.btCancel.Enabled:=false;
    end else begin
      f.Caption:='Корректировка предварительной записи: ';
    end;
  end else begin
    f.Caption:='Создать предварительную запись: ';
  end;
  f.Caption:=f.Caption+IntToStr(nDay)+' '+NameM[1][fmOwner.FCurMonth];
  f.fm:=fmOwner;
  if nID>0 then begin
    fmOwner.ReadPredZapis(nID,true,false);
    m:=fmOwner.tbEditLONGR.AsInteger mod fmOwner.FCurLong;
    if fmOwner.tbEditDECL_ID.AsInteger>0 then begin
      f.edON.Color:=fmOwner.edBegin.Color;
      f.edON.ReadOnly:=true;
      f.edONA.Color:=fmOwner.edBegin.Color;
      f.edONA.ReadOnly:=true;
      f.ActiveControl:=f.edOpis;;
    end;
    if m>0 then begin // error
      PutError('Некорректная длительность регистрации: '+IntToStr(fmOwner.tbEditLONGR.AsInteger)+', изменена на '+IntToStr(fmOwner.FCurLong));
      EditDataSet(fmOwner.tbEdit);
      fmOwner.tbEditLONGR.AsInteger:=fmOwner.FCurLong;
      PostDataSet(fmOwner.tbEdit);
    end;
  end else begin
    fmOwner.ClearPredZapis(true);
    EditDataSet(fmOwner.tbEdit);
    fmOwner.tbEditID.AsInteger:=0;
    fmOwner.tbEditNOMER.AsInteger:=nNomer;
    fmOwner.tbEditDAY.AsInteger:=nDay;
    fmOwner.tbEditFIRST_BRAK.AsBoolean:=true;
    fmOwner.tbEditBEGINR.AsDateTime:=tm;
    fmOwner.tbEditLONGR.AsInteger:=fmOwner.FCurLong;
    fmOwner.tbEditDATER.AsDateTime:=Now;
    fmOwner.tbEditSPEC.AsString:=GlobalTask.ParamAsString('СПЕЦ_ЗАГС');
    PostDataSet(fmOwner.tbEdit);
  end;
  EditDataSet(fmOwner.tbEdit);
  f.cbLong.Items.Clear;
  case fmOwner.FCurLong of
     5 : m:=12;
    10 : m:=6;
    15 : m:=4;
    20 : m:=3;
    30 : m:=2;
    60 : m:=1;
  else
    m:=10;
  end;
  for i:=1 to m do begin
    f.cbLong.Items.Add(IntToStr(fmOwner.FCurLong*i));
  end;
  Result:=f.EditModal;
  f.Free;
end;
//----------------------------------------------------
function TfmPredZapis_Edit.EditModal:Boolean;
begin
  if ShowModal=mrOk then begin
    Result:=true;
  end else begin
    Result:=false;
  end;
end;

procedure TfmPredZapis_Edit.btOkClick(Sender: TObject);
var
  sErr,sOld:String;
begin
  if (edON.Text='') and (edONA.Text='') then begin
    sErr:='Заполните ФИО жениха или невесты';
  end else if cbLong.ItemIndex=-1 then begin
    sErr:='Заполните продолжительность регистрации';
  end else if (edNomer.Text='') or (edNomer.Text='0') then begin
    sErr:='Заполните номер';
  end;
  if sErr='' then begin
    DataSource.DataSet.CheckBrowseMode;
    if fm.FCheckNomer then begin
      sOld:=fm.tbPredZapis.IndexFieldNames;
      fm.tbPredZapis.IndexFieldNames:='TYPEOBJ;GOD;NOMER';
      try
        fm.tbPredZapis.SetRange([fm.FTypeObj,fm.FCurYear,edNomer.Value], [fm.FTypeObj,fm.FCurYear,edNomer.Value]);
        while not fm.tbPredZapis.Eof do begin
          if (fm.tbEditID.AsInteger=0) or (fm.tbEditID.AsInteger<>fm.tbPredZapis.FieldByName('ID').AsInteger) then begin
            sErr:='Запись с номером <'+edNomer.Text+'> уже существует';
            break;
          end;
          fm.tbPredZapis.Next;
        end;
      finally
        fm.tbPredZapis.CancelRange;
        fm.tbPredZapis.IndexFieldNames:=sOld;
      end;
    end;
  end;
  if sErr='' then begin
    ModalResult:=mrOk;
  end else begin
    PutError(sErr,self);
  end;
end;

procedure TfmPredZapis_Edit.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Key=VK_F2) and (Shift=[]) then begin
    btOkClick(nil);
  end else if (Key=VK_ESCAPE) and (Shift=[]) then begin
    if btCancel.Enabled
      then ModalResult:=mrCancel;
  end;
end;

procedure TfmPredZapis_Edit.edONUpdateData(Sender: TObject; var Handled: Boolean);
var
  ed : TDbEditEh;
begin
  ed := TDbEditEh(Sender);
  ed.Text:=FirstUpper(ed.text);
end;

procedure TfmPredZapis_Edit.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);
begin
  if FAdd then begin

  end else begin

  end;
end;

end.



