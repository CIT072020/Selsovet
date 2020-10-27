unit fChLoadClassif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fSimpleDialog, StdCtrls, Buttons, ExtCtrls, adstable, adsdata, uTypes,
  DB, DBCtrlsEh, Mask, DBLookupEh, dbFunc, FuncPr, fWarning;

type

  TfmChLoadClassif = class(TfmSimpleDialog)
    Panel2: TPanel;
    DataSource: TDataSource;
    edSpr: TComboBox;
    cbOnlyChange: TCheckBox;
    procedure edSprChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
    slCode:TStringList;
    function getCode:String;
    procedure LoadOpis;
  end;

  function ChoiceLoadClassif(var sl:TStringList; var lOnlyChange:Boolean) : Boolean;

implementation

uses fMain, dBase, MetaTask, OpisEdit, uGisun;

{$R *.dfm}

function ChoiceLoadClassif(var sl:TStringList; var lOnlyChange:Boolean) : Boolean;
var
  f: TfmChLoadClassif;
begin
  Result:=false;
  sl.Clear;
  f:=TfmChLoadClassif.Create(nil);
  f.LoadOpis;
  if f.edSpr.Items.Count=0 then begin
    ShowMessage('Ќет доступных дл€ обновлени€ классификаторов');
  end else begin
    try
      if f.ShowModal=mrOk then begin
        Result:=true;
        lOnlyChange:=f.cbOnlyChange.Checked;
        sl.Add(f.getCode);
      end;
    finally
      f.Free;
    end;
  end;
end;

function TfmChLoadClassif.getCode:String;
begin
  if edSpr.ItemIndex>-1 then begin
    Result:=slCode[edSpr.ItemIndex];
  end else begin
    Result:='0';
  end;
end;

procedure TfmChLoadClassif.LoadOpis;
var
  d:TDatetime;
begin
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_CLASSIF_'+fmMain.IDProg, edSpr.Items, slCode);
  if edSpr.Items.Count>0 then begin
    edSpr.ItemIndex:=0;
    d:=gisun.GetLastDateChangeClassif(StrToInt(getCode));
    cbOnlyChange.Caption:='только изменени€ c  ' + DatePropis(d,0);
//    showmessage(datetostr(d));
  end;
end;

procedure TfmChLoadClassif.edSprChange(Sender: TObject);
var
  d:TDatetime;
begin
  if edSpr.ItemIndex>-1 then begin
    d:=gisun.GetLastDateChangeClassif(StrToInt(getCode));
    cbOnlyChange.Caption:='только изменени€ c  ' + DatePropis(d,0);
  end else begin
  end;
end;

procedure TfmChLoadClassif.FormCreate(Sender: TObject);
begin
  inherited;
  slCode:=TStringList.Create;
end;

procedure TfmChLoadClassif.FormDestroy(Sender: TObject);
begin
  slCode.Free;
  inherited;
end;

end.

