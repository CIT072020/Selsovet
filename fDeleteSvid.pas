unit fDeleteSvid;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fMain,
  TB2Dock, TB2Toolbar, StdCtrls, TB2Item, dBase, DBCtrlsEh, Db, DBLookupEh, FuncPr,
  Mask, OpisEdit, MetaTask, adsdata, adsfunc, adstable
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

{$I Task.inc}

type
  TfmDeleteSvid = class(TForm)
    lbDate: TLabel;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    AdsQuery1: TAdsQuery;
    Lb: TLabel;
    edDatePrix: TDBLookupComboboxEh;
    DataSource1: TDataSource;
    lbType: TLabel;
    edTypeSvid: TDBComboBoxEh;
    AdsQuery2: TAdsQuery;
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbClosedClick(Sender: TObject);
    procedure rbFullClick(Sender: TObject);
    procedure edTypeSvidChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetOper : Integer;
    function Date : TDateTime;
    function TypeSvid : Integer;
    procedure SetCaptionFull;
    procedure SetCaptionClosed;
    procedure UpdateActions; override;
  end;

const
  DELETE_FULL   = 0;
  DELETE_CLOSED = 1;


implementation

{$R *.DFM}


function TfmDeleteSvid.Date: TDateTime;
begin
  Result := edDatePrix.Value;
end;

function TfmDeleteSvid.GetOper: Integer;
begin
  result := DELETE_FULL;
//  if rbFull.Checked
//    then result := DELETE_FULL
//    else result := DELETE_CLOSED;
end;

procedure TfmDeleteSvid.TBItem2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmDeleteSvid.TBItem1Click(Sender: TObject);
var
  strErr,s1,s2 : String;
  d : TDateTime;
  n1,n2 : Integer;
begin
  strErr := '';
  if (edDatePrix.Value=null)  then begin
    strErr := '¬ыберите дату';
  end;
  if strErr='' then begin
    if edTypeSvid.ItemIndex=-1 then begin
      strErr := '«аполните тип';
    end;
  end;
  {
  if strErr = '' then begin
    if rbClosed.Checked then begin
      AdsQuery2.SQL.Text := 'SELECT count(*) FROM ListSvid WHERE svid_type='+IntToStr(TypeSvid)+' and datep='+
          QStr(FormatDateTime('yyyy-mm-dd',edDatePrix.Value))+' and sost=0';
      AdsQuery2.Open;
      if AdsQuery2.Fields[0].AsInteger > 0 then begin
        strErr := '  Ќе все свидетельства использованы !  '
      end;
      AdsQuery2.Close;
    end;
  end;
  }
  if strErr='' then begin
    ModalResult := mrOk;
  end else begin
    PutError(strErr);
  end;
end;

procedure TfmDeleteSvid.FormCreate(Sender: TObject);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  AdsQuery1.Open;
//  SetCaptionClosed;
  SetCaptionFull;
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

procedure TfmDeleteSvid.SetCaptionClosed;
begin
  lb.Caption := '';
end;

procedure TfmDeleteSvid.SetCaptionFull;
begin
  lb.Caption := '”даление из реестра свидетельств за выбранную дату их получени€. '+
   '–екомендуетс€ выполн€ть в случае ошибочного ввода прихода.';
//   'ќпераци€ выполнитс€ независимо от того, использованы или нет все свидетельства данного прихода.'+
end;

procedure TfmDeleteSvid.rbClosedClick(Sender: TObject);
begin
  SetCaptionClosed;
end;

procedure TfmDeleteSvid.rbFullClick(Sender: TObject);
begin
  SetCaptionFull;
end;

function TfmDeleteSvid.TypeSvid: Integer;
begin
  if edTypeSvid.ItemIndex<0 then begin
    Result := 0;
  end else begin
    Result := StrToInt(edTypeSvid.KeyItems[edTypeSvid.ItemIndex]);
  end;
end;

procedure TfmDeleteSvid.UpdateActions;
begin
  inherited;
  edDatePrix.Enabled := edTypeSvid.ItemIndex>-1;
end;

procedure TfmDeleteSvid.edTypeSvidChange(Sender: TObject);
begin
  AdsQuery1.Close;
  edDatePrix.Value:=null;
  if TypeSvid>0 then begin
    AdsQuery1.SQL.Text := 'SELECT distinct DATEP FROM ListSvid WHERE svid_type='+IntToStr(TypeSvid);
    AdsQuery1.Open;
  end;
end;

end.
