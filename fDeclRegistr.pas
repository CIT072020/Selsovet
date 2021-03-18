unit fDeclRegistr;

interface

{$I Task.inc}
{$include ver.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  {$IFDEF LEVEL6} Variants, {$ENDIF}
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uTypes,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc, dMen, ifpii_dbfunc,
  OpisEdit, MetaTask, Grids, DBGridEh, Buttons, vchDBCtrls, FR_DSet, uCheckKod, uProject,uProjectAll,
  FR_DBSet, ToolCtrlsEh, ImgList, fMenShort, kbmMemCSVStreamFormat,
  ZipForge;

type
  TfmDeclRegistr = class(TfmSimpleD)
    dsStran: TDataSource;
    dsSem: TDataSource;
    tbSem: TkbmMemTable;
    tbSemNAME: TStringField;
    DokumentNOMER: TIntegerField;
    DokumentDATEZ: TDateField;
    DokumentFamilia: TStringField;
    DokumentName: TStringField;
    DokumentOtch: TStringField;
    DokumentDateR: TDateField;
    DokumentPOL: TStringField;
    DokumentADRES_ID: TIntegerField;
    DokumentADRES_NAME: TMemoField;
    DokumentSOATO_O: TStringField;
    DokumentGOSUD_O: TIntegerField;
    DokumentOBL_O: TStringField;
    DokumentRAION_O: TStringField;
    DokumentGOROD_O: TStringField;
    DokumentDATE_O: TDateField;
    DokumentLICH_NOMER: TStringField;
    DokumentPASP_SERIA: TStringField;
    DokumentPASP_NOMER: TStringField;
    DokumentPASP_DATE: TDateField;
    DokumentRUKOV: TStringField;
    DokumentMEN_ID: TIntegerField;
    tbSemPOL: TStringField;
    tbSemDATER: TDateField;
    tbSemOTCH: TStringField;
    DokumentPASP_VIDAN: TStringField;
    tbSemFAMILIA: TStringField;
    DokumentDATE_SROK: TDateField;
    DokumentPASP_UDOST: TSmallintField;
    TBItemPrib: TTBItem;
    DokumentB_OBL_O: TBooleanField;
    DokumentGOROD_O_B: TIntegerField;
    tbSemOTNOSH: TIntegerField;
    tbSemSobst: TkbmMemTable;
    tbSemSobstFAMILIA: TStringField;
    tbSemSobstNAME: TStringField;
    tbSemSobstOTCH: TStringField;
    tbSemSobstPOL: TStringField;
    tbSemSobstDATER: TDateField;
    tbSemSobstOTNOSH: TIntegerField;
    dsSemSobst: TDataSource;
    DokumentKOLVO: TSmallintField;
    DokumentTYPEREG: TSmallintField;
    DokumentFIO_SOBST: TStringField;
    DokumentORGAN: TStringField;
    DokumentORGAN_ID: TIntegerField;
    DokumentLICH_ID: TIntegerField;
    DokumentRUKOV_DOLG: TStringField;
    PanelMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    TextAdres: TvchDBText;
    Label26: TLabel;
    Label5: TLabel;
    edName: TDBEditEh;
    edOtch: TDBEditEh;
    edPol: TDBComboBoxEh;
    edDateR: TDBDateTimeEditEh;
    btAdres: TBitBtn;
    edKolvo: TDBNumberEditEh;
    edFamilia: TDBEditEh;
    edDateSrok: TDBDateTimeEditEh;
    edUdost: TDBComboBoxEh;
    gbPasp: TGroupBox;
    Label8: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    edLichNomer: TDBEditEh;
    edPasp_Seria: TDBEditEh;
    edPasp_Nomer: TDBEditEh;
    edPasp_Date: TDBDateTimeEditEh;
    edPasp_Organ: TDBEditEh;
    gbPribil: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edGOSUD_O: TDBLookupComboboxEh;
    edGOROD_O: TDBEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    edGOROD_O_B: TDBLookupComboboxEh;
    gbSem: TGroupBox;
    GridSem: TDBGridEh;
    Panel2: TPanel;
    btAddSem: TBitBtn;
    btDelSem: TBitBtn;
    btEditSem: TBitBtn;
    pnFIOSobstv: TPanel;
    Label7: TLabel;
    edFIOSobstv: TDBEditEh;
    gbSemSobst: TGroupBox;
    GridSemSobst: TDBGridEh;
    Panel1: TPanel;
    btAddS: TBitBtn;
    btDelS: TBitBtn;
    btEditS: TBitBtn;
    pnPodval: TPanel;
    Label41: TLabel;
    edDolgRukov: TDBEditEh;
    edRukov: TDBEditEh;
    Label38: TLabel;
    edDateZ: TDBDateTimeEditEh;
    Label35: TLabel;
    edOrgan: TDBEditEh;
    BtRB: TImage;
    btRF: TImage;
    btU: TImage;
    edSrok: TDBEditEh;
    DokumentSROK: TStringField;
    Label9: TLabel;
    edOsnov: TDBEditEh;
    DokumentOSNOV: TMemoField;
    DokumentKOLVO_PROG: TSmallintField;
    DokumentKOLVO_DETI: TSmallintField;
    Label10: TLabel;
    Label11: TLabel;
    edKolvoProg: TDBNumberEditEh;
    Label12: TLabel;
    edKolvoDeti: TDBNumberEditEh;
    DokumentOSNOV_DATE: TDateField;
    Label18: TLabel;
    edDate_Osnov: TDBDateTimeEditEh;
    TBItemUbit: TTBItem;
    edOBL_O: TDBEditEh;
    edRAION_O: TDBEditEh;
    DokumentOSNOV_ID: TIntegerField;
    edOSNOV_ID: TDBComboBoxEh;
    edTypeReg: TDBComboBoxEh;
    DokumentNOMER_SEM: TSmallintField;
    N_F_edNomerSem: TDBCheckBoxEh;
    DokumentDATE_SROK_DN: TDateField;            
    Label47: TLabel;
    edDateSrokDog: TDBDateTimeEditEh;
    DokumentOSNOV_NOMER: TStringField;
    Label48: TLabel;
    edNomer_Osnov: TDBEditEh;
    Label16: TLabel;
    edUlDom_O: TDBEditEh;
    DokumentUL_O: TStringField;
    DokumentADD_PRIB: TMemoField;
    edAddPrib: TDBEditEh;
    edPloshAll: TDBEditEh;
    DokumentTAIL_HOUSE: TStringField;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure TextAdresGetText(Sender: TObject; var Text: String);
    procedure btAdresClick(Sender: TObject);
    procedure edFamiliaEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure btAddSClick(Sender: TObject);
    procedure btDelSClick(Sender: TObject);
    procedure dsSemDataChange(Sender: TObject; Field: TField);
    procedure TBItemPribClick(Sender: TObject);
    procedure edRAION_RNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edOBL_RNotInList(Sender: TObject; NewText: String;   var RecheckInList: Boolean);
    procedure edPasp_OrganEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure edLichNomerUpdateData(Sender: TObject; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edUdostEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure btEditSClick(Sender: TObject);
    procedure edOrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure btAddSemClick(Sender: TObject);
    procedure btEditSemClick(Sender: TObject);
    procedure btDelSemClick(Sender: TObject);
    procedure edRukovEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure GridSemColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure edOsnovEditButtons0Click(Sender: TObject;    var Handled: Boolean);
    procedure TBItemUbitClick(Sender: TObject);
    procedure edTypeRegUpdateData(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
//    FBitRB : TBitMap;
  public
    { Public declarations }
    itCheckA4:TTbItem;
    FIDLastTalonPrib:Integer;
    FCurLic : Integer;
    FFromMen:Boolean;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
//    function GetNameReport : String; override;
    procedure UpdateActions; override;
    function BeforeEdit: Boolean; override;
    constructor Create(Owner : TComponent); override;
    procedure ReadSem( strSem : String);

    procedure SetRB_OnClick(Sender: TObject;  var Handled: Boolean);
    procedure SetRF_OnClick(Sender: TObject;  var Handled: Boolean);
    procedure SetU_OnClick(Sender: TObject;  var Handled: Boolean);
    function ProvDvig : Boolean;
    function AddLicTP : Boolean;
    function CreateSubMenuRun: Boolean; override;
    procedure Event_CheckA4(Sender:TObject);
  end;

var
  fmDeclRegistr: TfmDeclRegistr;

implementation

uses dBase, fChoiceAdres, fMain, fAddLic, fChoiceNasel, fShablon, fTalonPrib, fTalonUbit;

{$R *.DFM}

constructor TfmDeclRegistr.Create(Owner: TComponent);
var
  bt  : TEditButtonEh;
begin
  inherited;
  TBItemUbit.Enabled:=false;
  FIDLastTalonPrib:=0;
  FMainTable := dmBase.DeclareRegistr;
  dmBase.SetDateFormat(tbSem);
  dmBase.SetDateFormat(tbSemSobst);
  tbSem.Open;
  tbSemSobst.Open;
//  pc.ActivePageIndex:=0;
  FPageControl := nil; //pc;
  FFromMen:=False;
  FCurLic:=0;
  edFamilia.OnUpdateData:=FIOUpdateData;
  edName.OnUpdateData:=FIOUpdateData;
  edOtch.OnUpdateData:=FIOUpdateData;

  fmMain.ImageList.GetBitmap(IL_EDIT,btEditSem.Glyph);
  fmMain.ImageList.GetBitmap(IL_ADD_MEN,btAddSem.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_MEN,btDelSem.Glyph);

  fmMain.ImageList.GetBitmap(IL_EDIT,btEditS.Glyph);
  fmMain.ImageList.GetBitmap(IL_ADD_MEN,btAddS.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_MEN,btDelS.Glyph);


  bt := edGOSUD_O.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetRB_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtRB.Picture.Bitmap;

  bt := edGOSUD_O.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetRF_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtRF.Picture.Bitmap;

  bt := edGOSUD_O.EditButtons.Add;
  bt.Visible := true;
  bt.OnClick := SetU_OnClick;
  bt.Visible := true;
  bt.Style   := ebsGlyphEh;
  bt.Glyph   := BtU.Picture.Bitmap;

  SetLength(FArrChoiceRekv,1);

  FArrChoiceRekv[0].nType:=SHABLON_OSNOV_PRED;
  FArrChoiceRekv[0].FieldName:='OSNOV';

  itCheckA4.Checked:=GlobalTask.GetLastValueAsBoolean('DECL_REG_A4');;

end;

function TfmDeclRegistr.GetVid: String;
begin
  Result := 'DeclRegistr';
end;

function TfmDeclRegistr.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger:=-1;
  DokumentPOL.AsString:='М';
  DokumentTYPEREG.AsInteger:=1;
  DokumentNOMER_SEM.AsInteger:=0;
  DokumentOSNOV_ID.AsInteger := DOGOVOR_NAIMA;

  tbSem.EmptyTable;
  tbSemSobst.EmptyTable;
  inherited NewDok(lAppend);
  DokumentRUKOV_DOLG.AsString:=Globaltask.getLastValueAsString('DECLREGISTR_DOLG');
  DokumentRUKOV.AsString:=Globaltask.getLastValueAsString('DECLREGISTR_RUKOV');
  if (DokumentRUKOV_DOLG.AsString='')  then begin
    DokumentRUKOV_DOLG.AsString:=DolgRukov;
    DokumentRUKOV.AsString:=FIORukov;
  end;
  QueryExit:=false;
  Result := true;
end;

function TfmDeclRegistr.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
begin
  NewDok(false);
  Result := true;
  if not dmBase.DeclareRegistr.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to dmBase.DeclareRegistr.FieldCount-1 do begin
    strField := dmBase.DeclareRegistr.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      fld.Value := dmBase.DeclareRegistr.Fields[i].Value;
    end;
  end;
  DokumentNAME_ZAGS.AsString:=dmBase.DeclareRegistr.FieldByName('ORGAN').AsString;
  if DokumentNOMER_SEM.IsNull then DokumentNOMER_SEM.AsInteger:=0;

  if (DokumentTAIL_HOUSE.AsString='') then begin
    fld := dmBase.DeclareRegistr.FindField('PLOSH_ALL');
    if fld<>nil then begin
      DokumentTAIL_HOUSE.AsString:=fld.AsString;
    end;
  end;

//  if DokumentSIMPLE_PRIB.IsNull then DokumentSIMPLE_PRIB.AsBoolean:=false;

  //  if DokumentPROV.IsNull then DokumentPROV.AsBoolean:=true;
  if DokumentPASP_UDOST.IsNull then DokumentPASP_UDOST.AsInteger:=1;

  ReadSem(dmBase.DeclareRegistr.FieldByName('SEM').AsString);

  Dokument.Post;
  if DokumentID.AsInteger > 0 then begin

  end;
end;

//---------------------------------------------------------------
function TfmDeclRegistr.AddLicTP: Boolean;
begin
  Result:=false;
end;

// прочитать список семьи и список собственников
procedure TfmDeclRegistr.ReadSem( strSem : String);
var
  i,j: Integer;
  arr,arrR: TArrStrings;
  s:String;
  ds:TDataSet;
begin
  StrToArr(strSem, arr, Chr(13), true);
  tbSem.EmptyTable;
  tbSemSobst.EmptyTable;
  for i:=Low(arr) to High(arr) do begin
    s:=arr[i];
    CharDel(s,'"');
    StrToArr(s, arrR, ',', false);
    SetLength(arrR,7);
    try
      if arrR[0]='1' then begin
        with tbSem do begin
          Append;
          FieldByName('FAMILIA').AsString:= arrR[1];
          FieldByName('NAME').AsString   := arrR[2];
          FieldByName('OTCH').AsString   := arrR[3];
          FieldByName('DATER').AsDateTime:= STOD(arrR[4],tdClipper);
          FieldByName('OTNOSH').AsString := arrR[5];
          FieldByName('POL').AsString    := arrR[6];
          Post;
        end;
      end else begin
        with tbSemSobst do begin
          Append;
          FieldByName('FAMILIA').AsString   := arrR[1];
          FieldByName('NAME').AsString   := arrR[2];
          FieldByName('OTCH').AsString   := arrR[3];
          FieldByName('DATER').AsDateTime:= STOD(arrR[4],tdClipper);
          FieldByName('OTNOSH').AsString := arrR[5];
          Post;
        end;
      end;
    except
      PutError('Ошибка чтения списка: "'+s+'"');
    end;
  end;
end;

//---------------------------------------------------------------
function TfmDeclRegistr.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr : String;
  vKeyValues : Variant;
  sList,strRec:string;
  sBook1,sBook2:String;
begin
  AdditiveBeforeWriteDok;
  PostDataSet(Dokument);
  PostDataSet(tbSem);
  PostDataSet(tbSemSobst);
  sBook1:=tbSem.Bookmark;
  sBook2:=tbSemSobst.Bookmark;
  tbSem.DisableControls;
  tbSemSobst.DisableControls;

  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
  if DokumentADRES_ID.AsString='' then begin
    strErr := ' Заполните адрес регистрации. ';
  end else if (DokumentTypeReg.AsInteger=MESTO_GIT) and not DokumentDATE_SROK.IsNull then begin
    strErr := ' Срок регистрации должен быть пуст. ';
  end else if DokumentDATEZ.AsString='' then begin
    strErr := ' Заполните дату заявления. ';
  end else if (DokumentFAMILIA.AsString='') or (DokumentNAME.AsString='') then begin
    strErr := ' Заполните Фамилия, Имя. ';
  end;
  if strErr<>'' then begin
    PutError(strErr);
    Result := false;
    tbSem.EnableControls;
    tbSemSobst.EnableControls;
    exit;
  end;
  //-------------------------------------------------------
  // пропускаем поле ID
  if DokumentID.AsInteger = -1 then  begin
    dmBase.DeclareRegistr.Append;
    dmBase.DeclareRegistr.Post;
    nID := dmBase.DeclareRegistr.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not dmBase.DeclareRegistr.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    EditDataSet(Dokument);
    DokumentID.AsInteger := nID;
    if DokumentTypeReg.AsInteger=MESTO_GIT then begin
      DokumentDATE_SROK.AsString:='';
    end;
    Dokument.Post;
    dmBase.DeclareRegistr.Edit;
    for i:=1 to dmBase.DeclareRegistr.FieldCount-1 do begin
      strField := dmBase.DeclareRegistr.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        dmBase.DeclareRegistr.Fields[i].Value := fld.Value;
      end;
    end;
    if DokumentADRES_ID.AsString<>''
      then dmBase.DeclareRegistr.FieldByName('ADRES_NAME').AsString:=dmBase.AdresFromID( dmBase.GetDateCurrentSost, DokumentADRES_ID.AsString)
      else dmBase.DeclareRegistr.FieldByName('ADRES_NAME').AsString:='';
    if DokumentTYPEREG.AsString=''
      then dmBase.DeclareRegistr.FieldByName('TYPEREG').AsInteger:=MESTO_GIT;
{
    if (not DokumentDATE_SROK.IsNull) or (DokumentSROK.AsString<>'') then begin
      dmBase.DeclareRegistr.FieldByName('TYPEREG').AsInteger:=MESTO_PREB;
    end else begin
      dmBase.DeclareRegistr.FieldByName('TYPEREG').AsInteger:=MESTO_GIT;
    end;
}
    dmBase.DeclareRegistr.Post;

    AdditiveWriteDok;

    tbSem.First;
    tbSemSobst.First;

    //-----------------------------------------------
    sList := '';
    while not tbSem.Eof do begin
      Inc(i,1);
      strRec := '"1",'+
                '"'+tbSemFAMILIA.AsString+'",'+
                '"'+tbSemNAME.AsString+'",'+
                '"'+tbSemOTCH.AsString+'",'+
                '"'+DTOS(tbSemDATER.AsDateTime,tdClipper)+'",'+
                '"'+tbSemOTNOSH.AsString+'",'+
                '"'+tbSemPOL.AsString+'"'+Chr(13);
      sList := sList + strRec;
      tbSem.Next;
    end;
    while not tbSemSobst.Eof do begin
      Inc(i,1);
      strRec := '"2",'+
                '"'+tbSemSobstFAMILIA.AsString+'",'+
                '"'+tbSemSobstNAME.AsString+'",'+
                '"'+tbSemSobstOTCH.AsString+'",'+
                '"'+DTOS(tbSemSobstDATER.AsDateTime,tdClipper)+'",'+
                '"'+tbSemSobstOTNOSH.AsString+'"'+Chr(13);
      sList := sList + strRec;
      tbSemSobst.Next;
    end;

    dmBase.DeclareRegistr.Edit;
    dmBase.DeclareRegistr.FieldByName('SEM').AsString := sList;
    dmBase.DeclareRegistr.Post;

    tbSem.Bookmark:=sBook1;
    tbSemSobst.Bookmark:=sBook2;
    tbSem.EnableControls;
    tbSemSobst.EnableControls;

    Globaltask.SetLastValueAsString('DECLREGISTR_DOLG',DokumentRUKOV_DOLG.AsString);
    Globaltask.SetLastValueAsString('DECLREGISTR_RUKOV',DokumentRUKOV.AsString);

    if Result then QueryExit:=false;
  end;
end;

procedure TfmDeclRegistr.UpdateActions;
begin
  edDateSrok.Enabled:=DokumentTYPEREG.AsInteger=MESTO_PREB;
end;

procedure TfmDeclRegistr.dsDokumentDataChange(Sender: TObject;  Field: TField);
begin
  inherited;
  if Field <> nil then begin
  end;
end;

procedure TfmDeclRegistr.TextAdresGetText(Sender: TObject; var Text: String);
var
  vKeyValues : Variant;
begin
  if DokumentADRES_ID.AsString<>'' then begin
    Text := dmBase.AdresFromID( dmBase.GetDateCurrentSost, DokumentADRES_ID.AsString );
    if DokumentLICH_ID.AsString<>'' then begin
      vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, DokumentLICH_ID.AsInteger);
      if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
        Text := 'Лиц.счет '+Trim(dmBase.tbLich.FieldByName('NOMER').AsString)+' : '+Text;
      end;
    end;
  end;
end;

procedure TfmDeclRegistr.btAdresClick(Sender: TObject);
var
  ds:TDataset;
  sID,s:String;
  nVozr:Integer;
  slPar:TstringList;
begin
  if fmChoiceAdres= nil then begin
    fmChoiceAdres := TfmChoiceAdres.Create(nil);
  end;
  fmChoiceAdres.DateFiks := dmBase.GetDateCurrentSost;
  fmChoiceAdres.ChoiceLich := true;
  if fmChoiceAdres.ShowModal = mrOk then begin
    EditDataSet(Dokument);
    DokumentADRES_ID.AsInteger := fmChoiceAdres.IDAdres;
    DokumentLICH_ID.AsInteger := fmChoiceAdres.IDLich;
    if fmChoiceAdres.IDLich > 0 then begin
//          dmBase.WriteValueProp('PLOSH_ALL',mtDokumentPLOSH_ALL.AsFloat,DateFiks,nIDAdresMen,dmbase.TypeObj_Adres,ftFloat);
      s:=dmBase.ReadPropAsString(fmMain.DateFiks, DokumentLICH_ID.AsInteger, 'TAIL_HOUSE');
      if s=''
        then DokumentTAIL_HOUSE.AsString:=dmBase.ReadPropAsString(fmMain.DateFiks, DokumentADRES_ID.AsInteger, 'PLOSH_ALL')
        else DokumentTAIL_HOUSE.AsString:=s;

      slPar:=TStringList.Create;
      slPar.Add('VOZR=0-15');
      DokumentKOLVO_PROG.AsInteger:=dmBase.CountMensAdres(fmMain.DateFiks, DokumentADRES_ID.AsString,'00',nil);
      if DokumentKOLVO_PROG.AsInteger=0 then DokumentKOLVO_PROG.AsString:='';
      DokumentKOLVO_DETI.AsInteger:=dmBase.CountMensAdres(fmMain.DateFiks, DokumentADRES_ID.AsString,'00',slPar);
      if DokumentKOLVO_DETI.AsInteger=0 then DokumentKOLVO_DETI.AsString:='';

      slPar.Free;
      ds:=dmBase.GetLichSchet(dmBase.GetDateCurrentSost, DokumentLICH_ID.AsString);
      sID:=ds.FieldByName('FIRST').AsString;
      DokumentFIO_SOBST.Asstring:=dmBase.FIOMen(dmBase.GetDateCurrentSost,sID);

      //----  соберем совершеннолетних членов семьи хозяина счета -----------------
      tbSemSobst.EmptyTable;
      dmBase.tbMens.CancelRange;
      dmBase.tbMens.IndexName := 'LIC_KEY';
      try
        dmBase.tbMens.SetRange([dmBase.GetDateCurrentSost,DokumentLICH_ID.AsString],[dmBase.GetDateCurrentSost,DokumentLICH_ID.AsString]);
        while not dmBase.tbMens.Eof do begin
          if ( dmBase.tbMens.FieldByName('CANDELETE').IsNull or not dmBase.tbMens.FieldByName('CANDELETE').AsBoolean) then begin
            // совершеннолетние и зарегистрированные члены семьи
            nVozr:=GetCountYearEx(dmBase.GetCurDate, dmBase.tbMens.FieldByName('DATER'),99);
            if (nVozr>=16) and dmBase.tbMens.FieldByName('PROPIS').AsBoolean and (dmBase.tbMens.FieldByName('ID').AsString<>sID) then begin
              tbSemSobst.Append;
              tbSemSobstFAMILIA.AsString:=dmBase.tbMens.FieldByName('FAMILIA').AsString;
              tbSemSobstNAME.AsString:=dmBase.tbMens.FieldByName('NAME').AsString;
              tbSemSobstOTCH.AsString:=dmBase.tbMens.FieldByName('OTCH').AsString;
              tbSemSobstPOL.AsString:=dmBase.tbMens.FieldByName('POL').AsString;
              tbSemSobstOTNOSH.AsString:=dmBase.tbMens.FieldByName('OTNOSH').AsString;
              WriteDateField(tbSemSobstDATER,dmBase.tbMens.FieldByName('DATER'));
              tbSemSobst.Post;
            end;
          end;
          dmBase.tbMens.Next;
        end;
      finally
        dmBase.tbMens.CancelRange;
      end;
      //----------------------------------------------------------------------------
    end else begin
      DokumentLICH_ID.AsString  := '';
    end;

//    dmBase.HouseOwners2(dmBase.GetDateCurrentSost,DokumentADRES_ID.AsString,1,tbSemSobst);

    PostDataSet(Dokument);
  end;
end;

function TfmDeclRegistr.BeforeEdit: Boolean;
var
  n:Integer;
begin
  Result := inherited BeforeEdit;
// в методе Create отключена проверка FCheckLookupField:=false
  n:=LimitMRUList(3);
  SetMRUList(edGOROD_O,n,3,true,false,false,FAddButtonMRUList_Punkt);

  n:=LimitMRUList(1);
  SetMRUList(edOBL_O,n,1,true,false,false,FAddButtonMRUList);

  n:=LimitMRUList(2);
  SetMRUList(edRAION_O,n,2,true,false,false,FAddButtonMRUList);

end;

procedure TfmDeclRegistr.edFamiliaEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  nID,nVozr : Integer;
  adr : TAdres;
  old : TCursor;
  p : TPassport;
  strName,s,sID : String;
  ListDeti:TDataSet;
//  slPar:TStringList;
  ds:TDataSet;
begin
  if ChoiceMen( TControl(Sender), Trim(edFamilia.Text), '', arrRec) then begin
      old := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      EditDataSet(Dokument);
      DokumentMEN_ID.AsInteger:=GetValueField(arrRec, 'ID');
      nID:=DokumentMEN_ID.AsInteger;
      v := GetValueField(arrRec, 'FAMILIA');
      if v = null then DokumentFAMILIA.AsString := ''
                  else DokumentFAMILIA.AsString := v;
      v := GetValueField(arrRec, 'NAME');
      if v = null then DokumentNAME.AsString := ''
                  else DokumentNAME.AsString := v;
      v := GetValueField(arrRec, 'OTCH');
      if v = null then DokumentOTCH.AsString := ''
                  else DokumentOTCH.AsString := v;
      v := GetValueField(arrRec, 'DATER');
      if v = null then DokumentDateR.AsString := ''
                  else DokumentDateR.Value    := v;
      v := GetValueField(arrRec, 'POL');
      if v <> null then DokumentPOL.Value := v;

      p := dmBase.GetRecPasport(nID, arrRec);
      if p.Nomer <> '' then begin
        DokumentPASP_UDOST.AsInteger := p.UdostKod;
        DokumentPASP_SERIA.AsString := p.Seria;
        DokumentPASP_NOMER.AsString := p.Nomer;
        DokumentPASP_VIDAN.AsString := p.Organ;
        DokumentLICH_NOMER.AsString := p.LichNomer;
        DokumentPASP_DATE.AsDateTime := p.Date;
      end;
      adr := dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), strName);
      DokumentADRES_ID.AsInteger := adr.AdresID;
      DokumentLICH_ID.AsInteger  := adr.LicID;
      //------ запишем место рождения человека ------------
      with dmBase.tbMensAdd do begin
        if Locate('ID', DokumentMEN_ID.AsInteger, []) then begin
          WriteField( DokumentGOSUD_O   , FieldByName('OP_GOSUD')  ); //   , lErr);
          WriteField( DokumentB_OBL_O   , FieldByName('OP_B_OBL')  ); //   , lErr);
          WriteField( DokumentOBL_O     , FieldByName('OP_OBL')    ); //     , lErr);
          WriteField( DokumentRAION_O   , FieldByName('OP_RAION')  ); //   , lErr);
          WriteField( DokumentGOROD_O_B , FieldByName('OP_B_GOROD')); // , lErr);
          WriteField( DokumentGOROD_O   , FieldByName('OP_GOROD')  ); //   , lErr);
        end;
      end;
      //------------------------------------------------------


      s:=dmBase.ReadPropAsString(fmMain.DateFiks, DokumentLICH_ID.AsInteger, 'TAIL_HOUSE');
      if s=''
        then DokumentTAIL_HOUSE.AsString:=dmBase.ReadPropAsString(fmMain.DateFiks, DokumentADRES_ID.AsInteger, 'PLOSH_ALL')
        else DokumentTAIL_HOUSE.AsString:=s;

//      slPar:=TStringList.Create;
//      slPar.Add('VOZR=0-15');
      DokumentKOLVO_PROG.AsInteger:=dmBase.CountMensAdres(fmMain.DateFiks, DokumentADRES_ID.AsString,'000',nil);
      if DokumentKOLVO_PROG.AsInteger=0 then DokumentKOLVO_PROG.AsString:='';
      DokumentKOLVO_DETI.AsInteger:=dmBase.CountMensAdres(fmMain.DateFiks, DokumentADRES_ID.AsString,'000;0#15',nil);  // от 0 до 15 лет
      if DokumentKOLVO_DETI.AsInteger=0 then DokumentKOLVO_DETI.AsString:='';

//      slPar.Free;
      ds:=dmBase.GetLichSchet(dmBase.GetDateCurrentSost, DokumentLICH_ID.AsString);
      if ds<>nil then begin
        sID:=ds.FieldByName('FIRST').AsString;
        DokumentFIO_SOBST.Asstring:=dmBase.FIOMen(dmBase.GetDateCurrentSost,sID);
        {
        DokumentOSNOV.AsString:=dmBase.ReadOneProp(fmMain.DateFiks, DokumentLICH_ID.AsInteger, 'DOGOVOR', ftMemo);
        DokumentOSNOV_ID.AsInteger:=ds.FieldByName('OSNOV_ID').AsInteger;
        WriteDateField( DokumentOSNOV_DATE, ds.FieldByName('OSNOV_DATE'));
        DokumentOSNOV_NOMER.AsString:=ds.FieldByName('OSNOV_NOMER').AsString;
        }
      end;
      //----  соберем совершеннолетних членов семьи хозяина счета -----------------
      tbSemSobst.EmptyTable;
      dmBase.tbMens.CancelRange;
      dmBase.tbMens.IndexName := 'LIC_KEY';
      try
        dmBase.tbMens.SetRange([dmBase.GetDateCurrentSost,DokumentLICH_ID.AsString],[dmBase.GetDateCurrentSost,DokumentLICH_ID.AsString]);
        while not dmBase.tbMens.Eof do begin
          if ( dmBase.tbMens.FieldByName('CANDELETE').IsNull or not dmBase.tbMens.FieldByName('CANDELETE').AsBoolean) then begin
            // совершеннолетние и зарегистрированные члены семьи
            nVozr:=GetCountYearEx(dmBase.GetCurDate, dmBase.tbMens.FieldByName('DATER'),99);
            if (nVozr>=16) and dmBase.tbMens.FieldByName('PROPIS').AsBoolean and (dmBase.tbMens.FieldByName('ID').AsString<>sID) then begin
              tbSemSobst.Append;
              tbSemSobstFAMILIA.AsString:=dmBase.tbMens.FieldByName('FAMILIA').AsString;
              tbSemSobstNAME.AsString:=dmBase.tbMens.FieldByName('NAME').AsString;
              tbSemSobstOTCH.AsString:=dmBase.tbMens.FieldByName('OTCH').AsString;
              tbSemSobstPOL.AsString:=dmBase.tbMens.FieldByName('POL').AsString;
              tbSemSobstOTNOSH.AsString:=dmBase.tbMens.FieldByName('OTNOSH').AsString;
              WriteDateField(tbSemSobstDATER,dmBase.tbMens.FieldByName('DATER'));
              tbSemSobst.Post;
            end;
          end;
          dmBase.tbMens.Next;
        end;
      finally
        dmBase.tbMens.CancelRange;
      end;

      PostDataSet(Dokument);

      ListDeti:=dbCreateListDeti;
      dmBase.GetDeti(ListDeti,DokumentMEN_ID.AsString,DokumentPOL.AsString,0,16,false,false);
      tbSem.EmptyTable;
      while not ListDeti.Eof do begin
        tbSem.Append;
        tbSemFAMILIA.AsString:=ListDeti.FieldByName('FAMILIA').AsString;
        tbSemNAME.AsString:=ListDeti.FieldByName('NAME').AsString;
        tbSemOTCH.AsString:=ListDeti.FieldByName('OTCH').AsString;
        tbSemPOL.AsString:=ListDeti.FieldByName('POL').AsString;
        tbSemOTNOSH.AsString:=ListDeti.FieldByName('OTNOSH').AsString;
        if not ListDeti.FieldByName('DATER').IsNull then begin
          tbSemDATER.AsDateTime:=ListDeti.FieldByName('DATER').AsDateTime;
        end;
        tbSem.Post;
        ListDeti.Next;
      end;
      dbClose(ListDeti);

      Screen.Cursor := old;
  end;
end;

procedure TfmDeclRegistr.SetRB_OnClick(Sender: TObject;
  var Handled: Boolean);
begin
  TDBLookupComboBoxEh(TWinControl(Sender).Parent).Value:=112;
  Handled:=true;
end;

procedure TfmDeclRegistr.SetRF_OnClick(Sender: TObject;
  var Handled: Boolean);
begin
  TDBLookupComboBoxEh(TWinControl(Sender).Parent).Value:=643;
  Handled:=true;
end;

procedure TfmDeclRegistr.SetU_OnClick(Sender: TObject; var Handled: Boolean);
begin
  TDBLookupComboBoxEh(TWinControl(Sender).Parent).Value:=804;
  Handled:=true;
end;

function TfmDeclRegistr.ProvDvig: Boolean;
begin
  Result := false;
end;

procedure TfmDeclRegistr.btAddSemClick(Sender: TObject);
begin
  EditMenDeclare(tbSem,true);
  edKolvo.Value:=tbSem.RecordCount+1;
end;

procedure TfmDeclRegistr.btEditSemClick(Sender: TObject);
begin
  if tbSem.RecordCount>0 then begin
    EditMenDeclare(tbSem,false);
  end;
end;

procedure TfmDeclRegistr.btDelSemClick(Sender: TObject);
begin
  if tbSem.RecordCount>0 then begin
    tbSem.Delete;
    edKolvo.Value:=tbSem.RecordCount+1;
  end;
end;

procedure TfmDeclRegistr.btAddSClick(Sender: TObject);
begin
  EditMenDeclare(tbSemSobst,true,'POL;');
end;

procedure TfmDeclRegistr.btEditSClick(Sender: TObject);
begin
  if tbSemSobst.RecordCount>0 then begin
    EditMenDeclare(tbSemSobst,false,'POL;');
  end;  
end;

procedure TfmDeclRegistr.btDelSClick(Sender: TObject);
begin
  if tbSemSobst.RecordCount>0 then begin
    tbSemSobst.Delete;
  end;
end;


procedure TfmDeclRegistr.dsSemDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field<>nil then begin
    QueryExit := true;
  end;
end;

procedure TfmDeclRegistr.TBItemPribClick(Sender: TObject);
var
  lSem,lErr:Boolean;
  nVozr,n:Integer;
begin
  DestroyHint(H);
  if not FEnableWrite then begin
    beep;
    exit;
  end;
  lErr:=false;
  if (ActiveControl=GridSem) and (tbSem.RecordCount>0) then begin
    lSem:=true;
    {
    if tbSemDATER.IsNull then begin
      nVozr:=99;
    end else begin
      nVozr:=GetCountYear(dmBase.GetCurDate,tbSemDATER.AsDateTime);
    end;
    if (nVozr<16) then begin
      lErr:=true;
      PutError('На ребенка не выписывается талон прибытия.');
    end;
    }
  end else begin
    lSem:=false;
  end;
  if not lErr then begin
    if WriteDok then begin
      CheckUserName_frxDataSet;
      n:=TalonPribFromDeclRegist(Self,lSem);
      UnCheckUserName_frxDataSet;
      if n>0 then begin
        FIDLastTalonPrib:=n;
        TBItemUbit.Enabled:=true;
      end;
    end;
  end;
end;

procedure TfmDeclRegistr.TBItemUbitClick(Sender: TObject);
begin
  if FIDLastTalonPrib>0 then begin
    CheckUserName_frxDataSet;
    TalonUbitFromTalonPrib(FIDLastTalonPrib);
    UnCheckUserName_frxDataSet;
  end;
end;

procedure TfmDeclRegistr.edRAION_RNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListRaion(Sender,NewText,RecheckInList);
end;

procedure TfmDeclRegistr.edOBL_RNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
  CheckListObl(Sender,NewText,RecheckInList);
end;

procedure TfmDeclRegistr.edPasp_OrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD,Trim(edPasp_Organ.Text));
 if s<>'' then begin
   edPasp_Organ.Text:=s;
 end;
end;

procedure TfmDeclRegistr.edOrganEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD,Trim(edOrgan.Text));
 if s<>'' then begin
   edOrgan.Text:=s;
 end;
end;

procedure TfmDeclRegistr.edOsnovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  TBItemShablonClick(Sender);
end;

procedure TfmDeclRegistr.edLichNomerUpdateData(Sender: TObject;  var Handled: Boolean);
var
  s:String;                      
begin
  if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
    if (edUdost.Field.AsInteger=PASP_GR_RB)  then begin
//      if edDateR.Field.IsNull or not GlobalTask.ParamAsBoolean('KI_DATER') then begin
      edLichNomer.text := CheckLichNom(true, edLichNomer.Text);
//      end else begin
//      edLichNomer.text := CheckLichNomEx(true, edLichNomer.Text, edDateR.Field.AsDateTime);
//      end;
      s:=GetErrorCheck;
      if s<>'' then begin
        PutError(s);
      end;
    end;
  end;
end;

procedure TfmDeclRegistr.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF USE_FR3}
    CreatefrxDBdataSet(self,tbSem,'Sem','Семья');
    CreatefrxDBdataSet(self,tbSemSobst,'SemSobst','Собственники');
  {$ENDIF}
end;

procedure TfmDeclRegistr.edUdostEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edUdost.ItemIndex:=-1;
  edPasp_Seria.Text:='';
  edPasp_Nomer.Text:='';
  edPasp_Organ.Text:='';
  edPasp_Date.Value:=null;
  edDateZ.Value:=null;
end;

procedure TfmDeclRegistr.edRukovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
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
      DokumentRUKOV.AsString:=GetValueField(arrRec, 'FIO');
      DokumentRUKOV_DOLG.AsString:=GetValueField(arrRec, 'POST');
      PostDataSet(Dokument);
    end;
  end;
end;

procedure TfmDeclRegistr.GridSemColumns0GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Params.Text<>'' then begin
    if dmBase.SprOtnosh.Locate('ID',Params.Text,[]) then begin
      Params.Text:=dmBase.SprOtnosh.FieldbyName('NAME').AsString;
    end;
  end;
end;

{
procedure TfmDeclRegistr.vchDBText1GetText(Sender: TObject;  var Text: String);
begin
  if (not DokumentDATE_SROK.IsNull) or (DokumentSROK.AsString<>'') then begin
    Text:='по месту пребывания';
  end else begin
    Text:='по месту жительства';
  end;
end;
}
procedure TfmDeclRegistr.edTypeRegUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if edTypeReg.ItemIndex>-1 then begin
    if StrToInt(edTypeReg.KeyItems[edTypeReg.ItemIndex])=MESTO_GIT then begin
      edDateSrok.Text:='';
    end;
  end
end; 
//------------------------------------------------------------------------------------------
procedure TfmDeclRegistr.Event_CheckA4(Sender: TObject);
begin
  itCheckA4.Checked:=not itCheckA4.Checked;
  GlobalTask.SetLastValueAsBoolean('DECL_REG_A4', itCheckA4.Checked);
end;
//------------------------------------------------------------------------------------------
function TfmDeclRegistr.CreateSubMenuRun: Boolean;
//var
// sep : TTbSeparatorItem;
begin
  inherited CreateSubmenuRun;
  Result:=true;
  itCheckA4:=TTbItem.Create(TBSubmenuRun);
  itCheckA4.Caption:='Печатная форма в формате А4';
  itCheckA4.OnClick:=Event_CheckA4;
  TBSubmenuRun.Add(itCheckA4);
end;
            
end.                   
