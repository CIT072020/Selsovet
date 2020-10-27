unit fPerexodSvid;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fMain,
  TB2Dock, TB2Toolbar, StdCtrls, TB2Item, dBase, DBCtrlsEh, Db, DBLookupEh, FuncPr,
  Mask, OpisEdit, MetaTask, adsdata, adsfunc, adstable
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

{$I Task.inc}

type
  TfmPerexodSvid = class(TForm)
    lbDate: TLabel;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    Lb: TLabel;
    DataSource1: TDataSource;
    AdsQuery2: TAdsQuery;
    edYear: TDBNumberEditEh;
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbClosedClick(Sender: TObject);
    procedure rbFullClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetOper : Integer;
    function Date : TDateTime;
    function TypeSvid : Integer;
    procedure SetCaptionFull;
    procedure SetCaptionClosed;
  end;


implementation

{$R *.DFM}


function TfmPerexodSvid.Date: TDateTime;
begin
  Result := STOD(IntToStr(edYear.Value)+'-01-01',tdAds);
end;

function TfmPerexodSvid.GetOper: Integer;
begin
  result := 0;
//  if rbFull.Checked
//    then result := DELETE_FULL
//    else result := DELETE_CLOSED;
end;

procedure TfmPerexodSvid.TBItem2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmPerexodSvid.TBItem1Click(Sender: TObject);
var
  strErr : String;
begin
  strErr := '';
  if (edYear.Value=null)  then begin
    strErr := 'Введите год';
  end;
  {
  if strErr = '' then begin
    if rbClosed.Checked then begin
      AdsQuery2.SQL.Text := 'SELECT count(*) FROM ListSvid WHERE svid_type='+IntToStr(TypeSvid)+' and datep='+
          QStr(FormatDateTime('yyyy-mm-dd',edDatePrix.Value))+' and sost=0';
      AdsQuery2.Open;
      if AdsQuery2.Fields[0].AsInteger > 0 then begin
        strErr := '  Не все свидетельства использованы !  '
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

procedure TfmPerexodSvid.FormCreate(Sender: TObject);
begin
  SetCaptionClosed;
  edYear.Value := StrToInt(FormatDateTime('yyyy',dmBase.getCurDate));
  edYear.MinValue := edYear.Value - 5;
  edYear.MaxValue := edYear.Value + 2;
end;

procedure TfmPerexodSvid.SetCaptionClosed;
begin
lb.Caption := 'При переходе на новый год будут удалены только те приходы '+
              '(группа свидетельств с одной датой прихода), по которым использованы '+
              'все свидетельства до 1 января выбранного года.'
//  lb.Caption := 'Удаление из реестра использованных свидетельств за выбранную дату их получения. '+
//   'Операция возможна только в том случае, если все свидетельства данного прихода использованы.'
end;

procedure TfmPerexodSvid.SetCaptionFull;
begin
  lb.Caption := 'Удаление из реестра использованных свидетельств за выбранную дату их получения. '+
   'Операция выполнится независимо от того использованы или нет все свидетельства данного прихода.'
end;

procedure TfmPerexodSvid.rbClosedClick(Sender: TObject);
begin
  SetCaptionClosed;
end;

procedure TfmPerexodSvid.rbFullClick(Sender: TObject);
begin
  SetCaptionFull;
end;

function TfmPerexodSvid.TypeSvid: Integer;
begin
  Result := 0;
end;


end.
