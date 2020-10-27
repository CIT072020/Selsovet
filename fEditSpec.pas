unit fEditSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, db, uProject, uSMDO,
  Dialogs, fSimpleDialog, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, Mask, MetaTask, OpisEdit;

type
  TfmEditSpec = class(TfmSimpleDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edTIP: TDBComboBoxEh;
    edFIO: TDBEditEh;
    edOFFICIAL: TDBEditEh;
    edORG: TDBEditEh;
    edTelefon: TDBEditEh;
    edTelMob: TDBEditEh;
    edAttestation: TDBComboBoxEh;
    DataSource1: TDataSource;
    lbAttestation: TLabel;
    procedure edFIOEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edTIPChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FtbMens:TDataSet;
    function EditSpec(dsMens:TDataSet; nCurTS:Integer; lReadOnly:Boolean):Boolean;
    procedure UpdateActions; override;
  end;

var
  fmEditSpec: TfmEditSpec;

implementation

uses fSMDODoc;

{$R *.dfm}

{ TfmEditSpec }

function TfmEditSpec.EditSpec(dsMens: TDataSet; nCurTS:Integer; lReadOnly:Boolean): Boolean;
var
  ListOpis : TListOpisEdit;
  sl:TStringList;
  i,n:Integer;
begin
  FRun:=true;
  FtbMens:=dsMens;
  DataSource1.DataSet:=dsMens;
  ListOpis:=GlobalTask.CurrentOpisEdit;
  if ListOpis<>nil then
    ListOpis.SetKeyForm(Self,nil);
  Result:=false;
{[KEY_SMDO_MEN]
1=подписавший
2=утвердивший(согласовавший)
3=составитель
4=исполнитель
5=соисполнитель }
  sl:=TStringList.Create;
  if nCurTS=TS_DOCUMENT then begin
    sl.Add('4');
    sl.Add('5');
  end else if nCurTS=TS_TASK then begin
    sl.Add('2');
    sl.Add('3');
    edAttestation.Visible:=false;
    lbAttestation.Visible:=false;
    edAttestation.HelpContext:=0;
    edTelMob.HelpContext:=999;
  end;
  for i:=0 to sl.Count-1 do begin
    n:=edTip.KeyItems.IndexOf(sl.Strings[i]);
    edTip.KeyItems.Delete(n);
    edTip.Items.Delete(n);
  end;
  FRun:=false;
  edTip.Value:=dsMens.FieldByName('TIP').Value;
  edTIPChange(edTip);
  sl.Free;
  if lReadOnly then begin
    edTIP.ReadOnly:=true;
    edOFFICIAL.ReadOnly:=true;
    edORG.ReadOnly:=true;
    edFIO.ReadOnly:=true;
    edTelefon.ReadOnly:=true;
    edTelMob.ReadOnly:=true;
    edAttestation.ReadOnly:=true;
  end;
  if EditModal then begin
    Result:=true;
  end;
  if lReadOnly then Result:=false;

end;

procedure TfmEditSpec.edFIOEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  sFIO,sDolg,sTel,sTelM:String;
begin
  if not edFIO.ReadOnly then begin
    if ChoiceSpec3(sFIO,sDolg,sTel,sTelM,edFIO) then begin
      Handled:=true;
      edFIO.Text:=sFIO;
      edOFFICIAL.Text:=sDolg;
      edTelefon.Text:=sTel;
      edTelMob.Text:=sTelM;
      edORG.Text:=SMDO.GetRekvMyOrg('NAME');
    end;
  end;
end;
//----------------------------------------------------------------
procedure TfmEditSpec.UpdateActions;
var
  n:Integer;
  l:Boolean;
begin
  inherited;
  if not FRun and not edFIO.ReadOnly then begin
    l:=false;
    if edTip.ItemIndex>-1 then begin
      l:=(Trim(edFIO.Text)<>'');
      n:=StrToInt(edTip.KeyItems[edTip.ItemIndex]);
      if (n=MEN_VALIDATOR) and (edAttestation.ItemIndex=-1)
        then l:=false;
    end else begin
      l:=false;
    end;
    if l<>btOk.Enabled
      then btOk.Enabled:=l;
  end;
end;
//----------------------------------------------------------------
procedure TfmEditSpec.edTIPChange(Sender: TObject);
var
  n:Integer;
begin
  if not FRun then begin
    if edTip.ItemIndex>-1 then begin
      n:=StrToInt(edTip.KeyItems[edTip.ItemIndex]);
      if (n=MEN_VALIDATOR)  then begin
        edAttestation.Enabled:=true;
        lbAttestation.Enabled:=true;
      end else begin
        edAttestation.ItemIndex:=-1;
        edAttestation.Enabled:=false;
        lbAttestation.Enabled:=false;
      end;
    end else begin
      edAttestation.Enabled:=false;
      lbAttestation.Enabled:=false;
    end;
  end;
  if edAttestation.Enabled then begin
    edAttestation.HelpContext:=999;
    edTelMob.HelpContext:=0;
  end else begin
    edAttestation.HelpContext:=0;
    edTelMob.HelpContext:=999;
  end;
end;

end.
