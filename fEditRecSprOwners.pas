unit fEditRecSprOwners;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, db, DBLookupEh, DBCtrlsEh, Mask, ComCtrls, ExtCtrls
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

type
  TfmEditRecSprOwners = class(TForm)
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
    edFIO: TDBEditEh;
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
    procedure FormCreate(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EditModal( ds : TDataSet; lAdd : Boolean );
  end;


implementation

uses dBase, fMain;

{$R *.DFM}

procedure TfmEditRecSprOwners.EditModal(ds: TDataSet; lAdd : Boolean);
var
  lErr : Boolean;
begin
  lErr := false;
  edFIO.Text     := '';
  edName.Text    := '';
  edPol.Value    := 'М';
  edAdres1.Text  := '';
  edAdres2.Text  := '';
  edGrag.Value   := '112';
  edPasport.Text := '';
  edLichNomer.Text := '';
  edTelefon1.Text:= '';
  edTelefon2.Text:= '';
  edWork.Text    := '';
  edAdd1.Text    := '';
  edAdd2.Text    := '';
  if lAdd then begin
    Caption := 'Новая запись';
    rb1.Checked := true;
  end else begin
    rb1.Enabled:=false;
    rb2.Enabled:=false;
    Caption := 'Корректировка записи';
    if ds.FieldByName('TYPEOWNER').AsInteger=1 then begin
      rb1.Checked := true;
      edFIO.Text := ds.FieldByName('NAME').AsString;
      edAdres1.Text := ds.FieldByName('ADRES').AsString;
      edTelefon1.Text := ds.FieldByName('TELEFON').AsString;
      edPol.Value := ds.FieldByName('POL').AsString;
      if not ds.FieldByName('DATER').IsNull
        then edDateR.Value := ds.FieldByName('DATER').AsDateTime;
      edGrag.Value := ds.FieldByName('CITIZEN').AsString;
      edWork.Text := ds.FieldByName('RABOTA').AsString;
      edPasport.Text := ds.FieldByName('PASSPORT').AsString;
      edLichNomer.Text := ds.FieldByName('LICH_NOMER').AsString;
      edAdd1.Text := ds.FieldByName('ADD_SVED').AsString;
      ActiveControl := edFIO;
    end else begin
      rb2.Checked := true;
      edNAME.Text := ds.FieldByName('NAME').AsString;
      edAdres2.Text := ds.FieldByName('ADRES').AsString;
      edTelefon2.Text := ds.FieldByName('TELEFON').AsString;
      edAdd2.Text := ds.FieldByName('ADD_SVED').AsString;
      ActiveControl := edNAME;
    end;
  end;
  if ShowModal=mrOk then begin
    ds.CheckBrowseMode;
    if lAdd then begin
      ds.Append;
      ds.FieldByName('DATE_FIKS').AsDateTime := fmMain.DateFiks;
      ds.FieldByName('ID').AsInteger := dmBase.GetNewID(dmBase.TypeObj_Owners);
      if ds.FieldByName('ID').AsInteger<1 then begin
        lErr := true;
      end;
    end else begin
      ds.Edit;
    end;
    if not lErr then begin
      if rb1.Checked then begin
        ds.FieldByName('TYPEOWNER').AsInteger := 1;
        ds.FieldByName('NAME').AsString    := edFIO.Text;
        ds.FieldByName('ADRES').AsString   := edAdres1.Text;
        ds.FieldByName('TELEFON').AsString := edTelefon1.Text;
        ds.FieldByName('POL').AsString := edPol.Value;
        if not (edDateR.Value=null)
          then ds.FieldByName('DATER').AsDateTime := edDateR.Value
          else ds.FieldByName('DATER').AsString   := '';
        ds.FieldByName('CITIZEN').AsString := VarToStr(edGrag.Value);
        ds.FieldByName('RABOTA').AsString    := edWork.Text;
        ds.FieldByName('PASSPORT').AsString:= edPasport.Text;
        ds.FieldByName('LICH_NOMER').AsString:= edLichNomer.Text;
        ds.FieldByName('ADD_SVED').AsString:= edAdd1.Text;
      end else begin
        ds.FieldByName('TYPEOWNER').AsInteger := 2;
        ds.FieldByName('NAME').AsString    := edName.Text;
        ds.FieldByName('ADRES').AsString   := edAdres2.Text;
        ds.FieldByName('TELEFON').AsString := edTelefon2.Text;
        ds.FieldByName('POL').AsString     := 'М';
        ds.FieldByName('DATER').AsString   := '';
        ds.FieldByName('CITIZEN').AsString := '';
        ds.FieldByName('RABOTA').AsString  := '';
        ds.FieldByName('PASSPORT').AsString:= '';
        ds.FieldByName('LICH_NOMER').AsString:= '';
        ds.FieldByName('ADD_SVED').AsString:= edAdd2.Text;
      end;
      ds.Post;
    end else begin
      ds.Cancel;
    end;
  end;
end;

procedure TfmEditRecSprOwners.FormCreate(Sender: TObject);
begin
  pc.Pages[0].TabVisible:=false;
  pc.Pages[1].TabVisible:=false;
end;

procedure TfmEditRecSprOwners.rb1Click(Sender: TObject);
begin
  pc.ActivePageIndex:=0;
end;

procedure TfmEditRecSprOwners.rb2Click(Sender: TObject);
begin
  pc.ActivePageIndex:=1;
end;

end.
