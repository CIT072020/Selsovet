unit fPrintSSS;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants, uProject, uProjectAll, dateUtils,
  fPrintForm, Db, kbmMemTable, FR_DSet, FR_DBSet, FR_Class, TB2Item, OpisEdit, MetaTask, dbFunc, FuncPr,
  TB2Dock, TB2Toolbar, ReportTask,{fmReport,} Grids, DBGridEh, StdCtrls, DBCtrlsEh, Mask,
  uObjectsScript, uPadegFIO, Buttons, ExtCtrls, adsdata, adsfunc,
  adstable, frxClass, frxDBSet;

type
  TfmPrintSSS = class(TfmPrintForm)
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label1: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    DBEditEh6: TDBEditEh;
    DBEditEh7: TDBEditEh;
    DBEditEh8: TDBEditEh;
    DBEditEh9: TDBEditEh;
    DBEditEh10: TDBEditEh;
    DBEditEh11: TDBEditEh;
    DBEditEh12: TDBEditEh;
    DBEditEh13: TDBEditEh;
    DBEditEh14: TDBEditEh;
    DBEditEh15: TDBEditEh;
    DBEditEh16: TDBEditEh;
    DBEditEh17: TDBEditEh;
    DBEditEh18: TDBEditEh;
    edDolgPodp1: TDBEditEh;
    edFIOPodp1: TDBEditEh;
    ListFIO: TStringField;
    ListGODR: TStringField;
    ListRODSTVO: TStringField;
    ListDATAPROP: TStringField;
    DokumentADRES: TStringField;
    DokumentDOM: TStringField;
    DokumentKORP: TStringField;
    DokumentKV: TStringField;
    DokumentNANIMAT: TStringField;
    DBEditEh21: TDBEditEh;
    Label25: TLabel;
    DokumentULICA: TStringField;
    DokumentPOMESH: TStringField;
    DokumentOBSHPLOSH: TStringField;
    DokumentETAG: TStringField;
    DokumentETAGNOGO: TStringField;
    DokumentMATSTEN: TStringField;
    DokumentOBORUDOV: TStringField;
    DokumentSOBSTV: TStringField;
    DokumentKOLVOKOMN: TStringField;
    DokumentISOLIROV: TStringField;
    DokumentPLOSHKOMN: TStringField;
    DokumentKUHN: TStringField;
    DokumentUCHREG: TStringField;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    btAddChild: TBitBtn;
    btDelChild: TBitBtn;
    DBEditEh22: TDBEditEh;
    DokumentGES: TStringField;
    Label2: TLabel;
    Label8: TLabel;
    SprPersonal: TAdsQuery;
    DokumentDATEPROP: TStringField;
    DBEditEh23: TDBEditEh;
    DokumentNAME_GODR: TStringField;
    DokumentDOLG_PODP1: TStringField;
    DokumentFIO_PODP1: TStringField;
    DokumentDOLG_PODP2: TStringField;
    DokumentFIO_PODP2: TStringField;
    DokumentDOLG_PODP3: TStringField;
    DokumentFIO_PODP3: TStringField;
    edDolgPodp2: TDBEditEh;
    edFIOPodp2: TDBEditEh;
    edDolgPodp3: TDBEditEh;
    edFIOPodp3: TDBEditEh;
    DokumentCOUNT_PODPIS: TSmallintField;
    Label22: TLabel;
    Label23: TLabel;
    edDate: TDBDateTimeEditEh;
    DokumentSPR_DATE: TDateField;
    TBSubMenu: TTBSubmenuItem;
    TBItemPadeg: TTBItem;
    TBItemAddIN: TTBItem;
    TBItemRogd: TTBItem;
    TBItemPrintShamp: TTBItem;
    DokumentSPR_NOMER: TStringField;
    edNomer: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btAddChildClick(Sender: TObject);
    procedure btDelChildClick(Sender: TObject);
    procedure DBEditEh20EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
    procedure edFIOPodp2EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edFIOPodp3EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure TBItemPadegClick(Sender: TObject);
    procedure TBItemAddINClick(Sender: TObject);
    procedure TBItemRogdClick(Sender: TObject);
    procedure TBItemPrintShampClick(Sender: TObject);
  private
    { Private declarations }
    FPol:String;
    FCurPadeg:Boolean;
    FAddIN:Boolean;
    FAddRogd:Boolean;
    FFIO:String;
    FIN:String;
    FDateR:TdateTime;
  public
    { Public declarations }
    procedure AddUbiv;
    procedure CreateStrDANA;
  end;

  procedure RunPrintSSS;

var
  fmPrintSSS: TfmPrintSSS;

implementation

uses dBase, fMain;

{$R *.DFM}

procedure RunPrintSSS;
begin
  fmPrintSSS:=TfmPrintSSS.Create(nil);
  try
    fmPrintSSS.ShowModal;
  finally
    fmPrintSSS.Free;
  end;
end;

procedure TfmPrintSSS.FormCreate(Sender: TObject);
var
   m : TMens;
   adr : TAdresLic;
//   adr : TAdres;
   nID,n,nCountPodpis : Integer;
   s,sOtn : String;
   lFirst : Boolean;
   slOwners : TStringList;
   v:Variant;
   lRun:Boolean;
   function Inc_s : String;  begin if s<>'' then result:=s+', ' else result:=''; end;
begin
  inherited;
  fmMain.ImageList.GetBitmap(IL_ADD_MEN,btAddChild.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_MEN,btDelChild.Glyph);
  m := LicSchet.Mens;
  LicSchet.Adres.GetAdres;
  adr := LicSchet.Adres;
  nID := m.Fld('ID_INTERNAL').AsInteger;
  sOtn:= m.Fld('OTNOSH').AsString;
  if nID = LicSchet.Fld('FIRST').AsInteger
    then lFirst := true
    else lFirst := false;
  Dokument.Edit;

  DokumentSPR_DATE.AsDateTime:=Now;
  DokumentSPR_NOMER.AsString:='';

  FCurPadeg:=Globaltask.GetLastValueAsBoolean('PADEG_SSS');
  FAddIN:=Globaltask.GetLastValueAsBoolean('ADDIN_SSS');
  FAddRogd:=Globaltask.GetLastValueAsBoolean('ADDROGD_SSS');

  if Globaltask.GetLastValueAsString('PRINT_STAMP')='0'
    then TBItemPrintShamp.Checked:=false
    else TBItemPrintShamp.Checked:=true;

  TBItemPadeg.Checked:=FCurPadeg;
  TBItemAddIN.Checked:=FAddIN;
  TBItemRogd.Checked:=FAddRogd;

  FPol:=ANSILowerCase(m.Fld('POL').AsString);

  DokumentNAME.AsString := m.FIO;
  FIN:=m.Fld('LICH_NOMER').AsString;
  FDateR:=m.Fld('DATER').AsDateTime;
  FFIO:=m.FIO;

  CreateStrDANA;


//  if m.Fld('DATER').AsString<>'' then
//    DokumentNAME.AsString := DokumentNAME.AsString+' , '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+'г.р.';

  if m.Fld('DATEP').AsString<>'' then
    DokumentDATEPROP.AsString := m.DvigToStr(', '); // FormatdateTime('dd.mm.yyyy',m.Fld('DATEP').AsDateTime);
  s:=fmMain.NameRaion('');
  if s<>'' then s:=s+', ';
  DokumentADRES.AsString := s+adr.Punkt;
  DokumentULICA.AsString := adr.Ulica;
  DokumentDOM.AsString := adr.Dom;
  DokumentKORP.AsString := adr.Korp;
  DokumentKV.AsString := adr.Kv;

  nCountPodpis:=Podpis_Init(27);
  DokumentCOUNT_PODPIS.AsInteger:=nCountPodpis;
  if nCountPodpis=0 then begin
    edDolgPodp3.Visible:=false;
    edFIOPodp3.Visible:=false;
    edDolgPodp2.Visible:=false;
    edFIOPodp2.Visible:=false;
    DokumentDOLG_PODP1.AsString  := DolgRukov;
    DokumentFIO_PODP1.AsString  := FIORukov;
  end else begin
    DokumentDOLG_PODP1.AsString  := Podpis_Dolg(1);
    DokumentFIO_PODP1.AsString  := Podpis_FIO(1);
    DokumentDOLG_PODP2.AsString  := Podpis_Dolg(2);
    DokumentFIO_PODP2.AsString  := Podpis_FIO(2);
    DokumentDOLG_PODP3.AsString  := Podpis_Dolg(3);
    DokumentFIO_PODP3.AsString  := Podpis_FIO(3);
    if nCountPodpis<3 then begin
      edDolgPodp3.Visible:=false;
      edFIOPodp3.Visible:=false;
    end;
    if nCountPodpis<2 then begin
      edDolgPodp2.Visible:=false;
      edFIOPodp2.Visible:=false;
    end;
  end;

  DokumentGES.AsString    := GlobalTask.ParamAsString('DEFAULT_GES');

  DokumentETAG.AsString := LicSchet.Fld('ETAG').AsString;
  DokumentETAGNOGO.AsString := LicSchet.Fld('KOL_ETAG').AsString;

  if LicSchet.Fld('MAT_STEN').AsString<>'' then begin
    if dmBase.SprMatSten.Locate('ID', LicSchet.Fld('MAT_STEN').AsString, []) then begin
      DokumentMATSTEN.AsString := ANSILowerCase(dmBase.SprMatSten.FieldByName('NAME').AsString);
    end;
  end;
  s:='';
  if LicSchet.Fld('VODOPROV').AsString='1'  then s := Inc_s + 'водопроводом';
  if LicSchet.Fld('KANALIZ').AsString='1'   then s := Inc_s + 'канализацией';
  if LicSchet.Fld('CENT_OTOP').AsString='1' then s := Inc_s + 'центральным отоплением';
  if LicSchet.Fld('GOR_VODA').AsString='1'  then s := Inc_s + 'горячим водоснабжением';
  if LicSchet.Fld('GAZ').AsString='1'       then s := Inc_s + 'газоснабжением';
  if LicSchet.Fld('PECH')<>nil then
    if LicSchet.Fld('PECH').AsString='1'    then s := Inc_s + 'печным отоплением';
  if LicSchet.Fld('PAROV')<>nil then
    if LicSchet.Fld('PAROV').AsString='1'   then s := Inc_s + 'паровым отоплением';

  {$IFDEF GKH}
    if LicSchet.Fld('LIFT').AsString='1'     then s := Inc_s + 'лифтом';
    if LicSchet.Fld('MUSOROPR').AsString='1' then s := Inc_s + 'мусопроводом';
  {$ENDIF}
  s := Inc_s + 'электроосвещением';
  if LicSchet.Fld('EL_PLIT').AsString='1'   then s := Inc_s + 'напольной электроплитой';
  DokumentOBORUDOV.Asstring := s;

//  slOwners:=TStringList.Create;
//  sOwners:=adr.GetOwners(slOwners,1);
//  slOwners.Free;

  DokumentNANIMAT.AsString := LicSchet.NanimOrOwners('TAIL'); // 'CRLF'
  DokumentSOBSTV.AsString  := LicSchet.ControlHouse;

  {
    if LicSchet.Fld('PRIVATE_SECT').AsBoolean then begin
      DokumentSOBSTV.AsString := adr.GetOwners(slOwners,1);
    end else begin
      if LicSchet.Fld('CONTROL').IsNull or (LicSchet.Fld('CONTROL').AsInteger=0) then begin
        s:=Globaltask.ParamAsString('CONTROL_HOUSE')
      end else begin
        s:=dmBase.SeekValueTable2(dmBase.SprWork, 'ID', LicSchet.Fld('CONTROL').AsString,'NAME');
      end;
      DokumentSOBSTV.AsString := sOwners;
    end;
   }

  DokumentPOMESH.AsString := LicSchet.Predst;


  if LicSchet.Fld('IZOL_KOMN').IsNull or LicSchet.Fld('IZOL_KOMN').AsBoolean
    then DokumentISOLIROV.AsString:='изолированных'
    else DokumentISOLIROV.AsString:='смежных';

  DokumentOBSHPLOSH.AsString := LicSchet.Fld('@PLOSH_ALL').AsString;
  DokumentPLOSHKOMN.AsString := LicSchet.Fld('@PLOSH_GIL').AsString;
  DokumentKOLVOKOMN.AsString := LicSchet.Fld('@KOL_KOMN').AsString;

//  'MAT_STEN'   VODOPROV KANALIZ CENT_OTOP GOR_VODA VANNA GAZ GID_GAZ EL_PLIT KOLODEC

//  if LicSchet.Fld('PLOSH_ZDAN').AsString=''
//    else DokumentOBSHPLOSH.AsString := LicSchet.Fld('PLOSH_ZDAN').AsString;

  if LicSchet.Fld('OTD_KUXNA').IsNull or LicSchet.Fld('OTD_KUXNA').AsBoolean
    then DokumentKUHN.AsString := 'отдельной'
    else DokumentKUHN.AsString := 'общей';

  DokumentUCHREG.AsString := Globaltask.GetLastValueAsString('KUDA_SPRAVKA');
  DokumentGES.AsString:=Globaltask.GetLastValueAsString('ORGAN_GES');
  DokumentNAME_GODR.AsString := Globaltask.GetLastValueAsString('NAME_GODR');
  if DokumentNAME_GODR.AsString=''
    then DokumentNAME_GODR.AsString:='Год рождения';
  DBGridEh1.FieldColumns['GODR'].Title.Caption:=DokumentNAME_GODR.AsString;

  m.First;
  n:=1;
  while not m.Eof do begin
    // наниматель
    if (m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString) and  (DokumentNANIMAT.AsString='') then begin
      DokumentNANIMAT.AsString := m.FIO;
    end;
    if AddMenToSprav(m, nID) then begin
      List.Append;
      ListNPP.AsInteger := n;
      //----------------------------------------------------------
      ListFIO.AsString := m.FIO;
      if FAddIN then begin
        if m.Fld('LICH_NOMER').AsString<>'' then begin
          ListFIO.AsString:=ListFIO.AsString+', '+m.Fld('LICH_NOMER').AsString;
        end;
      end;
      v:='';
      lRun:=false;
      RunFuncScript('SPR27',['FIO'],v,lRun);
      if v<>'' then begin
        ListFIO.AsString := v;
      end;
      //----------------------------------------------------------

      if m.Fld('DATEP').AsString<>''
        then ListDATAPROP.AsString:=m.DvigToStr(Chr(13)+Chr(10)); // FormatDateTime('dd.mm.yyyy',m.Fld('DATEP').AsDateTime);
      if m.Fld('DATER').AsString<>'' then begin
        if Pos('ГОД',ANSIUppercase(DokumentNAME_GODR.AsString))>0
          then ListGODR.AsString:=FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)
          else ListGODR.AsString:=FormatDateTime('dd.mm.yyyy',m.Fld('DATER').AsDateTime);
      end;
//      if lFirst then begin
//        if (m.Fld('OTNOSH').AsString<>'') then begin
//          if dmBase.SprOtnosh.Locate('ID', m.Fld('OTNOSH').AsString, []) then begin
//             ListRODSTVO.AsString :=  dmBase.SprOtnosh.FieldByName('NAME').AsString;
//          end;
//        end;
//      end else begin

//--------------------------------------------------------
// nIDKomu     - ID кому выдается справка
// sOtnoshKomu - КОД отношения к главе хоз-ва кому выдается справка
// nIDCur      - ID текущего человека
// sOthosh     - КОД отношения к главе хоз-ва для текущего человека

        ListRODSTVO.AsString:=GetOtnosh(nID,sOtn,m.Fld('ID_INTERNAL').AsInteger,m.Fld('OTNOSH').AsString,m.Fld('POL').AsString);

//        ListRODSTVO.AsString:=GetOtnosh(nID,sOtn,m.Fld('ID_INTERNAL').AsInteger,m.Fld('OTNOSH').AsString,m.Fld('POL').AsString);
//      end;
      List.Post;
      Inc(n,1);
    end;
    m.Next;
  end;
  List.First;
  m.First;
  while nID <> m.Fld('ID_INTERNAL').AsInteger do m.Next;

  Dokument.Post;

end;
//-------------------------------------------------------------------
procedure TfmPrintSSS.AddUbiv;
var
   m : TMens;
   adr : TAdresLic;
//   adr : TAdres;
   nID,n,nCountPodpis : Integer;
   s,sOtn : String;
   lFirst : Boolean;
   slOwners : TStringList;
   function Inc_s : String;  begin if s<>'' then result:=s+', ' else result:=''; end;
begin
  m := LicSchet.Mens;
  LicSchet.Adres.GetAdres;
  adr := LicSchet.Adres;
  nID := m.Fld('ID_INTERNAL').AsInteger;
  sOtn:= m.Fld('OTNOSH').AsString;
  if nID = LicSchet.Fld('FIRST').AsInteger
    then lFirst := true
    else lFirst := false;
  Dokument.Edit;

  DokumentSPR_DATE.AsDateTime:=Now;
  DokumentSPR_NOMER.AsString:='';

  FCurPadeg:=Globaltask.GetLastValueAsBoolean('PADEG_SSS');
  FAddIN:=Globaltask.GetLastValueAsBoolean('ADDIN_SSS');
  FAddRogd:=Globaltask.GetLastValueAsBoolean('ADDROGD_SSS');

  TBItemPadeg.Checked:=FCurPadeg;
  TBItemAddIN.Checked:=FAddIN;
  TBItemRogd.Checked:=FAddRogd;
  FPol:=ANSILowerCase(m.Fld('POL').AsString);

  FIN:=m.Fld('LICH_NOMER').AsString;
  FDateR:=m.Fld('DATER').AsDateTime;
  FFIO:=m.FIO;

  CreateStrDANA;

//  if m.Fld('DATER').AsString<>'' then
//    DokumentNAME.AsString := DokumentNAME.AsString+' , '+FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)+'г.р.';

  if m.Fld('DATEP').AsString<>'' then
    DokumentDATEPROP.AsString := m.DvigToStr(', '); // FormatdateTime('dd.mm.yyyy',m.Fld('DATEP').AsDateTime);
  s:=fmMain.NameRaion('');
  if s<>'' then s:=s+', ';
  DokumentADRES.AsString := s+adr.Punkt;
  DokumentULICA.AsString := adr.Ulica;
  DokumentDOM.AsString := adr.Dom;
  DokumentKORP.AsString := adr.Korp;
  DokumentKV.AsString := adr.Kv;

  nCountPodpis:=Podpis_Init(27);
  DokumentCOUNT_PODPIS.AsInteger:=nCountPodpis;

  List.Last;
  n:=ListNPP.AsInteger+1;
  m.First;
  while not m.Eof do begin
    // наниматель
    if (m.Fld('ID_INTERNAL').AsString=LicSchet.Fld('FIRST').AsString) and  (DokumentNANIMAT.AsString='') then begin
      //
    end;
    if m.Fld('CANDELETE').AsBoolean then begin
      List.Append;
      ListNPP.AsInteger := n;
      ListFIO.AsString := m.FIO;
      if FAddIN then begin
        if m.Fld('LICH_NOMER').AsString<>'' then begin
          ListFIO.AsString:=ListFIO.AsString+', '+m.Fld('LICH_NOMER').AsString;
        end;
      end;

      if m.Fld('DATEP').AsString<>''
        then ListDATAPROP.AsString:=m.DvigToStr(Chr(13)+Chr(10)); // FormatDateTime('dd.mm.yyyy',m.Fld('DATEP').AsDateTime);
      if m.Fld('DATER').AsString<>'' then begin
        if Pos('ГОД',ANSIUppercase(DokumentNAME_GODR.AsString))>0
          then ListGODR.AsString:=FormatDateTime('yyyy',m.Fld('DATER').AsDateTime)
          else ListGODR.AsString:=FormatDateTime('dd.mm.yyyy',m.Fld('DATER').AsDateTime);
      end;
      ListRODSTVO.AsString:=GetOtnosh(nID,sOtn,m.Fld('ID_INTERNAL').AsInteger,m.Fld('OTNOSH').AsString,m.Fld('POL').AsString);
      List.Post;
      Inc(n,1);
    end;
    m.Next;
  end;
  List.First;
  m.First;
  while nID <> m.Fld('ID_INTERNAL').AsInteger do m.Next;
end;

procedure TfmPrintSSS.FormDestroy(Sender: TObject);
begin
  if Dokument.Active then Dokument.CheckBrowseMode;
  if List.Active then List.CheckBrowseMode;
  Globaltask.SetLastValueAsString('KUDA_SPRAVKA',DokumentUCHREG.AsString);
  Globaltask.SetLastValueAsString('ORGAN_GES',DokumentGES.AsString);
  Globaltask.SetLastValueAsBoolean('PADEG_SSS',TBItemPadeg.Checked);
  Globaltask.SetLastValueAsBoolean('ADDIN_SSS',TBItemAddIN.Checked);
  Globaltask.SetLastValueAsBoolean('ADDROGD_SSS',TBItemRogd.Checked);
  Globaltask.SetLastValueAsString('NAME_GODR',DokumentNAME_GODR.AsString);
  inherited;
end;

procedure TfmPrintSSS.btAddChildClick(Sender: TObject);
begin
  List.Append;
end;

procedure TfmPrintSSS.btDelChildClick(Sender: TObject);
begin
  if List.RecordCount>0 then begin
    List.Delete;
  end;
end;

//---------------------------------------------------------------------------------------------
procedure TfmPrintSSS.DBEditEh20EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  Opis : TOpisEdit;
  arrRec:TCurrentRecord;
  v:Variant;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_PERSONAL');
  if Opis<>nil then begin
    v:=null;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      EditDataSet(Dokument);
      DokumentFIO_PODP1.AsString:=GetValueField(arrRec, 'FIO');
      DokumentDOLG_PODP1.AsString:=GetValueField(arrRec, 'POST');
      PostDataSet(Dokument);
    end;
  end;
end;

//---------------------------------------------------------------------------------------------
procedure TfmPrintSSS.edFIOPodp2EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  Opis : TOpisEdit;
  arrRec:TCurrentRecord;
  v:Variant;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_PERSONAL');
  if Opis<>nil then begin
    v:=null;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      EditDataSet(Dokument);
      DokumentFIO_PODP2.AsString:=GetValueField(arrRec, 'FIO');
      DokumentDOLG_PODP2.AsString:=GetValueField(arrRec, 'POST');
      PostDataSet(Dokument);
    end;
  end;
end;

//---------------------------------------------------------------------------------------------
procedure TfmPrintSSS.edFIOPodp3EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  Opis : TOpisEdit;
  arrRec:TCurrentRecord;
  v:Variant;
begin
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_PERSONAL');
  if Opis<>nil then begin
    v:=null;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      EditDataSet(Dokument);
      DokumentFIO_PODP3.AsString:=GetValueField(arrRec, 'FIO');
      DokumentDOLG_PODP3.AsString:=GetValueField(arrRec, 'POST');
      PostDataSet(Dokument);
    end;
  end;
end;

//---------------------------------------------------------------------------------------------
procedure TfmPrintSSS.DBGridEh1TitleBtnClick(Sender: TObject;  ACol: Integer; Column: TColumnEh);
var
  s:String;
begin
  if Column.FieldName='GODR' then begin
    s:=DokumentNAME_GODR.AsString;
    InputQuery('','Новое название графы:',s);
    if s<>DokumentNAME_GODR.AsString then begin
      EditDataSet(Dokument);
      DokumentNAME_GODR.AsString:=s;
      DBGridEh1.FieldColumns['GODR'].Title.Caption:=DokumentNAME_GODR.AsString;
      PostDataSet(Dokument);
    end;
  end;
end;

//--------------------------------------------------------------------------
procedure TfmPrintSSS.TBItemPadegClick(Sender: TObject);
begin
  TBItemPadeg.Checked:=not TBItemPadeg.Checked;
  FCurPadeg:=TBItemPadeg.Checked;
  CreateStrDana;
end;

procedure TfmPrintSSS.TBItemPrintShampClick(Sender: TObject);
begin
  TBItemPrintShamp.Checked:=not TBItemPrintShamp.Checked;
  if TBItemPrintShamp.Checked
    then Globaltask.SetLastValueAsString('PRINT_STAMP','1')
    else Globaltask.SetLastValueAsString('PRINT_STAMP','0');
end;

procedure TfmPrintSSS.TBItemAddINClick(Sender: TObject);
begin
  TBItemAddIN.Checked:=not TBItemAddIN.Checked;
  FAddIn:=TBItemAddIN.Checked;
  CreateStrDana;
end;

procedure TfmPrintSSS.TBItemRogdClick(Sender: TObject);
begin
  TBItemRogd.Checked:=not TBItemRogd.Checked;
  FAddRogd:=TBItemRogd.Checked;
  CreateStrDana;
end;

procedure TfmPrintSSS.CreateStrDANA;
var
  sDana:String;
begin
  if FCurPadeg then begin
    sDana:=GetPadegFIO(FFIO,FPol,'Д');
  end else begin
    sDana:=FFIO;
  end;
  if FAddRogd then begin
    if FDateR>0 then begin
      sDana:=sDana+', '+IntToStr(YearOf(FDateR))+'г.р.';
    end;
  end;
  if FAddIN then begin
    if FIN<>'' then begin
      sDana:=sDana+', '+FIN;
    end;
  end;
  EditDataSet(Dokument);
  DokumentNAME.AsString:=sDana;
end;


end.
