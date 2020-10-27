unit fEditRecHistOwners;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, db, DBLookupEh, DBCtrlsEh, Mask, ComCtrls, ExtCtrls, dAdres
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmEditRecHistOwners = class(TForm)
    Panel1: TPanel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    pc: TPageControl;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edFamilia: TDBEditEh;
    edAdres1: TDBEditEh;
    edDateRogd: TDBDateTimeEditEh;
    edTelefon1: TDBEditEh;
    edAdd1: TDBEditEh;
    edPasport: TDBEditEh;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edAdd2: TDBEditEh;
    edAdres2: TDBEditEh;
    Label13: TLabel;
    edName: TDBEditEh;
    edTelefon2: TDBEditEh;
    Label14: TLabel;
    edLichNomer: TDBEditEh;
    Label3: TLabel;
    edDateSmer: TDBDateTimeEditEh;
    Label6: TLabel;
    edDateS: TDBDateTimeEditEh;
    Label8: TLabel;
    edDateP: TDBDateTimeEditEh;
    Label15: TLabel;
    edTail: TDBEditEh;
    Label16: TLabel;
    edUNP2: TDBEditEh;
    edName_Men: TDBEditEh;
    edOtch_Men: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dmAdr : TdmAdres;
    FAdd  : Boolean;
    FIDSobstv : Integer;
    procedure EditModal;
  end;

  procedure EditSobstvHist( dm : TdmAdres; lAdd : Boolean);

implementation

uses dBase, fMain, dDokument;

{$R *.DFM}

procedure EditSobstvHist( dm : TdmAdres; lAdd : Boolean);
var
  fmEditRecHistOwners: TfmEditRecHistOwners;
begin
  fmEditRecHistOwners := TfmEditRecHistOwners.Create(nil);
  try
//    fmEditRecHistOwners.FIDSobstv:=dm.mtDokumentID.AsInteger;
    fmEditRecHistOwners.dmAdr := dm;
    fmEditRecHistOwners.FAdd  := lAdd;
    fmEditRecHistOwners.EditModal;
  finally
    fmEditRecHistOwners.Free;
  end;
end;

procedure TfmEditRecHistOwners.EditModal;
var
  lErr : Boolean;
  ds : TDataSet;
begin
  ds:=dmAdr.tbHouseOwnersHist;
  lErr := false;
  edFamilia.Text := '';
  edName_Men.Text:= '';
  edOtch_Men.Text:= '';
  edName.Text    := '';
  edAdres1.Text  := '';
  edAdres2.Text  := '';
  edUNP2.Text:='';
  edDateRogd.Value:=null;
  edDateSmer.Value:=null;
  edDateS.Value:=null;
  edDateP.Value:=null;
  edTail.Text:='';
  edPasport.Text := '';
  edLichNomer.Text := '';
  edTelefon1.Text:= '';
  edTelefon2.Text:= '';
  edAdd1.Text    := '';
  edAdd2.Text    := '';
  if FAdd then begin
    Caption := 'Новый собственник (история)';
    rb1.Checked := true;
  end else begin
    rb1.Enabled:=false;
    rb2.Enabled:=false;
    Caption := 'Корректировка собственника (история)';
    if ds.FieldByName('TYPEKOD').AsInteger=1 then begin
      rb1.Checked := true;
      edFamilia.Text := ds.FieldByName('NAME').AsString;
      edName_Men.Text := ds.FieldByName('NAME_MEN').AsString;
      edOtch_Men.Text := ds.FieldByName('OTCH_MEN').AsString;
      edAdres1.Text := ds.FieldByName('ADRES').AsString;
      edTelefon1.Text := ds.FieldByName('TELEFON').AsString;
      if not ds.FieldByName('DATE_ROGD').IsNull
        then edDateRogd.Value := ds.FieldByName('DATE_ROGD').AsDateTime;
      if not ds.FieldByName('DATE_SMER').IsNull
        then edDateSmer.Value := ds.FieldByName('DATE_SMER').AsDateTime;
      edPasport.Text := ds.FieldByName('PASSPORT').AsString;
      edLichNomer.Text := ds.FieldByName('LICH_NOMER').AsString;
      edAdd1.Text := ds.FieldByName('PRIM').AsString;
      ActiveControl := edFamilia;
    end else begin
      rb2.Checked := true;
      edNAME.Text := ds.FieldByName('NAME').AsString;
      edAdres2.Text := ds.FieldByName('ADRES').AsString;
      edTelefon2.Text := ds.FieldByName('TELEFON').AsString;
      edUNP2.Text := ds.FieldByName('UNP').AsString;
      edAdd2.Text := ds.FieldByName('PRIM').AsString;
      ActiveControl := edNAME;
    end;
    if not ds.FieldByName('DATES').IsNull then edDateS.Value := ds.FieldByName('DATES').AsDateTime;
    if not ds.FieldByName('DATEP').IsNull then edDateP.Value := ds.FieldByName('DATEP').AsDateTime;
    edTail.Text := ds.FieldByName('TAIL').AsString;
  end;
  if ShowModal=mrOk then begin
    ds.CheckBrowseMode;
    if FAdd then begin
      ds.Append;
      ds.FieldByName('KOD').AsInteger:=0;   // значит введен вручную
    end else begin
      ds.Edit;
    end;
    if not lErr then begin
      if rb1.Checked then begin
        ds.FieldByName('TYPEKOD').AsInteger := 1;
        ds.FieldByName('NAME').AsString    := edFamilia.Text;
        ds.FieldByName('NAME_MEN').AsString:= edName_Men.Text;
        ds.FieldByName('OTCH_MEN').AsString:= edOtch_Men.Text;
        ds.FieldByName('ADRES').AsString   := edAdres1.Text;
        ds.FieldByName('TELEFON').AsString := edTelefon1.Text;
        if not (edDateRogd.Value=null)
          then ds.FieldByName('DATE_ROGD').AsDateTime := edDateRogd.Value
          else ds.FieldByName('DATE_ROGD').AsString   := '';
        if not (edDateSmer.Value=null)
          then ds.FieldByName('DATE_SMER').AsDateTime := edDateSmer.Value
          else ds.FieldByName('DATE_SMER').AsString   := '';
        ds.FieldByName('PASSPORT').AsString:= edPasport.Text;
        ds.FieldByName('LICH_NOMER').AsString:= edLichNomer.Text;
        ds.FieldByName('PRIM').AsString:= edAdd1.Text;
      end else begin
        ds.FieldByName('TYPEKOD').AsInteger := 2;
        ds.FieldByName('NAME').AsString:=edName.Text;
        ds.FieldByName('ADRES').AsString:=edAdres2.Text;
        ds.FieldByName('TELEFON').AsString:=edTelefon2.Text;
        ds.FieldByName('UNP').AsString:=edUNP2.Text;
        ds.FieldByName('DATE_ROGD').AsString:='';
        ds.FieldByName('DATE_SMER').AsString:='';
        ds.FieldByName('PASSPORT').AsString:='';
        ds.FieldByName('LICH_NOMER').AsString:='';
        ds.FieldByName('PRIM').AsString:=edAdd2.Text;
      end;
      if not (edDateS.Value=null)
        then ds.FieldByName('DATES').AsDateTime := edDateS.Value
        else ds.FieldByName('DATES').AsString   := '';
      if not (edDateP.Value=null)
        then ds.FieldByName('DATEP').AsDateTime := edDateP.Value
        else ds.FieldByName('DATEP').AsString   := '';
      ds.FieldByName('TAIL').AsString:= edTAIL.Text;
      ds.Post;
    end else begin
      ds.Cancel;
    end;
  end;
end;

procedure TfmEditRecHistOwners.FormCreate(Sender: TObject);
begin
  pc.Pages[0].TabVisible:=false;
  pc.Pages[1].TabVisible:=false;
end;

procedure TfmEditRecHistOwners.rb1Click(Sender: TObject);
begin
  pc.ActivePageIndex:=0;
end;

procedure TfmEditRecHistOwners.rb2Click(Sender: TObject);
begin
  pc.ActivePageIndex:=1;
end;

end.
