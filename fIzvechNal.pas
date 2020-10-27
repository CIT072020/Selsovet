unit fIzvechNal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrlsEh, StdCtrls, Mask, Db, kbmMemTable, FR_DSet, FR_DBSet,
  TB2Dock, TB2Toolbar, ExtCtrls, TB2Item, AddEvents, TB2ToolWindow, FuncPr,
  DbFunc, MetaTask, mPermit;

type
  TfmIzvechNal = class(TForm)
    tbDok: TkbmMemTable;
    tbDokNEDVIG_ALL: TFloatField;
    tbDokNEDVIG_1: TFloatField;
    tbDokNEDVIG_2: TFloatField;
    tbDokNEDVIG_3: TFloatField;
    tbDokZEMLJA_1: TFloatField;
    tbDokZEMLJA_2: TFloatField;
    tbDokZEMLJA_3: TFloatField;
    tbDokNEDOIM_ALL: TFloatField;
    tbDokNEDOIM_1: TFloatField;
    tbDokNEDOIM_2: TFloatField;
    tbDokNEDOIM_3: TFloatField;
    tbDokPENJA_ALL: TFloatField;
    tbDokPENJA_1: TFloatField;
    tbDokPENJA_2: TFloatField;
    tbDokPENJA_3: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    lbNedoim: TLabel;
    Label3: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBNumberEditEh1: TDBNumberEditEh;
    DBNumberEditEh2: TDBNumberEditEh;
    DBNumberEditEh3: TDBNumberEditEh;
    DBNumberEditEh4: TDBNumberEditEh;
    DBNumberEditEh5: TDBNumberEditEh;
    DBNumberEditEh6: TDBNumberEditEh;
    DBNumberEditEh7: TDBNumberEditEh;
    DBNumberEditEh8: TDBNumberEditEh;
    DBNumberEditEh9: TDBNumberEditEh;
    DBNumberEditEh10: TDBNumberEditEh;
    DBNumberEditEh11: TDBNumberEditEh;
    DBNumberEditEh12: TDBNumberEditEh;
    DBNumberEditEh13: TDBNumberEditEh;
    DBNumberEditEh14: TDBNumberEditEh;
    DBNumberEditEh15: TDBNumberEditEh;
    DBNumberEditEh16: TDBNumberEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    frDBDataSet: TfrDBDataSet;
    DataSource: TDataSource;
    tbDokDOK_DATE: TDateField;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    tbDokGOD: TStringField;
    TBItem5: TTBItem;
    tbDokADRES_PUNKT: TStringField;
    tbDokADRES_UL: TStringField;
    tbDokFIO: TStringField;
    edPunkt: TDBEditEh;
    edUL: TDBEditEh;
    edDom: TDBEditEh;
    Label9: TLabel;
    Label10: TLabel;
    tbDokADRES_DOM: TStringField;
    edFIO: TDBEditEh;
    TBToolWindow1: TTBToolWindow;
    TBControlItem1: TTBControlItem;
    edGod: TDBEditEh;
    Label8: TLabel;
    tbDokPENJA_DATE: TDateField;
    TBItem6: TTBItem;
    tbDokNOMER: TStringField;
    Label11: TLabel;
    edNomer: TDBEditEh;
    tbDokZEMLJA_ALL: TFloatField;
    Label12: TLabel;
    edKv: TDBEditEh;
    tbDokADRES_KV: TStringField;
    tbDokUNP: TStringField;
    Label13: TLabel;
    edUNP: TDBEditEh;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edGodChange(Sender: TObject);
    procedure TBItem3Click(Sender: TObject);
    procedure TBItem4Click(Sender: TObject);
    procedure TBItem6Click(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem5Click(Sender: TObject);
  private
    { Private declarations }
    FClearKey : Boolean;
    procedure BeforeReport;
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
  end;

var
  fmIzvechNal: TfmIzvechNal;

implementation

uses fMain;

var
  lSetDecimal : Boolean;


{$R *.DFM}

constructor TfmIzvechNal.Create(Owner: TComponent);
begin
  inherited;
  FClearKey:=false;
//  TBItemSetUp.Visible:=Role.Enabled(toConfig);
  TBItem6.Visible:=Role.Enabled(toDesignReport);
end;

procedure TfmIzvechNal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 lSetDecimal:=false;
 if Key = VK_DECIMAL then begin
   lSetDecimal:=true;
 end;
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
end;

procedure TfmIzvechNal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
  if lSetdecimal then begin
    Key := DecimalSeparator;
    lSetDecimal:=false;
  end;
end;

procedure TfmIzvechNal.edGodChange(Sender: TObject);
begin
  if Length(edGod.Text)=4 then begin
    try
      lbNedoim.Caption := 'Недоимка за '+IntToStr(StrToInt(edGod.Text)-1)+' год';
    except
    end;
  end;
end;

procedure TfmIzvechNal.BeforeReport;
begin
  PostDataSet(tbDok);
  GlobalTask.SetWorkParam('NEDOIMKA_CAPTION', lbNedoim.Caption);
end;
procedure TfmIzvechNal.TBItem3Click(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.PreViewReport('&Извещение на налоги.frf');
end;

procedure TfmIzvechNal.TBItem4Click(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.PrintReport('&Извещение на налоги.frf');
end;

procedure TfmIzvechNal.TBItem6Click(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.DesignTailReport('&Извещение на налоги.frf');
end;

procedure TfmIzvechNal.TBItem1Click(Sender: TObject);
begin
  PostDataSet(tbDok);
  ModalResult := mrOk;
end;

procedure TfmIzvechNal.TBItem2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmIzvechNal.TBItem5Click(Sender: TObject);
var
  n : Extended;
begin
  EditDataSet(tbDok);
  if not tbDokNEDVIG_ALL.IsNull and (tbDokNEDVIG_ALL.AsString<>'') then begin
    n := xRound(tbDokNEDVIG_ALL.AsFloat/3,-1);
    tbDokNEDVIG_1.AsFloat := n;
    tbDokNEDVIG_2.AsFloat := n;
    tbDokNEDVIG_3.AsFloat := tbDokNEDVIG_ALL.AsFloat - n - n;
  end;
  if not tbDokZEMLJA_ALL.IsNull and (tbDokZEMLJA_ALL.AsString<>'') then begin
    n := xRound(tbDokZEMLJA_ALL.AsFloat/3,-1);
    tbDokZEMLJA_1.AsFloat := n;
    tbDokZEMLJA_2.AsFloat := n;
    tbDokZEMLJA_3.AsFloat := tbDokZEMLJA_ALL.AsFloat - n - n;
  end;
  if not tbDokNEDOIM_ALL.IsNull and (tbDokNEDOIM_ALL.AsString<>'') then begin
    n := xRound(tbDokNEDOIM_ALL.AsFloat/3,-1);
    tbDokNEDOIM_1.AsFloat := n;
    tbDokNEDOIM_2.AsFloat := n;
    tbDokNEDOIM_3.AsFloat := tbDokNEDOIM_ALL.AsFloat - n - n;
  end;
  if not tbDokPENJA_ALL.IsNull and (tbDokPENJA_ALL.AsString<>'') then begin
    n := xRound(tbDokPENJA_ALL.AsFloat/3,-1);
    tbDokPENJA_1.AsFloat := n;
    tbDokPENJA_2.AsFloat := n;
    tbDokPENJA_3.AsFloat := tbDokPENJA_ALL.AsFloat - n - n;
  end;
end;

end.
