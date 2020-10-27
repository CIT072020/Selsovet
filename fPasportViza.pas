unit fPasportViza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc,
  OpisEdit, MetaTask, FR_DSet, FR_DBSet, Grids, DBGridEh, SasaDBGrid,
  Buttons
 {$IFDEF VER150} ,Variants {$ENDIF}  ;

{$I Task.inc}

type
  TfmPasportViza = class(TfmSimpleD)
    pc: TPageControl;
    ts1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edFamilia: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    edDateR: TDBDateTimeEditEh;
    gbGit: TGroupBox;
    edPropis: TDBEditEh;
    DokumentDATEZ: TDateField;
    DokumentMEN_ID: TIntegerField;
    DokumentLICH_ID: TIntegerField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentPOL: TStringField;
    DokumentDateR: TDateField;
    DokumentRG_GOSUD: TIntegerField;
    DokumentRG_OBL: TStringField;
    DokumentRG_RAION: TStringField;
    DokumentRG_GOROD: TStringField;
    DokumentRUKOV: TStringField;
    DokumentSOATO: TStringField;
    dsStran: TDataSource;
    dsNation: TDataSource;
    DokumentPROV: TBooleanField;
    gbPasport: TGroupBox;
    Label37: TLabel;
    edPaspNomer: TDBEditEh;
    Label38: TLabel;
    edPaspDate: TDBDateTimeEditEh;
    Label29: TLabel;
    edPaspVidan: TDBEditEh;
    Label4: TLabel;
    edPaspSeria: TDBEditEh;
    DokumentPASP_SERIA: TStringField;
    DokumentPASP_NOMER: TStringField;
    DokumentPASP_DATE: TDateField;
    DokumentPASP_VIDAN: TMemoField;
    gbRogd: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    edRG_GOSUD: TDBLookupComboboxEh;
    edRG_OBL: TDBEditEh;
    edRG_GOROD: TDBEditEh;
    edRG_RAION: TDBEditEh;
    gbRabota: TGroupBox;
    GridDok: TSasaDBGrid;
    Label41: TLabel;
    edRukov: TDBEditEh;
    Label6: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label7: TLabel;
    edLichNomer: TDBEditEh;
    DokumentLICH_NOMER: TStringField;
    tbWork: TkbmMemTable;
    dsWork: TDataSource;
    tbWorkDatePost: TDateField;
    tbWorkDateUvol: TDateField;
    tbWorkWorkName: TStringField;
    tbWorkWorkMesto: TStringField;
    DokumentPROPIS: TMemoField;
    DokumentORGAN: TStringField;
    edOrgan: TDBEditEh;
    Label8: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    DokumentTYPE_GOROD: TSmallintField;
    procedure edFamiliaEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
  private
//    H : THintWindow;
//    procedure OnDestroyHint( Sender : TObject);
//    procedure SetIDZags;
     FBool : Boolean;
  public
    { Public declarations }
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure UpdateActions; override;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
    function BeforeEdit : Boolean; override;
    function SaveToIni : Boolean; override;
    procedure LoadFromIni; override;
    function BeforeReport : Boolean; override;
    procedure AfterReport; override;
  end;

  function EditPasportViza( nID : Integer) : Boolean;


implementation

uses dBase, fMain, fChoiceNasel;

var
  fmPasportViza: TfmPasportViza;


{$R *.DFM}

function EditPasportViza( nID : Integer) : Boolean;
begin
  result := true;
  fmPasportViza := TfmPasportViza.Create(nil);
  try
    if nID=-1 then begin
      fmPasportViza.NewDok(true);
//      fmfmPasportViza.SetIDZags;
    end else begin
      fmPasportViza.ReadDok( nID );
    end;
    result := fmPasportViza.EditModal;
  finally
    fmPasportViza.Free;
    fmPasportViza := nil;
  end;
end;

{ TfmPasportViza }

constructor TfmPasportViza.Create(Owner: TComponent);
begin
  inherited;
//  edFamilia.EditButtons[0].Glyph := edDecl.EditButtons[0].Glyph;
//  pc.ActivePageIndex:=0;
  FPageControl := pc;
//  fmMain.SetCurrentDokument(Dokument);
  dmBase.SetDateFormat(tbWork);
end;

destructor TfmPasportViza.Destroy;
begin
//  DestroyHint(H);
  inherited;
end;

function TfmPasportViza.GetVid: String;
begin
  Result := 'PasportViza';
end;

function TfmPasportViza.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  if lAppend then DokumentTYPE_GOROD.AsInteger:=1;
  inherited NewDok(lAppend);
  QueryExit:=false;
  Result := true;
end;

function TfmPasportViza.ReadDok(nID: Integer): Boolean;
var
  i,j : Integer;
  fld : TField;
  strField, strWork : String;
  sl : TStringList;
  arr  : TArrStrings;
  lErr : Boolean;
begin
  Result := true;
  if not dmBase.tbPasportViza.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbPasportViza.FieldCount-1 do begin
    strField := dmBase.tbPasportViza.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      if not dmBase.tbPasportViza.Fields[i].IsNull then begin
        fld.Value := dmBase.tbPasportViza.Fields[i].Value;
      end;
    end;
  end;
  if DokumentTYPE_GOROD.IsNull then DokumentTYPE_GOROD.AsInteger:=1;
//  SetIDZags;
  Dokument.Post;
  strWork := dmBase.tbPasportViza.FieldByName('WORKING').AsString;
  StrToArr(strWork, arr, Chr(13), true);
  sl := TStringList.Create;
  tbWork.EmptyTable;
  for i:=Low(arr) to High(arr) do begin
    sl.CommaText := arr[i];
    tbWork.Append;
    lErr := false;
    try
      for j:=0 to sl.Count-1 do begin
        if sl.Strings[j] <> '' then begin
          case j of
            0 : tbWorkDatePost.AsDateTime := STOD(sl.Strings[0],tdAds);
            1 : tbWorkDateUvol.AsDateTime := STOD(sl.Strings[1],tdAds);
            2 : tbWorkWorkName.AsString   := sl.Strings[2];
            3 : tbWorkWorkMesto.AsString  := sl.Strings[3];
          end;
        end;
      end;
    except
      lErr := true;
    end;
    if lErr then tbWork.Cancel
            else tbWork.Post;
  end;
  sl.Free;
end;

function TfmPasportViza.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr : String;
  strWork, strRec, strDate1, strDate2 : String;
begin
  PostDataSet(Dokument);
  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
  if DokumentDATEZ.IsNull then begin
//    strErr := ' Заполните дату. ';
  end else if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') or
              (DokumentOTCH.AsString='')then begin
    strErr := ' Заполните Фамилия, Имя, Отчество. ';
  end;
  if strErr<>'' then begin
    PutError(strErr);
    Result := false;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbPasportViza.Append;
    dmBase.tbPasportViza.Post;
    nID := dmBase.tbPasportViza.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.tbPasportViza.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    Dokument.Post;
    dmBase.tbPasportViza.Edit;
    for i:=1 to dmBase.tbPasportViza.FieldCount-1 do begin
      strField := dmBase.tbPasportViza.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.tbPasportViza.Fields[i].Value := fld.Value;
      end;
    end;
    strWork := '';
    tbWork.First;
    while not tbWork.Eof do begin
      if tbWorkDatePost.IsNull then begin
        strDate1 := '';
      end else begin
        strDate1 := DTOS(tbWorkDatePost.AsDateTime, tdAds);
      end;
      if tbWorkDateUvol.IsNull then begin
        strDate2 := '';
      end else begin
        strDate2 := DTOS(tbWorkDateUvol.AsDateTime, tdAds);
      end;
      strRec := '"'+strDate1+'",'+
                '"'+strDate2+'",'+
                '"'+tbWorkWorkName.AsString+'",'+
                '"'+tbWorkWorkMesto.AsString+'"'+
                Chr(13);
      strWork := strWork + strRec;
      tbWork.Next;
    end;
    dmBase.tbPasportViza.FieldByName('WORKING').AsString := strWORK;
    dmBase.tbPasportViza.Post;
    QueryExit:=false;
    Result := true;
  end;
end;

procedure TfmPasportViza.edFamiliaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  adr : TAdres;
  nID : Integer;
  old : TCursor;
  pasport : TPassport;
  strName : String;
begin
  if ChoiceMen( TControl(Sender), Trim(edFamilia.Text), '', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      v := GetValueField(arrRec, 'ID');
      DokumentMEN_ID.AsInteger := v;
      nID := DokumentMEN_ID.AsInteger;
      v := GetValueField(arrRec, 'FAMILIA');
      if v <> null then DokumentFamilia.AsString := v
                   else DokumentFamilia.AsString := '';
      v := GetValueField(arrRec, 'NAME');
      if v <> null then DokumentName.AsString := v
                   else DokumentName.AsString := '';
      v := GetValueField(arrRec, 'OTCH');
      if v <> null then DokumentOtch.AsString := v
                   else DokumentOtch.AsString := '';
      v := GetValueField(arrRec, 'DATER');
      if v = null then DokumentDateR.AsString := ''
                  else DokumentDateR.Value    := v;
      v := GetValueField(arrRec, 'POL');
      if v = null then DokumentPOL.AsString := ''
                  else DokumentPOL.Value    := v;
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
//      dmBase.
      DokumentPROPIS.AsString := fmMain.NameObl('')+', '+fmMain.NameRaion('')+', ';
      if adr.Punkt <> ''
         then DokumentPROPIS.AsString := DokumentPROPIS.AsString + ', '+adr.Punkt
         else DokumentPROPIS.AsString := '';
      if adr.UlicaDom <> ''
         then DokumentPROPIS.AsString := DokumentPROPIS.AsString+', '+adr.UlicaDom
         else DokumentPROPIS.AsString := '';
      pasport := dmBase.PasportMen(dmBase.GetDateCurrentSost, IntToStr(nID));
      DokumentPASP_SERIA.AsString := Pasport.Seria;
      DokumentPASP_NOMER.AsString := Pasport.Nomer;
      DokumentPASP_VIDAN.AsString := Pasport.Organ;
      DokumentLICH_NOMER.AsString := Pasport.LichNomer;
      DokumentPASP_DATE.AsDateTime := Pasport.Date;
      PostDataSet(Dokument);
      Screen.Cursor := old;
  end;
end;

procedure TfmPasportViza.UpdateActions;
begin
  inherited;
end;

procedure TfmPasportViza.dsDokumentDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (Field<>nil) and not FRun then begin
    if ANSIUpperCase(Field.FieldName) = 'FAMILIA' then begin
      if Field.AsString = '' then begin
        DokumentMEN_ID.AsString:='';
      end;
    end;
  end;
end;

function TfmPasportViza.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
end;

procedure TfmPasportViza.LoadFromIni;
begin
  inherited;
//  GlobalTask.SetMRUListForm(self);
end;

function TfmPasportViza.SaveToIni: Boolean;
begin
  Result := inherited SaveToIni;
  if Result then begin
//    GlobalTask.SaveMRUListForm(self);
  end;
end;

//procedure TfmPasportViza.OnDestroyHint(Sender: TObject);
//begin
//  DestroyHint(H);
//end;

function TfmPasportViza.BeforeReport: Boolean;
begin
  Result := true;
  PostDataSet(Dokument);
  PostDataSet(tbWork);
  FBool := dbDisableControls(tbWork);
end;

procedure TfmPasportViza.AfterReport;
begin
  dbEnableControls(tbWork,FBool);
end;

end.
