unit fVidGit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSimple, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, FuncPr, uTypes,
  ExtCtrls, Grids, DBGridEh, SasaDBGrid, StdCtrls, Mask, DBCtrlsEh, dbFunc,uProject,uProjectAll,ifpii_dbfunc,
  MetaTask, fSimpleD, FR_DSet, FR_DBSet, Buttons
  {$IFDEF VER150} ,Variants, ImgList, vchDBCtrls, kbmMemCSVStreamFormat,
  DBLookupEh, ZipForge {$ENDIF}  ;

type
  TfmVidGit = class(TfmSimpleD)
    PageControl1: TPageControl;
    tsMain: TTabSheet;
    tsChildren: TTabSheet;
    tbChildren: TkbmMemTable;
    tbDok: TkbmMemTable;
    dsChildren: TDataSource;
    dsDok: TDataSource;
    DokumentORGAN: TMemoField;
    DokumentPRICHINA: TMemoField;
    DokumentFAMILIA: TStringField;
    DokumentNAME: TStringField;
    DokumentOTCH: TStringField;
    DokumentFAMILIA_B: TStringField;
    DokumentNAME_B: TStringField;
    DokumentOTCH_B: TStringField;
    DokumentDATE_ROGD: TDateField;
    DokumentGOR: TStringField;
    DokumentRN: TStringField;
    DokumentOBL: TStringField;
    DokumentSTRANA: TStringField;
    DokumentGOR_B: TStringField;
    DokumentRN_B: TStringField;
    DokumentOBL_B: TStringField;
    DokumentSTRANA_B: TStringField;
    DokumentFASER_FAMILIA: TStringField;
    DokumentFASER_NAME: TStringField;
    DokumentFASER_OTCH: TStringField;
    DokumentMASER_FAMILIA: TStringField;
    DokumentMASER_NAME: TStringField;
    DokumentMASER_OTCH: TStringField;
    DokumentSUPRUG_FAMILIA: TStringField;
    DokumentSUPRUG_NAME: TStringField;
    DokumentSUPRUG_OTCH: TStringField;
    DokumentDOBRAK_FAMILIA: TStringField;
    DokumentBRAK_DATE: TDateField;
    DokumentBRAK_MESTO: TStringField;
    DokumentADRES: TStringField;
    DokumentADRES_B: TStringField;
    DokumentZAGR: TMemoField;
    DokumentFAMILIA_ENGL: TStringField;
    DokumentNAME_ENGL: TStringField;
    tbChildrenFAMILIA: TStringField;
    tbChildrenNAME: TStringField;
    tbChildrenOTCH: TStringField;
    tbChildrenDATE_ROGD: TDateField;
    tbDokNAME_DOK: TStringField;
    tbDokSERIA: TStringField;
    tbDokNOMER: TStringField;
    tbDokORGAN: TStringField;
    Pn2: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    gbRus: TGroupBox;
    edFam: TDBEditEh;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    gbBel: TGroupBox;
    BLR_edFamB: TDBEditEh;
    BLR_edNameB: TDBEditEh;
    BLR_edOtchB: TDBEditEh;
    BLR_edGorB: TDBEditEh;
    BLR_edRnB: TDBEditEh;
    BLR_edOblB: TDBEditEh;
    BLR_edStranaB: TDBEditEh;
    edGor: TDBEditEh;
    edRn: TDBEditEh;
    edObl: TDBEditEh;
    edStrana: TDBEditEh;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Pn5: TPanel;
    GroupBox1: TGroupBox;
    edDateRogd: TDBDateTimeEditEh;
    Label11: TLabel;
    Label12: TLabel;
    BLR_edAdresB: TDBEditEh;
    edAdres: TDBEditEh;
    Pn4: TPanel;
    DokumentLICH_NOMER: TStringField;
    pn1: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edLichNomer: TDBEditEh;
    edOrgan: TDBEditEh;
    edPrich: TDBEditEh;
    gbZag: TGroupBox;
    BLR_DBEditEh1: TDBEditEh;
    GroupBox2: TGroupBox;
    GridChildren: TSasaDBGrid;
    GroupBox5: TGroupBox;
    GridDok: TSasaDBGrid;
    GroupBox6: TGroupBox;
    DokumentDATE_ZAPOLN: TDateField;
    DokumentSUPRUG_DATE: TDateField;
    TBItemChoiceMen: TTBItem;
    DokumentID_MEN: TIntegerField;
    DokumentOTMETKA: TMemoField;
    DokumentPOL: TStringField;
    DokumentSEM_1: TBooleanField;
    DokumentSEM_2: TBooleanField;
    DokumentSEM_3: TBooleanField;
    DokumentNOMER_AZ: TIntegerField;
    tbDokDATE_DOK: TDateField;
    tbChildrenNOMER: TAutoIncField;
    Label23: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    gbBrak: TGroupBox;
    BLR_edSuprugFam: TDBEditEh;
    BLR_edSuprugName: TDBEditEh;
    BLR_edSuprugOtch: TDBEditEh;
    Label15: TLabel;
    gbLatin: TGroupBox;
    edFamilia_Engl: TDBEditEh;
    edName_Engl: TDBEditEh;
    BLR_edOtmetka: TDBEditEh;
    Label21: TLabel;
    edPol: TDBComboBoxEh;
    tbDokAKT_ZAP: TStringField;
    tbChildrenPOL: TStringField;
    TBItemTalonPrib: TTBItem;
    tbChildrenKOMM: TStringField;
    TBItemTalonUbit: TTBItem;
    DokumentPRAV_STATUS: TStringField;
    DokumentLICH_NOMER_OLD: TStringField;
    DokumentTYPEDOK: TIntegerField;
    DokumentTDATE_PRIB: TSmallintField;
    DokumentTYPE_CITIZEN: TSmallintField;
    DokumentDATE_PRIB: TDateField;
    N_F_cbOnlyGodPrib: TDBComboBoxEh;
    edDatePrib: TDBDateTimeEditEh;
    Label13: TLabel;
    Label10: TLabel;
    BLR_edSuprugFamDoBrak: TDBEditEh;
    Label25: TLabel;
    edSuprugRogd: TDBDateTimeEditEh;
    Label26: TLabel;
    edBrakDate: TDBDateTimeEditEh;
    edNomerAZ: TDBNumberEditEh;
    Label28: TLabel;
    BLR_edBrakMesto: TDBEditEh;
    Label27: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    edLichNomerOld: TDBEditEh;
    dsCitizen: TDataSource;
    DokumentCITIZEN_OLD: TStringField;
    edCitizenOld: TDBEditEh;
    edGrag: TDBComboBoxEh;
    DokumentTDATE_ROGD: TSmallintField;
    N_F_cbTypeDateR: TDBComboBoxEh;
    Label4: TLabel;
    Panel1: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    Panel3: TPanel;
    btAddDok: TBitBtn;
    btDelDok: TBitBtn;
    procedure TBItemChoiceMenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edOrganEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure GridChildrenColumns1UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure GridDokColumns5EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edNameUpdateData(Sender: TObject; var Handled: Boolean);
    procedure TBItemTalonPribClick(Sender: TObject);
    procedure TBItemTalonUbitClick(Sender: TObject);
    procedure N_F_cbOnlyGodPribChange(Sender: TObject);
    procedure N_F_cbTypeDateRChange(Sender: TObject);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure btAddDokClick(Sender: TObject);
    procedure btDelDokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetSem( n : Integer);
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure DeleteLists(nID : Integer);
    constructor Create(Owner : TComponent); override;
  end;

var
  fmVidGit: TfmVidGit;

implementation

uses fMain, dBase, OpisEdit, fChoiceNasel, fShablon, fTalonPrib, fTalonUbit;

{$R *.DFM}

{ TfmVidGit }

function TfmVidGit.GetVid: String;
begin
 Result := 'VidGit';
end;

procedure TfmVidGit.SetSem( n : Integer);
begin
  case n of
  1: begin   //1=состоит в браке
       DokumentSEM_1.AsBoolean:=false;
       DokumentSEM_2.AsBoolean:=false;
       DokumentSEM_3.AsBoolean:=false;
     end;
  2: begin  //2=в браке не состоял(а)
       DokumentSEM_1.AsBoolean:=true;
       DokumentSEM_2.AsBoolean:=false;
       DokumentSEM_3.AsBoolean:=false;
     end;
  3: begin  //3=вдовец(а)
       DokumentSEM_1.AsBoolean:=false;
       DokumentSEM_2.AsBoolean:=false;
       DokumentSEM_3.AsBoolean:=true;
     end;
  4: begin  //4=разведен(а)
       DokumentSEM_1.AsBoolean:=false;
       DokumentSEM_2.AsBoolean:=true;
       DokumentSEM_3.AsBoolean:=false;
     end;
  end
end;
//----------------------------------------------------------------------------
function TfmVidGit.ReadDok( nID : Integer) : Boolean;
var
  i   : Integer;
  fld : TField;
  strField : String;
begin
  if not dmBase.tbPassports.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  FRead:=true;
  NewDok(false);
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.tbPassports.FieldCount-1 do begin
    strField := dmBase.tbPassports.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      fld.Value := dmBase.tbPassports.Fields[i].Value;
    end;
  end;
  if DokumentTYPEDOK.IsNull      then DokumentTYPEDOK.AsInteger:=dmBase.TypeObj_VidGit;
  if DokumentPOL.IsNull          then DokumentPOL.AsString:='М';
  if DokumentTYPE_CITIZEN.IsNull then DokumentTYPE_CITIZEN.AsInteger:=1;
  if DokumentSEM_1.IsNull     then begin
    SetSem(1);
  end;
  Dokument.Post;
  //---------------------------------------
  dmBase.tbPaspChildren.IndexName:='PR_KEY';
  dmBase.tbPaspChildren.SetRange([nID],[nID]);
  while not dmBase.tbPaspChildren.Eof do begin
    tbChildren.Append;
    for i:=1 to dmBase.tbPaspChildren.FieldCount-1 do begin
      strField := dmBase.tbPaspChildren.Fields[i].FieldName;
      fld := tbChildren.FindField(strField);
      if fld <> nil then begin
        fld.Value := dmBase.tbPaspChildren.Fields[i].Value;
      end;
    end;
    tbChildren.Post;
    dmBase.tbPaspChildren.Next;
  end;
  dmBase.tbPaspChildren.CancelRange;
  //---------------------------------------
  dmBase.tbPaspOsnov.IndexName:='PR_KEY';
  dmBase.tbPaspOsnov.SetRange([nID],[nID]);
  while not dmBase.tbPaspOsnov.Eof do begin
    tbDok.Append;
    for i:=1 to dmBase.tbPaspOsnov.FieldCount-1 do begin
      strField := dmBase.tbPaspOsnov.Fields[i].FieldName;
      fld := tbDok.FindField(strField);
      if fld <> nil then begin
        fld.Value := dmBase.tbPaspOsnov.Fields[i].Value;
      end;
    end;
    tbDok.Post;
    dmBase.tbPaspOsnov.Next;
  end;
  dmBase.tbPaspOsnov.CancelRange;
  //--------------------------------------------
  FRead:=false;
  QueryExit:=false;
  Result := true;
end;
//-----------------------------------------------------------------------
function TfmVidGit.WriteDok: Boolean;
//const
//  ArrFields : array[0..10] of String = ( '' );
var
  i, nID : Integer;
  fld : TField;
  strField : String;
  ds : TDataSet;
  lOk : Boolean;
  Pol:TPol;
begin
  PostDataSet(Dokument);
  PostDataSet(tbChildren);
  PostDataSet(tbDok);
  Result := true;
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.tbPassports.Append;
    dmBase.tbPassports.Post;
    nID := dmBase.tbPassports.FieldByName('ID').AsInteger;
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    PostDataSet(Dokument);
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.tbPassports.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
//  nID := dmBase.tbPassports.FieldByName('ID').AsInteger;
  if Result then begin
    GlobalTask.SetLastValueAsString('PASP_ORGAN_BEL',DokumentORGAN.AsString);
    dmBase.tbPassports.Edit;
    for i:=1 to dmBase.tbPassports.FieldCount-1 do begin
      strField := dmBase.tbPassports.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.tbPassports.Fields[i].Value := fld.Value;
      end;
    end;
    if dmBase.tbPassports.FieldByNAme('TYPE_CITIZEN').IsNull
      then dmBase.tbPassports.FieldByNAme('TYPE_CITIZEN').AsInteger:=1;

    dmBase.tbPassports.Post;
    DeleteLists(nID);
    tbChildren.First;
    while not tbChildren.Eof do begin
      dmBase.tbPaspChildren.Append;
      dmBase.tbPaspChildren.FieldByName('ID').AsInteger := nID;
      for i:=1 to dmBase.tbPaspChildren.FieldCount-1 do begin
        strField := dmBase.tbPaspChildren.Fields[i].FieldName;
        fld := tbChildren.FindField(strField);
        if fld <> nil then begin
          dmBase.tbPaspChildren.Fields[i].Value := fld.Value;
        end;
      end;
      dmBase.tbPaspChildren.Post;
      tbChildren.Next;
    end;
    tbDok.First;
    while not tbDok.Eof do begin
      dmBase.tbPaspOsnov.Append;
      dmBase.tbPaspOsnov.FieldByName('ID').AsInteger := nID;
      for i:=1 to dmBase.tbPaspOsnov.FieldCount-1 do begin
        strField := dmBase.tbPaspOsnov.Fields[i].FieldName;
        fld := tbDok.FindField(strField);
        if fld <> nil then begin
          dmBase.tbPaspOsnov.Fields[i].Value := fld.Value;
        end;
      end;
      dmBase.tbPaspOsnov.Post;
      tbDok.Next;
    end;

    AdditiveWriteDok;

    {---- попросили убрать новоселки --------
    if not DokumentID_MEN.Isnull then begin
      ds := dmBase.GetMen(dmBase.GetDateCurrentSost,
                          DokumentID_MEN.AsString);
      lOk := true;
      try
        EditDataSet(ds);
      except
        lOk := false;
      end;
      if lOk then begin
        ds.FieldByName('LICH_NOMER').AsString := DokumentLICH_NOMER.AsString;
        ds.FieldByName('FAMILIA').AsString    := DokumentFAMILIA.AsString;
        ds.FieldByName('NAME').AsString       := DokumentNAME.AsString;
        ds.FieldByName('OTCH').AsString       := DokumentOTCH.AsString;
        ds.FieldByName('DATER').AsString      := DokumentDATE_ROGD.AsString;
        PostDataSet(ds);
      end;
    end;
    -------------------------- }
    QueryExit:=false;
    Result := true;
  end;
  if Result then begin
//    GlobalTask.SetLastValueAsString('SELO', DokumentGOR.AsString);
//    GlobalTask.SetLastValueAsString('SELO_B', DokumentGOR_B.AsString);
//    GlobalTask.SetLastValueAsString('RAION_B', DokumentRN_B.AsString);
//    GlobalTask.SetLastValueAsString('OBL_B', DokumentOBL_B.AsString);
//    GlobalTask.SetLastValueAsString('GOSUD_B', DokumentSTRANA_B.AsString);
    dmBase.CheckLatFamily(DokumentFAMILIA.AsString,DokumentFAMILIA_ENGL.AsString);
    dmBase.CheckBelFamily(DokumentFAMILIA.AsString,DokumentFAMILIA_B.AsString);
    if DokumentPOL.AsString='Ж' then Pol:=tpG else Pol:=tpM;
    dmBase.CheckNameBel(Pol, DokumentNAME.AsString, DokumentNAME_B.AsString);
    dmBase.CheckNameLat(Pol, DokumentNAME.AsString, DokumentNAME_ENGL.AsString);
    dmBase.CheckBelNazv(1,false, DokumentOBL.AsString, DokumentOBL_B.AsString);
    dmBase.CheckBelNazv(2,false, DokumentRN.AsString, DokumentRN_B.AsString);
  end;
end;

//--------------------------------------------------------------
procedure TfmVidGit.DeleteLists( nID : Integer);
begin
  while dmBase.tbPaspChildren.Locate('ID', nID, []) do begin
    dmBase.tbPaspChildren.Delete;
  end;
  while dmBase.tbPaspOsnov.Locate('ID', nID, []) do begin
    dmBase.tbPaspOsnov.Delete;
  end;
end;

//-----------------------------------------------------
function TfmVidGit.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger := -1;
  DokumentTDATE_PRIB.AsInteger:=0;
  DokumentTDATE_ROGD.AsInteger:=0;
  DokumentTYPEDOK.AsInteger:=dmBase.TypeObj_VidGit;
  DokumentTYPE_CITIZEN.AsInteger:=1;
  DokumentORGAN.AsString := GlobalTask.GetLastValueAsString('PASP_ORGAN_BEL');
  DokumentPRICHINA.AsString := GlobalTask.ParamAsString('VID_PRICHINA');

  DokumentGOR.AsString:=dmBase.NamePunkt(GlobalTask.ParamAsString('GOROD'), GlobalTask.ParamAsInteger('TYPEPUNKT'), 'Р');
  DokumentGOR_B.AsString:=dmBase.NamePunkt(GlobalTask.ParamAsString('GOROD_B'), GlobalTask.ParamAsInteger('TYPEPUNKT'), 'Б');
  DokumentRN.AsString := GlobalTask.ParamAsString('RAION');
  DokumentRN_B.AsString:=dmBase.GetBelNazv(2,false,DokumentRN.AsString);
  DokumentOBL.AsString := GlobalTask.ParamAsString('OBL');
  DokumentOBL_B.AsString:=dmBase.GetBelNazv(1,false,DokumentOBL.AsString);

  if dmBase.SprStran.Locate('ID',GlobalTask.ParamAsInteger('GOSUD'),[]) then begin
    DokumentSTRANA.AsString:=dmBase.SprStran.FieldByName('FNAME').AsString;
    DokumentSTRANA_B.AsString:=dmBase.SprStran.FieldByName('FNAME_B').AsString;
  end;

{
  DokumentGOR.AsString   := GlobalTask.GetLastValueAsString('SELO');
  DokumentGOR_B.AsString := GlobalTask.GetLastValueAsString('SELO_B');
  DokumentRN.AsString := GlobalTask.ParamAsString('RAION');
  DokumentRN_B.AsString := GlobalTask.GetLastValueAsString('RAION_B');
  DokumentOBL.AsString := GlobalTask.ParamAsString('OBL');
  DokumentOBL_B.AsString := GlobalTask.GetLastValueAsString('OBL_B');
  DokumentSTRANA.AsString := GlobalTask.ParamAsName('GOSUD',false);
  DokumentSTRANA_B.AsString := GlobalTask.GetLastValueAsString('GOSUD_B');
}
  DokumentPOL.AsString := 'М';
  SetSem(2);
  inherited NewDok(lAppend);
  Dokument.Post;
  tbChildren.EmptyTable;
  tbChildren.ResetAutoInc;
  tbDok.EmptyTable;
  Result := true;
  QueryExit:=false;
end;

procedure TfmVidGit.TBItemChoiceMenClick(Sender: TObject);
var
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  Adr:TAdres;
  i:Integer;
  s:String;
  Pol:TPol;
  arr:TArrStrings;
  ListDeti:TDataSet;
  p:TPassport;
begin
  if ChoiceMen( nil, '', '', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      v := GetValueField(arrRec, 'ID');
      DokumentID_MEN.AsInteger := v;
      v := GetValueField(arrRec, 'FAMILIA');
      s:=GetValueField(arrRec, 'POL');
      if s='Ж'
        then Pol:=tpG
        else Pol:=tpM;

      if v = null then DokumentFAMILIA.AsString := ''
                  else DokumentFAMILIA.AsString := v;
      DokumentFAMILIA_B.AsString:=dmBase.GetBelFamily(DokumentFAMILIA.AsString);
      DokumentFAMILIA_ENGL.AsString:=dmBase.GetLatFamily(DokumentFAMILIA.AsString);
      v := GetValueField(arrRec, 'NAME');
      if v = null then DokumentNAME.AsString := ''
                  else DokumentNAME.AsString := v;
      DokumentNAME_B.AsString:=dmBase.CheckNameBel(Pol,DokumentNAME.AsString);
      DokumentNAME_ENGL.AsString:=dmBase.CheckNameLat(Pol,DokumentNAME.AsString,'');
      v := GetValueField(arrRec, 'OTCH');
      if v = null then DokumentOTCH.AsString := ''
                  else DokumentOTCH.AsString := v;
      DokumentOTCH_B.AsString:=dmBase.CheckOtchBel(Pol,DokumentOTCH.AsString);
      v := GetValueField(arrRec, 'DATER');
      if v = null then DokumentDATE_ROGD.AsString := ''
                  else DokumentDATE_ROGD.Value    := v;

      v := GetValueField(arrRec, 'LICH_NOMER');
      if v = null then DokumentLICH_NOMER.AsString := ''
                  else DokumentLICH_NOMER.Value    := v;
      p := dmBase.GetRecPasport(DokumentID_MEN.AsInteger, arrRec);
      if p.Nomer <> '' then begin
        tbDok.EmptyTable;
        tbDok.Append;
        tbDokNAME_DOK.AsString:=p.UdostB;
        tbDokSERIA.AsString:=p.Seria;
        tbDokNOMER.AsString:=p.Nomer;
        tbDokDATE_DOK.AsDateTime:=p.Date;
        tbDokORGAN.AsString:=p.Organ;
        tbDok.Post;                               
      end;

      v := GetValueField(arrRec, 'POL');
      if v = null then DokumentPOL.AsString := ''
                  else DokumentPOL.Value    := v;

      v := GetValueField(arrRec, 'SEM');
      if v = null then SetSem(1)
                  else SetSem(v);

      v:=GetValueField(arrRec, 'ADRES_ID');
      if v<>null then begin
        DokumentADRES.AsString:=dmBase.AdresFromID( dmBase.GetDateCurrentSost, v);
      end;
      // место рождения
      if dmBase.tbMensAdd.Locate('ID',DokumentID_MEN.AsInteger,[]) then begin
        Adr:=dmBase.GetMestoFromFieldsEx(dmBase.tbMensAdd,';MR_GOSUD;MR_B_OBL;MR_OBL;MR_RAION;MR_B_GOROD;MR_GOROD');
        DokumentSTRANA.AsString:=Adr.Strana;
        if dmBase.SprStran.Locate('FNAME',Adr.Strana,[]) then begin
          DokumentSTRANA_B.AsString:=dmBase.SprStran.FieldByName('FNAME_B').AsString;
        end else begin
          DokumentSTRANA_B.AsString:='';
        end;
        DokumentOBL.AsString:=Adr.Obl;
        i:=Pos('область',Adr.Obl);
        if i>0 then Adr.Obl:=Trim(Copy(Adr.Obl,1,i-1));
        DokumentOBL.AsString:=Adr.Obl;
        DokumentOBL_B.AsString:=dmBase.GetBelNazv(1,false,Adr.Obl);

        i:=Pos('район',Adr.Raion);
        if i>0 then Adr.Raion:=Trim(Copy(Adr.Raion,1,i-1));
        DokumentRN.AsString:=Adr.Raion;
        DokumentRN_B.AsString:=dmBase.GetBelNazv(2,false,Adr.Raion);

        DokumentGOR.AsString:=Adr.Punkt;
        dmBase.GetTypePunkt(IntToStr(Adr.PunktTK),'B',s);
        DokumentGOR_B.AsString:=s+' '+dmBase.GetBelNazv(3,false,Adr.PunktN);
      end;

      v:=GetValueField(arrRec, 'PA_ID');
      if v<>null then begin
        s:=dmBase.FIOMen(dmBase.GetDateCurrentSost,v,';');
        StrToArr(s,arr,';',false);
        SetLength(arr,3);
        DokumentFASER_FAMILIA.AsString:=arr[0];
        DokumentFASER_NAME.AsString:=arr[1];
        DokumentFASER_OTCH.AsString:=arr[2];

        Pol:=tpM;
        DokumentFASER_FAMILIA.AsString:=dmBase.GetBelFamily(DokumentFASER_FAMILIA.AsString);
        if DokumentFASER_FAMILIA.AsString='' then DokumentFASER_FAMILIA.AsString:=arr[0];
        DokumentFASER_NAME.AsString:=dmBase.CheckNameBel(Pol, DokumentFASER_NAME.AsString);
        if DokumentFASER_NAME.AsString='' then DokumentFASER_NAME.AsString:=arr[1];
        DokumentFASER_OTCH.AsString:=dmBase.CheckOtchBel(Pol,DokumentFASER_OTCH.AsString);
        if DokumentFASER_OTCH.AsString='' then DokumentFASER_OTCH.AsString:=arr[2];
      end;
      v:=GetValueField(arrRec, 'MA_ID');
      if v<>null then begin
        s:=dmBase.FIOMen(dmBase.GetDateCurrentSost,v,';');
        StrToArr(s,arr,';',false);
        SetLength(arr,3);
        DokumentMASER_FAMILIA.AsString:=arr[0];
        DokumentMASER_NAME.AsString:=arr[1];
        DokumentMASER_OTCH.AsString:=arr[2];

        Pol:=tpG;
        DokumentMASER_FAMILIA.AsString:=dmBase.GetBelFamily(DokumentMASER_FAMILIA.AsString);
        if DokumentMASER_FAMILIA.AsString='' then DokumentMASER_FAMILIA.AsString:=arr[0];
        DokumentMASER_NAME.AsString:=dmBase.CheckNameBel(Pol,DokumentMASER_NAME.AsString);
        if DokumentMASER_NAME.AsString='' then DokumentMASER_NAME.AsString:=arr[1];
        DokumentMASER_OTCH.AsString:=dmBase.CheckOtchBel(Pol,DokumentMASER_OTCH.AsString);
        if DokumentMASER_OTCH.AsString='' then DokumentMASER_OTCH.AsString:=arr[2];
      end;

      ListDeti:=dbCreateListDeti;
      dmBase.GetDeti(ListDeti,DokumentID_MEN.AsString,DokumentPOL.AsString,0,17,false,false);
      tbChildren.EmptyTable;
      while not ListDeti.Eof do begin
        tbChildren.Append;
        tbChildrenPOL.AsString:=ListDeti.FieldByName('POL').AsString;
        tbChildrenFAMILIA.AsString:=dmBase.GetBelFamily(ListDeti.FieldByName('FAMILIA').AsString);
        if tbChildrenFAMILIA.AsString='' then tbChildrenFAMILIA.AsString:=ListDeti.FieldByName('FAMILIA').AsString;
        if tbChildrenPOL.AsString='Ж' then Pol:=tpG else Pol:=tpM;
        tbChildrenNAME.AsString:=dmBase.CheckNameBel(Pol,ListDeti.FieldByName('NAME').AsString);
        if tbChildrenNAME.AsString='' then tbChildrenNAME.AsString:=ListDeti.FieldByName('NAME').AsString;
        tbChildrenOTCH.AsString:=dmBase.CheckOtchBel(Pol,ListDeti.FieldByName('OTCH').AsString);
        if tbChildrenOTCH.AsString='' then tbChildrenOTCH.AsString:=ListDeti.FieldByName('OTCH').AsString;
        if not ListDeti.FieldByName('DATER').IsNull then begin
          tbChildrenDATE_ROGD.AsDateTime:=ListDeti.FieldByName('DATER').AsDateTime;
        end;
        tbChildrenKOMM.AsString:=ListDeti.FieldByName('AKT_ROGD').AsString;

        tbChildren.Post;
        ListDeti.Next;
      end;
      dbClose(ListDeti);

      PostDataSet(Dokument);
      Screen.Cursor := old;
//        if adr.PunktN <> '' then DokumentON_M_GOROD.AsString := adr.PunktN;
//        if adr.PunktTK>0 then DokumentON_M_B_GOROD.AsInteger:= adr.PunktTK;
//        if adr.UlicaDom <> '' then DokumentON_M_GOROD_R.AsString := adr.UlicaDom;

  end;
end;

//-----------------------------------------------------------------------------
procedure TfmVidGit.FormCreate(Sender: TObject);
begin
  inherited;
  dmBase.SetDateFormat(tbDok);
  PageControl1.ActivePageIndex:=0;
end;

//-----------------------------------------------------------------------------
procedure TfmVidGit.edOrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD_BEL,Trim(edOrgan.Text));
 if s<>'' then begin
   edOrgan.Text:=s;
 end;
end;

//------------------------------------------------------------------------------------
constructor TfmVidGit.Create(Owner: TComponent);
var
  lAutoAdd:Boolean;
begin
  inherited;
  FMainTable:=dmBase.tbPassports;

  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddDok.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelDok.Glyph);
  fmMain.ImageList.GetBitmap(IL_ADD_CHILD,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_CHILD,btDelChild.Glyph);

  SetLength(FArrChoiceRekv,2);

  FArrChoiceRekv[0].nType:=SHABLON_PRICH_PASP;
  FArrChoiceRekv[0].FieldName:='PRICHINA';

  FArrChoiceRekv[1].nType:=SHABLON_INOSTR_PASP;
  FArrChoiceRekv[1].FieldName:='ZAGR';

//  FArrChoiceRekv[3].nType:=0;
//  FArrChoiceRekv[3].nTypeSpr:=_SHABLON_WORK_DOLG;
//  FArrChoiceRekv[3].FieldName:='ON_WORK';
{
  edFamB.OnUpdateData:=FIOUpdateData;
  edNameB.OnUpdateData:=FIOUpdateData;
  edOtchB.OnUpdateData:=FIOUpdateData;
  edFam.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateData;
  edOtch.OnUpdateData:=FIOUpdateData;
  edFamL.OnUpdateData:=FIOUpdateData;
  edNameL.OnUpdateData:=FIOUpdateData;
}
  lAutoAdd:=false;
  BLR_edOBLB.MRUList.Items:=GetMRUName(1,true,false,true);
  BLR_edOBLB.MRUList.Active:=true;
  BLR_edOBLB.MRUList.AutoAdd:=lAutoAdd;
  edOBL.MRUList.Items:=GetMRUName(1,true,false,false);
  edOBL.MRUList.Active:=true;
  edOBL.MRUList.AutoAdd:=lAutoAdd;
  BLR_edRNB.MRUList.Items:=GetMRUName(2,true,false,true);
  BLR_edRNB.MRUList.Active:=true;
  BLR_edRNB.MRUList.AutoAdd:=lAutoAdd;
  edRN.MRUList.Items:=GetMRUName(2,true,false,false);
  edRN.MRUList.Active:=true;
  edRN.MRUList.AutoAdd:=lAutoAdd;
end;

procedure TfmVidGit.GridChildrenColumns1UpdateData(Sender: TObject; var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  s:String;
begin
  if Text<>'' then begin
    s:=PolFromName(edName.Text);
    if s<>'' then begin
      EditDataSet(tbChildren);
      tbChildrenPOL.AsString:=s;
    end;
  end;
  //  'сын' 'дачка'
end;

procedure TfmVidGit.GridDokColumns5EditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD_BEL,'');
 if s<>'' then begin
   EditDataSet(tbDok);
   tbDokORGAN.AsString:=s;
 end;
end;

procedure TfmVidGit.edNameUpdateData(Sender: TObject; var Handled: Boolean);
var
  s:String;
begin
  s:=PolFromName(edName.Text);
  if s<>'' then DokumentPOL.AsString:=s;
end;

//---------------------------------------------------------------------------------------
procedure TfmVidGit.TBItemTalonPribClick(Sender: TObject);
begin
  TalonPribFromPassport(Self, true);
end;

procedure TfmVidGit.TBItemTalonUbitClick(Sender: TObject);
begin
  TalonUbitFromPassport(Self, true);
end;

procedure TfmVidGit.N_F_cbOnlyGodPribChange(Sender: TObject);
begin
  CheckControlOnlyGod2(N_F_cbOnlyGodPrib.ItemIndex, edDatePrib);
end;

procedure TfmVidGit.N_F_cbTypeDateRChange(Sender: TObject);
begin
  CheckControlOnlyGod2(N_F_cbTypeDateR.ItemIndex, edDateRogd);
end;

procedure TfmVidGit.btAddChildClick(Sender: TObject);
begin
  QueryExit:=true;
  tbChildren.Append;
  ActiveControl:=GridChildren;
end;

procedure TfmVidGit.btDelChildClick(Sender: TObject);
begin
  if tbChildren.RecordCount>0 then begin
    QueryExit:=true;
    tbChildren.Delete;
    ActiveControl:=GridChildren;
  end;
end;

procedure TfmVidGit.btAddDokClick(Sender: TObject);
begin
  QueryExit:=true;
  tbDok.Append;
  ActiveControl:=GridDok;
end;

procedure TfmVidGit.btDelDokClick(Sender: TObject);
begin
  if tbDok.RecordCount>0 then begin
    QueryExit:=true;
    tbDok.Delete;
    ActiveControl:=GridDok;
  end;
end;

end.
