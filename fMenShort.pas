unit fMenShort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, FuncPr,
  Dialogs, StdCtrls, Buttons, DBCtrlsEh, Mask, DBLookupEh, Db, MetaTask, uProject,
  ExtCtrls,AddEvents, kbmMemTable, dMen, dbFunc, uCheckKod;

{$I Task.inc}

type
  TfmMenShort = class(TForm)
    Label1: TLabel;
    lbPol: TLabel;
    edPol: TDBComboBoxEh;
    edFam: TDBEditEh;
    Label2: TLabel;
    edName: TDBEditEh;
    Label7: TLabel;
    edDateR: TDBDateTimeEditEh;
    Label3: TLabel;
    edOtch: TDBEditEh;
    lbOtnosh: TLabel;
    edOTNOSH: TDBLookupComboboxEh;
    Panel1: TPanel;
    btOK: TBitBtn;
    btCancel: TBitBtn;
    DataSource: TDataSource;
    mtDokument: TkbmMemTable;
    mtDokumentFAMILIA: TStringField;
    mtDokumentNAME: TStringField;
    mtDokumentOTCH: TStringField;
    mtDokumentPOL: TStringField;
    mtDokumentDATER: TDateField;
    mtDokumentOTNOSH: TIntegerField;
    mtDokumentWORK_NAME: TStringField;
    mtDokumentWORK_SPR: TIntegerField;
    mtDokumentDOLG_NAME: TStringField;
    mtDokumentDOLG_SPR: TIntegerField;
    mtDokumentDATEP: TDateField;
    mtDokumentDATEV: TDateField;
    edLichNomer: TDBEditEh;
    Label4: TLabel;
    mtDokumentLICH_NOMER: TStringField;
    mtDokumentPASP_UDOST: TSmallintField;
    mtDokumentPASP_SERIA: TStringField;
    mtDokumentPASP_NOMER: TStringField;
    mtDokumentPASP_DATE: TDateField;
    mtDokumentPASP_VIDAN: TStringField;
    edUdost: TDBComboBoxEh;
    Label16: TLabel;
    edPasp_Organ: TDBEditEh;
    Label13: TLabel;
    edPasp_Seria: TDBEditEh;
    Label14: TLabel;
    edPasp_Nomer: TDBEditEh;
    Label15: TLabel;
    edPasp_Date: TDBDateTimeEditEh;
    Label5: TLabel;
    mtDokumentTEXT_ADRES: TStringField;
    edAdres: TDBEditEh;
    lbAdres: TLabel;
    cbIskl: TDBCheckBoxEh;
    mtDokumentISKL: TBooleanField;
    Label6: TLabel;
    edDateP: TDBDateTimeEditEh;
    mtDokumentPRICH: TSmallintField;
    lbPrich: TLabel;
    edPrich: TDBComboBoxEh;
    procedure edOTNOSHEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edWork_NameEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure edDolg_NameEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;    Shift: TShiftState);
    procedure edFamUpdateData(Sender: TObject; var Handled: Boolean);
    procedure btOKClick(Sender: TObject);
    procedure edLichNomerUpdateData(Sender: TObject; var Handled: Boolean);
    procedure edPasp_OrganEditButtons0Click(Sender: TObject;   var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    FNew:Boolean;
    FClearKey:Boolean;
    dMen:TdmMen;
    procedure SetLookUp;
    procedure UpdateActions; override;
  end;

  function EditShortMen(dmMen:TdmMen;lNew:Boolean) : Boolean;
  function EditMenDeclare(ds:TDataSet;lNew:Boolean;sNotVisible:String='') : Boolean;

implementation

uses dBase, fShablon;


{$R *.dfm}

//--------------------------------------------------------------------
function EditShortMen(dmMen:TdmMen; lNew:Boolean) : Boolean;
var
  fmMenShort: TfmMenShort;
  nMenID,n:Integer;
  sBookMark:String;
  l:Boolean;
begin
  Result:=false;
  fmMenShort:=TfmMenShort.Create(nil);
  fmMenShort.mtDokument.Append;
  fmMenShort.mtDokument.Post;
  fmMenShort.mtDokument.Edit;
  {$IFNDEF OCHERED}
    fmMenShort.lbAdres.Visible:=false;
    fmMenShort.edAdres.Visible:=false;
    fmMenShort.cbIskl.Visible:=false;
  {$ENDIF}
  l:=dbDisableControls(dmMen.tbSostavSem);
  sBookMark:='';
  if lNew then begin
    fmMenShort.mtDokumentFAMILIA.AsString:=dmMen.mtDokumentFAMILIA.AsString;
    fmMenShort.mtDokumentPOL.AsString:='М';
    fmMenShort.mtDokumentISKL.AsBoolean:=false;
//    fmMenShort.mtDokumentPRICH.AsInteger:=1;
  end else begin
    sBookMark:=dmMen.tbSostavSem.Bookmark;
    nMenID:=dmMen.tbSostavSemMEMBER_ID.AsInteger;
    fmMenShort.mtDokumentFAMILIA.AsString:=dmMen.tbSostavSemFAMILIA.AsString;
    fmMenShort.mtDokumentNAME.AsString:=dmMen.tbSostavSemNAME.AsString;
    fmMenShort.mtDokumentOTCH.AsString:=dmMen.tbSostavSemOTCH.AsString;
    fmMenShort.mtDokumentPOL.AsString:=dmMen.tbSostavSemPOL.AsString;
    fmMenShort.mtDokumentOTNOSH.AsString:=dmMen.tbSostavSemOTNOSH.AsString;
    fmMenShort.mtDokumentLICH_NOMER.AsString:=dmMen.tbSostavSemLICH_NOMER.AsString;
    fmMenShort.mtDokumentPASP_UDOST.AsString:=dmMen.tbSostavSemPASP_UDOST.AsString;
    fmMenShort.mtDokumentPASP_SERIA.AsString:=dmMen.tbSostavSemPASP_SERIA.AsString;
    fmMenShort.mtDokumentPASP_NOMER.AsString:=dmMen.tbSostavSemPASP_NOMER.AsString;
    fmMenShort.mtDokumentPASP_VIDAN.AsString:=dmMen.tbSostavSemPASP_VIDAN.AsString;
    fmMenShort.mtDokumentISKL.AsBoolean:=dmMen.tbSostavSemISKL.AsBoolean;
    fmMenShort.mtDokumentPRICH.AsString:=dmMen.tbSostavSemPRICH.AsString;
    {$IFDEF OCHERED}
      fmMenShort.mtDokumentTEXT_ADRES.AsString:=dmMen.tbSostavSemTEXT_ADRES.AsString;
    {$ENDIF}
    if not dmMen.tbSostavSemPASP_DATE.IsNull
      then fmMenShort.mtDokumentPASP_DATE.AsDateTime:=dmMen.tbSostavSemPASP_DATE.AsDateTime;
    if not dmMen.tbSostavSemDATER.IsNull then fmMenShort.mtDokumentDATER.AsDateTime:=dmMen.tbSostavSemDATER.AsDateTime;
    if not dmMen.tbSostavSemDATEP.IsNull then fmMenShort.mtDokumentDATEP.AsDateTime:=dmMen.tbSostavSemDATEP.AsDateTime;
  end;
  fmMenShort.FNew:=lNew;
  fmMenShort.DataSource.DataSet:=fmMenShort.mtDokument;
  fmMenShort.dMen:=dmMen;
  if fmMenShort.ShowModal=mrOk then begin
    n:=dmMen.tbSostavSem.RecordCount+1;
    if lNew then begin
      nMenID:=dmBase.GetNewID(dmBase.TypeObj_Nasel);
      dmMen.tbSostavSem.Append;
    end else begin
      dmMen.tbSostavSem.Bookmark:=sBookMark;
      dmMen.tbSostavSem.Edit;
    end;
    if nMenID>0 then begin
      dmMen.tbSostavSemMEMBER_ID.AsInteger:=nMenID;
//      if dmBase.tbMens.Locate('DATE_FIKS;ID', VarArrayOf([dmBase.GetDateCurrentSost,nMenID]), []) then begin

      if lNew then begin
        dmMen.tbSostavSemID_INTERNAL.AsInteger:=dmMen.mtDokumentID_INTERNAL.AsInteger;
        dmMen.tbSostavSemNOMER.AsInteger:=n;
      end;

      dmMen.tbSostavSemFAMILIA.AsString := fmMenShort.mtDokumentFAMILIA.AsString;
      dmMen.tbSostavSemNAME.AsString := fmMenShort.mtDokumentNAME.AsString;
      dmMen.tbSostavSemOTCH.AsString := fmMenShort.mtDokumentOTCH.AsString;
      dmMen.tbSostavSemPOL.AsString := fmMenShort.mtDokumentPOL.AsString;
      dmMen.tbSostavSemOTNOSH.AsString:=fmMenShort.mtDokumentOTNOSH.AsString;
      dmMen.tbSostavSemLICH_NOMER.AsString:=fmMenShort.mtDokumentLICH_NOMER.AsString;
      dmMen.tbSostavSemPASP_UDOST.AsString:=fmMenShort.mtDokumentPASP_UDOST.AsString;
      dmMen.tbSostavSemPASP_SERIA.AsString:=fmMenShort.mtDokumentPASP_SERIA.AsString;
      dmMen.tbSostavSemPASP_NOMER.AsString:=fmMenShort.mtDokumentPASP_NOMER.AsString;
      dmMen.tbSostavSemPASP_VIDAN.AsString:=fmMenShort.mtDokumentPASP_VIDAN.AsString;
      dmMen.tbSostavSemISKL.AsBoolean:=fmMenShort.mtDokumentISKL.AsBoolean;
      dmMen.tbSostavSemPRICH.AsString:=fmMenShort.mtDokumentPRICH.AsString;
      {$IFDEF OCHERED}
        dmMen.tbSostavSemTEXT_ADRES.AsString:=fmMenShort.mtDokumentTEXT_ADRES.AsString;
      {$ENDIF}
      if not fmMenShort.mtDokumentPASP_DATE.IsNull
        then dmMen.tbSostavSemPASP_DATE.AsDateTime:=fmMenShort.mtDokumentPASP_DATE.AsDateTime
        else dmMen.tbSostavSemPASP_DATE.AsString:='';

      if not fmMenShort.mtDokumentDATER.IsNull
        then dmMen.tbSostavSemDATER.AsDateTime:=fmMenShort.mtDokumentDATER.AsDateTime
        else dmMen.tbSostavSemDATER.AsString:='';
      if not fmMenShort.mtDokumentDATEP.IsNull
        then dmMen.tbSostavSemDATEP.AsDateTime:=fmMenShort.mtDokumentDATEP.AsDateTime
        else dmMen.tbSostavSemDATEP.AsString:='';
      dmMen.tbSostavSem.Post;
      if lNew then begin
        EditDataSet(dmMen.mtDokument);
        dmMen.mtDokumentKOLVO_SOSTAV.AsInteger:=dmMen.tbSostavSem.RecordCount+1;
      end;
      Result:=true;
    end;
  end;
  fmMenShort.Free;
  dbEnableControls(dmMen.tbSostavSem,l);
end;

//--------------------------------------------------------------------
// состав семьи из заявления
function EditMenDeclare(ds:TDataSet; lNew:Boolean; sNotVisible:String) : Boolean;
var
  fmMenShort: TfmMenShort;
  nMenID,n:Integer;
  sBookMark:String;
  l:Boolean;
begin
  sNotVisible:=UpperCase(sNotVisible)+';';
  Result:=false;
  fmMenShort:=TfmMenShort.Create(nil);
  fmMenShort.cbIskl.Visible:=false;
  fmMenShort.edPrich.Visible:=false;
  fmMenShort.lbPrich.Visible:=false;
  if Pos('POL;',sNotVisible)>0 then begin
    fmMenShort.lbPOL.Visible:=false;
    fmMenShort.edPOL.Visible:=false;
  end;
  {$IFNDEF OCHERED}
    fmMenShort.lbAdres.Visible:=false;
    fmMenShort.edAdres.Visible:=false;
  {$ENDIF}

  fmMenShort.mtDokument.Append;
  fmMenShort.mtDokument.Post;
  fmMenShort.mtDokument.Edit;
  l:=dbDisableControls(ds);
  sBookMark:='';
  if ds.FindField('LICH_NOMER')=nil then begin
    fmMenShort.edLichNomer.Visible:=false;
    fmMenShort.Label4.Visible:=false;
//    fmMenShort.Height:=fmMenShort.Height-28;
  end;
  if lNew then begin
    if ds.FieldByName('FAMILIA').AsString<>'' then
      fmMenShort.mtDokumentFAMILIA.AsString:=ds.FieldByName('FAMILIA').AsString;
    fmMenShort.mtDokumentPOL.AsString:='М';
  end else begin
    sBookMark:=ds.Bookmark;
    fmMenShort.mtDokumentFAMILIA.AsString:=ds.FieldByName('FAMILIA').AsString;
    fmMenShort.mtDokumentNAME.AsString:=ds.FieldByName('NAME').AsString;
    fmMenShort.mtDokumentOTCH.AsString:=ds.FieldByName('OTCH').AsString;
    fmMenShort.mtDokumentPOL.AsString:=ds.FieldByName('POL').AsString;
    fmMenShort.mtDokumentOTNOSH.AsString:=ds.FieldByName('OTNOSH').AsString;
    if ds.FindField('LICH_NOMER')<>nil
      then fmMenShort.mtDokumentLICH_NOMER.AsString:=ds.FieldByName('LICH_NOMER').AsString;
    if not ds.FieldByName('DATER').IsNull
      then fmMenShort.mtDokumentDATER.AsDateTime:=ds.FieldByName('DATER').AsDateTime;
  end;
  fmMenShort.FNew:=lNew;
  fmMenShort.DataSource.DataSet:=fmMenShort.mtDokument;
  fmMenShort.dMen:=nil;
  if fmMenShort.ShowModal=mrOk then begin
    if lNew then begin
      ds.Append;
    end else begin
      ds.Bookmark:=sBookMark;
      EditDataSet(ds);
    end;
    ds.FieldByName('FAMILIA').AsString := fmMenShort.mtDokumentFAMILIA.AsString;
    ds.FieldByName('NAME').AsString := fmMenShort.mtDokumentNAME.AsString;
    ds.FieldByName('OTCH').AsString := fmMenShort.mtDokumentOTCH.AsString;
    ds.FieldByName('POL').AsString := fmMenShort.mtDokumentPOL.AsString;
    ds.FieldByName('OTNOSH').AsString:=fmMenShort.mtDokumentOTNOSH.AsString;
    if ds.FindField('LICH_NOMER')<>nil
      then ds.FieldByName('LICH_NOMER').AsString:=fmMenShort.mtDokumentLICH_NOMER.AsString;
    if not fmMenShort.mtDokumentDATER.IsNull
      then ds.FieldByName('DATER').AsDateTime:=fmMenShort.mtDokumentDATER.AsDateTime
      else ds.FieldByName('DATER').AsString:='';
    ds.Post;
    Result:=true;
  end;
  fmMenShort.Free;
  dbEnableControls(ds,l);
end;

//--------------------------------------------------------------------
procedure TfmMenShort.FormCreate(Sender: TObject);
begin
  SetLookUp;
  GlobalTask.CurrentOpisEdit.SetKeyForm(Self,nil);
  FClearKey:=false;
end;

//--------------------------------------------------------------------
procedure TfmMenShort.SetLookUp;
var
  ds : TDataSource;
begin
  // отношение к главе хозяйства
  ds := TDataSource.Create(Self);
  ds.Name := 'LookUp_Otnosh';
  ds.DataSet := dmBase.SprOtnosh;
  edOTNOSH.ListSource := ds;
  edOTNOSH.ListField  := 'NAME';
  edOTNOSH.KeyField   := 'ID';

  // учебное заведение
//  ds := TDataSource.Create(Self);
//  ds.Name := 'LookUp_UchZaved';
//  ds.DataSet := dmBase.SprUchZaved;
//  edStudent_Spr.ListSource := ds;
//  edStudent_Spr.ListField  := 'NAME';
//  edStudent_Spr.KeyField   := 'ID';

  // места работы
//  ds := TDataSource.Create(Self);
//  ds.Name := 'LookUp_Work';
//  ds.DataSet := dmBase.SprWork;
  // Должности
//  ds := TDataSource.Create(Self);
//  ds.Name := 'LookUp_Dolg';
//  ds.DataSet := dmBase.SprDolg;
end;

//--------------------------------------------------------------------
procedure TfmMenShort.edOTNOSHEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ChoiceFromLookupSpr2( 'LOOKUP_OTNOSH', mtDokument.FieldByName('OTNOSH'), false);
  Handled := true;
end;

//--------------------------------------------------------------------
procedure TfmMenShort.edWork_NameEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
  if (mtDokument.State<>dsEdit) or (mtDokument.State<>dsInsert) then mtDokument.Edit;
  mtDokument.FieldByName('WORK_SPR').AsString := '';
  mtDokument.FieldByName('WORK_NAME').AsString  := '';
end;

//--------------------------------------------------------------------
procedure TfmMenShort.edDolg_NameEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  Handled := true;
  if (mtDokument.State<>dsEdit) or (mtDokument.State<>dsInsert) then mtDokument.Edit;
  mtDokument.FieldByName('DOLG_SPR').AsString := '';
  mtDokument.FieldByName('DOLG_NAME').AsString  := '';
end;

//--------------------------------------------------------------------
procedure TfmMenShort.UpdateActions;
begin
  inherited;
  {
  if edWork_Name.Visible then begin
    if mtDokument.FieldByName('WORK_SPR').AsString='' then begin
      if edWork_Name.Font.Style <> [] then begin
        edWork_Name.Font.Style := [];
      end;
    end else begin
      if edWork_Name.Font.Style <> [fsBold] then begin
        edWork_Name.Font.Style := [fsBold];
      end;
    end;
  end;
  if edDolg_Name.Visible then begin
    if mtDokument.FieldByName('DOLG_SPR').AsString='' then begin
      if edDolg_Name.Font.Style <> [] then begin
        edDolg_Name.Font.Style := [];
      end;
    end else begin
      if edDolg_Name.Font.Style <> [fsBold] then begin
        edDolg_Name.Font.Style := [fsBold];
      end;
    end;
  end;
  }
  btOk.Enabled:=(edFam.Text<>'') and (edName.Text<>'');
end;

procedure TfmMenShort.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then Key:=#0;
  FClearKey:=false;
end;

procedure TfmMenShort.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
end;

procedure TfmMenShort.edFamUpdateData(Sender: TObject; var Handled: Boolean);
var
  ed : TDbEditEh;
begin
  ed:=TDbEditEh(Sender);
  ed.Text:=ANSIUpperCase(Copy(ed.Text,1,1)) +
           ANSILowerCase(Copy(ed.Text,2,Length(ed.Text)-1));
end;

procedure TfmMenShort.btOKClick(Sender: TObject);
//var
//  st:TSostTable
begin
  mtDokument.CheckBrowseMode;
  ModalResult:=mrOk;
  //edMen.tbSostavSem.First;
end;

procedure TfmMenShort.edLichNomerUpdateData(Sender: TObject;  var Handled: Boolean);
var
  s:String;
begin
  if GlobalTask.ParamAsBoolean('KONT_IDENTIF') and (edLichNomer.Text<>'') then begin
//  if (edLichNomer.Text<>'') then begin
    edLichNomer.text := CheckLichNom(true, edLichNomer.Text);
    s:=GetErrorCheck;
    if s<>'' then begin
      PutError(s);
    end;
  end;
end;

procedure TfmMenShort.edPasp_OrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD,Trim(edPasp_Organ.Text));
 if s<>'' then begin
   edPasp_Organ.Text:=s;
 end;
end;

end.


