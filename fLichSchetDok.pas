unit fLichSchetDok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uTypes, fShablon,
  Dialogs, fSimpleDialog, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, Mask, MetaTask,OpisEdit;

type
  TfmLicSchetDok = class(TfmSimpleDialog)
    edTypeDok: TDBComboBoxEh;
    Label1: TLabel;
    Label2: TLabel;
    edData: TDBDateTimeEditEh;
    edNomer: TDBEditEh;
    edKomm: TDBEditEh;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edTypeDokEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    CheckTypeDok:Boolean;
    procedure UpdateActions; override;
  end;

//var
//  fmLicSchetDok: TfmLicSchetDok;

implementation

uses dBase;

{$R *.dfm}

{ TfmLicSchetDok }

procedure TfmLicSchetDok.UpdateActions;
begin
  inherited;
  btOk.Enabled:=(edTypeDok.ItemIndex>-1) and (edData.Value<>null);
end;

procedure TfmLicSchetDok.FormCreate(Sender: TObject);
var
 Opis:TOpisEdit;
 i:Integer;
begin          
  CheckTypeDok:=false;
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_LIC_TYPEDOK');
  for i:=0 to Opis.Items.Count-1 do begin
    if StrToInt(Opis.KeyList[i])<>DOK_IZVECH_NALOG then begin   // извещение в налоговую не даем выбирать
      edTypeDok.Items.Add(Opis.Items[i]);
      edTypeDok.KeyItems.Add(Opis.KeyList[i]);
    end;
  end;
//    ListOpis.SetKeyForm(Self,nil);
end;

procedure TfmLicSchetDok.edTypeDokEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  Opis:TOpisEdit;
  nKod,n:Integer;
  sSeek:String;
  l:Boolean;
begin
  sSeek:='';
  nKod:=ChoiceFromShablonEx( nil, SHABLON_DOK_LIC, true, sSeek);
  if ModifyShablon then begin  // fShablon.pas
    CheckTypeDok:=true;
    GlobalTask.CurrentOpisEdit.GetListOpis('KEY_LIC_TYPEDOK', edTypeDok.Items, edTypeDok.KeyItems);
  end;
  if nKod>0 then begin
    Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_LIC_TYPEDOK');
    if Opis.AddConst
      then nKod:=nKod+ADD_KOD_SHABLON; // uTypes.pas
    n:=edTypeDok.KeyItems.IndexOf(IntToStr(nKod));
    if n>-1
      then edTypeDok.ItemIndex:=n;
  end;
end;

end.
