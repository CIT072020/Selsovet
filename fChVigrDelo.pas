unit fChVigrDelo;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils, FileCtrl,
  fSimpleDialog, StdCtrls, Buttons, ExtCtrls, dBase, OpisEdit, MetaTask, dbFunc, NewDialogs,
  Db, DBLookupEh, Mask, DBCtrlsEh, FuncPr
  {$IFDEF VER150} ,Variants {$ENDIF}  ;

type

  TVigrDelo=class(TObject)
  public
    Dir:String;
    Delo:Integer;
    //slDelo:TStringList; ???
    IsDate:Boolean;
    Date1:TDateTime;
    Date2:TDateTime;
    OpenFolder:Boolean;
    procedure Save;
    constructor Create;
    destructor Destroy; override;
  end;

  TfmChVigrDelo = class(TfmSimpleDialog)
    Label1: TLabel;
    Label2: TLabel;
    edDir: TDBEditEh;
    dsSprTypeHouse: TDataSource;
    gbDate: TGroupBox;
    lbDate2: TLabel;
    edDate2: TDBDateTimeEditEh;
    edDate1: TDBDateTimeEditEh;
    lbDate1: TLabel;
    cbDateDelo: TCheckBox;
    edDelo: TDBEditEh;
    cbOpenFolder: TCheckBox;
    procedure edDeloEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edDirEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure cbDateDeloClick(Sender: TObject);
    procedure edDeloDblClick(Sender: TObject);
    procedure edDeloKeyDown(Sender: TObject; var Key: Word;      Shift: TShiftState);
  private
    { Private declarations }
    FDelo:Integer;
  public
    { Public declarations }
    procedure UpdateActions; override;
    function CheckOk : Boolean; override;
    procedure SetDelo(nValue:Integer);
    function GetDelo:Integer;
    procedure CheckControls;

  end;

  function ChoiceVigrDelo(vd : TVigrDelo):Boolean;


implementation

uses fMain, mAdsObj, mDRecInt, fSprEdit, fChoiceNomen;

{$R *.DFM}


function ChoiceVigrDelo(vd : TVigrDelo):Boolean;
var
  f: TfmChVigrDelo;
begin
  Result:=false;
  f:=TfmChVigrDelo.Create(nil);
  f.edDir.Text:=vd.Dir;
  f.SetDelo(vd.Delo);
  f.edDate1.Value:=vd.Date1;
  f.edDate2.Value:=vd.Date2;
  f.cbDateDelo.Checked:=vd.IsDate;
  f.cbOpenFolder.Checked:=vd.OpenFolder;
  f.CheckControls;
  if f.ShowModal=mrOk then begin
    Result:=true;
    vd.Dir:=f.edDir.Text;
    vd.Delo:=f.GetDelo;
    vd.Date1:=f.edDate1.Value;
    vd.Date2:=f.edDate2.Value;
    vd.IsDate:=f.cbDateDelo.Checked;
    vd.OpenFolder:=f.cbOpenFolder.Checked;
    vd.Save;
  end;
  FreeAndNil(f);
end;

procedure TfmChVigrDelo.UpdateActions;
begin
  btOk.Enabled:=(Trim(edDelo.Text)<>'') and (Trim(edDir.Text)<>'');
  if cbDateDelo.Checked then begin
    btOk.Enabled:=btOk.Enabled and (edDate1.Value<>null) and (edDate2.Value<>null)
  end;
end;

function TfmChVigrDelo.CheckOk: Boolean;
begin
  Result:=true;
end;


{ TVigrDelo }

constructor TVigrDelo.Create;
var
  nYear, nMonth, nDay:Word;
begin
 Dir:=GlobalTask.GetLastValueAsString('VIGRDELO_PATH');
 if Dir=''
   then Dir:=ExtractFilePath(Application.ExeName)+'Export\';
 OpenFolder:=(GlobalTask.GetLastValueAsString('VIGRDELO_OPENFOLDER')<>'0');
 Delo:=GlobalTask.GetLastValueAsInteger('VIGRDELO_ID');
 IsDate:=(GlobalTask.GetLastValueAsString('VIGRDELO_ISDATE')<>'0');
 Date1:=GlobalTask.GetLastValueAsDate('VIGRDELO_DATE1',false);
 Date2:=GlobalTask.GetLastValueAsDate('VIGRDELO_DATE2',false);
 if (Date1=0) or (Date2=0) then begin
   DecodeDate(Now, nYear, nMonth, nDay);
   Date1:=StartOfAYear(nYear-1);
   Date2:=EndOfAYear(nYear-1);
 end;
end;

procedure TfmChVigrDelo.edDeloEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
//  fi:TFieldItem;
  s:String;
//  KeyValue:String;
  n:Integer;
//  LinkSpr:TDBItem;
begin
  n:=ChoiceNomen(2,true,false,'');
  if (n>0)
    then SetDelo(n);
  {
  LinkSpr:=fmMain.DocRecord.SprDBItems.ByName('SP_FILELIST');
  if SelectSprValue(LinkSpr, KeyValue, LinkSpr.CodeFieldName, '') then begin
    edDelo.Value:=
  end;
  }

end;

function TfmChVigrDelo.GetDelo: Integer;
begin
  Result:=FDelo;
end;

procedure TfmChVigrDelo.SetDelo(nValue: Integer);
begin
  FDelo:=nValue;
  if (FDelo>0) and dmBase.SprDocFileList.Locate('ID', FDelo, []) then begin
    edDelo.Hint:=dmBase.SprDocFileList.FieldByName('NAME').AsString;
    edDelo.Text:=dmBase.SprDocFileList.FieldByName('FILE_IND').AsString+' '+edDelo.Hint;
  end else begin
    FDelo:=0;
    edDelo.Hint:='';
    edDelo.Text:='';
  end;
    {
    n:=dmBase.GetDateDelo(1, dmBase.SprDocFileList.FieldByName('ID').AsInteger, d1, d2, s);
    if (n>0) and (d2>0) then begin
      Text:=Text+s;
      c:=clRed;
      edDelo.Font.Color:=clRed;
    end;
    }
end;

procedure TfmChVigrDelo.CheckControls;
var
  l:Boolean;
begin
  l:=cbDateDelo.Checked;
  edDate1.Enabled:=l;
  edDate2.Enabled:=l;
  lbDate1.Enabled:=l;
  lbDate2.Enabled:=l;
end;

procedure TfmChVigrDelo.cbDateDeloClick(Sender: TObject);
begin
  CheckControls;
end;

procedure TfmChVigrDelo.edDeloKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  case Key of
   VK_RETURN : edDeloDblClick(Sender);
//   VK_ESCAPE : Modalresult:=mrCancel;
//   VK_F10   : btShablonClick(nil);
  end;
end;

procedure TfmChVigrDelo.edDirEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
 edDeloDblClick(Sender);
end;

procedure TfmChVigrDelo.edDeloDblClick(Sender: TObject);
var
  s:String;
begin
  s:=edDir.Text;
  if SelectDirectory('Выберите папку для выгрузки', '', s) then begin
    edDir.Text:=s;
  end;
end;

destructor TVigrDelo.Destroy;
begin
  inherited;
end;

procedure TVigrDelo.Save;
begin
  GlobalTask.SetLastValueAsString('VIGRDELO_PATH', Dir);
  GlobalTask.SetLastValueAsInteger('VIGRDELO_ID', Delo);
  GlobalTask.SetLastValueAsBoolean('VIGRDELO_ISDATE', IsDate);
  GlobalTask.SetLastValueAsDate('VIGRDELO_DATE1', Date1);
  GlobalTask.SetLastValueAsDate('VIGRDELO_DATE2', Date2);
  GlobalTask.SetLastValueAsBoolean('VIGRDELO_OPENFOLDER', OpenFolder);
end;

end.
