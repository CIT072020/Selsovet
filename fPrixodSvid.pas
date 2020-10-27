unit fPrixodSvid;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fMain, uTypes,
  TB2Dock, TB2Toolbar, StdCtrls, TB2Item, dBase, DBCtrlsEh, Db, DBLookupEh,
  Mask, OpisEdit, MetaTask, funcPr
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

{$I Task.inc}

type
  TfmPrixodSvid = class(TForm)
    lbDate: TLabel;
    lbSeria: TLabel;
    lbNomer1: TLabel;
    lbNomer2: TLabel;
    lbType: TLabel;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    edDate: TDBDateTimeEditEh;
    edTypeSvid: TDBComboBoxEh;
    edSeria: TDBLookupComboboxEh;
    dsSeria: TDataSource;
    edNomer1: TDBEditEh;
    edNomer2: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure edNomer1UpdateData(Sender: TObject; var Handled: Boolean);
    procedure edNomer2UpdateData(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function Date : TDateTime;
    function TypeSvid : Integer;
    function Seria : String;
    function Nomer1 : String;
    function Nomer2 : String;
  end;

const
//  OSTAT_SVID  = 0;
  PRIXOD_SVID = 0;
  DELETE_SVID = 1;
  PEREXOD_GOD = 2;
//  PEREXOD_MES = 4;


implementation

{$R *.DFM}


function TfmPrixodSvid.Date: TDateTime;
begin
  Result := edDate.Value;
end;

procedure TfmPrixodSvid.FormCreate(Sender: TObject);
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
  dsSeria.DataSet := dmBase.SvidSeria;
end;

function TfmPrixodSvid.Nomer1: String;
begin
  Result := edNomer1.Text;
end;

function TfmPrixodSvid.Nomer2: String;
begin
  Result := edNomer2.Text;
end;

function TfmPrixodSvid.Seria: String;
begin
  Result := edSeria.Text;
end;

function TfmPrixodSvid.TypeSvid: Integer;
begin
  if edTypeSvid.ItemIndex<0 then begin
    Result := 0;
  end else begin
    Result := StrToInt(edTypeSvid.KeyItems[edTypeSvid.ItemIndex]);
  end;
end;

procedure TfmPrixodSvid.TBItem2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmPrixodSvid.TBItem1Click(Sender: TObject);
var
  strErr,s1,s2 : String;
  d : TDateTime;
  n1,n2 : Integer;
begin
  strErr := '';
  if (edDate.Value=null) or (edDate.Text='') then begin
    strErr := 'Введите дату';
  end else begin
    try
      d := edDate.Value;
    except
      strErr := 'Введите корректно дату';
    end;
  end;
  if strErr='' then begin
      if strErr='' then begin
        if edTypeSvid.ItemIndex=-1 then begin
          strErr := 'Заполните тип';
        end;
      end;
      if strErr='' then begin
        if edSeria.Text='' then begin
          strErr := 'Заполните серию';
        end;
      end;
      edNomer1.Text := PadLStr(Trim(edNomer1.Text),SVID_LEN,'0');
      edNomer2.Text := PadLStr(Trim(edNomer2.Text),SVID_LEN,'0');
      Application.ProcessMessages;
      if strErr='' then begin
        if Trim(edNomer1.Text) = ''then begin
          strErr := 'Заполните начальный номер';
        end else if Length(Trim(edNomer1.Text)) < SVID_LEN then begin
          strErr := 'Введите корректно начальный номер';
        end;
        if strErr='' then begin
          if Trim(edNomer2.Text) = ''then begin
            strErr := 'Заполните конечный номер';
          end else if Length(Trim(edNomer2.Text)) < SVID_LEN then begin
            strErr := 'Введите корректно конечный номер';
          end;
        end;
      end;
      if strErr='' then begin
        s1 := Trim(edNOMER1.Text);
        while Copy(s1,1,1)='0' do s1:=Copy(s1,2,SVID_LEN);
        s2 := Trim(edNomer2.Text);
        while Copy(s2,1,1)='0' do s2:=Copy(s2,2,SVID_LEN);
        if s1='' then begin
          strErr := 'Незаполнен начальный номер';
        end;
        if s2='' then begin
          strErr := 'Незаполнен конечный номер';
        end;
        if strErr='' then begin
          n1 := StrToInt(s1);
          n2 := StrToInt(s2);
          if (n2>n1) and ((n2-n1)>100) then begin
            if not Problem('Между номерами: '+edNOMER1.Text+' и '+edNOMER2.Text+' более 100 свидетельств.'+
               Chr(13)+'Вы уверены ?') then begin
              strErr := 'Отказ от выполнения';
            end;
          end else if (n2<n1) then begin
            strErr := 'Несоотвествие номеров: '+ edNOMER1.Text + ' и ' + edNomer2.Text;
          end;
        end;
      end;
  end;
  if strErr = '' then begin
    ModalResult := mrOk;
  end else begin
    PutError(strErr);
  end;
end;

procedure TfmPrixodSvid.edNomer1UpdateData(Sender: TObject;
  var Handled: Boolean);
begin
  edNomer1.Text := PadLStr(Trim(edNomer1.Text),SVID_LEN,'0');
end;

procedure TfmPrixodSvid.edNomer2UpdateData(Sender: TObject;
  var Handled: Boolean);
begin
  edNomer2.Text := PadLStr(Trim(edNomer2.Text),SVID_LEN,'0');
end;

end.
