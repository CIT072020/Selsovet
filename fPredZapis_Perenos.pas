unit fPredZapis_Perenos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  funcPr, dbFunc, Dialogs, StdCtrls, DB, Grids, DBGridEh, fPredZapis, Buttons;

type
  TfmPredZapis_Perenos = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    lbNew: TLabel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    cbMonth: TComboBox;
    cbMesto: TComboBox;
    cbDay: TComboBox;
    cbGod: TComboBox;
    procedure cbMestoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fm:TfmPredZapis;
    procedure Prepare;
    procedure UpdateActions; override;
  end;

  function ChoicePerenos(strNew:String; fmOwner:TfmPredZapis):Integer;

implementation

{$R *.dfm}

function ChoicePerenos(strNew:String; fmOwner:TfmPredZapis):Integer;
var
  f: TfmPredZapis_Perenos;
  sBookmark:String; //t:TSosttable;
begin
  sBookmark:=fmOwner.tbPredZapis.Bookmark;
  fmOwner.tbPredZapis.IndexFieldNames:=KEY_VIEW;
  //st:=SaveSostTable(fmOwner.tbPredZapis,false,false);
  try
    f:=TfmPredZapis_Perenos.Create(fmOwner);
    f.fm:=fmOwner;
    f.lbNew.Caption:=strNew;
    f.Prepare;
    Result:=0;
    if f.ShowModal=mrOk then begin
      Result:=fmOwner.tbPredZapis.FieldByName('ID').AsInteger;
    end;
  finally
    fmOwner.tbPredZapis.cancelRange;
    fmOwner.tbPredZapis.Bookmark:=sBookmark;
//    RestSostTable(fmOwner.tbPredZapis,st);
  end;
end;

procedure TfmPredZapis_Perenos.Prepare;
var
  i:Integer;
begin
  cbMonth.Items.Assign(fm.cbMonth.Items);
  cbMonth.ItemIndex:=fm.cbMonth.ItemIndex;

  cbGod.Items.Assign(fm.cbGod.Items);
  cbGod.ItemIndex:=fm.cbGod.ItemIndex;

  cbMesto.Items.Assign(fm.cbMesto.Items);
  cbMesto.ItemIndex:=fm.cbMesto.ItemIndex;

  for i:=1 to 31 do begin
    cbDay.Items.Add(IntToStr(i));
  end;
  cbDay.ItemIndex:=0;

  cbMestoChange(nil);
end;

procedure TfmPredZapis_Perenos.cbMestoChange(Sender: TObject);
var
  nMesto,nGod,nMonth,nDay:Integer;
begin
  //  tbPredZapis.SetRange([FTypeObj,FMesto,FCurYear,FCurMonth,1],[FTypeObj,FMesto,FCurYear,FCurMonth,31]);
  nMesto:=StrToInt(fm.FListMestID.Strings[cbMesto.ItemIndex]);
  nGod:=StrToInt(cbGod.Items[cbGod.ItemIndex]);
  nMonth:=cbMonth.Itemindex+1;
  nDay:=cbDay.ItemIndex+1;
  fm.tbPredZapis.SetRange([false,fm.FTypeObj,nMesto,nGod,nMonth,nDay],[false,fm.FTypeObj,nMesto,nGod,nMonth,nDay]);
  ActiveControl:=DBGridEh1;
end;

procedure TfmPredZapis_Perenos.UpdateActions;
begin
  inherited;
  btOk.Enabled:=fm.tbPredZapis.FieldByName('ID').AsInteger>0;
end;

end.
